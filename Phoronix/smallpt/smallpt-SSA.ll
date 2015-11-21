; ModuleID = 'smallpt.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.Sphere = type <{ double, %struct.Vec, %struct.Vec, %struct.Vec, i32, [4 x i8] }>
%struct.Vec = type { double, double, double }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.Ray = type { %struct.Vec, %struct.Vec }

@spheres = global [9 x %struct.Sphere] zeroinitializer, align 16
@stderr = external global %struct._IO_FILE*
@.str = private unnamed_addr constant [28 x i8] c"\0DRendering (%d spp) %5.2f%%\00", align 1
@stdout = external global %struct._IO_FILE*
@.str1 = private unnamed_addr constant [29 x i8] c"\0A\0AElapsed Time: %f Seconds\0A\0A\00", align 1
@.str2 = private unnamed_addr constant [10 x i8] c"image.ppm\00", align 1
@.str3 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str4 = private unnamed_addr constant [13 x i8] c"P3\0A%d %d\0A%d\0A\00", align 1
@.str5 = private unnamed_addr constant [10 x i8] c"%d %d %d \00", align 1
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__sub_I_smallpt.cpp, i8* null }]

define internal void @__cxx_global_var_init() section ".text.startup" {
  %1 = alloca %struct.Vec, align 8
  %2 = alloca %struct.Vec, align 8
  %3 = alloca %struct.Vec, align 8
  %4 = alloca %struct.Vec, align 8
  %5 = alloca %struct.Vec, align 8
  %6 = alloca %struct.Vec, align 8
  %7 = alloca %struct.Vec, align 8
  %8 = alloca %struct.Vec, align 8
  %9 = alloca %struct.Vec, align 8
  %10 = alloca %struct.Vec, align 8
  %11 = alloca %struct.Vec, align 8
  %12 = alloca %struct.Vec, align 8
  %13 = alloca %struct.Vec, align 8
  %14 = alloca %struct.Vec, align 8
  %15 = alloca %struct.Vec, align 8
  %16 = alloca %struct.Vec, align 8
  %17 = alloca %struct.Vec, align 8
  %18 = alloca %struct.Vec, align 8
  %19 = alloca %struct.Vec, align 8
  %20 = alloca %struct.Vec, align 8
  %21 = alloca %struct.Vec, align 8
  %22 = alloca %struct.Vec, align 8
  %23 = alloca %struct.Vec, align 8
  %24 = alloca %struct.Vec, align 8
  %25 = alloca %struct.Vec, align 8
  %26 = alloca %struct.Vec, align 8
  %27 = alloca %struct.Vec, align 8
  %28 = alloca %struct.Vec, align 8
  %29 = alloca %struct.Vec, align 8
  call void @_ZN3VecC2Eddd(%struct.Vec* %1, double 1.000010e+05, double 4.080000e+01, double 8.160000e+01)
  call void @_ZN3VecC2Eddd(%struct.Vec* %2, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00)
  call void @_ZN3VecC2Eddd(%struct.Vec* %3, double 7.500000e-01, double 2.500000e-01, double 2.500000e-01)
  call void @_ZN6SphereC2Ed3VecS0_S0_6Refl_t(%struct.Sphere* getelementptr inbounds ([9 x %struct.Sphere]* @spheres, i64 0, i64 0), double 1.000000e+05, %struct.Vec* byval align 8 %1, %struct.Vec* byval align 8 %2, %struct.Vec* byval align 8 %3, i32 0)
  call void @_ZN3VecC2Eddd(%struct.Vec* %4, double -9.990100e+04, double 4.080000e+01, double 8.160000e+01)
  call void @_ZN3VecC2Eddd(%struct.Vec* %5, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00)
  call void @_ZN3VecC2Eddd(%struct.Vec* %6, double 2.500000e-01, double 2.500000e-01, double 7.500000e-01)
  call void @_ZN6SphereC2Ed3VecS0_S0_6Refl_t(%struct.Sphere* getelementptr inbounds ([9 x %struct.Sphere]* @spheres, i64 0, i64 1), double 1.000000e+05, %struct.Vec* byval align 8 %4, %struct.Vec* byval align 8 %5, %struct.Vec* byval align 8 %6, i32 0)
  call void @_ZN3VecC2Eddd(%struct.Vec* %7, double 5.000000e+01, double 4.080000e+01, double 1.000000e+05)
  call void @_ZN3VecC2Eddd(%struct.Vec* %8, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00)
  call void @_ZN3VecC2Eddd(%struct.Vec* %9, double 7.500000e-01, double 7.500000e-01, double 7.500000e-01)
  call void @_ZN6SphereC2Ed3VecS0_S0_6Refl_t(%struct.Sphere* getelementptr inbounds ([9 x %struct.Sphere]* @spheres, i64 0, i64 2), double 1.000000e+05, %struct.Vec* byval align 8 %7, %struct.Vec* byval align 8 %8, %struct.Vec* byval align 8 %9, i32 0)
  call void @_ZN3VecC2Eddd(%struct.Vec* %10, double 5.000000e+01, double 4.080000e+01, double -9.983000e+04)
  call void @_ZN3VecC2Eddd(%struct.Vec* %11, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00)
  call void @_ZN3VecC2Eddd(%struct.Vec* %12, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00)
  call void @_ZN6SphereC2Ed3VecS0_S0_6Refl_t(%struct.Sphere* getelementptr inbounds ([9 x %struct.Sphere]* @spheres, i64 0, i64 3), double 1.000000e+05, %struct.Vec* byval align 8 %10, %struct.Vec* byval align 8 %11, %struct.Vec* byval align 8 %12, i32 0)
  call void @_ZN3VecC2Eddd(%struct.Vec* %13, double 5.000000e+01, double 1.000000e+05, double 8.160000e+01)
  call void @_ZN3VecC2Eddd(%struct.Vec* %14, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00)
  call void @_ZN3VecC2Eddd(%struct.Vec* %15, double 7.500000e-01, double 7.500000e-01, double 7.500000e-01)
  call void @_ZN6SphereC2Ed3VecS0_S0_6Refl_t(%struct.Sphere* getelementptr inbounds ([9 x %struct.Sphere]* @spheres, i64 0, i64 4), double 1.000000e+05, %struct.Vec* byval align 8 %13, %struct.Vec* byval align 8 %14, %struct.Vec* byval align 8 %15, i32 0)
  call void @_ZN3VecC2Eddd(%struct.Vec* %16, double 5.000000e+01, double -9.991840e+04, double 8.160000e+01)
  call void @_ZN3VecC2Eddd(%struct.Vec* %17, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00)
  call void @_ZN3VecC2Eddd(%struct.Vec* %18, double 7.500000e-01, double 7.500000e-01, double 7.500000e-01)
  call void @_ZN6SphereC2Ed3VecS0_S0_6Refl_t(%struct.Sphere* getelementptr inbounds ([9 x %struct.Sphere]* @spheres, i64 0, i64 5), double 1.000000e+05, %struct.Vec* byval align 8 %16, %struct.Vec* byval align 8 %17, %struct.Vec* byval align 8 %18, i32 0)
  call void @_ZN3VecC2Eddd(%struct.Vec* %19, double 2.700000e+01, double 1.650000e+01, double 4.700000e+01)
  call void @_ZN3VecC2Eddd(%struct.Vec* %20, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00)
  call void @_ZN3VecC2Eddd(%struct.Vec* %22, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00)
  call void @_ZNK3VecmlEd(%struct.Vec* sret %21, %struct.Vec* %22, double 9.990000e-01)
  call void @_ZN6SphereC2Ed3VecS0_S0_6Refl_t(%struct.Sphere* getelementptr inbounds ([9 x %struct.Sphere]* @spheres, i64 0, i64 6), double 1.650000e+01, %struct.Vec* byval align 8 %19, %struct.Vec* byval align 8 %20, %struct.Vec* byval align 8 %21, i32 1)
  call void @_ZN3VecC2Eddd(%struct.Vec* %23, double 7.300000e+01, double 1.650000e+01, double 7.800000e+01)
  call void @_ZN3VecC2Eddd(%struct.Vec* %24, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00)
  call void @_ZN3VecC2Eddd(%struct.Vec* %26, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00)
  call void @_ZNK3VecmlEd(%struct.Vec* sret %25, %struct.Vec* %26, double 9.990000e-01)
  call void @_ZN6SphereC2Ed3VecS0_S0_6Refl_t(%struct.Sphere* getelementptr inbounds ([9 x %struct.Sphere]* @spheres, i64 0, i64 7), double 1.650000e+01, %struct.Vec* byval align 8 %23, %struct.Vec* byval align 8 %24, %struct.Vec* byval align 8 %25, i32 2)
  call void @_ZN3VecC2Eddd(%struct.Vec* %27, double 5.000000e+01, double 6.813300e+02, double 8.160000e+01)
  call void @_ZN3VecC2Eddd(%struct.Vec* %28, double 1.200000e+01, double 1.200000e+01, double 1.200000e+01)
  call void @_ZN3VecC2Eddd(%struct.Vec* %29, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00)
  call void @_ZN6SphereC2Ed3VecS0_S0_6Refl_t(%struct.Sphere* getelementptr inbounds ([9 x %struct.Sphere]* @spheres, i64 0, i64 8), double 6.000000e+02, %struct.Vec* byval align 8 %27, %struct.Vec* byval align 8 %28, %struct.Vec* byval align 8 %29, i32 0)
  ret void
}

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN3VecC2Eddd(%struct.Vec* %this, double %x_, double %y_, double %z_) unnamed_addr #0 align 2 {
  %1 = getelementptr inbounds %struct.Vec* %this, i32 0, i32 0
  store double %x_, double* %1, align 8
  %2 = getelementptr inbounds %struct.Vec* %this, i32 0, i32 1
  store double %y_, double* %2, align 8
  %3 = getelementptr inbounds %struct.Vec* %this, i32 0, i32 2
  store double %z_, double* %3, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN6SphereC2Ed3VecS0_S0_6Refl_t(%struct.Sphere* %this, double %rad_, %struct.Vec* byval align 8 %p_, %struct.Vec* byval align 8 %e_, %struct.Vec* byval align 8 %c_, i32 %refl_) unnamed_addr #0 align 2 {
  %1 = getelementptr inbounds %struct.Sphere* %this, i32 0, i32 0
  store double %rad_, double* %1, align 8
  %2 = getelementptr inbounds %struct.Sphere* %this, i32 0, i32 1
  %3 = bitcast %struct.Vec* %2 to i8*
  %4 = bitcast %struct.Vec* %p_ to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %3, i8* %4, i64 24, i32 8, i1 false)
  %5 = getelementptr inbounds %struct.Sphere* %this, i32 0, i32 2
  %6 = bitcast %struct.Vec* %5 to i8*
  %7 = bitcast %struct.Vec* %e_ to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %6, i8* %7, i64 24, i32 8, i1 false)
  %8 = getelementptr inbounds %struct.Sphere* %this, i32 0, i32 3
  %9 = bitcast %struct.Vec* %8 to i8*
  %10 = bitcast %struct.Vec* %c_ to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %9, i8* %10, i64 24, i32 8, i1 false)
  %11 = getelementptr inbounds %struct.Sphere* %this, i32 0, i32 4
  store i32 %refl_, i32* %11, align 4
  ret void
}

; Function Attrs: uwtable
define linkonce_odr void @_ZNK3VecmlEd(%struct.Vec* noalias sret %agg.result, %struct.Vec* %this, double %b) #1 align 2 {
  %1 = getelementptr inbounds %struct.Vec* %this, i32 0, i32 0
  %2 = load double* %1, align 8
  %3 = fmul double %2, %b
  %4 = getelementptr inbounds %struct.Vec* %this, i32 0, i32 1
  %5 = load double* %4, align 8
  %6 = fmul double %5, %b
  %7 = getelementptr inbounds %struct.Vec* %this, i32 0, i32 2
  %8 = load double* %7, align 8
  %9 = fmul double %8, %b
  call void @_ZN3VecC2Eddd(%struct.Vec* %agg.result, double %3, double %6, double %9)
  ret void
}

; Function Attrs: uwtable
define void @_Z8radianceRK3RayiPt(%struct.Vec* noalias sret %agg.result, %struct.Ray* dereferenceable(48) %r, i32 %depth, i16* %Xi) #1 {
  %t = alloca double, align 8
  %id = alloca i32, align 4
  %x = alloca %struct.Vec, align 8
  %1 = alloca %struct.Vec, align 8
  %n = alloca %struct.Vec, align 8
  %2 = alloca %struct.Vec, align 8
  %nl = alloca %struct.Vec, align 8
  %f = alloca %struct.Vec, align 8
  %3 = alloca %struct.Vec, align 8
  %w = alloca %struct.Vec, align 8
  %u = alloca %struct.Vec, align 8
  %4 = alloca %struct.Vec, align 8
  %5 = alloca %struct.Vec, align 8
  %v = alloca %struct.Vec, align 8
  %d = alloca %struct.Vec, align 8
  %6 = alloca %struct.Vec, align 8
  %7 = alloca %struct.Vec, align 8
  %8 = alloca %struct.Vec, align 8
  %9 = alloca %struct.Vec, align 8
  %10 = alloca %struct.Vec, align 8
  %11 = alloca %struct.Vec, align 8
  %12 = alloca %struct.Vec, align 8
  %13 = alloca %struct.Vec, align 8
  %14 = alloca %struct.Vec, align 8
  %15 = alloca %struct.Ray, align 8
  %16 = alloca %struct.Vec, align 8
  %17 = alloca %struct.Vec, align 8
  %18 = alloca %struct.Vec, align 8
  %19 = alloca %struct.Vec, align 8
  %20 = alloca %struct.Ray, align 8
  %21 = alloca %struct.Vec, align 8
  %22 = alloca %struct.Vec, align 8
  %23 = alloca %struct.Vec, align 8
  %24 = alloca %struct.Vec, align 8
  %reflRay = alloca %struct.Ray, align 8
  %25 = alloca %struct.Vec, align 8
  %26 = alloca %struct.Vec, align 8
  %27 = alloca %struct.Vec, align 8
  %28 = alloca %struct.Vec, align 8
  %29 = alloca %struct.Vec, align 8
  %30 = alloca %struct.Vec, align 8
  %tdir = alloca %struct.Vec, align 8
  %31 = alloca %struct.Vec, align 8
  %32 = alloca %struct.Vec, align 8
  %33 = alloca %struct.Vec, align 8
  %34 = alloca %struct.Vec, align 8
  %35 = alloca %struct.Vec, align 8
  %36 = alloca %struct.Vec, align 8
  %37 = alloca %struct.Ray, align 8
  %38 = alloca %struct.Vec, align 8
  %39 = alloca %struct.Vec, align 8
  %40 = alloca %struct.Vec, align 8
  %41 = alloca %struct.Vec, align 8
  %42 = alloca %struct.Vec, align 8
  %43 = alloca %struct.Vec, align 8
  %44 = alloca %struct.Ray, align 8
  %45 = alloca %struct.Vec, align 8
  %46 = alloca %struct.Vec, align 8
  %47 = alloca %struct.Vec, align 8
  store i32 0, i32* %id, align 4
  %48 = call zeroext i1 @_Z9intersectRK3RayRdRi(%struct.Ray* dereferenceable(48) %r, double* dereferenceable(8) %t, i32* dereferenceable(4) %id)
  br i1 %48, label %50, label %49

; <label>:49                                      ; preds = %0
  call void @_ZN3VecC2Eddd(%struct.Vec* %agg.result, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00)
  br label %243

; <label>:50                                      ; preds = %0
  %51 = load i32* %id, align 4
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds [9 x %struct.Sphere]* @spheres, i32 0, i64 %52
  %54 = getelementptr inbounds %struct.Ray* %r, i32 0, i32 0
  %55 = getelementptr inbounds %struct.Ray* %r, i32 0, i32 1
  %56 = load double* %t, align 8
  call void @_ZNK3VecmlEd(%struct.Vec* sret %1, %struct.Vec* %55, double %56)
  call void @_ZNK3VecplERKS_(%struct.Vec* sret %x, %struct.Vec* %54, %struct.Vec* dereferenceable(24) %1)
  %57 = getelementptr inbounds %struct.Sphere* %53, i32 0, i32 1
  call void @_ZNK3VecmiERKS_(%struct.Vec* sret %2, %struct.Vec* %x, %struct.Vec* dereferenceable(24) %57)
  %58 = call dereferenceable(24) %struct.Vec* @_ZN3Vec4normEv(%struct.Vec* %2)
  %59 = bitcast %struct.Vec* %n to i8*
  %60 = bitcast %struct.Vec* %58 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %59, i8* %60, i64 24, i32 8, i1 false)
  %61 = getelementptr inbounds %struct.Ray* %r, i32 0, i32 1
  %62 = call double @_ZNK3Vec3dotERKS_(%struct.Vec* %n, %struct.Vec* dereferenceable(24) %61)
  %63 = fcmp olt double %62, 0.000000e+00
  br i1 %63, label %64, label %67

; <label>:64                                      ; preds = %50
  %65 = bitcast %struct.Vec* %nl to i8*
  %66 = bitcast %struct.Vec* %n to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %65, i8* %66, i64 24, i32 8, i1 false)
  br label %68

; <label>:67                                      ; preds = %50
  call void @_ZNK3VecmlEd(%struct.Vec* sret %nl, %struct.Vec* %n, double -1.000000e+00)
  br label %68

; <label>:68                                      ; preds = %67, %64
  %69 = getelementptr inbounds %struct.Sphere* %53, i32 0, i32 3
  %70 = bitcast %struct.Vec* %f to i8*
  %71 = bitcast %struct.Vec* %69 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %70, i8* %71, i64 24, i32 8, i1 false)
  %72 = getelementptr inbounds %struct.Vec* %f, i32 0, i32 0
  %73 = load double* %72, align 8
  %74 = getelementptr inbounds %struct.Vec* %f, i32 0, i32 1
  %75 = load double* %74, align 8
  %76 = fcmp ogt double %73, %75
  br i1 %76, label %77, label %86

; <label>:77                                      ; preds = %68
  %78 = getelementptr inbounds %struct.Vec* %f, i32 0, i32 0
  %79 = load double* %78, align 8
  %80 = getelementptr inbounds %struct.Vec* %f, i32 0, i32 2
  %81 = load double* %80, align 8
  %82 = fcmp ogt double %79, %81
  br i1 %82, label %83, label %86

; <label>:83                                      ; preds = %77
  %84 = getelementptr inbounds %struct.Vec* %f, i32 0, i32 0
  %85 = load double* %84, align 8
  br label %100

; <label>:86                                      ; preds = %77, %68
  %87 = getelementptr inbounds %struct.Vec* %f, i32 0, i32 1
  %88 = load double* %87, align 8
  %89 = getelementptr inbounds %struct.Vec* %f, i32 0, i32 2
  %90 = load double* %89, align 8
  %91 = fcmp ogt double %88, %90
  br i1 %91, label %92, label %95

; <label>:92                                      ; preds = %86
  %93 = getelementptr inbounds %struct.Vec* %f, i32 0, i32 1
  %94 = load double* %93, align 8
  br label %98

; <label>:95                                      ; preds = %86
  %96 = getelementptr inbounds %struct.Vec* %f, i32 0, i32 2
  %97 = load double* %96, align 8
  br label %98

; <label>:98                                      ; preds = %95, %92
  %99 = phi double [ %94, %92 ], [ %97, %95 ]
  br label %100

; <label>:100                                     ; preds = %98, %83
  %101 = phi double [ %85, %83 ], [ %99, %98 ]
  %102 = add nsw i32 %depth, 1
  %103 = icmp sgt i32 %102, 5
  br i1 %103, label %104, label %116

; <label>:104                                     ; preds = %100
  %105 = call double @erand48(i16* %Xi) #3
  %106 = fcmp olt double %105, %101
  br i1 %106, label %107, label %111

; <label>:107                                     ; preds = %104
  %108 = fdiv double 1.000000e+00, %101
  call void @_ZNK3VecmlEd(%struct.Vec* sret %3, %struct.Vec* %f, double %108)
  %109 = bitcast %struct.Vec* %f to i8*
  %110 = bitcast %struct.Vec* %3 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %109, i8* %110, i64 24, i32 8, i1 false)
  br label %115

; <label>:111                                     ; preds = %104
  %112 = getelementptr inbounds %struct.Sphere* %53, i32 0, i32 2
  %113 = bitcast %struct.Vec* %agg.result to i8*
  %114 = bitcast %struct.Vec* %112 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %113, i8* %114, i64 24, i32 8, i1 false)
  br label %243

; <label>:115                                     ; preds = %107
  br label %116

; <label>:116                                     ; preds = %115, %100
  %117 = getelementptr inbounds %struct.Sphere* %53, i32 0, i32 4
  %118 = load i32* %117, align 4
  %119 = icmp eq i32 %118, 0
  br i1 %119, label %120, label %149

; <label>:120                                     ; preds = %116
  %121 = call double @erand48(i16* %Xi) #3
  %122 = fmul double 0x401921FB54442D18, %121
  %123 = call double @erand48(i16* %Xi) #3
  %124 = call double @sqrt(double %123) #3
  %125 = bitcast %struct.Vec* %w to i8*
  %126 = bitcast %struct.Vec* %nl to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %125, i8* %126, i64 24, i32 8, i1 false)
  %127 = getelementptr inbounds %struct.Vec* %w, i32 0, i32 0
  %128 = load double* %127, align 8
  %129 = call double @fabs(double %128) #7
  %130 = fcmp ogt double %129, 1.000000e-01
  br i1 %130, label %131, label %132

; <label>:131                                     ; preds = %120
  call void @_ZN3VecC2Eddd(%struct.Vec* %4, double 0.000000e+00, double 1.000000e+00, double 0.000000e+00)
  br label %133

; <label>:132                                     ; preds = %120
  call void @_ZN3VecC2Eddd(%struct.Vec* %4, double 1.000000e+00, double 0.000000e+00, double 0.000000e+00)
  br label %133

; <label>:133                                     ; preds = %132, %131
  call void @_ZN3VecrmERS_(%struct.Vec* sret %5, %struct.Vec* %4, %struct.Vec* dereferenceable(24) %w)
  %134 = call dereferenceable(24) %struct.Vec* @_ZN3Vec4normEv(%struct.Vec* %5)
  %135 = bitcast %struct.Vec* %u to i8*
  %136 = bitcast %struct.Vec* %134 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %135, i8* %136, i64 24, i32 8, i1 false)
  call void @_ZN3VecrmERS_(%struct.Vec* sret %v, %struct.Vec* %w, %struct.Vec* dereferenceable(24) %u)
  %137 = call double @cos(double %122) #3
  call void @_ZNK3VecmlEd(%struct.Vec* sret %6, %struct.Vec* %u, double %137)
  call void @_ZNK3VecmlEd(%struct.Vec* sret %7, %struct.Vec* %6, double %124)
  %138 = call double @sin(double %122) #3
  call void @_ZNK3VecmlEd(%struct.Vec* sret %9, %struct.Vec* %v, double %138)
  call void @_ZNK3VecmlEd(%struct.Vec* sret %8, %struct.Vec* %9, double %124)
  call void @_ZNK3VecplERKS_(%struct.Vec* sret %10, %struct.Vec* %7, %struct.Vec* dereferenceable(24) %8)
  %139 = fsub double 1.000000e+00, %123
  %140 = call double @sqrt(double %139) #3
  call void @_ZNK3VecmlEd(%struct.Vec* sret %11, %struct.Vec* %w, double %140)
  call void @_ZNK3VecplERKS_(%struct.Vec* sret %12, %struct.Vec* %10, %struct.Vec* dereferenceable(24) %11)
  %141 = call dereferenceable(24) %struct.Vec* @_ZN3Vec4normEv(%struct.Vec* %12)
  %142 = bitcast %struct.Vec* %d to i8*
  %143 = bitcast %struct.Vec* %141 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %142, i8* %143, i64 24, i32 8, i1 false)
  %144 = getelementptr inbounds %struct.Sphere* %53, i32 0, i32 2
  %145 = bitcast %struct.Vec* %16 to i8*
  %146 = bitcast %struct.Vec* %x to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %145, i8* %146, i64 24, i32 8, i1 false)
  %147 = bitcast %struct.Vec* %17 to i8*
  %148 = bitcast %struct.Vec* %d to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %147, i8* %148, i64 24, i32 8, i1 false)
  call void @_ZN3RayC2E3VecS0_(%struct.Ray* %15, %struct.Vec* byval align 8 %16, %struct.Vec* byval align 8 %17)
  call void @_Z8radianceRK3RayiPt(%struct.Vec* sret %14, %struct.Ray* dereferenceable(48) %15, i32 %102, i16* %Xi)
  call void @_ZNK3Vec4multERKS_(%struct.Vec* sret %13, %struct.Vec* %f, %struct.Vec* dereferenceable(24) %14)
  call void @_ZNK3VecplERKS_(%struct.Vec* sret %agg.result, %struct.Vec* %144, %struct.Vec* dereferenceable(24) %13)
  br label %243

; <label>:149                                     ; preds = %116
  %150 = getelementptr inbounds %struct.Sphere* %53, i32 0, i32 4
  %151 = load i32* %150, align 4
  %152 = icmp eq i32 %151, 1
  br i1 %152, label %153, label %160

; <label>:153                                     ; preds = %149
  %154 = getelementptr inbounds %struct.Sphere* %53, i32 0, i32 2
  %155 = bitcast %struct.Vec* %21 to i8*
  %156 = bitcast %struct.Vec* %x to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %155, i8* %156, i64 24, i32 8, i1 false)
  %157 = getelementptr inbounds %struct.Ray* %r, i32 0, i32 1
  call void @_ZNK3VecmlEd(%struct.Vec* sret %24, %struct.Vec* %n, double 2.000000e+00)
  %158 = getelementptr inbounds %struct.Ray* %r, i32 0, i32 1
  %159 = call double @_ZNK3Vec3dotERKS_(%struct.Vec* %n, %struct.Vec* dereferenceable(24) %158)
  call void @_ZNK3VecmlEd(%struct.Vec* sret %23, %struct.Vec* %24, double %159)
  call void @_ZNK3VecmiERKS_(%struct.Vec* sret %22, %struct.Vec* %157, %struct.Vec* dereferenceable(24) %23)
  call void @_ZN3RayC2E3VecS0_(%struct.Ray* %20, %struct.Vec* byval align 8 %21, %struct.Vec* byval align 8 %22)
  call void @_Z8radianceRK3RayiPt(%struct.Vec* sret %19, %struct.Ray* dereferenceable(48) %20, i32 %102, i16* %Xi)
  call void @_ZNK3Vec4multERKS_(%struct.Vec* sret %18, %struct.Vec* %f, %struct.Vec* dereferenceable(24) %19)
  call void @_ZNK3VecplERKS_(%struct.Vec* sret %agg.result, %struct.Vec* %154, %struct.Vec* dereferenceable(24) %18)
  br label %243

; <label>:160                                     ; preds = %149
  br label %161

; <label>:161                                     ; preds = %160
  %162 = bitcast %struct.Vec* %25 to i8*
  %163 = bitcast %struct.Vec* %x to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %162, i8* %163, i64 24, i32 8, i1 false)
  %164 = getelementptr inbounds %struct.Ray* %r, i32 0, i32 1
  call void @_ZNK3VecmlEd(%struct.Vec* sret %28, %struct.Vec* %n, double 2.000000e+00)
  %165 = getelementptr inbounds %struct.Ray* %r, i32 0, i32 1
  %166 = call double @_ZNK3Vec3dotERKS_(%struct.Vec* %n, %struct.Vec* dereferenceable(24) %165)
  call void @_ZNK3VecmlEd(%struct.Vec* sret %27, %struct.Vec* %28, double %166)
  call void @_ZNK3VecmiERKS_(%struct.Vec* sret %26, %struct.Vec* %164, %struct.Vec* dereferenceable(24) %27)
  call void @_ZN3RayC2E3VecS0_(%struct.Ray* %reflRay, %struct.Vec* byval align 8 %25, %struct.Vec* byval align 8 %26)
  %167 = call double @_ZNK3Vec3dotERKS_(%struct.Vec* %n, %struct.Vec* dereferenceable(24) %nl)
  %168 = fcmp ogt double %167, 0.000000e+00
  %169 = zext i1 %168 to i8
  %170 = trunc i8 %169 to i1
  br i1 %170, label %171, label %173

; <label>:171                                     ; preds = %161
  %172 = fdiv double 1.000000e+00, 1.500000e+00
  br label %175

; <label>:173                                     ; preds = %161
  %174 = fdiv double 1.500000e+00, 1.000000e+00
  br label %175

; <label>:175                                     ; preds = %173, %171
  %176 = phi double [ %172, %171 ], [ %174, %173 ]
  %177 = getelementptr inbounds %struct.Ray* %r, i32 0, i32 1
  %178 = call double @_ZNK3Vec3dotERKS_(%struct.Vec* %177, %struct.Vec* dereferenceable(24) %nl)
  %179 = fmul double %176, %176
  %180 = fmul double %178, %178
  %181 = fsub double 1.000000e+00, %180
  %182 = fmul double %179, %181
  %183 = fsub double 1.000000e+00, %182
  %184 = fcmp olt double %183, 0.000000e+00
  br i1 %184, label %185, label %187

; <label>:185                                     ; preds = %175
  %186 = getelementptr inbounds %struct.Sphere* %53, i32 0, i32 2
  call void @_Z8radianceRK3RayiPt(%struct.Vec* sret %30, %struct.Ray* dereferenceable(48) %reflRay, i32 %102, i16* %Xi)
  call void @_ZNK3Vec4multERKS_(%struct.Vec* sret %29, %struct.Vec* %f, %struct.Vec* dereferenceable(24) %30)
  call void @_ZNK3VecplERKS_(%struct.Vec* sret %agg.result, %struct.Vec* %186, %struct.Vec* dereferenceable(24) %29)
  br label %243

; <label>:187                                     ; preds = %175
  %188 = getelementptr inbounds %struct.Ray* %r, i32 0, i32 1
  call void @_ZNK3VecmlEd(%struct.Vec* sret %31, %struct.Vec* %188, double %176)
  %189 = trunc i8 %169 to i1
  %190 = select i1 %189, i32 1, i32 -1
  %191 = sitofp i32 %190 to double
  %192 = fmul double %178, %176
  %193 = call double @sqrt(double %183) #3
  %194 = fadd double %192, %193
  %195 = fmul double %191, %194
  call void @_ZNK3VecmlEd(%struct.Vec* sret %32, %struct.Vec* %n, double %195)
  call void @_ZNK3VecmiERKS_(%struct.Vec* sret %33, %struct.Vec* %31, %struct.Vec* dereferenceable(24) %32)
  %196 = call dereferenceable(24) %struct.Vec* @_ZN3Vec4normEv(%struct.Vec* %33)
  %197 = bitcast %struct.Vec* %tdir to i8*
  %198 = bitcast %struct.Vec* %196 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %197, i8* %198, i64 24, i32 8, i1 false)
  %199 = fsub double 1.500000e+00, 1.000000e+00
  %200 = fadd double 1.500000e+00, 1.000000e+00
  %201 = fmul double %199, %199
  %202 = fmul double %200, %200
  %203 = fdiv double %201, %202
  %204 = trunc i8 %169 to i1
  br i1 %204, label %205, label %207

; <label>:205                                     ; preds = %187
  %206 = fsub double -0.000000e+00, %178
  br label %209

; <label>:207                                     ; preds = %187
  %208 = call double @_ZNK3Vec3dotERKS_(%struct.Vec* %tdir, %struct.Vec* dereferenceable(24) %n)
  br label %209

; <label>:209                                     ; preds = %207, %205
  %210 = phi double [ %206, %205 ], [ %208, %207 ]
  %211 = fsub double 1.000000e+00, %210
  %212 = fsub double 1.000000e+00, %203
  %213 = fmul double %212, %211
  %214 = fmul double %213, %211
  %215 = fmul double %214, %211
  %216 = fmul double %215, %211
  %217 = fmul double %216, %211
  %218 = fadd double %203, %217
  %219 = fsub double 1.000000e+00, %218
  %220 = fmul double 5.000000e-01, %218
  %221 = fadd double 2.500000e-01, %220
  %222 = fdiv double %218, %221
  %223 = fsub double 1.000000e+00, %221
  %224 = fdiv double %219, %223
  %225 = getelementptr inbounds %struct.Sphere* %53, i32 0, i32 2
  %226 = icmp sgt i32 %102, 2
  br i1 %226, label %227, label %237

; <label>:227                                     ; preds = %209
  %228 = call double @erand48(i16* %Xi) #3
  %229 = fcmp olt double %228, %221
  br i1 %229, label %230, label %231

; <label>:230                                     ; preds = %227
  call void @_Z8radianceRK3RayiPt(%struct.Vec* sret %36, %struct.Ray* dereferenceable(48) %reflRay, i32 %102, i16* %Xi)
  call void @_ZNK3VecmlEd(%struct.Vec* sret %35, %struct.Vec* %36, double %222)
  br label %236

; <label>:231                                     ; preds = %227
  %232 = bitcast %struct.Vec* %38 to i8*
  %233 = bitcast %struct.Vec* %x to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %232, i8* %233, i64 24, i32 8, i1 false)
  %234 = bitcast %struct.Vec* %39 to i8*
  %235 = bitcast %struct.Vec* %tdir to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %234, i8* %235, i64 24, i32 8, i1 false)
  call void @_ZN3RayC2E3VecS0_(%struct.Ray* %37, %struct.Vec* byval align 8 %38, %struct.Vec* byval align 8 %39)
  call void @_Z8radianceRK3RayiPt(%struct.Vec* sret %40, %struct.Ray* dereferenceable(48) %37, i32 %102, i16* %Xi)
  call void @_ZNK3VecmlEd(%struct.Vec* sret %35, %struct.Vec* %40, double %224)
  br label %236

; <label>:236                                     ; preds = %231, %230
  br label %242

; <label>:237                                     ; preds = %209
  call void @_Z8radianceRK3RayiPt(%struct.Vec* sret %41, %struct.Ray* dereferenceable(48) %reflRay, i32 %102, i16* %Xi)
  call void @_ZNK3VecmlEd(%struct.Vec* sret %42, %struct.Vec* %41, double %218)
  %238 = bitcast %struct.Vec* %45 to i8*
  %239 = bitcast %struct.Vec* %x to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %238, i8* %239, i64 24, i32 8, i1 false)
  %240 = bitcast %struct.Vec* %46 to i8*
  %241 = bitcast %struct.Vec* %tdir to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %240, i8* %241, i64 24, i32 8, i1 false)
  call void @_ZN3RayC2E3VecS0_(%struct.Ray* %44, %struct.Vec* byval align 8 %45, %struct.Vec* byval align 8 %46)
  call void @_Z8radianceRK3RayiPt(%struct.Vec* sret %47, %struct.Ray* dereferenceable(48) %44, i32 %102, i16* %Xi)
  call void @_ZNK3VecmlEd(%struct.Vec* sret %43, %struct.Vec* %47, double %219)
  call void @_ZNK3VecplERKS_(%struct.Vec* sret %35, %struct.Vec* %42, %struct.Vec* dereferenceable(24) %43)
  br label %242

; <label>:242                                     ; preds = %237, %236
  call void @_ZNK3Vec4multERKS_(%struct.Vec* sret %34, %struct.Vec* %f, %struct.Vec* dereferenceable(24) %35)
  call void @_ZNK3VecplERKS_(%struct.Vec* sret %agg.result, %struct.Vec* %225, %struct.Vec* dereferenceable(24) %34)
  br label %243

; <label>:243                                     ; preds = %242, %185, %153, %133, %111, %49
  ret void
}

; Function Attrs: inlinehint uwtable
define linkonce_odr zeroext i1 @_Z9intersectRK3RayRdRi(%struct.Ray* dereferenceable(48) %r, double* dereferenceable(8) %t, i32* dereferenceable(4) %id) #2 {
  store double 1.000000e+20, double* %t, align 8
  %1 = fptosi double 9.000000e+00 to i32
  br label %2

; <label>:2                                       ; preds = %14, %0
  %i.0 = phi i32 [ %1, %0 ], [ %3, %14 ]
  %3 = add nsw i32 %i.0, -1
  %4 = icmp ne i32 %i.0, 0
  br i1 %4, label %5, label %15

; <label>:5                                       ; preds = %2
  %6 = sext i32 %3 to i64
  %7 = getelementptr inbounds [9 x %struct.Sphere]* @spheres, i32 0, i64 %6
  %8 = call double @_ZNK6Sphere9intersectERK3Ray(%struct.Sphere* %7, %struct.Ray* dereferenceable(48) %r)
  %9 = fcmp une double %8, 0.000000e+00
  br i1 %9, label %10, label %14

; <label>:10                                      ; preds = %5
  %11 = load double* %t, align 8
  %12 = fcmp olt double %8, %11
  br i1 %12, label %13, label %14

; <label>:13                                      ; preds = %10
  store double %8, double* %t, align 8
  store i32 %3, i32* %id, align 4
  br label %14

; <label>:14                                      ; preds = %13, %10, %5
  br label %2

; <label>:15                                      ; preds = %2
  %16 = load double* %t, align 8
  %17 = fcmp olt double %16, 1.000000e+20
  ret i1 %17
}

; Function Attrs: uwtable
define linkonce_odr void @_ZNK3VecplERKS_(%struct.Vec* noalias sret %agg.result, %struct.Vec* %this, %struct.Vec* dereferenceable(24) %b) #1 align 2 {
  %1 = getelementptr inbounds %struct.Vec* %this, i32 0, i32 0
  %2 = load double* %1, align 8
  %3 = getelementptr inbounds %struct.Vec* %b, i32 0, i32 0
  %4 = load double* %3, align 8
  %5 = fadd double %2, %4
  %6 = getelementptr inbounds %struct.Vec* %this, i32 0, i32 1
  %7 = load double* %6, align 8
  %8 = getelementptr inbounds %struct.Vec* %b, i32 0, i32 1
  %9 = load double* %8, align 8
  %10 = fadd double %7, %9
  %11 = getelementptr inbounds %struct.Vec* %this, i32 0, i32 2
  %12 = load double* %11, align 8
  %13 = getelementptr inbounds %struct.Vec* %b, i32 0, i32 2
  %14 = load double* %13, align 8
  %15 = fadd double %12, %14
  call void @_ZN3VecC2Eddd(%struct.Vec* %agg.result, double %5, double %10, double %15)
  ret void
}

; Function Attrs: uwtable
define linkonce_odr void @_ZNK3VecmiERKS_(%struct.Vec* noalias sret %agg.result, %struct.Vec* %this, %struct.Vec* dereferenceable(24) %b) #1 align 2 {
  %1 = getelementptr inbounds %struct.Vec* %this, i32 0, i32 0
  %2 = load double* %1, align 8
  %3 = getelementptr inbounds %struct.Vec* %b, i32 0, i32 0
  %4 = load double* %3, align 8
  %5 = fsub double %2, %4
  %6 = getelementptr inbounds %struct.Vec* %this, i32 0, i32 1
  %7 = load double* %6, align 8
  %8 = getelementptr inbounds %struct.Vec* %b, i32 0, i32 1
  %9 = load double* %8, align 8
  %10 = fsub double %7, %9
  %11 = getelementptr inbounds %struct.Vec* %this, i32 0, i32 2
  %12 = load double* %11, align 8
  %13 = getelementptr inbounds %struct.Vec* %b, i32 0, i32 2
  %14 = load double* %13, align 8
  %15 = fsub double %12, %14
  call void @_ZN3VecC2Eddd(%struct.Vec* %agg.result, double %5, double %10, double %15)
  ret void
}

; Function Attrs: uwtable
define linkonce_odr dereferenceable(24) %struct.Vec* @_ZN3Vec4normEv(%struct.Vec* %this) #1 align 2 {
  %1 = alloca %struct.Vec, align 8
  %2 = getelementptr inbounds %struct.Vec* %this, i32 0, i32 0
  %3 = load double* %2, align 8
  %4 = getelementptr inbounds %struct.Vec* %this, i32 0, i32 0
  %5 = load double* %4, align 8
  %6 = fmul double %3, %5
  %7 = getelementptr inbounds %struct.Vec* %this, i32 0, i32 1
  %8 = load double* %7, align 8
  %9 = getelementptr inbounds %struct.Vec* %this, i32 0, i32 1
  %10 = load double* %9, align 8
  %11 = fmul double %8, %10
  %12 = fadd double %6, %11
  %13 = getelementptr inbounds %struct.Vec* %this, i32 0, i32 2
  %14 = load double* %13, align 8
  %15 = getelementptr inbounds %struct.Vec* %this, i32 0, i32 2
  %16 = load double* %15, align 8
  %17 = fmul double %14, %16
  %18 = fadd double %12, %17
  %19 = call double @sqrt(double %18) #3
  %20 = fdiv double 1.000000e+00, %19
  call void @_ZNK3VecmlEd(%struct.Vec* sret %1, %struct.Vec* %this, double %20)
  %21 = bitcast %struct.Vec* %this to i8*
  %22 = bitcast %struct.Vec* %1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %21, i8* %22, i64 24, i32 8, i1 false)
  ret %struct.Vec* %this
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #3

; Function Attrs: nounwind uwtable
define linkonce_odr double @_ZNK3Vec3dotERKS_(%struct.Vec* %this, %struct.Vec* dereferenceable(24) %b) #0 align 2 {
  %1 = getelementptr inbounds %struct.Vec* %this, i32 0, i32 0
  %2 = load double* %1, align 8
  %3 = getelementptr inbounds %struct.Vec* %b, i32 0, i32 0
  %4 = load double* %3, align 8
  %5 = fmul double %2, %4
  %6 = getelementptr inbounds %struct.Vec* %this, i32 0, i32 1
  %7 = load double* %6, align 8
  %8 = getelementptr inbounds %struct.Vec* %b, i32 0, i32 1
  %9 = load double* %8, align 8
  %10 = fmul double %7, %9
  %11 = fadd double %5, %10
  %12 = getelementptr inbounds %struct.Vec* %this, i32 0, i32 2
  %13 = load double* %12, align 8
  %14 = getelementptr inbounds %struct.Vec* %b, i32 0, i32 2
  %15 = load double* %14, align 8
  %16 = fmul double %13, %15
  %17 = fadd double %11, %16
  ret double %17
}

; Function Attrs: nounwind
declare double @erand48(i16*) #4

; Function Attrs: nounwind
declare double @sqrt(double) #4

; Function Attrs: nounwind readnone
declare double @fabs(double) #5

; Function Attrs: uwtable
define linkonce_odr void @_ZN3VecrmERS_(%struct.Vec* noalias sret %agg.result, %struct.Vec* %this, %struct.Vec* dereferenceable(24) %b) #1 align 2 {
  %1 = getelementptr inbounds %struct.Vec* %this, i32 0, i32 1
  %2 = load double* %1, align 8
  %3 = getelementptr inbounds %struct.Vec* %b, i32 0, i32 2
  %4 = load double* %3, align 8
  %5 = fmul double %2, %4
  %6 = getelementptr inbounds %struct.Vec* %this, i32 0, i32 2
  %7 = load double* %6, align 8
  %8 = getelementptr inbounds %struct.Vec* %b, i32 0, i32 1
  %9 = load double* %8, align 8
  %10 = fmul double %7, %9
  %11 = fsub double %5, %10
  %12 = getelementptr inbounds %struct.Vec* %this, i32 0, i32 2
  %13 = load double* %12, align 8
  %14 = getelementptr inbounds %struct.Vec* %b, i32 0, i32 0
  %15 = load double* %14, align 8
  %16 = fmul double %13, %15
  %17 = getelementptr inbounds %struct.Vec* %this, i32 0, i32 0
  %18 = load double* %17, align 8
  %19 = getelementptr inbounds %struct.Vec* %b, i32 0, i32 2
  %20 = load double* %19, align 8
  %21 = fmul double %18, %20
  %22 = fsub double %16, %21
  %23 = getelementptr inbounds %struct.Vec* %this, i32 0, i32 0
  %24 = load double* %23, align 8
  %25 = getelementptr inbounds %struct.Vec* %b, i32 0, i32 1
  %26 = load double* %25, align 8
  %27 = fmul double %24, %26
  %28 = getelementptr inbounds %struct.Vec* %this, i32 0, i32 1
  %29 = load double* %28, align 8
  %30 = getelementptr inbounds %struct.Vec* %b, i32 0, i32 0
  %31 = load double* %30, align 8
  %32 = fmul double %29, %31
  %33 = fsub double %27, %32
  call void @_ZN3VecC2Eddd(%struct.Vec* %agg.result, double %11, double %22, double %33)
  ret void
}

; Function Attrs: nounwind
declare double @cos(double) #4

; Function Attrs: nounwind
declare double @sin(double) #4

; Function Attrs: uwtable
define linkonce_odr void @_ZNK3Vec4multERKS_(%struct.Vec* noalias sret %agg.result, %struct.Vec* %this, %struct.Vec* dereferenceable(24) %b) #1 align 2 {
  %1 = getelementptr inbounds %struct.Vec* %this, i32 0, i32 0
  %2 = load double* %1, align 8
  %3 = getelementptr inbounds %struct.Vec* %b, i32 0, i32 0
  %4 = load double* %3, align 8
  %5 = fmul double %2, %4
  %6 = getelementptr inbounds %struct.Vec* %this, i32 0, i32 1
  %7 = load double* %6, align 8
  %8 = getelementptr inbounds %struct.Vec* %b, i32 0, i32 1
  %9 = load double* %8, align 8
  %10 = fmul double %7, %9
  %11 = getelementptr inbounds %struct.Vec* %this, i32 0, i32 2
  %12 = load double* %11, align 8
  %13 = getelementptr inbounds %struct.Vec* %b, i32 0, i32 2
  %14 = load double* %13, align 8
  %15 = fmul double %12, %14
  call void @_ZN3VecC2Eddd(%struct.Vec* %agg.result, double %5, double %10, double %15)
  ret void
}

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN3RayC2E3VecS0_(%struct.Ray* %this, %struct.Vec* byval align 8 %o_, %struct.Vec* byval align 8 %d_) unnamed_addr #0 align 2 {
  %1 = getelementptr inbounds %struct.Ray* %this, i32 0, i32 0
  %2 = bitcast %struct.Vec* %1 to i8*
  %3 = bitcast %struct.Vec* %o_ to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* %3, i64 24, i32 8, i1 false)
  %4 = getelementptr inbounds %struct.Ray* %this, i32 0, i32 1
  %5 = bitcast %struct.Vec* %4 to i8*
  %6 = bitcast %struct.Vec* %d_ to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %5, i8* %6, i64 24, i32 8, i1 false)
  ret void
}

; Function Attrs: uwtable
define i32 @main(i32 %argc, i8** %argv) #1 {
  %cam = alloca %struct.Ray, align 8
  %1 = alloca %struct.Vec, align 8
  %2 = alloca %struct.Vec, align 8
  %3 = alloca %struct.Vec, align 8
  %cx = alloca %struct.Vec, align 8
  %cy = alloca %struct.Vec, align 8
  %4 = alloca %struct.Vec, align 8
  %r = alloca %struct.Vec, align 8
  %Xi = alloca [3 x i16], align 2
  %d = alloca %struct.Vec, align 8
  %5 = alloca %struct.Vec, align 8
  %6 = alloca %struct.Vec, align 8
  %7 = alloca %struct.Vec, align 8
  %8 = alloca %struct.Vec, align 8
  %9 = alloca %struct.Vec, align 8
  %10 = alloca %struct.Ray, align 8
  %11 = alloca %struct.Vec, align 8
  %12 = alloca %struct.Vec, align 8
  %13 = alloca %struct.Vec, align 8
  %14 = alloca %struct.Vec, align 8
  %15 = alloca %struct.Vec, align 8
  %16 = alloca %struct.Vec, align 8
  %17 = alloca %struct.Vec, align 8
  %18 = alloca %struct.Vec, align 8
  %19 = icmp eq i32 %argc, 2
  br i1 %19, label %20, label %25

; <label>:20                                      ; preds = %0
  %21 = getelementptr inbounds i8** %argv, i64 1
  %22 = load i8** %21, align 8
  %23 = call i32 @atoi(i8* %22) #12
  %24 = sdiv i32 %23, 4
  br label %26

; <label>:25                                      ; preds = %0
  br label %26

; <label>:26                                      ; preds = %25, %20
  %27 = phi i32 [ %24, %20 ], [ 1, %25 ]
  %28 = call i64 @time(i64* null) #3
  call void @_ZN3VecC2Eddd(%struct.Vec* %1, double 5.000000e+01, double 5.200000e+01, double 2.956000e+02)
  call void @_ZN3VecC2Eddd(%struct.Vec* %3, double 0.000000e+00, double -4.261200e-02, double -1.000000e+00)
  %29 = call dereferenceable(24) %struct.Vec* @_ZN3Vec4normEv(%struct.Vec* %3)
  %30 = bitcast %struct.Vec* %2 to i8*
  %31 = bitcast %struct.Vec* %29 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %30, i8* %31, i64 24, i32 8, i1 false)
  call void @_ZN3RayC2E3VecS0_(%struct.Ray* %cam, %struct.Vec* byval align 8 %1, %struct.Vec* byval align 8 %2)
  %32 = sitofp i32 1024 to double
  %33 = fmul double %32, 5.135000e-01
  %34 = sitofp i32 768 to double
  %35 = fdiv double %33, %34
  call void @_ZN3VecC2Eddd(%struct.Vec* %cx, double %35, double 0.000000e+00, double 0.000000e+00)
  %36 = getelementptr inbounds %struct.Ray* %cam, i32 0, i32 1
  call void @_ZN3VecrmERS_(%struct.Vec* sret %4, %struct.Vec* %cx, %struct.Vec* dereferenceable(24) %36)
  %37 = call dereferenceable(24) %struct.Vec* @_ZN3Vec4normEv(%struct.Vec* %4)
  call void @_ZNK3VecmlEd(%struct.Vec* sret %cy, %struct.Vec* %37, double 5.135000e-01)
  call void @_ZN3VecC2Eddd(%struct.Vec* %r, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00)
  %38 = mul nsw i32 1024, 768
  %39 = sext i32 %38 to i64
  %40 = call { i64, i1 } @llvm.umul.with.overflow.i64(i64 %39, i64 24)
  %41 = extractvalue { i64, i1 } %40, 1
  %42 = extractvalue { i64, i1 } %40, 0
  %43 = select i1 %41, i64 -1, i64 %42
  %44 = call noalias i8* @_Znam(i64 %43) #13
  %45 = bitcast i8* %44 to %struct.Vec*
  %46 = icmp eq i64 %39, 0
  br i1 %46, label %54, label %47

; <label>:47                                      ; preds = %26
  %48 = getelementptr inbounds %struct.Vec* %45, i64 %39
  br label %49

; <label>:49                                      ; preds = %51, %47
  %50 = phi %struct.Vec* [ %45, %47 ], [ %52, %51 ]
  invoke void @_ZN3VecC2Eddd(%struct.Vec* %50, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00)
          to label %51 unwind label %147

; <label>:51                                      ; preds = %49
  %52 = getelementptr inbounds %struct.Vec* %50, i64 1
  %53 = icmp eq %struct.Vec* %52, %48
  br i1 %53, label %54, label %49

; <label>:54                                      ; preds = %51, %26
  br label %55

; <label>:55                                      ; preds = %178, %54
  %y.0 = phi i32 [ 0, %54 ], [ %179, %178 ]
  %56 = icmp slt i32 %y.0, 768
  br i1 %56, label %57, label %180

; <label>:57                                      ; preds = %55
  %58 = load %struct._IO_FILE** @stderr, align 8
  %59 = mul nsw i32 %27, 4
  %60 = sitofp i32 %y.0 to double
  %61 = fmul double 1.000000e+02, %60
  %62 = sub nsw i32 768, 1
  %63 = sitofp i32 %62 to double
  %64 = fdiv double %61, %63
  %65 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %58, i8* getelementptr inbounds ([28 x i8]* @.str, i32 0, i32 0), i32 %59, double %64)
  %66 = getelementptr inbounds [3 x i16]* %Xi, i64 0, i64 0
  store i16 0, i16* %66
  %67 = getelementptr inbounds i16* %66, i64 1
  store i16 0, i16* %67
  %68 = getelementptr inbounds i16* %67, i64 1
  %69 = mul nsw i32 %y.0, %y.0
  %70 = mul nsw i32 %69, %y.0
  %71 = trunc i32 %70 to i16
  store i16 %71, i16* %68
  br label %72

; <label>:72                                      ; preds = %175, %57
  %x.0 = phi i16 [ 0, %57 ], [ %176, %175 ]
  %73 = zext i16 %x.0 to i32
  %74 = icmp slt i32 %73, 1024
  br i1 %74, label %75, label %177

; <label>:75                                      ; preds = %72
  %76 = sub nsw i32 768, %y.0
  %77 = sub nsw i32 %76, 1
  %78 = mul nsw i32 %77, 1024
  %79 = zext i16 %x.0 to i32
  %80 = add nsw i32 %78, %79
  br label %81

; <label>:81                                      ; preds = %172, %75
  %sy.0 = phi i32 [ 0, %75 ], [ %173, %172 ]
  %82 = icmp slt i32 %sy.0, 2
  br i1 %82, label %83, label %174

; <label>:83                                      ; preds = %81
  br label %84

; <label>:84                                      ; preds = %167, %83
  %sx.0 = phi i32 [ 0, %83 ], [ %168, %167 ]
  %85 = icmp slt i32 %sx.0, 2
  br i1 %85, label %86, label %171

; <label>:86                                      ; preds = %84
  br label %87

; <label>:87                                      ; preds = %145, %86
  %s.0 = phi i32 [ 0, %86 ], [ %146, %145 ]
  %88 = icmp slt i32 %s.0, %27
  br i1 %88, label %89, label %151

; <label>:89                                      ; preds = %87
  %90 = getelementptr inbounds [3 x i16]* %Xi, i32 0, i32 0
  %91 = call double @erand48(i16* %90) #3
  %92 = fmul double 2.000000e+00, %91
  %93 = fcmp olt double %92, 1.000000e+00
  br i1 %93, label %94, label %97

; <label>:94                                      ; preds = %89
  %95 = call double @sqrt(double %92) #3
  %96 = fsub double %95, 1.000000e+00
  br label %101

; <label>:97                                      ; preds = %89
  %98 = fsub double 2.000000e+00, %92
  %99 = call double @sqrt(double %98) #3
  %100 = fsub double 1.000000e+00, %99
  br label %101

; <label>:101                                     ; preds = %97, %94
  %102 = phi double [ %96, %94 ], [ %100, %97 ]
  %103 = getelementptr inbounds [3 x i16]* %Xi, i32 0, i32 0
  %104 = call double @erand48(i16* %103) #3
  %105 = fmul double 2.000000e+00, %104
  %106 = fcmp olt double %105, 1.000000e+00
  br i1 %106, label %107, label %110

; <label>:107                                     ; preds = %101
  %108 = call double @sqrt(double %105) #3
  %109 = fsub double %108, 1.000000e+00
  br label %114

; <label>:110                                     ; preds = %101
  %111 = fsub double 2.000000e+00, %105
  %112 = call double @sqrt(double %111) #3
  %113 = fsub double 1.000000e+00, %112
  br label %114

; <label>:114                                     ; preds = %110, %107
  %115 = phi double [ %109, %107 ], [ %113, %110 ]
  %116 = sitofp i32 %sx.0 to double
  %117 = fadd double %116, 5.000000e-01
  %118 = fadd double %117, %102
  %119 = fdiv double %118, 2.000000e+00
  %120 = zext i16 %x.0 to i32
  %121 = sitofp i32 %120 to double
  %122 = fadd double %119, %121
  %123 = sitofp i32 1024 to double
  %124 = fdiv double %122, %123
  %125 = fsub double %124, 5.000000e-01
  call void @_ZNK3VecmlEd(%struct.Vec* sret %5, %struct.Vec* %cx, double %125)
  %126 = sitofp i32 %sy.0 to double
  %127 = fadd double %126, 5.000000e-01
  %128 = fadd double %127, %115
  %129 = fdiv double %128, 2.000000e+00
  %130 = sitofp i32 %y.0 to double
  %131 = fadd double %129, %130
  %132 = sitofp i32 768 to double
  %133 = fdiv double %131, %132
  %134 = fsub double %133, 5.000000e-01
  call void @_ZNK3VecmlEd(%struct.Vec* sret %6, %struct.Vec* %cy, double %134)
  call void @_ZNK3VecplERKS_(%struct.Vec* sret %7, %struct.Vec* %5, %struct.Vec* dereferenceable(24) %6)
  %135 = getelementptr inbounds %struct.Ray* %cam, i32 0, i32 1
  call void @_ZNK3VecplERKS_(%struct.Vec* sret %d, %struct.Vec* %7, %struct.Vec* dereferenceable(24) %135)
  %136 = getelementptr inbounds %struct.Ray* %cam, i32 0, i32 0
  call void @_ZNK3VecmlEd(%struct.Vec* sret %12, %struct.Vec* %d, double 1.400000e+02)
  call void @_ZNK3VecplERKS_(%struct.Vec* sret %11, %struct.Vec* %136, %struct.Vec* dereferenceable(24) %12)
  %137 = call dereferenceable(24) %struct.Vec* @_ZN3Vec4normEv(%struct.Vec* %d)
  %138 = bitcast %struct.Vec* %13 to i8*
  %139 = bitcast %struct.Vec* %137 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %138, i8* %139, i64 24, i32 8, i1 false)
  call void @_ZN3RayC2E3VecS0_(%struct.Ray* %10, %struct.Vec* byval align 8 %11, %struct.Vec* byval align 8 %13)
  %140 = getelementptr inbounds [3 x i16]* %Xi, i32 0, i32 0
  call void @_Z8radianceRK3RayiPt(%struct.Vec* sret %14, %struct.Ray* dereferenceable(48) %10, i32 0, i16* %140)
  %141 = sitofp i32 %27 to double
  %142 = fdiv double 1.000000e+00, %141
  call void @_ZNK3VecmlEd(%struct.Vec* sret %9, %struct.Vec* %14, double %142)
  call void @_ZNK3VecplERKS_(%struct.Vec* sret %8, %struct.Vec* %r, %struct.Vec* dereferenceable(24) %9)
  %143 = bitcast %struct.Vec* %r to i8*
  %144 = bitcast %struct.Vec* %8 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %143, i8* %144, i64 24, i32 8, i1 false)
  br label %145

; <label>:145                                     ; preds = %114
  %146 = add nsw i32 %s.0, 1
  br label %87

; <label>:147                                     ; preds = %49
  %148 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
  %149 = extractvalue { i8*, i32 } %148, 0
  %150 = extractvalue { i8*, i32 } %148, 1
  call void @_ZdaPv(i8* %44) #14
  br label %210

; <label>:151                                     ; preds = %87
  %152 = sext i32 %80 to i64
  %153 = getelementptr inbounds %struct.Vec* %45, i64 %152
  %154 = sext i32 %80 to i64
  %155 = getelementptr inbounds %struct.Vec* %45, i64 %154
  %156 = getelementptr inbounds %struct.Vec* %r, i32 0, i32 0
  %157 = load double* %156, align 8
  %158 = call double @_Z5clampd(double %157)
  %159 = getelementptr inbounds %struct.Vec* %r, i32 0, i32 1
  %160 = load double* %159, align 8
  %161 = call double @_Z5clampd(double %160)
  %162 = getelementptr inbounds %struct.Vec* %r, i32 0, i32 2
  %163 = load double* %162, align 8
  %164 = call double @_Z5clampd(double %163)
  call void @_ZN3VecC2Eddd(%struct.Vec* %17, double %158, double %161, double %164)
  call void @_ZNK3VecmlEd(%struct.Vec* sret %16, %struct.Vec* %17, double 2.500000e-01)
  call void @_ZNK3VecplERKS_(%struct.Vec* sret %15, %struct.Vec* %155, %struct.Vec* dereferenceable(24) %16)
  %165 = bitcast %struct.Vec* %153 to i8*
  %166 = bitcast %struct.Vec* %15 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %165, i8* %166, i64 24, i32 8, i1 false)
  br label %167

; <label>:167                                     ; preds = %151
  %168 = add nsw i32 %sx.0, 1
  call void @_ZN3VecC2Eddd(%struct.Vec* %18, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00)
  %169 = bitcast %struct.Vec* %r to i8*
  %170 = bitcast %struct.Vec* %18 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %169, i8* %170, i64 24, i32 8, i1 false)
  br label %84

; <label>:171                                     ; preds = %84
  br label %172

; <label>:172                                     ; preds = %171
  %173 = add nsw i32 %sy.0, 1
  br label %81

; <label>:174                                     ; preds = %81
  br label %175

; <label>:175                                     ; preds = %174
  %176 = add i16 %x.0, 1
  br label %72

; <label>:177                                     ; preds = %72
  br label %178

; <label>:178                                     ; preds = %177
  %179 = add nsw i32 %y.0, 1
  br label %55

; <label>:180                                     ; preds = %55
  %181 = call i64 @time(i64* null) #3
  %182 = load %struct._IO_FILE** @stdout, align 8
  %183 = call double @difftime(i64 %181, i64 %28) #7
  %184 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %182, i8* getelementptr inbounds ([29 x i8]* @.str1, i32 0, i32 0), double %183)
  %185 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([10 x i8]* @.str2, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @.str3, i32 0, i32 0))
  %186 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %185, i8* getelementptr inbounds ([13 x i8]* @.str4, i32 0, i32 0), i32 1024, i32 768, i32 255)
  br label %187

; <label>:187                                     ; preds = %207, %180
  %i1.0 = phi i32 [ 0, %180 ], [ %208, %207 ]
  %188 = mul nsw i32 1024, 768
  %189 = icmp slt i32 %i1.0, %188
  br i1 %189, label %190, label %209

; <label>:190                                     ; preds = %187
  %191 = sext i32 %i1.0 to i64
  %192 = getelementptr inbounds %struct.Vec* %45, i64 %191
  %193 = getelementptr inbounds %struct.Vec* %192, i32 0, i32 0
  %194 = load double* %193, align 8
  %195 = call i32 @_Z5toIntd(double %194)
  %196 = sext i32 %i1.0 to i64
  %197 = getelementptr inbounds %struct.Vec* %45, i64 %196
  %198 = getelementptr inbounds %struct.Vec* %197, i32 0, i32 1
  %199 = load double* %198, align 8
  %200 = call i32 @_Z5toIntd(double %199)
  %201 = sext i32 %i1.0 to i64
  %202 = getelementptr inbounds %struct.Vec* %45, i64 %201
  %203 = getelementptr inbounds %struct.Vec* %202, i32 0, i32 2
  %204 = load double* %203, align 8
  %205 = call i32 @_Z5toIntd(double %204)
  %206 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %185, i8* getelementptr inbounds ([10 x i8]* @.str5, i32 0, i32 0), i32 %195, i32 %200, i32 %205)
  br label %207

; <label>:207                                     ; preds = %190
  %208 = add nsw i32 %i1.0, 1
  br label %187

; <label>:209                                     ; preds = %187
  ret i32 0

; <label>:210                                     ; preds = %147
  %211 = insertvalue { i8*, i32 } undef, i8* %149, 0
  %212 = insertvalue { i8*, i32 } %211, i32 %150, 1
  resume { i8*, i32 } %212
}

; Function Attrs: nounwind readonly
declare i32 @atoi(i8*) #6

; Function Attrs: nounwind
declare i64 @time(i64*) #4

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.umul.with.overflow.i64(i64, i64) #7

; Function Attrs: nobuiltin
declare noalias i8* @_Znam(i64) #8

declare i32 @__gxx_personality_v0(...)

; Function Attrs: nobuiltin nounwind
declare void @_ZdaPv(i8*) #9

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #10

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr double @_Z5clampd(double %x) #11 {
  %1 = fcmp olt double %x, 0.000000e+00
  br i1 %1, label %2, label %3

; <label>:2                                       ; preds = %0
  br label %9

; <label>:3                                       ; preds = %0
  %4 = fcmp ogt double %x, 1.000000e+00
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %3
  br label %7

; <label>:6                                       ; preds = %3
  br label %7

; <label>:7                                       ; preds = %6, %5
  %8 = phi double [ 1.000000e+00, %5 ], [ %x, %6 ]
  br label %9

; <label>:9                                       ; preds = %7, %2
  %10 = phi double [ 0.000000e+00, %2 ], [ %8, %7 ]
  ret double %10
}

; Function Attrs: nounwind readnone
declare double @difftime(i64, i64) #5

declare %struct._IO_FILE* @fopen(i8*, i8*) #10

; Function Attrs: inlinehint uwtable
define linkonce_odr i32 @_Z5toIntd(double %x) #2 {
  %1 = call double @_Z5clampd(double %x)
  %2 = call double @pow(double %1, double 0x3FDD1745D1745D17) #3
  %3 = fmul double %2, 2.550000e+02
  %4 = fadd double %3, 5.000000e-01
  %5 = fptosi double %4 to i32
  ret i32 %5
}

; Function Attrs: nounwind
declare double @pow(double, double) #4

; Function Attrs: uwtable
define linkonce_odr double @_ZNK6Sphere9intersectERK3Ray(%struct.Sphere* %this, %struct.Ray* dereferenceable(48) %r) #1 align 2 {
  %op = alloca %struct.Vec, align 8
  %1 = getelementptr inbounds %struct.Sphere* %this, i32 0, i32 1
  %2 = getelementptr inbounds %struct.Ray* %r, i32 0, i32 0
  call void @_ZNK3VecmiERKS_(%struct.Vec* sret %op, %struct.Vec* %1, %struct.Vec* dereferenceable(24) %2)
  %3 = getelementptr inbounds %struct.Ray* %r, i32 0, i32 1
  %4 = call double @_ZNK3Vec3dotERKS_(%struct.Vec* %op, %struct.Vec* dereferenceable(24) %3)
  %5 = fmul double %4, %4
  %6 = call double @_ZNK3Vec3dotERKS_(%struct.Vec* %op, %struct.Vec* dereferenceable(24) %op)
  %7 = fsub double %5, %6
  %8 = getelementptr inbounds %struct.Sphere* %this, i32 0, i32 0
  %9 = load double* %8, align 8
  %10 = getelementptr inbounds %struct.Sphere* %this, i32 0, i32 0
  %11 = load double* %10, align 8
  %12 = fmul double %9, %11
  %13 = fadd double %7, %12
  %14 = fcmp olt double %13, 0.000000e+00
  br i1 %14, label %15, label %16

; <label>:15                                      ; preds = %0
  br label %31

; <label>:16                                      ; preds = %0
  %17 = call double @sqrt(double %13) #3
  br label %18

; <label>:18                                      ; preds = %16
  %19 = fsub double %4, %17
  %20 = fcmp ogt double %19, 1.000000e-04
  br i1 %20, label %21, label %22

; <label>:21                                      ; preds = %18
  br label %29

; <label>:22                                      ; preds = %18
  %23 = fadd double %4, %17
  %24 = fcmp ogt double %23, 1.000000e-04
  br i1 %24, label %25, label %26

; <label>:25                                      ; preds = %22
  br label %27

; <label>:26                                      ; preds = %22
  br label %27

; <label>:27                                      ; preds = %26, %25
  %28 = phi double [ %23, %25 ], [ 0.000000e+00, %26 ]
  br label %29

; <label>:29                                      ; preds = %27, %21
  %30 = phi double [ %19, %21 ], [ %28, %27 ]
  br label %31

; <label>:31                                      ; preds = %29, %15
  %.0 = phi double [ 0.000000e+00, %15 ], [ %30, %29 ]
  ret double %.0
}

define internal void @_GLOBAL__sub_I_smallpt.cpp() section ".text.startup" {
  call void @__cxx_global_var_init()
  ret void
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { inlinehint uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readnone "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind readnone }
attributes #8 = { nobuiltin "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #9 = { nobuiltin nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #10 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #11 = { inlinehint nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #12 = { nounwind readonly }
attributes #13 = { builtin }
attributes #14 = { builtin nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
