; ModuleID = 'planes.cpp'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%"struct.pov::Object_Struct" = type { %"struct.pov::Method_Struct"*, i32, %"struct.pov::Object_Struct"*, %"struct.pov::Texture_Struct"*, %"struct.pov::Texture_Struct"*, %"struct.pov::Interior_Struct"*, %"struct.pov::Object_Struct"*, %"struct.pov::Object_Struct"*, %"struct.pov::Light_Source_Struct"*, %"struct.pov::Bounding_Box_Struct", %"struct.pov::Transform_Struct"*, %"struct.pov::Transform_Struct"*, float, i32 }
%"struct.pov::Method_Struct" = type { {}*, i32 (double*, %"struct.pov::Object_Struct"*)*, void (double*, %"struct.pov::Object_Struct"*, %"struct.pov::istk_entry"*)*, void (double*, %"struct.pov::Object_Struct"*, %"struct.pov::istk_entry"*)*, i8* (%"struct.pov::Object_Struct"*)*, void (%"struct.pov::Object_Struct"*, double*, %"struct.pov::Transform_Struct"*)*, void (%"struct.pov::Object_Struct"*, double*, %"struct.pov::Transform_Struct"*)*, void (%"struct.pov::Object_Struct"*, double*, %"struct.pov::Transform_Struct"*)*, void (%"struct.pov::Object_Struct"*, %"struct.pov::Transform_Struct"*)*, void (%"struct.pov::Object_Struct"*)*, void (%"struct.pov::Object_Struct"*)* }
%"struct.pov::Texture_Struct" = type { i16, i16, i16, i32, float, float, float, %"struct.pov::Warps_Struct"*, %"struct.pov::Pattern_Struct"*, %"struct.pov::Blend_Map_Struct"*, %union.anon.25, %"struct.pov::Texture_Struct"*, %"struct.pov::Pigment_Struct"*, %"struct.pov::Tnormal_Struct"*, %"struct.pov::Finish_Struct"*, %"struct.pov::Texture_Struct"*, i32 }
%"struct.pov::Warps_Struct" = type { i16, %"struct.pov::Warps_Struct"*, %"struct.pov::Warps_Struct"* }
%"struct.pov::Pattern_Struct" = type { i16, i16, i16, i32, float, float, float, %"struct.pov::Warps_Struct"*, %"struct.pov::Pattern_Struct"*, %"struct.pov::Blend_Map_Struct"*, %union.anon.17 }
%union.anon.17 = type { %struct.anon.21 }
%struct.anon.21 = type { [3 x double], [3 x double], double, double, i16, [3 x double]*, i32, [3 x double] }
%"struct.pov::Blend_Map_Struct" = type { i32, i16, i8, i8, %"struct.pov::Blend_Map_Entry"* }
%"struct.pov::Blend_Map_Entry" = type { float, i8, %union.anon }
%union.anon = type { [2 x double], [8 x i8] }
%union.anon.25 = type { %struct.anon.29 }
%struct.anon.29 = type { [3 x double], [3 x double], double, double, i16, [3 x double]*, i32, [3 x double] }
%"struct.pov::Pigment_Struct" = type { i16, i16, i16, i32, float, float, float, %"struct.pov::Warps_Struct"*, %"struct.pov::Pattern_Struct"*, %"struct.pov::Blend_Map_Struct"*, %union.anon.0, [5 x float] }
%union.anon.0 = type { %struct.anon.5 }
%struct.anon.5 = type { [3 x double], [3 x double], double, double, i16, [3 x double]*, i32, [3 x double] }
%"struct.pov::Tnormal_Struct" = type { i16, i16, i16, i32, float, float, float, %"struct.pov::Warps_Struct"*, %"struct.pov::Pattern_Struct"*, %"struct.pov::Blend_Map_Struct"*, %union.anon.9, float, float }
%union.anon.9 = type { %struct.anon.13 }
%struct.anon.13 = type { [3 x double], [3 x double], double, double, i16, [3 x double]*, i32, [3 x double] }
%"struct.pov::Finish_Struct" = type { float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, float, [3 x float], [3 x float], [3 x float], float, i32, float, i32 }
%"struct.pov::Interior_Struct" = type { i32, i32, i32, float, float, float, float, float, float, [5 x float], %"struct.pov::Media_Struct"* }
%"struct.pov::Media_Struct" = type { i32, i32, i32, i32, i32, double, i32, double, double, i32, i32, i32, i32, [5 x float], [5 x float], [5 x float], [5 x float], double, double, double, double*, double, i32, i32, %"struct.pov::Pigment_Struct"*, %"struct.pov::Media_Struct"* }
%"struct.pov::Light_Source_Struct" = type { %"struct.pov::Method_Struct"*, i32, %"struct.pov::Object_Struct"*, %"struct.pov::Texture_Struct"*, %"struct.pov::Texture_Struct"*, %"struct.pov::Interior_Struct"*, %"struct.pov::Object_Struct"*, %"struct.pov::Object_Struct"*, %"struct.pov::Light_Source_Struct"*, %"struct.pov::Bounding_Box_Struct", %"struct.pov::Transform_Struct"*, %"struct.pov::Transform_Struct"*, float, i32, %"struct.pov::Object_Struct"*, [5 x float], [3 x double], [3 x double], [3 x double], [3 x double], [3 x double], double, double, double, double, double, %"struct.pov::Light_Source_Struct"*, i8, i8, i8, i8, i8, i8, i8, i8, i32, i32, i32, i32, i32, [5 x float]**, %"struct.pov::Object_Struct"*, %"struct.pov::Object_Struct"*, %"struct.pov::Blend_Map_Struct"*, [6 x %"struct.pov::Project_Tree_Node_Struct"*] }
%"struct.pov::Project_Tree_Node_Struct" = type { i16, %"struct.pov::BBox_Tree_Struct"*, %"struct.pov::Project_Struct", i16, %"struct.pov::Project_Tree_Node_Struct"** }
%"struct.pov::BBox_Tree_Struct" = type { i16, i16, %"struct.pov::Bounding_Box_Struct", %"struct.pov::BBox_Tree_Struct"** }
%"struct.pov::Project_Struct" = type { i32, i32, i32, i32 }
%"struct.pov::Bounding_Box_Struct" = type { [3 x float], [3 x float] }
%"struct.pov::Transform_Struct" = type { [4 x [4 x double]], [4 x [4 x double]] }
%"struct.pov::Ray_Struct" = type { [3 x double], [3 x double], i32, i32, [100 x %"struct.pov::Interior_Struct"*] }
%"struct.pov::istack_struct" = type { %"struct.pov::istack_struct"*, %"struct.pov::istk_entry"*, i32, i32 }
%"struct.pov::istk_entry" = type { double, [3 x double], [3 x double], [3 x double], [2 x double], %"struct.pov::Object_Struct"*, i32, i32, double, double, double, double, double, double, double, double, double, i8*, i8* }
%"struct.pov::Plane_Struct" = type { %"struct.pov::Method_Struct"*, i32, %"struct.pov::Object_Struct"*, %"struct.pov::Texture_Struct"*, %"struct.pov::Texture_Struct"*, %"struct.pov::Interior_Struct"*, %"struct.pov::Object_Struct"*, %"struct.pov::Object_Struct"*, %"struct.pov::Light_Source_Struct"*, %"struct.pov::Bounding_Box_Struct", %"struct.pov::Transform_Struct"*, %"struct.pov::Transform_Struct"*, float, i32, [3 x double], double }

@_ZN3pov13Plane_MethodsE = global { i32 (%"struct.pov::Object_Struct"*, %"struct.pov::Ray_Struct"*, %"struct.pov::istack_struct"*)*, i32 (double*, %"struct.pov::Object_Struct"*)*, void (double*, %"struct.pov::Object_Struct"*, %"struct.pov::istk_entry"*)*, void (double*, %"struct.pov::Object_Struct"*, %"struct.pov::istk_entry"*)*, i8* (%"struct.pov::Object_Struct"*)*, void (%"struct.pov::Object_Struct"*, double*, %"struct.pov::Transform_Struct"*)*, void (%"struct.pov::Object_Struct"*, double*, %"struct.pov::Transform_Struct"*)*, void (%"struct.pov::Object_Struct"*, double*, %"struct.pov::Transform_Struct"*)*, void (%"struct.pov::Object_Struct"*, %"struct.pov::Transform_Struct"*)*, void (%"struct.pov::Object_Struct"*)*, void (%"struct.pov::Object_Struct"*)* } { i32 (%"struct.pov::Object_Struct"*, %"struct.pov::Ray_Struct"*, %"struct.pov::istack_struct"*)* @_ZN3povL23All_Plane_IntersectionsEPNS_13Object_StructEPNS_10Ray_StructEPNS_13istack_structE, i32 (double*, %"struct.pov::Object_Struct"*)* @_ZN3povL12Inside_PlaneEPdPNS_13Object_StructE, void (double*, %"struct.pov::Object_Struct"*, %"struct.pov::istk_entry"*)* @_ZN3povL12Plane_NormalEPdPNS_13Object_StructEPNS_10istk_entryE, void (double*, %"struct.pov::Object_Struct"*, %"struct.pov::istk_entry"*)* @_ZN3pov15Default_UVCoordEPdPNS_13Object_StructEPNS_10istk_entryE, i8* (%"struct.pov::Object_Struct"*)* bitcast (%"struct.pov::Plane_Struct"* (%"struct.pov::Object_Struct"*)* @_ZN3povL10Copy_PlaneEPNS_13Object_StructE to i8* (%"struct.pov::Object_Struct"*)*), void (%"struct.pov::Object_Struct"*, double*, %"struct.pov::Transform_Struct"*)* @_ZN3povL15Translate_PlaneEPNS_13Object_StructEPdPNS_16Transform_StructE, void (%"struct.pov::Object_Struct"*, double*, %"struct.pov::Transform_Struct"*)* @_ZN3povL12Rotate_PlaneEPNS_13Object_StructEPdPNS_16Transform_StructE, void (%"struct.pov::Object_Struct"*, double*, %"struct.pov::Transform_Struct"*)* @_ZN3povL11Scale_PlaneEPNS_13Object_StructEPdPNS_16Transform_StructE, void (%"struct.pov::Object_Struct"*, %"struct.pov::Transform_Struct"*)* @_ZN3povL15Transform_PlaneEPNS_13Object_StructEPNS_16Transform_StructE, void (%"struct.pov::Object_Struct"*)* @_ZN3povL12Invert_PlaneEPNS_13Object_StructE, void (%"struct.pov::Object_Struct"*)* @_ZN3povL13Destroy_PlaneEPNS_13Object_StructE }, align 8
@.str = private unnamed_addr constant [11 x i8] c"planes.cpp\00", align 1
@.str1 = private unnamed_addr constant [6 x i8] c"plane\00", align 1
@_ZN3pov5statsE = external global [126 x i64]

; Function Attrs: uwtable
define internal i32 @_ZN3povL23All_Plane_IntersectionsEPNS_13Object_StructEPNS_10Ray_StructEPNS_13istack_structE(%"struct.pov::Object_Struct"* %Object, %"struct.pov::Ray_Struct"* %Ray, %"struct.pov::istack_struct"* %Depth_Stack) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %"struct.pov::Object_Struct"*, align 8
  %3 = alloca %"struct.pov::Ray_Struct"*, align 8
  %4 = alloca %"struct.pov::istack_struct"*, align 8
  %Depth = alloca double, align 8
  %IPoint = alloca [3 x double], align 16
  store %"struct.pov::Object_Struct"* %Object, %"struct.pov::Object_Struct"** %2, align 8
  store %"struct.pov::Ray_Struct"* %Ray, %"struct.pov::Ray_Struct"** %3, align 8
  store %"struct.pov::istack_struct"* %Depth_Stack, %"struct.pov::istack_struct"** %4, align 8
  %5 = load %"struct.pov::Ray_Struct"** %3, align 8
  %6 = load %"struct.pov::Object_Struct"** %2, align 8
  %7 = bitcast %"struct.pov::Object_Struct"* %6 to %"struct.pov::Plane_Struct"*
  %8 = call i32 @_ZN3povL15Intersect_PlaneEPNS_10Ray_StructEPNS_12Plane_StructEPd(%"struct.pov::Ray_Struct"* %5, %"struct.pov::Plane_Struct"* %7, double* %Depth)
  %9 = icmp ne i32 %8, 0
  br i1 %9, label %10, label %30

; <label>:10                                      ; preds = %0
  %11 = getelementptr inbounds [3 x double]* %IPoint, i32 0, i32 0
  %12 = load %"struct.pov::Ray_Struct"** %3, align 8
  %13 = getelementptr inbounds %"struct.pov::Ray_Struct"* %12, i32 0, i32 0
  %14 = getelementptr inbounds [3 x double]* %13, i32 0, i32 0
  %15 = load double* %Depth, align 8
  %16 = load %"struct.pov::Ray_Struct"** %3, align 8
  %17 = getelementptr inbounds %"struct.pov::Ray_Struct"* %16, i32 0, i32 1
  %18 = getelementptr inbounds [3 x double]* %17, i32 0, i32 0
  call void @_ZN3pov12VEvaluateRayEPdPKddS2_(double* %11, double* %14, double %15, double* %18)
  %19 = getelementptr inbounds [3 x double]* %IPoint, i32 0, i32 0
  %20 = load %"struct.pov::Object_Struct"** %2, align 8
  %21 = getelementptr inbounds %"struct.pov::Object_Struct"* %20, i32 0, i32 7
  %22 = load %"struct.pov::Object_Struct"** %21, align 8
  %23 = call zeroext i1 @_ZN3pov13Point_In_ClipEPdPNS_13Object_StructE(double* %19, %"struct.pov::Object_Struct"* %22)
  br i1 %23, label %24, label %29

; <label>:24                                      ; preds = %10
  %25 = load double* %Depth, align 8
  %26 = getelementptr inbounds [3 x double]* %IPoint, i32 0, i32 0
  %27 = load %"struct.pov::Object_Struct"** %2, align 8
  %28 = load %"struct.pov::istack_struct"** %4, align 8
  call void @_ZN3pov10push_entryEdPdPNS_13Object_StructEPNS_13istack_structE(double %25, double* %26, %"struct.pov::Object_Struct"* %27, %"struct.pov::istack_struct"* %28)
  store i32 1, i32* %1
  br label %31

; <label>:29                                      ; preds = %10
  br label %30

; <label>:30                                      ; preds = %29, %0
  store i32 0, i32* %1
  br label %31

; <label>:31                                      ; preds = %30, %24
  %32 = load i32* %1
  ret i32 %32
}

; Function Attrs: uwtable
define internal i32 @_ZN3povL12Inside_PlaneEPdPNS_13Object_StructE(double* %IPoint, %"struct.pov::Object_Struct"* %Object) #0 {
  %1 = alloca double*, align 8
  %2 = alloca %"struct.pov::Object_Struct"*, align 8
  %Temp = alloca double, align 8
  %P = alloca [3 x double], align 16
  store double* %IPoint, double** %1, align 8
  store %"struct.pov::Object_Struct"* %Object, %"struct.pov::Object_Struct"** %2, align 8
  %3 = load %"struct.pov::Object_Struct"** %2, align 8
  %4 = bitcast %"struct.pov::Object_Struct"* %3 to %"struct.pov::Plane_Struct"*
  %5 = getelementptr inbounds %"struct.pov::Plane_Struct"* %4, i32 0, i32 10
  %6 = load %"struct.pov::Transform_Struct"** %5, align 8
  %7 = icmp eq %"struct.pov::Transform_Struct"* %6, null
  br i1 %7, label %8, label %14

; <label>:8                                       ; preds = %0
  %9 = load double** %1, align 8
  %10 = load %"struct.pov::Object_Struct"** %2, align 8
  %11 = bitcast %"struct.pov::Object_Struct"* %10 to %"struct.pov::Plane_Struct"*
  %12 = getelementptr inbounds %"struct.pov::Plane_Struct"* %11, i32 0, i32 14
  %13 = getelementptr inbounds [3 x double]* %12, i32 0, i32 0
  call void @_ZN3pov4VDotERdPKdS2_(double* dereferenceable(8) %Temp, double* %9, double* %13)
  br label %26

; <label>:14                                      ; preds = %0
  %15 = getelementptr inbounds [3 x double]* %P, i32 0, i32 0
  %16 = load double** %1, align 8
  %17 = load %"struct.pov::Object_Struct"** %2, align 8
  %18 = bitcast %"struct.pov::Object_Struct"* %17 to %"struct.pov::Plane_Struct"*
  %19 = getelementptr inbounds %"struct.pov::Plane_Struct"* %18, i32 0, i32 10
  %20 = load %"struct.pov::Transform_Struct"** %19, align 8
  call void @_ZN3pov14MInvTransPointEPdS0_PNS_16Transform_StructE(double* %15, double* %16, %"struct.pov::Transform_Struct"* %20)
  %21 = getelementptr inbounds [3 x double]* %P, i32 0, i32 0
  %22 = load %"struct.pov::Object_Struct"** %2, align 8
  %23 = bitcast %"struct.pov::Object_Struct"* %22 to %"struct.pov::Plane_Struct"*
  %24 = getelementptr inbounds %"struct.pov::Plane_Struct"* %23, i32 0, i32 14
  %25 = getelementptr inbounds [3 x double]* %24, i32 0, i32 0
  call void @_ZN3pov4VDotERdPKdS2_(double* dereferenceable(8) %Temp, double* %21, double* %25)
  br label %26

; <label>:26                                      ; preds = %14, %8
  %27 = load double* %Temp, align 8
  %28 = load %"struct.pov::Object_Struct"** %2, align 8
  %29 = bitcast %"struct.pov::Object_Struct"* %28 to %"struct.pov::Plane_Struct"*
  %30 = getelementptr inbounds %"struct.pov::Plane_Struct"* %29, i32 0, i32 15
  %31 = load double* %30, align 8
  %32 = fadd double %27, %31
  %33 = fcmp olt double %32, 1.000000e-07
  %34 = zext i1 %33 to i32
  ret i32 %34
}

; Function Attrs: uwtable
define internal void @_ZN3povL12Plane_NormalEPdPNS_13Object_StructEPNS_10istk_entryE(double* %Result, %"struct.pov::Object_Struct"* %Object, %"struct.pov::istk_entry"*) #0 {
  %2 = alloca double*, align 8
  %3 = alloca %"struct.pov::Object_Struct"*, align 8
  %4 = alloca %"struct.pov::istk_entry"*, align 8
  store double* %Result, double** %2, align 8
  store %"struct.pov::Object_Struct"* %Object, %"struct.pov::Object_Struct"** %3, align 8
  store %"struct.pov::istk_entry"* %0, %"struct.pov::istk_entry"** %4, align 8
  %5 = load double** %2, align 8
  %6 = load %"struct.pov::Object_Struct"** %3, align 8
  %7 = bitcast %"struct.pov::Object_Struct"* %6 to %"struct.pov::Plane_Struct"*
  %8 = getelementptr inbounds %"struct.pov::Plane_Struct"* %7, i32 0, i32 14
  %9 = getelementptr inbounds [3 x double]* %8, i32 0, i32 0
  call void @_ZN3pov13Assign_VectorEPdS0_(double* %5, double* %9)
  %10 = load %"struct.pov::Object_Struct"** %3, align 8
  %11 = bitcast %"struct.pov::Object_Struct"* %10 to %"struct.pov::Plane_Struct"*
  %12 = getelementptr inbounds %"struct.pov::Plane_Struct"* %11, i32 0, i32 10
  %13 = load %"struct.pov::Transform_Struct"** %12, align 8
  %14 = icmp ne %"struct.pov::Transform_Struct"* %13, null
  br i1 %14, label %15, label %24

; <label>:15                                      ; preds = %1
  %16 = load double** %2, align 8
  %17 = load double** %2, align 8
  %18 = load %"struct.pov::Object_Struct"** %3, align 8
  %19 = bitcast %"struct.pov::Object_Struct"* %18 to %"struct.pov::Plane_Struct"*
  %20 = getelementptr inbounds %"struct.pov::Plane_Struct"* %19, i32 0, i32 10
  %21 = load %"struct.pov::Transform_Struct"** %20, align 8
  call void @_ZN3pov12MTransNormalEPdS0_PNS_16Transform_StructE(double* %16, double* %17, %"struct.pov::Transform_Struct"* %21)
  %22 = load double** %2, align 8
  %23 = load double** %2, align 8
  call void @_ZN3pov10VNormalizeEPdPKd(double* %22, double* %23)
  br label %24

; <label>:24                                      ; preds = %15, %1
  ret void
}

declare void @_ZN3pov15Default_UVCoordEPdPNS_13Object_StructEPNS_10istk_entryE(double*, %"struct.pov::Object_Struct"*, %"struct.pov::istk_entry"*) #1

; Function Attrs: uwtable
define internal %"struct.pov::Plane_Struct"* @_ZN3povL10Copy_PlaneEPNS_13Object_StructE(%"struct.pov::Object_Struct"* %Object) #0 {
  %1 = alloca %"struct.pov::Object_Struct"*, align 8
  %New = alloca %"struct.pov::Plane_Struct"*, align 8
  store %"struct.pov::Object_Struct"* %Object, %"struct.pov::Object_Struct"** %1, align 8
  %2 = call %"struct.pov::Plane_Struct"* @_ZN3pov12Create_PlaneEv()
  store %"struct.pov::Plane_Struct"* %2, %"struct.pov::Plane_Struct"** %New, align 8
  %3 = load %"struct.pov::Plane_Struct"** %New, align 8
  %4 = getelementptr inbounds %"struct.pov::Plane_Struct"* %3, i32 0, i32 10
  %5 = load %"struct.pov::Transform_Struct"** %4, align 8
  call void @_ZN3pov17Destroy_TransformEPNS_16Transform_StructE(%"struct.pov::Transform_Struct"* %5)
  %6 = load %"struct.pov::Plane_Struct"** %New, align 8
  %7 = load %"struct.pov::Object_Struct"** %1, align 8
  %8 = bitcast %"struct.pov::Object_Struct"* %7 to %"struct.pov::Plane_Struct"*
  %9 = bitcast %"struct.pov::Plane_Struct"* %6 to i8*
  %10 = bitcast %"struct.pov::Plane_Struct"* %8 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %9, i8* %10, i64 152, i32 8, i1 false)
  %11 = load %"struct.pov::Object_Struct"** %1, align 8
  %12 = bitcast %"struct.pov::Object_Struct"* %11 to %"struct.pov::Plane_Struct"*
  %13 = getelementptr inbounds %"struct.pov::Plane_Struct"* %12, i32 0, i32 10
  %14 = load %"struct.pov::Transform_Struct"** %13, align 8
  %15 = call %"struct.pov::Transform_Struct"* @_ZN3pov14Copy_TransformEPNS_16Transform_StructE(%"struct.pov::Transform_Struct"* %14)
  %16 = load %"struct.pov::Plane_Struct"** %New, align 8
  %17 = getelementptr inbounds %"struct.pov::Plane_Struct"* %16, i32 0, i32 10
  store %"struct.pov::Transform_Struct"* %15, %"struct.pov::Transform_Struct"** %17, align 8
  %18 = load %"struct.pov::Plane_Struct"** %New, align 8
  ret %"struct.pov::Plane_Struct"* %18
}

; Function Attrs: uwtable
define internal void @_ZN3povL15Translate_PlaneEPNS_13Object_StructEPdPNS_16Transform_StructE(%"struct.pov::Object_Struct"* %Object, double* %Vector, %"struct.pov::Transform_Struct"* %Trans) #0 {
  %1 = alloca %"struct.pov::Object_Struct"*, align 8
  %2 = alloca double*, align 8
  %3 = alloca %"struct.pov::Transform_Struct"*, align 8
  %Translation = alloca [3 x double], align 16
  %Plane = alloca %"struct.pov::Plane_Struct"*, align 8
  store %"struct.pov::Object_Struct"* %Object, %"struct.pov::Object_Struct"** %1, align 8
  store double* %Vector, double** %2, align 8
  store %"struct.pov::Transform_Struct"* %Trans, %"struct.pov::Transform_Struct"** %3, align 8
  %4 = load %"struct.pov::Object_Struct"** %1, align 8
  %5 = bitcast %"struct.pov::Object_Struct"* %4 to %"struct.pov::Plane_Struct"*
  store %"struct.pov::Plane_Struct"* %5, %"struct.pov::Plane_Struct"** %Plane, align 8
  %6 = load %"struct.pov::Plane_Struct"** %Plane, align 8
  %7 = getelementptr inbounds %"struct.pov::Plane_Struct"* %6, i32 0, i32 10
  %8 = load %"struct.pov::Transform_Struct"** %7, align 8
  %9 = icmp eq %"struct.pov::Transform_Struct"* %8, null
  br i1 %9, label %10, label %32

; <label>:10                                      ; preds = %0
  %11 = getelementptr inbounds [3 x double]* %Translation, i32 0, i32 0
  %12 = load %"struct.pov::Object_Struct"** %1, align 8
  %13 = bitcast %"struct.pov::Object_Struct"* %12 to %"struct.pov::Plane_Struct"*
  %14 = getelementptr inbounds %"struct.pov::Plane_Struct"* %13, i32 0, i32 14
  %15 = getelementptr inbounds [3 x double]* %14, i32 0, i32 0
  %16 = load double** %2, align 8
  call void @_ZN3pov9VEvaluateEPdPKdS2_(double* %11, double* %15, double* %16)
  %17 = getelementptr inbounds [3 x double]* %Translation, i32 0, i64 0
  %18 = load double* %17, align 8
  %19 = getelementptr inbounds [3 x double]* %Translation, i32 0, i64 1
  %20 = load double* %19, align 8
  %21 = fadd double %18, %20
  %22 = getelementptr inbounds [3 x double]* %Translation, i32 0, i64 2
  %23 = load double* %22, align 8
  %24 = fadd double %21, %23
  %25 = load %"struct.pov::Object_Struct"** %1, align 8
  %26 = bitcast %"struct.pov::Object_Struct"* %25 to %"struct.pov::Plane_Struct"*
  %27 = getelementptr inbounds %"struct.pov::Plane_Struct"* %26, i32 0, i32 15
  %28 = load double* %27, align 8
  %29 = fsub double %28, %24
  store double %29, double* %27, align 8
  %30 = load %"struct.pov::Object_Struct"** %1, align 8
  %31 = bitcast %"struct.pov::Object_Struct"* %30 to %"struct.pov::Plane_Struct"*
  call void @_ZN3pov18Compute_Plane_BBoxEPNS_12Plane_StructE(%"struct.pov::Plane_Struct"* %31)
  br label %35

; <label>:32                                      ; preds = %0
  %33 = load %"struct.pov::Object_Struct"** %1, align 8
  %34 = load %"struct.pov::Transform_Struct"** %3, align 8
  call void @_ZN3povL15Transform_PlaneEPNS_13Object_StructEPNS_16Transform_StructE(%"struct.pov::Object_Struct"* %33, %"struct.pov::Transform_Struct"* %34)
  br label %35

; <label>:35                                      ; preds = %32, %10
  ret void
}

; Function Attrs: uwtable
define internal void @_ZN3povL12Rotate_PlaneEPNS_13Object_StructEPdPNS_16Transform_StructE(%"struct.pov::Object_Struct"* %Object, double*, %"struct.pov::Transform_Struct"* %Trans) #0 {
  %2 = alloca %"struct.pov::Object_Struct"*, align 8
  %3 = alloca double*, align 8
  %4 = alloca %"struct.pov::Transform_Struct"*, align 8
  store %"struct.pov::Object_Struct"* %Object, %"struct.pov::Object_Struct"** %2, align 8
  store double* %0, double** %3, align 8
  store %"struct.pov::Transform_Struct"* %Trans, %"struct.pov::Transform_Struct"** %4, align 8
  %5 = load %"struct.pov::Object_Struct"** %2, align 8
  %6 = bitcast %"struct.pov::Object_Struct"* %5 to %"struct.pov::Plane_Struct"*
  %7 = getelementptr inbounds %"struct.pov::Plane_Struct"* %6, i32 0, i32 10
  %8 = load %"struct.pov::Transform_Struct"** %7, align 8
  %9 = icmp eq %"struct.pov::Transform_Struct"* %8, null
  br i1 %9, label %10, label %22

; <label>:10                                      ; preds = %1
  %11 = load %"struct.pov::Object_Struct"** %2, align 8
  %12 = bitcast %"struct.pov::Object_Struct"* %11 to %"struct.pov::Plane_Struct"*
  %13 = getelementptr inbounds %"struct.pov::Plane_Struct"* %12, i32 0, i32 14
  %14 = getelementptr inbounds [3 x double]* %13, i32 0, i32 0
  %15 = load %"struct.pov::Object_Struct"** %2, align 8
  %16 = bitcast %"struct.pov::Object_Struct"* %15 to %"struct.pov::Plane_Struct"*
  %17 = getelementptr inbounds %"struct.pov::Plane_Struct"* %16, i32 0, i32 14
  %18 = getelementptr inbounds [3 x double]* %17, i32 0, i32 0
  %19 = load %"struct.pov::Transform_Struct"** %4, align 8
  call void @_ZN3pov15MTransDirectionEPdS0_PNS_16Transform_StructE(double* %14, double* %18, %"struct.pov::Transform_Struct"* %19)
  %20 = load %"struct.pov::Object_Struct"** %2, align 8
  %21 = bitcast %"struct.pov::Object_Struct"* %20 to %"struct.pov::Plane_Struct"*
  call void @_ZN3pov18Compute_Plane_BBoxEPNS_12Plane_StructE(%"struct.pov::Plane_Struct"* %21)
  br label %25

; <label>:22                                      ; preds = %1
  %23 = load %"struct.pov::Object_Struct"** %2, align 8
  %24 = load %"struct.pov::Transform_Struct"** %4, align 8
  call void @_ZN3povL15Transform_PlaneEPNS_13Object_StructEPNS_16Transform_StructE(%"struct.pov::Object_Struct"* %23, %"struct.pov::Transform_Struct"* %24)
  br label %25

; <label>:25                                      ; preds = %22, %10
  ret void
}

; Function Attrs: uwtable
define internal void @_ZN3povL11Scale_PlaneEPNS_13Object_StructEPdPNS_16Transform_StructE(%"struct.pov::Object_Struct"* %Object, double* %Vector, %"struct.pov::Transform_Struct"* %Trans) #0 {
  %1 = alloca %"struct.pov::Object_Struct"*, align 8
  %2 = alloca double*, align 8
  %3 = alloca %"struct.pov::Transform_Struct"*, align 8
  %Length = alloca double, align 8
  %Plane = alloca %"struct.pov::Plane_Struct"*, align 8
  store %"struct.pov::Object_Struct"* %Object, %"struct.pov::Object_Struct"** %1, align 8
  store double* %Vector, double** %2, align 8
  store %"struct.pov::Transform_Struct"* %Trans, %"struct.pov::Transform_Struct"** %3, align 8
  %4 = load %"struct.pov::Object_Struct"** %1, align 8
  %5 = bitcast %"struct.pov::Object_Struct"* %4 to %"struct.pov::Plane_Struct"*
  store %"struct.pov::Plane_Struct"* %5, %"struct.pov::Plane_Struct"** %Plane, align 8
  %6 = load %"struct.pov::Plane_Struct"** %Plane, align 8
  %7 = getelementptr inbounds %"struct.pov::Plane_Struct"* %6, i32 0, i32 10
  %8 = load %"struct.pov::Transform_Struct"** %7, align 8
  %9 = icmp eq %"struct.pov::Transform_Struct"* %8, null
  br i1 %9, label %10, label %31

; <label>:10                                      ; preds = %0
  %11 = load %"struct.pov::Plane_Struct"** %Plane, align 8
  %12 = getelementptr inbounds %"struct.pov::Plane_Struct"* %11, i32 0, i32 14
  %13 = getelementptr inbounds [3 x double]* %12, i32 0, i32 0
  %14 = load double** %2, align 8
  call void @_ZN3pov6VDivEqEPdPKd(double* %13, double* %14)
  %15 = load %"struct.pov::Object_Struct"** %1, align 8
  %16 = bitcast %"struct.pov::Object_Struct"* %15 to %"struct.pov::Plane_Struct"*
  %17 = getelementptr inbounds %"struct.pov::Plane_Struct"* %16, i32 0, i32 14
  %18 = getelementptr inbounds [3 x double]* %17, i32 0, i32 0
  call void @_ZN3pov7VLengthERdPKd(double* dereferenceable(8) %Length, double* %18)
  %19 = load %"struct.pov::Object_Struct"** %1, align 8
  %20 = bitcast %"struct.pov::Object_Struct"* %19 to %"struct.pov::Plane_Struct"*
  %21 = getelementptr inbounds %"struct.pov::Plane_Struct"* %20, i32 0, i32 14
  %22 = getelementptr inbounds [3 x double]* %21, i32 0, i32 0
  %23 = load double* %Length, align 8
  call void @_ZN3pov15VInverseScaleEqEPdd(double* %22, double %23)
  %24 = load double* %Length, align 8
  %25 = load %"struct.pov::Object_Struct"** %1, align 8
  %26 = bitcast %"struct.pov::Object_Struct"* %25 to %"struct.pov::Plane_Struct"*
  %27 = getelementptr inbounds %"struct.pov::Plane_Struct"* %26, i32 0, i32 15
  %28 = load double* %27, align 8
  %29 = fdiv double %28, %24
  store double %29, double* %27, align 8
  %30 = load %"struct.pov::Plane_Struct"** %Plane, align 8
  call void @_ZN3pov18Compute_Plane_BBoxEPNS_12Plane_StructE(%"struct.pov::Plane_Struct"* %30)
  br label %34

; <label>:31                                      ; preds = %0
  %32 = load %"struct.pov::Object_Struct"** %1, align 8
  %33 = load %"struct.pov::Transform_Struct"** %3, align 8
  call void @_ZN3povL15Transform_PlaneEPNS_13Object_StructEPNS_16Transform_StructE(%"struct.pov::Object_Struct"* %32, %"struct.pov::Transform_Struct"* %33)
  br label %34

; <label>:34                                      ; preds = %31, %10
  ret void
}

; Function Attrs: uwtable
define internal void @_ZN3povL15Transform_PlaneEPNS_13Object_StructEPNS_16Transform_StructE(%"struct.pov::Object_Struct"* %Object, %"struct.pov::Transform_Struct"* %Trans) #0 {
  %1 = alloca %"struct.pov::Object_Struct"*, align 8
  %2 = alloca %"struct.pov::Transform_Struct"*, align 8
  %Plane = alloca %"struct.pov::Plane_Struct"*, align 8
  store %"struct.pov::Object_Struct"* %Object, %"struct.pov::Object_Struct"** %1, align 8
  store %"struct.pov::Transform_Struct"* %Trans, %"struct.pov::Transform_Struct"** %2, align 8
  %3 = load %"struct.pov::Object_Struct"** %1, align 8
  %4 = bitcast %"struct.pov::Object_Struct"* %3 to %"struct.pov::Plane_Struct"*
  store %"struct.pov::Plane_Struct"* %4, %"struct.pov::Plane_Struct"** %Plane, align 8
  %5 = load %"struct.pov::Plane_Struct"** %Plane, align 8
  %6 = getelementptr inbounds %"struct.pov::Plane_Struct"* %5, i32 0, i32 10
  %7 = load %"struct.pov::Transform_Struct"** %6, align 8
  %8 = icmp eq %"struct.pov::Transform_Struct"* %7, null
  br i1 %8, label %9, label %13

; <label>:9                                       ; preds = %0
  %10 = call %"struct.pov::Transform_Struct"* @_ZN3pov16Create_TransformEv()
  %11 = load %"struct.pov::Plane_Struct"** %Plane, align 8
  %12 = getelementptr inbounds %"struct.pov::Plane_Struct"* %11, i32 0, i32 10
  store %"struct.pov::Transform_Struct"* %10, %"struct.pov::Transform_Struct"** %12, align 8
  br label %13

; <label>:13                                      ; preds = %9, %0
  %14 = load %"struct.pov::Plane_Struct"** %Plane, align 8
  %15 = getelementptr inbounds %"struct.pov::Plane_Struct"* %14, i32 0, i32 10
  %16 = load %"struct.pov::Transform_Struct"** %15, align 8
  %17 = load %"struct.pov::Transform_Struct"** %2, align 8
  call void @_ZN3pov18Compose_TransformsEPNS_16Transform_StructES1_(%"struct.pov::Transform_Struct"* %16, %"struct.pov::Transform_Struct"* %17)
  %18 = load %"struct.pov::Plane_Struct"** %Plane, align 8
  call void @_ZN3pov18Compute_Plane_BBoxEPNS_12Plane_StructE(%"struct.pov::Plane_Struct"* %18)
  ret void
}

; Function Attrs: uwtable
define internal void @_ZN3povL12Invert_PlaneEPNS_13Object_StructE(%"struct.pov::Object_Struct"* %Object) #0 {
  %1 = alloca %"struct.pov::Object_Struct"*, align 8
  store %"struct.pov::Object_Struct"* %Object, %"struct.pov::Object_Struct"** %1, align 8
  %2 = load %"struct.pov::Object_Struct"** %1, align 8
  %3 = bitcast %"struct.pov::Object_Struct"* %2 to %"struct.pov::Plane_Struct"*
  %4 = getelementptr inbounds %"struct.pov::Plane_Struct"* %3, i32 0, i32 14
  %5 = getelementptr inbounds [3 x double]* %4, i32 0, i32 0
  call void @_ZN3pov8VScaleEqEPdd(double* %5, double -1.000000e+00)
  %6 = load %"struct.pov::Object_Struct"** %1, align 8
  %7 = bitcast %"struct.pov::Object_Struct"* %6 to %"struct.pov::Plane_Struct"*
  %8 = getelementptr inbounds %"struct.pov::Plane_Struct"* %7, i32 0, i32 15
  %9 = load double* %8, align 8
  %10 = fmul double %9, -1.000000e+00
  store double %10, double* %8, align 8
  ret void
}

; Function Attrs: uwtable
define internal void @_ZN3povL13Destroy_PlaneEPNS_13Object_StructE(%"struct.pov::Object_Struct"* %Object) #0 {
  %1 = alloca %"struct.pov::Object_Struct"*, align 8
  store %"struct.pov::Object_Struct"* %Object, %"struct.pov::Object_Struct"** %1, align 8
  %2 = load %"struct.pov::Object_Struct"** %1, align 8
  %3 = bitcast %"struct.pov::Object_Struct"* %2 to %"struct.pov::Plane_Struct"*
  %4 = getelementptr inbounds %"struct.pov::Plane_Struct"* %3, i32 0, i32 10
  %5 = load %"struct.pov::Transform_Struct"** %4, align 8
  call void @_ZN3pov17Destroy_TransformEPNS_16Transform_StructE(%"struct.pov::Transform_Struct"* %5)
  %6 = load %"struct.pov::Object_Struct"** %1, align 8
  %7 = bitcast %"struct.pov::Object_Struct"* %6 to i8*
  call void @_ZN3pov8pov_freeEPvPKci(i8* %7, i8* getelementptr inbounds ([11 x i8]* @.str, i32 0, i32 0), i32 633)
  store %"struct.pov::Object_Struct"* null, %"struct.pov::Object_Struct"** %1, align 8
  ret void
}

; Function Attrs: uwtable
define %"struct.pov::Plane_Struct"* @_ZN3pov12Create_PlaneEv() #0 {
  %New = alloca %"struct.pov::Plane_Struct"*, align 8
  %1 = call i8* @_ZN3pov10pov_mallocEmPKciS1_(i64 152, i8* getelementptr inbounds ([11 x i8]* @.str, i32 0, i32 0), i32 534, i8* getelementptr inbounds ([6 x i8]* @.str1, i32 0, i32 0))
  %2 = bitcast i8* %1 to %"struct.pov::Plane_Struct"*
  store %"struct.pov::Plane_Struct"* %2, %"struct.pov::Plane_Struct"** %New, align 8
  %3 = load %"struct.pov::Plane_Struct"** %New, align 8
  %4 = getelementptr inbounds %"struct.pov::Plane_Struct"* %3, i32 0, i32 1
  store i32 0, i32* %4, align 4
  %5 = load %"struct.pov::Plane_Struct"** %New, align 8
  %6 = getelementptr inbounds %"struct.pov::Plane_Struct"* %5, i32 0, i32 0
  store %"struct.pov::Method_Struct"* bitcast ({ i32 (%"struct.pov::Object_Struct"*, %"struct.pov::Ray_Struct"*, %"struct.pov::istack_struct"*)*, i32 (double*, %"struct.pov::Object_Struct"*)*, void (double*, %"struct.pov::Object_Struct"*, %"struct.pov::istk_entry"*)*, void (double*, %"struct.pov::Object_Struct"*, %"struct.pov::istk_entry"*)*, i8* (%"struct.pov::Object_Struct"*)*, void (%"struct.pov::Object_Struct"*, double*, %"struct.pov::Transform_Struct"*)*, void (%"struct.pov::Object_Struct"*, double*, %"struct.pov::Transform_Struct"*)*, void (%"struct.pov::Object_Struct"*, double*, %"struct.pov::Transform_Struct"*)*, void (%"struct.pov::Object_Struct"*, %"struct.pov::Transform_Struct"*)*, void (%"struct.pov::Object_Struct"*)*, void (%"struct.pov::Object_Struct"*)* }* @_ZN3pov13Plane_MethodsE to %"struct.pov::Method_Struct"*), %"struct.pov::Method_Struct"** %6, align 8
  %7 = load %"struct.pov::Plane_Struct"** %New, align 8
  %8 = getelementptr inbounds %"struct.pov::Plane_Struct"* %7, i32 0, i32 2
  store %"struct.pov::Object_Struct"* null, %"struct.pov::Object_Struct"** %8, align 8
  %9 = load %"struct.pov::Plane_Struct"** %New, align 8
  %10 = getelementptr inbounds %"struct.pov::Plane_Struct"* %9, i32 0, i32 3
  store %"struct.pov::Texture_Struct"* null, %"struct.pov::Texture_Struct"** %10, align 8
  %11 = load %"struct.pov::Plane_Struct"** %New, align 8
  %12 = getelementptr inbounds %"struct.pov::Plane_Struct"* %11, i32 0, i32 4
  store %"struct.pov::Texture_Struct"* null, %"struct.pov::Texture_Struct"** %12, align 8
  %13 = load %"struct.pov::Plane_Struct"** %New, align 8
  %14 = getelementptr inbounds %"struct.pov::Plane_Struct"* %13, i32 0, i32 5
  store %"struct.pov::Interior_Struct"* null, %"struct.pov::Interior_Struct"** %14, align 8
  %15 = load %"struct.pov::Plane_Struct"** %New, align 8
  %16 = getelementptr inbounds %"struct.pov::Plane_Struct"* %15, i32 0, i32 6
  store %"struct.pov::Object_Struct"* null, %"struct.pov::Object_Struct"** %16, align 8
  %17 = load %"struct.pov::Plane_Struct"** %New, align 8
  %18 = getelementptr inbounds %"struct.pov::Plane_Struct"* %17, i32 0, i32 7
  store %"struct.pov::Object_Struct"* null, %"struct.pov::Object_Struct"** %18, align 8
  %19 = load %"struct.pov::Plane_Struct"** %New, align 8
  %20 = getelementptr inbounds %"struct.pov::Plane_Struct"* %19, i32 0, i32 8
  store %"struct.pov::Light_Source_Struct"* null, %"struct.pov::Light_Source_Struct"** %20, align 8
  %21 = load %"struct.pov::Plane_Struct"** %New, align 8
  %22 = getelementptr inbounds %"struct.pov::Plane_Struct"* %21, i32 0, i32 10
  store %"struct.pov::Transform_Struct"* null, %"struct.pov::Transform_Struct"** %22, align 8
  %23 = load %"struct.pov::Plane_Struct"** %New, align 8
  %24 = getelementptr inbounds %"struct.pov::Plane_Struct"* %23, i32 0, i32 11
  store %"struct.pov::Transform_Struct"* null, %"struct.pov::Transform_Struct"** %24, align 8
  %25 = load %"struct.pov::Plane_Struct"** %New, align 8
  %26 = getelementptr inbounds %"struct.pov::Plane_Struct"* %25, i32 0, i32 12
  store float 0.000000e+00, float* %26, align 4
  %27 = load %"struct.pov::Plane_Struct"** %New, align 8
  %28 = getelementptr inbounds %"struct.pov::Plane_Struct"* %27, i32 0, i32 13
  store i32 0, i32* %28, align 4
  %29 = load %"struct.pov::Plane_Struct"** %New, align 8
  %30 = getelementptr inbounds %"struct.pov::Plane_Struct"* %29, i32 0, i32 9
  call void @_ZN3pov9Make_BBoxERNS_19Bounding_Box_StructEffffff(%"struct.pov::Bounding_Box_Struct"* dereferenceable(24) %30, float -1.000000e+10, float -1.000000e+10, float -1.000000e+10, float 2.000000e+10, float 2.000000e+10, float 2.000000e+10)
  %31 = load %"struct.pov::Plane_Struct"** %New, align 8
  %32 = getelementptr inbounds %"struct.pov::Plane_Struct"* %31, i32 0, i32 14
  %33 = getelementptr inbounds [3 x double]* %32, i32 0, i32 0
  call void @_ZN3pov11Make_VectorEPdddd(double* %33, double 0.000000e+00, double 1.000000e+00, double 0.000000e+00)
  %34 = load %"struct.pov::Plane_Struct"** %New, align 8
  %35 = getelementptr inbounds %"struct.pov::Plane_Struct"* %34, i32 0, i32 15
  store double 0.000000e+00, double* %35, align 8
  %36 = load %"struct.pov::Plane_Struct"** %New, align 8
  %37 = getelementptr inbounds %"struct.pov::Plane_Struct"* %36, i32 0, i32 10
  store %"struct.pov::Transform_Struct"* null, %"struct.pov::Transform_Struct"** %37, align 8
  %38 = load %"struct.pov::Plane_Struct"** %New, align 8
  ret %"struct.pov::Plane_Struct"* %38
}

declare i8* @_ZN3pov10pov_mallocEmPKciS1_(i64, i8*, i32, i8*) #1

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr void @_ZN3pov9Make_BBoxERNS_19Bounding_Box_StructEffffff(%"struct.pov::Bounding_Box_Struct"* dereferenceable(24) %BBox, float %llx, float %lly, float %llz, float %lex, float %ley, float %lez) #2 {
  %1 = alloca %"struct.pov::Bounding_Box_Struct"*, align 8
  %2 = alloca float, align 4
  %3 = alloca float, align 4
  %4 = alloca float, align 4
  %5 = alloca float, align 4
  %6 = alloca float, align 4
  %7 = alloca float, align 4
  store %"struct.pov::Bounding_Box_Struct"* %BBox, %"struct.pov::Bounding_Box_Struct"** %1, align 8
  store float %llx, float* %2, align 4
  store float %lly, float* %3, align 4
  store float %llz, float* %4, align 4
  store float %lex, float* %5, align 4
  store float %ley, float* %6, align 4
  store float %lez, float* %7, align 4
  %8 = load float* %2, align 4
  %9 = load %"struct.pov::Bounding_Box_Struct"** %1, align 8
  %10 = getelementptr inbounds %"struct.pov::Bounding_Box_Struct"* %9, i32 0, i32 0
  %11 = getelementptr inbounds [3 x float]* %10, i32 0, i64 0
  store float %8, float* %11, align 4
  %12 = load float* %3, align 4
  %13 = load %"struct.pov::Bounding_Box_Struct"** %1, align 8
  %14 = getelementptr inbounds %"struct.pov::Bounding_Box_Struct"* %13, i32 0, i32 0
  %15 = getelementptr inbounds [3 x float]* %14, i32 0, i64 1
  store float %12, float* %15, align 4
  %16 = load float* %4, align 4
  %17 = load %"struct.pov::Bounding_Box_Struct"** %1, align 8
  %18 = getelementptr inbounds %"struct.pov::Bounding_Box_Struct"* %17, i32 0, i32 0
  %19 = getelementptr inbounds [3 x float]* %18, i32 0, i64 2
  store float %16, float* %19, align 4
  %20 = load float* %5, align 4
  %21 = load %"struct.pov::Bounding_Box_Struct"** %1, align 8
  %22 = getelementptr inbounds %"struct.pov::Bounding_Box_Struct"* %21, i32 0, i32 1
  %23 = getelementptr inbounds [3 x float]* %22, i32 0, i64 0
  store float %20, float* %23, align 4
  %24 = load float* %6, align 4
  %25 = load %"struct.pov::Bounding_Box_Struct"** %1, align 8
  %26 = getelementptr inbounds %"struct.pov::Bounding_Box_Struct"* %25, i32 0, i32 1
  %27 = getelementptr inbounds [3 x float]* %26, i32 0, i64 1
  store float %24, float* %27, align 4
  %28 = load float* %7, align 4
  %29 = load %"struct.pov::Bounding_Box_Struct"** %1, align 8
  %30 = getelementptr inbounds %"struct.pov::Bounding_Box_Struct"* %29, i32 0, i32 1
  %31 = getelementptr inbounds [3 x float]* %30, i32 0, i64 2
  store float %28, float* %31, align 4
  ret void
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr void @_ZN3pov11Make_VectorEPdddd(double* %v, double %a, double %b, double %c) #2 {
  %1 = alloca double*, align 8
  %2 = alloca double, align 8
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  store double* %v, double** %1, align 8
  store double %a, double* %2, align 8
  store double %b, double* %3, align 8
  store double %c, double* %4, align 8
  %5 = load double* %2, align 8
  %6 = load double** %1, align 8
  %7 = getelementptr inbounds double* %6, i64 0
  store double %5, double* %7, align 8
  %8 = load double* %3, align 8
  %9 = load double** %1, align 8
  %10 = getelementptr inbounds double* %9, i64 1
  store double %8, double* %10, align 8
  %11 = load double* %4, align 8
  %12 = load double** %1, align 8
  %13 = getelementptr inbounds double* %12, i64 2
  store double %11, double* %13, align 8
  ret void
}

; Function Attrs: uwtable
define void @_ZN3pov18Compute_Plane_BBoxEPNS_12Plane_StructE(%"struct.pov::Plane_Struct"* %Plane) #0 {
  %1 = alloca %"struct.pov::Plane_Struct"*, align 8
  store %"struct.pov::Plane_Struct"* %Plane, %"struct.pov::Plane_Struct"** %1, align 8
  %2 = load %"struct.pov::Plane_Struct"** %1, align 8
  %3 = getelementptr inbounds %"struct.pov::Plane_Struct"* %2, i32 0, i32 9
  call void @_ZN3pov9Make_BBoxERNS_19Bounding_Box_StructEffffff(%"struct.pov::Bounding_Box_Struct"* dereferenceable(24) %3, float -1.000000e+10, float -1.000000e+10, float -1.000000e+10, float 2.000000e+10, float 2.000000e+10, float 2.000000e+10)
  %4 = load %"struct.pov::Plane_Struct"** %1, align 8
  %5 = getelementptr inbounds %"struct.pov::Plane_Struct"* %4, i32 0, i32 7
  %6 = load %"struct.pov::Object_Struct"** %5, align 8
  %7 = icmp ne %"struct.pov::Object_Struct"* %6, null
  br i1 %7, label %8, label %17

; <label>:8                                       ; preds = %0
  %9 = load %"struct.pov::Plane_Struct"** %1, align 8
  %10 = getelementptr inbounds %"struct.pov::Plane_Struct"* %9, i32 0, i32 9
  %11 = load %"struct.pov::Plane_Struct"** %1, align 8
  %12 = getelementptr inbounds %"struct.pov::Plane_Struct"* %11, i32 0, i32 7
  %13 = load %"struct.pov::Object_Struct"** %12, align 8
  %14 = getelementptr inbounds %"struct.pov::Object_Struct"* %13, i32 0, i32 9
  %15 = bitcast %"struct.pov::Bounding_Box_Struct"* %10 to i8*
  %16 = bitcast %"struct.pov::Bounding_Box_Struct"* %14 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %15, i8* %16, i64 24, i32 4, i1 false)
  br label %17

; <label>:17                                      ; preds = %8, %0
  ret void
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #3

declare void @_ZN3pov17Destroy_TransformEPNS_16Transform_StructE(%"struct.pov::Transform_Struct"*) #1

declare void @_ZN3pov8pov_freeEPvPKci(i8*, i8*, i32) #1

declare %"struct.pov::Transform_Struct"* @_ZN3pov14Copy_TransformEPNS_16Transform_StructE(%"struct.pov::Transform_Struct"*) #1

declare %"struct.pov::Transform_Struct"* @_ZN3pov16Create_TransformEv() #1

declare void @_ZN3pov18Compose_TransformsEPNS_16Transform_StructES1_(%"struct.pov::Transform_Struct"*, %"struct.pov::Transform_Struct"*) #1

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr void @_ZN3pov8VScaleEqEPdd(double* %a, double %k) #2 {
  %1 = alloca double*, align 8
  %2 = alloca double, align 8
  store double* %a, double** %1, align 8
  store double %k, double* %2, align 8
  %3 = load double* %2, align 8
  %4 = load double** %1, align 8
  %5 = getelementptr inbounds double* %4, i64 0
  %6 = load double* %5, align 8
  %7 = fmul double %6, %3
  store double %7, double* %5, align 8
  %8 = load double* %2, align 8
  %9 = load double** %1, align 8
  %10 = getelementptr inbounds double* %9, i64 1
  %11 = load double* %10, align 8
  %12 = fmul double %11, %8
  store double %12, double* %10, align 8
  %13 = load double* %2, align 8
  %14 = load double** %1, align 8
  %15 = getelementptr inbounds double* %14, i64 2
  %16 = load double* %15, align 8
  %17 = fmul double %16, %13
  store double %17, double* %15, align 8
  ret void
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr void @_ZN3pov6VDivEqEPdPKd(double* %a, double* %b) #2 {
  %1 = alloca double*, align 8
  %2 = alloca double*, align 8
  store double* %a, double** %1, align 8
  store double* %b, double** %2, align 8
  %3 = load double** %2, align 8
  %4 = getelementptr inbounds double* %3, i64 0
  %5 = load double* %4, align 8
  %6 = load double** %1, align 8
  %7 = getelementptr inbounds double* %6, i64 0
  %8 = load double* %7, align 8
  %9 = fdiv double %8, %5
  store double %9, double* %7, align 8
  %10 = load double** %2, align 8
  %11 = getelementptr inbounds double* %10, i64 1
  %12 = load double* %11, align 8
  %13 = load double** %1, align 8
  %14 = getelementptr inbounds double* %13, i64 1
  %15 = load double* %14, align 8
  %16 = fdiv double %15, %12
  store double %16, double* %14, align 8
  %17 = load double** %2, align 8
  %18 = getelementptr inbounds double* %17, i64 2
  %19 = load double* %18, align 8
  %20 = load double** %1, align 8
  %21 = getelementptr inbounds double* %20, i64 2
  %22 = load double* %21, align 8
  %23 = fdiv double %22, %19
  store double %23, double* %21, align 8
  ret void
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr void @_ZN3pov7VLengthERdPKd(double* dereferenceable(8) %a, double* %b) #2 {
  %1 = alloca double*, align 8
  %2 = alloca double*, align 8
  store double* %a, double** %1, align 8
  store double* %b, double** %2, align 8
  %3 = load double** %2, align 8
  %4 = getelementptr inbounds double* %3, i64 0
  %5 = load double* %4, align 8
  %6 = load double** %2, align 8
  %7 = getelementptr inbounds double* %6, i64 0
  %8 = load double* %7, align 8
  %9 = fmul double %5, %8
  %10 = load double** %2, align 8
  %11 = getelementptr inbounds double* %10, i64 1
  %12 = load double* %11, align 8
  %13 = load double** %2, align 8
  %14 = getelementptr inbounds double* %13, i64 1
  %15 = load double* %14, align 8
  %16 = fmul double %12, %15
  %17 = fadd double %9, %16
  %18 = load double** %2, align 8
  %19 = getelementptr inbounds double* %18, i64 2
  %20 = load double* %19, align 8
  %21 = load double** %2, align 8
  %22 = getelementptr inbounds double* %21, i64 2
  %23 = load double* %22, align 8
  %24 = fmul double %20, %23
  %25 = fadd double %17, %24
  %26 = call double @sqrt(double %25) #3
  %27 = load double** %1, align 8
  store double %26, double* %27, align 8
  ret void
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr void @_ZN3pov15VInverseScaleEqEPdd(double* %a, double %k) #2 {
  %1 = alloca double*, align 8
  %2 = alloca double, align 8
  %tmp = alloca double, align 8
  store double* %a, double** %1, align 8
  store double %k, double* %2, align 8
  %3 = load double* %2, align 8
  %4 = fdiv double 1.000000e+00, %3
  store double %4, double* %tmp, align 8
  %5 = load double* %tmp, align 8
  %6 = load double** %1, align 8
  %7 = getelementptr inbounds double* %6, i64 0
  %8 = load double* %7, align 8
  %9 = fmul double %8, %5
  store double %9, double* %7, align 8
  %10 = load double* %tmp, align 8
  %11 = load double** %1, align 8
  %12 = getelementptr inbounds double* %11, i64 1
  %13 = load double* %12, align 8
  %14 = fmul double %13, %10
  store double %14, double* %12, align 8
  %15 = load double* %tmp, align 8
  %16 = load double** %1, align 8
  %17 = getelementptr inbounds double* %16, i64 2
  %18 = load double* %17, align 8
  %19 = fmul double %18, %15
  store double %19, double* %17, align 8
  ret void
}

; Function Attrs: nounwind
declare double @sqrt(double) #4

declare void @_ZN3pov15MTransDirectionEPdS0_PNS_16Transform_StructE(double*, double*, %"struct.pov::Transform_Struct"*) #1

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr void @_ZN3pov9VEvaluateEPdPKdS2_(double* %a, double* %b, double* %c) #2 {
  %1 = alloca double*, align 8
  %2 = alloca double*, align 8
  %3 = alloca double*, align 8
  store double* %a, double** %1, align 8
  store double* %b, double** %2, align 8
  store double* %c, double** %3, align 8
  %4 = load double** %2, align 8
  %5 = getelementptr inbounds double* %4, i64 0
  %6 = load double* %5, align 8
  %7 = load double** %3, align 8
  %8 = getelementptr inbounds double* %7, i64 0
  %9 = load double* %8, align 8
  %10 = fmul double %6, %9
  %11 = load double** %1, align 8
  %12 = getelementptr inbounds double* %11, i64 0
  store double %10, double* %12, align 8
  %13 = load double** %2, align 8
  %14 = getelementptr inbounds double* %13, i64 1
  %15 = load double* %14, align 8
  %16 = load double** %3, align 8
  %17 = getelementptr inbounds double* %16, i64 1
  %18 = load double* %17, align 8
  %19 = fmul double %15, %18
  %20 = load double** %1, align 8
  %21 = getelementptr inbounds double* %20, i64 1
  store double %19, double* %21, align 8
  %22 = load double** %2, align 8
  %23 = getelementptr inbounds double* %22, i64 2
  %24 = load double* %23, align 8
  %25 = load double** %3, align 8
  %26 = getelementptr inbounds double* %25, i64 2
  %27 = load double* %26, align 8
  %28 = fmul double %24, %27
  %29 = load double** %1, align 8
  %30 = getelementptr inbounds double* %29, i64 2
  store double %28, double* %30, align 8
  ret void
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr void @_ZN3pov13Assign_VectorEPdS0_(double* %d, double* %s) #2 {
  %1 = alloca double*, align 8
  %2 = alloca double*, align 8
  store double* %d, double** %1, align 8
  store double* %s, double** %2, align 8
  %3 = load double** %2, align 8
  %4 = getelementptr inbounds double* %3, i64 0
  %5 = load double* %4, align 8
  %6 = load double** %1, align 8
  %7 = getelementptr inbounds double* %6, i64 0
  store double %5, double* %7, align 8
  %8 = load double** %2, align 8
  %9 = getelementptr inbounds double* %8, i64 1
  %10 = load double* %9, align 8
  %11 = load double** %1, align 8
  %12 = getelementptr inbounds double* %11, i64 1
  store double %10, double* %12, align 8
  %13 = load double** %2, align 8
  %14 = getelementptr inbounds double* %13, i64 2
  %15 = load double* %14, align 8
  %16 = load double** %1, align 8
  %17 = getelementptr inbounds double* %16, i64 2
  store double %15, double* %17, align 8
  ret void
}

declare void @_ZN3pov12MTransNormalEPdS0_PNS_16Transform_StructE(double*, double*, %"struct.pov::Transform_Struct"*) #1

; Function Attrs: inlinehint uwtable
define linkonce_odr void @_ZN3pov10VNormalizeEPdPKd(double* %a, double* %b) #5 {
  %1 = alloca double*, align 8
  %2 = alloca double*, align 8
  %tmp = alloca double, align 8
  store double* %a, double** %1, align 8
  store double* %b, double** %2, align 8
  %3 = load double** %2, align 8
  call void @_ZN3pov7VLengthERdPKd(double* dereferenceable(8) %tmp, double* %3)
  %4 = load double** %1, align 8
  %5 = load double** %2, align 8
  %6 = load double* %tmp, align 8
  call void @_ZN3pov13VInverseScaleEPdPKdd(double* %4, double* %5, double %6)
  ret void
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr void @_ZN3pov13VInverseScaleEPdPKdd(double* %a, double* %b, double %k) #2 {
  %1 = alloca double*, align 8
  %2 = alloca double*, align 8
  %3 = alloca double, align 8
  %tmp = alloca double, align 8
  store double* %a, double** %1, align 8
  store double* %b, double** %2, align 8
  store double %k, double* %3, align 8
  %4 = load double* %3, align 8
  %5 = fdiv double 1.000000e+00, %4
  store double %5, double* %tmp, align 8
  %6 = load double** %2, align 8
  %7 = getelementptr inbounds double* %6, i64 0
  %8 = load double* %7, align 8
  %9 = load double* %tmp, align 8
  %10 = fmul double %8, %9
  %11 = load double** %1, align 8
  %12 = getelementptr inbounds double* %11, i64 0
  store double %10, double* %12, align 8
  %13 = load double** %2, align 8
  %14 = getelementptr inbounds double* %13, i64 1
  %15 = load double* %14, align 8
  %16 = load double* %tmp, align 8
  %17 = fmul double %15, %16
  %18 = load double** %1, align 8
  %19 = getelementptr inbounds double* %18, i64 1
  store double %17, double* %19, align 8
  %20 = load double** %2, align 8
  %21 = getelementptr inbounds double* %20, i64 2
  %22 = load double* %21, align 8
  %23 = load double* %tmp, align 8
  %24 = fmul double %22, %23
  %25 = load double** %1, align 8
  %26 = getelementptr inbounds double* %25, i64 2
  store double %24, double* %26, align 8
  ret void
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr void @_ZN3pov4VDotERdPKdS2_(double* dereferenceable(8) %a, double* %b, double* %c) #2 {
  %1 = alloca double*, align 8
  %2 = alloca double*, align 8
  %3 = alloca double*, align 8
  store double* %a, double** %1, align 8
  store double* %b, double** %2, align 8
  store double* %c, double** %3, align 8
  %4 = load double** %2, align 8
  %5 = getelementptr inbounds double* %4, i64 0
  %6 = load double* %5, align 8
  %7 = load double** %3, align 8
  %8 = getelementptr inbounds double* %7, i64 0
  %9 = load double* %8, align 8
  %10 = fmul double %6, %9
  %11 = load double** %2, align 8
  %12 = getelementptr inbounds double* %11, i64 1
  %13 = load double* %12, align 8
  %14 = load double** %3, align 8
  %15 = getelementptr inbounds double* %14, i64 1
  %16 = load double* %15, align 8
  %17 = fmul double %13, %16
  %18 = fadd double %10, %17
  %19 = load double** %2, align 8
  %20 = getelementptr inbounds double* %19, i64 2
  %21 = load double* %20, align 8
  %22 = load double** %3, align 8
  %23 = getelementptr inbounds double* %22, i64 2
  %24 = load double* %23, align 8
  %25 = fmul double %21, %24
  %26 = fadd double %18, %25
  %27 = load double** %1, align 8
  store double %26, double* %27, align 8
  ret void
}

declare void @_ZN3pov14MInvTransPointEPdS0_PNS_16Transform_StructE(double*, double*, %"struct.pov::Transform_Struct"*) #1

; Function Attrs: uwtable
define internal i32 @_ZN3povL15Intersect_PlaneEPNS_10Ray_StructEPNS_12Plane_StructEPd(%"struct.pov::Ray_Struct"* %Ray, %"struct.pov::Plane_Struct"* %Plane, double* %Depth) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %"struct.pov::Ray_Struct"*, align 8
  %3 = alloca %"struct.pov::Plane_Struct"*, align 8
  %4 = alloca double*, align 8
  %NormalDotOrigin = alloca double, align 8
  %NormalDotDirection = alloca double, align 8
  %P = alloca [3 x double], align 16
  %D = alloca [3 x double], align 16
  store %"struct.pov::Ray_Struct"* %Ray, %"struct.pov::Ray_Struct"** %2, align 8
  store %"struct.pov::Plane_Struct"* %Plane, %"struct.pov::Plane_Struct"** %3, align 8
  store double* %Depth, double** %4, align 8
  call void @_ZN3pov16Increase_CounterERx(i64* dereferenceable(8) getelementptr inbounds ([126 x i64]* @_ZN3pov5statsE, i32 0, i64 54))
  %5 = load %"struct.pov::Plane_Struct"** %3, align 8
  %6 = getelementptr inbounds %"struct.pov::Plane_Struct"* %5, i32 0, i32 10
  %7 = load %"struct.pov::Transform_Struct"** %6, align 8
  %8 = icmp eq %"struct.pov::Transform_Struct"* %7, null
  br i1 %8, label %9, label %27

; <label>:9                                       ; preds = %0
  %10 = load %"struct.pov::Plane_Struct"** %3, align 8
  %11 = getelementptr inbounds %"struct.pov::Plane_Struct"* %10, i32 0, i32 14
  %12 = getelementptr inbounds [3 x double]* %11, i32 0, i32 0
  %13 = load %"struct.pov::Ray_Struct"** %2, align 8
  %14 = getelementptr inbounds %"struct.pov::Ray_Struct"* %13, i32 0, i32 1
  %15 = getelementptr inbounds [3 x double]* %14, i32 0, i32 0
  call void @_ZN3pov4VDotERdPKdS2_(double* dereferenceable(8) %NormalDotDirection, double* %12, double* %15)
  %16 = load double* %NormalDotDirection, align 8
  %17 = call double @fabs(double %16) #7
  %18 = fcmp olt double %17, 1.000000e-07
  br i1 %18, label %19, label %20

; <label>:19                                      ; preds = %9
  store i32 0, i32* %1
  br label %74

; <label>:20                                      ; preds = %9
  %21 = load %"struct.pov::Plane_Struct"** %3, align 8
  %22 = getelementptr inbounds %"struct.pov::Plane_Struct"* %21, i32 0, i32 14
  %23 = getelementptr inbounds [3 x double]* %22, i32 0, i32 0
  %24 = load %"struct.pov::Ray_Struct"** %2, align 8
  %25 = getelementptr inbounds %"struct.pov::Ray_Struct"* %24, i32 0, i32 0
  %26 = getelementptr inbounds [3 x double]* %25, i32 0, i32 0
  call void @_ZN3pov4VDotERdPKdS2_(double* dereferenceable(8) %NormalDotOrigin, double* %23, double* %26)
  br label %55

; <label>:27                                      ; preds = %0
  %28 = getelementptr inbounds [3 x double]* %P, i32 0, i32 0
  %29 = load %"struct.pov::Ray_Struct"** %2, align 8
  %30 = getelementptr inbounds %"struct.pov::Ray_Struct"* %29, i32 0, i32 0
  %31 = getelementptr inbounds [3 x double]* %30, i32 0, i32 0
  %32 = load %"struct.pov::Plane_Struct"** %3, align 8
  %33 = getelementptr inbounds %"struct.pov::Plane_Struct"* %32, i32 0, i32 10
  %34 = load %"struct.pov::Transform_Struct"** %33, align 8
  call void @_ZN3pov14MInvTransPointEPdS0_PNS_16Transform_StructE(double* %28, double* %31, %"struct.pov::Transform_Struct"* %34)
  %35 = getelementptr inbounds [3 x double]* %D, i32 0, i32 0
  %36 = load %"struct.pov::Ray_Struct"** %2, align 8
  %37 = getelementptr inbounds %"struct.pov::Ray_Struct"* %36, i32 0, i32 1
  %38 = getelementptr inbounds [3 x double]* %37, i32 0, i32 0
  %39 = load %"struct.pov::Plane_Struct"** %3, align 8
  %40 = getelementptr inbounds %"struct.pov::Plane_Struct"* %39, i32 0, i32 10
  %41 = load %"struct.pov::Transform_Struct"** %40, align 8
  call void @_ZN3pov18MInvTransDirectionEPdS0_PNS_16Transform_StructE(double* %35, double* %38, %"struct.pov::Transform_Struct"* %41)
  %42 = load %"struct.pov::Plane_Struct"** %3, align 8
  %43 = getelementptr inbounds %"struct.pov::Plane_Struct"* %42, i32 0, i32 14
  %44 = getelementptr inbounds [3 x double]* %43, i32 0, i32 0
  %45 = getelementptr inbounds [3 x double]* %D, i32 0, i32 0
  call void @_ZN3pov4VDotERdPKdS2_(double* dereferenceable(8) %NormalDotDirection, double* %44, double* %45)
  %46 = load double* %NormalDotDirection, align 8
  %47 = call double @fabs(double %46) #7
  %48 = fcmp olt double %47, 1.000000e-07
  br i1 %48, label %49, label %50

; <label>:49                                      ; preds = %27
  store i32 0, i32* %1
  br label %74

; <label>:50                                      ; preds = %27
  %51 = load %"struct.pov::Plane_Struct"** %3, align 8
  %52 = getelementptr inbounds %"struct.pov::Plane_Struct"* %51, i32 0, i32 14
  %53 = getelementptr inbounds [3 x double]* %52, i32 0, i32 0
  %54 = getelementptr inbounds [3 x double]* %P, i32 0, i32 0
  call void @_ZN3pov4VDotERdPKdS2_(double* dereferenceable(8) %NormalDotOrigin, double* %53, double* %54)
  br label %55

; <label>:55                                      ; preds = %50, %20
  %56 = load double* %NormalDotOrigin, align 8
  %57 = load %"struct.pov::Plane_Struct"** %3, align 8
  %58 = getelementptr inbounds %"struct.pov::Plane_Struct"* %57, i32 0, i32 15
  %59 = load double* %58, align 8
  %60 = fadd double %56, %59
  %61 = fsub double -0.000000e+00, %60
  %62 = load double* %NormalDotDirection, align 8
  %63 = fdiv double %61, %62
  %64 = load double** %4, align 8
  store double %63, double* %64, align 8
  %65 = load double** %4, align 8
  %66 = load double* %65, align 8
  %67 = fcmp oge double %66, 1.000000e-06
  br i1 %67, label %68, label %73

; <label>:68                                      ; preds = %55
  %69 = load double** %4, align 8
  %70 = load double* %69, align 8
  %71 = fcmp ole double %70, 1.000000e+07
  br i1 %71, label %72, label %73

; <label>:72                                      ; preds = %68
  call void @_ZN3pov16Increase_CounterERx(i64* dereferenceable(8) getelementptr inbounds ([126 x i64]* @_ZN3pov5statsE, i32 0, i64 55))
  store i32 1, i32* %1
  br label %74

; <label>:73                                      ; preds = %68, %55
  store i32 0, i32* %1
  br label %74

; <label>:74                                      ; preds = %73, %72, %49, %19
  %75 = load i32* %1
  ret i32 %75
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr void @_ZN3pov12VEvaluateRayEPdPKddS2_(double* %IPoint, double* %Initial, double %depth, double* %Direction) #2 {
  %1 = alloca double*, align 8
  %2 = alloca double*, align 8
  %3 = alloca double, align 8
  %4 = alloca double*, align 8
  store double* %IPoint, double** %1, align 8
  store double* %Initial, double** %2, align 8
  store double %depth, double* %3, align 8
  store double* %Direction, double** %4, align 8
  %5 = load double** %2, align 8
  %6 = getelementptr inbounds double* %5, i64 0
  %7 = load double* %6, align 8
  %8 = load double* %3, align 8
  %9 = load double** %4, align 8
  %10 = getelementptr inbounds double* %9, i64 0
  %11 = load double* %10, align 8
  %12 = fmul double %8, %11
  %13 = fadd double %7, %12
  %14 = load double** %1, align 8
  %15 = getelementptr inbounds double* %14, i64 0
  store double %13, double* %15, align 8
  %16 = load double** %2, align 8
  %17 = getelementptr inbounds double* %16, i64 1
  %18 = load double* %17, align 8
  %19 = load double* %3, align 8
  %20 = load double** %4, align 8
  %21 = getelementptr inbounds double* %20, i64 1
  %22 = load double* %21, align 8
  %23 = fmul double %19, %22
  %24 = fadd double %18, %23
  %25 = load double** %1, align 8
  %26 = getelementptr inbounds double* %25, i64 1
  store double %24, double* %26, align 8
  %27 = load double** %2, align 8
  %28 = getelementptr inbounds double* %27, i64 2
  %29 = load double* %28, align 8
  %30 = load double* %3, align 8
  %31 = load double** %4, align 8
  %32 = getelementptr inbounds double* %31, i64 2
  %33 = load double* %32, align 8
  %34 = fmul double %30, %33
  %35 = fadd double %29, %34
  %36 = load double** %1, align 8
  %37 = getelementptr inbounds double* %36, i64 2
  store double %35, double* %37, align 8
  ret void
}

declare zeroext i1 @_ZN3pov13Point_In_ClipEPdPNS_13Object_StructE(double*, %"struct.pov::Object_Struct"*) #1

; Function Attrs: inlinehint uwtable
define linkonce_odr void @_ZN3pov10push_entryEdPdPNS_13Object_StructEPNS_13istack_structE(double %d, double* %v, %"struct.pov::Object_Struct"* %o, %"struct.pov::istack_struct"* %i) #5 {
  %1 = alloca double, align 8
  %2 = alloca double*, align 8
  %3 = alloca %"struct.pov::Object_Struct"*, align 8
  %4 = alloca %"struct.pov::istack_struct"*, align 8
  store double %d, double* %1, align 8
  store double* %v, double** %2, align 8
  store %"struct.pov::Object_Struct"* %o, %"struct.pov::Object_Struct"** %3, align 8
  store %"struct.pov::istack_struct"* %i, %"struct.pov::istack_struct"** %4, align 8
  %5 = load double* %1, align 8
  %6 = load %"struct.pov::istack_struct"** %4, align 8
  %7 = call dereferenceable(200) %"struct.pov::istk_entry"* @_ZN3pov4itopEPNS_13istack_structE(%"struct.pov::istack_struct"* %6)
  %8 = getelementptr inbounds %"struct.pov::istk_entry"* %7, i32 0, i32 0
  store double %5, double* %8, align 8
  %9 = load %"struct.pov::Object_Struct"** %3, align 8
  %10 = load %"struct.pov::istack_struct"** %4, align 8
  %11 = call dereferenceable(200) %"struct.pov::istk_entry"* @_ZN3pov4itopEPNS_13istack_structE(%"struct.pov::istack_struct"* %10)
  %12 = getelementptr inbounds %"struct.pov::istk_entry"* %11, i32 0, i32 5
  store %"struct.pov::Object_Struct"* %9, %"struct.pov::Object_Struct"** %12, align 8
  %13 = load %"struct.pov::istack_struct"** %4, align 8
  %14 = call dereferenceable(200) %"struct.pov::istk_entry"* @_ZN3pov4itopEPNS_13istack_structE(%"struct.pov::istack_struct"* %13)
  %15 = getelementptr inbounds %"struct.pov::istk_entry"* %14, i32 0, i32 1
  %16 = getelementptr inbounds [3 x double]* %15, i32 0, i32 0
  %17 = load double** %2, align 8
  call void @_ZN3pov13Assign_VectorEPdS0_(double* %16, double* %17)
  %18 = load %"struct.pov::istack_struct"** %4, align 8
  %19 = call dereferenceable(200) %"struct.pov::istk_entry"* @_ZN3pov4itopEPNS_13istack_structE(%"struct.pov::istack_struct"* %18)
  %20 = getelementptr inbounds %"struct.pov::istk_entry"* %19, i32 0, i32 4
  %21 = getelementptr inbounds [2 x double]* %20, i32 0, i32 0
  %22 = load double** %2, align 8
  call void @_ZN3pov14Assign_UV_VectEPdS0_(double* %21, double* %22)
  %23 = load %"struct.pov::istack_struct"** %4, align 8
  %24 = call dereferenceable(200) %"struct.pov::istk_entry"* @_ZN3pov4itopEPNS_13istack_structE(%"struct.pov::istack_struct"* %23)
  %25 = getelementptr inbounds %"struct.pov::istk_entry"* %24, i32 0, i32 18
  store i8* null, i8** %25, align 8
  %26 = load %"struct.pov::istack_struct"** %4, align 8
  call void @_ZN3pov8incstackEPNS_13istack_structE(%"struct.pov::istack_struct"* %26)
  ret void
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dereferenceable(200) %"struct.pov::istk_entry"* @_ZN3pov4itopEPNS_13istack_structE(%"struct.pov::istack_struct"* %i) #2 {
  %1 = alloca %"struct.pov::istack_struct"*, align 8
  store %"struct.pov::istack_struct"* %i, %"struct.pov::istack_struct"** %1, align 8
  %2 = load %"struct.pov::istack_struct"** %1, align 8
  %3 = getelementptr inbounds %"struct.pov::istack_struct"* %2, i32 0, i32 3
  %4 = load i32* %3, align 4
  %5 = zext i32 %4 to i64
  %6 = load %"struct.pov::istack_struct"** %1, align 8
  %7 = getelementptr inbounds %"struct.pov::istack_struct"* %6, i32 0, i32 1
  %8 = load %"struct.pov::istk_entry"** %7, align 8
  %9 = getelementptr inbounds %"struct.pov::istk_entry"* %8, i64 %5
  ret %"struct.pov::istk_entry"* %9
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr void @_ZN3pov14Assign_UV_VectEPdS0_(double* %d, double* %s) #2 {
  %1 = alloca double*, align 8
  %2 = alloca double*, align 8
  store double* %d, double** %1, align 8
  store double* %s, double** %2, align 8
  %3 = load double** %2, align 8
  %4 = getelementptr inbounds double* %3, i64 0
  %5 = load double* %4, align 8
  %6 = load double** %1, align 8
  %7 = getelementptr inbounds double* %6, i64 0
  store double %5, double* %7, align 8
  %8 = load double** %2, align 8
  %9 = getelementptr inbounds double* %8, i64 1
  %10 = load double* %9, align 8
  %11 = load double** %1, align 8
  %12 = getelementptr inbounds double* %11, i64 1
  store double %10, double* %12, align 8
  ret void
}

declare void @_ZN3pov8incstackEPNS_13istack_structE(%"struct.pov::istack_struct"*) #1

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr void @_ZN3pov16Increase_CounterERx(i64* dereferenceable(8) %x) #2 {
  %1 = alloca i64*, align 8
  store i64* %x, i64** %1, align 8
  %2 = load i64** %1, align 8
  %3 = load i64* %2, align 8
  %4 = add nsw i64 %3, 1
  store i64 %4, i64* %2, align 8
  ret void
}

; Function Attrs: nounwind readnone
declare double @fabs(double) #6

declare void @_ZN3pov18MInvTransDirectionEPdS0_PNS_16Transform_StructE(double*, double*, %"struct.pov::Transform_Struct"*) #1

attributes #0 = { uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { inlinehint nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { inlinehint uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind readnone "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind readnone }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
