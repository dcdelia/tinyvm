; ModuleID = 'smallpt.cpp'
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
  %1 = alloca %struct.Vec*, align 8
  %2 = alloca double, align 8
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  store %struct.Vec* %this, %struct.Vec** %1, align 8
  store double %x_, double* %2, align 8
  store double %y_, double* %3, align 8
  store double %z_, double* %4, align 8
  %5 = load %struct.Vec** %1
  %6 = load double* %2, align 8
  %7 = getelementptr inbounds %struct.Vec* %5, i32 0, i32 0
  store double %6, double* %7, align 8
  %8 = load double* %3, align 8
  %9 = getelementptr inbounds %struct.Vec* %5, i32 0, i32 1
  store double %8, double* %9, align 8
  %10 = load double* %4, align 8
  %11 = getelementptr inbounds %struct.Vec* %5, i32 0, i32 2
  store double %10, double* %11, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN6SphereC2Ed3VecS0_S0_6Refl_t(%struct.Sphere* %this, double %rad_, %struct.Vec* byval align 8 %p_, %struct.Vec* byval align 8 %e_, %struct.Vec* byval align 8 %c_, i32 %refl_) unnamed_addr #0 align 2 {
  %1 = alloca %struct.Sphere*, align 8
  %2 = alloca double, align 8
  %3 = alloca i32, align 4
  store %struct.Sphere* %this, %struct.Sphere** %1, align 8
  store double %rad_, double* %2, align 8
  store i32 %refl_, i32* %3, align 4
  %4 = load %struct.Sphere** %1
  %5 = getelementptr inbounds %struct.Sphere* %4, i32 0, i32 0
  %6 = load double* %2, align 8
  store double %6, double* %5, align 8
  %7 = getelementptr inbounds %struct.Sphere* %4, i32 0, i32 1
  %8 = bitcast %struct.Vec* %7 to i8*
  %9 = bitcast %struct.Vec* %p_ to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %8, i8* %9, i64 24, i32 8, i1 false)
  %10 = getelementptr inbounds %struct.Sphere* %4, i32 0, i32 2
  %11 = bitcast %struct.Vec* %10 to i8*
  %12 = bitcast %struct.Vec* %e_ to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %11, i8* %12, i64 24, i32 8, i1 false)
  %13 = getelementptr inbounds %struct.Sphere* %4, i32 0, i32 3
  %14 = bitcast %struct.Vec* %13 to i8*
  %15 = bitcast %struct.Vec* %c_ to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %14, i8* %15, i64 24, i32 8, i1 false)
  %16 = getelementptr inbounds %struct.Sphere* %4, i32 0, i32 4
  %17 = load i32* %3, align 4
  store i32 %17, i32* %16, align 4
  ret void
}

; Function Attrs: uwtable
define linkonce_odr void @_ZNK3VecmlEd(%struct.Vec* noalias sret %agg.result, %struct.Vec* %this, double %b) #1 align 2 {
  %1 = alloca %struct.Vec*, align 8
  %2 = alloca double, align 8
  store %struct.Vec* %this, %struct.Vec** %1, align 8
  store double %b, double* %2, align 8
  %3 = load %struct.Vec** %1
  %4 = getelementptr inbounds %struct.Vec* %3, i32 0, i32 0
  %5 = load double* %4, align 8
  %6 = load double* %2, align 8
  %7 = fmul double %5, %6
  %8 = getelementptr inbounds %struct.Vec* %3, i32 0, i32 1
  %9 = load double* %8, align 8
  %10 = load double* %2, align 8
  %11 = fmul double %9, %10
  %12 = getelementptr inbounds %struct.Vec* %3, i32 0, i32 2
  %13 = load double* %12, align 8
  %14 = load double* %2, align 8
  %15 = fmul double %13, %14
  call void @_ZN3VecC2Eddd(%struct.Vec* %agg.result, double %7, double %11, double %15)
  ret void
}

; Function Attrs: uwtable
define void @_Z8radianceRK3RayiPt(%struct.Vec* noalias sret %agg.result, %struct.Ray* dereferenceable(48) %r, i32 %depth, i16* %Xi) #1 {
  %1 = alloca %struct.Ray*, align 8
  %2 = alloca i32, align 4
  %3 = alloca i16*, align 8
  %t = alloca double, align 8
  %id = alloca i32, align 4
  %obj = alloca %struct.Sphere*, align 8
  %x = alloca %struct.Vec, align 8
  %4 = alloca %struct.Vec, align 8
  %n = alloca %struct.Vec, align 8
  %5 = alloca %struct.Vec, align 8
  %nl = alloca %struct.Vec, align 8
  %f = alloca %struct.Vec, align 8
  %p = alloca double, align 8
  %6 = alloca %struct.Vec, align 8
  %r1 = alloca double, align 8
  %r2 = alloca double, align 8
  %r2s = alloca double, align 8
  %w = alloca %struct.Vec, align 8
  %u = alloca %struct.Vec, align 8
  %7 = alloca %struct.Vec, align 8
  %8 = alloca %struct.Vec, align 8
  %v = alloca %struct.Vec, align 8
  %d = alloca %struct.Vec, align 8
  %9 = alloca %struct.Vec, align 8
  %10 = alloca %struct.Vec, align 8
  %11 = alloca %struct.Vec, align 8
  %12 = alloca %struct.Vec, align 8
  %13 = alloca %struct.Vec, align 8
  %14 = alloca %struct.Vec, align 8
  %15 = alloca %struct.Vec, align 8
  %16 = alloca %struct.Vec, align 8
  %17 = alloca %struct.Vec, align 8
  %18 = alloca %struct.Ray, align 8
  %19 = alloca %struct.Vec, align 8
  %20 = alloca %struct.Vec, align 8
  %21 = alloca %struct.Vec, align 8
  %22 = alloca %struct.Vec, align 8
  %23 = alloca %struct.Ray, align 8
  %24 = alloca %struct.Vec, align 8
  %25 = alloca %struct.Vec, align 8
  %26 = alloca %struct.Vec, align 8
  %27 = alloca %struct.Vec, align 8
  %reflRay = alloca %struct.Ray, align 8
  %28 = alloca %struct.Vec, align 8
  %29 = alloca %struct.Vec, align 8
  %30 = alloca %struct.Vec, align 8
  %31 = alloca %struct.Vec, align 8
  %into = alloca i8, align 1
  %nc = alloca double, align 8
  %nt = alloca double, align 8
  %nnt = alloca double, align 8
  %ddn = alloca double, align 8
  %cos2t = alloca double, align 8
  %32 = alloca %struct.Vec, align 8
  %33 = alloca %struct.Vec, align 8
  %tdir = alloca %struct.Vec, align 8
  %34 = alloca %struct.Vec, align 8
  %35 = alloca %struct.Vec, align 8
  %36 = alloca %struct.Vec, align 8
  %a = alloca double, align 8
  %b = alloca double, align 8
  %R0 = alloca double, align 8
  %c = alloca double, align 8
  %Re = alloca double, align 8
  %Tr = alloca double, align 8
  %P = alloca double, align 8
  %RP = alloca double, align 8
  %TP = alloca double, align 8
  %37 = alloca %struct.Vec, align 8
  %38 = alloca %struct.Vec, align 8
  %39 = alloca %struct.Vec, align 8
  %40 = alloca %struct.Ray, align 8
  %41 = alloca %struct.Vec, align 8
  %42 = alloca %struct.Vec, align 8
  %43 = alloca %struct.Vec, align 8
  %44 = alloca %struct.Vec, align 8
  %45 = alloca %struct.Vec, align 8
  %46 = alloca %struct.Vec, align 8
  %47 = alloca %struct.Ray, align 8
  %48 = alloca %struct.Vec, align 8
  %49 = alloca %struct.Vec, align 8
  %50 = alloca %struct.Vec, align 8
  store %struct.Ray* %r, %struct.Ray** %1, align 8
  store i32 %depth, i32* %2, align 4
  store i16* %Xi, i16** %3, align 8
  store i32 0, i32* %id, align 4
  %51 = load %struct.Ray** %1, align 8
  %52 = call zeroext i1 @_Z9intersectRK3RayRdRi(%struct.Ray* dereferenceable(48) %51, double* dereferenceable(8) %t, i32* dereferenceable(4) %id)
  br i1 %52, label %54, label %53

; <label>:53                                      ; preds = %0
  call void @_ZN3VecC2Eddd(%struct.Vec* %agg.result, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00)
  br label %335

; <label>:54                                      ; preds = %0
  %55 = load i32* %id, align 4
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds [9 x %struct.Sphere]* @spheres, i32 0, i64 %56
  store %struct.Sphere* %57, %struct.Sphere** %obj, align 8
  %58 = load %struct.Ray** %1, align 8
  %59 = getelementptr inbounds %struct.Ray* %58, i32 0, i32 0
  %60 = load %struct.Ray** %1, align 8
  %61 = getelementptr inbounds %struct.Ray* %60, i32 0, i32 1
  %62 = load double* %t, align 8
  call void @_ZNK3VecmlEd(%struct.Vec* sret %4, %struct.Vec* %61, double %62)
  call void @_ZNK3VecplERKS_(%struct.Vec* sret %x, %struct.Vec* %59, %struct.Vec* dereferenceable(24) %4)
  %63 = load %struct.Sphere** %obj, align 8
  %64 = getelementptr inbounds %struct.Sphere* %63, i32 0, i32 1
  call void @_ZNK3VecmiERKS_(%struct.Vec* sret %5, %struct.Vec* %x, %struct.Vec* dereferenceable(24) %64)
  %65 = call dereferenceable(24) %struct.Vec* @_ZN3Vec4normEv(%struct.Vec* %5)
  %66 = bitcast %struct.Vec* %n to i8*
  %67 = bitcast %struct.Vec* %65 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %66, i8* %67, i64 24, i32 8, i1 false)
  %68 = load %struct.Ray** %1, align 8
  %69 = getelementptr inbounds %struct.Ray* %68, i32 0, i32 1
  %70 = call double @_ZNK3Vec3dotERKS_(%struct.Vec* %n, %struct.Vec* dereferenceable(24) %69)
  %71 = fcmp olt double %70, 0.000000e+00
  br i1 %71, label %72, label %75

; <label>:72                                      ; preds = %54
  %73 = bitcast %struct.Vec* %nl to i8*
  %74 = bitcast %struct.Vec* %n to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %73, i8* %74, i64 24, i32 8, i1 false)
  br label %76

; <label>:75                                      ; preds = %54
  call void @_ZNK3VecmlEd(%struct.Vec* sret %nl, %struct.Vec* %n, double -1.000000e+00)
  br label %76

; <label>:76                                      ; preds = %75, %72
  %77 = load %struct.Sphere** %obj, align 8
  %78 = getelementptr inbounds %struct.Sphere* %77, i32 0, i32 3
  %79 = bitcast %struct.Vec* %f to i8*
  %80 = bitcast %struct.Vec* %78 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %79, i8* %80, i64 24, i32 8, i1 false)
  %81 = getelementptr inbounds %struct.Vec* %f, i32 0, i32 0
  %82 = load double* %81, align 8
  %83 = getelementptr inbounds %struct.Vec* %f, i32 0, i32 1
  %84 = load double* %83, align 8
  %85 = fcmp ogt double %82, %84
  br i1 %85, label %86, label %95

; <label>:86                                      ; preds = %76
  %87 = getelementptr inbounds %struct.Vec* %f, i32 0, i32 0
  %88 = load double* %87, align 8
  %89 = getelementptr inbounds %struct.Vec* %f, i32 0, i32 2
  %90 = load double* %89, align 8
  %91 = fcmp ogt double %88, %90
  br i1 %91, label %92, label %95

; <label>:92                                      ; preds = %86
  %93 = getelementptr inbounds %struct.Vec* %f, i32 0, i32 0
  %94 = load double* %93, align 8
  br label %109

; <label>:95                                      ; preds = %86, %76
  %96 = getelementptr inbounds %struct.Vec* %f, i32 0, i32 1
  %97 = load double* %96, align 8
  %98 = getelementptr inbounds %struct.Vec* %f, i32 0, i32 2
  %99 = load double* %98, align 8
  %100 = fcmp ogt double %97, %99
  br i1 %100, label %101, label %104

; <label>:101                                     ; preds = %95
  %102 = getelementptr inbounds %struct.Vec* %f, i32 0, i32 1
  %103 = load double* %102, align 8
  br label %107

; <label>:104                                     ; preds = %95
  %105 = getelementptr inbounds %struct.Vec* %f, i32 0, i32 2
  %106 = load double* %105, align 8
  br label %107

; <label>:107                                     ; preds = %104, %101
  %108 = phi double [ %103, %101 ], [ %106, %104 ]
  br label %109

; <label>:109                                     ; preds = %107, %92
  %110 = phi double [ %94, %92 ], [ %108, %107 ]
  store double %110, double* %p, align 8
  %111 = load i32* %2, align 4
  %112 = add nsw i32 %111, 1
  store i32 %112, i32* %2, align 4
  %113 = icmp sgt i32 %112, 5
  br i1 %113, label %114, label %130

; <label>:114                                     ; preds = %109
  %115 = load i16** %3, align 8
  %116 = call double @erand48(i16* %115) #3
  %117 = load double* %p, align 8
  %118 = fcmp olt double %116, %117
  br i1 %118, label %119, label %124

; <label>:119                                     ; preds = %114
  %120 = load double* %p, align 8
  %121 = fdiv double 1.000000e+00, %120
  call void @_ZNK3VecmlEd(%struct.Vec* sret %6, %struct.Vec* %f, double %121)
  %122 = bitcast %struct.Vec* %f to i8*
  %123 = bitcast %struct.Vec* %6 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %122, i8* %123, i64 24, i32 8, i1 false)
  br label %129

; <label>:124                                     ; preds = %114
  %125 = load %struct.Sphere** %obj, align 8
  %126 = getelementptr inbounds %struct.Sphere* %125, i32 0, i32 2
  %127 = bitcast %struct.Vec* %agg.result to i8*
  %128 = bitcast %struct.Vec* %126 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %127, i8* %128, i64 24, i32 8, i1 false)
  br label %335

; <label>:129                                     ; preds = %119
  br label %130

; <label>:130                                     ; preds = %129, %109
  %131 = load %struct.Sphere** %obj, align 8
  %132 = getelementptr inbounds %struct.Sphere* %131, i32 0, i32 4
  %133 = load i32* %132, align 4
  %134 = icmp eq i32 %133, 0
  br i1 %134, label %135, label %175

; <label>:135                                     ; preds = %130
  %136 = load i16** %3, align 8
  %137 = call double @erand48(i16* %136) #3
  %138 = fmul double 0x401921FB54442D18, %137
  store double %138, double* %r1, align 8
  %139 = load i16** %3, align 8
  %140 = call double @erand48(i16* %139) #3
  store double %140, double* %r2, align 8
  %141 = load double* %r2, align 8
  %142 = call double @sqrt(double %141) #3
  store double %142, double* %r2s, align 8
  %143 = bitcast %struct.Vec* %w to i8*
  %144 = bitcast %struct.Vec* %nl to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %143, i8* %144, i64 24, i32 8, i1 false)
  %145 = getelementptr inbounds %struct.Vec* %w, i32 0, i32 0
  %146 = load double* %145, align 8
  %147 = call double @fabs(double %146) #7
  %148 = fcmp ogt double %147, 1.000000e-01
  br i1 %148, label %149, label %150

; <label>:149                                     ; preds = %135
  call void @_ZN3VecC2Eddd(%struct.Vec* %7, double 0.000000e+00, double 1.000000e+00, double 0.000000e+00)
  br label %151

; <label>:150                                     ; preds = %135
  call void @_ZN3VecC2Eddd(%struct.Vec* %7, double 1.000000e+00, double 0.000000e+00, double 0.000000e+00)
  br label %151

; <label>:151                                     ; preds = %150, %149
  call void @_ZN3VecrmERS_(%struct.Vec* sret %8, %struct.Vec* %7, %struct.Vec* dereferenceable(24) %w)
  %152 = call dereferenceable(24) %struct.Vec* @_ZN3Vec4normEv(%struct.Vec* %8)
  %153 = bitcast %struct.Vec* %u to i8*
  %154 = bitcast %struct.Vec* %152 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %153, i8* %154, i64 24, i32 8, i1 false)
  call void @_ZN3VecrmERS_(%struct.Vec* sret %v, %struct.Vec* %w, %struct.Vec* dereferenceable(24) %u)
  %155 = load double* %r1, align 8
  %156 = call double @cos(double %155) #3
  call void @_ZNK3VecmlEd(%struct.Vec* sret %9, %struct.Vec* %u, double %156)
  %157 = load double* %r2s, align 8
  call void @_ZNK3VecmlEd(%struct.Vec* sret %10, %struct.Vec* %9, double %157)
  %158 = load double* %r1, align 8
  %159 = call double @sin(double %158) #3
  call void @_ZNK3VecmlEd(%struct.Vec* sret %12, %struct.Vec* %v, double %159)
  %160 = load double* %r2s, align 8
  call void @_ZNK3VecmlEd(%struct.Vec* sret %11, %struct.Vec* %12, double %160)
  call void @_ZNK3VecplERKS_(%struct.Vec* sret %13, %struct.Vec* %10, %struct.Vec* dereferenceable(24) %11)
  %161 = load double* %r2, align 8
  %162 = fsub double 1.000000e+00, %161
  %163 = call double @sqrt(double %162) #3
  call void @_ZNK3VecmlEd(%struct.Vec* sret %14, %struct.Vec* %w, double %163)
  call void @_ZNK3VecplERKS_(%struct.Vec* sret %15, %struct.Vec* %13, %struct.Vec* dereferenceable(24) %14)
  %164 = call dereferenceable(24) %struct.Vec* @_ZN3Vec4normEv(%struct.Vec* %15)
  %165 = bitcast %struct.Vec* %d to i8*
  %166 = bitcast %struct.Vec* %164 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %165, i8* %166, i64 24, i32 8, i1 false)
  %167 = load %struct.Sphere** %obj, align 8
  %168 = getelementptr inbounds %struct.Sphere* %167, i32 0, i32 2
  %169 = bitcast %struct.Vec* %19 to i8*
  %170 = bitcast %struct.Vec* %x to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %169, i8* %170, i64 24, i32 8, i1 false)
  %171 = bitcast %struct.Vec* %20 to i8*
  %172 = bitcast %struct.Vec* %d to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %171, i8* %172, i64 24, i32 8, i1 false)
  call void @_ZN3RayC2E3VecS0_(%struct.Ray* %18, %struct.Vec* byval align 8 %19, %struct.Vec* byval align 8 %20)
  %173 = load i32* %2, align 4
  %174 = load i16** %3, align 8
  call void @_Z8radianceRK3RayiPt(%struct.Vec* sret %17, %struct.Ray* dereferenceable(48) %18, i32 %173, i16* %174)
  call void @_ZNK3Vec4multERKS_(%struct.Vec* sret %16, %struct.Vec* %f, %struct.Vec* dereferenceable(24) %17)
  call void @_ZNK3VecplERKS_(%struct.Vec* sret %agg.result, %struct.Vec* %168, %struct.Vec* dereferenceable(24) %16)
  br label %335

; <label>:175                                     ; preds = %130
  %176 = load %struct.Sphere** %obj, align 8
  %177 = getelementptr inbounds %struct.Sphere* %176, i32 0, i32 4
  %178 = load i32* %177, align 4
  %179 = icmp eq i32 %178, 1
  br i1 %179, label %180, label %192

; <label>:180                                     ; preds = %175
  %181 = load %struct.Sphere** %obj, align 8
  %182 = getelementptr inbounds %struct.Sphere* %181, i32 0, i32 2
  %183 = bitcast %struct.Vec* %24 to i8*
  %184 = bitcast %struct.Vec* %x to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %183, i8* %184, i64 24, i32 8, i1 false)
  %185 = load %struct.Ray** %1, align 8
  %186 = getelementptr inbounds %struct.Ray* %185, i32 0, i32 1
  call void @_ZNK3VecmlEd(%struct.Vec* sret %27, %struct.Vec* %n, double 2.000000e+00)
  %187 = load %struct.Ray** %1, align 8
  %188 = getelementptr inbounds %struct.Ray* %187, i32 0, i32 1
  %189 = call double @_ZNK3Vec3dotERKS_(%struct.Vec* %n, %struct.Vec* dereferenceable(24) %188)
  call void @_ZNK3VecmlEd(%struct.Vec* sret %26, %struct.Vec* %27, double %189)
  call void @_ZNK3VecmiERKS_(%struct.Vec* sret %25, %struct.Vec* %186, %struct.Vec* dereferenceable(24) %26)
  call void @_ZN3RayC2E3VecS0_(%struct.Ray* %23, %struct.Vec* byval align 8 %24, %struct.Vec* byval align 8 %25)
  %190 = load i32* %2, align 4
  %191 = load i16** %3, align 8
  call void @_Z8radianceRK3RayiPt(%struct.Vec* sret %22, %struct.Ray* dereferenceable(48) %23, i32 %190, i16* %191)
  call void @_ZNK3Vec4multERKS_(%struct.Vec* sret %21, %struct.Vec* %f, %struct.Vec* dereferenceable(24) %22)
  call void @_ZNK3VecplERKS_(%struct.Vec* sret %agg.result, %struct.Vec* %182, %struct.Vec* dereferenceable(24) %21)
  br label %335

; <label>:192                                     ; preds = %175
  br label %193

; <label>:193                                     ; preds = %192
  %194 = bitcast %struct.Vec* %28 to i8*
  %195 = bitcast %struct.Vec* %x to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %194, i8* %195, i64 24, i32 8, i1 false)
  %196 = load %struct.Ray** %1, align 8
  %197 = getelementptr inbounds %struct.Ray* %196, i32 0, i32 1
  call void @_ZNK3VecmlEd(%struct.Vec* sret %31, %struct.Vec* %n, double 2.000000e+00)
  %198 = load %struct.Ray** %1, align 8
  %199 = getelementptr inbounds %struct.Ray* %198, i32 0, i32 1
  %200 = call double @_ZNK3Vec3dotERKS_(%struct.Vec* %n, %struct.Vec* dereferenceable(24) %199)
  call void @_ZNK3VecmlEd(%struct.Vec* sret %30, %struct.Vec* %31, double %200)
  call void @_ZNK3VecmiERKS_(%struct.Vec* sret %29, %struct.Vec* %197, %struct.Vec* dereferenceable(24) %30)
  call void @_ZN3RayC2E3VecS0_(%struct.Ray* %reflRay, %struct.Vec* byval align 8 %28, %struct.Vec* byval align 8 %29)
  %201 = call double @_ZNK3Vec3dotERKS_(%struct.Vec* %n, %struct.Vec* dereferenceable(24) %nl)
  %202 = fcmp ogt double %201, 0.000000e+00
  %203 = zext i1 %202 to i8
  store i8 %203, i8* %into, align 1
  store double 1.000000e+00, double* %nc, align 8
  store double 1.500000e+00, double* %nt, align 8
  %204 = load i8* %into, align 1
  %205 = trunc i8 %204 to i1
  br i1 %205, label %206, label %210

; <label>:206                                     ; preds = %193
  %207 = load double* %nc, align 8
  %208 = load double* %nt, align 8
  %209 = fdiv double %207, %208
  br label %214

; <label>:210                                     ; preds = %193
  %211 = load double* %nt, align 8
  %212 = load double* %nc, align 8
  %213 = fdiv double %211, %212
  br label %214

; <label>:214                                     ; preds = %210, %206
  %215 = phi double [ %209, %206 ], [ %213, %210 ]
  store double %215, double* %nnt, align 8
  %216 = load %struct.Ray** %1, align 8
  %217 = getelementptr inbounds %struct.Ray* %216, i32 0, i32 1
  %218 = call double @_ZNK3Vec3dotERKS_(%struct.Vec* %217, %struct.Vec* dereferenceable(24) %nl)
  store double %218, double* %ddn, align 8
  %219 = load double* %nnt, align 8
  %220 = load double* %nnt, align 8
  %221 = fmul double %219, %220
  %222 = load double* %ddn, align 8
  %223 = load double* %ddn, align 8
  %224 = fmul double %222, %223
  %225 = fsub double 1.000000e+00, %224
  %226 = fmul double %221, %225
  %227 = fsub double 1.000000e+00, %226
  store double %227, double* %cos2t, align 8
  %228 = fcmp olt double %227, 0.000000e+00
  br i1 %228, label %229, label %234

; <label>:229                                     ; preds = %214
  %230 = load %struct.Sphere** %obj, align 8
  %231 = getelementptr inbounds %struct.Sphere* %230, i32 0, i32 2
  %232 = load i32* %2, align 4
  %233 = load i16** %3, align 8
  call void @_Z8radianceRK3RayiPt(%struct.Vec* sret %33, %struct.Ray* dereferenceable(48) %reflRay, i32 %232, i16* %233)
  call void @_ZNK3Vec4multERKS_(%struct.Vec* sret %32, %struct.Vec* %f, %struct.Vec* dereferenceable(24) %33)
  call void @_ZNK3VecplERKS_(%struct.Vec* sret %agg.result, %struct.Vec* %231, %struct.Vec* dereferenceable(24) %32)
  br label %335

; <label>:234                                     ; preds = %214
  %235 = load %struct.Ray** %1, align 8
  %236 = getelementptr inbounds %struct.Ray* %235, i32 0, i32 1
  %237 = load double* %nnt, align 8
  call void @_ZNK3VecmlEd(%struct.Vec* sret %34, %struct.Vec* %236, double %237)
  %238 = load i8* %into, align 1
  %239 = trunc i8 %238 to i1
  %240 = select i1 %239, i32 1, i32 -1
  %241 = sitofp i32 %240 to double
  %242 = load double* %ddn, align 8
  %243 = load double* %nnt, align 8
  %244 = fmul double %242, %243
  %245 = load double* %cos2t, align 8
  %246 = call double @sqrt(double %245) #3
  %247 = fadd double %244, %246
  %248 = fmul double %241, %247
  call void @_ZNK3VecmlEd(%struct.Vec* sret %35, %struct.Vec* %n, double %248)
  call void @_ZNK3VecmiERKS_(%struct.Vec* sret %36, %struct.Vec* %34, %struct.Vec* dereferenceable(24) %35)
  %249 = call dereferenceable(24) %struct.Vec* @_ZN3Vec4normEv(%struct.Vec* %36)
  %250 = bitcast %struct.Vec* %tdir to i8*
  %251 = bitcast %struct.Vec* %249 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %250, i8* %251, i64 24, i32 8, i1 false)
  %252 = load double* %nt, align 8
  %253 = load double* %nc, align 8
  %254 = fsub double %252, %253
  store double %254, double* %a, align 8
  %255 = load double* %nt, align 8
  %256 = load double* %nc, align 8
  %257 = fadd double %255, %256
  store double %257, double* %b, align 8
  %258 = load double* %a, align 8
  %259 = load double* %a, align 8
  %260 = fmul double %258, %259
  %261 = load double* %b, align 8
  %262 = load double* %b, align 8
  %263 = fmul double %261, %262
  %264 = fdiv double %260, %263
  store double %264, double* %R0, align 8
  %265 = load i8* %into, align 1
  %266 = trunc i8 %265 to i1
  br i1 %266, label %267, label %270

; <label>:267                                     ; preds = %234
  %268 = load double* %ddn, align 8
  %269 = fsub double -0.000000e+00, %268
  br label %272

; <label>:270                                     ; preds = %234
  %271 = call double @_ZNK3Vec3dotERKS_(%struct.Vec* %tdir, %struct.Vec* dereferenceable(24) %n)
  br label %272

; <label>:272                                     ; preds = %270, %267
  %273 = phi double [ %269, %267 ], [ %271, %270 ]
  %274 = fsub double 1.000000e+00, %273
  store double %274, double* %c, align 8
  %275 = load double* %R0, align 8
  %276 = load double* %R0, align 8
  %277 = fsub double 1.000000e+00, %276
  %278 = load double* %c, align 8
  %279 = fmul double %277, %278
  %280 = load double* %c, align 8
  %281 = fmul double %279, %280
  %282 = load double* %c, align 8
  %283 = fmul double %281, %282
  %284 = load double* %c, align 8
  %285 = fmul double %283, %284
  %286 = load double* %c, align 8
  %287 = fmul double %285, %286
  %288 = fadd double %275, %287
  store double %288, double* %Re, align 8
  %289 = load double* %Re, align 8
  %290 = fsub double 1.000000e+00, %289
  store double %290, double* %Tr, align 8
  %291 = load double* %Re, align 8
  %292 = fmul double 5.000000e-01, %291
  %293 = fadd double 2.500000e-01, %292
  store double %293, double* %P, align 8
  %294 = load double* %Re, align 8
  %295 = load double* %P, align 8
  %296 = fdiv double %294, %295
  store double %296, double* %RP, align 8
  %297 = load double* %Tr, align 8
  %298 = load double* %P, align 8
  %299 = fsub double 1.000000e+00, %298
  %300 = fdiv double %297, %299
  store double %300, double* %TP, align 8
  %301 = load %struct.Sphere** %obj, align 8
  %302 = getelementptr inbounds %struct.Sphere* %301, i32 0, i32 2
  %303 = load i32* %2, align 4
  %304 = icmp sgt i32 %303, 2
  br i1 %304, label %305, label %323

; <label>:305                                     ; preds = %272
  %306 = load i16** %3, align 8
  %307 = call double @erand48(i16* %306) #3
  %308 = load double* %P, align 8
  %309 = fcmp olt double %307, %308
  br i1 %309, label %310, label %314

; <label>:310                                     ; preds = %305
  %311 = load i32* %2, align 4
  %312 = load i16** %3, align 8
  call void @_Z8radianceRK3RayiPt(%struct.Vec* sret %39, %struct.Ray* dereferenceable(48) %reflRay, i32 %311, i16* %312)
  %313 = load double* %RP, align 8
  call void @_ZNK3VecmlEd(%struct.Vec* sret %38, %struct.Vec* %39, double %313)
  br label %322

; <label>:314                                     ; preds = %305
  %315 = bitcast %struct.Vec* %41 to i8*
  %316 = bitcast %struct.Vec* %x to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %315, i8* %316, i64 24, i32 8, i1 false)
  %317 = bitcast %struct.Vec* %42 to i8*
  %318 = bitcast %struct.Vec* %tdir to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %317, i8* %318, i64 24, i32 8, i1 false)
  call void @_ZN3RayC2E3VecS0_(%struct.Ray* %40, %struct.Vec* byval align 8 %41, %struct.Vec* byval align 8 %42)
  %319 = load i32* %2, align 4
  %320 = load i16** %3, align 8
  call void @_Z8radianceRK3RayiPt(%struct.Vec* sret %43, %struct.Ray* dereferenceable(48) %40, i32 %319, i16* %320)
  %321 = load double* %TP, align 8
  call void @_ZNK3VecmlEd(%struct.Vec* sret %38, %struct.Vec* %43, double %321)
  br label %322

; <label>:322                                     ; preds = %314, %310
  br label %334

; <label>:323                                     ; preds = %272
  %324 = load i32* %2, align 4
  %325 = load i16** %3, align 8
  call void @_Z8radianceRK3RayiPt(%struct.Vec* sret %44, %struct.Ray* dereferenceable(48) %reflRay, i32 %324, i16* %325)
  %326 = load double* %Re, align 8
  call void @_ZNK3VecmlEd(%struct.Vec* sret %45, %struct.Vec* %44, double %326)
  %327 = bitcast %struct.Vec* %48 to i8*
  %328 = bitcast %struct.Vec* %x to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %327, i8* %328, i64 24, i32 8, i1 false)
  %329 = bitcast %struct.Vec* %49 to i8*
  %330 = bitcast %struct.Vec* %tdir to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %329, i8* %330, i64 24, i32 8, i1 false)
  call void @_ZN3RayC2E3VecS0_(%struct.Ray* %47, %struct.Vec* byval align 8 %48, %struct.Vec* byval align 8 %49)
  %331 = load i32* %2, align 4
  %332 = load i16** %3, align 8
  call void @_Z8radianceRK3RayiPt(%struct.Vec* sret %50, %struct.Ray* dereferenceable(48) %47, i32 %331, i16* %332)
  %333 = load double* %Tr, align 8
  call void @_ZNK3VecmlEd(%struct.Vec* sret %46, %struct.Vec* %50, double %333)
  call void @_ZNK3VecplERKS_(%struct.Vec* sret %38, %struct.Vec* %45, %struct.Vec* dereferenceable(24) %46)
  br label %334

; <label>:334                                     ; preds = %323, %322
  call void @_ZNK3Vec4multERKS_(%struct.Vec* sret %37, %struct.Vec* %f, %struct.Vec* dereferenceable(24) %38)
  call void @_ZNK3VecplERKS_(%struct.Vec* sret %agg.result, %struct.Vec* %302, %struct.Vec* dereferenceable(24) %37)
  br label %335

; <label>:335                                     ; preds = %334, %229, %180, %151, %124, %53
  ret void
}

; Function Attrs: inlinehint uwtable
define linkonce_odr zeroext i1 @_Z9intersectRK3RayRdRi(%struct.Ray* dereferenceable(48) %r, double* dereferenceable(8) %t, i32* dereferenceable(4) %id) #2 {
  %1 = alloca %struct.Ray*, align 8
  %2 = alloca double*, align 8
  %3 = alloca i32*, align 8
  %n = alloca double, align 8
  %d = alloca double, align 8
  %inf = alloca double, align 8
  %i = alloca i32, align 4
  store %struct.Ray* %r, %struct.Ray** %1, align 8
  store double* %t, double** %2, align 8
  store i32* %id, i32** %3, align 8
  store double 9.000000e+00, double* %n, align 8
  %4 = load double** %2, align 8
  store double 1.000000e+20, double* %4, align 8
  store double 1.000000e+20, double* %inf, align 8
  %5 = load double* %n, align 8
  %6 = fptosi double %5 to i32
  store i32 %6, i32* %i, align 4
  br label %7

; <label>:7                                       ; preds = %28, %0
  %8 = load i32* %i, align 4
  %9 = add nsw i32 %8, -1
  store i32 %9, i32* %i, align 4
  %10 = icmp ne i32 %8, 0
  br i1 %10, label %11, label %29

; <label>:11                                      ; preds = %7
  %12 = load i32* %i, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [9 x %struct.Sphere]* @spheres, i32 0, i64 %13
  %15 = load %struct.Ray** %1, align 8
  %16 = call double @_ZNK6Sphere9intersectERK3Ray(%struct.Sphere* %14, %struct.Ray* dereferenceable(48) %15)
  store double %16, double* %d, align 8
  %17 = fcmp une double %16, 0.000000e+00
  br i1 %17, label %18, label %28

; <label>:18                                      ; preds = %11
  %19 = load double* %d, align 8
  %20 = load double** %2, align 8
  %21 = load double* %20, align 8
  %22 = fcmp olt double %19, %21
  br i1 %22, label %23, label %28

; <label>:23                                      ; preds = %18
  %24 = load double* %d, align 8
  %25 = load double** %2, align 8
  store double %24, double* %25, align 8
  %26 = load i32* %i, align 4
  %27 = load i32** %3, align 8
  store i32 %26, i32* %27, align 4
  br label %28

; <label>:28                                      ; preds = %23, %18, %11
  br label %7

; <label>:29                                      ; preds = %7
  %30 = load double** %2, align 8
  %31 = load double* %30, align 8
  %32 = load double* %inf, align 8
  %33 = fcmp olt double %31, %32
  ret i1 %33
}

; Function Attrs: uwtable
define linkonce_odr void @_ZNK3VecplERKS_(%struct.Vec* noalias sret %agg.result, %struct.Vec* %this, %struct.Vec* dereferenceable(24) %b) #1 align 2 {
  %1 = alloca %struct.Vec*, align 8
  %2 = alloca %struct.Vec*, align 8
  store %struct.Vec* %this, %struct.Vec** %1, align 8
  store %struct.Vec* %b, %struct.Vec** %2, align 8
  %3 = load %struct.Vec** %1
  %4 = getelementptr inbounds %struct.Vec* %3, i32 0, i32 0
  %5 = load double* %4, align 8
  %6 = load %struct.Vec** %2, align 8
  %7 = getelementptr inbounds %struct.Vec* %6, i32 0, i32 0
  %8 = load double* %7, align 8
  %9 = fadd double %5, %8
  %10 = getelementptr inbounds %struct.Vec* %3, i32 0, i32 1
  %11 = load double* %10, align 8
  %12 = load %struct.Vec** %2, align 8
  %13 = getelementptr inbounds %struct.Vec* %12, i32 0, i32 1
  %14 = load double* %13, align 8
  %15 = fadd double %11, %14
  %16 = getelementptr inbounds %struct.Vec* %3, i32 0, i32 2
  %17 = load double* %16, align 8
  %18 = load %struct.Vec** %2, align 8
  %19 = getelementptr inbounds %struct.Vec* %18, i32 0, i32 2
  %20 = load double* %19, align 8
  %21 = fadd double %17, %20
  call void @_ZN3VecC2Eddd(%struct.Vec* %agg.result, double %9, double %15, double %21)
  ret void
}

; Function Attrs: uwtable
define linkonce_odr void @_ZNK3VecmiERKS_(%struct.Vec* noalias sret %agg.result, %struct.Vec* %this, %struct.Vec* dereferenceable(24) %b) #1 align 2 {
  %1 = alloca %struct.Vec*, align 8
  %2 = alloca %struct.Vec*, align 8
  store %struct.Vec* %this, %struct.Vec** %1, align 8
  store %struct.Vec* %b, %struct.Vec** %2, align 8
  %3 = load %struct.Vec** %1
  %4 = getelementptr inbounds %struct.Vec* %3, i32 0, i32 0
  %5 = load double* %4, align 8
  %6 = load %struct.Vec** %2, align 8
  %7 = getelementptr inbounds %struct.Vec* %6, i32 0, i32 0
  %8 = load double* %7, align 8
  %9 = fsub double %5, %8
  %10 = getelementptr inbounds %struct.Vec* %3, i32 0, i32 1
  %11 = load double* %10, align 8
  %12 = load %struct.Vec** %2, align 8
  %13 = getelementptr inbounds %struct.Vec* %12, i32 0, i32 1
  %14 = load double* %13, align 8
  %15 = fsub double %11, %14
  %16 = getelementptr inbounds %struct.Vec* %3, i32 0, i32 2
  %17 = load double* %16, align 8
  %18 = load %struct.Vec** %2, align 8
  %19 = getelementptr inbounds %struct.Vec* %18, i32 0, i32 2
  %20 = load double* %19, align 8
  %21 = fsub double %17, %20
  call void @_ZN3VecC2Eddd(%struct.Vec* %agg.result, double %9, double %15, double %21)
  ret void
}

; Function Attrs: uwtable
define linkonce_odr dereferenceable(24) %struct.Vec* @_ZN3Vec4normEv(%struct.Vec* %this) #1 align 2 {
  %1 = alloca %struct.Vec*, align 8
  %2 = alloca %struct.Vec, align 8
  store %struct.Vec* %this, %struct.Vec** %1, align 8
  %3 = load %struct.Vec** %1
  %4 = getelementptr inbounds %struct.Vec* %3, i32 0, i32 0
  %5 = load double* %4, align 8
  %6 = getelementptr inbounds %struct.Vec* %3, i32 0, i32 0
  %7 = load double* %6, align 8
  %8 = fmul double %5, %7
  %9 = getelementptr inbounds %struct.Vec* %3, i32 0, i32 1
  %10 = load double* %9, align 8
  %11 = getelementptr inbounds %struct.Vec* %3, i32 0, i32 1
  %12 = load double* %11, align 8
  %13 = fmul double %10, %12
  %14 = fadd double %8, %13
  %15 = getelementptr inbounds %struct.Vec* %3, i32 0, i32 2
  %16 = load double* %15, align 8
  %17 = getelementptr inbounds %struct.Vec* %3, i32 0, i32 2
  %18 = load double* %17, align 8
  %19 = fmul double %16, %18
  %20 = fadd double %14, %19
  %21 = call double @sqrt(double %20) #3
  %22 = fdiv double 1.000000e+00, %21
  call void @_ZNK3VecmlEd(%struct.Vec* sret %2, %struct.Vec* %3, double %22)
  %23 = bitcast %struct.Vec* %3 to i8*
  %24 = bitcast %struct.Vec* %2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %23, i8* %24, i64 24, i32 8, i1 false)
  ret %struct.Vec* %3
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #3

; Function Attrs: nounwind uwtable
define linkonce_odr double @_ZNK3Vec3dotERKS_(%struct.Vec* %this, %struct.Vec* dereferenceable(24) %b) #0 align 2 {
  %1 = alloca %struct.Vec*, align 8
  %2 = alloca %struct.Vec*, align 8
  store %struct.Vec* %this, %struct.Vec** %1, align 8
  store %struct.Vec* %b, %struct.Vec** %2, align 8
  %3 = load %struct.Vec** %1
  %4 = getelementptr inbounds %struct.Vec* %3, i32 0, i32 0
  %5 = load double* %4, align 8
  %6 = load %struct.Vec** %2, align 8
  %7 = getelementptr inbounds %struct.Vec* %6, i32 0, i32 0
  %8 = load double* %7, align 8
  %9 = fmul double %5, %8
  %10 = getelementptr inbounds %struct.Vec* %3, i32 0, i32 1
  %11 = load double* %10, align 8
  %12 = load %struct.Vec** %2, align 8
  %13 = getelementptr inbounds %struct.Vec* %12, i32 0, i32 1
  %14 = load double* %13, align 8
  %15 = fmul double %11, %14
  %16 = fadd double %9, %15
  %17 = getelementptr inbounds %struct.Vec* %3, i32 0, i32 2
  %18 = load double* %17, align 8
  %19 = load %struct.Vec** %2, align 8
  %20 = getelementptr inbounds %struct.Vec* %19, i32 0, i32 2
  %21 = load double* %20, align 8
  %22 = fmul double %18, %21
  %23 = fadd double %16, %22
  ret double %23
}

; Function Attrs: nounwind
declare double @erand48(i16*) #4

; Function Attrs: nounwind
declare double @sqrt(double) #4

; Function Attrs: nounwind readnone
declare double @fabs(double) #5

; Function Attrs: uwtable
define linkonce_odr void @_ZN3VecrmERS_(%struct.Vec* noalias sret %agg.result, %struct.Vec* %this, %struct.Vec* dereferenceable(24) %b) #1 align 2 {
  %1 = alloca %struct.Vec*, align 8
  %2 = alloca %struct.Vec*, align 8
  store %struct.Vec* %this, %struct.Vec** %1, align 8
  store %struct.Vec* %b, %struct.Vec** %2, align 8
  %3 = load %struct.Vec** %1
  %4 = getelementptr inbounds %struct.Vec* %3, i32 0, i32 1
  %5 = load double* %4, align 8
  %6 = load %struct.Vec** %2, align 8
  %7 = getelementptr inbounds %struct.Vec* %6, i32 0, i32 2
  %8 = load double* %7, align 8
  %9 = fmul double %5, %8
  %10 = getelementptr inbounds %struct.Vec* %3, i32 0, i32 2
  %11 = load double* %10, align 8
  %12 = load %struct.Vec** %2, align 8
  %13 = getelementptr inbounds %struct.Vec* %12, i32 0, i32 1
  %14 = load double* %13, align 8
  %15 = fmul double %11, %14
  %16 = fsub double %9, %15
  %17 = getelementptr inbounds %struct.Vec* %3, i32 0, i32 2
  %18 = load double* %17, align 8
  %19 = load %struct.Vec** %2, align 8
  %20 = getelementptr inbounds %struct.Vec* %19, i32 0, i32 0
  %21 = load double* %20, align 8
  %22 = fmul double %18, %21
  %23 = getelementptr inbounds %struct.Vec* %3, i32 0, i32 0
  %24 = load double* %23, align 8
  %25 = load %struct.Vec** %2, align 8
  %26 = getelementptr inbounds %struct.Vec* %25, i32 0, i32 2
  %27 = load double* %26, align 8
  %28 = fmul double %24, %27
  %29 = fsub double %22, %28
  %30 = getelementptr inbounds %struct.Vec* %3, i32 0, i32 0
  %31 = load double* %30, align 8
  %32 = load %struct.Vec** %2, align 8
  %33 = getelementptr inbounds %struct.Vec* %32, i32 0, i32 1
  %34 = load double* %33, align 8
  %35 = fmul double %31, %34
  %36 = getelementptr inbounds %struct.Vec* %3, i32 0, i32 1
  %37 = load double* %36, align 8
  %38 = load %struct.Vec** %2, align 8
  %39 = getelementptr inbounds %struct.Vec* %38, i32 0, i32 0
  %40 = load double* %39, align 8
  %41 = fmul double %37, %40
  %42 = fsub double %35, %41
  call void @_ZN3VecC2Eddd(%struct.Vec* %agg.result, double %16, double %29, double %42)
  ret void
}

; Function Attrs: nounwind
declare double @cos(double) #4

; Function Attrs: nounwind
declare double @sin(double) #4

; Function Attrs: uwtable
define linkonce_odr void @_ZNK3Vec4multERKS_(%struct.Vec* noalias sret %agg.result, %struct.Vec* %this, %struct.Vec* dereferenceable(24) %b) #1 align 2 {
  %1 = alloca %struct.Vec*, align 8
  %2 = alloca %struct.Vec*, align 8
  store %struct.Vec* %this, %struct.Vec** %1, align 8
  store %struct.Vec* %b, %struct.Vec** %2, align 8
  %3 = load %struct.Vec** %1
  %4 = getelementptr inbounds %struct.Vec* %3, i32 0, i32 0
  %5 = load double* %4, align 8
  %6 = load %struct.Vec** %2, align 8
  %7 = getelementptr inbounds %struct.Vec* %6, i32 0, i32 0
  %8 = load double* %7, align 8
  %9 = fmul double %5, %8
  %10 = getelementptr inbounds %struct.Vec* %3, i32 0, i32 1
  %11 = load double* %10, align 8
  %12 = load %struct.Vec** %2, align 8
  %13 = getelementptr inbounds %struct.Vec* %12, i32 0, i32 1
  %14 = load double* %13, align 8
  %15 = fmul double %11, %14
  %16 = getelementptr inbounds %struct.Vec* %3, i32 0, i32 2
  %17 = load double* %16, align 8
  %18 = load %struct.Vec** %2, align 8
  %19 = getelementptr inbounds %struct.Vec* %18, i32 0, i32 2
  %20 = load double* %19, align 8
  %21 = fmul double %17, %20
  call void @_ZN3VecC2Eddd(%struct.Vec* %agg.result, double %9, double %15, double %21)
  ret void
}

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN3RayC2E3VecS0_(%struct.Ray* %this, %struct.Vec* byval align 8 %o_, %struct.Vec* byval align 8 %d_) unnamed_addr #0 align 2 {
  %1 = alloca %struct.Ray*, align 8
  store %struct.Ray* %this, %struct.Ray** %1, align 8
  %2 = load %struct.Ray** %1
  %3 = getelementptr inbounds %struct.Ray* %2, i32 0, i32 0
  %4 = bitcast %struct.Vec* %3 to i8*
  %5 = bitcast %struct.Vec* %o_ to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %4, i8* %5, i64 24, i32 8, i1 false)
  %6 = getelementptr inbounds %struct.Ray* %2, i32 0, i32 1
  %7 = bitcast %struct.Vec* %6 to i8*
  %8 = bitcast %struct.Vec* %d_ to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %7, i8* %8, i64 24, i32 8, i1 false)
  ret void
}

; Function Attrs: uwtable
define i32 @main(i32 %argc, i8** %argv) #1 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %w = alloca i32, align 4
  %h = alloca i32, align 4
  %samps = alloca i32, align 4
  %Start_t = alloca i64, align 8
  %cam = alloca %struct.Ray, align 8
  %4 = alloca %struct.Vec, align 8
  %5 = alloca %struct.Vec, align 8
  %6 = alloca %struct.Vec, align 8
  %cx = alloca %struct.Vec, align 8
  %cy = alloca %struct.Vec, align 8
  %7 = alloca %struct.Vec, align 8
  %r = alloca %struct.Vec, align 8
  %c = alloca %struct.Vec*, align 8
  %8 = alloca i8*
  %9 = alloca i32
  %y = alloca i32, align 4
  %x = alloca i16, align 2
  %Xi = alloca [3 x i16], align 2
  %sy = alloca i32, align 4
  %i = alloca i32, align 4
  %sx = alloca i32, align 4
  %s = alloca i32, align 4
  %r1 = alloca double, align 8
  %dx = alloca double, align 8
  %r2 = alloca double, align 8
  %dy = alloca double, align 8
  %d = alloca %struct.Vec, align 8
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
  %20 = alloca %struct.Vec, align 8
  %21 = alloca %struct.Vec, align 8
  %22 = alloca %struct.Vec, align 8
  %23 = alloca %struct.Vec, align 8
  %End_t = alloca i64, align 8
  %f = alloca %struct._IO_FILE*, align 8
  %i1 = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  store i32 1024, i32* %w, align 4
  store i32 768, i32* %h, align 4
  %24 = load i32* %2, align 4
  %25 = icmp eq i32 %24, 2
  br i1 %25, label %26, label %32

; <label>:26                                      ; preds = %0
  %27 = load i8*** %3, align 8
  %28 = getelementptr inbounds i8** %27, i64 1
  %29 = load i8** %28, align 8
  %30 = call i32 @atoi(i8* %29) #12
  %31 = sdiv i32 %30, 4
  br label %33

; <label>:32                                      ; preds = %0
  br label %33

; <label>:33                                      ; preds = %32, %26
  %34 = phi i32 [ %31, %26 ], [ 1, %32 ]
  store i32 %34, i32* %samps, align 4
  %35 = call i64 @time(i64* null) #3
  store i64 %35, i64* %Start_t, align 8
  call void @_ZN3VecC2Eddd(%struct.Vec* %4, double 5.000000e+01, double 5.200000e+01, double 2.956000e+02)
  call void @_ZN3VecC2Eddd(%struct.Vec* %6, double 0.000000e+00, double -4.261200e-02, double -1.000000e+00)
  %36 = call dereferenceable(24) %struct.Vec* @_ZN3Vec4normEv(%struct.Vec* %6)
  %37 = bitcast %struct.Vec* %5 to i8*
  %38 = bitcast %struct.Vec* %36 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %37, i8* %38, i64 24, i32 8, i1 false)
  call void @_ZN3RayC2E3VecS0_(%struct.Ray* %cam, %struct.Vec* byval align 8 %4, %struct.Vec* byval align 8 %5)
  %39 = load i32* %w, align 4
  %40 = sitofp i32 %39 to double
  %41 = fmul double %40, 5.135000e-01
  %42 = load i32* %h, align 4
  %43 = sitofp i32 %42 to double
  %44 = fdiv double %41, %43
  call void @_ZN3VecC2Eddd(%struct.Vec* %cx, double %44, double 0.000000e+00, double 0.000000e+00)
  %45 = getelementptr inbounds %struct.Ray* %cam, i32 0, i32 1
  call void @_ZN3VecrmERS_(%struct.Vec* sret %7, %struct.Vec* %cx, %struct.Vec* dereferenceable(24) %45)
  %46 = call dereferenceable(24) %struct.Vec* @_ZN3Vec4normEv(%struct.Vec* %7)
  call void @_ZNK3VecmlEd(%struct.Vec* sret %cy, %struct.Vec* %46, double 5.135000e-01)
  call void @_ZN3VecC2Eddd(%struct.Vec* %r, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00)
  %47 = load i32* %w, align 4
  %48 = load i32* %h, align 4
  %49 = mul nsw i32 %47, %48
  %50 = sext i32 %49 to i64
  %51 = call { i64, i1 } @llvm.umul.with.overflow.i64(i64 %50, i64 24)
  %52 = extractvalue { i64, i1 } %51, 1
  %53 = extractvalue { i64, i1 } %51, 0
  %54 = select i1 %52, i64 -1, i64 %53
  %55 = call noalias i8* @_Znam(i64 %54) #13
  %56 = bitcast i8* %55 to %struct.Vec*
  %57 = icmp eq i64 %50, 0
  br i1 %57, label %65, label %58

; <label>:58                                      ; preds = %33
  %59 = getelementptr inbounds %struct.Vec* %56, i64 %50
  br label %60

; <label>:60                                      ; preds = %62, %58
  %61 = phi %struct.Vec* [ %56, %58 ], [ %63, %62 ]
  invoke void @_ZN3VecC2Eddd(%struct.Vec* %61, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00)
          to label %62 unwind label %192

; <label>:62                                      ; preds = %60
  %63 = getelementptr inbounds %struct.Vec* %61, i64 1
  %64 = icmp eq %struct.Vec* %63, %59
  br i1 %64, label %65, label %60

; <label>:65                                      ; preds = %33, %62
  store %struct.Vec* %56, %struct.Vec** %c, align 8
  store i32 0, i32* %y, align 4
  br label %66

; <label>:66                                      ; preds = %230, %65
  %67 = load i32* %y, align 4
  %68 = load i32* %h, align 4
  %69 = icmp slt i32 %67, %68
  br i1 %69, label %70, label %233

; <label>:70                                      ; preds = %66
  %71 = load %struct._IO_FILE** @stderr, align 8
  %72 = load i32* %samps, align 4
  %73 = mul nsw i32 %72, 4
  %74 = load i32* %y, align 4
  %75 = sitofp i32 %74 to double
  %76 = fmul double 1.000000e+02, %75
  %77 = load i32* %h, align 4
  %78 = sub nsw i32 %77, 1
  %79 = sitofp i32 %78 to double
  %80 = fdiv double %76, %79
  %81 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %71, i8* getelementptr inbounds ([28 x i8]* @.str, i32 0, i32 0), i32 %73, double %80)
  store i16 0, i16* %x, align 2
  %82 = getelementptr inbounds [3 x i16]* %Xi, i64 0, i64 0
  store i16 0, i16* %82
  %83 = getelementptr inbounds i16* %82, i64 1
  store i16 0, i16* %83
  %84 = getelementptr inbounds i16* %83, i64 1
  %85 = load i32* %y, align 4
  %86 = load i32* %y, align 4
  %87 = mul nsw i32 %85, %86
  %88 = load i32* %y, align 4
  %89 = mul nsw i32 %87, %88
  %90 = trunc i32 %89 to i16
  store i16 %90, i16* %84
  br label %91

; <label>:91                                      ; preds = %226, %70
  %92 = load i16* %x, align 2
  %93 = zext i16 %92 to i32
  %94 = load i32* %w, align 4
  %95 = icmp slt i32 %93, %94
  br i1 %95, label %96, label %229

; <label>:96                                      ; preds = %91
  store i32 0, i32* %sy, align 4
  %97 = load i32* %h, align 4
  %98 = load i32* %y, align 4
  %99 = sub nsw i32 %97, %98
  %100 = sub nsw i32 %99, 1
  %101 = load i32* %w, align 4
  %102 = mul nsw i32 %100, %101
  %103 = load i16* %x, align 2
  %104 = zext i16 %103 to i32
  %105 = add nsw i32 %102, %104
  store i32 %105, i32* %i, align 4
  br label %106

; <label>:106                                     ; preds = %222, %96
  %107 = load i32* %sy, align 4
  %108 = icmp slt i32 %107, 2
  br i1 %108, label %109, label %225

; <label>:109                                     ; preds = %106
  store i32 0, i32* %sx, align 4
  br label %110

; <label>:110                                     ; preds = %216, %109
  %111 = load i32* %sx, align 4
  %112 = icmp slt i32 %111, 2
  br i1 %112, label %113, label %221

; <label>:113                                     ; preds = %110
  store i32 0, i32* %s, align 4
  br label %114

; <label>:114                                     ; preds = %189, %113
  %115 = load i32* %s, align 4
  %116 = load i32* %samps, align 4
  %117 = icmp slt i32 %115, %116
  br i1 %117, label %118, label %196

; <label>:118                                     ; preds = %114
  %119 = getelementptr inbounds [3 x i16]* %Xi, i32 0, i32 0
  %120 = call double @erand48(i16* %119) #3
  %121 = fmul double 2.000000e+00, %120
  store double %121, double* %r1, align 8
  %122 = load double* %r1, align 8
  %123 = fcmp olt double %122, 1.000000e+00
  br i1 %123, label %124, label %128

; <label>:124                                     ; preds = %118
  %125 = load double* %r1, align 8
  %126 = call double @sqrt(double %125) #3
  %127 = fsub double %126, 1.000000e+00
  br label %133

; <label>:128                                     ; preds = %118
  %129 = load double* %r1, align 8
  %130 = fsub double 2.000000e+00, %129
  %131 = call double @sqrt(double %130) #3
  %132 = fsub double 1.000000e+00, %131
  br label %133

; <label>:133                                     ; preds = %128, %124
  %134 = phi double [ %127, %124 ], [ %132, %128 ]
  store double %134, double* %dx, align 8
  %135 = getelementptr inbounds [3 x i16]* %Xi, i32 0, i32 0
  %136 = call double @erand48(i16* %135) #3
  %137 = fmul double 2.000000e+00, %136
  store double %137, double* %r2, align 8
  %138 = load double* %r2, align 8
  %139 = fcmp olt double %138, 1.000000e+00
  br i1 %139, label %140, label %144

; <label>:140                                     ; preds = %133
  %141 = load double* %r2, align 8
  %142 = call double @sqrt(double %141) #3
  %143 = fsub double %142, 1.000000e+00
  br label %149

; <label>:144                                     ; preds = %133
  %145 = load double* %r2, align 8
  %146 = fsub double 2.000000e+00, %145
  %147 = call double @sqrt(double %146) #3
  %148 = fsub double 1.000000e+00, %147
  br label %149

; <label>:149                                     ; preds = %144, %140
  %150 = phi double [ %143, %140 ], [ %148, %144 ]
  store double %150, double* %dy, align 8
  %151 = load i32* %sx, align 4
  %152 = sitofp i32 %151 to double
  %153 = fadd double %152, 5.000000e-01
  %154 = load double* %dx, align 8
  %155 = fadd double %153, %154
  %156 = fdiv double %155, 2.000000e+00
  %157 = load i16* %x, align 2
  %158 = zext i16 %157 to i32
  %159 = sitofp i32 %158 to double
  %160 = fadd double %156, %159
  %161 = load i32* %w, align 4
  %162 = sitofp i32 %161 to double
  %163 = fdiv double %160, %162
  %164 = fsub double %163, 5.000000e-01
  call void @_ZNK3VecmlEd(%struct.Vec* sret %10, %struct.Vec* %cx, double %164)
  %165 = load i32* %sy, align 4
  %166 = sitofp i32 %165 to double
  %167 = fadd double %166, 5.000000e-01
  %168 = load double* %dy, align 8
  %169 = fadd double %167, %168
  %170 = fdiv double %169, 2.000000e+00
  %171 = load i32* %y, align 4
  %172 = sitofp i32 %171 to double
  %173 = fadd double %170, %172
  %174 = load i32* %h, align 4
  %175 = sitofp i32 %174 to double
  %176 = fdiv double %173, %175
  %177 = fsub double %176, 5.000000e-01
  call void @_ZNK3VecmlEd(%struct.Vec* sret %11, %struct.Vec* %cy, double %177)
  call void @_ZNK3VecplERKS_(%struct.Vec* sret %12, %struct.Vec* %10, %struct.Vec* dereferenceable(24) %11)
  %178 = getelementptr inbounds %struct.Ray* %cam, i32 0, i32 1
  call void @_ZNK3VecplERKS_(%struct.Vec* sret %d, %struct.Vec* %12, %struct.Vec* dereferenceable(24) %178)
  %179 = getelementptr inbounds %struct.Ray* %cam, i32 0, i32 0
  call void @_ZNK3VecmlEd(%struct.Vec* sret %17, %struct.Vec* %d, double 1.400000e+02)
  call void @_ZNK3VecplERKS_(%struct.Vec* sret %16, %struct.Vec* %179, %struct.Vec* dereferenceable(24) %17)
  %180 = call dereferenceable(24) %struct.Vec* @_ZN3Vec4normEv(%struct.Vec* %d)
  %181 = bitcast %struct.Vec* %18 to i8*
  %182 = bitcast %struct.Vec* %180 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %181, i8* %182, i64 24, i32 8, i1 false)
  call void @_ZN3RayC2E3VecS0_(%struct.Ray* %15, %struct.Vec* byval align 8 %16, %struct.Vec* byval align 8 %18)
  %183 = getelementptr inbounds [3 x i16]* %Xi, i32 0, i32 0
  call void @_Z8radianceRK3RayiPt(%struct.Vec* sret %19, %struct.Ray* dereferenceable(48) %15, i32 0, i16* %183)
  %184 = load i32* %samps, align 4
  %185 = sitofp i32 %184 to double
  %186 = fdiv double 1.000000e+00, %185
  call void @_ZNK3VecmlEd(%struct.Vec* sret %14, %struct.Vec* %19, double %186)
  call void @_ZNK3VecplERKS_(%struct.Vec* sret %13, %struct.Vec* %r, %struct.Vec* dereferenceable(24) %14)
  %187 = bitcast %struct.Vec* %r to i8*
  %188 = bitcast %struct.Vec* %13 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %187, i8* %188, i64 24, i32 8, i1 false)
  br label %189

; <label>:189                                     ; preds = %149
  %190 = load i32* %s, align 4
  %191 = add nsw i32 %190, 1
  store i32 %191, i32* %s, align 4
  br label %114

; <label>:192                                     ; preds = %60
  %193 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
  %194 = extractvalue { i8*, i32 } %193, 0
  store i8* %194, i8** %8
  %195 = extractvalue { i8*, i32 } %193, 1
  store i32 %195, i32* %9
  call void @_ZdaPv(i8* %55) #14
  br label %280

; <label>:196                                     ; preds = %114
  %197 = load i32* %i, align 4
  %198 = sext i32 %197 to i64
  %199 = load %struct.Vec** %c, align 8
  %200 = getelementptr inbounds %struct.Vec* %199, i64 %198
  %201 = load i32* %i, align 4
  %202 = sext i32 %201 to i64
  %203 = load %struct.Vec** %c, align 8
  %204 = getelementptr inbounds %struct.Vec* %203, i64 %202
  %205 = getelementptr inbounds %struct.Vec* %r, i32 0, i32 0
  %206 = load double* %205, align 8
  %207 = call double @_Z5clampd(double %206)
  %208 = getelementptr inbounds %struct.Vec* %r, i32 0, i32 1
  %209 = load double* %208, align 8
  %210 = call double @_Z5clampd(double %209)
  %211 = getelementptr inbounds %struct.Vec* %r, i32 0, i32 2
  %212 = load double* %211, align 8
  %213 = call double @_Z5clampd(double %212)
  call void @_ZN3VecC2Eddd(%struct.Vec* %22, double %207, double %210, double %213)
  call void @_ZNK3VecmlEd(%struct.Vec* sret %21, %struct.Vec* %22, double 2.500000e-01)
  call void @_ZNK3VecplERKS_(%struct.Vec* sret %20, %struct.Vec* %204, %struct.Vec* dereferenceable(24) %21)
  %214 = bitcast %struct.Vec* %200 to i8*
  %215 = bitcast %struct.Vec* %20 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %214, i8* %215, i64 24, i32 8, i1 false)
  br label %216

; <label>:216                                     ; preds = %196
  %217 = load i32* %sx, align 4
  %218 = add nsw i32 %217, 1
  store i32 %218, i32* %sx, align 4
  call void @_ZN3VecC2Eddd(%struct.Vec* %23, double 0.000000e+00, double 0.000000e+00, double 0.000000e+00)
  %219 = bitcast %struct.Vec* %r to i8*
  %220 = bitcast %struct.Vec* %23 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %219, i8* %220, i64 24, i32 8, i1 false)
  br label %110

; <label>:221                                     ; preds = %110
  br label %222

; <label>:222                                     ; preds = %221
  %223 = load i32* %sy, align 4
  %224 = add nsw i32 %223, 1
  store i32 %224, i32* %sy, align 4
  br label %106

; <label>:225                                     ; preds = %106
  br label %226

; <label>:226                                     ; preds = %225
  %227 = load i16* %x, align 2
  %228 = add i16 %227, 1
  store i16 %228, i16* %x, align 2
  br label %91

; <label>:229                                     ; preds = %91
  br label %230

; <label>:230                                     ; preds = %229
  %231 = load i32* %y, align 4
  %232 = add nsw i32 %231, 1
  store i32 %232, i32* %y, align 4
  br label %66

; <label>:233                                     ; preds = %66
  %234 = call i64 @time(i64* null) #3
  store i64 %234, i64* %End_t, align 8
  %235 = load %struct._IO_FILE** @stdout, align 8
  %236 = load i64* %End_t, align 8
  %237 = load i64* %Start_t, align 8
  %238 = call double @difftime(i64 %236, i64 %237) #7
  %239 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %235, i8* getelementptr inbounds ([29 x i8]* @.str1, i32 0, i32 0), double %238)
  %240 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([10 x i8]* @.str2, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @.str3, i32 0, i32 0))
  store %struct._IO_FILE* %240, %struct._IO_FILE** %f, align 8
  %241 = load %struct._IO_FILE** %f, align 8
  %242 = load i32* %w, align 4
  %243 = load i32* %h, align 4
  %244 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %241, i8* getelementptr inbounds ([13 x i8]* @.str4, i32 0, i32 0), i32 %242, i32 %243, i32 255)
  store i32 0, i32* %i1, align 4
  br label %245

; <label>:245                                     ; preds = %275, %233
  %246 = load i32* %i1, align 4
  %247 = load i32* %w, align 4
  %248 = load i32* %h, align 4
  %249 = mul nsw i32 %247, %248
  %250 = icmp slt i32 %246, %249
  br i1 %250, label %251, label %278

; <label>:251                                     ; preds = %245
  %252 = load %struct._IO_FILE** %f, align 8
  %253 = load i32* %i1, align 4
  %254 = sext i32 %253 to i64
  %255 = load %struct.Vec** %c, align 8
  %256 = getelementptr inbounds %struct.Vec* %255, i64 %254
  %257 = getelementptr inbounds %struct.Vec* %256, i32 0, i32 0
  %258 = load double* %257, align 8
  %259 = call i32 @_Z5toIntd(double %258)
  %260 = load i32* %i1, align 4
  %261 = sext i32 %260 to i64
  %262 = load %struct.Vec** %c, align 8
  %263 = getelementptr inbounds %struct.Vec* %262, i64 %261
  %264 = getelementptr inbounds %struct.Vec* %263, i32 0, i32 1
  %265 = load double* %264, align 8
  %266 = call i32 @_Z5toIntd(double %265)
  %267 = load i32* %i1, align 4
  %268 = sext i32 %267 to i64
  %269 = load %struct.Vec** %c, align 8
  %270 = getelementptr inbounds %struct.Vec* %269, i64 %268
  %271 = getelementptr inbounds %struct.Vec* %270, i32 0, i32 2
  %272 = load double* %271, align 8
  %273 = call i32 @_Z5toIntd(double %272)
  %274 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %252, i8* getelementptr inbounds ([10 x i8]* @.str5, i32 0, i32 0), i32 %259, i32 %266, i32 %273)
  br label %275

; <label>:275                                     ; preds = %251
  %276 = load i32* %i1, align 4
  %277 = add nsw i32 %276, 1
  store i32 %277, i32* %i1, align 4
  br label %245

; <label>:278                                     ; preds = %245
  %279 = load i32* %1
  ret i32 %279

; <label>:280                                     ; preds = %192
  %281 = load i8** %8
  %282 = load i32* %9
  %283 = insertvalue { i8*, i32 } undef, i8* %281, 0
  %284 = insertvalue { i8*, i32 } %283, i32 %282, 1
  resume { i8*, i32 } %284
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
  %1 = alloca double, align 8
  store double %x, double* %1, align 8
  %2 = load double* %1, align 8
  %3 = fcmp olt double %2, 0.000000e+00
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  br label %13

; <label>:5                                       ; preds = %0
  %6 = load double* %1, align 8
  %7 = fcmp ogt double %6, 1.000000e+00
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %5
  br label %11

; <label>:9                                       ; preds = %5
  %10 = load double* %1, align 8
  br label %11

; <label>:11                                      ; preds = %9, %8
  %12 = phi double [ 1.000000e+00, %8 ], [ %10, %9 ]
  br label %13

; <label>:13                                      ; preds = %11, %4
  %14 = phi double [ 0.000000e+00, %4 ], [ %12, %11 ]
  ret double %14
}

; Function Attrs: nounwind readnone
declare double @difftime(i64, i64) #5

declare %struct._IO_FILE* @fopen(i8*, i8*) #10

; Function Attrs: inlinehint uwtable
define linkonce_odr i32 @_Z5toIntd(double %x) #2 {
  %1 = alloca double, align 8
  store double %x, double* %1, align 8
  %2 = load double* %1, align 8
  %3 = call double @_Z5clampd(double %2)
  %4 = call double @pow(double %3, double 0x3FDD1745D1745D17) #3
  %5 = fmul double %4, 2.550000e+02
  %6 = fadd double %5, 5.000000e-01
  %7 = fptosi double %6 to i32
  ret i32 %7
}

; Function Attrs: nounwind
declare double @pow(double, double) #4

; Function Attrs: uwtable
define linkonce_odr double @_ZNK6Sphere9intersectERK3Ray(%struct.Sphere* %this, %struct.Ray* dereferenceable(48) %r) #1 align 2 {
  %1 = alloca double, align 8
  %2 = alloca %struct.Sphere*, align 8
  %3 = alloca %struct.Ray*, align 8
  %op = alloca %struct.Vec, align 8
  %t = alloca double, align 8
  %eps = alloca double, align 8
  %b = alloca double, align 8
  %det = alloca double, align 8
  store %struct.Sphere* %this, %struct.Sphere** %2, align 8
  store %struct.Ray* %r, %struct.Ray** %3, align 8
  %4 = load %struct.Sphere** %2
  %5 = getelementptr inbounds %struct.Sphere* %4, i32 0, i32 1
  %6 = load %struct.Ray** %3, align 8
  %7 = getelementptr inbounds %struct.Ray* %6, i32 0, i32 0
  call void @_ZNK3VecmiERKS_(%struct.Vec* sret %op, %struct.Vec* %5, %struct.Vec* dereferenceable(24) %7)
  store double 1.000000e-04, double* %eps, align 8
  %8 = load %struct.Ray** %3, align 8
  %9 = getelementptr inbounds %struct.Ray* %8, i32 0, i32 1
  %10 = call double @_ZNK3Vec3dotERKS_(%struct.Vec* %op, %struct.Vec* dereferenceable(24) %9)
  store double %10, double* %b, align 8
  %11 = load double* %b, align 8
  %12 = load double* %b, align 8
  %13 = fmul double %11, %12
  %14 = call double @_ZNK3Vec3dotERKS_(%struct.Vec* %op, %struct.Vec* dereferenceable(24) %op)
  %15 = fsub double %13, %14
  %16 = getelementptr inbounds %struct.Sphere* %4, i32 0, i32 0
  %17 = load double* %16, align 8
  %18 = getelementptr inbounds %struct.Sphere* %4, i32 0, i32 0
  %19 = load double* %18, align 8
  %20 = fmul double %17, %19
  %21 = fadd double %15, %20
  store double %21, double* %det, align 8
  %22 = load double* %det, align 8
  %23 = fcmp olt double %22, 0.000000e+00
  br i1 %23, label %24, label %25

; <label>:24                                      ; preds = %0
  store double 0.000000e+00, double* %1
  br label %49

; <label>:25                                      ; preds = %0
  %26 = load double* %det, align 8
  %27 = call double @sqrt(double %26) #3
  store double %27, double* %det, align 8
  br label %28

; <label>:28                                      ; preds = %25
  %29 = load double* %b, align 8
  %30 = load double* %det, align 8
  %31 = fsub double %29, %30
  store double %31, double* %t, align 8
  %32 = load double* %eps, align 8
  %33 = fcmp ogt double %31, %32
  br i1 %33, label %34, label %36

; <label>:34                                      ; preds = %28
  %35 = load double* %t, align 8
  br label %47

; <label>:36                                      ; preds = %28
  %37 = load double* %b, align 8
  %38 = load double* %det, align 8
  %39 = fadd double %37, %38
  store double %39, double* %t, align 8
  %40 = load double* %eps, align 8
  %41 = fcmp ogt double %39, %40
  br i1 %41, label %42, label %44

; <label>:42                                      ; preds = %36
  %43 = load double* %t, align 8
  br label %45

; <label>:44                                      ; preds = %36
  br label %45

; <label>:45                                      ; preds = %44, %42
  %46 = phi double [ %43, %42 ], [ 0.000000e+00, %44 ]
  br label %47

; <label>:47                                      ; preds = %45, %34
  %48 = phi double [ %35, %34 ], [ %46, %45 ]
  store double %48, double* %1
  br label %49

; <label>:49                                      ; preds = %47, %24
  %50 = load double* %1
  ret double %50
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
