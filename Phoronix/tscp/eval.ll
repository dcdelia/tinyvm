; ModuleID = 'eval.c'
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
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  %f = alloca i32, align 4
  %score = alloca [2 x i32], align 4
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %12, %0
  %3 = load i32* %i, align 4
  %4 = icmp slt i32 %3, 10
  br i1 %4, label %5, label %15

; <label>:5                                       ; preds = %2
  %6 = load i32* %i, align 4
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds [10 x i32]* getelementptr inbounds ([2 x [10 x i32]]* @pawn_rank, i32 0, i64 0), i32 0, i64 %7
  store i32 0, i32* %8, align 4
  %9 = load i32* %i, align 4
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds [10 x i32]* getelementptr inbounds ([2 x [10 x i32]]* @pawn_rank, i32 0, i64 1), i32 0, i64 %10
  store i32 7, i32* %11, align 4
  br label %12

; <label>:12                                      ; preds = %5
  %13 = load i32* %i, align 4
  %14 = add nsw i32 %13, 1
  store i32 %14, i32* %i, align 4
  br label %2

; <label>:15                                      ; preds = %2
  store i32 0, i32* getelementptr inbounds ([2 x i32]* @piece_mat, i32 0, i64 0), align 4
  store i32 0, i32* getelementptr inbounds ([2 x i32]* @piece_mat, i32 0, i64 1), align 4
  store i32 0, i32* getelementptr inbounds ([2 x i32]* @pawn_mat, i32 0, i64 0), align 4
  store i32 0, i32* getelementptr inbounds ([2 x i32]* @pawn_mat, i32 0, i64 1), align 4
  store i32 0, i32* %i, align 4
  br label %16

; <label>:16                                      ; preds = %98, %15
  %17 = load i32* %i, align 4
  %18 = icmp slt i32 %17, 64
  br i1 %18, label %19, label %101

; <label>:19                                      ; preds = %16
  %20 = load i32* %i, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds [64 x i32]* @color, i32 0, i64 %21
  %23 = load i32* %22, align 4
  %24 = icmp eq i32 %23, 6
  br i1 %24, label %25, label %26

; <label>:25                                      ; preds = %19
  br label %98

; <label>:26                                      ; preds = %19
  %27 = load i32* %i, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds [64 x i32]* @piece, i32 0, i64 %28
  %30 = load i32* %29, align 4
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %32, label %81

; <label>:32                                      ; preds = %26
  %33 = load i32* getelementptr inbounds ([6 x i32]* @piece_value, i32 0, i64 0), align 4
  %34 = load i32* %i, align 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds [64 x i32]* @color, i32 0, i64 %35
  %37 = load i32* %36, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds [2 x i32]* @pawn_mat, i32 0, i64 %38
  %40 = load i32* %39, align 4
  %41 = add nsw i32 %40, %33
  store i32 %41, i32* %39, align 4
  %42 = load i32* %i, align 4
  %43 = and i32 %42, 7
  %44 = add nsw i32 %43, 1
  store i32 %44, i32* %f, align 4
  %45 = load i32* %i, align 4
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds [64 x i32]* @color, i32 0, i64 %46
  %48 = load i32* %47, align 4
  %49 = icmp eq i32 %48, 0
  br i1 %49, label %50, label %65

; <label>:50                                      ; preds = %32
  %51 = load i32* %f, align 4
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds [10 x i32]* getelementptr inbounds ([2 x [10 x i32]]* @pawn_rank, i32 0, i64 0), i32 0, i64 %52
  %54 = load i32* %53, align 4
  %55 = load i32* %i, align 4
  %56 = ashr i32 %55, 3
  %57 = icmp slt i32 %54, %56
  br i1 %57, label %58, label %64

; <label>:58                                      ; preds = %50
  %59 = load i32* %i, align 4
  %60 = ashr i32 %59, 3
  %61 = load i32* %f, align 4
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds [10 x i32]* getelementptr inbounds ([2 x [10 x i32]]* @pawn_rank, i32 0, i64 0), i32 0, i64 %62
  store i32 %60, i32* %63, align 4
  br label %64

; <label>:64                                      ; preds = %58, %50
  br label %80

; <label>:65                                      ; preds = %32
  %66 = load i32* %f, align 4
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds [10 x i32]* getelementptr inbounds ([2 x [10 x i32]]* @pawn_rank, i32 0, i64 1), i32 0, i64 %67
  %69 = load i32* %68, align 4
  %70 = load i32* %i, align 4
  %71 = ashr i32 %70, 3
  %72 = icmp sgt i32 %69, %71
  br i1 %72, label %73, label %79

; <label>:73                                      ; preds = %65
  %74 = load i32* %i, align 4
  %75 = ashr i32 %74, 3
  %76 = load i32* %f, align 4
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds [10 x i32]* getelementptr inbounds ([2 x [10 x i32]]* @pawn_rank, i32 0, i64 1), i32 0, i64 %77
  store i32 %75, i32* %78, align 4
  br label %79

; <label>:79                                      ; preds = %73, %65
  br label %80

; <label>:80                                      ; preds = %79, %64
  br label %97

; <label>:81                                      ; preds = %26
  %82 = load i32* %i, align 4
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds [64 x i32]* @piece, i32 0, i64 %83
  %85 = load i32* %84, align 4
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds [6 x i32]* @piece_value, i32 0, i64 %86
  %88 = load i32* %87, align 4
  %89 = load i32* %i, align 4
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds [64 x i32]* @color, i32 0, i64 %90
  %92 = load i32* %91, align 4
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds [2 x i32]* @piece_mat, i32 0, i64 %93
  %95 = load i32* %94, align 4
  %96 = add nsw i32 %95, %88
  store i32 %96, i32* %94, align 4
  br label %97

; <label>:97                                      ; preds = %81, %80
  br label %98

; <label>:98                                      ; preds = %97, %25
  %99 = load i32* %i, align 4
  %100 = add nsw i32 %99, 1
  store i32 %100, i32* %i, align 4
  br label %16

; <label>:101                                     ; preds = %16
  %102 = load i32* getelementptr inbounds ([2 x i32]* @piece_mat, i32 0, i64 0), align 4
  %103 = load i32* getelementptr inbounds ([2 x i32]* @pawn_mat, i32 0, i64 0), align 4
  %104 = add nsw i32 %102, %103
  %105 = getelementptr inbounds [2 x i32]* %score, i32 0, i64 0
  store i32 %104, i32* %105, align 4
  %106 = load i32* getelementptr inbounds ([2 x i32]* @piece_mat, i32 0, i64 1), align 4
  %107 = load i32* getelementptr inbounds ([2 x i32]* @pawn_mat, i32 0, i64 1), align 4
  %108 = add nsw i32 %106, %107
  %109 = getelementptr inbounds [2 x i32]* %score, i32 0, i64 1
  store i32 %108, i32* %109, align 4
  store i32 0, i32* %i, align 4
  br label %110

; <label>:110                                     ; preds = %296, %101
  %111 = load i32* %i, align 4
  %112 = icmp slt i32 %111, 64
  br i1 %112, label %113, label %299

; <label>:113                                     ; preds = %110
  %114 = load i32* %i, align 4
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds [64 x i32]* @color, i32 0, i64 %115
  %117 = load i32* %116, align 4
  %118 = icmp eq i32 %117, 6
  br i1 %118, label %119, label %120

; <label>:119                                     ; preds = %113
  br label %296

; <label>:120                                     ; preds = %113
  %121 = load i32* %i, align 4
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds [64 x i32]* @color, i32 0, i64 %122
  %124 = load i32* %123, align 4
  %125 = icmp eq i32 %124, 0
  br i1 %125, label %126, label %206

; <label>:126                                     ; preds = %120
  %127 = load i32* %i, align 4
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds [64 x i32]* @piece, i32 0, i64 %128
  %130 = load i32* %129, align 4
  switch i32 %130, label %205 [
    i32 0, label %131
    i32 1, label %137
    i32 2, label %145
    i32 3, label %153
    i32 5, label %187
  ]

; <label>:131                                     ; preds = %126
  %132 = load i32* %i, align 4
  %133 = call i32 @eval_light_pawn(i32 %132)
  %134 = getelementptr inbounds [2 x i32]* %score, i32 0, i64 0
  %135 = load i32* %134, align 4
  %136 = add nsw i32 %135, %133
  store i32 %136, i32* %134, align 4
  br label %205

; <label>:137                                     ; preds = %126
  %138 = load i32* %i, align 4
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds [64 x i32]* @knight_pcsq, i32 0, i64 %139
  %141 = load i32* %140, align 4
  %142 = getelementptr inbounds [2 x i32]* %score, i32 0, i64 0
  %143 = load i32* %142, align 4
  %144 = add nsw i32 %143, %141
  store i32 %144, i32* %142, align 4
  br label %205

; <label>:145                                     ; preds = %126
  %146 = load i32* %i, align 4
  %147 = sext i32 %146 to i64
  %148 = getelementptr inbounds [64 x i32]* @bishop_pcsq, i32 0, i64 %147
  %149 = load i32* %148, align 4
  %150 = getelementptr inbounds [2 x i32]* %score, i32 0, i64 0
  %151 = load i32* %150, align 4
  %152 = add nsw i32 %151, %149
  store i32 %152, i32* %150, align 4
  br label %205

; <label>:153                                     ; preds = %126
  %154 = load i32* %i, align 4
  %155 = and i32 %154, 7
  %156 = add nsw i32 %155, 1
  %157 = sext i32 %156 to i64
  %158 = getelementptr inbounds [10 x i32]* getelementptr inbounds ([2 x [10 x i32]]* @pawn_rank, i32 0, i64 0), i32 0, i64 %157
  %159 = load i32* %158, align 4
  %160 = icmp eq i32 %159, 0
  br i1 %160, label %161, label %178

; <label>:161                                     ; preds = %153
  %162 = load i32* %i, align 4
  %163 = and i32 %162, 7
  %164 = add nsw i32 %163, 1
  %165 = sext i32 %164 to i64
  %166 = getelementptr inbounds [10 x i32]* getelementptr inbounds ([2 x [10 x i32]]* @pawn_rank, i32 0, i64 1), i32 0, i64 %165
  %167 = load i32* %166, align 4
  %168 = icmp eq i32 %167, 7
  br i1 %168, label %169, label %173

; <label>:169                                     ; preds = %161
  %170 = getelementptr inbounds [2 x i32]* %score, i32 0, i64 0
  %171 = load i32* %170, align 4
  %172 = add nsw i32 %171, 15
  store i32 %172, i32* %170, align 4
  br label %177

; <label>:173                                     ; preds = %161
  %174 = getelementptr inbounds [2 x i32]* %score, i32 0, i64 0
  %175 = load i32* %174, align 4
  %176 = add nsw i32 %175, 10
  store i32 %176, i32* %174, align 4
  br label %177

; <label>:177                                     ; preds = %173, %169
  br label %178

; <label>:178                                     ; preds = %177, %153
  %179 = load i32* %i, align 4
  %180 = ashr i32 %179, 3
  %181 = icmp eq i32 %180, 1
  br i1 %181, label %182, label %186

; <label>:182                                     ; preds = %178
  %183 = getelementptr inbounds [2 x i32]* %score, i32 0, i64 0
  %184 = load i32* %183, align 4
  %185 = add nsw i32 %184, 20
  store i32 %185, i32* %183, align 4
  br label %186

; <label>:186                                     ; preds = %182, %178
  br label %205

; <label>:187                                     ; preds = %126
  %188 = load i32* getelementptr inbounds ([2 x i32]* @piece_mat, i32 0, i64 1), align 4
  %189 = icmp sle i32 %188, 1200
  br i1 %189, label %190, label %198

; <label>:190                                     ; preds = %187
  %191 = load i32* %i, align 4
  %192 = sext i32 %191 to i64
  %193 = getelementptr inbounds [64 x i32]* @king_endgame_pcsq, i32 0, i64 %192
  %194 = load i32* %193, align 4
  %195 = getelementptr inbounds [2 x i32]* %score, i32 0, i64 0
  %196 = load i32* %195, align 4
  %197 = add nsw i32 %196, %194
  store i32 %197, i32* %195, align 4
  br label %204

; <label>:198                                     ; preds = %187
  %199 = load i32* %i, align 4
  %200 = call i32 @eval_light_king(i32 %199)
  %201 = getelementptr inbounds [2 x i32]* %score, i32 0, i64 0
  %202 = load i32* %201, align 4
  %203 = add nsw i32 %202, %200
  store i32 %203, i32* %201, align 4
  br label %204

; <label>:204                                     ; preds = %198, %190
  br label %205

; <label>:205                                     ; preds = %126, %204, %186, %145, %137, %131
  br label %295

; <label>:206                                     ; preds = %120
  %207 = load i32* %i, align 4
  %208 = sext i32 %207 to i64
  %209 = getelementptr inbounds [64 x i32]* @piece, i32 0, i64 %208
  %210 = load i32* %209, align 4
  switch i32 %210, label %294 [
    i32 0, label %211
    i32 1, label %217
    i32 2, label %228
    i32 3, label %239
    i32 5, label %273
  ]

; <label>:211                                     ; preds = %206
  %212 = load i32* %i, align 4
  %213 = call i32 @eval_dark_pawn(i32 %212)
  %214 = getelementptr inbounds [2 x i32]* %score, i32 0, i64 1
  %215 = load i32* %214, align 4
  %216 = add nsw i32 %215, %213
  store i32 %216, i32* %214, align 4
  br label %294

; <label>:217                                     ; preds = %206
  %218 = load i32* %i, align 4
  %219 = sext i32 %218 to i64
  %220 = getelementptr inbounds [64 x i32]* @flip, i32 0, i64 %219
  %221 = load i32* %220, align 4
  %222 = sext i32 %221 to i64
  %223 = getelementptr inbounds [64 x i32]* @knight_pcsq, i32 0, i64 %222
  %224 = load i32* %223, align 4
  %225 = getelementptr inbounds [2 x i32]* %score, i32 0, i64 1
  %226 = load i32* %225, align 4
  %227 = add nsw i32 %226, %224
  store i32 %227, i32* %225, align 4
  br label %294

; <label>:228                                     ; preds = %206
  %229 = load i32* %i, align 4
  %230 = sext i32 %229 to i64
  %231 = getelementptr inbounds [64 x i32]* @flip, i32 0, i64 %230
  %232 = load i32* %231, align 4
  %233 = sext i32 %232 to i64
  %234 = getelementptr inbounds [64 x i32]* @bishop_pcsq, i32 0, i64 %233
  %235 = load i32* %234, align 4
  %236 = getelementptr inbounds [2 x i32]* %score, i32 0, i64 1
  %237 = load i32* %236, align 4
  %238 = add nsw i32 %237, %235
  store i32 %238, i32* %236, align 4
  br label %294

; <label>:239                                     ; preds = %206
  %240 = load i32* %i, align 4
  %241 = and i32 %240, 7
  %242 = add nsw i32 %241, 1
  %243 = sext i32 %242 to i64
  %244 = getelementptr inbounds [10 x i32]* getelementptr inbounds ([2 x [10 x i32]]* @pawn_rank, i32 0, i64 1), i32 0, i64 %243
  %245 = load i32* %244, align 4
  %246 = icmp eq i32 %245, 7
  br i1 %246, label %247, label %264

; <label>:247                                     ; preds = %239
  %248 = load i32* %i, align 4
  %249 = and i32 %248, 7
  %250 = add nsw i32 %249, 1
  %251 = sext i32 %250 to i64
  %252 = getelementptr inbounds [10 x i32]* getelementptr inbounds ([2 x [10 x i32]]* @pawn_rank, i32 0, i64 0), i32 0, i64 %251
  %253 = load i32* %252, align 4
  %254 = icmp eq i32 %253, 0
  br i1 %254, label %255, label %259

; <label>:255                                     ; preds = %247
  %256 = getelementptr inbounds [2 x i32]* %score, i32 0, i64 1
  %257 = load i32* %256, align 4
  %258 = add nsw i32 %257, 15
  store i32 %258, i32* %256, align 4
  br label %263

; <label>:259                                     ; preds = %247
  %260 = getelementptr inbounds [2 x i32]* %score, i32 0, i64 1
  %261 = load i32* %260, align 4
  %262 = add nsw i32 %261, 10
  store i32 %262, i32* %260, align 4
  br label %263

; <label>:263                                     ; preds = %259, %255
  br label %264

; <label>:264                                     ; preds = %263, %239
  %265 = load i32* %i, align 4
  %266 = ashr i32 %265, 3
  %267 = icmp eq i32 %266, 6
  br i1 %267, label %268, label %272

; <label>:268                                     ; preds = %264
  %269 = getelementptr inbounds [2 x i32]* %score, i32 0, i64 1
  %270 = load i32* %269, align 4
  %271 = add nsw i32 %270, 20
  store i32 %271, i32* %269, align 4
  br label %272

; <label>:272                                     ; preds = %268, %264
  br label %294

; <label>:273                                     ; preds = %206
  %274 = load i32* getelementptr inbounds ([2 x i32]* @piece_mat, i32 0, i64 0), align 4
  %275 = icmp sle i32 %274, 1200
  br i1 %275, label %276, label %287

; <label>:276                                     ; preds = %273
  %277 = load i32* %i, align 4
  %278 = sext i32 %277 to i64
  %279 = getelementptr inbounds [64 x i32]* @flip, i32 0, i64 %278
  %280 = load i32* %279, align 4
  %281 = sext i32 %280 to i64
  %282 = getelementptr inbounds [64 x i32]* @king_endgame_pcsq, i32 0, i64 %281
  %283 = load i32* %282, align 4
  %284 = getelementptr inbounds [2 x i32]* %score, i32 0, i64 1
  %285 = load i32* %284, align 4
  %286 = add nsw i32 %285, %283
  store i32 %286, i32* %284, align 4
  br label %293

; <label>:287                                     ; preds = %273
  %288 = load i32* %i, align 4
  %289 = call i32 @eval_dark_king(i32 %288)
  %290 = getelementptr inbounds [2 x i32]* %score, i32 0, i64 1
  %291 = load i32* %290, align 4
  %292 = add nsw i32 %291, %289
  store i32 %292, i32* %290, align 4
  br label %293

; <label>:293                                     ; preds = %287, %276
  br label %294

; <label>:294                                     ; preds = %206, %293, %272, %228, %217, %211
  br label %295

; <label>:295                                     ; preds = %294, %205
  br label %296

; <label>:296                                     ; preds = %295, %119
  %297 = load i32* %i, align 4
  %298 = add nsw i32 %297, 1
  store i32 %298, i32* %i, align 4
  br label %110

; <label>:299                                     ; preds = %110
  %300 = load i32* @side, align 4
  %301 = icmp eq i32 %300, 0
  br i1 %301, label %302, label %308

; <label>:302                                     ; preds = %299
  %303 = getelementptr inbounds [2 x i32]* %score, i32 0, i64 0
  %304 = load i32* %303, align 4
  %305 = getelementptr inbounds [2 x i32]* %score, i32 0, i64 1
  %306 = load i32* %305, align 4
  %307 = sub nsw i32 %304, %306
  store i32 %307, i32* %1
  br label %314

; <label>:308                                     ; preds = %299
  %309 = getelementptr inbounds [2 x i32]* %score, i32 0, i64 1
  %310 = load i32* %309, align 4
  %311 = getelementptr inbounds [2 x i32]* %score, i32 0, i64 0
  %312 = load i32* %311, align 4
  %313 = sub nsw i32 %310, %312
  store i32 %313, i32* %1
  br label %314

; <label>:314                                     ; preds = %308, %302
  %315 = load i32* %1
  ret i32 %315
}

; Function Attrs: nounwind uwtable
define i32 @eval_light_pawn(i32 %sq) #0 {
  %1 = alloca i32, align 4
  %r = alloca i32, align 4
  %f = alloca i32, align 4
  store i32 %sq, i32* %1, align 4
  store i32 0, i32* %r, align 4
  %2 = load i32* %1, align 4
  %3 = and i32 %2, 7
  %4 = add nsw i32 %3, 1
  store i32 %4, i32* %f, align 4
  %5 = load i32* %1, align 4
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds [64 x i32]* @pawn_pcsq, i32 0, i64 %6
  %8 = load i32* %7, align 4
  %9 = load i32* %r, align 4
  %10 = add nsw i32 %9, %8
  store i32 %10, i32* %r, align 4
  %11 = load i32* %f, align 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [10 x i32]* getelementptr inbounds ([2 x [10 x i32]]* @pawn_rank, i32 0, i64 0), i32 0, i64 %12
  %14 = load i32* %13, align 4
  %15 = load i32* %1, align 4
  %16 = ashr i32 %15, 3
  %17 = icmp sgt i32 %14, %16
  br i1 %17, label %18, label %21

; <label>:18                                      ; preds = %0
  %19 = load i32* %r, align 4
  %20 = sub nsw i32 %19, 10
  store i32 %20, i32* %r, align 4
  br label %21

; <label>:21                                      ; preds = %18, %0
  %22 = load i32* %f, align 4
  %23 = sub nsw i32 %22, 1
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds [10 x i32]* getelementptr inbounds ([2 x [10 x i32]]* @pawn_rank, i32 0, i64 0), i32 0, i64 %24
  %26 = load i32* %25, align 4
  %27 = icmp eq i32 %26, 0
  br i1 %27, label %28, label %38

; <label>:28                                      ; preds = %21
  %29 = load i32* %f, align 4
  %30 = add nsw i32 %29, 1
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds [10 x i32]* getelementptr inbounds ([2 x [10 x i32]]* @pawn_rank, i32 0, i64 0), i32 0, i64 %31
  %33 = load i32* %32, align 4
  %34 = icmp eq i32 %33, 0
  br i1 %34, label %35, label %38

; <label>:35                                      ; preds = %28
  %36 = load i32* %r, align 4
  %37 = sub nsw i32 %36, 20
  store i32 %37, i32* %r, align 4
  br label %60

; <label>:38                                      ; preds = %28, %21
  %39 = load i32* %f, align 4
  %40 = sub nsw i32 %39, 1
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds [10 x i32]* getelementptr inbounds ([2 x [10 x i32]]* @pawn_rank, i32 0, i64 0), i32 0, i64 %41
  %43 = load i32* %42, align 4
  %44 = load i32* %1, align 4
  %45 = ashr i32 %44, 3
  %46 = icmp slt i32 %43, %45
  br i1 %46, label %47, label %59

; <label>:47                                      ; preds = %38
  %48 = load i32* %f, align 4
  %49 = add nsw i32 %48, 1
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds [10 x i32]* getelementptr inbounds ([2 x [10 x i32]]* @pawn_rank, i32 0, i64 0), i32 0, i64 %50
  %52 = load i32* %51, align 4
  %53 = load i32* %1, align 4
  %54 = ashr i32 %53, 3
  %55 = icmp slt i32 %52, %54
  br i1 %55, label %56, label %59

; <label>:56                                      ; preds = %47
  %57 = load i32* %r, align 4
  %58 = sub nsw i32 %57, 8
  store i32 %58, i32* %r, align 4
  br label %59

; <label>:59                                      ; preds = %56, %47, %38
  br label %60

; <label>:60                                      ; preds = %59, %35
  %61 = load i32* %f, align 4
  %62 = sub nsw i32 %61, 1
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds [10 x i32]* getelementptr inbounds ([2 x [10 x i32]]* @pawn_rank, i32 0, i64 1), i32 0, i64 %63
  %65 = load i32* %64, align 4
  %66 = load i32* %1, align 4
  %67 = ashr i32 %66, 3
  %68 = icmp sge i32 %65, %67
  br i1 %68, label %69, label %93

; <label>:69                                      ; preds = %60
  %70 = load i32* %f, align 4
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds [10 x i32]* getelementptr inbounds ([2 x [10 x i32]]* @pawn_rank, i32 0, i64 1), i32 0, i64 %71
  %73 = load i32* %72, align 4
  %74 = load i32* %1, align 4
  %75 = ashr i32 %74, 3
  %76 = icmp sge i32 %73, %75
  br i1 %76, label %77, label %93

; <label>:77                                      ; preds = %69
  %78 = load i32* %f, align 4
  %79 = add nsw i32 %78, 1
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds [10 x i32]* getelementptr inbounds ([2 x [10 x i32]]* @pawn_rank, i32 0, i64 1), i32 0, i64 %80
  %82 = load i32* %81, align 4
  %83 = load i32* %1, align 4
  %84 = ashr i32 %83, 3
  %85 = icmp sge i32 %82, %84
  br i1 %85, label %86, label %93

; <label>:86                                      ; preds = %77
  %87 = load i32* %1, align 4
  %88 = ashr i32 %87, 3
  %89 = sub nsw i32 7, %88
  %90 = mul nsw i32 %89, 20
  %91 = load i32* %r, align 4
  %92 = add nsw i32 %91, %90
  store i32 %92, i32* %r, align 4
  br label %93

; <label>:93                                      ; preds = %86, %77, %69, %60
  %94 = load i32* %r, align 4
  ret i32 %94
}

; Function Attrs: nounwind uwtable
define i32 @eval_light_king(i32 %sq) #0 {
  %1 = alloca i32, align 4
  %r = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 %sq, i32* %1, align 4
  %2 = load i32* %1, align 4
  %3 = sext i32 %2 to i64
  %4 = getelementptr inbounds [64 x i32]* @king_pcsq, i32 0, i64 %3
  %5 = load i32* %4, align 4
  store i32 %5, i32* %r, align 4
  %6 = load i32* %1, align 4
  %7 = and i32 %6, 7
  %8 = icmp slt i32 %7, 3
  br i1 %8, label %9, label %20

; <label>:9                                       ; preds = %0
  %10 = call i32 @eval_lkp(i32 1)
  %11 = load i32* %r, align 4
  %12 = add nsw i32 %11, %10
  store i32 %12, i32* %r, align 4
  %13 = call i32 @eval_lkp(i32 2)
  %14 = load i32* %r, align 4
  %15 = add nsw i32 %14, %13
  store i32 %15, i32* %r, align 4
  %16 = call i32 @eval_lkp(i32 3)
  %17 = sdiv i32 %16, 2
  %18 = load i32* %r, align 4
  %19 = add nsw i32 %18, %17
  store i32 %19, i32* %r, align 4
  br label %65

; <label>:20                                      ; preds = %0
  %21 = load i32* %1, align 4
  %22 = and i32 %21, 7
  %23 = icmp sgt i32 %22, 4
  br i1 %23, label %24, label %35

; <label>:24                                      ; preds = %20
  %25 = call i32 @eval_lkp(i32 8)
  %26 = load i32* %r, align 4
  %27 = add nsw i32 %26, %25
  store i32 %27, i32* %r, align 4
  %28 = call i32 @eval_lkp(i32 7)
  %29 = load i32* %r, align 4
  %30 = add nsw i32 %29, %28
  store i32 %30, i32* %r, align 4
  %31 = call i32 @eval_lkp(i32 6)
  %32 = sdiv i32 %31, 2
  %33 = load i32* %r, align 4
  %34 = add nsw i32 %33, %32
  store i32 %34, i32* %r, align 4
  br label %64

; <label>:35                                      ; preds = %20
  %36 = load i32* %1, align 4
  %37 = and i32 %36, 7
  store i32 %37, i32* %i, align 4
  br label %38

; <label>:38                                      ; preds = %60, %35
  %39 = load i32* %i, align 4
  %40 = load i32* %1, align 4
  %41 = and i32 %40, 7
  %42 = add nsw i32 %41, 2
  %43 = icmp sle i32 %39, %42
  br i1 %43, label %44, label %63

; <label>:44                                      ; preds = %38
  %45 = load i32* %i, align 4
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds [10 x i32]* getelementptr inbounds ([2 x [10 x i32]]* @pawn_rank, i32 0, i64 0), i32 0, i64 %46
  %48 = load i32* %47, align 4
  %49 = icmp eq i32 %48, 0
  br i1 %49, label %50, label %59

; <label>:50                                      ; preds = %44
  %51 = load i32* %i, align 4
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds [10 x i32]* getelementptr inbounds ([2 x [10 x i32]]* @pawn_rank, i32 0, i64 1), i32 0, i64 %52
  %54 = load i32* %53, align 4
  %55 = icmp eq i32 %54, 7
  br i1 %55, label %56, label %59

; <label>:56                                      ; preds = %50
  %57 = load i32* %r, align 4
  %58 = sub nsw i32 %57, 10
  store i32 %58, i32* %r, align 4
  br label %59

; <label>:59                                      ; preds = %56, %50, %44
  br label %60

; <label>:60                                      ; preds = %59
  %61 = load i32* %i, align 4
  %62 = add nsw i32 %61, 1
  store i32 %62, i32* %i, align 4
  br label %38

; <label>:63                                      ; preds = %38
  br label %64

; <label>:64                                      ; preds = %63, %24
  br label %65

; <label>:65                                      ; preds = %64, %9
  %66 = load i32* getelementptr inbounds ([2 x i32]* @piece_mat, i32 0, i64 1), align 4
  %67 = load i32* %r, align 4
  %68 = mul nsw i32 %67, %66
  store i32 %68, i32* %r, align 4
  %69 = load i32* %r, align 4
  %70 = sdiv i32 %69, 3100
  store i32 %70, i32* %r, align 4
  %71 = load i32* %r, align 4
  ret i32 %71
}

; Function Attrs: nounwind uwtable
define i32 @eval_dark_pawn(i32 %sq) #0 {
  %1 = alloca i32, align 4
  %r = alloca i32, align 4
  %f = alloca i32, align 4
  store i32 %sq, i32* %1, align 4
  store i32 0, i32* %r, align 4
  %2 = load i32* %1, align 4
  %3 = and i32 %2, 7
  %4 = add nsw i32 %3, 1
  store i32 %4, i32* %f, align 4
  %5 = load i32* %1, align 4
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds [64 x i32]* @flip, i32 0, i64 %6
  %8 = load i32* %7, align 4
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds [64 x i32]* @pawn_pcsq, i32 0, i64 %9
  %11 = load i32* %10, align 4
  %12 = load i32* %r, align 4
  %13 = add nsw i32 %12, %11
  store i32 %13, i32* %r, align 4
  %14 = load i32* %f, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [10 x i32]* getelementptr inbounds ([2 x [10 x i32]]* @pawn_rank, i32 0, i64 1), i32 0, i64 %15
  %17 = load i32* %16, align 4
  %18 = load i32* %1, align 4
  %19 = ashr i32 %18, 3
  %20 = icmp slt i32 %17, %19
  br i1 %20, label %21, label %24

; <label>:21                                      ; preds = %0
  %22 = load i32* %r, align 4
  %23 = sub nsw i32 %22, 10
  store i32 %23, i32* %r, align 4
  br label %24

; <label>:24                                      ; preds = %21, %0
  %25 = load i32* %f, align 4
  %26 = sub nsw i32 %25, 1
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds [10 x i32]* getelementptr inbounds ([2 x [10 x i32]]* @pawn_rank, i32 0, i64 1), i32 0, i64 %27
  %29 = load i32* %28, align 4
  %30 = icmp eq i32 %29, 7
  br i1 %30, label %31, label %41

; <label>:31                                      ; preds = %24
  %32 = load i32* %f, align 4
  %33 = add nsw i32 %32, 1
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds [10 x i32]* getelementptr inbounds ([2 x [10 x i32]]* @pawn_rank, i32 0, i64 1), i32 0, i64 %34
  %36 = load i32* %35, align 4
  %37 = icmp eq i32 %36, 7
  br i1 %37, label %38, label %41

; <label>:38                                      ; preds = %31
  %39 = load i32* %r, align 4
  %40 = sub nsw i32 %39, 20
  store i32 %40, i32* %r, align 4
  br label %63

; <label>:41                                      ; preds = %31, %24
  %42 = load i32* %f, align 4
  %43 = sub nsw i32 %42, 1
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds [10 x i32]* getelementptr inbounds ([2 x [10 x i32]]* @pawn_rank, i32 0, i64 1), i32 0, i64 %44
  %46 = load i32* %45, align 4
  %47 = load i32* %1, align 4
  %48 = ashr i32 %47, 3
  %49 = icmp sgt i32 %46, %48
  br i1 %49, label %50, label %62

; <label>:50                                      ; preds = %41
  %51 = load i32* %f, align 4
  %52 = add nsw i32 %51, 1
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds [10 x i32]* getelementptr inbounds ([2 x [10 x i32]]* @pawn_rank, i32 0, i64 1), i32 0, i64 %53
  %55 = load i32* %54, align 4
  %56 = load i32* %1, align 4
  %57 = ashr i32 %56, 3
  %58 = icmp sgt i32 %55, %57
  br i1 %58, label %59, label %62

; <label>:59                                      ; preds = %50
  %60 = load i32* %r, align 4
  %61 = sub nsw i32 %60, 8
  store i32 %61, i32* %r, align 4
  br label %62

; <label>:62                                      ; preds = %59, %50, %41
  br label %63

; <label>:63                                      ; preds = %62, %38
  %64 = load i32* %f, align 4
  %65 = sub nsw i32 %64, 1
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds [10 x i32]* getelementptr inbounds ([2 x [10 x i32]]* @pawn_rank, i32 0, i64 0), i32 0, i64 %66
  %68 = load i32* %67, align 4
  %69 = load i32* %1, align 4
  %70 = ashr i32 %69, 3
  %71 = icmp sle i32 %68, %70
  br i1 %71, label %72, label %95

; <label>:72                                      ; preds = %63
  %73 = load i32* %f, align 4
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds [10 x i32]* getelementptr inbounds ([2 x [10 x i32]]* @pawn_rank, i32 0, i64 0), i32 0, i64 %74
  %76 = load i32* %75, align 4
  %77 = load i32* %1, align 4
  %78 = ashr i32 %77, 3
  %79 = icmp sle i32 %76, %78
  br i1 %79, label %80, label %95

; <label>:80                                      ; preds = %72
  %81 = load i32* %f, align 4
  %82 = add nsw i32 %81, 1
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds [10 x i32]* getelementptr inbounds ([2 x [10 x i32]]* @pawn_rank, i32 0, i64 0), i32 0, i64 %83
  %85 = load i32* %84, align 4
  %86 = load i32* %1, align 4
  %87 = ashr i32 %86, 3
  %88 = icmp sle i32 %85, %87
  br i1 %88, label %89, label %95

; <label>:89                                      ; preds = %80
  %90 = load i32* %1, align 4
  %91 = ashr i32 %90, 3
  %92 = mul nsw i32 %91, 20
  %93 = load i32* %r, align 4
  %94 = add nsw i32 %93, %92
  store i32 %94, i32* %r, align 4
  br label %95

; <label>:95                                      ; preds = %89, %80, %72, %63
  %96 = load i32* %r, align 4
  ret i32 %96
}

; Function Attrs: nounwind uwtable
define i32 @eval_dark_king(i32 %sq) #0 {
  %1 = alloca i32, align 4
  %r = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 %sq, i32* %1, align 4
  %2 = load i32* %1, align 4
  %3 = sext i32 %2 to i64
  %4 = getelementptr inbounds [64 x i32]* @flip, i32 0, i64 %3
  %5 = load i32* %4, align 4
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds [64 x i32]* @king_pcsq, i32 0, i64 %6
  %8 = load i32* %7, align 4
  store i32 %8, i32* %r, align 4
  %9 = load i32* %1, align 4
  %10 = and i32 %9, 7
  %11 = icmp slt i32 %10, 3
  br i1 %11, label %12, label %23

; <label>:12                                      ; preds = %0
  %13 = call i32 @eval_dkp(i32 1)
  %14 = load i32* %r, align 4
  %15 = add nsw i32 %14, %13
  store i32 %15, i32* %r, align 4
  %16 = call i32 @eval_dkp(i32 2)
  %17 = load i32* %r, align 4
  %18 = add nsw i32 %17, %16
  store i32 %18, i32* %r, align 4
  %19 = call i32 @eval_dkp(i32 3)
  %20 = sdiv i32 %19, 2
  %21 = load i32* %r, align 4
  %22 = add nsw i32 %21, %20
  store i32 %22, i32* %r, align 4
  br label %68

; <label>:23                                      ; preds = %0
  %24 = load i32* %1, align 4
  %25 = and i32 %24, 7
  %26 = icmp sgt i32 %25, 4
  br i1 %26, label %27, label %38

; <label>:27                                      ; preds = %23
  %28 = call i32 @eval_dkp(i32 8)
  %29 = load i32* %r, align 4
  %30 = add nsw i32 %29, %28
  store i32 %30, i32* %r, align 4
  %31 = call i32 @eval_dkp(i32 7)
  %32 = load i32* %r, align 4
  %33 = add nsw i32 %32, %31
  store i32 %33, i32* %r, align 4
  %34 = call i32 @eval_dkp(i32 6)
  %35 = sdiv i32 %34, 2
  %36 = load i32* %r, align 4
  %37 = add nsw i32 %36, %35
  store i32 %37, i32* %r, align 4
  br label %67

; <label>:38                                      ; preds = %23
  %39 = load i32* %1, align 4
  %40 = and i32 %39, 7
  store i32 %40, i32* %i, align 4
  br label %41

; <label>:41                                      ; preds = %63, %38
  %42 = load i32* %i, align 4
  %43 = load i32* %1, align 4
  %44 = and i32 %43, 7
  %45 = add nsw i32 %44, 2
  %46 = icmp sle i32 %42, %45
  br i1 %46, label %47, label %66

; <label>:47                                      ; preds = %41
  %48 = load i32* %i, align 4
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds [10 x i32]* getelementptr inbounds ([2 x [10 x i32]]* @pawn_rank, i32 0, i64 0), i32 0, i64 %49
  %51 = load i32* %50, align 4
  %52 = icmp eq i32 %51, 0
  br i1 %52, label %53, label %62

; <label>:53                                      ; preds = %47
  %54 = load i32* %i, align 4
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds [10 x i32]* getelementptr inbounds ([2 x [10 x i32]]* @pawn_rank, i32 0, i64 1), i32 0, i64 %55
  %57 = load i32* %56, align 4
  %58 = icmp eq i32 %57, 7
  br i1 %58, label %59, label %62

; <label>:59                                      ; preds = %53
  %60 = load i32* %r, align 4
  %61 = sub nsw i32 %60, 10
  store i32 %61, i32* %r, align 4
  br label %62

; <label>:62                                      ; preds = %59, %53, %47
  br label %63

; <label>:63                                      ; preds = %62
  %64 = load i32* %i, align 4
  %65 = add nsw i32 %64, 1
  store i32 %65, i32* %i, align 4
  br label %41

; <label>:66                                      ; preds = %41
  br label %67

; <label>:67                                      ; preds = %66, %27
  br label %68

; <label>:68                                      ; preds = %67, %12
  %69 = load i32* getelementptr inbounds ([2 x i32]* @piece_mat, i32 0, i64 0), align 4
  %70 = load i32* %r, align 4
  %71 = mul nsw i32 %70, %69
  store i32 %71, i32* %r, align 4
  %72 = load i32* %r, align 4
  %73 = sdiv i32 %72, 3100
  store i32 %73, i32* %r, align 4
  %74 = load i32* %r, align 4
  ret i32 %74
}

; Function Attrs: nounwind uwtable
define i32 @eval_lkp(i32 %f) #0 {
  %1 = alloca i32, align 4
  %r = alloca i32, align 4
  store i32 %f, i32* %1, align 4
  store i32 0, i32* %r, align 4
  %2 = load i32* %1, align 4
  %3 = sext i32 %2 to i64
  %4 = getelementptr inbounds [10 x i32]* getelementptr inbounds ([2 x [10 x i32]]* @pawn_rank, i32 0, i64 0), i32 0, i64 %3
  %5 = load i32* %4, align 4
  %6 = icmp eq i32 %5, 6
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %0
  br label %31

; <label>:8                                       ; preds = %0
  %9 = load i32* %1, align 4
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds [10 x i32]* getelementptr inbounds ([2 x [10 x i32]]* @pawn_rank, i32 0, i64 0), i32 0, i64 %10
  %12 = load i32* %11, align 4
  %13 = icmp eq i32 %12, 5
  br i1 %13, label %14, label %17

; <label>:14                                      ; preds = %8
  %15 = load i32* %r, align 4
  %16 = sub nsw i32 %15, 10
  store i32 %16, i32* %r, align 4
  br label %30

; <label>:17                                      ; preds = %8
  %18 = load i32* %1, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds [10 x i32]* getelementptr inbounds ([2 x [10 x i32]]* @pawn_rank, i32 0, i64 0), i32 0, i64 %19
  %21 = load i32* %20, align 4
  %22 = icmp ne i32 %21, 0
  br i1 %22, label %23, label %26

; <label>:23                                      ; preds = %17
  %24 = load i32* %r, align 4
  %25 = sub nsw i32 %24, 20
  store i32 %25, i32* %r, align 4
  br label %29

; <label>:26                                      ; preds = %17
  %27 = load i32* %r, align 4
  %28 = sub nsw i32 %27, 25
  store i32 %28, i32* %r, align 4
  br label %29

; <label>:29                                      ; preds = %26, %23
  br label %30

; <label>:30                                      ; preds = %29, %14
  br label %31

; <label>:31                                      ; preds = %30, %7
  %32 = load i32* %1, align 4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds [10 x i32]* getelementptr inbounds ([2 x [10 x i32]]* @pawn_rank, i32 0, i64 1), i32 0, i64 %33
  %35 = load i32* %34, align 4
  %36 = icmp eq i32 %35, 7
  br i1 %36, label %37, label %40

; <label>:37                                      ; preds = %31
  %38 = load i32* %r, align 4
  %39 = sub nsw i32 %38, 15
  store i32 %39, i32* %r, align 4
  br label %60

; <label>:40                                      ; preds = %31
  %41 = load i32* %1, align 4
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds [10 x i32]* getelementptr inbounds ([2 x [10 x i32]]* @pawn_rank, i32 0, i64 1), i32 0, i64 %42
  %44 = load i32* %43, align 4
  %45 = icmp eq i32 %44, 5
  br i1 %45, label %46, label %49

; <label>:46                                      ; preds = %40
  %47 = load i32* %r, align 4
  %48 = sub nsw i32 %47, 10
  store i32 %48, i32* %r, align 4
  br label %59

; <label>:49                                      ; preds = %40
  %50 = load i32* %1, align 4
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds [10 x i32]* getelementptr inbounds ([2 x [10 x i32]]* @pawn_rank, i32 0, i64 1), i32 0, i64 %51
  %53 = load i32* %52, align 4
  %54 = icmp eq i32 %53, 4
  br i1 %54, label %55, label %58

; <label>:55                                      ; preds = %49
  %56 = load i32* %r, align 4
  %57 = sub nsw i32 %56, 5
  store i32 %57, i32* %r, align 4
  br label %58

; <label>:58                                      ; preds = %55, %49
  br label %59

; <label>:59                                      ; preds = %58, %46
  br label %60

; <label>:60                                      ; preds = %59, %37
  %61 = load i32* %r, align 4
  ret i32 %61
}

; Function Attrs: nounwind uwtable
define i32 @eval_dkp(i32 %f) #0 {
  %1 = alloca i32, align 4
  %r = alloca i32, align 4
  store i32 %f, i32* %1, align 4
  store i32 0, i32* %r, align 4
  %2 = load i32* %1, align 4
  %3 = sext i32 %2 to i64
  %4 = getelementptr inbounds [10 x i32]* getelementptr inbounds ([2 x [10 x i32]]* @pawn_rank, i32 0, i64 1), i32 0, i64 %3
  %5 = load i32* %4, align 4
  %6 = icmp eq i32 %5, 1
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %0
  br label %31

; <label>:8                                       ; preds = %0
  %9 = load i32* %1, align 4
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds [10 x i32]* getelementptr inbounds ([2 x [10 x i32]]* @pawn_rank, i32 0, i64 1), i32 0, i64 %10
  %12 = load i32* %11, align 4
  %13 = icmp eq i32 %12, 2
  br i1 %13, label %14, label %17

; <label>:14                                      ; preds = %8
  %15 = load i32* %r, align 4
  %16 = sub nsw i32 %15, 10
  store i32 %16, i32* %r, align 4
  br label %30

; <label>:17                                      ; preds = %8
  %18 = load i32* %1, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds [10 x i32]* getelementptr inbounds ([2 x [10 x i32]]* @pawn_rank, i32 0, i64 1), i32 0, i64 %19
  %21 = load i32* %20, align 4
  %22 = icmp ne i32 %21, 7
  br i1 %22, label %23, label %26

; <label>:23                                      ; preds = %17
  %24 = load i32* %r, align 4
  %25 = sub nsw i32 %24, 20
  store i32 %25, i32* %r, align 4
  br label %29

; <label>:26                                      ; preds = %17
  %27 = load i32* %r, align 4
  %28 = sub nsw i32 %27, 25
  store i32 %28, i32* %r, align 4
  br label %29

; <label>:29                                      ; preds = %26, %23
  br label %30

; <label>:30                                      ; preds = %29, %14
  br label %31

; <label>:31                                      ; preds = %30, %7
  %32 = load i32* %1, align 4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds [10 x i32]* getelementptr inbounds ([2 x [10 x i32]]* @pawn_rank, i32 0, i64 0), i32 0, i64 %33
  %35 = load i32* %34, align 4
  %36 = icmp eq i32 %35, 0
  br i1 %36, label %37, label %40

; <label>:37                                      ; preds = %31
  %38 = load i32* %r, align 4
  %39 = sub nsw i32 %38, 15
  store i32 %39, i32* %r, align 4
  br label %60

; <label>:40                                      ; preds = %31
  %41 = load i32* %1, align 4
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds [10 x i32]* getelementptr inbounds ([2 x [10 x i32]]* @pawn_rank, i32 0, i64 0), i32 0, i64 %42
  %44 = load i32* %43, align 4
  %45 = icmp eq i32 %44, 2
  br i1 %45, label %46, label %49

; <label>:46                                      ; preds = %40
  %47 = load i32* %r, align 4
  %48 = sub nsw i32 %47, 10
  store i32 %48, i32* %r, align 4
  br label %59

; <label>:49                                      ; preds = %40
  %50 = load i32* %1, align 4
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds [10 x i32]* getelementptr inbounds ([2 x [10 x i32]]* @pawn_rank, i32 0, i64 0), i32 0, i64 %51
  %53 = load i32* %52, align 4
  %54 = icmp eq i32 %53, 3
  br i1 %54, label %55, label %58

; <label>:55                                      ; preds = %49
  %56 = load i32* %r, align 4
  %57 = sub nsw i32 %56, 5
  store i32 %57, i32* %r, align 4
  br label %58

; <label>:58                                      ; preds = %55, %49
  br label %59

; <label>:59                                      ; preds = %58, %46
  br label %60

; <label>:60                                      ; preds = %59, %37
  %61 = load i32* %r, align 4
  ret i32 %61
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
