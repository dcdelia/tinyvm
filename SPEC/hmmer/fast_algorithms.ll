; ModuleID = 'fast_algorithms.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.plan7_s = type { i8*, i8*, i8*, i8*, i8*, i8*, i8*, i32, i8*, i32*, i32, i32*, i32*, i32*, float, float, float, float, float, float, i32, float**, float**, float**, float, [4 x [2 x float]], float*, float*, [20 x float], float, i32**, i32**, i32**, [4 x [2 x i32]], i32*, i32*, i32*, i32*, i32*, i32*, i32*, i32**, i32**, i32, i32, float, float, i32 }
%struct.dpmatrix_s = type { i32**, i32**, i32**, i32**, i8*, i8*, i8*, i8*, i32, i32, i32, i32 }
%struct.p7trace_s = type { i32, i8*, i32*, i32* }

; Function Attrs: nounwind uwtable
define float @P7Viterbi(i8* %dsq, i32 %L, %struct.plan7_s* %hmm, %struct.dpmatrix_s* %mx, %struct.p7trace_s** %ret_tr) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i32, align 4
  %3 = alloca %struct.plan7_s*, align 8
  %4 = alloca %struct.dpmatrix_s*, align 8
  %5 = alloca %struct.p7trace_s**, align 8
  %tr = alloca %struct.p7trace_s*, align 8
  %xmx = alloca i32**, align 8
  %mmx = alloca i32**, align 8
  %imx = alloca i32**, align 8
  %dmx = alloca i32**, align 8
  %i = alloca i32, align 4
  %k = alloca i32, align 4
  %sc = alloca i32, align 4
  %mc = alloca i32*, align 8
  %dc = alloca i32*, align 8
  %ic = alloca i32*, align 8
  %ms = alloca i32*, align 8
  %is = alloca i32*, align 8
  %mpp = alloca i32*, align 8
  %mpc = alloca i32*, align 8
  %ip = alloca i32*, align 8
  %bp = alloca i32*, align 8
  %ep = alloca i32*, align 8
  %xmb = alloca i32, align 4
  %xme = alloca i32, align 4
  %dpp = alloca i32*, align 8
  %tpmm = alloca i32*, align 8
  %tpmi = alloca i32*, align 8
  %tpmd = alloca i32*, align 8
  %tpim = alloca i32*, align 8
  %tpii = alloca i32*, align 8
  %tpdm = alloca i32*, align 8
  %tpdd = alloca i32*, align 8
  %M = alloca i32, align 4
  store i8* %dsq, i8** %1, align 8
  store i32 %L, i32* %2, align 4
  store %struct.plan7_s* %hmm, %struct.plan7_s** %3, align 8
  store %struct.dpmatrix_s* %mx, %struct.dpmatrix_s** %4, align 8
  store %struct.p7trace_s** %ret_tr, %struct.p7trace_s*** %5, align 8
  %6 = load %struct.dpmatrix_s** %4, align 8
  %7 = load i32* %2, align 4
  %8 = load %struct.plan7_s** %3, align 8
  %9 = getelementptr inbounds %struct.plan7_s* %8, i32 0, i32 20
  %10 = load i32* %9, align 4
  call void @ResizePlan7Matrix(%struct.dpmatrix_s* %6, i32 %7, i32 %10, i32*** %xmx, i32*** %mmx, i32*** %imx, i32*** %dmx)
  %11 = load i32*** %xmx, align 8
  %12 = getelementptr inbounds i32** %11, i64 0
  %13 = load i32** %12, align 8
  %14 = getelementptr inbounds i32* %13, i64 4
  store i32 0, i32* %14, align 4
  %15 = load %struct.plan7_s** %3, align 8
  %16 = getelementptr inbounds %struct.plan7_s* %15, i32 0, i32 33
  %17 = getelementptr inbounds [4 x [2 x i32]]* %16, i32 0, i64 0
  %18 = getelementptr inbounds [2 x i32]* %17, i32 0, i64 0
  %19 = load i32* %18, align 4
  %20 = load i32*** %xmx, align 8
  %21 = getelementptr inbounds i32** %20, i64 0
  %22 = load i32** %21, align 8
  %23 = getelementptr inbounds i32* %22, i64 0
  store i32 %19, i32* %23, align 4
  %24 = load i32*** %xmx, align 8
  %25 = getelementptr inbounds i32** %24, i64 0
  %26 = load i32** %25, align 8
  %27 = getelementptr inbounds i32* %26, i64 3
  store i32 -987654321, i32* %27, align 4
  %28 = load i32*** %xmx, align 8
  %29 = getelementptr inbounds i32** %28, i64 0
  %30 = load i32** %29, align 8
  %31 = getelementptr inbounds i32* %30, i64 2
  store i32 -987654321, i32* %31, align 4
  %32 = load i32*** %xmx, align 8
  %33 = getelementptr inbounds i32** %32, i64 0
  %34 = load i32** %33, align 8
  %35 = getelementptr inbounds i32* %34, i64 1
  store i32 -987654321, i32* %35, align 4
  store i32 0, i32* %k, align 4
  br label %36

; <label>:36                                      ; preds = %61, %0
  %37 = load i32* %k, align 4
  %38 = load %struct.plan7_s** %3, align 8
  %39 = getelementptr inbounds %struct.plan7_s* %38, i32 0, i32 20
  %40 = load i32* %39, align 4
  %41 = icmp sle i32 %37, %40
  br i1 %41, label %42, label %64

; <label>:42                                      ; preds = %36
  %43 = load i32* %k, align 4
  %44 = sext i32 %43 to i64
  %45 = load i32*** %dmx, align 8
  %46 = getelementptr inbounds i32** %45, i64 0
  %47 = load i32** %46, align 8
  %48 = getelementptr inbounds i32* %47, i64 %44
  store i32 -987654321, i32* %48, align 4
  %49 = load i32* %k, align 4
  %50 = sext i32 %49 to i64
  %51 = load i32*** %imx, align 8
  %52 = getelementptr inbounds i32** %51, i64 0
  %53 = load i32** %52, align 8
  %54 = getelementptr inbounds i32* %53, i64 %50
  store i32 -987654321, i32* %54, align 4
  %55 = load i32* %k, align 4
  %56 = sext i32 %55 to i64
  %57 = load i32*** %mmx, align 8
  %58 = getelementptr inbounds i32** %57, i64 0
  %59 = load i32** %58, align 8
  %60 = getelementptr inbounds i32* %59, i64 %56
  store i32 -987654321, i32* %60, align 4
  br label %61

; <label>:61                                      ; preds = %42
  %62 = load i32* %k, align 4
  %63 = add nsw i32 %62, 1
  store i32 %63, i32* %k, align 4
  br label %36

; <label>:64                                      ; preds = %36
  %65 = load %struct.plan7_s** %3, align 8
  %66 = getelementptr inbounds %struct.plan7_s* %65, i32 0, i32 20
  %67 = load i32* %66, align 4
  store i32 %67, i32* %M, align 4
  %68 = load %struct.plan7_s** %3, align 8
  %69 = getelementptr inbounds %struct.plan7_s* %68, i32 0, i32 30
  %70 = load i32*** %69, align 8
  %71 = getelementptr inbounds i32** %70, i64 0
  %72 = load i32** %71, align 8
  store i32* %72, i32** %tpmm, align 8
  %73 = load %struct.plan7_s** %3, align 8
  %74 = getelementptr inbounds %struct.plan7_s* %73, i32 0, i32 30
  %75 = load i32*** %74, align 8
  %76 = getelementptr inbounds i32** %75, i64 3
  %77 = load i32** %76, align 8
  store i32* %77, i32** %tpim, align 8
  %78 = load %struct.plan7_s** %3, align 8
  %79 = getelementptr inbounds %struct.plan7_s* %78, i32 0, i32 30
  %80 = load i32*** %79, align 8
  %81 = getelementptr inbounds i32** %80, i64 5
  %82 = load i32** %81, align 8
  store i32* %82, i32** %tpdm, align 8
  %83 = load %struct.plan7_s** %3, align 8
  %84 = getelementptr inbounds %struct.plan7_s* %83, i32 0, i32 30
  %85 = load i32*** %84, align 8
  %86 = getelementptr inbounds i32** %85, i64 2
  %87 = load i32** %86, align 8
  store i32* %87, i32** %tpmd, align 8
  %88 = load %struct.plan7_s** %3, align 8
  %89 = getelementptr inbounds %struct.plan7_s* %88, i32 0, i32 30
  %90 = load i32*** %89, align 8
  %91 = getelementptr inbounds i32** %90, i64 6
  %92 = load i32** %91, align 8
  store i32* %92, i32** %tpdd, align 8
  %93 = load %struct.plan7_s** %3, align 8
  %94 = getelementptr inbounds %struct.plan7_s* %93, i32 0, i32 30
  %95 = load i32*** %94, align 8
  %96 = getelementptr inbounds i32** %95, i64 1
  %97 = load i32** %96, align 8
  store i32* %97, i32** %tpmi, align 8
  %98 = load %struct.plan7_s** %3, align 8
  %99 = getelementptr inbounds %struct.plan7_s* %98, i32 0, i32 30
  %100 = load i32*** %99, align 8
  %101 = getelementptr inbounds i32** %100, i64 4
  %102 = load i32** %101, align 8
  store i32* %102, i32** %tpii, align 8
  %103 = load %struct.plan7_s** %3, align 8
  %104 = getelementptr inbounds %struct.plan7_s* %103, i32 0, i32 34
  %105 = load i32** %104, align 8
  store i32* %105, i32** %bp, align 8
  store i32 1, i32* %i, align 4
  br label %106

; <label>:106                                     ; preds = %676, %64
  %107 = load i32* %i, align 4
  %108 = load i32* %2, align 4
  %109 = icmp sle i32 %107, %108
  br i1 %109, label %110, label %679

; <label>:110                                     ; preds = %106
  %111 = load i32* %i, align 4
  %112 = sext i32 %111 to i64
  %113 = load i32*** %mmx, align 8
  %114 = getelementptr inbounds i32** %113, i64 %112
  %115 = load i32** %114, align 8
  store i32* %115, i32** %mc, align 8
  %116 = load i32* %i, align 4
  %117 = sext i32 %116 to i64
  %118 = load i32*** %dmx, align 8
  %119 = getelementptr inbounds i32** %118, i64 %117
  %120 = load i32** %119, align 8
  store i32* %120, i32** %dc, align 8
  %121 = load i32* %i, align 4
  %122 = sext i32 %121 to i64
  %123 = load i32*** %imx, align 8
  %124 = getelementptr inbounds i32** %123, i64 %122
  %125 = load i32** %124, align 8
  store i32* %125, i32** %ic, align 8
  %126 = load i32* %i, align 4
  %127 = sub nsw i32 %126, 1
  %128 = sext i32 %127 to i64
  %129 = load i32*** %mmx, align 8
  %130 = getelementptr inbounds i32** %129, i64 %128
  %131 = load i32** %130, align 8
  store i32* %131, i32** %mpp, align 8
  %132 = load i32* %i, align 4
  %133 = sub nsw i32 %132, 1
  %134 = sext i32 %133 to i64
  %135 = load i32*** %dmx, align 8
  %136 = getelementptr inbounds i32** %135, i64 %134
  %137 = load i32** %136, align 8
  store i32* %137, i32** %dpp, align 8
  %138 = load i32* %i, align 4
  %139 = sub nsw i32 %138, 1
  %140 = sext i32 %139 to i64
  %141 = load i32*** %imx, align 8
  %142 = getelementptr inbounds i32** %141, i64 %140
  %143 = load i32** %142, align 8
  store i32* %143, i32** %ip, align 8
  %144 = load i32* %i, align 4
  %145 = sub nsw i32 %144, 1
  %146 = sext i32 %145 to i64
  %147 = load i32*** %xmx, align 8
  %148 = getelementptr inbounds i32** %147, i64 %146
  %149 = load i32** %148, align 8
  %150 = getelementptr inbounds i32* %149, i64 0
  %151 = load i32* %150, align 4
  store i32 %151, i32* %xmb, align 4
  %152 = load i32* %i, align 4
  %153 = sext i32 %152 to i64
  %154 = load i8** %1, align 8
  %155 = getelementptr inbounds i8* %154, i64 %153
  %156 = load i8* %155, align 1
  %157 = sext i8 %156 to i32
  %158 = sext i32 %157 to i64
  %159 = load %struct.plan7_s** %3, align 8
  %160 = getelementptr inbounds %struct.plan7_s* %159, i32 0, i32 31
  %161 = load i32*** %160, align 8
  %162 = getelementptr inbounds i32** %161, i64 %158
  %163 = load i32** %162, align 8
  store i32* %163, i32** %ms, align 8
  %164 = load i32* %i, align 4
  %165 = sext i32 %164 to i64
  %166 = load i8** %1, align 8
  %167 = getelementptr inbounds i8* %166, i64 %165
  %168 = load i8* %167, align 1
  %169 = sext i8 %168 to i32
  %170 = sext i32 %169 to i64
  %171 = load %struct.plan7_s** %3, align 8
  %172 = getelementptr inbounds %struct.plan7_s* %171, i32 0, i32 32
  %173 = load i32*** %172, align 8
  %174 = getelementptr inbounds i32** %173, i64 %170
  %175 = load i32** %174, align 8
  store i32* %175, i32** %is, align 8
  %176 = load i32** %mc, align 8
  %177 = getelementptr inbounds i32* %176, i64 0
  store i32 -987654321, i32* %177, align 4
  %178 = load i32** %dc, align 8
  %179 = getelementptr inbounds i32* %178, i64 0
  store i32 -987654321, i32* %179, align 4
  %180 = load i32** %ic, align 8
  %181 = getelementptr inbounds i32* %180, i64 0
  store i32 -987654321, i32* %181, align 4
  store i32 1, i32* %k, align 4
  br label %182

; <label>:182                                     ; preds = %421, %110
  %183 = load i32* %k, align 4
  %184 = load i32* %M, align 4
  %185 = icmp sle i32 %183, %184
  br i1 %185, label %186, label %424

; <label>:186                                     ; preds = %182
  %187 = load i32* %k, align 4
  %188 = sub nsw i32 %187, 1
  %189 = sext i32 %188 to i64
  %190 = load i32** %mpp, align 8
  %191 = getelementptr inbounds i32* %190, i64 %189
  %192 = load i32* %191, align 4
  %193 = load i32* %k, align 4
  %194 = sub nsw i32 %193, 1
  %195 = sext i32 %194 to i64
  %196 = load i32** %tpmm, align 8
  %197 = getelementptr inbounds i32* %196, i64 %195
  %198 = load i32* %197, align 4
  %199 = add nsw i32 %192, %198
  %200 = load i32* %k, align 4
  %201 = sext i32 %200 to i64
  %202 = load i32** %mc, align 8
  %203 = getelementptr inbounds i32* %202, i64 %201
  store i32 %199, i32* %203, align 4
  %204 = load i32* %k, align 4
  %205 = sub nsw i32 %204, 1
  %206 = sext i32 %205 to i64
  %207 = load i32** %ip, align 8
  %208 = getelementptr inbounds i32* %207, i64 %206
  %209 = load i32* %208, align 4
  %210 = load i32* %k, align 4
  %211 = sub nsw i32 %210, 1
  %212 = sext i32 %211 to i64
  %213 = load i32** %tpim, align 8
  %214 = getelementptr inbounds i32* %213, i64 %212
  %215 = load i32* %214, align 4
  %216 = add nsw i32 %209, %215
  store i32 %216, i32* %sc, align 4
  %217 = load i32* %k, align 4
  %218 = sext i32 %217 to i64
  %219 = load i32** %mc, align 8
  %220 = getelementptr inbounds i32* %219, i64 %218
  %221 = load i32* %220, align 4
  %222 = icmp sgt i32 %216, %221
  br i1 %222, label %223, label %229

; <label>:223                                     ; preds = %186
  %224 = load i32* %sc, align 4
  %225 = load i32* %k, align 4
  %226 = sext i32 %225 to i64
  %227 = load i32** %mc, align 8
  %228 = getelementptr inbounds i32* %227, i64 %226
  store i32 %224, i32* %228, align 4
  br label %229

; <label>:229                                     ; preds = %223, %186
  %230 = load i32* %k, align 4
  %231 = sub nsw i32 %230, 1
  %232 = sext i32 %231 to i64
  %233 = load i32** %dpp, align 8
  %234 = getelementptr inbounds i32* %233, i64 %232
  %235 = load i32* %234, align 4
  %236 = load i32* %k, align 4
  %237 = sub nsw i32 %236, 1
  %238 = sext i32 %237 to i64
  %239 = load i32** %tpdm, align 8
  %240 = getelementptr inbounds i32* %239, i64 %238
  %241 = load i32* %240, align 4
  %242 = add nsw i32 %235, %241
  store i32 %242, i32* %sc, align 4
  %243 = load i32* %k, align 4
  %244 = sext i32 %243 to i64
  %245 = load i32** %mc, align 8
  %246 = getelementptr inbounds i32* %245, i64 %244
  %247 = load i32* %246, align 4
  %248 = icmp sgt i32 %242, %247
  br i1 %248, label %249, label %255

; <label>:249                                     ; preds = %229
  %250 = load i32* %sc, align 4
  %251 = load i32* %k, align 4
  %252 = sext i32 %251 to i64
  %253 = load i32** %mc, align 8
  %254 = getelementptr inbounds i32* %253, i64 %252
  store i32 %250, i32* %254, align 4
  br label %255

; <label>:255                                     ; preds = %249, %229
  %256 = load i32* %xmb, align 4
  %257 = load i32* %k, align 4
  %258 = sext i32 %257 to i64
  %259 = load i32** %bp, align 8
  %260 = getelementptr inbounds i32* %259, i64 %258
  %261 = load i32* %260, align 4
  %262 = add nsw i32 %256, %261
  store i32 %262, i32* %sc, align 4
  %263 = load i32* %k, align 4
  %264 = sext i32 %263 to i64
  %265 = load i32** %mc, align 8
  %266 = getelementptr inbounds i32* %265, i64 %264
  %267 = load i32* %266, align 4
  %268 = icmp sgt i32 %262, %267
  br i1 %268, label %269, label %275

; <label>:269                                     ; preds = %255
  %270 = load i32* %sc, align 4
  %271 = load i32* %k, align 4
  %272 = sext i32 %271 to i64
  %273 = load i32** %mc, align 8
  %274 = getelementptr inbounds i32* %273, i64 %272
  store i32 %270, i32* %274, align 4
  br label %275

; <label>:275                                     ; preds = %269, %255
  %276 = load i32* %k, align 4
  %277 = sext i32 %276 to i64
  %278 = load i32** %ms, align 8
  %279 = getelementptr inbounds i32* %278, i64 %277
  %280 = load i32* %279, align 4
  %281 = load i32* %k, align 4
  %282 = sext i32 %281 to i64
  %283 = load i32** %mc, align 8
  %284 = getelementptr inbounds i32* %283, i64 %282
  %285 = load i32* %284, align 4
  %286 = add nsw i32 %285, %280
  store i32 %286, i32* %284, align 4
  %287 = load i32* %k, align 4
  %288 = sext i32 %287 to i64
  %289 = load i32** %mc, align 8
  %290 = getelementptr inbounds i32* %289, i64 %288
  %291 = load i32* %290, align 4
  %292 = icmp slt i32 %291, -987654321
  br i1 %292, label %293, label %298

; <label>:293                                     ; preds = %275
  %294 = load i32* %k, align 4
  %295 = sext i32 %294 to i64
  %296 = load i32** %mc, align 8
  %297 = getelementptr inbounds i32* %296, i64 %295
  store i32 -987654321, i32* %297, align 4
  br label %298

; <label>:298                                     ; preds = %293, %275
  %299 = load i32* %k, align 4
  %300 = sub nsw i32 %299, 1
  %301 = sext i32 %300 to i64
  %302 = load i32** %dc, align 8
  %303 = getelementptr inbounds i32* %302, i64 %301
  %304 = load i32* %303, align 4
  %305 = load i32* %k, align 4
  %306 = sub nsw i32 %305, 1
  %307 = sext i32 %306 to i64
  %308 = load i32** %tpdd, align 8
  %309 = getelementptr inbounds i32* %308, i64 %307
  %310 = load i32* %309, align 4
  %311 = add nsw i32 %304, %310
  %312 = load i32* %k, align 4
  %313 = sext i32 %312 to i64
  %314 = load i32** %dc, align 8
  %315 = getelementptr inbounds i32* %314, i64 %313
  store i32 %311, i32* %315, align 4
  %316 = load i32* %k, align 4
  %317 = sub nsw i32 %316, 1
  %318 = sext i32 %317 to i64
  %319 = load i32** %mc, align 8
  %320 = getelementptr inbounds i32* %319, i64 %318
  %321 = load i32* %320, align 4
  %322 = load i32* %k, align 4
  %323 = sub nsw i32 %322, 1
  %324 = sext i32 %323 to i64
  %325 = load i32** %tpmd, align 8
  %326 = getelementptr inbounds i32* %325, i64 %324
  %327 = load i32* %326, align 4
  %328 = add nsw i32 %321, %327
  store i32 %328, i32* %sc, align 4
  %329 = load i32* %k, align 4
  %330 = sext i32 %329 to i64
  %331 = load i32** %dc, align 8
  %332 = getelementptr inbounds i32* %331, i64 %330
  %333 = load i32* %332, align 4
  %334 = icmp sgt i32 %328, %333
  br i1 %334, label %335, label %341

; <label>:335                                     ; preds = %298
  %336 = load i32* %sc, align 4
  %337 = load i32* %k, align 4
  %338 = sext i32 %337 to i64
  %339 = load i32** %dc, align 8
  %340 = getelementptr inbounds i32* %339, i64 %338
  store i32 %336, i32* %340, align 4
  br label %341

; <label>:341                                     ; preds = %335, %298
  %342 = load i32* %k, align 4
  %343 = sext i32 %342 to i64
  %344 = load i32** %dc, align 8
  %345 = getelementptr inbounds i32* %344, i64 %343
  %346 = load i32* %345, align 4
  %347 = icmp slt i32 %346, -987654321
  br i1 %347, label %348, label %353

; <label>:348                                     ; preds = %341
  %349 = load i32* %k, align 4
  %350 = sext i32 %349 to i64
  %351 = load i32** %dc, align 8
  %352 = getelementptr inbounds i32* %351, i64 %350
  store i32 -987654321, i32* %352, align 4
  br label %353

; <label>:353                                     ; preds = %348, %341
  %354 = load i32* %k, align 4
  %355 = load i32* %M, align 4
  %356 = icmp slt i32 %354, %355
  br i1 %356, label %357, label %420

; <label>:357                                     ; preds = %353
  %358 = load i32* %k, align 4
  %359 = sext i32 %358 to i64
  %360 = load i32** %mpp, align 8
  %361 = getelementptr inbounds i32* %360, i64 %359
  %362 = load i32* %361, align 4
  %363 = load i32* %k, align 4
  %364 = sext i32 %363 to i64
  %365 = load i32** %tpmi, align 8
  %366 = getelementptr inbounds i32* %365, i64 %364
  %367 = load i32* %366, align 4
  %368 = add nsw i32 %362, %367
  %369 = load i32* %k, align 4
  %370 = sext i32 %369 to i64
  %371 = load i32** %ic, align 8
  %372 = getelementptr inbounds i32* %371, i64 %370
  store i32 %368, i32* %372, align 4
  %373 = load i32* %k, align 4
  %374 = sext i32 %373 to i64
  %375 = load i32** %ip, align 8
  %376 = getelementptr inbounds i32* %375, i64 %374
  %377 = load i32* %376, align 4
  %378 = load i32* %k, align 4
  %379 = sext i32 %378 to i64
  %380 = load i32** %tpii, align 8
  %381 = getelementptr inbounds i32* %380, i64 %379
  %382 = load i32* %381, align 4
  %383 = add nsw i32 %377, %382
  store i32 %383, i32* %sc, align 4
  %384 = load i32* %k, align 4
  %385 = sext i32 %384 to i64
  %386 = load i32** %ic, align 8
  %387 = getelementptr inbounds i32* %386, i64 %385
  %388 = load i32* %387, align 4
  %389 = icmp sgt i32 %383, %388
  br i1 %389, label %390, label %396

; <label>:390                                     ; preds = %357
  %391 = load i32* %sc, align 4
  %392 = load i32* %k, align 4
  %393 = sext i32 %392 to i64
  %394 = load i32** %ic, align 8
  %395 = getelementptr inbounds i32* %394, i64 %393
  store i32 %391, i32* %395, align 4
  br label %396

; <label>:396                                     ; preds = %390, %357
  %397 = load i32* %k, align 4
  %398 = sext i32 %397 to i64
  %399 = load i32** %is, align 8
  %400 = getelementptr inbounds i32* %399, i64 %398
  %401 = load i32* %400, align 4
  %402 = load i32* %k, align 4
  %403 = sext i32 %402 to i64
  %404 = load i32** %ic, align 8
  %405 = getelementptr inbounds i32* %404, i64 %403
  %406 = load i32* %405, align 4
  %407 = add nsw i32 %406, %401
  store i32 %407, i32* %405, align 4
  %408 = load i32* %k, align 4
  %409 = sext i32 %408 to i64
  %410 = load i32** %ic, align 8
  %411 = getelementptr inbounds i32* %410, i64 %409
  %412 = load i32* %411, align 4
  %413 = icmp slt i32 %412, -987654321
  br i1 %413, label %414, label %419

; <label>:414                                     ; preds = %396
  %415 = load i32* %k, align 4
  %416 = sext i32 %415 to i64
  %417 = load i32** %ic, align 8
  %418 = getelementptr inbounds i32* %417, i64 %416
  store i32 -987654321, i32* %418, align 4
  br label %419

; <label>:419                                     ; preds = %414, %396
  br label %420

; <label>:420                                     ; preds = %419, %353
  br label %421

; <label>:421                                     ; preds = %420
  %422 = load i32* %k, align 4
  %423 = add nsw i32 %422, 1
  store i32 %423, i32* %k, align 4
  br label %182

; <label>:424                                     ; preds = %182
  %425 = load i32* %i, align 4
  %426 = sext i32 %425 to i64
  %427 = load i32*** %xmx, align 8
  %428 = getelementptr inbounds i32** %427, i64 %426
  %429 = load i32** %428, align 8
  %430 = getelementptr inbounds i32* %429, i64 4
  store i32 -987654321, i32* %430, align 4
  %431 = load i32* %i, align 4
  %432 = sub nsw i32 %431, 1
  %433 = sext i32 %432 to i64
  %434 = load i32*** %xmx, align 8
  %435 = getelementptr inbounds i32** %434, i64 %433
  %436 = load i32** %435, align 8
  %437 = getelementptr inbounds i32* %436, i64 4
  %438 = load i32* %437, align 4
  %439 = load %struct.plan7_s** %3, align 8
  %440 = getelementptr inbounds %struct.plan7_s* %439, i32 0, i32 33
  %441 = getelementptr inbounds [4 x [2 x i32]]* %440, i32 0, i64 0
  %442 = getelementptr inbounds [2 x i32]* %441, i32 0, i64 1
  %443 = load i32* %442, align 4
  %444 = add nsw i32 %438, %443
  store i32 %444, i32* %sc, align 4
  %445 = icmp sgt i32 %444, -987654321
  br i1 %445, label %446, label %454

; <label>:446                                     ; preds = %424
  %447 = load i32* %sc, align 4
  %448 = load i32* %i, align 4
  %449 = sext i32 %448 to i64
  %450 = load i32*** %xmx, align 8
  %451 = getelementptr inbounds i32** %450, i64 %449
  %452 = load i32** %451, align 8
  %453 = getelementptr inbounds i32* %452, i64 4
  store i32 %447, i32* %453, align 4
  br label %454

; <label>:454                                     ; preds = %446, %424
  store i32 -987654321, i32* %xme, align 4
  %455 = load i32* %i, align 4
  %456 = sext i32 %455 to i64
  %457 = load i32*** %mmx, align 8
  %458 = getelementptr inbounds i32** %457, i64 %456
  %459 = load i32** %458, align 8
  store i32* %459, i32** %mpc, align 8
  %460 = load %struct.plan7_s** %3, align 8
  %461 = getelementptr inbounds %struct.plan7_s* %460, i32 0, i32 35
  %462 = load i32** %461, align 8
  store i32* %462, i32** %ep, align 8
  store i32 1, i32* %k, align 4
  br label %463

; <label>:463                                     ; preds = %486, %454
  %464 = load i32* %k, align 4
  %465 = load %struct.plan7_s** %3, align 8
  %466 = getelementptr inbounds %struct.plan7_s* %465, i32 0, i32 20
  %467 = load i32* %466, align 4
  %468 = icmp sle i32 %464, %467
  br i1 %468, label %469, label %489

; <label>:469                                     ; preds = %463
  %470 = load i32* %k, align 4
  %471 = sext i32 %470 to i64
  %472 = load i32** %mpc, align 8
  %473 = getelementptr inbounds i32* %472, i64 %471
  %474 = load i32* %473, align 4
  %475 = load i32* %k, align 4
  %476 = sext i32 %475 to i64
  %477 = load i32** %ep, align 8
  %478 = getelementptr inbounds i32* %477, i64 %476
  %479 = load i32* %478, align 4
  %480 = add nsw i32 %474, %479
  store i32 %480, i32* %sc, align 4
  %481 = load i32* %xme, align 4
  %482 = icmp sgt i32 %480, %481
  br i1 %482, label %483, label %485

; <label>:483                                     ; preds = %469
  %484 = load i32* %sc, align 4
  store i32 %484, i32* %xme, align 4
  br label %485

; <label>:485                                     ; preds = %483, %469
  br label %486

; <label>:486                                     ; preds = %485
  %487 = load i32* %k, align 4
  %488 = add nsw i32 %487, 1
  store i32 %488, i32* %k, align 4
  br label %463

; <label>:489                                     ; preds = %463
  %490 = load i32* %xme, align 4
  %491 = load i32* %i, align 4
  %492 = sext i32 %491 to i64
  %493 = load i32*** %xmx, align 8
  %494 = getelementptr inbounds i32** %493, i64 %492
  %495 = load i32** %494, align 8
  %496 = getelementptr inbounds i32* %495, i64 1
  store i32 %490, i32* %496, align 4
  %497 = load i32* %i, align 4
  %498 = sext i32 %497 to i64
  %499 = load i32*** %xmx, align 8
  %500 = getelementptr inbounds i32** %499, i64 %498
  %501 = load i32** %500, align 8
  %502 = getelementptr inbounds i32* %501, i64 3
  store i32 -987654321, i32* %502, align 4
  %503 = load i32* %i, align 4
  %504 = sub nsw i32 %503, 1
  %505 = sext i32 %504 to i64
  %506 = load i32*** %xmx, align 8
  %507 = getelementptr inbounds i32** %506, i64 %505
  %508 = load i32** %507, align 8
  %509 = getelementptr inbounds i32* %508, i64 3
  %510 = load i32* %509, align 4
  %511 = load %struct.plan7_s** %3, align 8
  %512 = getelementptr inbounds %struct.plan7_s* %511, i32 0, i32 33
  %513 = getelementptr inbounds [4 x [2 x i32]]* %512, i32 0, i64 3
  %514 = getelementptr inbounds [2 x i32]* %513, i32 0, i64 1
  %515 = load i32* %514, align 4
  %516 = add nsw i32 %510, %515
  store i32 %516, i32* %sc, align 4
  %517 = icmp sgt i32 %516, -987654321
  br i1 %517, label %518, label %526

; <label>:518                                     ; preds = %489
  %519 = load i32* %sc, align 4
  %520 = load i32* %i, align 4
  %521 = sext i32 %520 to i64
  %522 = load i32*** %xmx, align 8
  %523 = getelementptr inbounds i32** %522, i64 %521
  %524 = load i32** %523, align 8
  %525 = getelementptr inbounds i32* %524, i64 3
  store i32 %519, i32* %525, align 4
  br label %526

; <label>:526                                     ; preds = %518, %489
  %527 = load i32* %i, align 4
  %528 = sext i32 %527 to i64
  %529 = load i32*** %xmx, align 8
  %530 = getelementptr inbounds i32** %529, i64 %528
  %531 = load i32** %530, align 8
  %532 = getelementptr inbounds i32* %531, i64 1
  %533 = load i32* %532, align 4
  %534 = load %struct.plan7_s** %3, align 8
  %535 = getelementptr inbounds %struct.plan7_s* %534, i32 0, i32 33
  %536 = getelementptr inbounds [4 x [2 x i32]]* %535, i32 0, i64 1
  %537 = getelementptr inbounds [2 x i32]* %536, i32 0, i64 1
  %538 = load i32* %537, align 4
  %539 = add nsw i32 %533, %538
  store i32 %539, i32* %sc, align 4
  %540 = load i32* %i, align 4
  %541 = sext i32 %540 to i64
  %542 = load i32*** %xmx, align 8
  %543 = getelementptr inbounds i32** %542, i64 %541
  %544 = load i32** %543, align 8
  %545 = getelementptr inbounds i32* %544, i64 3
  %546 = load i32* %545, align 4
  %547 = icmp sgt i32 %539, %546
  br i1 %547, label %548, label %556

; <label>:548                                     ; preds = %526
  %549 = load i32* %sc, align 4
  %550 = load i32* %i, align 4
  %551 = sext i32 %550 to i64
  %552 = load i32*** %xmx, align 8
  %553 = getelementptr inbounds i32** %552, i64 %551
  %554 = load i32** %553, align 8
  %555 = getelementptr inbounds i32* %554, i64 3
  store i32 %549, i32* %555, align 4
  br label %556

; <label>:556                                     ; preds = %548, %526
  %557 = load i32* %i, align 4
  %558 = sext i32 %557 to i64
  %559 = load i32*** %xmx, align 8
  %560 = getelementptr inbounds i32** %559, i64 %558
  %561 = load i32** %560, align 8
  %562 = getelementptr inbounds i32* %561, i64 0
  store i32 -987654321, i32* %562, align 4
  %563 = load i32* %i, align 4
  %564 = sext i32 %563 to i64
  %565 = load i32*** %xmx, align 8
  %566 = getelementptr inbounds i32** %565, i64 %564
  %567 = load i32** %566, align 8
  %568 = getelementptr inbounds i32* %567, i64 4
  %569 = load i32* %568, align 4
  %570 = load %struct.plan7_s** %3, align 8
  %571 = getelementptr inbounds %struct.plan7_s* %570, i32 0, i32 33
  %572 = getelementptr inbounds [4 x [2 x i32]]* %571, i32 0, i64 0
  %573 = getelementptr inbounds [2 x i32]* %572, i32 0, i64 0
  %574 = load i32* %573, align 4
  %575 = add nsw i32 %569, %574
  store i32 %575, i32* %sc, align 4
  %576 = icmp sgt i32 %575, -987654321
  br i1 %576, label %577, label %585

; <label>:577                                     ; preds = %556
  %578 = load i32* %sc, align 4
  %579 = load i32* %i, align 4
  %580 = sext i32 %579 to i64
  %581 = load i32*** %xmx, align 8
  %582 = getelementptr inbounds i32** %581, i64 %580
  %583 = load i32** %582, align 8
  %584 = getelementptr inbounds i32* %583, i64 0
  store i32 %578, i32* %584, align 4
  br label %585

; <label>:585                                     ; preds = %577, %556
  %586 = load i32* %i, align 4
  %587 = sext i32 %586 to i64
  %588 = load i32*** %xmx, align 8
  %589 = getelementptr inbounds i32** %588, i64 %587
  %590 = load i32** %589, align 8
  %591 = getelementptr inbounds i32* %590, i64 3
  %592 = load i32* %591, align 4
  %593 = load %struct.plan7_s** %3, align 8
  %594 = getelementptr inbounds %struct.plan7_s* %593, i32 0, i32 33
  %595 = getelementptr inbounds [4 x [2 x i32]]* %594, i32 0, i64 3
  %596 = getelementptr inbounds [2 x i32]* %595, i32 0, i64 0
  %597 = load i32* %596, align 4
  %598 = add nsw i32 %592, %597
  store i32 %598, i32* %sc, align 4
  %599 = load i32* %i, align 4
  %600 = sext i32 %599 to i64
  %601 = load i32*** %xmx, align 8
  %602 = getelementptr inbounds i32** %601, i64 %600
  %603 = load i32** %602, align 8
  %604 = getelementptr inbounds i32* %603, i64 0
  %605 = load i32* %604, align 4
  %606 = icmp sgt i32 %598, %605
  br i1 %606, label %607, label %615

; <label>:607                                     ; preds = %585
  %608 = load i32* %sc, align 4
  %609 = load i32* %i, align 4
  %610 = sext i32 %609 to i64
  %611 = load i32*** %xmx, align 8
  %612 = getelementptr inbounds i32** %611, i64 %610
  %613 = load i32** %612, align 8
  %614 = getelementptr inbounds i32* %613, i64 0
  store i32 %608, i32* %614, align 4
  br label %615

; <label>:615                                     ; preds = %607, %585
  %616 = load i32* %i, align 4
  %617 = sext i32 %616 to i64
  %618 = load i32*** %xmx, align 8
  %619 = getelementptr inbounds i32** %618, i64 %617
  %620 = load i32** %619, align 8
  %621 = getelementptr inbounds i32* %620, i64 2
  store i32 -987654321, i32* %621, align 4
  %622 = load i32* %i, align 4
  %623 = sub nsw i32 %622, 1
  %624 = sext i32 %623 to i64
  %625 = load i32*** %xmx, align 8
  %626 = getelementptr inbounds i32** %625, i64 %624
  %627 = load i32** %626, align 8
  %628 = getelementptr inbounds i32* %627, i64 2
  %629 = load i32* %628, align 4
  %630 = load %struct.plan7_s** %3, align 8
  %631 = getelementptr inbounds %struct.plan7_s* %630, i32 0, i32 33
  %632 = getelementptr inbounds [4 x [2 x i32]]* %631, i32 0, i64 2
  %633 = getelementptr inbounds [2 x i32]* %632, i32 0, i64 1
  %634 = load i32* %633, align 4
  %635 = add nsw i32 %629, %634
  store i32 %635, i32* %sc, align 4
  %636 = icmp sgt i32 %635, -987654321
  br i1 %636, label %637, label %645

; <label>:637                                     ; preds = %615
  %638 = load i32* %sc, align 4
  %639 = load i32* %i, align 4
  %640 = sext i32 %639 to i64
  %641 = load i32*** %xmx, align 8
  %642 = getelementptr inbounds i32** %641, i64 %640
  %643 = load i32** %642, align 8
  %644 = getelementptr inbounds i32* %643, i64 2
  store i32 %638, i32* %644, align 4
  br label %645

; <label>:645                                     ; preds = %637, %615
  %646 = load i32* %i, align 4
  %647 = sext i32 %646 to i64
  %648 = load i32*** %xmx, align 8
  %649 = getelementptr inbounds i32** %648, i64 %647
  %650 = load i32** %649, align 8
  %651 = getelementptr inbounds i32* %650, i64 1
  %652 = load i32* %651, align 4
  %653 = load %struct.plan7_s** %3, align 8
  %654 = getelementptr inbounds %struct.plan7_s* %653, i32 0, i32 33
  %655 = getelementptr inbounds [4 x [2 x i32]]* %654, i32 0, i64 1
  %656 = getelementptr inbounds [2 x i32]* %655, i32 0, i64 0
  %657 = load i32* %656, align 4
  %658 = add nsw i32 %652, %657
  store i32 %658, i32* %sc, align 4
  %659 = load i32* %i, align 4
  %660 = sext i32 %659 to i64
  %661 = load i32*** %xmx, align 8
  %662 = getelementptr inbounds i32** %661, i64 %660
  %663 = load i32** %662, align 8
  %664 = getelementptr inbounds i32* %663, i64 2
  %665 = load i32* %664, align 4
  %666 = icmp sgt i32 %658, %665
  br i1 %666, label %667, label %675

; <label>:667                                     ; preds = %645
  %668 = load i32* %sc, align 4
  %669 = load i32* %i, align 4
  %670 = sext i32 %669 to i64
  %671 = load i32*** %xmx, align 8
  %672 = getelementptr inbounds i32** %671, i64 %670
  %673 = load i32** %672, align 8
  %674 = getelementptr inbounds i32* %673, i64 2
  store i32 %668, i32* %674, align 4
  br label %675

; <label>:675                                     ; preds = %667, %645
  br label %676

; <label>:676                                     ; preds = %675
  %677 = load i32* %i, align 4
  %678 = add nsw i32 %677, 1
  store i32 %678, i32* %i, align 4
  br label %106

; <label>:679                                     ; preds = %106
  %680 = load i32* %2, align 4
  %681 = sext i32 %680 to i64
  %682 = load i32*** %xmx, align 8
  %683 = getelementptr inbounds i32** %682, i64 %681
  %684 = load i32** %683, align 8
  %685 = getelementptr inbounds i32* %684, i64 2
  %686 = load i32* %685, align 4
  %687 = load %struct.plan7_s** %3, align 8
  %688 = getelementptr inbounds %struct.plan7_s* %687, i32 0, i32 33
  %689 = getelementptr inbounds [4 x [2 x i32]]* %688, i32 0, i64 2
  %690 = getelementptr inbounds [2 x i32]* %689, i32 0, i64 0
  %691 = load i32* %690, align 4
  %692 = add nsw i32 %686, %691
  store i32 %692, i32* %sc, align 4
  %693 = load %struct.p7trace_s*** %5, align 8
  %694 = icmp ne %struct.p7trace_s** %693, null
  br i1 %694, label %695, label %702

; <label>:695                                     ; preds = %679
  %696 = load %struct.plan7_s** %3, align 8
  %697 = load i8** %1, align 8
  %698 = load i32* %2, align 4
  %699 = load %struct.dpmatrix_s** %4, align 8
  call void @P7ViterbiTrace(%struct.plan7_s* %696, i8* %697, i32 %698, %struct.dpmatrix_s* %699, %struct.p7trace_s** %tr)
  %700 = load %struct.p7trace_s** %tr, align 8
  %701 = load %struct.p7trace_s*** %5, align 8
  store %struct.p7trace_s* %700, %struct.p7trace_s** %701, align 8
  br label %702

; <label>:702                                     ; preds = %695, %679
  %703 = load i32* %sc, align 4
  %704 = call float @Scorify(i32 %703)
  ret float %704
}

declare void @ResizePlan7Matrix(%struct.dpmatrix_s*, i32, i32, i32***, i32***, i32***, i32***) #1

declare void @P7ViterbiTrace(%struct.plan7_s*, i8*, i32, %struct.dpmatrix_s*, %struct.p7trace_s**) #1

declare float @Scorify(i32) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
