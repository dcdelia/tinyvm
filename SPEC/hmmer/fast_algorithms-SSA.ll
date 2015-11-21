; ModuleID = 'fast_algorithms.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.plan7_s = type { i8*, i8*, i8*, i8*, i8*, i8*, i8*, i32, i8*, i32*, i32, i32*, i32*, i32*, float, float, float, float, float, float, i32, float**, float**, float**, float, [4 x [2 x float]], float*, float*, [20 x float], float, i32**, i32**, i32**, [4 x [2 x i32]], i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32**, i32**, i32, i32, float, float, i32 }
%struct.dpmatrix_s = type { i32**, i32**, i32**, i32**, i8*, i8*, i8*, i8*, i32, i32, i32, i32 }
%struct.p7trace_s = type { i32, i8*, i32*, i32* }

; Function Attrs: nounwind uwtable
define float @P7Viterbi(i8* %dsq, i32 %L, %struct.plan7_s* %hmm, %struct.dpmatrix_s* %mx, %struct.p7trace_s** %ret_tr) #0 {
  %tr = alloca %struct.p7trace_s*, align 8
  %xmx = alloca i32**, align 8
  %mmx = alloca i32**, align 8
  %imx = alloca i32**, align 8
  %dmx = alloca i32**, align 8
  %1 = getelementptr inbounds %struct.plan7_s* %hmm, i32 0, i32 20
  %2 = load i32* %1, align 4
  call void @ResizePlan7Matrix(%struct.dpmatrix_s* %mx, i32 %L, i32 %2, i32*** %xmx, i32*** %mmx, i32*** %imx, i32*** %dmx)
  %3 = load i32*** %xmx, align 8
  %4 = getelementptr inbounds i32** %3, i64 0
  %5 = load i32** %4, align 8
  %6 = getelementptr inbounds i32* %5, i64 4
  store i32 0, i32* %6, align 4
  %7 = getelementptr inbounds %struct.plan7_s* %hmm, i32 0, i32 33
  %8 = getelementptr inbounds [4 x [2 x i32]]* %7, i32 0, i64 0
  %9 = getelementptr inbounds [2 x i32]* %8, i32 0, i64 0
  %10 = load i32* %9, align 4
  %11 = load i32*** %xmx, align 8
  %12 = getelementptr inbounds i32** %11, i64 0
  %13 = load i32** %12, align 8
  %14 = getelementptr inbounds i32* %13, i64 0
  store i32 %10, i32* %14, align 4
  %15 = load i32*** %xmx, align 8
  %16 = getelementptr inbounds i32** %15, i64 0
  %17 = load i32** %16, align 8
  %18 = getelementptr inbounds i32* %17, i64 3
  store i32 -987654321, i32* %18, align 4
  %19 = load i32*** %xmx, align 8
  %20 = getelementptr inbounds i32** %19, i64 0
  %21 = load i32** %20, align 8
  %22 = getelementptr inbounds i32* %21, i64 2
  store i32 -987654321, i32* %22, align 4
  %23 = load i32*** %xmx, align 8
  %24 = getelementptr inbounds i32** %23, i64 0
  %25 = load i32** %24, align 8
  %26 = getelementptr inbounds i32* %25, i64 1
  store i32 -987654321, i32* %26, align 4
  br label %27

; <label>:27                                      ; preds = %47, %0
  %k.0 = phi i32 [ 0, %0 ], [ %48, %47 ]
  %28 = getelementptr inbounds %struct.plan7_s* %hmm, i32 0, i32 20
  %29 = load i32* %28, align 4
  %30 = icmp sle i32 %k.0, %29
  br i1 %30, label %31, label %49

; <label>:31                                      ; preds = %27
  %32 = sext i32 %k.0 to i64
  %33 = load i32*** %dmx, align 8
  %34 = getelementptr inbounds i32** %33, i64 0
  %35 = load i32** %34, align 8
  %36 = getelementptr inbounds i32* %35, i64 %32
  store i32 -987654321, i32* %36, align 4
  %37 = sext i32 %k.0 to i64
  %38 = load i32*** %imx, align 8
  %39 = getelementptr inbounds i32** %38, i64 0
  %40 = load i32** %39, align 8
  %41 = getelementptr inbounds i32* %40, i64 %37
  store i32 -987654321, i32* %41, align 4
  %42 = sext i32 %k.0 to i64
  %43 = load i32*** %mmx, align 8
  %44 = getelementptr inbounds i32** %43, i64 0
  %45 = load i32** %44, align 8
  %46 = getelementptr inbounds i32* %45, i64 %42
  store i32 -987654321, i32* %46, align 4
  br label %47

; <label>:47                                      ; preds = %31
  %48 = add nsw i32 %k.0, 1
  br label %27

; <label>:49                                      ; preds = %27
  %50 = getelementptr inbounds %struct.plan7_s* %hmm, i32 0, i32 20
  %51 = load i32* %50, align 4
  %52 = getelementptr inbounds %struct.plan7_s* %hmm, i32 0, i32 30
  %53 = load i32*** %52, align 8
  %54 = getelementptr inbounds i32** %53, i64 0
  %55 = load i32** %54, align 8
  %56 = getelementptr inbounds %struct.plan7_s* %hmm, i32 0, i32 30
  %57 = load i32*** %56, align 8
  %58 = getelementptr inbounds i32** %57, i64 3
  %59 = load i32** %58, align 8
  %60 = getelementptr inbounds %struct.plan7_s* %hmm, i32 0, i32 30
  %61 = load i32*** %60, align 8
  %62 = getelementptr inbounds i32** %61, i64 5
  %63 = load i32** %62, align 8
  %64 = getelementptr inbounds %struct.plan7_s* %hmm, i32 0, i32 30
  %65 = load i32*** %64, align 8
  %66 = getelementptr inbounds i32** %65, i64 2
  %67 = load i32** %66, align 8
  %68 = getelementptr inbounds %struct.plan7_s* %hmm, i32 0, i32 30
  %69 = load i32*** %68, align 8
  %70 = getelementptr inbounds i32** %69, i64 6
  %71 = load i32** %70, align 8
  %72 = getelementptr inbounds %struct.plan7_s* %hmm, i32 0, i32 30
  %73 = load i32*** %72, align 8
  %74 = getelementptr inbounds i32** %73, i64 1
  %75 = load i32** %74, align 8
  %76 = getelementptr inbounds %struct.plan7_s* %hmm, i32 0, i32 30
  %77 = load i32*** %76, align 8
  %78 = getelementptr inbounds i32** %77, i64 4
  %79 = load i32** %78, align 8
  %80 = getelementptr inbounds %struct.plan7_s* %hmm, i32 0, i32 34
  %81 = load i32** %80, align 8
  br label %82

; <label>:82                                      ; preds = %499, %49
  %i.0 = phi i32 [ 1, %49 ], [ %500, %499 ]
  %83 = icmp sle i32 %i.0, %L
  br i1 %83, label %84, label %501

; <label>:84                                      ; preds = %82
  %85 = sext i32 %i.0 to i64
  %86 = load i32*** %mmx, align 8
  %87 = getelementptr inbounds i32** %86, i64 %85
  %88 = load i32** %87, align 8
  %89 = sext i32 %i.0 to i64
  %90 = load i32*** %dmx, align 8
  %91 = getelementptr inbounds i32** %90, i64 %89
  %92 = load i32** %91, align 8
  %93 = sext i32 %i.0 to i64
  %94 = load i32*** %imx, align 8
  %95 = getelementptr inbounds i32** %94, i64 %93
  %96 = load i32** %95, align 8
  %97 = sub nsw i32 %i.0, 1
  %98 = sext i32 %97 to i64
  %99 = load i32*** %mmx, align 8
  %100 = getelementptr inbounds i32** %99, i64 %98
  %101 = load i32** %100, align 8
  %102 = sub nsw i32 %i.0, 1
  %103 = sext i32 %102 to i64
  %104 = load i32*** %dmx, align 8
  %105 = getelementptr inbounds i32** %104, i64 %103
  %106 = load i32** %105, align 8
  %107 = sub nsw i32 %i.0, 1
  %108 = sext i32 %107 to i64
  %109 = load i32*** %imx, align 8
  %110 = getelementptr inbounds i32** %109, i64 %108
  %111 = load i32** %110, align 8
  %112 = sub nsw i32 %i.0, 1
  %113 = sext i32 %112 to i64
  %114 = load i32*** %xmx, align 8
  %115 = getelementptr inbounds i32** %114, i64 %113
  %116 = load i32** %115, align 8
  %117 = getelementptr inbounds i32* %116, i64 0
  %118 = load i32* %117, align 4
  %119 = sext i32 %i.0 to i64
  %120 = getelementptr inbounds i8* %dsq, i64 %119
  %121 = load i8* %120, align 1
  %122 = sext i8 %121 to i32
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds %struct.plan7_s* %hmm, i32 0, i32 31
  %125 = load i32*** %124, align 8
  %126 = getelementptr inbounds i32** %125, i64 %123
  %127 = load i32** %126, align 8
  %128 = sext i32 %i.0 to i64
  %129 = getelementptr inbounds i8* %dsq, i64 %128
  %130 = load i8* %129, align 1
  %131 = sext i8 %130 to i32
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds %struct.plan7_s* %hmm, i32 0, i32 32
  %134 = load i32*** %133, align 8
  %135 = getelementptr inbounds i32** %134, i64 %132
  %136 = load i32** %135, align 8
  %137 = getelementptr inbounds i32* %88, i64 0
  store i32 -987654321, i32* %137, align 4
  %138 = getelementptr inbounds i32* %92, i64 0
  store i32 -987654321, i32* %138, align 4
  %139 = getelementptr inbounds i32* %96, i64 0
  store i32 -987654321, i32* %139, align 4
  br label %140

; <label>:140                                     ; preds = %293, %84
  %k.1 = phi i32 [ 1, %84 ], [ %294, %293 ]
  %141 = icmp sle i32 %k.1, %51
  br i1 %141, label %142, label %295

; <label>:142                                     ; preds = %140
  %143 = sub nsw i32 %k.1, 1
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds i32* %101, i64 %144
  %146 = load i32* %145, align 4
  %147 = sub nsw i32 %k.1, 1
  %148 = sext i32 %147 to i64
  %149 = getelementptr inbounds i32* %55, i64 %148
  %150 = load i32* %149, align 4
  %151 = add nsw i32 %146, %150
  %152 = sext i32 %k.1 to i64
  %153 = getelementptr inbounds i32* %88, i64 %152
  store i32 %151, i32* %153, align 4
  %154 = sub nsw i32 %k.1, 1
  %155 = sext i32 %154 to i64
  %156 = getelementptr inbounds i32* %111, i64 %155
  %157 = load i32* %156, align 4
  %158 = sub nsw i32 %k.1, 1
  %159 = sext i32 %158 to i64
  %160 = getelementptr inbounds i32* %59, i64 %159
  %161 = load i32* %160, align 4
  %162 = add nsw i32 %157, %161
  %163 = sext i32 %k.1 to i64
  %164 = getelementptr inbounds i32* %88, i64 %163
  %165 = load i32* %164, align 4
  %166 = icmp sgt i32 %162, %165
  br i1 %166, label %167, label %170

; <label>:167                                     ; preds = %142
  %168 = sext i32 %k.1 to i64
  %169 = getelementptr inbounds i32* %88, i64 %168
  store i32 %162, i32* %169, align 4
  br label %170

; <label>:170                                     ; preds = %167, %142
  %171 = sub nsw i32 %k.1, 1
  %172 = sext i32 %171 to i64
  %173 = getelementptr inbounds i32* %106, i64 %172
  %174 = load i32* %173, align 4
  %175 = sub nsw i32 %k.1, 1
  %176 = sext i32 %175 to i64
  %177 = getelementptr inbounds i32* %63, i64 %176
  %178 = load i32* %177, align 4
  %179 = add nsw i32 %174, %178
  %180 = sext i32 %k.1 to i64
  %181 = getelementptr inbounds i32* %88, i64 %180
  %182 = load i32* %181, align 4
  %183 = icmp sgt i32 %179, %182
  br i1 %183, label %184, label %187

; <label>:184                                     ; preds = %170
  %185 = sext i32 %k.1 to i64
  %186 = getelementptr inbounds i32* %88, i64 %185
  store i32 %179, i32* %186, align 4
  br label %187

; <label>:187                                     ; preds = %184, %170
  %188 = sext i32 %k.1 to i64
  %189 = getelementptr inbounds i32* %81, i64 %188
  %190 = load i32* %189, align 4
  %191 = add nsw i32 %118, %190
  %192 = sext i32 %k.1 to i64
  %193 = getelementptr inbounds i32* %88, i64 %192
  %194 = load i32* %193, align 4
  %195 = icmp sgt i32 %191, %194
  br i1 %195, label %196, label %199

; <label>:196                                     ; preds = %187
  %197 = sext i32 %k.1 to i64
  %198 = getelementptr inbounds i32* %88, i64 %197
  store i32 %191, i32* %198, align 4
  br label %199

; <label>:199                                     ; preds = %196, %187
  %200 = sext i32 %k.1 to i64
  %201 = getelementptr inbounds i32* %127, i64 %200
  %202 = load i32* %201, align 4
  %203 = sext i32 %k.1 to i64
  %204 = getelementptr inbounds i32* %88, i64 %203
  %205 = load i32* %204, align 4
  %206 = add nsw i32 %205, %202
  store i32 %206, i32* %204, align 4
  %207 = sext i32 %k.1 to i64
  %208 = getelementptr inbounds i32* %88, i64 %207
  %209 = load i32* %208, align 4
  %210 = icmp slt i32 %209, -987654321
  br i1 %210, label %211, label %214

; <label>:211                                     ; preds = %199
  %212 = sext i32 %k.1 to i64
  %213 = getelementptr inbounds i32* %88, i64 %212
  store i32 -987654321, i32* %213, align 4
  br label %214

; <label>:214                                     ; preds = %211, %199
  %215 = sub nsw i32 %k.1, 1
  %216 = sext i32 %215 to i64
  %217 = getelementptr inbounds i32* %92, i64 %216
  %218 = load i32* %217, align 4
  %219 = sub nsw i32 %k.1, 1
  %220 = sext i32 %219 to i64
  %221 = getelementptr inbounds i32* %71, i64 %220
  %222 = load i32* %221, align 4
  %223 = add nsw i32 %218, %222
  %224 = sext i32 %k.1 to i64
  %225 = getelementptr inbounds i32* %92, i64 %224
  store i32 %223, i32* %225, align 4
  %226 = sub nsw i32 %k.1, 1
  %227 = sext i32 %226 to i64
  %228 = getelementptr inbounds i32* %88, i64 %227
  %229 = load i32* %228, align 4
  %230 = sub nsw i32 %k.1, 1
  %231 = sext i32 %230 to i64
  %232 = getelementptr inbounds i32* %67, i64 %231
  %233 = load i32* %232, align 4
  %234 = add nsw i32 %229, %233
  %235 = sext i32 %k.1 to i64
  %236 = getelementptr inbounds i32* %92, i64 %235
  %237 = load i32* %236, align 4
  %238 = icmp sgt i32 %234, %237
  br i1 %238, label %239, label %242

; <label>:239                                     ; preds = %214
  %240 = sext i32 %k.1 to i64
  %241 = getelementptr inbounds i32* %92, i64 %240
  store i32 %234, i32* %241, align 4
  br label %242

; <label>:242                                     ; preds = %239, %214
  %243 = sext i32 %k.1 to i64
  %244 = getelementptr inbounds i32* %92, i64 %243
  %245 = load i32* %244, align 4
  %246 = icmp slt i32 %245, -987654321
  br i1 %246, label %247, label %250

; <label>:247                                     ; preds = %242
  %248 = sext i32 %k.1 to i64
  %249 = getelementptr inbounds i32* %92, i64 %248
  store i32 -987654321, i32* %249, align 4
  br label %250

; <label>:250                                     ; preds = %247, %242
  %251 = icmp slt i32 %k.1, %51
  br i1 %251, label %252, label %292

; <label>:252                                     ; preds = %250
  %253 = sext i32 %k.1 to i64
  %254 = getelementptr inbounds i32* %101, i64 %253
  %255 = load i32* %254, align 4
  %256 = sext i32 %k.1 to i64
  %257 = getelementptr inbounds i32* %75, i64 %256
  %258 = load i32* %257, align 4
  %259 = add nsw i32 %255, %258
  %260 = sext i32 %k.1 to i64
  %261 = getelementptr inbounds i32* %96, i64 %260
  store i32 %259, i32* %261, align 4
  %262 = sext i32 %k.1 to i64
  %263 = getelementptr inbounds i32* %111, i64 %262
  %264 = load i32* %263, align 4
  %265 = sext i32 %k.1 to i64
  %266 = getelementptr inbounds i32* %79, i64 %265
  %267 = load i32* %266, align 4
  %268 = add nsw i32 %264, %267
  %269 = sext i32 %k.1 to i64
  %270 = getelementptr inbounds i32* %96, i64 %269
  %271 = load i32* %270, align 4
  %272 = icmp sgt i32 %268, %271
  br i1 %272, label %273, label %276

; <label>:273                                     ; preds = %252
  %274 = sext i32 %k.1 to i64
  %275 = getelementptr inbounds i32* %96, i64 %274
  store i32 %268, i32* %275, align 4
  br label %276

; <label>:276                                     ; preds = %273, %252
  %277 = sext i32 %k.1 to i64
  %278 = getelementptr inbounds i32* %136, i64 %277
  %279 = load i32* %278, align 4
  %280 = sext i32 %k.1 to i64
  %281 = getelementptr inbounds i32* %96, i64 %280
  %282 = load i32* %281, align 4
  %283 = add nsw i32 %282, %279
  store i32 %283, i32* %281, align 4
  %284 = sext i32 %k.1 to i64
  %285 = getelementptr inbounds i32* %96, i64 %284
  %286 = load i32* %285, align 4
  %287 = icmp slt i32 %286, -987654321
  br i1 %287, label %288, label %291

; <label>:288                                     ; preds = %276
  %289 = sext i32 %k.1 to i64
  %290 = getelementptr inbounds i32* %96, i64 %289
  store i32 -987654321, i32* %290, align 4
  br label %291

; <label>:291                                     ; preds = %288, %276
  br label %292

; <label>:292                                     ; preds = %291, %250
  br label %293

; <label>:293                                     ; preds = %292
  %294 = add nsw i32 %k.1, 1
  br label %140

; <label>:295                                     ; preds = %140
  %296 = sext i32 %i.0 to i64
  %297 = load i32*** %xmx, align 8
  %298 = getelementptr inbounds i32** %297, i64 %296
  %299 = load i32** %298, align 8
  %300 = getelementptr inbounds i32* %299, i64 4
  store i32 -987654321, i32* %300, align 4
  %301 = sub nsw i32 %i.0, 1
  %302 = sext i32 %301 to i64
  %303 = load i32*** %xmx, align 8
  %304 = getelementptr inbounds i32** %303, i64 %302
  %305 = load i32** %304, align 8
  %306 = getelementptr inbounds i32* %305, i64 4
  %307 = load i32* %306, align 4
  %308 = getelementptr inbounds %struct.plan7_s* %hmm, i32 0, i32 33
  %309 = getelementptr inbounds [4 x [2 x i32]]* %308, i32 0, i64 0
  %310 = getelementptr inbounds [2 x i32]* %309, i32 0, i64 1
  %311 = load i32* %310, align 4
  %312 = add nsw i32 %307, %311
  %313 = icmp sgt i32 %312, -987654321
  br i1 %313, label %314, label %320

; <label>:314                                     ; preds = %295
  %315 = sext i32 %i.0 to i64
  %316 = load i32*** %xmx, align 8
  %317 = getelementptr inbounds i32** %316, i64 %315
  %318 = load i32** %317, align 8
  %319 = getelementptr inbounds i32* %318, i64 4
  store i32 %312, i32* %319, align 4
  br label %320

; <label>:320                                     ; preds = %314, %295
  %321 = sext i32 %i.0 to i64
  %322 = load i32*** %mmx, align 8
  %323 = getelementptr inbounds i32** %322, i64 %321
  %324 = load i32** %323, align 8
  %325 = getelementptr inbounds %struct.plan7_s* %hmm, i32 0, i32 35
  %326 = load i32** %325, align 8
  br label %327

; <label>:327                                     ; preds = %342, %320
  %k.2 = phi i32 [ 1, %320 ], [ %343, %342 ]
  %xme.0 = phi i32 [ -987654321, %320 ], [ %xme.1, %342 ]
  %328 = getelementptr inbounds %struct.plan7_s* %hmm, i32 0, i32 20
  %329 = load i32* %328, align 4
  %330 = icmp sle i32 %k.2, %329
  br i1 %330, label %331, label %344

; <label>:331                                     ; preds = %327
  %332 = sext i32 %k.2 to i64
  %333 = getelementptr inbounds i32* %324, i64 %332
  %334 = load i32* %333, align 4
  %335 = sext i32 %k.2 to i64
  %336 = getelementptr inbounds i32* %326, i64 %335
  %337 = load i32* %336, align 4
  %338 = add nsw i32 %334, %337
  %339 = icmp sgt i32 %338, %xme.0
  br i1 %339, label %340, label %341

; <label>:340                                     ; preds = %331
  br label %341

; <label>:341                                     ; preds = %340, %331
  %xme.1 = phi i32 [ %338, %340 ], [ %xme.0, %331 ]
  br label %342

; <label>:342                                     ; preds = %341
  %343 = add nsw i32 %k.2, 1
  br label %327

; <label>:344                                     ; preds = %327
  %345 = sext i32 %i.0 to i64
  %346 = load i32*** %xmx, align 8
  %347 = getelementptr inbounds i32** %346, i64 %345
  %348 = load i32** %347, align 8
  %349 = getelementptr inbounds i32* %348, i64 1
  store i32 %xme.0, i32* %349, align 4
  %350 = sext i32 %i.0 to i64
  %351 = load i32*** %xmx, align 8
  %352 = getelementptr inbounds i32** %351, i64 %350
  %353 = load i32** %352, align 8
  %354 = getelementptr inbounds i32* %353, i64 3
  store i32 -987654321, i32* %354, align 4
  %355 = sub nsw i32 %i.0, 1
  %356 = sext i32 %355 to i64
  %357 = load i32*** %xmx, align 8
  %358 = getelementptr inbounds i32** %357, i64 %356
  %359 = load i32** %358, align 8
  %360 = getelementptr inbounds i32* %359, i64 3
  %361 = load i32* %360, align 4
  %362 = getelementptr inbounds %struct.plan7_s* %hmm, i32 0, i32 33
  %363 = getelementptr inbounds [4 x [2 x i32]]* %362, i32 0, i64 3
  %364 = getelementptr inbounds [2 x i32]* %363, i32 0, i64 1
  %365 = load i32* %364, align 4
  %366 = add nsw i32 %361, %365
  %367 = icmp sgt i32 %366, -987654321
  br i1 %367, label %368, label %374

; <label>:368                                     ; preds = %344
  %369 = sext i32 %i.0 to i64
  %370 = load i32*** %xmx, align 8
  %371 = getelementptr inbounds i32** %370, i64 %369
  %372 = load i32** %371, align 8
  %373 = getelementptr inbounds i32* %372, i64 3
  store i32 %366, i32* %373, align 4
  br label %374

; <label>:374                                     ; preds = %368, %344
  %375 = sext i32 %i.0 to i64
  %376 = load i32*** %xmx, align 8
  %377 = getelementptr inbounds i32** %376, i64 %375
  %378 = load i32** %377, align 8
  %379 = getelementptr inbounds i32* %378, i64 1
  %380 = load i32* %379, align 4
  %381 = getelementptr inbounds %struct.plan7_s* %hmm, i32 0, i32 33
  %382 = getelementptr inbounds [4 x [2 x i32]]* %381, i32 0, i64 1
  %383 = getelementptr inbounds [2 x i32]* %382, i32 0, i64 1
  %384 = load i32* %383, align 4
  %385 = add nsw i32 %380, %384
  %386 = sext i32 %i.0 to i64
  %387 = load i32*** %xmx, align 8
  %388 = getelementptr inbounds i32** %387, i64 %386
  %389 = load i32** %388, align 8
  %390 = getelementptr inbounds i32* %389, i64 3
  %391 = load i32* %390, align 4
  %392 = icmp sgt i32 %385, %391
  br i1 %392, label %393, label %399

; <label>:393                                     ; preds = %374
  %394 = sext i32 %i.0 to i64
  %395 = load i32*** %xmx, align 8
  %396 = getelementptr inbounds i32** %395, i64 %394
  %397 = load i32** %396, align 8
  %398 = getelementptr inbounds i32* %397, i64 3
  store i32 %385, i32* %398, align 4
  br label %399

; <label>:399                                     ; preds = %393, %374
  %400 = sext i32 %i.0 to i64
  %401 = load i32*** %xmx, align 8
  %402 = getelementptr inbounds i32** %401, i64 %400
  %403 = load i32** %402, align 8
  %404 = getelementptr inbounds i32* %403, i64 0
  store i32 -987654321, i32* %404, align 4
  %405 = sext i32 %i.0 to i64
  %406 = load i32*** %xmx, align 8
  %407 = getelementptr inbounds i32** %406, i64 %405
  %408 = load i32** %407, align 8
  %409 = getelementptr inbounds i32* %408, i64 4
  %410 = load i32* %409, align 4
  %411 = getelementptr inbounds %struct.plan7_s* %hmm, i32 0, i32 33
  %412 = getelementptr inbounds [4 x [2 x i32]]* %411, i32 0, i64 0
  %413 = getelementptr inbounds [2 x i32]* %412, i32 0, i64 0
  %414 = load i32* %413, align 4
  %415 = add nsw i32 %410, %414
  %416 = icmp sgt i32 %415, -987654321
  br i1 %416, label %417, label %423

; <label>:417                                     ; preds = %399
  %418 = sext i32 %i.0 to i64
  %419 = load i32*** %xmx, align 8
  %420 = getelementptr inbounds i32** %419, i64 %418
  %421 = load i32** %420, align 8
  %422 = getelementptr inbounds i32* %421, i64 0
  store i32 %415, i32* %422, align 4
  br label %423

; <label>:423                                     ; preds = %417, %399
  %424 = sext i32 %i.0 to i64
  %425 = load i32*** %xmx, align 8
  %426 = getelementptr inbounds i32** %425, i64 %424
  %427 = load i32** %426, align 8
  %428 = getelementptr inbounds i32* %427, i64 3
  %429 = load i32* %428, align 4
  %430 = getelementptr inbounds %struct.plan7_s* %hmm, i32 0, i32 33
  %431 = getelementptr inbounds [4 x [2 x i32]]* %430, i32 0, i64 3
  %432 = getelementptr inbounds [2 x i32]* %431, i32 0, i64 0
  %433 = load i32* %432, align 4
  %434 = add nsw i32 %429, %433
  %435 = sext i32 %i.0 to i64
  %436 = load i32*** %xmx, align 8
  %437 = getelementptr inbounds i32** %436, i64 %435
  %438 = load i32** %437, align 8
  %439 = getelementptr inbounds i32* %438, i64 0
  %440 = load i32* %439, align 4
  %441 = icmp sgt i32 %434, %440
  br i1 %441, label %442, label %448

; <label>:442                                     ; preds = %423
  %443 = sext i32 %i.0 to i64
  %444 = load i32*** %xmx, align 8
  %445 = getelementptr inbounds i32** %444, i64 %443
  %446 = load i32** %445, align 8
  %447 = getelementptr inbounds i32* %446, i64 0
  store i32 %434, i32* %447, align 4
  br label %448

; <label>:448                                     ; preds = %442, %423
  %449 = sext i32 %i.0 to i64
  %450 = load i32*** %xmx, align 8
  %451 = getelementptr inbounds i32** %450, i64 %449
  %452 = load i32** %451, align 8
  %453 = getelementptr inbounds i32* %452, i64 2
  store i32 -987654321, i32* %453, align 4
  %454 = sub nsw i32 %i.0, 1
  %455 = sext i32 %454 to i64
  %456 = load i32*** %xmx, align 8
  %457 = getelementptr inbounds i32** %456, i64 %455
  %458 = load i32** %457, align 8
  %459 = getelementptr inbounds i32* %458, i64 2
  %460 = load i32* %459, align 4
  %461 = getelementptr inbounds %struct.plan7_s* %hmm, i32 0, i32 33
  %462 = getelementptr inbounds [4 x [2 x i32]]* %461, i32 0, i64 2
  %463 = getelementptr inbounds [2 x i32]* %462, i32 0, i64 1
  %464 = load i32* %463, align 4
  %465 = add nsw i32 %460, %464
  %466 = icmp sgt i32 %465, -987654321
  br i1 %466, label %467, label %473

; <label>:467                                     ; preds = %448
  %468 = sext i32 %i.0 to i64
  %469 = load i32*** %xmx, align 8
  %470 = getelementptr inbounds i32** %469, i64 %468
  %471 = load i32** %470, align 8
  %472 = getelementptr inbounds i32* %471, i64 2
  store i32 %465, i32* %472, align 4
  br label %473

; <label>:473                                     ; preds = %467, %448
  %474 = sext i32 %i.0 to i64
  %475 = load i32*** %xmx, align 8
  %476 = getelementptr inbounds i32** %475, i64 %474
  %477 = load i32** %476, align 8
  %478 = getelementptr inbounds i32* %477, i64 1
  %479 = load i32* %478, align 4
  %480 = getelementptr inbounds %struct.plan7_s* %hmm, i32 0, i32 33
  %481 = getelementptr inbounds [4 x [2 x i32]]* %480, i32 0, i64 1
  %482 = getelementptr inbounds [2 x i32]* %481, i32 0, i64 0
  %483 = load i32* %482, align 4
  %484 = add nsw i32 %479, %483
  %485 = sext i32 %i.0 to i64
  %486 = load i32*** %xmx, align 8
  %487 = getelementptr inbounds i32** %486, i64 %485
  %488 = load i32** %487, align 8
  %489 = getelementptr inbounds i32* %488, i64 2
  %490 = load i32* %489, align 4
  %491 = icmp sgt i32 %484, %490
  br i1 %491, label %492, label %498

; <label>:492                                     ; preds = %473
  %493 = sext i32 %i.0 to i64
  %494 = load i32*** %xmx, align 8
  %495 = getelementptr inbounds i32** %494, i64 %493
  %496 = load i32** %495, align 8
  %497 = getelementptr inbounds i32* %496, i64 2
  store i32 %484, i32* %497, align 4
  br label %498

; <label>:498                                     ; preds = %492, %473
  br label %499

; <label>:499                                     ; preds = %498
  %500 = add nsw i32 %i.0, 1
  br label %82

; <label>:501                                     ; preds = %82
  %502 = sext i32 %L to i64
  %503 = load i32*** %xmx, align 8
  %504 = getelementptr inbounds i32** %503, i64 %502
  %505 = load i32** %504, align 8
  %506 = getelementptr inbounds i32* %505, i64 2
  %507 = load i32* %506, align 4
  %508 = getelementptr inbounds %struct.plan7_s* %hmm, i32 0, i32 33
  %509 = getelementptr inbounds [4 x [2 x i32]]* %508, i32 0, i64 2
  %510 = getelementptr inbounds [2 x i32]* %509, i32 0, i64 0
  %511 = load i32* %510, align 4
  %512 = add nsw i32 %507, %511
  %513 = icmp ne %struct.p7trace_s** %ret_tr, null
  br i1 %513, label %514, label %516

; <label>:514                                     ; preds = %501
  call void @P7ViterbiTrace(%struct.plan7_s* %hmm, i8* %dsq, i32 %L, %struct.dpmatrix_s* %mx, %struct.p7trace_s** %tr)
  %515 = load %struct.p7trace_s** %tr, align 8
  store %struct.p7trace_s* %515, %struct.p7trace_s** %ret_tr, align 8
  br label %516

; <label>:516                                     ; preds = %514, %501
  %517 = call float @Scorify(i32 %512)
  ret float %517
}

declare void @ResizePlan7Matrix(%struct.dpmatrix_s*, i32, i32, i32***, i32***, i32***, i32***) #1

declare void @P7ViterbiTrace(%struct.plan7_s*, i8*, i32, %struct.dpmatrix_s*, %struct.p7trace_s**) #1

declare float @Scorify(i32) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
