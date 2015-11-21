; ModuleID = 'make.ll'
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
  %1 = xor i32 %wtm, 1
  %2 = add nsw i32 %ply, 1
  %3 = sext i32 %2 to i64
  %4 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 8
  %5 = getelementptr inbounds [67 x %struct.SEARCH_POSITION]* %4, i32 0, i64 %3
  %6 = sext i32 %ply to i64
  %7 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 8
  %8 = getelementptr inbounds [67 x %struct.SEARCH_POSITION]* %7, i32 0, i64 %6
  %9 = bitcast %struct.SEARCH_POSITION* %5 to i8*
  %10 = bitcast %struct.SEARCH_POSITION* %8 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %9, i8* %10, i64 4, i32 1, i1 false)
  %11 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 0
  %12 = getelementptr inbounds %struct.POSITION* %11, i32 0, i32 1
  %13 = load i64* %12, align 8
  %14 = sext i32 %ply to i64
  %15 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 1
  %16 = getelementptr inbounds [67 x i64]* %15, i32 0, i64 %14
  store i64 %13, i64* %16, align 8
  %17 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 0
  %18 = getelementptr inbounds %struct.POSITION* %17, i32 0, i32 2
  %19 = load i64* %18, align 8
  %20 = sext i32 %ply to i64
  %21 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 5
  %22 = getelementptr inbounds [67 x i64]* %21, i32 0, i64 %20
  store i64 %19, i64* %22, align 8
  %23 = add nsw i32 %ply, 1
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 8
  %26 = getelementptr inbounds [67 x %struct.SEARCH_POSITION]* %25, i32 0, i64 %24
  %27 = getelementptr inbounds %struct.SEARCH_POSITION* %26, i32 0, i32 0
  %28 = load i8* %27, align 1
  %29 = icmp ne i8 %28, 0
  br i1 %29, label %30, label %49

; <label>:30                                      ; preds = %0
  %31 = add nsw i32 %ply, 1
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 8
  %34 = getelementptr inbounds [67 x %struct.SEARCH_POSITION]* %33, i32 0, i64 %32
  %35 = getelementptr inbounds %struct.SEARCH_POSITION* %34, i32 0, i32 0
  %36 = load i8* %35, align 1
  %37 = zext i8 %36 to i64
  %38 = getelementptr inbounds [65 x i64]* @enpassant_random, i32 0, i64 %37
  %39 = load i64* %38, align 8
  %40 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 0
  %41 = getelementptr inbounds %struct.POSITION* %40, i32 0, i32 1
  %42 = load i64* %41, align 8
  %43 = xor i64 %42, %39
  store i64 %43, i64* %41, align 8
  %44 = add nsw i32 %ply, 1
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 8
  %47 = getelementptr inbounds [67 x %struct.SEARCH_POSITION]* %46, i32 0, i64 %45
  %48 = getelementptr inbounds %struct.SEARCH_POSITION* %47, i32 0, i32 0
  store i8 0, i8* %48, align 1
  br label %49

; <label>:49                                      ; preds = %30, %0
  %50 = add nsw i32 %ply, 1
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 8
  %53 = getelementptr inbounds [67 x %struct.SEARCH_POSITION]* %52, i32 0, i64 %51
  %54 = getelementptr inbounds %struct.SEARCH_POSITION* %53, i32 0, i32 2
  %55 = load i8* %54, align 1
  %56 = add i8 %55, 1
  store i8 %56, i8* %54, align 1
  %57 = ashr i32 %move, 12
  %58 = and i32 %57, 7
  %59 = and i32 %move, 63
  %60 = ashr i32 %move, 6
  %61 = and i32 %60, 63
  %62 = ashr i32 %move, 15
  %63 = and i32 %62, 7
  %64 = ashr i32 %move, 18
  %65 = and i32 %64, 7
  %66 = sext i32 %59 to i64
  %67 = getelementptr inbounds [65 x i64]* @set_mask, i32 0, i64 %66
  %68 = load i64* %67, align 8
  %69 = sext i32 %61 to i64
  %70 = getelementptr inbounds [65 x i64]* @set_mask, i32 0, i64 %69
  %71 = load i64* %70, align 8
  %72 = or i64 %68, %71
  %73 = sext i32 %61 to i64
  %74 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 0
  %75 = getelementptr inbounds %struct.POSITION* %74, i32 0, i32 5
  %76 = getelementptr inbounds [64 x i8]* %75, i32 0, i64 %73
  %77 = load i8* %76, align 1
  %78 = sext i8 %77 to i32
  %79 = sext i32 %58 to i64
  %80 = sext i32 %wtm to i64
  %81 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 0
  %82 = getelementptr inbounds %struct.POSITION* %81, i32 0, i32 0
  %83 = getelementptr inbounds [2 x %struct.BB_PIECES]* %82, i32 0, i64 %80
  %84 = getelementptr inbounds %struct.BB_PIECES* %83, i32 0, i32 0
  %85 = getelementptr inbounds [7 x i64]* %84, i32 0, i64 %79
  %86 = load i64* %85, align 8
  %87 = xor i64 %72, %86
  %88 = sext i32 %58 to i64
  %89 = sext i32 %wtm to i64
  %90 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 0
  %91 = getelementptr inbounds %struct.POSITION* %90, i32 0, i32 0
  %92 = getelementptr inbounds [2 x %struct.BB_PIECES]* %91, i32 0, i64 %89
  %93 = getelementptr inbounds %struct.BB_PIECES* %92, i32 0, i32 0
  %94 = getelementptr inbounds [7 x i64]* %93, i32 0, i64 %88
  store i64 %87, i64* %94, align 8
  %95 = sext i32 %wtm to i64
  %96 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 0
  %97 = getelementptr inbounds %struct.POSITION* %96, i32 0, i32 0
  %98 = getelementptr inbounds [2 x %struct.BB_PIECES]* %97, i32 0, i64 %95
  %99 = getelementptr inbounds %struct.BB_PIECES* %98, i32 0, i32 0
  %100 = getelementptr inbounds [7 x i64]* %99, i32 0, i64 0
  %101 = load i64* %100, align 8
  %102 = xor i64 %72, %101
  %103 = sext i32 %wtm to i64
  %104 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 0
  %105 = getelementptr inbounds %struct.POSITION* %104, i32 0, i32 0
  %106 = getelementptr inbounds [2 x %struct.BB_PIECES]* %105, i32 0, i64 %103
  %107 = getelementptr inbounds %struct.BB_PIECES* %106, i32 0, i32 0
  %108 = getelementptr inbounds [7 x i64]* %107, i32 0, i64 0
  store i64 %102, i64* %108, align 8
  %109 = sext i32 %59 to i64
  %110 = sext i32 %58 to i64
  %111 = sext i32 %wtm to i64
  %112 = getelementptr inbounds [2 x [7 x [64 x i64]]]* @randoms, i32 0, i64 %111
  %113 = getelementptr inbounds [7 x [64 x i64]]* %112, i32 0, i64 %110
  %114 = getelementptr inbounds [64 x i64]* %113, i32 0, i64 %109
  %115 = load i64* %114, align 8
  %116 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 0
  %117 = getelementptr inbounds %struct.POSITION* %116, i32 0, i32 1
  %118 = load i64* %117, align 8
  %119 = xor i64 %118, %115
  store i64 %119, i64* %117, align 8
  %120 = sext i32 %61 to i64
  %121 = sext i32 %58 to i64
  %122 = sext i32 %wtm to i64
  %123 = getelementptr inbounds [2 x [7 x [64 x i64]]]* @randoms, i32 0, i64 %122
  %124 = getelementptr inbounds [7 x [64 x i64]]* %123, i32 0, i64 %121
  %125 = getelementptr inbounds [64 x i64]* %124, i32 0, i64 %120
  %126 = load i64* %125, align 8
  %127 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 0
  %128 = getelementptr inbounds %struct.POSITION* %127, i32 0, i32 1
  %129 = load i64* %128, align 8
  %130 = xor i64 %129, %126
  store i64 %130, i64* %128, align 8
  %131 = sext i32 %59 to i64
  %132 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 0
  %133 = getelementptr inbounds %struct.POSITION* %132, i32 0, i32 5
  %134 = getelementptr inbounds [64 x i8]* %133, i32 0, i64 %131
  store i8 0, i8* %134, align 1
  %135 = sext i32 %58 to i64
  %136 = sext i32 %wtm to i64
  %137 = getelementptr inbounds [2 x [7 x i32]]* @pieces, i32 0, i64 %136
  %138 = getelementptr inbounds [7 x i32]* %137, i32 0, i64 %135
  %139 = load i32* %138, align 4
  %140 = trunc i32 %139 to i8
  %141 = sext i32 %61 to i64
  %142 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 0
  %143 = getelementptr inbounds %struct.POSITION* %142, i32 0, i32 5
  %144 = getelementptr inbounds [64 x i8]* %143, i32 0, i64 %141
  store i8 %140, i8* %144, align 1
  switch i32 %58, label %735 [
    i32 1, label %145
    i32 2, label %473
    i32 3, label %474
    i32 4, label %475
    i32 5, label %561
    i32 6, label %562
  ]

; <label>:145                                     ; preds = %49
  %146 = sext i32 %59 to i64
  %147 = sext i32 %wtm to i64
  %148 = getelementptr inbounds [2 x [7 x [64 x i64]]]* @randoms, i32 0, i64 %147
  %149 = getelementptr inbounds [7 x [64 x i64]]* %148, i32 0, i64 1
  %150 = getelementptr inbounds [64 x i64]* %149, i32 0, i64 %146
  %151 = load i64* %150, align 8
  %152 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 0
  %153 = getelementptr inbounds %struct.POSITION* %152, i32 0, i32 2
  %154 = load i64* %153, align 8
  %155 = xor i64 %154, %151
  store i64 %155, i64* %153, align 8
  %156 = sext i32 %61 to i64
  %157 = sext i32 %wtm to i64
  %158 = getelementptr inbounds [2 x [7 x [64 x i64]]]* @randoms, i32 0, i64 %157
  %159 = getelementptr inbounds [7 x [64 x i64]]* %158, i32 0, i64 1
  %160 = getelementptr inbounds [64 x i64]* %159, i32 0, i64 %156
  %161 = load i64* %160, align 8
  %162 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 0
  %163 = getelementptr inbounds %struct.POSITION* %162, i32 0, i32 2
  %164 = load i64* %163, align 8
  %165 = xor i64 %164, %161
  store i64 %165, i64* %163, align 8
  %166 = add nsw i32 %ply, 1
  %167 = sext i32 %166 to i64
  %168 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 8
  %169 = getelementptr inbounds [67 x %struct.SEARCH_POSITION]* %168, i32 0, i64 %167
  %170 = getelementptr inbounds %struct.SEARCH_POSITION* %169, i32 0, i32 2
  store i8 0, i8* %170, align 1
  %171 = icmp eq i32 %63, 1
  br i1 %171, label %172, label %271

; <label>:172                                     ; preds = %145
  %173 = icmp ne i32 %78, 0
  br i1 %173, label %271, label %174

; <label>:174                                     ; preds = %172
  %175 = sext i32 %wtm to i64
  %176 = getelementptr inbounds [2 x i32]* @epsq, i32 0, i64 %175
  %177 = load i32* %176, align 4
  %178 = add nsw i32 %61, %177
  %179 = sext i32 %178 to i64
  %180 = getelementptr inbounds [65 x i64]* @clear_mask, i32 0, i64 %179
  %181 = load i64* %180, align 8
  %182 = sext i32 %1 to i64
  %183 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 0
  %184 = getelementptr inbounds %struct.POSITION* %183, i32 0, i32 0
  %185 = getelementptr inbounds [2 x %struct.BB_PIECES]* %184, i32 0, i64 %182
  %186 = getelementptr inbounds %struct.BB_PIECES* %185, i32 0, i32 0
  %187 = getelementptr inbounds [7 x i64]* %186, i32 0, i64 1
  %188 = load i64* %187, align 8
  %189 = and i64 %181, %188
  %190 = sext i32 %1 to i64
  %191 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 0
  %192 = getelementptr inbounds %struct.POSITION* %191, i32 0, i32 0
  %193 = getelementptr inbounds [2 x %struct.BB_PIECES]* %192, i32 0, i64 %190
  %194 = getelementptr inbounds %struct.BB_PIECES* %193, i32 0, i32 0
  %195 = getelementptr inbounds [7 x i64]* %194, i32 0, i64 1
  store i64 %189, i64* %195, align 8
  %196 = sext i32 %wtm to i64
  %197 = getelementptr inbounds [2 x i32]* @epsq, i32 0, i64 %196
  %198 = load i32* %197, align 4
  %199 = add nsw i32 %61, %198
  %200 = sext i32 %199 to i64
  %201 = getelementptr inbounds [65 x i64]* @clear_mask, i32 0, i64 %200
  %202 = load i64* %201, align 8
  %203 = sext i32 %1 to i64
  %204 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 0
  %205 = getelementptr inbounds %struct.POSITION* %204, i32 0, i32 0
  %206 = getelementptr inbounds [2 x %struct.BB_PIECES]* %205, i32 0, i64 %203
  %207 = getelementptr inbounds %struct.BB_PIECES* %206, i32 0, i32 0
  %208 = getelementptr inbounds [7 x i64]* %207, i32 0, i64 0
  %209 = load i64* %208, align 8
  %210 = and i64 %202, %209
  %211 = sext i32 %1 to i64
  %212 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 0
  %213 = getelementptr inbounds %struct.POSITION* %212, i32 0, i32 0
  %214 = getelementptr inbounds [2 x %struct.BB_PIECES]* %213, i32 0, i64 %211
  %215 = getelementptr inbounds %struct.BB_PIECES* %214, i32 0, i32 0
  %216 = getelementptr inbounds [7 x i64]* %215, i32 0, i64 0
  store i64 %210, i64* %216, align 8
  %217 = sext i32 %wtm to i64
  %218 = getelementptr inbounds [2 x i32]* @epsq, i32 0, i64 %217
  %219 = load i32* %218, align 4
  %220 = add nsw i32 %61, %219
  %221 = sext i32 %220 to i64
  %222 = sext i32 %1 to i64
  %223 = getelementptr inbounds [2 x [7 x [64 x i64]]]* @randoms, i32 0, i64 %222
  %224 = getelementptr inbounds [7 x [64 x i64]]* %223, i32 0, i64 1
  %225 = getelementptr inbounds [64 x i64]* %224, i32 0, i64 %221
  %226 = load i64* %225, align 8
  %227 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 0
  %228 = getelementptr inbounds %struct.POSITION* %227, i32 0, i32 1
  %229 = load i64* %228, align 8
  %230 = xor i64 %229, %226
  store i64 %230, i64* %228, align 8
  %231 = sext i32 %wtm to i64
  %232 = getelementptr inbounds [2 x i32]* @epsq, i32 0, i64 %231
  %233 = load i32* %232, align 4
  %234 = add nsw i32 %61, %233
  %235 = sext i32 %234 to i64
  %236 = sext i32 %1 to i64
  %237 = getelementptr inbounds [2 x [7 x [64 x i64]]]* @randoms, i32 0, i64 %236
  %238 = getelementptr inbounds [7 x [64 x i64]]* %237, i32 0, i64 1
  %239 = getelementptr inbounds [64 x i64]* %238, i32 0, i64 %235
  %240 = load i64* %239, align 8
  %241 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 0
  %242 = getelementptr inbounds %struct.POSITION* %241, i32 0, i32 2
  %243 = load i64* %242, align 8
  %244 = xor i64 %243, %240
  store i64 %244, i64* %242, align 8
  %245 = sext i32 %wtm to i64
  %246 = getelementptr inbounds [2 x i32]* @epsq, i32 0, i64 %245
  %247 = load i32* %246, align 4
  %248 = add nsw i32 %61, %247
  %249 = sext i32 %248 to i64
  %250 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 0
  %251 = getelementptr inbounds %struct.POSITION* %250, i32 0, i32 5
  %252 = getelementptr inbounds [64 x i8]* %251, i32 0, i64 %249
  store i8 0, i8* %252, align 1
  %253 = sext i32 %1 to i64
  %254 = getelementptr inbounds [2 x i32]* getelementptr inbounds ([7 x [2 x i32]]* @piece_values, i32 0, i64 1), i32 0, i64 %253
  %255 = load i32* %254, align 4
  %256 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 0
  %257 = getelementptr inbounds %struct.POSITION* %256, i32 0, i32 3
  %258 = load i32* %257, align 4
  %259 = sub nsw i32 %258, %255
  store i32 %259, i32* %257, align 4
  %260 = sext i32 %1 to i64
  %261 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 0
  %262 = getelementptr inbounds %struct.POSITION* %261, i32 0, i32 6
  %263 = getelementptr inbounds [2 x [7 x i8]]* %262, i32 0, i64 %260
  %264 = getelementptr inbounds [7 x i8]* %263, i32 0, i64 1
  %265 = load i8* %264, align 1
  %266 = add i8 %265, -1
  store i8 %266, i8* %264, align 1
  %267 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 0
  %268 = getelementptr inbounds %struct.POSITION* %267, i32 0, i32 9
  %269 = load i8* %268, align 1
  %270 = add i8 %269, -1
  store i8 %270, i8* %268, align 1
  br label %271

; <label>:271                                     ; preds = %174, %172, %145
  %captured.0 = phi i32 [ %63, %172 ], [ 0, %174 ], [ %63, %145 ]
  %272 = icmp ne i32 %65, 0
  br i1 %272, label %273, label %425

; <label>:273                                     ; preds = %271
  %274 = sext i32 %wtm to i64
  %275 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 0
  %276 = getelementptr inbounds %struct.POSITION* %275, i32 0, i32 6
  %277 = getelementptr inbounds [2 x [7 x i8]]* %276, i32 0, i64 %274
  %278 = getelementptr inbounds [7 x i8]* %277, i32 0, i64 1
  %279 = load i8* %278, align 1
  %280 = add i8 %279, -1
  store i8 %280, i8* %278, align 1
  %281 = sext i32 %wtm to i64
  %282 = getelementptr inbounds [2 x i32]* getelementptr inbounds ([7 x [2 x i32]]* @piece_values, i32 0, i64 1), i32 0, i64 %281
  %283 = load i32* %282, align 4
  %284 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 0
  %285 = getelementptr inbounds %struct.POSITION* %284, i32 0, i32 3
  %286 = load i32* %285, align 4
  %287 = sub nsw i32 %286, %283
  store i32 %287, i32* %285, align 4
  %288 = sext i32 %61 to i64
  %289 = getelementptr inbounds [65 x i64]* @clear_mask, i32 0, i64 %288
  %290 = load i64* %289, align 8
  %291 = sext i32 %wtm to i64
  %292 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 0
  %293 = getelementptr inbounds %struct.POSITION* %292, i32 0, i32 0
  %294 = getelementptr inbounds [2 x %struct.BB_PIECES]* %293, i32 0, i64 %291
  %295 = getelementptr inbounds %struct.BB_PIECES* %294, i32 0, i32 0
  %296 = getelementptr inbounds [7 x i64]* %295, i32 0, i64 1
  %297 = load i64* %296, align 8
  %298 = and i64 %290, %297
  %299 = sext i32 %wtm to i64
  %300 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 0
  %301 = getelementptr inbounds %struct.POSITION* %300, i32 0, i32 0
  %302 = getelementptr inbounds [2 x %struct.BB_PIECES]* %301, i32 0, i64 %299
  %303 = getelementptr inbounds %struct.BB_PIECES* %302, i32 0, i32 0
  %304 = getelementptr inbounds [7 x i64]* %303, i32 0, i64 1
  store i64 %298, i64* %304, align 8
  %305 = sext i32 %61 to i64
  %306 = sext i32 %wtm to i64
  %307 = getelementptr inbounds [2 x [7 x [64 x i64]]]* @randoms, i32 0, i64 %306
  %308 = getelementptr inbounds [7 x [64 x i64]]* %307, i32 0, i64 1
  %309 = getelementptr inbounds [64 x i64]* %308, i32 0, i64 %305
  %310 = load i64* %309, align 8
  %311 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 0
  %312 = getelementptr inbounds %struct.POSITION* %311, i32 0, i32 1
  %313 = load i64* %312, align 8
  %314 = xor i64 %313, %310
  store i64 %314, i64* %312, align 8
  %315 = sext i32 %61 to i64
  %316 = sext i32 %wtm to i64
  %317 = getelementptr inbounds [2 x [7 x [64 x i64]]]* @randoms, i32 0, i64 %316
  %318 = getelementptr inbounds [7 x [64 x i64]]* %317, i32 0, i64 1
  %319 = getelementptr inbounds [64 x i64]* %318, i32 0, i64 %315
  %320 = load i64* %319, align 8
  %321 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 0
  %322 = getelementptr inbounds %struct.POSITION* %321, i32 0, i32 2
  %323 = load i64* %322, align 8
  %324 = xor i64 %323, %320
  store i64 %324, i64* %322, align 8
  %325 = sext i32 %61 to i64
  %326 = sext i32 %65 to i64
  %327 = sext i32 %wtm to i64
  %328 = getelementptr inbounds [2 x [7 x [64 x i64]]]* @randoms, i32 0, i64 %327
  %329 = getelementptr inbounds [7 x [64 x i64]]* %328, i32 0, i64 %326
  %330 = getelementptr inbounds [64 x i64]* %329, i32 0, i64 %325
  %331 = load i64* %330, align 8
  %332 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 0
  %333 = getelementptr inbounds %struct.POSITION* %332, i32 0, i32 1
  %334 = load i64* %333, align 8
  %335 = xor i64 %334, %331
  store i64 %335, i64* %333, align 8
  %336 = sext i32 %65 to i64
  %337 = sext i32 %wtm to i64
  %338 = getelementptr inbounds [2 x [7 x i32]]* @pieces, i32 0, i64 %337
  %339 = getelementptr inbounds [7 x i32]* %338, i32 0, i64 %336
  %340 = load i32* %339, align 4
  %341 = trunc i32 %340 to i8
  %342 = sext i32 %61 to i64
  %343 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 0
  %344 = getelementptr inbounds %struct.POSITION* %343, i32 0, i32 5
  %345 = getelementptr inbounds [64 x i8]* %344, i32 0, i64 %342
  store i8 %341, i8* %345, align 1
  %346 = sext i32 %65 to i64
  %347 = getelementptr inbounds [7 x i32]* @p_vals, i32 0, i64 %346
  %348 = load i32* %347, align 4
  %349 = sext i32 %wtm to i64
  %350 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 0
  %351 = getelementptr inbounds %struct.POSITION* %350, i32 0, i32 6
  %352 = getelementptr inbounds [2 x [7 x i8]]* %351, i32 0, i64 %349
  %353 = getelementptr inbounds [7 x i8]* %352, i32 0, i64 0
  %354 = load i8* %353, align 1
  %355 = sext i8 %354 to i32
  %356 = add nsw i32 %355, %348
  %357 = trunc i32 %356 to i8
  store i8 %357, i8* %353, align 1
  %358 = sext i32 %65 to i64
  %359 = sext i32 %wtm to i64
  %360 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 0
  %361 = getelementptr inbounds %struct.POSITION* %360, i32 0, i32 6
  %362 = getelementptr inbounds [2 x [7 x i8]]* %361, i32 0, i64 %359
  %363 = getelementptr inbounds [7 x i8]* %362, i32 0, i64 %358
  %364 = load i8* %363, align 1
  %365 = add i8 %364, 1
  store i8 %365, i8* %363, align 1
  %366 = sext i32 %wtm to i64
  %367 = sext i32 %65 to i64
  %368 = getelementptr inbounds [7 x [2 x i32]]* @piece_values, i32 0, i64 %367
  %369 = getelementptr inbounds [2 x i32]* %368, i32 0, i64 %366
  %370 = load i32* %369, align 4
  %371 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 0
  %372 = getelementptr inbounds %struct.POSITION* %371, i32 0, i32 3
  %373 = load i32* %372, align 4
  %374 = add nsw i32 %373, %370
  store i32 %374, i32* %372, align 4
  %375 = sext i32 %61 to i64
  %376 = getelementptr inbounds [65 x i64]* @set_mask, i32 0, i64 %375
  %377 = load i64* %376, align 8
  %378 = sext i32 %65 to i64
  %379 = sext i32 %wtm to i64
  %380 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 0
  %381 = getelementptr inbounds %struct.POSITION* %380, i32 0, i32 0
  %382 = getelementptr inbounds [2 x %struct.BB_PIECES]* %381, i32 0, i64 %379
  %383 = getelementptr inbounds %struct.BB_PIECES* %382, i32 0, i32 0
  %384 = getelementptr inbounds [7 x i64]* %383, i32 0, i64 %378
  %385 = load i64* %384, align 8
  %386 = or i64 %377, %385
  %387 = sext i32 %65 to i64
  %388 = sext i32 %wtm to i64
  %389 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 0
  %390 = getelementptr inbounds %struct.POSITION* %389, i32 0, i32 0
  %391 = getelementptr inbounds [2 x %struct.BB_PIECES]* %390, i32 0, i64 %388
  %392 = getelementptr inbounds %struct.BB_PIECES* %391, i32 0, i32 0
  %393 = getelementptr inbounds [7 x i64]* %392, i32 0, i64 %387
  store i64 %386, i64* %393, align 8
  switch i32 %65, label %424 [
    i32 2, label %394
    i32 3, label %401
    i32 4, label %408
    i32 5, label %415
  ]

; <label>:394                                     ; preds = %273
  %395 = sext i32 %wtm to i64
  %396 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 0
  %397 = getelementptr inbounds %struct.POSITION* %396, i32 0, i32 8
  %398 = getelementptr inbounds [2 x i8]* %397, i32 0, i64 %395
  %399 = load i8* %398, align 1
  %400 = add i8 %399, 1
  store i8 %400, i8* %398, align 1
  br label %424

; <label>:401                                     ; preds = %273
  %402 = sext i32 %wtm to i64
  %403 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 0
  %404 = getelementptr inbounds %struct.POSITION* %403, i32 0, i32 8
  %405 = getelementptr inbounds [2 x i8]* %404, i32 0, i64 %402
  %406 = load i8* %405, align 1
  %407 = add i8 %406, 1
  store i8 %407, i8* %405, align 1
  br label %424

; <label>:408                                     ; preds = %273
  %409 = sext i32 %wtm to i64
  %410 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 0
  %411 = getelementptr inbounds %struct.POSITION* %410, i32 0, i32 7
  %412 = getelementptr inbounds [2 x i8]* %411, i32 0, i64 %409
  %413 = load i8* %412, align 1
  %414 = add i8 %413, 1
  store i8 %414, i8* %412, align 1
  br label %424

; <label>:415                                     ; preds = %273
  %416 = sext i32 %wtm to i64
  %417 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 0
  %418 = getelementptr inbounds %struct.POSITION* %417, i32 0, i32 7
  %419 = getelementptr inbounds [2 x i8]* %418, i32 0, i64 %416
  %420 = load i8* %419, align 1
  %421 = sext i8 %420 to i32
  %422 = add nsw i32 %421, 2
  %423 = trunc i32 %422 to i8
  store i8 %423, i8* %419, align 1
  br label %424

; <label>:424                                     ; preds = %415, %408, %401, %394, %273
  br label %472

; <label>:425                                     ; preds = %271
  %426 = sub nsw i32 %61, %59
  %427 = icmp sgt i32 %426, 0
  br i1 %427, label %428, label %430

; <label>:428                                     ; preds = %425
  %429 = sub nsw i32 %61, %59
  br label %433

; <label>:430                                     ; preds = %425
  %431 = sub nsw i32 %61, %59
  %432 = sub nsw i32 0, %431
  br label %433

; <label>:433                                     ; preds = %430, %428
  %434 = phi i32 [ %429, %428 ], [ %432, %430 ]
  %435 = icmp eq i32 %434, 16
  br i1 %435, label %436, label %471

; <label>:436                                     ; preds = %433
  %437 = sext i32 %61 to i64
  %438 = getelementptr inbounds [64 x i64]* @mask_eptest, i32 0, i64 %437
  %439 = load i64* %438, align 8
  %440 = sext i32 %1 to i64
  %441 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 0
  %442 = getelementptr inbounds %struct.POSITION* %441, i32 0, i32 0
  %443 = getelementptr inbounds [2 x %struct.BB_PIECES]* %442, i32 0, i64 %440
  %444 = getelementptr inbounds %struct.BB_PIECES* %443, i32 0, i32 0
  %445 = getelementptr inbounds [7 x i64]* %444, i32 0, i64 1
  %446 = load i64* %445, align 8
  %447 = and i64 %439, %446
  %448 = icmp ne i64 %447, 0
  br i1 %448, label %449, label %471

; <label>:449                                     ; preds = %436
  %450 = sext i32 %wtm to i64
  %451 = getelementptr inbounds [2 x i32]* @epsq, i32 0, i64 %450
  %452 = load i32* %451, align 4
  %453 = add nsw i32 %61, %452
  %454 = trunc i32 %453 to i8
  %455 = add nsw i32 %ply, 1
  %456 = sext i32 %455 to i64
  %457 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 8
  %458 = getelementptr inbounds [67 x %struct.SEARCH_POSITION]* %457, i32 0, i64 %456
  %459 = getelementptr inbounds %struct.SEARCH_POSITION* %458, i32 0, i32 0
  store i8 %454, i8* %459, align 1
  %460 = sext i32 %wtm to i64
  %461 = getelementptr inbounds [2 x i32]* @epsq, i32 0, i64 %460
  %462 = load i32* %461, align 4
  %463 = add nsw i32 %61, %462
  %464 = sext i32 %463 to i64
  %465 = getelementptr inbounds [65 x i64]* @enpassant_random, i32 0, i64 %464
  %466 = load i64* %465, align 8
  %467 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 0
  %468 = getelementptr inbounds %struct.POSITION* %467, i32 0, i32 1
  %469 = load i64* %468, align 8
  %470 = xor i64 %469, %466
  store i64 %470, i64* %468, align 8
  br label %471

; <label>:471                                     ; preds = %449, %436, %433
  br label %472

; <label>:472                                     ; preds = %471, %424
  br label %735

; <label>:473                                     ; preds = %49
  br label %735

; <label>:474                                     ; preds = %49
  br label %735

; <label>:475                                     ; preds = %49
  %476 = sext i32 %wtm to i64
  %477 = add nsw i32 %ply, 1
  %478 = sext i32 %477 to i64
  %479 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 8
  %480 = getelementptr inbounds [67 x %struct.SEARCH_POSITION]* %479, i32 0, i64 %478
  %481 = getelementptr inbounds %struct.SEARCH_POSITION* %480, i32 0, i32 1
  %482 = getelementptr inbounds [2 x i8]* %481, i32 0, i64 %476
  %483 = load i8* %482, align 1
  %484 = sext i8 %483 to i32
  %485 = icmp sgt i32 %484, 0
  br i1 %485, label %486, label %560

; <label>:486                                     ; preds = %475
  %487 = sext i32 %wtm to i64
  %488 = getelementptr inbounds [2 x i32]* @rook_A, i32 0, i64 %487
  %489 = load i32* %488, align 4
  %490 = icmp eq i32 %59, %489
  br i1 %490, label %491, label %522

; <label>:491                                     ; preds = %486
  %492 = sext i32 %wtm to i64
  %493 = add nsw i32 %ply, 1
  %494 = sext i32 %493 to i64
  %495 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 8
  %496 = getelementptr inbounds [67 x %struct.SEARCH_POSITION]* %495, i32 0, i64 %494
  %497 = getelementptr inbounds %struct.SEARCH_POSITION* %496, i32 0, i32 1
  %498 = getelementptr inbounds [2 x i8]* %497, i32 0, i64 %492
  %499 = load i8* %498, align 1
  %500 = sext i8 %499 to i32
  %501 = and i32 %500, 2
  %502 = icmp ne i32 %501, 0
  br i1 %502, label %503, label %522

; <label>:503                                     ; preds = %491
  %504 = sext i32 %wtm to i64
  %505 = add nsw i32 %ply, 1
  %506 = sext i32 %505 to i64
  %507 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 8
  %508 = getelementptr inbounds [67 x %struct.SEARCH_POSITION]* %507, i32 0, i64 %506
  %509 = getelementptr inbounds %struct.SEARCH_POSITION* %508, i32 0, i32 1
  %510 = getelementptr inbounds [2 x i8]* %509, i32 0, i64 %504
  %511 = load i8* %510, align 1
  %512 = sext i8 %511 to i32
  %513 = and i32 %512, 1
  %514 = trunc i32 %513 to i8
  store i8 %514, i8* %510, align 1
  %515 = sext i32 %wtm to i64
  %516 = getelementptr inbounds [2 x i64]* getelementptr inbounds ([2 x [2 x i64]]* @castle_random, i32 0, i64 1), i32 0, i64 %515
  %517 = load i64* %516, align 8
  %518 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 0
  %519 = getelementptr inbounds %struct.POSITION* %518, i32 0, i32 1
  %520 = load i64* %519, align 8
  %521 = xor i64 %520, %517
  store i64 %521, i64* %519, align 8
  br label %559

; <label>:522                                     ; preds = %491, %486
  %523 = sext i32 %wtm to i64
  %524 = getelementptr inbounds [2 x i32]* @rook_H, i32 0, i64 %523
  %525 = load i32* %524, align 4
  %526 = icmp eq i32 %59, %525
  br i1 %526, label %527, label %558

; <label>:527                                     ; preds = %522
  %528 = sext i32 %wtm to i64
  %529 = add nsw i32 %ply, 1
  %530 = sext i32 %529 to i64
  %531 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 8
  %532 = getelementptr inbounds [67 x %struct.SEARCH_POSITION]* %531, i32 0, i64 %530
  %533 = getelementptr inbounds %struct.SEARCH_POSITION* %532, i32 0, i32 1
  %534 = getelementptr inbounds [2 x i8]* %533, i32 0, i64 %528
  %535 = load i8* %534, align 1
  %536 = sext i8 %535 to i32
  %537 = and i32 %536, 1
  %538 = icmp ne i32 %537, 0
  br i1 %538, label %539, label %558

; <label>:539                                     ; preds = %527
  %540 = sext i32 %wtm to i64
  %541 = add nsw i32 %ply, 1
  %542 = sext i32 %541 to i64
  %543 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 8
  %544 = getelementptr inbounds [67 x %struct.SEARCH_POSITION]* %543, i32 0, i64 %542
  %545 = getelementptr inbounds %struct.SEARCH_POSITION* %544, i32 0, i32 1
  %546 = getelementptr inbounds [2 x i8]* %545, i32 0, i64 %540
  %547 = load i8* %546, align 1
  %548 = sext i8 %547 to i32
  %549 = and i32 %548, 2
  %550 = trunc i32 %549 to i8
  store i8 %550, i8* %546, align 1
  %551 = sext i32 %wtm to i64
  %552 = getelementptr inbounds [2 x i64]* getelementptr inbounds ([2 x [2 x i64]]* @castle_random, i32 0, i64 0), i32 0, i64 %551
  %553 = load i64* %552, align 8
  %554 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 0
  %555 = getelementptr inbounds %struct.POSITION* %554, i32 0, i32 1
  %556 = load i64* %555, align 8
  %557 = xor i64 %556, %553
  store i64 %557, i64* %555, align 8
  br label %558

; <label>:558                                     ; preds = %539, %527, %522
  br label %559

; <label>:559                                     ; preds = %558, %503
  br label %560

; <label>:560                                     ; preds = %559, %475
  br label %735

; <label>:561                                     ; preds = %49
  br label %735

; <label>:562                                     ; preds = %49
  %563 = sext i32 %wtm to i64
  %564 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 0
  %565 = getelementptr inbounds %struct.POSITION* %564, i32 0, i32 4
  %566 = getelementptr inbounds [2 x i32]* %565, i32 0, i64 %563
  store i32 %61, i32* %566, align 4
  %567 = sext i32 %wtm to i64
  %568 = add nsw i32 %ply, 1
  %569 = sext i32 %568 to i64
  %570 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 8
  %571 = getelementptr inbounds [67 x %struct.SEARCH_POSITION]* %570, i32 0, i64 %569
  %572 = getelementptr inbounds %struct.SEARCH_POSITION* %571, i32 0, i32 1
  %573 = getelementptr inbounds [2 x i8]* %572, i32 0, i64 %567
  %574 = load i8* %573, align 1
  %575 = sext i8 %574 to i32
  %576 = icmp sgt i32 %575, 0
  br i1 %576, label %577, label %734

; <label>:577                                     ; preds = %562
  %578 = sext i32 %wtm to i64
  %579 = add nsw i32 %ply, 1
  %580 = sext i32 %579 to i64
  %581 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 8
  %582 = getelementptr inbounds [67 x %struct.SEARCH_POSITION]* %581, i32 0, i64 %580
  %583 = getelementptr inbounds %struct.SEARCH_POSITION* %582, i32 0, i32 1
  %584 = getelementptr inbounds [2 x i8]* %583, i32 0, i64 %578
  %585 = load i8* %584, align 1
  %586 = sext i8 %585 to i32
  %587 = and i32 %586, 2
  %588 = icmp ne i32 %587, 0
  br i1 %588, label %589, label %597

; <label>:589                                     ; preds = %577
  %590 = sext i32 %wtm to i64
  %591 = getelementptr inbounds [2 x i64]* getelementptr inbounds ([2 x [2 x i64]]* @castle_random, i32 0, i64 1), i32 0, i64 %590
  %592 = load i64* %591, align 8
  %593 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 0
  %594 = getelementptr inbounds %struct.POSITION* %593, i32 0, i32 1
  %595 = load i64* %594, align 8
  %596 = xor i64 %595, %592
  store i64 %596, i64* %594, align 8
  br label %597

; <label>:597                                     ; preds = %589, %577
  %598 = sext i32 %wtm to i64
  %599 = add nsw i32 %ply, 1
  %600 = sext i32 %599 to i64
  %601 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 8
  %602 = getelementptr inbounds [67 x %struct.SEARCH_POSITION]* %601, i32 0, i64 %600
  %603 = getelementptr inbounds %struct.SEARCH_POSITION* %602, i32 0, i32 1
  %604 = getelementptr inbounds [2 x i8]* %603, i32 0, i64 %598
  %605 = load i8* %604, align 1
  %606 = sext i8 %605 to i32
  %607 = and i32 %606, 1
  %608 = icmp ne i32 %607, 0
  br i1 %608, label %609, label %617

; <label>:609                                     ; preds = %597
  %610 = sext i32 %wtm to i64
  %611 = getelementptr inbounds [2 x i64]* getelementptr inbounds ([2 x [2 x i64]]* @castle_random, i32 0, i64 0), i32 0, i64 %610
  %612 = load i64* %611, align 8
  %613 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 0
  %614 = getelementptr inbounds %struct.POSITION* %613, i32 0, i32 1
  %615 = load i64* %614, align 8
  %616 = xor i64 %615, %612
  store i64 %616, i64* %614, align 8
  br label %617

; <label>:617                                     ; preds = %609, %597
  %618 = sub nsw i32 %61, %59
  %619 = icmp sgt i32 %618, 0
  br i1 %619, label %620, label %622

; <label>:620                                     ; preds = %617
  %621 = sub nsw i32 %61, %59
  br label %625

; <label>:622                                     ; preds = %617
  %623 = sub nsw i32 %61, %59
  %624 = sub nsw i32 0, %623
  br label %625

; <label>:625                                     ; preds = %622, %620
  %626 = phi i32 [ %621, %620 ], [ %624, %622 ]
  %627 = icmp eq i32 %626, 2
  br i1 %627, label %628, label %725

; <label>:628                                     ; preds = %625
  %629 = sub nsw i32 0, %ply
  %630 = trunc i32 %629 to i8
  %631 = sext i32 %wtm to i64
  %632 = add nsw i32 %ply, 1
  %633 = sext i32 %632 to i64
  %634 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 8
  %635 = getelementptr inbounds [67 x %struct.SEARCH_POSITION]* %634, i32 0, i64 %633
  %636 = getelementptr inbounds %struct.SEARCH_POSITION* %635, i32 0, i32 1
  %637 = getelementptr inbounds [2 x i8]* %636, i32 0, i64 %631
  store i8 %630, i8* %637, align 1
  %638 = sext i32 %wtm to i64
  %639 = getelementptr inbounds [2 x i32]* @rook_G, i32 0, i64 %638
  %640 = load i32* %639, align 4
  %641 = icmp eq i32 %61, %640
  br i1 %641, label %642, label %649

; <label>:642                                     ; preds = %628
  %643 = sext i32 %wtm to i64
  %644 = getelementptr inbounds [2 x i32]* @rook_H, i32 0, i64 %643
  %645 = load i32* %644, align 4
  %646 = sext i32 %wtm to i64
  %647 = getelementptr inbounds [2 x i32]* @rook_F, i32 0, i64 %646
  %648 = load i32* %647, align 4
  br label %656

; <label>:649                                     ; preds = %628
  %650 = sext i32 %wtm to i64
  %651 = getelementptr inbounds [2 x i32]* @rook_A, i32 0, i64 %650
  %652 = load i32* %651, align 4
  %653 = sext i32 %wtm to i64
  %654 = getelementptr inbounds [2 x i32]* @rook_D, i32 0, i64 %653
  %655 = load i32* %654, align 4
  br label %656

; <label>:656                                     ; preds = %649, %642
  %from.0 = phi i32 [ %645, %642 ], [ %652, %649 ]
  %to.0 = phi i32 [ %648, %642 ], [ %655, %649 ]
  %657 = sext i32 %from.0 to i64
  %658 = getelementptr inbounds [65 x i64]* @set_mask, i32 0, i64 %657
  %659 = load i64* %658, align 8
  %660 = sext i32 %to.0 to i64
  %661 = getelementptr inbounds [65 x i64]* @set_mask, i32 0, i64 %660
  %662 = load i64* %661, align 8
  %663 = or i64 %659, %662
  %664 = sext i32 %wtm to i64
  %665 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 0
  %666 = getelementptr inbounds %struct.POSITION* %665, i32 0, i32 0
  %667 = getelementptr inbounds [2 x %struct.BB_PIECES]* %666, i32 0, i64 %664
  %668 = getelementptr inbounds %struct.BB_PIECES* %667, i32 0, i32 0
  %669 = getelementptr inbounds [7 x i64]* %668, i32 0, i64 4
  %670 = load i64* %669, align 8
  %671 = xor i64 %663, %670
  %672 = sext i32 %wtm to i64
  %673 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 0
  %674 = getelementptr inbounds %struct.POSITION* %673, i32 0, i32 0
  %675 = getelementptr inbounds [2 x %struct.BB_PIECES]* %674, i32 0, i64 %672
  %676 = getelementptr inbounds %struct.BB_PIECES* %675, i32 0, i32 0
  %677 = getelementptr inbounds [7 x i64]* %676, i32 0, i64 4
  store i64 %671, i64* %677, align 8
  %678 = sext i32 %wtm to i64
  %679 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 0
  %680 = getelementptr inbounds %struct.POSITION* %679, i32 0, i32 0
  %681 = getelementptr inbounds [2 x %struct.BB_PIECES]* %680, i32 0, i64 %678
  %682 = getelementptr inbounds %struct.BB_PIECES* %681, i32 0, i32 0
  %683 = getelementptr inbounds [7 x i64]* %682, i32 0, i64 0
  %684 = load i64* %683, align 8
  %685 = xor i64 %663, %684
  %686 = sext i32 %wtm to i64
  %687 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 0
  %688 = getelementptr inbounds %struct.POSITION* %687, i32 0, i32 0
  %689 = getelementptr inbounds [2 x %struct.BB_PIECES]* %688, i32 0, i64 %686
  %690 = getelementptr inbounds %struct.BB_PIECES* %689, i32 0, i32 0
  %691 = getelementptr inbounds [7 x i64]* %690, i32 0, i64 0
  store i64 %685, i64* %691, align 8
  %692 = sext i32 %from.0 to i64
  %693 = sext i32 %wtm to i64
  %694 = getelementptr inbounds [2 x [7 x [64 x i64]]]* @randoms, i32 0, i64 %693
  %695 = getelementptr inbounds [7 x [64 x i64]]* %694, i32 0, i64 4
  %696 = getelementptr inbounds [64 x i64]* %695, i32 0, i64 %692
  %697 = load i64* %696, align 8
  %698 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 0
  %699 = getelementptr inbounds %struct.POSITION* %698, i32 0, i32 1
  %700 = load i64* %699, align 8
  %701 = xor i64 %700, %697
  store i64 %701, i64* %699, align 8
  %702 = sext i32 %to.0 to i64
  %703 = sext i32 %wtm to i64
  %704 = getelementptr inbounds [2 x [7 x [64 x i64]]]* @randoms, i32 0, i64 %703
  %705 = getelementptr inbounds [7 x [64 x i64]]* %704, i32 0, i64 4
  %706 = getelementptr inbounds [64 x i64]* %705, i32 0, i64 %702
  %707 = load i64* %706, align 8
  %708 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 0
  %709 = getelementptr inbounds %struct.POSITION* %708, i32 0, i32 1
  %710 = load i64* %709, align 8
  %711 = xor i64 %710, %707
  store i64 %711, i64* %709, align 8
  %712 = sext i32 %from.0 to i64
  %713 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 0
  %714 = getelementptr inbounds %struct.POSITION* %713, i32 0, i32 5
  %715 = getelementptr inbounds [64 x i8]* %714, i32 0, i64 %712
  store i8 0, i8* %715, align 1
  %716 = sext i32 %wtm to i64
  %717 = getelementptr inbounds [2 x [7 x i32]]* @pieces, i32 0, i64 %716
  %718 = getelementptr inbounds [7 x i32]* %717, i32 0, i64 4
  %719 = load i32* %718, align 4
  %720 = trunc i32 %719 to i8
  %721 = sext i32 %to.0 to i64
  %722 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 0
  %723 = getelementptr inbounds %struct.POSITION* %722, i32 0, i32 5
  %724 = getelementptr inbounds [64 x i8]* %723, i32 0, i64 %721
  store i8 %720, i8* %724, align 1
  br label %733

; <label>:725                                     ; preds = %625
  %726 = sext i32 %wtm to i64
  %727 = add nsw i32 %ply, 1
  %728 = sext i32 %727 to i64
  %729 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 8
  %730 = getelementptr inbounds [67 x %struct.SEARCH_POSITION]* %729, i32 0, i64 %728
  %731 = getelementptr inbounds %struct.SEARCH_POSITION* %730, i32 0, i32 1
  %732 = getelementptr inbounds [2 x i8]* %731, i32 0, i64 %726
  store i8 0, i8* %732, align 1
  br label %733

; <label>:733                                     ; preds = %725, %656
  %to.1 = phi i32 [ %to.0, %656 ], [ %61, %725 ]
  br label %734

; <label>:734                                     ; preds = %733, %562
  %to.2 = phi i32 [ %to.1, %733 ], [ %61, %562 ]
  br label %735

; <label>:735                                     ; preds = %734, %561, %560, %474, %473, %472, %49
  %to.3 = phi i32 [ %61, %49 ], [ %to.2, %734 ], [ %61, %561 ], [ %61, %560 ], [ %61, %474 ], [ %61, %473 ], [ %61, %472 ]
  %captured.1 = phi i32 [ %63, %49 ], [ %63, %734 ], [ %63, %561 ], [ %63, %560 ], [ %63, %474 ], [ %63, %473 ], [ %captured.0, %472 ]
  %736 = icmp ne i32 %captured.1, 0
  br i1 %736, label %737, label %957

; <label>:737                                     ; preds = %735
  %738 = add nsw i32 %ply, 1
  %739 = sext i32 %738 to i64
  %740 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 8
  %741 = getelementptr inbounds [67 x %struct.SEARCH_POSITION]* %740, i32 0, i64 %739
  %742 = getelementptr inbounds %struct.SEARCH_POSITION* %741, i32 0, i32 2
  store i8 0, i8* %742, align 1
  %743 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 0
  %744 = getelementptr inbounds %struct.POSITION* %743, i32 0, i32 9
  %745 = load i8* %744, align 1
  %746 = add i8 %745, -1
  store i8 %746, i8* %744, align 1
  %747 = icmp ne i32 %65, 0
  br i1 %747, label %748, label %749

; <label>:748                                     ; preds = %737
  br label %749

; <label>:749                                     ; preds = %748, %737
  %750 = sext i32 %to.3 to i64
  %751 = sext i32 %captured.1 to i64
  %752 = sext i32 %1 to i64
  %753 = getelementptr inbounds [2 x [7 x [64 x i64]]]* @randoms, i32 0, i64 %752
  %754 = getelementptr inbounds [7 x [64 x i64]]* %753, i32 0, i64 %751
  %755 = getelementptr inbounds [64 x i64]* %754, i32 0, i64 %750
  %756 = load i64* %755, align 8
  %757 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 0
  %758 = getelementptr inbounds %struct.POSITION* %757, i32 0, i32 1
  %759 = load i64* %758, align 8
  %760 = xor i64 %759, %756
  store i64 %760, i64* %758, align 8
  %761 = sext i32 %to.3 to i64
  %762 = getelementptr inbounds [65 x i64]* @clear_mask, i32 0, i64 %761
  %763 = load i64* %762, align 8
  %764 = sext i32 %captured.1 to i64
  %765 = sext i32 %1 to i64
  %766 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 0
  %767 = getelementptr inbounds %struct.POSITION* %766, i32 0, i32 0
  %768 = getelementptr inbounds [2 x %struct.BB_PIECES]* %767, i32 0, i64 %765
  %769 = getelementptr inbounds %struct.BB_PIECES* %768, i32 0, i32 0
  %770 = getelementptr inbounds [7 x i64]* %769, i32 0, i64 %764
  %771 = load i64* %770, align 8
  %772 = and i64 %763, %771
  %773 = sext i32 %captured.1 to i64
  %774 = sext i32 %1 to i64
  %775 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 0
  %776 = getelementptr inbounds %struct.POSITION* %775, i32 0, i32 0
  %777 = getelementptr inbounds [2 x %struct.BB_PIECES]* %776, i32 0, i64 %774
  %778 = getelementptr inbounds %struct.BB_PIECES* %777, i32 0, i32 0
  %779 = getelementptr inbounds [7 x i64]* %778, i32 0, i64 %773
  store i64 %772, i64* %779, align 8
  %780 = sext i32 %to.3 to i64
  %781 = getelementptr inbounds [65 x i64]* @clear_mask, i32 0, i64 %780
  %782 = load i64* %781, align 8
  %783 = sext i32 %1 to i64
  %784 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 0
  %785 = getelementptr inbounds %struct.POSITION* %784, i32 0, i32 0
  %786 = getelementptr inbounds [2 x %struct.BB_PIECES]* %785, i32 0, i64 %783
  %787 = getelementptr inbounds %struct.BB_PIECES* %786, i32 0, i32 0
  %788 = getelementptr inbounds [7 x i64]* %787, i32 0, i64 0
  %789 = load i64* %788, align 8
  %790 = and i64 %782, %789
  %791 = sext i32 %1 to i64
  %792 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 0
  %793 = getelementptr inbounds %struct.POSITION* %792, i32 0, i32 0
  %794 = getelementptr inbounds [2 x %struct.BB_PIECES]* %793, i32 0, i64 %791
  %795 = getelementptr inbounds %struct.BB_PIECES* %794, i32 0, i32 0
  %796 = getelementptr inbounds [7 x i64]* %795, i32 0, i64 0
  store i64 %790, i64* %796, align 8
  %797 = sext i32 %1 to i64
  %798 = sext i32 %captured.1 to i64
  %799 = getelementptr inbounds [7 x [2 x i32]]* @piece_values, i32 0, i64 %798
  %800 = getelementptr inbounds [2 x i32]* %799, i32 0, i64 %797
  %801 = load i32* %800, align 4
  %802 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 0
  %803 = getelementptr inbounds %struct.POSITION* %802, i32 0, i32 3
  %804 = load i32* %803, align 4
  %805 = sub nsw i32 %804, %801
  store i32 %805, i32* %803, align 4
  %806 = sext i32 %captured.1 to i64
  %807 = sext i32 %1 to i64
  %808 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 0
  %809 = getelementptr inbounds %struct.POSITION* %808, i32 0, i32 6
  %810 = getelementptr inbounds [2 x [7 x i8]]* %809, i32 0, i64 %807
  %811 = getelementptr inbounds [7 x i8]* %810, i32 0, i64 %806
  %812 = load i8* %811, align 1
  %813 = add i8 %812, -1
  store i8 %813, i8* %811, align 1
  %814 = icmp ne i32 %captured.1, 1
  br i1 %814, label %815, label %828

; <label>:815                                     ; preds = %749
  %816 = sext i32 %captured.1 to i64
  %817 = getelementptr inbounds [7 x i32]* @p_vals, i32 0, i64 %816
  %818 = load i32* %817, align 4
  %819 = sext i32 %1 to i64
  %820 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 0
  %821 = getelementptr inbounds %struct.POSITION* %820, i32 0, i32 6
  %822 = getelementptr inbounds [2 x [7 x i8]]* %821, i32 0, i64 %819
  %823 = getelementptr inbounds [7 x i8]* %822, i32 0, i64 0
  %824 = load i8* %823, align 1
  %825 = sext i8 %824 to i32
  %826 = sub nsw i32 %825, %818
  %827 = trunc i32 %826 to i8
  store i8 %827, i8* %823, align 1
  br label %828

; <label>:828                                     ; preds = %815, %749
  switch i32 %captured.1, label %956 [
    i32 1, label %829
    i32 2, label %840
    i32 3, label %847
    i32 4, label %854
    i32 5, label %946
    i32 6, label %955
  ]

; <label>:829                                     ; preds = %828
  %830 = sext i32 %to.3 to i64
  %831 = sext i32 %1 to i64
  %832 = getelementptr inbounds [2 x [7 x [64 x i64]]]* @randoms, i32 0, i64 %831
  %833 = getelementptr inbounds [7 x [64 x i64]]* %832, i32 0, i64 1
  %834 = getelementptr inbounds [64 x i64]* %833, i32 0, i64 %830
  %835 = load i64* %834, align 8
  %836 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 0
  %837 = getelementptr inbounds %struct.POSITION* %836, i32 0, i32 2
  %838 = load i64* %837, align 8
  %839 = xor i64 %838, %835
  store i64 %839, i64* %837, align 8
  br label %956

; <label>:840                                     ; preds = %828
  %841 = sext i32 %1 to i64
  %842 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 0
  %843 = getelementptr inbounds %struct.POSITION* %842, i32 0, i32 8
  %844 = getelementptr inbounds [2 x i8]* %843, i32 0, i64 %841
  %845 = load i8* %844, align 1
  %846 = add i8 %845, -1
  store i8 %846, i8* %844, align 1
  br label %956

; <label>:847                                     ; preds = %828
  %848 = sext i32 %1 to i64
  %849 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 0
  %850 = getelementptr inbounds %struct.POSITION* %849, i32 0, i32 8
  %851 = getelementptr inbounds [2 x i8]* %850, i32 0, i64 %848
  %852 = load i8* %851, align 1
  %853 = add i8 %852, -1
  store i8 %853, i8* %851, align 1
  br label %956

; <label>:854                                     ; preds = %828
  %855 = sext i32 %1 to i64
  %856 = add nsw i32 %ply, 1
  %857 = sext i32 %856 to i64
  %858 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 8
  %859 = getelementptr inbounds [67 x %struct.SEARCH_POSITION]* %858, i32 0, i64 %857
  %860 = getelementptr inbounds %struct.SEARCH_POSITION* %859, i32 0, i32 1
  %861 = getelementptr inbounds [2 x i8]* %860, i32 0, i64 %855
  %862 = load i8* %861, align 1
  %863 = sext i8 %862 to i32
  %864 = icmp sgt i32 %863, 0
  br i1 %864, label %865, label %939

; <label>:865                                     ; preds = %854
  %866 = sext i32 %1 to i64
  %867 = getelementptr inbounds [2 x i32]* @rook_A, i32 0, i64 %866
  %868 = load i32* %867, align 4
  %869 = icmp eq i32 %to.3, %868
  br i1 %869, label %870, label %901

; <label>:870                                     ; preds = %865
  %871 = sext i32 %1 to i64
  %872 = add nsw i32 %ply, 1
  %873 = sext i32 %872 to i64
  %874 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 8
  %875 = getelementptr inbounds [67 x %struct.SEARCH_POSITION]* %874, i32 0, i64 %873
  %876 = getelementptr inbounds %struct.SEARCH_POSITION* %875, i32 0, i32 1
  %877 = getelementptr inbounds [2 x i8]* %876, i32 0, i64 %871
  %878 = load i8* %877, align 1
  %879 = sext i8 %878 to i32
  %880 = and i32 %879, 2
  %881 = icmp ne i32 %880, 0
  br i1 %881, label %882, label %901

; <label>:882                                     ; preds = %870
  %883 = sext i32 %1 to i64
  %884 = add nsw i32 %ply, 1
  %885 = sext i32 %884 to i64
  %886 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 8
  %887 = getelementptr inbounds [67 x %struct.SEARCH_POSITION]* %886, i32 0, i64 %885
  %888 = getelementptr inbounds %struct.SEARCH_POSITION* %887, i32 0, i32 1
  %889 = getelementptr inbounds [2 x i8]* %888, i32 0, i64 %883
  %890 = load i8* %889, align 1
  %891 = sext i8 %890 to i32
  %892 = and i32 %891, 1
  %893 = trunc i32 %892 to i8
  store i8 %893, i8* %889, align 1
  %894 = sext i32 %1 to i64
  %895 = getelementptr inbounds [2 x i64]* getelementptr inbounds ([2 x [2 x i64]]* @castle_random, i32 0, i64 1), i32 0, i64 %894
  %896 = load i64* %895, align 8
  %897 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 0
  %898 = getelementptr inbounds %struct.POSITION* %897, i32 0, i32 1
  %899 = load i64* %898, align 8
  %900 = xor i64 %899, %896
  store i64 %900, i64* %898, align 8
  br label %938

; <label>:901                                     ; preds = %870, %865
  %902 = sext i32 %1 to i64
  %903 = getelementptr inbounds [2 x i32]* @rook_H, i32 0, i64 %902
  %904 = load i32* %903, align 4
  %905 = icmp eq i32 %to.3, %904
  br i1 %905, label %906, label %937

; <label>:906                                     ; preds = %901
  %907 = sext i32 %1 to i64
  %908 = add nsw i32 %ply, 1
  %909 = sext i32 %908 to i64
  %910 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 8
  %911 = getelementptr inbounds [67 x %struct.SEARCH_POSITION]* %910, i32 0, i64 %909
  %912 = getelementptr inbounds %struct.SEARCH_POSITION* %911, i32 0, i32 1
  %913 = getelementptr inbounds [2 x i8]* %912, i32 0, i64 %907
  %914 = load i8* %913, align 1
  %915 = sext i8 %914 to i32
  %916 = and i32 %915, 1
  %917 = icmp ne i32 %916, 0
  br i1 %917, label %918, label %937

; <label>:918                                     ; preds = %906
  %919 = sext i32 %1 to i64
  %920 = add nsw i32 %ply, 1
  %921 = sext i32 %920 to i64
  %922 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 8
  %923 = getelementptr inbounds [67 x %struct.SEARCH_POSITION]* %922, i32 0, i64 %921
  %924 = getelementptr inbounds %struct.SEARCH_POSITION* %923, i32 0, i32 1
  %925 = getelementptr inbounds [2 x i8]* %924, i32 0, i64 %919
  %926 = load i8* %925, align 1
  %927 = sext i8 %926 to i32
  %928 = and i32 %927, 2
  %929 = trunc i32 %928 to i8
  store i8 %929, i8* %925, align 1
  %930 = sext i32 %1 to i64
  %931 = getelementptr inbounds [2 x i64]* getelementptr inbounds ([2 x [2 x i64]]* @castle_random, i32 0, i64 0), i32 0, i64 %930
  %932 = load i64* %931, align 8
  %933 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 0
  %934 = getelementptr inbounds %struct.POSITION* %933, i32 0, i32 1
  %935 = load i64* %934, align 8
  %936 = xor i64 %935, %932
  store i64 %936, i64* %934, align 8
  br label %937

; <label>:937                                     ; preds = %918, %906, %901
  br label %938

; <label>:938                                     ; preds = %937, %882
  br label %939

; <label>:939                                     ; preds = %938, %854
  %940 = sext i32 %1 to i64
  %941 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 0
  %942 = getelementptr inbounds %struct.POSITION* %941, i32 0, i32 7
  %943 = getelementptr inbounds [2 x i8]* %942, i32 0, i64 %940
  %944 = load i8* %943, align 1
  %945 = add i8 %944, -1
  store i8 %945, i8* %943, align 1
  br label %956

; <label>:946                                     ; preds = %828
  %947 = sext i32 %1 to i64
  %948 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 0
  %949 = getelementptr inbounds %struct.POSITION* %948, i32 0, i32 7
  %950 = getelementptr inbounds [2 x i8]* %949, i32 0, i64 %947
  %951 = load i8* %950, align 1
  %952 = sext i8 %951 to i32
  %953 = sub nsw i32 %952, 2
  %954 = trunc i32 %953 to i8
  store i8 %954, i8* %950, align 1
  br label %956

; <label>:955                                     ; preds = %828
  br label %956

; <label>:956                                     ; preds = %955, %946, %939, %847, %840, %829, %828
  br label %957

; <label>:957                                     ; preds = %956, %735
  ret void
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

; Function Attrs: nounwind uwtable
define void @MakeMoveRoot(%struct.tree* %tree, i32 %move, i32 %wtm) #0 {
  %1 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 0
  %2 = getelementptr inbounds %struct.POSITION* %1, i32 0, i32 1
  %3 = load i64* %2, align 8
  %4 = sext i32 %wtm to i64
  %5 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 12
  %6 = getelementptr inbounds [2 x i32]* %5, i32 0, i64 %4
  %7 = load i32* %6, align 4
  %8 = add nsw i32 %7, 1
  store i32 %8, i32* %6, align 4
  %9 = sext i32 %7 to i64
  %10 = sext i32 %wtm to i64
  %11 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 2
  %12 = getelementptr inbounds [2 x [128 x i64]]* %11, i32 0, i64 %10
  %13 = getelementptr inbounds [128 x i64]* %12, i32 0, i64 %9
  store i64 %3, i64* %13, align 8
  call void @MakeMove(%struct.tree* %tree, i32 0, i32 %move, i32 %wtm)
  br label %14

; <label>:14                                      ; preds = %53, %0
  %side.0 = phi i32 [ 0, %0 ], [ %54, %53 ]
  %15 = icmp sle i32 %side.0, 1
  br i1 %15, label %16, label %55

; <label>:16                                      ; preds = %14
  %17 = sext i32 %side.0 to i64
  %18 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 8
  %19 = getelementptr inbounds [67 x %struct.SEARCH_POSITION]* %18, i32 0, i64 1
  %20 = getelementptr inbounds %struct.SEARCH_POSITION* %19, i32 0, i32 1
  %21 = getelementptr inbounds [2 x i8]* %20, i32 0, i64 %17
  %22 = load i8* %21, align 1
  %23 = sext i8 %22 to i32
  %24 = icmp sgt i32 0, %23
  br i1 %24, label %25, label %26

; <label>:25                                      ; preds = %16
  br label %34

; <label>:26                                      ; preds = %16
  %27 = sext i32 %side.0 to i64
  %28 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 8
  %29 = getelementptr inbounds [67 x %struct.SEARCH_POSITION]* %28, i32 0, i64 1
  %30 = getelementptr inbounds %struct.SEARCH_POSITION* %29, i32 0, i32 1
  %31 = getelementptr inbounds [2 x i8]* %30, i32 0, i64 %27
  %32 = load i8* %31, align 1
  %33 = sext i8 %32 to i32
  br label %34

; <label>:34                                      ; preds = %26, %25
  %35 = phi i32 [ 0, %25 ], [ %33, %26 ]
  %36 = trunc i32 %35 to i8
  %37 = sext i32 %side.0 to i64
  %38 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 8
  %39 = getelementptr inbounds [67 x %struct.SEARCH_POSITION]* %38, i32 0, i64 1
  %40 = getelementptr inbounds %struct.SEARCH_POSITION* %39, i32 0, i32 1
  %41 = getelementptr inbounds [2 x i8]* %40, i32 0, i64 %37
  store i8 %36, i8* %41, align 1
  %42 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 8
  %43 = getelementptr inbounds [67 x %struct.SEARCH_POSITION]* %42, i32 0, i64 1
  %44 = getelementptr inbounds %struct.SEARCH_POSITION* %43, i32 0, i32 2
  %45 = load i8* %44, align 1
  %46 = zext i8 %45 to i32
  %47 = icmp eq i32 %46, 0
  br i1 %47, label %48, label %52

; <label>:48                                      ; preds = %34
  %49 = sext i32 %side.0 to i64
  %50 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 12
  %51 = getelementptr inbounds [2 x i32]* %50, i32 0, i64 %49
  store i32 0, i32* %51, align 4
  br label %52

; <label>:52                                      ; preds = %48, %34
  br label %53

; <label>:53                                      ; preds = %52
  %54 = add nsw i32 %side.0, 1
  br label %14

; <label>:55                                      ; preds = %14
  %56 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 8
  %57 = getelementptr inbounds [67 x %struct.SEARCH_POSITION]* %56, i32 0, i64 0
  %58 = getelementptr inbounds %struct.tree* %tree, i32 0, i32 8
  %59 = getelementptr inbounds [67 x %struct.SEARCH_POSITION]* %58, i32 0, i64 1
  %60 = bitcast %struct.SEARCH_POSITION* %57 to i8*
  %61 = bitcast %struct.SEARCH_POSITION* %59 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %60, i8* %61, i64 4, i32 1, i1 false)
  ret void
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
