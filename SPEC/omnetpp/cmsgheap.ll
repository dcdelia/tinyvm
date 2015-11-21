; ModuleID = 'cmsgheap.cc'
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
  %1 = alloca i8*
  %2 = alloca i32
  %3 = call i8* @_ZN7cObjectnwEm(i64 80)
  %4 = bitcast i8* %3 to %class.cMessageHeap*
  invoke void @_ZN12cMessageHeapC1EPKci(%class.cMessageHeap* %4, i8* null, i32 128)
          to label %5 unwind label %7

; <label>:5                                       ; preds = %0
  %6 = bitcast %class.cMessageHeap* %4 to i8*
  ret i8* %6

; <label>:7                                       ; preds = %0
  %8 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
  %9 = extractvalue { i8*, i32 } %8, 0
  store i8* %9, i8** %1
  %10 = extractvalue { i8*, i32 } %8, 1
  store i32 %10, i32* %2
  call void @_ZdlPv(i8* %3) #11
  br label %11

; <label>:11                                      ; preds = %7
  %12 = load i8** %1
  %13 = load i32* %2
  %14 = insertvalue { i8*, i32 } undef, i8* %12, 0
  %15 = insertvalue { i8*, i32 } %14, i32 %13, 1
  resume { i8*, i32 } %15
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
  %1 = alloca i8*
  %2 = alloca i32
  %3 = call i8* @_ZN7cObjectnwEm(i64 64)
  %4 = bitcast i8* %3 to %class.cClassRegister*
  invoke void @_ZN14cClassRegisterC1EPKcPFPvvE(%class.cClassRegister* %4, i8* getelementptr inbounds ([13 x i8]* @.str4, i32 0, i32 0), i8* ()* @_Z20cMessageHeap__createv)
          to label %5 unwind label %7

; <label>:5                                       ; preds = %0
  %6 = bitcast %class.cClassRegister* %4 to %class.cObject*
  call void @_ZN7cObject8setOwnerEPS_(%class.cObject* %6, %class.cObject* getelementptr inbounds (%class.cHead* @classes, i32 0, i32 0))
  ret void

; <label>:7                                       ; preds = %0
  %8 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
  %9 = extractvalue { i8*, i32 } %8, 0
  store i8* %9, i8** %1
  %10 = extractvalue { i8*, i32 } %8, 1
  store i32 %10, i32* %2
  call void @_ZdlPv(i8* %3) #11
  br label %11

; <label>:11                                      ; preds = %7
  %12 = load i8** %1
  %13 = load i32* %2
  %14 = insertvalue { i8*, i32 } undef, i8* %12, 0
  %15 = insertvalue { i8*, i32 } %14, i32 %13, 1
  resume { i8*, i32 } %15
}

declare void @_ZN16ExecuteOnStartupC1EPFvvE(%class.ExecuteOnStartup*, void ()*) #0

declare void @_ZN16ExecuteOnStartupD1Ev(%class.ExecuteOnStartup*) #0

; Function Attrs: uwtable
define void @_ZN12cMessageHeapC2EPKci(%class.cMessageHeap* %this, i8* %name, i32 %siz) unnamed_addr #2 align 2 {
  %1 = alloca %class.cMessageHeap*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i8*
  %5 = alloca i32
  store %class.cMessageHeap* %this, %class.cMessageHeap** %1, align 8
  store i8* %name, i8** %2, align 8
  store i32 %siz, i32* %3, align 4
  %6 = load %class.cMessageHeap** %1
  %7 = bitcast %class.cMessageHeap* %6 to %class.cObject*
  %8 = load i8** %2, align 8
  call void @_ZN7cObjectC2EPKc(%class.cObject* %7, i8* %8)
  %9 = bitcast %class.cMessageHeap* %6 to i32 (...)***
  store i32 (...)** bitcast (i8** getelementptr inbounds ([16 x i8*]* @_ZTV12cMessageHeap, i64 0, i64 2) to i32 (...)**), i32 (...)*** %9
  %10 = getelementptr inbounds %class.cMessageHeap* %6, i32 0, i32 4
  store i64 0, i64* %10, align 8
  %11 = getelementptr inbounds %class.cMessageHeap* %6, i32 0, i32 2
  store i32 0, i32* %11, align 4
  %12 = load i32* %3, align 4
  %13 = getelementptr inbounds %class.cMessageHeap* %6, i32 0, i32 3
  store i32 %12, i32* %13, align 4
  %14 = getelementptr inbounds %class.cMessageHeap* %6, i32 0, i32 3
  %15 = load i32* %14, align 4
  %16 = add nsw i32 %15, 1
  %17 = sext i32 %16 to i64
  %18 = call { i64, i1 } @llvm.umul.with.overflow.i64(i64 %17, i64 8)
  %19 = extractvalue { i64, i1 } %18, 1
  %20 = extractvalue { i64, i1 } %18, 0
  %21 = select i1 %19, i64 -1, i64 %20
  %22 = invoke noalias i8* @_Znam(i64 %21) #12
          to label %23 unwind label %26

; <label>:23                                      ; preds = %0
  %24 = bitcast i8* %22 to %class.cMessage**
  %25 = getelementptr inbounds %class.cMessageHeap* %6, i32 0, i32 1
  store %class.cMessage** %24, %class.cMessage*** %25, align 8
  ret void

; <label>:26                                      ; preds = %0
  %27 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
  %28 = extractvalue { i8*, i32 } %27, 0
  store i8* %28, i8** %4
  %29 = extractvalue { i8*, i32 } %27, 1
  store i32 %29, i32* %5
  %30 = bitcast %class.cMessageHeap* %6 to %class.cObject*
  invoke void @_ZN7cObjectD2Ev(%class.cObject* %30)
          to label %31 unwind label %37

; <label>:31                                      ; preds = %26
  br label %32

; <label>:32                                      ; preds = %31
  %33 = load i8** %4
  %34 = load i32* %5
  %35 = insertvalue { i8*, i32 } undef, i8* %33, 0
  %36 = insertvalue { i8*, i32 } %35, i32 %34, 1
  resume { i8*, i32 } %36

; <label>:37                                      ; preds = %26
  %38 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          catch i8* null
  %39 = extractvalue { i8*, i32 } %38, 0
  call void @__clang_call_terminate(i8* %39) #13
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
  %1 = alloca %class.cMessageHeap*, align 8
  %2 = alloca %class.cMessageHeap*, align 8
  %3 = alloca i8*
  %4 = alloca i32
  store %class.cMessageHeap* %this, %class.cMessageHeap** %1, align 8
  store %class.cMessageHeap* %heap, %class.cMessageHeap** %2, align 8
  %5 = load %class.cMessageHeap** %1
  %6 = bitcast %class.cMessageHeap* %5 to %class.cObject*
  call void @_ZN7cObjectC2Ev(%class.cObject* %6)
  %7 = bitcast %class.cMessageHeap* %5 to i32 (...)***
  store i32 (...)** bitcast (i8** getelementptr inbounds ([16 x i8*]* @_ZTV12cMessageHeap, i64 0, i64 2) to i32 (...)**), i32 (...)*** %7
  %8 = getelementptr inbounds %class.cMessageHeap* %5, i32 0, i32 1
  store %class.cMessage** null, %class.cMessage*** %8, align 8
  %9 = getelementptr inbounds %class.cMessageHeap* %5, i32 0, i32 2
  store i32 0, i32* %9, align 4
  %10 = bitcast %class.cMessageHeap* %5 to %class.cObject*
  %11 = load %class.cMessageHeap** %2, align 8
  %12 = bitcast %class.cMessageHeap* %11 to %class.cObject*
  %13 = invoke i8* @_ZNK7cObject4nameEv(%class.cObject* %12)
          to label %14 unwind label %19

; <label>:14                                      ; preds = %0
  invoke void @_ZN7cObject7setNameEPKc(%class.cObject* %10, i8* %13)
          to label %15 unwind label %19

; <label>:15                                      ; preds = %14
  %16 = load %class.cMessageHeap** %2, align 8
  %17 = invoke dereferenceable(80) %class.cMessageHeap* @_ZN12cMessageHeapaSERKS_(%class.cMessageHeap* %5, %class.cMessageHeap* dereferenceable(80) %16)
          to label %18 unwind label %19

; <label>:18                                      ; preds = %15
  ret void

; <label>:19                                      ; preds = %15, %14, %0
  %20 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
  %21 = extractvalue { i8*, i32 } %20, 0
  store i8* %21, i8** %3
  %22 = extractvalue { i8*, i32 } %20, 1
  store i32 %22, i32* %4
  %23 = bitcast %class.cMessageHeap* %5 to %class.cObject*
  invoke void @_ZN7cObjectD2Ev(%class.cObject* %23)
          to label %24 unwind label %30

; <label>:24                                      ; preds = %19
  br label %25

; <label>:25                                      ; preds = %24
  %26 = load i8** %3
  %27 = load i32* %4
  %28 = insertvalue { i8*, i32 } undef, i8* %26, 0
  %29 = insertvalue { i8*, i32 } %28, i32 %27, 1
  resume { i8*, i32 } %29

; <label>:30                                      ; preds = %19
  %31 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          catch i8* null
  %32 = extractvalue { i8*, i32 } %31, 0
  call void @__clang_call_terminate(i8* %32) #13
  unreachable
}

declare void @_ZN7cObjectC2Ev(%class.cObject*) #0

; Function Attrs: uwtable
define linkonce_odr void @_ZN7cObject7setNameEPKc(%class.cObject* %this, i8* %s) #2 align 2 {
  %1 = alloca %class.cObject*, align 8
  %2 = alloca i8*, align 8
  store %class.cObject* %this, %class.cObject** %1, align 8
  store i8* %s, i8** %2, align 8
  %3 = load %class.cObject** %1
  %4 = getelementptr inbounds %class.cObject* %3, i32 0, i32 1
  %5 = load i8** %4, align 8
  %6 = icmp eq i8* %5, null
  br i1 %6, label %8, label %7

; <label>:7                                       ; preds = %0
  call void @_ZdlPv(i8* %5) #11
  br label %8

; <label>:8                                       ; preds = %7, %0
  %9 = load i8** %2, align 8
  %10 = call i8* @_Z10opp_strdupPKc(i8* %9)
  %11 = getelementptr inbounds %class.cObject* %3, i32 0, i32 1
  store i8* %10, i8** %11, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define linkonce_odr i8* @_ZNK7cObject4nameEv(%class.cObject* %this) #7 align 2 {
  %1 = alloca %class.cObject*, align 8
  store %class.cObject* %this, %class.cObject** %1, align 8
  %2 = load %class.cObject** %1
  %3 = getelementptr inbounds %class.cObject* %2, i32 0, i32 1
  %4 = load i8** %3, align 8
  %5 = icmp ne i8* %4, null
  br i1 %5, label %6, label %9

; <label>:6                                       ; preds = %0
  %7 = getelementptr inbounds %class.cObject* %2, i32 0, i32 1
  %8 = load i8** %7, align 8
  br label %10

; <label>:9                                       ; preds = %0
  br label %10

; <label>:10                                      ; preds = %9, %6
  %11 = phi i8* [ %8, %6 ], [ getelementptr inbounds ([1 x i8]* @.str3, i32 0, i32 0), %9 ]
  ret i8* %11
}

; Function Attrs: uwtable
define dereferenceable(80) %class.cMessageHeap* @_ZN12cMessageHeapaSERKS_(%class.cMessageHeap* %this, %class.cMessageHeap* dereferenceable(80) %heap) #2 align 2 {
  %1 = alloca %class.cMessageHeap*, align 8
  %2 = alloca %class.cMessageHeap*, align 8
  %3 = alloca %class.cMessageHeap*, align 8
  %i = alloca i32, align 4
  store %class.cMessageHeap* %this, %class.cMessageHeap** %2, align 8
  store %class.cMessageHeap* %heap, %class.cMessageHeap** %3, align 8
  %4 = load %class.cMessageHeap** %2
  %5 = load %class.cMessageHeap** %3, align 8
  %6 = icmp eq %class.cMessageHeap* %4, %5
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %0
  store %class.cMessageHeap* %4, %class.cMessageHeap** %1
  br label %95

; <label>:8                                       ; preds = %0
  call void @_ZN12cMessageHeap5clearEv(%class.cMessageHeap* %4)
  %9 = bitcast %class.cMessageHeap* %4 to %class.cObject*
  %10 = load %class.cMessageHeap** %3, align 8
  %11 = bitcast %class.cMessageHeap* %10 to %class.cObject*
  %12 = call dereferenceable(56) %class.cObject* @_ZN7cObjectaSERKS_(%class.cObject* %9, %class.cObject* dereferenceable(56) %11)
  %13 = load %class.cMessageHeap** %3, align 8
  %14 = getelementptr inbounds %class.cMessageHeap* %13, i32 0, i32 2
  %15 = load i32* %14, align 4
  %16 = getelementptr inbounds %class.cMessageHeap* %4, i32 0, i32 2
  store i32 %15, i32* %16, align 4
  %17 = load %class.cMessageHeap** %3, align 8
  %18 = getelementptr inbounds %class.cMessageHeap* %17, i32 0, i32 3
  %19 = load i32* %18, align 4
  %20 = getelementptr inbounds %class.cMessageHeap* %4, i32 0, i32 3
  store i32 %19, i32* %20, align 4
  %21 = getelementptr inbounds %class.cMessageHeap* %4, i32 0, i32 1
  %22 = load %class.cMessage*** %21, align 8
  %23 = icmp eq %class.cMessage** %22, null
  br i1 %23, label %26, label %24

; <label>:24                                      ; preds = %8
  %25 = bitcast %class.cMessage** %22 to i8*
  call void @_ZdaPv(i8* %25) #11
  br label %26

; <label>:26                                      ; preds = %24, %8
  %27 = getelementptr inbounds %class.cMessageHeap* %4, i32 0, i32 3
  %28 = load i32* %27, align 4
  %29 = add nsw i32 %28, 1
  %30 = sext i32 %29 to i64
  %31 = call { i64, i1 } @llvm.umul.with.overflow.i64(i64 %30, i64 8)
  %32 = extractvalue { i64, i1 } %31, 1
  %33 = extractvalue { i64, i1 } %31, 0
  %34 = select i1 %32, i64 -1, i64 %33
  %35 = call noalias i8* @_Znam(i64 %34) #12
  %36 = bitcast i8* %35 to %class.cMessage**
  %37 = getelementptr inbounds %class.cMessageHeap* %4, i32 0, i32 1
  store %class.cMessage** %36, %class.cMessage*** %37, align 8
  store i32 1, i32* %i, align 4
  br label %38

; <label>:38                                      ; preds = %91, %26
  %39 = load i32* %i, align 4
  %40 = getelementptr inbounds %class.cMessageHeap* %4, i32 0, i32 2
  %41 = load i32* %40, align 4
  %42 = icmp sle i32 %39, %41
  br i1 %42, label %43, label %94

; <label>:43                                      ; preds = %38
  %44 = load i32* %i, align 4
  %45 = sext i32 %44 to i64
  %46 = load %class.cMessageHeap** %3, align 8
  %47 = getelementptr inbounds %class.cMessageHeap* %46, i32 0, i32 1
  %48 = load %class.cMessage*** %47, align 8
  %49 = getelementptr inbounds %class.cMessage** %48, i64 %45
  %50 = load %class.cMessage** %49, align 8
  %51 = bitcast %class.cMessage* %50 to %class.cObject*
  %52 = call %class.cObject* @_ZNK7cObject5ownerEv(%class.cObject* %51)
  %53 = load %class.cMessageHeap** %3, align 8
  %54 = bitcast %class.cMessageHeap* %53 to %class.cObject*
  %55 = icmp eq %class.cObject* %52, %54
  br i1 %55, label %56, label %77

; <label>:56                                      ; preds = %43
  %57 = bitcast %class.cMessageHeap* %4 to %class.cObject*
  %58 = load i32* %i, align 4
  %59 = sext i32 %58 to i64
  %60 = load %class.cMessageHeap** %3, align 8
  %61 = getelementptr inbounds %class.cMessageHeap* %60, i32 0, i32 1
  %62 = load %class.cMessage*** %61, align 8
  %63 = getelementptr inbounds %class.cMessage** %62, i64 %59
  %64 = load %class.cMessage** %63, align 8
  %65 = bitcast %class.cMessage* %64 to %class.cObject* (%class.cMessage*)***
  %66 = load %class.cObject* (%class.cMessage*)*** %65
  %67 = getelementptr inbounds %class.cObject* (%class.cMessage*)** %66, i64 2
  %68 = load %class.cObject* (%class.cMessage*)** %67
  %69 = call %class.cObject* %68(%class.cMessage* %64)
  %70 = bitcast %class.cObject* %69 to %class.cMessage*
  %71 = load i32* %i, align 4
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds %class.cMessageHeap* %4, i32 0, i32 1
  %74 = load %class.cMessage*** %73, align 8
  %75 = getelementptr inbounds %class.cMessage** %74, i64 %72
  store %class.cMessage* %70, %class.cMessage** %75, align 8
  %76 = bitcast %class.cMessage* %70 to %class.cObject*
  call void @_ZN7cObject4takeEPS_(%class.cObject* %57, %class.cObject* %76)
  br label %90

; <label>:77                                      ; preds = %43
  %78 = load i32* %i, align 4
  %79 = sext i32 %78 to i64
  %80 = load %class.cMessageHeap** %3, align 8
  %81 = getelementptr inbounds %class.cMessageHeap* %80, i32 0, i32 1
  %82 = load %class.cMessage*** %81, align 8
  %83 = getelementptr inbounds %class.cMessage** %82, i64 %79
  %84 = load %class.cMessage** %83, align 8
  %85 = load i32* %i, align 4
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds %class.cMessageHeap* %4, i32 0, i32 1
  %88 = load %class.cMessage*** %87, align 8
  %89 = getelementptr inbounds %class.cMessage** %88, i64 %86
  store %class.cMessage* %84, %class.cMessage** %89, align 8
  br label %90

; <label>:90                                      ; preds = %77, %56
  br label %91

; <label>:91                                      ; preds = %90
  %92 = load i32* %i, align 4
  %93 = add nsw i32 %92, 1
  store i32 %93, i32* %i, align 4
  br label %38

; <label>:94                                      ; preds = %38
  store %class.cMessageHeap* %4, %class.cMessageHeap** %1
  br label %95

; <label>:95                                      ; preds = %94, %7
  %96 = load %class.cMessageHeap** %1
  ret %class.cMessageHeap* %96
}

; Function Attrs: uwtable
define void @_ZN12cMessageHeapD2Ev(%class.cMessageHeap* %this) unnamed_addr #2 align 2 {
  %1 = alloca %class.cMessageHeap*, align 8
  store %class.cMessageHeap* %this, %class.cMessageHeap** %1, align 8
  %2 = load %class.cMessageHeap** %1
  %3 = bitcast %class.cMessageHeap* %2 to i32 (...)***
  store i32 (...)** bitcast (i8** getelementptr inbounds ([16 x i8*]* @_ZTV12cMessageHeap, i64 0, i64 2) to i32 (...)**), i32 (...)*** %3
  %4 = getelementptr inbounds %class.cMessageHeap* %2, i32 0, i32 1
  %5 = load %class.cMessage*** %4, align 8
  %6 = icmp eq %class.cMessage** %5, null
  br i1 %6, label %9, label %7

; <label>:7                                       ; preds = %0
  %8 = bitcast %class.cMessage** %5 to i8*
  call void @_ZdaPv(i8* %8) #11
  br label %9

; <label>:9                                       ; preds = %7, %0
  %10 = getelementptr inbounds %class.cMessageHeap* %2, i32 0, i32 1
  store %class.cMessage** null, %class.cMessage*** %10, align 8
  %11 = getelementptr inbounds %class.cMessageHeap* %2, i32 0, i32 2
  store i32 0, i32* %11, align 4
  %12 = bitcast %class.cMessageHeap* %2 to %class.cObject*
  call void @_ZN7cObjectD2Ev(%class.cObject* %12)
  ret void
}

; Function Attrs: nobuiltin nounwind
declare void @_ZdaPv(i8*) #3

; Function Attrs: uwtable
define void @_ZN12cMessageHeapD0Ev(%class.cMessageHeap* %this) unnamed_addr #2 align 2 {
  %1 = alloca %class.cMessageHeap*, align 8
  %2 = alloca i8*
  %3 = alloca i32
  store %class.cMessageHeap* %this, %class.cMessageHeap** %1, align 8
  %4 = load %class.cMessageHeap** %1
  invoke void @_ZN12cMessageHeapD1Ev(%class.cMessageHeap* %4)
          to label %5 unwind label %7

; <label>:5                                       ; preds = %0
  %6 = bitcast %class.cMessageHeap* %4 to i8*
  call void @_ZdlPv(i8* %6) #11
  ret void

; <label>:7                                       ; preds = %0
  %8 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
  %9 = extractvalue { i8*, i32 } %8, 0
  store i8* %9, i8** %2
  %10 = extractvalue { i8*, i32 } %8, 1
  store i32 %10, i32* %3
  %11 = bitcast %class.cMessageHeap* %4 to i8*
  call void @_ZdlPv(i8* %11) #11
  br label %12

; <label>:12                                      ; preds = %7
  %13 = load i8** %2
  %14 = load i32* %3
  %15 = insertvalue { i8*, i32 } undef, i8* %13, 0
  %16 = insertvalue { i8*, i32 } %15, i32 %14, 1
  resume { i8*, i32 } %16
}

; Function Attrs: uwtable
define void @_ZN12cMessageHeap4infoEPc(%class.cMessageHeap* %this, i8* %buf) unnamed_addr #2 align 2 {
  %1 = alloca %class.cMessageHeap*, align 8
  %2 = alloca i8*, align 8
  store %class.cMessageHeap* %this, %class.cMessageHeap** %1, align 8
  store i8* %buf, i8** %2, align 8
  %3 = load %class.cMessageHeap** %1
  %4 = bitcast %class.cMessageHeap* %3 to %class.cObject*
  %5 = load i8** %2, align 8
  call void @_ZN7cObject4infoEPc(%class.cObject* %4, i8* %5)
  %6 = getelementptr inbounds %class.cMessageHeap* %3, i32 0, i32 2
  %7 = load i32* %6, align 4
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %15

; <label>:9                                       ; preds = %0
  %10 = load i8** %2, align 8
  %11 = load i8** %2, align 8
  %12 = call i64 @strlen(i8* %11) #14
  %13 = getelementptr inbounds i8* %10, i64 %12
  %14 = call i32 (i8*, i8*, ...)* @sprintf(i8* %13, i8* getelementptr inbounds ([9 x i8]* @.str, i32 0, i32 0)) #1
  br label %29

; <label>:15                                      ; preds = %0
  %16 = load i8** %2, align 8
  %17 = load i8** %2, align 8
  %18 = call i64 @strlen(i8* %17) #14
  %19 = getelementptr inbounds i8* %16, i64 %18
  %20 = getelementptr inbounds %class.cMessageHeap* %3, i32 0, i32 2
  %21 = load i32* %20, align 4
  %22 = getelementptr inbounds %class.cMessageHeap* %3, i32 0, i32 1
  %23 = load %class.cMessage*** %22, align 8
  %24 = getelementptr inbounds %class.cMessage** %23, i64 1
  %25 = load %class.cMessage** %24, align 8
  %26 = call double @_ZNK8cMessage11arrivalTimeEv(%class.cMessage* %25)
  %27 = call i8* @_Z12simtimeToStrdPc(double %26, i8* null)
  %28 = call i32 (i8*, i8*, ...)* @sprintf(i8* %19, i8* getelementptr inbounds ([15 x i8]* @.str2, i32 0, i32 0), i32 %21, i8* %27) #1
  br label %29

; <label>:29                                      ; preds = %15, %9
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
  %1 = alloca %class.cMessage*, align 8
  store %class.cMessage* %this, %class.cMessage** %1, align 8
  %2 = load %class.cMessage** %1
  %3 = getelementptr inbounds %class.cMessage* %2, i32 0, i32 15
  %4 = load double* %3, align 8
  ret double %4
}

; Function Attrs: uwtable
define void @_ZN12cMessageHeap7forEachEPFbP7cObjectbE(%class.cMessageHeap* %this, i1 (%class.cObject*, i1)* %do_fn) unnamed_addr #2 align 2 {
  %1 = alloca %class.cMessageHeap*, align 8
  %2 = alloca i1 (%class.cObject*, i1)*, align 8
  %i = alloca i32, align 4
  store %class.cMessageHeap* %this, %class.cMessageHeap** %1, align 8
  store i1 (%class.cObject*, i1)* %do_fn, i1 (%class.cObject*, i1)** %2, align 8
  %3 = load %class.cMessageHeap** %1
  call void @_ZN12cMessageHeap4sortEv(%class.cMessageHeap* %3)
  %4 = load i1 (%class.cObject*, i1)** %2, align 8
  %5 = bitcast %class.cMessageHeap* %3 to %class.cObject*
  %6 = call zeroext i1 %4(%class.cObject* %5, i1 zeroext true)
  br i1 %6, label %7, label %38

; <label>:7                                       ; preds = %0
  store i32 1, i32* %i, align 4
  br label %8

; <label>:8                                       ; preds = %34, %7
  %9 = load i32* %i, align 4
  %10 = getelementptr inbounds %class.cMessageHeap* %3, i32 0, i32 2
  %11 = load i32* %10, align 4
  %12 = icmp sle i32 %9, %11
  br i1 %12, label %13, label %37

; <label>:13                                      ; preds = %8
  %14 = load i32* %i, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds %class.cMessageHeap* %3, i32 0, i32 1
  %17 = load %class.cMessage*** %16, align 8
  %18 = getelementptr inbounds %class.cMessage** %17, i64 %15
  %19 = load %class.cMessage** %18, align 8
  %20 = icmp ne %class.cMessage* %19, null
  br i1 %20, label %21, label %33

; <label>:21                                      ; preds = %13
  %22 = load i32* %i, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds %class.cMessageHeap* %3, i32 0, i32 1
  %25 = load %class.cMessage*** %24, align 8
  %26 = getelementptr inbounds %class.cMessage** %25, i64 %23
  %27 = load %class.cMessage** %26, align 8
  %28 = bitcast %class.cMessage* %27 to void (%class.cMessage*, i1 (%class.cObject*, i1)*)***
  %29 = load void (%class.cMessage*, i1 (%class.cObject*, i1)*)*** %28
  %30 = getelementptr inbounds void (%class.cMessage*, i1 (%class.cObject*, i1)*)** %29, i64 13
  %31 = load void (%class.cMessage*, i1 (%class.cObject*, i1)*)** %30
  %32 = load i1 (%class.cObject*, i1)** %2, align 8
  call void %31(%class.cMessage* %27, i1 (%class.cObject*, i1)* %32)
  br label %33

; <label>:33                                      ; preds = %21, %13
  br label %34

; <label>:34                                      ; preds = %33
  %35 = load i32* %i, align 4
  %36 = add nsw i32 %35, 1
  store i32 %36, i32* %i, align 4
  br label %8

; <label>:37                                      ; preds = %8
  br label %38

; <label>:38                                      ; preds = %37, %0
  %39 = load i1 (%class.cObject*, i1)** %2, align 8
  %40 = bitcast %class.cMessageHeap* %3 to %class.cObject*
  %41 = call zeroext i1 %39(%class.cObject* %40, i1 zeroext false)
  ret void
}

; Function Attrs: uwtable
define void @_ZN12cMessageHeap4sortEv(%class.cMessageHeap* %this) #2 align 2 {
  %1 = alloca %class.cMessageHeap*, align 8
  %i = alloca i32, align 4
  store %class.cMessageHeap* %this, %class.cMessageHeap** %1, align 8
  %2 = load %class.cMessageHeap** %1
  %3 = getelementptr inbounds %class.cMessageHeap* %2, i32 0, i32 1
  %4 = load %class.cMessage*** %3, align 8
  %5 = getelementptr inbounds %class.cMessage** %4, i64 1
  %6 = bitcast %class.cMessage** %5 to i8*
  %7 = getelementptr inbounds %class.cMessageHeap* %2, i32 0, i32 2
  %8 = load i32* %7, align 4
  %9 = sext i32 %8 to i64
  call void @qsort(i8* %6, i64 %9, i64 8, i32 (i8*, i8*)* @_ZL14qsort_cmp_msgsPKvS0_)
  store i32 1, i32* %i, align 4
  br label %10

; <label>:10                                      ; preds = %24, %0
  %11 = load i32* %i, align 4
  %12 = getelementptr inbounds %class.cMessageHeap* %2, i32 0, i32 2
  %13 = load i32* %12, align 4
  %14 = icmp sle i32 %11, %13
  br i1 %14, label %15, label %27

; <label>:15                                      ; preds = %10
  %16 = load i32* %i, align 4
  %17 = load i32* %i, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds %class.cMessageHeap* %2, i32 0, i32 1
  %20 = load %class.cMessage*** %19, align 8
  %21 = getelementptr inbounds %class.cMessage** %20, i64 %18
  %22 = load %class.cMessage** %21, align 8
  %23 = getelementptr inbounds %class.cMessage* %22, i32 0, i32 16
  store i32 %16, i32* %23, align 4
  br label %24

; <label>:24                                      ; preds = %15
  %25 = load i32* %i, align 4
  %26 = add nsw i32 %25, 1
  store i32 %26, i32* %i, align 4
  br label %10

; <label>:27                                      ; preds = %10
  ret void
}

; Function Attrs: uwtable
define void @_ZN12cMessageHeap5clearEv(%class.cMessageHeap* %this) #2 align 2 {
  %1 = alloca %class.cMessageHeap*, align 8
  %i = alloca i32, align 4
  store %class.cMessageHeap* %this, %class.cMessageHeap** %1, align 8
  %2 = load %class.cMessageHeap** %1
  store i32 1, i32* %i, align 4
  br label %3

; <label>:3                                       ; preds = %44, %0
  %4 = load i32* %i, align 4
  %5 = getelementptr inbounds %class.cMessageHeap* %2, i32 0, i32 2
  %6 = load i32* %5, align 4
  %7 = icmp sle i32 %4, %6
  br i1 %7, label %8, label %47

; <label>:8                                       ; preds = %3
  %9 = load i32* %i, align 4
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds %class.cMessageHeap* %2, i32 0, i32 1
  %12 = load %class.cMessage*** %11, align 8
  %13 = getelementptr inbounds %class.cMessage** %12, i64 %10
  %14 = load %class.cMessage** %13, align 8
  %15 = icmp ne %class.cMessage* %14, null
  br i1 %15, label %16, label %43

; <label>:16                                      ; preds = %8
  %17 = load i32* %i, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds %class.cMessageHeap* %2, i32 0, i32 1
  %20 = load %class.cMessage*** %19, align 8
  %21 = getelementptr inbounds %class.cMessage** %20, i64 %18
  %22 = load %class.cMessage** %21, align 8
  %23 = bitcast %class.cMessage* %22 to %class.cObject*
  %24 = call %class.cObject* @_ZNK7cObject5ownerEv(%class.cObject* %23)
  %25 = bitcast %class.cMessageHeap* %2 to %class.cObject*
  %26 = icmp eq %class.cObject* %24, %25
  br i1 %26, label %27, label %43

; <label>:27                                      ; preds = %16
  %28 = load i32* %i, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds %class.cMessageHeap* %2, i32 0, i32 1
  %31 = load %class.cMessage*** %30, align 8
  %32 = getelementptr inbounds %class.cMessage** %31, i64 %29
  %33 = load %class.cMessage** %32, align 8
  %34 = getelementptr inbounds %class.cMessage* %33, i32 0, i32 16
  store i32 -1, i32* %34, align 4
  %35 = bitcast %class.cMessageHeap* %2 to %class.cObject*
  %36 = load i32* %i, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds %class.cMessageHeap* %2, i32 0, i32 1
  %39 = load %class.cMessage*** %38, align 8
  %40 = getelementptr inbounds %class.cMessage** %39, i64 %37
  %41 = load %class.cMessage** %40, align 8
  %42 = bitcast %class.cMessage* %41 to %class.cObject*
  call void @_ZN7cObject7discardEPS_(%class.cObject* %35, %class.cObject* %42)
  br label %43

; <label>:43                                      ; preds = %27, %16, %8
  br label %44

; <label>:44                                      ; preds = %43
  %45 = load i32* %i, align 4
  %46 = add nsw i32 %45, 1
  store i32 %46, i32* %i, align 4
  br label %3

; <label>:47                                      ; preds = %3
  %48 = getelementptr inbounds %class.cMessageHeap* %2, i32 0, i32 2
  store i32 0, i32* %48, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define linkonce_odr %class.cObject* @_ZNK7cObject5ownerEv(%class.cObject* %this) #7 align 2 {
  %1 = alloca %class.cObject*, align 8
  store %class.cObject* %this, %class.cObject** %1, align 8
  %2 = load %class.cObject** %1
  %3 = getelementptr inbounds %class.cObject* %2, i32 0, i32 4
  %4 = load %class.cObject** %3, align 8
  ret %class.cObject* %4
}

; Function Attrs: uwtable
define linkonce_odr void @_ZN7cObject7discardEPS_(%class.cObject* %this, %class.cObject* %object) #2 align 2 {
  %1 = alloca %class.cObject*, align 8
  %2 = alloca %class.cObject*, align 8
  store %class.cObject* %this, %class.cObject** %1, align 8
  store %class.cObject* %object, %class.cObject** %2, align 8
  %3 = load %class.cObject** %1
  %4 = load %class.cObject** %2, align 8
  %5 = call signext i8 @_ZNK7cObject7storageEv(%class.cObject* %4)
  %6 = sext i8 %5 to i32
  %7 = icmp eq i32 %6, 68
  br i1 %7, label %8, label %17

; <label>:8                                       ; preds = %0
  %9 = load %class.cObject** %2, align 8
  %10 = icmp eq %class.cObject* %9, null
  br i1 %10, label %16, label %11

; <label>:11                                      ; preds = %8
  %12 = bitcast %class.cObject* %9 to void (%class.cObject*)***
  %13 = load void (%class.cObject*)*** %12
  %14 = getelementptr inbounds void (%class.cObject*)** %13, i64 1
  %15 = load void (%class.cObject*)** %14
  call void %15(%class.cObject* %9)
  br label %16

; <label>:16                                      ; preds = %11, %8
  br label %19

; <label>:17                                      ; preds = %0
  %18 = load %class.cObject** %2, align 8
  call void @_ZN7cObject8setOwnerEPS_(%class.cObject* %18, %class.cObject* null)
  br label %19

; <label>:19                                      ; preds = %17, %16
  ret void
}

declare dereferenceable(56) %class.cObject* @_ZN7cObjectaSERKS_(%class.cObject*, %class.cObject* dereferenceable(56)) #0

; Function Attrs: uwtable
define linkonce_odr void @_ZN7cObject4takeEPS_(%class.cObject* %this, %class.cObject* %object) #2 align 2 {
  %1 = alloca %class.cObject*, align 8
  %2 = alloca %class.cObject*, align 8
  store %class.cObject* %this, %class.cObject** %1, align 8
  store %class.cObject* %object, %class.cObject** %2, align 8
  %3 = load %class.cObject** %1
  %4 = load %class.cObject** %2, align 8
  call void @_ZN7cObject8setOwnerEPS_(%class.cObject* %4, %class.cObject* %3)
  ret void
}

declare void @qsort(i8*, i64, i64, i32 (i8*, i8*)*) #0

; Function Attrs: uwtable
define internal i32 @_ZL14qsort_cmp_msgsPKvS0_(i8* %p1, i8* %p2) #2 {
  %1 = alloca i32, align 4
  %2 = alloca i8*, align 8
  %3 = alloca i8*, align 8
  %m1 = alloca %class.cMessage*, align 8
  %m2 = alloca %class.cMessage*, align 8
  %dt = alloca double, align 8
  %dpri = alloca i32, align 4
  store i8* %p1, i8** %2, align 8
  store i8* %p2, i8** %3, align 8
  %4 = load i8** %2, align 8
  %5 = bitcast i8* %4 to %class.cMessage**
  %6 = load %class.cMessage** %5, align 8
  store %class.cMessage* %6, %class.cMessage** %m1, align 8
  %7 = load i8** %3, align 8
  %8 = bitcast i8* %7 to %class.cMessage**
  %9 = load %class.cMessage** %8, align 8
  store %class.cMessage* %9, %class.cMessage** %m2, align 8
  %10 = load %class.cMessage** %m1, align 8
  %11 = call double @_ZNK8cMessage11arrivalTimeEv(%class.cMessage* %10)
  %12 = load %class.cMessage** %m2, align 8
  %13 = call double @_ZNK8cMessage11arrivalTimeEv(%class.cMessage* %12)
  %14 = fsub double %11, %13
  store double %14, double* %dt, align 8
  %15 = load double* %dt, align 8
  %16 = fcmp olt double %15, 0.000000e+00
  br i1 %16, label %17, label %18

; <label>:17                                      ; preds = %0
  store i32 -1, i32* %1
  br label %40

; <label>:18                                      ; preds = %0
  %19 = load double* %dt, align 8
  %20 = fcmp ogt double %19, 0.000000e+00
  br i1 %20, label %21, label %22

; <label>:21                                      ; preds = %18
  store i32 1, i32* %1
  br label %40

; <label>:22                                      ; preds = %18
  br label %23

; <label>:23                                      ; preds = %22
  %24 = load %class.cMessage** %m1, align 8
  %25 = call i32 @_ZNK8cMessage8priorityEv(%class.cMessage* %24)
  %26 = load %class.cMessage** %m2, align 8
  %27 = call i32 @_ZNK8cMessage8priorityEv(%class.cMessage* %26)
  %28 = sub nsw i32 %25, %27
  store i32 %28, i32* %dpri, align 4
  %29 = load i32* %dpri, align 4
  %30 = icmp ne i32 %29, 0
  br i1 %30, label %31, label %33

; <label>:31                                      ; preds = %23
  %32 = load i32* %dpri, align 4
  store i32 %32, i32* %1
  br label %40

; <label>:33                                      ; preds = %23
  %34 = load %class.cMessage** %m1, align 8
  %35 = call i64 @_ZNK8cMessage11insertOrderEv(%class.cMessage* %34)
  %36 = load %class.cMessage** %m2, align 8
  %37 = call i64 @_ZNK8cMessage11insertOrderEv(%class.cMessage* %36)
  %38 = icmp ult i64 %35, %37
  %39 = select i1 %38, i32 -1, i32 1
  store i32 %39, i32* %1
  br label %40

; <label>:40                                      ; preds = %33, %31, %21, %17
  %41 = load i32* %1
  ret i32 %41
}

; Function Attrs: uwtable
define void @_ZN12cMessageHeap6insertEP8cMessage(%class.cMessageHeap* %this, %class.cMessage* %event) #2 align 2 {
  %1 = alloca %class.cMessageHeap*, align 8
  %2 = alloca %class.cMessage*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %hnew = alloca %class.cMessage**, align 8
  store %class.cMessageHeap* %this, %class.cMessageHeap** %1, align 8
  store %class.cMessage* %event, %class.cMessage** %2, align 8
  %3 = load %class.cMessageHeap** %1
  %4 = getelementptr inbounds %class.cMessageHeap* %3, i32 0, i32 4
  %5 = load i64* %4, align 8
  %6 = add i64 %5, 1
  store i64 %6, i64* %4, align 8
  %7 = load %class.cMessage** %2, align 8
  %8 = getelementptr inbounds %class.cMessage* %7, i32 0, i32 17
  store i64 %5, i64* %8, align 8
  %9 = getelementptr inbounds %class.cMessageHeap* %3, i32 0, i32 2
  %10 = load i32* %9, align 4
  %11 = add nsw i32 %10, 1
  store i32 %11, i32* %9, align 4
  %12 = getelementptr inbounds %class.cMessageHeap* %3, i32 0, i32 3
  %13 = load i32* %12, align 4
  %14 = icmp sgt i32 %11, %13
  br i1 %14, label %15, label %58

; <label>:15                                      ; preds = %0
  %16 = getelementptr inbounds %class.cMessageHeap* %3, i32 0, i32 3
  %17 = load i32* %16, align 4
  %18 = mul nsw i32 %17, 2
  store i32 %18, i32* %16, align 4
  %19 = getelementptr inbounds %class.cMessageHeap* %3, i32 0, i32 3
  %20 = load i32* %19, align 4
  %21 = add nsw i32 %20, 1
  %22 = sext i32 %21 to i64
  %23 = call { i64, i1 } @llvm.umul.with.overflow.i64(i64 %22, i64 8)
  %24 = extractvalue { i64, i1 } %23, 1
  %25 = extractvalue { i64, i1 } %23, 0
  %26 = select i1 %24, i64 -1, i64 %25
  %27 = call noalias i8* @_Znam(i64 %26) #12
  %28 = bitcast i8* %27 to %class.cMessage**
  store %class.cMessage** %28, %class.cMessage*** %hnew, align 8
  store i32 1, i32* %i, align 4
  br label %29

; <label>:29                                      ; preds = %46, %15
  %30 = load i32* %i, align 4
  %31 = getelementptr inbounds %class.cMessageHeap* %3, i32 0, i32 2
  %32 = load i32* %31, align 4
  %33 = sub nsw i32 %32, 1
  %34 = icmp sle i32 %30, %33
  br i1 %34, label %35, label %49

; <label>:35                                      ; preds = %29
  %36 = load i32* %i, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds %class.cMessageHeap* %3, i32 0, i32 1
  %39 = load %class.cMessage*** %38, align 8
  %40 = getelementptr inbounds %class.cMessage** %39, i64 %37
  %41 = load %class.cMessage** %40, align 8
  %42 = load i32* %i, align 4
  %43 = sext i32 %42 to i64
  %44 = load %class.cMessage*** %hnew, align 8
  %45 = getelementptr inbounds %class.cMessage** %44, i64 %43
  store %class.cMessage* %41, %class.cMessage** %45, align 8
  br label %46

; <label>:46                                      ; preds = %35
  %47 = load i32* %i, align 4
  %48 = add nsw i32 %47, 1
  store i32 %48, i32* %i, align 4
  br label %29

; <label>:49                                      ; preds = %29
  %50 = getelementptr inbounds %class.cMessageHeap* %3, i32 0, i32 1
  %51 = load %class.cMessage*** %50, align 8
  %52 = icmp eq %class.cMessage** %51, null
  br i1 %52, label %55, label %53

; <label>:53                                      ; preds = %49
  %54 = bitcast %class.cMessage** %51 to i8*
  call void @_ZdaPv(i8* %54) #11
  br label %55

; <label>:55                                      ; preds = %53, %49
  %56 = load %class.cMessage*** %hnew, align 8
  %57 = getelementptr inbounds %class.cMessageHeap* %3, i32 0, i32 1
  store %class.cMessage** %56, %class.cMessage*** %57, align 8
  br label %58

; <label>:58                                      ; preds = %55, %0
  %59 = bitcast %class.cMessageHeap* %3 to %class.cObject*
  %60 = call zeroext i1 @_ZNK7cObject13takeOwnershipEv(%class.cObject* %59)
  br i1 %60, label %61, label %65

; <label>:61                                      ; preds = %58
  %62 = bitcast %class.cMessageHeap* %3 to %class.cObject*
  %63 = load %class.cMessage** %2, align 8
  %64 = bitcast %class.cMessage* %63 to %class.cObject*
  call void @_ZN7cObject4takeEPS_(%class.cObject* %62, %class.cObject* %64)
  br label %65

; <label>:65                                      ; preds = %61, %58
  %66 = getelementptr inbounds %class.cMessageHeap* %3, i32 0, i32 2
  %67 = load i32* %66, align 4
  store i32 %67, i32* %j, align 4
  br label %68

; <label>:68                                      ; preds = %98, %65
  %69 = load i32* %j, align 4
  %70 = icmp sgt i32 %69, 1
  br i1 %70, label %71, label %100

; <label>:71                                      ; preds = %68
  %72 = load i32* %j, align 4
  %73 = sdiv i32 %72, 2
  store i32 %73, i32* %i, align 4
  %74 = load i32* %i, align 4
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds %class.cMessageHeap* %3, i32 0, i32 1
  %77 = load %class.cMessage*** %76, align 8
  %78 = getelementptr inbounds %class.cMessage** %77, i64 %75
  %79 = load %class.cMessage** %78, align 8
  %80 = load %class.cMessage** %2, align 8
  %81 = call i32 @_ZleR8cMessageS0_(%class.cMessage* dereferenceable(168) %79, %class.cMessage* dereferenceable(168) %80)
  %82 = icmp ne i32 %81, 0
  br i1 %82, label %83, label %84

; <label>:83                                      ; preds = %71
  br label %100

; <label>:84                                      ; preds = %71
  %85 = load i32* %j, align 4
  %86 = load i32* %i, align 4
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds %class.cMessageHeap* %3, i32 0, i32 1
  %89 = load %class.cMessage*** %88, align 8
  %90 = getelementptr inbounds %class.cMessage** %89, i64 %87
  %91 = load %class.cMessage** %90, align 8
  %92 = load i32* %j, align 4
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds %class.cMessageHeap* %3, i32 0, i32 1
  %95 = load %class.cMessage*** %94, align 8
  %96 = getelementptr inbounds %class.cMessage** %95, i64 %93
  store %class.cMessage* %91, %class.cMessage** %96, align 8
  %97 = getelementptr inbounds %class.cMessage* %91, i32 0, i32 16
  store i32 %85, i32* %97, align 4
  br label %98

; <label>:98                                      ; preds = %84
  %99 = load i32* %i, align 4
  store i32 %99, i32* %j, align 4
  br label %68

; <label>:100                                     ; preds = %83, %68
  %101 = load i32* %j, align 4
  %102 = load %class.cMessage** %2, align 8
  %103 = load i32* %j, align 4
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds %class.cMessageHeap* %3, i32 0, i32 1
  %106 = load %class.cMessage*** %105, align 8
  %107 = getelementptr inbounds %class.cMessage** %106, i64 %104
  store %class.cMessage* %102, %class.cMessage** %107, align 8
  %108 = getelementptr inbounds %class.cMessage* %102, i32 0, i32 16
  store i32 %101, i32* %108, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define linkonce_odr zeroext i1 @_ZNK7cObject13takeOwnershipEv(%class.cObject* %this) #7 align 2 {
  %1 = alloca %class.cObject*, align 8
  store %class.cObject* %this, %class.cObject** %1, align 8
  %2 = load %class.cObject** %1
  %3 = getelementptr inbounds %class.cObject* %2, i32 0, i32 3
  %4 = load i8* %3, align 1
  %5 = trunc i8 %4 to i1
  ret i1 %5
}

; Function Attrs: inlinehint uwtable
define linkonce_odr i32 @_ZleR8cMessageS0_(%class.cMessage* dereferenceable(168) %a, %class.cMessage* dereferenceable(168) %b) #10 {
  %1 = alloca %class.cMessage*, align 8
  %2 = alloca %class.cMessage*, align 8
  store %class.cMessage* %a, %class.cMessage** %1, align 8
  store %class.cMessage* %b, %class.cMessage** %2, align 8
  %3 = load %class.cMessage** %1, align 8
  %4 = call double @_ZNK8cMessage11arrivalTimeEv(%class.cMessage* %3)
  %5 = load %class.cMessage** %2, align 8
  %6 = call double @_ZNK8cMessage11arrivalTimeEv(%class.cMessage* %5)
  %7 = fcmp olt double %4, %6
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %0
  br label %43

; <label>:9                                       ; preds = %0
  %10 = load %class.cMessage** %1, align 8
  %11 = call double @_ZNK8cMessage11arrivalTimeEv(%class.cMessage* %10)
  %12 = load %class.cMessage** %2, align 8
  %13 = call double @_ZNK8cMessage11arrivalTimeEv(%class.cMessage* %12)
  %14 = fcmp ogt double %11, %13
  br i1 %14, label %15, label %16

; <label>:15                                      ; preds = %9
  br label %41

; <label>:16                                      ; preds = %9
  %17 = load %class.cMessage** %1, align 8
  %18 = call i32 @_ZNK8cMessage8priorityEv(%class.cMessage* %17)
  %19 = load %class.cMessage** %2, align 8
  %20 = call i32 @_ZNK8cMessage8priorityEv(%class.cMessage* %19)
  %21 = icmp slt i32 %18, %20
  br i1 %21, label %22, label %23

; <label>:22                                      ; preds = %16
  br label %39

; <label>:23                                      ; preds = %16
  %24 = load %class.cMessage** %1, align 8
  %25 = call i32 @_ZNK8cMessage8priorityEv(%class.cMessage* %24)
  %26 = load %class.cMessage** %2, align 8
  %27 = call i32 @_ZNK8cMessage8priorityEv(%class.cMessage* %26)
  %28 = icmp sgt i32 %25, %27
  br i1 %28, label %29, label %30

; <label>:29                                      ; preds = %23
  br label %37

; <label>:30                                      ; preds = %23
  %31 = load %class.cMessage** %1, align 8
  %32 = call i64 @_ZNK8cMessage11insertOrderEv(%class.cMessage* %31)
  %33 = load %class.cMessage** %2, align 8
  %34 = call i64 @_ZNK8cMessage11insertOrderEv(%class.cMessage* %33)
  %35 = icmp ule i64 %32, %34
  %36 = zext i1 %35 to i32
  br label %37

; <label>:37                                      ; preds = %30, %29
  %38 = phi i32 [ 0, %29 ], [ %36, %30 ]
  br label %39

; <label>:39                                      ; preds = %37, %22
  %40 = phi i32 [ 1, %22 ], [ %38, %37 ]
  br label %41

; <label>:41                                      ; preds = %39, %15
  %42 = phi i32 [ 0, %15 ], [ %40, %39 ]
  br label %43

; <label>:43                                      ; preds = %41, %8
  %44 = phi i32 [ 1, %8 ], [ %42, %41 ]
  ret i32 %44
}

; Function Attrs: uwtable
define void @_ZN12cMessageHeap7shiftupEi(%class.cMessageHeap* %this, i32 %from) #2 align 2 {
  %1 = alloca %class.cMessageHeap*, align 8
  %2 = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %temp = alloca %class.cMessage*, align 8
  store %class.cMessageHeap* %this, %class.cMessageHeap** %1, align 8
  store i32 %from, i32* %2, align 4
  %3 = load %class.cMessageHeap** %1
  %4 = load i32* %2, align 4
  store i32 %4, i32* %i, align 4
  br label %5

; <label>:5                                       ; preds = %80, %0
  %6 = load i32* %i, align 4
  %7 = mul nsw i32 2, %6
  store i32 %7, i32* %j, align 4
  %8 = getelementptr inbounds %class.cMessageHeap* %3, i32 0, i32 2
  %9 = load i32* %8, align 4
  %10 = icmp sle i32 %7, %9
  br i1 %10, label %11, label %81

; <label>:11                                      ; preds = %5
  %12 = load i32* %j, align 4
  %13 = getelementptr inbounds %class.cMessageHeap* %3, i32 0, i32 2
  %14 = load i32* %13, align 4
  %15 = icmp slt i32 %12, %14
  br i1 %15, label %16, label %35

; <label>:16                                      ; preds = %11
  %17 = load i32* %j, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds %class.cMessageHeap* %3, i32 0, i32 1
  %20 = load %class.cMessage*** %19, align 8
  %21 = getelementptr inbounds %class.cMessage** %20, i64 %18
  %22 = load %class.cMessage** %21, align 8
  %23 = load i32* %j, align 4
  %24 = add nsw i32 %23, 1
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds %class.cMessageHeap* %3, i32 0, i32 1
  %27 = load %class.cMessage*** %26, align 8
  %28 = getelementptr inbounds %class.cMessage** %27, i64 %25
  %29 = load %class.cMessage** %28, align 8
  %30 = call i32 @_ZgtR8cMessageS0_(%class.cMessage* dereferenceable(168) %22, %class.cMessage* dereferenceable(168) %29)
  %31 = icmp ne i32 %30, 0
  br i1 %31, label %32, label %35

; <label>:32                                      ; preds = %16
  %33 = load i32* %j, align 4
  %34 = add nsw i32 %33, 1
  store i32 %34, i32* %j, align 4
  br label %35

; <label>:35                                      ; preds = %32, %16, %11
  %36 = load i32* %i, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds %class.cMessageHeap* %3, i32 0, i32 1
  %39 = load %class.cMessage*** %38, align 8
  %40 = getelementptr inbounds %class.cMessage** %39, i64 %37
  %41 = load %class.cMessage** %40, align 8
  %42 = load i32* %j, align 4
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds %class.cMessageHeap* %3, i32 0, i32 1
  %45 = load %class.cMessage*** %44, align 8
  %46 = getelementptr inbounds %class.cMessage** %45, i64 %43
  %47 = load %class.cMessage** %46, align 8
  %48 = call i32 @_ZgtR8cMessageS0_(%class.cMessage* dereferenceable(168) %41, %class.cMessage* dereferenceable(168) %47)
  %49 = icmp ne i32 %48, 0
  br i1 %49, label %50, label %79

; <label>:50                                      ; preds = %35
  %51 = load i32* %j, align 4
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds %class.cMessageHeap* %3, i32 0, i32 1
  %54 = load %class.cMessage*** %53, align 8
  %55 = getelementptr inbounds %class.cMessage** %54, i64 %52
  %56 = load %class.cMessage** %55, align 8
  store %class.cMessage* %56, %class.cMessage** %temp, align 8
  %57 = load i32* %j, align 4
  %58 = load i32* %i, align 4
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds %class.cMessageHeap* %3, i32 0, i32 1
  %61 = load %class.cMessage*** %60, align 8
  %62 = getelementptr inbounds %class.cMessage** %61, i64 %59
  %63 = load %class.cMessage** %62, align 8
  %64 = load i32* %j, align 4
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds %class.cMessageHeap* %3, i32 0, i32 1
  %67 = load %class.cMessage*** %66, align 8
  %68 = getelementptr inbounds %class.cMessage** %67, i64 %65
  store %class.cMessage* %63, %class.cMessage** %68, align 8
  %69 = getelementptr inbounds %class.cMessage* %63, i32 0, i32 16
  store i32 %57, i32* %69, align 4
  %70 = load i32* %i, align 4
  %71 = load %class.cMessage** %temp, align 8
  %72 = load i32* %i, align 4
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds %class.cMessageHeap* %3, i32 0, i32 1
  %75 = load %class.cMessage*** %74, align 8
  %76 = getelementptr inbounds %class.cMessage** %75, i64 %73
  store %class.cMessage* %71, %class.cMessage** %76, align 8
  %77 = getelementptr inbounds %class.cMessage* %71, i32 0, i32 16
  store i32 %70, i32* %77, align 4
  %78 = load i32* %j, align 4
  store i32 %78, i32* %i, align 4
  br label %80

; <label>:79                                      ; preds = %35
  br label %81

; <label>:80                                      ; preds = %50
  br label %5

; <label>:81                                      ; preds = %79, %5
  ret void
}

; Function Attrs: inlinehint uwtable
define linkonce_odr i32 @_ZgtR8cMessageS0_(%class.cMessage* dereferenceable(168) %a, %class.cMessage* dereferenceable(168) %b) #10 {
  %1 = alloca %class.cMessage*, align 8
  %2 = alloca %class.cMessage*, align 8
  store %class.cMessage* %a, %class.cMessage** %1, align 8
  store %class.cMessage* %b, %class.cMessage** %2, align 8
  %3 = load %class.cMessage** %1, align 8
  %4 = load %class.cMessage** %2, align 8
  %5 = call i32 @_ZleR8cMessageS0_(%class.cMessage* dereferenceable(168) %3, %class.cMessage* dereferenceable(168) %4)
  %6 = icmp ne i32 %5, 0
  %7 = xor i1 %6, true
  %8 = zext i1 %7 to i32
  ret i32 %8
}

; Function Attrs: nounwind uwtable
define %class.cMessage* @_ZNK12cMessageHeap9peekFirstEv(%class.cMessageHeap* %this) #7 align 2 {
  %1 = alloca %class.cMessageHeap*, align 8
  store %class.cMessageHeap* %this, %class.cMessageHeap** %1, align 8
  %2 = load %class.cMessageHeap** %1
  %3 = getelementptr inbounds %class.cMessageHeap* %2, i32 0, i32 2
  %4 = load i32* %3, align 4
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %6, label %7

; <label>:6                                       ; preds = %0
  br label %12

; <label>:7                                       ; preds = %0
  %8 = getelementptr inbounds %class.cMessageHeap* %2, i32 0, i32 1
  %9 = load %class.cMessage*** %8, align 8
  %10 = getelementptr inbounds %class.cMessage** %9, i64 1
  %11 = load %class.cMessage** %10, align 8
  br label %12

; <label>:12                                      ; preds = %7, %6
  %13 = phi %class.cMessage* [ null, %6 ], [ %11, %7 ]
  ret %class.cMessage* %13
}

; Function Attrs: uwtable
define %class.cMessage* @_ZN12cMessageHeap8getFirstEv(%class.cMessageHeap* %this) #2 align 2 {
  %1 = alloca %class.cMessage*, align 8
  %2 = alloca %class.cMessageHeap*, align 8
  %event = alloca %class.cMessage*, align 8
  store %class.cMessageHeap* %this, %class.cMessageHeap** %2, align 8
  %3 = load %class.cMessageHeap** %2
  %4 = getelementptr inbounds %class.cMessageHeap* %3, i32 0, i32 2
  %5 = load i32* %4, align 4
  %6 = icmp sgt i32 %5, 0
  br i1 %6, label %7, label %37

; <label>:7                                       ; preds = %0
  %8 = getelementptr inbounds %class.cMessageHeap* %3, i32 0, i32 1
  %9 = load %class.cMessage*** %8, align 8
  %10 = getelementptr inbounds %class.cMessage** %9, i64 1
  %11 = load %class.cMessage** %10, align 8
  store %class.cMessage* %11, %class.cMessage** %event, align 8
  %12 = getelementptr inbounds %class.cMessageHeap* %3, i32 0, i32 2
  %13 = load i32* %12, align 4
  %14 = add nsw i32 %13, -1
  store i32 %14, i32* %12, align 4
  %15 = sext i32 %13 to i64
  %16 = getelementptr inbounds %class.cMessageHeap* %3, i32 0, i32 1
  %17 = load %class.cMessage*** %16, align 8
  %18 = getelementptr inbounds %class.cMessage** %17, i64 %15
  %19 = load %class.cMessage** %18, align 8
  %20 = getelementptr inbounds %class.cMessageHeap* %3, i32 0, i32 1
  %21 = load %class.cMessage*** %20, align 8
  %22 = getelementptr inbounds %class.cMessage** %21, i64 1
  store %class.cMessage* %19, %class.cMessage** %22, align 8
  %23 = getelementptr inbounds %class.cMessage* %19, i32 0, i32 16
  store i32 1, i32* %23, align 4
  call void @_ZN12cMessageHeap7shiftupEi(%class.cMessageHeap* %3, i32 1)
  %24 = load %class.cMessage** %event, align 8
  %25 = bitcast %class.cMessage* %24 to %class.cObject*
  %26 = call %class.cObject* @_ZNK7cObject5ownerEv(%class.cObject* %25)
  %27 = bitcast %class.cMessageHeap* %3 to %class.cObject*
  %28 = icmp eq %class.cObject* %26, %27
  br i1 %28, label %29, label %33

; <label>:29                                      ; preds = %7
  %30 = bitcast %class.cMessageHeap* %3 to %class.cObject*
  %31 = load %class.cMessage** %event, align 8
  %32 = bitcast %class.cMessage* %31 to %class.cObject*
  call void @_ZN7cObject4dropEPS_(%class.cObject* %30, %class.cObject* %32)
  br label %33

; <label>:33                                      ; preds = %29, %7
  %34 = load %class.cMessage** %event, align 8
  %35 = getelementptr inbounds %class.cMessage* %34, i32 0, i32 16
  store i32 -1, i32* %35, align 4
  %36 = load %class.cMessage** %event, align 8
  store %class.cMessage* %36, %class.cMessage** %1
  br label %38

; <label>:37                                      ; preds = %0
  store %class.cMessage* null, %class.cMessage** %1
  br label %38

; <label>:38                                      ; preds = %37, %33
  %39 = load %class.cMessage** %1
  ret %class.cMessage* %39
}

; Function Attrs: uwtable
define linkonce_odr void @_ZN7cObject4dropEPS_(%class.cObject* %this, %class.cObject* %object) #2 align 2 {
  %1 = alloca %class.cObject*, align 8
  %2 = alloca %class.cObject*, align 8
  store %class.cObject* %this, %class.cObject** %1, align 8
  store %class.cObject* %object, %class.cObject** %2, align 8
  %3 = load %class.cObject** %1
  %4 = load %class.cObject** %2, align 8
  %5 = load %class.cObject** %2, align 8
  %6 = bitcast %class.cObject* %5 to %class.cObject* (%class.cObject*)***
  %7 = load %class.cObject* (%class.cObject*)*** %6
  %8 = getelementptr inbounds %class.cObject* (%class.cObject*)** %7, i64 6
  %9 = load %class.cObject* (%class.cObject*)** %8
  %10 = call %class.cObject* %9(%class.cObject* %5)
  call void @_ZN7cObject8setOwnerEPS_(%class.cObject* %4, %class.cObject* %10)
  ret void
}

; Function Attrs: uwtable
define %class.cMessage* @_ZN12cMessageHeap3getEP8cMessage(%class.cMessageHeap* %this, %class.cMessage* %event) #2 align 2 {
  %1 = alloca %class.cMessage*, align 8
  %2 = alloca %class.cMessageHeap*, align 8
  %3 = alloca %class.cMessage*, align 8
  %father = alloca i32, align 4
  %out = alloca i32, align 4
  %fill = alloca %class.cMessage*, align 8
  store %class.cMessageHeap* %this, %class.cMessageHeap** %2, align 8
  store %class.cMessage* %event, %class.cMessage** %3, align 8
  %4 = load %class.cMessageHeap** %2
  %5 = load %class.cMessage** %3, align 8
  %6 = getelementptr inbounds %class.cMessage* %5, i32 0, i32 16
  %7 = load i32* %6, align 4
  %8 = icmp eq i32 %7, -1
  br i1 %8, label %9, label %10

; <label>:9                                       ; preds = %0
  store %class.cMessage* null, %class.cMessage** %1
  br label %76

; <label>:10                                      ; preds = %0
  %11 = load %class.cMessage** %3, align 8
  %12 = getelementptr inbounds %class.cMessage* %11, i32 0, i32 16
  %13 = load i32* %12, align 4
  store i32 %13, i32* %out, align 4
  %14 = getelementptr inbounds %class.cMessageHeap* %4, i32 0, i32 2
  %15 = load i32* %14, align 4
  %16 = add nsw i32 %15, -1
  store i32 %16, i32* %14, align 4
  %17 = sext i32 %15 to i64
  %18 = getelementptr inbounds %class.cMessageHeap* %4, i32 0, i32 1
  %19 = load %class.cMessage*** %18, align 8
  %20 = getelementptr inbounds %class.cMessage** %19, i64 %17
  %21 = load %class.cMessage** %20, align 8
  store %class.cMessage* %21, %class.cMessage** %fill, align 8
  br label %22

; <label>:22                                      ; preds = %38, %10
  %23 = load i32* %out, align 4
  %24 = sdiv i32 %23, 2
  store i32 %24, i32* %father, align 4
  %25 = icmp ne i32 %24, 0
  br i1 %25, label %26, label %36

; <label>:26                                      ; preds = %22
  %27 = load i32* %father, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds %class.cMessageHeap* %4, i32 0, i32 1
  %30 = load %class.cMessage*** %29, align 8
  %31 = getelementptr inbounds %class.cMessage** %30, i64 %28
  %32 = load %class.cMessage** %31, align 8
  %33 = load %class.cMessage** %fill, align 8
  %34 = call i32 @_ZgtR8cMessageS0_(%class.cMessage* dereferenceable(168) %32, %class.cMessage* dereferenceable(168) %33)
  %35 = icmp ne i32 %34, 0
  br label %36

; <label>:36                                      ; preds = %26, %22
  %37 = phi i1 [ false, %22 ], [ %35, %26 ]
  br i1 %37, label %38, label %53

; <label>:38                                      ; preds = %36
  %39 = load i32* %out, align 4
  %40 = load i32* %father, align 4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds %class.cMessageHeap* %4, i32 0, i32 1
  %43 = load %class.cMessage*** %42, align 8
  %44 = getelementptr inbounds %class.cMessage** %43, i64 %41
  %45 = load %class.cMessage** %44, align 8
  %46 = load i32* %out, align 4
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds %class.cMessageHeap* %4, i32 0, i32 1
  %49 = load %class.cMessage*** %48, align 8
  %50 = getelementptr inbounds %class.cMessage** %49, i64 %47
  store %class.cMessage* %45, %class.cMessage** %50, align 8
  %51 = getelementptr inbounds %class.cMessage* %45, i32 0, i32 16
  store i32 %39, i32* %51, align 4
  %52 = load i32* %father, align 4
  store i32 %52, i32* %out, align 4
  br label %22

; <label>:53                                      ; preds = %36
  %54 = load i32* %out, align 4
  %55 = load %class.cMessage** %fill, align 8
  %56 = load i32* %out, align 4
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds %class.cMessageHeap* %4, i32 0, i32 1
  %59 = load %class.cMessage*** %58, align 8
  %60 = getelementptr inbounds %class.cMessage** %59, i64 %57
  store %class.cMessage* %55, %class.cMessage** %60, align 8
  %61 = getelementptr inbounds %class.cMessage* %55, i32 0, i32 16
  store i32 %54, i32* %61, align 4
  %62 = load i32* %out, align 4
  call void @_ZN12cMessageHeap7shiftupEi(%class.cMessageHeap* %4, i32 %62)
  %63 = load %class.cMessage** %3, align 8
  %64 = bitcast %class.cMessage* %63 to %class.cObject*
  %65 = call %class.cObject* @_ZNK7cObject5ownerEv(%class.cObject* %64)
  %66 = bitcast %class.cMessageHeap* %4 to %class.cObject*
  %67 = icmp eq %class.cObject* %65, %66
  br i1 %67, label %68, label %72

; <label>:68                                      ; preds = %53
  %69 = bitcast %class.cMessageHeap* %4 to %class.cObject*
  %70 = load %class.cMessage** %3, align 8
  %71 = bitcast %class.cMessage* %70 to %class.cObject*
  call void @_ZN7cObject4dropEPS_(%class.cObject* %69, %class.cObject* %71)
  br label %72

; <label>:72                                      ; preds = %68, %53
  %73 = load %class.cMessage** %3, align 8
  %74 = getelementptr inbounds %class.cMessage* %73, i32 0, i32 16
  store i32 -1, i32* %74, align 4
  %75 = load %class.cMessage** %3, align 8
  store %class.cMessage* %75, %class.cMessage** %1
  br label %76

; <label>:76                                      ; preds = %72, %9
  %77 = load %class.cMessage** %1
  ret %class.cMessage* %77
}

; Function Attrs: uwtable
define linkonce_odr %class.cObject* @_ZNK12cMessageHeap3dupEv(%class.cMessageHeap* %this) unnamed_addr #2 align 2 {
  %1 = alloca %class.cMessageHeap*, align 8
  %2 = alloca i8*
  %3 = alloca i32
  store %class.cMessageHeap* %this, %class.cMessageHeap** %1, align 8
  %4 = load %class.cMessageHeap** %1
  %5 = call i8* @_ZN7cObjectnwEm(i64 80)
  %6 = bitcast i8* %5 to %class.cMessageHeap*
  invoke void @_ZN12cMessageHeapC1ERKS_(%class.cMessageHeap* %6, %class.cMessageHeap* dereferenceable(80) %4)
          to label %7 unwind label %9

; <label>:7                                       ; preds = %0
  %8 = bitcast %class.cMessageHeap* %6 to %class.cObject*
  ret %class.cObject* %8

; <label>:9                                       ; preds = %0
  %10 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
  %11 = extractvalue { i8*, i32 } %10, 0
  store i8* %11, i8** %2
  %12 = extractvalue { i8*, i32 } %10, 1
  store i32 %12, i32* %3
  call void @_ZdlPv(i8* %5) #11
  br label %13

; <label>:13                                      ; preds = %9
  %14 = load i8** %2
  %15 = load i32* %3
  %16 = insertvalue { i8*, i32 } undef, i8* %14, 0
  %17 = insertvalue { i8*, i32 } %16, i32 %15, 1
  resume { i8*, i32 } %17
}

; Function Attrs: uwtable
define linkonce_odr i8* @_ZNK7cObject8fullNameEv(%class.cObject* %this) unnamed_addr #2 align 2 {
  %1 = alloca %class.cObject*, align 8
  store %class.cObject* %this, %class.cObject** %1, align 8
  %2 = load %class.cObject** %1
  %3 = call i8* @_ZNK7cObject4nameEv(%class.cObject* %2)
  ret i8* %3
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
  %1 = alloca %class.cMessage*, align 8
  store %class.cMessage* %this, %class.cMessage** %1, align 8
  %2 = load %class.cMessage** %1
  %3 = getelementptr inbounds %class.cMessage* %2, i32 0, i32 2
  %4 = load i32* %3, align 4
  ret i32 %4
}

; Function Attrs: nounwind uwtable
define linkonce_odr i64 @_ZNK8cMessage11insertOrderEv(%class.cMessage* %this) #7 align 2 {
  %1 = alloca %class.cMessage*, align 8
  store %class.cMessage* %this, %class.cMessage** %1, align 8
  %2 = load %class.cMessage** %1
  %3 = getelementptr inbounds %class.cMessage* %2, i32 0, i32 17
  %4 = load i64* %3, align 8
  ret i64 %4
}

; Function Attrs: nounwind uwtable
define linkonce_odr signext i8 @_ZNK7cObject7storageEv(%class.cObject* %this) #7 align 2 {
  %1 = alloca %class.cObject*, align 8
  store %class.cObject* %this, %class.cObject** %1, align 8
  %2 = load %class.cObject** %1
  %3 = getelementptr inbounds %class.cObject* %2, i32 0, i32 2
  %4 = load i8* %3, align 1
  ret i8 %4
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
