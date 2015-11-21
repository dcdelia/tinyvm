; ModuleID = 'planes.ll'
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
  %Depth = alloca double, align 8
  %IPoint = alloca [3 x double], align 16
  %1 = bitcast %"struct.pov::Object_Struct"* %Object to %"struct.pov::Plane_Struct"*
  %2 = call i32 @_ZN3povL15Intersect_PlaneEPNS_10Ray_StructEPNS_12Plane_StructEPd(%"struct.pov::Ray_Struct"* %Ray, %"struct.pov::Plane_Struct"* %1, double* %Depth)
  %3 = icmp ne i32 %2, 0
  br i1 %3, label %4, label %19

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds [3 x double]* %IPoint, i32 0, i32 0
  %6 = getelementptr inbounds %"struct.pov::Ray_Struct"* %Ray, i32 0, i32 0
  %7 = getelementptr inbounds [3 x double]* %6, i32 0, i32 0
  %8 = load double* %Depth, align 8
  %9 = getelementptr inbounds %"struct.pov::Ray_Struct"* %Ray, i32 0, i32 1
  %10 = getelementptr inbounds [3 x double]* %9, i32 0, i32 0
  call void @_ZN3pov12VEvaluateRayEPdPKddS2_(double* %5, double* %7, double %8, double* %10)
  %11 = getelementptr inbounds [3 x double]* %IPoint, i32 0, i32 0
  %12 = getelementptr inbounds %"struct.pov::Object_Struct"* %Object, i32 0, i32 7
  %13 = load %"struct.pov::Object_Struct"** %12, align 8
  %14 = call zeroext i1 @_ZN3pov13Point_In_ClipEPdPNS_13Object_StructE(double* %11, %"struct.pov::Object_Struct"* %13)
  br i1 %14, label %15, label %18

; <label>:15                                      ; preds = %4
  %16 = load double* %Depth, align 8
  %17 = getelementptr inbounds [3 x double]* %IPoint, i32 0, i32 0
  call void @_ZN3pov10push_entryEdPdPNS_13Object_StructEPNS_13istack_structE(double %16, double* %17, %"struct.pov::Object_Struct"* %Object, %"struct.pov::istack_struct"* %Depth_Stack)
  br label %20

; <label>:18                                      ; preds = %4
  br label %19

; <label>:19                                      ; preds = %18, %0
  br label %20

; <label>:20                                      ; preds = %19, %15
  %.0 = phi i32 [ 1, %15 ], [ 0, %19 ]
  ret i32 %.0
}

; Function Attrs: uwtable
define internal i32 @_ZN3povL12Inside_PlaneEPdPNS_13Object_StructE(double* %IPoint, %"struct.pov::Object_Struct"* %Object) #0 {
  %Temp = alloca double, align 8
  %P = alloca [3 x double], align 16
  %1 = bitcast %"struct.pov::Object_Struct"* %Object to %"struct.pov::Plane_Struct"*
  %2 = getelementptr inbounds %"struct.pov::Plane_Struct"* %1, i32 0, i32 10
  %3 = load %"struct.pov::Transform_Struct"** %2, align 8
  %4 = icmp eq %"struct.pov::Transform_Struct"* %3, null
  br i1 %4, label %5, label %9

; <label>:5                                       ; preds = %0
  %6 = bitcast %"struct.pov::Object_Struct"* %Object to %"struct.pov::Plane_Struct"*
  %7 = getelementptr inbounds %"struct.pov::Plane_Struct"* %6, i32 0, i32 14
  %8 = getelementptr inbounds [3 x double]* %7, i32 0, i32 0
  call void @_ZN3pov4VDotERdPKdS2_(double* dereferenceable(8) %Temp, double* %IPoint, double* %8)
  br label %18

; <label>:9                                       ; preds = %0
  %10 = getelementptr inbounds [3 x double]* %P, i32 0, i32 0
  %11 = bitcast %"struct.pov::Object_Struct"* %Object to %"struct.pov::Plane_Struct"*
  %12 = getelementptr inbounds %"struct.pov::Plane_Struct"* %11, i32 0, i32 10
  %13 = load %"struct.pov::Transform_Struct"** %12, align 8
  call void @_ZN3pov14MInvTransPointEPdS0_PNS_16Transform_StructE(double* %10, double* %IPoint, %"struct.pov::Transform_Struct"* %13)
  %14 = getelementptr inbounds [3 x double]* %P, i32 0, i32 0
  %15 = bitcast %"struct.pov::Object_Struct"* %Object to %"struct.pov::Plane_Struct"*
  %16 = getelementptr inbounds %"struct.pov::Plane_Struct"* %15, i32 0, i32 14
  %17 = getelementptr inbounds [3 x double]* %16, i32 0, i32 0
  call void @_ZN3pov4VDotERdPKdS2_(double* dereferenceable(8) %Temp, double* %14, double* %17)
  br label %18

; <label>:18                                      ; preds = %9, %5
  %19 = load double* %Temp, align 8
  %20 = bitcast %"struct.pov::Object_Struct"* %Object to %"struct.pov::Plane_Struct"*
  %21 = getelementptr inbounds %"struct.pov::Plane_Struct"* %20, i32 0, i32 15
  %22 = load double* %21, align 8
  %23 = fadd double %19, %22
  %24 = fcmp olt double %23, 1.000000e-07
  %25 = zext i1 %24 to i32
  ret i32 %25
}

; Function Attrs: uwtable
define internal void @_ZN3povL12Plane_NormalEPdPNS_13Object_StructEPNS_10istk_entryE(double* %Result, %"struct.pov::Object_Struct"* %Object, %"struct.pov::istk_entry"*) #0 {
  %2 = bitcast %"struct.pov::Object_Struct"* %Object to %"struct.pov::Plane_Struct"*
  %3 = getelementptr inbounds %"struct.pov::Plane_Struct"* %2, i32 0, i32 14
  %4 = getelementptr inbounds [3 x double]* %3, i32 0, i32 0
  call void @_ZN3pov13Assign_VectorEPdS0_(double* %Result, double* %4)
  %5 = bitcast %"struct.pov::Object_Struct"* %Object to %"struct.pov::Plane_Struct"*
  %6 = getelementptr inbounds %"struct.pov::Plane_Struct"* %5, i32 0, i32 10
  %7 = load %"struct.pov::Transform_Struct"** %6, align 8
  %8 = icmp ne %"struct.pov::Transform_Struct"* %7, null
  br i1 %8, label %9, label %13

; <label>:9                                       ; preds = %1
  %10 = bitcast %"struct.pov::Object_Struct"* %Object to %"struct.pov::Plane_Struct"*
  %11 = getelementptr inbounds %"struct.pov::Plane_Struct"* %10, i32 0, i32 10
  %12 = load %"struct.pov::Transform_Struct"** %11, align 8
  call void @_ZN3pov12MTransNormalEPdS0_PNS_16Transform_StructE(double* %Result, double* %Result, %"struct.pov::Transform_Struct"* %12)
  call void @_ZN3pov10VNormalizeEPdPKd(double* %Result, double* %Result)
  br label %13

; <label>:13                                      ; preds = %9, %1
  ret void
}

declare void @_ZN3pov15Default_UVCoordEPdPNS_13Object_StructEPNS_10istk_entryE(double*, %"struct.pov::Object_Struct"*, %"struct.pov::istk_entry"*) #1

; Function Attrs: uwtable
define internal %"struct.pov::Plane_Struct"* @_ZN3povL10Copy_PlaneEPNS_13Object_StructE(%"struct.pov::Object_Struct"* %Object) #0 {
  %1 = call %"struct.pov::Plane_Struct"* @_ZN3pov12Create_PlaneEv()
  %2 = getelementptr inbounds %"struct.pov::Plane_Struct"* %1, i32 0, i32 10
  %3 = load %"struct.pov::Transform_Struct"** %2, align 8
  call void @_ZN3pov17Destroy_TransformEPNS_16Transform_StructE(%"struct.pov::Transform_Struct"* %3)
  %4 = bitcast %"struct.pov::Object_Struct"* %Object to %"struct.pov::Plane_Struct"*
  %5 = bitcast %"struct.pov::Plane_Struct"* %1 to i8*
  %6 = bitcast %"struct.pov::Plane_Struct"* %4 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %5, i8* %6, i64 152, i32 8, i1 false)
  %7 = bitcast %"struct.pov::Object_Struct"* %Object to %"struct.pov::Plane_Struct"*
  %8 = getelementptr inbounds %"struct.pov::Plane_Struct"* %7, i32 0, i32 10
  %9 = load %"struct.pov::Transform_Struct"** %8, align 8
  %10 = call %"struct.pov::Transform_Struct"* @_ZN3pov14Copy_TransformEPNS_16Transform_StructE(%"struct.pov::Transform_Struct"* %9)
  %11 = getelementptr inbounds %"struct.pov::Plane_Struct"* %1, i32 0, i32 10
  store %"struct.pov::Transform_Struct"* %10, %"struct.pov::Transform_Struct"** %11, align 8
  ret %"struct.pov::Plane_Struct"* %1
}

; Function Attrs: uwtable
define internal void @_ZN3povL15Translate_PlaneEPNS_13Object_StructEPdPNS_16Transform_StructE(%"struct.pov::Object_Struct"* %Object, double* %Vector, %"struct.pov::Transform_Struct"* %Trans) #0 {
  %Translation = alloca [3 x double], align 16
  %1 = bitcast %"struct.pov::Object_Struct"* %Object to %"struct.pov::Plane_Struct"*
  %2 = getelementptr inbounds %"struct.pov::Plane_Struct"* %1, i32 0, i32 10
  %3 = load %"struct.pov::Transform_Struct"** %2, align 8
  %4 = icmp eq %"struct.pov::Transform_Struct"* %3, null
  br i1 %4, label %5, label %23

; <label>:5                                       ; preds = %0
  %6 = getelementptr inbounds [3 x double]* %Translation, i32 0, i32 0
  %7 = bitcast %"struct.pov::Object_Struct"* %Object to %"struct.pov::Plane_Struct"*
  %8 = getelementptr inbounds %"struct.pov::Plane_Struct"* %7, i32 0, i32 14
  %9 = getelementptr inbounds [3 x double]* %8, i32 0, i32 0
  call void @_ZN3pov9VEvaluateEPdPKdS2_(double* %6, double* %9, double* %Vector)
  %10 = getelementptr inbounds [3 x double]* %Translation, i32 0, i64 0
  %11 = load double* %10, align 8
  %12 = getelementptr inbounds [3 x double]* %Translation, i32 0, i64 1
  %13 = load double* %12, align 8
  %14 = fadd double %11, %13
  %15 = getelementptr inbounds [3 x double]* %Translation, i32 0, i64 2
  %16 = load double* %15, align 8
  %17 = fadd double %14, %16
  %18 = bitcast %"struct.pov::Object_Struct"* %Object to %"struct.pov::Plane_Struct"*
  %19 = getelementptr inbounds %"struct.pov::Plane_Struct"* %18, i32 0, i32 15
  %20 = load double* %19, align 8
  %21 = fsub double %20, %17
  store double %21, double* %19, align 8
  %22 = bitcast %"struct.pov::Object_Struct"* %Object to %"struct.pov::Plane_Struct"*
  call void @_ZN3pov18Compute_Plane_BBoxEPNS_12Plane_StructE(%"struct.pov::Plane_Struct"* %22)
  br label %24

; <label>:23                                      ; preds = %0
  call void @_ZN3povL15Transform_PlaneEPNS_13Object_StructEPNS_16Transform_StructE(%"struct.pov::Object_Struct"* %Object, %"struct.pov::Transform_Struct"* %Trans)
  br label %24

; <label>:24                                      ; preds = %23, %5
  ret void
}

; Function Attrs: uwtable
define internal void @_ZN3povL12Rotate_PlaneEPNS_13Object_StructEPdPNS_16Transform_StructE(%"struct.pov::Object_Struct"* %Object, double*, %"struct.pov::Transform_Struct"* %Trans) #0 {
  %2 = bitcast %"struct.pov::Object_Struct"* %Object to %"struct.pov::Plane_Struct"*
  %3 = getelementptr inbounds %"struct.pov::Plane_Struct"* %2, i32 0, i32 10
  %4 = load %"struct.pov::Transform_Struct"** %3, align 8
  %5 = icmp eq %"struct.pov::Transform_Struct"* %4, null
  br i1 %5, label %6, label %14

; <label>:6                                       ; preds = %1
  %7 = bitcast %"struct.pov::Object_Struct"* %Object to %"struct.pov::Plane_Struct"*
  %8 = getelementptr inbounds %"struct.pov::Plane_Struct"* %7, i32 0, i32 14
  %9 = getelementptr inbounds [3 x double]* %8, i32 0, i32 0
  %10 = bitcast %"struct.pov::Object_Struct"* %Object to %"struct.pov::Plane_Struct"*
  %11 = getelementptr inbounds %"struct.pov::Plane_Struct"* %10, i32 0, i32 14
  %12 = getelementptr inbounds [3 x double]* %11, i32 0, i32 0
  call void @_ZN3pov15MTransDirectionEPdS0_PNS_16Transform_StructE(double* %9, double* %12, %"struct.pov::Transform_Struct"* %Trans)
  %13 = bitcast %"struct.pov::Object_Struct"* %Object to %"struct.pov::Plane_Struct"*
  call void @_ZN3pov18Compute_Plane_BBoxEPNS_12Plane_StructE(%"struct.pov::Plane_Struct"* %13)
  br label %15

; <label>:14                                      ; preds = %1
  call void @_ZN3povL15Transform_PlaneEPNS_13Object_StructEPNS_16Transform_StructE(%"struct.pov::Object_Struct"* %Object, %"struct.pov::Transform_Struct"* %Trans)
  br label %15

; <label>:15                                      ; preds = %14, %6
  ret void
}

; Function Attrs: uwtable
define internal void @_ZN3povL11Scale_PlaneEPNS_13Object_StructEPdPNS_16Transform_StructE(%"struct.pov::Object_Struct"* %Object, double* %Vector, %"struct.pov::Transform_Struct"* %Trans) #0 {
  %Length = alloca double, align 8
  %1 = bitcast %"struct.pov::Object_Struct"* %Object to %"struct.pov::Plane_Struct"*
  %2 = getelementptr inbounds %"struct.pov::Plane_Struct"* %1, i32 0, i32 10
  %3 = load %"struct.pov::Transform_Struct"** %2, align 8
  %4 = icmp eq %"struct.pov::Transform_Struct"* %3, null
  br i1 %4, label %5, label %20

; <label>:5                                       ; preds = %0
  %6 = getelementptr inbounds %"struct.pov::Plane_Struct"* %1, i32 0, i32 14
  %7 = getelementptr inbounds [3 x double]* %6, i32 0, i32 0
  call void @_ZN3pov6VDivEqEPdPKd(double* %7, double* %Vector)
  %8 = bitcast %"struct.pov::Object_Struct"* %Object to %"struct.pov::Plane_Struct"*
  %9 = getelementptr inbounds %"struct.pov::Plane_Struct"* %8, i32 0, i32 14
  %10 = getelementptr inbounds [3 x double]* %9, i32 0, i32 0
  call void @_ZN3pov7VLengthERdPKd(double* dereferenceable(8) %Length, double* %10)
  %11 = bitcast %"struct.pov::Object_Struct"* %Object to %"struct.pov::Plane_Struct"*
  %12 = getelementptr inbounds %"struct.pov::Plane_Struct"* %11, i32 0, i32 14
  %13 = getelementptr inbounds [3 x double]* %12, i32 0, i32 0
  %14 = load double* %Length, align 8
  call void @_ZN3pov15VInverseScaleEqEPdd(double* %13, double %14)
  %15 = load double* %Length, align 8
  %16 = bitcast %"struct.pov::Object_Struct"* %Object to %"struct.pov::Plane_Struct"*
  %17 = getelementptr inbounds %"struct.pov::Plane_Struct"* %16, i32 0, i32 15
  %18 = load double* %17, align 8
  %19 = fdiv double %18, %15
  store double %19, double* %17, align 8
  call void @_ZN3pov18Compute_Plane_BBoxEPNS_12Plane_StructE(%"struct.pov::Plane_Struct"* %1)
  br label %21

; <label>:20                                      ; preds = %0
  call void @_ZN3povL15Transform_PlaneEPNS_13Object_StructEPNS_16Transform_StructE(%"struct.pov::Object_Struct"* %Object, %"struct.pov::Transform_Struct"* %Trans)
  br label %21

; <label>:21                                      ; preds = %20, %5
  ret void
}

; Function Attrs: uwtable
define internal void @_ZN3povL15Transform_PlaneEPNS_13Object_StructEPNS_16Transform_StructE(%"struct.pov::Object_Struct"* %Object, %"struct.pov::Transform_Struct"* %Trans) #0 {
  %1 = bitcast %"struct.pov::Object_Struct"* %Object to %"struct.pov::Plane_Struct"*
  %2 = getelementptr inbounds %"struct.pov::Plane_Struct"* %1, i32 0, i32 10
  %3 = load %"struct.pov::Transform_Struct"** %2, align 8
  %4 = icmp eq %"struct.pov::Transform_Struct"* %3, null
  br i1 %4, label %5, label %8

; <label>:5                                       ; preds = %0
  %6 = call %"struct.pov::Transform_Struct"* @_ZN3pov16Create_TransformEv()
  %7 = getelementptr inbounds %"struct.pov::Plane_Struct"* %1, i32 0, i32 10
  store %"struct.pov::Transform_Struct"* %6, %"struct.pov::Transform_Struct"** %7, align 8
  br label %8

; <label>:8                                       ; preds = %5, %0
  %9 = getelementptr inbounds %"struct.pov::Plane_Struct"* %1, i32 0, i32 10
  %10 = load %"struct.pov::Transform_Struct"** %9, align 8
  call void @_ZN3pov18Compose_TransformsEPNS_16Transform_StructES1_(%"struct.pov::Transform_Struct"* %10, %"struct.pov::Transform_Struct"* %Trans)
  call void @_ZN3pov18Compute_Plane_BBoxEPNS_12Plane_StructE(%"struct.pov::Plane_Struct"* %1)
  ret void
}

; Function Attrs: uwtable
define internal void @_ZN3povL12Invert_PlaneEPNS_13Object_StructE(%"struct.pov::Object_Struct"* %Object) #0 {
  %1 = bitcast %"struct.pov::Object_Struct"* %Object to %"struct.pov::Plane_Struct"*
  %2 = getelementptr inbounds %"struct.pov::Plane_Struct"* %1, i32 0, i32 14
  %3 = getelementptr inbounds [3 x double]* %2, i32 0, i32 0
  call void @_ZN3pov8VScaleEqEPdd(double* %3, double -1.000000e+00)
  %4 = bitcast %"struct.pov::Object_Struct"* %Object to %"struct.pov::Plane_Struct"*
  %5 = getelementptr inbounds %"struct.pov::Plane_Struct"* %4, i32 0, i32 15
  %6 = load double* %5, align 8
  %7 = fmul double %6, -1.000000e+00
  store double %7, double* %5, align 8
  ret void
}

; Function Attrs: uwtable
define internal void @_ZN3povL13Destroy_PlaneEPNS_13Object_StructE(%"struct.pov::Object_Struct"* %Object) #0 {
  %1 = bitcast %"struct.pov::Object_Struct"* %Object to %"struct.pov::Plane_Struct"*
  %2 = getelementptr inbounds %"struct.pov::Plane_Struct"* %1, i32 0, i32 10
  %3 = load %"struct.pov::Transform_Struct"** %2, align 8
  call void @_ZN3pov17Destroy_TransformEPNS_16Transform_StructE(%"struct.pov::Transform_Struct"* %3)
  %4 = bitcast %"struct.pov::Object_Struct"* %Object to i8*
  call void @_ZN3pov8pov_freeEPvPKci(i8* %4, i8* getelementptr inbounds ([11 x i8]* @.str, i32 0, i32 0), i32 633)
  ret void
}

; Function Attrs: uwtable
define %"struct.pov::Plane_Struct"* @_ZN3pov12Create_PlaneEv() #0 {
  %1 = call i8* @_ZN3pov10pov_mallocEmPKciS1_(i64 152, i8* getelementptr inbounds ([11 x i8]* @.str, i32 0, i32 0), i32 534, i8* getelementptr inbounds ([6 x i8]* @.str1, i32 0, i32 0))
  %2 = bitcast i8* %1 to %"struct.pov::Plane_Struct"*
  %3 = getelementptr inbounds %"struct.pov::Plane_Struct"* %2, i32 0, i32 1
  store i32 0, i32* %3, align 4
  %4 = getelementptr inbounds %"struct.pov::Plane_Struct"* %2, i32 0, i32 0
  store %"struct.pov::Method_Struct"* bitcast ({ i32 (%"struct.pov::Object_Struct"*, %"struct.pov::Ray_Struct"*, %"struct.pov::istack_struct"*)*, i32 (double*, %"struct.pov::Object_Struct"*)*, void (double*, %"struct.pov::Object_Struct"*, %"struct.pov::istk_entry"*)*, void (double*, %"struct.pov::Object_Struct"*, %"struct.pov::istk_entry"*)*, i8* (%"struct.pov::Object_Struct"*)*, void (%"struct.pov::Object_Struct"*, double*, %"struct.pov::Transform_Struct"*)*, void (%"struct.pov::Object_Struct"*, double*, %"struct.pov::Transform_Struct"*)*, void (%"struct.pov::Object_Struct"*, double*, %"struct.pov::Transform_Struct"*)*, void (%"struct.pov::Object_Struct"*, %"struct.pov::Transform_Struct"*)*, void (%"struct.pov::Object_Struct"*)*, void (%"struct.pov::Object_Struct"*)* }* @_ZN3pov13Plane_MethodsE to %"struct.pov::Method_Struct"*), %"struct.pov::Method_Struct"** %4, align 8
  %5 = getelementptr inbounds %"struct.pov::Plane_Struct"* %2, i32 0, i32 2
  store %"struct.pov::Object_Struct"* null, %"struct.pov::Object_Struct"** %5, align 8
  %6 = getelementptr inbounds %"struct.pov::Plane_Struct"* %2, i32 0, i32 3
  store %"struct.pov::Texture_Struct"* null, %"struct.pov::Texture_Struct"** %6, align 8
  %7 = getelementptr inbounds %"struct.pov::Plane_Struct"* %2, i32 0, i32 4
  store %"struct.pov::Texture_Struct"* null, %"struct.pov::Texture_Struct"** %7, align 8
  %8 = getelementptr inbounds %"struct.pov::Plane_Struct"* %2, i32 0, i32 5
  store %"struct.pov::Interior_Struct"* null, %"struct.pov::Interior_Struct"** %8, align 8
  %9 = getelementptr inbounds %"struct.pov::Plane_Struct"* %2, i32 0, i32 6
  store %"struct.pov::Object_Struct"* null, %"struct.pov::Object_Struct"** %9, align 8
  %10 = getelementptr inbounds %"struct.pov::Plane_Struct"* %2, i32 0, i32 7
  store %"struct.pov::Object_Struct"* null, %"struct.pov::Object_Struct"** %10, align 8
  %11 = getelementptr inbounds %"struct.pov::Plane_Struct"* %2, i32 0, i32 8
  store %"struct.pov::Light_Source_Struct"* null, %"struct.pov::Light_Source_Struct"** %11, align 8
  %12 = getelementptr inbounds %"struct.pov::Plane_Struct"* %2, i32 0, i32 10
  store %"struct.pov::Transform_Struct"* null, %"struct.pov::Transform_Struct"** %12, align 8
  %13 = getelementptr inbounds %"struct.pov::Plane_Struct"* %2, i32 0, i32 11
  store %"struct.pov::Transform_Struct"* null, %"struct.pov::Transform_Struct"** %13, align 8
  %14 = getelementptr inbounds %"struct.pov::Plane_Struct"* %2, i32 0, i32 12
  store float 0.000000e+00, float* %14, align 4
  %15 = getelementptr inbounds %"struct.pov::Plane_Struct"* %2, i32 0, i32 13
  store i32 0, i32* %15, align 4
  %16 = getelementptr inbounds %"struct.pov::Plane_Struct"* %2, i32 0, i32 9
  call void @_ZN3pov9Make_BBoxERNS_19Bounding_Box_StructEffffff(%"struct.pov::Bounding_Box_Struct"* dereferenceable(24) %16, float -1.000000e+10, float -1.000000e+10, float -1.000000e+10, float 2.000000e+10, float 2.000000e+10, float 2.000000e+10)
  %17 = getelementptr inbounds %"struct.pov::Plane_Struct"* %2, i32 0, i32 14
  %18 = getelementptr inbounds [3 x double]* %17, i32 0, i32 0
  call void @_ZN3pov11Make_VectorEPdddd(double* %18, double 0.000000e+00, double 1.000000e+00, double 0.000000e+00)
  %19 = getelementptr inbounds %"struct.pov::Plane_Struct"* %2, i32 0, i32 15
  store double 0.000000e+00, double* %19, align 8
  %20 = getelementptr inbounds %"struct.pov::Plane_Struct"* %2, i32 0, i32 10
  store %"struct.pov::Transform_Struct"* null, %"struct.pov::Transform_Struct"** %20, align 8
  ret %"struct.pov::Plane_Struct"* %2
}

declare i8* @_ZN3pov10pov_mallocEmPKciS1_(i64, i8*, i32, i8*) #1

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr void @_ZN3pov9Make_BBoxERNS_19Bounding_Box_StructEffffff(%"struct.pov::Bounding_Box_Struct"* dereferenceable(24) %BBox, float %llx, float %lly, float %llz, float %lex, float %ley, float %lez) #2 {
  %1 = getelementptr inbounds %"struct.pov::Bounding_Box_Struct"* %BBox, i32 0, i32 0
  %2 = getelementptr inbounds [3 x float]* %1, i32 0, i64 0
  store float %llx, float* %2, align 4
  %3 = getelementptr inbounds %"struct.pov::Bounding_Box_Struct"* %BBox, i32 0, i32 0
  %4 = getelementptr inbounds [3 x float]* %3, i32 0, i64 1
  store float %lly, float* %4, align 4
  %5 = getelementptr inbounds %"struct.pov::Bounding_Box_Struct"* %BBox, i32 0, i32 0
  %6 = getelementptr inbounds [3 x float]* %5, i32 0, i64 2
  store float %llz, float* %6, align 4
  %7 = getelementptr inbounds %"struct.pov::Bounding_Box_Struct"* %BBox, i32 0, i32 1
  %8 = getelementptr inbounds [3 x float]* %7, i32 0, i64 0
  store float %lex, float* %8, align 4
  %9 = getelementptr inbounds %"struct.pov::Bounding_Box_Struct"* %BBox, i32 0, i32 1
  %10 = getelementptr inbounds [3 x float]* %9, i32 0, i64 1
  store float %ley, float* %10, align 4
  %11 = getelementptr inbounds %"struct.pov::Bounding_Box_Struct"* %BBox, i32 0, i32 1
  %12 = getelementptr inbounds [3 x float]* %11, i32 0, i64 2
  store float %lez, float* %12, align 4
  ret void
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr void @_ZN3pov11Make_VectorEPdddd(double* %v, double %a, double %b, double %c) #2 {
  %1 = getelementptr inbounds double* %v, i64 0
  store double %a, double* %1, align 8
  %2 = getelementptr inbounds double* %v, i64 1
  store double %b, double* %2, align 8
  %3 = getelementptr inbounds double* %v, i64 2
  store double %c, double* %3, align 8
  ret void
}

; Function Attrs: uwtable
define void @_ZN3pov18Compute_Plane_BBoxEPNS_12Plane_StructE(%"struct.pov::Plane_Struct"* %Plane) #0 {
  %1 = getelementptr inbounds %"struct.pov::Plane_Struct"* %Plane, i32 0, i32 9
  call void @_ZN3pov9Make_BBoxERNS_19Bounding_Box_StructEffffff(%"struct.pov::Bounding_Box_Struct"* dereferenceable(24) %1, float -1.000000e+10, float -1.000000e+10, float -1.000000e+10, float 2.000000e+10, float 2.000000e+10, float 2.000000e+10)
  %2 = getelementptr inbounds %"struct.pov::Plane_Struct"* %Plane, i32 0, i32 7
  %3 = load %"struct.pov::Object_Struct"** %2, align 8
  %4 = icmp ne %"struct.pov::Object_Struct"* %3, null
  br i1 %4, label %5, label %12

; <label>:5                                       ; preds = %0
  %6 = getelementptr inbounds %"struct.pov::Plane_Struct"* %Plane, i32 0, i32 9
  %7 = getelementptr inbounds %"struct.pov::Plane_Struct"* %Plane, i32 0, i32 7
  %8 = load %"struct.pov::Object_Struct"** %7, align 8
  %9 = getelementptr inbounds %"struct.pov::Object_Struct"* %8, i32 0, i32 9
  %10 = bitcast %"struct.pov::Bounding_Box_Struct"* %6 to i8*
  %11 = bitcast %"struct.pov::Bounding_Box_Struct"* %9 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %10, i8* %11, i64 24, i32 4, i1 false)
  br label %12

; <label>:12                                      ; preds = %5, %0
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
  %1 = getelementptr inbounds double* %a, i64 0
  %2 = load double* %1, align 8
  %3 = fmul double %2, %k
  store double %3, double* %1, align 8
  %4 = getelementptr inbounds double* %a, i64 1
  %5 = load double* %4, align 8
  %6 = fmul double %5, %k
  store double %6, double* %4, align 8
  %7 = getelementptr inbounds double* %a, i64 2
  %8 = load double* %7, align 8
  %9 = fmul double %8, %k
  store double %9, double* %7, align 8
  ret void
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr void @_ZN3pov6VDivEqEPdPKd(double* %a, double* %b) #2 {
  %1 = getelementptr inbounds double* %b, i64 0
  %2 = load double* %1, align 8
  %3 = getelementptr inbounds double* %a, i64 0
  %4 = load double* %3, align 8
  %5 = fdiv double %4, %2
  store double %5, double* %3, align 8
  %6 = getelementptr inbounds double* %b, i64 1
  %7 = load double* %6, align 8
  %8 = getelementptr inbounds double* %a, i64 1
  %9 = load double* %8, align 8
  %10 = fdiv double %9, %7
  store double %10, double* %8, align 8
  %11 = getelementptr inbounds double* %b, i64 2
  %12 = load double* %11, align 8
  %13 = getelementptr inbounds double* %a, i64 2
  %14 = load double* %13, align 8
  %15 = fdiv double %14, %12
  store double %15, double* %13, align 8
  ret void
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr void @_ZN3pov7VLengthERdPKd(double* dereferenceable(8) %a, double* %b) #2 {
  %1 = getelementptr inbounds double* %b, i64 0
  %2 = load double* %1, align 8
  %3 = getelementptr inbounds double* %b, i64 0
  %4 = load double* %3, align 8
  %5 = fmul double %2, %4
  %6 = getelementptr inbounds double* %b, i64 1
  %7 = load double* %6, align 8
  %8 = getelementptr inbounds double* %b, i64 1
  %9 = load double* %8, align 8
  %10 = fmul double %7, %9
  %11 = fadd double %5, %10
  %12 = getelementptr inbounds double* %b, i64 2
  %13 = load double* %12, align 8
  %14 = getelementptr inbounds double* %b, i64 2
  %15 = load double* %14, align 8
  %16 = fmul double %13, %15
  %17 = fadd double %11, %16
  %18 = call double @sqrt(double %17) #3
  store double %18, double* %a, align 8
  ret void
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr void @_ZN3pov15VInverseScaleEqEPdd(double* %a, double %k) #2 {
  %1 = fdiv double 1.000000e+00, %k
  %2 = getelementptr inbounds double* %a, i64 0
  %3 = load double* %2, align 8
  %4 = fmul double %3, %1
  store double %4, double* %2, align 8
  %5 = getelementptr inbounds double* %a, i64 1
  %6 = load double* %5, align 8
  %7 = fmul double %6, %1
  store double %7, double* %5, align 8
  %8 = getelementptr inbounds double* %a, i64 2
  %9 = load double* %8, align 8
  %10 = fmul double %9, %1
  store double %10, double* %8, align 8
  ret void
}

; Function Attrs: nounwind
declare double @sqrt(double) #4

declare void @_ZN3pov15MTransDirectionEPdS0_PNS_16Transform_StructE(double*, double*, %"struct.pov::Transform_Struct"*) #1

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr void @_ZN3pov9VEvaluateEPdPKdS2_(double* %a, double* %b, double* %c) #2 {
  %1 = getelementptr inbounds double* %b, i64 0
  %2 = load double* %1, align 8
  %3 = getelementptr inbounds double* %c, i64 0
  %4 = load double* %3, align 8
  %5 = fmul double %2, %4
  %6 = getelementptr inbounds double* %a, i64 0
  store double %5, double* %6, align 8
  %7 = getelementptr inbounds double* %b, i64 1
  %8 = load double* %7, align 8
  %9 = getelementptr inbounds double* %c, i64 1
  %10 = load double* %9, align 8
  %11 = fmul double %8, %10
  %12 = getelementptr inbounds double* %a, i64 1
  store double %11, double* %12, align 8
  %13 = getelementptr inbounds double* %b, i64 2
  %14 = load double* %13, align 8
  %15 = getelementptr inbounds double* %c, i64 2
  %16 = load double* %15, align 8
  %17 = fmul double %14, %16
  %18 = getelementptr inbounds double* %a, i64 2
  store double %17, double* %18, align 8
  ret void
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr void @_ZN3pov13Assign_VectorEPdS0_(double* %d, double* %s) #2 {
  %1 = getelementptr inbounds double* %s, i64 0
  %2 = load double* %1, align 8
  %3 = getelementptr inbounds double* %d, i64 0
  store double %2, double* %3, align 8
  %4 = getelementptr inbounds double* %s, i64 1
  %5 = load double* %4, align 8
  %6 = getelementptr inbounds double* %d, i64 1
  store double %5, double* %6, align 8
  %7 = getelementptr inbounds double* %s, i64 2
  %8 = load double* %7, align 8
  %9 = getelementptr inbounds double* %d, i64 2
  store double %8, double* %9, align 8
  ret void
}

declare void @_ZN3pov12MTransNormalEPdS0_PNS_16Transform_StructE(double*, double*, %"struct.pov::Transform_Struct"*) #1

; Function Attrs: inlinehint uwtable
define linkonce_odr void @_ZN3pov10VNormalizeEPdPKd(double* %a, double* %b) #5 {
  %tmp = alloca double, align 8
  call void @_ZN3pov7VLengthERdPKd(double* dereferenceable(8) %tmp, double* %b)
  %1 = load double* %tmp, align 8
  call void @_ZN3pov13VInverseScaleEPdPKdd(double* %a, double* %b, double %1)
  ret void
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr void @_ZN3pov13VInverseScaleEPdPKdd(double* %a, double* %b, double %k) #2 {
  %1 = fdiv double 1.000000e+00, %k
  %2 = getelementptr inbounds double* %b, i64 0
  %3 = load double* %2, align 8
  %4 = fmul double %3, %1
  %5 = getelementptr inbounds double* %a, i64 0
  store double %4, double* %5, align 8
  %6 = getelementptr inbounds double* %b, i64 1
  %7 = load double* %6, align 8
  %8 = fmul double %7, %1
  %9 = getelementptr inbounds double* %a, i64 1
  store double %8, double* %9, align 8
  %10 = getelementptr inbounds double* %b, i64 2
  %11 = load double* %10, align 8
  %12 = fmul double %11, %1
  %13 = getelementptr inbounds double* %a, i64 2
  store double %12, double* %13, align 8
  ret void
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr void @_ZN3pov4VDotERdPKdS2_(double* dereferenceable(8) %a, double* %b, double* %c) #2 {
  %1 = getelementptr inbounds double* %b, i64 0
  %2 = load double* %1, align 8
  %3 = getelementptr inbounds double* %c, i64 0
  %4 = load double* %3, align 8
  %5 = fmul double %2, %4
  %6 = getelementptr inbounds double* %b, i64 1
  %7 = load double* %6, align 8
  %8 = getelementptr inbounds double* %c, i64 1
  %9 = load double* %8, align 8
  %10 = fmul double %7, %9
  %11 = fadd double %5, %10
  %12 = getelementptr inbounds double* %b, i64 2
  %13 = load double* %12, align 8
  %14 = getelementptr inbounds double* %c, i64 2
  %15 = load double* %14, align 8
  %16 = fmul double %13, %15
  %17 = fadd double %11, %16
  store double %17, double* %a, align 8
  ret void
}

declare void @_ZN3pov14MInvTransPointEPdS0_PNS_16Transform_StructE(double*, double*, %"struct.pov::Transform_Struct"*) #1

; Function Attrs: uwtable
define internal i32 @_ZN3povL15Intersect_PlaneEPNS_10Ray_StructEPNS_12Plane_StructEPd(%"struct.pov::Ray_Struct"* %Ray, %"struct.pov::Plane_Struct"* %Plane, double* %Depth) #0 {
  %NormalDotOrigin = alloca double, align 8
  %NormalDotDirection = alloca double, align 8
  %P = alloca [3 x double], align 16
  %D = alloca [3 x double], align 16
  call void @_ZN3pov16Increase_CounterERx(i64* dereferenceable(8) getelementptr inbounds ([126 x i64]* @_ZN3pov5statsE, i32 0, i64 54))
  %1 = getelementptr inbounds %"struct.pov::Plane_Struct"* %Plane, i32 0, i32 10
  %2 = load %"struct.pov::Transform_Struct"** %1, align 8
  %3 = icmp eq %"struct.pov::Transform_Struct"* %2, null
  br i1 %3, label %4, label %18

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds %"struct.pov::Plane_Struct"* %Plane, i32 0, i32 14
  %6 = getelementptr inbounds [3 x double]* %5, i32 0, i32 0
  %7 = getelementptr inbounds %"struct.pov::Ray_Struct"* %Ray, i32 0, i32 1
  %8 = getelementptr inbounds [3 x double]* %7, i32 0, i32 0
  call void @_ZN3pov4VDotERdPKdS2_(double* dereferenceable(8) %NormalDotDirection, double* %6, double* %8)
  %9 = load double* %NormalDotDirection, align 8
  %10 = call double @fabs(double %9) #7
  %11 = fcmp olt double %10, 1.000000e-07
  br i1 %11, label %12, label %13

; <label>:12                                      ; preds = %4
  br label %55

; <label>:13                                      ; preds = %4
  %14 = getelementptr inbounds %"struct.pov::Plane_Struct"* %Plane, i32 0, i32 14
  %15 = getelementptr inbounds [3 x double]* %14, i32 0, i32 0
  %16 = getelementptr inbounds %"struct.pov::Ray_Struct"* %Ray, i32 0, i32 0
  %17 = getelementptr inbounds [3 x double]* %16, i32 0, i32 0
  call void @_ZN3pov4VDotERdPKdS2_(double* dereferenceable(8) %NormalDotOrigin, double* %15, double* %17)
  br label %40

; <label>:18                                      ; preds = %0
  %19 = getelementptr inbounds [3 x double]* %P, i32 0, i32 0
  %20 = getelementptr inbounds %"struct.pov::Ray_Struct"* %Ray, i32 0, i32 0
  %21 = getelementptr inbounds [3 x double]* %20, i32 0, i32 0
  %22 = getelementptr inbounds %"struct.pov::Plane_Struct"* %Plane, i32 0, i32 10
  %23 = load %"struct.pov::Transform_Struct"** %22, align 8
  call void @_ZN3pov14MInvTransPointEPdS0_PNS_16Transform_StructE(double* %19, double* %21, %"struct.pov::Transform_Struct"* %23)
  %24 = getelementptr inbounds [3 x double]* %D, i32 0, i32 0
  %25 = getelementptr inbounds %"struct.pov::Ray_Struct"* %Ray, i32 0, i32 1
  %26 = getelementptr inbounds [3 x double]* %25, i32 0, i32 0
  %27 = getelementptr inbounds %"struct.pov::Plane_Struct"* %Plane, i32 0, i32 10
  %28 = load %"struct.pov::Transform_Struct"** %27, align 8
  call void @_ZN3pov18MInvTransDirectionEPdS0_PNS_16Transform_StructE(double* %24, double* %26, %"struct.pov::Transform_Struct"* %28)
  %29 = getelementptr inbounds %"struct.pov::Plane_Struct"* %Plane, i32 0, i32 14
  %30 = getelementptr inbounds [3 x double]* %29, i32 0, i32 0
  %31 = getelementptr inbounds [3 x double]* %D, i32 0, i32 0
  call void @_ZN3pov4VDotERdPKdS2_(double* dereferenceable(8) %NormalDotDirection, double* %30, double* %31)
  %32 = load double* %NormalDotDirection, align 8
  %33 = call double @fabs(double %32) #7
  %34 = fcmp olt double %33, 1.000000e-07
  br i1 %34, label %35, label %36

; <label>:35                                      ; preds = %18
  br label %55

; <label>:36                                      ; preds = %18
  %37 = getelementptr inbounds %"struct.pov::Plane_Struct"* %Plane, i32 0, i32 14
  %38 = getelementptr inbounds [3 x double]* %37, i32 0, i32 0
  %39 = getelementptr inbounds [3 x double]* %P, i32 0, i32 0
  call void @_ZN3pov4VDotERdPKdS2_(double* dereferenceable(8) %NormalDotOrigin, double* %38, double* %39)
  br label %40

; <label>:40                                      ; preds = %36, %13
  %41 = load double* %NormalDotOrigin, align 8
  %42 = getelementptr inbounds %"struct.pov::Plane_Struct"* %Plane, i32 0, i32 15
  %43 = load double* %42, align 8
  %44 = fadd double %41, %43
  %45 = fsub double -0.000000e+00, %44
  %46 = load double* %NormalDotDirection, align 8
  %47 = fdiv double %45, %46
  store double %47, double* %Depth, align 8
  %48 = load double* %Depth, align 8
  %49 = fcmp oge double %48, 1.000000e-06
  br i1 %49, label %50, label %54

; <label>:50                                      ; preds = %40
  %51 = load double* %Depth, align 8
  %52 = fcmp ole double %51, 1.000000e+07
  br i1 %52, label %53, label %54

; <label>:53                                      ; preds = %50
  call void @_ZN3pov16Increase_CounterERx(i64* dereferenceable(8) getelementptr inbounds ([126 x i64]* @_ZN3pov5statsE, i32 0, i64 55))
  br label %55

; <label>:54                                      ; preds = %50, %40
  br label %55

; <label>:55                                      ; preds = %54, %53, %35, %12
  %.0 = phi i32 [ 0, %12 ], [ 1, %53 ], [ 0, %54 ], [ 0, %35 ]
  ret i32 %.0
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr void @_ZN3pov12VEvaluateRayEPdPKddS2_(double* %IPoint, double* %Initial, double %depth, double* %Direction) #2 {
  %1 = getelementptr inbounds double* %Initial, i64 0
  %2 = load double* %1, align 8
  %3 = getelementptr inbounds double* %Direction, i64 0
  %4 = load double* %3, align 8
  %5 = fmul double %depth, %4
  %6 = fadd double %2, %5
  %7 = getelementptr inbounds double* %IPoint, i64 0
  store double %6, double* %7, align 8
  %8 = getelementptr inbounds double* %Initial, i64 1
  %9 = load double* %8, align 8
  %10 = getelementptr inbounds double* %Direction, i64 1
  %11 = load double* %10, align 8
  %12 = fmul double %depth, %11
  %13 = fadd double %9, %12
  %14 = getelementptr inbounds double* %IPoint, i64 1
  store double %13, double* %14, align 8
  %15 = getelementptr inbounds double* %Initial, i64 2
  %16 = load double* %15, align 8
  %17 = getelementptr inbounds double* %Direction, i64 2
  %18 = load double* %17, align 8
  %19 = fmul double %depth, %18
  %20 = fadd double %16, %19
  %21 = getelementptr inbounds double* %IPoint, i64 2
  store double %20, double* %21, align 8
  ret void
}

declare zeroext i1 @_ZN3pov13Point_In_ClipEPdPNS_13Object_StructE(double*, %"struct.pov::Object_Struct"*) #1

; Function Attrs: inlinehint uwtable
define linkonce_odr void @_ZN3pov10push_entryEdPdPNS_13Object_StructEPNS_13istack_structE(double %d, double* %v, %"struct.pov::Object_Struct"* %o, %"struct.pov::istack_struct"* %i) #5 {
  %1 = call dereferenceable(200) %"struct.pov::istk_entry"* @_ZN3pov4itopEPNS_13istack_structE(%"struct.pov::istack_struct"* %i)
  %2 = getelementptr inbounds %"struct.pov::istk_entry"* %1, i32 0, i32 0
  store double %d, double* %2, align 8
  %3 = call dereferenceable(200) %"struct.pov::istk_entry"* @_ZN3pov4itopEPNS_13istack_structE(%"struct.pov::istack_struct"* %i)
  %4 = getelementptr inbounds %"struct.pov::istk_entry"* %3, i32 0, i32 5
  store %"struct.pov::Object_Struct"* %o, %"struct.pov::Object_Struct"** %4, align 8
  %5 = call dereferenceable(200) %"struct.pov::istk_entry"* @_ZN3pov4itopEPNS_13istack_structE(%"struct.pov::istack_struct"* %i)
  %6 = getelementptr inbounds %"struct.pov::istk_entry"* %5, i32 0, i32 1
  %7 = getelementptr inbounds [3 x double]* %6, i32 0, i32 0
  call void @_ZN3pov13Assign_VectorEPdS0_(double* %7, double* %v)
  %8 = call dereferenceable(200) %"struct.pov::istk_entry"* @_ZN3pov4itopEPNS_13istack_structE(%"struct.pov::istack_struct"* %i)
  %9 = getelementptr inbounds %"struct.pov::istk_entry"* %8, i32 0, i32 4
  %10 = getelementptr inbounds [2 x double]* %9, i32 0, i32 0
  call void @_ZN3pov14Assign_UV_VectEPdS0_(double* %10, double* %v)
  %11 = call dereferenceable(200) %"struct.pov::istk_entry"* @_ZN3pov4itopEPNS_13istack_structE(%"struct.pov::istack_struct"* %i)
  %12 = getelementptr inbounds %"struct.pov::istk_entry"* %11, i32 0, i32 18
  store i8* null, i8** %12, align 8
  call void @_ZN3pov8incstackEPNS_13istack_structE(%"struct.pov::istack_struct"* %i)
  ret void
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dereferenceable(200) %"struct.pov::istk_entry"* @_ZN3pov4itopEPNS_13istack_structE(%"struct.pov::istack_struct"* %i) #2 {
  %1 = getelementptr inbounds %"struct.pov::istack_struct"* %i, i32 0, i32 3
  %2 = load i32* %1, align 4
  %3 = zext i32 %2 to i64
  %4 = getelementptr inbounds %"struct.pov::istack_struct"* %i, i32 0, i32 1
  %5 = load %"struct.pov::istk_entry"** %4, align 8
  %6 = getelementptr inbounds %"struct.pov::istk_entry"* %5, i64 %3
  ret %"struct.pov::istk_entry"* %6
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr void @_ZN3pov14Assign_UV_VectEPdS0_(double* %d, double* %s) #2 {
  %1 = getelementptr inbounds double* %s, i64 0
  %2 = load double* %1, align 8
  %3 = getelementptr inbounds double* %d, i64 0
  store double %2, double* %3, align 8
  %4 = getelementptr inbounds double* %s, i64 1
  %5 = load double* %4, align 8
  %6 = getelementptr inbounds double* %d, i64 1
  store double %5, double* %6, align 8
  ret void
}

declare void @_ZN3pov8incstackEPNS_13istack_structE(%"struct.pov::istack_struct"*) #1

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr void @_ZN3pov16Increase_CounterERx(i64* dereferenceable(8) %x) #2 {
  %1 = load i64* %x, align 8
  %2 = add nsw i64 %1, 1
  store i64 %2, i64* %x, align 8
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
