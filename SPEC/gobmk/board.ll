; ModuleID = 'board.c'
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
  %1 = alloca %struct.board_state*, align 8
  %k = alloca i32, align 4
  store %struct.board_state* %state, %struct.board_state** %1, align 8
  %2 = load i32* @stackp, align 4
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  br label %6

; <label>:5                                       ; preds = %0
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 327, i8* getelementptr inbounds ([12 x i8]* @.str1, i32 0, i32 0), i32 -1, i32 -1)
  br label %6

; <label>:6                                       ; preds = %5, %4
  %7 = load i32* @board_size, align 4
  %8 = load %struct.board_state** %1, align 8
  %9 = getelementptr inbounds %struct.board_state* %8, i32 0, i32 0
  store i32 %7, i32* %9, align 4
  %10 = load %struct.board_state** %1, align 8
  %11 = getelementptr inbounds %struct.board_state* %10, i32 0, i32 1
  %12 = bitcast [421 x i8]* %11 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %12, i8* getelementptr inbounds ([421 x i8]* @board, i32 0, i32 0), i64 421, i32 4, i1 false)
  %13 = load %struct.board_state** %1, align 8
  %14 = getelementptr inbounds %struct.board_state* %13, i32 0, i32 5
  %15 = bitcast [421 x i8]* %14 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %15, i8* getelementptr inbounds ([421 x i8]* @initial_board, i32 0, i32 0), i64 421, i32 4, i1 false)
  %16 = load i32* @board_ko_pos, align 4
  %17 = load %struct.board_state** %1, align 8
  %18 = getelementptr inbounds %struct.board_state* %17, i32 0, i32 2
  store i32 %16, i32* %18, align 4
  %19 = load i32* @white_captured, align 4
  %20 = load %struct.board_state** %1, align 8
  %21 = getelementptr inbounds %struct.board_state* %20, i32 0, i32 4
  store i32 %19, i32* %21, align 4
  %22 = load i32* @black_captured, align 4
  %23 = load %struct.board_state** %1, align 8
  %24 = getelementptr inbounds %struct.board_state* %23, i32 0, i32 3
  store i32 %22, i32* %24, align 4
  %25 = load i32* @initial_board_ko_pos, align 4
  %26 = load %struct.board_state** %1, align 8
  %27 = getelementptr inbounds %struct.board_state* %26, i32 0, i32 6
  store i32 %25, i32* %27, align 4
  %28 = load i32* @initial_white_captured, align 4
  %29 = load %struct.board_state** %1, align 8
  %30 = getelementptr inbounds %struct.board_state* %29, i32 0, i32 7
  store i32 %28, i32* %30, align 4
  %31 = load i32* @initial_black_captured, align 4
  %32 = load %struct.board_state** %1, align 8
  %33 = getelementptr inbounds %struct.board_state* %32, i32 0, i32 8
  store i32 %31, i32* %33, align 4
  %34 = load i32* @move_history_pointer, align 4
  %35 = load %struct.board_state** %1, align 8
  %36 = getelementptr inbounds %struct.board_state* %35, i32 0, i32 11
  store i32 %34, i32* %36, align 4
  store i32 0, i32* %k, align 4
  br label %37

; <label>:37                                      ; preds = %60, %6
  %38 = load i32* %k, align 4
  %39 = load i32* @move_history_pointer, align 4
  %40 = icmp slt i32 %38, %39
  br i1 %40, label %41, label %63

; <label>:41                                      ; preds = %37
  %42 = load i32* %k, align 4
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds [500 x i32]* @move_history_color, i32 0, i64 %43
  %45 = load i32* %44, align 4
  %46 = load i32* %k, align 4
  %47 = sext i32 %46 to i64
  %48 = load %struct.board_state** %1, align 8
  %49 = getelementptr inbounds %struct.board_state* %48, i32 0, i32 9
  %50 = getelementptr inbounds [500 x i32]* %49, i32 0, i64 %47
  store i32 %45, i32* %50, align 4
  %51 = load i32* %k, align 4
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds [500 x i32]* @move_history_pos, i32 0, i64 %52
  %54 = load i32* %53, align 4
  %55 = load i32* %k, align 4
  %56 = sext i32 %55 to i64
  %57 = load %struct.board_state** %1, align 8
  %58 = getelementptr inbounds %struct.board_state* %57, i32 0, i32 10
  %59 = getelementptr inbounds [500 x i32]* %58, i32 0, i64 %56
  store i32 %54, i32* %59, align 4
  br label %60

; <label>:60                                      ; preds = %41
  %61 = load i32* %k, align 4
  %62 = add nsw i32 %61, 1
  store i32 %62, i32* %k, align 4
  br label %37

; <label>:63                                      ; preds = %37
  %64 = load float* @komi, align 4
  %65 = load %struct.board_state** %1, align 8
  %66 = getelementptr inbounds %struct.board_state* %65, i32 0, i32 12
  store float %64, float* %66, align 4
  %67 = load i32* @movenum, align 4
  %68 = load %struct.board_state** %1, align 8
  %69 = getelementptr inbounds %struct.board_state* %68, i32 0, i32 13
  store i32 %67, i32* %69, align 4
  ret void
}

declare void @abortgo(i8*, i32, i8*, i32, i32) #1

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #2

; Function Attrs: nounwind uwtable
define void @restore_board(%struct.board_state* %state) #0 {
  %1 = alloca %struct.board_state*, align 8
  %k = alloca i32, align 4
  store %struct.board_state* %state, %struct.board_state** %1, align 8
  %2 = load i32* @stackp, align 4
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  br label %6

; <label>:5                                       ; preds = %0
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 362, i8* getelementptr inbounds ([12 x i8]* @.str1, i32 0, i32 0), i32 -1, i32 -1)
  br label %6

; <label>:6                                       ; preds = %5, %4
  %7 = load %struct.board_state** %1, align 8
  %8 = getelementptr inbounds %struct.board_state* %7, i32 0, i32 0
  %9 = load i32* %8, align 4
  store i32 %9, i32* @board_size, align 4
  %10 = load %struct.board_state** %1, align 8
  %11 = getelementptr inbounds %struct.board_state* %10, i32 0, i32 1
  %12 = bitcast [421 x i8]* %11 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* getelementptr inbounds ([421 x i8]* @board, i32 0, i32 0), i8* %12, i64 421, i32 4, i1 false)
  %13 = load %struct.board_state** %1, align 8
  %14 = getelementptr inbounds %struct.board_state* %13, i32 0, i32 5
  %15 = bitcast [421 x i8]* %14 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* getelementptr inbounds ([421 x i8]* @initial_board, i32 0, i32 0), i8* %15, i64 421, i32 4, i1 false)
  %16 = load %struct.board_state** %1, align 8
  %17 = getelementptr inbounds %struct.board_state* %16, i32 0, i32 2
  %18 = load i32* %17, align 4
  store i32 %18, i32* @board_ko_pos, align 4
  %19 = load %struct.board_state** %1, align 8
  %20 = getelementptr inbounds %struct.board_state* %19, i32 0, i32 4
  %21 = load i32* %20, align 4
  store i32 %21, i32* @white_captured, align 4
  %22 = load %struct.board_state** %1, align 8
  %23 = getelementptr inbounds %struct.board_state* %22, i32 0, i32 3
  %24 = load i32* %23, align 4
  store i32 %24, i32* @black_captured, align 4
  %25 = load %struct.board_state** %1, align 8
  %26 = getelementptr inbounds %struct.board_state* %25, i32 0, i32 6
  %27 = load i32* %26, align 4
  store i32 %27, i32* @initial_board_ko_pos, align 4
  %28 = load %struct.board_state** %1, align 8
  %29 = getelementptr inbounds %struct.board_state* %28, i32 0, i32 7
  %30 = load i32* %29, align 4
  store i32 %30, i32* @initial_white_captured, align 4
  %31 = load %struct.board_state** %1, align 8
  %32 = getelementptr inbounds %struct.board_state* %31, i32 0, i32 8
  %33 = load i32* %32, align 4
  store i32 %33, i32* @initial_black_captured, align 4
  %34 = load %struct.board_state** %1, align 8
  %35 = getelementptr inbounds %struct.board_state* %34, i32 0, i32 11
  %36 = load i32* %35, align 4
  store i32 %36, i32* @move_history_pointer, align 4
  store i32 0, i32* %k, align 4
  br label %37

; <label>:37                                      ; preds = %60, %6
  %38 = load i32* %k, align 4
  %39 = load i32* @move_history_pointer, align 4
  %40 = icmp slt i32 %38, %39
  br i1 %40, label %41, label %63

; <label>:41                                      ; preds = %37
  %42 = load i32* %k, align 4
  %43 = sext i32 %42 to i64
  %44 = load %struct.board_state** %1, align 8
  %45 = getelementptr inbounds %struct.board_state* %44, i32 0, i32 9
  %46 = getelementptr inbounds [500 x i32]* %45, i32 0, i64 %43
  %47 = load i32* %46, align 4
  %48 = load i32* %k, align 4
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds [500 x i32]* @move_history_color, i32 0, i64 %49
  store i32 %47, i32* %50, align 4
  %51 = load i32* %k, align 4
  %52 = sext i32 %51 to i64
  %53 = load %struct.board_state** %1, align 8
  %54 = getelementptr inbounds %struct.board_state* %53, i32 0, i32 10
  %55 = getelementptr inbounds [500 x i32]* %54, i32 0, i64 %52
  %56 = load i32* %55, align 4
  %57 = load i32* %k, align 4
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds [500 x i32]* @move_history_pos, i32 0, i64 %58
  store i32 %56, i32* %59, align 4
  br label %60

; <label>:60                                      ; preds = %41
  %61 = load i32* %k, align 4
  %62 = add nsw i32 %61, 1
  store i32 %62, i32* %k, align 4
  br label %37

; <label>:63                                      ; preds = %37
  %64 = load %struct.board_state** %1, align 8
  %65 = getelementptr inbounds %struct.board_state* %64, i32 0, i32 12
  %66 = load float* %65, align 4
  store float %66, float* @komi, align 4
  %67 = load %struct.board_state** %1, align 8
  %68 = getelementptr inbounds %struct.board_state* %67, i32 0, i32 13
  %69 = load i32* %68, align 4
  store i32 %69, i32* @movenum, align 4
  %70 = load i32* @board_ko_pos, align 4
  call void @hashdata_recalc(%struct.Hash_data* @hashdata, i8* getelementptr inbounds ([421 x i8]* @board, i32 0, i32 0), i32 %70)
  call void @new_position()
  ret void
}

declare void @hashdata_recalc(%struct.Hash_data*, i8*, i32) #1

; Function Attrs: nounwind uwtable
define internal void @new_position() #0 {
  %pos = alloca i32, align 4
  %s = alloca i32, align 4
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
  store i32 21, i32* %pos, align 4
  br label %3

; <label>:3                                       ; preds = %18, %0
  %4 = load i32* %pos, align 4
  %5 = icmp slt i32 %4, 400
  br i1 %5, label %6, label %21

; <label>:6                                       ; preds = %3
  %7 = load i32* %pos, align 4
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %8
  %10 = load i8* %9, align 1
  %11 = zext i8 %10 to i32
  %12 = icmp ne i32 %11, 3
  br i1 %12, label %13, label %17

; <label>:13                                      ; preds = %6
  %14 = load i32* %pos, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %15
  store i32 -1, i32* %16, align 4
  br label %17

; <label>:17                                      ; preds = %13, %6
  br label %18

; <label>:18                                      ; preds = %17
  %19 = load i32* %pos, align 4
  %20 = add nsw i32 %19, 1
  store i32 %20, i32* %pos, align 4
  br label %3

; <label>:21                                      ; preds = %3
  store i32 21, i32* %pos, align 4
  br label %22

; <label>:22                                      ; preds = %86, %21
  %23 = load i32* %pos, align 4
  %24 = icmp slt i32 %23, 400
  br i1 %24, label %25, label %89

; <label>:25                                      ; preds = %22
  %26 = load i32* %pos, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %27
  %29 = load i8* %28, align 1
  %30 = zext i8 %29 to i32
  %31 = icmp ne i32 %30, 3
  br i1 %31, label %33, label %32

; <label>:32                                      ; preds = %25
  br label %86

; <label>:33                                      ; preds = %25
  %34 = load i32* %pos, align 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %35
  %37 = load i8* %36, align 1
  %38 = zext i8 %37 to i32
  %39 = icmp eq i32 %38, 1
  br i1 %39, label %47, label %40

; <label>:40                                      ; preds = %33
  %41 = load i32* %pos, align 4
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %42
  %44 = load i8* %43, align 1
  %45 = zext i8 %44 to i32
  %46 = icmp eq i32 %45, 2
  br i1 %46, label %47, label %85

; <label>:47                                      ; preds = %40, %33
  %48 = load i32* %pos, align 4
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %49
  %51 = load i32* %50, align 4
  %52 = icmp eq i32 %51, -1
  br i1 %52, label %53, label %85

; <label>:53                                      ; preds = %47
  %54 = load i32* @next_string, align 4
  %55 = load i32* %pos, align 4
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %56
  store i32 %54, i32* %57, align 4
  %58 = load i32* %pos, align 4
  %59 = load i32* %pos, align 4
  %60 = call i32 @propagate_string(i32 %58, i32 %59)
  %61 = load i32* @next_string, align 4
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %62
  %64 = getelementptr inbounds %struct.string_data* %63, i32 0, i32 1
  store i32 %60, i32* %64, align 4
  %65 = load i32* %pos, align 4
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %66
  %68 = load i8* %67, align 1
  %69 = zext i8 %68 to i32
  %70 = load i32* @next_string, align 4
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %71
  %73 = getelementptr inbounds %struct.string_data* %72, i32 0, i32 0
  store i32 %69, i32* %73, align 4
  %74 = load i32* %pos, align 4
  %75 = load i32* @next_string, align 4
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %76
  %78 = getelementptr inbounds %struct.string_data* %77, i32 0, i32 2
  store i32 %74, i32* %78, align 4
  %79 = load i32* @next_string, align 4
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %80
  %82 = getelementptr inbounds %struct.string_data* %81, i32 0, i32 7
  store i32 0, i32* %82, align 4
  %83 = load i32* @next_string, align 4
  %84 = add nsw i32 %83, 1
  store i32 %84, i32* @next_string, align 4
  br label %85

; <label>:85                                      ; preds = %53, %47, %40
  br label %86

; <label>:86                                      ; preds = %85, %32
  %87 = load i32* %pos, align 4
  %88 = add nsw i32 %87, 1
  store i32 %88, i32* %pos, align 4
  br label %22

; <label>:89                                      ; preds = %22
  store i32 0, i32* %s, align 4
  br label %90

; <label>:90                                      ; preds = %96, %89
  %91 = load i32* %s, align 4
  %92 = load i32* @next_string, align 4
  %93 = icmp slt i32 %91, %92
  br i1 %93, label %94, label %99

; <label>:94                                      ; preds = %90
  %95 = load i32* %s, align 4
  call void @find_liberties_and_neighbors(i32 %95)
  br label %96

; <label>:96                                      ; preds = %94
  %97 = load i32* %s, align 4
  %98 = add nsw i32 %97, 1
  store i32 %98, i32* %s, align 4
  br label %90

; <label>:99                                      ; preds = %90
  ret void
}

; Function Attrs: nounwind uwtable
define void @clear_board() #0 {
  %k = alloca i32, align 4
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
  store i32 0, i32* %k, align 4
  br label %9

; <label>:9                                       ; preds = %32, %8
  %10 = load i32* %k, align 4
  %11 = icmp slt i32 %10, 421
  br i1 %11, label %12, label %35

; <label>:12                                      ; preds = %9
  %13 = load i32* %k, align 4
  %14 = sdiv i32 %13, 20
  %15 = sub nsw i32 %14, 1
  %16 = load i32* @board_size, align 4
  %17 = icmp ult i32 %15, %16
  br i1 %17, label %18, label %24

; <label>:18                                      ; preds = %12
  %19 = load i32* %k, align 4
  %20 = srem i32 %19, 20
  %21 = sub nsw i32 %20, 1
  %22 = load i32* @board_size, align 4
  %23 = icmp ult i32 %21, %22
  br i1 %23, label %31, label %24

; <label>:24                                      ; preds = %18, %12
  %25 = load i32* %k, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %26
  store i8 3, i8* %27, align 1
  %28 = load i32* %k, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds [421 x i8]* @initial_board, i32 0, i64 %29
  store i8 3, i8* %30, align 1
  br label %31

; <label>:31                                      ; preds = %24, %18
  br label %32

; <label>:32                                      ; preds = %31
  %33 = load i32* %k, align 4
  %34 = add nsw i32 %33, 1
  store i32 %34, i32* %k, align 4
  br label %9

; <label>:35                                      ; preds = %9
  store i32 0, i32* @board_ko_pos, align 4
  store i32 0, i32* @white_captured, align 4
  store i32 0, i32* @black_captured, align 4
  store i32 0, i32* @initial_board_ko_pos, align 4
  store i32 0, i32* @initial_white_captured, align 4
  store i32 0, i32* @initial_black_captured, align 4
  store i32 0, i32* @move_history_pointer, align 4
  store i32 0, i32* @movenum, align 4
  %36 = load i32* @board_ko_pos, align 4
  call void @hashdata_recalc(%struct.Hash_data* @hashdata, i8* getelementptr inbounds ([421 x i8]* @board, i32 0, i32 0), i32 %36)
  call void @new_position()
  ret void
}

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #2

; Function Attrs: nounwind uwtable
define i32 @test_gray_border() #0 {
  %1 = alloca i32, align 4
  %k = alloca i32, align 4
  %2 = load i32* @board_size, align 4
  %3 = icmp sgt i32 %2, 0
  br i1 %3, label %4, label %8

; <label>:4                                       ; preds = %0
  %5 = load i32* @board_size, align 4
  %6 = icmp sle i32 %5, 19
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %4
  br label %9

; <label>:8                                       ; preds = %4, %0
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 432, i8* getelementptr inbounds ([35 x i8]* @.str2, i32 0, i32 0), i32 -1, i32 -1)
  br label %9

; <label>:9                                       ; preds = %8, %7
  store i32 0, i32* %k, align 4
  br label %10

; <label>:10                                      ; preds = %36, %9
  %11 = load i32* %k, align 4
  %12 = icmp slt i32 %11, 421
  br i1 %12, label %13, label %39

; <label>:13                                      ; preds = %10
  %14 = load i32* %k, align 4
  %15 = sdiv i32 %14, 20
  %16 = sub nsw i32 %15, 1
  %17 = load i32* @board_size, align 4
  %18 = icmp ult i32 %16, %17
  br i1 %18, label %19, label %25

; <label>:19                                      ; preds = %13
  %20 = load i32* %k, align 4
  %21 = srem i32 %20, 20
  %22 = sub nsw i32 %21, 1
  %23 = load i32* @board_size, align 4
  %24 = icmp ult i32 %22, %23
  br i1 %24, label %35, label %25

; <label>:25                                      ; preds = %19, %13
  %26 = load i32* %k, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %27
  %29 = load i8* %28, align 1
  %30 = zext i8 %29 to i32
  %31 = icmp ne i32 %30, 3
  br i1 %31, label %32, label %34

; <label>:32                                      ; preds = %25
  %33 = load i32* %k, align 4
  store i32 %33, i32* %1
  br label %40

; <label>:34                                      ; preds = %25
  br label %35

; <label>:35                                      ; preds = %34, %19
  br label %36

; <label>:36                                      ; preds = %35
  %37 = load i32* %k, align 4
  %38 = add nsw i32 %37, 1
  store i32 %38, i32* %k, align 4
  br label %10

; <label>:39                                      ; preds = %10
  store i32 -1, i32* %1
  br label %40

; <label>:40                                      ; preds = %39, %32
  %41 = load i32* %1
  ret i32 %41
}

; Function Attrs: nounwind uwtable
define i32 @trymove(i32 %pos, i32 %color, i8* %message, i32 %str, i32 %komaster, i32 %kom_pos) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %buf = alloca [100 x i8], align 16
  store i32 %pos, i32* %2, align 4
  store i32 %color, i32* %3, align 4
  store i8* %message, i8** %4, align 8
  store i32 %str, i32* %5, align 4
  store i32 %komaster, i32* %6, align 4
  store i32 %kom_pos, i32* %7, align 4
  %8 = load i32* %2, align 4
  %9 = load i32* %3, align 4
  %10 = call i32 @do_trymove(i32 %8, i32 %9, i32 0)
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %13, label %12

; <label>:12                                      ; preds = %0
  store i32 0, i32* %1
  br label %83

; <label>:13                                      ; preds = %0
  %14 = load %struct.SGFTree_t** @sgf_dumptree, align 8
  %15 = icmp ne %struct.SGFTree_t* %14, null
  br i1 %15, label %16, label %74

; <label>:16                                      ; preds = %13
  %17 = load i8** %4, align 8
  %18 = icmp eq i8* %17, null
  br i1 %18, label %19, label %20

; <label>:19                                      ; preds = %16
  store i8* getelementptr inbounds ([8 x i8]* @.str3, i32 0, i32 0), i8** %4, align 8
  br label %20

; <label>:20                                      ; preds = %19, %16
  %21 = load i32* %5, align 4
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %23, label %41

; <label>:23                                      ; preds = %20
  %24 = load i32* %6, align 4
  %25 = icmp ne i32 %24, 0
  br i1 %25, label %26, label %35

; <label>:26                                      ; preds = %23
  %27 = getelementptr inbounds [100 x i8]* %buf, i32 0, i32 0
  %28 = load i8** %4, align 8
  %29 = load i32* @count_variations, align 4
  %30 = load i64* getelementptr inbounds (%struct.Hash_data* @hashdata, i32 0, i32 0, i64 0), align 8
  %31 = load i32* %6, align 4
  %32 = call i8* @komaster_to_string(i32 %31)
  %33 = load i32* %7, align 4
  %34 = call i8* @location_to_string(i32 %33)
  call void (i8*, i64, i8*, ...)* @gg_snprintf(i8* %27, i64 100, i8* getelementptr inbounds ([44 x i8]* @.str4, i32 0, i32 0), i8* %28, i32 %29, i64 %30, i8* %32, i8* %34)
  br label %40

; <label>:35                                      ; preds = %23
  %36 = getelementptr inbounds [100 x i8]* %buf, i32 0, i32 0
  %37 = load i8** %4, align 8
  %38 = load i32* @count_variations, align 4
  %39 = load i64* getelementptr inbounds (%struct.Hash_data* @hashdata, i32 0, i32 0, i64 0), align 8
  call void (i8*, i64, i8*, ...)* @gg_snprintf(i8* %36, i64 100, i8* getelementptr inbounds ([28 x i8]* @.str5, i32 0, i32 0), i8* %37, i32 %38, i64 %39)
  br label %40

; <label>:40                                      ; preds = %35, %26
  br label %63

; <label>:41                                      ; preds = %20
  %42 = load i32* %6, align 4
  %43 = icmp ne i32 %42, 0
  br i1 %43, label %44, label %55

; <label>:44                                      ; preds = %41
  %45 = getelementptr inbounds [100 x i8]* %buf, i32 0, i32 0
  %46 = load i8** %4, align 8
  %47 = load i32* %5, align 4
  %48 = call i8* @location_to_string(i32 %47)
  %49 = load i32* @count_variations, align 4
  %50 = load i64* getelementptr inbounds (%struct.Hash_data* @hashdata, i32 0, i32 0, i64 0), align 8
  %51 = load i32* %6, align 4
  %52 = call i8* @komaster_to_string(i32 %51)
  %53 = load i32* %7, align 4
  %54 = call i8* @location_to_string(i32 %53)
  call void (i8*, i64, i8*, ...)* @gg_snprintf(i8* %45, i64 100, i8* getelementptr inbounds ([50 x i8]* @.str6, i32 0, i32 0), i8* %46, i8* %48, i32 %49, i64 %50, i8* %52, i8* %54)
  br label %62

; <label>:55                                      ; preds = %41
  %56 = getelementptr inbounds [100 x i8]* %buf, i32 0, i32 0
  %57 = load i8** %4, align 8
  %58 = load i32* %5, align 4
  %59 = call i8* @location_to_string(i32 %58)
  %60 = load i32* @count_variations, align 4
  %61 = load i64* getelementptr inbounds (%struct.Hash_data* @hashdata, i32 0, i32 0, i64 0), align 8
  call void (i8*, i64, i8*, ...)* @gg_snprintf(i8* %56, i64 100, i8* getelementptr inbounds ([34 x i8]* @.str7, i32 0, i32 0), i8* %57, i8* %59, i32 %60, i64 %61)
  br label %62

; <label>:62                                      ; preds = %55, %44
  br label %63

; <label>:63                                      ; preds = %62, %40
  %64 = load %struct.SGFTree_t** @sgf_dumptree, align 8
  %65 = load i32* %3, align 4
  %66 = load i32* %2, align 4
  %67 = sdiv i32 %66, 20
  %68 = sub nsw i32 %67, 1
  %69 = load i32* %2, align 4
  %70 = srem i32 %69, 20
  %71 = sub nsw i32 %70, 1
  call void @sgftreeAddPlayLast(%struct.SGFTree_t* %64, i32 %65, i32 %68, i32 %71)
  %72 = load %struct.SGFTree_t** @sgf_dumptree, align 8
  %73 = getelementptr inbounds [100 x i8]* %buf, i32 0, i32 0
  call void @sgftreeAddComment(%struct.SGFTree_t* %72, i8* %73)
  br label %74

; <label>:74                                      ; preds = %63, %13
  %75 = load i32* @count_variations, align 4
  %76 = icmp ne i32 %75, 0
  br i1 %76, label %77, label %80

; <label>:77                                      ; preds = %74
  %78 = load i32* @count_variations, align 4
  %79 = add nsw i32 %78, 1
  store i32 %79, i32* @count_variations, align 4
  br label %80

; <label>:80                                      ; preds = %77, %74
  %81 = load i32* getelementptr inbounds (%struct.stats_data* @stats, i32 0, i32 0), align 4
  %82 = add nsw i32 %81, 1
  store i32 %82, i32* getelementptr inbounds (%struct.stats_data* @stats, i32 0, i32 0), align 4
  store i32 1, i32* %1
  br label %83

; <label>:83                                      ; preds = %80, %12
  %84 = load i32* %1
  ret i32 %84
}

; Function Attrs: nounwind uwtable
define internal i32 @do_trymove(i32 %pos, i32 %color, i32 %ignore_ko) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %pos, i32* %2, align 4
  store i32 %color, i32* %3, align 4
  store i32 %ignore_ko, i32* %4, align 4
  %5 = load i32* %2, align 4
  %6 = icmp ult i32 %5, 421
  br i1 %6, label %7, label %15

; <label>:7                                       ; preds = %0
  %8 = load i32* %2, align 4
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %9
  %11 = load i8* %10, align 1
  %12 = zext i8 %11 to i32
  %13 = icmp ne i32 %12, 3
  br i1 %13, label %14, label %15

; <label>:14                                      ; preds = %7
  br label %22

; <label>:15                                      ; preds = %7, %0
  %16 = load i32* %2, align 4
  %17 = sdiv i32 %16, 20
  %18 = sub nsw i32 %17, 1
  %19 = load i32* %2, align 4
  %20 = srem i32 %19, 20
  %21 = sub nsw i32 %20, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 646, i8* getelementptr inbounds ([15 x i8]* @.str19, i32 0, i32 0), i32 %18, i32 %21)
  br label %22

; <label>:22                                      ; preds = %15, %14
  %23 = load i32* %3, align 4
  %24 = icmp eq i32 %23, 2
  br i1 %24, label %28, label %25

; <label>:25                                      ; preds = %22
  %26 = load i32* %3, align 4
  %27 = icmp eq i32 %26, 1
  br i1 %27, label %28, label %29

; <label>:28                                      ; preds = %25, %22
  br label %30

; <label>:29                                      ; preds = %25
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 647, i8* getelementptr inbounds ([25 x i8]* @.str39, i32 0, i32 0), i32 -1, i32 -1)
  br label %30

; <label>:30                                      ; preds = %29, %28
  %31 = load i32* %2, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds [400 x i8]* @shadow, i32 0, i64 %32
  store i8 1, i8* %33, align 1
  %34 = load i32* %2, align 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %35
  %37 = load i8* %36, align 1
  %38 = zext i8 %37 to i32
  %39 = icmp ne i32 %38, 0
  br i1 %39, label %40, label %41

; <label>:40                                      ; preds = %30
  store i32 0, i32* %1
  br label %142

; <label>:41                                      ; preds = %30
  %42 = load i32* %4, align 4
  %43 = icmp ne i32 %42, 0
  br i1 %43, label %70, label %44

; <label>:44                                      ; preds = %41
  %45 = load i32* %2, align 4
  %46 = load i32* @board_ko_pos, align 4
  %47 = icmp eq i32 %45, %46
  br i1 %47, label %48, label %70

; <label>:48                                      ; preds = %44
  %49 = load i32* %2, align 4
  %50 = sub nsw i32 %49, 1
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %51
  %53 = load i8* %52, align 1
  %54 = zext i8 %53 to i32
  %55 = load i32* %3, align 4
  %56 = sub nsw i32 3, %55
  %57 = icmp eq i32 %54, %56
  br i1 %57, label %68, label %58

; <label>:58                                      ; preds = %48
  %59 = load i32* %2, align 4
  %60 = add nsw i32 %59, 1
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %61
  %63 = load i8* %62, align 1
  %64 = zext i8 %63 to i32
  %65 = load i32* %3, align 4
  %66 = sub nsw i32 3, %65
  %67 = icmp eq i32 %64, %66
  br i1 %67, label %68, label %69

; <label>:68                                      ; preds = %58, %48
  store i32 0, i32* %1
  br label %142

; <label>:69                                      ; preds = %58
  br label %70

; <label>:70                                      ; preds = %69, %44, %41
  %71 = load i32* %2, align 4
  %72 = load i32* %3, align 4
  %73 = call i32 @is_suicide(i32 %71, i32 %72)
  %74 = icmp ne i32 %73, 0
  br i1 %74, label %75, label %76

; <label>:75                                      ; preds = %70
  store i32 0, i32* %1
  br label %142

; <label>:76                                      ; preds = %70
  %77 = load i32* @stackp, align 4
  %78 = icmp sge i32 %77, 359
  br i1 %78, label %79, label %90

; <label>:79                                      ; preds = %76
  %80 = load %struct._IO_FILE** @stderr, align 8
  %81 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %80, i8* getelementptr inbounds ([62 x i8]* @.str25, i32 0, i32 0))
  %82 = load i32* @verbose, align 4
  %83 = icmp sgt i32 %82, 0
  br i1 %83, label %84, label %85

; <label>:84                                      ; preds = %79
  call void @showboard(i32 0)
  call void @dump_stack()
  br label %85

; <label>:85                                      ; preds = %84, %79
  %86 = load %struct._IO_FILE** @stdout, align 8
  %87 = call i32 @fflush(%struct._IO_FILE* %86)
  %88 = load %struct._IO_FILE** @stderr, align 8
  %89 = call i32 @fflush(%struct._IO_FILE* %88)
  store i32 0, i32* %1
  br label %142

; <label>:90                                      ; preds = %76
  %91 = load i32* @trymove_counter, align 4
  %92 = add nsw i32 %91, 1
  store i32 %92, i32* @trymove_counter, align 4
  %93 = load i32* %2, align 4
  %94 = load i32* @stackp, align 4
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds [361 x i32]* @stack, i32 0, i64 %95
  store i32 %93, i32* %96, align 4
  %97 = load i32* %3, align 4
  %98 = load i32* @stackp, align 4
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds [361 x i32]* @move_color, i32 0, i64 %99
  store i32 %97, i32* %100, align 4
  %101 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %102 = getelementptr inbounds %struct.change_stack_entry* %101, i32 1
  store %struct.change_stack_entry* %102, %struct.change_stack_entry** @change_stack_pointer, align 8
  %103 = getelementptr inbounds %struct.change_stack_entry* %101, i32 0, i32 0
  store i32* null, i32** %103, align 8
  %104 = load %struct.vertex_stack_entry** @vertex_stack_pointer, align 8
  %105 = getelementptr inbounds %struct.vertex_stack_entry* %104, i32 1
  store %struct.vertex_stack_entry* %105, %struct.vertex_stack_entry** @vertex_stack_pointer, align 8
  %106 = getelementptr inbounds %struct.vertex_stack_entry* %104, i32 0, i32 0
  store i8* null, i8** %106, align 8
  %107 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %108 = getelementptr inbounds %struct.change_stack_entry* %107, i32 0, i32 0
  store i32* @board_ko_pos, i32** %108, align 8
  %109 = load i32* @board_ko_pos, align 4
  %110 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %111 = getelementptr inbounds %struct.change_stack_entry* %110, i32 1
  store %struct.change_stack_entry* %111, %struct.change_stack_entry** @change_stack_pointer, align 8
  %112 = getelementptr inbounds %struct.change_stack_entry* %110, i32 0, i32 1
  store i32 %109, i32* %112, align 4
  %113 = load i32* @stackp, align 4
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds [361 x %struct.Hash_data]* @hashdata_stack, i32 0, i64 %114
  %116 = bitcast %struct.Hash_data* %115 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %116, i8* bitcast (%struct.Hash_data* @hashdata to i8*), i64 8, i32 8, i1 false)
  %117 = load i32* @board_ko_pos, align 4
  %118 = icmp ne i32 %117, 0
  br i1 %118, label %119, label %121

; <label>:119                                     ; preds = %90
  %120 = load i32* @board_ko_pos, align 4
  call void @hashdata_invert_ko(%struct.Hash_data* @hashdata, i32 %120)
  br label %121

; <label>:121                                     ; preds = %119, %90
  store i32 0, i32* @board_ko_pos, align 4
  %122 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %123 = getelementptr inbounds %struct.change_stack_entry* %122, i32 0, i32 0
  store i32* @black_captured, i32** %123, align 8
  %124 = load i32* @black_captured, align 4
  %125 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %126 = getelementptr inbounds %struct.change_stack_entry* %125, i32 1
  store %struct.change_stack_entry* %126, %struct.change_stack_entry** @change_stack_pointer, align 8
  %127 = getelementptr inbounds %struct.change_stack_entry* %125, i32 0, i32 1
  store i32 %124, i32* %127, align 4
  %128 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %129 = getelementptr inbounds %struct.change_stack_entry* %128, i32 0, i32 0
  store i32* @white_captured, i32** %129, align 8
  %130 = load i32* @white_captured, align 4
  %131 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %132 = getelementptr inbounds %struct.change_stack_entry* %131, i32 1
  store %struct.change_stack_entry* %132, %struct.change_stack_entry** @change_stack_pointer, align 8
  %133 = getelementptr inbounds %struct.change_stack_entry* %131, i32 0, i32 1
  store i32 %130, i32* %133, align 4
  %134 = load i32* @stackp, align 4
  %135 = add nsw i32 %134, 1
  store i32 %135, i32* @stackp, align 4
  %136 = load i32* @verbose, align 4
  %137 = icmp eq i32 %136, 4
  br i1 %137, label %138, label %139

; <label>:138                                     ; preds = %121
  call void @dump_stack()
  br label %139

; <label>:139                                     ; preds = %138, %121
  %140 = load i32* %2, align 4
  %141 = load i32* %3, align 4
  call void @do_play_move(i32 %140, i32 %141)
  store i32 1, i32* %1
  br label %142

; <label>:142                                     ; preds = %139, %85, %75, %68, %40
  %143 = load i32* %1
  ret i32 %143
}

declare void @gg_snprintf(i8*, i64, i8*, ...) #1

; Function Attrs: nounwind uwtable
define internal i8* @komaster_to_string(i32 %komaster) #0 {
  %1 = alloca i32, align 4
  %b = alloca [7 x i8*], align 16
  store i32 %komaster, i32* %1, align 4
  %2 = bitcast [7 x i8*]* %b to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* bitcast ([7 x i8*]* @komaster_to_string.b to i8*), i64 56, i32 16, i1 false)
  %3 = load i32* %1, align 4
  %4 = icmp sge i32 %3, 0
  br i1 %4, label %5, label %9

; <label>:5                                       ; preds = %0
  %6 = load i32* %1, align 4
  %7 = icmp sle i32 %6, 6
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %5
  br label %10

; <label>:9                                       ; preds = %5, %0
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 462, i8* getelementptr inbounds ([31 x i8]* @.str47, i32 0, i32 0), i32 -1, i32 -1)
  br label %10

; <label>:10                                      ; preds = %9, %8
  %11 = load i32* %1, align 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [7 x i8*]* %b, i32 0, i64 %12
  %14 = load i8** %13, align 8
  ret i8* %14
}

declare i8* @location_to_string(i32) #1

declare void @sgftreeAddPlayLast(%struct.SGFTree_t*, i32, i32, i32) #1

declare void @sgftreeAddComment(%struct.SGFTree_t*, i8*) #1

; Function Attrs: nounwind uwtable
define i32 @semeai_trymove(i32 %pos, i32 %color, i8* %message, i32 %str1, i32 %str2, i32 %owl_phase, i32 %value) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %buf = alloca [100 x i8], align 16
  %sbuf1 = alloca [5 x i8], align 1
  %sbuf2 = alloca [5 x i8], align 1
  store i32 %pos, i32* %2, align 4
  store i32 %color, i32* %3, align 4
  store i8* %message, i8** %4, align 8
  store i32 %str1, i32* %5, align 4
  store i32 %str2, i32* %6, align 4
  store i32 %owl_phase, i32* %7, align 4
  store i32 %value, i32* %8, align 4
  %9 = load i32* %2, align 4
  %10 = load i32* %3, align 4
  %11 = call i32 @do_trymove(i32 %9, i32 %10, i32 0)
  %12 = icmp ne i32 %11, 0
  br i1 %12, label %14, label %13

; <label>:13                                      ; preds = %0
  store i32 0, i32* %1
  br label %62

; <label>:14                                      ; preds = %0
  %15 = load i8** %4, align 8
  %16 = icmp eq i8* %15, null
  br i1 %16, label %17, label %18

; <label>:17                                      ; preds = %14
  store i8* getelementptr inbounds ([8 x i8]* @.str3, i32 0, i32 0), i8** %4, align 8
  br label %18

; <label>:18                                      ; preds = %17, %14
  %19 = load %struct.SGFTree_t** @sgf_dumptree, align 8
  %20 = icmp ne %struct.SGFTree_t* %19, null
  br i1 %20, label %21, label %53

; <label>:21                                      ; preds = %18
  %22 = load i32* %5, align 4
  %23 = getelementptr inbounds [5 x i8]* %sbuf1, i32 0, i32 0
  call void @location_to_buffer(i32 %22, i8* %23)
  %24 = load i32* %6, align 4
  %25 = getelementptr inbounds [5 x i8]* %sbuf2, i32 0, i32 0
  call void @location_to_buffer(i32 %24, i8* %25)
  %26 = load i32* %7, align 4
  %27 = icmp ne i32 %26, 0
  br i1 %27, label %28, label %35

; <label>:28                                      ; preds = %21
  %29 = getelementptr inbounds [100 x i8]* %buf, i32 0, i32 0
  %30 = load i8** %4, align 8
  %31 = getelementptr inbounds [5 x i8]* %sbuf1, i32 0, i32 0
  %32 = getelementptr inbounds [5 x i8]* %sbuf2, i32 0, i32 0
  %33 = load i32* @count_variations, align 4
  %34 = load i32* %8, align 4
  call void (i8*, i64, i8*, ...)* @gg_snprintf(i8* %29, i64 100, i8* getelementptr inbounds ([55 x i8]* @.str8, i32 0, i32 0), i8* %30, i8* %31, i8* %32, i32 %33, i32 %34)
  br label %42

; <label>:35                                      ; preds = %21
  %36 = getelementptr inbounds [100 x i8]* %buf, i32 0, i32 0
  %37 = load i8** %4, align 8
  %38 = getelementptr inbounds [5 x i8]* %sbuf1, i32 0, i32 0
  %39 = getelementptr inbounds [5 x i8]* %sbuf2, i32 0, i32 0
  %40 = load i32* @count_variations, align 4
  %41 = load i32* %8, align 4
  call void (i8*, i64, i8*, ...)* @gg_snprintf(i8* %36, i64 100, i8* %37, i8* %38, i8* %39, i32 %40, i32 %41)
  br label %42

; <label>:42                                      ; preds = %35, %28
  %43 = load %struct.SGFTree_t** @sgf_dumptree, align 8
  %44 = load i32* %3, align 4
  %45 = load i32* %2, align 4
  %46 = sdiv i32 %45, 20
  %47 = sub nsw i32 %46, 1
  %48 = load i32* %2, align 4
  %49 = srem i32 %48, 20
  %50 = sub nsw i32 %49, 1
  call void @sgftreeAddPlayLast(%struct.SGFTree_t* %43, i32 %44, i32 %47, i32 %50)
  %51 = load %struct.SGFTree_t** @sgf_dumptree, align 8
  %52 = getelementptr inbounds [100 x i8]* %buf, i32 0, i32 0
  call void @sgftreeAddComment(%struct.SGFTree_t* %51, i8* %52)
  br label %53

; <label>:53                                      ; preds = %42, %18
  %54 = load i32* @count_variations, align 4
  %55 = icmp ne i32 %54, 0
  br i1 %55, label %56, label %59

; <label>:56                                      ; preds = %53
  %57 = load i32* @count_variations, align 4
  %58 = add nsw i32 %57, 1
  store i32 %58, i32* @count_variations, align 4
  br label %59

; <label>:59                                      ; preds = %56, %53
  %60 = load i32* getelementptr inbounds (%struct.stats_data* @stats, i32 0, i32 0), align 4
  %61 = add nsw i32 %60, 1
  store i32 %61, i32* getelementptr inbounds (%struct.stats_data* @stats, i32 0, i32 0), align 4
  store i32 1, i32* %1
  br label %62

; <label>:62                                      ; preds = %59, %13
  %63 = load i32* %1
  ret i32 %63
}

declare void @location_to_buffer(i32, i8*) #1

; Function Attrs: nounwind uwtable
define i32 @tryko(i32 %pos, i32 %color, i8* %message, i32 %komaster, i32 %kom_pos) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %buf = alloca [100 x i8], align 16
  store i32 %pos, i32* %2, align 4
  store i32 %color, i32* %3, align 4
  store i8* %message, i8** %4, align 8
  store i32 %komaster, i32* %5, align 4
  store i32 %kom_pos, i32* %6, align 4
  %7 = load i32* %2, align 4
  %8 = load i32* %3, align 4
  %9 = call i32 @do_trymove(i32 %7, i32 %8, i32 1)
  %10 = icmp ne i32 %9, 0
  br i1 %10, label %12, label %11

; <label>:11                                      ; preds = %0
  store i32 0, i32* %1
  br label %63

; <label>:12                                      ; preds = %0
  %13 = load %struct.SGFTree_t** @sgf_dumptree, align 8
  %14 = icmp ne %struct.SGFTree_t* %13, null
  br i1 %14, label %15, label %54

; <label>:15                                      ; preds = %12
  %16 = load i8** %4, align 8
  %17 = icmp eq i8* %16, null
  br i1 %17, label %18, label %19

; <label>:18                                      ; preds = %15
  store i8* getelementptr inbounds ([8 x i8]* @.str3, i32 0, i32 0), i8** %4, align 8
  br label %19

; <label>:19                                      ; preds = %18, %15
  %20 = load i32* %5, align 4
  %21 = icmp ne i32 %20, 0
  br i1 %21, label %22, label %31

; <label>:22                                      ; preds = %19
  %23 = getelementptr inbounds [100 x i8]* %buf, i32 0, i32 0
  %24 = load i8** %4, align 8
  %25 = load i32* @count_variations, align 4
  %26 = load i64* getelementptr inbounds (%struct.Hash_data* @hashdata, i32 0, i32 0, i64 0), align 8
  %27 = load i32* %5, align 4
  %28 = call i8* @komaster_to_string(i32 %27)
  %29 = load i32* %6, align 4
  %30 = call i8* @location_to_string(i32 %29)
  call void (i8*, i64, i8*, ...)* @gg_snprintf(i8* %23, i64 100, i8* getelementptr inbounds ([46 x i8]* @.str9, i32 0, i32 0), i8* %24, i32 %25, i64 %26, i8* %28, i8* %30)
  br label %36

; <label>:31                                      ; preds = %19
  %32 = getelementptr inbounds [100 x i8]* %buf, i32 0, i32 0
  %33 = load i8** %4, align 8
  %34 = load i32* @count_variations, align 4
  %35 = load i64* getelementptr inbounds (%struct.Hash_data* @hashdata, i32 0, i32 0, i64 0), align 8
  call void (i8*, i64, i8*, ...)* @gg_snprintf(i8* %32, i64 100, i8* getelementptr inbounds ([30 x i8]* @.str10, i32 0, i32 0), i8* %33, i32 %34, i64 %35)
  br label %36

; <label>:36                                      ; preds = %31, %22
  %37 = load %struct.SGFTree_t** @sgf_dumptree, align 8
  %38 = load i32* %3, align 4
  call void @sgftreeAddPlayLast(%struct.SGFTree_t* %37, i32 %38, i32 -1, i32 -1)
  %39 = load %struct.SGFTree_t** @sgf_dumptree, align 8
  call void @sgftreeAddComment(%struct.SGFTree_t* %39, i8* getelementptr inbounds ([19 x i8]* @.str11, i32 0, i32 0))
  %40 = load %struct.SGFTree_t** @sgf_dumptree, align 8
  %41 = load i32* %3, align 4
  %42 = sub nsw i32 3, %41
  call void @sgftreeAddPlayLast(%struct.SGFTree_t* %40, i32 %42, i32 -1, i32 -1)
  %43 = load %struct.SGFTree_t** @sgf_dumptree, align 8
  call void @sgftreeAddComment(%struct.SGFTree_t* %43, i8* getelementptr inbounds ([27 x i8]* @.str12, i32 0, i32 0))
  %44 = load %struct.SGFTree_t** @sgf_dumptree, align 8
  %45 = load i32* %3, align 4
  %46 = load i32* %2, align 4
  %47 = sdiv i32 %46, 20
  %48 = sub nsw i32 %47, 1
  %49 = load i32* %2, align 4
  %50 = srem i32 %49, 20
  %51 = sub nsw i32 %50, 1
  call void @sgftreeAddPlayLast(%struct.SGFTree_t* %44, i32 %45, i32 %48, i32 %51)
  %52 = load %struct.SGFTree_t** @sgf_dumptree, align 8
  %53 = getelementptr inbounds [100 x i8]* %buf, i32 0, i32 0
  call void @sgftreeAddComment(%struct.SGFTree_t* %52, i8* %53)
  br label %54

; <label>:54                                      ; preds = %36, %12
  %55 = load i32* @count_variations, align 4
  %56 = icmp ne i32 %55, 0
  br i1 %56, label %57, label %60

; <label>:57                                      ; preds = %54
  %58 = load i32* @count_variations, align 4
  %59 = add nsw i32 %58, 1
  store i32 %59, i32* @count_variations, align 4
  br label %60

; <label>:60                                      ; preds = %57, %54
  %61 = load i32* getelementptr inbounds (%struct.stats_data* @stats, i32 0, i32 0), align 4
  %62 = add nsw i32 %61, 1
  store i32 %62, i32* getelementptr inbounds (%struct.stats_data* @stats, i32 0, i32 0), align 4
  store i32 1, i32* %1
  br label %63

; <label>:63                                      ; preds = %60, %11
  %64 = load i32* %1
  ret i32 %64
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
  %n = alloca i32, align 4
  store i32 0, i32* %n, align 4
  br label %1

; <label>:1                                       ; preds = %17, %0
  %2 = load i32* %n, align 4
  %3 = load i32* @stackp, align 4
  %4 = icmp slt i32 %2, %3
  br i1 %4, label %5, label %20

; <label>:5                                       ; preds = %1
  %6 = load i32* %n, align 4
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds [361 x i32]* @move_color, i32 0, i64 %7
  %9 = load i32* %8, align 4
  %10 = icmp eq i32 %9, 2
  %11 = select i1 %10, i8* getelementptr inbounds ([2 x i8]* @.str15, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @.str16, i32 0, i32 0)
  %12 = load i32* %n, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [361 x i32]* @stack, i32 0, i64 %13
  %15 = load i32* %14, align 4
  %16 = call i32 (i8*, ...)* @gprintf(i8* getelementptr inbounds ([10 x i8]* @.str14, i32 0, i32 0), i8* %11, i32 %15)
  br label %17

; <label>:17                                      ; preds = %5
  %18 = load i32* %n, align 4
  %19 = add nsw i32 %18, 1
  store i32 %19, i32* %n, align 4
  br label %1

; <label>:20                                      ; preds = %1
  %21 = load i32* @count_variations, align 4
  %22 = icmp ne i32 %21, 0
  br i1 %22, label %23, label %27

; <label>:23                                      ; preds = %20
  %24 = load i32* @count_variations, align 4
  %25 = sub nsw i32 %24, 1
  %26 = call i32 (i8*, ...)* @gprintf(i8* getelementptr inbounds ([18 x i8]* @.str17, i32 0, i32 0), i32 %25)
  br label %27

; <label>:27                                      ; preds = %23, %20
  %28 = call i32 (i8*, ...)* @gprintf(i8* getelementptr inbounds ([4 x i8]* @.str18, i32 0, i32 0))
  %29 = load %struct._IO_FILE** @stdout, align 8
  %30 = call i32 @fflush(%struct._IO_FILE* %29)
  %31 = load %struct._IO_FILE** @stderr, align 8
  %32 = call i32 @fflush(%struct._IO_FILE* %31)
  ret void
}

declare i32 @gprintf(i8*, ...) #1

declare i32 @fflush(%struct._IO_FILE*) #1

; Function Attrs: nounwind uwtable
define void @add_stone(i32 %pos, i32 %color) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %pos, i32* %1, align 4
  store i32 %color, i32* %2, align 4
  %3 = load i32* @stackp, align 4
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  br label %13

; <label>:6                                       ; preds = %0
  %7 = load i32* %1, align 4
  %8 = sdiv i32 %7, 20
  %9 = sub nsw i32 %8, 1
  %10 = load i32* %1, align 4
  %11 = srem i32 %10, 20
  %12 = sub nsw i32 %11, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 823, i8* getelementptr inbounds ([12 x i8]* @.str1, i32 0, i32 0), i32 %9, i32 %12)
  br label %13

; <label>:13                                      ; preds = %6, %5
  %14 = load i32* %1, align 4
  %15 = icmp ult i32 %14, 421
  br i1 %15, label %16, label %24

; <label>:16                                      ; preds = %13
  %17 = load i32* %1, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %18
  %20 = load i8* %19, align 1
  %21 = zext i8 %20 to i32
  %22 = icmp ne i32 %21, 3
  br i1 %22, label %23, label %24

; <label>:23                                      ; preds = %16
  br label %31

; <label>:24                                      ; preds = %16, %13
  %25 = load i32* %1, align 4
  %26 = sdiv i32 %25, 20
  %27 = sub nsw i32 %26, 1
  %28 = load i32* %1, align 4
  %29 = srem i32 %28, 20
  %30 = sub nsw i32 %29, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 824, i8* getelementptr inbounds ([15 x i8]* @.str19, i32 0, i32 0), i32 %27, i32 %30)
  br label %31

; <label>:31                                      ; preds = %24, %23
  %32 = load i32* %1, align 4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %33
  %35 = load i8* %34, align 1
  %36 = zext i8 %35 to i32
  %37 = icmp eq i32 %36, 0
  br i1 %37, label %38, label %39

; <label>:38                                      ; preds = %31
  br label %46

; <label>:39                                      ; preds = %31
  %40 = load i32* %1, align 4
  %41 = sdiv i32 %40, 20
  %42 = sub nsw i32 %41, 1
  %43 = load i32* %1, align 4
  %44 = srem i32 %43, 20
  %45 = sub nsw i32 %44, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 825, i8* getelementptr inbounds ([20 x i8]* @.str20, i32 0, i32 0), i32 %42, i32 %45)
  br label %46

; <label>:46                                      ; preds = %39, %38
  %47 = load i32* %2, align 4
  %48 = trunc i32 %47 to i8
  %49 = load i32* %1, align 4
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %50
  store i8 %48, i8* %51, align 1
  %52 = load i32* %1, align 4
  %53 = load i32* %2, align 4
  call void @hashdata_invert_stone(%struct.Hash_data* @hashdata, i32 %52, i32 %53)
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
  %1 = alloca i32, align 4
  store i32 %pos, i32* %1, align 4
  %2 = load i32* @stackp, align 4
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  br label %12

; <label>:5                                       ; preds = %0
  %6 = load i32* %1, align 4
  %7 = sdiv i32 %6, 20
  %8 = sub nsw i32 %7, 1
  %9 = load i32* %1, align 4
  %10 = srem i32 %9, 20
  %11 = sub nsw i32 %10, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 841, i8* getelementptr inbounds ([12 x i8]* @.str1, i32 0, i32 0), i32 %8, i32 %11)
  br label %12

; <label>:12                                      ; preds = %5, %4
  %13 = load i32* %1, align 4
  %14 = icmp ult i32 %13, 421
  br i1 %14, label %15, label %23

; <label>:15                                      ; preds = %12
  %16 = load i32* %1, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %17
  %19 = load i8* %18, align 1
  %20 = zext i8 %19 to i32
  %21 = icmp ne i32 %20, 3
  br i1 %21, label %22, label %23

; <label>:22                                      ; preds = %15
  br label %30

; <label>:23                                      ; preds = %15, %12
  %24 = load i32* %1, align 4
  %25 = sdiv i32 %24, 20
  %26 = sub nsw i32 %25, 1
  %27 = load i32* %1, align 4
  %28 = srem i32 %27, 20
  %29 = sub nsw i32 %28, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 842, i8* getelementptr inbounds ([15 x i8]* @.str19, i32 0, i32 0), i32 %26, i32 %29)
  br label %30

; <label>:30                                      ; preds = %23, %22
  %31 = load i32* %1, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %32
  %34 = load i8* %33, align 1
  %35 = zext i8 %34 to i32
  %36 = icmp eq i32 %35, 1
  br i1 %36, label %44, label %37

; <label>:37                                      ; preds = %30
  %38 = load i32* %1, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %39
  %41 = load i8* %40, align 1
  %42 = zext i8 %41 to i32
  %43 = icmp eq i32 %42, 2
  br i1 %43, label %44, label %45

; <label>:44                                      ; preds = %37, %30
  br label %52

; <label>:45                                      ; preds = %37
  %46 = load i32* %1, align 4
  %47 = sdiv i32 %46, 20
  %48 = sub nsw i32 %47, 1
  %49 = load i32* %1, align 4
  %50 = srem i32 %49, 20
  %51 = sub nsw i32 %50, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 843, i8* getelementptr inbounds ([21 x i8]* @.str21, i32 0, i32 0), i32 %48, i32 %51)
  br label %52

; <label>:52                                      ; preds = %45, %44
  %53 = load i32* %1, align 4
  %54 = load i32* %1, align 4
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %55
  %57 = load i8* %56, align 1
  %58 = zext i8 %57 to i32
  call void @hashdata_invert_stone(%struct.Hash_data* @hashdata, i32 %53, i32 %58)
  %59 = load i32* %1, align 4
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %60
  store i8 0, i8* %61, align 1
  call void @reset_move_history()
  call void @new_position()
  ret void
}

; Function Attrs: nounwind uwtable
define void @play_move(i32 %pos, i32 %color) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %number_collapsed_moves = alloca i32, align 4
  %k = alloca i32, align 4
  %saved_board = alloca [421 x i8], align 16
  %saved_board_ko_pos = alloca i32, align 4
  %saved_white_captured = alloca i32, align 4
  %saved_black_captured = alloca i32, align 4
  store i32 %pos, i32* %1, align 4
  store i32 %color, i32* %2, align 4
  %3 = load i32* @stackp, align 4
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  br label %13

; <label>:6                                       ; preds = %0
  %7 = load i32* %1, align 4
  %8 = sdiv i32 %7, 20
  %9 = sub nsw i32 %8, 1
  %10 = load i32* %1, align 4
  %11 = srem i32 %10, 20
  %12 = sub nsw i32 %11, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 924, i8* getelementptr inbounds ([12 x i8]* @.str1, i32 0, i32 0), i32 %9, i32 %12)
  br label %13

; <label>:13                                      ; preds = %6, %5
  %14 = load i32* %2, align 4
  %15 = icmp eq i32 %14, 1
  br i1 %15, label %19, label %16

; <label>:16                                      ; preds = %13
  %17 = load i32* %2, align 4
  %18 = icmp eq i32 %17, 2
  br i1 %18, label %19, label %20

; <label>:19                                      ; preds = %16, %13
  br label %27

; <label>:20                                      ; preds = %16
  %21 = load i32* %1, align 4
  %22 = sdiv i32 %21, 20
  %23 = sub nsw i32 %22, 1
  %24 = load i32* %1, align 4
  %25 = srem i32 %24, 20
  %26 = sub nsw i32 %25, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 925, i8* getelementptr inbounds ([33 x i8]* @.str22, i32 0, i32 0), i32 %23, i32 %26)
  br label %27

; <label>:27                                      ; preds = %20, %19
  %28 = load i32* %1, align 4
  %29 = icmp eq i32 %28, 0
  br i1 %29, label %40, label %30

; <label>:30                                      ; preds = %27
  %31 = load i32* %1, align 4
  %32 = icmp ult i32 %31, 421
  br i1 %32, label %33, label %41

; <label>:33                                      ; preds = %30
  %34 = load i32* %1, align 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %35
  %37 = load i8* %36, align 1
  %38 = zext i8 %37 to i32
  %39 = icmp ne i32 %38, 3
  br i1 %39, label %40, label %41

; <label>:40                                      ; preds = %33, %27
  br label %48

; <label>:41                                      ; preds = %33, %30
  %42 = load i32* %1, align 4
  %43 = sdiv i32 %42, 20
  %44 = sub nsw i32 %43, 1
  %45 = load i32* %1, align 4
  %46 = srem i32 %45, 20
  %47 = sub nsw i32 %46, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 926, i8* getelementptr inbounds ([35 x i8]* @.str23, i32 0, i32 0), i32 %44, i32 %47)
  br label %48

; <label>:48                                      ; preds = %41, %40
  %49 = load i32* %1, align 4
  %50 = icmp eq i32 %49, 0
  br i1 %50, label %58, label %51

; <label>:51                                      ; preds = %48
  %52 = load i32* %1, align 4
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %53
  %55 = load i8* %54, align 1
  %56 = zext i8 %55 to i32
  %57 = icmp eq i32 %56, 0
  br i1 %57, label %58, label %59

; <label>:58                                      ; preds = %51, %48
  br label %66

; <label>:59                                      ; preds = %51
  %60 = load i32* %1, align 4
  %61 = sdiv i32 %60, 20
  %62 = sub nsw i32 %61, 1
  %63 = load i32* %1, align 4
  %64 = srem i32 %63, 20
  %65 = sub nsw i32 %64, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 927, i8* getelementptr inbounds ([40 x i8]* @.str24, i32 0, i32 0), i32 %62, i32 %65)
  br label %66

; <label>:66                                      ; preds = %59, %58
  %67 = load i32* @move_history_pointer, align 4
  %68 = icmp sge i32 %67, 500
  br i1 %68, label %69, label %113

; <label>:69                                      ; preds = %66
  store i32 51, i32* %number_collapsed_moves, align 4
  %70 = load i32* @board_ko_pos, align 4
  store i32 %70, i32* %saved_board_ko_pos, align 4
  %71 = load i32* @white_captured, align 4
  store i32 %71, i32* %saved_white_captured, align 4
  %72 = load i32* @black_captured, align 4
  store i32 %72, i32* %saved_black_captured, align 4
  %73 = bitcast [421 x i8]* %saved_board to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %73, i8* getelementptr inbounds ([421 x i8]* @board, i32 0, i32 0), i64 421, i32 16, i1 false)
  %74 = load i32* %number_collapsed_moves, align 4
  call void @replay_move_history(i32 %74)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* getelementptr inbounds ([421 x i8]* @initial_board, i32 0, i32 0), i8* getelementptr inbounds ([421 x i8]* @board, i32 0, i32 0), i64 421, i32 16, i1 false)
  %75 = load i32* @board_ko_pos, align 4
  store i32 %75, i32* @initial_board_ko_pos, align 4
  %76 = load i32* @white_captured, align 4
  store i32 %76, i32* @initial_white_captured, align 4
  %77 = load i32* @black_captured, align 4
  store i32 %77, i32* @initial_black_captured, align 4
  %78 = load i32* %number_collapsed_moves, align 4
  store i32 %78, i32* %k, align 4
  br label %79

; <label>:79                                      ; preds = %102, %69
  %80 = load i32* %k, align 4
  %81 = load i32* @move_history_pointer, align 4
  %82 = icmp slt i32 %80, %81
  br i1 %82, label %83, label %105

; <label>:83                                      ; preds = %79
  %84 = load i32* %k, align 4
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds [500 x i32]* @move_history_color, i32 0, i64 %85
  %87 = load i32* %86, align 4
  %88 = load i32* %k, align 4
  %89 = load i32* %number_collapsed_moves, align 4
  %90 = sub nsw i32 %88, %89
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds [500 x i32]* @move_history_color, i32 0, i64 %91
  store i32 %87, i32* %92, align 4
  %93 = load i32* %k, align 4
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds [500 x i32]* @move_history_pos, i32 0, i64 %94
  %96 = load i32* %95, align 4
  %97 = load i32* %k, align 4
  %98 = load i32* %number_collapsed_moves, align 4
  %99 = sub nsw i32 %97, %98
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds [500 x i32]* @move_history_pos, i32 0, i64 %100
  store i32 %96, i32* %101, align 4
  br label %102

; <label>:102                                     ; preds = %83
  %103 = load i32* %k, align 4
  %104 = add nsw i32 %103, 1
  store i32 %104, i32* %k, align 4
  br label %79

; <label>:105                                     ; preds = %79
  %106 = load i32* %number_collapsed_moves, align 4
  %107 = load i32* @move_history_pointer, align 4
  %108 = sub nsw i32 %107, %106
  store i32 %108, i32* @move_history_pointer, align 4
  %109 = bitcast [421 x i8]* %saved_board to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* getelementptr inbounds ([421 x i8]* @board, i32 0, i32 0), i8* %109, i64 421, i32 16, i1 false)
  %110 = load i32* %saved_board_ko_pos, align 4
  store i32 %110, i32* @board_ko_pos, align 4
  %111 = load i32* %saved_white_captured, align 4
  store i32 %111, i32* @white_captured, align 4
  %112 = load i32* %saved_black_captured, align 4
  store i32 %112, i32* @black_captured, align 4
  br label %113

; <label>:113                                     ; preds = %105, %66
  %114 = load i32* %2, align 4
  %115 = load i32* @move_history_pointer, align 4
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds [500 x i32]* @move_history_color, i32 0, i64 %116
  store i32 %114, i32* %117, align 4
  %118 = load i32* %1, align 4
  %119 = load i32* @move_history_pointer, align 4
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds [500 x i32]* @move_history_pos, i32 0, i64 %120
  store i32 %118, i32* %121, align 4
  %122 = load i32* @move_history_pointer, align 4
  %123 = add nsw i32 %122, 1
  store i32 %123, i32* @move_history_pointer, align 4
  %124 = load i32* %1, align 4
  %125 = load i32* %2, align 4
  call void @play_move_no_history(i32 %124, i32 %125)
  %126 = load i32* @movenum, align 4
  %127 = add nsw i32 %126, 1
  store i32 %127, i32* @movenum, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @replay_move_history(i32 %n) #0 {
  %1 = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* getelementptr inbounds ([421 x i8]* @board, i32 0, i32 0), i8* getelementptr inbounds ([421 x i8]* @initial_board, i32 0, i32 0), i64 421, i32 16, i1 false)
  %2 = load i32* @initial_board_ko_pos, align 4
  store i32 %2, i32* @board_ko_pos, align 4
  %3 = load i32* @initial_white_captured, align 4
  store i32 %3, i32* @white_captured, align 4
  %4 = load i32* @initial_black_captured, align 4
  store i32 %4, i32* @black_captured, align 4
  call void @new_position()
  store i32 0, i32* %k, align 4
  br label %5

; <label>:5                                       ; preds = %18, %0
  %6 = load i32* %k, align 4
  %7 = load i32* %1, align 4
  %8 = icmp slt i32 %6, %7
  br i1 %8, label %9, label %21

; <label>:9                                       ; preds = %5
  %10 = load i32* %k, align 4
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds [500 x i32]* @move_history_pos, i32 0, i64 %11
  %13 = load i32* %12, align 4
  %14 = load i32* %k, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [500 x i32]* @move_history_color, i32 0, i64 %15
  %17 = load i32* %16, align 4
  call void @play_move_no_history(i32 %13, i32 %17)
  br label %18

; <label>:18                                      ; preds = %9
  %19 = load i32* %k, align 4
  %20 = add nsw i32 %19, 1
  store i32 %20, i32* %k, align 4
  br label %5

; <label>:21                                      ; preds = %5
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @play_move_no_history(i32 %pos, i32 %color) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %pos, i32* %1, align 4
  store i32 %color, i32* %2, align 4
  %3 = load i32* @board_ko_pos, align 4
  %4 = icmp ne i32 %3, 0
  br i1 %4, label %5, label %7

; <label>:5                                       ; preds = %0
  %6 = load i32* @board_ko_pos, align 4
  call void @hashdata_invert_ko(%struct.Hash_data* @hashdata, i32 %6)
  br label %7

; <label>:7                                       ; preds = %5, %0
  store i32 0, i32* @board_ko_pos, align 4
  %8 = load i32* %1, align 4
  %9 = icmp ne i32 %8, 0
  br i1 %9, label %10, label %46

; <label>:10                                      ; preds = %7
  %11 = load i32* %1, align 4
  %12 = icmp ult i32 %11, 421
  br i1 %12, label %13, label %21

; <label>:13                                      ; preds = %10
  %14 = load i32* %1, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %15
  %17 = load i8* %16, align 1
  %18 = zext i8 %17 to i32
  %19 = icmp ne i32 %18, 3
  br i1 %19, label %20, label %21

; <label>:20                                      ; preds = %13
  br label %28

; <label>:21                                      ; preds = %13, %10
  %22 = load i32* %1, align 4
  %23 = sdiv i32 %22, 20
  %24 = sub nsw i32 %23, 1
  %25 = load i32* %1, align 4
  %26 = srem i32 %25, 20
  %27 = sub nsw i32 %26, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 872, i8* getelementptr inbounds ([15 x i8]* @.str19, i32 0, i32 0), i32 %24, i32 %27)
  br label %28

; <label>:28                                      ; preds = %21, %20
  %29 = load i32* %1, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %30
  %32 = load i8* %31, align 1
  %33 = zext i8 %32 to i32
  %34 = icmp eq i32 %33, 0
  br i1 %34, label %35, label %36

; <label>:35                                      ; preds = %28
  br label %43

; <label>:36                                      ; preds = %28
  %37 = load i32* %1, align 4
  %38 = sdiv i32 %37, 20
  %39 = sub nsw i32 %38, 1
  %40 = load i32* %1, align 4
  %41 = srem i32 %40, 20
  %42 = sub nsw i32 %41, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 873, i8* getelementptr inbounds ([20 x i8]* @.str20, i32 0, i32 0), i32 %39, i32 %42)
  br label %43

; <label>:43                                      ; preds = %36, %35
  %44 = load i32* %1, align 4
  %45 = load i32* %2, align 4
  call void @do_play_move(i32 %44, i32 %45)
  br label %46

; <label>:46                                      ; preds = %43, %7
  call void @new_position()
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @undo_move(i32 %n) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %n, i32* %2, align 4
  %3 = load i32* @stackp, align 4
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  br label %7

; <label>:6                                       ; preds = %0
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 976, i8* getelementptr inbounds ([12 x i8]* @.str1, i32 0, i32 0), i32 -1, i32 -1)
  br label %7

; <label>:7                                       ; preds = %6, %5
  %8 = load i32* @move_history_pointer, align 4
  %9 = load i32* %2, align 4
  %10 = icmp slt i32 %8, %9
  br i1 %10, label %11, label %12

; <label>:11                                      ; preds = %7
  store i32 0, i32* %1
  br label %22

; <label>:12                                      ; preds = %7
  %13 = load i32* @move_history_pointer, align 4
  %14 = load i32* %2, align 4
  %15 = sub nsw i32 %13, %14
  call void @replay_move_history(i32 %15)
  %16 = load i32* %2, align 4
  %17 = load i32* @move_history_pointer, align 4
  %18 = sub nsw i32 %17, %16
  store i32 %18, i32* @move_history_pointer, align 4
  %19 = load i32* %2, align 4
  %20 = load i32* @movenum, align 4
  %21 = sub nsw i32 %20, %19
  store i32 %21, i32* @movenum, align 4
  store i32 1, i32* %1
  br label %22

; <label>:22                                      ; preds = %12, %11
  %23 = load i32* %1
  ret i32 %23
}

; Function Attrs: nounwind uwtable
define i32 @get_last_opponent_move(i32 %color) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 %color, i32* %2, align 4
  %3 = load i32* @move_history_pointer, align 4
  %4 = sub nsw i32 %3, 1
  store i32 %4, i32* %k, align 4
  br label %5

; <label>:5                                       ; preds = %22, %0
  %6 = load i32* %k, align 4
  %7 = icmp sge i32 %6, 0
  br i1 %7, label %8, label %25

; <label>:8                                       ; preds = %5
  %9 = load i32* %k, align 4
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds [500 x i32]* @move_history_color, i32 0, i64 %10
  %12 = load i32* %11, align 4
  %13 = load i32* %2, align 4
  %14 = sub nsw i32 3, %13
  %15 = icmp eq i32 %12, %14
  br i1 %15, label %16, label %21

; <label>:16                                      ; preds = %8
  %17 = load i32* %k, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds [500 x i32]* @move_history_pos, i32 0, i64 %18
  %20 = load i32* %19, align 4
  store i32 %20, i32* %1
  br label %26

; <label>:21                                      ; preds = %8
  br label %22

; <label>:22                                      ; preds = %21
  %23 = load i32* %k, align 4
  %24 = add nsw i32 %23, -1
  store i32 %24, i32* %k, align 4
  br label %5

; <label>:25                                      ; preds = %5
  store i32 0, i32* %1
  br label %26

; <label>:26                                      ; preds = %25, %16
  %27 = load i32* %1
  ret i32 %27
}

; Function Attrs: nounwind uwtable
define i32 @get_last_move() #0 {
  %1 = alloca i32, align 4
  %2 = load i32* @move_history_pointer, align 4
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  store i32 0, i32* %1
  br label %11

; <label>:5                                       ; preds = %0
  %6 = load i32* @move_history_pointer, align 4
  %7 = sub nsw i32 %6, 1
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds [500 x i32]* @move_history_pos, i32 0, i64 %8
  %10 = load i32* %9, align 4
  store i32 %10, i32* %1
  br label %11

; <label>:11                                      ; preds = %5, %4
  %12 = load i32* %1
  ret i32 %12
}

; Function Attrs: nounwind uwtable
define i32 @get_last_player() #0 {
  %1 = alloca i32, align 4
  %2 = load i32* @move_history_pointer, align 4
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  store i32 0, i32* %1
  br label %11

; <label>:5                                       ; preds = %0
  %6 = load i32* @move_history_pointer, align 4
  %7 = sub nsw i32 %6, 1
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds [500 x i32]* @move_history_color, i32 0, i64 %8
  %10 = load i32* %9, align 4
  store i32 %10, i32* %1
  br label %11

; <label>:11                                      ; preds = %5, %4
  %12 = load i32* %1
  ret i32 %12
}

; Function Attrs: nounwind uwtable
define i32 @is_pass(i32 %pos) #0 {
  %1 = alloca i32, align 4
  store i32 %pos, i32* %1, align 4
  %2 = load i32* %1, align 4
  %3 = icmp eq i32 %2, 0
  %4 = zext i1 %3 to i32
  ret i32 %4
}

; Function Attrs: nounwind uwtable
define i32 @is_legal(i32 %pos, i32 %color) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %pos, i32* %2, align 4
  store i32 %color, i32* %3, align 4
  %4 = load i32* %2, align 4
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %6, label %7

; <label>:6                                       ; preds = %0
  store i32 1, i32* %1
  br label %75

; <label>:7                                       ; preds = %0
  %8 = load i32* %2, align 4
  %9 = icmp ult i32 %8, 421
  br i1 %9, label %10, label %18

; <label>:10                                      ; preds = %7
  %11 = load i32* %2, align 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %12
  %14 = load i8* %13, align 1
  %15 = zext i8 %14 to i32
  %16 = icmp ne i32 %15, 3
  br i1 %16, label %17, label %18

; <label>:17                                      ; preds = %10
  br label %25

; <label>:18                                      ; preds = %10, %7
  %19 = load i32* %2, align 4
  %20 = sdiv i32 %19, 20
  %21 = sub nsw i32 %20, 1
  %22 = load i32* %2, align 4
  %23 = srem i32 %22, 20
  %24 = sub nsw i32 %23, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 1059, i8* getelementptr inbounds ([15 x i8]* @.str19, i32 0, i32 0), i32 %21, i32 %24)
  br label %25

; <label>:25                                      ; preds = %18, %17
  %26 = load i32* %2, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %27
  %29 = load i8* %28, align 1
  %30 = zext i8 %29 to i32
  %31 = icmp ne i32 %30, 0
  br i1 %31, label %32, label %33

; <label>:32                                      ; preds = %25
  store i32 0, i32* %1
  br label %75

; <label>:33                                      ; preds = %25
  %34 = load i32* %2, align 4
  %35 = load i32* @board_ko_pos, align 4
  %36 = icmp eq i32 %34, %35
  br i1 %36, label %37, label %59

; <label>:37                                      ; preds = %33
  %38 = load i32* %2, align 4
  %39 = sub nsw i32 %38, 1
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %40
  %42 = load i8* %41, align 1
  %43 = zext i8 %42 to i32
  %44 = load i32* %3, align 4
  %45 = sub nsw i32 3, %44
  %46 = icmp eq i32 %43, %45
  br i1 %46, label %57, label %47

; <label>:47                                      ; preds = %37
  %48 = load i32* %2, align 4
  %49 = add nsw i32 %48, 1
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %50
  %52 = load i8* %51, align 1
  %53 = zext i8 %52 to i32
  %54 = load i32* %3, align 4
  %55 = sub nsw i32 3, %54
  %56 = icmp eq i32 %53, %55
  br i1 %56, label %57, label %58

; <label>:57                                      ; preds = %47, %37
  store i32 0, i32* %1
  br label %75

; <label>:58                                      ; preds = %47
  br label %59

; <label>:59                                      ; preds = %58, %33
  %60 = load i32* @stackp, align 4
  %61 = icmp sge i32 %60, 359
  br i1 %61, label %62, label %65

; <label>:62                                      ; preds = %59
  %63 = load %struct._IO_FILE** @stderr, align 8
  %64 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %63, i8* getelementptr inbounds ([62 x i8]* @.str25, i32 0, i32 0))
  store i32 0, i32* %1
  br label %75

; <label>:65                                      ; preds = %59
  %66 = load i32* @allow_suicide, align 4
  %67 = icmp ne i32 %66, 0
  br i1 %67, label %74, label %68

; <label>:68                                      ; preds = %65
  %69 = load i32* %2, align 4
  %70 = load i32* %3, align 4
  %71 = call i32 @is_suicide(i32 %69, i32 %70)
  %72 = icmp ne i32 %71, 0
  br i1 %72, label %73, label %74

; <label>:73                                      ; preds = %68
  store i32 0, i32* %1
  br label %75

; <label>:74                                      ; preds = %68, %65
  store i32 1, i32* %1
  br label %75

; <label>:75                                      ; preds = %74, %73, %62, %57, %32, %6
  %76 = load i32* %1
  ret i32 %76
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind uwtable
define i32 @is_suicide(i32 %pos, i32 %color) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %pos, i32* %2, align 4
  store i32 %color, i32* %3, align 4
  %4 = load i32* %2, align 4
  %5 = icmp ult i32 %4, 421
  br i1 %5, label %6, label %14

; <label>:6                                       ; preds = %0
  %7 = load i32* %2, align 4
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %8
  %10 = load i8* %9, align 1
  %11 = zext i8 %10 to i32
  %12 = icmp ne i32 %11, 3
  br i1 %12, label %13, label %14

; <label>:13                                      ; preds = %6
  br label %21

; <label>:14                                      ; preds = %6, %0
  %15 = load i32* %2, align 4
  %16 = sdiv i32 %15, 20
  %17 = sub nsw i32 %16, 1
  %18 = load i32* %2, align 4
  %19 = srem i32 %18, 20
  %20 = sub nsw i32 %19, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 1104, i8* getelementptr inbounds ([15 x i8]* @.str19, i32 0, i32 0), i32 %17, i32 %20)
  br label %21

; <label>:21                                      ; preds = %14, %13
  %22 = load i32* %2, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %23
  %25 = load i8* %24, align 1
  %26 = zext i8 %25 to i32
  %27 = icmp eq i32 %26, 0
  br i1 %27, label %28, label %29

; <label>:28                                      ; preds = %21
  br label %36

; <label>:29                                      ; preds = %21
  %30 = load i32* %2, align 4
  %31 = sdiv i32 %30, 20
  %32 = sub nsw i32 %31, 1
  %33 = load i32* %2, align 4
  %34 = srem i32 %33, 20
  %35 = sub nsw i32 %34, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 1105, i8* getelementptr inbounds ([20 x i8]* @.str20, i32 0, i32 0), i32 %32, i32 %35)
  br label %36

; <label>:36                                      ; preds = %29, %28
  %37 = load i32* %2, align 4
  %38 = add nsw i32 %37, 20
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %39
  %41 = load i8* %40, align 1
  %42 = zext i8 %41 to i32
  %43 = icmp eq i32 %42, 0
  br i1 %43, label %75, label %44

; <label>:44                                      ; preds = %36
  %45 = load i32* %2, align 4
  %46 = add nsw i32 %45, 20
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %47
  %49 = load i8* %48, align 1
  %50 = zext i8 %49 to i32
  %51 = icmp ne i32 %50, 3
  br i1 %51, label %52, label %76

; <label>:52                                      ; preds = %44
  %53 = load i32* %2, align 4
  %54 = add nsw i32 %53, 20
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %55
  %57 = load i8* %56, align 1
  %58 = zext i8 %57 to i32
  %59 = load i32* %3, align 4
  %60 = icmp eq i32 %58, %59
  %61 = zext i1 %60 to i32
  %62 = load i32* %2, align 4
  %63 = add nsw i32 %62, 20
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %64
  %66 = load i32* %65, align 4
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %67
  %69 = getelementptr inbounds %struct.string_data* %68, i32 0, i32 3
  %70 = load i32* %69, align 4
  %71 = icmp eq i32 %70, 1
  %72 = zext i1 %71 to i32
  %73 = xor i32 %61, %72
  %74 = icmp ne i32 %73, 0
  br i1 %74, label %75, label %76

; <label>:75                                      ; preds = %52, %36
  store i32 0, i32* %1
  br label %197

; <label>:76                                      ; preds = %52, %44
  %77 = load i32* %2, align 4
  %78 = sub nsw i32 %77, 1
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %79
  %81 = load i8* %80, align 1
  %82 = zext i8 %81 to i32
  %83 = icmp eq i32 %82, 0
  br i1 %83, label %115, label %84

; <label>:84                                      ; preds = %76
  %85 = load i32* %2, align 4
  %86 = sub nsw i32 %85, 1
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %87
  %89 = load i8* %88, align 1
  %90 = zext i8 %89 to i32
  %91 = icmp ne i32 %90, 3
  br i1 %91, label %92, label %116

; <label>:92                                      ; preds = %84
  %93 = load i32* %2, align 4
  %94 = sub nsw i32 %93, 1
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %95
  %97 = load i8* %96, align 1
  %98 = zext i8 %97 to i32
  %99 = load i32* %3, align 4
  %100 = icmp eq i32 %98, %99
  %101 = zext i1 %100 to i32
  %102 = load i32* %2, align 4
  %103 = sub nsw i32 %102, 1
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %104
  %106 = load i32* %105, align 4
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %107
  %109 = getelementptr inbounds %struct.string_data* %108, i32 0, i32 3
  %110 = load i32* %109, align 4
  %111 = icmp eq i32 %110, 1
  %112 = zext i1 %111 to i32
  %113 = xor i32 %101, %112
  %114 = icmp ne i32 %113, 0
  br i1 %114, label %115, label %116

; <label>:115                                     ; preds = %92, %76
  store i32 0, i32* %1
  br label %197

; <label>:116                                     ; preds = %92, %84
  %117 = load i32* %2, align 4
  %118 = sub nsw i32 %117, 20
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %119
  %121 = load i8* %120, align 1
  %122 = zext i8 %121 to i32
  %123 = icmp eq i32 %122, 0
  br i1 %123, label %155, label %124

; <label>:124                                     ; preds = %116
  %125 = load i32* %2, align 4
  %126 = sub nsw i32 %125, 20
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %127
  %129 = load i8* %128, align 1
  %130 = zext i8 %129 to i32
  %131 = icmp ne i32 %130, 3
  br i1 %131, label %132, label %156

; <label>:132                                     ; preds = %124
  %133 = load i32* %2, align 4
  %134 = sub nsw i32 %133, 20
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %135
  %137 = load i8* %136, align 1
  %138 = zext i8 %137 to i32
  %139 = load i32* %3, align 4
  %140 = icmp eq i32 %138, %139
  %141 = zext i1 %140 to i32
  %142 = load i32* %2, align 4
  %143 = sub nsw i32 %142, 20
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %144
  %146 = load i32* %145, align 4
  %147 = sext i32 %146 to i64
  %148 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %147
  %149 = getelementptr inbounds %struct.string_data* %148, i32 0, i32 3
  %150 = load i32* %149, align 4
  %151 = icmp eq i32 %150, 1
  %152 = zext i1 %151 to i32
  %153 = xor i32 %141, %152
  %154 = icmp ne i32 %153, 0
  br i1 %154, label %155, label %156

; <label>:155                                     ; preds = %132, %116
  store i32 0, i32* %1
  br label %197

; <label>:156                                     ; preds = %132, %124
  %157 = load i32* %2, align 4
  %158 = add nsw i32 %157, 1
  %159 = sext i32 %158 to i64
  %160 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %159
  %161 = load i8* %160, align 1
  %162 = zext i8 %161 to i32
  %163 = icmp eq i32 %162, 0
  br i1 %163, label %195, label %164

; <label>:164                                     ; preds = %156
  %165 = load i32* %2, align 4
  %166 = add nsw i32 %165, 1
  %167 = sext i32 %166 to i64
  %168 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %167
  %169 = load i8* %168, align 1
  %170 = zext i8 %169 to i32
  %171 = icmp ne i32 %170, 3
  br i1 %171, label %172, label %196

; <label>:172                                     ; preds = %164
  %173 = load i32* %2, align 4
  %174 = add nsw i32 %173, 1
  %175 = sext i32 %174 to i64
  %176 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %175
  %177 = load i8* %176, align 1
  %178 = zext i8 %177 to i32
  %179 = load i32* %3, align 4
  %180 = icmp eq i32 %178, %179
  %181 = zext i1 %180 to i32
  %182 = load i32* %2, align 4
  %183 = add nsw i32 %182, 1
  %184 = sext i32 %183 to i64
  %185 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %184
  %186 = load i32* %185, align 4
  %187 = sext i32 %186 to i64
  %188 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %187
  %189 = getelementptr inbounds %struct.string_data* %188, i32 0, i32 3
  %190 = load i32* %189, align 4
  %191 = icmp eq i32 %190, 1
  %192 = zext i1 %191 to i32
  %193 = xor i32 %181, %192
  %194 = icmp ne i32 %193, 0
  br i1 %194, label %195, label %196

; <label>:195                                     ; preds = %172, %156
  store i32 0, i32* %1
  br label %197

; <label>:196                                     ; preds = %172, %164
  store i32 1, i32* %1
  br label %197

; <label>:197                                     ; preds = %196, %195, %155, %115, %75
  %198 = load i32* %1
  ret i32 %198
}

; Function Attrs: nounwind uwtable
define i32 @is_illegal_ko_capture(i32 %pos, i32 %color) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %pos, i32* %1, align 4
  store i32 %color, i32* %2, align 4
  %3 = load i32* %1, align 4
  %4 = icmp ult i32 %3, 421
  br i1 %4, label %5, label %13

; <label>:5                                       ; preds = %0
  %6 = load i32* %1, align 4
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %7
  %9 = load i8* %8, align 1
  %10 = zext i8 %9 to i32
  %11 = icmp ne i32 %10, 3
  br i1 %11, label %12, label %13

; <label>:12                                      ; preds = %5
  br label %20

; <label>:13                                      ; preds = %5, %0
  %14 = load i32* %1, align 4
  %15 = sdiv i32 %14, 20
  %16 = sub nsw i32 %15, 1
  %17 = load i32* %1, align 4
  %18 = srem i32 %17, 20
  %19 = sub nsw i32 %18, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 1139, i8* getelementptr inbounds ([15 x i8]* @.str19, i32 0, i32 0), i32 %16, i32 %19)
  br label %20

; <label>:20                                      ; preds = %13, %12
  %21 = load i32* %1, align 4
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %22
  %24 = load i8* %23, align 1
  %25 = zext i8 %24 to i32
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %27, label %28

; <label>:27                                      ; preds = %20
  br label %35

; <label>:28                                      ; preds = %20
  %29 = load i32* %1, align 4
  %30 = sdiv i32 %29, 20
  %31 = sub nsw i32 %30, 1
  %32 = load i32* %1, align 4
  %33 = srem i32 %32, 20
  %34 = sub nsw i32 %33, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 1140, i8* getelementptr inbounds ([20 x i8]* @.str20, i32 0, i32 0), i32 %31, i32 %34)
  br label %35

; <label>:35                                      ; preds = %28, %27
  %36 = load i32* %1, align 4
  %37 = load i32* @board_ko_pos, align 4
  %38 = icmp eq i32 %36, %37
  br i1 %38, label %39, label %61

; <label>:39                                      ; preds = %35
  %40 = load i32* %1, align 4
  %41 = sub nsw i32 %40, 1
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %42
  %44 = load i8* %43, align 1
  %45 = zext i8 %44 to i32
  %46 = load i32* %2, align 4
  %47 = sub nsw i32 3, %46
  %48 = icmp eq i32 %45, %47
  br i1 %48, label %59, label %49

; <label>:49                                      ; preds = %39
  %50 = load i32* %1, align 4
  %51 = add nsw i32 %50, 1
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %52
  %54 = load i8* %53, align 1
  %55 = zext i8 %54 to i32
  %56 = load i32* %2, align 4
  %57 = sub nsw i32 3, %56
  %58 = icmp eq i32 %55, %57
  br label %59

; <label>:59                                      ; preds = %49, %39
  %60 = phi i1 [ true, %39 ], [ %58, %49 ]
  br label %61

; <label>:61                                      ; preds = %59, %35
  %62 = phi i1 [ false, %35 ], [ %60, %59 ]
  %63 = zext i1 %62 to i32
  ret i32 %63
}

; Function Attrs: nounwind uwtable
define i32 @komaster_trymove(i32 %pos, i32 %color, i8* %message, i32 %str, i32 %komaster, i32 %kom_pos, i32* %new_komaster, i32* %new_kom_pos, i32* %is_conditional_ko, i32 %consider_conditional_ko) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32*, align 8
  %9 = alloca i32*, align 8
  %10 = alloca i32*, align 8
  %11 = alloca i32, align 4
  %other = alloca i32, align 4
  %ko_move = alloca i32, align 4
  %kpos = alloca i32, align 4
  %previous_board_ko_pos = alloca i32, align 4
  store i32 %pos, i32* %2, align 4
  store i32 %color, i32* %3, align 4
  store i8* %message, i8** %4, align 8
  store i32 %str, i32* %5, align 4
  store i32 %komaster, i32* %6, align 4
  store i32 %kom_pos, i32* %7, align 4
  store i32* %new_komaster, i32** %8, align 8
  store i32* %new_kom_pos, i32** %9, align 8
  store i32* %is_conditional_ko, i32** %10, align 8
  store i32 %consider_conditional_ko, i32* %11, align 4
  %12 = load i32* %3, align 4
  %13 = sub nsw i32 3, %12
  store i32 %13, i32* %other, align 4
  %14 = load i32* @board_ko_pos, align 4
  store i32 %14, i32* %previous_board_ko_pos, align 4
  %15 = load i32* %6, align 4
  %16 = icmp eq i32 %15, 1
  br i1 %16, label %20, label %17

; <label>:17                                      ; preds = %0
  %18 = load i32* %6, align 4
  %19 = icmp eq i32 %18, 4
  br i1 %19, label %20, label %42

; <label>:20                                      ; preds = %17, %0
  %21 = load i32* %7, align 4
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %22
  %24 = load i8* %23, align 1
  %25 = zext i8 %24 to i32
  %26 = icmp eq i32 %25, 1
  br i1 %26, label %70, label %27

; <label>:27                                      ; preds = %20
  %28 = load i32* %7, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %29
  %31 = load i8* %30, align 1
  %32 = zext i8 %31 to i32
  %33 = icmp eq i32 %32, 2
  br i1 %33, label %70, label %34

; <label>:34                                      ; preds = %27
  %35 = load i32* %7, align 4
  %36 = call i32 @is_ko(i32 %35, i32 2, i32* null)
  %37 = icmp ne i32 %36, 0
  br i1 %37, label %42, label %38

; <label>:38                                      ; preds = %34
  %39 = load i32* %7, align 4
  %40 = call i32 @is_suicide(i32 %39, i32 2)
  %41 = icmp ne i32 %40, 0
  br i1 %41, label %70, label %42

; <label>:42                                      ; preds = %38, %34, %17
  %43 = load i32* %6, align 4
  %44 = icmp eq i32 %43, 2
  br i1 %44, label %48, label %45

; <label>:45                                      ; preds = %42
  %46 = load i32* %6, align 4
  %47 = icmp eq i32 %46, 5
  br i1 %47, label %48, label %71

; <label>:48                                      ; preds = %45, %42
  %49 = load i32* %7, align 4
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %50
  %52 = load i8* %51, align 1
  %53 = zext i8 %52 to i32
  %54 = icmp eq i32 %53, 1
  br i1 %54, label %70, label %55

; <label>:55                                      ; preds = %48
  %56 = load i32* %7, align 4
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %57
  %59 = load i8* %58, align 1
  %60 = zext i8 %59 to i32
  %61 = icmp eq i32 %60, 2
  br i1 %61, label %70, label %62

; <label>:62                                      ; preds = %55
  %63 = load i32* %7, align 4
  %64 = call i32 @is_ko(i32 %63, i32 1, i32* null)
  %65 = icmp ne i32 %64, 0
  br i1 %65, label %71, label %66

; <label>:66                                      ; preds = %62
  %67 = load i32* %7, align 4
  %68 = call i32 @is_suicide(i32 %67, i32 1)
  %69 = icmp ne i32 %68, 0
  br i1 %69, label %70, label %71

; <label>:70                                      ; preds = %66, %55, %48, %38, %27, %20
  store i32 0, i32* %6, align 4
  store i32 0, i32* %7, align 4
  br label %71

; <label>:71                                      ; preds = %70, %66, %62, %45
  %72 = load i32* %6, align 4
  %73 = load i32** %8, align 8
  store i32 %72, i32* %73, align 4
  %74 = load i32* %7, align 4
  %75 = load i32** %9, align 8
  store i32 %74, i32* %75, align 4
  %76 = load i32** %10, align 8
  store i32 0, i32* %76, align 4
  %77 = load i32* %2, align 4
  %78 = load i32* %3, align 4
  %79 = call i32 @is_ko(i32 %77, i32 %78, i32* %kpos)
  store i32 %79, i32* %ko_move, align 4
  %80 = load i32* %ko_move, align 4
  %81 = icmp ne i32 %80, 0
  br i1 %81, label %89, label %82

; <label>:82                                      ; preds = %71
  %83 = load i32* %6, align 4
  %84 = icmp eq i32 %83, 6
  br i1 %84, label %85, label %88

; <label>:85                                      ; preds = %82
  %86 = load i32** %8, align 8
  store i32 0, i32* %86, align 4
  %87 = load i32** %9, align 8
  store i32 0, i32* %87, align 4
  br label %88

; <label>:88                                      ; preds = %85, %82
  br label %168

; <label>:89                                      ; preds = %71
  %90 = load i32* %6, align 4
  %91 = load i32* %other, align 4
  %92 = icmp eq i32 %90, %91
  br i1 %92, label %93, label %98

; <label>:93                                      ; preds = %89
  %94 = load i32* %2, align 4
  %95 = load i32* %7, align 4
  %96 = icmp eq i32 %94, %95
  br i1 %96, label %97, label %98

; <label>:97                                      ; preds = %93
  store i32 0, i32* %1
  br label %236

; <label>:98                                      ; preds = %93, %89
  %99 = load i32* %6, align 4
  %100 = icmp eq i32 %99, 4
  br i1 %100, label %104, label %101

; <label>:101                                     ; preds = %98
  %102 = load i32* %6, align 4
  %103 = icmp eq i32 %102, 5
  br i1 %103, label %104, label %105

; <label>:104                                     ; preds = %101, %98
  store i32 0, i32* %1
  br label %236

; <label>:105                                     ; preds = %101
  %106 = load i32* %6, align 4
  %107 = load i32* %3, align 4
  %108 = icmp eq i32 %106, %107
  br i1 %108, label %109, label %134

; <label>:109                                     ; preds = %105
  %110 = load i32* %kpos, align 4
  %111 = load i32* %7, align 4
  %112 = add nsw i32 %111, 20
  %113 = sub nsw i32 %112, 1
  %114 = icmp eq i32 %110, %113
  br i1 %114, label %134, label %115

; <label>:115                                     ; preds = %109
  %116 = load i32* %kpos, align 4
  %117 = load i32* %7, align 4
  %118 = sub nsw i32 %117, 20
  %119 = sub nsw i32 %118, 1
  %120 = icmp eq i32 %116, %119
  br i1 %120, label %134, label %121

; <label>:121                                     ; preds = %115
  %122 = load i32* %kpos, align 4
  %123 = load i32* %7, align 4
  %124 = sub nsw i32 %123, 20
  %125 = add nsw i32 %124, 1
  %126 = icmp eq i32 %122, %125
  br i1 %126, label %134, label %127

; <label>:127                                     ; preds = %121
  %128 = load i32* %kpos, align 4
  %129 = load i32* %7, align 4
  %130 = add nsw i32 %129, 20
  %131 = add nsw i32 %130, 1
  %132 = icmp eq i32 %128, %131
  br i1 %132, label %134, label %133

; <label>:133                                     ; preds = %127
  store i32 0, i32* %1
  br label %236

; <label>:134                                     ; preds = %127, %121, %115, %109, %105
  %135 = load i32* %6, align 4
  %136 = icmp eq i32 %135, 6
  br i1 %136, label %137, label %167

; <label>:137                                     ; preds = %134
  %138 = load i32* %2, align 4
  %139 = load i32* @board_ko_pos, align 4
  %140 = icmp ne i32 %138, %139
  br i1 %140, label %141, label %166

; <label>:141                                     ; preds = %137
  %142 = load i32* %kpos, align 4
  %143 = load i32* %7, align 4
  %144 = add nsw i32 %143, 20
  %145 = sub nsw i32 %144, 1
  %146 = icmp eq i32 %142, %145
  br i1 %146, label %166, label %147

; <label>:147                                     ; preds = %141
  %148 = load i32* %kpos, align 4
  %149 = load i32* %7, align 4
  %150 = sub nsw i32 %149, 20
  %151 = sub nsw i32 %150, 1
  %152 = icmp eq i32 %148, %151
  br i1 %152, label %166, label %153

; <label>:153                                     ; preds = %147
  %154 = load i32* %kpos, align 4
  %155 = load i32* %7, align 4
  %156 = sub nsw i32 %155, 20
  %157 = add nsw i32 %156, 1
  %158 = icmp eq i32 %154, %157
  br i1 %158, label %166, label %159

; <label>:159                                     ; preds = %153
  %160 = load i32* %kpos, align 4
  %161 = load i32* %7, align 4
  %162 = add nsw i32 %161, 20
  %163 = add nsw i32 %162, 1
  %164 = icmp eq i32 %160, %163
  br i1 %164, label %166, label %165

; <label>:165                                     ; preds = %159
  store i32 0, i32* %1
  br label %236

; <label>:166                                     ; preds = %159, %153, %147, %141, %137
  br label %167

; <label>:167                                     ; preds = %166, %134
  br label %168

; <label>:168                                     ; preds = %167, %88
  %169 = load i32* %2, align 4
  %170 = load i32* %3, align 4
  %171 = load i8** %4, align 8
  %172 = load i32* %5, align 4
  %173 = load i32* %6, align 4
  %174 = load i32* %7, align 4
  %175 = call i32 @trymove(i32 %169, i32 %170, i8* %171, i32 %172, i32 %173, i32 %174)
  %176 = icmp ne i32 %175, 0
  br i1 %176, label %203, label %177

; <label>:177                                     ; preds = %168
  %178 = load i32* %11, align 4
  %179 = icmp ne i32 %178, 0
  br i1 %179, label %181, label %180

; <label>:180                                     ; preds = %177
  store i32 0, i32* %1
  br label %236

; <label>:181                                     ; preds = %177
  %182 = load i32* %2, align 4
  %183 = load i32* %3, align 4
  %184 = load i8** %4, align 8
  %185 = load i32* %6, align 4
  %186 = load i32* %7, align 4
  %187 = call i32 @tryko(i32 %182, i32 %183, i8* %184, i32 %185, i32 %186)
  %188 = icmp ne i32 %187, 0
  br i1 %188, label %190, label %189

; <label>:189                                     ; preds = %181
  store i32 0, i32* %1
  br label %236

; <label>:190                                     ; preds = %181
  %191 = load i32** %10, align 8
  store i32 1, i32* %191, align 4
  %192 = load i32* %6, align 4
  %193 = icmp eq i32 %192, 0
  br i1 %193, label %197, label %194

; <label>:194                                     ; preds = %190
  %195 = load i32* %6, align 4
  %196 = icmp eq i32 %195, 6
  br i1 %196, label %197, label %202

; <label>:197                                     ; preds = %194, %190
  %198 = load i32* %3, align 4
  %199 = load i32** %8, align 8
  store i32 %198, i32* %199, align 4
  %200 = load i32* %kpos, align 4
  %201 = load i32** %9, align 8
  store i32 %200, i32* %201, align 4
  store i32 1, i32* %1
  br label %236

; <label>:202                                     ; preds = %194
  br label %203

; <label>:203                                     ; preds = %202, %168
  %204 = load i32* %ko_move, align 4
  %205 = icmp ne i32 %204, 0
  br i1 %205, label %207, label %206

; <label>:206                                     ; preds = %203
  store i32 1, i32* %1
  br label %236

; <label>:207                                     ; preds = %203
  %208 = load i32* %6, align 4
  %209 = load i32* %other, align 4
  %210 = icmp eq i32 %208, %209
  br i1 %210, label %211, label %219

; <label>:211                                     ; preds = %207
  %212 = load i32* %3, align 4
  %213 = icmp eq i32 %212, 1
  br i1 %213, label %214, label %216

; <label>:214                                     ; preds = %211
  %215 = load i32** %8, align 8
  store i32 5, i32* %215, align 4
  br label %218

; <label>:216                                     ; preds = %211
  %217 = load i32** %8, align 8
  store i32 4, i32* %217, align 4
  br label %218

; <label>:218                                     ; preds = %216, %214
  br label %235

; <label>:219                                     ; preds = %207
  %220 = load i32* %6, align 4
  %221 = load i32* %3, align 4
  %222 = icmp eq i32 %220, %221
  br i1 %222, label %223, label %226

; <label>:223                                     ; preds = %219
  %224 = load i32* %kpos, align 4
  %225 = load i32** %9, align 8
  store i32 %224, i32* %225, align 4
  br label %234

; <label>:226                                     ; preds = %219
  %227 = load i32* %previous_board_ko_pos, align 4
  %228 = icmp ne i32 %227, 0
  br i1 %228, label %229, label %233

; <label>:229                                     ; preds = %226
  %230 = load i32** %8, align 8
  store i32 6, i32* %230, align 4
  %231 = load i32* %previous_board_ko_pos, align 4
  %232 = load i32** %9, align 8
  store i32 %231, i32* %232, align 4
  br label %233

; <label>:233                                     ; preds = %229, %226
  br label %234

; <label>:234                                     ; preds = %233, %223
  br label %235

; <label>:235                                     ; preds = %234, %218
  store i32 1, i32* %1
  br label %236

; <label>:236                                     ; preds = %235, %206, %197, %189, %180, %165, %133, %104, %97
  %237 = load i32* %1
  ret i32 %237
}

; Function Attrs: nounwind uwtable
define i32 @is_ko(i32 %pos, i32 %color, i32* %ko_pos) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32*, align 8
  %other = alloca i32, align 4
  %captures = alloca i32, align 4
  %kpos = alloca i32, align 4
  store i32 %pos, i32* %2, align 4
  store i32 %color, i32* %3, align 4
  store i32* %ko_pos, i32** %4, align 8
  %5 = load i32* %3, align 4
  %6 = sub nsw i32 3, %5
  store i32 %6, i32* %other, align 4
  store i32 0, i32* %captures, align 4
  store i32 0, i32* %kpos, align 4
  %7 = load i32* %2, align 4
  %8 = icmp ult i32 %7, 421
  br i1 %8, label %9, label %17

; <label>:9                                       ; preds = %0
  %10 = load i32* %2, align 4
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %11
  %13 = load i8* %12, align 1
  %14 = zext i8 %13 to i32
  %15 = icmp ne i32 %14, 3
  br i1 %15, label %16, label %17

; <label>:16                                      ; preds = %9
  br label %24

; <label>:17                                      ; preds = %9, %0
  %18 = load i32* %2, align 4
  %19 = sdiv i32 %18, 20
  %20 = sub nsw i32 %19, 1
  %21 = load i32* %2, align 4
  %22 = srem i32 %21, 20
  %23 = sub nsw i32 %22, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 2501, i8* getelementptr inbounds ([15 x i8]* @.str19, i32 0, i32 0), i32 %20, i32 %23)
  br label %24

; <label>:24                                      ; preds = %17, %16
  %25 = load i32* %3, align 4
  %26 = icmp eq i32 %25, 1
  br i1 %26, label %30, label %27

; <label>:27                                      ; preds = %24
  %28 = load i32* %3, align 4
  %29 = icmp eq i32 %28, 2
  br i1 %29, label %30, label %31

; <label>:30                                      ; preds = %27, %24
  br label %38

; <label>:31                                      ; preds = %27
  %32 = load i32* %2, align 4
  %33 = sdiv i32 %32, 20
  %34 = sub nsw i32 %33, 1
  %35 = load i32* %2, align 4
  %36 = srem i32 %35, 20
  %37 = sub nsw i32 %36, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 2502, i8* getelementptr inbounds ([33 x i8]* @.str22, i32 0, i32 0), i32 %34, i32 %37)
  br label %38

; <label>:38                                      ; preds = %31, %30
  %39 = load i32* %2, align 4
  %40 = add nsw i32 %39, 20
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %41
  %43 = load i8* %42, align 1
  %44 = zext i8 %43 to i32
  %45 = icmp ne i32 %44, 3
  br i1 %45, label %46, label %87

; <label>:46                                      ; preds = %38
  %47 = load i32* %2, align 4
  %48 = add nsw i32 %47, 20
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %49
  %51 = load i8* %50, align 1
  %52 = zext i8 %51 to i32
  %53 = load i32* %other, align 4
  %54 = icmp ne i32 %52, %53
  br i1 %54, label %55, label %56

; <label>:55                                      ; preds = %46
  store i32 0, i32* %1
  br label %245

; <label>:56                                      ; preds = %46
  %57 = load i32* %2, align 4
  %58 = add nsw i32 %57, 20
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %59
  %61 = load i32* %60, align 4
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %62
  %64 = getelementptr inbounds %struct.string_data* %63, i32 0, i32 3
  %65 = load i32* %64, align 4
  %66 = icmp eq i32 %65, 1
  br i1 %66, label %67, label %85

; <label>:67                                      ; preds = %56
  %68 = load i32* %2, align 4
  %69 = add nsw i32 %68, 20
  store i32 %69, i32* %kpos, align 4
  %70 = load i32* %2, align 4
  %71 = add nsw i32 %70, 20
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %72
  %74 = load i32* %73, align 4
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %75
  %77 = getelementptr inbounds %struct.string_data* %76, i32 0, i32 1
  %78 = load i32* %77, align 4
  %79 = load i32* %captures, align 4
  %80 = add nsw i32 %79, %78
  store i32 %80, i32* %captures, align 4
  %81 = load i32* %captures, align 4
  %82 = icmp sgt i32 %81, 1
  br i1 %82, label %83, label %84

; <label>:83                                      ; preds = %67
  store i32 0, i32* %1
  br label %245

; <label>:84                                      ; preds = %67
  br label %85

; <label>:85                                      ; preds = %84, %56
  br label %86

; <label>:86                                      ; preds = %85
  br label %87

; <label>:87                                      ; preds = %86, %38
  %88 = load i32* %2, align 4
  %89 = sub nsw i32 %88, 1
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %90
  %92 = load i8* %91, align 1
  %93 = zext i8 %92 to i32
  %94 = icmp ne i32 %93, 3
  br i1 %94, label %95, label %136

; <label>:95                                      ; preds = %87
  %96 = load i32* %2, align 4
  %97 = sub nsw i32 %96, 1
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %98
  %100 = load i8* %99, align 1
  %101 = zext i8 %100 to i32
  %102 = load i32* %other, align 4
  %103 = icmp ne i32 %101, %102
  br i1 %103, label %104, label %105

; <label>:104                                     ; preds = %95
  store i32 0, i32* %1
  br label %245

; <label>:105                                     ; preds = %95
  %106 = load i32* %2, align 4
  %107 = sub nsw i32 %106, 1
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %108
  %110 = load i32* %109, align 4
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %111
  %113 = getelementptr inbounds %struct.string_data* %112, i32 0, i32 3
  %114 = load i32* %113, align 4
  %115 = icmp eq i32 %114, 1
  br i1 %115, label %116, label %134

; <label>:116                                     ; preds = %105
  %117 = load i32* %2, align 4
  %118 = sub nsw i32 %117, 1
  store i32 %118, i32* %kpos, align 4
  %119 = load i32* %2, align 4
  %120 = sub nsw i32 %119, 1
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %121
  %123 = load i32* %122, align 4
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %124
  %126 = getelementptr inbounds %struct.string_data* %125, i32 0, i32 1
  %127 = load i32* %126, align 4
  %128 = load i32* %captures, align 4
  %129 = add nsw i32 %128, %127
  store i32 %129, i32* %captures, align 4
  %130 = load i32* %captures, align 4
  %131 = icmp sgt i32 %130, 1
  br i1 %131, label %132, label %133

; <label>:132                                     ; preds = %116
  store i32 0, i32* %1
  br label %245

; <label>:133                                     ; preds = %116
  br label %134

; <label>:134                                     ; preds = %133, %105
  br label %135

; <label>:135                                     ; preds = %134
  br label %136

; <label>:136                                     ; preds = %135, %87
  %137 = load i32* %2, align 4
  %138 = sub nsw i32 %137, 20
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %139
  %141 = load i8* %140, align 1
  %142 = zext i8 %141 to i32
  %143 = icmp ne i32 %142, 3
  br i1 %143, label %144, label %185

; <label>:144                                     ; preds = %136
  %145 = load i32* %2, align 4
  %146 = sub nsw i32 %145, 20
  %147 = sext i32 %146 to i64
  %148 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %147
  %149 = load i8* %148, align 1
  %150 = zext i8 %149 to i32
  %151 = load i32* %other, align 4
  %152 = icmp ne i32 %150, %151
  br i1 %152, label %153, label %154

; <label>:153                                     ; preds = %144
  store i32 0, i32* %1
  br label %245

; <label>:154                                     ; preds = %144
  %155 = load i32* %2, align 4
  %156 = sub nsw i32 %155, 20
  %157 = sext i32 %156 to i64
  %158 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %157
  %159 = load i32* %158, align 4
  %160 = sext i32 %159 to i64
  %161 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %160
  %162 = getelementptr inbounds %struct.string_data* %161, i32 0, i32 3
  %163 = load i32* %162, align 4
  %164 = icmp eq i32 %163, 1
  br i1 %164, label %165, label %183

; <label>:165                                     ; preds = %154
  %166 = load i32* %2, align 4
  %167 = sub nsw i32 %166, 20
  store i32 %167, i32* %kpos, align 4
  %168 = load i32* %2, align 4
  %169 = sub nsw i32 %168, 20
  %170 = sext i32 %169 to i64
  %171 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %170
  %172 = load i32* %171, align 4
  %173 = sext i32 %172 to i64
  %174 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %173
  %175 = getelementptr inbounds %struct.string_data* %174, i32 0, i32 1
  %176 = load i32* %175, align 4
  %177 = load i32* %captures, align 4
  %178 = add nsw i32 %177, %176
  store i32 %178, i32* %captures, align 4
  %179 = load i32* %captures, align 4
  %180 = icmp sgt i32 %179, 1
  br i1 %180, label %181, label %182

; <label>:181                                     ; preds = %165
  store i32 0, i32* %1
  br label %245

; <label>:182                                     ; preds = %165
  br label %183

; <label>:183                                     ; preds = %182, %154
  br label %184

; <label>:184                                     ; preds = %183
  br label %185

; <label>:185                                     ; preds = %184, %136
  %186 = load i32* %2, align 4
  %187 = add nsw i32 %186, 1
  %188 = sext i32 %187 to i64
  %189 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %188
  %190 = load i8* %189, align 1
  %191 = zext i8 %190 to i32
  %192 = icmp ne i32 %191, 3
  br i1 %192, label %193, label %234

; <label>:193                                     ; preds = %185
  %194 = load i32* %2, align 4
  %195 = add nsw i32 %194, 1
  %196 = sext i32 %195 to i64
  %197 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %196
  %198 = load i8* %197, align 1
  %199 = zext i8 %198 to i32
  %200 = load i32* %other, align 4
  %201 = icmp ne i32 %199, %200
  br i1 %201, label %202, label %203

; <label>:202                                     ; preds = %193
  store i32 0, i32* %1
  br label %245

; <label>:203                                     ; preds = %193
  %204 = load i32* %2, align 4
  %205 = add nsw i32 %204, 1
  %206 = sext i32 %205 to i64
  %207 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %206
  %208 = load i32* %207, align 4
  %209 = sext i32 %208 to i64
  %210 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %209
  %211 = getelementptr inbounds %struct.string_data* %210, i32 0, i32 3
  %212 = load i32* %211, align 4
  %213 = icmp eq i32 %212, 1
  br i1 %213, label %214, label %232

; <label>:214                                     ; preds = %203
  %215 = load i32* %2, align 4
  %216 = add nsw i32 %215, 1
  store i32 %216, i32* %kpos, align 4
  %217 = load i32* %2, align 4
  %218 = add nsw i32 %217, 1
  %219 = sext i32 %218 to i64
  %220 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %219
  %221 = load i32* %220, align 4
  %222 = sext i32 %221 to i64
  %223 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %222
  %224 = getelementptr inbounds %struct.string_data* %223, i32 0, i32 1
  %225 = load i32* %224, align 4
  %226 = load i32* %captures, align 4
  %227 = add nsw i32 %226, %225
  store i32 %227, i32* %captures, align 4
  %228 = load i32* %captures, align 4
  %229 = icmp sgt i32 %228, 1
  br i1 %229, label %230, label %231

; <label>:230                                     ; preds = %214
  store i32 0, i32* %1
  br label %245

; <label>:231                                     ; preds = %214
  br label %232

; <label>:232                                     ; preds = %231, %203
  br label %233

; <label>:233                                     ; preds = %232
  br label %234

; <label>:234                                     ; preds = %233, %185
  %235 = load i32* %captures, align 4
  %236 = icmp eq i32 %235, 1
  br i1 %236, label %237, label %244

; <label>:237                                     ; preds = %234
  %238 = load i32** %4, align 8
  %239 = icmp ne i32* %238, null
  br i1 %239, label %240, label %243

; <label>:240                                     ; preds = %237
  %241 = load i32* %kpos, align 4
  %242 = load i32** %4, align 8
  store i32 %241, i32* %242, align 4
  br label %243

; <label>:243                                     ; preds = %240, %237
  store i32 1, i32* %1
  br label %245

; <label>:244                                     ; preds = %234
  store i32 0, i32* %1
  br label %245

; <label>:245                                     ; preds = %244, %243, %230, %202, %181, %153, %132, %104, %83, %55
  %246 = load i32* %1
  ret i32 %246
}

; Function Attrs: nounwind uwtable
define i32 @is_edge_vertex(i32 %pos) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %pos, i32* %2, align 4
  %3 = load i32* %2, align 4
  %4 = icmp ult i32 %3, 421
  br i1 %4, label %5, label %13

; <label>:5                                       ; preds = %0
  %6 = load i32* %2, align 4
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %7
  %9 = load i8* %8, align 1
  %10 = zext i8 %9 to i32
  %11 = icmp ne i32 %10, 3
  br i1 %11, label %12, label %13

; <label>:12                                      ; preds = %5
  br label %20

; <label>:13                                      ; preds = %5, %0
  %14 = load i32* %2, align 4
  %15 = sdiv i32 %14, 20
  %16 = sub nsw i32 %15, 1
  %17 = load i32* %2, align 4
  %18 = srem i32 %17, 20
  %19 = sub nsw i32 %18, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 1309, i8* getelementptr inbounds ([15 x i8]* @.str19, i32 0, i32 0), i32 %16, i32 %19)
  br label %20

; <label>:20                                      ; preds = %13, %12
  %21 = load i32* %2, align 4
  %22 = add nsw i32 %21, 20
  %23 = sub nsw i32 %22, 1
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %24
  %26 = load i8* %25, align 1
  %27 = zext i8 %26 to i32
  %28 = icmp ne i32 %27, 3
  br i1 %28, label %29, label %38

; <label>:29                                      ; preds = %20
  %30 = load i32* %2, align 4
  %31 = sub nsw i32 %30, 20
  %32 = add nsw i32 %31, 1
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %33
  %35 = load i8* %34, align 1
  %36 = zext i8 %35 to i32
  %37 = icmp ne i32 %36, 3
  br i1 %37, label %39, label %38

; <label>:38                                      ; preds = %29, %20
  store i32 1, i32* %1
  br label %40

; <label>:39                                      ; preds = %29
  store i32 0, i32* %1
  br label %40

; <label>:40                                      ; preds = %39, %38
  %41 = load i32* %1
  ret i32 %41
}

; Function Attrs: nounwind uwtable
define i32 @countlib(i32 %str) #0 {
  %1 = alloca i32, align 4
  store i32 %str, i32* %1, align 4
  %2 = load i32* %1, align 4
  %3 = sext i32 %2 to i64
  %4 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %3
  %5 = load i8* %4, align 1
  %6 = zext i8 %5 to i32
  %7 = icmp eq i32 %6, 1
  br i1 %7, label %15, label %8

; <label>:8                                       ; preds = %0
  %9 = load i32* %1, align 4
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %10
  %12 = load i8* %11, align 1
  %13 = zext i8 %12 to i32
  %14 = icmp eq i32 %13, 2
  br i1 %14, label %15, label %16

; <label>:15                                      ; preds = %8, %0
  br label %23

; <label>:16                                      ; preds = %8
  %17 = load i32* %1, align 4
  %18 = sdiv i32 %17, 20
  %19 = sub nsw i32 %18, 1
  %20 = load i32* %1, align 4
  %21 = srem i32 %20, 20
  %22 = sub nsw i32 %21, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 1325, i8* getelementptr inbounds ([21 x i8]* @.str26, i32 0, i32 0), i32 %19, i32 %22)
  br label %23

; <label>:23                                      ; preds = %16, %15
  %24 = load i32* %1, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %25
  %27 = load i32* %26, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %28
  %30 = getelementptr inbounds %struct.string_data* %29, i32 0, i32 3
  %31 = load i32* %30, align 4
  ret i32 %31
}

; Function Attrs: nounwind uwtable
define i32 @findlib(i32 %str, i32 %maxlib, i32* %libs) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32*, align 8
  %k = alloca i32, align 4
  %liberties = alloca i32, align 4
  %s = alloca i32, align 4
  %pos = alloca i32, align 4
  store i32 %str, i32* %1, align 4
  store i32 %maxlib, i32* %2, align 4
  store i32* %libs, i32** %3, align 8
  %4 = load i32* %1, align 4
  %5 = sext i32 %4 to i64
  %6 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %5
  %7 = load i8* %6, align 1
  %8 = zext i8 %7 to i32
  %9 = icmp eq i32 %8, 1
  br i1 %9, label %17, label %10

; <label>:10                                      ; preds = %0
  %11 = load i32* %1, align 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %12
  %14 = load i8* %13, align 1
  %15 = zext i8 %14 to i32
  %16 = icmp eq i32 %15, 2
  br i1 %16, label %17, label %18

; <label>:17                                      ; preds = %10, %0
  br label %25

; <label>:18                                      ; preds = %10
  %19 = load i32* %1, align 4
  %20 = sdiv i32 %19, 20
  %21 = sub nsw i32 %20, 1
  %22 = load i32* %1, align 4
  %23 = srem i32 %22, 20
  %24 = sub nsw i32 %23, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 1348, i8* getelementptr inbounds ([21 x i8]* @.str26, i32 0, i32 0), i32 %21, i32 %24)
  br label %25

; <label>:25                                      ; preds = %18, %17
  %26 = load i32** %3, align 8
  %27 = icmp ne i32* %26, null
  br i1 %27, label %28, label %29

; <label>:28                                      ; preds = %25
  br label %36

; <label>:29                                      ; preds = %25
  %30 = load i32* %1, align 4
  %31 = sdiv i32 %30, 20
  %32 = sub nsw i32 %31, 1
  %33 = load i32* %1, align 4
  %34 = srem i32 %33, 20
  %35 = sub nsw i32 %34, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 1349, i8* getelementptr inbounds ([13 x i8]* @.str27, i32 0, i32 0), i32 %32, i32 %35)
  br label %36

; <label>:36                                      ; preds = %29, %28
  %37 = load i32* %1, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %38
  %40 = load i32* %39, align 4
  store i32 %40, i32* %s, align 4
  %41 = load i32* %s, align 4
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %42
  %44 = getelementptr inbounds %struct.string_data* %43, i32 0, i32 3
  %45 = load i32* %44, align 4
  store i32 %45, i32* %liberties, align 4
  %46 = load i32* %liberties, align 4
  %47 = icmp sle i32 %46, 20
  br i1 %47, label %51, label %48

; <label>:48                                      ; preds = %36
  %49 = load i32* %2, align 4
  %50 = icmp sle i32 %49, 20
  br i1 %50, label %51, label %79

; <label>:51                                      ; preds = %48, %36
  store i32 0, i32* %k, align 4
  br label %52

; <label>:52                                      ; preds = %75, %51
  %53 = load i32* %k, align 4
  %54 = load i32* %2, align 4
  %55 = icmp slt i32 %53, %54
  br i1 %55, label %56, label %60

; <label>:56                                      ; preds = %52
  %57 = load i32* %k, align 4
  %58 = load i32* %liberties, align 4
  %59 = icmp slt i32 %57, %58
  br label %60

; <label>:60                                      ; preds = %56, %52
  %61 = phi i1 [ false, %52 ], [ %59, %56 ]
  br i1 %61, label %62, label %78

; <label>:62                                      ; preds = %60
  %63 = load i32* %k, align 4
  %64 = sext i32 %63 to i64
  %65 = load i32* %s, align 4
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %66
  %68 = getelementptr inbounds %struct.string_data* %67, i32 0, i32 4
  %69 = getelementptr inbounds [20 x i32]* %68, i32 0, i64 %64
  %70 = load i32* %69, align 4
  %71 = load i32* %k, align 4
  %72 = sext i32 %71 to i64
  %73 = load i32** %3, align 8
  %74 = getelementptr inbounds i32* %73, i64 %72
  store i32 %70, i32* %74, align 4
  br label %75

; <label>:75                                      ; preds = %62
  %76 = load i32* %k, align 4
  %77 = add nsw i32 %76, 1
  store i32 %77, i32* %k, align 4
  br label %52

; <label>:78                                      ; preds = %60
  br label %240

; <label>:79                                      ; preds = %48
  %80 = load i32* @liberty_mark, align 4
  %81 = add nsw i32 %80, 1
  store i32 %81, i32* @liberty_mark, align 4
  store i32 0, i32* %k, align 4
  %82 = load i32* %s, align 4
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %83
  %85 = getelementptr inbounds %struct.string_data* %84, i32 0, i32 2
  %86 = load i32* %85, align 4
  store i32 %86, i32* %pos, align 4
  br label %87

; <label>:87                                      ; preds = %234, %79
  %88 = load i32* %k, align 4
  %89 = load i32* %2, align 4
  %90 = icmp slt i32 %88, %89
  br i1 %90, label %91, label %95

; <label>:91                                      ; preds = %87
  %92 = load i32* %k, align 4
  %93 = load i32* %liberties, align 4
  %94 = icmp slt i32 %92, %93
  br label %95

; <label>:95                                      ; preds = %91, %87
  %96 = phi i1 [ false, %87 ], [ %94, %91 ]
  br i1 %96, label %97, label %239

; <label>:97                                      ; preds = %95
  %98 = load i32* %pos, align 4
  %99 = add nsw i32 %98, 20
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %100
  %102 = load i8* %101, align 1
  %103 = zext i8 %102 to i32
  %104 = icmp eq i32 %103, 0
  br i1 %104, label %105, label %131

; <label>:105                                     ; preds = %97
  %106 = load i32* %pos, align 4
  %107 = add nsw i32 %106, 20
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %108
  %110 = load i32* %109, align 4
  %111 = load i32* @liberty_mark, align 4
  %112 = icmp ne i32 %110, %111
  br i1 %112, label %113, label %131

; <label>:113                                     ; preds = %105
  %114 = load i32* %pos, align 4
  %115 = add nsw i32 %114, 20
  %116 = load i32* %k, align 4
  %117 = add nsw i32 %116, 1
  store i32 %117, i32* %k, align 4
  %118 = sext i32 %116 to i64
  %119 = load i32** %3, align 8
  %120 = getelementptr inbounds i32* %119, i64 %118
  store i32 %115, i32* %120, align 4
  %121 = load i32* @liberty_mark, align 4
  %122 = load i32* %pos, align 4
  %123 = add nsw i32 %122, 20
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %124
  store i32 %121, i32* %125, align 4
  %126 = load i32* %k, align 4
  %127 = load i32* %2, align 4
  %128 = icmp sge i32 %126, %127
  br i1 %128, label %129, label %130

; <label>:129                                     ; preds = %113
  br label %239

; <label>:130                                     ; preds = %113
  br label %131

; <label>:131                                     ; preds = %130, %105, %97
  %132 = load i32* %pos, align 4
  %133 = sub nsw i32 %132, 1
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %134
  %136 = load i8* %135, align 1
  %137 = zext i8 %136 to i32
  %138 = icmp eq i32 %137, 0
  br i1 %138, label %139, label %165

; <label>:139                                     ; preds = %131
  %140 = load i32* %pos, align 4
  %141 = sub nsw i32 %140, 1
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %142
  %144 = load i32* %143, align 4
  %145 = load i32* @liberty_mark, align 4
  %146 = icmp ne i32 %144, %145
  br i1 %146, label %147, label %165

; <label>:147                                     ; preds = %139
  %148 = load i32* %pos, align 4
  %149 = sub nsw i32 %148, 1
  %150 = load i32* %k, align 4
  %151 = add nsw i32 %150, 1
  store i32 %151, i32* %k, align 4
  %152 = sext i32 %150 to i64
  %153 = load i32** %3, align 8
  %154 = getelementptr inbounds i32* %153, i64 %152
  store i32 %149, i32* %154, align 4
  %155 = load i32* @liberty_mark, align 4
  %156 = load i32* %pos, align 4
  %157 = sub nsw i32 %156, 1
  %158 = sext i32 %157 to i64
  %159 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %158
  store i32 %155, i32* %159, align 4
  %160 = load i32* %k, align 4
  %161 = load i32* %2, align 4
  %162 = icmp sge i32 %160, %161
  br i1 %162, label %163, label %164

; <label>:163                                     ; preds = %147
  br label %239

; <label>:164                                     ; preds = %147
  br label %165

; <label>:165                                     ; preds = %164, %139, %131
  %166 = load i32* %pos, align 4
  %167 = sub nsw i32 %166, 20
  %168 = sext i32 %167 to i64
  %169 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %168
  %170 = load i8* %169, align 1
  %171 = zext i8 %170 to i32
  %172 = icmp eq i32 %171, 0
  br i1 %172, label %173, label %199

; <label>:173                                     ; preds = %165
  %174 = load i32* %pos, align 4
  %175 = sub nsw i32 %174, 20
  %176 = sext i32 %175 to i64
  %177 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %176
  %178 = load i32* %177, align 4
  %179 = load i32* @liberty_mark, align 4
  %180 = icmp ne i32 %178, %179
  br i1 %180, label %181, label %199

; <label>:181                                     ; preds = %173
  %182 = load i32* %pos, align 4
  %183 = sub nsw i32 %182, 20
  %184 = load i32* %k, align 4
  %185 = add nsw i32 %184, 1
  store i32 %185, i32* %k, align 4
  %186 = sext i32 %184 to i64
  %187 = load i32** %3, align 8
  %188 = getelementptr inbounds i32* %187, i64 %186
  store i32 %183, i32* %188, align 4
  %189 = load i32* @liberty_mark, align 4
  %190 = load i32* %pos, align 4
  %191 = sub nsw i32 %190, 20
  %192 = sext i32 %191 to i64
  %193 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %192
  store i32 %189, i32* %193, align 4
  %194 = load i32* %k, align 4
  %195 = load i32* %2, align 4
  %196 = icmp sge i32 %194, %195
  br i1 %196, label %197, label %198

; <label>:197                                     ; preds = %181
  br label %239

; <label>:198                                     ; preds = %181
  br label %199

; <label>:199                                     ; preds = %198, %173, %165
  %200 = load i32* %pos, align 4
  %201 = add nsw i32 %200, 1
  %202 = sext i32 %201 to i64
  %203 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %202
  %204 = load i8* %203, align 1
  %205 = zext i8 %204 to i32
  %206 = icmp eq i32 %205, 0
  br i1 %206, label %207, label %233

; <label>:207                                     ; preds = %199
  %208 = load i32* %pos, align 4
  %209 = add nsw i32 %208, 1
  %210 = sext i32 %209 to i64
  %211 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %210
  %212 = load i32* %211, align 4
  %213 = load i32* @liberty_mark, align 4
  %214 = icmp ne i32 %212, %213
  br i1 %214, label %215, label %233

; <label>:215                                     ; preds = %207
  %216 = load i32* %pos, align 4
  %217 = add nsw i32 %216, 1
  %218 = load i32* %k, align 4
  %219 = add nsw i32 %218, 1
  store i32 %219, i32* %k, align 4
  %220 = sext i32 %218 to i64
  %221 = load i32** %3, align 8
  %222 = getelementptr inbounds i32* %221, i64 %220
  store i32 %217, i32* %222, align 4
  %223 = load i32* @liberty_mark, align 4
  %224 = load i32* %pos, align 4
  %225 = add nsw i32 %224, 1
  %226 = sext i32 %225 to i64
  %227 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %226
  store i32 %223, i32* %227, align 4
  %228 = load i32* %k, align 4
  %229 = load i32* %2, align 4
  %230 = icmp sge i32 %228, %229
  br i1 %230, label %231, label %232

; <label>:231                                     ; preds = %215
  br label %239

; <label>:232                                     ; preds = %215
  br label %233

; <label>:233                                     ; preds = %232, %207, %199
  br label %234

; <label>:234                                     ; preds = %233
  %235 = load i32* %pos, align 4
  %236 = sext i32 %235 to i64
  %237 = getelementptr inbounds [400 x i32]* @next_stone, i32 0, i64 %236
  %238 = load i32* %237, align 4
  store i32 %238, i32* %pos, align 4
  br label %87

; <label>:239                                     ; preds = %231, %197, %163, %129, %95
  br label %240

; <label>:240                                     ; preds = %239, %78
  %241 = load i32* %liberties, align 4
  ret i32 %241
}

; Function Attrs: nounwind uwtable
define i32 @fastlib(i32 %pos, i32 %color, i32 %ignore_captures) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %ally1 = alloca i32, align 4
  %ally2 = alloca i32, align 4
  %fast_liberties = alloca i32, align 4
  %k = alloca i32, align 4
  %neighbor = alloca i32, align 4
  %neighbor_size = alloca i32, align 4
  store i32 %pos, i32* %2, align 4
  store i32 %color, i32* %3, align 4
  store i32 %ignore_captures, i32* %4, align 4
  store i32 -1, i32* %ally1, align 4
  store i32 -1, i32* %ally2, align 4
  store i32 0, i32* %fast_liberties, align 4
  %5 = load i32* %2, align 4
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %6
  %8 = load i8* %7, align 1
  %9 = zext i8 %8 to i32
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %12

; <label>:11                                      ; preds = %0
  br label %19

; <label>:12                                      ; preds = %0
  %13 = load i32* %2, align 4
  %14 = sdiv i32 %13, 20
  %15 = sub nsw i32 %14, 1
  %16 = load i32* %2, align 4
  %17 = srem i32 %16, 20
  %18 = sub nsw i32 %17, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 1435, i8* getelementptr inbounds ([20 x i8]* @.str20, i32 0, i32 0), i32 %15, i32 %18)
  br label %19

; <label>:19                                      ; preds = %12, %11
  %20 = load i32* %3, align 4
  %21 = icmp eq i32 %20, 1
  br i1 %21, label %25, label %22

; <label>:22                                      ; preds = %19
  %23 = load i32* %3, align 4
  %24 = icmp eq i32 %23, 2
  br i1 %24, label %25, label %26

; <label>:25                                      ; preds = %22, %19
  br label %33

; <label>:26                                      ; preds = %22
  %27 = load i32* %2, align 4
  %28 = sdiv i32 %27, 20
  %29 = sub nsw i32 %28, 1
  %30 = load i32* %2, align 4
  %31 = srem i32 %30, 20
  %32 = sub nsw i32 %31, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 1436, i8* getelementptr inbounds ([16 x i8]* @.str28, i32 0, i32 0), i32 %29, i32 %32)
  br label %33

; <label>:33                                      ; preds = %26, %25
  %34 = load i32* %2, align 4
  %35 = add nsw i32 %34, 20
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %36
  %38 = load i8* %37, align 1
  %39 = zext i8 %38 to i32
  %40 = load i32* %3, align 4
  %41 = icmp eq i32 %39, %40
  br i1 %41, label %42, label %158

; <label>:42                                      ; preds = %33
  %43 = load i32* %2, align 4
  %44 = add nsw i32 %43, 20
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %45
  %47 = load i32* %46, align 4
  store i32 %47, i32* %ally1, align 4
  %48 = load i32* %2, align 4
  %49 = sub nsw i32 %48, 1
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %50
  %52 = load i8* %51, align 1
  %53 = zext i8 %52 to i32
  %54 = load i32* %3, align 4
  %55 = icmp eq i32 %53, %54
  br i1 %55, label %56, label %96

; <label>:56                                      ; preds = %42
  %57 = load i32* %2, align 4
  %58 = sub nsw i32 %57, 1
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %59
  %61 = load i32* %60, align 4
  %62 = load i32* %ally1, align 4
  %63 = icmp ne i32 %61, %62
  br i1 %63, label %64, label %96

; <label>:64                                      ; preds = %56
  %65 = load i32* %2, align 4
  %66 = sub nsw i32 %65, 1
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %67
  %69 = load i32* %68, align 4
  store i32 %69, i32* %ally2, align 4
  %70 = load i32* %2, align 4
  %71 = sub nsw i32 %70, 20
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %72
  %74 = load i8* %73, align 1
  %75 = zext i8 %74 to i32
  %76 = load i32* %3, align 4
  %77 = icmp eq i32 %75, %76
  br i1 %77, label %78, label %95

; <label>:78                                      ; preds = %64
  %79 = load i32* %2, align 4
  %80 = sub nsw i32 %79, 20
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %81
  %83 = load i32* %82, align 4
  %84 = load i32* %ally1, align 4
  %85 = icmp ne i32 %83, %84
  br i1 %85, label %86, label %95

; <label>:86                                      ; preds = %78
  %87 = load i32* %2, align 4
  %88 = sub nsw i32 %87, 20
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %89
  %91 = load i32* %90, align 4
  %92 = load i32* %ally2, align 4
  %93 = icmp ne i32 %91, %92
  br i1 %93, label %94, label %95

; <label>:94                                      ; preds = %86
  store i32 -1, i32* %1
  br label %1412

; <label>:95                                      ; preds = %86, %78, %64
  br label %120

; <label>:96                                      ; preds = %56, %42
  %97 = load i32* %2, align 4
  %98 = sub nsw i32 %97, 20
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %99
  %101 = load i8* %100, align 1
  %102 = zext i8 %101 to i32
  %103 = load i32* %3, align 4
  %104 = icmp eq i32 %102, %103
  br i1 %104, label %105, label %119

; <label>:105                                     ; preds = %96
  %106 = load i32* %2, align 4
  %107 = sub nsw i32 %106, 20
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %108
  %110 = load i32* %109, align 4
  %111 = load i32* %ally1, align 4
  %112 = icmp ne i32 %110, %111
  br i1 %112, label %113, label %119

; <label>:113                                     ; preds = %105
  %114 = load i32* %2, align 4
  %115 = sub nsw i32 %114, 20
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %116
  %118 = load i32* %117, align 4
  store i32 %118, i32* %ally2, align 4
  br label %119

; <label>:119                                     ; preds = %113, %105, %96
  br label %120

; <label>:120                                     ; preds = %119, %95
  %121 = load i32* %2, align 4
  %122 = add nsw i32 %121, 1
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %123
  %125 = load i8* %124, align 1
  %126 = zext i8 %125 to i32
  %127 = load i32* %3, align 4
  %128 = icmp eq i32 %126, %127
  br i1 %128, label %129, label %157

; <label>:129                                     ; preds = %120
  %130 = load i32* %2, align 4
  %131 = add nsw i32 %130, 1
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %132
  %134 = load i32* %133, align 4
  %135 = load i32* %ally1, align 4
  %136 = icmp ne i32 %134, %135
  br i1 %136, label %137, label %157

; <label>:137                                     ; preds = %129
  %138 = load i32* %ally2, align 4
  %139 = icmp slt i32 %138, 0
  br i1 %139, label %140, label %146

; <label>:140                                     ; preds = %137
  %141 = load i32* %2, align 4
  %142 = add nsw i32 %141, 1
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %143
  %145 = load i32* %144, align 4
  store i32 %145, i32* %ally2, align 4
  br label %156

; <label>:146                                     ; preds = %137
  %147 = load i32* %2, align 4
  %148 = add nsw i32 %147, 1
  %149 = sext i32 %148 to i64
  %150 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %149
  %151 = load i32* %150, align 4
  %152 = load i32* %ally2, align 4
  %153 = icmp ne i32 %151, %152
  br i1 %153, label %154, label %155

; <label>:154                                     ; preds = %146
  store i32 -1, i32* %1
  br label %1412

; <label>:155                                     ; preds = %146
  br label %156

; <label>:156                                     ; preds = %155, %140
  br label %157

; <label>:157                                     ; preds = %156, %129, %120
  br label %302

; <label>:158                                     ; preds = %33
  %159 = load i32* %2, align 4
  %160 = sub nsw i32 %159, 1
  %161 = sext i32 %160 to i64
  %162 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %161
  %163 = load i8* %162, align 1
  %164 = zext i8 %163 to i32
  %165 = load i32* %3, align 4
  %166 = icmp eq i32 %164, %165
  br i1 %166, label %167, label %246

; <label>:167                                     ; preds = %158
  %168 = load i32* %2, align 4
  %169 = sub nsw i32 %168, 1
  %170 = sext i32 %169 to i64
  %171 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %170
  %172 = load i32* %171, align 4
  store i32 %172, i32* %ally1, align 4
  %173 = load i32* %2, align 4
  %174 = sub nsw i32 %173, 20
  %175 = sext i32 %174 to i64
  %176 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %175
  %177 = load i8* %176, align 1
  %178 = zext i8 %177 to i32
  %179 = load i32* %3, align 4
  %180 = icmp eq i32 %178, %179
  br i1 %180, label %181, label %221

; <label>:181                                     ; preds = %167
  %182 = load i32* %2, align 4
  %183 = sub nsw i32 %182, 20
  %184 = sext i32 %183 to i64
  %185 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %184
  %186 = load i32* %185, align 4
  %187 = load i32* %ally1, align 4
  %188 = icmp ne i32 %186, %187
  br i1 %188, label %189, label %221

; <label>:189                                     ; preds = %181
  %190 = load i32* %2, align 4
  %191 = sub nsw i32 %190, 20
  %192 = sext i32 %191 to i64
  %193 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %192
  %194 = load i32* %193, align 4
  store i32 %194, i32* %ally2, align 4
  %195 = load i32* %2, align 4
  %196 = add nsw i32 %195, 1
  %197 = sext i32 %196 to i64
  %198 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %197
  %199 = load i8* %198, align 1
  %200 = zext i8 %199 to i32
  %201 = load i32* %3, align 4
  %202 = icmp eq i32 %200, %201
  br i1 %202, label %203, label %220

; <label>:203                                     ; preds = %189
  %204 = load i32* %2, align 4
  %205 = add nsw i32 %204, 1
  %206 = sext i32 %205 to i64
  %207 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %206
  %208 = load i32* %207, align 4
  %209 = load i32* %ally1, align 4
  %210 = icmp ne i32 %208, %209
  br i1 %210, label %211, label %220

; <label>:211                                     ; preds = %203
  %212 = load i32* %2, align 4
  %213 = add nsw i32 %212, 1
  %214 = sext i32 %213 to i64
  %215 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %214
  %216 = load i32* %215, align 4
  %217 = load i32* %ally2, align 4
  %218 = icmp ne i32 %216, %217
  br i1 %218, label %219, label %220

; <label>:219                                     ; preds = %211
  store i32 -1, i32* %1
  br label %1412

; <label>:220                                     ; preds = %211, %203, %189
  br label %245

; <label>:221                                     ; preds = %181, %167
  %222 = load i32* %2, align 4
  %223 = add nsw i32 %222, 1
  %224 = sext i32 %223 to i64
  %225 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %224
  %226 = load i8* %225, align 1
  %227 = zext i8 %226 to i32
  %228 = load i32* %3, align 4
  %229 = icmp eq i32 %227, %228
  br i1 %229, label %230, label %244

; <label>:230                                     ; preds = %221
  %231 = load i32* %2, align 4
  %232 = add nsw i32 %231, 1
  %233 = sext i32 %232 to i64
  %234 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %233
  %235 = load i32* %234, align 4
  %236 = load i32* %ally1, align 4
  %237 = icmp ne i32 %235, %236
  br i1 %237, label %238, label %244

; <label>:238                                     ; preds = %230
  %239 = load i32* %2, align 4
  %240 = add nsw i32 %239, 1
  %241 = sext i32 %240 to i64
  %242 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %241
  %243 = load i32* %242, align 4
  store i32 %243, i32* %ally2, align 4
  br label %244

; <label>:244                                     ; preds = %238, %230, %221
  br label %245

; <label>:245                                     ; preds = %244, %220
  br label %301

; <label>:246                                     ; preds = %158
  %247 = load i32* %2, align 4
  %248 = sub nsw i32 %247, 20
  %249 = sext i32 %248 to i64
  %250 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %249
  %251 = load i8* %250, align 1
  %252 = zext i8 %251 to i32
  %253 = load i32* %3, align 4
  %254 = icmp eq i32 %252, %253
  br i1 %254, label %255, label %284

; <label>:255                                     ; preds = %246
  %256 = load i32* %2, align 4
  %257 = sub nsw i32 %256, 20
  %258 = sext i32 %257 to i64
  %259 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %258
  %260 = load i32* %259, align 4
  store i32 %260, i32* %ally1, align 4
  %261 = load i32* %2, align 4
  %262 = add nsw i32 %261, 1
  %263 = sext i32 %262 to i64
  %264 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %263
  %265 = load i8* %264, align 1
  %266 = zext i8 %265 to i32
  %267 = load i32* %3, align 4
  %268 = icmp eq i32 %266, %267
  br i1 %268, label %269, label %283

; <label>:269                                     ; preds = %255
  %270 = load i32* %2, align 4
  %271 = add nsw i32 %270, 1
  %272 = sext i32 %271 to i64
  %273 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %272
  %274 = load i32* %273, align 4
  %275 = load i32* %ally1, align 4
  %276 = icmp ne i32 %274, %275
  br i1 %276, label %277, label %283

; <label>:277                                     ; preds = %269
  %278 = load i32* %2, align 4
  %279 = add nsw i32 %278, 1
  %280 = sext i32 %279 to i64
  %281 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %280
  %282 = load i32* %281, align 4
  store i32 %282, i32* %ally2, align 4
  br label %283

; <label>:283                                     ; preds = %277, %269, %255
  br label %300

; <label>:284                                     ; preds = %246
  %285 = load i32* %2, align 4
  %286 = add nsw i32 %285, 1
  %287 = sext i32 %286 to i64
  %288 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %287
  %289 = load i8* %288, align 1
  %290 = zext i8 %289 to i32
  %291 = load i32* %3, align 4
  %292 = icmp eq i32 %290, %291
  br i1 %292, label %293, label %299

; <label>:293                                     ; preds = %284
  %294 = load i32* %2, align 4
  %295 = add nsw i32 %294, 1
  %296 = sext i32 %295 to i64
  %297 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %296
  %298 = load i32* %297, align 4
  store i32 %298, i32* %ally1, align 4
  br label %299

; <label>:299                                     ; preds = %293, %284
  br label %300

; <label>:300                                     ; preds = %299, %283
  br label %301

; <label>:301                                     ; preds = %300, %245
  br label %302

; <label>:302                                     ; preds = %301, %157
  %303 = load i32* %4, align 4
  %304 = icmp ne i32 %303, 0
  br i1 %304, label %305, label %1166

; <label>:305                                     ; preds = %302
  %306 = load i32* %ally1, align 4
  %307 = icmp slt i32 %306, 0
  br i1 %307, label %308, label %353

; <label>:308                                     ; preds = %305
  %309 = load i32* %2, align 4
  %310 = add nsw i32 %309, 20
  %311 = sext i32 %310 to i64
  %312 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %311
  %313 = load i8* %312, align 1
  %314 = zext i8 %313 to i32
  %315 = icmp eq i32 %314, 0
  br i1 %315, label %316, label %319

; <label>:316                                     ; preds = %308
  %317 = load i32* %fast_liberties, align 4
  %318 = add nsw i32 %317, 1
  store i32 %318, i32* %fast_liberties, align 4
  br label %319

; <label>:319                                     ; preds = %316, %308
  %320 = load i32* %2, align 4
  %321 = sub nsw i32 %320, 1
  %322 = sext i32 %321 to i64
  %323 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %322
  %324 = load i8* %323, align 1
  %325 = zext i8 %324 to i32
  %326 = icmp eq i32 %325, 0
  br i1 %326, label %327, label %330

; <label>:327                                     ; preds = %319
  %328 = load i32* %fast_liberties, align 4
  %329 = add nsw i32 %328, 1
  store i32 %329, i32* %fast_liberties, align 4
  br label %330

; <label>:330                                     ; preds = %327, %319
  %331 = load i32* %2, align 4
  %332 = sub nsw i32 %331, 20
  %333 = sext i32 %332 to i64
  %334 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %333
  %335 = load i8* %334, align 1
  %336 = zext i8 %335 to i32
  %337 = icmp eq i32 %336, 0
  br i1 %337, label %338, label %341

; <label>:338                                     ; preds = %330
  %339 = load i32* %fast_liberties, align 4
  %340 = add nsw i32 %339, 1
  store i32 %340, i32* %fast_liberties, align 4
  br label %341

; <label>:341                                     ; preds = %338, %330
  %342 = load i32* %2, align 4
  %343 = add nsw i32 %342, 1
  %344 = sext i32 %343 to i64
  %345 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %344
  %346 = load i8* %345, align 1
  %347 = zext i8 %346 to i32
  %348 = icmp eq i32 %347, 0
  br i1 %348, label %349, label %352

; <label>:349                                     ; preds = %341
  %350 = load i32* %fast_liberties, align 4
  %351 = add nsw i32 %350, 1
  store i32 %351, i32* %fast_liberties, align 4
  br label %352

; <label>:352                                     ; preds = %349, %341
  br label %1165

; <label>:353                                     ; preds = %305
  %354 = load i32* %ally2, align 4
  %355 = icmp slt i32 %354, 0
  br i1 %355, label %356, label %637

; <label>:356                                     ; preds = %353
  %357 = load i32* %2, align 4
  %358 = add nsw i32 %357, 20
  %359 = sext i32 %358 to i64
  %360 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %359
  %361 = load i8* %360, align 1
  %362 = zext i8 %361 to i32
  %363 = icmp eq i32 %362, 0
  br i1 %363, label %364, label %424

; <label>:364                                     ; preds = %356
  %365 = load i32* %2, align 4
  %366 = add nsw i32 %365, 20
  %367 = add nsw i32 %366, 20
  %368 = sext i32 %367 to i64
  %369 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %368
  %370 = load i8* %369, align 1
  %371 = zext i8 %370 to i32
  %372 = load i32* %3, align 4
  %373 = icmp eq i32 %371, %372
  br i1 %373, label %374, label %383

; <label>:374                                     ; preds = %364
  %375 = load i32* %2, align 4
  %376 = add nsw i32 %375, 20
  %377 = add nsw i32 %376, 20
  %378 = sext i32 %377 to i64
  %379 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %378
  %380 = load i32* %379, align 4
  %381 = load i32* %ally1, align 4
  %382 = icmp eq i32 %380, %381
  br i1 %382, label %424, label %383

; <label>:383                                     ; preds = %374, %364
  %384 = load i32* %2, align 4
  %385 = add nsw i32 %384, 20
  %386 = sub nsw i32 %385, 1
  %387 = sext i32 %386 to i64
  %388 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %387
  %389 = load i8* %388, align 1
  %390 = zext i8 %389 to i32
  %391 = load i32* %3, align 4
  %392 = icmp eq i32 %390, %391
  br i1 %392, label %393, label %402

; <label>:393                                     ; preds = %383
  %394 = load i32* %2, align 4
  %395 = add nsw i32 %394, 20
  %396 = sub nsw i32 %395, 1
  %397 = sext i32 %396 to i64
  %398 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %397
  %399 = load i32* %398, align 4
  %400 = load i32* %ally1, align 4
  %401 = icmp eq i32 %399, %400
  br i1 %401, label %424, label %402

; <label>:402                                     ; preds = %393, %383
  %403 = load i32* %2, align 4
  %404 = add nsw i32 %403, 20
  %405 = add nsw i32 %404, 1
  %406 = sext i32 %405 to i64
  %407 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %406
  %408 = load i8* %407, align 1
  %409 = zext i8 %408 to i32
  %410 = load i32* %3, align 4
  %411 = icmp eq i32 %409, %410
  br i1 %411, label %412, label %421

; <label>:412                                     ; preds = %402
  %413 = load i32* %2, align 4
  %414 = add nsw i32 %413, 20
  %415 = add nsw i32 %414, 1
  %416 = sext i32 %415 to i64
  %417 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %416
  %418 = load i32* %417, align 4
  %419 = load i32* %ally1, align 4
  %420 = icmp eq i32 %418, %419
  br i1 %420, label %424, label %421

; <label>:421                                     ; preds = %412, %402
  %422 = load i32* %fast_liberties, align 4
  %423 = add nsw i32 %422, 1
  store i32 %423, i32* %fast_liberties, align 4
  br label %424

; <label>:424                                     ; preds = %421, %412, %393, %374, %356
  %425 = load i32* %2, align 4
  %426 = sub nsw i32 %425, 1
  %427 = sext i32 %426 to i64
  %428 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %427
  %429 = load i8* %428, align 1
  %430 = zext i8 %429 to i32
  %431 = icmp eq i32 %430, 0
  br i1 %431, label %432, label %492

; <label>:432                                     ; preds = %424
  %433 = load i32* %2, align 4
  %434 = sub nsw i32 %433, 1
  %435 = sub nsw i32 %434, 1
  %436 = sext i32 %435 to i64
  %437 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %436
  %438 = load i8* %437, align 1
  %439 = zext i8 %438 to i32
  %440 = load i32* %3, align 4
  %441 = icmp eq i32 %439, %440
  br i1 %441, label %442, label %451

; <label>:442                                     ; preds = %432
  %443 = load i32* %2, align 4
  %444 = sub nsw i32 %443, 1
  %445 = sub nsw i32 %444, 1
  %446 = sext i32 %445 to i64
  %447 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %446
  %448 = load i32* %447, align 4
  %449 = load i32* %ally1, align 4
  %450 = icmp eq i32 %448, %449
  br i1 %450, label %492, label %451

; <label>:451                                     ; preds = %442, %432
  %452 = load i32* %2, align 4
  %453 = sub nsw i32 %452, 1
  %454 = sub nsw i32 %453, 20
  %455 = sext i32 %454 to i64
  %456 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %455
  %457 = load i8* %456, align 1
  %458 = zext i8 %457 to i32
  %459 = load i32* %3, align 4
  %460 = icmp eq i32 %458, %459
  br i1 %460, label %461, label %470

; <label>:461                                     ; preds = %451
  %462 = load i32* %2, align 4
  %463 = sub nsw i32 %462, 1
  %464 = sub nsw i32 %463, 20
  %465 = sext i32 %464 to i64
  %466 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %465
  %467 = load i32* %466, align 4
  %468 = load i32* %ally1, align 4
  %469 = icmp eq i32 %467, %468
  br i1 %469, label %492, label %470

; <label>:470                                     ; preds = %461, %451
  %471 = load i32* %2, align 4
  %472 = sub nsw i32 %471, 1
  %473 = add nsw i32 %472, 20
  %474 = sext i32 %473 to i64
  %475 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %474
  %476 = load i8* %475, align 1
  %477 = zext i8 %476 to i32
  %478 = load i32* %3, align 4
  %479 = icmp eq i32 %477, %478
  br i1 %479, label %480, label %489

; <label>:480                                     ; preds = %470
  %481 = load i32* %2, align 4
  %482 = sub nsw i32 %481, 1
  %483 = add nsw i32 %482, 20
  %484 = sext i32 %483 to i64
  %485 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %484
  %486 = load i32* %485, align 4
  %487 = load i32* %ally1, align 4
  %488 = icmp eq i32 %486, %487
  br i1 %488, label %492, label %489

; <label>:489                                     ; preds = %480, %470
  %490 = load i32* %fast_liberties, align 4
  %491 = add nsw i32 %490, 1
  store i32 %491, i32* %fast_liberties, align 4
  br label %492

; <label>:492                                     ; preds = %489, %480, %461, %442, %424
  %493 = load i32* %2, align 4
  %494 = sub nsw i32 %493, 20
  %495 = sext i32 %494 to i64
  %496 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %495
  %497 = load i8* %496, align 1
  %498 = zext i8 %497 to i32
  %499 = icmp eq i32 %498, 0
  br i1 %499, label %500, label %560

; <label>:500                                     ; preds = %492
  %501 = load i32* %2, align 4
  %502 = sub nsw i32 %501, 20
  %503 = sub nsw i32 %502, 20
  %504 = sext i32 %503 to i64
  %505 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %504
  %506 = load i8* %505, align 1
  %507 = zext i8 %506 to i32
  %508 = load i32* %3, align 4
  %509 = icmp eq i32 %507, %508
  br i1 %509, label %510, label %519

; <label>:510                                     ; preds = %500
  %511 = load i32* %2, align 4
  %512 = sub nsw i32 %511, 20
  %513 = sub nsw i32 %512, 20
  %514 = sext i32 %513 to i64
  %515 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %514
  %516 = load i32* %515, align 4
  %517 = load i32* %ally1, align 4
  %518 = icmp eq i32 %516, %517
  br i1 %518, label %560, label %519

; <label>:519                                     ; preds = %510, %500
  %520 = load i32* %2, align 4
  %521 = sub nsw i32 %520, 20
  %522 = add nsw i32 %521, 1
  %523 = sext i32 %522 to i64
  %524 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %523
  %525 = load i8* %524, align 1
  %526 = zext i8 %525 to i32
  %527 = load i32* %3, align 4
  %528 = icmp eq i32 %526, %527
  br i1 %528, label %529, label %538

; <label>:529                                     ; preds = %519
  %530 = load i32* %2, align 4
  %531 = sub nsw i32 %530, 20
  %532 = add nsw i32 %531, 1
  %533 = sext i32 %532 to i64
  %534 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %533
  %535 = load i32* %534, align 4
  %536 = load i32* %ally1, align 4
  %537 = icmp eq i32 %535, %536
  br i1 %537, label %560, label %538

; <label>:538                                     ; preds = %529, %519
  %539 = load i32* %2, align 4
  %540 = sub nsw i32 %539, 20
  %541 = sub nsw i32 %540, 1
  %542 = sext i32 %541 to i64
  %543 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %542
  %544 = load i8* %543, align 1
  %545 = zext i8 %544 to i32
  %546 = load i32* %3, align 4
  %547 = icmp eq i32 %545, %546
  br i1 %547, label %548, label %557

; <label>:548                                     ; preds = %538
  %549 = load i32* %2, align 4
  %550 = sub nsw i32 %549, 20
  %551 = sub nsw i32 %550, 1
  %552 = sext i32 %551 to i64
  %553 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %552
  %554 = load i32* %553, align 4
  %555 = load i32* %ally1, align 4
  %556 = icmp eq i32 %554, %555
  br i1 %556, label %560, label %557

; <label>:557                                     ; preds = %548, %538
  %558 = load i32* %fast_liberties, align 4
  %559 = add nsw i32 %558, 1
  store i32 %559, i32* %fast_liberties, align 4
  br label %560

; <label>:560                                     ; preds = %557, %548, %529, %510, %492
  %561 = load i32* %2, align 4
  %562 = add nsw i32 %561, 1
  %563 = sext i32 %562 to i64
  %564 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %563
  %565 = load i8* %564, align 1
  %566 = zext i8 %565 to i32
  %567 = icmp eq i32 %566, 0
  br i1 %567, label %568, label %628

; <label>:568                                     ; preds = %560
  %569 = load i32* %2, align 4
  %570 = add nsw i32 %569, 1
  %571 = add nsw i32 %570, 1
  %572 = sext i32 %571 to i64
  %573 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %572
  %574 = load i8* %573, align 1
  %575 = zext i8 %574 to i32
  %576 = load i32* %3, align 4
  %577 = icmp eq i32 %575, %576
  br i1 %577, label %578, label %587

; <label>:578                                     ; preds = %568
  %579 = load i32* %2, align 4
  %580 = add nsw i32 %579, 1
  %581 = add nsw i32 %580, 1
  %582 = sext i32 %581 to i64
  %583 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %582
  %584 = load i32* %583, align 4
  %585 = load i32* %ally1, align 4
  %586 = icmp eq i32 %584, %585
  br i1 %586, label %628, label %587

; <label>:587                                     ; preds = %578, %568
  %588 = load i32* %2, align 4
  %589 = add nsw i32 %588, 1
  %590 = add nsw i32 %589, 20
  %591 = sext i32 %590 to i64
  %592 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %591
  %593 = load i8* %592, align 1
  %594 = zext i8 %593 to i32
  %595 = load i32* %3, align 4
  %596 = icmp eq i32 %594, %595
  br i1 %596, label %597, label %606

; <label>:597                                     ; preds = %587
  %598 = load i32* %2, align 4
  %599 = add nsw i32 %598, 1
  %600 = add nsw i32 %599, 20
  %601 = sext i32 %600 to i64
  %602 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %601
  %603 = load i32* %602, align 4
  %604 = load i32* %ally1, align 4
  %605 = icmp eq i32 %603, %604
  br i1 %605, label %628, label %606

; <label>:606                                     ; preds = %597, %587
  %607 = load i32* %2, align 4
  %608 = add nsw i32 %607, 1
  %609 = sub nsw i32 %608, 20
  %610 = sext i32 %609 to i64
  %611 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %610
  %612 = load i8* %611, align 1
  %613 = zext i8 %612 to i32
  %614 = load i32* %3, align 4
  %615 = icmp eq i32 %613, %614
  br i1 %615, label %616, label %625

; <label>:616                                     ; preds = %606
  %617 = load i32* %2, align 4
  %618 = add nsw i32 %617, 1
  %619 = sub nsw i32 %618, 20
  %620 = sext i32 %619 to i64
  %621 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %620
  %622 = load i32* %621, align 4
  %623 = load i32* %ally1, align 4
  %624 = icmp eq i32 %622, %623
  br i1 %624, label %628, label %625

; <label>:625                                     ; preds = %616, %606
  %626 = load i32* %fast_liberties, align 4
  %627 = add nsw i32 %626, 1
  store i32 %627, i32* %fast_liberties, align 4
  br label %628

; <label>:628                                     ; preds = %625, %616, %597, %578, %560
  %629 = load i32* %ally1, align 4
  %630 = sext i32 %629 to i64
  %631 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %630
  %632 = getelementptr inbounds %struct.string_data* %631, i32 0, i32 3
  %633 = load i32* %632, align 4
  %634 = sub nsw i32 %633, 1
  %635 = load i32* %fast_liberties, align 4
  %636 = add nsw i32 %635, %634
  store i32 %636, i32* %fast_liberties, align 4
  br label %1164

; <label>:637                                     ; preds = %353
  %638 = load i32* %2, align 4
  %639 = add nsw i32 %638, 20
  %640 = sext i32 %639 to i64
  %641 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %640
  %642 = load i8* %641, align 1
  %643 = zext i8 %642 to i32
  %644 = icmp eq i32 %643, 0
  br i1 %644, label %645, label %762

; <label>:645                                     ; preds = %637
  %646 = load i32* %2, align 4
  %647 = add nsw i32 %646, 20
  %648 = add nsw i32 %647, 20
  %649 = sext i32 %648 to i64
  %650 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %649
  %651 = load i8* %650, align 1
  %652 = zext i8 %651 to i32
  %653 = load i32* %3, align 4
  %654 = icmp eq i32 %652, %653
  br i1 %654, label %655, label %664

; <label>:655                                     ; preds = %645
  %656 = load i32* %2, align 4
  %657 = add nsw i32 %656, 20
  %658 = add nsw i32 %657, 20
  %659 = sext i32 %658 to i64
  %660 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %659
  %661 = load i32* %660, align 4
  %662 = load i32* %ally1, align 4
  %663 = icmp eq i32 %661, %662
  br i1 %663, label %762, label %664

; <label>:664                                     ; preds = %655, %645
  %665 = load i32* %2, align 4
  %666 = add nsw i32 %665, 20
  %667 = sub nsw i32 %666, 1
  %668 = sext i32 %667 to i64
  %669 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %668
  %670 = load i8* %669, align 1
  %671 = zext i8 %670 to i32
  %672 = load i32* %3, align 4
  %673 = icmp eq i32 %671, %672
  br i1 %673, label %674, label %683

; <label>:674                                     ; preds = %664
  %675 = load i32* %2, align 4
  %676 = add nsw i32 %675, 20
  %677 = sub nsw i32 %676, 1
  %678 = sext i32 %677 to i64
  %679 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %678
  %680 = load i32* %679, align 4
  %681 = load i32* %ally1, align 4
  %682 = icmp eq i32 %680, %681
  br i1 %682, label %762, label %683

; <label>:683                                     ; preds = %674, %664
  %684 = load i32* %2, align 4
  %685 = add nsw i32 %684, 20
  %686 = add nsw i32 %685, 1
  %687 = sext i32 %686 to i64
  %688 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %687
  %689 = load i8* %688, align 1
  %690 = zext i8 %689 to i32
  %691 = load i32* %3, align 4
  %692 = icmp eq i32 %690, %691
  br i1 %692, label %693, label %702

; <label>:693                                     ; preds = %683
  %694 = load i32* %2, align 4
  %695 = add nsw i32 %694, 20
  %696 = add nsw i32 %695, 1
  %697 = sext i32 %696 to i64
  %698 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %697
  %699 = load i32* %698, align 4
  %700 = load i32* %ally1, align 4
  %701 = icmp eq i32 %699, %700
  br i1 %701, label %762, label %702

; <label>:702                                     ; preds = %693, %683
  %703 = load i32* %2, align 4
  %704 = add nsw i32 %703, 20
  %705 = add nsw i32 %704, 20
  %706 = sext i32 %705 to i64
  %707 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %706
  %708 = load i8* %707, align 1
  %709 = zext i8 %708 to i32
  %710 = load i32* %3, align 4
  %711 = icmp eq i32 %709, %710
  br i1 %711, label %712, label %721

; <label>:712                                     ; preds = %702
  %713 = load i32* %2, align 4
  %714 = add nsw i32 %713, 20
  %715 = add nsw i32 %714, 20
  %716 = sext i32 %715 to i64
  %717 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %716
  %718 = load i32* %717, align 4
  %719 = load i32* %ally2, align 4
  %720 = icmp eq i32 %718, %719
  br i1 %720, label %762, label %721

; <label>:721                                     ; preds = %712, %702
  %722 = load i32* %2, align 4
  %723 = add nsw i32 %722, 20
  %724 = sub nsw i32 %723, 1
  %725 = sext i32 %724 to i64
  %726 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %725
  %727 = load i8* %726, align 1
  %728 = zext i8 %727 to i32
  %729 = load i32* %3, align 4
  %730 = icmp eq i32 %728, %729
  br i1 %730, label %731, label %740

; <label>:731                                     ; preds = %721
  %732 = load i32* %2, align 4
  %733 = add nsw i32 %732, 20
  %734 = sub nsw i32 %733, 1
  %735 = sext i32 %734 to i64
  %736 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %735
  %737 = load i32* %736, align 4
  %738 = load i32* %ally2, align 4
  %739 = icmp eq i32 %737, %738
  br i1 %739, label %762, label %740

; <label>:740                                     ; preds = %731, %721
  %741 = load i32* %2, align 4
  %742 = add nsw i32 %741, 20
  %743 = add nsw i32 %742, 1
  %744 = sext i32 %743 to i64
  %745 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %744
  %746 = load i8* %745, align 1
  %747 = zext i8 %746 to i32
  %748 = load i32* %3, align 4
  %749 = icmp eq i32 %747, %748
  br i1 %749, label %750, label %759

; <label>:750                                     ; preds = %740
  %751 = load i32* %2, align 4
  %752 = add nsw i32 %751, 20
  %753 = add nsw i32 %752, 1
  %754 = sext i32 %753 to i64
  %755 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %754
  %756 = load i32* %755, align 4
  %757 = load i32* %ally2, align 4
  %758 = icmp eq i32 %756, %757
  br i1 %758, label %762, label %759

; <label>:759                                     ; preds = %750, %740
  %760 = load i32* %fast_liberties, align 4
  %761 = add nsw i32 %760, 1
  store i32 %761, i32* %fast_liberties, align 4
  br label %762

; <label>:762                                     ; preds = %759, %750, %731, %712, %693, %674, %655, %637
  %763 = load i32* %2, align 4
  %764 = sub nsw i32 %763, 1
  %765 = sext i32 %764 to i64
  %766 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %765
  %767 = load i8* %766, align 1
  %768 = zext i8 %767 to i32
  %769 = icmp eq i32 %768, 0
  br i1 %769, label %770, label %887

; <label>:770                                     ; preds = %762
  %771 = load i32* %2, align 4
  %772 = sub nsw i32 %771, 1
  %773 = sub nsw i32 %772, 1
  %774 = sext i32 %773 to i64
  %775 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %774
  %776 = load i8* %775, align 1
  %777 = zext i8 %776 to i32
  %778 = load i32* %3, align 4
  %779 = icmp eq i32 %777, %778
  br i1 %779, label %780, label %789

; <label>:780                                     ; preds = %770
  %781 = load i32* %2, align 4
  %782 = sub nsw i32 %781, 1
  %783 = sub nsw i32 %782, 1
  %784 = sext i32 %783 to i64
  %785 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %784
  %786 = load i32* %785, align 4
  %787 = load i32* %ally1, align 4
  %788 = icmp eq i32 %786, %787
  br i1 %788, label %887, label %789

; <label>:789                                     ; preds = %780, %770
  %790 = load i32* %2, align 4
  %791 = sub nsw i32 %790, 1
  %792 = sub nsw i32 %791, 20
  %793 = sext i32 %792 to i64
  %794 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %793
  %795 = load i8* %794, align 1
  %796 = zext i8 %795 to i32
  %797 = load i32* %3, align 4
  %798 = icmp eq i32 %796, %797
  br i1 %798, label %799, label %808

; <label>:799                                     ; preds = %789
  %800 = load i32* %2, align 4
  %801 = sub nsw i32 %800, 1
  %802 = sub nsw i32 %801, 20
  %803 = sext i32 %802 to i64
  %804 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %803
  %805 = load i32* %804, align 4
  %806 = load i32* %ally1, align 4
  %807 = icmp eq i32 %805, %806
  br i1 %807, label %887, label %808

; <label>:808                                     ; preds = %799, %789
  %809 = load i32* %2, align 4
  %810 = sub nsw i32 %809, 1
  %811 = add nsw i32 %810, 20
  %812 = sext i32 %811 to i64
  %813 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %812
  %814 = load i8* %813, align 1
  %815 = zext i8 %814 to i32
  %816 = load i32* %3, align 4
  %817 = icmp eq i32 %815, %816
  br i1 %817, label %818, label %827

; <label>:818                                     ; preds = %808
  %819 = load i32* %2, align 4
  %820 = sub nsw i32 %819, 1
  %821 = add nsw i32 %820, 20
  %822 = sext i32 %821 to i64
  %823 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %822
  %824 = load i32* %823, align 4
  %825 = load i32* %ally1, align 4
  %826 = icmp eq i32 %824, %825
  br i1 %826, label %887, label %827

; <label>:827                                     ; preds = %818, %808
  %828 = load i32* %2, align 4
  %829 = sub nsw i32 %828, 1
  %830 = sub nsw i32 %829, 1
  %831 = sext i32 %830 to i64
  %832 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %831
  %833 = load i8* %832, align 1
  %834 = zext i8 %833 to i32
  %835 = load i32* %3, align 4
  %836 = icmp eq i32 %834, %835
  br i1 %836, label %837, label %846

; <label>:837                                     ; preds = %827
  %838 = load i32* %2, align 4
  %839 = sub nsw i32 %838, 1
  %840 = sub nsw i32 %839, 1
  %841 = sext i32 %840 to i64
  %842 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %841
  %843 = load i32* %842, align 4
  %844 = load i32* %ally2, align 4
  %845 = icmp eq i32 %843, %844
  br i1 %845, label %887, label %846

; <label>:846                                     ; preds = %837, %827
  %847 = load i32* %2, align 4
  %848 = sub nsw i32 %847, 1
  %849 = sub nsw i32 %848, 20
  %850 = sext i32 %849 to i64
  %851 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %850
  %852 = load i8* %851, align 1
  %853 = zext i8 %852 to i32
  %854 = load i32* %3, align 4
  %855 = icmp eq i32 %853, %854
  br i1 %855, label %856, label %865

; <label>:856                                     ; preds = %846
  %857 = load i32* %2, align 4
  %858 = sub nsw i32 %857, 1
  %859 = sub nsw i32 %858, 20
  %860 = sext i32 %859 to i64
  %861 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %860
  %862 = load i32* %861, align 4
  %863 = load i32* %ally2, align 4
  %864 = icmp eq i32 %862, %863
  br i1 %864, label %887, label %865

; <label>:865                                     ; preds = %856, %846
  %866 = load i32* %2, align 4
  %867 = sub nsw i32 %866, 1
  %868 = add nsw i32 %867, 20
  %869 = sext i32 %868 to i64
  %870 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %869
  %871 = load i8* %870, align 1
  %872 = zext i8 %871 to i32
  %873 = load i32* %3, align 4
  %874 = icmp eq i32 %872, %873
  br i1 %874, label %875, label %884

; <label>:875                                     ; preds = %865
  %876 = load i32* %2, align 4
  %877 = sub nsw i32 %876, 1
  %878 = add nsw i32 %877, 20
  %879 = sext i32 %878 to i64
  %880 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %879
  %881 = load i32* %880, align 4
  %882 = load i32* %ally2, align 4
  %883 = icmp eq i32 %881, %882
  br i1 %883, label %887, label %884

; <label>:884                                     ; preds = %875, %865
  %885 = load i32* %fast_liberties, align 4
  %886 = add nsw i32 %885, 1
  store i32 %886, i32* %fast_liberties, align 4
  br label %887

; <label>:887                                     ; preds = %884, %875, %856, %837, %818, %799, %780, %762
  %888 = load i32* %2, align 4
  %889 = sub nsw i32 %888, 20
  %890 = sext i32 %889 to i64
  %891 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %890
  %892 = load i8* %891, align 1
  %893 = zext i8 %892 to i32
  %894 = icmp eq i32 %893, 0
  br i1 %894, label %895, label %1012

; <label>:895                                     ; preds = %887
  %896 = load i32* %2, align 4
  %897 = sub nsw i32 %896, 20
  %898 = sub nsw i32 %897, 20
  %899 = sext i32 %898 to i64
  %900 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %899
  %901 = load i8* %900, align 1
  %902 = zext i8 %901 to i32
  %903 = load i32* %3, align 4
  %904 = icmp eq i32 %902, %903
  br i1 %904, label %905, label %914

; <label>:905                                     ; preds = %895
  %906 = load i32* %2, align 4
  %907 = sub nsw i32 %906, 20
  %908 = sub nsw i32 %907, 20
  %909 = sext i32 %908 to i64
  %910 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %909
  %911 = load i32* %910, align 4
  %912 = load i32* %ally1, align 4
  %913 = icmp eq i32 %911, %912
  br i1 %913, label %1012, label %914

; <label>:914                                     ; preds = %905, %895
  %915 = load i32* %2, align 4
  %916 = sub nsw i32 %915, 20
  %917 = add nsw i32 %916, 1
  %918 = sext i32 %917 to i64
  %919 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %918
  %920 = load i8* %919, align 1
  %921 = zext i8 %920 to i32
  %922 = load i32* %3, align 4
  %923 = icmp eq i32 %921, %922
  br i1 %923, label %924, label %933

; <label>:924                                     ; preds = %914
  %925 = load i32* %2, align 4
  %926 = sub nsw i32 %925, 20
  %927 = add nsw i32 %926, 1
  %928 = sext i32 %927 to i64
  %929 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %928
  %930 = load i32* %929, align 4
  %931 = load i32* %ally1, align 4
  %932 = icmp eq i32 %930, %931
  br i1 %932, label %1012, label %933

; <label>:933                                     ; preds = %924, %914
  %934 = load i32* %2, align 4
  %935 = sub nsw i32 %934, 20
  %936 = sub nsw i32 %935, 1
  %937 = sext i32 %936 to i64
  %938 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %937
  %939 = load i8* %938, align 1
  %940 = zext i8 %939 to i32
  %941 = load i32* %3, align 4
  %942 = icmp eq i32 %940, %941
  br i1 %942, label %943, label %952

; <label>:943                                     ; preds = %933
  %944 = load i32* %2, align 4
  %945 = sub nsw i32 %944, 20
  %946 = sub nsw i32 %945, 1
  %947 = sext i32 %946 to i64
  %948 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %947
  %949 = load i32* %948, align 4
  %950 = load i32* %ally1, align 4
  %951 = icmp eq i32 %949, %950
  br i1 %951, label %1012, label %952

; <label>:952                                     ; preds = %943, %933
  %953 = load i32* %2, align 4
  %954 = sub nsw i32 %953, 20
  %955 = sub nsw i32 %954, 20
  %956 = sext i32 %955 to i64
  %957 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %956
  %958 = load i8* %957, align 1
  %959 = zext i8 %958 to i32
  %960 = load i32* %3, align 4
  %961 = icmp eq i32 %959, %960
  br i1 %961, label %962, label %971

; <label>:962                                     ; preds = %952
  %963 = load i32* %2, align 4
  %964 = sub nsw i32 %963, 20
  %965 = sub nsw i32 %964, 20
  %966 = sext i32 %965 to i64
  %967 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %966
  %968 = load i32* %967, align 4
  %969 = load i32* %ally2, align 4
  %970 = icmp eq i32 %968, %969
  br i1 %970, label %1012, label %971

; <label>:971                                     ; preds = %962, %952
  %972 = load i32* %2, align 4
  %973 = sub nsw i32 %972, 20
  %974 = add nsw i32 %973, 1
  %975 = sext i32 %974 to i64
  %976 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %975
  %977 = load i8* %976, align 1
  %978 = zext i8 %977 to i32
  %979 = load i32* %3, align 4
  %980 = icmp eq i32 %978, %979
  br i1 %980, label %981, label %990

; <label>:981                                     ; preds = %971
  %982 = load i32* %2, align 4
  %983 = sub nsw i32 %982, 20
  %984 = add nsw i32 %983, 1
  %985 = sext i32 %984 to i64
  %986 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %985
  %987 = load i32* %986, align 4
  %988 = load i32* %ally2, align 4
  %989 = icmp eq i32 %987, %988
  br i1 %989, label %1012, label %990

; <label>:990                                     ; preds = %981, %971
  %991 = load i32* %2, align 4
  %992 = sub nsw i32 %991, 20
  %993 = sub nsw i32 %992, 1
  %994 = sext i32 %993 to i64
  %995 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %994
  %996 = load i8* %995, align 1
  %997 = zext i8 %996 to i32
  %998 = load i32* %3, align 4
  %999 = icmp eq i32 %997, %998
  br i1 %999, label %1000, label %1009

; <label>:1000                                    ; preds = %990
  %1001 = load i32* %2, align 4
  %1002 = sub nsw i32 %1001, 20
  %1003 = sub nsw i32 %1002, 1
  %1004 = sext i32 %1003 to i64
  %1005 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %1004
  %1006 = load i32* %1005, align 4
  %1007 = load i32* %ally2, align 4
  %1008 = icmp eq i32 %1006, %1007
  br i1 %1008, label %1012, label %1009

; <label>:1009                                    ; preds = %1000, %990
  %1010 = load i32* %fast_liberties, align 4
  %1011 = add nsw i32 %1010, 1
  store i32 %1011, i32* %fast_liberties, align 4
  br label %1012

; <label>:1012                                    ; preds = %1009, %1000, %981, %962, %943, %924, %905, %887
  %1013 = load i32* %2, align 4
  %1014 = add nsw i32 %1013, 1
  %1015 = sext i32 %1014 to i64
  %1016 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %1015
  %1017 = load i8* %1016, align 1
  %1018 = zext i8 %1017 to i32
  %1019 = icmp eq i32 %1018, 0
  br i1 %1019, label %1020, label %1137

; <label>:1020                                    ; preds = %1012
  %1021 = load i32* %2, align 4
  %1022 = add nsw i32 %1021, 1
  %1023 = add nsw i32 %1022, 1
  %1024 = sext i32 %1023 to i64
  %1025 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %1024
  %1026 = load i8* %1025, align 1
  %1027 = zext i8 %1026 to i32
  %1028 = load i32* %3, align 4
  %1029 = icmp eq i32 %1027, %1028
  br i1 %1029, label %1030, label %1039

; <label>:1030                                    ; preds = %1020
  %1031 = load i32* %2, align 4
  %1032 = add nsw i32 %1031, 1
  %1033 = add nsw i32 %1032, 1
  %1034 = sext i32 %1033 to i64
  %1035 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %1034
  %1036 = load i32* %1035, align 4
  %1037 = load i32* %ally1, align 4
  %1038 = icmp eq i32 %1036, %1037
  br i1 %1038, label %1137, label %1039

; <label>:1039                                    ; preds = %1030, %1020
  %1040 = load i32* %2, align 4
  %1041 = add nsw i32 %1040, 1
  %1042 = add nsw i32 %1041, 20
  %1043 = sext i32 %1042 to i64
  %1044 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %1043
  %1045 = load i8* %1044, align 1
  %1046 = zext i8 %1045 to i32
  %1047 = load i32* %3, align 4
  %1048 = icmp eq i32 %1046, %1047
  br i1 %1048, label %1049, label %1058

; <label>:1049                                    ; preds = %1039
  %1050 = load i32* %2, align 4
  %1051 = add nsw i32 %1050, 1
  %1052 = add nsw i32 %1051, 20
  %1053 = sext i32 %1052 to i64
  %1054 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %1053
  %1055 = load i32* %1054, align 4
  %1056 = load i32* %ally1, align 4
  %1057 = icmp eq i32 %1055, %1056
  br i1 %1057, label %1137, label %1058

; <label>:1058                                    ; preds = %1049, %1039
  %1059 = load i32* %2, align 4
  %1060 = add nsw i32 %1059, 1
  %1061 = sub nsw i32 %1060, 20
  %1062 = sext i32 %1061 to i64
  %1063 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %1062
  %1064 = load i8* %1063, align 1
  %1065 = zext i8 %1064 to i32
  %1066 = load i32* %3, align 4
  %1067 = icmp eq i32 %1065, %1066
  br i1 %1067, label %1068, label %1077

; <label>:1068                                    ; preds = %1058
  %1069 = load i32* %2, align 4
  %1070 = add nsw i32 %1069, 1
  %1071 = sub nsw i32 %1070, 20
  %1072 = sext i32 %1071 to i64
  %1073 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %1072
  %1074 = load i32* %1073, align 4
  %1075 = load i32* %ally1, align 4
  %1076 = icmp eq i32 %1074, %1075
  br i1 %1076, label %1137, label %1077

; <label>:1077                                    ; preds = %1068, %1058
  %1078 = load i32* %2, align 4
  %1079 = add nsw i32 %1078, 1
  %1080 = add nsw i32 %1079, 1
  %1081 = sext i32 %1080 to i64
  %1082 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %1081
  %1083 = load i8* %1082, align 1
  %1084 = zext i8 %1083 to i32
  %1085 = load i32* %3, align 4
  %1086 = icmp eq i32 %1084, %1085
  br i1 %1086, label %1087, label %1096

; <label>:1087                                    ; preds = %1077
  %1088 = load i32* %2, align 4
  %1089 = add nsw i32 %1088, 1
  %1090 = add nsw i32 %1089, 1
  %1091 = sext i32 %1090 to i64
  %1092 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %1091
  %1093 = load i32* %1092, align 4
  %1094 = load i32* %ally2, align 4
  %1095 = icmp eq i32 %1093, %1094
  br i1 %1095, label %1137, label %1096

; <label>:1096                                    ; preds = %1087, %1077
  %1097 = load i32* %2, align 4
  %1098 = add nsw i32 %1097, 1
  %1099 = add nsw i32 %1098, 20
  %1100 = sext i32 %1099 to i64
  %1101 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %1100
  %1102 = load i8* %1101, align 1
  %1103 = zext i8 %1102 to i32
  %1104 = load i32* %3, align 4
  %1105 = icmp eq i32 %1103, %1104
  br i1 %1105, label %1106, label %1115

; <label>:1106                                    ; preds = %1096
  %1107 = load i32* %2, align 4
  %1108 = add nsw i32 %1107, 1
  %1109 = add nsw i32 %1108, 20
  %1110 = sext i32 %1109 to i64
  %1111 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %1110
  %1112 = load i32* %1111, align 4
  %1113 = load i32* %ally2, align 4
  %1114 = icmp eq i32 %1112, %1113
  br i1 %1114, label %1137, label %1115

; <label>:1115                                    ; preds = %1106, %1096
  %1116 = load i32* %2, align 4
  %1117 = add nsw i32 %1116, 1
  %1118 = sub nsw i32 %1117, 20
  %1119 = sext i32 %1118 to i64
  %1120 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %1119
  %1121 = load i8* %1120, align 1
  %1122 = zext i8 %1121 to i32
  %1123 = load i32* %3, align 4
  %1124 = icmp eq i32 %1122, %1123
  br i1 %1124, label %1125, label %1134

; <label>:1125                                    ; preds = %1115
  %1126 = load i32* %2, align 4
  %1127 = add nsw i32 %1126, 1
  %1128 = sub nsw i32 %1127, 20
  %1129 = sext i32 %1128 to i64
  %1130 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %1129
  %1131 = load i32* %1130, align 4
  %1132 = load i32* %ally2, align 4
  %1133 = icmp eq i32 %1131, %1132
  br i1 %1133, label %1137, label %1134

; <label>:1134                                    ; preds = %1125, %1115
  %1135 = load i32* %fast_liberties, align 4
  %1136 = add nsw i32 %1135, 1
  store i32 %1136, i32* %fast_liberties, align 4
  br label %1137

; <label>:1137                                    ; preds = %1134, %1125, %1106, %1087, %1068, %1049, %1030, %1012
  %1138 = load i32* %ally1, align 4
  %1139 = sext i32 %1138 to i64
  %1140 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %1139
  %1141 = getelementptr inbounds %struct.string_data* %1140, i32 0, i32 3
  %1142 = load i32* %1141, align 4
  %1143 = load i32* %ally2, align 4
  %1144 = sext i32 %1143 to i64
  %1145 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %1144
  %1146 = getelementptr inbounds %struct.string_data* %1145, i32 0, i32 3
  %1147 = load i32* %1146, align 4
  %1148 = add nsw i32 %1142, %1147
  %1149 = load i32* %ally1, align 4
  %1150 = sext i32 %1149 to i64
  %1151 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %1150
  %1152 = getelementptr inbounds %struct.string_data* %1151, i32 0, i32 2
  %1153 = load i32* %1152, align 4
  %1154 = load i32* %ally2, align 4
  %1155 = sext i32 %1154 to i64
  %1156 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %1155
  %1157 = getelementptr inbounds %struct.string_data* %1156, i32 0, i32 2
  %1158 = load i32* %1157, align 4
  %1159 = call i32 @count_common_libs(i32 %1153, i32 %1158)
  %1160 = sub nsw i32 %1148, %1159
  %1161 = sub nsw i32 %1160, 1
  %1162 = load i32* %fast_liberties, align 4
  %1163 = add nsw i32 %1162, %1161
  store i32 %1163, i32* %fast_liberties, align 4
  br label %1164

; <label>:1164                                    ; preds = %1137, %628
  br label %1165

; <label>:1165                                    ; preds = %1164, %352
  br label %1410

; <label>:1166                                    ; preds = %302
  store i32 0, i32* %k, align 4
  br label %1167

; <label>:1167                                    ; preds = %1371, %1166
  %1168 = load i32* %k, align 4
  %1169 = icmp slt i32 %1168, 4
  br i1 %1169, label %1170, label %1374

; <label>:1170                                    ; preds = %1167
  %1171 = load i32* %2, align 4
  %1172 = load i32* %k, align 4
  %1173 = sext i32 %1172 to i64
  %1174 = getelementptr inbounds [8 x i32]* @delta, i32 0, i64 %1173
  %1175 = load i32* %1174, align 4
  %1176 = add nsw i32 %1171, %1175
  store i32 %1176, i32* %neighbor, align 4
  %1177 = load i32* %neighbor, align 4
  %1178 = sext i32 %1177 to i64
  %1179 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %1178
  %1180 = load i8* %1179, align 1
  %1181 = zext i8 %1180 to i32
  %1182 = icmp eq i32 %1181, 0
  br i1 %1182, label %1183, label %1328

; <label>:1183                                    ; preds = %1170
  %1184 = load i32* %ally1, align 4
  %1185 = icmp slt i32 %1184, 0
  br i1 %1185, label %1254, label %1186

; <label>:1186                                    ; preds = %1183
  %1187 = load i32* %neighbor, align 4
  %1188 = add nsw i32 %1187, 20
  %1189 = sext i32 %1188 to i64
  %1190 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %1189
  %1191 = load i8* %1190, align 1
  %1192 = zext i8 %1191 to i32
  %1193 = load i32* %3, align 4
  %1194 = icmp eq i32 %1192, %1193
  br i1 %1194, label %1195, label %1203

; <label>:1195                                    ; preds = %1186
  %1196 = load i32* %neighbor, align 4
  %1197 = add nsw i32 %1196, 20
  %1198 = sext i32 %1197 to i64
  %1199 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %1198
  %1200 = load i32* %1199, align 4
  %1201 = load i32* %ally1, align 4
  %1202 = icmp eq i32 %1200, %1201
  br i1 %1202, label %1328, label %1203

; <label>:1203                                    ; preds = %1195, %1186
  %1204 = load i32* %neighbor, align 4
  %1205 = sub nsw i32 %1204, 1
  %1206 = sext i32 %1205 to i64
  %1207 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %1206
  %1208 = load i8* %1207, align 1
  %1209 = zext i8 %1208 to i32
  %1210 = load i32* %3, align 4
  %1211 = icmp eq i32 %1209, %1210
  br i1 %1211, label %1212, label %1220

; <label>:1212                                    ; preds = %1203
  %1213 = load i32* %neighbor, align 4
  %1214 = sub nsw i32 %1213, 1
  %1215 = sext i32 %1214 to i64
  %1216 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %1215
  %1217 = load i32* %1216, align 4
  %1218 = load i32* %ally1, align 4
  %1219 = icmp eq i32 %1217, %1218
  br i1 %1219, label %1328, label %1220

; <label>:1220                                    ; preds = %1212, %1203
  %1221 = load i32* %neighbor, align 4
  %1222 = sub nsw i32 %1221, 20
  %1223 = sext i32 %1222 to i64
  %1224 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %1223
  %1225 = load i8* %1224, align 1
  %1226 = zext i8 %1225 to i32
  %1227 = load i32* %3, align 4
  %1228 = icmp eq i32 %1226, %1227
  br i1 %1228, label %1229, label %1237

; <label>:1229                                    ; preds = %1220
  %1230 = load i32* %neighbor, align 4
  %1231 = sub nsw i32 %1230, 20
  %1232 = sext i32 %1231 to i64
  %1233 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %1232
  %1234 = load i32* %1233, align 4
  %1235 = load i32* %ally1, align 4
  %1236 = icmp eq i32 %1234, %1235
  br i1 %1236, label %1328, label %1237

; <label>:1237                                    ; preds = %1229, %1220
  %1238 = load i32* %neighbor, align 4
  %1239 = add nsw i32 %1238, 1
  %1240 = sext i32 %1239 to i64
  %1241 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %1240
  %1242 = load i8* %1241, align 1
  %1243 = zext i8 %1242 to i32
  %1244 = load i32* %3, align 4
  %1245 = icmp eq i32 %1243, %1244
  br i1 %1245, label %1246, label %1254

; <label>:1246                                    ; preds = %1237
  %1247 = load i32* %neighbor, align 4
  %1248 = add nsw i32 %1247, 1
  %1249 = sext i32 %1248 to i64
  %1250 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %1249
  %1251 = load i32* %1250, align 4
  %1252 = load i32* %ally1, align 4
  %1253 = icmp eq i32 %1251, %1252
  br i1 %1253, label %1328, label %1254

; <label>:1254                                    ; preds = %1246, %1237, %1183
  %1255 = load i32* %ally2, align 4
  %1256 = icmp slt i32 %1255, 0
  br i1 %1256, label %1325, label %1257

; <label>:1257                                    ; preds = %1254
  %1258 = load i32* %neighbor, align 4
  %1259 = add nsw i32 %1258, 20
  %1260 = sext i32 %1259 to i64
  %1261 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %1260
  %1262 = load i8* %1261, align 1
  %1263 = zext i8 %1262 to i32
  %1264 = load i32* %3, align 4
  %1265 = icmp eq i32 %1263, %1264
  br i1 %1265, label %1266, label %1274

; <label>:1266                                    ; preds = %1257
  %1267 = load i32* %neighbor, align 4
  %1268 = add nsw i32 %1267, 20
  %1269 = sext i32 %1268 to i64
  %1270 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %1269
  %1271 = load i32* %1270, align 4
  %1272 = load i32* %ally2, align 4
  %1273 = icmp eq i32 %1271, %1272
  br i1 %1273, label %1328, label %1274

; <label>:1274                                    ; preds = %1266, %1257
  %1275 = load i32* %neighbor, align 4
  %1276 = sub nsw i32 %1275, 1
  %1277 = sext i32 %1276 to i64
  %1278 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %1277
  %1279 = load i8* %1278, align 1
  %1280 = zext i8 %1279 to i32
  %1281 = load i32* %3, align 4
  %1282 = icmp eq i32 %1280, %1281
  br i1 %1282, label %1283, label %1291

; <label>:1283                                    ; preds = %1274
  %1284 = load i32* %neighbor, align 4
  %1285 = sub nsw i32 %1284, 1
  %1286 = sext i32 %1285 to i64
  %1287 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %1286
  %1288 = load i32* %1287, align 4
  %1289 = load i32* %ally2, align 4
  %1290 = icmp eq i32 %1288, %1289
  br i1 %1290, label %1328, label %1291

; <label>:1291                                    ; preds = %1283, %1274
  %1292 = load i32* %neighbor, align 4
  %1293 = sub nsw i32 %1292, 20
  %1294 = sext i32 %1293 to i64
  %1295 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %1294
  %1296 = load i8* %1295, align 1
  %1297 = zext i8 %1296 to i32
  %1298 = load i32* %3, align 4
  %1299 = icmp eq i32 %1297, %1298
  br i1 %1299, label %1300, label %1308

; <label>:1300                                    ; preds = %1291
  %1301 = load i32* %neighbor, align 4
  %1302 = sub nsw i32 %1301, 20
  %1303 = sext i32 %1302 to i64
  %1304 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %1303
  %1305 = load i32* %1304, align 4
  %1306 = load i32* %ally2, align 4
  %1307 = icmp eq i32 %1305, %1306
  br i1 %1307, label %1328, label %1308

; <label>:1308                                    ; preds = %1300, %1291
  %1309 = load i32* %neighbor, align 4
  %1310 = add nsw i32 %1309, 1
  %1311 = sext i32 %1310 to i64
  %1312 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %1311
  %1313 = load i8* %1312, align 1
  %1314 = zext i8 %1313 to i32
  %1315 = load i32* %3, align 4
  %1316 = icmp eq i32 %1314, %1315
  br i1 %1316, label %1317, label %1325

; <label>:1317                                    ; preds = %1308
  %1318 = load i32* %neighbor, align 4
  %1319 = add nsw i32 %1318, 1
  %1320 = sext i32 %1319 to i64
  %1321 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %1320
  %1322 = load i32* %1321, align 4
  %1323 = load i32* %ally2, align 4
  %1324 = icmp eq i32 %1322, %1323
  br i1 %1324, label %1328, label %1325

; <label>:1325                                    ; preds = %1317, %1308, %1254
  %1326 = load i32* %fast_liberties, align 4
  %1327 = add nsw i32 %1326, 1
  store i32 %1327, i32* %fast_liberties, align 4
  br label %1370

; <label>:1328                                    ; preds = %1317, %1300, %1283, %1266, %1246, %1229, %1212, %1195, %1170
  %1329 = load i32* %neighbor, align 4
  %1330 = sext i32 %1329 to i64
  %1331 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %1330
  %1332 = load i8* %1331, align 1
  %1333 = zext i8 %1332 to i32
  %1334 = load i32* %3, align 4
  %1335 = sub nsw i32 3, %1334
  %1336 = icmp eq i32 %1333, %1335
  br i1 %1336, label %1337, label %1369

; <label>:1337                                    ; preds = %1328
  %1338 = load i32* %neighbor, align 4
  %1339 = sext i32 %1338 to i64
  %1340 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %1339
  %1341 = load i32* %1340, align 4
  %1342 = sext i32 %1341 to i64
  %1343 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %1342
  %1344 = getelementptr inbounds %struct.string_data* %1343, i32 0, i32 3
  %1345 = load i32* %1344, align 4
  %1346 = icmp eq i32 %1345, 1
  br i1 %1346, label %1347, label %1369

; <label>:1347                                    ; preds = %1337
  %1348 = load i32* %neighbor, align 4
  %1349 = sext i32 %1348 to i64
  %1350 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %1349
  %1351 = load i32* %1350, align 4
  %1352 = sext i32 %1351 to i64
  %1353 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %1352
  %1354 = getelementptr inbounds %struct.string_data* %1353, i32 0, i32 1
  %1355 = load i32* %1354, align 4
  store i32 %1355, i32* %neighbor_size, align 4
  %1356 = load i32* %neighbor_size, align 4
  %1357 = icmp eq i32 %1356, 1
  br i1 %1357, label %1364, label %1358

; <label>:1358                                    ; preds = %1347
  %1359 = load i32* %neighbor_size, align 4
  %1360 = icmp eq i32 %1359, 2
  br i1 %1360, label %1361, label %1367

; <label>:1361                                    ; preds = %1358
  %1362 = load i32* %ally1, align 4
  %1363 = icmp slt i32 %1362, 0
  br i1 %1363, label %1364, label %1367

; <label>:1364                                    ; preds = %1361, %1347
  %1365 = load i32* %fast_liberties, align 4
  %1366 = add nsw i32 %1365, 1
  store i32 %1366, i32* %fast_liberties, align 4
  br label %1368

; <label>:1367                                    ; preds = %1361, %1358
  store i32 -1, i32* %1
  br label %1412

; <label>:1368                                    ; preds = %1364
  br label %1369

; <label>:1369                                    ; preds = %1368, %1337, %1328
  br label %1370

; <label>:1370                                    ; preds = %1369, %1325
  br label %1371

; <label>:1371                                    ; preds = %1370
  %1372 = load i32* %k, align 4
  %1373 = add nsw i32 %1372, 1
  store i32 %1373, i32* %k, align 4
  br label %1167

; <label>:1374                                    ; preds = %1167
  %1375 = load i32* %ally1, align 4
  %1376 = icmp sge i32 %1375, 0
  br i1 %1376, label %1377, label %1409

; <label>:1377                                    ; preds = %1374
  %1378 = load i32* %ally1, align 4
  %1379 = sext i32 %1378 to i64
  %1380 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %1379
  %1381 = getelementptr inbounds %struct.string_data* %1380, i32 0, i32 3
  %1382 = load i32* %1381, align 4
  %1383 = sub nsw i32 %1382, 1
  %1384 = load i32* %fast_liberties, align 4
  %1385 = add nsw i32 %1384, %1383
  store i32 %1385, i32* %fast_liberties, align 4
  %1386 = load i32* %ally2, align 4
  %1387 = icmp sge i32 %1386, 0
  br i1 %1387, label %1388, label %1408

; <label>:1388                                    ; preds = %1377
  %1389 = load i32* %ally2, align 4
  %1390 = sext i32 %1389 to i64
  %1391 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %1390
  %1392 = getelementptr inbounds %struct.string_data* %1391, i32 0, i32 3
  %1393 = load i32* %1392, align 4
  %1394 = load i32* %ally1, align 4
  %1395 = sext i32 %1394 to i64
  %1396 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %1395
  %1397 = getelementptr inbounds %struct.string_data* %1396, i32 0, i32 2
  %1398 = load i32* %1397, align 4
  %1399 = load i32* %ally2, align 4
  %1400 = sext i32 %1399 to i64
  %1401 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %1400
  %1402 = getelementptr inbounds %struct.string_data* %1401, i32 0, i32 2
  %1403 = load i32* %1402, align 4
  %1404 = call i32 @count_common_libs(i32 %1398, i32 %1403)
  %1405 = sub nsw i32 %1393, %1404
  %1406 = load i32* %fast_liberties, align 4
  %1407 = add nsw i32 %1406, %1405
  store i32 %1407, i32* %fast_liberties, align 4
  br label %1408

; <label>:1408                                    ; preds = %1388, %1377
  br label %1409

; <label>:1409                                    ; preds = %1408, %1374
  br label %1410

; <label>:1410                                    ; preds = %1409, %1165
  %1411 = load i32* %fast_liberties, align 4
  store i32 %1411, i32* %1
  br label %1412

; <label>:1412                                    ; preds = %1410, %1367, %219, %154, %94
  %1413 = load i32* %1
  ret i32 %1413
}

; Function Attrs: nounwind uwtable
define i32 @count_common_libs(i32 %str1, i32 %str2) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %all_libs1 = alloca [241 x i32], align 16
  %libs1 = alloca i32*, align 8
  %liberties1 = alloca i32, align 4
  %liberties2 = alloca i32, align 4
  %commonlibs = alloca i32, align 4
  %k = alloca i32, align 4
  %n = alloca i32, align 4
  %tmp = alloca i32, align 4
  store i32 %str1, i32* %2, align 4
  store i32 %str2, i32* %3, align 4
  store i32 0, i32* %commonlibs, align 4
  %4 = load i32* %2, align 4
  %5 = icmp ult i32 %4, 421
  br i1 %5, label %6, label %14

; <label>:6                                       ; preds = %0
  %7 = load i32* %2, align 4
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %8
  %10 = load i8* %9, align 1
  %11 = zext i8 %10 to i32
  %12 = icmp ne i32 %11, 3
  br i1 %12, label %13, label %14

; <label>:13                                      ; preds = %6
  br label %21

; <label>:14                                      ; preds = %6, %0
  %15 = load i32* %2, align 4
  %16 = sdiv i32 %15, 20
  %17 = sub nsw i32 %16, 1
  %18 = load i32* %2, align 4
  %19 = srem i32 %18, 20
  %20 = sub nsw i32 %19, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 1914, i8* getelementptr inbounds ([16 x i8]* @.str29, i32 0, i32 0), i32 %17, i32 %20)
  br label %21

; <label>:21                                      ; preds = %14, %13
  %22 = load i32* %3, align 4
  %23 = icmp ult i32 %22, 421
  br i1 %23, label %24, label %32

; <label>:24                                      ; preds = %21
  %25 = load i32* %3, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %26
  %28 = load i8* %27, align 1
  %29 = zext i8 %28 to i32
  %30 = icmp ne i32 %29, 3
  br i1 %30, label %31, label %32

; <label>:31                                      ; preds = %24
  br label %39

; <label>:32                                      ; preds = %24, %21
  %33 = load i32* %3, align 4
  %34 = sdiv i32 %33, 20
  %35 = sub nsw i32 %34, 1
  %36 = load i32* %3, align 4
  %37 = srem i32 %36, 20
  %38 = sub nsw i32 %37, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 1915, i8* getelementptr inbounds ([16 x i8]* @.str30, i32 0, i32 0), i32 %35, i32 %38)
  br label %39

; <label>:39                                      ; preds = %32, %31
  %40 = load i32* %2, align 4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %41
  %43 = load i8* %42, align 1
  %44 = zext i8 %43 to i32
  %45 = icmp eq i32 %44, 1
  br i1 %45, label %53, label %46

; <label>:46                                      ; preds = %39
  %47 = load i32* %2, align 4
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %48
  %50 = load i8* %49, align 1
  %51 = zext i8 %50 to i32
  %52 = icmp eq i32 %51, 2
  br i1 %52, label %53, label %54

; <label>:53                                      ; preds = %46, %39
  br label %61

; <label>:54                                      ; preds = %46
  %55 = load i32* %2, align 4
  %56 = sdiv i32 %55, 20
  %57 = sub nsw i32 %56, 1
  %58 = load i32* %2, align 4
  %59 = srem i32 %58, 20
  %60 = sub nsw i32 %59, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 1916, i8* getelementptr inbounds ([22 x i8]* @.str31, i32 0, i32 0), i32 %57, i32 %60)
  br label %61

; <label>:61                                      ; preds = %54, %53
  %62 = load i32* %3, align 4
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %63
  %65 = load i8* %64, align 1
  %66 = zext i8 %65 to i32
  %67 = icmp eq i32 %66, 1
  br i1 %67, label %75, label %68

; <label>:68                                      ; preds = %61
  %69 = load i32* %3, align 4
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %70
  %72 = load i8* %71, align 1
  %73 = zext i8 %72 to i32
  %74 = icmp eq i32 %73, 2
  br i1 %74, label %75, label %76

; <label>:75                                      ; preds = %68, %61
  br label %83

; <label>:76                                      ; preds = %68
  %77 = load i32* %3, align 4
  %78 = sdiv i32 %77, 20
  %79 = sub nsw i32 %78, 1
  %80 = load i32* %3, align 4
  %81 = srem i32 %80, 20
  %82 = sub nsw i32 %81, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 1917, i8* getelementptr inbounds ([22 x i8]* @.str32, i32 0, i32 0), i32 %79, i32 %82)
  br label %83

; <label>:83                                      ; preds = %76, %75
  %84 = load i32* %2, align 4
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %85
  %87 = load i32* %86, align 4
  store i32 %87, i32* %n, align 4
  %88 = load i32* %n, align 4
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %89
  %91 = getelementptr inbounds %struct.string_data* %90, i32 0, i32 3
  %92 = load i32* %91, align 4
  store i32 %92, i32* %liberties1, align 4
  %93 = load i32* %liberties1, align 4
  %94 = load i32* %3, align 4
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %95
  %97 = load i32* %96, align 4
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %98
  %100 = getelementptr inbounds %struct.string_data* %99, i32 0, i32 3
  %101 = load i32* %100, align 4
  %102 = icmp sgt i32 %93, %101
  br i1 %102, label %103, label %116

; <label>:103                                     ; preds = %83
  %104 = load i32* %3, align 4
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %105
  %107 = load i32* %106, align 4
  store i32 %107, i32* %n, align 4
  %108 = load i32* %n, align 4
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %109
  %111 = getelementptr inbounds %struct.string_data* %110, i32 0, i32 3
  %112 = load i32* %111, align 4
  store i32 %112, i32* %liberties1, align 4
  %113 = load i32* %2, align 4
  store i32 %113, i32* %tmp, align 4
  %114 = load i32* %3, align 4
  store i32 %114, i32* %2, align 4
  %115 = load i32* %tmp, align 4
  store i32 %115, i32* %3, align 4
  br label %116

; <label>:116                                     ; preds = %103, %83
  %117 = load i32* %liberties1, align 4
  %118 = icmp sle i32 %117, 20
  br i1 %118, label %119, label %197

; <label>:119                                     ; preds = %116
  %120 = load i32* %n, align 4
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %121
  %123 = getelementptr inbounds %struct.string_data* %122, i32 0, i32 4
  %124 = getelementptr inbounds [20 x i32]* %123, i32 0, i32 0
  store i32* %124, i32** %libs1, align 8
  %125 = load i32* %3, align 4
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %126
  %128 = load i32* %127, align 4
  store i32 %128, i32* %n, align 4
  %129 = load i32* %n, align 4
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %130
  %132 = getelementptr inbounds %struct.string_data* %131, i32 0, i32 3
  %133 = load i32* %132, align 4
  store i32 %133, i32* %liberties2, align 4
  %134 = load i32* %liberties2, align 4
  %135 = icmp sle i32 %134, 20
  br i1 %135, label %136, label %196

; <label>:136                                     ; preds = %119
  %137 = load i32* @liberty_mark, align 4
  %138 = add nsw i32 %137, 1
  store i32 %138, i32* @liberty_mark, align 4
  store i32 0, i32* %k, align 4
  br label %139

; <label>:139                                     ; preds = %152, %136
  %140 = load i32* %k, align 4
  %141 = load i32* %liberties1, align 4
  %142 = icmp slt i32 %140, %141
  br i1 %142, label %143, label %155

; <label>:143                                     ; preds = %139
  %144 = load i32* @liberty_mark, align 4
  %145 = load i32* %k, align 4
  %146 = sext i32 %145 to i64
  %147 = load i32** %libs1, align 8
  %148 = getelementptr inbounds i32* %147, i64 %146
  %149 = load i32* %148, align 4
  %150 = sext i32 %149 to i64
  %151 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %150
  store i32 %144, i32* %151, align 4
  br label %152

; <label>:152                                     ; preds = %143
  %153 = load i32* %k, align 4
  %154 = add nsw i32 %153, 1
  store i32 %154, i32* %k, align 4
  br label %139

; <label>:155                                     ; preds = %139
  %156 = load i32* %n, align 4
  %157 = sext i32 %156 to i64
  %158 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %157
  %159 = getelementptr inbounds %struct.string_data* %158, i32 0, i32 4
  %160 = getelementptr inbounds [20 x i32]* %159, i32 0, i32 0
  store i32* %160, i32** %libs1, align 8
  store i32 0, i32* %k, align 4
  br label %161

; <label>:161                                     ; preds = %191, %155
  %162 = load i32* %k, align 4
  %163 = load i32* %liberties2, align 4
  %164 = icmp slt i32 %162, %163
  br i1 %164, label %165, label %194

; <label>:165                                     ; preds = %161
  %166 = load i32* %k, align 4
  %167 = sext i32 %166 to i64
  %168 = load i32** %libs1, align 8
  %169 = getelementptr inbounds i32* %168, i64 %167
  %170 = load i32* %169, align 4
  %171 = sext i32 %170 to i64
  %172 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %171
  %173 = load i8* %172, align 1
  %174 = zext i8 %173 to i32
  %175 = icmp eq i32 %174, 0
  br i1 %175, label %176, label %187

; <label>:176                                     ; preds = %165
  %177 = load i32* %k, align 4
  %178 = sext i32 %177 to i64
  %179 = load i32** %libs1, align 8
  %180 = getelementptr inbounds i32* %179, i64 %178
  %181 = load i32* %180, align 4
  %182 = sext i32 %181 to i64
  %183 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %182
  %184 = load i32* %183, align 4
  %185 = load i32* @liberty_mark, align 4
  %186 = icmp ne i32 %184, %185
  br i1 %186, label %190, label %187

; <label>:187                                     ; preds = %176, %165
  %188 = load i32* %commonlibs, align 4
  %189 = add nsw i32 %188, 1
  store i32 %189, i32* %commonlibs, align 4
  br label %190

; <label>:190                                     ; preds = %187, %176
  br label %191

; <label>:191                                     ; preds = %190
  %192 = load i32* %k, align 4
  %193 = add nsw i32 %192, 1
  store i32 %193, i32* %k, align 4
  br label %161

; <label>:194                                     ; preds = %161
  %195 = load i32* %commonlibs, align 4
  store i32 %195, i32* %1
  br label %344

; <label>:196                                     ; preds = %119
  br label %202

; <label>:197                                     ; preds = %116
  %198 = load i32* %2, align 4
  %199 = getelementptr inbounds [241 x i32]* %all_libs1, i32 0, i32 0
  %200 = call i32 @findlib(i32 %198, i32 241, i32* %199)
  %201 = getelementptr inbounds [241 x i32]* %all_libs1, i32 0, i32 0
  store i32* %201, i32** %libs1, align 8
  br label %202

; <label>:202                                     ; preds = %197, %196
  store i32 0, i32* %k, align 4
  br label %203

; <label>:203                                     ; preds = %339, %202
  %204 = load i32* %k, align 4
  %205 = load i32* %liberties1, align 4
  %206 = icmp slt i32 %204, %205
  br i1 %206, label %207, label %342

; <label>:207                                     ; preds = %203
  %208 = load i32* %k, align 4
  %209 = sext i32 %208 to i64
  %210 = load i32** %libs1, align 8
  %211 = getelementptr inbounds i32* %210, i64 %209
  %212 = load i32* %211, align 4
  %213 = add nsw i32 %212, 20
  %214 = sext i32 %213 to i64
  %215 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %214
  %216 = load i8* %215, align 1
  %217 = zext i8 %216 to i32
  %218 = load i32* %3, align 4
  %219 = sext i32 %218 to i64
  %220 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %219
  %221 = load i8* %220, align 1
  %222 = zext i8 %221 to i32
  %223 = icmp eq i32 %217, %222
  br i1 %223, label %224, label %239

; <label>:224                                     ; preds = %207
  %225 = load i32* %k, align 4
  %226 = sext i32 %225 to i64
  %227 = load i32** %libs1, align 8
  %228 = getelementptr inbounds i32* %227, i64 %226
  %229 = load i32* %228, align 4
  %230 = add nsw i32 %229, 20
  %231 = sext i32 %230 to i64
  %232 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %231
  %233 = load i32* %232, align 4
  %234 = load i32* %3, align 4
  %235 = sext i32 %234 to i64
  %236 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %235
  %237 = load i32* %236, align 4
  %238 = icmp eq i32 %233, %237
  br i1 %238, label %335, label %239

; <label>:239                                     ; preds = %224, %207
  %240 = load i32* %k, align 4
  %241 = sext i32 %240 to i64
  %242 = load i32** %libs1, align 8
  %243 = getelementptr inbounds i32* %242, i64 %241
  %244 = load i32* %243, align 4
  %245 = sub nsw i32 %244, 1
  %246 = sext i32 %245 to i64
  %247 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %246
  %248 = load i8* %247, align 1
  %249 = zext i8 %248 to i32
  %250 = load i32* %3, align 4
  %251 = sext i32 %250 to i64
  %252 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %251
  %253 = load i8* %252, align 1
  %254 = zext i8 %253 to i32
  %255 = icmp eq i32 %249, %254
  br i1 %255, label %256, label %271

; <label>:256                                     ; preds = %239
  %257 = load i32* %k, align 4
  %258 = sext i32 %257 to i64
  %259 = load i32** %libs1, align 8
  %260 = getelementptr inbounds i32* %259, i64 %258
  %261 = load i32* %260, align 4
  %262 = sub nsw i32 %261, 1
  %263 = sext i32 %262 to i64
  %264 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %263
  %265 = load i32* %264, align 4
  %266 = load i32* %3, align 4
  %267 = sext i32 %266 to i64
  %268 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %267
  %269 = load i32* %268, align 4
  %270 = icmp eq i32 %265, %269
  br i1 %270, label %335, label %271

; <label>:271                                     ; preds = %256, %239
  %272 = load i32* %k, align 4
  %273 = sext i32 %272 to i64
  %274 = load i32** %libs1, align 8
  %275 = getelementptr inbounds i32* %274, i64 %273
  %276 = load i32* %275, align 4
  %277 = sub nsw i32 %276, 20
  %278 = sext i32 %277 to i64
  %279 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %278
  %280 = load i8* %279, align 1
  %281 = zext i8 %280 to i32
  %282 = load i32* %3, align 4
  %283 = sext i32 %282 to i64
  %284 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %283
  %285 = load i8* %284, align 1
  %286 = zext i8 %285 to i32
  %287 = icmp eq i32 %281, %286
  br i1 %287, label %288, label %303

; <label>:288                                     ; preds = %271
  %289 = load i32* %k, align 4
  %290 = sext i32 %289 to i64
  %291 = load i32** %libs1, align 8
  %292 = getelementptr inbounds i32* %291, i64 %290
  %293 = load i32* %292, align 4
  %294 = sub nsw i32 %293, 20
  %295 = sext i32 %294 to i64
  %296 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %295
  %297 = load i32* %296, align 4
  %298 = load i32* %3, align 4
  %299 = sext i32 %298 to i64
  %300 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %299
  %301 = load i32* %300, align 4
  %302 = icmp eq i32 %297, %301
  br i1 %302, label %335, label %303

; <label>:303                                     ; preds = %288, %271
  %304 = load i32* %k, align 4
  %305 = sext i32 %304 to i64
  %306 = load i32** %libs1, align 8
  %307 = getelementptr inbounds i32* %306, i64 %305
  %308 = load i32* %307, align 4
  %309 = add nsw i32 %308, 1
  %310 = sext i32 %309 to i64
  %311 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %310
  %312 = load i8* %311, align 1
  %313 = zext i8 %312 to i32
  %314 = load i32* %3, align 4
  %315 = sext i32 %314 to i64
  %316 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %315
  %317 = load i8* %316, align 1
  %318 = zext i8 %317 to i32
  %319 = icmp eq i32 %313, %318
  br i1 %319, label %320, label %338

; <label>:320                                     ; preds = %303
  %321 = load i32* %k, align 4
  %322 = sext i32 %321 to i64
  %323 = load i32** %libs1, align 8
  %324 = getelementptr inbounds i32* %323, i64 %322
  %325 = load i32* %324, align 4
  %326 = add nsw i32 %325, 1
  %327 = sext i32 %326 to i64
  %328 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %327
  %329 = load i32* %328, align 4
  %330 = load i32* %3, align 4
  %331 = sext i32 %330 to i64
  %332 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %331
  %333 = load i32* %332, align 4
  %334 = icmp eq i32 %329, %333
  br i1 %334, label %335, label %338

; <label>:335                                     ; preds = %320, %288, %256, %224
  %336 = load i32* %commonlibs, align 4
  %337 = add nsw i32 %336, 1
  store i32 %337, i32* %commonlibs, align 4
  br label %338

; <label>:338                                     ; preds = %335, %320, %303
  br label %339

; <label>:339                                     ; preds = %338
  %340 = load i32* %k, align 4
  %341 = add nsw i32 %340, 1
  store i32 %341, i32* %k, align 4
  br label %203

; <label>:342                                     ; preds = %203
  %343 = load i32* %commonlibs, align 4
  store i32 %343, i32* %1
  br label %344

; <label>:344                                     ; preds = %342, %194
  %345 = load i32* %1
  ret i32 %345
}

; Function Attrs: nounwind uwtable
define i32 @approxlib(i32 %pos, i32 %color, i32 %maxlib, i32* %libs) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32*, align 8
  %k = alloca i32, align 4
  %liberties = alloca i32, align 4
  %fast_liberties = alloca i32, align 4
  %s = alloca i32, align 4
  %lib = alloca i32, align 4
  %s1 = alloca i32, align 4
  %lib2 = alloca i32, align 4
  %s3 = alloca i32, align 4
  %lib4 = alloca i32, align 4
  %s5 = alloca i32, align 4
  %lib6 = alloca i32, align 4
  store i32 %pos, i32* %2, align 4
  store i32 %color, i32* %3, align 4
  store i32 %maxlib, i32* %4, align 4
  store i32* %libs, i32** %5, align 8
  store i32 0, i32* %liberties, align 4
  %6 = load i32* %2, align 4
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %7
  %9 = load i8* %8, align 1
  %10 = zext i8 %9 to i32
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %13

; <label>:12                                      ; preds = %0
  br label %20

; <label>:13                                      ; preds = %0
  %14 = load i32* %2, align 4
  %15 = sdiv i32 %14, 20
  %16 = sub nsw i32 %15, 1
  %17 = load i32* %2, align 4
  %18 = srem i32 %17, 20
  %19 = sub nsw i32 %18, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 1595, i8* getelementptr inbounds ([20 x i8]* @.str20, i32 0, i32 0), i32 %16, i32 %19)
  br label %20

; <label>:20                                      ; preds = %13, %12
  %21 = load i32* %3, align 4
  %22 = icmp eq i32 %21, 1
  br i1 %22, label %26, label %23

; <label>:23                                      ; preds = %20
  %24 = load i32* %3, align 4
  %25 = icmp eq i32 %24, 2
  br i1 %25, label %26, label %27

; <label>:26                                      ; preds = %23, %20
  br label %34

; <label>:27                                      ; preds = %23
  %28 = load i32* %2, align 4
  %29 = sdiv i32 %28, 20
  %30 = sub nsw i32 %29, 1
  %31 = load i32* %2, align 4
  %32 = srem i32 %31, 20
  %33 = sub nsw i32 %32, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 1596, i8* getelementptr inbounds ([16 x i8]* @.str28, i32 0, i32 0), i32 %30, i32 %33)
  br label %34

; <label>:34                                      ; preds = %27, %26
  %35 = load i32** %5, align 8
  %36 = icmp ne i32* %35, null
  br i1 %36, label %46, label %37

; <label>:37                                      ; preds = %34
  %38 = load i32* %2, align 4
  %39 = load i32* %3, align 4
  %40 = call i32 @fastlib(i32 %38, i32 %39, i32 1)
  store i32 %40, i32* %fast_liberties, align 4
  %41 = load i32* %fast_liberties, align 4
  %42 = icmp sge i32 %41, 0
  br i1 %42, label %43, label %45

; <label>:43                                      ; preds = %37
  %44 = load i32* %fast_liberties, align 4
  store i32 %44, i32* %1
  br label %510

; <label>:45                                      ; preds = %37
  br label %46

; <label>:46                                      ; preds = %45, %34
  %47 = load i32* %4, align 4
  %48 = icmp sgt i32 %47, 20
  br i1 %48, label %49, label %55

; <label>:49                                      ; preds = %46
  %50 = load i32* %2, align 4
  %51 = load i32* %3, align 4
  %52 = load i32* %4, align 4
  %53 = load i32** %5, align 8
  %54 = call i32 @slow_approxlib(i32 %50, i32 %51, i32 %52, i32* %53)
  store i32 %54, i32* %1
  br label %510

; <label>:55                                      ; preds = %46
  %56 = load i32* @liberty_mark, align 4
  %57 = add nsw i32 %56, 1
  store i32 %57, i32* @liberty_mark, align 4
  %58 = load i32* @liberty_mark, align 4
  %59 = load i32* %2, align 4
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %60
  store i32 %58, i32* %61, align 4
  %62 = load i32* %2, align 4
  %63 = add nsw i32 %62, 20
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %64
  %66 = load i8* %65, align 1
  %67 = zext i8 %66 to i32
  %68 = icmp eq i32 %67, 0
  br i1 %68, label %69, label %101

; <label>:69                                      ; preds = %55
  %70 = load i32* %2, align 4
  %71 = add nsw i32 %70, 20
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %72
  %74 = load i32* %73, align 4
  %75 = load i32* @liberty_mark, align 4
  %76 = icmp ne i32 %74, %75
  br i1 %76, label %77, label %101

; <label>:77                                      ; preds = %69
  %78 = load i32** %5, align 8
  %79 = icmp ne i32* %78, null
  br i1 %79, label %80, label %87

; <label>:80                                      ; preds = %77
  %81 = load i32* %2, align 4
  %82 = add nsw i32 %81, 20
  %83 = load i32* %liberties, align 4
  %84 = sext i32 %83 to i64
  %85 = load i32** %5, align 8
  %86 = getelementptr inbounds i32* %85, i64 %84
  store i32 %82, i32* %86, align 4
  br label %87

; <label>:87                                      ; preds = %80, %77
  %88 = load i32* %liberties, align 4
  %89 = add nsw i32 %88, 1
  store i32 %89, i32* %liberties, align 4
  %90 = load i32* %liberties, align 4
  %91 = load i32* %4, align 4
  %92 = icmp sge i32 %90, %91
  br i1 %92, label %93, label %95

; <label>:93                                      ; preds = %87
  %94 = load i32* %liberties, align 4
  store i32 %94, i32* %1
  br label %510

; <label>:95                                      ; preds = %87
  %96 = load i32* @liberty_mark, align 4
  %97 = load i32* %2, align 4
  %98 = add nsw i32 %97, 20
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %99
  store i32 %96, i32* %100, align 4
  br label %174

; <label>:101                                     ; preds = %69, %55
  %102 = load i32* %2, align 4
  %103 = add nsw i32 %102, 20
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %104
  %106 = load i8* %105, align 1
  %107 = zext i8 %106 to i32
  %108 = load i32* %3, align 4
  %109 = icmp eq i32 %107, %108
  br i1 %109, label %110, label %173

; <label>:110                                     ; preds = %101
  %111 = load i32* %2, align 4
  %112 = add nsw i32 %111, 20
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %113
  %115 = load i32* %114, align 4
  store i32 %115, i32* %s, align 4
  store i32 0, i32* %k, align 4
  br label %116

; <label>:116                                     ; preds = %169, %110
  %117 = load i32* %k, align 4
  %118 = load i32* %s, align 4
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %119
  %121 = getelementptr inbounds %struct.string_data* %120, i32 0, i32 3
  %122 = load i32* %121, align 4
  %123 = icmp slt i32 %117, %122
  br i1 %123, label %124, label %172

; <label>:124                                     ; preds = %116
  %125 = load i32* %k, align 4
  %126 = sext i32 %125 to i64
  %127 = load i32* %s, align 4
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %128
  %130 = getelementptr inbounds %struct.string_data* %129, i32 0, i32 4
  %131 = getelementptr inbounds [20 x i32]* %130, i32 0, i64 %126
  %132 = load i32* %131, align 4
  store i32 %132, i32* %lib, align 4
  %133 = load i32* %lib, align 4
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %134
  %136 = load i8* %135, align 1
  %137 = zext i8 %136 to i32
  %138 = icmp eq i32 %137, 0
  br i1 %138, label %139, label %168

; <label>:139                                     ; preds = %124
  %140 = load i32* %lib, align 4
  %141 = sext i32 %140 to i64
  %142 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %141
  %143 = load i32* %142, align 4
  %144 = load i32* @liberty_mark, align 4
  %145 = icmp ne i32 %143, %144
  br i1 %145, label %146, label %168

; <label>:146                                     ; preds = %139
  %147 = load i32** %5, align 8
  %148 = icmp ne i32* %147, null
  br i1 %148, label %149, label %155

; <label>:149                                     ; preds = %146
  %150 = load i32* %lib, align 4
  %151 = load i32* %liberties, align 4
  %152 = sext i32 %151 to i64
  %153 = load i32** %5, align 8
  %154 = getelementptr inbounds i32* %153, i64 %152
  store i32 %150, i32* %154, align 4
  br label %155

; <label>:155                                     ; preds = %149, %146
  %156 = load i32* %liberties, align 4
  %157 = add nsw i32 %156, 1
  store i32 %157, i32* %liberties, align 4
  %158 = load i32* %liberties, align 4
  %159 = load i32* %4, align 4
  %160 = icmp sge i32 %158, %159
  br i1 %160, label %161, label %163

; <label>:161                                     ; preds = %155
  %162 = load i32* %liberties, align 4
  store i32 %162, i32* %1
  br label %510

; <label>:163                                     ; preds = %155
  %164 = load i32* @liberty_mark, align 4
  %165 = load i32* %lib, align 4
  %166 = sext i32 %165 to i64
  %167 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %166
  store i32 %164, i32* %167, align 4
  br label %168

; <label>:168                                     ; preds = %163, %139, %124
  br label %169

; <label>:169                                     ; preds = %168
  %170 = load i32* %k, align 4
  %171 = add nsw i32 %170, 1
  store i32 %171, i32* %k, align 4
  br label %116

; <label>:172                                     ; preds = %116
  br label %173

; <label>:173                                     ; preds = %172, %101
  br label %174

; <label>:174                                     ; preds = %173, %95
  %175 = load i32* %2, align 4
  %176 = sub nsw i32 %175, 1
  %177 = sext i32 %176 to i64
  %178 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %177
  %179 = load i8* %178, align 1
  %180 = zext i8 %179 to i32
  %181 = icmp eq i32 %180, 0
  br i1 %181, label %182, label %214

; <label>:182                                     ; preds = %174
  %183 = load i32* %2, align 4
  %184 = sub nsw i32 %183, 1
  %185 = sext i32 %184 to i64
  %186 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %185
  %187 = load i32* %186, align 4
  %188 = load i32* @liberty_mark, align 4
  %189 = icmp ne i32 %187, %188
  br i1 %189, label %190, label %214

; <label>:190                                     ; preds = %182
  %191 = load i32** %5, align 8
  %192 = icmp ne i32* %191, null
  br i1 %192, label %193, label %200

; <label>:193                                     ; preds = %190
  %194 = load i32* %2, align 4
  %195 = sub nsw i32 %194, 1
  %196 = load i32* %liberties, align 4
  %197 = sext i32 %196 to i64
  %198 = load i32** %5, align 8
  %199 = getelementptr inbounds i32* %198, i64 %197
  store i32 %195, i32* %199, align 4
  br label %200

; <label>:200                                     ; preds = %193, %190
  %201 = load i32* %liberties, align 4
  %202 = add nsw i32 %201, 1
  store i32 %202, i32* %liberties, align 4
  %203 = load i32* %liberties, align 4
  %204 = load i32* %4, align 4
  %205 = icmp sge i32 %203, %204
  br i1 %205, label %206, label %208

; <label>:206                                     ; preds = %200
  %207 = load i32* %liberties, align 4
  store i32 %207, i32* %1
  br label %510

; <label>:208                                     ; preds = %200
  %209 = load i32* @liberty_mark, align 4
  %210 = load i32* %2, align 4
  %211 = sub nsw i32 %210, 1
  %212 = sext i32 %211 to i64
  %213 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %212
  store i32 %209, i32* %213, align 4
  br label %287

; <label>:214                                     ; preds = %182, %174
  %215 = load i32* %2, align 4
  %216 = sub nsw i32 %215, 1
  %217 = sext i32 %216 to i64
  %218 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %217
  %219 = load i8* %218, align 1
  %220 = zext i8 %219 to i32
  %221 = load i32* %3, align 4
  %222 = icmp eq i32 %220, %221
  br i1 %222, label %223, label %286

; <label>:223                                     ; preds = %214
  %224 = load i32* %2, align 4
  %225 = sub nsw i32 %224, 1
  %226 = sext i32 %225 to i64
  %227 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %226
  %228 = load i32* %227, align 4
  store i32 %228, i32* %s1, align 4
  store i32 0, i32* %k, align 4
  br label %229

; <label>:229                                     ; preds = %282, %223
  %230 = load i32* %k, align 4
  %231 = load i32* %s1, align 4
  %232 = sext i32 %231 to i64
  %233 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %232
  %234 = getelementptr inbounds %struct.string_data* %233, i32 0, i32 3
  %235 = load i32* %234, align 4
  %236 = icmp slt i32 %230, %235
  br i1 %236, label %237, label %285

; <label>:237                                     ; preds = %229
  %238 = load i32* %k, align 4
  %239 = sext i32 %238 to i64
  %240 = load i32* %s1, align 4
  %241 = sext i32 %240 to i64
  %242 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %241
  %243 = getelementptr inbounds %struct.string_data* %242, i32 0, i32 4
  %244 = getelementptr inbounds [20 x i32]* %243, i32 0, i64 %239
  %245 = load i32* %244, align 4
  store i32 %245, i32* %lib2, align 4
  %246 = load i32* %lib2, align 4
  %247 = sext i32 %246 to i64
  %248 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %247
  %249 = load i8* %248, align 1
  %250 = zext i8 %249 to i32
  %251 = icmp eq i32 %250, 0
  br i1 %251, label %252, label %281

; <label>:252                                     ; preds = %237
  %253 = load i32* %lib2, align 4
  %254 = sext i32 %253 to i64
  %255 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %254
  %256 = load i32* %255, align 4
  %257 = load i32* @liberty_mark, align 4
  %258 = icmp ne i32 %256, %257
  br i1 %258, label %259, label %281

; <label>:259                                     ; preds = %252
  %260 = load i32** %5, align 8
  %261 = icmp ne i32* %260, null
  br i1 %261, label %262, label %268

; <label>:262                                     ; preds = %259
  %263 = load i32* %lib2, align 4
  %264 = load i32* %liberties, align 4
  %265 = sext i32 %264 to i64
  %266 = load i32** %5, align 8
  %267 = getelementptr inbounds i32* %266, i64 %265
  store i32 %263, i32* %267, align 4
  br label %268

; <label>:268                                     ; preds = %262, %259
  %269 = load i32* %liberties, align 4
  %270 = add nsw i32 %269, 1
  store i32 %270, i32* %liberties, align 4
  %271 = load i32* %liberties, align 4
  %272 = load i32* %4, align 4
  %273 = icmp sge i32 %271, %272
  br i1 %273, label %274, label %276

; <label>:274                                     ; preds = %268
  %275 = load i32* %liberties, align 4
  store i32 %275, i32* %1
  br label %510

; <label>:276                                     ; preds = %268
  %277 = load i32* @liberty_mark, align 4
  %278 = load i32* %lib2, align 4
  %279 = sext i32 %278 to i64
  %280 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %279
  store i32 %277, i32* %280, align 4
  br label %281

; <label>:281                                     ; preds = %276, %252, %237
  br label %282

; <label>:282                                     ; preds = %281
  %283 = load i32* %k, align 4
  %284 = add nsw i32 %283, 1
  store i32 %284, i32* %k, align 4
  br label %229

; <label>:285                                     ; preds = %229
  br label %286

; <label>:286                                     ; preds = %285, %214
  br label %287

; <label>:287                                     ; preds = %286, %208
  %288 = load i32* %2, align 4
  %289 = sub nsw i32 %288, 20
  %290 = sext i32 %289 to i64
  %291 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %290
  %292 = load i8* %291, align 1
  %293 = zext i8 %292 to i32
  %294 = icmp eq i32 %293, 0
  br i1 %294, label %295, label %327

; <label>:295                                     ; preds = %287
  %296 = load i32* %2, align 4
  %297 = sub nsw i32 %296, 20
  %298 = sext i32 %297 to i64
  %299 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %298
  %300 = load i32* %299, align 4
  %301 = load i32* @liberty_mark, align 4
  %302 = icmp ne i32 %300, %301
  br i1 %302, label %303, label %327

; <label>:303                                     ; preds = %295
  %304 = load i32** %5, align 8
  %305 = icmp ne i32* %304, null
  br i1 %305, label %306, label %313

; <label>:306                                     ; preds = %303
  %307 = load i32* %2, align 4
  %308 = sub nsw i32 %307, 20
  %309 = load i32* %liberties, align 4
  %310 = sext i32 %309 to i64
  %311 = load i32** %5, align 8
  %312 = getelementptr inbounds i32* %311, i64 %310
  store i32 %308, i32* %312, align 4
  br label %313

; <label>:313                                     ; preds = %306, %303
  %314 = load i32* %liberties, align 4
  %315 = add nsw i32 %314, 1
  store i32 %315, i32* %liberties, align 4
  %316 = load i32* %liberties, align 4
  %317 = load i32* %4, align 4
  %318 = icmp sge i32 %316, %317
  br i1 %318, label %319, label %321

; <label>:319                                     ; preds = %313
  %320 = load i32* %liberties, align 4
  store i32 %320, i32* %1
  br label %510

; <label>:321                                     ; preds = %313
  %322 = load i32* @liberty_mark, align 4
  %323 = load i32* %2, align 4
  %324 = sub nsw i32 %323, 20
  %325 = sext i32 %324 to i64
  %326 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %325
  store i32 %322, i32* %326, align 4
  br label %400

; <label>:327                                     ; preds = %295, %287
  %328 = load i32* %2, align 4
  %329 = sub nsw i32 %328, 20
  %330 = sext i32 %329 to i64
  %331 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %330
  %332 = load i8* %331, align 1
  %333 = zext i8 %332 to i32
  %334 = load i32* %3, align 4
  %335 = icmp eq i32 %333, %334
  br i1 %335, label %336, label %399

; <label>:336                                     ; preds = %327
  %337 = load i32* %2, align 4
  %338 = sub nsw i32 %337, 20
  %339 = sext i32 %338 to i64
  %340 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %339
  %341 = load i32* %340, align 4
  store i32 %341, i32* %s3, align 4
  store i32 0, i32* %k, align 4
  br label %342

; <label>:342                                     ; preds = %395, %336
  %343 = load i32* %k, align 4
  %344 = load i32* %s3, align 4
  %345 = sext i32 %344 to i64
  %346 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %345
  %347 = getelementptr inbounds %struct.string_data* %346, i32 0, i32 3
  %348 = load i32* %347, align 4
  %349 = icmp slt i32 %343, %348
  br i1 %349, label %350, label %398

; <label>:350                                     ; preds = %342
  %351 = load i32* %k, align 4
  %352 = sext i32 %351 to i64
  %353 = load i32* %s3, align 4
  %354 = sext i32 %353 to i64
  %355 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %354
  %356 = getelementptr inbounds %struct.string_data* %355, i32 0, i32 4
  %357 = getelementptr inbounds [20 x i32]* %356, i32 0, i64 %352
  %358 = load i32* %357, align 4
  store i32 %358, i32* %lib4, align 4
  %359 = load i32* %lib4, align 4
  %360 = sext i32 %359 to i64
  %361 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %360
  %362 = load i8* %361, align 1
  %363 = zext i8 %362 to i32
  %364 = icmp eq i32 %363, 0
  br i1 %364, label %365, label %394

; <label>:365                                     ; preds = %350
  %366 = load i32* %lib4, align 4
  %367 = sext i32 %366 to i64
  %368 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %367
  %369 = load i32* %368, align 4
  %370 = load i32* @liberty_mark, align 4
  %371 = icmp ne i32 %369, %370
  br i1 %371, label %372, label %394

; <label>:372                                     ; preds = %365
  %373 = load i32** %5, align 8
  %374 = icmp ne i32* %373, null
  br i1 %374, label %375, label %381

; <label>:375                                     ; preds = %372
  %376 = load i32* %lib4, align 4
  %377 = load i32* %liberties, align 4
  %378 = sext i32 %377 to i64
  %379 = load i32** %5, align 8
  %380 = getelementptr inbounds i32* %379, i64 %378
  store i32 %376, i32* %380, align 4
  br label %381

; <label>:381                                     ; preds = %375, %372
  %382 = load i32* %liberties, align 4
  %383 = add nsw i32 %382, 1
  store i32 %383, i32* %liberties, align 4
  %384 = load i32* %liberties, align 4
  %385 = load i32* %4, align 4
  %386 = icmp sge i32 %384, %385
  br i1 %386, label %387, label %389

; <label>:387                                     ; preds = %381
  %388 = load i32* %liberties, align 4
  store i32 %388, i32* %1
  br label %510

; <label>:389                                     ; preds = %381
  %390 = load i32* @liberty_mark, align 4
  %391 = load i32* %lib4, align 4
  %392 = sext i32 %391 to i64
  %393 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %392
  store i32 %390, i32* %393, align 4
  br label %394

; <label>:394                                     ; preds = %389, %365, %350
  br label %395

; <label>:395                                     ; preds = %394
  %396 = load i32* %k, align 4
  %397 = add nsw i32 %396, 1
  store i32 %397, i32* %k, align 4
  br label %342

; <label>:398                                     ; preds = %342
  br label %399

; <label>:399                                     ; preds = %398, %327
  br label %400

; <label>:400                                     ; preds = %399, %321
  %401 = load i32* %2, align 4
  %402 = add nsw i32 %401, 1
  %403 = sext i32 %402 to i64
  %404 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %403
  %405 = load i8* %404, align 1
  %406 = zext i8 %405 to i32
  %407 = icmp eq i32 %406, 0
  br i1 %407, label %408, label %435

; <label>:408                                     ; preds = %400
  %409 = load i32* %2, align 4
  %410 = add nsw i32 %409, 1
  %411 = sext i32 %410 to i64
  %412 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %411
  %413 = load i32* %412, align 4
  %414 = load i32* @liberty_mark, align 4
  %415 = icmp ne i32 %413, %414
  br i1 %415, label %416, label %435

; <label>:416                                     ; preds = %408
  %417 = load i32** %5, align 8
  %418 = icmp ne i32* %417, null
  br i1 %418, label %419, label %426

; <label>:419                                     ; preds = %416
  %420 = load i32* %2, align 4
  %421 = add nsw i32 %420, 1
  %422 = load i32* %liberties, align 4
  %423 = sext i32 %422 to i64
  %424 = load i32** %5, align 8
  %425 = getelementptr inbounds i32* %424, i64 %423
  store i32 %421, i32* %425, align 4
  br label %426

; <label>:426                                     ; preds = %419, %416
  %427 = load i32* %liberties, align 4
  %428 = add nsw i32 %427, 1
  store i32 %428, i32* %liberties, align 4
  %429 = load i32* %liberties, align 4
  %430 = load i32* %4, align 4
  %431 = icmp sge i32 %429, %430
  br i1 %431, label %432, label %434

; <label>:432                                     ; preds = %426
  %433 = load i32* %liberties, align 4
  store i32 %433, i32* %1
  br label %510

; <label>:434                                     ; preds = %426
  br label %508

; <label>:435                                     ; preds = %408, %400
  %436 = load i32* %2, align 4
  %437 = add nsw i32 %436, 1
  %438 = sext i32 %437 to i64
  %439 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %438
  %440 = load i8* %439, align 1
  %441 = zext i8 %440 to i32
  %442 = load i32* %3, align 4
  %443 = icmp eq i32 %441, %442
  br i1 %443, label %444, label %507

; <label>:444                                     ; preds = %435
  %445 = load i32* %2, align 4
  %446 = add nsw i32 %445, 1
  %447 = sext i32 %446 to i64
  %448 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %447
  %449 = load i32* %448, align 4
  store i32 %449, i32* %s5, align 4
  store i32 0, i32* %k, align 4
  br label %450

; <label>:450                                     ; preds = %503, %444
  %451 = load i32* %k, align 4
  %452 = load i32* %s5, align 4
  %453 = sext i32 %452 to i64
  %454 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %453
  %455 = getelementptr inbounds %struct.string_data* %454, i32 0, i32 3
  %456 = load i32* %455, align 4
  %457 = icmp slt i32 %451, %456
  br i1 %457, label %458, label %506

; <label>:458                                     ; preds = %450
  %459 = load i32* %k, align 4
  %460 = sext i32 %459 to i64
  %461 = load i32* %s5, align 4
  %462 = sext i32 %461 to i64
  %463 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %462
  %464 = getelementptr inbounds %struct.string_data* %463, i32 0, i32 4
  %465 = getelementptr inbounds [20 x i32]* %464, i32 0, i64 %460
  %466 = load i32* %465, align 4
  store i32 %466, i32* %lib6, align 4
  %467 = load i32* %lib6, align 4
  %468 = sext i32 %467 to i64
  %469 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %468
  %470 = load i8* %469, align 1
  %471 = zext i8 %470 to i32
  %472 = icmp eq i32 %471, 0
  br i1 %472, label %473, label %502

; <label>:473                                     ; preds = %458
  %474 = load i32* %lib6, align 4
  %475 = sext i32 %474 to i64
  %476 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %475
  %477 = load i32* %476, align 4
  %478 = load i32* @liberty_mark, align 4
  %479 = icmp ne i32 %477, %478
  br i1 %479, label %480, label %502

; <label>:480                                     ; preds = %473
  %481 = load i32** %5, align 8
  %482 = icmp ne i32* %481, null
  br i1 %482, label %483, label %489

; <label>:483                                     ; preds = %480
  %484 = load i32* %lib6, align 4
  %485 = load i32* %liberties, align 4
  %486 = sext i32 %485 to i64
  %487 = load i32** %5, align 8
  %488 = getelementptr inbounds i32* %487, i64 %486
  store i32 %484, i32* %488, align 4
  br label %489

; <label>:489                                     ; preds = %483, %480
  %490 = load i32* %liberties, align 4
  %491 = add nsw i32 %490, 1
  store i32 %491, i32* %liberties, align 4
  %492 = load i32* %liberties, align 4
  %493 = load i32* %4, align 4
  %494 = icmp sge i32 %492, %493
  br i1 %494, label %495, label %497

; <label>:495                                     ; preds = %489
  %496 = load i32* %liberties, align 4
  store i32 %496, i32* %1
  br label %510

; <label>:497                                     ; preds = %489
  %498 = load i32* @liberty_mark, align 4
  %499 = load i32* %lib6, align 4
  %500 = sext i32 %499 to i64
  %501 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %500
  store i32 %498, i32* %501, align 4
  br label %502

; <label>:502                                     ; preds = %497, %473, %458
  br label %503

; <label>:503                                     ; preds = %502
  %504 = load i32* %k, align 4
  %505 = add nsw i32 %504, 1
  store i32 %505, i32* %k, align 4
  br label %450

; <label>:506                                     ; preds = %450
  br label %507

; <label>:507                                     ; preds = %506, %435
  br label %508

; <label>:508                                     ; preds = %507, %434
  %509 = load i32* %liberties, align 4
  store i32 %509, i32* %1
  br label %510

; <label>:510                                     ; preds = %508, %495, %432, %387, %319, %274, %206, %161, %93, %49, %43
  %511 = load i32* %1
  ret i32 %511
}

; Function Attrs: nounwind uwtable
define internal i32 @slow_approxlib(i32 %pos, i32 %color, i32 %maxlib, i32* %libs) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32*, align 8
  %liberties = alloca i32, align 4
  %k = alloca i32, align 4
  %d = alloca i32, align 4
  %s = alloca i32, align 4
  %pos2 = alloca i32, align 4
  %l = alloca i32, align 4
  %d2 = alloca i32, align 4
  store i32 %pos, i32* %2, align 4
  store i32 %color, i32* %3, align 4
  store i32 %maxlib, i32* %4, align 4
  store i32* %libs, i32** %5, align 8
  store i32 0, i32* %liberties, align 4
  %6 = load i32* @liberty_mark, align 4
  %7 = add nsw i32 %6, 1
  store i32 %7, i32* @liberty_mark, align 4
  %8 = load i32* @liberty_mark, align 4
  %9 = load i32* %2, align 4
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %10
  store i32 %8, i32* %11, align 4
  %12 = load i32* @string_mark, align 4
  %13 = add nsw i32 %12, 1
  store i32 %13, i32* @string_mark, align 4
  store i32 0, i32* %k, align 4
  br label %14

; <label>:14                                      ; preds = %183, %0
  %15 = load i32* %k, align 4
  %16 = icmp slt i32 %15, 4
  br i1 %16, label %17, label %186

; <label>:17                                      ; preds = %14
  %18 = load i32* %k, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds [8 x i32]* @delta, i32 0, i64 %19
  %21 = load i32* %20, align 4
  store i32 %21, i32* %d, align 4
  %22 = load i32* %2, align 4
  %23 = load i32* %d, align 4
  %24 = add nsw i32 %22, %23
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %25
  %27 = load i8* %26, align 1
  %28 = zext i8 %27 to i32
  %29 = icmp eq i32 %28, 0
  br i1 %29, label %30, label %65

; <label>:30                                      ; preds = %17
  %31 = load i32* %2, align 4
  %32 = load i32* %d, align 4
  %33 = add nsw i32 %31, %32
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %34
  %36 = load i32* %35, align 4
  %37 = load i32* @liberty_mark, align 4
  %38 = icmp ne i32 %36, %37
  br i1 %38, label %39, label %65

; <label>:39                                      ; preds = %30
  %40 = load i32** %5, align 8
  %41 = icmp ne i32* %40, null
  br i1 %41, label %42, label %50

; <label>:42                                      ; preds = %39
  %43 = load i32* %2, align 4
  %44 = load i32* %d, align 4
  %45 = add nsw i32 %43, %44
  %46 = load i32* %liberties, align 4
  %47 = sext i32 %46 to i64
  %48 = load i32** %5, align 8
  %49 = getelementptr inbounds i32* %48, i64 %47
  store i32 %45, i32* %49, align 4
  br label %50

; <label>:50                                      ; preds = %42, %39
  %51 = load i32* %liberties, align 4
  %52 = add nsw i32 %51, 1
  store i32 %52, i32* %liberties, align 4
  %53 = load i32* %liberties, align 4
  %54 = load i32* %4, align 4
  %55 = icmp eq i32 %53, %54
  br i1 %55, label %56, label %58

; <label>:56                                      ; preds = %50
  %57 = load i32* %liberties, align 4
  store i32 %57, i32* %1
  br label %188

; <label>:58                                      ; preds = %50
  %59 = load i32* @liberty_mark, align 4
  %60 = load i32* %2, align 4
  %61 = load i32* %d, align 4
  %62 = add nsw i32 %60, %61
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %63
  store i32 %59, i32* %64, align 4
  br label %182

; <label>:65                                      ; preds = %30, %17
  %66 = load i32* %2, align 4
  %67 = load i32* %d, align 4
  %68 = add nsw i32 %66, %67
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %69
  %71 = load i8* %70, align 1
  %72 = zext i8 %71 to i32
  %73 = load i32* %3, align 4
  %74 = icmp eq i32 %72, %73
  br i1 %74, label %75, label %181

; <label>:75                                      ; preds = %65
  %76 = load i32* %2, align 4
  %77 = load i32* %d, align 4
  %78 = add nsw i32 %76, %77
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %79
  %81 = load i32* %80, align 4
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %82
  %84 = getelementptr inbounds %struct.string_data* %83, i32 0, i32 7
  %85 = load i32* %84, align 4
  %86 = load i32* @string_mark, align 4
  %87 = icmp ne i32 %85, %86
  br i1 %87, label %88, label %181

; <label>:88                                      ; preds = %75
  %89 = load i32* %2, align 4
  %90 = load i32* %d, align 4
  %91 = add nsw i32 %89, %90
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %92
  %94 = load i32* %93, align 4
  store i32 %94, i32* %s, align 4
  %95 = load i32* %s, align 4
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %96
  %98 = getelementptr inbounds %struct.string_data* %97, i32 0, i32 2
  %99 = load i32* %98, align 4
  store i32 %99, i32* %pos2, align 4
  br label %100

; <label>:100                                     ; preds = %161, %88
  store i32 0, i32* %l, align 4
  br label %101

; <label>:101                                     ; preds = %153, %100
  %102 = load i32* %l, align 4
  %103 = icmp slt i32 %102, 4
  br i1 %103, label %104, label %156

; <label>:104                                     ; preds = %101
  %105 = load i32* %l, align 4
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds [8 x i32]* @delta, i32 0, i64 %106
  %108 = load i32* %107, align 4
  store i32 %108, i32* %d2, align 4
  %109 = load i32* %pos2, align 4
  %110 = load i32* %d2, align 4
  %111 = add nsw i32 %109, %110
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %112
  %114 = load i8* %113, align 1
  %115 = zext i8 %114 to i32
  %116 = icmp eq i32 %115, 0
  br i1 %116, label %117, label %152

; <label>:117                                     ; preds = %104
  %118 = load i32* %pos2, align 4
  %119 = load i32* %d2, align 4
  %120 = add nsw i32 %118, %119
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %121
  %123 = load i32* %122, align 4
  %124 = load i32* @liberty_mark, align 4
  %125 = icmp ne i32 %123, %124
  br i1 %125, label %126, label %152

; <label>:126                                     ; preds = %117
  %127 = load i32** %5, align 8
  %128 = icmp ne i32* %127, null
  br i1 %128, label %129, label %137

; <label>:129                                     ; preds = %126
  %130 = load i32* %pos2, align 4
  %131 = load i32* %d2, align 4
  %132 = add nsw i32 %130, %131
  %133 = load i32* %liberties, align 4
  %134 = sext i32 %133 to i64
  %135 = load i32** %5, align 8
  %136 = getelementptr inbounds i32* %135, i64 %134
  store i32 %132, i32* %136, align 4
  br label %137

; <label>:137                                     ; preds = %129, %126
  %138 = load i32* %liberties, align 4
  %139 = add nsw i32 %138, 1
  store i32 %139, i32* %liberties, align 4
  %140 = load i32* %liberties, align 4
  %141 = load i32* %4, align 4
  %142 = icmp eq i32 %140, %141
  br i1 %142, label %143, label %145

; <label>:143                                     ; preds = %137
  %144 = load i32* %liberties, align 4
  store i32 %144, i32* %1
  br label %188

; <label>:145                                     ; preds = %137
  %146 = load i32* @liberty_mark, align 4
  %147 = load i32* %pos2, align 4
  %148 = load i32* %d2, align 4
  %149 = add nsw i32 %147, %148
  %150 = sext i32 %149 to i64
  %151 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %150
  store i32 %146, i32* %151, align 4
  br label %152

; <label>:152                                     ; preds = %145, %117, %104
  br label %153

; <label>:153                                     ; preds = %152
  %154 = load i32* %l, align 4
  %155 = add nsw i32 %154, 1
  store i32 %155, i32* %l, align 4
  br label %101

; <label>:156                                     ; preds = %101
  %157 = load i32* %pos2, align 4
  %158 = sext i32 %157 to i64
  %159 = getelementptr inbounds [400 x i32]* @next_stone, i32 0, i64 %158
  %160 = load i32* %159, align 4
  store i32 %160, i32* %pos2, align 4
  br label %161

; <label>:161                                     ; preds = %156
  %162 = load i32* %pos2, align 4
  %163 = load i32* %s, align 4
  %164 = sext i32 %163 to i64
  %165 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %164
  %166 = getelementptr inbounds %struct.string_data* %165, i32 0, i32 2
  %167 = load i32* %166, align 4
  %168 = icmp eq i32 %162, %167
  %169 = xor i1 %168, true
  br i1 %169, label %100, label %170

; <label>:170                                     ; preds = %161
  %171 = load i32* @string_mark, align 4
  %172 = load i32* %2, align 4
  %173 = load i32* %d, align 4
  %174 = add nsw i32 %172, %173
  %175 = sext i32 %174 to i64
  %176 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %175
  %177 = load i32* %176, align 4
  %178 = sext i32 %177 to i64
  %179 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %178
  %180 = getelementptr inbounds %struct.string_data* %179, i32 0, i32 7
  store i32 %171, i32* %180, align 4
  br label %181

; <label>:181                                     ; preds = %170, %75, %65
  br label %182

; <label>:182                                     ; preds = %181, %58
  br label %183

; <label>:183                                     ; preds = %182
  %184 = load i32* %k, align 4
  %185 = add nsw i32 %184, 1
  store i32 %185, i32* %k, align 4
  br label %14

; <label>:186                                     ; preds = %14
  %187 = load i32* %liberties, align 4
  store i32 %187, i32* %1
  br label %188

; <label>:188                                     ; preds = %186, %143, %56
  %189 = load i32* %1
  ret i32 %189
}

; Function Attrs: nounwind uwtable
define i32 @accuratelib(i32 %pos, i32 %color, i32 %maxlib, i32* %libs) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32*, align 8
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  %liberties = alloca i32, align 4
  %lib = alloca i32, align 4
  %captured = alloca [4 x i32], align 16
  %captures = alloca i32, align 4
  %fast_liberties = alloca i32, align 4
  %pos2 = alloca i32, align 4
  %s = alloca %struct.string_data*, align 8
  %stone = alloca i32, align 4
  store i32 %pos, i32* %2, align 4
  store i32 %color, i32* %3, align 4
  store i32 %maxlib, i32* %4, align 4
  store i32* %libs, i32** %5, align 8
  store i32 0, i32* %liberties, align 4
  store i32 0, i32* %captures, align 4
  %6 = load i32* %2, align 4
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %7
  %9 = load i8* %8, align 1
  %10 = zext i8 %9 to i32
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %13

; <label>:12                                      ; preds = %0
  br label %20

; <label>:13                                      ; preds = %0
  %14 = load i32* %2, align 4
  %15 = sdiv i32 %14, 20
  %16 = sub nsw i32 %15, 1
  %17 = load i32* %2, align 4
  %18 = srem i32 %17, 20
  %19 = sub nsw i32 %18, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 1745, i8* getelementptr inbounds ([20 x i8]* @.str20, i32 0, i32 0), i32 %16, i32 %19)
  br label %20

; <label>:20                                      ; preds = %13, %12
  %21 = load i32* %3, align 4
  %22 = icmp eq i32 %21, 1
  br i1 %22, label %26, label %23

; <label>:23                                      ; preds = %20
  %24 = load i32* %3, align 4
  %25 = icmp eq i32 %24, 2
  br i1 %25, label %26, label %27

; <label>:26                                      ; preds = %23, %20
  br label %34

; <label>:27                                      ; preds = %23
  %28 = load i32* %2, align 4
  %29 = sdiv i32 %28, 20
  %30 = sub nsw i32 %29, 1
  %31 = load i32* %2, align 4
  %32 = srem i32 %31, 20
  %33 = sub nsw i32 %32, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 1746, i8* getelementptr inbounds ([16 x i8]* @.str28, i32 0, i32 0), i32 %30, i32 %33)
  br label %34

; <label>:34                                      ; preds = %27, %26
  %35 = load i32** %5, align 8
  %36 = icmp ne i32* %35, null
  br i1 %36, label %46, label %37

; <label>:37                                      ; preds = %34
  %38 = load i32* %2, align 4
  %39 = load i32* %3, align 4
  %40 = call i32 @fastlib(i32 %38, i32 %39, i32 0)
  store i32 %40, i32* %fast_liberties, align 4
  %41 = load i32* %fast_liberties, align 4
  %42 = icmp sge i32 %41, 0
  br i1 %42, label %43, label %45

; <label>:43                                      ; preds = %37
  %44 = load i32* %fast_liberties, align 4
  store i32 %44, i32* %1
  br label %659

; <label>:45                                      ; preds = %37
  br label %46

; <label>:46                                      ; preds = %45, %34
  %47 = load i32* @string_mark, align 4
  %48 = add nsw i32 %47, 1
  store i32 %48, i32* @string_mark, align 4
  %49 = load i32* @liberty_mark, align 4
  %50 = add nsw i32 %49, 1
  store i32 %50, i32* @liberty_mark, align 4
  %51 = load i32* @liberty_mark, align 4
  %52 = load i32* %2, align 4
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %53
  store i32 %51, i32* %54, align 4
  store i32 0, i32* %k, align 4
  br label %55

; <label>:55                                      ; preds = %396, %46
  %56 = load i32* %k, align 4
  %57 = icmp slt i32 %56, 4
  br i1 %57, label %58, label %399

; <label>:58                                      ; preds = %55
  %59 = load i32* %2, align 4
  %60 = load i32* %k, align 4
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds [8 x i32]* @delta, i32 0, i64 %61
  %63 = load i32* %62, align 4
  %64 = add nsw i32 %59, %63
  store i32 %64, i32* %pos2, align 4
  %65 = load i32* %pos2, align 4
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %66
  %68 = load i8* %67, align 1
  %69 = zext i8 %68 to i32
  %70 = icmp eq i32 %69, 0
  br i1 %70, label %71, label %100

; <label>:71                                      ; preds = %58
  %72 = load i32* %pos2, align 4
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %73
  %75 = load i32* %74, align 4
  %76 = load i32* @liberty_mark, align 4
  %77 = icmp ne i32 %75, %76
  br i1 %77, label %78, label %100

; <label>:78                                      ; preds = %71
  %79 = load i32** %5, align 8
  %80 = icmp ne i32* %79, null
  br i1 %80, label %81, label %87

; <label>:81                                      ; preds = %78
  %82 = load i32* %pos2, align 4
  %83 = load i32* %liberties, align 4
  %84 = sext i32 %83 to i64
  %85 = load i32** %5, align 8
  %86 = getelementptr inbounds i32* %85, i64 %84
  store i32 %82, i32* %86, align 4
  br label %87

; <label>:87                                      ; preds = %81, %78
  %88 = load i32* %liberties, align 4
  %89 = add nsw i32 %88, 1
  store i32 %89, i32* %liberties, align 4
  %90 = load i32* %liberties, align 4
  %91 = load i32* %4, align 4
  %92 = icmp sge i32 %90, %91
  br i1 %92, label %93, label %95

; <label>:93                                      ; preds = %87
  %94 = load i32* %liberties, align 4
  store i32 %94, i32* %1
  br label %659

; <label>:95                                      ; preds = %87
  %96 = load i32* @liberty_mark, align 4
  %97 = load i32* %pos2, align 4
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %98
  store i32 %96, i32* %99, align 4
  br label %395

; <label>:100                                     ; preds = %71, %58
  %101 = load i32* %pos2, align 4
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %102
  %104 = load i8* %103, align 1
  %105 = zext i8 %104 to i32
  %106 = load i32* %3, align 4
  %107 = icmp eq i32 %105, %106
  br i1 %107, label %108, label %368

; <label>:108                                     ; preds = %100
  %109 = load i32* %pos2, align 4
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %110
  %112 = load i32* %111, align 4
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %113
  %115 = getelementptr inbounds %struct.string_data* %114, i32 0, i32 7
  %116 = load i32* %115, align 4
  %117 = load i32* @string_mark, align 4
  %118 = icmp ne i32 %116, %117
  br i1 %118, label %119, label %368

; <label>:119                                     ; preds = %108
  %120 = load i32* %pos2, align 4
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %121
  %123 = load i32* %122, align 4
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %124
  store %struct.string_data* %125, %struct.string_data** %s, align 8
  %126 = load %struct.string_data** %s, align 8
  %127 = getelementptr inbounds %struct.string_data* %126, i32 0, i32 3
  %128 = load i32* %127, align 4
  %129 = icmp sle i32 %128, 20
  br i1 %129, label %133, label %130

; <label>:130                                     ; preds = %119
  %131 = load i32* %4, align 4
  %132 = icmp sle i32 %131, 19
  br i1 %132, label %133, label %187

; <label>:133                                     ; preds = %130, %119
  store i32 0, i32* %l, align 4
  br label %134

; <label>:134                                     ; preds = %183, %133
  %135 = load i32* %l, align 4
  %136 = load %struct.string_data** %s, align 8
  %137 = getelementptr inbounds %struct.string_data* %136, i32 0, i32 3
  %138 = load i32* %137, align 4
  %139 = icmp slt i32 %135, %138
  br i1 %139, label %140, label %186

; <label>:140                                     ; preds = %134
  %141 = load i32* %l, align 4
  %142 = sext i32 %141 to i64
  %143 = load %struct.string_data** %s, align 8
  %144 = getelementptr inbounds %struct.string_data* %143, i32 0, i32 4
  %145 = getelementptr inbounds [20 x i32]* %144, i32 0, i64 %142
  %146 = load i32* %145, align 4
  store i32 %146, i32* %lib, align 4
  %147 = load i32* %lib, align 4
  %148 = sext i32 %147 to i64
  %149 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %148
  %150 = load i8* %149, align 1
  %151 = zext i8 %150 to i32
  %152 = icmp eq i32 %151, 0
  br i1 %152, label %153, label %182

; <label>:153                                     ; preds = %140
  %154 = load i32* %lib, align 4
  %155 = sext i32 %154 to i64
  %156 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %155
  %157 = load i32* %156, align 4
  %158 = load i32* @liberty_mark, align 4
  %159 = icmp ne i32 %157, %158
  br i1 %159, label %160, label %182

; <label>:160                                     ; preds = %153
  %161 = load i32** %5, align 8
  %162 = icmp ne i32* %161, null
  br i1 %162, label %163, label %169

; <label>:163                                     ; preds = %160
  %164 = load i32* %lib, align 4
  %165 = load i32* %liberties, align 4
  %166 = sext i32 %165 to i64
  %167 = load i32** %5, align 8
  %168 = getelementptr inbounds i32* %167, i64 %166
  store i32 %164, i32* %168, align 4
  br label %169

; <label>:169                                     ; preds = %163, %160
  %170 = load i32* %liberties, align 4
  %171 = add nsw i32 %170, 1
  store i32 %171, i32* %liberties, align 4
  %172 = load i32* %liberties, align 4
  %173 = load i32* %4, align 4
  %174 = icmp sge i32 %172, %173
  br i1 %174, label %175, label %177

; <label>:175                                     ; preds = %169
  %176 = load i32* %liberties, align 4
  store i32 %176, i32* %1
  br label %659

; <label>:177                                     ; preds = %169
  %178 = load i32* @liberty_mark, align 4
  %179 = load i32* %lib, align 4
  %180 = sext i32 %179 to i64
  %181 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %180
  store i32 %178, i32* %181, align 4
  br label %182

; <label>:182                                     ; preds = %177, %153, %140
  br label %183

; <label>:183                                     ; preds = %182
  %184 = load i32* %l, align 4
  %185 = add nsw i32 %184, 1
  store i32 %185, i32* %l, align 4
  br label %134

; <label>:186                                     ; preds = %134
  br label %359

; <label>:187                                     ; preds = %130
  %188 = load i32* %pos2, align 4
  store i32 %188, i32* %stone, align 4
  br label %189

; <label>:189                                     ; preds = %354, %187
  %190 = load i32* %stone, align 4
  %191 = add nsw i32 %190, 20
  %192 = sext i32 %191 to i64
  %193 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %192
  %194 = load i8* %193, align 1
  %195 = zext i8 %194 to i32
  %196 = icmp eq i32 %195, 0
  br i1 %196, label %197, label %229

; <label>:197                                     ; preds = %189
  %198 = load i32* %stone, align 4
  %199 = add nsw i32 %198, 20
  %200 = sext i32 %199 to i64
  %201 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %200
  %202 = load i32* %201, align 4
  %203 = load i32* @liberty_mark, align 4
  %204 = icmp ne i32 %202, %203
  br i1 %204, label %205, label %229

; <label>:205                                     ; preds = %197
  %206 = load i32** %5, align 8
  %207 = icmp ne i32* %206, null
  br i1 %207, label %208, label %215

; <label>:208                                     ; preds = %205
  %209 = load i32* %stone, align 4
  %210 = add nsw i32 %209, 20
  %211 = load i32* %liberties, align 4
  %212 = sext i32 %211 to i64
  %213 = load i32** %5, align 8
  %214 = getelementptr inbounds i32* %213, i64 %212
  store i32 %210, i32* %214, align 4
  br label %215

; <label>:215                                     ; preds = %208, %205
  %216 = load i32* %liberties, align 4
  %217 = add nsw i32 %216, 1
  store i32 %217, i32* %liberties, align 4
  %218 = load i32* %liberties, align 4
  %219 = load i32* %4, align 4
  %220 = icmp sge i32 %218, %219
  br i1 %220, label %221, label %223

; <label>:221                                     ; preds = %215
  %222 = load i32* %liberties, align 4
  store i32 %222, i32* %1
  br label %659

; <label>:223                                     ; preds = %215
  %224 = load i32* @liberty_mark, align 4
  %225 = load i32* %stone, align 4
  %226 = add nsw i32 %225, 20
  %227 = sext i32 %226 to i64
  %228 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %227
  store i32 %224, i32* %228, align 4
  br label %229

; <label>:229                                     ; preds = %223, %197, %189
  %230 = load i32* %stone, align 4
  %231 = sub nsw i32 %230, 1
  %232 = sext i32 %231 to i64
  %233 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %232
  %234 = load i8* %233, align 1
  %235 = zext i8 %234 to i32
  %236 = icmp eq i32 %235, 0
  br i1 %236, label %237, label %269

; <label>:237                                     ; preds = %229
  %238 = load i32* %stone, align 4
  %239 = sub nsw i32 %238, 1
  %240 = sext i32 %239 to i64
  %241 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %240
  %242 = load i32* %241, align 4
  %243 = load i32* @liberty_mark, align 4
  %244 = icmp ne i32 %242, %243
  br i1 %244, label %245, label %269

; <label>:245                                     ; preds = %237
  %246 = load i32** %5, align 8
  %247 = icmp ne i32* %246, null
  br i1 %247, label %248, label %255

; <label>:248                                     ; preds = %245
  %249 = load i32* %stone, align 4
  %250 = sub nsw i32 %249, 1
  %251 = load i32* %liberties, align 4
  %252 = sext i32 %251 to i64
  %253 = load i32** %5, align 8
  %254 = getelementptr inbounds i32* %253, i64 %252
  store i32 %250, i32* %254, align 4
  br label %255

; <label>:255                                     ; preds = %248, %245
  %256 = load i32* %liberties, align 4
  %257 = add nsw i32 %256, 1
  store i32 %257, i32* %liberties, align 4
  %258 = load i32* %liberties, align 4
  %259 = load i32* %4, align 4
  %260 = icmp sge i32 %258, %259
  br i1 %260, label %261, label %263

; <label>:261                                     ; preds = %255
  %262 = load i32* %liberties, align 4
  store i32 %262, i32* %1
  br label %659

; <label>:263                                     ; preds = %255
  %264 = load i32* @liberty_mark, align 4
  %265 = load i32* %stone, align 4
  %266 = sub nsw i32 %265, 1
  %267 = sext i32 %266 to i64
  %268 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %267
  store i32 %264, i32* %268, align 4
  br label %269

; <label>:269                                     ; preds = %263, %237, %229
  %270 = load i32* %stone, align 4
  %271 = sub nsw i32 %270, 20
  %272 = sext i32 %271 to i64
  %273 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %272
  %274 = load i8* %273, align 1
  %275 = zext i8 %274 to i32
  %276 = icmp eq i32 %275, 0
  br i1 %276, label %277, label %309

; <label>:277                                     ; preds = %269
  %278 = load i32* %stone, align 4
  %279 = sub nsw i32 %278, 20
  %280 = sext i32 %279 to i64
  %281 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %280
  %282 = load i32* %281, align 4
  %283 = load i32* @liberty_mark, align 4
  %284 = icmp ne i32 %282, %283
  br i1 %284, label %285, label %309

; <label>:285                                     ; preds = %277
  %286 = load i32** %5, align 8
  %287 = icmp ne i32* %286, null
  br i1 %287, label %288, label %295

; <label>:288                                     ; preds = %285
  %289 = load i32* %stone, align 4
  %290 = sub nsw i32 %289, 20
  %291 = load i32* %liberties, align 4
  %292 = sext i32 %291 to i64
  %293 = load i32** %5, align 8
  %294 = getelementptr inbounds i32* %293, i64 %292
  store i32 %290, i32* %294, align 4
  br label %295

; <label>:295                                     ; preds = %288, %285
  %296 = load i32* %liberties, align 4
  %297 = add nsw i32 %296, 1
  store i32 %297, i32* %liberties, align 4
  %298 = load i32* %liberties, align 4
  %299 = load i32* %4, align 4
  %300 = icmp sge i32 %298, %299
  br i1 %300, label %301, label %303

; <label>:301                                     ; preds = %295
  %302 = load i32* %liberties, align 4
  store i32 %302, i32* %1
  br label %659

; <label>:303                                     ; preds = %295
  %304 = load i32* @liberty_mark, align 4
  %305 = load i32* %stone, align 4
  %306 = sub nsw i32 %305, 20
  %307 = sext i32 %306 to i64
  %308 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %307
  store i32 %304, i32* %308, align 4
  br label %309

; <label>:309                                     ; preds = %303, %277, %269
  %310 = load i32* %stone, align 4
  %311 = add nsw i32 %310, 1
  %312 = sext i32 %311 to i64
  %313 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %312
  %314 = load i8* %313, align 1
  %315 = zext i8 %314 to i32
  %316 = icmp eq i32 %315, 0
  br i1 %316, label %317, label %349

; <label>:317                                     ; preds = %309
  %318 = load i32* %stone, align 4
  %319 = add nsw i32 %318, 1
  %320 = sext i32 %319 to i64
  %321 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %320
  %322 = load i32* %321, align 4
  %323 = load i32* @liberty_mark, align 4
  %324 = icmp ne i32 %322, %323
  br i1 %324, label %325, label %349

; <label>:325                                     ; preds = %317
  %326 = load i32** %5, align 8
  %327 = icmp ne i32* %326, null
  br i1 %327, label %328, label %335

; <label>:328                                     ; preds = %325
  %329 = load i32* %stone, align 4
  %330 = add nsw i32 %329, 1
  %331 = load i32* %liberties, align 4
  %332 = sext i32 %331 to i64
  %333 = load i32** %5, align 8
  %334 = getelementptr inbounds i32* %333, i64 %332
  store i32 %330, i32* %334, align 4
  br label %335

; <label>:335                                     ; preds = %328, %325
  %336 = load i32* %liberties, align 4
  %337 = add nsw i32 %336, 1
  store i32 %337, i32* %liberties, align 4
  %338 = load i32* %liberties, align 4
  %339 = load i32* %4, align 4
  %340 = icmp sge i32 %338, %339
  br i1 %340, label %341, label %343

; <label>:341                                     ; preds = %335
  %342 = load i32* %liberties, align 4
  store i32 %342, i32* %1
  br label %659

; <label>:343                                     ; preds = %335
  %344 = load i32* @liberty_mark, align 4
  %345 = load i32* %stone, align 4
  %346 = add nsw i32 %345, 1
  %347 = sext i32 %346 to i64
  %348 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %347
  store i32 %344, i32* %348, align 4
  br label %349

; <label>:349                                     ; preds = %343, %317, %309
  %350 = load i32* %stone, align 4
  %351 = sext i32 %350 to i64
  %352 = getelementptr inbounds [400 x i32]* @next_stone, i32 0, i64 %351
  %353 = load i32* %352, align 4
  store i32 %353, i32* %stone, align 4
  br label %354

; <label>:354                                     ; preds = %349
  %355 = load i32* %stone, align 4
  %356 = load i32* %pos2, align 4
  %357 = icmp ne i32 %355, %356
  br i1 %357, label %189, label %358

; <label>:358                                     ; preds = %354
  br label %359

; <label>:359                                     ; preds = %358, %186
  %360 = load i32* @string_mark, align 4
  %361 = load i32* %pos2, align 4
  %362 = sext i32 %361 to i64
  %363 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %362
  %364 = load i32* %363, align 4
  %365 = sext i32 %364 to i64
  %366 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %365
  %367 = getelementptr inbounds %struct.string_data* %366, i32 0, i32 7
  store i32 %360, i32* %367, align 4
  br label %394

; <label>:368                                     ; preds = %108, %100
  %369 = load i32* %pos2, align 4
  %370 = sext i32 %369 to i64
  %371 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %370
  %372 = load i8* %371, align 1
  %373 = zext i8 %372 to i32
  %374 = load i32* %3, align 4
  %375 = sub nsw i32 3, %374
  %376 = icmp eq i32 %373, %375
  br i1 %376, label %377, label %393

; <label>:377                                     ; preds = %368
  %378 = load i32* %pos2, align 4
  %379 = sext i32 %378 to i64
  %380 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %379
  %381 = load i32* %380, align 4
  %382 = sext i32 %381 to i64
  %383 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %382
  %384 = getelementptr inbounds %struct.string_data* %383, i32 0, i32 3
  %385 = load i32* %384, align 4
  %386 = icmp eq i32 %385, 1
  br i1 %386, label %387, label %393

; <label>:387                                     ; preds = %377
  %388 = load i32* %pos2, align 4
  %389 = load i32* %captures, align 4
  %390 = add nsw i32 %389, 1
  store i32 %390, i32* %captures, align 4
  %391 = sext i32 %389 to i64
  %392 = getelementptr inbounds [4 x i32]* %captured, i32 0, i64 %391
  store i32 %388, i32* %392, align 4
  br label %393

; <label>:393                                     ; preds = %387, %377, %368
  br label %394

; <label>:394                                     ; preds = %393, %359
  br label %395

; <label>:395                                     ; preds = %394, %95
  br label %396

; <label>:396                                     ; preds = %395
  %397 = load i32* %k, align 4
  %398 = add nsw i32 %397, 1
  store i32 %398, i32* %k, align 4
  br label %55

; <label>:399                                     ; preds = %55
  store i32 0, i32* %k, align 4
  br label %400

; <label>:400                                     ; preds = %654, %399
  %401 = load i32* %k, align 4
  %402 = load i32* %captures, align 4
  %403 = icmp slt i32 %401, %402
  br i1 %403, label %404, label %657

; <label>:404                                     ; preds = %400
  %405 = load i32* %k, align 4
  %406 = sext i32 %405 to i64
  %407 = getelementptr inbounds [4 x i32]* %captured, i32 0, i64 %406
  %408 = load i32* %407, align 4
  store i32 %408, i32* %lib, align 4
  %409 = load i32* %lib, align 4
  %410 = add nsw i32 %409, 20
  %411 = sext i32 %410 to i64
  %412 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %411
  %413 = load i8* %412, align 1
  %414 = zext i8 %413 to i32
  %415 = load i32* %3, align 4
  %416 = icmp eq i32 %414, %415
  br i1 %416, label %417, label %429

; <label>:417                                     ; preds = %404
  %418 = load i32* %lib, align 4
  %419 = add nsw i32 %418, 20
  %420 = sext i32 %419 to i64
  %421 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %420
  %422 = load i32* %421, align 4
  %423 = sext i32 %422 to i64
  %424 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %423
  %425 = getelementptr inbounds %struct.string_data* %424, i32 0, i32 7
  %426 = load i32* %425, align 4
  %427 = load i32* @string_mark, align 4
  %428 = icmp eq i32 %426, %427
  br i1 %428, label %510, label %429

; <label>:429                                     ; preds = %417, %404
  %430 = load i32* %lib, align 4
  %431 = sub nsw i32 %430, 1
  %432 = sext i32 %431 to i64
  %433 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %432
  %434 = load i8* %433, align 1
  %435 = zext i8 %434 to i32
  %436 = load i32* %3, align 4
  %437 = icmp eq i32 %435, %436
  br i1 %437, label %438, label %450

; <label>:438                                     ; preds = %429
  %439 = load i32* %lib, align 4
  %440 = sub nsw i32 %439, 1
  %441 = sext i32 %440 to i64
  %442 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %441
  %443 = load i32* %442, align 4
  %444 = sext i32 %443 to i64
  %445 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %444
  %446 = getelementptr inbounds %struct.string_data* %445, i32 0, i32 7
  %447 = load i32* %446, align 4
  %448 = load i32* @string_mark, align 4
  %449 = icmp eq i32 %447, %448
  br i1 %449, label %510, label %450

; <label>:450                                     ; preds = %438, %429
  %451 = load i32* %lib, align 4
  %452 = sub nsw i32 %451, 20
  %453 = sext i32 %452 to i64
  %454 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %453
  %455 = load i8* %454, align 1
  %456 = zext i8 %455 to i32
  %457 = load i32* %3, align 4
  %458 = icmp eq i32 %456, %457
  br i1 %458, label %459, label %471

; <label>:459                                     ; preds = %450
  %460 = load i32* %lib, align 4
  %461 = sub nsw i32 %460, 20
  %462 = sext i32 %461 to i64
  %463 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %462
  %464 = load i32* %463, align 4
  %465 = sext i32 %464 to i64
  %466 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %465
  %467 = getelementptr inbounds %struct.string_data* %466, i32 0, i32 7
  %468 = load i32* %467, align 4
  %469 = load i32* @string_mark, align 4
  %470 = icmp eq i32 %468, %469
  br i1 %470, label %510, label %471

; <label>:471                                     ; preds = %459, %450
  %472 = load i32* %lib, align 4
  %473 = add nsw i32 %472, 1
  %474 = sext i32 %473 to i64
  %475 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %474
  %476 = load i8* %475, align 1
  %477 = zext i8 %476 to i32
  %478 = load i32* %3, align 4
  %479 = icmp eq i32 %477, %478
  br i1 %479, label %480, label %492

; <label>:480                                     ; preds = %471
  %481 = load i32* %lib, align 4
  %482 = add nsw i32 %481, 1
  %483 = sext i32 %482 to i64
  %484 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %483
  %485 = load i32* %484, align 4
  %486 = sext i32 %485 to i64
  %487 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %486
  %488 = getelementptr inbounds %struct.string_data* %487, i32 0, i32 7
  %489 = load i32* %488, align 4
  %490 = load i32* @string_mark, align 4
  %491 = icmp eq i32 %489, %490
  br i1 %491, label %510, label %492

; <label>:492                                     ; preds = %480, %471
  %493 = load i32** %5, align 8
  %494 = icmp ne i32* %493, null
  br i1 %494, label %495, label %501

; <label>:495                                     ; preds = %492
  %496 = load i32* %lib, align 4
  %497 = load i32* %liberties, align 4
  %498 = sext i32 %497 to i64
  %499 = load i32** %5, align 8
  %500 = getelementptr inbounds i32* %499, i64 %498
  store i32 %496, i32* %500, align 4
  br label %501

; <label>:501                                     ; preds = %495, %492
  %502 = load i32* %liberties, align 4
  %503 = add nsw i32 %502, 1
  store i32 %503, i32* %liberties, align 4
  %504 = load i32* %liberties, align 4
  %505 = load i32* %4, align 4
  %506 = icmp sge i32 %504, %505
  br i1 %506, label %507, label %509

; <label>:507                                     ; preds = %501
  %508 = load i32* %liberties, align 4
  store i32 %508, i32* %1
  br label %659

; <label>:509                                     ; preds = %501
  br label %510

; <label>:510                                     ; preds = %509, %480, %459, %438, %417
  store i32 0, i32* %l, align 4
  br label %511

; <label>:511                                     ; preds = %530, %510
  %512 = load i32* %l, align 4
  %513 = load i32* %k, align 4
  %514 = icmp slt i32 %512, %513
  br i1 %514, label %515, label %533

; <label>:515                                     ; preds = %511
  %516 = load i32* %l, align 4
  %517 = sext i32 %516 to i64
  %518 = getelementptr inbounds [4 x i32]* %captured, i32 0, i64 %517
  %519 = load i32* %518, align 4
  %520 = sext i32 %519 to i64
  %521 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %520
  %522 = load i32* %521, align 4
  %523 = load i32* %lib, align 4
  %524 = sext i32 %523 to i64
  %525 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %524
  %526 = load i32* %525, align 4
  %527 = icmp eq i32 %522, %526
  br i1 %527, label %528, label %529

; <label>:528                                     ; preds = %515
  br label %533

; <label>:529                                     ; preds = %515
  br label %530

; <label>:530                                     ; preds = %529
  %531 = load i32* %l, align 4
  %532 = add nsw i32 %531, 1
  store i32 %532, i32* %l, align 4
  br label %511

; <label>:533                                     ; preds = %528, %511
  %534 = load i32* %l, align 4
  %535 = load i32* %k, align 4
  %536 = icmp eq i32 %534, %535
  br i1 %536, label %537, label %653

; <label>:537                                     ; preds = %533
  br label %538

; <label>:538                                     ; preds = %645, %537
  %539 = load i32* %lib, align 4
  %540 = add nsw i32 %539, 20
  %541 = sext i32 %540 to i64
  %542 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %541
  %543 = load i8* %542, align 1
  %544 = zext i8 %543 to i32
  %545 = load i32* %3, align 4
  %546 = icmp eq i32 %544, %545
  br i1 %546, label %547, label %559

; <label>:547                                     ; preds = %538
  %548 = load i32* %lib, align 4
  %549 = add nsw i32 %548, 20
  %550 = sext i32 %549 to i64
  %551 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %550
  %552 = load i32* %551, align 4
  %553 = sext i32 %552 to i64
  %554 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %553
  %555 = getelementptr inbounds %struct.string_data* %554, i32 0, i32 7
  %556 = load i32* %555, align 4
  %557 = load i32* @string_mark, align 4
  %558 = icmp eq i32 %556, %557
  br i1 %558, label %622, label %559

; <label>:559                                     ; preds = %547, %538
  %560 = load i32* %lib, align 4
  %561 = sub nsw i32 %560, 1
  %562 = sext i32 %561 to i64
  %563 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %562
  %564 = load i8* %563, align 1
  %565 = zext i8 %564 to i32
  %566 = load i32* %3, align 4
  %567 = icmp eq i32 %565, %566
  br i1 %567, label %568, label %580

; <label>:568                                     ; preds = %559
  %569 = load i32* %lib, align 4
  %570 = sub nsw i32 %569, 1
  %571 = sext i32 %570 to i64
  %572 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %571
  %573 = load i32* %572, align 4
  %574 = sext i32 %573 to i64
  %575 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %574
  %576 = getelementptr inbounds %struct.string_data* %575, i32 0, i32 7
  %577 = load i32* %576, align 4
  %578 = load i32* @string_mark, align 4
  %579 = icmp eq i32 %577, %578
  br i1 %579, label %622, label %580

; <label>:580                                     ; preds = %568, %559
  %581 = load i32* %lib, align 4
  %582 = sub nsw i32 %581, 20
  %583 = sext i32 %582 to i64
  %584 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %583
  %585 = load i8* %584, align 1
  %586 = zext i8 %585 to i32
  %587 = load i32* %3, align 4
  %588 = icmp eq i32 %586, %587
  br i1 %588, label %589, label %601

; <label>:589                                     ; preds = %580
  %590 = load i32* %lib, align 4
  %591 = sub nsw i32 %590, 20
  %592 = sext i32 %591 to i64
  %593 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %592
  %594 = load i32* %593, align 4
  %595 = sext i32 %594 to i64
  %596 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %595
  %597 = getelementptr inbounds %struct.string_data* %596, i32 0, i32 7
  %598 = load i32* %597, align 4
  %599 = load i32* @string_mark, align 4
  %600 = icmp eq i32 %598, %599
  br i1 %600, label %622, label %601

; <label>:601                                     ; preds = %589, %580
  %602 = load i32* %lib, align 4
  %603 = add nsw i32 %602, 1
  %604 = sext i32 %603 to i64
  %605 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %604
  %606 = load i8* %605, align 1
  %607 = zext i8 %606 to i32
  %608 = load i32* %3, align 4
  %609 = icmp eq i32 %607, %608
  br i1 %609, label %610, label %640

; <label>:610                                     ; preds = %601
  %611 = load i32* %lib, align 4
  %612 = add nsw i32 %611, 1
  %613 = sext i32 %612 to i64
  %614 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %613
  %615 = load i32* %614, align 4
  %616 = sext i32 %615 to i64
  %617 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %616
  %618 = getelementptr inbounds %struct.string_data* %617, i32 0, i32 7
  %619 = load i32* %618, align 4
  %620 = load i32* @string_mark, align 4
  %621 = icmp eq i32 %619, %620
  br i1 %621, label %622, label %640

; <label>:622                                     ; preds = %610, %589, %568, %547
  %623 = load i32** %5, align 8
  %624 = icmp ne i32* %623, null
  br i1 %624, label %625, label %631

; <label>:625                                     ; preds = %622
  %626 = load i32* %lib, align 4
  %627 = load i32* %liberties, align 4
  %628 = sext i32 %627 to i64
  %629 = load i32** %5, align 8
  %630 = getelementptr inbounds i32* %629, i64 %628
  store i32 %626, i32* %630, align 4
  br label %631

; <label>:631                                     ; preds = %625, %622
  %632 = load i32* %liberties, align 4
  %633 = add nsw i32 %632, 1
  store i32 %633, i32* %liberties, align 4
  %634 = load i32* %liberties, align 4
  %635 = load i32* %4, align 4
  %636 = icmp sge i32 %634, %635
  br i1 %636, label %637, label %639

; <label>:637                                     ; preds = %631
  %638 = load i32* %liberties, align 4
  store i32 %638, i32* %1
  br label %659

; <label>:639                                     ; preds = %631
  br label %640

; <label>:640                                     ; preds = %639, %610, %601
  %641 = load i32* %lib, align 4
  %642 = sext i32 %641 to i64
  %643 = getelementptr inbounds [400 x i32]* @next_stone, i32 0, i64 %642
  %644 = load i32* %643, align 4
  store i32 %644, i32* %lib, align 4
  br label %645

; <label>:645                                     ; preds = %640
  %646 = load i32* %lib, align 4
  %647 = load i32* %k, align 4
  %648 = sext i32 %647 to i64
  %649 = getelementptr inbounds [4 x i32]* %captured, i32 0, i64 %648
  %650 = load i32* %649, align 4
  %651 = icmp ne i32 %646, %650
  br i1 %651, label %538, label %652

; <label>:652                                     ; preds = %645
  br label %653

; <label>:653                                     ; preds = %652, %533
  br label %654

; <label>:654                                     ; preds = %653
  %655 = load i32* %k, align 4
  %656 = add nsw i32 %655, 1
  store i32 %656, i32* %k, align 4
  br label %400

; <label>:657                                     ; preds = %400
  %658 = load i32* %liberties, align 4
  store i32 %658, i32* %1
  br label %659

; <label>:659                                     ; preds = %657, %637, %507, %341, %301, %261, %221, %175, %93, %43
  %660 = load i32* %1
  ret i32 %660
}

; Function Attrs: nounwind uwtable
define i32 @find_common_libs(i32 %str1, i32 %str2, i32 %maxlib, i32* %libs) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32*, align 8
  %all_libs1 = alloca [241 x i32], align 16
  %libs1 = alloca i32*, align 8
  %liberties1 = alloca i32, align 4
  %liberties2 = alloca i32, align 4
  %commonlibs = alloca i32, align 4
  %k = alloca i32, align 4
  %n = alloca i32, align 4
  %tmp = alloca i32, align 4
  store i32 %str1, i32* %2, align 4
  store i32 %str2, i32* %3, align 4
  store i32 %maxlib, i32* %4, align 4
  store i32* %libs, i32** %5, align 8
  store i32 0, i32* %commonlibs, align 4
  %6 = load i32* %2, align 4
  %7 = icmp ult i32 %6, 421
  br i1 %7, label %8, label %16

; <label>:8                                       ; preds = %0
  %9 = load i32* %2, align 4
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %10
  %12 = load i8* %11, align 1
  %13 = zext i8 %12 to i32
  %14 = icmp ne i32 %13, 3
  br i1 %14, label %15, label %16

; <label>:15                                      ; preds = %8
  br label %23

; <label>:16                                      ; preds = %8, %0
  %17 = load i32* %2, align 4
  %18 = sdiv i32 %17, 20
  %19 = sub nsw i32 %18, 1
  %20 = load i32* %2, align 4
  %21 = srem i32 %20, 20
  %22 = sub nsw i32 %21, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 1981, i8* getelementptr inbounds ([16 x i8]* @.str29, i32 0, i32 0), i32 %19, i32 %22)
  br label %23

; <label>:23                                      ; preds = %16, %15
  %24 = load i32* %3, align 4
  %25 = icmp ult i32 %24, 421
  br i1 %25, label %26, label %34

; <label>:26                                      ; preds = %23
  %27 = load i32* %3, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %28
  %30 = load i8* %29, align 1
  %31 = zext i8 %30 to i32
  %32 = icmp ne i32 %31, 3
  br i1 %32, label %33, label %34

; <label>:33                                      ; preds = %26
  br label %41

; <label>:34                                      ; preds = %26, %23
  %35 = load i32* %3, align 4
  %36 = sdiv i32 %35, 20
  %37 = sub nsw i32 %36, 1
  %38 = load i32* %3, align 4
  %39 = srem i32 %38, 20
  %40 = sub nsw i32 %39, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 1982, i8* getelementptr inbounds ([16 x i8]* @.str30, i32 0, i32 0), i32 %37, i32 %40)
  br label %41

; <label>:41                                      ; preds = %34, %33
  %42 = load i32* %2, align 4
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %43
  %45 = load i8* %44, align 1
  %46 = zext i8 %45 to i32
  %47 = icmp eq i32 %46, 1
  br i1 %47, label %55, label %48

; <label>:48                                      ; preds = %41
  %49 = load i32* %2, align 4
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %50
  %52 = load i8* %51, align 1
  %53 = zext i8 %52 to i32
  %54 = icmp eq i32 %53, 2
  br i1 %54, label %55, label %56

; <label>:55                                      ; preds = %48, %41
  br label %63

; <label>:56                                      ; preds = %48
  %57 = load i32* %2, align 4
  %58 = sdiv i32 %57, 20
  %59 = sub nsw i32 %58, 1
  %60 = load i32* %2, align 4
  %61 = srem i32 %60, 20
  %62 = sub nsw i32 %61, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 1983, i8* getelementptr inbounds ([22 x i8]* @.str31, i32 0, i32 0), i32 %59, i32 %62)
  br label %63

; <label>:63                                      ; preds = %56, %55
  %64 = load i32* %3, align 4
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %65
  %67 = load i8* %66, align 1
  %68 = zext i8 %67 to i32
  %69 = icmp eq i32 %68, 1
  br i1 %69, label %77, label %70

; <label>:70                                      ; preds = %63
  %71 = load i32* %3, align 4
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %72
  %74 = load i8* %73, align 1
  %75 = zext i8 %74 to i32
  %76 = icmp eq i32 %75, 2
  br i1 %76, label %77, label %78

; <label>:77                                      ; preds = %70, %63
  br label %85

; <label>:78                                      ; preds = %70
  %79 = load i32* %3, align 4
  %80 = sdiv i32 %79, 20
  %81 = sub nsw i32 %80, 1
  %82 = load i32* %3, align 4
  %83 = srem i32 %82, 20
  %84 = sub nsw i32 %83, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 1984, i8* getelementptr inbounds ([22 x i8]* @.str32, i32 0, i32 0), i32 %81, i32 %84)
  br label %85

; <label>:85                                      ; preds = %78, %77
  %86 = load i32** %5, align 8
  %87 = icmp ne i32* %86, null
  br i1 %87, label %88, label %89

; <label>:88                                      ; preds = %85
  br label %96

; <label>:89                                      ; preds = %85
  %90 = load i32* %2, align 4
  %91 = sdiv i32 %90, 20
  %92 = sub nsw i32 %91, 1
  %93 = load i32* %2, align 4
  %94 = srem i32 %93, 20
  %95 = sub nsw i32 %94, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 1985, i8* getelementptr inbounds ([13 x i8]* @.str27, i32 0, i32 0), i32 %92, i32 %95)
  br label %96

; <label>:96                                      ; preds = %89, %88
  %97 = load i32* %2, align 4
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %98
  %100 = load i32* %99, align 4
  store i32 %100, i32* %n, align 4
  %101 = load i32* %n, align 4
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %102
  %104 = getelementptr inbounds %struct.string_data* %103, i32 0, i32 3
  %105 = load i32* %104, align 4
  store i32 %105, i32* %liberties1, align 4
  %106 = load i32* %liberties1, align 4
  %107 = load i32* %3, align 4
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %108
  %110 = load i32* %109, align 4
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %111
  %113 = getelementptr inbounds %struct.string_data* %112, i32 0, i32 3
  %114 = load i32* %113, align 4
  %115 = icmp sgt i32 %106, %114
  br i1 %115, label %116, label %129

; <label>:116                                     ; preds = %96
  %117 = load i32* %3, align 4
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %118
  %120 = load i32* %119, align 4
  store i32 %120, i32* %n, align 4
  %121 = load i32* %n, align 4
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %122
  %124 = getelementptr inbounds %struct.string_data* %123, i32 0, i32 3
  %125 = load i32* %124, align 4
  store i32 %125, i32* %liberties1, align 4
  %126 = load i32* %2, align 4
  store i32 %126, i32* %tmp, align 4
  %127 = load i32* %3, align 4
  store i32 %127, i32* %2, align 4
  %128 = load i32* %tmp, align 4
  store i32 %128, i32* %3, align 4
  br label %129

; <label>:129                                     ; preds = %116, %96
  %130 = load i32* %liberties1, align 4
  %131 = icmp sle i32 %130, 20
  br i1 %131, label %132, label %224

; <label>:132                                     ; preds = %129
  %133 = load i32* %n, align 4
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %134
  %136 = getelementptr inbounds %struct.string_data* %135, i32 0, i32 4
  %137 = getelementptr inbounds [20 x i32]* %136, i32 0, i32 0
  store i32* %137, i32** %libs1, align 8
  %138 = load i32* %3, align 4
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %139
  %141 = load i32* %140, align 4
  store i32 %141, i32* %n, align 4
  %142 = load i32* %n, align 4
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %143
  %145 = getelementptr inbounds %struct.string_data* %144, i32 0, i32 3
  %146 = load i32* %145, align 4
  store i32 %146, i32* %liberties2, align 4
  %147 = load i32* %liberties2, align 4
  %148 = icmp sle i32 %147, 20
  br i1 %148, label %149, label %223

; <label>:149                                     ; preds = %132
  %150 = load i32* @liberty_mark, align 4
  %151 = add nsw i32 %150, 1
  store i32 %151, i32* @liberty_mark, align 4
  store i32 0, i32* %k, align 4
  br label %152

; <label>:152                                     ; preds = %165, %149
  %153 = load i32* %k, align 4
  %154 = load i32* %liberties1, align 4
  %155 = icmp slt i32 %153, %154
  br i1 %155, label %156, label %168

; <label>:156                                     ; preds = %152
  %157 = load i32* @liberty_mark, align 4
  %158 = load i32* %k, align 4
  %159 = sext i32 %158 to i64
  %160 = load i32** %libs1, align 8
  %161 = getelementptr inbounds i32* %160, i64 %159
  %162 = load i32* %161, align 4
  %163 = sext i32 %162 to i64
  %164 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %163
  store i32 %157, i32* %164, align 4
  br label %165

; <label>:165                                     ; preds = %156
  %166 = load i32* %k, align 4
  %167 = add nsw i32 %166, 1
  store i32 %167, i32* %k, align 4
  br label %152

; <label>:168                                     ; preds = %152
  %169 = load i32* %n, align 4
  %170 = sext i32 %169 to i64
  %171 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %170
  %172 = getelementptr inbounds %struct.string_data* %171, i32 0, i32 4
  %173 = getelementptr inbounds [20 x i32]* %172, i32 0, i32 0
  store i32* %173, i32** %libs1, align 8
  store i32 0, i32* %k, align 4
  br label %174

; <label>:174                                     ; preds = %218, %168
  %175 = load i32* %k, align 4
  %176 = load i32* %liberties2, align 4
  %177 = icmp slt i32 %175, %176
  br i1 %177, label %178, label %221

; <label>:178                                     ; preds = %174
  %179 = load i32* %k, align 4
  %180 = sext i32 %179 to i64
  %181 = load i32** %libs1, align 8
  %182 = getelementptr inbounds i32* %181, i64 %180
  %183 = load i32* %182, align 4
  %184 = sext i32 %183 to i64
  %185 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %184
  %186 = load i8* %185, align 1
  %187 = zext i8 %186 to i32
  %188 = icmp eq i32 %187, 0
  br i1 %188, label %189, label %200

; <label>:189                                     ; preds = %178
  %190 = load i32* %k, align 4
  %191 = sext i32 %190 to i64
  %192 = load i32** %libs1, align 8
  %193 = getelementptr inbounds i32* %192, i64 %191
  %194 = load i32* %193, align 4
  %195 = sext i32 %194 to i64
  %196 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %195
  %197 = load i32* %196, align 4
  %198 = load i32* @liberty_mark, align 4
  %199 = icmp ne i32 %197, %198
  br i1 %199, label %217, label %200

; <label>:200                                     ; preds = %189, %178
  %201 = load i32* %commonlibs, align 4
  %202 = load i32* %4, align 4
  %203 = icmp slt i32 %201, %202
  br i1 %203, label %204, label %214

; <label>:204                                     ; preds = %200
  %205 = load i32* %k, align 4
  %206 = sext i32 %205 to i64
  %207 = load i32** %libs1, align 8
  %208 = getelementptr inbounds i32* %207, i64 %206
  %209 = load i32* %208, align 4
  %210 = load i32* %commonlibs, align 4
  %211 = sext i32 %210 to i64
  %212 = load i32** %5, align 8
  %213 = getelementptr inbounds i32* %212, i64 %211
  store i32 %209, i32* %213, align 4
  br label %214

; <label>:214                                     ; preds = %204, %200
  %215 = load i32* %commonlibs, align 4
  %216 = add nsw i32 %215, 1
  store i32 %216, i32* %commonlibs, align 4
  br label %217

; <label>:217                                     ; preds = %214, %189
  br label %218

; <label>:218                                     ; preds = %217
  %219 = load i32* %k, align 4
  %220 = add nsw i32 %219, 1
  store i32 %220, i32* %k, align 4
  br label %174

; <label>:221                                     ; preds = %174
  %222 = load i32* %commonlibs, align 4
  store i32 %222, i32* %1
  br label %385

; <label>:223                                     ; preds = %132
  br label %229

; <label>:224                                     ; preds = %129
  %225 = load i32* %2, align 4
  %226 = getelementptr inbounds [241 x i32]* %all_libs1, i32 0, i32 0
  %227 = call i32 @findlib(i32 %225, i32 241, i32* %226)
  %228 = getelementptr inbounds [241 x i32]* %all_libs1, i32 0, i32 0
  store i32* %228, i32** %libs1, align 8
  br label %229

; <label>:229                                     ; preds = %224, %223
  store i32 0, i32* %k, align 4
  br label %230

; <label>:230                                     ; preds = %380, %229
  %231 = load i32* %k, align 4
  %232 = load i32* %liberties1, align 4
  %233 = icmp slt i32 %231, %232
  br i1 %233, label %234, label %383

; <label>:234                                     ; preds = %230
  %235 = load i32* %k, align 4
  %236 = sext i32 %235 to i64
  %237 = load i32** %libs1, align 8
  %238 = getelementptr inbounds i32* %237, i64 %236
  %239 = load i32* %238, align 4
  %240 = add nsw i32 %239, 20
  %241 = sext i32 %240 to i64
  %242 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %241
  %243 = load i8* %242, align 1
  %244 = zext i8 %243 to i32
  %245 = load i32* %3, align 4
  %246 = sext i32 %245 to i64
  %247 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %246
  %248 = load i8* %247, align 1
  %249 = zext i8 %248 to i32
  %250 = icmp eq i32 %244, %249
  br i1 %250, label %251, label %266

; <label>:251                                     ; preds = %234
  %252 = load i32* %k, align 4
  %253 = sext i32 %252 to i64
  %254 = load i32** %libs1, align 8
  %255 = getelementptr inbounds i32* %254, i64 %253
  %256 = load i32* %255, align 4
  %257 = add nsw i32 %256, 20
  %258 = sext i32 %257 to i64
  %259 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %258
  %260 = load i32* %259, align 4
  %261 = load i32* %3, align 4
  %262 = sext i32 %261 to i64
  %263 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %262
  %264 = load i32* %263, align 4
  %265 = icmp eq i32 %260, %264
  br i1 %265, label %362, label %266

; <label>:266                                     ; preds = %251, %234
  %267 = load i32* %k, align 4
  %268 = sext i32 %267 to i64
  %269 = load i32** %libs1, align 8
  %270 = getelementptr inbounds i32* %269, i64 %268
  %271 = load i32* %270, align 4
  %272 = sub nsw i32 %271, 1
  %273 = sext i32 %272 to i64
  %274 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %273
  %275 = load i8* %274, align 1
  %276 = zext i8 %275 to i32
  %277 = load i32* %3, align 4
  %278 = sext i32 %277 to i64
  %279 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %278
  %280 = load i8* %279, align 1
  %281 = zext i8 %280 to i32
  %282 = icmp eq i32 %276, %281
  br i1 %282, label %283, label %298

; <label>:283                                     ; preds = %266
  %284 = load i32* %k, align 4
  %285 = sext i32 %284 to i64
  %286 = load i32** %libs1, align 8
  %287 = getelementptr inbounds i32* %286, i64 %285
  %288 = load i32* %287, align 4
  %289 = sub nsw i32 %288, 1
  %290 = sext i32 %289 to i64
  %291 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %290
  %292 = load i32* %291, align 4
  %293 = load i32* %3, align 4
  %294 = sext i32 %293 to i64
  %295 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %294
  %296 = load i32* %295, align 4
  %297 = icmp eq i32 %292, %296
  br i1 %297, label %362, label %298

; <label>:298                                     ; preds = %283, %266
  %299 = load i32* %k, align 4
  %300 = sext i32 %299 to i64
  %301 = load i32** %libs1, align 8
  %302 = getelementptr inbounds i32* %301, i64 %300
  %303 = load i32* %302, align 4
  %304 = sub nsw i32 %303, 20
  %305 = sext i32 %304 to i64
  %306 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %305
  %307 = load i8* %306, align 1
  %308 = zext i8 %307 to i32
  %309 = load i32* %3, align 4
  %310 = sext i32 %309 to i64
  %311 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %310
  %312 = load i8* %311, align 1
  %313 = zext i8 %312 to i32
  %314 = icmp eq i32 %308, %313
  br i1 %314, label %315, label %330

; <label>:315                                     ; preds = %298
  %316 = load i32* %k, align 4
  %317 = sext i32 %316 to i64
  %318 = load i32** %libs1, align 8
  %319 = getelementptr inbounds i32* %318, i64 %317
  %320 = load i32* %319, align 4
  %321 = sub nsw i32 %320, 20
  %322 = sext i32 %321 to i64
  %323 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %322
  %324 = load i32* %323, align 4
  %325 = load i32* %3, align 4
  %326 = sext i32 %325 to i64
  %327 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %326
  %328 = load i32* %327, align 4
  %329 = icmp eq i32 %324, %328
  br i1 %329, label %362, label %330

; <label>:330                                     ; preds = %315, %298
  %331 = load i32* %k, align 4
  %332 = sext i32 %331 to i64
  %333 = load i32** %libs1, align 8
  %334 = getelementptr inbounds i32* %333, i64 %332
  %335 = load i32* %334, align 4
  %336 = add nsw i32 %335, 1
  %337 = sext i32 %336 to i64
  %338 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %337
  %339 = load i8* %338, align 1
  %340 = zext i8 %339 to i32
  %341 = load i32* %3, align 4
  %342 = sext i32 %341 to i64
  %343 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %342
  %344 = load i8* %343, align 1
  %345 = zext i8 %344 to i32
  %346 = icmp eq i32 %340, %345
  br i1 %346, label %347, label %379

; <label>:347                                     ; preds = %330
  %348 = load i32* %k, align 4
  %349 = sext i32 %348 to i64
  %350 = load i32** %libs1, align 8
  %351 = getelementptr inbounds i32* %350, i64 %349
  %352 = load i32* %351, align 4
  %353 = add nsw i32 %352, 1
  %354 = sext i32 %353 to i64
  %355 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %354
  %356 = load i32* %355, align 4
  %357 = load i32* %3, align 4
  %358 = sext i32 %357 to i64
  %359 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %358
  %360 = load i32* %359, align 4
  %361 = icmp eq i32 %356, %360
  br i1 %361, label %362, label %379

; <label>:362                                     ; preds = %347, %315, %283, %251
  %363 = load i32* %commonlibs, align 4
  %364 = load i32* %4, align 4
  %365 = icmp slt i32 %363, %364
  br i1 %365, label %366, label %376

; <label>:366                                     ; preds = %362
  %367 = load i32* %k, align 4
  %368 = sext i32 %367 to i64
  %369 = load i32** %libs1, align 8
  %370 = getelementptr inbounds i32* %369, i64 %368
  %371 = load i32* %370, align 4
  %372 = load i32* %commonlibs, align 4
  %373 = sext i32 %372 to i64
  %374 = load i32** %5, align 8
  %375 = getelementptr inbounds i32* %374, i64 %373
  store i32 %371, i32* %375, align 4
  br label %376

; <label>:376                                     ; preds = %366, %362
  %377 = load i32* %commonlibs, align 4
  %378 = add nsw i32 %377, 1
  store i32 %378, i32* %commonlibs, align 4
  br label %379

; <label>:379                                     ; preds = %376, %347, %330
  br label %380

; <label>:380                                     ; preds = %379
  %381 = load i32* %k, align 4
  %382 = add nsw i32 %381, 1
  store i32 %382, i32* %k, align 4
  br label %230

; <label>:383                                     ; preds = %230
  %384 = load i32* %commonlibs, align 4
  store i32 %384, i32* %1
  br label %385

; <label>:385                                     ; preds = %383, %221
  %386 = load i32* %1
  ret i32 %386
}

; Function Attrs: nounwind uwtable
define i32 @have_common_lib(i32 %str1, i32 %str2, i32* %lib) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32*, align 8
  %all_libs1 = alloca [241 x i32], align 16
  %libs1 = alloca i32*, align 8
  %liberties1 = alloca i32, align 4
  %k = alloca i32, align 4
  %n = alloca i32, align 4
  %tmp = alloca i32, align 4
  store i32 %str1, i32* %2, align 4
  store i32 %str2, i32* %3, align 4
  store i32* %lib, i32** %4, align 8
  %5 = load i32* %2, align 4
  %6 = icmp ult i32 %5, 421
  br i1 %6, label %7, label %15

; <label>:7                                       ; preds = %0
  %8 = load i32* %2, align 4
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %9
  %11 = load i8* %10, align 1
  %12 = zext i8 %11 to i32
  %13 = icmp ne i32 %12, 3
  br i1 %13, label %14, label %15

; <label>:14                                      ; preds = %7
  br label %22

; <label>:15                                      ; preds = %7, %0
  %16 = load i32* %2, align 4
  %17 = sdiv i32 %16, 20
  %18 = sub nsw i32 %17, 1
  %19 = load i32* %2, align 4
  %20 = srem i32 %19, 20
  %21 = sub nsw i32 %20, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 2049, i8* getelementptr inbounds ([16 x i8]* @.str29, i32 0, i32 0), i32 %18, i32 %21)
  br label %22

; <label>:22                                      ; preds = %15, %14
  %23 = load i32* %3, align 4
  %24 = icmp ult i32 %23, 421
  br i1 %24, label %25, label %33

; <label>:25                                      ; preds = %22
  %26 = load i32* %3, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %27
  %29 = load i8* %28, align 1
  %30 = zext i8 %29 to i32
  %31 = icmp ne i32 %30, 3
  br i1 %31, label %32, label %33

; <label>:32                                      ; preds = %25
  br label %40

; <label>:33                                      ; preds = %25, %22
  %34 = load i32* %3, align 4
  %35 = sdiv i32 %34, 20
  %36 = sub nsw i32 %35, 1
  %37 = load i32* %3, align 4
  %38 = srem i32 %37, 20
  %39 = sub nsw i32 %38, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 2050, i8* getelementptr inbounds ([16 x i8]* @.str30, i32 0, i32 0), i32 %36, i32 %39)
  br label %40

; <label>:40                                      ; preds = %33, %32
  %41 = load i32* %2, align 4
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %42
  %44 = load i8* %43, align 1
  %45 = zext i8 %44 to i32
  %46 = icmp eq i32 %45, 1
  br i1 %46, label %54, label %47

; <label>:47                                      ; preds = %40
  %48 = load i32* %2, align 4
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %49
  %51 = load i8* %50, align 1
  %52 = zext i8 %51 to i32
  %53 = icmp eq i32 %52, 2
  br i1 %53, label %54, label %55

; <label>:54                                      ; preds = %47, %40
  br label %62

; <label>:55                                      ; preds = %47
  %56 = load i32* %2, align 4
  %57 = sdiv i32 %56, 20
  %58 = sub nsw i32 %57, 1
  %59 = load i32* %2, align 4
  %60 = srem i32 %59, 20
  %61 = sub nsw i32 %60, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 2051, i8* getelementptr inbounds ([22 x i8]* @.str31, i32 0, i32 0), i32 %58, i32 %61)
  br label %62

; <label>:62                                      ; preds = %55, %54
  %63 = load i32* %3, align 4
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %64
  %66 = load i8* %65, align 1
  %67 = zext i8 %66 to i32
  %68 = icmp eq i32 %67, 1
  br i1 %68, label %76, label %69

; <label>:69                                      ; preds = %62
  %70 = load i32* %3, align 4
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %71
  %73 = load i8* %72, align 1
  %74 = zext i8 %73 to i32
  %75 = icmp eq i32 %74, 2
  br i1 %75, label %76, label %77

; <label>:76                                      ; preds = %69, %62
  br label %84

; <label>:77                                      ; preds = %69
  %78 = load i32* %3, align 4
  %79 = sdiv i32 %78, 20
  %80 = sub nsw i32 %79, 1
  %81 = load i32* %3, align 4
  %82 = srem i32 %81, 20
  %83 = sub nsw i32 %82, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 2052, i8* getelementptr inbounds ([22 x i8]* @.str32, i32 0, i32 0), i32 %80, i32 %83)
  br label %84

; <label>:84                                      ; preds = %77, %76
  %85 = load i32* %2, align 4
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %86
  %88 = load i32* %87, align 4
  store i32 %88, i32* %n, align 4
  %89 = load i32* %n, align 4
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %90
  %92 = getelementptr inbounds %struct.string_data* %91, i32 0, i32 3
  %93 = load i32* %92, align 4
  store i32 %93, i32* %liberties1, align 4
  %94 = load i32* %liberties1, align 4
  %95 = load i32* %3, align 4
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %96
  %98 = load i32* %97, align 4
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %99
  %101 = getelementptr inbounds %struct.string_data* %100, i32 0, i32 3
  %102 = load i32* %101, align 4
  %103 = icmp sgt i32 %94, %102
  br i1 %103, label %104, label %117

; <label>:104                                     ; preds = %84
  %105 = load i32* %3, align 4
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %106
  %108 = load i32* %107, align 4
  store i32 %108, i32* %n, align 4
  %109 = load i32* %n, align 4
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %110
  %112 = getelementptr inbounds %struct.string_data* %111, i32 0, i32 3
  %113 = load i32* %112, align 4
  store i32 %113, i32* %liberties1, align 4
  %114 = load i32* %2, align 4
  store i32 %114, i32* %tmp, align 4
  %115 = load i32* %3, align 4
  store i32 %115, i32* %2, align 4
  %116 = load i32* %tmp, align 4
  store i32 %116, i32* %3, align 4
  br label %117

; <label>:117                                     ; preds = %104, %84
  %118 = load i32* %liberties1, align 4
  %119 = icmp sle i32 %118, 20
  br i1 %119, label %120, label %126

; <label>:120                                     ; preds = %117
  %121 = load i32* %n, align 4
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %122
  %124 = getelementptr inbounds %struct.string_data* %123, i32 0, i32 4
  %125 = getelementptr inbounds [20 x i32]* %124, i32 0, i32 0
  store i32* %125, i32** %libs1, align 8
  br label %131

; <label>:126                                     ; preds = %117
  %127 = load i32* %2, align 4
  %128 = getelementptr inbounds [241 x i32]* %all_libs1, i32 0, i32 0
  %129 = call i32 @findlib(i32 %127, i32 241, i32* %128)
  %130 = getelementptr inbounds [241 x i32]* %all_libs1, i32 0, i32 0
  store i32* %130, i32** %libs1, align 8
  br label %131

; <label>:131                                     ; preds = %126, %120
  store i32 0, i32* %k, align 4
  br label %132

; <label>:132                                     ; preds = %276, %131
  %133 = load i32* %k, align 4
  %134 = load i32* %liberties1, align 4
  %135 = icmp slt i32 %133, %134
  br i1 %135, label %136, label %279

; <label>:136                                     ; preds = %132
  %137 = load i32* %k, align 4
  %138 = sext i32 %137 to i64
  %139 = load i32** %libs1, align 8
  %140 = getelementptr inbounds i32* %139, i64 %138
  %141 = load i32* %140, align 4
  %142 = add nsw i32 %141, 20
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %143
  %145 = load i8* %144, align 1
  %146 = zext i8 %145 to i32
  %147 = load i32* %3, align 4
  %148 = sext i32 %147 to i64
  %149 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %148
  %150 = load i8* %149, align 1
  %151 = zext i8 %150 to i32
  %152 = icmp eq i32 %146, %151
  br i1 %152, label %153, label %168

; <label>:153                                     ; preds = %136
  %154 = load i32* %k, align 4
  %155 = sext i32 %154 to i64
  %156 = load i32** %libs1, align 8
  %157 = getelementptr inbounds i32* %156, i64 %155
  %158 = load i32* %157, align 4
  %159 = add nsw i32 %158, 20
  %160 = sext i32 %159 to i64
  %161 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %160
  %162 = load i32* %161, align 4
  %163 = load i32* %3, align 4
  %164 = sext i32 %163 to i64
  %165 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %164
  %166 = load i32* %165, align 4
  %167 = icmp eq i32 %162, %166
  br i1 %167, label %264, label %168

; <label>:168                                     ; preds = %153, %136
  %169 = load i32* %k, align 4
  %170 = sext i32 %169 to i64
  %171 = load i32** %libs1, align 8
  %172 = getelementptr inbounds i32* %171, i64 %170
  %173 = load i32* %172, align 4
  %174 = sub nsw i32 %173, 1
  %175 = sext i32 %174 to i64
  %176 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %175
  %177 = load i8* %176, align 1
  %178 = zext i8 %177 to i32
  %179 = load i32* %3, align 4
  %180 = sext i32 %179 to i64
  %181 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %180
  %182 = load i8* %181, align 1
  %183 = zext i8 %182 to i32
  %184 = icmp eq i32 %178, %183
  br i1 %184, label %185, label %200

; <label>:185                                     ; preds = %168
  %186 = load i32* %k, align 4
  %187 = sext i32 %186 to i64
  %188 = load i32** %libs1, align 8
  %189 = getelementptr inbounds i32* %188, i64 %187
  %190 = load i32* %189, align 4
  %191 = sub nsw i32 %190, 1
  %192 = sext i32 %191 to i64
  %193 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %192
  %194 = load i32* %193, align 4
  %195 = load i32* %3, align 4
  %196 = sext i32 %195 to i64
  %197 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %196
  %198 = load i32* %197, align 4
  %199 = icmp eq i32 %194, %198
  br i1 %199, label %264, label %200

; <label>:200                                     ; preds = %185, %168
  %201 = load i32* %k, align 4
  %202 = sext i32 %201 to i64
  %203 = load i32** %libs1, align 8
  %204 = getelementptr inbounds i32* %203, i64 %202
  %205 = load i32* %204, align 4
  %206 = sub nsw i32 %205, 20
  %207 = sext i32 %206 to i64
  %208 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %207
  %209 = load i8* %208, align 1
  %210 = zext i8 %209 to i32
  %211 = load i32* %3, align 4
  %212 = sext i32 %211 to i64
  %213 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %212
  %214 = load i8* %213, align 1
  %215 = zext i8 %214 to i32
  %216 = icmp eq i32 %210, %215
  br i1 %216, label %217, label %232

; <label>:217                                     ; preds = %200
  %218 = load i32* %k, align 4
  %219 = sext i32 %218 to i64
  %220 = load i32** %libs1, align 8
  %221 = getelementptr inbounds i32* %220, i64 %219
  %222 = load i32* %221, align 4
  %223 = sub nsw i32 %222, 20
  %224 = sext i32 %223 to i64
  %225 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %224
  %226 = load i32* %225, align 4
  %227 = load i32* %3, align 4
  %228 = sext i32 %227 to i64
  %229 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %228
  %230 = load i32* %229, align 4
  %231 = icmp eq i32 %226, %230
  br i1 %231, label %264, label %232

; <label>:232                                     ; preds = %217, %200
  %233 = load i32* %k, align 4
  %234 = sext i32 %233 to i64
  %235 = load i32** %libs1, align 8
  %236 = getelementptr inbounds i32* %235, i64 %234
  %237 = load i32* %236, align 4
  %238 = add nsw i32 %237, 1
  %239 = sext i32 %238 to i64
  %240 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %239
  %241 = load i8* %240, align 1
  %242 = zext i8 %241 to i32
  %243 = load i32* %3, align 4
  %244 = sext i32 %243 to i64
  %245 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %244
  %246 = load i8* %245, align 1
  %247 = zext i8 %246 to i32
  %248 = icmp eq i32 %242, %247
  br i1 %248, label %249, label %275

; <label>:249                                     ; preds = %232
  %250 = load i32* %k, align 4
  %251 = sext i32 %250 to i64
  %252 = load i32** %libs1, align 8
  %253 = getelementptr inbounds i32* %252, i64 %251
  %254 = load i32* %253, align 4
  %255 = add nsw i32 %254, 1
  %256 = sext i32 %255 to i64
  %257 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %256
  %258 = load i32* %257, align 4
  %259 = load i32* %3, align 4
  %260 = sext i32 %259 to i64
  %261 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %260
  %262 = load i32* %261, align 4
  %263 = icmp eq i32 %258, %262
  br i1 %263, label %264, label %275

; <label>:264                                     ; preds = %249, %217, %185, %153
  %265 = load i32** %4, align 8
  %266 = icmp ne i32* %265, null
  br i1 %266, label %267, label %274

; <label>:267                                     ; preds = %264
  %268 = load i32* %k, align 4
  %269 = sext i32 %268 to i64
  %270 = load i32** %libs1, align 8
  %271 = getelementptr inbounds i32* %270, i64 %269
  %272 = load i32* %271, align 4
  %273 = load i32** %4, align 8
  store i32 %272, i32* %273, align 4
  br label %274

; <label>:274                                     ; preds = %267, %264
  store i32 1, i32* %1
  br label %280

; <label>:275                                     ; preds = %249, %232
  br label %276

; <label>:276                                     ; preds = %275
  %277 = load i32* %k, align 4
  %278 = add nsw i32 %277, 1
  store i32 %278, i32* %k, align 4
  br label %132

; <label>:279                                     ; preds = %132
  store i32 0, i32* %1
  br label %280

; <label>:280                                     ; preds = %279, %274
  %281 = load i32* %1
  ret i32 %281
}

; Function Attrs: nounwind uwtable
define i32 @countstones(i32 %str) #0 {
  %1 = alloca i32, align 4
  store i32 %str, i32* %1, align 4
  %2 = load i32* %1, align 4
  %3 = icmp ult i32 %2, 421
  br i1 %3, label %4, label %12

; <label>:4                                       ; preds = %0
  %5 = load i32* %1, align 4
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %6
  %8 = load i8* %7, align 1
  %9 = zext i8 %8 to i32
  %10 = icmp ne i32 %9, 3
  br i1 %10, label %11, label %12

; <label>:11                                      ; preds = %4
  br label %19

; <label>:12                                      ; preds = %4, %0
  %13 = load i32* %1, align 4
  %14 = sdiv i32 %13, 20
  %15 = sub nsw i32 %14, 1
  %16 = load i32* %1, align 4
  %17 = srem i32 %16, 20
  %18 = sub nsw i32 %17, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 2093, i8* getelementptr inbounds ([15 x i8]* @.str33, i32 0, i32 0), i32 %15, i32 %18)
  br label %19

; <label>:19                                      ; preds = %12, %11
  %20 = load i32* %1, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %21
  %23 = load i8* %22, align 1
  %24 = zext i8 %23 to i32
  %25 = icmp eq i32 %24, 1
  br i1 %25, label %33, label %26

; <label>:26                                      ; preds = %19
  %27 = load i32* %1, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %28
  %30 = load i8* %29, align 1
  %31 = zext i8 %30 to i32
  %32 = icmp eq i32 %31, 2
  br i1 %32, label %33, label %34

; <label>:33                                      ; preds = %26, %19
  br label %41

; <label>:34                                      ; preds = %26
  %35 = load i32* %1, align 4
  %36 = sdiv i32 %35, 20
  %37 = sub nsw i32 %36, 1
  %38 = load i32* %1, align 4
  %39 = srem i32 %38, 20
  %40 = sub nsw i32 %39, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 2094, i8* getelementptr inbounds ([21 x i8]* @.str26, i32 0, i32 0), i32 %37, i32 %40)
  br label %41

; <label>:41                                      ; preds = %34, %33
  %42 = load i32* %1, align 4
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %43
  %45 = load i32* %44, align 4
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %46
  %48 = getelementptr inbounds %struct.string_data* %47, i32 0, i32 1
  %49 = load i32* %48, align 4
  ret i32 %49
}

; Function Attrs: nounwind uwtable
define i32 @findstones(i32 %str, i32 %maxstones, i32* %stones) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32*, align 8
  %s = alloca i32, align 4
  %size = alloca i32, align 4
  %pos = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 %str, i32* %1, align 4
  store i32 %maxstones, i32* %2, align 4
  store i32* %stones, i32** %3, align 8
  %4 = load i32* %1, align 4
  %5 = icmp ult i32 %4, 421
  br i1 %5, label %6, label %14

; <label>:6                                       ; preds = %0
  %7 = load i32* %1, align 4
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %8
  %10 = load i8* %9, align 1
  %11 = zext i8 %10 to i32
  %12 = icmp ne i32 %11, 3
  br i1 %12, label %13, label %14

; <label>:13                                      ; preds = %6
  br label %21

; <label>:14                                      ; preds = %6, %0
  %15 = load i32* %1, align 4
  %16 = sdiv i32 %15, 20
  %17 = sub nsw i32 %16, 1
  %18 = load i32* %1, align 4
  %19 = srem i32 %18, 20
  %20 = sub nsw i32 %19, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 2113, i8* getelementptr inbounds ([15 x i8]* @.str33, i32 0, i32 0), i32 %17, i32 %20)
  br label %21

; <label>:21                                      ; preds = %14, %13
  %22 = load i32* %1, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %23
  %25 = load i8* %24, align 1
  %26 = zext i8 %25 to i32
  %27 = icmp eq i32 %26, 1
  br i1 %27, label %35, label %28

; <label>:28                                      ; preds = %21
  %29 = load i32* %1, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %30
  %32 = load i8* %31, align 1
  %33 = zext i8 %32 to i32
  %34 = icmp eq i32 %33, 2
  br i1 %34, label %35, label %36

; <label>:35                                      ; preds = %28, %21
  br label %43

; <label>:36                                      ; preds = %28
  %37 = load i32* %1, align 4
  %38 = sdiv i32 %37, 20
  %39 = sub nsw i32 %38, 1
  %40 = load i32* %1, align 4
  %41 = srem i32 %40, 20
  %42 = sub nsw i32 %41, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 2114, i8* getelementptr inbounds ([21 x i8]* @.str26, i32 0, i32 0), i32 %39, i32 %42)
  br label %43

; <label>:43                                      ; preds = %36, %35
  %44 = load i32* %1, align 4
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %45
  %47 = load i32* %46, align 4
  store i32 %47, i32* %s, align 4
  %48 = load i32* %s, align 4
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %49
  %51 = getelementptr inbounds %struct.string_data* %50, i32 0, i32 1
  %52 = load i32* %51, align 4
  store i32 %52, i32* %size, align 4
  %53 = load i32* %s, align 4
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %54
  %56 = getelementptr inbounds %struct.string_data* %55, i32 0, i32 2
  %57 = load i32* %56, align 4
  store i32 %57, i32* %pos, align 4
  store i32 0, i32* %k, align 4
  br label %58

; <label>:58                                      ; preds = %78, %43
  %59 = load i32* %k, align 4
  %60 = load i32* %2, align 4
  %61 = icmp slt i32 %59, %60
  br i1 %61, label %62, label %66

; <label>:62                                      ; preds = %58
  %63 = load i32* %k, align 4
  %64 = load i32* %size, align 4
  %65 = icmp slt i32 %63, %64
  br label %66

; <label>:66                                      ; preds = %62, %58
  %67 = phi i1 [ false, %58 ], [ %65, %62 ]
  br i1 %67, label %68, label %81

; <label>:68                                      ; preds = %66
  %69 = load i32* %pos, align 4
  %70 = load i32* %k, align 4
  %71 = sext i32 %70 to i64
  %72 = load i32** %3, align 8
  %73 = getelementptr inbounds i32* %72, i64 %71
  store i32 %69, i32* %73, align 4
  %74 = load i32* %pos, align 4
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds [400 x i32]* @next_stone, i32 0, i64 %75
  %77 = load i32* %76, align 4
  store i32 %77, i32* %pos, align 4
  br label %78

; <label>:78                                      ; preds = %68
  %79 = load i32* %k, align 4
  %80 = add nsw i32 %79, 1
  store i32 %80, i32* %k, align 4
  br label %58

; <label>:81                                      ; preds = %66
  %82 = load i32* %size, align 4
  ret i32 %82
}

; Function Attrs: nounwind uwtable
define i32 @chainlinks(i32 %str, i32* %adj) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32*, align 8
  %s = alloca %struct.string_data*, align 8
  %k = alloca i32, align 4
  store i32 %str, i32* %1, align 4
  store i32* %adj, i32** %2, align 8
  %3 = load i32* %1, align 4
  %4 = sext i32 %3 to i64
  %5 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %4
  %6 = load i8* %5, align 1
  %7 = zext i8 %6 to i32
  %8 = icmp eq i32 %7, 1
  br i1 %8, label %16, label %9

; <label>:9                                       ; preds = %0
  %10 = load i32* %1, align 4
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %11
  %13 = load i8* %12, align 1
  %14 = zext i8 %13 to i32
  %15 = icmp eq i32 %14, 2
  br i1 %15, label %16, label %17

; <label>:16                                      ; preds = %9, %0
  br label %24

; <label>:17                                      ; preds = %9
  %18 = load i32* %1, align 4
  %19 = sdiv i32 %18, 20
  %20 = sub nsw i32 %19, 1
  %21 = load i32* %1, align 4
  %22 = srem i32 %21, 20
  %23 = sub nsw i32 %22, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 2140, i8* getelementptr inbounds ([21 x i8]* @.str26, i32 0, i32 0), i32 %20, i32 %23)
  br label %24

; <label>:24                                      ; preds = %17, %16
  %25 = load i32* %1, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %26
  %28 = load i32* %27, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %29
  store %struct.string_data* %30, %struct.string_data** %s, align 8
  store i32 0, i32* %k, align 4
  br label %31

; <label>:31                                      ; preds = %52, %24
  %32 = load i32* %k, align 4
  %33 = load %struct.string_data** %s, align 8
  %34 = getelementptr inbounds %struct.string_data* %33, i32 0, i32 5
  %35 = load i32* %34, align 4
  %36 = icmp slt i32 %32, %35
  br i1 %36, label %37, label %55

; <label>:37                                      ; preds = %31
  %38 = load i32* %k, align 4
  %39 = sext i32 %38 to i64
  %40 = load %struct.string_data** %s, align 8
  %41 = getelementptr inbounds %struct.string_data* %40, i32 0, i32 6
  %42 = getelementptr inbounds [160 x i32]* %41, i32 0, i64 %39
  %43 = load i32* %42, align 4
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %44
  %46 = getelementptr inbounds %struct.string_data* %45, i32 0, i32 2
  %47 = load i32* %46, align 4
  %48 = load i32* %k, align 4
  %49 = sext i32 %48 to i64
  %50 = load i32** %2, align 8
  %51 = getelementptr inbounds i32* %50, i64 %49
  store i32 %47, i32* %51, align 4
  br label %52

; <label>:52                                      ; preds = %37
  %53 = load i32* %k, align 4
  %54 = add nsw i32 %53, 1
  store i32 %54, i32* %k, align 4
  br label %31

; <label>:55                                      ; preds = %31
  %56 = load %struct.string_data** %s, align 8
  %57 = getelementptr inbounds %struct.string_data* %56, i32 0, i32 5
  %58 = load i32* %57, align 4
  ret i32 %58
}

; Function Attrs: nounwind uwtable
define i32 @chainlinks2(i32 %str, i32* %adj, i32 %lib) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32*, align 8
  %3 = alloca i32, align 4
  %s = alloca %struct.string_data*, align 8
  %t = alloca %struct.string_data*, align 8
  %k = alloca i32, align 4
  %neighbors = alloca i32, align 4
  store i32 %str, i32* %1, align 4
  store i32* %adj, i32** %2, align 8
  store i32 %lib, i32* %3, align 4
  %4 = load i32* %1, align 4
  %5 = sext i32 %4 to i64
  %6 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %5
  %7 = load i8* %6, align 1
  %8 = zext i8 %7 to i32
  %9 = icmp eq i32 %8, 1
  br i1 %9, label %17, label %10

; <label>:10                                      ; preds = %0
  %11 = load i32* %1, align 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %12
  %14 = load i8* %13, align 1
  %15 = zext i8 %14 to i32
  %16 = icmp eq i32 %15, 2
  br i1 %16, label %17, label %18

; <label>:17                                      ; preds = %10, %0
  br label %25

; <label>:18                                      ; preds = %10
  %19 = load i32* %1, align 4
  %20 = sdiv i32 %19, 20
  %21 = sub nsw i32 %20, 1
  %22 = load i32* %1, align 4
  %23 = srem i32 %22, 20
  %24 = sub nsw i32 %23, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 2165, i8* getelementptr inbounds ([21 x i8]* @.str26, i32 0, i32 0), i32 %21, i32 %24)
  br label %25

; <label>:25                                      ; preds = %18, %17
  store i32 0, i32* %neighbors, align 4
  %26 = load i32* %1, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %27
  %29 = load i32* %28, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %30
  store %struct.string_data* %31, %struct.string_data** %s, align 8
  store i32 0, i32* %k, align 4
  br label %32

; <label>:32                                      ; preds = %62, %25
  %33 = load i32* %k, align 4
  %34 = load %struct.string_data** %s, align 8
  %35 = getelementptr inbounds %struct.string_data* %34, i32 0, i32 5
  %36 = load i32* %35, align 4
  %37 = icmp slt i32 %33, %36
  br i1 %37, label %38, label %65

; <label>:38                                      ; preds = %32
  %39 = load i32* %k, align 4
  %40 = sext i32 %39 to i64
  %41 = load %struct.string_data** %s, align 8
  %42 = getelementptr inbounds %struct.string_data* %41, i32 0, i32 6
  %43 = getelementptr inbounds [160 x i32]* %42, i32 0, i64 %40
  %44 = load i32* %43, align 4
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %45
  store %struct.string_data* %46, %struct.string_data** %t, align 8
  %47 = load %struct.string_data** %t, align 8
  %48 = getelementptr inbounds %struct.string_data* %47, i32 0, i32 3
  %49 = load i32* %48, align 4
  %50 = load i32* %3, align 4
  %51 = icmp eq i32 %49, %50
  br i1 %51, label %52, label %61

; <label>:52                                      ; preds = %38
  %53 = load %struct.string_data** %t, align 8
  %54 = getelementptr inbounds %struct.string_data* %53, i32 0, i32 2
  %55 = load i32* %54, align 4
  %56 = load i32* %neighbors, align 4
  %57 = add nsw i32 %56, 1
  store i32 %57, i32* %neighbors, align 4
  %58 = sext i32 %56 to i64
  %59 = load i32** %2, align 8
  %60 = getelementptr inbounds i32* %59, i64 %58
  store i32 %55, i32* %60, align 4
  br label %61

; <label>:61                                      ; preds = %52, %38
  br label %62

; <label>:62                                      ; preds = %61
  %63 = load i32* %k, align 4
  %64 = add nsw i32 %63, 1
  store i32 %64, i32* %k, align 4
  br label %32

; <label>:65                                      ; preds = %32
  %66 = load i32* %neighbors, align 4
  ret i32 %66
}

; Function Attrs: nounwind uwtable
define i32 @chainlinks3(i32 %str, i32* %adj, i32 %lib) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32*, align 8
  %3 = alloca i32, align 4
  %s = alloca %struct.string_data*, align 8
  %t = alloca %struct.string_data*, align 8
  %k = alloca i32, align 4
  %neighbors = alloca i32, align 4
  store i32 %str, i32* %1, align 4
  store i32* %adj, i32** %2, align 8
  store i32 %lib, i32* %3, align 4
  %4 = load i32* %1, align 4
  %5 = sext i32 %4 to i64
  %6 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %5
  %7 = load i8* %6, align 1
  %8 = zext i8 %7 to i32
  %9 = icmp eq i32 %8, 1
  br i1 %9, label %17, label %10

; <label>:10                                      ; preds = %0
  %11 = load i32* %1, align 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %12
  %14 = load i8* %13, align 1
  %15 = zext i8 %14 to i32
  %16 = icmp eq i32 %15, 2
  br i1 %16, label %17, label %18

; <label>:17                                      ; preds = %10, %0
  br label %25

; <label>:18                                      ; preds = %10
  %19 = load i32* %1, align 4
  %20 = sdiv i32 %19, 20
  %21 = sub nsw i32 %20, 1
  %22 = load i32* %1, align 4
  %23 = srem i32 %22, 20
  %24 = sub nsw i32 %23, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 2193, i8* getelementptr inbounds ([21 x i8]* @.str26, i32 0, i32 0), i32 %21, i32 %24)
  br label %25

; <label>:25                                      ; preds = %18, %17
  store i32 0, i32* %neighbors, align 4
  %26 = load i32* %1, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %27
  %29 = load i32* %28, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %30
  store %struct.string_data* %31, %struct.string_data** %s, align 8
  store i32 0, i32* %k, align 4
  br label %32

; <label>:32                                      ; preds = %62, %25
  %33 = load i32* %k, align 4
  %34 = load %struct.string_data** %s, align 8
  %35 = getelementptr inbounds %struct.string_data* %34, i32 0, i32 5
  %36 = load i32* %35, align 4
  %37 = icmp slt i32 %33, %36
  br i1 %37, label %38, label %65

; <label>:38                                      ; preds = %32
  %39 = load i32* %k, align 4
  %40 = sext i32 %39 to i64
  %41 = load %struct.string_data** %s, align 8
  %42 = getelementptr inbounds %struct.string_data* %41, i32 0, i32 6
  %43 = getelementptr inbounds [160 x i32]* %42, i32 0, i64 %40
  %44 = load i32* %43, align 4
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %45
  store %struct.string_data* %46, %struct.string_data** %t, align 8
  %47 = load %struct.string_data** %t, align 8
  %48 = getelementptr inbounds %struct.string_data* %47, i32 0, i32 3
  %49 = load i32* %48, align 4
  %50 = load i32* %3, align 4
  %51 = icmp sle i32 %49, %50
  br i1 %51, label %52, label %61

; <label>:52                                      ; preds = %38
  %53 = load %struct.string_data** %t, align 8
  %54 = getelementptr inbounds %struct.string_data* %53, i32 0, i32 2
  %55 = load i32* %54, align 4
  %56 = load i32* %neighbors, align 4
  %57 = add nsw i32 %56, 1
  store i32 %57, i32* %neighbors, align 4
  %58 = sext i32 %56 to i64
  %59 = load i32** %2, align 8
  %60 = getelementptr inbounds i32* %59, i64 %58
  store i32 %55, i32* %60, align 4
  br label %61

; <label>:61                                      ; preds = %52, %38
  br label %62

; <label>:62                                      ; preds = %61
  %63 = load i32* %k, align 4
  %64 = add nsw i32 %63, 1
  store i32 %64, i32* %k, align 4
  br label %32

; <label>:65                                      ; preds = %32
  %66 = load i32* %neighbors, align 4
  ret i32 %66
}

; Function Attrs: nounwind uwtable
define i32 @extended_chainlinks(i32 %str, i32* %adj, i32 %both_colors) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32*, align 8
  %3 = alloca i32, align 4
  %s = alloca %struct.string_data*, align 8
  %n = alloca i32, align 4
  %k = alloca i32, align 4
  %r = alloca i32, align 4
  %libs = alloca [241 x i32], align 16
  %liberties = alloca i32, align 4
  store i32 %str, i32* %1, align 4
  store i32* %adj, i32** %2, align 8
  store i32 %both_colors, i32* %3, align 4
  %4 = load i32* %1, align 4
  %5 = sext i32 %4 to i64
  %6 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %5
  %7 = load i8* %6, align 1
  %8 = zext i8 %7 to i32
  %9 = icmp eq i32 %8, 1
  br i1 %9, label %17, label %10

; <label>:10                                      ; preds = %0
  %11 = load i32* %1, align 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %12
  %14 = load i8* %13, align 1
  %15 = zext i8 %14 to i32
  %16 = icmp eq i32 %15, 2
  br i1 %16, label %17, label %18

; <label>:17                                      ; preds = %10, %0
  br label %25

; <label>:18                                      ; preds = %10
  %19 = load i32* %1, align 4
  %20 = sdiv i32 %19, 20
  %21 = sub nsw i32 %20, 1
  %22 = load i32* %1, align 4
  %23 = srem i32 %22, 20
  %24 = sub nsw i32 %23, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 2227, i8* getelementptr inbounds ([21 x i8]* @.str26, i32 0, i32 0), i32 %21, i32 %24)
  br label %25

; <label>:25                                      ; preds = %18, %17
  %26 = load i32* %1, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %27
  %29 = load i32* %28, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %30
  store %struct.string_data* %31, %struct.string_data** %s, align 8
  %32 = load i32* @string_mark, align 4
  %33 = add nsw i32 %32, 1
  store i32 %33, i32* @string_mark, align 4
  store i32 0, i32* %n, align 4
  br label %34

; <label>:34                                      ; preds = %67, %25
  %35 = load i32* %n, align 4
  %36 = load %struct.string_data** %s, align 8
  %37 = getelementptr inbounds %struct.string_data* %36, i32 0, i32 5
  %38 = load i32* %37, align 4
  %39 = icmp slt i32 %35, %38
  br i1 %39, label %40, label %70

; <label>:40                                      ; preds = %34
  %41 = load i32* %n, align 4
  %42 = sext i32 %41 to i64
  %43 = load %struct.string_data** %s, align 8
  %44 = getelementptr inbounds %struct.string_data* %43, i32 0, i32 6
  %45 = getelementptr inbounds [160 x i32]* %44, i32 0, i64 %42
  %46 = load i32* %45, align 4
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %47
  %49 = getelementptr inbounds %struct.string_data* %48, i32 0, i32 2
  %50 = load i32* %49, align 4
  %51 = load i32* %n, align 4
  %52 = sext i32 %51 to i64
  %53 = load i32** %2, align 8
  %54 = getelementptr inbounds i32* %53, i64 %52
  store i32 %50, i32* %54, align 4
  %55 = load i32* @string_mark, align 4
  %56 = load i32* %n, align 4
  %57 = sext i32 %56 to i64
  %58 = load i32** %2, align 8
  %59 = getelementptr inbounds i32* %58, i64 %57
  %60 = load i32* %59, align 4
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %61
  %63 = load i32* %62, align 4
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %64
  %66 = getelementptr inbounds %struct.string_data* %65, i32 0, i32 7
  store i32 %55, i32* %66, align 4
  br label %67

; <label>:67                                      ; preds = %40
  %68 = load i32* %n, align 4
  %69 = add nsw i32 %68, 1
  store i32 %69, i32* %n, align 4
  br label %34

; <label>:70                                      ; preds = %34
  %71 = load i32* %1, align 4
  %72 = getelementptr inbounds [241 x i32]* %libs, i32 0, i32 0
  %73 = call i32 @findlib(i32 %71, i32 241, i32* %72)
  store i32 %73, i32* %liberties, align 4
  store i32 0, i32* %r, align 4
  br label %74

; <label>:74                                      ; preds = %185, %70
  %75 = load i32* %r, align 4
  %76 = load i32* %liberties, align 4
  %77 = icmp slt i32 %75, %76
  br i1 %77, label %78, label %188

; <label>:78                                      ; preds = %74
  store i32 0, i32* %k, align 4
  br label %79

; <label>:79                                      ; preds = %181, %78
  %80 = load i32* %k, align 4
  %81 = icmp slt i32 %80, 4
  br i1 %81, label %82, label %184

; <label>:82                                      ; preds = %79
  %83 = load i32* %r, align 4
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds [241 x i32]* %libs, i32 0, i64 %84
  %86 = load i32* %85, align 4
  %87 = load i32* %k, align 4
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds [8 x i32]* @delta, i32 0, i64 %88
  %90 = load i32* %89, align 4
  %91 = add nsw i32 %86, %90
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %92
  %94 = load i8* %93, align 1
  %95 = zext i8 %94 to i32
  %96 = load i32* %1, align 4
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %97
  %99 = load i8* %98, align 1
  %100 = zext i8 %99 to i32
  %101 = sub nsw i32 3, %100
  %102 = icmp eq i32 %95, %101
  br i1 %102, label %126, label %103

; <label>:103                                     ; preds = %82
  %104 = load i32* %3, align 4
  %105 = icmp ne i32 %104, 0
  br i1 %105, label %106, label %180

; <label>:106                                     ; preds = %103
  %107 = load i32* %r, align 4
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds [241 x i32]* %libs, i32 0, i64 %108
  %110 = load i32* %109, align 4
  %111 = load i32* %k, align 4
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds [8 x i32]* @delta, i32 0, i64 %112
  %114 = load i32* %113, align 4
  %115 = add nsw i32 %110, %114
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %116
  %118 = load i8* %117, align 1
  %119 = zext i8 %118 to i32
  %120 = load i32* %1, align 4
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %121
  %123 = load i8* %122, align 1
  %124 = zext i8 %123 to i32
  %125 = icmp eq i32 %119, %124
  br i1 %125, label %126, label %180

; <label>:126                                     ; preds = %106, %82
  %127 = load i32* %r, align 4
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds [241 x i32]* %libs, i32 0, i64 %128
  %130 = load i32* %129, align 4
  %131 = load i32* %k, align 4
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds [8 x i32]* @delta, i32 0, i64 %132
  %134 = load i32* %133, align 4
  %135 = add nsw i32 %130, %134
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %136
  %138 = load i32* %137, align 4
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %139
  %141 = getelementptr inbounds %struct.string_data* %140, i32 0, i32 7
  %142 = load i32* %141, align 4
  %143 = load i32* @string_mark, align 4
  %144 = icmp ne i32 %142, %143
  br i1 %144, label %145, label %180

; <label>:145                                     ; preds = %126
  %146 = load i32* %r, align 4
  %147 = sext i32 %146 to i64
  %148 = getelementptr inbounds [241 x i32]* %libs, i32 0, i64 %147
  %149 = load i32* %148, align 4
  %150 = load i32* %k, align 4
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds [8 x i32]* @delta, i32 0, i64 %151
  %153 = load i32* %152, align 4
  %154 = add nsw i32 %149, %153
  %155 = sext i32 %154 to i64
  %156 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %155
  %157 = load i32* %156, align 4
  %158 = sext i32 %157 to i64
  %159 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %158
  %160 = getelementptr inbounds %struct.string_data* %159, i32 0, i32 2
  %161 = load i32* %160, align 4
  %162 = load i32* %n, align 4
  %163 = sext i32 %162 to i64
  %164 = load i32** %2, align 8
  %165 = getelementptr inbounds i32* %164, i64 %163
  store i32 %161, i32* %165, align 4
  %166 = load i32* @string_mark, align 4
  %167 = load i32* %n, align 4
  %168 = sext i32 %167 to i64
  %169 = load i32** %2, align 8
  %170 = getelementptr inbounds i32* %169, i64 %168
  %171 = load i32* %170, align 4
  %172 = sext i32 %171 to i64
  %173 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %172
  %174 = load i32* %173, align 4
  %175 = sext i32 %174 to i64
  %176 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %175
  %177 = getelementptr inbounds %struct.string_data* %176, i32 0, i32 7
  store i32 %166, i32* %177, align 4
  %178 = load i32* %n, align 4
  %179 = add nsw i32 %178, 1
  store i32 %179, i32* %n, align 4
  br label %180

; <label>:180                                     ; preds = %145, %126, %106, %103
  br label %181

; <label>:181                                     ; preds = %180
  %182 = load i32* %k, align 4
  %183 = add nsw i32 %182, 1
  store i32 %183, i32* %k, align 4
  br label %79

; <label>:184                                     ; preds = %79
  br label %185

; <label>:185                                     ; preds = %184
  %186 = load i32* %r, align 4
  %187 = add nsw i32 %186, 1
  store i32 %187, i32* %r, align 4
  br label %74

; <label>:188                                     ; preds = %74
  %189 = load i32* %n, align 4
  ret i32 %189
}

; Function Attrs: nounwind uwtable
define i32 @find_origin(i32 %str) #0 {
  %1 = alloca i32, align 4
  store i32 %str, i32* %1, align 4
  %2 = load i32* %1, align 4
  %3 = sext i32 %2 to i64
  %4 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %3
  %5 = load i8* %4, align 1
  %6 = zext i8 %5 to i32
  %7 = icmp eq i32 %6, 1
  br i1 %7, label %15, label %8

; <label>:8                                       ; preds = %0
  %9 = load i32* %1, align 4
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %10
  %12 = load i8* %11, align 1
  %13 = zext i8 %12 to i32
  %14 = icmp eq i32 %13, 2
  br i1 %14, label %15, label %16

; <label>:15                                      ; preds = %8, %0
  br label %23

; <label>:16                                      ; preds = %8
  %17 = load i32* %1, align 4
  %18 = sdiv i32 %17, 20
  %19 = sub nsw i32 %18, 1
  %20 = load i32* %1, align 4
  %21 = srem i32 %20, 20
  %22 = sub nsw i32 %21, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 2270, i8* getelementptr inbounds ([21 x i8]* @.str26, i32 0, i32 0), i32 %19, i32 %22)
  br label %23

; <label>:23                                      ; preds = %16, %15
  %24 = load i32* %1, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %25
  %27 = load i32* %26, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %28
  %30 = getelementptr inbounds %struct.string_data* %29, i32 0, i32 2
  %31 = load i32* %30, align 4
  ret i32 %31
}

; Function Attrs: nounwind uwtable
define i32 @is_self_atari(i32 %pos, i32 %color) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %other = alloca i32, align 4
  %trivial_liberties = alloca i32, align 4
  %captures = alloca i32, align 4
  %far_liberties = alloca i32, align 4
  store i32 %pos, i32* %2, align 4
  store i32 %color, i32* %3, align 4
  %4 = load i32* %3, align 4
  %5 = sub nsw i32 3, %4
  store i32 %5, i32* %other, align 4
  store i32 0, i32* %trivial_liberties, align 4
  store i32 0, i32* %captures, align 4
  store i32 0, i32* %far_liberties, align 4
  %6 = load i32* %2, align 4
  %7 = icmp ult i32 %6, 421
  br i1 %7, label %8, label %16

; <label>:8                                       ; preds = %0
  %9 = load i32* %2, align 4
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %10
  %12 = load i8* %11, align 1
  %13 = zext i8 %12 to i32
  %14 = icmp ne i32 %13, 3
  br i1 %14, label %15, label %16

; <label>:15                                      ; preds = %8
  br label %23

; <label>:16                                      ; preds = %8, %0
  %17 = load i32* %2, align 4
  %18 = sdiv i32 %17, 20
  %19 = sub nsw i32 %18, 1
  %20 = load i32* %2, align 4
  %21 = srem i32 %20, 20
  %22 = sub nsw i32 %21, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 2294, i8* getelementptr inbounds ([15 x i8]* @.str19, i32 0, i32 0), i32 %19, i32 %22)
  br label %23

; <label>:23                                      ; preds = %16, %15
  %24 = load i32* %2, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %25
  %27 = load i8* %26, align 1
  %28 = zext i8 %27 to i32
  %29 = icmp eq i32 %28, 0
  br i1 %29, label %30, label %31

; <label>:30                                      ; preds = %23
  br label %38

; <label>:31                                      ; preds = %23
  %32 = load i32* %2, align 4
  %33 = sdiv i32 %32, 20
  %34 = sub nsw i32 %33, 1
  %35 = load i32* %2, align 4
  %36 = srem i32 %35, 20
  %37 = sub nsw i32 %36, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 2295, i8* getelementptr inbounds ([20 x i8]* @.str20, i32 0, i32 0), i32 %34, i32 %37)
  br label %38

; <label>:38                                      ; preds = %31, %30
  %39 = load i32* %3, align 4
  %40 = icmp eq i32 %39, 1
  br i1 %40, label %44, label %41

; <label>:41                                      ; preds = %38
  %42 = load i32* %3, align 4
  %43 = icmp eq i32 %42, 2
  br i1 %43, label %44, label %45

; <label>:44                                      ; preds = %41, %38
  br label %52

; <label>:45                                      ; preds = %41
  %46 = load i32* %2, align 4
  %47 = sdiv i32 %46, 20
  %48 = sub nsw i32 %47, 1
  %49 = load i32* %2, align 4
  %50 = srem i32 %49, 20
  %51 = sub nsw i32 %50, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 2296, i8* getelementptr inbounds ([16 x i8]* @.str28, i32 0, i32 0), i32 %48, i32 %51)
  br label %52

; <label>:52                                      ; preds = %45, %44
  %53 = load i32* @string_mark, align 4
  %54 = add nsw i32 %53, 1
  store i32 %54, i32* @string_mark, align 4
  %55 = load i32* %2, align 4
  %56 = add nsw i32 %55, 20
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %57
  %59 = load i8* %58, align 1
  %60 = zext i8 %59 to i32
  %61 = icmp eq i32 %60, 0
  br i1 %61, label %62, label %65

; <label>:62                                      ; preds = %52
  %63 = load i32* %trivial_liberties, align 4
  %64 = add nsw i32 %63, 1
  store i32 %64, i32* %trivial_liberties, align 4
  br label %147

; <label>:65                                      ; preds = %52
  %66 = load i32* %2, align 4
  %67 = add nsw i32 %66, 20
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %68
  %70 = load i8* %69, align 1
  %71 = zext i8 %70 to i32
  %72 = load i32* %3, align 4
  %73 = icmp eq i32 %71, %72
  br i1 %73, label %74, label %101

; <label>:74                                      ; preds = %65
  %75 = load i32* %2, align 4
  %76 = add nsw i32 %75, 20
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %77
  %79 = load i32* %78, align 4
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %80
  %82 = getelementptr inbounds %struct.string_data* %81, i32 0, i32 3
  %83 = load i32* %82, align 4
  %84 = icmp sgt i32 %83, 2
  br i1 %84, label %85, label %86

; <label>:85                                      ; preds = %74
  store i32 0, i32* %1
  br label %446

; <label>:86                                      ; preds = %74
  %87 = load i32* %2, align 4
  %88 = add nsw i32 %87, 20
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %89
  %91 = load i32* %90, align 4
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %92
  %94 = getelementptr inbounds %struct.string_data* %93, i32 0, i32 3
  %95 = load i32* %94, align 4
  %96 = icmp eq i32 %95, 2
  br i1 %96, label %97, label %100

; <label>:97                                      ; preds = %86
  %98 = load i32* %far_liberties, align 4
  %99 = add nsw i32 %98, 1
  store i32 %99, i32* %far_liberties, align 4
  br label %100

; <label>:100                                     ; preds = %97, %86
  br label %146

; <label>:101                                     ; preds = %65
  %102 = load i32* %2, align 4
  %103 = add nsw i32 %102, 20
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %104
  %106 = load i8* %105, align 1
  %107 = zext i8 %106 to i32
  %108 = load i32* %other, align 4
  %109 = icmp eq i32 %107, %108
  br i1 %109, label %110, label %145

; <label>:110                                     ; preds = %101
  %111 = load i32* %2, align 4
  %112 = add nsw i32 %111, 20
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %113
  %115 = load i32* %114, align 4
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %116
  %118 = getelementptr inbounds %struct.string_data* %117, i32 0, i32 3
  %119 = load i32* %118, align 4
  %120 = icmp eq i32 %119, 1
  br i1 %120, label %121, label %145

; <label>:121                                     ; preds = %110
  %122 = load i32* %2, align 4
  %123 = add nsw i32 %122, 20
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %124
  %126 = load i32* %125, align 4
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %127
  %129 = getelementptr inbounds %struct.string_data* %128, i32 0, i32 7
  %130 = load i32* %129, align 4
  %131 = load i32* @string_mark, align 4
  %132 = icmp ne i32 %130, %131
  br i1 %132, label %133, label %145

; <label>:133                                     ; preds = %121
  %134 = load i32* %captures, align 4
  %135 = add nsw i32 %134, 1
  store i32 %135, i32* %captures, align 4
  %136 = load i32* @string_mark, align 4
  %137 = load i32* %2, align 4
  %138 = add nsw i32 %137, 20
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %139
  %141 = load i32* %140, align 4
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %142
  %144 = getelementptr inbounds %struct.string_data* %143, i32 0, i32 7
  store i32 %136, i32* %144, align 4
  br label %145

; <label>:145                                     ; preds = %133, %121, %110, %101
  br label %146

; <label>:146                                     ; preds = %145, %100
  br label %147

; <label>:147                                     ; preds = %146, %62
  %148 = load i32* %2, align 4
  %149 = sub nsw i32 %148, 1
  %150 = sext i32 %149 to i64
  %151 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %150
  %152 = load i8* %151, align 1
  %153 = zext i8 %152 to i32
  %154 = icmp eq i32 %153, 0
  br i1 %154, label %155, label %158

; <label>:155                                     ; preds = %147
  %156 = load i32* %trivial_liberties, align 4
  %157 = add nsw i32 %156, 1
  store i32 %157, i32* %trivial_liberties, align 4
  br label %240

; <label>:158                                     ; preds = %147
  %159 = load i32* %2, align 4
  %160 = sub nsw i32 %159, 1
  %161 = sext i32 %160 to i64
  %162 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %161
  %163 = load i8* %162, align 1
  %164 = zext i8 %163 to i32
  %165 = load i32* %3, align 4
  %166 = icmp eq i32 %164, %165
  br i1 %166, label %167, label %194

; <label>:167                                     ; preds = %158
  %168 = load i32* %2, align 4
  %169 = sub nsw i32 %168, 1
  %170 = sext i32 %169 to i64
  %171 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %170
  %172 = load i32* %171, align 4
  %173 = sext i32 %172 to i64
  %174 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %173
  %175 = getelementptr inbounds %struct.string_data* %174, i32 0, i32 3
  %176 = load i32* %175, align 4
  %177 = icmp sgt i32 %176, 2
  br i1 %177, label %178, label %179

; <label>:178                                     ; preds = %167
  store i32 0, i32* %1
  br label %446

; <label>:179                                     ; preds = %167
  %180 = load i32* %2, align 4
  %181 = sub nsw i32 %180, 1
  %182 = sext i32 %181 to i64
  %183 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %182
  %184 = load i32* %183, align 4
  %185 = sext i32 %184 to i64
  %186 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %185
  %187 = getelementptr inbounds %struct.string_data* %186, i32 0, i32 3
  %188 = load i32* %187, align 4
  %189 = icmp eq i32 %188, 2
  br i1 %189, label %190, label %193

; <label>:190                                     ; preds = %179
  %191 = load i32* %far_liberties, align 4
  %192 = add nsw i32 %191, 1
  store i32 %192, i32* %far_liberties, align 4
  br label %193

; <label>:193                                     ; preds = %190, %179
  br label %239

; <label>:194                                     ; preds = %158
  %195 = load i32* %2, align 4
  %196 = sub nsw i32 %195, 1
  %197 = sext i32 %196 to i64
  %198 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %197
  %199 = load i8* %198, align 1
  %200 = zext i8 %199 to i32
  %201 = load i32* %other, align 4
  %202 = icmp eq i32 %200, %201
  br i1 %202, label %203, label %238

; <label>:203                                     ; preds = %194
  %204 = load i32* %2, align 4
  %205 = sub nsw i32 %204, 1
  %206 = sext i32 %205 to i64
  %207 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %206
  %208 = load i32* %207, align 4
  %209 = sext i32 %208 to i64
  %210 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %209
  %211 = getelementptr inbounds %struct.string_data* %210, i32 0, i32 3
  %212 = load i32* %211, align 4
  %213 = icmp eq i32 %212, 1
  br i1 %213, label %214, label %238

; <label>:214                                     ; preds = %203
  %215 = load i32* %2, align 4
  %216 = sub nsw i32 %215, 1
  %217 = sext i32 %216 to i64
  %218 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %217
  %219 = load i32* %218, align 4
  %220 = sext i32 %219 to i64
  %221 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %220
  %222 = getelementptr inbounds %struct.string_data* %221, i32 0, i32 7
  %223 = load i32* %222, align 4
  %224 = load i32* @string_mark, align 4
  %225 = icmp ne i32 %223, %224
  br i1 %225, label %226, label %238

; <label>:226                                     ; preds = %214
  %227 = load i32* %captures, align 4
  %228 = add nsw i32 %227, 1
  store i32 %228, i32* %captures, align 4
  %229 = load i32* @string_mark, align 4
  %230 = load i32* %2, align 4
  %231 = sub nsw i32 %230, 1
  %232 = sext i32 %231 to i64
  %233 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %232
  %234 = load i32* %233, align 4
  %235 = sext i32 %234 to i64
  %236 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %235
  %237 = getelementptr inbounds %struct.string_data* %236, i32 0, i32 7
  store i32 %229, i32* %237, align 4
  br label %238

; <label>:238                                     ; preds = %226, %214, %203, %194
  br label %239

; <label>:239                                     ; preds = %238, %193
  br label %240

; <label>:240                                     ; preds = %239, %155
  %241 = load i32* %2, align 4
  %242 = sub nsw i32 %241, 20
  %243 = sext i32 %242 to i64
  %244 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %243
  %245 = load i8* %244, align 1
  %246 = zext i8 %245 to i32
  %247 = icmp eq i32 %246, 0
  br i1 %247, label %248, label %251

; <label>:248                                     ; preds = %240
  %249 = load i32* %trivial_liberties, align 4
  %250 = add nsw i32 %249, 1
  store i32 %250, i32* %trivial_liberties, align 4
  br label %333

; <label>:251                                     ; preds = %240
  %252 = load i32* %2, align 4
  %253 = sub nsw i32 %252, 20
  %254 = sext i32 %253 to i64
  %255 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %254
  %256 = load i8* %255, align 1
  %257 = zext i8 %256 to i32
  %258 = load i32* %3, align 4
  %259 = icmp eq i32 %257, %258
  br i1 %259, label %260, label %287

; <label>:260                                     ; preds = %251
  %261 = load i32* %2, align 4
  %262 = sub nsw i32 %261, 20
  %263 = sext i32 %262 to i64
  %264 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %263
  %265 = load i32* %264, align 4
  %266 = sext i32 %265 to i64
  %267 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %266
  %268 = getelementptr inbounds %struct.string_data* %267, i32 0, i32 3
  %269 = load i32* %268, align 4
  %270 = icmp sgt i32 %269, 2
  br i1 %270, label %271, label %272

; <label>:271                                     ; preds = %260
  store i32 0, i32* %1
  br label %446

; <label>:272                                     ; preds = %260
  %273 = load i32* %2, align 4
  %274 = sub nsw i32 %273, 20
  %275 = sext i32 %274 to i64
  %276 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %275
  %277 = load i32* %276, align 4
  %278 = sext i32 %277 to i64
  %279 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %278
  %280 = getelementptr inbounds %struct.string_data* %279, i32 0, i32 3
  %281 = load i32* %280, align 4
  %282 = icmp eq i32 %281, 2
  br i1 %282, label %283, label %286

; <label>:283                                     ; preds = %272
  %284 = load i32* %far_liberties, align 4
  %285 = add nsw i32 %284, 1
  store i32 %285, i32* %far_liberties, align 4
  br label %286

; <label>:286                                     ; preds = %283, %272
  br label %332

; <label>:287                                     ; preds = %251
  %288 = load i32* %2, align 4
  %289 = sub nsw i32 %288, 20
  %290 = sext i32 %289 to i64
  %291 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %290
  %292 = load i8* %291, align 1
  %293 = zext i8 %292 to i32
  %294 = load i32* %other, align 4
  %295 = icmp eq i32 %293, %294
  br i1 %295, label %296, label %331

; <label>:296                                     ; preds = %287
  %297 = load i32* %2, align 4
  %298 = sub nsw i32 %297, 20
  %299 = sext i32 %298 to i64
  %300 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %299
  %301 = load i32* %300, align 4
  %302 = sext i32 %301 to i64
  %303 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %302
  %304 = getelementptr inbounds %struct.string_data* %303, i32 0, i32 3
  %305 = load i32* %304, align 4
  %306 = icmp eq i32 %305, 1
  br i1 %306, label %307, label %331

; <label>:307                                     ; preds = %296
  %308 = load i32* %2, align 4
  %309 = sub nsw i32 %308, 20
  %310 = sext i32 %309 to i64
  %311 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %310
  %312 = load i32* %311, align 4
  %313 = sext i32 %312 to i64
  %314 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %313
  %315 = getelementptr inbounds %struct.string_data* %314, i32 0, i32 7
  %316 = load i32* %315, align 4
  %317 = load i32* @string_mark, align 4
  %318 = icmp ne i32 %316, %317
  br i1 %318, label %319, label %331

; <label>:319                                     ; preds = %307
  %320 = load i32* %captures, align 4
  %321 = add nsw i32 %320, 1
  store i32 %321, i32* %captures, align 4
  %322 = load i32* @string_mark, align 4
  %323 = load i32* %2, align 4
  %324 = sub nsw i32 %323, 20
  %325 = sext i32 %324 to i64
  %326 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %325
  %327 = load i32* %326, align 4
  %328 = sext i32 %327 to i64
  %329 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %328
  %330 = getelementptr inbounds %struct.string_data* %329, i32 0, i32 7
  store i32 %322, i32* %330, align 4
  br label %331

; <label>:331                                     ; preds = %319, %307, %296, %287
  br label %332

; <label>:332                                     ; preds = %331, %286
  br label %333

; <label>:333                                     ; preds = %332, %248
  %334 = load i32* %2, align 4
  %335 = add nsw i32 %334, 1
  %336 = sext i32 %335 to i64
  %337 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %336
  %338 = load i8* %337, align 1
  %339 = zext i8 %338 to i32
  %340 = icmp eq i32 %339, 0
  br i1 %340, label %341, label %344

; <label>:341                                     ; preds = %333
  %342 = load i32* %trivial_liberties, align 4
  %343 = add nsw i32 %342, 1
  store i32 %343, i32* %trivial_liberties, align 4
  br label %417

; <label>:344                                     ; preds = %333
  %345 = load i32* %2, align 4
  %346 = add nsw i32 %345, 1
  %347 = sext i32 %346 to i64
  %348 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %347
  %349 = load i8* %348, align 1
  %350 = zext i8 %349 to i32
  %351 = load i32* %3, align 4
  %352 = icmp eq i32 %350, %351
  br i1 %352, label %353, label %380

; <label>:353                                     ; preds = %344
  %354 = load i32* %2, align 4
  %355 = add nsw i32 %354, 1
  %356 = sext i32 %355 to i64
  %357 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %356
  %358 = load i32* %357, align 4
  %359 = sext i32 %358 to i64
  %360 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %359
  %361 = getelementptr inbounds %struct.string_data* %360, i32 0, i32 3
  %362 = load i32* %361, align 4
  %363 = icmp sgt i32 %362, 2
  br i1 %363, label %364, label %365

; <label>:364                                     ; preds = %353
  store i32 0, i32* %1
  br label %446

; <label>:365                                     ; preds = %353
  %366 = load i32* %2, align 4
  %367 = add nsw i32 %366, 1
  %368 = sext i32 %367 to i64
  %369 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %368
  %370 = load i32* %369, align 4
  %371 = sext i32 %370 to i64
  %372 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %371
  %373 = getelementptr inbounds %struct.string_data* %372, i32 0, i32 3
  %374 = load i32* %373, align 4
  %375 = icmp eq i32 %374, 2
  br i1 %375, label %376, label %379

; <label>:376                                     ; preds = %365
  %377 = load i32* %far_liberties, align 4
  %378 = add nsw i32 %377, 1
  store i32 %378, i32* %far_liberties, align 4
  br label %379

; <label>:379                                     ; preds = %376, %365
  br label %416

; <label>:380                                     ; preds = %344
  %381 = load i32* %2, align 4
  %382 = add nsw i32 %381, 1
  %383 = sext i32 %382 to i64
  %384 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %383
  %385 = load i8* %384, align 1
  %386 = zext i8 %385 to i32
  %387 = load i32* %other, align 4
  %388 = icmp eq i32 %386, %387
  br i1 %388, label %389, label %415

; <label>:389                                     ; preds = %380
  %390 = load i32* %2, align 4
  %391 = add nsw i32 %390, 1
  %392 = sext i32 %391 to i64
  %393 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %392
  %394 = load i32* %393, align 4
  %395 = sext i32 %394 to i64
  %396 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %395
  %397 = getelementptr inbounds %struct.string_data* %396, i32 0, i32 3
  %398 = load i32* %397, align 4
  %399 = icmp eq i32 %398, 1
  br i1 %399, label %400, label %415

; <label>:400                                     ; preds = %389
  %401 = load i32* %2, align 4
  %402 = add nsw i32 %401, 1
  %403 = sext i32 %402 to i64
  %404 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %403
  %405 = load i32* %404, align 4
  %406 = sext i32 %405 to i64
  %407 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %406
  %408 = getelementptr inbounds %struct.string_data* %407, i32 0, i32 7
  %409 = load i32* %408, align 4
  %410 = load i32* @string_mark, align 4
  %411 = icmp ne i32 %409, %410
  br i1 %411, label %412, label %415

; <label>:412                                     ; preds = %400
  %413 = load i32* %captures, align 4
  %414 = add nsw i32 %413, 1
  store i32 %414, i32* %captures, align 4
  br label %415

; <label>:415                                     ; preds = %412, %400, %389, %380
  br label %416

; <label>:416                                     ; preds = %415, %379
  br label %417

; <label>:417                                     ; preds = %416, %341
  %418 = load i32* %trivial_liberties, align 4
  %419 = load i32* %captures, align 4
  %420 = add nsw i32 %418, %419
  %421 = icmp sge i32 %420, 2
  br i1 %421, label %422, label %423

; <label>:422                                     ; preds = %417
  store i32 0, i32* %1
  br label %446

; <label>:423                                     ; preds = %417
  %424 = load i32* %far_liberties, align 4
  %425 = icmp sgt i32 %424, 0
  %426 = zext i1 %425 to i32
  %427 = load i32* %captures, align 4
  %428 = add nsw i32 %426, %427
  %429 = icmp sge i32 %428, 2
  br i1 %429, label %430, label %431

; <label>:430                                     ; preds = %423
  store i32 0, i32* %1
  br label %446

; <label>:431                                     ; preds = %423
  %432 = load i32* %captures, align 4
  %433 = icmp eq i32 %432, 0
  br i1 %433, label %434, label %440

; <label>:434                                     ; preds = %431
  %435 = load i32* %far_liberties, align 4
  %436 = load i32* %trivial_liberties, align 4
  %437 = add nsw i32 %435, %436
  %438 = icmp sle i32 %437, 1
  br i1 %438, label %439, label %440

; <label>:439                                     ; preds = %434
  store i32 1, i32* %1
  br label %446

; <label>:440                                     ; preds = %434, %431
  %441 = load i32* %2, align 4
  %442 = load i32* %3, align 4
  %443 = call i32 @accuratelib(i32 %441, i32 %442, i32 2, i32* null)
  %444 = icmp sle i32 %443, 1
  %445 = zext i1 %444 to i32
  store i32 %445, i32* %1
  br label %446

; <label>:446                                     ; preds = %440, %439, %430, %422, %364, %271, %178, %85
  %447 = load i32* %1
  ret i32 %447
}

; Function Attrs: nounwind uwtable
define i32 @liberty_of_string(i32 %pos, i32 %str) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %pos, i32* %2, align 4
  store i32 %str, i32* %3, align 4
  %4 = load i32* %2, align 4
  %5 = icmp ult i32 %4, 421
  br i1 %5, label %6, label %14

; <label>:6                                       ; preds = %0
  %7 = load i32* %2, align 4
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %8
  %10 = load i8* %9, align 1
  %11 = zext i8 %10 to i32
  %12 = icmp ne i32 %11, 3
  br i1 %12, label %13, label %14

; <label>:13                                      ; preds = %6
  br label %21

; <label>:14                                      ; preds = %6, %0
  %15 = load i32* %2, align 4
  %16 = sdiv i32 %15, 20
  %17 = sub nsw i32 %16, 1
  %18 = load i32* %2, align 4
  %19 = srem i32 %18, 20
  %20 = sub nsw i32 %19, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 2381, i8* getelementptr inbounds ([15 x i8]* @.str19, i32 0, i32 0), i32 %17, i32 %20)
  br label %21

; <label>:21                                      ; preds = %14, %13
  %22 = load i32* %3, align 4
  %23 = icmp ult i32 %22, 421
  br i1 %23, label %24, label %32

; <label>:24                                      ; preds = %21
  %25 = load i32* %3, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %26
  %28 = load i8* %27, align 1
  %29 = zext i8 %28 to i32
  %30 = icmp ne i32 %29, 3
  br i1 %30, label %31, label %32

; <label>:31                                      ; preds = %24
  br label %39

; <label>:32                                      ; preds = %24, %21
  %33 = load i32* %3, align 4
  %34 = sdiv i32 %33, 20
  %35 = sub nsw i32 %34, 1
  %36 = load i32* %3, align 4
  %37 = srem i32 %36, 20
  %38 = sub nsw i32 %37, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 2382, i8* getelementptr inbounds ([15 x i8]* @.str33, i32 0, i32 0), i32 %35, i32 %38)
  br label %39

; <label>:39                                      ; preds = %32, %31
  %40 = load i32* %2, align 4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %41
  %43 = load i8* %42, align 1
  %44 = zext i8 %43 to i32
  %45 = icmp eq i32 %44, 1
  br i1 %45, label %53, label %46

; <label>:46                                      ; preds = %39
  %47 = load i32* %2, align 4
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %48
  %50 = load i8* %49, align 1
  %51 = zext i8 %50 to i32
  %52 = icmp eq i32 %51, 2
  br i1 %52, label %53, label %54

; <label>:53                                      ; preds = %46, %39
  store i32 0, i32* %1
  br label %155

; <label>:54                                      ; preds = %46
  %55 = load i32* %2, align 4
  %56 = add nsw i32 %55, 20
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %57
  %59 = load i8* %58, align 1
  %60 = zext i8 %59 to i32
  %61 = load i32* %3, align 4
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %62
  %64 = load i8* %63, align 1
  %65 = zext i8 %64 to i32
  %66 = icmp eq i32 %60, %65
  br i1 %66, label %67, label %78

; <label>:67                                      ; preds = %54
  %68 = load i32* %2, align 4
  %69 = add nsw i32 %68, 20
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %70
  %72 = load i32* %71, align 4
  %73 = load i32* %3, align 4
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %74
  %76 = load i32* %75, align 4
  %77 = icmp eq i32 %72, %76
  br i1 %77, label %152, label %78

; <label>:78                                      ; preds = %67, %54
  %79 = load i32* %2, align 4
  %80 = sub nsw i32 %79, 1
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %81
  %83 = load i8* %82, align 1
  %84 = zext i8 %83 to i32
  %85 = load i32* %3, align 4
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %86
  %88 = load i8* %87, align 1
  %89 = zext i8 %88 to i32
  %90 = icmp eq i32 %84, %89
  br i1 %90, label %91, label %102

; <label>:91                                      ; preds = %78
  %92 = load i32* %2, align 4
  %93 = sub nsw i32 %92, 1
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %94
  %96 = load i32* %95, align 4
  %97 = load i32* %3, align 4
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %98
  %100 = load i32* %99, align 4
  %101 = icmp eq i32 %96, %100
  br i1 %101, label %152, label %102

; <label>:102                                     ; preds = %91, %78
  %103 = load i32* %2, align 4
  %104 = sub nsw i32 %103, 20
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %105
  %107 = load i8* %106, align 1
  %108 = zext i8 %107 to i32
  %109 = load i32* %3, align 4
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %110
  %112 = load i8* %111, align 1
  %113 = zext i8 %112 to i32
  %114 = icmp eq i32 %108, %113
  br i1 %114, label %115, label %126

; <label>:115                                     ; preds = %102
  %116 = load i32* %2, align 4
  %117 = sub nsw i32 %116, 20
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %118
  %120 = load i32* %119, align 4
  %121 = load i32* %3, align 4
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %122
  %124 = load i32* %123, align 4
  %125 = icmp eq i32 %120, %124
  br i1 %125, label %152, label %126

; <label>:126                                     ; preds = %115, %102
  %127 = load i32* %2, align 4
  %128 = add nsw i32 %127, 1
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %129
  %131 = load i8* %130, align 1
  %132 = zext i8 %131 to i32
  %133 = load i32* %3, align 4
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %134
  %136 = load i8* %135, align 1
  %137 = zext i8 %136 to i32
  %138 = icmp eq i32 %132, %137
  br i1 %138, label %139, label %150

; <label>:139                                     ; preds = %126
  %140 = load i32* %2, align 4
  %141 = add nsw i32 %140, 1
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %142
  %144 = load i32* %143, align 4
  %145 = load i32* %3, align 4
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %146
  %148 = load i32* %147, align 4
  %149 = icmp eq i32 %144, %148
  br label %150

; <label>:150                                     ; preds = %139, %126
  %151 = phi i1 [ false, %126 ], [ %149, %139 ]
  br label %152

; <label>:152                                     ; preds = %150, %115, %91, %67
  %153 = phi i1 [ true, %115 ], [ true, %91 ], [ true, %67 ], [ %151, %150 ]
  %154 = zext i1 %153 to i32
  store i32 %154, i32* %1
  br label %155

; <label>:155                                     ; preds = %152, %53
  %156 = load i32* %1
  ret i32 %156
}

; Function Attrs: nounwind uwtable
define i32 @second_order_liberty_of_string(i32 %pos, i32 %str) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 %pos, i32* %2, align 4
  store i32 %str, i32* %3, align 4
  %4 = load i32* %2, align 4
  %5 = icmp ult i32 %4, 421
  br i1 %5, label %6, label %14

; <label>:6                                       ; preds = %0
  %7 = load i32* %2, align 4
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %8
  %10 = load i8* %9, align 1
  %11 = zext i8 %10 to i32
  %12 = icmp ne i32 %11, 3
  br i1 %12, label %13, label %14

; <label>:13                                      ; preds = %6
  br label %21

; <label>:14                                      ; preds = %6, %0
  %15 = load i32* %2, align 4
  %16 = sdiv i32 %15, 20
  %17 = sub nsw i32 %16, 1
  %18 = load i32* %2, align 4
  %19 = srem i32 %18, 20
  %20 = sub nsw i32 %19, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 2397, i8* getelementptr inbounds ([15 x i8]* @.str19, i32 0, i32 0), i32 %17, i32 %20)
  br label %21

; <label>:21                                      ; preds = %14, %13
  %22 = load i32* %3, align 4
  %23 = icmp ult i32 %22, 421
  br i1 %23, label %24, label %32

; <label>:24                                      ; preds = %21
  %25 = load i32* %3, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %26
  %28 = load i8* %27, align 1
  %29 = zext i8 %28 to i32
  %30 = icmp ne i32 %29, 3
  br i1 %30, label %31, label %32

; <label>:31                                      ; preds = %24
  br label %39

; <label>:32                                      ; preds = %24, %21
  %33 = load i32* %3, align 4
  %34 = sdiv i32 %33, 20
  %35 = sub nsw i32 %34, 1
  %36 = load i32* %3, align 4
  %37 = srem i32 %36, 20
  %38 = sub nsw i32 %37, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 2398, i8* getelementptr inbounds ([15 x i8]* @.str33, i32 0, i32 0), i32 %35, i32 %38)
  br label %39

; <label>:39                                      ; preds = %32, %31
  store i32 0, i32* %k, align 4
  br label %40

; <label>:40                                      ; preds = %193, %39
  %41 = load i32* %k, align 4
  %42 = icmp slt i32 %41, 4
  br i1 %42, label %43, label %196

; <label>:43                                      ; preds = %40
  %44 = load i32* %2, align 4
  %45 = load i32* %k, align 4
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds [8 x i32]* @delta, i32 0, i64 %46
  %48 = load i32* %47, align 4
  %49 = add nsw i32 %44, %48
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %50
  %52 = load i8* %51, align 1
  %53 = zext i8 %52 to i32
  %54 = icmp eq i32 %53, 0
  br i1 %54, label %55, label %192

; <label>:55                                      ; preds = %43
  %56 = load i32* %2, align 4
  %57 = load i32* %k, align 4
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds [8 x i32]* @delta, i32 0, i64 %58
  %60 = load i32* %59, align 4
  %61 = add nsw i32 %56, %60
  %62 = add nsw i32 %61, 20
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %63
  %65 = load i8* %64, align 1
  %66 = zext i8 %65 to i32
  %67 = load i32* %3, align 4
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %68
  %70 = load i8* %69, align 1
  %71 = zext i8 %70 to i32
  %72 = icmp eq i32 %66, %71
  br i1 %72, label %73, label %89

; <label>:73                                      ; preds = %55
  %74 = load i32* %2, align 4
  %75 = load i32* %k, align 4
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds [8 x i32]* @delta, i32 0, i64 %76
  %78 = load i32* %77, align 4
  %79 = add nsw i32 %74, %78
  %80 = add nsw i32 %79, 20
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %81
  %83 = load i32* %82, align 4
  %84 = load i32* %3, align 4
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %85
  %87 = load i32* %86, align 4
  %88 = icmp eq i32 %83, %87
  br i1 %88, label %191, label %89

; <label>:89                                      ; preds = %73, %55
  %90 = load i32* %2, align 4
  %91 = load i32* %k, align 4
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds [8 x i32]* @delta, i32 0, i64 %92
  %94 = load i32* %93, align 4
  %95 = add nsw i32 %90, %94
  %96 = sub nsw i32 %95, 1
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %97
  %99 = load i8* %98, align 1
  %100 = zext i8 %99 to i32
  %101 = load i32* %3, align 4
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %102
  %104 = load i8* %103, align 1
  %105 = zext i8 %104 to i32
  %106 = icmp eq i32 %100, %105
  br i1 %106, label %107, label %123

; <label>:107                                     ; preds = %89
  %108 = load i32* %2, align 4
  %109 = load i32* %k, align 4
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds [8 x i32]* @delta, i32 0, i64 %110
  %112 = load i32* %111, align 4
  %113 = add nsw i32 %108, %112
  %114 = sub nsw i32 %113, 1
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %115
  %117 = load i32* %116, align 4
  %118 = load i32* %3, align 4
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %119
  %121 = load i32* %120, align 4
  %122 = icmp eq i32 %117, %121
  br i1 %122, label %191, label %123

; <label>:123                                     ; preds = %107, %89
  %124 = load i32* %2, align 4
  %125 = load i32* %k, align 4
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds [8 x i32]* @delta, i32 0, i64 %126
  %128 = load i32* %127, align 4
  %129 = add nsw i32 %124, %128
  %130 = sub nsw i32 %129, 20
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %131
  %133 = load i8* %132, align 1
  %134 = zext i8 %133 to i32
  %135 = load i32* %3, align 4
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %136
  %138 = load i8* %137, align 1
  %139 = zext i8 %138 to i32
  %140 = icmp eq i32 %134, %139
  br i1 %140, label %141, label %157

; <label>:141                                     ; preds = %123
  %142 = load i32* %2, align 4
  %143 = load i32* %k, align 4
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds [8 x i32]* @delta, i32 0, i64 %144
  %146 = load i32* %145, align 4
  %147 = add nsw i32 %142, %146
  %148 = sub nsw i32 %147, 20
  %149 = sext i32 %148 to i64
  %150 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %149
  %151 = load i32* %150, align 4
  %152 = load i32* %3, align 4
  %153 = sext i32 %152 to i64
  %154 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %153
  %155 = load i32* %154, align 4
  %156 = icmp eq i32 %151, %155
  br i1 %156, label %191, label %157

; <label>:157                                     ; preds = %141, %123
  %158 = load i32* %2, align 4
  %159 = load i32* %k, align 4
  %160 = sext i32 %159 to i64
  %161 = getelementptr inbounds [8 x i32]* @delta, i32 0, i64 %160
  %162 = load i32* %161, align 4
  %163 = add nsw i32 %158, %162
  %164 = add nsw i32 %163, 1
  %165 = sext i32 %164 to i64
  %166 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %165
  %167 = load i8* %166, align 1
  %168 = zext i8 %167 to i32
  %169 = load i32* %3, align 4
  %170 = sext i32 %169 to i64
  %171 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %170
  %172 = load i8* %171, align 1
  %173 = zext i8 %172 to i32
  %174 = icmp eq i32 %168, %173
  br i1 %174, label %175, label %192

; <label>:175                                     ; preds = %157
  %176 = load i32* %2, align 4
  %177 = load i32* %k, align 4
  %178 = sext i32 %177 to i64
  %179 = getelementptr inbounds [8 x i32]* @delta, i32 0, i64 %178
  %180 = load i32* %179, align 4
  %181 = add nsw i32 %176, %180
  %182 = add nsw i32 %181, 1
  %183 = sext i32 %182 to i64
  %184 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %183
  %185 = load i32* %184, align 4
  %186 = load i32* %3, align 4
  %187 = sext i32 %186 to i64
  %188 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %187
  %189 = load i32* %188, align 4
  %190 = icmp eq i32 %185, %189
  br i1 %190, label %191, label %192

; <label>:191                                     ; preds = %175, %141, %107, %73
  store i32 1, i32* %1
  br label %197

; <label>:192                                     ; preds = %175, %157, %43
  br label %193

; <label>:193                                     ; preds = %192
  %194 = load i32* %k, align 4
  %195 = add nsw i32 %194, 1
  store i32 %195, i32* %k, align 4
  br label %40

; <label>:196                                     ; preds = %40
  store i32 0, i32* %1
  br label %197

; <label>:197                                     ; preds = %196, %191
  %198 = load i32* %1
  ret i32 %198
}

; Function Attrs: nounwind uwtable
define i32 @neighbor_of_string(i32 %pos, i32 %str) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %color = alloca i32, align 4
  store i32 %pos, i32* %1, align 4
  store i32 %str, i32* %2, align 4
  %3 = load i32* %2, align 4
  %4 = sext i32 %3 to i64
  %5 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %4
  %6 = load i8* %5, align 1
  %7 = zext i8 %6 to i32
  store i32 %7, i32* %color, align 4
  %8 = load i32* %color, align 4
  %9 = icmp eq i32 %8, 1
  br i1 %9, label %13, label %10

; <label>:10                                      ; preds = %0
  %11 = load i32* %color, align 4
  %12 = icmp eq i32 %11, 2
  br i1 %12, label %13, label %14

; <label>:13                                      ; preds = %10, %0
  br label %21

; <label>:14                                      ; preds = %10
  %15 = load i32* %2, align 4
  %16 = sdiv i32 %15, 20
  %17 = sub nsw i32 %16, 1
  %18 = load i32* %2, align 4
  %19 = srem i32 %18, 20
  %20 = sub nsw i32 %19, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 2418, i8* getelementptr inbounds ([16 x i8]* @.str28, i32 0, i32 0), i32 %17, i32 %20)
  br label %21

; <label>:21                                      ; preds = %14, %13
  %22 = load i32* %1, align 4
  %23 = icmp ult i32 %22, 421
  br i1 %23, label %24, label %32

; <label>:24                                      ; preds = %21
  %25 = load i32* %1, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %26
  %28 = load i8* %27, align 1
  %29 = zext i8 %28 to i32
  %30 = icmp ne i32 %29, 3
  br i1 %30, label %31, label %32

; <label>:31                                      ; preds = %24
  br label %39

; <label>:32                                      ; preds = %24, %21
  %33 = load i32* %1, align 4
  %34 = sdiv i32 %33, 20
  %35 = sub nsw i32 %34, 1
  %36 = load i32* %1, align 4
  %37 = srem i32 %36, 20
  %38 = sub nsw i32 %37, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 2419, i8* getelementptr inbounds ([15 x i8]* @.str19, i32 0, i32 0), i32 %35, i32 %38)
  br label %39

; <label>:39                                      ; preds = %32, %31
  %40 = load i32* %1, align 4
  %41 = add nsw i32 %40, 20
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %42
  %44 = load i8* %43, align 1
  %45 = zext i8 %44 to i32
  %46 = load i32* %color, align 4
  %47 = icmp eq i32 %45, %46
  br i1 %47, label %48, label %59

; <label>:48                                      ; preds = %39
  %49 = load i32* %1, align 4
  %50 = add nsw i32 %49, 20
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %51
  %53 = load i32* %52, align 4
  %54 = load i32* %2, align 4
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %55
  %57 = load i32* %56, align 4
  %58 = icmp eq i32 %53, %57
  br i1 %58, label %121, label %59

; <label>:59                                      ; preds = %48, %39
  %60 = load i32* %1, align 4
  %61 = sub nsw i32 %60, 1
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %62
  %64 = load i8* %63, align 1
  %65 = zext i8 %64 to i32
  %66 = load i32* %color, align 4
  %67 = icmp eq i32 %65, %66
  br i1 %67, label %68, label %79

; <label>:68                                      ; preds = %59
  %69 = load i32* %1, align 4
  %70 = sub nsw i32 %69, 1
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %71
  %73 = load i32* %72, align 4
  %74 = load i32* %2, align 4
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %75
  %77 = load i32* %76, align 4
  %78 = icmp eq i32 %73, %77
  br i1 %78, label %121, label %79

; <label>:79                                      ; preds = %68, %59
  %80 = load i32* %1, align 4
  %81 = sub nsw i32 %80, 20
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %82
  %84 = load i8* %83, align 1
  %85 = zext i8 %84 to i32
  %86 = load i32* %color, align 4
  %87 = icmp eq i32 %85, %86
  br i1 %87, label %88, label %99

; <label>:88                                      ; preds = %79
  %89 = load i32* %1, align 4
  %90 = sub nsw i32 %89, 20
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %91
  %93 = load i32* %92, align 4
  %94 = load i32* %2, align 4
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %95
  %97 = load i32* %96, align 4
  %98 = icmp eq i32 %93, %97
  br i1 %98, label %121, label %99

; <label>:99                                      ; preds = %88, %79
  %100 = load i32* %1, align 4
  %101 = add nsw i32 %100, 1
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %102
  %104 = load i8* %103, align 1
  %105 = zext i8 %104 to i32
  %106 = load i32* %color, align 4
  %107 = icmp eq i32 %105, %106
  br i1 %107, label %108, label %119

; <label>:108                                     ; preds = %99
  %109 = load i32* %1, align 4
  %110 = add nsw i32 %109, 1
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %111
  %113 = load i32* %112, align 4
  %114 = load i32* %2, align 4
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %115
  %117 = load i32* %116, align 4
  %118 = icmp eq i32 %113, %117
  br label %119

; <label>:119                                     ; preds = %108, %99
  %120 = phi i1 [ false, %99 ], [ %118, %108 ]
  br label %121

; <label>:121                                     ; preds = %119, %88, %68, %48
  %122 = phi i1 [ true, %88 ], [ true, %68 ], [ true, %48 ], [ %120, %119 ]
  %123 = zext i1 %122 to i32
  ret i32 %123
}

; Function Attrs: nounwind uwtable
define i32 @has_neighbor(i32 %pos, i32 %color) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %pos, i32* %1, align 4
  store i32 %color, i32* %2, align 4
  %3 = load i32* %1, align 4
  %4 = icmp ult i32 %3, 421
  br i1 %4, label %5, label %13

; <label>:5                                       ; preds = %0
  %6 = load i32* %1, align 4
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %7
  %9 = load i8* %8, align 1
  %10 = zext i8 %9 to i32
  %11 = icmp ne i32 %10, 3
  br i1 %11, label %12, label %13

; <label>:12                                      ; preds = %5
  br label %20

; <label>:13                                      ; preds = %5, %0
  %14 = load i32* %1, align 4
  %15 = sdiv i32 %14, 20
  %16 = sub nsw i32 %15, 1
  %17 = load i32* %1, align 4
  %18 = srem i32 %17, 20
  %19 = sub nsw i32 %18, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 2431, i8* getelementptr inbounds ([15 x i8]* @.str19, i32 0, i32 0), i32 %16, i32 %19)
  br label %20

; <label>:20                                      ; preds = %13, %12
  %21 = load i32* %2, align 4
  %22 = icmp eq i32 %21, 1
  br i1 %22, label %26, label %23

; <label>:23                                      ; preds = %20
  %24 = load i32* %2, align 4
  %25 = icmp eq i32 %24, 2
  br i1 %25, label %26, label %27

; <label>:26                                      ; preds = %23, %20
  br label %34

; <label>:27                                      ; preds = %23
  %28 = load i32* %1, align 4
  %29 = sdiv i32 %28, 20
  %30 = sub nsw i32 %29, 1
  %31 = load i32* %1, align 4
  %32 = srem i32 %31, 20
  %33 = sub nsw i32 %32, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 2432, i8* getelementptr inbounds ([16 x i8]* @.str28, i32 0, i32 0), i32 %30, i32 %33)
  br label %34

; <label>:34                                      ; preds = %27, %26
  %35 = load i32* %1, align 4
  %36 = add nsw i32 %35, 20
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %37
  %39 = load i8* %38, align 1
  %40 = zext i8 %39 to i32
  %41 = load i32* %2, align 4
  %42 = icmp eq i32 %40, %41
  br i1 %42, label %70, label %43

; <label>:43                                      ; preds = %34
  %44 = load i32* %1, align 4
  %45 = sub nsw i32 %44, 1
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %46
  %48 = load i8* %47, align 1
  %49 = zext i8 %48 to i32
  %50 = load i32* %2, align 4
  %51 = icmp eq i32 %49, %50
  br i1 %51, label %70, label %52

; <label>:52                                      ; preds = %43
  %53 = load i32* %1, align 4
  %54 = sub nsw i32 %53, 20
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %55
  %57 = load i8* %56, align 1
  %58 = zext i8 %57 to i32
  %59 = load i32* %2, align 4
  %60 = icmp eq i32 %58, %59
  br i1 %60, label %70, label %61

; <label>:61                                      ; preds = %52
  %62 = load i32* %1, align 4
  %63 = add nsw i32 %62, 1
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %64
  %66 = load i8* %65, align 1
  %67 = zext i8 %66 to i32
  %68 = load i32* %2, align 4
  %69 = icmp eq i32 %67, %68
  br label %70

; <label>:70                                      ; preds = %61, %52, %43, %34
  %71 = phi i1 [ true, %52 ], [ true, %43 ], [ true, %34 ], [ %69, %61 ]
  %72 = zext i1 %71 to i32
  ret i32 %72
}

; Function Attrs: nounwind uwtable
define i32 @same_string(i32 %str1, i32 %str2) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %str1, i32* %1, align 4
  store i32 %str2, i32* %2, align 4
  %3 = load i32* %1, align 4
  %4 = icmp ult i32 %3, 421
  br i1 %4, label %5, label %13

; <label>:5                                       ; preds = %0
  %6 = load i32* %1, align 4
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %7
  %9 = load i8* %8, align 1
  %10 = zext i8 %9 to i32
  %11 = icmp ne i32 %10, 3
  br i1 %11, label %12, label %13

; <label>:12                                      ; preds = %5
  br label %20

; <label>:13                                      ; preds = %5, %0
  %14 = load i32* %1, align 4
  %15 = sdiv i32 %14, 20
  %16 = sub nsw i32 %15, 1
  %17 = load i32* %1, align 4
  %18 = srem i32 %17, 20
  %19 = sub nsw i32 %18, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 2447, i8* getelementptr inbounds ([16 x i8]* @.str29, i32 0, i32 0), i32 %16, i32 %19)
  br label %20

; <label>:20                                      ; preds = %13, %12
  %21 = load i32* %2, align 4
  %22 = icmp ult i32 %21, 421
  br i1 %22, label %23, label %31

; <label>:23                                      ; preds = %20
  %24 = load i32* %2, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %25
  %27 = load i8* %26, align 1
  %28 = zext i8 %27 to i32
  %29 = icmp ne i32 %28, 3
  br i1 %29, label %30, label %31

; <label>:30                                      ; preds = %23
  br label %38

; <label>:31                                      ; preds = %23, %20
  %32 = load i32* %2, align 4
  %33 = sdiv i32 %32, 20
  %34 = sub nsw i32 %33, 1
  %35 = load i32* %2, align 4
  %36 = srem i32 %35, 20
  %37 = sub nsw i32 %36, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 2448, i8* getelementptr inbounds ([16 x i8]* @.str30, i32 0, i32 0), i32 %34, i32 %37)
  br label %38

; <label>:38                                      ; preds = %31, %30
  %39 = load i32* %1, align 4
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %40
  %42 = load i8* %41, align 1
  %43 = zext i8 %42 to i32
  %44 = icmp eq i32 %43, 1
  br i1 %44, label %52, label %45

; <label>:45                                      ; preds = %38
  %46 = load i32* %1, align 4
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %47
  %49 = load i8* %48, align 1
  %50 = zext i8 %49 to i32
  %51 = icmp eq i32 %50, 2
  br i1 %51, label %52, label %53

; <label>:52                                      ; preds = %45, %38
  br label %60

; <label>:53                                      ; preds = %45
  %54 = load i32* %1, align 4
  %55 = sdiv i32 %54, 20
  %56 = sub nsw i32 %55, 1
  %57 = load i32* %1, align 4
  %58 = srem i32 %57, 20
  %59 = sub nsw i32 %58, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 2449, i8* getelementptr inbounds ([22 x i8]* @.str31, i32 0, i32 0), i32 %56, i32 %59)
  br label %60

; <label>:60                                      ; preds = %53, %52
  %61 = load i32* %2, align 4
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %62
  %64 = load i8* %63, align 1
  %65 = zext i8 %64 to i32
  %66 = icmp eq i32 %65, 1
  br i1 %66, label %74, label %67

; <label>:67                                      ; preds = %60
  %68 = load i32* %2, align 4
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %69
  %71 = load i8* %70, align 1
  %72 = zext i8 %71 to i32
  %73 = icmp eq i32 %72, 2
  br i1 %73, label %74, label %75

; <label>:74                                      ; preds = %67, %60
  br label %82

; <label>:75                                      ; preds = %67
  %76 = load i32* %2, align 4
  %77 = sdiv i32 %76, 20
  %78 = sub nsw i32 %77, 1
  %79 = load i32* %2, align 4
  %80 = srem i32 %79, 20
  %81 = sub nsw i32 %80, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 2450, i8* getelementptr inbounds ([22 x i8]* @.str32, i32 0, i32 0), i32 %78, i32 %81)
  br label %82

; <label>:82                                      ; preds = %75, %74
  %83 = load i32* %1, align 4
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %84
  %86 = load i32* %85, align 4
  %87 = load i32* %2, align 4
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %88
  %90 = load i32* %89, align 4
  %91 = icmp eq i32 %86, %90
  %92 = zext i1 %91 to i32
  ret i32 %92
}

; Function Attrs: nounwind uwtable
define i32 @adjacent_strings(i32 %str1, i32 %str2) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %s1 = alloca i32, align 4
  %s2 = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 %str1, i32* %2, align 4
  store i32 %str2, i32* %3, align 4
  %4 = load i32* %2, align 4
  %5 = icmp ult i32 %4, 421
  br i1 %5, label %6, label %14

; <label>:6                                       ; preds = %0
  %7 = load i32* %2, align 4
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %8
  %10 = load i8* %9, align 1
  %11 = zext i8 %10 to i32
  %12 = icmp ne i32 %11, 3
  br i1 %12, label %13, label %14

; <label>:13                                      ; preds = %6
  br label %21

; <label>:14                                      ; preds = %6, %0
  %15 = load i32* %2, align 4
  %16 = sdiv i32 %15, 20
  %17 = sub nsw i32 %16, 1
  %18 = load i32* %2, align 4
  %19 = srem i32 %18, 20
  %20 = sub nsw i32 %19, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 2466, i8* getelementptr inbounds ([16 x i8]* @.str29, i32 0, i32 0), i32 %17, i32 %20)
  br label %21

; <label>:21                                      ; preds = %14, %13
  %22 = load i32* %3, align 4
  %23 = icmp ult i32 %22, 421
  br i1 %23, label %24, label %32

; <label>:24                                      ; preds = %21
  %25 = load i32* %3, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %26
  %28 = load i8* %27, align 1
  %29 = zext i8 %28 to i32
  %30 = icmp ne i32 %29, 3
  br i1 %30, label %31, label %32

; <label>:31                                      ; preds = %24
  br label %39

; <label>:32                                      ; preds = %24, %21
  %33 = load i32* %3, align 4
  %34 = sdiv i32 %33, 20
  %35 = sub nsw i32 %34, 1
  %36 = load i32* %3, align 4
  %37 = srem i32 %36, 20
  %38 = sub nsw i32 %37, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 2467, i8* getelementptr inbounds ([16 x i8]* @.str30, i32 0, i32 0), i32 %35, i32 %38)
  br label %39

; <label>:39                                      ; preds = %32, %31
  %40 = load i32* %2, align 4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %41
  %43 = load i8* %42, align 1
  %44 = zext i8 %43 to i32
  %45 = icmp eq i32 %44, 1
  br i1 %45, label %53, label %46

; <label>:46                                      ; preds = %39
  %47 = load i32* %2, align 4
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %48
  %50 = load i8* %49, align 1
  %51 = zext i8 %50 to i32
  %52 = icmp eq i32 %51, 2
  br i1 %52, label %53, label %54

; <label>:53                                      ; preds = %46, %39
  br label %61

; <label>:54                                      ; preds = %46
  %55 = load i32* %2, align 4
  %56 = sdiv i32 %55, 20
  %57 = sub nsw i32 %56, 1
  %58 = load i32* %2, align 4
  %59 = srem i32 %58, 20
  %60 = sub nsw i32 %59, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 2468, i8* getelementptr inbounds ([22 x i8]* @.str31, i32 0, i32 0), i32 %57, i32 %60)
  br label %61

; <label>:61                                      ; preds = %54, %53
  %62 = load i32* %3, align 4
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %63
  %65 = load i8* %64, align 1
  %66 = zext i8 %65 to i32
  %67 = icmp eq i32 %66, 1
  br i1 %67, label %75, label %68

; <label>:68                                      ; preds = %61
  %69 = load i32* %3, align 4
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %70
  %72 = load i8* %71, align 1
  %73 = zext i8 %72 to i32
  %74 = icmp eq i32 %73, 2
  br i1 %74, label %75, label %76

; <label>:75                                      ; preds = %68, %61
  br label %83

; <label>:76                                      ; preds = %68
  %77 = load i32* %3, align 4
  %78 = sdiv i32 %77, 20
  %79 = sub nsw i32 %78, 1
  %80 = load i32* %3, align 4
  %81 = srem i32 %80, 20
  %82 = sub nsw i32 %81, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 2469, i8* getelementptr inbounds ([22 x i8]* @.str32, i32 0, i32 0), i32 %79, i32 %82)
  br label %83

; <label>:83                                      ; preds = %76, %75
  %84 = load i32* %2, align 4
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %85
  %87 = load i32* %86, align 4
  store i32 %87, i32* %s1, align 4
  %88 = load i32* %3, align 4
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %89
  %91 = load i32* %90, align 4
  store i32 %91, i32* %s2, align 4
  store i32 0, i32* %k, align 4
  br label %92

; <label>:92                                      ; preds = %113, %83
  %93 = load i32* %k, align 4
  %94 = load i32* %s1, align 4
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %95
  %97 = getelementptr inbounds %struct.string_data* %96, i32 0, i32 5
  %98 = load i32* %97, align 4
  %99 = icmp slt i32 %93, %98
  br i1 %99, label %100, label %116

; <label>:100                                     ; preds = %92
  %101 = load i32* %k, align 4
  %102 = sext i32 %101 to i64
  %103 = load i32* %s1, align 4
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %104
  %106 = getelementptr inbounds %struct.string_data* %105, i32 0, i32 6
  %107 = getelementptr inbounds [160 x i32]* %106, i32 0, i64 %102
  %108 = load i32* %107, align 4
  %109 = load i32* %s2, align 4
  %110 = icmp eq i32 %108, %109
  br i1 %110, label %111, label %112

; <label>:111                                     ; preds = %100
  store i32 1, i32* %1
  br label %117

; <label>:112                                     ; preds = %100
  br label %113

; <label>:113                                     ; preds = %112
  %114 = load i32* %k, align 4
  %115 = add nsw i32 %114, 1
  store i32 %115, i32* %k, align 4
  br label %92

; <label>:116                                     ; preds = %92
  store i32 0, i32* %1
  br label %117

; <label>:117                                     ; preds = %116, %111
  %118 = load i32* %1
  ret i32 %118
}

; Function Attrs: nounwind uwtable
define i32 @is_ko_point(i32 %pos) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %color = alloca i32, align 4
  %s = alloca %struct.string_data*, align 8
  store i32 %pos, i32* %2, align 4
  %3 = load i32* %2, align 4
  %4 = icmp ult i32 %3, 421
  br i1 %4, label %5, label %13

; <label>:5                                       ; preds = %0
  %6 = load i32* %2, align 4
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %7
  %9 = load i8* %8, align 1
  %10 = zext i8 %9 to i32
  %11 = icmp ne i32 %10, 3
  br i1 %11, label %12, label %13

; <label>:12                                      ; preds = %5
  br label %20

; <label>:13                                      ; preds = %5, %0
  %14 = load i32* %2, align 4
  %15 = sdiv i32 %14, 20
  %16 = sub nsw i32 %15, 1
  %17 = load i32* %2, align 4
  %18 = srem i32 %17, 20
  %19 = sub nsw i32 %18, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 2563, i8* getelementptr inbounds ([15 x i8]* @.str19, i32 0, i32 0), i32 %16, i32 %19)
  br label %20

; <label>:20                                      ; preds = %13, %12
  %21 = load i32* %2, align 4
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %22
  %24 = load i8* %23, align 1
  %25 = zext i8 %24 to i32
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %27, label %63

; <label>:27                                      ; preds = %20
  %28 = load i32* %2, align 4
  %29 = add nsw i32 %28, 20
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %30
  %32 = load i8* %31, align 1
  %33 = zext i8 %32 to i32
  %34 = icmp ne i32 %33, 3
  br i1 %34, label %35, label %42

; <label>:35                                      ; preds = %27
  %36 = load i32* %2, align 4
  %37 = add nsw i32 %36, 20
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %38
  %40 = load i8* %39, align 1
  %41 = zext i8 %40 to i32
  store i32 %41, i32* %color, align 4
  br label %49

; <label>:42                                      ; preds = %27
  %43 = load i32* %2, align 4
  %44 = sub nsw i32 %43, 20
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %45
  %47 = load i8* %46, align 1
  %48 = zext i8 %47 to i32
  store i32 %48, i32* %color, align 4
  br label %49

; <label>:49                                      ; preds = %42, %35
  %50 = load i32* %color, align 4
  %51 = icmp eq i32 %50, 1
  br i1 %51, label %55, label %52

; <label>:52                                      ; preds = %49
  %53 = load i32* %color, align 4
  %54 = icmp eq i32 %53, 2
  br i1 %54, label %55, label %62

; <label>:55                                      ; preds = %52, %49
  %56 = load i32* %2, align 4
  %57 = load i32* %color, align 4
  %58 = sub nsw i32 3, %57
  %59 = call i32 @is_ko(i32 %56, i32 %58, i32* null)
  %60 = icmp ne i32 %59, 0
  br i1 %60, label %61, label %62

; <label>:61                                      ; preds = %55
  store i32 1, i32* %1
  br label %93

; <label>:62                                      ; preds = %55, %52
  br label %92

; <label>:63                                      ; preds = %20
  %64 = load i32* %2, align 4
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %65
  %67 = load i32* %66, align 4
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %68
  store %struct.string_data* %69, %struct.string_data** %s, align 8
  %70 = load %struct.string_data** %s, align 8
  %71 = getelementptr inbounds %struct.string_data* %70, i32 0, i32 3
  %72 = load i32* %71, align 4
  %73 = icmp eq i32 %72, 1
  br i1 %73, label %74, label %91

; <label>:74                                      ; preds = %63
  %75 = load %struct.string_data** %s, align 8
  %76 = getelementptr inbounds %struct.string_data* %75, i32 0, i32 1
  %77 = load i32* %76, align 4
  %78 = icmp eq i32 %77, 1
  br i1 %78, label %79, label %91

; <label>:79                                      ; preds = %74
  %80 = load %struct.string_data** %s, align 8
  %81 = getelementptr inbounds %struct.string_data* %80, i32 0, i32 4
  %82 = getelementptr inbounds [20 x i32]* %81, i32 0, i64 0
  %83 = load i32* %82, align 4
  %84 = load %struct.string_data** %s, align 8
  %85 = getelementptr inbounds %struct.string_data* %84, i32 0, i32 0
  %86 = load i32* %85, align 4
  %87 = sub nsw i32 3, %86
  %88 = call i32 @is_ko(i32 %83, i32 %87, i32* null)
  %89 = icmp ne i32 %88, 0
  br i1 %89, label %90, label %91

; <label>:90                                      ; preds = %79
  store i32 1, i32* %1
  br label %93

; <label>:91                                      ; preds = %79, %74, %63
  br label %92

; <label>:92                                      ; preds = %91, %62
  store i32 0, i32* %1
  br label %93

; <label>:93                                      ; preds = %92, %90, %61
  %94 = load i32* %1
  ret i32 %94
}

; Function Attrs: nounwind uwtable
define i32 @does_capture_something(i32 %pos, i32 %color) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %other = alloca i32, align 4
  store i32 %pos, i32* %2, align 4
  store i32 %color, i32* %3, align 4
  %4 = load i32* %3, align 4
  %5 = sub nsw i32 3, %4
  store i32 %5, i32* %other, align 4
  %6 = load i32* %2, align 4
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %7
  %9 = load i8* %8, align 1
  %10 = zext i8 %9 to i32
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %13

; <label>:12                                      ; preds = %0
  br label %20

; <label>:13                                      ; preds = %0
  %14 = load i32* %2, align 4
  %15 = sdiv i32 %14, 20
  %16 = sub nsw i32 %15, 1
  %17 = load i32* %2, align 4
  %18 = srem i32 %17, 20
  %19 = sub nsw i32 %18, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 2592, i8* getelementptr inbounds ([20 x i8]* @.str20, i32 0, i32 0), i32 %16, i32 %19)
  br label %20

; <label>:20                                      ; preds = %13, %12
  %21 = load i32* %2, align 4
  %22 = add nsw i32 %21, 20
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %23
  %25 = load i8* %24, align 1
  %26 = zext i8 %25 to i32
  %27 = load i32* %other, align 4
  %28 = icmp eq i32 %26, %27
  br i1 %28, label %29, label %41

; <label>:29                                      ; preds = %20
  %30 = load i32* %2, align 4
  %31 = add nsw i32 %30, 20
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %32
  %34 = load i32* %33, align 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %35
  %37 = getelementptr inbounds %struct.string_data* %36, i32 0, i32 3
  %38 = load i32* %37, align 4
  %39 = icmp eq i32 %38, 1
  br i1 %39, label %40, label %41

; <label>:40                                      ; preds = %29
  store i32 1, i32* %1
  br label %105

; <label>:41                                      ; preds = %29, %20
  %42 = load i32* %2, align 4
  %43 = sub nsw i32 %42, 1
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %44
  %46 = load i8* %45, align 1
  %47 = zext i8 %46 to i32
  %48 = load i32* %other, align 4
  %49 = icmp eq i32 %47, %48
  br i1 %49, label %50, label %62

; <label>:50                                      ; preds = %41
  %51 = load i32* %2, align 4
  %52 = sub nsw i32 %51, 1
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %53
  %55 = load i32* %54, align 4
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %56
  %58 = getelementptr inbounds %struct.string_data* %57, i32 0, i32 3
  %59 = load i32* %58, align 4
  %60 = icmp eq i32 %59, 1
  br i1 %60, label %61, label %62

; <label>:61                                      ; preds = %50
  store i32 1, i32* %1
  br label %105

; <label>:62                                      ; preds = %50, %41
  %63 = load i32* %2, align 4
  %64 = sub nsw i32 %63, 20
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %65
  %67 = load i8* %66, align 1
  %68 = zext i8 %67 to i32
  %69 = load i32* %other, align 4
  %70 = icmp eq i32 %68, %69
  br i1 %70, label %71, label %83

; <label>:71                                      ; preds = %62
  %72 = load i32* %2, align 4
  %73 = sub nsw i32 %72, 20
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %74
  %76 = load i32* %75, align 4
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %77
  %79 = getelementptr inbounds %struct.string_data* %78, i32 0, i32 3
  %80 = load i32* %79, align 4
  %81 = icmp eq i32 %80, 1
  br i1 %81, label %82, label %83

; <label>:82                                      ; preds = %71
  store i32 1, i32* %1
  br label %105

; <label>:83                                      ; preds = %71, %62
  %84 = load i32* %2, align 4
  %85 = add nsw i32 %84, 1
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %86
  %88 = load i8* %87, align 1
  %89 = zext i8 %88 to i32
  %90 = load i32* %other, align 4
  %91 = icmp eq i32 %89, %90
  br i1 %91, label %92, label %104

; <label>:92                                      ; preds = %83
  %93 = load i32* %2, align 4
  %94 = add nsw i32 %93, 1
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %95
  %97 = load i32* %96, align 4
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %98
  %100 = getelementptr inbounds %struct.string_data* %99, i32 0, i32 3
  %101 = load i32* %100, align 4
  %102 = icmp eq i32 %101, 1
  br i1 %102, label %103, label %104

; <label>:103                                     ; preds = %92
  store i32 1, i32* %1
  br label %105

; <label>:104                                     ; preds = %92, %83
  store i32 0, i32* %1
  br label %105

; <label>:105                                     ; preds = %104, %103, %82, %61, %40
  %106 = load i32* %1
  ret i32 %106
}

; Function Attrs: nounwind uwtable
define void @mark_string(i32 %str, i8* %mx, i8 signext %mark) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i8*, align 8
  %3 = alloca i8, align 1
  %pos = alloca i32, align 4
  store i32 %str, i32* %1, align 4
  store i8* %mx, i8** %2, align 8
  store i8 %mark, i8* %3, align 1
  %4 = load i32* %1, align 4
  store i32 %4, i32* %pos, align 4
  %5 = load i32* %1, align 4
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %6
  %8 = load i8* %7, align 1
  %9 = zext i8 %8 to i32
  %10 = icmp eq i32 %9, 1
  br i1 %10, label %18, label %11

; <label>:11                                      ; preds = %0
  %12 = load i32* %1, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %13
  %15 = load i8* %14, align 1
  %16 = zext i8 %15 to i32
  %17 = icmp eq i32 %16, 2
  br i1 %17, label %18, label %19

; <label>:18                                      ; preds = %11, %0
  br label %26

; <label>:19                                      ; preds = %11
  %20 = load i32* %1, align 4
  %21 = sdiv i32 %20, 20
  %22 = sub nsw i32 %21, 1
  %23 = load i32* %1, align 4
  %24 = srem i32 %23, 20
  %25 = sub nsw i32 %24, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 2621, i8* getelementptr inbounds ([21 x i8]* @.str26, i32 0, i32 0), i32 %22, i32 %25)
  br label %26

; <label>:26                                      ; preds = %19, %18
  br label %27

; <label>:27                                      ; preds = %37, %26
  %28 = load i8* %3, align 1
  %29 = load i32* %pos, align 4
  %30 = sext i32 %29 to i64
  %31 = load i8** %2, align 8
  %32 = getelementptr inbounds i8* %31, i64 %30
  store i8 %28, i8* %32, align 1
  %33 = load i32* %pos, align 4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds [400 x i32]* @next_stone, i32 0, i64 %34
  %36 = load i32* %35, align 4
  store i32 %36, i32* %pos, align 4
  br label %37

; <label>:37                                      ; preds = %27
  %38 = load i32* %pos, align 4
  %39 = load i32* %1, align 4
  %40 = icmp ne i32 %38, %39
  br i1 %40, label %27, label %41

; <label>:41                                      ; preds = %37
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @move_in_stack(i32 %pos, i32 %cutoff) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 %pos, i32* %2, align 4
  store i32 %cutoff, i32* %3, align 4
  %4 = load i32* %3, align 4
  store i32 %4, i32* %k, align 4
  br label %5

; <label>:5                                       ; preds = %18, %0
  %6 = load i32* %k, align 4
  %7 = load i32* @stackp, align 4
  %8 = icmp slt i32 %6, %7
  br i1 %8, label %9, label %21

; <label>:9                                       ; preds = %5
  %10 = load i32* %k, align 4
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds [361 x i32]* @stack, i32 0, i64 %11
  %13 = load i32* %12, align 4
  %14 = load i32* %2, align 4
  %15 = icmp eq i32 %13, %14
  br i1 %15, label %16, label %17

; <label>:16                                      ; preds = %9
  store i32 1, i32* %1
  br label %22

; <label>:17                                      ; preds = %9
  br label %18

; <label>:18                                      ; preds = %17
  %19 = load i32* %k, align 4
  %20 = add nsw i32 %19, 1
  store i32 %20, i32* %k, align 4
  br label %5

; <label>:21                                      ; preds = %5
  store i32 0, i32* %1
  br label %22

; <label>:22                                      ; preds = %21, %16
  %23 = load i32* %1
  ret i32 %23
}

; Function Attrs: nounwind uwtable
define void @get_move_from_stack(i32 %k, i32* %move, i32* %color) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32*, align 8
  %3 = alloca i32*, align 8
  store i32 %k, i32* %1, align 4
  store i32* %move, i32** %2, align 8
  store i32* %color, i32** %3, align 8
  %4 = load i32* %1, align 4
  %5 = load i32* @stackp, align 4
  %6 = icmp slt i32 %4, %5
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %0
  br label %9

; <label>:8                                       ; preds = %0
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 2649, i8* getelementptr inbounds ([11 x i8]* @.str34, i32 0, i32 0), i32 -1, i32 -1)
  br label %9

; <label>:9                                       ; preds = %8, %7
  %10 = load i32* %1, align 4
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds [361 x i32]* @stack, i32 0, i64 %11
  %13 = load i32* %12, align 4
  %14 = load i32** %2, align 8
  store i32 %13, i32* %14, align 4
  %15 = load i32* %1, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [361 x i32]* @move_color, i32 0, i64 %16
  %18 = load i32* %17, align 4
  %19 = load i32** %3, align 8
  store i32 %18, i32* %19, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @stones_on_board(i32 %color) #0 {
  %1 = alloca i32, align 4
  %pos = alloca i32, align 4
  store i32 %color, i32* %1, align 4
  %2 = load i32* @stackp, align 4
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  br label %6

; <label>:5                                       ; preds = %0
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 2666, i8* getelementptr inbounds ([12 x i8]* @.str1, i32 0, i32 0), i32 -1, i32 -1)
  br label %6

; <label>:6                                       ; preds = %5, %4
  %7 = load i32* @stones_on_board.stone_count_for_position, align 4
  %8 = load i32* @position_number, align 4
  %9 = icmp ne i32 %7, %8
  br i1 %9, label %10, label %41

; <label>:10                                      ; preds = %6
  store i32 0, i32* @stones_on_board.white_stones, align 4
  store i32 0, i32* @stones_on_board.black_stones, align 4
  store i32 21, i32* %pos, align 4
  br label %11

; <label>:11                                      ; preds = %36, %10
  %12 = load i32* %pos, align 4
  %13 = icmp slt i32 %12, 400
  br i1 %13, label %14, label %39

; <label>:14                                      ; preds = %11
  %15 = load i32* %pos, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %16
  %18 = load i8* %17, align 1
  %19 = zext i8 %18 to i32
  %20 = icmp eq i32 %19, 1
  br i1 %20, label %21, label %24

; <label>:21                                      ; preds = %14
  %22 = load i32* @stones_on_board.white_stones, align 4
  %23 = add nsw i32 %22, 1
  store i32 %23, i32* @stones_on_board.white_stones, align 4
  br label %35

; <label>:24                                      ; preds = %14
  %25 = load i32* %pos, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %26
  %28 = load i8* %27, align 1
  %29 = zext i8 %28 to i32
  %30 = icmp eq i32 %29, 2
  br i1 %30, label %31, label %34

; <label>:31                                      ; preds = %24
  %32 = load i32* @stones_on_board.black_stones, align 4
  %33 = add nsw i32 %32, 1
  store i32 %33, i32* @stones_on_board.black_stones, align 4
  br label %34

; <label>:34                                      ; preds = %31, %24
  br label %35

; <label>:35                                      ; preds = %34, %21
  br label %36

; <label>:36                                      ; preds = %35
  %37 = load i32* %pos, align 4
  %38 = add nsw i32 %37, 1
  store i32 %38, i32* %pos, align 4
  br label %11

; <label>:39                                      ; preds = %11
  %40 = load i32* @position_number, align 4
  store i32 %40, i32* @stones_on_board.stone_count_for_position, align 4
  br label %41

; <label>:41                                      ; preds = %39, %6
  %42 = load i32* %1, align 4
  %43 = and i32 %42, 2
  %44 = icmp ne i32 %43, 0
  br i1 %44, label %45, label %47

; <label>:45                                      ; preds = %41
  %46 = load i32* @stones_on_board.black_stones, align 4
  br label %48

; <label>:47                                      ; preds = %41
  br label %48

; <label>:48                                      ; preds = %47, %45
  %49 = phi i32 [ %46, %45 ], [ 0, %47 ]
  %50 = load i32* %1, align 4
  %51 = and i32 %50, 1
  %52 = icmp ne i32 %51, 0
  br i1 %52, label %53, label %55

; <label>:53                                      ; preds = %48
  %54 = load i32* @stones_on_board.white_stones, align 4
  br label %56

; <label>:55                                      ; preds = %48
  br label %56

; <label>:56                                      ; preds = %55, %53
  %57 = phi i32 [ %54, %53 ], [ 0, %55 ]
  %58 = add nsw i32 %49, %57
  ret i32 %58
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
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32*, align 8
  %5 = alloca i32*, align 8
  %6 = alloca i32*, align 8
  %7 = alloca i32*, align 8
  %8 = alloca i32*, align 8
  %9 = alloca i32*, align 8
  %10 = alloca i32*, align 8
  %11 = alloca i32*, align 8
  %s = alloca i32, align 4
  %r = alloca i32, align 4
  %t = alloca %struct.string_data*, align 8
  %s1 = alloca i32, align 4
  %r2 = alloca i32, align 4
  %t3 = alloca %struct.string_data*, align 8
  %s4 = alloca i32, align 4
  %r5 = alloca i32, align 4
  %t6 = alloca %struct.string_data*, align 8
  %s7 = alloca i32, align 4
  %r8 = alloca i32, align 4
  %t9 = alloca %struct.string_data*, align 8
  store i32 %move, i32* %1, align 4
  store i32 %color, i32* %2, align 4
  store i32 %str, i32* %3, align 4
  store i32* %number_edges, i32** %4, align 8
  store i32* %number_same_string, i32** %5, align 8
  store i32* %number_own, i32** %6, align 8
  store i32* %number_opponent, i32** %7, align 8
  store i32* %captured_stones, i32** %8, align 8
  store i32* %threatened_stones, i32** %9, align 8
  store i32* %saved_stones, i32** %10, align 8
  store i32* %number_open, i32** %11, align 8
  %12 = load i32* @string_mark, align 4
  %13 = add nsw i32 %12, 1
  store i32 %13, i32* @string_mark, align 4
  %14 = load i32* %1, align 4
  %15 = add nsw i32 %14, 20
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %16
  %18 = load i8* %17, align 1
  %19 = zext i8 %18 to i32
  %20 = icmp ne i32 %19, 3
  br i1 %20, label %25, label %21

; <label>:21                                      ; preds = %0
  %22 = load i32** %4, align 8
  %23 = load i32* %22, align 4
  %24 = add nsw i32 %23, 1
  store i32 %24, i32* %22, align 4
  br label %177

; <label>:25                                      ; preds = %0
  %26 = load i32* %1, align 4
  %27 = add nsw i32 %26, 20
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %28
  %30 = load i8* %29, align 1
  %31 = zext i8 %30 to i32
  %32 = icmp eq i32 %31, 0
  br i1 %32, label %33, label %37

; <label>:33                                      ; preds = %25
  %34 = load i32** %11, align 8
  %35 = load i32* %34, align 4
  %36 = add nsw i32 %35, 1
  store i32 %36, i32* %34, align 4
  br label %176

; <label>:37                                      ; preds = %25
  %38 = load i32* %1, align 4
  %39 = add nsw i32 %38, 20
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %40
  %42 = load i32* %41, align 4
  store i32 %42, i32* %s, align 4
  %43 = load i32* %3, align 4
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %44
  %46 = load i32* %45, align 4
  %47 = load i32* %s, align 4
  %48 = icmp eq i32 %46, %47
  br i1 %48, label %49, label %53

; <label>:49                                      ; preds = %37
  %50 = load i32** %5, align 8
  %51 = load i32* %50, align 4
  %52 = add nsw i32 %51, 1
  store i32 %52, i32* %50, align 4
  br label %53

; <label>:53                                      ; preds = %49, %37
  %54 = load i32* %1, align 4
  %55 = add nsw i32 %54, 20
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %56
  %58 = load i8* %57, align 1
  %59 = zext i8 %58 to i32
  %60 = load i32* %2, align 4
  %61 = icmp eq i32 %59, %60
  br i1 %61, label %62, label %82

; <label>:62                                      ; preds = %53
  %63 = load i32** %6, align 8
  %64 = load i32* %63, align 4
  %65 = add nsw i32 %64, 1
  store i32 %65, i32* %63, align 4
  %66 = load i32* %s, align 4
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %67
  %69 = getelementptr inbounds %struct.string_data* %68, i32 0, i32 3
  %70 = load i32* %69, align 4
  %71 = icmp eq i32 %70, 1
  br i1 %71, label %72, label %81

; <label>:72                                      ; preds = %62
  %73 = load i32* %s, align 4
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %74
  %76 = getelementptr inbounds %struct.string_data* %75, i32 0, i32 1
  %77 = load i32* %76, align 4
  %78 = load i32** %10, align 8
  %79 = load i32* %78, align 4
  %80 = add nsw i32 %79, %77
  store i32 %80, i32* %78, align 4
  br label %81

; <label>:81                                      ; preds = %72, %62
  br label %175

; <label>:82                                      ; preds = %53
  %83 = load i32** %7, align 8
  %84 = load i32* %83, align 4
  %85 = add nsw i32 %84, 1
  store i32 %85, i32* %83, align 4
  %86 = load i32* %s, align 4
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %87
  %89 = getelementptr inbounds %struct.string_data* %88, i32 0, i32 3
  %90 = load i32* %89, align 4
  %91 = icmp eq i32 %90, 1
  br i1 %91, label %92, label %136

; <label>:92                                      ; preds = %82
  %93 = load i32* %s, align 4
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %94
  %96 = getelementptr inbounds %struct.string_data* %95, i32 0, i32 1
  %97 = load i32* %96, align 4
  %98 = load i32** %8, align 8
  %99 = load i32* %98, align 4
  %100 = add nsw i32 %99, %97
  store i32 %100, i32* %98, align 4
  store i32 0, i32* %r, align 4
  br label %101

; <label>:101                                     ; preds = %132, %92
  %102 = load i32* %r, align 4
  %103 = load i32* %s, align 4
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %104
  %106 = getelementptr inbounds %struct.string_data* %105, i32 0, i32 5
  %107 = load i32* %106, align 4
  %108 = icmp slt i32 %102, %107
  br i1 %108, label %109, label %135

; <label>:109                                     ; preds = %101
  %110 = load i32* %r, align 4
  %111 = sext i32 %110 to i64
  %112 = load i32* %s, align 4
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %113
  %115 = getelementptr inbounds %struct.string_data* %114, i32 0, i32 6
  %116 = getelementptr inbounds [160 x i32]* %115, i32 0, i64 %111
  %117 = load i32* %116, align 4
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %118
  store %struct.string_data* %119, %struct.string_data** %t, align 8
  %120 = load %struct.string_data** %t, align 8
  %121 = getelementptr inbounds %struct.string_data* %120, i32 0, i32 3
  %122 = load i32* %121, align 4
  %123 = icmp eq i32 %122, 1
  br i1 %123, label %124, label %131

; <label>:124                                     ; preds = %109
  %125 = load %struct.string_data** %t, align 8
  %126 = getelementptr inbounds %struct.string_data* %125, i32 0, i32 1
  %127 = load i32* %126, align 4
  %128 = load i32** %10, align 8
  %129 = load i32* %128, align 4
  %130 = add nsw i32 %129, %127
  store i32 %130, i32* %128, align 4
  br label %131

; <label>:131                                     ; preds = %124, %109
  br label %132

; <label>:132                                     ; preds = %131
  %133 = load i32* %r, align 4
  %134 = add nsw i32 %133, 1
  store i32 %134, i32* %r, align 4
  br label %101

; <label>:135                                     ; preds = %101
  br label %174

; <label>:136                                     ; preds = %82
  %137 = load i32* %s, align 4
  %138 = sext i32 %137 to i64
  %139 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %138
  %140 = getelementptr inbounds %struct.string_data* %139, i32 0, i32 3
  %141 = load i32* %140, align 4
  %142 = icmp eq i32 %141, 2
  br i1 %142, label %143, label %173

; <label>:143                                     ; preds = %136
  %144 = load i32* %1, align 4
  %145 = add nsw i32 %144, 20
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %146
  %148 = load i32* %147, align 4
  %149 = sext i32 %148 to i64
  %150 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %149
  %151 = getelementptr inbounds %struct.string_data* %150, i32 0, i32 7
  %152 = load i32* %151, align 4
  %153 = load i32* @string_mark, align 4
  %154 = icmp ne i32 %152, %153
  br i1 %154, label %155, label %173

; <label>:155                                     ; preds = %143
  %156 = load i32* %s, align 4
  %157 = sext i32 %156 to i64
  %158 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %157
  %159 = getelementptr inbounds %struct.string_data* %158, i32 0, i32 1
  %160 = load i32* %159, align 4
  %161 = load i32** %9, align 8
  %162 = load i32* %161, align 4
  %163 = add nsw i32 %162, %160
  store i32 %163, i32* %161, align 4
  %164 = load i32* @string_mark, align 4
  %165 = load i32* %1, align 4
  %166 = add nsw i32 %165, 20
  %167 = sext i32 %166 to i64
  %168 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %167
  %169 = load i32* %168, align 4
  %170 = sext i32 %169 to i64
  %171 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %170
  %172 = getelementptr inbounds %struct.string_data* %171, i32 0, i32 7
  store i32 %164, i32* %172, align 4
  br label %173

; <label>:173                                     ; preds = %155, %143, %136
  br label %174

; <label>:174                                     ; preds = %173, %135
  br label %175

; <label>:175                                     ; preds = %174, %81
  br label %176

; <label>:176                                     ; preds = %175, %33
  br label %177

; <label>:177                                     ; preds = %176, %21
  %178 = load i32* %1, align 4
  %179 = sub nsw i32 %178, 1
  %180 = sext i32 %179 to i64
  %181 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %180
  %182 = load i8* %181, align 1
  %183 = zext i8 %182 to i32
  %184 = icmp ne i32 %183, 3
  br i1 %184, label %189, label %185

; <label>:185                                     ; preds = %177
  %186 = load i32** %4, align 8
  %187 = load i32* %186, align 4
  %188 = add nsw i32 %187, 1
  store i32 %188, i32* %186, align 4
  br label %341

; <label>:189                                     ; preds = %177
  %190 = load i32* %1, align 4
  %191 = sub nsw i32 %190, 1
  %192 = sext i32 %191 to i64
  %193 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %192
  %194 = load i8* %193, align 1
  %195 = zext i8 %194 to i32
  %196 = icmp eq i32 %195, 0
  br i1 %196, label %197, label %201

; <label>:197                                     ; preds = %189
  %198 = load i32** %11, align 8
  %199 = load i32* %198, align 4
  %200 = add nsw i32 %199, 1
  store i32 %200, i32* %198, align 4
  br label %340

; <label>:201                                     ; preds = %189
  %202 = load i32* %1, align 4
  %203 = sub nsw i32 %202, 1
  %204 = sext i32 %203 to i64
  %205 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %204
  %206 = load i32* %205, align 4
  store i32 %206, i32* %s1, align 4
  %207 = load i32* %3, align 4
  %208 = sext i32 %207 to i64
  %209 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %208
  %210 = load i32* %209, align 4
  %211 = load i32* %s1, align 4
  %212 = icmp eq i32 %210, %211
  br i1 %212, label %213, label %217

; <label>:213                                     ; preds = %201
  %214 = load i32** %5, align 8
  %215 = load i32* %214, align 4
  %216 = add nsw i32 %215, 1
  store i32 %216, i32* %214, align 4
  br label %217

; <label>:217                                     ; preds = %213, %201
  %218 = load i32* %1, align 4
  %219 = sub nsw i32 %218, 1
  %220 = sext i32 %219 to i64
  %221 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %220
  %222 = load i8* %221, align 1
  %223 = zext i8 %222 to i32
  %224 = load i32* %2, align 4
  %225 = icmp eq i32 %223, %224
  br i1 %225, label %226, label %246

; <label>:226                                     ; preds = %217
  %227 = load i32** %6, align 8
  %228 = load i32* %227, align 4
  %229 = add nsw i32 %228, 1
  store i32 %229, i32* %227, align 4
  %230 = load i32* %s1, align 4
  %231 = sext i32 %230 to i64
  %232 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %231
  %233 = getelementptr inbounds %struct.string_data* %232, i32 0, i32 3
  %234 = load i32* %233, align 4
  %235 = icmp eq i32 %234, 1
  br i1 %235, label %236, label %245

; <label>:236                                     ; preds = %226
  %237 = load i32* %s1, align 4
  %238 = sext i32 %237 to i64
  %239 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %238
  %240 = getelementptr inbounds %struct.string_data* %239, i32 0, i32 1
  %241 = load i32* %240, align 4
  %242 = load i32** %10, align 8
  %243 = load i32* %242, align 4
  %244 = add nsw i32 %243, %241
  store i32 %244, i32* %242, align 4
  br label %245

; <label>:245                                     ; preds = %236, %226
  br label %339

; <label>:246                                     ; preds = %217
  %247 = load i32** %7, align 8
  %248 = load i32* %247, align 4
  %249 = add nsw i32 %248, 1
  store i32 %249, i32* %247, align 4
  %250 = load i32* %s1, align 4
  %251 = sext i32 %250 to i64
  %252 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %251
  %253 = getelementptr inbounds %struct.string_data* %252, i32 0, i32 3
  %254 = load i32* %253, align 4
  %255 = icmp eq i32 %254, 1
  br i1 %255, label %256, label %300

; <label>:256                                     ; preds = %246
  %257 = load i32* %s1, align 4
  %258 = sext i32 %257 to i64
  %259 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %258
  %260 = getelementptr inbounds %struct.string_data* %259, i32 0, i32 1
  %261 = load i32* %260, align 4
  %262 = load i32** %8, align 8
  %263 = load i32* %262, align 4
  %264 = add nsw i32 %263, %261
  store i32 %264, i32* %262, align 4
  store i32 0, i32* %r2, align 4
  br label %265

; <label>:265                                     ; preds = %296, %256
  %266 = load i32* %r2, align 4
  %267 = load i32* %s1, align 4
  %268 = sext i32 %267 to i64
  %269 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %268
  %270 = getelementptr inbounds %struct.string_data* %269, i32 0, i32 5
  %271 = load i32* %270, align 4
  %272 = icmp slt i32 %266, %271
  br i1 %272, label %273, label %299

; <label>:273                                     ; preds = %265
  %274 = load i32* %r2, align 4
  %275 = sext i32 %274 to i64
  %276 = load i32* %s1, align 4
  %277 = sext i32 %276 to i64
  %278 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %277
  %279 = getelementptr inbounds %struct.string_data* %278, i32 0, i32 6
  %280 = getelementptr inbounds [160 x i32]* %279, i32 0, i64 %275
  %281 = load i32* %280, align 4
  %282 = sext i32 %281 to i64
  %283 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %282
  store %struct.string_data* %283, %struct.string_data** %t3, align 8
  %284 = load %struct.string_data** %t3, align 8
  %285 = getelementptr inbounds %struct.string_data* %284, i32 0, i32 3
  %286 = load i32* %285, align 4
  %287 = icmp eq i32 %286, 1
  br i1 %287, label %288, label %295

; <label>:288                                     ; preds = %273
  %289 = load %struct.string_data** %t3, align 8
  %290 = getelementptr inbounds %struct.string_data* %289, i32 0, i32 1
  %291 = load i32* %290, align 4
  %292 = load i32** %10, align 8
  %293 = load i32* %292, align 4
  %294 = add nsw i32 %293, %291
  store i32 %294, i32* %292, align 4
  br label %295

; <label>:295                                     ; preds = %288, %273
  br label %296

; <label>:296                                     ; preds = %295
  %297 = load i32* %r2, align 4
  %298 = add nsw i32 %297, 1
  store i32 %298, i32* %r2, align 4
  br label %265

; <label>:299                                     ; preds = %265
  br label %338

; <label>:300                                     ; preds = %246
  %301 = load i32* %s1, align 4
  %302 = sext i32 %301 to i64
  %303 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %302
  %304 = getelementptr inbounds %struct.string_data* %303, i32 0, i32 3
  %305 = load i32* %304, align 4
  %306 = icmp eq i32 %305, 2
  br i1 %306, label %307, label %337

; <label>:307                                     ; preds = %300
  %308 = load i32* %1, align 4
  %309 = sub nsw i32 %308, 1
  %310 = sext i32 %309 to i64
  %311 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %310
  %312 = load i32* %311, align 4
  %313 = sext i32 %312 to i64
  %314 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %313
  %315 = getelementptr inbounds %struct.string_data* %314, i32 0, i32 7
  %316 = load i32* %315, align 4
  %317 = load i32* @string_mark, align 4
  %318 = icmp ne i32 %316, %317
  br i1 %318, label %319, label %337

; <label>:319                                     ; preds = %307
  %320 = load i32* %s1, align 4
  %321 = sext i32 %320 to i64
  %322 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %321
  %323 = getelementptr inbounds %struct.string_data* %322, i32 0, i32 1
  %324 = load i32* %323, align 4
  %325 = load i32** %9, align 8
  %326 = load i32* %325, align 4
  %327 = add nsw i32 %326, %324
  store i32 %327, i32* %325, align 4
  %328 = load i32* @string_mark, align 4
  %329 = load i32* %1, align 4
  %330 = sub nsw i32 %329, 1
  %331 = sext i32 %330 to i64
  %332 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %331
  %333 = load i32* %332, align 4
  %334 = sext i32 %333 to i64
  %335 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %334
  %336 = getelementptr inbounds %struct.string_data* %335, i32 0, i32 7
  store i32 %328, i32* %336, align 4
  br label %337

; <label>:337                                     ; preds = %319, %307, %300
  br label %338

; <label>:338                                     ; preds = %337, %299
  br label %339

; <label>:339                                     ; preds = %338, %245
  br label %340

; <label>:340                                     ; preds = %339, %197
  br label %341

; <label>:341                                     ; preds = %340, %185
  %342 = load i32* %1, align 4
  %343 = sub nsw i32 %342, 20
  %344 = sext i32 %343 to i64
  %345 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %344
  %346 = load i8* %345, align 1
  %347 = zext i8 %346 to i32
  %348 = icmp ne i32 %347, 3
  br i1 %348, label %353, label %349

; <label>:349                                     ; preds = %341
  %350 = load i32** %4, align 8
  %351 = load i32* %350, align 4
  %352 = add nsw i32 %351, 1
  store i32 %352, i32* %350, align 4
  br label %505

; <label>:353                                     ; preds = %341
  %354 = load i32* %1, align 4
  %355 = sub nsw i32 %354, 20
  %356 = sext i32 %355 to i64
  %357 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %356
  %358 = load i8* %357, align 1
  %359 = zext i8 %358 to i32
  %360 = icmp eq i32 %359, 0
  br i1 %360, label %361, label %365

; <label>:361                                     ; preds = %353
  %362 = load i32** %11, align 8
  %363 = load i32* %362, align 4
  %364 = add nsw i32 %363, 1
  store i32 %364, i32* %362, align 4
  br label %504

; <label>:365                                     ; preds = %353
  %366 = load i32* %1, align 4
  %367 = sub nsw i32 %366, 20
  %368 = sext i32 %367 to i64
  %369 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %368
  %370 = load i32* %369, align 4
  store i32 %370, i32* %s4, align 4
  %371 = load i32* %3, align 4
  %372 = sext i32 %371 to i64
  %373 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %372
  %374 = load i32* %373, align 4
  %375 = load i32* %s4, align 4
  %376 = icmp eq i32 %374, %375
  br i1 %376, label %377, label %381

; <label>:377                                     ; preds = %365
  %378 = load i32** %5, align 8
  %379 = load i32* %378, align 4
  %380 = add nsw i32 %379, 1
  store i32 %380, i32* %378, align 4
  br label %381

; <label>:381                                     ; preds = %377, %365
  %382 = load i32* %1, align 4
  %383 = sub nsw i32 %382, 20
  %384 = sext i32 %383 to i64
  %385 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %384
  %386 = load i8* %385, align 1
  %387 = zext i8 %386 to i32
  %388 = load i32* %2, align 4
  %389 = icmp eq i32 %387, %388
  br i1 %389, label %390, label %410

; <label>:390                                     ; preds = %381
  %391 = load i32** %6, align 8
  %392 = load i32* %391, align 4
  %393 = add nsw i32 %392, 1
  store i32 %393, i32* %391, align 4
  %394 = load i32* %s4, align 4
  %395 = sext i32 %394 to i64
  %396 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %395
  %397 = getelementptr inbounds %struct.string_data* %396, i32 0, i32 3
  %398 = load i32* %397, align 4
  %399 = icmp eq i32 %398, 1
  br i1 %399, label %400, label %409

; <label>:400                                     ; preds = %390
  %401 = load i32* %s4, align 4
  %402 = sext i32 %401 to i64
  %403 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %402
  %404 = getelementptr inbounds %struct.string_data* %403, i32 0, i32 1
  %405 = load i32* %404, align 4
  %406 = load i32** %10, align 8
  %407 = load i32* %406, align 4
  %408 = add nsw i32 %407, %405
  store i32 %408, i32* %406, align 4
  br label %409

; <label>:409                                     ; preds = %400, %390
  br label %503

; <label>:410                                     ; preds = %381
  %411 = load i32** %7, align 8
  %412 = load i32* %411, align 4
  %413 = add nsw i32 %412, 1
  store i32 %413, i32* %411, align 4
  %414 = load i32* %s4, align 4
  %415 = sext i32 %414 to i64
  %416 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %415
  %417 = getelementptr inbounds %struct.string_data* %416, i32 0, i32 3
  %418 = load i32* %417, align 4
  %419 = icmp eq i32 %418, 1
  br i1 %419, label %420, label %464

; <label>:420                                     ; preds = %410
  %421 = load i32* %s4, align 4
  %422 = sext i32 %421 to i64
  %423 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %422
  %424 = getelementptr inbounds %struct.string_data* %423, i32 0, i32 1
  %425 = load i32* %424, align 4
  %426 = load i32** %8, align 8
  %427 = load i32* %426, align 4
  %428 = add nsw i32 %427, %425
  store i32 %428, i32* %426, align 4
  store i32 0, i32* %r5, align 4
  br label %429

; <label>:429                                     ; preds = %460, %420
  %430 = load i32* %r5, align 4
  %431 = load i32* %s4, align 4
  %432 = sext i32 %431 to i64
  %433 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %432
  %434 = getelementptr inbounds %struct.string_data* %433, i32 0, i32 5
  %435 = load i32* %434, align 4
  %436 = icmp slt i32 %430, %435
  br i1 %436, label %437, label %463

; <label>:437                                     ; preds = %429
  %438 = load i32* %r5, align 4
  %439 = sext i32 %438 to i64
  %440 = load i32* %s4, align 4
  %441 = sext i32 %440 to i64
  %442 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %441
  %443 = getelementptr inbounds %struct.string_data* %442, i32 0, i32 6
  %444 = getelementptr inbounds [160 x i32]* %443, i32 0, i64 %439
  %445 = load i32* %444, align 4
  %446 = sext i32 %445 to i64
  %447 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %446
  store %struct.string_data* %447, %struct.string_data** %t6, align 8
  %448 = load %struct.string_data** %t6, align 8
  %449 = getelementptr inbounds %struct.string_data* %448, i32 0, i32 3
  %450 = load i32* %449, align 4
  %451 = icmp eq i32 %450, 1
  br i1 %451, label %452, label %459

; <label>:452                                     ; preds = %437
  %453 = load %struct.string_data** %t6, align 8
  %454 = getelementptr inbounds %struct.string_data* %453, i32 0, i32 1
  %455 = load i32* %454, align 4
  %456 = load i32** %10, align 8
  %457 = load i32* %456, align 4
  %458 = add nsw i32 %457, %455
  store i32 %458, i32* %456, align 4
  br label %459

; <label>:459                                     ; preds = %452, %437
  br label %460

; <label>:460                                     ; preds = %459
  %461 = load i32* %r5, align 4
  %462 = add nsw i32 %461, 1
  store i32 %462, i32* %r5, align 4
  br label %429

; <label>:463                                     ; preds = %429
  br label %502

; <label>:464                                     ; preds = %410
  %465 = load i32* %s4, align 4
  %466 = sext i32 %465 to i64
  %467 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %466
  %468 = getelementptr inbounds %struct.string_data* %467, i32 0, i32 3
  %469 = load i32* %468, align 4
  %470 = icmp eq i32 %469, 2
  br i1 %470, label %471, label %501

; <label>:471                                     ; preds = %464
  %472 = load i32* %1, align 4
  %473 = sub nsw i32 %472, 20
  %474 = sext i32 %473 to i64
  %475 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %474
  %476 = load i32* %475, align 4
  %477 = sext i32 %476 to i64
  %478 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %477
  %479 = getelementptr inbounds %struct.string_data* %478, i32 0, i32 7
  %480 = load i32* %479, align 4
  %481 = load i32* @string_mark, align 4
  %482 = icmp ne i32 %480, %481
  br i1 %482, label %483, label %501

; <label>:483                                     ; preds = %471
  %484 = load i32* %s4, align 4
  %485 = sext i32 %484 to i64
  %486 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %485
  %487 = getelementptr inbounds %struct.string_data* %486, i32 0, i32 1
  %488 = load i32* %487, align 4
  %489 = load i32** %9, align 8
  %490 = load i32* %489, align 4
  %491 = add nsw i32 %490, %488
  store i32 %491, i32* %489, align 4
  %492 = load i32* @string_mark, align 4
  %493 = load i32* %1, align 4
  %494 = sub nsw i32 %493, 20
  %495 = sext i32 %494 to i64
  %496 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %495
  %497 = load i32* %496, align 4
  %498 = sext i32 %497 to i64
  %499 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %498
  %500 = getelementptr inbounds %struct.string_data* %499, i32 0, i32 7
  store i32 %492, i32* %500, align 4
  br label %501

; <label>:501                                     ; preds = %483, %471, %464
  br label %502

; <label>:502                                     ; preds = %501, %463
  br label %503

; <label>:503                                     ; preds = %502, %409
  br label %504

; <label>:504                                     ; preds = %503, %361
  br label %505

; <label>:505                                     ; preds = %504, %349
  %506 = load i32* %1, align 4
  %507 = add nsw i32 %506, 1
  %508 = sext i32 %507 to i64
  %509 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %508
  %510 = load i8* %509, align 1
  %511 = zext i8 %510 to i32
  %512 = icmp ne i32 %511, 3
  br i1 %512, label %517, label %513

; <label>:513                                     ; preds = %505
  %514 = load i32** %4, align 8
  %515 = load i32* %514, align 4
  %516 = add nsw i32 %515, 1
  store i32 %516, i32* %514, align 4
  br label %669

; <label>:517                                     ; preds = %505
  %518 = load i32* %1, align 4
  %519 = add nsw i32 %518, 1
  %520 = sext i32 %519 to i64
  %521 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %520
  %522 = load i8* %521, align 1
  %523 = zext i8 %522 to i32
  %524 = icmp eq i32 %523, 0
  br i1 %524, label %525, label %529

; <label>:525                                     ; preds = %517
  %526 = load i32** %11, align 8
  %527 = load i32* %526, align 4
  %528 = add nsw i32 %527, 1
  store i32 %528, i32* %526, align 4
  br label %668

; <label>:529                                     ; preds = %517
  %530 = load i32* %1, align 4
  %531 = add nsw i32 %530, 1
  %532 = sext i32 %531 to i64
  %533 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %532
  %534 = load i32* %533, align 4
  store i32 %534, i32* %s7, align 4
  %535 = load i32* %3, align 4
  %536 = sext i32 %535 to i64
  %537 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %536
  %538 = load i32* %537, align 4
  %539 = load i32* %s7, align 4
  %540 = icmp eq i32 %538, %539
  br i1 %540, label %541, label %545

; <label>:541                                     ; preds = %529
  %542 = load i32** %5, align 8
  %543 = load i32* %542, align 4
  %544 = add nsw i32 %543, 1
  store i32 %544, i32* %542, align 4
  br label %545

; <label>:545                                     ; preds = %541, %529
  %546 = load i32* %1, align 4
  %547 = add nsw i32 %546, 1
  %548 = sext i32 %547 to i64
  %549 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %548
  %550 = load i8* %549, align 1
  %551 = zext i8 %550 to i32
  %552 = load i32* %2, align 4
  %553 = icmp eq i32 %551, %552
  br i1 %553, label %554, label %574

; <label>:554                                     ; preds = %545
  %555 = load i32** %6, align 8
  %556 = load i32* %555, align 4
  %557 = add nsw i32 %556, 1
  store i32 %557, i32* %555, align 4
  %558 = load i32* %s7, align 4
  %559 = sext i32 %558 to i64
  %560 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %559
  %561 = getelementptr inbounds %struct.string_data* %560, i32 0, i32 3
  %562 = load i32* %561, align 4
  %563 = icmp eq i32 %562, 1
  br i1 %563, label %564, label %573

; <label>:564                                     ; preds = %554
  %565 = load i32* %s7, align 4
  %566 = sext i32 %565 to i64
  %567 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %566
  %568 = getelementptr inbounds %struct.string_data* %567, i32 0, i32 1
  %569 = load i32* %568, align 4
  %570 = load i32** %10, align 8
  %571 = load i32* %570, align 4
  %572 = add nsw i32 %571, %569
  store i32 %572, i32* %570, align 4
  br label %573

; <label>:573                                     ; preds = %564, %554
  br label %667

; <label>:574                                     ; preds = %545
  %575 = load i32** %7, align 8
  %576 = load i32* %575, align 4
  %577 = add nsw i32 %576, 1
  store i32 %577, i32* %575, align 4
  %578 = load i32* %s7, align 4
  %579 = sext i32 %578 to i64
  %580 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %579
  %581 = getelementptr inbounds %struct.string_data* %580, i32 0, i32 3
  %582 = load i32* %581, align 4
  %583 = icmp eq i32 %582, 1
  br i1 %583, label %584, label %628

; <label>:584                                     ; preds = %574
  %585 = load i32* %s7, align 4
  %586 = sext i32 %585 to i64
  %587 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %586
  %588 = getelementptr inbounds %struct.string_data* %587, i32 0, i32 1
  %589 = load i32* %588, align 4
  %590 = load i32** %8, align 8
  %591 = load i32* %590, align 4
  %592 = add nsw i32 %591, %589
  store i32 %592, i32* %590, align 4
  store i32 0, i32* %r8, align 4
  br label %593

; <label>:593                                     ; preds = %624, %584
  %594 = load i32* %r8, align 4
  %595 = load i32* %s7, align 4
  %596 = sext i32 %595 to i64
  %597 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %596
  %598 = getelementptr inbounds %struct.string_data* %597, i32 0, i32 5
  %599 = load i32* %598, align 4
  %600 = icmp slt i32 %594, %599
  br i1 %600, label %601, label %627

; <label>:601                                     ; preds = %593
  %602 = load i32* %r8, align 4
  %603 = sext i32 %602 to i64
  %604 = load i32* %s7, align 4
  %605 = sext i32 %604 to i64
  %606 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %605
  %607 = getelementptr inbounds %struct.string_data* %606, i32 0, i32 6
  %608 = getelementptr inbounds [160 x i32]* %607, i32 0, i64 %603
  %609 = load i32* %608, align 4
  %610 = sext i32 %609 to i64
  %611 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %610
  store %struct.string_data* %611, %struct.string_data** %t9, align 8
  %612 = load %struct.string_data** %t9, align 8
  %613 = getelementptr inbounds %struct.string_data* %612, i32 0, i32 3
  %614 = load i32* %613, align 4
  %615 = icmp eq i32 %614, 1
  br i1 %615, label %616, label %623

; <label>:616                                     ; preds = %601
  %617 = load %struct.string_data** %t9, align 8
  %618 = getelementptr inbounds %struct.string_data* %617, i32 0, i32 1
  %619 = load i32* %618, align 4
  %620 = load i32** %10, align 8
  %621 = load i32* %620, align 4
  %622 = add nsw i32 %621, %619
  store i32 %622, i32* %620, align 4
  br label %623

; <label>:623                                     ; preds = %616, %601
  br label %624

; <label>:624                                     ; preds = %623
  %625 = load i32* %r8, align 4
  %626 = add nsw i32 %625, 1
  store i32 %626, i32* %r8, align 4
  br label %593

; <label>:627                                     ; preds = %593
  br label %666

; <label>:628                                     ; preds = %574
  %629 = load i32* %s7, align 4
  %630 = sext i32 %629 to i64
  %631 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %630
  %632 = getelementptr inbounds %struct.string_data* %631, i32 0, i32 3
  %633 = load i32* %632, align 4
  %634 = icmp eq i32 %633, 2
  br i1 %634, label %635, label %665

; <label>:635                                     ; preds = %628
  %636 = load i32* %1, align 4
  %637 = add nsw i32 %636, 1
  %638 = sext i32 %637 to i64
  %639 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %638
  %640 = load i32* %639, align 4
  %641 = sext i32 %640 to i64
  %642 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %641
  %643 = getelementptr inbounds %struct.string_data* %642, i32 0, i32 7
  %644 = load i32* %643, align 4
  %645 = load i32* @string_mark, align 4
  %646 = icmp ne i32 %644, %645
  br i1 %646, label %647, label %665

; <label>:647                                     ; preds = %635
  %648 = load i32* %s7, align 4
  %649 = sext i32 %648 to i64
  %650 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %649
  %651 = getelementptr inbounds %struct.string_data* %650, i32 0, i32 1
  %652 = load i32* %651, align 4
  %653 = load i32** %9, align 8
  %654 = load i32* %653, align 4
  %655 = add nsw i32 %654, %652
  store i32 %655, i32* %653, align 4
  %656 = load i32* @string_mark, align 4
  %657 = load i32* %1, align 4
  %658 = add nsw i32 %657, 1
  %659 = sext i32 %658 to i64
  %660 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %659
  %661 = load i32* %660, align 4
  %662 = sext i32 %661 to i64
  %663 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %662
  %664 = getelementptr inbounds %struct.string_data* %663, i32 0, i32 7
  store i32 %656, i32* %664, align 4
  br label %665

; <label>:665                                     ; preds = %647, %635, %628
  br label %666

; <label>:666                                     ; preds = %665, %627
  br label %667

; <label>:667                                     ; preds = %666, %573
  br label %668

; <label>:668                                     ; preds = %667, %525
  br label %669

; <label>:669                                     ; preds = %668, %513
  ret void
}

; Function Attrs: nounwind uwtable
define internal i32 @propagate_string(i32 %stone, i32 %str) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %size = alloca i32, align 4
  %k = alloca i32, align 4
  %d = alloca i32, align 4
  store i32 %stone, i32* %1, align 4
  store i32 %str, i32* %2, align 4
  store i32 1, i32* %size, align 4
  %3 = load i32* %1, align 4
  %4 = load i32* %2, align 4
  %5 = icmp eq i32 %3, %4
  br i1 %5, label %6, label %11

; <label>:6                                       ; preds = %0
  %7 = load i32* %1, align 4
  %8 = load i32* %1, align 4
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds [400 x i32]* @next_stone, i32 0, i64 %9
  store i32 %7, i32* %10, align 4
  br label %30

; <label>:11                                      ; preds = %0
  %12 = load i32* %2, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %13
  %15 = load i32* %14, align 4
  %16 = load i32* %1, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %17
  store i32 %15, i32* %18, align 4
  %19 = load i32* %2, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [400 x i32]* @next_stone, i32 0, i64 %20
  %22 = load i32* %21, align 4
  %23 = load i32* %1, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds [400 x i32]* @next_stone, i32 0, i64 %24
  store i32 %22, i32* %25, align 4
  %26 = load i32* %1, align 4
  %27 = load i32* %2, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds [400 x i32]* @next_stone, i32 0, i64 %28
  store i32 %26, i32* %29, align 4
  br label %30

; <label>:30                                      ; preds = %11, %6
  store i32 0, i32* %k, align 4
  br label %31

; <label>:31                                      ; preds = %78, %30
  %32 = load i32* %k, align 4
  %33 = icmp slt i32 %32, 4
  br i1 %33, label %34, label %81

; <label>:34                                      ; preds = %31
  %35 = load i32* %k, align 4
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds [8 x i32]* @delta, i32 0, i64 %36
  %38 = load i32* %37, align 4
  store i32 %38, i32* %d, align 4
  %39 = load i32* %1, align 4
  %40 = load i32* %d, align 4
  %41 = add nsw i32 %39, %40
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %42
  %44 = load i8* %43, align 1
  %45 = zext i8 %44 to i32
  %46 = icmp ne i32 %45, 3
  br i1 %46, label %47, label %77

; <label>:47                                      ; preds = %34
  %48 = load i32* %1, align 4
  %49 = load i32* %d, align 4
  %50 = add nsw i32 %48, %49
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %51
  %53 = load i8* %52, align 1
  %54 = zext i8 %53 to i32
  %55 = load i32* %1, align 4
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %56
  %58 = load i8* %57, align 1
  %59 = zext i8 %58 to i32
  %60 = icmp eq i32 %54, %59
  br i1 %60, label %61, label %77

; <label>:61                                      ; preds = %47
  %62 = load i32* %1, align 4
  %63 = load i32* %d, align 4
  %64 = add nsw i32 %62, %63
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %65
  %67 = load i32* %66, align 4
  %68 = icmp eq i32 %67, -1
  br i1 %68, label %69, label %77

; <label>:69                                      ; preds = %61
  %70 = load i32* %1, align 4
  %71 = load i32* %d, align 4
  %72 = add nsw i32 %70, %71
  %73 = load i32* %2, align 4
  %74 = call i32 @propagate_string(i32 %72, i32 %73)
  %75 = load i32* %size, align 4
  %76 = add nsw i32 %75, %74
  store i32 %76, i32* %size, align 4
  br label %77

; <label>:77                                      ; preds = %69, %61, %47, %34
  br label %78

; <label>:78                                      ; preds = %77
  %79 = load i32* %k, align 4
  %80 = add nsw i32 %79, 1
  store i32 %80, i32* %k, align 4
  br label %31

; <label>:81                                      ; preds = %31
  %82 = load i32* %size, align 4
  ret i32 %82
}

; Function Attrs: nounwind uwtable
define internal void @find_liberties_and_neighbors(i32 %s) #0 {
  %1 = alloca i32, align 4
  %pos = alloca i32, align 4
  %other = alloca i32, align 4
  store i32 %s, i32* %1, align 4
  %2 = load i32* %1, align 4
  %3 = sext i32 %2 to i64
  %4 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %3
  %5 = getelementptr inbounds %struct.string_data* %4, i32 0, i32 0
  %6 = load i32* %5, align 4
  %7 = sub nsw i32 3, %6
  store i32 %7, i32* %other, align 4
  %8 = load i32* @liberty_mark, align 4
  %9 = add nsw i32 %8, 1
  store i32 %9, i32* @liberty_mark, align 4
  %10 = load i32* @string_mark, align 4
  %11 = add nsw i32 %10, 1
  store i32 %11, i32* @string_mark, align 4
  %12 = load i32* %1, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %13
  %15 = getelementptr inbounds %struct.string_data* %14, i32 0, i32 2
  %16 = load i32* %15, align 4
  store i32 %16, i32* %pos, align 4
  br label %17

; <label>:17                                      ; preds = %422, %0
  %18 = load i32* %pos, align 4
  %19 = add nsw i32 %18, 20
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %20
  %22 = load i8* %21, align 1
  %23 = zext i8 %22 to i32
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %25, label %68

; <label>:25                                      ; preds = %17
  %26 = load i32* %pos, align 4
  %27 = add nsw i32 %26, 20
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %28
  %30 = load i32* %29, align 4
  %31 = load i32* @liberty_mark, align 4
  %32 = icmp ne i32 %30, %31
  br i1 %32, label %33, label %68

; <label>:33                                      ; preds = %25
  br label %34

; <label>:34                                      ; preds = %33
  %35 = load i32* %1, align 4
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %36
  %38 = getelementptr inbounds %struct.string_data* %37, i32 0, i32 3
  %39 = load i32* %38, align 4
  %40 = icmp slt i32 %39, 20
  br i1 %40, label %41, label %55

; <label>:41                                      ; preds = %34
  %42 = load i32* %pos, align 4
  %43 = add nsw i32 %42, 20
  %44 = load i32* %1, align 4
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %45
  %47 = getelementptr inbounds %struct.string_data* %46, i32 0, i32 3
  %48 = load i32* %47, align 4
  %49 = sext i32 %48 to i64
  %50 = load i32* %1, align 4
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %51
  %53 = getelementptr inbounds %struct.string_data* %52, i32 0, i32 4
  %54 = getelementptr inbounds [20 x i32]* %53, i32 0, i64 %49
  store i32 %43, i32* %54, align 4
  br label %55

; <label>:55                                      ; preds = %41, %34
  %56 = load i32* %1, align 4
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %57
  %59 = getelementptr inbounds %struct.string_data* %58, i32 0, i32 3
  %60 = load i32* %59, align 4
  %61 = add nsw i32 %60, 1
  store i32 %61, i32* %59, align 4
  %62 = load i32* @liberty_mark, align 4
  %63 = load i32* %pos, align 4
  %64 = add nsw i32 %63, 20
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %65
  store i32 %62, i32* %66, align 4
  br label %67

; <label>:67                                      ; preds = %55
  br label %117

; <label>:68                                      ; preds = %25, %17
  %69 = load i32* %pos, align 4
  %70 = add nsw i32 %69, 20
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %71
  %73 = load i8* %72, align 1
  %74 = zext i8 %73 to i32
  %75 = load i32* %other, align 4
  %76 = icmp eq i32 %74, %75
  br i1 %76, label %77, label %116

; <label>:77                                      ; preds = %68
  %78 = load i32* %pos, align 4
  %79 = add nsw i32 %78, 20
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %80
  %82 = load i32* %81, align 4
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %83
  %85 = getelementptr inbounds %struct.string_data* %84, i32 0, i32 7
  %86 = load i32* %85, align 4
  %87 = load i32* @string_mark, align 4
  %88 = icmp ne i32 %86, %87
  br i1 %88, label %89, label %116

; <label>:89                                      ; preds = %77
  %90 = load i32* %pos, align 4
  %91 = add nsw i32 %90, 20
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %92
  %94 = load i32* %93, align 4
  %95 = load i32* %1, align 4
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %96
  %98 = getelementptr inbounds %struct.string_data* %97, i32 0, i32 5
  %99 = load i32* %98, align 4
  %100 = add nsw i32 %99, 1
  store i32 %100, i32* %98, align 4
  %101 = sext i32 %99 to i64
  %102 = load i32* %1, align 4
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %103
  %105 = getelementptr inbounds %struct.string_data* %104, i32 0, i32 6
  %106 = getelementptr inbounds [160 x i32]* %105, i32 0, i64 %101
  store i32 %94, i32* %106, align 4
  %107 = load i32* @string_mark, align 4
  %108 = load i32* %pos, align 4
  %109 = add nsw i32 %108, 20
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %110
  %112 = load i32* %111, align 4
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %113
  %115 = getelementptr inbounds %struct.string_data* %114, i32 0, i32 7
  store i32 %107, i32* %115, align 4
  br label %116

; <label>:116                                     ; preds = %89, %77, %68
  br label %117

; <label>:117                                     ; preds = %116, %67
  %118 = load i32* %pos, align 4
  %119 = sub nsw i32 %118, 1
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %120
  %122 = load i8* %121, align 1
  %123 = zext i8 %122 to i32
  %124 = icmp eq i32 %123, 0
  br i1 %124, label %125, label %168

; <label>:125                                     ; preds = %117
  %126 = load i32* %pos, align 4
  %127 = sub nsw i32 %126, 1
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %128
  %130 = load i32* %129, align 4
  %131 = load i32* @liberty_mark, align 4
  %132 = icmp ne i32 %130, %131
  br i1 %132, label %133, label %168

; <label>:133                                     ; preds = %125
  br label %134

; <label>:134                                     ; preds = %133
  %135 = load i32* %1, align 4
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %136
  %138 = getelementptr inbounds %struct.string_data* %137, i32 0, i32 3
  %139 = load i32* %138, align 4
  %140 = icmp slt i32 %139, 20
  br i1 %140, label %141, label %155

; <label>:141                                     ; preds = %134
  %142 = load i32* %pos, align 4
  %143 = sub nsw i32 %142, 1
  %144 = load i32* %1, align 4
  %145 = sext i32 %144 to i64
  %146 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %145
  %147 = getelementptr inbounds %struct.string_data* %146, i32 0, i32 3
  %148 = load i32* %147, align 4
  %149 = sext i32 %148 to i64
  %150 = load i32* %1, align 4
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %151
  %153 = getelementptr inbounds %struct.string_data* %152, i32 0, i32 4
  %154 = getelementptr inbounds [20 x i32]* %153, i32 0, i64 %149
  store i32 %143, i32* %154, align 4
  br label %155

; <label>:155                                     ; preds = %141, %134
  %156 = load i32* %1, align 4
  %157 = sext i32 %156 to i64
  %158 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %157
  %159 = getelementptr inbounds %struct.string_data* %158, i32 0, i32 3
  %160 = load i32* %159, align 4
  %161 = add nsw i32 %160, 1
  store i32 %161, i32* %159, align 4
  %162 = load i32* @liberty_mark, align 4
  %163 = load i32* %pos, align 4
  %164 = sub nsw i32 %163, 1
  %165 = sext i32 %164 to i64
  %166 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %165
  store i32 %162, i32* %166, align 4
  br label %167

; <label>:167                                     ; preds = %155
  br label %217

; <label>:168                                     ; preds = %125, %117
  %169 = load i32* %pos, align 4
  %170 = sub nsw i32 %169, 1
  %171 = sext i32 %170 to i64
  %172 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %171
  %173 = load i8* %172, align 1
  %174 = zext i8 %173 to i32
  %175 = load i32* %other, align 4
  %176 = icmp eq i32 %174, %175
  br i1 %176, label %177, label %216

; <label>:177                                     ; preds = %168
  %178 = load i32* %pos, align 4
  %179 = sub nsw i32 %178, 1
  %180 = sext i32 %179 to i64
  %181 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %180
  %182 = load i32* %181, align 4
  %183 = sext i32 %182 to i64
  %184 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %183
  %185 = getelementptr inbounds %struct.string_data* %184, i32 0, i32 7
  %186 = load i32* %185, align 4
  %187 = load i32* @string_mark, align 4
  %188 = icmp ne i32 %186, %187
  br i1 %188, label %189, label %216

; <label>:189                                     ; preds = %177
  %190 = load i32* %pos, align 4
  %191 = sub nsw i32 %190, 1
  %192 = sext i32 %191 to i64
  %193 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %192
  %194 = load i32* %193, align 4
  %195 = load i32* %1, align 4
  %196 = sext i32 %195 to i64
  %197 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %196
  %198 = getelementptr inbounds %struct.string_data* %197, i32 0, i32 5
  %199 = load i32* %198, align 4
  %200 = add nsw i32 %199, 1
  store i32 %200, i32* %198, align 4
  %201 = sext i32 %199 to i64
  %202 = load i32* %1, align 4
  %203 = sext i32 %202 to i64
  %204 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %203
  %205 = getelementptr inbounds %struct.string_data* %204, i32 0, i32 6
  %206 = getelementptr inbounds [160 x i32]* %205, i32 0, i64 %201
  store i32 %194, i32* %206, align 4
  %207 = load i32* @string_mark, align 4
  %208 = load i32* %pos, align 4
  %209 = sub nsw i32 %208, 1
  %210 = sext i32 %209 to i64
  %211 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %210
  %212 = load i32* %211, align 4
  %213 = sext i32 %212 to i64
  %214 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %213
  %215 = getelementptr inbounds %struct.string_data* %214, i32 0, i32 7
  store i32 %207, i32* %215, align 4
  br label %216

; <label>:216                                     ; preds = %189, %177, %168
  br label %217

; <label>:217                                     ; preds = %216, %167
  %218 = load i32* %pos, align 4
  %219 = sub nsw i32 %218, 20
  %220 = sext i32 %219 to i64
  %221 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %220
  %222 = load i8* %221, align 1
  %223 = zext i8 %222 to i32
  %224 = icmp eq i32 %223, 0
  br i1 %224, label %225, label %268

; <label>:225                                     ; preds = %217
  %226 = load i32* %pos, align 4
  %227 = sub nsw i32 %226, 20
  %228 = sext i32 %227 to i64
  %229 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %228
  %230 = load i32* %229, align 4
  %231 = load i32* @liberty_mark, align 4
  %232 = icmp ne i32 %230, %231
  br i1 %232, label %233, label %268

; <label>:233                                     ; preds = %225
  br label %234

; <label>:234                                     ; preds = %233
  %235 = load i32* %1, align 4
  %236 = sext i32 %235 to i64
  %237 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %236
  %238 = getelementptr inbounds %struct.string_data* %237, i32 0, i32 3
  %239 = load i32* %238, align 4
  %240 = icmp slt i32 %239, 20
  br i1 %240, label %241, label %255

; <label>:241                                     ; preds = %234
  %242 = load i32* %pos, align 4
  %243 = sub nsw i32 %242, 20
  %244 = load i32* %1, align 4
  %245 = sext i32 %244 to i64
  %246 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %245
  %247 = getelementptr inbounds %struct.string_data* %246, i32 0, i32 3
  %248 = load i32* %247, align 4
  %249 = sext i32 %248 to i64
  %250 = load i32* %1, align 4
  %251 = sext i32 %250 to i64
  %252 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %251
  %253 = getelementptr inbounds %struct.string_data* %252, i32 0, i32 4
  %254 = getelementptr inbounds [20 x i32]* %253, i32 0, i64 %249
  store i32 %243, i32* %254, align 4
  br label %255

; <label>:255                                     ; preds = %241, %234
  %256 = load i32* %1, align 4
  %257 = sext i32 %256 to i64
  %258 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %257
  %259 = getelementptr inbounds %struct.string_data* %258, i32 0, i32 3
  %260 = load i32* %259, align 4
  %261 = add nsw i32 %260, 1
  store i32 %261, i32* %259, align 4
  %262 = load i32* @liberty_mark, align 4
  %263 = load i32* %pos, align 4
  %264 = sub nsw i32 %263, 20
  %265 = sext i32 %264 to i64
  %266 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %265
  store i32 %262, i32* %266, align 4
  br label %267

; <label>:267                                     ; preds = %255
  br label %317

; <label>:268                                     ; preds = %225, %217
  %269 = load i32* %pos, align 4
  %270 = sub nsw i32 %269, 20
  %271 = sext i32 %270 to i64
  %272 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %271
  %273 = load i8* %272, align 1
  %274 = zext i8 %273 to i32
  %275 = load i32* %other, align 4
  %276 = icmp eq i32 %274, %275
  br i1 %276, label %277, label %316

; <label>:277                                     ; preds = %268
  %278 = load i32* %pos, align 4
  %279 = sub nsw i32 %278, 20
  %280 = sext i32 %279 to i64
  %281 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %280
  %282 = load i32* %281, align 4
  %283 = sext i32 %282 to i64
  %284 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %283
  %285 = getelementptr inbounds %struct.string_data* %284, i32 0, i32 7
  %286 = load i32* %285, align 4
  %287 = load i32* @string_mark, align 4
  %288 = icmp ne i32 %286, %287
  br i1 %288, label %289, label %316

; <label>:289                                     ; preds = %277
  %290 = load i32* %pos, align 4
  %291 = sub nsw i32 %290, 20
  %292 = sext i32 %291 to i64
  %293 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %292
  %294 = load i32* %293, align 4
  %295 = load i32* %1, align 4
  %296 = sext i32 %295 to i64
  %297 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %296
  %298 = getelementptr inbounds %struct.string_data* %297, i32 0, i32 5
  %299 = load i32* %298, align 4
  %300 = add nsw i32 %299, 1
  store i32 %300, i32* %298, align 4
  %301 = sext i32 %299 to i64
  %302 = load i32* %1, align 4
  %303 = sext i32 %302 to i64
  %304 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %303
  %305 = getelementptr inbounds %struct.string_data* %304, i32 0, i32 6
  %306 = getelementptr inbounds [160 x i32]* %305, i32 0, i64 %301
  store i32 %294, i32* %306, align 4
  %307 = load i32* @string_mark, align 4
  %308 = load i32* %pos, align 4
  %309 = sub nsw i32 %308, 20
  %310 = sext i32 %309 to i64
  %311 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %310
  %312 = load i32* %311, align 4
  %313 = sext i32 %312 to i64
  %314 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %313
  %315 = getelementptr inbounds %struct.string_data* %314, i32 0, i32 7
  store i32 %307, i32* %315, align 4
  br label %316

; <label>:316                                     ; preds = %289, %277, %268
  br label %317

; <label>:317                                     ; preds = %316, %267
  %318 = load i32* %pos, align 4
  %319 = add nsw i32 %318, 1
  %320 = sext i32 %319 to i64
  %321 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %320
  %322 = load i8* %321, align 1
  %323 = zext i8 %322 to i32
  %324 = icmp eq i32 %323, 0
  br i1 %324, label %325, label %368

; <label>:325                                     ; preds = %317
  %326 = load i32* %pos, align 4
  %327 = add nsw i32 %326, 1
  %328 = sext i32 %327 to i64
  %329 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %328
  %330 = load i32* %329, align 4
  %331 = load i32* @liberty_mark, align 4
  %332 = icmp ne i32 %330, %331
  br i1 %332, label %333, label %368

; <label>:333                                     ; preds = %325
  br label %334

; <label>:334                                     ; preds = %333
  %335 = load i32* %1, align 4
  %336 = sext i32 %335 to i64
  %337 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %336
  %338 = getelementptr inbounds %struct.string_data* %337, i32 0, i32 3
  %339 = load i32* %338, align 4
  %340 = icmp slt i32 %339, 20
  br i1 %340, label %341, label %355

; <label>:341                                     ; preds = %334
  %342 = load i32* %pos, align 4
  %343 = add nsw i32 %342, 1
  %344 = load i32* %1, align 4
  %345 = sext i32 %344 to i64
  %346 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %345
  %347 = getelementptr inbounds %struct.string_data* %346, i32 0, i32 3
  %348 = load i32* %347, align 4
  %349 = sext i32 %348 to i64
  %350 = load i32* %1, align 4
  %351 = sext i32 %350 to i64
  %352 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %351
  %353 = getelementptr inbounds %struct.string_data* %352, i32 0, i32 4
  %354 = getelementptr inbounds [20 x i32]* %353, i32 0, i64 %349
  store i32 %343, i32* %354, align 4
  br label %355

; <label>:355                                     ; preds = %341, %334
  %356 = load i32* %1, align 4
  %357 = sext i32 %356 to i64
  %358 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %357
  %359 = getelementptr inbounds %struct.string_data* %358, i32 0, i32 3
  %360 = load i32* %359, align 4
  %361 = add nsw i32 %360, 1
  store i32 %361, i32* %359, align 4
  %362 = load i32* @liberty_mark, align 4
  %363 = load i32* %pos, align 4
  %364 = add nsw i32 %363, 1
  %365 = sext i32 %364 to i64
  %366 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %365
  store i32 %362, i32* %366, align 4
  br label %367

; <label>:367                                     ; preds = %355
  br label %417

; <label>:368                                     ; preds = %325, %317
  %369 = load i32* %pos, align 4
  %370 = add nsw i32 %369, 1
  %371 = sext i32 %370 to i64
  %372 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %371
  %373 = load i8* %372, align 1
  %374 = zext i8 %373 to i32
  %375 = load i32* %other, align 4
  %376 = icmp eq i32 %374, %375
  br i1 %376, label %377, label %416

; <label>:377                                     ; preds = %368
  %378 = load i32* %pos, align 4
  %379 = add nsw i32 %378, 1
  %380 = sext i32 %379 to i64
  %381 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %380
  %382 = load i32* %381, align 4
  %383 = sext i32 %382 to i64
  %384 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %383
  %385 = getelementptr inbounds %struct.string_data* %384, i32 0, i32 7
  %386 = load i32* %385, align 4
  %387 = load i32* @string_mark, align 4
  %388 = icmp ne i32 %386, %387
  br i1 %388, label %389, label %416

; <label>:389                                     ; preds = %377
  %390 = load i32* %pos, align 4
  %391 = add nsw i32 %390, 1
  %392 = sext i32 %391 to i64
  %393 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %392
  %394 = load i32* %393, align 4
  %395 = load i32* %1, align 4
  %396 = sext i32 %395 to i64
  %397 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %396
  %398 = getelementptr inbounds %struct.string_data* %397, i32 0, i32 5
  %399 = load i32* %398, align 4
  %400 = add nsw i32 %399, 1
  store i32 %400, i32* %398, align 4
  %401 = sext i32 %399 to i64
  %402 = load i32* %1, align 4
  %403 = sext i32 %402 to i64
  %404 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %403
  %405 = getelementptr inbounds %struct.string_data* %404, i32 0, i32 6
  %406 = getelementptr inbounds [160 x i32]* %405, i32 0, i64 %401
  store i32 %394, i32* %406, align 4
  %407 = load i32* @string_mark, align 4
  %408 = load i32* %pos, align 4
  %409 = add nsw i32 %408, 1
  %410 = sext i32 %409 to i64
  %411 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %410
  %412 = load i32* %411, align 4
  %413 = sext i32 %412 to i64
  %414 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %413
  %415 = getelementptr inbounds %struct.string_data* %414, i32 0, i32 7
  store i32 %407, i32* %415, align 4
  br label %416

; <label>:416                                     ; preds = %389, %377, %368
  br label %417

; <label>:417                                     ; preds = %416, %367
  %418 = load i32* %pos, align 4
  %419 = sext i32 %418 to i64
  %420 = getelementptr inbounds [400 x i32]* @next_stone, i32 0, i64 %419
  %421 = load i32* %420, align 4
  store i32 %421, i32* %pos, align 4
  br label %422

; <label>:422                                     ; preds = %417
  %423 = load i32* %pos, align 4
  %424 = load i32* %1, align 4
  %425 = sext i32 %424 to i64
  %426 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %425
  %427 = getelementptr inbounds %struct.string_data* %426, i32 0, i32 2
  %428 = load i32* %427, align 4
  %429 = icmp eq i32 %423, %428
  %430 = xor i1 %429, true
  br i1 %430, label %17, label %431

; <label>:431                                     ; preds = %422
  ret void
}

declare void @hashdata_invert_ko(%struct.Hash_data*, i32) #1

; Function Attrs: nounwind uwtable
define internal void @do_play_move(i32 %pos, i32 %color) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %other = alloca i32, align 4
  %captured_stones = alloca i32, align 4
  %neighbor_allies = alloca i32, align 4
  %have_liberties = alloca i32, align 4
  %s = alloca i32, align 4
  %south = alloca i32, align 4
  %west = alloca i32, align 4
  %north = alloca i32, align 4
  %east = alloca i32, align 4
  store i32 %pos, i32* %1, align 4
  store i32 %color, i32* %2, align 4
  %3 = load i32* %2, align 4
  %4 = sub nsw i32 3, %3
  store i32 %4, i32* %other, align 4
  store i32 0, i32* %captured_stones, align 4
  store i32 0, i32* %neighbor_allies, align 4
  store i32 0, i32* %have_liberties, align 4
  store i32 -1, i32* %s, align 4
  %5 = load i32* %1, align 4
  %6 = add nsw i32 %5, 20
  store i32 %6, i32* %south, align 4
  %7 = load i32* %1, align 4
  %8 = sub nsw i32 %7, 1
  store i32 %8, i32* %west, align 4
  %9 = load i32* %1, align 4
  %10 = sub nsw i32 %9, 20
  store i32 %10, i32* %north, align 4
  %11 = load i32* %1, align 4
  %12 = add nsw i32 %11, 1
  store i32 %12, i32* %east, align 4
  %13 = load i32* %south, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %14
  %16 = load i8* %15, align 1
  %17 = zext i8 %16 to i32
  %18 = load i32* %other, align 4
  %19 = icmp eq i32 %17, %18
  br i1 %19, label %20, label %38

; <label>:20                                      ; preds = %0
  %21 = load i32* %south, align 4
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %22
  %24 = load i32* %23, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %25
  %27 = getelementptr inbounds %struct.string_data* %26, i32 0, i32 3
  %28 = load i32* %27, align 4
  %29 = icmp eq i32 %28, 1
  br i1 %29, label %30, label %38

; <label>:30                                      ; preds = %20
  %31 = load i32* %south, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %32
  %34 = load i32* %33, align 4
  %35 = call i32 @do_remove_string(i32 %34)
  %36 = load i32* %captured_stones, align 4
  %37 = add nsw i32 %36, %35
  store i32 %37, i32* %captured_stones, align 4
  br label %38

; <label>:38                                      ; preds = %30, %20, %0
  %39 = load i32* %west, align 4
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %40
  %42 = load i8* %41, align 1
  %43 = zext i8 %42 to i32
  %44 = load i32* %other, align 4
  %45 = icmp eq i32 %43, %44
  br i1 %45, label %46, label %64

; <label>:46                                      ; preds = %38
  %47 = load i32* %west, align 4
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %48
  %50 = load i32* %49, align 4
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %51
  %53 = getelementptr inbounds %struct.string_data* %52, i32 0, i32 3
  %54 = load i32* %53, align 4
  %55 = icmp eq i32 %54, 1
  br i1 %55, label %56, label %64

; <label>:56                                      ; preds = %46
  %57 = load i32* %west, align 4
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %58
  %60 = load i32* %59, align 4
  %61 = call i32 @do_remove_string(i32 %60)
  %62 = load i32* %captured_stones, align 4
  %63 = add nsw i32 %62, %61
  store i32 %63, i32* %captured_stones, align 4
  br label %64

; <label>:64                                      ; preds = %56, %46, %38
  %65 = load i32* %north, align 4
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %66
  %68 = load i8* %67, align 1
  %69 = zext i8 %68 to i32
  %70 = load i32* %other, align 4
  %71 = icmp eq i32 %69, %70
  br i1 %71, label %72, label %90

; <label>:72                                      ; preds = %64
  %73 = load i32* %north, align 4
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %74
  %76 = load i32* %75, align 4
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %77
  %79 = getelementptr inbounds %struct.string_data* %78, i32 0, i32 3
  %80 = load i32* %79, align 4
  %81 = icmp eq i32 %80, 1
  br i1 %81, label %82, label %90

; <label>:82                                      ; preds = %72
  %83 = load i32* %north, align 4
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %84
  %86 = load i32* %85, align 4
  %87 = call i32 @do_remove_string(i32 %86)
  %88 = load i32* %captured_stones, align 4
  %89 = add nsw i32 %88, %87
  store i32 %89, i32* %captured_stones, align 4
  br label %90

; <label>:90                                      ; preds = %82, %72, %64
  %91 = load i32* %east, align 4
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %92
  %94 = load i8* %93, align 1
  %95 = zext i8 %94 to i32
  %96 = load i32* %other, align 4
  %97 = icmp eq i32 %95, %96
  br i1 %97, label %98, label %116

; <label>:98                                      ; preds = %90
  %99 = load i32* %east, align 4
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %100
  %102 = load i32* %101, align 4
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %103
  %105 = getelementptr inbounds %struct.string_data* %104, i32 0, i32 3
  %106 = load i32* %105, align 4
  %107 = icmp eq i32 %106, 1
  br i1 %107, label %108, label %116

; <label>:108                                     ; preds = %98
  %109 = load i32* %east, align 4
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %110
  %112 = load i32* %111, align 4
  %113 = call i32 @do_remove_string(i32 %112)
  %114 = load i32* %captured_stones, align 4
  %115 = add nsw i32 %114, %113
  store i32 %115, i32* %captured_stones, align 4
  br label %116

; <label>:116                                     ; preds = %108, %98, %90
  %117 = load i32* %captured_stones, align 4
  %118 = icmp eq i32 %117, 0
  br i1 %118, label %119, label %227

; <label>:119                                     ; preds = %116
  %120 = load i32* %south, align 4
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %121
  %123 = load i8* %122, align 1
  %124 = zext i8 %123 to i32
  %125 = icmp eq i32 %124, 0
  br i1 %125, label %144, label %126

; <label>:126                                     ; preds = %119
  %127 = load i32* %south, align 4
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %128
  %130 = load i8* %129, align 1
  %131 = zext i8 %130 to i32
  %132 = load i32* %2, align 4
  %133 = icmp eq i32 %131, %132
  br i1 %133, label %134, label %145

; <label>:134                                     ; preds = %126
  %135 = load i32* %south, align 4
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %136
  %138 = load i32* %137, align 4
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %139
  %141 = getelementptr inbounds %struct.string_data* %140, i32 0, i32 3
  %142 = load i32* %141, align 4
  %143 = icmp sgt i32 %142, 1
  br i1 %143, label %144, label %145

; <label>:144                                     ; preds = %134, %119
  store i32 1, i32* %have_liberties, align 4
  br label %226

; <label>:145                                     ; preds = %134, %126
  %146 = load i32* %west, align 4
  %147 = sext i32 %146 to i64
  %148 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %147
  %149 = load i8* %148, align 1
  %150 = zext i8 %149 to i32
  %151 = icmp eq i32 %150, 0
  br i1 %151, label %170, label %152

; <label>:152                                     ; preds = %145
  %153 = load i32* %west, align 4
  %154 = sext i32 %153 to i64
  %155 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %154
  %156 = load i8* %155, align 1
  %157 = zext i8 %156 to i32
  %158 = load i32* %2, align 4
  %159 = icmp eq i32 %157, %158
  br i1 %159, label %160, label %171

; <label>:160                                     ; preds = %152
  %161 = load i32* %west, align 4
  %162 = sext i32 %161 to i64
  %163 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %162
  %164 = load i32* %163, align 4
  %165 = sext i32 %164 to i64
  %166 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %165
  %167 = getelementptr inbounds %struct.string_data* %166, i32 0, i32 3
  %168 = load i32* %167, align 4
  %169 = icmp sgt i32 %168, 1
  br i1 %169, label %170, label %171

; <label>:170                                     ; preds = %160, %145
  store i32 1, i32* %have_liberties, align 4
  br label %225

; <label>:171                                     ; preds = %160, %152
  %172 = load i32* %north, align 4
  %173 = sext i32 %172 to i64
  %174 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %173
  %175 = load i8* %174, align 1
  %176 = zext i8 %175 to i32
  %177 = icmp eq i32 %176, 0
  br i1 %177, label %196, label %178

; <label>:178                                     ; preds = %171
  %179 = load i32* %north, align 4
  %180 = sext i32 %179 to i64
  %181 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %180
  %182 = load i8* %181, align 1
  %183 = zext i8 %182 to i32
  %184 = load i32* %2, align 4
  %185 = icmp eq i32 %183, %184
  br i1 %185, label %186, label %197

; <label>:186                                     ; preds = %178
  %187 = load i32* %north, align 4
  %188 = sext i32 %187 to i64
  %189 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %188
  %190 = load i32* %189, align 4
  %191 = sext i32 %190 to i64
  %192 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %191
  %193 = getelementptr inbounds %struct.string_data* %192, i32 0, i32 3
  %194 = load i32* %193, align 4
  %195 = icmp sgt i32 %194, 1
  br i1 %195, label %196, label %197

; <label>:196                                     ; preds = %186, %171
  store i32 1, i32* %have_liberties, align 4
  br label %224

; <label>:197                                     ; preds = %186, %178
  %198 = load i32* %east, align 4
  %199 = sext i32 %198 to i64
  %200 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %199
  %201 = load i8* %200, align 1
  %202 = zext i8 %201 to i32
  %203 = icmp eq i32 %202, 0
  br i1 %203, label %222, label %204

; <label>:204                                     ; preds = %197
  %205 = load i32* %east, align 4
  %206 = sext i32 %205 to i64
  %207 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %206
  %208 = load i8* %207, align 1
  %209 = zext i8 %208 to i32
  %210 = load i32* %2, align 4
  %211 = icmp eq i32 %209, %210
  br i1 %211, label %212, label %223

; <label>:212                                     ; preds = %204
  %213 = load i32* %east, align 4
  %214 = sext i32 %213 to i64
  %215 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %214
  %216 = load i32* %215, align 4
  %217 = sext i32 %216 to i64
  %218 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %217
  %219 = getelementptr inbounds %struct.string_data* %218, i32 0, i32 3
  %220 = load i32* %219, align 4
  %221 = icmp sgt i32 %220, 1
  br i1 %221, label %222, label %223

; <label>:222                                     ; preds = %212, %197
  store i32 1, i32* %have_liberties, align 4
  br label %223

; <label>:223                                     ; preds = %222, %212, %204
  br label %224

; <label>:224                                     ; preds = %223, %196
  br label %225

; <label>:225                                     ; preds = %224, %170
  br label %226

; <label>:226                                     ; preds = %225, %144
  br label %228

; <label>:227                                     ; preds = %116
  store i32 1, i32* %have_liberties, align 4
  br label %228

; <label>:228                                     ; preds = %227, %226
  %229 = load i32* %have_liberties, align 4
  %230 = icmp eq i32 %229, 0
  br i1 %230, label %231, label %237

; <label>:231                                     ; preds = %228
  %232 = load i32* %captured_stones, align 4
  %233 = icmp eq i32 %232, 0
  br i1 %233, label %234, label %237

; <label>:234                                     ; preds = %231
  %235 = load i32* %1, align 4
  %236 = load i32* %2, align 4
  call void @do_commit_suicide(i32 %235, i32 %236)
  br label %569

; <label>:237                                     ; preds = %231, %228
  br label %238

; <label>:238                                     ; preds = %237
  %239 = load i32* %1, align 4
  %240 = sext i32 %239 to i64
  %241 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %240
  %242 = load %struct.vertex_stack_entry** @vertex_stack_pointer, align 8
  %243 = getelementptr inbounds %struct.vertex_stack_entry* %242, i32 0, i32 0
  store i8* %241, i8** %243, align 8
  %244 = load i32* %1, align 4
  %245 = sext i32 %244 to i64
  %246 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %245
  %247 = load i8* %246, align 1
  %248 = zext i8 %247 to i32
  %249 = load %struct.vertex_stack_entry** @vertex_stack_pointer, align 8
  %250 = getelementptr inbounds %struct.vertex_stack_entry* %249, i32 1
  store %struct.vertex_stack_entry* %250, %struct.vertex_stack_entry** @vertex_stack_pointer, align 8
  %251 = getelementptr inbounds %struct.vertex_stack_entry* %249, i32 0, i32 1
  store i32 %248, i32* %251, align 4
  %252 = load i32* %2, align 4
  %253 = trunc i32 %252 to i8
  %254 = load i32* %1, align 4
  %255 = sext i32 %254 to i64
  %256 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %255
  store i8 %253, i8* %256, align 1
  %257 = load i32* %1, align 4
  %258 = load i32* %2, align 4
  call void @hashdata_invert_stone(%struct.Hash_data* @hashdata, i32 %257, i32 %258)
  br label %259

; <label>:259                                     ; preds = %238
  %260 = load i32* @string_mark, align 4
  %261 = add nsw i32 %260, 1
  store i32 %261, i32* @string_mark, align 4
  %262 = load i32* %south, align 4
  %263 = sext i32 %262 to i64
  %264 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %263
  %265 = load i8* %264, align 1
  %266 = zext i8 %265 to i32
  %267 = load i32* %2, align 4
  %268 = icmp eq i32 %266, %267
  br i1 %268, label %269, label %295

; <label>:269                                     ; preds = %259
  %270 = load i32* %south, align 4
  %271 = sext i32 %270 to i64
  %272 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %271
  %273 = load i32* %272, align 4
  %274 = sext i32 %273 to i64
  %275 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %274
  %276 = getelementptr inbounds %struct.string_data* %275, i32 0, i32 7
  %277 = load i32* %276, align 4
  %278 = load i32* @string_mark, align 4
  %279 = icmp ne i32 %277, %278
  br i1 %279, label %280, label %295

; <label>:280                                     ; preds = %269
  %281 = load i32* %neighbor_allies, align 4
  %282 = add nsw i32 %281, 1
  store i32 %282, i32* %neighbor_allies, align 4
  %283 = load i32* %south, align 4
  %284 = sext i32 %283 to i64
  %285 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %284
  %286 = load i32* %285, align 4
  store i32 %286, i32* %s, align 4
  %287 = load i32* @string_mark, align 4
  %288 = load i32* %south, align 4
  %289 = sext i32 %288 to i64
  %290 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %289
  %291 = load i32* %290, align 4
  %292 = sext i32 %291 to i64
  %293 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %292
  %294 = getelementptr inbounds %struct.string_data* %293, i32 0, i32 7
  store i32 %287, i32* %294, align 4
  br label %329

; <label>:295                                     ; preds = %269, %259
  %296 = load i32* %south, align 4
  %297 = sext i32 %296 to i64
  %298 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %297
  %299 = load i8* %298, align 1
  %300 = zext i8 %299 to i32
  %301 = load i32* %other, align 4
  %302 = icmp eq i32 %300, %301
  br i1 %302, label %303, label %328

; <label>:303                                     ; preds = %295
  %304 = load i32* %south, align 4
  %305 = sext i32 %304 to i64
  %306 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %305
  %307 = load i32* %306, align 4
  %308 = sext i32 %307 to i64
  %309 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %308
  %310 = getelementptr inbounds %struct.string_data* %309, i32 0, i32 7
  %311 = load i32* %310, align 4
  %312 = load i32* @string_mark, align 4
  %313 = icmp ne i32 %311, %312
  br i1 %313, label %314, label %328

; <label>:314                                     ; preds = %303
  %315 = load i32* %south, align 4
  %316 = sext i32 %315 to i64
  %317 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %316
  %318 = load i32* %317, align 4
  %319 = load i32* %1, align 4
  call void @remove_liberty(i32 %318, i32 %319)
  %320 = load i32* @string_mark, align 4
  %321 = load i32* %south, align 4
  %322 = sext i32 %321 to i64
  %323 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %322
  %324 = load i32* %323, align 4
  %325 = sext i32 %324 to i64
  %326 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %325
  %327 = getelementptr inbounds %struct.string_data* %326, i32 0, i32 7
  store i32 %320, i32* %327, align 4
  br label %328

; <label>:328                                     ; preds = %314, %303, %295
  br label %329

; <label>:329                                     ; preds = %328, %280
  %330 = load i32* %west, align 4
  %331 = sext i32 %330 to i64
  %332 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %331
  %333 = load i8* %332, align 1
  %334 = zext i8 %333 to i32
  %335 = load i32* %2, align 4
  %336 = icmp eq i32 %334, %335
  br i1 %336, label %337, label %363

; <label>:337                                     ; preds = %329
  %338 = load i32* %west, align 4
  %339 = sext i32 %338 to i64
  %340 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %339
  %341 = load i32* %340, align 4
  %342 = sext i32 %341 to i64
  %343 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %342
  %344 = getelementptr inbounds %struct.string_data* %343, i32 0, i32 7
  %345 = load i32* %344, align 4
  %346 = load i32* @string_mark, align 4
  %347 = icmp ne i32 %345, %346
  br i1 %347, label %348, label %363

; <label>:348                                     ; preds = %337
  %349 = load i32* %neighbor_allies, align 4
  %350 = add nsw i32 %349, 1
  store i32 %350, i32* %neighbor_allies, align 4
  %351 = load i32* %west, align 4
  %352 = sext i32 %351 to i64
  %353 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %352
  %354 = load i32* %353, align 4
  store i32 %354, i32* %s, align 4
  %355 = load i32* @string_mark, align 4
  %356 = load i32* %west, align 4
  %357 = sext i32 %356 to i64
  %358 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %357
  %359 = load i32* %358, align 4
  %360 = sext i32 %359 to i64
  %361 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %360
  %362 = getelementptr inbounds %struct.string_data* %361, i32 0, i32 7
  store i32 %355, i32* %362, align 4
  br label %397

; <label>:363                                     ; preds = %337, %329
  %364 = load i32* %west, align 4
  %365 = sext i32 %364 to i64
  %366 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %365
  %367 = load i8* %366, align 1
  %368 = zext i8 %367 to i32
  %369 = load i32* %other, align 4
  %370 = icmp eq i32 %368, %369
  br i1 %370, label %371, label %396

; <label>:371                                     ; preds = %363
  %372 = load i32* %west, align 4
  %373 = sext i32 %372 to i64
  %374 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %373
  %375 = load i32* %374, align 4
  %376 = sext i32 %375 to i64
  %377 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %376
  %378 = getelementptr inbounds %struct.string_data* %377, i32 0, i32 7
  %379 = load i32* %378, align 4
  %380 = load i32* @string_mark, align 4
  %381 = icmp ne i32 %379, %380
  br i1 %381, label %382, label %396

; <label>:382                                     ; preds = %371
  %383 = load i32* %west, align 4
  %384 = sext i32 %383 to i64
  %385 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %384
  %386 = load i32* %385, align 4
  %387 = load i32* %1, align 4
  call void @remove_liberty(i32 %386, i32 %387)
  %388 = load i32* @string_mark, align 4
  %389 = load i32* %west, align 4
  %390 = sext i32 %389 to i64
  %391 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %390
  %392 = load i32* %391, align 4
  %393 = sext i32 %392 to i64
  %394 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %393
  %395 = getelementptr inbounds %struct.string_data* %394, i32 0, i32 7
  store i32 %388, i32* %395, align 4
  br label %396

; <label>:396                                     ; preds = %382, %371, %363
  br label %397

; <label>:397                                     ; preds = %396, %348
  %398 = load i32* %north, align 4
  %399 = sext i32 %398 to i64
  %400 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %399
  %401 = load i8* %400, align 1
  %402 = zext i8 %401 to i32
  %403 = load i32* %2, align 4
  %404 = icmp eq i32 %402, %403
  br i1 %404, label %405, label %431

; <label>:405                                     ; preds = %397
  %406 = load i32* %north, align 4
  %407 = sext i32 %406 to i64
  %408 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %407
  %409 = load i32* %408, align 4
  %410 = sext i32 %409 to i64
  %411 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %410
  %412 = getelementptr inbounds %struct.string_data* %411, i32 0, i32 7
  %413 = load i32* %412, align 4
  %414 = load i32* @string_mark, align 4
  %415 = icmp ne i32 %413, %414
  br i1 %415, label %416, label %431

; <label>:416                                     ; preds = %405
  %417 = load i32* %neighbor_allies, align 4
  %418 = add nsw i32 %417, 1
  store i32 %418, i32* %neighbor_allies, align 4
  %419 = load i32* %north, align 4
  %420 = sext i32 %419 to i64
  %421 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %420
  %422 = load i32* %421, align 4
  store i32 %422, i32* %s, align 4
  %423 = load i32* @string_mark, align 4
  %424 = load i32* %north, align 4
  %425 = sext i32 %424 to i64
  %426 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %425
  %427 = load i32* %426, align 4
  %428 = sext i32 %427 to i64
  %429 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %428
  %430 = getelementptr inbounds %struct.string_data* %429, i32 0, i32 7
  store i32 %423, i32* %430, align 4
  br label %465

; <label>:431                                     ; preds = %405, %397
  %432 = load i32* %north, align 4
  %433 = sext i32 %432 to i64
  %434 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %433
  %435 = load i8* %434, align 1
  %436 = zext i8 %435 to i32
  %437 = load i32* %other, align 4
  %438 = icmp eq i32 %436, %437
  br i1 %438, label %439, label %464

; <label>:439                                     ; preds = %431
  %440 = load i32* %north, align 4
  %441 = sext i32 %440 to i64
  %442 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %441
  %443 = load i32* %442, align 4
  %444 = sext i32 %443 to i64
  %445 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %444
  %446 = getelementptr inbounds %struct.string_data* %445, i32 0, i32 7
  %447 = load i32* %446, align 4
  %448 = load i32* @string_mark, align 4
  %449 = icmp ne i32 %447, %448
  br i1 %449, label %450, label %464

; <label>:450                                     ; preds = %439
  %451 = load i32* %north, align 4
  %452 = sext i32 %451 to i64
  %453 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %452
  %454 = load i32* %453, align 4
  %455 = load i32* %1, align 4
  call void @remove_liberty(i32 %454, i32 %455)
  %456 = load i32* @string_mark, align 4
  %457 = load i32* %north, align 4
  %458 = sext i32 %457 to i64
  %459 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %458
  %460 = load i32* %459, align 4
  %461 = sext i32 %460 to i64
  %462 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %461
  %463 = getelementptr inbounds %struct.string_data* %462, i32 0, i32 7
  store i32 %456, i32* %463, align 4
  br label %464

; <label>:464                                     ; preds = %450, %439, %431
  br label %465

; <label>:465                                     ; preds = %464, %416
  %466 = load i32* %east, align 4
  %467 = sext i32 %466 to i64
  %468 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %467
  %469 = load i8* %468, align 1
  %470 = zext i8 %469 to i32
  %471 = load i32* %2, align 4
  %472 = icmp eq i32 %470, %471
  br i1 %472, label %473, label %491

; <label>:473                                     ; preds = %465
  %474 = load i32* %east, align 4
  %475 = sext i32 %474 to i64
  %476 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %475
  %477 = load i32* %476, align 4
  %478 = sext i32 %477 to i64
  %479 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %478
  %480 = getelementptr inbounds %struct.string_data* %479, i32 0, i32 7
  %481 = load i32* %480, align 4
  %482 = load i32* @string_mark, align 4
  %483 = icmp ne i32 %481, %482
  br i1 %483, label %484, label %491

; <label>:484                                     ; preds = %473
  %485 = load i32* %neighbor_allies, align 4
  %486 = add nsw i32 %485, 1
  store i32 %486, i32* %neighbor_allies, align 4
  %487 = load i32* %east, align 4
  %488 = sext i32 %487 to i64
  %489 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %488
  %490 = load i32* %489, align 4
  store i32 %490, i32* %s, align 4
  br label %517

; <label>:491                                     ; preds = %473, %465
  %492 = load i32* %east, align 4
  %493 = sext i32 %492 to i64
  %494 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %493
  %495 = load i8* %494, align 1
  %496 = zext i8 %495 to i32
  %497 = load i32* %other, align 4
  %498 = icmp eq i32 %496, %497
  br i1 %498, label %499, label %516

; <label>:499                                     ; preds = %491
  %500 = load i32* %east, align 4
  %501 = sext i32 %500 to i64
  %502 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %501
  %503 = load i32* %502, align 4
  %504 = sext i32 %503 to i64
  %505 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %504
  %506 = getelementptr inbounds %struct.string_data* %505, i32 0, i32 7
  %507 = load i32* %506, align 4
  %508 = load i32* @string_mark, align 4
  %509 = icmp ne i32 %507, %508
  br i1 %509, label %510, label %516

; <label>:510                                     ; preds = %499
  %511 = load i32* %east, align 4
  %512 = sext i32 %511 to i64
  %513 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %512
  %514 = load i32* %513, align 4
  %515 = load i32* %1, align 4
  call void @remove_liberty(i32 %514, i32 %515)
  br label %516

; <label>:516                                     ; preds = %510, %499, %491
  br label %517

; <label>:517                                     ; preds = %516, %484
  %518 = load i32* %neighbor_allies, align 4
  %519 = icmp eq i32 %518, 0
  br i1 %519, label %520, label %522

; <label>:520                                     ; preds = %517
  %521 = load i32* %1, align 4
  call void @create_new_string(i32 %521)
  br label %535

; <label>:522                                     ; preds = %517
  %523 = load i32* %neighbor_allies, align 4
  %524 = icmp eq i32 %523, 1
  br i1 %524, label %525, label %533

; <label>:525                                     ; preds = %522
  %526 = load i32* %s, align 4
  %527 = icmp sge i32 %526, 0
  br i1 %527, label %528, label %529

; <label>:528                                     ; preds = %525
  br label %530

; <label>:529                                     ; preds = %525
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 3498, i8* getelementptr inbounds ([7 x i8]* @.str35, i32 0, i32 0), i32 -1, i32 -1)
  br label %530

; <label>:530                                     ; preds = %529, %528
  %531 = load i32* %1, align 4
  %532 = load i32* %s, align 4
  call void @extend_neighbor_string(i32 %531, i32 %532)
  br label %569

; <label>:533                                     ; preds = %522
  %534 = load i32* %1, align 4
  call void @assimilate_neighbor_strings(i32 %534)
  br label %569

; <label>:535                                     ; preds = %520
  %536 = load i32* %1, align 4
  %537 = sext i32 %536 to i64
  %538 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %537
  %539 = load i32* %538, align 4
  store i32 %539, i32* %s, align 4
  %540 = load i32* %s, align 4
  %541 = sext i32 %540 to i64
  %542 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %541
  %543 = getelementptr inbounds %struct.string_data* %542, i32 0, i32 3
  %544 = load i32* %543, align 4
  %545 = icmp eq i32 %544, 1
  br i1 %545, label %546, label %569

; <label>:546                                     ; preds = %535
  %547 = load i32* %s, align 4
  %548 = sext i32 %547 to i64
  %549 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %548
  %550 = getelementptr inbounds %struct.string_data* %549, i32 0, i32 1
  %551 = load i32* %550, align 4
  %552 = icmp eq i32 %551, 1
  br i1 %552, label %553, label %569

; <label>:553                                     ; preds = %546
  %554 = load i32* %captured_stones, align 4
  %555 = icmp eq i32 %554, 1
  br i1 %555, label %556, label %569

; <label>:556                                     ; preds = %553
  %557 = load i32* @board_ko_pos, align 4
  %558 = icmp ne i32 %557, 0
  br i1 %558, label %559, label %561

; <label>:559                                     ; preds = %556
  %560 = load i32* @board_ko_pos, align 4
  call void @hashdata_invert_ko(%struct.Hash_data* @hashdata, i32 %560)
  br label %561

; <label>:561                                     ; preds = %559, %556
  %562 = load i32* %s, align 4
  %563 = sext i32 %562 to i64
  %564 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %563
  %565 = getelementptr inbounds %struct.string_data* %564, i32 0, i32 4
  %566 = getelementptr inbounds [20 x i32]* %565, i32 0, i64 0
  %567 = load i32* %566, align 4
  store i32 %567, i32* @board_ko_pos, align 4
  %568 = load i32* @board_ko_pos, align 4
  call void @hashdata_invert_ko(%struct.Hash_data* @hashdata, i32 %568)
  br label %569

; <label>:569                                     ; preds = %234, %530, %533, %561, %553, %546, %535
  ret void
}

; Function Attrs: nounwind uwtable
define internal i32 @do_remove_string(i32 %s) #0 {
  %1 = alloca i32, align 4
  %pos = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 %s, i32* %1, align 4
  %2 = load i32* %1, align 4
  %3 = sext i32 %2 to i64
  %4 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %3
  %5 = getelementptr inbounds %struct.string_data* %4, i32 0, i32 2
  %6 = load i32* %5, align 4
  store i32 %6, i32* %pos, align 4
  br label %7

; <label>:7                                       ; preds = %60, %0
  %8 = load i32* %pos, align 4
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %9
  %11 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %12 = getelementptr inbounds %struct.change_stack_entry* %11, i32 0, i32 0
  store i32* %10, i32** %12, align 8
  %13 = load i32* %pos, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %14
  %16 = load i32* %15, align 4
  %17 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %18 = getelementptr inbounds %struct.change_stack_entry* %17, i32 1
  store %struct.change_stack_entry* %18, %struct.change_stack_entry** @change_stack_pointer, align 8
  %19 = getelementptr inbounds %struct.change_stack_entry* %17, i32 0, i32 1
  store i32 %16, i32* %19, align 4
  %20 = load i32* %pos, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds [400 x i32]* @next_stone, i32 0, i64 %21
  %23 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %24 = getelementptr inbounds %struct.change_stack_entry* %23, i32 0, i32 0
  store i32* %22, i32** %24, align 8
  %25 = load i32* %pos, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds [400 x i32]* @next_stone, i32 0, i64 %26
  %28 = load i32* %27, align 4
  %29 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %30 = getelementptr inbounds %struct.change_stack_entry* %29, i32 1
  store %struct.change_stack_entry* %30, %struct.change_stack_entry** @change_stack_pointer, align 8
  %31 = getelementptr inbounds %struct.change_stack_entry* %29, i32 0, i32 1
  store i32 %28, i32* %31, align 4
  br label %32

; <label>:32                                      ; preds = %7
  %33 = load i32* %pos, align 4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %34
  %36 = load %struct.vertex_stack_entry** @vertex_stack_pointer, align 8
  %37 = getelementptr inbounds %struct.vertex_stack_entry* %36, i32 0, i32 0
  store i8* %35, i8** %37, align 8
  %38 = load i32* %pos, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %39
  %41 = load i8* %40, align 1
  %42 = zext i8 %41 to i32
  %43 = load %struct.vertex_stack_entry** @vertex_stack_pointer, align 8
  %44 = getelementptr inbounds %struct.vertex_stack_entry* %43, i32 1
  store %struct.vertex_stack_entry* %44, %struct.vertex_stack_entry** @vertex_stack_pointer, align 8
  %45 = getelementptr inbounds %struct.vertex_stack_entry* %43, i32 0, i32 1
  store i32 %42, i32* %45, align 4
  %46 = load i32* %pos, align 4
  %47 = load i32* %pos, align 4
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %48
  %50 = load i8* %49, align 1
  %51 = zext i8 %50 to i32
  call void @hashdata_invert_stone(%struct.Hash_data* @hashdata, i32 %46, i32 %51)
  %52 = load i32* %pos, align 4
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %53
  store i8 0, i8* %54, align 1
  br label %55

; <label>:55                                      ; preds = %32
  %56 = load i32* %pos, align 4
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds [400 x i32]* @next_stone, i32 0, i64 %57
  %59 = load i32* %58, align 4
  store i32 %59, i32* %pos, align 4
  br label %60

; <label>:60                                      ; preds = %55
  %61 = load i32* %pos, align 4
  %62 = load i32* %1, align 4
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %63
  %65 = getelementptr inbounds %struct.string_data* %64, i32 0, i32 2
  %66 = load i32* %65, align 4
  %67 = icmp eq i32 %61, %66
  %68 = xor i1 %67, true
  br i1 %68, label %7, label %69

; <label>:69                                      ; preds = %60
  store i32 0, i32* %k, align 4
  br label %70

; <label>:70                                      ; preds = %96, %69
  %71 = load i32* %k, align 4
  %72 = load i32* %1, align 4
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %73
  %75 = getelementptr inbounds %struct.string_data* %74, i32 0, i32 5
  %76 = load i32* %75, align 4
  %77 = icmp slt i32 %71, %76
  br i1 %77, label %78, label %99

; <label>:78                                      ; preds = %70
  %79 = load i32* %k, align 4
  %80 = sext i32 %79 to i64
  %81 = load i32* %1, align 4
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %82
  %84 = getelementptr inbounds %struct.string_data* %83, i32 0, i32 6
  %85 = getelementptr inbounds [160 x i32]* %84, i32 0, i64 %80
  %86 = load i32* %85, align 4
  %87 = load i32* %1, align 4
  call void @remove_neighbor(i32 %86, i32 %87)
  %88 = load i32* %k, align 4
  %89 = sext i32 %88 to i64
  %90 = load i32* %1, align 4
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %91
  %93 = getelementptr inbounds %struct.string_data* %92, i32 0, i32 6
  %94 = getelementptr inbounds [160 x i32]* %93, i32 0, i64 %89
  %95 = load i32* %94, align 4
  call void @update_liberties(i32 %95)
  br label %96

; <label>:96                                      ; preds = %78
  %97 = load i32* %k, align 4
  %98 = add nsw i32 %97, 1
  store i32 %98, i32* %k, align 4
  br label %70

; <label>:99                                      ; preds = %70
  %100 = load i32* %1, align 4
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %101
  %103 = getelementptr inbounds %struct.string_data* %102, i32 0, i32 0
  %104 = load i32* %103, align 4
  %105 = icmp eq i32 %104, 1
  br i1 %105, label %106, label %114

; <label>:106                                     ; preds = %99
  %107 = load i32* %1, align 4
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %108
  %110 = getelementptr inbounds %struct.string_data* %109, i32 0, i32 1
  %111 = load i32* %110, align 4
  %112 = load i32* @white_captured, align 4
  %113 = add nsw i32 %112, %111
  store i32 %113, i32* @white_captured, align 4
  br label %122

; <label>:114                                     ; preds = %99
  %115 = load i32* %1, align 4
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %116
  %118 = getelementptr inbounds %struct.string_data* %117, i32 0, i32 1
  %119 = load i32* %118, align 4
  %120 = load i32* @black_captured, align 4
  %121 = add nsw i32 %120, %119
  store i32 %121, i32* @black_captured, align 4
  br label %122

; <label>:122                                     ; preds = %114, %106
  %123 = load i32* %1, align 4
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %124
  %126 = getelementptr inbounds %struct.string_data* %125, i32 0, i32 1
  %127 = load i32* %126, align 4
  ret i32 %127
}

; Function Attrs: nounwind uwtable
define internal void @do_commit_suicide(i32 %pos, i32 %color) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %pos, i32* %1, align 4
  store i32 %color, i32* %2, align 4
  %3 = load i32* %1, align 4
  %4 = add nsw i32 %3, 20
  %5 = sext i32 %4 to i64
  %6 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %5
  %7 = load i8* %6, align 1
  %8 = zext i8 %7 to i32
  %9 = load i32* %2, align 4
  %10 = icmp eq i32 %8, %9
  br i1 %10, label %11, label %18

; <label>:11                                      ; preds = %0
  %12 = load i32* %1, align 4
  %13 = add nsw i32 %12, 20
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %14
  %16 = load i32* %15, align 4
  %17 = call i32 @do_remove_string(i32 %16)
  br label %18

; <label>:18                                      ; preds = %11, %0
  %19 = load i32* %1, align 4
  %20 = sub nsw i32 %19, 1
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %21
  %23 = load i8* %22, align 1
  %24 = zext i8 %23 to i32
  %25 = load i32* %2, align 4
  %26 = icmp eq i32 %24, %25
  br i1 %26, label %27, label %34

; <label>:27                                      ; preds = %18
  %28 = load i32* %1, align 4
  %29 = sub nsw i32 %28, 1
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %30
  %32 = load i32* %31, align 4
  %33 = call i32 @do_remove_string(i32 %32)
  br label %34

; <label>:34                                      ; preds = %27, %18
  %35 = load i32* %1, align 4
  %36 = sub nsw i32 %35, 20
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %37
  %39 = load i8* %38, align 1
  %40 = zext i8 %39 to i32
  %41 = load i32* %2, align 4
  %42 = icmp eq i32 %40, %41
  br i1 %42, label %43, label %50

; <label>:43                                      ; preds = %34
  %44 = load i32* %1, align 4
  %45 = sub nsw i32 %44, 20
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %46
  %48 = load i32* %47, align 4
  %49 = call i32 @do_remove_string(i32 %48)
  br label %50

; <label>:50                                      ; preds = %43, %34
  %51 = load i32* %1, align 4
  %52 = add nsw i32 %51, 1
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %53
  %55 = load i8* %54, align 1
  %56 = zext i8 %55 to i32
  %57 = load i32* %2, align 4
  %58 = icmp eq i32 %56, %57
  br i1 %58, label %59, label %66

; <label>:59                                      ; preds = %50
  %60 = load i32* %1, align 4
  %61 = add nsw i32 %60, 1
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %62
  %64 = load i32* %63, align 4
  %65 = call i32 @do_remove_string(i32 %64)
  br label %66

; <label>:66                                      ; preds = %59, %50
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @remove_liberty(i32 %str_number, i32 %pos) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %k = alloca i32, align 4
  %s = alloca %struct.string_data*, align 8
  store i32 %str_number, i32* %1, align 4
  store i32 %pos, i32* %2, align 4
  %3 = load i32* %1, align 4
  %4 = sext i32 %3 to i64
  %5 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %4
  store %struct.string_data* %5, %struct.string_data** %s, align 8
  %6 = load %struct.string_data** %s, align 8
  %7 = getelementptr inbounds %struct.string_data* %6, i32 0, i32 3
  %8 = load i32* %7, align 4
  %9 = icmp sgt i32 %8, 20
  br i1 %9, label %10, label %12

; <label>:10                                      ; preds = %0
  %11 = load i32* %1, align 4
  call void @update_liberties(i32 %11)
  br label %100

; <label>:12                                      ; preds = %0
  store i32 0, i32* %k, align 4
  br label %13

; <label>:13                                      ; preds = %96, %12
  %14 = load i32* %k, align 4
  %15 = load %struct.string_data** %s, align 8
  %16 = getelementptr inbounds %struct.string_data* %15, i32 0, i32 3
  %17 = load i32* %16, align 4
  %18 = icmp slt i32 %14, %17
  br i1 %18, label %19, label %99

; <label>:19                                      ; preds = %13
  %20 = load i32* %k, align 4
  %21 = sext i32 %20 to i64
  %22 = load %struct.string_data** %s, align 8
  %23 = getelementptr inbounds %struct.string_data* %22, i32 0, i32 4
  %24 = getelementptr inbounds [20 x i32]* %23, i32 0, i64 %21
  %25 = load i32* %24, align 4
  %26 = load i32* %2, align 4
  %27 = icmp eq i32 %25, %26
  br i1 %27, label %28, label %95

; <label>:28                                      ; preds = %19
  %29 = load %struct.string_data** %s, align 8
  %30 = getelementptr inbounds %struct.string_data* %29, i32 0, i32 3
  %31 = load i32* %30, align 4
  %32 = sub nsw i32 %31, 1
  %33 = sext i32 %32 to i64
  %34 = load %struct.string_data** %s, align 8
  %35 = getelementptr inbounds %struct.string_data* %34, i32 0, i32 4
  %36 = getelementptr inbounds [20 x i32]* %35, i32 0, i64 %33
  %37 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %38 = getelementptr inbounds %struct.change_stack_entry* %37, i32 0, i32 0
  store i32* %36, i32** %38, align 8
  %39 = load %struct.string_data** %s, align 8
  %40 = getelementptr inbounds %struct.string_data* %39, i32 0, i32 3
  %41 = load i32* %40, align 4
  %42 = sub nsw i32 %41, 1
  %43 = sext i32 %42 to i64
  %44 = load %struct.string_data** %s, align 8
  %45 = getelementptr inbounds %struct.string_data* %44, i32 0, i32 4
  %46 = getelementptr inbounds [20 x i32]* %45, i32 0, i64 %43
  %47 = load i32* %46, align 4
  %48 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %49 = getelementptr inbounds %struct.change_stack_entry* %48, i32 1
  store %struct.change_stack_entry* %49, %struct.change_stack_entry** @change_stack_pointer, align 8
  %50 = getelementptr inbounds %struct.change_stack_entry* %48, i32 0, i32 1
  store i32 %47, i32* %50, align 4
  %51 = load i32* %k, align 4
  %52 = sext i32 %51 to i64
  %53 = load %struct.string_data** %s, align 8
  %54 = getelementptr inbounds %struct.string_data* %53, i32 0, i32 4
  %55 = getelementptr inbounds [20 x i32]* %54, i32 0, i64 %52
  %56 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %57 = getelementptr inbounds %struct.change_stack_entry* %56, i32 0, i32 0
  store i32* %55, i32** %57, align 8
  %58 = load i32* %k, align 4
  %59 = sext i32 %58 to i64
  %60 = load %struct.string_data** %s, align 8
  %61 = getelementptr inbounds %struct.string_data* %60, i32 0, i32 4
  %62 = getelementptr inbounds [20 x i32]* %61, i32 0, i64 %59
  %63 = load i32* %62, align 4
  %64 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %65 = getelementptr inbounds %struct.change_stack_entry* %64, i32 1
  store %struct.change_stack_entry* %65, %struct.change_stack_entry** @change_stack_pointer, align 8
  %66 = getelementptr inbounds %struct.change_stack_entry* %64, i32 0, i32 1
  store i32 %63, i32* %66, align 4
  %67 = load %struct.string_data** %s, align 8
  %68 = getelementptr inbounds %struct.string_data* %67, i32 0, i32 3
  %69 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %70 = getelementptr inbounds %struct.change_stack_entry* %69, i32 0, i32 0
  store i32* %68, i32** %70, align 8
  %71 = load %struct.string_data** %s, align 8
  %72 = getelementptr inbounds %struct.string_data* %71, i32 0, i32 3
  %73 = load i32* %72, align 4
  %74 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %75 = getelementptr inbounds %struct.change_stack_entry* %74, i32 1
  store %struct.change_stack_entry* %75, %struct.change_stack_entry** @change_stack_pointer, align 8
  %76 = getelementptr inbounds %struct.change_stack_entry* %74, i32 0, i32 1
  store i32 %73, i32* %76, align 4
  %77 = load %struct.string_data** %s, align 8
  %78 = getelementptr inbounds %struct.string_data* %77, i32 0, i32 3
  %79 = load i32* %78, align 4
  %80 = sub nsw i32 %79, 1
  %81 = sext i32 %80 to i64
  %82 = load %struct.string_data** %s, align 8
  %83 = getelementptr inbounds %struct.string_data* %82, i32 0, i32 4
  %84 = getelementptr inbounds [20 x i32]* %83, i32 0, i64 %81
  %85 = load i32* %84, align 4
  %86 = load i32* %k, align 4
  %87 = sext i32 %86 to i64
  %88 = load %struct.string_data** %s, align 8
  %89 = getelementptr inbounds %struct.string_data* %88, i32 0, i32 4
  %90 = getelementptr inbounds [20 x i32]* %89, i32 0, i64 %87
  store i32 %85, i32* %90, align 4
  %91 = load %struct.string_data** %s, align 8
  %92 = getelementptr inbounds %struct.string_data* %91, i32 0, i32 3
  %93 = load i32* %92, align 4
  %94 = add nsw i32 %93, -1
  store i32 %94, i32* %92, align 4
  br label %99

; <label>:95                                      ; preds = %19
  br label %96

; <label>:96                                      ; preds = %95
  %97 = load i32* %k, align 4
  %98 = add nsw i32 %97, 1
  store i32 %98, i32* %k, align 4
  br label %13

; <label>:99                                      ; preds = %28, %13
  br label %100

; <label>:100                                     ; preds = %99, %10
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @create_new_string(i32 %pos) #0 {
  %1 = alloca i32, align 4
  %s = alloca i32, align 4
  %color = alloca i32, align 4
  %other = alloca i32, align 4
  %s2 = alloca i32, align 4
  %s21 = alloca i32, align 4
  %s22 = alloca i32, align 4
  %s23 = alloca i32, align 4
  store i32 %pos, i32* %1, align 4
  %2 = load i32* %1, align 4
  %3 = sext i32 %2 to i64
  %4 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %3
  %5 = load i8* %4, align 1
  %6 = zext i8 %5 to i32
  store i32 %6, i32* %color, align 4
  %7 = load i32* %color, align 4
  %8 = sub nsw i32 3, %7
  store i32 %8, i32* %other, align 4
  %9 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %10 = getelementptr inbounds %struct.change_stack_entry* %9, i32 0, i32 0
  store i32* @next_string, i32** %10, align 8
  %11 = load i32* @next_string, align 4
  %12 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %13 = getelementptr inbounds %struct.change_stack_entry* %12, i32 1
  store %struct.change_stack_entry* %13, %struct.change_stack_entry** @change_stack_pointer, align 8
  %14 = getelementptr inbounds %struct.change_stack_entry* %12, i32 0, i32 1
  store i32 %11, i32* %14, align 4
  %15 = load i32* @next_string, align 4
  %16 = add nsw i32 %15, 1
  store i32 %16, i32* @next_string, align 4
  store i32 %15, i32* %s, align 4
  %17 = load i32* %s, align 4
  %18 = load i32* %1, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %19
  store i32 %17, i32* %20, align 4
  %21 = load i32* %1, align 4
  %22 = load i32* %1, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [400 x i32]* @next_stone, i32 0, i64 %23
  store i32 %21, i32* %24, align 4
  %25 = load i32* %color, align 4
  %26 = load i32* %s, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %27
  %29 = getelementptr inbounds %struct.string_data* %28, i32 0, i32 0
  store i32 %25, i32* %29, align 4
  %30 = load i32* %s, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %31
  %33 = getelementptr inbounds %struct.string_data* %32, i32 0, i32 1
  store i32 1, i32* %33, align 4
  %34 = load i32* %1, align 4
  %35 = load i32* %s, align 4
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %36
  %38 = getelementptr inbounds %struct.string_data* %37, i32 0, i32 2
  store i32 %34, i32* %38, align 4
  %39 = load i32* %s, align 4
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %40
  %42 = getelementptr inbounds %struct.string_data* %41, i32 0, i32 3
  store i32 0, i32* %42, align 4
  %43 = load i32* %s, align 4
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %44
  %46 = getelementptr inbounds %struct.string_data* %45, i32 0, i32 5
  store i32 0, i32* %46, align 4
  %47 = load i32* %s, align 4
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %48
  %50 = getelementptr inbounds %struct.string_data* %49, i32 0, i32 7
  store i32 0, i32* %50, align 4
  %51 = load i32* @string_mark, align 4
  %52 = add nsw i32 %51, 1
  store i32 %52, i32* @string_mark, align 4
  %53 = load i32* %1, align 4
  %54 = add nsw i32 %53, 20
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %55
  %57 = load i8* %56, align 1
  %58 = zext i8 %57 to i32
  %59 = icmp eq i32 %58, 0
  br i1 %59, label %60, label %90

; <label>:60                                      ; preds = %0
  br label %61

; <label>:61                                      ; preds = %60
  %62 = load i32* %s, align 4
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %63
  %65 = getelementptr inbounds %struct.string_data* %64, i32 0, i32 3
  %66 = load i32* %65, align 4
  %67 = icmp slt i32 %66, 20
  br i1 %67, label %68, label %82

; <label>:68                                      ; preds = %61
  %69 = load i32* %1, align 4
  %70 = add nsw i32 %69, 20
  %71 = load i32* %s, align 4
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %72
  %74 = getelementptr inbounds %struct.string_data* %73, i32 0, i32 3
  %75 = load i32* %74, align 4
  %76 = sext i32 %75 to i64
  %77 = load i32* %s, align 4
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %78
  %80 = getelementptr inbounds %struct.string_data* %79, i32 0, i32 4
  %81 = getelementptr inbounds [20 x i32]* %80, i32 0, i64 %76
  store i32 %70, i32* %81, align 4
  br label %82

; <label>:82                                      ; preds = %68, %61
  %83 = load i32* %s, align 4
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %84
  %86 = getelementptr inbounds %struct.string_data* %85, i32 0, i32 3
  %87 = load i32* %86, align 4
  %88 = add nsw i32 %87, 1
  store i32 %88, i32* %86, align 4
  br label %89

; <label>:89                                      ; preds = %82
  br label %174

; <label>:90                                      ; preds = %0
  %91 = load i32* %1, align 4
  %92 = add nsw i32 %91, 20
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %93
  %95 = load i8* %94, align 1
  %96 = zext i8 %95 to i32
  %97 = load i32* %other, align 4
  %98 = icmp eq i32 %96, %97
  br i1 %98, label %99, label %173

; <label>:99                                      ; preds = %90
  %100 = load i32* %1, align 4
  %101 = add nsw i32 %100, 20
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %102
  %104 = load i32* %103, align 4
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %105
  %107 = getelementptr inbounds %struct.string_data* %106, i32 0, i32 7
  %108 = load i32* %107, align 4
  %109 = load i32* @string_mark, align 4
  %110 = icmp ne i32 %108, %109
  br i1 %110, label %111, label %173

; <label>:111                                     ; preds = %99
  %112 = load i32* %1, align 4
  %113 = add nsw i32 %112, 20
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %114
  %116 = load i32* %115, align 4
  store i32 %116, i32* %s2, align 4
  %117 = load i32* %1, align 4
  %118 = add nsw i32 %117, 20
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %119
  %121 = load i32* %120, align 4
  %122 = load i32* %s, align 4
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %123
  %125 = getelementptr inbounds %struct.string_data* %124, i32 0, i32 5
  %126 = load i32* %125, align 4
  %127 = add nsw i32 %126, 1
  store i32 %127, i32* %125, align 4
  %128 = sext i32 %126 to i64
  %129 = load i32* %s, align 4
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %130
  %132 = getelementptr inbounds %struct.string_data* %131, i32 0, i32 6
  %133 = getelementptr inbounds [160 x i32]* %132, i32 0, i64 %128
  store i32 %121, i32* %133, align 4
  %134 = load i32* %s2, align 4
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %135
  %137 = getelementptr inbounds %struct.string_data* %136, i32 0, i32 5
  %138 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %139 = getelementptr inbounds %struct.change_stack_entry* %138, i32 0, i32 0
  store i32* %137, i32** %139, align 8
  %140 = load i32* %s2, align 4
  %141 = sext i32 %140 to i64
  %142 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %141
  %143 = getelementptr inbounds %struct.string_data* %142, i32 0, i32 5
  %144 = load i32* %143, align 4
  %145 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %146 = getelementptr inbounds %struct.change_stack_entry* %145, i32 1
  store %struct.change_stack_entry* %146, %struct.change_stack_entry** @change_stack_pointer, align 8
  %147 = getelementptr inbounds %struct.change_stack_entry* %145, i32 0, i32 1
  store i32 %144, i32* %147, align 4
  %148 = load i32* %1, align 4
  %149 = sext i32 %148 to i64
  %150 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %149
  %151 = load i32* %150, align 4
  %152 = load i32* %s2, align 4
  %153 = sext i32 %152 to i64
  %154 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %153
  %155 = getelementptr inbounds %struct.string_data* %154, i32 0, i32 5
  %156 = load i32* %155, align 4
  %157 = add nsw i32 %156, 1
  store i32 %157, i32* %155, align 4
  %158 = sext i32 %156 to i64
  %159 = load i32* %s2, align 4
  %160 = sext i32 %159 to i64
  %161 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %160
  %162 = getelementptr inbounds %struct.string_data* %161, i32 0, i32 6
  %163 = getelementptr inbounds [160 x i32]* %162, i32 0, i64 %158
  store i32 %151, i32* %163, align 4
  %164 = load i32* @string_mark, align 4
  %165 = load i32* %1, align 4
  %166 = add nsw i32 %165, 20
  %167 = sext i32 %166 to i64
  %168 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %167
  %169 = load i32* %168, align 4
  %170 = sext i32 %169 to i64
  %171 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %170
  %172 = getelementptr inbounds %struct.string_data* %171, i32 0, i32 7
  store i32 %164, i32* %172, align 4
  br label %173

; <label>:173                                     ; preds = %111, %99, %90
  br label %174

; <label>:174                                     ; preds = %173, %89
  %175 = load i32* %1, align 4
  %176 = sub nsw i32 %175, 1
  %177 = sext i32 %176 to i64
  %178 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %177
  %179 = load i8* %178, align 1
  %180 = zext i8 %179 to i32
  %181 = icmp eq i32 %180, 0
  br i1 %181, label %182, label %212

; <label>:182                                     ; preds = %174
  br label %183

; <label>:183                                     ; preds = %182
  %184 = load i32* %s, align 4
  %185 = sext i32 %184 to i64
  %186 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %185
  %187 = getelementptr inbounds %struct.string_data* %186, i32 0, i32 3
  %188 = load i32* %187, align 4
  %189 = icmp slt i32 %188, 20
  br i1 %189, label %190, label %204

; <label>:190                                     ; preds = %183
  %191 = load i32* %1, align 4
  %192 = sub nsw i32 %191, 1
  %193 = load i32* %s, align 4
  %194 = sext i32 %193 to i64
  %195 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %194
  %196 = getelementptr inbounds %struct.string_data* %195, i32 0, i32 3
  %197 = load i32* %196, align 4
  %198 = sext i32 %197 to i64
  %199 = load i32* %s, align 4
  %200 = sext i32 %199 to i64
  %201 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %200
  %202 = getelementptr inbounds %struct.string_data* %201, i32 0, i32 4
  %203 = getelementptr inbounds [20 x i32]* %202, i32 0, i64 %198
  store i32 %192, i32* %203, align 4
  br label %204

; <label>:204                                     ; preds = %190, %183
  %205 = load i32* %s, align 4
  %206 = sext i32 %205 to i64
  %207 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %206
  %208 = getelementptr inbounds %struct.string_data* %207, i32 0, i32 3
  %209 = load i32* %208, align 4
  %210 = add nsw i32 %209, 1
  store i32 %210, i32* %208, align 4
  br label %211

; <label>:211                                     ; preds = %204
  br label %296

; <label>:212                                     ; preds = %174
  %213 = load i32* %1, align 4
  %214 = sub nsw i32 %213, 1
  %215 = sext i32 %214 to i64
  %216 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %215
  %217 = load i8* %216, align 1
  %218 = zext i8 %217 to i32
  %219 = load i32* %other, align 4
  %220 = icmp eq i32 %218, %219
  br i1 %220, label %221, label %295

; <label>:221                                     ; preds = %212
  %222 = load i32* %1, align 4
  %223 = sub nsw i32 %222, 1
  %224 = sext i32 %223 to i64
  %225 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %224
  %226 = load i32* %225, align 4
  %227 = sext i32 %226 to i64
  %228 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %227
  %229 = getelementptr inbounds %struct.string_data* %228, i32 0, i32 7
  %230 = load i32* %229, align 4
  %231 = load i32* @string_mark, align 4
  %232 = icmp ne i32 %230, %231
  br i1 %232, label %233, label %295

; <label>:233                                     ; preds = %221
  %234 = load i32* %1, align 4
  %235 = sub nsw i32 %234, 1
  %236 = sext i32 %235 to i64
  %237 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %236
  %238 = load i32* %237, align 4
  store i32 %238, i32* %s21, align 4
  %239 = load i32* %1, align 4
  %240 = sub nsw i32 %239, 1
  %241 = sext i32 %240 to i64
  %242 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %241
  %243 = load i32* %242, align 4
  %244 = load i32* %s, align 4
  %245 = sext i32 %244 to i64
  %246 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %245
  %247 = getelementptr inbounds %struct.string_data* %246, i32 0, i32 5
  %248 = load i32* %247, align 4
  %249 = add nsw i32 %248, 1
  store i32 %249, i32* %247, align 4
  %250 = sext i32 %248 to i64
  %251 = load i32* %s, align 4
  %252 = sext i32 %251 to i64
  %253 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %252
  %254 = getelementptr inbounds %struct.string_data* %253, i32 0, i32 6
  %255 = getelementptr inbounds [160 x i32]* %254, i32 0, i64 %250
  store i32 %243, i32* %255, align 4
  %256 = load i32* %s21, align 4
  %257 = sext i32 %256 to i64
  %258 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %257
  %259 = getelementptr inbounds %struct.string_data* %258, i32 0, i32 5
  %260 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %261 = getelementptr inbounds %struct.change_stack_entry* %260, i32 0, i32 0
  store i32* %259, i32** %261, align 8
  %262 = load i32* %s21, align 4
  %263 = sext i32 %262 to i64
  %264 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %263
  %265 = getelementptr inbounds %struct.string_data* %264, i32 0, i32 5
  %266 = load i32* %265, align 4
  %267 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %268 = getelementptr inbounds %struct.change_stack_entry* %267, i32 1
  store %struct.change_stack_entry* %268, %struct.change_stack_entry** @change_stack_pointer, align 8
  %269 = getelementptr inbounds %struct.change_stack_entry* %267, i32 0, i32 1
  store i32 %266, i32* %269, align 4
  %270 = load i32* %1, align 4
  %271 = sext i32 %270 to i64
  %272 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %271
  %273 = load i32* %272, align 4
  %274 = load i32* %s21, align 4
  %275 = sext i32 %274 to i64
  %276 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %275
  %277 = getelementptr inbounds %struct.string_data* %276, i32 0, i32 5
  %278 = load i32* %277, align 4
  %279 = add nsw i32 %278, 1
  store i32 %279, i32* %277, align 4
  %280 = sext i32 %278 to i64
  %281 = load i32* %s21, align 4
  %282 = sext i32 %281 to i64
  %283 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %282
  %284 = getelementptr inbounds %struct.string_data* %283, i32 0, i32 6
  %285 = getelementptr inbounds [160 x i32]* %284, i32 0, i64 %280
  store i32 %273, i32* %285, align 4
  %286 = load i32* @string_mark, align 4
  %287 = load i32* %1, align 4
  %288 = sub nsw i32 %287, 1
  %289 = sext i32 %288 to i64
  %290 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %289
  %291 = load i32* %290, align 4
  %292 = sext i32 %291 to i64
  %293 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %292
  %294 = getelementptr inbounds %struct.string_data* %293, i32 0, i32 7
  store i32 %286, i32* %294, align 4
  br label %295

; <label>:295                                     ; preds = %233, %221, %212
  br label %296

; <label>:296                                     ; preds = %295, %211
  %297 = load i32* %1, align 4
  %298 = sub nsw i32 %297, 20
  %299 = sext i32 %298 to i64
  %300 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %299
  %301 = load i8* %300, align 1
  %302 = zext i8 %301 to i32
  %303 = icmp eq i32 %302, 0
  br i1 %303, label %304, label %334

; <label>:304                                     ; preds = %296
  br label %305

; <label>:305                                     ; preds = %304
  %306 = load i32* %s, align 4
  %307 = sext i32 %306 to i64
  %308 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %307
  %309 = getelementptr inbounds %struct.string_data* %308, i32 0, i32 3
  %310 = load i32* %309, align 4
  %311 = icmp slt i32 %310, 20
  br i1 %311, label %312, label %326

; <label>:312                                     ; preds = %305
  %313 = load i32* %1, align 4
  %314 = sub nsw i32 %313, 20
  %315 = load i32* %s, align 4
  %316 = sext i32 %315 to i64
  %317 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %316
  %318 = getelementptr inbounds %struct.string_data* %317, i32 0, i32 3
  %319 = load i32* %318, align 4
  %320 = sext i32 %319 to i64
  %321 = load i32* %s, align 4
  %322 = sext i32 %321 to i64
  %323 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %322
  %324 = getelementptr inbounds %struct.string_data* %323, i32 0, i32 4
  %325 = getelementptr inbounds [20 x i32]* %324, i32 0, i64 %320
  store i32 %314, i32* %325, align 4
  br label %326

; <label>:326                                     ; preds = %312, %305
  %327 = load i32* %s, align 4
  %328 = sext i32 %327 to i64
  %329 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %328
  %330 = getelementptr inbounds %struct.string_data* %329, i32 0, i32 3
  %331 = load i32* %330, align 4
  %332 = add nsw i32 %331, 1
  store i32 %332, i32* %330, align 4
  br label %333

; <label>:333                                     ; preds = %326
  br label %418

; <label>:334                                     ; preds = %296
  %335 = load i32* %1, align 4
  %336 = sub nsw i32 %335, 20
  %337 = sext i32 %336 to i64
  %338 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %337
  %339 = load i8* %338, align 1
  %340 = zext i8 %339 to i32
  %341 = load i32* %other, align 4
  %342 = icmp eq i32 %340, %341
  br i1 %342, label %343, label %417

; <label>:343                                     ; preds = %334
  %344 = load i32* %1, align 4
  %345 = sub nsw i32 %344, 20
  %346 = sext i32 %345 to i64
  %347 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %346
  %348 = load i32* %347, align 4
  %349 = sext i32 %348 to i64
  %350 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %349
  %351 = getelementptr inbounds %struct.string_data* %350, i32 0, i32 7
  %352 = load i32* %351, align 4
  %353 = load i32* @string_mark, align 4
  %354 = icmp ne i32 %352, %353
  br i1 %354, label %355, label %417

; <label>:355                                     ; preds = %343
  %356 = load i32* %1, align 4
  %357 = sub nsw i32 %356, 20
  %358 = sext i32 %357 to i64
  %359 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %358
  %360 = load i32* %359, align 4
  store i32 %360, i32* %s22, align 4
  %361 = load i32* %1, align 4
  %362 = sub nsw i32 %361, 20
  %363 = sext i32 %362 to i64
  %364 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %363
  %365 = load i32* %364, align 4
  %366 = load i32* %s, align 4
  %367 = sext i32 %366 to i64
  %368 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %367
  %369 = getelementptr inbounds %struct.string_data* %368, i32 0, i32 5
  %370 = load i32* %369, align 4
  %371 = add nsw i32 %370, 1
  store i32 %371, i32* %369, align 4
  %372 = sext i32 %370 to i64
  %373 = load i32* %s, align 4
  %374 = sext i32 %373 to i64
  %375 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %374
  %376 = getelementptr inbounds %struct.string_data* %375, i32 0, i32 6
  %377 = getelementptr inbounds [160 x i32]* %376, i32 0, i64 %372
  store i32 %365, i32* %377, align 4
  %378 = load i32* %s22, align 4
  %379 = sext i32 %378 to i64
  %380 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %379
  %381 = getelementptr inbounds %struct.string_data* %380, i32 0, i32 5
  %382 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %383 = getelementptr inbounds %struct.change_stack_entry* %382, i32 0, i32 0
  store i32* %381, i32** %383, align 8
  %384 = load i32* %s22, align 4
  %385 = sext i32 %384 to i64
  %386 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %385
  %387 = getelementptr inbounds %struct.string_data* %386, i32 0, i32 5
  %388 = load i32* %387, align 4
  %389 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %390 = getelementptr inbounds %struct.change_stack_entry* %389, i32 1
  store %struct.change_stack_entry* %390, %struct.change_stack_entry** @change_stack_pointer, align 8
  %391 = getelementptr inbounds %struct.change_stack_entry* %389, i32 0, i32 1
  store i32 %388, i32* %391, align 4
  %392 = load i32* %1, align 4
  %393 = sext i32 %392 to i64
  %394 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %393
  %395 = load i32* %394, align 4
  %396 = load i32* %s22, align 4
  %397 = sext i32 %396 to i64
  %398 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %397
  %399 = getelementptr inbounds %struct.string_data* %398, i32 0, i32 5
  %400 = load i32* %399, align 4
  %401 = add nsw i32 %400, 1
  store i32 %401, i32* %399, align 4
  %402 = sext i32 %400 to i64
  %403 = load i32* %s22, align 4
  %404 = sext i32 %403 to i64
  %405 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %404
  %406 = getelementptr inbounds %struct.string_data* %405, i32 0, i32 6
  %407 = getelementptr inbounds [160 x i32]* %406, i32 0, i64 %402
  store i32 %395, i32* %407, align 4
  %408 = load i32* @string_mark, align 4
  %409 = load i32* %1, align 4
  %410 = sub nsw i32 %409, 20
  %411 = sext i32 %410 to i64
  %412 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %411
  %413 = load i32* %412, align 4
  %414 = sext i32 %413 to i64
  %415 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %414
  %416 = getelementptr inbounds %struct.string_data* %415, i32 0, i32 7
  store i32 %408, i32* %416, align 4
  br label %417

; <label>:417                                     ; preds = %355, %343, %334
  br label %418

; <label>:418                                     ; preds = %417, %333
  %419 = load i32* %1, align 4
  %420 = add nsw i32 %419, 1
  %421 = sext i32 %420 to i64
  %422 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %421
  %423 = load i8* %422, align 1
  %424 = zext i8 %423 to i32
  %425 = icmp eq i32 %424, 0
  br i1 %425, label %426, label %456

; <label>:426                                     ; preds = %418
  br label %427

; <label>:427                                     ; preds = %426
  %428 = load i32* %s, align 4
  %429 = sext i32 %428 to i64
  %430 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %429
  %431 = getelementptr inbounds %struct.string_data* %430, i32 0, i32 3
  %432 = load i32* %431, align 4
  %433 = icmp slt i32 %432, 20
  br i1 %433, label %434, label %448

; <label>:434                                     ; preds = %427
  %435 = load i32* %1, align 4
  %436 = add nsw i32 %435, 1
  %437 = load i32* %s, align 4
  %438 = sext i32 %437 to i64
  %439 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %438
  %440 = getelementptr inbounds %struct.string_data* %439, i32 0, i32 3
  %441 = load i32* %440, align 4
  %442 = sext i32 %441 to i64
  %443 = load i32* %s, align 4
  %444 = sext i32 %443 to i64
  %445 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %444
  %446 = getelementptr inbounds %struct.string_data* %445, i32 0, i32 4
  %447 = getelementptr inbounds [20 x i32]* %446, i32 0, i64 %442
  store i32 %436, i32* %447, align 4
  br label %448

; <label>:448                                     ; preds = %434, %427
  %449 = load i32* %s, align 4
  %450 = sext i32 %449 to i64
  %451 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %450
  %452 = getelementptr inbounds %struct.string_data* %451, i32 0, i32 3
  %453 = load i32* %452, align 4
  %454 = add nsw i32 %453, 1
  store i32 %454, i32* %452, align 4
  br label %455

; <label>:455                                     ; preds = %448
  br label %531

; <label>:456                                     ; preds = %418
  %457 = load i32* %1, align 4
  %458 = add nsw i32 %457, 1
  %459 = sext i32 %458 to i64
  %460 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %459
  %461 = load i8* %460, align 1
  %462 = zext i8 %461 to i32
  %463 = load i32* %other, align 4
  %464 = icmp eq i32 %462, %463
  br i1 %464, label %465, label %530

; <label>:465                                     ; preds = %456
  %466 = load i32* %1, align 4
  %467 = add nsw i32 %466, 1
  %468 = sext i32 %467 to i64
  %469 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %468
  %470 = load i32* %469, align 4
  %471 = sext i32 %470 to i64
  %472 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %471
  %473 = getelementptr inbounds %struct.string_data* %472, i32 0, i32 7
  %474 = load i32* %473, align 4
  %475 = load i32* @string_mark, align 4
  %476 = icmp ne i32 %474, %475
  br i1 %476, label %477, label %530

; <label>:477                                     ; preds = %465
  %478 = load i32* %1, align 4
  %479 = add nsw i32 %478, 1
  %480 = sext i32 %479 to i64
  %481 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %480
  %482 = load i32* %481, align 4
  store i32 %482, i32* %s23, align 4
  %483 = load i32* %1, align 4
  %484 = add nsw i32 %483, 1
  %485 = sext i32 %484 to i64
  %486 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %485
  %487 = load i32* %486, align 4
  %488 = load i32* %s, align 4
  %489 = sext i32 %488 to i64
  %490 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %489
  %491 = getelementptr inbounds %struct.string_data* %490, i32 0, i32 5
  %492 = load i32* %491, align 4
  %493 = add nsw i32 %492, 1
  store i32 %493, i32* %491, align 4
  %494 = sext i32 %492 to i64
  %495 = load i32* %s, align 4
  %496 = sext i32 %495 to i64
  %497 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %496
  %498 = getelementptr inbounds %struct.string_data* %497, i32 0, i32 6
  %499 = getelementptr inbounds [160 x i32]* %498, i32 0, i64 %494
  store i32 %487, i32* %499, align 4
  %500 = load i32* %s23, align 4
  %501 = sext i32 %500 to i64
  %502 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %501
  %503 = getelementptr inbounds %struct.string_data* %502, i32 0, i32 5
  %504 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %505 = getelementptr inbounds %struct.change_stack_entry* %504, i32 0, i32 0
  store i32* %503, i32** %505, align 8
  %506 = load i32* %s23, align 4
  %507 = sext i32 %506 to i64
  %508 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %507
  %509 = getelementptr inbounds %struct.string_data* %508, i32 0, i32 5
  %510 = load i32* %509, align 4
  %511 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %512 = getelementptr inbounds %struct.change_stack_entry* %511, i32 1
  store %struct.change_stack_entry* %512, %struct.change_stack_entry** @change_stack_pointer, align 8
  %513 = getelementptr inbounds %struct.change_stack_entry* %511, i32 0, i32 1
  store i32 %510, i32* %513, align 4
  %514 = load i32* %1, align 4
  %515 = sext i32 %514 to i64
  %516 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %515
  %517 = load i32* %516, align 4
  %518 = load i32* %s23, align 4
  %519 = sext i32 %518 to i64
  %520 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %519
  %521 = getelementptr inbounds %struct.string_data* %520, i32 0, i32 5
  %522 = load i32* %521, align 4
  %523 = add nsw i32 %522, 1
  store i32 %523, i32* %521, align 4
  %524 = sext i32 %522 to i64
  %525 = load i32* %s23, align 4
  %526 = sext i32 %525 to i64
  %527 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %526
  %528 = getelementptr inbounds %struct.string_data* %527, i32 0, i32 6
  %529 = getelementptr inbounds [160 x i32]* %528, i32 0, i64 %524
  store i32 %517, i32* %529, align 4
  br label %530

; <label>:530                                     ; preds = %477, %465, %456
  br label %531

; <label>:531                                     ; preds = %530, %455
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @extend_neighbor_string(i32 %pos, i32 %s) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %k = alloca i32, align 4
  %liberties_updated = alloca i32, align 4
  %color = alloca i32, align 4
  %other = alloca i32, align 4
  %pos2 = alloca i32, align 4
  %s2 = alloca i32, align 4
  %s21 = alloca i32, align 4
  %s22 = alloca i32, align 4
  %s23 = alloca i32, align 4
  store i32 %pos, i32* %1, align 4
  store i32 %s, i32* %2, align 4
  store i32 0, i32* %liberties_updated, align 4
  %3 = load i32* %1, align 4
  %4 = sext i32 %3 to i64
  %5 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %4
  %6 = load i8* %5, align 1
  %7 = zext i8 %6 to i32
  store i32 %7, i32* %color, align 4
  %8 = load i32* %color, align 4
  %9 = sub nsw i32 3, %8
  store i32 %9, i32* %other, align 4
  %10 = load i32* %2, align 4
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %11
  %13 = getelementptr inbounds %struct.string_data* %12, i32 0, i32 2
  %14 = load i32* %13, align 4
  store i32 %14, i32* %pos2, align 4
  %15 = load i32* %pos2, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [400 x i32]* @next_stone, i32 0, i64 %16
  %18 = load i32* %17, align 4
  %19 = load i32* %1, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [400 x i32]* @next_stone, i32 0, i64 %20
  store i32 %18, i32* %21, align 4
  %22 = load i32* %pos2, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [400 x i32]* @next_stone, i32 0, i64 %23
  %25 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %26 = getelementptr inbounds %struct.change_stack_entry* %25, i32 0, i32 0
  store i32* %24, i32** %26, align 8
  %27 = load i32* %pos2, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds [400 x i32]* @next_stone, i32 0, i64 %28
  %30 = load i32* %29, align 4
  %31 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %32 = getelementptr inbounds %struct.change_stack_entry* %31, i32 1
  store %struct.change_stack_entry* %32, %struct.change_stack_entry** @change_stack_pointer, align 8
  %33 = getelementptr inbounds %struct.change_stack_entry* %31, i32 0, i32 1
  store i32 %30, i32* %33, align 4
  %34 = load i32* %1, align 4
  %35 = load i32* %pos2, align 4
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds [400 x i32]* @next_stone, i32 0, i64 %36
  store i32 %34, i32* %37, align 4
  %38 = load i32* %1, align 4
  %39 = load i32* %pos2, align 4
  %40 = icmp slt i32 %38, %39
  br i1 %40, label %41, label %61

; <label>:41                                      ; preds = %0
  %42 = load i32* %2, align 4
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %43
  %45 = getelementptr inbounds %struct.string_data* %44, i32 0, i32 2
  %46 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %47 = getelementptr inbounds %struct.change_stack_entry* %46, i32 0, i32 0
  store i32* %45, i32** %47, align 8
  %48 = load i32* %2, align 4
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %49
  %51 = getelementptr inbounds %struct.string_data* %50, i32 0, i32 2
  %52 = load i32* %51, align 4
  %53 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %54 = getelementptr inbounds %struct.change_stack_entry* %53, i32 1
  store %struct.change_stack_entry* %54, %struct.change_stack_entry** @change_stack_pointer, align 8
  %55 = getelementptr inbounds %struct.change_stack_entry* %53, i32 0, i32 1
  store i32 %52, i32* %55, align 4
  %56 = load i32* %1, align 4
  %57 = load i32* %2, align 4
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %58
  %60 = getelementptr inbounds %struct.string_data* %59, i32 0, i32 2
  store i32 %56, i32* %60, align 4
  br label %61

; <label>:61                                      ; preds = %41, %0
  %62 = load i32* %2, align 4
  %63 = load i32* %1, align 4
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %64
  store i32 %62, i32* %65, align 4
  %66 = load i32* %2, align 4
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %67
  %69 = getelementptr inbounds %struct.string_data* %68, i32 0, i32 1
  %70 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %71 = getelementptr inbounds %struct.change_stack_entry* %70, i32 0, i32 0
  store i32* %69, i32** %71, align 8
  %72 = load i32* %2, align 4
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %73
  %75 = getelementptr inbounds %struct.string_data* %74, i32 0, i32 1
  %76 = load i32* %75, align 4
  %77 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %78 = getelementptr inbounds %struct.change_stack_entry* %77, i32 1
  store %struct.change_stack_entry* %78, %struct.change_stack_entry** @change_stack_pointer, align 8
  %79 = getelementptr inbounds %struct.change_stack_entry* %77, i32 0, i32 1
  store i32 %76, i32* %79, align 4
  %80 = load i32* %2, align 4
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %81
  %83 = getelementptr inbounds %struct.string_data* %82, i32 0, i32 1
  %84 = load i32* %83, align 4
  %85 = add nsw i32 %84, 1
  store i32 %85, i32* %83, align 4
  %86 = load i32* %2, align 4
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %87
  %89 = getelementptr inbounds %struct.string_data* %88, i32 0, i32 3
  %90 = load i32* %89, align 4
  %91 = icmp sgt i32 %90, 20
  br i1 %91, label %92, label %94

; <label>:92                                      ; preds = %61
  %93 = load i32* %2, align 4
  call void @update_liberties(i32 %93)
  store i32 1, i32* %liberties_updated, align 4
  br label %97

; <label>:94                                      ; preds = %61
  %95 = load i32* %2, align 4
  %96 = load i32* %1, align 4
  call void @remove_liberty(i32 %95, i32 %96)
  br label %97

; <label>:97                                      ; preds = %94, %92
  %98 = load i32* @string_mark, align 4
  %99 = add nsw i32 %98, 1
  store i32 %99, i32* @string_mark, align 4
  store i32 0, i32* %k, align 4
  br label %100

; <label>:100                                     ; preds = %121, %97
  %101 = load i32* %k, align 4
  %102 = load i32* %2, align 4
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %103
  %105 = getelementptr inbounds %struct.string_data* %104, i32 0, i32 5
  %106 = load i32* %105, align 4
  %107 = icmp slt i32 %101, %106
  br i1 %107, label %108, label %124

; <label>:108                                     ; preds = %100
  %109 = load i32* @string_mark, align 4
  %110 = load i32* %k, align 4
  %111 = sext i32 %110 to i64
  %112 = load i32* %2, align 4
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %113
  %115 = getelementptr inbounds %struct.string_data* %114, i32 0, i32 6
  %116 = getelementptr inbounds [160 x i32]* %115, i32 0, i64 %111
  %117 = load i32* %116, align 4
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %118
  %120 = getelementptr inbounds %struct.string_data* %119, i32 0, i32 7
  store i32 %109, i32* %120, align 4
  br label %121

; <label>:121                                     ; preds = %108
  %122 = load i32* %k, align 4
  %123 = add nsw i32 %122, 1
  store i32 %123, i32* %k, align 4
  br label %100

; <label>:124                                     ; preds = %100
  %125 = load i32* %1, align 4
  %126 = add nsw i32 %125, 20
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %127
  %129 = load i8* %128, align 1
  %130 = zext i8 %129 to i32
  %131 = icmp eq i32 %130, 0
  br i1 %131, label %132, label %223

; <label>:132                                     ; preds = %124
  %133 = load i32* %liberties_updated, align 4
  %134 = icmp ne i32 %133, 0
  br i1 %134, label %222, label %135

; <label>:135                                     ; preds = %132
  %136 = load i32* %1, align 4
  %137 = add nsw i32 %136, 20
  %138 = add nsw i32 %137, 20
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %139
  %141 = load i8* %140, align 1
  %142 = zext i8 %141 to i32
  %143 = load i32* %color, align 4
  %144 = icmp eq i32 %142, %143
  br i1 %144, label %145, label %154

; <label>:145                                     ; preds = %135
  %146 = load i32* %1, align 4
  %147 = add nsw i32 %146, 20
  %148 = add nsw i32 %147, 20
  %149 = sext i32 %148 to i64
  %150 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %149
  %151 = load i32* %150, align 4
  %152 = load i32* %2, align 4
  %153 = icmp eq i32 %151, %152
  br i1 %153, label %222, label %154

; <label>:154                                     ; preds = %145, %135
  %155 = load i32* %1, align 4
  %156 = add nsw i32 %155, 20
  %157 = sub nsw i32 %156, 1
  %158 = sext i32 %157 to i64
  %159 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %158
  %160 = load i8* %159, align 1
  %161 = zext i8 %160 to i32
  %162 = load i32* %color, align 4
  %163 = icmp eq i32 %161, %162
  br i1 %163, label %164, label %173

; <label>:164                                     ; preds = %154
  %165 = load i32* %1, align 4
  %166 = add nsw i32 %165, 20
  %167 = sub nsw i32 %166, 1
  %168 = sext i32 %167 to i64
  %169 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %168
  %170 = load i32* %169, align 4
  %171 = load i32* %2, align 4
  %172 = icmp eq i32 %170, %171
  br i1 %172, label %222, label %173

; <label>:173                                     ; preds = %164, %154
  %174 = load i32* %1, align 4
  %175 = add nsw i32 %174, 20
  %176 = add nsw i32 %175, 1
  %177 = sext i32 %176 to i64
  %178 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %177
  %179 = load i8* %178, align 1
  %180 = zext i8 %179 to i32
  %181 = load i32* %color, align 4
  %182 = icmp eq i32 %180, %181
  br i1 %182, label %183, label %192

; <label>:183                                     ; preds = %173
  %184 = load i32* %1, align 4
  %185 = add nsw i32 %184, 20
  %186 = add nsw i32 %185, 1
  %187 = sext i32 %186 to i64
  %188 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %187
  %189 = load i32* %188, align 4
  %190 = load i32* %2, align 4
  %191 = icmp eq i32 %189, %190
  br i1 %191, label %222, label %192

; <label>:192                                     ; preds = %183, %173
  br label %193

; <label>:193                                     ; preds = %192
  %194 = load i32* %2, align 4
  %195 = sext i32 %194 to i64
  %196 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %195
  %197 = getelementptr inbounds %struct.string_data* %196, i32 0, i32 3
  %198 = load i32* %197, align 4
  %199 = icmp slt i32 %198, 20
  br i1 %199, label %200, label %214

; <label>:200                                     ; preds = %193
  %201 = load i32* %1, align 4
  %202 = add nsw i32 %201, 20
  %203 = load i32* %2, align 4
  %204 = sext i32 %203 to i64
  %205 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %204
  %206 = getelementptr inbounds %struct.string_data* %205, i32 0, i32 3
  %207 = load i32* %206, align 4
  %208 = sext i32 %207 to i64
  %209 = load i32* %2, align 4
  %210 = sext i32 %209 to i64
  %211 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %210
  %212 = getelementptr inbounds %struct.string_data* %211, i32 0, i32 4
  %213 = getelementptr inbounds [20 x i32]* %212, i32 0, i64 %208
  store i32 %202, i32* %213, align 4
  br label %214

; <label>:214                                     ; preds = %200, %193
  %215 = load i32* %2, align 4
  %216 = sext i32 %215 to i64
  %217 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %216
  %218 = getelementptr inbounds %struct.string_data* %217, i32 0, i32 3
  %219 = load i32* %218, align 4
  %220 = add nsw i32 %219, 1
  store i32 %220, i32* %218, align 4
  br label %221

; <label>:221                                     ; preds = %214
  br label %222

; <label>:222                                     ; preds = %221, %183, %164, %145, %132
  br label %321

; <label>:223                                     ; preds = %124
  %224 = load i32* %1, align 4
  %225 = add nsw i32 %224, 20
  %226 = sext i32 %225 to i64
  %227 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %226
  %228 = load i8* %227, align 1
  %229 = zext i8 %228 to i32
  %230 = load i32* %other, align 4
  %231 = icmp eq i32 %229, %230
  br i1 %231, label %232, label %320

; <label>:232                                     ; preds = %223
  %233 = load i32* %1, align 4
  %234 = add nsw i32 %233, 20
  %235 = sext i32 %234 to i64
  %236 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %235
  %237 = load i32* %236, align 4
  %238 = sext i32 %237 to i64
  %239 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %238
  %240 = getelementptr inbounds %struct.string_data* %239, i32 0, i32 7
  %241 = load i32* %240, align 4
  %242 = load i32* @string_mark, align 4
  %243 = icmp ne i32 %241, %242
  br i1 %243, label %244, label %320

; <label>:244                                     ; preds = %232
  %245 = load i32* %1, align 4
  %246 = add nsw i32 %245, 20
  %247 = sext i32 %246 to i64
  %248 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %247
  %249 = load i32* %248, align 4
  store i32 %249, i32* %s2, align 4
  %250 = load i32* %2, align 4
  %251 = sext i32 %250 to i64
  %252 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %251
  %253 = getelementptr inbounds %struct.string_data* %252, i32 0, i32 5
  %254 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %255 = getelementptr inbounds %struct.change_stack_entry* %254, i32 0, i32 0
  store i32* %253, i32** %255, align 8
  %256 = load i32* %2, align 4
  %257 = sext i32 %256 to i64
  %258 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %257
  %259 = getelementptr inbounds %struct.string_data* %258, i32 0, i32 5
  %260 = load i32* %259, align 4
  %261 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %262 = getelementptr inbounds %struct.change_stack_entry* %261, i32 1
  store %struct.change_stack_entry* %262, %struct.change_stack_entry** @change_stack_pointer, align 8
  %263 = getelementptr inbounds %struct.change_stack_entry* %261, i32 0, i32 1
  store i32 %260, i32* %263, align 4
  %264 = load i32* %1, align 4
  %265 = add nsw i32 %264, 20
  %266 = sext i32 %265 to i64
  %267 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %266
  %268 = load i32* %267, align 4
  %269 = load i32* %2, align 4
  %270 = sext i32 %269 to i64
  %271 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %270
  %272 = getelementptr inbounds %struct.string_data* %271, i32 0, i32 5
  %273 = load i32* %272, align 4
  %274 = add nsw i32 %273, 1
  store i32 %274, i32* %272, align 4
  %275 = sext i32 %273 to i64
  %276 = load i32* %2, align 4
  %277 = sext i32 %276 to i64
  %278 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %277
  %279 = getelementptr inbounds %struct.string_data* %278, i32 0, i32 6
  %280 = getelementptr inbounds [160 x i32]* %279, i32 0, i64 %275
  store i32 %268, i32* %280, align 4
  %281 = load i32* %s2, align 4
  %282 = sext i32 %281 to i64
  %283 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %282
  %284 = getelementptr inbounds %struct.string_data* %283, i32 0, i32 5
  %285 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %286 = getelementptr inbounds %struct.change_stack_entry* %285, i32 0, i32 0
  store i32* %284, i32** %286, align 8
  %287 = load i32* %s2, align 4
  %288 = sext i32 %287 to i64
  %289 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %288
  %290 = getelementptr inbounds %struct.string_data* %289, i32 0, i32 5
  %291 = load i32* %290, align 4
  %292 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %293 = getelementptr inbounds %struct.change_stack_entry* %292, i32 1
  store %struct.change_stack_entry* %293, %struct.change_stack_entry** @change_stack_pointer, align 8
  %294 = getelementptr inbounds %struct.change_stack_entry* %292, i32 0, i32 1
  store i32 %291, i32* %294, align 4
  %295 = load i32* %1, align 4
  %296 = sext i32 %295 to i64
  %297 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %296
  %298 = load i32* %297, align 4
  %299 = load i32* %s2, align 4
  %300 = sext i32 %299 to i64
  %301 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %300
  %302 = getelementptr inbounds %struct.string_data* %301, i32 0, i32 5
  %303 = load i32* %302, align 4
  %304 = add nsw i32 %303, 1
  store i32 %304, i32* %302, align 4
  %305 = sext i32 %303 to i64
  %306 = load i32* %s2, align 4
  %307 = sext i32 %306 to i64
  %308 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %307
  %309 = getelementptr inbounds %struct.string_data* %308, i32 0, i32 6
  %310 = getelementptr inbounds [160 x i32]* %309, i32 0, i64 %305
  store i32 %298, i32* %310, align 4
  %311 = load i32* @string_mark, align 4
  %312 = load i32* %1, align 4
  %313 = add nsw i32 %312, 20
  %314 = sext i32 %313 to i64
  %315 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %314
  %316 = load i32* %315, align 4
  %317 = sext i32 %316 to i64
  %318 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %317
  %319 = getelementptr inbounds %struct.string_data* %318, i32 0, i32 7
  store i32 %311, i32* %319, align 4
  br label %320

; <label>:320                                     ; preds = %244, %232, %223
  br label %321

; <label>:321                                     ; preds = %320, %222
  %322 = load i32* %1, align 4
  %323 = sub nsw i32 %322, 1
  %324 = sext i32 %323 to i64
  %325 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %324
  %326 = load i8* %325, align 1
  %327 = zext i8 %326 to i32
  %328 = icmp eq i32 %327, 0
  br i1 %328, label %329, label %420

; <label>:329                                     ; preds = %321
  %330 = load i32* %liberties_updated, align 4
  %331 = icmp ne i32 %330, 0
  br i1 %331, label %419, label %332

; <label>:332                                     ; preds = %329
  %333 = load i32* %1, align 4
  %334 = sub nsw i32 %333, 1
  %335 = sub nsw i32 %334, 1
  %336 = sext i32 %335 to i64
  %337 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %336
  %338 = load i8* %337, align 1
  %339 = zext i8 %338 to i32
  %340 = load i32* %color, align 4
  %341 = icmp eq i32 %339, %340
  br i1 %341, label %342, label %351

; <label>:342                                     ; preds = %332
  %343 = load i32* %1, align 4
  %344 = sub nsw i32 %343, 1
  %345 = sub nsw i32 %344, 1
  %346 = sext i32 %345 to i64
  %347 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %346
  %348 = load i32* %347, align 4
  %349 = load i32* %2, align 4
  %350 = icmp eq i32 %348, %349
  br i1 %350, label %419, label %351

; <label>:351                                     ; preds = %342, %332
  %352 = load i32* %1, align 4
  %353 = sub nsw i32 %352, 1
  %354 = sub nsw i32 %353, 20
  %355 = sext i32 %354 to i64
  %356 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %355
  %357 = load i8* %356, align 1
  %358 = zext i8 %357 to i32
  %359 = load i32* %color, align 4
  %360 = icmp eq i32 %358, %359
  br i1 %360, label %361, label %370

; <label>:361                                     ; preds = %351
  %362 = load i32* %1, align 4
  %363 = sub nsw i32 %362, 1
  %364 = sub nsw i32 %363, 20
  %365 = sext i32 %364 to i64
  %366 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %365
  %367 = load i32* %366, align 4
  %368 = load i32* %2, align 4
  %369 = icmp eq i32 %367, %368
  br i1 %369, label %419, label %370

; <label>:370                                     ; preds = %361, %351
  %371 = load i32* %1, align 4
  %372 = sub nsw i32 %371, 1
  %373 = add nsw i32 %372, 20
  %374 = sext i32 %373 to i64
  %375 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %374
  %376 = load i8* %375, align 1
  %377 = zext i8 %376 to i32
  %378 = load i32* %color, align 4
  %379 = icmp eq i32 %377, %378
  br i1 %379, label %380, label %389

; <label>:380                                     ; preds = %370
  %381 = load i32* %1, align 4
  %382 = sub nsw i32 %381, 1
  %383 = add nsw i32 %382, 20
  %384 = sext i32 %383 to i64
  %385 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %384
  %386 = load i32* %385, align 4
  %387 = load i32* %2, align 4
  %388 = icmp eq i32 %386, %387
  br i1 %388, label %419, label %389

; <label>:389                                     ; preds = %380, %370
  br label %390

; <label>:390                                     ; preds = %389
  %391 = load i32* %2, align 4
  %392 = sext i32 %391 to i64
  %393 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %392
  %394 = getelementptr inbounds %struct.string_data* %393, i32 0, i32 3
  %395 = load i32* %394, align 4
  %396 = icmp slt i32 %395, 20
  br i1 %396, label %397, label %411

; <label>:397                                     ; preds = %390
  %398 = load i32* %1, align 4
  %399 = sub nsw i32 %398, 1
  %400 = load i32* %2, align 4
  %401 = sext i32 %400 to i64
  %402 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %401
  %403 = getelementptr inbounds %struct.string_data* %402, i32 0, i32 3
  %404 = load i32* %403, align 4
  %405 = sext i32 %404 to i64
  %406 = load i32* %2, align 4
  %407 = sext i32 %406 to i64
  %408 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %407
  %409 = getelementptr inbounds %struct.string_data* %408, i32 0, i32 4
  %410 = getelementptr inbounds [20 x i32]* %409, i32 0, i64 %405
  store i32 %399, i32* %410, align 4
  br label %411

; <label>:411                                     ; preds = %397, %390
  %412 = load i32* %2, align 4
  %413 = sext i32 %412 to i64
  %414 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %413
  %415 = getelementptr inbounds %struct.string_data* %414, i32 0, i32 3
  %416 = load i32* %415, align 4
  %417 = add nsw i32 %416, 1
  store i32 %417, i32* %415, align 4
  br label %418

; <label>:418                                     ; preds = %411
  br label %419

; <label>:419                                     ; preds = %418, %380, %361, %342, %329
  br label %518

; <label>:420                                     ; preds = %321
  %421 = load i32* %1, align 4
  %422 = sub nsw i32 %421, 1
  %423 = sext i32 %422 to i64
  %424 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %423
  %425 = load i8* %424, align 1
  %426 = zext i8 %425 to i32
  %427 = load i32* %other, align 4
  %428 = icmp eq i32 %426, %427
  br i1 %428, label %429, label %517

; <label>:429                                     ; preds = %420
  %430 = load i32* %1, align 4
  %431 = sub nsw i32 %430, 1
  %432 = sext i32 %431 to i64
  %433 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %432
  %434 = load i32* %433, align 4
  %435 = sext i32 %434 to i64
  %436 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %435
  %437 = getelementptr inbounds %struct.string_data* %436, i32 0, i32 7
  %438 = load i32* %437, align 4
  %439 = load i32* @string_mark, align 4
  %440 = icmp ne i32 %438, %439
  br i1 %440, label %441, label %517

; <label>:441                                     ; preds = %429
  %442 = load i32* %1, align 4
  %443 = sub nsw i32 %442, 1
  %444 = sext i32 %443 to i64
  %445 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %444
  %446 = load i32* %445, align 4
  store i32 %446, i32* %s21, align 4
  %447 = load i32* %2, align 4
  %448 = sext i32 %447 to i64
  %449 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %448
  %450 = getelementptr inbounds %struct.string_data* %449, i32 0, i32 5
  %451 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %452 = getelementptr inbounds %struct.change_stack_entry* %451, i32 0, i32 0
  store i32* %450, i32** %452, align 8
  %453 = load i32* %2, align 4
  %454 = sext i32 %453 to i64
  %455 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %454
  %456 = getelementptr inbounds %struct.string_data* %455, i32 0, i32 5
  %457 = load i32* %456, align 4
  %458 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %459 = getelementptr inbounds %struct.change_stack_entry* %458, i32 1
  store %struct.change_stack_entry* %459, %struct.change_stack_entry** @change_stack_pointer, align 8
  %460 = getelementptr inbounds %struct.change_stack_entry* %458, i32 0, i32 1
  store i32 %457, i32* %460, align 4
  %461 = load i32* %1, align 4
  %462 = sub nsw i32 %461, 1
  %463 = sext i32 %462 to i64
  %464 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %463
  %465 = load i32* %464, align 4
  %466 = load i32* %2, align 4
  %467 = sext i32 %466 to i64
  %468 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %467
  %469 = getelementptr inbounds %struct.string_data* %468, i32 0, i32 5
  %470 = load i32* %469, align 4
  %471 = add nsw i32 %470, 1
  store i32 %471, i32* %469, align 4
  %472 = sext i32 %470 to i64
  %473 = load i32* %2, align 4
  %474 = sext i32 %473 to i64
  %475 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %474
  %476 = getelementptr inbounds %struct.string_data* %475, i32 0, i32 6
  %477 = getelementptr inbounds [160 x i32]* %476, i32 0, i64 %472
  store i32 %465, i32* %477, align 4
  %478 = load i32* %s21, align 4
  %479 = sext i32 %478 to i64
  %480 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %479
  %481 = getelementptr inbounds %struct.string_data* %480, i32 0, i32 5
  %482 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %483 = getelementptr inbounds %struct.change_stack_entry* %482, i32 0, i32 0
  store i32* %481, i32** %483, align 8
  %484 = load i32* %s21, align 4
  %485 = sext i32 %484 to i64
  %486 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %485
  %487 = getelementptr inbounds %struct.string_data* %486, i32 0, i32 5
  %488 = load i32* %487, align 4
  %489 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %490 = getelementptr inbounds %struct.change_stack_entry* %489, i32 1
  store %struct.change_stack_entry* %490, %struct.change_stack_entry** @change_stack_pointer, align 8
  %491 = getelementptr inbounds %struct.change_stack_entry* %489, i32 0, i32 1
  store i32 %488, i32* %491, align 4
  %492 = load i32* %1, align 4
  %493 = sext i32 %492 to i64
  %494 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %493
  %495 = load i32* %494, align 4
  %496 = load i32* %s21, align 4
  %497 = sext i32 %496 to i64
  %498 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %497
  %499 = getelementptr inbounds %struct.string_data* %498, i32 0, i32 5
  %500 = load i32* %499, align 4
  %501 = add nsw i32 %500, 1
  store i32 %501, i32* %499, align 4
  %502 = sext i32 %500 to i64
  %503 = load i32* %s21, align 4
  %504 = sext i32 %503 to i64
  %505 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %504
  %506 = getelementptr inbounds %struct.string_data* %505, i32 0, i32 6
  %507 = getelementptr inbounds [160 x i32]* %506, i32 0, i64 %502
  store i32 %495, i32* %507, align 4
  %508 = load i32* @string_mark, align 4
  %509 = load i32* %1, align 4
  %510 = sub nsw i32 %509, 1
  %511 = sext i32 %510 to i64
  %512 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %511
  %513 = load i32* %512, align 4
  %514 = sext i32 %513 to i64
  %515 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %514
  %516 = getelementptr inbounds %struct.string_data* %515, i32 0, i32 7
  store i32 %508, i32* %516, align 4
  br label %517

; <label>:517                                     ; preds = %441, %429, %420
  br label %518

; <label>:518                                     ; preds = %517, %419
  %519 = load i32* %1, align 4
  %520 = sub nsw i32 %519, 20
  %521 = sext i32 %520 to i64
  %522 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %521
  %523 = load i8* %522, align 1
  %524 = zext i8 %523 to i32
  %525 = icmp eq i32 %524, 0
  br i1 %525, label %526, label %617

; <label>:526                                     ; preds = %518
  %527 = load i32* %liberties_updated, align 4
  %528 = icmp ne i32 %527, 0
  br i1 %528, label %616, label %529

; <label>:529                                     ; preds = %526
  %530 = load i32* %1, align 4
  %531 = sub nsw i32 %530, 20
  %532 = sub nsw i32 %531, 20
  %533 = sext i32 %532 to i64
  %534 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %533
  %535 = load i8* %534, align 1
  %536 = zext i8 %535 to i32
  %537 = load i32* %color, align 4
  %538 = icmp eq i32 %536, %537
  br i1 %538, label %539, label %548

; <label>:539                                     ; preds = %529
  %540 = load i32* %1, align 4
  %541 = sub nsw i32 %540, 20
  %542 = sub nsw i32 %541, 20
  %543 = sext i32 %542 to i64
  %544 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %543
  %545 = load i32* %544, align 4
  %546 = load i32* %2, align 4
  %547 = icmp eq i32 %545, %546
  br i1 %547, label %616, label %548

; <label>:548                                     ; preds = %539, %529
  %549 = load i32* %1, align 4
  %550 = sub nsw i32 %549, 20
  %551 = add nsw i32 %550, 1
  %552 = sext i32 %551 to i64
  %553 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %552
  %554 = load i8* %553, align 1
  %555 = zext i8 %554 to i32
  %556 = load i32* %color, align 4
  %557 = icmp eq i32 %555, %556
  br i1 %557, label %558, label %567

; <label>:558                                     ; preds = %548
  %559 = load i32* %1, align 4
  %560 = sub nsw i32 %559, 20
  %561 = add nsw i32 %560, 1
  %562 = sext i32 %561 to i64
  %563 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %562
  %564 = load i32* %563, align 4
  %565 = load i32* %2, align 4
  %566 = icmp eq i32 %564, %565
  br i1 %566, label %616, label %567

; <label>:567                                     ; preds = %558, %548
  %568 = load i32* %1, align 4
  %569 = sub nsw i32 %568, 20
  %570 = sub nsw i32 %569, 1
  %571 = sext i32 %570 to i64
  %572 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %571
  %573 = load i8* %572, align 1
  %574 = zext i8 %573 to i32
  %575 = load i32* %color, align 4
  %576 = icmp eq i32 %574, %575
  br i1 %576, label %577, label %586

; <label>:577                                     ; preds = %567
  %578 = load i32* %1, align 4
  %579 = sub nsw i32 %578, 20
  %580 = sub nsw i32 %579, 1
  %581 = sext i32 %580 to i64
  %582 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %581
  %583 = load i32* %582, align 4
  %584 = load i32* %2, align 4
  %585 = icmp eq i32 %583, %584
  br i1 %585, label %616, label %586

; <label>:586                                     ; preds = %577, %567
  br label %587

; <label>:587                                     ; preds = %586
  %588 = load i32* %2, align 4
  %589 = sext i32 %588 to i64
  %590 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %589
  %591 = getelementptr inbounds %struct.string_data* %590, i32 0, i32 3
  %592 = load i32* %591, align 4
  %593 = icmp slt i32 %592, 20
  br i1 %593, label %594, label %608

; <label>:594                                     ; preds = %587
  %595 = load i32* %1, align 4
  %596 = sub nsw i32 %595, 20
  %597 = load i32* %2, align 4
  %598 = sext i32 %597 to i64
  %599 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %598
  %600 = getelementptr inbounds %struct.string_data* %599, i32 0, i32 3
  %601 = load i32* %600, align 4
  %602 = sext i32 %601 to i64
  %603 = load i32* %2, align 4
  %604 = sext i32 %603 to i64
  %605 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %604
  %606 = getelementptr inbounds %struct.string_data* %605, i32 0, i32 4
  %607 = getelementptr inbounds [20 x i32]* %606, i32 0, i64 %602
  store i32 %596, i32* %607, align 4
  br label %608

; <label>:608                                     ; preds = %594, %587
  %609 = load i32* %2, align 4
  %610 = sext i32 %609 to i64
  %611 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %610
  %612 = getelementptr inbounds %struct.string_data* %611, i32 0, i32 3
  %613 = load i32* %612, align 4
  %614 = add nsw i32 %613, 1
  store i32 %614, i32* %612, align 4
  br label %615

; <label>:615                                     ; preds = %608
  br label %616

; <label>:616                                     ; preds = %615, %577, %558, %539, %526
  br label %715

; <label>:617                                     ; preds = %518
  %618 = load i32* %1, align 4
  %619 = sub nsw i32 %618, 20
  %620 = sext i32 %619 to i64
  %621 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %620
  %622 = load i8* %621, align 1
  %623 = zext i8 %622 to i32
  %624 = load i32* %other, align 4
  %625 = icmp eq i32 %623, %624
  br i1 %625, label %626, label %714

; <label>:626                                     ; preds = %617
  %627 = load i32* %1, align 4
  %628 = sub nsw i32 %627, 20
  %629 = sext i32 %628 to i64
  %630 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %629
  %631 = load i32* %630, align 4
  %632 = sext i32 %631 to i64
  %633 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %632
  %634 = getelementptr inbounds %struct.string_data* %633, i32 0, i32 7
  %635 = load i32* %634, align 4
  %636 = load i32* @string_mark, align 4
  %637 = icmp ne i32 %635, %636
  br i1 %637, label %638, label %714

; <label>:638                                     ; preds = %626
  %639 = load i32* %1, align 4
  %640 = sub nsw i32 %639, 20
  %641 = sext i32 %640 to i64
  %642 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %641
  %643 = load i32* %642, align 4
  store i32 %643, i32* %s22, align 4
  %644 = load i32* %2, align 4
  %645 = sext i32 %644 to i64
  %646 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %645
  %647 = getelementptr inbounds %struct.string_data* %646, i32 0, i32 5
  %648 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %649 = getelementptr inbounds %struct.change_stack_entry* %648, i32 0, i32 0
  store i32* %647, i32** %649, align 8
  %650 = load i32* %2, align 4
  %651 = sext i32 %650 to i64
  %652 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %651
  %653 = getelementptr inbounds %struct.string_data* %652, i32 0, i32 5
  %654 = load i32* %653, align 4
  %655 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %656 = getelementptr inbounds %struct.change_stack_entry* %655, i32 1
  store %struct.change_stack_entry* %656, %struct.change_stack_entry** @change_stack_pointer, align 8
  %657 = getelementptr inbounds %struct.change_stack_entry* %655, i32 0, i32 1
  store i32 %654, i32* %657, align 4
  %658 = load i32* %1, align 4
  %659 = sub nsw i32 %658, 20
  %660 = sext i32 %659 to i64
  %661 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %660
  %662 = load i32* %661, align 4
  %663 = load i32* %2, align 4
  %664 = sext i32 %663 to i64
  %665 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %664
  %666 = getelementptr inbounds %struct.string_data* %665, i32 0, i32 5
  %667 = load i32* %666, align 4
  %668 = add nsw i32 %667, 1
  store i32 %668, i32* %666, align 4
  %669 = sext i32 %667 to i64
  %670 = load i32* %2, align 4
  %671 = sext i32 %670 to i64
  %672 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %671
  %673 = getelementptr inbounds %struct.string_data* %672, i32 0, i32 6
  %674 = getelementptr inbounds [160 x i32]* %673, i32 0, i64 %669
  store i32 %662, i32* %674, align 4
  %675 = load i32* %s22, align 4
  %676 = sext i32 %675 to i64
  %677 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %676
  %678 = getelementptr inbounds %struct.string_data* %677, i32 0, i32 5
  %679 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %680 = getelementptr inbounds %struct.change_stack_entry* %679, i32 0, i32 0
  store i32* %678, i32** %680, align 8
  %681 = load i32* %s22, align 4
  %682 = sext i32 %681 to i64
  %683 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %682
  %684 = getelementptr inbounds %struct.string_data* %683, i32 0, i32 5
  %685 = load i32* %684, align 4
  %686 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %687 = getelementptr inbounds %struct.change_stack_entry* %686, i32 1
  store %struct.change_stack_entry* %687, %struct.change_stack_entry** @change_stack_pointer, align 8
  %688 = getelementptr inbounds %struct.change_stack_entry* %686, i32 0, i32 1
  store i32 %685, i32* %688, align 4
  %689 = load i32* %1, align 4
  %690 = sext i32 %689 to i64
  %691 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %690
  %692 = load i32* %691, align 4
  %693 = load i32* %s22, align 4
  %694 = sext i32 %693 to i64
  %695 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %694
  %696 = getelementptr inbounds %struct.string_data* %695, i32 0, i32 5
  %697 = load i32* %696, align 4
  %698 = add nsw i32 %697, 1
  store i32 %698, i32* %696, align 4
  %699 = sext i32 %697 to i64
  %700 = load i32* %s22, align 4
  %701 = sext i32 %700 to i64
  %702 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %701
  %703 = getelementptr inbounds %struct.string_data* %702, i32 0, i32 6
  %704 = getelementptr inbounds [160 x i32]* %703, i32 0, i64 %699
  store i32 %692, i32* %704, align 4
  %705 = load i32* @string_mark, align 4
  %706 = load i32* %1, align 4
  %707 = sub nsw i32 %706, 20
  %708 = sext i32 %707 to i64
  %709 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %708
  %710 = load i32* %709, align 4
  %711 = sext i32 %710 to i64
  %712 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %711
  %713 = getelementptr inbounds %struct.string_data* %712, i32 0, i32 7
  store i32 %705, i32* %713, align 4
  br label %714

; <label>:714                                     ; preds = %638, %626, %617
  br label %715

; <label>:715                                     ; preds = %714, %616
  %716 = load i32* %1, align 4
  %717 = add nsw i32 %716, 1
  %718 = sext i32 %717 to i64
  %719 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %718
  %720 = load i8* %719, align 1
  %721 = zext i8 %720 to i32
  %722 = icmp eq i32 %721, 0
  br i1 %722, label %723, label %814

; <label>:723                                     ; preds = %715
  %724 = load i32* %liberties_updated, align 4
  %725 = icmp ne i32 %724, 0
  br i1 %725, label %813, label %726

; <label>:726                                     ; preds = %723
  %727 = load i32* %1, align 4
  %728 = add nsw i32 %727, 1
  %729 = add nsw i32 %728, 1
  %730 = sext i32 %729 to i64
  %731 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %730
  %732 = load i8* %731, align 1
  %733 = zext i8 %732 to i32
  %734 = load i32* %color, align 4
  %735 = icmp eq i32 %733, %734
  br i1 %735, label %736, label %745

; <label>:736                                     ; preds = %726
  %737 = load i32* %1, align 4
  %738 = add nsw i32 %737, 1
  %739 = add nsw i32 %738, 1
  %740 = sext i32 %739 to i64
  %741 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %740
  %742 = load i32* %741, align 4
  %743 = load i32* %2, align 4
  %744 = icmp eq i32 %742, %743
  br i1 %744, label %813, label %745

; <label>:745                                     ; preds = %736, %726
  %746 = load i32* %1, align 4
  %747 = add nsw i32 %746, 1
  %748 = add nsw i32 %747, 20
  %749 = sext i32 %748 to i64
  %750 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %749
  %751 = load i8* %750, align 1
  %752 = zext i8 %751 to i32
  %753 = load i32* %color, align 4
  %754 = icmp eq i32 %752, %753
  br i1 %754, label %755, label %764

; <label>:755                                     ; preds = %745
  %756 = load i32* %1, align 4
  %757 = add nsw i32 %756, 1
  %758 = add nsw i32 %757, 20
  %759 = sext i32 %758 to i64
  %760 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %759
  %761 = load i32* %760, align 4
  %762 = load i32* %2, align 4
  %763 = icmp eq i32 %761, %762
  br i1 %763, label %813, label %764

; <label>:764                                     ; preds = %755, %745
  %765 = load i32* %1, align 4
  %766 = add nsw i32 %765, 1
  %767 = sub nsw i32 %766, 20
  %768 = sext i32 %767 to i64
  %769 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %768
  %770 = load i8* %769, align 1
  %771 = zext i8 %770 to i32
  %772 = load i32* %color, align 4
  %773 = icmp eq i32 %771, %772
  br i1 %773, label %774, label %783

; <label>:774                                     ; preds = %764
  %775 = load i32* %1, align 4
  %776 = add nsw i32 %775, 1
  %777 = sub nsw i32 %776, 20
  %778 = sext i32 %777 to i64
  %779 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %778
  %780 = load i32* %779, align 4
  %781 = load i32* %2, align 4
  %782 = icmp eq i32 %780, %781
  br i1 %782, label %813, label %783

; <label>:783                                     ; preds = %774, %764
  br label %784

; <label>:784                                     ; preds = %783
  %785 = load i32* %2, align 4
  %786 = sext i32 %785 to i64
  %787 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %786
  %788 = getelementptr inbounds %struct.string_data* %787, i32 0, i32 3
  %789 = load i32* %788, align 4
  %790 = icmp slt i32 %789, 20
  br i1 %790, label %791, label %805

; <label>:791                                     ; preds = %784
  %792 = load i32* %1, align 4
  %793 = add nsw i32 %792, 1
  %794 = load i32* %2, align 4
  %795 = sext i32 %794 to i64
  %796 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %795
  %797 = getelementptr inbounds %struct.string_data* %796, i32 0, i32 3
  %798 = load i32* %797, align 4
  %799 = sext i32 %798 to i64
  %800 = load i32* %2, align 4
  %801 = sext i32 %800 to i64
  %802 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %801
  %803 = getelementptr inbounds %struct.string_data* %802, i32 0, i32 4
  %804 = getelementptr inbounds [20 x i32]* %803, i32 0, i64 %799
  store i32 %793, i32* %804, align 4
  br label %805

; <label>:805                                     ; preds = %791, %784
  %806 = load i32* %2, align 4
  %807 = sext i32 %806 to i64
  %808 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %807
  %809 = getelementptr inbounds %struct.string_data* %808, i32 0, i32 3
  %810 = load i32* %809, align 4
  %811 = add nsw i32 %810, 1
  store i32 %811, i32* %809, align 4
  br label %812

; <label>:812                                     ; preds = %805
  br label %813

; <label>:813                                     ; preds = %812, %774, %755, %736, %723
  br label %903

; <label>:814                                     ; preds = %715
  %815 = load i32* %1, align 4
  %816 = add nsw i32 %815, 1
  %817 = sext i32 %816 to i64
  %818 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %817
  %819 = load i8* %818, align 1
  %820 = zext i8 %819 to i32
  %821 = load i32* %other, align 4
  %822 = icmp eq i32 %820, %821
  br i1 %822, label %823, label %902

; <label>:823                                     ; preds = %814
  %824 = load i32* %1, align 4
  %825 = add nsw i32 %824, 1
  %826 = sext i32 %825 to i64
  %827 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %826
  %828 = load i32* %827, align 4
  %829 = sext i32 %828 to i64
  %830 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %829
  %831 = getelementptr inbounds %struct.string_data* %830, i32 0, i32 7
  %832 = load i32* %831, align 4
  %833 = load i32* @string_mark, align 4
  %834 = icmp ne i32 %832, %833
  br i1 %834, label %835, label %902

; <label>:835                                     ; preds = %823
  %836 = load i32* %1, align 4
  %837 = add nsw i32 %836, 1
  %838 = sext i32 %837 to i64
  %839 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %838
  %840 = load i32* %839, align 4
  store i32 %840, i32* %s23, align 4
  %841 = load i32* %2, align 4
  %842 = sext i32 %841 to i64
  %843 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %842
  %844 = getelementptr inbounds %struct.string_data* %843, i32 0, i32 5
  %845 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %846 = getelementptr inbounds %struct.change_stack_entry* %845, i32 0, i32 0
  store i32* %844, i32** %846, align 8
  %847 = load i32* %2, align 4
  %848 = sext i32 %847 to i64
  %849 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %848
  %850 = getelementptr inbounds %struct.string_data* %849, i32 0, i32 5
  %851 = load i32* %850, align 4
  %852 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %853 = getelementptr inbounds %struct.change_stack_entry* %852, i32 1
  store %struct.change_stack_entry* %853, %struct.change_stack_entry** @change_stack_pointer, align 8
  %854 = getelementptr inbounds %struct.change_stack_entry* %852, i32 0, i32 1
  store i32 %851, i32* %854, align 4
  %855 = load i32* %1, align 4
  %856 = add nsw i32 %855, 1
  %857 = sext i32 %856 to i64
  %858 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %857
  %859 = load i32* %858, align 4
  %860 = load i32* %2, align 4
  %861 = sext i32 %860 to i64
  %862 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %861
  %863 = getelementptr inbounds %struct.string_data* %862, i32 0, i32 5
  %864 = load i32* %863, align 4
  %865 = add nsw i32 %864, 1
  store i32 %865, i32* %863, align 4
  %866 = sext i32 %864 to i64
  %867 = load i32* %2, align 4
  %868 = sext i32 %867 to i64
  %869 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %868
  %870 = getelementptr inbounds %struct.string_data* %869, i32 0, i32 6
  %871 = getelementptr inbounds [160 x i32]* %870, i32 0, i64 %866
  store i32 %859, i32* %871, align 4
  %872 = load i32* %s23, align 4
  %873 = sext i32 %872 to i64
  %874 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %873
  %875 = getelementptr inbounds %struct.string_data* %874, i32 0, i32 5
  %876 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %877 = getelementptr inbounds %struct.change_stack_entry* %876, i32 0, i32 0
  store i32* %875, i32** %877, align 8
  %878 = load i32* %s23, align 4
  %879 = sext i32 %878 to i64
  %880 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %879
  %881 = getelementptr inbounds %struct.string_data* %880, i32 0, i32 5
  %882 = load i32* %881, align 4
  %883 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %884 = getelementptr inbounds %struct.change_stack_entry* %883, i32 1
  store %struct.change_stack_entry* %884, %struct.change_stack_entry** @change_stack_pointer, align 8
  %885 = getelementptr inbounds %struct.change_stack_entry* %883, i32 0, i32 1
  store i32 %882, i32* %885, align 4
  %886 = load i32* %1, align 4
  %887 = sext i32 %886 to i64
  %888 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %887
  %889 = load i32* %888, align 4
  %890 = load i32* %s23, align 4
  %891 = sext i32 %890 to i64
  %892 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %891
  %893 = getelementptr inbounds %struct.string_data* %892, i32 0, i32 5
  %894 = load i32* %893, align 4
  %895 = add nsw i32 %894, 1
  store i32 %895, i32* %893, align 4
  %896 = sext i32 %894 to i64
  %897 = load i32* %s23, align 4
  %898 = sext i32 %897 to i64
  %899 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %898
  %900 = getelementptr inbounds %struct.string_data* %899, i32 0, i32 6
  %901 = getelementptr inbounds [160 x i32]* %900, i32 0, i64 %896
  store i32 %889, i32* %901, align 4
  br label %902

; <label>:902                                     ; preds = %835, %823, %814
  br label %903

; <label>:903                                     ; preds = %902, %813
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @assimilate_neighbor_strings(i32 %pos) #0 {
  %1 = alloca i32, align 4
  %s = alloca i32, align 4
  %color = alloca i32, align 4
  %other = alloca i32, align 4
  store i32 %pos, i32* %1, align 4
  %2 = load i32* %1, align 4
  %3 = sext i32 %2 to i64
  %4 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %3
  %5 = load i8* %4, align 1
  %6 = zext i8 %5 to i32
  store i32 %6, i32* %color, align 4
  %7 = load i32* %color, align 4
  %8 = sub nsw i32 3, %7
  store i32 %8, i32* %other, align 4
  %9 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %10 = getelementptr inbounds %struct.change_stack_entry* %9, i32 0, i32 0
  store i32* @next_string, i32** %10, align 8
  %11 = load i32* @next_string, align 4
  %12 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %13 = getelementptr inbounds %struct.change_stack_entry* %12, i32 1
  store %struct.change_stack_entry* %13, %struct.change_stack_entry** @change_stack_pointer, align 8
  %14 = getelementptr inbounds %struct.change_stack_entry* %12, i32 0, i32 1
  store i32 %11, i32* %14, align 4
  %15 = load i32* @next_string, align 4
  %16 = add nsw i32 %15, 1
  store i32 %16, i32* @next_string, align 4
  store i32 %15, i32* %s, align 4
  %17 = load i32* %s, align 4
  %18 = icmp slt i32 %17, 240
  br i1 %18, label %19, label %20

; <label>:19                                      ; preds = %0
  br label %27

; <label>:20                                      ; preds = %0
  %21 = load i32* %1, align 4
  %22 = sdiv i32 %21, 20
  %23 = sub nsw i32 %22, 1
  %24 = load i32* %1, align 4
  %25 = srem i32 %24, 20
  %26 = sub nsw i32 %25, 1
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 3296, i8* getelementptr inbounds ([22 x i8]* @.str36, i32 0, i32 0), i32 %23, i32 %26)
  br label %27

; <label>:27                                      ; preds = %20, %19
  %28 = load i32* %s, align 4
  %29 = load i32* %1, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %30
  store i32 %28, i32* %31, align 4
  %32 = load i32* %1, align 4
  %33 = load i32* %1, align 4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds [400 x i32]* @next_stone, i32 0, i64 %34
  store i32 %32, i32* %35, align 4
  %36 = load i32* %color, align 4
  %37 = load i32* %s, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %38
  %40 = getelementptr inbounds %struct.string_data* %39, i32 0, i32 0
  store i32 %36, i32* %40, align 4
  %41 = load i32* %s, align 4
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %42
  %44 = getelementptr inbounds %struct.string_data* %43, i32 0, i32 1
  store i32 1, i32* %44, align 4
  %45 = load i32* %1, align 4
  %46 = load i32* %s, align 4
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %47
  %49 = getelementptr inbounds %struct.string_data* %48, i32 0, i32 2
  store i32 %45, i32* %49, align 4
  %50 = load i32* %s, align 4
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %51
  %53 = getelementptr inbounds %struct.string_data* %52, i32 0, i32 3
  store i32 0, i32* %53, align 4
  %54 = load i32* %s, align 4
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %55
  %57 = getelementptr inbounds %struct.string_data* %56, i32 0, i32 5
  store i32 0, i32* %57, align 4
  %58 = load i32* @liberty_mark, align 4
  %59 = add nsw i32 %58, 1
  store i32 %59, i32* @liberty_mark, align 4
  %60 = load i32* @string_mark, align 4
  %61 = add nsw i32 %60, 1
  store i32 %61, i32* @string_mark, align 4
  %62 = load i32* @string_mark, align 4
  %63 = load i32* %s, align 4
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %64
  %66 = getelementptr inbounds %struct.string_data* %65, i32 0, i32 7
  store i32 %62, i32* %66, align 4
  %67 = load i32* %1, align 4
  %68 = add nsw i32 %67, 20
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %69
  %71 = load i8* %70, align 1
  %72 = zext i8 %71 to i32
  %73 = icmp eq i32 %72, 0
  br i1 %73, label %74, label %117

; <label>:74                                      ; preds = %27
  %75 = load i32* %1, align 4
  %76 = add nsw i32 %75, 20
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %77
  %79 = load i32* %78, align 4
  %80 = load i32* @liberty_mark, align 4
  %81 = icmp ne i32 %79, %80
  br i1 %81, label %82, label %117

; <label>:82                                      ; preds = %74
  br label %83

; <label>:83                                      ; preds = %82
  %84 = load i32* %s, align 4
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %85
  %87 = getelementptr inbounds %struct.string_data* %86, i32 0, i32 3
  %88 = load i32* %87, align 4
  %89 = icmp slt i32 %88, 20
  br i1 %89, label %90, label %104

; <label>:90                                      ; preds = %83
  %91 = load i32* %1, align 4
  %92 = add nsw i32 %91, 20
  %93 = load i32* %s, align 4
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %94
  %96 = getelementptr inbounds %struct.string_data* %95, i32 0, i32 3
  %97 = load i32* %96, align 4
  %98 = sext i32 %97 to i64
  %99 = load i32* %s, align 4
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %100
  %102 = getelementptr inbounds %struct.string_data* %101, i32 0, i32 4
  %103 = getelementptr inbounds [20 x i32]* %102, i32 0, i64 %98
  store i32 %92, i32* %103, align 4
  br label %104

; <label>:104                                     ; preds = %90, %83
  %105 = load i32* %s, align 4
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %106
  %108 = getelementptr inbounds %struct.string_data* %107, i32 0, i32 3
  %109 = load i32* %108, align 4
  %110 = add nsw i32 %109, 1
  store i32 %110, i32* %108, align 4
  %111 = load i32* @liberty_mark, align 4
  %112 = load i32* %1, align 4
  %113 = add nsw i32 %112, 20
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %114
  store i32 %111, i32* %115, align 4
  br label %116

; <label>:116                                     ; preds = %104
  br label %238

; <label>:117                                     ; preds = %74, %27
  %118 = load i32* %1, align 4
  %119 = add nsw i32 %118, 20
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %120
  %122 = load i8* %121, align 1
  %123 = zext i8 %122 to i32
  %124 = load i32* %other, align 4
  %125 = icmp eq i32 %123, %124
  br i1 %125, label %126, label %211

; <label>:126                                     ; preds = %117
  %127 = load i32* %1, align 4
  %128 = add nsw i32 %127, 20
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %129
  %131 = load i32* %130, align 4
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %132
  %134 = getelementptr inbounds %struct.string_data* %133, i32 0, i32 7
  %135 = load i32* %134, align 4
  %136 = load i32* @string_mark, align 4
  %137 = icmp ne i32 %135, %136
  br i1 %137, label %138, label %211

; <label>:138                                     ; preds = %126
  %139 = load i32* %1, align 4
  %140 = add nsw i32 %139, 20
  %141 = sext i32 %140 to i64
  %142 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %141
  %143 = load i32* %142, align 4
  %144 = load i32* %s, align 4
  %145 = sext i32 %144 to i64
  %146 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %145
  %147 = getelementptr inbounds %struct.string_data* %146, i32 0, i32 5
  %148 = load i32* %147, align 4
  %149 = add nsw i32 %148, 1
  store i32 %149, i32* %147, align 4
  %150 = sext i32 %148 to i64
  %151 = load i32* %s, align 4
  %152 = sext i32 %151 to i64
  %153 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %152
  %154 = getelementptr inbounds %struct.string_data* %153, i32 0, i32 6
  %155 = getelementptr inbounds [160 x i32]* %154, i32 0, i64 %150
  store i32 %143, i32* %155, align 4
  %156 = load i32* %1, align 4
  %157 = add nsw i32 %156, 20
  %158 = sext i32 %157 to i64
  %159 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %158
  %160 = load i32* %159, align 4
  %161 = sext i32 %160 to i64
  %162 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %161
  %163 = getelementptr inbounds %struct.string_data* %162, i32 0, i32 5
  %164 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %165 = getelementptr inbounds %struct.change_stack_entry* %164, i32 0, i32 0
  store i32* %163, i32** %165, align 8
  %166 = load i32* %1, align 4
  %167 = add nsw i32 %166, 20
  %168 = sext i32 %167 to i64
  %169 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %168
  %170 = load i32* %169, align 4
  %171 = sext i32 %170 to i64
  %172 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %171
  %173 = getelementptr inbounds %struct.string_data* %172, i32 0, i32 5
  %174 = load i32* %173, align 4
  %175 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %176 = getelementptr inbounds %struct.change_stack_entry* %175, i32 1
  store %struct.change_stack_entry* %176, %struct.change_stack_entry** @change_stack_pointer, align 8
  %177 = getelementptr inbounds %struct.change_stack_entry* %175, i32 0, i32 1
  store i32 %174, i32* %177, align 4
  %178 = load i32* %1, align 4
  %179 = sext i32 %178 to i64
  %180 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %179
  %181 = load i32* %180, align 4
  %182 = load i32* %1, align 4
  %183 = add nsw i32 %182, 20
  %184 = sext i32 %183 to i64
  %185 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %184
  %186 = load i32* %185, align 4
  %187 = sext i32 %186 to i64
  %188 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %187
  %189 = getelementptr inbounds %struct.string_data* %188, i32 0, i32 5
  %190 = load i32* %189, align 4
  %191 = add nsw i32 %190, 1
  store i32 %191, i32* %189, align 4
  %192 = sext i32 %190 to i64
  %193 = load i32* %1, align 4
  %194 = add nsw i32 %193, 20
  %195 = sext i32 %194 to i64
  %196 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %195
  %197 = load i32* %196, align 4
  %198 = sext i32 %197 to i64
  %199 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %198
  %200 = getelementptr inbounds %struct.string_data* %199, i32 0, i32 6
  %201 = getelementptr inbounds [160 x i32]* %200, i32 0, i64 %192
  store i32 %181, i32* %201, align 4
  %202 = load i32* @string_mark, align 4
  %203 = load i32* %1, align 4
  %204 = add nsw i32 %203, 20
  %205 = sext i32 %204 to i64
  %206 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %205
  %207 = load i32* %206, align 4
  %208 = sext i32 %207 to i64
  %209 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %208
  %210 = getelementptr inbounds %struct.string_data* %209, i32 0, i32 7
  store i32 %202, i32* %210, align 4
  br label %237

; <label>:211                                     ; preds = %126, %117
  %212 = load i32* %1, align 4
  %213 = add nsw i32 %212, 20
  %214 = sext i32 %213 to i64
  %215 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %214
  %216 = load i8* %215, align 1
  %217 = zext i8 %216 to i32
  %218 = load i32* %color, align 4
  %219 = icmp eq i32 %217, %218
  br i1 %219, label %220, label %236

; <label>:220                                     ; preds = %211
  %221 = load i32* %1, align 4
  %222 = add nsw i32 %221, 20
  %223 = sext i32 %222 to i64
  %224 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %223
  %225 = load i32* %224, align 4
  %226 = sext i32 %225 to i64
  %227 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %226
  %228 = getelementptr inbounds %struct.string_data* %227, i32 0, i32 7
  %229 = load i32* %228, align 4
  %230 = load i32* @string_mark, align 4
  %231 = icmp ne i32 %229, %230
  br i1 %231, label %232, label %236

; <label>:232                                     ; preds = %220
  %233 = load i32* %s, align 4
  %234 = load i32* %1, align 4
  %235 = add nsw i32 %234, 20
  call void @assimilate_string(i32 %233, i32 %235)
  br label %236

; <label>:236                                     ; preds = %232, %220, %211
  br label %237

; <label>:237                                     ; preds = %236, %138
  br label %238

; <label>:238                                     ; preds = %237, %116
  %239 = load i32* %1, align 4
  %240 = sub nsw i32 %239, 1
  %241 = sext i32 %240 to i64
  %242 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %241
  %243 = load i8* %242, align 1
  %244 = zext i8 %243 to i32
  %245 = icmp eq i32 %244, 0
  br i1 %245, label %246, label %289

; <label>:246                                     ; preds = %238
  %247 = load i32* %1, align 4
  %248 = sub nsw i32 %247, 1
  %249 = sext i32 %248 to i64
  %250 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %249
  %251 = load i32* %250, align 4
  %252 = load i32* @liberty_mark, align 4
  %253 = icmp ne i32 %251, %252
  br i1 %253, label %254, label %289

; <label>:254                                     ; preds = %246
  br label %255

; <label>:255                                     ; preds = %254
  %256 = load i32* %s, align 4
  %257 = sext i32 %256 to i64
  %258 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %257
  %259 = getelementptr inbounds %struct.string_data* %258, i32 0, i32 3
  %260 = load i32* %259, align 4
  %261 = icmp slt i32 %260, 20
  br i1 %261, label %262, label %276

; <label>:262                                     ; preds = %255
  %263 = load i32* %1, align 4
  %264 = sub nsw i32 %263, 1
  %265 = load i32* %s, align 4
  %266 = sext i32 %265 to i64
  %267 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %266
  %268 = getelementptr inbounds %struct.string_data* %267, i32 0, i32 3
  %269 = load i32* %268, align 4
  %270 = sext i32 %269 to i64
  %271 = load i32* %s, align 4
  %272 = sext i32 %271 to i64
  %273 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %272
  %274 = getelementptr inbounds %struct.string_data* %273, i32 0, i32 4
  %275 = getelementptr inbounds [20 x i32]* %274, i32 0, i64 %270
  store i32 %264, i32* %275, align 4
  br label %276

; <label>:276                                     ; preds = %262, %255
  %277 = load i32* %s, align 4
  %278 = sext i32 %277 to i64
  %279 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %278
  %280 = getelementptr inbounds %struct.string_data* %279, i32 0, i32 3
  %281 = load i32* %280, align 4
  %282 = add nsw i32 %281, 1
  store i32 %282, i32* %280, align 4
  %283 = load i32* @liberty_mark, align 4
  %284 = load i32* %1, align 4
  %285 = sub nsw i32 %284, 1
  %286 = sext i32 %285 to i64
  %287 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %286
  store i32 %283, i32* %287, align 4
  br label %288

; <label>:288                                     ; preds = %276
  br label %410

; <label>:289                                     ; preds = %246, %238
  %290 = load i32* %1, align 4
  %291 = sub nsw i32 %290, 1
  %292 = sext i32 %291 to i64
  %293 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %292
  %294 = load i8* %293, align 1
  %295 = zext i8 %294 to i32
  %296 = load i32* %other, align 4
  %297 = icmp eq i32 %295, %296
  br i1 %297, label %298, label %383

; <label>:298                                     ; preds = %289
  %299 = load i32* %1, align 4
  %300 = sub nsw i32 %299, 1
  %301 = sext i32 %300 to i64
  %302 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %301
  %303 = load i32* %302, align 4
  %304 = sext i32 %303 to i64
  %305 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %304
  %306 = getelementptr inbounds %struct.string_data* %305, i32 0, i32 7
  %307 = load i32* %306, align 4
  %308 = load i32* @string_mark, align 4
  %309 = icmp ne i32 %307, %308
  br i1 %309, label %310, label %383

; <label>:310                                     ; preds = %298
  %311 = load i32* %1, align 4
  %312 = sub nsw i32 %311, 1
  %313 = sext i32 %312 to i64
  %314 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %313
  %315 = load i32* %314, align 4
  %316 = load i32* %s, align 4
  %317 = sext i32 %316 to i64
  %318 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %317
  %319 = getelementptr inbounds %struct.string_data* %318, i32 0, i32 5
  %320 = load i32* %319, align 4
  %321 = add nsw i32 %320, 1
  store i32 %321, i32* %319, align 4
  %322 = sext i32 %320 to i64
  %323 = load i32* %s, align 4
  %324 = sext i32 %323 to i64
  %325 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %324
  %326 = getelementptr inbounds %struct.string_data* %325, i32 0, i32 6
  %327 = getelementptr inbounds [160 x i32]* %326, i32 0, i64 %322
  store i32 %315, i32* %327, align 4
  %328 = load i32* %1, align 4
  %329 = sub nsw i32 %328, 1
  %330 = sext i32 %329 to i64
  %331 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %330
  %332 = load i32* %331, align 4
  %333 = sext i32 %332 to i64
  %334 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %333
  %335 = getelementptr inbounds %struct.string_data* %334, i32 0, i32 5
  %336 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %337 = getelementptr inbounds %struct.change_stack_entry* %336, i32 0, i32 0
  store i32* %335, i32** %337, align 8
  %338 = load i32* %1, align 4
  %339 = sub nsw i32 %338, 1
  %340 = sext i32 %339 to i64
  %341 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %340
  %342 = load i32* %341, align 4
  %343 = sext i32 %342 to i64
  %344 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %343
  %345 = getelementptr inbounds %struct.string_data* %344, i32 0, i32 5
  %346 = load i32* %345, align 4
  %347 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %348 = getelementptr inbounds %struct.change_stack_entry* %347, i32 1
  store %struct.change_stack_entry* %348, %struct.change_stack_entry** @change_stack_pointer, align 8
  %349 = getelementptr inbounds %struct.change_stack_entry* %347, i32 0, i32 1
  store i32 %346, i32* %349, align 4
  %350 = load i32* %1, align 4
  %351 = sext i32 %350 to i64
  %352 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %351
  %353 = load i32* %352, align 4
  %354 = load i32* %1, align 4
  %355 = sub nsw i32 %354, 1
  %356 = sext i32 %355 to i64
  %357 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %356
  %358 = load i32* %357, align 4
  %359 = sext i32 %358 to i64
  %360 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %359
  %361 = getelementptr inbounds %struct.string_data* %360, i32 0, i32 5
  %362 = load i32* %361, align 4
  %363 = add nsw i32 %362, 1
  store i32 %363, i32* %361, align 4
  %364 = sext i32 %362 to i64
  %365 = load i32* %1, align 4
  %366 = sub nsw i32 %365, 1
  %367 = sext i32 %366 to i64
  %368 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %367
  %369 = load i32* %368, align 4
  %370 = sext i32 %369 to i64
  %371 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %370
  %372 = getelementptr inbounds %struct.string_data* %371, i32 0, i32 6
  %373 = getelementptr inbounds [160 x i32]* %372, i32 0, i64 %364
  store i32 %353, i32* %373, align 4
  %374 = load i32* @string_mark, align 4
  %375 = load i32* %1, align 4
  %376 = sub nsw i32 %375, 1
  %377 = sext i32 %376 to i64
  %378 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %377
  %379 = load i32* %378, align 4
  %380 = sext i32 %379 to i64
  %381 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %380
  %382 = getelementptr inbounds %struct.string_data* %381, i32 0, i32 7
  store i32 %374, i32* %382, align 4
  br label %409

; <label>:383                                     ; preds = %298, %289
  %384 = load i32* %1, align 4
  %385 = sub nsw i32 %384, 1
  %386 = sext i32 %385 to i64
  %387 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %386
  %388 = load i8* %387, align 1
  %389 = zext i8 %388 to i32
  %390 = load i32* %color, align 4
  %391 = icmp eq i32 %389, %390
  br i1 %391, label %392, label %408

; <label>:392                                     ; preds = %383
  %393 = load i32* %1, align 4
  %394 = sub nsw i32 %393, 1
  %395 = sext i32 %394 to i64
  %396 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %395
  %397 = load i32* %396, align 4
  %398 = sext i32 %397 to i64
  %399 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %398
  %400 = getelementptr inbounds %struct.string_data* %399, i32 0, i32 7
  %401 = load i32* %400, align 4
  %402 = load i32* @string_mark, align 4
  %403 = icmp ne i32 %401, %402
  br i1 %403, label %404, label %408

; <label>:404                                     ; preds = %392
  %405 = load i32* %s, align 4
  %406 = load i32* %1, align 4
  %407 = sub nsw i32 %406, 1
  call void @assimilate_string(i32 %405, i32 %407)
  br label %408

; <label>:408                                     ; preds = %404, %392, %383
  br label %409

; <label>:409                                     ; preds = %408, %310
  br label %410

; <label>:410                                     ; preds = %409, %288
  %411 = load i32* %1, align 4
  %412 = sub nsw i32 %411, 20
  %413 = sext i32 %412 to i64
  %414 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %413
  %415 = load i8* %414, align 1
  %416 = zext i8 %415 to i32
  %417 = icmp eq i32 %416, 0
  br i1 %417, label %418, label %461

; <label>:418                                     ; preds = %410
  %419 = load i32* %1, align 4
  %420 = sub nsw i32 %419, 20
  %421 = sext i32 %420 to i64
  %422 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %421
  %423 = load i32* %422, align 4
  %424 = load i32* @liberty_mark, align 4
  %425 = icmp ne i32 %423, %424
  br i1 %425, label %426, label %461

; <label>:426                                     ; preds = %418
  br label %427

; <label>:427                                     ; preds = %426
  %428 = load i32* %s, align 4
  %429 = sext i32 %428 to i64
  %430 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %429
  %431 = getelementptr inbounds %struct.string_data* %430, i32 0, i32 3
  %432 = load i32* %431, align 4
  %433 = icmp slt i32 %432, 20
  br i1 %433, label %434, label %448

; <label>:434                                     ; preds = %427
  %435 = load i32* %1, align 4
  %436 = sub nsw i32 %435, 20
  %437 = load i32* %s, align 4
  %438 = sext i32 %437 to i64
  %439 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %438
  %440 = getelementptr inbounds %struct.string_data* %439, i32 0, i32 3
  %441 = load i32* %440, align 4
  %442 = sext i32 %441 to i64
  %443 = load i32* %s, align 4
  %444 = sext i32 %443 to i64
  %445 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %444
  %446 = getelementptr inbounds %struct.string_data* %445, i32 0, i32 4
  %447 = getelementptr inbounds [20 x i32]* %446, i32 0, i64 %442
  store i32 %436, i32* %447, align 4
  br label %448

; <label>:448                                     ; preds = %434, %427
  %449 = load i32* %s, align 4
  %450 = sext i32 %449 to i64
  %451 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %450
  %452 = getelementptr inbounds %struct.string_data* %451, i32 0, i32 3
  %453 = load i32* %452, align 4
  %454 = add nsw i32 %453, 1
  store i32 %454, i32* %452, align 4
  %455 = load i32* @liberty_mark, align 4
  %456 = load i32* %1, align 4
  %457 = sub nsw i32 %456, 20
  %458 = sext i32 %457 to i64
  %459 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %458
  store i32 %455, i32* %459, align 4
  br label %460

; <label>:460                                     ; preds = %448
  br label %582

; <label>:461                                     ; preds = %418, %410
  %462 = load i32* %1, align 4
  %463 = sub nsw i32 %462, 20
  %464 = sext i32 %463 to i64
  %465 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %464
  %466 = load i8* %465, align 1
  %467 = zext i8 %466 to i32
  %468 = load i32* %other, align 4
  %469 = icmp eq i32 %467, %468
  br i1 %469, label %470, label %555

; <label>:470                                     ; preds = %461
  %471 = load i32* %1, align 4
  %472 = sub nsw i32 %471, 20
  %473 = sext i32 %472 to i64
  %474 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %473
  %475 = load i32* %474, align 4
  %476 = sext i32 %475 to i64
  %477 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %476
  %478 = getelementptr inbounds %struct.string_data* %477, i32 0, i32 7
  %479 = load i32* %478, align 4
  %480 = load i32* @string_mark, align 4
  %481 = icmp ne i32 %479, %480
  br i1 %481, label %482, label %555

; <label>:482                                     ; preds = %470
  %483 = load i32* %1, align 4
  %484 = sub nsw i32 %483, 20
  %485 = sext i32 %484 to i64
  %486 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %485
  %487 = load i32* %486, align 4
  %488 = load i32* %s, align 4
  %489 = sext i32 %488 to i64
  %490 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %489
  %491 = getelementptr inbounds %struct.string_data* %490, i32 0, i32 5
  %492 = load i32* %491, align 4
  %493 = add nsw i32 %492, 1
  store i32 %493, i32* %491, align 4
  %494 = sext i32 %492 to i64
  %495 = load i32* %s, align 4
  %496 = sext i32 %495 to i64
  %497 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %496
  %498 = getelementptr inbounds %struct.string_data* %497, i32 0, i32 6
  %499 = getelementptr inbounds [160 x i32]* %498, i32 0, i64 %494
  store i32 %487, i32* %499, align 4
  %500 = load i32* %1, align 4
  %501 = sub nsw i32 %500, 20
  %502 = sext i32 %501 to i64
  %503 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %502
  %504 = load i32* %503, align 4
  %505 = sext i32 %504 to i64
  %506 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %505
  %507 = getelementptr inbounds %struct.string_data* %506, i32 0, i32 5
  %508 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %509 = getelementptr inbounds %struct.change_stack_entry* %508, i32 0, i32 0
  store i32* %507, i32** %509, align 8
  %510 = load i32* %1, align 4
  %511 = sub nsw i32 %510, 20
  %512 = sext i32 %511 to i64
  %513 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %512
  %514 = load i32* %513, align 4
  %515 = sext i32 %514 to i64
  %516 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %515
  %517 = getelementptr inbounds %struct.string_data* %516, i32 0, i32 5
  %518 = load i32* %517, align 4
  %519 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %520 = getelementptr inbounds %struct.change_stack_entry* %519, i32 1
  store %struct.change_stack_entry* %520, %struct.change_stack_entry** @change_stack_pointer, align 8
  %521 = getelementptr inbounds %struct.change_stack_entry* %519, i32 0, i32 1
  store i32 %518, i32* %521, align 4
  %522 = load i32* %1, align 4
  %523 = sext i32 %522 to i64
  %524 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %523
  %525 = load i32* %524, align 4
  %526 = load i32* %1, align 4
  %527 = sub nsw i32 %526, 20
  %528 = sext i32 %527 to i64
  %529 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %528
  %530 = load i32* %529, align 4
  %531 = sext i32 %530 to i64
  %532 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %531
  %533 = getelementptr inbounds %struct.string_data* %532, i32 0, i32 5
  %534 = load i32* %533, align 4
  %535 = add nsw i32 %534, 1
  store i32 %535, i32* %533, align 4
  %536 = sext i32 %534 to i64
  %537 = load i32* %1, align 4
  %538 = sub nsw i32 %537, 20
  %539 = sext i32 %538 to i64
  %540 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %539
  %541 = load i32* %540, align 4
  %542 = sext i32 %541 to i64
  %543 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %542
  %544 = getelementptr inbounds %struct.string_data* %543, i32 0, i32 6
  %545 = getelementptr inbounds [160 x i32]* %544, i32 0, i64 %536
  store i32 %525, i32* %545, align 4
  %546 = load i32* @string_mark, align 4
  %547 = load i32* %1, align 4
  %548 = sub nsw i32 %547, 20
  %549 = sext i32 %548 to i64
  %550 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %549
  %551 = load i32* %550, align 4
  %552 = sext i32 %551 to i64
  %553 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %552
  %554 = getelementptr inbounds %struct.string_data* %553, i32 0, i32 7
  store i32 %546, i32* %554, align 4
  br label %581

; <label>:555                                     ; preds = %470, %461
  %556 = load i32* %1, align 4
  %557 = sub nsw i32 %556, 20
  %558 = sext i32 %557 to i64
  %559 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %558
  %560 = load i8* %559, align 1
  %561 = zext i8 %560 to i32
  %562 = load i32* %color, align 4
  %563 = icmp eq i32 %561, %562
  br i1 %563, label %564, label %580

; <label>:564                                     ; preds = %555
  %565 = load i32* %1, align 4
  %566 = sub nsw i32 %565, 20
  %567 = sext i32 %566 to i64
  %568 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %567
  %569 = load i32* %568, align 4
  %570 = sext i32 %569 to i64
  %571 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %570
  %572 = getelementptr inbounds %struct.string_data* %571, i32 0, i32 7
  %573 = load i32* %572, align 4
  %574 = load i32* @string_mark, align 4
  %575 = icmp ne i32 %573, %574
  br i1 %575, label %576, label %580

; <label>:576                                     ; preds = %564
  %577 = load i32* %s, align 4
  %578 = load i32* %1, align 4
  %579 = sub nsw i32 %578, 20
  call void @assimilate_string(i32 %577, i32 %579)
  br label %580

; <label>:580                                     ; preds = %576, %564, %555
  br label %581

; <label>:581                                     ; preds = %580, %482
  br label %582

; <label>:582                                     ; preds = %581, %460
  %583 = load i32* %1, align 4
  %584 = add nsw i32 %583, 1
  %585 = sext i32 %584 to i64
  %586 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %585
  %587 = load i8* %586, align 1
  %588 = zext i8 %587 to i32
  %589 = icmp eq i32 %588, 0
  br i1 %589, label %590, label %628

; <label>:590                                     ; preds = %582
  %591 = load i32* %1, align 4
  %592 = add nsw i32 %591, 1
  %593 = sext i32 %592 to i64
  %594 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %593
  %595 = load i32* %594, align 4
  %596 = load i32* @liberty_mark, align 4
  %597 = icmp ne i32 %595, %596
  br i1 %597, label %598, label %628

; <label>:598                                     ; preds = %590
  br label %599

; <label>:599                                     ; preds = %598
  %600 = load i32* %s, align 4
  %601 = sext i32 %600 to i64
  %602 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %601
  %603 = getelementptr inbounds %struct.string_data* %602, i32 0, i32 3
  %604 = load i32* %603, align 4
  %605 = icmp slt i32 %604, 20
  br i1 %605, label %606, label %620

; <label>:606                                     ; preds = %599
  %607 = load i32* %1, align 4
  %608 = add nsw i32 %607, 1
  %609 = load i32* %s, align 4
  %610 = sext i32 %609 to i64
  %611 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %610
  %612 = getelementptr inbounds %struct.string_data* %611, i32 0, i32 3
  %613 = load i32* %612, align 4
  %614 = sext i32 %613 to i64
  %615 = load i32* %s, align 4
  %616 = sext i32 %615 to i64
  %617 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %616
  %618 = getelementptr inbounds %struct.string_data* %617, i32 0, i32 4
  %619 = getelementptr inbounds [20 x i32]* %618, i32 0, i64 %614
  store i32 %608, i32* %619, align 4
  br label %620

; <label>:620                                     ; preds = %606, %599
  %621 = load i32* %s, align 4
  %622 = sext i32 %621 to i64
  %623 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %622
  %624 = getelementptr inbounds %struct.string_data* %623, i32 0, i32 3
  %625 = load i32* %624, align 4
  %626 = add nsw i32 %625, 1
  store i32 %626, i32* %624, align 4
  br label %627

; <label>:627                                     ; preds = %620
  br label %740

; <label>:628                                     ; preds = %590, %582
  %629 = load i32* %1, align 4
  %630 = add nsw i32 %629, 1
  %631 = sext i32 %630 to i64
  %632 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %631
  %633 = load i8* %632, align 1
  %634 = zext i8 %633 to i32
  %635 = load i32* %other, align 4
  %636 = icmp eq i32 %634, %635
  br i1 %636, label %637, label %713

; <label>:637                                     ; preds = %628
  %638 = load i32* %1, align 4
  %639 = add nsw i32 %638, 1
  %640 = sext i32 %639 to i64
  %641 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %640
  %642 = load i32* %641, align 4
  %643 = sext i32 %642 to i64
  %644 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %643
  %645 = getelementptr inbounds %struct.string_data* %644, i32 0, i32 7
  %646 = load i32* %645, align 4
  %647 = load i32* @string_mark, align 4
  %648 = icmp ne i32 %646, %647
  br i1 %648, label %649, label %713

; <label>:649                                     ; preds = %637
  %650 = load i32* %1, align 4
  %651 = add nsw i32 %650, 1
  %652 = sext i32 %651 to i64
  %653 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %652
  %654 = load i32* %653, align 4
  %655 = load i32* %s, align 4
  %656 = sext i32 %655 to i64
  %657 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %656
  %658 = getelementptr inbounds %struct.string_data* %657, i32 0, i32 5
  %659 = load i32* %658, align 4
  %660 = add nsw i32 %659, 1
  store i32 %660, i32* %658, align 4
  %661 = sext i32 %659 to i64
  %662 = load i32* %s, align 4
  %663 = sext i32 %662 to i64
  %664 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %663
  %665 = getelementptr inbounds %struct.string_data* %664, i32 0, i32 6
  %666 = getelementptr inbounds [160 x i32]* %665, i32 0, i64 %661
  store i32 %654, i32* %666, align 4
  %667 = load i32* %1, align 4
  %668 = add nsw i32 %667, 1
  %669 = sext i32 %668 to i64
  %670 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %669
  %671 = load i32* %670, align 4
  %672 = sext i32 %671 to i64
  %673 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %672
  %674 = getelementptr inbounds %struct.string_data* %673, i32 0, i32 5
  %675 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %676 = getelementptr inbounds %struct.change_stack_entry* %675, i32 0, i32 0
  store i32* %674, i32** %676, align 8
  %677 = load i32* %1, align 4
  %678 = add nsw i32 %677, 1
  %679 = sext i32 %678 to i64
  %680 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %679
  %681 = load i32* %680, align 4
  %682 = sext i32 %681 to i64
  %683 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %682
  %684 = getelementptr inbounds %struct.string_data* %683, i32 0, i32 5
  %685 = load i32* %684, align 4
  %686 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %687 = getelementptr inbounds %struct.change_stack_entry* %686, i32 1
  store %struct.change_stack_entry* %687, %struct.change_stack_entry** @change_stack_pointer, align 8
  %688 = getelementptr inbounds %struct.change_stack_entry* %686, i32 0, i32 1
  store i32 %685, i32* %688, align 4
  %689 = load i32* %1, align 4
  %690 = sext i32 %689 to i64
  %691 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %690
  %692 = load i32* %691, align 4
  %693 = load i32* %1, align 4
  %694 = add nsw i32 %693, 1
  %695 = sext i32 %694 to i64
  %696 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %695
  %697 = load i32* %696, align 4
  %698 = sext i32 %697 to i64
  %699 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %698
  %700 = getelementptr inbounds %struct.string_data* %699, i32 0, i32 5
  %701 = load i32* %700, align 4
  %702 = add nsw i32 %701, 1
  store i32 %702, i32* %700, align 4
  %703 = sext i32 %701 to i64
  %704 = load i32* %1, align 4
  %705 = add nsw i32 %704, 1
  %706 = sext i32 %705 to i64
  %707 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %706
  %708 = load i32* %707, align 4
  %709 = sext i32 %708 to i64
  %710 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %709
  %711 = getelementptr inbounds %struct.string_data* %710, i32 0, i32 6
  %712 = getelementptr inbounds [160 x i32]* %711, i32 0, i64 %703
  store i32 %692, i32* %712, align 4
  br label %739

; <label>:713                                     ; preds = %637, %628
  %714 = load i32* %1, align 4
  %715 = add nsw i32 %714, 1
  %716 = sext i32 %715 to i64
  %717 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %716
  %718 = load i8* %717, align 1
  %719 = zext i8 %718 to i32
  %720 = load i32* %color, align 4
  %721 = icmp eq i32 %719, %720
  br i1 %721, label %722, label %738

; <label>:722                                     ; preds = %713
  %723 = load i32* %1, align 4
  %724 = add nsw i32 %723, 1
  %725 = sext i32 %724 to i64
  %726 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %725
  %727 = load i32* %726, align 4
  %728 = sext i32 %727 to i64
  %729 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %728
  %730 = getelementptr inbounds %struct.string_data* %729, i32 0, i32 7
  %731 = load i32* %730, align 4
  %732 = load i32* @string_mark, align 4
  %733 = icmp ne i32 %731, %732
  br i1 %733, label %734, label %738

; <label>:734                                     ; preds = %722
  %735 = load i32* %s, align 4
  %736 = load i32* %1, align 4
  %737 = add nsw i32 %736, 1
  call void @assimilate_string(i32 %735, i32 %737)
  br label %738

; <label>:738                                     ; preds = %734, %722, %713
  br label %739

; <label>:739                                     ; preds = %738, %649
  br label %740

; <label>:740                                     ; preds = %739, %627
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @assimilate_string(i32 %s, i32 %pos) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %k = alloca i32, align 4
  %last = alloca i32, align 4
  %s2 = alloca i32, align 4
  %pos2 = alloca i32, align 4
  %pos21 = alloca i32, align 4
  %t = alloca i32, align 4
  store i32 %s, i32* %1, align 4
  store i32 %pos, i32* %2, align 4
  %3 = load i32* %2, align 4
  %4 = sext i32 %3 to i64
  %5 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %4
  %6 = load i32* %5, align 4
  store i32 %6, i32* %s2, align 4
  %7 = load i32* %s2, align 4
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %8
  %10 = getelementptr inbounds %struct.string_data* %9, i32 0, i32 1
  %11 = load i32* %10, align 4
  %12 = load i32* %1, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %13
  %15 = getelementptr inbounds %struct.string_data* %14, i32 0, i32 1
  %16 = load i32* %15, align 4
  %17 = add nsw i32 %16, %11
  store i32 %17, i32* %15, align 4
  %18 = load i32* %s2, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %19
  %21 = getelementptr inbounds %struct.string_data* %20, i32 0, i32 2
  %22 = load i32* %21, align 4
  store i32 %22, i32* %2, align 4
  br label %23

; <label>:23                                      ; preds = %45, %0
  %24 = load i32* %2, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %25
  %27 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %28 = getelementptr inbounds %struct.change_stack_entry* %27, i32 0, i32 0
  store i32* %26, i32** %28, align 8
  %29 = load i32* %2, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %30
  %32 = load i32* %31, align 4
  %33 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %34 = getelementptr inbounds %struct.change_stack_entry* %33, i32 1
  store %struct.change_stack_entry* %34, %struct.change_stack_entry** @change_stack_pointer, align 8
  %35 = getelementptr inbounds %struct.change_stack_entry* %33, i32 0, i32 1
  store i32 %32, i32* %35, align 4
  %36 = load i32* %1, align 4
  %37 = load i32* %2, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds [400 x i32]* @string_number, i32 0, i64 %38
  store i32 %36, i32* %39, align 4
  %40 = load i32* %2, align 4
  store i32 %40, i32* %last, align 4
  %41 = load i32* %2, align 4
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds [400 x i32]* @next_stone, i32 0, i64 %42
  %44 = load i32* %43, align 4
  store i32 %44, i32* %2, align 4
  br label %45

; <label>:45                                      ; preds = %23
  %46 = load i32* %2, align 4
  %47 = load i32* %s2, align 4
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %48
  %50 = getelementptr inbounds %struct.string_data* %49, i32 0, i32 2
  %51 = load i32* %50, align 4
  %52 = icmp eq i32 %46, %51
  %53 = xor i1 %52, true
  br i1 %53, label %23, label %54

; <label>:54                                      ; preds = %45
  %55 = load i32* %1, align 4
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %56
  %58 = getelementptr inbounds %struct.string_data* %57, i32 0, i32 2
  %59 = load i32* %58, align 4
  store i32 %59, i32* %pos2, align 4
  %60 = load i32* %last, align 4
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds [400 x i32]* @next_stone, i32 0, i64 %61
  %63 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %64 = getelementptr inbounds %struct.change_stack_entry* %63, i32 0, i32 0
  store i32* %62, i32** %64, align 8
  %65 = load i32* %last, align 4
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds [400 x i32]* @next_stone, i32 0, i64 %66
  %68 = load i32* %67, align 4
  %69 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %70 = getelementptr inbounds %struct.change_stack_entry* %69, i32 1
  store %struct.change_stack_entry* %70, %struct.change_stack_entry** @change_stack_pointer, align 8
  %71 = getelementptr inbounds %struct.change_stack_entry* %69, i32 0, i32 1
  store i32 %68, i32* %71, align 4
  %72 = load i32* %pos2, align 4
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds [400 x i32]* @next_stone, i32 0, i64 %73
  %75 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %76 = getelementptr inbounds %struct.change_stack_entry* %75, i32 0, i32 0
  store i32* %74, i32** %76, align 8
  %77 = load i32* %pos2, align 4
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds [400 x i32]* @next_stone, i32 0, i64 %78
  %80 = load i32* %79, align 4
  %81 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %82 = getelementptr inbounds %struct.change_stack_entry* %81, i32 1
  store %struct.change_stack_entry* %82, %struct.change_stack_entry** @change_stack_pointer, align 8
  %83 = getelementptr inbounds %struct.change_stack_entry* %81, i32 0, i32 1
  store i32 %80, i32* %83, align 4
  %84 = load i32* %pos2, align 4
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds [400 x i32]* @next_stone, i32 0, i64 %85
  %87 = load i32* %86, align 4
  %88 = load i32* %last, align 4
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds [400 x i32]* @next_stone, i32 0, i64 %89
  store i32 %87, i32* %90, align 4
  %91 = load i32* %s2, align 4
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %92
  %94 = getelementptr inbounds %struct.string_data* %93, i32 0, i32 2
  %95 = load i32* %94, align 4
  %96 = load i32* %pos2, align 4
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds [400 x i32]* @next_stone, i32 0, i64 %97
  store i32 %95, i32* %98, align 4
  %99 = load i32* %s2, align 4
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %100
  %102 = getelementptr inbounds %struct.string_data* %101, i32 0, i32 2
  %103 = load i32* %102, align 4
  %104 = load i32* %pos2, align 4
  %105 = icmp slt i32 %103, %104
  br i1 %105, label %106, label %116

; <label>:106                                     ; preds = %54
  %107 = load i32* %s2, align 4
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %108
  %110 = getelementptr inbounds %struct.string_data* %109, i32 0, i32 2
  %111 = load i32* %110, align 4
  %112 = load i32* %1, align 4
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %113
  %115 = getelementptr inbounds %struct.string_data* %114, i32 0, i32 2
  store i32 %111, i32* %115, align 4
  br label %116

; <label>:116                                     ; preds = %106, %54
  %117 = load i32* %s2, align 4
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %118
  %120 = getelementptr inbounds %struct.string_data* %119, i32 0, i32 3
  %121 = load i32* %120, align 4
  %122 = icmp sle i32 %121, 20
  br i1 %122, label %123, label %192

; <label>:123                                     ; preds = %116
  store i32 0, i32* %k, align 4
  br label %124

; <label>:124                                     ; preds = %188, %123
  %125 = load i32* %k, align 4
  %126 = load i32* %s2, align 4
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %127
  %129 = getelementptr inbounds %struct.string_data* %128, i32 0, i32 3
  %130 = load i32* %129, align 4
  %131 = icmp slt i32 %125, %130
  br i1 %131, label %132, label %191

; <label>:132                                     ; preds = %124
  %133 = load i32* %k, align 4
  %134 = sext i32 %133 to i64
  %135 = load i32* %s2, align 4
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %136
  %138 = getelementptr inbounds %struct.string_data* %137, i32 0, i32 4
  %139 = getelementptr inbounds [20 x i32]* %138, i32 0, i64 %134
  %140 = load i32* %139, align 4
  store i32 %140, i32* %pos21, align 4
  %141 = load i32* %pos21, align 4
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %142
  %144 = load i8* %143, align 1
  %145 = zext i8 %144 to i32
  %146 = icmp eq i32 %145, 0
  br i1 %146, label %147, label %187

; <label>:147                                     ; preds = %132
  %148 = load i32* %pos21, align 4
  %149 = sext i32 %148 to i64
  %150 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %149
  %151 = load i32* %150, align 4
  %152 = load i32* @liberty_mark, align 4
  %153 = icmp ne i32 %151, %152
  br i1 %153, label %154, label %187

; <label>:154                                     ; preds = %147
  br label %155

; <label>:155                                     ; preds = %154
  %156 = load i32* %1, align 4
  %157 = sext i32 %156 to i64
  %158 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %157
  %159 = getelementptr inbounds %struct.string_data* %158, i32 0, i32 3
  %160 = load i32* %159, align 4
  %161 = icmp slt i32 %160, 20
  br i1 %161, label %162, label %175

; <label>:162                                     ; preds = %155
  %163 = load i32* %pos21, align 4
  %164 = load i32* %1, align 4
  %165 = sext i32 %164 to i64
  %166 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %165
  %167 = getelementptr inbounds %struct.string_data* %166, i32 0, i32 3
  %168 = load i32* %167, align 4
  %169 = sext i32 %168 to i64
  %170 = load i32* %1, align 4
  %171 = sext i32 %170 to i64
  %172 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %171
  %173 = getelementptr inbounds %struct.string_data* %172, i32 0, i32 4
  %174 = getelementptr inbounds [20 x i32]* %173, i32 0, i64 %169
  store i32 %163, i32* %174, align 4
  br label %175

; <label>:175                                     ; preds = %162, %155
  %176 = load i32* %1, align 4
  %177 = sext i32 %176 to i64
  %178 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %177
  %179 = getelementptr inbounds %struct.string_data* %178, i32 0, i32 3
  %180 = load i32* %179, align 4
  %181 = add nsw i32 %180, 1
  store i32 %181, i32* %179, align 4
  %182 = load i32* @liberty_mark, align 4
  %183 = load i32* %pos21, align 4
  %184 = sext i32 %183 to i64
  %185 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %184
  store i32 %182, i32* %185, align 4
  br label %186

; <label>:186                                     ; preds = %175
  br label %187

; <label>:187                                     ; preds = %186, %147, %132
  br label %188

; <label>:188                                     ; preds = %187
  %189 = load i32* %k, align 4
  %190 = add nsw i32 %189, 1
  store i32 %190, i32* %k, align 4
  br label %124

; <label>:191                                     ; preds = %124
  br label %200

; <label>:192                                     ; preds = %116
  %193 = load i32* @liberty_mark, align 4
  %194 = add nsw i32 %193, 1
  store i32 %194, i32* @liberty_mark, align 4
  %195 = load i32* %1, align 4
  %196 = sext i32 %195 to i64
  %197 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %196
  %198 = getelementptr inbounds %struct.string_data* %197, i32 0, i32 3
  store i32 0, i32* %198, align 4
  %199 = load i32* %1, align 4
  call void @update_liberties(i32 %199)
  br label %200

; <label>:200                                     ; preds = %192, %191
  store i32 0, i32* %k, align 4
  br label %201

; <label>:201                                     ; preds = %274, %200
  %202 = load i32* %k, align 4
  %203 = load i32* %s2, align 4
  %204 = sext i32 %203 to i64
  %205 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %204
  %206 = getelementptr inbounds %struct.string_data* %205, i32 0, i32 5
  %207 = load i32* %206, align 4
  %208 = icmp slt i32 %202, %207
  br i1 %208, label %209, label %277

; <label>:209                                     ; preds = %201
  %210 = load i32* %k, align 4
  %211 = sext i32 %210 to i64
  %212 = load i32* %s2, align 4
  %213 = sext i32 %212 to i64
  %214 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %213
  %215 = getelementptr inbounds %struct.string_data* %214, i32 0, i32 6
  %216 = getelementptr inbounds [160 x i32]* %215, i32 0, i64 %211
  %217 = load i32* %216, align 4
  store i32 %217, i32* %t, align 4
  %218 = load i32* %t, align 4
  %219 = load i32* %s2, align 4
  call void @remove_neighbor(i32 %218, i32 %219)
  %220 = load i32* %t, align 4
  %221 = sext i32 %220 to i64
  %222 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %221
  %223 = getelementptr inbounds %struct.string_data* %222, i32 0, i32 7
  %224 = load i32* %223, align 4
  %225 = load i32* @string_mark, align 4
  %226 = icmp ne i32 %224, %225
  br i1 %226, label %227, label %273

; <label>:227                                     ; preds = %209
  %228 = load i32* %t, align 4
  %229 = sext i32 %228 to i64
  %230 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %229
  %231 = getelementptr inbounds %struct.string_data* %230, i32 0, i32 5
  %232 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %233 = getelementptr inbounds %struct.change_stack_entry* %232, i32 0, i32 0
  store i32* %231, i32** %233, align 8
  %234 = load i32* %t, align 4
  %235 = sext i32 %234 to i64
  %236 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %235
  %237 = getelementptr inbounds %struct.string_data* %236, i32 0, i32 5
  %238 = load i32* %237, align 4
  %239 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %240 = getelementptr inbounds %struct.change_stack_entry* %239, i32 1
  store %struct.change_stack_entry* %240, %struct.change_stack_entry** @change_stack_pointer, align 8
  %241 = getelementptr inbounds %struct.change_stack_entry* %239, i32 0, i32 1
  store i32 %238, i32* %241, align 4
  %242 = load i32* %1, align 4
  %243 = load i32* %t, align 4
  %244 = sext i32 %243 to i64
  %245 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %244
  %246 = getelementptr inbounds %struct.string_data* %245, i32 0, i32 5
  %247 = load i32* %246, align 4
  %248 = add nsw i32 %247, 1
  store i32 %248, i32* %246, align 4
  %249 = sext i32 %247 to i64
  %250 = load i32* %t, align 4
  %251 = sext i32 %250 to i64
  %252 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %251
  %253 = getelementptr inbounds %struct.string_data* %252, i32 0, i32 6
  %254 = getelementptr inbounds [160 x i32]* %253, i32 0, i64 %249
  store i32 %242, i32* %254, align 4
  %255 = load i32* %t, align 4
  %256 = load i32* %1, align 4
  %257 = sext i32 %256 to i64
  %258 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %257
  %259 = getelementptr inbounds %struct.string_data* %258, i32 0, i32 5
  %260 = load i32* %259, align 4
  %261 = add nsw i32 %260, 1
  store i32 %261, i32* %259, align 4
  %262 = sext i32 %260 to i64
  %263 = load i32* %1, align 4
  %264 = sext i32 %263 to i64
  %265 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %264
  %266 = getelementptr inbounds %struct.string_data* %265, i32 0, i32 6
  %267 = getelementptr inbounds [160 x i32]* %266, i32 0, i64 %262
  store i32 %255, i32* %267, align 4
  %268 = load i32* @string_mark, align 4
  %269 = load i32* %t, align 4
  %270 = sext i32 %269 to i64
  %271 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %270
  %272 = getelementptr inbounds %struct.string_data* %271, i32 0, i32 7
  store i32 %268, i32* %272, align 4
  br label %273

; <label>:273                                     ; preds = %227, %209
  br label %274

; <label>:274                                     ; preds = %273
  %275 = load i32* %k, align 4
  %276 = add nsw i32 %275, 1
  store i32 %276, i32* %k, align 4
  br label %201

; <label>:277                                     ; preds = %201
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @update_liberties(i32 %s) #0 {
  %1 = alloca i32, align 4
  %pos = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 %s, i32* %1, align 4
  %2 = load i32* %1, align 4
  %3 = sext i32 %2 to i64
  %4 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %3
  %5 = getelementptr inbounds %struct.string_data* %4, i32 0, i32 3
  %6 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %7 = getelementptr inbounds %struct.change_stack_entry* %6, i32 0, i32 0
  store i32* %5, i32** %7, align 8
  %8 = load i32* %1, align 4
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %9
  %11 = getelementptr inbounds %struct.string_data* %10, i32 0, i32 3
  %12 = load i32* %11, align 4
  %13 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %14 = getelementptr inbounds %struct.change_stack_entry* %13, i32 1
  store %struct.change_stack_entry* %14, %struct.change_stack_entry** @change_stack_pointer, align 8
  %15 = getelementptr inbounds %struct.change_stack_entry* %13, i32 0, i32 1
  store i32 %12, i32* %15, align 4
  store i32 0, i32* %k, align 4
  br label %16

; <label>:16                                      ; preds = %50, %0
  %17 = load i32* %k, align 4
  %18 = load i32* %1, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %19
  %21 = getelementptr inbounds %struct.string_data* %20, i32 0, i32 3
  %22 = load i32* %21, align 4
  %23 = icmp slt i32 %17, %22
  br i1 %23, label %24, label %27

; <label>:24                                      ; preds = %16
  %25 = load i32* %k, align 4
  %26 = icmp slt i32 %25, 20
  br label %27

; <label>:27                                      ; preds = %24, %16
  %28 = phi i1 [ false, %16 ], [ %26, %24 ]
  br i1 %28, label %29, label %53

; <label>:29                                      ; preds = %27
  %30 = load i32* %k, align 4
  %31 = sext i32 %30 to i64
  %32 = load i32* %1, align 4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %33
  %35 = getelementptr inbounds %struct.string_data* %34, i32 0, i32 4
  %36 = getelementptr inbounds [20 x i32]* %35, i32 0, i64 %31
  %37 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %38 = getelementptr inbounds %struct.change_stack_entry* %37, i32 0, i32 0
  store i32* %36, i32** %38, align 8
  %39 = load i32* %k, align 4
  %40 = sext i32 %39 to i64
  %41 = load i32* %1, align 4
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %42
  %44 = getelementptr inbounds %struct.string_data* %43, i32 0, i32 4
  %45 = getelementptr inbounds [20 x i32]* %44, i32 0, i64 %40
  %46 = load i32* %45, align 4
  %47 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %48 = getelementptr inbounds %struct.change_stack_entry* %47, i32 1
  store %struct.change_stack_entry* %48, %struct.change_stack_entry** @change_stack_pointer, align 8
  %49 = getelementptr inbounds %struct.change_stack_entry* %47, i32 0, i32 1
  store i32 %46, i32* %49, align 4
  br label %50

; <label>:50                                      ; preds = %29
  %51 = load i32* %k, align 4
  %52 = add nsw i32 %51, 1
  store i32 %52, i32* %k, align 4
  br label %16

; <label>:53                                      ; preds = %27
  %54 = load i32* %1, align 4
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %55
  %57 = getelementptr inbounds %struct.string_data* %56, i32 0, i32 3
  store i32 0, i32* %57, align 4
  %58 = load i32* @liberty_mark, align 4
  %59 = add nsw i32 %58, 1
  store i32 %59, i32* @liberty_mark, align 4
  %60 = load i32* %1, align 4
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %61
  %63 = getelementptr inbounds %struct.string_data* %62, i32 0, i32 2
  %64 = load i32* %63, align 4
  store i32 %64, i32* %pos, align 4
  br label %65

; <label>:65                                      ; preds = %274, %53
  %66 = load i32* %pos, align 4
  %67 = add nsw i32 %66, 20
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %68
  %70 = load i8* %69, align 1
  %71 = zext i8 %70 to i32
  %72 = icmp eq i32 %71, 0
  br i1 %72, label %73, label %116

; <label>:73                                      ; preds = %65
  %74 = load i32* %pos, align 4
  %75 = add nsw i32 %74, 20
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %76
  %78 = load i32* %77, align 4
  %79 = load i32* @liberty_mark, align 4
  %80 = icmp ne i32 %78, %79
  br i1 %80, label %81, label %116

; <label>:81                                      ; preds = %73
  br label %82

; <label>:82                                      ; preds = %81
  %83 = load i32* %1, align 4
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %84
  %86 = getelementptr inbounds %struct.string_data* %85, i32 0, i32 3
  %87 = load i32* %86, align 4
  %88 = icmp slt i32 %87, 20
  br i1 %88, label %89, label %103

; <label>:89                                      ; preds = %82
  %90 = load i32* %pos, align 4
  %91 = add nsw i32 %90, 20
  %92 = load i32* %1, align 4
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %93
  %95 = getelementptr inbounds %struct.string_data* %94, i32 0, i32 3
  %96 = load i32* %95, align 4
  %97 = sext i32 %96 to i64
  %98 = load i32* %1, align 4
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %99
  %101 = getelementptr inbounds %struct.string_data* %100, i32 0, i32 4
  %102 = getelementptr inbounds [20 x i32]* %101, i32 0, i64 %97
  store i32 %91, i32* %102, align 4
  br label %103

; <label>:103                                     ; preds = %89, %82
  %104 = load i32* %1, align 4
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %105
  %107 = getelementptr inbounds %struct.string_data* %106, i32 0, i32 3
  %108 = load i32* %107, align 4
  %109 = add nsw i32 %108, 1
  store i32 %109, i32* %107, align 4
  %110 = load i32* @liberty_mark, align 4
  %111 = load i32* %pos, align 4
  %112 = add nsw i32 %111, 20
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %113
  store i32 %110, i32* %114, align 4
  br label %115

; <label>:115                                     ; preds = %103
  br label %116

; <label>:116                                     ; preds = %115, %73, %65
  %117 = load i32* %pos, align 4
  %118 = sub nsw i32 %117, 1
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %119
  %121 = load i8* %120, align 1
  %122 = zext i8 %121 to i32
  %123 = icmp eq i32 %122, 0
  br i1 %123, label %124, label %167

; <label>:124                                     ; preds = %116
  %125 = load i32* %pos, align 4
  %126 = sub nsw i32 %125, 1
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %127
  %129 = load i32* %128, align 4
  %130 = load i32* @liberty_mark, align 4
  %131 = icmp ne i32 %129, %130
  br i1 %131, label %132, label %167

; <label>:132                                     ; preds = %124
  br label %133

; <label>:133                                     ; preds = %132
  %134 = load i32* %1, align 4
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %135
  %137 = getelementptr inbounds %struct.string_data* %136, i32 0, i32 3
  %138 = load i32* %137, align 4
  %139 = icmp slt i32 %138, 20
  br i1 %139, label %140, label %154

; <label>:140                                     ; preds = %133
  %141 = load i32* %pos, align 4
  %142 = sub nsw i32 %141, 1
  %143 = load i32* %1, align 4
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %144
  %146 = getelementptr inbounds %struct.string_data* %145, i32 0, i32 3
  %147 = load i32* %146, align 4
  %148 = sext i32 %147 to i64
  %149 = load i32* %1, align 4
  %150 = sext i32 %149 to i64
  %151 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %150
  %152 = getelementptr inbounds %struct.string_data* %151, i32 0, i32 4
  %153 = getelementptr inbounds [20 x i32]* %152, i32 0, i64 %148
  store i32 %142, i32* %153, align 4
  br label %154

; <label>:154                                     ; preds = %140, %133
  %155 = load i32* %1, align 4
  %156 = sext i32 %155 to i64
  %157 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %156
  %158 = getelementptr inbounds %struct.string_data* %157, i32 0, i32 3
  %159 = load i32* %158, align 4
  %160 = add nsw i32 %159, 1
  store i32 %160, i32* %158, align 4
  %161 = load i32* @liberty_mark, align 4
  %162 = load i32* %pos, align 4
  %163 = sub nsw i32 %162, 1
  %164 = sext i32 %163 to i64
  %165 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %164
  store i32 %161, i32* %165, align 4
  br label %166

; <label>:166                                     ; preds = %154
  br label %167

; <label>:167                                     ; preds = %166, %124, %116
  %168 = load i32* %pos, align 4
  %169 = sub nsw i32 %168, 20
  %170 = sext i32 %169 to i64
  %171 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %170
  %172 = load i8* %171, align 1
  %173 = zext i8 %172 to i32
  %174 = icmp eq i32 %173, 0
  br i1 %174, label %175, label %218

; <label>:175                                     ; preds = %167
  %176 = load i32* %pos, align 4
  %177 = sub nsw i32 %176, 20
  %178 = sext i32 %177 to i64
  %179 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %178
  %180 = load i32* %179, align 4
  %181 = load i32* @liberty_mark, align 4
  %182 = icmp ne i32 %180, %181
  br i1 %182, label %183, label %218

; <label>:183                                     ; preds = %175
  br label %184

; <label>:184                                     ; preds = %183
  %185 = load i32* %1, align 4
  %186 = sext i32 %185 to i64
  %187 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %186
  %188 = getelementptr inbounds %struct.string_data* %187, i32 0, i32 3
  %189 = load i32* %188, align 4
  %190 = icmp slt i32 %189, 20
  br i1 %190, label %191, label %205

; <label>:191                                     ; preds = %184
  %192 = load i32* %pos, align 4
  %193 = sub nsw i32 %192, 20
  %194 = load i32* %1, align 4
  %195 = sext i32 %194 to i64
  %196 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %195
  %197 = getelementptr inbounds %struct.string_data* %196, i32 0, i32 3
  %198 = load i32* %197, align 4
  %199 = sext i32 %198 to i64
  %200 = load i32* %1, align 4
  %201 = sext i32 %200 to i64
  %202 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %201
  %203 = getelementptr inbounds %struct.string_data* %202, i32 0, i32 4
  %204 = getelementptr inbounds [20 x i32]* %203, i32 0, i64 %199
  store i32 %193, i32* %204, align 4
  br label %205

; <label>:205                                     ; preds = %191, %184
  %206 = load i32* %1, align 4
  %207 = sext i32 %206 to i64
  %208 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %207
  %209 = getelementptr inbounds %struct.string_data* %208, i32 0, i32 3
  %210 = load i32* %209, align 4
  %211 = add nsw i32 %210, 1
  store i32 %211, i32* %209, align 4
  %212 = load i32* @liberty_mark, align 4
  %213 = load i32* %pos, align 4
  %214 = sub nsw i32 %213, 20
  %215 = sext i32 %214 to i64
  %216 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %215
  store i32 %212, i32* %216, align 4
  br label %217

; <label>:217                                     ; preds = %205
  br label %218

; <label>:218                                     ; preds = %217, %175, %167
  %219 = load i32* %pos, align 4
  %220 = add nsw i32 %219, 1
  %221 = sext i32 %220 to i64
  %222 = getelementptr inbounds [421 x i8]* @board, i32 0, i64 %221
  %223 = load i8* %222, align 1
  %224 = zext i8 %223 to i32
  %225 = icmp eq i32 %224, 0
  br i1 %225, label %226, label %269

; <label>:226                                     ; preds = %218
  %227 = load i32* %pos, align 4
  %228 = add nsw i32 %227, 1
  %229 = sext i32 %228 to i64
  %230 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %229
  %231 = load i32* %230, align 4
  %232 = load i32* @liberty_mark, align 4
  %233 = icmp ne i32 %231, %232
  br i1 %233, label %234, label %269

; <label>:234                                     ; preds = %226
  br label %235

; <label>:235                                     ; preds = %234
  %236 = load i32* %1, align 4
  %237 = sext i32 %236 to i64
  %238 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %237
  %239 = getelementptr inbounds %struct.string_data* %238, i32 0, i32 3
  %240 = load i32* %239, align 4
  %241 = icmp slt i32 %240, 20
  br i1 %241, label %242, label %256

; <label>:242                                     ; preds = %235
  %243 = load i32* %pos, align 4
  %244 = add nsw i32 %243, 1
  %245 = load i32* %1, align 4
  %246 = sext i32 %245 to i64
  %247 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %246
  %248 = getelementptr inbounds %struct.string_data* %247, i32 0, i32 3
  %249 = load i32* %248, align 4
  %250 = sext i32 %249 to i64
  %251 = load i32* %1, align 4
  %252 = sext i32 %251 to i64
  %253 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %252
  %254 = getelementptr inbounds %struct.string_data* %253, i32 0, i32 4
  %255 = getelementptr inbounds [20 x i32]* %254, i32 0, i64 %250
  store i32 %244, i32* %255, align 4
  br label %256

; <label>:256                                     ; preds = %242, %235
  %257 = load i32* %1, align 4
  %258 = sext i32 %257 to i64
  %259 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %258
  %260 = getelementptr inbounds %struct.string_data* %259, i32 0, i32 3
  %261 = load i32* %260, align 4
  %262 = add nsw i32 %261, 1
  store i32 %262, i32* %260, align 4
  %263 = load i32* @liberty_mark, align 4
  %264 = load i32* %pos, align 4
  %265 = add nsw i32 %264, 1
  %266 = sext i32 %265 to i64
  %267 = getelementptr inbounds [400 x i32]* @ml, i32 0, i64 %266
  store i32 %263, i32* %267, align 4
  br label %268

; <label>:268                                     ; preds = %256
  br label %269

; <label>:269                                     ; preds = %268, %226, %218
  %270 = load i32* %pos, align 4
  %271 = sext i32 %270 to i64
  %272 = getelementptr inbounds [400 x i32]* @next_stone, i32 0, i64 %271
  %273 = load i32* %272, align 4
  store i32 %273, i32* %pos, align 4
  br label %274

; <label>:274                                     ; preds = %269
  %275 = load i32* %pos, align 4
  %276 = load i32* %1, align 4
  %277 = sext i32 %276 to i64
  %278 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %277
  %279 = getelementptr inbounds %struct.string_data* %278, i32 0, i32 2
  %280 = load i32* %279, align 4
  %281 = icmp eq i32 %275, %280
  %282 = xor i1 %281, true
  br i1 %282, label %65, label %283

; <label>:283                                     ; preds = %274
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @remove_neighbor(i32 %str_number, i32 %n) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %k = alloca i32, align 4
  %done = alloca i32, align 4
  %s = alloca %struct.string_data*, align 8
  store i32 %str_number, i32* %1, align 4
  store i32 %n, i32* %2, align 4
  store i32 0, i32* %done, align 4
  %3 = load i32* %1, align 4
  %4 = sext i32 %3 to i64
  %5 = getelementptr inbounds [240 x %struct.string_data]* @string, i32 0, i64 %4
  store %struct.string_data* %5, %struct.string_data** %s, align 8
  store i32 0, i32* %k, align 4
  br label %6

; <label>:6                                       ; preds = %89, %0
  %7 = load i32* %k, align 4
  %8 = load %struct.string_data** %s, align 8
  %9 = getelementptr inbounds %struct.string_data* %8, i32 0, i32 5
  %10 = load i32* %9, align 4
  %11 = icmp slt i32 %7, %10
  br i1 %11, label %12, label %92

; <label>:12                                      ; preds = %6
  %13 = load i32* %k, align 4
  %14 = sext i32 %13 to i64
  %15 = load %struct.string_data** %s, align 8
  %16 = getelementptr inbounds %struct.string_data* %15, i32 0, i32 6
  %17 = getelementptr inbounds [160 x i32]* %16, i32 0, i64 %14
  %18 = load i32* %17, align 4
  %19 = load i32* %2, align 4
  %20 = icmp eq i32 %18, %19
  br i1 %20, label %21, label %88

; <label>:21                                      ; preds = %12
  %22 = load %struct.string_data** %s, align 8
  %23 = getelementptr inbounds %struct.string_data* %22, i32 0, i32 5
  %24 = load i32* %23, align 4
  %25 = sub nsw i32 %24, 1
  %26 = sext i32 %25 to i64
  %27 = load %struct.string_data** %s, align 8
  %28 = getelementptr inbounds %struct.string_data* %27, i32 0, i32 6
  %29 = getelementptr inbounds [160 x i32]* %28, i32 0, i64 %26
  %30 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %31 = getelementptr inbounds %struct.change_stack_entry* %30, i32 0, i32 0
  store i32* %29, i32** %31, align 8
  %32 = load %struct.string_data** %s, align 8
  %33 = getelementptr inbounds %struct.string_data* %32, i32 0, i32 5
  %34 = load i32* %33, align 4
  %35 = sub nsw i32 %34, 1
  %36 = sext i32 %35 to i64
  %37 = load %struct.string_data** %s, align 8
  %38 = getelementptr inbounds %struct.string_data* %37, i32 0, i32 6
  %39 = getelementptr inbounds [160 x i32]* %38, i32 0, i64 %36
  %40 = load i32* %39, align 4
  %41 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %42 = getelementptr inbounds %struct.change_stack_entry* %41, i32 1
  store %struct.change_stack_entry* %42, %struct.change_stack_entry** @change_stack_pointer, align 8
  %43 = getelementptr inbounds %struct.change_stack_entry* %41, i32 0, i32 1
  store i32 %40, i32* %43, align 4
  %44 = load i32* %k, align 4
  %45 = sext i32 %44 to i64
  %46 = load %struct.string_data** %s, align 8
  %47 = getelementptr inbounds %struct.string_data* %46, i32 0, i32 6
  %48 = getelementptr inbounds [160 x i32]* %47, i32 0, i64 %45
  %49 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %50 = getelementptr inbounds %struct.change_stack_entry* %49, i32 0, i32 0
  store i32* %48, i32** %50, align 8
  %51 = load i32* %k, align 4
  %52 = sext i32 %51 to i64
  %53 = load %struct.string_data** %s, align 8
  %54 = getelementptr inbounds %struct.string_data* %53, i32 0, i32 6
  %55 = getelementptr inbounds [160 x i32]* %54, i32 0, i64 %52
  %56 = load i32* %55, align 4
  %57 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %58 = getelementptr inbounds %struct.change_stack_entry* %57, i32 1
  store %struct.change_stack_entry* %58, %struct.change_stack_entry** @change_stack_pointer, align 8
  %59 = getelementptr inbounds %struct.change_stack_entry* %57, i32 0, i32 1
  store i32 %56, i32* %59, align 4
  %60 = load %struct.string_data** %s, align 8
  %61 = getelementptr inbounds %struct.string_data* %60, i32 0, i32 5
  %62 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %63 = getelementptr inbounds %struct.change_stack_entry* %62, i32 0, i32 0
  store i32* %61, i32** %63, align 8
  %64 = load %struct.string_data** %s, align 8
  %65 = getelementptr inbounds %struct.string_data* %64, i32 0, i32 5
  %66 = load i32* %65, align 4
  %67 = load %struct.change_stack_entry** @change_stack_pointer, align 8
  %68 = getelementptr inbounds %struct.change_stack_entry* %67, i32 1
  store %struct.change_stack_entry* %68, %struct.change_stack_entry** @change_stack_pointer, align 8
  %69 = getelementptr inbounds %struct.change_stack_entry* %67, i32 0, i32 1
  store i32 %66, i32* %69, align 4
  %70 = load %struct.string_data** %s, align 8
  %71 = getelementptr inbounds %struct.string_data* %70, i32 0, i32 5
  %72 = load i32* %71, align 4
  %73 = sub nsw i32 %72, 1
  %74 = sext i32 %73 to i64
  %75 = load %struct.string_data** %s, align 8
  %76 = getelementptr inbounds %struct.string_data* %75, i32 0, i32 6
  %77 = getelementptr inbounds [160 x i32]* %76, i32 0, i64 %74
  %78 = load i32* %77, align 4
  %79 = load i32* %k, align 4
  %80 = sext i32 %79 to i64
  %81 = load %struct.string_data** %s, align 8
  %82 = getelementptr inbounds %struct.string_data* %81, i32 0, i32 6
  %83 = getelementptr inbounds [160 x i32]* %82, i32 0, i64 %80
  store i32 %78, i32* %83, align 4
  %84 = load %struct.string_data** %s, align 8
  %85 = getelementptr inbounds %struct.string_data* %84, i32 0, i32 5
  %86 = load i32* %85, align 4
  %87 = add nsw i32 %86, -1
  store i32 %87, i32* %85, align 4
  store i32 1, i32* %done, align 4
  br label %92

; <label>:88                                      ; preds = %12
  br label %89

; <label>:89                                      ; preds = %88
  %90 = load i32* %k, align 4
  %91 = add nsw i32 %90, 1
  store i32 %91, i32* %k, align 4
  br label %6

; <label>:92                                      ; preds = %21, %6
  %93 = load i32* %done, align 4
  %94 = icmp ne i32 %93, 0
  br i1 %94, label %95, label %96

; <label>:95                                      ; preds = %92
  br label %97

; <label>:96                                      ; preds = %92
  call void @abortgo(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 2930, i8* getelementptr inbounds ([5 x i8]* @.str37, i32 0, i32 0), i32 -1, i32 -1)
  br label %97

; <label>:97                                      ; preds = %96, %95
  ret void
}

declare void @showboard(i32) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
