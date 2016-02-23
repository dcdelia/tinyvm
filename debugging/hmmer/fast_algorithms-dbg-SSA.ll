; ModuleID = 'fast_algorithms-dbg.ll'
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
  call void @llvm.dbg.value(metadata i8* %dsq, i64 0, metadata !104, metadata !105), !dbg !106
  call void @llvm.dbg.value(metadata i32 %L, i64 0, metadata !107, metadata !105), !dbg !108
  call void @llvm.dbg.value(metadata %struct.plan7_s* %hmm, i64 0, metadata !109, metadata !105), !dbg !110
  call void @llvm.dbg.value(metadata %struct.dpmatrix_s* %mx, i64 0, metadata !111, metadata !105), !dbg !112
  call void @llvm.dbg.value(metadata %struct.p7trace_s** %ret_tr, i64 0, metadata !113, metadata !105), !dbg !114
  call void @llvm.dbg.declare(metadata %struct.p7trace_s** %tr, metadata !115, metadata !105), !dbg !116
  call void @llvm.dbg.declare(metadata i32*** %xmx, metadata !117, metadata !105), !dbg !118
  call void @llvm.dbg.declare(metadata i32*** %mmx, metadata !119, metadata !105), !dbg !120
  call void @llvm.dbg.declare(metadata i32*** %imx, metadata !121, metadata !105), !dbg !122
  call void @llvm.dbg.declare(metadata i32*** %dmx, metadata !123, metadata !105), !dbg !124
  %1 = getelementptr inbounds %struct.plan7_s* %hmm, i32 0, i32 20, !dbg !125
  %2 = load i32* %1, align 4, !dbg !125
  call void @ResizePlan7Matrix(%struct.dpmatrix_s* %mx, i32 %L, i32 %2, i32*** %xmx, i32*** %mmx, i32*** %imx, i32*** %dmx), !dbg !126
  %3 = load i32*** %xmx, align 8, !dbg !127
  %4 = getelementptr inbounds i32** %3, i64 0, !dbg !127
  %5 = load i32** %4, align 8, !dbg !127
  %6 = getelementptr inbounds i32* %5, i64 4, !dbg !127
  store i32 0, i32* %6, align 4, !dbg !127
  %7 = getelementptr inbounds %struct.plan7_s* %hmm, i32 0, i32 33, !dbg !128
  %8 = getelementptr inbounds [4 x [2 x i32]]* %7, i32 0, i64 0, !dbg !128
  %9 = getelementptr inbounds [2 x i32]* %8, i32 0, i64 0, !dbg !128
  %10 = load i32* %9, align 4, !dbg !128
  %11 = load i32*** %xmx, align 8, !dbg !129
  %12 = getelementptr inbounds i32** %11, i64 0, !dbg !129
  %13 = load i32** %12, align 8, !dbg !129
  %14 = getelementptr inbounds i32* %13, i64 0, !dbg !129
  store i32 %10, i32* %14, align 4, !dbg !129
  %15 = load i32*** %xmx, align 8, !dbg !130
  %16 = getelementptr inbounds i32** %15, i64 0, !dbg !130
  %17 = load i32** %16, align 8, !dbg !130
  %18 = getelementptr inbounds i32* %17, i64 3, !dbg !130
  store i32 -987654321, i32* %18, align 4, !dbg !130
  %19 = load i32*** %xmx, align 8, !dbg !131
  %20 = getelementptr inbounds i32** %19, i64 0, !dbg !131
  %21 = load i32** %20, align 8, !dbg !131
  %22 = getelementptr inbounds i32* %21, i64 2, !dbg !131
  store i32 -987654321, i32* %22, align 4, !dbg !131
  %23 = load i32*** %xmx, align 8, !dbg !132
  %24 = getelementptr inbounds i32** %23, i64 0, !dbg !132
  %25 = load i32** %24, align 8, !dbg !132
  %26 = getelementptr inbounds i32* %25, i64 1, !dbg !132
  store i32 -987654321, i32* %26, align 4, !dbg !132
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !133, metadata !105), !dbg !134
  br label %27, !dbg !135

; <label>:27                                      ; preds = %47, %0
  %k.0 = phi i32 [ 0, %0 ], [ %48, %47 ]
  %28 = getelementptr inbounds %struct.plan7_s* %hmm, i32 0, i32 20, !dbg !137
  %29 = load i32* %28, align 4, !dbg !137
  %30 = icmp sle i32 %k.0, %29, !dbg !139
  br i1 %30, label %31, label %49, !dbg !140

; <label>:31                                      ; preds = %27
  %32 = sext i32 %k.0 to i64, !dbg !141
  %33 = load i32*** %dmx, align 8, !dbg !141
  %34 = getelementptr inbounds i32** %33, i64 0, !dbg !141
  %35 = load i32** %34, align 8, !dbg !141
  %36 = getelementptr inbounds i32* %35, i64 %32, !dbg !141
  store i32 -987654321, i32* %36, align 4, !dbg !141
  %37 = sext i32 %k.0 to i64, !dbg !142
  %38 = load i32*** %imx, align 8, !dbg !142
  %39 = getelementptr inbounds i32** %38, i64 0, !dbg !142
  %40 = load i32** %39, align 8, !dbg !142
  %41 = getelementptr inbounds i32* %40, i64 %37, !dbg !142
  store i32 -987654321, i32* %41, align 4, !dbg !142
  %42 = sext i32 %k.0 to i64, !dbg !143
  %43 = load i32*** %mmx, align 8, !dbg !143
  %44 = getelementptr inbounds i32** %43, i64 0, !dbg !143
  %45 = load i32** %44, align 8, !dbg !143
  %46 = getelementptr inbounds i32* %45, i64 %42, !dbg !143
  store i32 -987654321, i32* %46, align 4, !dbg !143
  br label %47, !dbg !143

; <label>:47                                      ; preds = %31
  %48 = add nsw i32 %k.0, 1, !dbg !144
  call void @llvm.dbg.value(metadata i32 %48, i64 0, metadata !133, metadata !105), !dbg !134
  br label %27, !dbg !145

; <label>:49                                      ; preds = %27
  %50 = getelementptr inbounds %struct.plan7_s* %hmm, i32 0, i32 20, !dbg !146
  %51 = load i32* %50, align 4, !dbg !146
  call void @llvm.dbg.value(metadata i32 %51, i64 0, metadata !147, metadata !105), !dbg !148
  %52 = getelementptr inbounds %struct.plan7_s* %hmm, i32 0, i32 30, !dbg !149
  %53 = load i32*** %52, align 8, !dbg !149
  %54 = getelementptr inbounds i32** %53, i64 0, !dbg !149
  %55 = load i32** %54, align 8, !dbg !149
  call void @llvm.dbg.value(metadata i32* %55, i64 0, metadata !150, metadata !105), !dbg !151
  %56 = getelementptr inbounds %struct.plan7_s* %hmm, i32 0, i32 30, !dbg !152
  %57 = load i32*** %56, align 8, !dbg !152
  %58 = getelementptr inbounds i32** %57, i64 3, !dbg !152
  %59 = load i32** %58, align 8, !dbg !152
  call void @llvm.dbg.value(metadata i32* %59, i64 0, metadata !153, metadata !105), !dbg !154
  %60 = getelementptr inbounds %struct.plan7_s* %hmm, i32 0, i32 30, !dbg !155
  %61 = load i32*** %60, align 8, !dbg !155
  %62 = getelementptr inbounds i32** %61, i64 5, !dbg !155
  %63 = load i32** %62, align 8, !dbg !155
  call void @llvm.dbg.value(metadata i32* %63, i64 0, metadata !156, metadata !105), !dbg !157
  %64 = getelementptr inbounds %struct.plan7_s* %hmm, i32 0, i32 30, !dbg !158
  %65 = load i32*** %64, align 8, !dbg !158
  %66 = getelementptr inbounds i32** %65, i64 2, !dbg !158
  %67 = load i32** %66, align 8, !dbg !158
  call void @llvm.dbg.value(metadata i32* %67, i64 0, metadata !159, metadata !105), !dbg !160
  %68 = getelementptr inbounds %struct.plan7_s* %hmm, i32 0, i32 30, !dbg !161
  %69 = load i32*** %68, align 8, !dbg !161
  %70 = getelementptr inbounds i32** %69, i64 6, !dbg !161
  %71 = load i32** %70, align 8, !dbg !161
  call void @llvm.dbg.value(metadata i32* %71, i64 0, metadata !162, metadata !105), !dbg !163
  %72 = getelementptr inbounds %struct.plan7_s* %hmm, i32 0, i32 30, !dbg !164
  %73 = load i32*** %72, align 8, !dbg !164
  %74 = getelementptr inbounds i32** %73, i64 1, !dbg !164
  %75 = load i32** %74, align 8, !dbg !164
  call void @llvm.dbg.value(metadata i32* %75, i64 0, metadata !165, metadata !105), !dbg !166
  %76 = getelementptr inbounds %struct.plan7_s* %hmm, i32 0, i32 30, !dbg !167
  %77 = load i32*** %76, align 8, !dbg !167
  %78 = getelementptr inbounds i32** %77, i64 4, !dbg !167
  %79 = load i32** %78, align 8, !dbg !167
  call void @llvm.dbg.value(metadata i32* %79, i64 0, metadata !168, metadata !105), !dbg !169
  %80 = getelementptr inbounds %struct.plan7_s* %hmm, i32 0, i32 34, !dbg !170
  %81 = load i32** %80, align 8, !dbg !170
  call void @llvm.dbg.value(metadata i32* %81, i64 0, metadata !171, metadata !105), !dbg !172
  call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !173, metadata !105), !dbg !174
  br label %82, !dbg !175

; <label>:82                                      ; preds = %499, %49
  %i.0 = phi i32 [ 1, %49 ], [ %500, %499 ]
  %83 = icmp sle i32 %i.0, %L, !dbg !177
  br i1 %83, label %84, label %501, !dbg !179

; <label>:84                                      ; preds = %82
  %85 = sext i32 %i.0 to i64, !dbg !180
  %86 = load i32*** %mmx, align 8, !dbg !180
  %87 = getelementptr inbounds i32** %86, i64 %85, !dbg !180
  %88 = load i32** %87, align 8, !dbg !180
  call void @llvm.dbg.value(metadata i32* %88, i64 0, metadata !182, metadata !105), !dbg !183
  %89 = sext i32 %i.0 to i64, !dbg !184
  %90 = load i32*** %dmx, align 8, !dbg !184
  %91 = getelementptr inbounds i32** %90, i64 %89, !dbg !184
  %92 = load i32** %91, align 8, !dbg !184
  call void @llvm.dbg.value(metadata i32* %92, i64 0, metadata !185, metadata !105), !dbg !186
  %93 = sext i32 %i.0 to i64, !dbg !187
  %94 = load i32*** %imx, align 8, !dbg !187
  %95 = getelementptr inbounds i32** %94, i64 %93, !dbg !187
  %96 = load i32** %95, align 8, !dbg !187
  call void @llvm.dbg.value(metadata i32* %96, i64 0, metadata !188, metadata !105), !dbg !189
  %97 = sub nsw i32 %i.0, 1, !dbg !190
  %98 = sext i32 %97 to i64, !dbg !191
  %99 = load i32*** %mmx, align 8, !dbg !191
  %100 = getelementptr inbounds i32** %99, i64 %98, !dbg !191
  %101 = load i32** %100, align 8, !dbg !191
  call void @llvm.dbg.value(metadata i32* %101, i64 0, metadata !192, metadata !105), !dbg !193
  %102 = sub nsw i32 %i.0, 1, !dbg !194
  %103 = sext i32 %102 to i64, !dbg !195
  %104 = load i32*** %dmx, align 8, !dbg !195
  %105 = getelementptr inbounds i32** %104, i64 %103, !dbg !195
  %106 = load i32** %105, align 8, !dbg !195
  call void @llvm.dbg.value(metadata i32* %106, i64 0, metadata !196, metadata !105), !dbg !197
  %107 = sub nsw i32 %i.0, 1, !dbg !198
  %108 = sext i32 %107 to i64, !dbg !199
  %109 = load i32*** %imx, align 8, !dbg !199
  %110 = getelementptr inbounds i32** %109, i64 %108, !dbg !199
  %111 = load i32** %110, align 8, !dbg !199
  call void @llvm.dbg.value(metadata i32* %111, i64 0, metadata !200, metadata !105), !dbg !201
  %112 = sub nsw i32 %i.0, 1, !dbg !202
  %113 = sext i32 %112 to i64, !dbg !203
  %114 = load i32*** %xmx, align 8, !dbg !203
  %115 = getelementptr inbounds i32** %114, i64 %113, !dbg !203
  %116 = load i32** %115, align 8, !dbg !203
  %117 = getelementptr inbounds i32* %116, i64 0, !dbg !203
  %118 = load i32* %117, align 4, !dbg !203
  call void @llvm.dbg.value(metadata i32 %118, i64 0, metadata !204, metadata !105), !dbg !205
  %119 = sext i32 %i.0 to i64, !dbg !206
  %120 = getelementptr inbounds i8* %dsq, i64 %119, !dbg !206
  %121 = load i8* %120, align 1, !dbg !206
  %122 = sext i8 %121 to i32, !dbg !207
  %123 = sext i32 %122 to i64, !dbg !208
  %124 = getelementptr inbounds %struct.plan7_s* %hmm, i32 0, i32 31, !dbg !208
  %125 = load i32*** %124, align 8, !dbg !208
  %126 = getelementptr inbounds i32** %125, i64 %123, !dbg !208
  %127 = load i32** %126, align 8, !dbg !208
  call void @llvm.dbg.value(metadata i32* %127, i64 0, metadata !209, metadata !105), !dbg !210
  %128 = sext i32 %i.0 to i64, !dbg !211
  %129 = getelementptr inbounds i8* %dsq, i64 %128, !dbg !211
  %130 = load i8* %129, align 1, !dbg !211
  %131 = sext i8 %130 to i32, !dbg !212
  %132 = sext i32 %131 to i64, !dbg !213
  %133 = getelementptr inbounds %struct.plan7_s* %hmm, i32 0, i32 32, !dbg !213
  %134 = load i32*** %133, align 8, !dbg !213
  %135 = getelementptr inbounds i32** %134, i64 %132, !dbg !213
  %136 = load i32** %135, align 8, !dbg !213
  call void @llvm.dbg.value(metadata i32* %136, i64 0, metadata !214, metadata !105), !dbg !215
  %137 = getelementptr inbounds i32* %88, i64 0, !dbg !216
  store i32 -987654321, i32* %137, align 4, !dbg !216
  %138 = getelementptr inbounds i32* %92, i64 0, !dbg !217
  store i32 -987654321, i32* %138, align 4, !dbg !217
  %139 = getelementptr inbounds i32* %96, i64 0, !dbg !218
  store i32 -987654321, i32* %139, align 4, !dbg !218
  call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !133, metadata !105), !dbg !134
  br label %140, !dbg !219

; <label>:140                                     ; preds = %293, %84
  %k.1 = phi i32 [ 1, %84 ], [ %294, %293 ]
  %141 = icmp sle i32 %k.1, %51, !dbg !221
  br i1 %141, label %142, label %295, !dbg !223

; <label>:142                                     ; preds = %140
  %143 = sub nsw i32 %k.1, 1, !dbg !224
  %144 = sext i32 %143 to i64, !dbg !226
  %145 = getelementptr inbounds i32* %101, i64 %144, !dbg !226
  %146 = load i32* %145, align 4, !dbg !226
  %147 = sub nsw i32 %k.1, 1, !dbg !227
  %148 = sext i32 %147 to i64, !dbg !228
  %149 = getelementptr inbounds i32* %55, i64 %148, !dbg !228
  %150 = load i32* %149, align 4, !dbg !228
  %151 = add nsw i32 %146, %150, !dbg !226
  %152 = sext i32 %k.1 to i64, !dbg !229
  %153 = getelementptr inbounds i32* %88, i64 %152, !dbg !229
  store i32 %151, i32* %153, align 4, !dbg !229
  %154 = sub nsw i32 %k.1, 1, !dbg !230
  %155 = sext i32 %154 to i64, !dbg !232
  %156 = getelementptr inbounds i32* %111, i64 %155, !dbg !232
  %157 = load i32* %156, align 4, !dbg !232
  %158 = sub nsw i32 %k.1, 1, !dbg !233
  %159 = sext i32 %158 to i64, !dbg !234
  %160 = getelementptr inbounds i32* %59, i64 %159, !dbg !234
  %161 = load i32* %160, align 4, !dbg !234
  %162 = add nsw i32 %157, %161, !dbg !232
  call void @llvm.dbg.value(metadata i32 %162, i64 0, metadata !235, metadata !105), !dbg !236
  %163 = sext i32 %k.1 to i64, !dbg !237
  %164 = getelementptr inbounds i32* %88, i64 %163, !dbg !237
  %165 = load i32* %164, align 4, !dbg !237
  %166 = icmp sgt i32 %162, %165, !dbg !238
  br i1 %166, label %167, label %170, !dbg !239

; <label>:167                                     ; preds = %142
  %168 = sext i32 %k.1 to i64, !dbg !240
  %169 = getelementptr inbounds i32* %88, i64 %168, !dbg !240
  store i32 %162, i32* %169, align 4, !dbg !240
  br label %170, !dbg !240

; <label>:170                                     ; preds = %167, %142
  %171 = sub nsw i32 %k.1, 1, !dbg !241
  %172 = sext i32 %171 to i64, !dbg !243
  %173 = getelementptr inbounds i32* %106, i64 %172, !dbg !243
  %174 = load i32* %173, align 4, !dbg !243
  %175 = sub nsw i32 %k.1, 1, !dbg !244
  %176 = sext i32 %175 to i64, !dbg !245
  %177 = getelementptr inbounds i32* %63, i64 %176, !dbg !245
  %178 = load i32* %177, align 4, !dbg !245
  %179 = add nsw i32 %174, %178, !dbg !243
  call void @llvm.dbg.value(metadata i32 %179, i64 0, metadata !235, metadata !105), !dbg !236
  %180 = sext i32 %k.1 to i64, !dbg !246
  %181 = getelementptr inbounds i32* %88, i64 %180, !dbg !246
  %182 = load i32* %181, align 4, !dbg !246
  %183 = icmp sgt i32 %179, %182, !dbg !247
  br i1 %183, label %184, label %187, !dbg !248

; <label>:184                                     ; preds = %170
  %185 = sext i32 %k.1 to i64, !dbg !249
  %186 = getelementptr inbounds i32* %88, i64 %185, !dbg !249
  store i32 %179, i32* %186, align 4, !dbg !249
  br label %187, !dbg !249

; <label>:187                                     ; preds = %184, %170
  %188 = sext i32 %k.1 to i64, !dbg !250
  %189 = getelementptr inbounds i32* %81, i64 %188, !dbg !250
  %190 = load i32* %189, align 4, !dbg !250
  %191 = add nsw i32 %118, %190, !dbg !252
  call void @llvm.dbg.value(metadata i32 %191, i64 0, metadata !235, metadata !105), !dbg !236
  %192 = sext i32 %k.1 to i64, !dbg !253
  %193 = getelementptr inbounds i32* %88, i64 %192, !dbg !253
  %194 = load i32* %193, align 4, !dbg !253
  %195 = icmp sgt i32 %191, %194, !dbg !254
  br i1 %195, label %196, label %199, !dbg !255

; <label>:196                                     ; preds = %187
  %197 = sext i32 %k.1 to i64, !dbg !256
  %198 = getelementptr inbounds i32* %88, i64 %197, !dbg !256
  store i32 %191, i32* %198, align 4, !dbg !256
  br label %199, !dbg !256

; <label>:199                                     ; preds = %196, %187
  %200 = sext i32 %k.1 to i64, !dbg !257
  %201 = getelementptr inbounds i32* %127, i64 %200, !dbg !257
  %202 = load i32* %201, align 4, !dbg !257
  %203 = sext i32 %k.1 to i64, !dbg !258
  %204 = getelementptr inbounds i32* %88, i64 %203, !dbg !258
  %205 = load i32* %204, align 4, !dbg !258
  %206 = add nsw i32 %205, %202, !dbg !258
  store i32 %206, i32* %204, align 4, !dbg !258
  %207 = sext i32 %k.1 to i64, !dbg !259
  %208 = getelementptr inbounds i32* %88, i64 %207, !dbg !259
  %209 = load i32* %208, align 4, !dbg !259
  %210 = icmp slt i32 %209, -987654321, !dbg !259
  br i1 %210, label %211, label %214, !dbg !261

; <label>:211                                     ; preds = %199
  %212 = sext i32 %k.1 to i64, !dbg !262
  %213 = getelementptr inbounds i32* %88, i64 %212, !dbg !262
  store i32 -987654321, i32* %213, align 4, !dbg !262
  br label %214, !dbg !262

; <label>:214                                     ; preds = %211, %199
  %215 = sub nsw i32 %k.1, 1, !dbg !263
  %216 = sext i32 %215 to i64, !dbg !264
  %217 = getelementptr inbounds i32* %92, i64 %216, !dbg !264
  %218 = load i32* %217, align 4, !dbg !264
  %219 = sub nsw i32 %k.1, 1, !dbg !265
  %220 = sext i32 %219 to i64, !dbg !266
  %221 = getelementptr inbounds i32* %71, i64 %220, !dbg !266
  %222 = load i32* %221, align 4, !dbg !266
  %223 = add nsw i32 %218, %222, !dbg !264
  %224 = sext i32 %k.1 to i64, !dbg !267
  %225 = getelementptr inbounds i32* %92, i64 %224, !dbg !267
  store i32 %223, i32* %225, align 4, !dbg !267
  %226 = sub nsw i32 %k.1, 1, !dbg !268
  %227 = sext i32 %226 to i64, !dbg !270
  %228 = getelementptr inbounds i32* %88, i64 %227, !dbg !270
  %229 = load i32* %228, align 4, !dbg !270
  %230 = sub nsw i32 %k.1, 1, !dbg !271
  %231 = sext i32 %230 to i64, !dbg !272
  %232 = getelementptr inbounds i32* %67, i64 %231, !dbg !272
  %233 = load i32* %232, align 4, !dbg !272
  %234 = add nsw i32 %229, %233, !dbg !270
  call void @llvm.dbg.value(metadata i32 %234, i64 0, metadata !235, metadata !105), !dbg !236
  %235 = sext i32 %k.1 to i64, !dbg !273
  %236 = getelementptr inbounds i32* %92, i64 %235, !dbg !273
  %237 = load i32* %236, align 4, !dbg !273
  %238 = icmp sgt i32 %234, %237, !dbg !274
  br i1 %238, label %239, label %242, !dbg !275

; <label>:239                                     ; preds = %214
  %240 = sext i32 %k.1 to i64, !dbg !276
  %241 = getelementptr inbounds i32* %92, i64 %240, !dbg !276
  store i32 %234, i32* %241, align 4, !dbg !276
  br label %242, !dbg !276

; <label>:242                                     ; preds = %239, %214
  %243 = sext i32 %k.1 to i64, !dbg !277
  %244 = getelementptr inbounds i32* %92, i64 %243, !dbg !277
  %245 = load i32* %244, align 4, !dbg !277
  %246 = icmp slt i32 %245, -987654321, !dbg !277
  br i1 %246, label %247, label %250, !dbg !279

; <label>:247                                     ; preds = %242
  %248 = sext i32 %k.1 to i64, !dbg !280
  %249 = getelementptr inbounds i32* %92, i64 %248, !dbg !280
  store i32 -987654321, i32* %249, align 4, !dbg !280
  br label %250, !dbg !280

; <label>:250                                     ; preds = %247, %242
  %251 = icmp slt i32 %k.1, %51, !dbg !281
  br i1 %251, label %252, label %292, !dbg !283

; <label>:252                                     ; preds = %250
  %253 = sext i32 %k.1 to i64, !dbg !284
  %254 = getelementptr inbounds i32* %101, i64 %253, !dbg !284
  %255 = load i32* %254, align 4, !dbg !284
  %256 = sext i32 %k.1 to i64, !dbg !286
  %257 = getelementptr inbounds i32* %75, i64 %256, !dbg !286
  %258 = load i32* %257, align 4, !dbg !286
  %259 = add nsw i32 %255, %258, !dbg !284
  %260 = sext i32 %k.1 to i64, !dbg !287
  %261 = getelementptr inbounds i32* %96, i64 %260, !dbg !287
  store i32 %259, i32* %261, align 4, !dbg !287
  %262 = sext i32 %k.1 to i64, !dbg !288
  %263 = getelementptr inbounds i32* %111, i64 %262, !dbg !288
  %264 = load i32* %263, align 4, !dbg !288
  %265 = sext i32 %k.1 to i64, !dbg !290
  %266 = getelementptr inbounds i32* %79, i64 %265, !dbg !290
  %267 = load i32* %266, align 4, !dbg !290
  %268 = add nsw i32 %264, %267, !dbg !288
  call void @llvm.dbg.value(metadata i32 %268, i64 0, metadata !235, metadata !105), !dbg !236
  %269 = sext i32 %k.1 to i64, !dbg !291
  %270 = getelementptr inbounds i32* %96, i64 %269, !dbg !291
  %271 = load i32* %270, align 4, !dbg !291
  %272 = icmp sgt i32 %268, %271, !dbg !292
  br i1 %272, label %273, label %276, !dbg !293

; <label>:273                                     ; preds = %252
  %274 = sext i32 %k.1 to i64, !dbg !294
  %275 = getelementptr inbounds i32* %96, i64 %274, !dbg !294
  store i32 %268, i32* %275, align 4, !dbg !294
  br label %276, !dbg !294

; <label>:276                                     ; preds = %273, %252
  %277 = sext i32 %k.1 to i64, !dbg !295
  %278 = getelementptr inbounds i32* %136, i64 %277, !dbg !295
  %279 = load i32* %278, align 4, !dbg !295
  %280 = sext i32 %k.1 to i64, !dbg !296
  %281 = getelementptr inbounds i32* %96, i64 %280, !dbg !296
  %282 = load i32* %281, align 4, !dbg !296
  %283 = add nsw i32 %282, %279, !dbg !296
  store i32 %283, i32* %281, align 4, !dbg !296
  %284 = sext i32 %k.1 to i64, !dbg !297
  %285 = getelementptr inbounds i32* %96, i64 %284, !dbg !297
  %286 = load i32* %285, align 4, !dbg !297
  %287 = icmp slt i32 %286, -987654321, !dbg !297
  br i1 %287, label %288, label %291, !dbg !299

; <label>:288                                     ; preds = %276
  %289 = sext i32 %k.1 to i64, !dbg !300
  %290 = getelementptr inbounds i32* %96, i64 %289, !dbg !300
  store i32 -987654321, i32* %290, align 4, !dbg !300
  br label %291, !dbg !300

; <label>:291                                     ; preds = %288, %276
  br label %292, !dbg !301

; <label>:292                                     ; preds = %291, %250
  br label %293, !dbg !302

; <label>:293                                     ; preds = %292
  %294 = add nsw i32 %k.1, 1, !dbg !303
  call void @llvm.dbg.value(metadata i32 %294, i64 0, metadata !133, metadata !105), !dbg !134
  br label %140, !dbg !304

; <label>:295                                     ; preds = %140
  %296 = sext i32 %i.0 to i64, !dbg !305
  %297 = load i32*** %xmx, align 8, !dbg !305
  %298 = getelementptr inbounds i32** %297, i64 %296, !dbg !305
  %299 = load i32** %298, align 8, !dbg !305
  %300 = getelementptr inbounds i32* %299, i64 4, !dbg !305
  store i32 -987654321, i32* %300, align 4, !dbg !305
  %301 = sub nsw i32 %i.0, 1, !dbg !306
  %302 = sext i32 %301 to i64, !dbg !308
  %303 = load i32*** %xmx, align 8, !dbg !308
  %304 = getelementptr inbounds i32** %303, i64 %302, !dbg !308
  %305 = load i32** %304, align 8, !dbg !308
  %306 = getelementptr inbounds i32* %305, i64 4, !dbg !308
  %307 = load i32* %306, align 4, !dbg !308
  %308 = getelementptr inbounds %struct.plan7_s* %hmm, i32 0, i32 33, !dbg !309
  %309 = getelementptr inbounds [4 x [2 x i32]]* %308, i32 0, i64 0, !dbg !309
  %310 = getelementptr inbounds [2 x i32]* %309, i32 0, i64 1, !dbg !309
  %311 = load i32* %310, align 4, !dbg !309
  %312 = add nsw i32 %307, %311, !dbg !308
  call void @llvm.dbg.value(metadata i32 %312, i64 0, metadata !235, metadata !105), !dbg !236
  %313 = icmp sgt i32 %312, -987654321, !dbg !310
  br i1 %313, label %314, label %320, !dbg !311

; <label>:314                                     ; preds = %295
  %315 = sext i32 %i.0 to i64, !dbg !312
  %316 = load i32*** %xmx, align 8, !dbg !312
  %317 = getelementptr inbounds i32** %316, i64 %315, !dbg !312
  %318 = load i32** %317, align 8, !dbg !312
  %319 = getelementptr inbounds i32* %318, i64 4, !dbg !312
  store i32 %312, i32* %319, align 4, !dbg !312
  br label %320, !dbg !312

; <label>:320                                     ; preds = %314, %295
  call void @llvm.dbg.value(metadata i32 -987654321, i64 0, metadata !313, metadata !105), !dbg !314
  %321 = sext i32 %i.0 to i64, !dbg !315
  %322 = load i32*** %mmx, align 8, !dbg !315
  %323 = getelementptr inbounds i32** %322, i64 %321, !dbg !315
  %324 = load i32** %323, align 8, !dbg !315
  call void @llvm.dbg.value(metadata i32* %324, i64 0, metadata !316, metadata !105), !dbg !317
  %325 = getelementptr inbounds %struct.plan7_s* %hmm, i32 0, i32 35, !dbg !318
  %326 = load i32** %325, align 8, !dbg !318
  call void @llvm.dbg.value(metadata i32* %326, i64 0, metadata !319, metadata !105), !dbg !320
  call void @llvm.dbg.value(metadata i32 1, i64 0, metadata !133, metadata !105), !dbg !134
  br label %327, !dbg !321

; <label>:327                                     ; preds = %342, %320
  %k.2 = phi i32 [ 1, %320 ], [ %343, %342 ]
  %xme.0 = phi i32 [ -987654321, %320 ], [ %xme.1, %342 ]
  %328 = getelementptr inbounds %struct.plan7_s* %hmm, i32 0, i32 20, !dbg !323
  %329 = load i32* %328, align 4, !dbg !323
  %330 = icmp sle i32 %k.2, %329, !dbg !325
  br i1 %330, label %331, label %344, !dbg !326

; <label>:331                                     ; preds = %327
  %332 = sext i32 %k.2 to i64, !dbg !327
  %333 = getelementptr inbounds i32* %324, i64 %332, !dbg !327
  %334 = load i32* %333, align 4, !dbg !327
  %335 = sext i32 %k.2 to i64, !dbg !329
  %336 = getelementptr inbounds i32* %326, i64 %335, !dbg !329
  %337 = load i32* %336, align 4, !dbg !329
  %338 = add nsw i32 %334, %337, !dbg !327
  call void @llvm.dbg.value(metadata i32 %338, i64 0, metadata !235, metadata !105), !dbg !236
  %339 = icmp sgt i32 %338, %xme.0, !dbg !330
  br i1 %339, label %340, label %341, !dbg !331

; <label>:340                                     ; preds = %331
  call void @llvm.dbg.value(metadata i32 %338, i64 0, metadata !313, metadata !105), !dbg !314
  br label %341, !dbg !332

; <label>:341                                     ; preds = %340, %331
  %xme.1 = phi i32 [ %338, %340 ], [ %xme.0, %331 ]
  br label %342, !dbg !333

; <label>:342                                     ; preds = %341
  %343 = add nsw i32 %k.2, 1, !dbg !336
  call void @llvm.dbg.value(metadata i32 %343, i64 0, metadata !133, metadata !105), !dbg !134
  br label %327, !dbg !337

; <label>:344                                     ; preds = %327
  %345 = sext i32 %i.0 to i64, !dbg !338
  %346 = load i32*** %xmx, align 8, !dbg !338
  %347 = getelementptr inbounds i32** %346, i64 %345, !dbg !338
  %348 = load i32** %347, align 8, !dbg !338
  %349 = getelementptr inbounds i32* %348, i64 1, !dbg !338
  store i32 %xme.0, i32* %349, align 4, !dbg !338
  %350 = sext i32 %i.0 to i64, !dbg !339
  %351 = load i32*** %xmx, align 8, !dbg !339
  %352 = getelementptr inbounds i32** %351, i64 %350, !dbg !339
  %353 = load i32** %352, align 8, !dbg !339
  %354 = getelementptr inbounds i32* %353, i64 3, !dbg !339
  store i32 -987654321, i32* %354, align 4, !dbg !339
  %355 = sub nsw i32 %i.0, 1, !dbg !340
  %356 = sext i32 %355 to i64, !dbg !342
  %357 = load i32*** %xmx, align 8, !dbg !342
  %358 = getelementptr inbounds i32** %357, i64 %356, !dbg !342
  %359 = load i32** %358, align 8, !dbg !342
  %360 = getelementptr inbounds i32* %359, i64 3, !dbg !342
  %361 = load i32* %360, align 4, !dbg !342
  %362 = getelementptr inbounds %struct.plan7_s* %hmm, i32 0, i32 33, !dbg !343
  %363 = getelementptr inbounds [4 x [2 x i32]]* %362, i32 0, i64 3, !dbg !343
  %364 = getelementptr inbounds [2 x i32]* %363, i32 0, i64 1, !dbg !343
  %365 = load i32* %364, align 4, !dbg !343
  %366 = add nsw i32 %361, %365, !dbg !342
  call void @llvm.dbg.value(metadata i32 %366, i64 0, metadata !235, metadata !105), !dbg !236
  %367 = icmp sgt i32 %366, -987654321, !dbg !344
  br i1 %367, label %368, label %374, !dbg !345

; <label>:368                                     ; preds = %344
  %369 = sext i32 %i.0 to i64, !dbg !346
  %370 = load i32*** %xmx, align 8, !dbg !346
  %371 = getelementptr inbounds i32** %370, i64 %369, !dbg !346
  %372 = load i32** %371, align 8, !dbg !346
  %373 = getelementptr inbounds i32* %372, i64 3, !dbg !346
  store i32 %366, i32* %373, align 4, !dbg !346
  br label %374, !dbg !346

; <label>:374                                     ; preds = %368, %344
  %375 = sext i32 %i.0 to i64, !dbg !347
  %376 = load i32*** %xmx, align 8, !dbg !347
  %377 = getelementptr inbounds i32** %376, i64 %375, !dbg !347
  %378 = load i32** %377, align 8, !dbg !347
  %379 = getelementptr inbounds i32* %378, i64 1, !dbg !347
  %380 = load i32* %379, align 4, !dbg !347
  %381 = getelementptr inbounds %struct.plan7_s* %hmm, i32 0, i32 33, !dbg !349
  %382 = getelementptr inbounds [4 x [2 x i32]]* %381, i32 0, i64 1, !dbg !349
  %383 = getelementptr inbounds [2 x i32]* %382, i32 0, i64 1, !dbg !349
  %384 = load i32* %383, align 4, !dbg !349
  %385 = add nsw i32 %380, %384, !dbg !347
  call void @llvm.dbg.value(metadata i32 %385, i64 0, metadata !235, metadata !105), !dbg !236
  %386 = sext i32 %i.0 to i64, !dbg !350
  %387 = load i32*** %xmx, align 8, !dbg !350
  %388 = getelementptr inbounds i32** %387, i64 %386, !dbg !350
  %389 = load i32** %388, align 8, !dbg !350
  %390 = getelementptr inbounds i32* %389, i64 3, !dbg !350
  %391 = load i32* %390, align 4, !dbg !350
  %392 = icmp sgt i32 %385, %391, !dbg !351
  br i1 %392, label %393, label %399, !dbg !352

; <label>:393                                     ; preds = %374
  %394 = sext i32 %i.0 to i64, !dbg !353
  %395 = load i32*** %xmx, align 8, !dbg !353
  %396 = getelementptr inbounds i32** %395, i64 %394, !dbg !353
  %397 = load i32** %396, align 8, !dbg !353
  %398 = getelementptr inbounds i32* %397, i64 3, !dbg !353
  store i32 %385, i32* %398, align 4, !dbg !353
  br label %399, !dbg !353

; <label>:399                                     ; preds = %393, %374
  %400 = sext i32 %i.0 to i64, !dbg !354
  %401 = load i32*** %xmx, align 8, !dbg !354
  %402 = getelementptr inbounds i32** %401, i64 %400, !dbg !354
  %403 = load i32** %402, align 8, !dbg !354
  %404 = getelementptr inbounds i32* %403, i64 0, !dbg !354
  store i32 -987654321, i32* %404, align 4, !dbg !354
  %405 = sext i32 %i.0 to i64, !dbg !355
  %406 = load i32*** %xmx, align 8, !dbg !355
  %407 = getelementptr inbounds i32** %406, i64 %405, !dbg !355
  %408 = load i32** %407, align 8, !dbg !355
  %409 = getelementptr inbounds i32* %408, i64 4, !dbg !355
  %410 = load i32* %409, align 4, !dbg !355
  %411 = getelementptr inbounds %struct.plan7_s* %hmm, i32 0, i32 33, !dbg !357
  %412 = getelementptr inbounds [4 x [2 x i32]]* %411, i32 0, i64 0, !dbg !357
  %413 = getelementptr inbounds [2 x i32]* %412, i32 0, i64 0, !dbg !357
  %414 = load i32* %413, align 4, !dbg !357
  %415 = add nsw i32 %410, %414, !dbg !355
  call void @llvm.dbg.value(metadata i32 %415, i64 0, metadata !235, metadata !105), !dbg !236
  %416 = icmp sgt i32 %415, -987654321, !dbg !358
  br i1 %416, label %417, label %423, !dbg !359

; <label>:417                                     ; preds = %399
  %418 = sext i32 %i.0 to i64, !dbg !360
  %419 = load i32*** %xmx, align 8, !dbg !360
  %420 = getelementptr inbounds i32** %419, i64 %418, !dbg !360
  %421 = load i32** %420, align 8, !dbg !360
  %422 = getelementptr inbounds i32* %421, i64 0, !dbg !360
  store i32 %415, i32* %422, align 4, !dbg !360
  br label %423, !dbg !360

; <label>:423                                     ; preds = %417, %399
  %424 = sext i32 %i.0 to i64, !dbg !361
  %425 = load i32*** %xmx, align 8, !dbg !361
  %426 = getelementptr inbounds i32** %425, i64 %424, !dbg !361
  %427 = load i32** %426, align 8, !dbg !361
  %428 = getelementptr inbounds i32* %427, i64 3, !dbg !361
  %429 = load i32* %428, align 4, !dbg !361
  %430 = getelementptr inbounds %struct.plan7_s* %hmm, i32 0, i32 33, !dbg !363
  %431 = getelementptr inbounds [4 x [2 x i32]]* %430, i32 0, i64 3, !dbg !363
  %432 = getelementptr inbounds [2 x i32]* %431, i32 0, i64 0, !dbg !363
  %433 = load i32* %432, align 4, !dbg !363
  %434 = add nsw i32 %429, %433, !dbg !361
  call void @llvm.dbg.value(metadata i32 %434, i64 0, metadata !235, metadata !105), !dbg !236
  %435 = sext i32 %i.0 to i64, !dbg !364
  %436 = load i32*** %xmx, align 8, !dbg !364
  %437 = getelementptr inbounds i32** %436, i64 %435, !dbg !364
  %438 = load i32** %437, align 8, !dbg !364
  %439 = getelementptr inbounds i32* %438, i64 0, !dbg !364
  %440 = load i32* %439, align 4, !dbg !364
  %441 = icmp sgt i32 %434, %440, !dbg !365
  br i1 %441, label %442, label %448, !dbg !366

; <label>:442                                     ; preds = %423
  %443 = sext i32 %i.0 to i64, !dbg !367
  %444 = load i32*** %xmx, align 8, !dbg !367
  %445 = getelementptr inbounds i32** %444, i64 %443, !dbg !367
  %446 = load i32** %445, align 8, !dbg !367
  %447 = getelementptr inbounds i32* %446, i64 0, !dbg !367
  store i32 %434, i32* %447, align 4, !dbg !367
  br label %448, !dbg !367

; <label>:448                                     ; preds = %442, %423
  %449 = sext i32 %i.0 to i64, !dbg !368
  %450 = load i32*** %xmx, align 8, !dbg !368
  %451 = getelementptr inbounds i32** %450, i64 %449, !dbg !368
  %452 = load i32** %451, align 8, !dbg !368
  %453 = getelementptr inbounds i32* %452, i64 2, !dbg !368
  store i32 -987654321, i32* %453, align 4, !dbg !368
  %454 = sub nsw i32 %i.0, 1, !dbg !369
  %455 = sext i32 %454 to i64, !dbg !371
  %456 = load i32*** %xmx, align 8, !dbg !371
  %457 = getelementptr inbounds i32** %456, i64 %455, !dbg !371
  %458 = load i32** %457, align 8, !dbg !371
  %459 = getelementptr inbounds i32* %458, i64 2, !dbg !371
  %460 = load i32* %459, align 4, !dbg !371
  %461 = getelementptr inbounds %struct.plan7_s* %hmm, i32 0, i32 33, !dbg !372
  %462 = getelementptr inbounds [4 x [2 x i32]]* %461, i32 0, i64 2, !dbg !372
  %463 = getelementptr inbounds [2 x i32]* %462, i32 0, i64 1, !dbg !372
  %464 = load i32* %463, align 4, !dbg !372
  %465 = add nsw i32 %460, %464, !dbg !371
  call void @llvm.dbg.value(metadata i32 %465, i64 0, metadata !235, metadata !105), !dbg !236
  %466 = icmp sgt i32 %465, -987654321, !dbg !373
  br i1 %466, label %467, label %473, !dbg !374

; <label>:467                                     ; preds = %448
  %468 = sext i32 %i.0 to i64, !dbg !375
  %469 = load i32*** %xmx, align 8, !dbg !375
  %470 = getelementptr inbounds i32** %469, i64 %468, !dbg !375
  %471 = load i32** %470, align 8, !dbg !375
  %472 = getelementptr inbounds i32* %471, i64 2, !dbg !375
  store i32 %465, i32* %472, align 4, !dbg !375
  br label %473, !dbg !375

; <label>:473                                     ; preds = %467, %448
  %474 = sext i32 %i.0 to i64, !dbg !376
  %475 = load i32*** %xmx, align 8, !dbg !376
  %476 = getelementptr inbounds i32** %475, i64 %474, !dbg !376
  %477 = load i32** %476, align 8, !dbg !376
  %478 = getelementptr inbounds i32* %477, i64 1, !dbg !376
  %479 = load i32* %478, align 4, !dbg !376
  %480 = getelementptr inbounds %struct.plan7_s* %hmm, i32 0, i32 33, !dbg !378
  %481 = getelementptr inbounds [4 x [2 x i32]]* %480, i32 0, i64 1, !dbg !378
  %482 = getelementptr inbounds [2 x i32]* %481, i32 0, i64 0, !dbg !378
  %483 = load i32* %482, align 4, !dbg !378
  %484 = add nsw i32 %479, %483, !dbg !376
  call void @llvm.dbg.value(metadata i32 %484, i64 0, metadata !235, metadata !105), !dbg !236
  %485 = sext i32 %i.0 to i64, !dbg !379
  %486 = load i32*** %xmx, align 8, !dbg !379
  %487 = getelementptr inbounds i32** %486, i64 %485, !dbg !379
  %488 = load i32** %487, align 8, !dbg !379
  %489 = getelementptr inbounds i32* %488, i64 2, !dbg !379
  %490 = load i32* %489, align 4, !dbg !379
  %491 = icmp sgt i32 %484, %490, !dbg !380
  br i1 %491, label %492, label %498, !dbg !381

; <label>:492                                     ; preds = %473
  %493 = sext i32 %i.0 to i64, !dbg !382
  %494 = load i32*** %xmx, align 8, !dbg !382
  %495 = getelementptr inbounds i32** %494, i64 %493, !dbg !382
  %496 = load i32** %495, align 8, !dbg !382
  %497 = getelementptr inbounds i32* %496, i64 2, !dbg !382
  store i32 %484, i32* %497, align 4, !dbg !382
  br label %498, !dbg !382

; <label>:498                                     ; preds = %492, %473
  br label %499, !dbg !383

; <label>:499                                     ; preds = %498
  %500 = add nsw i32 %i.0, 1, !dbg !384
  call void @llvm.dbg.value(metadata i32 %500, i64 0, metadata !173, metadata !105), !dbg !174
  br label %82, !dbg !385

; <label>:501                                     ; preds = %82
  %502 = sext i32 %L to i64, !dbg !386
  %503 = load i32*** %xmx, align 8, !dbg !386
  %504 = getelementptr inbounds i32** %503, i64 %502, !dbg !386
  %505 = load i32** %504, align 8, !dbg !386
  %506 = getelementptr inbounds i32* %505, i64 2, !dbg !386
  %507 = load i32* %506, align 4, !dbg !386
  %508 = getelementptr inbounds %struct.plan7_s* %hmm, i32 0, i32 33, !dbg !387
  %509 = getelementptr inbounds [4 x [2 x i32]]* %508, i32 0, i64 2, !dbg !387
  %510 = getelementptr inbounds [2 x i32]* %509, i32 0, i64 0, !dbg !387
  %511 = load i32* %510, align 4, !dbg !387
  %512 = add nsw i32 %507, %511, !dbg !386
  call void @llvm.dbg.value(metadata i32 %512, i64 0, metadata !235, metadata !105), !dbg !236
  %513 = icmp ne %struct.p7trace_s** %ret_tr, null, !dbg !388
  br i1 %513, label %514, label %516, !dbg !390

; <label>:514                                     ; preds = %501
  call void @P7ViterbiTrace(%struct.plan7_s* %hmm, i8* %dsq, i32 %L, %struct.dpmatrix_s* %mx, %struct.p7trace_s** %tr), !dbg !391
  %515 = load %struct.p7trace_s** %tr, align 8, !dbg !393
  store %struct.p7trace_s* %515, %struct.p7trace_s** %ret_tr, align 8, !dbg !394
  br label %516, !dbg !395

; <label>:516                                     ; preds = %514, %501
  %517 = call float @Scorify(i32 %512), !dbg !396
  ret float %517, !dbg !397
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @ResizePlan7Matrix(%struct.dpmatrix_s*, i32, i32, i32***, i32***, i32***, i32***) #2

declare void @P7ViterbiTrace(%struct.plan7_s*, i8*, i32, %struct.dpmatrix_s*, %struct.p7trace_s**) #2

declare float @Scorify(i32) #2

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #1

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
!125 = !MDLocation(line: 91, column: 28, scope: !7)
!126 = !MDLocation(line: 91, column: 3, scope: !7)
!127 = !MDLocation(line: 95, column: 3, scope: !7)
!128 = !MDLocation(line: 96, column: 17, scope: !7)
!129 = !MDLocation(line: 96, column: 3, scope: !7)
!130 = !MDLocation(line: 97, column: 31, scope: !7)
!131 = !MDLocation(line: 97, column: 17, scope: !7)
!132 = !MDLocation(line: 97, column: 3, scope: !7)
!133 = !{!"0x100\00k\0076\000", !7, !8, !4}       ; [ DW_TAG_auto_variable ] [k] [line 76]
!134 = !MDLocation(line: 76, column: 11, scope: !7)
!135 = !MDLocation(line: 98, column: 8, scope: !136)
!136 = !{!"0xb\0098\003\000", !1, !7}             ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/hmmer/fast_algorithms.c]
!137 = !MDLocation(line: 98, column: 20, scope: !138)
!138 = !{!"0xb\0098\003\001", !1, !136}           ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/hmmer/fast_algorithms.c]
!139 = !MDLocation(line: 98, column: 15, scope: !138)
!140 = !MDLocation(line: 98, column: 3, scope: !136)
!141 = !MDLocation(line: 99, column: 29, scope: !138)
!142 = !MDLocation(line: 99, column: 17, scope: !138)
!143 = !MDLocation(line: 99, column: 5, scope: !138)
!144 = !MDLocation(line: 98, column: 28, scope: !138)
!145 = !MDLocation(line: 98, column: 3, scope: !138)
!146 = !MDLocation(line: 103, column: 14, scope: !7)
!147 = !{!"0x100\00M\0087\000", !7, !8, !4}       ; [ DW_TAG_auto_variable ] [M] [line 87]
!148 = !MDLocation(line: 87, column: 9, scope: !7)
!149 = !MDLocation(line: 111, column: 11, scope: !7)
!150 = !{!"0x100\00tpmm\0086\000", !7, !8, !28}   ; [ DW_TAG_auto_variable ] [tpmm] [line 86]
!151 = !MDLocation(line: 86, column: 9, scope: !7)
!152 = !MDLocation(line: 112, column: 11, scope: !7)
!153 = !{!"0x100\00tpim\0086\000", !7, !8, !28}   ; [ DW_TAG_auto_variable ] [tpim] [line 86]
!154 = !MDLocation(line: 86, column: 30, scope: !7)
!155 = !MDLocation(line: 113, column: 11, scope: !7)
!156 = !{!"0x100\00tpdm\0086\000", !7, !8, !28}   ; [ DW_TAG_auto_variable ] [tpdm] [line 86]
!157 = !MDLocation(line: 86, column: 44, scope: !7)
!158 = !MDLocation(line: 114, column: 11, scope: !7)
!159 = !{!"0x100\00tpmd\0086\000", !7, !8, !28}   ; [ DW_TAG_auto_variable ] [tpmd] [line 86]
!160 = !MDLocation(line: 86, column: 23, scope: !7)
!161 = !MDLocation(line: 115, column: 11, scope: !7)
!162 = !{!"0x100\00tpdd\0086\000", !7, !8, !28}   ; [ DW_TAG_auto_variable ] [tpdd] [line 86]
!163 = !MDLocation(line: 86, column: 51, scope: !7)
!164 = !MDLocation(line: 116, column: 11, scope: !7)
!165 = !{!"0x100\00tpmi\0086\000", !7, !8, !28}   ; [ DW_TAG_auto_variable ] [tpmi] [line 86]
!166 = !MDLocation(line: 86, column: 16, scope: !7)
!167 = !MDLocation(line: 117, column: 11, scope: !7)
!168 = !{!"0x100\00tpii\0086\000", !7, !8, !28}   ; [ DW_TAG_auto_variable ] [tpii] [line 86]
!169 = !MDLocation(line: 86, column: 37, scope: !7)
!170 = !MDLocation(line: 118, column: 11, scope: !7)
!171 = !{!"0x100\00bp\0081\000", !7, !8, !28}     ; [ DW_TAG_auto_variable ] [bp] [line 81]
!172 = !MDLocation(line: 81, column: 9, scope: !7)
!173 = !{!"0x100\00i\0076\000", !7, !8, !4}       ; [ DW_TAG_auto_variable ] [i] [line 76]
!174 = !MDLocation(line: 76, column: 9, scope: !7)
!175 = !MDLocation(line: 119, column: 8, scope: !176)
!176 = !{!"0xb\00119\003\002", !1, !7}            ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/hmmer/fast_algorithms.c]
!177 = !MDLocation(line: 119, column: 15, scope: !178)
!178 = !{!"0xb\00119\003\003", !1, !176}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/hmmer/fast_algorithms.c]
!179 = !MDLocation(line: 119, column: 3, scope: !176)
!180 = !MDLocation(line: 120, column: 13, scope: !181)
!181 = !{!"0xb\00119\0028\004", !1, !178}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/hmmer/fast_algorithms.c]
!182 = !{!"0x100\00mc\0078\000", !7, !8, !28}     ; [ DW_TAG_auto_variable ] [mc] [line 78]
!183 = !MDLocation(line: 78, column: 9, scope: !7)
!184 = !MDLocation(line: 121, column: 13, scope: !181)
!185 = !{!"0x100\00dc\0078\000", !7, !8, !28}     ; [ DW_TAG_auto_variable ] [dc] [line 78]
!186 = !MDLocation(line: 78, column: 14, scope: !7)
!187 = !MDLocation(line: 122, column: 13, scope: !181)
!188 = !{!"0x100\00ic\0078\000", !7, !8, !28}     ; [ DW_TAG_auto_variable ] [ic] [line 78]
!189 = !MDLocation(line: 78, column: 19, scope: !7)
!190 = !MDLocation(line: 123, column: 17, scope: !181)
!191 = !MDLocation(line: 123, column: 13, scope: !181)
!192 = !{!"0x100\00mpp\0080\000", !7, !8, !28}    ; [ DW_TAG_auto_variable ] [mpp] [line 80]
!193 = !MDLocation(line: 80, column: 9, scope: !7)
!194 = !MDLocation(line: 124, column: 17, scope: !181)
!195 = !MDLocation(line: 124, column: 13, scope: !181)
!196 = !{!"0x100\00dpp\0085\000", !7, !8, !28}    ; [ DW_TAG_auto_variable ] [dpp] [line 85]
!197 = !MDLocation(line: 85, column: 9, scope: !7)
!198 = !MDLocation(line: 125, column: 17, scope: !181)
!199 = !MDLocation(line: 125, column: 13, scope: !181)
!200 = !{!"0x100\00ip\0080\000", !7, !8, !28}     ; [ DW_TAG_auto_variable ] [ip] [line 80]
!201 = !MDLocation(line: 80, column: 21, scope: !7)
!202 = !MDLocation(line: 126, column: 17, scope: !181)
!203 = !MDLocation(line: 126, column: 13, scope: !181)
!204 = !{!"0x100\00xmb\0083\000", !7, !8, !4}     ; [ DW_TAG_auto_variable ] [xmb] [line 83]
!205 = !MDLocation(line: 83, column: 9, scope: !7)
!206 = !MDLocation(line: 127, column: 28, scope: !181)
!207 = !MDLocation(line: 127, column: 22, scope: !181)
!208 = !MDLocation(line: 127, column: 13, scope: !181)
!209 = !{!"0x100\00ms\0079\000", !7, !8, !28}     ; [ DW_TAG_auto_variable ] [ms] [line 79]
!210 = !MDLocation(line: 79, column: 9, scope: !7)
!211 = !MDLocation(line: 128, column: 28, scope: !181)
!212 = !MDLocation(line: 128, column: 22, scope: !181)
!213 = !MDLocation(line: 128, column: 13, scope: !181)
!214 = !{!"0x100\00is\0079\000", !7, !8, !28}     ; [ DW_TAG_auto_variable ] [is] [line 79]
!215 = !MDLocation(line: 79, column: 14, scope: !7)
!216 = !MDLocation(line: 129, column: 5, scope: !181)
!217 = !MDLocation(line: 130, column: 5, scope: !181)
!218 = !MDLocation(line: 131, column: 5, scope: !181)
!219 = !MDLocation(line: 133, column: 10, scope: !220)
!220 = !{!"0xb\00133\005\005", !1, !181}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/hmmer/fast_algorithms.c]
!221 = !MDLocation(line: 133, column: 17, scope: !222)
!222 = !{!"0xb\00133\005\006", !1, !220}          ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/hmmer/fast_algorithms.c]
!223 = !MDLocation(line: 133, column: 5, scope: !220)
!224 = !MDLocation(line: 134, column: 19, scope: !225)
!225 = !{!"0xb\00133\0030\007", !1, !222}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/hmmer/fast_algorithms.c]
!226 = !MDLocation(line: 134, column: 15, scope: !225)
!227 = !MDLocation(line: 134, column: 33, scope: !225)
!228 = !MDLocation(line: 134, column: 28, scope: !225)
!229 = !MDLocation(line: 134, column: 7, scope: !225)
!230 = !MDLocation(line: 135, column: 20, scope: !231)
!231 = !{!"0xb\00135\0011\008", !1, !225}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/hmmer/fast_algorithms.c]
!232 = !MDLocation(line: 135, column: 17, scope: !231)
!233 = !MDLocation(line: 135, column: 33, scope: !231)
!234 = !MDLocation(line: 135, column: 28, scope: !231)
!235 = !{!"0x100\00sc\0077\000", !7, !8, !4}      ; [ DW_TAG_auto_variable ] [sc] [line 77]
!236 = !MDLocation(line: 77, column: 9, scope: !7)
!237 = !MDLocation(line: 135, column: 41, scope: !231)
!238 = !MDLocation(line: 135, column: 11, scope: !231)
!239 = !MDLocation(line: 135, column: 11, scope: !225)
!240 = !MDLocation(line: 135, column: 49, scope: !231)
!241 = !MDLocation(line: 136, column: 21, scope: !242)
!242 = !{!"0xb\00136\0011\009", !1, !225}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/hmmer/fast_algorithms.c]
!243 = !MDLocation(line: 136, column: 17, scope: !242)
!244 = !MDLocation(line: 136, column: 33, scope: !242)
!245 = !MDLocation(line: 136, column: 28, scope: !242)
!246 = !MDLocation(line: 136, column: 41, scope: !242)
!247 = !MDLocation(line: 136, column: 11, scope: !242)
!248 = !MDLocation(line: 136, column: 11, scope: !225)
!249 = !MDLocation(line: 136, column: 49, scope: !242)
!250 = !MDLocation(line: 137, column: 24, scope: !251)
!251 = !{!"0xb\00137\0011\0010", !1, !225}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/hmmer/fast_algorithms.c]
!252 = !MDLocation(line: 137, column: 17, scope: !251)
!253 = !MDLocation(line: 137, column: 41, scope: !251)
!254 = !MDLocation(line: 137, column: 11, scope: !251)
!255 = !MDLocation(line: 137, column: 11, scope: !225)
!256 = !MDLocation(line: 137, column: 49, scope: !251)
!257 = !MDLocation(line: 138, column: 16, scope: !225)
!258 = !MDLocation(line: 138, column: 7, scope: !225)
!259 = !MDLocation(line: 139, column: 11, scope: !260)
!260 = !{!"0xb\00139\0011\0011", !1, !225}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/hmmer/fast_algorithms.c]
!261 = !MDLocation(line: 139, column: 11, scope: !225)
!262 = !MDLocation(line: 139, column: 27, scope: !260)
!263 = !MDLocation(line: 141, column: 18, scope: !225)
!264 = !MDLocation(line: 141, column: 15, scope: !225)
!265 = !MDLocation(line: 141, column: 30, scope: !225)
!266 = !MDLocation(line: 141, column: 25, scope: !225)
!267 = !MDLocation(line: 141, column: 7, scope: !225)
!268 = !MDLocation(line: 142, column: 20, scope: !269)
!269 = !{!"0xb\00142\0011\0012", !1, !225}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/hmmer/fast_algorithms.c]
!270 = !MDLocation(line: 142, column: 17, scope: !269)
!271 = !MDLocation(line: 142, column: 32, scope: !269)
!272 = !MDLocation(line: 142, column: 27, scope: !269)
!273 = !MDLocation(line: 142, column: 40, scope: !269)
!274 = !MDLocation(line: 142, column: 11, scope: !269)
!275 = !MDLocation(line: 142, column: 11, scope: !225)
!276 = !MDLocation(line: 142, column: 47, scope: !269)
!277 = !MDLocation(line: 143, column: 11, scope: !278)
!278 = !{!"0xb\00143\0011\0013", !1, !225}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/hmmer/fast_algorithms.c]
!279 = !MDLocation(line: 143, column: 11, scope: !225)
!280 = !MDLocation(line: 143, column: 27, scope: !278)
!281 = !MDLocation(line: 145, column: 11, scope: !282)
!282 = !{!"0xb\00145\0011\0014", !1, !225}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/hmmer/fast_algorithms.c]
!283 = !MDLocation(line: 145, column: 11, scope: !225)
!284 = !MDLocation(line: 146, column: 10, scope: !285)
!285 = !{!"0xb\00145\0018\0015", !1, !282}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/hmmer/fast_algorithms.c]
!286 = !MDLocation(line: 146, column: 19, scope: !285)
!287 = !MDLocation(line: 146, column: 2, scope: !285)
!288 = !MDLocation(line: 147, column: 12, scope: !289)
!289 = !{!"0xb\00147\006\0016", !1, !285}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/hmmer/fast_algorithms.c]
!290 = !MDLocation(line: 147, column: 20, scope: !289)
!291 = !MDLocation(line: 147, column: 31, scope: !289)
!292 = !MDLocation(line: 147, column: 6, scope: !289)
!293 = !MDLocation(line: 147, column: 6, scope: !285)
!294 = !MDLocation(line: 147, column: 38, scope: !289)
!295 = !MDLocation(line: 148, column: 11, scope: !285)
!296 = !MDLocation(line: 148, column: 2, scope: !285)
!297 = !MDLocation(line: 149, column: 6, scope: !298)
!298 = !{!"0xb\00149\006\0017", !1, !285}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/hmmer/fast_algorithms.c]
!299 = !MDLocation(line: 149, column: 6, scope: !285)
!300 = !MDLocation(line: 149, column: 22, scope: !298)
!301 = !MDLocation(line: 150, column: 7, scope: !285)
!302 = !MDLocation(line: 151, column: 5, scope: !225)
!303 = !MDLocation(line: 133, column: 25, scope: !222)
!304 = !MDLocation(line: 133, column: 5, scope: !222)
!305 = !MDLocation(line: 157, column: 5, scope: !181)
!306 = !MDLocation(line: 158, column: 19, scope: !307)
!307 = !{!"0xb\00158\009\0018", !1, !181}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/hmmer/fast_algorithms.c]
!308 = !MDLocation(line: 158, column: 15, scope: !307)
!309 = !MDLocation(line: 158, column: 31, scope: !307)
!310 = !MDLocation(line: 158, column: 9, scope: !307)
!311 = !MDLocation(line: 158, column: 9, scope: !181)
!312 = !MDLocation(line: 159, column: 7, scope: !307)
!313 = !{!"0x100\00xme\0084\000", !7, !8, !4}     ; [ DW_TAG_auto_variable ] [xme] [line 84]
!314 = !MDLocation(line: 84, column: 9, scope: !7)
!315 = !MDLocation(line: 163, column: 11, scope: !181)
!316 = !{!"0x100\00mpc\0080\000", !7, !8, !28}    ; [ DW_TAG_auto_variable ] [mpc] [line 80]
!317 = !MDLocation(line: 80, column: 15, scope: !7)
!318 = !MDLocation(line: 164, column: 11, scope: !181)
!319 = !{!"0x100\00ep\0082\000", !7, !8, !28}     ; [ DW_TAG_auto_variable ] [ep] [line 82]
!320 = !MDLocation(line: 82, column: 9, scope: !7)
!321 = !MDLocation(line: 165, column: 10, scope: !322)
!322 = !{!"0xb\00165\005\0019", !1, !181}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/hmmer/fast_algorithms.c]
!323 = !MDLocation(line: 165, column: 22, scope: !324)
!324 = !{!"0xb\00165\005\0020", !1, !322}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/hmmer/fast_algorithms.c]
!325 = !MDLocation(line: 165, column: 17, scope: !324)
!326 = !MDLocation(line: 165, column: 5, scope: !322)
!327 = !MDLocation(line: 166, column: 18, scope: !328)
!328 = !{!"0xb\00166\0011\0021", !1, !324}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/hmmer/fast_algorithms.c]
!329 = !MDLocation(line: 166, column: 27, scope: !328)
!330 = !MDLocation(line: 166, column: 11, scope: !328)
!331 = !MDLocation(line: 166, column: 11, scope: !324)
!332 = !MDLocation(line: 166, column: 41, scope: !328)
!333 = !MDLocation(line: 166, column: 36, scope: !334)
!334 = !{!"0xb\003", !1, !335}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/hmmer/fast_algorithms.c]
!335 = !{!"0xb\002", !1, !328}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/hmmer/fast_algorithms.c]
!336 = !MDLocation(line: 165, column: 30, scope: !324)
!337 = !MDLocation(line: 165, column: 5, scope: !324)
!338 = !MDLocation(line: 167, column: 5, scope: !181)
!339 = !MDLocation(line: 169, column: 5, scope: !181)
!340 = !MDLocation(line: 170, column: 19, scope: !341)
!341 = !{!"0xb\00170\009\0022", !1, !181}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/hmmer/fast_algorithms.c]
!342 = !MDLocation(line: 170, column: 15, scope: !341)
!343 = !MDLocation(line: 170, column: 31, scope: !341)
!344 = !MDLocation(line: 170, column: 9, scope: !341)
!345 = !MDLocation(line: 170, column: 9, scope: !181)
!346 = !MDLocation(line: 171, column: 7, scope: !341)
!347 = !MDLocation(line: 172, column: 15, scope: !348)
!348 = !{!"0xb\00172\009\0023", !1, !181}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/hmmer/fast_algorithms.c]
!349 = !MDLocation(line: 172, column: 31, scope: !348)
!350 = !MDLocation(line: 172, column: 54, scope: !348)
!351 = !MDLocation(line: 172, column: 9, scope: !348)
!352 = !MDLocation(line: 172, column: 9, scope: !181)
!353 = !MDLocation(line: 173, column: 7, scope: !348)
!354 = !MDLocation(line: 176, column: 5, scope: !181)
!355 = !MDLocation(line: 177, column: 15, scope: !356)
!356 = !{!"0xb\00177\009\0024", !1, !181}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/hmmer/fast_algorithms.c]
!357 = !MDLocation(line: 177, column: 29, scope: !356)
!358 = !MDLocation(line: 177, column: 9, scope: !356)
!359 = !MDLocation(line: 177, column: 9, scope: !181)
!360 = !MDLocation(line: 178, column: 7, scope: !356)
!361 = !MDLocation(line: 179, column: 15, scope: !362)
!362 = !{!"0xb\00179\009\0025", !1, !181}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/hmmer/fast_algorithms.c]
!363 = !MDLocation(line: 179, column: 29, scope: !362)
!364 = !MDLocation(line: 179, column: 52, scope: !362)
!365 = !MDLocation(line: 179, column: 9, scope: !362)
!366 = !MDLocation(line: 179, column: 9, scope: !181)
!367 = !MDLocation(line: 180, column: 7, scope: !362)
!368 = !MDLocation(line: 183, column: 5, scope: !181)
!369 = !MDLocation(line: 184, column: 19, scope: !370)
!370 = !{!"0xb\00184\009\0026", !1, !181}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/hmmer/fast_algorithms.c]
!371 = !MDLocation(line: 184, column: 15, scope: !370)
!372 = !MDLocation(line: 184, column: 31, scope: !370)
!373 = !MDLocation(line: 184, column: 9, scope: !370)
!374 = !MDLocation(line: 184, column: 9, scope: !181)
!375 = !MDLocation(line: 185, column: 7, scope: !370)
!376 = !MDLocation(line: 186, column: 15, scope: !377)
!377 = !{!"0xb\00186\009\0027", !1, !181}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/hmmer/fast_algorithms.c]
!378 = !MDLocation(line: 186, column: 29, scope: !377)
!379 = !MDLocation(line: 186, column: 52, scope: !377)
!380 = !MDLocation(line: 186, column: 9, scope: !377)
!381 = !MDLocation(line: 186, column: 9, scope: !181)
!382 = !MDLocation(line: 187, column: 7, scope: !377)
!383 = !MDLocation(line: 188, column: 3, scope: !181)
!384 = !MDLocation(line: 119, column: 23, scope: !178)
!385 = !MDLocation(line: 119, column: 3, scope: !178)
!386 = !MDLocation(line: 190, column: 8, scope: !7)
!387 = !MDLocation(line: 190, column: 22, scope: !7)
!388 = !MDLocation(line: 192, column: 7, scope: !389)
!389 = !{!"0xb\00192\007\0028", !1, !7}           ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/hmmer/fast_algorithms.c]
!390 = !MDLocation(line: 192, column: 7, scope: !7)
!391 = !MDLocation(line: 193, column: 5, scope: !392)
!392 = !{!"0xb\00192\0023\0029", !1, !389}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/SPEC/C/hmmer/fast_algorithms.c]
!393 = !MDLocation(line: 194, column: 15, scope: !392)
!394 = !MDLocation(line: 194, column: 5, scope: !392)
!395 = !MDLocation(line: 195, column: 3, scope: !392)
!396 = !MDLocation(line: 197, column: 10, scope: !7)
!397 = !MDLocation(line: 197, column: 3, scope: !7)
