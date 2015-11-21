; ModuleID = 'triangle.c'
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
%struct.vcstri = type { i32, i8*, %struct.object_methods*, %struct.clip_group*, %struct.texture*, %struct.vector, %struct.vector, %struct.vector, %struct.vector, %struct.vector, %struct.vector, %struct.color, %struct.color, %struct.color }
%struct.vcstri_texture = type { { <2 x float>, float } (i8*, i8*, i8*)*, %struct.texture_methods*, i32, float, float, float, float, i32, float, float, float, float, i8*, %struct.color, %struct.color, %struct.color }
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
  %1 = alloca %struct.object*, align 8
  %2 = alloca i8*, align 8
  %t = alloca %struct.tri*, align 8
  %edge1 = alloca %struct.vector, align 8
  %edge2 = alloca %struct.vector, align 8
  %edge3 = alloca %struct.vector, align 8
  store i8* %tex, i8** %2, align 8
  call void @VSub(%struct.vector* %v1, %struct.vector* %v0, %struct.vector* %edge1)
  call void @VSub(%struct.vector* %v2, %struct.vector* %v0, %struct.vector* %edge2)
  call void @VSub(%struct.vector* %v2, %struct.vector* %v1, %struct.vector* %edge3)
  %3 = call double @VLength(%struct.vector* %edge1)
  %4 = fcmp oge double %3, 5.000000e-08
  br i1 %4, label %5, label %36

; <label>:5                                       ; preds = %0
  %6 = call double @VLength(%struct.vector* %edge2)
  %7 = fcmp oge double %6, 5.000000e-08
  br i1 %7, label %8, label %36

; <label>:8                                       ; preds = %5
  %9 = call double @VLength(%struct.vector* %edge3)
  %10 = fcmp oge double %9, 5.000000e-08
  br i1 %10, label %11, label %36

; <label>:11                                      ; preds = %8
  %12 = call noalias i8* @malloc(i64 112) #3
  %13 = bitcast i8* %12 to %struct.tri*
  store %struct.tri* %13, %struct.tri** %t, align 8
  %14 = load %struct.tri** %t, align 8
  %15 = getelementptr inbounds %struct.tri* %14, i32 0, i32 1
  store i8* null, i8** %15, align 8
  %16 = load %struct.tri** %t, align 8
  %17 = getelementptr inbounds %struct.tri* %16, i32 0, i32 2
  store %struct.object_methods* @tri_methods, %struct.object_methods** %17, align 8
  %18 = load i8** %2, align 8
  %19 = bitcast i8* %18 to %struct.texture*
  %20 = load %struct.tri** %t, align 8
  %21 = getelementptr inbounds %struct.tri* %20, i32 0, i32 4
  store %struct.texture* %19, %struct.texture** %21, align 8
  %22 = load %struct.tri** %t, align 8
  %23 = getelementptr inbounds %struct.tri* %22, i32 0, i32 7
  %24 = bitcast %struct.vector* %23 to i8*
  %25 = bitcast %struct.vector* %v0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %24, i8* %25, i64 24, i32 8, i1 false)
  %26 = load %struct.tri** %t, align 8
  %27 = getelementptr inbounds %struct.tri* %26, i32 0, i32 6
  %28 = bitcast %struct.vector* %27 to i8*
  %29 = bitcast %struct.vector* %edge1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %28, i8* %29, i64 24, i32 8, i1 false)
  %30 = load %struct.tri** %t, align 8
  %31 = getelementptr inbounds %struct.tri* %30, i32 0, i32 5
  %32 = bitcast %struct.vector* %31 to i8*
  %33 = bitcast %struct.vector* %edge2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %32, i8* %33, i64 24, i32 8, i1 false)
  %34 = load %struct.tri** %t, align 8
  %35 = bitcast %struct.tri* %34 to %struct.object*
  store %struct.object* %35, %struct.object** %1
  br label %37

; <label>:36                                      ; preds = %8, %5, %0
  store %struct.object* null, %struct.object** %1
  br label %37

; <label>:37                                      ; preds = %36, %11
  %38 = load %struct.object** %1
  ret %struct.object* %38
}

declare void @VSub(%struct.vector*, %struct.vector*, %struct.vector*) #1

declare double @VLength(%struct.vector*) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #3

; Function Attrs: nounwind uwtable
define %struct.object* @newstri(i8* %tex, %struct.vector* byval align 8 %v0, %struct.vector* byval align 8 %v1, %struct.vector* byval align 8 %v2, %struct.vector* byval align 8 %n0, %struct.vector* byval align 8 %n1, %struct.vector* byval align 8 %n2) #0 {
  %1 = alloca %struct.object*, align 8
  %2 = alloca i8*, align 8
  %t = alloca %struct.stri*, align 8
  %edge1 = alloca %struct.vector, align 8
  %edge2 = alloca %struct.vector, align 8
  %edge3 = alloca %struct.vector, align 8
  store i8* %tex, i8** %2, align 8
  call void @VSub(%struct.vector* %v1, %struct.vector* %v0, %struct.vector* %edge1)
  call void @VSub(%struct.vector* %v2, %struct.vector* %v0, %struct.vector* %edge2)
  call void @VSub(%struct.vector* %v2, %struct.vector* %v1, %struct.vector* %edge3)
  %3 = call double @VLength(%struct.vector* %edge1)
  %4 = fcmp oge double %3, 5.000000e-08
  br i1 %4, label %5, label %48

; <label>:5                                       ; preds = %0
  %6 = call double @VLength(%struct.vector* %edge2)
  %7 = fcmp oge double %6, 5.000000e-08
  br i1 %7, label %8, label %48

; <label>:8                                       ; preds = %5
  %9 = call double @VLength(%struct.vector* %edge3)
  %10 = fcmp oge double %9, 5.000000e-08
  br i1 %10, label %11, label %48

; <label>:11                                      ; preds = %8
  %12 = call noalias i8* @malloc(i64 184) #3
  %13 = bitcast i8* %12 to %struct.stri*
  store %struct.stri* %13, %struct.stri** %t, align 8
  %14 = load %struct.stri** %t, align 8
  %15 = getelementptr inbounds %struct.stri* %14, i32 0, i32 1
  store i8* null, i8** %15, align 8
  %16 = load %struct.stri** %t, align 8
  %17 = getelementptr inbounds %struct.stri* %16, i32 0, i32 2
  store %struct.object_methods* @stri_methods, %struct.object_methods** %17, align 8
  %18 = load i8** %2, align 8
  %19 = bitcast i8* %18 to %struct.texture*
  %20 = load %struct.stri** %t, align 8
  %21 = getelementptr inbounds %struct.stri* %20, i32 0, i32 4
  store %struct.texture* %19, %struct.texture** %21, align 8
  %22 = load %struct.stri** %t, align 8
  %23 = getelementptr inbounds %struct.stri* %22, i32 0, i32 7
  %24 = bitcast %struct.vector* %23 to i8*
  %25 = bitcast %struct.vector* %v0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %24, i8* %25, i64 24, i32 8, i1 false)
  %26 = load %struct.stri** %t, align 8
  %27 = getelementptr inbounds %struct.stri* %26, i32 0, i32 6
  %28 = bitcast %struct.vector* %27 to i8*
  %29 = bitcast %struct.vector* %edge1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %28, i8* %29, i64 24, i32 8, i1 false)
  %30 = load %struct.stri** %t, align 8
  %31 = getelementptr inbounds %struct.stri* %30, i32 0, i32 5
  %32 = bitcast %struct.vector* %31 to i8*
  %33 = bitcast %struct.vector* %edge2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %32, i8* %33, i64 24, i32 8, i1 false)
  %34 = load %struct.stri** %t, align 8
  %35 = getelementptr inbounds %struct.stri* %34, i32 0, i32 8
  %36 = bitcast %struct.vector* %35 to i8*
  %37 = bitcast %struct.vector* %n0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %36, i8* %37, i64 24, i32 8, i1 false)
  %38 = load %struct.stri** %t, align 8
  %39 = getelementptr inbounds %struct.stri* %38, i32 0, i32 9
  %40 = bitcast %struct.vector* %39 to i8*
  %41 = bitcast %struct.vector* %n1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %40, i8* %41, i64 24, i32 8, i1 false)
  %42 = load %struct.stri** %t, align 8
  %43 = getelementptr inbounds %struct.stri* %42, i32 0, i32 10
  %44 = bitcast %struct.vector* %43 to i8*
  %45 = bitcast %struct.vector* %n2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %44, i8* %45, i64 24, i32 8, i1 false)
  %46 = load %struct.stri** %t, align 8
  %47 = bitcast %struct.stri* %46 to %struct.object*
  store %struct.object* %47, %struct.object** %1
  br label %49

; <label>:48                                      ; preds = %8, %5, %0
  store %struct.object* null, %struct.object** %1
  br label %49

; <label>:49                                      ; preds = %48, %11
  %50 = load %struct.object** %1
  ret %struct.object* %50
}

; Function Attrs: nounwind uwtable
define void @stri_normal_fixup(%struct.object* %otri, i32 %mode) #0 {
  %1 = alloca %struct.object*, align 8
  %2 = alloca i32, align 4
  %t = alloca %struct.stri*, align 8
  store %struct.object* %otri, %struct.object** %1, align 8
  store i32 %mode, i32* %2, align 4
  %3 = load %struct.object** %1, align 8
  %4 = bitcast %struct.object* %3 to %struct.stri*
  store %struct.stri* %4, %struct.stri** %t, align 8
  %5 = load i32* %2, align 4
  switch i32 %5, label %13 [
    i32 2, label %6
    i32 1, label %9
    i32 0, label %12
  ]

; <label>:6                                       ; preds = %0
  %7 = load %struct.stri** %t, align 8
  %8 = getelementptr inbounds %struct.stri* %7, i32 0, i32 2
  store %struct.object_methods* @stri_methods_guess, %struct.object_methods** %8, align 8
  br label %16

; <label>:9                                       ; preds = %0
  %10 = load %struct.stri** %t, align 8
  %11 = getelementptr inbounds %struct.stri* %10, i32 0, i32 2
  store %struct.object_methods* @stri_methods_reverse, %struct.object_methods** %11, align 8
  br label %16

; <label>:12                                      ; preds = %0
  br label %13

; <label>:13                                      ; preds = %0, %12
  %14 = load %struct.stri** %t, align 8
  %15 = getelementptr inbounds %struct.stri* %14, i32 0, i32 2
  store %struct.object_methods* @stri_methods, %struct.object_methods** %15, align 8
  br label %16

; <label>:16                                      ; preds = %13, %9, %6
  ret void
}

; Function Attrs: nounwind uwtable
define %struct.object* @newvcstri(i8* %voidtex, %struct.vector* byval align 8 %v0, %struct.vector* byval align 8 %v1, %struct.vector* byval align 8 %v2, %struct.vector* byval align 8 %n0, %struct.vector* byval align 8 %n1, %struct.vector* byval align 8 %n2, <2 x float> %c0.coerce0, float %c0.coerce1, <2 x float> %c1.coerce0, float %c1.coerce1, <2 x float> %c2.coerce0, float %c2.coerce1) #0 {
  %1 = alloca %struct.object*, align 8
  %c0 = alloca %struct.color, align 8
  %2 = alloca { <2 x float>, float }, align 8
  %c1 = alloca %struct.color, align 8
  %3 = alloca { <2 x float>, float }, align 8
  %c2 = alloca %struct.color, align 8
  %4 = alloca { <2 x float>, float }, align 8
  %5 = alloca i8*, align 8
  %t = alloca %struct.vcstri*, align 8
  %edge1 = alloca %struct.vector, align 8
  %edge2 = alloca %struct.vector, align 8
  %edge3 = alloca %struct.vector, align 8
  %tex = alloca %struct.vcstri_texture*, align 8
  %6 = getelementptr { <2 x float>, float }* %2, i32 0, i32 0
  store <2 x float> %c0.coerce0, <2 x float>* %6
  %7 = getelementptr { <2 x float>, float }* %2, i32 0, i32 1
  store float %c0.coerce1, float* %7
  %8 = bitcast %struct.color* %c0 to i8*
  %9 = bitcast { <2 x float>, float }* %2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %8, i8* %9, i64 12, i32 8, i1 false)
  %10 = getelementptr { <2 x float>, float }* %3, i32 0, i32 0
  store <2 x float> %c1.coerce0, <2 x float>* %10
  %11 = getelementptr { <2 x float>, float }* %3, i32 0, i32 1
  store float %c1.coerce1, float* %11
  %12 = bitcast %struct.color* %c1 to i8*
  %13 = bitcast { <2 x float>, float }* %3 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %12, i8* %13, i64 12, i32 8, i1 false)
  %14 = getelementptr { <2 x float>, float }* %4, i32 0, i32 0
  store <2 x float> %c2.coerce0, <2 x float>* %14
  %15 = getelementptr { <2 x float>, float }* %4, i32 0, i32 1
  store float %c2.coerce1, float* %15
  %16 = bitcast %struct.color* %c2 to i8*
  %17 = bitcast { <2 x float>, float }* %4 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %16, i8* %17, i64 12, i32 8, i1 false)
  store i8* %voidtex, i8** %5, align 8
  %18 = load i8** %5, align 8
  %19 = bitcast i8* %18 to %struct.vcstri_texture*
  store %struct.vcstri_texture* %19, %struct.vcstri_texture** %tex, align 8
  call void @VSub(%struct.vector* %v1, %struct.vector* %v0, %struct.vector* %edge1)
  call void @VSub(%struct.vector* %v2, %struct.vector* %v0, %struct.vector* %edge2)
  call void @VSub(%struct.vector* %v2, %struct.vector* %v1, %struct.vector* %edge3)
  %20 = call double @VLength(%struct.vector* %edge1)
  %21 = fcmp oge double %20, 5.000000e-08
  br i1 %21, label %22, label %83

; <label>:22                                      ; preds = %0
  %23 = call double @VLength(%struct.vector* %edge2)
  %24 = fcmp oge double %23, 5.000000e-08
  br i1 %24, label %25, label %83

; <label>:25                                      ; preds = %22
  %26 = call double @VLength(%struct.vector* %edge3)
  %27 = fcmp oge double %26, 5.000000e-08
  br i1 %27, label %28, label %83

; <label>:28                                      ; preds = %25
  %29 = call noalias i8* @malloc(i64 224) #3
  %30 = bitcast i8* %29 to %struct.vcstri*
  store %struct.vcstri* %30, %struct.vcstri** %t, align 8
  %31 = load %struct.vcstri** %t, align 8
  %32 = getelementptr inbounds %struct.vcstri* %31, i32 0, i32 1
  store i8* null, i8** %32, align 8
  %33 = load %struct.vcstri** %t, align 8
  %34 = getelementptr inbounds %struct.vcstri* %33, i32 0, i32 2
  store %struct.object_methods* @stri_methods, %struct.object_methods** %34, align 8
  %35 = load %struct.vcstri** %t, align 8
  %36 = getelementptr inbounds %struct.vcstri* %35, i32 0, i32 7
  %37 = bitcast %struct.vector* %36 to i8*
  %38 = bitcast %struct.vector* %v0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %37, i8* %38, i64 24, i32 8, i1 false)
  %39 = load %struct.vcstri** %t, align 8
  %40 = getelementptr inbounds %struct.vcstri* %39, i32 0, i32 6
  %41 = bitcast %struct.vector* %40 to i8*
  %42 = bitcast %struct.vector* %edge1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %41, i8* %42, i64 24, i32 8, i1 false)
  %43 = load %struct.vcstri** %t, align 8
  %44 = getelementptr inbounds %struct.vcstri* %43, i32 0, i32 5
  %45 = bitcast %struct.vector* %44 to i8*
  %46 = bitcast %struct.vector* %edge2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %45, i8* %46, i64 24, i32 8, i1 false)
  %47 = load %struct.vcstri** %t, align 8
  %48 = getelementptr inbounds %struct.vcstri* %47, i32 0, i32 8
  %49 = bitcast %struct.vector* %48 to i8*
  %50 = bitcast %struct.vector* %n0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %49, i8* %50, i64 24, i32 8, i1 false)
  %51 = load %struct.vcstri** %t, align 8
  %52 = getelementptr inbounds %struct.vcstri* %51, i32 0, i32 9
  %53 = bitcast %struct.vector* %52 to i8*
  %54 = bitcast %struct.vector* %n1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %53, i8* %54, i64 24, i32 8, i1 false)
  %55 = load %struct.vcstri** %t, align 8
  %56 = getelementptr inbounds %struct.vcstri* %55, i32 0, i32 10
  %57 = bitcast %struct.vector* %56 to i8*
  %58 = bitcast %struct.vector* %n2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %57, i8* %58, i64 24, i32 8, i1 false)
  %59 = load %struct.vcstri_texture** %tex, align 8
  %60 = getelementptr inbounds %struct.vcstri_texture* %59, i32 0, i32 13
  %61 = bitcast %struct.color* %60 to i8*
  %62 = bitcast %struct.color* %c0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %61, i8* %62, i64 12, i32 4, i1 false)
  %63 = load %struct.vcstri_texture** %tex, align 8
  %64 = getelementptr inbounds %struct.vcstri_texture* %63, i32 0, i32 14
  %65 = bitcast %struct.color* %64 to i8*
  %66 = bitcast %struct.color* %c1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %65, i8* %66, i64 12, i32 4, i1 false)
  %67 = load %struct.vcstri_texture** %tex, align 8
  %68 = getelementptr inbounds %struct.vcstri_texture* %67, i32 0, i32 15
  %69 = bitcast %struct.color* %68 to i8*
  %70 = bitcast %struct.color* %c2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %69, i8* %70, i64 12, i32 4, i1 false)
  %71 = load %struct.vcstri** %t, align 8
  %72 = bitcast %struct.vcstri* %71 to i8*
  %73 = load %struct.vcstri_texture** %tex, align 8
  %74 = getelementptr inbounds %struct.vcstri_texture* %73, i32 0, i32 12
  store i8* %72, i8** %74, align 8
  %75 = load %struct.vcstri_texture** %tex, align 8
  %76 = getelementptr inbounds %struct.vcstri_texture* %75, i32 0, i32 0
  store { <2 x float>, float } (i8*, i8*, i8*)* bitcast ({ <2 x float>, float } (%struct.vector*, %struct.texture*, %struct.ray_t*)* @vcstri_color to { <2 x float>, float } (i8*, i8*, i8*)*), { <2 x float>, float } (i8*, i8*, i8*)** %76, align 8
  %77 = load %struct.vcstri_texture** %tex, align 8
  %78 = bitcast %struct.vcstri_texture* %77 to %struct.texture*
  %79 = load %struct.vcstri** %t, align 8
  %80 = getelementptr inbounds %struct.vcstri* %79, i32 0, i32 4
  store %struct.texture* %78, %struct.texture** %80, align 8
  %81 = load %struct.vcstri** %t, align 8
  %82 = bitcast %struct.vcstri* %81 to %struct.object*
  store %struct.object* %82, %struct.object** %1
  br label %84

; <label>:83                                      ; preds = %25, %22, %0
  store %struct.object* null, %struct.object** %1
  br label %84

; <label>:84                                      ; preds = %83, %28
  %85 = load %struct.object** %1
  ret %struct.object* %85
}

; Function Attrs: nounwind uwtable
define { <2 x float>, float } @vcstri_color(%struct.vector* %hit, %struct.texture* %tx, %struct.ray_t* %incident) #0 {
  %1 = alloca %struct.color, align 4
  %2 = alloca %struct.vector*, align 8
  %3 = alloca %struct.texture*, align 8
  %4 = alloca %struct.ray_t*, align 8
  %tex = alloca %struct.vcstri_texture*, align 8
  %trn = alloca %struct.vcstri*, align 8
  %U = alloca double, align 8
  %V = alloca double, align 8
  %W = alloca double, align 8
  %lensqr = alloca double, align 8
  %P = alloca %struct.vector, align 8
  %tmp = alloca %struct.vector, align 8
  %norm = alloca %struct.vector, align 8
  %col = alloca %struct.color, align 4
  %5 = alloca { <2 x float>, float }
  store %struct.vector* %hit, %struct.vector** %2, align 8
  store %struct.texture* %tx, %struct.texture** %3, align 8
  store %struct.ray_t* %incident, %struct.ray_t** %4, align 8
  %6 = load %struct.texture** %3, align 8
  %7 = bitcast %struct.texture* %6 to %struct.vcstri_texture*
  store %struct.vcstri_texture* %7, %struct.vcstri_texture** %tex, align 8
  %8 = load %struct.vcstri_texture** %tex, align 8
  %9 = getelementptr inbounds %struct.vcstri_texture* %8, i32 0, i32 12
  %10 = load i8** %9, align 8
  %11 = bitcast i8* %10 to %struct.vcstri*
  store %struct.vcstri* %11, %struct.vcstri** %trn, align 8
  %12 = load %struct.vcstri** %trn, align 8
  %13 = getelementptr inbounds %struct.vcstri* %12, i32 0, i32 6
  %14 = getelementptr inbounds %struct.vector* %13, i32 0, i32 1
  %15 = load double* %14, align 8
  %16 = load %struct.vcstri** %trn, align 8
  %17 = getelementptr inbounds %struct.vcstri* %16, i32 0, i32 5
  %18 = getelementptr inbounds %struct.vector* %17, i32 0, i32 2
  %19 = load double* %18, align 8
  %20 = fmul double %15, %19
  %21 = load %struct.vcstri** %trn, align 8
  %22 = getelementptr inbounds %struct.vcstri* %21, i32 0, i32 6
  %23 = getelementptr inbounds %struct.vector* %22, i32 0, i32 2
  %24 = load double* %23, align 8
  %25 = load %struct.vcstri** %trn, align 8
  %26 = getelementptr inbounds %struct.vcstri* %25, i32 0, i32 5
  %27 = getelementptr inbounds %struct.vector* %26, i32 0, i32 1
  %28 = load double* %27, align 8
  %29 = fmul double %24, %28
  %30 = fsub double %20, %29
  %31 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 0
  store double %30, double* %31, align 8
  %32 = load %struct.vcstri** %trn, align 8
  %33 = getelementptr inbounds %struct.vcstri* %32, i32 0, i32 6
  %34 = getelementptr inbounds %struct.vector* %33, i32 0, i32 2
  %35 = load double* %34, align 8
  %36 = load %struct.vcstri** %trn, align 8
  %37 = getelementptr inbounds %struct.vcstri* %36, i32 0, i32 5
  %38 = getelementptr inbounds %struct.vector* %37, i32 0, i32 0
  %39 = load double* %38, align 8
  %40 = fmul double %35, %39
  %41 = load %struct.vcstri** %trn, align 8
  %42 = getelementptr inbounds %struct.vcstri* %41, i32 0, i32 6
  %43 = getelementptr inbounds %struct.vector* %42, i32 0, i32 0
  %44 = load double* %43, align 8
  %45 = load %struct.vcstri** %trn, align 8
  %46 = getelementptr inbounds %struct.vcstri* %45, i32 0, i32 5
  %47 = getelementptr inbounds %struct.vector* %46, i32 0, i32 2
  %48 = load double* %47, align 8
  %49 = fmul double %44, %48
  %50 = fsub double %40, %49
  %51 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 1
  store double %50, double* %51, align 8
  %52 = load %struct.vcstri** %trn, align 8
  %53 = getelementptr inbounds %struct.vcstri* %52, i32 0, i32 6
  %54 = getelementptr inbounds %struct.vector* %53, i32 0, i32 0
  %55 = load double* %54, align 8
  %56 = load %struct.vcstri** %trn, align 8
  %57 = getelementptr inbounds %struct.vcstri* %56, i32 0, i32 5
  %58 = getelementptr inbounds %struct.vector* %57, i32 0, i32 1
  %59 = load double* %58, align 8
  %60 = fmul double %55, %59
  %61 = load %struct.vcstri** %trn, align 8
  %62 = getelementptr inbounds %struct.vcstri* %61, i32 0, i32 6
  %63 = getelementptr inbounds %struct.vector* %62, i32 0, i32 1
  %64 = load double* %63, align 8
  %65 = load %struct.vcstri** %trn, align 8
  %66 = getelementptr inbounds %struct.vcstri* %65, i32 0, i32 5
  %67 = getelementptr inbounds %struct.vector* %66, i32 0, i32 0
  %68 = load double* %67, align 8
  %69 = fmul double %64, %68
  %70 = fsub double %60, %69
  %71 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 2
  store double %70, double* %71, align 8
  %72 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 0
  %73 = load double* %72, align 8
  %74 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 0
  %75 = load double* %74, align 8
  %76 = fmul double %73, %75
  %77 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 1
  %78 = load double* %77, align 8
  %79 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 1
  %80 = load double* %79, align 8
  %81 = fmul double %78, %80
  %82 = fadd double %76, %81
  %83 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 2
  %84 = load double* %83, align 8
  %85 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 2
  %86 = load double* %85, align 8
  %87 = fmul double %84, %86
  %88 = fadd double %82, %87
  store double %88, double* %lensqr, align 8
  %89 = load %struct.vector** %2, align 8
  %90 = getelementptr inbounds %struct.vector* %89, i32 0, i32 0
  %91 = load double* %90, align 8
  %92 = load %struct.vcstri** %trn, align 8
  %93 = getelementptr inbounds %struct.vcstri* %92, i32 0, i32 7
  %94 = getelementptr inbounds %struct.vector* %93, i32 0, i32 0
  %95 = load double* %94, align 8
  %96 = fsub double %91, %95
  %97 = getelementptr inbounds %struct.vector* %P, i32 0, i32 0
  store double %96, double* %97, align 8
  %98 = load %struct.vector** %2, align 8
  %99 = getelementptr inbounds %struct.vector* %98, i32 0, i32 1
  %100 = load double* %99, align 8
  %101 = load %struct.vcstri** %trn, align 8
  %102 = getelementptr inbounds %struct.vcstri* %101, i32 0, i32 7
  %103 = getelementptr inbounds %struct.vector* %102, i32 0, i32 1
  %104 = load double* %103, align 8
  %105 = fsub double %100, %104
  %106 = getelementptr inbounds %struct.vector* %P, i32 0, i32 1
  store double %105, double* %106, align 8
  %107 = load %struct.vector** %2, align 8
  %108 = getelementptr inbounds %struct.vector* %107, i32 0, i32 2
  %109 = load double* %108, align 8
  %110 = load %struct.vcstri** %trn, align 8
  %111 = getelementptr inbounds %struct.vcstri* %110, i32 0, i32 7
  %112 = getelementptr inbounds %struct.vector* %111, i32 0, i32 2
  %113 = load double* %112, align 8
  %114 = fsub double %109, %113
  %115 = getelementptr inbounds %struct.vector* %P, i32 0, i32 2
  store double %114, double* %115, align 8
  %116 = getelementptr inbounds %struct.vector* %P, i32 0, i32 1
  %117 = load double* %116, align 8
  %118 = load %struct.vcstri** %trn, align 8
  %119 = getelementptr inbounds %struct.vcstri* %118, i32 0, i32 5
  %120 = getelementptr inbounds %struct.vector* %119, i32 0, i32 2
  %121 = load double* %120, align 8
  %122 = fmul double %117, %121
  %123 = getelementptr inbounds %struct.vector* %P, i32 0, i32 2
  %124 = load double* %123, align 8
  %125 = load %struct.vcstri** %trn, align 8
  %126 = getelementptr inbounds %struct.vcstri* %125, i32 0, i32 5
  %127 = getelementptr inbounds %struct.vector* %126, i32 0, i32 1
  %128 = load double* %127, align 8
  %129 = fmul double %124, %128
  %130 = fsub double %122, %129
  %131 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 0
  store double %130, double* %131, align 8
  %132 = getelementptr inbounds %struct.vector* %P, i32 0, i32 2
  %133 = load double* %132, align 8
  %134 = load %struct.vcstri** %trn, align 8
  %135 = getelementptr inbounds %struct.vcstri* %134, i32 0, i32 5
  %136 = getelementptr inbounds %struct.vector* %135, i32 0, i32 0
  %137 = load double* %136, align 8
  %138 = fmul double %133, %137
  %139 = getelementptr inbounds %struct.vector* %P, i32 0, i32 0
  %140 = load double* %139, align 8
  %141 = load %struct.vcstri** %trn, align 8
  %142 = getelementptr inbounds %struct.vcstri* %141, i32 0, i32 5
  %143 = getelementptr inbounds %struct.vector* %142, i32 0, i32 2
  %144 = load double* %143, align 8
  %145 = fmul double %140, %144
  %146 = fsub double %138, %145
  %147 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 1
  store double %146, double* %147, align 8
  %148 = getelementptr inbounds %struct.vector* %P, i32 0, i32 0
  %149 = load double* %148, align 8
  %150 = load %struct.vcstri** %trn, align 8
  %151 = getelementptr inbounds %struct.vcstri* %150, i32 0, i32 5
  %152 = getelementptr inbounds %struct.vector* %151, i32 0, i32 1
  %153 = load double* %152, align 8
  %154 = fmul double %149, %153
  %155 = getelementptr inbounds %struct.vector* %P, i32 0, i32 1
  %156 = load double* %155, align 8
  %157 = load %struct.vcstri** %trn, align 8
  %158 = getelementptr inbounds %struct.vcstri* %157, i32 0, i32 5
  %159 = getelementptr inbounds %struct.vector* %158, i32 0, i32 0
  %160 = load double* %159, align 8
  %161 = fmul double %156, %160
  %162 = fsub double %154, %161
  %163 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 2
  store double %162, double* %163, align 8
  %164 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 0
  %165 = load double* %164, align 8
  %166 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 0
  %167 = load double* %166, align 8
  %168 = fmul double %165, %167
  %169 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 1
  %170 = load double* %169, align 8
  %171 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 1
  %172 = load double* %171, align 8
  %173 = fmul double %170, %172
  %174 = fadd double %168, %173
  %175 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 2
  %176 = load double* %175, align 8
  %177 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 2
  %178 = load double* %177, align 8
  %179 = fmul double %176, %178
  %180 = fadd double %174, %179
  %181 = load double* %lensqr, align 8
  %182 = fdiv double %180, %181
  store double %182, double* %U, align 8
  %183 = load %struct.vcstri** %trn, align 8
  %184 = getelementptr inbounds %struct.vcstri* %183, i32 0, i32 6
  %185 = getelementptr inbounds %struct.vector* %184, i32 0, i32 1
  %186 = load double* %185, align 8
  %187 = getelementptr inbounds %struct.vector* %P, i32 0, i32 2
  %188 = load double* %187, align 8
  %189 = fmul double %186, %188
  %190 = load %struct.vcstri** %trn, align 8
  %191 = getelementptr inbounds %struct.vcstri* %190, i32 0, i32 6
  %192 = getelementptr inbounds %struct.vector* %191, i32 0, i32 2
  %193 = load double* %192, align 8
  %194 = getelementptr inbounds %struct.vector* %P, i32 0, i32 1
  %195 = load double* %194, align 8
  %196 = fmul double %193, %195
  %197 = fsub double %189, %196
  %198 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 0
  store double %197, double* %198, align 8
  %199 = load %struct.vcstri** %trn, align 8
  %200 = getelementptr inbounds %struct.vcstri* %199, i32 0, i32 6
  %201 = getelementptr inbounds %struct.vector* %200, i32 0, i32 2
  %202 = load double* %201, align 8
  %203 = getelementptr inbounds %struct.vector* %P, i32 0, i32 0
  %204 = load double* %203, align 8
  %205 = fmul double %202, %204
  %206 = load %struct.vcstri** %trn, align 8
  %207 = getelementptr inbounds %struct.vcstri* %206, i32 0, i32 6
  %208 = getelementptr inbounds %struct.vector* %207, i32 0, i32 0
  %209 = load double* %208, align 8
  %210 = getelementptr inbounds %struct.vector* %P, i32 0, i32 2
  %211 = load double* %210, align 8
  %212 = fmul double %209, %211
  %213 = fsub double %205, %212
  %214 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 1
  store double %213, double* %214, align 8
  %215 = load %struct.vcstri** %trn, align 8
  %216 = getelementptr inbounds %struct.vcstri* %215, i32 0, i32 6
  %217 = getelementptr inbounds %struct.vector* %216, i32 0, i32 0
  %218 = load double* %217, align 8
  %219 = getelementptr inbounds %struct.vector* %P, i32 0, i32 1
  %220 = load double* %219, align 8
  %221 = fmul double %218, %220
  %222 = load %struct.vcstri** %trn, align 8
  %223 = getelementptr inbounds %struct.vcstri* %222, i32 0, i32 6
  %224 = getelementptr inbounds %struct.vector* %223, i32 0, i32 1
  %225 = load double* %224, align 8
  %226 = getelementptr inbounds %struct.vector* %P, i32 0, i32 0
  %227 = load double* %226, align 8
  %228 = fmul double %225, %227
  %229 = fsub double %221, %228
  %230 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 2
  store double %229, double* %230, align 8
  %231 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 0
  %232 = load double* %231, align 8
  %233 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 0
  %234 = load double* %233, align 8
  %235 = fmul double %232, %234
  %236 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 1
  %237 = load double* %236, align 8
  %238 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 1
  %239 = load double* %238, align 8
  %240 = fmul double %237, %239
  %241 = fadd double %235, %240
  %242 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 2
  %243 = load double* %242, align 8
  %244 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 2
  %245 = load double* %244, align 8
  %246 = fmul double %243, %245
  %247 = fadd double %241, %246
  %248 = load double* %lensqr, align 8
  %249 = fdiv double %247, %248
  store double %249, double* %V, align 8
  %250 = load double* %U, align 8
  %251 = load double* %V, align 8
  %252 = fadd double %250, %251
  %253 = fsub double 1.000000e+00, %252
  store double %253, double* %W, align 8
  %254 = load double* %W, align 8
  %255 = load %struct.vcstri_texture** %tex, align 8
  %256 = getelementptr inbounds %struct.vcstri_texture* %255, i32 0, i32 13
  %257 = getelementptr inbounds %struct.color* %256, i32 0, i32 0
  %258 = load float* %257, align 4
  %259 = fpext float %258 to double
  %260 = fmul double %254, %259
  %261 = load double* %U, align 8
  %262 = load %struct.vcstri_texture** %tex, align 8
  %263 = getelementptr inbounds %struct.vcstri_texture* %262, i32 0, i32 14
  %264 = getelementptr inbounds %struct.color* %263, i32 0, i32 0
  %265 = load float* %264, align 4
  %266 = fpext float %265 to double
  %267 = fmul double %261, %266
  %268 = fadd double %260, %267
  %269 = load double* %V, align 8
  %270 = load %struct.vcstri_texture** %tex, align 8
  %271 = getelementptr inbounds %struct.vcstri_texture* %270, i32 0, i32 15
  %272 = getelementptr inbounds %struct.color* %271, i32 0, i32 0
  %273 = load float* %272, align 4
  %274 = fpext float %273 to double
  %275 = fmul double %269, %274
  %276 = fadd double %268, %275
  %277 = fptrunc double %276 to float
  %278 = getelementptr inbounds %struct.color* %col, i32 0, i32 0
  store float %277, float* %278, align 4
  %279 = load double* %W, align 8
  %280 = load %struct.vcstri_texture** %tex, align 8
  %281 = getelementptr inbounds %struct.vcstri_texture* %280, i32 0, i32 13
  %282 = getelementptr inbounds %struct.color* %281, i32 0, i32 1
  %283 = load float* %282, align 4
  %284 = fpext float %283 to double
  %285 = fmul double %279, %284
  %286 = load double* %U, align 8
  %287 = load %struct.vcstri_texture** %tex, align 8
  %288 = getelementptr inbounds %struct.vcstri_texture* %287, i32 0, i32 14
  %289 = getelementptr inbounds %struct.color* %288, i32 0, i32 1
  %290 = load float* %289, align 4
  %291 = fpext float %290 to double
  %292 = fmul double %286, %291
  %293 = fadd double %285, %292
  %294 = load double* %V, align 8
  %295 = load %struct.vcstri_texture** %tex, align 8
  %296 = getelementptr inbounds %struct.vcstri_texture* %295, i32 0, i32 15
  %297 = getelementptr inbounds %struct.color* %296, i32 0, i32 1
  %298 = load float* %297, align 4
  %299 = fpext float %298 to double
  %300 = fmul double %294, %299
  %301 = fadd double %293, %300
  %302 = fptrunc double %301 to float
  %303 = getelementptr inbounds %struct.color* %col, i32 0, i32 1
  store float %302, float* %303, align 4
  %304 = load double* %W, align 8
  %305 = load %struct.vcstri_texture** %tex, align 8
  %306 = getelementptr inbounds %struct.vcstri_texture* %305, i32 0, i32 13
  %307 = getelementptr inbounds %struct.color* %306, i32 0, i32 2
  %308 = load float* %307, align 4
  %309 = fpext float %308 to double
  %310 = fmul double %304, %309
  %311 = load double* %U, align 8
  %312 = load %struct.vcstri_texture** %tex, align 8
  %313 = getelementptr inbounds %struct.vcstri_texture* %312, i32 0, i32 14
  %314 = getelementptr inbounds %struct.color* %313, i32 0, i32 2
  %315 = load float* %314, align 4
  %316 = fpext float %315 to double
  %317 = fmul double %311, %316
  %318 = fadd double %310, %317
  %319 = load double* %V, align 8
  %320 = load %struct.vcstri_texture** %tex, align 8
  %321 = getelementptr inbounds %struct.vcstri_texture* %320, i32 0, i32 15
  %322 = getelementptr inbounds %struct.color* %321, i32 0, i32 2
  %323 = load float* %322, align 4
  %324 = fpext float %323 to double
  %325 = fmul double %319, %324
  %326 = fadd double %318, %325
  %327 = fptrunc double %326 to float
  %328 = getelementptr inbounds %struct.color* %col, i32 0, i32 2
  store float %327, float* %328, align 4
  %329 = bitcast %struct.color* %1 to i8*
  %330 = bitcast %struct.color* %col to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %329, i8* %330, i64 12, i32 4, i1 false)
  %331 = bitcast { <2 x float>, float }* %5 to i8*
  %332 = bitcast %struct.color* %1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %331, i8* %332, i64 12, i32 1, i1 false)
  %333 = load { <2 x float>, float }* %5
  ret { <2 x float>, float } %333
}

; Function Attrs: nounwind uwtable
define void @vcstri_normal_fixup(%struct.object* %otri, i32 %mode) #0 {
  %1 = alloca %struct.object*, align 8
  %2 = alloca i32, align 4
  %t = alloca %struct.vcstri*, align 8
  store %struct.object* %otri, %struct.object** %1, align 8
  store i32 %mode, i32* %2, align 4
  %3 = load %struct.object** %1, align 8
  %4 = bitcast %struct.object* %3 to %struct.vcstri*
  store %struct.vcstri* %4, %struct.vcstri** %t, align 8
  %5 = load i32* %2, align 4
  switch i32 %5, label %13 [
    i32 2, label %6
    i32 1, label %9
    i32 0, label %12
  ]

; <label>:6                                       ; preds = %0
  %7 = load %struct.vcstri** %t, align 8
  %8 = getelementptr inbounds %struct.vcstri* %7, i32 0, i32 2
  store %struct.object_methods* @stri_methods_guess, %struct.object_methods** %8, align 8
  br label %16

; <label>:9                                       ; preds = %0
  %10 = load %struct.vcstri** %t, align 8
  %11 = getelementptr inbounds %struct.vcstri* %10, i32 0, i32 2
  store %struct.object_methods* @stri_methods_reverse, %struct.object_methods** %11, align 8
  br label %16

; <label>:12                                      ; preds = %0
  br label %13

; <label>:13                                      ; preds = %0, %12
  %14 = load %struct.vcstri** %t, align 8
  %15 = getelementptr inbounds %struct.vcstri* %14, i32 0, i32 2
  store %struct.object_methods* @stri_methods, %struct.object_methods** %15, align 8
  br label %16

; <label>:16                                      ; preds = %13, %9, %6
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @tri_intersect(%struct.tri* %trn, %struct.ray_t* %ry) #0 {
  %1 = alloca %struct.tri*, align 8
  %2 = alloca %struct.ray_t*, align 8
  %tvec = alloca %struct.vector, align 8
  %pvec = alloca %struct.vector, align 8
  %qvec = alloca %struct.vector, align 8
  %det = alloca double, align 8
  %inv_det = alloca double, align 8
  %t = alloca double, align 8
  %u = alloca double, align 8
  %v = alloca double, align 8
  store %struct.tri* %trn, %struct.tri** %1, align 8
  store %struct.ray_t* %ry, %struct.ray_t** %2, align 8
  %3 = load %struct.ray_t** %2, align 8
  %4 = getelementptr inbounds %struct.ray_t* %3, i32 0, i32 1
  %5 = getelementptr inbounds %struct.vector* %4, i32 0, i32 1
  %6 = load double* %5, align 8
  %7 = load %struct.tri** %1, align 8
  %8 = getelementptr inbounds %struct.tri* %7, i32 0, i32 5
  %9 = getelementptr inbounds %struct.vector* %8, i32 0, i32 2
  %10 = load double* %9, align 8
  %11 = fmul double %6, %10
  %12 = load %struct.ray_t** %2, align 8
  %13 = getelementptr inbounds %struct.ray_t* %12, i32 0, i32 1
  %14 = getelementptr inbounds %struct.vector* %13, i32 0, i32 2
  %15 = load double* %14, align 8
  %16 = load %struct.tri** %1, align 8
  %17 = getelementptr inbounds %struct.tri* %16, i32 0, i32 5
  %18 = getelementptr inbounds %struct.vector* %17, i32 0, i32 1
  %19 = load double* %18, align 8
  %20 = fmul double %15, %19
  %21 = fsub double %11, %20
  %22 = getelementptr inbounds %struct.vector* %pvec, i32 0, i32 0
  store double %21, double* %22, align 8
  %23 = load %struct.ray_t** %2, align 8
  %24 = getelementptr inbounds %struct.ray_t* %23, i32 0, i32 1
  %25 = getelementptr inbounds %struct.vector* %24, i32 0, i32 2
  %26 = load double* %25, align 8
  %27 = load %struct.tri** %1, align 8
  %28 = getelementptr inbounds %struct.tri* %27, i32 0, i32 5
  %29 = getelementptr inbounds %struct.vector* %28, i32 0, i32 0
  %30 = load double* %29, align 8
  %31 = fmul double %26, %30
  %32 = load %struct.ray_t** %2, align 8
  %33 = getelementptr inbounds %struct.ray_t* %32, i32 0, i32 1
  %34 = getelementptr inbounds %struct.vector* %33, i32 0, i32 0
  %35 = load double* %34, align 8
  %36 = load %struct.tri** %1, align 8
  %37 = getelementptr inbounds %struct.tri* %36, i32 0, i32 5
  %38 = getelementptr inbounds %struct.vector* %37, i32 0, i32 2
  %39 = load double* %38, align 8
  %40 = fmul double %35, %39
  %41 = fsub double %31, %40
  %42 = getelementptr inbounds %struct.vector* %pvec, i32 0, i32 1
  store double %41, double* %42, align 8
  %43 = load %struct.ray_t** %2, align 8
  %44 = getelementptr inbounds %struct.ray_t* %43, i32 0, i32 1
  %45 = getelementptr inbounds %struct.vector* %44, i32 0, i32 0
  %46 = load double* %45, align 8
  %47 = load %struct.tri** %1, align 8
  %48 = getelementptr inbounds %struct.tri* %47, i32 0, i32 5
  %49 = getelementptr inbounds %struct.vector* %48, i32 0, i32 1
  %50 = load double* %49, align 8
  %51 = fmul double %46, %50
  %52 = load %struct.ray_t** %2, align 8
  %53 = getelementptr inbounds %struct.ray_t* %52, i32 0, i32 1
  %54 = getelementptr inbounds %struct.vector* %53, i32 0, i32 1
  %55 = load double* %54, align 8
  %56 = load %struct.tri** %1, align 8
  %57 = getelementptr inbounds %struct.tri* %56, i32 0, i32 5
  %58 = getelementptr inbounds %struct.vector* %57, i32 0, i32 0
  %59 = load double* %58, align 8
  %60 = fmul double %55, %59
  %61 = fsub double %51, %60
  %62 = getelementptr inbounds %struct.vector* %pvec, i32 0, i32 2
  store double %61, double* %62, align 8
  %63 = load %struct.tri** %1, align 8
  %64 = getelementptr inbounds %struct.tri* %63, i32 0, i32 6
  %65 = getelementptr inbounds %struct.vector* %64, i32 0, i32 0
  %66 = load double* %65, align 8
  %67 = getelementptr inbounds %struct.vector* %pvec, i32 0, i32 0
  %68 = load double* %67, align 8
  %69 = fmul double %66, %68
  %70 = load %struct.tri** %1, align 8
  %71 = getelementptr inbounds %struct.tri* %70, i32 0, i32 6
  %72 = getelementptr inbounds %struct.vector* %71, i32 0, i32 1
  %73 = load double* %72, align 8
  %74 = getelementptr inbounds %struct.vector* %pvec, i32 0, i32 1
  %75 = load double* %74, align 8
  %76 = fmul double %73, %75
  %77 = fadd double %69, %76
  %78 = load %struct.tri** %1, align 8
  %79 = getelementptr inbounds %struct.tri* %78, i32 0, i32 6
  %80 = getelementptr inbounds %struct.vector* %79, i32 0, i32 2
  %81 = load double* %80, align 8
  %82 = getelementptr inbounds %struct.vector* %pvec, i32 0, i32 2
  %83 = load double* %82, align 8
  %84 = fmul double %81, %83
  %85 = fadd double %77, %84
  store double %85, double* %det, align 8
  %86 = load double* %det, align 8
  %87 = fcmp ogt double %86, -5.000000e-08
  br i1 %87, label %88, label %92

; <label>:88                                      ; preds = %0
  %89 = load double* %det, align 8
  %90 = fcmp olt double %89, 5.000000e-08
  br i1 %90, label %91, label %92

; <label>:91                                      ; preds = %88
  br label %265

; <label>:92                                      ; preds = %88, %0
  %93 = load double* %det, align 8
  %94 = fdiv double 1.000000e+00, %93
  store double %94, double* %inv_det, align 8
  %95 = load %struct.ray_t** %2, align 8
  %96 = getelementptr inbounds %struct.ray_t* %95, i32 0, i32 0
  %97 = getelementptr inbounds %struct.vector* %96, i32 0, i32 0
  %98 = load double* %97, align 8
  %99 = load %struct.tri** %1, align 8
  %100 = getelementptr inbounds %struct.tri* %99, i32 0, i32 7
  %101 = getelementptr inbounds %struct.vector* %100, i32 0, i32 0
  %102 = load double* %101, align 8
  %103 = fsub double %98, %102
  %104 = getelementptr inbounds %struct.vector* %tvec, i32 0, i32 0
  store double %103, double* %104, align 8
  %105 = load %struct.ray_t** %2, align 8
  %106 = getelementptr inbounds %struct.ray_t* %105, i32 0, i32 0
  %107 = getelementptr inbounds %struct.vector* %106, i32 0, i32 1
  %108 = load double* %107, align 8
  %109 = load %struct.tri** %1, align 8
  %110 = getelementptr inbounds %struct.tri* %109, i32 0, i32 7
  %111 = getelementptr inbounds %struct.vector* %110, i32 0, i32 1
  %112 = load double* %111, align 8
  %113 = fsub double %108, %112
  %114 = getelementptr inbounds %struct.vector* %tvec, i32 0, i32 1
  store double %113, double* %114, align 8
  %115 = load %struct.ray_t** %2, align 8
  %116 = getelementptr inbounds %struct.ray_t* %115, i32 0, i32 0
  %117 = getelementptr inbounds %struct.vector* %116, i32 0, i32 2
  %118 = load double* %117, align 8
  %119 = load %struct.tri** %1, align 8
  %120 = getelementptr inbounds %struct.tri* %119, i32 0, i32 7
  %121 = getelementptr inbounds %struct.vector* %120, i32 0, i32 2
  %122 = load double* %121, align 8
  %123 = fsub double %118, %122
  %124 = getelementptr inbounds %struct.vector* %tvec, i32 0, i32 2
  store double %123, double* %124, align 8
  %125 = getelementptr inbounds %struct.vector* %tvec, i32 0, i32 0
  %126 = load double* %125, align 8
  %127 = getelementptr inbounds %struct.vector* %pvec, i32 0, i32 0
  %128 = load double* %127, align 8
  %129 = fmul double %126, %128
  %130 = getelementptr inbounds %struct.vector* %tvec, i32 0, i32 1
  %131 = load double* %130, align 8
  %132 = getelementptr inbounds %struct.vector* %pvec, i32 0, i32 1
  %133 = load double* %132, align 8
  %134 = fmul double %131, %133
  %135 = fadd double %129, %134
  %136 = getelementptr inbounds %struct.vector* %tvec, i32 0, i32 2
  %137 = load double* %136, align 8
  %138 = getelementptr inbounds %struct.vector* %pvec, i32 0, i32 2
  %139 = load double* %138, align 8
  %140 = fmul double %137, %139
  %141 = fadd double %135, %140
  %142 = load double* %inv_det, align 8
  %143 = fmul double %141, %142
  store double %143, double* %u, align 8
  %144 = load double* %u, align 8
  %145 = fcmp olt double %144, 0.000000e+00
  br i1 %145, label %149, label %146

; <label>:146                                     ; preds = %92
  %147 = load double* %u, align 8
  %148 = fcmp ogt double %147, 1.000000e+00
  br i1 %148, label %149, label %150

; <label>:149                                     ; preds = %146, %92
  br label %265

; <label>:150                                     ; preds = %146
  %151 = getelementptr inbounds %struct.vector* %tvec, i32 0, i32 1
  %152 = load double* %151, align 8
  %153 = load %struct.tri** %1, align 8
  %154 = getelementptr inbounds %struct.tri* %153, i32 0, i32 6
  %155 = getelementptr inbounds %struct.vector* %154, i32 0, i32 2
  %156 = load double* %155, align 8
  %157 = fmul double %152, %156
  %158 = getelementptr inbounds %struct.vector* %tvec, i32 0, i32 2
  %159 = load double* %158, align 8
  %160 = load %struct.tri** %1, align 8
  %161 = getelementptr inbounds %struct.tri* %160, i32 0, i32 6
  %162 = getelementptr inbounds %struct.vector* %161, i32 0, i32 1
  %163 = load double* %162, align 8
  %164 = fmul double %159, %163
  %165 = fsub double %157, %164
  %166 = getelementptr inbounds %struct.vector* %qvec, i32 0, i32 0
  store double %165, double* %166, align 8
  %167 = getelementptr inbounds %struct.vector* %tvec, i32 0, i32 2
  %168 = load double* %167, align 8
  %169 = load %struct.tri** %1, align 8
  %170 = getelementptr inbounds %struct.tri* %169, i32 0, i32 6
  %171 = getelementptr inbounds %struct.vector* %170, i32 0, i32 0
  %172 = load double* %171, align 8
  %173 = fmul double %168, %172
  %174 = getelementptr inbounds %struct.vector* %tvec, i32 0, i32 0
  %175 = load double* %174, align 8
  %176 = load %struct.tri** %1, align 8
  %177 = getelementptr inbounds %struct.tri* %176, i32 0, i32 6
  %178 = getelementptr inbounds %struct.vector* %177, i32 0, i32 2
  %179 = load double* %178, align 8
  %180 = fmul double %175, %179
  %181 = fsub double %173, %180
  %182 = getelementptr inbounds %struct.vector* %qvec, i32 0, i32 1
  store double %181, double* %182, align 8
  %183 = getelementptr inbounds %struct.vector* %tvec, i32 0, i32 0
  %184 = load double* %183, align 8
  %185 = load %struct.tri** %1, align 8
  %186 = getelementptr inbounds %struct.tri* %185, i32 0, i32 6
  %187 = getelementptr inbounds %struct.vector* %186, i32 0, i32 1
  %188 = load double* %187, align 8
  %189 = fmul double %184, %188
  %190 = getelementptr inbounds %struct.vector* %tvec, i32 0, i32 1
  %191 = load double* %190, align 8
  %192 = load %struct.tri** %1, align 8
  %193 = getelementptr inbounds %struct.tri* %192, i32 0, i32 6
  %194 = getelementptr inbounds %struct.vector* %193, i32 0, i32 0
  %195 = load double* %194, align 8
  %196 = fmul double %191, %195
  %197 = fsub double %189, %196
  %198 = getelementptr inbounds %struct.vector* %qvec, i32 0, i32 2
  store double %197, double* %198, align 8
  %199 = load %struct.ray_t** %2, align 8
  %200 = getelementptr inbounds %struct.ray_t* %199, i32 0, i32 1
  %201 = getelementptr inbounds %struct.vector* %200, i32 0, i32 0
  %202 = load double* %201, align 8
  %203 = getelementptr inbounds %struct.vector* %qvec, i32 0, i32 0
  %204 = load double* %203, align 8
  %205 = fmul double %202, %204
  %206 = load %struct.ray_t** %2, align 8
  %207 = getelementptr inbounds %struct.ray_t* %206, i32 0, i32 1
  %208 = getelementptr inbounds %struct.vector* %207, i32 0, i32 1
  %209 = load double* %208, align 8
  %210 = getelementptr inbounds %struct.vector* %qvec, i32 0, i32 1
  %211 = load double* %210, align 8
  %212 = fmul double %209, %211
  %213 = fadd double %205, %212
  %214 = load %struct.ray_t** %2, align 8
  %215 = getelementptr inbounds %struct.ray_t* %214, i32 0, i32 1
  %216 = getelementptr inbounds %struct.vector* %215, i32 0, i32 2
  %217 = load double* %216, align 8
  %218 = getelementptr inbounds %struct.vector* %qvec, i32 0, i32 2
  %219 = load double* %218, align 8
  %220 = fmul double %217, %219
  %221 = fadd double %213, %220
  %222 = load double* %inv_det, align 8
  %223 = fmul double %221, %222
  store double %223, double* %v, align 8
  %224 = load double* %v, align 8
  %225 = fcmp olt double %224, 0.000000e+00
  br i1 %225, label %231, label %226

; <label>:226                                     ; preds = %150
  %227 = load double* %u, align 8
  %228 = load double* %v, align 8
  %229 = fadd double %227, %228
  %230 = fcmp ogt double %229, 1.000000e+00
  br i1 %230, label %231, label %232

; <label>:231                                     ; preds = %226, %150
  br label %265

; <label>:232                                     ; preds = %226
  %233 = load %struct.tri** %1, align 8
  %234 = getelementptr inbounds %struct.tri* %233, i32 0, i32 5
  %235 = getelementptr inbounds %struct.vector* %234, i32 0, i32 0
  %236 = load double* %235, align 8
  %237 = getelementptr inbounds %struct.vector* %qvec, i32 0, i32 0
  %238 = load double* %237, align 8
  %239 = fmul double %236, %238
  %240 = load %struct.tri** %1, align 8
  %241 = getelementptr inbounds %struct.tri* %240, i32 0, i32 5
  %242 = getelementptr inbounds %struct.vector* %241, i32 0, i32 1
  %243 = load double* %242, align 8
  %244 = getelementptr inbounds %struct.vector* %qvec, i32 0, i32 1
  %245 = load double* %244, align 8
  %246 = fmul double %243, %245
  %247 = fadd double %239, %246
  %248 = load %struct.tri** %1, align 8
  %249 = getelementptr inbounds %struct.tri* %248, i32 0, i32 5
  %250 = getelementptr inbounds %struct.vector* %249, i32 0, i32 2
  %251 = load double* %250, align 8
  %252 = getelementptr inbounds %struct.vector* %qvec, i32 0, i32 2
  %253 = load double* %252, align 8
  %254 = fmul double %251, %253
  %255 = fadd double %247, %254
  %256 = load double* %inv_det, align 8
  %257 = fmul double %255, %256
  store double %257, double* %t, align 8
  %258 = load %struct.ray_t** %2, align 8
  %259 = getelementptr inbounds %struct.ray_t* %258, i32 0, i32 4
  %260 = load void (double, %struct.object*, %struct.ray_t*)** %259, align 8
  %261 = load double* %t, align 8
  %262 = load %struct.tri** %1, align 8
  %263 = bitcast %struct.tri* %262 to %struct.object*
  %264 = load %struct.ray_t** %2, align 8
  call void %260(double %261, %struct.object* %263, %struct.ray_t* %264)
  br label %265

; <label>:265                                     ; preds = %232, %231, %149, %91
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @stri_normal_reverse(%struct.stri* %trn, %struct.vector* %hit, %struct.ray_t* %incident, %struct.vector* %N) #0 {
  %1 = alloca %struct.stri*, align 8
  %2 = alloca %struct.vector*, align 8
  %3 = alloca %struct.ray_t*, align 8
  %4 = alloca %struct.vector*, align 8
  %U = alloca double, align 8
  %V = alloca double, align 8
  %W = alloca double, align 8
  %lensqr = alloca double, align 8
  %invlen = alloca double, align 8
  %P = alloca %struct.vector, align 8
  %tmp = alloca %struct.vector, align 8
  %norm = alloca %struct.vector, align 8
  store %struct.stri* %trn, %struct.stri** %1, align 8
  store %struct.vector* %hit, %struct.vector** %2, align 8
  store %struct.ray_t* %incident, %struct.ray_t** %3, align 8
  store %struct.vector* %N, %struct.vector** %4, align 8
  %5 = load %struct.stri** %1, align 8
  %6 = getelementptr inbounds %struct.stri* %5, i32 0, i32 6
  %7 = getelementptr inbounds %struct.vector* %6, i32 0, i32 1
  %8 = load double* %7, align 8
  %9 = load %struct.stri** %1, align 8
  %10 = getelementptr inbounds %struct.stri* %9, i32 0, i32 5
  %11 = getelementptr inbounds %struct.vector* %10, i32 0, i32 2
  %12 = load double* %11, align 8
  %13 = fmul double %8, %12
  %14 = load %struct.stri** %1, align 8
  %15 = getelementptr inbounds %struct.stri* %14, i32 0, i32 6
  %16 = getelementptr inbounds %struct.vector* %15, i32 0, i32 2
  %17 = load double* %16, align 8
  %18 = load %struct.stri** %1, align 8
  %19 = getelementptr inbounds %struct.stri* %18, i32 0, i32 5
  %20 = getelementptr inbounds %struct.vector* %19, i32 0, i32 1
  %21 = load double* %20, align 8
  %22 = fmul double %17, %21
  %23 = fsub double %13, %22
  %24 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 0
  store double %23, double* %24, align 8
  %25 = load %struct.stri** %1, align 8
  %26 = getelementptr inbounds %struct.stri* %25, i32 0, i32 6
  %27 = getelementptr inbounds %struct.vector* %26, i32 0, i32 2
  %28 = load double* %27, align 8
  %29 = load %struct.stri** %1, align 8
  %30 = getelementptr inbounds %struct.stri* %29, i32 0, i32 5
  %31 = getelementptr inbounds %struct.vector* %30, i32 0, i32 0
  %32 = load double* %31, align 8
  %33 = fmul double %28, %32
  %34 = load %struct.stri** %1, align 8
  %35 = getelementptr inbounds %struct.stri* %34, i32 0, i32 6
  %36 = getelementptr inbounds %struct.vector* %35, i32 0, i32 0
  %37 = load double* %36, align 8
  %38 = load %struct.stri** %1, align 8
  %39 = getelementptr inbounds %struct.stri* %38, i32 0, i32 5
  %40 = getelementptr inbounds %struct.vector* %39, i32 0, i32 2
  %41 = load double* %40, align 8
  %42 = fmul double %37, %41
  %43 = fsub double %33, %42
  %44 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 1
  store double %43, double* %44, align 8
  %45 = load %struct.stri** %1, align 8
  %46 = getelementptr inbounds %struct.stri* %45, i32 0, i32 6
  %47 = getelementptr inbounds %struct.vector* %46, i32 0, i32 0
  %48 = load double* %47, align 8
  %49 = load %struct.stri** %1, align 8
  %50 = getelementptr inbounds %struct.stri* %49, i32 0, i32 5
  %51 = getelementptr inbounds %struct.vector* %50, i32 0, i32 1
  %52 = load double* %51, align 8
  %53 = fmul double %48, %52
  %54 = load %struct.stri** %1, align 8
  %55 = getelementptr inbounds %struct.stri* %54, i32 0, i32 6
  %56 = getelementptr inbounds %struct.vector* %55, i32 0, i32 1
  %57 = load double* %56, align 8
  %58 = load %struct.stri** %1, align 8
  %59 = getelementptr inbounds %struct.stri* %58, i32 0, i32 5
  %60 = getelementptr inbounds %struct.vector* %59, i32 0, i32 0
  %61 = load double* %60, align 8
  %62 = fmul double %57, %61
  %63 = fsub double %53, %62
  %64 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 2
  store double %63, double* %64, align 8
  %65 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 0
  %66 = load double* %65, align 8
  %67 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 0
  %68 = load double* %67, align 8
  %69 = fmul double %66, %68
  %70 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 1
  %71 = load double* %70, align 8
  %72 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 1
  %73 = load double* %72, align 8
  %74 = fmul double %71, %73
  %75 = fadd double %69, %74
  %76 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 2
  %77 = load double* %76, align 8
  %78 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 2
  %79 = load double* %78, align 8
  %80 = fmul double %77, %79
  %81 = fadd double %75, %80
  store double %81, double* %lensqr, align 8
  %82 = load %struct.vector** %2, align 8
  %83 = getelementptr inbounds %struct.vector* %82, i32 0, i32 0
  %84 = load double* %83, align 8
  %85 = load %struct.stri** %1, align 8
  %86 = getelementptr inbounds %struct.stri* %85, i32 0, i32 7
  %87 = getelementptr inbounds %struct.vector* %86, i32 0, i32 0
  %88 = load double* %87, align 8
  %89 = fsub double %84, %88
  %90 = getelementptr inbounds %struct.vector* %P, i32 0, i32 0
  store double %89, double* %90, align 8
  %91 = load %struct.vector** %2, align 8
  %92 = getelementptr inbounds %struct.vector* %91, i32 0, i32 1
  %93 = load double* %92, align 8
  %94 = load %struct.stri** %1, align 8
  %95 = getelementptr inbounds %struct.stri* %94, i32 0, i32 7
  %96 = getelementptr inbounds %struct.vector* %95, i32 0, i32 1
  %97 = load double* %96, align 8
  %98 = fsub double %93, %97
  %99 = getelementptr inbounds %struct.vector* %P, i32 0, i32 1
  store double %98, double* %99, align 8
  %100 = load %struct.vector** %2, align 8
  %101 = getelementptr inbounds %struct.vector* %100, i32 0, i32 2
  %102 = load double* %101, align 8
  %103 = load %struct.stri** %1, align 8
  %104 = getelementptr inbounds %struct.stri* %103, i32 0, i32 7
  %105 = getelementptr inbounds %struct.vector* %104, i32 0, i32 2
  %106 = load double* %105, align 8
  %107 = fsub double %102, %106
  %108 = getelementptr inbounds %struct.vector* %P, i32 0, i32 2
  store double %107, double* %108, align 8
  %109 = getelementptr inbounds %struct.vector* %P, i32 0, i32 1
  %110 = load double* %109, align 8
  %111 = load %struct.stri** %1, align 8
  %112 = getelementptr inbounds %struct.stri* %111, i32 0, i32 5
  %113 = getelementptr inbounds %struct.vector* %112, i32 0, i32 2
  %114 = load double* %113, align 8
  %115 = fmul double %110, %114
  %116 = getelementptr inbounds %struct.vector* %P, i32 0, i32 2
  %117 = load double* %116, align 8
  %118 = load %struct.stri** %1, align 8
  %119 = getelementptr inbounds %struct.stri* %118, i32 0, i32 5
  %120 = getelementptr inbounds %struct.vector* %119, i32 0, i32 1
  %121 = load double* %120, align 8
  %122 = fmul double %117, %121
  %123 = fsub double %115, %122
  %124 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 0
  store double %123, double* %124, align 8
  %125 = getelementptr inbounds %struct.vector* %P, i32 0, i32 2
  %126 = load double* %125, align 8
  %127 = load %struct.stri** %1, align 8
  %128 = getelementptr inbounds %struct.stri* %127, i32 0, i32 5
  %129 = getelementptr inbounds %struct.vector* %128, i32 0, i32 0
  %130 = load double* %129, align 8
  %131 = fmul double %126, %130
  %132 = getelementptr inbounds %struct.vector* %P, i32 0, i32 0
  %133 = load double* %132, align 8
  %134 = load %struct.stri** %1, align 8
  %135 = getelementptr inbounds %struct.stri* %134, i32 0, i32 5
  %136 = getelementptr inbounds %struct.vector* %135, i32 0, i32 2
  %137 = load double* %136, align 8
  %138 = fmul double %133, %137
  %139 = fsub double %131, %138
  %140 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 1
  store double %139, double* %140, align 8
  %141 = getelementptr inbounds %struct.vector* %P, i32 0, i32 0
  %142 = load double* %141, align 8
  %143 = load %struct.stri** %1, align 8
  %144 = getelementptr inbounds %struct.stri* %143, i32 0, i32 5
  %145 = getelementptr inbounds %struct.vector* %144, i32 0, i32 1
  %146 = load double* %145, align 8
  %147 = fmul double %142, %146
  %148 = getelementptr inbounds %struct.vector* %P, i32 0, i32 1
  %149 = load double* %148, align 8
  %150 = load %struct.stri** %1, align 8
  %151 = getelementptr inbounds %struct.stri* %150, i32 0, i32 5
  %152 = getelementptr inbounds %struct.vector* %151, i32 0, i32 0
  %153 = load double* %152, align 8
  %154 = fmul double %149, %153
  %155 = fsub double %147, %154
  %156 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 2
  store double %155, double* %156, align 8
  %157 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 0
  %158 = load double* %157, align 8
  %159 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 0
  %160 = load double* %159, align 8
  %161 = fmul double %158, %160
  %162 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 1
  %163 = load double* %162, align 8
  %164 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 1
  %165 = load double* %164, align 8
  %166 = fmul double %163, %165
  %167 = fadd double %161, %166
  %168 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 2
  %169 = load double* %168, align 8
  %170 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 2
  %171 = load double* %170, align 8
  %172 = fmul double %169, %171
  %173 = fadd double %167, %172
  %174 = load double* %lensqr, align 8
  %175 = fdiv double %173, %174
  store double %175, double* %U, align 8
  %176 = load %struct.stri** %1, align 8
  %177 = getelementptr inbounds %struct.stri* %176, i32 0, i32 6
  %178 = getelementptr inbounds %struct.vector* %177, i32 0, i32 1
  %179 = load double* %178, align 8
  %180 = getelementptr inbounds %struct.vector* %P, i32 0, i32 2
  %181 = load double* %180, align 8
  %182 = fmul double %179, %181
  %183 = load %struct.stri** %1, align 8
  %184 = getelementptr inbounds %struct.stri* %183, i32 0, i32 6
  %185 = getelementptr inbounds %struct.vector* %184, i32 0, i32 2
  %186 = load double* %185, align 8
  %187 = getelementptr inbounds %struct.vector* %P, i32 0, i32 1
  %188 = load double* %187, align 8
  %189 = fmul double %186, %188
  %190 = fsub double %182, %189
  %191 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 0
  store double %190, double* %191, align 8
  %192 = load %struct.stri** %1, align 8
  %193 = getelementptr inbounds %struct.stri* %192, i32 0, i32 6
  %194 = getelementptr inbounds %struct.vector* %193, i32 0, i32 2
  %195 = load double* %194, align 8
  %196 = getelementptr inbounds %struct.vector* %P, i32 0, i32 0
  %197 = load double* %196, align 8
  %198 = fmul double %195, %197
  %199 = load %struct.stri** %1, align 8
  %200 = getelementptr inbounds %struct.stri* %199, i32 0, i32 6
  %201 = getelementptr inbounds %struct.vector* %200, i32 0, i32 0
  %202 = load double* %201, align 8
  %203 = getelementptr inbounds %struct.vector* %P, i32 0, i32 2
  %204 = load double* %203, align 8
  %205 = fmul double %202, %204
  %206 = fsub double %198, %205
  %207 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 1
  store double %206, double* %207, align 8
  %208 = load %struct.stri** %1, align 8
  %209 = getelementptr inbounds %struct.stri* %208, i32 0, i32 6
  %210 = getelementptr inbounds %struct.vector* %209, i32 0, i32 0
  %211 = load double* %210, align 8
  %212 = getelementptr inbounds %struct.vector* %P, i32 0, i32 1
  %213 = load double* %212, align 8
  %214 = fmul double %211, %213
  %215 = load %struct.stri** %1, align 8
  %216 = getelementptr inbounds %struct.stri* %215, i32 0, i32 6
  %217 = getelementptr inbounds %struct.vector* %216, i32 0, i32 1
  %218 = load double* %217, align 8
  %219 = getelementptr inbounds %struct.vector* %P, i32 0, i32 0
  %220 = load double* %219, align 8
  %221 = fmul double %218, %220
  %222 = fsub double %214, %221
  %223 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 2
  store double %222, double* %223, align 8
  %224 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 0
  %225 = load double* %224, align 8
  %226 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 0
  %227 = load double* %226, align 8
  %228 = fmul double %225, %227
  %229 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 1
  %230 = load double* %229, align 8
  %231 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 1
  %232 = load double* %231, align 8
  %233 = fmul double %230, %232
  %234 = fadd double %228, %233
  %235 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 2
  %236 = load double* %235, align 8
  %237 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 2
  %238 = load double* %237, align 8
  %239 = fmul double %236, %238
  %240 = fadd double %234, %239
  %241 = load double* %lensqr, align 8
  %242 = fdiv double %240, %241
  store double %242, double* %V, align 8
  %243 = load double* %U, align 8
  %244 = load double* %V, align 8
  %245 = fadd double %243, %244
  %246 = fsub double 1.000000e+00, %245
  store double %246, double* %W, align 8
  %247 = load double* %W, align 8
  %248 = load %struct.stri** %1, align 8
  %249 = getelementptr inbounds %struct.stri* %248, i32 0, i32 8
  %250 = getelementptr inbounds %struct.vector* %249, i32 0, i32 0
  %251 = load double* %250, align 8
  %252 = fmul double %247, %251
  %253 = load double* %U, align 8
  %254 = load %struct.stri** %1, align 8
  %255 = getelementptr inbounds %struct.stri* %254, i32 0, i32 9
  %256 = getelementptr inbounds %struct.vector* %255, i32 0, i32 0
  %257 = load double* %256, align 8
  %258 = fmul double %253, %257
  %259 = fadd double %252, %258
  %260 = load double* %V, align 8
  %261 = load %struct.stri** %1, align 8
  %262 = getelementptr inbounds %struct.stri* %261, i32 0, i32 10
  %263 = getelementptr inbounds %struct.vector* %262, i32 0, i32 0
  %264 = load double* %263, align 8
  %265 = fmul double %260, %264
  %266 = fadd double %259, %265
  %267 = load %struct.vector** %4, align 8
  %268 = getelementptr inbounds %struct.vector* %267, i32 0, i32 0
  store double %266, double* %268, align 8
  %269 = load double* %W, align 8
  %270 = load %struct.stri** %1, align 8
  %271 = getelementptr inbounds %struct.stri* %270, i32 0, i32 8
  %272 = getelementptr inbounds %struct.vector* %271, i32 0, i32 1
  %273 = load double* %272, align 8
  %274 = fmul double %269, %273
  %275 = load double* %U, align 8
  %276 = load %struct.stri** %1, align 8
  %277 = getelementptr inbounds %struct.stri* %276, i32 0, i32 9
  %278 = getelementptr inbounds %struct.vector* %277, i32 0, i32 1
  %279 = load double* %278, align 8
  %280 = fmul double %275, %279
  %281 = fadd double %274, %280
  %282 = load double* %V, align 8
  %283 = load %struct.stri** %1, align 8
  %284 = getelementptr inbounds %struct.stri* %283, i32 0, i32 10
  %285 = getelementptr inbounds %struct.vector* %284, i32 0, i32 1
  %286 = load double* %285, align 8
  %287 = fmul double %282, %286
  %288 = fadd double %281, %287
  %289 = load %struct.vector** %4, align 8
  %290 = getelementptr inbounds %struct.vector* %289, i32 0, i32 1
  store double %288, double* %290, align 8
  %291 = load double* %W, align 8
  %292 = load %struct.stri** %1, align 8
  %293 = getelementptr inbounds %struct.stri* %292, i32 0, i32 8
  %294 = getelementptr inbounds %struct.vector* %293, i32 0, i32 2
  %295 = load double* %294, align 8
  %296 = fmul double %291, %295
  %297 = load double* %U, align 8
  %298 = load %struct.stri** %1, align 8
  %299 = getelementptr inbounds %struct.stri* %298, i32 0, i32 9
  %300 = getelementptr inbounds %struct.vector* %299, i32 0, i32 2
  %301 = load double* %300, align 8
  %302 = fmul double %297, %301
  %303 = fadd double %296, %302
  %304 = load double* %V, align 8
  %305 = load %struct.stri** %1, align 8
  %306 = getelementptr inbounds %struct.stri* %305, i32 0, i32 10
  %307 = getelementptr inbounds %struct.vector* %306, i32 0, i32 2
  %308 = load double* %307, align 8
  %309 = fmul double %304, %308
  %310 = fadd double %303, %309
  %311 = load %struct.vector** %4, align 8
  %312 = getelementptr inbounds %struct.vector* %311, i32 0, i32 2
  store double %310, double* %312, align 8
  %313 = load %struct.vector** %4, align 8
  %314 = getelementptr inbounds %struct.vector* %313, i32 0, i32 0
  %315 = load double* %314, align 8
  %316 = load %struct.vector** %4, align 8
  %317 = getelementptr inbounds %struct.vector* %316, i32 0, i32 0
  %318 = load double* %317, align 8
  %319 = fmul double %315, %318
  %320 = load %struct.vector** %4, align 8
  %321 = getelementptr inbounds %struct.vector* %320, i32 0, i32 1
  %322 = load double* %321, align 8
  %323 = load %struct.vector** %4, align 8
  %324 = getelementptr inbounds %struct.vector* %323, i32 0, i32 1
  %325 = load double* %324, align 8
  %326 = fmul double %322, %325
  %327 = fadd double %319, %326
  %328 = load %struct.vector** %4, align 8
  %329 = getelementptr inbounds %struct.vector* %328, i32 0, i32 2
  %330 = load double* %329, align 8
  %331 = load %struct.vector** %4, align 8
  %332 = getelementptr inbounds %struct.vector* %331, i32 0, i32 2
  %333 = load double* %332, align 8
  %334 = fmul double %330, %333
  %335 = fadd double %327, %334
  %336 = call double @sqrt(double %335) #3
  %337 = fdiv double 1.000000e+00, %336
  store double %337, double* %invlen, align 8
  %338 = load double* %invlen, align 8
  %339 = load %struct.vector** %4, align 8
  %340 = getelementptr inbounds %struct.vector* %339, i32 0, i32 0
  %341 = load double* %340, align 8
  %342 = fmul double %341, %338
  store double %342, double* %340, align 8
  %343 = load double* %invlen, align 8
  %344 = load %struct.vector** %4, align 8
  %345 = getelementptr inbounds %struct.vector* %344, i32 0, i32 1
  %346 = load double* %345, align 8
  %347 = fmul double %346, %343
  store double %347, double* %345, align 8
  %348 = load double* %invlen, align 8
  %349 = load %struct.vector** %4, align 8
  %350 = getelementptr inbounds %struct.vector* %349, i32 0, i32 2
  %351 = load double* %350, align 8
  %352 = fmul double %351, %348
  store double %352, double* %350, align 8
  %353 = load %struct.ray_t** %3, align 8
  %354 = getelementptr inbounds %struct.ray_t* %353, i32 0, i32 1
  %355 = call double @VDot(%struct.vector* %norm, %struct.vector* %354)
  %356 = fcmp olt double %355, 0.000000e+00
  br i1 %356, label %357, label %376

; <label>:357                                     ; preds = %0
  %358 = load %struct.vector** %4, align 8
  %359 = getelementptr inbounds %struct.vector* %358, i32 0, i32 0
  %360 = load double* %359, align 8
  %361 = fsub double -0.000000e+00, %360
  %362 = load %struct.vector** %4, align 8
  %363 = getelementptr inbounds %struct.vector* %362, i32 0, i32 0
  store double %361, double* %363, align 8
  %364 = load %struct.vector** %4, align 8
  %365 = getelementptr inbounds %struct.vector* %364, i32 0, i32 1
  %366 = load double* %365, align 8
  %367 = fsub double -0.000000e+00, %366
  %368 = load %struct.vector** %4, align 8
  %369 = getelementptr inbounds %struct.vector* %368, i32 0, i32 1
  store double %367, double* %369, align 8
  %370 = load %struct.vector** %4, align 8
  %371 = getelementptr inbounds %struct.vector* %370, i32 0, i32 2
  %372 = load double* %371, align 8
  %373 = fsub double -0.000000e+00, %372
  %374 = load %struct.vector** %4, align 8
  %375 = getelementptr inbounds %struct.vector* %374, i32 0, i32 2
  store double %373, double* %375, align 8
  br label %376

; <label>:376                                     ; preds = %357, %0
  ret void
}

; Function Attrs: nounwind uwtable
define internal i32 @tri_bbox(i8* %obj, %struct.vector* %min, %struct.vector* %max) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca %struct.vector*, align 8
  %3 = alloca %struct.vector*, align 8
  %t = alloca %struct.tri*, align 8
  %v1 = alloca %struct.vector, align 8
  %v2 = alloca %struct.vector, align 8
  store i8* %obj, i8** %1, align 8
  store %struct.vector* %min, %struct.vector** %2, align 8
  store %struct.vector* %max, %struct.vector** %3, align 8
  %4 = load i8** %1, align 8
  %5 = bitcast i8* %4 to %struct.tri*
  store %struct.tri* %5, %struct.tri** %t, align 8
  %6 = load %struct.tri** %t, align 8
  %7 = getelementptr inbounds %struct.tri* %6, i32 0, i32 7
  %8 = load %struct.tri** %t, align 8
  %9 = getelementptr inbounds %struct.tri* %8, i32 0, i32 6
  call void @VAdd(%struct.vector* %7, %struct.vector* %9, %struct.vector* %v1)
  %10 = load %struct.tri** %t, align 8
  %11 = getelementptr inbounds %struct.tri* %10, i32 0, i32 7
  %12 = load %struct.tri** %t, align 8
  %13 = getelementptr inbounds %struct.tri* %12, i32 0, i32 5
  call void @VAdd(%struct.vector* %11, %struct.vector* %13, %struct.vector* %v2)
  %14 = load %struct.tri** %t, align 8
  %15 = getelementptr inbounds %struct.tri* %14, i32 0, i32 7
  %16 = getelementptr inbounds %struct.vector* %15, i32 0, i32 0
  %17 = load double* %16, align 8
  %18 = getelementptr inbounds %struct.vector* %v1, i32 0, i32 0
  %19 = load double* %18, align 8
  %20 = getelementptr inbounds %struct.vector* %v2, i32 0, i32 0
  %21 = load double* %20, align 8
  %22 = fcmp olt double %19, %21
  br i1 %22, label %23, label %26

; <label>:23                                      ; preds = %0
  %24 = getelementptr inbounds %struct.vector* %v1, i32 0, i32 0
  %25 = load double* %24, align 8
  br label %29

; <label>:26                                      ; preds = %0
  %27 = getelementptr inbounds %struct.vector* %v2, i32 0, i32 0
  %28 = load double* %27, align 8
  br label %29

; <label>:29                                      ; preds = %26, %23
  %30 = phi double [ %25, %23 ], [ %28, %26 ]
  %31 = fcmp olt double %17, %30
  br i1 %31, label %32, label %37

; <label>:32                                      ; preds = %29
  %33 = load %struct.tri** %t, align 8
  %34 = getelementptr inbounds %struct.tri* %33, i32 0, i32 7
  %35 = getelementptr inbounds %struct.vector* %34, i32 0, i32 0
  %36 = load double* %35, align 8
  br label %51

; <label>:37                                      ; preds = %29
  %38 = getelementptr inbounds %struct.vector* %v1, i32 0, i32 0
  %39 = load double* %38, align 8
  %40 = getelementptr inbounds %struct.vector* %v2, i32 0, i32 0
  %41 = load double* %40, align 8
  %42 = fcmp olt double %39, %41
  br i1 %42, label %43, label %46

; <label>:43                                      ; preds = %37
  %44 = getelementptr inbounds %struct.vector* %v1, i32 0, i32 0
  %45 = load double* %44, align 8
  br label %49

; <label>:46                                      ; preds = %37
  %47 = getelementptr inbounds %struct.vector* %v2, i32 0, i32 0
  %48 = load double* %47, align 8
  br label %49

; <label>:49                                      ; preds = %46, %43
  %50 = phi double [ %45, %43 ], [ %48, %46 ]
  br label %51

; <label>:51                                      ; preds = %49, %32
  %52 = phi double [ %36, %32 ], [ %50, %49 ]
  %53 = load %struct.vector** %2, align 8
  %54 = getelementptr inbounds %struct.vector* %53, i32 0, i32 0
  store double %52, double* %54, align 8
  %55 = load %struct.tri** %t, align 8
  %56 = getelementptr inbounds %struct.tri* %55, i32 0, i32 7
  %57 = getelementptr inbounds %struct.vector* %56, i32 0, i32 1
  %58 = load double* %57, align 8
  %59 = getelementptr inbounds %struct.vector* %v1, i32 0, i32 1
  %60 = load double* %59, align 8
  %61 = getelementptr inbounds %struct.vector* %v2, i32 0, i32 1
  %62 = load double* %61, align 8
  %63 = fcmp olt double %60, %62
  br i1 %63, label %64, label %67

; <label>:64                                      ; preds = %51
  %65 = getelementptr inbounds %struct.vector* %v1, i32 0, i32 1
  %66 = load double* %65, align 8
  br label %70

; <label>:67                                      ; preds = %51
  %68 = getelementptr inbounds %struct.vector* %v2, i32 0, i32 1
  %69 = load double* %68, align 8
  br label %70

; <label>:70                                      ; preds = %67, %64
  %71 = phi double [ %66, %64 ], [ %69, %67 ]
  %72 = fcmp olt double %58, %71
  br i1 %72, label %73, label %78

; <label>:73                                      ; preds = %70
  %74 = load %struct.tri** %t, align 8
  %75 = getelementptr inbounds %struct.tri* %74, i32 0, i32 7
  %76 = getelementptr inbounds %struct.vector* %75, i32 0, i32 1
  %77 = load double* %76, align 8
  br label %92

; <label>:78                                      ; preds = %70
  %79 = getelementptr inbounds %struct.vector* %v1, i32 0, i32 1
  %80 = load double* %79, align 8
  %81 = getelementptr inbounds %struct.vector* %v2, i32 0, i32 1
  %82 = load double* %81, align 8
  %83 = fcmp olt double %80, %82
  br i1 %83, label %84, label %87

; <label>:84                                      ; preds = %78
  %85 = getelementptr inbounds %struct.vector* %v1, i32 0, i32 1
  %86 = load double* %85, align 8
  br label %90

; <label>:87                                      ; preds = %78
  %88 = getelementptr inbounds %struct.vector* %v2, i32 0, i32 1
  %89 = load double* %88, align 8
  br label %90

; <label>:90                                      ; preds = %87, %84
  %91 = phi double [ %86, %84 ], [ %89, %87 ]
  br label %92

; <label>:92                                      ; preds = %90, %73
  %93 = phi double [ %77, %73 ], [ %91, %90 ]
  %94 = load %struct.vector** %2, align 8
  %95 = getelementptr inbounds %struct.vector* %94, i32 0, i32 1
  store double %93, double* %95, align 8
  %96 = load %struct.tri** %t, align 8
  %97 = getelementptr inbounds %struct.tri* %96, i32 0, i32 7
  %98 = getelementptr inbounds %struct.vector* %97, i32 0, i32 2
  %99 = load double* %98, align 8
  %100 = getelementptr inbounds %struct.vector* %v1, i32 0, i32 2
  %101 = load double* %100, align 8
  %102 = getelementptr inbounds %struct.vector* %v2, i32 0, i32 2
  %103 = load double* %102, align 8
  %104 = fcmp olt double %101, %103
  br i1 %104, label %105, label %108

; <label>:105                                     ; preds = %92
  %106 = getelementptr inbounds %struct.vector* %v1, i32 0, i32 2
  %107 = load double* %106, align 8
  br label %111

; <label>:108                                     ; preds = %92
  %109 = getelementptr inbounds %struct.vector* %v2, i32 0, i32 2
  %110 = load double* %109, align 8
  br label %111

; <label>:111                                     ; preds = %108, %105
  %112 = phi double [ %107, %105 ], [ %110, %108 ]
  %113 = fcmp olt double %99, %112
  br i1 %113, label %114, label %119

; <label>:114                                     ; preds = %111
  %115 = load %struct.tri** %t, align 8
  %116 = getelementptr inbounds %struct.tri* %115, i32 0, i32 7
  %117 = getelementptr inbounds %struct.vector* %116, i32 0, i32 2
  %118 = load double* %117, align 8
  br label %133

; <label>:119                                     ; preds = %111
  %120 = getelementptr inbounds %struct.vector* %v1, i32 0, i32 2
  %121 = load double* %120, align 8
  %122 = getelementptr inbounds %struct.vector* %v2, i32 0, i32 2
  %123 = load double* %122, align 8
  %124 = fcmp olt double %121, %123
  br i1 %124, label %125, label %128

; <label>:125                                     ; preds = %119
  %126 = getelementptr inbounds %struct.vector* %v1, i32 0, i32 2
  %127 = load double* %126, align 8
  br label %131

; <label>:128                                     ; preds = %119
  %129 = getelementptr inbounds %struct.vector* %v2, i32 0, i32 2
  %130 = load double* %129, align 8
  br label %131

; <label>:131                                     ; preds = %128, %125
  %132 = phi double [ %127, %125 ], [ %130, %128 ]
  br label %133

; <label>:133                                     ; preds = %131, %114
  %134 = phi double [ %118, %114 ], [ %132, %131 ]
  %135 = load %struct.vector** %2, align 8
  %136 = getelementptr inbounds %struct.vector* %135, i32 0, i32 2
  store double %134, double* %136, align 8
  %137 = load %struct.tri** %t, align 8
  %138 = getelementptr inbounds %struct.tri* %137, i32 0, i32 7
  %139 = getelementptr inbounds %struct.vector* %138, i32 0, i32 0
  %140 = load double* %139, align 8
  %141 = getelementptr inbounds %struct.vector* %v1, i32 0, i32 0
  %142 = load double* %141, align 8
  %143 = getelementptr inbounds %struct.vector* %v2, i32 0, i32 0
  %144 = load double* %143, align 8
  %145 = fcmp ogt double %142, %144
  br i1 %145, label %146, label %149

; <label>:146                                     ; preds = %133
  %147 = getelementptr inbounds %struct.vector* %v1, i32 0, i32 0
  %148 = load double* %147, align 8
  br label %152

; <label>:149                                     ; preds = %133
  %150 = getelementptr inbounds %struct.vector* %v2, i32 0, i32 0
  %151 = load double* %150, align 8
  br label %152

; <label>:152                                     ; preds = %149, %146
  %153 = phi double [ %148, %146 ], [ %151, %149 ]
  %154 = fcmp ogt double %140, %153
  br i1 %154, label %155, label %160

; <label>:155                                     ; preds = %152
  %156 = load %struct.tri** %t, align 8
  %157 = getelementptr inbounds %struct.tri* %156, i32 0, i32 7
  %158 = getelementptr inbounds %struct.vector* %157, i32 0, i32 0
  %159 = load double* %158, align 8
  br label %174

; <label>:160                                     ; preds = %152
  %161 = getelementptr inbounds %struct.vector* %v1, i32 0, i32 0
  %162 = load double* %161, align 8
  %163 = getelementptr inbounds %struct.vector* %v2, i32 0, i32 0
  %164 = load double* %163, align 8
  %165 = fcmp ogt double %162, %164
  br i1 %165, label %166, label %169

; <label>:166                                     ; preds = %160
  %167 = getelementptr inbounds %struct.vector* %v1, i32 0, i32 0
  %168 = load double* %167, align 8
  br label %172

; <label>:169                                     ; preds = %160
  %170 = getelementptr inbounds %struct.vector* %v2, i32 0, i32 0
  %171 = load double* %170, align 8
  br label %172

; <label>:172                                     ; preds = %169, %166
  %173 = phi double [ %168, %166 ], [ %171, %169 ]
  br label %174

; <label>:174                                     ; preds = %172, %155
  %175 = phi double [ %159, %155 ], [ %173, %172 ]
  %176 = load %struct.vector** %3, align 8
  %177 = getelementptr inbounds %struct.vector* %176, i32 0, i32 0
  store double %175, double* %177, align 8
  %178 = load %struct.tri** %t, align 8
  %179 = getelementptr inbounds %struct.tri* %178, i32 0, i32 7
  %180 = getelementptr inbounds %struct.vector* %179, i32 0, i32 1
  %181 = load double* %180, align 8
  %182 = getelementptr inbounds %struct.vector* %v1, i32 0, i32 1
  %183 = load double* %182, align 8
  %184 = getelementptr inbounds %struct.vector* %v2, i32 0, i32 1
  %185 = load double* %184, align 8
  %186 = fcmp ogt double %183, %185
  br i1 %186, label %187, label %190

; <label>:187                                     ; preds = %174
  %188 = getelementptr inbounds %struct.vector* %v1, i32 0, i32 1
  %189 = load double* %188, align 8
  br label %193

; <label>:190                                     ; preds = %174
  %191 = getelementptr inbounds %struct.vector* %v2, i32 0, i32 1
  %192 = load double* %191, align 8
  br label %193

; <label>:193                                     ; preds = %190, %187
  %194 = phi double [ %189, %187 ], [ %192, %190 ]
  %195 = fcmp ogt double %181, %194
  br i1 %195, label %196, label %201

; <label>:196                                     ; preds = %193
  %197 = load %struct.tri** %t, align 8
  %198 = getelementptr inbounds %struct.tri* %197, i32 0, i32 7
  %199 = getelementptr inbounds %struct.vector* %198, i32 0, i32 1
  %200 = load double* %199, align 8
  br label %215

; <label>:201                                     ; preds = %193
  %202 = getelementptr inbounds %struct.vector* %v1, i32 0, i32 1
  %203 = load double* %202, align 8
  %204 = getelementptr inbounds %struct.vector* %v2, i32 0, i32 1
  %205 = load double* %204, align 8
  %206 = fcmp ogt double %203, %205
  br i1 %206, label %207, label %210

; <label>:207                                     ; preds = %201
  %208 = getelementptr inbounds %struct.vector* %v1, i32 0, i32 1
  %209 = load double* %208, align 8
  br label %213

; <label>:210                                     ; preds = %201
  %211 = getelementptr inbounds %struct.vector* %v2, i32 0, i32 1
  %212 = load double* %211, align 8
  br label %213

; <label>:213                                     ; preds = %210, %207
  %214 = phi double [ %209, %207 ], [ %212, %210 ]
  br label %215

; <label>:215                                     ; preds = %213, %196
  %216 = phi double [ %200, %196 ], [ %214, %213 ]
  %217 = load %struct.vector** %3, align 8
  %218 = getelementptr inbounds %struct.vector* %217, i32 0, i32 1
  store double %216, double* %218, align 8
  %219 = load %struct.tri** %t, align 8
  %220 = getelementptr inbounds %struct.tri* %219, i32 0, i32 7
  %221 = getelementptr inbounds %struct.vector* %220, i32 0, i32 2
  %222 = load double* %221, align 8
  %223 = getelementptr inbounds %struct.vector* %v1, i32 0, i32 2
  %224 = load double* %223, align 8
  %225 = getelementptr inbounds %struct.vector* %v2, i32 0, i32 2
  %226 = load double* %225, align 8
  %227 = fcmp ogt double %224, %226
  br i1 %227, label %228, label %231

; <label>:228                                     ; preds = %215
  %229 = getelementptr inbounds %struct.vector* %v1, i32 0, i32 2
  %230 = load double* %229, align 8
  br label %234

; <label>:231                                     ; preds = %215
  %232 = getelementptr inbounds %struct.vector* %v2, i32 0, i32 2
  %233 = load double* %232, align 8
  br label %234

; <label>:234                                     ; preds = %231, %228
  %235 = phi double [ %230, %228 ], [ %233, %231 ]
  %236 = fcmp ogt double %222, %235
  br i1 %236, label %237, label %242

; <label>:237                                     ; preds = %234
  %238 = load %struct.tri** %t, align 8
  %239 = getelementptr inbounds %struct.tri* %238, i32 0, i32 7
  %240 = getelementptr inbounds %struct.vector* %239, i32 0, i32 2
  %241 = load double* %240, align 8
  br label %256

; <label>:242                                     ; preds = %234
  %243 = getelementptr inbounds %struct.vector* %v1, i32 0, i32 2
  %244 = load double* %243, align 8
  %245 = getelementptr inbounds %struct.vector* %v2, i32 0, i32 2
  %246 = load double* %245, align 8
  %247 = fcmp ogt double %244, %246
  br i1 %247, label %248, label %251

; <label>:248                                     ; preds = %242
  %249 = getelementptr inbounds %struct.vector* %v1, i32 0, i32 2
  %250 = load double* %249, align 8
  br label %254

; <label>:251                                     ; preds = %242
  %252 = getelementptr inbounds %struct.vector* %v2, i32 0, i32 2
  %253 = load double* %252, align 8
  br label %254

; <label>:254                                     ; preds = %251, %248
  %255 = phi double [ %250, %248 ], [ %253, %251 ]
  br label %256

; <label>:256                                     ; preds = %254, %237
  %257 = phi double [ %241, %237 ], [ %255, %254 ]
  %258 = load %struct.vector** %3, align 8
  %259 = getelementptr inbounds %struct.vector* %258, i32 0, i32 2
  store double %257, double* %259, align 8
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
  %1 = alloca %struct.stri*, align 8
  %2 = alloca %struct.vector*, align 8
  %3 = alloca %struct.ray_t*, align 8
  %4 = alloca %struct.vector*, align 8
  %U = alloca double, align 8
  %V = alloca double, align 8
  %W = alloca double, align 8
  %lensqr = alloca double, align 8
  %invlen = alloca double, align 8
  %P = alloca %struct.vector, align 8
  %tmp = alloca %struct.vector, align 8
  %norm = alloca %struct.vector, align 8
  store %struct.stri* %trn, %struct.stri** %1, align 8
  store %struct.vector* %hit, %struct.vector** %2, align 8
  store %struct.ray_t* %incident, %struct.ray_t** %3, align 8
  store %struct.vector* %N, %struct.vector** %4, align 8
  %5 = load %struct.stri** %1, align 8
  %6 = getelementptr inbounds %struct.stri* %5, i32 0, i32 6
  %7 = getelementptr inbounds %struct.vector* %6, i32 0, i32 1
  %8 = load double* %7, align 8
  %9 = load %struct.stri** %1, align 8
  %10 = getelementptr inbounds %struct.stri* %9, i32 0, i32 5
  %11 = getelementptr inbounds %struct.vector* %10, i32 0, i32 2
  %12 = load double* %11, align 8
  %13 = fmul double %8, %12
  %14 = load %struct.stri** %1, align 8
  %15 = getelementptr inbounds %struct.stri* %14, i32 0, i32 6
  %16 = getelementptr inbounds %struct.vector* %15, i32 0, i32 2
  %17 = load double* %16, align 8
  %18 = load %struct.stri** %1, align 8
  %19 = getelementptr inbounds %struct.stri* %18, i32 0, i32 5
  %20 = getelementptr inbounds %struct.vector* %19, i32 0, i32 1
  %21 = load double* %20, align 8
  %22 = fmul double %17, %21
  %23 = fsub double %13, %22
  %24 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 0
  store double %23, double* %24, align 8
  %25 = load %struct.stri** %1, align 8
  %26 = getelementptr inbounds %struct.stri* %25, i32 0, i32 6
  %27 = getelementptr inbounds %struct.vector* %26, i32 0, i32 2
  %28 = load double* %27, align 8
  %29 = load %struct.stri** %1, align 8
  %30 = getelementptr inbounds %struct.stri* %29, i32 0, i32 5
  %31 = getelementptr inbounds %struct.vector* %30, i32 0, i32 0
  %32 = load double* %31, align 8
  %33 = fmul double %28, %32
  %34 = load %struct.stri** %1, align 8
  %35 = getelementptr inbounds %struct.stri* %34, i32 0, i32 6
  %36 = getelementptr inbounds %struct.vector* %35, i32 0, i32 0
  %37 = load double* %36, align 8
  %38 = load %struct.stri** %1, align 8
  %39 = getelementptr inbounds %struct.stri* %38, i32 0, i32 5
  %40 = getelementptr inbounds %struct.vector* %39, i32 0, i32 2
  %41 = load double* %40, align 8
  %42 = fmul double %37, %41
  %43 = fsub double %33, %42
  %44 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 1
  store double %43, double* %44, align 8
  %45 = load %struct.stri** %1, align 8
  %46 = getelementptr inbounds %struct.stri* %45, i32 0, i32 6
  %47 = getelementptr inbounds %struct.vector* %46, i32 0, i32 0
  %48 = load double* %47, align 8
  %49 = load %struct.stri** %1, align 8
  %50 = getelementptr inbounds %struct.stri* %49, i32 0, i32 5
  %51 = getelementptr inbounds %struct.vector* %50, i32 0, i32 1
  %52 = load double* %51, align 8
  %53 = fmul double %48, %52
  %54 = load %struct.stri** %1, align 8
  %55 = getelementptr inbounds %struct.stri* %54, i32 0, i32 6
  %56 = getelementptr inbounds %struct.vector* %55, i32 0, i32 1
  %57 = load double* %56, align 8
  %58 = load %struct.stri** %1, align 8
  %59 = getelementptr inbounds %struct.stri* %58, i32 0, i32 5
  %60 = getelementptr inbounds %struct.vector* %59, i32 0, i32 0
  %61 = load double* %60, align 8
  %62 = fmul double %57, %61
  %63 = fsub double %53, %62
  %64 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 2
  store double %63, double* %64, align 8
  %65 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 0
  %66 = load double* %65, align 8
  %67 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 0
  %68 = load double* %67, align 8
  %69 = fmul double %66, %68
  %70 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 1
  %71 = load double* %70, align 8
  %72 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 1
  %73 = load double* %72, align 8
  %74 = fmul double %71, %73
  %75 = fadd double %69, %74
  %76 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 2
  %77 = load double* %76, align 8
  %78 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 2
  %79 = load double* %78, align 8
  %80 = fmul double %77, %79
  %81 = fadd double %75, %80
  store double %81, double* %lensqr, align 8
  %82 = load %struct.vector** %2, align 8
  %83 = getelementptr inbounds %struct.vector* %82, i32 0, i32 0
  %84 = load double* %83, align 8
  %85 = load %struct.stri** %1, align 8
  %86 = getelementptr inbounds %struct.stri* %85, i32 0, i32 7
  %87 = getelementptr inbounds %struct.vector* %86, i32 0, i32 0
  %88 = load double* %87, align 8
  %89 = fsub double %84, %88
  %90 = getelementptr inbounds %struct.vector* %P, i32 0, i32 0
  store double %89, double* %90, align 8
  %91 = load %struct.vector** %2, align 8
  %92 = getelementptr inbounds %struct.vector* %91, i32 0, i32 1
  %93 = load double* %92, align 8
  %94 = load %struct.stri** %1, align 8
  %95 = getelementptr inbounds %struct.stri* %94, i32 0, i32 7
  %96 = getelementptr inbounds %struct.vector* %95, i32 0, i32 1
  %97 = load double* %96, align 8
  %98 = fsub double %93, %97
  %99 = getelementptr inbounds %struct.vector* %P, i32 0, i32 1
  store double %98, double* %99, align 8
  %100 = load %struct.vector** %2, align 8
  %101 = getelementptr inbounds %struct.vector* %100, i32 0, i32 2
  %102 = load double* %101, align 8
  %103 = load %struct.stri** %1, align 8
  %104 = getelementptr inbounds %struct.stri* %103, i32 0, i32 7
  %105 = getelementptr inbounds %struct.vector* %104, i32 0, i32 2
  %106 = load double* %105, align 8
  %107 = fsub double %102, %106
  %108 = getelementptr inbounds %struct.vector* %P, i32 0, i32 2
  store double %107, double* %108, align 8
  %109 = getelementptr inbounds %struct.vector* %P, i32 0, i32 1
  %110 = load double* %109, align 8
  %111 = load %struct.stri** %1, align 8
  %112 = getelementptr inbounds %struct.stri* %111, i32 0, i32 5
  %113 = getelementptr inbounds %struct.vector* %112, i32 0, i32 2
  %114 = load double* %113, align 8
  %115 = fmul double %110, %114
  %116 = getelementptr inbounds %struct.vector* %P, i32 0, i32 2
  %117 = load double* %116, align 8
  %118 = load %struct.stri** %1, align 8
  %119 = getelementptr inbounds %struct.stri* %118, i32 0, i32 5
  %120 = getelementptr inbounds %struct.vector* %119, i32 0, i32 1
  %121 = load double* %120, align 8
  %122 = fmul double %117, %121
  %123 = fsub double %115, %122
  %124 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 0
  store double %123, double* %124, align 8
  %125 = getelementptr inbounds %struct.vector* %P, i32 0, i32 2
  %126 = load double* %125, align 8
  %127 = load %struct.stri** %1, align 8
  %128 = getelementptr inbounds %struct.stri* %127, i32 0, i32 5
  %129 = getelementptr inbounds %struct.vector* %128, i32 0, i32 0
  %130 = load double* %129, align 8
  %131 = fmul double %126, %130
  %132 = getelementptr inbounds %struct.vector* %P, i32 0, i32 0
  %133 = load double* %132, align 8
  %134 = load %struct.stri** %1, align 8
  %135 = getelementptr inbounds %struct.stri* %134, i32 0, i32 5
  %136 = getelementptr inbounds %struct.vector* %135, i32 0, i32 2
  %137 = load double* %136, align 8
  %138 = fmul double %133, %137
  %139 = fsub double %131, %138
  %140 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 1
  store double %139, double* %140, align 8
  %141 = getelementptr inbounds %struct.vector* %P, i32 0, i32 0
  %142 = load double* %141, align 8
  %143 = load %struct.stri** %1, align 8
  %144 = getelementptr inbounds %struct.stri* %143, i32 0, i32 5
  %145 = getelementptr inbounds %struct.vector* %144, i32 0, i32 1
  %146 = load double* %145, align 8
  %147 = fmul double %142, %146
  %148 = getelementptr inbounds %struct.vector* %P, i32 0, i32 1
  %149 = load double* %148, align 8
  %150 = load %struct.stri** %1, align 8
  %151 = getelementptr inbounds %struct.stri* %150, i32 0, i32 5
  %152 = getelementptr inbounds %struct.vector* %151, i32 0, i32 0
  %153 = load double* %152, align 8
  %154 = fmul double %149, %153
  %155 = fsub double %147, %154
  %156 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 2
  store double %155, double* %156, align 8
  %157 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 0
  %158 = load double* %157, align 8
  %159 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 0
  %160 = load double* %159, align 8
  %161 = fmul double %158, %160
  %162 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 1
  %163 = load double* %162, align 8
  %164 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 1
  %165 = load double* %164, align 8
  %166 = fmul double %163, %165
  %167 = fadd double %161, %166
  %168 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 2
  %169 = load double* %168, align 8
  %170 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 2
  %171 = load double* %170, align 8
  %172 = fmul double %169, %171
  %173 = fadd double %167, %172
  %174 = load double* %lensqr, align 8
  %175 = fdiv double %173, %174
  store double %175, double* %U, align 8
  %176 = load %struct.stri** %1, align 8
  %177 = getelementptr inbounds %struct.stri* %176, i32 0, i32 6
  %178 = getelementptr inbounds %struct.vector* %177, i32 0, i32 1
  %179 = load double* %178, align 8
  %180 = getelementptr inbounds %struct.vector* %P, i32 0, i32 2
  %181 = load double* %180, align 8
  %182 = fmul double %179, %181
  %183 = load %struct.stri** %1, align 8
  %184 = getelementptr inbounds %struct.stri* %183, i32 0, i32 6
  %185 = getelementptr inbounds %struct.vector* %184, i32 0, i32 2
  %186 = load double* %185, align 8
  %187 = getelementptr inbounds %struct.vector* %P, i32 0, i32 1
  %188 = load double* %187, align 8
  %189 = fmul double %186, %188
  %190 = fsub double %182, %189
  %191 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 0
  store double %190, double* %191, align 8
  %192 = load %struct.stri** %1, align 8
  %193 = getelementptr inbounds %struct.stri* %192, i32 0, i32 6
  %194 = getelementptr inbounds %struct.vector* %193, i32 0, i32 2
  %195 = load double* %194, align 8
  %196 = getelementptr inbounds %struct.vector* %P, i32 0, i32 0
  %197 = load double* %196, align 8
  %198 = fmul double %195, %197
  %199 = load %struct.stri** %1, align 8
  %200 = getelementptr inbounds %struct.stri* %199, i32 0, i32 6
  %201 = getelementptr inbounds %struct.vector* %200, i32 0, i32 0
  %202 = load double* %201, align 8
  %203 = getelementptr inbounds %struct.vector* %P, i32 0, i32 2
  %204 = load double* %203, align 8
  %205 = fmul double %202, %204
  %206 = fsub double %198, %205
  %207 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 1
  store double %206, double* %207, align 8
  %208 = load %struct.stri** %1, align 8
  %209 = getelementptr inbounds %struct.stri* %208, i32 0, i32 6
  %210 = getelementptr inbounds %struct.vector* %209, i32 0, i32 0
  %211 = load double* %210, align 8
  %212 = getelementptr inbounds %struct.vector* %P, i32 0, i32 1
  %213 = load double* %212, align 8
  %214 = fmul double %211, %213
  %215 = load %struct.stri** %1, align 8
  %216 = getelementptr inbounds %struct.stri* %215, i32 0, i32 6
  %217 = getelementptr inbounds %struct.vector* %216, i32 0, i32 1
  %218 = load double* %217, align 8
  %219 = getelementptr inbounds %struct.vector* %P, i32 0, i32 0
  %220 = load double* %219, align 8
  %221 = fmul double %218, %220
  %222 = fsub double %214, %221
  %223 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 2
  store double %222, double* %223, align 8
  %224 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 0
  %225 = load double* %224, align 8
  %226 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 0
  %227 = load double* %226, align 8
  %228 = fmul double %225, %227
  %229 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 1
  %230 = load double* %229, align 8
  %231 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 1
  %232 = load double* %231, align 8
  %233 = fmul double %230, %232
  %234 = fadd double %228, %233
  %235 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 2
  %236 = load double* %235, align 8
  %237 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 2
  %238 = load double* %237, align 8
  %239 = fmul double %236, %238
  %240 = fadd double %234, %239
  %241 = load double* %lensqr, align 8
  %242 = fdiv double %240, %241
  store double %242, double* %V, align 8
  %243 = load double* %U, align 8
  %244 = load double* %V, align 8
  %245 = fadd double %243, %244
  %246 = fsub double 1.000000e+00, %245
  store double %246, double* %W, align 8
  %247 = load double* %W, align 8
  %248 = load %struct.stri** %1, align 8
  %249 = getelementptr inbounds %struct.stri* %248, i32 0, i32 8
  %250 = getelementptr inbounds %struct.vector* %249, i32 0, i32 0
  %251 = load double* %250, align 8
  %252 = fmul double %247, %251
  %253 = load double* %U, align 8
  %254 = load %struct.stri** %1, align 8
  %255 = getelementptr inbounds %struct.stri* %254, i32 0, i32 9
  %256 = getelementptr inbounds %struct.vector* %255, i32 0, i32 0
  %257 = load double* %256, align 8
  %258 = fmul double %253, %257
  %259 = fadd double %252, %258
  %260 = load double* %V, align 8
  %261 = load %struct.stri** %1, align 8
  %262 = getelementptr inbounds %struct.stri* %261, i32 0, i32 10
  %263 = getelementptr inbounds %struct.vector* %262, i32 0, i32 0
  %264 = load double* %263, align 8
  %265 = fmul double %260, %264
  %266 = fadd double %259, %265
  %267 = load %struct.vector** %4, align 8
  %268 = getelementptr inbounds %struct.vector* %267, i32 0, i32 0
  store double %266, double* %268, align 8
  %269 = load double* %W, align 8
  %270 = load %struct.stri** %1, align 8
  %271 = getelementptr inbounds %struct.stri* %270, i32 0, i32 8
  %272 = getelementptr inbounds %struct.vector* %271, i32 0, i32 1
  %273 = load double* %272, align 8
  %274 = fmul double %269, %273
  %275 = load double* %U, align 8
  %276 = load %struct.stri** %1, align 8
  %277 = getelementptr inbounds %struct.stri* %276, i32 0, i32 9
  %278 = getelementptr inbounds %struct.vector* %277, i32 0, i32 1
  %279 = load double* %278, align 8
  %280 = fmul double %275, %279
  %281 = fadd double %274, %280
  %282 = load double* %V, align 8
  %283 = load %struct.stri** %1, align 8
  %284 = getelementptr inbounds %struct.stri* %283, i32 0, i32 10
  %285 = getelementptr inbounds %struct.vector* %284, i32 0, i32 1
  %286 = load double* %285, align 8
  %287 = fmul double %282, %286
  %288 = fadd double %281, %287
  %289 = load %struct.vector** %4, align 8
  %290 = getelementptr inbounds %struct.vector* %289, i32 0, i32 1
  store double %288, double* %290, align 8
  %291 = load double* %W, align 8
  %292 = load %struct.stri** %1, align 8
  %293 = getelementptr inbounds %struct.stri* %292, i32 0, i32 8
  %294 = getelementptr inbounds %struct.vector* %293, i32 0, i32 2
  %295 = load double* %294, align 8
  %296 = fmul double %291, %295
  %297 = load double* %U, align 8
  %298 = load %struct.stri** %1, align 8
  %299 = getelementptr inbounds %struct.stri* %298, i32 0, i32 9
  %300 = getelementptr inbounds %struct.vector* %299, i32 0, i32 2
  %301 = load double* %300, align 8
  %302 = fmul double %297, %301
  %303 = fadd double %296, %302
  %304 = load double* %V, align 8
  %305 = load %struct.stri** %1, align 8
  %306 = getelementptr inbounds %struct.stri* %305, i32 0, i32 10
  %307 = getelementptr inbounds %struct.vector* %306, i32 0, i32 2
  %308 = load double* %307, align 8
  %309 = fmul double %304, %308
  %310 = fadd double %303, %309
  %311 = load %struct.vector** %4, align 8
  %312 = getelementptr inbounds %struct.vector* %311, i32 0, i32 2
  store double %310, double* %312, align 8
  %313 = load %struct.vector** %4, align 8
  %314 = getelementptr inbounds %struct.vector* %313, i32 0, i32 0
  %315 = load double* %314, align 8
  %316 = load %struct.vector** %4, align 8
  %317 = getelementptr inbounds %struct.vector* %316, i32 0, i32 0
  %318 = load double* %317, align 8
  %319 = fmul double %315, %318
  %320 = load %struct.vector** %4, align 8
  %321 = getelementptr inbounds %struct.vector* %320, i32 0, i32 1
  %322 = load double* %321, align 8
  %323 = load %struct.vector** %4, align 8
  %324 = getelementptr inbounds %struct.vector* %323, i32 0, i32 1
  %325 = load double* %324, align 8
  %326 = fmul double %322, %325
  %327 = fadd double %319, %326
  %328 = load %struct.vector** %4, align 8
  %329 = getelementptr inbounds %struct.vector* %328, i32 0, i32 2
  %330 = load double* %329, align 8
  %331 = load %struct.vector** %4, align 8
  %332 = getelementptr inbounds %struct.vector* %331, i32 0, i32 2
  %333 = load double* %332, align 8
  %334 = fmul double %330, %333
  %335 = fadd double %327, %334
  %336 = call double @sqrt(double %335) #3
  %337 = fdiv double 1.000000e+00, %336
  store double %337, double* %invlen, align 8
  %338 = load double* %invlen, align 8
  %339 = load %struct.vector** %4, align 8
  %340 = getelementptr inbounds %struct.vector* %339, i32 0, i32 0
  %341 = load double* %340, align 8
  %342 = fmul double %341, %338
  store double %342, double* %340, align 8
  %343 = load double* %invlen, align 8
  %344 = load %struct.vector** %4, align 8
  %345 = getelementptr inbounds %struct.vector* %344, i32 0, i32 1
  %346 = load double* %345, align 8
  %347 = fmul double %346, %343
  store double %347, double* %345, align 8
  %348 = load double* %invlen, align 8
  %349 = load %struct.vector** %4, align 8
  %350 = getelementptr inbounds %struct.vector* %349, i32 0, i32 2
  %351 = load double* %350, align 8
  %352 = fmul double %351, %348
  store double %352, double* %350, align 8
  %353 = load %struct.vector** %4, align 8
  %354 = load %struct.ray_t** %3, align 8
  %355 = getelementptr inbounds %struct.ray_t* %354, i32 0, i32 1
  %356 = call double @VDot(%struct.vector* %353, %struct.vector* %355)
  %357 = fcmp ogt double %356, 0.000000e+00
  br i1 %357, label %358, label %377

; <label>:358                                     ; preds = %0
  %359 = load %struct.vector** %4, align 8
  %360 = getelementptr inbounds %struct.vector* %359, i32 0, i32 0
  %361 = load double* %360, align 8
  %362 = fsub double -0.000000e+00, %361
  %363 = load %struct.vector** %4, align 8
  %364 = getelementptr inbounds %struct.vector* %363, i32 0, i32 0
  store double %362, double* %364, align 8
  %365 = load %struct.vector** %4, align 8
  %366 = getelementptr inbounds %struct.vector* %365, i32 0, i32 1
  %367 = load double* %366, align 8
  %368 = fsub double -0.000000e+00, %367
  %369 = load %struct.vector** %4, align 8
  %370 = getelementptr inbounds %struct.vector* %369, i32 0, i32 1
  store double %368, double* %370, align 8
  %371 = load %struct.vector** %4, align 8
  %372 = getelementptr inbounds %struct.vector* %371, i32 0, i32 2
  %373 = load double* %372, align 8
  %374 = fsub double -0.000000e+00, %373
  %375 = load %struct.vector** %4, align 8
  %376 = getelementptr inbounds %struct.vector* %375, i32 0, i32 2
  store double %374, double* %376, align 8
  br label %377

; <label>:377                                     ; preds = %358, %0
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @stri_normal(%struct.stri* %trn, %struct.vector* %hit, %struct.ray_t* %incident, %struct.vector* %N) #0 {
  %1 = alloca %struct.stri*, align 8
  %2 = alloca %struct.vector*, align 8
  %3 = alloca %struct.ray_t*, align 8
  %4 = alloca %struct.vector*, align 8
  %U = alloca double, align 8
  %V = alloca double, align 8
  %W = alloca double, align 8
  %lensqr = alloca double, align 8
  %invlen = alloca double, align 8
  %P = alloca %struct.vector, align 8
  %tmp = alloca %struct.vector, align 8
  %norm = alloca %struct.vector, align 8
  store %struct.stri* %trn, %struct.stri** %1, align 8
  store %struct.vector* %hit, %struct.vector** %2, align 8
  store %struct.ray_t* %incident, %struct.ray_t** %3, align 8
  store %struct.vector* %N, %struct.vector** %4, align 8
  %5 = load %struct.stri** %1, align 8
  %6 = getelementptr inbounds %struct.stri* %5, i32 0, i32 6
  %7 = getelementptr inbounds %struct.vector* %6, i32 0, i32 1
  %8 = load double* %7, align 8
  %9 = load %struct.stri** %1, align 8
  %10 = getelementptr inbounds %struct.stri* %9, i32 0, i32 5
  %11 = getelementptr inbounds %struct.vector* %10, i32 0, i32 2
  %12 = load double* %11, align 8
  %13 = fmul double %8, %12
  %14 = load %struct.stri** %1, align 8
  %15 = getelementptr inbounds %struct.stri* %14, i32 0, i32 6
  %16 = getelementptr inbounds %struct.vector* %15, i32 0, i32 2
  %17 = load double* %16, align 8
  %18 = load %struct.stri** %1, align 8
  %19 = getelementptr inbounds %struct.stri* %18, i32 0, i32 5
  %20 = getelementptr inbounds %struct.vector* %19, i32 0, i32 1
  %21 = load double* %20, align 8
  %22 = fmul double %17, %21
  %23 = fsub double %13, %22
  %24 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 0
  store double %23, double* %24, align 8
  %25 = load %struct.stri** %1, align 8
  %26 = getelementptr inbounds %struct.stri* %25, i32 0, i32 6
  %27 = getelementptr inbounds %struct.vector* %26, i32 0, i32 2
  %28 = load double* %27, align 8
  %29 = load %struct.stri** %1, align 8
  %30 = getelementptr inbounds %struct.stri* %29, i32 0, i32 5
  %31 = getelementptr inbounds %struct.vector* %30, i32 0, i32 0
  %32 = load double* %31, align 8
  %33 = fmul double %28, %32
  %34 = load %struct.stri** %1, align 8
  %35 = getelementptr inbounds %struct.stri* %34, i32 0, i32 6
  %36 = getelementptr inbounds %struct.vector* %35, i32 0, i32 0
  %37 = load double* %36, align 8
  %38 = load %struct.stri** %1, align 8
  %39 = getelementptr inbounds %struct.stri* %38, i32 0, i32 5
  %40 = getelementptr inbounds %struct.vector* %39, i32 0, i32 2
  %41 = load double* %40, align 8
  %42 = fmul double %37, %41
  %43 = fsub double %33, %42
  %44 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 1
  store double %43, double* %44, align 8
  %45 = load %struct.stri** %1, align 8
  %46 = getelementptr inbounds %struct.stri* %45, i32 0, i32 6
  %47 = getelementptr inbounds %struct.vector* %46, i32 0, i32 0
  %48 = load double* %47, align 8
  %49 = load %struct.stri** %1, align 8
  %50 = getelementptr inbounds %struct.stri* %49, i32 0, i32 5
  %51 = getelementptr inbounds %struct.vector* %50, i32 0, i32 1
  %52 = load double* %51, align 8
  %53 = fmul double %48, %52
  %54 = load %struct.stri** %1, align 8
  %55 = getelementptr inbounds %struct.stri* %54, i32 0, i32 6
  %56 = getelementptr inbounds %struct.vector* %55, i32 0, i32 1
  %57 = load double* %56, align 8
  %58 = load %struct.stri** %1, align 8
  %59 = getelementptr inbounds %struct.stri* %58, i32 0, i32 5
  %60 = getelementptr inbounds %struct.vector* %59, i32 0, i32 0
  %61 = load double* %60, align 8
  %62 = fmul double %57, %61
  %63 = fsub double %53, %62
  %64 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 2
  store double %63, double* %64, align 8
  %65 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 0
  %66 = load double* %65, align 8
  %67 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 0
  %68 = load double* %67, align 8
  %69 = fmul double %66, %68
  %70 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 1
  %71 = load double* %70, align 8
  %72 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 1
  %73 = load double* %72, align 8
  %74 = fmul double %71, %73
  %75 = fadd double %69, %74
  %76 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 2
  %77 = load double* %76, align 8
  %78 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 2
  %79 = load double* %78, align 8
  %80 = fmul double %77, %79
  %81 = fadd double %75, %80
  store double %81, double* %lensqr, align 8
  %82 = load %struct.vector** %2, align 8
  %83 = getelementptr inbounds %struct.vector* %82, i32 0, i32 0
  %84 = load double* %83, align 8
  %85 = load %struct.stri** %1, align 8
  %86 = getelementptr inbounds %struct.stri* %85, i32 0, i32 7
  %87 = getelementptr inbounds %struct.vector* %86, i32 0, i32 0
  %88 = load double* %87, align 8
  %89 = fsub double %84, %88
  %90 = getelementptr inbounds %struct.vector* %P, i32 0, i32 0
  store double %89, double* %90, align 8
  %91 = load %struct.vector** %2, align 8
  %92 = getelementptr inbounds %struct.vector* %91, i32 0, i32 1
  %93 = load double* %92, align 8
  %94 = load %struct.stri** %1, align 8
  %95 = getelementptr inbounds %struct.stri* %94, i32 0, i32 7
  %96 = getelementptr inbounds %struct.vector* %95, i32 0, i32 1
  %97 = load double* %96, align 8
  %98 = fsub double %93, %97
  %99 = getelementptr inbounds %struct.vector* %P, i32 0, i32 1
  store double %98, double* %99, align 8
  %100 = load %struct.vector** %2, align 8
  %101 = getelementptr inbounds %struct.vector* %100, i32 0, i32 2
  %102 = load double* %101, align 8
  %103 = load %struct.stri** %1, align 8
  %104 = getelementptr inbounds %struct.stri* %103, i32 0, i32 7
  %105 = getelementptr inbounds %struct.vector* %104, i32 0, i32 2
  %106 = load double* %105, align 8
  %107 = fsub double %102, %106
  %108 = getelementptr inbounds %struct.vector* %P, i32 0, i32 2
  store double %107, double* %108, align 8
  %109 = getelementptr inbounds %struct.vector* %P, i32 0, i32 1
  %110 = load double* %109, align 8
  %111 = load %struct.stri** %1, align 8
  %112 = getelementptr inbounds %struct.stri* %111, i32 0, i32 5
  %113 = getelementptr inbounds %struct.vector* %112, i32 0, i32 2
  %114 = load double* %113, align 8
  %115 = fmul double %110, %114
  %116 = getelementptr inbounds %struct.vector* %P, i32 0, i32 2
  %117 = load double* %116, align 8
  %118 = load %struct.stri** %1, align 8
  %119 = getelementptr inbounds %struct.stri* %118, i32 0, i32 5
  %120 = getelementptr inbounds %struct.vector* %119, i32 0, i32 1
  %121 = load double* %120, align 8
  %122 = fmul double %117, %121
  %123 = fsub double %115, %122
  %124 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 0
  store double %123, double* %124, align 8
  %125 = getelementptr inbounds %struct.vector* %P, i32 0, i32 2
  %126 = load double* %125, align 8
  %127 = load %struct.stri** %1, align 8
  %128 = getelementptr inbounds %struct.stri* %127, i32 0, i32 5
  %129 = getelementptr inbounds %struct.vector* %128, i32 0, i32 0
  %130 = load double* %129, align 8
  %131 = fmul double %126, %130
  %132 = getelementptr inbounds %struct.vector* %P, i32 0, i32 0
  %133 = load double* %132, align 8
  %134 = load %struct.stri** %1, align 8
  %135 = getelementptr inbounds %struct.stri* %134, i32 0, i32 5
  %136 = getelementptr inbounds %struct.vector* %135, i32 0, i32 2
  %137 = load double* %136, align 8
  %138 = fmul double %133, %137
  %139 = fsub double %131, %138
  %140 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 1
  store double %139, double* %140, align 8
  %141 = getelementptr inbounds %struct.vector* %P, i32 0, i32 0
  %142 = load double* %141, align 8
  %143 = load %struct.stri** %1, align 8
  %144 = getelementptr inbounds %struct.stri* %143, i32 0, i32 5
  %145 = getelementptr inbounds %struct.vector* %144, i32 0, i32 1
  %146 = load double* %145, align 8
  %147 = fmul double %142, %146
  %148 = getelementptr inbounds %struct.vector* %P, i32 0, i32 1
  %149 = load double* %148, align 8
  %150 = load %struct.stri** %1, align 8
  %151 = getelementptr inbounds %struct.stri* %150, i32 0, i32 5
  %152 = getelementptr inbounds %struct.vector* %151, i32 0, i32 0
  %153 = load double* %152, align 8
  %154 = fmul double %149, %153
  %155 = fsub double %147, %154
  %156 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 2
  store double %155, double* %156, align 8
  %157 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 0
  %158 = load double* %157, align 8
  %159 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 0
  %160 = load double* %159, align 8
  %161 = fmul double %158, %160
  %162 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 1
  %163 = load double* %162, align 8
  %164 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 1
  %165 = load double* %164, align 8
  %166 = fmul double %163, %165
  %167 = fadd double %161, %166
  %168 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 2
  %169 = load double* %168, align 8
  %170 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 2
  %171 = load double* %170, align 8
  %172 = fmul double %169, %171
  %173 = fadd double %167, %172
  %174 = load double* %lensqr, align 8
  %175 = fdiv double %173, %174
  store double %175, double* %U, align 8
  %176 = load %struct.stri** %1, align 8
  %177 = getelementptr inbounds %struct.stri* %176, i32 0, i32 6
  %178 = getelementptr inbounds %struct.vector* %177, i32 0, i32 1
  %179 = load double* %178, align 8
  %180 = getelementptr inbounds %struct.vector* %P, i32 0, i32 2
  %181 = load double* %180, align 8
  %182 = fmul double %179, %181
  %183 = load %struct.stri** %1, align 8
  %184 = getelementptr inbounds %struct.stri* %183, i32 0, i32 6
  %185 = getelementptr inbounds %struct.vector* %184, i32 0, i32 2
  %186 = load double* %185, align 8
  %187 = getelementptr inbounds %struct.vector* %P, i32 0, i32 1
  %188 = load double* %187, align 8
  %189 = fmul double %186, %188
  %190 = fsub double %182, %189
  %191 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 0
  store double %190, double* %191, align 8
  %192 = load %struct.stri** %1, align 8
  %193 = getelementptr inbounds %struct.stri* %192, i32 0, i32 6
  %194 = getelementptr inbounds %struct.vector* %193, i32 0, i32 2
  %195 = load double* %194, align 8
  %196 = getelementptr inbounds %struct.vector* %P, i32 0, i32 0
  %197 = load double* %196, align 8
  %198 = fmul double %195, %197
  %199 = load %struct.stri** %1, align 8
  %200 = getelementptr inbounds %struct.stri* %199, i32 0, i32 6
  %201 = getelementptr inbounds %struct.vector* %200, i32 0, i32 0
  %202 = load double* %201, align 8
  %203 = getelementptr inbounds %struct.vector* %P, i32 0, i32 2
  %204 = load double* %203, align 8
  %205 = fmul double %202, %204
  %206 = fsub double %198, %205
  %207 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 1
  store double %206, double* %207, align 8
  %208 = load %struct.stri** %1, align 8
  %209 = getelementptr inbounds %struct.stri* %208, i32 0, i32 6
  %210 = getelementptr inbounds %struct.vector* %209, i32 0, i32 0
  %211 = load double* %210, align 8
  %212 = getelementptr inbounds %struct.vector* %P, i32 0, i32 1
  %213 = load double* %212, align 8
  %214 = fmul double %211, %213
  %215 = load %struct.stri** %1, align 8
  %216 = getelementptr inbounds %struct.stri* %215, i32 0, i32 6
  %217 = getelementptr inbounds %struct.vector* %216, i32 0, i32 1
  %218 = load double* %217, align 8
  %219 = getelementptr inbounds %struct.vector* %P, i32 0, i32 0
  %220 = load double* %219, align 8
  %221 = fmul double %218, %220
  %222 = fsub double %214, %221
  %223 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 2
  store double %222, double* %223, align 8
  %224 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 0
  %225 = load double* %224, align 8
  %226 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 0
  %227 = load double* %226, align 8
  %228 = fmul double %225, %227
  %229 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 1
  %230 = load double* %229, align 8
  %231 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 1
  %232 = load double* %231, align 8
  %233 = fmul double %230, %232
  %234 = fadd double %228, %233
  %235 = getelementptr inbounds %struct.vector* %tmp, i32 0, i32 2
  %236 = load double* %235, align 8
  %237 = getelementptr inbounds %struct.vector* %norm, i32 0, i32 2
  %238 = load double* %237, align 8
  %239 = fmul double %236, %238
  %240 = fadd double %234, %239
  %241 = load double* %lensqr, align 8
  %242 = fdiv double %240, %241
  store double %242, double* %V, align 8
  %243 = load double* %U, align 8
  %244 = load double* %V, align 8
  %245 = fadd double %243, %244
  %246 = fsub double 1.000000e+00, %245
  store double %246, double* %W, align 8
  %247 = load double* %W, align 8
  %248 = load %struct.stri** %1, align 8
  %249 = getelementptr inbounds %struct.stri* %248, i32 0, i32 8
  %250 = getelementptr inbounds %struct.vector* %249, i32 0, i32 0
  %251 = load double* %250, align 8
  %252 = fmul double %247, %251
  %253 = load double* %U, align 8
  %254 = load %struct.stri** %1, align 8
  %255 = getelementptr inbounds %struct.stri* %254, i32 0, i32 9
  %256 = getelementptr inbounds %struct.vector* %255, i32 0, i32 0
  %257 = load double* %256, align 8
  %258 = fmul double %253, %257
  %259 = fadd double %252, %258
  %260 = load double* %V, align 8
  %261 = load %struct.stri** %1, align 8
  %262 = getelementptr inbounds %struct.stri* %261, i32 0, i32 10
  %263 = getelementptr inbounds %struct.vector* %262, i32 0, i32 0
  %264 = load double* %263, align 8
  %265 = fmul double %260, %264
  %266 = fadd double %259, %265
  %267 = load %struct.vector** %4, align 8
  %268 = getelementptr inbounds %struct.vector* %267, i32 0, i32 0
  store double %266, double* %268, align 8
  %269 = load double* %W, align 8
  %270 = load %struct.stri** %1, align 8
  %271 = getelementptr inbounds %struct.stri* %270, i32 0, i32 8
  %272 = getelementptr inbounds %struct.vector* %271, i32 0, i32 1
  %273 = load double* %272, align 8
  %274 = fmul double %269, %273
  %275 = load double* %U, align 8
  %276 = load %struct.stri** %1, align 8
  %277 = getelementptr inbounds %struct.stri* %276, i32 0, i32 9
  %278 = getelementptr inbounds %struct.vector* %277, i32 0, i32 1
  %279 = load double* %278, align 8
  %280 = fmul double %275, %279
  %281 = fadd double %274, %280
  %282 = load double* %V, align 8
  %283 = load %struct.stri** %1, align 8
  %284 = getelementptr inbounds %struct.stri* %283, i32 0, i32 10
  %285 = getelementptr inbounds %struct.vector* %284, i32 0, i32 1
  %286 = load double* %285, align 8
  %287 = fmul double %282, %286
  %288 = fadd double %281, %287
  %289 = load %struct.vector** %4, align 8
  %290 = getelementptr inbounds %struct.vector* %289, i32 0, i32 1
  store double %288, double* %290, align 8
  %291 = load double* %W, align 8
  %292 = load %struct.stri** %1, align 8
  %293 = getelementptr inbounds %struct.stri* %292, i32 0, i32 8
  %294 = getelementptr inbounds %struct.vector* %293, i32 0, i32 2
  %295 = load double* %294, align 8
  %296 = fmul double %291, %295
  %297 = load double* %U, align 8
  %298 = load %struct.stri** %1, align 8
  %299 = getelementptr inbounds %struct.stri* %298, i32 0, i32 9
  %300 = getelementptr inbounds %struct.vector* %299, i32 0, i32 2
  %301 = load double* %300, align 8
  %302 = fmul double %297, %301
  %303 = fadd double %296, %302
  %304 = load double* %V, align 8
  %305 = load %struct.stri** %1, align 8
  %306 = getelementptr inbounds %struct.stri* %305, i32 0, i32 10
  %307 = getelementptr inbounds %struct.vector* %306, i32 0, i32 2
  %308 = load double* %307, align 8
  %309 = fmul double %304, %308
  %310 = fadd double %303, %309
  %311 = load %struct.vector** %4, align 8
  %312 = getelementptr inbounds %struct.vector* %311, i32 0, i32 2
  store double %310, double* %312, align 8
  %313 = load %struct.vector** %4, align 8
  %314 = getelementptr inbounds %struct.vector* %313, i32 0, i32 0
  %315 = load double* %314, align 8
  %316 = load %struct.vector** %4, align 8
  %317 = getelementptr inbounds %struct.vector* %316, i32 0, i32 0
  %318 = load double* %317, align 8
  %319 = fmul double %315, %318
  %320 = load %struct.vector** %4, align 8
  %321 = getelementptr inbounds %struct.vector* %320, i32 0, i32 1
  %322 = load double* %321, align 8
  %323 = load %struct.vector** %4, align 8
  %324 = getelementptr inbounds %struct.vector* %323, i32 0, i32 1
  %325 = load double* %324, align 8
  %326 = fmul double %322, %325
  %327 = fadd double %319, %326
  %328 = load %struct.vector** %4, align 8
  %329 = getelementptr inbounds %struct.vector* %328, i32 0, i32 2
  %330 = load double* %329, align 8
  %331 = load %struct.vector** %4, align 8
  %332 = getelementptr inbounds %struct.vector* %331, i32 0, i32 2
  %333 = load double* %332, align 8
  %334 = fmul double %330, %333
  %335 = fadd double %327, %334
  %336 = call double @sqrt(double %335) #3
  %337 = fdiv double 1.000000e+00, %336
  store double %337, double* %invlen, align 8
  %338 = load double* %invlen, align 8
  %339 = load %struct.vector** %4, align 8
  %340 = getelementptr inbounds %struct.vector* %339, i32 0, i32 0
  %341 = load double* %340, align 8
  %342 = fmul double %341, %338
  store double %342, double* %340, align 8
  %343 = load double* %invlen, align 8
  %344 = load %struct.vector** %4, align 8
  %345 = getelementptr inbounds %struct.vector* %344, i32 0, i32 1
  %346 = load double* %345, align 8
  %347 = fmul double %346, %343
  store double %347, double* %345, align 8
  %348 = load double* %invlen, align 8
  %349 = load %struct.vector** %4, align 8
  %350 = getelementptr inbounds %struct.vector* %349, i32 0, i32 2
  %351 = load double* %350, align 8
  %352 = fmul double %351, %348
  store double %352, double* %350, align 8
  %353 = load %struct.ray_t** %3, align 8
  %354 = getelementptr inbounds %struct.ray_t* %353, i32 0, i32 1
  %355 = call double @VDot(%struct.vector* %norm, %struct.vector* %354)
  %356 = fcmp ogt double %355, 0.000000e+00
  br i1 %356, label %357, label %376

; <label>:357                                     ; preds = %0
  %358 = load %struct.vector** %4, align 8
  %359 = getelementptr inbounds %struct.vector* %358, i32 0, i32 0
  %360 = load double* %359, align 8
  %361 = fsub double -0.000000e+00, %360
  %362 = load %struct.vector** %4, align 8
  %363 = getelementptr inbounds %struct.vector* %362, i32 0, i32 0
  store double %361, double* %363, align 8
  %364 = load %struct.vector** %4, align 8
  %365 = getelementptr inbounds %struct.vector* %364, i32 0, i32 1
  %366 = load double* %365, align 8
  %367 = fsub double -0.000000e+00, %366
  %368 = load %struct.vector** %4, align 8
  %369 = getelementptr inbounds %struct.vector* %368, i32 0, i32 1
  store double %367, double* %369, align 8
  %370 = load %struct.vector** %4, align 8
  %371 = getelementptr inbounds %struct.vector* %370, i32 0, i32 2
  %372 = load double* %371, align 8
  %373 = fsub double -0.000000e+00, %372
  %374 = load %struct.vector** %4, align 8
  %375 = getelementptr inbounds %struct.vector* %374, i32 0, i32 2
  store double %373, double* %375, align 8
  br label %376

; <label>:376                                     ; preds = %357, %0
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @tri_normal(%struct.tri* %trn, %struct.vector* %hit, %struct.ray_t* %incident, %struct.vector* %N) #0 {
  %1 = alloca %struct.tri*, align 8
  %2 = alloca %struct.vector*, align 8
  %3 = alloca %struct.ray_t*, align 8
  %4 = alloca %struct.vector*, align 8
  %invlen = alloca double, align 8
  store %struct.tri* %trn, %struct.tri** %1, align 8
  store %struct.vector* %hit, %struct.vector** %2, align 8
  store %struct.ray_t* %incident, %struct.ray_t** %3, align 8
  store %struct.vector* %N, %struct.vector** %4, align 8
  %5 = load %struct.tri** %1, align 8
  %6 = getelementptr inbounds %struct.tri* %5, i32 0, i32 6
  %7 = getelementptr inbounds %struct.vector* %6, i32 0, i32 1
  %8 = load double* %7, align 8
  %9 = load %struct.tri** %1, align 8
  %10 = getelementptr inbounds %struct.tri* %9, i32 0, i32 5
  %11 = getelementptr inbounds %struct.vector* %10, i32 0, i32 2
  %12 = load double* %11, align 8
  %13 = fmul double %8, %12
  %14 = load %struct.tri** %1, align 8
  %15 = getelementptr inbounds %struct.tri* %14, i32 0, i32 6
  %16 = getelementptr inbounds %struct.vector* %15, i32 0, i32 2
  %17 = load double* %16, align 8
  %18 = load %struct.tri** %1, align 8
  %19 = getelementptr inbounds %struct.tri* %18, i32 0, i32 5
  %20 = getelementptr inbounds %struct.vector* %19, i32 0, i32 1
  %21 = load double* %20, align 8
  %22 = fmul double %17, %21
  %23 = fsub double %13, %22
  %24 = load %struct.vector** %4, align 8
  %25 = getelementptr inbounds %struct.vector* %24, i32 0, i32 0
  store double %23, double* %25, align 8
  %26 = load %struct.tri** %1, align 8
  %27 = getelementptr inbounds %struct.tri* %26, i32 0, i32 6
  %28 = getelementptr inbounds %struct.vector* %27, i32 0, i32 2
  %29 = load double* %28, align 8
  %30 = load %struct.tri** %1, align 8
  %31 = getelementptr inbounds %struct.tri* %30, i32 0, i32 5
  %32 = getelementptr inbounds %struct.vector* %31, i32 0, i32 0
  %33 = load double* %32, align 8
  %34 = fmul double %29, %33
  %35 = load %struct.tri** %1, align 8
  %36 = getelementptr inbounds %struct.tri* %35, i32 0, i32 6
  %37 = getelementptr inbounds %struct.vector* %36, i32 0, i32 0
  %38 = load double* %37, align 8
  %39 = load %struct.tri** %1, align 8
  %40 = getelementptr inbounds %struct.tri* %39, i32 0, i32 5
  %41 = getelementptr inbounds %struct.vector* %40, i32 0, i32 2
  %42 = load double* %41, align 8
  %43 = fmul double %38, %42
  %44 = fsub double %34, %43
  %45 = load %struct.vector** %4, align 8
  %46 = getelementptr inbounds %struct.vector* %45, i32 0, i32 1
  store double %44, double* %46, align 8
  %47 = load %struct.tri** %1, align 8
  %48 = getelementptr inbounds %struct.tri* %47, i32 0, i32 6
  %49 = getelementptr inbounds %struct.vector* %48, i32 0, i32 0
  %50 = load double* %49, align 8
  %51 = load %struct.tri** %1, align 8
  %52 = getelementptr inbounds %struct.tri* %51, i32 0, i32 5
  %53 = getelementptr inbounds %struct.vector* %52, i32 0, i32 1
  %54 = load double* %53, align 8
  %55 = fmul double %50, %54
  %56 = load %struct.tri** %1, align 8
  %57 = getelementptr inbounds %struct.tri* %56, i32 0, i32 6
  %58 = getelementptr inbounds %struct.vector* %57, i32 0, i32 1
  %59 = load double* %58, align 8
  %60 = load %struct.tri** %1, align 8
  %61 = getelementptr inbounds %struct.tri* %60, i32 0, i32 5
  %62 = getelementptr inbounds %struct.vector* %61, i32 0, i32 0
  %63 = load double* %62, align 8
  %64 = fmul double %59, %63
  %65 = fsub double %55, %64
  %66 = load %struct.vector** %4, align 8
  %67 = getelementptr inbounds %struct.vector* %66, i32 0, i32 2
  store double %65, double* %67, align 8
  %68 = load %struct.vector** %4, align 8
  %69 = getelementptr inbounds %struct.vector* %68, i32 0, i32 0
  %70 = load double* %69, align 8
  %71 = load %struct.vector** %4, align 8
  %72 = getelementptr inbounds %struct.vector* %71, i32 0, i32 0
  %73 = load double* %72, align 8
  %74 = fmul double %70, %73
  %75 = load %struct.vector** %4, align 8
  %76 = getelementptr inbounds %struct.vector* %75, i32 0, i32 1
  %77 = load double* %76, align 8
  %78 = load %struct.vector** %4, align 8
  %79 = getelementptr inbounds %struct.vector* %78, i32 0, i32 1
  %80 = load double* %79, align 8
  %81 = fmul double %77, %80
  %82 = fadd double %74, %81
  %83 = load %struct.vector** %4, align 8
  %84 = getelementptr inbounds %struct.vector* %83, i32 0, i32 2
  %85 = load double* %84, align 8
  %86 = load %struct.vector** %4, align 8
  %87 = getelementptr inbounds %struct.vector* %86, i32 0, i32 2
  %88 = load double* %87, align 8
  %89 = fmul double %85, %88
  %90 = fadd double %82, %89
  %91 = call double @sqrt(double %90) #3
  %92 = fdiv double 1.000000e+00, %91
  store double %92, double* %invlen, align 8
  %93 = load double* %invlen, align 8
  %94 = load %struct.vector** %4, align 8
  %95 = getelementptr inbounds %struct.vector* %94, i32 0, i32 0
  %96 = load double* %95, align 8
  %97 = fmul double %96, %93
  store double %97, double* %95, align 8
  %98 = load double* %invlen, align 8
  %99 = load %struct.vector** %4, align 8
  %100 = getelementptr inbounds %struct.vector* %99, i32 0, i32 1
  %101 = load double* %100, align 8
  %102 = fmul double %101, %98
  store double %102, double* %100, align 8
  %103 = load double* %invlen, align 8
  %104 = load %struct.vector** %4, align 8
  %105 = getelementptr inbounds %struct.vector* %104, i32 0, i32 2
  %106 = load double* %105, align 8
  %107 = fmul double %106, %103
  store double %107, double* %105, align 8
  %108 = load %struct.vector** %4, align 8
  %109 = load %struct.ray_t** %3, align 8
  %110 = getelementptr inbounds %struct.ray_t* %109, i32 0, i32 1
  %111 = call double @VDot(%struct.vector* %108, %struct.vector* %110)
  %112 = fcmp ogt double %111, 0.000000e+00
  br i1 %112, label %113, label %132

; <label>:113                                     ; preds = %0
  %114 = load %struct.vector** %4, align 8
  %115 = getelementptr inbounds %struct.vector* %114, i32 0, i32 0
  %116 = load double* %115, align 8
  %117 = fsub double -0.000000e+00, %116
  %118 = load %struct.vector** %4, align 8
  %119 = getelementptr inbounds %struct.vector* %118, i32 0, i32 0
  store double %117, double* %119, align 8
  %120 = load %struct.vector** %4, align 8
  %121 = getelementptr inbounds %struct.vector* %120, i32 0, i32 1
  %122 = load double* %121, align 8
  %123 = fsub double -0.000000e+00, %122
  %124 = load %struct.vector** %4, align 8
  %125 = getelementptr inbounds %struct.vector* %124, i32 0, i32 1
  store double %123, double* %125, align 8
  %126 = load %struct.vector** %4, align 8
  %127 = getelementptr inbounds %struct.vector* %126, i32 0, i32 2
  %128 = load double* %127, align 8
  %129 = fsub double -0.000000e+00, %128
  %130 = load %struct.vector** %4, align 8
  %131 = getelementptr inbounds %struct.vector* %130, i32 0, i32 2
  store double %129, double* %131, align 8
  br label %132

; <label>:132                                     ; preds = %113, %0
  ret void
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
