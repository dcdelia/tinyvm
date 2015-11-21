; ModuleID = 'cmsgheap.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%"class.std::ios_base::Init" = type { i8 }
%class.ExecuteOnStartup = type { void ()*, %class.ExecuteOnStartup* }
%class.cHead = type { %class.cObject }
%class.cObject = type { i32 (...)**, i8*, i8, i8, %class.cObject*, %class.cObject*, %class.cObject*, %class.cObject* }
%class.cMessageHeap = type { %class.cObject, %class.cMessage**, i32, i32, i64 }
%class.cMessage = type { %class.cObject, i32, i32, i64, i8, double, %class.cArray*, %class.cMessage*, i8*, i32, i32, i32, i32, double, double, double, i32, i64 }
%class.cArray = type { %class.cObject, %class.cObject**, i32, i32, i32, i32 }
%class.cClassRegister = type { %class.cObject, i8* ()* }
%"class.std::basic_ostream" = type { i32 (...)**, %"class.std::basic_ios" }
%"class.std::basic_ios" = type { %"class.std::ios_base", %"class.std::basic_ostream"*, i8, i8, %"class.std::basic_streambuf"*, %"class.std::ctype"*, %"class.std::num_put"*, %"class.std::num_get"* }
%"class.std::ios_base" = type { i32 (...)**, i64, i64, i32, i32, i32, %"struct.std::ios_base::_Callback_list"*, %"struct.std::ios_base::_Words", [8 x %"struct.std::ios_base::_Words"], i32, %"struct.std::ios_base::_Words"*, %"class.std::locale" }
%"struct.std::ios_base::_Callback_list" = type { %"struct.std::ios_base::_Callback_list"*, void (i32, %"class.std::ios_base"*, i32)*, i32, i32 }
%"struct.std::ios_base::_Words" = type { i8*, i64 }
%"class.std::locale" = type { %"class.std::locale::_Impl"* }
%"class.std::locale::_Impl" = type { i32, %"class.std::locale::facet"**, i64, %"class.std::locale::facet"**, i8** }
%"class.std::locale::facet" = type <{ i32 (...)**, i32, [4 x i8] }>
%"class.std::basic_streambuf" = type { i32 (...)**, i8*, i8*, i8*, i8*, i8*, i8*, %"class.std::locale" }
%"class.std::ctype" = type <{ %"class.std::locale::facet.base", [4 x i8], %struct.__locale_struct*, i8, [7 x i8], i32*, i32*, i16*, i8, [256 x i8], [256 x i8], i8, [6 x i8] }>
%"class.std::locale::facet.base" = type <{ i32 (...)**, i32 }>
%struct.__locale_struct = type { [13 x %struct.__locale_data*], i16*, i32*, i32*, [13 x i8*] }
%struct.__locale_data = type opaque
%"class.std::num_put" = type { %"class.std::locale::facet.base", [4 x i8] }
%"class.std::num_get" = type { %"class.std::locale::facet.base", [4 x i8] }

@_ZStL8__ioinit = internal global %"class.std::ios_base::Init" zeroinitializer, align 1
@__dso_handle = external global i8
@_ZL25__cMessageHeap__class_reg = internal global %class.ExecuteOnStartup zeroinitializer, align 8
@_ZTV12cMessageHeap = unnamed_addr constant [16 x i8*] [i8* null, i8* bitcast ({ i8*, i8*, i8* }* @_ZTI12cMessageHeap to i8*), i8* bitcast (void (%class.cMessageHeap*)* @_ZN12cMessageHeapD1Ev to i8*), i8* bitcast (void (%class.cMessageHeap*)* @_ZN12cMessageHeapD0Ev to i8*), i8* bitcast (%class.cObject* (%class.cMessageHeap*)* @_ZNK12cMessageHeap3dupEv to i8*), i8* bitcast (i8* (%class.cObject*)* @_ZNK7cObject8fullNameEv to i8*), i8* bitcast (i8* (%class.cObject*)* @_ZNK7cObject8fullPathEv to i8*), i8* bitcast (i8* (%class.cObject*, i8*, i32)* @_ZNK7cObject8fullPathEPci to i8*), i8* bitcast (%class.cObject* (%class.cObject*)* @_ZNK7cObject12defaultOwnerEv to i8*), i8* bitcast (i8* (%class.cObject*)* @_ZNK7cObject9classNameEv to i8*), i8* bitcast (void (%class.cMessageHeap*, i8*)* @_ZN12cMessageHeap4infoEPc to i8*), i8* bitcast (void (%class.cObject*, %"class.std::basic_ostream"*)* @_ZN7cObject7writeToERSo to i8*), i8* bitcast (void (%class.cObject*, %"class.std::basic_ostream"*)* @_ZN7cObject13writeContentsERSo to i8*), i8* bitcast (i32 (%class.cObject*)* @_ZN7cObject7netPackEv to i8*), i8* bitcast (i32 (%class.cObject*)* @_ZN7cObject9netUnpackEv to i8*), i8* bitcast (void (%class.cMessageHeap*, i1 (%class.cObject*, i1)*)* @_ZN12cMessageHeap7forEachEPFbP7cObjectbE to i8*)], align 8
@.str = private unnamed_addr constant [9 x i8] c" (empty)\00", align 1
@.str2 = private unnamed_addr constant [15 x i8] c" n=%d first=%s\00", align 1
@_ZTVN10__cxxabiv120__si_class_type_infoE = external global i8*
@_ZTS12cMessageHeap = constant [15 x i8] c"12cMessageHeap\00"
@_ZTI7cObject = external constant i8*
@_ZTI12cMessageHeap = constant { i8*, i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8** @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([15 x i8]* @_ZTS12cMessageHeap, i32 0, i32 0), i8* bitcast (i8** @_ZTI7cObject to i8*) }
@.str3 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str4 = private unnamed_addr constant [13 x i8] c"cMessageHeap\00", align 1
@classes = external global %class.cHead
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__sub_I_cmsgheap.cc, i8* null }]

@_ZN12cMessageHeapC1EPKci = alias void (%class.cMessageHeap*, i8*, i32)* @_ZN12cMessageHeapC2EPKci
@_ZN12cMessageHeapC1ERKS_ = alias void (%class.cMessageHeap*, %class.cMessageHeap*)* @_ZN12cMessageHeapC2ERKS_
@_ZN12cMessageHeapD1Ev = alias void (%class.cMessageHeap*)* @_ZN12cMessageHeapD2Ev

define internal void @__cxx_global_var_init() section ".text.startup" {
  call void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* @_ZStL8__ioinit)
  %1 = call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.std::ios_base::Init"*)* @_ZNSt8ios_base4InitD1Ev to void (i8*)*), i8* getelementptr inbounds (%"class.std::ios_base::Init"* @_ZStL8__ioinit, i32 0, i32 0), i8* @__dso_handle) #1
  ret void
}

declare void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"*) #0

declare void @_ZNSt8ios_base4InitD1Ev(%"class.std::ios_base::Init"*) #0

; Function Attrs: nounwind
declare i32 @__cxa_atexit(void (i8*)*, i8*, i8*) #1

; Function Attrs: uwtable
define i8* @_Z20cMessageHeap__createv() #2 {
  %1 = call i8* @_ZN7cObjectnwEm(i64 80)
  %2 = bitcast i8* %1 to %class.cMessageHeap*
  invoke void @_ZN12cMessageHeapC1EPKci(%class.cMessageHeap* %2, i8* null, i32 128)
          to label %3 unwind label %5

; <label>:3                                       ; preds = %0
  %4 = bitcast %class.cMessageHeap* %2 to i8*
  ret i8* %4

; <label>:5                                       ; preds = %0
  %6 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
  %7 = extractvalue { i8*, i32 } %6, 0
  %8 = extractvalue { i8*, i32 } %6, 1
  call void @_ZdlPv(i8* %1) #11
  br label %9

; <label>:9                                       ; preds = %5
  %10 = insertvalue { i8*, i32 } undef, i8* %7, 0
  %11 = insertvalue { i8*, i32 } %10, i32 %8, 1
  resume { i8*, i32 } %11
}

declare i8* @_ZN7cObjectnwEm(i64) #0

declare i32 @__gxx_personality_v0(...)

; Function Attrs: nobuiltin nounwind
declare void @_ZdlPv(i8*) #3

define internal void @__cxx_global_var_init1() section ".text.startup" {
  call void @_ZN16ExecuteOnStartupC1EPFvvE(%class.ExecuteOnStartup* @_ZL25__cMessageHeap__class_reg, void ()* @_ZL26__cMessageHeap__class_codev)
  %1 = call i32 @__cxa_atexit(void (i8*)* bitcast (void (%class.ExecuteOnStartup*)* @_ZN16ExecuteOnStartupD1Ev to void (i8*)*), i8* bitcast (%class.ExecuteOnStartup* @_ZL25__cMessageHeap__class_reg to i8*), i8* @__dso_handle) #1
  ret void
}

; Function Attrs: uwtable
define internal void @_ZL26__cMessageHeap__class_codev() #2 {
  %1 = call i8* @_ZN7cObjectnwEm(i64 64)
  %2 = bitcast i8* %1 to %class.cClassRegister*
  invoke void @_ZN14cClassRegisterC1EPKcPFPvvE(%class.cClassRegister* %2, i8* getelementptr inbounds ([13 x i8]* @.str4, i32 0, i32 0), i8* ()* @_Z20cMessageHeap__createv)
          to label %3 unwind label %5

; <label>:3                                       ; preds = %0
  %4 = bitcast %class.cClassRegister* %2 to %class.cObject*
  call void @_ZN7cObject8setOwnerEPS_(%class.cObject* %4, %class.cObject* getelementptr inbounds (%class.cHead* @classes, i32 0, i32 0))
  ret void

; <label>:5                                       ; preds = %0
  %6 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
  %7 = extractvalue { i8*, i32 } %6, 0
  %8 = extractvalue { i8*, i32 } %6, 1
  call void @_ZdlPv(i8* %1) #11
  br label %9

; <label>:9                                       ; preds = %5
  %10 = insertvalue { i8*, i32 } undef, i8* %7, 0
  %11 = insertvalue { i8*, i32 } %10, i32 %8, 1
  resume { i8*, i32 } %11
}

declare void @_ZN16ExecuteOnStartupC1EPFvvE(%class.ExecuteOnStartup*, void ()*) #0

declare void @_ZN16ExecuteOnStartupD1Ev(%class.ExecuteOnStartup*) #0

; Function Attrs: uwtable
define void @_ZN12cMessageHeapC2EPKci(%class.cMessageHeap* %this, i8* %name, i32 %siz) unnamed_addr #2 align 2 {
  %1 = bitcast %class.cMessageHeap* %this to %class.cObject*
  call void @_ZN7cObjectC2EPKc(%class.cObject* %1, i8* %name)
  %2 = bitcast %class.cMessageHeap* %this to i32 (...)***
  store i32 (...)** bitcast (i8** getelementptr inbounds ([16 x i8*]* @_ZTV12cMessageHeap, i64 0, i64 2) to i32 (...)**), i32 (...)*** %2
  %3 = getelementptr inbounds %class.cMessageHeap* %this, i32 0, i32 4
  store i64 0, i64* %3, align 8
  %4 = getelementptr inbounds %class.cMessageHeap* %this, i32 0, i32 2
  store i32 0, i32* %4, align 4
  %5 = getelementptr inbounds %class.cMessageHeap* %this, i32 0, i32 3
  store i32 %siz, i32* %5, align 4
  %6 = getelementptr inbounds %class.cMessageHeap* %this, i32 0, i32 3
  %7 = load i32* %6, align 4
  %8 = add nsw i32 %7, 1
  %9 = sext i32 %8 to i64
  %10 = call { i64, i1 } @llvm.umul.with.overflow.i64(i64 %9, i64 8)
  %11 = extractvalue { i64, i1 } %10, 1
  %12 = extractvalue { i64, i1 } %10, 0
  %13 = select i1 %11, i64 -1, i64 %12
  %14 = invoke noalias i8* @_Znam(i64 %13) #12
          to label %15 unwind label %18

; <label>:15                                      ; preds = %0
  %16 = bitcast i8* %14 to %class.cMessage**
  %17 = getelementptr inbounds %class.cMessageHeap* %this, i32 0, i32 1
  store %class.cMessage** %16, %class.cMessage*** %17, align 8
  ret void

; <label>:18                                      ; preds = %0
  %19 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
  %20 = extractvalue { i8*, i32 } %19, 0
  %21 = extractvalue { i8*, i32 } %19, 1
  %22 = bitcast %class.cMessageHeap* %this to %class.cObject*
  invoke void @_ZN7cObjectD2Ev(%class.cObject* %22)
          to label %23 unwind label %27

; <label>:23                                      ; preds = %18
  br label %24

; <label>:24                                      ; preds = %23
  %25 = insertvalue { i8*, i32 } undef, i8* %20, 0
  %26 = insertvalue { i8*, i32 } %25, i32 %21, 1
  resume { i8*, i32 } %26

; <label>:27                                      ; preds = %18
  %28 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          catch i8* null
  %29 = extractvalue { i8*, i32 } %28, 0
  call void @__clang_call_terminate(i8* %29) #13
  unreachable
}

declare void @_ZN7cObjectC2EPKc(%class.cObject*, i8*) #0

; Function Attrs: nounwind readnone
declare { i64, i1 } @llvm.umul.with.overflow.i64(i64, i64) #4

; Function Attrs: nobuiltin
declare noalias i8* @_Znam(i64) #5

declare void @_ZN7cObjectD2Ev(%class.cObject*) #0

; Function Attrs: noinline noreturn nounwind
define linkonce_odr hidden void @__clang_call_terminate(i8*) #6 {
  %2 = call i8* @__cxa_begin_catch(i8* %0) #1
  call void @_ZSt9terminatev() #13
  unreachable
}

declare i8* @__cxa_begin_catch(i8*)

declare void @_ZSt9terminatev()

; Function Attrs: uwtable
define void @_ZN12cMessageHeapC2ERKS_(%class.cMessageHeap* %this, %class.cMessageHeap* dereferenceable(80) %heap) unnamed_addr #2 align 2 {
  %1 = bitcast %class.cMessageHeap* %this to %class.cObject*
  call void @_ZN7cObjectC2Ev(%class.cObject* %1)
  %2 = bitcast %class.cMessageHeap* %this to i32 (...)***
  store i32 (...)** bitcast (i8** getelementptr inbounds ([16 x i8*]* @_ZTV12cMessageHeap, i64 0, i64 2) to i32 (...)**), i32 (...)*** %2
  %3 = getelementptr inbounds %class.cMessageHeap* %this, i32 0, i32 1
  store %class.cMessage** null, %class.cMessage*** %3, align 8
  %4 = getelementptr inbounds %class.cMessageHeap* %this, i32 0, i32 2
  store i32 0, i32* %4, align 4
  %5 = bitcast %class.cMessageHeap* %this to %class.cObject*
  %6 = bitcast %class.cMessageHeap* %heap to %class.cObject*
  %7 = invoke i8* @_ZNK7cObject4nameEv(%class.cObject* %6)
          to label %8 unwind label %12

; <label>:8                                       ; preds = %0
  invoke void @_ZN7cObject7setNameEPKc(%class.cObject* %5, i8* %7)
          to label %9 unwind label %12

; <label>:9                                       ; preds = %8
  %10 = invoke dereferenceable(80) %class.cMessageHeap* @_ZN12cMessageHeapaSERKS_(%class.cMessageHeap* %this, %class.cMessageHeap* dereferenceable(80) %heap)
          to label %11 unwind label %12

; <label>:11                                      ; preds = %9
  ret void

; <label>:12                                      ; preds = %9, %8, %0
  %13 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
  %14 = extractvalue { i8*, i32 } %13, 0
  %15 = extractvalue { i8*, i32 } %13, 1
  %16 = bitcast %class.cMessageHeap* %this to %class.cObject*
  invoke void @_ZN7cObjectD2Ev(%class.cObject* %16)
          to label %17 unwind label %21

; <label>:17                                      ; preds = %12
  br label %18

; <label>:18                                      ; preds = %17
  %19 = insertvalue { i8*, i32 } undef, i8* %14, 0
  %20 = insertvalue { i8*, i32 } %19, i32 %15, 1
  resume { i8*, i32 } %20

; <label>:21                                      ; preds = %12
  %22 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          catch i8* null
  %23 = extractvalue { i8*, i32 } %22, 0
  call void @__clang_call_terminate(i8* %23) #13
  unreachable
}

declare void @_ZN7cObjectC2Ev(%class.cObject*) #0

; Function Attrs: uwtable
define linkonce_odr void @_ZN7cObject7setNameEPKc(%class.cObject* %this, i8* %s) #2 align 2 {
  %1 = getelementptr inbounds %class.cObject* %this, i32 0, i32 1
  %2 = load i8** %1, align 8
  %3 = icmp eq i8* %2, null
  br i1 %3, label %5, label %4

; <label>:4                                       ; preds = %0
  call void @_ZdlPv(i8* %2) #11
  br label %5

; <label>:5                                       ; preds = %4, %0
  %6 = call i8* @_Z10opp_strdupPKc(i8* %s)
  %7 = getelementptr inbounds %class.cObject* %this, i32 0, i32 1
  store i8* %6, i8** %7, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define linkonce_odr i8* @_ZNK7cObject4nameEv(%class.cObject* %this) #7 align 2 {
  %1 = getelementptr inbounds %class.cObject* %this, i32 0, i32 1
  %2 = load i8** %1, align 8
  %3 = icmp ne i8* %2, null
  br i1 %3, label %4, label %7

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds %class.cObject* %this, i32 0, i32 1
  %6 = load i8** %5, align 8
  br label %8

; <label>:7                                       ; preds = %0
  br label %8

; <label>:8                                       ; preds = %7, %4
  %9 = phi i8* [ %6, %4 ], [ getelementptr inbounds ([1 x i8]* @.str3, i32 0, i32 0), %7 ]
  ret i8* %9
}

; Function Attrs: uwtable
define dereferenceable(80) %class.cMessageHeap* @_ZN12cMessageHeapaSERKS_(%class.cMessageHeap* %this, %class.cMessageHeap* dereferenceable(80) %heap) #2 align 2 {
  %1 = icmp eq %class.cMessageHeap* %this, %heap
  br i1 %1, label %2, label %3

; <label>:2                                       ; preds = %0
  br label %76

; <label>:3                                       ; preds = %0
  call void @_ZN12cMessageHeap5clearEv(%class.cMessageHeap* %this)
  %4 = bitcast %class.cMessageHeap* %this to %class.cObject*
  %5 = bitcast %class.cMessageHeap* %heap to %class.cObject*
  %6 = call dereferenceable(56) %class.cObject* @_ZN7cObjectaSERKS_(%class.cObject* %4, %class.cObject* dereferenceable(56) %5)
  %7 = getelementptr inbounds %class.cMessageHeap* %heap, i32 0, i32 2
  %8 = load i32* %7, align 4
  %9 = getelementptr inbounds %class.cMessageHeap* %this, i32 0, i32 2
  store i32 %8, i32* %9, align 4
  %10 = getelementptr inbounds %class.cMessageHeap* %heap, i32 0, i32 3
  %11 = load i32* %10, align 4
  %12 = getelementptr inbounds %class.cMessageHeap* %this, i32 0, i32 3
  store i32 %11, i32* %12, align 4
  %13 = getelementptr inbounds %class.cMessageHeap* %this, i32 0, i32 1
  %14 = load %class.cMessage*** %13, align 8
  %15 = icmp eq %class.cMessage** %14, null
  br i1 %15, label %18, label %16

; <label>:16                                      ; preds = %3
  %17 = bitcast %class.cMessage** %14 to i8*
  call void @_ZdaPv(i8* %17) #11
  br label %18

; <label>:18                                      ; preds = %16, %3
  %19 = getelementptr inbounds %class.cMessageHeap* %this, i32 0, i32 3
  %20 = load i32* %19, align 4
  %21 = add nsw i32 %20, 1
  %22 = sext i32 %21 to i64
  %23 = call { i64, i1 } @llvm.umul.with.overflow.i64(i64 %22, i64 8)
  %24 = extractvalue { i64, i1 } %23, 1
  %25 = extractvalue { i64, i1 } %23, 0
  %26 = select i1 %24, i64 -1, i64 %25
  %27 = call noalias i8* @_Znam(i64 %26) #12
  %28 = bitcast i8* %27 to %class.cMessage**
  %29 = getelementptr inbounds %class.cMessageHeap* %this, i32 0, i32 1
  store %class.cMessage** %28, %class.cMessage*** %29, align 8
  br label %30

; <label>:30                                      ; preds = %73, %18
  %i.0 = phi i32 [ 1, %18 ], [ %74, %73 ]
  %31 = getelementptr inbounds %class.cMessageHeap* %this, i32 0, i32 2
  %32 = load i32* %31, align 4
  %33 = icmp sle i32 %i.0, %32
  br i1 %33, label %34, label %75

; <label>:34                                      ; preds = %30
  %35 = sext i32 %i.0 to i64
  %36 = getelementptr inbounds %class.cMessageHeap* %heap, i32 0, i32 1
  %37 = load %class.cMessage*** %36, align 8
  %38 = getelementptr inbounds %class.cMessage** %37, i64 %35
  %39 = load %class.cMessage** %38, align 8
  %40 = bitcast %class.cMessage* %39 to %class.cObject*
  %41 = call %class.cObject* @_ZNK7cObject5ownerEv(%class.cObject* %40)
  %42 = bitcast %class.cMessageHeap* %heap to %class.cObject*
  %43 = icmp eq %class.cObject* %41, %42
  br i1 %43, label %44, label %62

; <label>:44                                      ; preds = %34
  %45 = bitcast %class.cMessageHeap* %this to %class.cObject*
  %46 = sext i32 %i.0 to i64
  %47 = getelementptr inbounds %class.cMessageHeap* %heap, i32 0, i32 1
  %48 = load %class.cMessage*** %47, align 8
  %49 = getelementptr inbounds %class.cMessage** %48, i64 %46
  %50 = load %class.cMessage** %49, align 8
  %51 = bitcast %class.cMessage* %50 to %class.cObject* (%class.cMessage*)***
  %52 = load %class.cObject* (%class.cMessage*)*** %51
  %53 = getelementptr inbounds %class.cObject* (%class.cMessage*)** %52, i64 2
  %54 = load %class.cObject* (%class.cMessage*)** %53
  %55 = call %class.cObject* %54(%class.cMessage* %50)
  %56 = bitcast %class.cObject* %55 to %class.cMessage*
  %57 = sext i32 %i.0 to i64
  %58 = getelementptr inbounds %class.cMessageHeap* %this, i32 0, i32 1
  %59 = load %class.cMessage*** %58, align 8
  %60 = getelementptr inbounds %class.cMessage** %59, i64 %57
  store %class.cMessage* %56, %class.cMessage** %60, align 8
  %61 = bitcast %class.cMessage* %56 to %class.cObject*
  call void @_ZN7cObject4takeEPS_(%class.cObject* %45, %class.cObject* %61)
  br label %72

; <label>:62                                      ; preds = %34
  %63 = sext i32 %i.0 to i64
  %64 = getelementptr inbounds %class.cMessageHeap* %heap, i32 0, i32 1
  %65 = load %class.cMessage*** %64, align 8
  %66 = getelementptr inbounds %class.cMessage** %65, i64 %63
  %67 = load %class.cMessage** %66, align 8
  %68 = sext i32 %i.0 to i64
  %69 = getelementptr inbounds %class.cMessageHeap* %this, i32 0, i32 1
  %70 = load %class.cMessage*** %69, align 8
  %71 = getelementptr inbounds %class.cMessage** %70, i64 %68
  store %class.cMessage* %67, %class.cMessage** %71, align 8
  br label %72

; <label>:72                                      ; preds = %62, %44
  br label %73

; <label>:73                                      ; preds = %72
  %74 = add nsw i32 %i.0, 1
  br label %30

; <label>:75                                      ; preds = %30
  br label %76

; <label>:76                                      ; preds = %75, %2
  ret %class.cMessageHeap* %this
}

; Function Attrs: uwtable
define void @_ZN12cMessageHeapD2Ev(%class.cMessageHeap* %this) unnamed_addr #2 align 2 {
  %1 = bitcast %class.cMessageHeap* %this to i32 (...)***
  store i32 (...)** bitcast (i8** getelementptr inbounds ([16 x i8*]* @_ZTV12cMessageHeap, i64 0, i64 2) to i32 (...)**), i32 (...)*** %1
  %2 = getelementptr inbounds %class.cMessageHeap* %this, i32 0, i32 1
  %3 = load %class.cMessage*** %2, align 8
  %4 = icmp eq %class.cMessage** %3, null
  br i1 %4, label %7, label %5

; <label>:5                                       ; preds = %0
  %6 = bitcast %class.cMessage** %3 to i8*
  call void @_ZdaPv(i8* %6) #11
  br label %7

; <label>:7                                       ; preds = %5, %0
  %8 = getelementptr inbounds %class.cMessageHeap* %this, i32 0, i32 1
  store %class.cMessage** null, %class.cMessage*** %8, align 8
  %9 = getelementptr inbounds %class.cMessageHeap* %this, i32 0, i32 2
  store i32 0, i32* %9, align 4
  %10 = bitcast %class.cMessageHeap* %this to %class.cObject*
  call void @_ZN7cObjectD2Ev(%class.cObject* %10)
  ret void
}

; Function Attrs: nobuiltin nounwind
declare void @_ZdaPv(i8*) #3

; Function Attrs: uwtable
define void @_ZN12cMessageHeapD0Ev(%class.cMessageHeap* %this) unnamed_addr #2 align 2 {
  invoke void @_ZN12cMessageHeapD1Ev(%class.cMessageHeap* %this)
          to label %1 unwind label %3

; <label>:1                                       ; preds = %0
  %2 = bitcast %class.cMessageHeap* %this to i8*
  call void @_ZdlPv(i8* %2) #11
  ret void

; <label>:3                                       ; preds = %0
  %4 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
  %5 = extractvalue { i8*, i32 } %4, 0
  %6 = extractvalue { i8*, i32 } %4, 1
  %7 = bitcast %class.cMessageHeap* %this to i8*
  call void @_ZdlPv(i8* %7) #11
  br label %8

; <label>:8                                       ; preds = %3
  %9 = insertvalue { i8*, i32 } undef, i8* %5, 0
  %10 = insertvalue { i8*, i32 } %9, i32 %6, 1
  resume { i8*, i32 } %10
}

; Function Attrs: uwtable
define void @_ZN12cMessageHeap4infoEPc(%class.cMessageHeap* %this, i8* %buf) unnamed_addr #2 align 2 {
  %1 = bitcast %class.cMessageHeap* %this to %class.cObject*
  call void @_ZN7cObject4infoEPc(%class.cObject* %1, i8* %buf)
  %2 = getelementptr inbounds %class.cMessageHeap* %this, i32 0, i32 2
  %3 = load i32* %2, align 4
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %5, label %9

; <label>:5                                       ; preds = %0
  %6 = call i64 @strlen(i8* %buf) #14
  %7 = getelementptr inbounds i8* %buf, i64 %6
  %8 = call i32 (i8*, i8*, ...)* @sprintf(i8* %7, i8* getelementptr inbounds ([9 x i8]* @.str, i32 0, i32 0)) #1
  br label %21

; <label>:9                                       ; preds = %0
  %10 = call i64 @strlen(i8* %buf) #14
  %11 = getelementptr inbounds i8* %buf, i64 %10
  %12 = getelementptr inbounds %class.cMessageHeap* %this, i32 0, i32 2
  %13 = load i32* %12, align 4
  %14 = getelementptr inbounds %class.cMessageHeap* %this, i32 0, i32 1
  %15 = load %class.cMessage*** %14, align 8
  %16 = getelementptr inbounds %class.cMessage** %15, i64 1
  %17 = load %class.cMessage** %16, align 8
  %18 = call double @_ZNK8cMessage11arrivalTimeEv(%class.cMessage* %17)
  %19 = call i8* @_Z12simtimeToStrdPc(double %18, i8* null)
  %20 = call i32 (i8*, i8*, ...)* @sprintf(i8* %11, i8* getelementptr inbounds ([15 x i8]* @.str2, i32 0, i32 0), i32 %13, i8* %19) #1
  br label %21

; <label>:21                                      ; preds = %9, %5
  ret void
}

declare void @_ZN7cObject4infoEPc(%class.cObject*, i8*) #0

; Function Attrs: nounwind
declare i32 @sprintf(i8*, i8*, ...) #8

; Function Attrs: nounwind readonly
declare i64 @strlen(i8*) #9

declare i8* @_Z12simtimeToStrdPc(double, i8*) #0

; Function Attrs: nounwind uwtable
define linkonce_odr double @_ZNK8cMessage11arrivalTimeEv(%class.cMessage* %this) #7 align 2 {
  %1 = getelementptr inbounds %class.cMessage* %this, i32 0, i32 15
  %2 = load double* %1, align 8
  ret double %2
}

; Function Attrs: uwtable
define void @_ZN12cMessageHeap7forEachEPFbP7cObjectbE(%class.cMessageHeap* %this, i1 (%class.cObject*, i1)* %do_fn) unnamed_addr #2 align 2 {
  call void @_ZN12cMessageHeap4sortEv(%class.cMessageHeap* %this)
  %1 = bitcast %class.cMessageHeap* %this to %class.cObject*
  %2 = call zeroext i1 %do_fn(%class.cObject* %1, i1 zeroext true)
  br i1 %2, label %3, label %29

; <label>:3                                       ; preds = %0
  br label %4

; <label>:4                                       ; preds = %26, %3
  %i.0 = phi i32 [ 1, %3 ], [ %27, %26 ]
  %5 = getelementptr inbounds %class.cMessageHeap* %this, i32 0, i32 2
  %6 = load i32* %5, align 4
  %7 = icmp sle i32 %i.0, %6
  br i1 %7, label %8, label %28

; <label>:8                                       ; preds = %4
  %9 = sext i32 %i.0 to i64
  %10 = getelementptr inbounds %class.cMessageHeap* %this, i32 0, i32 1
  %11 = load %class.cMessage*** %10, align 8
  %12 = getelementptr inbounds %class.cMessage** %11, i64 %9
  %13 = load %class.cMessage** %12, align 8
  %14 = icmp ne %class.cMessage* %13, null
  br i1 %14, label %15, label %25

; <label>:15                                      ; preds = %8
  %16 = sext i32 %i.0 to i64
  %17 = getelementptr inbounds %class.cMessageHeap* %this, i32 0, i32 1
  %18 = load %class.cMessage*** %17, align 8
  %19 = getelementptr inbounds %class.cMessage** %18, i64 %16
  %20 = load %class.cMessage** %19, align 8
  %21 = bitcast %class.cMessage* %20 to void (%class.cMessage*, i1 (%class.cObject*, i1)*)***
  %22 = load void (%class.cMessage*, i1 (%class.cObject*, i1)*)*** %21
  %23 = getelementptr inbounds void (%class.cMessage*, i1 (%class.cObject*, i1)*)** %22, i64 13
  %24 = load void (%class.cMessage*, i1 (%class.cObject*, i1)*)** %23
  call void %24(%class.cMessage* %20, i1 (%class.cObject*, i1)* %do_fn)
  br label %25

; <label>:25                                      ; preds = %15, %8
  br label %26

; <label>:26                                      ; preds = %25
  %27 = add nsw i32 %i.0, 1
  br label %4

; <label>:28                                      ; preds = %4
  br label %29

; <label>:29                                      ; preds = %28, %0
  %30 = bitcast %class.cMessageHeap* %this to %class.cObject*
  %31 = call zeroext i1 %do_fn(%class.cObject* %30, i1 zeroext false)
  ret void
}

; Function Attrs: uwtable
define void @_ZN12cMessageHeap4sortEv(%class.cMessageHeap* %this) #2 align 2 {
  %1 = getelementptr inbounds %class.cMessageHeap* %this, i32 0, i32 1
  %2 = load %class.cMessage*** %1, align 8
  %3 = getelementptr inbounds %class.cMessage** %2, i64 1
  %4 = bitcast %class.cMessage** %3 to i8*
  %5 = getelementptr inbounds %class.cMessageHeap* %this, i32 0, i32 2
  %6 = load i32* %5, align 4
  %7 = sext i32 %6 to i64
  call void @qsort(i8* %4, i64 %7, i64 8, i32 (i8*, i8*)* @_ZL14qsort_cmp_msgsPKvS0_)
  br label %8

; <label>:8                                       ; preds = %19, %0
  %i.0 = phi i32 [ 1, %0 ], [ %20, %19 ]
  %9 = getelementptr inbounds %class.cMessageHeap* %this, i32 0, i32 2
  %10 = load i32* %9, align 4
  %11 = icmp sle i32 %i.0, %10
  br i1 %11, label %12, label %21

; <label>:12                                      ; preds = %8
  %13 = sext i32 %i.0 to i64
  %14 = getelementptr inbounds %class.cMessageHeap* %this, i32 0, i32 1
  %15 = load %class.cMessage*** %14, align 8
  %16 = getelementptr inbounds %class.cMessage** %15, i64 %13
  %17 = load %class.cMessage** %16, align 8
  %18 = getelementptr inbounds %class.cMessage* %17, i32 0, i32 16
  store i32 %i.0, i32* %18, align 4
  br label %19

; <label>:19                                      ; preds = %12
  %20 = add nsw i32 %i.0, 1
  br label %8

; <label>:21                                      ; preds = %8
  ret void
}

; Function Attrs: uwtable
define void @_ZN12cMessageHeap5clearEv(%class.cMessageHeap* %this) #2 align 2 {
  br label %1

; <label>:1                                       ; preds = %37, %0
  %i.0 = phi i32 [ 1, %0 ], [ %38, %37 ]
  %2 = getelementptr inbounds %class.cMessageHeap* %this, i32 0, i32 2
  %3 = load i32* %2, align 4
  %4 = icmp sle i32 %i.0, %3
  br i1 %4, label %5, label %39

; <label>:5                                       ; preds = %1
  %6 = sext i32 %i.0 to i64
  %7 = getelementptr inbounds %class.cMessageHeap* %this, i32 0, i32 1
  %8 = load %class.cMessage*** %7, align 8
  %9 = getelementptr inbounds %class.cMessage** %8, i64 %6
  %10 = load %class.cMessage** %9, align 8
  %11 = icmp ne %class.cMessage* %10, null
  br i1 %11, label %12, label %36

; <label>:12                                      ; preds = %5
  %13 = sext i32 %i.0 to i64
  %14 = getelementptr inbounds %class.cMessageHeap* %this, i32 0, i32 1
  %15 = load %class.cMessage*** %14, align 8
  %16 = getelementptr inbounds %class.cMessage** %15, i64 %13
  %17 = load %class.cMessage** %16, align 8
  %18 = bitcast %class.cMessage* %17 to %class.cObject*
  %19 = call %class.cObject* @_ZNK7cObject5ownerEv(%class.cObject* %18)
  %20 = bitcast %class.cMessageHeap* %this to %class.cObject*
  %21 = icmp eq %class.cObject* %19, %20
  br i1 %21, label %22, label %36

; <label>:22                                      ; preds = %12
  %23 = sext i32 %i.0 to i64
  %24 = getelementptr inbounds %class.cMessageHeap* %this, i32 0, i32 1
  %25 = load %class.cMessage*** %24, align 8
  %26 = getelementptr inbounds %class.cMessage** %25, i64 %23
  %27 = load %class.cMessage** %26, align 8
  %28 = getelementptr inbounds %class.cMessage* %27, i32 0, i32 16
  store i32 -1, i32* %28, align 4
  %29 = bitcast %class.cMessageHeap* %this to %class.cObject*
  %30 = sext i32 %i.0 to i64
  %31 = getelementptr inbounds %class.cMessageHeap* %this, i32 0, i32 1
  %32 = load %class.cMessage*** %31, align 8
  %33 = getelementptr inbounds %class.cMessage** %32, i64 %30
  %34 = load %class.cMessage** %33, align 8
  %35 = bitcast %class.cMessage* %34 to %class.cObject*
  call void @_ZN7cObject7discardEPS_(%class.cObject* %29, %class.cObject* %35)
  br label %36

; <label>:36                                      ; preds = %22, %12, %5
  br label %37

; <label>:37                                      ; preds = %36
  %38 = add nsw i32 %i.0, 1
  br label %1

; <label>:39                                      ; preds = %1
  %40 = getelementptr inbounds %class.cMessageHeap* %this, i32 0, i32 2
  store i32 0, i32* %40, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define linkonce_odr %class.cObject* @_ZNK7cObject5ownerEv(%class.cObject* %this) #7 align 2 {
  %1 = getelementptr inbounds %class.cObject* %this, i32 0, i32 4
  %2 = load %class.cObject** %1, align 8
  ret %class.cObject* %2
}

; Function Attrs: uwtable
define linkonce_odr void @_ZN7cObject7discardEPS_(%class.cObject* %this, %class.cObject* %object) #2 align 2 {
  %1 = call signext i8 @_ZNK7cObject7storageEv(%class.cObject* %object)
  %2 = sext i8 %1 to i32
  %3 = icmp eq i32 %2, 68
  br i1 %3, label %4, label %12

; <label>:4                                       ; preds = %0
  %5 = icmp eq %class.cObject* %object, null
  br i1 %5, label %11, label %6

; <label>:6                                       ; preds = %4
  %7 = bitcast %class.cObject* %object to void (%class.cObject*)***
  %8 = load void (%class.cObject*)*** %7
  %9 = getelementptr inbounds void (%class.cObject*)** %8, i64 1
  %10 = load void (%class.cObject*)** %9
  call void %10(%class.cObject* %object)
  br label %11

; <label>:11                                      ; preds = %6, %4
  br label %13

; <label>:12                                      ; preds = %0
  call void @_ZN7cObject8setOwnerEPS_(%class.cObject* %object, %class.cObject* null)
  br label %13

; <label>:13                                      ; preds = %12, %11
  ret void
}

declare dereferenceable(56) %class.cObject* @_ZN7cObjectaSERKS_(%class.cObject*, %class.cObject* dereferenceable(56)) #0

; Function Attrs: uwtable
define linkonce_odr void @_ZN7cObject4takeEPS_(%class.cObject* %this, %class.cObject* %object) #2 align 2 {
  call void @_ZN7cObject8setOwnerEPS_(%class.cObject* %object, %class.cObject* %this)
  ret void
}

declare void @qsort(i8*, i64, i64, i32 (i8*, i8*)*) #0

; Function Attrs: uwtable
define internal i32 @_ZL14qsort_cmp_msgsPKvS0_(i8* %p1, i8* %p2) #2 {
  %1 = bitcast i8* %p1 to %class.cMessage**
  %2 = load %class.cMessage** %1, align 8
  %3 = bitcast i8* %p2 to %class.cMessage**
  %4 = load %class.cMessage** %3, align 8
  %5 = call double @_ZNK8cMessage11arrivalTimeEv(%class.cMessage* %2)
  %6 = call double @_ZNK8cMessage11arrivalTimeEv(%class.cMessage* %4)
  %7 = fsub double %5, %6
  %8 = fcmp olt double %7, 0.000000e+00
  br i1 %8, label %9, label %10

; <label>:9                                       ; preds = %0
  br label %25

; <label>:10                                      ; preds = %0
  %11 = fcmp ogt double %7, 0.000000e+00
  br i1 %11, label %12, label %13

; <label>:12                                      ; preds = %10
  br label %25

; <label>:13                                      ; preds = %10
  br label %14

; <label>:14                                      ; preds = %13
  %15 = call i32 @_ZNK8cMessage8priorityEv(%class.cMessage* %2)
  %16 = call i32 @_ZNK8cMessage8priorityEv(%class.cMessage* %4)
  %17 = sub nsw i32 %15, %16
  %18 = icmp ne i32 %17, 0
  br i1 %18, label %19, label %20

; <label>:19                                      ; preds = %14
  br label %25

; <label>:20                                      ; preds = %14
  %21 = call i64 @_ZNK8cMessage11insertOrderEv(%class.cMessage* %2)
  %22 = call i64 @_ZNK8cMessage11insertOrderEv(%class.cMessage* %4)
  %23 = icmp ult i64 %21, %22
  %24 = select i1 %23, i32 -1, i32 1
  br label %25

; <label>:25                                      ; preds = %20, %19, %12, %9
  %.0 = phi i32 [ -1, %9 ], [ 1, %12 ], [ %17, %19 ], [ %24, %20 ]
  ret i32 %.0
}

; Function Attrs: uwtable
define void @_ZN12cMessageHeap6insertEP8cMessage(%class.cMessageHeap* %this, %class.cMessage* %event) #2 align 2 {
  %1 = getelementptr inbounds %class.cMessageHeap* %this, i32 0, i32 4
  %2 = load i64* %1, align 8
  %3 = add i64 %2, 1
  store i64 %3, i64* %1, align 8
  %4 = getelementptr inbounds %class.cMessage* %event, i32 0, i32 17
  store i64 %2, i64* %4, align 8
  %5 = getelementptr inbounds %class.cMessageHeap* %this, i32 0, i32 2
  %6 = load i32* %5, align 4
  %7 = add nsw i32 %6, 1
  store i32 %7, i32* %5, align 4
  %8 = getelementptr inbounds %class.cMessageHeap* %this, i32 0, i32 3
  %9 = load i32* %8, align 4
  %10 = icmp sgt i32 %7, %9
  br i1 %10, label %11, label %48

; <label>:11                                      ; preds = %0
  %12 = getelementptr inbounds %class.cMessageHeap* %this, i32 0, i32 3
  %13 = load i32* %12, align 4
  %14 = mul nsw i32 %13, 2
  store i32 %14, i32* %12, align 4
  %15 = getelementptr inbounds %class.cMessageHeap* %this, i32 0, i32 3
  %16 = load i32* %15, align 4
  %17 = add nsw i32 %16, 1
  %18 = sext i32 %17 to i64
  %19 = call { i64, i1 } @llvm.umul.with.overflow.i64(i64 %18, i64 8)
  %20 = extractvalue { i64, i1 } %19, 1
  %21 = extractvalue { i64, i1 } %19, 0
  %22 = select i1 %20, i64 -1, i64 %21
  %23 = call noalias i8* @_Znam(i64 %22) #12
  %24 = bitcast i8* %23 to %class.cMessage**
  br label %25

; <label>:25                                      ; preds = %38, %11
  %i.0 = phi i32 [ 1, %11 ], [ %39, %38 ]
  %26 = getelementptr inbounds %class.cMessageHeap* %this, i32 0, i32 2
  %27 = load i32* %26, align 4
  %28 = sub nsw i32 %27, 1
  %29 = icmp sle i32 %i.0, %28
  br i1 %29, label %30, label %40

; <label>:30                                      ; preds = %25
  %31 = sext i32 %i.0 to i64
  %32 = getelementptr inbounds %class.cMessageHeap* %this, i32 0, i32 1
  %33 = load %class.cMessage*** %32, align 8
  %34 = getelementptr inbounds %class.cMessage** %33, i64 %31
  %35 = load %class.cMessage** %34, align 8
  %36 = sext i32 %i.0 to i64
  %37 = getelementptr inbounds %class.cMessage** %24, i64 %36
  store %class.cMessage* %35, %class.cMessage** %37, align 8
  br label %38

; <label>:38                                      ; preds = %30
  %39 = add nsw i32 %i.0, 1
  br label %25

; <label>:40                                      ; preds = %25
  %41 = getelementptr inbounds %class.cMessageHeap* %this, i32 0, i32 1
  %42 = load %class.cMessage*** %41, align 8
  %43 = icmp eq %class.cMessage** %42, null
  br i1 %43, label %46, label %44

; <label>:44                                      ; preds = %40
  %45 = bitcast %class.cMessage** %42 to i8*
  call void @_ZdaPv(i8* %45) #11
  br label %46

; <label>:46                                      ; preds = %44, %40
  %47 = getelementptr inbounds %class.cMessageHeap* %this, i32 0, i32 1
  store %class.cMessage** %24, %class.cMessage*** %47, align 8
  br label %48

; <label>:48                                      ; preds = %46, %0
  %49 = bitcast %class.cMessageHeap* %this to %class.cObject*
  %50 = call zeroext i1 @_ZNK7cObject13takeOwnershipEv(%class.cObject* %49)
  br i1 %50, label %51, label %54

; <label>:51                                      ; preds = %48
  %52 = bitcast %class.cMessageHeap* %this to %class.cObject*
  %53 = bitcast %class.cMessage* %event to %class.cObject*
  call void @_ZN7cObject4takeEPS_(%class.cObject* %52, %class.cObject* %53)
  br label %54

; <label>:54                                      ; preds = %51, %48
  %55 = getelementptr inbounds %class.cMessageHeap* %this, i32 0, i32 2
  %56 = load i32* %55, align 4
  br label %57

; <label>:57                                      ; preds = %80, %54
  %j.0 = phi i32 [ %56, %54 ], [ %60, %80 ]
  %58 = icmp sgt i32 %j.0, 1
  br i1 %58, label %59, label %81

; <label>:59                                      ; preds = %57
  %60 = sdiv i32 %j.0, 2
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds %class.cMessageHeap* %this, i32 0, i32 1
  %63 = load %class.cMessage*** %62, align 8
  %64 = getelementptr inbounds %class.cMessage** %63, i64 %61
  %65 = load %class.cMessage** %64, align 8
  %66 = call i32 @_ZleR8cMessageS0_(%class.cMessage* dereferenceable(168) %65, %class.cMessage* dereferenceable(168) %event)
  %67 = icmp ne i32 %66, 0
  br i1 %67, label %68, label %69

; <label>:68                                      ; preds = %59
  br label %81

; <label>:69                                      ; preds = %59
  %70 = sext i32 %60 to i64
  %71 = getelementptr inbounds %class.cMessageHeap* %this, i32 0, i32 1
  %72 = load %class.cMessage*** %71, align 8
  %73 = getelementptr inbounds %class.cMessage** %72, i64 %70
  %74 = load %class.cMessage** %73, align 8
  %75 = sext i32 %j.0 to i64
  %76 = getelementptr inbounds %class.cMessageHeap* %this, i32 0, i32 1
  %77 = load %class.cMessage*** %76, align 8
  %78 = getelementptr inbounds %class.cMessage** %77, i64 %75
  store %class.cMessage* %74, %class.cMessage** %78, align 8
  %79 = getelementptr inbounds %class.cMessage* %74, i32 0, i32 16
  store i32 %j.0, i32* %79, align 4
  br label %80

; <label>:80                                      ; preds = %69
  br label %57

; <label>:81                                      ; preds = %68, %57
  %82 = sext i32 %j.0 to i64
  %83 = getelementptr inbounds %class.cMessageHeap* %this, i32 0, i32 1
  %84 = load %class.cMessage*** %83, align 8
  %85 = getelementptr inbounds %class.cMessage** %84, i64 %82
  store %class.cMessage* %event, %class.cMessage** %85, align 8
  %86 = getelementptr inbounds %class.cMessage* %event, i32 0, i32 16
  store i32 %j.0, i32* %86, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define linkonce_odr zeroext i1 @_ZNK7cObject13takeOwnershipEv(%class.cObject* %this) #7 align 2 {
  %1 = getelementptr inbounds %class.cObject* %this, i32 0, i32 3
  %2 = load i8* %1, align 1
  %3 = trunc i8 %2 to i1
  ret i1 %3
}

; Function Attrs: inlinehint uwtable
define linkonce_odr i32 @_ZleR8cMessageS0_(%class.cMessage* dereferenceable(168) %a, %class.cMessage* dereferenceable(168) %b) #10 {
  %1 = call double @_ZNK8cMessage11arrivalTimeEv(%class.cMessage* %a)
  %2 = call double @_ZNK8cMessage11arrivalTimeEv(%class.cMessage* %b)
  %3 = fcmp olt double %1, %2
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  br label %31

; <label>:5                                       ; preds = %0
  %6 = call double @_ZNK8cMessage11arrivalTimeEv(%class.cMessage* %a)
  %7 = call double @_ZNK8cMessage11arrivalTimeEv(%class.cMessage* %b)
  %8 = fcmp ogt double %6, %7
  br i1 %8, label %9, label %10

; <label>:9                                       ; preds = %5
  br label %29

; <label>:10                                      ; preds = %5
  %11 = call i32 @_ZNK8cMessage8priorityEv(%class.cMessage* %a)
  %12 = call i32 @_ZNK8cMessage8priorityEv(%class.cMessage* %b)
  %13 = icmp slt i32 %11, %12
  br i1 %13, label %14, label %15

; <label>:14                                      ; preds = %10
  br label %27

; <label>:15                                      ; preds = %10
  %16 = call i32 @_ZNK8cMessage8priorityEv(%class.cMessage* %a)
  %17 = call i32 @_ZNK8cMessage8priorityEv(%class.cMessage* %b)
  %18 = icmp sgt i32 %16, %17
  br i1 %18, label %19, label %20

; <label>:19                                      ; preds = %15
  br label %25

; <label>:20                                      ; preds = %15
  %21 = call i64 @_ZNK8cMessage11insertOrderEv(%class.cMessage* %a)
  %22 = call i64 @_ZNK8cMessage11insertOrderEv(%class.cMessage* %b)
  %23 = icmp ule i64 %21, %22
  %24 = zext i1 %23 to i32
  br label %25

; <label>:25                                      ; preds = %20, %19
  %26 = phi i32 [ 0, %19 ], [ %24, %20 ]
  br label %27

; <label>:27                                      ; preds = %25, %14
  %28 = phi i32 [ 1, %14 ], [ %26, %25 ]
  br label %29

; <label>:29                                      ; preds = %27, %9
  %30 = phi i32 [ 0, %9 ], [ %28, %27 ]
  br label %31

; <label>:31                                      ; preds = %29, %4
  %32 = phi i32 [ 1, %4 ], [ %30, %29 ]
  ret i32 %32
}

; Function Attrs: uwtable
define void @_ZN12cMessageHeap7shiftupEi(%class.cMessageHeap* %this, i32 %from) #2 align 2 {
  br label %1

; <label>:1                                       ; preds = %61, %0
  %i.0 = phi i32 [ %from, %0 ], [ %j.0, %61 ]
  %2 = mul nsw i32 2, %i.0
  %3 = getelementptr inbounds %class.cMessageHeap* %this, i32 0, i32 2
  %4 = load i32* %3, align 4
  %5 = icmp sle i32 %2, %4
  br i1 %5, label %6, label %62

; <label>:6                                       ; preds = %1
  %7 = getelementptr inbounds %class.cMessageHeap* %this, i32 0, i32 2
  %8 = load i32* %7, align 4
  %9 = icmp slt i32 %2, %8
  br i1 %9, label %10, label %26

; <label>:10                                      ; preds = %6
  %11 = sext i32 %2 to i64
  %12 = getelementptr inbounds %class.cMessageHeap* %this, i32 0, i32 1
  %13 = load %class.cMessage*** %12, align 8
  %14 = getelementptr inbounds %class.cMessage** %13, i64 %11
  %15 = load %class.cMessage** %14, align 8
  %16 = add nsw i32 %2, 1
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds %class.cMessageHeap* %this, i32 0, i32 1
  %19 = load %class.cMessage*** %18, align 8
  %20 = getelementptr inbounds %class.cMessage** %19, i64 %17
  %21 = load %class.cMessage** %20, align 8
  %22 = call i32 @_ZgtR8cMessageS0_(%class.cMessage* dereferenceable(168) %15, %class.cMessage* dereferenceable(168) %21)
  %23 = icmp ne i32 %22, 0
  br i1 %23, label %24, label %26

; <label>:24                                      ; preds = %10
  %25 = add nsw i32 %2, 1
  br label %26

; <label>:26                                      ; preds = %24, %10, %6
  %j.0 = phi i32 [ %25, %24 ], [ %2, %10 ], [ %2, %6 ]
  %27 = sext i32 %i.0 to i64
  %28 = getelementptr inbounds %class.cMessageHeap* %this, i32 0, i32 1
  %29 = load %class.cMessage*** %28, align 8
  %30 = getelementptr inbounds %class.cMessage** %29, i64 %27
  %31 = load %class.cMessage** %30, align 8
  %32 = sext i32 %j.0 to i64
  %33 = getelementptr inbounds %class.cMessageHeap* %this, i32 0, i32 1
  %34 = load %class.cMessage*** %33, align 8
  %35 = getelementptr inbounds %class.cMessage** %34, i64 %32
  %36 = load %class.cMessage** %35, align 8
  %37 = call i32 @_ZgtR8cMessageS0_(%class.cMessage* dereferenceable(168) %31, %class.cMessage* dereferenceable(168) %36)
  %38 = icmp ne i32 %37, 0
  br i1 %38, label %39, label %60

; <label>:39                                      ; preds = %26
  %40 = sext i32 %j.0 to i64
  %41 = getelementptr inbounds %class.cMessageHeap* %this, i32 0, i32 1
  %42 = load %class.cMessage*** %41, align 8
  %43 = getelementptr inbounds %class.cMessage** %42, i64 %40
  %44 = load %class.cMessage** %43, align 8
  %45 = sext i32 %i.0 to i64
  %46 = getelementptr inbounds %class.cMessageHeap* %this, i32 0, i32 1
  %47 = load %class.cMessage*** %46, align 8
  %48 = getelementptr inbounds %class.cMessage** %47, i64 %45
  %49 = load %class.cMessage** %48, align 8
  %50 = sext i32 %j.0 to i64
  %51 = getelementptr inbounds %class.cMessageHeap* %this, i32 0, i32 1
  %52 = load %class.cMessage*** %51, align 8
  %53 = getelementptr inbounds %class.cMessage** %52, i64 %50
  store %class.cMessage* %49, %class.cMessage** %53, align 8
  %54 = getelementptr inbounds %class.cMessage* %49, i32 0, i32 16
  store i32 %j.0, i32* %54, align 4
  %55 = sext i32 %i.0 to i64
  %56 = getelementptr inbounds %class.cMessageHeap* %this, i32 0, i32 1
  %57 = load %class.cMessage*** %56, align 8
  %58 = getelementptr inbounds %class.cMessage** %57, i64 %55
  store %class.cMessage* %44, %class.cMessage** %58, align 8
  %59 = getelementptr inbounds %class.cMessage* %44, i32 0, i32 16
  store i32 %i.0, i32* %59, align 4
  br label %61

; <label>:60                                      ; preds = %26
  br label %62

; <label>:61                                      ; preds = %39
  br label %1

; <label>:62                                      ; preds = %60, %1
  ret void
}

; Function Attrs: inlinehint uwtable
define linkonce_odr i32 @_ZgtR8cMessageS0_(%class.cMessage* dereferenceable(168) %a, %class.cMessage* dereferenceable(168) %b) #10 {
  %1 = call i32 @_ZleR8cMessageS0_(%class.cMessage* dereferenceable(168) %a, %class.cMessage* dereferenceable(168) %b)
  %2 = icmp ne i32 %1, 0
  %3 = xor i1 %2, true
  %4 = zext i1 %3 to i32
  ret i32 %4
}

; Function Attrs: nounwind uwtable
define %class.cMessage* @_ZNK12cMessageHeap9peekFirstEv(%class.cMessageHeap* %this) #7 align 2 {
  %1 = getelementptr inbounds %class.cMessageHeap* %this, i32 0, i32 2
  %2 = load i32* %1, align 4
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  br label %10

; <label>:5                                       ; preds = %0
  %6 = getelementptr inbounds %class.cMessageHeap* %this, i32 0, i32 1
  %7 = load %class.cMessage*** %6, align 8
  %8 = getelementptr inbounds %class.cMessage** %7, i64 1
  %9 = load %class.cMessage** %8, align 8
  br label %10

; <label>:10                                      ; preds = %5, %4
  %11 = phi %class.cMessage* [ null, %4 ], [ %9, %5 ]
  ret %class.cMessage* %11
}

; Function Attrs: uwtable
define %class.cMessage* @_ZN12cMessageHeap8getFirstEv(%class.cMessageHeap* %this) #2 align 2 {
  %1 = getelementptr inbounds %class.cMessageHeap* %this, i32 0, i32 2
  %2 = load i32* %1, align 4
  %3 = icmp sgt i32 %2, 0
  br i1 %3, label %4, label %30

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds %class.cMessageHeap* %this, i32 0, i32 1
  %6 = load %class.cMessage*** %5, align 8
  %7 = getelementptr inbounds %class.cMessage** %6, i64 1
  %8 = load %class.cMessage** %7, align 8
  %9 = getelementptr inbounds %class.cMessageHeap* %this, i32 0, i32 2
  %10 = load i32* %9, align 4
  %11 = add nsw i32 %10, -1
  store i32 %11, i32* %9, align 4
  %12 = sext i32 %10 to i64
  %13 = getelementptr inbounds %class.cMessageHeap* %this, i32 0, i32 1
  %14 = load %class.cMessage*** %13, align 8
  %15 = getelementptr inbounds %class.cMessage** %14, i64 %12
  %16 = load %class.cMessage** %15, align 8
  %17 = getelementptr inbounds %class.cMessageHeap* %this, i32 0, i32 1
  %18 = load %class.cMessage*** %17, align 8
  %19 = getelementptr inbounds %class.cMessage** %18, i64 1
  store %class.cMessage* %16, %class.cMessage** %19, align 8
  %20 = getelementptr inbounds %class.cMessage* %16, i32 0, i32 16
  store i32 1, i32* %20, align 4
  call void @_ZN12cMessageHeap7shiftupEi(%class.cMessageHeap* %this, i32 1)
  %21 = bitcast %class.cMessage* %8 to %class.cObject*
  %22 = call %class.cObject* @_ZNK7cObject5ownerEv(%class.cObject* %21)
  %23 = bitcast %class.cMessageHeap* %this to %class.cObject*
  %24 = icmp eq %class.cObject* %22, %23
  br i1 %24, label %25, label %28

; <label>:25                                      ; preds = %4
  %26 = bitcast %class.cMessageHeap* %this to %class.cObject*
  %27 = bitcast %class.cMessage* %8 to %class.cObject*
  call void @_ZN7cObject4dropEPS_(%class.cObject* %26, %class.cObject* %27)
  br label %28

; <label>:28                                      ; preds = %25, %4
  %29 = getelementptr inbounds %class.cMessage* %8, i32 0, i32 16
  store i32 -1, i32* %29, align 4
  br label %31

; <label>:30                                      ; preds = %0
  br label %31

; <label>:31                                      ; preds = %30, %28
  %.0 = phi %class.cMessage* [ %8, %28 ], [ null, %30 ]
  ret %class.cMessage* %.0
}

; Function Attrs: uwtable
define linkonce_odr void @_ZN7cObject4dropEPS_(%class.cObject* %this, %class.cObject* %object) #2 align 2 {
  %1 = bitcast %class.cObject* %object to %class.cObject* (%class.cObject*)***
  %2 = load %class.cObject* (%class.cObject*)*** %1
  %3 = getelementptr inbounds %class.cObject* (%class.cObject*)** %2, i64 6
  %4 = load %class.cObject* (%class.cObject*)** %3
  %5 = call %class.cObject* %4(%class.cObject* %object)
  call void @_ZN7cObject8setOwnerEPS_(%class.cObject* %object, %class.cObject* %5)
  ret void
}

; Function Attrs: uwtable
define %class.cMessage* @_ZN12cMessageHeap3getEP8cMessage(%class.cMessageHeap* %this, %class.cMessage* %event) #2 align 2 {
  %1 = getelementptr inbounds %class.cMessage* %event, i32 0, i32 16
  %2 = load i32* %1, align 4
  %3 = icmp eq i32 %2, -1
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  br label %55

; <label>:5                                       ; preds = %0
  %6 = getelementptr inbounds %class.cMessage* %event, i32 0, i32 16
  %7 = load i32* %6, align 4
  %8 = getelementptr inbounds %class.cMessageHeap* %this, i32 0, i32 2
  %9 = load i32* %8, align 4
  %10 = add nsw i32 %9, -1
  store i32 %10, i32* %8, align 4
  %11 = sext i32 %9 to i64
  %12 = getelementptr inbounds %class.cMessageHeap* %this, i32 0, i32 1
  %13 = load %class.cMessage*** %12, align 8
  %14 = getelementptr inbounds %class.cMessage** %13, i64 %11
  %15 = load %class.cMessage** %14, align 8
  br label %16

; <label>:16                                      ; preds = %29, %5
  %out.0 = phi i32 [ %7, %5 ], [ %17, %29 ]
  %17 = sdiv i32 %out.0, 2
  %18 = icmp ne i32 %17, 0
  br i1 %18, label %19, label %27

; <label>:19                                      ; preds = %16
  %20 = sext i32 %17 to i64
  %21 = getelementptr inbounds %class.cMessageHeap* %this, i32 0, i32 1
  %22 = load %class.cMessage*** %21, align 8
  %23 = getelementptr inbounds %class.cMessage** %22, i64 %20
  %24 = load %class.cMessage** %23, align 8
  %25 = call i32 @_ZgtR8cMessageS0_(%class.cMessage* dereferenceable(168) %24, %class.cMessage* dereferenceable(168) %15)
  %26 = icmp ne i32 %25, 0
  br label %27

; <label>:27                                      ; preds = %19, %16
  %28 = phi i1 [ false, %16 ], [ %26, %19 ]
  br i1 %28, label %29, label %40

; <label>:29                                      ; preds = %27
  %30 = sext i32 %17 to i64
  %31 = getelementptr inbounds %class.cMessageHeap* %this, i32 0, i32 1
  %32 = load %class.cMessage*** %31, align 8
  %33 = getelementptr inbounds %class.cMessage** %32, i64 %30
  %34 = load %class.cMessage** %33, align 8
  %35 = sext i32 %out.0 to i64
  %36 = getelementptr inbounds %class.cMessageHeap* %this, i32 0, i32 1
  %37 = load %class.cMessage*** %36, align 8
  %38 = getelementptr inbounds %class.cMessage** %37, i64 %35
  store %class.cMessage* %34, %class.cMessage** %38, align 8
  %39 = getelementptr inbounds %class.cMessage* %34, i32 0, i32 16
  store i32 %out.0, i32* %39, align 4
  br label %16

; <label>:40                                      ; preds = %27
  %41 = sext i32 %out.0 to i64
  %42 = getelementptr inbounds %class.cMessageHeap* %this, i32 0, i32 1
  %43 = load %class.cMessage*** %42, align 8
  %44 = getelementptr inbounds %class.cMessage** %43, i64 %41
  store %class.cMessage* %15, %class.cMessage** %44, align 8
  %45 = getelementptr inbounds %class.cMessage* %15, i32 0, i32 16
  store i32 %out.0, i32* %45, align 4
  call void @_ZN12cMessageHeap7shiftupEi(%class.cMessageHeap* %this, i32 %out.0)
  %46 = bitcast %class.cMessage* %event to %class.cObject*
  %47 = call %class.cObject* @_ZNK7cObject5ownerEv(%class.cObject* %46)
  %48 = bitcast %class.cMessageHeap* %this to %class.cObject*
  %49 = icmp eq %class.cObject* %47, %48
  br i1 %49, label %50, label %53

; <label>:50                                      ; preds = %40
  %51 = bitcast %class.cMessageHeap* %this to %class.cObject*
  %52 = bitcast %class.cMessage* %event to %class.cObject*
  call void @_ZN7cObject4dropEPS_(%class.cObject* %51, %class.cObject* %52)
  br label %53

; <label>:53                                      ; preds = %50, %40
  %54 = getelementptr inbounds %class.cMessage* %event, i32 0, i32 16
  store i32 -1, i32* %54, align 4
  br label %55

; <label>:55                                      ; preds = %53, %4
  %.0 = phi %class.cMessage* [ null, %4 ], [ %event, %53 ]
  ret %class.cMessage* %.0
}

; Function Attrs: uwtable
define linkonce_odr %class.cObject* @_ZNK12cMessageHeap3dupEv(%class.cMessageHeap* %this) unnamed_addr #2 align 2 {
  %1 = call i8* @_ZN7cObjectnwEm(i64 80)
  %2 = bitcast i8* %1 to %class.cMessageHeap*
  invoke void @_ZN12cMessageHeapC1ERKS_(%class.cMessageHeap* %2, %class.cMessageHeap* dereferenceable(80) %this)
          to label %3 unwind label %5

; <label>:3                                       ; preds = %0
  %4 = bitcast %class.cMessageHeap* %2 to %class.cObject*
  ret %class.cObject* %4

; <label>:5                                       ; preds = %0
  %6 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
  %7 = extractvalue { i8*, i32 } %6, 0
  %8 = extractvalue { i8*, i32 } %6, 1
  call void @_ZdlPv(i8* %1) #11
  br label %9

; <label>:9                                       ; preds = %5
  %10 = insertvalue { i8*, i32 } undef, i8* %7, 0
  %11 = insertvalue { i8*, i32 } %10, i32 %8, 1
  resume { i8*, i32 } %11
}

; Function Attrs: uwtable
define linkonce_odr i8* @_ZNK7cObject8fullNameEv(%class.cObject* %this) unnamed_addr #2 align 2 {
  %1 = call i8* @_ZNK7cObject4nameEv(%class.cObject* %this)
  ret i8* %1
}

declare i8* @_ZNK7cObject8fullPathEv(%class.cObject*) #0

declare i8* @_ZNK7cObject8fullPathEPci(%class.cObject*, i8*, i32) #0

declare %class.cObject* @_ZNK7cObject12defaultOwnerEv(%class.cObject*) #0

declare i8* @_ZNK7cObject9classNameEv(%class.cObject*) #0

declare void @_ZN7cObject7writeToERSo(%class.cObject*, %"class.std::basic_ostream"* dereferenceable(272)) #0

declare void @_ZN7cObject13writeContentsERSo(%class.cObject*, %"class.std::basic_ostream"* dereferenceable(272)) #0

declare i32 @_ZN7cObject7netPackEv(%class.cObject*) #0

declare i32 @_ZN7cObject9netUnpackEv(%class.cObject*) #0

declare void @_ZN7cObject8setOwnerEPS_(%class.cObject*, %class.cObject*) #0

; Function Attrs: nounwind uwtable
define linkonce_odr i32 @_ZNK8cMessage8priorityEv(%class.cMessage* %this) #7 align 2 {
  %1 = getelementptr inbounds %class.cMessage* %this, i32 0, i32 2
  %2 = load i32* %1, align 4
  ret i32 %2
}

; Function Attrs: nounwind uwtable
define linkonce_odr i64 @_ZNK8cMessage11insertOrderEv(%class.cMessage* %this) #7 align 2 {
  %1 = getelementptr inbounds %class.cMessage* %this, i32 0, i32 17
  %2 = load i64* %1, align 8
  ret i64 %2
}

; Function Attrs: nounwind uwtable
define linkonce_odr signext i8 @_ZNK7cObject7storageEv(%class.cObject* %this) #7 align 2 {
  %1 = getelementptr inbounds %class.cObject* %this, i32 0, i32 2
  %2 = load i8* %1, align 1
  ret i8 %2
}

declare i8* @_Z10opp_strdupPKc(i8*) #0

declare void @_ZN14cClassRegisterC1EPKcPFPvvE(%class.cClassRegister*, i8*, i8* ()*) #0

define internal void @_GLOBAL__sub_I_cmsgheap.cc() section ".text.startup" {
  call void @__cxx_global_var_init()
  call void @__cxx_global_var_init1()
  ret void
}

attributes #0 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nobuiltin nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone }
attributes #5 = { nobuiltin "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { noinline noreturn nounwind }
attributes #7 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #9 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #10 = { inlinehint uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #11 = { builtin nounwind }
attributes #12 = { builtin }
attributes #13 = { noreturn nounwind }
attributes #14 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
