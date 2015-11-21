; ModuleID = 'eval.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@piece_value = global [6 x i32] [i32 100, i32 300, i32 300, i32 500, i32 900, i32 0], align 16
@pawn_pcsq = global [64 x i32] [i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 5, i32 10, i32 15, i32 20, i32 20, i32 15, i32 10, i32 5, i32 4, i32 8, i32 12, i32 16, i32 16, i32 12, i32 8, i32 4, i32 3, i32 6, i32 9, i32 12, i32 12, i32 9, i32 6, i32 3, i32 2, i32 4, i32 6, i32 8, i32 8, i32 6, i32 4, i32 2, i32 1, i32 2, i32 3, i32 -10, i32 -10, i32 3, i32 2, i32 1, i32 0, i32 0, i32 0, i32 -40, i32 -40, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0], align 16
@knight_pcsq = global [64 x i32] [i32 -10, i32 -10, i32 -10, i32 -10, i32 -10, i32 -10, i32 -10, i32 -10, i32 -10, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -10, i32 -10, i32 0, i32 5, i32 5, i32 5, i32 5, i32 0, i32 -10, i32 -10, i32 0, i32 5, i32 10, i32 10, i32 5, i32 0, i32 -10, i32 -10, i32 0, i32 5, i32 10, i32 10, i32 5, i32 0, i32 -10, i32 -10, i32 0, i32 5, i32 5, i32 5, i32 5, i32 0, i32 -10, i32 -10, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -10, i32 -10, i32 -30, i32 -10, i32 -10, i32 -10, i32 -10, i32 -30, i32 -10], align 16
@bishop_pcsq = global [64 x i32] [i32 -10, i32 -10, i32 -10, i32 -10, i32 -10, i32 -10, i32 -10, i32 -10, i32 -10, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -10, i32 -10, i32 0, i32 5, i32 5, i32 5, i32 5, i32 0, i32 -10, i32 -10, i32 0, i32 5, i32 10, i32 10, i32 5, i32 0, i32 -10, i32 -10, i32 0, i32 5, i32 10, i32 10, i32 5, i32 0, i32 -10, i32 -10, i32 0, i32 5, i32 5, i32 5, i32 5, i32 0, i32 -10, i32 -10, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 -10, i32 -10, i32 -10, i32 -20, i32 -10, i32 -10, i32 -20, i32 -10, i32 -10], align 16
@king_pcsq = global [64 x i32] [i32 -40, i32 -40, i32 -40, i32 -40, i32 -40, i32 -40, i32 -40, i32 -40, i32 -40, i32 -40, i32 -40, i32 -40, i32 -40, i32 -40, i32 -40, i32 -40, i32 -40, i32 -40, i32 -40, i32 -40, i32 -40, i32 -40, i32 -40, i32 -40, i32 -40, i32 -40, i32 -40, i32 -40, i32 -40, i32 -40, i32 -40, i32 -40, i32 -40, i32 -40, i32 -40, i32 -40, i32 -40, i32 -40, i32 -40, i32 -40, i32 -40, i32 -40, i32 -40, i32 -40, i32 -40, i32 -40, i32 -40, i32 -40, i32 -20, i32 -20, i32 -20, i32 -20, i32 -20, i32 -20, i32 -20, i32 -20, i32 0, i32 20, i32 40, i32 -20, i32 0, i32 -20, i32 40, i32 20], align 16
@king_endgame_pcsq = global [64 x i32] [i32 0, i32 10, i32 20, i32 30, i32 30, i32 20, i32 10, i32 0, i32 10, i32 20, i32 30, i32 40, i32 40, i32 30, i32 20, i32 10, i32 20, i32 30, i32 40, i32 50, i32 50, i32 40, i32 30, i32 20, i32 30, i32 40, i32 50, i32 60, i32 60, i32 50, i32 40, i32 30, i32 30, i32 40, i32 50, i32 60, i32 60, i32 50, i32 40, i32 30, i32 20, i32 30, i32 40, i32 50, i32 50, i32 40, i32 30, i32 20, i32 10, i32 20, i32 30, i32 40, i32 40, i32 30, i32 20, i32 10, i32 0, i32 10, i32 20, i32 30, i32 30, i32 20, i32 10, i32 0], align 16
@flip = global [64 x i32] [i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7], align 16
@pawn_rank = common global [2 x [10 x i32]] zeroinitializer, align 16
@piece_mat = common global [2 x i32] zeroinitializer, align 4
@pawn_mat = common global [2 x i32] zeroinitializer, align 4
@color = external global [64 x i32]
@piece = external global [64 x i32]
@side = external global i32

; Function Attrs: nounwind uwtable
define i32 @eval() #0 {
  %score = alloca [2 x i32], align 4
  br label %1

; <label>:1                                       ; preds = %8, %0
  %i.0 = phi i32 [ 0, %0 ], [ %9, %8 ]
  %2 = icmp slt i32 %i.0, 10
  br i1 %2, label %3, label %10

; <label>:3                                       ; preds = %1
  %4 = sext i32 %i.0 to i64
  %5 = getelementptr inbounds [10 x i32]* getelementptr inbounds ([2 x [10 x i32]]* @pawn_rank, i32 0, i64 0), i32 0, i64 %4
  store i32 0, i32* %5, align 4
  %6 = sext i32 %i.0 to i64
  %7 = getelementptr inbounds [10 x i32]* getelementptr inbounds ([2 x [10 x i32]]* @pawn_rank, i32 0, i64 1), i32 0, i64 %6
  store i32 7, i32* %7, align 4
  br label %8

; <label>:8                                       ; preds = %3
  %9 = add nsw i32 %i.0, 1
  br label %1

; <label>:10                                      ; preds = %1
  store i32 0, i32* getelementptr inbounds ([2 x i32]* @piece_mat, i32 0, i64 0), align 4
  store i32 0, i32* getelementptr inbounds ([2 x i32]* @piece_mat, i32 0, i64 1), align 4
  store i32 0, i32* getelementptr inbounds ([2 x i32]* @pawn_mat, i32 0, i64 0), align 4
  store i32 0, i32* getelementptr inbounds ([2 x i32]* @pawn_mat, i32 0, i64 1), align 4
  br label %11

; <label>:11                                      ; preds = %77, %10
  %i.1 = phi i32 [ 0, %10 ], [ %78, %77 ]
  %12 = icmp slt i32 %i.1, 64
  br i1 %12, label %13, label %79

; <label>:13                                      ; preds = %11
  %14 = sext i32 %i.1 to i64
  %15 = getelementptr inbounds [64 x i32]* @color, i32 0, i64 %14
  %16 = load i32* %15, align 4
  %17 = icmp eq i32 %16, 6
  br i1 %17, label %18, label %19

; <label>:18                                      ; preds = %13
  br label %77

; <label>:19                                      ; preds = %13
  %20 = sext i32 %i.1 to i64
  %21 = getelementptr inbounds [64 x i32]* @piece, i32 0, i64 %20
  %22 = load i32* %21, align 4
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %24, label %62

; <label>:24                                      ; preds = %19
  %25 = load i32* getelementptr inbounds ([6 x i32]* @piece_value, i32 0, i64 0), align 4
  %26 = sext i32 %i.1 to i64
  %27 = getelementptr inbounds [64 x i32]* @color, i32 0, i64 %26
  %28 = load i32* %27, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds [2 x i32]* @pawn_mat, i32 0, i64 %29
  %31 = load i32* %30, align 4
  %32 = add nsw i32 %31, %25
  store i32 %32, i32* %30, align 4
  %33 = and i32 %i.1, 7
  %34 = add nsw i32 %33, 1
  %35 = sext i32 %i.1 to i64
  %36 = getelementptr inbounds [64 x i32]* @color, i32 0, i64 %35
  %37 = load i32* %36, align 4
  %38 = icmp eq i32 %37, 0
  br i1 %38, label %39, label %50

; <label>:39                                      ; preds = %24
  %40 = sext i32 %34 to i64
  %41 = getelementptr inbounds [10 x i32]* getelementptr inbounds ([2 x [10 x i32]]* @pawn_rank, i32 0, i64 0), i32 0, i64 %40
  %42 = load i32* %41, align 4
  %43 = ashr i32 %i.1, 3
  %44 = icmp slt i32 %42, %43
  br i1 %44, label %45, label %49

; <label>:45                                      ; preds = %39
  %46 = ashr i32 %i.1, 3
  %47 = sext i32 %34 to i64
  %48 = getelementptr inbounds [10 x i32]* getelementptr inbounds ([2 x [10 x i32]]* @pawn_rank, i32 0, i64 0), i32 0, i64 %47
  store i32 %46, i32* %48, align 4
  br label %49

; <label>:49                                      ; preds = %45, %39
  br label %61

; <label>:50                                      ; preds = %24
  %51 = sext i32 %34 to i64
  %52 = getelementptr inbounds [10 x i32]* getelementptr inbounds ([2 x [10 x i32]]* @pawn_rank, i32 0, i64 1), i32 0, i64 %51
  %53 = load i32* %52, align 4
  %54 = ashr i32 %i.1, 3
  %55 = icmp sgt i32 %53, %54
  br i1 %55, label %56, label %60

; <label>:56                                      ; preds = %50
  %57 = ashr i32 %i.1, 3
  %58 = sext i32 %34 to i64
  %59 = getelementptr inbounds [10 x i32]* getelementptr inbounds ([2 x [10 x i32]]* @pawn_rank, i32 0, i64 1), i32 0, i64 %58
  store i32 %57, i32* %59, align 4
  br label %60

; <label>:60                                      ; preds = %56, %50
  br label %61

; <label>:61                                      ; preds = %60, %49
  br label %76

; <label>:62                                      ; preds = %19
  %63 = sext i32 %i.1 to i64
  %64 = getelementptr inbounds [64 x i32]* @piece, i32 0, i64 %63
  %65 = load i32* %64, align 4
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds [6 x i32]* @piece_value, i32 0, i64 %66
  %68 = load i32* %67, align 4
  %69 = sext i32 %i.1 to i64
  %70 = getelementptr inbounds [64 x i32]* @color, i32 0, i64 %69
  %71 = load i32* %70, align 4
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds [2 x i32]* @piece_mat, i32 0, i64 %72
  %74 = load i32* %73, align 4
  %75 = add nsw i32 %74, %68
  store i32 %75, i32* %73, align 4
  br label %76

; <label>:76                                      ; preds = %62, %61
  br label %77

; <label>:77                                      ; preds = %76, %18
  %78 = add nsw i32 %i.1, 1
  br label %11

; <label>:79                                      ; preds = %11
  %80 = load i32* getelementptr inbounds ([2 x i32]* @piece_mat, i32 0, i64 0), align 4
  %81 = load i32* getelementptr inbounds ([2 x i32]* @pawn_mat, i32 0, i64 0), align 4
  %82 = add nsw i32 %80, %81
  %83 = getelementptr inbounds [2 x i32]* %score, i32 0, i64 0
  store i32 %82, i32* %83, align 4
  %84 = load i32* getelementptr inbounds ([2 x i32]* @piece_mat, i32 0, i64 1), align 4
  %85 = load i32* getelementptr inbounds ([2 x i32]* @pawn_mat, i32 0, i64 1), align 4
  %86 = add nsw i32 %84, %85
  %87 = getelementptr inbounds [2 x i32]* %score, i32 0, i64 1
  store i32 %86, i32* %87, align 4
  br label %88

; <label>:88                                      ; preds = %253, %79
  %i.2 = phi i32 [ 0, %79 ], [ %254, %253 ]
  %89 = icmp slt i32 %i.2, 64
  br i1 %89, label %90, label %255

; <label>:90                                      ; preds = %88
  %91 = sext i32 %i.2 to i64
  %92 = getelementptr inbounds [64 x i32]* @color, i32 0, i64 %91
  %93 = load i32* %92, align 4
  %94 = icmp eq i32 %93, 6
  br i1 %94, label %95, label %96

; <label>:95                                      ; preds = %90
  br label %253

; <label>:96                                      ; preds = %90
  %97 = sext i32 %i.2 to i64
  %98 = getelementptr inbounds [64 x i32]* @color, i32 0, i64 %97
  %99 = load i32* %98, align 4
  %100 = icmp eq i32 %99, 0
  br i1 %100, label %101, label %172

; <label>:101                                     ; preds = %96
  %102 = sext i32 %i.2 to i64
  %103 = getelementptr inbounds [64 x i32]* @piece, i32 0, i64 %102
  %104 = load i32* %103, align 4
  switch i32 %104, label %171 [
    i32 0, label %105
    i32 1, label %110
    i32 2, label %117
    i32 3, label %124
    i32 5, label %155
  ]

; <label>:105                                     ; preds = %101
  %106 = call i32 @eval_light_pawn(i32 %i.2)
  %107 = getelementptr inbounds [2 x i32]* %score, i32 0, i64 0
  %108 = load i32* %107, align 4
  %109 = add nsw i32 %108, %106
  store i32 %109, i32* %107, align 4
  br label %171

; <label>:110                                     ; preds = %101
  %111 = sext i32 %i.2 to i64
  %112 = getelementptr inbounds [64 x i32]* @knight_pcsq, i32 0, i64 %111
  %113 = load i32* %112, align 4
  %114 = getelementptr inbounds [2 x i32]* %score, i32 0, i64 0
  %115 = load i32* %114, align 4
  %116 = add nsw i32 %115, %113
  store i32 %116, i32* %114, align 4
  br label %171

; <label>:117                                     ; preds = %101
  %118 = sext i32 %i.2 to i64
  %119 = getelementptr inbounds [64 x i32]* @bishop_pcsq, i32 0, i64 %118
  %120 = load i32* %119, align 4
  %121 = getelementptr inbounds [2 x i32]* %score, i32 0, i64 0
  %122 = load i32* %121, align 4
  %123 = add nsw i32 %122, %120
  store i32 %123, i32* %121, align 4
  br label %171

; <label>:124                                     ; preds = %101
  %125 = and i32 %i.2, 7
  %126 = add nsw i32 %125, 1
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds [10 x i32]* getelementptr inbounds ([2 x [10 x i32]]* @pawn_rank, i32 0, i64 0), i32 0, i64 %127
  %129 = load i32* %128, align 4
  %130 = icmp eq i32 %129, 0
  br i1 %130, label %131, label %147

; <label>:131                                     ; preds = %124
  %132 = and i32 %i.2, 7
  %133 = add nsw i32 %132, 1
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds [10 x i32]* getelementptr inbounds ([2 x [10 x i32]]* @pawn_rank, i32 0, i64 1), i32 0, i64 %134
  %136 = load i32* %135, align 4
  %137 = icmp eq i32 %136, 7
  br i1 %137, label %138, label %142

; <label>:138                                     ; preds = %131
  %139 = getelementptr inbounds [2 x i32]* %score, i32 0, i64 0
  %140 = load i32* %139, align 4
  %141 = add nsw i32 %140, 15
  store i32 %141, i32* %139, align 4
  br label %146

; <label>:142                                     ; preds = %131
  %143 = getelementptr inbounds [2 x i32]* %score, i32 0, i64 0
  %144 = load i32* %143, align 4
  %145 = add nsw i32 %144, 10
  store i32 %145, i32* %143, align 4
  br label %146

; <label>:146                                     ; preds = %142, %138
  br label %147

; <label>:147                                     ; preds = %146, %124
  %148 = ashr i32 %i.2, 3
  %149 = icmp eq i32 %148, 1
  br i1 %149, label %150, label %154

; <label>:150                                     ; preds = %147
  %151 = getelementptr inbounds [2 x i32]* %score, i32 0, i64 0
  %152 = load i32* %151, align 4
  %153 = add nsw i32 %152, 20
  store i32 %153, i32* %151, align 4
  br label %154

; <label>:154                                     ; preds = %150, %147
  br label %171

; <label>:155                                     ; preds = %101
  %156 = load i32* getelementptr inbounds ([2 x i32]* @piece_mat, i32 0, i64 1), align 4
  %157 = icmp sle i32 %156, 1200
  br i1 %157, label %158, label %165

; <label>:158                                     ; preds = %155
  %159 = sext i32 %i.2 to i64
  %160 = getelementptr inbounds [64 x i32]* @king_endgame_pcsq, i32 0, i64 %159
  %161 = load i32* %160, align 4
  %162 = getelementptr inbounds [2 x i32]* %score, i32 0, i64 0
  %163 = load i32* %162, align 4
  %164 = add nsw i32 %163, %161
  store i32 %164, i32* %162, align 4
  br label %170

; <label>:165                                     ; preds = %155
  %166 = call i32 @eval_light_king(i32 %i.2)
  %167 = getelementptr inbounds [2 x i32]* %score, i32 0, i64 0
  %168 = load i32* %167, align 4
  %169 = add nsw i32 %168, %166
  store i32 %169, i32* %167, align 4
  br label %170

; <label>:170                                     ; preds = %165, %158
  br label %171

; <label>:171                                     ; preds = %170, %154, %117, %110, %105, %101
  br label %252

; <label>:172                                     ; preds = %96
  %173 = sext i32 %i.2 to i64
  %174 = getelementptr inbounds [64 x i32]* @piece, i32 0, i64 %173
  %175 = load i32* %174, align 4
  switch i32 %175, label %251 [
    i32 0, label %176
    i32 1, label %181
    i32 2, label %191
    i32 3, label %201
    i32 5, label %232
  ]

; <label>:176                                     ; preds = %172
  %177 = call i32 @eval_dark_pawn(i32 %i.2)
  %178 = getelementptr inbounds [2 x i32]* %score, i32 0, i64 1
  %179 = load i32* %178, align 4
  %180 = add nsw i32 %179, %177
  store i32 %180, i32* %178, align 4
  br label %251

; <label>:181                                     ; preds = %172
  %182 = sext i32 %i.2 to i64
  %183 = getelementptr inbounds [64 x i32]* @flip, i32 0, i64 %182
  %184 = load i32* %183, align 4
  %185 = sext i32 %184 to i64
  %186 = getelementptr inbounds [64 x i32]* @knight_pcsq, i32 0, i64 %185
  %187 = load i32* %186, align 4
  %188 = getelementptr inbounds [2 x i32]* %score, i32 0, i64 1
  %189 = load i32* %188, align 4
  %190 = add nsw i32 %189, %187
  store i32 %190, i32* %188, align 4
  br label %251

; <label>:191                                     ; preds = %172
  %192 = sext i32 %i.2 to i64
  %193 = getelementptr inbounds [64 x i32]* @flip, i32 0, i64 %192
  %194 = load i32* %193, align 4
  %195 = sext i32 %194 to i64
  %196 = getelementptr inbounds [64 x i32]* @bishop_pcsq, i32 0, i64 %195
  %197 = load i32* %196, align 4
  %198 = getelementptr inbounds [2 x i32]* %score, i32 0, i64 1
  %199 = load i32* %198, align 4
  %200 = add nsw i32 %199, %197
  store i32 %200, i32* %198, align 4
  br label %251

; <label>:201                                     ; preds = %172
  %202 = and i32 %i.2, 7
  %203 = add nsw i32 %202, 1
  %204 = sext i32 %203 to i64
  %205 = getelementptr inbounds [10 x i32]* getelementptr inbounds ([2 x [10 x i32]]* @pawn_rank, i32 0, i64 1), i32 0, i64 %204
  %206 = load i32* %205, align 4
  %207 = icmp eq i32 %206, 7
  br i1 %207, label %208, label %224

; <label>:208                                     ; preds = %201
  %209 = and i32 %i.2, 7
  %210 = add nsw i32 %209, 1
  %211 = sext i32 %210 to i64
  %212 = getelementptr inbounds [10 x i32]* getelementptr inbounds ([2 x [10 x i32]]* @pawn_rank, i32 0, i64 0), i32 0, i64 %211
  %213 = load i32* %212, align 4
  %214 = icmp eq i32 %213, 0
  br i1 %214, label %215, label %219

; <label>:215                                     ; preds = %208
  %216 = getelementptr inbounds [2 x i32]* %score, i32 0, i64 1
  %217 = load i32* %216, align 4
  %218 = add nsw i32 %217, 15
  store i32 %218, i32* %216, align 4
  br label %223

; <label>:219                                     ; preds = %208
  %220 = getelementptr inbounds [2 x i32]* %score, i32 0, i64 1
  %221 = load i32* %220, align 4
  %222 = add nsw i32 %221, 10
  store i32 %222, i32* %220, align 4
  br label %223

; <label>:223                                     ; preds = %219, %215
  br label %224

; <label>:224                                     ; preds = %223, %201
  %225 = ashr i32 %i.2, 3
  %226 = icmp eq i32 %225, 6
  br i1 %226, label %227, label %231

; <label>:227                                     ; preds = %224
  %228 = getelementptr inbounds [2 x i32]* %score, i32 0, i64 1
  %229 = load i32* %228, align 4
  %230 = add nsw i32 %229, 20
  store i32 %230, i32* %228, align 4
  br label %231

; <label>:231                                     ; preds = %227, %224
  br label %251

; <label>:232                                     ; preds = %172
  %233 = load i32* getelementptr inbounds ([2 x i32]* @piece_mat, i32 0, i64 0), align 4
  %234 = icmp sle i32 %233, 1200
  br i1 %234, label %235, label %245

; <label>:235                                     ; preds = %232
  %236 = sext i32 %i.2 to i64
  %237 = getelementptr inbounds [64 x i32]* @flip, i32 0, i64 %236
  %238 = load i32* %237, align 4
  %239 = sext i32 %238 to i64
  %240 = getelementptr inbounds [64 x i32]* @king_endgame_pcsq, i32 0, i64 %239
  %241 = load i32* %240, align 4
  %242 = getelementptr inbounds [2 x i32]* %score, i32 0, i64 1
  %243 = load i32* %242, align 4
  %244 = add nsw i32 %243, %241
  store i32 %244, i32* %242, align 4
  br label %250

; <label>:245                                     ; preds = %232
  %246 = call i32 @eval_dark_king(i32 %i.2)
  %247 = getelementptr inbounds [2 x i32]* %score, i32 0, i64 1
  %248 = load i32* %247, align 4
  %249 = add nsw i32 %248, %246
  store i32 %249, i32* %247, align 4
  br label %250

; <label>:250                                     ; preds = %245, %235
  br label %251

; <label>:251                                     ; preds = %250, %231, %191, %181, %176, %172
  br label %252

; <label>:252                                     ; preds = %251, %171
  br label %253

; <label>:253                                     ; preds = %252, %95
  %254 = add nsw i32 %i.2, 1
  br label %88

; <label>:255                                     ; preds = %88
  %256 = load i32* @side, align 4
  %257 = icmp eq i32 %256, 0
  br i1 %257, label %258, label %264

; <label>:258                                     ; preds = %255
  %259 = getelementptr inbounds [2 x i32]* %score, i32 0, i64 0
  %260 = load i32* %259, align 4
  %261 = getelementptr inbounds [2 x i32]* %score, i32 0, i64 1
  %262 = load i32* %261, align 4
  %263 = sub nsw i32 %260, %262
  br label %270

; <label>:264                                     ; preds = %255
  %265 = getelementptr inbounds [2 x i32]* %score, i32 0, i64 1
  %266 = load i32* %265, align 4
  %267 = getelementptr inbounds [2 x i32]* %score, i32 0, i64 0
  %268 = load i32* %267, align 4
  %269 = sub nsw i32 %266, %268
  br label %270

; <label>:270                                     ; preds = %264, %258
  %.0 = phi i32 [ %263, %258 ], [ %269, %264 ]
  ret i32 %.0
}

; Function Attrs: nounwind uwtable
define i32 @eval_light_pawn(i32 %sq) #0 {
  %1 = and i32 %sq, 7
  %2 = add nsw i32 %1, 1
  %3 = sext i32 %sq to i64
  %4 = getelementptr inbounds [64 x i32]* @pawn_pcsq, i32 0, i64 %3
  %5 = load i32* %4, align 4
  %6 = add nsw i32 0, %5
  %7 = sext i32 %2 to i64
  %8 = getelementptr inbounds [10 x i32]* getelementptr inbounds ([2 x [10 x i32]]* @pawn_rank, i32 0, i64 0), i32 0, i64 %7
  %9 = load i32* %8, align 4
  %10 = ashr i32 %sq, 3
  %11 = icmp sgt i32 %9, %10
  br i1 %11, label %12, label %14

; <label>:12                                      ; preds = %0
  %13 = sub nsw i32 %6, 10
  br label %14

; <label>:14                                      ; preds = %12, %0
  %r.0 = phi i32 [ %13, %12 ], [ %6, %0 ]
  %15 = sub nsw i32 %2, 1
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [10 x i32]* getelementptr inbounds ([2 x [10 x i32]]* @pawn_rank, i32 0, i64 0), i32 0, i64 %16
  %18 = load i32* %17, align 4
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %20, label %28

; <label>:20                                      ; preds = %14
  %21 = add nsw i32 %2, 1
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds [10 x i32]* getelementptr inbounds ([2 x [10 x i32]]* @pawn_rank, i32 0, i64 0), i32 0, i64 %22
  %24 = load i32* %23, align 4
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %26, label %28

; <label>:26                                      ; preds = %20
  %27 = sub nsw i32 %r.0, 20
  br label %45

; <label>:28                                      ; preds = %20, %14
  %29 = sub nsw i32 %2, 1
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [10 x i32]* getelementptr inbounds ([2 x [10 x i32]]* @pawn_rank, i32 0, i64 0), i32 0, i64 %30
  %32 = load i32* %31, align 4
  %33 = ashr i32 %sq, 3
  %34 = icmp slt i32 %32, %33
  br i1 %34, label %35, label %44

; <label>:35                                      ; preds = %28
  %36 = add nsw i32 %2, 1
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds [10 x i32]* getelementptr inbounds ([2 x [10 x i32]]* @pawn_rank, i32 0, i64 0), i32 0, i64 %37
  %39 = load i32* %38, align 4
  %40 = ashr i32 %sq, 3
  %41 = icmp slt i32 %39, %40
  br i1 %41, label %42, label %44

; <label>:42                                      ; preds = %35
  %43 = sub nsw i32 %r.0, 8
  br label %44

; <label>:44                                      ; preds = %42, %35, %28
  %r.1 = phi i32 [ %43, %42 ], [ %r.0, %35 ], [ %r.0, %28 ]
  br label %45

; <label>:45                                      ; preds = %44, %26
  %r.2 = phi i32 [ %27, %26 ], [ %r.1, %44 ]
  %46 = sub nsw i32 %2, 1
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds [10 x i32]* getelementptr inbounds ([2 x [10 x i32]]* @pawn_rank, i32 0, i64 1), i32 0, i64 %47
  %49 = load i32* %48, align 4
  %50 = ashr i32 %sq, 3
  %51 = icmp sge i32 %49, %50
  br i1 %51, label %52, label %70

; <label>:52                                      ; preds = %45
  %53 = sext i32 %2 to i64
  %54 = getelementptr inbounds [10 x i32]* getelementptr inbounds ([2 x [10 x i32]]* @pawn_rank, i32 0, i64 1), i32 0, i64 %53
  %55 = load i32* %54, align 4
  %56 = ashr i32 %sq, 3
  %57 = icmp sge i32 %55, %56
  br i1 %57, label %58, label %70

; <label>:58                                      ; preds = %52
  %59 = add nsw i32 %2, 1
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds [10 x i32]* getelementptr inbounds ([2 x [10 x i32]]* @pawn_rank, i32 0, i64 1), i32 0, i64 %60
  %62 = load i32* %61, align 4
  %63 = ashr i32 %sq, 3
  %64 = icmp sge i32 %62, %63
  br i1 %64, label %65, label %70

; <label>:65                                      ; preds = %58
  %66 = ashr i32 %sq, 3
  %67 = sub nsw i32 7, %66
  %68 = mul nsw i32 %67, 20
  %69 = add nsw i32 %r.2, %68
  br label %70

; <label>:70                                      ; preds = %65, %58, %52, %45
  %r.3 = phi i32 [ %69, %65 ], [ %r.2, %58 ], [ %r.2, %52 ], [ %r.2, %45 ]
  ret i32 %r.3
}

; Function Attrs: nounwind uwtable
define i32 @eval_light_king(i32 %sq) #0 {
  %1 = sext i32 %sq to i64
  %2 = getelementptr inbounds [64 x i32]* @king_pcsq, i32 0, i64 %1
  %3 = load i32* %2, align 4
  %4 = and i32 %sq, 7
  %5 = icmp slt i32 %4, 3
  br i1 %5, label %6, label %14

; <label>:6                                       ; preds = %0
  %7 = call i32 @eval_lkp(i32 1)
  %8 = add nsw i32 %3, %7
  %9 = call i32 @eval_lkp(i32 2)
  %10 = add nsw i32 %8, %9
  %11 = call i32 @eval_lkp(i32 3)
  %12 = sdiv i32 %11, 2
  %13 = add nsw i32 %10, %12
  br label %48

; <label>:14                                      ; preds = %0
  %15 = and i32 %sq, 7
  %16 = icmp sgt i32 %15, 4
  br i1 %16, label %17, label %25

; <label>:17                                      ; preds = %14
  %18 = call i32 @eval_lkp(i32 8)
  %19 = add nsw i32 %3, %18
  %20 = call i32 @eval_lkp(i32 7)
  %21 = add nsw i32 %19, %20
  %22 = call i32 @eval_lkp(i32 6)
  %23 = sdiv i32 %22, 2
  %24 = add nsw i32 %21, %23
  br label %47

; <label>:25                                      ; preds = %14
  %26 = and i32 %sq, 7
  br label %27

; <label>:27                                      ; preds = %44, %25
  %r.0 = phi i32 [ %3, %25 ], [ %r.1, %44 ]
  %i.0 = phi i32 [ %26, %25 ], [ %45, %44 ]
  %28 = and i32 %sq, 7
  %29 = add nsw i32 %28, 2
  %30 = icmp sle i32 %i.0, %29
  br i1 %30, label %31, label %46

; <label>:31                                      ; preds = %27
  %32 = sext i32 %i.0 to i64
  %33 = getelementptr inbounds [10 x i32]* getelementptr inbounds ([2 x [10 x i32]]* @pawn_rank, i32 0, i64 0), i32 0, i64 %32
  %34 = load i32* %33, align 4
  %35 = icmp eq i32 %34, 0
  br i1 %35, label %36, label %43

; <label>:36                                      ; preds = %31
  %37 = sext i32 %i.0 to i64
  %38 = getelementptr inbounds [10 x i32]* getelementptr inbounds ([2 x [10 x i32]]* @pawn_rank, i32 0, i64 1), i32 0, i64 %37
  %39 = load i32* %38, align 4
  %40 = icmp eq i32 %39, 7
  br i1 %40, label %41, label %43

; <label>:41                                      ; preds = %36
  %42 = sub nsw i32 %r.0, 10
  br label %43

; <label>:43                                      ; preds = %41, %36, %31
  %r.1 = phi i32 [ %42, %41 ], [ %r.0, %36 ], [ %r.0, %31 ]
  br label %44

; <label>:44                                      ; preds = %43
  %45 = add nsw i32 %i.0, 1
  br label %27

; <label>:46                                      ; preds = %27
  br label %47

; <label>:47                                      ; preds = %46, %17
  %r.2 = phi i32 [ %24, %17 ], [ %r.0, %46 ]
  br label %48

; <label>:48                                      ; preds = %47, %6
  %r.3 = phi i32 [ %13, %6 ], [ %r.2, %47 ]
  %49 = load i32* getelementptr inbounds ([2 x i32]* @piece_mat, i32 0, i64 1), align 4
  %50 = mul nsw i32 %r.3, %49
  %51 = sdiv i32 %50, 3100
  ret i32 %51
}

; Function Attrs: nounwind uwtable
define i32 @eval_dark_pawn(i32 %sq) #0 {
  %1 = and i32 %sq, 7
  %2 = add nsw i32 %1, 1
  %3 = sext i32 %sq to i64
  %4 = getelementptr inbounds [64 x i32]* @flip, i32 0, i64 %3
  %5 = load i32* %4, align 4
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds [64 x i32]* @pawn_pcsq, i32 0, i64 %6
  %8 = load i32* %7, align 4
  %9 = add nsw i32 0, %8
  %10 = sext i32 %2 to i64
  %11 = getelementptr inbounds [10 x i32]* getelementptr inbounds ([2 x [10 x i32]]* @pawn_rank, i32 0, i64 1), i32 0, i64 %10
  %12 = load i32* %11, align 4
  %13 = ashr i32 %sq, 3
  %14 = icmp slt i32 %12, %13
  br i1 %14, label %15, label %17

; <label>:15                                      ; preds = %0
  %16 = sub nsw i32 %9, 10
  br label %17

; <label>:17                                      ; preds = %15, %0
  %r.0 = phi i32 [ %16, %15 ], [ %9, %0 ]
  %18 = sub nsw i32 %2, 1
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds [10 x i32]* getelementptr inbounds ([2 x [10 x i32]]* @pawn_rank, i32 0, i64 1), i32 0, i64 %19
  %21 = load i32* %20, align 4
  %22 = icmp eq i32 %21, 7
  br i1 %22, label %23, label %31

; <label>:23                                      ; preds = %17
  %24 = add nsw i32 %2, 1
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds [10 x i32]* getelementptr inbounds ([2 x [10 x i32]]* @pawn_rank, i32 0, i64 1), i32 0, i64 %25
  %27 = load i32* %26, align 4
  %28 = icmp eq i32 %27, 7
  br i1 %28, label %29, label %31

; <label>:29                                      ; preds = %23
  %30 = sub nsw i32 %r.0, 20
  br label %48

; <label>:31                                      ; preds = %23, %17
  %32 = sub nsw i32 %2, 1
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds [10 x i32]* getelementptr inbounds ([2 x [10 x i32]]* @pawn_rank, i32 0, i64 1), i32 0, i64 %33
  %35 = load i32* %34, align 4
  %36 = ashr i32 %sq, 3
  %37 = icmp sgt i32 %35, %36
  br i1 %37, label %38, label %47

; <label>:38                                      ; preds = %31
  %39 = add nsw i32 %2, 1
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds [10 x i32]* getelementptr inbounds ([2 x [10 x i32]]* @pawn_rank, i32 0, i64 1), i32 0, i64 %40
  %42 = load i32* %41, align 4
  %43 = ashr i32 %sq, 3
  %44 = icmp sgt i32 %42, %43
  br i1 %44, label %45, label %47

; <label>:45                                      ; preds = %38
  %46 = sub nsw i32 %r.0, 8
  br label %47

; <label>:47                                      ; preds = %45, %38, %31
  %r.1 = phi i32 [ %46, %45 ], [ %r.0, %38 ], [ %r.0, %31 ]
  br label %48

; <label>:48                                      ; preds = %47, %29
  %r.2 = phi i32 [ %30, %29 ], [ %r.1, %47 ]
  %49 = sub nsw i32 %2, 1
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds [10 x i32]* getelementptr inbounds ([2 x [10 x i32]]* @pawn_rank, i32 0, i64 0), i32 0, i64 %50
  %52 = load i32* %51, align 4
  %53 = ashr i32 %sq, 3
  %54 = icmp sle i32 %52, %53
  br i1 %54, label %55, label %72

; <label>:55                                      ; preds = %48
  %56 = sext i32 %2 to i64
  %57 = getelementptr inbounds [10 x i32]* getelementptr inbounds ([2 x [10 x i32]]* @pawn_rank, i32 0, i64 0), i32 0, i64 %56
  %58 = load i32* %57, align 4
  %59 = ashr i32 %sq, 3
  %60 = icmp sle i32 %58, %59
  br i1 %60, label %61, label %72

; <label>:61                                      ; preds = %55
  %62 = add nsw i32 %2, 1
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds [10 x i32]* getelementptr inbounds ([2 x [10 x i32]]* @pawn_rank, i32 0, i64 0), i32 0, i64 %63
  %65 = load i32* %64, align 4
  %66 = ashr i32 %sq, 3
  %67 = icmp sle i32 %65, %66
  br i1 %67, label %68, label %72

; <label>:68                                      ; preds = %61
  %69 = ashr i32 %sq, 3
  %70 = mul nsw i32 %69, 20
  %71 = add nsw i32 %r.2, %70
  br label %72

; <label>:72                                      ; preds = %68, %61, %55, %48
  %r.3 = phi i32 [ %71, %68 ], [ %r.2, %61 ], [ %r.2, %55 ], [ %r.2, %48 ]
  ret i32 %r.3
}

; Function Attrs: nounwind uwtable
define i32 @eval_dark_king(i32 %sq) #0 {
  %1 = sext i32 %sq to i64
  %2 = getelementptr inbounds [64 x i32]* @flip, i32 0, i64 %1
  %3 = load i32* %2, align 4
  %4 = sext i32 %3 to i64
  %5 = getelementptr inbounds [64 x i32]* @king_pcsq, i32 0, i64 %4
  %6 = load i32* %5, align 4
  %7 = and i32 %sq, 7
  %8 = icmp slt i32 %7, 3
  br i1 %8, label %9, label %17

; <label>:9                                       ; preds = %0
  %10 = call i32 @eval_dkp(i32 1)
  %11 = add nsw i32 %6, %10
  %12 = call i32 @eval_dkp(i32 2)
  %13 = add nsw i32 %11, %12
  %14 = call i32 @eval_dkp(i32 3)
  %15 = sdiv i32 %14, 2
  %16 = add nsw i32 %13, %15
  br label %51

; <label>:17                                      ; preds = %0
  %18 = and i32 %sq, 7
  %19 = icmp sgt i32 %18, 4
  br i1 %19, label %20, label %28

; <label>:20                                      ; preds = %17
  %21 = call i32 @eval_dkp(i32 8)
  %22 = add nsw i32 %6, %21
  %23 = call i32 @eval_dkp(i32 7)
  %24 = add nsw i32 %22, %23
  %25 = call i32 @eval_dkp(i32 6)
  %26 = sdiv i32 %25, 2
  %27 = add nsw i32 %24, %26
  br label %50

; <label>:28                                      ; preds = %17
  %29 = and i32 %sq, 7
  br label %30

; <label>:30                                      ; preds = %47, %28
  %r.0 = phi i32 [ %6, %28 ], [ %r.1, %47 ]
  %i.0 = phi i32 [ %29, %28 ], [ %48, %47 ]
  %31 = and i32 %sq, 7
  %32 = add nsw i32 %31, 2
  %33 = icmp sle i32 %i.0, %32
  br i1 %33, label %34, label %49

; <label>:34                                      ; preds = %30
  %35 = sext i32 %i.0 to i64
  %36 = getelementptr inbounds [10 x i32]* getelementptr inbounds ([2 x [10 x i32]]* @pawn_rank, i32 0, i64 0), i32 0, i64 %35
  %37 = load i32* %36, align 4
  %38 = icmp eq i32 %37, 0
  br i1 %38, label %39, label %46

; <label>:39                                      ; preds = %34
  %40 = sext i32 %i.0 to i64
  %41 = getelementptr inbounds [10 x i32]* getelementptr inbounds ([2 x [10 x i32]]* @pawn_rank, i32 0, i64 1), i32 0, i64 %40
  %42 = load i32* %41, align 4
  %43 = icmp eq i32 %42, 7
  br i1 %43, label %44, label %46

; <label>:44                                      ; preds = %39
  %45 = sub nsw i32 %r.0, 10
  br label %46

; <label>:46                                      ; preds = %44, %39, %34
  %r.1 = phi i32 [ %45, %44 ], [ %r.0, %39 ], [ %r.0, %34 ]
  br label %47

; <label>:47                                      ; preds = %46
  %48 = add nsw i32 %i.0, 1
  br label %30

; <label>:49                                      ; preds = %30
  br label %50

; <label>:50                                      ; preds = %49, %20
  %r.2 = phi i32 [ %27, %20 ], [ %r.0, %49 ]
  br label %51

; <label>:51                                      ; preds = %50, %9
  %r.3 = phi i32 [ %16, %9 ], [ %r.2, %50 ]
  %52 = load i32* getelementptr inbounds ([2 x i32]* @piece_mat, i32 0, i64 0), align 4
  %53 = mul nsw i32 %r.3, %52
  %54 = sdiv i32 %53, 3100
  ret i32 %54
}

; Function Attrs: nounwind uwtable
define i32 @eval_lkp(i32 %f) #0 {
  %1 = sext i32 %f to i64
  %2 = getelementptr inbounds [10 x i32]* getelementptr inbounds ([2 x [10 x i32]]* @pawn_rank, i32 0, i64 0), i32 0, i64 %1
  %3 = load i32* %2, align 4
  %4 = icmp eq i32 %3, 6
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  br label %24

; <label>:6                                       ; preds = %0
  %7 = sext i32 %f to i64
  %8 = getelementptr inbounds [10 x i32]* getelementptr inbounds ([2 x [10 x i32]]* @pawn_rank, i32 0, i64 0), i32 0, i64 %7
  %9 = load i32* %8, align 4
  %10 = icmp eq i32 %9, 5
  br i1 %10, label %11, label %13

; <label>:11                                      ; preds = %6
  %12 = sub nsw i32 0, 10
  br label %23

; <label>:13                                      ; preds = %6
  %14 = sext i32 %f to i64
  %15 = getelementptr inbounds [10 x i32]* getelementptr inbounds ([2 x [10 x i32]]* @pawn_rank, i32 0, i64 0), i32 0, i64 %14
  %16 = load i32* %15, align 4
  %17 = icmp ne i32 %16, 0
  br i1 %17, label %18, label %20

; <label>:18                                      ; preds = %13
  %19 = sub nsw i32 0, 20
  br label %22

; <label>:20                                      ; preds = %13
  %21 = sub nsw i32 0, 25
  br label %22

; <label>:22                                      ; preds = %20, %18
  %r.0 = phi i32 [ %19, %18 ], [ %21, %20 ]
  br label %23

; <label>:23                                      ; preds = %22, %11
  %r.1 = phi i32 [ %12, %11 ], [ %r.0, %22 ]
  br label %24

; <label>:24                                      ; preds = %23, %5
  %r.2 = phi i32 [ 0, %5 ], [ %r.1, %23 ]
  %25 = sext i32 %f to i64
  %26 = getelementptr inbounds [10 x i32]* getelementptr inbounds ([2 x [10 x i32]]* @pawn_rank, i32 0, i64 1), i32 0, i64 %25
  %27 = load i32* %26, align 4
  %28 = icmp eq i32 %27, 7
  br i1 %28, label %29, label %31

; <label>:29                                      ; preds = %24
  %30 = sub nsw i32 %r.2, 15
  br label %47

; <label>:31                                      ; preds = %24
  %32 = sext i32 %f to i64
  %33 = getelementptr inbounds [10 x i32]* getelementptr inbounds ([2 x [10 x i32]]* @pawn_rank, i32 0, i64 1), i32 0, i64 %32
  %34 = load i32* %33, align 4
  %35 = icmp eq i32 %34, 5
  br i1 %35, label %36, label %38

; <label>:36                                      ; preds = %31
  %37 = sub nsw i32 %r.2, 10
  br label %46

; <label>:38                                      ; preds = %31
  %39 = sext i32 %f to i64
  %40 = getelementptr inbounds [10 x i32]* getelementptr inbounds ([2 x [10 x i32]]* @pawn_rank, i32 0, i64 1), i32 0, i64 %39
  %41 = load i32* %40, align 4
  %42 = icmp eq i32 %41, 4
  br i1 %42, label %43, label %45

; <label>:43                                      ; preds = %38
  %44 = sub nsw i32 %r.2, 5
  br label %45

; <label>:45                                      ; preds = %43, %38
  %r.3 = phi i32 [ %44, %43 ], [ %r.2, %38 ]
  br label %46

; <label>:46                                      ; preds = %45, %36
  %r.4 = phi i32 [ %37, %36 ], [ %r.3, %45 ]
  br label %47

; <label>:47                                      ; preds = %46, %29
  %r.5 = phi i32 [ %30, %29 ], [ %r.4, %46 ]
  ret i32 %r.5
}

; Function Attrs: nounwind uwtable
define i32 @eval_dkp(i32 %f) #0 {
  %1 = sext i32 %f to i64
  %2 = getelementptr inbounds [10 x i32]* getelementptr inbounds ([2 x [10 x i32]]* @pawn_rank, i32 0, i64 1), i32 0, i64 %1
  %3 = load i32* %2, align 4
  %4 = icmp eq i32 %3, 1
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  br label %24

; <label>:6                                       ; preds = %0
  %7 = sext i32 %f to i64
  %8 = getelementptr inbounds [10 x i32]* getelementptr inbounds ([2 x [10 x i32]]* @pawn_rank, i32 0, i64 1), i32 0, i64 %7
  %9 = load i32* %8, align 4
  %10 = icmp eq i32 %9, 2
  br i1 %10, label %11, label %13

; <label>:11                                      ; preds = %6
  %12 = sub nsw i32 0, 10
  br label %23

; <label>:13                                      ; preds = %6
  %14 = sext i32 %f to i64
  %15 = getelementptr inbounds [10 x i32]* getelementptr inbounds ([2 x [10 x i32]]* @pawn_rank, i32 0, i64 1), i32 0, i64 %14
  %16 = load i32* %15, align 4
  %17 = icmp ne i32 %16, 7
  br i1 %17, label %18, label %20

; <label>:18                                      ; preds = %13
  %19 = sub nsw i32 0, 20
  br label %22

; <label>:20                                      ; preds = %13
  %21 = sub nsw i32 0, 25
  br label %22

; <label>:22                                      ; preds = %20, %18
  %r.0 = phi i32 [ %19, %18 ], [ %21, %20 ]
  br label %23

; <label>:23                                      ; preds = %22, %11
  %r.1 = phi i32 [ %12, %11 ], [ %r.0, %22 ]
  br label %24

; <label>:24                                      ; preds = %23, %5
  %r.2 = phi i32 [ 0, %5 ], [ %r.1, %23 ]
  %25 = sext i32 %f to i64
  %26 = getelementptr inbounds [10 x i32]* getelementptr inbounds ([2 x [10 x i32]]* @pawn_rank, i32 0, i64 0), i32 0, i64 %25
  %27 = load i32* %26, align 4
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %29, label %31

; <label>:29                                      ; preds = %24
  %30 = sub nsw i32 %r.2, 15
  br label %47

; <label>:31                                      ; preds = %24
  %32 = sext i32 %f to i64
  %33 = getelementptr inbounds [10 x i32]* getelementptr inbounds ([2 x [10 x i32]]* @pawn_rank, i32 0, i64 0), i32 0, i64 %32
  %34 = load i32* %33, align 4
  %35 = icmp eq i32 %34, 2
  br i1 %35, label %36, label %38

; <label>:36                                      ; preds = %31
  %37 = sub nsw i32 %r.2, 10
  br label %46

; <label>:38                                      ; preds = %31
  %39 = sext i32 %f to i64
  %40 = getelementptr inbounds [10 x i32]* getelementptr inbounds ([2 x [10 x i32]]* @pawn_rank, i32 0, i64 0), i32 0, i64 %39
  %41 = load i32* %40, align 4
  %42 = icmp eq i32 %41, 3
  br i1 %42, label %43, label %45

; <label>:43                                      ; preds = %38
  %44 = sub nsw i32 %r.2, 5
  br label %45

; <label>:45                                      ; preds = %43, %38
  %r.3 = phi i32 [ %44, %43 ], [ %r.2, %38 ]
  br label %46

; <label>:46                                      ; preds = %45, %36
  %r.4 = phi i32 [ %37, %36 ], [ %r.3, %45 ]
  br label %47

; <label>:47                                      ; preds = %46, %29
  %r.5 = phi i32 [ %30, %29 ], [ %r.4, %46 ]
  ret i32 %r.5
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
