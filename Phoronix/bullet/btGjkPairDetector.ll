; ModuleID = 'btGjkPairDetector.cpp'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%class.btGjkPairDetector = type { %struct.btDiscreteCollisionDetectorInterface, %class.btVector3, %class.btConvexPenetrationDepthSolver*, %class.btVoronoiSimplexSolver*, %class.btConvexShape*, %class.btConvexShape*, i32, i32, float, float, i8, float, i32, i32, i32, i32 }
%struct.btDiscreteCollisionDetectorInterface = type { i32 (...)** }
%class.btVector3 = type { [4 x float] }
%class.btConvexShape = type { %class.btCollisionShape }
%class.btCollisionShape = type { i32 (...)**, i32, i8* }
%class.btVoronoiSimplexSolver = type <{ i32, [5 x %class.btVector3], [5 x %class.btVector3], [5 x %class.btVector3], %class.btVector3, %class.btVector3, %class.btVector3, %class.btVector3, float, i8, [3 x i8], %struct.btSubSimplexClosestResult, i8, [3 x i8] }>
%struct.btSubSimplexClosestResult = type <{ %class.btVector3, %struct.btUsageBitfield, [2 x i8], [4 x float], i8, [3 x i8] }>
%struct.btUsageBitfield = type { i8, i8 }
%class.btConvexPenetrationDepthSolver = type { i32 (...)** }
%"struct.btDiscreteCollisionDetectorInterface::ClosestPointInput" = type { %class.btTransform, %class.btTransform, float, %class.btStackAlloc* }
%class.btTransform = type { %class.btMatrix3x3, %class.btVector3 }
%class.btMatrix3x3 = type { [3 x %class.btVector3] }
%class.btStackAlloc = type opaque
%"struct.btDiscreteCollisionDetectorInterface::Result" = type { i32 (...)** }
%class.btIDebugDraw = type opaque

@gNumDeepPenetrationChecks = global i32 0, align 4
@gNumGjkChecks = global i32 0, align 4
@_ZTV17btGjkPairDetector = unnamed_addr constant [5 x i8*] [i8* null, i8* bitcast ({ i8*, i8*, i8* }* @_ZTI17btGjkPairDetector to i8*), i8* bitcast (void (%class.btGjkPairDetector*)* @_ZN17btGjkPairDetectorD2Ev to i8*), i8* bitcast (void (%class.btGjkPairDetector*)* @_ZN17btGjkPairDetectorD0Ev to i8*), i8* bitcast (void (%class.btGjkPairDetector*, %"struct.btDiscreteCollisionDetectorInterface::ClosestPointInput"*, %"struct.btDiscreteCollisionDetectorInterface::Result"*, %class.btIDebugDraw*, i1)* @_ZN17btGjkPairDetector16getClosestPointsERKN36btDiscreteCollisionDetectorInterface17ClosestPointInputERNS0_6ResultEP12btIDebugDrawb to i8*)], align 8
@_ZTVN10__cxxabiv120__si_class_type_infoE = external global i8*
@_ZTS17btGjkPairDetector = constant [20 x i8] c"17btGjkPairDetector\00"
@_ZTVN10__cxxabiv117__class_type_infoE = external global i8*
@_ZTS36btDiscreteCollisionDetectorInterface = linkonce_odr constant [39 x i8] c"36btDiscreteCollisionDetectorInterface\00"
@_ZTI36btDiscreteCollisionDetectorInterface = linkonce_odr constant { i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8** @_ZTVN10__cxxabiv117__class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([39 x i8]* @_ZTS36btDiscreteCollisionDetectorInterface, i32 0, i32 0) }
@_ZTI17btGjkPairDetector = constant { i8*, i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8** @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([20 x i8]* @_ZTS17btGjkPairDetector, i32 0, i32 0), i8* bitcast ({ i8*, i8* }* @_ZTI36btDiscreteCollisionDetectorInterface to i8*) }
@_ZTV36btDiscreteCollisionDetectorInterface = linkonce_odr unnamed_addr constant [5 x i8*] [i8* null, i8* bitcast ({ i8*, i8* }* @_ZTI36btDiscreteCollisionDetectorInterface to i8*), i8* bitcast (void (%struct.btDiscreteCollisionDetectorInterface*)* @_ZN36btDiscreteCollisionDetectorInterfaceD2Ev to i8*), i8* bitcast (void (%struct.btDiscreteCollisionDetectorInterface*)* @_ZN36btDiscreteCollisionDetectorInterfaceD0Ev to i8*), i8* bitcast (void ()* @__cxa_pure_virtual to i8*)], align 8

@_ZN17btGjkPairDetectorC1EPK13btConvexShapeS2_P22btVoronoiSimplexSolverP30btConvexPenetrationDepthSolver = alias void (%class.btGjkPairDetector*, %class.btConvexShape*, %class.btConvexShape*, %class.btVoronoiSimplexSolver*, %class.btConvexPenetrationDepthSolver*)* @_ZN17btGjkPairDetectorC2EPK13btConvexShapeS2_P22btVoronoiSimplexSolverP30btConvexPenetrationDepthSolver
@_ZN17btGjkPairDetectorC1EPK13btConvexShapeS2_iiffP22btVoronoiSimplexSolverP30btConvexPenetrationDepthSolver = alias void (%class.btGjkPairDetector*, %class.btConvexShape*, %class.btConvexShape*, i32, i32, float, float, %class.btVoronoiSimplexSolver*, %class.btConvexPenetrationDepthSolver*)* @_ZN17btGjkPairDetectorC2EPK13btConvexShapeS2_iiffP22btVoronoiSimplexSolverP30btConvexPenetrationDepthSolver

; Function Attrs: uwtable
define void @_ZN17btGjkPairDetectorC2EPK13btConvexShapeS2_P22btVoronoiSimplexSolverP30btConvexPenetrationDepthSolver(%class.btGjkPairDetector* %this, %class.btConvexShape* %objectA, %class.btConvexShape* %objectB, %class.btVoronoiSimplexSolver* %simplexSolver, %class.btConvexPenetrationDepthSolver* %penetrationDepthSolver) unnamed_addr #0 align 2 {
  %1 = alloca %class.btGjkPairDetector*, align 8
  %2 = alloca %class.btConvexShape*, align 8
  %3 = alloca %class.btConvexShape*, align 8
  %4 = alloca %class.btVoronoiSimplexSolver*, align 8
  %5 = alloca %class.btConvexPenetrationDepthSolver*, align 8
  %6 = alloca float, align 4
  %7 = alloca float, align 4
  %8 = alloca float, align 4
  %9 = alloca i8*
  %10 = alloca i32
  store %class.btGjkPairDetector* %this, %class.btGjkPairDetector** %1, align 8
  store %class.btConvexShape* %objectA, %class.btConvexShape** %2, align 8
  store %class.btConvexShape* %objectB, %class.btConvexShape** %3, align 8
  store %class.btVoronoiSimplexSolver* %simplexSolver, %class.btVoronoiSimplexSolver** %4, align 8
  store %class.btConvexPenetrationDepthSolver* %penetrationDepthSolver, %class.btConvexPenetrationDepthSolver** %5, align 8
  %11 = load %class.btGjkPairDetector** %1
  %12 = bitcast %class.btGjkPairDetector* %11 to %struct.btDiscreteCollisionDetectorInterface*
  call void @_ZN36btDiscreteCollisionDetectorInterfaceC2Ev(%struct.btDiscreteCollisionDetectorInterface* %12) #6
  %13 = bitcast %class.btGjkPairDetector* %11 to i32 (...)***
  store i32 (...)** bitcast (i8** getelementptr inbounds ([5 x i8*]* @_ZTV17btGjkPairDetector, i64 0, i64 2) to i32 (...)**), i32 (...)*** %13
  %14 = getelementptr inbounds %class.btGjkPairDetector* %11, i32 0, i32 1
  store float 0.000000e+00, float* %6
  store float 1.000000e+00, float* %7
  store float 0.000000e+00, float* %8
  invoke void @_ZN9btVector3C2ERKfS1_S1_(%class.btVector3* %14, float* dereferenceable(4) %6, float* dereferenceable(4) %7, float* dereferenceable(4) %8)
          to label %15 unwind label %53

; <label>:15                                      ; preds = %0
  %16 = getelementptr inbounds %class.btGjkPairDetector* %11, i32 0, i32 2
  %17 = load %class.btConvexPenetrationDepthSolver** %5, align 8
  store %class.btConvexPenetrationDepthSolver* %17, %class.btConvexPenetrationDepthSolver** %16, align 8
  %18 = getelementptr inbounds %class.btGjkPairDetector* %11, i32 0, i32 3
  %19 = load %class.btVoronoiSimplexSolver** %4, align 8
  store %class.btVoronoiSimplexSolver* %19, %class.btVoronoiSimplexSolver** %18, align 8
  %20 = getelementptr inbounds %class.btGjkPairDetector* %11, i32 0, i32 4
  %21 = load %class.btConvexShape** %2, align 8
  store %class.btConvexShape* %21, %class.btConvexShape** %20, align 8
  %22 = getelementptr inbounds %class.btGjkPairDetector* %11, i32 0, i32 5
  %23 = load %class.btConvexShape** %3, align 8
  store %class.btConvexShape* %23, %class.btConvexShape** %22, align 8
  %24 = getelementptr inbounds %class.btGjkPairDetector* %11, i32 0, i32 6
  %25 = load %class.btConvexShape** %2, align 8
  %26 = bitcast %class.btConvexShape* %25 to %class.btCollisionShape*
  %27 = invoke i32 @_ZNK16btCollisionShape12getShapeTypeEv(%class.btCollisionShape* %26)
          to label %28 unwind label %53

; <label>:28                                      ; preds = %15
  store i32 %27, i32* %24, align 4
  %29 = getelementptr inbounds %class.btGjkPairDetector* %11, i32 0, i32 7
  %30 = load %class.btConvexShape** %3, align 8
  %31 = bitcast %class.btConvexShape* %30 to %class.btCollisionShape*
  %32 = invoke i32 @_ZNK16btCollisionShape12getShapeTypeEv(%class.btCollisionShape* %31)
          to label %33 unwind label %53

; <label>:33                                      ; preds = %28
  store i32 %32, i32* %29, align 4
  %34 = getelementptr inbounds %class.btGjkPairDetector* %11, i32 0, i32 8
  %35 = load %class.btConvexShape** %2, align 8
  %36 = bitcast %class.btConvexShape* %35 to float (%class.btConvexShape*)***
  %37 = load float (%class.btConvexShape*)*** %36
  %38 = getelementptr inbounds float (%class.btConvexShape*)** %37, i64 12
  %39 = load float (%class.btConvexShape*)** %38
  %40 = invoke float %39(%class.btConvexShape* %35)
          to label %41 unwind label %53

; <label>:41                                      ; preds = %33
  store float %40, float* %34, align 4
  %42 = getelementptr inbounds %class.btGjkPairDetector* %11, i32 0, i32 9
  %43 = load %class.btConvexShape** %3, align 8
  %44 = bitcast %class.btConvexShape* %43 to float (%class.btConvexShape*)***
  %45 = load float (%class.btConvexShape*)*** %44
  %46 = getelementptr inbounds float (%class.btConvexShape*)** %45, i64 12
  %47 = load float (%class.btConvexShape*)** %46
  %48 = invoke float %47(%class.btConvexShape* %43)
          to label %49 unwind label %53

; <label>:49                                      ; preds = %41
  store float %48, float* %42, align 4
  %50 = getelementptr inbounds %class.btGjkPairDetector* %11, i32 0, i32 10
  store i8 0, i8* %50, align 1
  %51 = getelementptr inbounds %class.btGjkPairDetector* %11, i32 0, i32 12
  store i32 -1, i32* %51, align 4
  %52 = getelementptr inbounds %class.btGjkPairDetector* %11, i32 0, i32 15
  store i32 1, i32* %52, align 4
  ret void

; <label>:53                                      ; preds = %41, %33, %28, %15, %0
  %54 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
  %55 = extractvalue { i8*, i32 } %54, 0
  store i8* %55, i8** %9
  %56 = extractvalue { i8*, i32 } %54, 1
  store i32 %56, i32* %10
  %57 = bitcast %class.btGjkPairDetector* %11 to %struct.btDiscreteCollisionDetectorInterface*
  invoke void @_ZN36btDiscreteCollisionDetectorInterfaceD2Ev(%struct.btDiscreteCollisionDetectorInterface* %57)
          to label %58 unwind label %64

; <label>:58                                      ; preds = %53
  br label %59

; <label>:59                                      ; preds = %58
  %60 = load i8** %9
  %61 = load i32* %10
  %62 = insertvalue { i8*, i32 } undef, i8* %60, 0
  %63 = insertvalue { i8*, i32 } %62, i32 %61, 1
  resume { i8*, i32 } %63

; <label>:64                                      ; preds = %53
  %65 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          catch i8* null
  %66 = extractvalue { i8*, i32 } %65, 0
  call void @__clang_call_terminate(i8* %66) #9
  unreachable
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr void @_ZN36btDiscreteCollisionDetectorInterfaceC2Ev(%struct.btDiscreteCollisionDetectorInterface* %this) unnamed_addr #1 align 2 {
  %1 = alloca %struct.btDiscreteCollisionDetectorInterface*, align 8
  store %struct.btDiscreteCollisionDetectorInterface* %this, %struct.btDiscreteCollisionDetectorInterface** %1, align 8
  %2 = load %struct.btDiscreteCollisionDetectorInterface** %1
  %3 = bitcast %struct.btDiscreteCollisionDetectorInterface* %2 to i32 (...)***
  store i32 (...)** bitcast (i8** getelementptr inbounds ([5 x i8*]* @_ZTV36btDiscreteCollisionDetectorInterface, i64 0, i64 2) to i32 (...)**), i32 (...)*** %3
  ret void
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr void @_ZN9btVector3C2ERKfS1_S1_(%class.btVector3* %this, float* dereferenceable(4) %_x, float* dereferenceable(4) %_y, float* dereferenceable(4) %_z) unnamed_addr #1 align 2 {
  %1 = alloca %class.btVector3*, align 8
  %2 = alloca float*, align 8
  %3 = alloca float*, align 8
  %4 = alloca float*, align 8
  store %class.btVector3* %this, %class.btVector3** %1, align 8
  store float* %_x, float** %2, align 8
  store float* %_y, float** %3, align 8
  store float* %_z, float** %4, align 8
  %5 = load %class.btVector3** %1
  %6 = load float** %2, align 8
  %7 = load float* %6, align 4
  %8 = getelementptr inbounds %class.btVector3* %5, i32 0, i32 0
  %9 = getelementptr inbounds [4 x float]* %8, i32 0, i64 0
  store float %7, float* %9, align 4
  %10 = load float** %3, align 8
  %11 = load float* %10, align 4
  %12 = getelementptr inbounds %class.btVector3* %5, i32 0, i32 0
  %13 = getelementptr inbounds [4 x float]* %12, i32 0, i64 1
  store float %11, float* %13, align 4
  %14 = load float** %4, align 8
  %15 = load float* %14, align 4
  %16 = getelementptr inbounds %class.btVector3* %5, i32 0, i32 0
  %17 = getelementptr inbounds [4 x float]* %16, i32 0, i64 2
  store float %15, float* %17, align 4
  %18 = getelementptr inbounds %class.btVector3* %5, i32 0, i32 0
  %19 = getelementptr inbounds [4 x float]* %18, i32 0, i64 3
  store float 0.000000e+00, float* %19, align 4
  ret void
}

declare i32 @__gxx_personality_v0(...)

; Function Attrs: nounwind uwtable
define linkonce_odr i32 @_ZNK16btCollisionShape12getShapeTypeEv(%class.btCollisionShape* %this) #2 align 2 {
  %1 = alloca %class.btCollisionShape*, align 8
  store %class.btCollisionShape* %this, %class.btCollisionShape** %1, align 8
  %2 = load %class.btCollisionShape** %1
  %3 = getelementptr inbounds %class.btCollisionShape* %2, i32 0, i32 1
  %4 = load i32* %3, align 4
  ret i32 %4
}

; Function Attrs: noinline noreturn nounwind
define linkonce_odr hidden void @__clang_call_terminate(i8*) #3 {
  %2 = call i8* @__cxa_begin_catch(i8* %0) #6
  call void @_ZSt9terminatev() #9
  unreachable
}

declare i8* @__cxa_begin_catch(i8*)

declare void @_ZSt9terminatev()

; Function Attrs: uwtable
define void @_ZN17btGjkPairDetectorC2EPK13btConvexShapeS2_iiffP22btVoronoiSimplexSolverP30btConvexPenetrationDepthSolver(%class.btGjkPairDetector* %this, %class.btConvexShape* %objectA, %class.btConvexShape* %objectB, i32 %shapeTypeA, i32 %shapeTypeB, float %marginA, float %marginB, %class.btVoronoiSimplexSolver* %simplexSolver, %class.btConvexPenetrationDepthSolver* %penetrationDepthSolver) unnamed_addr #0 align 2 {
  %1 = alloca %class.btGjkPairDetector*, align 8
  %2 = alloca %class.btConvexShape*, align 8
  %3 = alloca %class.btConvexShape*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca float, align 4
  %7 = alloca float, align 4
  %8 = alloca %class.btVoronoiSimplexSolver*, align 8
  %9 = alloca %class.btConvexPenetrationDepthSolver*, align 8
  %10 = alloca float, align 4
  %11 = alloca float, align 4
  %12 = alloca float, align 4
  %13 = alloca i8*
  %14 = alloca i32
  store %class.btGjkPairDetector* %this, %class.btGjkPairDetector** %1, align 8
  store %class.btConvexShape* %objectA, %class.btConvexShape** %2, align 8
  store %class.btConvexShape* %objectB, %class.btConvexShape** %3, align 8
  store i32 %shapeTypeA, i32* %4, align 4
  store i32 %shapeTypeB, i32* %5, align 4
  store float %marginA, float* %6, align 4
  store float %marginB, float* %7, align 4
  store %class.btVoronoiSimplexSolver* %simplexSolver, %class.btVoronoiSimplexSolver** %8, align 8
  store %class.btConvexPenetrationDepthSolver* %penetrationDepthSolver, %class.btConvexPenetrationDepthSolver** %9, align 8
  %15 = load %class.btGjkPairDetector** %1
  %16 = bitcast %class.btGjkPairDetector* %15 to %struct.btDiscreteCollisionDetectorInterface*
  call void @_ZN36btDiscreteCollisionDetectorInterfaceC2Ev(%struct.btDiscreteCollisionDetectorInterface* %16) #6
  %17 = bitcast %class.btGjkPairDetector* %15 to i32 (...)***
  store i32 (...)** bitcast (i8** getelementptr inbounds ([5 x i8*]* @_ZTV17btGjkPairDetector, i64 0, i64 2) to i32 (...)**), i32 (...)*** %17
  %18 = getelementptr inbounds %class.btGjkPairDetector* %15, i32 0, i32 1
  store float 0.000000e+00, float* %10
  store float 1.000000e+00, float* %11
  store float 0.000000e+00, float* %12
  invoke void @_ZN9btVector3C2ERKfS1_S1_(%class.btVector3* %18, float* dereferenceable(4) %10, float* dereferenceable(4) %11, float* dereferenceable(4) %12)
          to label %19 unwind label %39

; <label>:19                                      ; preds = %0
  %20 = getelementptr inbounds %class.btGjkPairDetector* %15, i32 0, i32 2
  %21 = load %class.btConvexPenetrationDepthSolver** %9, align 8
  store %class.btConvexPenetrationDepthSolver* %21, %class.btConvexPenetrationDepthSolver** %20, align 8
  %22 = getelementptr inbounds %class.btGjkPairDetector* %15, i32 0, i32 3
  %23 = load %class.btVoronoiSimplexSolver** %8, align 8
  store %class.btVoronoiSimplexSolver* %23, %class.btVoronoiSimplexSolver** %22, align 8
  %24 = getelementptr inbounds %class.btGjkPairDetector* %15, i32 0, i32 4
  %25 = load %class.btConvexShape** %2, align 8
  store %class.btConvexShape* %25, %class.btConvexShape** %24, align 8
  %26 = getelementptr inbounds %class.btGjkPairDetector* %15, i32 0, i32 5
  %27 = load %class.btConvexShape** %3, align 8
  store %class.btConvexShape* %27, %class.btConvexShape** %26, align 8
  %28 = getelementptr inbounds %class.btGjkPairDetector* %15, i32 0, i32 6
  %29 = load i32* %4, align 4
  store i32 %29, i32* %28, align 4
  %30 = getelementptr inbounds %class.btGjkPairDetector* %15, i32 0, i32 7
  %31 = load i32* %5, align 4
  store i32 %31, i32* %30, align 4
  %32 = getelementptr inbounds %class.btGjkPairDetector* %15, i32 0, i32 8
  %33 = load float* %6, align 4
  store float %33, float* %32, align 4
  %34 = getelementptr inbounds %class.btGjkPairDetector* %15, i32 0, i32 9
  %35 = load float* %7, align 4
  store float %35, float* %34, align 4
  %36 = getelementptr inbounds %class.btGjkPairDetector* %15, i32 0, i32 10
  store i8 0, i8* %36, align 1
  %37 = getelementptr inbounds %class.btGjkPairDetector* %15, i32 0, i32 12
  store i32 -1, i32* %37, align 4
  %38 = getelementptr inbounds %class.btGjkPairDetector* %15, i32 0, i32 15
  store i32 1, i32* %38, align 4
  ret void

; <label>:39                                      ; preds = %0
  %40 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
  %41 = extractvalue { i8*, i32 } %40, 0
  store i8* %41, i8** %13
  %42 = extractvalue { i8*, i32 } %40, 1
  store i32 %42, i32* %14
  %43 = bitcast %class.btGjkPairDetector* %15 to %struct.btDiscreteCollisionDetectorInterface*
  invoke void @_ZN36btDiscreteCollisionDetectorInterfaceD2Ev(%struct.btDiscreteCollisionDetectorInterface* %43)
          to label %44 unwind label %50

; <label>:44                                      ; preds = %39
  br label %45

; <label>:45                                      ; preds = %44
  %46 = load i8** %13
  %47 = load i32* %14
  %48 = insertvalue { i8*, i32 } undef, i8* %46, 0
  %49 = insertvalue { i8*, i32 } %48, i32 %47, 1
  resume { i8*, i32 } %49

; <label>:50                                      ; preds = %39
  %51 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          catch i8* null
  %52 = extractvalue { i8*, i32 } %51, 0
  call void @__clang_call_terminate(i8* %52) #9
  unreachable
}

; Function Attrs: uwtable
define void @_ZN17btGjkPairDetector16getClosestPointsERKN36btDiscreteCollisionDetectorInterface17ClosestPointInputERNS0_6ResultEP12btIDebugDrawb(%class.btGjkPairDetector* %this, %"struct.btDiscreteCollisionDetectorInterface::ClosestPointInput"* dereferenceable(144) %input, %"struct.btDiscreteCollisionDetectorInterface::Result"* dereferenceable(8) %output, %class.btIDebugDraw* %debugDraw, i1 zeroext %swapResults) unnamed_addr #0 align 2 {
  %1 = alloca %class.btGjkPairDetector*, align 8
  %2 = alloca %"struct.btDiscreteCollisionDetectorInterface::ClosestPointInput"*, align 8
  %3 = alloca %"struct.btDiscreteCollisionDetectorInterface::Result"*, align 8
  %4 = alloca %class.btIDebugDraw*, align 8
  %5 = alloca i8, align 1
  store %class.btGjkPairDetector* %this, %class.btGjkPairDetector** %1, align 8
  store %"struct.btDiscreteCollisionDetectorInterface::ClosestPointInput"* %input, %"struct.btDiscreteCollisionDetectorInterface::ClosestPointInput"** %2, align 8
  store %"struct.btDiscreteCollisionDetectorInterface::Result"* %output, %"struct.btDiscreteCollisionDetectorInterface::Result"** %3, align 8
  store %class.btIDebugDraw* %debugDraw, %class.btIDebugDraw** %4, align 8
  %6 = zext i1 %swapResults to i8
  store i8 %6, i8* %5, align 1
  %7 = load %class.btGjkPairDetector** %1
  %8 = load %"struct.btDiscreteCollisionDetectorInterface::ClosestPointInput"** %2, align 8
  %9 = load %"struct.btDiscreteCollisionDetectorInterface::Result"** %3, align 8
  %10 = load %class.btIDebugDraw** %4, align 8
  call void @_ZN17btGjkPairDetector26getClosestPointsNonVirtualERKN36btDiscreteCollisionDetectorInterface17ClosestPointInputERNS0_6ResultEP12btIDebugDraw(%class.btGjkPairDetector* %7, %"struct.btDiscreteCollisionDetectorInterface::ClosestPointInput"* dereferenceable(144) %8, %"struct.btDiscreteCollisionDetectorInterface::Result"* dereferenceable(8) %9, %class.btIDebugDraw* %10)
  ret void
}

; Function Attrs: uwtable
define void @_ZN17btGjkPairDetector26getClosestPointsNonVirtualERKN36btDiscreteCollisionDetectorInterface17ClosestPointInputERNS0_6ResultEP12btIDebugDraw(%class.btGjkPairDetector* %this, %"struct.btDiscreteCollisionDetectorInterface::ClosestPointInput"* dereferenceable(144) %input, %"struct.btDiscreteCollisionDetectorInterface::Result"* dereferenceable(8) %output, %class.btIDebugDraw* %debugDraw) #0 align 2 {
  %1 = alloca %class.btGjkPairDetector*, align 8
  %2 = alloca %"struct.btDiscreteCollisionDetectorInterface::ClosestPointInput"*, align 8
  %3 = alloca %"struct.btDiscreteCollisionDetectorInterface::Result"*, align 8
  %4 = alloca %class.btIDebugDraw*, align 8
  %distance = alloca float, align 4
  %normalInB = alloca %class.btVector3, align 4
  %5 = alloca float, align 4
  %6 = alloca float, align 4
  %7 = alloca float, align 4
  %pointOnA = alloca %class.btVector3, align 4
  %pointOnB = alloca %class.btVector3, align 4
  %localTransA = alloca %class.btTransform, align 4
  %localTransB = alloca %class.btTransform, align 4
  %positionOffset = alloca %class.btVector3, align 4
  %8 = alloca %class.btVector3, align 4
  %9 = alloca float, align 4
  %check2d = alloca i8, align 1
  %marginA = alloca float, align 4
  %marginB = alloca float, align 4
  %gGjkMaxIter = alloca i32, align 4
  %10 = alloca float, align 4
  %11 = alloca float, align 4
  %12 = alloca float, align 4
  %isValid = alloca i8, align 1
  %checkSimplex = alloca i8, align 1
  %checkPenetration = alloca i8, align 1
  %squaredDistance = alloca float, align 4
  %delta = alloca float, align 4
  %margin = alloca float, align 4
  %seperatingAxisInA = alloca %class.btVector3, align 4
  %13 = alloca %class.btVector3, align 4
  %seperatingAxisInB = alloca %class.btVector3, align 4
  %pInA = alloca %class.btVector3, align 4
  %qInB = alloca %class.btVector3, align 4
  %pWorld = alloca %class.btVector3, align 4
  %qWorld = alloca %class.btVector3, align 4
  %w = alloca %class.btVector3, align 4
  %f0 = alloca float, align 4
  %f1 = alloca float, align 4
  %newCachedSeparatingAxis = alloca %class.btVector3, align 4
  %previousSquaredDistance = alloca float, align 4
  %check = alloca i8, align 1
  %lenSqr = alloca float, align 4
  %rlen = alloca float, align 4
  %s = alloca float, align 4
  %14 = alloca %class.btVector3, align 4
  %15 = alloca float, align 4
  %16 = alloca %class.btVector3, align 4
  %17 = alloca float, align 4
  %catchDegeneratePenetrationCase = alloca i8, align 1
  %tmpPointOnA = alloca %class.btVector3, align 4
  %tmpPointOnB = alloca %class.btVector3, align 4
  %isValid2 = alloca i8, align 1
  %tmpNormalInB = alloca %class.btVector3, align 4
  %lenSqr1 = alloca float, align 4
  %18 = alloca float, align 4
  %distance2 = alloca float, align 4
  %19 = alloca %class.btVector3, align 4
  %distance22 = alloca float, align 4
  %20 = alloca %class.btVector3, align 4
  %21 = alloca %class.btVector3, align 4
  %22 = alloca %class.btVector3, align 4
  %23 = alloca %class.btVector3, align 4
  store %class.btGjkPairDetector* %this, %class.btGjkPairDetector** %1, align 8
  store %"struct.btDiscreteCollisionDetectorInterface::ClosestPointInput"* %input, %"struct.btDiscreteCollisionDetectorInterface::ClosestPointInput"** %2, align 8
  store %"struct.btDiscreteCollisionDetectorInterface::Result"* %output, %"struct.btDiscreteCollisionDetectorInterface::Result"** %3, align 8
  store %class.btIDebugDraw* %debugDraw, %class.btIDebugDraw** %4, align 8
  %24 = load %class.btGjkPairDetector** %1
  %25 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 11
  store float 0.000000e+00, float* %25, align 4
  store float 0.000000e+00, float* %distance, align 4
  store float 0.000000e+00, float* %5
  store float 0.000000e+00, float* %6
  store float 0.000000e+00, float* %7
  call void @_ZN9btVector3C2ERKfS1_S1_(%class.btVector3* %normalInB, float* dereferenceable(4) %5, float* dereferenceable(4) %6, float* dereferenceable(4) %7)
  call void @_ZN9btVector3C2Ev(%class.btVector3* %pointOnA)
  call void @_ZN9btVector3C2Ev(%class.btVector3* %pointOnB)
  %26 = load %"struct.btDiscreteCollisionDetectorInterface::ClosestPointInput"** %2, align 8
  %27 = getelementptr inbounds %"struct.btDiscreteCollisionDetectorInterface::ClosestPointInput"* %26, i32 0, i32 0
  call void @_ZN11btTransformC2ERKS_(%class.btTransform* %localTransA, %class.btTransform* dereferenceable(64) %27)
  %28 = load %"struct.btDiscreteCollisionDetectorInterface::ClosestPointInput"** %2, align 8
  %29 = getelementptr inbounds %"struct.btDiscreteCollisionDetectorInterface::ClosestPointInput"* %28, i32 0, i32 1
  call void @_ZN11btTransformC2ERKS_(%class.btTransform* %localTransB, %class.btTransform* dereferenceable(64) %29)
  %30 = call dereferenceable(16) %class.btVector3* @_ZN11btTransform9getOriginEv(%class.btTransform* %localTransA)
  %31 = call dereferenceable(16) %class.btVector3* @_ZN11btTransform9getOriginEv(%class.btTransform* %localTransB)
  %32 = call { <2 x float>, <2 x float> } @_ZplRK9btVector3S1_(%class.btVector3* dereferenceable(16) %30, %class.btVector3* dereferenceable(16) %31)
  %33 = getelementptr %class.btVector3* %8, i32 0, i32 0
  %34 = bitcast [4 x float]* %33 to { <2 x float>, <2 x float> }*
  %35 = getelementptr { <2 x float>, <2 x float> }* %34, i32 0, i32 0
  %36 = extractvalue { <2 x float>, <2 x float> } %32, 0
  store <2 x float> %36, <2 x float>* %35, align 1
  %37 = getelementptr { <2 x float>, <2 x float> }* %34, i32 0, i32 1
  %38 = extractvalue { <2 x float>, <2 x float> } %32, 1
  store <2 x float> %38, <2 x float>* %37, align 1
  store float 5.000000e-01, float* %9
  %39 = call { <2 x float>, <2 x float> } @_ZmlRK9btVector3RKf(%class.btVector3* dereferenceable(16) %8, float* dereferenceable(4) %9)
  %40 = getelementptr %class.btVector3* %positionOffset, i32 0, i32 0
  %41 = bitcast [4 x float]* %40 to { <2 x float>, <2 x float> }*
  %42 = getelementptr { <2 x float>, <2 x float> }* %41, i32 0, i32 0
  %43 = extractvalue { <2 x float>, <2 x float> } %39, 0
  store <2 x float> %43, <2 x float>* %42, align 1
  %44 = getelementptr { <2 x float>, <2 x float> }* %41, i32 0, i32 1
  %45 = extractvalue { <2 x float>, <2 x float> } %39, 1
  store <2 x float> %45, <2 x float>* %44, align 1
  %46 = call dereferenceable(16) %class.btVector3* @_ZN11btTransform9getOriginEv(%class.btTransform* %localTransA)
  %47 = call dereferenceable(16) %class.btVector3* @_ZN9btVector3mIERKS_(%class.btVector3* %46, %class.btVector3* dereferenceable(16) %positionOffset)
  %48 = call dereferenceable(16) %class.btVector3* @_ZN11btTransform9getOriginEv(%class.btTransform* %localTransB)
  %49 = call dereferenceable(16) %class.btVector3* @_ZN9btVector3mIERKS_(%class.btVector3* %48, %class.btVector3* dereferenceable(16) %positionOffset)
  %50 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 4
  %51 = load %class.btConvexShape** %50, align 8
  %52 = bitcast %class.btConvexShape* %51 to %class.btCollisionShape*
  %53 = call zeroext i1 @_ZNK16btCollisionShape10isConvex2dEv(%class.btCollisionShape* %52)
  br i1 %53, label %54, label %59

; <label>:54                                      ; preds = %0
  %55 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 5
  %56 = load %class.btConvexShape** %55, align 8
  %57 = bitcast %class.btConvexShape* %56 to %class.btCollisionShape*
  %58 = call zeroext i1 @_ZNK16btCollisionShape10isConvex2dEv(%class.btCollisionShape* %57)
  br label %59

; <label>:59                                      ; preds = %54, %0
  %60 = phi i1 [ false, %0 ], [ %58, %54 ]
  %61 = zext i1 %60 to i8
  store i8 %61, i8* %check2d, align 1
  %62 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 8
  %63 = load float* %62, align 4
  store float %63, float* %marginA, align 4
  %64 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 9
  %65 = load float* %64, align 4
  store float %65, float* %marginB, align 4
  %66 = load i32* @gNumGjkChecks, align 4
  %67 = add nsw i32 %66, 1
  store i32 %67, i32* @gNumGjkChecks, align 4
  %68 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 10
  %69 = load i8* %68, align 1
  %70 = trunc i8 %69 to i1
  br i1 %70, label %71, label %72

; <label>:71                                      ; preds = %59
  store float 0.000000e+00, float* %marginA, align 4
  store float 0.000000e+00, float* %marginB, align 4
  br label %72

; <label>:72                                      ; preds = %71, %59
  %73 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 13
  store i32 0, i32* %73, align 4
  store i32 1000, i32* %gGjkMaxIter, align 4
  %74 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 1
  store float 0.000000e+00, float* %10
  store float 1.000000e+00, float* %11
  store float 0.000000e+00, float* %12
  call void @_ZN9btVector38setValueERKfS1_S1_(%class.btVector3* %74, float* dereferenceable(4) %10, float* dereferenceable(4) %11, float* dereferenceable(4) %12)
  store i8 0, i8* %isValid, align 1
  store i8 0, i8* %checkSimplex, align 1
  store i8 1, i8* %checkPenetration, align 1
  %75 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 14
  store i32 0, i32* %75, align 4
  %76 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 12
  store i32 -1, i32* %76, align 4
  store float 0x43ABC16D60000000, float* %squaredDistance, align 4
  store float 0.000000e+00, float* %delta, align 4
  %77 = load float* %marginA, align 4
  %78 = load float* %marginB, align 4
  %79 = fadd float %77, %78
  store float %79, float* %margin, align 4
  %80 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 3
  %81 = load %class.btVoronoiSimplexSolver** %80, align 8
  call void @_ZN22btVoronoiSimplexSolver5resetEv(%class.btVoronoiSimplexSolver* %81)
  br label %82

; <label>:82                                      ; preds = %245, %72
  %83 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 1
  %84 = call { <2 x float>, <2 x float> } @_ZngRK9btVector3(%class.btVector3* dereferenceable(16) %83)
  %85 = getelementptr %class.btVector3* %13, i32 0, i32 0
  %86 = bitcast [4 x float]* %85 to { <2 x float>, <2 x float> }*
  %87 = getelementptr { <2 x float>, <2 x float> }* %86, i32 0, i32 0
  %88 = extractvalue { <2 x float>, <2 x float> } %84, 0
  store <2 x float> %88, <2 x float>* %87, align 1
  %89 = getelementptr { <2 x float>, <2 x float> }* %86, i32 0, i32 1
  %90 = extractvalue { <2 x float>, <2 x float> } %84, 1
  store <2 x float> %90, <2 x float>* %89, align 1
  %91 = load %"struct.btDiscreteCollisionDetectorInterface::ClosestPointInput"** %2, align 8
  %92 = getelementptr inbounds %"struct.btDiscreteCollisionDetectorInterface::ClosestPointInput"* %91, i32 0, i32 0
  %93 = call dereferenceable(48) %class.btMatrix3x3* @_ZNK11btTransform8getBasisEv(%class.btTransform* %92)
  %94 = call { <2 x float>, <2 x float> } @_ZmlRK9btVector3RK11btMatrix3x3(%class.btVector3* dereferenceable(16) %13, %class.btMatrix3x3* dereferenceable(48) %93)
  %95 = getelementptr %class.btVector3* %seperatingAxisInA, i32 0, i32 0
  %96 = bitcast [4 x float]* %95 to { <2 x float>, <2 x float> }*
  %97 = getelementptr { <2 x float>, <2 x float> }* %96, i32 0, i32 0
  %98 = extractvalue { <2 x float>, <2 x float> } %94, 0
  store <2 x float> %98, <2 x float>* %97, align 1
  %99 = getelementptr { <2 x float>, <2 x float> }* %96, i32 0, i32 1
  %100 = extractvalue { <2 x float>, <2 x float> } %94, 1
  store <2 x float> %100, <2 x float>* %99, align 1
  %101 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 1
  %102 = load %"struct.btDiscreteCollisionDetectorInterface::ClosestPointInput"** %2, align 8
  %103 = getelementptr inbounds %"struct.btDiscreteCollisionDetectorInterface::ClosestPointInput"* %102, i32 0, i32 1
  %104 = call dereferenceable(48) %class.btMatrix3x3* @_ZNK11btTransform8getBasisEv(%class.btTransform* %103)
  %105 = call { <2 x float>, <2 x float> } @_ZmlRK9btVector3RK11btMatrix3x3(%class.btVector3* dereferenceable(16) %101, %class.btMatrix3x3* dereferenceable(48) %104)
  %106 = getelementptr %class.btVector3* %seperatingAxisInB, i32 0, i32 0
  %107 = bitcast [4 x float]* %106 to { <2 x float>, <2 x float> }*
  %108 = getelementptr { <2 x float>, <2 x float> }* %107, i32 0, i32 0
  %109 = extractvalue { <2 x float>, <2 x float> } %105, 0
  store <2 x float> %109, <2 x float>* %108, align 1
  %110 = getelementptr { <2 x float>, <2 x float> }* %107, i32 0, i32 1
  %111 = extractvalue { <2 x float>, <2 x float> } %105, 1
  store <2 x float> %111, <2 x float>* %110, align 1
  %112 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 4
  %113 = load %class.btConvexShape** %112, align 8
  %114 = call { <2 x float>, <2 x float> } @_ZNK13btConvexShape44localGetSupportVertexWithoutMarginNonVirtualERK9btVector3(%class.btConvexShape* %113, %class.btVector3* dereferenceable(16) %seperatingAxisInA)
  %115 = getelementptr %class.btVector3* %pInA, i32 0, i32 0
  %116 = bitcast [4 x float]* %115 to { <2 x float>, <2 x float> }*
  %117 = getelementptr { <2 x float>, <2 x float> }* %116, i32 0, i32 0
  %118 = extractvalue { <2 x float>, <2 x float> } %114, 0
  store <2 x float> %118, <2 x float>* %117, align 1
  %119 = getelementptr { <2 x float>, <2 x float> }* %116, i32 0, i32 1
  %120 = extractvalue { <2 x float>, <2 x float> } %114, 1
  store <2 x float> %120, <2 x float>* %119, align 1
  %121 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 5
  %122 = load %class.btConvexShape** %121, align 8
  %123 = call { <2 x float>, <2 x float> } @_ZNK13btConvexShape44localGetSupportVertexWithoutMarginNonVirtualERK9btVector3(%class.btConvexShape* %122, %class.btVector3* dereferenceable(16) %seperatingAxisInB)
  %124 = getelementptr %class.btVector3* %qInB, i32 0, i32 0
  %125 = bitcast [4 x float]* %124 to { <2 x float>, <2 x float> }*
  %126 = getelementptr { <2 x float>, <2 x float> }* %125, i32 0, i32 0
  %127 = extractvalue { <2 x float>, <2 x float> } %123, 0
  store <2 x float> %127, <2 x float>* %126, align 1
  %128 = getelementptr { <2 x float>, <2 x float> }* %125, i32 0, i32 1
  %129 = extractvalue { <2 x float>, <2 x float> } %123, 1
  store <2 x float> %129, <2 x float>* %128, align 1
  %130 = call { <2 x float>, <2 x float> } @_ZNK11btTransformclERK9btVector3(%class.btTransform* %localTransA, %class.btVector3* dereferenceable(16) %pInA)
  %131 = getelementptr %class.btVector3* %pWorld, i32 0, i32 0
  %132 = bitcast [4 x float]* %131 to { <2 x float>, <2 x float> }*
  %133 = getelementptr { <2 x float>, <2 x float> }* %132, i32 0, i32 0
  %134 = extractvalue { <2 x float>, <2 x float> } %130, 0
  store <2 x float> %134, <2 x float>* %133, align 1
  %135 = getelementptr { <2 x float>, <2 x float> }* %132, i32 0, i32 1
  %136 = extractvalue { <2 x float>, <2 x float> } %130, 1
  store <2 x float> %136, <2 x float>* %135, align 1
  %137 = call { <2 x float>, <2 x float> } @_ZNK11btTransformclERK9btVector3(%class.btTransform* %localTransB, %class.btVector3* dereferenceable(16) %qInB)
  %138 = getelementptr %class.btVector3* %qWorld, i32 0, i32 0
  %139 = bitcast [4 x float]* %138 to { <2 x float>, <2 x float> }*
  %140 = getelementptr { <2 x float>, <2 x float> }* %139, i32 0, i32 0
  %141 = extractvalue { <2 x float>, <2 x float> } %137, 0
  store <2 x float> %141, <2 x float>* %140, align 1
  %142 = getelementptr { <2 x float>, <2 x float> }* %139, i32 0, i32 1
  %143 = extractvalue { <2 x float>, <2 x float> } %137, 1
  store <2 x float> %143, <2 x float>* %142, align 1
  %144 = load i8* %check2d, align 1
  %145 = trunc i8 %144 to i1
  br i1 %145, label %146, label %151

; <label>:146                                     ; preds = %82
  %147 = call float* @_ZN9btVector3cvPfEv(%class.btVector3* %pWorld)
  %148 = getelementptr inbounds float* %147, i64 2
  store float 0.000000e+00, float* %148, align 4
  %149 = call float* @_ZN9btVector3cvPfEv(%class.btVector3* %qWorld)
  %150 = getelementptr inbounds float* %149, i64 2
  store float 0.000000e+00, float* %150, align 4
  br label %151

; <label>:151                                     ; preds = %146, %82
  %152 = call { <2 x float>, <2 x float> } @_ZmiRK9btVector3S1_(%class.btVector3* dereferenceable(16) %pWorld, %class.btVector3* dereferenceable(16) %qWorld)
  %153 = getelementptr %class.btVector3* %w, i32 0, i32 0
  %154 = bitcast [4 x float]* %153 to { <2 x float>, <2 x float> }*
  %155 = getelementptr { <2 x float>, <2 x float> }* %154, i32 0, i32 0
  %156 = extractvalue { <2 x float>, <2 x float> } %152, 0
  store <2 x float> %156, <2 x float>* %155, align 1
  %157 = getelementptr { <2 x float>, <2 x float> }* %154, i32 0, i32 1
  %158 = extractvalue { <2 x float>, <2 x float> } %152, 1
  store <2 x float> %158, <2 x float>* %157, align 1
  %159 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 1
  %160 = call float @_ZNK9btVector33dotERKS_(%class.btVector3* %159, %class.btVector3* dereferenceable(16) %w)
  store float %160, float* %delta, align 4
  %161 = load float* %delta, align 4
  %162 = fcmp ogt float %161, 0.000000e+00
  br i1 %162, label %163, label %175

; <label>:163                                     ; preds = %151
  %164 = load float* %delta, align 4
  %165 = load float* %delta, align 4
  %166 = fmul float %164, %165
  %167 = load float* %squaredDistance, align 4
  %168 = load %"struct.btDiscreteCollisionDetectorInterface::ClosestPointInput"** %2, align 8
  %169 = getelementptr inbounds %"struct.btDiscreteCollisionDetectorInterface::ClosestPointInput"* %168, i32 0, i32 2
  %170 = load float* %169, align 4
  %171 = fmul float %167, %170
  %172 = fcmp ogt float %166, %171
  br i1 %172, label %173, label %175

; <label>:173                                     ; preds = %163
  %174 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 14
  store i32 10, i32* %174, align 4
  store i8 1, i8* %checkSimplex, align 1
  br label %246

; <label>:175                                     ; preds = %163, %151
  %176 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 3
  %177 = load %class.btVoronoiSimplexSolver** %176, align 8
  %178 = call zeroext i1 @_ZN22btVoronoiSimplexSolver9inSimplexERK9btVector3(%class.btVoronoiSimplexSolver* %177, %class.btVector3* dereferenceable(16) %w)
  br i1 %178, label %179, label %181

; <label>:179                                     ; preds = %175
  %180 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 14
  store i32 1, i32* %180, align 4
  store i8 1, i8* %checkSimplex, align 1
  br label %246

; <label>:181                                     ; preds = %175
  %182 = load float* %squaredDistance, align 4
  %183 = load float* %delta, align 4
  %184 = fsub float %182, %183
  store float %184, float* %f0, align 4
  %185 = load float* %squaredDistance, align 4
  %186 = fmul float %185, 0x3EB0C6F7A0000000
  store float %186, float* %f1, align 4
  %187 = load float* %f0, align 4
  %188 = load float* %f1, align 4
  %189 = fcmp ole float %187, %188
  br i1 %189, label %190, label %198

; <label>:190                                     ; preds = %181
  %191 = load float* %f0, align 4
  %192 = fcmp ole float %191, 0.000000e+00
  br i1 %192, label %193, label %195

; <label>:193                                     ; preds = %190
  %194 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 14
  store i32 2, i32* %194, align 4
  br label %197

; <label>:195                                     ; preds = %190
  %196 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 14
  store i32 11, i32* %196, align 4
  br label %197

; <label>:197                                     ; preds = %195, %193
  store i8 1, i8* %checkSimplex, align 1
  br label %246

; <label>:198                                     ; preds = %181
  %199 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 3
  %200 = load %class.btVoronoiSimplexSolver** %199, align 8
  call void @_ZN22btVoronoiSimplexSolver9addVertexERK9btVector3S2_S2_(%class.btVoronoiSimplexSolver* %200, %class.btVector3* dereferenceable(16) %w, %class.btVector3* dereferenceable(16) %pWorld, %class.btVector3* dereferenceable(16) %qWorld)
  call void @_ZN9btVector3C2Ev(%class.btVector3* %newCachedSeparatingAxis)
  %201 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 3
  %202 = load %class.btVoronoiSimplexSolver** %201, align 8
  %203 = call zeroext i1 @_ZN22btVoronoiSimplexSolver7closestER9btVector3(%class.btVoronoiSimplexSolver* %202, %class.btVector3* dereferenceable(16) %newCachedSeparatingAxis)
  br i1 %203, label %206, label %204

; <label>:204                                     ; preds = %198
  %205 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 14
  store i32 3, i32* %205, align 4
  store i8 1, i8* %checkSimplex, align 1
  br label %246

; <label>:206                                     ; preds = %198
  %207 = call float @_ZNK9btVector37length2Ev(%class.btVector3* %newCachedSeparatingAxis)
  %208 = fcmp olt float %207, 0x3EB0C6F7A0000000
  br i1 %208, label %209, label %214

; <label>:209                                     ; preds = %206
  %210 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 1
  %211 = bitcast %class.btVector3* %210 to i8*
  %212 = bitcast %class.btVector3* %newCachedSeparatingAxis to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %211, i8* %212, i64 16, i32 4, i1 false)
  %213 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 14
  store i32 6, i32* %213, align 4
  store i8 1, i8* %checkSimplex, align 1
  br label %246

; <label>:214                                     ; preds = %206
  %215 = load float* %squaredDistance, align 4
  store float %215, float* %previousSquaredDistance, align 4
  %216 = call float @_ZNK9btVector37length2Ev(%class.btVector3* %newCachedSeparatingAxis)
  store float %216, float* %squaredDistance, align 4
  %217 = load float* %previousSquaredDistance, align 4
  %218 = load float* %squaredDistance, align 4
  %219 = fsub float %217, %218
  %220 = load float* %previousSquaredDistance, align 4
  %221 = fmul float 0x3E80000000000000, %220
  %222 = fcmp ole float %219, %221
  br i1 %222, label %223, label %225

; <label>:223                                     ; preds = %214
  store i8 1, i8* %checkSimplex, align 1
  %224 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 14
  store i32 12, i32* %224, align 4
  br label %246

; <label>:225                                     ; preds = %214
  %226 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 1
  %227 = bitcast %class.btVector3* %226 to i8*
  %228 = bitcast %class.btVector3* %newCachedSeparatingAxis to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %227, i8* %228, i64 16, i32 4, i1 false)
  %229 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 13
  %230 = load i32* %229, align 4
  %231 = add nsw i32 %230, 1
  store i32 %231, i32* %229, align 4
  %232 = load i32* %gGjkMaxIter, align 4
  %233 = icmp sgt i32 %230, %232
  br i1 %233, label %234, label %235

; <label>:234                                     ; preds = %225
  br label %246

; <label>:235                                     ; preds = %225
  %236 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 3
  %237 = load %class.btVoronoiSimplexSolver** %236, align 8
  %238 = call zeroext i1 @_ZNK22btVoronoiSimplexSolver11fullSimplexEv(%class.btVoronoiSimplexSolver* %237)
  %239 = xor i1 %238, true
  %240 = zext i1 %239 to i8
  store i8 %240, i8* %check, align 1
  %241 = load i8* %check, align 1
  %242 = trunc i8 %241 to i1
  br i1 %242, label %245, label %243

; <label>:243                                     ; preds = %235
  %244 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 14
  store i32 13, i32* %244, align 4
  br label %246

; <label>:245                                     ; preds = %235
  br label %82

; <label>:246                                     ; preds = %243, %234, %223, %209, %204, %197, %179, %173
  %247 = load i8* %checkSimplex, align 1
  %248 = trunc i8 %247 to i1
  br i1 %248, label %249, label %304

; <label>:249                                     ; preds = %246
  %250 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 3
  %251 = load %class.btVoronoiSimplexSolver** %250, align 8
  call void @_ZN22btVoronoiSimplexSolver14compute_pointsER9btVector3S1_(%class.btVoronoiSimplexSolver* %251, %class.btVector3* dereferenceable(16) %pointOnA, %class.btVector3* dereferenceable(16) %pointOnB)
  %252 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 1
  %253 = bitcast %class.btVector3* %normalInB to i8*
  %254 = bitcast %class.btVector3* %252 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %253, i8* %254, i64 16, i32 4, i1 false)
  %255 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 1
  %256 = call float @_ZNK9btVector37length2Ev(%class.btVector3* %255)
  store float %256, float* %lenSqr, align 4
  %257 = load float* %lenSqr, align 4
  %258 = fpext float %257 to double
  %259 = fcmp olt double %258, 1.000000e-04
  br i1 %259, label %260, label %262

; <label>:260                                     ; preds = %249
  %261 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 14
  store i32 5, i32* %261, align 4
  br label %262

; <label>:262                                     ; preds = %260, %249
  %263 = load float* %lenSqr, align 4
  %264 = fcmp ogt float %263, 0x3D10000000000000
  br i1 %264, label %265, label %301

; <label>:265                                     ; preds = %262
  %266 = load float* %lenSqr, align 4
  %267 = call float @_Z6btSqrtf(float %266)
  %268 = fdiv float 1.000000e+00, %267
  store float %268, float* %rlen, align 4
  %269 = call dereferenceable(16) %class.btVector3* @_ZN9btVector3mLERKf(%class.btVector3* %normalInB, float* dereferenceable(4) %rlen)
  %270 = load float* %squaredDistance, align 4
  %271 = call float @_Z6btSqrtf(float %270)
  store float %271, float* %s, align 4
  %272 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 1
  %273 = load float* %marginA, align 4
  %274 = load float* %s, align 4
  %275 = fdiv float %273, %274
  store float %275, float* %15
  %276 = call { <2 x float>, <2 x float> } @_ZmlRK9btVector3RKf(%class.btVector3* dereferenceable(16) %272, float* dereferenceable(4) %15)
  %277 = getelementptr %class.btVector3* %14, i32 0, i32 0
  %278 = bitcast [4 x float]* %277 to { <2 x float>, <2 x float> }*
  %279 = getelementptr { <2 x float>, <2 x float> }* %278, i32 0, i32 0
  %280 = extractvalue { <2 x float>, <2 x float> } %276, 0
  store <2 x float> %280, <2 x float>* %279, align 1
  %281 = getelementptr { <2 x float>, <2 x float> }* %278, i32 0, i32 1
  %282 = extractvalue { <2 x float>, <2 x float> } %276, 1
  store <2 x float> %282, <2 x float>* %281, align 1
  %283 = call dereferenceable(16) %class.btVector3* @_ZN9btVector3mIERKS_(%class.btVector3* %pointOnA, %class.btVector3* dereferenceable(16) %14)
  %284 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 1
  %285 = load float* %marginB, align 4
  %286 = load float* %s, align 4
  %287 = fdiv float %285, %286
  store float %287, float* %17
  %288 = call { <2 x float>, <2 x float> } @_ZmlRK9btVector3RKf(%class.btVector3* dereferenceable(16) %284, float* dereferenceable(4) %17)
  %289 = getelementptr %class.btVector3* %16, i32 0, i32 0
  %290 = bitcast [4 x float]* %289 to { <2 x float>, <2 x float> }*
  %291 = getelementptr { <2 x float>, <2 x float> }* %290, i32 0, i32 0
  %292 = extractvalue { <2 x float>, <2 x float> } %288, 0
  store <2 x float> %292, <2 x float>* %291, align 1
  %293 = getelementptr { <2 x float>, <2 x float> }* %290, i32 0, i32 1
  %294 = extractvalue { <2 x float>, <2 x float> } %288, 1
  store <2 x float> %294, <2 x float>* %293, align 1
  %295 = call dereferenceable(16) %class.btVector3* @_ZN9btVector3pLERKS_(%class.btVector3* %pointOnB, %class.btVector3* dereferenceable(16) %16)
  %296 = load float* %rlen, align 4
  %297 = fdiv float 1.000000e+00, %296
  %298 = load float* %margin, align 4
  %299 = fsub float %297, %298
  store float %299, float* %distance, align 4
  store i8 1, i8* %isValid, align 1
  %300 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 12
  store i32 1, i32* %300, align 4
  br label %303

; <label>:301                                     ; preds = %262
  %302 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 12
  store i32 2, i32* %302, align 4
  br label %303

; <label>:303                                     ; preds = %301, %265
  br label %304

; <label>:304                                     ; preds = %303, %246
  %305 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 15
  %306 = load i32* %305, align 4
  %307 = icmp ne i32 %306, 0
  br i1 %307, label %308, label %322

; <label>:308                                     ; preds = %304
  %309 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 2
  %310 = load %class.btConvexPenetrationDepthSolver** %309, align 8
  %311 = icmp ne %class.btConvexPenetrationDepthSolver* %310, null
  br i1 %311, label %312, label %322

; <label>:312                                     ; preds = %308
  %313 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 14
  %314 = load i32* %313, align 4
  %315 = icmp ne i32 %314, 0
  br i1 %315, label %316, label %322

; <label>:316                                     ; preds = %312
  %317 = load float* %distance, align 4
  %318 = load float* %margin, align 4
  %319 = fadd float %317, %318
  %320 = fpext float %319 to double
  %321 = fcmp olt double %320, 1.000000e-02
  br label %322

; <label>:322                                     ; preds = %316, %312, %308, %304
  %323 = phi i1 [ false, %312 ], [ false, %308 ], [ false, %304 ], [ %321, %316 ]
  %324 = zext i1 %323 to i8
  store i8 %324, i8* %catchDegeneratePenetrationCase, align 1
  %325 = load i8* %checkPenetration, align 1
  %326 = trunc i8 %325 to i1
  br i1 %326, label %327, label %472

; <label>:327                                     ; preds = %322
  %328 = load i8* %isValid, align 1
  %329 = trunc i8 %328 to i1
  br i1 %329, label %330, label %333

; <label>:330                                     ; preds = %327
  %331 = load i8* %catchDegeneratePenetrationCase, align 1
  %332 = trunc i8 %331 to i1
  br i1 %332, label %333, label %472

; <label>:333                                     ; preds = %330, %327
  %334 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 2
  %335 = load %class.btConvexPenetrationDepthSolver** %334, align 8
  %336 = icmp ne %class.btConvexPenetrationDepthSolver* %335, null
  br i1 %336, label %337, label %471

; <label>:337                                     ; preds = %333
  call void @_ZN9btVector3C2Ev(%class.btVector3* %tmpPointOnA)
  call void @_ZN9btVector3C2Ev(%class.btVector3* %tmpPointOnB)
  %338 = load i32* @gNumDeepPenetrationChecks, align 4
  %339 = add nsw i32 %338, 1
  store i32 %339, i32* @gNumDeepPenetrationChecks, align 4
  %340 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 1
  call void @_ZN9btVector37setZeroEv(%class.btVector3* %340)
  %341 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 2
  %342 = load %class.btConvexPenetrationDepthSolver** %341, align 8
  %343 = bitcast %class.btConvexPenetrationDepthSolver* %342 to i1 (%class.btConvexPenetrationDepthSolver*, %class.btVoronoiSimplexSolver*, %class.btConvexShape*, %class.btConvexShape*, %class.btTransform*, %class.btTransform*, %class.btVector3*, %class.btVector3*, %class.btVector3*, %class.btIDebugDraw*, %class.btStackAlloc*)***
  %344 = load i1 (%class.btConvexPenetrationDepthSolver*, %class.btVoronoiSimplexSolver*, %class.btConvexShape*, %class.btConvexShape*, %class.btTransform*, %class.btTransform*, %class.btVector3*, %class.btVector3*, %class.btVector3*, %class.btIDebugDraw*, %class.btStackAlloc*)*** %343
  %345 = getelementptr inbounds i1 (%class.btConvexPenetrationDepthSolver*, %class.btVoronoiSimplexSolver*, %class.btConvexShape*, %class.btConvexShape*, %class.btTransform*, %class.btTransform*, %class.btVector3*, %class.btVector3*, %class.btVector3*, %class.btIDebugDraw*, %class.btStackAlloc*)** %344, i64 2
  %346 = load i1 (%class.btConvexPenetrationDepthSolver*, %class.btVoronoiSimplexSolver*, %class.btConvexShape*, %class.btConvexShape*, %class.btTransform*, %class.btTransform*, %class.btVector3*, %class.btVector3*, %class.btVector3*, %class.btIDebugDraw*, %class.btStackAlloc*)** %345
  %347 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 3
  %348 = load %class.btVoronoiSimplexSolver** %347, align 8
  %349 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 4
  %350 = load %class.btConvexShape** %349, align 8
  %351 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 5
  %352 = load %class.btConvexShape** %351, align 8
  %353 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 1
  %354 = load %class.btIDebugDraw** %4, align 8
  %355 = load %"struct.btDiscreteCollisionDetectorInterface::ClosestPointInput"** %2, align 8
  %356 = getelementptr inbounds %"struct.btDiscreteCollisionDetectorInterface::ClosestPointInput"* %355, i32 0, i32 3
  %357 = load %class.btStackAlloc** %356, align 8
  %358 = call zeroext i1 %346(%class.btConvexPenetrationDepthSolver* %342, %class.btVoronoiSimplexSolver* dereferenceable(360) %348, %class.btConvexShape* %350, %class.btConvexShape* %352, %class.btTransform* dereferenceable(64) %localTransA, %class.btTransform* dereferenceable(64) %localTransB, %class.btVector3* dereferenceable(16) %353, %class.btVector3* dereferenceable(16) %tmpPointOnA, %class.btVector3* dereferenceable(16) %tmpPointOnB, %class.btIDebugDraw* %354, %class.btStackAlloc* %357)
  %359 = zext i1 %358 to i8
  store i8 %359, i8* %isValid2, align 1
  %360 = load i8* %isValid2, align 1
  %361 = trunc i8 %360 to i1
  br i1 %361, label %362, label %416

; <label>:362                                     ; preds = %337
  %363 = call { <2 x float>, <2 x float> } @_ZmiRK9btVector3S1_(%class.btVector3* dereferenceable(16) %tmpPointOnB, %class.btVector3* dereferenceable(16) %tmpPointOnA)
  %364 = getelementptr %class.btVector3* %tmpNormalInB, i32 0, i32 0
  %365 = bitcast [4 x float]* %364 to { <2 x float>, <2 x float> }*
  %366 = getelementptr { <2 x float>, <2 x float> }* %365, i32 0, i32 0
  %367 = extractvalue { <2 x float>, <2 x float> } %363, 0
  store <2 x float> %367, <2 x float>* %366, align 1
  %368 = getelementptr { <2 x float>, <2 x float> }* %365, i32 0, i32 1
  %369 = extractvalue { <2 x float>, <2 x float> } %363, 1
  store <2 x float> %369, <2 x float>* %368, align 1
  %370 = call float @_ZNK9btVector37length2Ev(%class.btVector3* %tmpNormalInB)
  store float %370, float* %lenSqr1, align 4
  %371 = load float* %lenSqr1, align 4
  %372 = fcmp ole float %371, 0x3D10000000000000
  br i1 %372, label %373, label %379

; <label>:373                                     ; preds = %362
  %374 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 1
  %375 = bitcast %class.btVector3* %tmpNormalInB to i8*
  %376 = bitcast %class.btVector3* %374 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %375, i8* %376, i64 16, i32 4, i1 false)
  %377 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 1
  %378 = call float @_ZNK9btVector37length2Ev(%class.btVector3* %377)
  store float %378, float* %lenSqr1, align 4
  br label %379

; <label>:379                                     ; preds = %373, %362
  %380 = load float* %lenSqr1, align 4
  %381 = fcmp ogt float %380, 0x3D10000000000000
  br i1 %381, label %382, label %413

; <label>:382                                     ; preds = %379
  %383 = load float* %lenSqr1, align 4
  %384 = call float @_Z6btSqrtf(float %383)
  store float %384, float* %18
  %385 = call dereferenceable(16) %class.btVector3* @_ZN9btVector3dVERKf(%class.btVector3* %tmpNormalInB, float* dereferenceable(4) %18)
  %386 = call { <2 x float>, <2 x float> } @_ZmiRK9btVector3S1_(%class.btVector3* dereferenceable(16) %tmpPointOnA, %class.btVector3* dereferenceable(16) %tmpPointOnB)
  %387 = getelementptr %class.btVector3* %19, i32 0, i32 0
  %388 = bitcast [4 x float]* %387 to { <2 x float>, <2 x float> }*
  %389 = getelementptr { <2 x float>, <2 x float> }* %388, i32 0, i32 0
  %390 = extractvalue { <2 x float>, <2 x float> } %386, 0
  store <2 x float> %390, <2 x float>* %389, align 1
  %391 = getelementptr { <2 x float>, <2 x float> }* %388, i32 0, i32 1
  %392 = extractvalue { <2 x float>, <2 x float> } %386, 1
  store <2 x float> %392, <2 x float>* %391, align 1
  %393 = call float @_ZNK9btVector36lengthEv(%class.btVector3* %19)
  %394 = fsub float -0.000000e+00, %393
  store float %394, float* %distance2, align 4
  %395 = load i8* %isValid, align 1
  %396 = trunc i8 %395 to i1
  br i1 %396, label %397, label %401

; <label>:397                                     ; preds = %382
  %398 = load float* %distance2, align 4
  %399 = load float* %distance, align 4
  %400 = fcmp olt float %398, %399
  br i1 %400, label %401, label %410

; <label>:401                                     ; preds = %397, %382
  %402 = load float* %distance2, align 4
  store float %402, float* %distance, align 4
  %403 = bitcast %class.btVector3* %pointOnA to i8*
  %404 = bitcast %class.btVector3* %tmpPointOnA to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %403, i8* %404, i64 16, i32 4, i1 false)
  %405 = bitcast %class.btVector3* %pointOnB to i8*
  %406 = bitcast %class.btVector3* %tmpPointOnB to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %405, i8* %406, i64 16, i32 4, i1 false)
  %407 = bitcast %class.btVector3* %normalInB to i8*
  %408 = bitcast %class.btVector3* %tmpNormalInB to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %407, i8* %408, i64 16, i32 4, i1 false)
  store i8 1, i8* %isValid, align 1
  %409 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 12
  store i32 3, i32* %409, align 4
  br label %412

; <label>:410                                     ; preds = %397
  %411 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 12
  store i32 8, i32* %411, align 4
  br label %412

; <label>:412                                     ; preds = %410, %401
  br label %415

; <label>:413                                     ; preds = %379
  %414 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 12
  store i32 9, i32* %414, align 4
  br label %415

; <label>:415                                     ; preds = %413, %412
  br label %470

; <label>:416                                     ; preds = %337
  %417 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 1
  %418 = call float @_ZNK9btVector37length2Ev(%class.btVector3* %417)
  %419 = fcmp ogt float %418, 0.000000e+00
  br i1 %419, label %420, label %469

; <label>:420                                     ; preds = %416
  %421 = call { <2 x float>, <2 x float> } @_ZmiRK9btVector3S1_(%class.btVector3* dereferenceable(16) %tmpPointOnA, %class.btVector3* dereferenceable(16) %tmpPointOnB)
  %422 = getelementptr %class.btVector3* %20, i32 0, i32 0
  %423 = bitcast [4 x float]* %422 to { <2 x float>, <2 x float> }*
  %424 = getelementptr { <2 x float>, <2 x float> }* %423, i32 0, i32 0
  %425 = extractvalue { <2 x float>, <2 x float> } %421, 0
  store <2 x float> %425, <2 x float>* %424, align 1
  %426 = getelementptr { <2 x float>, <2 x float> }* %423, i32 0, i32 1
  %427 = extractvalue { <2 x float>, <2 x float> } %421, 1
  store <2 x float> %427, <2 x float>* %426, align 1
  %428 = call float @_ZNK9btVector36lengthEv(%class.btVector3* %20)
  %429 = load float* %margin, align 4
  %430 = fsub float %428, %429
  store float %430, float* %distance22, align 4
  %431 = load i8* %isValid, align 1
  %432 = trunc i8 %431 to i1
  br i1 %432, label %433, label %437

; <label>:433                                     ; preds = %420
  %434 = load float* %distance22, align 4
  %435 = load float* %distance, align 4
  %436 = fcmp olt float %434, %435
  br i1 %436, label %437, label %466

; <label>:437                                     ; preds = %433, %420
  %438 = load float* %distance22, align 4
  store float %438, float* %distance, align 4
  %439 = bitcast %class.btVector3* %pointOnA to i8*
  %440 = bitcast %class.btVector3* %tmpPointOnA to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %439, i8* %440, i64 16, i32 4, i1 false)
  %441 = bitcast %class.btVector3* %pointOnB to i8*
  %442 = bitcast %class.btVector3* %tmpPointOnB to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %441, i8* %442, i64 16, i32 4, i1 false)
  %443 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 1
  %444 = call { <2 x float>, <2 x float> } @_ZmlRK9btVector3RKf(%class.btVector3* dereferenceable(16) %443, float* dereferenceable(4) %marginA)
  %445 = getelementptr %class.btVector3* %21, i32 0, i32 0
  %446 = bitcast [4 x float]* %445 to { <2 x float>, <2 x float> }*
  %447 = getelementptr { <2 x float>, <2 x float> }* %446, i32 0, i32 0
  %448 = extractvalue { <2 x float>, <2 x float> } %444, 0
  store <2 x float> %448, <2 x float>* %447, align 1
  %449 = getelementptr { <2 x float>, <2 x float> }* %446, i32 0, i32 1
  %450 = extractvalue { <2 x float>, <2 x float> } %444, 1
  store <2 x float> %450, <2 x float>* %449, align 1
  %451 = call dereferenceable(16) %class.btVector3* @_ZN9btVector3mIERKS_(%class.btVector3* %pointOnA, %class.btVector3* dereferenceable(16) %21)
  %452 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 1
  %453 = call { <2 x float>, <2 x float> } @_ZmlRK9btVector3RKf(%class.btVector3* dereferenceable(16) %452, float* dereferenceable(4) %marginB)
  %454 = getelementptr %class.btVector3* %22, i32 0, i32 0
  %455 = bitcast [4 x float]* %454 to { <2 x float>, <2 x float> }*
  %456 = getelementptr { <2 x float>, <2 x float> }* %455, i32 0, i32 0
  %457 = extractvalue { <2 x float>, <2 x float> } %453, 0
  store <2 x float> %457, <2 x float>* %456, align 1
  %458 = getelementptr { <2 x float>, <2 x float> }* %455, i32 0, i32 1
  %459 = extractvalue { <2 x float>, <2 x float> } %453, 1
  store <2 x float> %459, <2 x float>* %458, align 1
  %460 = call dereferenceable(16) %class.btVector3* @_ZN9btVector3pLERKS_(%class.btVector3* %pointOnB, %class.btVector3* dereferenceable(16) %22)
  %461 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 1
  %462 = bitcast %class.btVector3* %normalInB to i8*
  %463 = bitcast %class.btVector3* %461 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %462, i8* %463, i64 16, i32 4, i1 false)
  %464 = call dereferenceable(16) %class.btVector3* @_ZN9btVector39normalizeEv(%class.btVector3* %normalInB)
  store i8 1, i8* %isValid, align 1
  %465 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 12
  store i32 6, i32* %465, align 4
  br label %468

; <label>:466                                     ; preds = %433
  %467 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 12
  store i32 5, i32* %467, align 4
  br label %468

; <label>:468                                     ; preds = %466, %437
  br label %469

; <label>:469                                     ; preds = %468, %416
  br label %470

; <label>:470                                     ; preds = %469, %415
  br label %471

; <label>:471                                     ; preds = %470, %333
  br label %472

; <label>:472                                     ; preds = %471, %330, %322
  %473 = load i8* %isValid, align 1
  %474 = trunc i8 %473 to i1
  br i1 %474, label %475, label %505

; <label>:475                                     ; preds = %472
  %476 = load float* %distance, align 4
  %477 = fcmp olt float %476, 0.000000e+00
  br i1 %477, label %486, label %478

; <label>:478                                     ; preds = %475
  %479 = load float* %distance, align 4
  %480 = load float* %distance, align 4
  %481 = fmul float %479, %480
  %482 = load %"struct.btDiscreteCollisionDetectorInterface::ClosestPointInput"** %2, align 8
  %483 = getelementptr inbounds %"struct.btDiscreteCollisionDetectorInterface::ClosestPointInput"* %482, i32 0, i32 2
  %484 = load float* %483, align 4
  %485 = fcmp olt float %481, %484
  br i1 %485, label %486, label %505

; <label>:486                                     ; preds = %478, %475
  %487 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 1
  %488 = bitcast %class.btVector3* %487 to i8*
  %489 = bitcast %class.btVector3* %normalInB to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %488, i8* %489, i64 16, i32 4, i1 false)
  %490 = load float* %distance, align 4
  %491 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 11
  store float %490, float* %491, align 4
  %492 = load %"struct.btDiscreteCollisionDetectorInterface::Result"** %3, align 8
  %493 = bitcast %"struct.btDiscreteCollisionDetectorInterface::Result"* %492 to void (%"struct.btDiscreteCollisionDetectorInterface::Result"*, %class.btVector3*, %class.btVector3*, float)***
  %494 = load void (%"struct.btDiscreteCollisionDetectorInterface::Result"*, %class.btVector3*, %class.btVector3*, float)*** %493
  %495 = getelementptr inbounds void (%"struct.btDiscreteCollisionDetectorInterface::Result"*, %class.btVector3*, %class.btVector3*, float)** %494, i64 4
  %496 = load void (%"struct.btDiscreteCollisionDetectorInterface::Result"*, %class.btVector3*, %class.btVector3*, float)** %495
  %497 = call { <2 x float>, <2 x float> } @_ZplRK9btVector3S1_(%class.btVector3* dereferenceable(16) %pointOnB, %class.btVector3* dereferenceable(16) %positionOffset)
  %498 = getelementptr %class.btVector3* %23, i32 0, i32 0
  %499 = bitcast [4 x float]* %498 to { <2 x float>, <2 x float> }*
  %500 = getelementptr { <2 x float>, <2 x float> }* %499, i32 0, i32 0
  %501 = extractvalue { <2 x float>, <2 x float> } %497, 0
  store <2 x float> %501, <2 x float>* %500, align 1
  %502 = getelementptr { <2 x float>, <2 x float> }* %499, i32 0, i32 1
  %503 = extractvalue { <2 x float>, <2 x float> } %497, 1
  store <2 x float> %503, <2 x float>* %502, align 1
  %504 = load float* %distance, align 4
  call void %496(%"struct.btDiscreteCollisionDetectorInterface::Result"* %492, %class.btVector3* dereferenceable(16) %normalInB, %class.btVector3* dereferenceable(16) %23, float %504)
  br label %505

; <label>:505                                     ; preds = %486, %478, %472
  ret void
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr void @_ZN9btVector3C2Ev(%class.btVector3* %this) unnamed_addr #1 align 2 {
  %1 = alloca %class.btVector3*, align 8
  store %class.btVector3* %this, %class.btVector3** %1, align 8
  %2 = load %class.btVector3** %1
  ret void
}

; Function Attrs: inlinehint uwtable
define linkonce_odr void @_ZN11btTransformC2ERKS_(%class.btTransform* %this, %class.btTransform* dereferenceable(64) %other) unnamed_addr #4 align 2 {
  %1 = alloca %class.btTransform*, align 8
  %2 = alloca %class.btTransform*, align 8
  store %class.btTransform* %this, %class.btTransform** %1, align 8
  store %class.btTransform* %other, %class.btTransform** %2, align 8
  %3 = load %class.btTransform** %1
  %4 = getelementptr inbounds %class.btTransform* %3, i32 0, i32 0
  %5 = load %class.btTransform** %2, align 8
  %6 = getelementptr inbounds %class.btTransform* %5, i32 0, i32 0
  call void @_ZN11btMatrix3x3C2ERKS_(%class.btMatrix3x3* %4, %class.btMatrix3x3* dereferenceable(48) %6)
  %7 = getelementptr inbounds %class.btTransform* %3, i32 0, i32 1
  %8 = load %class.btTransform** %2, align 8
  %9 = getelementptr inbounds %class.btTransform* %8, i32 0, i32 1
  %10 = bitcast %class.btVector3* %7 to i8*
  %11 = bitcast %class.btVector3* %9 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %10, i8* %11, i64 16, i32 4, i1 false)
  ret void
}

; Function Attrs: inlinehint uwtable
define linkonce_odr { <2 x float>, <2 x float> } @_ZmlRK9btVector3RKf(%class.btVector3* dereferenceable(16) %v, float* dereferenceable(4) %s) #4 {
  %1 = alloca %class.btVector3, align 4
  %2 = alloca %class.btVector3*, align 8
  %3 = alloca float*, align 8
  %4 = alloca float, align 4
  %5 = alloca float, align 4
  %6 = alloca float, align 4
  store %class.btVector3* %v, %class.btVector3** %2, align 8
  store float* %s, float** %3, align 8
  %7 = load %class.btVector3** %2, align 8
  %8 = getelementptr inbounds %class.btVector3* %7, i32 0, i32 0
  %9 = getelementptr inbounds [4 x float]* %8, i32 0, i64 0
  %10 = load float* %9, align 4
  %11 = load float** %3, align 8
  %12 = load float* %11, align 4
  %13 = fmul float %10, %12
  store float %13, float* %4
  %14 = load %class.btVector3** %2, align 8
  %15 = getelementptr inbounds %class.btVector3* %14, i32 0, i32 0
  %16 = getelementptr inbounds [4 x float]* %15, i32 0, i64 1
  %17 = load float* %16, align 4
  %18 = load float** %3, align 8
  %19 = load float* %18, align 4
  %20 = fmul float %17, %19
  store float %20, float* %5
  %21 = load %class.btVector3** %2, align 8
  %22 = getelementptr inbounds %class.btVector3* %21, i32 0, i32 0
  %23 = getelementptr inbounds [4 x float]* %22, i32 0, i64 2
  %24 = load float* %23, align 4
  %25 = load float** %3, align 8
  %26 = load float* %25, align 4
  %27 = fmul float %24, %26
  store float %27, float* %6
  call void @_ZN9btVector3C2ERKfS1_S1_(%class.btVector3* %1, float* dereferenceable(4) %4, float* dereferenceable(4) %5, float* dereferenceable(4) %6)
  %28 = getelementptr %class.btVector3* %1, i32 0, i32 0
  %29 = bitcast [4 x float]* %28 to { <2 x float>, <2 x float> }*
  %30 = load { <2 x float>, <2 x float> }* %29, align 1
  ret { <2 x float>, <2 x float> } %30
}

; Function Attrs: inlinehint uwtable
define linkonce_odr { <2 x float>, <2 x float> } @_ZplRK9btVector3S1_(%class.btVector3* dereferenceable(16) %v1, %class.btVector3* dereferenceable(16) %v2) #4 {
  %1 = alloca %class.btVector3, align 4
  %2 = alloca %class.btVector3*, align 8
  %3 = alloca %class.btVector3*, align 8
  %4 = alloca float, align 4
  %5 = alloca float, align 4
  %6 = alloca float, align 4
  store %class.btVector3* %v1, %class.btVector3** %2, align 8
  store %class.btVector3* %v2, %class.btVector3** %3, align 8
  %7 = load %class.btVector3** %2, align 8
  %8 = getelementptr inbounds %class.btVector3* %7, i32 0, i32 0
  %9 = getelementptr inbounds [4 x float]* %8, i32 0, i64 0
  %10 = load float* %9, align 4
  %11 = load %class.btVector3** %3, align 8
  %12 = getelementptr inbounds %class.btVector3* %11, i32 0, i32 0
  %13 = getelementptr inbounds [4 x float]* %12, i32 0, i64 0
  %14 = load float* %13, align 4
  %15 = fadd float %10, %14
  store float %15, float* %4
  %16 = load %class.btVector3** %2, align 8
  %17 = getelementptr inbounds %class.btVector3* %16, i32 0, i32 0
  %18 = getelementptr inbounds [4 x float]* %17, i32 0, i64 1
  %19 = load float* %18, align 4
  %20 = load %class.btVector3** %3, align 8
  %21 = getelementptr inbounds %class.btVector3* %20, i32 0, i32 0
  %22 = getelementptr inbounds [4 x float]* %21, i32 0, i64 1
  %23 = load float* %22, align 4
  %24 = fadd float %19, %23
  store float %24, float* %5
  %25 = load %class.btVector3** %2, align 8
  %26 = getelementptr inbounds %class.btVector3* %25, i32 0, i32 0
  %27 = getelementptr inbounds [4 x float]* %26, i32 0, i64 2
  %28 = load float* %27, align 4
  %29 = load %class.btVector3** %3, align 8
  %30 = getelementptr inbounds %class.btVector3* %29, i32 0, i32 0
  %31 = getelementptr inbounds [4 x float]* %30, i32 0, i64 2
  %32 = load float* %31, align 4
  %33 = fadd float %28, %32
  store float %33, float* %6
  call void @_ZN9btVector3C2ERKfS1_S1_(%class.btVector3* %1, float* dereferenceable(4) %4, float* dereferenceable(4) %5, float* dereferenceable(4) %6)
  %34 = getelementptr %class.btVector3* %1, i32 0, i32 0
  %35 = bitcast [4 x float]* %34 to { <2 x float>, <2 x float> }*
  %36 = load { <2 x float>, <2 x float> }* %35, align 1
  ret { <2 x float>, <2 x float> } %36
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dereferenceable(16) %class.btVector3* @_ZN11btTransform9getOriginEv(%class.btTransform* %this) #1 align 2 {
  %1 = alloca %class.btTransform*, align 8
  store %class.btTransform* %this, %class.btTransform** %1, align 8
  %2 = load %class.btTransform** %1
  %3 = getelementptr inbounds %class.btTransform* %2, i32 0, i32 1
  ret %class.btVector3* %3
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dereferenceable(16) %class.btVector3* @_ZN9btVector3mIERKS_(%class.btVector3* %this, %class.btVector3* dereferenceable(16) %v) #1 align 2 {
  %1 = alloca %class.btVector3*, align 8
  %2 = alloca %class.btVector3*, align 8
  store %class.btVector3* %this, %class.btVector3** %1, align 8
  store %class.btVector3* %v, %class.btVector3** %2, align 8
  %3 = load %class.btVector3** %1
  %4 = load %class.btVector3** %2, align 8
  %5 = getelementptr inbounds %class.btVector3* %4, i32 0, i32 0
  %6 = getelementptr inbounds [4 x float]* %5, i32 0, i64 0
  %7 = load float* %6, align 4
  %8 = getelementptr inbounds %class.btVector3* %3, i32 0, i32 0
  %9 = getelementptr inbounds [4 x float]* %8, i32 0, i64 0
  %10 = load float* %9, align 4
  %11 = fsub float %10, %7
  store float %11, float* %9, align 4
  %12 = load %class.btVector3** %2, align 8
  %13 = getelementptr inbounds %class.btVector3* %12, i32 0, i32 0
  %14 = getelementptr inbounds [4 x float]* %13, i32 0, i64 1
  %15 = load float* %14, align 4
  %16 = getelementptr inbounds %class.btVector3* %3, i32 0, i32 0
  %17 = getelementptr inbounds [4 x float]* %16, i32 0, i64 1
  %18 = load float* %17, align 4
  %19 = fsub float %18, %15
  store float %19, float* %17, align 4
  %20 = load %class.btVector3** %2, align 8
  %21 = getelementptr inbounds %class.btVector3* %20, i32 0, i32 0
  %22 = getelementptr inbounds [4 x float]* %21, i32 0, i64 2
  %23 = load float* %22, align 4
  %24 = getelementptr inbounds %class.btVector3* %3, i32 0, i32 0
  %25 = getelementptr inbounds [4 x float]* %24, i32 0, i64 2
  %26 = load float* %25, align 4
  %27 = fsub float %26, %23
  store float %27, float* %25, align 4
  ret %class.btVector3* %3
}

; Function Attrs: inlinehint uwtable
define linkonce_odr zeroext i1 @_ZNK16btCollisionShape10isConvex2dEv(%class.btCollisionShape* %this) #4 align 2 {
  %1 = alloca %class.btCollisionShape*, align 8
  store %class.btCollisionShape* %this, %class.btCollisionShape** %1, align 8
  %2 = load %class.btCollisionShape** %1
  %3 = call i32 @_ZNK16btCollisionShape12getShapeTypeEv(%class.btCollisionShape* %2)
  %4 = call zeroext i1 @_ZN17btBroadphaseProxy10isConvex2dEi(i32 %3)
  ret i1 %4
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr void @_ZN9btVector38setValueERKfS1_S1_(%class.btVector3* %this, float* dereferenceable(4) %_x, float* dereferenceable(4) %_y, float* dereferenceable(4) %_z) #1 align 2 {
  %1 = alloca %class.btVector3*, align 8
  %2 = alloca float*, align 8
  %3 = alloca float*, align 8
  %4 = alloca float*, align 8
  store %class.btVector3* %this, %class.btVector3** %1, align 8
  store float* %_x, float** %2, align 8
  store float* %_y, float** %3, align 8
  store float* %_z, float** %4, align 8
  %5 = load %class.btVector3** %1
  %6 = load float** %2, align 8
  %7 = load float* %6, align 4
  %8 = getelementptr inbounds %class.btVector3* %5, i32 0, i32 0
  %9 = getelementptr inbounds [4 x float]* %8, i32 0, i64 0
  store float %7, float* %9, align 4
  %10 = load float** %3, align 8
  %11 = load float* %10, align 4
  %12 = getelementptr inbounds %class.btVector3* %5, i32 0, i32 0
  %13 = getelementptr inbounds [4 x float]* %12, i32 0, i64 1
  store float %11, float* %13, align 4
  %14 = load float** %4, align 8
  %15 = load float* %14, align 4
  %16 = getelementptr inbounds %class.btVector3* %5, i32 0, i32 0
  %17 = getelementptr inbounds [4 x float]* %16, i32 0, i64 2
  store float %15, float* %17, align 4
  %18 = getelementptr inbounds %class.btVector3* %5, i32 0, i32 0
  %19 = getelementptr inbounds [4 x float]* %18, i32 0, i64 3
  store float 0.000000e+00, float* %19, align 4
  ret void
}

declare void @_ZN22btVoronoiSimplexSolver5resetEv(%class.btVoronoiSimplexSolver*) #5

; Function Attrs: inlinehint uwtable
define linkonce_odr { <2 x float>, <2 x float> } @_ZmlRK9btVector3RK11btMatrix3x3(%class.btVector3* dereferenceable(16) %v, %class.btMatrix3x3* dereferenceable(48) %m) #4 {
  %1 = alloca %class.btVector3, align 4
  %2 = alloca %class.btVector3*, align 8
  %3 = alloca %class.btMatrix3x3*, align 8
  %4 = alloca float, align 4
  %5 = alloca float, align 4
  %6 = alloca float, align 4
  store %class.btVector3* %v, %class.btVector3** %2, align 8
  store %class.btMatrix3x3* %m, %class.btMatrix3x3** %3, align 8
  %7 = load %class.btMatrix3x3** %3, align 8
  %8 = load %class.btVector3** %2, align 8
  %9 = call float @_ZNK11btMatrix3x35tdotxERK9btVector3(%class.btMatrix3x3* %7, %class.btVector3* dereferenceable(16) %8)
  store float %9, float* %4
  %10 = load %class.btMatrix3x3** %3, align 8
  %11 = load %class.btVector3** %2, align 8
  %12 = call float @_ZNK11btMatrix3x35tdotyERK9btVector3(%class.btMatrix3x3* %10, %class.btVector3* dereferenceable(16) %11)
  store float %12, float* %5
  %13 = load %class.btMatrix3x3** %3, align 8
  %14 = load %class.btVector3** %2, align 8
  %15 = call float @_ZNK11btMatrix3x35tdotzERK9btVector3(%class.btMatrix3x3* %13, %class.btVector3* dereferenceable(16) %14)
  store float %15, float* %6
  call void @_ZN9btVector3C2ERKfS1_S1_(%class.btVector3* %1, float* dereferenceable(4) %4, float* dereferenceable(4) %5, float* dereferenceable(4) %6)
  %16 = getelementptr %class.btVector3* %1, i32 0, i32 0
  %17 = bitcast [4 x float]* %16 to { <2 x float>, <2 x float> }*
  %18 = load { <2 x float>, <2 x float> }* %17, align 1
  ret { <2 x float>, <2 x float> } %18
}

; Function Attrs: inlinehint uwtable
define linkonce_odr { <2 x float>, <2 x float> } @_ZngRK9btVector3(%class.btVector3* dereferenceable(16) %v) #4 {
  %1 = alloca %class.btVector3, align 4
  %2 = alloca %class.btVector3*, align 8
  %3 = alloca float, align 4
  %4 = alloca float, align 4
  %5 = alloca float, align 4
  store %class.btVector3* %v, %class.btVector3** %2, align 8
  %6 = load %class.btVector3** %2, align 8
  %7 = getelementptr inbounds %class.btVector3* %6, i32 0, i32 0
  %8 = getelementptr inbounds [4 x float]* %7, i32 0, i64 0
  %9 = load float* %8, align 4
  %10 = fsub float -0.000000e+00, %9
  store float %10, float* %3
  %11 = load %class.btVector3** %2, align 8
  %12 = getelementptr inbounds %class.btVector3* %11, i32 0, i32 0
  %13 = getelementptr inbounds [4 x float]* %12, i32 0, i64 1
  %14 = load float* %13, align 4
  %15 = fsub float -0.000000e+00, %14
  store float %15, float* %4
  %16 = load %class.btVector3** %2, align 8
  %17 = getelementptr inbounds %class.btVector3* %16, i32 0, i32 0
  %18 = getelementptr inbounds [4 x float]* %17, i32 0, i64 2
  %19 = load float* %18, align 4
  %20 = fsub float -0.000000e+00, %19
  store float %20, float* %5
  call void @_ZN9btVector3C2ERKfS1_S1_(%class.btVector3* %1, float* dereferenceable(4) %3, float* dereferenceable(4) %4, float* dereferenceable(4) %5)
  %21 = getelementptr %class.btVector3* %1, i32 0, i32 0
  %22 = bitcast [4 x float]* %21 to { <2 x float>, <2 x float> }*
  %23 = load { <2 x float>, <2 x float> }* %22, align 1
  ret { <2 x float>, <2 x float> } %23
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dereferenceable(48) %class.btMatrix3x3* @_ZNK11btTransform8getBasisEv(%class.btTransform* %this) #1 align 2 {
  %1 = alloca %class.btTransform*, align 8
  store %class.btTransform* %this, %class.btTransform** %1, align 8
  %2 = load %class.btTransform** %1
  %3 = getelementptr inbounds %class.btTransform* %2, i32 0, i32 0
  ret %class.btMatrix3x3* %3
}

declare { <2 x float>, <2 x float> } @_ZNK13btConvexShape44localGetSupportVertexWithoutMarginNonVirtualERK9btVector3(%class.btConvexShape*, %class.btVector3* dereferenceable(16)) #5

; Function Attrs: inlinehint uwtable
define linkonce_odr { <2 x float>, <2 x float> } @_ZNK11btTransformclERK9btVector3(%class.btTransform* %this, %class.btVector3* dereferenceable(16) %x) #4 align 2 {
  %1 = alloca %class.btVector3, align 4
  %2 = alloca %class.btTransform*, align 8
  %3 = alloca %class.btVector3*, align 8
  %4 = alloca %class.btVector3, align 4
  store %class.btTransform* %this, %class.btTransform** %2, align 8
  store %class.btVector3* %x, %class.btVector3** %3, align 8
  %5 = load %class.btTransform** %2
  %6 = load %class.btVector3** %3, align 8
  %7 = getelementptr inbounds %class.btTransform* %5, i32 0, i32 0
  %8 = call dereferenceable(16) %class.btVector3* @_ZNK11btMatrix3x3ixEi(%class.btMatrix3x3* %7, i32 0)
  %9 = getelementptr inbounds %class.btTransform* %5, i32 0, i32 0
  %10 = call dereferenceable(16) %class.btVector3* @_ZNK11btMatrix3x3ixEi(%class.btMatrix3x3* %9, i32 1)
  %11 = getelementptr inbounds %class.btTransform* %5, i32 0, i32 0
  %12 = call dereferenceable(16) %class.btVector3* @_ZNK11btMatrix3x3ixEi(%class.btMatrix3x3* %11, i32 2)
  %13 = call { <2 x float>, <2 x float> } @_ZNK9btVector34dot3ERKS_S1_S1_(%class.btVector3* %6, %class.btVector3* dereferenceable(16) %8, %class.btVector3* dereferenceable(16) %10, %class.btVector3* dereferenceable(16) %12)
  %14 = getelementptr %class.btVector3* %4, i32 0, i32 0
  %15 = bitcast [4 x float]* %14 to { <2 x float>, <2 x float> }*
  %16 = getelementptr { <2 x float>, <2 x float> }* %15, i32 0, i32 0
  %17 = extractvalue { <2 x float>, <2 x float> } %13, 0
  store <2 x float> %17, <2 x float>* %16, align 1
  %18 = getelementptr { <2 x float>, <2 x float> }* %15, i32 0, i32 1
  %19 = extractvalue { <2 x float>, <2 x float> } %13, 1
  store <2 x float> %19, <2 x float>* %18, align 1
  %20 = getelementptr inbounds %class.btTransform* %5, i32 0, i32 1
  %21 = call { <2 x float>, <2 x float> } @_ZplRK9btVector3S1_(%class.btVector3* dereferenceable(16) %4, %class.btVector3* dereferenceable(16) %20)
  %22 = getelementptr %class.btVector3* %1, i32 0, i32 0
  %23 = bitcast [4 x float]* %22 to { <2 x float>, <2 x float> }*
  %24 = getelementptr { <2 x float>, <2 x float> }* %23, i32 0, i32 0
  %25 = extractvalue { <2 x float>, <2 x float> } %21, 0
  store <2 x float> %25, <2 x float>* %24, align 1
  %26 = getelementptr { <2 x float>, <2 x float> }* %23, i32 0, i32 1
  %27 = extractvalue { <2 x float>, <2 x float> } %21, 1
  store <2 x float> %27, <2 x float>* %26, align 1
  %28 = getelementptr %class.btVector3* %1, i32 0, i32 0
  %29 = bitcast [4 x float]* %28 to { <2 x float>, <2 x float> }*
  %30 = load { <2 x float>, <2 x float> }* %29, align 1
  ret { <2 x float>, <2 x float> } %30
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr float* @_ZN9btVector3cvPfEv(%class.btVector3* %this) #1 align 2 {
  %1 = alloca %class.btVector3*, align 8
  store %class.btVector3* %this, %class.btVector3** %1, align 8
  %2 = load %class.btVector3** %1
  %3 = getelementptr inbounds %class.btVector3* %2, i32 0, i32 0
  %4 = getelementptr inbounds [4 x float]* %3, i32 0, i64 0
  ret float* %4
}

; Function Attrs: inlinehint uwtable
define linkonce_odr { <2 x float>, <2 x float> } @_ZmiRK9btVector3S1_(%class.btVector3* dereferenceable(16) %v1, %class.btVector3* dereferenceable(16) %v2) #4 {
  %1 = alloca %class.btVector3, align 4
  %2 = alloca %class.btVector3*, align 8
  %3 = alloca %class.btVector3*, align 8
  %4 = alloca float, align 4
  %5 = alloca float, align 4
  %6 = alloca float, align 4
  store %class.btVector3* %v1, %class.btVector3** %2, align 8
  store %class.btVector3* %v2, %class.btVector3** %3, align 8
  %7 = load %class.btVector3** %2, align 8
  %8 = getelementptr inbounds %class.btVector3* %7, i32 0, i32 0
  %9 = getelementptr inbounds [4 x float]* %8, i32 0, i64 0
  %10 = load float* %9, align 4
  %11 = load %class.btVector3** %3, align 8
  %12 = getelementptr inbounds %class.btVector3* %11, i32 0, i32 0
  %13 = getelementptr inbounds [4 x float]* %12, i32 0, i64 0
  %14 = load float* %13, align 4
  %15 = fsub float %10, %14
  store float %15, float* %4
  %16 = load %class.btVector3** %2, align 8
  %17 = getelementptr inbounds %class.btVector3* %16, i32 0, i32 0
  %18 = getelementptr inbounds [4 x float]* %17, i32 0, i64 1
  %19 = load float* %18, align 4
  %20 = load %class.btVector3** %3, align 8
  %21 = getelementptr inbounds %class.btVector3* %20, i32 0, i32 0
  %22 = getelementptr inbounds [4 x float]* %21, i32 0, i64 1
  %23 = load float* %22, align 4
  %24 = fsub float %19, %23
  store float %24, float* %5
  %25 = load %class.btVector3** %2, align 8
  %26 = getelementptr inbounds %class.btVector3* %25, i32 0, i32 0
  %27 = getelementptr inbounds [4 x float]* %26, i32 0, i64 2
  %28 = load float* %27, align 4
  %29 = load %class.btVector3** %3, align 8
  %30 = getelementptr inbounds %class.btVector3* %29, i32 0, i32 0
  %31 = getelementptr inbounds [4 x float]* %30, i32 0, i64 2
  %32 = load float* %31, align 4
  %33 = fsub float %28, %32
  store float %33, float* %6
  call void @_ZN9btVector3C2ERKfS1_S1_(%class.btVector3* %1, float* dereferenceable(4) %4, float* dereferenceable(4) %5, float* dereferenceable(4) %6)
  %34 = getelementptr %class.btVector3* %1, i32 0, i32 0
  %35 = bitcast [4 x float]* %34 to { <2 x float>, <2 x float> }*
  %36 = load { <2 x float>, <2 x float> }* %35, align 1
  ret { <2 x float>, <2 x float> } %36
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr float @_ZNK9btVector33dotERKS_(%class.btVector3* %this, %class.btVector3* dereferenceable(16) %v) #1 align 2 {
  %1 = alloca %class.btVector3*, align 8
  %2 = alloca %class.btVector3*, align 8
  store %class.btVector3* %this, %class.btVector3** %1, align 8
  store %class.btVector3* %v, %class.btVector3** %2, align 8
  %3 = load %class.btVector3** %1
  %4 = getelementptr inbounds %class.btVector3* %3, i32 0, i32 0
  %5 = getelementptr inbounds [4 x float]* %4, i32 0, i64 0
  %6 = load float* %5, align 4
  %7 = load %class.btVector3** %2, align 8
  %8 = getelementptr inbounds %class.btVector3* %7, i32 0, i32 0
  %9 = getelementptr inbounds [4 x float]* %8, i32 0, i64 0
  %10 = load float* %9, align 4
  %11 = fmul float %6, %10
  %12 = getelementptr inbounds %class.btVector3* %3, i32 0, i32 0
  %13 = getelementptr inbounds [4 x float]* %12, i32 0, i64 1
  %14 = load float* %13, align 4
  %15 = load %class.btVector3** %2, align 8
  %16 = getelementptr inbounds %class.btVector3* %15, i32 0, i32 0
  %17 = getelementptr inbounds [4 x float]* %16, i32 0, i64 1
  %18 = load float* %17, align 4
  %19 = fmul float %14, %18
  %20 = fadd float %11, %19
  %21 = getelementptr inbounds %class.btVector3* %3, i32 0, i32 0
  %22 = getelementptr inbounds [4 x float]* %21, i32 0, i64 2
  %23 = load float* %22, align 4
  %24 = load %class.btVector3** %2, align 8
  %25 = getelementptr inbounds %class.btVector3* %24, i32 0, i32 0
  %26 = getelementptr inbounds [4 x float]* %25, i32 0, i64 2
  %27 = load float* %26, align 4
  %28 = fmul float %23, %27
  %29 = fadd float %20, %28
  ret float %29
}

declare zeroext i1 @_ZN22btVoronoiSimplexSolver9inSimplexERK9btVector3(%class.btVoronoiSimplexSolver*, %class.btVector3* dereferenceable(16)) #5

declare void @_ZN22btVoronoiSimplexSolver9addVertexERK9btVector3S2_S2_(%class.btVoronoiSimplexSolver*, %class.btVector3* dereferenceable(16), %class.btVector3* dereferenceable(16), %class.btVector3* dereferenceable(16)) #5

declare zeroext i1 @_ZN22btVoronoiSimplexSolver7closestER9btVector3(%class.btVoronoiSimplexSolver*, %class.btVector3* dereferenceable(16)) #5

; Function Attrs: inlinehint uwtable
define linkonce_odr float @_ZNK9btVector37length2Ev(%class.btVector3* %this) #4 align 2 {
  %1 = alloca %class.btVector3*, align 8
  store %class.btVector3* %this, %class.btVector3** %1, align 8
  %2 = load %class.btVector3** %1
  %3 = call float @_ZNK9btVector33dotERKS_(%class.btVector3* %2, %class.btVector3* dereferenceable(16) %2)
  ret float %3
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #6

; Function Attrs: nounwind uwtable
define linkonce_odr zeroext i1 @_ZNK22btVoronoiSimplexSolver11fullSimplexEv(%class.btVoronoiSimplexSolver* %this) #2 align 2 {
  %1 = alloca %class.btVoronoiSimplexSolver*, align 8
  store %class.btVoronoiSimplexSolver* %this, %class.btVoronoiSimplexSolver** %1, align 8
  %2 = load %class.btVoronoiSimplexSolver** %1
  %3 = getelementptr inbounds %class.btVoronoiSimplexSolver* %2, i32 0, i32 0
  %4 = load i32* %3, align 4
  %5 = icmp eq i32 %4, 4
  ret i1 %5
}

declare void @_ZN22btVoronoiSimplexSolver14compute_pointsER9btVector3S1_(%class.btVoronoiSimplexSolver*, %class.btVector3* dereferenceable(16), %class.btVector3* dereferenceable(16)) #5

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr float @_Z6btSqrtf(float %y) #1 {
  %1 = alloca float, align 4
  store float %y, float* %1, align 4
  %2 = load float* %1, align 4
  %3 = call float @sqrtf(float %2) #6
  ret float %3
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dereferenceable(16) %class.btVector3* @_ZN9btVector3mLERKf(%class.btVector3* %this, float* dereferenceable(4) %s) #1 align 2 {
  %1 = alloca %class.btVector3*, align 8
  %2 = alloca float*, align 8
  store %class.btVector3* %this, %class.btVector3** %1, align 8
  store float* %s, float** %2, align 8
  %3 = load %class.btVector3** %1
  %4 = load float** %2, align 8
  %5 = load float* %4, align 4
  %6 = getelementptr inbounds %class.btVector3* %3, i32 0, i32 0
  %7 = getelementptr inbounds [4 x float]* %6, i32 0, i64 0
  %8 = load float* %7, align 4
  %9 = fmul float %8, %5
  store float %9, float* %7, align 4
  %10 = load float** %2, align 8
  %11 = load float* %10, align 4
  %12 = getelementptr inbounds %class.btVector3* %3, i32 0, i32 0
  %13 = getelementptr inbounds [4 x float]* %12, i32 0, i64 1
  %14 = load float* %13, align 4
  %15 = fmul float %14, %11
  store float %15, float* %13, align 4
  %16 = load float** %2, align 8
  %17 = load float* %16, align 4
  %18 = getelementptr inbounds %class.btVector3* %3, i32 0, i32 0
  %19 = getelementptr inbounds [4 x float]* %18, i32 0, i64 2
  %20 = load float* %19, align 4
  %21 = fmul float %20, %17
  store float %21, float* %19, align 4
  ret %class.btVector3* %3
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dereferenceable(16) %class.btVector3* @_ZN9btVector3pLERKS_(%class.btVector3* %this, %class.btVector3* dereferenceable(16) %v) #1 align 2 {
  %1 = alloca %class.btVector3*, align 8
  %2 = alloca %class.btVector3*, align 8
  store %class.btVector3* %this, %class.btVector3** %1, align 8
  store %class.btVector3* %v, %class.btVector3** %2, align 8
  %3 = load %class.btVector3** %1
  %4 = load %class.btVector3** %2, align 8
  %5 = getelementptr inbounds %class.btVector3* %4, i32 0, i32 0
  %6 = getelementptr inbounds [4 x float]* %5, i32 0, i64 0
  %7 = load float* %6, align 4
  %8 = getelementptr inbounds %class.btVector3* %3, i32 0, i32 0
  %9 = getelementptr inbounds [4 x float]* %8, i32 0, i64 0
  %10 = load float* %9, align 4
  %11 = fadd float %10, %7
  store float %11, float* %9, align 4
  %12 = load %class.btVector3** %2, align 8
  %13 = getelementptr inbounds %class.btVector3* %12, i32 0, i32 0
  %14 = getelementptr inbounds [4 x float]* %13, i32 0, i64 1
  %15 = load float* %14, align 4
  %16 = getelementptr inbounds %class.btVector3* %3, i32 0, i32 0
  %17 = getelementptr inbounds [4 x float]* %16, i32 0, i64 1
  %18 = load float* %17, align 4
  %19 = fadd float %18, %15
  store float %19, float* %17, align 4
  %20 = load %class.btVector3** %2, align 8
  %21 = getelementptr inbounds %class.btVector3* %20, i32 0, i32 0
  %22 = getelementptr inbounds [4 x float]* %21, i32 0, i64 2
  %23 = load float* %22, align 4
  %24 = getelementptr inbounds %class.btVector3* %3, i32 0, i32 0
  %25 = getelementptr inbounds [4 x float]* %24, i32 0, i64 2
  %26 = load float* %25, align 4
  %27 = fadd float %26, %23
  store float %27, float* %25, align 4
  ret %class.btVector3* %3
}

; Function Attrs: uwtable
define linkonce_odr void @_ZN9btVector37setZeroEv(%class.btVector3* %this) #0 align 2 {
  %1 = alloca %class.btVector3*, align 8
  %2 = alloca float, align 4
  %3 = alloca float, align 4
  %4 = alloca float, align 4
  store %class.btVector3* %this, %class.btVector3** %1, align 8
  %5 = load %class.btVector3** %1
  store float 0.000000e+00, float* %2
  store float 0.000000e+00, float* %3
  store float 0.000000e+00, float* %4
  call void @_ZN9btVector38setValueERKfS1_S1_(%class.btVector3* %5, float* dereferenceable(4) %2, float* dereferenceable(4) %3, float* dereferenceable(4) %4)
  ret void
}

; Function Attrs: inlinehint uwtable
define linkonce_odr dereferenceable(16) %class.btVector3* @_ZN9btVector3dVERKf(%class.btVector3* %this, float* dereferenceable(4) %s) #4 align 2 {
  %1 = alloca %class.btVector3*, align 8
  %2 = alloca float*, align 8
  %3 = alloca float, align 4
  store %class.btVector3* %this, %class.btVector3** %1, align 8
  store float* %s, float** %2, align 8
  %4 = load %class.btVector3** %1
  %5 = load float** %2, align 8
  %6 = load float* %5, align 4
  %7 = fdiv float 1.000000e+00, %6
  store float %7, float* %3
  %8 = call dereferenceable(16) %class.btVector3* @_ZN9btVector3mLERKf(%class.btVector3* %4, float* dereferenceable(4) %3)
  ret %class.btVector3* %8
}

; Function Attrs: inlinehint uwtable
define linkonce_odr float @_ZNK9btVector36lengthEv(%class.btVector3* %this) #4 align 2 {
  %1 = alloca %class.btVector3*, align 8
  store %class.btVector3* %this, %class.btVector3** %1, align 8
  %2 = load %class.btVector3** %1
  %3 = call float @_ZNK9btVector37length2Ev(%class.btVector3* %2)
  %4 = call float @_Z6btSqrtf(float %3)
  ret float %4
}

; Function Attrs: inlinehint uwtable
define linkonce_odr dereferenceable(16) %class.btVector3* @_ZN9btVector39normalizeEv(%class.btVector3* %this) #4 align 2 {
  %1 = alloca %class.btVector3*, align 8
  %2 = alloca float, align 4
  store %class.btVector3* %this, %class.btVector3** %1, align 8
  %3 = load %class.btVector3** %1
  %4 = call float @_ZNK9btVector36lengthEv(%class.btVector3* %3)
  store float %4, float* %2
  %5 = call dereferenceable(16) %class.btVector3* @_ZN9btVector3dVERKf(%class.btVector3* %3, float* dereferenceable(4) %2)
  ret %class.btVector3* %5
}

; Function Attrs: uwtable
define linkonce_odr void @_ZN17btGjkPairDetectorD2Ev(%class.btGjkPairDetector* %this) unnamed_addr #0 align 2 {
  %1 = alloca %class.btGjkPairDetector*, align 8
  store %class.btGjkPairDetector* %this, %class.btGjkPairDetector** %1, align 8
  %2 = load %class.btGjkPairDetector** %1
  %3 = bitcast %class.btGjkPairDetector* %2 to %struct.btDiscreteCollisionDetectorInterface*
  call void @_ZN36btDiscreteCollisionDetectorInterfaceD2Ev(%struct.btDiscreteCollisionDetectorInterface* %3)
  ret void
}

; Function Attrs: uwtable
define linkonce_odr void @_ZN17btGjkPairDetectorD0Ev(%class.btGjkPairDetector* %this) unnamed_addr #0 align 2 {
  %1 = alloca %class.btGjkPairDetector*, align 8
  %2 = alloca i8*
  %3 = alloca i32
  store %class.btGjkPairDetector* %this, %class.btGjkPairDetector** %1, align 8
  %4 = load %class.btGjkPairDetector** %1
  invoke void @_ZN17btGjkPairDetectorD2Ev(%class.btGjkPairDetector* %4)
          to label %5 unwind label %7

; <label>:5                                       ; preds = %0
  %6 = bitcast %class.btGjkPairDetector* %4 to i8*
  call void @_ZdlPv(i8* %6) #10
  ret void

; <label>:7                                       ; preds = %0
  %8 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
  %9 = extractvalue { i8*, i32 } %8, 0
  store i8* %9, i8** %2
  %10 = extractvalue { i8*, i32 } %8, 1
  store i32 %10, i32* %3
  %11 = bitcast %class.btGjkPairDetector* %4 to i8*
  call void @_ZdlPv(i8* %11) #10
  br label %12

; <label>:12                                      ; preds = %7
  %13 = load i8** %2
  %14 = load i32* %3
  %15 = insertvalue { i8*, i32 } undef, i8* %13, 0
  %16 = insertvalue { i8*, i32 } %15, i32 %14, 1
  resume { i8*, i32 } %16
}

; Function Attrs: nobuiltin nounwind
declare void @_ZdlPv(i8*) #7

; Function Attrs: nounwind
declare float @sqrtf(float) #8

; Function Attrs: inlinehint uwtable
define linkonce_odr { <2 x float>, <2 x float> } @_ZNK9btVector34dot3ERKS_S1_S1_(%class.btVector3* %this, %class.btVector3* dereferenceable(16) %v0, %class.btVector3* dereferenceable(16) %v1, %class.btVector3* dereferenceable(16) %v2) #4 align 2 {
  %1 = alloca %class.btVector3, align 4
  %2 = alloca %class.btVector3*, align 8
  %3 = alloca %class.btVector3*, align 8
  %4 = alloca %class.btVector3*, align 8
  %5 = alloca %class.btVector3*, align 8
  %6 = alloca float, align 4
  %7 = alloca float, align 4
  %8 = alloca float, align 4
  store %class.btVector3* %this, %class.btVector3** %2, align 8
  store %class.btVector3* %v0, %class.btVector3** %3, align 8
  store %class.btVector3* %v1, %class.btVector3** %4, align 8
  store %class.btVector3* %v2, %class.btVector3** %5, align 8
  %9 = load %class.btVector3** %2
  %10 = load %class.btVector3** %3, align 8
  %11 = call float @_ZNK9btVector33dotERKS_(%class.btVector3* %9, %class.btVector3* dereferenceable(16) %10)
  store float %11, float* %6
  %12 = load %class.btVector3** %4, align 8
  %13 = call float @_ZNK9btVector33dotERKS_(%class.btVector3* %9, %class.btVector3* dereferenceable(16) %12)
  store float %13, float* %7
  %14 = load %class.btVector3** %5, align 8
  %15 = call float @_ZNK9btVector33dotERKS_(%class.btVector3* %9, %class.btVector3* dereferenceable(16) %14)
  store float %15, float* %8
  call void @_ZN9btVector3C2ERKfS1_S1_(%class.btVector3* %1, float* dereferenceable(4) %6, float* dereferenceable(4) %7, float* dereferenceable(4) %8)
  %16 = getelementptr %class.btVector3* %1, i32 0, i32 0
  %17 = bitcast [4 x float]* %16 to { <2 x float>, <2 x float> }*
  %18 = load { <2 x float>, <2 x float> }* %17, align 1
  ret { <2 x float>, <2 x float> } %18
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dereferenceable(16) %class.btVector3* @_ZNK11btMatrix3x3ixEi(%class.btMatrix3x3* %this, i32 %i) #1 align 2 {
  %1 = alloca %class.btMatrix3x3*, align 8
  %2 = alloca i32, align 4
  store %class.btMatrix3x3* %this, %class.btMatrix3x3** %1, align 8
  store i32 %i, i32* %2, align 4
  %3 = load %class.btMatrix3x3** %1
  %4 = load i32* %2, align 4
  %5 = sext i32 %4 to i64
  %6 = getelementptr inbounds %class.btMatrix3x3* %3, i32 0, i32 0
  %7 = getelementptr inbounds [3 x %class.btVector3]* %6, i32 0, i64 %5
  ret %class.btVector3* %7
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr float @_ZNK11btMatrix3x35tdotxERK9btVector3(%class.btMatrix3x3* %this, %class.btVector3* dereferenceable(16) %v) #1 align 2 {
  %1 = alloca %class.btMatrix3x3*, align 8
  %2 = alloca %class.btVector3*, align 8
  store %class.btMatrix3x3* %this, %class.btMatrix3x3** %1, align 8
  store %class.btVector3* %v, %class.btVector3** %2, align 8
  %3 = load %class.btMatrix3x3** %1
  %4 = getelementptr inbounds %class.btMatrix3x3* %3, i32 0, i32 0
  %5 = getelementptr inbounds [3 x %class.btVector3]* %4, i32 0, i64 0
  %6 = call dereferenceable(4) float* @_ZNK9btVector31xEv(%class.btVector3* %5)
  %7 = load float* %6
  %8 = load %class.btVector3** %2, align 8
  %9 = call dereferenceable(4) float* @_ZNK9btVector31xEv(%class.btVector3* %8)
  %10 = load float* %9
  %11 = fmul float %7, %10
  %12 = getelementptr inbounds %class.btMatrix3x3* %3, i32 0, i32 0
  %13 = getelementptr inbounds [3 x %class.btVector3]* %12, i32 0, i64 1
  %14 = call dereferenceable(4) float* @_ZNK9btVector31xEv(%class.btVector3* %13)
  %15 = load float* %14
  %16 = load %class.btVector3** %2, align 8
  %17 = call dereferenceable(4) float* @_ZNK9btVector31yEv(%class.btVector3* %16)
  %18 = load float* %17
  %19 = fmul float %15, %18
  %20 = fadd float %11, %19
  %21 = getelementptr inbounds %class.btMatrix3x3* %3, i32 0, i32 0
  %22 = getelementptr inbounds [3 x %class.btVector3]* %21, i32 0, i64 2
  %23 = call dereferenceable(4) float* @_ZNK9btVector31xEv(%class.btVector3* %22)
  %24 = load float* %23
  %25 = load %class.btVector3** %2, align 8
  %26 = call dereferenceable(4) float* @_ZNK9btVector31zEv(%class.btVector3* %25)
  %27 = load float* %26
  %28 = fmul float %24, %27
  %29 = fadd float %20, %28
  ret float %29
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr float @_ZNK11btMatrix3x35tdotyERK9btVector3(%class.btMatrix3x3* %this, %class.btVector3* dereferenceable(16) %v) #1 align 2 {
  %1 = alloca %class.btMatrix3x3*, align 8
  %2 = alloca %class.btVector3*, align 8
  store %class.btMatrix3x3* %this, %class.btMatrix3x3** %1, align 8
  store %class.btVector3* %v, %class.btVector3** %2, align 8
  %3 = load %class.btMatrix3x3** %1
  %4 = getelementptr inbounds %class.btMatrix3x3* %3, i32 0, i32 0
  %5 = getelementptr inbounds [3 x %class.btVector3]* %4, i32 0, i64 0
  %6 = call dereferenceable(4) float* @_ZNK9btVector31yEv(%class.btVector3* %5)
  %7 = load float* %6
  %8 = load %class.btVector3** %2, align 8
  %9 = call dereferenceable(4) float* @_ZNK9btVector31xEv(%class.btVector3* %8)
  %10 = load float* %9
  %11 = fmul float %7, %10
  %12 = getelementptr inbounds %class.btMatrix3x3* %3, i32 0, i32 0
  %13 = getelementptr inbounds [3 x %class.btVector3]* %12, i32 0, i64 1
  %14 = call dereferenceable(4) float* @_ZNK9btVector31yEv(%class.btVector3* %13)
  %15 = load float* %14
  %16 = load %class.btVector3** %2, align 8
  %17 = call dereferenceable(4) float* @_ZNK9btVector31yEv(%class.btVector3* %16)
  %18 = load float* %17
  %19 = fmul float %15, %18
  %20 = fadd float %11, %19
  %21 = getelementptr inbounds %class.btMatrix3x3* %3, i32 0, i32 0
  %22 = getelementptr inbounds [3 x %class.btVector3]* %21, i32 0, i64 2
  %23 = call dereferenceable(4) float* @_ZNK9btVector31yEv(%class.btVector3* %22)
  %24 = load float* %23
  %25 = load %class.btVector3** %2, align 8
  %26 = call dereferenceable(4) float* @_ZNK9btVector31zEv(%class.btVector3* %25)
  %27 = load float* %26
  %28 = fmul float %24, %27
  %29 = fadd float %20, %28
  ret float %29
}

; Function Attrs: inlinehint uwtable
define linkonce_odr float @_ZNK11btMatrix3x35tdotzERK9btVector3(%class.btMatrix3x3* %this, %class.btVector3* dereferenceable(16) %v) #4 align 2 {
  %1 = alloca %class.btMatrix3x3*, align 8
  %2 = alloca %class.btVector3*, align 8
  store %class.btMatrix3x3* %this, %class.btMatrix3x3** %1, align 8
  store %class.btVector3* %v, %class.btVector3** %2, align 8
  %3 = load %class.btMatrix3x3** %1
  %4 = getelementptr inbounds %class.btMatrix3x3* %3, i32 0, i32 0
  %5 = getelementptr inbounds [3 x %class.btVector3]* %4, i32 0, i64 0
  %6 = call dereferenceable(4) float* @_ZNK9btVector31zEv(%class.btVector3* %5)
  %7 = load float* %6
  %8 = load %class.btVector3** %2, align 8
  %9 = call dereferenceable(4) float* @_ZNK9btVector31xEv(%class.btVector3* %8)
  %10 = load float* %9
  %11 = fmul float %7, %10
  %12 = getelementptr inbounds %class.btMatrix3x3* %3, i32 0, i32 0
  %13 = getelementptr inbounds [3 x %class.btVector3]* %12, i32 0, i64 1
  %14 = call dereferenceable(4) float* @_ZNK9btVector31zEv(%class.btVector3* %13)
  %15 = load float* %14
  %16 = load %class.btVector3** %2, align 8
  %17 = call dereferenceable(4) float* @_ZNK9btVector31yEv(%class.btVector3* %16)
  %18 = load float* %17
  %19 = fmul float %15, %18
  %20 = fadd float %11, %19
  %21 = getelementptr inbounds %class.btMatrix3x3* %3, i32 0, i32 0
  %22 = getelementptr inbounds [3 x %class.btVector3]* %21, i32 0, i64 2
  %23 = call dereferenceable(4) float* @_ZNK9btVector31zEv(%class.btVector3* %22)
  %24 = load float* %23
  %25 = load %class.btVector3** %2, align 8
  %26 = call dereferenceable(4) float* @_ZNK9btVector31zEv(%class.btVector3* %25)
  %27 = load float* %26
  %28 = fmul float %24, %27
  %29 = fadd float %20, %28
  ret float %29
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dereferenceable(4) float* @_ZNK9btVector31zEv(%class.btVector3* %this) #1 align 2 {
  %1 = alloca %class.btVector3*, align 8
  store %class.btVector3* %this, %class.btVector3** %1, align 8
  %2 = load %class.btVector3** %1
  %3 = getelementptr inbounds %class.btVector3* %2, i32 0, i32 0
  %4 = getelementptr inbounds [4 x float]* %3, i32 0, i64 2
  ret float* %4
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dereferenceable(4) float* @_ZNK9btVector31xEv(%class.btVector3* %this) #1 align 2 {
  %1 = alloca %class.btVector3*, align 8
  store %class.btVector3* %this, %class.btVector3** %1, align 8
  %2 = load %class.btVector3** %1
  %3 = getelementptr inbounds %class.btVector3* %2, i32 0, i32 0
  %4 = getelementptr inbounds [4 x float]* %3, i32 0, i64 0
  ret float* %4
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dereferenceable(4) float* @_ZNK9btVector31yEv(%class.btVector3* %this) #1 align 2 {
  %1 = alloca %class.btVector3*, align 8
  store %class.btVector3* %this, %class.btVector3** %1, align 8
  %2 = load %class.btVector3** %1
  %3 = getelementptr inbounds %class.btVector3* %2, i32 0, i32 0
  %4 = getelementptr inbounds [4 x float]* %3, i32 0, i64 1
  ret float* %4
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr zeroext i1 @_ZN17btBroadphaseProxy10isConvex2dEi(i32 %proxyType) #1 align 2 {
  %1 = alloca i32, align 4
  store i32 %proxyType, i32* %1, align 4
  %2 = load i32* %1, align 4
  %3 = icmp eq i32 %2, 17
  br i1 %3, label %7, label %4

; <label>:4                                       ; preds = %0
  %5 = load i32* %1, align 4
  %6 = icmp eq i32 %5, 18
  br label %7

; <label>:7                                       ; preds = %4, %0
  %8 = phi i1 [ true, %0 ], [ %6, %4 ]
  ret i1 %8
}

; Function Attrs: inlinehint uwtable
define linkonce_odr void @_ZN11btMatrix3x3C2ERKS_(%class.btMatrix3x3* %this, %class.btMatrix3x3* dereferenceable(48) %other) unnamed_addr #4 align 2 {
  %1 = alloca %class.btMatrix3x3*, align 8
  %2 = alloca %class.btMatrix3x3*, align 8
  store %class.btMatrix3x3* %this, %class.btMatrix3x3** %1, align 8
  store %class.btMatrix3x3* %other, %class.btMatrix3x3** %2, align 8
  %3 = load %class.btMatrix3x3** %1
  %4 = getelementptr inbounds %class.btMatrix3x3* %3, i32 0, i32 0
  %5 = getelementptr inbounds [3 x %class.btVector3]* %4, i32 0, i32 0
  %6 = getelementptr inbounds %class.btVector3* %5, i64 3
  br label %7

; <label>:7                                       ; preds = %7, %0
  %8 = phi %class.btVector3* [ %5, %0 ], [ %9, %7 ]
  call void @_ZN9btVector3C2Ev(%class.btVector3* %8)
  %9 = getelementptr inbounds %class.btVector3* %8, i64 1
  %10 = icmp eq %class.btVector3* %9, %6
  br i1 %10, label %11, label %7

; <label>:11                                      ; preds = %7
  %12 = getelementptr inbounds %class.btMatrix3x3* %3, i32 0, i32 0
  %13 = getelementptr inbounds [3 x %class.btVector3]* %12, i32 0, i64 0
  %14 = load %class.btMatrix3x3** %2, align 8
  %15 = getelementptr inbounds %class.btMatrix3x3* %14, i32 0, i32 0
  %16 = getelementptr inbounds [3 x %class.btVector3]* %15, i32 0, i64 0
  %17 = bitcast %class.btVector3* %13 to i8*
  %18 = bitcast %class.btVector3* %16 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %17, i8* %18, i64 16, i32 4, i1 false)
  %19 = getelementptr inbounds %class.btMatrix3x3* %3, i32 0, i32 0
  %20 = getelementptr inbounds [3 x %class.btVector3]* %19, i32 0, i64 1
  %21 = load %class.btMatrix3x3** %2, align 8
  %22 = getelementptr inbounds %class.btMatrix3x3* %21, i32 0, i32 0
  %23 = getelementptr inbounds [3 x %class.btVector3]* %22, i32 0, i64 1
  %24 = bitcast %class.btVector3* %20 to i8*
  %25 = bitcast %class.btVector3* %23 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %24, i8* %25, i64 16, i32 4, i1 false)
  %26 = getelementptr inbounds %class.btMatrix3x3* %3, i32 0, i32 0
  %27 = getelementptr inbounds [3 x %class.btVector3]* %26, i32 0, i64 2
  %28 = load %class.btMatrix3x3** %2, align 8
  %29 = getelementptr inbounds %class.btMatrix3x3* %28, i32 0, i32 0
  %30 = getelementptr inbounds [3 x %class.btVector3]* %29, i32 0, i64 2
  %31 = bitcast %class.btVector3* %27 to i8*
  %32 = bitcast %class.btVector3* %30 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %31, i8* %32, i64 16, i32 4, i1 false)
  ret void
}

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN36btDiscreteCollisionDetectorInterfaceD2Ev(%struct.btDiscreteCollisionDetectorInterface* %this) unnamed_addr #2 align 2 {
  %1 = alloca %struct.btDiscreteCollisionDetectorInterface*, align 8
  store %struct.btDiscreteCollisionDetectorInterface* %this, %struct.btDiscreteCollisionDetectorInterface** %1, align 8
  %2 = load %struct.btDiscreteCollisionDetectorInterface** %1
  ret void
}

; Function Attrs: uwtable
define linkonce_odr void @_ZN36btDiscreteCollisionDetectorInterfaceD0Ev(%struct.btDiscreteCollisionDetectorInterface* %this) unnamed_addr #0 align 2 {
  %1 = alloca %struct.btDiscreteCollisionDetectorInterface*, align 8
  %2 = alloca i8*
  %3 = alloca i32
  store %struct.btDiscreteCollisionDetectorInterface* %this, %struct.btDiscreteCollisionDetectorInterface** %1, align 8
  %4 = load %struct.btDiscreteCollisionDetectorInterface** %1
  invoke void @_ZN36btDiscreteCollisionDetectorInterfaceD2Ev(%struct.btDiscreteCollisionDetectorInterface* %4)
          to label %5 unwind label %7

; <label>:5                                       ; preds = %0
  %6 = bitcast %struct.btDiscreteCollisionDetectorInterface* %4 to i8*
  call void @_ZdlPv(i8* %6) #10
  ret void

; <label>:7                                       ; preds = %0
  %8 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
  %9 = extractvalue { i8*, i32 } %8, 0
  store i8* %9, i8** %2
  %10 = extractvalue { i8*, i32 } %8, 1
  store i32 %10, i32* %3
  %11 = bitcast %struct.btDiscreteCollisionDetectorInterface* %4 to i8*
  call void @_ZdlPv(i8* %11) #10
  br label %12

; <label>:12                                      ; preds = %7
  %13 = load i8** %2
  %14 = load i32* %3
  %15 = insertvalue { i8*, i32 } undef, i8* %13, 0
  %16 = insertvalue { i8*, i32 } %15, i32 %14, 1
  resume { i8*, i32 } %16
}

declare void @__cxa_pure_virtual()

attributes #0 = { uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { inlinehint nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noinline noreturn nounwind }
attributes #4 = { inlinehint uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { nobuiltin nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #9 = { noreturn nounwind }
attributes #10 = { builtin nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
