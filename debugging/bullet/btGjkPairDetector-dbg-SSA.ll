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
  call void @llvm.dbg.value(metadata %class.btGjkPairDetector* %this, i64 0, metadata !894, metadata !896), !dbg !897
  call void @llvm.dbg.value(metadata %class.btConvexShape* %objectA, i64 0, metadata !898, metadata !896), !dbg !899
  call void @llvm.dbg.value(metadata %class.btConvexShape* %objectB, i64 0, metadata !900, metadata !896), !dbg !901
  call void @llvm.dbg.value(metadata %class.btVoronoiSimplexSolver* %simplexSolver, i64 0, metadata !902, metadata !896), !dbg !903
  call void @llvm.dbg.value(metadata %class.btConvexPenetrationDepthSolver* %penetrationDepthSolver, i64 0, metadata !904, metadata !896), !dbg !905
  %4 = bitcast %class.btGjkPairDetector* %this to %struct.btDiscreteCollisionDetectorInterface*, !dbg !906
  call void @_ZN36btDiscreteCollisionDetectorInterfaceC2Ev(%struct.btDiscreteCollisionDetectorInterface* %4) #7, !dbg !906
  %5 = bitcast %class.btGjkPairDetector* %this to i32 (...)***, !dbg !906
  store i32 (...)** bitcast (i8** getelementptr inbounds ([5 x i8*]* @_ZTV17btGjkPairDetector, i64 0, i64 2) to i32 (...)**), i32 (...)*** %5, !dbg !906
  %6 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 1, !dbg !907
  store float 0.000000e+00, float* %1, !dbg !907
  store float 1.000000e+00, float* %2, !dbg !907
  store float 0.000000e+00, float* %3, !dbg !907
  invoke void @_ZN9btVector3C2ERKfS1_S1_(%class.btVector3* %6, float* dereferenceable(4) %1, float* dereferenceable(4) %2, float* dereferenceable(4) %3)
          to label %7 unwind label %37, !dbg !907

; <label>:7                                       ; preds = %0
  %8 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 2, !dbg !908
  store %class.btConvexPenetrationDepthSolver* %penetrationDepthSolver, %class.btConvexPenetrationDepthSolver** %8, align 8, !dbg !908
  %9 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 3, !dbg !909
  store %class.btVoronoiSimplexSolver* %simplexSolver, %class.btVoronoiSimplexSolver** %9, align 8, !dbg !909
  %10 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 4, !dbg !910
  store %class.btConvexShape* %objectA, %class.btConvexShape** %10, align 8, !dbg !910
  %11 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 5, !dbg !911
  store %class.btConvexShape* %objectB, %class.btConvexShape** %11, align 8, !dbg !911
  %12 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 6, !dbg !912
  %13 = bitcast %class.btConvexShape* %objectA to %class.btCollisionShape*, !dbg !913
  %14 = invoke i32 @_ZNK16btCollisionShape12getShapeTypeEv(%class.btCollisionShape* %13)
          to label %15 unwind label %37, !dbg !913

; <label>:15                                      ; preds = %7
  store i32 %14, i32* %12, align 4, !dbg !914
  %16 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 7, !dbg !916
  %17 = bitcast %class.btConvexShape* %objectB to %class.btCollisionShape*, !dbg !917
  %18 = invoke i32 @_ZNK16btCollisionShape12getShapeTypeEv(%class.btCollisionShape* %17)
          to label %19 unwind label %37, !dbg !917

; <label>:19                                      ; preds = %15
  store i32 %18, i32* %16, align 4, !dbg !918
  %20 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 8, !dbg !919
  %21 = bitcast %class.btConvexShape* %objectA to float (%class.btConvexShape*)***, !dbg !920
  %22 = load float (%class.btConvexShape*)*** %21, !dbg !920
  %23 = getelementptr inbounds float (%class.btConvexShape*)** %22, i64 12, !dbg !920
  %24 = load float (%class.btConvexShape*)** %23, !dbg !920
  %25 = invoke float %24(%class.btConvexShape* %objectA)
          to label %26 unwind label %37, !dbg !920

; <label>:26                                      ; preds = %19
  store float %25, float* %20, align 4, !dbg !921
  %27 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 9, !dbg !922
  %28 = bitcast %class.btConvexShape* %objectB to float (%class.btConvexShape*)***, !dbg !923
  %29 = load float (%class.btConvexShape*)*** %28, !dbg !923
  %30 = getelementptr inbounds float (%class.btConvexShape*)** %29, i64 12, !dbg !923
  %31 = load float (%class.btConvexShape*)** %30, !dbg !923
  %32 = invoke float %31(%class.btConvexShape* %objectB)
          to label %33 unwind label %37, !dbg !923

; <label>:33                                      ; preds = %26
  store float %32, float* %27, align 4, !dbg !924
  %34 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 10, !dbg !925
  store i8 0, i8* %34, align 1, !dbg !925
  %35 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 12, !dbg !926
  store i32 -1, i32* %35, align 4, !dbg !926
  %36 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 15, !dbg !927
  store i32 1, i32* %36, align 4, !dbg !927
  ret void, !dbg !928

; <label>:37                                      ; preds = %26, %19, %15, %7, %0
  %38 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup, !dbg !928
  %39 = extractvalue { i8*, i32 } %38, 0, !dbg !928
  %40 = extractvalue { i8*, i32 } %38, 1, !dbg !928
  %41 = bitcast %class.btGjkPairDetector* %this to %struct.btDiscreteCollisionDetectorInterface*, !dbg !928
  invoke void @_ZN36btDiscreteCollisionDetectorInterfaceD2Ev(%struct.btDiscreteCollisionDetectorInterface* %41)
          to label %42 unwind label %46, !dbg !928

; <label>:42                                      ; preds = %37
  br label %43, !dbg !929

; <label>:43                                      ; preds = %42
  %44 = insertvalue { i8*, i32 } undef, i8* %39, 0, !dbg !930
  %45 = insertvalue { i8*, i32 } %44, i32 %40, 1, !dbg !930
  resume { i8*, i32 } %45, !dbg !930

; <label>:46                                      ; preds = %37
  %47 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          catch i8* null, !dbg !932
  %48 = extractvalue { i8*, i32 } %47, 0, !dbg !932
  call void @__clang_call_terminate(i8* %48) #10, !dbg !932
  unreachable, !dbg !932
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr void @_ZN36btDiscreteCollisionDetectorInterfaceC2Ev(%struct.btDiscreteCollisionDetectorInterface* %this) unnamed_addr #2 align 2 {
  call void @llvm.dbg.value(metadata %struct.btDiscreteCollisionDetectorInterface* %this, i64 0, metadata !934, metadata !896), !dbg !936
  %1 = bitcast %struct.btDiscreteCollisionDetectorInterface* %this to i32 (...)***, !dbg !937
  store i32 (...)** bitcast (i8** getelementptr inbounds ([5 x i8*]* @_ZTV36btDiscreteCollisionDetectorInterface, i64 0, i64 2) to i32 (...)**), i32 (...)*** %1, !dbg !937
  ret void, !dbg !937
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr void @_ZN9btVector3C2ERKfS1_S1_(%class.btVector3* %this, float* dereferenceable(4) %_x, float* dereferenceable(4) %_y, float* dereferenceable(4) %_z) unnamed_addr #2 align 2 {
  call void @llvm.dbg.value(metadata %class.btVector3* %this, i64 0, metadata !938, metadata !896), !dbg !939
  call void @llvm.dbg.value(metadata float* %_x, i64 0, metadata !940, metadata !896), !dbg !941
  call void @llvm.dbg.value(metadata float* %_y, i64 0, metadata !942, metadata !896), !dbg !943
  call void @llvm.dbg.value(metadata float* %_z, i64 0, metadata !944, metadata !896), !dbg !945
  %1 = load float* %_x, align 4, !dbg !946
  %2 = getelementptr inbounds %class.btVector3* %this, i32 0, i32 0, !dbg !948
  %3 = getelementptr inbounds [4 x float]* %2, i32 0, i64 0, !dbg !948
  store float %1, float* %3, align 4, !dbg !948
  %4 = load float* %_y, align 4, !dbg !949
  %5 = getelementptr inbounds %class.btVector3* %this, i32 0, i32 0, !dbg !950
  %6 = getelementptr inbounds [4 x float]* %5, i32 0, i64 1, !dbg !950
  store float %4, float* %6, align 4, !dbg !950
  %7 = load float* %_z, align 4, !dbg !951
  %8 = getelementptr inbounds %class.btVector3* %this, i32 0, i32 0, !dbg !952
  %9 = getelementptr inbounds [4 x float]* %8, i32 0, i64 2, !dbg !952
  store float %7, float* %9, align 4, !dbg !952
  %10 = getelementptr inbounds %class.btVector3* %this, i32 0, i32 0, !dbg !953
  %11 = getelementptr inbounds [4 x float]* %10, i32 0, i64 3, !dbg !953
  store float 0.000000e+00, float* %11, align 4, !dbg !953
  ret void, !dbg !954
}

declare i32 @__gxx_personality_v0(...)

; Function Attrs: nounwind uwtable
define linkonce_odr i32 @_ZNK16btCollisionShape12getShapeTypeEv(%class.btCollisionShape* %this) #3 align 2 {
  call void @llvm.dbg.value(metadata %class.btCollisionShape* %this, i64 0, metadata !955, metadata !896), !dbg !957
  %1 = getelementptr inbounds %class.btCollisionShape* %this, i32 0, i32 1, !dbg !958
  %2 = load i32* %1, align 4, !dbg !958
  ret i32 %2, !dbg !959
}

; Function Attrs: noinline noreturn nounwind
define linkonce_odr hidden void @__clang_call_terminate(i8*) #4 {
  %2 = call i8* @__cxa_begin_catch(i8* %0) #7
  call void @_ZSt9terminatev() #10
  unreachable
}

declare i8* @__cxa_begin_catch(i8*)

declare void @_ZSt9terminatev()

; Function Attrs: uwtable
define void @_ZN17btGjkPairDetectorC2EPK13btConvexShapeS2_iiffP22btVoronoiSimplexSolverP30btConvexPenetrationDepthSolver(%class.btGjkPairDetector* %this, %class.btConvexShape* %objectA, %class.btConvexShape* %objectB, i32 %shapeTypeA, i32 %shapeTypeB, float %marginA, float %marginB, %class.btVoronoiSimplexSolver* %simplexSolver, %class.btConvexPenetrationDepthSolver* %penetrationDepthSolver) unnamed_addr #0 align 2 {
  %1 = alloca float, align 4
  %2 = alloca float, align 4
  %3 = alloca float, align 4
  call void @llvm.dbg.value(metadata %class.btGjkPairDetector* %this, i64 0, metadata !960, metadata !896), !dbg !961
  call void @llvm.dbg.value(metadata %class.btConvexShape* %objectA, i64 0, metadata !962, metadata !896), !dbg !963
  call void @llvm.dbg.value(metadata %class.btConvexShape* %objectB, i64 0, metadata !964, metadata !896), !dbg !965
  call void @llvm.dbg.value(metadata i32 %shapeTypeA, i64 0, metadata !966, metadata !896), !dbg !967
  call void @llvm.dbg.value(metadata i32 %shapeTypeB, i64 0, metadata !968, metadata !896), !dbg !969
  call void @llvm.dbg.value(metadata float %marginA, i64 0, metadata !970, metadata !896), !dbg !971
  call void @llvm.dbg.value(metadata float %marginB, i64 0, metadata !972, metadata !896), !dbg !973
  call void @llvm.dbg.value(metadata %class.btVoronoiSimplexSolver* %simplexSolver, i64 0, metadata !974, metadata !896), !dbg !975
  call void @llvm.dbg.value(metadata %class.btConvexPenetrationDepthSolver* %penetrationDepthSolver, i64 0, metadata !976, metadata !896), !dbg !977
  %4 = bitcast %class.btGjkPairDetector* %this to %struct.btDiscreteCollisionDetectorInterface*, !dbg !978
  call void @_ZN36btDiscreteCollisionDetectorInterfaceC2Ev(%struct.btDiscreteCollisionDetectorInterface* %4) #7, !dbg !978
  %5 = bitcast %class.btGjkPairDetector* %this to i32 (...)***, !dbg !978
  store i32 (...)** bitcast (i8** getelementptr inbounds ([5 x i8*]* @_ZTV17btGjkPairDetector, i64 0, i64 2) to i32 (...)**), i32 (...)*** %5, !dbg !978
  %6 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 1, !dbg !979
  store float 0.000000e+00, float* %1, !dbg !979
  store float 1.000000e+00, float* %2, !dbg !979
  store float 0.000000e+00, float* %3, !dbg !979
  invoke void @_ZN9btVector3C2ERKfS1_S1_(%class.btVector3* %6, float* dereferenceable(4) %1, float* dereferenceable(4) %2, float* dereferenceable(4) %3)
          to label %7 unwind label %19, !dbg !979

; <label>:7                                       ; preds = %0
  %8 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 2, !dbg !980
  store %class.btConvexPenetrationDepthSolver* %penetrationDepthSolver, %class.btConvexPenetrationDepthSolver** %8, align 8, !dbg !980
  %9 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 3, !dbg !981
  store %class.btVoronoiSimplexSolver* %simplexSolver, %class.btVoronoiSimplexSolver** %9, align 8, !dbg !981
  %10 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 4, !dbg !982
  store %class.btConvexShape* %objectA, %class.btConvexShape** %10, align 8, !dbg !982
  %11 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 5, !dbg !983
  store %class.btConvexShape* %objectB, %class.btConvexShape** %11, align 8, !dbg !983
  %12 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 6, !dbg !984
  store i32 %shapeTypeA, i32* %12, align 4, !dbg !984
  %13 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 7, !dbg !985
  store i32 %shapeTypeB, i32* %13, align 4, !dbg !985
  %14 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 8, !dbg !986
  store float %marginA, float* %14, align 4, !dbg !986
  %15 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 9, !dbg !987
  store float %marginB, float* %15, align 4, !dbg !987
  %16 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 10, !dbg !988
  store i8 0, i8* %16, align 1, !dbg !988
  %17 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 12, !dbg !989
  store i32 -1, i32* %17, align 4, !dbg !989
  %18 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 15, !dbg !990
  store i32 1, i32* %18, align 4, !dbg !990
  ret void, !dbg !991

; <label>:19                                      ; preds = %0
  %20 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup, !dbg !991
  %21 = extractvalue { i8*, i32 } %20, 0, !dbg !991
  %22 = extractvalue { i8*, i32 } %20, 1, !dbg !991
  %23 = bitcast %class.btGjkPairDetector* %this to %struct.btDiscreteCollisionDetectorInterface*, !dbg !991
  invoke void @_ZN36btDiscreteCollisionDetectorInterfaceD2Ev(%struct.btDiscreteCollisionDetectorInterface* %23)
          to label %24 unwind label %28, !dbg !991

; <label>:24                                      ; preds = %19
  br label %25, !dbg !992

; <label>:25                                      ; preds = %24
  %26 = insertvalue { i8*, i32 } undef, i8* %21, 0, !dbg !994
  %27 = insertvalue { i8*, i32 } %26, i32 %22, 1, !dbg !994
  resume { i8*, i32 } %27, !dbg !994

; <label>:28                                      ; preds = %19
  %29 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          catch i8* null, !dbg !996
  %30 = extractvalue { i8*, i32 } %29, 0, !dbg !996
  call void @__clang_call_terminate(i8* %30) #10, !dbg !996
  unreachable, !dbg !996
}

; Function Attrs: uwtable
define void @_ZN17btGjkPairDetector16getClosestPointsERKN36btDiscreteCollisionDetectorInterface17ClosestPointInputERNS0_6ResultEP12btIDebugDrawb(%class.btGjkPairDetector* %this, %"struct.btDiscreteCollisionDetectorInterface::ClosestPointInput"* dereferenceable(144) %input, %"struct.btDiscreteCollisionDetectorInterface::Result"* dereferenceable(8) %output, %class.btIDebugDraw* %debugDraw, i1 zeroext %swapResults) unnamed_addr #0 align 2 {
  call void @llvm.dbg.value(metadata %class.btGjkPairDetector* %this, i64 0, metadata !998, metadata !896), !dbg !999
  call void @llvm.dbg.value(metadata %"struct.btDiscreteCollisionDetectorInterface::ClosestPointInput"* %input, i64 0, metadata !1000, metadata !896), !dbg !1001
  call void @llvm.dbg.value(metadata %"struct.btDiscreteCollisionDetectorInterface::Result"* %output, i64 0, metadata !1002, metadata !896), !dbg !1003
  call void @llvm.dbg.value(metadata %class.btIDebugDraw* %debugDraw, i64 0, metadata !1004, metadata !896), !dbg !1005
  %1 = zext i1 %swapResults to i8
  call void @llvm.dbg.value(metadata i1 %swapResults, i64 0, metadata !1006, metadata !896), !dbg !1007
  call void @_ZN17btGjkPairDetector26getClosestPointsNonVirtualERKN36btDiscreteCollisionDetectorInterface17ClosestPointInputERNS0_6ResultEP12btIDebugDraw(%class.btGjkPairDetector* %this, %"struct.btDiscreteCollisionDetectorInterface::ClosestPointInput"* dereferenceable(144) %input, %"struct.btDiscreteCollisionDetectorInterface::Result"* dereferenceable(8) %output, %class.btIDebugDraw* %debugDraw), !dbg !1008
  ret void, !dbg !1009
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
  call void @llvm.dbg.value(metadata %class.btGjkPairDetector* %this, i64 0, metadata !1010, metadata !896), !dbg !1011
  call void @llvm.dbg.value(metadata %"struct.btDiscreteCollisionDetectorInterface::ClosestPointInput"* %input, i64 0, metadata !1012, metadata !896), !dbg !1013
  call void @llvm.dbg.value(metadata %"struct.btDiscreteCollisionDetectorInterface::Result"* %output, i64 0, metadata !1014, metadata !896), !dbg !1015
  call void @llvm.dbg.value(metadata %class.btIDebugDraw* %debugDraw, i64 0, metadata !1016, metadata !896), !dbg !1017
  %20 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 11, !dbg !1018
  store float 0.000000e+00, float* %20, align 4, !dbg !1018
  call void @llvm.dbg.value(metadata float 0.000000e+00, i64 0, metadata !1019, metadata !896), !dbg !1020
  call void @llvm.dbg.declare(metadata %class.btVector3* %normalInB, metadata !1021, metadata !896), !dbg !1022
  store float 0.000000e+00, float* %1, !dbg !1022
  store float 0.000000e+00, float* %2, !dbg !1022
  store float 0.000000e+00, float* %3, !dbg !1022
  call void @_ZN9btVector3C2ERKfS1_S1_(%class.btVector3* %normalInB, float* dereferenceable(4) %1, float* dereferenceable(4) %2, float* dereferenceable(4) %3), !dbg !1022
  call void @llvm.dbg.declare(metadata %class.btVector3* %pointOnA, metadata !1023, metadata !896), !dbg !1024
  call void @_ZN9btVector3C2Ev(%class.btVector3* %pointOnA), !dbg !1024
  call void @llvm.dbg.declare(metadata %class.btVector3* %pointOnB, metadata !1025, metadata !896), !dbg !1026
  call void @_ZN9btVector3C2Ev(%class.btVector3* %pointOnB), !dbg !1026
  call void @llvm.dbg.declare(metadata %class.btTransform* %localTransA, metadata !1027, metadata !896), !dbg !1028
  %21 = getelementptr inbounds %"struct.btDiscreteCollisionDetectorInterface::ClosestPointInput"* %input, i32 0, i32 0, !dbg !1028
  call void @_ZN11btTransformC2ERKS_(%class.btTransform* %localTransA, %class.btTransform* dereferenceable(64) %21), !dbg !1028
  call void @llvm.dbg.declare(metadata %class.btTransform* %localTransB, metadata !1029, metadata !896), !dbg !1030
  %22 = getelementptr inbounds %"struct.btDiscreteCollisionDetectorInterface::ClosestPointInput"* %input, i32 0, i32 1, !dbg !1030
  call void @_ZN11btTransformC2ERKS_(%class.btTransform* %localTransB, %class.btTransform* dereferenceable(64) %22), !dbg !1030
  call void @llvm.dbg.declare(metadata %class.btVector3* %positionOffset, metadata !1031, metadata !896), !dbg !1032
  %23 = call dereferenceable(16) %class.btVector3* @_ZN11btTransform9getOriginEv(%class.btTransform* %localTransA), !dbg !1033
  %24 = call dereferenceable(16) %class.btVector3* @_ZN11btTransform9getOriginEv(%class.btTransform* %localTransB), !dbg !1034
  %25 = call { <2 x float>, <2 x float> } @_ZplRK9btVector3S1_(%class.btVector3* dereferenceable(16) %23, %class.btVector3* dereferenceable(16) %24), !dbg !1035
  %26 = getelementptr %class.btVector3* %4, i32 0, i32 0, !dbg !1035
  %27 = bitcast [4 x float]* %26 to { <2 x float>, <2 x float> }*, !dbg !1035
  %28 = getelementptr { <2 x float>, <2 x float> }* %27, i32 0, i32 0, !dbg !1035
  %29 = extractvalue { <2 x float>, <2 x float> } %25, 0, !dbg !1035
  store <2 x float> %29, <2 x float>* %28, align 1, !dbg !1035
  %30 = getelementptr { <2 x float>, <2 x float> }* %27, i32 0, i32 1, !dbg !1035
  %31 = extractvalue { <2 x float>, <2 x float> } %25, 1, !dbg !1035
  store <2 x float> %31, <2 x float>* %30, align 1, !dbg !1035
  store float 5.000000e-01, float* %5, !dbg !1036
  %32 = call { <2 x float>, <2 x float> } @_ZmlRK9btVector3RKf(%class.btVector3* dereferenceable(16) %4, float* dereferenceable(4) %5), !dbg !1036
  %33 = getelementptr %class.btVector3* %positionOffset, i32 0, i32 0, !dbg !1036
  %34 = bitcast [4 x float]* %33 to { <2 x float>, <2 x float> }*, !dbg !1036
  %35 = getelementptr { <2 x float>, <2 x float> }* %34, i32 0, i32 0, !dbg !1036
  %36 = extractvalue { <2 x float>, <2 x float> } %32, 0, !dbg !1036
  store <2 x float> %36, <2 x float>* %35, align 1, !dbg !1036
  %37 = getelementptr { <2 x float>, <2 x float> }* %34, i32 0, i32 1, !dbg !1036
  %38 = extractvalue { <2 x float>, <2 x float> } %32, 1, !dbg !1036
  store <2 x float> %38, <2 x float>* %37, align 1, !dbg !1036
  %39 = call dereferenceable(16) %class.btVector3* @_ZN11btTransform9getOriginEv(%class.btTransform* %localTransA), !dbg !1037
  %40 = call dereferenceable(16) %class.btVector3* @_ZN9btVector3mIERKS_(%class.btVector3* %39, %class.btVector3* dereferenceable(16) %positionOffset), !dbg !1037
  %41 = call dereferenceable(16) %class.btVector3* @_ZN11btTransform9getOriginEv(%class.btTransform* %localTransB), !dbg !1038
  %42 = call dereferenceable(16) %class.btVector3* @_ZN9btVector3mIERKS_(%class.btVector3* %41, %class.btVector3* dereferenceable(16) %positionOffset), !dbg !1038
  %43 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 4, !dbg !1039
  %44 = load %class.btConvexShape** %43, align 8, !dbg !1039
  %45 = bitcast %class.btConvexShape* %44 to %class.btCollisionShape*, !dbg !1039
  %46 = call zeroext i1 @_ZNK16btCollisionShape10isConvex2dEv(%class.btCollisionShape* %45), !dbg !1039
  br i1 %46, label %47, label %52, !dbg !1039

; <label>:47                                      ; preds = %0
  %48 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 5, !dbg !1040
  %49 = load %class.btConvexShape** %48, align 8, !dbg !1040
  %50 = bitcast %class.btConvexShape* %49 to %class.btCollisionShape*, !dbg !1040
  %51 = call zeroext i1 @_ZNK16btCollisionShape10isConvex2dEv(%class.btCollisionShape* %50), !dbg !1040
  br label %52

; <label>:52                                      ; preds = %47, %0
  %53 = phi i1 [ false, %0 ], [ %51, %47 ]
  %54 = zext i1 %53 to i8, !dbg !1042
  call void @llvm.dbg.value(metadata i8 %54, i64 0, metadata !1044, metadata !896), !dbg !1045
  call void @llvm.dbg.declare(metadata float* %marginA, metadata !1046, metadata !896), !dbg !1047
  %55 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 8, !dbg !1048
  %56 = load float* %55, align 4, !dbg !1048
  store float %56, float* %marginA, align 4, !dbg !1047
  call void @llvm.dbg.declare(metadata float* %marginB, metadata !1049, metadata !896), !dbg !1050
  %57 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 9, !dbg !1051
  %58 = load float* %57, align 4, !dbg !1051
  store float %58, float* %marginB, align 4, !dbg !1050
  %59 = load i32* @gNumGjkChecks, align 4, !dbg !1052
  %60 = add nsw i32 %59, 1, !dbg !1052
  store i32 %60, i32* @gNumGjkChecks, align 4, !dbg !1052
  %61 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 10, !dbg !1053
  %62 = load i8* %61, align 1, !dbg !1053
  %63 = trunc i8 %62 to i1, !dbg !1053
  br i1 %63, label %64, label %65, !dbg !1055

; <label>:64                                      ; preds = %52
  store float 0.000000e+00, float* %marginA, align 4, !dbg !1056
  store float 0.000000e+00, float* %marginB, align 4, !dbg !1058
  br label %65, !dbg !1059

; <label>:65                                      ; preds = %64, %52
  %66 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 13, !dbg !1060
  store i32 0, i32* %66, align 4, !dbg !1060
  call void @llvm.dbg.value(metadata i32 1000, i64 0, metadata !1061, metadata !896), !dbg !1062
  %67 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 1, !dbg !1063
  store float 0.000000e+00, float* %6, !dbg !1063
  store float 1.000000e+00, float* %7, !dbg !1063
  store float 0.000000e+00, float* %8, !dbg !1063
  call void @_ZN9btVector38setValueERKfS1_S1_(%class.btVector3* %67, float* dereferenceable(4) %6, float* dereferenceable(4) %7, float* dereferenceable(4) %8), !dbg !1063
  call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !1064, metadata !896), !dbg !1065
  call void @llvm.dbg.value(metadata i8 0, i64 0, metadata !1066, metadata !896), !dbg !1067
  call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !1068, metadata !896), !dbg !1069
  %68 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 14, !dbg !1070
  store i32 0, i32* %68, align 4, !dbg !1070
  %69 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 12, !dbg !1071
  store i32 -1, i32* %69, align 4, !dbg !1071
  call void @llvm.dbg.value(metadata float 0x43ABC16D60000000, i64 0, metadata !1072, metadata !896), !dbg !1074
  call void @llvm.dbg.value(metadata float 0.000000e+00, i64 0, metadata !1075, metadata !896), !dbg !1076
  %70 = load float* %marginA, align 4, !dbg !1077
  %71 = load float* %marginB, align 4, !dbg !1078
  %72 = fadd float %70, %71, !dbg !1077
  call void @llvm.dbg.value(metadata float %72, i64 0, metadata !1079, metadata !896), !dbg !1080
  %73 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 3, !dbg !1081
  %74 = load %class.btVoronoiSimplexSolver** %73, align 8, !dbg !1081
  call void @_ZN22btVoronoiSimplexSolver5resetEv(%class.btVoronoiSimplexSolver* %74), !dbg !1081
  br label %75, !dbg !1082

; <label>:75                                      ; preds = %218, %65
  %squaredDistance.0 = phi float [ 0x43ABC16D60000000, %65 ], [ %194, %218 ]
  call void @llvm.dbg.declare(metadata %class.btVector3* %seperatingAxisInA, metadata !1083, metadata !896), !dbg !1087
  %76 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 1, !dbg !1088
  %77 = call { <2 x float>, <2 x float> } @_ZngRK9btVector3(%class.btVector3* dereferenceable(16) %76), !dbg !1088
  %78 = getelementptr %class.btVector3* %9, i32 0, i32 0, !dbg !1088
  %79 = bitcast [4 x float]* %78 to { <2 x float>, <2 x float> }*, !dbg !1088
  %80 = getelementptr { <2 x float>, <2 x float> }* %79, i32 0, i32 0, !dbg !1088
  %81 = extractvalue { <2 x float>, <2 x float> } %77, 0, !dbg !1088
  store <2 x float> %81, <2 x float>* %80, align 1, !dbg !1088
  %82 = getelementptr { <2 x float>, <2 x float> }* %79, i32 0, i32 1, !dbg !1088
  %83 = extractvalue { <2 x float>, <2 x float> } %77, 1, !dbg !1088
  store <2 x float> %83, <2 x float>* %82, align 1, !dbg !1088
  %84 = getelementptr inbounds %"struct.btDiscreteCollisionDetectorInterface::ClosestPointInput"* %input, i32 0, i32 0, !dbg !1089
  %85 = call dereferenceable(48) %class.btMatrix3x3* @_ZNK11btTransform8getBasisEv(%class.btTransform* %84), !dbg !1089
  %86 = call { <2 x float>, <2 x float> } @_ZmlRK9btVector3RK11btMatrix3x3(%class.btVector3* dereferenceable(16) %9, %class.btMatrix3x3* dereferenceable(48) %85), !dbg !1090
  %87 = getelementptr %class.btVector3* %seperatingAxisInA, i32 0, i32 0, !dbg !1090
  %88 = bitcast [4 x float]* %87 to { <2 x float>, <2 x float> }*, !dbg !1090
  %89 = getelementptr { <2 x float>, <2 x float> }* %88, i32 0, i32 0, !dbg !1090
  %90 = extractvalue { <2 x float>, <2 x float> } %86, 0, !dbg !1090
  store <2 x float> %90, <2 x float>* %89, align 1, !dbg !1090
  %91 = getelementptr { <2 x float>, <2 x float> }* %88, i32 0, i32 1, !dbg !1090
  %92 = extractvalue { <2 x float>, <2 x float> } %86, 1, !dbg !1090
  store <2 x float> %92, <2 x float>* %91, align 1, !dbg !1090
  call void @llvm.dbg.declare(metadata %class.btVector3* %seperatingAxisInB, metadata !1091, metadata !896), !dbg !1092
  %93 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 1, !dbg !1093
  %94 = getelementptr inbounds %"struct.btDiscreteCollisionDetectorInterface::ClosestPointInput"* %input, i32 0, i32 1, !dbg !1094
  %95 = call dereferenceable(48) %class.btMatrix3x3* @_ZNK11btTransform8getBasisEv(%class.btTransform* %94), !dbg !1094
  %96 = call { <2 x float>, <2 x float> } @_ZmlRK9btVector3RK11btMatrix3x3(%class.btVector3* dereferenceable(16) %93, %class.btMatrix3x3* dereferenceable(48) %95), !dbg !1095
  %97 = getelementptr %class.btVector3* %seperatingAxisInB, i32 0, i32 0, !dbg !1095
  %98 = bitcast [4 x float]* %97 to { <2 x float>, <2 x float> }*, !dbg !1095
  %99 = getelementptr { <2 x float>, <2 x float> }* %98, i32 0, i32 0, !dbg !1095
  %100 = extractvalue { <2 x float>, <2 x float> } %96, 0, !dbg !1095
  store <2 x float> %100, <2 x float>* %99, align 1, !dbg !1095
  %101 = getelementptr { <2 x float>, <2 x float> }* %98, i32 0, i32 1, !dbg !1095
  %102 = extractvalue { <2 x float>, <2 x float> } %96, 1, !dbg !1095
  store <2 x float> %102, <2 x float>* %101, align 1, !dbg !1095
  call void @llvm.dbg.declare(metadata %class.btVector3* %pInA, metadata !1096, metadata !896), !dbg !1097
  %103 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 4, !dbg !1098
  %104 = load %class.btConvexShape** %103, align 8, !dbg !1098
  %105 = call { <2 x float>, <2 x float> } @_ZNK13btConvexShape44localGetSupportVertexWithoutMarginNonVirtualERK9btVector3(%class.btConvexShape* %104, %class.btVector3* dereferenceable(16) %seperatingAxisInA), !dbg !1098
  %106 = getelementptr %class.btVector3* %pInA, i32 0, i32 0, !dbg !1098
  %107 = bitcast [4 x float]* %106 to { <2 x float>, <2 x float> }*, !dbg !1098
  %108 = getelementptr { <2 x float>, <2 x float> }* %107, i32 0, i32 0, !dbg !1098
  %109 = extractvalue { <2 x float>, <2 x float> } %105, 0, !dbg !1098
  store <2 x float> %109, <2 x float>* %108, align 1, !dbg !1098
  %110 = getelementptr { <2 x float>, <2 x float> }* %107, i32 0, i32 1, !dbg !1098
  %111 = extractvalue { <2 x float>, <2 x float> } %105, 1, !dbg !1098
  store <2 x float> %111, <2 x float>* %110, align 1, !dbg !1098
  call void @llvm.dbg.declare(metadata %class.btVector3* %qInB, metadata !1099, metadata !896), !dbg !1100
  %112 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 5, !dbg !1101
  %113 = load %class.btConvexShape** %112, align 8, !dbg !1101
  %114 = call { <2 x float>, <2 x float> } @_ZNK13btConvexShape44localGetSupportVertexWithoutMarginNonVirtualERK9btVector3(%class.btConvexShape* %113, %class.btVector3* dereferenceable(16) %seperatingAxisInB), !dbg !1101
  %115 = getelementptr %class.btVector3* %qInB, i32 0, i32 0, !dbg !1101
  %116 = bitcast [4 x float]* %115 to { <2 x float>, <2 x float> }*, !dbg !1101
  %117 = getelementptr { <2 x float>, <2 x float> }* %116, i32 0, i32 0, !dbg !1101
  %118 = extractvalue { <2 x float>, <2 x float> } %114, 0, !dbg !1101
  store <2 x float> %118, <2 x float>* %117, align 1, !dbg !1101
  %119 = getelementptr { <2 x float>, <2 x float> }* %116, i32 0, i32 1, !dbg !1101
  %120 = extractvalue { <2 x float>, <2 x float> } %114, 1, !dbg !1101
  store <2 x float> %120, <2 x float>* %119, align 1, !dbg !1101
  call void @llvm.dbg.declare(metadata %class.btVector3* %pWorld, metadata !1102, metadata !896), !dbg !1103
  %121 = call { <2 x float>, <2 x float> } @_ZNK11btTransformclERK9btVector3(%class.btTransform* %localTransA, %class.btVector3* dereferenceable(16) %pInA), !dbg !1104
  %122 = getelementptr %class.btVector3* %pWorld, i32 0, i32 0, !dbg !1104
  %123 = bitcast [4 x float]* %122 to { <2 x float>, <2 x float> }*, !dbg !1104
  %124 = getelementptr { <2 x float>, <2 x float> }* %123, i32 0, i32 0, !dbg !1104
  %125 = extractvalue { <2 x float>, <2 x float> } %121, 0, !dbg !1104
  store <2 x float> %125, <2 x float>* %124, align 1, !dbg !1104
  %126 = getelementptr { <2 x float>, <2 x float> }* %123, i32 0, i32 1, !dbg !1104
  %127 = extractvalue { <2 x float>, <2 x float> } %121, 1, !dbg !1104
  store <2 x float> %127, <2 x float>* %126, align 1, !dbg !1104
  call void @llvm.dbg.declare(metadata %class.btVector3* %qWorld, metadata !1105, metadata !896), !dbg !1106
  %128 = call { <2 x float>, <2 x float> } @_ZNK11btTransformclERK9btVector3(%class.btTransform* %localTransB, %class.btVector3* dereferenceable(16) %qInB), !dbg !1107
  %129 = getelementptr %class.btVector3* %qWorld, i32 0, i32 0, !dbg !1107
  %130 = bitcast [4 x float]* %129 to { <2 x float>, <2 x float> }*, !dbg !1107
  %131 = getelementptr { <2 x float>, <2 x float> }* %130, i32 0, i32 0, !dbg !1107
  %132 = extractvalue { <2 x float>, <2 x float> } %128, 0, !dbg !1107
  store <2 x float> %132, <2 x float>* %131, align 1, !dbg !1107
  %133 = getelementptr { <2 x float>, <2 x float> }* %130, i32 0, i32 1, !dbg !1107
  %134 = extractvalue { <2 x float>, <2 x float> } %128, 1, !dbg !1107
  store <2 x float> %134, <2 x float>* %133, align 1, !dbg !1107
  %135 = trunc i8 %54 to i1, !dbg !1108
  br i1 %135, label %136, label %141, !dbg !1110

; <label>:136                                     ; preds = %75
  %137 = call float* @_ZN9btVector3cvPfEv(%class.btVector3* %pWorld), !dbg !1111
  %138 = getelementptr inbounds float* %137, i64 2, !dbg !1111
  store float 0.000000e+00, float* %138, align 4, !dbg !1111
  %139 = call float* @_ZN9btVector3cvPfEv(%class.btVector3* %qWorld), !dbg !1113
  %140 = getelementptr inbounds float* %139, i64 2, !dbg !1113
  store float 0.000000e+00, float* %140, align 4, !dbg !1113
  br label %141, !dbg !1114

; <label>:141                                     ; preds = %136, %75
  call void @llvm.dbg.declare(metadata %class.btVector3* %w, metadata !1115, metadata !896), !dbg !1116
  %142 = call { <2 x float>, <2 x float> } @_ZmiRK9btVector3S1_(%class.btVector3* dereferenceable(16) %pWorld, %class.btVector3* dereferenceable(16) %qWorld), !dbg !1117
  %143 = getelementptr %class.btVector3* %w, i32 0, i32 0, !dbg !1117
  %144 = bitcast [4 x float]* %143 to { <2 x float>, <2 x float> }*, !dbg !1117
  %145 = getelementptr { <2 x float>, <2 x float> }* %144, i32 0, i32 0, !dbg !1117
  %146 = extractvalue { <2 x float>, <2 x float> } %142, 0, !dbg !1117
  store <2 x float> %146, <2 x float>* %145, align 1, !dbg !1117
  %147 = getelementptr { <2 x float>, <2 x float> }* %144, i32 0, i32 1, !dbg !1117
  %148 = extractvalue { <2 x float>, <2 x float> } %142, 1, !dbg !1117
  store <2 x float> %148, <2 x float>* %147, align 1, !dbg !1117
  %149 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 1, !dbg !1118
  %150 = call float @_ZNK9btVector33dotERKS_(%class.btVector3* %149, %class.btVector3* dereferenceable(16) %w), !dbg !1118
  call void @llvm.dbg.value(metadata float %150, i64 0, metadata !1075, metadata !896), !dbg !1076
  %151 = fcmp ogt float %150, 0.000000e+00, !dbg !1119
  br i1 %151, label %152, label %160, !dbg !1121

; <label>:152                                     ; preds = %141
  %153 = fmul float %150, %150, !dbg !1122
  %154 = getelementptr inbounds %"struct.btDiscreteCollisionDetectorInterface::ClosestPointInput"* %input, i32 0, i32 2, !dbg !1123
  %155 = load float* %154, align 4, !dbg !1123
  %156 = fmul float %squaredDistance.0, %155, !dbg !1124
  %157 = fcmp ogt float %153, %156, !dbg !1122
  br i1 %157, label %158, label %160, !dbg !1121

; <label>:158                                     ; preds = %152
  %159 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 14, !dbg !1125
  store i32 10, i32* %159, align 4, !dbg !1125
  call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !1066, metadata !896), !dbg !1067
  br label %219, !dbg !1127

; <label>:160                                     ; preds = %152, %141
  %161 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 3, !dbg !1128
  %162 = load %class.btVoronoiSimplexSolver** %161, align 8, !dbg !1128
  %163 = call zeroext i1 @_ZN22btVoronoiSimplexSolver9inSimplexERK9btVector3(%class.btVoronoiSimplexSolver* %162, %class.btVector3* dereferenceable(16) %w), !dbg !1128
  br i1 %163, label %164, label %166, !dbg !1130

; <label>:164                                     ; preds = %160
  %165 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 14, !dbg !1131
  store i32 1, i32* %165, align 4, !dbg !1131
  call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !1066, metadata !896), !dbg !1067
  br label %219, !dbg !1133

; <label>:166                                     ; preds = %160
  %167 = fsub float %squaredDistance.0, %150, !dbg !1134
  call void @llvm.dbg.value(metadata float %167, i64 0, metadata !1135, metadata !896), !dbg !1136
  %168 = fmul float %squaredDistance.0, 0x3EB0C6F7A0000000, !dbg !1137
  call void @llvm.dbg.value(metadata float %168, i64 0, metadata !1138, metadata !896), !dbg !1139
  %169 = fcmp ole float %167, %168, !dbg !1140
  br i1 %169, label %170, label %177, !dbg !1142

; <label>:170                                     ; preds = %166
  %171 = fcmp ole float %167, 0.000000e+00, !dbg !1143
  br i1 %171, label %172, label %174, !dbg !1146

; <label>:172                                     ; preds = %170
  %173 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 14, !dbg !1147
  store i32 2, i32* %173, align 4, !dbg !1147
  br label %176, !dbg !1149

; <label>:174                                     ; preds = %170
  %175 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 14, !dbg !1150
  store i32 11, i32* %175, align 4, !dbg !1150
  br label %176

; <label>:176                                     ; preds = %174, %172
  call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !1066, metadata !896), !dbg !1067
  br label %219, !dbg !1152

; <label>:177                                     ; preds = %166
  %178 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 3, !dbg !1153
  %179 = load %class.btVoronoiSimplexSolver** %178, align 8, !dbg !1153
  call void @_ZN22btVoronoiSimplexSolver9addVertexERK9btVector3S2_S2_(%class.btVoronoiSimplexSolver* %179, %class.btVector3* dereferenceable(16) %w, %class.btVector3* dereferenceable(16) %pWorld, %class.btVector3* dereferenceable(16) %qWorld), !dbg !1153
  call void @llvm.dbg.declare(metadata %class.btVector3* %newCachedSeparatingAxis, metadata !1154, metadata !896), !dbg !1155
  call void @_ZN9btVector3C2Ev(%class.btVector3* %newCachedSeparatingAxis), !dbg !1155
  %180 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 3, !dbg !1156
  %181 = load %class.btVoronoiSimplexSolver** %180, align 8, !dbg !1156
  %182 = call zeroext i1 @_ZN22btVoronoiSimplexSolver7closestER9btVector3(%class.btVoronoiSimplexSolver* %181, %class.btVector3* dereferenceable(16) %newCachedSeparatingAxis), !dbg !1156
  br i1 %182, label %185, label %183, !dbg !1158

; <label>:183                                     ; preds = %177
  %184 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 14, !dbg !1159
  store i32 3, i32* %184, align 4, !dbg !1159
  call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !1066, metadata !896), !dbg !1067
  br label %219, !dbg !1161

; <label>:185                                     ; preds = %177
  %186 = call float @_ZNK9btVector37length2Ev(%class.btVector3* %newCachedSeparatingAxis), !dbg !1162
  %187 = fcmp olt float %186, 0x3EB0C6F7A0000000, !dbg !1162
  br i1 %187, label %188, label %193, !dbg !1164

; <label>:188                                     ; preds = %185
  %189 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 1, !dbg !1165
  %190 = bitcast %class.btVector3* %189 to i8*, !dbg !1165
  %191 = bitcast %class.btVector3* %newCachedSeparatingAxis to i8*, !dbg !1165
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %190, i8* %191, i64 16, i32 4, i1 false), !dbg !1165
  %192 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 14, !dbg !1167
  store i32 6, i32* %192, align 4, !dbg !1167
  call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !1066, metadata !896), !dbg !1067
  br label %219, !dbg !1168

; <label>:193                                     ; preds = %185
  call void @llvm.dbg.value(metadata float %squaredDistance.0, i64 0, metadata !1169, metadata !896), !dbg !1170
  %194 = call float @_ZNK9btVector37length2Ev(%class.btVector3* %newCachedSeparatingAxis), !dbg !1171
  call void @llvm.dbg.value(metadata float %194, i64 0, metadata !1072, metadata !896), !dbg !1074
  %195 = fsub float %squaredDistance.0, %194, !dbg !1172
  %196 = fmul float 0x3E80000000000000, %squaredDistance.0, !dbg !1174
  %197 = fcmp ole float %195, %196, !dbg !1172
  br i1 %197, label %198, label %200, !dbg !1175

; <label>:198                                     ; preds = %193
  call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !1066, metadata !896), !dbg !1067
  %199 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 14, !dbg !1176
  store i32 12, i32* %199, align 4, !dbg !1176
  br label %219, !dbg !1178

; <label>:200                                     ; preds = %193
  %201 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 1, !dbg !1179
  %202 = bitcast %class.btVector3* %201 to i8*, !dbg !1179
  %203 = bitcast %class.btVector3* %newCachedSeparatingAxis to i8*, !dbg !1179
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %202, i8* %203, i64 16, i32 4, i1 false), !dbg !1179
  %204 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 13, !dbg !1180
  %205 = load i32* %204, align 4, !dbg !1180
  %206 = add nsw i32 %205, 1, !dbg !1180
  store i32 %206, i32* %204, align 4, !dbg !1180
  %207 = icmp sgt i32 %205, 1000, !dbg !1180
  br i1 %207, label %208, label %209, !dbg !1182

; <label>:208                                     ; preds = %200
  br label %219, !dbg !1183

; <label>:209                                     ; preds = %200
  %210 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 3, !dbg !1185
  %211 = load %class.btVoronoiSimplexSolver** %210, align 8, !dbg !1185
  %212 = call zeroext i1 @_ZNK22btVoronoiSimplexSolver11fullSimplexEv(%class.btVoronoiSimplexSolver* %211), !dbg !1185
  %213 = xor i1 %212, true, !dbg !1186
  %214 = zext i1 %213 to i8, !dbg !1187
  call void @llvm.dbg.value(metadata i8 %214, i64 0, metadata !1188, metadata !896), !dbg !1187
  %215 = trunc i8 %214 to i1, !dbg !1189
  br i1 %215, label %218, label %216, !dbg !1191

; <label>:216                                     ; preds = %209
  %217 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 14, !dbg !1192
  store i32 13, i32* %217, align 4, !dbg !1192
  br label %219, !dbg !1194

; <label>:218                                     ; preds = %209
  br label %75, !dbg !1195

; <label>:219                                     ; preds = %216, %208, %198, %188, %183, %176, %164, %158
  %checkSimplex.0 = phi i8 [ 1, %158 ], [ 1, %164 ], [ 1, %176 ], [ 1, %188 ], [ 1, %198 ], [ 0, %208 ], [ 0, %216 ], [ 1, %183 ]
  %squaredDistance.1 = phi float [ %squaredDistance.0, %158 ], [ %squaredDistance.0, %164 ], [ %squaredDistance.0, %176 ], [ %squaredDistance.0, %188 ], [ %194, %198 ], [ %194, %208 ], [ %194, %216 ], [ %squaredDistance.0, %183 ]
  %220 = trunc i8 %checkSimplex.0 to i1, !dbg !1196
  br i1 %220, label %221, label %269, !dbg !1198

; <label>:221                                     ; preds = %219
  %222 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 3, !dbg !1199
  %223 = load %class.btVoronoiSimplexSolver** %222, align 8, !dbg !1199
  call void @_ZN22btVoronoiSimplexSolver14compute_pointsER9btVector3S1_(%class.btVoronoiSimplexSolver* %223, %class.btVector3* dereferenceable(16) %pointOnA, %class.btVector3* dereferenceable(16) %pointOnB), !dbg !1199
  %224 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 1, !dbg !1201
  %225 = bitcast %class.btVector3* %normalInB to i8*, !dbg !1201
  %226 = bitcast %class.btVector3* %224 to i8*, !dbg !1201
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %225, i8* %226, i64 16, i32 4, i1 false), !dbg !1201
  %227 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 1, !dbg !1202
  %228 = call float @_ZNK9btVector37length2Ev(%class.btVector3* %227), !dbg !1202
  call void @llvm.dbg.value(metadata float %228, i64 0, metadata !1203, metadata !896), !dbg !1204
  %229 = fpext float %228 to double, !dbg !1205
  %230 = fcmp olt double %229, 1.000000e-04, !dbg !1205
  br i1 %230, label %231, label %233, !dbg !1207

; <label>:231                                     ; preds = %221
  %232 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 14, !dbg !1208
  store i32 5, i32* %232, align 4, !dbg !1208
  br label %233, !dbg !1210

; <label>:233                                     ; preds = %231, %221
  %234 = fcmp ogt float %228, 0x3D10000000000000, !dbg !1211
  br i1 %234, label %235, label %266, !dbg !1213

; <label>:235                                     ; preds = %233
  call void @llvm.dbg.declare(metadata float* %rlen, metadata !1214, metadata !896), !dbg !1216
  %236 = call float @_Z6btSqrtf(float %228), !dbg !1217
  %237 = fdiv float 1.000000e+00, %236, !dbg !1218
  store float %237, float* %rlen, align 4, !dbg !1216
  %238 = call dereferenceable(16) %class.btVector3* @_ZN9btVector3mLERKf(%class.btVector3* %normalInB, float* dereferenceable(4) %rlen), !dbg !1219
  %239 = call float @_Z6btSqrtf(float %squaredDistance.1), !dbg !1220
  call void @llvm.dbg.value(metadata float %239, i64 0, metadata !1221, metadata !896), !dbg !1222
  %240 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 1, !dbg !1223
  %241 = load float* %marginA, align 4, !dbg !1224
  %242 = fdiv float %241, %239, !dbg !1224
  store float %242, float* %11, !dbg !1225
  %243 = call { <2 x float>, <2 x float> } @_ZmlRK9btVector3RKf(%class.btVector3* dereferenceable(16) %240, float* dereferenceable(4) %11), !dbg !1225
  %244 = getelementptr %class.btVector3* %10, i32 0, i32 0, !dbg !1225
  %245 = bitcast [4 x float]* %244 to { <2 x float>, <2 x float> }*, !dbg !1225
  %246 = getelementptr { <2 x float>, <2 x float> }* %245, i32 0, i32 0, !dbg !1225
  %247 = extractvalue { <2 x float>, <2 x float> } %243, 0, !dbg !1225
  store <2 x float> %247, <2 x float>* %246, align 1, !dbg !1225
  %248 = getelementptr { <2 x float>, <2 x float> }* %245, i32 0, i32 1, !dbg !1225
  %249 = extractvalue { <2 x float>, <2 x float> } %243, 1, !dbg !1225
  store <2 x float> %249, <2 x float>* %248, align 1, !dbg !1225
  %250 = call dereferenceable(16) %class.btVector3* @_ZN9btVector3mIERKS_(%class.btVector3* %pointOnA, %class.btVector3* dereferenceable(16) %10), !dbg !1226
  %251 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 1, !dbg !1227
  %252 = load float* %marginB, align 4, !dbg !1228
  %253 = fdiv float %252, %239, !dbg !1228
  store float %253, float* %13, !dbg !1229
  %254 = call { <2 x float>, <2 x float> } @_ZmlRK9btVector3RKf(%class.btVector3* dereferenceable(16) %251, float* dereferenceable(4) %13), !dbg !1229
  %255 = getelementptr %class.btVector3* %12, i32 0, i32 0, !dbg !1229
  %256 = bitcast [4 x float]* %255 to { <2 x float>, <2 x float> }*, !dbg !1229
  %257 = getelementptr { <2 x float>, <2 x float> }* %256, i32 0, i32 0, !dbg !1229
  %258 = extractvalue { <2 x float>, <2 x float> } %254, 0, !dbg !1229
  store <2 x float> %258, <2 x float>* %257, align 1, !dbg !1229
  %259 = getelementptr { <2 x float>, <2 x float> }* %256, i32 0, i32 1, !dbg !1229
  %260 = extractvalue { <2 x float>, <2 x float> } %254, 1, !dbg !1229
  store <2 x float> %260, <2 x float>* %259, align 1, !dbg !1229
  %261 = call dereferenceable(16) %class.btVector3* @_ZN9btVector3pLERKS_(%class.btVector3* %pointOnB, %class.btVector3* dereferenceable(16) %12), !dbg !1230
  %262 = load float* %rlen, align 4, !dbg !1231
  %263 = fdiv float 1.000000e+00, %262, !dbg !1232
  %264 = fsub float %263, %72, !dbg !1233
  call void @llvm.dbg.value(metadata float %264, i64 0, metadata !1019, metadata !896), !dbg !1020
  call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !1064, metadata !896), !dbg !1065
  %265 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 12, !dbg !1234
  store i32 1, i32* %265, align 4, !dbg !1234
  br label %268, !dbg !1235

; <label>:266                                     ; preds = %233
  %267 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 12, !dbg !1236
  store i32 2, i32* %267, align 4, !dbg !1236
  br label %268

; <label>:268                                     ; preds = %266, %235
  %isValid.0 = phi i8 [ 1, %235 ], [ 0, %266 ]
  %distance.0 = phi float [ %264, %235 ], [ 0.000000e+00, %266 ]
  br label %269, !dbg !1238

; <label>:269                                     ; preds = %268, %219
  %isValid.1 = phi i8 [ %isValid.0, %268 ], [ 0, %219 ]
  %distance.1 = phi float [ %distance.0, %268 ], [ 0.000000e+00, %219 ]
  %270 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 15, !dbg !1239
  %271 = load i32* %270, align 4, !dbg !1239
  %272 = icmp ne i32 %271, 0, !dbg !1239
  br i1 %272, label %273, label %285, !dbg !1239

; <label>:273                                     ; preds = %269
  %274 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 2, !dbg !1240
  %275 = load %class.btConvexPenetrationDepthSolver** %274, align 8, !dbg !1240
  %276 = icmp ne %class.btConvexPenetrationDepthSolver* %275, null, !dbg !1240
  br i1 %276, label %277, label %285, !dbg !1239

; <label>:277                                     ; preds = %273
  %278 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 14, !dbg !1242
  %279 = load i32* %278, align 4, !dbg !1242
  %280 = icmp ne i32 %279, 0, !dbg !1242
  br i1 %280, label %281, label %285, !dbg !1239

; <label>:281                                     ; preds = %277
  %282 = fadd float %distance.1, %72, !dbg !1244
  %283 = fpext float %282 to double, !dbg !1245
  %284 = fcmp olt double %283, 1.000000e-02, !dbg !1245
  br label %285

; <label>:285                                     ; preds = %281, %277, %273, %269
  %286 = phi i1 [ false, %277 ], [ false, %273 ], [ false, %269 ], [ %284, %281 ]
  %287 = zext i1 %286 to i8, !dbg !1246
  call void @llvm.dbg.value(metadata i8 %287, i64 0, metadata !1247, metadata !896), !dbg !1246
  %288 = trunc i8 1 to i1, !dbg !1248
  br i1 %288, label %289, label %417, !dbg !1250

; <label>:289                                     ; preds = %285
  %290 = trunc i8 %isValid.1 to i1, !dbg !1251
  br i1 %290, label %291, label %293, !dbg !1250

; <label>:291                                     ; preds = %289
  %292 = trunc i8 %287 to i1, !dbg !1253
  br i1 %292, label %293, label %417, !dbg !1250

; <label>:293                                     ; preds = %291, %289
  %294 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 2, !dbg !1255
  %295 = load %class.btConvexPenetrationDepthSolver** %294, align 8, !dbg !1255
  %296 = icmp ne %class.btConvexPenetrationDepthSolver* %295, null, !dbg !1255
  br i1 %296, label %297, label %416, !dbg !1258

; <label>:297                                     ; preds = %293
  call void @llvm.dbg.declare(metadata %class.btVector3* %tmpPointOnA, metadata !1259, metadata !896), !dbg !1261
  call void @_ZN9btVector3C2Ev(%class.btVector3* %tmpPointOnA), !dbg !1261
  call void @llvm.dbg.declare(metadata %class.btVector3* %tmpPointOnB, metadata !1262, metadata !896), !dbg !1263
  call void @_ZN9btVector3C2Ev(%class.btVector3* %tmpPointOnB), !dbg !1263
  %298 = load i32* @gNumDeepPenetrationChecks, align 4, !dbg !1264
  %299 = add nsw i32 %298, 1, !dbg !1264
  store i32 %299, i32* @gNumDeepPenetrationChecks, align 4, !dbg !1264
  %300 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 1, !dbg !1265
  call void @_ZN9btVector37setZeroEv(%class.btVector3* %300), !dbg !1265
  %301 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 2, !dbg !1266
  %302 = load %class.btConvexPenetrationDepthSolver** %301, align 8, !dbg !1266
  %303 = bitcast %class.btConvexPenetrationDepthSolver* %302 to i1 (%class.btConvexPenetrationDepthSolver*, %class.btVoronoiSimplexSolver*, %class.btConvexShape*, %class.btConvexShape*, %class.btTransform*, %class.btTransform*, %class.btVector3*, %class.btVector3*, %class.btVector3*, %class.btIDebugDraw*, %class.btStackAlloc*)***, !dbg !1266
  %304 = load i1 (%class.btConvexPenetrationDepthSolver*, %class.btVoronoiSimplexSolver*, %class.btConvexShape*, %class.btConvexShape*, %class.btTransform*, %class.btTransform*, %class.btVector3*, %class.btVector3*, %class.btVector3*, %class.btIDebugDraw*, %class.btStackAlloc*)*** %303, !dbg !1266
  %305 = getelementptr inbounds i1 (%class.btConvexPenetrationDepthSolver*, %class.btVoronoiSimplexSolver*, %class.btConvexShape*, %class.btConvexShape*, %class.btTransform*, %class.btTransform*, %class.btVector3*, %class.btVector3*, %class.btVector3*, %class.btIDebugDraw*, %class.btStackAlloc*)** %304, i64 2, !dbg !1266
  %306 = load i1 (%class.btConvexPenetrationDepthSolver*, %class.btVoronoiSimplexSolver*, %class.btConvexShape*, %class.btConvexShape*, %class.btTransform*, %class.btTransform*, %class.btVector3*, %class.btVector3*, %class.btVector3*, %class.btIDebugDraw*, %class.btStackAlloc*)** %305, !dbg !1266
  %307 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 3, !dbg !1267
  %308 = load %class.btVoronoiSimplexSolver** %307, align 8, !dbg !1267
  %309 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 4, !dbg !1268
  %310 = load %class.btConvexShape** %309, align 8, !dbg !1268
  %311 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 5, !dbg !1269
  %312 = load %class.btConvexShape** %311, align 8, !dbg !1269
  %313 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 1, !dbg !1266
  %314 = getelementptr inbounds %"struct.btDiscreteCollisionDetectorInterface::ClosestPointInput"* %input, i32 0, i32 3, !dbg !1270
  %315 = load %class.btStackAlloc** %314, align 8, !dbg !1270
  %316 = call zeroext i1 %306(%class.btConvexPenetrationDepthSolver* %302, %class.btVoronoiSimplexSolver* dereferenceable(360) %308, %class.btConvexShape* %310, %class.btConvexShape* %312, %class.btTransform* dereferenceable(64) %localTransA, %class.btTransform* dereferenceable(64) %localTransB, %class.btVector3* dereferenceable(16) %313, %class.btVector3* dereferenceable(16) %tmpPointOnA, %class.btVector3* dereferenceable(16) %tmpPointOnB, %class.btIDebugDraw* %debugDraw, %class.btStackAlloc* %315), !dbg !1266
  %317 = zext i1 %316 to i8, !dbg !1271
  call void @llvm.dbg.value(metadata i8 %317, i64 0, metadata !1272, metadata !896), !dbg !1271
  %318 = trunc i8 %317 to i1, !dbg !1273
  br i1 %318, label %319, label %366, !dbg !1275

; <label>:319                                     ; preds = %297
  call void @llvm.dbg.declare(metadata %class.btVector3* %tmpNormalInB, metadata !1276, metadata !896), !dbg !1278
  %320 = call { <2 x float>, <2 x float> } @_ZmiRK9btVector3S1_(%class.btVector3* dereferenceable(16) %tmpPointOnB, %class.btVector3* dereferenceable(16) %tmpPointOnA), !dbg !1279
  %321 = getelementptr %class.btVector3* %tmpNormalInB, i32 0, i32 0, !dbg !1279
  %322 = bitcast [4 x float]* %321 to { <2 x float>, <2 x float> }*, !dbg !1279
  %323 = getelementptr { <2 x float>, <2 x float> }* %322, i32 0, i32 0, !dbg !1279
  %324 = extractvalue { <2 x float>, <2 x float> } %320, 0, !dbg !1279
  store <2 x float> %324, <2 x float>* %323, align 1, !dbg !1279
  %325 = getelementptr { <2 x float>, <2 x float> }* %322, i32 0, i32 1, !dbg !1279
  %326 = extractvalue { <2 x float>, <2 x float> } %320, 1, !dbg !1279
  store <2 x float> %326, <2 x float>* %325, align 1, !dbg !1279
  %327 = call float @_ZNK9btVector37length2Ev(%class.btVector3* %tmpNormalInB), !dbg !1280
  call void @llvm.dbg.value(metadata float %327, i64 0, metadata !1281, metadata !896), !dbg !1282
  %328 = fcmp ole float %327, 0x3D10000000000000, !dbg !1283
  br i1 %328, label %329, label %335, !dbg !1285

; <label>:329                                     ; preds = %319
  %330 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 1, !dbg !1286
  %331 = bitcast %class.btVector3* %tmpNormalInB to i8*, !dbg !1286
  %332 = bitcast %class.btVector3* %330 to i8*, !dbg !1286
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %331, i8* %332, i64 16, i32 4, i1 false), !dbg !1286
  %333 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 1, !dbg !1288
  %334 = call float @_ZNK9btVector37length2Ev(%class.btVector3* %333), !dbg !1288
  call void @llvm.dbg.value(metadata float %334, i64 0, metadata !1281, metadata !896), !dbg !1282
  br label %335, !dbg !1289

; <label>:335                                     ; preds = %329, %319
  %lenSqr1.0 = phi float [ %334, %329 ], [ %327, %319 ]
  %336 = fcmp ogt float %lenSqr1.0, 0x3D10000000000000, !dbg !1290
  br i1 %336, label %337, label %363, !dbg !1292

; <label>:337                                     ; preds = %335
  %338 = call float @_Z6btSqrtf(float %lenSqr1.0), !dbg !1293
  store float %338, float* %14, !dbg !1295
  %339 = call dereferenceable(16) %class.btVector3* @_ZN9btVector3dVERKf(%class.btVector3* %tmpNormalInB, float* dereferenceable(4) %14), !dbg !1295
  %340 = call { <2 x float>, <2 x float> } @_ZmiRK9btVector3S1_(%class.btVector3* dereferenceable(16) %tmpPointOnA, %class.btVector3* dereferenceable(16) %tmpPointOnB), !dbg !1296
  %341 = getelementptr %class.btVector3* %15, i32 0, i32 0, !dbg !1296
  %342 = bitcast [4 x float]* %341 to { <2 x float>, <2 x float> }*, !dbg !1296
  %343 = getelementptr { <2 x float>, <2 x float> }* %342, i32 0, i32 0, !dbg !1296
  %344 = extractvalue { <2 x float>, <2 x float> } %340, 0, !dbg !1296
  store <2 x float> %344, <2 x float>* %343, align 1, !dbg !1296
  %345 = getelementptr { <2 x float>, <2 x float> }* %342, i32 0, i32 1, !dbg !1296
  %346 = extractvalue { <2 x float>, <2 x float> } %340, 1, !dbg !1296
  store <2 x float> %346, <2 x float>* %345, align 1, !dbg !1296
  %347 = call float @_ZNK9btVector36lengthEv(%class.btVector3* %15), !dbg !1297
  %348 = fsub float -0.000000e+00, %347, !dbg !1298
  call void @llvm.dbg.value(metadata float %348, i64 0, metadata !1299, metadata !896), !dbg !1300
  %349 = trunc i8 %isValid.1 to i1, !dbg !1301
  br i1 %349, label %350, label %352, !dbg !1303

; <label>:350                                     ; preds = %337
  %351 = fcmp olt float %348, %distance.1, !dbg !1304
  br i1 %351, label %352, label %360, !dbg !1303

; <label>:352                                     ; preds = %350, %337
  call void @llvm.dbg.value(metadata float %348, i64 0, metadata !1019, metadata !896), !dbg !1020
  %353 = bitcast %class.btVector3* %pointOnA to i8*, !dbg !1305
  %354 = bitcast %class.btVector3* %tmpPointOnA to i8*, !dbg !1305
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %353, i8* %354, i64 16, i32 4, i1 false), !dbg !1305
  %355 = bitcast %class.btVector3* %pointOnB to i8*, !dbg !1307
  %356 = bitcast %class.btVector3* %tmpPointOnB to i8*, !dbg !1307
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %355, i8* %356, i64 16, i32 4, i1 false), !dbg !1307
  %357 = bitcast %class.btVector3* %normalInB to i8*, !dbg !1308
  %358 = bitcast %class.btVector3* %tmpNormalInB to i8*, !dbg !1308
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %357, i8* %358, i64 16, i32 4, i1 false), !dbg !1308
  call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !1064, metadata !896), !dbg !1065
  %359 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 12, !dbg !1309
  store i32 3, i32* %359, align 4, !dbg !1309
  br label %362, !dbg !1310

; <label>:360                                     ; preds = %350
  %361 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 12, !dbg !1311
  store i32 8, i32* %361, align 4, !dbg !1311
  br label %362

; <label>:362                                     ; preds = %360, %352
  %isValid.2 = phi i8 [ 1, %352 ], [ %isValid.1, %360 ]
  %distance.2 = phi float [ %348, %352 ], [ %distance.1, %360 ]
  br label %365, !dbg !1313

; <label>:363                                     ; preds = %335
  %364 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 12, !dbg !1314
  store i32 9, i32* %364, align 4, !dbg !1314
  br label %365

; <label>:365                                     ; preds = %363, %362
  %isValid.3 = phi i8 [ %isValid.2, %362 ], [ %isValid.1, %363 ]
  %distance.3 = phi float [ %distance.2, %362 ], [ %distance.1, %363 ]
  br label %415, !dbg !1316

; <label>:366                                     ; preds = %297
  %367 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 1, !dbg !1317
  %368 = call float @_ZNK9btVector37length2Ev(%class.btVector3* %367), !dbg !1317
  %369 = fcmp ogt float %368, 0.000000e+00, !dbg !1317
  br i1 %369, label %370, label %414, !dbg !1320

; <label>:370                                     ; preds = %366
  %371 = call { <2 x float>, <2 x float> } @_ZmiRK9btVector3S1_(%class.btVector3* dereferenceable(16) %tmpPointOnA, %class.btVector3* dereferenceable(16) %tmpPointOnB), !dbg !1321
  %372 = getelementptr %class.btVector3* %16, i32 0, i32 0, !dbg !1321
  %373 = bitcast [4 x float]* %372 to { <2 x float>, <2 x float> }*, !dbg !1321
  %374 = getelementptr { <2 x float>, <2 x float> }* %373, i32 0, i32 0, !dbg !1321
  %375 = extractvalue { <2 x float>, <2 x float> } %371, 0, !dbg !1321
  store <2 x float> %375, <2 x float>* %374, align 1, !dbg !1321
  %376 = getelementptr { <2 x float>, <2 x float> }* %373, i32 0, i32 1, !dbg !1321
  %377 = extractvalue { <2 x float>, <2 x float> } %371, 1, !dbg !1321
  store <2 x float> %377, <2 x float>* %376, align 1, !dbg !1321
  %378 = call float @_ZNK9btVector36lengthEv(%class.btVector3* %16), !dbg !1323
  %379 = fsub float %378, %72, !dbg !1323
  call void @llvm.dbg.value(metadata float %379, i64 0, metadata !1324, metadata !896), !dbg !1325
  %380 = trunc i8 %isValid.1 to i1, !dbg !1326
  br i1 %380, label %381, label %383, !dbg !1328

; <label>:381                                     ; preds = %370
  %382 = fcmp olt float %379, %distance.1, !dbg !1329
  br i1 %382, label %383, label %411, !dbg !1328

; <label>:383                                     ; preds = %381, %370
  call void @llvm.dbg.value(metadata float %379, i64 0, metadata !1019, metadata !896), !dbg !1020
  %384 = bitcast %class.btVector3* %pointOnA to i8*, !dbg !1330
  %385 = bitcast %class.btVector3* %tmpPointOnA to i8*, !dbg !1330
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %384, i8* %385, i64 16, i32 4, i1 false), !dbg !1330
  %386 = bitcast %class.btVector3* %pointOnB to i8*, !dbg !1332
  %387 = bitcast %class.btVector3* %tmpPointOnB to i8*, !dbg !1332
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %386, i8* %387, i64 16, i32 4, i1 false), !dbg !1332
  %388 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 1, !dbg !1333
  %389 = call { <2 x float>, <2 x float> } @_ZmlRK9btVector3RKf(%class.btVector3* dereferenceable(16) %388, float* dereferenceable(4) %marginA), !dbg !1334
  %390 = getelementptr %class.btVector3* %17, i32 0, i32 0, !dbg !1334
  %391 = bitcast [4 x float]* %390 to { <2 x float>, <2 x float> }*, !dbg !1334
  %392 = getelementptr { <2 x float>, <2 x float> }* %391, i32 0, i32 0, !dbg !1334
  %393 = extractvalue { <2 x float>, <2 x float> } %389, 0, !dbg !1334
  store <2 x float> %393, <2 x float>* %392, align 1, !dbg !1334
  %394 = getelementptr { <2 x float>, <2 x float> }* %391, i32 0, i32 1, !dbg !1334
  %395 = extractvalue { <2 x float>, <2 x float> } %389, 1, !dbg !1334
  store <2 x float> %395, <2 x float>* %394, align 1, !dbg !1334
  %396 = call dereferenceable(16) %class.btVector3* @_ZN9btVector3mIERKS_(%class.btVector3* %pointOnA, %class.btVector3* dereferenceable(16) %17), !dbg !1335
  %397 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 1, !dbg !1336
  %398 = call { <2 x float>, <2 x float> } @_ZmlRK9btVector3RKf(%class.btVector3* dereferenceable(16) %397, float* dereferenceable(4) %marginB), !dbg !1337
  %399 = getelementptr %class.btVector3* %18, i32 0, i32 0, !dbg !1337
  %400 = bitcast [4 x float]* %399 to { <2 x float>, <2 x float> }*, !dbg !1337
  %401 = getelementptr { <2 x float>, <2 x float> }* %400, i32 0, i32 0, !dbg !1337
  %402 = extractvalue { <2 x float>, <2 x float> } %398, 0, !dbg !1337
  store <2 x float> %402, <2 x float>* %401, align 1, !dbg !1337
  %403 = getelementptr { <2 x float>, <2 x float> }* %400, i32 0, i32 1, !dbg !1337
  %404 = extractvalue { <2 x float>, <2 x float> } %398, 1, !dbg !1337
  store <2 x float> %404, <2 x float>* %403, align 1, !dbg !1337
  %405 = call dereferenceable(16) %class.btVector3* @_ZN9btVector3pLERKS_(%class.btVector3* %pointOnB, %class.btVector3* dereferenceable(16) %18), !dbg !1338
  %406 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 1, !dbg !1339
  %407 = bitcast %class.btVector3* %normalInB to i8*, !dbg !1339
  %408 = bitcast %class.btVector3* %406 to i8*, !dbg !1339
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %407, i8* %408, i64 16, i32 4, i1 false), !dbg !1339
  %409 = call dereferenceable(16) %class.btVector3* @_ZN9btVector39normalizeEv(%class.btVector3* %normalInB), !dbg !1340
  call void @llvm.dbg.value(metadata i8 1, i64 0, metadata !1064, metadata !896), !dbg !1065
  %410 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 12, !dbg !1341
  store i32 6, i32* %410, align 4, !dbg !1341
  br label %413, !dbg !1342

; <label>:411                                     ; preds = %381
  %412 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 12, !dbg !1343
  store i32 5, i32* %412, align 4, !dbg !1343
  br label %413

; <label>:413                                     ; preds = %411, %383
  %isValid.4 = phi i8 [ 1, %383 ], [ %isValid.1, %411 ]
  %distance.4 = phi float [ %379, %383 ], [ %distance.1, %411 ]
  br label %414, !dbg !1345

; <label>:414                                     ; preds = %413, %366
  %isValid.5 = phi i8 [ %isValid.4, %413 ], [ %isValid.1, %366 ]
  %distance.5 = phi float [ %distance.4, %413 ], [ %distance.1, %366 ]
  br label %415

; <label>:415                                     ; preds = %414, %365
  %isValid.6 = phi i8 [ %isValid.3, %365 ], [ %isValid.5, %414 ]
  %distance.6 = phi float [ %distance.3, %365 ], [ %distance.5, %414 ]
  br label %416, !dbg !1346

; <label>:416                                     ; preds = %415, %293
  %isValid.7 = phi i8 [ %isValid.6, %415 ], [ %isValid.1, %293 ]
  %distance.7 = phi float [ %distance.6, %415 ], [ %distance.1, %293 ]
  br label %417, !dbg !1347

; <label>:417                                     ; preds = %416, %291, %285
  %isValid.8 = phi i8 [ %isValid.7, %416 ], [ %isValid.1, %291 ], [ %isValid.1, %285 ]
  %distance.8 = phi float [ %distance.7, %416 ], [ %distance.1, %291 ], [ %distance.1, %285 ]
  %418 = trunc i8 %isValid.8 to i1, !dbg !1348
  br i1 %418, label %419, label %442, !dbg !1350

; <label>:419                                     ; preds = %417
  %420 = fcmp olt float %distance.8, 0.000000e+00, !dbg !1351
  br i1 %420, label %426, label %421, !dbg !1350

; <label>:421                                     ; preds = %419
  %422 = fmul float %distance.8, %distance.8, !dbg !1353
  %423 = getelementptr inbounds %"struct.btDiscreteCollisionDetectorInterface::ClosestPointInput"* %input, i32 0, i32 2, !dbg !1354
  %424 = load float* %423, align 4, !dbg !1354
  %425 = fcmp olt float %422, %424, !dbg !1353
  br i1 %425, label %426, label %442, !dbg !1350

; <label>:426                                     ; preds = %421, %419
  %427 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 1, !dbg !1355
  %428 = bitcast %class.btVector3* %427 to i8*, !dbg !1355
  %429 = bitcast %class.btVector3* %normalInB to i8*, !dbg !1355
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %428, i8* %429, i64 16, i32 4, i1 false), !dbg !1355
  %430 = getelementptr inbounds %class.btGjkPairDetector* %this, i32 0, i32 11, !dbg !1357
  store float %distance.8, float* %430, align 4, !dbg !1357
  %431 = bitcast %"struct.btDiscreteCollisionDetectorInterface::Result"* %output to void (%"struct.btDiscreteCollisionDetectorInterface::Result"*, %class.btVector3*, %class.btVector3*, float)***, !dbg !1358
  %432 = load void (%"struct.btDiscreteCollisionDetectorInterface::Result"*, %class.btVector3*, %class.btVector3*, float)*** %431, !dbg !1358
  %433 = getelementptr inbounds void (%"struct.btDiscreteCollisionDetectorInterface::Result"*, %class.btVector3*, %class.btVector3*, float)** %432, i64 4, !dbg !1358
  %434 = load void (%"struct.btDiscreteCollisionDetectorInterface::Result"*, %class.btVector3*, %class.btVector3*, float)** %433, !dbg !1358
  %435 = call { <2 x float>, <2 x float> } @_ZplRK9btVector3S1_(%class.btVector3* dereferenceable(16) %pointOnB, %class.btVector3* dereferenceable(16) %positionOffset), !dbg !1359
  %436 = getelementptr %class.btVector3* %19, i32 0, i32 0, !dbg !1359
  %437 = bitcast [4 x float]* %436 to { <2 x float>, <2 x float> }*, !dbg !1359
  %438 = getelementptr { <2 x float>, <2 x float> }* %437, i32 0, i32 0, !dbg !1359
  %439 = extractvalue { <2 x float>, <2 x float> } %435, 0, !dbg !1359
  store <2 x float> %439, <2 x float>* %438, align 1, !dbg !1359
  %440 = getelementptr { <2 x float>, <2 x float> }* %437, i32 0, i32 1, !dbg !1359
  %441 = extractvalue { <2 x float>, <2 x float> } %435, 1, !dbg !1359
  store <2 x float> %441, <2 x float>* %440, align 1, !dbg !1359
  call void %434(%"struct.btDiscreteCollisionDetectorInterface::Result"* %output, %class.btVector3* dereferenceable(16) %normalInB, %class.btVector3* dereferenceable(16) %19, float %distance.8), !dbg !1358
  br label %442, !dbg !1360

; <label>:442                                     ; preds = %426, %421, %417
  ret void, !dbg !1361
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr void @_ZN9btVector3C2Ev(%class.btVector3* %this) unnamed_addr #2 align 2 {
  call void @llvm.dbg.value(metadata %class.btVector3* %this, i64 0, metadata !1362, metadata !896), !dbg !1363
  ret void, !dbg !1364
}

; Function Attrs: inlinehint uwtable
define linkonce_odr void @_ZN11btTransformC2ERKS_(%class.btTransform* %this, %class.btTransform* dereferenceable(64) %other) unnamed_addr #5 align 2 {
  call void @llvm.dbg.value(metadata %class.btTransform* %this, i64 0, metadata !1365, metadata !896), !dbg !1367
  call void @llvm.dbg.value(metadata %class.btTransform* %other, i64 0, metadata !1368, metadata !896), !dbg !1370
  %1 = getelementptr inbounds %class.btTransform* %this, i32 0, i32 0, !dbg !1371
  %2 = getelementptr inbounds %class.btTransform* %other, i32 0, i32 0, !dbg !1371
  call void @_ZN11btMatrix3x3C2ERKS_(%class.btMatrix3x3* %1, %class.btMatrix3x3* dereferenceable(48) %2), !dbg !1371
  %3 = getelementptr inbounds %class.btTransform* %this, i32 0, i32 1, !dbg !1372
  %4 = getelementptr inbounds %class.btTransform* %other, i32 0, i32 1, !dbg !1372
  %5 = bitcast %class.btVector3* %3 to i8*, !dbg !1372
  %6 = bitcast %class.btVector3* %4 to i8*, !dbg !1372
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %5, i8* %6, i64 16, i32 4, i1 false), !dbg !1372
  ret void, !dbg !1373
}

; Function Attrs: inlinehint uwtable
define linkonce_odr { <2 x float>, <2 x float> } @_ZmlRK9btVector3RKf(%class.btVector3* dereferenceable(16) %v, float* dereferenceable(4) %s) #5 {
  %1 = alloca %class.btVector3, align 4
  %2 = alloca float, align 4
  %3 = alloca float, align 4
  %4 = alloca float, align 4
  call void @llvm.dbg.value(metadata %class.btVector3* %v, i64 0, metadata !1374, metadata !896), !dbg !1375
  call void @llvm.dbg.value(metadata float* %s, i64 0, metadata !1376, metadata !896), !dbg !1377
  %5 = getelementptr inbounds %class.btVector3* %v, i32 0, i32 0, !dbg !1378
  %6 = getelementptr inbounds [4 x float]* %5, i32 0, i64 0, !dbg !1378
  %7 = load float* %6, align 4, !dbg !1378
  %8 = load float* %s, align 4, !dbg !1379
  %9 = fmul float %7, %8, !dbg !1378
  store float %9, float* %2, !dbg !1380
  %10 = getelementptr inbounds %class.btVector3* %v, i32 0, i32 0, !dbg !1381
  %11 = getelementptr inbounds [4 x float]* %10, i32 0, i64 1, !dbg !1381
  %12 = load float* %11, align 4, !dbg !1381
  %13 = load float* %s, align 4, !dbg !1382
  %14 = fmul float %12, %13, !dbg !1381
  store float %14, float* %3, !dbg !1380
  %15 = getelementptr inbounds %class.btVector3* %v, i32 0, i32 0, !dbg !1383
  %16 = getelementptr inbounds [4 x float]* %15, i32 0, i64 2, !dbg !1383
  %17 = load float* %16, align 4, !dbg !1383
  %18 = load float* %s, align 4, !dbg !1384
  %19 = fmul float %17, %18, !dbg !1383
  store float %19, float* %4, !dbg !1380
  call void @_ZN9btVector3C2ERKfS1_S1_(%class.btVector3* %1, float* dereferenceable(4) %2, float* dereferenceable(4) %3, float* dereferenceable(4) %4), !dbg !1380
  %20 = getelementptr %class.btVector3* %1, i32 0, i32 0, !dbg !1380
  %21 = bitcast [4 x float]* %20 to { <2 x float>, <2 x float> }*, !dbg !1380
  %22 = load { <2 x float>, <2 x float> }* %21, align 1, !dbg !1380
  ret { <2 x float>, <2 x float> } %22, !dbg !1380
}

; Function Attrs: inlinehint uwtable
define linkonce_odr { <2 x float>, <2 x float> } @_ZplRK9btVector3S1_(%class.btVector3* dereferenceable(16) %v1, %class.btVector3* dereferenceable(16) %v2) #5 {
  %1 = alloca %class.btVector3, align 4
  %2 = alloca float, align 4
  %3 = alloca float, align 4
  %4 = alloca float, align 4
  call void @llvm.dbg.value(metadata %class.btVector3* %v1, i64 0, metadata !1385, metadata !896), !dbg !1386
  call void @llvm.dbg.value(metadata %class.btVector3* %v2, i64 0, metadata !1387, metadata !896), !dbg !1388
  %5 = getelementptr inbounds %class.btVector3* %v1, i32 0, i32 0, !dbg !1389
  %6 = getelementptr inbounds [4 x float]* %5, i32 0, i64 0, !dbg !1389
  %7 = load float* %6, align 4, !dbg !1389
  %8 = getelementptr inbounds %class.btVector3* %v2, i32 0, i32 0, !dbg !1390
  %9 = getelementptr inbounds [4 x float]* %8, i32 0, i64 0, !dbg !1390
  %10 = load float* %9, align 4, !dbg !1390
  %11 = fadd float %7, %10, !dbg !1389
  store float %11, float* %2, !dbg !1391
  %12 = getelementptr inbounds %class.btVector3* %v1, i32 0, i32 0, !dbg !1392
  %13 = getelementptr inbounds [4 x float]* %12, i32 0, i64 1, !dbg !1392
  %14 = load float* %13, align 4, !dbg !1392
  %15 = getelementptr inbounds %class.btVector3* %v2, i32 0, i32 0, !dbg !1393
  %16 = getelementptr inbounds [4 x float]* %15, i32 0, i64 1, !dbg !1393
  %17 = load float* %16, align 4, !dbg !1393
  %18 = fadd float %14, %17, !dbg !1392
  store float %18, float* %3, !dbg !1391
  %19 = getelementptr inbounds %class.btVector3* %v1, i32 0, i32 0, !dbg !1394
  %20 = getelementptr inbounds [4 x float]* %19, i32 0, i64 2, !dbg !1394
  %21 = load float* %20, align 4, !dbg !1394
  %22 = getelementptr inbounds %class.btVector3* %v2, i32 0, i32 0, !dbg !1395
  %23 = getelementptr inbounds [4 x float]* %22, i32 0, i64 2, !dbg !1395
  %24 = load float* %23, align 4, !dbg !1395
  %25 = fadd float %21, %24, !dbg !1394
  store float %25, float* %4, !dbg !1391
  call void @_ZN9btVector3C2ERKfS1_S1_(%class.btVector3* %1, float* dereferenceable(4) %2, float* dereferenceable(4) %3, float* dereferenceable(4) %4), !dbg !1391
  %26 = getelementptr %class.btVector3* %1, i32 0, i32 0, !dbg !1391
  %27 = bitcast [4 x float]* %26 to { <2 x float>, <2 x float> }*, !dbg !1391
  %28 = load { <2 x float>, <2 x float> }* %27, align 1, !dbg !1391
  ret { <2 x float>, <2 x float> } %28, !dbg !1391
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dereferenceable(16) %class.btVector3* @_ZN11btTransform9getOriginEv(%class.btTransform* %this) #2 align 2 {
  call void @llvm.dbg.value(metadata %class.btTransform* %this, i64 0, metadata !1396, metadata !896), !dbg !1397
  %1 = getelementptr inbounds %class.btTransform* %this, i32 0, i32 1, !dbg !1398
  ret %class.btVector3* %1, !dbg !1398
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dereferenceable(16) %class.btVector3* @_ZN9btVector3mIERKS_(%class.btVector3* %this, %class.btVector3* dereferenceable(16) %v) #2 align 2 {
  call void @llvm.dbg.value(metadata %class.btVector3* %this, i64 0, metadata !1399, metadata !896), !dbg !1400
  call void @llvm.dbg.value(metadata %class.btVector3* %v, i64 0, metadata !1401, metadata !896), !dbg !1402
  %1 = getelementptr inbounds %class.btVector3* %v, i32 0, i32 0, !dbg !1403
  %2 = getelementptr inbounds [4 x float]* %1, i32 0, i64 0, !dbg !1403
  %3 = load float* %2, align 4, !dbg !1403
  %4 = getelementptr inbounds %class.btVector3* %this, i32 0, i32 0, !dbg !1404
  %5 = getelementptr inbounds [4 x float]* %4, i32 0, i64 0, !dbg !1404
  %6 = load float* %5, align 4, !dbg !1404
  %7 = fsub float %6, %3, !dbg !1404
  store float %7, float* %5, align 4, !dbg !1404
  %8 = getelementptr inbounds %class.btVector3* %v, i32 0, i32 0, !dbg !1405
  %9 = getelementptr inbounds [4 x float]* %8, i32 0, i64 1, !dbg !1405
  %10 = load float* %9, align 4, !dbg !1405
  %11 = getelementptr inbounds %class.btVector3* %this, i32 0, i32 0, !dbg !1406
  %12 = getelementptr inbounds [4 x float]* %11, i32 0, i64 1, !dbg !1406
  %13 = load float* %12, align 4, !dbg !1406
  %14 = fsub float %13, %10, !dbg !1406
  store float %14, float* %12, align 4, !dbg !1406
  %15 = getelementptr inbounds %class.btVector3* %v, i32 0, i32 0, !dbg !1407
  %16 = getelementptr inbounds [4 x float]* %15, i32 0, i64 2, !dbg !1407
  %17 = load float* %16, align 4, !dbg !1407
  %18 = getelementptr inbounds %class.btVector3* %this, i32 0, i32 0, !dbg !1408
  %19 = getelementptr inbounds [4 x float]* %18, i32 0, i64 2, !dbg !1408
  %20 = load float* %19, align 4, !dbg !1408
  %21 = fsub float %20, %17, !dbg !1408
  store float %21, float* %19, align 4, !dbg !1408
  ret %class.btVector3* %this, !dbg !1409
}

; Function Attrs: inlinehint uwtable
define linkonce_odr zeroext i1 @_ZNK16btCollisionShape10isConvex2dEv(%class.btCollisionShape* %this) #5 align 2 {
  call void @llvm.dbg.value(metadata %class.btCollisionShape* %this, i64 0, metadata !1410, metadata !896), !dbg !1411
  %1 = call i32 @_ZNK16btCollisionShape12getShapeTypeEv(%class.btCollisionShape* %this), !dbg !1412
  %2 = call zeroext i1 @_ZN17btBroadphaseProxy10isConvex2dEi(i32 %1), !dbg !1413
  ret i1 %2, !dbg !1414
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr void @_ZN9btVector38setValueERKfS1_S1_(%class.btVector3* %this, float* dereferenceable(4) %_x, float* dereferenceable(4) %_y, float* dereferenceable(4) %_z) #2 align 2 {
  call void @llvm.dbg.value(metadata %class.btVector3* %this, i64 0, metadata !1415, metadata !896), !dbg !1416
  call void @llvm.dbg.value(metadata float* %_x, i64 0, metadata !1417, metadata !896), !dbg !1418
  call void @llvm.dbg.value(metadata float* %_y, i64 0, metadata !1419, metadata !896), !dbg !1420
  call void @llvm.dbg.value(metadata float* %_z, i64 0, metadata !1421, metadata !896), !dbg !1422
  %1 = load float* %_x, align 4, !dbg !1423
  %2 = getelementptr inbounds %class.btVector3* %this, i32 0, i32 0, !dbg !1424
  %3 = getelementptr inbounds [4 x float]* %2, i32 0, i64 0, !dbg !1424
  store float %1, float* %3, align 4, !dbg !1424
  %4 = load float* %_y, align 4, !dbg !1425
  %5 = getelementptr inbounds %class.btVector3* %this, i32 0, i32 0, !dbg !1426
  %6 = getelementptr inbounds [4 x float]* %5, i32 0, i64 1, !dbg !1426
  store float %4, float* %6, align 4, !dbg !1426
  %7 = load float* %_z, align 4, !dbg !1427
  %8 = getelementptr inbounds %class.btVector3* %this, i32 0, i32 0, !dbg !1428
  %9 = getelementptr inbounds [4 x float]* %8, i32 0, i64 2, !dbg !1428
  store float %7, float* %9, align 4, !dbg !1428
  %10 = getelementptr inbounds %class.btVector3* %this, i32 0, i32 0, !dbg !1429
  %11 = getelementptr inbounds [4 x float]* %10, i32 0, i64 3, !dbg !1429
  store float 0.000000e+00, float* %11, align 4, !dbg !1429
  ret void, !dbg !1430
}

declare void @_ZN22btVoronoiSimplexSolver5resetEv(%class.btVoronoiSimplexSolver*) #6

; Function Attrs: inlinehint uwtable
define linkonce_odr { <2 x float>, <2 x float> } @_ZmlRK9btVector3RK11btMatrix3x3(%class.btVector3* dereferenceable(16) %v, %class.btMatrix3x3* dereferenceable(48) %m) #5 {
  %1 = alloca %class.btVector3, align 4
  %2 = alloca float, align 4
  %3 = alloca float, align 4
  %4 = alloca float, align 4
  call void @llvm.dbg.value(metadata %class.btVector3* %v, i64 0, metadata !1431, metadata !896), !dbg !1432
  call void @llvm.dbg.value(metadata %class.btMatrix3x3* %m, i64 0, metadata !1433, metadata !896), !dbg !1434
  %5 = call float @_ZNK11btMatrix3x35tdotxERK9btVector3(%class.btMatrix3x3* %m, %class.btVector3* dereferenceable(16) %v), !dbg !1435
  store float %5, float* %2, !dbg !1436
  %6 = call float @_ZNK11btMatrix3x35tdotyERK9btVector3(%class.btMatrix3x3* %m, %class.btVector3* dereferenceable(16) %v), !dbg !1437
  store float %6, float* %3, !dbg !1436
  %7 = call float @_ZNK11btMatrix3x35tdotzERK9btVector3(%class.btMatrix3x3* %m, %class.btVector3* dereferenceable(16) %v), !dbg !1438
  store float %7, float* %4, !dbg !1436
  call void @_ZN9btVector3C2ERKfS1_S1_(%class.btVector3* %1, float* dereferenceable(4) %2, float* dereferenceable(4) %3, float* dereferenceable(4) %4), !dbg !1436
  %8 = getelementptr %class.btVector3* %1, i32 0, i32 0, !dbg !1436
  %9 = bitcast [4 x float]* %8 to { <2 x float>, <2 x float> }*, !dbg !1436
  %10 = load { <2 x float>, <2 x float> }* %9, align 1, !dbg !1436
  ret { <2 x float>, <2 x float> } %10, !dbg !1436
}

; Function Attrs: inlinehint uwtable
define linkonce_odr { <2 x float>, <2 x float> } @_ZngRK9btVector3(%class.btVector3* dereferenceable(16) %v) #5 {
  %1 = alloca %class.btVector3, align 4
  %2 = alloca float, align 4
  %3 = alloca float, align 4
  %4 = alloca float, align 4
  call void @llvm.dbg.value(metadata %class.btVector3* %v, i64 0, metadata !1439, metadata !896), !dbg !1440
  %5 = getelementptr inbounds %class.btVector3* %v, i32 0, i32 0, !dbg !1441
  %6 = getelementptr inbounds [4 x float]* %5, i32 0, i64 0, !dbg !1441
  %7 = load float* %6, align 4, !dbg !1441
  %8 = fsub float -0.000000e+00, %7, !dbg !1442
  store float %8, float* %2, !dbg !1443
  %9 = getelementptr inbounds %class.btVector3* %v, i32 0, i32 0, !dbg !1444
  %10 = getelementptr inbounds [4 x float]* %9, i32 0, i64 1, !dbg !1444
  %11 = load float* %10, align 4, !dbg !1444
  %12 = fsub float -0.000000e+00, %11, !dbg !1445
  store float %12, float* %3, !dbg !1443
  %13 = getelementptr inbounds %class.btVector3* %v, i32 0, i32 0, !dbg !1446
  %14 = getelementptr inbounds [4 x float]* %13, i32 0, i64 2, !dbg !1446
  %15 = load float* %14, align 4, !dbg !1446
  %16 = fsub float -0.000000e+00, %15, !dbg !1447
  store float %16, float* %4, !dbg !1443
  call void @_ZN9btVector3C2ERKfS1_S1_(%class.btVector3* %1, float* dereferenceable(4) %2, float* dereferenceable(4) %3, float* dereferenceable(4) %4), !dbg !1443
  %17 = getelementptr %class.btVector3* %1, i32 0, i32 0, !dbg !1443
  %18 = bitcast [4 x float]* %17 to { <2 x float>, <2 x float> }*, !dbg !1443
  %19 = load { <2 x float>, <2 x float> }* %18, align 1, !dbg !1443
  ret { <2 x float>, <2 x float> } %19, !dbg !1443
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dereferenceable(48) %class.btMatrix3x3* @_ZNK11btTransform8getBasisEv(%class.btTransform* %this) #2 align 2 {
  call void @llvm.dbg.value(metadata %class.btTransform* %this, i64 0, metadata !1448, metadata !896), !dbg !1450
  %1 = getelementptr inbounds %class.btTransform* %this, i32 0, i32 0, !dbg !1451
  ret %class.btMatrix3x3* %1, !dbg !1451
}

declare { <2 x float>, <2 x float> } @_ZNK13btConvexShape44localGetSupportVertexWithoutMarginNonVirtualERK9btVector3(%class.btConvexShape*, %class.btVector3* dereferenceable(16)) #6

; Function Attrs: inlinehint uwtable
define linkonce_odr { <2 x float>, <2 x float> } @_ZNK11btTransformclERK9btVector3(%class.btTransform* %this, %class.btVector3* dereferenceable(16) %x) #5 align 2 {
  %1 = alloca %class.btVector3, align 4
  %2 = alloca %class.btVector3, align 4
  call void @llvm.dbg.value(metadata %class.btTransform* %this, i64 0, metadata !1452, metadata !896), !dbg !1453
  call void @llvm.dbg.value(metadata %class.btVector3* %x, i64 0, metadata !1454, metadata !896), !dbg !1455
  %3 = getelementptr inbounds %class.btTransform* %this, i32 0, i32 0, !dbg !1456
  %4 = call dereferenceable(16) %class.btVector3* @_ZNK11btMatrix3x3ixEi(%class.btMatrix3x3* %3, i32 0), !dbg !1456
  %5 = getelementptr inbounds %class.btTransform* %this, i32 0, i32 0, !dbg !1457
  %6 = call dereferenceable(16) %class.btVector3* @_ZNK11btMatrix3x3ixEi(%class.btMatrix3x3* %5, i32 1), !dbg !1457
  %7 = getelementptr inbounds %class.btTransform* %this, i32 0, i32 0, !dbg !1458
  %8 = call dereferenceable(16) %class.btVector3* @_ZNK11btMatrix3x3ixEi(%class.btMatrix3x3* %7, i32 2), !dbg !1458
  %9 = call { <2 x float>, <2 x float> } @_ZNK9btVector34dot3ERKS_S1_S1_(%class.btVector3* %x, %class.btVector3* dereferenceable(16) %4, %class.btVector3* dereferenceable(16) %6, %class.btVector3* dereferenceable(16) %8), !dbg !1459
  %10 = getelementptr %class.btVector3* %2, i32 0, i32 0, !dbg !1459
  %11 = bitcast [4 x float]* %10 to { <2 x float>, <2 x float> }*, !dbg !1459
  %12 = getelementptr { <2 x float>, <2 x float> }* %11, i32 0, i32 0, !dbg !1459
  %13 = extractvalue { <2 x float>, <2 x float> } %9, 0, !dbg !1459
  store <2 x float> %13, <2 x float>* %12, align 1, !dbg !1459
  %14 = getelementptr { <2 x float>, <2 x float> }* %11, i32 0, i32 1, !dbg !1459
  %15 = extractvalue { <2 x float>, <2 x float> } %9, 1, !dbg !1459
  store <2 x float> %15, <2 x float>* %14, align 1, !dbg !1459
  %16 = getelementptr inbounds %class.btTransform* %this, i32 0, i32 1, !dbg !1460
  %17 = call { <2 x float>, <2 x float> } @_ZplRK9btVector3S1_(%class.btVector3* dereferenceable(16) %2, %class.btVector3* dereferenceable(16) %16), !dbg !1460
  %18 = getelementptr %class.btVector3* %1, i32 0, i32 0, !dbg !1460
  %19 = bitcast [4 x float]* %18 to { <2 x float>, <2 x float> }*, !dbg !1460
  %20 = getelementptr { <2 x float>, <2 x float> }* %19, i32 0, i32 0, !dbg !1460
  %21 = extractvalue { <2 x float>, <2 x float> } %17, 0, !dbg !1460
  store <2 x float> %21, <2 x float>* %20, align 1, !dbg !1460
  %22 = getelementptr { <2 x float>, <2 x float> }* %19, i32 0, i32 1, !dbg !1460
  %23 = extractvalue { <2 x float>, <2 x float> } %17, 1, !dbg !1460
  store <2 x float> %23, <2 x float>* %22, align 1, !dbg !1460
  %24 = getelementptr %class.btVector3* %1, i32 0, i32 0, !dbg !1461
  %25 = bitcast [4 x float]* %24 to { <2 x float>, <2 x float> }*, !dbg !1461
  %26 = load { <2 x float>, <2 x float> }* %25, align 1, !dbg !1461
  ret { <2 x float>, <2 x float> } %26, !dbg !1461
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr float* @_ZN9btVector3cvPfEv(%class.btVector3* %this) #2 align 2 {
  call void @llvm.dbg.value(metadata %class.btVector3* %this, i64 0, metadata !1462, metadata !896), !dbg !1463
  %1 = getelementptr inbounds %class.btVector3* %this, i32 0, i32 0, !dbg !1464
  %2 = getelementptr inbounds [4 x float]* %1, i32 0, i64 0, !dbg !1464
  ret float* %2, !dbg !1465
}

; Function Attrs: inlinehint uwtable
define linkonce_odr { <2 x float>, <2 x float> } @_ZmiRK9btVector3S1_(%class.btVector3* dereferenceable(16) %v1, %class.btVector3* dereferenceable(16) %v2) #5 {
  %1 = alloca %class.btVector3, align 4
  %2 = alloca float, align 4
  %3 = alloca float, align 4
  %4 = alloca float, align 4
  call void @llvm.dbg.value(metadata %class.btVector3* %v1, i64 0, metadata !1466, metadata !896), !dbg !1467
  call void @llvm.dbg.value(metadata %class.btVector3* %v2, i64 0, metadata !1468, metadata !896), !dbg !1469
  %5 = getelementptr inbounds %class.btVector3* %v1, i32 0, i32 0, !dbg !1470
  %6 = getelementptr inbounds [4 x float]* %5, i32 0, i64 0, !dbg !1470
  %7 = load float* %6, align 4, !dbg !1470
  %8 = getelementptr inbounds %class.btVector3* %v2, i32 0, i32 0, !dbg !1471
  %9 = getelementptr inbounds [4 x float]* %8, i32 0, i64 0, !dbg !1471
  %10 = load float* %9, align 4, !dbg !1471
  %11 = fsub float %7, %10, !dbg !1470
  store float %11, float* %2, !dbg !1472
  %12 = getelementptr inbounds %class.btVector3* %v1, i32 0, i32 0, !dbg !1473
  %13 = getelementptr inbounds [4 x float]* %12, i32 0, i64 1, !dbg !1473
  %14 = load float* %13, align 4, !dbg !1473
  %15 = getelementptr inbounds %class.btVector3* %v2, i32 0, i32 0, !dbg !1474
  %16 = getelementptr inbounds [4 x float]* %15, i32 0, i64 1, !dbg !1474
  %17 = load float* %16, align 4, !dbg !1474
  %18 = fsub float %14, %17, !dbg !1473
  store float %18, float* %3, !dbg !1472
  %19 = getelementptr inbounds %class.btVector3* %v1, i32 0, i32 0, !dbg !1475
  %20 = getelementptr inbounds [4 x float]* %19, i32 0, i64 2, !dbg !1475
  %21 = load float* %20, align 4, !dbg !1475
  %22 = getelementptr inbounds %class.btVector3* %v2, i32 0, i32 0, !dbg !1476
  %23 = getelementptr inbounds [4 x float]* %22, i32 0, i64 2, !dbg !1476
  %24 = load float* %23, align 4, !dbg !1476
  %25 = fsub float %21, %24, !dbg !1475
  store float %25, float* %4, !dbg !1472
  call void @_ZN9btVector3C2ERKfS1_S1_(%class.btVector3* %1, float* dereferenceable(4) %2, float* dereferenceable(4) %3, float* dereferenceable(4) %4), !dbg !1472
  %26 = getelementptr %class.btVector3* %1, i32 0, i32 0, !dbg !1472
  %27 = bitcast [4 x float]* %26 to { <2 x float>, <2 x float> }*, !dbg !1472
  %28 = load { <2 x float>, <2 x float> }* %27, align 1, !dbg !1472
  ret { <2 x float>, <2 x float> } %28, !dbg !1472
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr float @_ZNK9btVector33dotERKS_(%class.btVector3* %this, %class.btVector3* dereferenceable(16) %v) #2 align 2 {
  call void @llvm.dbg.value(metadata %class.btVector3* %this, i64 0, metadata !1477, metadata !896), !dbg !1478
  call void @llvm.dbg.value(metadata %class.btVector3* %v, i64 0, metadata !1479, metadata !896), !dbg !1480
  %1 = getelementptr inbounds %class.btVector3* %this, i32 0, i32 0, !dbg !1481
  %2 = getelementptr inbounds [4 x float]* %1, i32 0, i64 0, !dbg !1481
  %3 = load float* %2, align 4, !dbg !1481
  %4 = getelementptr inbounds %class.btVector3* %v, i32 0, i32 0, !dbg !1482
  %5 = getelementptr inbounds [4 x float]* %4, i32 0, i64 0, !dbg !1482
  %6 = load float* %5, align 4, !dbg !1482
  %7 = fmul float %3, %6, !dbg !1481
  %8 = getelementptr inbounds %class.btVector3* %this, i32 0, i32 0, !dbg !1483
  %9 = getelementptr inbounds [4 x float]* %8, i32 0, i64 1, !dbg !1483
  %10 = load float* %9, align 4, !dbg !1483
  %11 = getelementptr inbounds %class.btVector3* %v, i32 0, i32 0, !dbg !1484
  %12 = getelementptr inbounds [4 x float]* %11, i32 0, i64 1, !dbg !1484
  %13 = load float* %12, align 4, !dbg !1484
  %14 = fmul float %10, %13, !dbg !1483
  %15 = fadd float %7, %14, !dbg !1481
  %16 = getelementptr inbounds %class.btVector3* %this, i32 0, i32 0, !dbg !1485
  %17 = getelementptr inbounds [4 x float]* %16, i32 0, i64 2, !dbg !1485
  %18 = load float* %17, align 4, !dbg !1485
  %19 = getelementptr inbounds %class.btVector3* %v, i32 0, i32 0, !dbg !1486
  %20 = getelementptr inbounds [4 x float]* %19, i32 0, i64 2, !dbg !1486
  %21 = load float* %20, align 4, !dbg !1486
  %22 = fmul float %18, %21, !dbg !1485
  %23 = fadd float %15, %22, !dbg !1481
  ret float %23, !dbg !1487
}

declare zeroext i1 @_ZN22btVoronoiSimplexSolver9inSimplexERK9btVector3(%class.btVoronoiSimplexSolver*, %class.btVector3* dereferenceable(16)) #6

declare void @_ZN22btVoronoiSimplexSolver9addVertexERK9btVector3S2_S2_(%class.btVoronoiSimplexSolver*, %class.btVector3* dereferenceable(16), %class.btVector3* dereferenceable(16), %class.btVector3* dereferenceable(16)) #6

declare zeroext i1 @_ZN22btVoronoiSimplexSolver7closestER9btVector3(%class.btVoronoiSimplexSolver*, %class.btVector3* dereferenceable(16)) #6

; Function Attrs: inlinehint uwtable
define linkonce_odr float @_ZNK9btVector37length2Ev(%class.btVector3* %this) #5 align 2 {
  call void @llvm.dbg.value(metadata %class.btVector3* %this, i64 0, metadata !1488, metadata !896), !dbg !1489
  %1 = call float @_ZNK9btVector33dotERKS_(%class.btVector3* %this, %class.btVector3* dereferenceable(16) %this), !dbg !1490
  ret float %1, !dbg !1491
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #7

; Function Attrs: nounwind uwtable
define linkonce_odr zeroext i1 @_ZNK22btVoronoiSimplexSolver11fullSimplexEv(%class.btVoronoiSimplexSolver* %this) #3 align 2 {
  call void @llvm.dbg.value(metadata %class.btVoronoiSimplexSolver* %this, i64 0, metadata !1492, metadata !896), !dbg !1494
  %1 = getelementptr inbounds %class.btVoronoiSimplexSolver* %this, i32 0, i32 0, !dbg !1495
  %2 = load i32* %1, align 4, !dbg !1495
  %3 = icmp eq i32 %2, 4, !dbg !1495
  ret i1 %3, !dbg !1496
}

declare void @_ZN22btVoronoiSimplexSolver14compute_pointsER9btVector3S1_(%class.btVoronoiSimplexSolver*, %class.btVector3* dereferenceable(16), %class.btVector3* dereferenceable(16)) #6

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr float @_Z6btSqrtf(float %y) #2 {
  call void @llvm.dbg.value(metadata float %y, i64 0, metadata !1497, metadata !896), !dbg !1498
  %1 = call float @sqrtf(float %y) #7, !dbg !1499
  ret float %1, !dbg !1500
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dereferenceable(16) %class.btVector3* @_ZN9btVector3mLERKf(%class.btVector3* %this, float* dereferenceable(4) %s) #2 align 2 {
  call void @llvm.dbg.value(metadata %class.btVector3* %this, i64 0, metadata !1501, metadata !896), !dbg !1502
  call void @llvm.dbg.value(metadata float* %s, i64 0, metadata !1503, metadata !896), !dbg !1504
  %1 = load float* %s, align 4, !dbg !1505
  %2 = getelementptr inbounds %class.btVector3* %this, i32 0, i32 0, !dbg !1506
  %3 = getelementptr inbounds [4 x float]* %2, i32 0, i64 0, !dbg !1506
  %4 = load float* %3, align 4, !dbg !1506
  %5 = fmul float %4, %1, !dbg !1506
  store float %5, float* %3, align 4, !dbg !1506
  %6 = load float* %s, align 4, !dbg !1507
  %7 = getelementptr inbounds %class.btVector3* %this, i32 0, i32 0, !dbg !1508
  %8 = getelementptr inbounds [4 x float]* %7, i32 0, i64 1, !dbg !1508
  %9 = load float* %8, align 4, !dbg !1508
  %10 = fmul float %9, %6, !dbg !1508
  store float %10, float* %8, align 4, !dbg !1508
  %11 = load float* %s, align 4, !dbg !1509
  %12 = getelementptr inbounds %class.btVector3* %this, i32 0, i32 0, !dbg !1510
  %13 = getelementptr inbounds [4 x float]* %12, i32 0, i64 2, !dbg !1510
  %14 = load float* %13, align 4, !dbg !1510
  %15 = fmul float %14, %11, !dbg !1510
  store float %15, float* %13, align 4, !dbg !1510
  ret %class.btVector3* %this, !dbg !1511
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dereferenceable(16) %class.btVector3* @_ZN9btVector3pLERKS_(%class.btVector3* %this, %class.btVector3* dereferenceable(16) %v) #2 align 2 {
  call void @llvm.dbg.value(metadata %class.btVector3* %this, i64 0, metadata !1512, metadata !896), !dbg !1513
  call void @llvm.dbg.value(metadata %class.btVector3* %v, i64 0, metadata !1514, metadata !896), !dbg !1515
  %1 = getelementptr inbounds %class.btVector3* %v, i32 0, i32 0, !dbg !1516
  %2 = getelementptr inbounds [4 x float]* %1, i32 0, i64 0, !dbg !1516
  %3 = load float* %2, align 4, !dbg !1516
  %4 = getelementptr inbounds %class.btVector3* %this, i32 0, i32 0, !dbg !1517
  %5 = getelementptr inbounds [4 x float]* %4, i32 0, i64 0, !dbg !1517
  %6 = load float* %5, align 4, !dbg !1517
  %7 = fadd float %6, %3, !dbg !1517
  store float %7, float* %5, align 4, !dbg !1517
  %8 = getelementptr inbounds %class.btVector3* %v, i32 0, i32 0, !dbg !1518
  %9 = getelementptr inbounds [4 x float]* %8, i32 0, i64 1, !dbg !1518
  %10 = load float* %9, align 4, !dbg !1518
  %11 = getelementptr inbounds %class.btVector3* %this, i32 0, i32 0, !dbg !1519
  %12 = getelementptr inbounds [4 x float]* %11, i32 0, i64 1, !dbg !1519
  %13 = load float* %12, align 4, !dbg !1519
  %14 = fadd float %13, %10, !dbg !1519
  store float %14, float* %12, align 4, !dbg !1519
  %15 = getelementptr inbounds %class.btVector3* %v, i32 0, i32 0, !dbg !1520
  %16 = getelementptr inbounds [4 x float]* %15, i32 0, i64 2, !dbg !1520
  %17 = load float* %16, align 4, !dbg !1520
  %18 = getelementptr inbounds %class.btVector3* %this, i32 0, i32 0, !dbg !1521
  %19 = getelementptr inbounds [4 x float]* %18, i32 0, i64 2, !dbg !1521
  %20 = load float* %19, align 4, !dbg !1521
  %21 = fadd float %20, %17, !dbg !1521
  store float %21, float* %19, align 4, !dbg !1521
  ret %class.btVector3* %this, !dbg !1522
}

; Function Attrs: uwtable
define linkonce_odr void @_ZN9btVector37setZeroEv(%class.btVector3* %this) #0 align 2 {
  %1 = alloca float, align 4
  %2 = alloca float, align 4
  %3 = alloca float, align 4
  call void @llvm.dbg.value(metadata %class.btVector3* %this, i64 0, metadata !1523, metadata !896), !dbg !1524
  store float 0.000000e+00, float* %1, !dbg !1525
  store float 0.000000e+00, float* %2, !dbg !1525
  store float 0.000000e+00, float* %3, !dbg !1525
  call void @_ZN9btVector38setValueERKfS1_S1_(%class.btVector3* %this, float* dereferenceable(4) %1, float* dereferenceable(4) %2, float* dereferenceable(4) %3), !dbg !1525
  ret void, !dbg !1526
}

; Function Attrs: inlinehint uwtable
define linkonce_odr dereferenceable(16) %class.btVector3* @_ZN9btVector3dVERKf(%class.btVector3* %this, float* dereferenceable(4) %s) #5 align 2 {
  %1 = alloca float, align 4
  call void @llvm.dbg.value(metadata %class.btVector3* %this, i64 0, metadata !1527, metadata !896), !dbg !1528
  call void @llvm.dbg.value(metadata float* %s, i64 0, metadata !1529, metadata !896), !dbg !1530
  %2 = load float* %s, align 4, !dbg !1531
  %3 = fdiv float 1.000000e+00, %2, !dbg !1532
  store float %3, float* %1, !dbg !1533
  %4 = call dereferenceable(16) %class.btVector3* @_ZN9btVector3mLERKf(%class.btVector3* %this, float* dereferenceable(4) %1), !dbg !1534
  ret %class.btVector3* %4, !dbg !1535
}

; Function Attrs: inlinehint uwtable
define linkonce_odr float @_ZNK9btVector36lengthEv(%class.btVector3* %this) #5 align 2 {
  call void @llvm.dbg.value(metadata %class.btVector3* %this, i64 0, metadata !1536, metadata !896), !dbg !1537
  %1 = call float @_ZNK9btVector37length2Ev(%class.btVector3* %this), !dbg !1538
  %2 = call float @_Z6btSqrtf(float %1), !dbg !1539
  ret float %2, !dbg !1540
}

; Function Attrs: inlinehint uwtable
define linkonce_odr dereferenceable(16) %class.btVector3* @_ZN9btVector39normalizeEv(%class.btVector3* %this) #5 align 2 {
  %1 = alloca float, align 4
  call void @llvm.dbg.value(metadata %class.btVector3* %this, i64 0, metadata !1541, metadata !896), !dbg !1542
  %2 = call float @_ZNK9btVector36lengthEv(%class.btVector3* %this), !dbg !1543
  store float %2, float* %1, !dbg !1544
  %3 = call dereferenceable(16) %class.btVector3* @_ZN9btVector3dVERKf(%class.btVector3* %this, float* dereferenceable(4) %1), !dbg !1545
  ret %class.btVector3* %3, !dbg !1546
}

; Function Attrs: uwtable
define linkonce_odr void @_ZN17btGjkPairDetectorD2Ev(%class.btGjkPairDetector* %this) unnamed_addr #0 align 2 {
  call void @llvm.dbg.value(metadata %class.btGjkPairDetector* %this, i64 0, metadata !1547, metadata !896), !dbg !1548
  %1 = bitcast %class.btGjkPairDetector* %this to %struct.btDiscreteCollisionDetectorInterface*, !dbg !1549
  call void @_ZN36btDiscreteCollisionDetectorInterfaceD2Ev(%struct.btDiscreteCollisionDetectorInterface* %1), !dbg !1549
  ret void, !dbg !1551
}

; Function Attrs: uwtable
define linkonce_odr void @_ZN17btGjkPairDetectorD0Ev(%class.btGjkPairDetector* %this) unnamed_addr #0 align 2 {
  call void @llvm.dbg.value(metadata %class.btGjkPairDetector* %this, i64 0, metadata !1552, metadata !896), !dbg !1553
  invoke void @_ZN17btGjkPairDetectorD2Ev(%class.btGjkPairDetector* %this)
          to label %1 unwind label %3, !dbg !1554

; <label>:1                                       ; preds = %0
  %2 = bitcast %class.btGjkPairDetector* %this to i8*, !dbg !1555
  call void @_ZdlPv(i8* %2) #11, !dbg !1555
  ret void, !dbg !1557

; <label>:3                                       ; preds = %0
  %4 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup, !dbg !1558
  %5 = extractvalue { i8*, i32 } %4, 0, !dbg !1558
  %6 = extractvalue { i8*, i32 } %4, 1, !dbg !1558
  %7 = bitcast %class.btGjkPairDetector* %this to i8*, !dbg !1558
  call void @_ZdlPv(i8* %7) #11, !dbg !1558
  br label %8, !dbg !1558

; <label>:8                                       ; preds = %3
  %9 = insertvalue { i8*, i32 } undef, i8* %5, 0, !dbg !1560
  %10 = insertvalue { i8*, i32 } %9, i32 %6, 1, !dbg !1560
  resume { i8*, i32 } %10, !dbg !1560
}

; Function Attrs: nobuiltin nounwind
declare void @_ZdlPv(i8*) #8

; Function Attrs: nounwind
declare float @sqrtf(float) #9

; Function Attrs: inlinehint uwtable
define linkonce_odr { <2 x float>, <2 x float> } @_ZNK9btVector34dot3ERKS_S1_S1_(%class.btVector3* %this, %class.btVector3* dereferenceable(16) %v0, %class.btVector3* dereferenceable(16) %v1, %class.btVector3* dereferenceable(16) %v2) #5 align 2 {
  %1 = alloca %class.btVector3, align 4
  %2 = alloca float, align 4
  %3 = alloca float, align 4
  %4 = alloca float, align 4
  call void @llvm.dbg.value(metadata %class.btVector3* %this, i64 0, metadata !1562, metadata !896), !dbg !1563
  call void @llvm.dbg.value(metadata %class.btVector3* %v0, i64 0, metadata !1564, metadata !896), !dbg !1565
  call void @llvm.dbg.value(metadata %class.btVector3* %v1, i64 0, metadata !1566, metadata !896), !dbg !1567
  call void @llvm.dbg.value(metadata %class.btVector3* %v2, i64 0, metadata !1568, metadata !896), !dbg !1569
  %5 = call float @_ZNK9btVector33dotERKS_(%class.btVector3* %this, %class.btVector3* dereferenceable(16) %v0), !dbg !1570
  store float %5, float* %2, !dbg !1571
  %6 = call float @_ZNK9btVector33dotERKS_(%class.btVector3* %this, %class.btVector3* dereferenceable(16) %v1), !dbg !1572
  store float %6, float* %3, !dbg !1571
  %7 = call float @_ZNK9btVector33dotERKS_(%class.btVector3* %this, %class.btVector3* dereferenceable(16) %v2), !dbg !1573
  store float %7, float* %4, !dbg !1571
  call void @_ZN9btVector3C2ERKfS1_S1_(%class.btVector3* %1, float* dereferenceable(4) %2, float* dereferenceable(4) %3, float* dereferenceable(4) %4), !dbg !1571
  %8 = getelementptr %class.btVector3* %1, i32 0, i32 0, !dbg !1571
  %9 = bitcast [4 x float]* %8 to { <2 x float>, <2 x float> }*, !dbg !1571
  %10 = load { <2 x float>, <2 x float> }* %9, align 1, !dbg !1571
  ret { <2 x float>, <2 x float> } %10, !dbg !1571
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dereferenceable(16) %class.btVector3* @_ZNK11btMatrix3x3ixEi(%class.btMatrix3x3* %this, i32 %i) #2 align 2 {
  call void @llvm.dbg.value(metadata %class.btMatrix3x3* %this, i64 0, metadata !1574, metadata !896), !dbg !1576
  call void @llvm.dbg.value(metadata i32 %i, i64 0, metadata !1577, metadata !896), !dbg !1578
  %1 = sext i32 %i to i64, !dbg !1579
  %2 = getelementptr inbounds %class.btMatrix3x3* %this, i32 0, i32 0, !dbg !1579
  %3 = getelementptr inbounds [3 x %class.btVector3]* %2, i32 0, i64 %1, !dbg !1579
  ret %class.btVector3* %3, !dbg !1579
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr float @_ZNK11btMatrix3x35tdotxERK9btVector3(%class.btMatrix3x3* %this, %class.btVector3* dereferenceable(16) %v) #2 align 2 {
  call void @llvm.dbg.value(metadata %class.btMatrix3x3* %this, i64 0, metadata !1580, metadata !896), !dbg !1581
  call void @llvm.dbg.value(metadata %class.btVector3* %v, i64 0, metadata !1582, metadata !896), !dbg !1583
  %1 = getelementptr inbounds %class.btMatrix3x3* %this, i32 0, i32 0, !dbg !1584
  %2 = getelementptr inbounds [3 x %class.btVector3]* %1, i32 0, i64 0, !dbg !1584
  %3 = call dereferenceable(4) float* @_ZNK9btVector31xEv(%class.btVector3* %2), !dbg !1584
  %4 = load float* %3, !dbg !1584
  %5 = call dereferenceable(4) float* @_ZNK9btVector31xEv(%class.btVector3* %v), !dbg !1585
  %6 = load float* %5, !dbg !1585
  %7 = fmul float %4, %6, !dbg !1584
  %8 = getelementptr inbounds %class.btMatrix3x3* %this, i32 0, i32 0, !dbg !1586
  %9 = getelementptr inbounds [3 x %class.btVector3]* %8, i32 0, i64 1, !dbg !1586
  %10 = call dereferenceable(4) float* @_ZNK9btVector31xEv(%class.btVector3* %9), !dbg !1586
  %11 = load float* %10, !dbg !1586
  %12 = call dereferenceable(4) float* @_ZNK9btVector31yEv(%class.btVector3* %v), !dbg !1587
  %13 = load float* %12, !dbg !1587
  %14 = fmul float %11, %13, !dbg !1586
  %15 = fadd float %7, %14, !dbg !1584
  %16 = getelementptr inbounds %class.btMatrix3x3* %this, i32 0, i32 0, !dbg !1588
  %17 = getelementptr inbounds [3 x %class.btVector3]* %16, i32 0, i64 2, !dbg !1588
  %18 = call dereferenceable(4) float* @_ZNK9btVector31xEv(%class.btVector3* %17), !dbg !1588
  %19 = load float* %18, !dbg !1588
  %20 = call dereferenceable(4) float* @_ZNK9btVector31zEv(%class.btVector3* %v), !dbg !1589
  %21 = load float* %20, !dbg !1589
  %22 = fmul float %19, %21, !dbg !1588
  %23 = fadd float %15, %22, !dbg !1584
  ret float %23, !dbg !1590
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr float @_ZNK11btMatrix3x35tdotyERK9btVector3(%class.btMatrix3x3* %this, %class.btVector3* dereferenceable(16) %v) #2 align 2 {
  call void @llvm.dbg.value(metadata %class.btMatrix3x3* %this, i64 0, metadata !1591, metadata !896), !dbg !1592
  call void @llvm.dbg.value(metadata %class.btVector3* %v, i64 0, metadata !1593, metadata !896), !dbg !1594
  %1 = getelementptr inbounds %class.btMatrix3x3* %this, i32 0, i32 0, !dbg !1595
  %2 = getelementptr inbounds [3 x %class.btVector3]* %1, i32 0, i64 0, !dbg !1595
  %3 = call dereferenceable(4) float* @_ZNK9btVector31yEv(%class.btVector3* %2), !dbg !1595
  %4 = load float* %3, !dbg !1595
  %5 = call dereferenceable(4) float* @_ZNK9btVector31xEv(%class.btVector3* %v), !dbg !1596
  %6 = load float* %5, !dbg !1596
  %7 = fmul float %4, %6, !dbg !1595
  %8 = getelementptr inbounds %class.btMatrix3x3* %this, i32 0, i32 0, !dbg !1597
  %9 = getelementptr inbounds [3 x %class.btVector3]* %8, i32 0, i64 1, !dbg !1597
  %10 = call dereferenceable(4) float* @_ZNK9btVector31yEv(%class.btVector3* %9), !dbg !1597
  %11 = load float* %10, !dbg !1597
  %12 = call dereferenceable(4) float* @_ZNK9btVector31yEv(%class.btVector3* %v), !dbg !1598
  %13 = load float* %12, !dbg !1598
  %14 = fmul float %11, %13, !dbg !1597
  %15 = fadd float %7, %14, !dbg !1595
  %16 = getelementptr inbounds %class.btMatrix3x3* %this, i32 0, i32 0, !dbg !1599
  %17 = getelementptr inbounds [3 x %class.btVector3]* %16, i32 0, i64 2, !dbg !1599
  %18 = call dereferenceable(4) float* @_ZNK9btVector31yEv(%class.btVector3* %17), !dbg !1599
  %19 = load float* %18, !dbg !1599
  %20 = call dereferenceable(4) float* @_ZNK9btVector31zEv(%class.btVector3* %v), !dbg !1600
  %21 = load float* %20, !dbg !1600
  %22 = fmul float %19, %21, !dbg !1599
  %23 = fadd float %15, %22, !dbg !1595
  ret float %23, !dbg !1601
}

; Function Attrs: inlinehint uwtable
define linkonce_odr float @_ZNK11btMatrix3x35tdotzERK9btVector3(%class.btMatrix3x3* %this, %class.btVector3* dereferenceable(16) %v) #5 align 2 {
  call void @llvm.dbg.value(metadata %class.btMatrix3x3* %this, i64 0, metadata !1602, metadata !896), !dbg !1603
  call void @llvm.dbg.value(metadata %class.btVector3* %v, i64 0, metadata !1604, metadata !896), !dbg !1605
  %1 = getelementptr inbounds %class.btMatrix3x3* %this, i32 0, i32 0, !dbg !1606
  %2 = getelementptr inbounds [3 x %class.btVector3]* %1, i32 0, i64 0, !dbg !1606
  %3 = call dereferenceable(4) float* @_ZNK9btVector31zEv(%class.btVector3* %2), !dbg !1606
  %4 = load float* %3, !dbg !1606
  %5 = call dereferenceable(4) float* @_ZNK9btVector31xEv(%class.btVector3* %v), !dbg !1607
  %6 = load float* %5, !dbg !1607
  %7 = fmul float %4, %6, !dbg !1606
  %8 = getelementptr inbounds %class.btMatrix3x3* %this, i32 0, i32 0, !dbg !1608
  %9 = getelementptr inbounds [3 x %class.btVector3]* %8, i32 0, i64 1, !dbg !1608
  %10 = call dereferenceable(4) float* @_ZNK9btVector31zEv(%class.btVector3* %9), !dbg !1608
  %11 = load float* %10, !dbg !1608
  %12 = call dereferenceable(4) float* @_ZNK9btVector31yEv(%class.btVector3* %v), !dbg !1609
  %13 = load float* %12, !dbg !1609
  %14 = fmul float %11, %13, !dbg !1608
  %15 = fadd float %7, %14, !dbg !1606
  %16 = getelementptr inbounds %class.btMatrix3x3* %this, i32 0, i32 0, !dbg !1610
  %17 = getelementptr inbounds [3 x %class.btVector3]* %16, i32 0, i64 2, !dbg !1610
  %18 = call dereferenceable(4) float* @_ZNK9btVector31zEv(%class.btVector3* %17), !dbg !1610
  %19 = load float* %18, !dbg !1610
  %20 = call dereferenceable(4) float* @_ZNK9btVector31zEv(%class.btVector3* %v), !dbg !1611
  %21 = load float* %20, !dbg !1611
  %22 = fmul float %19, %21, !dbg !1610
  %23 = fadd float %15, %22, !dbg !1606
  ret float %23, !dbg !1612
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dereferenceable(4) float* @_ZNK9btVector31zEv(%class.btVector3* %this) #2 align 2 {
  call void @llvm.dbg.value(metadata %class.btVector3* %this, i64 0, metadata !1613, metadata !896), !dbg !1614
  %1 = getelementptr inbounds %class.btVector3* %this, i32 0, i32 0, !dbg !1615
  %2 = getelementptr inbounds [4 x float]* %1, i32 0, i64 2, !dbg !1615
  ret float* %2, !dbg !1615
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dereferenceable(4) float* @_ZNK9btVector31xEv(%class.btVector3* %this) #2 align 2 {
  call void @llvm.dbg.value(metadata %class.btVector3* %this, i64 0, metadata !1616, metadata !896), !dbg !1617
  %1 = getelementptr inbounds %class.btVector3* %this, i32 0, i32 0, !dbg !1618
  %2 = getelementptr inbounds [4 x float]* %1, i32 0, i64 0, !dbg !1618
  ret float* %2, !dbg !1618
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dereferenceable(4) float* @_ZNK9btVector31yEv(%class.btVector3* %this) #2 align 2 {
  call void @llvm.dbg.value(metadata %class.btVector3* %this, i64 0, metadata !1619, metadata !896), !dbg !1620
  %1 = getelementptr inbounds %class.btVector3* %this, i32 0, i32 0, !dbg !1621
  %2 = getelementptr inbounds [4 x float]* %1, i32 0, i64 1, !dbg !1621
  ret float* %2, !dbg !1621
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr zeroext i1 @_ZN17btBroadphaseProxy10isConvex2dEi(i32 %proxyType) #2 align 2 {
  call void @llvm.dbg.value(metadata i32 %proxyType, i64 0, metadata !1622, metadata !896), !dbg !1624
  %1 = icmp eq i32 %proxyType, 17, !dbg !1625
  br i1 %1, label %4, label %2, !dbg !1626

; <label>:2                                       ; preds = %0
  %3 = icmp eq i32 %proxyType, 18, !dbg !1627
  br label %4, !dbg !1626

; <label>:4                                       ; preds = %2, %0
  %5 = phi i1 [ true, %0 ], [ %3, %2 ]
  ret i1 %5, !dbg !1629
}

; Function Attrs: inlinehint uwtable
define linkonce_odr void @_ZN11btMatrix3x3C2ERKS_(%class.btMatrix3x3* %this, %class.btMatrix3x3* dereferenceable(48) %other) unnamed_addr #5 align 2 {
  call void @llvm.dbg.value(metadata %class.btMatrix3x3* %this, i64 0, metadata !1632, metadata !896), !dbg !1634
  call void @llvm.dbg.value(metadata %class.btMatrix3x3* %other, i64 0, metadata !1635, metadata !896), !dbg !1636
  %1 = getelementptr inbounds %class.btMatrix3x3* %this, i32 0, i32 0, !dbg !1637
  %2 = getelementptr inbounds [3 x %class.btVector3]* %1, i32 0, i32 0, !dbg !1637
  %3 = getelementptr inbounds %class.btVector3* %2, i64 3, !dbg !1637
  br label %4, !dbg !1637

; <label>:4                                       ; preds = %4, %0
  %5 = phi %class.btVector3* [ %2, %0 ], [ %6, %4 ], !dbg !1637
  call void @_ZN9btVector3C2Ev(%class.btVector3* %5), !dbg !1638
  %6 = getelementptr inbounds %class.btVector3* %5, i64 1, !dbg !1638
  %7 = icmp eq %class.btVector3* %6, %3, !dbg !1638
  br i1 %7, label %8, label %4, !dbg !1638

; <label>:8                                       ; preds = %4
  %9 = getelementptr inbounds %class.btMatrix3x3* %this, i32 0, i32 0, !dbg !1641
  %10 = getelementptr inbounds [3 x %class.btVector3]* %9, i32 0, i64 0, !dbg !1641
  %11 = getelementptr inbounds %class.btMatrix3x3* %other, i32 0, i32 0, !dbg !1641
  %12 = getelementptr inbounds [3 x %class.btVector3]* %11, i32 0, i64 0, !dbg !1641
  %13 = bitcast %class.btVector3* %10 to i8*, !dbg !1641
  %14 = bitcast %class.btVector3* %12 to i8*, !dbg !1641
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %13, i8* %14, i64 16, i32 4, i1 false), !dbg !1641
  %15 = getelementptr inbounds %class.btMatrix3x3* %this, i32 0, i32 0, !dbg !1643
  %16 = getelementptr inbounds [3 x %class.btVector3]* %15, i32 0, i64 1, !dbg !1643
  %17 = getelementptr inbounds %class.btMatrix3x3* %other, i32 0, i32 0, !dbg !1643
  %18 = getelementptr inbounds [3 x %class.btVector3]* %17, i32 0, i64 1, !dbg !1643
  %19 = bitcast %class.btVector3* %16 to i8*, !dbg !1643
  %20 = bitcast %class.btVector3* %18 to i8*, !dbg !1643
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %19, i8* %20, i64 16, i32 4, i1 false), !dbg !1643
  %21 = getelementptr inbounds %class.btMatrix3x3* %this, i32 0, i32 0, !dbg !1644
  %22 = getelementptr inbounds [3 x %class.btVector3]* %21, i32 0, i64 2, !dbg !1644
  %23 = getelementptr inbounds %class.btMatrix3x3* %other, i32 0, i32 0, !dbg !1644
  %24 = getelementptr inbounds [3 x %class.btVector3]* %23, i32 0, i64 2, !dbg !1644
  %25 = bitcast %class.btVector3* %22 to i8*, !dbg !1644
  %26 = bitcast %class.btVector3* %24 to i8*, !dbg !1644
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %25, i8* %26, i64 16, i32 4, i1 false), !dbg !1644
  ret void, !dbg !1645
}

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN36btDiscreteCollisionDetectorInterfaceD2Ev(%struct.btDiscreteCollisionDetectorInterface* %this) unnamed_addr #3 align 2 {
  call void @llvm.dbg.value(metadata %struct.btDiscreteCollisionDetectorInterface* %this, i64 0, metadata !1646, metadata !896), !dbg !1647
  ret void, !dbg !1648
}

; Function Attrs: uwtable
define linkonce_odr void @_ZN36btDiscreteCollisionDetectorInterfaceD0Ev(%struct.btDiscreteCollisionDetectorInterface* %this) unnamed_addr #0 align 2 {
  call void @llvm.dbg.value(metadata %struct.btDiscreteCollisionDetectorInterface* %this, i64 0, metadata !1649, metadata !896), !dbg !1650
  invoke void @_ZN36btDiscreteCollisionDetectorInterfaceD2Ev(%struct.btDiscreteCollisionDetectorInterface* %this)
          to label %1 unwind label %3, !dbg !1651

; <label>:1                                       ; preds = %0
  %2 = bitcast %struct.btDiscreteCollisionDetectorInterface* %this to i8*, !dbg !1652
  call void @_ZdlPv(i8* %2) #11, !dbg !1652
  ret void, !dbg !1654

; <label>:3                                       ; preds = %0
  %4 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup, !dbg !1655
  %5 = extractvalue { i8*, i32 } %4, 0, !dbg !1655
  %6 = extractvalue { i8*, i32 } %4, 1, !dbg !1655
  %7 = bitcast %struct.btDiscreteCollisionDetectorInterface* %this to i8*, !dbg !1655
  call void @_ZdlPv(i8* %7) #11, !dbg !1655
  br label %8, !dbg !1655

; <label>:8                                       ; preds = %3
  %9 = insertvalue { i8*, i32 } undef, i8* %5, 0, !dbg !1657
  %10 = insertvalue { i8*, i32 } %9, i32 %6, 1, !dbg !1657
  resume { i8*, i32 } %10, !dbg !1657
}

declare void @__cxa_pure_virtual()

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #1

attributes #0 = { uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { inlinehint nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noinline noreturn nounwind }
attributes #5 = { inlinehint uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind }
attributes #8 = { nobuiltin nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #9 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #10 = { noreturn nounwind }
attributes #11 = { builtin nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!891, !892}
!llvm.ident = !{!893}

!0 = !{!"0x11\004\00clang version 3.6.2 (tags/RELEASE_362/final)\000\00\000\00\001", !1, !2, !43, !818, !887, !820} ; [ DW_TAG_compile_unit ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp] [DW_LANG_C_plus_plus]
!1 = !{!"btGjkPairDetector.cpp", !"/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision"}
!2 = !{!3}
!3 = !{!"0x4\00BroadphaseNativeTypes\0028\0032\0032\000\000\000", !4, null, null, !5, null, null, !"_ZTS21BroadphaseNativeTypes"} ; [ DW_TAG_enumeration_type ] [BroadphaseNativeTypes] [line 28, size 32, align 32, offset 0] [def] [from ]
!4 = !{!"../../BulletCollision/BroadphaseCollision/btBroadphaseProxy.h", !"/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision"}
!5 = !{!6, !7, !8, !9, !10, !11, !12, !13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42}
!6 = !{!"0x28\00BOX_SHAPE_PROXYTYPE\000"}         ; [ DW_TAG_enumerator ] [BOX_SHAPE_PROXYTYPE :: 0]
!7 = !{!"0x28\00TRIANGLE_SHAPE_PROXYTYPE\001"}    ; [ DW_TAG_enumerator ] [TRIANGLE_SHAPE_PROXYTYPE :: 1]
!8 = !{!"0x28\00TETRAHEDRAL_SHAPE_PROXYTYPE\002"} ; [ DW_TAG_enumerator ] [TETRAHEDRAL_SHAPE_PROXYTYPE :: 2]
!9 = !{!"0x28\00CONVEX_TRIANGLEMESH_SHAPE_PROXYTYPE\003"} ; [ DW_TAG_enumerator ] [CONVEX_TRIANGLEMESH_SHAPE_PROXYTYPE :: 3]
!10 = !{!"0x28\00CONVEX_HULL_SHAPE_PROXYTYPE\004"} ; [ DW_TAG_enumerator ] [CONVEX_HULL_SHAPE_PROXYTYPE :: 4]
!11 = !{!"0x28\00CONVEX_POINT_CLOUD_SHAPE_PROXYTYPE\005"} ; [ DW_TAG_enumerator ] [CONVEX_POINT_CLOUD_SHAPE_PROXYTYPE :: 5]
!12 = !{!"0x28\00CUSTOM_POLYHEDRAL_SHAPE_TYPE\006"} ; [ DW_TAG_enumerator ] [CUSTOM_POLYHEDRAL_SHAPE_TYPE :: 6]
!13 = !{!"0x28\00IMPLICIT_CONVEX_SHAPES_START_HERE\007"} ; [ DW_TAG_enumerator ] [IMPLICIT_CONVEX_SHAPES_START_HERE :: 7]
!14 = !{!"0x28\00SPHERE_SHAPE_PROXYTYPE\008"}     ; [ DW_TAG_enumerator ] [SPHERE_SHAPE_PROXYTYPE :: 8]
!15 = !{!"0x28\00MULTI_SPHERE_SHAPE_PROXYTYPE\009"} ; [ DW_TAG_enumerator ] [MULTI_SPHERE_SHAPE_PROXYTYPE :: 9]
!16 = !{!"0x28\00CAPSULE_SHAPE_PROXYTYPE\0010"}   ; [ DW_TAG_enumerator ] [CAPSULE_SHAPE_PROXYTYPE :: 10]
!17 = !{!"0x28\00CONE_SHAPE_PROXYTYPE\0011"}      ; [ DW_TAG_enumerator ] [CONE_SHAPE_PROXYTYPE :: 11]
!18 = !{!"0x28\00CONVEX_SHAPE_PROXYTYPE\0012"}    ; [ DW_TAG_enumerator ] [CONVEX_SHAPE_PROXYTYPE :: 12]
!19 = !{!"0x28\00CYLINDER_SHAPE_PROXYTYPE\0013"}  ; [ DW_TAG_enumerator ] [CYLINDER_SHAPE_PROXYTYPE :: 13]
!20 = !{!"0x28\00UNIFORM_SCALING_SHAPE_PROXYTYPE\0014"} ; [ DW_TAG_enumerator ] [UNIFORM_SCALING_SHAPE_PROXYTYPE :: 14]
!21 = !{!"0x28\00MINKOWSKI_SUM_SHAPE_PROXYTYPE\0015"} ; [ DW_TAG_enumerator ] [MINKOWSKI_SUM_SHAPE_PROXYTYPE :: 15]
!22 = !{!"0x28\00MINKOWSKI_DIFFERENCE_SHAPE_PROXYTYPE\0016"} ; [ DW_TAG_enumerator ] [MINKOWSKI_DIFFERENCE_SHAPE_PROXYTYPE :: 16]
!23 = !{!"0x28\00BOX_2D_SHAPE_PROXYTYPE\0017"}    ; [ DW_TAG_enumerator ] [BOX_2D_SHAPE_PROXYTYPE :: 17]
!24 = !{!"0x28\00CONVEX_2D_SHAPE_PROXYTYPE\0018"} ; [ DW_TAG_enumerator ] [CONVEX_2D_SHAPE_PROXYTYPE :: 18]
!25 = !{!"0x28\00CUSTOM_CONVEX_SHAPE_TYPE\0019"}  ; [ DW_TAG_enumerator ] [CUSTOM_CONVEX_SHAPE_TYPE :: 19]
!26 = !{!"0x28\00CONCAVE_SHAPES_START_HERE\0020"} ; [ DW_TAG_enumerator ] [CONCAVE_SHAPES_START_HERE :: 20]
!27 = !{!"0x28\00TRIANGLE_MESH_SHAPE_PROXYTYPE\0021"} ; [ DW_TAG_enumerator ] [TRIANGLE_MESH_SHAPE_PROXYTYPE :: 21]
!28 = !{!"0x28\00SCALED_TRIANGLE_MESH_SHAPE_PROXYTYPE\0022"} ; [ DW_TAG_enumerator ] [SCALED_TRIANGLE_MESH_SHAPE_PROXYTYPE :: 22]
!29 = !{!"0x28\00FAST_CONCAVE_MESH_PROXYTYPE\0023"} ; [ DW_TAG_enumerator ] [FAST_CONCAVE_MESH_PROXYTYPE :: 23]
!30 = !{!"0x28\00TERRAIN_SHAPE_PROXYTYPE\0024"}   ; [ DW_TAG_enumerator ] [TERRAIN_SHAPE_PROXYTYPE :: 24]
!31 = !{!"0x28\00GIMPACT_SHAPE_PROXYTYPE\0025"}   ; [ DW_TAG_enumerator ] [GIMPACT_SHAPE_PROXYTYPE :: 25]
!32 = !{!"0x28\00MULTIMATERIAL_TRIANGLE_MESH_PROXYTYPE\0026"} ; [ DW_TAG_enumerator ] [MULTIMATERIAL_TRIANGLE_MESH_PROXYTYPE :: 26]
!33 = !{!"0x28\00EMPTY_SHAPE_PROXYTYPE\0027"}     ; [ DW_TAG_enumerator ] [EMPTY_SHAPE_PROXYTYPE :: 27]
!34 = !{!"0x28\00STATIC_PLANE_PROXYTYPE\0028"}    ; [ DW_TAG_enumerator ] [STATIC_PLANE_PROXYTYPE :: 28]
!35 = !{!"0x28\00CUSTOM_CONCAVE_SHAPE_TYPE\0029"} ; [ DW_TAG_enumerator ] [CUSTOM_CONCAVE_SHAPE_TYPE :: 29]
!36 = !{!"0x28\00CONCAVE_SHAPES_END_HERE\0030"}   ; [ DW_TAG_enumerator ] [CONCAVE_SHAPES_END_HERE :: 30]
!37 = !{!"0x28\00COMPOUND_SHAPE_PROXYTYPE\0031"}  ; [ DW_TAG_enumerator ] [COMPOUND_SHAPE_PROXYTYPE :: 31]
!38 = !{!"0x28\00SOFTBODY_SHAPE_PROXYTYPE\0032"}  ; [ DW_TAG_enumerator ] [SOFTBODY_SHAPE_PROXYTYPE :: 32]
!39 = !{!"0x28\00HFFLUID_SHAPE_PROXYTYPE\0033"}   ; [ DW_TAG_enumerator ] [HFFLUID_SHAPE_PROXYTYPE :: 33]
!40 = !{!"0x28\00HFFLUID_BUOYANT_CONVEX_SHAPE_PROXYTYPE\0034"} ; [ DW_TAG_enumerator ] [HFFLUID_BUOYANT_CONVEX_SHAPE_PROXYTYPE :: 34]
!41 = !{!"0x28\00INVALID_SHAPE_PROXYTYPE\0035"}   ; [ DW_TAG_enumerator ] [INVALID_SHAPE_PROXYTYPE :: 35]
!42 = !{!"0x28\00MAX_BROADPHASE_COLLISION_TYPES\0036"} ; [ DW_TAG_enumerator ] [MAX_BROADPHASE_COLLISION_TYPES :: 36]
!43 = !{!44, !115, !117, !219, !221, !237, !248, !249, null, !250, !352, !463, !601, !605, !610, !679, !727, !731, !735, !739, !743, !744, !760, !61, !776, !778, !3}
!44 = !{!"0x2\00btGjkPairDetector\0030\00768\0064\000\000\000", !45, null, null, !46, !"_ZTS36btDiscreteCollisionDetectorInterface", null, !"_ZTS17btGjkPairDetector"} ; [ DW_TAG_class_type ] [btGjkPairDetector] [line 30, size 768, align 64, offset 0] [def] [from ]
!45 = !{!"./btGjkPairDetector.h", !"/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision"}
!46 = !{!47, !48, !49, !51, !53, !56, !57, !59, !60, !64, !65, !67, !68, !69, !70, !71, !72, !76, !79, !82, !89, !92, !95, !96, !101, !106, !109, !112}
!47 = !{!"0x1c\00\000\000\000\000\003", null, !"_ZTS17btGjkPairDetector", !"_ZTS36btDiscreteCollisionDetectorInterface"} ; [ DW_TAG_inheritance ] [line 0, size 0, align 0, offset 0] [public] [from _ZTS36btDiscreteCollisionDetectorInterface]
!48 = !{!"0xd\00m_cachedSeparatingAxis\0034\00128\0032\0064\000", !45, !"_ZTS17btGjkPairDetector", !"_ZTS9btVector3"} ; [ DW_TAG_member ] [m_cachedSeparatingAxis] [line 34, size 128, align 32, offset 64] [from _ZTS9btVector3]
!49 = !{!"0xd\00m_penetrationDepthSolver\0035\0064\0064\00192\000", !45, !"_ZTS17btGjkPairDetector", !50} ; [ DW_TAG_member ] [m_penetrationDepthSolver] [line 35, size 64, align 64, offset 192] [from ]
!50 = !{!"0xf\00\000\0064\0064\000\000", null, null, !"_ZTS30btConvexPenetrationDepthSolver"} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _ZTS30btConvexPenetrationDepthSolver]
!51 = !{!"0xd\00m_simplexSolver\0036\0064\0064\00256\000", !45, !"_ZTS17btGjkPairDetector", !52} ; [ DW_TAG_member ] [m_simplexSolver] [line 36, size 64, align 64, offset 256] [from ]
!52 = !{!"0xf\00\000\0064\0064\000\000", null, null, !"_ZTS22btVoronoiSimplexSolver"} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _ZTS22btVoronoiSimplexSolver]
!53 = !{!"0xd\00m_minkowskiA\0037\0064\0064\00320\000", !45, !"_ZTS17btGjkPairDetector", !54} ; [ DW_TAG_member ] [m_minkowskiA] [line 37, size 64, align 64, offset 320] [from ]
!54 = !{!"0xf\00\000\0064\0064\000\000", null, null, !55} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!55 = !{!"0x26\00\000\000\000\000\000", null, null, !"_ZTS13btConvexShape"} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from _ZTS13btConvexShape]
!56 = !{!"0xd\00m_minkowskiB\0038\0064\0064\00384\000", !45, !"_ZTS17btGjkPairDetector", !54} ; [ DW_TAG_member ] [m_minkowskiB] [line 38, size 64, align 64, offset 384] [from ]
!57 = !{!"0xd\00m_shapeTypeA\0039\0032\0032\00448\000", !45, !"_ZTS17btGjkPairDetector", !58} ; [ DW_TAG_member ] [m_shapeTypeA] [line 39, size 32, align 32, offset 448] [from int]
!58 = !{!"0x24\00int\000\0032\0032\000\000\005", null, null} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!59 = !{!"0xd\00m_shapeTypeB\0040\0032\0032\00480\000", !45, !"_ZTS17btGjkPairDetector", !58} ; [ DW_TAG_member ] [m_shapeTypeB] [line 40, size 32, align 32, offset 480] [from int]
!60 = !{!"0xd\00m_marginA\0041\0032\0032\00512\000", !45, !"_ZTS17btGjkPairDetector", !61} ; [ DW_TAG_member ] [m_marginA] [line 41, size 32, align 32, offset 512] [from btScalar]
!61 = !{!"0x16\00btScalar\00259\000\000\000\000", !62, null, !63} ; [ DW_TAG_typedef ] [btScalar] [line 259, size 0, align 0, offset 0] [from float]
!62 = !{!"../../LinearMath/btScalar.h", !"/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision"}
!63 = !{!"0x24\00float\000\0032\0032\000\000\004", null, null} ; [ DW_TAG_base_type ] [float] [line 0, size 32, align 32, offset 0, enc DW_ATE_float]
!64 = !{!"0xd\00m_marginB\0042\0032\0032\00544\000", !45, !"_ZTS17btGjkPairDetector", !61} ; [ DW_TAG_member ] [m_marginB] [line 42, size 32, align 32, offset 544] [from btScalar]
!65 = !{!"0xd\00m_ignoreMargin\0044\008\008\00576\000", !45, !"_ZTS17btGjkPairDetector", !66} ; [ DW_TAG_member ] [m_ignoreMargin] [line 44, size 8, align 8, offset 576] [from bool]
!66 = !{!"0x24\00bool\000\008\008\000\000\002", null, null} ; [ DW_TAG_base_type ] [bool] [line 0, size 8, align 8, offset 0, enc DW_ATE_boolean]
!67 = !{!"0xd\00m_cachedSeparatingDistance\0045\0032\0032\00608\000", !45, !"_ZTS17btGjkPairDetector", !61} ; [ DW_TAG_member ] [m_cachedSeparatingDistance] [line 45, size 32, align 32, offset 608] [from btScalar]
!68 = !{!"0xd\00m_lastUsedMethod\0051\0032\0032\00640\003", !45, !"_ZTS17btGjkPairDetector", !58} ; [ DW_TAG_member ] [m_lastUsedMethod] [line 51, size 32, align 32, offset 640] [public] [from int]
!69 = !{!"0xd\00m_curIter\0052\0032\0032\00672\003", !45, !"_ZTS17btGjkPairDetector", !58} ; [ DW_TAG_member ] [m_curIter] [line 52, size 32, align 32, offset 672] [public] [from int]
!70 = !{!"0xd\00m_degenerateSimplex\0053\0032\0032\00704\003", !45, !"_ZTS17btGjkPairDetector", !58} ; [ DW_TAG_member ] [m_degenerateSimplex] [line 53, size 32, align 32, offset 704] [public] [from int]
!71 = !{!"0xd\00m_catchDegeneracies\0054\0032\0032\00736\003", !45, !"_ZTS17btGjkPairDetector", !58} ; [ DW_TAG_member ] [m_catchDegeneracies] [line 54, size 32, align 32, offset 736] [public] [from int]
!72 = !{!"0x2e\00btGjkPairDetector\00btGjkPairDetector\00\0057\000\000\000\000\00259\000\0057", !45, !"_ZTS17btGjkPairDetector", !73, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 57] [public] [btGjkPairDetector]
!73 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !74, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!74 = !{null, !75, !54, !54, !52, !50}
!75 = !{!"0xf\00\000\0064\0064\000\001088\00", null, null, !"_ZTS17btGjkPairDetector"} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [artificial] [from _ZTS17btGjkPairDetector]
!76 = !{!"0x2e\00btGjkPairDetector\00btGjkPairDetector\00\0058\000\000\000\000\00259\000\0058", !45, !"_ZTS17btGjkPairDetector", !77, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 58] [public] [btGjkPairDetector]
!77 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !78, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!78 = !{null, !75, !54, !54, !58, !58, !61, !61, !52, !50}
!79 = !{!"0x2e\00~btGjkPairDetector\00~btGjkPairDetector\00\0059\000\000\001\000\00259\000\0059", !45, !"_ZTS17btGjkPairDetector", !80, !"_ZTS17btGjkPairDetector", null, null, null, null} ; [ DW_TAG_subprogram ] [line 59] [public] [~btGjkPairDetector]
!80 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !81, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!81 = !{null, !75}
!82 = !{!"0x2e\00getClosestPoints\00getClosestPoints\00_ZN17btGjkPairDetector16getClosestPointsERKN36btDiscreteCollisionDetectorInterface17ClosestPointInputERNS0_6ResultEP12btIDebugDrawb\0061\000\000\001\002\00259\000\0061", !45, !"_ZTS17btGjkPairDetector", !83, !"_ZTS17btGjkPairDetector", null, null, null, null} ; [ DW_TAG_subprogram ] [line 61] [public] [getClosestPoints]
!83 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !84, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!84 = !{null, !75, !85, !87, !88, !66}
!85 = !{!"0x10\00\000\000\000\000\000", null, null, !86} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from ]
!86 = !{!"0x26\00\000\000\000\000\000", null, null, !"_ZTSN36btDiscreteCollisionDetectorInterface17ClosestPointInputE"} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from _ZTSN36btDiscreteCollisionDetectorInterface17ClosestPointInputE]
!87 = !{!"0x10\00\000\000\000\000\000", null, null, !"_ZTSN36btDiscreteCollisionDetectorInterface6ResultE"} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from _ZTSN36btDiscreteCollisionDetectorInterface6ResultE]
!88 = !{!"0xf\00\000\0064\0064\000\000", null, null, !"_ZTS12btIDebugDraw"} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _ZTS12btIDebugDraw]
!89 = !{!"0x2e\00getClosestPointsNonVirtual\00getClosestPointsNonVirtual\00_ZN17btGjkPairDetector26getClosestPointsNonVirtualERKN36btDiscreteCollisionDetectorInterface17ClosestPointInputERNS0_6ResultEP12btIDebugDraw\0063\000\000\000\000\00259\000\0063", !45, !"_ZTS17btGjkPairDetector", !90, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 63] [public] [getClosestPointsNonVirtual]
!90 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !91, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!91 = !{null, !75, !85, !87, !88}
!92 = !{!"0x2e\00setMinkowskiA\00setMinkowskiA\00_ZN17btGjkPairDetector13setMinkowskiAEPK13btConvexShape\0066\000\000\000\000\00259\000\0066", !45, !"_ZTS17btGjkPairDetector", !93, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 66] [public] [setMinkowskiA]
!93 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !94, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!94 = !{null, !75, !54}
!95 = !{!"0x2e\00setMinkowskiB\00setMinkowskiB\00_ZN17btGjkPairDetector13setMinkowskiBEPK13btConvexShape\0071\000\000\000\000\00259\000\0071", !45, !"_ZTS17btGjkPairDetector", !93, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 71] [public] [setMinkowskiB]
!96 = !{!"0x2e\00setCachedSeperatingAxis\00setCachedSeperatingAxis\00_ZN17btGjkPairDetector23setCachedSeperatingAxisERK9btVector3\0075\000\000\000\000\00259\000\0075", !45, !"_ZTS17btGjkPairDetector", !97, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 75] [public] [setCachedSeperatingAxis]
!97 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !98, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!98 = !{null, !75, !99}
!99 = !{!"0x10\00\000\000\000\000\000", null, null, !100} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from ]
!100 = !{!"0x26\00\000\000\000\000\000", null, null, !"_ZTS9btVector3"} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from _ZTS9btVector3]
!101 = !{!"0x2e\00getCachedSeparatingAxis\00getCachedSeparatingAxis\00_ZNK17btGjkPairDetector23getCachedSeparatingAxisEv\0080\000\000\000\000\00259\000\0080", !45, !"_ZTS17btGjkPairDetector", !102, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 80] [public] [getCachedSeparatingAxis]
!102 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !103, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!103 = !{!99, !104}
!104 = !{!"0xf\00\000\0064\0064\000\001088\00", null, null, !105} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [artificial] [from ]
!105 = !{!"0x26\00\000\000\000\000\000", null, null, !"_ZTS17btGjkPairDetector"} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from _ZTS17btGjkPairDetector]
!106 = !{!"0x2e\00getCachedSeparatingDistance\00getCachedSeparatingDistance\00_ZNK17btGjkPairDetector27getCachedSeparatingDistanceEv\0084\000\000\000\000\00259\000\0084", !45, !"_ZTS17btGjkPairDetector", !107, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 84] [public] [getCachedSeparatingDistance]
!107 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !108, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!108 = !{!61, !104}
!109 = !{!"0x2e\00setPenetrationDepthSolver\00setPenetrationDepthSolver\00_ZN17btGjkPairDetector25setPenetrationDepthSolverEP30btConvexPenetrationDepthSolver\0089\000\000\000\000\00259\000\0089", !45, !"_ZTS17btGjkPairDetector", !110, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 89] [public] [setPenetrationDepthSolver]
!110 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !111, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!111 = !{null, !75, !50}
!112 = !{!"0x2e\00setIgnoreMargin\00setIgnoreMargin\00_ZN17btGjkPairDetector15setIgnoreMarginEb\0095\000\000\000\000\00259\000\0095", !45, !"_ZTS17btGjkPairDetector", !113, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 95] [public] [setIgnoreMargin]
!113 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !114, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!114 = !{null, !75, !66}
!115 = !{!"0x2\00btConvexShape\0031\000\000\000\004\000", !116, null, null, null, null, null, !"_ZTS13btConvexShape"} ; [ DW_TAG_class_type ] [btConvexShape] [line 31, size 0, align 0, offset 0] [decl] [from ]
!116 = !{!"../../BulletCollision/CollisionShapes/btConvexShape.h", !"/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision"}
!117 = !{!"0x2\00btVoronoiSimplexSolver\0095\002880\0032\000\000\000", !118, null, null, !119, null, null, !"_ZTS22btVoronoiSimplexSolver"} ; [ DW_TAG_class_type ] [btVoronoiSimplexSolver] [line 95, size 2880, align 32, offset 0] [def] [from ]
!118 = !{!"./btVoronoiSimplexSolver.h", !"/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision"}
!119 = !{!120, !121, !125, !126, !127, !128, !129, !130, !131, !132, !133, !134, !135, !142, !145, !148, !151, !152, !153, !154, !155, !159, !164, !167, !171, !174, !177, !180, !181, !184, !187, !192, !196, !199, !202, !206, !209, !212, !213, !216}
!120 = !{!"0xd\00m_numVertices\00104\0032\0032\000\003", !118, !"_ZTS22btVoronoiSimplexSolver", !58} ; [ DW_TAG_member ] [m_numVertices] [line 104, size 32, align 32, offset 0] [public] [from int]
!121 = !{!"0xd\00m_simplexVectorW\00106\00640\0032\0032\003", !118, !"_ZTS22btVoronoiSimplexSolver", !122} ; [ DW_TAG_member ] [m_simplexVectorW] [line 106, size 640, align 32, offset 32] [public] [from ]
!122 = !{!"0x1\00\000\00640\0032\000\000\000", null, null, !"_ZTS9btVector3", !123, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 640, align 32, offset 0] [from _ZTS9btVector3]
!123 = !{!124}
!124 = !{!"0x21\000\005"}                         ; [ DW_TAG_subrange_type ] [0, 4]
!125 = !{!"0xd\00m_simplexPointsP\00107\00640\0032\00672\003", !118, !"_ZTS22btVoronoiSimplexSolver", !122} ; [ DW_TAG_member ] [m_simplexPointsP] [line 107, size 640, align 32, offset 672] [public] [from ]
!126 = !{!"0xd\00m_simplexPointsQ\00108\00640\0032\001312\003", !118, !"_ZTS22btVoronoiSimplexSolver", !122} ; [ DW_TAG_member ] [m_simplexPointsQ] [line 108, size 640, align 32, offset 1312] [public] [from ]
!127 = !{!"0xd\00m_cachedP1\00112\00128\0032\001952\003", !118, !"_ZTS22btVoronoiSimplexSolver", !"_ZTS9btVector3"} ; [ DW_TAG_member ] [m_cachedP1] [line 112, size 128, align 32, offset 1952] [public] [from _ZTS9btVector3]
!128 = !{!"0xd\00m_cachedP2\00113\00128\0032\002080\003", !118, !"_ZTS22btVoronoiSimplexSolver", !"_ZTS9btVector3"} ; [ DW_TAG_member ] [m_cachedP2] [line 113, size 128, align 32, offset 2080] [public] [from _ZTS9btVector3]
!129 = !{!"0xd\00m_cachedV\00114\00128\0032\002208\003", !118, !"_ZTS22btVoronoiSimplexSolver", !"_ZTS9btVector3"} ; [ DW_TAG_member ] [m_cachedV] [line 114, size 128, align 32, offset 2208] [public] [from _ZTS9btVector3]
!130 = !{!"0xd\00m_lastW\00115\00128\0032\002336\003", !118, !"_ZTS22btVoronoiSimplexSolver", !"_ZTS9btVector3"} ; [ DW_TAG_member ] [m_lastW] [line 115, size 128, align 32, offset 2336] [public] [from _ZTS9btVector3]
!131 = !{!"0xd\00m_equalVertexThreshold\00117\0032\0032\002464\003", !118, !"_ZTS22btVoronoiSimplexSolver", !61} ; [ DW_TAG_member ] [m_equalVertexThreshold] [line 117, size 32, align 32, offset 2464] [public] [from btScalar]
!132 = !{!"0xd\00m_cachedValidClosest\00118\008\008\002496\003", !118, !"_ZTS22btVoronoiSimplexSolver", !66} ; [ DW_TAG_member ] [m_cachedValidClosest] [line 118, size 8, align 8, offset 2496] [public] [from bool]
!133 = !{!"0xd\00m_cachedBC\00121\00320\0032\002528\003", !118, !"_ZTS22btVoronoiSimplexSolver", !"_ZTS25btSubSimplexClosestResult"} ; [ DW_TAG_member ] [m_cachedBC] [line 121, size 320, align 32, offset 2528] [public] [from _ZTS25btSubSimplexClosestResult]
!134 = !{!"0xd\00m_needsUpdate\00123\008\008\002848\003", !118, !"_ZTS22btVoronoiSimplexSolver", !66} ; [ DW_TAG_member ] [m_needsUpdate] [line 123, size 8, align 8, offset 2848] [public] [from bool]
!135 = !{!"0x2e\00operator new\00operator new\00_ZN22btVoronoiSimplexSolvernwEm\00102\000\000\000\000\00259\000\00102", !118, !"_ZTS22btVoronoiSimplexSolver", !136, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 102] [public] [operator new]
!136 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !137, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!137 = !{!138, !139}
!138 = !{!"0xf\00\000\0064\0064\000\000", null, null, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!139 = !{!"0x16\00size_t\0062\000\000\000\000", !140, null, !141} ; [ DW_TAG_typedef ] [size_t] [line 62, size 0, align 0, offset 0] [from long unsigned int]
!140 = !{!"/usr/local/bin/../lib/clang/3.6.2/include/stddef.h", !"/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision"}
!141 = !{!"0x24\00long unsigned int\000\0064\0064\000\000\007", null, null} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!142 = !{!"0x2e\00operator delete\00operator delete\00_ZN22btVoronoiSimplexSolverdlEPv\00102\000\000\000\000\00259\000\00102", !118, !"_ZTS22btVoronoiSimplexSolver", !143, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 102] [public] [operator delete]
!143 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !144, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!144 = !{null, !138}
!145 = !{!"0x2e\00operator new\00operator new\00_ZN22btVoronoiSimplexSolvernwEmPv\00102\000\000\000\000\00259\000\00102", !118, !"_ZTS22btVoronoiSimplexSolver", !146, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 102] [public] [operator new]
!146 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !147, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!147 = !{!138, !139, !138}
!148 = !{!"0x2e\00operator delete\00operator delete\00_ZN22btVoronoiSimplexSolverdlEPvS0_\00102\000\000\000\000\00259\000\00102", !118, !"_ZTS22btVoronoiSimplexSolver", !149, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 102] [public] [operator delete]
!149 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !150, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!150 = !{null, !138, !138}
!151 = !{!"0x2e\00operator new[]\00operator new[]\00_ZN22btVoronoiSimplexSolvernaEm\00102\000\000\000\000\00259\000\00102", !118, !"_ZTS22btVoronoiSimplexSolver", !136, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 102] [public] [operator new[]]
!152 = !{!"0x2e\00operator delete[]\00operator delete[]\00_ZN22btVoronoiSimplexSolverdaEPv\00102\000\000\000\000\00259\000\00102", !118, !"_ZTS22btVoronoiSimplexSolver", !143, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 102] [public] [operator delete[]]
!153 = !{!"0x2e\00operator new[]\00operator new[]\00_ZN22btVoronoiSimplexSolvernaEmPv\00102\000\000\000\000\00259\000\00102", !118, !"_ZTS22btVoronoiSimplexSolver", !146, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 102] [public] [operator new[]]
!154 = !{!"0x2e\00operator delete[]\00operator delete[]\00_ZN22btVoronoiSimplexSolverdaEPvS0_\00102\000\000\000\000\00259\000\00102", !118, !"_ZTS22btVoronoiSimplexSolver", !149, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 102] [public] [operator delete[]]
!155 = !{!"0x2e\00removeVertex\00removeVertex\00_ZN22btVoronoiSimplexSolver12removeVertexEi\00125\000\000\000\000\00259\000\00125", !118, !"_ZTS22btVoronoiSimplexSolver", !156, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 125] [public] [removeVertex]
!156 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !157, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!157 = !{null, !158, !58}
!158 = !{!"0xf\00\000\0064\0064\000\001088\00", null, null, !"_ZTS22btVoronoiSimplexSolver"} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [artificial] [from _ZTS22btVoronoiSimplexSolver]
!159 = !{!"0x2e\00reduceVertices\00reduceVertices\00_ZN22btVoronoiSimplexSolver14reduceVerticesERK15btUsageBitfield\00126\000\000\000\000\00259\000\00126", !118, !"_ZTS22btVoronoiSimplexSolver", !160, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 126] [public] [reduceVertices]
!160 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !161, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!161 = !{null, !158, !162}
!162 = !{!"0x10\00\000\000\000\000\000", null, null, !163} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from ]
!163 = !{!"0x26\00\000\000\000\000\000", null, null, !"_ZTS15btUsageBitfield"} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from _ZTS15btUsageBitfield]
!164 = !{!"0x2e\00updateClosestVectorAndPoints\00updateClosestVectorAndPoints\00_ZN22btVoronoiSimplexSolver28updateClosestVectorAndPointsEv\00127\000\000\000\000\00259\000\00127", !118, !"_ZTS22btVoronoiSimplexSolver", !165, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 127] [public] [updateClosestVectorAndPoints]
!165 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !166, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!166 = !{!66, !158}
!167 = !{!"0x2e\00closestPtPointTetrahedron\00closestPtPointTetrahedron\00_ZN22btVoronoiSimplexSolver25closestPtPointTetrahedronERK9btVector3S2_S2_S2_S2_R25btSubSimplexClosestResult\00129\000\000\000\000\00259\000\00129", !118, !"_ZTS22btVoronoiSimplexSolver", !168, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 129] [public] [closestPtPointTetrahedron]
!168 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !169, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!169 = !{!66, !158, !99, !99, !99, !99, !99, !170}
!170 = !{!"0x10\00\000\000\000\000\000", null, null, !"_ZTS25btSubSimplexClosestResult"} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from _ZTS25btSubSimplexClosestResult]
!171 = !{!"0x2e\00pointOutsideOfPlane\00pointOutsideOfPlane\00_ZN22btVoronoiSimplexSolver19pointOutsideOfPlaneERK9btVector3S2_S2_S2_S2_\00130\000\000\000\000\00259\000\00130", !118, !"_ZTS22btVoronoiSimplexSolver", !172, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 130] [public] [pointOutsideOfPlane]
!172 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !173, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!173 = !{!58, !158, !99, !99, !99, !99, !99}
!174 = !{!"0x2e\00closestPtPointTriangle\00closestPtPointTriangle\00_ZN22btVoronoiSimplexSolver22closestPtPointTriangleERK9btVector3S2_S2_S2_R25btSubSimplexClosestResult\00131\000\000\000\000\00259\000\00131", !118, !"_ZTS22btVoronoiSimplexSolver", !175, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 131] [public] [closestPtPointTriangle]
!175 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !176, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!176 = !{!66, !158, !99, !99, !99, !99, !170}
!177 = !{!"0x2e\00btVoronoiSimplexSolver\00btVoronoiSimplexSolver\00\00135\000\000\000\000\00259\000\00135", !118, !"_ZTS22btVoronoiSimplexSolver", !178, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 135] [public] [btVoronoiSimplexSolver]
!178 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !179, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!179 = !{null, !158}
!180 = !{!"0x2e\00reset\00reset\00_ZN22btVoronoiSimplexSolver5resetEv\00139\000\000\000\000\00259\000\00139", !118, !"_ZTS22btVoronoiSimplexSolver", !178, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 139] [public] [reset]
!181 = !{!"0x2e\00addVertex\00addVertex\00_ZN22btVoronoiSimplexSolver9addVertexERK9btVector3S2_S2_\00141\000\000\000\000\00259\000\00141", !118, !"_ZTS22btVoronoiSimplexSolver", !182, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 141] [public] [addVertex]
!182 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !183, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!183 = !{null, !158, !99, !99, !99}
!184 = !{!"0x2e\00setEqualVertexThreshold\00setEqualVertexThreshold\00_ZN22btVoronoiSimplexSolver23setEqualVertexThresholdEf\00143\000\000\000\000\00259\000\00143", !118, !"_ZTS22btVoronoiSimplexSolver", !185, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 143] [public] [setEqualVertexThreshold]
!185 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !186, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!186 = !{null, !158, !61}
!187 = !{!"0x2e\00getEqualVertexThreshold\00getEqualVertexThreshold\00_ZNK22btVoronoiSimplexSolver23getEqualVertexThresholdEv\00148\000\000\000\000\00259\000\00148", !118, !"_ZTS22btVoronoiSimplexSolver", !188, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 148] [public] [getEqualVertexThreshold]
!188 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !189, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!189 = !{!61, !190}
!190 = !{!"0xf\00\000\0064\0064\000\001088\00", null, null, !191} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [artificial] [from ]
!191 = !{!"0x26\00\000\000\000\000\000", null, null, !"_ZTS22btVoronoiSimplexSolver"} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from _ZTS22btVoronoiSimplexSolver]
!192 = !{!"0x2e\00closest\00closest\00_ZN22btVoronoiSimplexSolver7closestER9btVector3\00153\000\000\000\000\00259\000\00153", !118, !"_ZTS22btVoronoiSimplexSolver", !193, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 153] [public] [closest]
!193 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !194, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!194 = !{!66, !158, !195}
!195 = !{!"0x10\00\000\000\000\000\000", null, null, !"_ZTS9btVector3"} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from _ZTS9btVector3]
!196 = !{!"0x2e\00maxVertex\00maxVertex\00_ZN22btVoronoiSimplexSolver9maxVertexEv\00155\000\000\000\000\00259\000\00155", !118, !"_ZTS22btVoronoiSimplexSolver", !197, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 155] [public] [maxVertex]
!197 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !198, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!198 = !{!61, !158}
!199 = !{!"0x2e\00fullSimplex\00fullSimplex\00_ZNK22btVoronoiSimplexSolver11fullSimplexEv\00157\000\000\000\000\00259\000\00157", !118, !"_ZTS22btVoronoiSimplexSolver", !200, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 157] [public] [fullSimplex]
!200 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !201, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!201 = !{!66, !190}
!202 = !{!"0x2e\00getSimplex\00getSimplex\00_ZNK22btVoronoiSimplexSolver10getSimplexEP9btVector3S1_S1_\00162\000\000\000\000\00259\000\00162", !118, !"_ZTS22btVoronoiSimplexSolver", !203, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 162] [public] [getSimplex]
!203 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !204, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!204 = !{!58, !190, !205, !205, !205}
!205 = !{!"0xf\00\000\0064\0064\000\000", null, null, !"_ZTS9btVector3"} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _ZTS9btVector3]
!206 = !{!"0x2e\00inSimplex\00inSimplex\00_ZN22btVoronoiSimplexSolver9inSimplexERK9btVector3\00164\000\000\000\000\00259\000\00164", !118, !"_ZTS22btVoronoiSimplexSolver", !207, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 164] [public] [inSimplex]
!207 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !208, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!208 = !{!66, !158, !99}
!209 = !{!"0x2e\00backup_closest\00backup_closest\00_ZN22btVoronoiSimplexSolver14backup_closestER9btVector3\00166\000\000\000\000\00259\000\00166", !118, !"_ZTS22btVoronoiSimplexSolver", !210, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 166] [public] [backup_closest]
!210 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !211, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!211 = !{null, !158, !195}
!212 = !{!"0x2e\00emptySimplex\00emptySimplex\00_ZNK22btVoronoiSimplexSolver12emptySimplexEv\00168\000\000\000\000\00259\000\00168", !118, !"_ZTS22btVoronoiSimplexSolver", !200, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 168] [public] [emptySimplex]
!213 = !{!"0x2e\00compute_points\00compute_points\00_ZN22btVoronoiSimplexSolver14compute_pointsER9btVector3S1_\00170\000\000\000\000\00259\000\00170", !118, !"_ZTS22btVoronoiSimplexSolver", !214, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 170] [public] [compute_points]
!214 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !215, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!215 = !{null, !158, !195, !195}
!216 = !{!"0x2e\00numVertices\00numVertices\00_ZNK22btVoronoiSimplexSolver11numVerticesEv\00172\000\000\000\000\00259\000\00172", !118, !"_ZTS22btVoronoiSimplexSolver", !217, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 172] [public] [numVertices]
!217 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !218, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!218 = !{!58, !190}
!219 = !{!"0x2\00btConvexPenetrationDepthSolver\0027\000\000\000\004\000", !220, null, null, null, null, null, !"_ZTS30btConvexPenetrationDepthSolver"} ; [ DW_TAG_class_type ] [btConvexPenetrationDepthSolver] [line 27, size 0, align 0, offset 0] [decl] [from ]
!220 = !{!"../../BulletCollision/NarrowPhaseCollision/btConvexPenetrationDepthSolver.h", !"/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision"}
!221 = !{!"0x13\00btDiscreteCollisionDetectorInterface\0029\0064\0064\000\000\000", !222, null, null, !223, !"_ZTS36btDiscreteCollisionDetectorInterface", null, !"_ZTS36btDiscreteCollisionDetectorInterface"} ; [ DW_TAG_structure_type ] [btDiscreteCollisionDetectorInterface] [line 29, size 64, align 64, offset 0] [def] [from ]
!222 = !{!"./btDiscreteCollisionDetectorInterface.h", !"/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision"}
!223 = !{!224, !230, !234}
!224 = !{!"0xd\00_vptr$btDiscreteCollisionDetectorInterface\000\0064\000\000\0064", !222, !225, !226} ; [ DW_TAG_member ] [_vptr$btDiscreteCollisionDetectorInterface] [line 0, size 64, align 0, offset 0] [artificial] [from ]
!225 = !{!"0x29", !222}                           ; [ DW_TAG_file_type ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/./btDiscreteCollisionDetectorInterface.h]
!226 = !{!"0xf\00\000\0064\000\000\000", null, null, !227} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 0, offset 0] [from __vtbl_ptr_type]
!227 = !{!"0xf\00__vtbl_ptr_type\000\0064\000\000\000", null, null, !228} ; [ DW_TAG_pointer_type ] [__vtbl_ptr_type] [line 0, size 64, align 0, offset 0] [from ]
!228 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !229, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!229 = !{!58}
!230 = !{!"0x2e\00~btDiscreteCollisionDetectorInterface\00~btDiscreteCollisionDetectorInterface\00\0057\000\000\001\000\00256\000\0057", !222, !"_ZTS36btDiscreteCollisionDetectorInterface", !231, !"_ZTS36btDiscreteCollisionDetectorInterface", null, null, null, null} ; [ DW_TAG_subprogram ] [line 57] [~btDiscreteCollisionDetectorInterface]
!231 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !232, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!232 = !{null, !233}
!233 = !{!"0xf\00\000\0064\0064\000\001088\00", null, null, !"_ZTS36btDiscreteCollisionDetectorInterface"} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [artificial] [from _ZTS36btDiscreteCollisionDetectorInterface]
!234 = !{!"0x2e\00getClosestPoints\00getClosestPoints\00_ZN36btDiscreteCollisionDetectorInterface16getClosestPointsERKNS_17ClosestPointInputERNS_6ResultEP12btIDebugDrawb\0063\000\000\002\002\00256\000\0063", !222, !"_ZTS36btDiscreteCollisionDetectorInterface", !235, !"_ZTS36btDiscreteCollisionDetectorInterface", null, null, null, null} ; [ DW_TAG_subprogram ] [line 63] [getClosestPoints]
!235 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !236, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!236 = !{null, !233, !85, !87, !88, !66}
!237 = !{!"0x13\00ClosestPointInput\0043\001152\0064\000\000\000", !222, !"_ZTS36btDiscreteCollisionDetectorInterface", null, !238, null, null, !"_ZTSN36btDiscreteCollisionDetectorInterface17ClosestPointInputE"} ; [ DW_TAG_structure_type ] [ClosestPointInput] [line 43, size 1152, align 64, offset 0] [def] [from ]
!238 = !{!239, !240, !241, !242, !244}
!239 = !{!"0xd\00m_transformA\0051\00512\0032\000\000", !222, !"_ZTSN36btDiscreteCollisionDetectorInterface17ClosestPointInputE", !"_ZTS11btTransform"} ; [ DW_TAG_member ] [m_transformA] [line 51, size 512, align 32, offset 0] [from _ZTS11btTransform]
!240 = !{!"0xd\00m_transformB\0052\00512\0032\00512\000", !222, !"_ZTSN36btDiscreteCollisionDetectorInterface17ClosestPointInputE", !"_ZTS11btTransform"} ; [ DW_TAG_member ] [m_transformB] [line 52, size 512, align 32, offset 512] [from _ZTS11btTransform]
!241 = !{!"0xd\00m_maximumDistanceSquared\0053\0032\0032\001024\000", !222, !"_ZTSN36btDiscreteCollisionDetectorInterface17ClosestPointInputE", !61} ; [ DW_TAG_member ] [m_maximumDistanceSquared] [line 53, size 32, align 32, offset 1024] [from btScalar]
!242 = !{!"0xd\00m_stackAlloc\0054\0064\0064\001088\000", !222, !"_ZTSN36btDiscreteCollisionDetectorInterface17ClosestPointInputE", !243} ; [ DW_TAG_member ] [m_stackAlloc] [line 54, size 64, align 64, offset 1088] [from ]
!243 = !{!"0xf\00\000\0064\0064\000\000", null, null, !"_ZTS12btStackAlloc"} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _ZTS12btStackAlloc]
!244 = !{!"0x2e\00ClosestPointInput\00ClosestPointInput\00\0045\000\000\000\000\00256\000\0045", !222, !"_ZTSN36btDiscreteCollisionDetectorInterface17ClosestPointInputE", !245, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 45] [ClosestPointInput]
!245 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !246, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!246 = !{null, !247}
!247 = !{!"0xf\00\000\0064\0064\000\001088\00", null, null, !"_ZTSN36btDiscreteCollisionDetectorInterface17ClosestPointInputE"} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [artificial] [from _ZTSN36btDiscreteCollisionDetectorInterface17ClosestPointInputE]
!248 = !{!"0x13\00Result\0032\000\000\000\004\000", !222, !"_ZTS36btDiscreteCollisionDetectorInterface", null, null, null, null, !"_ZTSN36btDiscreteCollisionDetectorInterface6ResultE"} ; [ DW_TAG_structure_type ] [Result] [line 32, size 0, align 0, offset 0] [decl] [from ]
!249 = !{!"0x2\00btIDebugDraw\0063\000\000\000\004\000", !222, null, null, null, null, null, !"_ZTS12btIDebugDraw"} ; [ DW_TAG_class_type ] [btIDebugDraw] [line 63, size 0, align 0, offset 0] [decl] [from ]
!250 = !{!"0x2\00btTransform\0034\00512\0032\000\000\000", !251, null, null, !252, null, null, !"_ZTS11btTransform"} ; [ DW_TAG_class_type ] [btTransform] [line 34, size 512, align 32, offset 0] [def] [from ]
!251 = !{!"../../LinearMath/btTransform.h", !"/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision"}
!252 = !{!253, !254, !255, !259, !264, !269, !274, !278, !281, !285, !286, !289, !293, !296, !299, !302, !305, !310, !314, !317, !318, !321, !324, !325, !326, !329, !332, !333, !336, !340, !341, !346, !351}
!253 = !{!"0xd\00m_basis\0037\00384\0032\000\000", !251, !"_ZTS11btTransform", !"_ZTS11btMatrix3x3"} ; [ DW_TAG_member ] [m_basis] [line 37, size 384, align 32, offset 0] [from _ZTS11btMatrix3x3]
!254 = !{!"0xd\00m_origin\0039\00128\0032\00384\000", !251, !"_ZTS11btTransform", !"_ZTS9btVector3"} ; [ DW_TAG_member ] [m_origin] [line 39, size 128, align 32, offset 384] [from _ZTS9btVector3]
!255 = !{!"0x2e\00btTransform\00btTransform\00\0044\000\000\000\000\00259\000\0044", !251, !"_ZTS11btTransform", !256, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 44] [public] [btTransform]
!256 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !257, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!257 = !{null, !258}
!258 = !{!"0xf\00\000\0064\0064\000\001088\00", null, null, !"_ZTS11btTransform"} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [artificial] [from _ZTS11btTransform]
!259 = !{!"0x2e\00btTransform\00btTransform\00\0048\000\000\000\000\00387\000\0048", !251, !"_ZTS11btTransform", !260, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 48] [public] [btTransform]
!260 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !261, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!261 = !{null, !258, !262, !99}
!262 = !{!"0x10\00\000\000\000\000\000", null, null, !263} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from ]
!263 = !{!"0x26\00\000\000\000\000\000", null, null, !"_ZTS12btQuaternion"} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from _ZTS12btQuaternion]
!264 = !{!"0x2e\00btTransform\00btTransform\00\0057\000\000\000\000\00387\000\0057", !251, !"_ZTS11btTransform", !265, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 57] [public] [btTransform]
!265 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !266, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!266 = !{null, !258, !267, !99}
!267 = !{!"0x10\00\000\000\000\000\000", null, null, !268} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from ]
!268 = !{!"0x26\00\000\000\000\000\000", null, null, !"_ZTS11btMatrix3x3"} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from _ZTS11btMatrix3x3]
!269 = !{!"0x2e\00btTransform\00btTransform\00\0063\000\000\000\000\00259\000\0063", !251, !"_ZTS11btTransform", !270, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 63] [public] [btTransform]
!270 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !271, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!271 = !{null, !258, !272}
!272 = !{!"0x10\00\000\000\000\000\000", null, null, !273} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from ]
!273 = !{!"0x26\00\000\000\000\000\000", null, null, !"_ZTS11btTransform"} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from _ZTS11btTransform]
!274 = !{!"0x2e\00operator=\00operator=\00_ZN11btTransformaSERKS_\0069\000\000\000\000\00259\000\0069", !251, !"_ZTS11btTransform", !275, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 69] [public] [operator=]
!275 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !276, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!276 = !{!277, !258, !272}
!277 = !{!"0x10\00\000\000\000\000\000", null, null, !"_ZTS11btTransform"} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from _ZTS11btTransform]
!278 = !{!"0x2e\00mult\00mult\00_ZN11btTransform4multERKS_S1_\0081\000\000\000\000\00259\000\0081", !251, !"_ZTS11btTransform", !279, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 81] [public] [mult]
!279 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !280, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!280 = !{null, !258, !272, !272}
!281 = !{!"0x2e\00operator()\00operator()\00_ZNK11btTransformclERK9btVector3\0094\000\000\000\000\00259\000\0094", !251, !"_ZTS11btTransform", !282, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 94] [public] [operator()]
!282 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !283, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!283 = !{!"_ZTS9btVector3", !284, !99}
!284 = !{!"0xf\00\000\0064\0064\000\001088\00", null, null, !273} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [artificial] [from ]
!285 = !{!"0x2e\00operator*\00operator*\00_ZNK11btTransformmlERK9btVector3\00100\000\000\000\000\00259\000\00100", !251, !"_ZTS11btTransform", !282, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 100] [public] [operator*]
!286 = !{!"0x2e\00operator*\00operator*\00_ZNK11btTransformmlERK12btQuaternion\00106\000\000\000\000\00259\000\00106", !251, !"_ZTS11btTransform", !287, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 106] [public] [operator*]
!287 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !288, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!288 = !{!"_ZTS12btQuaternion", !284, !262}
!289 = !{!"0x2e\00getBasis\00getBasis\00_ZN11btTransform8getBasisEv\00112\000\000\000\000\00259\000\00112", !251, !"_ZTS11btTransform", !290, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 112] [public] [getBasis]
!290 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !291, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!291 = !{!292, !258}
!292 = !{!"0x10\00\000\000\000\000\000", null, null, !"_ZTS11btMatrix3x3"} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from _ZTS11btMatrix3x3]
!293 = !{!"0x2e\00getBasis\00getBasis\00_ZNK11btTransform8getBasisEv\00114\000\000\000\000\00259\000\00114", !251, !"_ZTS11btTransform", !294, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 114] [public] [getBasis]
!294 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !295, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!295 = !{!267, !284}
!296 = !{!"0x2e\00getOrigin\00getOrigin\00_ZN11btTransform9getOriginEv\00117\000\000\000\000\00259\000\00117", !251, !"_ZTS11btTransform", !297, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 117] [public] [getOrigin]
!297 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !298, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!298 = !{!195, !258}
!299 = !{!"0x2e\00getOrigin\00getOrigin\00_ZNK11btTransform9getOriginEv\00119\000\000\000\000\00259\000\00119", !251, !"_ZTS11btTransform", !300, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 119] [public] [getOrigin]
!300 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !301, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!301 = !{!99, !284}
!302 = !{!"0x2e\00getRotation\00getRotation\00_ZNK11btTransform11getRotationEv\00122\000\000\000\000\00259\000\00122", !251, !"_ZTS11btTransform", !303, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 122] [public] [getRotation]
!303 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !304, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!304 = !{!"_ZTS12btQuaternion", !284}
!305 = !{!"0x2e\00setFromOpenGLMatrix\00setFromOpenGLMatrix\00_ZN11btTransform19setFromOpenGLMatrixEPKf\00131\000\000\000\000\00259\000\00131", !251, !"_ZTS11btTransform", !306, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 131] [public] [setFromOpenGLMatrix]
!306 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !307, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!307 = !{null, !258, !308}
!308 = !{!"0xf\00\000\0064\0064\000\000", null, null, !309} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!309 = !{!"0x26\00\000\000\000\000\000", null, null, !61} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from btScalar]
!310 = !{!"0x2e\00getOpenGLMatrix\00getOpenGLMatrix\00_ZNK11btTransform15getOpenGLMatrixEPf\00139\000\000\000\000\00259\000\00139", !251, !"_ZTS11btTransform", !311, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 139] [public] [getOpenGLMatrix]
!311 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !312, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!312 = !{null, !284, !313}
!313 = !{!"0xf\00\000\0064\0064\000\000", null, null, !61} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from btScalar]
!314 = !{!"0x2e\00setOrigin\00setOrigin\00_ZN11btTransform9setOriginERK9btVector3\00150\000\000\000\000\00259\000\00150", !251, !"_ZTS11btTransform", !315, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 150] [public] [setOrigin]
!315 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !316, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!316 = !{null, !258, !99}
!317 = !{!"0x2e\00invXform\00invXform\00_ZNK11btTransform8invXformERK9btVector3\00155\000\000\000\000\00259\000\00155", !251, !"_ZTS11btTransform", !282, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 155] [public] [invXform]
!318 = !{!"0x2e\00setBasis\00setBasis\00_ZN11btTransform8setBasisERK11btMatrix3x3\00159\000\000\000\000\00259\000\00159", !251, !"_ZTS11btTransform", !319, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 159] [public] [setBasis]
!319 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !320, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!320 = !{null, !258, !267}
!321 = !{!"0x2e\00setRotation\00setRotation\00_ZN11btTransform11setRotationERK12btQuaternion\00165\000\000\000\000\00259\000\00165", !251, !"_ZTS11btTransform", !322, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 165] [public] [setRotation]
!322 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !323, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!323 = !{null, !258, !262}
!324 = !{!"0x2e\00setIdentity\00setIdentity\00_ZN11btTransform11setIdentityEv\00172\000\000\000\000\00259\000\00172", !251, !"_ZTS11btTransform", !256, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 172] [public] [setIdentity]
!325 = !{!"0x2e\00operator*=\00operator*=\00_ZN11btTransformmLERKS_\00180\000\000\000\000\00259\000\00180", !251, !"_ZTS11btTransform", !275, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 180] [public] [operator*=]
!326 = !{!"0x2e\00inverse\00inverse\00_ZNK11btTransform7inverseEv\00188\000\000\000\000\00259\000\00188", !251, !"_ZTS11btTransform", !327, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 188] [public] [inverse]
!327 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !328, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!328 = !{!"_ZTS11btTransform", !284}
!329 = !{!"0x2e\00inverseTimes\00inverseTimes\00_ZNK11btTransform12inverseTimesERKS_\00197\000\000\000\000\00259\000\00197", !251, !"_ZTS11btTransform", !330, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 197] [public] [inverseTimes]
!330 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !331, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!331 = !{!"_ZTS11btTransform", !284, !272}
!332 = !{!"0x2e\00operator*\00operator*\00_ZNK11btTransformmlERKS_\00200\000\000\000\000\00259\000\00200", !251, !"_ZTS11btTransform", !330, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 200] [public] [operator*]
!333 = !{!"0x2e\00getIdentity\00getIdentity\00_ZN11btTransform11getIdentityEv\00203\000\000\000\000\00259\000\00203", !251, !"_ZTS11btTransform", !334, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 203] [public] [getIdentity]
!334 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !335, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!335 = !{!272}
!336 = !{!"0x2e\00serialize\00serialize\00_ZNK11btTransform9serializeER20btTransformFloatData\00209\000\000\000\000\00259\000\00209", !251, !"_ZTS11btTransform", !337, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 209] [public] [serialize]
!337 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !338, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!338 = !{null, !284, !339}
!339 = !{!"0x10\00\000\000\000\000\000", null, null, !"_ZTS20btTransformFloatData"} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from _ZTS20btTransformFloatData]
!340 = !{!"0x2e\00serializeFloat\00serializeFloat\00_ZNK11btTransform14serializeFloatER20btTransformFloatData\00211\000\000\000\000\00259\000\00211", !251, !"_ZTS11btTransform", !337, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 211] [public] [serializeFloat]
!341 = !{!"0x2e\00deSerialize\00deSerialize\00_ZN11btTransform11deSerializeERK20btTransformFloatData\00213\000\000\000\000\00259\000\00213", !251, !"_ZTS11btTransform", !342, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 213] [public] [deSerialize]
!342 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !343, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!343 = !{null, !258, !344}
!344 = !{!"0x10\00\000\000\000\000\000", null, null, !345} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from ]
!345 = !{!"0x26\00\000\000\000\000\000", null, null, !"_ZTS20btTransformFloatData"} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from _ZTS20btTransformFloatData]
!346 = !{!"0x2e\00deSerializeDouble\00deSerializeDouble\00_ZN11btTransform17deSerializeDoubleERK21btTransformDoubleData\00215\000\000\000\000\00259\000\00215", !251, !"_ZTS11btTransform", !347, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 215] [public] [deSerializeDouble]
!347 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !348, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!348 = !{null, !258, !349}
!349 = !{!"0x10\00\000\000\000\000\000", null, null, !350} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from ]
!350 = !{!"0x26\00\000\000\000\000\000", null, null, !"_ZTS21btTransformDoubleData"} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from _ZTS21btTransformDoubleData]
!351 = !{!"0x2e\00deSerializeFloat\00deSerializeFloat\00_ZN11btTransform16deSerializeFloatERK20btTransformFloatData\00217\000\000\000\000\00259\000\00217", !251, !"_ZTS11btTransform", !342, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 217] [public] [deSerializeFloat]
!352 = !{!"0x2\00btMatrix3x3\0043\00384\0032\000\000\000", !353, null, null, !354, null, null, !"_ZTS11btMatrix3x3"} ; [ DW_TAG_class_type ] [btMatrix3x3] [line 43, size 384, align 32, offset 0] [def] [from ]
!353 = !{!"../../LinearMath/btMatrix3x3.h", !"/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision"}
!354 = !{!355, !359, !363, !366, !370, !373, !376, !380, !383, !386, !387, !388, !389, !390, !393, !394, !395, !398, !401, !402, !405, !408, !412, !416, !420, !423, !426, !429, !430, !431, !432, !435, !436, !439, !440, !441, !444, !447, !451, !452, !457, !458}
!355 = !{!"0xd\00m_el\0046\00384\0032\000\000", !353, !"_ZTS11btMatrix3x3", !356} ; [ DW_TAG_member ] [m_el] [line 46, size 384, align 32, offset 0] [from ]
!356 = !{!"0x1\00\000\00384\0032\000\000\000", null, null, !"_ZTS9btVector3", !357, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 384, align 32, offset 0] [from _ZTS9btVector3]
!357 = !{!358}
!358 = !{!"0x21\000\003"}                         ; [ DW_TAG_subrange_type ] [0, 2]
!359 = !{!"0x2e\00btMatrix3x3\00btMatrix3x3\00\0050\000\000\000\000\00259\000\0050", !353, !"_ZTS11btMatrix3x3", !360, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 50] [public] [btMatrix3x3]
!360 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !361, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!361 = !{null, !362}
!362 = !{!"0xf\00\000\0064\0064\000\001088\00", null, null, !"_ZTS11btMatrix3x3"} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [artificial] [from _ZTS11btMatrix3x3]
!363 = !{!"0x2e\00btMatrix3x3\00btMatrix3x3\00\0055\000\000\000\000\00387\000\0055", !353, !"_ZTS11btMatrix3x3", !364, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 55] [public] [btMatrix3x3]
!364 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !365, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!365 = !{null, !362, !262}
!366 = !{!"0x2e\00btMatrix3x3\00btMatrix3x3\00\0064\000\000\000\000\00259\000\0064", !353, !"_ZTS11btMatrix3x3", !367, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 64] [public] [btMatrix3x3]
!367 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !368, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!368 = !{null, !362, !369, !369, !369, !369, !369, !369, !369, !369, !369}
!369 = !{!"0x10\00\000\000\000\000\000", null, null, !309} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from ]
!370 = !{!"0x2e\00btMatrix3x3\00btMatrix3x3\00\00109\000\000\000\000\00259\000\00109", !353, !"_ZTS11btMatrix3x3", !371, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 109] [public] [btMatrix3x3]
!371 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !372, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!372 = !{null, !362, !267}
!373 = !{!"0x2e\00operator=\00operator=\00_ZN11btMatrix3x3aSERKS_\00117\000\000\000\000\00259\000\00117", !353, !"_ZTS11btMatrix3x3", !374, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 117] [public] [operator=]
!374 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !375, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!375 = !{!292, !362, !267}
!376 = !{!"0x2e\00getColumn\00getColumn\00_ZNK11btMatrix3x39getColumnEi\00129\000\000\000\000\00259\000\00129", !353, !"_ZTS11btMatrix3x3", !377, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 129] [public] [getColumn]
!377 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !378, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!378 = !{!"_ZTS9btVector3", !379, !58}
!379 = !{!"0xf\00\000\0064\0064\000\001088\00", null, null, !268} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [artificial] [from ]
!380 = !{!"0x2e\00getRow\00getRow\00_ZNK11btMatrix3x36getRowEi\00137\000\000\000\000\00259\000\00137", !353, !"_ZTS11btMatrix3x3", !381, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 137] [public] [getRow]
!381 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !382, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!382 = !{!99, !379, !58}
!383 = !{!"0x2e\00operator[]\00operator[]\00_ZN11btMatrix3x3ixEi\00145\000\000\000\000\00259\000\00145", !353, !"_ZTS11btMatrix3x3", !384, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 145] [public] [operator[]]
!384 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !385, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!385 = !{!195, !362, !58}
!386 = !{!"0x2e\00operator[]\00operator[]\00_ZNK11btMatrix3x3ixEi\00153\000\000\000\000\00259\000\00153", !353, !"_ZTS11btMatrix3x3", !381, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 153] [public] [operator[]]
!387 = !{!"0x2e\00operator*=\00operator*=\00_ZN11btMatrix3x3mLERKS_\00162\000\000\000\000\00259\000\00162", !353, !"_ZTS11btMatrix3x3", !374, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 162] [public] [operator*=]
!388 = !{!"0x2e\00operator+=\00operator+=\00_ZN11btMatrix3x3pLERKS_\00167\000\000\000\000\00259\000\00167", !353, !"_ZTS11btMatrix3x3", !374, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 167] [public] [operator+=]
!389 = !{!"0x2e\00operator-=\00operator-=\00_ZN11btMatrix3x3mIERKS_\00172\000\000\000\000\00259\000\00172", !353, !"_ZTS11btMatrix3x3", !374, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 172] [public] [operator-=]
!390 = !{!"0x2e\00setFromOpenGLSubMatrix\00setFromOpenGLSubMatrix\00_ZN11btMatrix3x322setFromOpenGLSubMatrixEPKf\00176\000\000\000\000\00259\000\00176", !353, !"_ZTS11btMatrix3x3", !391, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 176] [public] [setFromOpenGLSubMatrix]
!391 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !392, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!392 = !{null, !362, !308}
!393 = !{!"0x2e\00setValue\00setValue\00_ZN11btMatrix3x38setValueERKfS1_S1_S1_S1_S1_S1_S1_S1_\00193\000\000\000\000\00259\000\00193", !353, !"_ZTS11btMatrix3x3", !367, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 193] [public] [setValue]
!394 = !{!"0x2e\00setRotation\00setRotation\00_ZN11btMatrix3x311setRotationERK12btQuaternion\00204\000\000\000\000\00259\000\00204", !353, !"_ZTS11btMatrix3x3", !364, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 204] [public] [setRotation]
!395 = !{!"0x2e\00setEulerYPR\00setEulerYPR\00_ZN11btMatrix3x311setEulerYPRERKfS1_S1_\00279\000\000\000\000\00259\000\00279", !353, !"_ZTS11btMatrix3x3", !396, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 279] [public] [setEulerYPR]
!396 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !397, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!397 = !{null, !362, !369, !369, !369}
!398 = !{!"0x2e\00setEulerZYX\00setEulerZYX\00_ZN11btMatrix3x311setEulerZYXEfff\00293\000\000\000\000\00259\000\00293", !353, !"_ZTS11btMatrix3x3", !399, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 293] [public] [setEulerZYX]
!399 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !400, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!400 = !{null, !362, !61, !61, !61}
!401 = !{!"0x2e\00setIdentity\00setIdentity\00_ZN11btMatrix3x311setIdentityEv\00312\000\000\000\000\00259\000\00312", !353, !"_ZTS11btMatrix3x3", !360, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 312] [public] [setIdentity]
!402 = !{!"0x2e\00getIdentity\00getIdentity\00_ZN11btMatrix3x311getIdentityEv\00325\000\000\000\000\00259\000\00325", !353, !"_ZTS11btMatrix3x3", !403, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 325] [public] [getIdentity]
!403 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !404, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!404 = !{!267}
!405 = !{!"0x2e\00getOpenGLSubMatrix\00getOpenGLSubMatrix\00_ZNK11btMatrix3x318getOpenGLSubMatrixEPf\00342\000\000\000\000\00259\000\00342", !353, !"_ZTS11btMatrix3x3", !406, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 342] [public] [getOpenGLSubMatrix]
!406 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !407, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!407 = !{null, !379, !313}
!408 = !{!"0x2e\00getRotation\00getRotation\00_ZNK11btMatrix3x311getRotationER12btQuaternion\00395\000\000\000\000\00259\000\00395", !353, !"_ZTS11btMatrix3x3", !409, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 395] [public] [getRotation]
!409 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !410, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!410 = !{null, !379, !411}
!411 = !{!"0x10\00\000\000\000\000\000", null, null, !"_ZTS12btQuaternion"} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from _ZTS12btQuaternion]
!412 = !{!"0x2e\00getEulerYPR\00getEulerYPR\00_ZNK11btMatrix3x311getEulerYPRERfS0_S0_\00487\000\000\000\000\00259\000\00487", !353, !"_ZTS11btMatrix3x3", !413, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 487] [public] [getEulerYPR]
!413 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !414, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!414 = !{null, !379, !415, !415, !415}
!415 = !{!"0x10\00\000\000\000\000\000", null, null, !61} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from btScalar]
!416 = !{!"0x2e\00getEulerZYX\00getEulerZYX\00_ZNK11btMatrix3x311getEulerZYXERfS0_S0_j\00516\000\000\000\000\00259\000\00516", !353, !"_ZTS11btMatrix3x3", !417, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 516] [public] [getEulerZYX]
!417 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !418, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!418 = !{null, !379, !415, !415, !415, !419}
!419 = !{!"0x24\00unsigned int\000\0032\0032\000\000\007", null, null} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!420 = !{!"0x2e\00scaled\00scaled\00_ZNK11btMatrix3x36scaledERK9btVector3\00585\000\000\000\000\00259\000\00585", !353, !"_ZTS11btMatrix3x3", !421, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 585] [public] [scaled]
!421 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !422, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!422 = !{!"_ZTS11btMatrix3x3", !379, !99}
!423 = !{!"0x2e\00determinant\00determinant\00_ZNK11btMatrix3x311determinantEv\00598\000\000\000\000\00259\000\00598", !353, !"_ZTS11btMatrix3x3", !424, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 598] [public] [determinant]
!424 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !425, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!425 = !{!61, !379}
!426 = !{!"0x2e\00adjoint\00adjoint\00_ZNK11btMatrix3x37adjointEv\00600\000\000\000\000\00259\000\00600", !353, !"_ZTS11btMatrix3x3", !427, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 600] [public] [adjoint]
!427 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !428, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!428 = !{!"_ZTS11btMatrix3x3", !379}
!429 = !{!"0x2e\00absolute\00absolute\00_ZNK11btMatrix3x38absoluteEv\00602\000\000\000\000\00259\000\00602", !353, !"_ZTS11btMatrix3x3", !427, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 602] [public] [absolute]
!430 = !{!"0x2e\00transpose\00transpose\00_ZNK11btMatrix3x39transposeEv\00604\000\000\000\000\00259\000\00604", !353, !"_ZTS11btMatrix3x3", !427, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 604] [public] [transpose]
!431 = !{!"0x2e\00inverse\00inverse\00_ZNK11btMatrix3x37inverseEv\00606\000\000\000\000\00259\000\00606", !353, !"_ZTS11btMatrix3x3", !427, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 606] [public] [inverse]
!432 = !{!"0x2e\00transposeTimes\00transposeTimes\00_ZNK11btMatrix3x314transposeTimesERKS_\00608\000\000\000\000\00259\000\00608", !353, !"_ZTS11btMatrix3x3", !433, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 608] [public] [transposeTimes]
!433 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !434, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!434 = !{!"_ZTS11btMatrix3x3", !379, !267}
!435 = !{!"0x2e\00timesTranspose\00timesTranspose\00_ZNK11btMatrix3x314timesTransposeERKS_\00609\000\000\000\000\00259\000\00609", !353, !"_ZTS11btMatrix3x3", !433, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 609] [public] [timesTranspose]
!436 = !{!"0x2e\00tdotx\00tdotx\00_ZNK11btMatrix3x35tdotxERK9btVector3\00611\000\000\000\000\00259\000\00611", !353, !"_ZTS11btMatrix3x3", !437, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 611] [public] [tdotx]
!437 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !438, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!438 = !{!61, !379, !99}
!439 = !{!"0x2e\00tdoty\00tdoty\00_ZNK11btMatrix3x35tdotyERK9btVector3\00615\000\000\000\000\00259\000\00615", !353, !"_ZTS11btMatrix3x3", !437, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 615] [public] [tdoty]
!440 = !{!"0x2e\00tdotz\00tdotz\00_ZNK11btMatrix3x35tdotzERK9btVector3\00619\000\000\000\000\00259\000\00619", !353, !"_ZTS11btMatrix3x3", !437, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 619] [public] [tdotz]
!441 = !{!"0x2e\00diagonalize\00diagonalize\00_ZN11btMatrix3x311diagonalizeERS_fi\00634\000\000\000\000\00259\000\00634", !353, !"_ZTS11btMatrix3x3", !442, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 634] [public] [diagonalize]
!442 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !443, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!443 = !{null, !362, !292, !61, !58}
!444 = !{!"0x2e\00cofac\00cofac\00_ZNK11btMatrix3x35cofacEiiii\00722\000\000\000\000\00259\000\00722", !353, !"_ZTS11btMatrix3x3", !445, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 722] [public] [cofac]
!445 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !446, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!446 = !{!61, !379, !58, !58, !58, !58}
!447 = !{!"0x2e\00serialize\00serialize\00_ZNK11btMatrix3x39serializeER20btMatrix3x3FloatData\00727\000\000\000\000\00259\000\00727", !353, !"_ZTS11btMatrix3x3", !448, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 727] [public] [serialize]
!448 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !449, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!449 = !{null, !379, !450}
!450 = !{!"0x10\00\000\000\000\000\000", null, null, !"_ZTS20btMatrix3x3FloatData"} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from _ZTS20btMatrix3x3FloatData]
!451 = !{!"0x2e\00serializeFloat\00serializeFloat\00_ZNK11btMatrix3x314serializeFloatER20btMatrix3x3FloatData\00729\000\000\000\000\00259\000\00729", !353, !"_ZTS11btMatrix3x3", !448, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 729] [public] [serializeFloat]
!452 = !{!"0x2e\00deSerialize\00deSerialize\00_ZN11btMatrix3x311deSerializeERK20btMatrix3x3FloatData\00731\000\000\000\000\00259\000\00731", !353, !"_ZTS11btMatrix3x3", !453, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 731] [public] [deSerialize]
!453 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !454, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!454 = !{null, !362, !455}
!455 = !{!"0x10\00\000\000\000\000\000", null, null, !456} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from ]
!456 = !{!"0x26\00\000\000\000\000\000", null, null, !"_ZTS20btMatrix3x3FloatData"} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from _ZTS20btMatrix3x3FloatData]
!457 = !{!"0x2e\00deSerializeFloat\00deSerializeFloat\00_ZN11btMatrix3x316deSerializeFloatERK20btMatrix3x3FloatData\00733\000\000\000\000\00259\000\00733", !353, !"_ZTS11btMatrix3x3", !453, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 733] [public] [deSerializeFloat]
!458 = !{!"0x2e\00deSerializeDouble\00deSerializeDouble\00_ZN11btMatrix3x317deSerializeDoubleERK21btMatrix3x3DoubleData\00735\000\000\000\000\00259\000\00735", !353, !"_ZTS11btMatrix3x3", !459, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 735] [public] [deSerializeDouble]
!459 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !460, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!460 = !{null, !362, !461}
!461 = !{!"0x10\00\000\000\000\000\000", null, null, !462} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from ]
!462 = !{!"0x26\00\000\000\000\000\000", null, null, !"_ZTS21btMatrix3x3DoubleData"} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from _ZTS21btMatrix3x3DoubleData]
!463 = !{!"0x2\00btVector3\0078\00128\0032\000\000\000", !464, null, null, !465, null, null, !"_ZTS9btVector3"} ; [ DW_TAG_class_type ] [btVector3] [line 78, size 128, align 32, offset 0] [def] [from ]
!464 = !{!"../../LinearMath/btVector3.h", !"/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision"}
!465 = !{!466, !470, !471, !472, !473, !474, !475, !476, !477, !478, !482, !485, !488, !489, !492, !493, !497, !500, !501, !502, !503, !506, !507, !510, !513, !514, !515, !518, !521, !524, !525, !526, !527, !530, !533, !534, !537, !538, !539, !542, !543, !544, !545, !546, !547, !548, !549, !552, !555, !558, !559, !562, !563, !564, !567, !568, !571, !572, !576, !581, !582, !583, !587, !592, !597, !598}
!466 = !{!"0xd\00m_floats\00107\00128\0032\000\003", !464, !"_ZTS9btVector3", !467} ; [ DW_TAG_member ] [m_floats] [line 107, size 128, align 32, offset 0] [public] [from ]
!467 = !{!"0x1\00\000\00128\0032\000\000\000", null, null, !61, !468, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 128, align 32, offset 0] [from btScalar]
!468 = !{!469}
!469 = !{!"0x21\000\004"}                         ; [ DW_TAG_subrange_type ] [0, 3]
!470 = !{!"0x2e\00operator new\00operator new\00_ZN9btVector3nwEm\0082\000\000\000\000\00259\000\0082", !464, !"_ZTS9btVector3", !136, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 82] [public] [operator new]
!471 = !{!"0x2e\00operator delete\00operator delete\00_ZN9btVector3dlEPv\0082\000\000\000\000\00259\000\0082", !464, !"_ZTS9btVector3", !143, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 82] [public] [operator delete]
!472 = !{!"0x2e\00operator new\00operator new\00_ZN9btVector3nwEmPv\0082\000\000\000\000\00259\000\0082", !464, !"_ZTS9btVector3", !146, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 82] [public] [operator new]
!473 = !{!"0x2e\00operator delete\00operator delete\00_ZN9btVector3dlEPvS0_\0082\000\000\000\000\00259\000\0082", !464, !"_ZTS9btVector3", !149, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 82] [public] [operator delete]
!474 = !{!"0x2e\00operator new[]\00operator new[]\00_ZN9btVector3naEm\0082\000\000\000\000\00259\000\0082", !464, !"_ZTS9btVector3", !136, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 82] [public] [operator new[]]
!475 = !{!"0x2e\00operator delete[]\00operator delete[]\00_ZN9btVector3daEPv\0082\000\000\000\000\00259\000\0082", !464, !"_ZTS9btVector3", !143, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 82] [public] [operator delete[]]
!476 = !{!"0x2e\00operator new[]\00operator new[]\00_ZN9btVector3naEmPv\0082\000\000\000\000\00259\000\0082", !464, !"_ZTS9btVector3", !146, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 82] [public] [operator new[]]
!477 = !{!"0x2e\00operator delete[]\00operator delete[]\00_ZN9btVector3daEPvS0_\0082\000\000\000\000\00259\000\0082", !464, !"_ZTS9btVector3", !149, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 82] [public] [operator delete[]]
!478 = !{!"0x2e\00btVector3\00btVector3\00\00114\000\000\000\000\00259\000\00114", !464, !"_ZTS9btVector3", !479, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 114] [public] [btVector3]
!479 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !480, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!480 = !{null, !481}
!481 = !{!"0xf\00\000\0064\0064\000\001088\00", null, null, !"_ZTS9btVector3"} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [artificial] [from _ZTS9btVector3]
!482 = !{!"0x2e\00btVector3\00btVector3\00\00126\000\000\000\000\00259\000\00126", !464, !"_ZTS9btVector3", !483, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 126] [public] [btVector3]
!483 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !484, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!484 = !{null, !481, !369, !369, !369}
!485 = !{!"0x2e\00operator+=\00operator+=\00_ZN9btVector3pLERKS_\00159\000\000\000\000\00259\000\00159", !464, !"_ZTS9btVector3", !486, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 159] [public] [operator+=]
!486 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !487, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!487 = !{!195, !481, !99}
!488 = !{!"0x2e\00operator-=\00operator-=\00_ZN9btVector3mIERKS_\00176\000\000\000\000\00259\000\00176", !464, !"_ZTS9btVector3", !486, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 176] [public] [operator-=]
!489 = !{!"0x2e\00operator*=\00operator*=\00_ZN9btVector3mLERKf\00192\000\000\000\000\00259\000\00192", !464, !"_ZTS9btVector3", !490, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 192] [public] [operator*=]
!490 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !491, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!491 = !{!195, !481, !369}
!492 = !{!"0x2e\00operator/=\00operator/=\00_ZN9btVector3dVERKf\00210\000\000\000\000\00259\000\00210", !464, !"_ZTS9btVector3", !490, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 210] [public] [operator/=]
!493 = !{!"0x2e\00dot\00dot\00_ZNK9btVector33dotERKS_\00230\000\000\000\000\00259\000\00230", !464, !"_ZTS9btVector3", !494, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 230] [public] [dot]
!494 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !495, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!495 = !{!61, !496, !99}
!496 = !{!"0xf\00\000\0064\0064\000\001088\00", null, null, !100} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [artificial] [from ]
!497 = !{!"0x2e\00length2\00length2\00_ZNK9btVector37length2Ev\00252\000\000\000\000\00259\000\00252", !464, !"_ZTS9btVector3", !498, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 252] [public] [length2]
!498 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !499, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!499 = !{!61, !496}
!500 = !{!"0x2e\00length\00length\00_ZNK9btVector36lengthEv\00258\000\000\000\000\00259\000\00258", !464, !"_ZTS9btVector3", !498, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 258] [public] [length]
!501 = !{!"0x2e\00distance2\00distance2\00_ZNK9btVector39distance2ERKS_\00265\000\000\000\000\00259\000\00265", !464, !"_ZTS9btVector3", !494, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 265] [public] [distance2]
!502 = !{!"0x2e\00distance\00distance\00_ZNK9btVector38distanceERKS_\00269\000\000\000\000\00259\000\00269", !464, !"_ZTS9btVector3", !494, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 269] [public] [distance]
!503 = !{!"0x2e\00safeNormalize\00safeNormalize\00_ZN9btVector313safeNormalizeEv\00271\000\000\000\000\00259\000\00271", !464, !"_ZTS9btVector3", !504, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 271] [public] [safeNormalize]
!504 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !505, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!505 = !{!195, !481}
!506 = !{!"0x2e\00normalize\00normalize\00_ZN9btVector39normalizeEv\00286\000\000\000\000\00259\000\00286", !464, !"_ZTS9btVector3", !504, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 286] [public] [normalize]
!507 = !{!"0x2e\00normalized\00normalized\00_ZNK9btVector310normalizedEv\00329\000\000\000\000\00259\000\00329", !464, !"_ZTS9btVector3", !508, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 329] [public] [normalized]
!508 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !509, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!509 = !{!"_ZTS9btVector3", !496}
!510 = !{!"0x2e\00rotate\00rotate\00_ZNK9btVector36rotateERKS_f\00334\000\000\000\000\00259\000\00334", !464, !"_ZTS9btVector3", !511, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 334] [public] [rotate]
!511 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !512, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!512 = !{!"_ZTS9btVector3", !496, !99, !309}
!513 = !{!"0x2e\00angle\00angle\00_ZNK9btVector35angleERKS_\00338\000\000\000\000\00259\000\00338", !464, !"_ZTS9btVector3", !494, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 338] [public] [angle]
!514 = !{!"0x2e\00absolute\00absolute\00_ZNK9btVector38absoluteEv\00346\000\000\000\000\00259\000\00346", !464, !"_ZTS9btVector3", !508, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 346] [public] [absolute]
!515 = !{!"0x2e\00cross\00cross\00_ZNK9btVector35crossERKS_\00362\000\000\000\000\00259\000\00362", !464, !"_ZTS9btVector3", !516, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 362] [public] [cross]
!516 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !517, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!517 = !{!"_ZTS9btVector3", !496, !99}
!518 = !{!"0x2e\00triple\00triple\00_ZNK9btVector36tripleERKS_S1_\00401\000\000\000\000\00259\000\00401", !464, !"_ZTS9btVector3", !519, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 401] [public] [triple]
!519 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !520, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!520 = !{!61, !496, !99, !99}
!521 = !{!"0x2e\00minAxis\00minAxis\00_ZNK9btVector37minAxisEv\00453\000\000\000\000\00259\000\00453", !464, !"_ZTS9btVector3", !522, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 453] [public] [minAxis]
!522 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !523, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!523 = !{!58, !496}
!524 = !{!"0x2e\00maxAxis\00maxAxis\00_ZNK9btVector37maxAxisEv\00460\000\000\000\000\00259\000\00460", !464, !"_ZTS9btVector3", !522, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 460] [public] [maxAxis]
!525 = !{!"0x2e\00furthestAxis\00furthestAxis\00_ZNK9btVector312furthestAxisEv\00465\000\000\000\000\00259\000\00465", !464, !"_ZTS9btVector3", !522, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 465] [public] [furthestAxis]
!526 = !{!"0x2e\00closestAxis\00closestAxis\00_ZNK9btVector311closestAxisEv\00470\000\000\000\000\00259\000\00470", !464, !"_ZTS9btVector3", !522, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 470] [public] [closestAxis]
!527 = !{!"0x2e\00setInterpolate3\00setInterpolate3\00_ZN9btVector315setInterpolate3ERKS_S1_f\00476\000\000\000\000\00259\000\00476", !464, !"_ZTS9btVector3", !528, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 476] [public] [setInterpolate3]
!528 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !529, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!529 = !{null, !481, !99, !99, !61}
!530 = !{!"0x2e\00lerp\00lerp\00_ZNK9btVector34lerpERKS_RKf\00505\000\000\000\000\00259\000\00505", !464, !"_ZTS9btVector3", !531, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 505] [public] [lerp]
!531 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !532, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!532 = !{!"_ZTS9btVector3", !496, !99, !369}
!533 = !{!"0x2e\00operator*=\00operator*=\00_ZN9btVector3mLERKS_\00531\000\000\000\000\00259\000\00531", !464, !"_ZTS9btVector3", !486, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 531] [public] [operator*=]
!534 = !{!"0x2e\00getX\00getX\00_ZNK9btVector34getXEv\00546\000\000\000\000\00259\000\00546", !464, !"_ZTS9btVector3", !535, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 546] [public] [getX]
!535 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !536, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!536 = !{!369, !496}
!537 = !{!"0x2e\00getY\00getY\00_ZNK9btVector34getYEv\00548\000\000\000\000\00259\000\00548", !464, !"_ZTS9btVector3", !535, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 548] [public] [getY]
!538 = !{!"0x2e\00getZ\00getZ\00_ZNK9btVector34getZEv\00550\000\000\000\000\00259\000\00550", !464, !"_ZTS9btVector3", !535, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 550] [public] [getZ]
!539 = !{!"0x2e\00setX\00setX\00_ZN9btVector34setXEf\00552\000\000\000\000\00259\000\00552", !464, !"_ZTS9btVector3", !540, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 552] [public] [setX]
!540 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !541, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!541 = !{null, !481, !61}
!542 = !{!"0x2e\00setY\00setY\00_ZN9btVector34setYEf\00554\000\000\000\000\00259\000\00554", !464, !"_ZTS9btVector3", !540, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 554] [public] [setY]
!543 = !{!"0x2e\00setZ\00setZ\00_ZN9btVector34setZEf\00556\000\000\000\000\00259\000\00556", !464, !"_ZTS9btVector3", !540, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 556] [public] [setZ]
!544 = !{!"0x2e\00setW\00setW\00_ZN9btVector34setWEf\00558\000\000\000\000\00259\000\00558", !464, !"_ZTS9btVector3", !540, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 558] [public] [setW]
!545 = !{!"0x2e\00x\00x\00_ZNK9btVector31xEv\00560\000\000\000\000\00259\000\00560", !464, !"_ZTS9btVector3", !535, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 560] [public] [x]
!546 = !{!"0x2e\00y\00y\00_ZNK9btVector31yEv\00562\000\000\000\000\00259\000\00562", !464, !"_ZTS9btVector3", !535, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 562] [public] [y]
!547 = !{!"0x2e\00z\00z\00_ZNK9btVector31zEv\00564\000\000\000\000\00259\000\00564", !464, !"_ZTS9btVector3", !535, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 564] [public] [z]
!548 = !{!"0x2e\00w\00w\00_ZNK9btVector31wEv\00566\000\000\000\000\00259\000\00566", !464, !"_ZTS9btVector3", !535, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 566] [public] [w]
!549 = !{!"0x2e\00operator float *\00operator float *\00_ZN9btVector3cvPfEv\00571\000\000\000\000\00259\000\00571", !464, !"_ZTS9btVector3", !550, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 571] [public] [operator float *]
!550 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !551, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!551 = !{!313, !481}
!552 = !{!"0x2e\00operator const float *\00operator const float *\00_ZNK9btVector3cvPKfEv\00572\000\000\000\000\00259\000\00572", !464, !"_ZTS9btVector3", !553, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 572] [public] [operator const float *]
!553 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !554, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!554 = !{!308, !496}
!555 = !{!"0x2e\00operator==\00operator==\00_ZNK9btVector3eqERKS_\00574\000\000\000\000\00259\000\00574", !464, !"_ZTS9btVector3", !556, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 574] [public] [operator==]
!556 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !557, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!557 = !{!66, !496, !99}
!558 = !{!"0x2e\00operator!=\00operator!=\00_ZNK9btVector3neERKS_\00586\000\000\000\000\00259\000\00586", !464, !"_ZTS9btVector3", !556, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 586] [public] [operator!=]
!559 = !{!"0x2e\00setMax\00setMax\00_ZN9btVector36setMaxERKS_\00594\000\000\000\000\00259\000\00594", !464, !"_ZTS9btVector3", !560, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 594] [public] [setMax]
!560 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !561, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!561 = !{null, !481, !99}
!562 = !{!"0x2e\00setMin\00setMin\00_ZN9btVector36setMinERKS_\00611\000\000\000\000\00259\000\00611", !464, !"_ZTS9btVector3", !560, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 611] [public] [setMin]
!563 = !{!"0x2e\00setValue\00setValue\00_ZN9btVector38setValueERKfS1_S1_\00625\000\000\000\000\00259\000\00625", !464, !"_ZTS9btVector3", !483, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 625] [public] [setValue]
!564 = !{!"0x2e\00getSkewSymmetricMatrix\00getSkewSymmetricMatrix\00_ZNK9btVector322getSkewSymmetricMatrixEPS_S0_S0_\00633\000\000\000\000\00259\000\00633", !464, !"_ZTS9btVector3", !565, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 633] [public] [getSkewSymmetricMatrix]
!565 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !566, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!566 = !{null, !496, !205, !205, !205}
!567 = !{!"0x2e\00setZero\00setZero\00_ZN9btVector37setZeroEv\00656\000\000\000\000\00259\000\00656", !464, !"_ZTS9btVector3", !479, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 656] [public] [setZero]
!568 = !{!"0x2e\00isZero\00isZero\00_ZNK9btVector36isZeroEv\00668\000\000\000\000\00259\000\00668", !464, !"_ZTS9btVector3", !569, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 668] [public] [isZero]
!569 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !570, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!570 = !{!66, !496}
!571 = !{!"0x2e\00fuzzyZero\00fuzzyZero\00_ZNK9btVector39fuzzyZeroEv\00673\000\000\000\000\00259\000\00673", !464, !"_ZTS9btVector3", !569, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 673] [public] [fuzzyZero]
!572 = !{!"0x2e\00serialize\00serialize\00_ZNK9btVector39serializeER18btVector3FloatData\00678\000\000\000\000\00259\000\00678", !464, !"_ZTS9btVector3", !573, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 678] [public] [serialize]
!573 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !574, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!574 = !{null, !496, !575}
!575 = !{!"0x10\00\000\000\000\000\000", null, null, !"_ZTS18btVector3FloatData"} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from _ZTS18btVector3FloatData]
!576 = !{!"0x2e\00deSerialize\00deSerialize\00_ZN9btVector311deSerializeERK18btVector3FloatData\00680\000\000\000\000\00259\000\00680", !464, !"_ZTS9btVector3", !577, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 680] [public] [deSerialize]
!577 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !578, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!578 = !{null, !481, !579}
!579 = !{!"0x10\00\000\000\000\000\000", null, null, !580} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from ]
!580 = !{!"0x26\00\000\000\000\000\000", null, null, !"_ZTS18btVector3FloatData"} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from _ZTS18btVector3FloatData]
!581 = !{!"0x2e\00serializeFloat\00serializeFloat\00_ZNK9btVector314serializeFloatER18btVector3FloatData\00682\000\000\000\000\00259\000\00682", !464, !"_ZTS9btVector3", !573, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 682] [public] [serializeFloat]
!582 = !{!"0x2e\00deSerializeFloat\00deSerializeFloat\00_ZN9btVector316deSerializeFloatERK18btVector3FloatData\00684\000\000\000\000\00259\000\00684", !464, !"_ZTS9btVector3", !577, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 684] [public] [deSerializeFloat]
!583 = !{!"0x2e\00serializeDouble\00serializeDouble\00_ZNK9btVector315serializeDoubleER19btVector3DoubleData\00686\000\000\000\000\00259\000\00686", !464, !"_ZTS9btVector3", !584, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 686] [public] [serializeDouble]
!584 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !585, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!585 = !{null, !496, !586}
!586 = !{!"0x10\00\000\000\000\000\000", null, null, !"_ZTS19btVector3DoubleData"} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from _ZTS19btVector3DoubleData]
!587 = !{!"0x2e\00deSerializeDouble\00deSerializeDouble\00_ZN9btVector317deSerializeDoubleERK19btVector3DoubleData\00688\000\000\000\000\00259\000\00688", !464, !"_ZTS9btVector3", !588, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 688] [public] [deSerializeDouble]
!588 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !589, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!589 = !{null, !481, !590}
!590 = !{!"0x10\00\000\000\000\000\000", null, null, !591} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from ]
!591 = !{!"0x26\00\000\000\000\000\000", null, null, !"_ZTS19btVector3DoubleData"} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from _ZTS19btVector3DoubleData]
!592 = !{!"0x2e\00maxDot\00maxDot\00_ZNK9btVector36maxDotEPKS_lRf\00694\000\000\000\000\00259\000\00694", !464, !"_ZTS9btVector3", !593, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 694] [public] [maxDot]
!593 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !594, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!594 = !{!595, !496, !596, !595, !415}
!595 = !{!"0x24\00long int\000\0064\0064\000\000\005", null, null} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!596 = !{!"0xf\00\000\0064\0064\000\000", null, null, !100} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!597 = !{!"0x2e\00minDot\00minDot\00_ZNK9btVector36minDotEPKS_lRf\00700\000\000\000\000\00259\000\00700", !464, !"_ZTS9btVector3", !593, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 700] [public] [minDot]
!598 = !{!"0x2e\00dot3\00dot3\00_ZNK9btVector34dot3ERKS_S1_S1_\00703\000\000\000\000\00259\000\00703", !464, !"_ZTS9btVector3", !599, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 703] [public] [dot3]
!599 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !600, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!600 = !{!"_ZTS9btVector3", !496, !99, !99, !99}
!601 = !{!"0x13\00btVector3FloatData\001291\00128\0032\000\000\000", !464, null, null, !602, null, null, !"_ZTS18btVector3FloatData"} ; [ DW_TAG_structure_type ] [btVector3FloatData] [line 1291, size 128, align 32, offset 0] [def] [from ]
!602 = !{!603}
!603 = !{!"0xd\00m_floats\001293\00128\0032\000\000", !464, !"_ZTS18btVector3FloatData", !604} ; [ DW_TAG_member ] [m_floats] [line 1293, size 128, align 32, offset 0] [from ]
!604 = !{!"0x1\00\000\00128\0032\000\000\000", null, null, !63, !468, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 128, align 32, offset 0] [from float]
!605 = !{!"0x13\00btVector3DoubleData\001296\00256\0064\000\000\000", !464, null, null, !606, null, null, !"_ZTS19btVector3DoubleData"} ; [ DW_TAG_structure_type ] [btVector3DoubleData] [line 1296, size 256, align 64, offset 0] [def] [from ]
!606 = !{!607}
!607 = !{!"0xd\00m_floats\001298\00256\0064\000\000", !464, !"_ZTS19btVector3DoubleData", !608} ; [ DW_TAG_member ] [m_floats] [line 1298, size 256, align 64, offset 0] [from ]
!608 = !{!"0x1\00\000\00256\0064\000\000\000", null, null, !609, !468, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 256, align 64, offset 0] [from double]
!609 = !{!"0x24\00double\000\0064\0064\000\000\004", null, null} ; [ DW_TAG_base_type ] [double] [line 0, size 64, align 64, offset 0, enc DW_ATE_float]
!610 = !{!"0x2\00btQuaternion\0042\00128\0032\000\000\000", !611, null, null, !612, null, null, !"_ZTS12btQuaternion"} ; [ DW_TAG_class_type ] [btQuaternion] [line 42, size 128, align 32, offset 0] [def] [from ]
!611 = !{!"../../LinearMath/btQuaternion.h", !"/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision"}
!612 = !{!613, !614, !618, !621, !624, !627, !628, !629, !630, !633, !634, !637, !638, !642, !645, !646, !649, !652, !653, !654, !657, !658, !659, !662, !663, !666, !667, !668, !669, !670, !673, !676}
!613 = !{!"0x1c\00\000\000\000\000\003", null, !"_ZTS12btQuaternion", !"_ZTS10btQuadWord"} ; [ DW_TAG_inheritance ] [line 0, size 0, align 0, offset 0] [public] [from _ZTS10btQuadWord]
!614 = !{!"0x2e\00btQuaternion\00btQuaternion\00\0045\000\000\000\000\00259\000\0045", !611, !"_ZTS12btQuaternion", !615, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 45] [public] [btQuaternion]
!615 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !616, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!616 = !{null, !617}
!617 = !{!"0xf\00\000\0064\0064\000\001088\00", null, null, !"_ZTS12btQuaternion"} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [artificial] [from _ZTS12btQuaternion]
!618 = !{!"0x2e\00btQuaternion\00btQuaternion\00\0074\000\000\000\000\00259\000\0074", !611, !"_ZTS12btQuaternion", !619, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 74] [public] [btQuaternion]
!619 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !620, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!620 = !{null, !617, !369, !369, !369, !369}
!621 = !{!"0x2e\00btQuaternion\00btQuaternion\00\0080\000\000\000\000\00259\000\0080", !611, !"_ZTS12btQuaternion", !622, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 80] [public] [btQuaternion]
!622 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !623, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!623 = !{null, !617, !99, !369}
!624 = !{!"0x2e\00btQuaternion\00btQuaternion\00\0088\000\000\000\000\00259\000\0088", !611, !"_ZTS12btQuaternion", !625, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 88] [public] [btQuaternion]
!625 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !626, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!626 = !{null, !617, !369, !369, !369}
!627 = !{!"0x2e\00setRotation\00setRotation\00_ZN12btQuaternion11setRotationERK9btVector3RKf\0099\000\000\000\000\00259\000\0099", !611, !"_ZTS12btQuaternion", !622, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 99] [public] [setRotation]
!628 = !{!"0x2e\00setEuler\00setEuler\00_ZN12btQuaternion8setEulerERKfS1_S1_\00111\000\000\000\000\00259\000\00111", !611, !"_ZTS12btQuaternion", !625, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 111] [public] [setEuler]
!629 = !{!"0x2e\00setEulerZYX\00setEulerZYX\00_ZN12btQuaternion11setEulerZYXERKfS1_S1_\00131\000\000\000\000\00259\000\00131", !611, !"_ZTS12btQuaternion", !625, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 131] [public] [setEulerZYX]
!630 = !{!"0x2e\00operator+=\00operator+=\00_ZN12btQuaternionpLERKS_\00149\000\000\000\000\00259\000\00149", !611, !"_ZTS12btQuaternion", !631, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 149] [public] [operator+=]
!631 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !632, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!632 = !{!411, !617, !262}
!633 = !{!"0x2e\00operator-=\00operator-=\00_ZN12btQuaternionmIERKS_\00166\000\000\000\000\00259\000\00166", !611, !"_ZTS12btQuaternion", !631, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 166] [public] [operator-=]
!634 = !{!"0x2e\00operator*=\00operator*=\00_ZN12btQuaternionmLERKf\00183\000\000\000\000\00259\000\00183", !611, !"_ZTS12btQuaternion", !635, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 183] [public] [operator*=]
!635 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !636, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!636 = !{!411, !617, !369}
!637 = !{!"0x2e\00operator*=\00operator*=\00_ZN12btQuaternionmLERKS_\00203\000\000\000\000\00259\000\00203", !611, !"_ZTS12btQuaternion", !631, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 203] [public] [operator*=]
!638 = !{!"0x2e\00dot\00dot\00_ZNK12btQuaternion3dotERKS_\00286\000\000\000\000\00259\000\00286", !611, !"_ZTS12btQuaternion", !639, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 286] [public] [dot]
!639 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !640, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!640 = !{!61, !641, !262}
!641 = !{!"0xf\00\000\0064\0064\000\001088\00", null, null, !263} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [artificial] [from ]
!642 = !{!"0x2e\00length2\00length2\00_ZNK12btQuaternion7length2Ev\00313\000\000\000\000\00259\000\00313", !611, !"_ZTS12btQuaternion", !643, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 313] [public] [length2]
!643 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !644, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!644 = !{!61, !641}
!645 = !{!"0x2e\00length\00length\00_ZNK12btQuaternion6lengthEv\00319\000\000\000\000\00259\000\00319", !611, !"_ZTS12btQuaternion", !643, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 319] [public] [length]
!646 = !{!"0x2e\00normalize\00normalize\00_ZN12btQuaternion9normalizeEv\00326\000\000\000\000\00259\000\00326", !611, !"_ZTS12btQuaternion", !647, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 326] [public] [normalize]
!647 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !648, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!648 = !{!411, !617}
!649 = !{!"0x2e\00operator*\00operator*\00_ZNK12btQuaternionmlERKf\00352\000\000\000\000\00259\000\00352", !611, !"_ZTS12btQuaternion", !650, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 352] [public] [operator*]
!650 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !651, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!651 = !{!"_ZTS12btQuaternion", !641, !369}
!652 = !{!"0x2e\00operator/\00operator/\00_ZNK12btQuaterniondvERKf\00368\000\000\000\000\00259\000\00368", !611, !"_ZTS12btQuaternion", !650, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 368] [public] [operator/]
!653 = !{!"0x2e\00operator/=\00operator/=\00_ZN12btQuaterniondVERKf\00376\000\000\000\000\00259\000\00376", !611, !"_ZTS12btQuaternion", !635, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 376] [public] [operator/=]
!654 = !{!"0x2e\00normalized\00normalized\00_ZNK12btQuaternion10normalizedEv\00383\000\000\000\000\00259\000\00383", !611, !"_ZTS12btQuaternion", !655, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 383] [public] [normalized]
!655 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !656, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!656 = !{!"_ZTS12btQuaternion", !641}
!657 = !{!"0x2e\00angle\00angle\00_ZNK12btQuaternion5angleERKS_\00389\000\000\000\000\00259\000\00389", !611, !"_ZTS12btQuaternion", !639, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 389] [public] [angle]
!658 = !{!"0x2e\00getAngle\00getAngle\00_ZNK12btQuaternion8getAngleEv\00396\000\000\000\000\00259\000\00396", !611, !"_ZTS12btQuaternion", !643, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 396] [public] [getAngle]
!659 = !{!"0x2e\00getAxis\00getAxis\00_ZNK12btQuaternion7getAxisEv\00403\000\000\000\000\00259\000\00403", !611, !"_ZTS12btQuaternion", !660, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 403] [public] [getAxis]
!660 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !661, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!661 = !{!"_ZTS9btVector3", !641}
!662 = !{!"0x2e\00inverse\00inverse\00_ZNK12btQuaternion7inverseEv\00414\000\000\000\000\00259\000\00414", !611, !"_ZTS12btQuaternion", !655, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 414] [public] [inverse]
!663 = !{!"0x2e\00operator+\00operator+\00_ZNK12btQuaternionplERKS_\00428\000\000\000\000\00259\000\00428", !611, !"_ZTS12btQuaternion", !664, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 428] [public] [operator+]
!664 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !665, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!665 = !{!"_ZTS12btQuaternion", !641, !262}
!666 = !{!"0x2e\00operator-\00operator-\00_ZNK12btQuaternionmiERKS_\00443\000\000\000\000\00259\000\00443", !611, !"_ZTS12btQuaternion", !664, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 443] [public] [operator-]
!667 = !{!"0x2e\00operator-\00operator-\00_ZNK12btQuaternionngEv\00457\000\000\000\000\00259\000\00457", !611, !"_ZTS12btQuaternion", !655, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 457] [public] [operator-]
!668 = !{!"0x2e\00farthest\00farthest\00_ZNK12btQuaternion8farthestERKS_\00469\000\000\000\000\00259\000\00469", !611, !"_ZTS12btQuaternion", !664, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 469] [public] [farthest]
!669 = !{!"0x2e\00nearest\00nearest\00_ZNK12btQuaternion7nearestERKS_\00480\000\000\000\000\00259\000\00480", !611, !"_ZTS12btQuaternion", !664, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 480] [public] [nearest]
!670 = !{!"0x2e\00slerp\00slerp\00_ZNK12btQuaternion5slerpERKS_RKf\00495\000\000\000\000\00259\000\00495", !611, !"_ZTS12btQuaternion", !671, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 495] [public] [slerp]
!671 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !672, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!672 = !{!"_ZTS12btQuaternion", !641, !262, !369}
!673 = !{!"0x2e\00getIdentity\00getIdentity\00_ZN12btQuaternion11getIdentityEv\00523\000\000\000\000\00259\000\00523", !611, !"_ZTS12btQuaternion", !674, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 523] [public] [getIdentity]
!674 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !675, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!675 = !{!262}
!676 = !{!"0x2e\00getW\00getW\00_ZNK12btQuaternion4getWEv\00529\000\000\000\000\00259\000\00529", !611, !"_ZTS12btQuaternion", !677, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 529] [public] [getW]
!677 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !678, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!678 = !{!369, !641}
!679 = !{!"0x2\00btQuadWord\0034\00128\0032\000\000\000", !680, null, null, !681, null, null, !"_ZTS10btQuadWord"} ; [ DW_TAG_class_type ] [btQuadWord] [line 34, size 128, align 32, offset 0] [def] [from ]
!680 = !{!"../../LinearMath/btQuadWord.h", !"/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision"}
!681 = !{!682, !683, !688, !689, !690, !694, !695, !696, !697, !698, !699, !700, !701, !704, !707, !711, !712, !715, !718, !721, !722, !723, !726}
!682 = !{!"0xd\00m_floats\0069\00128\0032\000\002", !680, !"_ZTS10btQuadWord", !467} ; [ DW_TAG_member ] [m_floats] [line 69, size 128, align 32, offset 0] [protected] [from ]
!683 = !{!"0x2e\00getX\00getX\00_ZNK10btQuadWord4getXEv\00102\000\000\000\000\00259\000\00102", !680, !"_ZTS10btQuadWord", !684, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 102] [public] [getX]
!684 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !685, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!685 = !{!369, !686}
!686 = !{!"0xf\00\000\0064\0064\000\001088\00", null, null, !687} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [artificial] [from ]
!687 = !{!"0x26\00\000\000\000\000\000", null, null, !"_ZTS10btQuadWord"} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from _ZTS10btQuadWord]
!688 = !{!"0x2e\00getY\00getY\00_ZNK10btQuadWord4getYEv\00104\000\000\000\000\00259\000\00104", !680, !"_ZTS10btQuadWord", !684, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 104] [public] [getY]
!689 = !{!"0x2e\00getZ\00getZ\00_ZNK10btQuadWord4getZEv\00106\000\000\000\000\00259\000\00106", !680, !"_ZTS10btQuadWord", !684, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 106] [public] [getZ]
!690 = !{!"0x2e\00setX\00setX\00_ZN10btQuadWord4setXEf\00108\000\000\000\000\00259\000\00108", !680, !"_ZTS10btQuadWord", !691, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 108] [public] [setX]
!691 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !692, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!692 = !{null, !693, !61}
!693 = !{!"0xf\00\000\0064\0064\000\001088\00", null, null, !"_ZTS10btQuadWord"} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [artificial] [from _ZTS10btQuadWord]
!694 = !{!"0x2e\00setY\00setY\00_ZN10btQuadWord4setYEf\00110\000\000\000\000\00259\000\00110", !680, !"_ZTS10btQuadWord", !691, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 110] [public] [setY]
!695 = !{!"0x2e\00setZ\00setZ\00_ZN10btQuadWord4setZEf\00112\000\000\000\000\00259\000\00112", !680, !"_ZTS10btQuadWord", !691, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 112] [public] [setZ]
!696 = !{!"0x2e\00setW\00setW\00_ZN10btQuadWord4setWEf\00114\000\000\000\000\00259\000\00114", !680, !"_ZTS10btQuadWord", !691, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 114] [public] [setW]
!697 = !{!"0x2e\00x\00x\00_ZNK10btQuadWord1xEv\00116\000\000\000\000\00259\000\00116", !680, !"_ZTS10btQuadWord", !684, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 116] [public] [x]
!698 = !{!"0x2e\00y\00y\00_ZNK10btQuadWord1yEv\00118\000\000\000\000\00259\000\00118", !680, !"_ZTS10btQuadWord", !684, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 118] [public] [y]
!699 = !{!"0x2e\00z\00z\00_ZNK10btQuadWord1zEv\00120\000\000\000\000\00259\000\00120", !680, !"_ZTS10btQuadWord", !684, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 120] [public] [z]
!700 = !{!"0x2e\00w\00w\00_ZNK10btQuadWord1wEv\00122\000\000\000\000\00259\000\00122", !680, !"_ZTS10btQuadWord", !684, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 122] [public] [w]
!701 = !{!"0x2e\00operator float *\00operator float *\00_ZN10btQuadWordcvPfEv\00127\000\000\000\000\00259\000\00127", !680, !"_ZTS10btQuadWord", !702, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 127] [public] [operator float *]
!702 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !703, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!703 = !{!313, !693}
!704 = !{!"0x2e\00operator const float *\00operator const float *\00_ZNK10btQuadWordcvPKfEv\00128\000\000\000\000\00259\000\00128", !680, !"_ZTS10btQuadWord", !705, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 128] [public] [operator const float *]
!705 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !706, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!706 = !{!308, !686}
!707 = !{!"0x2e\00operator==\00operator==\00_ZNK10btQuadWordeqERKS_\00130\000\000\000\000\00259\000\00130", !680, !"_ZTS10btQuadWord", !708, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 130] [public] [operator==]
!708 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !709, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!709 = !{!66, !686, !710}
!710 = !{!"0x10\00\000\000\000\000\000", null, null, !687} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from ]
!711 = !{!"0x2e\00operator!=\00operator!=\00_ZNK10btQuadWordneERKS_\00142\000\000\000\000\00259\000\00142", !680, !"_ZTS10btQuadWord", !708, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 142] [public] [operator!=]
!712 = !{!"0x2e\00setValue\00setValue\00_ZN10btQuadWord8setValueERKfS1_S1_\00152\000\000\000\000\00259\000\00152", !680, !"_ZTS10btQuadWord", !713, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 152] [public] [setValue]
!713 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !714, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!714 = !{null, !693, !369, !369, !369}
!715 = !{!"0x2e\00setValue\00setValue\00_ZN10btQuadWord8setValueERKfS1_S1_S1_\00173\000\000\000\000\00259\000\00173", !680, !"_ZTS10btQuadWord", !716, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 173] [public] [setValue]
!716 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !717, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!717 = !{null, !693, !369, !369, !369, !369}
!718 = !{!"0x2e\00btQuadWord\00btQuadWord\00\00181\000\000\000\000\00259\000\00181", !680, !"_ZTS10btQuadWord", !719, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 181] [public] [btQuadWord]
!719 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !720, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!720 = !{null, !693}
!721 = !{!"0x2e\00btQuadWord\00btQuadWord\00\00191\000\000\000\000\00259\000\00191", !680, !"_ZTS10btQuadWord", !713, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 191] [public] [btQuadWord]
!722 = !{!"0x2e\00btQuadWord\00btQuadWord\00\00202\000\000\000\000\00259\000\00202", !680, !"_ZTS10btQuadWord", !716, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 202] [public] [btQuadWord]
!723 = !{!"0x2e\00setMax\00setMax\00_ZN10btQuadWord6setMaxERKS_\00210\000\000\000\000\00259\000\00210", !680, !"_ZTS10btQuadWord", !724, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 210] [public] [setMax]
!724 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !725, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!725 = !{null, !693, !710}
!726 = !{!"0x2e\00setMin\00setMin\00_ZN10btQuadWord6setMinERKS_\00226\000\000\000\000\00259\000\00226", !680, !"_ZTS10btQuadWord", !724, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 226] [public] [setMin]
!727 = !{!"0x13\00btMatrix3x3FloatData\001316\00384\0032\000\000\000", !353, null, null, !728, null, null, !"_ZTS20btMatrix3x3FloatData"} ; [ DW_TAG_structure_type ] [btMatrix3x3FloatData] [line 1316, size 384, align 32, offset 0] [def] [from ]
!728 = !{!729}
!729 = !{!"0xd\00m_el\001318\00384\0032\000\000", !353, !"_ZTS20btMatrix3x3FloatData", !730} ; [ DW_TAG_member ] [m_el] [line 1318, size 384, align 32, offset 0] [from ]
!730 = !{!"0x1\00\000\00384\0032\000\000\000", null, null, !"_ZTS18btVector3FloatData", !357, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 384, align 32, offset 0] [from _ZTS18btVector3FloatData]
!731 = !{!"0x13\00btMatrix3x3DoubleData\001322\00768\0064\000\000\000", !353, null, null, !732, null, null, !"_ZTS21btMatrix3x3DoubleData"} ; [ DW_TAG_structure_type ] [btMatrix3x3DoubleData] [line 1322, size 768, align 64, offset 0] [def] [from ]
!732 = !{!733}
!733 = !{!"0xd\00m_el\001324\00768\0064\000\000", !353, !"_ZTS21btMatrix3x3DoubleData", !734} ; [ DW_TAG_member ] [m_el] [line 1324, size 768, align 64, offset 0] [from ]
!734 = !{!"0x1\00\000\00768\0064\000\000\000", null, null, !"_ZTS19btVector3DoubleData", !357, null, null, null} ; [ DW_TAG_array_type ] [line 0, size 768, align 64, offset 0] [from _ZTS19btVector3DoubleData]
!735 = !{!"0x13\00btTransformFloatData\00253\00512\0032\000\000\000", !251, null, null, !736, null, null, !"_ZTS20btTransformFloatData"} ; [ DW_TAG_structure_type ] [btTransformFloatData] [line 253, size 512, align 32, offset 0] [def] [from ]
!736 = !{!737, !738}
!737 = !{!"0xd\00m_basis\00255\00384\0032\000\000", !251, !"_ZTS20btTransformFloatData", !"_ZTS20btMatrix3x3FloatData"} ; [ DW_TAG_member ] [m_basis] [line 255, size 384, align 32, offset 0] [from _ZTS20btMatrix3x3FloatData]
!738 = !{!"0xd\00m_origin\00256\00128\0032\00384\000", !251, !"_ZTS20btTransformFloatData", !"_ZTS18btVector3FloatData"} ; [ DW_TAG_member ] [m_origin] [line 256, size 128, align 32, offset 384] [from _ZTS18btVector3FloatData]
!739 = !{!"0x13\00btTransformDoubleData\00259\001024\0064\000\000\000", !251, null, null, !740, null, null, !"_ZTS21btTransformDoubleData"} ; [ DW_TAG_structure_type ] [btTransformDoubleData] [line 259, size 1024, align 64, offset 0] [def] [from ]
!740 = !{!741, !742}
!741 = !{!"0xd\00m_basis\00261\00768\0064\000\000", !251, !"_ZTS21btTransformDoubleData", !"_ZTS21btMatrix3x3DoubleData"} ; [ DW_TAG_member ] [m_basis] [line 261, size 768, align 64, offset 0] [from _ZTS21btMatrix3x3DoubleData]
!742 = !{!"0xd\00m_origin\00262\00256\0064\00768\000", !251, !"_ZTS21btTransformDoubleData", !"_ZTS19btVector3DoubleData"} ; [ DW_TAG_member ] [m_origin] [line 262, size 256, align 64, offset 768] [from _ZTS19btVector3DoubleData]
!743 = !{!"0x2\00btStackAlloc\0022\000\000\000\004\000", !222, null, null, null, null, null, !"_ZTS12btStackAlloc"} ; [ DW_TAG_class_type ] [btStackAlloc] [line 22, size 0, align 0, offset 0] [decl] [from ]
!744 = !{!"0x13\00btSubSimplexClosestResult\0056\00320\0032\000\000\000", !118, null, null, !745, null, null, !"_ZTS25btSubSimplexClosestResult"} ; [ DW_TAG_structure_type ] [btSubSimplexClosestResult] [line 56, size 320, align 32, offset 0] [def] [from ]
!745 = !{!746, !747, !748, !749, !750, !754, !757}
!746 = !{!"0xd\00m_closestPointOnSimplex\0058\00128\0032\000\000", !118, !"_ZTS25btSubSimplexClosestResult", !"_ZTS9btVector3"} ; [ DW_TAG_member ] [m_closestPointOnSimplex] [line 58, size 128, align 32, offset 0] [from _ZTS9btVector3]
!747 = !{!"0xd\00m_usedVertices\0062\0016\0016\00128\000", !118, !"_ZTS25btSubSimplexClosestResult", !"_ZTS15btUsageBitfield"} ; [ DW_TAG_member ] [m_usedVertices] [line 62, size 16, align 16, offset 128] [from _ZTS15btUsageBitfield]
!748 = !{!"0xd\00m_barycentricCoords\0063\00128\0032\00160\000", !118, !"_ZTS25btSubSimplexClosestResult", !467} ; [ DW_TAG_member ] [m_barycentricCoords] [line 63, size 128, align 32, offset 160] [from ]
!749 = !{!"0xd\00m_degenerate\0064\008\008\00288\000", !118, !"_ZTS25btSubSimplexClosestResult", !66} ; [ DW_TAG_member ] [m_degenerate] [line 64, size 8, align 8, offset 288] [from bool]
!750 = !{!"0x2e\00reset\00reset\00_ZN25btSubSimplexClosestResult5resetEv\0066\000\000\000\000\00256\000\0066", !118, !"_ZTS25btSubSimplexClosestResult", !751, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 66] [reset]
!751 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !752, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!752 = !{null, !753}
!753 = !{!"0xf\00\000\0064\0064\000\001088\00", null, null, !"_ZTS25btSubSimplexClosestResult"} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [artificial] [from _ZTS25btSubSimplexClosestResult]
!754 = !{!"0x2e\00isValid\00isValid\00_ZN25btSubSimplexClosestResult7isValidEv\0072\000\000\000\000\00256\000\0072", !118, !"_ZTS25btSubSimplexClosestResult", !755, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 72] [isValid]
!755 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !756, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!756 = !{!66, !753}
!757 = !{!"0x2e\00setBarycentricCoordinates\00setBarycentricCoordinates\00_ZN25btSubSimplexClosestResult25setBarycentricCoordinatesEffff\0082\000\000\000\000\00256\000\0082", !118, !"_ZTS25btSubSimplexClosestResult", !758, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 82] [setBarycentricCoordinates]
!758 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !759, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!759 = !{null, !753, !61, !61, !61, !61}
!760 = !{!"0x13\00btUsageBitfield\0032\0016\0016\000\000\000", !118, null, null, !761, null, null, !"_ZTS15btUsageBitfield"} ; [ DW_TAG_structure_type ] [btUsageBitfield] [line 32, size 16, align 16, offset 0] [def] [from ]
!761 = !{!762, !764, !765, !766, !767, !768, !769, !770, !771, !775}
!762 = !{!"0xd\00usedVertexA\0045\001\0016\000\000", !118, !"_ZTS15btUsageBitfield", !763} ; [ DW_TAG_member ] [usedVertexA] [line 45, size 1, align 16, offset 0] [from unsigned short]
!763 = !{!"0x24\00unsigned short\000\0016\0016\000\000\007", null, null} ; [ DW_TAG_base_type ] [unsigned short] [line 0, size 16, align 16, offset 0, enc DW_ATE_unsigned]
!764 = !{!"0xd\00usedVertexB\0046\001\0016\001\000", !118, !"_ZTS15btUsageBitfield", !763} ; [ DW_TAG_member ] [usedVertexB] [line 46, size 1, align 16, offset 1] [from unsigned short]
!765 = !{!"0xd\00usedVertexC\0047\001\0016\002\000", !118, !"_ZTS15btUsageBitfield", !763} ; [ DW_TAG_member ] [usedVertexC] [line 47, size 1, align 16, offset 2] [from unsigned short]
!766 = !{!"0xd\00usedVertexD\0048\001\0016\003\000", !118, !"_ZTS15btUsageBitfield", !763} ; [ DW_TAG_member ] [usedVertexD] [line 48, size 1, align 16, offset 3] [from unsigned short]
!767 = !{!"0xd\00unused1\0049\001\0016\004\000", !118, !"_ZTS15btUsageBitfield", !763} ; [ DW_TAG_member ] [unused1] [line 49, size 1, align 16, offset 4] [from unsigned short]
!768 = !{!"0xd\00unused2\0050\001\0016\005\000", !118, !"_ZTS15btUsageBitfield", !763} ; [ DW_TAG_member ] [unused2] [line 50, size 1, align 16, offset 5] [from unsigned short]
!769 = !{!"0xd\00unused3\0051\001\0016\006\000", !118, !"_ZTS15btUsageBitfield", !763} ; [ DW_TAG_member ] [unused3] [line 51, size 1, align 16, offset 6] [from unsigned short]
!770 = !{!"0xd\00unused4\0052\001\0016\007\000", !118, !"_ZTS15btUsageBitfield", !763} ; [ DW_TAG_member ] [unused4] [line 52, size 1, align 16, offset 7] [from unsigned short]
!771 = !{!"0x2e\00btUsageBitfield\00btUsageBitfield\00\0033\000\000\000\000\00256\000\0033", !118, !"_ZTS15btUsageBitfield", !772, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 33] [btUsageBitfield]
!772 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !773, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!773 = !{null, !774}
!774 = !{!"0xf\00\000\0064\0064\000\001088\00", null, null, !"_ZTS15btUsageBitfield"} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [artificial] [from _ZTS15btUsageBitfield]
!775 = !{!"0x2e\00reset\00reset\00_ZN15btUsageBitfield5resetEv\0038\000\000\000\000\00256\000\0038", !118, !"_ZTS15btUsageBitfield", !772, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 38] [reset]
!776 = !{!"0x2\00btCollisionShape\0027\000\000\000\004\000", !777, null, null, null, null, null, !"_ZTS16btCollisionShape"} ; [ DW_TAG_class_type ] [btCollisionShape] [line 27, size 0, align 0, offset 0] [decl] [from ]
!777 = !{!"../../BulletCollision/CollisionShapes/btCollisionShape.h", !"/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision"}
!778 = !{!"0x13\00btBroadphaseProxy\0085\00512\0064\000\000\000", !4, null, null, !779, null, null, !"_ZTS17btBroadphaseProxy"} ; [ DW_TAG_structure_type ] [btBroadphaseProxy] [line 85, size 512, align 64, offset 0] [def] [from ]
!779 = !{!780, !781, !783, !784, !785, !786, !787, !788, !789, !790, !791, !792, !793, !794, !795, !796, !801, !805, !808, !811, !812, !813, !814, !815, !816, !817}
!780 = !{!"0xd\00m_clientObject\00103\0064\0064\000\000", !4, !"_ZTS17btBroadphaseProxy", !138} ; [ DW_TAG_member ] [m_clientObject] [line 103, size 64, align 64, offset 0] [from ]
!781 = !{!"0xd\00m_collisionFilterGroup\00104\0016\0016\0064\000", !4, !"_ZTS17btBroadphaseProxy", !782} ; [ DW_TAG_member ] [m_collisionFilterGroup] [line 104, size 16, align 16, offset 64] [from short]
!782 = !{!"0x24\00short\000\0016\0016\000\000\005", null, null} ; [ DW_TAG_base_type ] [short] [line 0, size 16, align 16, offset 0, enc DW_ATE_signed]
!783 = !{!"0xd\00m_collisionFilterMask\00105\0016\0016\0080\000", !4, !"_ZTS17btBroadphaseProxy", !782} ; [ DW_TAG_member ] [m_collisionFilterMask] [line 105, size 16, align 16, offset 80] [from short]
!784 = !{!"0xd\00m_multiSapParentProxy\00106\0064\0064\00128\000", !4, !"_ZTS17btBroadphaseProxy", !138} ; [ DW_TAG_member ] [m_multiSapParentProxy] [line 106, size 64, align 64, offset 128] [from ]
!785 = !{!"0xd\00m_uniqueId\00107\0032\0032\00192\000", !4, !"_ZTS17btBroadphaseProxy", !58} ; [ DW_TAG_member ] [m_uniqueId] [line 107, size 32, align 32, offset 192] [from int]
!786 = !{!"0xd\00m_aabbMin\00109\00128\0032\00224\000", !4, !"_ZTS17btBroadphaseProxy", !"_ZTS9btVector3"} ; [ DW_TAG_member ] [m_aabbMin] [line 109, size 128, align 32, offset 224] [from _ZTS9btVector3]
!787 = !{!"0xd\00m_aabbMax\00110\00128\0032\00352\000", !4, !"_ZTS17btBroadphaseProxy", !"_ZTS9btVector3"} ; [ DW_TAG_member ] [m_aabbMax] [line 110, size 128, align 32, offset 352] [from _ZTS9btVector3]
!788 = !{!"0x2e\00operator new\00operator new\00_ZN17btBroadphaseProxynwEm\0088\000\000\000\000\00256\000\0088", !4, !"_ZTS17btBroadphaseProxy", !136, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 88] [operator new]
!789 = !{!"0x2e\00operator delete\00operator delete\00_ZN17btBroadphaseProxydlEPv\0088\000\000\000\000\00256\000\0088", !4, !"_ZTS17btBroadphaseProxy", !143, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 88] [operator delete]
!790 = !{!"0x2e\00operator new\00operator new\00_ZN17btBroadphaseProxynwEmPv\0088\000\000\000\000\00256\000\0088", !4, !"_ZTS17btBroadphaseProxy", !146, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 88] [operator new]
!791 = !{!"0x2e\00operator delete\00operator delete\00_ZN17btBroadphaseProxydlEPvS0_\0088\000\000\000\000\00256\000\0088", !4, !"_ZTS17btBroadphaseProxy", !149, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 88] [operator delete]
!792 = !{!"0x2e\00operator new[]\00operator new[]\00_ZN17btBroadphaseProxynaEm\0088\000\000\000\000\00256\000\0088", !4, !"_ZTS17btBroadphaseProxy", !136, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 88] [operator new[]]
!793 = !{!"0x2e\00operator delete[]\00operator delete[]\00_ZN17btBroadphaseProxydaEPv\0088\000\000\000\000\00256\000\0088", !4, !"_ZTS17btBroadphaseProxy", !143, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 88] [operator delete[]]
!794 = !{!"0x2e\00operator new[]\00operator new[]\00_ZN17btBroadphaseProxynaEmPv\0088\000\000\000\000\00256\000\0088", !4, !"_ZTS17btBroadphaseProxy", !146, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 88] [operator new[]]
!795 = !{!"0x2e\00operator delete[]\00operator delete[]\00_ZN17btBroadphaseProxydaEPvS0_\0088\000\000\000\000\00256\000\0088", !4, !"_ZTS17btBroadphaseProxy", !149, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 88] [operator delete[]]
!796 = !{!"0x2e\00getUid\00getUid\00_ZNK17btBroadphaseProxy6getUidEv\00112\000\000\000\000\00256\000\00112", !4, !"_ZTS17btBroadphaseProxy", !797, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 112] [getUid]
!797 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !798, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!798 = !{!58, !799}
!799 = !{!"0xf\00\000\0064\0064\000\001088\00", null, null, !800} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [artificial] [from ]
!800 = !{!"0x26\00\000\000\000\000\000", null, null, !"_ZTS17btBroadphaseProxy"} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from _ZTS17btBroadphaseProxy]
!801 = !{!"0x2e\00btBroadphaseProxy\00btBroadphaseProxy\00\00118\000\000\000\000\00256\000\00118", !4, !"_ZTS17btBroadphaseProxy", !802, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 118] [btBroadphaseProxy]
!802 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !803, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!803 = !{null, !804}
!804 = !{!"0xf\00\000\0064\0064\000\001088\00", null, null, !"_ZTS17btBroadphaseProxy"} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [artificial] [from _ZTS17btBroadphaseProxy]
!805 = !{!"0x2e\00btBroadphaseProxy\00btBroadphaseProxy\00\00122\000\000\000\000\00256\000\00122", !4, !"_ZTS17btBroadphaseProxy", !806, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 122] [btBroadphaseProxy]
!806 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !807, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!807 = !{null, !804, !99, !99, !138, !782, !782, !138}
!808 = !{!"0x2e\00isPolyhedral\00isPolyhedral\00_ZN17btBroadphaseProxy12isPolyhedralEi\00134\000\000\000\000\00256\000\00134", !4, !"_ZTS17btBroadphaseProxy", !809, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 134] [isPolyhedral]
!809 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !810, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!810 = !{!66, !58}
!811 = !{!"0x2e\00isConvex\00isConvex\00_ZN17btBroadphaseProxy8isConvexEi\00139\000\000\000\000\00256\000\00139", !4, !"_ZTS17btBroadphaseProxy", !809, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 139] [isConvex]
!812 = !{!"0x2e\00isNonMoving\00isNonMoving\00_ZN17btBroadphaseProxy11isNonMovingEi\00144\000\000\000\000\00256\000\00144", !4, !"_ZTS17btBroadphaseProxy", !809, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 144] [isNonMoving]
!813 = !{!"0x2e\00isConcave\00isConcave\00_ZN17btBroadphaseProxy9isConcaveEi\00149\000\000\000\000\00256\000\00149", !4, !"_ZTS17btBroadphaseProxy", !809, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 149] [isConcave]
!814 = !{!"0x2e\00isCompound\00isCompound\00_ZN17btBroadphaseProxy10isCompoundEi\00154\000\000\000\000\00256\000\00154", !4, !"_ZTS17btBroadphaseProxy", !809, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 154] [isCompound]
!815 = !{!"0x2e\00isSoftBody\00isSoftBody\00_ZN17btBroadphaseProxy10isSoftBodyEi\00159\000\000\000\000\00256\000\00159", !4, !"_ZTS17btBroadphaseProxy", !809, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 159] [isSoftBody]
!816 = !{!"0x2e\00isInfinite\00isInfinite\00_ZN17btBroadphaseProxy10isInfiniteEi\00164\000\000\000\000\00256\000\00164", !4, !"_ZTS17btBroadphaseProxy", !809, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 164] [isInfinite]
!817 = !{!"0x2e\00isConvex2d\00isConvex2d\00_ZN17btBroadphaseProxy10isConvex2dEi\00169\000\000\000\000\00256\000\00169", !4, !"_ZTS17btBroadphaseProxy", !809, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 169] [isConvex2d]
!818 = !{!819, !821, !822, !823, !824, !825, !826, !827, !828, !829, !830, !831, !832, !836, !837, !838, !839, !843, !844, !845, !846, !847, !848, !851, !855, !856, !857, !858, !859, !860, !861, !862, !868, !869, !870, !871, !872, !875, !876, !877, !878, !879, !883, !884, !886}
!819 = !{!"0x2e\00btGjkPairDetector\00btGjkPairDetector\00_ZN17btGjkPairDetectorC2EPK13btConvexShapeS2_P22btVoronoiSimplexSolverP30btConvexPenetrationDepthSolver\0041\000\001\000\000\00256\000\0054", !1, !"_ZTS17btGjkPairDetector", !73, null, void (%class.btGjkPairDetector*, %class.btConvexShape*, %class.btConvexShape*, %class.btVoronoiSimplexSolver*, %class.btConvexPenetrationDepthSolver*)* @_ZN17btGjkPairDetectorC2EPK13btConvexShapeS2_P22btVoronoiSimplexSolverP30btConvexPenetrationDepthSolver, null, !72, !820} ; [ DW_TAG_subprogram ] [line 41] [def] [scope 54] [btGjkPairDetector]
!820 = !{}
!821 = !{!"0x2e\00btGjkPairDetector\00btGjkPairDetector\00_ZN17btGjkPairDetectorC2EPK13btConvexShapeS2_iiffP22btVoronoiSimplexSolverP30btConvexPenetrationDepthSolver\0056\000\001\000\000\00256\000\0069", !1, !"_ZTS17btGjkPairDetector", !77, null, void (%class.btGjkPairDetector*, %class.btConvexShape*, %class.btConvexShape*, i32, i32, float, float, %class.btVoronoiSimplexSolver*, %class.btConvexPenetrationDepthSolver*)* @_ZN17btGjkPairDetectorC2EPK13btConvexShapeS2_iiffP22btVoronoiSimplexSolverP30btConvexPenetrationDepthSolver, null, !76, !820} ; [ DW_TAG_subprogram ] [line 56] [def] [scope 69] [btGjkPairDetector]
!822 = !{!"0x2e\00getClosestPoints\00getClosestPoints\00_ZN17btGjkPairDetector16getClosestPointsERKN36btDiscreteCollisionDetectorInterface17ClosestPointInputERNS0_6ResultEP12btIDebugDrawb\0072\000\001\000\000\00256\000\0073", !1, !"_ZTS17btGjkPairDetector", !83, null, void (%class.btGjkPairDetector*, %"struct.btDiscreteCollisionDetectorInterface::ClosestPointInput"*, %"struct.btDiscreteCollisionDetectorInterface::Result"*, %class.btIDebugDraw*, i1)* @_ZN17btGjkPairDetector16getClosestPointsERKN36btDiscreteCollisionDetectorInterface17ClosestPointInputERNS0_6ResultEP12btIDebugDrawb, null, !82, !820} ; [ DW_TAG_subprogram ] [line 72] [def] [scope 73] [getClosestPoints]
!823 = !{!"0x2e\00getClosestPointsNonVirtual\00getClosestPointsNonVirtual\00_ZN17btGjkPairDetector26getClosestPointsNonVirtualERKN36btDiscreteCollisionDetectorInterface17ClosestPointInputERNS0_6ResultEP12btIDebugDraw\0082\000\001\000\000\00256\000\0084", !1, !"_ZTS17btGjkPairDetector", !90, null, void (%class.btGjkPairDetector*, %"struct.btDiscreteCollisionDetectorInterface::ClosestPointInput"*, %"struct.btDiscreteCollisionDetectorInterface::Result"*, %class.btIDebugDraw*)* @_ZN17btGjkPairDetector26getClosestPointsNonVirtualERKN36btDiscreteCollisionDetectorInterface17ClosestPointInputERNS0_6ResultEP12btIDebugDraw, null, !89, !820} ; [ DW_TAG_subprogram ] [line 82] [def] [scope 84] [getClosestPointsNonVirtual]
!824 = !{!"0x2e\00~btGjkPairDetector\00~btGjkPairDetector\00_ZN17btGjkPairDetectorD0Ev\0059\000\001\000\000\00256\000\0059", !45, !"_ZTS17btGjkPairDetector", !80, null, void (%class.btGjkPairDetector*)* @_ZN17btGjkPairDetectorD0Ev, null, !79, !820} ; [ DW_TAG_subprogram ] [line 59] [def] [~btGjkPairDetector]
!825 = !{!"0x2e\00~btGjkPairDetector\00~btGjkPairDetector\00_ZN17btGjkPairDetectorD2Ev\0059\000\001\000\000\00256\000\0059", !45, !"_ZTS17btGjkPairDetector", !80, null, void (%class.btGjkPairDetector*)* @_ZN17btGjkPairDetectorD2Ev, null, !79, !820} ; [ DW_TAG_subprogram ] [line 59] [def] [~btGjkPairDetector]
!826 = !{!"0x2e\00normalize\00normalize\00_ZN9btVector39normalizeEv\00286\000\001\000\000\00256\000\00287", !464, !"_ZTS9btVector3", !504, null, %class.btVector3* (%class.btVector3*)* @_ZN9btVector39normalizeEv, null, !506, !820} ; [ DW_TAG_subprogram ] [line 286] [def] [scope 287] [normalize]
!827 = !{!"0x2e\00length\00length\00_ZNK9btVector36lengthEv\00258\000\001\000\000\00256\000\00259", !464, !"_ZTS9btVector3", !498, null, float (%class.btVector3*)* @_ZNK9btVector36lengthEv, null, !500, !820} ; [ DW_TAG_subprogram ] [line 258] [def] [scope 259] [length]
!828 = !{!"0x2e\00operator/=\00operator/=\00_ZN9btVector3dVERKf\00210\000\001\000\000\00256\000\00211", !464, !"_ZTS9btVector3", !490, null, %class.btVector3* (%class.btVector3*, float*)* @_ZN9btVector3dVERKf, null, !492, !820} ; [ DW_TAG_subprogram ] [line 210] [def] [scope 211] [operator/=]
!829 = !{!"0x2e\00setZero\00setZero\00_ZN9btVector37setZeroEv\00656\000\001\000\000\00256\000\00657", !464, !"_ZTS9btVector3", !479, null, void (%class.btVector3*)* @_ZN9btVector37setZeroEv, null, !567, !820} ; [ DW_TAG_subprogram ] [line 656] [def] [scope 657] [setZero]
!830 = !{!"0x2e\00operator+=\00operator+=\00_ZN9btVector3pLERKS_\00159\000\001\000\000\00256\000\00160", !464, !"_ZTS9btVector3", !486, null, %class.btVector3* (%class.btVector3*, %class.btVector3*)* @_ZN9btVector3pLERKS_, null, !485, !820} ; [ DW_TAG_subprogram ] [line 159] [def] [scope 160] [operator+=]
!831 = !{!"0x2e\00operator*=\00operator*=\00_ZN9btVector3mLERKf\00192\000\001\000\000\00256\000\00193", !464, !"_ZTS9btVector3", !490, null, %class.btVector3* (%class.btVector3*, float*)* @_ZN9btVector3mLERKf, null, !489, !820} ; [ DW_TAG_subprogram ] [line 192] [def] [scope 193] [operator*=]
!832 = !{!"0x2e\00btSqrt\00btSqrt\00_Z6btSqrtf\00359\000\001\000\000\00256\000\00360", !62, !833, !834, null, float (float)* @_Z6btSqrtf, null, null, !820} ; [ DW_TAG_subprogram ] [line 359] [def] [scope 360] [btSqrt]
!833 = !{!"0x29", !62}                            ; [ DW_TAG_file_type ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/../../LinearMath/btScalar.h]
!834 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !835, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!835 = !{!61, !61}
!836 = !{!"0x2e\00fullSimplex\00fullSimplex\00_ZNK22btVoronoiSimplexSolver11fullSimplexEv\00157\000\001\000\000\00256\000\00158", !118, !"_ZTS22btVoronoiSimplexSolver", !200, null, i1 (%class.btVoronoiSimplexSolver*)* @_ZNK22btVoronoiSimplexSolver11fullSimplexEv, null, !199, !820} ; [ DW_TAG_subprogram ] [line 157] [def] [scope 158] [fullSimplex]
!837 = !{!"0x2e\00length2\00length2\00_ZNK9btVector37length2Ev\00252\000\001\000\000\00256\000\00253", !464, !"_ZTS9btVector3", !498, null, float (%class.btVector3*)* @_ZNK9btVector37length2Ev, null, !497, !820} ; [ DW_TAG_subprogram ] [line 252] [def] [scope 253] [length2]
!838 = !{!"0x2e\00dot\00dot\00_ZNK9btVector33dotERKS_\00230\000\001\000\000\00256\000\00231", !464, !"_ZTS9btVector3", !494, null, float (%class.btVector3*, %class.btVector3*)* @_ZNK9btVector33dotERKS_, null, !493, !820} ; [ DW_TAG_subprogram ] [line 230] [def] [scope 231] [dot]
!839 = !{!"0x2e\00operator-\00operator-\00_ZmiRK9btVector3S1_\00769\000\001\000\000\00256\000\00770", !464, !840, !841, null, { <2 x float>, <2 x float> } (%class.btVector3*, %class.btVector3*)* @_ZmiRK9btVector3S1_, null, null, !820} ; [ DW_TAG_subprogram ] [line 769] [def] [scope 770] [operator-]
!840 = !{!"0x29", !464}                           ; [ DW_TAG_file_type ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/../../LinearMath/btVector3.h]
!841 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !842, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!842 = !{!"_ZTS9btVector3", !99, !99}
!843 = !{!"0x2e\00operator float *\00operator float *\00_ZN9btVector3cvPfEv\00571\000\001\000\000\00256\000\00571", !464, !"_ZTS9btVector3", !550, null, float* (%class.btVector3*)* @_ZN9btVector3cvPfEv, null, !549, !820} ; [ DW_TAG_subprogram ] [line 571] [def] [operator float *]
!844 = !{!"0x2e\00operator()\00operator()\00_ZNK11btTransformclERK9btVector3\0094\000\001\000\000\00256\000\0095", !251, !"_ZTS11btTransform", !282, null, { <2 x float>, <2 x float> } (%class.btTransform*, %class.btVector3*)* @_ZNK11btTransformclERK9btVector3, null, !281, !820} ; [ DW_TAG_subprogram ] [line 94] [def] [scope 95] [operator()]
!845 = !{!"0x2e\00operator[]\00operator[]\00_ZNK11btMatrix3x3ixEi\00153\000\001\000\000\00256\000\00154", !353, !"_ZTS11btMatrix3x3", !381, null, %class.btVector3* (%class.btMatrix3x3*, i32)* @_ZNK11btMatrix3x3ixEi, null, !386, !820} ; [ DW_TAG_subprogram ] [line 153] [def] [scope 154] [operator[]]
!846 = !{!"0x2e\00dot3\00dot3\00_ZNK9btVector34dot3ERKS_S1_S1_\00703\000\001\000\000\00256\000\00704", !464, !"_ZTS9btVector3", !599, null, { <2 x float>, <2 x float> } (%class.btVector3*, %class.btVector3*, %class.btVector3*, %class.btVector3*)* @_ZNK9btVector34dot3ERKS_S1_S1_, null, !598, !820} ; [ DW_TAG_subprogram ] [line 703] [def] [scope 704] [dot3]
!847 = !{!"0x2e\00getBasis\00getBasis\00_ZNK11btTransform8getBasisEv\00114\000\001\000\000\00256\000\00114", !251, !"_ZTS11btTransform", !294, null, %class.btMatrix3x3* (%class.btTransform*)* @_ZNK11btTransform8getBasisEv, null, !293, !820} ; [ DW_TAG_subprogram ] [line 114] [def] [getBasis]
!848 = !{!"0x2e\00operator-\00operator-\00_ZngRK9btVector3\00789\000\001\000\000\00256\000\00790", !464, !840, !849, null, { <2 x float>, <2 x float> } (%class.btVector3*)* @_ZngRK9btVector3, null, null, !820} ; [ DW_TAG_subprogram ] [line 789] [def] [scope 790] [operator-]
!849 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !850, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!850 = !{!"_ZTS9btVector3", !99}
!851 = !{!"0x2e\00operator*\00operator*\00_ZmlRK9btVector3RK11btMatrix3x3\001152\000\001\000\000\00256\000\001153", !353, !852, !853, null, { <2 x float>, <2 x float> } (%class.btVector3*, %class.btMatrix3x3*)* @_ZmlRK9btVector3RK11btMatrix3x3, null, null, !820} ; [ DW_TAG_subprogram ] [line 1152] [def] [scope 1153] [operator*]
!852 = !{!"0x29", !353}                           ; [ DW_TAG_file_type ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/../../LinearMath/btMatrix3x3.h]
!853 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !854, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!854 = !{!"_ZTS9btVector3", !99, !267}
!855 = !{!"0x2e\00tdotz\00tdotz\00_ZNK11btMatrix3x35tdotzERK9btVector3\00619\000\001\000\000\00256\000\00620", !353, !"_ZTS11btMatrix3x3", !437, null, float (%class.btMatrix3x3*, %class.btVector3*)* @_ZNK11btMatrix3x35tdotzERK9btVector3, null, !440, !820} ; [ DW_TAG_subprogram ] [line 619] [def] [scope 620] [tdotz]
!856 = !{!"0x2e\00y\00y\00_ZNK9btVector31yEv\00562\000\001\000\000\00256\000\00562", !464, !"_ZTS9btVector3", !535, null, float* (%class.btVector3*)* @_ZNK9btVector31yEv, null, !546, !820} ; [ DW_TAG_subprogram ] [line 562] [def] [y]
!857 = !{!"0x2e\00x\00x\00_ZNK9btVector31xEv\00560\000\001\000\000\00256\000\00560", !464, !"_ZTS9btVector3", !535, null, float* (%class.btVector3*)* @_ZNK9btVector31xEv, null, !545, !820} ; [ DW_TAG_subprogram ] [line 560] [def] [x]
!858 = !{!"0x2e\00z\00z\00_ZNK9btVector31zEv\00564\000\001\000\000\00256\000\00564", !464, !"_ZTS9btVector3", !535, null, float* (%class.btVector3*)* @_ZNK9btVector31zEv, null, !547, !820} ; [ DW_TAG_subprogram ] [line 564] [def] [z]
!859 = !{!"0x2e\00tdoty\00tdoty\00_ZNK11btMatrix3x35tdotyERK9btVector3\00615\000\001\000\000\00256\000\00616", !353, !"_ZTS11btMatrix3x3", !437, null, float (%class.btMatrix3x3*, %class.btVector3*)* @_ZNK11btMatrix3x35tdotyERK9btVector3, null, !439, !820} ; [ DW_TAG_subprogram ] [line 615] [def] [scope 616] [tdoty]
!860 = !{!"0x2e\00tdotx\00tdotx\00_ZNK11btMatrix3x35tdotxERK9btVector3\00611\000\001\000\000\00256\000\00612", !353, !"_ZTS11btMatrix3x3", !437, null, float (%class.btMatrix3x3*, %class.btVector3*)* @_ZNK11btMatrix3x35tdotxERK9btVector3, null, !436, !820} ; [ DW_TAG_subprogram ] [line 611] [def] [scope 612] [tdotx]
!861 = !{!"0x2e\00setValue\00setValue\00_ZN9btVector38setValueERKfS1_S1_\00625\000\001\000\000\00256\000\00626", !464, !"_ZTS9btVector3", !483, null, void (%class.btVector3*, float*, float*, float*)* @_ZN9btVector38setValueERKfS1_S1_, null, !563, !820} ; [ DW_TAG_subprogram ] [line 625] [def] [scope 626] [setValue]
!862 = !{!"0x2e\00isConvex2d\00isConvex2d\00_ZNK16btCollisionShape10isConvex2dEv\0067\000\001\000\000\00256\000\0068", !777, !"_ZTS16btCollisionShape", !863, null, i1 (%class.btCollisionShape*)* @_ZNK16btCollisionShape10isConvex2dEv, null, !867, !820} ; [ DW_TAG_subprogram ] [line 67] [def] [scope 68] [isConvex2d]
!863 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !864, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!864 = !{!66, !865}
!865 = !{!"0xf\00\000\0064\0064\000\001088\00", null, null, !866} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [artificial] [from ]
!866 = !{!"0x26\00\000\000\000\000\000", null, null, !"_ZTS16btCollisionShape"} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from _ZTS16btCollisionShape]
!867 = !{!"0x2e\00isConvex2d\00isConvex2d\00_ZNK16btCollisionShape10isConvex2dEv\0067\000\000\000\000\00259\000\0067", !777, !"_ZTS16btCollisionShape", !863, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 67] [public] [isConvex2d]
!868 = !{!"0x2e\00isConvex2d\00isConvex2d\00_ZN17btBroadphaseProxy10isConvex2dEi\00169\000\001\000\000\00256\000\00170", !4, !"_ZTS17btBroadphaseProxy", !809, null, i1 (i32)* @_ZN17btBroadphaseProxy10isConvex2dEi, null, !817, !820} ; [ DW_TAG_subprogram ] [line 169] [def] [scope 170] [isConvex2d]
!869 = !{!"0x2e\00operator-=\00operator-=\00_ZN9btVector3mIERKS_\00176\000\001\000\000\00256\000\00177", !464, !"_ZTS9btVector3", !486, null, %class.btVector3* (%class.btVector3*, %class.btVector3*)* @_ZN9btVector3mIERKS_, null, !488, !820} ; [ DW_TAG_subprogram ] [line 176] [def] [scope 177] [operator-=]
!870 = !{!"0x2e\00getOrigin\00getOrigin\00_ZN11btTransform9getOriginEv\00117\000\001\000\000\00256\000\00117", !251, !"_ZTS11btTransform", !297, null, %class.btVector3* (%class.btTransform*)* @_ZN11btTransform9getOriginEv, null, !296, !820} ; [ DW_TAG_subprogram ] [line 117] [def] [getOrigin]
!871 = !{!"0x2e\00operator+\00operator+\00_ZplRK9btVector3S1_\00737\000\001\000\000\00256\000\00738", !464, !840, !841, null, { <2 x float>, <2 x float> } (%class.btVector3*, %class.btVector3*)* @_ZplRK9btVector3S1_, null, null, !820} ; [ DW_TAG_subprogram ] [line 737] [def] [scope 738] [operator+]
!872 = !{!"0x2e\00operator*\00operator*\00_ZmlRK9btVector3RKf\00803\000\001\000\000\00256\000\00804", !464, !840, !873, null, { <2 x float>, <2 x float> } (%class.btVector3*, float*)* @_ZmlRK9btVector3RKf, null, null, !820} ; [ DW_TAG_subprogram ] [line 803] [def] [scope 804] [operator*]
!873 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !874, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!874 = !{!"_ZTS9btVector3", !99, !369}
!875 = !{!"0x2e\00btTransform\00btTransform\00_ZN11btTransformC2ERKS_\0063\000\001\000\000\00256\000\0066", !251, !"_ZTS11btTransform", !270, null, void (%class.btTransform*, %class.btTransform*)* @_ZN11btTransformC2ERKS_, null, !269, !820} ; [ DW_TAG_subprogram ] [line 63] [def] [scope 66] [btTransform]
!876 = !{!"0x2e\00btMatrix3x3\00btMatrix3x3\00_ZN11btMatrix3x3C2ERKS_\00109\000\001\000\000\00256\000\00110", !353, !"_ZTS11btMatrix3x3", !371, null, void (%class.btMatrix3x3*, %class.btMatrix3x3*)* @_ZN11btMatrix3x3C2ERKS_, null, !370, !820} ; [ DW_TAG_subprogram ] [line 109] [def] [scope 110] [btMatrix3x3]
!877 = !{!"0x2e\00btVector3\00btVector3\00_ZN9btVector3C2Ev\00114\000\001\000\000\00256\000\00115", !464, !"_ZTS9btVector3", !479, null, void (%class.btVector3*)* @_ZN9btVector3C2Ev, null, !478, !820} ; [ DW_TAG_subprogram ] [line 114] [def] [scope 115] [btVector3]
!878 = !{!"0x2e\00~btDiscreteCollisionDetectorInterface\00~btDiscreteCollisionDetectorInterface\00_ZN36btDiscreteCollisionDetectorInterfaceD2Ev\0057\000\001\000\000\00256\000\0057", !222, !"_ZTS36btDiscreteCollisionDetectorInterface", !231, null, void (%struct.btDiscreteCollisionDetectorInterface*)* @_ZN36btDiscreteCollisionDetectorInterfaceD2Ev, null, !230, !820} ; [ DW_TAG_subprogram ] [line 57] [def] [~btDiscreteCollisionDetectorInterface]
!879 = !{!"0x2e\00getShapeType\00getShapeType\00_ZNK16btCollisionShape12getShapeTypeEv\00111\000\001\000\000\00256\000\00111", !777, !"_ZTS16btCollisionShape", !880, null, i32 (%class.btCollisionShape*)* @_ZNK16btCollisionShape12getShapeTypeEv, null, !882, !820} ; [ DW_TAG_subprogram ] [line 111] [def] [getShapeType]
!880 = !{!"0x15\00\000\000\000\000\000\000", null, null, null, !881, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!881 = !{!58, !865}
!882 = !{!"0x2e\00getShapeType\00getShapeType\00_ZNK16btCollisionShape12getShapeTypeEv\00111\000\000\000\000\00259\000\00111", !777, !"_ZTS16btCollisionShape", !880, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 111] [public] [getShapeType]
!883 = !{!"0x2e\00btVector3\00btVector3\00_ZN9btVector3C2ERKfS1_S1_\00126\000\001\000\000\00256\000\00127", !464, !"_ZTS9btVector3", !483, null, void (%class.btVector3*, float*, float*, float*)* @_ZN9btVector3C2ERKfS1_S1_, null, !482, !820} ; [ DW_TAG_subprogram ] [line 126] [def] [scope 127] [btVector3]
!884 = !{!"0x2e\00btDiscreteCollisionDetectorInterface\00btDiscreteCollisionDetectorInterface\00_ZN36btDiscreteCollisionDetectorInterfaceC2Ev\0029\000\001\000\000\00320\000\0029", !222, !"_ZTS36btDiscreteCollisionDetectorInterface", !231, null, void (%struct.btDiscreteCollisionDetectorInterface*)* @_ZN36btDiscreteCollisionDetectorInterfaceC2Ev, null, !885, !820} ; [ DW_TAG_subprogram ] [line 29] [def] [btDiscreteCollisionDetectorInterface]
!885 = !{!"0x2e\00btDiscreteCollisionDetectorInterface\00btDiscreteCollisionDetectorInterface\00\000\000\000\000\000\00320\000\000", null, !"_ZTS36btDiscreteCollisionDetectorInterface", !231, null, null, null, null, null} ; [ DW_TAG_subprogram ] [line 0] [btDiscreteCollisionDetectorInterface]
!886 = !{!"0x2e\00~btDiscreteCollisionDetectorInterface\00~btDiscreteCollisionDetectorInterface\00_ZN36btDiscreteCollisionDetectorInterfaceD0Ev\0057\000\001\000\000\00256\000\0057", !222, !"_ZTS36btDiscreteCollisionDetectorInterface", !231, null, void (%struct.btDiscreteCollisionDetectorInterface*)* @_ZN36btDiscreteCollisionDetectorInterfaceD0Ev, null, !230, !820} ; [ DW_TAG_subprogram ] [line 57] [def] [~btDiscreteCollisionDetectorInterface]
!887 = !{!888, !890}
!888 = !{!"0x34\00gNumDeepPenetrationChecks\00gNumDeepPenetrationChecks\00\0037\000\001", null, !889, !58, i32* @gNumDeepPenetrationChecks, null} ; [ DW_TAG_variable ] [gNumDeepPenetrationChecks] [line 37] [def]
!889 = !{!"0x29", !1}                             ; [ DW_TAG_file_type ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!890 = !{!"0x34\00gNumGjkChecks\00gNumGjkChecks\00\0038\000\001", null, !889, !58, i32* @gNumGjkChecks, null} ; [ DW_TAG_variable ] [gNumGjkChecks] [line 38] [def]
!891 = !{i32 2, !"Dwarf Version", i32 4}
!892 = !{i32 2, !"Debug Info Version", i32 2}
!893 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
!894 = !{!"0x101\00this\0016777216\001088", !819, null, !895} ; [ DW_TAG_arg_variable ] [this] [line 0]
!895 = !{!"0xf\00\000\0064\0064\000\000", null, null, !"_ZTS17btGjkPairDetector"} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _ZTS17btGjkPairDetector]
!896 = !{!"0x102"}                                ; [ DW_TAG_expression ]
!897 = !MDLocation(line: 0, scope: !819)
!898 = !{!"0x101\00objectA\0033554473\000", !819, !889, !54} ; [ DW_TAG_arg_variable ] [objectA] [line 41]
!899 = !MDLocation(line: 41, column: 59, scope: !819)
!900 = !{!"0x101\00objectB\0050331689\000", !819, !889, !54} ; [ DW_TAG_arg_variable ] [objectB] [line 41]
!901 = !MDLocation(line: 41, column: 88, scope: !819)
!902 = !{!"0x101\00simplexSolver\0067108905\000", !819, !889, !52} ; [ DW_TAG_arg_variable ] [simplexSolver] [line 41]
!903 = !MDLocation(line: 41, column: 122, scope: !819)
!904 = !{!"0x101\00penetrationDepthSolver\0083886121\000", !819, !889, !50} ; [ DW_TAG_arg_variable ] [penetrationDepthSolver] [line 41]
!905 = !MDLocation(line: 41, column: 168, scope: !819)
!906 = !MDLocation(line: 54, column: 1, scope: !819)
!907 = !MDLocation(line: 42, column: 2, scope: !819)
!908 = !MDLocation(line: 43, column: 1, scope: !819)
!909 = !MDLocation(line: 44, column: 1, scope: !819)
!910 = !MDLocation(line: 45, column: 1, scope: !819)
!911 = !MDLocation(line: 46, column: 1, scope: !819)
!912 = !MDLocation(line: 47, column: 1, scope: !819)
!913 = !MDLocation(line: 47, column: 14, scope: !819)
!914 = !MDLocation(line: 47, column: 1, scope: !915)
!915 = !{!"0xb\001", !1, !819}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!916 = !MDLocation(line: 48, column: 1, scope: !819)
!917 = !MDLocation(line: 48, column: 14, scope: !819)
!918 = !MDLocation(line: 48, column: 1, scope: !915)
!919 = !MDLocation(line: 49, column: 1, scope: !819)
!920 = !MDLocation(line: 49, column: 11, scope: !819)
!921 = !MDLocation(line: 49, column: 1, scope: !915)
!922 = !MDLocation(line: 50, column: 1, scope: !819)
!923 = !MDLocation(line: 50, column: 11, scope: !819)
!924 = !MDLocation(line: 50, column: 1, scope: !915)
!925 = !MDLocation(line: 51, column: 1, scope: !819)
!926 = !MDLocation(line: 52, column: 1, scope: !819)
!927 = !MDLocation(line: 53, column: 1, scope: !819)
!928 = !MDLocation(line: 55, column: 1, scope: !819)
!929 = !MDLocation(line: 55, column: 1, scope: !915)
!930 = !MDLocation(line: 55, column: 1, scope: !931)
!931 = !{!"0xb\003", !1, !819}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!932 = !MDLocation(line: 55, column: 1, scope: !933)
!933 = !{!"0xb\002", !1, !819}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!934 = !{!"0x101\00this\0016777216\001088", !884, null, !935} ; [ DW_TAG_arg_variable ] [this] [line 0]
!935 = !{!"0xf\00\000\0064\0064\000\000", null, null, !"_ZTS36btDiscreteCollisionDetectorInterface"} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _ZTS36btDiscreteCollisionDetectorInterface]
!936 = !MDLocation(line: 0, scope: !884)
!937 = !MDLocation(line: 29, column: 8, scope: !884)
!938 = !{!"0x101\00this\0016777216\001088", !883, null, !205} ; [ DW_TAG_arg_variable ] [this] [line 0]
!939 = !MDLocation(line: 0, scope: !883)
!940 = !{!"0x101\00_x\0033554558\000", !883, !840, !369} ; [ DW_TAG_arg_variable ] [_x] [line 126]
!941 = !MDLocation(line: 126, column: 46, scope: !883)
!942 = !{!"0x101\00_y\0050331774\000", !883, !840, !369} ; [ DW_TAG_arg_variable ] [_y] [line 126]
!943 = !MDLocation(line: 126, column: 66, scope: !883)
!944 = !{!"0x101\00_z\0067108990\000", !883, !840, !369} ; [ DW_TAG_arg_variable ] [_z] [line 126]
!945 = !MDLocation(line: 126, column: 86, scope: !883)
!946 = !MDLocation(line: 128, column: 17, scope: !947)
!947 = !{!"0xb\00127\002\0063", !464, !883}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/../../LinearMath/btVector3.h]
!948 = !MDLocation(line: 128, column: 3, scope: !947)
!949 = !MDLocation(line: 129, column: 17, scope: !947)
!950 = !MDLocation(line: 129, column: 3, scope: !947)
!951 = !MDLocation(line: 130, column: 17, scope: !947)
!952 = !MDLocation(line: 130, column: 3, scope: !947)
!953 = !MDLocation(line: 131, column: 3, scope: !947)
!954 = !MDLocation(line: 132, column: 2, scope: !883)
!955 = !{!"0x101\00this\0016777216\001088", !879, null, !956} ; [ DW_TAG_arg_variable ] [this] [line 0]
!956 = !{!"0xf\00\000\0064\0064\000\000", null, null, !866} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!957 = !MDLocation(line: 0, scope: !879)
!958 = !MDLocation(line: 111, column: 37, scope: !879)
!959 = !MDLocation(line: 111, column: 30, scope: !879)
!960 = !{!"0x101\00this\0016777216\001088", !821, null, !895} ; [ DW_TAG_arg_variable ] [this] [line 0]
!961 = !MDLocation(line: 0, scope: !821)
!962 = !{!"0x101\00objectA\0033554488\000", !821, !889, !54} ; [ DW_TAG_arg_variable ] [objectA] [line 56]
!963 = !MDLocation(line: 56, column: 59, scope: !821)
!964 = !{!"0x101\00objectB\0050331704\000", !821, !889, !54} ; [ DW_TAG_arg_variable ] [objectB] [line 56]
!965 = !MDLocation(line: 56, column: 88, scope: !821)
!966 = !{!"0x101\00shapeTypeA\0067108920\000", !821, !889, !58} ; [ DW_TAG_arg_variable ] [shapeTypeA] [line 56]
!967 = !MDLocation(line: 56, column: 100, scope: !821)
!968 = !{!"0x101\00shapeTypeB\0083886136\000", !821, !889, !58} ; [ DW_TAG_arg_variable ] [shapeTypeB] [line 56]
!969 = !MDLocation(line: 56, column: 115, scope: !821)
!970 = !{!"0x101\00marginA\00100663352\000", !821, !889, !61} ; [ DW_TAG_arg_variable ] [marginA] [line 56]
!971 = !MDLocation(line: 56, column: 135, scope: !821)
!972 = !{!"0x101\00marginB\00117440568\000", !821, !889, !61} ; [ DW_TAG_arg_variable ] [marginB] [line 56]
!973 = !MDLocation(line: 56, column: 153, scope: !821)
!974 = !{!"0x101\00simplexSolver\00134217784\000", !821, !889, !52} ; [ DW_TAG_arg_variable ] [simplexSolver] [line 56]
!975 = !MDLocation(line: 56, column: 188, scope: !821)
!976 = !{!"0x101\00penetrationDepthSolver\00150995000\000", !821, !889, !50} ; [ DW_TAG_arg_variable ] [penetrationDepthSolver] [line 56]
!977 = !MDLocation(line: 56, column: 234, scope: !821)
!978 = !MDLocation(line: 69, column: 1, scope: !821)
!979 = !MDLocation(line: 57, column: 2, scope: !821)
!980 = !MDLocation(line: 58, column: 1, scope: !821)
!981 = !MDLocation(line: 59, column: 1, scope: !821)
!982 = !MDLocation(line: 60, column: 1, scope: !821)
!983 = !MDLocation(line: 61, column: 1, scope: !821)
!984 = !MDLocation(line: 62, column: 1, scope: !821)
!985 = !MDLocation(line: 63, column: 1, scope: !821)
!986 = !MDLocation(line: 64, column: 1, scope: !821)
!987 = !MDLocation(line: 65, column: 1, scope: !821)
!988 = !MDLocation(line: 66, column: 1, scope: !821)
!989 = !MDLocation(line: 67, column: 1, scope: !821)
!990 = !MDLocation(line: 68, column: 1, scope: !821)
!991 = !MDLocation(line: 70, column: 1, scope: !821)
!992 = !MDLocation(line: 70, column: 1, scope: !993)
!993 = !{!"0xb\001", !1, !821}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!994 = !MDLocation(line: 70, column: 1, scope: !995)
!995 = !{!"0xb\003", !1, !821}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!996 = !MDLocation(line: 70, column: 1, scope: !997)
!997 = !{!"0xb\002", !1, !821}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!998 = !{!"0x101\00this\0016777216\001088", !822, null, !895} ; [ DW_TAG_arg_variable ] [this] [line 0]
!999 = !MDLocation(line: 0, scope: !822)
!1000 = !{!"0x101\00input\0033554504\000", !822, !889, !85} ; [ DW_TAG_arg_variable ] [input] [line 72]
!1001 = !MDLocation(line: 72, column: 67, scope: !822)
!1002 = !{!"0x101\00output\0050331720\000", !822, !889, !87} ; [ DW_TAG_arg_variable ] [output] [line 72]
!1003 = !MDLocation(line: 72, column: 81, scope: !822)
!1004 = !{!"0x101\00debugDraw\0067108936\000", !822, !889, !88} ; [ DW_TAG_arg_variable ] [debugDraw] [line 72]
!1005 = !MDLocation(line: 72, column: 108, scope: !822)
!1006 = !{!"0x101\00swapResults\0083886152\000", !822, !889, !66} ; [ DW_TAG_arg_variable ] [swapResults] [line 72]
!1007 = !MDLocation(line: 72, column: 123, scope: !822)
!1008 = !MDLocation(line: 76, column: 2, scope: !822)
!1009 = !MDLocation(line: 77, column: 1, scope: !822)
!1010 = !{!"0x101\00this\0016777216\001088", !823, null, !895} ; [ DW_TAG_arg_variable ] [this] [line 0]
!1011 = !MDLocation(line: 0, scope: !823)
!1012 = !{!"0x101\00input\0033554514\000", !823, !889, !85} ; [ DW_TAG_arg_variable ] [input] [line 82]
!1013 = !MDLocation(line: 82, column: 77, scope: !823)
!1014 = !{!"0x101\00output\0050331730\000", !823, !889, !87} ; [ DW_TAG_arg_variable ] [output] [line 82]
!1015 = !MDLocation(line: 82, column: 91, scope: !823)
!1016 = !{!"0x101\00debugDraw\0067108946\000", !823, !889, !88} ; [ DW_TAG_arg_variable ] [debugDraw] [line 82]
!1017 = !MDLocation(line: 82, column: 118, scope: !823)
!1018 = !MDLocation(line: 85, column: 2, scope: !823)
!1019 = !{!"0x100\00distance\0087\000", !823, !889, !61} ; [ DW_TAG_auto_variable ] [distance] [line 87]
!1020 = !MDLocation(line: 87, column: 11, scope: !823)
!1021 = !{!"0x100\00normalInB\0088\000", !823, !889, !"_ZTS9btVector3"} ; [ DW_TAG_auto_variable ] [normalInB] [line 88]
!1022 = !MDLocation(line: 88, column: 12, scope: !823)
!1023 = !{!"0x100\00pointOnA\0089\000", !823, !889, !"_ZTS9btVector3"} ; [ DW_TAG_auto_variable ] [pointOnA] [line 89]
!1024 = !MDLocation(line: 89, column: 12, scope: !823)
!1025 = !{!"0x100\00pointOnB\0089\000", !823, !889, !"_ZTS9btVector3"} ; [ DW_TAG_auto_variable ] [pointOnB] [line 89]
!1026 = !MDLocation(line: 89, column: 21, scope: !823)
!1027 = !{!"0x100\00localTransA\0090\000", !823, !889, !"_ZTS11btTransform"} ; [ DW_TAG_auto_variable ] [localTransA] [line 90]
!1028 = !MDLocation(line: 90, column: 14, scope: !823)
!1029 = !{!"0x100\00localTransB\0091\000", !823, !889, !"_ZTS11btTransform"} ; [ DW_TAG_auto_variable ] [localTransB] [line 91]
!1030 = !MDLocation(line: 91, column: 14, scope: !823)
!1031 = !{!"0x100\00positionOffset\0092\000", !823, !889, !"_ZTS9btVector3"} ; [ DW_TAG_auto_variable ] [positionOffset] [line 92]
!1032 = !MDLocation(line: 92, column: 12, scope: !823)
!1033 = !MDLocation(line: 92, column: 30, scope: !823)
!1034 = !MDLocation(line: 92, column: 56, scope: !823)
!1035 = !MDLocation(line: 92, column: 54, scope: !823)
!1036 = !MDLocation(line: 92, column: 81, scope: !823)
!1037 = !MDLocation(line: 93, column: 2, scope: !823)
!1038 = !MDLocation(line: 94, column: 2, scope: !823)
!1039 = !MDLocation(line: 96, column: 17, scope: !823)
!1040 = !MDLocation(line: 96, column: 47, scope: !1041)
!1041 = !{!"0xb\001", !1, !823}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1042 = !MDLocation(line: 96, column: 7, scope: !1043)
!1043 = !{!"0xb\002", !1, !823}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1044 = !{!"0x100\00check2d\0096\000", !823, !889, !66} ; [ DW_TAG_auto_variable ] [check2d] [line 96]
!1045 = !MDLocation(line: 96, column: 7, scope: !823)
!1046 = !{!"0x100\00marginA\0098\000", !823, !889, !61} ; [ DW_TAG_auto_variable ] [marginA] [line 98]
!1047 = !MDLocation(line: 98, column: 11, scope: !823)
!1048 = !MDLocation(line: 98, column: 21, scope: !823)
!1049 = !{!"0x100\00marginB\0099\000", !823, !889, !61} ; [ DW_TAG_auto_variable ] [marginB] [line 99]
!1050 = !MDLocation(line: 99, column: 11, scope: !823)
!1051 = !MDLocation(line: 99, column: 21, scope: !823)
!1052 = !MDLocation(line: 101, column: 2, scope: !823)
!1053 = !MDLocation(line: 107, column: 6, scope: !1054)
!1054 = !{!"0xb\00107\006\002", !1, !823}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1055 = !MDLocation(line: 107, column: 6, scope: !823)
!1056 = !MDLocation(line: 109, column: 3, scope: !1057)
!1057 = !{!"0xb\00108\002\003", !1, !1054}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1058 = !MDLocation(line: 110, column: 3, scope: !1057)
!1059 = !MDLocation(line: 114, column: 2, scope: !1057)
!1060 = !MDLocation(line: 116, column: 2, scope: !823)
!1061 = !{!"0x100\00gGjkMaxIter\00117\000", !823, !889, !58} ; [ DW_TAG_auto_variable ] [gGjkMaxIter] [line 117]
!1062 = !MDLocation(line: 117, column: 6, scope: !823)
!1063 = !MDLocation(line: 118, column: 2, scope: !823)
!1064 = !{!"0x100\00isValid\00120\000", !823, !889, !66} ; [ DW_TAG_auto_variable ] [isValid] [line 120]
!1065 = !MDLocation(line: 120, column: 7, scope: !823)
!1066 = !{!"0x100\00checkSimplex\00121\000", !823, !889, !66} ; [ DW_TAG_auto_variable ] [checkSimplex] [line 121]
!1067 = !MDLocation(line: 121, column: 7, scope: !823)
!1068 = !{!"0x100\00checkPenetration\00122\000", !823, !889, !66} ; [ DW_TAG_auto_variable ] [checkPenetration] [line 122]
!1069 = !MDLocation(line: 122, column: 7, scope: !823)
!1070 = !MDLocation(line: 123, column: 2, scope: !823)
!1071 = !MDLocation(line: 125, column: 2, scope: !823)
!1072 = !{!"0x100\00squaredDistance\00128\000", !1073, !889, !61} ; [ DW_TAG_auto_variable ] [squaredDistance] [line 128]
!1073 = !{!"0xb\00127\002\004", !1, !823}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1074 = !MDLocation(line: 128, column: 12, scope: !1073)
!1075 = !{!"0x100\00delta\00129\000", !1073, !889, !61} ; [ DW_TAG_auto_variable ] [delta] [line 129]
!1076 = !MDLocation(line: 129, column: 12, scope: !1073)
!1077 = !MDLocation(line: 131, column: 21, scope: !1073)
!1078 = !MDLocation(line: 131, column: 31, scope: !1073)
!1079 = !{!"0x100\00margin\00131\000", !1073, !889, !61} ; [ DW_TAG_auto_variable ] [margin] [line 131]
!1080 = !MDLocation(line: 131, column: 12, scope: !1073)
!1081 = !MDLocation(line: 135, column: 3, scope: !1073)
!1082 = !MDLocation(line: 137, column: 3, scope: !1073)
!1083 = !{!"0x100\00seperatingAxisInA\00141\000", !1084, !889, !"_ZTS9btVector3"} ; [ DW_TAG_auto_variable ] [seperatingAxisInA] [line 141]
!1084 = !{!"0xb\00139\003\007", !1, !1085}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1085 = !{!"0xb\00137\003\006", !1, !1086}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1086 = !{!"0xb\00137\003\005", !1, !1073}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1087 = !MDLocation(line: 141, column: 14, scope: !1084)
!1088 = !MDLocation(line: 141, column: 35, scope: !1084)
!1089 = !MDLocation(line: 141, column: 61, scope: !1084)
!1090 = !MDLocation(line: 141, column: 59, scope: !1084)
!1091 = !{!"0x100\00seperatingAxisInB\00142\000", !1084, !889, !"_ZTS9btVector3"} ; [ DW_TAG_auto_variable ] [seperatingAxisInB] [line 142]
!1092 = !MDLocation(line: 142, column: 14, scope: !1084)
!1093 = !MDLocation(line: 142, column: 34, scope: !1084)
!1094 = !MDLocation(line: 142, column: 58, scope: !1084)
!1095 = !MDLocation(line: 142, column: 56, scope: !1084)
!1096 = !{!"0x100\00pInA\00146\000", !1084, !889, !"_ZTS9btVector3"} ; [ DW_TAG_auto_variable ] [pInA] [line 146]
!1097 = !MDLocation(line: 146, column: 14, scope: !1084)
!1098 = !MDLocation(line: 146, column: 21, scope: !1084)
!1099 = !{!"0x100\00qInB\00147\000", !1084, !889, !"_ZTS9btVector3"} ; [ DW_TAG_auto_variable ] [qInB] [line 147]
!1100 = !MDLocation(line: 147, column: 14, scope: !1084)
!1101 = !MDLocation(line: 147, column: 21, scope: !1084)
!1102 = !{!"0x100\00pWorld\00169\000", !1084, !889, !"_ZTS9btVector3"} ; [ DW_TAG_auto_variable ] [pWorld] [line 169]
!1103 = !MDLocation(line: 169, column: 15, scope: !1084)
!1104 = !MDLocation(line: 169, column: 24, scope: !1084)
!1105 = !{!"0x100\00qWorld\00170\000", !1084, !889, !"_ZTS9btVector3"} ; [ DW_TAG_auto_variable ] [qWorld] [line 170]
!1106 = !MDLocation(line: 170, column: 15, scope: !1084)
!1107 = !MDLocation(line: 170, column: 24, scope: !1084)
!1108 = !MDLocation(line: 176, column: 8, scope: !1109)
!1109 = !{!"0xb\00176\008\008", !1, !1084}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1110 = !MDLocation(line: 176, column: 8, scope: !1084)
!1111 = !MDLocation(line: 178, column: 5, scope: !1112)
!1112 = !{!"0xb\00177\004\009", !1, !1109}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1113 = !MDLocation(line: 179, column: 5, scope: !1112)
!1114 = !MDLocation(line: 180, column: 4, scope: !1112)
!1115 = !{!"0x100\00w\00182\000", !1084, !889, !"_ZTS9btVector3"} ; [ DW_TAG_auto_variable ] [w] [line 182]
!1116 = !MDLocation(line: 182, column: 14, scope: !1084)
!1117 = !MDLocation(line: 182, column: 25, scope: !1084)
!1118 = !MDLocation(line: 183, column: 12, scope: !1084)
!1119 = !MDLocation(line: 186, column: 9, scope: !1120)
!1120 = !{!"0xb\00186\008\0010", !1, !1084}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1121 = !MDLocation(line: 186, column: 8, scope: !1084)
!1122 = !MDLocation(line: 186, column: 36, scope: !1120)
!1123 = !MDLocation(line: 186, column: 70, scope: !1120)
!1124 = !MDLocation(line: 186, column: 52, scope: !1120)
!1125 = !MDLocation(line: 188, column: 5, scope: !1126)
!1126 = !{!"0xb\00187\004\0011", !1, !1120}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1127 = !MDLocation(line: 191, column: 5, scope: !1126)
!1128 = !MDLocation(line: 195, column: 8, scope: !1129)
!1129 = !{!"0xb\00195\008\0012", !1, !1084}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1130 = !MDLocation(line: 195, column: 8, scope: !1084)
!1131 = !MDLocation(line: 197, column: 5, scope: !1132)
!1132 = !{!"0xb\00196\004\0013", !1, !1129}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1133 = !MDLocation(line: 199, column: 5, scope: !1132)
!1134 = !MDLocation(line: 202, column: 18, scope: !1084)
!1135 = !{!"0x100\00f0\00202\000", !1084, !889, !61} ; [ DW_TAG_auto_variable ] [f0] [line 202]
!1136 = !MDLocation(line: 202, column: 13, scope: !1084)
!1137 = !MDLocation(line: 203, column: 18, scope: !1084)
!1138 = !{!"0x100\00f1\00203\000", !1084, !889, !61} ; [ DW_TAG_auto_variable ] [f1] [line 203]
!1139 = !MDLocation(line: 203, column: 13, scope: !1084)
!1140 = !MDLocation(line: 205, column: 8, scope: !1141)
!1141 = !{!"0xb\00205\008\0014", !1, !1084}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1142 = !MDLocation(line: 205, column: 8, scope: !1084)
!1143 = !MDLocation(line: 207, column: 9, scope: !1144)
!1144 = !{!"0xb\00207\009\0016", !1, !1145}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1145 = !{!"0xb\00206\004\0015", !1, !1141}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1146 = !MDLocation(line: 207, column: 9, scope: !1145)
!1147 = !MDLocation(line: 209, column: 6, scope: !1148)
!1148 = !{!"0xb\00208\005\0017", !1, !1144}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1149 = !MDLocation(line: 210, column: 5, scope: !1148)
!1150 = !MDLocation(line: 212, column: 6, scope: !1151)
!1151 = !{!"0xb\00211\005\0018", !1, !1144}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1152 = !MDLocation(line: 215, column: 5, scope: !1145)
!1153 = !MDLocation(line: 222, column: 4, scope: !1084)
!1154 = !{!"0x100\00newCachedSeparatingAxis\00226\000", !1084, !889, !"_ZTS9btVector3"} ; [ DW_TAG_auto_variable ] [newCachedSeparatingAxis] [line 226]
!1155 = !MDLocation(line: 226, column: 14, scope: !1084)
!1156 = !MDLocation(line: 229, column: 9, scope: !1157)
!1157 = !{!"0xb\00229\008\0019", !1, !1084}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1158 = !MDLocation(line: 229, column: 8, scope: !1084)
!1159 = !MDLocation(line: 231, column: 5, scope: !1160)
!1160 = !{!"0xb\00230\004\0020", !1, !1157}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1161 = !MDLocation(line: 233, column: 5, scope: !1160)
!1162 = !MDLocation(line: 236, column: 7, scope: !1163)
!1163 = !{!"0xb\00236\007\0021", !1, !1084}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1164 = !MDLocation(line: 236, column: 7, scope: !1084)
!1165 = !MDLocation(line: 238, column: 5, scope: !1166)
!1166 = !{!"0xb\00237\0013\0022", !1, !1163}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1167 = !MDLocation(line: 239, column: 17, scope: !1166)
!1168 = !MDLocation(line: 241, column: 17, scope: !1166)
!1169 = !{!"0x100\00previousSquaredDistance\00244\000", !1084, !889, !61} ; [ DW_TAG_auto_variable ] [previousSquaredDistance] [line 244]
!1170 = !MDLocation(line: 244, column: 13, scope: !1084)
!1171 = !MDLocation(line: 245, column: 22, scope: !1084)
!1172 = !MDLocation(line: 261, column: 8, scope: !1173)
!1173 = !{!"0xb\00261\008\0023", !1, !1084}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1174 = !MDLocation(line: 261, column: 53, scope: !1173)
!1175 = !MDLocation(line: 261, column: 8, scope: !1084)
!1176 = !MDLocation(line: 265, column: 5, scope: !1177)
!1177 = !{!"0xb\00262\004\0024", !1, !1173}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1178 = !MDLocation(line: 267, column: 5, scope: !1177)
!1179 = !MDLocation(line: 270, column: 4, scope: !1084)
!1180 = !MDLocation(line: 273, column: 19, scope: !1181)
!1181 = !{!"0xb\00273\0019\0025", !1, !1084}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1182 = !MDLocation(line: 273, column: 19, scope: !1084)
!1183 = !MDLocation(line: 287, column: 23, scope: !1184)
!1184 = !{!"0xb\00274\0015\0026", !1, !1181}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1185 = !MDLocation(line: 292, column: 19, scope: !1084)
!1186 = !MDLocation(line: 292, column: 18, scope: !1084)
!1187 = !MDLocation(line: 292, column: 9, scope: !1084)
!1188 = !{!"0x100\00check\00292\000", !1084, !889, !66} ; [ DW_TAG_auto_variable ] [check] [line 292]
!1189 = !MDLocation(line: 295, column: 9, scope: !1190)
!1190 = !{!"0xb\00295\008\0027", !1, !1084}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1191 = !MDLocation(line: 295, column: 8, scope: !1084)
!1192 = !MDLocation(line: 299, column: 5, scope: !1193)
!1193 = !{!"0xb\00296\004\0028", !1, !1190}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1194 = !MDLocation(line: 300, column: 5, scope: !1193)
!1195 = !MDLocation(line: 137, column: 3, scope: !1085)
!1196 = !MDLocation(line: 304, column: 7, scope: !1197)
!1197 = !{!"0xb\00304\007\0029", !1, !1073}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1198 = !MDLocation(line: 304, column: 7, scope: !1073)
!1199 = !MDLocation(line: 306, column: 4, scope: !1200)
!1200 = !{!"0xb\00305\003\0030", !1, !1197}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1201 = !MDLocation(line: 307, column: 4, scope: !1200)
!1202 = !MDLocation(line: 308, column: 21, scope: !1200)
!1203 = !{!"0x100\00lenSqr\00308\000", !1200, !889, !61} ; [ DW_TAG_auto_variable ] [lenSqr] [line 308]
!1204 = !MDLocation(line: 308, column: 13, scope: !1200)
!1205 = !MDLocation(line: 311, column: 8, scope: !1206)
!1206 = !{!"0xb\00311\008\0031", !1, !1200}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1207 = !MDLocation(line: 311, column: 8, scope: !1200)
!1208 = !MDLocation(line: 313, column: 5, scope: !1209)
!1209 = !{!"0xb\00312\004\0032", !1, !1206}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1210 = !MDLocation(line: 314, column: 4, scope: !1209)
!1211 = !MDLocation(line: 315, column: 8, scope: !1212)
!1212 = !{!"0xb\00315\008\0033", !1, !1200}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1213 = !MDLocation(line: 315, column: 8, scope: !1200)
!1214 = !{!"0x100\00rlen\00317\000", !1215, !889, !61} ; [ DW_TAG_auto_variable ] [rlen] [line 317]
!1215 = !{!"0xb\00316\004\0034", !1, !1212}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1216 = !MDLocation(line: 317, column: 14, scope: !1215)
!1217 = !MDLocation(line: 317, column: 36, scope: !1215)
!1218 = !MDLocation(line: 317, column: 21, scope: !1215)
!1219 = !MDLocation(line: 318, column: 5, scope: !1215)
!1220 = !MDLocation(line: 319, column: 18, scope: !1215)
!1221 = !{!"0x100\00s\00319\000", !1215, !889, !61} ; [ DW_TAG_auto_variable ] [s] [line 319]
!1222 = !MDLocation(line: 319, column: 14, scope: !1215)
!1223 = !MDLocation(line: 322, column: 17, scope: !1215)
!1224 = !MDLocation(line: 322, column: 43, scope: !1215)
!1225 = !MDLocation(line: 322, column: 40, scope: !1215)
!1226 = !MDLocation(line: 322, column: 5, scope: !1215)
!1227 = !MDLocation(line: 323, column: 17, scope: !1215)
!1228 = !MDLocation(line: 323, column: 43, scope: !1215)
!1229 = !MDLocation(line: 323, column: 40, scope: !1215)
!1230 = !MDLocation(line: 323, column: 5, scope: !1215)
!1231 = !MDLocation(line: 324, column: 31, scope: !1215)
!1232 = !MDLocation(line: 324, column: 18, scope: !1215)
!1233 = !MDLocation(line: 324, column: 17, scope: !1215)
!1234 = !MDLocation(line: 327, column: 5, scope: !1215)
!1235 = !MDLocation(line: 328, column: 4, scope: !1215)
!1236 = !MDLocation(line: 330, column: 5, scope: !1237)
!1237 = !{!"0xb\00329\004\0035", !1, !1212}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1238 = !MDLocation(line: 332, column: 3, scope: !1200)
!1239 = !MDLocation(line: 335, column: 5, scope: !1073)
!1240 = !MDLocation(line: 335, column: 28, scope: !1241)
!1241 = !{!"0xb\001", !1, !1073}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1242 = !MDLocation(line: 335, column: 56, scope: !1243)
!1243 = !{!"0xb\002", !1, !1073}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1244 = !MDLocation(line: 335, column: 81, scope: !1073)
!1245 = !MDLocation(line: 335, column: 80, scope: !1073)
!1246 = !MDLocation(line: 334, column: 8, scope: !1073)
!1247 = !{!"0x100\00catchDegeneratePenetrationCase\00334\000", !1073, !889, !66} ; [ DW_TAG_auto_variable ] [catchDegeneratePenetrationCase] [line 334]
!1248 = !MDLocation(line: 338, column: 7, scope: !1249)
!1249 = !{!"0xb\00338\007\0036", !1, !1073}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1250 = !MDLocation(line: 338, column: 7, scope: !1073)
!1251 = !MDLocation(line: 338, column: 29, scope: !1252)
!1252 = !{!"0xb\001", !1, !1249}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1253 = !MDLocation(line: 338, column: 40, scope: !1254)
!1254 = !{!"0xb\002", !1, !1249}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1255 = !MDLocation(line: 343, column: 8, scope: !1256)
!1256 = !{!"0xb\00343\008\0038", !1, !1257}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1257 = !{!"0xb\00339\003\0037", !1, !1249}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1258 = !MDLocation(line: 343, column: 8, scope: !1257)
!1259 = !{!"0x100\00tmpPointOnA\00346\000", !1260, !889, !"_ZTS9btVector3"} ; [ DW_TAG_auto_variable ] [tmpPointOnA] [line 346]
!1260 = !{!"0xb\00344\004\0039", !1, !1256}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1261 = !MDLocation(line: 346, column: 15, scope: !1260)
!1262 = !{!"0x100\00tmpPointOnB\00346\000", !1260, !889, !"_ZTS9btVector3"} ; [ DW_TAG_auto_variable ] [tmpPointOnB] [line 346]
!1263 = !MDLocation(line: 346, column: 27, scope: !1260)
!1264 = !MDLocation(line: 348, column: 5, scope: !1260)
!1265 = !MDLocation(line: 349, column: 5, scope: !1260)
!1266 = !MDLocation(line: 351, column: 21, scope: !1260)
!1267 = !MDLocation(line: 352, column: 7, scope: !1260)
!1268 = !MDLocation(line: 353, column: 6, scope: !1260)
!1269 = !MDLocation(line: 353, column: 19, scope: !1260)
!1270 = !MDLocation(line: 356, column: 16, scope: !1260)
!1271 = !MDLocation(line: 351, column: 10, scope: !1260)
!1272 = !{!"0x100\00isValid2\00351\000", !1260, !889, !66} ; [ DW_TAG_auto_variable ] [isValid2] [line 351]
!1273 = !MDLocation(line: 360, column: 9, scope: !1274)
!1274 = !{!"0xb\00360\009\0040", !1, !1260}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1275 = !MDLocation(line: 360, column: 9, scope: !1260)
!1276 = !{!"0x100\00tmpNormalInB\00362\000", !1277, !889, !"_ZTS9btVector3"} ; [ DW_TAG_auto_variable ] [tmpNormalInB] [line 362]
!1277 = !{!"0xb\00361\005\0041", !1, !1274}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1278 = !MDLocation(line: 362, column: 16, scope: !1277)
!1279 = !MDLocation(line: 362, column: 42, scope: !1277)
!1280 = !MDLocation(line: 363, column: 24, scope: !1277)
!1281 = !{!"0x100\00lenSqr\00363\000", !1277, !889, !61} ; [ DW_TAG_auto_variable ] [lenSqr] [line 363]
!1282 = !MDLocation(line: 363, column: 15, scope: !1277)
!1283 = !MDLocation(line: 364, column: 10, scope: !1284)
!1284 = !{!"0xb\00364\0010\0042", !1, !1277}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1285 = !MDLocation(line: 364, column: 10, scope: !1277)
!1286 = !MDLocation(line: 366, column: 7, scope: !1287)
!1287 = !{!"0xb\00365\006\0043", !1, !1284}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1288 = !MDLocation(line: 367, column: 16, scope: !1287)
!1289 = !MDLocation(line: 368, column: 6, scope: !1287)
!1290 = !MDLocation(line: 370, column: 10, scope: !1291)
!1291 = !{!"0xb\00370\0010\0044", !1, !1277}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1292 = !MDLocation(line: 370, column: 10, scope: !1277)
!1293 = !MDLocation(line: 372, column: 23, scope: !1294)
!1294 = !{!"0xb\00371\006\0045", !1, !1291}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1295 = !MDLocation(line: 372, column: 7, scope: !1294)
!1296 = !MDLocation(line: 373, column: 41, scope: !1294)
!1297 = !MDLocation(line: 373, column: 29, scope: !1294)
!1298 = !MDLocation(line: 373, column: 28, scope: !1294)
!1299 = !{!"0x100\00distance2\00373\000", !1294, !889, !61} ; [ DW_TAG_auto_variable ] [distance2] [line 373]
!1300 = !MDLocation(line: 373, column: 16, scope: !1294)
!1301 = !MDLocation(line: 375, column: 12, scope: !1302)
!1302 = !{!"0xb\00375\0011\0046", !1, !1294}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1303 = !MDLocation(line: 375, column: 11, scope: !1294)
!1304 = !MDLocation(line: 375, column: 24, scope: !1302)
!1305 = !MDLocation(line: 378, column: 8, scope: !1306)
!1306 = !{!"0xb\00376\007\0047", !1, !1302}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1307 = !MDLocation(line: 379, column: 8, scope: !1306)
!1308 = !MDLocation(line: 380, column: 8, scope: !1306)
!1309 = !MDLocation(line: 382, column: 8, scope: !1306)
!1310 = !MDLocation(line: 383, column: 7, scope: !1306)
!1311 = !MDLocation(line: 385, column: 8, scope: !1312)
!1312 = !{!"0xb\00384\007\0048", !1, !1302}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1313 = !MDLocation(line: 387, column: 6, scope: !1294)
!1314 = !MDLocation(line: 389, column: 7, scope: !1315)
!1315 = !{!"0xb\00388\006\0049", !1, !1291}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1316 = !MDLocation(line: 391, column: 5, scope: !1277)
!1317 = !MDLocation(line: 401, column: 10, scope: !1318)
!1318 = !{!"0xb\00401\0010\0051", !1, !1319}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1319 = !{!"0xb\00393\005\0050", !1, !1274}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1320 = !MDLocation(line: 401, column: 10, scope: !1319)
!1321 = !MDLocation(line: 403, column: 40, scope: !1322)
!1322 = !{!"0xb\00402\006\0052", !1, !1318}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1323 = !MDLocation(line: 403, column: 28, scope: !1322)
!1324 = !{!"0x100\00distance2\00403\000", !1322, !889, !61} ; [ DW_TAG_auto_variable ] [distance2] [line 403]
!1325 = !MDLocation(line: 403, column: 16, scope: !1322)
!1326 = !MDLocation(line: 405, column: 12, scope: !1327)
!1327 = !{!"0xb\00405\0011\0053", !1, !1322}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1328 = !MDLocation(line: 405, column: 11, scope: !1322)
!1329 = !MDLocation(line: 405, column: 24, scope: !1327)
!1330 = !MDLocation(line: 408, column: 8, scope: !1331)
!1331 = !{!"0xb\00406\007\0054", !1, !1327}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1332 = !MDLocation(line: 409, column: 8, scope: !1331)
!1333 = !MDLocation(line: 410, column: 20, scope: !1331)
!1334 = !MDLocation(line: 410, column: 43, scope: !1331)
!1335 = !MDLocation(line: 410, column: 8, scope: !1331)
!1336 = !MDLocation(line: 411, column: 20, scope: !1331)
!1337 = !MDLocation(line: 411, column: 43, scope: !1331)
!1338 = !MDLocation(line: 411, column: 8, scope: !1331)
!1339 = !MDLocation(line: 412, column: 8, scope: !1331)
!1340 = !MDLocation(line: 413, column: 8, scope: !1331)
!1341 = !MDLocation(line: 415, column: 8, scope: !1331)
!1342 = !MDLocation(line: 416, column: 7, scope: !1331)
!1343 = !MDLocation(line: 418, column: 8, scope: !1344)
!1344 = !{!"0xb\00417\007\0055", !1, !1327}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1345 = !MDLocation(line: 420, column: 6, scope: !1322)
!1346 = !MDLocation(line: 423, column: 4, scope: !1260)
!1347 = !MDLocation(line: 425, column: 3, scope: !1257)
!1348 = !MDLocation(line: 430, column: 6, scope: !1349)
!1349 = !{!"0xb\00430\006\0056", !1, !823}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1350 = !MDLocation(line: 430, column: 6, scope: !823)
!1351 = !MDLocation(line: 430, column: 19, scope: !1352)
!1352 = !{!"0xb\001", !1, !1349}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1353 = !MDLocation(line: 430, column: 37, scope: !1349)
!1354 = !MDLocation(line: 430, column: 57, scope: !1349)
!1355 = !MDLocation(line: 441, column: 3, scope: !1356)
!1356 = !{!"0xb\00431\002\0057", !1, !1349}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1357 = !MDLocation(line: 442, column: 3, scope: !1356)
!1358 = !MDLocation(line: 444, column: 3, scope: !1356)
!1359 = !MDLocation(line: 446, column: 12, scope: !1356)
!1360 = !MDLocation(line: 449, column: 2, scope: !1356)
!1361 = !MDLocation(line: 452, column: 1, scope: !823)
!1362 = !{!"0x101\00this\0016777216\001088", !877, null, !205} ; [ DW_TAG_arg_variable ] [this] [line 0]
!1363 = !MDLocation(line: 0, scope: !877)
!1364 = !MDLocation(line: 117, column: 2, scope: !877)
!1365 = !{!"0x101\00this\0016777216\001088", !875, null, !1366} ; [ DW_TAG_arg_variable ] [this] [line 0]
!1366 = !{!"0xf\00\000\0064\0064\000\000", null, null, !"_ZTS11btTransform"} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _ZTS11btTransform]
!1367 = !MDLocation(line: 0, scope: !875)
!1368 = !{!"0x101\00other\0033554495\000", !875, !1369, !272} ; [ DW_TAG_arg_variable ] [other] [line 63]
!1369 = !{!"0x29", !251}                          ; [ DW_TAG_file_type ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/../../LinearMath/btTransform.h]
!1370 = !MDLocation(line: 63, column: 52, scope: !875)
!1371 = !MDLocation(line: 64, column: 5, scope: !875)
!1372 = !MDLocation(line: 65, column: 3, scope: !875)
!1373 = !MDLocation(line: 67, column: 2, scope: !875)
!1374 = !{!"0x101\00v\0016778019\000", !872, !840, !99} ; [ DW_TAG_arg_variable ] [v] [line 803]
!1375 = !MDLocation(line: 803, column: 28, scope: !872)
!1376 = !{!"0x101\00s\0033555235\000", !872, !840, !369} ; [ DW_TAG_arg_variable ] [s] [line 803]
!1377 = !MDLocation(line: 803, column: 47, scope: !872)
!1378 = !MDLocation(line: 813, column: 19, scope: !872)
!1379 = !MDLocation(line: 813, column: 35, scope: !872)
!1380 = !MDLocation(line: 813, column: 2, scope: !872)
!1381 = !MDLocation(line: 813, column: 38, scope: !872)
!1382 = !MDLocation(line: 813, column: 54, scope: !872)
!1383 = !MDLocation(line: 813, column: 57, scope: !872)
!1384 = !MDLocation(line: 813, column: 73, scope: !872)
!1385 = !{!"0x101\00v1\0016777953\000", !871, !840, !99} ; [ DW_TAG_arg_variable ] [v1] [line 737]
!1386 = !MDLocation(line: 737, column: 28, scope: !871)
!1387 = !{!"0x101\00v2\0033555169\000", !871, !840, !99} ; [ DW_TAG_arg_variable ] [v2] [line 737]
!1388 = !MDLocation(line: 737, column: 49, scope: !871)
!1389 = !MDLocation(line: 745, column: 4, scope: !871)
!1390 = !MDLocation(line: 745, column: 21, scope: !871)
!1391 = !MDLocation(line: 744, column: 2, scope: !871)
!1392 = !MDLocation(line: 746, column: 4, scope: !871)
!1393 = !MDLocation(line: 746, column: 21, scope: !871)
!1394 = !MDLocation(line: 747, column: 4, scope: !871)
!1395 = !MDLocation(line: 747, column: 21, scope: !871)
!1396 = !{!"0x101\00this\0016777216\001088", !870, null, !1366} ; [ DW_TAG_arg_variable ] [this] [line 0]
!1397 = !MDLocation(line: 0, scope: !870)
!1398 = !MDLocation(line: 117, column: 61, scope: !870)
!1399 = !{!"0x101\00this\0016777216\001088", !869, null, !205} ; [ DW_TAG_arg_variable ] [this] [line 0]
!1400 = !MDLocation(line: 0, scope: !869)
!1401 = !{!"0x101\00v\0033554608\000", !869, !840, !99} ; [ DW_TAG_arg_variable ] [v] [line 176]
!1402 = !MDLocation(line: 176, column: 59, scope: !869)
!1403 = !MDLocation(line: 183, column: 18, scope: !869)
!1404 = !MDLocation(line: 183, column: 3, scope: !869)
!1405 = !MDLocation(line: 184, column: 18, scope: !869)
!1406 = !MDLocation(line: 184, column: 3, scope: !869)
!1407 = !MDLocation(line: 185, column: 18, scope: !869)
!1408 = !MDLocation(line: 185, column: 3, scope: !869)
!1409 = !MDLocation(line: 187, column: 3, scope: !869)
!1410 = !{!"0x101\00this\0016777216\001088", !862, null, !956} ; [ DW_TAG_arg_variable ] [this] [line 0]
!1411 = !MDLocation(line: 0, scope: !862)
!1412 = !MDLocation(line: 69, column: 40, scope: !862)
!1413 = !MDLocation(line: 69, column: 10, scope: !862)
!1414 = !MDLocation(line: 69, column: 3, scope: !862)
!1415 = !{!"0x101\00this\0016777216\001088", !861, null, !205} ; [ DW_TAG_arg_variable ] [this] [line 0]
!1416 = !MDLocation(line: 0, scope: !861)
!1417 = !{!"0x101\00_x\0033555057\000", !861, !840, !369} ; [ DW_TAG_arg_variable ] [_x] [line 625]
!1418 = !MDLocation(line: 625, column: 51, scope: !861)
!1419 = !{!"0x101\00_y\0050332273\000", !861, !840, !369} ; [ DW_TAG_arg_variable ] [_y] [line 625]
!1420 = !MDLocation(line: 625, column: 71, scope: !861)
!1421 = !{!"0x101\00_z\0067109489\000", !861, !840, !369} ; [ DW_TAG_arg_variable ] [_z] [line 625]
!1422 = !MDLocation(line: 625, column: 91, scope: !861)
!1423 = !MDLocation(line: 627, column: 15, scope: !861)
!1424 = !MDLocation(line: 627, column: 3, scope: !861)
!1425 = !MDLocation(line: 628, column: 15, scope: !861)
!1426 = !MDLocation(line: 628, column: 3, scope: !861)
!1427 = !MDLocation(line: 629, column: 15, scope: !861)
!1428 = !MDLocation(line: 629, column: 3, scope: !861)
!1429 = !MDLocation(line: 630, column: 3, scope: !861)
!1430 = !MDLocation(line: 631, column: 2, scope: !861)
!1431 = !{!"0x101\00v\0016778368\000", !851, !852, !99} ; [ DW_TAG_arg_variable ] [v] [line 1152]
!1432 = !MDLocation(line: 1152, column: 28, scope: !851)
!1433 = !{!"0x101\00m\0033555584\000", !851, !852, !267} ; [ DW_TAG_arg_variable ] [m] [line 1152]
!1434 = !MDLocation(line: 1152, column: 50, scope: !851)
!1435 = !MDLocation(line: 1187, column: 19, scope: !851)
!1436 = !MDLocation(line: 1187, column: 2, scope: !851)
!1437 = !MDLocation(line: 1187, column: 31, scope: !851)
!1438 = !MDLocation(line: 1187, column: 43, scope: !851)
!1439 = !{!"0x101\00v\0016778005\000", !848, !840, !99} ; [ DW_TAG_arg_variable ] [v] [line 789]
!1440 = !MDLocation(line: 789, column: 28, scope: !848)
!1441 = !MDLocation(line: 797, column: 20, scope: !848)
!1442 = !MDLocation(line: 797, column: 19, scope: !848)
!1443 = !MDLocation(line: 797, column: 2, scope: !848)
!1444 = !MDLocation(line: 797, column: 36, scope: !848)
!1445 = !MDLocation(line: 797, column: 35, scope: !848)
!1446 = !MDLocation(line: 797, column: 52, scope: !848)
!1447 = !MDLocation(line: 797, column: 51, scope: !848)
!1448 = !{!"0x101\00this\0016777216\001088", !847, null, !1449} ; [ DW_TAG_arg_variable ] [this] [line 0]
!1449 = !{!"0xf\00\000\0064\0064\000\000", null, null, !273} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!1450 = !MDLocation(line: 0, scope: !847)
!1451 = !MDLocation(line: 114, column: 61, scope: !847)
!1452 = !{!"0x101\00this\0016777216\001088", !844, null, !1449} ; [ DW_TAG_arg_variable ] [this] [line 0]
!1453 = !MDLocation(line: 0, scope: !844)
!1454 = !{!"0x101\00x\0033554526\000", !844, !1369, !99} ; [ DW_TAG_arg_variable ] [x] [line 94]
!1455 = !MDLocation(line: 94, column: 58, scope: !844)
!1456 = !MDLocation(line: 96, column: 23, scope: !844)
!1457 = !MDLocation(line: 96, column: 35, scope: !844)
!1458 = !MDLocation(line: 96, column: 47, scope: !844)
!1459 = !MDLocation(line: 96, column: 16, scope: !844)
!1460 = !MDLocation(line: 96, column: 59, scope: !844)
!1461 = !MDLocation(line: 96, column: 9, scope: !844)
!1462 = !{!"0x101\00this\0016777216\001088", !843, null, !205} ; [ DW_TAG_arg_variable ] [this] [line 0]
!1463 = !MDLocation(line: 0, scope: !843)
!1464 = !MDLocation(line: 571, column: 63, scope: !843)
!1465 = !MDLocation(line: 571, column: 56, scope: !843)
!1466 = !{!"0x101\00v1\0016777985\000", !839, !840, !99} ; [ DW_TAG_arg_variable ] [v1] [line 769]
!1467 = !MDLocation(line: 769, column: 28, scope: !839)
!1468 = !{!"0x101\00v2\0033555201\000", !839, !840, !99} ; [ DW_TAG_arg_variable ] [v2] [line 769]
!1469 = !MDLocation(line: 769, column: 49, scope: !839)
!1470 = !MDLocation(line: 781, column: 4, scope: !839)
!1471 = !MDLocation(line: 781, column: 21, scope: !839)
!1472 = !MDLocation(line: 780, column: 2, scope: !839)
!1473 = !MDLocation(line: 782, column: 4, scope: !839)
!1474 = !MDLocation(line: 782, column: 21, scope: !839)
!1475 = !MDLocation(line: 783, column: 4, scope: !839)
!1476 = !MDLocation(line: 783, column: 21, scope: !839)
!1477 = !{!"0x101\00this\0016777216\001088", !838, null, !596} ; [ DW_TAG_arg_variable ] [this] [line 0]
!1478 = !MDLocation(line: 0, scope: !838)
!1479 = !{!"0x101\00v\0033554662\000", !838, !840, !99} ; [ DW_TAG_arg_variable ] [v] [line 230]
!1480 = !MDLocation(line: 230, column: 50, scope: !838)
!1481 = !MDLocation(line: 245, column: 10, scope: !838)
!1482 = !MDLocation(line: 245, column: 24, scope: !838)
!1483 = !MDLocation(line: 246, column: 5, scope: !838)
!1484 = !MDLocation(line: 246, column: 19, scope: !838)
!1485 = !MDLocation(line: 247, column: 5, scope: !838)
!1486 = !MDLocation(line: 247, column: 19, scope: !838)
!1487 = !MDLocation(line: 245, column: 3, scope: !838)
!1488 = !{!"0x101\00this\0016777216\001088", !837, null, !596} ; [ DW_TAG_arg_variable ] [this] [line 0]
!1489 = !MDLocation(line: 0, scope: !837)
!1490 = !MDLocation(line: 254, column: 10, scope: !837)
!1491 = !MDLocation(line: 254, column: 3, scope: !837)
!1492 = !{!"0x101\00this\0016777216\001088", !836, null, !1493} ; [ DW_TAG_arg_variable ] [this] [line 0]
!1493 = !{!"0xf\00\000\0064\0064\000\000", null, null, !191} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!1494 = !MDLocation(line: 0, scope: !836)
!1495 = !MDLocation(line: 159, column: 12, scope: !836)
!1496 = !MDLocation(line: 159, column: 4, scope: !836)
!1497 = !{!"0x101\00y\0016777575\000", !832, !833, !61} ; [ DW_TAG_arg_variable ] [y] [line 359]
!1498 = !MDLocation(line: 359, column: 44, scope: !832)
!1499 = !MDLocation(line: 376, column: 9, scope: !832)
!1500 = !MDLocation(line: 376, column: 2, scope: !832)
!1501 = !{!"0x101\00this\0016777216\001088", !831, null, !205} ; [ DW_TAG_arg_variable ] [this] [line 0]
!1502 = !MDLocation(line: 0, scope: !831)
!1503 = !{!"0x101\00s\0033554624\000", !831, !840, !369} ; [ DW_TAG_arg_variable ] [s] [line 192]
!1504 = !MDLocation(line: 192, column: 58, scope: !831)
!1505 = !MDLocation(line: 201, column: 18, scope: !831)
!1506 = !MDLocation(line: 201, column: 3, scope: !831)
!1507 = !MDLocation(line: 202, column: 18, scope: !831)
!1508 = !MDLocation(line: 202, column: 3, scope: !831)
!1509 = !MDLocation(line: 203, column: 18, scope: !831)
!1510 = !MDLocation(line: 203, column: 3, scope: !831)
!1511 = !MDLocation(line: 205, column: 3, scope: !831)
!1512 = !{!"0x101\00this\0016777216\001088", !830, null, !205} ; [ DW_TAG_arg_variable ] [this] [line 0]
!1513 = !MDLocation(line: 0, scope: !830)
!1514 = !{!"0x101\00v\0033554591\000", !830, !840, !99} ; [ DW_TAG_arg_variable ] [v] [line 159]
!1515 = !MDLocation(line: 159, column: 59, scope: !830)
!1516 = !MDLocation(line: 166, column: 18, scope: !830)
!1517 = !MDLocation(line: 166, column: 3, scope: !830)
!1518 = !MDLocation(line: 167, column: 18, scope: !830)
!1519 = !MDLocation(line: 167, column: 3, scope: !830)
!1520 = !MDLocation(line: 168, column: 18, scope: !830)
!1521 = !MDLocation(line: 168, column: 3, scope: !830)
!1522 = !MDLocation(line: 170, column: 3, scope: !830)
!1523 = !{!"0x101\00this\0016777216\001088", !829, null, !205} ; [ DW_TAG_arg_variable ] [this] [line 0]
!1524 = !MDLocation(line: 0, scope: !829)
!1525 = !MDLocation(line: 664, column: 3, scope: !829)
!1526 = !MDLocation(line: 666, column: 2, scope: !829)
!1527 = !{!"0x101\00this\0016777216\001088", !828, null, !205} ; [ DW_TAG_arg_variable ] [this] [line 0]
!1528 = !MDLocation(line: 0, scope: !828)
!1529 = !{!"0x101\00s\0033554642\000", !828, !840, !369} ; [ DW_TAG_arg_variable ] [s] [line 210]
!1530 = !MDLocation(line: 210, column: 58, scope: !828)
!1531 = !MDLocation(line: 224, column: 35, scope: !828)
!1532 = !MDLocation(line: 224, column: 19, scope: !828)
!1533 = !MDLocation(line: 224, column: 10, scope: !828)
!1534 = !MDLocation(line: 224, column: 11, scope: !828)
!1535 = !MDLocation(line: 224, column: 3, scope: !828)
!1536 = !{!"0x101\00this\0016777216\001088", !827, null, !596} ; [ DW_TAG_arg_variable ] [this] [line 0]
!1537 = !MDLocation(line: 0, scope: !827)
!1538 = !MDLocation(line: 260, column: 17, scope: !827)
!1539 = !MDLocation(line: 260, column: 10, scope: !827)
!1540 = !MDLocation(line: 260, column: 3, scope: !827)
!1541 = !{!"0x101\00this\0016777216\001088", !826, null, !205} ; [ DW_TAG_arg_variable ] [this] [line 0]
!1542 = !MDLocation(line: 0, scope: !826)
!1543 = !MDLocation(line: 324, column: 19, scope: !826)
!1544 = !MDLocation(line: 324, column: 10, scope: !826)
!1545 = !MDLocation(line: 324, column: 11, scope: !826)
!1546 = !MDLocation(line: 324, column: 3, scope: !826)
!1547 = !{!"0x101\00this\0016777216\001088", !825, null, !895} ; [ DW_TAG_arg_variable ] [this] [line 0]
!1548 = !MDLocation(line: 0, scope: !825)
!1549 = !MDLocation(line: 59, column: 32, scope: !1550)
!1550 = !{!"0xb\0059\0031\0058", !45, !825}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/./btGjkPairDetector.h]
!1551 = !MDLocation(line: 59, column: 32, scope: !825)
!1552 = !{!"0x101\00this\0016777216\001088", !824, null, !895} ; [ DW_TAG_arg_variable ] [this] [line 0]
!1553 = !MDLocation(line: 0, scope: !824)
!1554 = !MDLocation(line: 59, column: 31, scope: !824)
!1555 = !MDLocation(line: 59, column: 31, scope: !1556)
!1556 = !{!"0xb\001", !45, !824}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/./btGjkPairDetector.h]
!1557 = !MDLocation(line: 59, column: 32, scope: !824)
!1558 = !MDLocation(line: 59, column: 32, scope: !1559)
!1559 = !{!"0xb\002", !45, !824}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/./btGjkPairDetector.h]
!1560 = !MDLocation(line: 59, column: 32, scope: !1561)
!1561 = !{!"0xb\003", !45, !824}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/./btGjkPairDetector.h]
!1562 = !{!"0x101\00this\0016777216\001088", !846, null, !596} ; [ DW_TAG_arg_variable ] [this] [line 0]
!1563 = !MDLocation(line: 0, scope: !846)
!1564 = !{!"0x101\00v0\0033555135\000", !846, !840, !99} ; [ DW_TAG_arg_variable ] [v0] [line 703]
!1565 = !MDLocation(line: 703, column: 57, scope: !846)
!1566 = !{!"0x101\00v1\0050332351\000", !846, !840, !99} ; [ DW_TAG_arg_variable ] [v1] [line 703]
!1567 = !MDLocation(line: 703, column: 78, scope: !846)
!1568 = !{!"0x101\00v2\0067109567\000", !846, !840, !99} ; [ DW_TAG_arg_variable ] [v2] [line 703]
!1569 = !MDLocation(line: 703, column: 99, scope: !846)
!1570 = !MDLocation(line: 730, column: 21, scope: !846)
!1571 = !MDLocation(line: 730, column: 3, scope: !846)
!1572 = !MDLocation(line: 730, column: 30, scope: !846)
!1573 = !MDLocation(line: 730, column: 39, scope: !846)
!1574 = !{!"0x101\00this\0016777216\001088", !845, null, !1575} ; [ DW_TAG_arg_variable ] [this] [line 0]
!1575 = !{!"0xf\00\000\0064\0064\000\000", null, null, !268} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!1576 = !MDLocation(line: 0, scope: !845)
!1577 = !{!"0x101\00i\0033554585\000", !845, !852, !58} ; [ DW_TAG_arg_variable ] [i] [line 153]
!1578 = !MDLocation(line: 153, column: 52, scope: !845)
!1579 = !MDLocation(line: 156, column: 3, scope: !845)
!1580 = !{!"0x101\00this\0016777216\001088", !860, null, !1575} ; [ DW_TAG_arg_variable ] [this] [line 0]
!1581 = !MDLocation(line: 0, scope: !860)
!1582 = !{!"0x101\00v\0033555043\000", !860, !852, !99} ; [ DW_TAG_arg_variable ] [v] [line 611]
!1583 = !MDLocation(line: 611, column: 52, scope: !860)
!1584 = !MDLocation(line: 613, column: 10, scope: !860)
!1585 = !MDLocation(line: 613, column: 24, scope: !860)
!1586 = !MDLocation(line: 613, column: 32, scope: !860)
!1587 = !MDLocation(line: 613, column: 46, scope: !860)
!1588 = !MDLocation(line: 613, column: 54, scope: !860)
!1589 = !MDLocation(line: 613, column: 68, scope: !860)
!1590 = !MDLocation(line: 613, column: 3, scope: !860)
!1591 = !{!"0x101\00this\0016777216\001088", !859, null, !1575} ; [ DW_TAG_arg_variable ] [this] [line 0]
!1592 = !MDLocation(line: 0, scope: !859)
!1593 = !{!"0x101\00v\0033555047\000", !859, !852, !99} ; [ DW_TAG_arg_variable ] [v] [line 615]
!1594 = !MDLocation(line: 615, column: 52, scope: !859)
!1595 = !MDLocation(line: 617, column: 10, scope: !859)
!1596 = !MDLocation(line: 617, column: 24, scope: !859)
!1597 = !MDLocation(line: 617, column: 32, scope: !859)
!1598 = !MDLocation(line: 617, column: 46, scope: !859)
!1599 = !MDLocation(line: 617, column: 54, scope: !859)
!1600 = !MDLocation(line: 617, column: 68, scope: !859)
!1601 = !MDLocation(line: 617, column: 3, scope: !859)
!1602 = !{!"0x101\00this\0016777216\001088", !855, null, !1575} ; [ DW_TAG_arg_variable ] [this] [line 0]
!1603 = !MDLocation(line: 0, scope: !855)
!1604 = !{!"0x101\00v\0033555051\000", !855, !852, !99} ; [ DW_TAG_arg_variable ] [v] [line 619]
!1605 = !MDLocation(line: 619, column: 52, scope: !855)
!1606 = !MDLocation(line: 621, column: 10, scope: !855)
!1607 = !MDLocation(line: 621, column: 24, scope: !855)
!1608 = !MDLocation(line: 621, column: 32, scope: !855)
!1609 = !MDLocation(line: 621, column: 46, scope: !855)
!1610 = !MDLocation(line: 621, column: 54, scope: !855)
!1611 = !MDLocation(line: 621, column: 68, scope: !855)
!1612 = !MDLocation(line: 621, column: 3, scope: !855)
!1613 = !{!"0x101\00this\0016777216\001088", !858, null, !596} ; [ DW_TAG_arg_variable ] [this] [line 0]
!1614 = !MDLocation(line: 0, scope: !858)
!1615 = !MDLocation(line: 564, column: 49, scope: !858)
!1616 = !{!"0x101\00this\0016777216\001088", !857, null, !596} ; [ DW_TAG_arg_variable ] [this] [line 0]
!1617 = !MDLocation(line: 0, scope: !857)
!1618 = !MDLocation(line: 560, column: 49, scope: !857)
!1619 = !{!"0x101\00this\0016777216\001088", !856, null, !596} ; [ DW_TAG_arg_variable ] [this] [line 0]
!1620 = !MDLocation(line: 0, scope: !856)
!1621 = !MDLocation(line: 562, column: 49, scope: !856)
!1622 = !{!"0x101\00proxyType\0016777385\000", !868, !1623, !58} ; [ DW_TAG_arg_variable ] [proxyType] [line 169]
!1623 = !{!"0x29", !4}                            ; [ DW_TAG_file_type ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/../../BulletCollision/BroadphaseCollision/btBroadphaseProxy.h]
!1624 = !MDLocation(line: 169, column: 47, scope: !868)
!1625 = !MDLocation(line: 171, column: 11, scope: !868)
!1626 = !MDLocation(line: 171, column: 10, scope: !868)
!1627 = !MDLocation(line: 171, column: 52, scope: !1628)
!1628 = !{!"0xb\002", !4, !868}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/../../BulletCollision/BroadphaseCollision/btBroadphaseProxy.h]
!1629 = !MDLocation(line: 171, column: 3, scope: !1630)
!1630 = !{!"0xb\003", !4, !1631}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/../../BulletCollision/BroadphaseCollision/btBroadphaseProxy.h]
!1631 = !{!"0xb\001", !4, !868}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/../../BulletCollision/BroadphaseCollision/btBroadphaseProxy.h]
!1632 = !{!"0x101\00this\0016777216\001088", !876, null, !1633} ; [ DW_TAG_arg_variable ] [this] [line 0]
!1633 = !{!"0xf\00\000\0064\0064\000\000", null, null, !"_ZTS11btMatrix3x3"} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _ZTS11btMatrix3x3]
!1634 = !MDLocation(line: 0, scope: !876)
!1635 = !{!"0x101\00other\0033554541\000", !876, !852, !267} ; [ DW_TAG_arg_variable ] [other] [line 109]
!1636 = !MDLocation(line: 109, column: 52, scope: !876)
!1637 = !MDLocation(line: 109, column: 20, scope: !876)
!1638 = !MDLocation(line: 109, column: 20, scope: !1639)
!1639 = !{!"0xb\002", !353, !1640}                ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/../../LinearMath/btMatrix3x3.h]
!1640 = !{!"0xb\001", !353, !876}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/../../LinearMath/btMatrix3x3.h]
!1641 = !MDLocation(line: 111, column: 3, scope: !1642)
!1642 = !{!"0xb\00110\002\0060", !353, !876}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/../../LinearMath/btMatrix3x3.h]
!1643 = !MDLocation(line: 112, column: 3, scope: !1642)
!1644 = !MDLocation(line: 113, column: 3, scope: !1642)
!1645 = !MDLocation(line: 114, column: 2, scope: !876)
!1646 = !{!"0x101\00this\0016777216\001088", !878, null, !935} ; [ DW_TAG_arg_variable ] [this] [line 0]
!1647 = !MDLocation(line: 0, scope: !878)
!1648 = !MDLocation(line: 57, column: 51, scope: !878)
!1649 = !{!"0x101\00this\0016777216\001088", !886, null, !935} ; [ DW_TAG_arg_variable ] [this] [line 0]
!1650 = !MDLocation(line: 0, scope: !886)
!1651 = !MDLocation(line: 57, column: 50, scope: !886)
!1652 = !MDLocation(line: 57, column: 50, scope: !1653)
!1653 = !{!"0xb\001", !222, !886}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/./btDiscreteCollisionDetectorInterface.h]
!1654 = !MDLocation(line: 57, column: 51, scope: !886)
!1655 = !MDLocation(line: 57, column: 51, scope: !1656)
!1656 = !{!"0xb\002", !222, !886}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/./btDiscreteCollisionDetectorInterface.h]
!1657 = !MDLocation(line: 57, column: 51, scope: !1658)
!1658 = !{!"0xb\003", !222, !886}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/./btDiscreteCollisionDetectorInterface.h]
