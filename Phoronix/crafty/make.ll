; ModuleID = 'make.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.tree = type { %struct.POSITION, [67 x i64], [2 x [128 x i64]], i64, i64, [67 x i64], [64 x i64], %struct.PAWN_HASH_ENTRY, [67 x %struct.SEARCH_POSITION], [65 x %struct.NEXT_MOVE], [65 x %struct.PATH], [64 x i32], [2 x i32], [65 x i32], [65 x i32], [65 x i32*], i32, i32, i32, i32, i32, i32, i32, i32, i32, [65 x %struct.KILLER], [5120 x i32], [256 x i32], [65 x i8], [65 x i8], i32, [2 x i32], [2 x i32], i32, i32, i32, i64, i32, [16 x i8], [16 x i8], [1 x %struct.tree*], %struct.tree*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }
%struct.POSITION = type { [2 x %struct.BB_PIECES], i64, i64, i32, [2 x i32], [64 x i8], [2 x [7 x i8]], [2 x i8], [2 x i8], i8 }
%struct.BB_PIECES = type { [7 x i64] }
%struct.PAWN_HASH_ENTRY = type { i64, i32, i32, [2 x i8], [2 x i8], [2 x i8], [2 x i8], [2 x i8], [2 x i8], [2 x i8], i8, i8 }
%struct.SEARCH_POSITION = type { i8, [2 x i8], i8 }
%struct.NEXT_MOVE = type { i32, i32, i32* }
%struct.PATH = type { [65 x i32], i8, i8, i8 }
%struct.KILLER = type { i32, i32 }

@enpassant_random = external global [65 x i64]
@set_mask = external global [65 x i64]
@randoms = external global [2 x [7 x [64 x i64]]]
@pieces = external constant [2 x [7 x i32]]
@epsq = external global [2 x i32]
@clear_mask = external global [65 x i64]
@piece_values = external global [7 x [2 x i32]]
@p_vals = external constant [7 x i32]
@mask_eptest = external global [64 x i64]
@rook_A = external global [2 x i32]
@castle_random = external global [2 x [2 x i64]]
@rook_H = external global [2 x i32]
@rook_G = external global [2 x i32]
@rook_F = external global [2 x i32]
@rook_D = external global [2 x i32]

; Function Attrs: nounwind uwtable
define void @MakeMove(%struct.tree* %tree, i32 %ply, i32 %move, i32 %wtm) #0 {
  %1 = alloca %struct.tree*, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %bit_move = alloca i64, align 8
  %piece = alloca i32, align 4
  %from = alloca i32, align 4
  %to = alloca i32, align 4
  %captured = alloca i32, align 4
  %promote = alloca i32, align 4
  %btm = alloca i32, align 4
  %cpiece = alloca i32, align 4
  store %struct.tree* %tree, %struct.tree** %1, align 8
  store i32 %ply, i32* %2, align 4
  store i32 %move, i32* %3, align 4
  store i32 %wtm, i32* %4, align 4
  %5 = load i32* %4, align 4
  %6 = xor i32 %5, 1
  store i32 %6, i32* %btm, align 4
  %7 = load i32* %2, align 4
  %8 = add nsw i32 %7, 1
  %9 = sext i32 %8 to i64
  %10 = load %struct.tree** %1, align 8
  %11 = getelementptr inbounds %struct.tree* %10, i32 0, i32 8
  %12 = getelementptr inbounds [67 x %struct.SEARCH_POSITION]* %11, i32 0, i64 %9
  %13 = load i32* %2, align 4
  %14 = sext i32 %13 to i64
  %15 = load %struct.tree** %1, align 8
  %16 = getelementptr inbounds %struct.tree* %15, i32 0, i32 8
  %17 = getelementptr inbounds [67 x %struct.SEARCH_POSITION]* %16, i32 0, i64 %14
  %18 = bitcast %struct.SEARCH_POSITION* %12 to i8*
  %19 = bitcast %struct.SEARCH_POSITION* %17 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %18, i8* %19, i64 4, i32 1, i1 false)
  %20 = load %struct.tree** %1, align 8
  %21 = getelementptr inbounds %struct.tree* %20, i32 0, i32 0
  %22 = getelementptr inbounds %struct.POSITION* %21, i32 0, i32 1
  %23 = load i64* %22, align 8
  %24 = load i32* %2, align 4
  %25 = sext i32 %24 to i64
  %26 = load %struct.tree** %1, align 8
  %27 = getelementptr inbounds %struct.tree* %26, i32 0, i32 1
  %28 = getelementptr inbounds [67 x i64]* %27, i32 0, i64 %25
  store i64 %23, i64* %28, align 8
  %29 = load %struct.tree** %1, align 8
  %30 = getelementptr inbounds %struct.tree* %29, i32 0, i32 0
  %31 = getelementptr inbounds %struct.POSITION* %30, i32 0, i32 2
  %32 = load i64* %31, align 8
  %33 = load i32* %2, align 4
  %34 = sext i32 %33 to i64
  %35 = load %struct.tree** %1, align 8
  %36 = getelementptr inbounds %struct.tree* %35, i32 0, i32 5
  %37 = getelementptr inbounds [67 x i64]* %36, i32 0, i64 %34
  store i64 %32, i64* %37, align 8
  %38 = load i32* %2, align 4
  %39 = add nsw i32 %38, 1
  %40 = sext i32 %39 to i64
  %41 = load %struct.tree** %1, align 8
  %42 = getelementptr inbounds %struct.tree* %41, i32 0, i32 8
  %43 = getelementptr inbounds [67 x %struct.SEARCH_POSITION]* %42, i32 0, i64 %40
  %44 = getelementptr inbounds %struct.SEARCH_POSITION* %43, i32 0, i32 0
  %45 = load i8* %44, align 1
  %46 = icmp ne i8 %45, 0
  br i1 %46, label %47, label %71

; <label>:47                                      ; preds = %0
  %48 = load i32* %2, align 4
  %49 = add nsw i32 %48, 1
  %50 = sext i32 %49 to i64
  %51 = load %struct.tree** %1, align 8
  %52 = getelementptr inbounds %struct.tree* %51, i32 0, i32 8
  %53 = getelementptr inbounds [67 x %struct.SEARCH_POSITION]* %52, i32 0, i64 %50
  %54 = getelementptr inbounds %struct.SEARCH_POSITION* %53, i32 0, i32 0
  %55 = load i8* %54, align 1
  %56 = zext i8 %55 to i64
  %57 = getelementptr inbounds [65 x i64]* @enpassant_random, i32 0, i64 %56
  %58 = load i64* %57, align 8
  %59 = load %struct.tree** %1, align 8
  %60 = getelementptr inbounds %struct.tree* %59, i32 0, i32 0
  %61 = getelementptr inbounds %struct.POSITION* %60, i32 0, i32 1
  %62 = load i64* %61, align 8
  %63 = xor i64 %62, %58
  store i64 %63, i64* %61, align 8
  %64 = load i32* %2, align 4
  %65 = add nsw i32 %64, 1
  %66 = sext i32 %65 to i64
  %67 = load %struct.tree** %1, align 8
  %68 = getelementptr inbounds %struct.tree* %67, i32 0, i32 8
  %69 = getelementptr inbounds [67 x %struct.SEARCH_POSITION]* %68, i32 0, i64 %66
  %70 = getelementptr inbounds %struct.SEARCH_POSITION* %69, i32 0, i32 0
  store i8 0, i8* %70, align 1
  br label %71

; <label>:71                                      ; preds = %47, %0
  %72 = load i32* %2, align 4
  %73 = add nsw i32 %72, 1
  %74 = sext i32 %73 to i64
  %75 = load %struct.tree** %1, align 8
  %76 = getelementptr inbounds %struct.tree* %75, i32 0, i32 8
  %77 = getelementptr inbounds [67 x %struct.SEARCH_POSITION]* %76, i32 0, i64 %74
  %78 = getelementptr inbounds %struct.SEARCH_POSITION* %77, i32 0, i32 2
  %79 = load i8* %78, align 1
  %80 = add i8 %79, 1
  store i8 %80, i8* %78, align 1
  %81 = load i32* %3, align 4
  %82 = ashr i32 %81, 12
  %83 = and i32 %82, 7
  store i32 %83, i32* %piece, align 4
  %84 = load i32* %3, align 4
  %85 = and i32 %84, 63
  store i32 %85, i32* %from, align 4
  %86 = load i32* %3, align 4
  %87 = ashr i32 %86, 6
  %88 = and i32 %87, 63
  store i32 %88, i32* %to, align 4
  %89 = load i32* %3, align 4
  %90 = ashr i32 %89, 15
  %91 = and i32 %90, 7
  store i32 %91, i32* %captured, align 4
  %92 = load i32* %3, align 4
  %93 = ashr i32 %92, 18
  %94 = and i32 %93, 7
  store i32 %94, i32* %promote, align 4
  %95 = load i32* %from, align 4
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds [65 x i64]* @set_mask, i32 0, i64 %96
  %98 = load i64* %97, align 8
  %99 = load i32* %to, align 4
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds [65 x i64]* @set_mask, i32 0, i64 %100
  %102 = load i64* %101, align 8
  %103 = or i64 %98, %102
  store i64 %103, i64* %bit_move, align 8
  %104 = load i32* %to, align 4
  %105 = sext i32 %104 to i64
  %106 = load %struct.tree** %1, align 8
  %107 = getelementptr inbounds %struct.tree* %106, i32 0, i32 0
  %108 = getelementptr inbounds %struct.POSITION* %107, i32 0, i32 5
  %109 = getelementptr inbounds [64 x i8]* %108, i32 0, i64 %105
  %110 = load i8* %109, align 1
  %111 = sext i8 %110 to i32
  store i32 %111, i32* %cpiece, align 4
  %112 = load i64* %bit_move, align 8
  %113 = load i32* %piece, align 4
  %114 = sext i32 %113 to i64
  %115 = load i32* %4, align 4
  %116 = sext i32 %115 to i64
  %117 = load %struct.tree** %1, align 8
  %118 = getelementptr inbounds %struct.tree* %117, i32 0, i32 0
  %119 = getelementptr inbounds %struct.POSITION* %118, i32 0, i32 0
  %120 = getelementptr inbounds [2 x %struct.BB_PIECES]* %119, i32 0, i64 %116
  %121 = getelementptr inbounds %struct.BB_PIECES* %120, i32 0, i32 0
  %122 = getelementptr inbounds [7 x i64]* %121, i32 0, i64 %114
  %123 = load i64* %122, align 8
  %124 = xor i64 %112, %123
  %125 = load i32* %piece, align 4
  %126 = sext i32 %125 to i64
  %127 = load i32* %4, align 4
  %128 = sext i32 %127 to i64
  %129 = load %struct.tree** %1, align 8
  %130 = getelementptr inbounds %struct.tree* %129, i32 0, i32 0
  %131 = getelementptr inbounds %struct.POSITION* %130, i32 0, i32 0
  %132 = getelementptr inbounds [2 x %struct.BB_PIECES]* %131, i32 0, i64 %128
  %133 = getelementptr inbounds %struct.BB_PIECES* %132, i32 0, i32 0
  %134 = getelementptr inbounds [7 x i64]* %133, i32 0, i64 %126
  store i64 %124, i64* %134, align 8
  %135 = load i64* %bit_move, align 8
  %136 = load i32* %4, align 4
  %137 = sext i32 %136 to i64
  %138 = load %struct.tree** %1, align 8
  %139 = getelementptr inbounds %struct.tree* %138, i32 0, i32 0
  %140 = getelementptr inbounds %struct.POSITION* %139, i32 0, i32 0
  %141 = getelementptr inbounds [2 x %struct.BB_PIECES]* %140, i32 0, i64 %137
  %142 = getelementptr inbounds %struct.BB_PIECES* %141, i32 0, i32 0
  %143 = getelementptr inbounds [7 x i64]* %142, i32 0, i64 0
  %144 = load i64* %143, align 8
  %145 = xor i64 %135, %144
  %146 = load i32* %4, align 4
  %147 = sext i32 %146 to i64
  %148 = load %struct.tree** %1, align 8
  %149 = getelementptr inbounds %struct.tree* %148, i32 0, i32 0
  %150 = getelementptr inbounds %struct.POSITION* %149, i32 0, i32 0
  %151 = getelementptr inbounds [2 x %struct.BB_PIECES]* %150, i32 0, i64 %147
  %152 = getelementptr inbounds %struct.BB_PIECES* %151, i32 0, i32 0
  %153 = getelementptr inbounds [7 x i64]* %152, i32 0, i64 0
  store i64 %145, i64* %153, align 8
  %154 = load i32* %from, align 4
  %155 = sext i32 %154 to i64
  %156 = load i32* %piece, align 4
  %157 = sext i32 %156 to i64
  %158 = load i32* %4, align 4
  %159 = sext i32 %158 to i64
  %160 = getelementptr inbounds [2 x [7 x [64 x i64]]]* @randoms, i32 0, i64 %159
  %161 = getelementptr inbounds [7 x [64 x i64]]* %160, i32 0, i64 %157
  %162 = getelementptr inbounds [64 x i64]* %161, i32 0, i64 %155
  %163 = load i64* %162, align 8
  %164 = load %struct.tree** %1, align 8
  %165 = getelementptr inbounds %struct.tree* %164, i32 0, i32 0
  %166 = getelementptr inbounds %struct.POSITION* %165, i32 0, i32 1
  %167 = load i64* %166, align 8
  %168 = xor i64 %167, %163
  store i64 %168, i64* %166, align 8
  %169 = load i32* %to, align 4
  %170 = sext i32 %169 to i64
  %171 = load i32* %piece, align 4
  %172 = sext i32 %171 to i64
  %173 = load i32* %4, align 4
  %174 = sext i32 %173 to i64
  %175 = getelementptr inbounds [2 x [7 x [64 x i64]]]* @randoms, i32 0, i64 %174
  %176 = getelementptr inbounds [7 x [64 x i64]]* %175, i32 0, i64 %172
  %177 = getelementptr inbounds [64 x i64]* %176, i32 0, i64 %170
  %178 = load i64* %177, align 8
  %179 = load %struct.tree** %1, align 8
  %180 = getelementptr inbounds %struct.tree* %179, i32 0, i32 0
  %181 = getelementptr inbounds %struct.POSITION* %180, i32 0, i32 1
  %182 = load i64* %181, align 8
  %183 = xor i64 %182, %178
  store i64 %183, i64* %181, align 8
  %184 = load i32* %from, align 4
  %185 = sext i32 %184 to i64
  %186 = load %struct.tree** %1, align 8
  %187 = getelementptr inbounds %struct.tree* %186, i32 0, i32 0
  %188 = getelementptr inbounds %struct.POSITION* %187, i32 0, i32 5
  %189 = getelementptr inbounds [64 x i8]* %188, i32 0, i64 %185
  store i8 0, i8* %189, align 1
  %190 = load i32* %piece, align 4
  %191 = sext i32 %190 to i64
  %192 = load i32* %4, align 4
  %193 = sext i32 %192 to i64
  %194 = getelementptr inbounds [2 x [7 x i32]]* @pieces, i32 0, i64 %193
  %195 = getelementptr inbounds [7 x i32]* %194, i32 0, i64 %191
  %196 = load i32* %195, align 4
  %197 = trunc i32 %196 to i8
  %198 = load i32* %to, align 4
  %199 = sext i32 %198 to i64
  %200 = load %struct.tree** %1, align 8
  %201 = getelementptr inbounds %struct.tree* %200, i32 0, i32 0
  %202 = getelementptr inbounds %struct.POSITION* %201, i32 0, i32 5
  %203 = getelementptr inbounds [64 x i8]* %202, i32 0, i64 %199
  store i8 %197, i8* %203, align 1
  %204 = load i32* %piece, align 4
  switch i32 %204, label %979 [
    i32 1, label %205
    i32 2, label %636
    i32 3, label %637
    i32 4, label %638
    i32 5, label %747
    i32 6, label %748
  ]

; <label>:205                                     ; preds = %71
  %206 = load i32* %from, align 4
  %207 = sext i32 %206 to i64
  %208 = load i32* %4, align 4
  %209 = sext i32 %208 to i64
  %210 = getelementptr inbounds [2 x [7 x [64 x i64]]]* @randoms, i32 0, i64 %209
  %211 = getelementptr inbounds [7 x [64 x i64]]* %210, i32 0, i64 1
  %212 = getelementptr inbounds [64 x i64]* %211, i32 0, i64 %207
  %213 = load i64* %212, align 8
  %214 = load %struct.tree** %1, align 8
  %215 = getelementptr inbounds %struct.tree* %214, i32 0, i32 0
  %216 = getelementptr inbounds %struct.POSITION* %215, i32 0, i32 2
  %217 = load i64* %216, align 8
  %218 = xor i64 %217, %213
  store i64 %218, i64* %216, align 8
  %219 = load i32* %to, align 4
  %220 = sext i32 %219 to i64
  %221 = load i32* %4, align 4
  %222 = sext i32 %221 to i64
  %223 = getelementptr inbounds [2 x [7 x [64 x i64]]]* @randoms, i32 0, i64 %222
  %224 = getelementptr inbounds [7 x [64 x i64]]* %223, i32 0, i64 1
  %225 = getelementptr inbounds [64 x i64]* %224, i32 0, i64 %220
  %226 = load i64* %225, align 8
  %227 = load %struct.tree** %1, align 8
  %228 = getelementptr inbounds %struct.tree* %227, i32 0, i32 0
  %229 = getelementptr inbounds %struct.POSITION* %228, i32 0, i32 2
  %230 = load i64* %229, align 8
  %231 = xor i64 %230, %226
  store i64 %231, i64* %229, align 8
  %232 = load i32* %2, align 4
  %233 = add nsw i32 %232, 1
  %234 = sext i32 %233 to i64
  %235 = load %struct.tree** %1, align 8
  %236 = getelementptr inbounds %struct.tree* %235, i32 0, i32 8
  %237 = getelementptr inbounds [67 x %struct.SEARCH_POSITION]* %236, i32 0, i64 %234
  %238 = getelementptr inbounds %struct.SEARCH_POSITION* %237, i32 0, i32 2
  store i8 0, i8* %238, align 1
  %239 = load i32* %captured, align 4
  %240 = icmp eq i32 %239, 1
  br i1 %240, label %241, label %369

; <label>:241                                     ; preds = %205
  %242 = load i32* %cpiece, align 4
  %243 = icmp ne i32 %242, 0
  br i1 %243, label %369, label %244

; <label>:244                                     ; preds = %241
  %245 = load i32* %to, align 4
  %246 = load i32* %4, align 4
  %247 = sext i32 %246 to i64
  %248 = getelementptr inbounds [2 x i32]* @epsq, i32 0, i64 %247
  %249 = load i32* %248, align 4
  %250 = add nsw i32 %245, %249
  %251 = sext i32 %250 to i64
  %252 = getelementptr inbounds [65 x i64]* @clear_mask, i32 0, i64 %251
  %253 = load i64* %252, align 8
  %254 = load i32* %btm, align 4
  %255 = sext i32 %254 to i64
  %256 = load %struct.tree** %1, align 8
  %257 = getelementptr inbounds %struct.tree* %256, i32 0, i32 0
  %258 = getelementptr inbounds %struct.POSITION* %257, i32 0, i32 0
  %259 = getelementptr inbounds [2 x %struct.BB_PIECES]* %258, i32 0, i64 %255
  %260 = getelementptr inbounds %struct.BB_PIECES* %259, i32 0, i32 0
  %261 = getelementptr inbounds [7 x i64]* %260, i32 0, i64 1
  %262 = load i64* %261, align 8
  %263 = and i64 %253, %262
  %264 = load i32* %btm, align 4
  %265 = sext i32 %264 to i64
  %266 = load %struct.tree** %1, align 8
  %267 = getelementptr inbounds %struct.tree* %266, i32 0, i32 0
  %268 = getelementptr inbounds %struct.POSITION* %267, i32 0, i32 0
  %269 = getelementptr inbounds [2 x %struct.BB_PIECES]* %268, i32 0, i64 %265
  %270 = getelementptr inbounds %struct.BB_PIECES* %269, i32 0, i32 0
  %271 = getelementptr inbounds [7 x i64]* %270, i32 0, i64 1
  store i64 %263, i64* %271, align 8
  %272 = load i32* %to, align 4
  %273 = load i32* %4, align 4
  %274 = sext i32 %273 to i64
  %275 = getelementptr inbounds [2 x i32]* @epsq, i32 0, i64 %274
  %276 = load i32* %275, align 4
  %277 = add nsw i32 %272, %276
  %278 = sext i32 %277 to i64
  %279 = getelementptr inbounds [65 x i64]* @clear_mask, i32 0, i64 %278
  %280 = load i64* %279, align 8
  %281 = load i32* %btm, align 4
  %282 = sext i32 %281 to i64
  %283 = load %struct.tree** %1, align 8
  %284 = getelementptr inbounds %struct.tree* %283, i32 0, i32 0
  %285 = getelementptr inbounds %struct.POSITION* %284, i32 0, i32 0
  %286 = getelementptr inbounds [2 x %struct.BB_PIECES]* %285, i32 0, i64 %282
  %287 = getelementptr inbounds %struct.BB_PIECES* %286, i32 0, i32 0
  %288 = getelementptr inbounds [7 x i64]* %287, i32 0, i64 0
  %289 = load i64* %288, align 8
  %290 = and i64 %280, %289
  %291 = load i32* %btm, align 4
  %292 = sext i32 %291 to i64
  %293 = load %struct.tree** %1, align 8
  %294 = getelementptr inbounds %struct.tree* %293, i32 0, i32 0
  %295 = getelementptr inbounds %struct.POSITION* %294, i32 0, i32 0
  %296 = getelementptr inbounds [2 x %struct.BB_PIECES]* %295, i32 0, i64 %292
  %297 = getelementptr inbounds %struct.BB_PIECES* %296, i32 0, i32 0
  %298 = getelementptr inbounds [7 x i64]* %297, i32 0, i64 0
  store i64 %290, i64* %298, align 8
  %299 = load i32* %to, align 4
  %300 = load i32* %4, align 4
  %301 = sext i32 %300 to i64
  %302 = getelementptr inbounds [2 x i32]* @epsq, i32 0, i64 %301
  %303 = load i32* %302, align 4
  %304 = add nsw i32 %299, %303
  %305 = sext i32 %304 to i64
  %306 = load i32* %btm, align 4
  %307 = sext i32 %306 to i64
  %308 = getelementptr inbounds [2 x [7 x [64 x i64]]]* @randoms, i32 0, i64 %307
  %309 = getelementptr inbounds [7 x [64 x i64]]* %308, i32 0, i64 1
  %310 = getelementptr inbounds [64 x i64]* %309, i32 0, i64 %305
  %311 = load i64* %310, align 8
  %312 = load %struct.tree** %1, align 8
  %313 = getelementptr inbounds %struct.tree* %312, i32 0, i32 0
  %314 = getelementptr inbounds %struct.POSITION* %313, i32 0, i32 1
  %315 = load i64* %314, align 8
  %316 = xor i64 %315, %311
  store i64 %316, i64* %314, align 8
  %317 = load i32* %to, align 4
  %318 = load i32* %4, align 4
  %319 = sext i32 %318 to i64
  %320 = getelementptr inbounds [2 x i32]* @epsq, i32 0, i64 %319
  %321 = load i32* %320, align 4
  %322 = add nsw i32 %317, %321
  %323 = sext i32 %322 to i64
  %324 = load i32* %btm, align 4
  %325 = sext i32 %324 to i64
  %326 = getelementptr inbounds [2 x [7 x [64 x i64]]]* @randoms, i32 0, i64 %325
  %327 = getelementptr inbounds [7 x [64 x i64]]* %326, i32 0, i64 1
  %328 = getelementptr inbounds [64 x i64]* %327, i32 0, i64 %323
  %329 = load i64* %328, align 8
  %330 = load %struct.tree** %1, align 8
  %331 = getelementptr inbounds %struct.tree* %330, i32 0, i32 0
  %332 = getelementptr inbounds %struct.POSITION* %331, i32 0, i32 2
  %333 = load i64* %332, align 8
  %334 = xor i64 %333, %329
  store i64 %334, i64* %332, align 8
  %335 = load i32* %to, align 4
  %336 = load i32* %4, align 4
  %337 = sext i32 %336 to i64
  %338 = getelementptr inbounds [2 x i32]* @epsq, i32 0, i64 %337
  %339 = load i32* %338, align 4
  %340 = add nsw i32 %335, %339
  %341 = sext i32 %340 to i64
  %342 = load %struct.tree** %1, align 8
  %343 = getelementptr inbounds %struct.tree* %342, i32 0, i32 0
  %344 = getelementptr inbounds %struct.POSITION* %343, i32 0, i32 5
  %345 = getelementptr inbounds [64 x i8]* %344, i32 0, i64 %341
  store i8 0, i8* %345, align 1
  %346 = load i32* %btm, align 4
  %347 = sext i32 %346 to i64
  %348 = getelementptr inbounds [2 x i32]* getelementptr inbounds ([7 x [2 x i32]]* @piece_values, i32 0, i64 1), i32 0, i64 %347
  %349 = load i32* %348, align 4
  %350 = load %struct.tree** %1, align 8
  %351 = getelementptr inbounds %struct.tree* %350, i32 0, i32 0
  %352 = getelementptr inbounds %struct.POSITION* %351, i32 0, i32 3
  %353 = load i32* %352, align 4
  %354 = sub nsw i32 %353, %349
  store i32 %354, i32* %352, align 4
  %355 = load i32* %btm, align 4
  %356 = sext i32 %355 to i64
  %357 = load %struct.tree** %1, align 8
  %358 = getelementptr inbounds %struct.tree* %357, i32 0, i32 0
  %359 = getelementptr inbounds %struct.POSITION* %358, i32 0, i32 6
  %360 = getelementptr inbounds [2 x [7 x i8]]* %359, i32 0, i64 %356
  %361 = getelementptr inbounds [7 x i8]* %360, i32 0, i64 1
  %362 = load i8* %361, align 1
  %363 = add i8 %362, -1
  store i8 %363, i8* %361, align 1
  %364 = load %struct.tree** %1, align 8
  %365 = getelementptr inbounds %struct.tree* %364, i32 0, i32 0
  %366 = getelementptr inbounds %struct.POSITION* %365, i32 0, i32 9
  %367 = load i8* %366, align 1
  %368 = add i8 %367, -1
  store i8 %368, i8* %366, align 1
  store i32 0, i32* %captured, align 4
  br label %369

; <label>:369                                     ; preds = %244, %241, %205
  %370 = load i32* %promote, align 4
  %371 = icmp ne i32 %370, 0
  br i1 %371, label %372, label %572

; <label>:372                                     ; preds = %369
  %373 = load i32* %4, align 4
  %374 = sext i32 %373 to i64
  %375 = load %struct.tree** %1, align 8
  %376 = getelementptr inbounds %struct.tree* %375, i32 0, i32 0
  %377 = getelementptr inbounds %struct.POSITION* %376, i32 0, i32 6
  %378 = getelementptr inbounds [2 x [7 x i8]]* %377, i32 0, i64 %374
  %379 = getelementptr inbounds [7 x i8]* %378, i32 0, i64 1
  %380 = load i8* %379, align 1
  %381 = add i8 %380, -1
  store i8 %381, i8* %379, align 1
  %382 = load i32* %4, align 4
  %383 = sext i32 %382 to i64
  %384 = getelementptr inbounds [2 x i32]* getelementptr inbounds ([7 x [2 x i32]]* @piece_values, i32 0, i64 1), i32 0, i64 %383
  %385 = load i32* %384, align 4
  %386 = load %struct.tree** %1, align 8
  %387 = getelementptr inbounds %struct.tree* %386, i32 0, i32 0
  %388 = getelementptr inbounds %struct.POSITION* %387, i32 0, i32 3
  %389 = load i32* %388, align 4
  %390 = sub nsw i32 %389, %385
  store i32 %390, i32* %388, align 4
  %391 = load i32* %to, align 4
  %392 = sext i32 %391 to i64
  %393 = getelementptr inbounds [65 x i64]* @clear_mask, i32 0, i64 %392
  %394 = load i64* %393, align 8
  %395 = load i32* %4, align 4
  %396 = sext i32 %395 to i64
  %397 = load %struct.tree** %1, align 8
  %398 = getelementptr inbounds %struct.tree* %397, i32 0, i32 0
  %399 = getelementptr inbounds %struct.POSITION* %398, i32 0, i32 0
  %400 = getelementptr inbounds [2 x %struct.BB_PIECES]* %399, i32 0, i64 %396
  %401 = getelementptr inbounds %struct.BB_PIECES* %400, i32 0, i32 0
  %402 = getelementptr inbounds [7 x i64]* %401, i32 0, i64 1
  %403 = load i64* %402, align 8
  %404 = and i64 %394, %403
  %405 = load i32* %4, align 4
  %406 = sext i32 %405 to i64
  %407 = load %struct.tree** %1, align 8
  %408 = getelementptr inbounds %struct.tree* %407, i32 0, i32 0
  %409 = getelementptr inbounds %struct.POSITION* %408, i32 0, i32 0
  %410 = getelementptr inbounds [2 x %struct.BB_PIECES]* %409, i32 0, i64 %406
  %411 = getelementptr inbounds %struct.BB_PIECES* %410, i32 0, i32 0
  %412 = getelementptr inbounds [7 x i64]* %411, i32 0, i64 1
  store i64 %404, i64* %412, align 8
  %413 = load i32* %to, align 4
  %414 = sext i32 %413 to i64
  %415 = load i32* %4, align 4
  %416 = sext i32 %415 to i64
  %417 = getelementptr inbounds [2 x [7 x [64 x i64]]]* @randoms, i32 0, i64 %416
  %418 = getelementptr inbounds [7 x [64 x i64]]* %417, i32 0, i64 1
  %419 = getelementptr inbounds [64 x i64]* %418, i32 0, i64 %414
  %420 = load i64* %419, align 8
  %421 = load %struct.tree** %1, align 8
  %422 = getelementptr inbounds %struct.tree* %421, i32 0, i32 0
  %423 = getelementptr inbounds %struct.POSITION* %422, i32 0, i32 1
  %424 = load i64* %423, align 8
  %425 = xor i64 %424, %420
  store i64 %425, i64* %423, align 8
  %426 = load i32* %to, align 4
  %427 = sext i32 %426 to i64
  %428 = load i32* %4, align 4
  %429 = sext i32 %428 to i64
  %430 = getelementptr inbounds [2 x [7 x [64 x i64]]]* @randoms, i32 0, i64 %429
  %431 = getelementptr inbounds [7 x [64 x i64]]* %430, i32 0, i64 1
  %432 = getelementptr inbounds [64 x i64]* %431, i32 0, i64 %427
  %433 = load i64* %432, align 8
  %434 = load %struct.tree** %1, align 8
  %435 = getelementptr inbounds %struct.tree* %434, i32 0, i32 0
  %436 = getelementptr inbounds %struct.POSITION* %435, i32 0, i32 2
  %437 = load i64* %436, align 8
  %438 = xor i64 %437, %433
  store i64 %438, i64* %436, align 8
  %439 = load i32* %to, align 4
  %440 = sext i32 %439 to i64
  %441 = load i32* %promote, align 4
  %442 = sext i32 %441 to i64
  %443 = load i32* %4, align 4
  %444 = sext i32 %443 to i64
  %445 = getelementptr inbounds [2 x [7 x [64 x i64]]]* @randoms, i32 0, i64 %444
  %446 = getelementptr inbounds [7 x [64 x i64]]* %445, i32 0, i64 %442
  %447 = getelementptr inbounds [64 x i64]* %446, i32 0, i64 %440
  %448 = load i64* %447, align 8
  %449 = load %struct.tree** %1, align 8
  %450 = getelementptr inbounds %struct.tree* %449, i32 0, i32 0
  %451 = getelementptr inbounds %struct.POSITION* %450, i32 0, i32 1
  %452 = load i64* %451, align 8
  %453 = xor i64 %452, %448
  store i64 %453, i64* %451, align 8
  %454 = load i32* %promote, align 4
  %455 = sext i32 %454 to i64
  %456 = load i32* %4, align 4
  %457 = sext i32 %456 to i64
  %458 = getelementptr inbounds [2 x [7 x i32]]* @pieces, i32 0, i64 %457
  %459 = getelementptr inbounds [7 x i32]* %458, i32 0, i64 %455
  %460 = load i32* %459, align 4
  %461 = trunc i32 %460 to i8
  %462 = load i32* %to, align 4
  %463 = sext i32 %462 to i64
  %464 = load %struct.tree** %1, align 8
  %465 = getelementptr inbounds %struct.tree* %464, i32 0, i32 0
  %466 = getelementptr inbounds %struct.POSITION* %465, i32 0, i32 5
  %467 = getelementptr inbounds [64 x i8]* %466, i32 0, i64 %463
  store i8 %461, i8* %467, align 1
  %468 = load i32* %promote, align 4
  %469 = sext i32 %468 to i64
  %470 = getelementptr inbounds [7 x i32]* @p_vals, i32 0, i64 %469
  %471 = load i32* %470, align 4
  %472 = load i32* %4, align 4
  %473 = sext i32 %472 to i64
  %474 = load %struct.tree** %1, align 8
  %475 = getelementptr inbounds %struct.tree* %474, i32 0, i32 0
  %476 = getelementptr inbounds %struct.POSITION* %475, i32 0, i32 6
  %477 = getelementptr inbounds [2 x [7 x i8]]* %476, i32 0, i64 %473
  %478 = getelementptr inbounds [7 x i8]* %477, i32 0, i64 0
  %479 = load i8* %478, align 1
  %480 = sext i8 %479 to i32
  %481 = add nsw i32 %480, %471
  %482 = trunc i32 %481 to i8
  store i8 %482, i8* %478, align 1
  %483 = load i32* %promote, align 4
  %484 = sext i32 %483 to i64
  %485 = load i32* %4, align 4
  %486 = sext i32 %485 to i64
  %487 = load %struct.tree** %1, align 8
  %488 = getelementptr inbounds %struct.tree* %487, i32 0, i32 0
  %489 = getelementptr inbounds %struct.POSITION* %488, i32 0, i32 6
  %490 = getelementptr inbounds [2 x [7 x i8]]* %489, i32 0, i64 %486
  %491 = getelementptr inbounds [7 x i8]* %490, i32 0, i64 %484
  %492 = load i8* %491, align 1
  %493 = add i8 %492, 1
  store i8 %493, i8* %491, align 1
  %494 = load i32* %4, align 4
  %495 = sext i32 %494 to i64
  %496 = load i32* %promote, align 4
  %497 = sext i32 %496 to i64
  %498 = getelementptr inbounds [7 x [2 x i32]]* @piece_values, i32 0, i64 %497
  %499 = getelementptr inbounds [2 x i32]* %498, i32 0, i64 %495
  %500 = load i32* %499, align 4
  %501 = load %struct.tree** %1, align 8
  %502 = getelementptr inbounds %struct.tree* %501, i32 0, i32 0
  %503 = getelementptr inbounds %struct.POSITION* %502, i32 0, i32 3
  %504 = load i32* %503, align 4
  %505 = add nsw i32 %504, %500
  store i32 %505, i32* %503, align 4
  %506 = load i32* %to, align 4
  %507 = sext i32 %506 to i64
  %508 = getelementptr inbounds [65 x i64]* @set_mask, i32 0, i64 %507
  %509 = load i64* %508, align 8
  %510 = load i32* %promote, align 4
  %511 = sext i32 %510 to i64
  %512 = load i32* %4, align 4
  %513 = sext i32 %512 to i64
  %514 = load %struct.tree** %1, align 8
  %515 = getelementptr inbounds %struct.tree* %514, i32 0, i32 0
  %516 = getelementptr inbounds %struct.POSITION* %515, i32 0, i32 0
  %517 = getelementptr inbounds [2 x %struct.BB_PIECES]* %516, i32 0, i64 %513
  %518 = getelementptr inbounds %struct.BB_PIECES* %517, i32 0, i32 0
  %519 = getelementptr inbounds [7 x i64]* %518, i32 0, i64 %511
  %520 = load i64* %519, align 8
  %521 = or i64 %509, %520
  %522 = load i32* %promote, align 4
  %523 = sext i32 %522 to i64
  %524 = load i32* %4, align 4
  %525 = sext i32 %524 to i64
  %526 = load %struct.tree** %1, align 8
  %527 = getelementptr inbounds %struct.tree* %526, i32 0, i32 0
  %528 = getelementptr inbounds %struct.POSITION* %527, i32 0, i32 0
  %529 = getelementptr inbounds [2 x %struct.BB_PIECES]* %528, i32 0, i64 %525
  %530 = getelementptr inbounds %struct.BB_PIECES* %529, i32 0, i32 0
  %531 = getelementptr inbounds [7 x i64]* %530, i32 0, i64 %523
  store i64 %521, i64* %531, align 8
  %532 = load i32* %promote, align 4
  switch i32 %532, label %571 [
    i32 2, label %533
    i32 3, label %542
    i32 4, label %551
    i32 5, label %560
  ]

; <label>:533                                     ; preds = %372
  %534 = load i32* %4, align 4
  %535 = sext i32 %534 to i64
  %536 = load %struct.tree** %1, align 8
  %537 = getelementptr inbounds %struct.tree* %536, i32 0, i32 0
  %538 = getelementptr inbounds %struct.POSITION* %537, i32 0, i32 8
  %539 = getelementptr inbounds [2 x i8]* %538, i32 0, i64 %535
  %540 = load i8* %539, align 1
  %541 = add i8 %540, 1
  store i8 %541, i8* %539, align 1
  br label %571

; <label>:542                                     ; preds = %372
  %543 = load i32* %4, align 4
  %544 = sext i32 %543 to i64
  %545 = load %struct.tree** %1, align 8
  %546 = getelementptr inbounds %struct.tree* %545, i32 0, i32 0
  %547 = getelementptr inbounds %struct.POSITION* %546, i32 0, i32 8
  %548 = getelementptr inbounds [2 x i8]* %547, i32 0, i64 %544
  %549 = load i8* %548, align 1
  %550 = add i8 %549, 1
  store i8 %550, i8* %548, align 1
  br label %571

; <label>:551                                     ; preds = %372
  %552 = load i32* %4, align 4
  %553 = sext i32 %552 to i64
  %554 = load %struct.tree** %1, align 8
  %555 = getelementptr inbounds %struct.tree* %554, i32 0, i32 0
  %556 = getelementptr inbounds %struct.POSITION* %555, i32 0, i32 7
  %557 = getelementptr inbounds [2 x i8]* %556, i32 0, i64 %553
  %558 = load i8* %557, align 1
  %559 = add i8 %558, 1
  store i8 %559, i8* %557, align 1
  br label %571

; <label>:560                                     ; preds = %372
  %561 = load i32* %4, align 4
  %562 = sext i32 %561 to i64
  %563 = load %struct.tree** %1, align 8
  %564 = getelementptr inbounds %struct.tree* %563, i32 0, i32 0
  %565 = getelementptr inbounds %struct.POSITION* %564, i32 0, i32 7
  %566 = getelementptr inbounds [2 x i8]* %565, i32 0, i64 %562
  %567 = load i8* %566, align 1
  %568 = sext i8 %567 to i32
  %569 = add nsw i32 %568, 2
  %570 = trunc i32 %569 to i8
  store i8 %570, i8* %566, align 1
  br label %571

; <label>:571                                     ; preds = %372, %560, %551, %542, %533
  br label %635

; <label>:572                                     ; preds = %369
  %573 = load i32* %to, align 4
  %574 = load i32* %from, align 4
  %575 = sub nsw i32 %573, %574
  %576 = icmp sgt i32 %575, 0
  br i1 %576, label %577, label %581

; <label>:577                                     ; preds = %572
  %578 = load i32* %to, align 4
  %579 = load i32* %from, align 4
  %580 = sub nsw i32 %578, %579
  br label %586

; <label>:581                                     ; preds = %572
  %582 = load i32* %to, align 4
  %583 = load i32* %from, align 4
  %584 = sub nsw i32 %582, %583
  %585 = sub nsw i32 0, %584
  br label %586

; <label>:586                                     ; preds = %581, %577
  %587 = phi i32 [ %580, %577 ], [ %585, %581 ]
  %588 = icmp eq i32 %587, 16
  br i1 %588, label %589, label %634

; <label>:589                                     ; preds = %586
  %590 = load i32* %to, align 4
  %591 = sext i32 %590 to i64
  %592 = getelementptr inbounds [64 x i64]* @mask_eptest, i32 0, i64 %591
  %593 = load i64* %592, align 8
  %594 = load i32* %btm, align 4
  %595 = sext i32 %594 to i64
  %596 = load %struct.tree** %1, align 8
  %597 = getelementptr inbounds %struct.tree* %596, i32 0, i32 0
  %598 = getelementptr inbounds %struct.POSITION* %597, i32 0, i32 0
  %599 = getelementptr inbounds [2 x %struct.BB_PIECES]* %598, i32 0, i64 %595
  %600 = getelementptr inbounds %struct.BB_PIECES* %599, i32 0, i32 0
  %601 = getelementptr inbounds [7 x i64]* %600, i32 0, i64 1
  %602 = load i64* %601, align 8
  %603 = and i64 %593, %602
  %604 = icmp ne i64 %603, 0
  br i1 %604, label %605, label %634

; <label>:605                                     ; preds = %589
  %606 = load i32* %to, align 4
  %607 = load i32* %4, align 4
  %608 = sext i32 %607 to i64
  %609 = getelementptr inbounds [2 x i32]* @epsq, i32 0, i64 %608
  %610 = load i32* %609, align 4
  %611 = add nsw i32 %606, %610
  %612 = trunc i32 %611 to i8
  %613 = load i32* %2, align 4
  %614 = add nsw i32 %613, 1
  %615 = sext i32 %614 to i64
  %616 = load %struct.tree** %1, align 8
  %617 = getelementptr inbounds %struct.tree* %616, i32 0, i32 8
  %618 = getelementptr inbounds [67 x %struct.SEARCH_POSITION]* %617, i32 0, i64 %615
  %619 = getelementptr inbounds %struct.SEARCH_POSITION* %618, i32 0, i32 0
  store i8 %612, i8* %619, align 1
  %620 = load i32* %to, align 4
  %621 = load i32* %4, align 4
  %622 = sext i32 %621 to i64
  %623 = getelementptr inbounds [2 x i32]* @epsq, i32 0, i64 %622
  %624 = load i32* %623, align 4
  %625 = add nsw i32 %620, %624
  %626 = sext i32 %625 to i64
  %627 = getelementptr inbounds [65 x i64]* @enpassant_random, i32 0, i64 %626
  %628 = load i64* %627, align 8
  %629 = load %struct.tree** %1, align 8
  %630 = getelementptr inbounds %struct.tree* %629, i32 0, i32 0
  %631 = getelementptr inbounds %struct.POSITION* %630, i32 0, i32 1
  %632 = load i64* %631, align 8
  %633 = xor i64 %632, %628
  store i64 %633, i64* %631, align 8
  br label %634

; <label>:634                                     ; preds = %605, %589, %586
  br label %635

; <label>:635                                     ; preds = %634, %571
  br label %979

; <label>:636                                     ; preds = %71
  br label %979

; <label>:637                                     ; preds = %71
  br label %979

; <label>:638                                     ; preds = %71
  %639 = load i32* %4, align 4
  %640 = sext i32 %639 to i64
  %641 = load i32* %2, align 4
  %642 = add nsw i32 %641, 1
  %643 = sext i32 %642 to i64
  %644 = load %struct.tree** %1, align 8
  %645 = getelementptr inbounds %struct.tree* %644, i32 0, i32 8
  %646 = getelementptr inbounds [67 x %struct.SEARCH_POSITION]* %645, i32 0, i64 %643
  %647 = getelementptr inbounds %struct.SEARCH_POSITION* %646, i32 0, i32 1
  %648 = getelementptr inbounds [2 x i8]* %647, i32 0, i64 %640
  %649 = load i8* %648, align 1
  %650 = sext i8 %649 to i32
  %651 = icmp sgt i32 %650, 0
  br i1 %651, label %652, label %746

; <label>:652                                     ; preds = %638
  %653 = load i32* %from, align 4
  %654 = load i32* %4, align 4
  %655 = sext i32 %654 to i64
  %656 = getelementptr inbounds [2 x i32]* @rook_A, i32 0, i64 %655
  %657 = load i32* %656, align 4
  %658 = icmp eq i32 %653, %657
  br i1 %658, label %659, label %698

; <label>:659                                     ; preds = %652
  %660 = load i32* %4, align 4
  %661 = sext i32 %660 to i64
  %662 = load i32* %2, align 4
  %663 = add nsw i32 %662, 1
  %664 = sext i32 %663 to i64
  %665 = load %struct.tree** %1, align 8
  %666 = getelementptr inbounds %struct.tree* %665, i32 0, i32 8
  %667 = getelementptr inbounds [67 x %struct.SEARCH_POSITION]* %666, i32 0, i64 %664
  %668 = getelementptr inbounds %struct.SEARCH_POSITION* %667, i32 0, i32 1
  %669 = getelementptr inbounds [2 x i8]* %668, i32 0, i64 %661
  %670 = load i8* %669, align 1
  %671 = sext i8 %670 to i32
  %672 = and i32 %671, 2
  %673 = icmp ne i32 %672, 0
  br i1 %673, label %674, label %698

; <label>:674                                     ; preds = %659
  %675 = load i32* %4, align 4
  %676 = sext i32 %675 to i64
  %677 = load i32* %2, align 4
  %678 = add nsw i32 %677, 1
  %679 = sext i32 %678 to i64
  %680 = load %struct.tree** %1, align 8
  %681 = getelementptr inbounds %struct.tree* %680, i32 0, i32 8
  %682 = getelementptr inbounds [67 x %struct.SEARCH_POSITION]* %681, i32 0, i64 %679
  %683 = getelementptr inbounds %struct.SEARCH_POSITION* %682, i32 0, i32 1
  %684 = getelementptr inbounds [2 x i8]* %683, i32 0, i64 %676
  %685 = load i8* %684, align 1
  %686 = sext i8 %685 to i32
  %687 = and i32 %686, 1
  %688 = trunc i32 %687 to i8
  store i8 %688, i8* %684, align 1
  %689 = load i32* %4, align 4
  %690 = sext i32 %689 to i64
  %691 = getelementptr inbounds [2 x i64]* getelementptr inbounds ([2 x [2 x i64]]* @castle_random, i32 0, i64 1), i32 0, i64 %690
  %692 = load i64* %691, align 8
  %693 = load %struct.tree** %1, align 8
  %694 = getelementptr inbounds %struct.tree* %693, i32 0, i32 0
  %695 = getelementptr inbounds %struct.POSITION* %694, i32 0, i32 1
  %696 = load i64* %695, align 8
  %697 = xor i64 %696, %692
  store i64 %697, i64* %695, align 8
  br label %745

; <label>:698                                     ; preds = %659, %652
  %699 = load i32* %from, align 4
  %700 = load i32* %4, align 4
  %701 = sext i32 %700 to i64
  %702 = getelementptr inbounds [2 x i32]* @rook_H, i32 0, i64 %701
  %703 = load i32* %702, align 4
  %704 = icmp eq i32 %699, %703
  br i1 %704, label %705, label %744

; <label>:705                                     ; preds = %698
  %706 = load i32* %4, align 4
  %707 = sext i32 %706 to i64
  %708 = load i32* %2, align 4
  %709 = add nsw i32 %708, 1
  %710 = sext i32 %709 to i64
  %711 = load %struct.tree** %1, align 8
  %712 = getelementptr inbounds %struct.tree* %711, i32 0, i32 8
  %713 = getelementptr inbounds [67 x %struct.SEARCH_POSITION]* %712, i32 0, i64 %710
  %714 = getelementptr inbounds %struct.SEARCH_POSITION* %713, i32 0, i32 1
  %715 = getelementptr inbounds [2 x i8]* %714, i32 0, i64 %707
  %716 = load i8* %715, align 1
  %717 = sext i8 %716 to i32
  %718 = and i32 %717, 1
  %719 = icmp ne i32 %718, 0
  br i1 %719, label %720, label %744

; <label>:720                                     ; preds = %705
  %721 = load i32* %4, align 4
  %722 = sext i32 %721 to i64
  %723 = load i32* %2, align 4
  %724 = add nsw i32 %723, 1
  %725 = sext i32 %724 to i64
  %726 = load %struct.tree** %1, align 8
  %727 = getelementptr inbounds %struct.tree* %726, i32 0, i32 8
  %728 = getelementptr inbounds [67 x %struct.SEARCH_POSITION]* %727, i32 0, i64 %725
  %729 = getelementptr inbounds %struct.SEARCH_POSITION* %728, i32 0, i32 1
  %730 = getelementptr inbounds [2 x i8]* %729, i32 0, i64 %722
  %731 = load i8* %730, align 1
  %732 = sext i8 %731 to i32
  %733 = and i32 %732, 2
  %734 = trunc i32 %733 to i8
  store i8 %734, i8* %730, align 1
  %735 = load i32* %4, align 4
  %736 = sext i32 %735 to i64
  %737 = getelementptr inbounds [2 x i64]* getelementptr inbounds ([2 x [2 x i64]]* @castle_random, i32 0, i64 0), i32 0, i64 %736
  %738 = load i64* %737, align 8
  %739 = load %struct.tree** %1, align 8
  %740 = getelementptr inbounds %struct.tree* %739, i32 0, i32 0
  %741 = getelementptr inbounds %struct.POSITION* %740, i32 0, i32 1
  %742 = load i64* %741, align 8
  %743 = xor i64 %742, %738
  store i64 %743, i64* %741, align 8
  br label %744

; <label>:744                                     ; preds = %720, %705, %698
  br label %745

; <label>:745                                     ; preds = %744, %674
  br label %746

; <label>:746                                     ; preds = %745, %638
  br label %979

; <label>:747                                     ; preds = %71
  br label %979

; <label>:748                                     ; preds = %71
  %749 = load i32* %to, align 4
  %750 = load i32* %4, align 4
  %751 = sext i32 %750 to i64
  %752 = load %struct.tree** %1, align 8
  %753 = getelementptr inbounds %struct.tree* %752, i32 0, i32 0
  %754 = getelementptr inbounds %struct.POSITION* %753, i32 0, i32 4
  %755 = getelementptr inbounds [2 x i32]* %754, i32 0, i64 %751
  store i32 %749, i32* %755, align 4
  %756 = load i32* %4, align 4
  %757 = sext i32 %756 to i64
  %758 = load i32* %2, align 4
  %759 = add nsw i32 %758, 1
  %760 = sext i32 %759 to i64
  %761 = load %struct.tree** %1, align 8
  %762 = getelementptr inbounds %struct.tree* %761, i32 0, i32 8
  %763 = getelementptr inbounds [67 x %struct.SEARCH_POSITION]* %762, i32 0, i64 %760
  %764 = getelementptr inbounds %struct.SEARCH_POSITION* %763, i32 0, i32 1
  %765 = getelementptr inbounds [2 x i8]* %764, i32 0, i64 %757
  %766 = load i8* %765, align 1
  %767 = sext i8 %766 to i32
  %768 = icmp sgt i32 %767, 0
  br i1 %768, label %769, label %978

; <label>:769                                     ; preds = %748
  %770 = load i32* %4, align 4
  %771 = sext i32 %770 to i64
  %772 = load i32* %2, align 4
  %773 = add nsw i32 %772, 1
  %774 = sext i32 %773 to i64
  %775 = load %struct.tree** %1, align 8
  %776 = getelementptr inbounds %struct.tree* %775, i32 0, i32 8
  %777 = getelementptr inbounds [67 x %struct.SEARCH_POSITION]* %776, i32 0, i64 %774
  %778 = getelementptr inbounds %struct.SEARCH_POSITION* %777, i32 0, i32 1
  %779 = getelementptr inbounds [2 x i8]* %778, i32 0, i64 %771
  %780 = load i8* %779, align 1
  %781 = sext i8 %780 to i32
  %782 = and i32 %781, 2
  %783 = icmp ne i32 %782, 0
  br i1 %783, label %784, label %794

; <label>:784                                     ; preds = %769
  %785 = load i32* %4, align 4
  %786 = sext i32 %785 to i64
  %787 = getelementptr inbounds [2 x i64]* getelementptr inbounds ([2 x [2 x i64]]* @castle_random, i32 0, i64 1), i32 0, i64 %786
  %788 = load i64* %787, align 8
  %789 = load %struct.tree** %1, align 8
  %790 = getelementptr inbounds %struct.tree* %789, i32 0, i32 0
  %791 = getelementptr inbounds %struct.POSITION* %790, i32 0, i32 1
  %792 = load i64* %791, align 8
  %793 = xor i64 %792, %788
  store i64 %793, i64* %791, align 8
  br label %794

; <label>:794                                     ; preds = %784, %769
  %795 = load i32* %4, align 4
  %796 = sext i32 %795 to i64
  %797 = load i32* %2, align 4
  %798 = add nsw i32 %797, 1
  %799 = sext i32 %798 to i64
  %800 = load %struct.tree** %1, align 8
  %801 = getelementptr inbounds %struct.tree* %800, i32 0, i32 8
  %802 = getelementptr inbounds [67 x %struct.SEARCH_POSITION]* %801, i32 0, i64 %799
  %803 = getelementptr inbounds %struct.SEARCH_POSITION* %802, i32 0, i32 1
  %804 = getelementptr inbounds [2 x i8]* %803, i32 0, i64 %796
  %805 = load i8* %804, align 1
  %806 = sext i8 %805 to i32
  %807 = and i32 %806, 1
  %808 = icmp ne i32 %807, 0
  br i1 %808, label %809, label %819

; <label>:809                                     ; preds = %794
  %810 = load i32* %4, align 4
  %811 = sext i32 %810 to i64
  %812 = getelementptr inbounds [2 x i64]* getelementptr inbounds ([2 x [2 x i64]]* @castle_random, i32 0, i64 0), i32 0, i64 %811
  %813 = load i64* %812, align 8
  %814 = load %struct.tree** %1, align 8
  %815 = getelementptr inbounds %struct.tree* %814, i32 0, i32 0
  %816 = getelementptr inbounds %struct.POSITION* %815, i32 0, i32 1
  %817 = load i64* %816, align 8
  %818 = xor i64 %817, %813
  store i64 %818, i64* %816, align 8
  br label %819

; <label>:819                                     ; preds = %809, %794
  %820 = load i32* %to, align 4
  %821 = load i32* %from, align 4
  %822 = sub nsw i32 %820, %821
  %823 = icmp sgt i32 %822, 0
  br i1 %823, label %824, label %828

; <label>:824                                     ; preds = %819
  %825 = load i32* %to, align 4
  %826 = load i32* %from, align 4
  %827 = sub nsw i32 %825, %826
  br label %833

; <label>:828                                     ; preds = %819
  %829 = load i32* %to, align 4
  %830 = load i32* %from, align 4
  %831 = sub nsw i32 %829, %830
  %832 = sub nsw i32 0, %831
  br label %833

; <label>:833                                     ; preds = %828, %824
  %834 = phi i32 [ %827, %824 ], [ %832, %828 ]
  %835 = icmp eq i32 %834, 2
  br i1 %835, label %836, label %966

; <label>:836                                     ; preds = %833
  %837 = load i32* %2, align 4
  %838 = sub nsw i32 0, %837
  %839 = trunc i32 %838 to i8
  %840 = load i32* %4, align 4
  %841 = sext i32 %840 to i64
  %842 = load i32* %2, align 4
  %843 = add nsw i32 %842, 1
  %844 = sext i32 %843 to i64
  %845 = load %struct.tree** %1, align 8
  %846 = getelementptr inbounds %struct.tree* %845, i32 0, i32 8
  %847 = getelementptr inbounds [67 x %struct.SEARCH_POSITION]* %846, i32 0, i64 %844
  %848 = getelementptr inbounds %struct.SEARCH_POSITION* %847, i32 0, i32 1
  %849 = getelementptr inbounds [2 x i8]* %848, i32 0, i64 %841
  store i8 %839, i8* %849, align 1
  store i32 4, i32* %piece, align 4
  %850 = load i32* %to, align 4
  %851 = load i32* %4, align 4
  %852 = sext i32 %851 to i64
  %853 = getelementptr inbounds [2 x i32]* @rook_G, i32 0, i64 %852
  %854 = load i32* %853, align 4
  %855 = icmp eq i32 %850, %854
  br i1 %855, label %856, label %865

; <label>:856                                     ; preds = %836
  %857 = load i32* %4, align 4
  %858 = sext i32 %857 to i64
  %859 = getelementptr inbounds [2 x i32]* @rook_H, i32 0, i64 %858
  %860 = load i32* %859, align 4
  store i32 %860, i32* %from, align 4
  %861 = load i32* %4, align 4
  %862 = sext i32 %861 to i64
  %863 = getelementptr inbounds [2 x i32]* @rook_F, i32 0, i64 %862
  %864 = load i32* %863, align 4
  store i32 %864, i32* %to, align 4
  br label %874

; <label>:865                                     ; preds = %836
  %866 = load i32* %4, align 4
  %867 = sext i32 %866 to i64
  %868 = getelementptr inbounds [2 x i32]* @rook_A, i32 0, i64 %867
  %869 = load i32* %868, align 4
  store i32 %869, i32* %from, align 4
  %870 = load i32* %4, align 4
  %871 = sext i32 %870 to i64
  %872 = getelementptr inbounds [2 x i32]* @rook_D, i32 0, i64 %871
  %873 = load i32* %872, align 4
  store i32 %873, i32* %to, align 4
  br label %874

; <label>:874                                     ; preds = %865, %856
  %875 = load i32* %from, align 4
  %876 = sext i32 %875 to i64
  %877 = getelementptr inbounds [65 x i64]* @set_mask, i32 0, i64 %876
  %878 = load i64* %877, align 8
  %879 = load i32* %to, align 4
  %880 = sext i32 %879 to i64
  %881 = getelementptr inbounds [65 x i64]* @set_mask, i32 0, i64 %880
  %882 = load i64* %881, align 8
  %883 = or i64 %878, %882
  store i64 %883, i64* %bit_move, align 8
  %884 = load i64* %bit_move, align 8
  %885 = load i32* %4, align 4
  %886 = sext i32 %885 to i64
  %887 = load %struct.tree** %1, align 8
  %888 = getelementptr inbounds %struct.tree* %887, i32 0, i32 0
  %889 = getelementptr inbounds %struct.POSITION* %888, i32 0, i32 0
  %890 = getelementptr inbounds [2 x %struct.BB_PIECES]* %889, i32 0, i64 %886
  %891 = getelementptr inbounds %struct.BB_PIECES* %890, i32 0, i32 0
  %892 = getelementptr inbounds [7 x i64]* %891, i32 0, i64 4
  %893 = load i64* %892, align 8
  %894 = xor i64 %884, %893
  %895 = load i32* %4, align 4
  %896 = sext i32 %895 to i64
  %897 = load %struct.tree** %1, align 8
  %898 = getelementptr inbounds %struct.tree* %897, i32 0, i32 0
  %899 = getelementptr inbounds %struct.POSITION* %898, i32 0, i32 0
  %900 = getelementptr inbounds [2 x %struct.BB_PIECES]* %899, i32 0, i64 %896
  %901 = getelementptr inbounds %struct.BB_PIECES* %900, i32 0, i32 0
  %902 = getelementptr inbounds [7 x i64]* %901, i32 0, i64 4
  store i64 %894, i64* %902, align 8
  %903 = load i64* %bit_move, align 8
  %904 = load i32* %4, align 4
  %905 = sext i32 %904 to i64
  %906 = load %struct.tree** %1, align 8
  %907 = getelementptr inbounds %struct.tree* %906, i32 0, i32 0
  %908 = getelementptr inbounds %struct.POSITION* %907, i32 0, i32 0
  %909 = getelementptr inbounds [2 x %struct.BB_PIECES]* %908, i32 0, i64 %905
  %910 = getelementptr inbounds %struct.BB_PIECES* %909, i32 0, i32 0
  %911 = getelementptr inbounds [7 x i64]* %910, i32 0, i64 0
  %912 = load i64* %911, align 8
  %913 = xor i64 %903, %912
  %914 = load i32* %4, align 4
  %915 = sext i32 %914 to i64
  %916 = load %struct.tree** %1, align 8
  %917 = getelementptr inbounds %struct.tree* %916, i32 0, i32 0
  %918 = getelementptr inbounds %struct.POSITION* %917, i32 0, i32 0
  %919 = getelementptr inbounds [2 x %struct.BB_PIECES]* %918, i32 0, i64 %915
  %920 = getelementptr inbounds %struct.BB_PIECES* %919, i32 0, i32 0
  %921 = getelementptr inbounds [7 x i64]* %920, i32 0, i64 0
  store i64 %913, i64* %921, align 8
  %922 = load i32* %from, align 4
  %923 = sext i32 %922 to i64
  %924 = load i32* %4, align 4
  %925 = sext i32 %924 to i64
  %926 = getelementptr inbounds [2 x [7 x [64 x i64]]]* @randoms, i32 0, i64 %925
  %927 = getelementptr inbounds [7 x [64 x i64]]* %926, i32 0, i64 4
  %928 = getelementptr inbounds [64 x i64]* %927, i32 0, i64 %923
  %929 = load i64* %928, align 8
  %930 = load %struct.tree** %1, align 8
  %931 = getelementptr inbounds %struct.tree* %930, i32 0, i32 0
  %932 = getelementptr inbounds %struct.POSITION* %931, i32 0, i32 1
  %933 = load i64* %932, align 8
  %934 = xor i64 %933, %929
  store i64 %934, i64* %932, align 8
  %935 = load i32* %to, align 4
  %936 = sext i32 %935 to i64
  %937 = load i32* %4, align 4
  %938 = sext i32 %937 to i64
  %939 = getelementptr inbounds [2 x [7 x [64 x i64]]]* @randoms, i32 0, i64 %938
  %940 = getelementptr inbounds [7 x [64 x i64]]* %939, i32 0, i64 4
  %941 = getelementptr inbounds [64 x i64]* %940, i32 0, i64 %936
  %942 = load i64* %941, align 8
  %943 = load %struct.tree** %1, align 8
  %944 = getelementptr inbounds %struct.tree* %943, i32 0, i32 0
  %945 = getelementptr inbounds %struct.POSITION* %944, i32 0, i32 1
  %946 = load i64* %945, align 8
  %947 = xor i64 %946, %942
  store i64 %947, i64* %945, align 8
  %948 = load i32* %from, align 4
  %949 = sext i32 %948 to i64
  %950 = load %struct.tree** %1, align 8
  %951 = getelementptr inbounds %struct.tree* %950, i32 0, i32 0
  %952 = getelementptr inbounds %struct.POSITION* %951, i32 0, i32 5
  %953 = getelementptr inbounds [64 x i8]* %952, i32 0, i64 %949
  store i8 0, i8* %953, align 1
  %954 = load i32* %4, align 4
  %955 = sext i32 %954 to i64
  %956 = getelementptr inbounds [2 x [7 x i32]]* @pieces, i32 0, i64 %955
  %957 = getelementptr inbounds [7 x i32]* %956, i32 0, i64 4
  %958 = load i32* %957, align 4
  %959 = trunc i32 %958 to i8
  %960 = load i32* %to, align 4
  %961 = sext i32 %960 to i64
  %962 = load %struct.tree** %1, align 8
  %963 = getelementptr inbounds %struct.tree* %962, i32 0, i32 0
  %964 = getelementptr inbounds %struct.POSITION* %963, i32 0, i32 5
  %965 = getelementptr inbounds [64 x i8]* %964, i32 0, i64 %961
  store i8 %959, i8* %965, align 1
  br label %977

; <label>:966                                     ; preds = %833
  %967 = load i32* %4, align 4
  %968 = sext i32 %967 to i64
  %969 = load i32* %2, align 4
  %970 = add nsw i32 %969, 1
  %971 = sext i32 %970 to i64
  %972 = load %struct.tree** %1, align 8
  %973 = getelementptr inbounds %struct.tree* %972, i32 0, i32 8
  %974 = getelementptr inbounds [67 x %struct.SEARCH_POSITION]* %973, i32 0, i64 %971
  %975 = getelementptr inbounds %struct.SEARCH_POSITION* %974, i32 0, i32 1
  %976 = getelementptr inbounds [2 x i8]* %975, i32 0, i64 %968
  store i8 0, i8* %976, align 1
  br label %977

; <label>:977                                     ; preds = %966, %874
  br label %978

; <label>:978                                     ; preds = %977, %748
  br label %979

; <label>:979                                     ; preds = %71, %978, %747, %746, %637, %636, %635
  %980 = load i32* %captured, align 4
  %981 = icmp ne i32 %980, 0
  br i1 %981, label %982, label %1268

; <label>:982                                     ; preds = %979
  %983 = load i32* %2, align 4
  %984 = add nsw i32 %983, 1
  %985 = sext i32 %984 to i64
  %986 = load %struct.tree** %1, align 8
  %987 = getelementptr inbounds %struct.tree* %986, i32 0, i32 8
  %988 = getelementptr inbounds [67 x %struct.SEARCH_POSITION]* %987, i32 0, i64 %985
  %989 = getelementptr inbounds %struct.SEARCH_POSITION* %988, i32 0, i32 2
  store i8 0, i8* %989, align 1
  %990 = load %struct.tree** %1, align 8
  %991 = getelementptr inbounds %struct.tree* %990, i32 0, i32 0
  %992 = getelementptr inbounds %struct.POSITION* %991, i32 0, i32 9
  %993 = load i8* %992, align 1
  %994 = add i8 %993, -1
  store i8 %994, i8* %992, align 1
  %995 = load i32* %promote, align 4
  %996 = icmp ne i32 %995, 0
  br i1 %996, label %997, label %999

; <label>:997                                     ; preds = %982
  %998 = load i32* %promote, align 4
  store i32 %998, i32* %piece, align 4
  br label %999

; <label>:999                                     ; preds = %997, %982
  %1000 = load i32* %to, align 4
  %1001 = sext i32 %1000 to i64
  %1002 = load i32* %captured, align 4
  %1003 = sext i32 %1002 to i64
  %1004 = load i32* %btm, align 4
  %1005 = sext i32 %1004 to i64
  %1006 = getelementptr inbounds [2 x [7 x [64 x i64]]]* @randoms, i32 0, i64 %1005
  %1007 = getelementptr inbounds [7 x [64 x i64]]* %1006, i32 0, i64 %1003
  %1008 = getelementptr inbounds [64 x i64]* %1007, i32 0, i64 %1001
  %1009 = load i64* %1008, align 8
  %1010 = load %struct.tree** %1, align 8
  %1011 = getelementptr inbounds %struct.tree* %1010, i32 0, i32 0
  %1012 = getelementptr inbounds %struct.POSITION* %1011, i32 0, i32 1
  %1013 = load i64* %1012, align 8
  %1014 = xor i64 %1013, %1009
  store i64 %1014, i64* %1012, align 8
  %1015 = load i32* %to, align 4
  %1016 = sext i32 %1015 to i64
  %1017 = getelementptr inbounds [65 x i64]* @clear_mask, i32 0, i64 %1016
  %1018 = load i64* %1017, align 8
  %1019 = load i32* %captured, align 4
  %1020 = sext i32 %1019 to i64
  %1021 = load i32* %btm, align 4
  %1022 = sext i32 %1021 to i64
  %1023 = load %struct.tree** %1, align 8
  %1024 = getelementptr inbounds %struct.tree* %1023, i32 0, i32 0
  %1025 = getelementptr inbounds %struct.POSITION* %1024, i32 0, i32 0
  %1026 = getelementptr inbounds [2 x %struct.BB_PIECES]* %1025, i32 0, i64 %1022
  %1027 = getelementptr inbounds %struct.BB_PIECES* %1026, i32 0, i32 0
  %1028 = getelementptr inbounds [7 x i64]* %1027, i32 0, i64 %1020
  %1029 = load i64* %1028, align 8
  %1030 = and i64 %1018, %1029
  %1031 = load i32* %captured, align 4
  %1032 = sext i32 %1031 to i64
  %1033 = load i32* %btm, align 4
  %1034 = sext i32 %1033 to i64
  %1035 = load %struct.tree** %1, align 8
  %1036 = getelementptr inbounds %struct.tree* %1035, i32 0, i32 0
  %1037 = getelementptr inbounds %struct.POSITION* %1036, i32 0, i32 0
  %1038 = getelementptr inbounds [2 x %struct.BB_PIECES]* %1037, i32 0, i64 %1034
  %1039 = getelementptr inbounds %struct.BB_PIECES* %1038, i32 0, i32 0
  %1040 = getelementptr inbounds [7 x i64]* %1039, i32 0, i64 %1032
  store i64 %1030, i64* %1040, align 8
  %1041 = load i32* %to, align 4
  %1042 = sext i32 %1041 to i64
  %1043 = getelementptr inbounds [65 x i64]* @clear_mask, i32 0, i64 %1042
  %1044 = load i64* %1043, align 8
  %1045 = load i32* %btm, align 4
  %1046 = sext i32 %1045 to i64
  %1047 = load %struct.tree** %1, align 8
  %1048 = getelementptr inbounds %struct.tree* %1047, i32 0, i32 0
  %1049 = getelementptr inbounds %struct.POSITION* %1048, i32 0, i32 0
  %1050 = getelementptr inbounds [2 x %struct.BB_PIECES]* %1049, i32 0, i64 %1046
  %1051 = getelementptr inbounds %struct.BB_PIECES* %1050, i32 0, i32 0
  %1052 = getelementptr inbounds [7 x i64]* %1051, i32 0, i64 0
  %1053 = load i64* %1052, align 8
  %1054 = and i64 %1044, %1053
  %1055 = load i32* %btm, align 4
  %1056 = sext i32 %1055 to i64
  %1057 = load %struct.tree** %1, align 8
  %1058 = getelementptr inbounds %struct.tree* %1057, i32 0, i32 0
  %1059 = getelementptr inbounds %struct.POSITION* %1058, i32 0, i32 0
  %1060 = getelementptr inbounds [2 x %struct.BB_PIECES]* %1059, i32 0, i64 %1056
  %1061 = getelementptr inbounds %struct.BB_PIECES* %1060, i32 0, i32 0
  %1062 = getelementptr inbounds [7 x i64]* %1061, i32 0, i64 0
  store i64 %1054, i64* %1062, align 8
  %1063 = load i32* %btm, align 4
  %1064 = sext i32 %1063 to i64
  %1065 = load i32* %captured, align 4
  %1066 = sext i32 %1065 to i64
  %1067 = getelementptr inbounds [7 x [2 x i32]]* @piece_values, i32 0, i64 %1066
  %1068 = getelementptr inbounds [2 x i32]* %1067, i32 0, i64 %1064
  %1069 = load i32* %1068, align 4
  %1070 = load %struct.tree** %1, align 8
  %1071 = getelementptr inbounds %struct.tree* %1070, i32 0, i32 0
  %1072 = getelementptr inbounds %struct.POSITION* %1071, i32 0, i32 3
  %1073 = load i32* %1072, align 4
  %1074 = sub nsw i32 %1073, %1069
  store i32 %1074, i32* %1072, align 4
  %1075 = load i32* %captured, align 4
  %1076 = sext i32 %1075 to i64
  %1077 = load i32* %btm, align 4
  %1078 = sext i32 %1077 to i64
  %1079 = load %struct.tree** %1, align 8
  %1080 = getelementptr inbounds %struct.tree* %1079, i32 0, i32 0
  %1081 = getelementptr inbounds %struct.POSITION* %1080, i32 0, i32 6
  %1082 = getelementptr inbounds [2 x [7 x i8]]* %1081, i32 0, i64 %1078
  %1083 = getelementptr inbounds [7 x i8]* %1082, i32 0, i64 %1076
  %1084 = load i8* %1083, align 1
  %1085 = add i8 %1084, -1
  store i8 %1085, i8* %1083, align 1
  %1086 = load i32* %captured, align 4
  %1087 = icmp ne i32 %1086, 1
  br i1 %1087, label %1088, label %1104

; <label>:1088                                    ; preds = %999
  %1089 = load i32* %captured, align 4
  %1090 = sext i32 %1089 to i64
  %1091 = getelementptr inbounds [7 x i32]* @p_vals, i32 0, i64 %1090
  %1092 = load i32* %1091, align 4
  %1093 = load i32* %btm, align 4
  %1094 = sext i32 %1093 to i64
  %1095 = load %struct.tree** %1, align 8
  %1096 = getelementptr inbounds %struct.tree* %1095, i32 0, i32 0
  %1097 = getelementptr inbounds %struct.POSITION* %1096, i32 0, i32 6
  %1098 = getelementptr inbounds [2 x [7 x i8]]* %1097, i32 0, i64 %1094
  %1099 = getelementptr inbounds [7 x i8]* %1098, i32 0, i64 0
  %1100 = load i8* %1099, align 1
  %1101 = sext i8 %1100 to i32
  %1102 = sub nsw i32 %1101, %1092
  %1103 = trunc i32 %1102 to i8
  store i8 %1103, i8* %1099, align 1
  br label %1104

; <label>:1104                                    ; preds = %1088, %999
  %1105 = load i32* %captured, align 4
  switch i32 %1105, label %1267 [
    i32 1, label %1106
    i32 2, label %1120
    i32 3, label %1129
    i32 4, label %1138
    i32 5, label %1255
    i32 6, label %1266
  ]

; <label>:1106                                    ; preds = %1104
  %1107 = load i32* %to, align 4
  %1108 = sext i32 %1107 to i64
  %1109 = load i32* %btm, align 4
  %1110 = sext i32 %1109 to i64
  %1111 = getelementptr inbounds [2 x [7 x [64 x i64]]]* @randoms, i32 0, i64 %1110
  %1112 = getelementptr inbounds [7 x [64 x i64]]* %1111, i32 0, i64 1
  %1113 = getelementptr inbounds [64 x i64]* %1112, i32 0, i64 %1108
  %1114 = load i64* %1113, align 8
  %1115 = load %struct.tree** %1, align 8
  %1116 = getelementptr inbounds %struct.tree* %1115, i32 0, i32 0
  %1117 = getelementptr inbounds %struct.POSITION* %1116, i32 0, i32 2
  %1118 = load i64* %1117, align 8
  %1119 = xor i64 %1118, %1114
  store i64 %1119, i64* %1117, align 8
  br label %1267

; <label>:1120                                    ; preds = %1104
  %1121 = load i32* %btm, align 4
  %1122 = sext i32 %1121 to i64
  %1123 = load %struct.tree** %1, align 8
  %1124 = getelementptr inbounds %struct.tree* %1123, i32 0, i32 0
  %1125 = getelementptr inbounds %struct.POSITION* %1124, i32 0, i32 8
  %1126 = getelementptr inbounds [2 x i8]* %1125, i32 0, i64 %1122
  %1127 = load i8* %1126, align 1
  %1128 = add i8 %1127, -1
  store i8 %1128, i8* %1126, align 1
  br label %1267

; <label>:1129                                    ; preds = %1104
  %1130 = load i32* %btm, align 4
  %1131 = sext i32 %1130 to i64
  %1132 = load %struct.tree** %1, align 8
  %1133 = getelementptr inbounds %struct.tree* %1132, i32 0, i32 0
  %1134 = getelementptr inbounds %struct.POSITION* %1133, i32 0, i32 8
  %1135 = getelementptr inbounds [2 x i8]* %1134, i32 0, i64 %1131
  %1136 = load i8* %1135, align 1
  %1137 = add i8 %1136, -1
  store i8 %1137, i8* %1135, align 1
  br label %1267

; <label>:1138                                    ; preds = %1104
  %1139 = load i32* %btm, align 4
  %1140 = sext i32 %1139 to i64
  %1141 = load i32* %2, align 4
  %1142 = add nsw i32 %1141, 1
  %1143 = sext i32 %1142 to i64
  %1144 = load %struct.tree** %1, align 8
  %1145 = getelementptr inbounds %struct.tree* %1144, i32 0, i32 8
  %1146 = getelementptr inbounds [67 x %struct.SEARCH_POSITION]* %1145, i32 0, i64 %1143
  %1147 = getelementptr inbounds %struct.SEARCH_POSITION* %1146, i32 0, i32 1
  %1148 = getelementptr inbounds [2 x i8]* %1147, i32 0, i64 %1140
  %1149 = load i8* %1148, align 1
  %1150 = sext i8 %1149 to i32
  %1151 = icmp sgt i32 %1150, 0
  br i1 %1151, label %1152, label %1246

; <label>:1152                                    ; preds = %1138
  %1153 = load i32* %to, align 4
  %1154 = load i32* %btm, align 4
  %1155 = sext i32 %1154 to i64
  %1156 = getelementptr inbounds [2 x i32]* @rook_A, i32 0, i64 %1155
  %1157 = load i32* %1156, align 4
  %1158 = icmp eq i32 %1153, %1157
  br i1 %1158, label %1159, label %1198

; <label>:1159                                    ; preds = %1152
  %1160 = load i32* %btm, align 4
  %1161 = sext i32 %1160 to i64
  %1162 = load i32* %2, align 4
  %1163 = add nsw i32 %1162, 1
  %1164 = sext i32 %1163 to i64
  %1165 = load %struct.tree** %1, align 8
  %1166 = getelementptr inbounds %struct.tree* %1165, i32 0, i32 8
  %1167 = getelementptr inbounds [67 x %struct.SEARCH_POSITION]* %1166, i32 0, i64 %1164
  %1168 = getelementptr inbounds %struct.SEARCH_POSITION* %1167, i32 0, i32 1
  %1169 = getelementptr inbounds [2 x i8]* %1168, i32 0, i64 %1161
  %1170 = load i8* %1169, align 1
  %1171 = sext i8 %1170 to i32
  %1172 = and i32 %1171, 2
  %1173 = icmp ne i32 %1172, 0
  br i1 %1173, label %1174, label %1198

; <label>:1174                                    ; preds = %1159
  %1175 = load i32* %btm, align 4
  %1176 = sext i32 %1175 to i64
  %1177 = load i32* %2, align 4
  %1178 = add nsw i32 %1177, 1
  %1179 = sext i32 %1178 to i64
  %1180 = load %struct.tree** %1, align 8
  %1181 = getelementptr inbounds %struct.tree* %1180, i32 0, i32 8
  %1182 = getelementptr inbounds [67 x %struct.SEARCH_POSITION]* %1181, i32 0, i64 %1179
  %1183 = getelementptr inbounds %struct.SEARCH_POSITION* %1182, i32 0, i32 1
  %1184 = getelementptr inbounds [2 x i8]* %1183, i32 0, i64 %1176
  %1185 = load i8* %1184, align 1
  %1186 = sext i8 %1185 to i32
  %1187 = and i32 %1186, 1
  %1188 = trunc i32 %1187 to i8
  store i8 %1188, i8* %1184, align 1
  %1189 = load i32* %btm, align 4
  %1190 = sext i32 %1189 to i64
  %1191 = getelementptr inbounds [2 x i64]* getelementptr inbounds ([2 x [2 x i64]]* @castle_random, i32 0, i64 1), i32 0, i64 %1190
  %1192 = load i64* %1191, align 8
  %1193 = load %struct.tree** %1, align 8
  %1194 = getelementptr inbounds %struct.tree* %1193, i32 0, i32 0
  %1195 = getelementptr inbounds %struct.POSITION* %1194, i32 0, i32 1
  %1196 = load i64* %1195, align 8
  %1197 = xor i64 %1196, %1192
  store i64 %1197, i64* %1195, align 8
  br label %1245

; <label>:1198                                    ; preds = %1159, %1152
  %1199 = load i32* %to, align 4
  %1200 = load i32* %btm, align 4
  %1201 = sext i32 %1200 to i64
  %1202 = getelementptr inbounds [2 x i32]* @rook_H, i32 0, i64 %1201
  %1203 = load i32* %1202, align 4
  %1204 = icmp eq i32 %1199, %1203
  br i1 %1204, label %1205, label %1244

; <label>:1205                                    ; preds = %1198
  %1206 = load i32* %btm, align 4
  %1207 = sext i32 %1206 to i64
  %1208 = load i32* %2, align 4
  %1209 = add nsw i32 %1208, 1
  %1210 = sext i32 %1209 to i64
  %1211 = load %struct.tree** %1, align 8
  %1212 = getelementptr inbounds %struct.tree* %1211, i32 0, i32 8
  %1213 = getelementptr inbounds [67 x %struct.SEARCH_POSITION]* %1212, i32 0, i64 %1210
  %1214 = getelementptr inbounds %struct.SEARCH_POSITION* %1213, i32 0, i32 1
  %1215 = getelementptr inbounds [2 x i8]* %1214, i32 0, i64 %1207
  %1216 = load i8* %1215, align 1
  %1217 = sext i8 %1216 to i32
  %1218 = and i32 %1217, 1
  %1219 = icmp ne i32 %1218, 0
  br i1 %1219, label %1220, label %1244

; <label>:1220                                    ; preds = %1205
  %1221 = load i32* %btm, align 4
  %1222 = sext i32 %1221 to i64
  %1223 = load i32* %2, align 4
  %1224 = add nsw i32 %1223, 1
  %1225 = sext i32 %1224 to i64
  %1226 = load %struct.tree** %1, align 8
  %1227 = getelementptr inbounds %struct.tree* %1226, i32 0, i32 8
  %1228 = getelementptr inbounds [67 x %struct.SEARCH_POSITION]* %1227, i32 0, i64 %1225
  %1229 = getelementptr inbounds %struct.SEARCH_POSITION* %1228, i32 0, i32 1
  %1230 = getelementptr inbounds [2 x i8]* %1229, i32 0, i64 %1222
  %1231 = load i8* %1230, align 1
  %1232 = sext i8 %1231 to i32
  %1233 = and i32 %1232, 2
  %1234 = trunc i32 %1233 to i8
  store i8 %1234, i8* %1230, align 1
  %1235 = load i32* %btm, align 4
  %1236 = sext i32 %1235 to i64
  %1237 = getelementptr inbounds [2 x i64]* getelementptr inbounds ([2 x [2 x i64]]* @castle_random, i32 0, i64 0), i32 0, i64 %1236
  %1238 = load i64* %1237, align 8
  %1239 = load %struct.tree** %1, align 8
  %1240 = getelementptr inbounds %struct.tree* %1239, i32 0, i32 0
  %1241 = getelementptr inbounds %struct.POSITION* %1240, i32 0, i32 1
  %1242 = load i64* %1241, align 8
  %1243 = xor i64 %1242, %1238
  store i64 %1243, i64* %1241, align 8
  br label %1244

; <label>:1244                                    ; preds = %1220, %1205, %1198
  br label %1245

; <label>:1245                                    ; preds = %1244, %1174
  br label %1246

; <label>:1246                                    ; preds = %1245, %1138
  %1247 = load i32* %btm, align 4
  %1248 = sext i32 %1247 to i64
  %1249 = load %struct.tree** %1, align 8
  %1250 = getelementptr inbounds %struct.tree* %1249, i32 0, i32 0
  %1251 = getelementptr inbounds %struct.POSITION* %1250, i32 0, i32 7
  %1252 = getelementptr inbounds [2 x i8]* %1251, i32 0, i64 %1248
  %1253 = load i8* %1252, align 1
  %1254 = add i8 %1253, -1
  store i8 %1254, i8* %1252, align 1
  br label %1267

; <label>:1255                                    ; preds = %1104
  %1256 = load i32* %btm, align 4
  %1257 = sext i32 %1256 to i64
  %1258 = load %struct.tree** %1, align 8
  %1259 = getelementptr inbounds %struct.tree* %1258, i32 0, i32 0
  %1260 = getelementptr inbounds %struct.POSITION* %1259, i32 0, i32 7
  %1261 = getelementptr inbounds [2 x i8]* %1260, i32 0, i64 %1257
  %1262 = load i8* %1261, align 1
  %1263 = sext i8 %1262 to i32
  %1264 = sub nsw i32 %1263, 2
  %1265 = trunc i32 %1264 to i8
  store i8 %1265, i8* %1261, align 1
  br label %1267

; <label>:1266                                    ; preds = %1104
  br label %1267

; <label>:1267                                    ; preds = %1104, %1266, %1255, %1246, %1129, %1120, %1106
  br label %1268

; <label>:1268                                    ; preds = %1267, %979
  ret void
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

; Function Attrs: nounwind uwtable
define void @MakeMoveRoot(%struct.tree* %tree, i32 %move, i32 %wtm) #0 {
  %1 = alloca %struct.tree*, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %side = alloca i32, align 4
  store %struct.tree* %tree, %struct.tree** %1, align 8
  store i32 %move, i32* %2, align 4
  store i32 %wtm, i32* %3, align 4
  %4 = load %struct.tree** %1, align 8
  %5 = getelementptr inbounds %struct.tree* %4, i32 0, i32 0
  %6 = getelementptr inbounds %struct.POSITION* %5, i32 0, i32 1
  %7 = load i64* %6, align 8
  %8 = load i32* %3, align 4
  %9 = sext i32 %8 to i64
  %10 = load %struct.tree** %1, align 8
  %11 = getelementptr inbounds %struct.tree* %10, i32 0, i32 12
  %12 = getelementptr inbounds [2 x i32]* %11, i32 0, i64 %9
  %13 = load i32* %12, align 4
  %14 = add nsw i32 %13, 1
  store i32 %14, i32* %12, align 4
  %15 = sext i32 %13 to i64
  %16 = load i32* %3, align 4
  %17 = sext i32 %16 to i64
  %18 = load %struct.tree** %1, align 8
  %19 = getelementptr inbounds %struct.tree* %18, i32 0, i32 2
  %20 = getelementptr inbounds [2 x [128 x i64]]* %19, i32 0, i64 %17
  %21 = getelementptr inbounds [128 x i64]* %20, i32 0, i64 %15
  store i64 %7, i64* %21, align 8
  %22 = load %struct.tree** %1, align 8
  %23 = load i32* %2, align 4
  %24 = load i32* %3, align 4
  call void @MakeMove(%struct.tree* %22, i32 0, i32 %23, i32 %24)
  store i32 0, i32* %side, align 4
  br label %25

; <label>:25                                      ; preds = %74, %0
  %26 = load i32* %side, align 4
  %27 = icmp sle i32 %26, 1
  br i1 %27, label %28, label %77

; <label>:28                                      ; preds = %25
  %29 = load i32* %side, align 4
  %30 = sext i32 %29 to i64
  %31 = load %struct.tree** %1, align 8
  %32 = getelementptr inbounds %struct.tree* %31, i32 0, i32 8
  %33 = getelementptr inbounds [67 x %struct.SEARCH_POSITION]* %32, i32 0, i64 1
  %34 = getelementptr inbounds %struct.SEARCH_POSITION* %33, i32 0, i32 1
  %35 = getelementptr inbounds [2 x i8]* %34, i32 0, i64 %30
  %36 = load i8* %35, align 1
  %37 = sext i8 %36 to i32
  %38 = icmp sgt i32 0, %37
  br i1 %38, label %39, label %40

; <label>:39                                      ; preds = %28
  br label %50

; <label>:40                                      ; preds = %28
  %41 = load i32* %side, align 4
  %42 = sext i32 %41 to i64
  %43 = load %struct.tree** %1, align 8
  %44 = getelementptr inbounds %struct.tree* %43, i32 0, i32 8
  %45 = getelementptr inbounds [67 x %struct.SEARCH_POSITION]* %44, i32 0, i64 1
  %46 = getelementptr inbounds %struct.SEARCH_POSITION* %45, i32 0, i32 1
  %47 = getelementptr inbounds [2 x i8]* %46, i32 0, i64 %42
  %48 = load i8* %47, align 1
  %49 = sext i8 %48 to i32
  br label %50

; <label>:50                                      ; preds = %40, %39
  %51 = phi i32 [ 0, %39 ], [ %49, %40 ]
  %52 = trunc i32 %51 to i8
  %53 = load i32* %side, align 4
  %54 = sext i32 %53 to i64
  %55 = load %struct.tree** %1, align 8
  %56 = getelementptr inbounds %struct.tree* %55, i32 0, i32 8
  %57 = getelementptr inbounds [67 x %struct.SEARCH_POSITION]* %56, i32 0, i64 1
  %58 = getelementptr inbounds %struct.SEARCH_POSITION* %57, i32 0, i32 1
  %59 = getelementptr inbounds [2 x i8]* %58, i32 0, i64 %54
  store i8 %52, i8* %59, align 1
  %60 = load %struct.tree** %1, align 8
  %61 = getelementptr inbounds %struct.tree* %60, i32 0, i32 8
  %62 = getelementptr inbounds [67 x %struct.SEARCH_POSITION]* %61, i32 0, i64 1
  %63 = getelementptr inbounds %struct.SEARCH_POSITION* %62, i32 0, i32 2
  %64 = load i8* %63, align 1
  %65 = zext i8 %64 to i32
  %66 = icmp eq i32 %65, 0
  br i1 %66, label %67, label %73

; <label>:67                                      ; preds = %50
  %68 = load i32* %side, align 4
  %69 = sext i32 %68 to i64
  %70 = load %struct.tree** %1, align 8
  %71 = getelementptr inbounds %struct.tree* %70, i32 0, i32 12
  %72 = getelementptr inbounds [2 x i32]* %71, i32 0, i64 %69
  store i32 0, i32* %72, align 4
  br label %73

; <label>:73                                      ; preds = %67, %50
  br label %74

; <label>:74                                      ; preds = %73
  %75 = load i32* %side, align 4
  %76 = add nsw i32 %75, 1
  store i32 %76, i32* %side, align 4
  br label %25

; <label>:77                                      ; preds = %25
  %78 = load %struct.tree** %1, align 8
  %79 = getelementptr inbounds %struct.tree* %78, i32 0, i32 8
  %80 = getelementptr inbounds [67 x %struct.SEARCH_POSITION]* %79, i32 0, i64 0
  %81 = load %struct.tree** %1, align 8
  %82 = getelementptr inbounds %struct.tree* %81, i32 0, i32 8
  %83 = getelementptr inbounds [67 x %struct.SEARCH_POSITION]* %82, i32 0, i64 1
  %84 = bitcast %struct.SEARCH_POSITION* %80 to i8*
  %85 = bitcast %struct.SEARCH_POSITION* %83 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %84, i8* %85, i64 4, i32 1, i1 false)
  ret void
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
