; ModuleID = 'btGjkPairDetector.ll'
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
  %1 = alloca float, align 4
  %2 = alloca float, align 4
  %3 = alloca float, align 4
  %4 = bitcast %class.btGjkPairDetector* %this to %struct.btDiscreteCollisionDetectorInterface*
  call void @_ZN36btDiscreteCollisionDetectorInterfaceC2Ev(%struct.btDiscreteCollisionDetectorInterface* %4) #6
  %5 = bitcast %class.btGjkPairDetector* %this to i32 (...)***
  store i32 (...)** bitcast (i8** getelementptr inbounds ([5 x i8*]* @_ZTV17btGjkPairDetector, i64 0, i64 2) to i32 (...)**), i32 (...)*** %5
  %6 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 1
  store float 0.000000e+00, float* %1
  store float 1.000000e+00, float* %2
  store float 0.000000e+00, float* %3
  invoke void @_ZN9btVector3C2ERKfS1_S1_(%class.btVector3* %6, float* dereferenceable(4) %1, float* dereferenceable(4) %2, float* dereferenceable(4) %3)
          to label %7 unwind label %37

; <label>:7                                       ; preds = %0
  %8 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 2
  store %class.btConvexPenetrationDepthSolver* %penetrationDepthSolver, %class.btConvexPenetrationDepthSolver** %8, align 8
  %9 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 3
  store %class.btVoronoiSimplexSolver* %simplexSolver, %class.btVoronoiSimplexSolver** %9, align 8
  %10 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 4
  store %class.btConvexShape* %objectA, %class.btConvexShape** %10, align 8
  %11 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 5
  store %class.btConvexShape* %objectB, %class.btConvexShape** %11, align 8
  %12 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 6
  %13 = bitcast %class.btConvexShape* %objectA to %class.btCollisionShape*
  %14 = invoke i32 @_ZNK16btCollisionShape12getShapeTypeEv(%class.btCollisionShape* %13)
          to label %15 unwind label %37

; <label>:15                                      ; preds = %7
  store i32 %14, i32* %12, align 4
  %16 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 7
  %17 = bitcast %class.btConvexShape* %objectB to %class.btCollisionShape*
  %18 = invoke i32 @_ZNK16btCollisionShape12getShapeTypeEv(%class.btCollisionShape* %17)
          to label %19 unwind label %37

; <label>:19                                      ; preds = %15
  store i32 %18, i32* %16, align 4
  %20 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 8
  %21 = bitcast %class.btConvexShape* %objectA to float (%class.btConvexShape*)***
  %22 = load float (%class.btConvexShape*)*** %21
  %23 = getelementptr inbounds float (%class.btConvexShape*)** %22, i64 12
  %24 = load float (%class.btConvexShape*)** %23
  %25 = invoke float %24(%class.btConvexShape* %objectA)
          to label %26 unwind label %37

; <label>:26                                      ; preds = %19
  store float %25, float* %20, align 4
  %27 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 9
  %28 = bitcast %class.btConvexShape* %objectB to float (%class.btConvexShape*)***
  %29 = load float (%class.btConvexShape*)*** %28
  %30 = getelementptr inbounds float (%class.btConvexShape*)** %29, i64 12
  %31 = load float (%class.btConvexShape*)** %30
  %32 = invoke float %31(%class.btConvexShape* %objectB)
          to label %33 unwind label %37

; <label>:33                                      ; preds = %26
  store float %32, float* %27, align 4
  %34 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 10
  store i8 0, i8* %34, align 1
  %35 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 12
  store i32 -1, i32* %35, align 4
  %36 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 15
  store i32 1, i32* %36, align 4
  ret void

; <label>:37                                      ; preds = %26, %19, %15, %7, %0
  %38 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
  %39 = extractvalue { i8*, i32 } %38, 0
  %40 = extractvalue { i8*, i32 } %38, 1
  %41 = bitcast %class.btGjkPairDetector* %this to %struct.btDiscreteCollisionDetectorInterface*
  invoke void @_ZN36btDiscreteCollisionDetectorInterfaceD2Ev(%struct.btDiscreteCollisionDetectorInterface* %41)
          to label %42 unwind label %46

; <label>:42                                      ; preds = %37
  br label %43

; <label>:43                                      ; preds = %42
  %44 = insertvalue { i8*, i32 } undef, i8* %39, 0
  %45 = insertvalue { i8*, i32 } %44, i32 %40, 1
  resume { i8*, i32 } %45

; <label>:46                                      ; preds = %37
  %47 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          catch i8* null
  %48 = extractvalue { i8*, i32 } %47, 0
  call void @__clang_call_terminate(i8* %48) #9
  unreachable
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr void @_ZN36btDiscreteCollisionDetectorInterfaceC2Ev(%struct.btDiscreteCollisionDetectorInterface* %this) unnamed_addr #1 align 2 {
  %1 = bitcast %struct.btDiscreteCollisionDetectorInterface* %this to i32 (...)***
  store i32 (...)** bitcast (i8** getelementptr inbounds ([5 x i8*]* @_ZTV36btDiscreteCollisionDetectorInterface, i64 0, i64 2) to i32 (...)**), i32 (...)*** %1
  ret void
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr void @_ZN9btVector3C2ERKfS1_S1_(%class.btVector3* %this, float* dereferenceable(4) %_x, float* dereferenceable(4) %_y, float* dereferenceable(4) %_z) unnamed_addr #1 align 2 {
  %1 = load float* %_x, align 4
  %2 = getelementptr inbounds %class.btVector3* %this, i32 0, i32 0
  %3 = getelementptr inbounds [4 x float]* %2, i32 0, i64 0
  store float %1, float* %3, align 4
  %4 = load float* %_y, align 4
  %5 = getelementptr inbounds %class.btVector3* %this, i32 0, i32 0
  %6 = getelementptr inbounds [4 x float]* %5, i32 0, i64 1
  store float %4, float* %6, align 4
  %7 = load float* %_z, align 4
  %8 = getelementptr inbounds %class.btVector3* %this, i32 0, i32 0
  %9 = getelementptr inbounds [4 x float]* %8, i32 0, i64 2
  store float %7, float* %9, align 4
  %10 = getelementptr inbounds %class.btVector3* %this, i32 0, i32 0
  %11 = getelementptr inbounds [4 x float]* %10, i32 0, i64 3
  store float 0.000000e+00, float* %11, align 4
  ret void
}

declare i32 @__gxx_personality_v0(...)

; Function Attrs: nounwind uwtable
define linkonce_odr i32 @_ZNK16btCollisionShape12getShapeTypeEv(%class.btCollisionShape* %this) #2 align 2 {
  %1 = getelementptr inbounds %class.btCollisionShape* %this, i32 0, i32 1
  %2 = load i32* %1, align 4
  ret i32 %2
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
  %1 = alloca float, align 4
  %2 = alloca float, align 4
  %3 = alloca float, align 4
  %4 = bitcast %class.btGjkPairDetector* %this to %struct.btDiscreteCollisionDetectorInterface*
  call void @_ZN36btDiscreteCollisionDetectorInterfaceC2Ev(%struct.btDiscreteCollisionDetectorInterface* %4) #6
  %5 = bitcast %class.btGjkPairDetector* %this to i32 (...)***
  store i32 (...)** bitcast (i8** getelementptr inbounds ([5 x i8*]* @_ZTV17btGjkPairDetector, i64 0, i64 2) to i32 (...)**), i32 (...)*** %5
  %6 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 1
  store float 0.000000e+00, float* %1
  store float 1.000000e+00, float* %2
  store float 0.000000e+00, float* %3
  invoke void @_ZN9btVector3C2ERKfS1_S1_(%class.btVector3* %6, float* dereferenceable(4) %1, float* dereferenceable(4) %2, float* dereferenceable(4) %3)
          to label %7 unwind label %19

; <label>:7                                       ; preds = %0
  %8 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 2
  store %class.btConvexPenetrationDepthSolver* %penetrationDepthSolver, %class.btConvexPenetrationDepthSolver** %8, align 8
  %9 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 3
  store %class.btVoronoiSimplexSolver* %simplexSolver, %class.btVoronoiSimplexSolver** %9, align 8
  %10 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 4
  store %class.btConvexShape* %objectA, %class.btConvexShape** %10, align 8
  %11 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 5
  store %class.btConvexShape* %objectB, %class.btConvexShape** %11, align 8
  %12 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 6
  store i32 %shapeTypeA, i32* %12, align 4
  %13 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 7
  store i32 %shapeTypeB, i32* %13, align 4
  %14 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 8
  store float %marginA, float* %14, align 4
  %15 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 9
  store float %marginB, float* %15, align 4
  %16 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 10
  store i8 0, i8* %16, align 1
  %17 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 12
  store i32 -1, i32* %17, align 4
  %18 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 15
  store i32 1, i32* %18, align 4
  ret void

; <label>:19                                      ; preds = %0
  %20 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
  %21 = extractvalue { i8*, i32 } %20, 0
  %22 = extractvalue { i8*, i32 } %20, 1
  %23 = bitcast %class.btGjkPairDetector* %this to %struct.btDiscreteCollisionDetectorInterface*
  invoke void @_ZN36btDiscreteCollisionDetectorInterfaceD2Ev(%struct.btDiscreteCollisionDetectorInterface* %23)
          to label %24 unwind label %28

; <label>:24                                      ; preds = %19
  br label %25

; <label>:25                                      ; preds = %24
  %26 = insertvalue { i8*, i32 } undef, i8* %21, 0
  %27 = insertvalue { i8*, i32 } %26, i32 %22, 1
  resume { i8*, i32 } %27

; <label>:28                                      ; preds = %19
  %29 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          catch i8* null
  %30 = extractvalue { i8*, i32 } %29, 0
  call void @__clang_call_terminate(i8* %30) #9
  unreachable
}

; Function Attrs: uwtable
define void @_ZN17btGjkPairDetector16getClosestPointsERKN36btDiscreteCollisionDetectorInterface17ClosestPointInputERNS0_6ResultEP12btIDebugDrawb(%class.btGjkPairDetector* %this, %"struct.btDiscreteCollisionDetectorInterface::ClosestPointInput"* dereferenceable(144) %input, %"struct.btDiscreteCollisionDetectorInterface::Result"* dereferenceable(8) %output, %class.btIDebugDraw* %debugDraw, i1 zeroext %swapResults) unnamed_addr #0 align 2 {
  %1 = zext i1 %swapResults to i8
  call void @_ZN17btGjkPairDetector26getClosestPointsNonVirtualERKN36btDiscreteCollisionDetectorInterface17ClosestPointInputERNS0_6ResultEP12btIDebugDraw(%class.btGjkPairDetector* %this, %"struct.btDiscreteCollisionDetectorInterface::ClosestPointInput"* dereferenceable(144) %input, %"struct.btDiscreteCollisionDetectorInterface::Result"* dereferenceable(8) %output, %class.btIDebugDraw* %debugDraw)
  ret void
}

; Function Attrs: uwtable
define void @_ZN17btGjkPairDetector26getClosestPointsNonVirtualERKN36btDiscreteCollisionDetectorInterface17ClosestPointInputERNS0_6ResultEP12btIDebugDraw(%class.btGjkPairDetector* %this, %"struct.btDiscreteCollisionDetectorInterface::ClosestPointInput"* dereferenceable(144) %input, %"struct.btDiscreteCollisionDetectorInterface::Result"* dereferenceable(8) %output, %class.btIDebugDraw* %debugDraw) #0 align 2 {
  %normalInB = alloca %class.btVector3, align 4
  %1 = alloca float, align 4
  %2 = alloca float, align 4
  %3 = alloca float, align 4
  %pointOnA = alloca %class.btVector3, align 4
  %pointOnB = alloca %class.btVector3, align 4
  %localTransA = alloca %class.btTransform, align 4
  %localTransB = alloca %class.btTransform, align 4
  %positionOffset = alloca %class.btVector3, align 4
  %4 = alloca %class.btVector3, align 4
  %5 = alloca float, align 4
  %marginA = alloca float, align 4
  %marginB = alloca float, align 4
  %6 = alloca float, align 4
  %7 = alloca float, align 4
  %8 = alloca float, align 4
  %seperatingAxisInA = alloca %class.btVector3, align 4
  %9 = alloca %class.btVector3, align 4
  %seperatingAxisInB = alloca %class.btVector3, align 4
  %pInA = alloca %class.btVector3, align 4
  %qInB = alloca %class.btVector3, align 4
  %pWorld = alloca %class.btVector3, align 4
  %qWorld = alloca %class.btVector3, align 4
  %w = alloca %class.btVector3, align 4
  %newCachedSeparatingAxis = alloca %class.btVector3, align 4
  %rlen = alloca float, align 4
  %10 = alloca %class.btVector3, align 4
  %11 = alloca float, align 4
  %12 = alloca %class.btVector3, align 4
  %13 = alloca float, align 4
  %tmpPointOnA = alloca %class.btVector3, align 4
  %tmpPointOnB = alloca %class.btVector3, align 4
  %tmpNormalInB = alloca %class.btVector3, align 4
  %14 = alloca float, align 4
  %15 = alloca %class.btVector3, align 4
  %16 = alloca %class.btVector3, align 4
  %17 = alloca %class.btVector3, align 4
  %18 = alloca %class.btVector3, align 4
  %19 = alloca %class.btVector3, align 4
  %20 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 11
  store float 0.000000e+00, float* %20, align 4
  store float 0.000000e+00, float* %1
  store float 0.000000e+00, float* %2
  store float 0.000000e+00, float* %3
  call void @_ZN9btVector3C2ERKfS1_S1_(%class.btVector3* %normalInB, float* dereferenceable(4) %1, float* dereferenceable(4) %2, float* dereferenceable(4) %3)
  call void @_ZN9btVector3C2Ev(%class.btVector3* %pointOnA)
  call void @_ZN9btVector3C2Ev(%class.btVector3* %pointOnB)
  %21 = getelementptr inbounds %"struct.btDiscreteCollisionDetectorInterface::ClosestPointInput"* %input, i32 0, i32 0
  call void @_ZN11btTransformC2ERKS_(%class.btTransform* %localTransA, %class.btTransform* dereferenceable(64) %21)
  %22 = getelementptr inbounds %"struct.btDiscreteCollisionDetectorInterface::ClosestPointInput"* %input, i32 0, i32 1
  call void @_ZN11btTransformC2ERKS_(%class.btTransform* %localTransB, %class.btTransform* dereferenceable(64) %22)
  %23 = call dereferenceable(16) %class.btVector3* @_ZN11btTransform9getOriginEv(%class.btTransform* %localTransA)
  %24 = call dereferenceable(16) %class.btVector3* @_ZN11btTransform9getOriginEv(%class.btTransform* %localTransB)
  %25 = call { <2 x float>, <2 x float> } @_ZplRK9btVector3S1_(%class.btVector3* dereferenceable(16) %23, %class.btVector3* dereferenceable(16) %24)
  %26 = getelementptr %class.btVector3* %4, i32 0, i32 0
  %27 = bitcast [4 x float]* %26 to { <2 x float>, <2 x float> }*
  %28 = getelementptr { <2 x float>, <2 x float> }* %27, i32 0, i32 0
  %29 = extractvalue { <2 x float>, <2 x float> } %25, 0
  store <2 x float> %29, <2 x float>* %28, align 1
  %30 = getelementptr { <2 x float>, <2 x float> }* %27, i32 0, i32 1
  %31 = extractvalue { <2 x float>, <2 x float> } %25, 1
  store <2 x float> %31, <2 x float>* %30, align 1
  store float 5.000000e-01, float* %5
  %32 = call { <2 x float>, <2 x float> } @_ZmlRK9btVector3RKf(%class.btVector3* dereferenceable(16) %4, float* dereferenceable(4) %5)
  %33 = getelementptr %class.btVector3* %positionOffset, i32 0, i32 0
  %34 = bitcast [4 x float]* %33 to { <2 x float>, <2 x float> }*
  %35 = getelementptr { <2 x float>, <2 x float> }* %34, i32 0, i32 0
  %36 = extractvalue { <2 x float>, <2 x float> } %32, 0
  store <2 x float> %36, <2 x float>* %35, align 1
  %37 = getelementptr { <2 x float>, <2 x float> }* %34, i32 0, i32 1
  %38 = extractvalue { <2 x float>, <2 x float> } %32, 1
  store <2 x float> %38, <2 x float>* %37, align 1
  %39 = call dereferenceable(16) %class.btVector3* @_ZN11btTransform9getOriginEv(%class.btTransform* %localTransA)
  %40 = call dereferenceable(16) %class.btVector3* @_ZN9btVector3mIERKS_(%class.btVector3* %39, %class.btVector3* dereferenceable(16) %positionOffset)
  %41 = call dereferenceable(16) %class.btVector3* @_ZN11btTransform9getOriginEv(%class.btTransform* %localTransB)
  %42 = call dereferenceable(16) %class.btVector3* @_ZN9btVector3mIERKS_(%class.btVector3* %41, %class.btVector3* dereferenceable(16) %positionOffset)
  %43 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 4
  %44 = load %class.btConvexShape** %43, align 8
  %45 = bitcast %class.btConvexShape* %44 to %class.btCollisionShape*
  %46 = call zeroext i1 @_ZNK16btCollisionShape10isConvex2dEv(%class.btCollisionShape* %45)
  br i1 %46, label %47, label %52

; <label>:47                                      ; preds = %0
  %48 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 5
  %49 = load %class.btConvexShape** %48, align 8
  %50 = bitcast %class.btConvexShape* %49 to %class.btCollisionShape*
  %51 = call zeroext i1 @_ZNK16btCollisionShape10isConvex2dEv(%class.btCollisionShape* %50)
  br label %52

; <label>:52                                      ; preds = %47, %0
  %53 = phi i1 [ false, %0 ], [ %51, %47 ]
  %54 = zext i1 %53 to i8
  %55 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 8
  %56 = load float* %55, align 4
  store float %56, float* %marginA, align 4
  %57 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 9
  %58 = load float* %57, align 4
  store float %58, float* %marginB, align 4
  %59 = load i32* @gNumGjkChecks, align 4
  %60 = add nsw i32 %59, 1
  store i32 %60, i32* @gNumGjkChecks, align 4
  %61 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 10
  %62 = load i8* %61, align 1
  %63 = trunc i8 %62 to i1
  br i1 %63, label %64, label %65

; <label>:64                                      ; preds = %52
  store float 0.000000e+00, float* %marginA, align 4
  store float 0.000000e+00, float* %marginB, align 4
  br label %65

; <label>:65                                      ; preds = %64, %52
  %66 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 13
  store i32 0, i32* %66, align 4
  %67 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 1
  store float 0.000000e+00, float* %6
  store float 1.000000e+00, float* %7
  store float 0.000000e+00, float* %8
  call void @_ZN9btVector38setValueERKfS1_S1_(%class.btVector3* %67, float* dereferenceable(4) %6, float* dereferenceable(4) %7, float* dereferenceable(4) %8)
  %68 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 14
  store i32 0, i32* %68, align 4
  %69 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 12
  store i32 -1, i32* %69, align 4
  %70 = load float* %marginA, align 4
  %71 = load float* %marginB, align 4
  %72 = fadd float %70, %71
  %73 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 3
  %74 = load %class.btVoronoiSimplexSolver** %73, align 8
  call void @_ZN22btVoronoiSimplexSolver5resetEv(%class.btVoronoiSimplexSolver* %74)
  br label %75

; <label>:75                                      ; preds = %218, %65
  %squaredDistance.0 = phi float [ 0x43ABC16D60000000, %65 ], [ %194, %218 ]
  %76 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 1
  %77 = call { <2 x float>, <2 x float> } @_ZngRK9btVector3(%class.btVector3* dereferenceable(16) %76)
  %78 = getelementptr %class.btVector3* %9, i32 0, i32 0
  %79 = bitcast [4 x float]* %78 to { <2 x float>, <2 x float> }*
  %80 = getelementptr { <2 x float>, <2 x float> }* %79, i32 0, i32 0
  %81 = extractvalue { <2 x float>, <2 x float> } %77, 0
  store <2 x float> %81, <2 x float>* %80, align 1
  %82 = getelementptr { <2 x float>, <2 x float> }* %79, i32 0, i32 1
  %83 = extractvalue { <2 x float>, <2 x float> } %77, 1
  store <2 x float> %83, <2 x float>* %82, align 1
  %84 = getelementptr inbounds %"struct.btDiscreteCollisionDetectorInterface::ClosestPointInput"* %input, i32 0, i32 0
  %85 = call dereferenceable(48) %class.btMatrix3x3* @_ZNK11btTransform8getBasisEv(%class.btTransform* %84)
  %86 = call { <2 x float>, <2 x float> } @_ZmlRK9btVector3RK11btMatrix3x3(%class.btVector3* dereferenceable(16) %9, %class.btMatrix3x3* dereferenceable(48) %85)
  %87 = getelementptr %class.btVector3* %seperatingAxisInA, i32 0, i32 0
  %88 = bitcast [4 x float]* %87 to { <2 x float>, <2 x float> }*
  %89 = getelementptr { <2 x float>, <2 x float> }* %88, i32 0, i32 0
  %90 = extractvalue { <2 x float>, <2 x float> } %86, 0
  store <2 x float> %90, <2 x float>* %89, align 1
  %91 = getelementptr { <2 x float>, <2 x float> }* %88, i32 0, i32 1
  %92 = extractvalue { <2 x float>, <2 x float> } %86, 1
  store <2 x float> %92, <2 x float>* %91, align 1
  %93 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 1
  %94 = getelementptr inbounds %"struct.btDiscreteCollisionDetectorInterface::ClosestPointInput"* %input, i32 0, i32 1
  %95 = call dereferenceable(48) %class.btMatrix3x3* @_ZNK11btTransform8getBasisEv(%class.btTransform* %94)
  %96 = call { <2 x float>, <2 x float> } @_ZmlRK9btVector3RK11btMatrix3x3(%class.btVector3* dereferenceable(16) %93, %class.btMatrix3x3* dereferenceable(48) %95)
  %97 = getelementptr %class.btVector3* %seperatingAxisInB, i32 0, i32 0
  %98 = bitcast [4 x float]* %97 to { <2 x float>, <2 x float> }*
  %99 = getelementptr { <2 x float>, <2 x float> }* %98, i32 0, i32 0
  %100 = extractvalue { <2 x float>, <2 x float> } %96, 0
  store <2 x float> %100, <2 x float>* %99, align 1
  %101 = getelementptr { <2 x float>, <2 x float> }* %98, i32 0, i32 1
  %102 = extractvalue { <2 x float>, <2 x float> } %96, 1
  store <2 x float> %102, <2 x float>* %101, align 1
  %103 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 4
  %104 = load %class.btConvexShape** %103, align 8
  %105 = call { <2 x float>, <2 x float> } @_ZNK13btConvexShape44localGetSupportVertexWithoutMarginNonVirtualERK9btVector3(%class.btConvexShape* %104, %class.btVector3* dereferenceable(16) %seperatingAxisInA)
  %106 = getelementptr %class.btVector3* %pInA, i32 0, i32 0
  %107 = bitcast [4 x float]* %106 to { <2 x float>, <2 x float> }*
  %108 = getelementptr { <2 x float>, <2 x float> }* %107, i32 0, i32 0
  %109 = extractvalue { <2 x float>, <2 x float> } %105, 0
  store <2 x float> %109, <2 x float>* %108, align 1
  %110 = getelementptr { <2 x float>, <2 x float> }* %107, i32 0, i32 1
  %111 = extractvalue { <2 x float>, <2 x float> } %105, 1
  store <2 x float> %111, <2 x float>* %110, align 1
  %112 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 5
  %113 = load %class.btConvexShape** %112, align 8
  %114 = call { <2 x float>, <2 x float> } @_ZNK13btConvexShape44localGetSupportVertexWithoutMarginNonVirtualERK9btVector3(%class.btConvexShape* %113, %class.btVector3* dereferenceable(16) %seperatingAxisInB)
  %115 = getelementptr %class.btVector3* %qInB, i32 0, i32 0
  %116 = bitcast [4 x float]* %115 to { <2 x float>, <2 x float> }*
  %117 = getelementptr { <2 x float>, <2 x float> }* %116, i32 0, i32 0
  %118 = extractvalue { <2 x float>, <2 x float> } %114, 0
  store <2 x float> %118, <2 x float>* %117, align 1
  %119 = getelementptr { <2 x float>, <2 x float> }* %116, i32 0, i32 1
  %120 = extractvalue { <2 x float>, <2 x float> } %114, 1
  store <2 x float> %120, <2 x float>* %119, align 1
  %121 = call { <2 x float>, <2 x float> } @_ZNK11btTransformclERK9btVector3(%class.btTransform* %localTransA, %class.btVector3* dereferenceable(16) %pInA)
  %122 = getelementptr %class.btVector3* %pWorld, i32 0, i32 0
  %123 = bitcast [4 x float]* %122 to { <2 x float>, <2 x float> }*
  %124 = getelementptr { <2 x float>, <2 x float> }* %123, i32 0, i32 0
  %125 = extractvalue { <2 x float>, <2 x float> } %121, 0
  store <2 x float> %125, <2 x float>* %124, align 1
  %126 = getelementptr { <2 x float>, <2 x float> }* %123, i32 0, i32 1
  %127 = extractvalue { <2 x float>, <2 x float> } %121, 1
  store <2 x float> %127, <2 x float>* %126, align 1
  %128 = call { <2 x float>, <2 x float> } @_ZNK11btTransformclERK9btVector3(%class.btTransform* %localTransB, %class.btVector3* dereferenceable(16) %qInB)
  %129 = getelementptr %class.btVector3* %qWorld, i32 0, i32 0
  %130 = bitcast [4 x float]* %129 to { <2 x float>, <2 x float> }*
  %131 = getelementptr { <2 x float>, <2 x float> }* %130, i32 0, i32 0
  %132 = extractvalue { <2 x float>, <2 x float> } %128, 0
  store <2 x float> %132, <2 x float>* %131, align 1
  %133 = getelementptr { <2 x float>, <2 x float> }* %130, i32 0, i32 1
  %134 = extractvalue { <2 x float>, <2 x float> } %128, 1
  store <2 x float> %134, <2 x float>* %133, align 1
  %135 = trunc i8 %54 to i1
  br i1 %135, label %136, label %141

; <label>:136                                     ; preds = %75
  %137 = call float* @_ZN9btVector3cvPfEv(%class.btVector3* %pWorld)
  %138 = getelementptr inbounds float* %137, i64 2
  store float 0.000000e+00, float* %138, align 4
  %139 = call float* @_ZN9btVector3cvPfEv(%class.btVector3* %qWorld)
  %140 = getelementptr inbounds float* %139, i64 2
  store float 0.000000e+00, float* %140, align 4
  br label %141

; <label>:141                                     ; preds = %136, %75
  %142 = call { <2 x float>, <2 x float> } @_ZmiRK9btVector3S1_(%class.btVector3* dereferenceable(16) %pWorld, %class.btVector3* dereferenceable(16) %qWorld)
  %143 = getelementptr %class.btVector3* %w, i32 0, i32 0
  %144 = bitcast [4 x float]* %143 to { <2 x float>, <2 x float> }*
  %145 = getelementptr { <2 x float>, <2 x float> }* %144, i32 0, i32 0
  %146 = extractvalue { <2 x float>, <2 x float> } %142, 0
  store <2 x float> %146, <2 x float>* %145, align 1
  %147 = getelementptr { <2 x float>, <2 x float> }* %144, i32 0, i32 1
  %148 = extractvalue { <2 x float>, <2 x float> } %142, 1
  store <2 x float> %148, <2 x float>* %147, align 1
  %149 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 1
  %150 = call float @_ZNK9btVector33dotERKS_(%class.btVector3* %149, %class.btVector3* dereferenceable(16) %w)
  %151 = fcmp ogt float %150, 0.000000e+00
  br i1 %151, label %152, label %160

; <label>:152                                     ; preds = %141
  %153 = fmul float %150, %150
  %154 = getelementptr inbounds %"struct.btDiscreteCollisionDetectorInterface::ClosestPointInput"* %input, i32 0, i32 2
  %155 = load float* %154, align 4
  %156 = fmul float %squaredDistance.0, %155
  %157 = fcmp ogt float %153, %156
  br i1 %157, label %158, label %160

; <label>:158                                     ; preds = %152
  %159 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 14
  store i32 10, i32* %159, align 4
  br label %219

; <label>:160                                     ; preds = %152, %141
  %161 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 3
  %162 = load %class.btVoronoiSimplexSolver** %161, align 8
  %163 = call zeroext i1 @_ZN22btVoronoiSimplexSolver9inSimplexERK9btVector3(%class.btVoronoiSimplexSolver* %162, %class.btVector3* dereferenceable(16) %w)
  br i1 %163, label %164, label %166

; <label>:164                                     ; preds = %160
  %165 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 14
  store i32 1, i32* %165, align 4
  br label %219

; <label>:166                                     ; preds = %160
  %167 = fsub float %squaredDistance.0, %150
  %168 = fmul float %squaredDistance.0, 0x3EB0C6F7A0000000
  %169 = fcmp ole float %167, %168
  br i1 %169, label %170, label %177

; <label>:170                                     ; preds = %166
  %171 = fcmp ole float %167, 0.000000e+00
  br i1 %171, label %172, label %174

; <label>:172                                     ; preds = %170
  %173 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 14
  store i32 2, i32* %173, align 4
  br label %176

; <label>:174                                     ; preds = %170
  %175 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 14
  store i32 11, i32* %175, align 4
  br label %176

; <label>:176                                     ; preds = %174, %172
  br label %219

; <label>:177                                     ; preds = %166
  %178 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 3
  %179 = load %class.btVoronoiSimplexSolver** %178, align 8
  call void @_ZN22btVoronoiSimplexSolver9addVertexERK9btVector3S2_S2_(%class.btVoronoiSimplexSolver* %179, %class.btVector3* dereferenceable(16) %w, %class.btVector3* dereferenceable(16) %pWorld, %class.btVector3* dereferenceable(16) %qWorld)
  call void @_ZN9btVector3C2Ev(%class.btVector3* %newCachedSeparatingAxis)
  %180 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 3
  %181 = load %class.btVoronoiSimplexSolver** %180, align 8
  %182 = call zeroext i1 @_ZN22btVoronoiSimplexSolver7closestER9btVector3(%class.btVoronoiSimplexSolver* %181, %class.btVector3* dereferenceable(16) %newCachedSeparatingAxis)
  br i1 %182, label %185, label %183

; <label>:183                                     ; preds = %177
  %184 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 14
  store i32 3, i32* %184, align 4
  br label %219

; <label>:185                                     ; preds = %177
  %186 = call float @_ZNK9btVector37length2Ev(%class.btVector3* %newCachedSeparatingAxis)
  %187 = fcmp olt float %186, 0x3EB0C6F7A0000000
  br i1 %187, label %188, label %193

; <label>:188                                     ; preds = %185
  %189 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 1
  %190 = bitcast %class.btVector3* %189 to i8*
  %191 = bitcast %class.btVector3* %newCachedSeparatingAxis to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %190, i8* %191, i64 16, i32 4, i1 false)
  %192 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 14
  store i32 6, i32* %192, align 4
  br label %219

; <label>:193                                     ; preds = %185
  %194 = call float @_ZNK9btVector37length2Ev(%class.btVector3* %newCachedSeparatingAxis)
  %195 = fsub float %squaredDistance.0, %194
  %196 = fmul float 0x3E80000000000000, %squaredDistance.0
  %197 = fcmp ole float %195, %196
  br i1 %197, label %198, label %200

; <label>:198                                     ; preds = %193
  %199 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 14
  store i32 12, i32* %199, align 4
  br label %219

; <label>:200                                     ; preds = %193
  %201 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 1
  %202 = bitcast %class.btVector3* %201 to i8*
  %203 = bitcast %class.btVector3* %newCachedSeparatingAxis to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %202, i8* %203, i64 16, i32 4, i1 false)
  %204 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 13
  %205 = load i32* %204, align 4
  %206 = add nsw i32 %205, 1
  store i32 %206, i32* %204, align 4
  %207 = icmp sgt i32 %205, 1000
  br i1 %207, label %208, label %209

; <label>:208                                     ; preds = %200
  br label %219

; <label>:209                                     ; preds = %200
  %210 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 3
  %211 = load %class.btVoronoiSimplexSolver** %210, align 8
  %212 = call zeroext i1 @_ZNK22btVoronoiSimplexSolver11fullSimplexEv(%class.btVoronoiSimplexSolver* %211)
  %213 = xor i1 %212, true
  %214 = zext i1 %213 to i8
  %215 = trunc i8 %214 to i1
  br i1 %215, label %218, label %216

; <label>:216                                     ; preds = %209
  %217 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 14
  store i32 13, i32* %217, align 4
  br label %219

; <label>:218                                     ; preds = %209
  br label %75

; <label>:219                                     ; preds = %216, %208, %198, %188, %183, %176, %164, %158
  %checkSimplex.0 = phi i8 [ 1, %158 ], [ 1, %164 ], [ 1, %176 ], [ 1, %188 ], [ 1, %198 ], [ 0, %208 ], [ 0, %216 ], [ 1, %183 ]
  %squaredDistance.1 = phi float [ %squaredDistance.0, %158 ], [ %squaredDistance.0, %164 ], [ %squaredDistance.0, %176 ], [ %squaredDistance.0, %188 ], [ %194, %198 ], [ %194, %208 ], [ %194, %216 ], [ %squaredDistance.0, %183 ]
  %220 = trunc i8 %checkSimplex.0 to i1
  br i1 %220, label %221, label %269

; <label>:221                                     ; preds = %219
  %222 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 3
  %223 = load %class.btVoronoiSimplexSolver** %222, align 8
  call void @_ZN22btVoronoiSimplexSolver14compute_pointsER9btVector3S1_(%class.btVoronoiSimplexSolver* %223, %class.btVector3* dereferenceable(16) %pointOnA, %class.btVector3* dereferenceable(16) %pointOnB)
  %224 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 1
  %225 = bitcast %class.btVector3* %normalInB to i8*
  %226 = bitcast %class.btVector3* %224 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %225, i8* %226, i64 16, i32 4, i1 false)
  %227 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 1
  %228 = call float @_ZNK9btVector37length2Ev(%class.btVector3* %227)
  %229 = fpext float %228 to double
  %230 = fcmp olt double %229, 1.000000e-04
  br i1 %230, label %231, label %233

; <label>:231                                     ; preds = %221
  %232 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 14
  store i32 5, i32* %232, align 4
  br label %233

; <label>:233                                     ; preds = %231, %221
  %234 = fcmp ogt float %228, 0x3D10000000000000
  br i1 %234, label %235, label %266

; <label>:235                                     ; preds = %233
  %236 = call float @_Z6btSqrtf(float %228)
  %237 = fdiv float 1.000000e+00, %236
  store float %237, float* %rlen, align 4
  %238 = call dereferenceable(16) %class.btVector3* @_ZN9btVector3mLERKf(%class.btVector3* %normalInB, float* dereferenceable(4) %rlen)
  %239 = call float @_Z6btSqrtf(float %squaredDistance.1)
  %240 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 1
  %241 = load float* %marginA, align 4
  %242 = fdiv float %241, %239
  store float %242, float* %11
  %243 = call { <2 x float>, <2 x float> } @_ZmlRK9btVector3RKf(%class.btVector3* dereferenceable(16) %240, float* dereferenceable(4) %11)
  %244 = getelementptr %class.btVector3* %10, i32 0, i32 0
  %245 = bitcast [4 x float]* %244 to { <2 x float>, <2 x float> }*
  %246 = getelementptr { <2 x float>, <2 x float> }* %245, i32 0, i32 0
  %247 = extractvalue { <2 x float>, <2 x float> } %243, 0
  store <2 x float> %247, <2 x float>* %246, align 1
  %248 = getelementptr { <2 x float>, <2 x float> }* %245, i32 0, i32 1
  %249 = extractvalue { <2 x float>, <2 x float> } %243, 1
  store <2 x float> %249, <2 x float>* %248, align 1
  %250 = call dereferenceable(16) %class.btVector3* @_ZN9btVector3mIERKS_(%class.btVector3* %pointOnA, %class.btVector3* dereferenceable(16) %10)
  %251 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 1
  %252 = load float* %marginB, align 4
  %253 = fdiv float %252, %239
  store float %253, float* %13
  %254 = call { <2 x float>, <2 x float> } @_ZmlRK9btVector3RKf(%class.btVector3* dereferenceable(16) %251, float* dereferenceable(4) %13)
  %255 = getelementptr %class.btVector3* %12, i32 0, i32 0
  %256 = bitcast [4 x float]* %255 to { <2 x float>, <2 x float> }*
  %257 = getelementptr { <2 x float>, <2 x float> }* %256, i32 0, i32 0
  %258 = extractvalue { <2 x float>, <2 x float> } %254, 0
  store <2 x float> %258, <2 x float>* %257, align 1
  %259 = getelementptr { <2 x float>, <2 x float> }* %256, i32 0, i32 1
  %260 = extractvalue { <2 x float>, <2 x float> } %254, 1
  store <2 x float> %260, <2 x float>* %259, align 1
  %261 = call dereferenceable(16) %class.btVector3* @_ZN9btVector3pLERKS_(%class.btVector3* %pointOnB, %class.btVector3* dereferenceable(16) %12)
  %262 = load float* %rlen, align 4
  %263 = fdiv float 1.000000e+00, %262
  %264 = fsub float %263, %72
  %265 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 12
  store i32 1, i32* %265, align 4
  br label %268

; <label>:266                                     ; preds = %233
  %267 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 12
  store i32 2, i32* %267, align 4
  br label %268

; <label>:268                                     ; preds = %266, %235
  %isValid.0 = phi i8 [ 1, %235 ], [ 0, %266 ]
  %distance.0 = phi float [ %264, %235 ], [ 0.000000e+00, %266 ]
  br label %269

; <label>:269                                     ; preds = %268, %219
  %isValid.1 = phi i8 [ %isValid.0, %268 ], [ 0, %219 ]
  %distance.1 = phi float [ %distance.0, %268 ], [ 0.000000e+00, %219 ]
  %270 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 15
  %271 = load i32* %270, align 4
  %272 = icmp ne i32 %271, 0
  br i1 %272, label %273, label %285

; <label>:273                                     ; preds = %269
  %274 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 2
  %275 = load %class.btConvexPenetrationDepthSolver** %274, align 8
  %276 = icmp ne %class.btConvexPenetrationDepthSolver* %275, null
  br i1 %276, label %277, label %285

; <label>:277                                     ; preds = %273
  %278 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 14
  %279 = load i32* %278, align 4
  %280 = icmp ne i32 %279, 0
  br i1 %280, label %281, label %285

; <label>:281                                     ; preds = %277
  %282 = fadd float %distance.1, %72
  %283 = fpext float %282 to double
  %284 = fcmp olt double %283, 1.000000e-02
  br label %285

; <label>:285                                     ; preds = %281, %277, %273, %269
  %286 = phi i1 [ false, %277 ], [ false, %273 ], [ false, %269 ], [ %284, %281 ]
  %287 = zext i1 %286 to i8
  %288 = trunc i8 1 to i1
  br i1 %288, label %289, label %417

; <label>:289                                     ; preds = %285
  %290 = trunc i8 %isValid.1 to i1
  br i1 %290, label %291, label %293

; <label>:291                                     ; preds = %289
  %292 = trunc i8 %287 to i1
  br i1 %292, label %293, label %417

; <label>:293                                     ; preds = %291, %289
  %294 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 2
  %295 = load %class.btConvexPenetrationDepthSolver** %294, align 8
  %296 = icmp ne %class.btConvexPenetrationDepthSolver* %295, null
  br i1 %296, label %297, label %416

; <label>:297                                     ; preds = %293
  call void @_ZN9btVector3C2Ev(%class.btVector3* %tmpPointOnA)
  call void @_ZN9btVector3C2Ev(%class.btVector3* %tmpPointOnB)
  %298 = load i32* @gNumDeepPenetrationChecks, align 4
  %299 = add nsw i32 %298, 1
  store i32 %299, i32* @gNumDeepPenetrationChecks, align 4
  %300 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 1
  call void @_ZN9btVector37setZeroEv(%class.btVector3* %300)
  %301 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 2
  %302 = load %class.btConvexPenetrationDepthSolver** %301, align 8
  %303 = bitcast %class.btConvexPenetrationDepthSolver* %302 to i1 (%class.btConvexPenetrationDepthSolver*, %class.btVoronoiSimplexSolver*, %class.btConvexShape*, %class.btConvexShape*, %class.btTransform*, %class.btTransform*, %class.btVector3*, %class.btVector3*, %class.btVector3*, %class.btIDebugDraw*, %class.btStackAlloc*)***
  %304 = load i1 (%class.btConvexPenetrationDepthSolver*, %class.btVoronoiSimplexSolver*, %class.btConvexShape*, %class.btConvexShape*, %class.btTransform*, %class.btTransform*, %class.btVector3*, %class.btVector3*, %class.btVector3*, %class.btIDebugDraw*, %class.btStackAlloc*)*** %303
  %305 = getelementptr inbounds i1 (%class.btConvexPenetrationDepthSolver*, %class.btVoronoiSimplexSolver*, %class.btConvexShape*, %class.btConvexShape*, %class.btTransform*, %class.btTransform*, %class.btVector3*, %class.btVector3*, %class.btVector3*, %class.btIDebugDraw*, %class.btStackAlloc*)** %304, i64 2
  %306 = load i1 (%class.btConvexPenetrationDepthSolver*, %class.btVoronoiSimplexSolver*, %class.btConvexShape*, %class.btConvexShape*, %class.btTransform*, %class.btTransform*, %class.btVector3*, %class.btVector3*, %class.btVector3*, %class.btIDebugDraw*, %class.btStackAlloc*)** %305
  %307 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 3
  %308 = load %class.btVoronoiSimplexSolver** %307, align 8
  %309 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 4
  %310 = load %class.btConvexShape** %309, align 8
  %311 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 5
  %312 = load %class.btConvexShape** %311, align 8
  %313 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 1
  %314 = getelementptr inbounds %"struct.btDiscreteCollisionDetectorInterface::ClosestPointInput"* %input, i32 0, i32 3
  %315 = load %class.btStackAlloc** %314, align 8
  %316 = call zeroext i1 %306(%class.btConvexPenetrationDepthSolver* %302, %class.btVoronoiSimplexSolver* dereferenceable(360) %308, %class.btConvexShape* %310, %class.btConvexShape* %312, %class.btTransform* dereferenceable(64) %localTransA, %class.btTransform* dereferenceable(64) %localTransB, %class.btVector3* dereferenceable(16) %313, %class.btVector3* dereferenceable(16) %tmpPointOnA, %class.btVector3* dereferenceable(16) %tmpPointOnB, %class.btIDebugDraw* %debugDraw, %class.btStackAlloc* %315)
  %317 = zext i1 %316 to i8
  %318 = trunc i8 %317 to i1
  br i1 %318, label %319, label %366

; <label>:319                                     ; preds = %297
  %320 = call { <2 x float>, <2 x float> } @_ZmiRK9btVector3S1_(%class.btVector3* dereferenceable(16) %tmpPointOnB, %class.btVector3* dereferenceable(16) %tmpPointOnA)
  %321 = getelementptr %class.btVector3* %tmpNormalInB, i32 0, i32 0
  %322 = bitcast [4 x float]* %321 to { <2 x float>, <2 x float> }*
  %323 = getelementptr { <2 x float>, <2 x float> }* %322, i32 0, i32 0
  %324 = extractvalue { <2 x float>, <2 x float> } %320, 0
  store <2 x float> %324, <2 x float>* %323, align 1
  %325 = getelementptr { <2 x float>, <2 x float> }* %322, i32 0, i32 1
  %326 = extractvalue { <2 x float>, <2 x float> } %320, 1
  store <2 x float> %326, <2 x float>* %325, align 1
  %327 = call float @_ZNK9btVector37length2Ev(%class.btVector3* %tmpNormalInB)
  %328 = fcmp ole float %327, 0x3D10000000000000
  br i1 %328, label %329, label %335

; <label>:329                                     ; preds = %319
  %330 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 1
  %331 = bitcast %class.btVector3* %tmpNormalInB to i8*
  %332 = bitcast %class.btVector3* %330 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %331, i8* %332, i64 16, i32 4, i1 false)
  %333 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 1
  %334 = call float @_ZNK9btVector37length2Ev(%class.btVector3* %333)
  br label %335

; <label>:335                                     ; preds = %329, %319
  %lenSqr1.0 = phi float [ %334, %329 ], [ %327, %319 ]
  %336 = fcmp ogt float %lenSqr1.0, 0x3D10000000000000
  br i1 %336, label %337, label %363

; <label>:337                                     ; preds = %335
  %338 = call float @_Z6btSqrtf(float %lenSqr1.0)
  store float %338, float* %14
  %339 = call dereferenceable(16) %class.btVector3* @_ZN9btVector3dVERKf(%class.btVector3* %tmpNormalInB, float* dereferenceable(4) %14)
  %340 = call { <2 x float>, <2 x float> } @_ZmiRK9btVector3S1_(%class.btVector3* dereferenceable(16) %tmpPointOnA, %class.btVector3* dereferenceable(16) %tmpPointOnB)
  %341 = getelementptr %class.btVector3* %15, i32 0, i32 0
  %342 = bitcast [4 x float]* %341 to { <2 x float>, <2 x float> }*
  %343 = getelementptr { <2 x float>, <2 x float> }* %342, i32 0, i32 0
  %344 = extractvalue { <2 x float>, <2 x float> } %340, 0
  store <2 x float> %344, <2 x float>* %343, align 1
  %345 = getelementptr { <2 x float>, <2 x float> }* %342, i32 0, i32 1
  %346 = extractvalue { <2 x float>, <2 x float> } %340, 1
  store <2 x float> %346, <2 x float>* %345, align 1
  %347 = call float @_ZNK9btVector36lengthEv(%class.btVector3* %15)
  %348 = fsub float -0.000000e+00, %347
  %349 = trunc i8 %isValid.1 to i1
  br i1 %349, label %350, label %352

; <label>:350                                     ; preds = %337
  %351 = fcmp olt float %348, %distance.1
  br i1 %351, label %352, label %360

; <label>:352                                     ; preds = %350, %337
  %353 = bitcast %class.btVector3* %pointOnA to i8*
  %354 = bitcast %class.btVector3* %tmpPointOnA to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %353, i8* %354, i64 16, i32 4, i1 false)
  %355 = bitcast %class.btVector3* %pointOnB to i8*
  %356 = bitcast %class.btVector3* %tmpPointOnB to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %355, i8* %356, i64 16, i32 4, i1 false)
  %357 = bitcast %class.btVector3* %normalInB to i8*
  %358 = bitcast %class.btVector3* %tmpNormalInB to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %357, i8* %358, i64 16, i32 4, i1 false)
  %359 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 12
  store i32 3, i32* %359, align 4
  br label %362

; <label>:360                                     ; preds = %350
  %361 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 12
  store i32 8, i32* %361, align 4
  br label %362

; <label>:362                                     ; preds = %360, %352
  %isValid.2 = phi i8 [ 1, %352 ], [ %isValid.1, %360 ]
  %distance.2 = phi float [ %348, %352 ], [ %distance.1, %360 ]
  br label %365

; <label>:363                                     ; preds = %335
  %364 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 12
  store i32 9, i32* %364, align 4
  br label %365

; <label>:365                                     ; preds = %363, %362
  %isValid.3 = phi i8 [ %isValid.2, %362 ], [ %isValid.1, %363 ]
  %distance.3 = phi float [ %distance.2, %362 ], [ %distance.1, %363 ]
  br label %415

; <label>:366                                     ; preds = %297
  %367 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 1
  %368 = call float @_ZNK9btVector37length2Ev(%class.btVector3* %367)
  %369 = fcmp ogt float %368, 0.000000e+00
  br i1 %369, label %370, label %414

; <label>:370                                     ; preds = %366
  %371 = call { <2 x float>, <2 x float> } @_ZmiRK9btVector3S1_(%class.btVector3* dereferenceable(16) %tmpPointOnA, %class.btVector3* dereferenceable(16) %tmpPointOnB)
  %372 = getelementptr %class.btVector3* %16, i32 0, i32 0
  %373 = bitcast [4 x float]* %372 to { <2 x float>, <2 x float> }*
  %374 = getelementptr { <2 x float>, <2 x float> }* %373, i32 0, i32 0
  %375 = extractvalue { <2 x float>, <2 x float> } %371, 0
  store <2 x float> %375, <2 x float>* %374, align 1
  %376 = getelementptr { <2 x float>, <2 x float> }* %373, i32 0, i32 1
  %377 = extractvalue { <2 x float>, <2 x float> } %371, 1
  store <2 x float> %377, <2 x float>* %376, align 1
  %378 = call float @_ZNK9btVector36lengthEv(%class.btVector3* %16)
  %379 = fsub float %378, %72
  %380 = trunc i8 %isValid.1 to i1
  br i1 %380, label %381, label %383

; <label>:381                                     ; preds = %370
  %382 = fcmp olt float %379, %distance.1
  br i1 %382, label %383, label %411

; <label>:383                                     ; preds = %381, %370
  %384 = bitcast %class.btVector3* %pointOnA to i8*
  %385 = bitcast %class.btVector3* %tmpPointOnA to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %384, i8* %385, i64 16, i32 4, i1 false)
  %386 = bitcast %class.btVector3* %pointOnB to i8*
  %387 = bitcast %class.btVector3* %tmpPointOnB to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %386, i8* %387, i64 16, i32 4, i1 false)
  %388 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 1
  %389 = call { <2 x float>, <2 x float> } @_ZmlRK9btVector3RKf(%class.btVector3* dereferenceable(16) %388, float* dereferenceable(4) %marginA)
  %390 = getelementptr %class.btVector3* %17, i32 0, i32 0
  %391 = bitcast [4 x float]* %390 to { <2 x float>, <2 x float> }*
  %392 = getelementptr { <2 x float>, <2 x float> }* %391, i32 0, i32 0
  %393 = extractvalue { <2 x float>, <2 x float> } %389, 0
  store <2 x float> %393, <2 x float>* %392, align 1
  %394 = getelementptr { <2 x float>, <2 x float> }* %391, i32 0, i32 1
  %395 = extractvalue { <2 x float>, <2 x float> } %389, 1
  store <2 x float> %395, <2 x float>* %394, align 1
  %396 = call dereferenceable(16) %class.btVector3* @_ZN9btVector3mIERKS_(%class.btVector3* %pointOnA, %class.btVector3* dereferenceable(16) %17)
  %397 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 1
  %398 = call { <2 x float>, <2 x float> } @_ZmlRK9btVector3RKf(%class.btVector3* dereferenceable(16) %397, float* dereferenceable(4) %marginB)
  %399 = getelementptr %class.btVector3* %18, i32 0, i32 0
  %400 = bitcast [4 x float]* %399 to { <2 x float>, <2 x float> }*
  %401 = getelementptr { <2 x float>, <2 x float> }* %400, i32 0, i32 0
  %402 = extractvalue { <2 x float>, <2 x float> } %398, 0
  store <2 x float> %402, <2 x float>* %401, align 1
  %403 = getelementptr { <2 x float>, <2 x float> }* %400, i32 0, i32 1
  %404 = extractvalue { <2 x float>, <2 x float> } %398, 1
  store <2 x float> %404, <2 x float>* %403, align 1
  %405 = call dereferenceable(16) %class.btVector3* @_ZN9btVector3pLERKS_(%class.btVector3* %pointOnB, %class.btVector3* dereferenceable(16) %18)
  %406 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 1
  %407 = bitcast %class.btVector3* %normalInB to i8*
  %408 = bitcast %class.btVector3* %406 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %407, i8* %408, i64 16, i32 4, i1 false)
  %409 = call dereferenceable(16) %class.btVector3* @_ZN9btVector39normalizeEv(%class.btVector3* %normalInB)
  %410 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 12
  store i32 6, i32* %410, align 4
  br label %413

; <label>:411                                     ; preds = %381
  %412 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 12
  store i32 5, i32* %412, align 4
  br label %413

; <label>:413                                     ; preds = %411, %383
  %isValid.4 = phi i8 [ 1, %383 ], [ %isValid.1, %411 ]
  %distance.4 = phi float [ %379, %383 ], [ %distance.1, %411 ]
  br label %414

; <label>:414                                     ; preds = %413, %366
  %isValid.5 = phi i8 [ %isValid.4, %413 ], [ %isValid.1, %366 ]
  %distance.5 = phi float [ %distance.4, %413 ], [ %distance.1, %366 ]
  br label %415

; <label>:415                                     ; preds = %414, %365
  %isValid.6 = phi i8 [ %isValid.3, %365 ], [ %isValid.5, %414 ]
  %distance.6 = phi float [ %distance.3, %365 ], [ %distance.5, %414 ]
  br label %416

; <label>:416                                     ; preds = %415, %293
  %isValid.7 = phi i8 [ %isValid.6, %415 ], [ %isValid.1, %293 ]
  %distance.7 = phi float [ %distance.6, %415 ], [ %distance.1, %293 ]
  br label %417

; <label>:417                                     ; preds = %416, %291, %285
  %isValid.8 = phi i8 [ %isValid.7, %416 ], [ %isValid.1, %291 ], [ %isValid.1, %285 ]
  %distance.8 = phi float [ %distance.7, %416 ], [ %distance.1, %291 ], [ %distance.1, %285 ]
  %418 = trunc i8 %isValid.8 to i1
  br i1 %418, label %419, label %442

; <label>:419                                     ; preds = %417
  %420 = fcmp olt float %distance.8, 0.000000e+00
  br i1 %420, label %426, label %421

; <label>:421                                     ; preds = %419
  %422 = fmul float %distance.8, %distance.8
  %423 = getelementptr inbounds %"struct.btDiscreteCollisionDetectorInterface::ClosestPointInput"* %input, i32 0, i32 2
  %424 = load float* %423, align 4
  %425 = fcmp olt float %422, %424
  br i1 %425, label %426, label %442

; <label>:426                                     ; preds = %421, %419
  %427 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 1
  %428 = bitcast %class.btVector3* %427 to i8*
  %429 = bitcast %class.btVector3* %normalInB to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %428, i8* %429, i64 16, i32 4, i1 false)
  %430 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 11
  store float %distance.8, float* %430, align 4
  %431 = bitcast %"struct.btDiscreteCollisionDetectorInterface::Result"* %output to void (%"struct.btDiscreteCollisionDetectorInterface::Result"*, %class.btVector3*, %class.btVector3*, float)***
  %432 = load void (%"struct.btDiscreteCollisionDetectorInterface::Result"*, %class.btVector3*, %class.btVector3*, float)*** %431
  %433 = getelementptr inbounds void (%"struct.btDiscreteCollisionDetectorInterface::Result"*, %class.btVector3*, %class.btVector3*, float)** %432, i64 4
  %434 = load void (%"struct.btDiscreteCollisionDetectorInterface::Result"*, %class.btVector3*, %class.btVector3*, float)** %433
  %435 = call { <2 x float>, <2 x float> } @_ZplRK9btVector3S1_(%class.btVector3* dereferenceable(16) %pointOnB, %class.btVector3* dereferenceable(16) %positionOffset)
  %436 = getelementptr %class.btVector3* %19, i32 0, i32 0
  %437 = bitcast [4 x float]* %436 to { <2 x float>, <2 x float> }*
  %438 = getelementptr { <2 x float>, <2 x float> }* %437, i32 0, i32 0
  %439 = extractvalue { <2 x float>, <2 x float> } %435, 0
  store <2 x float> %439, <2 x float>* %438, align 1
  %440 = getelementptr { <2 x float>, <2 x float> }* %437, i32 0, i32 1
  %441 = extractvalue { <2 x float>, <2 x float> } %435, 1
  store <2 x float> %441, <2 x float>* %440, align 1
  call void %434(%"struct.btDiscreteCollisionDetectorInterface::Result"* %output, %class.btVector3* dereferenceable(16) %normalInB, %class.btVector3* dereferenceable(16) %19, float %distance.8)
  br label %442

; <label>:442                                     ; preds = %426, %421, %417
  ret void
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr void @_ZN9btVector3C2Ev(%class.btVector3* %this) unnamed_addr #1 align 2 {
  ret void
}

; Function Attrs: inlinehint uwtable
define linkonce_odr void @_ZN11btTransformC2ERKS_(%class.btTransform* %this, %class.btTransform* dereferenceable(64) %other) unnamed_addr #4 align 2 {
  %1 = getelementptr inbounds %class.btTransform* %this, i32 0, i32 0
  %2 = getelementptr inbounds %class.btTransform* %other, i32 0, i32 0
  call void @_ZN11btMatrix3x3C2ERKS_(%class.btMatrix3x3* %1, %class.btMatrix3x3* dereferenceable(48) %2)
  %3 = getelementptr inbounds %class.btTransform* %this, i32 0, i32 1
  %4 = getelementptr inbounds %class.btTransform* %other, i32 0, i32 1
  %5 = bitcast %class.btVector3* %3 to i8*
  %6 = bitcast %class.btVector3* %4 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %5, i8* %6, i64 16, i32 4, i1 false)
  ret void
}

; Function Attrs: inlinehint uwtable
define linkonce_odr { <2 x float>, <2 x float> } @_ZmlRK9btVector3RKf(%class.btVector3* dereferenceable(16) %v, float* dereferenceable(4) %s) #4 {
  %1 = alloca %class.btVector3, align 4
  %2 = alloca float, align 4
  %3 = alloca float, align 4
  %4 = alloca float, align 4
  %5 = getelementptr inbounds %class.btVector3* %v, i32 0, i32 0
  %6 = getelementptr inbounds [4 x float]* %5, i32 0, i64 0
  %7 = load float* %6, align 4
  %8 = load float* %s, align 4
  %9 = fmul float %7, %8
  store float %9, float* %2
  %10 = getelementptr inbounds %class.btVector3* %v, i32 0, i32 0
  %11 = getelementptr inbounds [4 x float]* %10, i32 0, i64 1
  %12 = load float* %11, align 4
  %13 = load float* %s, align 4
  %14 = fmul float %12, %13
  store float %14, float* %3
  %15 = getelementptr inbounds %class.btVector3* %v, i32 0, i32 0
  %16 = getelementptr inbounds [4 x float]* %15, i32 0, i64 2
  %17 = load float* %16, align 4
  %18 = load float* %s, align 4
  %19 = fmul float %17, %18
  store float %19, float* %4
  call void @_ZN9btVector3C2ERKfS1_S1_(%class.btVector3* %1, float* dereferenceable(4) %2, float* dereferenceable(4) %3, float* dereferenceable(4) %4)
  %20 = getelementptr %class.btVector3* %1, i32 0, i32 0
  %21 = bitcast [4 x float]* %20 to { <2 x float>, <2 x float> }*
  %22 = load { <2 x float>, <2 x float> }* %21, align 1
  ret { <2 x float>, <2 x float> } %22
}

; Function Attrs: inlinehint uwtable
define linkonce_odr { <2 x float>, <2 x float> } @_ZplRK9btVector3S1_(%class.btVector3* dereferenceable(16) %v1, %class.btVector3* dereferenceable(16) %v2) #4 {
  %1 = alloca %class.btVector3, align 4
  %2 = alloca float, align 4
  %3 = alloca float, align 4
  %4 = alloca float, align 4
  %5 = getelementptr inbounds %class.btVector3* %v1, i32 0, i32 0
  %6 = getelementptr inbounds [4 x float]* %5, i32 0, i64 0
  %7 = load float* %6, align 4
  %8 = getelementptr inbounds %class.btVector3* %v2, i32 0, i32 0
  %9 = getelementptr inbounds [4 x float]* %8, i32 0, i64 0
  %10 = load float* %9, align 4
  %11 = fadd float %7, %10
  store float %11, float* %2
  %12 = getelementptr inbounds %class.btVector3* %v1, i32 0, i32 0
  %13 = getelementptr inbounds [4 x float]* %12, i32 0, i64 1
  %14 = load float* %13, align 4
  %15 = getelementptr inbounds %class.btVector3* %v2, i32 0, i32 0
  %16 = getelementptr inbounds [4 x float]* %15, i32 0, i64 1
  %17 = load float* %16, align 4
  %18 = fadd float %14, %17
  store float %18, float* %3
  %19 = getelementptr inbounds %class.btVector3* %v1, i32 0, i32 0
  %20 = getelementptr inbounds [4 x float]* %19, i32 0, i64 2
  %21 = load float* %20, align 4
  %22 = getelementptr inbounds %class.btVector3* %v2, i32 0, i32 0
  %23 = getelementptr inbounds [4 x float]* %22, i32 0, i64 2
  %24 = load float* %23, align 4
  %25 = fadd float %21, %24
  store float %25, float* %4
  call void @_ZN9btVector3C2ERKfS1_S1_(%class.btVector3* %1, float* dereferenceable(4) %2, float* dereferenceable(4) %3, float* dereferenceable(4) %4)
  %26 = getelementptr %class.btVector3* %1, i32 0, i32 0
  %27 = bitcast [4 x float]* %26 to { <2 x float>, <2 x float> }*
  %28 = load { <2 x float>, <2 x float> }* %27, align 1
  ret { <2 x float>, <2 x float> } %28
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dereferenceable(16) %class.btVector3* @_ZN11btTransform9getOriginEv(%class.btTransform* %this) #1 align 2 {
  %1 = getelementptr inbounds %class.btTransform* %this, i32 0, i32 1
  ret %class.btVector3* %1
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dereferenceable(16) %class.btVector3* @_ZN9btVector3mIERKS_(%class.btVector3* %this, %class.btVector3* dereferenceable(16) %v) #1 align 2 {
  %1 = getelementptr inbounds %class.btVector3* %v, i32 0, i32 0
  %2 = getelementptr inbounds [4 x float]* %1, i32 0, i64 0
  %3 = load float* %2, align 4
  %4 = getelementptr inbounds %class.btVector3* %this, i32 0, i32 0
  %5 = getelementptr inbounds [4 x float]* %4, i32 0, i64 0
  %6 = load float* %5, align 4
  %7 = fsub float %6, %3
  store float %7, float* %5, align 4
  %8 = getelementptr inbounds %class.btVector3* %v, i32 0, i32 0
  %9 = getelementptr inbounds [4 x float]* %8, i32 0, i64 1
  %10 = load float* %9, align 4
  %11 = getelementptr inbounds %class.btVector3* %this, i32 0, i32 0
  %12 = getelementptr inbounds [4 x float]* %11, i32 0, i64 1
  %13 = load float* %12, align 4
  %14 = fsub float %13, %10
  store float %14, float* %12, align 4
  %15 = getelementptr inbounds %class.btVector3* %v, i32 0, i32 0
  %16 = getelementptr inbounds [4 x float]* %15, i32 0, i64 2
  %17 = load float* %16, align 4
  %18 = getelementptr inbounds %class.btVector3* %this, i32 0, i32 0
  %19 = getelementptr inbounds [4 x float]* %18, i32 0, i64 2
  %20 = load float* %19, align 4
  %21 = fsub float %20, %17
  store float %21, float* %19, align 4
  ret %class.btVector3* %this
}

; Function Attrs: inlinehint uwtable
define linkonce_odr zeroext i1 @_ZNK16btCollisionShape10isConvex2dEv(%class.btCollisionShape* %this) #4 align 2 {
  %1 = call i32 @_ZNK16btCollisionShape12getShapeTypeEv(%class.btCollisionShape* %this)
  %2 = call zeroext i1 @_ZN17btBroadphaseProxy10isConvex2dEi(i32 %1)
  ret i1 %2
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr void @_ZN9btVector38setValueERKfS1_S1_(%class.btVector3* %this, float* dereferenceable(4) %_x, float* dereferenceable(4) %_y, float* dereferenceable(4) %_z) #1 align 2 {
  %1 = load float* %_x, align 4
  %2 = getelementptr inbounds %class.btVector3* %this, i32 0, i32 0
  %3 = getelementptr inbounds [4 x float]* %2, i32 0, i64 0
  store float %1, float* %3, align 4
  %4 = load float* %_y, align 4
  %5 = getelementptr inbounds %class.btVector3* %this, i32 0, i32 0
  %6 = getelementptr inbounds [4 x float]* %5, i32 0, i64 1
  store float %4, float* %6, align 4
  %7 = load float* %_z, align 4
  %8 = getelementptr inbounds %class.btVector3* %this, i32 0, i32 0
  %9 = getelementptr inbounds [4 x float]* %8, i32 0, i64 2
  store float %7, float* %9, align 4
  %10 = getelementptr inbounds %class.btVector3* %this, i32 0, i32 0
  %11 = getelementptr inbounds [4 x float]* %10, i32 0, i64 3
  store float 0.000000e+00, float* %11, align 4
  ret void
}

declare void @_ZN22btVoronoiSimplexSolver5resetEv(%class.btVoronoiSimplexSolver*) #5

; Function Attrs: inlinehint uwtable
define linkonce_odr { <2 x float>, <2 x float> } @_ZmlRK9btVector3RK11btMatrix3x3(%class.btVector3* dereferenceable(16) %v, %class.btMatrix3x3* dereferenceable(48) %m) #4 {
  %1 = alloca %class.btVector3, align 4
  %2 = alloca float, align 4
  %3 = alloca float, align 4
  %4 = alloca float, align 4
  %5 = call float @_ZNK11btMatrix3x35tdotxERK9btVector3(%class.btMatrix3x3* %m, %class.btVector3* dereferenceable(16) %v)
  store float %5, float* %2
  %6 = call float @_ZNK11btMatrix3x35tdotyERK9btVector3(%class.btMatrix3x3* %m, %class.btVector3* dereferenceable(16) %v)
  store float %6, float* %3
  %7 = call float @_ZNK11btMatrix3x35tdotzERK9btVector3(%class.btMatrix3x3* %m, %class.btVector3* dereferenceable(16) %v)
  store float %7, float* %4
  call void @_ZN9btVector3C2ERKfS1_S1_(%class.btVector3* %1, float* dereferenceable(4) %2, float* dereferenceable(4) %3, float* dereferenceable(4) %4)
  %8 = getelementptr %class.btVector3* %1, i32 0, i32 0
  %9 = bitcast [4 x float]* %8 to { <2 x float>, <2 x float> }*
  %10 = load { <2 x float>, <2 x float> }* %9, align 1
  ret { <2 x float>, <2 x float> } %10
}

; Function Attrs: inlinehint uwtable
define linkonce_odr { <2 x float>, <2 x float> } @_ZngRK9btVector3(%class.btVector3* dereferenceable(16) %v) #4 {
  %1 = alloca %class.btVector3, align 4
  %2 = alloca float, align 4
  %3 = alloca float, align 4
  %4 = alloca float, align 4
  %5 = getelementptr inbounds %class.btVector3* %v, i32 0, i32 0
  %6 = getelementptr inbounds [4 x float]* %5, i32 0, i64 0
  %7 = load float* %6, align 4
  %8 = fsub float -0.000000e+00, %7
  store float %8, float* %2
  %9 = getelementptr inbounds %class.btVector3* %v, i32 0, i32 0
  %10 = getelementptr inbounds [4 x float]* %9, i32 0, i64 1
  %11 = load float* %10, align 4
  %12 = fsub float -0.000000e+00, %11
  store float %12, float* %3
  %13 = getelementptr inbounds %class.btVector3* %v, i32 0, i32 0
  %14 = getelementptr inbounds [4 x float]* %13, i32 0, i64 2
  %15 = load float* %14, align 4
  %16 = fsub float -0.000000e+00, %15
  store float %16, float* %4
  call void @_ZN9btVector3C2ERKfS1_S1_(%class.btVector3* %1, float* dereferenceable(4) %2, float* dereferenceable(4) %3, float* dereferenceable(4) %4)
  %17 = getelementptr %class.btVector3* %1, i32 0, i32 0
  %18 = bitcast [4 x float]* %17 to { <2 x float>, <2 x float> }*
  %19 = load { <2 x float>, <2 x float> }* %18, align 1
  ret { <2 x float>, <2 x float> } %19
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dereferenceable(48) %class.btMatrix3x3* @_ZNK11btTransform8getBasisEv(%class.btTransform* %this) #1 align 2 {
  %1 = getelementptr inbounds %class.btTransform* %this, i32 0, i32 0
  ret %class.btMatrix3x3* %1
}

declare { <2 x float>, <2 x float> } @_ZNK13btConvexShape44localGetSupportVertexWithoutMarginNonVirtualERK9btVector3(%class.btConvexShape*, %class.btVector3* dereferenceable(16)) #5

; Function Attrs: inlinehint uwtable
define linkonce_odr { <2 x float>, <2 x float> } @_ZNK11btTransformclERK9btVector3(%class.btTransform* %this, %class.btVector3* dereferenceable(16) %x) #4 align 2 {
  %1 = alloca %class.btVector3, align 4
  %2 = alloca %class.btVector3, align 4
  %3 = getelementptr inbounds %class.btTransform* %this, i32 0, i32 0
  %4 = call dereferenceable(16) %class.btVector3* @_ZNK11btMatrix3x3ixEi(%class.btMatrix3x3* %3, i32 0)
  %5 = getelementptr inbounds %class.btTransform* %this, i32 0, i32 0
  %6 = call dereferenceable(16) %class.btVector3* @_ZNK11btMatrix3x3ixEi(%class.btMatrix3x3* %5, i32 1)
  %7 = getelementptr inbounds %class.btTransform* %this, i32 0, i32 0
  %8 = call dereferenceable(16) %class.btVector3* @_ZNK11btMatrix3x3ixEi(%class.btMatrix3x3* %7, i32 2)
  %9 = call { <2 x float>, <2 x float> } @_ZNK9btVector34dot3ERKS_S1_S1_(%class.btVector3* %x, %class.btVector3* dereferenceable(16) %4, %class.btVector3* dereferenceable(16) %6, %class.btVector3* dereferenceable(16) %8)
  %10 = getelementptr %class.btVector3* %2, i32 0, i32 0
  %11 = bitcast [4 x float]* %10 to { <2 x float>, <2 x float> }*
  %12 = getelementptr { <2 x float>, <2 x float> }* %11, i32 0, i32 0
  %13 = extractvalue { <2 x float>, <2 x float> } %9, 0
  store <2 x float> %13, <2 x float>* %12, align 1
  %14 = getelementptr { <2 x float>, <2 x float> }* %11, i32 0, i32 1
  %15 = extractvalue { <2 x float>, <2 x float> } %9, 1
  store <2 x float> %15, <2 x float>* %14, align 1
  %16 = getelementptr inbounds %class.btTransform* %this, i32 0, i32 1
  %17 = call { <2 x float>, <2 x float> } @_ZplRK9btVector3S1_(%class.btVector3* dereferenceable(16) %2, %class.btVector3* dereferenceable(16) %16)
  %18 = getelementptr %class.btVector3* %1, i32 0, i32 0
  %19 = bitcast [4 x float]* %18 to { <2 x float>, <2 x float> }*
  %20 = getelementptr { <2 x float>, <2 x float> }* %19, i32 0, i32 0
  %21 = extractvalue { <2 x float>, <2 x float> } %17, 0
  store <2 x float> %21, <2 x float>* %20, align 1
  %22 = getelementptr { <2 x float>, <2 x float> }* %19, i32 0, i32 1
  %23 = extractvalue { <2 x float>, <2 x float> } %17, 1
  store <2 x float> %23, <2 x float>* %22, align 1
  %24 = getelementptr %class.btVector3* %1, i32 0, i32 0
  %25 = bitcast [4 x float]* %24 to { <2 x float>, <2 x float> }*
  %26 = load { <2 x float>, <2 x float> }* %25, align 1
  ret { <2 x float>, <2 x float> } %26
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr float* @_ZN9btVector3cvPfEv(%class.btVector3* %this) #1 align 2 {
  %1 = getelementptr inbounds %class.btVector3* %this, i32 0, i32 0
  %2 = getelementptr inbounds [4 x float]* %1, i32 0, i64 0
  ret float* %2
}

; Function Attrs: inlinehint uwtable
define linkonce_odr { <2 x float>, <2 x float> } @_ZmiRK9btVector3S1_(%class.btVector3* dereferenceable(16) %v1, %class.btVector3* dereferenceable(16) %v2) #4 {
  %1 = alloca %class.btVector3, align 4
  %2 = alloca float, align 4
  %3 = alloca float, align 4
  %4 = alloca float, align 4
  %5 = getelementptr inbounds %class.btVector3* %v1, i32 0, i32 0
  %6 = getelementptr inbounds [4 x float]* %5, i32 0, i64 0
  %7 = load float* %6, align 4
  %8 = getelementptr inbounds %class.btVector3* %v2, i32 0, i32 0
  %9 = getelementptr inbounds [4 x float]* %8, i32 0, i64 0
  %10 = load float* %9, align 4
  %11 = fsub float %7, %10
  store float %11, float* %2
  %12 = getelementptr inbounds %class.btVector3* %v1, i32 0, i32 0
  %13 = getelementptr inbounds [4 x float]* %12, i32 0, i64 1
  %14 = load float* %13, align 4
  %15 = getelementptr inbounds %class.btVector3* %v2, i32 0, i32 0
  %16 = getelementptr inbounds [4 x float]* %15, i32 0, i64 1
  %17 = load float* %16, align 4
  %18 = fsub float %14, %17
  store float %18, float* %3
  %19 = getelementptr inbounds %class.btVector3* %v1, i32 0, i32 0
  %20 = getelementptr inbounds [4 x float]* %19, i32 0, i64 2
  %21 = load float* %20, align 4
  %22 = getelementptr inbounds %class.btVector3* %v2, i32 0, i32 0
  %23 = getelementptr inbounds [4 x float]* %22, i32 0, i64 2
  %24 = load float* %23, align 4
  %25 = fsub float %21, %24
  store float %25, float* %4
  call void @_ZN9btVector3C2ERKfS1_S1_(%class.btVector3* %1, float* dereferenceable(4) %2, float* dereferenceable(4) %3, float* dereferenceable(4) %4)
  %26 = getelementptr %class.btVector3* %1, i32 0, i32 0
  %27 = bitcast [4 x float]* %26 to { <2 x float>, <2 x float> }*
  %28 = load { <2 x float>, <2 x float> }* %27, align 1
  ret { <2 x float>, <2 x float> } %28
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr float @_ZNK9btVector33dotERKS_(%class.btVector3* %this, %class.btVector3* dereferenceable(16) %v) #1 align 2 {
  %1 = getelementptr inbounds %class.btVector3* %this, i32 0, i32 0
  %2 = getelementptr inbounds [4 x float]* %1, i32 0, i64 0
  %3 = load float* %2, align 4
  %4 = getelementptr inbounds %class.btVector3* %v, i32 0, i32 0
  %5 = getelementptr inbounds [4 x float]* %4, i32 0, i64 0
  %6 = load float* %5, align 4
  %7 = fmul float %3, %6
  %8 = getelementptr inbounds %class.btVector3* %this, i32 0, i32 0
  %9 = getelementptr inbounds [4 x float]* %8, i32 0, i64 1
  %10 = load float* %9, align 4
  %11 = getelementptr inbounds %class.btVector3* %v, i32 0, i32 0
  %12 = getelementptr inbounds [4 x float]* %11, i32 0, i64 1
  %13 = load float* %12, align 4
  %14 = fmul float %10, %13
  %15 = fadd float %7, %14
  %16 = getelementptr inbounds %class.btVector3* %this, i32 0, i32 0
  %17 = getelementptr inbounds [4 x float]* %16, i32 0, i64 2
  %18 = load float* %17, align 4
  %19 = getelementptr inbounds %class.btVector3* %v, i32 0, i32 0
  %20 = getelementptr inbounds [4 x float]* %19, i32 0, i64 2
  %21 = load float* %20, align 4
  %22 = fmul float %18, %21
  %23 = fadd float %15, %22
  ret float %23
}

declare zeroext i1 @_ZN22btVoronoiSimplexSolver9inSimplexERK9btVector3(%class.btVoronoiSimplexSolver*, %class.btVector3* dereferenceable(16)) #5

declare void @_ZN22btVoronoiSimplexSolver9addVertexERK9btVector3S2_S2_(%class.btVoronoiSimplexSolver*, %class.btVector3* dereferenceable(16), %class.btVector3* dereferenceable(16), %class.btVector3* dereferenceable(16)) #5

declare zeroext i1 @_ZN22btVoronoiSimplexSolver7closestER9btVector3(%class.btVoronoiSimplexSolver*, %class.btVector3* dereferenceable(16)) #5

; Function Attrs: inlinehint uwtable
define linkonce_odr float @_ZNK9btVector37length2Ev(%class.btVector3* %this) #4 align 2 {
  %1 = call float @_ZNK9btVector33dotERKS_(%class.btVector3* %this, %class.btVector3* dereferenceable(16) %this)
  ret float %1
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #6

; Function Attrs: nounwind uwtable
define linkonce_odr zeroext i1 @_ZNK22btVoronoiSimplexSolver11fullSimplexEv(%class.btVoronoiSimplexSolver* %this) #2 align 2 {
  %1 = getelementptr inbounds %class.btVoronoiSimplexSolver* %this, i32 0, i32 0
  %2 = load i32* %1, align 4
  %3 = icmp eq i32 %2, 4
  ret i1 %3
}

declare void @_ZN22btVoronoiSimplexSolver14compute_pointsER9btVector3S1_(%class.btVoronoiSimplexSolver*, %class.btVector3* dereferenceable(16), %class.btVector3* dereferenceable(16)) #5

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr float @_Z6btSqrtf(float %y) #1 {
  %1 = call float @sqrtf(float %y) #6
  ret float %1
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dereferenceable(16) %class.btVector3* @_ZN9btVector3mLERKf(%class.btVector3* %this, float* dereferenceable(4) %s) #1 align 2 {
  %1 = load float* %s, align 4
  %2 = getelementptr inbounds %class.btVector3* %this, i32 0, i32 0
  %3 = getelementptr inbounds [4 x float]* %2, i32 0, i64 0
  %4 = load float* %3, align 4
  %5 = fmul float %4, %1
  store float %5, float* %3, align 4
  %6 = load float* %s, align 4
  %7 = getelementptr inbounds %class.btVector3* %this, i32 0, i32 0
  %8 = getelementptr inbounds [4 x float]* %7, i32 0, i64 1
  %9 = load float* %8, align 4
  %10 = fmul float %9, %6
  store float %10, float* %8, align 4
  %11 = load float* %s, align 4
  %12 = getelementptr inbounds %class.btVector3* %this, i32 0, i32 0
  %13 = getelementptr inbounds [4 x float]* %12, i32 0, i64 2
  %14 = load float* %13, align 4
  %15 = fmul float %14, %11
  store float %15, float* %13, align 4
  ret %class.btVector3* %this
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dereferenceable(16) %class.btVector3* @_ZN9btVector3pLERKS_(%class.btVector3* %this, %class.btVector3* dereferenceable(16) %v) #1 align 2 {
  %1 = getelementptr inbounds %class.btVector3* %v, i32 0, i32 0
  %2 = getelementptr inbounds [4 x float]* %1, i32 0, i64 0
  %3 = load float* %2, align 4
  %4 = getelementptr inbounds %class.btVector3* %this, i32 0, i32 0
  %5 = getelementptr inbounds [4 x float]* %4, i32 0, i64 0
  %6 = load float* %5, align 4
  %7 = fadd float %6, %3
  store float %7, float* %5, align 4
  %8 = getelementptr inbounds %class.btVector3* %v, i32 0, i32 0
  %9 = getelementptr inbounds [4 x float]* %8, i32 0, i64 1
  %10 = load float* %9, align 4
  %11 = getelementptr inbounds %class.btVector3* %this, i32 0, i32 0
  %12 = getelementptr inbounds [4 x float]* %11, i32 0, i64 1
  %13 = load float* %12, align 4
  %14 = fadd float %13, %10
  store float %14, float* %12, align 4
  %15 = getelementptr inbounds %class.btVector3* %v, i32 0, i32 0
  %16 = getelementptr inbounds [4 x float]* %15, i32 0, i64 2
  %17 = load float* %16, align 4
  %18 = getelementptr inbounds %class.btVector3* %this, i32 0, i32 0
  %19 = getelementptr inbounds [4 x float]* %18, i32 0, i64 2
  %20 = load float* %19, align 4
  %21 = fadd float %20, %17
  store float %21, float* %19, align 4
  ret %class.btVector3* %this
}

; Function Attrs: uwtable
define linkonce_odr void @_ZN9btVector37setZeroEv(%class.btVector3* %this) #0 align 2 {
  %1 = alloca float, align 4
  %2 = alloca float, align 4
  %3 = alloca float, align 4
  store float 0.000000e+00, float* %1
  store float 0.000000e+00, float* %2
  store float 0.000000e+00, float* %3
  call void @_ZN9btVector38setValueERKfS1_S1_(%class.btVector3* %this, float* dereferenceable(4) %1, float* dereferenceable(4) %2, float* dereferenceable(4) %3)
  ret void
}

; Function Attrs: inlinehint uwtable
define linkonce_odr dereferenceable(16) %class.btVector3* @_ZN9btVector3dVERKf(%class.btVector3* %this, float* dereferenceable(4) %s) #4 align 2 {
  %1 = alloca float, align 4
  %2 = load float* %s, align 4
  %3 = fdiv float 1.000000e+00, %2
  store float %3, float* %1
  %4 = call dereferenceable(16) %class.btVector3* @_ZN9btVector3mLERKf(%class.btVector3* %this, float* dereferenceable(4) %1)
  ret %class.btVector3* %4
}

; Function Attrs: inlinehint uwtable
define linkonce_odr float @_ZNK9btVector36lengthEv(%class.btVector3* %this) #4 align 2 {
  %1 = call float @_ZNK9btVector37length2Ev(%class.btVector3* %this)
  %2 = call float @_Z6btSqrtf(float %1)
  ret float %2
}

; Function Attrs: inlinehint uwtable
define linkonce_odr dereferenceable(16) %class.btVector3* @_ZN9btVector39normalizeEv(%class.btVector3* %this) #4 align 2 {
  %1 = alloca float, align 4
  %2 = call float @_ZNK9btVector36lengthEv(%class.btVector3* %this)
  store float %2, float* %1
  %3 = call dereferenceable(16) %class.btVector3* @_ZN9btVector3dVERKf(%class.btVector3* %this, float* dereferenceable(4) %1)
  ret %class.btVector3* %3
}

; Function Attrs: uwtable
define linkonce_odr void @_ZN17btGjkPairDetectorD2Ev(%class.btGjkPairDetector* %this) unnamed_addr #0 align 2 {
  %1 = bitcast %class.btGjkPairDetector* %this to %struct.btDiscreteCollisionDetectorInterface*
  call void @_ZN36btDiscreteCollisionDetectorInterfaceD2Ev(%struct.btDiscreteCollisionDetectorInterface* %1)
  ret void
}

; Function Attrs: uwtable
define linkonce_odr void @_ZN17btGjkPairDetectorD0Ev(%class.btGjkPairDetector* %this) unnamed_addr #0 align 2 {
  invoke void @_ZN17btGjkPairDetectorD2Ev(%class.btGjkPairDetector* %this)
          to label %1 unwind label %3

; <label>:1                                       ; preds = %0
  %2 = bitcast %class.btGjkPairDetector* %this to i8*
  call void @_ZdlPv(i8* %2) #10
  ret void

; <label>:3                                       ; preds = %0
  %4 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
  %5 = extractvalue { i8*, i32 } %4, 0
  %6 = extractvalue { i8*, i32 } %4, 1
  %7 = bitcast %class.btGjkPairDetector* %this to i8*
  call void @_ZdlPv(i8* %7) #10
  br label %8

; <label>:8                                       ; preds = %3
  %9 = insertvalue { i8*, i32 } undef, i8* %5, 0
  %10 = insertvalue { i8*, i32 } %9, i32 %6, 1
  resume { i8*, i32 } %10
}

; Function Attrs: nobuiltin nounwind
declare void @_ZdlPv(i8*) #7

; Function Attrs: nounwind
declare float @sqrtf(float) #8

; Function Attrs: inlinehint uwtable
define linkonce_odr { <2 x float>, <2 x float> } @_ZNK9btVector34dot3ERKS_S1_S1_(%class.btVector3* %this, %class.btVector3* dereferenceable(16) %v0, %class.btVector3* dereferenceable(16) %v1, %class.btVector3* dereferenceable(16) %v2) #4 align 2 {
  %1 = alloca %class.btVector3, align 4
  %2 = alloca float, align 4
  %3 = alloca float, align 4
  %4 = alloca float, align 4
  %5 = call float @_ZNK9btVector33dotERKS_(%class.btVector3* %this, %class.btVector3* dereferenceable(16) %v0)
  store float %5, float* %2
  %6 = call float @_ZNK9btVector33dotERKS_(%class.btVector3* %this, %class.btVector3* dereferenceable(16) %v1)
  store float %6, float* %3
  %7 = call float @_ZNK9btVector33dotERKS_(%class.btVector3* %this, %class.btVector3* dereferenceable(16) %v2)
  store float %7, float* %4
  call void @_ZN9btVector3C2ERKfS1_S1_(%class.btVector3* %1, float* dereferenceable(4) %2, float* dereferenceable(4) %3, float* dereferenceable(4) %4)
  %8 = getelementptr %class.btVector3* %1, i32 0, i32 0
  %9 = bitcast [4 x float]* %8 to { <2 x float>, <2 x float> }*
  %10 = load { <2 x float>, <2 x float> }* %9, align 1
  ret { <2 x float>, <2 x float> } %10
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dereferenceable(16) %class.btVector3* @_ZNK11btMatrix3x3ixEi(%class.btMatrix3x3* %this, i32 %i) #1 align 2 {
  %1 = sext i32 %i to i64
  %2 = getelementptr inbounds %class.btMatrix3x3* %this, i32 0, i32 0
  %3 = getelementptr inbounds [3 x %class.btVector3]* %2, i32 0, i64 %1
  ret %class.btVector3* %3
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr float @_ZNK11btMatrix3x35tdotxERK9btVector3(%class.btMatrix3x3* %this, %class.btVector3* dereferenceable(16) %v) #1 align 2 {
  %1 = getelementptr inbounds %class.btMatrix3x3* %this, i32 0, i32 0
  %2 = getelementptr inbounds [3 x %class.btVector3]* %1, i32 0, i64 0
  %3 = call dereferenceable(4) float* @_ZNK9btVector31xEv(%class.btVector3* %2)
  %4 = load float* %3
  %5 = call dereferenceable(4) float* @_ZNK9btVector31xEv(%class.btVector3* %v)
  %6 = load float* %5
  %7 = fmul float %4, %6
  %8 = getelementptr inbounds %class.btMatrix3x3* %this, i32 0, i32 0
  %9 = getelementptr inbounds [3 x %class.btVector3]* %8, i32 0, i64 1
  %10 = call dereferenceable(4) float* @_ZNK9btVector31xEv(%class.btVector3* %9)
  %11 = load float* %10
  %12 = call dereferenceable(4) float* @_ZNK9btVector31yEv(%class.btVector3* %v)
  %13 = load float* %12
  %14 = fmul float %11, %13
  %15 = fadd float %7, %14
  %16 = getelementptr inbounds %class.btMatrix3x3* %this, i32 0, i32 0
  %17 = getelementptr inbounds [3 x %class.btVector3]* %16, i32 0, i64 2
  %18 = call dereferenceable(4) float* @_ZNK9btVector31xEv(%class.btVector3* %17)
  %19 = load float* %18
  %20 = call dereferenceable(4) float* @_ZNK9btVector31zEv(%class.btVector3* %v)
  %21 = load float* %20
  %22 = fmul float %19, %21
  %23 = fadd float %15, %22
  ret float %23
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr float @_ZNK11btMatrix3x35tdotyERK9btVector3(%class.btMatrix3x3* %this, %class.btVector3* dereferenceable(16) %v) #1 align 2 {
  %1 = getelementptr inbounds %class.btMatrix3x3* %this, i32 0, i32 0
  %2 = getelementptr inbounds [3 x %class.btVector3]* %1, i32 0, i64 0
  %3 = call dereferenceable(4) float* @_ZNK9btVector31yEv(%class.btVector3* %2)
  %4 = load float* %3
  %5 = call dereferenceable(4) float* @_ZNK9btVector31xEv(%class.btVector3* %v)
  %6 = load float* %5
  %7 = fmul float %4, %6
  %8 = getelementptr inbounds %class.btMatrix3x3* %this, i32 0, i32 0
  %9 = getelementptr inbounds [3 x %class.btVector3]* %8, i32 0, i64 1
  %10 = call dereferenceable(4) float* @_ZNK9btVector31yEv(%class.btVector3* %9)
  %11 = load float* %10
  %12 = call dereferenceable(4) float* @_ZNK9btVector31yEv(%class.btVector3* %v)
  %13 = load float* %12
  %14 = fmul float %11, %13
  %15 = fadd float %7, %14
  %16 = getelementptr inbounds %class.btMatrix3x3* %this, i32 0, i32 0
  %17 = getelementptr inbounds [3 x %class.btVector3]* %16, i32 0, i64 2
  %18 = call dereferenceable(4) float* @_ZNK9btVector31yEv(%class.btVector3* %17)
  %19 = load float* %18
  %20 = call dereferenceable(4) float* @_ZNK9btVector31zEv(%class.btVector3* %v)
  %21 = load float* %20
  %22 = fmul float %19, %21
  %23 = fadd float %15, %22
  ret float %23
}

; Function Attrs: inlinehint uwtable
define linkonce_odr float @_ZNK11btMatrix3x35tdotzERK9btVector3(%class.btMatrix3x3* %this, %class.btVector3* dereferenceable(16) %v) #4 align 2 {
  %1 = getelementptr inbounds %class.btMatrix3x3* %this, i32 0, i32 0
  %2 = getelementptr inbounds [3 x %class.btVector3]* %1, i32 0, i64 0
  %3 = call dereferenceable(4) float* @_ZNK9btVector31zEv(%class.btVector3* %2)
  %4 = load float* %3
  %5 = call dereferenceable(4) float* @_ZNK9btVector31xEv(%class.btVector3* %v)
  %6 = load float* %5
  %7 = fmul float %4, %6
  %8 = getelementptr inbounds %class.btMatrix3x3* %this, i32 0, i32 0
  %9 = getelementptr inbounds [3 x %class.btVector3]* %8, i32 0, i64 1
  %10 = call dereferenceable(4) float* @_ZNK9btVector31zEv(%class.btVector3* %9)
  %11 = load float* %10
  %12 = call dereferenceable(4) float* @_ZNK9btVector31yEv(%class.btVector3* %v)
  %13 = load float* %12
  %14 = fmul float %11, %13
  %15 = fadd float %7, %14
  %16 = getelementptr inbounds %class.btMatrix3x3* %this, i32 0, i32 0
  %17 = getelementptr inbounds [3 x %class.btVector3]* %16, i32 0, i64 2
  %18 = call dereferenceable(4) float* @_ZNK9btVector31zEv(%class.btVector3* %17)
  %19 = load float* %18
  %20 = call dereferenceable(4) float* @_ZNK9btVector31zEv(%class.btVector3* %v)
  %21 = load float* %20
  %22 = fmul float %19, %21
  %23 = fadd float %15, %22
  ret float %23
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dereferenceable(4) float* @_ZNK9btVector31zEv(%class.btVector3* %this) #1 align 2 {
  %1 = getelementptr inbounds %class.btVector3* %this, i32 0, i32 0
  %2 = getelementptr inbounds [4 x float]* %1, i32 0, i64 2
  ret float* %2
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dereferenceable(4) float* @_ZNK9btVector31xEv(%class.btVector3* %this) #1 align 2 {
  %1 = getelementptr inbounds %class.btVector3* %this, i32 0, i32 0
  %2 = getelementptr inbounds [4 x float]* %1, i32 0, i64 0
  ret float* %2
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dereferenceable(4) float* @_ZNK9btVector31yEv(%class.btVector3* %this) #1 align 2 {
  %1 = getelementptr inbounds %class.btVector3* %this, i32 0, i32 0
  %2 = getelementptr inbounds [4 x float]* %1, i32 0, i64 1
  ret float* %2
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr zeroext i1 @_ZN17btBroadphaseProxy10isConvex2dEi(i32 %proxyType) #1 align 2 {
  %1 = icmp eq i32 %proxyType, 17
  br i1 %1, label %4, label %2

; <label>:2                                       ; preds = %0
  %3 = icmp eq i32 %proxyType, 18
  br label %4

; <label>:4                                       ; preds = %2, %0
  %5 = phi i1 [ true, %0 ], [ %3, %2 ]
  ret i1 %5
}

; Function Attrs: inlinehint uwtable
define linkonce_odr void @_ZN11btMatrix3x3C2ERKS_(%class.btMatrix3x3* %this, %class.btMatrix3x3* dereferenceable(48) %other) unnamed_addr #4 align 2 {
  %1 = getelementptr inbounds %class.btMatrix3x3* %this, i32 0, i32 0
  %2 = getelementptr inbounds [3 x %class.btVector3]* %1, i32 0, i32 0
  %3 = getelementptr inbounds %class.btVector3* %2, i64 3
  br label %4

; <label>:4                                       ; preds = %4, %0
  %5 = phi %class.btVector3* [ %2, %0 ], [ %6, %4 ]
  call void @_ZN9btVector3C2Ev(%class.btVector3* %5)
  %6 = getelementptr inbounds %class.btVector3* %5, i64 1
  %7 = icmp eq %class.btVector3* %6, %3
  br i1 %7, label %8, label %4

; <label>:8                                       ; preds = %4
  %9 = getelementptr inbounds %class.btMatrix3x3* %this, i32 0, i32 0
  %10 = getelementptr inbounds [3 x %class.btVector3]* %9, i32 0, i64 0
  %11 = getelementptr inbounds %class.btMatrix3x3* %other, i32 0, i32 0
  %12 = getelementptr inbounds [3 x %class.btVector3]* %11, i32 0, i64 0
  %13 = bitcast %class.btVector3* %10 to i8*
  %14 = bitcast %class.btVector3* %12 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %13, i8* %14, i64 16, i32 4, i1 false)
  %15 = getelementptr inbounds %class.btMatrix3x3* %this, i32 0, i32 0
  %16 = getelementptr inbounds [3 x %class.btVector3]* %15, i32 0, i64 1
  %17 = getelementptr inbounds %class.btMatrix3x3* %other, i32 0, i32 0
  %18 = getelementptr inbounds [3 x %class.btVector3]* %17, i32 0, i64 1
  %19 = bitcast %class.btVector3* %16 to i8*
  %20 = bitcast %class.btVector3* %18 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %19, i8* %20, i64 16, i32 4, i1 false)
  %21 = getelementptr inbounds %class.btMatrix3x3* %this, i32 0, i32 0
  %22 = getelementptr inbounds [3 x %class.btVector3]* %21, i32 0, i64 2
  %23 = getelementptr inbounds %class.btMatrix3x3* %other, i32 0, i32 0
  %24 = getelementptr inbounds [3 x %class.btVector3]* %23, i32 0, i64 2
  %25 = bitcast %class.btVector3* %22 to i8*
  %26 = bitcast %class.btVector3* %24 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %25, i8* %26, i64 16, i32 4, i1 false)
  ret void
}

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN36btDiscreteCollisionDetectorInterfaceD2Ev(%struct.btDiscreteCollisionDetectorInterface* %this) unnamed_addr #2 align 2 {
  ret void
}

; Function Attrs: uwtable
define linkonce_odr void @_ZN36btDiscreteCollisionDetectorInterfaceD0Ev(%struct.btDiscreteCollisionDetectorInterface* %this) unnamed_addr #0 align 2 {
  invoke void @_ZN36btDiscreteCollisionDetectorInterfaceD2Ev(%struct.btDiscreteCollisionDetectorInterface* %this)
          to label %1 unwind label %3

; <label>:1                                       ; preds = %0
  %2 = bitcast %struct.btDiscreteCollisionDetectorInterface* %this to i8*
  call void @_ZdlPv(i8* %2) #10
  ret void

; <label>:3                                       ; preds = %0
  %4 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
  %5 = extractvalue { i8*, i32 } %4, 0
  %6 = extractvalue { i8*, i32 } %4, 1
  %7 = bitcast %struct.btDiscreteCollisionDetectorInterface* %this to i8*
  call void @_ZdlPv(i8* %7) #10
  br label %8

; <label>:8                                       ; preds = %3
  %9 = insertvalue { i8*, i32 } undef, i8* %5, 0
  %10 = insertvalue { i8*, i32 } %9, i32 %6, 1
  resume { i8*, i32 } %10
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
