; ModuleID = 'triangle.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.object_methods = type { void (i8*, i8*)*, void (i8*, i8*, i8*, i8*)*, i32 (i8*, %struct.vector*, %struct.vector*)*, void (i8*)* }
%struct.vector = type { double, double, double }
%struct.object = type { i32, i8*, %struct.object_methods*, %struct.clip_group*, %struct.texture* }
%struct.clip_group = type { i32, double* }
%struct.texture = type { { <2 x float>, float } (i8*, i8*, i8*)*, %struct.texture_methods*, i32, float, float, float, float, i32, float, float, float, float }
%struct.texture_methods = type { void (i8*)* }
%struct.tri = type { i32, i8*, %struct.object_methods*, %struct.clip_group*, %struct.texture*, %struct.vector, %struct.vector, %struct.vector }
%struct.stri = type { i32, i8*, %struct.object_methods*, %struct.clip_group*, %struct.texture*, %struct.vector, %struct.vector, %struct.vector, %struct.vector, %struct.vector, %struct.vector }
%struct.color = type { float, float, float }
%struct.vcstri_texture = type { { <2 x float>, float } (i8*, i8*, i8*)*, %struct.texture_methods*, i32, float, float, float, float, i32, float, float, float, float, i8*, %struct.color, %struct.color, %struct.color }
%struct.vcstri = type { i32, i8*, %struct.object_methods*, %struct.clip_group*, %struct.texture*, %struct.vector, %struct.vector, %struct.vector, %struct.vector, %struct.vector, %struct.vector, %struct.color, %struct.color, %struct.color }
%struct.ray_t = type { %struct.vector, %struct.vector, double, double, void (double, %struct.object*, %struct.ray_t*)*, %struct.intersectstruct, i32, i32, i64, i64*, %struct.scenedef*, i32, %struct.rng_urand_handle }
%struct.intersectstruct = type { i32, %struct.intersection, double }
%struct.intersection = type { %struct.object*, double }
%struct.scenedef = type { [256 x i8], i32, i8*, i32, i32, float, i32, i32, %struct.cropinfo, i32, i32, i32, %struct.nodeinfo*, i32, i32, double, i32, i32, i32, i32, i32, %struct.list*, %struct.list*, i32, %struct.camdef, { <2 x float>, float } (i8*)*, double (%struct.ray_t*, %struct.shadedata*, double)*, i32, %struct.background_texture, { <2 x float>, float } (%struct.ray_t*)*, %struct.fogdata_t, %struct.displist, %struct.list*, double, i32, %struct.amboccdata_t, i32, i8*, i8*, i8*, %struct.clip_group*, i32 }
%struct.cropinfo = type { i32, i32, i32, i32, i32 }
%struct.nodeinfo = type { i32, double, double, [512 x i8] }
%struct.camdef = type { i32, %struct.vector, %struct.vector, %struct.vector, %struct.vector, double, double, double, double, double, double, double, double, double, double, double, %struct.vector, { <2 x float>, float } (i8*, double, double)*, %struct.vector, %struct.vector, %struct.vector }
%struct.shadedata = type { %struct.vector, %struct.vector, %struct.vector, double }
%struct.background_texture = type { %struct.color, %struct.vector, double, double, %struct.color, %struct.color }
%struct.fogdata_t = type { { <2 x float>, float } (%struct.fogdata_t*, <2 x float>, float, double)*, i32, %struct.color, double, double, double }
%struct.displist = type { %struct.object*, %struct.object*, i32 }
%struct.list = type { i8*, %struct.list* }
%struct.amboccdata_t = type { i32, %struct.color }
%struct.rng_urand_handle = type { i32, i32, i32, i32, i32, i32, i32 }

@tri_methods = internal global %struct.object_methods { void (i8*, i8*)* bitcast (void (%struct.tri*, %struct.ray_t*)* @tri_intersect to void (i8*, i8*)*), void (i8*, i8*, i8*, i8*)* bitcast (void (%struct.tri*, %struct.vector*, %struct.ray_t*, %struct.vector*)* @tri_normal to void (i8*, i8*, i8*, i8*)*), i32 (i8*, %struct.vector*, %struct.vector*)* @tri_bbox, void (i8*)* @free }, align 8
@stri_methods = internal global %struct.object_methods { void (i8*, i8*)* bitcast (void (%struct.tri*, %struct.ray_t*)* @tri_intersect to void (i8*, i8*)*), void (i8*, i8*, i8*, i8*)* bitcast (void (%struct.stri*, %struct.vector*, %struct.ray_t*, %struct.vector*)* @stri_normal to void (i8*, i8*, i8*, i8*)*), i32 (i8*, %struct.vector*, %struct.vector*)* @tri_bbox, void (i8*)* @free }, align 8
@stri_methods_guess = internal global %struct.object_methods { void (i8*, i8*)* bitcast (void (%struct.tri*, %struct.ray_t*)* @tri_intersect to void (i8*, i8*)*), void (i8*, i8*, i8*, i8*)* bitcast (void (%struct.stri*, %struct.vector*, %struct.ray_t*, %struct.vector*)* @stri_normal_guess to void (i8*, i8*, i8*, i8*)*), i32 (i8*, %struct.vector*, %struct.vector*)* @tri_bbox, void (i8*)* @free }, align 8
@stri_methods_reverse = internal global %struct.object_methods { void (i8*, i8*)* bitcast (void (%struct.tri*, %struct.ray_t*)* @tri_intersect to void (i8*, i8*)*), void (i8*, i8*, i8*, i8*)* bitcast (void (%struct.stri*, %struct.vector*, %struct.ray_t*, %struct.vector*)* @stri_normal_reverse to void (i8*, i8*, i8*, i8*)*), i32 (i8*, %struct.vector*, %struct.vector*)* @tri_bbox, void (i8*)* @free }, align 8

; Function Attrs: nounwind uwtable
define %struct.object* @newtri(i8* %tex, %struct.vector* byval align 8 %v0, %struct.vector* byval align 8 %v1, %struct.vector* byval align 8 %v2) #0 {
  %edge1 = alloca %struct.vector, align 8
  %edge2 = alloca %struct.vector, align 8
  %edge3 = alloca %struct.vector, align 8
  call void @VSub(%struct.vector* %v1, %struct.vector* %v0, %struct.vector* %edge1)
  call void @VSub(%struct.vector* %v2, %struct.vector* %v0, %struct.vector* %edge2)
  call void @VSub(%struct.vector* %v2, %struct.vector* %v1, %struct.vector* %edge3)
  %1 = call double @VLength(%struct.vector* %edge1)
  %2 = fcmp oge double %1, 5.000000e-08
  br i1 %2, label %3, label %26

; <label>:3                                       ; preds = %0
  %4 = call double @VLength(%struct.vector* %edge2)
  %5 = fcmp oge double %4, 5.000000e-08
  br i1 %5, label %6, label %26

; <label>:6                                       ; preds = %3
  %7 = call double @VLength(%struct.vector* %edge3)
  %8 = fcmp oge double %7, 5.000000e-08
  br i1 %8, label %9, label %26

; <label>:9                                       ; preds = %6
  %10 = call noalias i8* @malloc(i64 112) #3
  %11 = bitcast i8* %10 to %struct.tri*
  %12 = getelementptr inbounds %struct.tri* %11, i32 0, i32 1
  store i8* null, i8** %12, align 8
  %13 = getelementptr inbounds %struct.tri* %11, i32 0, i32 2
  store %struct.object_methods* @tri_methods, %struct.object_methods** %13, align 8
  %14 = bitcast i8* %tex to %struct.texture*
  %15 = getelementptr inbounds %struct.tri* %11, i32 0, i32 4
  store %struct.texture* %14, %struct.texture** %15, align 8
  %16 = getelementptr inbounds %struct.tri* %11, i32 0, i32 7
  %17 = bitcast %struct.vector* %16 to i8*
  %18 = bitcast %struct.vector* %v0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %17, i8* %18, i64 24, i32 8, i1 false)
  %19 = getelementptr inbounds %struct.tri* %11, i32 0, i32 6
  %20 = bitcast %struct.vector* %19 to i8*
  %21 = bitcast %struct.vector* %edge1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %20, i8* %21, i64 24, i32 8, i1 false)
  %22 = getelementptr inbounds %struct.tri* %11, i32 0, i32 5
  %23 = bitcast %struct.vector* %22 to i8*
  %24 = bitcast %struct.vector* %edge2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %23, i8* %24, i64 24, i32 8, i1 false)
  %25 = bitcast %struct.tri* %11 to %struct.object*
  br label %27

; <label>:26                                      ; preds = %6, %3, %0
  br label %27

; <label>:27                                      ; preds = %26, %9
  %.0 = phi %struct.object* [ %25, %9 ], [ null, %26 ]
  ret %struct.object* %.0
}

declare void @VSub(%struct.vector*, %struct.vector*, %struct.vector*) #1

declare double @VLength(%struct.vector*) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #3

; Function Attrs: nounwind uwtable
define %struct.object* @newstri(i8* %tex, %struct.vector* byval align 8 %v0, %struct.vector* byval align 8 %v1, %struct.vector* byval align 8 %v2, %struct.vector* byval align 8 %n0, %struct.vector* byval align 8 %n1, %struct.vector* byval align 8 %n2) #0 {
  %edge1 = alloca %struct.vector, align 8
  %edge2 = alloca %struct.vector, align 8
  %edge3 = alloca %struct.vector, align 8
  call void @VSub(%struct.vector* %v1, %struct.vector* %v0, %struct.vector* %edge1)
  call void @VSub(%struct.vector* %v2, %struct.vector* %v0, %struct.vector* %edge2)
  call void @VSub(%struct.vector* %v2, %struct.vector* %v1, %struct.vector* %edge3)
  %1 = call double @VLength(%struct.vector* %edge1)
  %2 = fcmp oge double %1, 5.000000e-08
  br i1 %2, label %3, label %35

; <label>:3                                       ; preds = %0
  %4 = call double @VLength(%struct.vector* %edge2)
  %5 = fcmp oge double %4, 5.000000e-08
  br i1 %5, label %6, label %35

; <label>:6                                       ; preds = %3
  %7 = call double @VLength(%struct.vector* %edge3)
  %8 = fcmp oge double %7, 5.000000e-08
  br i1 %8, label %9, label %35

; <label>:9                                       ; preds = %6
  %10 = call noalias i8* @malloc(i64 184) #3
  %11 = bitcast i8* %10 to %struct.stri*
  %12 = getelementptr inbounds %struct.stri* %11, i32 0, i32 1
  store i8* null, i8** %12, align 8
  %13 = getelementptr inbounds %struct.stri* %11, i32 0, i32 2
  store %struct.object_methods* @stri_methods, %struct.object_methods** %13, align 8
  %14 = bitcast i8* %tex to %struct.texture*
  %15 = getelementptr inbounds %struct.stri* %11, i32 0, i32 4
  store %struct.texture* %14, %struct.texture** %15, align 8
  %16 = getelementptr inbounds %struct.stri* %11, i32 0, i32 7
  %17 = bitcast %struct.vector* %16 to i8*
  %18 = bitcast %struct.vector* %v0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %17, i8* %18, i64 24, i32 8, i1 false)
  %19 = getelementptr inbounds %struct.stri* %11, i32 0, i32 6
  %20 = bitcast %struct.vector* %19 to i8*
  %21 = bitcast %struct.vector* %edge1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %20, i8* %21, i64 24, i32 8, i1 false)
  %22 = getelementptr inbounds %struct.stri* %11, i32 0, i32 5
  %23 = bitcast %struct.vector* %22 to i8*
  %24 = bitcast %struct.vector* %edge2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %23, i8* %24, i64 24, i32 8, i1 false)
  %25 = getelementptr inbounds %struct.stri* %11, i32 0, i32 8
  %26 = bitcast %struct.vector* %25 to i8*
  %27 = bitcast %struct.vector* %n0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %26, i8* %27, i64 24, i32 8, i1 false)
  %28 = getelementptr inbounds %struct.stri* %11, i32 0, i32 9
  %29 = bitcast %struct.vector* %28 to i8*
  %30 = bitcast %struct.vector* %n1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %29, i8* %30, i64 24, i32 8, i1 false)
  %31 = getelementptr inbounds %struct.stri* %11, i32 0, i32 10
  %32 = bitcast %struct.vector* %31 to i8*
  %33 = bitcast %struct.vector* %n2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %32, i8* %33, i64 24, i32 8, i1 false)
  %34 = bitcast %struct.stri* %11 to %struct.object*
  br label %36

; <label>:35                                      ; preds = %6, %3, %0
  br label %36

; <label>:36                                      ; preds = %35, %9
  %.0 = phi %struct.object* [ %34, %9 ], [ null, %35 ]
  ret %struct.object* %.0
}

; Function Attrs: nounwind uwtable
define void @stri_normal_fixup(%struct.object* %otri, i32 %mode) #0 {
  %1 = bitcast %struct.object* %otri to %struct.stri*
  switch i32 %mode, label %7 [
    i32 2, label %2
    i32 1, label %4
    i32 0, label %6
  ]

; <label>:2                                       ; preds = %0
  %3 = getelementptr inbounds %struct.stri* %1, i32 0, i32 2
  store %struct.object_methods* @stri_methods_guess, %struct.object_methods** %3, align 8
  br label %9

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds %struct.stri* %1, i32 0, i32 2
  store %struct.object_methods* @stri_methods_reverse, %struct.object_methods** %5, align 8
  br label %9

; <label>:6                                       ; preds = %0
  br label %7

; <label>:7                                       ; preds = %6, %0
  %8 = getelementptr inbounds %struct.stri* %1, i32 0, i32 2
  store %struct.object_methods* @stri_methods, %struct.object_methods** %8, align 8
  br label %9

; <label>:9                                       ; preds = %7, %4, %2
  ret void
}

; Function Attrs: nounwind uwtable
define %struct.object* @newvcstri(i8* %voidtex, %struct.vector* byval align 8 %v0, %struct.vector* byval align 8 %v1, %struct.vector* byval align 8 %v2, %struct.vector* byval align 8 %n0, %struct.vector* byval align 8 %n1, %struct.vector* byval align 8 %n2, <2 x float> %c0.coerce0, float %c0.coerce1, <2 x float> %c1.coerce0, float %c1.coerce1, <2 x float> %c2.coerce0, float %c2.coerce1) #0 {
  %c0 = alloca %struct.color, align 8
  %1 = alloca { <2 x float>, float }, align 8
  %c1 = alloca %struct.color, align 8
  %2 = alloca { <2 x float>, float }, align 8
  %c2 = alloca %struct.color, align 8
  %3 = alloca { <2 x float>, float }, align 8
  %edge1 = alloca %struct.vector, align 8
  %edge2 = alloca %struct.vector, align 8
  %edge3 = alloca %struct.vector, align 8
  %4 = getelementptr { <2 x float>, float }* %1, i32 0, i32 0
  store <2 x float> %c0.coerce0, <2 x float>* %4
  %5 = getelementptr { <2 x float>, float }* %1, i32 0, i32 1
  store float %c0.coerce1, float* %5
  %6 = bitcast %struct.color* %c0 to i8*
  %7 = bitcast { <2 x float>, float }* %1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %6, i8* %7, i64 12, i32 8, i1 false)
  %8 = getelementptr { <2 x float>, float }* %2, i32 0, i32 0
  store <2 x float> %c1.coerce0, <2 x float>* %8
  %9 = getelementptr { <2 x float>, float }* %2, i32 0, i32 1
  store float %c1.coerce1, float* %9
  %10 = bitcast %struct.color* %c1 to i8*
  %11 = bitcast { <2 x float>, float }* %2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %10, i8* %11, i64 12, i32 8, i1 false)
  %12 = getelementptr { <2 x float>, float }* %3, i32 0, i32 0
  store <2 x float> %c2.coerce0, <2 x float>* %12
  %13 = getelementptr { <2 x float>, float }* %3, i32 0, i32 1
  store float %c2.coerce1, float* %13
  %14 = bitcast %struct.color* %c2 to i8*
  %15 = bitcast { <2 x float>, float }* %3 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %14, i8* %15, i64 12, i32 8, i1 false)
  %16 = bitcast i8* %voidtex to %struct.vcstri_texture*
  call void @VSub(%struct.vector* %v1, %struct.vector* %v0, %struct.vector* %edge1)
  call void @VSub(%struct.vector* %v2, %struct.vector* %v0, %struct.vector* %edge2)
  call void @VSub(%struct.vector* %v2, %struct.vector* %v1, %struct.vector* %edge3)
  %17 = call double @VLength(%struct.vector* %edge1)
  %18 = fcmp oge double %17, 5.000000e-08
  br i1 %18, label %19, label %63

; <label>:19                                      ; preds = %0
  %20 = call double @VLength(%struct.vector* %edge2)
  %21 = fcmp oge double %20, 5.000000e-08
  br i1 %21, label %22, label %63

; <label>:22                                      ; preds = %19
  %23 = call double @VLength(%struct.vector* %edge3)
  %24 = fcmp oge double %23, 5.000000e-08
  br i1 %24, label %25, label %63

; <label>:25                                      ; preds = %22
  %26 = call noalias i8* @malloc(i64 224) #3
  %27 = bitcast i8* %26 to %struct.vcstri*
  %28 = getelementptr inbounds %struct.vcstri* %27, i32 0, i32 1
  store i8* null, i8** %28, align 8
  %29 = getelementptr inbounds %struct.vcstri* %27, i32 0, i32 2
  store %struct.object_methods* @stri_methods, %struct.object_methods** %29, align 8
  %30 = getelementptr inbounds %struct.vcstri* %27, i32 0, i32 7
  %31 = bitcast %struct.vector* %30 to i8*
  %32 = bitcast %struct.vector* %v0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %31, i8* %32, i64 24, i32 8, i1 false)
  %33 = getelementptr inbounds %struct.vcstri* %27, i32 0, i32 6
  %34 = bitcast %struct.vector* %33 to i8*
  %35 = bitcast %struct.vector* %edge1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %34, i8* %35, i64 24, i32 8, i1 false)
  %36 = getelementptr inbounds %struct.vcstri* %27, i32 0, i32 5
  %37 = bitcast %struct.vector* %36 to i8*
  %38 = bitcast %struct.vector* %edge2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %37, i8* %38, i64 24, i32 8, i1 false)
  %39 = getelementptr inbounds %struct.vcstri* %27, i32 0, i32 8
  %40 = bitcast %struct.vector* %39 to i8*
  %41 = bitcast %struct.vector* %n0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %40, i8* %41, i64 24, i32 8, i1 false)
  %42 = getelementptr inbounds %struct.vcstri* %27, i32 0, i32 9
  %43 = bitcast %struct.vector* %42 to i8*
  %44 = bitcast %struct.vector* %n1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %43, i8* %44, i64 24, i32 8, i1 false)
  %45 = getelementptr inbounds %struct.vcstri* %27, i32 0, i32 10
  %46 = bitcast %struct.vector* %45 to i8*
  %47 = bitcast %struct.vector* %n2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %46, i8* %47, i64 24, i32 8, i1 false)
  %48 = getelementptr inbounds %struct.vcstri_texture* %16, i32 0, i32 13
  %49 = bitcast %struct.color* %48 to i8*
  %50 = bitcast %struct.color* %c0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %49, i8* %50, i64 12, i32 4, i1 false)
  %51 = getelementptr inbounds %struct.vcstri_texture* %16, i32 0, i32 14
  %52 = bitcast %struct.color* %51 to i8*
  %53 = bitcast %struct.color* %c1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %52, i8* %53, i64 12, i32 4, i1 false)
  %54 = getelementptr inbounds %struct.vcstri_texture* %16, i32 0, i32 15
  %55 = bitcast %struct.color* %54 to i8*
  %56 = bitcast %struct.color* %c2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %55, i8* %56, i64 12, i32 4, i1 false)
  %57 = bitcast %struct.vcstri* %27 to i8*
  %58 = getelementptr inbounds %struct.vcstri_texture* %16, i32 0, i32 12
  store i8* %57, i8** %58, align 8
  %59 = getelementptr inbounds %struct.vcstri_texture* %16, i32 0, i32 0
  store { <2 x float>, float } (i8*, i8*, i8*)* bitcast ({ <2 x float>, float } (%struct.vector*, %struct.texture*, %struct.ray_t*)* @vcstri_color to { <2 x float>, float } (i8*, i8*, i8*)*), { <2 x float>, float } (i8*, i8*, i8*)** %59, align 8
  %60 = bitcast %struct.vcstri_texture* %16 to %struct.texture*
  %61 = getelementptr inbounds %struct.vcstri* %27, i32 0, i32 4
  store %struct.texture* %60, %struct.texture** %61, align 8
  %62 = bitcast %struct.vcstri* %27 to %struct.object*
  br label %64

; <label>:63                                      ; preds = %22, %19, %0
  br label %64

; <label>:64                                      ; preds = %63, %25
  %.0 = phi %struct.object* [ %62, %25 ], [ null, %63 ]
  ret %struct.object* %.0
}

; Function Attrs: nounwind uwtable
define { <2 x float>, float } @vcstri_color(%struct.vector* %hit, %struct.texture* %tx, %struct.ray_t* %incident) #0 {
  %1 = alloca %struct.color, align 4
  %P = alloca %struct.vector, align 8
  %tmp = alloca %struct.vector, align 8
  %norm = alloca %struct.vector, align 8
  %col = alloca %struct.color, align 4
  %2 = alloca { <2 x float>, float }
  %3 = bitcast %struct.texture* %tx to %struct.vcstri_texture*
  %4 = getelementptr inbounds %struct.vcstri_texture* %3, i32 0, i32 12
  %5 = load i8** %4, align 8
  %6 = bitcast i8* %5 to %struct.vcstri*
  %7 = getelementptr inbounds %struct.vcstri* %6, i32 0, i32 6
  %8 = getelementptr inbounds %struct.vector* %7, i32 0, i32 1
  %9 = load double* %8, align 8
  %10 = getelementptr inbounds %struct.vcstri* %6, i32 0, i32 5
  %11 = getelementptr inbounds %struct.vector* %10, i32 0, i32 2
  %12 = load double* %11, align 8
  %13 = fmul double %9, %12
  %14 = getelementptr inbounds %struct.vcstri* %6, i32 0, i32 6
  %15 = getelementptr inbounds %struct.vector* %14, i32 0, i32 2
  %16 = load double* %15, align 8
  %17 = getelementptr inbounds %struct.vcstri* %6, i32 0, i32 5
  %18 = getelementptr inbounds %struct.vector* %17, i32 0, i32 1
  %19 = load double* %18, align 8
  %20 = fmul double %16, %19
  %21 = fsub double %13, %20
  %22 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 0
  store double %21, double* %22, align 8
  %23 = getelementptr inbounds %struct.vcstri* %6, i32 0, i32 6
  %24 = getelementptr inbounds %struct.vector* %23, i32 0, i32 2
  %25 = load double* %24, align 8
  %26 = getelementptr inbounds %struct.vcstri* %6, i32 0, i32 5
  %27 = getelementptr inbounds %struct.vector* %26, i32 0, i32 0
  %28 = load double* %27, align 8
  %29 = fmul double %25, %28
  %30 = getelementptr inbounds %struct.vcstri* %6, i32 0, i32 6
  %31 = getelementptr inbounds %struct.vector* %30, i32 0, i32 0
  %32 = load double* %31, align 8
  %33 = getelementptr inbounds %struct.vcstri* %6, i32 0, i32 5
  %34 = getelementptr inbounds %struct.vector* %33, i32 0, i32 2
  %35 = load double* %34, align 8
  %36 = fmul double %32, %35
  %37 = fsub double %29, %36
  %38 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 1
  store double %37, double* %38, align 8
  %39 = getelementptr inbounds %struct.vcstri* %6, i32 0, i32 6
  %40 = getelementptr inbounds %struct.vector* %39, i32 0, i32 0
  %41 = load double* %40, align 8
  %42 = getelementptr inbounds %struct.vcstri* %6, i32 0, i32 5
  %43 = getelementptr inbounds %struct.vector* %42, i32 0, i32 1
  %44 = load double* %43, align 8
  %45 = fmul double %41, %44
  %46 = getelementptr inbounds %struct.vcstri* %6, i32 0, i32 6
  %47 = getelementptr inbounds %struct.vector* %46, i32 0, i32 1
  %48 = load double* %47, align 8
  %49 = getelementptr inbounds %struct.vcstri* %6, i32 0, i32 5
  %50 = getelementptr inbounds %struct.vector* %49, i32 0, i32 0
  %51 = load double* %50, align 8
  %52 = fmul double %48, %51
  %53 = fsub double %45, %52
  %54 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 2
  store double %53, double* %54, align 8
  %55 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 0
  %56 = load double* %55, align 8
  %57 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 0
  %58 = load double* %57, align 8
  %59 = fmul double %56, %58
  %60 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 1
  %61 = load double* %60, align 8
  %62 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 1
  %63 = load double* %62, align 8
  %64 = fmul double %61, %63
  %65 = fadd double %59, %64
  %66 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 2
  %67 = load double* %66, align 8
  %68 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 2
  %69 = load double* %68, align 8
  %70 = fmul double %67, %69
  %71 = fadd double %65, %70
  %72 = getelementptr inbounds %struct.vector* %hit, i32 0, i32 0
  %73 = load double* %72, align 8
  %74 = getelementptr inbounds %struct.vcstri* %6, i32 0, i32 7
  %75 = getelementptr inbounds %struct.vector* %74, i32 0, i32 0
  %76 = load double* %75, align 8
  %77 = fsub double %73, %76
  %78 = getelementptr inbounds %struct.vector* %P, i32 0, i32 0
  store double %77, double* %78, align 8
  %79 = getelementptr inbounds %struct.vector* %hit, i32 0, i32 1
  %80 = load double* %79, align 8
  %81 = getelementptr inbounds %struct.vcstri* %6, i32 0, i32 7
  %82 = getelementptr inbounds %struct.vector* %81, i32 0, i32 1
  %83 = load double* %82, align 8
  %84 = fsub double %80, %83
  %85 = getelementptr inbounds %struct.vector* %P, i32 0, i32 1
  store double %84, double* %85, align 8
  %86 = getelementptr inbounds %struct.vector* %hit, i32 0, i32 2
  %87 = load double* %86, align 8
  %88 = getelementptr inbounds %struct.vcstri* %6, i32 0, i32 7
  %89 = getelementptr inbounds %struct.vector* %88, i32 0, i32 2
  %90 = load double* %89, align 8
  %91 = fsub double %87, %90
  %92 = getelementptr inbounds %struct.vector* %P, i32 0, i32 2
  store double %91, double* %92, align 8
  %93 = getelementptr inbounds %struct.vector* %P, i32 0, i32 1
  %94 = load double* %93, align 8
  %95 = getelementptr inbounds %struct.vcstri* %6, i32 0, i32 5
  %96 = getelementptr inbounds %struct.vector* %95, i32 0, i32 2
  %97 = load double* %96, align 8
  %98 = fmul double %94, %97
  %99 = getelementptr inbounds %struct.vector* %P, i32 0, i32 2
  %100 = load double* %99, align 8
  %101 = getelementptr inbounds %struct.vcstri* %6, i32 0, i32 5
  %102 = getelementptr inbounds %struct.vector* %101, i32 0, i32 1
  %103 = load double* %102, align 8
  %104 = fmul double %100, %103
  %105 = fsub double %98, %104
  %106 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 0
  store double %105, double* %106, align 8
  %107 = getelementptr inbounds %struct.vector* %P, i32 0, i32 2
  %108 = load double* %107, align 8
  %109 = getelementptr inbounds %struct.vcstri* %6, i32 0, i32 5
  %110 = getelementptr inbounds %struct.vector* %109, i32 0, i32 0
  %111 = load double* %110, align 8
  %112 = fmul double %108, %111
  %113 = getelementptr inbounds %struct.vector* %P, i32 0, i32 0
  %114 = load double* %113, align 8
  %115 = getelementptr inbounds %struct.vcstri* %6, i32 0, i32 5
  %116 = getelementptr inbounds %struct.vector* %115, i32 0, i32 2
  %117 = load double* %116, align 8
  %118 = fmul double %114, %117
  %119 = fsub double %112, %118
  %120 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 1
  store double %119, double* %120, align 8
  %121 = getelementptr inbounds %struct.vector* %P, i32 0, i32 0
  %122 = load double* %121, align 8
  %123 = getelementptr inbounds %struct.vcstri* %6, i32 0, i32 5
  %124 = getelementptr inbounds %struct.vector* %123, i32 0, i32 1
  %125 = load double* %124, align 8
  %126 = fmul double %122, %125
  %127 = getelementptr inbounds %struct.vector* %P, i32 0, i32 1
  %128 = load double* %127, align 8
  %129 = getelementptr inbounds %struct.vcstri* %6, i32 0, i32 5
  %130 = getelementptr inbounds %struct.vector* %129, i32 0, i32 0
  %131 = load double* %130, align 8
  %132 = fmul double %128, %131
  %133 = fsub double %126, %132
  %134 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 2
  store double %133, double* %134, align 8
  %135 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 0
  %136 = load double* %135, align 8
  %137 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 0
  %138 = load double* %137, align 8
  %139 = fmul double %136, %138
  %140 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 1
  %141 = load double* %140, align 8
  %142 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 1
  %143 = load double* %142, align 8
  %144 = fmul double %141, %143
  %145 = fadd double %139, %144
  %146 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 2
  %147 = load double* %146, align 8
  %148 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 2
  %149 = load double* %148, align 8
  %150 = fmul double %147, %149
  %151 = fadd double %145, %150
  %152 = fdiv double %151, %71
  %153 = getelementptr inbounds %struct.vcstri* %6, i32 0, i32 6
  %154 = getelementptr inbounds %struct.vector* %153, i32 0, i32 1
  %155 = load double* %154, align 8
  %156 = getelementptr inbounds %struct.vector* %P, i32 0, i32 2
  %157 = load double* %156, align 8
  %158 = fmul double %155, %157
  %159 = getelementptr inbounds %struct.vcstri* %6, i32 0, i32 6
  %160 = getelementptr inbounds %struct.vector* %159, i32 0, i32 2
  %161 = load double* %160, align 8
  %162 = getelementptr inbounds %struct.vector* %P, i32 0, i32 1
  %163 = load double* %162, align 8
  %164 = fmul double %161, %163
  %165 = fsub double %158, %164
  %166 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 0
  store double %165, double* %166, align 8
  %167 = getelementptr inbounds %struct.vcstri* %6, i32 0, i32 6
  %168 = getelementptr inbounds %struct.vector* %167, i32 0, i32 2
  %169 = load double* %168, align 8
  %170 = getelementptr inbounds %struct.vector* %P, i32 0, i32 0
  %171 = load double* %170, align 8
  %172 = fmul double %169, %171
  %173 = getelementptr inbounds %struct.vcstri* %6, i32 0, i32 6
  %174 = getelementptr inbounds %struct.vector* %173, i32 0, i32 0
  %175 = load double* %174, align 8
  %176 = getelementptr inbounds %struct.vector* %P, i32 0, i32 2
  %177 = load double* %176, align 8
  %178 = fmul double %175, %177
  %179 = fsub double %172, %178
  %180 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 1
  store double %179, double* %180, align 8
  %181 = getelementptr inbounds %struct.vcstri* %6, i32 0, i32 6
  %182 = getelementptr inbounds %struct.vector* %181, i32 0, i32 0
  %183 = load double* %182, align 8
  %184 = getelementptr inbounds %struct.vector* %P, i32 0, i32 1
  %185 = load double* %184, align 8
  %186 = fmul double %183, %185
  %187 = getelementptr inbounds %struct.vcstri* %6, i32 0, i32 6
  %188 = getelementptr inbounds %struct.vector* %187, i32 0, i32 1
  %189 = load double* %188, align 8
  %190 = getelementptr inbounds %struct.vector* %P, i32 0, i32 0
  %191 = load double* %190, align 8
  %192 = fmul double %189, %191
  %193 = fsub double %186, %192
  %194 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 2
  store double %193, double* %194, align 8
  %195 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 0
  %196 = load double* %195, align 8
  %197 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 0
  %198 = load double* %197, align 8
  %199 = fmul double %196, %198
  %200 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 1
  %201 = load double* %200, align 8
  %202 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 1
  %203 = load double* %202, align 8
  %204 = fmul double %201, %203
  %205 = fadd double %199, %204
  %206 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 2
  %207 = load double* %206, align 8
  %208 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 2
  %209 = load double* %208, align 8
  %210 = fmul double %207, %209
  %211 = fadd double %205, %210
  %212 = fdiv double %211, %71
  %213 = fadd double %152, %212
  %214 = fsub double 1.000000e+00, %213
  %215 = getelementptr inbounds %struct.vcstri_texture* %3, i32 0, i32 13
  %216 = getelementptr inbounds %struct.color* %215, i32 0, i32 0
  %217 = load float* %216, align 4
  %218 = fpext float %217 to double
  %219 = fmul double %214, %218
  %220 = getelementptr inbounds %struct.vcstri_texture* %3, i32 0, i32 14
  %221 = getelementptr inbounds %struct.color* %220, i32 0, i32 0
  %222 = load float* %221, align 4
  %223 = fpext float %222 to double
  %224 = fmul double %152, %223
  %225 = fadd double %219, %224
  %226 = getelementptr inbounds %struct.vcstri_texture* %3, i32 0, i32 15
  %227 = getelementptr inbounds %struct.color* %226, i32 0, i32 0
  %228 = load float* %227, align 4
  %229 = fpext float %228 to double
  %230 = fmul double %212, %229
  %231 = fadd double %225, %230
  %232 = fptrunc double %231 to float
  %233 = getelementptr inbounds %struct.color* %col, i32 0, i32 0
  store float %232, float* %233, align 4
  %234 = getelementptr inbounds %struct.vcstri_texture* %3, i32 0, i32 13
  %235 = getelementptr inbounds %struct.color* %234, i32 0, i32 1
  %236 = load float* %235, align 4
  %237 = fpext float %236 to double
  %238 = fmul double %214, %237
  %239 = getelementptr inbounds %struct.vcstri_texture* %3, i32 0, i32 14
  %240 = getelementptr inbounds %struct.color* %239, i32 0, i32 1
  %241 = load float* %240, align 4
  %242 = fpext float %241 to double
  %243 = fmul double %152, %242
  %244 = fadd double %238, %243
  %245 = getelementptr inbounds %struct.vcstri_texture* %3, i32 0, i32 15
  %246 = getelementptr inbounds %struct.color* %245, i32 0, i32 1
  %247 = load float* %246, align 4
  %248 = fpext float %247 to double
  %249 = fmul double %212, %248
  %250 = fadd double %244, %249
  %251 = fptrunc double %250 to float
  %252 = getelementptr inbounds %struct.color* %col, i32 0, i32 1
  store float %251, float* %252, align 4
  %253 = getelementptr inbounds %struct.vcstri_texture* %3, i32 0, i32 13
  %254 = getelementptr inbounds %struct.color* %253, i32 0, i32 2
  %255 = load float* %254, align 4
  %256 = fpext float %255 to double
  %257 = fmul double %214, %256
  %258 = getelementptr inbounds %struct.vcstri_texture* %3, i32 0, i32 14
  %259 = getelementptr inbounds %struct.color* %258, i32 0, i32 2
  %260 = load float* %259, align 4
  %261 = fpext float %260 to double
  %262 = fmul double %152, %261
  %263 = fadd double %257, %262
  %264 = getelementptr inbounds %struct.vcstri_texture* %3, i32 0, i32 15
  %265 = getelementptr inbounds %struct.color* %264, i32 0, i32 2
  %266 = load float* %265, align 4
  %267 = fpext float %266 to double
  %268 = fmul double %212, %267
  %269 = fadd double %263, %268
  %270 = fptrunc double %269 to float
  %271 = getelementptr inbounds %struct.color* %col, i32 0, i32 2
  store float %270, float* %271, align 4
  %272 = bitcast %struct.color* %1 to i8*
  %273 = bitcast %struct.color* %col to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %272, i8* %273, i64 12, i32 4, i1 false)
  %274 = bitcast { <2 x float>, float }* %2 to i8*
  %275 = bitcast %struct.color* %1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %274, i8* %275, i64 12, i32 1, i1 false)
  %276 = load { <2 x float>, float }* %2
  ret { <2 x float>, float } %276
}

; Function Attrs: nounwind uwtable
define void @vcstri_normal_fixup(%struct.object* %otri, i32 %mode) #0 {
  %1 = bitcast %struct.object* %otri to %struct.vcstri*
  switch i32 %mode, label %7 [
    i32 2, label %2
    i32 1, label %4
    i32 0, label %6
  ]

; <label>:2                                       ; preds = %0
  %3 = getelementptr inbounds %struct.vcstri* %1, i32 0, i32 2
  store %struct.object_methods* @stri_methods_guess, %struct.object_methods** %3, align 8
  br label %9

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds %struct.vcstri* %1, i32 0, i32 2
  store %struct.object_methods* @stri_methods_reverse, %struct.object_methods** %5, align 8
  br label %9

; <label>:6                                       ; preds = %0
  br label %7

; <label>:7                                       ; preds = %6, %0
  %8 = getelementptr inbounds %struct.vcstri* %1, i32 0, i32 2
  store %struct.object_methods* @stri_methods, %struct.object_methods** %8, align 8
  br label %9

; <label>:9                                       ; preds = %7, %4, %2
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @tri_intersect(%struct.tri* %trn, %struct.ray_t* %ry) #0 {
  %tvec = alloca %struct.vector, align 8
  %pvec = alloca %struct.vector, align 8
  %qvec = alloca %struct.vector, align 8
  %1 = getelementptr inbounds %struct.ray_t* %ry, i32 0, i32 1
  %2 = getelementptr inbounds %struct.vector* %1, i32 0, i32 1
  %3 = load double* %2, align 8
  %4 = getelementptr inbounds %struct.tri* %trn, i32 0, i32 5
  %5 = getelementptr inbounds %struct.vector* %4, i32 0, i32 2
  %6 = load double* %5, align 8
  %7 = fmul double %3, %6
  %8 = getelementptr inbounds %struct.ray_t* %ry, i32 0, i32 1
  %9 = getelementptr inbounds %struct.vector* %8, i32 0, i32 2
  %10 = load double* %9, align 8
  %11 = getelementptr inbounds %struct.tri* %trn, i32 0, i32 5
  %12 = getelementptr inbounds %struct.vector* %11, i32 0, i32 1
  %13 = load double* %12, align 8
  %14 = fmul double %10, %13
  %15 = fsub double %7, %14
  %16 = getelementptr inbounds %struct.vector* %pvec, i32 0, i32 0
  store double %15, double* %16, align 8
  %17 = getelementptr inbounds %struct.ray_t* %ry, i32 0, i32 1
  %18 = getelementptr inbounds %struct.vector* %17, i32 0, i32 2
  %19 = load double* %18, align 8
  %20 = getelementptr inbounds %struct.tri* %trn, i32 0, i32 5
  %21 = getelementptr inbounds %struct.vector* %20, i32 0, i32 0
  %22 = load double* %21, align 8
  %23 = fmul double %19, %22
  %24 = getelementptr inbounds %struct.ray_t* %ry, i32 0, i32 1
  %25 = getelementptr inbounds %struct.vector* %24, i32 0, i32 0
  %26 = load double* %25, align 8
  %27 = getelementptr inbounds %struct.tri* %trn, i32 0, i32 5
  %28 = getelementptr inbounds %struct.vector* %27, i32 0, i32 2
  %29 = load double* %28, align 8
  %30 = fmul double %26, %29
  %31 = fsub double %23, %30
  %32 = getelementptr inbounds %struct.vector* %pvec, i32 0, i32 1
  store double %31, double* %32, align 8
  %33 = getelementptr inbounds %struct.ray_t* %ry, i32 0, i32 1
  %34 = getelementptr inbounds %struct.vector* %33, i32 0, i32 0
  %35 = load double* %34, align 8
  %36 = getelementptr inbounds %struct.tri* %trn, i32 0, i32 5
  %37 = getelementptr inbounds %struct.vector* %36, i32 0, i32 1
  %38 = load double* %37, align 8
  %39 = fmul double %35, %38
  %40 = getelementptr inbounds %struct.ray_t* %ry, i32 0, i32 1
  %41 = getelementptr inbounds %struct.vector* %40, i32 0, i32 1
  %42 = load double* %41, align 8
  %43 = getelementptr inbounds %struct.tri* %trn, i32 0, i32 5
  %44 = getelementptr inbounds %struct.vector* %43, i32 0, i32 0
  %45 = load double* %44, align 8
  %46 = fmul double %42, %45
  %47 = fsub double %39, %46
  %48 = getelementptr inbounds %struct.vector* %pvec, i32 0, i32 2
  store double %47, double* %48, align 8
  %49 = getelementptr inbounds %struct.tri* %trn, i32 0, i32 6
  %50 = getelementptr inbounds %struct.vector* %49, i32 0, i32 0
  %51 = load double* %50, align 8
  %52 = getelementptr inbounds %struct.vector* %pvec, i32 0, i32 0
  %53 = load double* %52, align 8
  %54 = fmul double %51, %53
  %55 = getelementptr inbounds %struct.tri* %trn, i32 0, i32 6
  %56 = getelementptr inbounds %struct.vector* %55, i32 0, i32 1
  %57 = load double* %56, align 8
  %58 = getelementptr inbounds %struct.vector* %pvec, i32 0, i32 1
  %59 = load double* %58, align 8
  %60 = fmul double %57, %59
  %61 = fadd double %54, %60
  %62 = getelementptr inbounds %struct.tri* %trn, i32 0, i32 6
  %63 = getelementptr inbounds %struct.vector* %62, i32 0, i32 2
  %64 = load double* %63, align 8
  %65 = getelementptr inbounds %struct.vector* %pvec, i32 0, i32 2
  %66 = load double* %65, align 8
  %67 = fmul double %64, %66
  %68 = fadd double %61, %67
  %69 = fcmp ogt double %68, -5.000000e-08
  br i1 %69, label %70, label %73

; <label>:70                                      ; preds = %0
  %71 = fcmp olt double %68, 5.000000e-08
  br i1 %71, label %72, label %73

; <label>:72                                      ; preds = %70
  br label %215

; <label>:73                                      ; preds = %70, %0
  %74 = fdiv double 1.000000e+00, %68
  %75 = getelementptr inbounds %struct.ray_t* %ry, i32 0, i32 0
  %76 = getelementptr inbounds %struct.vector* %75, i32 0, i32 0
  %77 = load double* %76, align 8
  %78 = getelementptr inbounds %struct.tri* %trn, i32 0, i32 7
  %79 = getelementptr inbounds %struct.vector* %78, i32 0, i32 0
  %80 = load double* %79, align 8
  %81 = fsub double %77, %80
  %82 = getelementptr inbounds %struct.vector* %tvec, i32 0, i32 0
  store double %81, double* %82, align 8
  %83 = getelementptr inbounds %struct.ray_t* %ry, i32 0, i32 0
  %84 = getelementptr inbounds %struct.vector* %83, i32 0, i32 1
  %85 = load double* %84, align 8
  %86 = getelementptr inbounds %struct.tri* %trn, i32 0, i32 7
  %87 = getelementptr inbounds %struct.vector* %86, i32 0, i32 1
  %88 = load double* %87, align 8
  %89 = fsub double %85, %88
  %90 = getelementptr inbounds %struct.vector* %tvec, i32 0, i32 1
  store double %89, double* %90, align 8
  %91 = getelementptr inbounds %struct.ray_t* %ry, i32 0, i32 0
  %92 = getelementptr inbounds %struct.vector* %91, i32 0, i32 2
  %93 = load double* %92, align 8
  %94 = getelementptr inbounds %struct.tri* %trn, i32 0, i32 7
  %95 = getelementptr inbounds %struct.vector* %94, i32 0, i32 2
  %96 = load double* %95, align 8
  %97 = fsub double %93, %96
  %98 = getelementptr inbounds %struct.vector* %tvec, i32 0, i32 2
  store double %97, double* %98, align 8
  %99 = getelementptr inbounds %struct.vector* %tvec, i32 0, i32 0
  %100 = load double* %99, align 8
  %101 = getelementptr inbounds %struct.vector* %pvec, i32 0, i32 0
  %102 = load double* %101, align 8
  %103 = fmul double %100, %102
  %104 = getelementptr inbounds %struct.vector* %tvec, i32 0, i32 1
  %105 = load double* %104, align 8
  %106 = getelementptr inbounds %struct.vector* %pvec, i32 0, i32 1
  %107 = load double* %106, align 8
  %108 = fmul double %105, %107
  %109 = fadd double %103, %108
  %110 = getelementptr inbounds %struct.vector* %tvec, i32 0, i32 2
  %111 = load double* %110, align 8
  %112 = getelementptr inbounds %struct.vector* %pvec, i32 0, i32 2
  %113 = load double* %112, align 8
  %114 = fmul double %111, %113
  %115 = fadd double %109, %114
  %116 = fmul double %115, %74
  %117 = fcmp olt double %116, 0.000000e+00
  br i1 %117, label %120, label %118

; <label>:118                                     ; preds = %73
  %119 = fcmp ogt double %116, 1.000000e+00
  br i1 %119, label %120, label %121

; <label>:120                                     ; preds = %118, %73
  br label %215

; <label>:121                                     ; preds = %118
  %122 = getelementptr inbounds %struct.vector* %tvec, i32 0, i32 1
  %123 = load double* %122, align 8
  %124 = getelementptr inbounds %struct.tri* %trn, i32 0, i32 6
  %125 = getelementptr inbounds %struct.vector* %124, i32 0, i32 2
  %126 = load double* %125, align 8
  %127 = fmul double %123, %126
  %128 = getelementptr inbounds %struct.vector* %tvec, i32 0, i32 2
  %129 = load double* %128, align 8
  %130 = getelementptr inbounds %struct.tri* %trn, i32 0, i32 6
  %131 = getelementptr inbounds %struct.vector* %130, i32 0, i32 1
  %132 = load double* %131, align 8
  %133 = fmul double %129, %132
  %134 = fsub double %127, %133
  %135 = getelementptr inbounds %struct.vector* %qvec, i32 0, i32 0
  store double %134, double* %135, align 8
  %136 = getelementptr inbounds %struct.vector* %tvec, i32 0, i32 2
  %137 = load double* %136, align 8
  %138 = getelementptr inbounds %struct.tri* %trn, i32 0, i32 6
  %139 = getelementptr inbounds %struct.vector* %138, i32 0, i32 0
  %140 = load double* %139, align 8
  %141 = fmul double %137, %140
  %142 = getelementptr inbounds %struct.vector* %tvec, i32 0, i32 0
  %143 = load double* %142, align 8
  %144 = getelementptr inbounds %struct.tri* %trn, i32 0, i32 6
  %145 = getelementptr inbounds %struct.vector* %144, i32 0, i32 2
  %146 = load double* %145, align 8
  %147 = fmul double %143, %146
  %148 = fsub double %141, %147
  %149 = getelementptr inbounds %struct.vector* %qvec, i32 0, i32 1
  store double %148, double* %149, align 8
  %150 = getelementptr inbounds %struct.vector* %tvec, i32 0, i32 0
  %151 = load double* %150, align 8
  %152 = getelementptr inbounds %struct.tri* %trn, i32 0, i32 6
  %153 = getelementptr inbounds %struct.vector* %152, i32 0, i32 1
  %154 = load double* %153, align 8
  %155 = fmul double %151, %154
  %156 = getelementptr inbounds %struct.vector* %tvec, i32 0, i32 1
  %157 = load double* %156, align 8
  %158 = getelementptr inbounds %struct.tri* %trn, i32 0, i32 6
  %159 = getelementptr inbounds %struct.vector* %158, i32 0, i32 0
  %160 = load double* %159, align 8
  %161 = fmul double %157, %160
  %162 = fsub double %155, %161
  %163 = getelementptr inbounds %struct.vector* %qvec, i32 0, i32 2
  store double %162, double* %163, align 8
  %164 = getelementptr inbounds %struct.ray_t* %ry, i32 0, i32 1
  %165 = getelementptr inbounds %struct.vector* %164, i32 0, i32 0
  %166 = load double* %165, align 8
  %167 = getelementptr inbounds %struct.vector* %qvec, i32 0, i32 0
  %168 = load double* %167, align 8
  %169 = fmul double %166, %168
  %170 = getelementptr inbounds %struct.ray_t* %ry, i32 0, i32 1
  %171 = getelementptr inbounds %struct.vector* %170, i32 0, i32 1
  %172 = load double* %171, align 8
  %173 = getelementptr inbounds %struct.vector* %qvec, i32 0, i32 1
  %174 = load double* %173, align 8
  %175 = fmul double %172, %174
  %176 = fadd double %169, %175
  %177 = getelementptr inbounds %struct.ray_t* %ry, i32 0, i32 1
  %178 = getelementptr inbounds %struct.vector* %177, i32 0, i32 2
  %179 = load double* %178, align 8
  %180 = getelementptr inbounds %struct.vector* %qvec, i32 0, i32 2
  %181 = load double* %180, align 8
  %182 = fmul double %179, %181
  %183 = fadd double %176, %182
  %184 = fmul double %183, %74
  %185 = fcmp olt double %184, 0.000000e+00
  br i1 %185, label %189, label %186

; <label>:186                                     ; preds = %121
  %187 = fadd double %116, %184
  %188 = fcmp ogt double %187, 1.000000e+00
  br i1 %188, label %189, label %190

; <label>:189                                     ; preds = %186, %121
  br label %215

; <label>:190                                     ; preds = %186
  %191 = getelementptr inbounds %struct.tri* %trn, i32 0, i32 5
  %192 = getelementptr inbounds %struct.vector* %191, i32 0, i32 0
  %193 = load double* %192, align 8
  %194 = getelementptr inbounds %struct.vector* %qvec, i32 0, i32 0
  %195 = load double* %194, align 8
  %196 = fmul double %193, %195
  %197 = getelementptr inbounds %struct.tri* %trn, i32 0, i32 5
  %198 = getelementptr inbounds %struct.vector* %197, i32 0, i32 1
  %199 = load double* %198, align 8
  %200 = getelementptr inbounds %struct.vector* %qvec, i32 0, i32 1
  %201 = load double* %200, align 8
  %202 = fmul double %199, %201
  %203 = fadd double %196, %202
  %204 = getelementptr inbounds %struct.tri* %trn, i32 0, i32 5
  %205 = getelementptr inbounds %struct.vector* %204, i32 0, i32 2
  %206 = load double* %205, align 8
  %207 = getelementptr inbounds %struct.vector* %qvec, i32 0, i32 2
  %208 = load double* %207, align 8
  %209 = fmul double %206, %208
  %210 = fadd double %203, %209
  %211 = fmul double %210, %74
  %212 = getelementptr inbounds %struct.ray_t* %ry, i32 0, i32 4
  %213 = load void (double, %struct.object*, %struct.ray_t*)** %212, align 8
  %214 = bitcast %struct.tri* %trn to %struct.object*
  call void %213(double %211, %struct.object* %214, %struct.ray_t* %ry)
  br label %215

; <label>:215                                     ; preds = %190, %189, %120, %72
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @stri_normal_reverse(%struct.stri* %trn, %struct.vector* %hit, %struct.ray_t* %incident, %struct.vector* %N) #0 {
  %P = alloca %struct.vector, align 8
  %tmp = alloca %struct.vector, align 8
  %norm = alloca %struct.vector, align 8
  %1 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 6
  %2 = getelementptr inbounds %struct.vector* %1, i32 0, i32 1
  %3 = load double* %2, align 8
  %4 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 5
  %5 = getelementptr inbounds %struct.vector* %4, i32 0, i32 2
  %6 = load double* %5, align 8
  %7 = fmul double %3, %6
  %8 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 6
  %9 = getelementptr inbounds %struct.vector* %8, i32 0, i32 2
  %10 = load double* %9, align 8
  %11 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 5
  %12 = getelementptr inbounds %struct.vector* %11, i32 0, i32 1
  %13 = load double* %12, align 8
  %14 = fmul double %10, %13
  %15 = fsub double %7, %14
  %16 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 0
  store double %15, double* %16, align 8
  %17 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 6
  %18 = getelementptr inbounds %struct.vector* %17, i32 0, i32 2
  %19 = load double* %18, align 8
  %20 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 5
  %21 = getelementptr inbounds %struct.vector* %20, i32 0, i32 0
  %22 = load double* %21, align 8
  %23 = fmul double %19, %22
  %24 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 6
  %25 = getelementptr inbounds %struct.vector* %24, i32 0, i32 0
  %26 = load double* %25, align 8
  %27 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 5
  %28 = getelementptr inbounds %struct.vector* %27, i32 0, i32 2
  %29 = load double* %28, align 8
  %30 = fmul double %26, %29
  %31 = fsub double %23, %30
  %32 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 1
  store double %31, double* %32, align 8
  %33 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 6
  %34 = getelementptr inbounds %struct.vector* %33, i32 0, i32 0
  %35 = load double* %34, align 8
  %36 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 5
  %37 = getelementptr inbounds %struct.vector* %36, i32 0, i32 1
  %38 = load double* %37, align 8
  %39 = fmul double %35, %38
  %40 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 6
  %41 = getelementptr inbounds %struct.vector* %40, i32 0, i32 1
  %42 = load double* %41, align 8
  %43 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 5
  %44 = getelementptr inbounds %struct.vector* %43, i32 0, i32 0
  %45 = load double* %44, align 8
  %46 = fmul double %42, %45
  %47 = fsub double %39, %46
  %48 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 2
  store double %47, double* %48, align 8
  %49 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 0
  %50 = load double* %49, align 8
  %51 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 0
  %52 = load double* %51, align 8
  %53 = fmul double %50, %52
  %54 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 1
  %55 = load double* %54, align 8
  %56 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 1
  %57 = load double* %56, align 8
  %58 = fmul double %55, %57
  %59 = fadd double %53, %58
  %60 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 2
  %61 = load double* %60, align 8
  %62 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 2
  %63 = load double* %62, align 8
  %64 = fmul double %61, %63
  %65 = fadd double %59, %64
  %66 = getelementptr inbounds %struct.vector* %hit, i32 0, i32 0
  %67 = load double* %66, align 8
  %68 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 7
  %69 = getelementptr inbounds %struct.vector* %68, i32 0, i32 0
  %70 = load double* %69, align 8
  %71 = fsub double %67, %70
  %72 = getelementptr inbounds %struct.vector* %P, i32 0, i32 0
  store double %71, double* %72, align 8
  %73 = getelementptr inbounds %struct.vector* %hit, i32 0, i32 1
  %74 = load double* %73, align 8
  %75 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 7
  %76 = getelementptr inbounds %struct.vector* %75, i32 0, i32 1
  %77 = load double* %76, align 8
  %78 = fsub double %74, %77
  %79 = getelementptr inbounds %struct.vector* %P, i32 0, i32 1
  store double %78, double* %79, align 8
  %80 = getelementptr inbounds %struct.vector* %hit, i32 0, i32 2
  %81 = load double* %80, align 8
  %82 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 7
  %83 = getelementptr inbounds %struct.vector* %82, i32 0, i32 2
  %84 = load double* %83, align 8
  %85 = fsub double %81, %84
  %86 = getelementptr inbounds %struct.vector* %P, i32 0, i32 2
  store double %85, double* %86, align 8
  %87 = getelementptr inbounds %struct.vector* %P, i32 0, i32 1
  %88 = load double* %87, align 8
  %89 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 5
  %90 = getelementptr inbounds %struct.vector* %89, i32 0, i32 2
  %91 = load double* %90, align 8
  %92 = fmul double %88, %91
  %93 = getelementptr inbounds %struct.vector* %P, i32 0, i32 2
  %94 = load double* %93, align 8
  %95 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 5
  %96 = getelementptr inbounds %struct.vector* %95, i32 0, i32 1
  %97 = load double* %96, align 8
  %98 = fmul double %94, %97
  %99 = fsub double %92, %98
  %100 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 0
  store double %99, double* %100, align 8
  %101 = getelementptr inbounds %struct.vector* %P, i32 0, i32 2
  %102 = load double* %101, align 8
  %103 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 5
  %104 = getelementptr inbounds %struct.vector* %103, i32 0, i32 0
  %105 = load double* %104, align 8
  %106 = fmul double %102, %105
  %107 = getelementptr inbounds %struct.vector* %P, i32 0, i32 0
  %108 = load double* %107, align 8
  %109 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 5
  %110 = getelementptr inbounds %struct.vector* %109, i32 0, i32 2
  %111 = load double* %110, align 8
  %112 = fmul double %108, %111
  %113 = fsub double %106, %112
  %114 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 1
  store double %113, double* %114, align 8
  %115 = getelementptr inbounds %struct.vector* %P, i32 0, i32 0
  %116 = load double* %115, align 8
  %117 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 5
  %118 = getelementptr inbounds %struct.vector* %117, i32 0, i32 1
  %119 = load double* %118, align 8
  %120 = fmul double %116, %119
  %121 = getelementptr inbounds %struct.vector* %P, i32 0, i32 1
  %122 = load double* %121, align 8
  %123 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 5
  %124 = getelementptr inbounds %struct.vector* %123, i32 0, i32 0
  %125 = load double* %124, align 8
  %126 = fmul double %122, %125
  %127 = fsub double %120, %126
  %128 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 2
  store double %127, double* %128, align 8
  %129 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 0
  %130 = load double* %129, align 8
  %131 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 0
  %132 = load double* %131, align 8
  %133 = fmul double %130, %132
  %134 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 1
  %135 = load double* %134, align 8
  %136 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 1
  %137 = load double* %136, align 8
  %138 = fmul double %135, %137
  %139 = fadd double %133, %138
  %140 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 2
  %141 = load double* %140, align 8
  %142 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 2
  %143 = load double* %142, align 8
  %144 = fmul double %141, %143
  %145 = fadd double %139, %144
  %146 = fdiv double %145, %65
  %147 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 6
  %148 = getelementptr inbounds %struct.vector* %147, i32 0, i32 1
  %149 = load double* %148, align 8
  %150 = getelementptr inbounds %struct.vector* %P, i32 0, i32 2
  %151 = load double* %150, align 8
  %152 = fmul double %149, %151
  %153 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 6
  %154 = getelementptr inbounds %struct.vector* %153, i32 0, i32 2
  %155 = load double* %154, align 8
  %156 = getelementptr inbounds %struct.vector* %P, i32 0, i32 1
  %157 = load double* %156, align 8
  %158 = fmul double %155, %157
  %159 = fsub double %152, %158
  %160 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 0
  store double %159, double* %160, align 8
  %161 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 6
  %162 = getelementptr inbounds %struct.vector* %161, i32 0, i32 2
  %163 = load double* %162, align 8
  %164 = getelementptr inbounds %struct.vector* %P, i32 0, i32 0
  %165 = load double* %164, align 8
  %166 = fmul double %163, %165
  %167 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 6
  %168 = getelementptr inbounds %struct.vector* %167, i32 0, i32 0
  %169 = load double* %168, align 8
  %170 = getelementptr inbounds %struct.vector* %P, i32 0, i32 2
  %171 = load double* %170, align 8
  %172 = fmul double %169, %171
  %173 = fsub double %166, %172
  %174 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 1
  store double %173, double* %174, align 8
  %175 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 6
  %176 = getelementptr inbounds %struct.vector* %175, i32 0, i32 0
  %177 = load double* %176, align 8
  %178 = getelementptr inbounds %struct.vector* %P, i32 0, i32 1
  %179 = load double* %178, align 8
  %180 = fmul double %177, %179
  %181 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 6
  %182 = getelementptr inbounds %struct.vector* %181, i32 0, i32 1
  %183 = load double* %182, align 8
  %184 = getelementptr inbounds %struct.vector* %P, i32 0, i32 0
  %185 = load double* %184, align 8
  %186 = fmul double %183, %185
  %187 = fsub double %180, %186
  %188 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 2
  store double %187, double* %188, align 8
  %189 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 0
  %190 = load double* %189, align 8
  %191 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 0
  %192 = load double* %191, align 8
  %193 = fmul double %190, %192
  %194 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 1
  %195 = load double* %194, align 8
  %196 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 1
  %197 = load double* %196, align 8
  %198 = fmul double %195, %197
  %199 = fadd double %193, %198
  %200 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 2
  %201 = load double* %200, align 8
  %202 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 2
  %203 = load double* %202, align 8
  %204 = fmul double %201, %203
  %205 = fadd double %199, %204
  %206 = fdiv double %205, %65
  %207 = fadd double %146, %206
  %208 = fsub double 1.000000e+00, %207
  %209 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 8
  %210 = getelementptr inbounds %struct.vector* %209, i32 0, i32 0
  %211 = load double* %210, align 8
  %212 = fmul double %208, %211
  %213 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 9
  %214 = getelementptr inbounds %struct.vector* %213, i32 0, i32 0
  %215 = load double* %214, align 8
  %216 = fmul double %146, %215
  %217 = fadd double %212, %216
  %218 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 10
  %219 = getelementptr inbounds %struct.vector* %218, i32 0, i32 0
  %220 = load double* %219, align 8
  %221 = fmul double %206, %220
  %222 = fadd double %217, %221
  %223 = getelementptr inbounds %struct.vector* %N, i32 0, i32 0
  store double %222, double* %223, align 8
  %224 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 8
  %225 = getelementptr inbounds %struct.vector* %224, i32 0, i32 1
  %226 = load double* %225, align 8
  %227 = fmul double %208, %226
  %228 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 9
  %229 = getelementptr inbounds %struct.vector* %228, i32 0, i32 1
  %230 = load double* %229, align 8
  %231 = fmul double %146, %230
  %232 = fadd double %227, %231
  %233 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 10
  %234 = getelementptr inbounds %struct.vector* %233, i32 0, i32 1
  %235 = load double* %234, align 8
  %236 = fmul double %206, %235
  %237 = fadd double %232, %236
  %238 = getelementptr inbounds %struct.vector* %N, i32 0, i32 1
  store double %237, double* %238, align 8
  %239 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 8
  %240 = getelementptr inbounds %struct.vector* %239, i32 0, i32 2
  %241 = load double* %240, align 8
  %242 = fmul double %208, %241
  %243 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 9
  %244 = getelementptr inbounds %struct.vector* %243, i32 0, i32 2
  %245 = load double* %244, align 8
  %246 = fmul double %146, %245
  %247 = fadd double %242, %246
  %248 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 10
  %249 = getelementptr inbounds %struct.vector* %248, i32 0, i32 2
  %250 = load double* %249, align 8
  %251 = fmul double %206, %250
  %252 = fadd double %247, %251
  %253 = getelementptr inbounds %struct.vector* %N, i32 0, i32 2
  store double %252, double* %253, align 8
  %254 = getelementptr inbounds %struct.vector* %N, i32 0, i32 0
  %255 = load double* %254, align 8
  %256 = getelementptr inbounds %struct.vector* %N, i32 0, i32 0
  %257 = load double* %256, align 8
  %258 = fmul double %255, %257
  %259 = getelementptr inbounds %struct.vector* %N, i32 0, i32 1
  %260 = load double* %259, align 8
  %261 = getelementptr inbounds %struct.vector* %N, i32 0, i32 1
  %262 = load double* %261, align 8
  %263 = fmul double %260, %262
  %264 = fadd double %258, %263
  %265 = getelementptr inbounds %struct.vector* %N, i32 0, i32 2
  %266 = load double* %265, align 8
  %267 = getelementptr inbounds %struct.vector* %N, i32 0, i32 2
  %268 = load double* %267, align 8
  %269 = fmul double %266, %268
  %270 = fadd double %264, %269
  %271 = call double @sqrt(double %270) #3
  %272 = fdiv double 1.000000e+00, %271
  %273 = getelementptr inbounds %struct.vector* %N, i32 0, i32 0
  %274 = load double* %273, align 8
  %275 = fmul double %274, %272
  store double %275, double* %273, align 8
  %276 = getelementptr inbounds %struct.vector* %N, i32 0, i32 1
  %277 = load double* %276, align 8
  %278 = fmul double %277, %272
  store double %278, double* %276, align 8
  %279 = getelementptr inbounds %struct.vector* %N, i32 0, i32 2
  %280 = load double* %279, align 8
  %281 = fmul double %280, %272
  store double %281, double* %279, align 8
  %282 = getelementptr inbounds %struct.ray_t* %incident, i32 0, i32 1
  %283 = call double @VDot(%struct.vector* %norm, %struct.vector* %282)
  %284 = fcmp olt double %283, 0.000000e+00
  br i1 %284, label %285, label %298

; <label>:285                                     ; preds = %0
  %286 = getelementptr inbounds %struct.vector* %N, i32 0, i32 0
  %287 = load double* %286, align 8
  %288 = fsub double -0.000000e+00, %287
  %289 = getelementptr inbounds %struct.vector* %N, i32 0, i32 0
  store double %288, double* %289, align 8
  %290 = getelementptr inbounds %struct.vector* %N, i32 0, i32 1
  %291 = load double* %290, align 8
  %292 = fsub double -0.000000e+00, %291
  %293 = getelementptr inbounds %struct.vector* %N, i32 0, i32 1
  store double %292, double* %293, align 8
  %294 = getelementptr inbounds %struct.vector* %N, i32 0, i32 2
  %295 = load double* %294, align 8
  %296 = fsub double -0.000000e+00, %295
  %297 = getelementptr inbounds %struct.vector* %N, i32 0, i32 2
  store double %296, double* %297, align 8
  br label %298

; <label>:298                                     ; preds = %285, %0
  ret void
}

; Function Attrs: nounwind uwtable
define internal i32 @tri_bbox(i8* %obj, %struct.vector* %min, %struct.vector* %max) #0 {
  %v1 = alloca %struct.vector, align 8
  %v2 = alloca %struct.vector, align 8
  %1 = bitcast i8* %obj to %struct.tri*
  %2 = getelementptr inbounds %struct.tri* %1, i32 0, i32 7
  %3 = getelementptr inbounds %struct.tri* %1, i32 0, i32 6
  call void @VAdd(%struct.vector* %2, %struct.vector* %3, %struct.vector* %v1)
  %4 = getelementptr inbounds %struct.tri* %1, i32 0, i32 7
  %5 = getelementptr inbounds %struct.tri* %1, i32 0, i32 5
  call void @VAdd(%struct.vector* %4, %struct.vector* %5, %struct.vector* %v2)
  %6 = getelementptr inbounds %struct.tri* %1, i32 0, i32 7
  %7 = getelementptr inbounds %struct.vector* %6, i32 0, i32 0
  %8 = load double* %7, align 8
  %9 = getelementptr inbounds %struct.vector* %v1, i32 0, i32 0
  %10 = load double* %9, align 8
  %11 = getelementptr inbounds %struct.vector* %v2, i32 0, i32 0
  %12 = load double* %11, align 8
  %13 = fcmp olt double %10, %12
  br i1 %13, label %14, label %17

; <label>:14                                      ; preds = %0
  %15 = getelementptr inbounds %struct.vector* %v1, i32 0, i32 0
  %16 = load double* %15, align 8
  br label %20

; <label>:17                                      ; preds = %0
  %18 = getelementptr inbounds %struct.vector* %v2, i32 0, i32 0
  %19 = load double* %18, align 8
  br label %20

; <label>:20                                      ; preds = %17, %14
  %21 = phi double [ %16, %14 ], [ %19, %17 ]
  %22 = fcmp olt double %8, %21
  br i1 %22, label %23, label %27

; <label>:23                                      ; preds = %20
  %24 = getelementptr inbounds %struct.tri* %1, i32 0, i32 7
  %25 = getelementptr inbounds %struct.vector* %24, i32 0, i32 0
  %26 = load double* %25, align 8
  br label %41

; <label>:27                                      ; preds = %20
  %28 = getelementptr inbounds %struct.vector* %v1, i32 0, i32 0
  %29 = load double* %28, align 8
  %30 = getelementptr inbounds %struct.vector* %v2, i32 0, i32 0
  %31 = load double* %30, align 8
  %32 = fcmp olt double %29, %31
  br i1 %32, label %33, label %36

; <label>:33                                      ; preds = %27
  %34 = getelementptr inbounds %struct.vector* %v1, i32 0, i32 0
  %35 = load double* %34, align 8
  br label %39

; <label>:36                                      ; preds = %27
  %37 = getelementptr inbounds %struct.vector* %v2, i32 0, i32 0
  %38 = load double* %37, align 8
  br label %39

; <label>:39                                      ; preds = %36, %33
  %40 = phi double [ %35, %33 ], [ %38, %36 ]
  br label %41

; <label>:41                                      ; preds = %39, %23
  %42 = phi double [ %26, %23 ], [ %40, %39 ]
  %43 = getelementptr inbounds %struct.vector* %min, i32 0, i32 0
  store double %42, double* %43, align 8
  %44 = getelementptr inbounds %struct.tri* %1, i32 0, i32 7
  %45 = getelementptr inbounds %struct.vector* %44, i32 0, i32 1
  %46 = load double* %45, align 8
  %47 = getelementptr inbounds %struct.vector* %v1, i32 0, i32 1
  %48 = load double* %47, align 8
  %49 = getelementptr inbounds %struct.vector* %v2, i32 0, i32 1
  %50 = load double* %49, align 8
  %51 = fcmp olt double %48, %50
  br i1 %51, label %52, label %55

; <label>:52                                      ; preds = %41
  %53 = getelementptr inbounds %struct.vector* %v1, i32 0, i32 1
  %54 = load double* %53, align 8
  br label %58

; <label>:55                                      ; preds = %41
  %56 = getelementptr inbounds %struct.vector* %v2, i32 0, i32 1
  %57 = load double* %56, align 8
  br label %58

; <label>:58                                      ; preds = %55, %52
  %59 = phi double [ %54, %52 ], [ %57, %55 ]
  %60 = fcmp olt double %46, %59
  br i1 %60, label %61, label %65

; <label>:61                                      ; preds = %58
  %62 = getelementptr inbounds %struct.tri* %1, i32 0, i32 7
  %63 = getelementptr inbounds %struct.vector* %62, i32 0, i32 1
  %64 = load double* %63, align 8
  br label %79

; <label>:65                                      ; preds = %58
  %66 = getelementptr inbounds %struct.vector* %v1, i32 0, i32 1
  %67 = load double* %66, align 8
  %68 = getelementptr inbounds %struct.vector* %v2, i32 0, i32 1
  %69 = load double* %68, align 8
  %70 = fcmp olt double %67, %69
  br i1 %70, label %71, label %74

; <label>:71                                      ; preds = %65
  %72 = getelementptr inbounds %struct.vector* %v1, i32 0, i32 1
  %73 = load double* %72, align 8
  br label %77

; <label>:74                                      ; preds = %65
  %75 = getelementptr inbounds %struct.vector* %v2, i32 0, i32 1
  %76 = load double* %75, align 8
  br label %77

; <label>:77                                      ; preds = %74, %71
  %78 = phi double [ %73, %71 ], [ %76, %74 ]
  br label %79

; <label>:79                                      ; preds = %77, %61
  %80 = phi double [ %64, %61 ], [ %78, %77 ]
  %81 = getelementptr inbounds %struct.vector* %min, i32 0, i32 1
  store double %80, double* %81, align 8
  %82 = getelementptr inbounds %struct.tri* %1, i32 0, i32 7
  %83 = getelementptr inbounds %struct.vector* %82, i32 0, i32 2
  %84 = load double* %83, align 8
  %85 = getelementptr inbounds %struct.vector* %v1, i32 0, i32 2
  %86 = load double* %85, align 8
  %87 = getelementptr inbounds %struct.vector* %v2, i32 0, i32 2
  %88 = load double* %87, align 8
  %89 = fcmp olt double %86, %88
  br i1 %89, label %90, label %93

; <label>:90                                      ; preds = %79
  %91 = getelementptr inbounds %struct.vector* %v1, i32 0, i32 2
  %92 = load double* %91, align 8
  br label %96

; <label>:93                                      ; preds = %79
  %94 = getelementptr inbounds %struct.vector* %v2, i32 0, i32 2
  %95 = load double* %94, align 8
  br label %96

; <label>:96                                      ; preds = %93, %90
  %97 = phi double [ %92, %90 ], [ %95, %93 ]
  %98 = fcmp olt double %84, %97
  br i1 %98, label %99, label %103

; <label>:99                                      ; preds = %96
  %100 = getelementptr inbounds %struct.tri* %1, i32 0, i32 7
  %101 = getelementptr inbounds %struct.vector* %100, i32 0, i32 2
  %102 = load double* %101, align 8
  br label %117

; <label>:103                                     ; preds = %96
  %104 = getelementptr inbounds %struct.vector* %v1, i32 0, i32 2
  %105 = load double* %104, align 8
  %106 = getelementptr inbounds %struct.vector* %v2, i32 0, i32 2
  %107 = load double* %106, align 8
  %108 = fcmp olt double %105, %107
  br i1 %108, label %109, label %112

; <label>:109                                     ; preds = %103
  %110 = getelementptr inbounds %struct.vector* %v1, i32 0, i32 2
  %111 = load double* %110, align 8
  br label %115

; <label>:112                                     ; preds = %103
  %113 = getelementptr inbounds %struct.vector* %v2, i32 0, i32 2
  %114 = load double* %113, align 8
  br label %115

; <label>:115                                     ; preds = %112, %109
  %116 = phi double [ %111, %109 ], [ %114, %112 ]
  br label %117

; <label>:117                                     ; preds = %115, %99
  %118 = phi double [ %102, %99 ], [ %116, %115 ]
  %119 = getelementptr inbounds %struct.vector* %min, i32 0, i32 2
  store double %118, double* %119, align 8
  %120 = getelementptr inbounds %struct.tri* %1, i32 0, i32 7
  %121 = getelementptr inbounds %struct.vector* %120, i32 0, i32 0
  %122 = load double* %121, align 8
  %123 = getelementptr inbounds %struct.vector* %v1, i32 0, i32 0
  %124 = load double* %123, align 8
  %125 = getelementptr inbounds %struct.vector* %v2, i32 0, i32 0
  %126 = load double* %125, align 8
  %127 = fcmp ogt double %124, %126
  br i1 %127, label %128, label %131

; <label>:128                                     ; preds = %117
  %129 = getelementptr inbounds %struct.vector* %v1, i32 0, i32 0
  %130 = load double* %129, align 8
  br label %134

; <label>:131                                     ; preds = %117
  %132 = getelementptr inbounds %struct.vector* %v2, i32 0, i32 0
  %133 = load double* %132, align 8
  br label %134

; <label>:134                                     ; preds = %131, %128
  %135 = phi double [ %130, %128 ], [ %133, %131 ]
  %136 = fcmp ogt double %122, %135
  br i1 %136, label %137, label %141

; <label>:137                                     ; preds = %134
  %138 = getelementptr inbounds %struct.tri* %1, i32 0, i32 7
  %139 = getelementptr inbounds %struct.vector* %138, i32 0, i32 0
  %140 = load double* %139, align 8
  br label %155

; <label>:141                                     ; preds = %134
  %142 = getelementptr inbounds %struct.vector* %v1, i32 0, i32 0
  %143 = load double* %142, align 8
  %144 = getelementptr inbounds %struct.vector* %v2, i32 0, i32 0
  %145 = load double* %144, align 8
  %146 = fcmp ogt double %143, %145
  br i1 %146, label %147, label %150

; <label>:147                                     ; preds = %141
  %148 = getelementptr inbounds %struct.vector* %v1, i32 0, i32 0
  %149 = load double* %148, align 8
  br label %153

; <label>:150                                     ; preds = %141
  %151 = getelementptr inbounds %struct.vector* %v2, i32 0, i32 0
  %152 = load double* %151, align 8
  br label %153

; <label>:153                                     ; preds = %150, %147
  %154 = phi double [ %149, %147 ], [ %152, %150 ]
  br label %155

; <label>:155                                     ; preds = %153, %137
  %156 = phi double [ %140, %137 ], [ %154, %153 ]
  %157 = getelementptr inbounds %struct.vector* %max, i32 0, i32 0
  store double %156, double* %157, align 8
  %158 = getelementptr inbounds %struct.tri* %1, i32 0, i32 7
  %159 = getelementptr inbounds %struct.vector* %158, i32 0, i32 1
  %160 = load double* %159, align 8
  %161 = getelementptr inbounds %struct.vector* %v1, i32 0, i32 1
  %162 = load double* %161, align 8
  %163 = getelementptr inbounds %struct.vector* %v2, i32 0, i32 1
  %164 = load double* %163, align 8
  %165 = fcmp ogt double %162, %164
  br i1 %165, label %166, label %169

; <label>:166                                     ; preds = %155
  %167 = getelementptr inbounds %struct.vector* %v1, i32 0, i32 1
  %168 = load double* %167, align 8
  br label %172

; <label>:169                                     ; preds = %155
  %170 = getelementptr inbounds %struct.vector* %v2, i32 0, i32 1
  %171 = load double* %170, align 8
  br label %172

; <label>:172                                     ; preds = %169, %166
  %173 = phi double [ %168, %166 ], [ %171, %169 ]
  %174 = fcmp ogt double %160, %173
  br i1 %174, label %175, label %179

; <label>:175                                     ; preds = %172
  %176 = getelementptr inbounds %struct.tri* %1, i32 0, i32 7
  %177 = getelementptr inbounds %struct.vector* %176, i32 0, i32 1
  %178 = load double* %177, align 8
  br label %193

; <label>:179                                     ; preds = %172
  %180 = getelementptr inbounds %struct.vector* %v1, i32 0, i32 1
  %181 = load double* %180, align 8
  %182 = getelementptr inbounds %struct.vector* %v2, i32 0, i32 1
  %183 = load double* %182, align 8
  %184 = fcmp ogt double %181, %183
  br i1 %184, label %185, label %188

; <label>:185                                     ; preds = %179
  %186 = getelementptr inbounds %struct.vector* %v1, i32 0, i32 1
  %187 = load double* %186, align 8
  br label %191

; <label>:188                                     ; preds = %179
  %189 = getelementptr inbounds %struct.vector* %v2, i32 0, i32 1
  %190 = load double* %189, align 8
  br label %191

; <label>:191                                     ; preds = %188, %185
  %192 = phi double [ %187, %185 ], [ %190, %188 ]
  br label %193

; <label>:193                                     ; preds = %191, %175
  %194 = phi double [ %178, %175 ], [ %192, %191 ]
  %195 = getelementptr inbounds %struct.vector* %max, i32 0, i32 1
  store double %194, double* %195, align 8
  %196 = getelementptr inbounds %struct.tri* %1, i32 0, i32 7
  %197 = getelementptr inbounds %struct.vector* %196, i32 0, i32 2
  %198 = load double* %197, align 8
  %199 = getelementptr inbounds %struct.vector* %v1, i32 0, i32 2
  %200 = load double* %199, align 8
  %201 = getelementptr inbounds %struct.vector* %v2, i32 0, i32 2
  %202 = load double* %201, align 8
  %203 = fcmp ogt double %200, %202
  br i1 %203, label %204, label %207

; <label>:204                                     ; preds = %193
  %205 = getelementptr inbounds %struct.vector* %v1, i32 0, i32 2
  %206 = load double* %205, align 8
  br label %210

; <label>:207                                     ; preds = %193
  %208 = getelementptr inbounds %struct.vector* %v2, i32 0, i32 2
  %209 = load double* %208, align 8
  br label %210

; <label>:210                                     ; preds = %207, %204
  %211 = phi double [ %206, %204 ], [ %209, %207 ]
  %212 = fcmp ogt double %198, %211
  br i1 %212, label %213, label %217

; <label>:213                                     ; preds = %210
  %214 = getelementptr inbounds %struct.tri* %1, i32 0, i32 7
  %215 = getelementptr inbounds %struct.vector* %214, i32 0, i32 2
  %216 = load double* %215, align 8
  br label %231

; <label>:217                                     ; preds = %210
  %218 = getelementptr inbounds %struct.vector* %v1, i32 0, i32 2
  %219 = load double* %218, align 8
  %220 = getelementptr inbounds %struct.vector* %v2, i32 0, i32 2
  %221 = load double* %220, align 8
  %222 = fcmp ogt double %219, %221
  br i1 %222, label %223, label %226

; <label>:223                                     ; preds = %217
  %224 = getelementptr inbounds %struct.vector* %v1, i32 0, i32 2
  %225 = load double* %224, align 8
  br label %229

; <label>:226                                     ; preds = %217
  %227 = getelementptr inbounds %struct.vector* %v2, i32 0, i32 2
  %228 = load double* %227, align 8
  br label %229

; <label>:229                                     ; preds = %226, %223
  %230 = phi double [ %225, %223 ], [ %228, %226 ]
  br label %231

; <label>:231                                     ; preds = %229, %213
  %232 = phi double [ %216, %213 ], [ %230, %229 ]
  %233 = getelementptr inbounds %struct.vector* %max, i32 0, i32 2
  store double %232, double* %233, align 8
  ret i32 1
}

; Function Attrs: nounwind
declare void @free(i8*) #2

declare void @VAdd(%struct.vector*, %struct.vector*, %struct.vector*) #1

; Function Attrs: nounwind
declare double @sqrt(double) #2

declare double @VDot(%struct.vector*, %struct.vector*) #1

; Function Attrs: nounwind uwtable
define internal void @stri_normal_guess(%struct.stri* %trn, %struct.vector* %hit, %struct.ray_t* %incident, %struct.vector* %N) #0 {
  %P = alloca %struct.vector, align 8
  %tmp = alloca %struct.vector, align 8
  %norm = alloca %struct.vector, align 8
  %1 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 6
  %2 = getelementptr inbounds %struct.vector* %1, i32 0, i32 1
  %3 = load double* %2, align 8
  %4 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 5
  %5 = getelementptr inbounds %struct.vector* %4, i32 0, i32 2
  %6 = load double* %5, align 8
  %7 = fmul double %3, %6
  %8 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 6
  %9 = getelementptr inbounds %struct.vector* %8, i32 0, i32 2
  %10 = load double* %9, align 8
  %11 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 5
  %12 = getelementptr inbounds %struct.vector* %11, i32 0, i32 1
  %13 = load double* %12, align 8
  %14 = fmul double %10, %13
  %15 = fsub double %7, %14
  %16 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 0
  store double %15, double* %16, align 8
  %17 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 6
  %18 = getelementptr inbounds %struct.vector* %17, i32 0, i32 2
  %19 = load double* %18, align 8
  %20 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 5
  %21 = getelementptr inbounds %struct.vector* %20, i32 0, i32 0
  %22 = load double* %21, align 8
  %23 = fmul double %19, %22
  %24 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 6
  %25 = getelementptr inbounds %struct.vector* %24, i32 0, i32 0
  %26 = load double* %25, align 8
  %27 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 5
  %28 = getelementptr inbounds %struct.vector* %27, i32 0, i32 2
  %29 = load double* %28, align 8
  %30 = fmul double %26, %29
  %31 = fsub double %23, %30
  %32 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 1
  store double %31, double* %32, align 8
  %33 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 6
  %34 = getelementptr inbounds %struct.vector* %33, i32 0, i32 0
  %35 = load double* %34, align 8
  %36 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 5
  %37 = getelementptr inbounds %struct.vector* %36, i32 0, i32 1
  %38 = load double* %37, align 8
  %39 = fmul double %35, %38
  %40 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 6
  %41 = getelementptr inbounds %struct.vector* %40, i32 0, i32 1
  %42 = load double* %41, align 8
  %43 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 5
  %44 = getelementptr inbounds %struct.vector* %43, i32 0, i32 0
  %45 = load double* %44, align 8
  %46 = fmul double %42, %45
  %47 = fsub double %39, %46
  %48 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 2
  store double %47, double* %48, align 8
  %49 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 0
  %50 = load double* %49, align 8
  %51 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 0
  %52 = load double* %51, align 8
  %53 = fmul double %50, %52
  %54 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 1
  %55 = load double* %54, align 8
  %56 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 1
  %57 = load double* %56, align 8
  %58 = fmul double %55, %57
  %59 = fadd double %53, %58
  %60 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 2
  %61 = load double* %60, align 8
  %62 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 2
  %63 = load double* %62, align 8
  %64 = fmul double %61, %63
  %65 = fadd double %59, %64
  %66 = getelementptr inbounds %struct.vector* %hit, i32 0, i32 0
  %67 = load double* %66, align 8
  %68 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 7
  %69 = getelementptr inbounds %struct.vector* %68, i32 0, i32 0
  %70 = load double* %69, align 8
  %71 = fsub double %67, %70
  %72 = getelementptr inbounds %struct.vector* %P, i32 0, i32 0
  store double %71, double* %72, align 8
  %73 = getelementptr inbounds %struct.vector* %hit, i32 0, i32 1
  %74 = load double* %73, align 8
  %75 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 7
  %76 = getelementptr inbounds %struct.vector* %75, i32 0, i32 1
  %77 = load double* %76, align 8
  %78 = fsub double %74, %77
  %79 = getelementptr inbounds %struct.vector* %P, i32 0, i32 1
  store double %78, double* %79, align 8
  %80 = getelementptr inbounds %struct.vector* %hit, i32 0, i32 2
  %81 = load double* %80, align 8
  %82 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 7
  %83 = getelementptr inbounds %struct.vector* %82, i32 0, i32 2
  %84 = load double* %83, align 8
  %85 = fsub double %81, %84
  %86 = getelementptr inbounds %struct.vector* %P, i32 0, i32 2
  store double %85, double* %86, align 8
  %87 = getelementptr inbounds %struct.vector* %P, i32 0, i32 1
  %88 = load double* %87, align 8
  %89 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 5
  %90 = getelementptr inbounds %struct.vector* %89, i32 0, i32 2
  %91 = load double* %90, align 8
  %92 = fmul double %88, %91
  %93 = getelementptr inbounds %struct.vector* %P, i32 0, i32 2
  %94 = load double* %93, align 8
  %95 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 5
  %96 = getelementptr inbounds %struct.vector* %95, i32 0, i32 1
  %97 = load double* %96, align 8
  %98 = fmul double %94, %97
  %99 = fsub double %92, %98
  %100 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 0
  store double %99, double* %100, align 8
  %101 = getelementptr inbounds %struct.vector* %P, i32 0, i32 2
  %102 = load double* %101, align 8
  %103 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 5
  %104 = getelementptr inbounds %struct.vector* %103, i32 0, i32 0
  %105 = load double* %104, align 8
  %106 = fmul double %102, %105
  %107 = getelementptr inbounds %struct.vector* %P, i32 0, i32 0
  %108 = load double* %107, align 8
  %109 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 5
  %110 = getelementptr inbounds %struct.vector* %109, i32 0, i32 2
  %111 = load double* %110, align 8
  %112 = fmul double %108, %111
  %113 = fsub double %106, %112
  %114 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 1
  store double %113, double* %114, align 8
  %115 = getelementptr inbounds %struct.vector* %P, i32 0, i32 0
  %116 = load double* %115, align 8
  %117 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 5
  %118 = getelementptr inbounds %struct.vector* %117, i32 0, i32 1
  %119 = load double* %118, align 8
  %120 = fmul double %116, %119
  %121 = getelementptr inbounds %struct.vector* %P, i32 0, i32 1
  %122 = load double* %121, align 8
  %123 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 5
  %124 = getelementptr inbounds %struct.vector* %123, i32 0, i32 0
  %125 = load double* %124, align 8
  %126 = fmul double %122, %125
  %127 = fsub double %120, %126
  %128 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 2
  store double %127, double* %128, align 8
  %129 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 0
  %130 = load double* %129, align 8
  %131 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 0
  %132 = load double* %131, align 8
  %133 = fmul double %130, %132
  %134 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 1
  %135 = load double* %134, align 8
  %136 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 1
  %137 = load double* %136, align 8
  %138 = fmul double %135, %137
  %139 = fadd double %133, %138
  %140 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 2
  %141 = load double* %140, align 8
  %142 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 2
  %143 = load double* %142, align 8
  %144 = fmul double %141, %143
  %145 = fadd double %139, %144
  %146 = fdiv double %145, %65
  %147 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 6
  %148 = getelementptr inbounds %struct.vector* %147, i32 0, i32 1
  %149 = load double* %148, align 8
  %150 = getelementptr inbounds %struct.vector* %P, i32 0, i32 2
  %151 = load double* %150, align 8
  %152 = fmul double %149, %151
  %153 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 6
  %154 = getelementptr inbounds %struct.vector* %153, i32 0, i32 2
  %155 = load double* %154, align 8
  %156 = getelementptr inbounds %struct.vector* %P, i32 0, i32 1
  %157 = load double* %156, align 8
  %158 = fmul double %155, %157
  %159 = fsub double %152, %158
  %160 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 0
  store double %159, double* %160, align 8
  %161 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 6
  %162 = getelementptr inbounds %struct.vector* %161, i32 0, i32 2
  %163 = load double* %162, align 8
  %164 = getelementptr inbounds %struct.vector* %P, i32 0, i32 0
  %165 = load double* %164, align 8
  %166 = fmul double %163, %165
  %167 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 6
  %168 = getelementptr inbounds %struct.vector* %167, i32 0, i32 0
  %169 = load double* %168, align 8
  %170 = getelementptr inbounds %struct.vector* %P, i32 0, i32 2
  %171 = load double* %170, align 8
  %172 = fmul double %169, %171
  %173 = fsub double %166, %172
  %174 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 1
  store double %173, double* %174, align 8
  %175 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 6
  %176 = getelementptr inbounds %struct.vector* %175, i32 0, i32 0
  %177 = load double* %176, align 8
  %178 = getelementptr inbounds %struct.vector* %P, i32 0, i32 1
  %179 = load double* %178, align 8
  %180 = fmul double %177, %179
  %181 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 6
  %182 = getelementptr inbounds %struct.vector* %181, i32 0, i32 1
  %183 = load double* %182, align 8
  %184 = getelementptr inbounds %struct.vector* %P, i32 0, i32 0
  %185 = load double* %184, align 8
  %186 = fmul double %183, %185
  %187 = fsub double %180, %186
  %188 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 2
  store double %187, double* %188, align 8
  %189 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 0
  %190 = load double* %189, align 8
  %191 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 0
  %192 = load double* %191, align 8
  %193 = fmul double %190, %192
  %194 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 1
  %195 = load double* %194, align 8
  %196 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 1
  %197 = load double* %196, align 8
  %198 = fmul double %195, %197
  %199 = fadd double %193, %198
  %200 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 2
  %201 = load double* %200, align 8
  %202 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 2
  %203 = load double* %202, align 8
  %204 = fmul double %201, %203
  %205 = fadd double %199, %204
  %206 = fdiv double %205, %65
  %207 = fadd double %146, %206
  %208 = fsub double 1.000000e+00, %207
  %209 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 8
  %210 = getelementptr inbounds %struct.vector* %209, i32 0, i32 0
  %211 = load double* %210, align 8
  %212 = fmul double %208, %211
  %213 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 9
  %214 = getelementptr inbounds %struct.vector* %213, i32 0, i32 0
  %215 = load double* %214, align 8
  %216 = fmul double %146, %215
  %217 = fadd double %212, %216
  %218 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 10
  %219 = getelementptr inbounds %struct.vector* %218, i32 0, i32 0
  %220 = load double* %219, align 8
  %221 = fmul double %206, %220
  %222 = fadd double %217, %221
  %223 = getelementptr inbounds %struct.vector* %N, i32 0, i32 0
  store double %222, double* %223, align 8
  %224 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 8
  %225 = getelementptr inbounds %struct.vector* %224, i32 0, i32 1
  %226 = load double* %225, align 8
  %227 = fmul double %208, %226
  %228 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 9
  %229 = getelementptr inbounds %struct.vector* %228, i32 0, i32 1
  %230 = load double* %229, align 8
  %231 = fmul double %146, %230
  %232 = fadd double %227, %231
  %233 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 10
  %234 = getelementptr inbounds %struct.vector* %233, i32 0, i32 1
  %235 = load double* %234, align 8
  %236 = fmul double %206, %235
  %237 = fadd double %232, %236
  %238 = getelementptr inbounds %struct.vector* %N, i32 0, i32 1
  store double %237, double* %238, align 8
  %239 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 8
  %240 = getelementptr inbounds %struct.vector* %239, i32 0, i32 2
  %241 = load double* %240, align 8
  %242 = fmul double %208, %241
  %243 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 9
  %244 = getelementptr inbounds %struct.vector* %243, i32 0, i32 2
  %245 = load double* %244, align 8
  %246 = fmul double %146, %245
  %247 = fadd double %242, %246
  %248 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 10
  %249 = getelementptr inbounds %struct.vector* %248, i32 0, i32 2
  %250 = load double* %249, align 8
  %251 = fmul double %206, %250
  %252 = fadd double %247, %251
  %253 = getelementptr inbounds %struct.vector* %N, i32 0, i32 2
  store double %252, double* %253, align 8
  %254 = getelementptr inbounds %struct.vector* %N, i32 0, i32 0
  %255 = load double* %254, align 8
  %256 = getelementptr inbounds %struct.vector* %N, i32 0, i32 0
  %257 = load double* %256, align 8
  %258 = fmul double %255, %257
  %259 = getelementptr inbounds %struct.vector* %N, i32 0, i32 1
  %260 = load double* %259, align 8
  %261 = getelementptr inbounds %struct.vector* %N, i32 0, i32 1
  %262 = load double* %261, align 8
  %263 = fmul double %260, %262
  %264 = fadd double %258, %263
  %265 = getelementptr inbounds %struct.vector* %N, i32 0, i32 2
  %266 = load double* %265, align 8
  %267 = getelementptr inbounds %struct.vector* %N, i32 0, i32 2
  %268 = load double* %267, align 8
  %269 = fmul double %266, %268
  %270 = fadd double %264, %269
  %271 = call double @sqrt(double %270) #3
  %272 = fdiv double 1.000000e+00, %271
  %273 = getelementptr inbounds %struct.vector* %N, i32 0, i32 0
  %274 = load double* %273, align 8
  %275 = fmul double %274, %272
  store double %275, double* %273, align 8
  %276 = getelementptr inbounds %struct.vector* %N, i32 0, i32 1
  %277 = load double* %276, align 8
  %278 = fmul double %277, %272
  store double %278, double* %276, align 8
  %279 = getelementptr inbounds %struct.vector* %N, i32 0, i32 2
  %280 = load double* %279, align 8
  %281 = fmul double %280, %272
  store double %281, double* %279, align 8
  %282 = getelementptr inbounds %struct.ray_t* %incident, i32 0, i32 1
  %283 = call double @VDot(%struct.vector* %N, %struct.vector* %282)
  %284 = fcmp ogt double %283, 0.000000e+00
  br i1 %284, label %285, label %298

; <label>:285                                     ; preds = %0
  %286 = getelementptr inbounds %struct.vector* %N, i32 0, i32 0
  %287 = load double* %286, align 8
  %288 = fsub double -0.000000e+00, %287
  %289 = getelementptr inbounds %struct.vector* %N, i32 0, i32 0
  store double %288, double* %289, align 8
  %290 = getelementptr inbounds %struct.vector* %N, i32 0, i32 1
  %291 = load double* %290, align 8
  %292 = fsub double -0.000000e+00, %291
  %293 = getelementptr inbounds %struct.vector* %N, i32 0, i32 1
  store double %292, double* %293, align 8
  %294 = getelementptr inbounds %struct.vector* %N, i32 0, i32 2
  %295 = load double* %294, align 8
  %296 = fsub double -0.000000e+00, %295
  %297 = getelementptr inbounds %struct.vector* %N, i32 0, i32 2
  store double %296, double* %297, align 8
  br label %298

; <label>:298                                     ; preds = %285, %0
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @stri_normal(%struct.stri* %trn, %struct.vector* %hit, %struct.ray_t* %incident, %struct.vector* %N) #0 {
  %P = alloca %struct.vector, align 8
  %tmp = alloca %struct.vector, align 8
  %norm = alloca %struct.vector, align 8
  %1 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 6
  %2 = getelementptr inbounds %struct.vector* %1, i32 0, i32 1
  %3 = load double* %2, align 8
  %4 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 5
  %5 = getelementptr inbounds %struct.vector* %4, i32 0, i32 2
  %6 = load double* %5, align 8
  %7 = fmul double %3, %6
  %8 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 6
  %9 = getelementptr inbounds %struct.vector* %8, i32 0, i32 2
  %10 = load double* %9, align 8
  %11 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 5
  %12 = getelementptr inbounds %struct.vector* %11, i32 0, i32 1
  %13 = load double* %12, align 8
  %14 = fmul double %10, %13
  %15 = fsub double %7, %14
  %16 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 0
  store double %15, double* %16, align 8
  %17 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 6
  %18 = getelementptr inbounds %struct.vector* %17, i32 0, i32 2
  %19 = load double* %18, align 8
  %20 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 5
  %21 = getelementptr inbounds %struct.vector* %20, i32 0, i32 0
  %22 = load double* %21, align 8
  %23 = fmul double %19, %22
  %24 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 6
  %25 = getelementptr inbounds %struct.vector* %24, i32 0, i32 0
  %26 = load double* %25, align 8
  %27 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 5
  %28 = getelementptr inbounds %struct.vector* %27, i32 0, i32 2
  %29 = load double* %28, align 8
  %30 = fmul double %26, %29
  %31 = fsub double %23, %30
  %32 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 1
  store double %31, double* %32, align 8
  %33 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 6
  %34 = getelementptr inbounds %struct.vector* %33, i32 0, i32 0
  %35 = load double* %34, align 8
  %36 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 5
  %37 = getelementptr inbounds %struct.vector* %36, i32 0, i32 1
  %38 = load double* %37, align 8
  %39 = fmul double %35, %38
  %40 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 6
  %41 = getelementptr inbounds %struct.vector* %40, i32 0, i32 1
  %42 = load double* %41, align 8
  %43 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 5
  %44 = getelementptr inbounds %struct.vector* %43, i32 0, i32 0
  %45 = load double* %44, align 8
  %46 = fmul double %42, %45
  %47 = fsub double %39, %46
  %48 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 2
  store double %47, double* %48, align 8
  %49 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 0
  %50 = load double* %49, align 8
  %51 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 0
  %52 = load double* %51, align 8
  %53 = fmul double %50, %52
  %54 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 1
  %55 = load double* %54, align 8
  %56 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 1
  %57 = load double* %56, align 8
  %58 = fmul double %55, %57
  %59 = fadd double %53, %58
  %60 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 2
  %61 = load double* %60, align 8
  %62 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 2
  %63 = load double* %62, align 8
  %64 = fmul double %61, %63
  %65 = fadd double %59, %64
  %66 = getelementptr inbounds %struct.vector* %hit, i32 0, i32 0
  %67 = load double* %66, align 8
  %68 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 7
  %69 = getelementptr inbounds %struct.vector* %68, i32 0, i32 0
  %70 = load double* %69, align 8
  %71 = fsub double %67, %70
  %72 = getelementptr inbounds %struct.vector* %P, i32 0, i32 0
  store double %71, double* %72, align 8
  %73 = getelementptr inbounds %struct.vector* %hit, i32 0, i32 1
  %74 = load double* %73, align 8
  %75 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 7
  %76 = getelementptr inbounds %struct.vector* %75, i32 0, i32 1
  %77 = load double* %76, align 8
  %78 = fsub double %74, %77
  %79 = getelementptr inbounds %struct.vector* %P, i32 0, i32 1
  store double %78, double* %79, align 8
  %80 = getelementptr inbounds %struct.vector* %hit, i32 0, i32 2
  %81 = load double* %80, align 8
  %82 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 7
  %83 = getelementptr inbounds %struct.vector* %82, i32 0, i32 2
  %84 = load double* %83, align 8
  %85 = fsub double %81, %84
  %86 = getelementptr inbounds %struct.vector* %P, i32 0, i32 2
  store double %85, double* %86, align 8
  %87 = getelementptr inbounds %struct.vector* %P, i32 0, i32 1
  %88 = load double* %87, align 8
  %89 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 5
  %90 = getelementptr inbounds %struct.vector* %89, i32 0, i32 2
  %91 = load double* %90, align 8
  %92 = fmul double %88, %91
  %93 = getelementptr inbounds %struct.vector* %P, i32 0, i32 2
  %94 = load double* %93, align 8
  %95 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 5
  %96 = getelementptr inbounds %struct.vector* %95, i32 0, i32 1
  %97 = load double* %96, align 8
  %98 = fmul double %94, %97
  %99 = fsub double %92, %98
  %100 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 0
  store double %99, double* %100, align 8
  %101 = getelementptr inbounds %struct.vector* %P, i32 0, i32 2
  %102 = load double* %101, align 8
  %103 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 5
  %104 = getelementptr inbounds %struct.vector* %103, i32 0, i32 0
  %105 = load double* %104, align 8
  %106 = fmul double %102, %105
  %107 = getelementptr inbounds %struct.vector* %P, i32 0, i32 0
  %108 = load double* %107, align 8
  %109 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 5
  %110 = getelementptr inbounds %struct.vector* %109, i32 0, i32 2
  %111 = load double* %110, align 8
  %112 = fmul double %108, %111
  %113 = fsub double %106, %112
  %114 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 1
  store double %113, double* %114, align 8
  %115 = getelementptr inbounds %struct.vector* %P, i32 0, i32 0
  %116 = load double* %115, align 8
  %117 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 5
  %118 = getelementptr inbounds %struct.vector* %117, i32 0, i32 1
  %119 = load double* %118, align 8
  %120 = fmul double %116, %119
  %121 = getelementptr inbounds %struct.vector* %P, i32 0, i32 1
  %122 = load double* %121, align 8
  %123 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 5
  %124 = getelementptr inbounds %struct.vector* %123, i32 0, i32 0
  %125 = load double* %124, align 8
  %126 = fmul double %122, %125
  %127 = fsub double %120, %126
  %128 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 2
  store double %127, double* %128, align 8
  %129 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 0
  %130 = load double* %129, align 8
  %131 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 0
  %132 = load double* %131, align 8
  %133 = fmul double %130, %132
  %134 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 1
  %135 = load double* %134, align 8
  %136 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 1
  %137 = load double* %136, align 8
  %138 = fmul double %135, %137
  %139 = fadd double %133, %138
  %140 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 2
  %141 = load double* %140, align 8
  %142 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 2
  %143 = load double* %142, align 8
  %144 = fmul double %141, %143
  %145 = fadd double %139, %144
  %146 = fdiv double %145, %65
  %147 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 6
  %148 = getelementptr inbounds %struct.vector* %147, i32 0, i32 1
  %149 = load double* %148, align 8
  %150 = getelementptr inbounds %struct.vector* %P, i32 0, i32 2
  %151 = load double* %150, align 8
  %152 = fmul double %149, %151
  %153 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 6
  %154 = getelementptr inbounds %struct.vector* %153, i32 0, i32 2
  %155 = load double* %154, align 8
  %156 = getelementptr inbounds %struct.vector* %P, i32 0, i32 1
  %157 = load double* %156, align 8
  %158 = fmul double %155, %157
  %159 = fsub double %152, %158
  %160 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 0
  store double %159, double* %160, align 8
  %161 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 6
  %162 = getelementptr inbounds %struct.vector* %161, i32 0, i32 2
  %163 = load double* %162, align 8
  %164 = getelementptr inbounds %struct.vector* %P, i32 0, i32 0
  %165 = load double* %164, align 8
  %166 = fmul double %163, %165
  %167 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 6
  %168 = getelementptr inbounds %struct.vector* %167, i32 0, i32 0
  %169 = load double* %168, align 8
  %170 = getelementptr inbounds %struct.vector* %P, i32 0, i32 2
  %171 = load double* %170, align 8
  %172 = fmul double %169, %171
  %173 = fsub double %166, %172
  %174 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 1
  store double %173, double* %174, align 8
  %175 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 6
  %176 = getelementptr inbounds %struct.vector* %175, i32 0, i32 0
  %177 = load double* %176, align 8
  %178 = getelementptr inbounds %struct.vector* %P, i32 0, i32 1
  %179 = load double* %178, align 8
  %180 = fmul double %177, %179
  %181 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 6
  %182 = getelementptr inbounds %struct.vector* %181, i32 0, i32 1
  %183 = load double* %182, align 8
  %184 = getelementptr inbounds %struct.vector* %P, i32 0, i32 0
  %185 = load double* %184, align 8
  %186 = fmul double %183, %185
  %187 = fsub double %180, %186
  %188 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 2
  store double %187, double* %188, align 8
  %189 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 0
  %190 = load double* %189, align 8
  %191 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 0
  %192 = load double* %191, align 8
  %193 = fmul double %190, %192
  %194 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 1
  %195 = load double* %194, align 8
  %196 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 1
  %197 = load double* %196, align 8
  %198 = fmul double %195, %197
  %199 = fadd double %193, %198
  %200 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 2
  %201 = load double* %200, align 8
  %202 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 2
  %203 = load double* %202, align 8
  %204 = fmul double %201, %203
  %205 = fadd double %199, %204
  %206 = fdiv double %205, %65
  %207 = fadd double %146, %206
  %208 = fsub double 1.000000e+00, %207
  %209 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 8
  %210 = getelementptr inbounds %struct.vector* %209, i32 0, i32 0
  %211 = load double* %210, align 8
  %212 = fmul double %208, %211
  %213 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 9
  %214 = getelementptr inbounds %struct.vector* %213, i32 0, i32 0
  %215 = load double* %214, align 8
  %216 = fmul double %146, %215
  %217 = fadd double %212, %216
  %218 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 10
  %219 = getelementptr inbounds %struct.vector* %218, i32 0, i32 0
  %220 = load double* %219, align 8
  %221 = fmul double %206, %220
  %222 = fadd double %217, %221
  %223 = getelementptr inbounds %struct.vector* %N, i32 0, i32 0
  store double %222, double* %223, align 8
  %224 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 8
  %225 = getelementptr inbounds %struct.vector* %224, i32 0, i32 1
  %226 = load double* %225, align 8
  %227 = fmul double %208, %226
  %228 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 9
  %229 = getelementptr inbounds %struct.vector* %228, i32 0, i32 1
  %230 = load double* %229, align 8
  %231 = fmul double %146, %230
  %232 = fadd double %227, %231
  %233 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 10
  %234 = getelementptr inbounds %struct.vector* %233, i32 0, i32 1
  %235 = load double* %234, align 8
  %236 = fmul double %206, %235
  %237 = fadd double %232, %236
  %238 = getelementptr inbounds %struct.vector* %N, i32 0, i32 1
  store double %237, double* %238, align 8
  %239 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 8
  %240 = getelementptr inbounds %struct.vector* %239, i32 0, i32 2
  %241 = load double* %240, align 8
  %242 = fmul double %208, %241
  %243 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 9
  %244 = getelementptr inbounds %struct.vector* %243, i32 0, i32 2
  %245 = load double* %244, align 8
  %246 = fmul double %146, %245
  %247 = fadd double %242, %246
  %248 = getelementptr inbounds %struct.stri* %trn, i32 0, i32 10
  %249 = getelementptr inbounds %struct.vector* %248, i32 0, i32 2
  %250 = load double* %249, align 8
  %251 = fmul double %206, %250
  %252 = fadd double %247, %251
  %253 = getelementptr inbounds %struct.vector* %N, i32 0, i32 2
  store double %252, double* %253, align 8
  %254 = getelementptr inbounds %struct.vector* %N, i32 0, i32 0
  %255 = load double* %254, align 8
  %256 = getelementptr inbounds %struct.vector* %N, i32 0, i32 0
  %257 = load double* %256, align 8
  %258 = fmul double %255, %257
  %259 = getelementptr inbounds %struct.vector* %N, i32 0, i32 1
  %260 = load double* %259, align 8
  %261 = getelementptr inbounds %struct.vector* %N, i32 0, i32 1
  %262 = load double* %261, align 8
  %263 = fmul double %260, %262
  %264 = fadd double %258, %263
  %265 = getelementptr inbounds %struct.vector* %N, i32 0, i32 2
  %266 = load double* %265, align 8
  %267 = getelementptr inbounds %struct.vector* %N, i32 0, i32 2
  %268 = load double* %267, align 8
  %269 = fmul double %266, %268
  %270 = fadd double %264, %269
  %271 = call double @sqrt(double %270) #3
  %272 = fdiv double 1.000000e+00, %271
  %273 = getelementptr inbounds %struct.vector* %N, i32 0, i32 0
  %274 = load double* %273, align 8
  %275 = fmul double %274, %272
  store double %275, double* %273, align 8
  %276 = getelementptr inbounds %struct.vector* %N, i32 0, i32 1
  %277 = load double* %276, align 8
  %278 = fmul double %277, %272
  store double %278, double* %276, align 8
  %279 = getelementptr inbounds %struct.vector* %N, i32 0, i32 2
  %280 = load double* %279, align 8
  %281 = fmul double %280, %272
  store double %281, double* %279, align 8
  %282 = getelementptr inbounds %struct.ray_t* %incident, i32 0, i32 1
  %283 = call double @VDot(%struct.vector* %norm, %struct.vector* %282)
  %284 = fcmp ogt double %283, 0.000000e+00
  br i1 %284, label %285, label %298

; <label>:285                                     ; preds = %0
  %286 = getelementptr inbounds %struct.vector* %N, i32 0, i32 0
  %287 = load double* %286, align 8
  %288 = fsub double -0.000000e+00, %287
  %289 = getelementptr inbounds %struct.vector* %N, i32 0, i32 0
  store double %288, double* %289, align 8
  %290 = getelementptr inbounds %struct.vector* %N, i32 0, i32 1
  %291 = load double* %290, align 8
  %292 = fsub double -0.000000e+00, %291
  %293 = getelementptr inbounds %struct.vector* %N, i32 0, i32 1
  store double %292, double* %293, align 8
  %294 = getelementptr inbounds %struct.vector* %N, i32 0, i32 2
  %295 = load double* %294, align 8
  %296 = fsub double -0.000000e+00, %295
  %297 = getelementptr inbounds %struct.vector* %N, i32 0, i32 2
  store double %296, double* %297, align 8
  br label %298

; <label>:298                                     ; preds = %285, %0
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @tri_normal(%struct.tri* %trn, %struct.vector* %hit, %struct.ray_t* %incident, %struct.vector* %N) #0 {
  %1 = getelementptr inbounds %struct.tri* %trn, i32 0, i32 6
  %2 = getelementptr inbounds %struct.vector* %1, i32 0, i32 1
  %3 = load double* %2, align 8
  %4 = getelementptr inbounds %struct.tri* %trn, i32 0, i32 5
  %5 = getelementptr inbounds %struct.vector* %4, i32 0, i32 2
  %6 = load double* %5, align 8
  %7 = fmul double %3, %6
  %8 = getelementptr inbounds %struct.tri* %trn, i32 0, i32 6
  %9 = getelementptr inbounds %struct.vector* %8, i32 0, i32 2
  %10 = load double* %9, align 8
  %11 = getelementptr inbounds %struct.tri* %trn, i32 0, i32 5
  %12 = getelementptr inbounds %struct.vector* %11, i32 0, i32 1
  %13 = load double* %12, align 8
  %14 = fmul double %10, %13
  %15 = fsub double %7, %14
  %16 = getelementptr inbounds %struct.vector* %N, i32 0, i32 0
  store double %15, double* %16, align 8
  %17 = getelementptr inbounds %struct.tri* %trn, i32 0, i32 6
  %18 = getelementptr inbounds %struct.vector* %17, i32 0, i32 2
  %19 = load double* %18, align 8
  %20 = getelementptr inbounds %struct.tri* %trn, i32 0, i32 5
  %21 = getelementptr inbounds %struct.vector* %20, i32 0, i32 0
  %22 = load double* %21, align 8
  %23 = fmul double %19, %22
  %24 = getelementptr inbounds %struct.tri* %trn, i32 0, i32 6
  %25 = getelementptr inbounds %struct.vector* %24, i32 0, i32 0
  %26 = load double* %25, align 8
  %27 = getelementptr inbounds %struct.tri* %trn, i32 0, i32 5
  %28 = getelementptr inbounds %struct.vector* %27, i32 0, i32 2
  %29 = load double* %28, align 8
  %30 = fmul double %26, %29
  %31 = fsub double %23, %30
  %32 = getelementptr inbounds %struct.vector* %N, i32 0, i32 1
  store double %31, double* %32, align 8
  %33 = getelementptr inbounds %struct.tri* %trn, i32 0, i32 6
  %34 = getelementptr inbounds %struct.vector* %33, i32 0, i32 0
  %35 = load double* %34, align 8
  %36 = getelementptr inbounds %struct.tri* %trn, i32 0, i32 5
  %37 = getelementptr inbounds %struct.vector* %36, i32 0, i32 1
  %38 = load double* %37, align 8
  %39 = fmul double %35, %38
  %40 = getelementptr inbounds %struct.tri* %trn, i32 0, i32 6
  %41 = getelementptr inbounds %struct.vector* %40, i32 0, i32 1
  %42 = load double* %41, align 8
  %43 = getelementptr inbounds %struct.tri* %trn, i32 0, i32 5
  %44 = getelementptr inbounds %struct.vector* %43, i32 0, i32 0
  %45 = load double* %44, align 8
  %46 = fmul double %42, %45
  %47 = fsub double %39, %46
  %48 = getelementptr inbounds %struct.vector* %N, i32 0, i32 2
  store double %47, double* %48, align 8
  %49 = getelementptr inbounds %struct.vector* %N, i32 0, i32 0
  %50 = load double* %49, align 8
  %51 = getelementptr inbounds %struct.vector* %N, i32 0, i32 0
  %52 = load double* %51, align 8
  %53 = fmul double %50, %52
  %54 = getelementptr inbounds %struct.vector* %N, i32 0, i32 1
  %55 = load double* %54, align 8
  %56 = getelementptr inbounds %struct.vector* %N, i32 0, i32 1
  %57 = load double* %56, align 8
  %58 = fmul double %55, %57
  %59 = fadd double %53, %58
  %60 = getelementptr inbounds %struct.vector* %N, i32 0, i32 2
  %61 = load double* %60, align 8
  %62 = getelementptr inbounds %struct.vector* %N, i32 0, i32 2
  %63 = load double* %62, align 8
  %64 = fmul double %61, %63
  %65 = fadd double %59, %64
  %66 = call double @sqrt(double %65) #3
  %67 = fdiv double 1.000000e+00, %66
  %68 = getelementptr inbounds %struct.vector* %N, i32 0, i32 0
  %69 = load double* %68, align 8
  %70 = fmul double %69, %67
  store double %70, double* %68, align 8
  %71 = getelementptr inbounds %struct.vector* %N, i32 0, i32 1
  %72 = load double* %71, align 8
  %73 = fmul double %72, %67
  store double %73, double* %71, align 8
  %74 = getelementptr inbounds %struct.vector* %N, i32 0, i32 2
  %75 = load double* %74, align 8
  %76 = fmul double %75, %67
  store double %76, double* %74, align 8
  %77 = getelementptr inbounds %struct.ray_t* %incident, i32 0, i32 1
  %78 = call double @VDot(%struct.vector* %N, %struct.vector* %77)
  %79 = fcmp ogt double %78, 0.000000e+00
  br i1 %79, label %80, label %93

; <label>:80                                      ; preds = %0
  %81 = getelementptr inbounds %struct.vector* %N, i32 0, i32 0
  %82 = load double* %81, align 8
  %83 = fsub double -0.000000e+00, %82
  %84 = getelementptr inbounds %struct.vector* %N, i32 0, i32 0
  store double %83, double* %84, align 8
  %85 = getelementptr inbounds %struct.vector* %N, i32 0, i32 1
  %86 = load double* %85, align 8
  %87 = fsub double -0.000000e+00, %86
  %88 = getelementptr inbounds %struct.vector* %N, i32 0, i32 1
  store double %87, double* %88, align 8
  %89 = getelementptr inbounds %struct.vector* %N, i32 0, i32 2
  %90 = load double* %89, align 8
  %91 = fsub double -0.000000e+00, %90
  %92 = getelementptr inbounds %struct.vector* %N, i32 0, i32 2
  store double %91, double* %92, align 8
  br label %93

; <label>:93                                      ; preds = %80, %0
  ret void
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
