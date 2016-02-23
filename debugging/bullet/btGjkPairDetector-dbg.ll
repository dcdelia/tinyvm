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
  call void @llvm.dbg.declare(metadata %class.btGjkPairDetector** %1, metadata !894, metadata !896), !dbg !897
  store %class.btConvexShape* %objectA, %class.btConvexShape** %2, align 8
  call void @llvm.dbg.declare(metadata %class.btConvexShape** %2, metadata !898, metadata !896), !dbg !899
  store %class.btConvexShape* %objectB, %class.btConvexShape** %3, align 8
  call void @llvm.dbg.declare(metadata %class.btConvexShape** %3, metadata !900, metadata !896), !dbg !901
  store %class.btVoronoiSimplexSolver* %simplexSolver, %class.btVoronoiSimplexSolver** %4, align 8
  call void @llvm.dbg.declare(metadata %class.btVoronoiSimplexSolver** %4, metadata !902, metadata !896), !dbg !903
  store %class.btConvexPenetrationDepthSolver* %penetrationDepthSolver, %class.btConvexPenetrationDepthSolver** %5, align 8
  call void @llvm.dbg.declare(metadata %class.btConvexPenetrationDepthSolver** %5, metadata !904, metadata !896), !dbg !905
  %11 = load %class.btGjkPairDetector** %1
  %12 = bitcast %class.btGjkPairDetector* %11 to %struct.btDiscreteCollisionDetectorInterface*, !dbg !906
  call void @_ZN36btDiscreteCollisionDetectorInterfaceC2Ev(%struct.btDiscreteCollisionDetectorInterface* %12) #7, !dbg !906
  %13 = bitcast %class.btGjkPairDetector* %11 to i32 (...)***, !dbg !906
  store i32 (...)** bitcast (i8** getelementptr inbounds ([5 x i8*]* @_ZTV17btGjkPairDetector, i64 0, i64 2) to i32 (...)**), i32 (...)*** %13, !dbg !906
  %14 = getelementptr inbounds %class.btGjkPairDetector* %11, i32 0, i32 1, !dbg !907
  store float 0.000000e+00, float* %6, !dbg !907
  store float 1.000000e+00, float* %7, !dbg !907
  store float 0.000000e+00, float* %8, !dbg !907
  invoke void @_ZN9btVector3C2ERKfS1_S1_(%class.btVector3* %14, float* dereferenceable(4) %6, float* dereferenceable(4) %7, float* dereferenceable(4) %8)
          to label %15 unwind label %53, !dbg !907

; <label>:15                                      ; preds = %0
  %16 = getelementptr inbounds %class.btGjkPairDetector* %11, i32 0, i32 2, !dbg !908
  %17 = load %class.btConvexPenetrationDepthSolver** %5, align 8, !dbg !909
  store %class.btConvexPenetrationDepthSolver* %17, %class.btConvexPenetrationDepthSolver** %16, align 8, !dbg !908
  %18 = getelementptr inbounds %class.btGjkPairDetector* %11, i32 0, i32 3, !dbg !910
  %19 = load %class.btVoronoiSimplexSolver** %4, align 8, !dbg !911
  store %class.btVoronoiSimplexSolver* %19, %class.btVoronoiSimplexSolver** %18, align 8, !dbg !910
  %20 = getelementptr inbounds %class.btGjkPairDetector* %11, i32 0, i32 4, !dbg !912
  %21 = load %class.btConvexShape** %2, align 8, !dbg !913
  store %class.btConvexShape* %21, %class.btConvexShape** %20, align 8, !dbg !912
  %22 = getelementptr inbounds %class.btGjkPairDetector* %11, i32 0, i32 5, !dbg !914
  %23 = load %class.btConvexShape** %3, align 8, !dbg !915
  store %class.btConvexShape* %23, %class.btConvexShape** %22, align 8, !dbg !914
  %24 = getelementptr inbounds %class.btGjkPairDetector* %11, i32 0, i32 6, !dbg !916
  %25 = load %class.btConvexShape** %2, align 8, !dbg !917
  %26 = bitcast %class.btConvexShape* %25 to %class.btCollisionShape*, !dbg !917
  %27 = invoke i32 @_ZNK16btCollisionShape12getShapeTypeEv(%class.btCollisionShape* %26)
          to label %28 unwind label %53, !dbg !917

; <label>:28                                      ; preds = %15
  store i32 %27, i32* %24, align 4, !dbg !918
  %29 = getelementptr inbounds %class.btGjkPairDetector* %11, i32 0, i32 7, !dbg !920
  %30 = load %class.btConvexShape** %3, align 8, !dbg !921
  %31 = bitcast %class.btConvexShape* %30 to %class.btCollisionShape*, !dbg !921
  %32 = invoke i32 @_ZNK16btCollisionShape12getShapeTypeEv(%class.btCollisionShape* %31)
          to label %33 unwind label %53, !dbg !921

; <label>:33                                      ; preds = %28
  store i32 %32, i32* %29, align 4, !dbg !922
  %34 = getelementptr inbounds %class.btGjkPairDetector* %11, i32 0, i32 8, !dbg !923
  %35 = load %class.btConvexShape** %2, align 8, !dbg !924
  %36 = bitcast %class.btConvexShape* %35 to float (%class.btConvexShape*)***, !dbg !924
  %37 = load float (%class.btConvexShape*)*** %36, !dbg !924
  %38 = getelementptr inbounds float (%class.btConvexShape*)** %37, i64 12, !dbg !924
  %39 = load float (%class.btConvexShape*)** %38, !dbg !924
  %40 = invoke float %39(%class.btConvexShape* %35)
          to label %41 unwind label %53, !dbg !924

; <label>:41                                      ; preds = %33
  store float %40, float* %34, align 4, !dbg !925
  %42 = getelementptr inbounds %class.btGjkPairDetector* %11, i32 0, i32 9, !dbg !926
  %43 = load %class.btConvexShape** %3, align 8, !dbg !927
  %44 = bitcast %class.btConvexShape* %43 to float (%class.btConvexShape*)***, !dbg !927
  %45 = load float (%class.btConvexShape*)*** %44, !dbg !927
  %46 = getelementptr inbounds float (%class.btConvexShape*)** %45, i64 12, !dbg !927
  %47 = load float (%class.btConvexShape*)** %46, !dbg !927
  %48 = invoke float %47(%class.btConvexShape* %43)
          to label %49 unwind label %53, !dbg !927

; <label>:49                                      ; preds = %41
  store float %48, float* %42, align 4, !dbg !928
  %50 = getelementptr inbounds %class.btGjkPairDetector* %11, i32 0, i32 10, !dbg !929
  store i8 0, i8* %50, align 1, !dbg !929
  %51 = getelementptr inbounds %class.btGjkPairDetector* %11, i32 0, i32 12, !dbg !930
  store i32 -1, i32* %51, align 4, !dbg !930
  %52 = getelementptr inbounds %class.btGjkPairDetector* %11, i32 0, i32 15, !dbg !931
  store i32 1, i32* %52, align 4, !dbg !931
  ret void, !dbg !932

; <label>:53                                      ; preds = %41, %33, %28, %15, %0
  %54 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup, !dbg !932
  %55 = extractvalue { i8*, i32 } %54, 0, !dbg !932
  store i8* %55, i8** %9, !dbg !932
  %56 = extractvalue { i8*, i32 } %54, 1, !dbg !932
  store i32 %56, i32* %10, !dbg !932
  %57 = bitcast %class.btGjkPairDetector* %11 to %struct.btDiscreteCollisionDetectorInterface*, !dbg !932
  invoke void @_ZN36btDiscreteCollisionDetectorInterfaceD2Ev(%struct.btDiscreteCollisionDetectorInterface* %57)
          to label %58 unwind label %64, !dbg !932

; <label>:58                                      ; preds = %53
  br label %59, !dbg !933

; <label>:59                                      ; preds = %58
  %60 = load i8** %9, !dbg !934
  %61 = load i32* %10, !dbg !934
  %62 = insertvalue { i8*, i32 } undef, i8* %60, 0, !dbg !934
  %63 = insertvalue { i8*, i32 } %62, i32 %61, 1, !dbg !934
  resume { i8*, i32 } %63, !dbg !934

; <label>:64                                      ; preds = %53
  %65 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          catch i8* null, !dbg !936
  %66 = extractvalue { i8*, i32 } %65, 0, !dbg !936
  call void @__clang_call_terminate(i8* %66) #10, !dbg !936
  unreachable, !dbg !936
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr void @_ZN36btDiscreteCollisionDetectorInterfaceC2Ev(%struct.btDiscreteCollisionDetectorInterface* %this) unnamed_addr #2 align 2 {
  %1 = alloca %struct.btDiscreteCollisionDetectorInterface*, align 8
  store %struct.btDiscreteCollisionDetectorInterface* %this, %struct.btDiscreteCollisionDetectorInterface** %1, align 8
  call void @llvm.dbg.declare(metadata %struct.btDiscreteCollisionDetectorInterface** %1, metadata !938, metadata !896), !dbg !940
  %2 = load %struct.btDiscreteCollisionDetectorInterface** %1
  %3 = bitcast %struct.btDiscreteCollisionDetectorInterface* %2 to i32 (...)***, !dbg !941
  store i32 (...)** bitcast (i8** getelementptr inbounds ([5 x i8*]* @_ZTV36btDiscreteCollisionDetectorInterface, i64 0, i64 2) to i32 (...)**), i32 (...)*** %3, !dbg !941
  ret void, !dbg !941
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr void @_ZN9btVector3C2ERKfS1_S1_(%class.btVector3* %this, float* dereferenceable(4) %_x, float* dereferenceable(4) %_y, float* dereferenceable(4) %_z) unnamed_addr #2 align 2 {
  %1 = alloca %class.btVector3*, align 8
  %2 = alloca float*, align 8
  %3 = alloca float*, align 8
  %4 = alloca float*, align 8
  store %class.btVector3* %this, %class.btVector3** %1, align 8
  call void @llvm.dbg.declare(metadata %class.btVector3** %1, metadata !942, metadata !896), !dbg !943
  store float* %_x, float** %2, align 8
  call void @llvm.dbg.declare(metadata float** %2, metadata !944, metadata !896), !dbg !945
  store float* %_y, float** %3, align 8
  call void @llvm.dbg.declare(metadata float** %3, metadata !946, metadata !896), !dbg !947
  store float* %_z, float** %4, align 8
  call void @llvm.dbg.declare(metadata float** %4, metadata !948, metadata !896), !dbg !949
  %5 = load %class.btVector3** %1
  %6 = load float** %2, align 8, !dbg !950
  %7 = load float* %6, align 4, !dbg !950
  %8 = getelementptr inbounds %class.btVector3* %5, i32 0, i32 0, !dbg !952
  %9 = getelementptr inbounds [4 x float]* %8, i32 0, i64 0, !dbg !952
  store float %7, float* %9, align 4, !dbg !952
  %10 = load float** %3, align 8, !dbg !953
  %11 = load float* %10, align 4, !dbg !953
  %12 = getelementptr inbounds %class.btVector3* %5, i32 0, i32 0, !dbg !954
  %13 = getelementptr inbounds [4 x float]* %12, i32 0, i64 1, !dbg !954
  store float %11, float* %13, align 4, !dbg !954
  %14 = load float** %4, align 8, !dbg !955
  %15 = load float* %14, align 4, !dbg !955
  %16 = getelementptr inbounds %class.btVector3* %5, i32 0, i32 0, !dbg !956
  %17 = getelementptr inbounds [4 x float]* %16, i32 0, i64 2, !dbg !956
  store float %15, float* %17, align 4, !dbg !956
  %18 = getelementptr inbounds %class.btVector3* %5, i32 0, i32 0, !dbg !957
  %19 = getelementptr inbounds [4 x float]* %18, i32 0, i64 3, !dbg !957
  store float 0.000000e+00, float* %19, align 4, !dbg !957
  ret void, !dbg !958
}

declare i32 @__gxx_personality_v0(...)

; Function Attrs: nounwind uwtable
define linkonce_odr i32 @_ZNK16btCollisionShape12getShapeTypeEv(%class.btCollisionShape* %this) #3 align 2 {
  %1 = alloca %class.btCollisionShape*, align 8
  store %class.btCollisionShape* %this, %class.btCollisionShape** %1, align 8
  call void @llvm.dbg.declare(metadata %class.btCollisionShape** %1, metadata !959, metadata !896), !dbg !961
  %2 = load %class.btCollisionShape** %1
  %3 = getelementptr inbounds %class.btCollisionShape* %2, i32 0, i32 1, !dbg !962
  %4 = load i32* %3, align 4, !dbg !962
  ret i32 %4, !dbg !963
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
  call void @llvm.dbg.declare(metadata %class.btGjkPairDetector** %1, metadata !964, metadata !896), !dbg !965
  store %class.btConvexShape* %objectA, %class.btConvexShape** %2, align 8
  call void @llvm.dbg.declare(metadata %class.btConvexShape** %2, metadata !966, metadata !896), !dbg !967
  store %class.btConvexShape* %objectB, %class.btConvexShape** %3, align 8
  call void @llvm.dbg.declare(metadata %class.btConvexShape** %3, metadata !968, metadata !896), !dbg !969
  store i32 %shapeTypeA, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !970, metadata !896), !dbg !971
  store i32 %shapeTypeB, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !972, metadata !896), !dbg !973
  store float %marginA, float* %6, align 4
  call void @llvm.dbg.declare(metadata float* %6, metadata !974, metadata !896), !dbg !975
  store float %marginB, float* %7, align 4
  call void @llvm.dbg.declare(metadata float* %7, metadata !976, metadata !896), !dbg !977
  store %class.btVoronoiSimplexSolver* %simplexSolver, %class.btVoronoiSimplexSolver** %8, align 8
  call void @llvm.dbg.declare(metadata %class.btVoronoiSimplexSolver** %8, metadata !978, metadata !896), !dbg !979
  store %class.btConvexPenetrationDepthSolver* %penetrationDepthSolver, %class.btConvexPenetrationDepthSolver** %9, align 8
  call void @llvm.dbg.declare(metadata %class.btConvexPenetrationDepthSolver** %9, metadata !980, metadata !896), !dbg !981
  %15 = load %class.btGjkPairDetector** %1
  %16 = bitcast %class.btGjkPairDetector* %15 to %struct.btDiscreteCollisionDetectorInterface*, !dbg !982
  call void @_ZN36btDiscreteCollisionDetectorInterfaceC2Ev(%struct.btDiscreteCollisionDetectorInterface* %16) #7, !dbg !982
  %17 = bitcast %class.btGjkPairDetector* %15 to i32 (...)***, !dbg !982
  store i32 (...)** bitcast (i8** getelementptr inbounds ([5 x i8*]* @_ZTV17btGjkPairDetector, i64 0, i64 2) to i32 (...)**), i32 (...)*** %17, !dbg !982
  %18 = getelementptr inbounds %class.btGjkPairDetector* %15, i32 0, i32 1, !dbg !983
  store float 0.000000e+00, float* %10, !dbg !983
  store float 1.000000e+00, float* %11, !dbg !983
  store float 0.000000e+00, float* %12, !dbg !983
  invoke void @_ZN9btVector3C2ERKfS1_S1_(%class.btVector3* %18, float* dereferenceable(4) %10, float* dereferenceable(4) %11, float* dereferenceable(4) %12)
          to label %19 unwind label %39, !dbg !983

; <label>:19                                      ; preds = %0
  %20 = getelementptr inbounds %class.btGjkPairDetector* %15, i32 0, i32 2, !dbg !984
  %21 = load %class.btConvexPenetrationDepthSolver** %9, align 8, !dbg !985
  store %class.btConvexPenetrationDepthSolver* %21, %class.btConvexPenetrationDepthSolver** %20, align 8, !dbg !984
  %22 = getelementptr inbounds %class.btGjkPairDetector* %15, i32 0, i32 3, !dbg !986
  %23 = load %class.btVoronoiSimplexSolver** %8, align 8, !dbg !987
  store %class.btVoronoiSimplexSolver* %23, %class.btVoronoiSimplexSolver** %22, align 8, !dbg !986
  %24 = getelementptr inbounds %class.btGjkPairDetector* %15, i32 0, i32 4, !dbg !988
  %25 = load %class.btConvexShape** %2, align 8, !dbg !989
  store %class.btConvexShape* %25, %class.btConvexShape** %24, align 8, !dbg !988
  %26 = getelementptr inbounds %class.btGjkPairDetector* %15, i32 0, i32 5, !dbg !990
  %27 = load %class.btConvexShape** %3, align 8, !dbg !991
  store %class.btConvexShape* %27, %class.btConvexShape** %26, align 8, !dbg !990
  %28 = getelementptr inbounds %class.btGjkPairDetector* %15, i32 0, i32 6, !dbg !992
  %29 = load i32* %4, align 4, !dbg !993
  store i32 %29, i32* %28, align 4, !dbg !992
  %30 = getelementptr inbounds %class.btGjkPairDetector* %15, i32 0, i32 7, !dbg !994
  %31 = load i32* %5, align 4, !dbg !995
  store i32 %31, i32* %30, align 4, !dbg !994
  %32 = getelementptr inbounds %class.btGjkPairDetector* %15, i32 0, i32 8, !dbg !996
  %33 = load float* %6, align 4, !dbg !997
  store float %33, float* %32, align 4, !dbg !996
  %34 = getelementptr inbounds %class.btGjkPairDetector* %15, i32 0, i32 9, !dbg !998
  %35 = load float* %7, align 4, !dbg !999
  store float %35, float* %34, align 4, !dbg !998
  %36 = getelementptr inbounds %class.btGjkPairDetector* %15, i32 0, i32 10, !dbg !1000
  store i8 0, i8* %36, align 1, !dbg !1000
  %37 = getelementptr inbounds %class.btGjkPairDetector* %15, i32 0, i32 12, !dbg !1001
  store i32 -1, i32* %37, align 4, !dbg !1001
  %38 = getelementptr inbounds %class.btGjkPairDetector* %15, i32 0, i32 15, !dbg !1002
  store i32 1, i32* %38, align 4, !dbg !1002
  ret void, !dbg !1003

; <label>:39                                      ; preds = %0
  %40 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup, !dbg !1003
  %41 = extractvalue { i8*, i32 } %40, 0, !dbg !1003
  store i8* %41, i8** %13, !dbg !1003
  %42 = extractvalue { i8*, i32 } %40, 1, !dbg !1003
  store i32 %42, i32* %14, !dbg !1003
  %43 = bitcast %class.btGjkPairDetector* %15 to %struct.btDiscreteCollisionDetectorInterface*, !dbg !1003
  invoke void @_ZN36btDiscreteCollisionDetectorInterfaceD2Ev(%struct.btDiscreteCollisionDetectorInterface* %43)
          to label %44 unwind label %50, !dbg !1003

; <label>:44                                      ; preds = %39
  br label %45, !dbg !1004

; <label>:45                                      ; preds = %44
  %46 = load i8** %13, !dbg !1006
  %47 = load i32* %14, !dbg !1006
  %48 = insertvalue { i8*, i32 } undef, i8* %46, 0, !dbg !1006
  %49 = insertvalue { i8*, i32 } %48, i32 %47, 1, !dbg !1006
  resume { i8*, i32 } %49, !dbg !1006

; <label>:50                                      ; preds = %39
  %51 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          catch i8* null, !dbg !1008
  %52 = extractvalue { i8*, i32 } %51, 0, !dbg !1008
  call void @__clang_call_terminate(i8* %52) #10, !dbg !1008
  unreachable, !dbg !1008
}

; Function Attrs: uwtable
define void @_ZN17btGjkPairDetector16getClosestPointsERKN36btDiscreteCollisionDetectorInterface17ClosestPointInputERNS0_6ResultEP12btIDebugDrawb(%class.btGjkPairDetector* %this, %"struct.btDiscreteCollisionDetectorInterface::ClosestPointInput"* dereferenceable(144) %input, %"struct.btDiscreteCollisionDetectorInterface::Result"* dereferenceable(8) %output, %class.btIDebugDraw* %debugDraw, i1 zeroext %swapResults) unnamed_addr #0 align 2 {
  %1 = alloca %class.btGjkPairDetector*, align 8
  %2 = alloca %"struct.btDiscreteCollisionDetectorInterface::ClosestPointInput"*, align 8
  %3 = alloca %"struct.btDiscreteCollisionDetectorInterface::Result"*, align 8
  %4 = alloca %class.btIDebugDraw*, align 8
  %5 = alloca i8, align 1
  store %class.btGjkPairDetector* %this, %class.btGjkPairDetector** %1, align 8
  call void @llvm.dbg.declare(metadata %class.btGjkPairDetector** %1, metadata !1010, metadata !896), !dbg !1011
  store %"struct.btDiscreteCollisionDetectorInterface::ClosestPointInput"* %input, %"struct.btDiscreteCollisionDetectorInterface::ClosestPointInput"** %2, align 8
  call void @llvm.dbg.declare(metadata %"struct.btDiscreteCollisionDetectorInterface::ClosestPointInput"** %2, metadata !1012, metadata !896), !dbg !1013
  store %"struct.btDiscreteCollisionDetectorInterface::Result"* %output, %"struct.btDiscreteCollisionDetectorInterface::Result"** %3, align 8
  call void @llvm.dbg.declare(metadata %"struct.btDiscreteCollisionDetectorInterface::Result"** %3, metadata !1014, metadata !896), !dbg !1015
  store %class.btIDebugDraw* %debugDraw, %class.btIDebugDraw** %4, align 8
  call void @llvm.dbg.declare(metadata %class.btIDebugDraw** %4, metadata !1016, metadata !896), !dbg !1017
  %6 = zext i1 %swapResults to i8
  store i8 %6, i8* %5, align 1
  call void @llvm.dbg.declare(metadata i8* %5, metadata !1018, metadata !896), !dbg !1019
  %7 = load %class.btGjkPairDetector** %1
  %8 = load %"struct.btDiscreteCollisionDetectorInterface::ClosestPointInput"** %2, align 8, !dbg !1020
  %9 = load %"struct.btDiscreteCollisionDetectorInterface::Result"** %3, align 8, !dbg !1020
  %10 = load %class.btIDebugDraw** %4, align 8, !dbg !1021
  call void @_ZN17btGjkPairDetector26getClosestPointsNonVirtualERKN36btDiscreteCollisionDetectorInterface17ClosestPointInputERNS0_6ResultEP12btIDebugDraw(%class.btGjkPairDetector* %7, %"struct.btDiscreteCollisionDetectorInterface::ClosestPointInput"* dereferenceable(144) %8, %"struct.btDiscreteCollisionDetectorInterface::Result"* dereferenceable(8) %9, %class.btIDebugDraw* %10), !dbg !1020
  ret void, !dbg !1022
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
  call void @llvm.dbg.declare(metadata %class.btGjkPairDetector** %1, metadata !1023, metadata !896), !dbg !1024
  store %"struct.btDiscreteCollisionDetectorInterface::ClosestPointInput"* %input, %"struct.btDiscreteCollisionDetectorInterface::ClosestPointInput"** %2, align 8
  call void @llvm.dbg.declare(metadata %"struct.btDiscreteCollisionDetectorInterface::ClosestPointInput"** %2, metadata !1025, metadata !896), !dbg !1026
  store %"struct.btDiscreteCollisionDetectorInterface::Result"* %output, %"struct.btDiscreteCollisionDetectorInterface::Result"** %3, align 8
  call void @llvm.dbg.declare(metadata %"struct.btDiscreteCollisionDetectorInterface::Result"** %3, metadata !1027, metadata !896), !dbg !1028
  store %class.btIDebugDraw* %debugDraw, %class.btIDebugDraw** %4, align 8
  call void @llvm.dbg.declare(metadata %class.btIDebugDraw** %4, metadata !1029, metadata !896), !dbg !1030
  %24 = load %class.btGjkPairDetector** %1
  %25 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 11, !dbg !1031
  store float 0.000000e+00, float* %25, align 4, !dbg !1031
  call void @llvm.dbg.declare(metadata float* %distance, metadata !1032, metadata !896), !dbg !1033
  store float 0.000000e+00, float* %distance, align 4, !dbg !1033
  call void @llvm.dbg.declare(metadata %class.btVector3* %normalInB, metadata !1034, metadata !896), !dbg !1035
  store float 0.000000e+00, float* %5, !dbg !1035
  store float 0.000000e+00, float* %6, !dbg !1035
  store float 0.000000e+00, float* %7, !dbg !1035
  call void @_ZN9btVector3C2ERKfS1_S1_(%class.btVector3* %normalInB, float* dereferenceable(4) %5, float* dereferenceable(4) %6, float* dereferenceable(4) %7), !dbg !1035
  call void @llvm.dbg.declare(metadata %class.btVector3* %pointOnA, metadata !1036, metadata !896), !dbg !1037
  call void @_ZN9btVector3C2Ev(%class.btVector3* %pointOnA), !dbg !1037
  call void @llvm.dbg.declare(metadata %class.btVector3* %pointOnB, metadata !1038, metadata !896), !dbg !1039
  call void @_ZN9btVector3C2Ev(%class.btVector3* %pointOnB), !dbg !1039
  call void @llvm.dbg.declare(metadata %class.btTransform* %localTransA, metadata !1040, metadata !896), !dbg !1041
  %26 = load %"struct.btDiscreteCollisionDetectorInterface::ClosestPointInput"** %2, align 8, !dbg !1041
  %27 = getelementptr inbounds %"struct.btDiscreteCollisionDetectorInterface::ClosestPointInput"* %26, i32 0, i32 0, !dbg !1041
  call void @_ZN11btTransformC2ERKS_(%class.btTransform* %localTransA, %class.btTransform* dereferenceable(64) %27), !dbg !1041
  call void @llvm.dbg.declare(metadata %class.btTransform* %localTransB, metadata !1042, metadata !896), !dbg !1043
  %28 = load %"struct.btDiscreteCollisionDetectorInterface::ClosestPointInput"** %2, align 8, !dbg !1043
  %29 = getelementptr inbounds %"struct.btDiscreteCollisionDetectorInterface::ClosestPointInput"* %28, i32 0, i32 1, !dbg !1043
  call void @_ZN11btTransformC2ERKS_(%class.btTransform* %localTransB, %class.btTransform* dereferenceable(64) %29), !dbg !1043
  call void @llvm.dbg.declare(metadata %class.btVector3* %positionOffset, metadata !1044, metadata !896), !dbg !1045
  %30 = call dereferenceable(16) %class.btVector3* @_ZN11btTransform9getOriginEv(%class.btTransform* %localTransA), !dbg !1046
  %31 = call dereferenceable(16) %class.btVector3* @_ZN11btTransform9getOriginEv(%class.btTransform* %localTransB), !dbg !1047
  %32 = call { <2 x float>, <2 x float> } @_ZplRK9btVector3S1_(%class.btVector3* dereferenceable(16) %30, %class.btVector3* dereferenceable(16) %31), !dbg !1048
  %33 = getelementptr %class.btVector3* %8, i32 0, i32 0, !dbg !1048
  %34 = bitcast [4 x float]* %33 to { <2 x float>, <2 x float> }*, !dbg !1048
  %35 = getelementptr { <2 x float>, <2 x float> }* %34, i32 0, i32 0, !dbg !1048
  %36 = extractvalue { <2 x float>, <2 x float> } %32, 0, !dbg !1048
  store <2 x float> %36, <2 x float>* %35, align 1, !dbg !1048
  %37 = getelementptr { <2 x float>, <2 x float> }* %34, i32 0, i32 1, !dbg !1048
  %38 = extractvalue { <2 x float>, <2 x float> } %32, 1, !dbg !1048
  store <2 x float> %38, <2 x float>* %37, align 1, !dbg !1048
  store float 5.000000e-01, float* %9, !dbg !1049
  %39 = call { <2 x float>, <2 x float> } @_ZmlRK9btVector3RKf(%class.btVector3* dereferenceable(16) %8, float* dereferenceable(4) %9), !dbg !1049
  %40 = getelementptr %class.btVector3* %positionOffset, i32 0, i32 0, !dbg !1049
  %41 = bitcast [4 x float]* %40 to { <2 x float>, <2 x float> }*, !dbg !1049
  %42 = getelementptr { <2 x float>, <2 x float> }* %41, i32 0, i32 0, !dbg !1049
  %43 = extractvalue { <2 x float>, <2 x float> } %39, 0, !dbg !1049
  store <2 x float> %43, <2 x float>* %42, align 1, !dbg !1049
  %44 = getelementptr { <2 x float>, <2 x float> }* %41, i32 0, i32 1, !dbg !1049
  %45 = extractvalue { <2 x float>, <2 x float> } %39, 1, !dbg !1049
  store <2 x float> %45, <2 x float>* %44, align 1, !dbg !1049
  %46 = call dereferenceable(16) %class.btVector3* @_ZN11btTransform9getOriginEv(%class.btTransform* %localTransA), !dbg !1050
  %47 = call dereferenceable(16) %class.btVector3* @_ZN9btVector3mIERKS_(%class.btVector3* %46, %class.btVector3* dereferenceable(16) %positionOffset), !dbg !1050
  %48 = call dereferenceable(16) %class.btVector3* @_ZN11btTransform9getOriginEv(%class.btTransform* %localTransB), !dbg !1051
  %49 = call dereferenceable(16) %class.btVector3* @_ZN9btVector3mIERKS_(%class.btVector3* %48, %class.btVector3* dereferenceable(16) %positionOffset), !dbg !1051
  call void @llvm.dbg.declare(metadata i8* %check2d, metadata !1052, metadata !896), !dbg !1053
  %50 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 4, !dbg !1054
  %51 = load %class.btConvexShape** %50, align 8, !dbg !1054
  %52 = bitcast %class.btConvexShape* %51 to %class.btCollisionShape*, !dbg !1054
  %53 = call zeroext i1 @_ZNK16btCollisionShape10isConvex2dEv(%class.btCollisionShape* %52), !dbg !1054
  br i1 %53, label %54, label %59, !dbg !1054

; <label>:54                                      ; preds = %0
  %55 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 5, !dbg !1055
  %56 = load %class.btConvexShape** %55, align 8, !dbg !1055
  %57 = bitcast %class.btConvexShape* %56 to %class.btCollisionShape*, !dbg !1055
  %58 = call zeroext i1 @_ZNK16btCollisionShape10isConvex2dEv(%class.btCollisionShape* %57), !dbg !1055
  br label %59

; <label>:59                                      ; preds = %54, %0
  %60 = phi i1 [ false, %0 ], [ %58, %54 ]
  %61 = zext i1 %60 to i8, !dbg !1057
  store i8 %61, i8* %check2d, align 1, !dbg !1057
  call void @llvm.dbg.declare(metadata float* %marginA, metadata !1059, metadata !896), !dbg !1060
  %62 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 8, !dbg !1061
  %63 = load float* %62, align 4, !dbg !1061
  store float %63, float* %marginA, align 4, !dbg !1060
  call void @llvm.dbg.declare(metadata float* %marginB, metadata !1062, metadata !896), !dbg !1063
  %64 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 9, !dbg !1064
  %65 = load float* %64, align 4, !dbg !1064
  store float %65, float* %marginB, align 4, !dbg !1063
  %66 = load i32* @gNumGjkChecks, align 4, !dbg !1065
  %67 = add nsw i32 %66, 1, !dbg !1065
  store i32 %67, i32* @gNumGjkChecks, align 4, !dbg !1065
  %68 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 10, !dbg !1066
  %69 = load i8* %68, align 1, !dbg !1066
  %70 = trunc i8 %69 to i1, !dbg !1066
  br i1 %70, label %71, label %72, !dbg !1068

; <label>:71                                      ; preds = %59
  store float 0.000000e+00, float* %marginA, align 4, !dbg !1069
  store float 0.000000e+00, float* %marginB, align 4, !dbg !1071
  br label %72, !dbg !1072

; <label>:72                                      ; preds = %71, %59
  %73 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 13, !dbg !1073
  store i32 0, i32* %73, align 4, !dbg !1073
  call void @llvm.dbg.declare(metadata i32* %gGjkMaxIter, metadata !1074, metadata !896), !dbg !1075
  store i32 1000, i32* %gGjkMaxIter, align 4, !dbg !1075
  %74 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 1, !dbg !1076
  store float 0.000000e+00, float* %10, !dbg !1076
  store float 1.000000e+00, float* %11, !dbg !1076
  store float 0.000000e+00, float* %12, !dbg !1076
  call void @_ZN9btVector38setValueERKfS1_S1_(%class.btVector3* %74, float* dereferenceable(4) %10, float* dereferenceable(4) %11, float* dereferenceable(4) %12), !dbg !1076
  call void @llvm.dbg.declare(metadata i8* %isValid, metadata !1077, metadata !896), !dbg !1078
  store i8 0, i8* %isValid, align 1, !dbg !1078
  call void @llvm.dbg.declare(metadata i8* %checkSimplex, metadata !1079, metadata !896), !dbg !1080
  store i8 0, i8* %checkSimplex, align 1, !dbg !1080
  call void @llvm.dbg.declare(metadata i8* %checkPenetration, metadata !1081, metadata !896), !dbg !1082
  store i8 1, i8* %checkPenetration, align 1, !dbg !1082
  %75 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 14, !dbg !1083
  store i32 0, i32* %75, align 4, !dbg !1083
  %76 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 12, !dbg !1084
  store i32 -1, i32* %76, align 4, !dbg !1084
  call void @llvm.dbg.declare(metadata float* %squaredDistance, metadata !1085, metadata !896), !dbg !1087
  store float 0x43ABC16D60000000, float* %squaredDistance, align 4, !dbg !1087
  call void @llvm.dbg.declare(metadata float* %delta, metadata !1088, metadata !896), !dbg !1089
  store float 0.000000e+00, float* %delta, align 4, !dbg !1089
  call void @llvm.dbg.declare(metadata float* %margin, metadata !1090, metadata !896), !dbg !1091
  %77 = load float* %marginA, align 4, !dbg !1092
  %78 = load float* %marginB, align 4, !dbg !1093
  %79 = fadd float %77, %78, !dbg !1092
  store float %79, float* %margin, align 4, !dbg !1091
  %80 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 3, !dbg !1094
  %81 = load %class.btVoronoiSimplexSolver** %80, align 8, !dbg !1094
  call void @_ZN22btVoronoiSimplexSolver5resetEv(%class.btVoronoiSimplexSolver* %81), !dbg !1094
  br label %82, !dbg !1095

; <label>:82                                      ; preds = %245, %72
  call void @llvm.dbg.declare(metadata %class.btVector3* %seperatingAxisInA, metadata !1096, metadata !896), !dbg !1100
  %83 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 1, !dbg !1101
  %84 = call { <2 x float>, <2 x float> } @_ZngRK9btVector3(%class.btVector3* dereferenceable(16) %83), !dbg !1101
  %85 = getelementptr %class.btVector3* %13, i32 0, i32 0, !dbg !1101
  %86 = bitcast [4 x float]* %85 to { <2 x float>, <2 x float> }*, !dbg !1101
  %87 = getelementptr { <2 x float>, <2 x float> }* %86, i32 0, i32 0, !dbg !1101
  %88 = extractvalue { <2 x float>, <2 x float> } %84, 0, !dbg !1101
  store <2 x float> %88, <2 x float>* %87, align 1, !dbg !1101
  %89 = getelementptr { <2 x float>, <2 x float> }* %86, i32 0, i32 1, !dbg !1101
  %90 = extractvalue { <2 x float>, <2 x float> } %84, 1, !dbg !1101
  store <2 x float> %90, <2 x float>* %89, align 1, !dbg !1101
  %91 = load %"struct.btDiscreteCollisionDetectorInterface::ClosestPointInput"** %2, align 8, !dbg !1102
  %92 = getelementptr inbounds %"struct.btDiscreteCollisionDetectorInterface::ClosestPointInput"* %91, i32 0, i32 0, !dbg !1102
  %93 = call dereferenceable(48) %class.btMatrix3x3* @_ZNK11btTransform8getBasisEv(%class.btTransform* %92), !dbg !1102
  %94 = call { <2 x float>, <2 x float> } @_ZmlRK9btVector3RK11btMatrix3x3(%class.btVector3* dereferenceable(16) %13, %class.btMatrix3x3* dereferenceable(48) %93), !dbg !1103
  %95 = getelementptr %class.btVector3* %seperatingAxisInA, i32 0, i32 0, !dbg !1103
  %96 = bitcast [4 x float]* %95 to { <2 x float>, <2 x float> }*, !dbg !1103
  %97 = getelementptr { <2 x float>, <2 x float> }* %96, i32 0, i32 0, !dbg !1103
  %98 = extractvalue { <2 x float>, <2 x float> } %94, 0, !dbg !1103
  store <2 x float> %98, <2 x float>* %97, align 1, !dbg !1103
  %99 = getelementptr { <2 x float>, <2 x float> }* %96, i32 0, i32 1, !dbg !1103
  %100 = extractvalue { <2 x float>, <2 x float> } %94, 1, !dbg !1103
  store <2 x float> %100, <2 x float>* %99, align 1, !dbg !1103
  call void @llvm.dbg.declare(metadata %class.btVector3* %seperatingAxisInB, metadata !1104, metadata !896), !dbg !1105
  %101 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 1, !dbg !1106
  %102 = load %"struct.btDiscreteCollisionDetectorInterface::ClosestPointInput"** %2, align 8, !dbg !1107
  %103 = getelementptr inbounds %"struct.btDiscreteCollisionDetectorInterface::ClosestPointInput"* %102, i32 0, i32 1, !dbg !1107
  %104 = call dereferenceable(48) %class.btMatrix3x3* @_ZNK11btTransform8getBasisEv(%class.btTransform* %103), !dbg !1107
  %105 = call { <2 x float>, <2 x float> } @_ZmlRK9btVector3RK11btMatrix3x3(%class.btVector3* dereferenceable(16) %101, %class.btMatrix3x3* dereferenceable(48) %104), !dbg !1108
  %106 = getelementptr %class.btVector3* %seperatingAxisInB, i32 0, i32 0, !dbg !1108
  %107 = bitcast [4 x float]* %106 to { <2 x float>, <2 x float> }*, !dbg !1108
  %108 = getelementptr { <2 x float>, <2 x float> }* %107, i32 0, i32 0, !dbg !1108
  %109 = extractvalue { <2 x float>, <2 x float> } %105, 0, !dbg !1108
  store <2 x float> %109, <2 x float>* %108, align 1, !dbg !1108
  %110 = getelementptr { <2 x float>, <2 x float> }* %107, i32 0, i32 1, !dbg !1108
  %111 = extractvalue { <2 x float>, <2 x float> } %105, 1, !dbg !1108
  store <2 x float> %111, <2 x float>* %110, align 1, !dbg !1108
  call void @llvm.dbg.declare(metadata %class.btVector3* %pInA, metadata !1109, metadata !896), !dbg !1110
  %112 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 4, !dbg !1111
  %113 = load %class.btConvexShape** %112, align 8, !dbg !1111
  %114 = call { <2 x float>, <2 x float> } @_ZNK13btConvexShape44localGetSupportVertexWithoutMarginNonVirtualERK9btVector3(%class.btConvexShape* %113, %class.btVector3* dereferenceable(16) %seperatingAxisInA), !dbg !1111
  %115 = getelementptr %class.btVector3* %pInA, i32 0, i32 0, !dbg !1111
  %116 = bitcast [4 x float]* %115 to { <2 x float>, <2 x float> }*, !dbg !1111
  %117 = getelementptr { <2 x float>, <2 x float> }* %116, i32 0, i32 0, !dbg !1111
  %118 = extractvalue { <2 x float>, <2 x float> } %114, 0, !dbg !1111
  store <2 x float> %118, <2 x float>* %117, align 1, !dbg !1111
  %119 = getelementptr { <2 x float>, <2 x float> }* %116, i32 0, i32 1, !dbg !1111
  %120 = extractvalue { <2 x float>, <2 x float> } %114, 1, !dbg !1111
  store <2 x float> %120, <2 x float>* %119, align 1, !dbg !1111
  call void @llvm.dbg.declare(metadata %class.btVector3* %qInB, metadata !1112, metadata !896), !dbg !1113
  %121 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 5, !dbg !1114
  %122 = load %class.btConvexShape** %121, align 8, !dbg !1114
  %123 = call { <2 x float>, <2 x float> } @_ZNK13btConvexShape44localGetSupportVertexWithoutMarginNonVirtualERK9btVector3(%class.btConvexShape* %122, %class.btVector3* dereferenceable(16) %seperatingAxisInB), !dbg !1114
  %124 = getelementptr %class.btVector3* %qInB, i32 0, i32 0, !dbg !1114
  %125 = bitcast [4 x float]* %124 to { <2 x float>, <2 x float> }*, !dbg !1114
  %126 = getelementptr { <2 x float>, <2 x float> }* %125, i32 0, i32 0, !dbg !1114
  %127 = extractvalue { <2 x float>, <2 x float> } %123, 0, !dbg !1114
  store <2 x float> %127, <2 x float>* %126, align 1, !dbg !1114
  %128 = getelementptr { <2 x float>, <2 x float> }* %125, i32 0, i32 1, !dbg !1114
  %129 = extractvalue { <2 x float>, <2 x float> } %123, 1, !dbg !1114
  store <2 x float> %129, <2 x float>* %128, align 1, !dbg !1114
  call void @llvm.dbg.declare(metadata %class.btVector3* %pWorld, metadata !1115, metadata !896), !dbg !1116
  %130 = call { <2 x float>, <2 x float> } @_ZNK11btTransformclERK9btVector3(%class.btTransform* %localTransA, %class.btVector3* dereferenceable(16) %pInA), !dbg !1117
  %131 = getelementptr %class.btVector3* %pWorld, i32 0, i32 0, !dbg !1117
  %132 = bitcast [4 x float]* %131 to { <2 x float>, <2 x float> }*, !dbg !1117
  %133 = getelementptr { <2 x float>, <2 x float> }* %132, i32 0, i32 0, !dbg !1117
  %134 = extractvalue { <2 x float>, <2 x float> } %130, 0, !dbg !1117
  store <2 x float> %134, <2 x float>* %133, align 1, !dbg !1117
  %135 = getelementptr { <2 x float>, <2 x float> }* %132, i32 0, i32 1, !dbg !1117
  %136 = extractvalue { <2 x float>, <2 x float> } %130, 1, !dbg !1117
  store <2 x float> %136, <2 x float>* %135, align 1, !dbg !1117
  call void @llvm.dbg.declare(metadata %class.btVector3* %qWorld, metadata !1118, metadata !896), !dbg !1119
  %137 = call { <2 x float>, <2 x float> } @_ZNK11btTransformclERK9btVector3(%class.btTransform* %localTransB, %class.btVector3* dereferenceable(16) %qInB), !dbg !1120
  %138 = getelementptr %class.btVector3* %qWorld, i32 0, i32 0, !dbg !1120
  %139 = bitcast [4 x float]* %138 to { <2 x float>, <2 x float> }*, !dbg !1120
  %140 = getelementptr { <2 x float>, <2 x float> }* %139, i32 0, i32 0, !dbg !1120
  %141 = extractvalue { <2 x float>, <2 x float> } %137, 0, !dbg !1120
  store <2 x float> %141, <2 x float>* %140, align 1, !dbg !1120
  %142 = getelementptr { <2 x float>, <2 x float> }* %139, i32 0, i32 1, !dbg !1120
  %143 = extractvalue { <2 x float>, <2 x float> } %137, 1, !dbg !1120
  store <2 x float> %143, <2 x float>* %142, align 1, !dbg !1120
  %144 = load i8* %check2d, align 1, !dbg !1121
  %145 = trunc i8 %144 to i1, !dbg !1121
  br i1 %145, label %146, label %151, !dbg !1123

; <label>:146                                     ; preds = %82
  %147 = call float* @_ZN9btVector3cvPfEv(%class.btVector3* %pWorld), !dbg !1124
  %148 = getelementptr inbounds float* %147, i64 2, !dbg !1124
  store float 0.000000e+00, float* %148, align 4, !dbg !1124
  %149 = call float* @_ZN9btVector3cvPfEv(%class.btVector3* %qWorld), !dbg !1126
  %150 = getelementptr inbounds float* %149, i64 2, !dbg !1126
  store float 0.000000e+00, float* %150, align 4, !dbg !1126
  br label %151, !dbg !1127

; <label>:151                                     ; preds = %146, %82
  call void @llvm.dbg.declare(metadata %class.btVector3* %w, metadata !1128, metadata !896), !dbg !1129
  %152 = call { <2 x float>, <2 x float> } @_ZmiRK9btVector3S1_(%class.btVector3* dereferenceable(16) %pWorld, %class.btVector3* dereferenceable(16) %qWorld), !dbg !1130
  %153 = getelementptr %class.btVector3* %w, i32 0, i32 0, !dbg !1130
  %154 = bitcast [4 x float]* %153 to { <2 x float>, <2 x float> }*, !dbg !1130
  %155 = getelementptr { <2 x float>, <2 x float> }* %154, i32 0, i32 0, !dbg !1130
  %156 = extractvalue { <2 x float>, <2 x float> } %152, 0, !dbg !1130
  store <2 x float> %156, <2 x float>* %155, align 1, !dbg !1130
  %157 = getelementptr { <2 x float>, <2 x float> }* %154, i32 0, i32 1, !dbg !1130
  %158 = extractvalue { <2 x float>, <2 x float> } %152, 1, !dbg !1130
  store <2 x float> %158, <2 x float>* %157, align 1, !dbg !1130
  %159 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 1, !dbg !1131
  %160 = call float @_ZNK9btVector33dotERKS_(%class.btVector3* %159, %class.btVector3* dereferenceable(16) %w), !dbg !1131
  store float %160, float* %delta, align 4, !dbg !1132
  %161 = load float* %delta, align 4, !dbg !1133
  %162 = fcmp ogt float %161, 0.000000e+00, !dbg !1133
  br i1 %162, label %163, label %175, !dbg !1135

; <label>:163                                     ; preds = %151
  %164 = load float* %delta, align 4, !dbg !1136
  %165 = load float* %delta, align 4, !dbg !1138
  %166 = fmul float %164, %165, !dbg !1139
  %167 = load float* %squaredDistance, align 4, !dbg !1140
  %168 = load %"struct.btDiscreteCollisionDetectorInterface::ClosestPointInput"** %2, align 8, !dbg !1141
  %169 = getelementptr inbounds %"struct.btDiscreteCollisionDetectorInterface::ClosestPointInput"* %168, i32 0, i32 2, !dbg !1141
  %170 = load float* %169, align 4, !dbg !1141
  %171 = fmul float %167, %170, !dbg !1140
  %172 = fcmp ogt float %166, %171, !dbg !1139
  br i1 %172, label %173, label %175, !dbg !1135

; <label>:173                                     ; preds = %163
  %174 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 14, !dbg !1142
  store i32 10, i32* %174, align 4, !dbg !1142
  store i8 1, i8* %checkSimplex, align 1, !dbg !1144
  br label %246, !dbg !1145

; <label>:175                                     ; preds = %163, %151
  %176 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 3, !dbg !1146
  %177 = load %class.btVoronoiSimplexSolver** %176, align 8, !dbg !1146
  %178 = call zeroext i1 @_ZN22btVoronoiSimplexSolver9inSimplexERK9btVector3(%class.btVoronoiSimplexSolver* %177, %class.btVector3* dereferenceable(16) %w), !dbg !1146
  br i1 %178, label %179, label %181, !dbg !1148

; <label>:179                                     ; preds = %175
  %180 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 14, !dbg !1149
  store i32 1, i32* %180, align 4, !dbg !1149
  store i8 1, i8* %checkSimplex, align 1, !dbg !1151
  br label %246, !dbg !1152

; <label>:181                                     ; preds = %175
  call void @llvm.dbg.declare(metadata float* %f0, metadata !1153, metadata !896), !dbg !1154
  %182 = load float* %squaredDistance, align 4, !dbg !1155
  %183 = load float* %delta, align 4, !dbg !1156
  %184 = fsub float %182, %183, !dbg !1155
  store float %184, float* %f0, align 4, !dbg !1154
  call void @llvm.dbg.declare(metadata float* %f1, metadata !1157, metadata !896), !dbg !1158
  %185 = load float* %squaredDistance, align 4, !dbg !1159
  %186 = fmul float %185, 0x3EB0C6F7A0000000, !dbg !1159
  store float %186, float* %f1, align 4, !dbg !1158
  %187 = load float* %f0, align 4, !dbg !1160
  %188 = load float* %f1, align 4, !dbg !1162
  %189 = fcmp ole float %187, %188, !dbg !1160
  br i1 %189, label %190, label %198, !dbg !1163

; <label>:190                                     ; preds = %181
  %191 = load float* %f0, align 4, !dbg !1164
  %192 = fcmp ole float %191, 0.000000e+00, !dbg !1164
  br i1 %192, label %193, label %195, !dbg !1167

; <label>:193                                     ; preds = %190
  %194 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 14, !dbg !1168
  store i32 2, i32* %194, align 4, !dbg !1168
  br label %197, !dbg !1170

; <label>:195                                     ; preds = %190
  %196 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 14, !dbg !1171
  store i32 11, i32* %196, align 4, !dbg !1171
  br label %197

; <label>:197                                     ; preds = %195, %193
  store i8 1, i8* %checkSimplex, align 1, !dbg !1173
  br label %246, !dbg !1174

; <label>:198                                     ; preds = %181
  %199 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 3, !dbg !1175
  %200 = load %class.btVoronoiSimplexSolver** %199, align 8, !dbg !1175
  call void @_ZN22btVoronoiSimplexSolver9addVertexERK9btVector3S2_S2_(%class.btVoronoiSimplexSolver* %200, %class.btVector3* dereferenceable(16) %w, %class.btVector3* dereferenceable(16) %pWorld, %class.btVector3* dereferenceable(16) %qWorld), !dbg !1175
  call void @llvm.dbg.declare(metadata %class.btVector3* %newCachedSeparatingAxis, metadata !1176, metadata !896), !dbg !1177
  call void @_ZN9btVector3C2Ev(%class.btVector3* %newCachedSeparatingAxis), !dbg !1177
  %201 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 3, !dbg !1178
  %202 = load %class.btVoronoiSimplexSolver** %201, align 8, !dbg !1178
  %203 = call zeroext i1 @_ZN22btVoronoiSimplexSolver7closestER9btVector3(%class.btVoronoiSimplexSolver* %202, %class.btVector3* dereferenceable(16) %newCachedSeparatingAxis), !dbg !1178
  br i1 %203, label %206, label %204, !dbg !1180

; <label>:204                                     ; preds = %198
  %205 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 14, !dbg !1181
  store i32 3, i32* %205, align 4, !dbg !1181
  store i8 1, i8* %checkSimplex, align 1, !dbg !1183
  br label %246, !dbg !1184

; <label>:206                                     ; preds = %198
  %207 = call float @_ZNK9btVector37length2Ev(%class.btVector3* %newCachedSeparatingAxis), !dbg !1185
  %208 = fcmp olt float %207, 0x3EB0C6F7A0000000, !dbg !1185
  br i1 %208, label %209, label %214, !dbg !1187

; <label>:209                                     ; preds = %206
  %210 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 1, !dbg !1188
  %211 = bitcast %class.btVector3* %210 to i8*, !dbg !1188
  %212 = bitcast %class.btVector3* %newCachedSeparatingAxis to i8*, !dbg !1188
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %211, i8* %212, i64 16, i32 4, i1 false), !dbg !1188
  %213 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 14, !dbg !1190
  store i32 6, i32* %213, align 4, !dbg !1190
  store i8 1, i8* %checkSimplex, align 1, !dbg !1191
  br label %246, !dbg !1192

; <label>:214                                     ; preds = %206
  call void @llvm.dbg.declare(metadata float* %previousSquaredDistance, metadata !1193, metadata !896), !dbg !1194
  %215 = load float* %squaredDistance, align 4, !dbg !1195
  store float %215, float* %previousSquaredDistance, align 4, !dbg !1194
  %216 = call float @_ZNK9btVector37length2Ev(%class.btVector3* %newCachedSeparatingAxis), !dbg !1196
  store float %216, float* %squaredDistance, align 4, !dbg !1197
  %217 = load float* %previousSquaredDistance, align 4, !dbg !1198
  %218 = load float* %squaredDistance, align 4, !dbg !1200
  %219 = fsub float %217, %218, !dbg !1198
  %220 = load float* %previousSquaredDistance, align 4, !dbg !1201
  %221 = fmul float 0x3E80000000000000, %220, !dbg !1202
  %222 = fcmp ole float %219, %221, !dbg !1198
  br i1 %222, label %223, label %225, !dbg !1203

; <label>:223                                     ; preds = %214
  store i8 1, i8* %checkSimplex, align 1, !dbg !1204
  %224 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 14, !dbg !1206
  store i32 12, i32* %224, align 4, !dbg !1206
  br label %246, !dbg !1207

; <label>:225                                     ; preds = %214
  %226 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 1, !dbg !1208
  %227 = bitcast %class.btVector3* %226 to i8*, !dbg !1208
  %228 = bitcast %class.btVector3* %newCachedSeparatingAxis to i8*, !dbg !1208
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %227, i8* %228, i64 16, i32 4, i1 false), !dbg !1208
  %229 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 13, !dbg !1209
  %230 = load i32* %229, align 4, !dbg !1209
  %231 = add nsw i32 %230, 1, !dbg !1209
  store i32 %231, i32* %229, align 4, !dbg !1209
  %232 = load i32* %gGjkMaxIter, align 4, !dbg !1211
  %233 = icmp sgt i32 %230, %232, !dbg !1209
  br i1 %233, label %234, label %235, !dbg !1212

; <label>:234                                     ; preds = %225
  br label %246, !dbg !1213

; <label>:235                                     ; preds = %225
  call void @llvm.dbg.declare(metadata i8* %check, metadata !1215, metadata !896), !dbg !1216
  %236 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 3, !dbg !1217
  %237 = load %class.btVoronoiSimplexSolver** %236, align 8, !dbg !1217
  %238 = call zeroext i1 @_ZNK22btVoronoiSimplexSolver11fullSimplexEv(%class.btVoronoiSimplexSolver* %237), !dbg !1217
  %239 = xor i1 %238, true, !dbg !1218
  %240 = zext i1 %239 to i8, !dbg !1216
  store i8 %240, i8* %check, align 1, !dbg !1216
  %241 = load i8* %check, align 1, !dbg !1219
  %242 = trunc i8 %241 to i1, !dbg !1219
  br i1 %242, label %245, label %243, !dbg !1221

; <label>:243                                     ; preds = %235
  %244 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 14, !dbg !1222
  store i32 13, i32* %244, align 4, !dbg !1222
  br label %246, !dbg !1224

; <label>:245                                     ; preds = %235
  br label %82, !dbg !1225

; <label>:246                                     ; preds = %243, %234, %223, %209, %204, %197, %179, %173
  %247 = load i8* %checkSimplex, align 1, !dbg !1226
  %248 = trunc i8 %247 to i1, !dbg !1226
  br i1 %248, label %249, label %304, !dbg !1228

; <label>:249                                     ; preds = %246
  %250 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 3, !dbg !1229
  %251 = load %class.btVoronoiSimplexSolver** %250, align 8, !dbg !1229
  call void @_ZN22btVoronoiSimplexSolver14compute_pointsER9btVector3S1_(%class.btVoronoiSimplexSolver* %251, %class.btVector3* dereferenceable(16) %pointOnA, %class.btVector3* dereferenceable(16) %pointOnB), !dbg !1229
  %252 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 1, !dbg !1231
  %253 = bitcast %class.btVector3* %normalInB to i8*, !dbg !1231
  %254 = bitcast %class.btVector3* %252 to i8*, !dbg !1231
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %253, i8* %254, i64 16, i32 4, i1 false), !dbg !1231
  call void @llvm.dbg.declare(metadata float* %lenSqr, metadata !1232, metadata !896), !dbg !1233
  %255 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 1, !dbg !1234
  %256 = call float @_ZNK9btVector37length2Ev(%class.btVector3* %255), !dbg !1234
  store float %256, float* %lenSqr, align 4, !dbg !1233
  %257 = load float* %lenSqr, align 4, !dbg !1235
  %258 = fpext float %257 to double, !dbg !1235
  %259 = fcmp olt double %258, 1.000000e-04, !dbg !1235
  br i1 %259, label %260, label %262, !dbg !1237

; <label>:260                                     ; preds = %249
  %261 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 14, !dbg !1238
  store i32 5, i32* %261, align 4, !dbg !1238
  br label %262, !dbg !1240

; <label>:262                                     ; preds = %260, %249
  %263 = load float* %lenSqr, align 4, !dbg !1241
  %264 = fcmp ogt float %263, 0x3D10000000000000, !dbg !1241
  br i1 %264, label %265, label %301, !dbg !1243

; <label>:265                                     ; preds = %262
  call void @llvm.dbg.declare(metadata float* %rlen, metadata !1244, metadata !896), !dbg !1246
  %266 = load float* %lenSqr, align 4, !dbg !1247
  %267 = call float @_Z6btSqrtf(float %266), !dbg !1248
  %268 = fdiv float 1.000000e+00, %267, !dbg !1249
  store float %268, float* %rlen, align 4, !dbg !1246
  %269 = call dereferenceable(16) %class.btVector3* @_ZN9btVector3mLERKf(%class.btVector3* %normalInB, float* dereferenceable(4) %rlen), !dbg !1250
  call void @llvm.dbg.declare(metadata float* %s, metadata !1251, metadata !896), !dbg !1252
  %270 = load float* %squaredDistance, align 4, !dbg !1253
  %271 = call float @_Z6btSqrtf(float %270), !dbg !1254
  store float %271, float* %s, align 4, !dbg !1252
  %272 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 1, !dbg !1255
  %273 = load float* %marginA, align 4, !dbg !1256
  %274 = load float* %s, align 4, !dbg !1257
  %275 = fdiv float %273, %274, !dbg !1256
  store float %275, float* %15, !dbg !1258
  %276 = call { <2 x float>, <2 x float> } @_ZmlRK9btVector3RKf(%class.btVector3* dereferenceable(16) %272, float* dereferenceable(4) %15), !dbg !1258
  %277 = getelementptr %class.btVector3* %14, i32 0, i32 0, !dbg !1258
  %278 = bitcast [4 x float]* %277 to { <2 x float>, <2 x float> }*, !dbg !1258
  %279 = getelementptr { <2 x float>, <2 x float> }* %278, i32 0, i32 0, !dbg !1258
  %280 = extractvalue { <2 x float>, <2 x float> } %276, 0, !dbg !1258
  store <2 x float> %280, <2 x float>* %279, align 1, !dbg !1258
  %281 = getelementptr { <2 x float>, <2 x float> }* %278, i32 0, i32 1, !dbg !1258
  %282 = extractvalue { <2 x float>, <2 x float> } %276, 1, !dbg !1258
  store <2 x float> %282, <2 x float>* %281, align 1, !dbg !1258
  %283 = call dereferenceable(16) %class.btVector3* @_ZN9btVector3mIERKS_(%class.btVector3* %pointOnA, %class.btVector3* dereferenceable(16) %14), !dbg !1259
  %284 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 1, !dbg !1260
  %285 = load float* %marginB, align 4, !dbg !1261
  %286 = load float* %s, align 4, !dbg !1262
  %287 = fdiv float %285, %286, !dbg !1261
  store float %287, float* %17, !dbg !1263
  %288 = call { <2 x float>, <2 x float> } @_ZmlRK9btVector3RKf(%class.btVector3* dereferenceable(16) %284, float* dereferenceable(4) %17), !dbg !1263
  %289 = getelementptr %class.btVector3* %16, i32 0, i32 0, !dbg !1263
  %290 = bitcast [4 x float]* %289 to { <2 x float>, <2 x float> }*, !dbg !1263
  %291 = getelementptr { <2 x float>, <2 x float> }* %290, i32 0, i32 0, !dbg !1263
  %292 = extractvalue { <2 x float>, <2 x float> } %288, 0, !dbg !1263
  store <2 x float> %292, <2 x float>* %291, align 1, !dbg !1263
  %293 = getelementptr { <2 x float>, <2 x float> }* %290, i32 0, i32 1, !dbg !1263
  %294 = extractvalue { <2 x float>, <2 x float> } %288, 1, !dbg !1263
  store <2 x float> %294, <2 x float>* %293, align 1, !dbg !1263
  %295 = call dereferenceable(16) %class.btVector3* @_ZN9btVector3pLERKS_(%class.btVector3* %pointOnB, %class.btVector3* dereferenceable(16) %16), !dbg !1264
  %296 = load float* %rlen, align 4, !dbg !1265
  %297 = fdiv float 1.000000e+00, %296, !dbg !1266
  %298 = load float* %margin, align 4, !dbg !1267
  %299 = fsub float %297, %298, !dbg !1268
  store float %299, float* %distance, align 4, !dbg !1269
  store i8 1, i8* %isValid, align 1, !dbg !1270
  %300 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 12, !dbg !1271
  store i32 1, i32* %300, align 4, !dbg !1271
  br label %303, !dbg !1272

; <label>:301                                     ; preds = %262
  %302 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 12, !dbg !1273
  store i32 2, i32* %302, align 4, !dbg !1273
  br label %303

; <label>:303                                     ; preds = %301, %265
  br label %304, !dbg !1275

; <label>:304                                     ; preds = %303, %246
  call void @llvm.dbg.declare(metadata i8* %catchDegeneratePenetrationCase, metadata !1276, metadata !896), !dbg !1277
  %305 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 15, !dbg !1278
  %306 = load i32* %305, align 4, !dbg !1278
  %307 = icmp ne i32 %306, 0, !dbg !1278
  br i1 %307, label %308, label %322, !dbg !1278

; <label>:308                                     ; preds = %304
  %309 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 2, !dbg !1279
  %310 = load %class.btConvexPenetrationDepthSolver** %309, align 8, !dbg !1279
  %311 = icmp ne %class.btConvexPenetrationDepthSolver* %310, null, !dbg !1279
  br i1 %311, label %312, label %322, !dbg !1278

; <label>:312                                     ; preds = %308
  %313 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 14, !dbg !1281
  %314 = load i32* %313, align 4, !dbg !1281
  %315 = icmp ne i32 %314, 0, !dbg !1281
  br i1 %315, label %316, label %322, !dbg !1278

; <label>:316                                     ; preds = %312
  %317 = load float* %distance, align 4, !dbg !1283
  %318 = load float* %margin, align 4, !dbg !1285
  %319 = fadd float %317, %318, !dbg !1286
  %320 = fpext float %319 to double, !dbg !1287
  %321 = fcmp olt double %320, 1.000000e-02, !dbg !1287
  br label %322

; <label>:322                                     ; preds = %316, %312, %308, %304
  %323 = phi i1 [ false, %312 ], [ false, %308 ], [ false, %304 ], [ %321, %316 ]
  %324 = zext i1 %323 to i8, !dbg !1277
  store i8 %324, i8* %catchDegeneratePenetrationCase, align 1, !dbg !1277
  %325 = load i8* %checkPenetration, align 1, !dbg !1288
  %326 = trunc i8 %325 to i1, !dbg !1288
  br i1 %326, label %327, label %472, !dbg !1290

; <label>:327                                     ; preds = %322
  %328 = load i8* %isValid, align 1, !dbg !1291
  %329 = trunc i8 %328 to i1, !dbg !1291
  br i1 %329, label %330, label %333, !dbg !1290

; <label>:330                                     ; preds = %327
  %331 = load i8* %catchDegeneratePenetrationCase, align 1, !dbg !1293
  %332 = trunc i8 %331 to i1, !dbg !1293
  br i1 %332, label %333, label %472, !dbg !1290

; <label>:333                                     ; preds = %330, %327
  %334 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 2, !dbg !1295
  %335 = load %class.btConvexPenetrationDepthSolver** %334, align 8, !dbg !1295
  %336 = icmp ne %class.btConvexPenetrationDepthSolver* %335, null, !dbg !1295
  br i1 %336, label %337, label %471, !dbg !1298

; <label>:337                                     ; preds = %333
  call void @llvm.dbg.declare(metadata %class.btVector3* %tmpPointOnA, metadata !1299, metadata !896), !dbg !1301
  call void @_ZN9btVector3C2Ev(%class.btVector3* %tmpPointOnA), !dbg !1301
  call void @llvm.dbg.declare(metadata %class.btVector3* %tmpPointOnB, metadata !1302, metadata !896), !dbg !1303
  call void @_ZN9btVector3C2Ev(%class.btVector3* %tmpPointOnB), !dbg !1303
  %338 = load i32* @gNumDeepPenetrationChecks, align 4, !dbg !1304
  %339 = add nsw i32 %338, 1, !dbg !1304
  store i32 %339, i32* @gNumDeepPenetrationChecks, align 4, !dbg !1304
  %340 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 1, !dbg !1305
  call void @_ZN9btVector37setZeroEv(%class.btVector3* %340), !dbg !1305
  call void @llvm.dbg.declare(metadata i8* %isValid2, metadata !1306, metadata !896), !dbg !1307
  %341 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 2, !dbg !1308
  %342 = load %class.btConvexPenetrationDepthSolver** %341, align 8, !dbg !1308
  %343 = bitcast %class.btConvexPenetrationDepthSolver* %342 to i1 (%class.btConvexPenetrationDepthSolver*, %class.btVoronoiSimplexSolver*, %class.btConvexShape*, %class.btConvexShape*, %class.btTransform*, %class.btTransform*, %class.btVector3*, %class.btVector3*, %class.btVector3*, %class.btIDebugDraw*, %class.btStackAlloc*)***, !dbg !1308
  %344 = load i1 (%class.btConvexPenetrationDepthSolver*, %class.btVoronoiSimplexSolver*, %class.btConvexShape*, %class.btConvexShape*, %class.btTransform*, %class.btTransform*, %class.btVector3*, %class.btVector3*, %class.btVector3*, %class.btIDebugDraw*, %class.btStackAlloc*)*** %343, !dbg !1308
  %345 = getelementptr inbounds i1 (%class.btConvexPenetrationDepthSolver*, %class.btVoronoiSimplexSolver*, %class.btConvexShape*, %class.btConvexShape*, %class.btTransform*, %class.btTransform*, %class.btVector3*, %class.btVector3*, %class.btVector3*, %class.btIDebugDraw*, %class.btStackAlloc*)** %344, i64 2, !dbg !1308
  %346 = load i1 (%class.btConvexPenetrationDepthSolver*, %class.btVoronoiSimplexSolver*, %class.btConvexShape*, %class.btConvexShape*, %class.btTransform*, %class.btTransform*, %class.btVector3*, %class.btVector3*, %class.btVector3*, %class.btIDebugDraw*, %class.btStackAlloc*)** %345, !dbg !1308
  %347 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 3, !dbg !1309
  %348 = load %class.btVoronoiSimplexSolver** %347, align 8, !dbg !1309
  %349 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 4, !dbg !1310
  %350 = load %class.btConvexShape** %349, align 8, !dbg !1310
  %351 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 5, !dbg !1311
  %352 = load %class.btConvexShape** %351, align 8, !dbg !1311
  %353 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 1, !dbg !1308
  %354 = load %class.btIDebugDraw** %4, align 8, !dbg !1312
  %355 = load %"struct.btDiscreteCollisionDetectorInterface::ClosestPointInput"** %2, align 8, !dbg !1313
  %356 = getelementptr inbounds %"struct.btDiscreteCollisionDetectorInterface::ClosestPointInput"* %355, i32 0, i32 3, !dbg !1313
  %357 = load %class.btStackAlloc** %356, align 8, !dbg !1313
  %358 = call zeroext i1 %346(%class.btConvexPenetrationDepthSolver* %342, %class.btVoronoiSimplexSolver* dereferenceable(360) %348, %class.btConvexShape* %350, %class.btConvexShape* %352, %class.btTransform* dereferenceable(64) %localTransA, %class.btTransform* dereferenceable(64) %localTransB, %class.btVector3* dereferenceable(16) %353, %class.btVector3* dereferenceable(16) %tmpPointOnA, %class.btVector3* dereferenceable(16) %tmpPointOnB, %class.btIDebugDraw* %354, %class.btStackAlloc* %357), !dbg !1308
  %359 = zext i1 %358 to i8, !dbg !1307
  store i8 %359, i8* %isValid2, align 1, !dbg !1307
  %360 = load i8* %isValid2, align 1, !dbg !1314
  %361 = trunc i8 %360 to i1, !dbg !1314
  br i1 %361, label %362, label %416, !dbg !1316

; <label>:362                                     ; preds = %337
  call void @llvm.dbg.declare(metadata %class.btVector3* %tmpNormalInB, metadata !1317, metadata !896), !dbg !1319
  %363 = call { <2 x float>, <2 x float> } @_ZmiRK9btVector3S1_(%class.btVector3* dereferenceable(16) %tmpPointOnB, %class.btVector3* dereferenceable(16) %tmpPointOnA), !dbg !1320
  %364 = getelementptr %class.btVector3* %tmpNormalInB, i32 0, i32 0, !dbg !1320
  %365 = bitcast [4 x float]* %364 to { <2 x float>, <2 x float> }*, !dbg !1320
  %366 = getelementptr { <2 x float>, <2 x float> }* %365, i32 0, i32 0, !dbg !1320
  %367 = extractvalue { <2 x float>, <2 x float> } %363, 0, !dbg !1320
  store <2 x float> %367, <2 x float>* %366, align 1, !dbg !1320
  %368 = getelementptr { <2 x float>, <2 x float> }* %365, i32 0, i32 1, !dbg !1320
  %369 = extractvalue { <2 x float>, <2 x float> } %363, 1, !dbg !1320
  store <2 x float> %369, <2 x float>* %368, align 1, !dbg !1320
  call void @llvm.dbg.declare(metadata float* %lenSqr1, metadata !1321, metadata !896), !dbg !1322
  %370 = call float @_ZNK9btVector37length2Ev(%class.btVector3* %tmpNormalInB), !dbg !1323
  store float %370, float* %lenSqr1, align 4, !dbg !1322
  %371 = load float* %lenSqr1, align 4, !dbg !1324
  %372 = fcmp ole float %371, 0x3D10000000000000, !dbg !1324
  br i1 %372, label %373, label %379, !dbg !1326

; <label>:373                                     ; preds = %362
  %374 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 1, !dbg !1327
  %375 = bitcast %class.btVector3* %tmpNormalInB to i8*, !dbg !1327
  %376 = bitcast %class.btVector3* %374 to i8*, !dbg !1327
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %375, i8* %376, i64 16, i32 4, i1 false), !dbg !1327
  %377 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 1, !dbg !1329
  %378 = call float @_ZNK9btVector37length2Ev(%class.btVector3* %377), !dbg !1329
  store float %378, float* %lenSqr1, align 4, !dbg !1330
  br label %379, !dbg !1331

; <label>:379                                     ; preds = %373, %362
  %380 = load float* %lenSqr1, align 4, !dbg !1332
  %381 = fcmp ogt float %380, 0x3D10000000000000, !dbg !1332
  br i1 %381, label %382, label %413, !dbg !1334

; <label>:382                                     ; preds = %379
  %383 = load float* %lenSqr1, align 4, !dbg !1335
  %384 = call float @_Z6btSqrtf(float %383), !dbg !1337
  store float %384, float* %18, !dbg !1338
  %385 = call dereferenceable(16) %class.btVector3* @_ZN9btVector3dVERKf(%class.btVector3* %tmpNormalInB, float* dereferenceable(4) %18), !dbg !1338
  call void @llvm.dbg.declare(metadata float* %distance2, metadata !1339, metadata !896), !dbg !1340
  %386 = call { <2 x float>, <2 x float> } @_ZmiRK9btVector3S1_(%class.btVector3* dereferenceable(16) %tmpPointOnA, %class.btVector3* dereferenceable(16) %tmpPointOnB), !dbg !1341
  %387 = getelementptr %class.btVector3* %19, i32 0, i32 0, !dbg !1341
  %388 = bitcast [4 x float]* %387 to { <2 x float>, <2 x float> }*, !dbg !1341
  %389 = getelementptr { <2 x float>, <2 x float> }* %388, i32 0, i32 0, !dbg !1341
  %390 = extractvalue { <2 x float>, <2 x float> } %386, 0, !dbg !1341
  store <2 x float> %390, <2 x float>* %389, align 1, !dbg !1341
  %391 = getelementptr { <2 x float>, <2 x float> }* %388, i32 0, i32 1, !dbg !1341
  %392 = extractvalue { <2 x float>, <2 x float> } %386, 1, !dbg !1341
  store <2 x float> %392, <2 x float>* %391, align 1, !dbg !1341
  %393 = call float @_ZNK9btVector36lengthEv(%class.btVector3* %19), !dbg !1342
  %394 = fsub float -0.000000e+00, %393, !dbg !1343
  store float %394, float* %distance2, align 4, !dbg !1340
  %395 = load i8* %isValid, align 1, !dbg !1344
  %396 = trunc i8 %395 to i1, !dbg !1344
  br i1 %396, label %397, label %401, !dbg !1346

; <label>:397                                     ; preds = %382
  %398 = load float* %distance2, align 4, !dbg !1347
  %399 = load float* %distance, align 4, !dbg !1349
  %400 = fcmp olt float %398, %399, !dbg !1350
  br i1 %400, label %401, label %410, !dbg !1346

; <label>:401                                     ; preds = %397, %382
  %402 = load float* %distance2, align 4, !dbg !1351
  store float %402, float* %distance, align 4, !dbg !1353
  %403 = bitcast %class.btVector3* %pointOnA to i8*, !dbg !1354
  %404 = bitcast %class.btVector3* %tmpPointOnA to i8*, !dbg !1354
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %403, i8* %404, i64 16, i32 4, i1 false), !dbg !1354
  %405 = bitcast %class.btVector3* %pointOnB to i8*, !dbg !1355
  %406 = bitcast %class.btVector3* %tmpPointOnB to i8*, !dbg !1355
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %405, i8* %406, i64 16, i32 4, i1 false), !dbg !1355
  %407 = bitcast %class.btVector3* %normalInB to i8*, !dbg !1356
  %408 = bitcast %class.btVector3* %tmpNormalInB to i8*, !dbg !1356
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %407, i8* %408, i64 16, i32 4, i1 false), !dbg !1356
  store i8 1, i8* %isValid, align 1, !dbg !1357
  %409 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 12, !dbg !1358
  store i32 3, i32* %409, align 4, !dbg !1358
  br label %412, !dbg !1359

; <label>:410                                     ; preds = %397
  %411 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 12, !dbg !1360
  store i32 8, i32* %411, align 4, !dbg !1360
  br label %412

; <label>:412                                     ; preds = %410, %401
  br label %415, !dbg !1362

; <label>:413                                     ; preds = %379
  %414 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 12, !dbg !1363
  store i32 9, i32* %414, align 4, !dbg !1363
  br label %415

; <label>:415                                     ; preds = %413, %412
  br label %470, !dbg !1365

; <label>:416                                     ; preds = %337
  %417 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 1, !dbg !1366
  %418 = call float @_ZNK9btVector37length2Ev(%class.btVector3* %417), !dbg !1366
  %419 = fcmp ogt float %418, 0.000000e+00, !dbg !1366
  br i1 %419, label %420, label %469, !dbg !1369

; <label>:420                                     ; preds = %416
  call void @llvm.dbg.declare(metadata float* %distance22, metadata !1370, metadata !896), !dbg !1372
  %421 = call { <2 x float>, <2 x float> } @_ZmiRK9btVector3S1_(%class.btVector3* dereferenceable(16) %tmpPointOnA, %class.btVector3* dereferenceable(16) %tmpPointOnB), !dbg !1373
  %422 = getelementptr %class.btVector3* %20, i32 0, i32 0, !dbg !1373
  %423 = bitcast [4 x float]* %422 to { <2 x float>, <2 x float> }*, !dbg !1373
  %424 = getelementptr { <2 x float>, <2 x float> }* %423, i32 0, i32 0, !dbg !1373
  %425 = extractvalue { <2 x float>, <2 x float> } %421, 0, !dbg !1373
  store <2 x float> %425, <2 x float>* %424, align 1, !dbg !1373
  %426 = getelementptr { <2 x float>, <2 x float> }* %423, i32 0, i32 1, !dbg !1373
  %427 = extractvalue { <2 x float>, <2 x float> } %421, 1, !dbg !1373
  store <2 x float> %427, <2 x float>* %426, align 1, !dbg !1373
  %428 = call float @_ZNK9btVector36lengthEv(%class.btVector3* %20), !dbg !1374
  %429 = load float* %margin, align 4, !dbg !1375
  %430 = fsub float %428, %429, !dbg !1374
  store float %430, float* %distance22, align 4, !dbg !1372
  %431 = load i8* %isValid, align 1, !dbg !1376
  %432 = trunc i8 %431 to i1, !dbg !1376
  br i1 %432, label %433, label %437, !dbg !1378

; <label>:433                                     ; preds = %420
  %434 = load float* %distance22, align 4, !dbg !1379
  %435 = load float* %distance, align 4, !dbg !1381
  %436 = fcmp olt float %434, %435, !dbg !1382
  br i1 %436, label %437, label %466, !dbg !1378

; <label>:437                                     ; preds = %433, %420
  %438 = load float* %distance22, align 4, !dbg !1383
  store float %438, float* %distance, align 4, !dbg !1385
  %439 = bitcast %class.btVector3* %pointOnA to i8*, !dbg !1386
  %440 = bitcast %class.btVector3* %tmpPointOnA to i8*, !dbg !1386
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %439, i8* %440, i64 16, i32 4, i1 false), !dbg !1386
  %441 = bitcast %class.btVector3* %pointOnB to i8*, !dbg !1387
  %442 = bitcast %class.btVector3* %tmpPointOnB to i8*, !dbg !1387
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %441, i8* %442, i64 16, i32 4, i1 false), !dbg !1387
  %443 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 1, !dbg !1388
  %444 = call { <2 x float>, <2 x float> } @_ZmlRK9btVector3RKf(%class.btVector3* dereferenceable(16) %443, float* dereferenceable(4) %marginA), !dbg !1389
  %445 = getelementptr %class.btVector3* %21, i32 0, i32 0, !dbg !1389
  %446 = bitcast [4 x float]* %445 to { <2 x float>, <2 x float> }*, !dbg !1389
  %447 = getelementptr { <2 x float>, <2 x float> }* %446, i32 0, i32 0, !dbg !1389
  %448 = extractvalue { <2 x float>, <2 x float> } %444, 0, !dbg !1389
  store <2 x float> %448, <2 x float>* %447, align 1, !dbg !1389
  %449 = getelementptr { <2 x float>, <2 x float> }* %446, i32 0, i32 1, !dbg !1389
  %450 = extractvalue { <2 x float>, <2 x float> } %444, 1, !dbg !1389
  store <2 x float> %450, <2 x float>* %449, align 1, !dbg !1389
  %451 = call dereferenceable(16) %class.btVector3* @_ZN9btVector3mIERKS_(%class.btVector3* %pointOnA, %class.btVector3* dereferenceable(16) %21), !dbg !1390
  %452 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 1, !dbg !1391
  %453 = call { <2 x float>, <2 x float> } @_ZmlRK9btVector3RKf(%class.btVector3* dereferenceable(16) %452, float* dereferenceable(4) %marginB), !dbg !1392
  %454 = getelementptr %class.btVector3* %22, i32 0, i32 0, !dbg !1392
  %455 = bitcast [4 x float]* %454 to { <2 x float>, <2 x float> }*, !dbg !1392
  %456 = getelementptr { <2 x float>, <2 x float> }* %455, i32 0, i32 0, !dbg !1392
  %457 = extractvalue { <2 x float>, <2 x float> } %453, 0, !dbg !1392
  store <2 x float> %457, <2 x float>* %456, align 1, !dbg !1392
  %458 = getelementptr { <2 x float>, <2 x float> }* %455, i32 0, i32 1, !dbg !1392
  %459 = extractvalue { <2 x float>, <2 x float> } %453, 1, !dbg !1392
  store <2 x float> %459, <2 x float>* %458, align 1, !dbg !1392
  %460 = call dereferenceable(16) %class.btVector3* @_ZN9btVector3pLERKS_(%class.btVector3* %pointOnB, %class.btVector3* dereferenceable(16) %22), !dbg !1393
  %461 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 1, !dbg !1394
  %462 = bitcast %class.btVector3* %normalInB to i8*, !dbg !1394
  %463 = bitcast %class.btVector3* %461 to i8*, !dbg !1394
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %462, i8* %463, i64 16, i32 4, i1 false), !dbg !1394
  %464 = call dereferenceable(16) %class.btVector3* @_ZN9btVector39normalizeEv(%class.btVector3* %normalInB), !dbg !1395
  store i8 1, i8* %isValid, align 1, !dbg !1396
  %465 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 12, !dbg !1397
  store i32 6, i32* %465, align 4, !dbg !1397
  br label %468, !dbg !1398

; <label>:466                                     ; preds = %433
  %467 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 12, !dbg !1399
  store i32 5, i32* %467, align 4, !dbg !1399
  br label %468

; <label>:468                                     ; preds = %466, %437
  br label %469, !dbg !1401

; <label>:469                                     ; preds = %468, %416
  br label %470

; <label>:470                                     ; preds = %469, %415
  br label %471, !dbg !1402

; <label>:471                                     ; preds = %470, %333
  br label %472, !dbg !1403

; <label>:472                                     ; preds = %471, %330, %322
  %473 = load i8* %isValid, align 1, !dbg !1404
  %474 = trunc i8 %473 to i1, !dbg !1404
  br i1 %474, label %475, label %505, !dbg !1406

; <label>:475                                     ; preds = %472
  %476 = load float* %distance, align 4, !dbg !1407
  %477 = fcmp olt float %476, 0.000000e+00, !dbg !1407
  br i1 %477, label %486, label %478, !dbg !1406

; <label>:478                                     ; preds = %475
  %479 = load float* %distance, align 4, !dbg !1409
  %480 = load float* %distance, align 4, !dbg !1411
  %481 = fmul float %479, %480, !dbg !1412
  %482 = load %"struct.btDiscreteCollisionDetectorInterface::ClosestPointInput"** %2, align 8, !dbg !1413
  %483 = getelementptr inbounds %"struct.btDiscreteCollisionDetectorInterface::ClosestPointInput"* %482, i32 0, i32 2, !dbg !1413
  %484 = load float* %483, align 4, !dbg !1413
  %485 = fcmp olt float %481, %484, !dbg !1412
  br i1 %485, label %486, label %505, !dbg !1406

; <label>:486                                     ; preds = %478, %475
  %487 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 1, !dbg !1414
  %488 = bitcast %class.btVector3* %487 to i8*, !dbg !1414
  %489 = bitcast %class.btVector3* %normalInB to i8*, !dbg !1414
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %488, i8* %489, i64 16, i32 4, i1 false), !dbg !1414
  %490 = load float* %distance, align 4, !dbg !1416
  %491 = getelementptr inbounds %class.btGjkPairDetector* %24, i32 0, i32 11, !dbg !1417
  store float %490, float* %491, align 4, !dbg !1417
  %492 = load %"struct.btDiscreteCollisionDetectorInterface::Result"** %3, align 8, !dbg !1418
  %493 = bitcast %"struct.btDiscreteCollisionDetectorInterface::Result"* %492 to void (%"struct.btDiscreteCollisionDetectorInterface::Result"*, %class.btVector3*, %class.btVector3*, float)***, !dbg !1418
  %494 = load void (%"struct.btDiscreteCollisionDetectorInterface::Result"*, %class.btVector3*, %class.btVector3*, float)*** %493, !dbg !1418
  %495 = getelementptr inbounds void (%"struct.btDiscreteCollisionDetectorInterface::Result"*, %class.btVector3*, %class.btVector3*, float)** %494, i64 4, !dbg !1418
  %496 = load void (%"struct.btDiscreteCollisionDetectorInterface::Result"*, %class.btVector3*, %class.btVector3*, float)** %495, !dbg !1418
  %497 = call { <2 x float>, <2 x float> } @_ZplRK9btVector3S1_(%class.btVector3* dereferenceable(16) %pointOnB, %class.btVector3* dereferenceable(16) %positionOffset), !dbg !1419
  %498 = getelementptr %class.btVector3* %23, i32 0, i32 0, !dbg !1419
  %499 = bitcast [4 x float]* %498 to { <2 x float>, <2 x float> }*, !dbg !1419
  %500 = getelementptr { <2 x float>, <2 x float> }* %499, i32 0, i32 0, !dbg !1419
  %501 = extractvalue { <2 x float>, <2 x float> } %497, 0, !dbg !1419
  store <2 x float> %501, <2 x float>* %500, align 1, !dbg !1419
  %502 = getelementptr { <2 x float>, <2 x float> }* %499, i32 0, i32 1, !dbg !1419
  %503 = extractvalue { <2 x float>, <2 x float> } %497, 1, !dbg !1419
  store <2 x float> %503, <2 x float>* %502, align 1, !dbg !1419
  %504 = load float* %distance, align 4, !dbg !1420
  call void %496(%"struct.btDiscreteCollisionDetectorInterface::Result"* %492, %class.btVector3* dereferenceable(16) %normalInB, %class.btVector3* dereferenceable(16) %23, float %504), !dbg !1418
  br label %505, !dbg !1421

; <label>:505                                     ; preds = %486, %478, %472
  ret void, !dbg !1422
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr void @_ZN9btVector3C2Ev(%class.btVector3* %this) unnamed_addr #2 align 2 {
  %1 = alloca %class.btVector3*, align 8
  store %class.btVector3* %this, %class.btVector3** %1, align 8
  call void @llvm.dbg.declare(metadata %class.btVector3** %1, metadata !1423, metadata !896), !dbg !1424
  %2 = load %class.btVector3** %1
  ret void, !dbg !1425
}

; Function Attrs: inlinehint uwtable
define linkonce_odr void @_ZN11btTransformC2ERKS_(%class.btTransform* %this, %class.btTransform* dereferenceable(64) %other) unnamed_addr #5 align 2 {
  %1 = alloca %class.btTransform*, align 8
  %2 = alloca %class.btTransform*, align 8
  store %class.btTransform* %this, %class.btTransform** %1, align 8
  call void @llvm.dbg.declare(metadata %class.btTransform** %1, metadata !1426, metadata !896), !dbg !1428
  store %class.btTransform* %other, %class.btTransform** %2, align 8
  call void @llvm.dbg.declare(metadata %class.btTransform** %2, metadata !1429, metadata !896), !dbg !1431
  %3 = load %class.btTransform** %1
  %4 = getelementptr inbounds %class.btTransform* %3, i32 0, i32 0, !dbg !1432
  %5 = load %class.btTransform** %2, align 8, !dbg !1432
  %6 = getelementptr inbounds %class.btTransform* %5, i32 0, i32 0, !dbg !1432
  call void @_ZN11btMatrix3x3C2ERKS_(%class.btMatrix3x3* %4, %class.btMatrix3x3* dereferenceable(48) %6), !dbg !1432
  %7 = getelementptr inbounds %class.btTransform* %3, i32 0, i32 1, !dbg !1433
  %8 = load %class.btTransform** %2, align 8, !dbg !1433
  %9 = getelementptr inbounds %class.btTransform* %8, i32 0, i32 1, !dbg !1433
  %10 = bitcast %class.btVector3* %7 to i8*, !dbg !1433
  %11 = bitcast %class.btVector3* %9 to i8*, !dbg !1433
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %10, i8* %11, i64 16, i32 4, i1 false), !dbg !1433
  ret void, !dbg !1434
}

; Function Attrs: inlinehint uwtable
define linkonce_odr { <2 x float>, <2 x float> } @_ZmlRK9btVector3RKf(%class.btVector3* dereferenceable(16) %v, float* dereferenceable(4) %s) #5 {
  %1 = alloca %class.btVector3, align 4
  %2 = alloca %class.btVector3*, align 8
  %3 = alloca float*, align 8
  %4 = alloca float, align 4
  %5 = alloca float, align 4
  %6 = alloca float, align 4
  store %class.btVector3* %v, %class.btVector3** %2, align 8
  call void @llvm.dbg.declare(metadata %class.btVector3** %2, metadata !1435, metadata !896), !dbg !1436
  store float* %s, float** %3, align 8
  call void @llvm.dbg.declare(metadata float** %3, metadata !1437, metadata !896), !dbg !1438
  %7 = load %class.btVector3** %2, align 8, !dbg !1439
  %8 = getelementptr inbounds %class.btVector3* %7, i32 0, i32 0, !dbg !1439
  %9 = getelementptr inbounds [4 x float]* %8, i32 0, i64 0, !dbg !1439
  %10 = load float* %9, align 4, !dbg !1439
  %11 = load float** %3, align 8, !dbg !1440
  %12 = load float* %11, align 4, !dbg !1440
  %13 = fmul float %10, %12, !dbg !1439
  store float %13, float* %4, !dbg !1441
  %14 = load %class.btVector3** %2, align 8, !dbg !1442
  %15 = getelementptr inbounds %class.btVector3* %14, i32 0, i32 0, !dbg !1442
  %16 = getelementptr inbounds [4 x float]* %15, i32 0, i64 1, !dbg !1442
  %17 = load float* %16, align 4, !dbg !1442
  %18 = load float** %3, align 8, !dbg !1443
  %19 = load float* %18, align 4, !dbg !1443
  %20 = fmul float %17, %19, !dbg !1442
  store float %20, float* %5, !dbg !1441
  %21 = load %class.btVector3** %2, align 8, !dbg !1444
  %22 = getelementptr inbounds %class.btVector3* %21, i32 0, i32 0, !dbg !1444
  %23 = getelementptr inbounds [4 x float]* %22, i32 0, i64 2, !dbg !1444
  %24 = load float* %23, align 4, !dbg !1444
  %25 = load float** %3, align 8, !dbg !1445
  %26 = load float* %25, align 4, !dbg !1445
  %27 = fmul float %24, %26, !dbg !1444
  store float %27, float* %6, !dbg !1441
  call void @_ZN9btVector3C2ERKfS1_S1_(%class.btVector3* %1, float* dereferenceable(4) %4, float* dereferenceable(4) %5, float* dereferenceable(4) %6), !dbg !1441
  %28 = getelementptr %class.btVector3* %1, i32 0, i32 0, !dbg !1441
  %29 = bitcast [4 x float]* %28 to { <2 x float>, <2 x float> }*, !dbg !1441
  %30 = load { <2 x float>, <2 x float> }* %29, align 1, !dbg !1441
  ret { <2 x float>, <2 x float> } %30, !dbg !1441
}

; Function Attrs: inlinehint uwtable
define linkonce_odr { <2 x float>, <2 x float> } @_ZplRK9btVector3S1_(%class.btVector3* dereferenceable(16) %v1, %class.btVector3* dereferenceable(16) %v2) #5 {
  %1 = alloca %class.btVector3, align 4
  %2 = alloca %class.btVector3*, align 8
  %3 = alloca %class.btVector3*, align 8
  %4 = alloca float, align 4
  %5 = alloca float, align 4
  %6 = alloca float, align 4
  store %class.btVector3* %v1, %class.btVector3** %2, align 8
  call void @llvm.dbg.declare(metadata %class.btVector3** %2, metadata !1446, metadata !896), !dbg !1447
  store %class.btVector3* %v2, %class.btVector3** %3, align 8
  call void @llvm.dbg.declare(metadata %class.btVector3** %3, metadata !1448, metadata !896), !dbg !1449
  %7 = load %class.btVector3** %2, align 8, !dbg !1450
  %8 = getelementptr inbounds %class.btVector3* %7, i32 0, i32 0, !dbg !1450
  %9 = getelementptr inbounds [4 x float]* %8, i32 0, i64 0, !dbg !1450
  %10 = load float* %9, align 4, !dbg !1450
  %11 = load %class.btVector3** %3, align 8, !dbg !1451
  %12 = getelementptr inbounds %class.btVector3* %11, i32 0, i32 0, !dbg !1451
  %13 = getelementptr inbounds [4 x float]* %12, i32 0, i64 0, !dbg !1451
  %14 = load float* %13, align 4, !dbg !1451
  %15 = fadd float %10, %14, !dbg !1450
  store float %15, float* %4, !dbg !1452
  %16 = load %class.btVector3** %2, align 8, !dbg !1453
  %17 = getelementptr inbounds %class.btVector3* %16, i32 0, i32 0, !dbg !1453
  %18 = getelementptr inbounds [4 x float]* %17, i32 0, i64 1, !dbg !1453
  %19 = load float* %18, align 4, !dbg !1453
  %20 = load %class.btVector3** %3, align 8, !dbg !1454
  %21 = getelementptr inbounds %class.btVector3* %20, i32 0, i32 0, !dbg !1454
  %22 = getelementptr inbounds [4 x float]* %21, i32 0, i64 1, !dbg !1454
  %23 = load float* %22, align 4, !dbg !1454
  %24 = fadd float %19, %23, !dbg !1453
  store float %24, float* %5, !dbg !1452
  %25 = load %class.btVector3** %2, align 8, !dbg !1455
  %26 = getelementptr inbounds %class.btVector3* %25, i32 0, i32 0, !dbg !1455
  %27 = getelementptr inbounds [4 x float]* %26, i32 0, i64 2, !dbg !1455
  %28 = load float* %27, align 4, !dbg !1455
  %29 = load %class.btVector3** %3, align 8, !dbg !1456
  %30 = getelementptr inbounds %class.btVector3* %29, i32 0, i32 0, !dbg !1456
  %31 = getelementptr inbounds [4 x float]* %30, i32 0, i64 2, !dbg !1456
  %32 = load float* %31, align 4, !dbg !1456
  %33 = fadd float %28, %32, !dbg !1455
  store float %33, float* %6, !dbg !1452
  call void @_ZN9btVector3C2ERKfS1_S1_(%class.btVector3* %1, float* dereferenceable(4) %4, float* dereferenceable(4) %5, float* dereferenceable(4) %6), !dbg !1452
  %34 = getelementptr %class.btVector3* %1, i32 0, i32 0, !dbg !1452
  %35 = bitcast [4 x float]* %34 to { <2 x float>, <2 x float> }*, !dbg !1452
  %36 = load { <2 x float>, <2 x float> }* %35, align 1, !dbg !1452
  ret { <2 x float>, <2 x float> } %36, !dbg !1452
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dereferenceable(16) %class.btVector3* @_ZN11btTransform9getOriginEv(%class.btTransform* %this) #2 align 2 {
  %1 = alloca %class.btTransform*, align 8
  store %class.btTransform* %this, %class.btTransform** %1, align 8
  call void @llvm.dbg.declare(metadata %class.btTransform** %1, metadata !1457, metadata !896), !dbg !1458
  %2 = load %class.btTransform** %1
  %3 = getelementptr inbounds %class.btTransform* %2, i32 0, i32 1, !dbg !1459
  ret %class.btVector3* %3, !dbg !1459
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dereferenceable(16) %class.btVector3* @_ZN9btVector3mIERKS_(%class.btVector3* %this, %class.btVector3* dereferenceable(16) %v) #2 align 2 {
  %1 = alloca %class.btVector3*, align 8
  %2 = alloca %class.btVector3*, align 8
  store %class.btVector3* %this, %class.btVector3** %1, align 8
  call void @llvm.dbg.declare(metadata %class.btVector3** %1, metadata !1460, metadata !896), !dbg !1461
  store %class.btVector3* %v, %class.btVector3** %2, align 8
  call void @llvm.dbg.declare(metadata %class.btVector3** %2, metadata !1462, metadata !896), !dbg !1463
  %3 = load %class.btVector3** %1
  %4 = load %class.btVector3** %2, align 8, !dbg !1464
  %5 = getelementptr inbounds %class.btVector3* %4, i32 0, i32 0, !dbg !1464
  %6 = getelementptr inbounds [4 x float]* %5, i32 0, i64 0, !dbg !1464
  %7 = load float* %6, align 4, !dbg !1464
  %8 = getelementptr inbounds %class.btVector3* %3, i32 0, i32 0, !dbg !1465
  %9 = getelementptr inbounds [4 x float]* %8, i32 0, i64 0, !dbg !1465
  %10 = load float* %9, align 4, !dbg !1465
  %11 = fsub float %10, %7, !dbg !1465
  store float %11, float* %9, align 4, !dbg !1465
  %12 = load %class.btVector3** %2, align 8, !dbg !1466
  %13 = getelementptr inbounds %class.btVector3* %12, i32 0, i32 0, !dbg !1466
  %14 = getelementptr inbounds [4 x float]* %13, i32 0, i64 1, !dbg !1466
  %15 = load float* %14, align 4, !dbg !1466
  %16 = getelementptr inbounds %class.btVector3* %3, i32 0, i32 0, !dbg !1467
  %17 = getelementptr inbounds [4 x float]* %16, i32 0, i64 1, !dbg !1467
  %18 = load float* %17, align 4, !dbg !1467
  %19 = fsub float %18, %15, !dbg !1467
  store float %19, float* %17, align 4, !dbg !1467
  %20 = load %class.btVector3** %2, align 8, !dbg !1468
  %21 = getelementptr inbounds %class.btVector3* %20, i32 0, i32 0, !dbg !1468
  %22 = getelementptr inbounds [4 x float]* %21, i32 0, i64 2, !dbg !1468
  %23 = load float* %22, align 4, !dbg !1468
  %24 = getelementptr inbounds %class.btVector3* %3, i32 0, i32 0, !dbg !1469
  %25 = getelementptr inbounds [4 x float]* %24, i32 0, i64 2, !dbg !1469
  %26 = load float* %25, align 4, !dbg !1469
  %27 = fsub float %26, %23, !dbg !1469
  store float %27, float* %25, align 4, !dbg !1469
  ret %class.btVector3* %3, !dbg !1470
}

; Function Attrs: inlinehint uwtable
define linkonce_odr zeroext i1 @_ZNK16btCollisionShape10isConvex2dEv(%class.btCollisionShape* %this) #5 align 2 {
  %1 = alloca %class.btCollisionShape*, align 8
  store %class.btCollisionShape* %this, %class.btCollisionShape** %1, align 8
  call void @llvm.dbg.declare(metadata %class.btCollisionShape** %1, metadata !1471, metadata !896), !dbg !1472
  %2 = load %class.btCollisionShape** %1
  %3 = call i32 @_ZNK16btCollisionShape12getShapeTypeEv(%class.btCollisionShape* %2), !dbg !1473
  %4 = call zeroext i1 @_ZN17btBroadphaseProxy10isConvex2dEi(i32 %3), !dbg !1474
  ret i1 %4, !dbg !1475
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr void @_ZN9btVector38setValueERKfS1_S1_(%class.btVector3* %this, float* dereferenceable(4) %_x, float* dereferenceable(4) %_y, float* dereferenceable(4) %_z) #2 align 2 {
  %1 = alloca %class.btVector3*, align 8
  %2 = alloca float*, align 8
  %3 = alloca float*, align 8
  %4 = alloca float*, align 8
  store %class.btVector3* %this, %class.btVector3** %1, align 8
  call void @llvm.dbg.declare(metadata %class.btVector3** %1, metadata !1476, metadata !896), !dbg !1477
  store float* %_x, float** %2, align 8
  call void @llvm.dbg.declare(metadata float** %2, metadata !1478, metadata !896), !dbg !1479
  store float* %_y, float** %3, align 8
  call void @llvm.dbg.declare(metadata float** %3, metadata !1480, metadata !896), !dbg !1481
  store float* %_z, float** %4, align 8
  call void @llvm.dbg.declare(metadata float** %4, metadata !1482, metadata !896), !dbg !1483
  %5 = load %class.btVector3** %1
  %6 = load float** %2, align 8, !dbg !1484
  %7 = load float* %6, align 4, !dbg !1484
  %8 = getelementptr inbounds %class.btVector3* %5, i32 0, i32 0, !dbg !1485
  %9 = getelementptr inbounds [4 x float]* %8, i32 0, i64 0, !dbg !1485
  store float %7, float* %9, align 4, !dbg !1485
  %10 = load float** %3, align 8, !dbg !1486
  %11 = load float* %10, align 4, !dbg !1486
  %12 = getelementptr inbounds %class.btVector3* %5, i32 0, i32 0, !dbg !1487
  %13 = getelementptr inbounds [4 x float]* %12, i32 0, i64 1, !dbg !1487
  store float %11, float* %13, align 4, !dbg !1487
  %14 = load float** %4, align 8, !dbg !1488
  %15 = load float* %14, align 4, !dbg !1488
  %16 = getelementptr inbounds %class.btVector3* %5, i32 0, i32 0, !dbg !1489
  %17 = getelementptr inbounds [4 x float]* %16, i32 0, i64 2, !dbg !1489
  store float %15, float* %17, align 4, !dbg !1489
  %18 = getelementptr inbounds %class.btVector3* %5, i32 0, i32 0, !dbg !1490
  %19 = getelementptr inbounds [4 x float]* %18, i32 0, i64 3, !dbg !1490
  store float 0.000000e+00, float* %19, align 4, !dbg !1490
  ret void, !dbg !1491
}

declare void @_ZN22btVoronoiSimplexSolver5resetEv(%class.btVoronoiSimplexSolver*) #6

; Function Attrs: inlinehint uwtable
define linkonce_odr { <2 x float>, <2 x float> } @_ZmlRK9btVector3RK11btMatrix3x3(%class.btVector3* dereferenceable(16) %v, %class.btMatrix3x3* dereferenceable(48) %m) #5 {
  %1 = alloca %class.btVector3, align 4
  %2 = alloca %class.btVector3*, align 8
  %3 = alloca %class.btMatrix3x3*, align 8
  %4 = alloca float, align 4
  %5 = alloca float, align 4
  %6 = alloca float, align 4
  store %class.btVector3* %v, %class.btVector3** %2, align 8
  call void @llvm.dbg.declare(metadata %class.btVector3** %2, metadata !1492, metadata !896), !dbg !1493
  store %class.btMatrix3x3* %m, %class.btMatrix3x3** %3, align 8
  call void @llvm.dbg.declare(metadata %class.btMatrix3x3** %3, metadata !1494, metadata !896), !dbg !1495
  %7 = load %class.btMatrix3x3** %3, align 8, !dbg !1496
  %8 = load %class.btVector3** %2, align 8, !dbg !1496
  %9 = call float @_ZNK11btMatrix3x35tdotxERK9btVector3(%class.btMatrix3x3* %7, %class.btVector3* dereferenceable(16) %8), !dbg !1496
  store float %9, float* %4, !dbg !1497
  %10 = load %class.btMatrix3x3** %3, align 8, !dbg !1498
  %11 = load %class.btVector3** %2, align 8, !dbg !1498
  %12 = call float @_ZNK11btMatrix3x35tdotyERK9btVector3(%class.btMatrix3x3* %10, %class.btVector3* dereferenceable(16) %11), !dbg !1498
  store float %12, float* %5, !dbg !1497
  %13 = load %class.btMatrix3x3** %3, align 8, !dbg !1499
  %14 = load %class.btVector3** %2, align 8, !dbg !1499
  %15 = call float @_ZNK11btMatrix3x35tdotzERK9btVector3(%class.btMatrix3x3* %13, %class.btVector3* dereferenceable(16) %14), !dbg !1499
  store float %15, float* %6, !dbg !1497
  call void @_ZN9btVector3C2ERKfS1_S1_(%class.btVector3* %1, float* dereferenceable(4) %4, float* dereferenceable(4) %5, float* dereferenceable(4) %6), !dbg !1497
  %16 = getelementptr %class.btVector3* %1, i32 0, i32 0, !dbg !1497
  %17 = bitcast [4 x float]* %16 to { <2 x float>, <2 x float> }*, !dbg !1497
  %18 = load { <2 x float>, <2 x float> }* %17, align 1, !dbg !1497
  ret { <2 x float>, <2 x float> } %18, !dbg !1497
}

; Function Attrs: inlinehint uwtable
define linkonce_odr { <2 x float>, <2 x float> } @_ZngRK9btVector3(%class.btVector3* dereferenceable(16) %v) #5 {
  %1 = alloca %class.btVector3, align 4
  %2 = alloca %class.btVector3*, align 8
  %3 = alloca float, align 4
  %4 = alloca float, align 4
  %5 = alloca float, align 4
  store %class.btVector3* %v, %class.btVector3** %2, align 8
  call void @llvm.dbg.declare(metadata %class.btVector3** %2, metadata !1500, metadata !896), !dbg !1501
  %6 = load %class.btVector3** %2, align 8, !dbg !1502
  %7 = getelementptr inbounds %class.btVector3* %6, i32 0, i32 0, !dbg !1502
  %8 = getelementptr inbounds [4 x float]* %7, i32 0, i64 0, !dbg !1502
  %9 = load float* %8, align 4, !dbg !1502
  %10 = fsub float -0.000000e+00, %9, !dbg !1503
  store float %10, float* %3, !dbg !1504
  %11 = load %class.btVector3** %2, align 8, !dbg !1505
  %12 = getelementptr inbounds %class.btVector3* %11, i32 0, i32 0, !dbg !1505
  %13 = getelementptr inbounds [4 x float]* %12, i32 0, i64 1, !dbg !1505
  %14 = load float* %13, align 4, !dbg !1505
  %15 = fsub float -0.000000e+00, %14, !dbg !1506
  store float %15, float* %4, !dbg !1504
  %16 = load %class.btVector3** %2, align 8, !dbg !1507
  %17 = getelementptr inbounds %class.btVector3* %16, i32 0, i32 0, !dbg !1507
  %18 = getelementptr inbounds [4 x float]* %17, i32 0, i64 2, !dbg !1507
  %19 = load float* %18, align 4, !dbg !1507
  %20 = fsub float -0.000000e+00, %19, !dbg !1508
  store float %20, float* %5, !dbg !1504
  call void @_ZN9btVector3C2ERKfS1_S1_(%class.btVector3* %1, float* dereferenceable(4) %3, float* dereferenceable(4) %4, float* dereferenceable(4) %5), !dbg !1504
  %21 = getelementptr %class.btVector3* %1, i32 0, i32 0, !dbg !1504
  %22 = bitcast [4 x float]* %21 to { <2 x float>, <2 x float> }*, !dbg !1504
  %23 = load { <2 x float>, <2 x float> }* %22, align 1, !dbg !1504
  ret { <2 x float>, <2 x float> } %23, !dbg !1504
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dereferenceable(48) %class.btMatrix3x3* @_ZNK11btTransform8getBasisEv(%class.btTransform* %this) #2 align 2 {
  %1 = alloca %class.btTransform*, align 8
  store %class.btTransform* %this, %class.btTransform** %1, align 8
  call void @llvm.dbg.declare(metadata %class.btTransform** %1, metadata !1509, metadata !896), !dbg !1511
  %2 = load %class.btTransform** %1
  %3 = getelementptr inbounds %class.btTransform* %2, i32 0, i32 0, !dbg !1512
  ret %class.btMatrix3x3* %3, !dbg !1512
}

declare { <2 x float>, <2 x float> } @_ZNK13btConvexShape44localGetSupportVertexWithoutMarginNonVirtualERK9btVector3(%class.btConvexShape*, %class.btVector3* dereferenceable(16)) #6

; Function Attrs: inlinehint uwtable
define linkonce_odr { <2 x float>, <2 x float> } @_ZNK11btTransformclERK9btVector3(%class.btTransform* %this, %class.btVector3* dereferenceable(16) %x) #5 align 2 {
  %1 = alloca %class.btVector3, align 4
  %2 = alloca %class.btTransform*, align 8
  %3 = alloca %class.btVector3*, align 8
  %4 = alloca %class.btVector3, align 4
  store %class.btTransform* %this, %class.btTransform** %2, align 8
  call void @llvm.dbg.declare(metadata %class.btTransform** %2, metadata !1513, metadata !896), !dbg !1514
  store %class.btVector3* %x, %class.btVector3** %3, align 8
  call void @llvm.dbg.declare(metadata %class.btVector3** %3, metadata !1515, metadata !896), !dbg !1516
  %5 = load %class.btTransform** %2
  %6 = load %class.btVector3** %3, align 8, !dbg !1517
  %7 = getelementptr inbounds %class.btTransform* %5, i32 0, i32 0, !dbg !1518
  %8 = call dereferenceable(16) %class.btVector3* @_ZNK11btMatrix3x3ixEi(%class.btMatrix3x3* %7, i32 0), !dbg !1518
  %9 = getelementptr inbounds %class.btTransform* %5, i32 0, i32 0, !dbg !1519
  %10 = call dereferenceable(16) %class.btVector3* @_ZNK11btMatrix3x3ixEi(%class.btMatrix3x3* %9, i32 1), !dbg !1519
  %11 = getelementptr inbounds %class.btTransform* %5, i32 0, i32 0, !dbg !1520
  %12 = call dereferenceable(16) %class.btVector3* @_ZNK11btMatrix3x3ixEi(%class.btMatrix3x3* %11, i32 2), !dbg !1520
  %13 = call { <2 x float>, <2 x float> } @_ZNK9btVector34dot3ERKS_S1_S1_(%class.btVector3* %6, %class.btVector3* dereferenceable(16) %8, %class.btVector3* dereferenceable(16) %10, %class.btVector3* dereferenceable(16) %12), !dbg !1517
  %14 = getelementptr %class.btVector3* %4, i32 0, i32 0, !dbg !1517
  %15 = bitcast [4 x float]* %14 to { <2 x float>, <2 x float> }*, !dbg !1517
  %16 = getelementptr { <2 x float>, <2 x float> }* %15, i32 0, i32 0, !dbg !1517
  %17 = extractvalue { <2 x float>, <2 x float> } %13, 0, !dbg !1517
  store <2 x float> %17, <2 x float>* %16, align 1, !dbg !1517
  %18 = getelementptr { <2 x float>, <2 x float> }* %15, i32 0, i32 1, !dbg !1517
  %19 = extractvalue { <2 x float>, <2 x float> } %13, 1, !dbg !1517
  store <2 x float> %19, <2 x float>* %18, align 1, !dbg !1517
  %20 = getelementptr inbounds %class.btTransform* %5, i32 0, i32 1, !dbg !1521
  %21 = call { <2 x float>, <2 x float> } @_ZplRK9btVector3S1_(%class.btVector3* dereferenceable(16) %4, %class.btVector3* dereferenceable(16) %20), !dbg !1521
  %22 = getelementptr %class.btVector3* %1, i32 0, i32 0, !dbg !1521
  %23 = bitcast [4 x float]* %22 to { <2 x float>, <2 x float> }*, !dbg !1521
  %24 = getelementptr { <2 x float>, <2 x float> }* %23, i32 0, i32 0, !dbg !1521
  %25 = extractvalue { <2 x float>, <2 x float> } %21, 0, !dbg !1521
  store <2 x float> %25, <2 x float>* %24, align 1, !dbg !1521
  %26 = getelementptr { <2 x float>, <2 x float> }* %23, i32 0, i32 1, !dbg !1521
  %27 = extractvalue { <2 x float>, <2 x float> } %21, 1, !dbg !1521
  store <2 x float> %27, <2 x float>* %26, align 1, !dbg !1521
  %28 = getelementptr %class.btVector3* %1, i32 0, i32 0, !dbg !1522
  %29 = bitcast [4 x float]* %28 to { <2 x float>, <2 x float> }*, !dbg !1522
  %30 = load { <2 x float>, <2 x float> }* %29, align 1, !dbg !1522
  ret { <2 x float>, <2 x float> } %30, !dbg !1522
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr float* @_ZN9btVector3cvPfEv(%class.btVector3* %this) #2 align 2 {
  %1 = alloca %class.btVector3*, align 8
  store %class.btVector3* %this, %class.btVector3** %1, align 8
  call void @llvm.dbg.declare(metadata %class.btVector3** %1, metadata !1523, metadata !896), !dbg !1524
  %2 = load %class.btVector3** %1
  %3 = getelementptr inbounds %class.btVector3* %2, i32 0, i32 0, !dbg !1525
  %4 = getelementptr inbounds [4 x float]* %3, i32 0, i64 0, !dbg !1525
  ret float* %4, !dbg !1526
}

; Function Attrs: inlinehint uwtable
define linkonce_odr { <2 x float>, <2 x float> } @_ZmiRK9btVector3S1_(%class.btVector3* dereferenceable(16) %v1, %class.btVector3* dereferenceable(16) %v2) #5 {
  %1 = alloca %class.btVector3, align 4
  %2 = alloca %class.btVector3*, align 8
  %3 = alloca %class.btVector3*, align 8
  %4 = alloca float, align 4
  %5 = alloca float, align 4
  %6 = alloca float, align 4
  store %class.btVector3* %v1, %class.btVector3** %2, align 8
  call void @llvm.dbg.declare(metadata %class.btVector3** %2, metadata !1527, metadata !896), !dbg !1528
  store %class.btVector3* %v2, %class.btVector3** %3, align 8
  call void @llvm.dbg.declare(metadata %class.btVector3** %3, metadata !1529, metadata !896), !dbg !1530
  %7 = load %class.btVector3** %2, align 8, !dbg !1531
  %8 = getelementptr inbounds %class.btVector3* %7, i32 0, i32 0, !dbg !1531
  %9 = getelementptr inbounds [4 x float]* %8, i32 0, i64 0, !dbg !1531
  %10 = load float* %9, align 4, !dbg !1531
  %11 = load %class.btVector3** %3, align 8, !dbg !1532
  %12 = getelementptr inbounds %class.btVector3* %11, i32 0, i32 0, !dbg !1532
  %13 = getelementptr inbounds [4 x float]* %12, i32 0, i64 0, !dbg !1532
  %14 = load float* %13, align 4, !dbg !1532
  %15 = fsub float %10, %14, !dbg !1531
  store float %15, float* %4, !dbg !1533
  %16 = load %class.btVector3** %2, align 8, !dbg !1534
  %17 = getelementptr inbounds %class.btVector3* %16, i32 0, i32 0, !dbg !1534
  %18 = getelementptr inbounds [4 x float]* %17, i32 0, i64 1, !dbg !1534
  %19 = load float* %18, align 4, !dbg !1534
  %20 = load %class.btVector3** %3, align 8, !dbg !1535
  %21 = getelementptr inbounds %class.btVector3* %20, i32 0, i32 0, !dbg !1535
  %22 = getelementptr inbounds [4 x float]* %21, i32 0, i64 1, !dbg !1535
  %23 = load float* %22, align 4, !dbg !1535
  %24 = fsub float %19, %23, !dbg !1534
  store float %24, float* %5, !dbg !1533
  %25 = load %class.btVector3** %2, align 8, !dbg !1536
  %26 = getelementptr inbounds %class.btVector3* %25, i32 0, i32 0, !dbg !1536
  %27 = getelementptr inbounds [4 x float]* %26, i32 0, i64 2, !dbg !1536
  %28 = load float* %27, align 4, !dbg !1536
  %29 = load %class.btVector3** %3, align 8, !dbg !1537
  %30 = getelementptr inbounds %class.btVector3* %29, i32 0, i32 0, !dbg !1537
  %31 = getelementptr inbounds [4 x float]* %30, i32 0, i64 2, !dbg !1537
  %32 = load float* %31, align 4, !dbg !1537
  %33 = fsub float %28, %32, !dbg !1536
  store float %33, float* %6, !dbg !1533
  call void @_ZN9btVector3C2ERKfS1_S1_(%class.btVector3* %1, float* dereferenceable(4) %4, float* dereferenceable(4) %5, float* dereferenceable(4) %6), !dbg !1533
  %34 = getelementptr %class.btVector3* %1, i32 0, i32 0, !dbg !1533
  %35 = bitcast [4 x float]* %34 to { <2 x float>, <2 x float> }*, !dbg !1533
  %36 = load { <2 x float>, <2 x float> }* %35, align 1, !dbg !1533
  ret { <2 x float>, <2 x float> } %36, !dbg !1533
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr float @_ZNK9btVector33dotERKS_(%class.btVector3* %this, %class.btVector3* dereferenceable(16) %v) #2 align 2 {
  %1 = alloca %class.btVector3*, align 8
  %2 = alloca %class.btVector3*, align 8
  store %class.btVector3* %this, %class.btVector3** %1, align 8
  call void @llvm.dbg.declare(metadata %class.btVector3** %1, metadata !1538, metadata !896), !dbg !1539
  store %class.btVector3* %v, %class.btVector3** %2, align 8
  call void @llvm.dbg.declare(metadata %class.btVector3** %2, metadata !1540, metadata !896), !dbg !1541
  %3 = load %class.btVector3** %1
  %4 = getelementptr inbounds %class.btVector3* %3, i32 0, i32 0, !dbg !1542
  %5 = getelementptr inbounds [4 x float]* %4, i32 0, i64 0, !dbg !1542
  %6 = load float* %5, align 4, !dbg !1542
  %7 = load %class.btVector3** %2, align 8, !dbg !1543
  %8 = getelementptr inbounds %class.btVector3* %7, i32 0, i32 0, !dbg !1543
  %9 = getelementptr inbounds [4 x float]* %8, i32 0, i64 0, !dbg !1543
  %10 = load float* %9, align 4, !dbg !1543
  %11 = fmul float %6, %10, !dbg !1542
  %12 = getelementptr inbounds %class.btVector3* %3, i32 0, i32 0, !dbg !1544
  %13 = getelementptr inbounds [4 x float]* %12, i32 0, i64 1, !dbg !1544
  %14 = load float* %13, align 4, !dbg !1544
  %15 = load %class.btVector3** %2, align 8, !dbg !1545
  %16 = getelementptr inbounds %class.btVector3* %15, i32 0, i32 0, !dbg !1545
  %17 = getelementptr inbounds [4 x float]* %16, i32 0, i64 1, !dbg !1545
  %18 = load float* %17, align 4, !dbg !1545
  %19 = fmul float %14, %18, !dbg !1544
  %20 = fadd float %11, %19, !dbg !1542
  %21 = getelementptr inbounds %class.btVector3* %3, i32 0, i32 0, !dbg !1546
  %22 = getelementptr inbounds [4 x float]* %21, i32 0, i64 2, !dbg !1546
  %23 = load float* %22, align 4, !dbg !1546
  %24 = load %class.btVector3** %2, align 8, !dbg !1547
  %25 = getelementptr inbounds %class.btVector3* %24, i32 0, i32 0, !dbg !1547
  %26 = getelementptr inbounds [4 x float]* %25, i32 0, i64 2, !dbg !1547
  %27 = load float* %26, align 4, !dbg !1547
  %28 = fmul float %23, %27, !dbg !1546
  %29 = fadd float %20, %28, !dbg !1542
  ret float %29, !dbg !1548
}

declare zeroext i1 @_ZN22btVoronoiSimplexSolver9inSimplexERK9btVector3(%class.btVoronoiSimplexSolver*, %class.btVector3* dereferenceable(16)) #6

declare void @_ZN22btVoronoiSimplexSolver9addVertexERK9btVector3S2_S2_(%class.btVoronoiSimplexSolver*, %class.btVector3* dereferenceable(16), %class.btVector3* dereferenceable(16), %class.btVector3* dereferenceable(16)) #6

declare zeroext i1 @_ZN22btVoronoiSimplexSolver7closestER9btVector3(%class.btVoronoiSimplexSolver*, %class.btVector3* dereferenceable(16)) #6

; Function Attrs: inlinehint uwtable
define linkonce_odr float @_ZNK9btVector37length2Ev(%class.btVector3* %this) #5 align 2 {
  %1 = alloca %class.btVector3*, align 8
  store %class.btVector3* %this, %class.btVector3** %1, align 8
  call void @llvm.dbg.declare(metadata %class.btVector3** %1, metadata !1549, metadata !896), !dbg !1550
  %2 = load %class.btVector3** %1
  %3 = call float @_ZNK9btVector33dotERKS_(%class.btVector3* %2, %class.btVector3* dereferenceable(16) %2), !dbg !1551
  ret float %3, !dbg !1552
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #7

; Function Attrs: nounwind uwtable
define linkonce_odr zeroext i1 @_ZNK22btVoronoiSimplexSolver11fullSimplexEv(%class.btVoronoiSimplexSolver* %this) #3 align 2 {
  %1 = alloca %class.btVoronoiSimplexSolver*, align 8
  store %class.btVoronoiSimplexSolver* %this, %class.btVoronoiSimplexSolver** %1, align 8
  call void @llvm.dbg.declare(metadata %class.btVoronoiSimplexSolver** %1, metadata !1553, metadata !896), !dbg !1555
  %2 = load %class.btVoronoiSimplexSolver** %1
  %3 = getelementptr inbounds %class.btVoronoiSimplexSolver* %2, i32 0, i32 0, !dbg !1556
  %4 = load i32* %3, align 4, !dbg !1556
  %5 = icmp eq i32 %4, 4, !dbg !1556
  ret i1 %5, !dbg !1557
}

declare void @_ZN22btVoronoiSimplexSolver14compute_pointsER9btVector3S1_(%class.btVoronoiSimplexSolver*, %class.btVector3* dereferenceable(16), %class.btVector3* dereferenceable(16)) #6

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr float @_Z6btSqrtf(float %y) #2 {
  %1 = alloca float, align 4
  store float %y, float* %1, align 4
  call void @llvm.dbg.declare(metadata float* %1, metadata !1558, metadata !896), !dbg !1559
  %2 = load float* %1, align 4, !dbg !1560
  %3 = call float @sqrtf(float %2) #7, !dbg !1561
  ret float %3, !dbg !1562
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dereferenceable(16) %class.btVector3* @_ZN9btVector3mLERKf(%class.btVector3* %this, float* dereferenceable(4) %s) #2 align 2 {
  %1 = alloca %class.btVector3*, align 8
  %2 = alloca float*, align 8
  store %class.btVector3* %this, %class.btVector3** %1, align 8
  call void @llvm.dbg.declare(metadata %class.btVector3** %1, metadata !1563, metadata !896), !dbg !1564
  store float* %s, float** %2, align 8
  call void @llvm.dbg.declare(metadata float** %2, metadata !1565, metadata !896), !dbg !1566
  %3 = load %class.btVector3** %1
  %4 = load float** %2, align 8, !dbg !1567
  %5 = load float* %4, align 4, !dbg !1567
  %6 = getelementptr inbounds %class.btVector3* %3, i32 0, i32 0, !dbg !1568
  %7 = getelementptr inbounds [4 x float]* %6, i32 0, i64 0, !dbg !1568
  %8 = load float* %7, align 4, !dbg !1568
  %9 = fmul float %8, %5, !dbg !1568
  store float %9, float* %7, align 4, !dbg !1568
  %10 = load float** %2, align 8, !dbg !1569
  %11 = load float* %10, align 4, !dbg !1569
  %12 = getelementptr inbounds %class.btVector3* %3, i32 0, i32 0, !dbg !1570
  %13 = getelementptr inbounds [4 x float]* %12, i32 0, i64 1, !dbg !1570
  %14 = load float* %13, align 4, !dbg !1570
  %15 = fmul float %14, %11, !dbg !1570
  store float %15, float* %13, align 4, !dbg !1570
  %16 = load float** %2, align 8, !dbg !1571
  %17 = load float* %16, align 4, !dbg !1571
  %18 = getelementptr inbounds %class.btVector3* %3, i32 0, i32 0, !dbg !1572
  %19 = getelementptr inbounds [4 x float]* %18, i32 0, i64 2, !dbg !1572
  %20 = load float* %19, align 4, !dbg !1572
  %21 = fmul float %20, %17, !dbg !1572
  store float %21, float* %19, align 4, !dbg !1572
  ret %class.btVector3* %3, !dbg !1573
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dereferenceable(16) %class.btVector3* @_ZN9btVector3pLERKS_(%class.btVector3* %this, %class.btVector3* dereferenceable(16) %v) #2 align 2 {
  %1 = alloca %class.btVector3*, align 8
  %2 = alloca %class.btVector3*, align 8
  store %class.btVector3* %this, %class.btVector3** %1, align 8
  call void @llvm.dbg.declare(metadata %class.btVector3** %1, metadata !1574, metadata !896), !dbg !1575
  store %class.btVector3* %v, %class.btVector3** %2, align 8
  call void @llvm.dbg.declare(metadata %class.btVector3** %2, metadata !1576, metadata !896), !dbg !1577
  %3 = load %class.btVector3** %1
  %4 = load %class.btVector3** %2, align 8, !dbg !1578
  %5 = getelementptr inbounds %class.btVector3* %4, i32 0, i32 0, !dbg !1578
  %6 = getelementptr inbounds [4 x float]* %5, i32 0, i64 0, !dbg !1578
  %7 = load float* %6, align 4, !dbg !1578
  %8 = getelementptr inbounds %class.btVector3* %3, i32 0, i32 0, !dbg !1579
  %9 = getelementptr inbounds [4 x float]* %8, i32 0, i64 0, !dbg !1579
  %10 = load float* %9, align 4, !dbg !1579
  %11 = fadd float %10, %7, !dbg !1579
  store float %11, float* %9, align 4, !dbg !1579
  %12 = load %class.btVector3** %2, align 8, !dbg !1580
  %13 = getelementptr inbounds %class.btVector3* %12, i32 0, i32 0, !dbg !1580
  %14 = getelementptr inbounds [4 x float]* %13, i32 0, i64 1, !dbg !1580
  %15 = load float* %14, align 4, !dbg !1580
  %16 = getelementptr inbounds %class.btVector3* %3, i32 0, i32 0, !dbg !1581
  %17 = getelementptr inbounds [4 x float]* %16, i32 0, i64 1, !dbg !1581
  %18 = load float* %17, align 4, !dbg !1581
  %19 = fadd float %18, %15, !dbg !1581
  store float %19, float* %17, align 4, !dbg !1581
  %20 = load %class.btVector3** %2, align 8, !dbg !1582
  %21 = getelementptr inbounds %class.btVector3* %20, i32 0, i32 0, !dbg !1582
  %22 = getelementptr inbounds [4 x float]* %21, i32 0, i64 2, !dbg !1582
  %23 = load float* %22, align 4, !dbg !1582
  %24 = getelementptr inbounds %class.btVector3* %3, i32 0, i32 0, !dbg !1583
  %25 = getelementptr inbounds [4 x float]* %24, i32 0, i64 2, !dbg !1583
  %26 = load float* %25, align 4, !dbg !1583
  %27 = fadd float %26, %23, !dbg !1583
  store float %27, float* %25, align 4, !dbg !1583
  ret %class.btVector3* %3, !dbg !1584
}

; Function Attrs: uwtable
define linkonce_odr void @_ZN9btVector37setZeroEv(%class.btVector3* %this) #0 align 2 {
  %1 = alloca %class.btVector3*, align 8
  %2 = alloca float, align 4
  %3 = alloca float, align 4
  %4 = alloca float, align 4
  store %class.btVector3* %this, %class.btVector3** %1, align 8
  call void @llvm.dbg.declare(metadata %class.btVector3** %1, metadata !1585, metadata !896), !dbg !1586
  %5 = load %class.btVector3** %1
  store float 0.000000e+00, float* %2, !dbg !1587
  store float 0.000000e+00, float* %3, !dbg !1587
  store float 0.000000e+00, float* %4, !dbg !1587
  call void @_ZN9btVector38setValueERKfS1_S1_(%class.btVector3* %5, float* dereferenceable(4) %2, float* dereferenceable(4) %3, float* dereferenceable(4) %4), !dbg !1587
  ret void, !dbg !1588
}

; Function Attrs: inlinehint uwtable
define linkonce_odr dereferenceable(16) %class.btVector3* @_ZN9btVector3dVERKf(%class.btVector3* %this, float* dereferenceable(4) %s) #5 align 2 {
  %1 = alloca %class.btVector3*, align 8
  %2 = alloca float*, align 8
  %3 = alloca float, align 4
  store %class.btVector3* %this, %class.btVector3** %1, align 8
  call void @llvm.dbg.declare(metadata %class.btVector3** %1, metadata !1589, metadata !896), !dbg !1590
  store float* %s, float** %2, align 8
  call void @llvm.dbg.declare(metadata float** %2, metadata !1591, metadata !896), !dbg !1592
  %4 = load %class.btVector3** %1
  %5 = load float** %2, align 8, !dbg !1593
  %6 = load float* %5, align 4, !dbg !1593
  %7 = fdiv float 1.000000e+00, %6, !dbg !1594
  store float %7, float* %3, !dbg !1595
  %8 = call dereferenceable(16) %class.btVector3* @_ZN9btVector3mLERKf(%class.btVector3* %4, float* dereferenceable(4) %3), !dbg !1596
  ret %class.btVector3* %8, !dbg !1597
}

; Function Attrs: inlinehint uwtable
define linkonce_odr float @_ZNK9btVector36lengthEv(%class.btVector3* %this) #5 align 2 {
  %1 = alloca %class.btVector3*, align 8
  store %class.btVector3* %this, %class.btVector3** %1, align 8
  call void @llvm.dbg.declare(metadata %class.btVector3** %1, metadata !1598, metadata !896), !dbg !1599
  %2 = load %class.btVector3** %1
  %3 = call float @_ZNK9btVector37length2Ev(%class.btVector3* %2), !dbg !1600
  %4 = call float @_Z6btSqrtf(float %3), !dbg !1601
  ret float %4, !dbg !1602
}

; Function Attrs: inlinehint uwtable
define linkonce_odr dereferenceable(16) %class.btVector3* @_ZN9btVector39normalizeEv(%class.btVector3* %this) #5 align 2 {
  %1 = alloca %class.btVector3*, align 8
  %2 = alloca float, align 4
  store %class.btVector3* %this, %class.btVector3** %1, align 8
  call void @llvm.dbg.declare(metadata %class.btVector3** %1, metadata !1603, metadata !896), !dbg !1604
  %3 = load %class.btVector3** %1
  %4 = call float @_ZNK9btVector36lengthEv(%class.btVector3* %3), !dbg !1605
  store float %4, float* %2, !dbg !1606
  %5 = call dereferenceable(16) %class.btVector3* @_ZN9btVector3dVERKf(%class.btVector3* %3, float* dereferenceable(4) %2), !dbg !1607
  ret %class.btVector3* %5, !dbg !1608
}

; Function Attrs: uwtable
define linkonce_odr void @_ZN17btGjkPairDetectorD2Ev(%class.btGjkPairDetector* %this) unnamed_addr #0 align 2 {
  %1 = alloca %class.btGjkPairDetector*, align 8
  store %class.btGjkPairDetector* %this, %class.btGjkPairDetector** %1, align 8
  call void @llvm.dbg.declare(metadata %class.btGjkPairDetector** %1, metadata !1609, metadata !896), !dbg !1610
  %2 = load %class.btGjkPairDetector** %1
  %3 = bitcast %class.btGjkPairDetector* %2 to %struct.btDiscreteCollisionDetectorInterface*, !dbg !1611
  call void @_ZN36btDiscreteCollisionDetectorInterfaceD2Ev(%struct.btDiscreteCollisionDetectorInterface* %3), !dbg !1611
  ret void, !dbg !1613
}

; Function Attrs: uwtable
define linkonce_odr void @_ZN17btGjkPairDetectorD0Ev(%class.btGjkPairDetector* %this) unnamed_addr #0 align 2 {
  %1 = alloca %class.btGjkPairDetector*, align 8
  %2 = alloca i8*
  %3 = alloca i32
  store %class.btGjkPairDetector* %this, %class.btGjkPairDetector** %1, align 8
  call void @llvm.dbg.declare(metadata %class.btGjkPairDetector** %1, metadata !1614, metadata !896), !dbg !1615
  %4 = load %class.btGjkPairDetector** %1
  invoke void @_ZN17btGjkPairDetectorD2Ev(%class.btGjkPairDetector* %4)
          to label %5 unwind label %7, !dbg !1616

; <label>:5                                       ; preds = %0
  %6 = bitcast %class.btGjkPairDetector* %4 to i8*, !dbg !1617
  call void @_ZdlPv(i8* %6) #11, !dbg !1617
  ret void, !dbg !1619

; <label>:7                                       ; preds = %0
  %8 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup, !dbg !1620
  %9 = extractvalue { i8*, i32 } %8, 0, !dbg !1620
  store i8* %9, i8** %2, !dbg !1620
  %10 = extractvalue { i8*, i32 } %8, 1, !dbg !1620
  store i32 %10, i32* %3, !dbg !1620
  %11 = bitcast %class.btGjkPairDetector* %4 to i8*, !dbg !1620
  call void @_ZdlPv(i8* %11) #11, !dbg !1620
  br label %12, !dbg !1620

; <label>:12                                      ; preds = %7
  %13 = load i8** %2, !dbg !1622
  %14 = load i32* %3, !dbg !1622
  %15 = insertvalue { i8*, i32 } undef, i8* %13, 0, !dbg !1622
  %16 = insertvalue { i8*, i32 } %15, i32 %14, 1, !dbg !1622
  resume { i8*, i32 } %16, !dbg !1622
}

; Function Attrs: nobuiltin nounwind
declare void @_ZdlPv(i8*) #8

; Function Attrs: nounwind
declare float @sqrtf(float) #9

; Function Attrs: inlinehint uwtable
define linkonce_odr { <2 x float>, <2 x float> } @_ZNK9btVector34dot3ERKS_S1_S1_(%class.btVector3* %this, %class.btVector3* dereferenceable(16) %v0, %class.btVector3* dereferenceable(16) %v1, %class.btVector3* dereferenceable(16) %v2) #5 align 2 {
  %1 = alloca %class.btVector3, align 4
  %2 = alloca %class.btVector3*, align 8
  %3 = alloca %class.btVector3*, align 8
  %4 = alloca %class.btVector3*, align 8
  %5 = alloca %class.btVector3*, align 8
  %6 = alloca float, align 4
  %7 = alloca float, align 4
  %8 = alloca float, align 4
  store %class.btVector3* %this, %class.btVector3** %2, align 8
  call void @llvm.dbg.declare(metadata %class.btVector3** %2, metadata !1624, metadata !896), !dbg !1625
  store %class.btVector3* %v0, %class.btVector3** %3, align 8
  call void @llvm.dbg.declare(metadata %class.btVector3** %3, metadata !1626, metadata !896), !dbg !1627
  store %class.btVector3* %v1, %class.btVector3** %4, align 8
  call void @llvm.dbg.declare(metadata %class.btVector3** %4, metadata !1628, metadata !896), !dbg !1629
  store %class.btVector3* %v2, %class.btVector3** %5, align 8
  call void @llvm.dbg.declare(metadata %class.btVector3** %5, metadata !1630, metadata !896), !dbg !1631
  %9 = load %class.btVector3** %2
  %10 = load %class.btVector3** %3, align 8, !dbg !1632
  %11 = call float @_ZNK9btVector33dotERKS_(%class.btVector3* %9, %class.btVector3* dereferenceable(16) %10), !dbg !1632
  store float %11, float* %6, !dbg !1633
  %12 = load %class.btVector3** %4, align 8, !dbg !1634
  %13 = call float @_ZNK9btVector33dotERKS_(%class.btVector3* %9, %class.btVector3* dereferenceable(16) %12), !dbg !1634
  store float %13, float* %7, !dbg !1633
  %14 = load %class.btVector3** %5, align 8, !dbg !1635
  %15 = call float @_ZNK9btVector33dotERKS_(%class.btVector3* %9, %class.btVector3* dereferenceable(16) %14), !dbg !1635
  store float %15, float* %8, !dbg !1633
  call void @_ZN9btVector3C2ERKfS1_S1_(%class.btVector3* %1, float* dereferenceable(4) %6, float* dereferenceable(4) %7, float* dereferenceable(4) %8), !dbg !1633
  %16 = getelementptr %class.btVector3* %1, i32 0, i32 0, !dbg !1633
  %17 = bitcast [4 x float]* %16 to { <2 x float>, <2 x float> }*, !dbg !1633
  %18 = load { <2 x float>, <2 x float> }* %17, align 1, !dbg !1633
  ret { <2 x float>, <2 x float> } %18, !dbg !1633
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dereferenceable(16) %class.btVector3* @_ZNK11btMatrix3x3ixEi(%class.btMatrix3x3* %this, i32 %i) #2 align 2 {
  %1 = alloca %class.btMatrix3x3*, align 8
  %2 = alloca i32, align 4
  store %class.btMatrix3x3* %this, %class.btMatrix3x3** %1, align 8
  call void @llvm.dbg.declare(metadata %class.btMatrix3x3** %1, metadata !1636, metadata !896), !dbg !1638
  store i32 %i, i32* %2, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !1639, metadata !896), !dbg !1640
  %3 = load %class.btMatrix3x3** %1
  %4 = load i32* %2, align 4, !dbg !1641
  %5 = sext i32 %4 to i64, !dbg !1642
  %6 = getelementptr inbounds %class.btMatrix3x3* %3, i32 0, i32 0, !dbg !1642
  %7 = getelementptr inbounds [3 x %class.btVector3]* %6, i32 0, i64 %5, !dbg !1642
  ret %class.btVector3* %7, !dbg !1642
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr float @_ZNK11btMatrix3x35tdotxERK9btVector3(%class.btMatrix3x3* %this, %class.btVector3* dereferenceable(16) %v) #2 align 2 {
  %1 = alloca %class.btMatrix3x3*, align 8
  %2 = alloca %class.btVector3*, align 8
  store %class.btMatrix3x3* %this, %class.btMatrix3x3** %1, align 8
  call void @llvm.dbg.declare(metadata %class.btMatrix3x3** %1, metadata !1643, metadata !896), !dbg !1644
  store %class.btVector3* %v, %class.btVector3** %2, align 8
  call void @llvm.dbg.declare(metadata %class.btVector3** %2, metadata !1645, metadata !896), !dbg !1646
  %3 = load %class.btMatrix3x3** %1
  %4 = getelementptr inbounds %class.btMatrix3x3* %3, i32 0, i32 0, !dbg !1647
  %5 = getelementptr inbounds [3 x %class.btVector3]* %4, i32 0, i64 0, !dbg !1647
  %6 = call dereferenceable(4) float* @_ZNK9btVector31xEv(%class.btVector3* %5), !dbg !1647
  %7 = load float* %6, !dbg !1647
  %8 = load %class.btVector3** %2, align 8, !dbg !1648
  %9 = call dereferenceable(4) float* @_ZNK9btVector31xEv(%class.btVector3* %8), !dbg !1648
  %10 = load float* %9, !dbg !1648
  %11 = fmul float %7, %10, !dbg !1647
  %12 = getelementptr inbounds %class.btMatrix3x3* %3, i32 0, i32 0, !dbg !1649
  %13 = getelementptr inbounds [3 x %class.btVector3]* %12, i32 0, i64 1, !dbg !1649
  %14 = call dereferenceable(4) float* @_ZNK9btVector31xEv(%class.btVector3* %13), !dbg !1649
  %15 = load float* %14, !dbg !1649
  %16 = load %class.btVector3** %2, align 8, !dbg !1650
  %17 = call dereferenceable(4) float* @_ZNK9btVector31yEv(%class.btVector3* %16), !dbg !1650
  %18 = load float* %17, !dbg !1650
  %19 = fmul float %15, %18, !dbg !1649
  %20 = fadd float %11, %19, !dbg !1647
  %21 = getelementptr inbounds %class.btMatrix3x3* %3, i32 0, i32 0, !dbg !1651
  %22 = getelementptr inbounds [3 x %class.btVector3]* %21, i32 0, i64 2, !dbg !1651
  %23 = call dereferenceable(4) float* @_ZNK9btVector31xEv(%class.btVector3* %22), !dbg !1651
  %24 = load float* %23, !dbg !1651
  %25 = load %class.btVector3** %2, align 8, !dbg !1652
  %26 = call dereferenceable(4) float* @_ZNK9btVector31zEv(%class.btVector3* %25), !dbg !1652
  %27 = load float* %26, !dbg !1652
  %28 = fmul float %24, %27, !dbg !1651
  %29 = fadd float %20, %28, !dbg !1647
  ret float %29, !dbg !1653
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr float @_ZNK11btMatrix3x35tdotyERK9btVector3(%class.btMatrix3x3* %this, %class.btVector3* dereferenceable(16) %v) #2 align 2 {
  %1 = alloca %class.btMatrix3x3*, align 8
  %2 = alloca %class.btVector3*, align 8
  store %class.btMatrix3x3* %this, %class.btMatrix3x3** %1, align 8
  call void @llvm.dbg.declare(metadata %class.btMatrix3x3** %1, metadata !1654, metadata !896), !dbg !1655
  store %class.btVector3* %v, %class.btVector3** %2, align 8
  call void @llvm.dbg.declare(metadata %class.btVector3** %2, metadata !1656, metadata !896), !dbg !1657
  %3 = load %class.btMatrix3x3** %1
  %4 = getelementptr inbounds %class.btMatrix3x3* %3, i32 0, i32 0, !dbg !1658
  %5 = getelementptr inbounds [3 x %class.btVector3]* %4, i32 0, i64 0, !dbg !1658
  %6 = call dereferenceable(4) float* @_ZNK9btVector31yEv(%class.btVector3* %5), !dbg !1658
  %7 = load float* %6, !dbg !1658
  %8 = load %class.btVector3** %2, align 8, !dbg !1659
  %9 = call dereferenceable(4) float* @_ZNK9btVector31xEv(%class.btVector3* %8), !dbg !1659
  %10 = load float* %9, !dbg !1659
  %11 = fmul float %7, %10, !dbg !1658
  %12 = getelementptr inbounds %class.btMatrix3x3* %3, i32 0, i32 0, !dbg !1660
  %13 = getelementptr inbounds [3 x %class.btVector3]* %12, i32 0, i64 1, !dbg !1660
  %14 = call dereferenceable(4) float* @_ZNK9btVector31yEv(%class.btVector3* %13), !dbg !1660
  %15 = load float* %14, !dbg !1660
  %16 = load %class.btVector3** %2, align 8, !dbg !1661
  %17 = call dereferenceable(4) float* @_ZNK9btVector31yEv(%class.btVector3* %16), !dbg !1661
  %18 = load float* %17, !dbg !1661
  %19 = fmul float %15, %18, !dbg !1660
  %20 = fadd float %11, %19, !dbg !1658
  %21 = getelementptr inbounds %class.btMatrix3x3* %3, i32 0, i32 0, !dbg !1662
  %22 = getelementptr inbounds [3 x %class.btVector3]* %21, i32 0, i64 2, !dbg !1662
  %23 = call dereferenceable(4) float* @_ZNK9btVector31yEv(%class.btVector3* %22), !dbg !1662
  %24 = load float* %23, !dbg !1662
  %25 = load %class.btVector3** %2, align 8, !dbg !1663
  %26 = call dereferenceable(4) float* @_ZNK9btVector31zEv(%class.btVector3* %25), !dbg !1663
  %27 = load float* %26, !dbg !1663
  %28 = fmul float %24, %27, !dbg !1662
  %29 = fadd float %20, %28, !dbg !1658
  ret float %29, !dbg !1664
}

; Function Attrs: inlinehint uwtable
define linkonce_odr float @_ZNK11btMatrix3x35tdotzERK9btVector3(%class.btMatrix3x3* %this, %class.btVector3* dereferenceable(16) %v) #5 align 2 {
  %1 = alloca %class.btMatrix3x3*, align 8
  %2 = alloca %class.btVector3*, align 8
  store %class.btMatrix3x3* %this, %class.btMatrix3x3** %1, align 8
  call void @llvm.dbg.declare(metadata %class.btMatrix3x3** %1, metadata !1665, metadata !896), !dbg !1666
  store %class.btVector3* %v, %class.btVector3** %2, align 8
  call void @llvm.dbg.declare(metadata %class.btVector3** %2, metadata !1667, metadata !896), !dbg !1668
  %3 = load %class.btMatrix3x3** %1
  %4 = getelementptr inbounds %class.btMatrix3x3* %3, i32 0, i32 0, !dbg !1669
  %5 = getelementptr inbounds [3 x %class.btVector3]* %4, i32 0, i64 0, !dbg !1669
  %6 = call dereferenceable(4) float* @_ZNK9btVector31zEv(%class.btVector3* %5), !dbg !1669
  %7 = load float* %6, !dbg !1669
  %8 = load %class.btVector3** %2, align 8, !dbg !1670
  %9 = call dereferenceable(4) float* @_ZNK9btVector31xEv(%class.btVector3* %8), !dbg !1670
  %10 = load float* %9, !dbg !1670
  %11 = fmul float %7, %10, !dbg !1669
  %12 = getelementptr inbounds %class.btMatrix3x3* %3, i32 0, i32 0, !dbg !1671
  %13 = getelementptr inbounds [3 x %class.btVector3]* %12, i32 0, i64 1, !dbg !1671
  %14 = call dereferenceable(4) float* @_ZNK9btVector31zEv(%class.btVector3* %13), !dbg !1671
  %15 = load float* %14, !dbg !1671
  %16 = load %class.btVector3** %2, align 8, !dbg !1672
  %17 = call dereferenceable(4) float* @_ZNK9btVector31yEv(%class.btVector3* %16), !dbg !1672
  %18 = load float* %17, !dbg !1672
  %19 = fmul float %15, %18, !dbg !1671
  %20 = fadd float %11, %19, !dbg !1669
  %21 = getelementptr inbounds %class.btMatrix3x3* %3, i32 0, i32 0, !dbg !1673
  %22 = getelementptr inbounds [3 x %class.btVector3]* %21, i32 0, i64 2, !dbg !1673
  %23 = call dereferenceable(4) float* @_ZNK9btVector31zEv(%class.btVector3* %22), !dbg !1673
  %24 = load float* %23, !dbg !1673
  %25 = load %class.btVector3** %2, align 8, !dbg !1674
  %26 = call dereferenceable(4) float* @_ZNK9btVector31zEv(%class.btVector3* %25), !dbg !1674
  %27 = load float* %26, !dbg !1674
  %28 = fmul float %24, %27, !dbg !1673
  %29 = fadd float %20, %28, !dbg !1669
  ret float %29, !dbg !1675
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dereferenceable(4) float* @_ZNK9btVector31zEv(%class.btVector3* %this) #2 align 2 {
  %1 = alloca %class.btVector3*, align 8
  store %class.btVector3* %this, %class.btVector3** %1, align 8
  call void @llvm.dbg.declare(metadata %class.btVector3** %1, metadata !1676, metadata !896), !dbg !1677
  %2 = load %class.btVector3** %1
  %3 = getelementptr inbounds %class.btVector3* %2, i32 0, i32 0, !dbg !1678
  %4 = getelementptr inbounds [4 x float]* %3, i32 0, i64 2, !dbg !1678
  ret float* %4, !dbg !1678
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dereferenceable(4) float* @_ZNK9btVector31xEv(%class.btVector3* %this) #2 align 2 {
  %1 = alloca %class.btVector3*, align 8
  store %class.btVector3* %this, %class.btVector3** %1, align 8
  call void @llvm.dbg.declare(metadata %class.btVector3** %1, metadata !1679, metadata !896), !dbg !1680
  %2 = load %class.btVector3** %1
  %3 = getelementptr inbounds %class.btVector3* %2, i32 0, i32 0, !dbg !1681
  %4 = getelementptr inbounds [4 x float]* %3, i32 0, i64 0, !dbg !1681
  ret float* %4, !dbg !1681
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dereferenceable(4) float* @_ZNK9btVector31yEv(%class.btVector3* %this) #2 align 2 {
  %1 = alloca %class.btVector3*, align 8
  store %class.btVector3* %this, %class.btVector3** %1, align 8
  call void @llvm.dbg.declare(metadata %class.btVector3** %1, metadata !1682, metadata !896), !dbg !1683
  %2 = load %class.btVector3** %1
  %3 = getelementptr inbounds %class.btVector3* %2, i32 0, i32 0, !dbg !1684
  %4 = getelementptr inbounds [4 x float]* %3, i32 0, i64 1, !dbg !1684
  ret float* %4, !dbg !1684
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr zeroext i1 @_ZN17btBroadphaseProxy10isConvex2dEi(i32 %proxyType) #2 align 2 {
  %1 = alloca i32, align 4
  store i32 %proxyType, i32* %1, align 4
  call void @llvm.dbg.declare(metadata i32* %1, metadata !1685, metadata !896), !dbg !1687
  %2 = load i32* %1, align 4, !dbg !1688
  %3 = icmp eq i32 %2, 17, !dbg !1688
  br i1 %3, label %7, label %4, !dbg !1689

; <label>:4                                       ; preds = %0
  %5 = load i32* %1, align 4, !dbg !1690
  %6 = icmp eq i32 %5, 18, !dbg !1690
  br label %7, !dbg !1689

; <label>:7                                       ; preds = %4, %0
  %8 = phi i1 [ true, %0 ], [ %6, %4 ]
  ret i1 %8, !dbg !1692
}

; Function Attrs: inlinehint uwtable
define linkonce_odr void @_ZN11btMatrix3x3C2ERKS_(%class.btMatrix3x3* %this, %class.btMatrix3x3* dereferenceable(48) %other) unnamed_addr #5 align 2 {
  %1 = alloca %class.btMatrix3x3*, align 8
  %2 = alloca %class.btMatrix3x3*, align 8
  store %class.btMatrix3x3* %this, %class.btMatrix3x3** %1, align 8
  call void @llvm.dbg.declare(metadata %class.btMatrix3x3** %1, metadata !1695, metadata !896), !dbg !1697
  store %class.btMatrix3x3* %other, %class.btMatrix3x3** %2, align 8
  call void @llvm.dbg.declare(metadata %class.btMatrix3x3** %2, metadata !1698, metadata !896), !dbg !1699
  %3 = load %class.btMatrix3x3** %1
  %4 = getelementptr inbounds %class.btMatrix3x3* %3, i32 0, i32 0, !dbg !1700
  %5 = getelementptr inbounds [3 x %class.btVector3]* %4, i32 0, i32 0, !dbg !1700
  %6 = getelementptr inbounds %class.btVector3* %5, i64 3, !dbg !1700
  br label %7, !dbg !1700

; <label>:7                                       ; preds = %7, %0
  %8 = phi %class.btVector3* [ %5, %0 ], [ %9, %7 ], !dbg !1700
  call void @_ZN9btVector3C2Ev(%class.btVector3* %8), !dbg !1701
  %9 = getelementptr inbounds %class.btVector3* %8, i64 1, !dbg !1701
  %10 = icmp eq %class.btVector3* %9, %6, !dbg !1701
  br i1 %10, label %11, label %7, !dbg !1701

; <label>:11                                      ; preds = %7
  %12 = getelementptr inbounds %class.btMatrix3x3* %3, i32 0, i32 0, !dbg !1704
  %13 = getelementptr inbounds [3 x %class.btVector3]* %12, i32 0, i64 0, !dbg !1704
  %14 = load %class.btMatrix3x3** %2, align 8, !dbg !1704
  %15 = getelementptr inbounds %class.btMatrix3x3* %14, i32 0, i32 0, !dbg !1704
  %16 = getelementptr inbounds [3 x %class.btVector3]* %15, i32 0, i64 0, !dbg !1704
  %17 = bitcast %class.btVector3* %13 to i8*, !dbg !1704
  %18 = bitcast %class.btVector3* %16 to i8*, !dbg !1704
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %17, i8* %18, i64 16, i32 4, i1 false), !dbg !1704
  %19 = getelementptr inbounds %class.btMatrix3x3* %3, i32 0, i32 0, !dbg !1706
  %20 = getelementptr inbounds [3 x %class.btVector3]* %19, i32 0, i64 1, !dbg !1706
  %21 = load %class.btMatrix3x3** %2, align 8, !dbg !1706
  %22 = getelementptr inbounds %class.btMatrix3x3* %21, i32 0, i32 0, !dbg !1706
  %23 = getelementptr inbounds [3 x %class.btVector3]* %22, i32 0, i64 1, !dbg !1706
  %24 = bitcast %class.btVector3* %20 to i8*, !dbg !1706
  %25 = bitcast %class.btVector3* %23 to i8*, !dbg !1706
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %24, i8* %25, i64 16, i32 4, i1 false), !dbg !1706
  %26 = getelementptr inbounds %class.btMatrix3x3* %3, i32 0, i32 0, !dbg !1707
  %27 = getelementptr inbounds [3 x %class.btVector3]* %26, i32 0, i64 2, !dbg !1707
  %28 = load %class.btMatrix3x3** %2, align 8, !dbg !1707
  %29 = getelementptr inbounds %class.btMatrix3x3* %28, i32 0, i32 0, !dbg !1707
  %30 = getelementptr inbounds [3 x %class.btVector3]* %29, i32 0, i64 2, !dbg !1707
  %31 = bitcast %class.btVector3* %27 to i8*, !dbg !1707
  %32 = bitcast %class.btVector3* %30 to i8*, !dbg !1707
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %31, i8* %32, i64 16, i32 4, i1 false), !dbg !1707
  ret void, !dbg !1708
}

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN36btDiscreteCollisionDetectorInterfaceD2Ev(%struct.btDiscreteCollisionDetectorInterface* %this) unnamed_addr #3 align 2 {
  %1 = alloca %struct.btDiscreteCollisionDetectorInterface*, align 8
  store %struct.btDiscreteCollisionDetectorInterface* %this, %struct.btDiscreteCollisionDetectorInterface** %1, align 8
  call void @llvm.dbg.declare(metadata %struct.btDiscreteCollisionDetectorInterface** %1, metadata !1709, metadata !896), !dbg !1710
  %2 = load %struct.btDiscreteCollisionDetectorInterface** %1
  ret void, !dbg !1711
}

; Function Attrs: uwtable
define linkonce_odr void @_ZN36btDiscreteCollisionDetectorInterfaceD0Ev(%struct.btDiscreteCollisionDetectorInterface* %this) unnamed_addr #0 align 2 {
  %1 = alloca %struct.btDiscreteCollisionDetectorInterface*, align 8
  %2 = alloca i8*
  %3 = alloca i32
  store %struct.btDiscreteCollisionDetectorInterface* %this, %struct.btDiscreteCollisionDetectorInterface** %1, align 8
  call void @llvm.dbg.declare(metadata %struct.btDiscreteCollisionDetectorInterface** %1, metadata !1712, metadata !896), !dbg !1713
  %4 = load %struct.btDiscreteCollisionDetectorInterface** %1
  invoke void @_ZN36btDiscreteCollisionDetectorInterfaceD2Ev(%struct.btDiscreteCollisionDetectorInterface* %4)
          to label %5 unwind label %7, !dbg !1714

; <label>:5                                       ; preds = %0
  %6 = bitcast %struct.btDiscreteCollisionDetectorInterface* %4 to i8*, !dbg !1715
  call void @_ZdlPv(i8* %6) #11, !dbg !1715
  ret void, !dbg !1717

; <label>:7                                       ; preds = %0
  %8 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup, !dbg !1718
  %9 = extractvalue { i8*, i32 } %8, 0, !dbg !1718
  store i8* %9, i8** %2, !dbg !1718
  %10 = extractvalue { i8*, i32 } %8, 1, !dbg !1718
  store i32 %10, i32* %3, !dbg !1718
  %11 = bitcast %struct.btDiscreteCollisionDetectorInterface* %4 to i8*, !dbg !1718
  call void @_ZdlPv(i8* %11) #11, !dbg !1718
  br label %12, !dbg !1718

; <label>:12                                      ; preds = %7
  %13 = load i8** %2, !dbg !1720
  %14 = load i32* %3, !dbg !1720
  %15 = insertvalue { i8*, i32 } undef, i8* %13, 0, !dbg !1720
  %16 = insertvalue { i8*, i32 } %15, i32 %14, 1, !dbg !1720
  resume { i8*, i32 } %16, !dbg !1720
}

declare void @__cxa_pure_virtual()

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
!909 = !MDLocation(line: 43, column: 26, scope: !819)
!910 = !MDLocation(line: 44, column: 1, scope: !819)
!911 = !MDLocation(line: 44, column: 17, scope: !819)
!912 = !MDLocation(line: 45, column: 1, scope: !819)
!913 = !MDLocation(line: 45, column: 14, scope: !819)
!914 = !MDLocation(line: 46, column: 1, scope: !819)
!915 = !MDLocation(line: 46, column: 14, scope: !819)
!916 = !MDLocation(line: 47, column: 1, scope: !819)
!917 = !MDLocation(line: 47, column: 14, scope: !819)
!918 = !MDLocation(line: 47, column: 1, scope: !919)
!919 = !{!"0xb\001", !1, !819}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!920 = !MDLocation(line: 48, column: 1, scope: !819)
!921 = !MDLocation(line: 48, column: 14, scope: !819)
!922 = !MDLocation(line: 48, column: 1, scope: !919)
!923 = !MDLocation(line: 49, column: 1, scope: !819)
!924 = !MDLocation(line: 49, column: 11, scope: !819)
!925 = !MDLocation(line: 49, column: 1, scope: !919)
!926 = !MDLocation(line: 50, column: 1, scope: !819)
!927 = !MDLocation(line: 50, column: 11, scope: !819)
!928 = !MDLocation(line: 50, column: 1, scope: !919)
!929 = !MDLocation(line: 51, column: 1, scope: !819)
!930 = !MDLocation(line: 52, column: 1, scope: !819)
!931 = !MDLocation(line: 53, column: 1, scope: !819)
!932 = !MDLocation(line: 55, column: 1, scope: !819)
!933 = !MDLocation(line: 55, column: 1, scope: !919)
!934 = !MDLocation(line: 55, column: 1, scope: !935)
!935 = !{!"0xb\003", !1, !819}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!936 = !MDLocation(line: 55, column: 1, scope: !937)
!937 = !{!"0xb\002", !1, !819}                    ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!938 = !{!"0x101\00this\0016777216\001088", !884, null, !939} ; [ DW_TAG_arg_variable ] [this] [line 0]
!939 = !{!"0xf\00\000\0064\0064\000\000", null, null, !"_ZTS36btDiscreteCollisionDetectorInterface"} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _ZTS36btDiscreteCollisionDetectorInterface]
!940 = !MDLocation(line: 0, scope: !884)
!941 = !MDLocation(line: 29, column: 8, scope: !884)
!942 = !{!"0x101\00this\0016777216\001088", !883, null, !205} ; [ DW_TAG_arg_variable ] [this] [line 0]
!943 = !MDLocation(line: 0, scope: !883)
!944 = !{!"0x101\00_x\0033554558\000", !883, !840, !369} ; [ DW_TAG_arg_variable ] [_x] [line 126]
!945 = !MDLocation(line: 126, column: 46, scope: !883)
!946 = !{!"0x101\00_y\0050331774\000", !883, !840, !369} ; [ DW_TAG_arg_variable ] [_y] [line 126]
!947 = !MDLocation(line: 126, column: 66, scope: !883)
!948 = !{!"0x101\00_z\0067108990\000", !883, !840, !369} ; [ DW_TAG_arg_variable ] [_z] [line 126]
!949 = !MDLocation(line: 126, column: 86, scope: !883)
!950 = !MDLocation(line: 128, column: 17, scope: !951)
!951 = !{!"0xb\00127\002\0063", !464, !883}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/../../LinearMath/btVector3.h]
!952 = !MDLocation(line: 128, column: 3, scope: !951)
!953 = !MDLocation(line: 129, column: 17, scope: !951)
!954 = !MDLocation(line: 129, column: 3, scope: !951)
!955 = !MDLocation(line: 130, column: 17, scope: !951)
!956 = !MDLocation(line: 130, column: 3, scope: !951)
!957 = !MDLocation(line: 131, column: 3, scope: !951)
!958 = !MDLocation(line: 132, column: 2, scope: !883)
!959 = !{!"0x101\00this\0016777216\001088", !879, null, !960} ; [ DW_TAG_arg_variable ] [this] [line 0]
!960 = !{!"0xf\00\000\0064\0064\000\000", null, null, !866} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!961 = !MDLocation(line: 0, scope: !879)
!962 = !MDLocation(line: 111, column: 37, scope: !879)
!963 = !MDLocation(line: 111, column: 30, scope: !879)
!964 = !{!"0x101\00this\0016777216\001088", !821, null, !895} ; [ DW_TAG_arg_variable ] [this] [line 0]
!965 = !MDLocation(line: 0, scope: !821)
!966 = !{!"0x101\00objectA\0033554488\000", !821, !889, !54} ; [ DW_TAG_arg_variable ] [objectA] [line 56]
!967 = !MDLocation(line: 56, column: 59, scope: !821)
!968 = !{!"0x101\00objectB\0050331704\000", !821, !889, !54} ; [ DW_TAG_arg_variable ] [objectB] [line 56]
!969 = !MDLocation(line: 56, column: 88, scope: !821)
!970 = !{!"0x101\00shapeTypeA\0067108920\000", !821, !889, !58} ; [ DW_TAG_arg_variable ] [shapeTypeA] [line 56]
!971 = !MDLocation(line: 56, column: 100, scope: !821)
!972 = !{!"0x101\00shapeTypeB\0083886136\000", !821, !889, !58} ; [ DW_TAG_arg_variable ] [shapeTypeB] [line 56]
!973 = !MDLocation(line: 56, column: 115, scope: !821)
!974 = !{!"0x101\00marginA\00100663352\000", !821, !889, !61} ; [ DW_TAG_arg_variable ] [marginA] [line 56]
!975 = !MDLocation(line: 56, column: 135, scope: !821)
!976 = !{!"0x101\00marginB\00117440568\000", !821, !889, !61} ; [ DW_TAG_arg_variable ] [marginB] [line 56]
!977 = !MDLocation(line: 56, column: 153, scope: !821)
!978 = !{!"0x101\00simplexSolver\00134217784\000", !821, !889, !52} ; [ DW_TAG_arg_variable ] [simplexSolver] [line 56]
!979 = !MDLocation(line: 56, column: 188, scope: !821)
!980 = !{!"0x101\00penetrationDepthSolver\00150995000\000", !821, !889, !50} ; [ DW_TAG_arg_variable ] [penetrationDepthSolver] [line 56]
!981 = !MDLocation(line: 56, column: 234, scope: !821)
!982 = !MDLocation(line: 69, column: 1, scope: !821)
!983 = !MDLocation(line: 57, column: 2, scope: !821)
!984 = !MDLocation(line: 58, column: 1, scope: !821)
!985 = !MDLocation(line: 58, column: 26, scope: !821)
!986 = !MDLocation(line: 59, column: 1, scope: !821)
!987 = !MDLocation(line: 59, column: 17, scope: !821)
!988 = !MDLocation(line: 60, column: 1, scope: !821)
!989 = !MDLocation(line: 60, column: 14, scope: !821)
!990 = !MDLocation(line: 61, column: 1, scope: !821)
!991 = !MDLocation(line: 61, column: 14, scope: !821)
!992 = !MDLocation(line: 62, column: 1, scope: !821)
!993 = !MDLocation(line: 62, column: 14, scope: !821)
!994 = !MDLocation(line: 63, column: 1, scope: !821)
!995 = !MDLocation(line: 63, column: 14, scope: !821)
!996 = !MDLocation(line: 64, column: 1, scope: !821)
!997 = !MDLocation(line: 64, column: 11, scope: !821)
!998 = !MDLocation(line: 65, column: 1, scope: !821)
!999 = !MDLocation(line: 65, column: 11, scope: !821)
!1000 = !MDLocation(line: 66, column: 1, scope: !821)
!1001 = !MDLocation(line: 67, column: 1, scope: !821)
!1002 = !MDLocation(line: 68, column: 1, scope: !821)
!1003 = !MDLocation(line: 70, column: 1, scope: !821)
!1004 = !MDLocation(line: 70, column: 1, scope: !1005)
!1005 = !{!"0xb\001", !1, !821}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1006 = !MDLocation(line: 70, column: 1, scope: !1007)
!1007 = !{!"0xb\003", !1, !821}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1008 = !MDLocation(line: 70, column: 1, scope: !1009)
!1009 = !{!"0xb\002", !1, !821}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1010 = !{!"0x101\00this\0016777216\001088", !822, null, !895} ; [ DW_TAG_arg_variable ] [this] [line 0]
!1011 = !MDLocation(line: 0, scope: !822)
!1012 = !{!"0x101\00input\0033554504\000", !822, !889, !85} ; [ DW_TAG_arg_variable ] [input] [line 72]
!1013 = !MDLocation(line: 72, column: 67, scope: !822)
!1014 = !{!"0x101\00output\0050331720\000", !822, !889, !87} ; [ DW_TAG_arg_variable ] [output] [line 72]
!1015 = !MDLocation(line: 72, column: 81, scope: !822)
!1016 = !{!"0x101\00debugDraw\0067108936\000", !822, !889, !88} ; [ DW_TAG_arg_variable ] [debugDraw] [line 72]
!1017 = !MDLocation(line: 72, column: 108, scope: !822)
!1018 = !{!"0x101\00swapResults\0083886152\000", !822, !889, !66} ; [ DW_TAG_arg_variable ] [swapResults] [line 72]
!1019 = !MDLocation(line: 72, column: 123, scope: !822)
!1020 = !MDLocation(line: 76, column: 2, scope: !822)
!1021 = !MDLocation(line: 76, column: 42, scope: !822)
!1022 = !MDLocation(line: 77, column: 1, scope: !822)
!1023 = !{!"0x101\00this\0016777216\001088", !823, null, !895} ; [ DW_TAG_arg_variable ] [this] [line 0]
!1024 = !MDLocation(line: 0, scope: !823)
!1025 = !{!"0x101\00input\0033554514\000", !823, !889, !85} ; [ DW_TAG_arg_variable ] [input] [line 82]
!1026 = !MDLocation(line: 82, column: 77, scope: !823)
!1027 = !{!"0x101\00output\0050331730\000", !823, !889, !87} ; [ DW_TAG_arg_variable ] [output] [line 82]
!1028 = !MDLocation(line: 82, column: 91, scope: !823)
!1029 = !{!"0x101\00debugDraw\0067108946\000", !823, !889, !88} ; [ DW_TAG_arg_variable ] [debugDraw] [line 82]
!1030 = !MDLocation(line: 82, column: 118, scope: !823)
!1031 = !MDLocation(line: 85, column: 2, scope: !823)
!1032 = !{!"0x100\00distance\0087\000", !823, !889, !61} ; [ DW_TAG_auto_variable ] [distance] [line 87]
!1033 = !MDLocation(line: 87, column: 11, scope: !823)
!1034 = !{!"0x100\00normalInB\0088\000", !823, !889, !"_ZTS9btVector3"} ; [ DW_TAG_auto_variable ] [normalInB] [line 88]
!1035 = !MDLocation(line: 88, column: 12, scope: !823)
!1036 = !{!"0x100\00pointOnA\0089\000", !823, !889, !"_ZTS9btVector3"} ; [ DW_TAG_auto_variable ] [pointOnA] [line 89]
!1037 = !MDLocation(line: 89, column: 12, scope: !823)
!1038 = !{!"0x100\00pointOnB\0089\000", !823, !889, !"_ZTS9btVector3"} ; [ DW_TAG_auto_variable ] [pointOnB] [line 89]
!1039 = !MDLocation(line: 89, column: 21, scope: !823)
!1040 = !{!"0x100\00localTransA\0090\000", !823, !889, !"_ZTS11btTransform"} ; [ DW_TAG_auto_variable ] [localTransA] [line 90]
!1041 = !MDLocation(line: 90, column: 14, scope: !823)
!1042 = !{!"0x100\00localTransB\0091\000", !823, !889, !"_ZTS11btTransform"} ; [ DW_TAG_auto_variable ] [localTransB] [line 91]
!1043 = !MDLocation(line: 91, column: 14, scope: !823)
!1044 = !{!"0x100\00positionOffset\0092\000", !823, !889, !"_ZTS9btVector3"} ; [ DW_TAG_auto_variable ] [positionOffset] [line 92]
!1045 = !MDLocation(line: 92, column: 12, scope: !823)
!1046 = !MDLocation(line: 92, column: 30, scope: !823)
!1047 = !MDLocation(line: 92, column: 56, scope: !823)
!1048 = !MDLocation(line: 92, column: 54, scope: !823)
!1049 = !MDLocation(line: 92, column: 81, scope: !823)
!1050 = !MDLocation(line: 93, column: 2, scope: !823)
!1051 = !MDLocation(line: 94, column: 2, scope: !823)
!1052 = !{!"0x100\00check2d\0096\000", !823, !889, !66} ; [ DW_TAG_auto_variable ] [check2d] [line 96]
!1053 = !MDLocation(line: 96, column: 7, scope: !823)
!1054 = !MDLocation(line: 96, column: 17, scope: !823)
!1055 = !MDLocation(line: 96, column: 47, scope: !1056)
!1056 = !{!"0xb\001", !1, !823}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1057 = !MDLocation(line: 96, column: 7, scope: !1058)
!1058 = !{!"0xb\002", !1, !823}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1059 = !{!"0x100\00marginA\0098\000", !823, !889, !61} ; [ DW_TAG_auto_variable ] [marginA] [line 98]
!1060 = !MDLocation(line: 98, column: 11, scope: !823)
!1061 = !MDLocation(line: 98, column: 21, scope: !823)
!1062 = !{!"0x100\00marginB\0099\000", !823, !889, !61} ; [ DW_TAG_auto_variable ] [marginB] [line 99]
!1063 = !MDLocation(line: 99, column: 11, scope: !823)
!1064 = !MDLocation(line: 99, column: 21, scope: !823)
!1065 = !MDLocation(line: 101, column: 2, scope: !823)
!1066 = !MDLocation(line: 107, column: 6, scope: !1067)
!1067 = !{!"0xb\00107\006\002", !1, !823}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1068 = !MDLocation(line: 107, column: 6, scope: !823)
!1069 = !MDLocation(line: 109, column: 3, scope: !1070)
!1070 = !{!"0xb\00108\002\003", !1, !1067}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1071 = !MDLocation(line: 110, column: 3, scope: !1070)
!1072 = !MDLocation(line: 114, column: 2, scope: !1070)
!1073 = !MDLocation(line: 116, column: 2, scope: !823)
!1074 = !{!"0x100\00gGjkMaxIter\00117\000", !823, !889, !58} ; [ DW_TAG_auto_variable ] [gGjkMaxIter] [line 117]
!1075 = !MDLocation(line: 117, column: 6, scope: !823)
!1076 = !MDLocation(line: 118, column: 2, scope: !823)
!1077 = !{!"0x100\00isValid\00120\000", !823, !889, !66} ; [ DW_TAG_auto_variable ] [isValid] [line 120]
!1078 = !MDLocation(line: 120, column: 7, scope: !823)
!1079 = !{!"0x100\00checkSimplex\00121\000", !823, !889, !66} ; [ DW_TAG_auto_variable ] [checkSimplex] [line 121]
!1080 = !MDLocation(line: 121, column: 7, scope: !823)
!1081 = !{!"0x100\00checkPenetration\00122\000", !823, !889, !66} ; [ DW_TAG_auto_variable ] [checkPenetration] [line 122]
!1082 = !MDLocation(line: 122, column: 7, scope: !823)
!1083 = !MDLocation(line: 123, column: 2, scope: !823)
!1084 = !MDLocation(line: 125, column: 2, scope: !823)
!1085 = !{!"0x100\00squaredDistance\00128\000", !1086, !889, !61} ; [ DW_TAG_auto_variable ] [squaredDistance] [line 128]
!1086 = !{!"0xb\00127\002\004", !1, !823}         ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1087 = !MDLocation(line: 128, column: 12, scope: !1086)
!1088 = !{!"0x100\00delta\00129\000", !1086, !889, !61} ; [ DW_TAG_auto_variable ] [delta] [line 129]
!1089 = !MDLocation(line: 129, column: 12, scope: !1086)
!1090 = !{!"0x100\00margin\00131\000", !1086, !889, !61} ; [ DW_TAG_auto_variable ] [margin] [line 131]
!1091 = !MDLocation(line: 131, column: 12, scope: !1086)
!1092 = !MDLocation(line: 131, column: 21, scope: !1086)
!1093 = !MDLocation(line: 131, column: 31, scope: !1086)
!1094 = !MDLocation(line: 135, column: 3, scope: !1086)
!1095 = !MDLocation(line: 137, column: 3, scope: !1086)
!1096 = !{!"0x100\00seperatingAxisInA\00141\000", !1097, !889, !"_ZTS9btVector3"} ; [ DW_TAG_auto_variable ] [seperatingAxisInA] [line 141]
!1097 = !{!"0xb\00139\003\007", !1, !1098}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1098 = !{!"0xb\00137\003\006", !1, !1099}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1099 = !{!"0xb\00137\003\005", !1, !1086}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1100 = !MDLocation(line: 141, column: 14, scope: !1097)
!1101 = !MDLocation(line: 141, column: 35, scope: !1097)
!1102 = !MDLocation(line: 141, column: 61, scope: !1097)
!1103 = !MDLocation(line: 141, column: 59, scope: !1097)
!1104 = !{!"0x100\00seperatingAxisInB\00142\000", !1097, !889, !"_ZTS9btVector3"} ; [ DW_TAG_auto_variable ] [seperatingAxisInB] [line 142]
!1105 = !MDLocation(line: 142, column: 14, scope: !1097)
!1106 = !MDLocation(line: 142, column: 34, scope: !1097)
!1107 = !MDLocation(line: 142, column: 58, scope: !1097)
!1108 = !MDLocation(line: 142, column: 56, scope: !1097)
!1109 = !{!"0x100\00pInA\00146\000", !1097, !889, !"_ZTS9btVector3"} ; [ DW_TAG_auto_variable ] [pInA] [line 146]
!1110 = !MDLocation(line: 146, column: 14, scope: !1097)
!1111 = !MDLocation(line: 146, column: 21, scope: !1097)
!1112 = !{!"0x100\00qInB\00147\000", !1097, !889, !"_ZTS9btVector3"} ; [ DW_TAG_auto_variable ] [qInB] [line 147]
!1113 = !MDLocation(line: 147, column: 14, scope: !1097)
!1114 = !MDLocation(line: 147, column: 21, scope: !1097)
!1115 = !{!"0x100\00pWorld\00169\000", !1097, !889, !"_ZTS9btVector3"} ; [ DW_TAG_auto_variable ] [pWorld] [line 169]
!1116 = !MDLocation(line: 169, column: 15, scope: !1097)
!1117 = !MDLocation(line: 169, column: 24, scope: !1097)
!1118 = !{!"0x100\00qWorld\00170\000", !1097, !889, !"_ZTS9btVector3"} ; [ DW_TAG_auto_variable ] [qWorld] [line 170]
!1119 = !MDLocation(line: 170, column: 15, scope: !1097)
!1120 = !MDLocation(line: 170, column: 24, scope: !1097)
!1121 = !MDLocation(line: 176, column: 8, scope: !1122)
!1122 = !{!"0xb\00176\008\008", !1, !1097}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1123 = !MDLocation(line: 176, column: 8, scope: !1097)
!1124 = !MDLocation(line: 178, column: 5, scope: !1125)
!1125 = !{!"0xb\00177\004\009", !1, !1122}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1126 = !MDLocation(line: 179, column: 5, scope: !1125)
!1127 = !MDLocation(line: 180, column: 4, scope: !1125)
!1128 = !{!"0x100\00w\00182\000", !1097, !889, !"_ZTS9btVector3"} ; [ DW_TAG_auto_variable ] [w] [line 182]
!1129 = !MDLocation(line: 182, column: 14, scope: !1097)
!1130 = !MDLocation(line: 182, column: 25, scope: !1097)
!1131 = !MDLocation(line: 183, column: 12, scope: !1097)
!1132 = !MDLocation(line: 183, column: 4, scope: !1097)
!1133 = !MDLocation(line: 186, column: 9, scope: !1134)
!1134 = !{!"0xb\00186\008\0010", !1, !1097}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1135 = !MDLocation(line: 186, column: 8, scope: !1097)
!1136 = !MDLocation(line: 186, column: 36, scope: !1137)
!1137 = !{!"0xb\001", !1, !1134}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1138 = !MDLocation(line: 186, column: 44, scope: !1134)
!1139 = !MDLocation(line: 186, column: 36, scope: !1134)
!1140 = !MDLocation(line: 186, column: 52, scope: !1134)
!1141 = !MDLocation(line: 186, column: 70, scope: !1134)
!1142 = !MDLocation(line: 188, column: 5, scope: !1143)
!1143 = !{!"0xb\00187\004\0011", !1, !1134}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1144 = !MDLocation(line: 189, column: 5, scope: !1143)
!1145 = !MDLocation(line: 191, column: 5, scope: !1143)
!1146 = !MDLocation(line: 195, column: 8, scope: !1147)
!1147 = !{!"0xb\00195\008\0012", !1, !1097}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1148 = !MDLocation(line: 195, column: 8, scope: !1097)
!1149 = !MDLocation(line: 197, column: 5, scope: !1150)
!1150 = !{!"0xb\00196\004\0013", !1, !1147}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1151 = !MDLocation(line: 198, column: 5, scope: !1150)
!1152 = !MDLocation(line: 199, column: 5, scope: !1150)
!1153 = !{!"0x100\00f0\00202\000", !1097, !889, !61} ; [ DW_TAG_auto_variable ] [f0] [line 202]
!1154 = !MDLocation(line: 202, column: 13, scope: !1097)
!1155 = !MDLocation(line: 202, column: 18, scope: !1097)
!1156 = !MDLocation(line: 202, column: 36, scope: !1097)
!1157 = !{!"0x100\00f1\00203\000", !1097, !889, !61} ; [ DW_TAG_auto_variable ] [f1] [line 203]
!1158 = !MDLocation(line: 203, column: 13, scope: !1097)
!1159 = !MDLocation(line: 203, column: 18, scope: !1097)
!1160 = !MDLocation(line: 205, column: 8, scope: !1161)
!1161 = !{!"0xb\00205\008\0014", !1, !1097}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1162 = !MDLocation(line: 205, column: 14, scope: !1161)
!1163 = !MDLocation(line: 205, column: 8, scope: !1097)
!1164 = !MDLocation(line: 207, column: 9, scope: !1165)
!1165 = !{!"0xb\00207\009\0016", !1, !1166}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1166 = !{!"0xb\00206\004\0015", !1, !1161}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1167 = !MDLocation(line: 207, column: 9, scope: !1166)
!1168 = !MDLocation(line: 209, column: 6, scope: !1169)
!1169 = !{!"0xb\00208\005\0017", !1, !1165}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1170 = !MDLocation(line: 210, column: 5, scope: !1169)
!1171 = !MDLocation(line: 212, column: 6, scope: !1172)
!1172 = !{!"0xb\00211\005\0018", !1, !1165}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1173 = !MDLocation(line: 214, column: 5, scope: !1166)
!1174 = !MDLocation(line: 215, column: 5, scope: !1166)
!1175 = !MDLocation(line: 222, column: 4, scope: !1097)
!1176 = !{!"0x100\00newCachedSeparatingAxis\00226\000", !1097, !889, !"_ZTS9btVector3"} ; [ DW_TAG_auto_variable ] [newCachedSeparatingAxis] [line 226]
!1177 = !MDLocation(line: 226, column: 14, scope: !1097)
!1178 = !MDLocation(line: 229, column: 9, scope: !1179)
!1179 = !{!"0xb\00229\008\0019", !1, !1097}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1180 = !MDLocation(line: 229, column: 8, scope: !1097)
!1181 = !MDLocation(line: 231, column: 5, scope: !1182)
!1182 = !{!"0xb\00230\004\0020", !1, !1179}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1183 = !MDLocation(line: 232, column: 5, scope: !1182)
!1184 = !MDLocation(line: 233, column: 5, scope: !1182)
!1185 = !MDLocation(line: 236, column: 7, scope: !1186)
!1186 = !{!"0xb\00236\007\0021", !1, !1097}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1187 = !MDLocation(line: 236, column: 7, scope: !1097)
!1188 = !MDLocation(line: 238, column: 5, scope: !1189)
!1189 = !{!"0xb\00237\0013\0022", !1, !1186}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1190 = !MDLocation(line: 239, column: 17, scope: !1189)
!1191 = !MDLocation(line: 240, column: 17, scope: !1189)
!1192 = !MDLocation(line: 241, column: 17, scope: !1189)
!1193 = !{!"0x100\00previousSquaredDistance\00244\000", !1097, !889, !61} ; [ DW_TAG_auto_variable ] [previousSquaredDistance] [line 244]
!1194 = !MDLocation(line: 244, column: 13, scope: !1097)
!1195 = !MDLocation(line: 244, column: 39, scope: !1097)
!1196 = !MDLocation(line: 245, column: 22, scope: !1097)
!1197 = !MDLocation(line: 245, column: 4, scope: !1097)
!1198 = !MDLocation(line: 261, column: 8, scope: !1199)
!1199 = !{!"0xb\00261\008\0023", !1, !1097}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1200 = !MDLocation(line: 261, column: 34, scope: !1199)
!1201 = !MDLocation(line: 261, column: 68, scope: !1199)
!1202 = !MDLocation(line: 261, column: 53, scope: !1199)
!1203 = !MDLocation(line: 261, column: 8, scope: !1097)
!1204 = !MDLocation(line: 264, column: 5, scope: !1205)
!1205 = !{!"0xb\00262\004\0024", !1, !1199}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1206 = !MDLocation(line: 265, column: 5, scope: !1205)
!1207 = !MDLocation(line: 267, column: 5, scope: !1205)
!1208 = !MDLocation(line: 270, column: 4, scope: !1097)
!1209 = !MDLocation(line: 273, column: 19, scope: !1210)
!1210 = !{!"0xb\00273\0019\0025", !1, !1097}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1211 = !MDLocation(line: 273, column: 33, scope: !1210)
!1212 = !MDLocation(line: 273, column: 19, scope: !1097)
!1213 = !MDLocation(line: 287, column: 23, scope: !1214)
!1214 = !{!"0xb\00274\0015\0026", !1, !1210}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1215 = !{!"0x100\00check\00292\000", !1097, !889, !66} ; [ DW_TAG_auto_variable ] [check] [line 292]
!1216 = !MDLocation(line: 292, column: 9, scope: !1097)
!1217 = !MDLocation(line: 292, column: 19, scope: !1097)
!1218 = !MDLocation(line: 292, column: 18, scope: !1097)
!1219 = !MDLocation(line: 295, column: 9, scope: !1220)
!1220 = !{!"0xb\00295\008\0027", !1, !1097}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1221 = !MDLocation(line: 295, column: 8, scope: !1097)
!1222 = !MDLocation(line: 299, column: 5, scope: !1223)
!1223 = !{!"0xb\00296\004\0028", !1, !1220}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1224 = !MDLocation(line: 300, column: 5, scope: !1223)
!1225 = !MDLocation(line: 137, column: 3, scope: !1098)
!1226 = !MDLocation(line: 304, column: 7, scope: !1227)
!1227 = !{!"0xb\00304\007\0029", !1, !1086}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1228 = !MDLocation(line: 304, column: 7, scope: !1086)
!1229 = !MDLocation(line: 306, column: 4, scope: !1230)
!1230 = !{!"0xb\00305\003\0030", !1, !1227}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1231 = !MDLocation(line: 307, column: 4, scope: !1230)
!1232 = !{!"0x100\00lenSqr\00308\000", !1230, !889, !61} ; [ DW_TAG_auto_variable ] [lenSqr] [line 308]
!1233 = !MDLocation(line: 308, column: 13, scope: !1230)
!1234 = !MDLocation(line: 308, column: 21, scope: !1230)
!1235 = !MDLocation(line: 311, column: 8, scope: !1236)
!1236 = !{!"0xb\00311\008\0031", !1, !1230}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1237 = !MDLocation(line: 311, column: 8, scope: !1230)
!1238 = !MDLocation(line: 313, column: 5, scope: !1239)
!1239 = !{!"0xb\00312\004\0032", !1, !1236}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1240 = !MDLocation(line: 314, column: 4, scope: !1239)
!1241 = !MDLocation(line: 315, column: 8, scope: !1242)
!1242 = !{!"0xb\00315\008\0033", !1, !1230}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1243 = !MDLocation(line: 315, column: 8, scope: !1230)
!1244 = !{!"0x100\00rlen\00317\000", !1245, !889, !61} ; [ DW_TAG_auto_variable ] [rlen] [line 317]
!1245 = !{!"0xb\00316\004\0034", !1, !1242}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1246 = !MDLocation(line: 317, column: 14, scope: !1245)
!1247 = !MDLocation(line: 317, column: 43, scope: !1245)
!1248 = !MDLocation(line: 317, column: 36, scope: !1245)
!1249 = !MDLocation(line: 317, column: 21, scope: !1245)
!1250 = !MDLocation(line: 318, column: 5, scope: !1245)
!1251 = !{!"0x100\00s\00319\000", !1245, !889, !61} ; [ DW_TAG_auto_variable ] [s] [line 319]
!1252 = !MDLocation(line: 319, column: 14, scope: !1245)
!1253 = !MDLocation(line: 319, column: 25, scope: !1245)
!1254 = !MDLocation(line: 319, column: 18, scope: !1245)
!1255 = !MDLocation(line: 322, column: 17, scope: !1245)
!1256 = !MDLocation(line: 322, column: 43, scope: !1245)
!1257 = !MDLocation(line: 322, column: 53, scope: !1245)
!1258 = !MDLocation(line: 322, column: 40, scope: !1245)
!1259 = !MDLocation(line: 322, column: 5, scope: !1245)
!1260 = !MDLocation(line: 323, column: 17, scope: !1245)
!1261 = !MDLocation(line: 323, column: 43, scope: !1245)
!1262 = !MDLocation(line: 323, column: 53, scope: !1245)
!1263 = !MDLocation(line: 323, column: 40, scope: !1245)
!1264 = !MDLocation(line: 323, column: 5, scope: !1245)
!1265 = !MDLocation(line: 324, column: 31, scope: !1245)
!1266 = !MDLocation(line: 324, column: 18, scope: !1245)
!1267 = !MDLocation(line: 324, column: 39, scope: !1245)
!1268 = !MDLocation(line: 324, column: 17, scope: !1245)
!1269 = !MDLocation(line: 324, column: 5, scope: !1245)
!1270 = !MDLocation(line: 325, column: 5, scope: !1245)
!1271 = !MDLocation(line: 327, column: 5, scope: !1245)
!1272 = !MDLocation(line: 328, column: 4, scope: !1245)
!1273 = !MDLocation(line: 330, column: 5, scope: !1274)
!1274 = !{!"0xb\00329\004\0035", !1, !1242}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1275 = !MDLocation(line: 332, column: 3, scope: !1230)
!1276 = !{!"0x100\00catchDegeneratePenetrationCase\00334\000", !1086, !889, !66} ; [ DW_TAG_auto_variable ] [catchDegeneratePenetrationCase] [line 334]
!1277 = !MDLocation(line: 334, column: 8, scope: !1086)
!1278 = !MDLocation(line: 335, column: 5, scope: !1086)
!1279 = !MDLocation(line: 335, column: 28, scope: !1280)
!1280 = !{!"0xb\001", !1, !1086}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1281 = !MDLocation(line: 335, column: 56, scope: !1282)
!1282 = !{!"0xb\002", !1, !1086}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1283 = !MDLocation(line: 335, column: 81, scope: !1284)
!1284 = !{!"0xb\003", !1, !1086}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1285 = !MDLocation(line: 335, column: 90, scope: !1086)
!1286 = !MDLocation(line: 335, column: 81, scope: !1086)
!1287 = !MDLocation(line: 335, column: 80, scope: !1086)
!1288 = !MDLocation(line: 338, column: 7, scope: !1289)
!1289 = !{!"0xb\00338\007\0036", !1, !1086}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1290 = !MDLocation(line: 338, column: 7, scope: !1086)
!1291 = !MDLocation(line: 338, column: 29, scope: !1292)
!1292 = !{!"0xb\001", !1, !1289}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1293 = !MDLocation(line: 338, column: 40, scope: !1294)
!1294 = !{!"0xb\002", !1, !1289}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1295 = !MDLocation(line: 343, column: 8, scope: !1296)
!1296 = !{!"0xb\00343\008\0038", !1, !1297}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1297 = !{!"0xb\00339\003\0037", !1, !1289}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1298 = !MDLocation(line: 343, column: 8, scope: !1297)
!1299 = !{!"0x100\00tmpPointOnA\00346\000", !1300, !889, !"_ZTS9btVector3"} ; [ DW_TAG_auto_variable ] [tmpPointOnA] [line 346]
!1300 = !{!"0xb\00344\004\0039", !1, !1296}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1301 = !MDLocation(line: 346, column: 15, scope: !1300)
!1302 = !{!"0x100\00tmpPointOnB\00346\000", !1300, !889, !"_ZTS9btVector3"} ; [ DW_TAG_auto_variable ] [tmpPointOnB] [line 346]
!1303 = !MDLocation(line: 346, column: 27, scope: !1300)
!1304 = !MDLocation(line: 348, column: 5, scope: !1300)
!1305 = !MDLocation(line: 349, column: 5, scope: !1300)
!1306 = !{!"0x100\00isValid2\00351\000", !1300, !889, !66} ; [ DW_TAG_auto_variable ] [isValid2] [line 351]
!1307 = !MDLocation(line: 351, column: 10, scope: !1300)
!1308 = !MDLocation(line: 351, column: 21, scope: !1300)
!1309 = !MDLocation(line: 352, column: 7, scope: !1300)
!1310 = !MDLocation(line: 353, column: 6, scope: !1300)
!1311 = !MDLocation(line: 353, column: 19, scope: !1300)
!1312 = !MDLocation(line: 356, column: 6, scope: !1300)
!1313 = !MDLocation(line: 356, column: 16, scope: !1300)
!1314 = !MDLocation(line: 360, column: 9, scope: !1315)
!1315 = !{!"0xb\00360\009\0040", !1, !1300}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1316 = !MDLocation(line: 360, column: 9, scope: !1300)
!1317 = !{!"0x100\00tmpNormalInB\00362\000", !1318, !889, !"_ZTS9btVector3"} ; [ DW_TAG_auto_variable ] [tmpNormalInB] [line 362]
!1318 = !{!"0xb\00361\005\0041", !1, !1315}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1319 = !MDLocation(line: 362, column: 16, scope: !1318)
!1320 = !MDLocation(line: 362, column: 42, scope: !1318)
!1321 = !{!"0x100\00lenSqr\00363\000", !1318, !889, !61} ; [ DW_TAG_auto_variable ] [lenSqr] [line 363]
!1322 = !MDLocation(line: 363, column: 15, scope: !1318)
!1323 = !MDLocation(line: 363, column: 24, scope: !1318)
!1324 = !MDLocation(line: 364, column: 10, scope: !1325)
!1325 = !{!"0xb\00364\0010\0042", !1, !1318}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1326 = !MDLocation(line: 364, column: 10, scope: !1318)
!1327 = !MDLocation(line: 366, column: 7, scope: !1328)
!1328 = !{!"0xb\00365\006\0043", !1, !1325}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1329 = !MDLocation(line: 367, column: 16, scope: !1328)
!1330 = !MDLocation(line: 367, column: 7, scope: !1328)
!1331 = !MDLocation(line: 368, column: 6, scope: !1328)
!1332 = !MDLocation(line: 370, column: 10, scope: !1333)
!1333 = !{!"0xb\00370\0010\0044", !1, !1318}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1334 = !MDLocation(line: 370, column: 10, scope: !1318)
!1335 = !MDLocation(line: 372, column: 30, scope: !1336)
!1336 = !{!"0xb\00371\006\0045", !1, !1333}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1337 = !MDLocation(line: 372, column: 23, scope: !1336)
!1338 = !MDLocation(line: 372, column: 7, scope: !1336)
!1339 = !{!"0x100\00distance2\00373\000", !1336, !889, !61} ; [ DW_TAG_auto_variable ] [distance2] [line 373]
!1340 = !MDLocation(line: 373, column: 16, scope: !1336)
!1341 = !MDLocation(line: 373, column: 41, scope: !1336)
!1342 = !MDLocation(line: 373, column: 29, scope: !1336)
!1343 = !MDLocation(line: 373, column: 28, scope: !1336)
!1344 = !MDLocation(line: 375, column: 12, scope: !1345)
!1345 = !{!"0xb\00375\0011\0046", !1, !1336}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1346 = !MDLocation(line: 375, column: 11, scope: !1336)
!1347 = !MDLocation(line: 375, column: 24, scope: !1348)
!1348 = !{!"0xb\001", !1, !1345}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1349 = !MDLocation(line: 375, column: 36, scope: !1345)
!1350 = !MDLocation(line: 375, column: 24, scope: !1345)
!1351 = !MDLocation(line: 377, column: 19, scope: !1352)
!1352 = !{!"0xb\00376\007\0047", !1, !1345}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1353 = !MDLocation(line: 377, column: 8, scope: !1352)
!1354 = !MDLocation(line: 378, column: 8, scope: !1352)
!1355 = !MDLocation(line: 379, column: 8, scope: !1352)
!1356 = !MDLocation(line: 380, column: 8, scope: !1352)
!1357 = !MDLocation(line: 381, column: 8, scope: !1352)
!1358 = !MDLocation(line: 382, column: 8, scope: !1352)
!1359 = !MDLocation(line: 383, column: 7, scope: !1352)
!1360 = !MDLocation(line: 385, column: 8, scope: !1361)
!1361 = !{!"0xb\00384\007\0048", !1, !1345}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1362 = !MDLocation(line: 387, column: 6, scope: !1336)
!1363 = !MDLocation(line: 389, column: 7, scope: !1364)
!1364 = !{!"0xb\00388\006\0049", !1, !1333}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1365 = !MDLocation(line: 391, column: 5, scope: !1318)
!1366 = !MDLocation(line: 401, column: 10, scope: !1367)
!1367 = !{!"0xb\00401\0010\0051", !1, !1368}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1368 = !{!"0xb\00393\005\0050", !1, !1315}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1369 = !MDLocation(line: 401, column: 10, scope: !1368)
!1370 = !{!"0x100\00distance2\00403\000", !1371, !889, !61} ; [ DW_TAG_auto_variable ] [distance2] [line 403]
!1371 = !{!"0xb\00402\006\0052", !1, !1367}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1372 = !MDLocation(line: 403, column: 16, scope: !1371)
!1373 = !MDLocation(line: 403, column: 40, scope: !1371)
!1374 = !MDLocation(line: 403, column: 28, scope: !1371)
!1375 = !MDLocation(line: 403, column: 63, scope: !1371)
!1376 = !MDLocation(line: 405, column: 12, scope: !1377)
!1377 = !{!"0xb\00405\0011\0053", !1, !1371}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1378 = !MDLocation(line: 405, column: 11, scope: !1371)
!1379 = !MDLocation(line: 405, column: 24, scope: !1380)
!1380 = !{!"0xb\001", !1, !1377}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1381 = !MDLocation(line: 405, column: 36, scope: !1377)
!1382 = !MDLocation(line: 405, column: 24, scope: !1377)
!1383 = !MDLocation(line: 407, column: 19, scope: !1384)
!1384 = !{!"0xb\00406\007\0054", !1, !1377}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1385 = !MDLocation(line: 407, column: 8, scope: !1384)
!1386 = !MDLocation(line: 408, column: 8, scope: !1384)
!1387 = !MDLocation(line: 409, column: 8, scope: !1384)
!1388 = !MDLocation(line: 410, column: 20, scope: !1384)
!1389 = !MDLocation(line: 410, column: 43, scope: !1384)
!1390 = !MDLocation(line: 410, column: 8, scope: !1384)
!1391 = !MDLocation(line: 411, column: 20, scope: !1384)
!1392 = !MDLocation(line: 411, column: 43, scope: !1384)
!1393 = !MDLocation(line: 411, column: 8, scope: !1384)
!1394 = !MDLocation(line: 412, column: 8, scope: !1384)
!1395 = !MDLocation(line: 413, column: 8, scope: !1384)
!1396 = !MDLocation(line: 414, column: 8, scope: !1384)
!1397 = !MDLocation(line: 415, column: 8, scope: !1384)
!1398 = !MDLocation(line: 416, column: 7, scope: !1384)
!1399 = !MDLocation(line: 418, column: 8, scope: !1400)
!1400 = !{!"0xb\00417\007\0055", !1, !1377}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1401 = !MDLocation(line: 420, column: 6, scope: !1371)
!1402 = !MDLocation(line: 423, column: 4, scope: !1300)
!1403 = !MDLocation(line: 425, column: 3, scope: !1297)
!1404 = !MDLocation(line: 430, column: 6, scope: !1405)
!1405 = !{!"0xb\00430\006\0056", !1, !823}        ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1406 = !MDLocation(line: 430, column: 6, scope: !823)
!1407 = !MDLocation(line: 430, column: 19, scope: !1408)
!1408 = !{!"0xb\001", !1, !1405}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1409 = !MDLocation(line: 430, column: 37, scope: !1410)
!1410 = !{!"0xb\002", !1, !1405}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1411 = !MDLocation(line: 430, column: 46, scope: !1405)
!1412 = !MDLocation(line: 430, column: 37, scope: !1405)
!1413 = !MDLocation(line: 430, column: 57, scope: !1405)
!1414 = !MDLocation(line: 441, column: 3, scope: !1415)
!1415 = !{!"0xb\00431\002\0057", !1, !1405}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp]
!1416 = !MDLocation(line: 442, column: 32, scope: !1415)
!1417 = !MDLocation(line: 442, column: 3, scope: !1415)
!1418 = !MDLocation(line: 444, column: 3, scope: !1415)
!1419 = !MDLocation(line: 446, column: 12, scope: !1415)
!1420 = !MDLocation(line: 447, column: 4, scope: !1415)
!1421 = !MDLocation(line: 449, column: 2, scope: !1415)
!1422 = !MDLocation(line: 452, column: 1, scope: !823)
!1423 = !{!"0x101\00this\0016777216\001088", !877, null, !205} ; [ DW_TAG_arg_variable ] [this] [line 0]
!1424 = !MDLocation(line: 0, scope: !877)
!1425 = !MDLocation(line: 117, column: 2, scope: !877)
!1426 = !{!"0x101\00this\0016777216\001088", !875, null, !1427} ; [ DW_TAG_arg_variable ] [this] [line 0]
!1427 = !{!"0xf\00\000\0064\0064\000\000", null, null, !"_ZTS11btTransform"} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _ZTS11btTransform]
!1428 = !MDLocation(line: 0, scope: !875)
!1429 = !{!"0x101\00other\0033554495\000", !875, !1430, !272} ; [ DW_TAG_arg_variable ] [other] [line 63]
!1430 = !{!"0x29", !251}                          ; [ DW_TAG_file_type ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/../../LinearMath/btTransform.h]
!1431 = !MDLocation(line: 63, column: 52, scope: !875)
!1432 = !MDLocation(line: 64, column: 5, scope: !875)
!1433 = !MDLocation(line: 65, column: 3, scope: !875)
!1434 = !MDLocation(line: 67, column: 2, scope: !875)
!1435 = !{!"0x101\00v\0016778019\000", !872, !840, !99} ; [ DW_TAG_arg_variable ] [v] [line 803]
!1436 = !MDLocation(line: 803, column: 28, scope: !872)
!1437 = !{!"0x101\00s\0033555235\000", !872, !840, !369} ; [ DW_TAG_arg_variable ] [s] [line 803]
!1438 = !MDLocation(line: 803, column: 47, scope: !872)
!1439 = !MDLocation(line: 813, column: 19, scope: !872)
!1440 = !MDLocation(line: 813, column: 35, scope: !872)
!1441 = !MDLocation(line: 813, column: 2, scope: !872)
!1442 = !MDLocation(line: 813, column: 38, scope: !872)
!1443 = !MDLocation(line: 813, column: 54, scope: !872)
!1444 = !MDLocation(line: 813, column: 57, scope: !872)
!1445 = !MDLocation(line: 813, column: 73, scope: !872)
!1446 = !{!"0x101\00v1\0016777953\000", !871, !840, !99} ; [ DW_TAG_arg_variable ] [v1] [line 737]
!1447 = !MDLocation(line: 737, column: 28, scope: !871)
!1448 = !{!"0x101\00v2\0033555169\000", !871, !840, !99} ; [ DW_TAG_arg_variable ] [v2] [line 737]
!1449 = !MDLocation(line: 737, column: 49, scope: !871)
!1450 = !MDLocation(line: 745, column: 4, scope: !871)
!1451 = !MDLocation(line: 745, column: 21, scope: !871)
!1452 = !MDLocation(line: 744, column: 2, scope: !871)
!1453 = !MDLocation(line: 746, column: 4, scope: !871)
!1454 = !MDLocation(line: 746, column: 21, scope: !871)
!1455 = !MDLocation(line: 747, column: 4, scope: !871)
!1456 = !MDLocation(line: 747, column: 21, scope: !871)
!1457 = !{!"0x101\00this\0016777216\001088", !870, null, !1427} ; [ DW_TAG_arg_variable ] [this] [line 0]
!1458 = !MDLocation(line: 0, scope: !870)
!1459 = !MDLocation(line: 117, column: 61, scope: !870)
!1460 = !{!"0x101\00this\0016777216\001088", !869, null, !205} ; [ DW_TAG_arg_variable ] [this] [line 0]
!1461 = !MDLocation(line: 0, scope: !869)
!1462 = !{!"0x101\00v\0033554608\000", !869, !840, !99} ; [ DW_TAG_arg_variable ] [v] [line 176]
!1463 = !MDLocation(line: 176, column: 59, scope: !869)
!1464 = !MDLocation(line: 183, column: 18, scope: !869)
!1465 = !MDLocation(line: 183, column: 3, scope: !869)
!1466 = !MDLocation(line: 184, column: 18, scope: !869)
!1467 = !MDLocation(line: 184, column: 3, scope: !869)
!1468 = !MDLocation(line: 185, column: 18, scope: !869)
!1469 = !MDLocation(line: 185, column: 3, scope: !869)
!1470 = !MDLocation(line: 187, column: 3, scope: !869)
!1471 = !{!"0x101\00this\0016777216\001088", !862, null, !960} ; [ DW_TAG_arg_variable ] [this] [line 0]
!1472 = !MDLocation(line: 0, scope: !862)
!1473 = !MDLocation(line: 69, column: 40, scope: !862)
!1474 = !MDLocation(line: 69, column: 10, scope: !862)
!1475 = !MDLocation(line: 69, column: 3, scope: !862)
!1476 = !{!"0x101\00this\0016777216\001088", !861, null, !205} ; [ DW_TAG_arg_variable ] [this] [line 0]
!1477 = !MDLocation(line: 0, scope: !861)
!1478 = !{!"0x101\00_x\0033555057\000", !861, !840, !369} ; [ DW_TAG_arg_variable ] [_x] [line 625]
!1479 = !MDLocation(line: 625, column: 51, scope: !861)
!1480 = !{!"0x101\00_y\0050332273\000", !861, !840, !369} ; [ DW_TAG_arg_variable ] [_y] [line 625]
!1481 = !MDLocation(line: 625, column: 71, scope: !861)
!1482 = !{!"0x101\00_z\0067109489\000", !861, !840, !369} ; [ DW_TAG_arg_variable ] [_z] [line 625]
!1483 = !MDLocation(line: 625, column: 91, scope: !861)
!1484 = !MDLocation(line: 627, column: 15, scope: !861)
!1485 = !MDLocation(line: 627, column: 3, scope: !861)
!1486 = !MDLocation(line: 628, column: 15, scope: !861)
!1487 = !MDLocation(line: 628, column: 3, scope: !861)
!1488 = !MDLocation(line: 629, column: 15, scope: !861)
!1489 = !MDLocation(line: 629, column: 3, scope: !861)
!1490 = !MDLocation(line: 630, column: 3, scope: !861)
!1491 = !MDLocation(line: 631, column: 2, scope: !861)
!1492 = !{!"0x101\00v\0016778368\000", !851, !852, !99} ; [ DW_TAG_arg_variable ] [v] [line 1152]
!1493 = !MDLocation(line: 1152, column: 28, scope: !851)
!1494 = !{!"0x101\00m\0033555584\000", !851, !852, !267} ; [ DW_TAG_arg_variable ] [m] [line 1152]
!1495 = !MDLocation(line: 1152, column: 50, scope: !851)
!1496 = !MDLocation(line: 1187, column: 19, scope: !851)
!1497 = !MDLocation(line: 1187, column: 2, scope: !851)
!1498 = !MDLocation(line: 1187, column: 31, scope: !851)
!1499 = !MDLocation(line: 1187, column: 43, scope: !851)
!1500 = !{!"0x101\00v\0016778005\000", !848, !840, !99} ; [ DW_TAG_arg_variable ] [v] [line 789]
!1501 = !MDLocation(line: 789, column: 28, scope: !848)
!1502 = !MDLocation(line: 797, column: 20, scope: !848)
!1503 = !MDLocation(line: 797, column: 19, scope: !848)
!1504 = !MDLocation(line: 797, column: 2, scope: !848)
!1505 = !MDLocation(line: 797, column: 36, scope: !848)
!1506 = !MDLocation(line: 797, column: 35, scope: !848)
!1507 = !MDLocation(line: 797, column: 52, scope: !848)
!1508 = !MDLocation(line: 797, column: 51, scope: !848)
!1509 = !{!"0x101\00this\0016777216\001088", !847, null, !1510} ; [ DW_TAG_arg_variable ] [this] [line 0]
!1510 = !{!"0xf\00\000\0064\0064\000\000", null, null, !273} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!1511 = !MDLocation(line: 0, scope: !847)
!1512 = !MDLocation(line: 114, column: 61, scope: !847)
!1513 = !{!"0x101\00this\0016777216\001088", !844, null, !1510} ; [ DW_TAG_arg_variable ] [this] [line 0]
!1514 = !MDLocation(line: 0, scope: !844)
!1515 = !{!"0x101\00x\0033554526\000", !844, !1430, !99} ; [ DW_TAG_arg_variable ] [x] [line 94]
!1516 = !MDLocation(line: 94, column: 58, scope: !844)
!1517 = !MDLocation(line: 96, column: 16, scope: !844)
!1518 = !MDLocation(line: 96, column: 23, scope: !844)
!1519 = !MDLocation(line: 96, column: 35, scope: !844)
!1520 = !MDLocation(line: 96, column: 47, scope: !844)
!1521 = !MDLocation(line: 96, column: 59, scope: !844)
!1522 = !MDLocation(line: 96, column: 9, scope: !844)
!1523 = !{!"0x101\00this\0016777216\001088", !843, null, !205} ; [ DW_TAG_arg_variable ] [this] [line 0]
!1524 = !MDLocation(line: 0, scope: !843)
!1525 = !MDLocation(line: 571, column: 63, scope: !843)
!1526 = !MDLocation(line: 571, column: 56, scope: !843)
!1527 = !{!"0x101\00v1\0016777985\000", !839, !840, !99} ; [ DW_TAG_arg_variable ] [v1] [line 769]
!1528 = !MDLocation(line: 769, column: 28, scope: !839)
!1529 = !{!"0x101\00v2\0033555201\000", !839, !840, !99} ; [ DW_TAG_arg_variable ] [v2] [line 769]
!1530 = !MDLocation(line: 769, column: 49, scope: !839)
!1531 = !MDLocation(line: 781, column: 4, scope: !839)
!1532 = !MDLocation(line: 781, column: 21, scope: !839)
!1533 = !MDLocation(line: 780, column: 2, scope: !839)
!1534 = !MDLocation(line: 782, column: 4, scope: !839)
!1535 = !MDLocation(line: 782, column: 21, scope: !839)
!1536 = !MDLocation(line: 783, column: 4, scope: !839)
!1537 = !MDLocation(line: 783, column: 21, scope: !839)
!1538 = !{!"0x101\00this\0016777216\001088", !838, null, !596} ; [ DW_TAG_arg_variable ] [this] [line 0]
!1539 = !MDLocation(line: 0, scope: !838)
!1540 = !{!"0x101\00v\0033554662\000", !838, !840, !99} ; [ DW_TAG_arg_variable ] [v] [line 230]
!1541 = !MDLocation(line: 230, column: 50, scope: !838)
!1542 = !MDLocation(line: 245, column: 10, scope: !838)
!1543 = !MDLocation(line: 245, column: 24, scope: !838)
!1544 = !MDLocation(line: 246, column: 5, scope: !838)
!1545 = !MDLocation(line: 246, column: 19, scope: !838)
!1546 = !MDLocation(line: 247, column: 5, scope: !838)
!1547 = !MDLocation(line: 247, column: 19, scope: !838)
!1548 = !MDLocation(line: 245, column: 3, scope: !838)
!1549 = !{!"0x101\00this\0016777216\001088", !837, null, !596} ; [ DW_TAG_arg_variable ] [this] [line 0]
!1550 = !MDLocation(line: 0, scope: !837)
!1551 = !MDLocation(line: 254, column: 10, scope: !837)
!1552 = !MDLocation(line: 254, column: 3, scope: !837)
!1553 = !{!"0x101\00this\0016777216\001088", !836, null, !1554} ; [ DW_TAG_arg_variable ] [this] [line 0]
!1554 = !{!"0xf\00\000\0064\0064\000\000", null, null, !191} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!1555 = !MDLocation(line: 0, scope: !836)
!1556 = !MDLocation(line: 159, column: 12, scope: !836)
!1557 = !MDLocation(line: 159, column: 4, scope: !836)
!1558 = !{!"0x101\00y\0016777575\000", !832, !833, !61} ; [ DW_TAG_arg_variable ] [y] [line 359]
!1559 = !MDLocation(line: 359, column: 44, scope: !832)
!1560 = !MDLocation(line: 376, column: 15, scope: !832)
!1561 = !MDLocation(line: 376, column: 9, scope: !832)
!1562 = !MDLocation(line: 376, column: 2, scope: !832)
!1563 = !{!"0x101\00this\0016777216\001088", !831, null, !205} ; [ DW_TAG_arg_variable ] [this] [line 0]
!1564 = !MDLocation(line: 0, scope: !831)
!1565 = !{!"0x101\00s\0033554624\000", !831, !840, !369} ; [ DW_TAG_arg_variable ] [s] [line 192]
!1566 = !MDLocation(line: 192, column: 58, scope: !831)
!1567 = !MDLocation(line: 201, column: 18, scope: !831)
!1568 = !MDLocation(line: 201, column: 3, scope: !831)
!1569 = !MDLocation(line: 202, column: 18, scope: !831)
!1570 = !MDLocation(line: 202, column: 3, scope: !831)
!1571 = !MDLocation(line: 203, column: 18, scope: !831)
!1572 = !MDLocation(line: 203, column: 3, scope: !831)
!1573 = !MDLocation(line: 205, column: 3, scope: !831)
!1574 = !{!"0x101\00this\0016777216\001088", !830, null, !205} ; [ DW_TAG_arg_variable ] [this] [line 0]
!1575 = !MDLocation(line: 0, scope: !830)
!1576 = !{!"0x101\00v\0033554591\000", !830, !840, !99} ; [ DW_TAG_arg_variable ] [v] [line 159]
!1577 = !MDLocation(line: 159, column: 59, scope: !830)
!1578 = !MDLocation(line: 166, column: 18, scope: !830)
!1579 = !MDLocation(line: 166, column: 3, scope: !830)
!1580 = !MDLocation(line: 167, column: 18, scope: !830)
!1581 = !MDLocation(line: 167, column: 3, scope: !830)
!1582 = !MDLocation(line: 168, column: 18, scope: !830)
!1583 = !MDLocation(line: 168, column: 3, scope: !830)
!1584 = !MDLocation(line: 170, column: 3, scope: !830)
!1585 = !{!"0x101\00this\0016777216\001088", !829, null, !205} ; [ DW_TAG_arg_variable ] [this] [line 0]
!1586 = !MDLocation(line: 0, scope: !829)
!1587 = !MDLocation(line: 664, column: 3, scope: !829)
!1588 = !MDLocation(line: 666, column: 2, scope: !829)
!1589 = !{!"0x101\00this\0016777216\001088", !828, null, !205} ; [ DW_TAG_arg_variable ] [this] [line 0]
!1590 = !MDLocation(line: 0, scope: !828)
!1591 = !{!"0x101\00s\0033554642\000", !828, !840, !369} ; [ DW_TAG_arg_variable ] [s] [line 210]
!1592 = !MDLocation(line: 210, column: 58, scope: !828)
!1593 = !MDLocation(line: 224, column: 35, scope: !828)
!1594 = !MDLocation(line: 224, column: 19, scope: !828)
!1595 = !MDLocation(line: 224, column: 10, scope: !828)
!1596 = !MDLocation(line: 224, column: 11, scope: !828)
!1597 = !MDLocation(line: 224, column: 3, scope: !828)
!1598 = !{!"0x101\00this\0016777216\001088", !827, null, !596} ; [ DW_TAG_arg_variable ] [this] [line 0]
!1599 = !MDLocation(line: 0, scope: !827)
!1600 = !MDLocation(line: 260, column: 17, scope: !827)
!1601 = !MDLocation(line: 260, column: 10, scope: !827)
!1602 = !MDLocation(line: 260, column: 3, scope: !827)
!1603 = !{!"0x101\00this\0016777216\001088", !826, null, !205} ; [ DW_TAG_arg_variable ] [this] [line 0]
!1604 = !MDLocation(line: 0, scope: !826)
!1605 = !MDLocation(line: 324, column: 19, scope: !826)
!1606 = !MDLocation(line: 324, column: 10, scope: !826)
!1607 = !MDLocation(line: 324, column: 11, scope: !826)
!1608 = !MDLocation(line: 324, column: 3, scope: !826)
!1609 = !{!"0x101\00this\0016777216\001088", !825, null, !895} ; [ DW_TAG_arg_variable ] [this] [line 0]
!1610 = !MDLocation(line: 0, scope: !825)
!1611 = !MDLocation(line: 59, column: 32, scope: !1612)
!1612 = !{!"0xb\0059\0031\0058", !45, !825}       ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/./btGjkPairDetector.h]
!1613 = !MDLocation(line: 59, column: 32, scope: !825)
!1614 = !{!"0x101\00this\0016777216\001088", !824, null, !895} ; [ DW_TAG_arg_variable ] [this] [line 0]
!1615 = !MDLocation(line: 0, scope: !824)
!1616 = !MDLocation(line: 59, column: 31, scope: !824)
!1617 = !MDLocation(line: 59, column: 31, scope: !1618)
!1618 = !{!"0xb\001", !45, !824}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/./btGjkPairDetector.h]
!1619 = !MDLocation(line: 59, column: 32, scope: !824)
!1620 = !MDLocation(line: 59, column: 32, scope: !1621)
!1621 = !{!"0xb\002", !45, !824}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/./btGjkPairDetector.h]
!1622 = !MDLocation(line: 59, column: 32, scope: !1623)
!1623 = !{!"0xb\003", !45, !824}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/./btGjkPairDetector.h]
!1624 = !{!"0x101\00this\0016777216\001088", !846, null, !596} ; [ DW_TAG_arg_variable ] [this] [line 0]
!1625 = !MDLocation(line: 0, scope: !846)
!1626 = !{!"0x101\00v0\0033555135\000", !846, !840, !99} ; [ DW_TAG_arg_variable ] [v0] [line 703]
!1627 = !MDLocation(line: 703, column: 57, scope: !846)
!1628 = !{!"0x101\00v1\0050332351\000", !846, !840, !99} ; [ DW_TAG_arg_variable ] [v1] [line 703]
!1629 = !MDLocation(line: 703, column: 78, scope: !846)
!1630 = !{!"0x101\00v2\0067109567\000", !846, !840, !99} ; [ DW_TAG_arg_variable ] [v2] [line 703]
!1631 = !MDLocation(line: 703, column: 99, scope: !846)
!1632 = !MDLocation(line: 730, column: 21, scope: !846)
!1633 = !MDLocation(line: 730, column: 3, scope: !846)
!1634 = !MDLocation(line: 730, column: 30, scope: !846)
!1635 = !MDLocation(line: 730, column: 39, scope: !846)
!1636 = !{!"0x101\00this\0016777216\001088", !845, null, !1637} ; [ DW_TAG_arg_variable ] [this] [line 0]
!1637 = !{!"0xf\00\000\0064\0064\000\000", null, null, !268} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!1638 = !MDLocation(line: 0, scope: !845)
!1639 = !{!"0x101\00i\0033554585\000", !845, !852, !58} ; [ DW_TAG_arg_variable ] [i] [line 153]
!1640 = !MDLocation(line: 153, column: 52, scope: !845)
!1641 = !MDLocation(line: 156, column: 15, scope: !845)
!1642 = !MDLocation(line: 156, column: 3, scope: !845)
!1643 = !{!"0x101\00this\0016777216\001088", !860, null, !1637} ; [ DW_TAG_arg_variable ] [this] [line 0]
!1644 = !MDLocation(line: 0, scope: !860)
!1645 = !{!"0x101\00v\0033555043\000", !860, !852, !99} ; [ DW_TAG_arg_variable ] [v] [line 611]
!1646 = !MDLocation(line: 611, column: 52, scope: !860)
!1647 = !MDLocation(line: 613, column: 10, scope: !860)
!1648 = !MDLocation(line: 613, column: 24, scope: !860)
!1649 = !MDLocation(line: 613, column: 32, scope: !860)
!1650 = !MDLocation(line: 613, column: 46, scope: !860)
!1651 = !MDLocation(line: 613, column: 54, scope: !860)
!1652 = !MDLocation(line: 613, column: 68, scope: !860)
!1653 = !MDLocation(line: 613, column: 3, scope: !860)
!1654 = !{!"0x101\00this\0016777216\001088", !859, null, !1637} ; [ DW_TAG_arg_variable ] [this] [line 0]
!1655 = !MDLocation(line: 0, scope: !859)
!1656 = !{!"0x101\00v\0033555047\000", !859, !852, !99} ; [ DW_TAG_arg_variable ] [v] [line 615]
!1657 = !MDLocation(line: 615, column: 52, scope: !859)
!1658 = !MDLocation(line: 617, column: 10, scope: !859)
!1659 = !MDLocation(line: 617, column: 24, scope: !859)
!1660 = !MDLocation(line: 617, column: 32, scope: !859)
!1661 = !MDLocation(line: 617, column: 46, scope: !859)
!1662 = !MDLocation(line: 617, column: 54, scope: !859)
!1663 = !MDLocation(line: 617, column: 68, scope: !859)
!1664 = !MDLocation(line: 617, column: 3, scope: !859)
!1665 = !{!"0x101\00this\0016777216\001088", !855, null, !1637} ; [ DW_TAG_arg_variable ] [this] [line 0]
!1666 = !MDLocation(line: 0, scope: !855)
!1667 = !{!"0x101\00v\0033555051\000", !855, !852, !99} ; [ DW_TAG_arg_variable ] [v] [line 619]
!1668 = !MDLocation(line: 619, column: 52, scope: !855)
!1669 = !MDLocation(line: 621, column: 10, scope: !855)
!1670 = !MDLocation(line: 621, column: 24, scope: !855)
!1671 = !MDLocation(line: 621, column: 32, scope: !855)
!1672 = !MDLocation(line: 621, column: 46, scope: !855)
!1673 = !MDLocation(line: 621, column: 54, scope: !855)
!1674 = !MDLocation(line: 621, column: 68, scope: !855)
!1675 = !MDLocation(line: 621, column: 3, scope: !855)
!1676 = !{!"0x101\00this\0016777216\001088", !858, null, !596} ; [ DW_TAG_arg_variable ] [this] [line 0]
!1677 = !MDLocation(line: 0, scope: !858)
!1678 = !MDLocation(line: 564, column: 49, scope: !858)
!1679 = !{!"0x101\00this\0016777216\001088", !857, null, !596} ; [ DW_TAG_arg_variable ] [this] [line 0]
!1680 = !MDLocation(line: 0, scope: !857)
!1681 = !MDLocation(line: 560, column: 49, scope: !857)
!1682 = !{!"0x101\00this\0016777216\001088", !856, null, !596} ; [ DW_TAG_arg_variable ] [this] [line 0]
!1683 = !MDLocation(line: 0, scope: !856)
!1684 = !MDLocation(line: 562, column: 49, scope: !856)
!1685 = !{!"0x101\00proxyType\0016777385\000", !868, !1686, !58} ; [ DW_TAG_arg_variable ] [proxyType] [line 169]
!1686 = !{!"0x29", !4}                            ; [ DW_TAG_file_type ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/../../BulletCollision/BroadphaseCollision/btBroadphaseProxy.h]
!1687 = !MDLocation(line: 169, column: 47, scope: !868)
!1688 = !MDLocation(line: 171, column: 11, scope: !868)
!1689 = !MDLocation(line: 171, column: 10, scope: !868)
!1690 = !MDLocation(line: 171, column: 52, scope: !1691)
!1691 = !{!"0xb\002", !4, !868}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/../../BulletCollision/BroadphaseCollision/btBroadphaseProxy.h]
!1692 = !MDLocation(line: 171, column: 3, scope: !1693)
!1693 = !{!"0xb\003", !4, !1694}                  ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/../../BulletCollision/BroadphaseCollision/btBroadphaseProxy.h]
!1694 = !{!"0xb\001", !4, !868}                   ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/../../BulletCollision/BroadphaseCollision/btBroadphaseProxy.h]
!1695 = !{!"0x101\00this\0016777216\001088", !876, null, !1696} ; [ DW_TAG_arg_variable ] [this] [line 0]
!1696 = !{!"0xf\00\000\0064\0064\000\000", null, null, !"_ZTS11btMatrix3x3"} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _ZTS11btMatrix3x3]
!1697 = !MDLocation(line: 0, scope: !876)
!1698 = !{!"0x101\00other\0033554541\000", !876, !852, !267} ; [ DW_TAG_arg_variable ] [other] [line 109]
!1699 = !MDLocation(line: 109, column: 52, scope: !876)
!1700 = !MDLocation(line: 109, column: 20, scope: !876)
!1701 = !MDLocation(line: 109, column: 20, scope: !1702)
!1702 = !{!"0xb\002", !353, !1703}                ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/../../LinearMath/btMatrix3x3.h]
!1703 = !{!"0xb\001", !353, !876}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/../../LinearMath/btMatrix3x3.h]
!1704 = !MDLocation(line: 111, column: 3, scope: !1705)
!1705 = !{!"0xb\00110\002\0060", !353, !876}      ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/../../LinearMath/btMatrix3x3.h]
!1706 = !MDLocation(line: 112, column: 3, scope: !1705)
!1707 = !MDLocation(line: 113, column: 3, scope: !1705)
!1708 = !MDLocation(line: 114, column: 2, scope: !876)
!1709 = !{!"0x101\00this\0016777216\001088", !878, null, !939} ; [ DW_TAG_arg_variable ] [this] [line 0]
!1710 = !MDLocation(line: 0, scope: !878)
!1711 = !MDLocation(line: 57, column: 51, scope: !878)
!1712 = !{!"0x101\00this\0016777216\001088", !886, null, !939} ; [ DW_TAG_arg_variable ] [this] [line 0]
!1713 = !MDLocation(line: 0, scope: !886)
!1714 = !MDLocation(line: 57, column: 50, scope: !886)
!1715 = !MDLocation(line: 57, column: 50, scope: !1716)
!1716 = !{!"0xb\001", !222, !886}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/./btDiscreteCollisionDetectorInterface.h]
!1717 = !MDLocation(line: 57, column: 51, scope: !886)
!1718 = !MDLocation(line: 57, column: 51, scope: !1719)
!1719 = !{!"0xb\002", !222, !886}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/./btDiscreteCollisionDetectorInterface.h]
!1720 = !MDLocation(line: 57, column: 51, scope: !1721)
!1721 = !{!"0xb\003", !222, !886}                 ; [ DW_TAG_lexical_block ] [/media/sf_shared/Phoronix/bullet-2.81-rev2613/src/BulletCollision/NarrowPhaseCollision/./btDiscreteCollisionDetectorInterface.h]
