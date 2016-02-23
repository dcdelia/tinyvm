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
  call void @llvm.dbg.declare(metadata i8** %1, metadata !104, metadata !105), !dbg !106
  store i32 %L, i32* %2, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !107, metadata !105), !dbg !108
  store %struct.plan7_s* %hmm, %struct.plan7_s** %3, align 8
  call void @llvm.dbg.declare(metadata %struct.plan7_s** %3, metadata !109, metadata !105), !dbg !110
  store %struct.dpmatrix_s* %mx, %struct.dpmatrix_s** %4, align 8
  call void @llvm.dbg.declare(metadata %struct.dpmatrix_s** %4, metadata !111, metadata !105), !dbg !112
  store %struct.p7trace_s** %ret_tr, %struct.p7trace_s*** %5, align 8
  call void @llvm.dbg.declare(metadata %struct.p7trace_s*** %5, metadata !113, metadata !105), !dbg !114
  call void @llvm.dbg.declare(metadata %struct.p7trace_s** %tr, metadata !115, metadata !105), !dbg !116
  call void @llvm.dbg.declare(metadata i32*** %xmx, metadata !117, metadata !105), !dbg !118
  call void @llvm.dbg.declare(metadata i32*** %mmx, metadata !119, metadata !105), !dbg !120
  call void @llvm.dbg.declare(metadata i32*** %imx, metadata !121, metadata !105), !dbg !122
  call void @llvm.dbg.declare(metadata i32*** %dmx, metadata !123, metadata !105), !dbg !124
  call void @llvm.dbg.declare(metadata i32* %i, metadata !125, metadata !105), !dbg !126
  call void @llvm.dbg.declare(metadata i32* %k, metadata !127, metadata !105), !dbg !128
  call void @llvm.dbg.declare(metadata i32* %sc, metadata !129, metadata !105), !dbg !130
  call void @llvm.dbg.declare(metadata i32** %mc, metadata !131, metadata !105), !dbg !132
  call void @llvm.dbg.declare(metadata i32** %dc, metadata !133, metadata !105), !dbg !134
  call void @llvm.dbg.declare(metadata i32** %ic, metadata !135, metadata !105), !dbg !136
  call void @llvm.dbg.declare(metadata i32** %ms, metadata !137, metadata !105), !dbg !138
  call void @llvm.dbg.declare(metadata i32** %is, metadata !139, metadata !105), !dbg !140
  call void @llvm.dbg.declare(metadata i32** %mpp, metadata !141, metadata !105), !dbg !142
  call void @llvm.dbg.declare(metadata i32** %mpc, metadata !143, metadata !105), !dbg !144
  call void @llvm.dbg.declare(metadata i32** %ip, metadata !145, metadata !105), !dbg !146
  call void @llvm.dbg.declare(metadata i32** %bp, metadata !147, metadata !105), !dbg !148
  call void @llvm.dbg.declare(metadata i32** %ep, metadata !149, metadata !105), !dbg !150
  call void @llvm.dbg.declare(metadata i32* %xmb, metadata !151, metadata !105), !dbg !152
  call void @llvm.dbg.declare(metadata i32* %xme, metadata !153, metadata !105), !dbg !154
  call void @llvm.dbg.declare(metadata i32** %dpp, metadata !155, metadata !105), !dbg !156
  call void @llvm.dbg.declare(metadata i32** %tpmm, metadata !157, metadata !105), !dbg !158
  call void @llvm.dbg.declare(metadata i32** %tpmi, metadata !159, metadata !105), !dbg !160
  call void @llvm.dbg.declare(metadata i32** %tpmd, metadata !161, metadata !105), !dbg !162
  call void @llvm.dbg.declare(metadata i32** %tpim, metadata !163, metadata !105), !dbg !164
  call void @llvm.dbg.declare(metadata i32** %tpii, metadata !165, metadata !105), !dbg !166
  call void @llvm.dbg.declare(metadata i32** %tpdm, metadata !167, metadata !105), !dbg !168
  call void @llvm.dbg.declare(metadata i32** %tpdd, metadata !169, metadata !105), !dbg !170
  call void @llvm.dbg.declare(metadata i32* %M, metadata !171, metadata !105), !dbg !172
  %6 = load %struct.dpmatrix_s** %4, align 8, !dbg !173
  %7 = load i32* %2, align 4, !dbg !174
  %8 = load %struct.plan7_s** %3, align 8, !dbg !175
  %9 = getelementptr inbounds %struct.plan7_s* %8, i32 0, i32 20, !dbg !175
  %10 = load i32* %9, align 4, !dbg !175
  call void @ResizePlan7Matrix(%struct.dpmatrix_s* %6, i32 %7, i32 %10, i32*** %xmx, i32*** %mmx, i32*** %imx, i32*** %dmx), !dbg !176
  %11 = load i32*** %xmx, align 8, !dbg !177
  %12 = getelementptr inbounds i32** %11, i64 0, !dbg !177
  %13 = load i32** %12, align 8, !dbg !177
  %14 = getelementptr inbounds i32* %13, i64 4, !dbg !177
  store i32 0, i32* %14, align 4, !dbg !177
  %15 = load %struct.plan7_s** %3, align 8, !dbg !178
  %16 = getelementptr inbounds %struct.plan7_s* %15, i32 0, i32 33, !dbg !178
  %17 = getelementptr inbounds [4 x [2 x i32]]* %16, i32 0, i64 0, !dbg !178
  %18 = getelementptr inbounds [2 x i32]* %17, i32 0, i64 0, !dbg !178
  %19 = load i32* %18, align 4, !dbg !178
  %20 = load i32*** %xmx, align 8, !dbg !179
  %21 = getelementptr inbounds i32** %20, i64 0, !dbg !179
  %22 = load i32** %21, align 8, !dbg !179
  %23 = getelementptr inbounds i32* %22, i64 0, !dbg !179
  store i32 %19, i32* %23, align 4, !dbg !179
  %24 = load i32*** %xmx, align 8, !dbg !180
  %25 = getelementptr inbounds i32** %24, i64 0, !dbg !180
  %26 = load i32** %25, align 8, !dbg !180
  %27 = getelementptr inbounds i32* %26, i64 3, !dbg !180
  store i32 -987654321, i32* %27, align 4, !dbg !180
  %28 = load i32*** %xmx, align 8, !dbg !181
  %29 = getelementptr inbounds i32** %28, i64 0, !dbg !181
  %30 = load i32** %29, align 8, !dbg !181
  %31 = getelementptr inbounds i32* %30, i64 2, !dbg !181
  store i32 -987654321, i32* %31, align 4, !dbg !181
  %32 = load i32*** %xmx, align 8, !dbg !182
  %33 = getelementptr inbounds i32** %32, i64 0, !dbg !182
  %34 = load i32** %33, align 8, !dbg !182
  %35 = getelementptr inbounds i32* %34, i64 1, !dbg !182
  store i32 -987654321, i32* %35, align 4, !dbg !182
  store i32 0, i32* %k, align 4, !dbg !183
  br label %36, !dbg !183

; <label>:36                                      ; preds = %61, %0
  %37 = load i32* %k, align 4, !dbg !185
  %38 = load %struct.plan7_s** %3, align 8, !dbg !189
  %39 = getelementptr inbounds %struct.plan7_s* %38, i32 0, i32 20, !dbg !189
  %40 = load i32* %39, align 4, !dbg !189
  %41 = icmp sle i32 %37, %40, !dbg !190
  br i1 %41, label %42, label %64, !dbg !191

; <label>:42                                      ; preds = %36
  %43 = load i32* %k, align 4, !dbg !192
  %44 = sext i32 %43 to i64, !dbg !193
  %45 = load i32*** %dmx, align 8, !dbg !193
  %46 = getelementptr inbounds i32** %45, i64 0, !dbg !193
  %47 = load i32** %46, align 8, !dbg !193
  %48 = getelementptr inbounds i32* %47, i64 %44, !dbg !193
  store i32 -987654321, i32* %48, align 4, !dbg !193
  %49 = load i32* %k, align 4, !dbg !194
  %50 = sext i32 %49 to i64, !dbg !195
  %51 = load i32*** %imx, align 8, !dbg !195
  %52 = getelementptr inbounds i32** %51, i64 0, !dbg !195
  %53 = load i32** %52, align 8, !dbg !195
  %54 = getelementptr inbounds i32* %53, i64 %50, !dbg !195
  store i32 -987654321, i32* %54, align 4, !dbg !195
  %55 = load i32* %k, align 4, !dbg !196
  %56 = sext i32 %55 to i64, !dbg !197
  %57 = load i32*** %mmx, align 8, !dbg !197
  %58 = getelementptr inbounds i32** %57, i64 0, !dbg !197
  %59 = load i32** %58, align 8, !dbg !197
  %60 = getelementptr inbounds i32* %59, i64 %56, !dbg !197
  store i32 -987654321, i32* %60, align 4, !dbg !197
  br label %61, !dbg !197

; <label>:61                                      ; preds = %42
  %62 = load i32* %k, align 4, !dbg !198
  %63 = add nsw i32 %62, 1, !dbg !198
  store i32 %63, i32* %k, align 4, !dbg !198
  br label %36, !dbg !199

; <label>:64                                      ; preds = %36
  %65 = load %struct.plan7_s** %3, align 8, !dbg !200
  %66 = getelementptr inbounds %struct.plan7_s* %65, i32 0, i32 20, !dbg !200
  %67 = load i32* %66, align 4, !dbg !200
  store i32 %67, i32* %M, align 4, !dbg !201
  %68 = load %struct.plan7_s** %3, align 8, !dbg !202
  %69 = getelementptr inbounds %struct.plan7_s* %68, i32 0, i32 30, !dbg !202
  %70 = load i32*** %69, align 8, !dbg !202
  %71 = getelementptr inbounds i32** %70, i64 0, !dbg !202
  %72 = load i32** %71, align 8, !dbg !202
  store i32* %72, i32** %tpmm, align 8, !dbg !203
  %73 = load %struct.plan7_s** %3, align 8, !dbg !204
  %74 = getelementptr inbounds %struct.plan7_s* %73, i32 0, i32 30, !dbg !204
  %75 = load i32*** %74, align 8, !dbg !204
  %76 = getelementptr inbounds i32** %75, i64 3, !dbg !204
  %77 = load i32** %76, align 8, !dbg !204
  store i32* %77, i32** %tpim, align 8, !dbg !205
  %78 = load %struct.plan7_s** %3, align 8, !dbg !206
  %79 = getelementptr inbounds %struct.plan7_s* %78, i32 0, i32 30, !dbg !206
  %80 = load i32*** %79, align 8, !dbg !206
  %81 = getelementptr inbounds i32** %80, i64 5, !dbg !206
  %82 = load i32** %81, align 8, !dbg !206
  store i32* %82, i32** %tpdm, align 8, !dbg !207
  %83 = load %struct.plan7_s** %3, align 8, !dbg !208
  %84 = getelementptr inbounds %struct.plan7_s* %83, i32 0, i32 30, !dbg !208
  %85 = load i32*** %84, align 8, !dbg !208
  %86 = getelementptr inbounds i32** %85, i64 2, !dbg !208
  %87 = load i32** %86, align 8, !dbg !208
  store i32* %87, i32** %tpmd, align 8, !dbg !209
  %88 = load %struct.plan7_s** %3, align 8, !dbg !210
  %89 = getelementptr inbounds %struct.plan7_s* %88, i32 0, i32 30, !dbg !210
  %90 = load i32*** %89, align 8, !dbg !210
  %91 = getelementptr inbounds i32** %90, i64 6, !dbg !210
  %92 = load i32** %91, align 8, !dbg !210
  store i32* %92, i32** %tpdd, align 8, !dbg !211
  %93 = load %struct.plan7_s** %3, align 8, !dbg !212
  %94 = getelementptr inbounds %struct.plan7_s* %93, i32 0, i32 30, !dbg !212
  %95 = load i32*** %94, align 8, !dbg !212
  %96 = getelementptr inbounds i32** %95, i64 1, !dbg !212
  %97 = load i32** %96, align 8, !dbg !212
  store i32* %97, i32** %tpmi, align 8, !dbg !213
  %98 = load %struct.plan7_s** %3, align 8, !dbg !214
  %99 = getelementptr inbounds %struct.plan7_s* %98, i32 0, i32 30, !dbg !214
  %100 = load i32*** %99, align 8, !dbg !214
  %101 = getelementptr inbounds i32** %100, i64 4, !dbg !214
  %102 = load i32** %101, align 8, !dbg !214
  store i32* %102, i32** %tpii, align 8, !dbg !215
  %103 = load %struct.plan7_s** %3, align 8, !dbg !216
  %104 = getelementptr inbounds %struct.plan7_s* %103, i32 0, i32 34, !dbg !216
  %105 = load i32** %104, align 8, !dbg !216
  store i32* %105, i32** %bp, align 8, !dbg !217
  store i32 1, i32* %i, align 4, !dbg !218
  br label %106, !dbg !218

; <label>:106                                     ; preds = %676, %64
  %107 = load i32* %i, align 4, !dbg !220
  %108 = load i32* %2, align 4, !dbg !224
  %109 = icmp sle i32 %107, %108, !dbg !225
  br i1 %109, label %110, label %679, !dbg !226

; <label>:110                                     ; preds = %106
  %111 = load i32* %i, align 4, !dbg !227
  %112 = sext i32 %111 to i64, !dbg !229
  %113 = load i32*** %mmx, align 8, !dbg !229
  %114 = getelementptr inbounds i32** %113, i64 %112, !dbg !229
  %115 = load i32** %114, align 8, !dbg !229
  store i32* %115, i32** %mc, align 8, !dbg !230
  %116 = load i32* %i, align 4, !dbg !231
  %117 = sext i32 %116 to i64, !dbg !232
  %118 = load i32*** %dmx, align 8, !dbg !232
  %119 = getelementptr inbounds i32** %118, i64 %117, !dbg !232
  %120 = load i32** %119, align 8, !dbg !232
  store i32* %120, i32** %dc, align 8, !dbg !233
  %121 = load i32* %i, align 4, !dbg !234
  %122 = sext i32 %121 to i64, !dbg !235
  %123 = load i32*** %imx, align 8, !dbg !235
  %124 = getelementptr inbounds i32** %123, i64 %122, !dbg !235
  %125 = load i32** %124, align 8, !dbg !235
  store i32* %125, i32** %ic, align 8, !dbg !236
  %126 = load i32* %i, align 4, !dbg !237
  %127 = sub nsw i32 %126, 1, !dbg !237
  %128 = sext i32 %127 to i64, !dbg !238
  %129 = load i32*** %mmx, align 8, !dbg !238
  %130 = getelementptr inbounds i32** %129, i64 %128, !dbg !238
  %131 = load i32** %130, align 8, !dbg !238
  store i32* %131, i32** %mpp, align 8, !dbg !239
  %132 = load i32* %i, align 4, !dbg !240
  %133 = sub nsw i32 %132, 1, !dbg !240
  %134 = sext i32 %133 to i64, !dbg !241
  %135 = load i32*** %dmx, align 8, !dbg !241
  %136 = getelementptr inbounds i32** %135, i64 %134, !dbg !241
  %137 = load i32** %136, align 8, !dbg !241
  store i32* %137, i32** %dpp, align 8, !dbg !242
  %138 = load i32* %i, align 4, !dbg !243
  %139 = sub nsw i32 %138, 1, !dbg !243
  %140 = sext i32 %139 to i64, !dbg !244
  %141 = load i32*** %imx, align 8, !dbg !244
  %142 = getelementptr inbounds i32** %141, i64 %140, !dbg !244
  %143 = load i32** %142, align 8, !dbg !244
  store i32* %143, i32** %ip, align 8, !dbg !245
  %144 = load i32* %i, align 4, !dbg !246
  %145 = sub nsw i32 %144, 1, !dbg !246
  %146 = sext i32 %145 to i64, !dbg !247
  %147 = load i32*** %xmx, align 8, !dbg !247
  %148 = getelementptr inbounds i32** %147, i64 %146, !dbg !247
  %149 = load i32** %148, align 8, !dbg !247
  %150 = getelementptr inbounds i32* %149, i64 0, !dbg !247
  %151 = load i32* %150, align 4, !dbg !247
  store i32 %151, i32* %xmb, align 4, !dbg !248
  %152 = load i32* %i, align 4, !dbg !249
  %153 = sext i32 %152 to i64, !dbg !250
  %154 = load i8** %1, align 8, !dbg !250
  %155 = getelementptr inbounds i8* %154, i64 %153, !dbg !250
  %156 = load i8* %155, align 1, !dbg !250
  %157 = sext i8 %156 to i32, !dbg !251
  %158 = sext i32 %157 to i64, !dbg !252
  %159 = load %struct.plan7_s** %3, align 8, !dbg !252
  %160 = getelementptr inbounds %struct.plan7_s* %159, i32 0, i32 31, !dbg !252
  %161 = load i32*** %160, align 8, !dbg !252
  %162 = getelementptr inbounds i32** %161, i64 %158, !dbg !252
  %163 = load i32** %162, align 8, !dbg !252
  store i32* %163, i32** %ms, align 8, !dbg !253
  %164 = load i32* %i, align 4, !dbg !254
  %165 = sext i32 %164 to i64, !dbg !255
  %166 = load i8** %1, align 8, !dbg !255
  %167 = getelementptr inbounds i8* %166, i64 %165, !dbg !255
  %168 = load i8* %167, align 1, !dbg !255
  %169 = sext i8 %168 to i32, !dbg !256
  %170 = sext i32 %169 to i64, !dbg !257
  %171 = load %struct.plan7_s** %3, align 8, !dbg !257
  %172 = getelementptr inbounds %struct.plan7_s* %171, i32 0, i32 32, !dbg !257
  %173 = load i32*** %172, align 8, !dbg !257
  %174 = getelementptr inbounds i32** %173, i64 %170, !dbg !257
  %175 = load i32** %174, align 8, !dbg !257
  store i32* %175, i32** %is, align 8, !dbg !258
  %176 = load i32** %mc, align 8, !dbg !259
  %177 = getelementptr inbounds i32* %176, i64 0, !dbg !259
  store i32 -987654321, i32* %177, align 4, !dbg !259
  %178 = load i32** %dc, align 8, !dbg !260
  %179 = getelementptr inbounds i32* %178, i64 0, !dbg !260
  store i32 -987654321, i32* %179, align 4, !dbg !260
  %180 = load i32** %ic, align 8, !dbg !261
  %181 = getelementptr inbounds i32* %180, i64 0, !dbg !261
  store i32 -987654321, i32* %181, align 4, !dbg !261
  store i32 1, i32* %k, align 4, !dbg !262
  br label %182, !dbg !262

; <label>:182                                     ; preds = %421, %110
  %183 = load i32* %k, align 4, !dbg !264
  %184 = load i32* %M, align 4, !dbg !268
  %185 = icmp sle i32 %183, %184, !dbg !269
  br i1 %185, label %186, label %424, !dbg !270

; <label>:186                                     ; preds = %182
  %187 = load i32* %k, align 4, !dbg !271
  %188 = sub nsw i32 %187, 1, !dbg !271
  %189 = sext i32 %188 to i64, !dbg !273
  %190 = load i32** %mpp, align 8, !dbg !273
  %191 = getelementptr inbounds i32* %190, i64 %189, !dbg !273
  %192 = load i32* %191, align 4, !dbg !273
  %193 = load i32* %k, align 4, !dbg !274
  %194 = sub nsw i32 %193, 1, !dbg !274
  %195 = sext i32 %194 to i64, !dbg !275
  %196 = load i32** %tpmm, align 8, !dbg !275
  %197 = getelementptr inbounds i32* %196, i64 %195, !dbg !275
  %198 = load i32* %197, align 4, !dbg !275
  %199 = add nsw i32 %192, %198, !dbg !273
  %200 = load i32* %k, align 4, !dbg !276
  %201 = sext i32 %200 to i64, !dbg !277
  %202 = load i32** %mc, align 8, !dbg !277
  %203 = getelementptr inbounds i32* %202, i64 %201, !dbg !277
  store i32 %199, i32* %203, align 4, !dbg !277
  %204 = load i32* %k, align 4, !dbg !278
  %205 = sub nsw i32 %204, 1, !dbg !278
  %206 = sext i32 %205 to i64, !dbg !280
  %207 = load i32** %ip, align 8, !dbg !280
  %208 = getelementptr inbounds i32* %207, i64 %206, !dbg !280
  %209 = load i32* %208, align 4, !dbg !280
  %210 = load i32* %k, align 4, !dbg !281
  %211 = sub nsw i32 %210, 1, !dbg !281
  %212 = sext i32 %211 to i64, !dbg !282
  %213 = load i32** %tpim, align 8, !dbg !282
  %214 = getelementptr inbounds i32* %213, i64 %212, !dbg !282
  %215 = load i32* %214, align 4, !dbg !282
  %216 = add nsw i32 %209, %215, !dbg !280
  store i32 %216, i32* %sc, align 4, !dbg !283
  %217 = load i32* %k, align 4, !dbg !284
  %218 = sext i32 %217 to i64, !dbg !285
  %219 = load i32** %mc, align 8, !dbg !285
  %220 = getelementptr inbounds i32* %219, i64 %218, !dbg !285
  %221 = load i32* %220, align 4, !dbg !285
  %222 = icmp sgt i32 %216, %221, !dbg !286
  br i1 %222, label %223, label %229, !dbg !287

; <label>:223                                     ; preds = %186
  %224 = load i32* %sc, align 4, !dbg !288
  %225 = load i32* %k, align 4, !dbg !290
  %226 = sext i32 %225 to i64, !dbg !291
  %227 = load i32** %mc, align 8, !dbg !291
  %228 = getelementptr inbounds i32* %227, i64 %226, !dbg !291
  store i32 %224, i32* %228, align 4, !dbg !291
  br label %229, !dbg !291

; <label>:229                                     ; preds = %223, %186
  %230 = load i32* %k, align 4, !dbg !292
  %231 = sub nsw i32 %230, 1, !dbg !292
  %232 = sext i32 %231 to i64, !dbg !294
  %233 = load i32** %dpp, align 8, !dbg !294
  %234 = getelementptr inbounds i32* %233, i64 %232, !dbg !294
  %235 = load i32* %234, align 4, !dbg !294
  %236 = load i32* %k, align 4, !dbg !295
  %237 = sub nsw i32 %236, 1, !dbg !295
  %238 = sext i32 %237 to i64, !dbg !296
  %239 = load i32** %tpdm, align 8, !dbg !296
  %240 = getelementptr inbounds i32* %239, i64 %238, !dbg !296
  %241 = load i32* %240, align 4, !dbg !296
  %242 = add nsw i32 %235, %241, !dbg !294
  store i32 %242, i32* %sc, align 4, !dbg !297
  %243 = load i32* %k, align 4, !dbg !298
  %244 = sext i32 %243 to i64, !dbg !299
  %245 = load i32** %mc, align 8, !dbg !299
  %246 = getelementptr inbounds i32* %245, i64 %244, !dbg !299
  %247 = load i32* %246, align 4, !dbg !299
  %248 = icmp sgt i32 %242, %247, !dbg !300
  br i1 %248, label %249, label %255, !dbg !301

; <label>:249                                     ; preds = %229
  %250 = load i32* %sc, align 4, !dbg !302
  %251 = load i32* %k, align 4, !dbg !304
  %252 = sext i32 %251 to i64, !dbg !305
  %253 = load i32** %mc, align 8, !dbg !305
  %254 = getelementptr inbounds i32* %253, i64 %252, !dbg !305
  store i32 %250, i32* %254, align 4, !dbg !305
  br label %255, !dbg !305

; <label>:255                                     ; preds = %249, %229
  %256 = load i32* %xmb, align 4, !dbg !306
  %257 = load i32* %k, align 4, !dbg !308
  %258 = sext i32 %257 to i64, !dbg !309
  %259 = load i32** %bp, align 8, !dbg !309
  %260 = getelementptr inbounds i32* %259, i64 %258, !dbg !309
  %261 = load i32* %260, align 4, !dbg !309
  %262 = add nsw i32 %256, %261, !dbg !306
  store i32 %262, i32* %sc, align 4, !dbg !310
  %263 = load i32* %k, align 4, !dbg !311
  %264 = sext i32 %263 to i64, !dbg !312
  %265 = load i32** %mc, align 8, !dbg !312
  %266 = getelementptr inbounds i32* %265, i64 %264, !dbg !312
  %267 = load i32* %266, align 4, !dbg !312
  %268 = icmp sgt i32 %262, %267, !dbg !313
  br i1 %268, label %269, label %275, !dbg !314

; <label>:269                                     ; preds = %255
  %270 = load i32* %sc, align 4, !dbg !315
  %271 = load i32* %k, align 4, !dbg !317
  %272 = sext i32 %271 to i64, !dbg !318
  %273 = load i32** %mc, align 8, !dbg !318
  %274 = getelementptr inbounds i32* %273, i64 %272, !dbg !318
  store i32 %270, i32* %274, align 4, !dbg !318
  br label %275, !dbg !318

; <label>:275                                     ; preds = %269, %255
  %276 = load i32* %k, align 4, !dbg !319
  %277 = sext i32 %276 to i64, !dbg !320
  %278 = load i32** %ms, align 8, !dbg !320
  %279 = getelementptr inbounds i32* %278, i64 %277, !dbg !320
  %280 = load i32* %279, align 4, !dbg !320
  %281 = load i32* %k, align 4, !dbg !321
  %282 = sext i32 %281 to i64, !dbg !322
  %283 = load i32** %mc, align 8, !dbg !322
  %284 = getelementptr inbounds i32* %283, i64 %282, !dbg !322
  %285 = load i32* %284, align 4, !dbg !322
  %286 = add nsw i32 %285, %280, !dbg !322
  store i32 %286, i32* %284, align 4, !dbg !322
  %287 = load i32* %k, align 4, !dbg !323
  %288 = sext i32 %287 to i64, !dbg !325
  %289 = load i32** %mc, align 8, !dbg !325
  %290 = getelementptr inbounds i32* %289, i64 %288, !dbg !325
  %291 = load i32* %290, align 4, !dbg !325
  %292 = icmp slt i32 %291, -987654321, !dbg !325
  br i1 %292, label %293, label %298, !dbg !326

; <label>:293                                     ; preds = %275
  %294 = load i32* %k, align 4, !dbg !327
  %295 = sext i32 %294 to i64, !dbg !329
  %296 = load i32** %mc, align 8, !dbg !329
  %297 = getelementptr inbounds i32* %296, i64 %295, !dbg !329
  store i32 -987654321, i32* %297, align 4, !dbg !329
  br label %298, !dbg !329

; <label>:298                                     ; preds = %293, %275
  %299 = load i32* %k, align 4, !dbg !330
  %300 = sub nsw i32 %299, 1, !dbg !330
  %301 = sext i32 %300 to i64, !dbg !331
  %302 = load i32** %dc, align 8, !dbg !331
  %303 = getelementptr inbounds i32* %302, i64 %301, !dbg !331
  %304 = load i32* %303, align 4, !dbg !331
  %305 = load i32* %k, align 4, !dbg !332
  %306 = sub nsw i32 %305, 1, !dbg !332
  %307 = sext i32 %306 to i64, !dbg !333
  %308 = load i32** %tpdd, align 8, !dbg !333
  %309 = getelementptr inbounds i32* %308, i64 %307, !dbg !333
  %310 = load i32* %309, align 4, !dbg !333
  %311 = add nsw i32 %304, %310, !dbg !331
  %312 = load i32* %k, align 4, !dbg !334
  %313 = sext i32 %312 to i64, !dbg !335
  %314 = load i32** %dc, align 8, !dbg !335
  %315 = getelementptr inbounds i32* %314, i64 %313, !dbg !335
  store i32 %311, i32* %315, align 4, !dbg !335
  %316 = load i32* %k, align 4, !dbg !336
  %317 = sub nsw i32 %316, 1, !dbg !336
  %318 = sext i32 %317 to i64, !dbg !338
  %319 = load i32** %mc, align 8, !dbg !338
  %320 = getelementptr inbounds i32* %319, i64 %318, !dbg !338
  %321 = load i32* %320, align 4, !dbg !338
  %322 = load i32* %k, align 4, !dbg !339
  %323 = sub nsw i32 %322, 1, !dbg !339
  %324 = sext i32 %323 to i64, !dbg !340
  %325 = load i32** %tpmd, align 8, !dbg !340
  %326 = getelementptr inbounds i32* %325, i64 %324, !dbg !340
  %327 = load i32* %326, align 4, !dbg !340
  %328 = add nsw i32 %321, %327, !dbg !338
  store i32 %328, i32* %sc, align 4, !dbg !341
  %329 = load i32* %k, align 4, !dbg !342
  %330 = sext i32 %329 to i64, !dbg !343
  %331 = load i32** %dc, align 8, !dbg !343
  %332 = getelementptr inbounds i32* %331, i64 %330, !dbg !343
  %333 = load i32* %332, align 4, !dbg !343
  %334 = icmp sgt i32 %328, %333, !dbg !344
  br i1 %334, label %335, label %341, !dbg !345

; <label>:335                                     ; preds = %298
  %336 = load i32* %sc, align 4, !dbg !346
  %337 = load i32* %k, align 4, !dbg !348
  %338 = sext i32 %337 to i64, !dbg !349
  %339 = load i32** %dc, align 8, !dbg !349
  %340 = getelementptr inbounds i32* %339, i64 %338, !dbg !349
  store i32 %336, i32* %340, align 4, !dbg !349
  br label %341, !dbg !349

; <label>:341                                     ; preds = %335, %298
  %342 = load i32* %k, align 4, !dbg !350
  %343 = sext i32 %342 to i64, !dbg !352
  %344 = load i32** %dc, align 8, !dbg !352
  %345 = getelementptr inbounds i32* %344, i64 %343, !dbg !352
  %346 = load i32* %345, align 4, !dbg !352
  %347 = icmp slt i32 %346, -987654321, !dbg !352
  br i1 %347, label %348, label %353, !dbg !353

; <label>:348                                     ; preds = %341
  %349 = load i32* %k, align 4, !dbg !354
  %350 = sext i32 %349 to i64, !dbg !356
  %351 = load i32** %dc, align 8, !dbg !356
  %352 = getelementptr inbounds i32* %351, i64 %350, !dbg !356
  store i32 -987654321, i32* %352, align 4, !dbg !356
  br label %353, !dbg !356

; <label>:353                                     ; preds = %348, %341
  %354 = load i32* %k, align 4, !dbg !357
  %355 = load i32* %M, align 4, !dbg !359
  %356 = icmp slt i32 %354, %355, !dbg !357
  br i1 %356, label %357, label %420, !dbg !360

; <label>:357                                     ; preds = %353
  %358 = load i32* %k, align 4, !dbg !361
  %359 = sext i32 %358 to i64, !dbg !363
  %360 = load i32** %mpp, align 8, !dbg !363
  %361 = getelementptr inbounds i32* %360, i64 %359, !dbg !363
  %362 = load i32* %361, align 4, !dbg !363
  %363 = load i32* %k, align 4, !dbg !364
  %364 = sext i32 %363 to i64, !dbg !365
  %365 = load i32** %tpmi, align 8, !dbg !365
  %366 = getelementptr inbounds i32* %365, i64 %364, !dbg !365
  %367 = load i32* %366, align 4, !dbg !365
  %368 = add nsw i32 %362, %367, !dbg !363
  %369 = load i32* %k, align 4, !dbg !366
  %370 = sext i32 %369 to i64, !dbg !367
  %371 = load i32** %ic, align 8, !dbg !367
  %372 = getelementptr inbounds i32* %371, i64 %370, !dbg !367
  store i32 %368, i32* %372, align 4, !dbg !367
  %373 = load i32* %k, align 4, !dbg !368
  %374 = sext i32 %373 to i64, !dbg !370
  %375 = load i32** %ip, align 8, !dbg !370
  %376 = getelementptr inbounds i32* %375, i64 %374, !dbg !370
  %377 = load i32* %376, align 4, !dbg !370
  %378 = load i32* %k, align 4, !dbg !371
  %379 = sext i32 %378 to i64, !dbg !372
  %380 = load i32** %tpii, align 8, !dbg !372
  %381 = getelementptr inbounds i32* %380, i64 %379, !dbg !372
  %382 = load i32* %381, align 4, !dbg !372
  %383 = add nsw i32 %377, %382, !dbg !370
  store i32 %383, i32* %sc, align 4, !dbg !373
  %384 = load i32* %k, align 4, !dbg !374
  %385 = sext i32 %384 to i64, !dbg !375
  %386 = load i32** %ic, align 8, !dbg !375
  %387 = getelementptr inbounds i32* %386, i64 %385, !dbg !375
  %388 = load i32* %387, align 4, !dbg !375
  %389 = icmp sgt i32 %383, %388, !dbg !376
  br i1 %389, label %390, label %396, !dbg !377

; <label>:390                                     ; preds = %357
  %391 = load i32* %sc, align 4, !dbg !378
  %392 = load i32* %k, align 4, !dbg !380
  %393 = sext i32 %392 to i64, !dbg !381
  %394 = load i32** %ic, align 8, !dbg !381
  %395 = getelementptr inbounds i32* %394, i64 %393, !dbg !381
  store i32 %391, i32* %395, align 4, !dbg !381
  br label %396, !dbg !381

; <label>:396                                     ; preds = %390, %357
  %397 = load i32* %k, align 4, !dbg !382
  %398 = sext i32 %397 to i64, !dbg !383
  %399 = load i32** %is, align 8, !dbg !383
  %400 = getelementptr inbounds i32* %399, i64 %398, !dbg !383
  %401 = load i32* %400, align 4, !dbg !383
  %402 = load i32* %k, align 4, !dbg !384
  %403 = sext i32 %402 to i64, !dbg !385
  %404 = load i32** %ic, align 8, !dbg !385
  %405 = getelementptr inbounds i32* %404, i64 %403, !dbg !385
  %406 = load i32* %405, align 4, !dbg !385
  %407 = add nsw i32 %406, %401, !dbg !385
  store i32 %407, i32* %405, align 4, !dbg !385
  %408 = load i32* %k, align 4, !dbg !386
  %409 = sext i32 %408 to i64, !dbg !388
  %410 = load i32** %ic, align 8, !dbg !388
  %411 = getelementptr inbounds i32* %410, i64 %409, !dbg !388
  %412 = load i32* %411, align 4, !dbg !388
  %413 = icmp slt i32 %412, -987654321, !dbg !388
  br i1 %413, label %414, label %419, !dbg !389

; <label>:414                                     ; preds = %396
  %415 = load i32* %k, align 4, !dbg !390
  %416 = sext i32 %415 to i64, !dbg !392
  %417 = load i32** %ic, align 8, !dbg !392
  %418 = getelementptr inbounds i32* %417, i64 %416, !dbg !392
  store i32 -987654321, i32* %418, align 4, !dbg !392
  br label %419, !dbg !392

; <label>:419                                     ; preds = %414, %396
  br label %420, !dbg !393

; <label>:420                                     ; preds = %419, %353
  br label %421, !dbg !394

; <label>:421                                     ; preds = %420
  %422 = load i32* %k, align 4, !dbg !395
  %423 = add nsw i32 %422, 1, !dbg !395
  store i32 %423, i32* %k, align 4, !dbg !395
  br label %182, !dbg !396

; <label>:424                                     ; preds = %182
  %425 = load i32* %i, align 4, !dbg !397
  %426 = sext i32 %425 to i64, !dbg !398
  %427 = load i32*** %xmx, align 8, !dbg !398
  %428 = getelementptr inbounds i32** %427, i64 %426, !dbg !398
  %429 = load i32** %428, align 8, !dbg !398
  %430 = getelementptr inbounds i32* %429, i64 4, !dbg !398
  store i32 -987654321, i32* %430, align 4, !dbg !398
  %431 = load i32* %i, align 4, !dbg !399
  %432 = sub nsw i32 %431, 1, !dbg !399
  %433 = sext i32 %432 to i64, !dbg !401
  %434 = load i32*** %xmx, align 8, !dbg !401
  %435 = getelementptr inbounds i32** %434, i64 %433, !dbg !401
  %436 = load i32** %435, align 8, !dbg !401
  %437 = getelementptr inbounds i32* %436, i64 4, !dbg !401
  %438 = load i32* %437, align 4, !dbg !401
  %439 = load %struct.plan7_s** %3, align 8, !dbg !402
  %440 = getelementptr inbounds %struct.plan7_s* %439, i32 0, i32 33, !dbg !402
  %441 = getelementptr inbounds [4 x [2 x i32]]* %440, i32 0, i64 0, !dbg !402
  %442 = getelementptr inbounds [2 x i32]* %441, i32 0, i64 1, !dbg !402
  %443 = load i32* %442, align 4, !dbg !402
  %444 = add nsw i32 %438, %443, !dbg !401
  store i32 %444, i32* %sc, align 4, !dbg !403
  %445 = icmp sgt i32 %444, -987654321, !dbg !404
  br i1 %445, label %446, label %454, !dbg !405

; <label>:446                                     ; preds = %424
  %447 = load i32* %sc, align 4, !dbg !406
  %448 = load i32* %i, align 4, !dbg !407
  %449 = sext i32 %448 to i64, !dbg !408
  %450 = load i32*** %xmx, align 8, !dbg !408
  %451 = getelementptr inbounds i32** %450, i64 %449, !dbg !408
  %452 = load i32** %451, align 8, !dbg !408
  %453 = getelementptr inbounds i32* %452, i64 4, !dbg !408
  store i32 %447, i32* %453, align 4, !dbg !408
  br label %454, !dbg !408

; <label>:454                                     ; preds = %446, %424
  store i32 -987654321, i32* %xme, align 4, !dbg !409
  %455 = load i32* %i, align 4, !dbg !410
  %456 = sext i32 %455 to i64, !dbg !411
  %457 = load i32*** %mmx, align 8, !dbg !411
  %458 = getelementptr inbounds i32** %457, i64 %456, !dbg !411
  %459 = load i32** %458, align 8, !dbg !411
  store i32* %459, i32** %mpc, align 8, !dbg !412
  %460 = load %struct.plan7_s** %3, align 8, !dbg !413
  %461 = getelementptr inbounds %struct.plan7_s* %460, i32 0, i32 35, !dbg !413
  %462 = load i32** %461, align 8, !dbg !413
  store i32* %462, i32** %ep, align 8, !dbg !414
  store i32 1, i32* %k, align 4, !dbg !415
  br label %463, !dbg !415

; <label>:463                                     ; preds = %486, %454
  %464 = load i32* %k, align 4, !dbg !417
  %465 = load %struct.plan7_s** %3, align 8, !dbg !421
  %466 = getelementptr inbounds %struct.plan7_s* %465, i32 0, i32 20, !dbg !421
  %467 = load i32* %466, align 4, !dbg !421
  %468 = icmp sle i32 %464, %467, !dbg !422
  br i1 %468, label %469, label %489, !dbg !423

; <label>:469                                     ; preds = %463
  %470 = load i32* %k, align 4, !dbg !424
  %471 = sext i32 %470 to i64, !dbg !426
  %472 = load i32** %mpc, align 8, !dbg !426
  %473 = getelementptr inbounds i32* %472, i64 %471, !dbg !426
  %474 = load i32* %473, align 4, !dbg !426
  %475 = load i32* %k, align 4, !dbg !427
  %476 = sext i32 %475 to i64, !dbg !428
  %477 = load i32** %ep, align 8, !dbg !428
  %478 = getelementptr inbounds i32* %477, i64 %476, !dbg !428
  %479 = load i32* %478, align 4, !dbg !428
  %480 = add nsw i32 %474, %479, !dbg !426
  store i32 %480, i32* %sc, align 4, !dbg !429
  %481 = load i32* %xme, align 4, !dbg !430
  %482 = icmp sgt i32 %480, %481, !dbg !431
  br i1 %482, label %483, label %485, !dbg !432

; <label>:483                                     ; preds = %469
  %484 = load i32* %sc, align 4, !dbg !433
  store i32 %484, i32* %xme, align 4, !dbg !435
  br label %485, !dbg !435

; <label>:485                                     ; preds = %483, %469
  br label %486, !dbg !436

; <label>:486                                     ; preds = %485
  %487 = load i32* %k, align 4, !dbg !439
  %488 = add nsw i32 %487, 1, !dbg !439
  store i32 %488, i32* %k, align 4, !dbg !439
  br label %463, !dbg !440

; <label>:489                                     ; preds = %463
  %490 = load i32* %xme, align 4, !dbg !441
  %491 = load i32* %i, align 4, !dbg !442
  %492 = sext i32 %491 to i64, !dbg !443
  %493 = load i32*** %xmx, align 8, !dbg !443
  %494 = getelementptr inbounds i32** %493, i64 %492, !dbg !443
  %495 = load i32** %494, align 8, !dbg !443
  %496 = getelementptr inbounds i32* %495, i64 1, !dbg !443
  store i32 %490, i32* %496, align 4, !dbg !443
  %497 = load i32* %i, align 4, !dbg !444
  %498 = sext i32 %497 to i64, !dbg !445
  %499 = load i32*** %xmx, align 8, !dbg !445
  %500 = getelementptr inbounds i32** %499, i64 %498, !dbg !445
  %501 = load i32** %500, align 8, !dbg !445
  %502 = getelementptr inbounds i32* %501, i64 3, !dbg !445
  store i32 -987654321, i32* %502, align 4, !dbg !445
  %503 = load i32* %i, align 4, !dbg !446
  %504 = sub nsw i32 %503, 1, !dbg !446
  %505 = sext i32 %504 to i64, !dbg !448
  %506 = load i32*** %xmx, align 8, !dbg !448
  %507 = getelementptr inbounds i32** %506, i64 %505, !dbg !448
  %508 = load i32** %507, align 8, !dbg !448
  %509 = getelementptr inbounds i32* %508, i64 3, !dbg !448
  %510 = load i32* %509, align 4, !dbg !448
  %511 = load %struct.plan7_s** %3, align 8, !dbg !449
  %512 = getelementptr inbounds %struct.plan7_s* %511, i32 0, i32 33, !dbg !449
  %513 = getelementptr inbounds [4 x [2 x i32]]* %512, i32 0, i64 3, !dbg !449
  %514 = getelementptr inbounds [2 x i32]* %513, i32 0, i64 1, !dbg !449
  %515 = load i32* %514, align 4, !dbg !449
  %516 = add nsw i32 %510, %515, !dbg !448
  store i32 %516, i32* %sc, align 4, !dbg !450
  %517 = icmp sgt i32 %516, -987654321, !dbg !451
  br i1 %517, label %518, label %526, !dbg !452

; <label>:518                                     ; preds = %489
  %519 = load i32* %sc, align 4, !dbg !453
  %520 = load i32* %i, align 4, !dbg !454
  %521 = sext i32 %520 to i64, !dbg !455
  %522 = load i32*** %xmx, align 8, !dbg !455
  %523 = getelementptr inbounds i32** %522, i64 %521, !dbg !455
  %524 = load i32** %523, align 8, !dbg !455
  %525 = getelementptr inbounds i32* %524, i64 3, !dbg !455
  store i32 %519, i32* %525, align 4, !dbg !455
  br label %526, !dbg !455

; <label>:526                                     ; preds = %518, %489
  %527 = load i32* %i, align 4, !dbg !456
  %528 = sext i32 %527 to i64, !dbg !458
  %529 = load i32*** %xmx, align 8, !dbg !458
  %530 = getelementptr inbounds i32** %529, i64 %528, !dbg !458
  %531 = load i32** %530, align 8, !dbg !458
  %532 = getelementptr inbounds i32* %531, i64 1, !dbg !458
  %533 = load i32* %532, align 4, !dbg !458
  %534 = load %struct.plan7_s** %3, align 8, !dbg !459
  %535 = getelementptr inbounds %struct.plan7_s* %534, i32 0, i32 33, !dbg !459
  %536 = getelementptr inbounds [4 x [2 x i32]]* %535, i32 0, i64 1, !dbg !459
  %537 = getelementptr inbounds [2 x i32]* %536, i32 0, i64 1, !dbg !459
  %538 = load i32* %537, align 4, !dbg !459
  %539 = add nsw i32 %533, %538, !dbg !458
  store i32 %539, i32* %sc, align 4, !dbg !460
  %540 = load i32* %i, align 4, !dbg !461
  %541 = sext i32 %540 to i64, !dbg !462
  %542 = load i32*** %xmx, align 8, !dbg !462
  %543 = getelementptr inbounds i32** %542, i64 %541, !dbg !462
  %544 = load i32** %543, align 8, !dbg !462
  %545 = getelementptr inbounds i32* %544, i64 3, !dbg !462
  %546 = load i32* %545, align 4, !dbg !462
  %547 = icmp sgt i32 %539, %546, !dbg !463
  br i1 %547, label %548, label %556, !dbg !464

; <label>:548                                     ; preds = %526
  %549 = load i32* %sc, align 4, !dbg !465
  %550 = load i32* %i, align 4, !dbg !466
  %551 = sext i32 %550 to i64, !dbg !467
  %552 = load i32*** %xmx, align 8, !dbg !467
  %553 = getelementptr inbounds i32** %552, i64 %551, !dbg !467
  %554 = load i32** %553, align 8, !dbg !467
  %555 = getelementptr inbounds i32* %554, i64 3, !dbg !467
  store i32 %549, i32* %555, align 4, !dbg !467
  br label %556, !dbg !467

; <label>:556                                     ; preds = %548, %526
  %557 = load i32* %i, align 4, !dbg !468
  %558 = sext i32 %557 to i64, !dbg !469
  %559 = load i32*** %xmx, align 8, !dbg !469
  %560 = getelementptr inbounds i32** %559, i64 %558, !dbg !469
  %561 = load i32** %560, align 8, !dbg !469
  %562 = getelementptr inbounds i32* %561, i64 0, !dbg !469
  store i32 -987654321, i32* %562, align 4, !dbg !469
  %563 = load i32* %i, align 4, !dbg !470
  %564 = sext i32 %563 to i64, !dbg !472
  %565 = load i32*** %xmx, align 8, !dbg !472
  %566 = getelementptr inbounds i32** %565, i64 %564, !dbg !472
  %567 = load i32** %566, align 8, !dbg !472
  %568 = getelementptr inbounds i32* %567, i64 4, !dbg !472
  %569 = load i32* %568, align 4, !dbg !472
  %570 = load %struct.plan7_s** %3, align 8, !dbg !473
  %571 = getelementptr inbounds %struct.plan7_s* %570, i32 0, i32 33, !dbg !473
  %572 = getelementptr inbounds [4 x [2 x i32]]* %571, i32 0, i64 0, !dbg !473
  %573 = getelementptr inbounds [2 x i32]* %572, i32 0, i64 0, !dbg !473
  %574 = load i32* %573, align 4, !dbg !473
  %575 = add nsw i32 %569, %574, !dbg !472
  store i32 %575, i32* %sc, align 4, !dbg !474
  %576 = icmp sgt i32 %575, -987654321, !dbg !475
  br i1 %576, label %577, label %585, !dbg !476

; <label>:577                                     ; preds = %556
  %578 = load i32* %sc, align 4, !dbg !477
  %579 = load i32* %i, align 4, !dbg !478
  %580 = sext i32 %579 to i64, !dbg !479
  %581 = load i32*** %xmx, align 8, !dbg !479
  %582 = getelementptr inbounds i32** %581, i64 %580, !dbg !479
  %583 = load i32** %582, align 8, !dbg !479
  %584 = getelementptr inbounds i32* %583, i64 0, !dbg !479
  store i32 %578, i32* %584, align 4, !dbg !479
  br label %585, !dbg !479

; <label>:585                                     ; preds = %577, %556
  %586 = load i32* %i, align 4, !dbg !480
  %587 = sext i32 %586 to i64, !dbg !482
  %588 = load i32*** %xmx, align 8, !dbg !482
  %589 = getelementptr inbounds i32** %588, i64 %587, !dbg !482
  %590 = load i32** %589, align 8, !dbg !482
  %591 = getelementptr inbounds i32* %590, i64 3, !dbg !482
  %592 = load i32* %591, align 4, !dbg !482
  %593 = load %struct.plan7_s** %3, align 8, !dbg !483
  %594 = getelementptr inbounds %struct.plan7_s* %593, i32 0, i32 33, !dbg !483
  %595 = getelementptr inbounds [4 x [2 x i32]]* %594, i32 0, i64 3, !dbg !483
  %596 = getelementptr inbounds [2 x i32]* %595, i32 0, i64 0, !dbg !483
  %597 = load i32* %596, align 4, !dbg !483
  %598 = add nsw i32 %592, %597, !dbg !482
  store i32 %598, i32* %sc, align 4, !dbg !484
  %599 = load i32* %i, align 4, !dbg !485
  %600 = sext i32 %599 to i64, !dbg !486
  %601 = load i32*** %xmx, align 8, !dbg !486
  %602 = getelementptr inbounds i32** %601, i64 %600, !dbg !486
  %603 = load i32** %602, align 8, !dbg !486
  %604 = getelementptr inbounds i32* %603, i64 0, !dbg !486
  %605 = load i32* %604, align 4, !dbg !486
  %606 = icmp sgt i32 %598, %605, !dbg !487
  br i1 %606, label %607, label %615, !dbg !488

; <label>:607                                     ; preds = %585
  %608 = load i32* %sc, align 4, !dbg !489
  %609 = load i32* %i, align 4, !dbg !490
  %610 = sext i32 %609 to i64, !dbg !491
  %611 = load i32*** %xmx, align 8, !dbg !491
  %612 = getelementptr inbounds i32** %611, i64 %610, !dbg !491
  %613 = load i32** %612, align 8, !dbg !491
  %614 = getelementptr inbounds i32* %613, i64 0, !dbg !491
  store i32 %608, i32* %614, align 4, !dbg !491
  br label %615, !dbg !491

; <label>:615                                     ; preds = %607, %585
  %616 = load i32* %i, align 4, !dbg !492
  %617 = sext i32 %616 to i64, !dbg !493
  %618 = load i32*** %xmx, align 8, !dbg !493
  %619 = getelementptr inbounds i32** %618, i64 %617, !dbg !493
  %620 = load i32** %619, align 8, !dbg !493
  %621 = getelementptr inbounds i32* %620, i64 2, !dbg !493
  store i32 -987654321, i32* %621, align 4, !dbg !493
  %622 = load i32* %i, align 4, !dbg !494
  %623 = sub nsw i32 %622, 1, !dbg !494
  %624 = sext i32 %623 to i64, !dbg !496
  %625 = load i32*** %xmx, align 8, !dbg !496
  %626 = getelementptr inbounds i32** %625, i64 %624, !dbg !496
  %627 = load i32** %626, align 8, !dbg !496
  %628 = getelementptr inbounds i32* %627, i64 2, !dbg !496
  %629 = load i32* %628, align 4, !dbg !496
  %630 = load %struct.plan7_s** %3, align 8, !dbg !497
  %631 = getelementptr inbounds %struct.plan7_s* %630, i32 0, i32 33, !dbg !497
  %632 = getelementptr inbounds [4 x [2 x i32]]* %631, i32 0, i64 2, !dbg !497
  %633 = getelementptr inbounds [2 x i32]* %632, i32 0, i64 1, !dbg !497
  %634 = load i32* %633, align 4, !dbg !497
  %635 = add nsw i32 %629, %634, !dbg !496
  store i32 %635, i32* %sc, align 4, !dbg !498
  %636 = icmp sgt i32 %635, -987654321, !dbg !499
  br i1 %636, label %637, label %645, !dbg !500

; <label>:637                                     ; preds = %615
  %638 = load i32* %sc, align 4, !dbg !501
  %639 = load i32* %i, align 4, !dbg !502
  %640 = sext i32 %639 to i64, !dbg !503
  %641 = load i32*** %xmx, align 8, !dbg !503
  %642 = getelementptr inbounds i32** %641, i64 %640, !dbg !503
  %643 = load i32** %642, align 8, !dbg !503
  %644 = getelementptr inbounds i32* %643, i64 2, !dbg !503
  store i32 %638, i32* %644, align 4, !dbg !503
  br label %645, !dbg !503

; <label>:645                                     ; preds = %637, %615
  %646 = load i32* %i, align 4, !dbg !504
  %647 = sext i32 %646 to i64, !dbg !506
  %648 = load i32*** %xmx, align 8, !dbg !506
  %649 = getelementptr inbounds i32** %648, i64 %647, !dbg !506
  %650 = load i32** %649, align 8, !dbg !506
  %651 = getelementptr inbounds i32* %650, i64 1, !dbg !506
  %652 = load i32* %651, align 4, !dbg !506
  %653 = load %struct.plan7_s** %3, align 8, !dbg !507
  %654 = getelementptr inbounds %struct.plan7_s* %653, i32 0, i32 33, !dbg !507
  %655 = getelementptr inbounds [4 x [2 x i32]]* %654, i32 0, i64 1, !dbg !507
  %656 = getelementptr inbounds [2 x i32]* %655, i32 0, i64 0, !dbg !507
  %657 = load i32* %656, align 4, !dbg !507
  %658 = add nsw i32 %652, %657, !dbg !506
  store i32 %658, i32* %sc, align 4, !dbg !508
  %659 = load i32* %i, align 4, !dbg !509
  %660 = sext i32 %659 to i64, !dbg !510
  %661 = load i32*** %xmx, align 8, !dbg !510
  %662 = getelementptr inbounds i32** %661, i64 %660, !dbg !510
  %663 = load i32** %662, align 8, !dbg !510
  %664 = getelementptr inbounds i32* %663, i64 2, !dbg !510
  %665 = load i32* %664, align 4, !dbg !510
  %666 = icmp sgt i32 %658, %665, !dbg !511
  br i1 %666, label %667, label %675, !dbg !512

; <label>:667                                     ; preds = %645
  %668 = load i32* %sc, align 4, !dbg !513
  %669 = load i32* %i, align 4, !dbg !514
  %670 = sext i32 %669 to i64, !dbg !515
  %671 = load i32*** %xmx, align 8, !dbg !515
  %672 = getelementptr inbounds i32** %671, i64 %670, !dbg !515
  %673 = load i32** %672, align 8, !dbg !515
  %674 = getelementptr inbounds i32* %673, i64 2, !dbg !515
  store i32 %668, i32* %674, align 4, !dbg !515
  br label %675, !dbg !515

; <label>:675                                     ; preds = %667, %645
  br label %676, !dbg !516

; <label>:676                                     ; preds = %675
  %677 = load i32* %i, align 4, !dbg !517
  %678 = add nsw i32 %677, 1, !dbg !517
  store i32 %678, i32* %i, align 4, !dbg !517
  br label %106, !dbg !518

; <label>:679                                     ; preds = %106
  %680 = load i32* %2, align 4, !dbg !519
  %681 = sext i32 %680 to i64, !dbg !520
  %682 = load i32*** %xmx, align 8, !dbg !520
  %683 = getelementptr inbounds i32** %682, i64 %681, !dbg !520
  %684 = load i32** %683, align 8, !dbg !520
  %685 = getelementptr inbounds i32* %684, i64 2, !dbg !520
  %686 = load i32* %685, align 4, !dbg !520
  %687 = load %struct.plan7_s** %3, align 8, !dbg !521
  %688 = getelementptr inbounds %struct.plan7_s* %687, i32 0, i32 33, !dbg !521
  %689 = getelementptr inbounds [4 x [2 x i32]]* %688, i32 0, i64 2, !dbg !521
  %690 = getelementptr inbounds [2 x i32]* %689, i32 0, i64 0, !dbg !521
  %691 = load i32* %690, align 4, !dbg !521
  %692 = add nsw i32 %686, %691, !dbg !520
  store i32 %692, i32* %sc, align 4, !dbg !522
  %693 = load %struct.p7trace_s*** %5, align 8, !dbg !523
  %694 = icmp ne %struct.p7trace_s** %693, null, !dbg !523
  br i1 %694, label %695, label %702, !dbg !525

; <label>:695                                     ; preds = %679
  %696 = load %struct.plan7_s** %3, align 8, !dbg !526
  %697 = load i8** %1, align 8, !dbg !528
  %698 = load i32* %2, align 4, !dbg !529
  %699 = load %struct.dpmatrix_s** %4, align 8, !dbg !530
  call void @P7ViterbiTrace(%struct.plan7_s* %696, i8* %697, i32 %698, %struct.dpmatrix_s* %699, %struct.p7trace_s** %tr), !dbg !531
  %700 = load %struct.p7trace_s** %tr, align 8, !dbg !532
  %701 = load %struct.p7trace_s*** %5, align 8, !dbg !533
  store %struct.p7trace_s* %700, %struct.p7trace_s** %701, align 8, !dbg !534
  br label %702, !dbg !535

; <label>:702                                     ; preds = %695, %679
  %703 = load i32* %sc, align 4, !dbg !536
  %704 = call float @Scorify(i32 %703), !dbg !537
  ret float %704, !dbg !538
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @ResizePlan7Matrix(%struct.dpmatrix_s*, i32, i32, i32***, i32***, i32***, i32***) #2

declare void @P7ViterbiTrace(%struct.plan7_s*, i8*, i32, %struct.dpmatrix_s*, %struct.p7trace_s**) #2

declare float @Scorify(i32) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!101, !102}
!llvm.ident = !{!103}

!0 = !{!"0x11\0012\00clang version 3.6.2 (tags/RELEASE_362/final)\000\00\000\00\001", !1, !2, !3, !6, !2, !2} ; [ DW_TAG_compile_unit ] [/media/sf_shared/SPEC/C/hmmer/fast_algorithms.c] [DW_LANG_C99]
!1 = !{!"fast_algorithms.c", !"/media/sf_shared/SPEC/C/hmmer"}
!2 = !{}
!3 = !{!4, !5}
!4 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!5 = !{!"0xf\00\000\0064\0064\000\000", null, null, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!6 = !{!7}
!7 = !{!"0x2e\00P7Viterbi\00P7Viterbi\00\0069\000\001\000\000\00256\000\0070", !1, !8, !9, null, float (i8*, i32, %struct.plan7_s*, %struct.dpmatrix_s*, %struct.p7trace_s**)* @P7Viterbi, null, null, !2} ; [ DW_TAG_subprogram ] [line 69] [def] [scope 70] [P7Viterbi]
!8 = !{!"0x29", !1}                               ; [ DW_TAG_file_type ] [/media/sf_shared/SPEC/C/hmmer/fast_algorithms.c]
!9 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !10, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!10 = !{!11, !12, !4, !14, !78, !93}
!11 = !{!"0x24\00float\000\0032\0032\000\000\004", null, null} ; [ DW_TAG_base_type ] [float] [line 0, size 32, align 32, offset 0, enc DW_ATE_float]
!12 = !{!"0xf\00\000\0064\0064\000\000", null, null, !13} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!13 = !{!"0x24\00char\000\008\008\000\000\006", null, null} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!14 = !{!"0xf\00\000\0064\0064\000\000", null, null, !15} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from plan7_s]
!15 = !{!"0x13\00plan7_s\00101\003712\0064\000\000\000", !16, null, null, !17, null, null, null} ; [ DW_TAG_structure_type ] [plan7_s] [line 101, size 3712, align 64, offset 0] [def] [from ]
!16 = !{!"./structs.h", !"/media/sf_shared/SPEC/C/hmmer"}
!17 = !{!18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !43, !44, !45, !46, !51, !52, !53, !57, !58, !60, !61, !62, !64, !65, !66, !67, !68, !69, !70, !71, !72, !73, !74, !75, !76, !77}
!18 = !{!"0xd\00name\00113\0064\0064\000\000", !16, !15, !12} ; [ DW_TAG_member ] [name] [line 113, size 64, align 64, offset 0] [from ]
!19 = !{!"0xd\00acc\00114\0064\0064\0064\000", !16, !15, !12} ; [ DW_TAG_member ] [acc] [line 114, size 64, align 64, offset 64] [from ]
!20 = !{!"0xd\00desc\00115\0064\0064\00128\000", !16, !15, !12} ; [ DW_TAG_member ] [desc] [line 115, size 64, align 64, offset 128] [from ]
!21 = !{!"0xd\00rf\00116\0064\0064\00192\000", !16, !15, !12} ; [ DW_TAG_member ] [rf] [line 116, size 64, align 64, offset 192] [from ]
!22 = !{!"0xd\00cs\00117\0064\0064\00256\000", !16, !15, !12} ; [ DW_TAG_member ] [cs] [line 117, size 64, align 64, offset 256] [from ]
!23 = !{!"0xd\00ca\00118\0064\0064\00320\000", !16, !15, !12} ; [ DW_TAG_member ] [ca] [line 118, size 64, align 64, offset 320] [from ]
!24 = !{!"0xd\00comlog\00119\0064\0064\00384\000", !16, !15, !12} ; [ DW_TAG_member ] [comlog] [line 119, size 64, align 64, offset 384] [from ]
!25 = !{!"0xd\00nseq\00120\0032\0032\00448\000", !16, !15, !4} ; [ DW_TAG_member ] [nseq] [line 120, size 32, align 32, offset 448] [from int]
!26 = !{!"0xd\00ctime\00121\0064\0064\00512\000", !16, !15, !12} ; [ DW_TAG_member ] [ctime] [line 121, size 64, align 64, offset 512] [from ]
!27 = !{!"0xd\00map\00122\0064\0064\00576\000", !16, !15, !28} ; [ DW_TAG_member ] [map] [line 122, size 64, align 64, offset 576] [from ]
!28 = !{!"0xf\00\000\0064\0064\000\000", null, null, !4} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!29 = !{!"0xd\00checksum\00123\0032\0032\00640\000", !16, !15, !4} ; [ DW_TAG_member ] [checksum] [line 123, size 32, align 32, offset 640] [from int]
!30 = !{!"0xd\00tpri\00134\0064\0064\00704\000", !16, !15, !28} ; [ DW_TAG_member ] [tpri] [line 134, size 64, align 64, offset 704] [from ]
!31 = !{!"0xd\00mpri\00135\0064\0064\00768\000", !16, !15, !28} ; [ DW_TAG_member ] [mpri] [line 135, size 64, align 64, offset 768] [from ]
!32 = !{!"0xd\00ipri\00136\0064\0064\00832\000", !16, !15, !28} ; [ DW_TAG_member ] [ipri] [line 136, size 64, align 64, offset 832] [from ]
!33 = !{!"0xd\00ga1\00144\0032\0032\00896\000", !16, !15, !11} ; [ DW_TAG_member ] [ga1] [line 144, size 32, align 32, offset 896] [from float]
!34 = !{!"0xd\00ga2\00144\0032\0032\00928\000", !16, !15, !11} ; [ DW_TAG_member ] [ga2] [line 144, size 32, align 32, offset 928] [from float]
!35 = !{!"0xd\00tc1\00145\0032\0032\00960\000", !16, !15, !11} ; [ DW_TAG_member ] [tc1] [line 145, size 32, align 32, offset 960] [from float]
!36 = !{!"0xd\00tc2\00145\0032\0032\00992\000", !16, !15, !11} ; [ DW_TAG_member ] [tc2] [line 145, size 32, align 32, offset 992] [from float]
!37 = !{!"0xd\00nc1\00146\0032\0032\001024\000", !16, !15, !11} ; [ DW_TAG_member ] [nc1] [line 146, size 32, align 32, offset 1024] [from float]
!38 = !{!"0xd\00nc2\00146\0032\0032\001056\000", !16, !15, !11} ; [ DW_TAG_member ] [nc2] [line 146, size 32, align 32, offset 1056] [from float]
!39 = !{!"0xd\00M\00155\0032\0032\001088\000", !16, !15, !4} ; [ DW_TAG_member ] [M] [line 155, size 32, align 32, offset 1088] [from int]
!40 = !{!"0xd\00t\00156\0064\0064\001152\000", !16, !15, !41} ; [ DW_TAG_member ] [t] [line 156, size 64, align 64, offset 1152] [from ]
!41 = !{!"0xf\00\000\0064\0064\000\000", null, null, !42} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!42 = !{!"0xf\00\000\0064\0064\000\000", null, null, !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from float]
!43 = !{!"0xd\00mat\00157\0064\0064\001216\000", !16, !15, !41} ; [ DW_TAG_member ] [mat] [line 157, size 64, align 64, offset 1216] [from ]
!44 = !{!"0xd\00ins\00158\0064\0064\001280\000", !16, !15, !41} ; [ DW_TAG_member ] [ins] [line 158, size 64, align 64, offset 1280] [from ]
!45 = !{!"0xd\00tbd1\00159\0032\0032\001344\000", !16, !15, !11} ; [ DW_TAG_member ] [tbd1] [line 159, size 32, align 32, offset 1344] [from float]
!46 = !{!"0xd\00xt\00168\00256\0032\001376\000", !16, !15, !47} ; [ DW_TAG_member ] [xt] [line 168, size 256, align 32, offset 1376] [from ]
!47 = !{!"0x1\00\000\00256\0032\000\000\000", null, null, !11, !48, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 256, align 32, offset 0] [from float]
!48 = !{!49, !50}
!49 = !{!"0x21\000\004"}                          ; [ DW_TAG_subrange_type ] [0, 3]
!50 = !{!"0x21\000\002"}                          ; [ DW_TAG_subrange_type ] [0, 1]
!51 = !{!"0xd\00begin\00169\0064\0064\001664\000", !16, !15, !42} ; [ DW_TAG_member ] [begin] [line 169, size 64, align 64, offset 1664] [from ]
!52 = !{!"0xd\00end\00170\0064\0064\001728\000", !16, !15, !42} ; [ DW_TAG_member ] [end] [line 170, size 64, align 64, offset 1728] [from ]
!53 = !{!"0xd\00null\00174\00640\0032\001792\000", !16, !15, !54} ; [ DW_TAG_member ] [null] [line 174, size 640, align 32, offset 1792] [from ]
!54 = !{!"0x1\00\000\00640\0032\000\000\000", null, null, !11, !55, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 640, align 32, offset 0] [from float]
!55 = !{!56}
!56 = !{!"0x21\000\0020"}                         ; [ DW_TAG_subrange_type ] [0, 19]
!57 = !{!"0xd\00p1\00175\0032\0032\002432\000", !16, !15, !11} ; [ DW_TAG_member ] [p1] [line 175, size 32, align 32, offset 2432] [from float]
!58 = !{!"0xd\00tsc\00197\0064\0064\002496\000", !16, !15, !59} ; [ DW_TAG_member ] [tsc] [line 197, size 64, align 64, offset 2496] [from ]
!59 = !{!"0xf\00\000\0064\0064\000\000", null, null, !28} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!60 = !{!"0xd\00msc\00198\0064\0064\002560\000", !16, !15, !59} ; [ DW_TAG_member ] [msc] [line 198, size 64, align 64, offset 2560] [from ]
!61 = !{!"0xd\00isc\00199\0064\0064\002624\000", !16, !15, !59} ; [ DW_TAG_member ] [isc] [line 199, size 64, align 64, offset 2624] [from ]
!62 = !{!"0xd\00xsc\00200\00256\0032\002688\000", !16, !15, !63} ; [ DW_TAG_member ] [xsc] [line 200, size 256, align 32, offset 2688] [from ]
!63 = !{!"0x1\00\000\00256\0032\000\000\000", null, null, !4, !48, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 256, align 32, offset 0] [from int]
!64 = !{!"0xd\00bsc\00201\0064\0064\002944\000", !16, !15, !28} ; [ DW_TAG_member ] [bsc] [line 201, size 64, align 64, offset 2944] [from ]
!65 = !{!"0xd\00esc\00202\0064\0064\003008\000", !16, !15, !28} ; [ DW_TAG_member ] [esc] [line 202, size 64, align 64, offset 3008] [from ]
!66 = !{!"0xd\00tsc_mem\00203\0064\0064\003072\000", !16, !15, !28} ; [ DW_TAG_member ] [tsc_mem] [line 203, size 64, align 64, offset 3072] [from ]
!67 = !{!"0xd\00msc_mem\00203\0064\0064\003136\000", !16, !15, !28} ; [ DW_TAG_member ] [msc_mem] [line 203, size 64, align 64, offset 3136] [from ]
!68 = !{!"0xd\00isc_mem\00203\0064\0064\003200\000", !16, !15, !28} ; [ DW_TAG_member ] [isc_mem] [line 203, size 64, align 64, offset 3200] [from ]
!69 = !{!"0xd\00bsc_mem\00203\0064\0064\003264\000", !16, !15, !28} ; [ DW_TAG_member ] [bsc_mem] [line 203, size 64, align 64, offset 3264] [from ]
!70 = !{!"0xd\00esc_mem\00203\0064\0064\003328\000", !16, !15, !28} ; [ DW_TAG_member ] [esc_mem] [line 203, size 64, align 64, offset 3328] [from ]
!71 = !{!"0xd\00dnam\00214\0064\0064\003392\000", !16, !15, !59} ; [ DW_TAG_member ] [dnam] [line 214, size 64, align 64, offset 3392] [from ]
!72 = !{!"0xd\00dnai\00215\0064\0064\003456\000", !16, !15, !59} ; [ DW_TAG_member ] [dnai] [line 215, size 64, align 64, offset 3456] [from ]
!73 = !{!"0xd\00dna2\00216\0032\0032\003520\000", !16, !15, !4} ; [ DW_TAG_member ] [dna2] [line 216, size 32, align 32, offset 3520] [from int]
!74 = !{!"0xd\00dna4\00217\0032\0032\003552\000", !16, !15, !4} ; [ DW_TAG_member ] [dna4] [line 217, size 32, align 32, offset 3552] [from int]
!75 = !{!"0xd\00mu\00222\0032\0032\003584\000", !16, !15, !11} ; [ DW_TAG_member ] [mu] [line 222, size 32, align 32, offset 3584] [from float]
!76 = !{!"0xd\00lambda\00223\0032\0032\003616\000", !16, !15, !11} ; [ DW_TAG_member ] [lambda] [line 223, size 32, align 32, offset 3616] [from float]
!77 = !{!"0xd\00flags\00225\0032\0032\003648\000", !16, !15, !4} ; [ DW_TAG_member ] [flags] [line 225, size 32, align 32, offset 3648] [from int]
!78 = !{!"0xf\00\000\0064\0064\000\000", null, null, !79} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from dpmatrix_s]
!79 = !{!"0x13\00dpmatrix_s\00289\00640\0064\000\000\000", !16, null, null, !80, null, null, null} ; [ DW_TAG_structure_type ] [dpmatrix_s] [line 289, size 640, align 64, offset 0] [def] [from ]
!80 = !{!81, !82, !83, !84, !85, !86, !87, !88, !89, !90, !91, !92}
!81 = !{!"0xd\00xmx\00290\0064\0064\000\000", !16, !79, !59} ; [ DW_TAG_member ] [xmx] [line 290, size 64, align 64, offset 0] [from ]
!82 = !{!"0xd\00mmx\00291\0064\0064\0064\000", !16, !79, !59} ; [ DW_TAG_member ] [mmx] [line 291, size 64, align 64, offset 64] [from ]
!83 = !{!"0xd\00imx\00292\0064\0064\00128\000", !16, !79, !59} ; [ DW_TAG_member ] [imx] [line 292, size 64, align 64, offset 128] [from ]
!84 = !{!"0xd\00dmx\00293\0064\0064\00192\000", !16, !79, !59} ; [ DW_TAG_member ] [dmx] [line 293, size 64, align 64, offset 192] [from ]
!85 = !{!"0xd\00xmx_mem\00299\0064\0064\00256\000", !16, !79, !5} ; [ DW_TAG_member ] [xmx_mem] [line 299, size 64, align 64, offset 256] [from ]
!86 = !{!"0xd\00mmx_mem\00299\0064\0064\00320\000", !16, !79, !5} ; [ DW_TAG_member ] [mmx_mem] [line 299, size 64, align 64, offset 320] [from ]
!87 = !{!"0xd\00imx_mem\00299\0064\0064\00384\000", !16, !79, !5} ; [ DW_TAG_member ] [imx_mem] [line 299, size 64, align 64, offset 384] [from ]
!88 = !{!"0xd\00dmx_mem\00299\0064\0064\00448\000", !16, !79, !5} ; [ DW_TAG_member ] [dmx_mem] [line 299, size 64, align 64, offset 448] [from ]
!89 = !{!"0xd\00maxN\00308\0032\0032\00512\000", !16, !79, !4} ; [ DW_TAG_member ] [maxN] [line 308, size 32, align 32, offset 512] [from int]
!90 = !{!"0xd\00maxM\00309\0032\0032\00544\000", !16, !79, !4} ; [ DW_TAG_member ] [maxM] [line 309, size 32, align 32, offset 544] [from int]
!91 = !{!"0xd\00padN\00311\0032\0032\00576\000", !16, !79, !4} ; [ DW_TAG_member ] [padN] [line 311, size 32, align 32, offset 576] [from int]
!92 = !{!"0xd\00padM\00312\0032\0032\00608\000", !16, !79, !4} ; [ DW_TAG_member ] [padM] [line 312, size 32, align 32, offset 608] [from int]
!93 = !{!"0xf\00\000\0064\0064\000\000", null, null, !94} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!94 = !{!"0xf\00\000\0064\0064\000\000", null, null, !95} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from p7trace_s]
!95 = !{!"0x13\00p7trace_s\00374\00256\0064\000\000\000", !16, null, null, !96, null, null, null} ; [ DW_TAG_structure_type ] [p7trace_s] [line 374, size 256, align 64, offset 0] [def] [from ]
!96 = !{!97, !98, !99, !100}
!97 = !{!"0xd\00tlen\00375\0032\0032\000\000", !16, !95, !4} ; [ DW_TAG_member ] [tlen] [line 375, size 32, align 32, offset 0] [from int]
!98 = !{!"0xd\00statetype\00376\0064\0064\0064\000", !16, !95, !12} ; [ DW_TAG_member ] [statetype] [line 376, size 64, align 64, offset 64] [from ]
!99 = !{!"0xd\00nodeidx\00377\0064\0064\00128\000", !16, !95, !28} ; [ DW_TAG_member ] [nodeidx] [line 377, size 64, align 64, offset 128] [from ]
!100 = !{!"0xd\00pos\00378\0064\0064\00192\000", !16, !95, !28} ; [ DW_TAG_member ] [pos] [line 378, size 64, align 64, offset 192] [from ]
!101 = !{i32 2, !"Dwarf Version", i32 4}
!102 = !{i32 2, !"Debug Info Version", i32 2}
!103 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
!104 = !{!"0x101\00dsq\0016777285\000", !7, !8, !12} ; [ DW_TAG_arg_variable ] [dsq] [line 69]
!105 = !{!"0x102"}                                ; [ DW_TAG_expression ]
!106 = !MDLocation(line: 69, column: 17, scope: !7)
!107 = !{!"0x101\00L\0033554501\000", !7, !8, !4} ; [ DW_TAG_arg_variable ] [L] [line 69]
!108 = !MDLocation(line: 69, column: 26, scope: !7)
!109 = !{!"0x101\00hmm\0050331717\000", !7, !8, !14} ; [ DW_TAG_arg_variable ] [hmm] [line 69]
!110 = !MDLocation(line: 69, column: 45, scope: !7)
!111 = !{!"0x101\00mx\0067108933\000", !7, !8, !78} ; [ DW_TAG_arg_variable ] [mx] [line 69]
!112 = !MDLocation(line: 69, column: 69, scope: !7)
!113 = !{!"0x101\00ret_tr\0083886149\000", !7, !8, !93} ; [ DW_TAG_arg_variable ] [ret_tr] [line 69]
!114 = !MDLocation(line: 69, column: 92, scope: !7)
!115 = !{!"0x100\00tr\0071\000", !7, !8, !94}     ; [ DW_TAG_auto_variable ] [tr] [line 71]
!116 = !MDLocation(line: 71, column: 22, scope: !7)
!117 = !{!"0x100\00xmx\0072\000", !7, !8, !59}    ; [ DW_TAG_auto_variable ] [xmx] [line 72]
!118 = !MDLocation(line: 72, column: 9, scope: !7)
!119 = !{!"0x100\00mmx\0073\000", !7, !8, !59}    ; [ DW_TAG_auto_variable ] [mmx] [line 73]
!120 = !MDLocation(line: 73, column: 9, scope: !7)
!121 = !{!"0x100\00imx\0074\000", !7, !8, !59}    ; [ DW_TAG_auto_variable ] [imx] [line 74]
!122 = !MDLocation(line: 74, column: 9, scope: !7)
!123 = !{!"0x100\00dmx\0075\000", !7, !8, !59}    ; [ DW_TAG_auto_variable ] [dmx] [line 75]
!124 = !MDLocation(line: 75, column: 9, scope: !7)
!125 = !{!"0x100\00i\0076\000", !7, !8, !4}       ; [ DW_TAG_auto_variable ] [i] [line 76]
!126 = !MDLocation(line: 76, column: 9, scope: !7)
!127 = !{!"0x100\00k\0076\000", !7, !8, !4}       ; [ DW_TAG_auto_variable ] [k] [line 76]
!128 = !MDLocation(line: 76, column: 11, scope: !7)
!129 = !{!"0x100\00sc\0077\000", !7, !8, !4}      ; [ DW_TAG_auto_variable ] [sc] [line 77]
!130 = !MDLocation(line: 77, column: 9, scope: !7)
!131 = !{!"0x100\00mc\0078\000", !7, !8, !28}     ; [ DW_TAG_auto_variable ] [mc] [line 78]
!132 = !MDLocation(line: 78, column: 9, scope: !7)
!133 = !{!"0x100\00dc\0078\000", !7, !8, !28}     ; [ DW_TAG_auto_variable ] [dc] [line 78]
!134 = !MDLocation(line: 78, column: 14, scope: !7)
!135 = !{!"0x100\00ic\0078\000", !7, !8, !28}     ; [ DW_TAG_auto_variable ] [ic] [line 78]
!136 = !MDLocation(line: 78, column: 19, scope: !7)
!137 = !{!"0x100\00ms\0079\000", !7, !8, !28}     ; [ DW_TAG_auto_variable ] [ms] [line 79]
!138 = !MDLocation(line: 79, column: 9, scope: !7)
!139 = !{!"0x100\00is\0079\000", !7, !8, !28}     ; [ DW_TAG_auto_variable ] [is] [line 79]
!140 = !MDLocation(line: 79, column: 14, scope: !7)
!141 = !{!"0x100\00mpp\0080\000", !7, !8, !28}    ; [ DW_TAG_auto_variable ] [mpp] [line 80]
!142 = !MDLocation(line: 80, column: 9, scope: !7)
!143 = !{!"0x100\00mpc\0080\000", !7, !8, !28}    ; [ DW_TAG_auto_variable ] [mpc] [line 80]
!144 = !MDLocation(line: 80, column: 15, scope: !7)
!145 = !{!"0x100\00ip\0080\000", !7, !8, !28}     ; [ DW_TAG_auto_variable ] [ip] [line 80]
!146 = !MDLocation(line: 80, column: 21, scope: !7)
!147 = !{!"0x100\00bp\0081\000", !7, !8, !28}     ; [ DW_TAG_auto_variable ] [bp] [line 81]
!148 = !MDLocation(line: 81, column: 9, scope: !7)
!149 = !{!"0x100\00ep\0082\000", !7, !8, !28}     ; [ DW_TAG_auto_variable ] [ep] [line 82]
!150 = !MDLocation(line: 82, column: 9, scope: !7)
!151 = !{!"0x100\00xmb\0083\000", !7, !8, !4}     ; [ DW_TAG_auto_variable ] [xmb] [line 83]
!152 = !MDLocation(line: 83, column: 9, scope: !7)
!153 = !{!"0x100\00xme\0084\000", !7, !8, !4}     ; [ DW_TAG_auto_variable ] [xme] [line 84]
!154 = !MDLocation(line: 84, column: 9, scope: !7)
!155 = !{!"0x100\00dpp\0085\000", !7, !8, !28}    ; [ DW_TAG_auto_variable ] [dpp] [line 85]
!156 = !MDLocation(line: 85, column: 9, scope: !7)
!157 = !{!"0x100\00tpmm\0086\000", !7, !8, !28}   ; [ DW_TAG_auto_variable ] [tpmm] [line 86]
!158 = !MDLocation(line: 86, column: 9, scope: !7)
!159 = !{!"0x100\00tpmi\0086\000", !7, !8, !28}   ; [ DW_TAG_auto_variable ] [tpmi] [line 86]
!160 = !MDLocation(line: 86, column: 16, scope: !7)
!161 = !{!"0x100\00tpmd\0086\000", !7, !8, !28}   ; [ DW_TAG_auto_variable ] [tpmd] [line 86]
!162 = !MDLocation(line: 86, column: 23, scope: !7)
!163 = !{!"0x100\00tpim\0086\000", !7, !8, !28}   ; [ DW_TAG_auto_variable ] [tpim] [line 86]
!164 = !MDLocation(line: 86, column: 30, scope: !7)
!165 = !{!"0x100\00tpii\0086\000", !7, !8, !28}   ; [ DW_TAG_auto_variable ] [tpii] [line 86]
!166 = !MDLocation(line: 86, column: 37, scope: !7)
!167 = !{!"0x100\00tpdm\0086\000", !7, !8, !28}   ; [ DW_TAG_auto_variable ] [tpdm] [line 86]
!168 = !MDLocation(line: 86, column: 44, scope: !7)
!169 = !{!"0x100\00tpdd\0086\000", !7, !8, !28}   ; [ DW_TAG_auto_variable ] [tpdd] [line 86]
!170 = !MDLocation(line: 86, column: 51, scope: !7)
!171 = !{!"0x100\00M\0087\000", !7, !8, !4}       ; [ DW_TAG_auto_variable ] [M] [line 87]
!172 = !MDLocation(line: 87, column: 9, scope: !7)
!173 = !MDLocation(line: 91, column: 21, scope: !7)
!174 = !MDLocation(line: 91, column: 25, scope: !7)
!175 = !MDLocation(line: 91, column: 28, scope: !7)
!176 = !MDLocation(line: 91, column: 3, scope: !7)
!177 = !MDLocation(line: 95, column: 3, scope: !7)
!178 = !MDLocation(line: 96, column: 17, scope: !7)
!179 = !MDLocation(line: 96, column: 3, scope: !7)
!180 = !MDLocation(line: 97, column: 31, scope: !7)
!181 = !MDLocation(line: 97, column: 17, scope: !7)
!182 = !MDLocation(line: 97, column: 3, scope: !7)
!183 = !MDLocation(line: 98, column: 8, scope: !184)
!184 = !{!"0xb\0098\003\000", !1, !7}             ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/hmmer/fast_algorithms.c]
!185 = !MDLocation(line: 98, column: 15, scope: !186)
!186 = !{!"0xb\002", !1, !187}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/hmmer/fast_algorithms.c]
!187 = !{!"0xb\001", !1, !188}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/hmmer/fast_algorithms.c]
!188 = !{!"0xb\0098\003\001", !1, !184}           ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/hmmer/fast_algorithms.c]
!189 = !MDLocation(line: 98, column: 20, scope: !188)
!190 = !MDLocation(line: 98, column: 15, scope: !188)
!191 = !MDLocation(line: 98, column: 3, scope: !184)
!192 = !MDLocation(line: 99, column: 36, scope: !188)
!193 = !MDLocation(line: 99, column: 29, scope: !188)
!194 = !MDLocation(line: 99, column: 24, scope: !188)
!195 = !MDLocation(line: 99, column: 17, scope: !188)
!196 = !MDLocation(line: 99, column: 12, scope: !188)
!197 = !MDLocation(line: 99, column: 5, scope: !188)
!198 = !MDLocation(line: 98, column: 28, scope: !188)
!199 = !MDLocation(line: 98, column: 3, scope: !188)
!200 = !MDLocation(line: 103, column: 14, scope: !7)
!201 = !MDLocation(line: 103, column: 3, scope: !7)
!202 = !MDLocation(line: 111, column: 11, scope: !7)
!203 = !MDLocation(line: 111, column: 3, scope: !7)
!204 = !MDLocation(line: 112, column: 11, scope: !7)
!205 = !MDLocation(line: 112, column: 3, scope: !7)
!206 = !MDLocation(line: 113, column: 11, scope: !7)
!207 = !MDLocation(line: 113, column: 3, scope: !7)
!208 = !MDLocation(line: 114, column: 11, scope: !7)
!209 = !MDLocation(line: 114, column: 3, scope: !7)
!210 = !MDLocation(line: 115, column: 11, scope: !7)
!211 = !MDLocation(line: 115, column: 3, scope: !7)
!212 = !MDLocation(line: 116, column: 11, scope: !7)
!213 = !MDLocation(line: 116, column: 3, scope: !7)
!214 = !MDLocation(line: 117, column: 11, scope: !7)
!215 = !MDLocation(line: 117, column: 3, scope: !7)
!216 = !MDLocation(line: 118, column: 11, scope: !7)
!217 = !MDLocation(line: 118, column: 3, scope: !7)
!218 = !MDLocation(line: 119, column: 8, scope: !219)
!219 = !{!"0xb\00119\003\002", !1, !7}            ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/hmmer/fast_algorithms.c]
!220 = !MDLocation(line: 119, column: 15, scope: !221)
!221 = !{!"0xb\002", !1, !222}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/hmmer/fast_algorithms.c]
!222 = !{!"0xb\001", !1, !223}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/hmmer/fast_algorithms.c]
!223 = !{!"0xb\00119\003\003", !1, !219}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/hmmer/fast_algorithms.c]
!224 = !MDLocation(line: 119, column: 20, scope: !223)
!225 = !MDLocation(line: 119, column: 15, scope: !223)
!226 = !MDLocation(line: 119, column: 3, scope: !219)
!227 = !MDLocation(line: 120, column: 17, scope: !228)
!228 = !{!"0xb\00119\0028\004", !1, !223}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/hmmer/fast_algorithms.c]
!229 = !MDLocation(line: 120, column: 13, scope: !228)
!230 = !MDLocation(line: 120, column: 5, scope: !228)
!231 = !MDLocation(line: 121, column: 17, scope: !228)
!232 = !MDLocation(line: 121, column: 13, scope: !228)
!233 = !MDLocation(line: 121, column: 5, scope: !228)
!234 = !MDLocation(line: 122, column: 17, scope: !228)
!235 = !MDLocation(line: 122, column: 13, scope: !228)
!236 = !MDLocation(line: 122, column: 5, scope: !228)
!237 = !MDLocation(line: 123, column: 17, scope: !228)
!238 = !MDLocation(line: 123, column: 13, scope: !228)
!239 = !MDLocation(line: 123, column: 5, scope: !228)
!240 = !MDLocation(line: 124, column: 17, scope: !228)
!241 = !MDLocation(line: 124, column: 13, scope: !228)
!242 = !MDLocation(line: 124, column: 5, scope: !228)
!243 = !MDLocation(line: 125, column: 17, scope: !228)
!244 = !MDLocation(line: 125, column: 13, scope: !228)
!245 = !MDLocation(line: 125, column: 5, scope: !228)
!246 = !MDLocation(line: 126, column: 17, scope: !228)
!247 = !MDLocation(line: 126, column: 13, scope: !228)
!248 = !MDLocation(line: 126, column: 5, scope: !228)
!249 = !MDLocation(line: 127, column: 32, scope: !228)
!250 = !MDLocation(line: 127, column: 28, scope: !228)
!251 = !MDLocation(line: 127, column: 22, scope: !228)
!252 = !MDLocation(line: 127, column: 13, scope: !228)
!253 = !MDLocation(line: 127, column: 5, scope: !228)
!254 = !MDLocation(line: 128, column: 32, scope: !228)
!255 = !MDLocation(line: 128, column: 28, scope: !228)
!256 = !MDLocation(line: 128, column: 22, scope: !228)
!257 = !MDLocation(line: 128, column: 13, scope: !228)
!258 = !MDLocation(line: 128, column: 5, scope: !228)
!259 = !MDLocation(line: 129, column: 5, scope: !228)
!260 = !MDLocation(line: 130, column: 5, scope: !228)
!261 = !MDLocation(line: 131, column: 5, scope: !228)
!262 = !MDLocation(line: 133, column: 10, scope: !263)
!263 = !{!"0xb\00133\005\005", !1, !228}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/hmmer/fast_algorithms.c]
!264 = !MDLocation(line: 133, column: 17, scope: !265)
!265 = !{!"0xb\002", !1, !266}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/hmmer/fast_algorithms.c]
!266 = !{!"0xb\001", !1, !267}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/hmmer/fast_algorithms.c]
!267 = !{!"0xb\00133\005\006", !1, !263}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/hmmer/fast_algorithms.c]
!268 = !MDLocation(line: 133, column: 22, scope: !267)
!269 = !MDLocation(line: 133, column: 17, scope: !267)
!270 = !MDLocation(line: 133, column: 5, scope: !263)
!271 = !MDLocation(line: 134, column: 19, scope: !272)
!272 = !{!"0xb\00133\0030\007", !1, !267}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/hmmer/fast_algorithms.c]
!273 = !MDLocation(line: 134, column: 15, scope: !272)
!274 = !MDLocation(line: 134, column: 33, scope: !272)
!275 = !MDLocation(line: 134, column: 28, scope: !272)
!276 = !MDLocation(line: 134, column: 10, scope: !272)
!277 = !MDLocation(line: 134, column: 7, scope: !272)
!278 = !MDLocation(line: 135, column: 20, scope: !279)
!279 = !{!"0xb\00135\0011\008", !1, !272}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/hmmer/fast_algorithms.c]
!280 = !MDLocation(line: 135, column: 17, scope: !279)
!281 = !MDLocation(line: 135, column: 33, scope: !279)
!282 = !MDLocation(line: 135, column: 28, scope: !279)
!283 = !MDLocation(line: 135, column: 12, scope: !279)
!284 = !MDLocation(line: 135, column: 44, scope: !279)
!285 = !MDLocation(line: 135, column: 41, scope: !279)
!286 = !MDLocation(line: 135, column: 11, scope: !279)
!287 = !MDLocation(line: 135, column: 11, scope: !272)
!288 = !MDLocation(line: 135, column: 57, scope: !289)
!289 = !{!"0xb\001", !1, !279}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/hmmer/fast_algorithms.c]
!290 = !MDLocation(line: 135, column: 52, scope: !279)
!291 = !MDLocation(line: 135, column: 49, scope: !279)
!292 = !MDLocation(line: 136, column: 21, scope: !293)
!293 = !{!"0xb\00136\0011\009", !1, !272}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/hmmer/fast_algorithms.c]
!294 = !MDLocation(line: 136, column: 17, scope: !293)
!295 = !MDLocation(line: 136, column: 33, scope: !293)
!296 = !MDLocation(line: 136, column: 28, scope: !293)
!297 = !MDLocation(line: 136, column: 12, scope: !293)
!298 = !MDLocation(line: 136, column: 44, scope: !293)
!299 = !MDLocation(line: 136, column: 41, scope: !293)
!300 = !MDLocation(line: 136, column: 11, scope: !293)
!301 = !MDLocation(line: 136, column: 11, scope: !272)
!302 = !MDLocation(line: 136, column: 57, scope: !303)
!303 = !{!"0xb\001", !1, !293}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/hmmer/fast_algorithms.c]
!304 = !MDLocation(line: 136, column: 52, scope: !293)
!305 = !MDLocation(line: 136, column: 49, scope: !293)
!306 = !MDLocation(line: 137, column: 17, scope: !307)
!307 = !{!"0xb\00137\0011\0010", !1, !272}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/hmmer/fast_algorithms.c]
!308 = !MDLocation(line: 137, column: 27, scope: !307)
!309 = !MDLocation(line: 137, column: 24, scope: !307)
!310 = !MDLocation(line: 137, column: 12, scope: !307)
!311 = !MDLocation(line: 137, column: 44, scope: !307)
!312 = !MDLocation(line: 137, column: 41, scope: !307)
!313 = !MDLocation(line: 137, column: 11, scope: !307)
!314 = !MDLocation(line: 137, column: 11, scope: !272)
!315 = !MDLocation(line: 137, column: 57, scope: !316)
!316 = !{!"0xb\001", !1, !307}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/hmmer/fast_algorithms.c]
!317 = !MDLocation(line: 137, column: 52, scope: !307)
!318 = !MDLocation(line: 137, column: 49, scope: !307)
!319 = !MDLocation(line: 138, column: 19, scope: !272)
!320 = !MDLocation(line: 138, column: 16, scope: !272)
!321 = !MDLocation(line: 138, column: 10, scope: !272)
!322 = !MDLocation(line: 138, column: 7, scope: !272)
!323 = !MDLocation(line: 139, column: 14, scope: !324)
!324 = !{!"0xb\00139\0011\0011", !1, !272}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/hmmer/fast_algorithms.c]
!325 = !MDLocation(line: 139, column: 11, scope: !324)
!326 = !MDLocation(line: 139, column: 11, scope: !272)
!327 = !MDLocation(line: 139, column: 30, scope: !328)
!328 = !{!"0xb\001", !1, !324}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/hmmer/fast_algorithms.c]
!329 = !MDLocation(line: 139, column: 27, scope: !324)
!330 = !MDLocation(line: 141, column: 18, scope: !272)
!331 = !MDLocation(line: 141, column: 15, scope: !272)
!332 = !MDLocation(line: 141, column: 30, scope: !272)
!333 = !MDLocation(line: 141, column: 25, scope: !272)
!334 = !MDLocation(line: 141, column: 10, scope: !272)
!335 = !MDLocation(line: 141, column: 7, scope: !272)
!336 = !MDLocation(line: 142, column: 20, scope: !337)
!337 = !{!"0xb\00142\0011\0012", !1, !272}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/hmmer/fast_algorithms.c]
!338 = !MDLocation(line: 142, column: 17, scope: !337)
!339 = !MDLocation(line: 142, column: 32, scope: !337)
!340 = !MDLocation(line: 142, column: 27, scope: !337)
!341 = !MDLocation(line: 142, column: 12, scope: !337)
!342 = !MDLocation(line: 142, column: 43, scope: !337)
!343 = !MDLocation(line: 142, column: 40, scope: !337)
!344 = !MDLocation(line: 142, column: 11, scope: !337)
!345 = !MDLocation(line: 142, column: 11, scope: !272)
!346 = !MDLocation(line: 142, column: 55, scope: !347)
!347 = !{!"0xb\001", !1, !337}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/hmmer/fast_algorithms.c]
!348 = !MDLocation(line: 142, column: 50, scope: !337)
!349 = !MDLocation(line: 142, column: 47, scope: !337)
!350 = !MDLocation(line: 143, column: 14, scope: !351)
!351 = !{!"0xb\00143\0011\0013", !1, !272}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/hmmer/fast_algorithms.c]
!352 = !MDLocation(line: 143, column: 11, scope: !351)
!353 = !MDLocation(line: 143, column: 11, scope: !272)
!354 = !MDLocation(line: 143, column: 30, scope: !355)
!355 = !{!"0xb\001", !1, !351}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/hmmer/fast_algorithms.c]
!356 = !MDLocation(line: 143, column: 27, scope: !351)
!357 = !MDLocation(line: 145, column: 11, scope: !358)
!358 = !{!"0xb\00145\0011\0014", !1, !272}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/hmmer/fast_algorithms.c]
!359 = !MDLocation(line: 145, column: 15, scope: !358)
!360 = !MDLocation(line: 145, column: 11, scope: !272)
!361 = !MDLocation(line: 146, column: 14, scope: !362)
!362 = !{!"0xb\00145\0018\0015", !1, !358}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/hmmer/fast_algorithms.c]
!363 = !MDLocation(line: 146, column: 10, scope: !362)
!364 = !MDLocation(line: 146, column: 24, scope: !362)
!365 = !MDLocation(line: 146, column: 19, scope: !362)
!366 = !MDLocation(line: 146, column: 5, scope: !362)
!367 = !MDLocation(line: 146, column: 2, scope: !362)
!368 = !MDLocation(line: 147, column: 15, scope: !369)
!369 = !{!"0xb\00147\006\0016", !1, !362}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/hmmer/fast_algorithms.c]
!370 = !MDLocation(line: 147, column: 12, scope: !369)
!371 = !MDLocation(line: 147, column: 25, scope: !369)
!372 = !MDLocation(line: 147, column: 20, scope: !369)
!373 = !MDLocation(line: 147, column: 7, scope: !369)
!374 = !MDLocation(line: 147, column: 34, scope: !369)
!375 = !MDLocation(line: 147, column: 31, scope: !369)
!376 = !MDLocation(line: 147, column: 6, scope: !369)
!377 = !MDLocation(line: 147, column: 6, scope: !362)
!378 = !MDLocation(line: 147, column: 46, scope: !379)
!379 = !{!"0xb\001", !1, !369}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/hmmer/fast_algorithms.c]
!380 = !MDLocation(line: 147, column: 41, scope: !369)
!381 = !MDLocation(line: 147, column: 38, scope: !369)
!382 = !MDLocation(line: 148, column: 14, scope: !362)
!383 = !MDLocation(line: 148, column: 11, scope: !362)
!384 = !MDLocation(line: 148, column: 5, scope: !362)
!385 = !MDLocation(line: 148, column: 2, scope: !362)
!386 = !MDLocation(line: 149, column: 9, scope: !387)
!387 = !{!"0xb\00149\006\0017", !1, !362}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/hmmer/fast_algorithms.c]
!388 = !MDLocation(line: 149, column: 6, scope: !387)
!389 = !MDLocation(line: 149, column: 6, scope: !362)
!390 = !MDLocation(line: 149, column: 25, scope: !391)
!391 = !{!"0xb\001", !1, !387}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/hmmer/fast_algorithms.c]
!392 = !MDLocation(line: 149, column: 22, scope: !387)
!393 = !MDLocation(line: 150, column: 7, scope: !362)
!394 = !MDLocation(line: 151, column: 5, scope: !272)
!395 = !MDLocation(line: 133, column: 25, scope: !267)
!396 = !MDLocation(line: 133, column: 5, scope: !267)
!397 = !MDLocation(line: 157, column: 9, scope: !228)
!398 = !MDLocation(line: 157, column: 5, scope: !228)
!399 = !MDLocation(line: 158, column: 19, scope: !400)
!400 = !{!"0xb\00158\009\0018", !1, !228}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/hmmer/fast_algorithms.c]
!401 = !MDLocation(line: 158, column: 15, scope: !400)
!402 = !MDLocation(line: 158, column: 31, scope: !400)
!403 = !MDLocation(line: 158, column: 10, scope: !400)
!404 = !MDLocation(line: 158, column: 9, scope: !400)
!405 = !MDLocation(line: 158, column: 9, scope: !228)
!406 = !MDLocation(line: 159, column: 21, scope: !400)
!407 = !MDLocation(line: 159, column: 11, scope: !400)
!408 = !MDLocation(line: 159, column: 7, scope: !400)
!409 = !MDLocation(line: 162, column: 5, scope: !228)
!410 = !MDLocation(line: 163, column: 15, scope: !228)
!411 = !MDLocation(line: 163, column: 11, scope: !228)
!412 = !MDLocation(line: 163, column: 5, scope: !228)
!413 = !MDLocation(line: 164, column: 11, scope: !228)
!414 = !MDLocation(line: 164, column: 5, scope: !228)
!415 = !MDLocation(line: 165, column: 10, scope: !416)
!416 = !{!"0xb\00165\005\0019", !1, !228}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/hmmer/fast_algorithms.c]
!417 = !MDLocation(line: 165, column: 17, scope: !418)
!418 = !{!"0xb\002", !1, !419}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/hmmer/fast_algorithms.c]
!419 = !{!"0xb\001", !1, !420}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/hmmer/fast_algorithms.c]
!420 = !{!"0xb\00165\005\0020", !1, !416}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/hmmer/fast_algorithms.c]
!421 = !MDLocation(line: 165, column: 22, scope: !420)
!422 = !MDLocation(line: 165, column: 17, scope: !420)
!423 = !MDLocation(line: 165, column: 5, scope: !416)
!424 = !MDLocation(line: 166, column: 22, scope: !425)
!425 = !{!"0xb\00166\0011\0021", !1, !420}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/hmmer/fast_algorithms.c]
!426 = !MDLocation(line: 166, column: 18, scope: !425)
!427 = !MDLocation(line: 166, column: 30, scope: !425)
!428 = !MDLocation(line: 166, column: 27, scope: !425)
!429 = !MDLocation(line: 166, column: 12, scope: !425)
!430 = !MDLocation(line: 166, column: 36, scope: !425)
!431 = !MDLocation(line: 166, column: 11, scope: !425)
!432 = !MDLocation(line: 166, column: 11, scope: !420)
!433 = !MDLocation(line: 166, column: 47, scope: !434)
!434 = !{!"0xb\001", !1, !425}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/hmmer/fast_algorithms.c]
!435 = !MDLocation(line: 166, column: 41, scope: !425)
!436 = !MDLocation(line: 166, column: 36, scope: !437)
!437 = !{!"0xb\003", !1, !438}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/hmmer/fast_algorithms.c]
!438 = !{!"0xb\002", !1, !425}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/hmmer/fast_algorithms.c]
!439 = !MDLocation(line: 165, column: 30, scope: !420)
!440 = !MDLocation(line: 165, column: 5, scope: !420)
!441 = !MDLocation(line: 167, column: 19, scope: !228)
!442 = !MDLocation(line: 167, column: 9, scope: !228)
!443 = !MDLocation(line: 167, column: 5, scope: !228)
!444 = !MDLocation(line: 169, column: 9, scope: !228)
!445 = !MDLocation(line: 169, column: 5, scope: !228)
!446 = !MDLocation(line: 170, column: 19, scope: !447)
!447 = !{!"0xb\00170\009\0022", !1, !228}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/hmmer/fast_algorithms.c]
!448 = !MDLocation(line: 170, column: 15, scope: !447)
!449 = !MDLocation(line: 170, column: 31, scope: !447)
!450 = !MDLocation(line: 170, column: 10, scope: !447)
!451 = !MDLocation(line: 170, column: 9, scope: !447)
!452 = !MDLocation(line: 170, column: 9, scope: !228)
!453 = !MDLocation(line: 171, column: 21, scope: !447)
!454 = !MDLocation(line: 171, column: 11, scope: !447)
!455 = !MDLocation(line: 171, column: 7, scope: !447)
!456 = !MDLocation(line: 172, column: 19, scope: !457)
!457 = !{!"0xb\00172\009\0023", !1, !228}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/hmmer/fast_algorithms.c]
!458 = !MDLocation(line: 172, column: 15, scope: !457)
!459 = !MDLocation(line: 172, column: 31, scope: !457)
!460 = !MDLocation(line: 172, column: 10, scope: !457)
!461 = !MDLocation(line: 172, column: 58, scope: !457)
!462 = !MDLocation(line: 172, column: 54, scope: !457)
!463 = !MDLocation(line: 172, column: 9, scope: !457)
!464 = !MDLocation(line: 172, column: 9, scope: !228)
!465 = !MDLocation(line: 173, column: 21, scope: !457)
!466 = !MDLocation(line: 173, column: 11, scope: !457)
!467 = !MDLocation(line: 173, column: 7, scope: !457)
!468 = !MDLocation(line: 176, column: 9, scope: !228)
!469 = !MDLocation(line: 176, column: 5, scope: !228)
!470 = !MDLocation(line: 177, column: 19, scope: !471)
!471 = !{!"0xb\00177\009\0024", !1, !228}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/hmmer/fast_algorithms.c]
!472 = !MDLocation(line: 177, column: 15, scope: !471)
!473 = !MDLocation(line: 177, column: 29, scope: !471)
!474 = !MDLocation(line: 177, column: 10, scope: !471)
!475 = !MDLocation(line: 177, column: 9, scope: !471)
!476 = !MDLocation(line: 177, column: 9, scope: !228)
!477 = !MDLocation(line: 178, column: 21, scope: !471)
!478 = !MDLocation(line: 178, column: 11, scope: !471)
!479 = !MDLocation(line: 178, column: 7, scope: !471)
!480 = !MDLocation(line: 179, column: 19, scope: !481)
!481 = !{!"0xb\00179\009\0025", !1, !228}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/hmmer/fast_algorithms.c]
!482 = !MDLocation(line: 179, column: 15, scope: !481)
!483 = !MDLocation(line: 179, column: 29, scope: !481)
!484 = !MDLocation(line: 179, column: 10, scope: !481)
!485 = !MDLocation(line: 179, column: 56, scope: !481)
!486 = !MDLocation(line: 179, column: 52, scope: !481)
!487 = !MDLocation(line: 179, column: 9, scope: !481)
!488 = !MDLocation(line: 179, column: 9, scope: !228)
!489 = !MDLocation(line: 180, column: 21, scope: !481)
!490 = !MDLocation(line: 180, column: 11, scope: !481)
!491 = !MDLocation(line: 180, column: 7, scope: !481)
!492 = !MDLocation(line: 183, column: 9, scope: !228)
!493 = !MDLocation(line: 183, column: 5, scope: !228)
!494 = !MDLocation(line: 184, column: 19, scope: !495)
!495 = !{!"0xb\00184\009\0026", !1, !228}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/hmmer/fast_algorithms.c]
!496 = !MDLocation(line: 184, column: 15, scope: !495)
!497 = !MDLocation(line: 184, column: 31, scope: !495)
!498 = !MDLocation(line: 184, column: 10, scope: !495)
!499 = !MDLocation(line: 184, column: 9, scope: !495)
!500 = !MDLocation(line: 184, column: 9, scope: !228)
!501 = !MDLocation(line: 185, column: 21, scope: !495)
!502 = !MDLocation(line: 185, column: 11, scope: !495)
!503 = !MDLocation(line: 185, column: 7, scope: !495)
!504 = !MDLocation(line: 186, column: 19, scope: !505)
!505 = !{!"0xb\00186\009\0027", !1, !228}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/hmmer/fast_algorithms.c]
!506 = !MDLocation(line: 186, column: 15, scope: !505)
!507 = !MDLocation(line: 186, column: 29, scope: !505)
!508 = !MDLocation(line: 186, column: 10, scope: !505)
!509 = !MDLocation(line: 186, column: 56, scope: !505)
!510 = !MDLocation(line: 186, column: 52, scope: !505)
!511 = !MDLocation(line: 186, column: 9, scope: !505)
!512 = !MDLocation(line: 186, column: 9, scope: !228)
!513 = !MDLocation(line: 187, column: 21, scope: !505)
!514 = !MDLocation(line: 187, column: 11, scope: !505)
!515 = !MDLocation(line: 187, column: 7, scope: !505)
!516 = !MDLocation(line: 188, column: 3, scope: !228)
!517 = !MDLocation(line: 119, column: 23, scope: !223)
!518 = !MDLocation(line: 119, column: 3, scope: !223)
!519 = !MDLocation(line: 190, column: 12, scope: !7)
!520 = !MDLocation(line: 190, column: 8, scope: !7)
!521 = !MDLocation(line: 190, column: 22, scope: !7)
!522 = !MDLocation(line: 190, column: 3, scope: !7)
!523 = !MDLocation(line: 192, column: 7, scope: !524)
!524 = !{!"0xb\00192\007\0028", !1, !7}           ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/hmmer/fast_algorithms.c]
!525 = !MDLocation(line: 192, column: 7, scope: !7)
!526 = !MDLocation(line: 193, column: 20, scope: !527)
!527 = !{!"0xb\00192\0023\0029", !1, !524}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/hmmer/fast_algorithms.c]
!528 = !MDLocation(line: 193, column: 25, scope: !527)
!529 = !MDLocation(line: 193, column: 30, scope: !527)
!530 = !MDLocation(line: 193, column: 33, scope: !527)
!531 = !MDLocation(line: 193, column: 5, scope: !527)
!532 = !MDLocation(line: 194, column: 15, scope: !527)
!533 = !MDLocation(line: 194, column: 6, scope: !527)
!534 = !MDLocation(line: 194, column: 5, scope: !527)
!535 = !MDLocation(line: 195, column: 3, scope: !527)
!536 = !MDLocation(line: 197, column: 18, scope: !7)
!537 = !MDLocation(line: 197, column: 10, scope: !7)
!538 = !MDLocation(line: 197, column: 3, scope: !7)
