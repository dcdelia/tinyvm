; ModuleID = 'spxsteeppr.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%"class.std::ios_base::Init" = type { i8 }
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
%"class.soplex::SPxSteepPR" = type { %"class.soplex::SPxPricer", %"class.soplex::DVector", %"class.soplex::DVector", %"class.soplex::DVector", %"class.soplex::SSVector", i32, %"class.soplex::SPxId", double, i32, %"class.soplex::DataArray.3", %"class.soplex::DataArray.3", %"class.soplex::DataArray.3", i32, double }
%"class.soplex::SPxPricer" = type { i32 (...)**, i8*, %"class.soplex::SoPlex"*, double }
%"class.soplex::SoPlex" = type { %"class.soplex::SPxLP.base", %"class.soplex::SPxBasis", i32, i32, i32, %"class.soplex::Timer", i32, double, double, i32, double, double, double, i32, i32, i8, %"class.soplex::Vector"*, %"class.soplex::SSVector"*, %"class.soplex::Vector"*, %"class.soplex::SSVector"*, double, %"class.soplex::Array", %"class.soplex::SVSet"*, %"class.soplex::SVSet"*, i32, i32, %"class.soplex::DVector", %"class.soplex::UpdateVector", %"class.soplex::DVector", %"class.soplex::UpdateVector", %"class.soplex::UpdateVector", %"class.soplex::DVector", %"class.soplex::DVector", %"class.soplex::DVector", %"class.soplex::DVector", %"class.soplex::DVector", %"class.soplex::DVector", %"class.soplex::DVector"*, %"class.soplex::UpdateVector"*, %"class.soplex::DVector"*, %"class.soplex::UpdateVector"*, %"class.soplex::UpdateVector"*, %"class.soplex::UpdateVector"*, %"class.soplex::UpdateVector"*, %"class.soplex::DVector"*, %"class.soplex::DVector"*, %"class.soplex::DVector"*, %"class.soplex::DVector"*, %"class.soplex::DVector", %"class.soplex::DVector", i32, i32, %"class.soplex::SPxPricer"*, %"class.soplex::SPxRatioTester"*, %"class.soplex::SPxStarter"*, %"class.soplex::SPxScaler"*, %"class.soplex::SPxSimplifier"* }
%"class.soplex::SPxLP.base" = type <{ i32 (...)**, %"class.soplex::LPRowSet", %"class.soplex::LPColSet", i32 }>
%"class.soplex::LPRowSet" = type { %"class.soplex::SVSet", %"class.soplex::DVector", %"class.soplex::DVector" }
%"class.soplex::SVSet" = type { %"class.soplex::DataArray", %"class.soplex::DataSet", %"class.soplex::IdList", double, double* }
%"class.soplex::DataArray" = type { i32, i32, %"struct.soplex::SVector::Element"*, double }
%"struct.soplex::SVector::Element" = type { double, i32 }
%"class.soplex::DataSet" = type { %"struct.soplex::DataSet<soplex::SVSet::DLPSV>::Item"*, %"class.soplex::DataKey"*, i32, i32, i32, i32 }
%"struct.soplex::DataSet<soplex::SVSet::DLPSV>::Item" = type <{ %"class.soplex::SVSet::DLPSV", i32, [4 x i8] }>
%"class.soplex::SVSet::DLPSV" = type { %"class.soplex::SVector", %"class.soplex::SVSet::DLPSV"*, %"class.soplex::SVSet::DLPSV"* }
%"class.soplex::SVector" = type { %"struct.soplex::SVector::Element"* }
%"class.soplex::DataKey" = type { i32 }
%"class.soplex::IdList" = type { %"class.soplex::IsList" }
%"class.soplex::IsList" = type { %"class.soplex::SVSet::DLPSV"*, %"class.soplex::SVSet::DLPSV"* }
%"class.soplex::LPColSet" = type { %"class.soplex::SVSet", %"class.soplex::DVector", %"class.soplex::DVector", %"class.soplex::DVector" }
%"class.soplex::SPxBasis" = type { i32 (...)**, %"class.soplex::SoPlex"*, %"class.soplex::DataArray.0", %"class.soplex::DataArray.1", i8, %"class.soplex::SLinSolver"*, i8, i32, double, i32, i32, i32, double, double, %"class.soplex::SPxId", %"class.soplex::SPxId", i32, i32, %"class.soplex::SPxBasis::Desc" }
%"class.soplex::DataArray.0" = type { i32, i32, %"class.soplex::SPxId"*, double }
%"class.soplex::DataArray.1" = type { i32, i32, %"class.soplex::SVector"**, double }
%"class.soplex::SLinSolver" = type { i32 (...)** }
%"class.soplex::SPxBasis::Desc" = type { %"class.soplex::DataArray.2", %"class.soplex::DataArray.2", %"class.soplex::DataArray.2"*, %"class.soplex::DataArray.2"* }
%"class.soplex::DataArray.2" = type { i32, i32, i32*, double }
%"class.soplex::Timer" = type { i32, i64, i64, i64, i64, i64, i64 }
%"class.soplex::Vector" = type { i32, double* }
%"class.soplex::Array" = type { i32, %"class.soplex::UnitVector"* }
%"class.soplex::UnitVector" = type { %"class.soplex::SVector", %"struct.soplex::SVector::Element", %"struct.soplex::SVector::Element" }
%"class.soplex::UpdateVector" = type { %"class.soplex::DVector", double, %"class.soplex::SSVector" }
%"class.soplex::SPxRatioTester" = type opaque
%"class.soplex::SPxStarter" = type opaque
%"class.soplex::SPxScaler" = type opaque
%"class.soplex::SPxSimplifier" = type opaque
%"class.soplex::DVector" = type { %"class.soplex::Vector", i32, double* }
%"class.soplex::SSVector" = type { %"class.soplex::DVector", %"class.soplex::IdxSet", i8, double }
%"class.soplex::IdxSet" = type { i32, i32, i32* }
%"class.soplex::SPxId" = type { %"class.soplex::DataKey" }
%"class.soplex::DataArray.3" = type { i32, i32, double*, double }
%"class.soplex::SPxLP" = type <{ i32 (...)**, %"class.soplex::LPRowSet", %"class.soplex::LPColSet", i32, [4 x i8] }>
%"class.soplex::SPxRowId" = type { %"class.soplex::DataKey" }
%"class.soplex::SPxColId" = type { %"class.soplex::DataKey" }

@_ZStL8__ioinit = internal global %"class.std::ios_base::Init" zeroinitializer, align 1
@__dso_handle = external global i8
@.str = private unnamed_addr constant [22 x i8] c"type == SoPlex::LEAVE\00", align 1
@.str1 = private unnamed_addr constant [14 x i8] c"spxsteeppr.cc\00", align 1
@__PRETTY_FUNCTION__._ZN6soplex10SPxSteepPR7setTypeENS_6SoPlex4TypeE = private unnamed_addr constant [55 x i8] c"virtual void soplex::SPxSteepPR::setType(SoPlex::Type)\00", align 1
@_ZSt4cerr = external global %"class.std::basic_ostream"
@.str2 = private unnamed_addr constant [65 x i8] c"sorry, no exact setup for steepest edge multipliers implemented\0A\00", align 1
@.str3 = private unnamed_addr constant [35 x i8] c"thesolver->type() == SoPlex::LEAVE\00", align 1
@__PRETTY_FUNCTION__._ZN6soplex10SPxSteepPR6left4XEiNS_5SPxIdEii = private unnamed_addr constant [62 x i8] c"void soplex::SPxSteepPR::left4X(int, soplex::SPxId, int, int)\00", align 1
@.str4 = private unnamed_addr constant [44 x i8] c"rhoVec[n] >= theeps || -rhoVec[n] >= theeps\00", align 1
@_ZN6soplex8infinityE = external constant double
@.str5 = private unnamed_addr constant [47 x i8] c"SPxSteepPR::selectLeaveX(): This shall not be!\00", align 1
@.str6 = private unnamed_addr constant [3 x i8] c"i=\00", align 1
@.str7 = private unnamed_addr constant [4 x i8] c" x=\00", align 1
@.str8 = private unnamed_addr constant [19 x i8] c" coPenalty_ptr[i]=\00", align 1
@.str9 = private unnamed_addr constant [9 x i8] c" theeps=\00", align 1
@.str10 = private unnamed_addr constant [15 x i8] c"isConsistent()\00", align 1
@__PRETTY_FUNCTION__._ZN6soplex10SPxSteepPR11selectLeaveEv = private unnamed_addr constant [46 x i8] c"virtual int soplex::SPxSteepPR::selectLeave()\00", align 1
@.str11 = private unnamed_addr constant [35 x i8] c"thesolver->type() == SoPlex::ENTER\00", align 1
@__PRETTY_FUNCTION__._ZN6soplex10SPxSteepPR9entered4XENS_5SPxIdEiiiii = private unnamed_addr constant [75 x i8] c"void soplex::SPxSteepPR::entered4X(soplex::SPxId, int, int, int, int, int)\00", align 1
@.str12 = private unnamed_addr constant [108 x i8] c"thesolver->fVec().delta()[n] > thesolver->epsilon() || thesolver->fVec().delta()[n] < -thesolver->epsilon()\00", align 1
@__PRETTY_FUNCTION__._ZN6soplex10SPxSteepPR12selectEnterXERdiiii = private unnamed_addr constant [75 x i8] c"soplex::SPxId soplex::SPxSteepPR::selectEnterX(Real &, int, int, int, int)\00", align 1
@.str13 = private unnamed_addr constant [15 x i8] c"thesolver != 0\00", align 1
@__PRETTY_FUNCTION__._ZN6soplex10SPxSteepPR10removedVecEi = private unnamed_addr constant [49 x i8] c"virtual void soplex::SPxSteepPR::removedVec(int)\00", align 1
@__PRETTY_FUNCTION__._ZN6soplex10SPxSteepPR11removedVecsEPKi = private unnamed_addr constant [58 x i8] c"virtual void soplex::SPxSteepPR::removedVecs(const int *)\00", align 1
@__PRETTY_FUNCTION__._ZN6soplex10SPxSteepPR12removedCoVecEi = private unnamed_addr constant [51 x i8] c"virtual void soplex::SPxSteepPR::removedCoVec(int)\00", align 1
@__PRETTY_FUNCTION__._ZN6soplex10SPxSteepPR13removedCoVecsEPKi = private unnamed_addr constant [60 x i8] c"virtual void soplex::SPxSteepPR::removedCoVecs(const int *)\00", align 1
@.str14 = private unnamed_addr constant [3 x i8] c"x[\00", align 1
@.str15 = private unnamed_addr constant [5 x i8] c"] = \00", align 1
@.str16 = private unnamed_addr constant [11 x i8] c"SPxSteepPR\00", align 1
@_ZTVN6soplex10SPxSteepPRE = unnamed_addr constant [23 x i8*] [i8* null, i8* bitcast ({ i8*, i8*, i8* }* @_ZTIN6soplex10SPxSteepPRE to i8*), i8* bitcast (i8* (%"class.soplex::SPxPricer"*)* @_ZNK6soplex9SPxPricer7getNameEv to i8*), i8* bitcast (void (%"class.soplex::SPxSteepPR"*, %"class.soplex::SoPlex"*)* @_ZN6soplex10SPxSteepPR4loadEPNS_6SoPlexE to i8*), i8* bitcast (void (%"class.soplex::SPxSteepPR"*)* @_ZN6soplex10SPxSteepPR5clearEv to i8*), i8* bitcast (%"class.soplex::SoPlex"* (%"class.soplex::SPxPricer"*)* @_ZNK6soplex9SPxPricer6solverEv to i8*), i8* bitcast (double (%"class.soplex::SPxPricer"*)* @_ZNK6soplex9SPxPricer7epsilonEv to i8*), i8* bitcast (void (%"class.soplex::SPxPricer"*, double)* @_ZN6soplex9SPxPricer10setEpsilonEd to i8*), i8* bitcast (void (%"class.soplex::SPxSteepPR"*, i32)* @_ZN6soplex10SPxSteepPR7setTypeENS_6SoPlex4TypeE to i8*), i8* bitcast (void (%"class.soplex::SPxSteepPR"*, i32)* @_ZN6soplex10SPxSteepPR6setRepENS_6SoPlex14RepresentationE to i8*), i8* bitcast (i32 (%"class.soplex::SPxSteepPR"*)* @_ZN6soplex10SPxSteepPR11selectLeaveEv to i8*), i8* bitcast (void (%"class.soplex::SPxSteepPR"*, i32, %"class.soplex::SPxId"*)* @_ZN6soplex10SPxSteepPR5left4EiNS_5SPxIdE to i8*), i8* bitcast (void (%"class.soplex::SPxId"*, %"class.soplex::SPxSteepPR"*)* @_ZN6soplex10SPxSteepPR11selectEnterEv to i8*), i8* bitcast (void (%"class.soplex::SPxSteepPR"*, %"class.soplex::SPxId"*, i32)* @_ZN6soplex10SPxSteepPR8entered4ENS_5SPxIdEi to i8*), i8* bitcast (void (%"class.soplex::SPxSteepPR"*, i32)* @_ZN6soplex10SPxSteepPR9addedVecsEi to i8*), i8* bitcast (void (%"class.soplex::SPxSteepPR"*, i32)* @_ZN6soplex10SPxSteepPR11addedCoVecsEi to i8*), i8* bitcast (void (%"class.soplex::SPxSteepPR"*, i32)* @_ZN6soplex10SPxSteepPR10removedVecEi to i8*), i8* bitcast (void (%"class.soplex::SPxSteepPR"*, i32*)* @_ZN6soplex10SPxSteepPR11removedVecsEPKi to i8*), i8* bitcast (void (%"class.soplex::SPxSteepPR"*, i32)* @_ZN6soplex10SPxSteepPR12removedCoVecEi to i8*), i8* bitcast (void (%"class.soplex::SPxSteepPR"*, i32*)* @_ZN6soplex10SPxSteepPR13removedCoVecsEPKi to i8*), i8* bitcast (i1 (%"class.soplex::SPxSteepPR"*)* @_ZNK6soplex10SPxSteepPR12isConsistentEv to i8*), i8* bitcast (void (%"class.soplex::SPxSteepPR"*)* @_ZN6soplex10SPxSteepPRD2Ev to i8*), i8* bitcast (void (%"class.soplex::SPxSteepPR"*)* @_ZN6soplex10SPxSteepPRD0Ev to i8*)], align 8
@_ZTVN10__cxxabiv120__si_class_type_infoE = external global i8*
@_ZTSN6soplex10SPxSteepPRE = constant [22 x i8] c"N6soplex10SPxSteepPRE\00"
@_ZTVN10__cxxabiv117__class_type_infoE = external global i8*
@_ZTSN6soplex9SPxPricerE = linkonce_odr constant [20 x i8] c"N6soplex9SPxPricerE\00"
@_ZTIN6soplex9SPxPricerE = linkonce_odr constant { i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8** @_ZTVN10__cxxabiv117__class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([20 x i8]* @_ZTSN6soplex9SPxPricerE, i32 0, i32 0) }
@_ZTIN6soplex10SPxSteepPRE = constant { i8*, i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8** @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([22 x i8]* @_ZTSN6soplex10SPxSteepPRE, i32 0, i32 0), i8* bitcast ({ i8*, i8* }* @_ZTIN6soplex9SPxPricerE to i8*) }
@.str17 = private unnamed_addr constant [7 x i8] c"n >= 0\00", align 1
@.str18 = private unnamed_addr constant [14 x i8] c"./dataarray.h\00", align 1
@__PRETTY_FUNCTION__._ZN6soplex9DataArrayIdEixEi = private unnamed_addr constant [59 x i8] c"T &soplex::DataArray<double>::operator[](int) [T = double]\00", align 1
@.str19 = private unnamed_addr constant [12 x i8] c"n < thesize\00", align 1
@.str20 = private unnamed_addr constant [15 x i8] c"memFactor >= 1\00", align 1
@__PRETTY_FUNCTION__._ZN6soplex9DataArrayIdE6reSizeEi = private unnamed_addr constant [57 x i8] c"void soplex::DataArray<double>::reSize(int) [T = double]\00", align 1
@.str21 = private unnamed_addr constant [7 x i8] c"p != 0\00", align 1
@.str22 = private unnamed_addr constant [13 x i8] c"./spxalloc.h\00", align 1
@__PRETTY_FUNCTION__._ZN6soplex11spx_reallocIPdEEvRT_i = private unnamed_addr constant [50 x i8] c"void soplex::spx_realloc(T &, int) [T = double *]\00", align 1
@.str23 = private unnamed_addr constant [23 x i8] c"realloc: Out of memory\00", align 1
@.str24 = private unnamed_addr constant [7 x i8] c"p == 0\00", align 1
@__PRETTY_FUNCTION__._ZN6soplex9spx_allocIPdEEvRT_i = private unnamed_addr constant [48 x i8] c"void soplex::spx_alloc(T &, int) [T = double *]\00", align 1
@.str25 = private unnamed_addr constant [22 x i8] c"malloc: Out of memory\00", align 1
@__PRETTY_FUNCTION__._ZN6soplex8spx_freeIPdEEvRT_ = private unnamed_addr constant [42 x i8] c"void soplex::spx_free(T &) [T = double *]\00", align 1
@_ZTVN6soplex9SPxPricerE = linkonce_odr unnamed_addr constant [23 x i8*] [i8* null, i8* bitcast ({ i8*, i8* }* @_ZTIN6soplex9SPxPricerE to i8*), i8* bitcast (i8* (%"class.soplex::SPxPricer"*)* @_ZNK6soplex9SPxPricer7getNameEv to i8*), i8* bitcast (void (%"class.soplex::SPxPricer"*, %"class.soplex::SoPlex"*)* @_ZN6soplex9SPxPricer4loadEPNS_6SoPlexE to i8*), i8* bitcast (void (%"class.soplex::SPxPricer"*)* @_ZN6soplex9SPxPricer5clearEv to i8*), i8* bitcast (%"class.soplex::SoPlex"* (%"class.soplex::SPxPricer"*)* @_ZNK6soplex9SPxPricer6solverEv to i8*), i8* bitcast (double (%"class.soplex::SPxPricer"*)* @_ZNK6soplex9SPxPricer7epsilonEv to i8*), i8* bitcast (void (%"class.soplex::SPxPricer"*, double)* @_ZN6soplex9SPxPricer10setEpsilonEd to i8*), i8* bitcast (void (%"class.soplex::SPxPricer"*, i32)* @_ZN6soplex9SPxPricer7setTypeENS_6SoPlex4TypeE to i8*), i8* bitcast (void (%"class.soplex::SPxPricer"*, i32)* @_ZN6soplex9SPxPricer6setRepENS_6SoPlex14RepresentationE to i8*), i8* bitcast (void ()* @__cxa_pure_virtual to i8*), i8* bitcast (void (%"class.soplex::SPxPricer"*, i32, %"class.soplex::SPxId"*)* @_ZN6soplex9SPxPricer5left4EiNS_5SPxIdE to i8*), i8* bitcast (void ()* @__cxa_pure_virtual to i8*), i8* bitcast (void (%"class.soplex::SPxPricer"*, %"class.soplex::SPxId"*, i32)* @_ZN6soplex9SPxPricer8entered4ENS_5SPxIdEi to i8*), i8* bitcast (void (%"class.soplex::SPxPricer"*, i32)* @_ZN6soplex9SPxPricer9addedVecsEi to i8*), i8* bitcast (void (%"class.soplex::SPxPricer"*, i32)* @_ZN6soplex9SPxPricer11addedCoVecsEi to i8*), i8* bitcast (void (%"class.soplex::SPxPricer"*, i32)* @_ZN6soplex9SPxPricer10removedVecEi to i8*), i8* bitcast (void (%"class.soplex::SPxPricer"*, i32*)* @_ZN6soplex9SPxPricer11removedVecsEPKi to i8*), i8* bitcast (void (%"class.soplex::SPxPricer"*, i32)* @_ZN6soplex9SPxPricer12removedCoVecEi to i8*), i8* bitcast (void (%"class.soplex::SPxPricer"*, i32*)* @_ZN6soplex9SPxPricer13removedCoVecsEPKi to i8*), i8* bitcast (i1 (%"class.soplex::SPxPricer"*)* @_ZNK6soplex9SPxPricer12isConsistentEv to i8*), i8* bitcast (void (%"class.soplex::SPxPricer"*)* @_ZN6soplex9SPxPricerD2Ev to i8*), i8* bitcast (void (%"class.soplex::SPxPricer"*)* @_ZN6soplex9SPxPricerD0Ev to i8*)], align 8
@.str26 = private unnamed_addr constant [11 x i8] c"eps >= 0.0\00", align 1
@.str27 = private unnamed_addr constant [14 x i8] c"./spxpricer.h\00", align 1
@__PRETTY_FUNCTION__._ZN6soplex9SPxPricer10setEpsilonEd = private unnamed_addr constant [49 x i8] c"virtual void soplex::SPxPricer::setEpsilon(Real)\00", align 1
@__PRETTY_FUNCTION__._ZN6soplex8spx_freeIPiEEvRT_ = private unnamed_addr constant [39 x i8] c"void soplex::spx_free(T &) [T = int *]\00", align 1
@.str28 = private unnamed_addr constant [20 x i8] c"n >= 0 && n < dim()\00", align 1
@.str29 = private unnamed_addr constant [11 x i8] c"./vector.h\00", align 1
@__PRETTY_FUNCTION__._ZNK6soplex6VectorixEi = private unnamed_addr constant [43 x i8] c"Real soplex::Vector::operator[](int) const\00", align 1
@__PRETTY_FUNCTION__._ZN6soplex9spx_allocIPiEEvRT_i = private unnamed_addr constant [45 x i8] c"void soplex::spx_alloc(T &, int) [T = int *]\00", align 1
@.str30 = private unnamed_addr constant [11 x i8] c"./idxset.h\00", align 1
@__PRETTY_FUNCTION__._ZN6soplex6IdxSetC2Ev = private unnamed_addr constant [25 x i8] c"soplex::IdxSet::IdxSet()\00", align 1
@.str31 = private unnamed_addr constant [16 x i8] c"type() == ENTER\00", align 1
@.str32 = private unnamed_addr constant [11 x i8] c"./soplex.h\00", align 1
@__PRETTY_FUNCTION__._ZN6soplex6SoPlex13setup4coSolveEPNS_6VectorEPNS_8SSVectorE = private unnamed_addr constant [73 x i8] c"void soplex::SoPlex::setup4coSolve(soplex::Vector *, soplex::SSVector *)\00", align 1
@.str33 = private unnamed_addr constant [15 x i8] c"p_id.isValid()\00", align 1
@__PRETTY_FUNCTION__._ZNK6soplex6SoPlex6vectorERKNS_5SPxIdE = private unnamed_addr constant [75 x i8] c"const soplex::SVector &soplex::SoPlex::vector(const soplex::SPxId &) const\00", align 1
@.str34 = private unnamed_addr constant [14 x i8] c"cid.isValid()\00", align 1
@__PRETTY_FUNCTION__._ZNK6soplex6SoPlex6vectorERKNS_8SPxColIdE = private unnamed_addr constant [78 x i8] c"const soplex::SVector &soplex::SoPlex::vector(const soplex::SPxColId &) const\00", align 1
@.str35 = private unnamed_addr constant [21 x i8] c"n >= 0 && n < size()\00", align 1
@.str36 = private unnamed_addr constant [10 x i8] c"./array.h\00", align 1
@__PRETTY_FUNCTION__._ZNK6soplex5ArrayINS_10UnitVectorEEixEi = private unnamed_addr constant [91 x i8] c"const T &soplex::Array<soplex::UnitVector>::operator[](int) const [T = soplex::UnitVector]\00", align 1
@.str37 = private unnamed_addr constant [11 x i8] c"n < thenum\00", align 1
@.str38 = private unnamed_addr constant [12 x i8] c"./dataset.h\00", align 1
@__PRETTY_FUNCTION__._ZNK6soplex7DataSetINS_5SVSet5DLPSVEEixEi = private unnamed_addr constant [103 x i8] c"const DATA &soplex::DataSet<soplex::SVSet::DLPSV>::operator[](int) const [DATA = soplex::SVSet::DLPSV]\00", align 1
@.str39 = private unnamed_addr constant [14 x i8] c"rid.isValid()\00", align 1
@__PRETTY_FUNCTION__._ZNK6soplex6SoPlex6vectorERKNS_8SPxRowIdE = private unnamed_addr constant [78 x i8] c"const soplex::SVector &soplex::SoPlex::vector(const soplex::SPxRowId &) const\00", align 1
@.str40 = private unnamed_addr constant [20 x i8] c"n >= 0 && n < num()\00", align 1
@__PRETTY_FUNCTION__._ZNK6soplex7DataSetINS_5SVSet5DLPSVEE3keyEi = private unnamed_addr constant [100 x i8] c"soplex::DataKey soplex::DataSet<soplex::SVSet::DLPSV>::key(int) const [DATA = soplex::SVSet::DLPSV]\00", align 1
@__PRETTY_FUNCTION__._ZNK6soplex6SoPlex6coTestEv = private unnamed_addr constant [53 x i8] c"const soplex::Vector &soplex::SoPlex::coTest() const\00", align 1
@__PRETTY_FUNCTION__._ZNK6soplex6SoPlex4testEv = private unnamed_addr constant [51 x i8] c"const soplex::Vector &soplex::SoPlex::test() const\00", align 1
@.str41 = private unnamed_addr constant [16 x i8] c"type() == LEAVE\00", align 1
@__PRETTY_FUNCTION__._ZN6soplex6SoPlex11setup4solveEPNS_6VectorEPNS_8SSVectorE = private unnamed_addr constant [71 x i8] c"void soplex::SoPlex::setup4solve(soplex::Vector *, soplex::SSVector *)\00", align 1
@__PRETTY_FUNCTION__._ZNK6soplex6SoPlex5fTestEv = private unnamed_addr constant [52 x i8] c"const soplex::Vector &soplex::SoPlex::fTest() const\00", align 1
@__PRETTY_FUNCTION__._ZNK6soplex6IdxSet5indexEi = private unnamed_addr constant [37 x i8] c"int soplex::IdxSet::index(int) const\00", align 1
@.str42 = private unnamed_addr constant [14 x i8] c"matrixIsSetup\00", align 1
@.str43 = private unnamed_addr constant [13 x i8] c"./spxbasis.h\00", align 1
@__PRETTY_FUNCTION__._ZNK6soplex8SPxBasis7baseVecEi = private unnamed_addr constant [60 x i8] c"const soplex::SVector &soplex::SPxBasis::baseVec(int) const\00", align 1
@__PRETTY_FUNCTION__._ZNK6soplex9DataArrayIPKNS_7SVectorEEixEi = private unnamed_addr constant [105 x i8] c"const T &soplex::DataArray<const soplex::SVector *>::operator[](int) const [T = const soplex::SVector *]\00", align 1
@__PRETTY_FUNCTION__._ZN6soplex9DataArrayINS_5SPxIdEEixEi = private unnamed_addr constant [73 x i8] c"T &soplex::DataArray<soplex::SPxId>::operator[](int) [T = soplex::SPxId]\00", align 1
@__PRETTY_FUNCTION__._ZN6soplex6VectorixEi = private unnamed_addr constant [38 x i8] c"Real &soplex::Vector::operator[](int)\00", align 1
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__sub_I_spxsteeppr.cc, i8* null }]

define internal void @__cxx_global_var_init() section ".text.startup" {
  call void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* @_ZStL8__ioinit)
  %1 = call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.std::ios_base::Init"*)* @_ZNSt8ios_base4InitD1Ev to void (i8*)*), i8* getelementptr inbounds (%"class.std::ios_base::Init"* @_ZStL8__ioinit, i32 0, i32 0), i8* @__dso_handle) #1
  ret void
}

declare void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"*) #0

declare void @_ZNSt8ios_base4InitD1Ev(%"class.std::ios_base::Init"*) #0

; Function Attrs: nounwind
declare i32 @__cxa_atexit(void (i8*)*, i8*, i8*) #1

; Function Attrs: nounwind uwtable
define void @_ZN6soplex10SPxSteepPR5clearEv(%"class.soplex::SPxSteepPR"* %this) unnamed_addr #2 align 2 {
  %1 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %2 = getelementptr inbounds %"class.soplex::SPxPricer"* %1, i32 0, i32 2
  store %"class.soplex::SoPlex"* null, %"class.soplex::SoPlex"** %2, align 8
  %3 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 8
  store i32 0, i32* %3, align 4
  ret void
}

; Function Attrs: uwtable
define void @_ZN6soplex10SPxSteepPR4loadEPNS_6SoPlexE(%"class.soplex::SPxSteepPR"* %this, %"class.soplex::SoPlex"* %base) unnamed_addr #3 align 2 {
  %1 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %2 = getelementptr inbounds %"class.soplex::SPxPricer"* %1, i32 0, i32 2
  store %"class.soplex::SoPlex"* %base, %"class.soplex::SoPlex"** %2, align 8
  %3 = icmp ne %"class.soplex::SoPlex"* %base, null
  br i1 %3, label %4, label %19

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 3
  %6 = bitcast %"class.soplex::DVector"* %5 to %"class.soplex::Vector"*
  call void @_ZN6soplex6Vector5clearEv(%"class.soplex::Vector"* %6)
  %7 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 3
  %8 = call i32 @_ZNK6soplex6SoPlex3dimEv(%"class.soplex::SoPlex"* %base)
  call void @_ZN6soplex7DVector5reDimEi(%"class.soplex::DVector"* %7, i32 %8)
  %9 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 4
  call void @_ZN6soplex8SSVector5clearEv(%"class.soplex::SSVector"* %9)
  %10 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 4
  %11 = call i32 @_ZNK6soplex6SoPlex3dimEv(%"class.soplex::SoPlex"* %base)
  call void @_ZN6soplex8SSVector5reDimEi(%"class.soplex::SSVector"* %10, i32 %11)
  %12 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 11
  %13 = call i32 @_ZNK6soplex6SoPlex3dimEv(%"class.soplex::SoPlex"* %base)
  call void @_ZN6soplex9DataArrayIdE6reSizeEi(%"class.soplex::DataArray.3"* %12, i32 %13)
  %14 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 9
  %15 = call i32 @_ZNK6soplex6SoPlex3dimEv(%"class.soplex::SoPlex"* %base)
  call void @_ZN6soplex9DataArrayIdE6reSizeEi(%"class.soplex::DataArray.3"* %14, i32 %15)
  %16 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 10
  %17 = call i32 @_ZNK6soplex6SoPlex5coDimEv(%"class.soplex::SoPlex"* %base)
  call void @_ZN6soplex9DataArrayIdE6reSizeEi(%"class.soplex::DataArray.3"* %16, i32 %17)
  %18 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 8
  store i32 0, i32* %18, align 4
  br label %19

; <label>:19                                      ; preds = %4, %0
  ret void
}

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN6soplex6Vector5clearEv(%"class.soplex::Vector"* %this) #2 align 2 {
  %1 = getelementptr inbounds %"class.soplex::Vector"* %this, i32 0, i32 0
  %2 = load i32* %1, align 4
  %3 = icmp ne i32 %2, 0
  br i1 %3, label %4, label %12

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds %"class.soplex::Vector"* %this, i32 0, i32 1
  %6 = load double** %5, align 8
  %7 = bitcast double* %6 to i8*
  %8 = getelementptr inbounds %"class.soplex::Vector"* %this, i32 0, i32 0
  %9 = load i32* %8, align 4
  %10 = sext i32 %9 to i64
  %11 = mul i64 %10, 8
  call void @llvm.memset.p0i8.i64(i8* %7, i8 0, i64 %11, i32 8, i1 false)
  br label %12

; <label>:12                                      ; preds = %4, %0
  ret void
}

declare void @_ZN6soplex7DVector5reDimEi(%"class.soplex::DVector"*, i32) #0

; Function Attrs: nounwind uwtable
define linkonce_odr i32 @_ZNK6soplex6SoPlex3dimEv(%"class.soplex::SoPlex"* %this) #2 align 2 {
  %1 = getelementptr inbounds %"class.soplex::SoPlex"* %this, i32 0, i32 23
  %2 = load %"class.soplex::SVSet"** %1, align 8
  %3 = call i32 @_ZNK6soplex5SVSet3numEv(%"class.soplex::SVSet"* %2)
  ret i32 %3
}

declare void @_ZN6soplex8SSVector5clearEv(%"class.soplex::SSVector"*) #0

declare void @_ZN6soplex8SSVector5reDimEi(%"class.soplex::SSVector"*, i32) #0

; Function Attrs: uwtable
define linkonce_odr void @_ZN6soplex9DataArrayIdE6reSizeEi(%"class.soplex::DataArray.3"* %this, i32 %newsize) #3 align 2 {
  %1 = getelementptr inbounds %"class.soplex::DataArray.3"* %this, i32 0, i32 3
  %2 = load double* %1, align 8
  %3 = fcmp oge double %2, 1.000000e+00
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  br label %7

; <label>:5                                       ; preds = %0
  call void @__assert_fail(i8* getelementptr inbounds ([15 x i8]* @.str20, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8]* @.str18, i32 0, i32 0), i32 207, i8* getelementptr inbounds ([57 x i8]* @__PRETTY_FUNCTION__._ZN6soplex9DataArrayIdE6reSizeEi, i32 0, i32 0)) #10
  unreachable
                                                  ; No predecessors!
  br label %7

; <label>:7                                       ; preds = %6, %4
  %8 = getelementptr inbounds %"class.soplex::DataArray.3"* %this, i32 0, i32 1
  %9 = load i32* %8, align 4
  %10 = icmp sgt i32 %newsize, %9
  br i1 %10, label %11, label %18

; <label>:11                                      ; preds = %7
  %12 = getelementptr inbounds %"class.soplex::DataArray.3"* %this, i32 0, i32 3
  %13 = load double* %12, align 8
  %14 = sitofp i32 %newsize to double
  %15 = fmul double %13, %14
  %16 = fptosi double %15 to i32
  %17 = call i64 @_ZN6soplex9DataArrayIdE5reMaxEii(%"class.soplex::DataArray.3"* %this, i32 %16, i32 %newsize)
  br label %25

; <label>:18                                      ; preds = %7
  %19 = icmp slt i32 %newsize, 0
  br i1 %19, label %20, label %22

; <label>:20                                      ; preds = %18
  %21 = getelementptr inbounds %"class.soplex::DataArray.3"* %this, i32 0, i32 0
  store i32 0, i32* %21, align 4
  br label %24

; <label>:22                                      ; preds = %18
  %23 = getelementptr inbounds %"class.soplex::DataArray.3"* %this, i32 0, i32 0
  store i32 %newsize, i32* %23, align 4
  br label %24

; <label>:24                                      ; preds = %22, %20
  br label %25

; <label>:25                                      ; preds = %24, %11
  ret void
}

; Function Attrs: nounwind uwtable
define linkonce_odr i32 @_ZNK6soplex6SoPlex5coDimEv(%"class.soplex::SoPlex"* %this) #2 align 2 {
  %1 = getelementptr inbounds %"class.soplex::SoPlex"* %this, i32 0, i32 22
  %2 = load %"class.soplex::SVSet"** %1, align 8
  %3 = call i32 @_ZNK6soplex5SVSet3numEv(%"class.soplex::SVSet"* %2)
  ret i32 %3
}

; Function Attrs: uwtable
define void @_ZN6soplex10SPxSteepPR7setTypeENS_6SoPlex4TypeE(%"class.soplex::SPxSteepPR"* %this, i32 %type) unnamed_addr #3 align 2 {
  %id = alloca %"class.soplex::SPxId", align 4
  %1 = alloca %"class.soplex::SPxId", align 4
  %2 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %3 = getelementptr inbounds %"class.soplex::SPxPricer"* %2, i32 0, i32 2
  %4 = load %"class.soplex::SoPlex"** %3, align 8
  %5 = call double @_ZNK6soplex6SoPlex7epsilonEv(%"class.soplex::SoPlex"* %4)
  %6 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 4
  %7 = getelementptr inbounds %"class.soplex::SSVector"* %6, i32 0, i32 3
  store double %5, double* %7, align 8
  %8 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 10
  %9 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %10 = getelementptr inbounds %"class.soplex::SPxPricer"* %9, i32 0, i32 2
  %11 = load %"class.soplex::SoPlex"** %10, align 8
  %12 = call i32 @_ZNK6soplex6SoPlex5coDimEv(%"class.soplex::SoPlex"* %11)
  call void @_ZN6soplex9DataArrayIdE6reSizeEi(%"class.soplex::DataArray.3"* %8, i32 %12)
  %13 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 9
  %14 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %15 = getelementptr inbounds %"class.soplex::SPxPricer"* %14, i32 0, i32 2
  %16 = load %"class.soplex::SoPlex"** %15, align 8
  %17 = call i32 @_ZNK6soplex6SoPlex3dimEv(%"class.soplex::SoPlex"* %16)
  call void @_ZN6soplex9DataArrayIdE6reSizeEi(%"class.soplex::DataArray.3"* %13, i32 %17)
  call void @_ZN6soplex10SPxSteepPR10setupPrefsENS_6SoPlex4TypeE(%"class.soplex::SPxSteepPR"* %this, i32 %type)
  %18 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 12
  %19 = load i32* %18, align 4
  %20 = icmp eq i32 %19, 1
  br i1 %20, label %21, label %130

; <label>:21                                      ; preds = %0
  %22 = icmp eq i32 %type, -1
  br i1 %22, label %23, label %62

; <label>:23                                      ; preds = %21
  %24 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 2
  %25 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %26 = getelementptr inbounds %"class.soplex::SPxPricer"* %25, i32 0, i32 2
  %27 = load %"class.soplex::SoPlex"** %26, align 8
  %28 = call i32 @_ZNK6soplex6SoPlex3dimEv(%"class.soplex::SoPlex"* %27)
  call void @_ZN6soplex7DVector5reDimEi(%"class.soplex::DVector"* %24, i32 %28)
  %29 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %30 = getelementptr inbounds %"class.soplex::SPxPricer"* %29, i32 0, i32 2
  %31 = load %"class.soplex::SoPlex"** %30, align 8
  %32 = call i32 @_ZNK6soplex6SoPlex3dimEv(%"class.soplex::SoPlex"* %31)
  %33 = sub nsw i32 %32, 1
  br label %34

; <label>:34                                      ; preds = %40, %23
  %i.0 = phi i32 [ %33, %23 ], [ %41, %40 ]
  %35 = icmp sge i32 %i.0, 0
  br i1 %35, label %36, label %42

; <label>:36                                      ; preds = %34
  %37 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 2
  %38 = bitcast %"class.soplex::DVector"* %37 to %"class.soplex::Vector"*
  %39 = call dereferenceable(8) double* @_ZN6soplex6VectorixEi(%"class.soplex::Vector"* %38, i32 %i.0)
  store double 2.000000e+00, double* %39
  br label %40

; <label>:40                                      ; preds = %36
  %41 = add nsw i32 %i.0, -1
  br label %34

; <label>:42                                      ; preds = %34
  %43 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 1
  %44 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %45 = getelementptr inbounds %"class.soplex::SPxPricer"* %44, i32 0, i32 2
  %46 = load %"class.soplex::SoPlex"** %45, align 8
  %47 = call i32 @_ZNK6soplex6SoPlex5coDimEv(%"class.soplex::SoPlex"* %46)
  call void @_ZN6soplex7DVector5reDimEi(%"class.soplex::DVector"* %43, i32 %47)
  %48 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %49 = getelementptr inbounds %"class.soplex::SPxPricer"* %48, i32 0, i32 2
  %50 = load %"class.soplex::SoPlex"** %49, align 8
  %51 = call i32 @_ZNK6soplex6SoPlex5coDimEv(%"class.soplex::SoPlex"* %50)
  %52 = sub nsw i32 %51, 1
  br label %53

; <label>:53                                      ; preds = %59, %42
  %i.1 = phi i32 [ %52, %42 ], [ %60, %59 ]
  %54 = icmp sge i32 %i.1, 0
  br i1 %54, label %55, label %61

; <label>:55                                      ; preds = %53
  %56 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 1
  %57 = bitcast %"class.soplex::DVector"* %56 to %"class.soplex::Vector"*
  %58 = call dereferenceable(8) double* @_ZN6soplex6VectorixEi(%"class.soplex::Vector"* %57, i32 %i.1)
  store double 1.000000e+00, double* %58
  br label %59

; <label>:59                                      ; preds = %55
  %60 = add nsw i32 %i.1, -1
  br label %53

; <label>:61                                      ; preds = %53
  br label %129

; <label>:62                                      ; preds = %21
  %63 = icmp eq i32 %type, 1
  br i1 %63, label %64, label %65

; <label>:64                                      ; preds = %62
  br label %67

; <label>:65                                      ; preds = %62
  call void @__assert_fail(i8* getelementptr inbounds ([22 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8]* @.str1, i32 0, i32 0), i32 85, i8* getelementptr inbounds ([55 x i8]* @__PRETTY_FUNCTION__._ZN6soplex10SPxSteepPR7setTypeENS_6SoPlex4TypeE, i32 0, i32 0)) #10
  unreachable
                                                  ; No predecessors!
  br label %67

; <label>:67                                      ; preds = %66, %64
  %68 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 2
  %69 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %70 = getelementptr inbounds %"class.soplex::SPxPricer"* %69, i32 0, i32 2
  %71 = load %"class.soplex::SoPlex"** %70, align 8
  %72 = call i32 @_ZNK6soplex6SoPlex3dimEv(%"class.soplex::SoPlex"* %71)
  call void @_ZN6soplex7DVector5reDimEi(%"class.soplex::DVector"* %68, i32 %72)
  %73 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %74 = getelementptr inbounds %"class.soplex::SPxPricer"* %73, i32 0, i32 2
  %75 = load %"class.soplex::SoPlex"** %74, align 8
  %76 = call i32 @_ZNK6soplex6SoPlex3dimEv(%"class.soplex::SoPlex"* %75)
  %77 = sub nsw i32 %76, 1
  br label %78

; <label>:78                                      ; preds = %126, %67
  %i.2 = phi i32 [ %77, %67 ], [ %127, %126 ]
  %79 = icmp sge i32 %i.2, 0
  br i1 %79, label %80, label %128

; <label>:80                                      ; preds = %78
  %81 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %82 = getelementptr inbounds %"class.soplex::SPxPricer"* %81, i32 0, i32 2
  %83 = load %"class.soplex::SoPlex"** %82, align 8
  %84 = call dereferenceable(208) %"class.soplex::SPxBasis"* @_ZN6soplex6SoPlex5basisEv(%"class.soplex::SoPlex"* %83)
  %85 = call dereferenceable(4) %"class.soplex::SPxId"* @_ZN6soplex8SPxBasis6baseIdEi(%"class.soplex::SPxBasis"* %84, i32 %i.2)
  call void @_ZN6soplex5SPxIdC2ERKS0_(%"class.soplex::SPxId"* %id, %"class.soplex::SPxId"* dereferenceable(4) %85)
  %86 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %87 = getelementptr inbounds %"class.soplex::SPxPricer"* %86, i32 0, i32 2
  %88 = load %"class.soplex::SoPlex"** %87, align 8
  %89 = bitcast %"class.soplex::SoPlex"* %88 to %"class.soplex::SPxLP"*
  %90 = call i32 @_ZNK6soplex5SPxLP6numberERKNS_5SPxIdE(%"class.soplex::SPxLP"* %89, %"class.soplex::SPxId"* dereferenceable(4) %id)
  %91 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %92 = getelementptr inbounds %"class.soplex::SPxPricer"* %91, i32 0, i32 2
  %93 = load %"class.soplex::SoPlex"** %92, align 8
  call void @_ZN6soplex5SPxIdC2ERKS0_(%"class.soplex::SPxId"* %1, %"class.soplex::SPxId"* dereferenceable(4) %id)
  %94 = call i32 @_ZNK6soplex6SoPlex4isIdENS_5SPxIdE(%"class.soplex::SoPlex"* %93, %"class.soplex::SPxId"* %1)
  %95 = icmp ne i32 %94, 0
  br i1 %95, label %96, label %102

; <label>:96                                      ; preds = %80
  %97 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 10
  %98 = call dereferenceable(8) double* @_ZN6soplex9DataArrayIdEixEi(%"class.soplex::DataArray.3"* %97, i32 %90)
  %99 = load double* %98
  %100 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 11
  %101 = call dereferenceable(8) double* @_ZN6soplex9DataArrayIdEixEi(%"class.soplex::DataArray.3"* %100, i32 %i.2)
  store double %99, double* %101
  br label %108

; <label>:102                                     ; preds = %80
  %103 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 9
  %104 = call dereferenceable(8) double* @_ZN6soplex9DataArrayIdEixEi(%"class.soplex::DataArray.3"* %103, i32 %90)
  %105 = load double* %104
  %106 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 11
  %107 = call dereferenceable(8) double* @_ZN6soplex9DataArrayIdEixEi(%"class.soplex::DataArray.3"* %106, i32 %i.2)
  store double %105, double* %107
  br label %108

; <label>:108                                     ; preds = %102, %96
  %109 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %110 = getelementptr inbounds %"class.soplex::SPxPricer"* %109, i32 0, i32 2
  %111 = load %"class.soplex::SoPlex"** %110, align 8
  %112 = call dereferenceable(208) %"class.soplex::SPxBasis"* @_ZN6soplex6SoPlex5basisEv(%"class.soplex::SoPlex"* %111)
  %113 = call dereferenceable(8) %"class.soplex::SVector"* @_ZNK6soplex8SPxBasis7baseVecEi(%"class.soplex::SPxBasis"* %112, i32 %i.2)
  %114 = call i32 @_ZNK6soplex7SVector4sizeEv(%"class.soplex::SVector"* %113)
  %115 = sitofp i32 %114 to double
  %116 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %117 = getelementptr inbounds %"class.soplex::SPxPricer"* %116, i32 0, i32 2
  %118 = load %"class.soplex::SoPlex"** %117, align 8
  %119 = call i32 @_ZNK6soplex6SoPlex3dimEv(%"class.soplex::SoPlex"* %118)
  %120 = sitofp i32 %119 to double
  %121 = fdiv double %115, %120
  %122 = fadd double 1.000000e+00, %121
  %123 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 2
  %124 = bitcast %"class.soplex::DVector"* %123 to %"class.soplex::Vector"*
  %125 = call dereferenceable(8) double* @_ZN6soplex6VectorixEi(%"class.soplex::Vector"* %124, i32 %i.2)
  store double %122, double* %125
  br label %126

; <label>:126                                     ; preds = %108
  %127 = add nsw i32 %i.2, -1
  br label %78

; <label>:128                                     ; preds = %78
  br label %129

; <label>:129                                     ; preds = %128, %61
  br label %218

; <label>:130                                     ; preds = %0
  %131 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cerr, i8* getelementptr inbounds ([65 x i8]* @.str2, i32 0, i32 0))
  %132 = icmp eq i32 %type, -1
  br i1 %132, label %133, label %178

; <label>:133                                     ; preds = %130
  %134 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 2
  %135 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %136 = getelementptr inbounds %"class.soplex::SPxPricer"* %135, i32 0, i32 2
  %137 = load %"class.soplex::SoPlex"** %136, align 8
  %138 = call i32 @_ZNK6soplex6SoPlex3dimEv(%"class.soplex::SoPlex"* %137)
  call void @_ZN6soplex7DVector5reDimEi(%"class.soplex::DVector"* %134, i32 %138)
  %139 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %140 = getelementptr inbounds %"class.soplex::SPxPricer"* %139, i32 0, i32 2
  %141 = load %"class.soplex::SoPlex"** %140, align 8
  %142 = call i32 @_ZNK6soplex6SoPlex3dimEv(%"class.soplex::SoPlex"* %141)
  %143 = sub nsw i32 %142, 1
  br label %144

; <label>:144                                     ; preds = %150, %133
  %i.3 = phi i32 [ %143, %133 ], [ %151, %150 ]
  %145 = icmp sge i32 %i.3, 0
  br i1 %145, label %146, label %152

; <label>:146                                     ; preds = %144
  %147 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 2
  %148 = bitcast %"class.soplex::DVector"* %147 to %"class.soplex::Vector"*
  %149 = call dereferenceable(8) double* @_ZN6soplex6VectorixEi(%"class.soplex::Vector"* %148, i32 %i.3)
  store double 1.000000e+00, double* %149
  br label %150

; <label>:150                                     ; preds = %146
  %151 = add nsw i32 %i.3, -1
  br label %144

; <label>:152                                     ; preds = %144
  %153 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 1
  %154 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %155 = getelementptr inbounds %"class.soplex::SPxPricer"* %154, i32 0, i32 2
  %156 = load %"class.soplex::SoPlex"** %155, align 8
  %157 = call i32 @_ZNK6soplex6SoPlex5coDimEv(%"class.soplex::SoPlex"* %156)
  call void @_ZN6soplex7DVector5reDimEi(%"class.soplex::DVector"* %153, i32 %157)
  %158 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %159 = getelementptr inbounds %"class.soplex::SPxPricer"* %158, i32 0, i32 2
  %160 = load %"class.soplex::SoPlex"** %159, align 8
  %161 = call i32 @_ZNK6soplex6SoPlex5coDimEv(%"class.soplex::SoPlex"* %160)
  %162 = sub nsw i32 %161, 1
  br label %163

; <label>:163                                     ; preds = %175, %152
  %i.4 = phi i32 [ %162, %152 ], [ %176, %175 ]
  %164 = icmp sge i32 %i.4, 0
  br i1 %164, label %165, label %177

; <label>:165                                     ; preds = %163
  %166 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %167 = getelementptr inbounds %"class.soplex::SPxPricer"* %166, i32 0, i32 2
  %168 = load %"class.soplex::SoPlex"** %167, align 8
  %169 = call dereferenceable(8) %"class.soplex::SVector"* @_ZNK6soplex6SoPlex6vectorEi(%"class.soplex::SoPlex"* %168, i32 %i.4)
  %170 = call double @_ZNK6soplex7SVector7length2Ev(%"class.soplex::SVector"* %169)
  %171 = fadd double 1.000000e+00, %170
  %172 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 1
  %173 = bitcast %"class.soplex::DVector"* %172 to %"class.soplex::Vector"*
  %174 = call dereferenceable(8) double* @_ZN6soplex6VectorixEi(%"class.soplex::Vector"* %173, i32 %i.4)
  store double %171, double* %174
  br label %175

; <label>:175                                     ; preds = %165
  %176 = add nsw i32 %i.4, -1
  br label %163

; <label>:177                                     ; preds = %163
  br label %217

; <label>:178                                     ; preds = %130
  %179 = icmp eq i32 %type, 1
  br i1 %179, label %180, label %181

; <label>:180                                     ; preds = %178
  br label %183

; <label>:181                                     ; preds = %178
  call void @__assert_fail(i8* getelementptr inbounds ([22 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8]* @.str1, i32 0, i32 0), i32 117, i8* getelementptr inbounds ([55 x i8]* @__PRETTY_FUNCTION__._ZN6soplex10SPxSteepPR7setTypeENS_6SoPlex4TypeE, i32 0, i32 0)) #10
  unreachable
                                                  ; No predecessors!
  br label %183

; <label>:183                                     ; preds = %182, %180
  %184 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 2
  %185 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %186 = getelementptr inbounds %"class.soplex::SPxPricer"* %185, i32 0, i32 2
  %187 = load %"class.soplex::SoPlex"** %186, align 8
  %188 = call i32 @_ZNK6soplex6SoPlex3dimEv(%"class.soplex::SoPlex"* %187)
  call void @_ZN6soplex7DVector5reDimEi(%"class.soplex::DVector"* %184, i32 %188)
  %189 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %190 = getelementptr inbounds %"class.soplex::SPxPricer"* %189, i32 0, i32 2
  %191 = load %"class.soplex::SoPlex"** %190, align 8
  %192 = call i32 @_ZNK6soplex6SoPlex3dimEv(%"class.soplex::SoPlex"* %191)
  %193 = sub nsw i32 %192, 1
  br label %194

; <label>:194                                     ; preds = %214, %183
  %i.5 = phi i32 [ %193, %183 ], [ %215, %214 ]
  %195 = icmp sge i32 %i.5, 0
  br i1 %195, label %196, label %216

; <label>:196                                     ; preds = %194
  %197 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %198 = getelementptr inbounds %"class.soplex::SPxPricer"* %197, i32 0, i32 2
  %199 = load %"class.soplex::SoPlex"** %198, align 8
  %200 = call dereferenceable(208) %"class.soplex::SPxBasis"* @_ZN6soplex6SoPlex5basisEv(%"class.soplex::SoPlex"* %199)
  %201 = call dereferenceable(8) %"class.soplex::SVector"* @_ZNK6soplex8SPxBasis7baseVecEi(%"class.soplex::SPxBasis"* %200, i32 %i.5)
  %202 = call i32 @_ZNK6soplex7SVector4sizeEv(%"class.soplex::SVector"* %201)
  %203 = sitofp i32 %202 to double
  %204 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %205 = getelementptr inbounds %"class.soplex::SPxPricer"* %204, i32 0, i32 2
  %206 = load %"class.soplex::SoPlex"** %205, align 8
  %207 = call i32 @_ZNK6soplex6SoPlex3dimEv(%"class.soplex::SoPlex"* %206)
  %208 = sitofp i32 %207 to double
  %209 = fdiv double %203, %208
  %210 = fadd double 1.000000e+00, %209
  %211 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 2
  %212 = bitcast %"class.soplex::DVector"* %211 to %"class.soplex::Vector"*
  %213 = call dereferenceable(8) double* @_ZN6soplex6VectorixEi(%"class.soplex::Vector"* %212, i32 %i.5)
  store double %210, double* %213
  br label %214

; <label>:214                                     ; preds = %196
  %215 = add nsw i32 %i.5, -1
  br label %194

; <label>:216                                     ; preds = %194
  br label %217

; <label>:217                                     ; preds = %216, %177
  br label %218

; <label>:218                                     ; preds = %217, %129
  %219 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 3
  %220 = bitcast %"class.soplex::DVector"* %219 to %"class.soplex::Vector"*
  call void @_ZN6soplex6Vector5clearEv(%"class.soplex::Vector"* %220)
  %221 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 4
  call void @_ZN6soplex8SSVector5clearEv(%"class.soplex::SSVector"* %221)
  ret void
}

; Function Attrs: uwtable
define linkonce_odr double @_ZNK6soplex6SoPlex7epsilonEv(%"class.soplex::SoPlex"* %this) #3 align 2 {
  %1 = getelementptr inbounds %"class.soplex::SoPlex"* %this, i32 0, i32 27
  %2 = call dereferenceable(64) %"class.soplex::SSVector"* @_ZNK6soplex12UpdateVector5deltaEv(%"class.soplex::UpdateVector"* %1)
  %3 = getelementptr inbounds %"class.soplex::SSVector"* %2, i32 0, i32 3
  %4 = load double* %3, align 8
  ret double %4
}

; Function Attrs: uwtable
define void @_ZN6soplex10SPxSteepPR10setupPrefsENS_6SoPlex4TypeE(%"class.soplex::SPxSteepPR"* %this, i32 %tp) #3 align 2 {
  %1 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 8
  %2 = load i32* %1, align 4
  %3 = icmp ne i32 %tp, %2
  br i1 %3, label %4, label %23

; <label>:4                                       ; preds = %0
  %5 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %6 = getelementptr inbounds %"class.soplex::SPxPricer"* %5, i32 0, i32 2
  %7 = load %"class.soplex::SoPlex"** %6, align 8
  %8 = call i32 @_ZNK6soplex6SoPlex3dimEv(%"class.soplex::SoPlex"* %7)
  %9 = add nsw i32 1, %8
  %10 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %11 = getelementptr inbounds %"class.soplex::SPxPricer"* %10, i32 0, i32 2
  %12 = load %"class.soplex::SoPlex"** %11, align 8
  %13 = call i32 @_ZNK6soplex6SoPlex5coDimEv(%"class.soplex::SoPlex"* %12)
  %14 = add nsw i32 %9, %13
  %15 = sitofp i32 %14 to double
  %16 = fdiv double 1.000000e-08, %15
  %17 = icmp eq i32 %tp, -1
  br i1 %17, label %18, label %20

; <label>:18                                      ; preds = %4
  %19 = fsub double -0.000000e+00, %16
  call void @_ZN6soplex10SPxSteepPR10setupPrefsEdddddiiii(%"class.soplex::SPxSteepPR"* %this, double %19, double -1.000000e-05, double -1.000000e-05, double 1.000000e+00, double 1.000000e+00, i32 0, i32 0, i32 -1, i32 -1)
  br label %21

; <label>:20                                      ; preds = %4
  call void @_ZN6soplex10SPxSteepPR10setupPrefsEdddddiiii(%"class.soplex::SPxSteepPR"* %this, double %16, double 1.000000e-05, double 1.000000e-05, double 1.000000e+00, double 1.000000e+00, i32 0, i32 0, i32 -1, i32 -1)
  br label %21

; <label>:21                                      ; preds = %20, %18
  %22 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 8
  store i32 %tp, i32* %22, align 4
  br label %23

; <label>:23                                      ; preds = %21, %0
  ret void
}

; Function Attrs: nounwind uwtable
define linkonce_odr dereferenceable(8) double* @_ZN6soplex6VectorixEi(%"class.soplex::Vector"* %this, i32 %n) #2 align 2 {
  %1 = icmp sge i32 %n, 0
  br i1 %1, label %2, label %6

; <label>:2                                       ; preds = %0
  %3 = call i32 @_ZNK6soplex6Vector3dimEv(%"class.soplex::Vector"* %this)
  %4 = icmp slt i32 %n, %3
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %2
  br label %8

; <label>:6                                       ; preds = %2, %0
  call void @__assert_fail(i8* getelementptr inbounds ([20 x i8]* @.str28, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8]* @.str29, i32 0, i32 0), i32 153, i8* getelementptr inbounds ([38 x i8]* @__PRETTY_FUNCTION__._ZN6soplex6VectorixEi, i32 0, i32 0)) #10
  unreachable
                                                  ; No predecessors!
  br label %8

; <label>:8                                       ; preds = %7, %5
  %9 = sext i32 %n to i64
  %10 = getelementptr inbounds %"class.soplex::Vector"* %this, i32 0, i32 1
  %11 = load double** %10, align 8
  %12 = getelementptr inbounds double* %11, i64 %9
  ret double* %12
}

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) #4

; Function Attrs: nounwind uwtable
define linkonce_odr dereferenceable(208) %"class.soplex::SPxBasis"* @_ZN6soplex6SoPlex5basisEv(%"class.soplex::SoPlex"* %this) #2 align 2 {
  %1 = bitcast %"class.soplex::SoPlex"* %this to i8*
  %2 = getelementptr inbounds i8* %1, i64 352
  %3 = bitcast i8* %2 to %"class.soplex::SPxBasis"*
  ret %"class.soplex::SPxBasis"* %3
}

; Function Attrs: uwtable
define linkonce_odr dereferenceable(4) %"class.soplex::SPxId"* @_ZN6soplex8SPxBasis6baseIdEi(%"class.soplex::SPxBasis"* %this, i32 %i) #3 align 2 {
  %1 = getelementptr inbounds %"class.soplex::SPxBasis"* %this, i32 0, i32 2
  %2 = call dereferenceable(4) %"class.soplex::SPxId"* @_ZN6soplex9DataArrayINS_5SPxIdEEixEi(%"class.soplex::DataArray.0"* %1, i32 %i)
  ret %"class.soplex::SPxId"* %2
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr void @_ZN6soplex5SPxIdC2ERKS0_(%"class.soplex::SPxId"* %this, %"class.soplex::SPxId"* dereferenceable(4)) unnamed_addr #5 align 2 {
  %2 = bitcast %"class.soplex::SPxId"* %this to %"class.soplex::DataKey"*
  %3 = bitcast %"class.soplex::SPxId"* %0 to %"class.soplex::DataKey"*
  call void @_ZN6soplex7DataKeyC2ERKS0_(%"class.soplex::DataKey"* %2, %"class.soplex::DataKey"* dereferenceable(4) %3)
  ret void
}

; Function Attrs: uwtable
define linkonce_odr i32 @_ZNK6soplex5SPxLP6numberERKNS_5SPxIdE(%"class.soplex::SPxLP"* %this, %"class.soplex::SPxId"* dereferenceable(4) %id) #3 align 2 {
  %1 = call i32 @_ZNK6soplex5SPxId4typeEv(%"class.soplex::SPxId"* %id)
  %2 = icmp eq i32 %1, 1
  br i1 %2, label %3, label %9

; <label>:3                                       ; preds = %0
  %4 = bitcast %"class.soplex::SPxLP"* %this to i8*
  %5 = getelementptr inbounds i8* %4, i64 160
  %6 = bitcast i8* %5 to %"class.soplex::LPColSet"*
  %7 = bitcast %"class.soplex::SPxId"* %id to %"class.soplex::DataKey"*
  %8 = call i32 @_ZNK6soplex8LPColSet6numberERKNS_7DataKeyE(%"class.soplex::LPColSet"* %6, %"class.soplex::DataKey"* dereferenceable(4) %7)
  br label %15

; <label>:9                                       ; preds = %0
  %10 = bitcast %"class.soplex::SPxLP"* %this to i8*
  %11 = getelementptr inbounds i8* %10, i64 8
  %12 = bitcast i8* %11 to %"class.soplex::LPRowSet"*
  %13 = bitcast %"class.soplex::SPxId"* %id to %"class.soplex::DataKey"*
  %14 = call i32 @_ZNK6soplex8LPRowSet6numberERKNS_7DataKeyE(%"class.soplex::LPRowSet"* %12, %"class.soplex::DataKey"* dereferenceable(4) %13)
  br label %15

; <label>:15                                      ; preds = %9, %3
  %16 = phi i32 [ %8, %3 ], [ %14, %9 ]
  ret i32 %16
}

; Function Attrs: nounwind uwtable
define linkonce_odr i32 @_ZNK6soplex6SoPlex4isIdENS_5SPxIdE(%"class.soplex::SoPlex"* %this, %"class.soplex::SPxId"* %p_id) #2 align 2 {
  %1 = bitcast %"class.soplex::SPxId"* %p_id to %"class.soplex::DataKey"*
  %2 = bitcast %"class.soplex::DataKey"* %1 to i32*
  %3 = load i32* %2, align 4
  %4 = shl i32 %3, 24
  %5 = ashr i32 %4, 24
  %6 = getelementptr inbounds %"class.soplex::SoPlex"* %this, i32 0, i32 4
  %7 = load i32* %6, align 4
  %8 = mul nsw i32 %5, %7
  %9 = icmp sgt i32 %8, 0
  %10 = zext i1 %9 to i32
  ret i32 %10
}

; Function Attrs: nounwind uwtable
define linkonce_odr dereferenceable(8) double* @_ZN6soplex9DataArrayIdEixEi(%"class.soplex::DataArray.3"* %this, i32 %n) #2 align 2 {
  %1 = icmp sge i32 %n, 0
  br i1 %1, label %2, label %3

; <label>:2                                       ; preds = %0
  br label %5

; <label>:3                                       ; preds = %0
  call void @__assert_fail(i8* getelementptr inbounds ([7 x i8]* @.str17, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8]* @.str18, i32 0, i32 0), i32 89, i8* getelementptr inbounds ([59 x i8]* @__PRETTY_FUNCTION__._ZN6soplex9DataArrayIdEixEi, i32 0, i32 0)) #10
  unreachable
                                                  ; No predecessors!
  br label %5

; <label>:5                                       ; preds = %4, %2
  %6 = getelementptr inbounds %"class.soplex::DataArray.3"* %this, i32 0, i32 0
  %7 = load i32* %6, align 4
  %8 = icmp slt i32 %n, %7
  br i1 %8, label %9, label %10

; <label>:9                                       ; preds = %5
  br label %12

; <label>:10                                      ; preds = %5
  call void @__assert_fail(i8* getelementptr inbounds ([12 x i8]* @.str19, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8]* @.str18, i32 0, i32 0), i32 90, i8* getelementptr inbounds ([59 x i8]* @__PRETTY_FUNCTION__._ZN6soplex9DataArrayIdEixEi, i32 0, i32 0)) #10
  unreachable
                                                  ; No predecessors!
  br label %12

; <label>:12                                      ; preds = %11, %9
  %13 = sext i32 %n to i64
  %14 = getelementptr inbounds %"class.soplex::DataArray.3"* %this, i32 0, i32 2
  %15 = load double** %14, align 8
  %16 = getelementptr inbounds double* %15, i64 %13
  ret double* %16
}

; Function Attrs: uwtable
define linkonce_odr dereferenceable(8) %"class.soplex::SVector"* @_ZNK6soplex8SPxBasis7baseVecEi(%"class.soplex::SPxBasis"* %this, i32 %i) #3 align 2 {
  %1 = getelementptr inbounds %"class.soplex::SPxBasis"* %this, i32 0, i32 4
  %2 = load i8* %1, align 1
  %3 = trunc i8 %2 to i1
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  br label %7

; <label>:5                                       ; preds = %0
  call void @__assert_fail(i8* getelementptr inbounds ([14 x i8]* @.str42, i32 0, i32 0), i8* getelementptr inbounds ([13 x i8]* @.str43, i32 0, i32 0), i32 429, i8* getelementptr inbounds ([60 x i8]* @__PRETTY_FUNCTION__._ZNK6soplex8SPxBasis7baseVecEi, i32 0, i32 0)) #10
  unreachable
                                                  ; No predecessors!
  br label %7

; <label>:7                                       ; preds = %6, %4
  %8 = getelementptr inbounds %"class.soplex::SPxBasis"* %this, i32 0, i32 3
  %9 = call dereferenceable(8) %"class.soplex::SVector"** @_ZNK6soplex9DataArrayIPKNS_7SVectorEEixEi(%"class.soplex::DataArray.1"* %8, i32 %i)
  %10 = load %"class.soplex::SVector"** %9
  ret %"class.soplex::SVector"* %10
}

; Function Attrs: nounwind uwtable
define linkonce_odr i32 @_ZNK6soplex7SVector4sizeEv(%"class.soplex::SVector"* %this) #2 align 2 {
  %1 = getelementptr inbounds %"class.soplex::SVector"* %this, i32 0, i32 0
  %2 = load %"struct.soplex::SVector::Element"** %1, align 8
  %3 = icmp ne %"struct.soplex::SVector::Element"* %2, null
  br i1 %3, label %4, label %10

; <label>:4                                       ; preds = %0
  %5 = getelementptr inbounds %"class.soplex::SVector"* %this, i32 0, i32 0
  %6 = load %"struct.soplex::SVector::Element"** %5, align 8
  %7 = getelementptr inbounds %"struct.soplex::SVector::Element"* %6, i64 -1
  %8 = getelementptr inbounds %"struct.soplex::SVector::Element"* %7, i32 0, i32 1
  %9 = load i32* %8, align 4
  br label %11

; <label>:10                                      ; preds = %0
  br label %11

; <label>:11                                      ; preds = %10, %4
  %.0 = phi i32 [ %9, %4 ], [ 0, %10 ]
  ret i32 %.0
}

declare dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272), i8*) #0

; Function Attrs: uwtable
define linkonce_odr dereferenceable(8) %"class.soplex::SVector"* @_ZNK6soplex6SoPlex6vectorEi(%"class.soplex::SoPlex"* %this, i32 %i) #3 align 2 {
  %1 = getelementptr inbounds %"class.soplex::SoPlex"* %this, i32 0, i32 22
  %2 = load %"class.soplex::SVSet"** %1, align 8
  %3 = call dereferenceable(8) %"class.soplex::SVector"* @_ZNK6soplex5SVSetixEi(%"class.soplex::SVSet"* %2, i32 %i)
  ret %"class.soplex::SVector"* %3
}

declare double @_ZNK6soplex7SVector7length2Ev(%"class.soplex::SVector"*) #0

; Function Attrs: uwtable
define void @_ZN6soplex10SPxSteepPR10setupPrefsEdddddiiii(%"class.soplex::SPxSteepPR"* %this, double %mult, double, double, double %shift, double %coshift, i32 %rs, i32 %cs, i32 %re, i32 %ce) #3 align 2 {
  %3 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %4 = getelementptr inbounds %"class.soplex::SPxPricer"* %3, i32 0, i32 2
  %5 = load %"class.soplex::SoPlex"** %4, align 8
  %6 = call i32 @_ZNK6soplex6SoPlex3repEv(%"class.soplex::SoPlex"* %5)
  %7 = icmp eq i32 %6, 1
  br i1 %7, label %8, label %13

; <label>:8                                       ; preds = %2
  %9 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 10
  %10 = call double* @_ZN6soplex9DataArrayIdE7get_ptrEv(%"class.soplex::DataArray.3"* %9)
  %11 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 9
  %12 = call double* @_ZN6soplex9DataArrayIdE7get_ptrEv(%"class.soplex::DataArray.3"* %11)
  br label %18

; <label>:13                                      ; preds = %2
  %14 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 10
  %15 = call double* @_ZN6soplex9DataArrayIdE7get_ptrEv(%"class.soplex::DataArray.3"* %14)
  %16 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 9
  %17 = call double* @_ZN6soplex9DataArrayIdE7get_ptrEv(%"class.soplex::DataArray.3"* %16)
  br label %18

; <label>:18                                      ; preds = %13, %8
  %p.0 = phi double* [ %12, %8 ], [ %15, %13 ]
  %cp.0 = phi double* [ %10, %8 ], [ %17, %13 ]
  %rshift.0 = phi double [ %coshift, %8 ], [ %shift, %13 ]
  %cshift.0 = phi double [ %shift, %8 ], [ %coshift, %13 ]
  %19 = icmp slt i32 %re, 0
  br i1 %19, label %20, label %26

; <label>:20                                      ; preds = %18
  %21 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %22 = getelementptr inbounds %"class.soplex::SPxPricer"* %21, i32 0, i32 2
  %23 = load %"class.soplex::SoPlex"** %22, align 8
  %24 = bitcast %"class.soplex::SoPlex"* %23 to %"class.soplex::SPxLP"*
  %25 = call i32 @_ZNK6soplex5SPxLP5nRowsEv(%"class.soplex::SPxLP"* %24)
  br label %26

; <label>:26                                      ; preds = %20, %18
  %.01 = phi i32 [ %25, %20 ], [ %re, %18 ]
  br label %27

; <label>:27                                      ; preds = %30, %26
  %i.0 = phi i32 [ %.01, %26 ], [ %28, %30 ]
  %28 = add nsw i32 %i.0, -1
  %29 = icmp sge i32 %28, %rs
  br i1 %29, label %30, label %33

; <label>:30                                      ; preds = %27
  %31 = sext i32 %28 to i64
  %32 = getelementptr inbounds double* %p.0, i64 %31
  store double %rshift.0, double* %32, align 8
  br label %27

; <label>:33                                      ; preds = %27
  %34 = icmp slt i32 %ce, 0
  br i1 %34, label %35, label %41

; <label>:35                                      ; preds = %33
  %36 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %37 = getelementptr inbounds %"class.soplex::SPxPricer"* %36, i32 0, i32 2
  %38 = load %"class.soplex::SoPlex"** %37, align 8
  %39 = bitcast %"class.soplex::SoPlex"* %38 to %"class.soplex::SPxLP"*
  %40 = call i32 @_ZNK6soplex5SPxLP5nColsEv(%"class.soplex::SPxLP"* %39)
  br label %41

; <label>:41                                      ; preds = %35, %33
  %.0 = phi i32 [ %40, %35 ], [ %ce, %33 ]
  br label %42

; <label>:42                                      ; preds = %45, %41
  %i.1 = phi i32 [ %.0, %41 ], [ %43, %45 ]
  %43 = add nsw i32 %i.1, -1
  %44 = icmp sge i32 %43, %cs
  br i1 %44, label %45, label %48

; <label>:45                                      ; preds = %42
  %46 = sext i32 %43 to i64
  %47 = getelementptr inbounds double* %cp.0, i64 %46
  store double %cshift.0, double* %47, align 8
  br label %42

; <label>:48                                      ; preds = %42
  %49 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 9
  %50 = call double* @_ZN6soplex9DataArrayIdE7get_ptrEv(%"class.soplex::DataArray.3"* %49)
  %51 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 9
  %52 = call i32 @_ZNK6soplex9DataArrayIdE4sizeEv(%"class.soplex::DataArray.3"* %51)
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds double* %50, i64 %53
  br label %55

; <label>:55                                      ; preds = %57, %48
  %cp.1 = phi double* [ %50, %48 ], [ %62, %57 ]
  %i.2 = phi i32 [ 0, %48 ], [ %58, %57 ]
  %56 = icmp ult double* %cp.1, %54
  br i1 %56, label %57, label %65

; <label>:57                                      ; preds = %55
  %58 = add nsw i32 %i.2, 1
  %59 = sitofp i32 %i.2 to double
  %60 = fmul double %mult, %59
  %61 = fsub double 1.000000e+00, %60
  %62 = getelementptr inbounds double* %cp.1, i32 1
  %63 = load double* %cp.1, align 8
  %64 = fmul double %63, %61
  store double %64, double* %cp.1, align 8
  br label %55

; <label>:65                                      ; preds = %55
  %66 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 10
  %67 = call double* @_ZN6soplex9DataArrayIdE7get_ptrEv(%"class.soplex::DataArray.3"* %66)
  %68 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 10
  %69 = call i32 @_ZNK6soplex9DataArrayIdE4sizeEv(%"class.soplex::DataArray.3"* %68)
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds double* %67, i64 %70
  %72 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 10
  %73 = call i32 @_ZNK6soplex9DataArrayIdE4sizeEv(%"class.soplex::DataArray.3"* %72)
  br label %74

; <label>:74                                      ; preds = %76, %65
  %p.1 = phi double* [ %67, %65 ], [ %81, %76 ]
  %i.3 = phi i32 [ %73, %65 ], [ %77, %76 ]
  %75 = icmp ult double* %p.1, %71
  br i1 %75, label %76, label %84

; <label>:76                                      ; preds = %74
  %77 = add nsw i32 %i.3, -1
  %78 = sitofp i32 %i.3 to double
  %79 = fmul double %mult, %78
  %80 = fadd double 1.000000e+00, %79
  %81 = getelementptr inbounds double* %p.1, i32 1
  %82 = load double* %p.1, align 8
  %83 = fmul double %82, %80
  store double %83, double* %p.1, align 8
  br label %74

; <label>:84                                      ; preds = %74
  ret void
}

; Function Attrs: nounwind uwtable
define linkonce_odr i32 @_ZNK6soplex6SoPlex3repEv(%"class.soplex::SoPlex"* %this) #2 align 2 {
  %1 = getelementptr inbounds %"class.soplex::SoPlex"* %this, i32 0, i32 4
  %2 = load i32* %1, align 4
  ret i32 %2
}

; Function Attrs: nounwind uwtable
define linkonce_odr double* @_ZN6soplex9DataArrayIdE7get_ptrEv(%"class.soplex::DataArray.3"* %this) #2 align 2 {
  %1 = getelementptr inbounds %"class.soplex::DataArray.3"* %this, i32 0, i32 2
  %2 = load double** %1, align 8
  ret double* %2
}

; Function Attrs: uwtable
define linkonce_odr i32 @_ZNK6soplex5SPxLP5nRowsEv(%"class.soplex::SPxLP"* %this) #3 align 2 {
  %1 = bitcast %"class.soplex::SPxLP"* %this to i8*
  %2 = getelementptr inbounds i8* %1, i64 8
  %3 = bitcast i8* %2 to %"class.soplex::LPRowSet"*
  %4 = call i32 @_ZNK6soplex8LPRowSet3numEv(%"class.soplex::LPRowSet"* %3)
  ret i32 %4
}

; Function Attrs: uwtable
define linkonce_odr i32 @_ZNK6soplex5SPxLP5nColsEv(%"class.soplex::SPxLP"* %this) #3 align 2 {
  %1 = bitcast %"class.soplex::SPxLP"* %this to i8*
  %2 = getelementptr inbounds i8* %1, i64 160
  %3 = bitcast i8* %2 to %"class.soplex::LPColSet"*
  %4 = call i32 @_ZNK6soplex8LPColSet3numEv(%"class.soplex::LPColSet"* %3)
  ret i32 %4
}

; Function Attrs: nounwind uwtable
define linkonce_odr i32 @_ZNK6soplex9DataArrayIdE4sizeEv(%"class.soplex::DataArray.3"* %this) #2 align 2 {
  %1 = getelementptr inbounds %"class.soplex::DataArray.3"* %this, i32 0, i32 0
  %2 = load i32* %1, align 4
  ret i32 %2
}

; Function Attrs: uwtable
define void @_ZN6soplex10SPxSteepPR6setRepENS_6SoPlex14RepresentationE(%"class.soplex::SPxSteepPR"* %this, i32) unnamed_addr #3 align 2 {
  %tmp = alloca %"class.soplex::DVector", align 8
  %2 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 3
  %3 = bitcast %"class.soplex::DVector"* %2 to %"class.soplex::Vector"*
  %4 = call i32 @_ZNK6soplex6Vector3dimEv(%"class.soplex::Vector"* %3)
  %5 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %6 = getelementptr inbounds %"class.soplex::SPxPricer"* %5, i32 0, i32 2
  %7 = load %"class.soplex::SoPlex"** %6, align 8
  %8 = call i32 @_ZNK6soplex6SoPlex3dimEv(%"class.soplex::SoPlex"* %7)
  %9 = icmp ne i32 %4, %8
  br i1 %9, label %10, label %34

; <label>:10                                      ; preds = %1
  %11 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 1
  call void @_ZN6soplex7DVectorC1ERKS0_(%"class.soplex::DVector"* %tmp, %"class.soplex::DVector"* dereferenceable(32) %11)
  %12 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 1
  %13 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 2
  %14 = invoke dereferenceable(32) %"class.soplex::DVector"* @_ZN6soplex7DVectoraSERKS0_(%"class.soplex::DVector"* %12, %"class.soplex::DVector"* dereferenceable(32) %13)
          to label %15 unwind label %29

; <label>:15                                      ; preds = %10
  %16 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 2
  %17 = invoke dereferenceable(32) %"class.soplex::DVector"* @_ZN6soplex7DVectoraSERKS0_(%"class.soplex::DVector"* %16, %"class.soplex::DVector"* dereferenceable(32) %tmp)
          to label %18 unwind label %29

; <label>:18                                      ; preds = %15
  %19 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 3
  %20 = bitcast %"class.soplex::DVector"* %19 to %"class.soplex::Vector"*
  invoke void @_ZN6soplex6Vector5clearEv(%"class.soplex::Vector"* %20)
          to label %21 unwind label %29

; <label>:21                                      ; preds = %18
  %22 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 3
  %23 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %24 = getelementptr inbounds %"class.soplex::SPxPricer"* %23, i32 0, i32 2
  %25 = load %"class.soplex::SoPlex"** %24, align 8
  %26 = invoke i32 @_ZNK6soplex6SoPlex3dimEv(%"class.soplex::SoPlex"* %25)
          to label %27 unwind label %29

; <label>:27                                      ; preds = %21
  invoke void @_ZN6soplex7DVector5reDimEi(%"class.soplex::DVector"* %22, i32 %26)
          to label %28 unwind label %29

; <label>:28                                      ; preds = %27
  call void @_ZN6soplex7DVectorD1Ev(%"class.soplex::DVector"* %tmp)
  br label %34

; <label>:29                                      ; preds = %27, %21, %18, %15, %10
  %30 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
  %31 = extractvalue { i8*, i32 } %30, 0
  %32 = extractvalue { i8*, i32 } %30, 1
  invoke void @_ZN6soplex7DVectorD1Ev(%"class.soplex::DVector"* %tmp)
          to label %33 unwind label %38

; <label>:33                                      ; preds = %29
  br label %35

; <label>:34                                      ; preds = %28, %1
  ret void

; <label>:35                                      ; preds = %33
  %36 = insertvalue { i8*, i32 } undef, i8* %31, 0
  %37 = insertvalue { i8*, i32 } %36, i32 %32, 1
  resume { i8*, i32 } %37

; <label>:38                                      ; preds = %29
  %39 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          catch i8* null
  %40 = extractvalue { i8*, i32 } %39, 0
  call void @__clang_call_terminate(i8* %40) #10
  unreachable
}

; Function Attrs: nounwind uwtable
define linkonce_odr i32 @_ZNK6soplex6Vector3dimEv(%"class.soplex::Vector"* %this) #2 align 2 {
  %1 = getelementptr inbounds %"class.soplex::Vector"* %this, i32 0, i32 0
  %2 = load i32* %1, align 4
  ret i32 %2
}

declare void @_ZN6soplex7DVectorC1ERKS0_(%"class.soplex::DVector"*, %"class.soplex::DVector"* dereferenceable(32)) #0

; Function Attrs: uwtable
define linkonce_odr dereferenceable(32) %"class.soplex::DVector"* @_ZN6soplex7DVectoraSERKS0_(%"class.soplex::DVector"* %this, %"class.soplex::DVector"* dereferenceable(32) %vec) #3 align 2 {
  %1 = icmp ne %"class.soplex::DVector"* %this, %vec
  br i1 %1, label %2, label %15

; <label>:2                                       ; preds = %0
  %3 = bitcast %"class.soplex::DVector"* %vec to %"class.soplex::Vector"*
  %4 = call i32 @_ZNK6soplex6Vector3dimEv(%"class.soplex::Vector"* %3)
  %5 = bitcast %"class.soplex::DVector"* %this to %"class.soplex::Vector"*
  %6 = call i32 @_ZNK6soplex6Vector3dimEv(%"class.soplex::Vector"* %5)
  %7 = icmp ne i32 %4, %6
  br i1 %7, label %8, label %11

; <label>:8                                       ; preds = %2
  %9 = bitcast %"class.soplex::DVector"* %vec to %"class.soplex::Vector"*
  %10 = call i32 @_ZNK6soplex6Vector3dimEv(%"class.soplex::Vector"* %9)
  call void @_ZN6soplex7DVector5reDimEi(%"class.soplex::DVector"* %this, i32 %10)
  br label %11

; <label>:11                                      ; preds = %8, %2
  %12 = bitcast %"class.soplex::DVector"* %this to %"class.soplex::Vector"*
  %13 = bitcast %"class.soplex::DVector"* %vec to %"class.soplex::Vector"*
  %14 = call dereferenceable(16) %"class.soplex::Vector"* @_ZN6soplex6VectoraSERKS0_(%"class.soplex::Vector"* %12, %"class.soplex::Vector"* dereferenceable(16) %13)
  br label %15

; <label>:15                                      ; preds = %11, %0
  ret %"class.soplex::DVector"* %this
}

declare i32 @__gxx_personality_v0(...)

declare void @_ZN6soplex7DVectorD1Ev(%"class.soplex::DVector"*) #0

; Function Attrs: noinline noreturn nounwind
define linkonce_odr hidden void @__clang_call_terminate(i8*) #6 {
  %2 = call i8* @__cxa_begin_catch(i8* %0) #1
  call void @_ZSt9terminatev() #10
  unreachable
}

declare i8* @__cxa_begin_catch(i8*)

declare void @_ZSt9terminatev()

; Function Attrs: uwtable
define void @_ZN6soplex10SPxSteepPR6left4XEiNS_5SPxIdEii(%"class.soplex::SPxSteepPR"* %this, i32 %n, %"class.soplex::SPxId"* %id, i32 %start, i32 %incr) #3 align 2 {
  %1 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %2 = getelementptr inbounds %"class.soplex::SPxPricer"* %1, i32 0, i32 2
  %3 = load %"class.soplex::SoPlex"** %2, align 8
  %4 = call i32 @_ZNK6soplex6SoPlex4typeEv(%"class.soplex::SoPlex"* %3)
  %5 = icmp eq i32 %4, 1
  br i1 %5, label %6, label %7

; <label>:6                                       ; preds = %0
  br label %9

; <label>:7                                       ; preds = %0
  call void @__assert_fail(i8* getelementptr inbounds ([35 x i8]* @.str3, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8]* @.str1, i32 0, i32 0), i32 225, i8* getelementptr inbounds ([62 x i8]* @__PRETTY_FUNCTION__._ZN6soplex10SPxSteepPR6left4XEiNS_5SPxIdEii, i32 0, i32 0)) #10
  unreachable
                                                  ; No predecessors!
  br label %9

; <label>:9                                       ; preds = %8, %6
  %10 = call zeroext i1 @_ZNK6soplex5SPxId7isValidEv(%"class.soplex::SPxId"* %id)
  br i1 %10, label %11, label %120

; <label>:11                                      ; preds = %9
  %12 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %13 = getelementptr inbounds %"class.soplex::SPxPricer"* %12, i32 0, i32 2
  %14 = load %"class.soplex::SoPlex"** %13, align 8
  %15 = call dereferenceable(208) %"class.soplex::SPxBasis"* @_ZN6soplex6SoPlex5basisEv(%"class.soplex::SoPlex"* %14)
  %16 = call i32 @_ZNK6soplex8SPxBasis9iterationEv(%"class.soplex::SPxBasis"* %15)
  %17 = sitofp i32 %16 to double
  %18 = fdiv double 1.000000e+00, %17
  %19 = fadd double 1.000000e-01, %18
  %20 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 2
  %21 = bitcast %"class.soplex::DVector"* %20 to %"class.soplex::Vector"*
  %22 = call double* @_ZN6soplex6Vector7get_ptrEv(%"class.soplex::Vector"* %21)
  %23 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 3
  %24 = bitcast %"class.soplex::DVector"* %23 to %"class.soplex::Vector"*
  %25 = call double* @_ZNK6soplex6Vector13get_const_ptrEv(%"class.soplex::Vector"* %24)
  %26 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %27 = getelementptr inbounds %"class.soplex::SPxPricer"* %26, i32 0, i32 2
  %28 = load %"class.soplex::SoPlex"** %27, align 8
  %29 = call dereferenceable(104) %"class.soplex::UpdateVector"* @_ZNK6soplex6SoPlex4fVecEv(%"class.soplex::SoPlex"* %28)
  %30 = call dereferenceable(64) %"class.soplex::SSVector"* @_ZN6soplex12UpdateVector5deltaEv(%"class.soplex::UpdateVector"* %29)
  %31 = call double* @_ZNK6soplex8SSVector6valuesEv(%"class.soplex::SSVector"* %30)
  %32 = sext i32 %n to i64
  %33 = getelementptr inbounds double* %31, i64 %32
  %34 = load double* %33, align 8
  %35 = fdiv double 1.000000e+00, %34
  %36 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %37 = getelementptr inbounds %"class.soplex::SPxPricer"* %36, i32 0, i32 2
  %38 = load %"class.soplex::SoPlex"** %37, align 8
  %39 = call dereferenceable(104) %"class.soplex::UpdateVector"* @_ZNK6soplex6SoPlex6coPvecEv(%"class.soplex::SoPlex"* %38)
  %40 = call dereferenceable(64) %"class.soplex::SSVector"* @_ZN6soplex12UpdateVector5deltaEv(%"class.soplex::UpdateVector"* %39)
  %41 = call double @_ZNK6soplex8SSVector7length2Ev(%"class.soplex::SSVector"* %40)
  %42 = fmul double %41, %35
  %43 = fmul double %42, %35
  %44 = sext i32 %n to i64
  %45 = getelementptr inbounds double* %31, i64 %44
  %46 = load double* %45, align 8
  %47 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %48 = getelementptr inbounds %"class.soplex::SPxPricer"* %47, i32 0, i32 3
  %49 = load double* %48, align 8
  %50 = fcmp oge double %46, %49
  br i1 %50, label %60, label %51

; <label>:51                                      ; preds = %11
  %52 = sext i32 %n to i64
  %53 = getelementptr inbounds double* %31, i64 %52
  %54 = load double* %53, align 8
  %55 = fsub double -0.000000e+00, %54
  %56 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %57 = getelementptr inbounds %"class.soplex::SPxPricer"* %56, i32 0, i32 3
  %58 = load double* %57, align 8
  %59 = fcmp oge double %55, %58
  br i1 %59, label %60, label %61

; <label>:60                                      ; preds = %51, %11
  br label %63

; <label>:61                                      ; preds = %51
  call void @__assert_fail(i8* getelementptr inbounds ([44 x i8]* @.str4, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8]* @.str1, i32 0, i32 0), i32 240, i8* getelementptr inbounds ([62 x i8]* @__PRETTY_FUNCTION__._ZN6soplex10SPxSteepPR6left4XEiNS_5SPxIdEii, i32 0, i32 0)) #10
  unreachable
                                                  ; No predecessors!
  br label %63

; <label>:63                                      ; preds = %62, %60
  %64 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %65 = getelementptr inbounds %"class.soplex::SPxPricer"* %64, i32 0, i32 2
  %66 = load %"class.soplex::SoPlex"** %65, align 8
  %67 = call dereferenceable(104) %"class.soplex::UpdateVector"* @_ZNK6soplex6SoPlex4fVecEv(%"class.soplex::SoPlex"* %66)
  %68 = call dereferenceable(16) %"class.soplex::IdxSet"* @_ZNK6soplex12UpdateVector3idxEv(%"class.soplex::UpdateVector"* %67)
  %69 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %70 = getelementptr inbounds %"class.soplex::SPxPricer"* %69, i32 0, i32 2
  %71 = load %"class.soplex::SoPlex"** %70, align 8
  %72 = call dereferenceable(104) %"class.soplex::UpdateVector"* @_ZNK6soplex6SoPlex4fVecEv(%"class.soplex::SoPlex"* %71)
  %73 = call dereferenceable(16) %"class.soplex::IdxSet"* @_ZNK6soplex12UpdateVector3idxEv(%"class.soplex::UpdateVector"* %72)
  %74 = call i32 @_ZNK6soplex6IdxSet4sizeEv(%"class.soplex::IdxSet"* %73)
  %75 = sub nsw i32 %74, 1
  %76 = sub nsw i32 %75, %start
  br label %77

; <label>:77                                      ; preds = %115, %63
  %i.0 = phi i32 [ %76, %63 ], [ %116, %115 ]
  %78 = icmp sge i32 %i.0, 0
  br i1 %78, label %79, label %117

; <label>:79                                      ; preds = %77
  %80 = call i32 @_ZNK6soplex6IdxSet5indexEi(%"class.soplex::IdxSet"* %68, i32 %i.0)
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds double* %31, i64 %81
  %83 = load double* %82, align 8
  %84 = sext i32 %80 to i64
  %85 = getelementptr inbounds double* %31, i64 %84
  %86 = load double* %85, align 8
  %87 = fmul double %43, %86
  %88 = fmul double 2.000000e+00, %35
  %89 = sext i32 %80 to i64
  %90 = getelementptr inbounds double* %25, i64 %89
  %91 = load double* %90, align 8
  %92 = fmul double %88, %91
  %93 = fsub double %87, %92
  %94 = fmul double %83, %93
  %95 = sext i32 %80 to i64
  %96 = getelementptr inbounds double* %22, i64 %95
  %97 = load double* %96, align 8
  %98 = fadd double %97, %94
  store double %98, double* %96, align 8
  %99 = fcmp olt double %98, %19
  br i1 %99, label %100, label %103

; <label>:100                                     ; preds = %79
  %101 = sext i32 %80 to i64
  %102 = getelementptr inbounds double* %22, i64 %101
  store double %19, double* %102, align 8
  br label %114

; <label>:103                                     ; preds = %79
  %104 = load double* @_ZN6soplex8infinityE, align 8
  %105 = fcmp oge double %98, %104
  br i1 %105, label %106, label %113

; <label>:106                                     ; preds = %103
  %107 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %108 = getelementptr inbounds %"class.soplex::SPxPricer"* %107, i32 0, i32 3
  %109 = load double* %108, align 8
  %110 = fdiv double 1.000000e+00, %109
  %111 = sext i32 %80 to i64
  %112 = getelementptr inbounds double* %22, i64 %111
  store double %110, double* %112, align 8
  br label %113

; <label>:113                                     ; preds = %106, %103
  br label %114

; <label>:114                                     ; preds = %113, %100
  br label %115

; <label>:115                                     ; preds = %114
  %116 = sub nsw i32 %i.0, %incr
  br label %77

; <label>:117                                     ; preds = %77
  %118 = sext i32 %n to i64
  %119 = getelementptr inbounds double* %22, i64 %118
  store double %43, double* %119, align 8
  br label %120

; <label>:120                                     ; preds = %117, %9
  ret void
}

; Function Attrs: nounwind uwtable
define linkonce_odr i32 @_ZNK6soplex6SoPlex4typeEv(%"class.soplex::SoPlex"* %this) #2 align 2 {
  %1 = getelementptr inbounds %"class.soplex::SoPlex"* %this, i32 0, i32 2
  %2 = load i32* %1, align 4
  ret i32 %2
}

; Function Attrs: nounwind uwtable
define linkonce_odr zeroext i1 @_ZNK6soplex5SPxId7isValidEv(%"class.soplex::SPxId"* %this) #2 align 2 {
  %1 = bitcast %"class.soplex::SPxId"* %this to %"class.soplex::DataKey"*
  %2 = bitcast %"class.soplex::DataKey"* %1 to i32*
  %3 = load i32* %2, align 4
  %4 = shl i32 %3, 24
  %5 = ashr i32 %4, 24
  %6 = icmp ne i32 %5, 0
  ret i1 %6
}

; Function Attrs: nounwind uwtable
define linkonce_odr i32 @_ZNK6soplex8SPxBasis9iterationEv(%"class.soplex::SPxBasis"* %this) #2 align 2 {
  %1 = getelementptr inbounds %"class.soplex::SPxBasis"* %this, i32 0, i32 9
  %2 = load i32* %1, align 4
  ret i32 %2
}

; Function Attrs: nounwind uwtable
define linkonce_odr double* @_ZN6soplex6Vector7get_ptrEv(%"class.soplex::Vector"* %this) #2 align 2 {
  %1 = getelementptr inbounds %"class.soplex::Vector"* %this, i32 0, i32 1
  %2 = load double** %1, align 8
  ret double* %2
}

; Function Attrs: nounwind uwtable
define linkonce_odr double* @_ZNK6soplex6Vector13get_const_ptrEv(%"class.soplex::Vector"* %this) #2 align 2 {
  %1 = getelementptr inbounds %"class.soplex::Vector"* %this, i32 0, i32 1
  %2 = load double** %1, align 8
  ret double* %2
}

; Function Attrs: nounwind uwtable
define linkonce_odr dereferenceable(104) %"class.soplex::UpdateVector"* @_ZNK6soplex6SoPlex4fVecEv(%"class.soplex::SoPlex"* %this) #2 align 2 {
  %1 = getelementptr inbounds %"class.soplex::SoPlex"* %this, i32 0, i32 38
  %2 = load %"class.soplex::UpdateVector"** %1, align 8
  ret %"class.soplex::UpdateVector"* %2
}

; Function Attrs: nounwind uwtable
define linkonce_odr dereferenceable(64) %"class.soplex::SSVector"* @_ZN6soplex12UpdateVector5deltaEv(%"class.soplex::UpdateVector"* %this) #2 align 2 {
  %1 = getelementptr inbounds %"class.soplex::UpdateVector"* %this, i32 0, i32 2
  ret %"class.soplex::SSVector"* %1
}

; Function Attrs: nounwind uwtable
define linkonce_odr double* @_ZNK6soplex8SSVector6valuesEv(%"class.soplex::SSVector"* %this) #2 align 2 {
  %1 = bitcast %"class.soplex::SSVector"* %this to %"class.soplex::Vector"*
  %2 = getelementptr inbounds %"class.soplex::Vector"* %1, i32 0, i32 1
  %3 = load double** %2, align 8
  ret double* %3
}

; Function Attrs: nounwind uwtable
define linkonce_odr dereferenceable(104) %"class.soplex::UpdateVector"* @_ZNK6soplex6SoPlex6coPvecEv(%"class.soplex::SoPlex"* %this) #2 align 2 {
  %1 = getelementptr inbounds %"class.soplex::SoPlex"* %this, i32 0, i32 40
  %2 = load %"class.soplex::UpdateVector"** %1, align 8
  ret %"class.soplex::UpdateVector"* %2
}

declare double @_ZNK6soplex8SSVector7length2Ev(%"class.soplex::SSVector"*) #0

; Function Attrs: uwtable
define linkonce_odr dereferenceable(16) %"class.soplex::IdxSet"* @_ZNK6soplex12UpdateVector3idxEv(%"class.soplex::UpdateVector"* %this) #3 align 2 {
  %1 = getelementptr inbounds %"class.soplex::UpdateVector"* %this, i32 0, i32 2
  %2 = call dereferenceable(16) %"class.soplex::IdxSet"* @_ZNK6soplex8SSVector7indicesEv(%"class.soplex::SSVector"* %1)
  ret %"class.soplex::IdxSet"* %2
}

; Function Attrs: nounwind uwtable
define linkonce_odr i32 @_ZNK6soplex6IdxSet4sizeEv(%"class.soplex::IdxSet"* %this) #2 align 2 {
  %1 = getelementptr inbounds %"class.soplex::IdxSet"* %this, i32 0, i32 0
  %2 = load i32* %1, align 4
  ret i32 %2
}

; Function Attrs: uwtable
define linkonce_odr i32 @_ZNK6soplex6IdxSet5indexEi(%"class.soplex::IdxSet"* %this, i32 %n) #3 align 2 {
  %1 = icmp sge i32 %n, 0
  br i1 %1, label %2, label %6

; <label>:2                                       ; preds = %0
  %3 = call i32 @_ZNK6soplex6IdxSet4sizeEv(%"class.soplex::IdxSet"* %this)
  %4 = icmp slt i32 %n, %3
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %2
  br label %8

; <label>:6                                       ; preds = %2, %0
  call void @__assert_fail(i8* getelementptr inbounds ([21 x i8]* @.str35, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8]* @.str30, i32 0, i32 0), i32 69, i8* getelementptr inbounds ([37 x i8]* @__PRETTY_FUNCTION__._ZNK6soplex6IdxSet5indexEi, i32 0, i32 0)) #10
  unreachable
                                                  ; No predecessors!
  br label %8

; <label>:8                                       ; preds = %7, %5
  %9 = sext i32 %n to i64
  %10 = getelementptr inbounds %"class.soplex::IdxSet"* %this, i32 0, i32 2
  %11 = load i32** %10, align 8
  %12 = getelementptr inbounds i32* %11, i64 %9
  %13 = load i32* %12, align 4
  ret i32 %13
}

; Function Attrs: uwtable
define void @_ZN6soplex10SPxSteepPR5left4EiNS_5SPxIdE(%"class.soplex::SPxSteepPR"* %this, i32 %n, %"class.soplex::SPxId"* %id) unnamed_addr #3 align 2 {
  %1 = alloca %"class.soplex::SPxId", align 4
  %2 = alloca %"class.soplex::SPxId", align 4
  %3 = alloca %"class.soplex::SPxId", align 4
  %4 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %5 = getelementptr inbounds %"class.soplex::SPxPricer"* %4, i32 0, i32 2
  %6 = load %"class.soplex::SoPlex"** %5, align 8
  call void @_ZN6soplex5SPxIdC2ERKS0_(%"class.soplex::SPxId"* %1, %"class.soplex::SPxId"* dereferenceable(4) %id)
  %7 = call i32 @_ZNK6soplex6SoPlex4isIdENS_5SPxIdE(%"class.soplex::SoPlex"* %6, %"class.soplex::SPxId"* %1)
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %9, label %20

; <label>:9                                       ; preds = %0
  %10 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 10
  %11 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %12 = getelementptr inbounds %"class.soplex::SPxPricer"* %11, i32 0, i32 2
  %13 = load %"class.soplex::SoPlex"** %12, align 8
  %14 = bitcast %"class.soplex::SoPlex"* %13 to %"class.soplex::SPxLP"*
  %15 = call i32 @_ZNK6soplex5SPxLP6numberERKNS_5SPxIdE(%"class.soplex::SPxLP"* %14, %"class.soplex::SPxId"* dereferenceable(4) %id)
  %16 = call dereferenceable(8) double* @_ZN6soplex9DataArrayIdEixEi(%"class.soplex::DataArray.3"* %10, i32 %15)
  %17 = load double* %16
  %18 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 11
  %19 = call dereferenceable(8) double* @_ZN6soplex9DataArrayIdEixEi(%"class.soplex::DataArray.3"* %18, i32 %n)
  store double %17, double* %19
  br label %38

; <label>:20                                      ; preds = %0
  %21 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %22 = getelementptr inbounds %"class.soplex::SPxPricer"* %21, i32 0, i32 2
  %23 = load %"class.soplex::SoPlex"** %22, align 8
  call void @_ZN6soplex5SPxIdC2ERKS0_(%"class.soplex::SPxId"* %2, %"class.soplex::SPxId"* dereferenceable(4) %id)
  %24 = call i32 @_ZNK6soplex6SoPlex6isCoIdENS_5SPxIdE(%"class.soplex::SoPlex"* %23, %"class.soplex::SPxId"* %2)
  %25 = icmp ne i32 %24, 0
  br i1 %25, label %26, label %37

; <label>:26                                      ; preds = %20
  %27 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 9
  %28 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %29 = getelementptr inbounds %"class.soplex::SPxPricer"* %28, i32 0, i32 2
  %30 = load %"class.soplex::SoPlex"** %29, align 8
  %31 = bitcast %"class.soplex::SoPlex"* %30 to %"class.soplex::SPxLP"*
  %32 = call i32 @_ZNK6soplex5SPxLP6numberERKNS_5SPxIdE(%"class.soplex::SPxLP"* %31, %"class.soplex::SPxId"* dereferenceable(4) %id)
  %33 = call dereferenceable(8) double* @_ZN6soplex9DataArrayIdEixEi(%"class.soplex::DataArray.3"* %27, i32 %32)
  %34 = load double* %33
  %35 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 11
  %36 = call dereferenceable(8) double* @_ZN6soplex9DataArrayIdEixEi(%"class.soplex::DataArray.3"* %35, i32 %n)
  store double %34, double* %36
  br label %37

; <label>:37                                      ; preds = %26, %20
  br label %38

; <label>:38                                      ; preds = %37, %9
  call void @_ZN6soplex5SPxIdC2ERKS0_(%"class.soplex::SPxId"* %3, %"class.soplex::SPxId"* dereferenceable(4) %id)
  call void @_ZN6soplex10SPxSteepPR6left4XEiNS_5SPxIdEii(%"class.soplex::SPxSteepPR"* %this, i32 %n, %"class.soplex::SPxId"* %3, i32 0, i32 1)
  ret void
}

; Function Attrs: nounwind uwtable
define linkonce_odr i32 @_ZNK6soplex6SoPlex6isCoIdENS_5SPxIdE(%"class.soplex::SoPlex"* %this, %"class.soplex::SPxId"* %p_id) #2 align 2 {
  %1 = bitcast %"class.soplex::SPxId"* %p_id to %"class.soplex::DataKey"*
  %2 = bitcast %"class.soplex::DataKey"* %1 to i32*
  %3 = load i32* %2, align 4
  %4 = shl i32 %3, 24
  %5 = ashr i32 %4, 24
  %6 = getelementptr inbounds %"class.soplex::SoPlex"* %this, i32 0, i32 4
  %7 = load i32* %6, align 4
  %8 = mul nsw i32 %5, %7
  %9 = icmp slt i32 %8, 0
  %10 = zext i1 %9 to i32
  ret i32 %10
}

; Function Attrs: uwtable
define i32 @_ZN6soplex10SPxSteepPR12selectLeaveXERdii(%"class.soplex::SPxSteepPR"* %this, double* dereferenceable(8) %best, i32 %start, i32 %incr) #3 align 2 {
  %1 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 2
  %2 = bitcast %"class.soplex::DVector"* %1 to %"class.soplex::Vector"*
  %3 = call double* @_ZNK6soplex6Vector13get_const_ptrEv(%"class.soplex::Vector"* %2)
  %4 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %5 = getelementptr inbounds %"class.soplex::SPxPricer"* %4, i32 0, i32 2
  %6 = load %"class.soplex::SoPlex"** %5, align 8
  %7 = call dereferenceable(16) %"class.soplex::Vector"* @_ZNK6soplex6SoPlex5fTestEv(%"class.soplex::SoPlex"* %6)
  %8 = call double* @_ZNK6soplex6Vector13get_const_ptrEv(%"class.soplex::Vector"* %7)
  %9 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 11
  %10 = call double* @_ZNK6soplex9DataArrayIdE13get_const_ptrEv(%"class.soplex::DataArray.3"* %9)
  %11 = load double* @_ZN6soplex8infinityE, align 8
  %12 = fsub double -0.000000e+00, %11
  store double %12, double* %best, align 8
  %13 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %14 = getelementptr inbounds %"class.soplex::SPxPricer"* %13, i32 0, i32 2
  %15 = load %"class.soplex::SoPlex"** %14, align 8
  %16 = call i32 @_ZNK6soplex6SoPlex3dimEv(%"class.soplex::SoPlex"* %15)
  %17 = sub nsw i32 %16, 1
  %18 = sub nsw i32 %17, %start
  br label %19

; <label>:19                                      ; preds = %81, %0
  %selIdx.0 = phi i32 [ -1, %0 ], [ %selIdx.2, %81 ]
  %i.0 = phi i32 [ %18, %0 ], [ %82, %81 ]
  %20 = icmp sge i32 %i.0, 0
  br i1 %20, label %21, label %83

; <label>:21                                      ; preds = %19
  %22 = sext i32 %i.0 to i64
  %23 = getelementptr inbounds double* %8, i64 %22
  %24 = load double* %23, align 8
  %25 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %26 = getelementptr inbounds %"class.soplex::SPxPricer"* %25, i32 0, i32 3
  %27 = load double* %26, align 8
  %28 = fsub double -0.000000e+00, %27
  %29 = fcmp olt double %24, %28
  br i1 %29, label %30, label %80

; <label>:30                                      ; preds = %21
  %31 = sext i32 %i.0 to i64
  %32 = getelementptr inbounds double* %3, i64 %31
  %33 = load double* %32, align 8
  %34 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %35 = getelementptr inbounds %"class.soplex::SPxPricer"* %34, i32 0, i32 3
  %36 = load double* %35, align 8
  %37 = fcmp olt double %33, %36
  br i1 %37, label %38, label %65

; <label>:38                                      ; preds = %30
  %39 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cerr, i8* getelementptr inbounds ([47 x i8]* @.str5, i32 0, i32 0))
  %40 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* %39, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
  %41 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cerr, i8* getelementptr inbounds ([3 x i8]* @.str6, i32 0, i32 0))
  %42 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* %41, i32 %i.0)
  %43 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %42, i8* getelementptr inbounds ([4 x i8]* @.str7, i32 0, i32 0))
  %44 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEd(%"class.std::basic_ostream"* %43, double %24)
  %45 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %44, i8* getelementptr inbounds ([19 x i8]* @.str8, i32 0, i32 0))
  %46 = sext i32 %i.0 to i64
  %47 = getelementptr inbounds double* %3, i64 %46
  %48 = load double* %47, align 8
  %49 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEd(%"class.std::basic_ostream"* %45, double %48)
  %50 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %49, i8* getelementptr inbounds ([9 x i8]* @.str9, i32 0, i32 0))
  %51 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %52 = getelementptr inbounds %"class.soplex::SPxPricer"* %51, i32 0, i32 3
  %53 = load double* %52, align 8
  %54 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEd(%"class.std::basic_ostream"* %50, double %53)
  %55 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* %54, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
  %56 = fmul double %24, %24
  %57 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %58 = getelementptr inbounds %"class.soplex::SPxPricer"* %57, i32 0, i32 3
  %59 = load double* %58, align 8
  %60 = fdiv double %56, %59
  %61 = sext i32 %i.0 to i64
  %62 = getelementptr inbounds double* %10, i64 %61
  %63 = load double* %62, align 8
  %64 = fmul double %60, %63
  br label %75

; <label>:65                                      ; preds = %30
  %66 = fmul double %24, %24
  %67 = sext i32 %i.0 to i64
  %68 = getelementptr inbounds double* %3, i64 %67
  %69 = load double* %68, align 8
  %70 = fdiv double %66, %69
  %71 = sext i32 %i.0 to i64
  %72 = getelementptr inbounds double* %10, i64 %71
  %73 = load double* %72, align 8
  %74 = fmul double %70, %73
  br label %75

; <label>:75                                      ; preds = %65, %38
  %x.0 = phi double [ %64, %38 ], [ %74, %65 ]
  %76 = load double* %best, align 8
  %77 = fcmp ogt double %x.0, %76
  br i1 %77, label %78, label %79

; <label>:78                                      ; preds = %75
  store double %x.0, double* %best, align 8
  br label %79

; <label>:79                                      ; preds = %78, %75
  %selIdx.1 = phi i32 [ %i.0, %78 ], [ %selIdx.0, %75 ]
  br label %80

; <label>:80                                      ; preds = %79, %21
  %selIdx.2 = phi i32 [ %selIdx.1, %79 ], [ %selIdx.0, %21 ]
  br label %81

; <label>:81                                      ; preds = %80
  %82 = sub nsw i32 %i.0, %incr
  br label %19

; <label>:83                                      ; preds = %19
  ret i32 %selIdx.0
}

; Function Attrs: uwtable
define linkonce_odr dereferenceable(16) %"class.soplex::Vector"* @_ZNK6soplex6SoPlex5fTestEv(%"class.soplex::SoPlex"* %this) #3 align 2 {
  %1 = call i32 @_ZNK6soplex6SoPlex4typeEv(%"class.soplex::SoPlex"* %this)
  %2 = icmp eq i32 %1, 1
  br i1 %2, label %3, label %4

; <label>:3                                       ; preds = %0
  br label %6

; <label>:4                                       ; preds = %0
  call void @__assert_fail(i8* getelementptr inbounds ([16 x i8]* @.str41, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8]* @.str32, i32 0, i32 0), i32 952, i8* getelementptr inbounds ([52 x i8]* @__PRETTY_FUNCTION__._ZNK6soplex6SoPlex5fTestEv, i32 0, i32 0)) #10
  unreachable
                                                  ; No predecessors!
  br label %6

; <label>:6                                       ; preds = %5, %3
  %7 = getelementptr inbounds %"class.soplex::SoPlex"* %this, i32 0, i32 48
  %8 = bitcast %"class.soplex::DVector"* %7 to %"class.soplex::Vector"*
  ret %"class.soplex::Vector"* %8
}

; Function Attrs: nounwind uwtable
define linkonce_odr double* @_ZNK6soplex9DataArrayIdE13get_const_ptrEv(%"class.soplex::DataArray.3"* %this) #2 align 2 {
  %1 = getelementptr inbounds %"class.soplex::DataArray.3"* %this, i32 0, i32 2
  %2 = load double** %1, align 8
  ret double* %2
}

declare dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"*, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)*) #0

declare dereferenceable(272) %"class.std::basic_ostream"* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(%"class.std::basic_ostream"* dereferenceable(272)) #0

declare dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"*, i32) #0

declare dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEd(%"class.std::basic_ostream"*, double) #0

; Function Attrs: uwtable
define i32 @_ZN6soplex10SPxSteepPR11selectLeaveEv(%"class.soplex::SPxSteepPR"* %this) unnamed_addr #3 align 2 {
  %best = alloca double, align 8
  %1 = bitcast %"class.soplex::SPxSteepPR"* %this to i1 (%"class.soplex::SPxSteepPR"*)***
  %2 = load i1 (%"class.soplex::SPxSteepPR"*)*** %1
  %3 = getelementptr inbounds i1 (%"class.soplex::SPxSteepPR"*)** %2, i64 18
  %4 = load i1 (%"class.soplex::SPxSteepPR"*)** %3
  %5 = call zeroext i1 %4(%"class.soplex::SPxSteepPR"* %this)
  br i1 %5, label %6, label %7

; <label>:6                                       ; preds = %0
  br label %9

; <label>:7                                       ; preds = %0
  call void @__assert_fail(i8* getelementptr inbounds ([15 x i8]* @.str10, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8]* @.str1, i32 0, i32 0), i32 330, i8* getelementptr inbounds ([46 x i8]* @__PRETTY_FUNCTION__._ZN6soplex10SPxSteepPR11selectLeaveEv, i32 0, i32 0)) #10
  unreachable
                                                  ; No predecessors!
  br label %9

; <label>:9                                       ; preds = %8, %6
  %10 = call i32 @_ZN6soplex10SPxSteepPR12selectLeaveXERdii(%"class.soplex::SPxSteepPR"* %this, double* dereferenceable(8) %best, i32 0, i32 1)
  %11 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 5
  store i32 %10, i32* %11, align 4
  %12 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 5
  %13 = load i32* %12, align 4
  %14 = icmp sge i32 %13, 0
  br i1 %14, label %15, label %47

; <label>:15                                      ; preds = %9
  %16 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %17 = getelementptr inbounds %"class.soplex::SPxPricer"* %16, i32 0, i32 2
  %18 = load %"class.soplex::SoPlex"** %17, align 8
  %19 = call dereferenceable(208) %"class.soplex::SPxBasis"* @_ZN6soplex6SoPlex5basisEv(%"class.soplex::SoPlex"* %18)
  %20 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %21 = getelementptr inbounds %"class.soplex::SPxPricer"* %20, i32 0, i32 2
  %22 = load %"class.soplex::SoPlex"** %21, align 8
  %23 = call dereferenceable(104) %"class.soplex::UpdateVector"* @_ZNK6soplex6SoPlex6coPvecEv(%"class.soplex::SoPlex"* %22)
  %24 = call dereferenceable(64) %"class.soplex::SSVector"* @_ZN6soplex12UpdateVector5deltaEv(%"class.soplex::UpdateVector"* %23)
  %25 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %26 = getelementptr inbounds %"class.soplex::SPxPricer"* %25, i32 0, i32 2
  %27 = load %"class.soplex::SoPlex"** %26, align 8
  %28 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 5
  %29 = load i32* %28, align 4
  %30 = call dereferenceable(8) %"class.soplex::SVector"* @_ZNK6soplex6SoPlex10unitVectorEi(%"class.soplex::SoPlex"* %27, i32 %29)
  call void @_ZN6soplex8SPxBasis7coSolveERNS_8SSVectorERKNS_7SVectorE(%"class.soplex::SPxBasis"* %19, %"class.soplex::SSVector"* dereferenceable(64) %24, %"class.soplex::SVector"* dereferenceable(8) %30)
  %31 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 13
  %32 = load double* %31, align 8
  %33 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 4
  %34 = getelementptr inbounds %"class.soplex::SSVector"* %33, i32 0, i32 3
  store double %32, double* %34, align 8
  %35 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 4
  %36 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %37 = getelementptr inbounds %"class.soplex::SPxPricer"* %36, i32 0, i32 2
  %38 = load %"class.soplex::SoPlex"** %37, align 8
  %39 = call dereferenceable(104) %"class.soplex::UpdateVector"* @_ZNK6soplex6SoPlex6coPvecEv(%"class.soplex::SoPlex"* %38)
  %40 = call dereferenceable(64) %"class.soplex::SSVector"* @_ZN6soplex12UpdateVector5deltaEv(%"class.soplex::UpdateVector"* %39)
  call void @_ZN6soplex8SSVector16setup_and_assignERS0_(%"class.soplex::SSVector"* %35, %"class.soplex::SSVector"* dereferenceable(64) %40)
  %41 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %42 = getelementptr inbounds %"class.soplex::SPxPricer"* %41, i32 0, i32 2
  %43 = load %"class.soplex::SoPlex"** %42, align 8
  %44 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 3
  %45 = bitcast %"class.soplex::DVector"* %44 to %"class.soplex::Vector"*
  %46 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 4
  call void @_ZN6soplex6SoPlex11setup4solveEPNS_6VectorEPNS_8SSVectorE(%"class.soplex::SoPlex"* %43, %"class.soplex::Vector"* %45, %"class.soplex::SSVector"* %46)
  br label %47

; <label>:47                                      ; preds = %15, %9
  %48 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 5
  %49 = load i32* %48, align 4
  ret i32 %49
}

; Function Attrs: uwtable
define linkonce_odr void @_ZN6soplex8SPxBasis7coSolveERNS_8SSVectorERKNS_7SVectorE(%"class.soplex::SPxBasis"* %this, %"class.soplex::SSVector"* dereferenceable(64) %x, %"class.soplex::SVector"* dereferenceable(8) %rhs) #3 align 2 {
  %1 = getelementptr inbounds %"class.soplex::SPxBasis"* %this, i32 0, i32 6
  %2 = load i8* %1, align 1
  %3 = trunc i8 %2 to i1
  br i1 %3, label %9, label %4

; <label>:4                                       ; preds = %0
  %5 = bitcast %"class.soplex::SPxBasis"* %this to void (%"class.soplex::SPxBasis"*)***
  %6 = load void (%"class.soplex::SPxBasis"*)*** %5
  %7 = getelementptr inbounds void (%"class.soplex::SPxBasis"*)** %6, i64 10
  %8 = load void (%"class.soplex::SPxBasis"*)** %7
  call void %8(%"class.soplex::SPxBasis"* %this)
  br label %9

; <label>:9                                       ; preds = %4, %0
  %10 = getelementptr inbounds %"class.soplex::SPxBasis"* %this, i32 0, i32 5
  %11 = load %"class.soplex::SLinSolver"** %10, align 8
  %12 = bitcast %"class.soplex::SLinSolver"* %11 to void (%"class.soplex::SLinSolver"*, %"class.soplex::SSVector"*, %"class.soplex::SVector"*)***
  %13 = load void (%"class.soplex::SLinSolver"*, %"class.soplex::SSVector"*, %"class.soplex::SVector"*)*** %12
  %14 = getelementptr inbounds void (%"class.soplex::SLinSolver"*, %"class.soplex::SSVector"*, %"class.soplex::SVector"*)** %13, i64 24
  %15 = load void (%"class.soplex::SLinSolver"*, %"class.soplex::SSVector"*, %"class.soplex::SVector"*)** %14
  call void %15(%"class.soplex::SLinSolver"* %11, %"class.soplex::SSVector"* dereferenceable(64) %x, %"class.soplex::SVector"* dereferenceable(8) %rhs)
  ret void
}

; Function Attrs: uwtable
define linkonce_odr dereferenceable(8) %"class.soplex::SVector"* @_ZNK6soplex6SoPlex10unitVectorEi(%"class.soplex::SoPlex"* %this, i32 %i) #3 align 2 {
  %1 = getelementptr inbounds %"class.soplex::SoPlex"* %this, i32 0, i32 21
  %2 = call dereferenceable(40) %"class.soplex::UnitVector"* @_ZNK6soplex5ArrayINS_10UnitVectorEEixEi(%"class.soplex::Array"* %1, i32 %i)
  %3 = bitcast %"class.soplex::UnitVector"* %2 to %"class.soplex::SVector"*
  ret %"class.soplex::SVector"* %3
}

declare void @_ZN6soplex8SSVector16setup_and_assignERS0_(%"class.soplex::SSVector"*, %"class.soplex::SSVector"* dereferenceable(64)) #0

; Function Attrs: uwtable
define linkonce_odr void @_ZN6soplex6SoPlex11setup4solveEPNS_6VectorEPNS_8SSVectorE(%"class.soplex::SoPlex"* %this, %"class.soplex::Vector"* %p_y, %"class.soplex::SSVector"* %p_rhs) #3 align 2 {
  %1 = call i32 @_ZNK6soplex6SoPlex4typeEv(%"class.soplex::SoPlex"* %this)
  %2 = icmp eq i32 %1, 1
  br i1 %2, label %3, label %4

; <label>:3                                       ; preds = %0
  br label %6

; <label>:4                                       ; preds = %0
  call void @__assert_fail(i8* getelementptr inbounds ([16 x i8]* @.str41, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8]* @.str32, i32 0, i32 0), i32 1261, i8* getelementptr inbounds ([71 x i8]* @__PRETTY_FUNCTION__._ZN6soplex6SoPlex11setup4solveEPNS_6VectorEPNS_8SSVectorE, i32 0, i32 0)) #10
  unreachable
                                                  ; No predecessors!
  br label %6

; <label>:6                                       ; preds = %5, %3
  %7 = getelementptr inbounds %"class.soplex::SoPlex"* %this, i32 0, i32 16
  store %"class.soplex::Vector"* %p_y, %"class.soplex::Vector"** %7, align 8
  %8 = getelementptr inbounds %"class.soplex::SoPlex"* %this, i32 0, i32 17
  store %"class.soplex::SSVector"* %p_rhs, %"class.soplex::SSVector"** %8, align 8
  ret void
}

; Function Attrs: uwtable
define void @_ZN6soplex10SPxSteepPR9entered4XENS_5SPxIdEiiiii(%"class.soplex::SPxSteepPR"* %this, %"class.soplex::SPxId"*, i32 %n, i32 %start2, i32 %incr2, i32 %start1, i32 %incr1) #3 align 2 {
  %2 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %3 = getelementptr inbounds %"class.soplex::SPxPricer"* %2, i32 0, i32 2
  %4 = load %"class.soplex::SoPlex"** %3, align 8
  %5 = call i32 @_ZNK6soplex6SoPlex4typeEv(%"class.soplex::SoPlex"* %4)
  %6 = icmp eq i32 %5, -1
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %1
  br label %10

; <label>:8                                       ; preds = %1
  call void @__assert_fail(i8* getelementptr inbounds ([35 x i8]* @.str11, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8]* @.str1, i32 0, i32 0), i32 364, i8* getelementptr inbounds ([75 x i8]* @__PRETTY_FUNCTION__._ZN6soplex10SPxSteepPR9entered4XENS_5SPxIdEiiiii, i32 0, i32 0)) #10
  unreachable
                                                  ; No predecessors!
  br label %10

; <label>:10                                      ; preds = %9, %7
  %11 = icmp sge i32 %n, 0
  br i1 %11, label %12, label %185

; <label>:12                                      ; preds = %10
  %13 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %14 = getelementptr inbounds %"class.soplex::SPxPricer"* %13, i32 0, i32 2
  %15 = load %"class.soplex::SoPlex"** %14, align 8
  %16 = call i32 @_ZNK6soplex6SoPlex3dimEv(%"class.soplex::SoPlex"* %15)
  %17 = icmp slt i32 %n, %16
  br i1 %17, label %18, label %185

; <label>:18                                      ; preds = %12
  %19 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %20 = getelementptr inbounds %"class.soplex::SPxPricer"* %19, i32 0, i32 2
  %21 = load %"class.soplex::SoPlex"** %20, align 8
  %22 = call dereferenceable(208) %"class.soplex::SPxBasis"* @_ZN6soplex6SoPlex5basisEv(%"class.soplex::SoPlex"* %21)
  %23 = call i32 @_ZNK6soplex8SPxBasis9iterationEv(%"class.soplex::SPxBasis"* %22)
  %24 = sitofp i32 %23 to double
  %25 = fdiv double 1.000000e+00, %24
  %26 = fadd double 2.000000e+00, %25
  %27 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 2
  %28 = bitcast %"class.soplex::DVector"* %27 to %"class.soplex::Vector"*
  %29 = call double* @_ZN6soplex6Vector7get_ptrEv(%"class.soplex::Vector"* %28)
  %30 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 1
  %31 = bitcast %"class.soplex::DVector"* %30 to %"class.soplex::Vector"*
  %32 = call double* @_ZN6soplex6Vector7get_ptrEv(%"class.soplex::Vector"* %31)
  %33 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 3
  %34 = bitcast %"class.soplex::DVector"* %33 to %"class.soplex::Vector"*
  %35 = call double* @_ZNK6soplex6Vector13get_const_ptrEv(%"class.soplex::Vector"* %34)
  %36 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %37 = getelementptr inbounds %"class.soplex::SPxPricer"* %36, i32 0, i32 2
  %38 = load %"class.soplex::SoPlex"** %37, align 8
  %39 = call dereferenceable(104) %"class.soplex::UpdateVector"* @_ZNK6soplex6SoPlex4pVecEv(%"class.soplex::SoPlex"* %38)
  %40 = call dereferenceable(64) %"class.soplex::SSVector"* @_ZN6soplex12UpdateVector5deltaEv(%"class.soplex::UpdateVector"* %39)
  %41 = call double* @_ZNK6soplex8SSVector6valuesEv(%"class.soplex::SSVector"* %40)
  %42 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %43 = getelementptr inbounds %"class.soplex::SPxPricer"* %42, i32 0, i32 2
  %44 = load %"class.soplex::SoPlex"** %43, align 8
  %45 = call dereferenceable(104) %"class.soplex::UpdateVector"* @_ZNK6soplex6SoPlex4pVecEv(%"class.soplex::SoPlex"* %44)
  %46 = call dereferenceable(16) %"class.soplex::IdxSet"* @_ZNK6soplex12UpdateVector3idxEv(%"class.soplex::UpdateVector"* %45)
  %47 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %48 = getelementptr inbounds %"class.soplex::SPxPricer"* %47, i32 0, i32 2
  %49 = load %"class.soplex::SoPlex"** %48, align 8
  %50 = call dereferenceable(104) %"class.soplex::UpdateVector"* @_ZNK6soplex6SoPlex6coPvecEv(%"class.soplex::SoPlex"* %49)
  %51 = call dereferenceable(64) %"class.soplex::SSVector"* @_ZN6soplex12UpdateVector5deltaEv(%"class.soplex::UpdateVector"* %50)
  %52 = call double* @_ZNK6soplex8SSVector6valuesEv(%"class.soplex::SSVector"* %51)
  %53 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %54 = getelementptr inbounds %"class.soplex::SPxPricer"* %53, i32 0, i32 2
  %55 = load %"class.soplex::SoPlex"** %54, align 8
  %56 = call dereferenceable(104) %"class.soplex::UpdateVector"* @_ZNK6soplex6SoPlex6coPvecEv(%"class.soplex::SoPlex"* %55)
  %57 = call dereferenceable(16) %"class.soplex::IdxSet"* @_ZNK6soplex12UpdateVector3idxEv(%"class.soplex::UpdateVector"* %56)
  %58 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %59 = getelementptr inbounds %"class.soplex::SPxPricer"* %58, i32 0, i32 2
  %60 = load %"class.soplex::SoPlex"** %59, align 8
  %61 = call dereferenceable(104) %"class.soplex::UpdateVector"* @_ZNK6soplex6SoPlex4fVecEv(%"class.soplex::SoPlex"* %60)
  %62 = call dereferenceable(64) %"class.soplex::SSVector"* @_ZN6soplex12UpdateVector5deltaEv(%"class.soplex::UpdateVector"* %61)
  %63 = call double @_ZNK6soplex8SSVectorixEi(%"class.soplex::SSVector"* %62, i32 %n)
  %64 = fdiv double 1.000000e+00, %63
  %65 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %66 = getelementptr inbounds %"class.soplex::SPxPricer"* %65, i32 0, i32 2
  %67 = load %"class.soplex::SoPlex"** %66, align 8
  %68 = call dereferenceable(104) %"class.soplex::UpdateVector"* @_ZNK6soplex6SoPlex4fVecEv(%"class.soplex::SoPlex"* %67)
  %69 = call dereferenceable(64) %"class.soplex::SSVector"* @_ZN6soplex12UpdateVector5deltaEv(%"class.soplex::UpdateVector"* %68)
  %70 = call double @_ZNK6soplex8SSVectorixEi(%"class.soplex::SSVector"* %69, i32 %n)
  %71 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %72 = getelementptr inbounds %"class.soplex::SPxPricer"* %71, i32 0, i32 2
  %73 = load %"class.soplex::SoPlex"** %72, align 8
  %74 = call double @_ZNK6soplex6SoPlex7epsilonEv(%"class.soplex::SoPlex"* %73)
  %75 = fcmp ogt double %70, %74
  br i1 %75, label %89, label %76

; <label>:76                                      ; preds = %18
  %77 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %78 = getelementptr inbounds %"class.soplex::SPxPricer"* %77, i32 0, i32 2
  %79 = load %"class.soplex::SoPlex"** %78, align 8
  %80 = call dereferenceable(104) %"class.soplex::UpdateVector"* @_ZNK6soplex6SoPlex4fVecEv(%"class.soplex::SoPlex"* %79)
  %81 = call dereferenceable(64) %"class.soplex::SSVector"* @_ZN6soplex12UpdateVector5deltaEv(%"class.soplex::UpdateVector"* %80)
  %82 = call double @_ZNK6soplex8SSVectorixEi(%"class.soplex::SSVector"* %81, i32 %n)
  %83 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %84 = getelementptr inbounds %"class.soplex::SPxPricer"* %83, i32 0, i32 2
  %85 = load %"class.soplex::SoPlex"** %84, align 8
  %86 = call double @_ZNK6soplex6SoPlex7epsilonEv(%"class.soplex::SoPlex"* %85)
  %87 = fsub double -0.000000e+00, %86
  %88 = fcmp olt double %82, %87
  br i1 %88, label %89, label %90

; <label>:89                                      ; preds = %76, %18
  br label %92

; <label>:90                                      ; preds = %76
  call void @__assert_fail(i8* getelementptr inbounds ([108 x i8]* @.str12, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8]* @.str1, i32 0, i32 0), i32 381, i8* getelementptr inbounds ([75 x i8]* @__PRETTY_FUNCTION__._ZN6soplex10SPxSteepPR9entered4XENS_5SPxIdEiiiii, i32 0, i32 0)) #10
  unreachable
                                                  ; No predecessors!
  br label %92

; <label>:92                                      ; preds = %91, %89
  %93 = call i32 @_ZNK6soplex6IdxSet4sizeEv(%"class.soplex::IdxSet"* %57)
  %94 = sub nsw i32 %93, 1
  %95 = sub nsw i32 %94, %start1
  br label %96

; <label>:96                                      ; preds = %134, %92
  %j.0 = phi i32 [ %95, %92 ], [ %135, %134 ]
  %97 = icmp sge i32 %j.0, 0
  br i1 %97, label %98, label %136

; <label>:98                                      ; preds = %96
  %99 = call i32 @_ZNK6soplex6IdxSet5indexEi(%"class.soplex::IdxSet"* %57, i32 %j.0)
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds double* %52, i64 %100
  %102 = load double* %101, align 8
  %103 = fmul double %64, %102
  %104 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 7
  %105 = load double* %104, align 8
  %106 = fmul double %103, %105
  %107 = sext i32 %99 to i64
  %108 = getelementptr inbounds double* %35, i64 %107
  %109 = load double* %108, align 8
  %110 = fmul double 2.000000e+00, %109
  %111 = fsub double %106, %110
  %112 = fmul double %103, %111
  %113 = sext i32 %99 to i64
  %114 = getelementptr inbounds double* %29, i64 %113
  %115 = load double* %114, align 8
  %116 = fadd double %115, %112
  store double %116, double* %114, align 8
  %117 = fcmp olt double %116, %26
  br i1 %117, label %118, label %121

; <label>:118                                     ; preds = %98
  %119 = sext i32 %99 to i64
  %120 = getelementptr inbounds double* %29, i64 %119
  store double %26, double* %120, align 8
  br label %133

; <label>:121                                     ; preds = %98
  %122 = load double* @_ZN6soplex8infinityE, align 8
  %123 = fcmp ogt double %116, %122
  br i1 %123, label %124, label %132

; <label>:124                                     ; preds = %121
  %125 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %126 = getelementptr inbounds %"class.soplex::SPxPricer"* %125, i32 0, i32 2
  %127 = load %"class.soplex::SoPlex"** %126, align 8
  %128 = call double @_ZNK6soplex6SoPlex7epsilonEv(%"class.soplex::SoPlex"* %127)
  %129 = fdiv double 1.000000e+00, %128
  %130 = sext i32 %99 to i64
  %131 = getelementptr inbounds double* %29, i64 %130
  store double %129, double* %131, align 8
  br label %132

; <label>:132                                     ; preds = %124, %121
  br label %133

; <label>:133                                     ; preds = %132, %118
  br label %134

; <label>:134                                     ; preds = %133
  %135 = sub nsw i32 %j.0, %incr1
  br label %96

; <label>:136                                     ; preds = %96
  %137 = call i32 @_ZNK6soplex6IdxSet4sizeEv(%"class.soplex::IdxSet"* %46)
  %138 = sub nsw i32 %137, 1
  %139 = sub nsw i32 %138, %start2
  br label %140

; <label>:140                                     ; preds = %182, %136
  %j.1 = phi i32 [ %139, %136 ], [ %183, %182 ]
  %141 = icmp sge i32 %j.1, 0
  br i1 %141, label %142, label %184

; <label>:142                                     ; preds = %140
  %143 = call i32 @_ZNK6soplex6IdxSet5indexEi(%"class.soplex::IdxSet"* %46, i32 %j.1)
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds double* %41, i64 %144
  %146 = load double* %145, align 8
  %147 = fmul double %64, %146
  %148 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 7
  %149 = load double* %148, align 8
  %150 = fmul double %147, %149
  %151 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %152 = getelementptr inbounds %"class.soplex::SPxPricer"* %151, i32 0, i32 2
  %153 = load %"class.soplex::SoPlex"** %152, align 8
  %154 = call dereferenceable(8) %"class.soplex::SVector"* @_ZNK6soplex6SoPlex6vectorEi(%"class.soplex::SoPlex"* %153, i32 %143)
  %155 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 3
  %156 = bitcast %"class.soplex::DVector"* %155 to %"class.soplex::Vector"*
  %157 = call double @_ZNK6soplex7SVectormlERKNS_6VectorE(%"class.soplex::SVector"* %154, %"class.soplex::Vector"* dereferenceable(16) %156)
  %158 = fmul double 2.000000e+00, %157
  %159 = fsub double %150, %158
  %160 = fmul double %147, %159
  %161 = sext i32 %143 to i64
  %162 = getelementptr inbounds double* %32, i64 %161
  %163 = load double* %162, align 8
  %164 = fadd double %163, %160
  store double %164, double* %162, align 8
  %165 = fcmp olt double %164, %26
  br i1 %165, label %166, label %169

; <label>:166                                     ; preds = %142
  %167 = sext i32 %143 to i64
  %168 = getelementptr inbounds double* %32, i64 %167
  store double %26, double* %168, align 8
  br label %181

; <label>:169                                     ; preds = %142
  %170 = load double* @_ZN6soplex8infinityE, align 8
  %171 = fcmp ogt double %164, %170
  br i1 %171, label %172, label %180

; <label>:172                                     ; preds = %169
  %173 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %174 = getelementptr inbounds %"class.soplex::SPxPricer"* %173, i32 0, i32 2
  %175 = load %"class.soplex::SoPlex"** %174, align 8
  %176 = call double @_ZNK6soplex6SoPlex7epsilonEv(%"class.soplex::SoPlex"* %175)
  %177 = fdiv double 1.000000e+00, %176
  %178 = sext i32 %143 to i64
  %179 = getelementptr inbounds double* %32, i64 %178
  store double %177, double* %179, align 8
  br label %180

; <label>:180                                     ; preds = %172, %169
  br label %181

; <label>:181                                     ; preds = %180, %166
  br label %182

; <label>:182                                     ; preds = %181
  %183 = sub nsw i32 %j.1, %incr2
  br label %140

; <label>:184                                     ; preds = %140
  br label %185

; <label>:185                                     ; preds = %184, %12, %10
  ret void
}

; Function Attrs: nounwind uwtable
define linkonce_odr dereferenceable(104) %"class.soplex::UpdateVector"* @_ZNK6soplex6SoPlex4pVecEv(%"class.soplex::SoPlex"* %this) #2 align 2 {
  %1 = getelementptr inbounds %"class.soplex::SoPlex"* %this, i32 0, i32 41
  %2 = load %"class.soplex::UpdateVector"** %1, align 8
  ret %"class.soplex::UpdateVector"* %2
}

; Function Attrs: nounwind uwtable
define linkonce_odr double @_ZNK6soplex8SSVectorixEi(%"class.soplex::SSVector"* %this, i32 %i) #2 align 2 {
  %1 = sext i32 %i to i64
  %2 = bitcast %"class.soplex::SSVector"* %this to %"class.soplex::Vector"*
  %3 = getelementptr inbounds %"class.soplex::Vector"* %2, i32 0, i32 1
  %4 = load double** %3, align 8
  %5 = getelementptr inbounds double* %4, i64 %1
  %6 = load double* %5, align 8
  ret double %6
}

; Function Attrs: uwtable
define linkonce_odr double @_ZNK6soplex7SVectormlERKNS_6VectorE(%"class.soplex::SVector"* %this, %"class.soplex::Vector"* dereferenceable(16) %w) #3 align 2 {
  %1 = call i32 @_ZNK6soplex7SVector4sizeEv(%"class.soplex::SVector"* %this)
  %2 = getelementptr inbounds %"class.soplex::SVector"* %this, i32 0, i32 0
  %3 = load %"struct.soplex::SVector::Element"** %2, align 8
  br label %4

; <label>:4                                       ; preds = %7, %0
  %x.0 = phi double [ 0.000000e+00, %0 ], [ %14, %7 ]
  %n.0 = phi i32 [ %1, %0 ], [ %5, %7 ]
  %e.0 = phi %"struct.soplex::SVector::Element"* [ %3, %0 ], [ %15, %7 ]
  %5 = add nsw i32 %n.0, -1
  %6 = icmp ne i32 %n.0, 0
  br i1 %6, label %7, label %16

; <label>:7                                       ; preds = %4
  %8 = getelementptr inbounds %"struct.soplex::SVector::Element"* %e.0, i32 0, i32 0
  %9 = load double* %8, align 8
  %10 = getelementptr inbounds %"struct.soplex::SVector::Element"* %e.0, i32 0, i32 1
  %11 = load i32* %10, align 4
  %12 = call double @_ZNK6soplex6VectorixEi(%"class.soplex::Vector"* %w, i32 %11)
  %13 = fmul double %9, %12
  %14 = fadd double %x.0, %13
  %15 = getelementptr inbounds %"struct.soplex::SVector::Element"* %e.0, i32 1
  br label %4

; <label>:16                                      ; preds = %4
  ret double %x.0
}

; Function Attrs: uwtable
define void @_ZN6soplex10SPxSteepPR8entered4ENS_5SPxIdEi(%"class.soplex::SPxSteepPR"* %this, %"class.soplex::SPxId"* %id, i32 %n) unnamed_addr #3 align 2 {
  %1 = alloca %"class.soplex::SPxId", align 4
  call void @_ZN6soplex5SPxIdC2ERKS0_(%"class.soplex::SPxId"* %1, %"class.soplex::SPxId"* dereferenceable(4) %id)
  call void @_ZN6soplex10SPxSteepPR9entered4XENS_5SPxIdEiiiii(%"class.soplex::SPxSteepPR"* %this, %"class.soplex::SPxId"* %1, i32 %n, i32 0, i32 1, i32 0, i32 1)
  ret void
}

; Function Attrs: uwtable
define void @_ZN6soplex10SPxSteepPR12selectEnterXERdiiii(%"class.soplex::SPxId"* noalias sret %agg.result, %"class.soplex::SPxSteepPR"* %this, double* dereferenceable(8) %best, i32 %start1, i32 %incr1, i32 %start2, i32 %incr2) #3 align 2 {
  %1 = alloca %"class.soplex::SPxId", align 4
  %2 = alloca %"class.soplex::SPxId", align 4
  %3 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 10
  %4 = call double* @_ZNK6soplex9DataArrayIdE13get_const_ptrEv(%"class.soplex::DataArray.3"* %3)
  %5 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 9
  %6 = call double* @_ZNK6soplex9DataArrayIdE13get_const_ptrEv(%"class.soplex::DataArray.3"* %5)
  %7 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %8 = getelementptr inbounds %"class.soplex::SPxPricer"* %7, i32 0, i32 2
  %9 = load %"class.soplex::SoPlex"** %8, align 8
  %10 = call dereferenceable(16) %"class.soplex::Vector"* @_ZNK6soplex6SoPlex4testEv(%"class.soplex::SoPlex"* %9)
  %11 = call double* @_ZNK6soplex6Vector13get_const_ptrEv(%"class.soplex::Vector"* %10)
  %12 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %13 = getelementptr inbounds %"class.soplex::SPxPricer"* %12, i32 0, i32 2
  %14 = load %"class.soplex::SoPlex"** %13, align 8
  %15 = call dereferenceable(16) %"class.soplex::Vector"* @_ZNK6soplex6SoPlex6coTestEv(%"class.soplex::SoPlex"* %14)
  %16 = call double* @_ZNK6soplex6Vector13get_const_ptrEv(%"class.soplex::Vector"* %15)
  %17 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 1
  %18 = bitcast %"class.soplex::DVector"* %17 to %"class.soplex::Vector"*
  %19 = call double* @_ZNK6soplex6Vector13get_const_ptrEv(%"class.soplex::Vector"* %18)
  %20 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 2
  %21 = bitcast %"class.soplex::DVector"* %20 to %"class.soplex::Vector"*
  %22 = call double* @_ZNK6soplex6Vector13get_const_ptrEv(%"class.soplex::Vector"* %21)
  call void @_ZN6soplex5SPxIdC2Ev(%"class.soplex::SPxId"* %agg.result)
  %23 = load double* @_ZN6soplex8infinityE, align 8
  %24 = fsub double -0.000000e+00, %23
  store double %24, double* %best, align 8
  %25 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %26 = getelementptr inbounds %"class.soplex::SPxPricer"* %25, i32 0, i32 2
  %27 = load %"class.soplex::SoPlex"** %26, align 8
  %28 = call i32 @_ZNK6soplex6SoPlex5coDimEv(%"class.soplex::SoPlex"* %27)
  br label %29

; <label>:29                                      ; preds = %59, %0
  %i.0 = phi i32 [ %start2, %0 ], [ %60, %59 ]
  %30 = icmp slt i32 %i.0, %28
  br i1 %30, label %31, label %61

; <label>:31                                      ; preds = %29
  %32 = sext i32 %i.0 to i64
  %33 = getelementptr inbounds double* %11, i64 %32
  %34 = load double* %33, align 8
  %35 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %36 = getelementptr inbounds %"class.soplex::SPxPricer"* %35, i32 0, i32 3
  %37 = load double* %36, align 8
  %38 = fsub double -0.000000e+00, %37
  %39 = fcmp olt double %34, %38
  br i1 %39, label %40, label %58

; <label>:40                                      ; preds = %31
  %41 = sext i32 %i.0 to i64
  %42 = getelementptr inbounds double* %19, i64 %41
  %43 = load double* %42, align 8
  %44 = fdiv double %34, %43
  %45 = fmul double %34, %44
  %46 = sext i32 %i.0 to i64
  %47 = getelementptr inbounds double* %4, i64 %46
  %48 = load double* %47, align 8
  %49 = fmul double %45, %48
  %50 = load double* %best, align 8
  %51 = fcmp ogt double %49, %50
  br i1 %51, label %52, label %57

; <label>:52                                      ; preds = %40
  store double %49, double* %best, align 8
  %53 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %54 = getelementptr inbounds %"class.soplex::SPxPricer"* %53, i32 0, i32 2
  %55 = load %"class.soplex::SoPlex"** %54, align 8
  call void @_ZNK6soplex6SoPlex2idEi(%"class.soplex::SPxId"* sret %1, %"class.soplex::SoPlex"* %55, i32 %i.0)
  %56 = call dereferenceable(4) %"class.soplex::SPxId"* @_ZN6soplex5SPxIdaSERKS0_(%"class.soplex::SPxId"* %agg.result, %"class.soplex::SPxId"* dereferenceable(4) %1)
  br label %57

; <label>:57                                      ; preds = %52, %40
  br label %58

; <label>:58                                      ; preds = %57, %31
  br label %59

; <label>:59                                      ; preds = %58
  %60 = add nsw i32 %i.0, %incr2
  br label %29

; <label>:61                                      ; preds = %29
  %62 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %63 = getelementptr inbounds %"class.soplex::SPxPricer"* %62, i32 0, i32 2
  %64 = load %"class.soplex::SoPlex"** %63, align 8
  %65 = call i32 @_ZNK6soplex6SoPlex3dimEv(%"class.soplex::SoPlex"* %64)
  br label %66

; <label>:66                                      ; preds = %96, %61
  %i.1 = phi i32 [ %start1, %61 ], [ %97, %96 ]
  %67 = icmp slt i32 %i.1, %65
  br i1 %67, label %68, label %98

; <label>:68                                      ; preds = %66
  %69 = sext i32 %i.1 to i64
  %70 = getelementptr inbounds double* %16, i64 %69
  %71 = load double* %70, align 8
  %72 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %73 = getelementptr inbounds %"class.soplex::SPxPricer"* %72, i32 0, i32 3
  %74 = load double* %73, align 8
  %75 = fsub double -0.000000e+00, %74
  %76 = fcmp olt double %71, %75
  br i1 %76, label %77, label %95

; <label>:77                                      ; preds = %68
  %78 = sext i32 %i.1 to i64
  %79 = getelementptr inbounds double* %22, i64 %78
  %80 = load double* %79, align 8
  %81 = fdiv double %71, %80
  %82 = fmul double %71, %81
  %83 = sext i32 %i.1 to i64
  %84 = getelementptr inbounds double* %6, i64 %83
  %85 = load double* %84, align 8
  %86 = fmul double %82, %85
  %87 = load double* %best, align 8
  %88 = fcmp ogt double %86, %87
  br i1 %88, label %89, label %94

; <label>:89                                      ; preds = %77
  store double %86, double* %best, align 8
  %90 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %91 = getelementptr inbounds %"class.soplex::SPxPricer"* %90, i32 0, i32 2
  %92 = load %"class.soplex::SoPlex"** %91, align 8
  call void @_ZNK6soplex6SoPlex4coIdEi(%"class.soplex::SPxId"* sret %2, %"class.soplex::SoPlex"* %92, i32 %i.1)
  %93 = call dereferenceable(4) %"class.soplex::SPxId"* @_ZN6soplex5SPxIdaSERKS0_(%"class.soplex::SPxId"* %agg.result, %"class.soplex::SPxId"* dereferenceable(4) %2)
  br label %94

; <label>:94                                      ; preds = %89, %77
  br label %95

; <label>:95                                      ; preds = %94, %68
  br label %96

; <label>:96                                      ; preds = %95
  %97 = add nsw i32 %i.1, %incr1
  br label %66

; <label>:98                                      ; preds = %66
  %99 = bitcast %"class.soplex::SPxSteepPR"* %this to i1 (%"class.soplex::SPxSteepPR"*)***
  %100 = load i1 (%"class.soplex::SPxSteepPR"*)*** %99
  %101 = getelementptr inbounds i1 (%"class.soplex::SPxSteepPR"*)** %100, i64 18
  %102 = load i1 (%"class.soplex::SPxSteepPR"*)** %101
  %103 = call zeroext i1 %102(%"class.soplex::SPxSteepPR"* %this)
  br i1 %103, label %104, label %105

; <label>:104                                     ; preds = %98
  br label %107

; <label>:105                                     ; preds = %98
  call void @__assert_fail(i8* getelementptr inbounds ([15 x i8]* @.str10, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8]* @.str1, i32 0, i32 0), i32 482, i8* getelementptr inbounds ([75 x i8]* @__PRETTY_FUNCTION__._ZN6soplex10SPxSteepPR12selectEnterXERdiiii, i32 0, i32 0)) #10
  unreachable
                                                  ; No predecessors!
  br label %107

; <label>:107                                     ; preds = %106, %104
  ret void
}

; Function Attrs: uwtable
define linkonce_odr dereferenceable(16) %"class.soplex::Vector"* @_ZNK6soplex6SoPlex4testEv(%"class.soplex::SoPlex"* %this) #3 align 2 {
  %1 = call i32 @_ZNK6soplex6SoPlex4typeEv(%"class.soplex::SoPlex"* %this)
  %2 = icmp eq i32 %1, -1
  br i1 %2, label %3, label %4

; <label>:3                                       ; preds = %0
  br label %6

; <label>:4                                       ; preds = %0
  call void @__assert_fail(i8* getelementptr inbounds ([16 x i8]* @.str31, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8]* @.str32, i32 0, i32 0), i32 1098, i8* getelementptr inbounds ([51 x i8]* @__PRETTY_FUNCTION__._ZNK6soplex6SoPlex4testEv, i32 0, i32 0)) #10
  unreachable
                                                  ; No predecessors!
  br label %6

; <label>:6                                       ; preds = %5, %3
  %7 = getelementptr inbounds %"class.soplex::SoPlex"* %this, i32 0, i32 49
  %8 = bitcast %"class.soplex::DVector"* %7 to %"class.soplex::Vector"*
  ret %"class.soplex::Vector"* %8
}

; Function Attrs: uwtable
define linkonce_odr dereferenceable(16) %"class.soplex::Vector"* @_ZNK6soplex6SoPlex6coTestEv(%"class.soplex::SoPlex"* %this) #3 align 2 {
  %1 = call i32 @_ZNK6soplex6SoPlex4typeEv(%"class.soplex::SoPlex"* %this)
  %2 = icmp eq i32 %1, -1
  br i1 %2, label %3, label %4

; <label>:3                                       ; preds = %0
  br label %6

; <label>:4                                       ; preds = %0
  call void @__assert_fail(i8* getelementptr inbounds ([16 x i8]* @.str31, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8]* @.str32, i32 0, i32 0), i32 1032, i8* getelementptr inbounds ([53 x i8]* @__PRETTY_FUNCTION__._ZNK6soplex6SoPlex6coTestEv, i32 0, i32 0)) #10
  unreachable
                                                  ; No predecessors!
  br label %6

; <label>:6                                       ; preds = %5, %3
  %7 = getelementptr inbounds %"class.soplex::SoPlex"* %this, i32 0, i32 48
  %8 = bitcast %"class.soplex::DVector"* %7 to %"class.soplex::Vector"*
  ret %"class.soplex::Vector"* %8
}

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN6soplex5SPxIdC2Ev(%"class.soplex::SPxId"* %this) unnamed_addr #2 align 2 {
  %1 = bitcast %"class.soplex::SPxId"* %this to %"class.soplex::DataKey"*
  call void @_ZN6soplex7DataKeyC2Eii(%"class.soplex::DataKey"* %1, i32 0, i32 -1)
  ret void
}

; Function Attrs: uwtable
define linkonce_odr dereferenceable(4) %"class.soplex::SPxId"* @_ZN6soplex5SPxIdaSERKS0_(%"class.soplex::SPxId"* %this, %"class.soplex::SPxId"* dereferenceable(4) %id) #3 align 2 {
  %1 = icmp ne %"class.soplex::SPxId"* %this, %id
  br i1 %1, label %2, label %6

; <label>:2                                       ; preds = %0
  %3 = bitcast %"class.soplex::SPxId"* %this to %"class.soplex::DataKey"*
  %4 = bitcast %"class.soplex::SPxId"* %id to %"class.soplex::DataKey"*
  %5 = call dereferenceable(4) %"class.soplex::DataKey"* @_ZN6soplex7DataKeyaSERKS0_(%"class.soplex::DataKey"* %3, %"class.soplex::DataKey"* dereferenceable(4) %4)
  br label %6

; <label>:6                                       ; preds = %2, %0
  ret %"class.soplex::SPxId"* %this
}

; Function Attrs: uwtable
define linkonce_odr void @_ZNK6soplex6SoPlex2idEi(%"class.soplex::SPxId"* noalias sret %agg.result, %"class.soplex::SoPlex"* %this, i32 %i) #3 align 2 {
  %rid = alloca %"class.soplex::SPxRowId", align 4
  %cid = alloca %"class.soplex::SPxColId", align 4
  %1 = call i32 @_ZNK6soplex6SoPlex3repEv(%"class.soplex::SoPlex"* %this)
  %2 = icmp eq i32 %1, -1
  br i1 %2, label %3, label %5

; <label>:3                                       ; preds = %0
  %4 = bitcast %"class.soplex::SoPlex"* %this to %"class.soplex::SPxLP"*
  call void @_ZNK6soplex5SPxLP3rIdEi(%"class.soplex::SPxRowId"* sret %rid, %"class.soplex::SPxLP"* %4, i32 %i)
  call void @_ZN6soplex5SPxIdC2ERKNS_8SPxRowIdE(%"class.soplex::SPxId"* %agg.result, %"class.soplex::SPxRowId"* dereferenceable(4) %rid)
  br label %7

; <label>:5                                       ; preds = %0
  %6 = bitcast %"class.soplex::SoPlex"* %this to %"class.soplex::SPxLP"*
  call void @_ZNK6soplex5SPxLP3cIdEi(%"class.soplex::SPxColId"* sret %cid, %"class.soplex::SPxLP"* %6, i32 %i)
  call void @_ZN6soplex5SPxIdC2ERKNS_8SPxColIdE(%"class.soplex::SPxId"* %agg.result, %"class.soplex::SPxColId"* dereferenceable(4) %cid)
  br label %7

; <label>:7                                       ; preds = %5, %3
  ret void
}

; Function Attrs: uwtable
define linkonce_odr void @_ZNK6soplex6SoPlex4coIdEi(%"class.soplex::SPxId"* noalias sret %agg.result, %"class.soplex::SoPlex"* %this, i32 %i) #3 align 2 {
  %cid = alloca %"class.soplex::SPxColId", align 4
  %rid = alloca %"class.soplex::SPxRowId", align 4
  %1 = call i32 @_ZNK6soplex6SoPlex3repEv(%"class.soplex::SoPlex"* %this)
  %2 = icmp eq i32 %1, -1
  br i1 %2, label %3, label %5

; <label>:3                                       ; preds = %0
  %4 = bitcast %"class.soplex::SoPlex"* %this to %"class.soplex::SPxLP"*
  call void @_ZNK6soplex5SPxLP3cIdEi(%"class.soplex::SPxColId"* sret %cid, %"class.soplex::SPxLP"* %4, i32 %i)
  call void @_ZN6soplex5SPxIdC2ERKNS_8SPxColIdE(%"class.soplex::SPxId"* %agg.result, %"class.soplex::SPxColId"* dereferenceable(4) %cid)
  br label %7

; <label>:5                                       ; preds = %0
  %6 = bitcast %"class.soplex::SoPlex"* %this to %"class.soplex::SPxLP"*
  call void @_ZNK6soplex5SPxLP3rIdEi(%"class.soplex::SPxRowId"* sret %rid, %"class.soplex::SPxLP"* %6, i32 %i)
  call void @_ZN6soplex5SPxIdC2ERKNS_8SPxRowIdE(%"class.soplex::SPxId"* %agg.result, %"class.soplex::SPxRowId"* dereferenceable(4) %rid)
  br label %7

; <label>:7                                       ; preds = %5, %3
  ret void
}

; Function Attrs: uwtable
define void @_ZN6soplex10SPxSteepPR11selectEnterEv(%"class.soplex::SPxId"* noalias sret %agg.result, %"class.soplex::SPxSteepPR"* %this) unnamed_addr #3 align 2 {
  %best = alloca double, align 8
  %1 = alloca %"class.soplex::SPxId", align 4
  %2 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 6
  call void @_ZN6soplex10SPxSteepPR12selectEnterXERdiiii(%"class.soplex::SPxId"* sret %1, %"class.soplex::SPxSteepPR"* %this, double* dereferenceable(8) %best, i32 0, i32 1, i32 0, i32 1)
  %3 = call dereferenceable(4) %"class.soplex::SPxId"* @_ZN6soplex5SPxIdaSERKS0_(%"class.soplex::SPxId"* %2, %"class.soplex::SPxId"* dereferenceable(4) %1)
  %4 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 6
  %5 = call zeroext i1 @_ZNK6soplex5SPxId7isValidEv(%"class.soplex::SPxId"* %4)
  br i1 %5, label %6, label %35

; <label>:6                                       ; preds = %0
  %7 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %8 = getelementptr inbounds %"class.soplex::SPxPricer"* %7, i32 0, i32 2
  %9 = load %"class.soplex::SoPlex"** %8, align 8
  %10 = call dereferenceable(104) %"class.soplex::UpdateVector"* @_ZNK6soplex6SoPlex4fVecEv(%"class.soplex::SoPlex"* %9)
  %11 = call dereferenceable(64) %"class.soplex::SSVector"* @_ZN6soplex12UpdateVector5deltaEv(%"class.soplex::UpdateVector"* %10)
  %12 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %13 = getelementptr inbounds %"class.soplex::SPxPricer"* %12, i32 0, i32 2
  %14 = load %"class.soplex::SoPlex"** %13, align 8
  %15 = call dereferenceable(208) %"class.soplex::SPxBasis"* @_ZN6soplex6SoPlex5basisEv(%"class.soplex::SoPlex"* %14)
  %16 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %17 = getelementptr inbounds %"class.soplex::SPxPricer"* %16, i32 0, i32 2
  %18 = load %"class.soplex::SoPlex"** %17, align 8
  %19 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 6
  %20 = call dereferenceable(8) %"class.soplex::SVector"* @_ZNK6soplex6SoPlex6vectorERKNS_5SPxIdE(%"class.soplex::SoPlex"* %18, %"class.soplex::SPxId"* dereferenceable(4) %19)
  call void @_ZN6soplex8SPxBasis12solve4updateERNS_8SSVectorERKNS_7SVectorE(%"class.soplex::SPxBasis"* %15, %"class.soplex::SSVector"* dereferenceable(64) %11, %"class.soplex::SVector"* dereferenceable(8) %20)
  %21 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 13
  %22 = load double* %21, align 8
  %23 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 4
  %24 = getelementptr inbounds %"class.soplex::SSVector"* %23, i32 0, i32 3
  store double %22, double* %24, align 8
  %25 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 4
  call void @_ZN6soplex8SSVector16setup_and_assignERS0_(%"class.soplex::SSVector"* %25, %"class.soplex::SSVector"* dereferenceable(64) %11)
  %26 = call double @_ZNK6soplex8SSVector7length2Ev(%"class.soplex::SSVector"* %11)
  %27 = fadd double 1.000000e+00, %26
  %28 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 7
  store double %27, double* %28, align 8
  %29 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %30 = getelementptr inbounds %"class.soplex::SPxPricer"* %29, i32 0, i32 2
  %31 = load %"class.soplex::SoPlex"** %30, align 8
  %32 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 3
  %33 = bitcast %"class.soplex::DVector"* %32 to %"class.soplex::Vector"*
  %34 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 4
  call void @_ZN6soplex6SoPlex13setup4coSolveEPNS_6VectorEPNS_8SSVectorE(%"class.soplex::SoPlex"* %31, %"class.soplex::Vector"* %33, %"class.soplex::SSVector"* %34)
  br label %35

; <label>:35                                      ; preds = %6, %0
  %36 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 6
  call void @_ZN6soplex5SPxIdC2ERKS0_(%"class.soplex::SPxId"* %agg.result, %"class.soplex::SPxId"* dereferenceable(4) %36)
  ret void
}

; Function Attrs: uwtable
define linkonce_odr void @_ZN6soplex8SPxBasis12solve4updateERNS_8SSVectorERKNS_7SVectorE(%"class.soplex::SPxBasis"* %this, %"class.soplex::SSVector"* dereferenceable(64) %x, %"class.soplex::SVector"* dereferenceable(8) %rhs) #3 align 2 {
  %1 = getelementptr inbounds %"class.soplex::SPxBasis"* %this, i32 0, i32 6
  %2 = load i8* %1, align 1
  %3 = trunc i8 %2 to i1
  br i1 %3, label %9, label %4

; <label>:4                                       ; preds = %0
  %5 = bitcast %"class.soplex::SPxBasis"* %this to void (%"class.soplex::SPxBasis"*)***
  %6 = load void (%"class.soplex::SPxBasis"*)*** %5
  %7 = getelementptr inbounds void (%"class.soplex::SPxBasis"*)** %6, i64 10
  %8 = load void (%"class.soplex::SPxBasis"*)** %7
  call void %8(%"class.soplex::SPxBasis"* %this)
  br label %9

; <label>:9                                       ; preds = %4, %0
  %10 = getelementptr inbounds %"class.soplex::SPxBasis"* %this, i32 0, i32 5
  %11 = load %"class.soplex::SLinSolver"** %10, align 8
  %12 = bitcast %"class.soplex::SLinSolver"* %11 to void (%"class.soplex::SLinSolver"*, %"class.soplex::SSVector"*, %"class.soplex::SVector"*)***
  %13 = load void (%"class.soplex::SLinSolver"*, %"class.soplex::SSVector"*, %"class.soplex::SVector"*)*** %12
  %14 = getelementptr inbounds void (%"class.soplex::SLinSolver"*, %"class.soplex::SSVector"*, %"class.soplex::SVector"*)** %13, i64 16
  %15 = load void (%"class.soplex::SLinSolver"*, %"class.soplex::SSVector"*, %"class.soplex::SVector"*)** %14
  call void %15(%"class.soplex::SLinSolver"* %11, %"class.soplex::SSVector"* dereferenceable(64) %x, %"class.soplex::SVector"* dereferenceable(8) %rhs)
  ret void
}

; Function Attrs: uwtable
define linkonce_odr dereferenceable(8) %"class.soplex::SVector"* @_ZNK6soplex6SoPlex6vectorERKNS_5SPxIdE(%"class.soplex::SoPlex"* %this, %"class.soplex::SPxId"* dereferenceable(4) %p_id) #3 align 2 {
  %1 = alloca %"class.soplex::SPxRowId", align 4
  %2 = alloca %"class.soplex::SPxColId", align 4
  %3 = call zeroext i1 @_ZNK6soplex5SPxId7isValidEv(%"class.soplex::SPxId"* %p_id)
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  br label %7

; <label>:5                                       ; preds = %0
  call void @__assert_fail(i8* getelementptr inbounds ([15 x i8]* @.str33, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8]* @.str32, i32 0, i32 0), i32 757, i8* getelementptr inbounds ([75 x i8]* @__PRETTY_FUNCTION__._ZNK6soplex6SoPlex6vectorERKNS_5SPxIdE, i32 0, i32 0)) #10
  unreachable
                                                  ; No predecessors!
  br label %7

; <label>:7                                       ; preds = %6, %4
  %8 = call zeroext i1 @_ZNK6soplex5SPxId10isSPxRowIdEv(%"class.soplex::SPxId"* %p_id)
  br i1 %8, label %9, label %11

; <label>:9                                       ; preds = %7
  call void @_ZN6soplex8SPxRowIdC1ERKNS_5SPxIdE(%"class.soplex::SPxRowId"* %1, %"class.soplex::SPxId"* dereferenceable(4) %p_id)
  %10 = call dereferenceable(8) %"class.soplex::SVector"* @_ZNK6soplex6SoPlex6vectorERKNS_8SPxRowIdE(%"class.soplex::SoPlex"* %this, %"class.soplex::SPxRowId"* dereferenceable(4) %1)
  br label %13

; <label>:11                                      ; preds = %7
  call void @_ZN6soplex8SPxColIdC1ERKNS_5SPxIdE(%"class.soplex::SPxColId"* %2, %"class.soplex::SPxId"* dereferenceable(4) %p_id)
  %12 = call dereferenceable(8) %"class.soplex::SVector"* @_ZNK6soplex6SoPlex6vectorERKNS_8SPxColIdE(%"class.soplex::SoPlex"* %this, %"class.soplex::SPxColId"* dereferenceable(4) %2)
  br label %13

; <label>:13                                      ; preds = %11, %9
  %14 = phi %"class.soplex::SVector"* [ %10, %9 ], [ %12, %11 ]
  ret %"class.soplex::SVector"* %14
}

; Function Attrs: uwtable
define linkonce_odr void @_ZN6soplex6SoPlex13setup4coSolveEPNS_6VectorEPNS_8SSVectorE(%"class.soplex::SoPlex"* %this, %"class.soplex::Vector"* %p_y, %"class.soplex::SSVector"* %p_rhs) #3 align 2 {
  %1 = call i32 @_ZNK6soplex6SoPlex4typeEv(%"class.soplex::SoPlex"* %this)
  %2 = icmp eq i32 %1, -1
  br i1 %2, label %3, label %4

; <label>:3                                       ; preds = %0
  br label %6

; <label>:4                                       ; preds = %0
  call void @__assert_fail(i8* getelementptr inbounds ([16 x i8]* @.str31, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8]* @.str32, i32 0, i32 0), i32 1275, i8* getelementptr inbounds ([73 x i8]* @__PRETTY_FUNCTION__._ZN6soplex6SoPlex13setup4coSolveEPNS_6VectorEPNS_8SSVectorE, i32 0, i32 0)) #10
  unreachable
                                                  ; No predecessors!
  br label %6

; <label>:6                                       ; preds = %5, %3
  %7 = getelementptr inbounds %"class.soplex::SoPlex"* %this, i32 0, i32 18
  store %"class.soplex::Vector"* %p_y, %"class.soplex::Vector"** %7, align 8
  %8 = getelementptr inbounds %"class.soplex::SoPlex"* %this, i32 0, i32 19
  store %"class.soplex::SSVector"* %p_rhs, %"class.soplex::SSVector"** %8, align 8
  ret void
}

; Function Attrs: uwtable
define void @_ZN6soplex10SPxSteepPR9addedVecsEi(%"class.soplex::SPxSteepPR"* %this, i32 %n) unnamed_addr #3 align 2 {
  %1 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 1
  %2 = bitcast %"class.soplex::DVector"* %1 to %"class.soplex::Vector"*
  %3 = call i32 @_ZNK6soplex6Vector3dimEv(%"class.soplex::Vector"* %2)
  %4 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 10
  %5 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %6 = getelementptr inbounds %"class.soplex::SPxPricer"* %5, i32 0, i32 2
  %7 = load %"class.soplex::SoPlex"** %6, align 8
  %8 = call i32 @_ZNK6soplex6SoPlex5coDimEv(%"class.soplex::SoPlex"* %7)
  call void @_ZN6soplex9DataArrayIdE6reSizeEi(%"class.soplex::DataArray.3"* %4, i32 %8)
  %9 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 1
  %10 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %11 = getelementptr inbounds %"class.soplex::SPxPricer"* %10, i32 0, i32 2
  %12 = load %"class.soplex::SoPlex"** %11, align 8
  %13 = call i32 @_ZNK6soplex6SoPlex5coDimEv(%"class.soplex::SoPlex"* %12)
  call void @_ZN6soplex7DVector5reDimEi(%"class.soplex::DVector"* %9, i32 %13)
  %14 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %15 = getelementptr inbounds %"class.soplex::SPxPricer"* %14, i32 0, i32 2
  %16 = load %"class.soplex::SoPlex"** %15, align 8
  %17 = call i32 @_ZNK6soplex6SoPlex4typeEv(%"class.soplex::SoPlex"* %16)
  %18 = icmp eq i32 %17, -1
  br i1 %18, label %19, label %36

; <label>:19                                      ; preds = %0
  %20 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %21 = getelementptr inbounds %"class.soplex::SPxPricer"* %20, i32 0, i32 2
  %22 = load %"class.soplex::SoPlex"** %21, align 8
  %23 = call i32 @_ZNK6soplex6SoPlex4typeEv(%"class.soplex::SoPlex"* %22)
  call void @_ZN6soplex10SPxSteepPR10setupPrefsENS_6SoPlex4TypeE(%"class.soplex::SPxSteepPR"* %this, i32 %23)
  br label %24

; <label>:24                                      ; preds = %33, %19
  %.0 = phi i32 [ %3, %19 ], [ %34, %33 ]
  %25 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 1
  %26 = bitcast %"class.soplex::DVector"* %25 to %"class.soplex::Vector"*
  %27 = call i32 @_ZNK6soplex6Vector3dimEv(%"class.soplex::Vector"* %26)
  %28 = icmp slt i32 %.0, %27
  br i1 %28, label %29, label %35

; <label>:29                                      ; preds = %24
  %30 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 1
  %31 = bitcast %"class.soplex::DVector"* %30 to %"class.soplex::Vector"*
  %32 = call dereferenceable(8) double* @_ZN6soplex6VectorixEi(%"class.soplex::Vector"* %31, i32 %.0)
  store double 2.000000e+00, double* %32
  br label %33

; <label>:33                                      ; preds = %29
  %34 = add nsw i32 %.0, 1
  br label %24

; <label>:35                                      ; preds = %24
  br label %36

; <label>:36                                      ; preds = %35, %0
  %37 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 8
  store i32 0, i32* %37, align 4
  ret void
}

; Function Attrs: uwtable
define void @_ZN6soplex10SPxSteepPR11addedCoVecsEi(%"class.soplex::SPxSteepPR"* %this, i32 %n) unnamed_addr #3 align 2 {
  %1 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 2
  %2 = bitcast %"class.soplex::DVector"* %1 to %"class.soplex::Vector"*
  %3 = call i32 @_ZNK6soplex6Vector3dimEv(%"class.soplex::Vector"* %2)
  %4 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 11
  %5 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %6 = getelementptr inbounds %"class.soplex::SPxPricer"* %5, i32 0, i32 2
  %7 = load %"class.soplex::SoPlex"** %6, align 8
  %8 = call i32 @_ZNK6soplex6SoPlex3dimEv(%"class.soplex::SoPlex"* %7)
  call void @_ZN6soplex9DataArrayIdE6reSizeEi(%"class.soplex::DataArray.3"* %4, i32 %8)
  %9 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 9
  %10 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %11 = getelementptr inbounds %"class.soplex::SPxPricer"* %10, i32 0, i32 2
  %12 = load %"class.soplex::SoPlex"** %11, align 8
  %13 = call i32 @_ZNK6soplex6SoPlex3dimEv(%"class.soplex::SoPlex"* %12)
  call void @_ZN6soplex9DataArrayIdE6reSizeEi(%"class.soplex::DataArray.3"* %9, i32 %13)
  %14 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %15 = getelementptr inbounds %"class.soplex::SPxPricer"* %14, i32 0, i32 2
  %16 = load %"class.soplex::SoPlex"** %15, align 8
  %17 = call i32 @_ZNK6soplex6SoPlex4typeEv(%"class.soplex::SoPlex"* %16)
  call void @_ZN6soplex10SPxSteepPR10setupPrefsENS_6SoPlex4TypeE(%"class.soplex::SPxSteepPR"* %this, i32 %17)
  %18 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 3
  %19 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %20 = getelementptr inbounds %"class.soplex::SPxPricer"* %19, i32 0, i32 2
  %21 = load %"class.soplex::SoPlex"** %20, align 8
  %22 = call i32 @_ZNK6soplex6SoPlex3dimEv(%"class.soplex::SoPlex"* %21)
  call void @_ZN6soplex7DVector5reDimEi(%"class.soplex::DVector"* %18, i32 %22)
  %23 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 2
  %24 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %25 = getelementptr inbounds %"class.soplex::SPxPricer"* %24, i32 0, i32 2
  %26 = load %"class.soplex::SoPlex"** %25, align 8
  %27 = call i32 @_ZNK6soplex6SoPlex3dimEv(%"class.soplex::SoPlex"* %26)
  call void @_ZN6soplex7DVector5reDimEi(%"class.soplex::DVector"* %23, i32 %27)
  br label %28

; <label>:28                                      ; preds = %37, %0
  %.0 = phi i32 [ %3, %0 ], [ %38, %37 ]
  %29 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 2
  %30 = bitcast %"class.soplex::DVector"* %29 to %"class.soplex::Vector"*
  %31 = call i32 @_ZNK6soplex6Vector3dimEv(%"class.soplex::Vector"* %30)
  %32 = icmp slt i32 %.0, %31
  br i1 %32, label %33, label %39

; <label>:33                                      ; preds = %28
  %34 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 2
  %35 = bitcast %"class.soplex::DVector"* %34 to %"class.soplex::Vector"*
  %36 = call dereferenceable(8) double* @_ZN6soplex6VectorixEi(%"class.soplex::Vector"* %35, i32 %.0)
  store double 1.000000e+00, double* %36
  br label %37

; <label>:37                                      ; preds = %33
  %38 = add nsw i32 %.0, 1
  br label %28

; <label>:39                                      ; preds = %28
  %40 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 8
  store i32 0, i32* %40, align 4
  ret void
}

; Function Attrs: uwtable
define void @_ZN6soplex10SPxSteepPR10removedVecEi(%"class.soplex::SPxSteepPR"* %this, i32 %i) unnamed_addr #3 align 2 {
  %1 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %2 = getelementptr inbounds %"class.soplex::SPxPricer"* %1, i32 0, i32 2
  %3 = load %"class.soplex::SoPlex"** %2, align 8
  %4 = icmp ne %"class.soplex::SoPlex"* %3, null
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  br label %8

; <label>:6                                       ; preds = %0
  call void @__assert_fail(i8* getelementptr inbounds ([15 x i8]* @.str13, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8]* @.str1, i32 0, i32 0), i32 540, i8* getelementptr inbounds ([49 x i8]* @__PRETTY_FUNCTION__._ZN6soplex10SPxSteepPR10removedVecEi, i32 0, i32 0)) #10
  unreachable
                                                  ; No predecessors!
  br label %8

; <label>:8                                       ; preds = %7, %5
  %9 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 1
  %10 = bitcast %"class.soplex::DVector"* %9 to %"class.soplex::Vector"*
  %11 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 1
  %12 = bitcast %"class.soplex::DVector"* %11 to %"class.soplex::Vector"*
  %13 = call i32 @_ZNK6soplex6Vector3dimEv(%"class.soplex::Vector"* %12)
  %14 = call dereferenceable(8) double* @_ZN6soplex6VectorixEi(%"class.soplex::Vector"* %10, i32 %13)
  %15 = load double* %14
  %16 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 1
  %17 = bitcast %"class.soplex::DVector"* %16 to %"class.soplex::Vector"*
  %18 = call dereferenceable(8) double* @_ZN6soplex6VectorixEi(%"class.soplex::Vector"* %17, i32 %i)
  store double %15, double* %18
  %19 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 1
  %20 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %21 = getelementptr inbounds %"class.soplex::SPxPricer"* %20, i32 0, i32 2
  %22 = load %"class.soplex::SoPlex"** %21, align 8
  %23 = call i32 @_ZNK6soplex6SoPlex5coDimEv(%"class.soplex::SoPlex"* %22)
  call void @_ZN6soplex7DVector5reDimEi(%"class.soplex::DVector"* %19, i32 %23)
  %24 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 8
  store i32 0, i32* %24, align 4
  ret void
}

; Function Attrs: uwtable
define void @_ZN6soplex10SPxSteepPR11removedVecsEPKi(%"class.soplex::SPxSteepPR"* %this, i32* %perm) unnamed_addr #3 align 2 {
  %1 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %2 = getelementptr inbounds %"class.soplex::SPxPricer"* %1, i32 0, i32 2
  %3 = load %"class.soplex::SoPlex"** %2, align 8
  %4 = icmp ne %"class.soplex::SoPlex"* %3, null
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  br label %8

; <label>:6                                       ; preds = %0
  call void @__assert_fail(i8* getelementptr inbounds ([15 x i8]* @.str13, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8]* @.str1, i32 0, i32 0), i32 548, i8* getelementptr inbounds ([58 x i8]* @__PRETTY_FUNCTION__._ZN6soplex10SPxSteepPR11removedVecsEPKi, i32 0, i32 0)) #10
  unreachable
                                                  ; No predecessors!
  br label %8

; <label>:8                                       ; preds = %7, %5
  %9 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %10 = getelementptr inbounds %"class.soplex::SPxPricer"* %9, i32 0, i32 2
  %11 = load %"class.soplex::SoPlex"** %10, align 8
  %12 = call i32 @_ZNK6soplex6SoPlex4typeEv(%"class.soplex::SoPlex"* %11)
  %13 = icmp eq i32 %12, -1
  br i1 %13, label %14, label %40

; <label>:14                                      ; preds = %8
  %15 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 1
  %16 = bitcast %"class.soplex::DVector"* %15 to %"class.soplex::Vector"*
  %17 = call i32 @_ZNK6soplex6Vector3dimEv(%"class.soplex::Vector"* %16)
  br label %18

; <label>:18                                      ; preds = %37, %14
  %i.0 = phi i32 [ 0, %14 ], [ %38, %37 ]
  %19 = icmp slt i32 %i.0, %17
  br i1 %19, label %20, label %39

; <label>:20                                      ; preds = %18
  %21 = sext i32 %i.0 to i64
  %22 = getelementptr inbounds i32* %perm, i64 %21
  %23 = load i32* %22, align 4
  %24 = icmp sge i32 %23, 0
  br i1 %24, label %25, label %36

; <label>:25                                      ; preds = %20
  %26 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 1
  %27 = bitcast %"class.soplex::DVector"* %26 to %"class.soplex::Vector"*
  %28 = call dereferenceable(8) double* @_ZN6soplex6VectorixEi(%"class.soplex::Vector"* %27, i32 %i.0)
  %29 = load double* %28
  %30 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 1
  %31 = bitcast %"class.soplex::DVector"* %30 to %"class.soplex::Vector"*
  %32 = sext i32 %i.0 to i64
  %33 = getelementptr inbounds i32* %perm, i64 %32
  %34 = load i32* %33, align 4
  %35 = call dereferenceable(8) double* @_ZN6soplex6VectorixEi(%"class.soplex::Vector"* %31, i32 %34)
  store double %29, double* %35
  br label %36

; <label>:36                                      ; preds = %25, %20
  br label %37

; <label>:37                                      ; preds = %36
  %38 = add nsw i32 %i.0, 1
  br label %18

; <label>:39                                      ; preds = %18
  br label %40

; <label>:40                                      ; preds = %39, %8
  %41 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 1
  %42 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %43 = getelementptr inbounds %"class.soplex::SPxPricer"* %42, i32 0, i32 2
  %44 = load %"class.soplex::SoPlex"** %43, align 8
  %45 = call i32 @_ZNK6soplex6SoPlex5coDimEv(%"class.soplex::SoPlex"* %44)
  call void @_ZN6soplex7DVector5reDimEi(%"class.soplex::DVector"* %41, i32 %45)
  %46 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 8
  store i32 0, i32* %46, align 4
  ret void
}

; Function Attrs: uwtable
define void @_ZN6soplex10SPxSteepPR12removedCoVecEi(%"class.soplex::SPxSteepPR"* %this, i32 %i) unnamed_addr #3 align 2 {
  %1 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %2 = getelementptr inbounds %"class.soplex::SPxPricer"* %1, i32 0, i32 2
  %3 = load %"class.soplex::SoPlex"** %2, align 8
  %4 = icmp ne %"class.soplex::SoPlex"* %3, null
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  br label %8

; <label>:6                                       ; preds = %0
  call void @__assert_fail(i8* getelementptr inbounds ([15 x i8]* @.str13, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8]* @.str1, i32 0, i32 0), i32 563, i8* getelementptr inbounds ([51 x i8]* @__PRETTY_FUNCTION__._ZN6soplex10SPxSteepPR12removedCoVecEi, i32 0, i32 0)) #10
  unreachable
                                                  ; No predecessors!
  br label %8

; <label>:8                                       ; preds = %7, %5
  %9 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 2
  %10 = bitcast %"class.soplex::DVector"* %9 to %"class.soplex::Vector"*
  %11 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 2
  %12 = bitcast %"class.soplex::DVector"* %11 to %"class.soplex::Vector"*
  %13 = call i32 @_ZNK6soplex6Vector3dimEv(%"class.soplex::Vector"* %12)
  %14 = call dereferenceable(8) double* @_ZN6soplex6VectorixEi(%"class.soplex::Vector"* %10, i32 %13)
  %15 = load double* %14
  %16 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 2
  %17 = bitcast %"class.soplex::DVector"* %16 to %"class.soplex::Vector"*
  %18 = call dereferenceable(8) double* @_ZN6soplex6VectorixEi(%"class.soplex::Vector"* %17, i32 %i)
  store double %15, double* %18
  %19 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 2
  %20 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %21 = getelementptr inbounds %"class.soplex::SPxPricer"* %20, i32 0, i32 2
  %22 = load %"class.soplex::SoPlex"** %21, align 8
  %23 = call i32 @_ZNK6soplex6SoPlex3dimEv(%"class.soplex::SoPlex"* %22)
  call void @_ZN6soplex7DVector5reDimEi(%"class.soplex::DVector"* %19, i32 %23)
  %24 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 8
  store i32 0, i32* %24, align 4
  ret void
}

; Function Attrs: uwtable
define void @_ZN6soplex10SPxSteepPR13removedCoVecsEPKi(%"class.soplex::SPxSteepPR"* %this, i32* %perm) unnamed_addr #3 align 2 {
  %1 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %2 = getelementptr inbounds %"class.soplex::SPxPricer"* %1, i32 0, i32 2
  %3 = load %"class.soplex::SoPlex"** %2, align 8
  %4 = icmp ne %"class.soplex::SoPlex"* %3, null
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  br label %8

; <label>:6                                       ; preds = %0
  call void @__assert_fail(i8* getelementptr inbounds ([15 x i8]* @.str13, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8]* @.str1, i32 0, i32 0), i32 571, i8* getelementptr inbounds ([60 x i8]* @__PRETTY_FUNCTION__._ZN6soplex10SPxSteepPR13removedCoVecsEPKi, i32 0, i32 0)) #10
  unreachable
                                                  ; No predecessors!
  br label %8

; <label>:8                                       ; preds = %7, %5
  %9 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 2
  %10 = bitcast %"class.soplex::DVector"* %9 to %"class.soplex::Vector"*
  %11 = call i32 @_ZNK6soplex6Vector3dimEv(%"class.soplex::Vector"* %10)
  br label %12

; <label>:12                                      ; preds = %31, %8
  %i.0 = phi i32 [ 0, %8 ], [ %32, %31 ]
  %13 = icmp slt i32 %i.0, %11
  br i1 %13, label %14, label %33

; <label>:14                                      ; preds = %12
  %15 = sext i32 %i.0 to i64
  %16 = getelementptr inbounds i32* %perm, i64 %15
  %17 = load i32* %16, align 4
  %18 = icmp sge i32 %17, 0
  br i1 %18, label %19, label %30

; <label>:19                                      ; preds = %14
  %20 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 2
  %21 = bitcast %"class.soplex::DVector"* %20 to %"class.soplex::Vector"*
  %22 = call dereferenceable(8) double* @_ZN6soplex6VectorixEi(%"class.soplex::Vector"* %21, i32 %i.0)
  %23 = load double* %22
  %24 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 2
  %25 = bitcast %"class.soplex::DVector"* %24 to %"class.soplex::Vector"*
  %26 = sext i32 %i.0 to i64
  %27 = getelementptr inbounds i32* %perm, i64 %26
  %28 = load i32* %27, align 4
  %29 = call dereferenceable(8) double* @_ZN6soplex6VectorixEi(%"class.soplex::Vector"* %25, i32 %28)
  store double %23, double* %29
  br label %30

; <label>:30                                      ; preds = %19, %14
  br label %31

; <label>:31                                      ; preds = %30
  %32 = add nsw i32 %i.0, 1
  br label %12

; <label>:33                                      ; preds = %12
  %34 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 2
  %35 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %36 = getelementptr inbounds %"class.soplex::SPxPricer"* %35, i32 0, i32 2
  %37 = load %"class.soplex::SoPlex"** %36, align 8
  %38 = call i32 @_ZNK6soplex6SoPlex3dimEv(%"class.soplex::SoPlex"* %37)
  call void @_ZN6soplex7DVector5reDimEi(%"class.soplex::DVector"* %34, i32 %38)
  %39 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 8
  store i32 0, i32* %39, align 4
  ret void
}

; Function Attrs: uwtable
define zeroext i1 @_ZNK6soplex10SPxSteepPR12isConsistentEv(%"class.soplex::SPxSteepPR"* %this) unnamed_addr #3 align 2 {
  %tmp = alloca %"class.soplex::SSVector", align 8
  %1 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %2 = getelementptr inbounds %"class.soplex::SPxPricer"* %1, i32 0, i32 2
  %3 = load %"class.soplex::SoPlex"** %2, align 8
  %4 = icmp ne %"class.soplex::SoPlex"* %3, null
  br i1 %4, label %5, label %85

; <label>:5                                       ; preds = %0
  %6 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %7 = getelementptr inbounds %"class.soplex::SPxPricer"* %6, i32 0, i32 2
  %8 = load %"class.soplex::SoPlex"** %7, align 8
  %9 = call i32 @_ZNK6soplex6SoPlex4typeEv(%"class.soplex::SoPlex"* %8)
  %10 = icmp eq i32 %9, 1
  br i1 %10, label %11, label %85

; <label>:11                                      ; preds = %5
  %12 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 12
  %13 = load i32* %12, align 4
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %85

; <label>:15                                      ; preds = %11
  %16 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %17 = getelementptr inbounds %"class.soplex::SPxPricer"* %16, i32 0, i32 2
  %18 = load %"class.soplex::SoPlex"** %17, align 8
  %19 = call i32 @_ZNK6soplex6SoPlex3dimEv(%"class.soplex::SoPlex"* %18)
  %20 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %21 = getelementptr inbounds %"class.soplex::SPxPricer"* %20, i32 0, i32 2
  %22 = load %"class.soplex::SoPlex"** %21, align 8
  %23 = call double @_ZNK6soplex6SoPlex7epsilonEv(%"class.soplex::SoPlex"* %22)
  call void @_ZN6soplex8SSVectorC2Eid(%"class.soplex::SSVector"* %tmp, i32 %19, double %23)
  %24 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %25 = getelementptr inbounds %"class.soplex::SPxPricer"* %24, i32 0, i32 2
  %26 = load %"class.soplex::SoPlex"** %25, align 8
  %27 = invoke i32 @_ZNK6soplex6SoPlex3dimEv(%"class.soplex::SoPlex"* %26)
          to label %28 unwind label %76

; <label>:28                                      ; preds = %15
  %29 = sub nsw i32 %27, 1
  br label %30

; <label>:30                                      ; preds = %81, %28
  %i.0 = phi i32 [ %29, %28 ], [ %82, %81 ]
  %31 = icmp sge i32 %i.0, 0
  br i1 %31, label %32, label %83

; <label>:32                                      ; preds = %30
  %33 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %34 = getelementptr inbounds %"class.soplex::SPxPricer"* %33, i32 0, i32 2
  %35 = load %"class.soplex::SoPlex"** %34, align 8
  %36 = invoke dereferenceable(208) %"class.soplex::SPxBasis"* @_ZN6soplex6SoPlex5basisEv(%"class.soplex::SoPlex"* %35)
          to label %37 unwind label %76

; <label>:37                                      ; preds = %32
  %38 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %39 = getelementptr inbounds %"class.soplex::SPxPricer"* %38, i32 0, i32 2
  %40 = load %"class.soplex::SoPlex"** %39, align 8
  %41 = invoke dereferenceable(8) %"class.soplex::SVector"* @_ZNK6soplex6SoPlex10unitVectorEi(%"class.soplex::SoPlex"* %40, i32 %i.0)
          to label %42 unwind label %76

; <label>:42                                      ; preds = %37
  invoke void @_ZN6soplex8SPxBasis7coSolveERNS_8SSVectorERKNS_7SVectorE(%"class.soplex::SPxBasis"* %36, %"class.soplex::SSVector"* dereferenceable(64) %tmp, %"class.soplex::SVector"* dereferenceable(8) %41)
          to label %43 unwind label %76

; <label>:43                                      ; preds = %42
  %44 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 2
  %45 = bitcast %"class.soplex::DVector"* %44 to %"class.soplex::Vector"*
  %46 = invoke double @_ZNK6soplex6VectorixEi(%"class.soplex::Vector"* %45, i32 %i.0)
          to label %47 unwind label %76

; <label>:47                                      ; preds = %43
  %48 = invoke double @_ZNK6soplex8SSVector7length2Ev(%"class.soplex::SSVector"* %tmp)
          to label %49 unwind label %76

; <label>:49                                      ; preds = %47
  %50 = fsub double %46, %48
  %51 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %52 = getelementptr inbounds %"class.soplex::SPxPricer"* %51, i32 0, i32 2
  %53 = load %"class.soplex::SoPlex"** %52, align 8
  %54 = invoke double @_ZNK6soplex6SoPlex5deltaEv(%"class.soplex::SoPlex"* %53)
          to label %55 unwind label %76

; <label>:55                                      ; preds = %49
  %56 = fcmp ogt double %50, %54
  br i1 %56, label %65, label %57

; <label>:57                                      ; preds = %55
  %58 = fsub double -0.000000e+00, %50
  %59 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %60 = getelementptr inbounds %"class.soplex::SPxPricer"* %59, i32 0, i32 2
  %61 = load %"class.soplex::SoPlex"** %60, align 8
  %62 = invoke double @_ZNK6soplex6SoPlex5deltaEv(%"class.soplex::SoPlex"* %61)
          to label %63 unwind label %76

; <label>:63                                      ; preds = %57
  %64 = fcmp ogt double %58, %62
  br i1 %64, label %65, label %80

; <label>:65                                      ; preds = %63, %55
  %66 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cerr, i8* getelementptr inbounds ([3 x i8]* @.str14, i32 0, i32 0))
          to label %67 unwind label %76

; <label>:67                                      ; preds = %65
  %68 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* %66, i32 %i.0)
          to label %69 unwind label %76

; <label>:69                                      ; preds = %67
  %70 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %68, i8* getelementptr inbounds ([5 x i8]* @.str15, i32 0, i32 0))
          to label %71 unwind label %76

; <label>:71                                      ; preds = %69
  %72 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEd(%"class.std::basic_ostream"* %70, double %50)
          to label %73 unwind label %76

; <label>:73                                      ; preds = %71
  %74 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* %72, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
          to label %75 unwind label %76

; <label>:75                                      ; preds = %73
  br label %80

; <label>:76                                      ; preds = %73, %71, %69, %67, %65, %57, %49, %47, %43, %42, %37, %32, %15
  %77 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
  %78 = extractvalue { i8*, i32 } %77, 0
  %79 = extractvalue { i8*, i32 } %77, 1
  invoke void @_ZN6soplex8SSVectorD2Ev(%"class.soplex::SSVector"* %tmp)
          to label %84 unwind label %146

; <label>:80                                      ; preds = %75, %63
  br label %81

; <label>:81                                      ; preds = %80
  %82 = add nsw i32 %i.0, -1
  br label %30

; <label>:83                                      ; preds = %30
  call void @_ZN6soplex8SSVectorD2Ev(%"class.soplex::SSVector"* %tmp)
  br label %85

; <label>:84                                      ; preds = %76
  br label %143

; <label>:85                                      ; preds = %83, %11, %5, %0
  %86 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %87 = getelementptr inbounds %"class.soplex::SPxPricer"* %86, i32 0, i32 2
  %88 = load %"class.soplex::SoPlex"** %87, align 8
  %89 = icmp ne %"class.soplex::SoPlex"* %88, null
  br i1 %89, label %90, label %141

; <label>:90                                      ; preds = %85
  %91 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %92 = getelementptr inbounds %"class.soplex::SPxPricer"* %91, i32 0, i32 2
  %93 = load %"class.soplex::SoPlex"** %92, align 8
  %94 = call i32 @_ZNK6soplex6SoPlex4typeEv(%"class.soplex::SoPlex"* %93)
  %95 = icmp eq i32 %94, -1
  br i1 %95, label %96, label %141

; <label>:96                                      ; preds = %90
  %97 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %98 = getelementptr inbounds %"class.soplex::SPxPricer"* %97, i32 0, i32 2
  %99 = load %"class.soplex::SoPlex"** %98, align 8
  %100 = call i32 @_ZNK6soplex6SoPlex3dimEv(%"class.soplex::SoPlex"* %99)
  %101 = sub nsw i32 %100, 1
  br label %102

; <label>:102                                     ; preds = %116, %96
  %i1.0 = phi i32 [ %101, %96 ], [ %117, %116 ]
  %103 = icmp sge i32 %i1.0, 0
  br i1 %103, label %104, label %118

; <label>:104                                     ; preds = %102
  %105 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 2
  %106 = bitcast %"class.soplex::DVector"* %105 to %"class.soplex::Vector"*
  %107 = call double @_ZNK6soplex6VectorixEi(%"class.soplex::Vector"* %106, i32 %i1.0)
  %108 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %109 = getelementptr inbounds %"class.soplex::SPxPricer"* %108, i32 0, i32 2
  %110 = load %"class.soplex::SoPlex"** %109, align 8
  %111 = call double @_ZNK6soplex6SoPlex7epsilonEv(%"class.soplex::SoPlex"* %110)
  %112 = fcmp olt double %107, %111
  br i1 %112, label %113, label %115

; <label>:113                                     ; preds = %104
  %114 = call zeroext i1 @_ZN6soplex15msginconsistentEPKcS1_i(i8* getelementptr inbounds ([11 x i8]* @.str16, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8]* @.str1, i32 0, i32 0), i32 604)
  br label %142

; <label>:115                                     ; preds = %104
  br label %116

; <label>:116                                     ; preds = %115
  %117 = add nsw i32 %i1.0, -1
  br label %102

; <label>:118                                     ; preds = %102
  %119 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %120 = getelementptr inbounds %"class.soplex::SPxPricer"* %119, i32 0, i32 2
  %121 = load %"class.soplex::SoPlex"** %120, align 8
  %122 = call i32 @_ZNK6soplex6SoPlex5coDimEv(%"class.soplex::SoPlex"* %121)
  %123 = sub nsw i32 %122, 1
  br label %124

; <label>:124                                     ; preds = %138, %118
  %i1.1 = phi i32 [ %123, %118 ], [ %139, %138 ]
  %125 = icmp sge i32 %i1.1, 0
  br i1 %125, label %126, label %140

; <label>:126                                     ; preds = %124
  %127 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 1
  %128 = bitcast %"class.soplex::DVector"* %127 to %"class.soplex::Vector"*
  %129 = call double @_ZNK6soplex6VectorixEi(%"class.soplex::Vector"* %128, i32 %i1.1)
  %130 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  %131 = getelementptr inbounds %"class.soplex::SPxPricer"* %130, i32 0, i32 2
  %132 = load %"class.soplex::SoPlex"** %131, align 8
  %133 = call double @_ZNK6soplex6SoPlex7epsilonEv(%"class.soplex::SoPlex"* %132)
  %134 = fcmp olt double %129, %133
  br i1 %134, label %135, label %137

; <label>:135                                     ; preds = %126
  %136 = call zeroext i1 @_ZN6soplex15msginconsistentEPKcS1_i(i8* getelementptr inbounds ([11 x i8]* @.str16, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8]* @.str1, i32 0, i32 0), i32 608)
  br label %142

; <label>:137                                     ; preds = %126
  br label %138

; <label>:138                                     ; preds = %137
  %139 = add nsw i32 %i1.1, -1
  br label %124

; <label>:140                                     ; preds = %124
  br label %141

; <label>:141                                     ; preds = %140, %90, %85
  br label %142

; <label>:142                                     ; preds = %141, %135, %113
  %.0 = phi i1 [ %114, %113 ], [ %136, %135 ], [ true, %141 ]
  ret i1 %.0

; <label>:143                                     ; preds = %84
  %144 = insertvalue { i8*, i32 } undef, i8* %78, 0
  %145 = insertvalue { i8*, i32 } %144, i32 %79, 1
  resume { i8*, i32 } %145

; <label>:146                                     ; preds = %76
  %147 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          catch i8* null
  %148 = extractvalue { i8*, i32 } %147, 0
  call void @__clang_call_terminate(i8* %148) #10
  unreachable
}

; Function Attrs: uwtable
define linkonce_odr void @_ZN6soplex8SSVectorC2Eid(%"class.soplex::SSVector"* %this, i32 %p_dim, double %p_eps) unnamed_addr #3 align 2 {
  %1 = bitcast %"class.soplex::SSVector"* %this to %"class.soplex::DVector"*
  call void @_ZN6soplex7DVectorC2Ei(%"class.soplex::DVector"* %1, i32 %p_dim)
  %2 = bitcast %"class.soplex::SSVector"* %this to i8*
  %3 = getelementptr inbounds i8* %2, i64 32
  %4 = bitcast i8* %3 to %"class.soplex::IdxSet"*
  invoke void @_ZN6soplex6IdxSetC2Ev(%"class.soplex::IdxSet"* %4)
          to label %5 unwind label %29

; <label>:5                                       ; preds = %0
  %6 = getelementptr inbounds %"class.soplex::SSVector"* %this, i32 0, i32 2
  store i8 1, i8* %6, align 1
  %7 = getelementptr inbounds %"class.soplex::SSVector"* %this, i32 0, i32 3
  store double %p_eps, double* %7, align 8
  %8 = icmp slt i32 %p_dim, 1
  br i1 %8, label %9, label %10

; <label>:9                                       ; preds = %5
  br label %11

; <label>:10                                      ; preds = %5
  br label %11

; <label>:11                                      ; preds = %10, %9
  %12 = phi i32 [ 1, %9 ], [ %p_dim, %10 ]
  %13 = bitcast %"class.soplex::SSVector"* %this to i8*
  %14 = getelementptr inbounds i8* %13, i64 32
  %15 = bitcast i8* %14 to %"class.soplex::IdxSet"*
  %16 = getelementptr inbounds %"class.soplex::IdxSet"* %15, i32 0, i32 1
  store i32 %12, i32* %16, align 4
  %17 = bitcast %"class.soplex::SSVector"* %this to i8*
  %18 = getelementptr inbounds i8* %17, i64 32
  %19 = bitcast i8* %18 to %"class.soplex::IdxSet"*
  %20 = getelementptr inbounds %"class.soplex::IdxSet"* %19, i32 0, i32 2
  %21 = bitcast %"class.soplex::SSVector"* %this to i8*
  %22 = getelementptr inbounds i8* %21, i64 32
  %23 = bitcast i8* %22 to %"class.soplex::IdxSet"*
  %24 = getelementptr inbounds %"class.soplex::IdxSet"* %23, i32 0, i32 1
  %25 = load i32* %24, align 4
  invoke void @_ZN6soplex9spx_allocIPiEEvRT_i(i32** dereferenceable(8) %20, i32 %25)
          to label %26 unwind label %29

; <label>:26                                      ; preds = %11
  %27 = bitcast %"class.soplex::SSVector"* %this to %"class.soplex::Vector"*
  invoke void @_ZN6soplex6Vector5clearEv(%"class.soplex::Vector"* %27)
          to label %28 unwind label %29

; <label>:28                                      ; preds = %26
  ret void

; <label>:29                                      ; preds = %26, %11, %0
  %30 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
  %31 = extractvalue { i8*, i32 } %30, 0
  %32 = extractvalue { i8*, i32 } %30, 1
  %33 = bitcast %"class.soplex::SSVector"* %this to %"class.soplex::DVector"*
  invoke void @_ZN6soplex7DVectorD2Ev(%"class.soplex::DVector"* %33)
          to label %34 unwind label %38

; <label>:34                                      ; preds = %29
  br label %35

; <label>:35                                      ; preds = %34
  %36 = insertvalue { i8*, i32 } undef, i8* %31, 0
  %37 = insertvalue { i8*, i32 } %36, i32 %32, 1
  resume { i8*, i32 } %37

; <label>:38                                      ; preds = %29
  %39 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          catch i8* null
  %40 = extractvalue { i8*, i32 } %39, 0
  call void @__clang_call_terminate(i8* %40) #10
  unreachable
}

; Function Attrs: uwtable
define linkonce_odr double @_ZNK6soplex6VectorixEi(%"class.soplex::Vector"* %this, i32 %n) #3 align 2 {
  %1 = icmp sge i32 %n, 0
  br i1 %1, label %2, label %6

; <label>:2                                       ; preds = %0
  %3 = call i32 @_ZNK6soplex6Vector3dimEv(%"class.soplex::Vector"* %this)
  %4 = icmp slt i32 %n, %3
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %2
  br label %8

; <label>:6                                       ; preds = %2, %0
  call void @__assert_fail(i8* getelementptr inbounds ([20 x i8]* @.str28, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8]* @.str29, i32 0, i32 0), i32 160, i8* getelementptr inbounds ([43 x i8]* @__PRETTY_FUNCTION__._ZNK6soplex6VectorixEi, i32 0, i32 0)) #10
  unreachable
                                                  ; No predecessors!
  br label %8

; <label>:8                                       ; preds = %7, %5
  %9 = sext i32 %n to i64
  %10 = getelementptr inbounds %"class.soplex::Vector"* %this, i32 0, i32 1
  %11 = load double** %10, align 8
  %12 = getelementptr inbounds double* %11, i64 %9
  %13 = load double* %12, align 8
  ret double %13
}

; Function Attrs: nounwind uwtable
define linkonce_odr double @_ZNK6soplex6SoPlex5deltaEv(%"class.soplex::SoPlex"* %this) #2 align 2 {
  %1 = getelementptr inbounds %"class.soplex::SoPlex"* %this, i32 0, i32 10
  %2 = load double* %1, align 8
  ret double %2
}

; Function Attrs: uwtable
define linkonce_odr void @_ZN6soplex8SSVectorD2Ev(%"class.soplex::SSVector"* %this) unnamed_addr #3 align 2 {
  %1 = bitcast %"class.soplex::SSVector"* %this to i8*
  %2 = getelementptr inbounds i8* %1, i64 32
  %3 = bitcast i8* %2 to %"class.soplex::IdxSet"*
  %4 = getelementptr inbounds %"class.soplex::IdxSet"* %3, i32 0, i32 2
  %5 = load i32** %4, align 8
  %6 = icmp ne i32* %5, null
  br i1 %6, label %7, label %18

; <label>:7                                       ; preds = %0
  %8 = bitcast %"class.soplex::SSVector"* %this to i8*
  %9 = getelementptr inbounds i8* %8, i64 32
  %10 = bitcast i8* %9 to %"class.soplex::IdxSet"*
  %11 = getelementptr inbounds %"class.soplex::IdxSet"* %10, i32 0, i32 2
  invoke void @_ZN6soplex8spx_freeIPiEEvRT_(i32** dereferenceable(8) %11)
          to label %12 unwind label %13

; <label>:12                                      ; preds = %7
  br label %18

; <label>:13                                      ; preds = %7
  %14 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
  %15 = extractvalue { i8*, i32 } %14, 0
  %16 = extractvalue { i8*, i32 } %14, 1
  %17 = bitcast %"class.soplex::SSVector"* %this to %"class.soplex::DVector"*
  invoke void @_ZN6soplex7DVectorD2Ev(%"class.soplex::DVector"* %17)
          to label %20 unwind label %24

; <label>:18                                      ; preds = %12, %0
  %19 = bitcast %"class.soplex::SSVector"* %this to %"class.soplex::DVector"*
  call void @_ZN6soplex7DVectorD2Ev(%"class.soplex::DVector"* %19)
  ret void

; <label>:20                                      ; preds = %13
  br label %21

; <label>:21                                      ; preds = %20
  %22 = insertvalue { i8*, i32 } undef, i8* %15, 0
  %23 = insertvalue { i8*, i32 } %22, i32 %16, 1
  resume { i8*, i32 } %23

; <label>:24                                      ; preds = %13
  %25 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          catch i8* null
  %26 = extractvalue { i8*, i32 } %25, 0
  call void @__clang_call_terminate(i8* %26) #10
  unreachable
}

declare zeroext i1 @_ZN6soplex15msginconsistentEPKcS1_i(i8*, i8*, i32) #0

; Function Attrs: nounwind uwtable
define linkonce_odr i8* @_ZNK6soplex9SPxPricer7getNameEv(%"class.soplex::SPxPricer"* %this) unnamed_addr #2 align 2 {
  %1 = getelementptr inbounds %"class.soplex::SPxPricer"* %this, i32 0, i32 1
  %2 = load i8** %1, align 8
  ret i8* %2
}

; Function Attrs: nounwind uwtable
define linkonce_odr %"class.soplex::SoPlex"* @_ZNK6soplex9SPxPricer6solverEv(%"class.soplex::SPxPricer"* %this) unnamed_addr #2 align 2 {
  %1 = getelementptr inbounds %"class.soplex::SPxPricer"* %this, i32 0, i32 2
  %2 = load %"class.soplex::SoPlex"** %1, align 8
  ret %"class.soplex::SoPlex"* %2
}

; Function Attrs: nounwind uwtable
define linkonce_odr double @_ZNK6soplex9SPxPricer7epsilonEv(%"class.soplex::SPxPricer"* %this) unnamed_addr #2 align 2 {
  %1 = getelementptr inbounds %"class.soplex::SPxPricer"* %this, i32 0, i32 3
  %2 = load double* %1, align 8
  ret double %2
}

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN6soplex9SPxPricer10setEpsilonEd(%"class.soplex::SPxPricer"* %this, double %eps) unnamed_addr #2 align 2 {
  %1 = fcmp oge double %eps, 0.000000e+00
  br i1 %1, label %2, label %3

; <label>:2                                       ; preds = %0
  br label %5

; <label>:3                                       ; preds = %0
  call void @__assert_fail(i8* getelementptr inbounds ([11 x i8]* @.str26, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8]* @.str27, i32 0, i32 0), i32 99, i8* getelementptr inbounds ([49 x i8]* @__PRETTY_FUNCTION__._ZN6soplex9SPxPricer10setEpsilonEd, i32 0, i32 0)) #10
  unreachable
                                                  ; No predecessors!
  br label %5

; <label>:5                                       ; preds = %4, %2
  %6 = getelementptr inbounds %"class.soplex::SPxPricer"* %this, i32 0, i32 3
  store double %eps, double* %6, align 8
  ret void
}

; Function Attrs: inlinehint uwtable
define linkonce_odr void @_ZN6soplex10SPxSteepPRD2Ev(%"class.soplex::SPxSteepPR"* %this) unnamed_addr #7 align 2 {
  %1 = bitcast %"class.soplex::SPxSteepPR"* %this to i32 (...)***
  store i32 (...)** bitcast (i8** getelementptr inbounds ([23 x i8*]* @_ZTVN6soplex10SPxSteepPRE, i64 0, i64 2) to i32 (...)**), i32 (...)*** %1
  %2 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 11
  invoke void @_ZN6soplex9DataArrayIdED2Ev(%"class.soplex::DataArray.3"* %2)
          to label %3 unwind label %17

; <label>:3                                       ; preds = %0
  %4 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 10
  invoke void @_ZN6soplex9DataArrayIdED2Ev(%"class.soplex::DataArray.3"* %4)
          to label %5 unwind label %22

; <label>:5                                       ; preds = %3
  %6 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 9
  invoke void @_ZN6soplex9DataArrayIdED2Ev(%"class.soplex::DataArray.3"* %6)
          to label %7 unwind label %27

; <label>:7                                       ; preds = %5
  %8 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 4
  invoke void @_ZN6soplex8SSVectorD2Ev(%"class.soplex::SSVector"* %8)
          to label %9 unwind label %34

; <label>:9                                       ; preds = %7
  %10 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 3
  invoke void @_ZN6soplex7DVectorD1Ev(%"class.soplex::DVector"* %10)
          to label %11 unwind label %41

; <label>:11                                      ; preds = %9
  %12 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 2
  invoke void @_ZN6soplex7DVectorD1Ev(%"class.soplex::DVector"* %12)
          to label %13 unwind label %48

; <label>:13                                      ; preds = %11
  %14 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 1
  invoke void @_ZN6soplex7DVectorD1Ev(%"class.soplex::DVector"* %14)
          to label %15 unwind label %55

; <label>:15                                      ; preds = %13
  %16 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  call void @_ZN6soplex9SPxPricerD2Ev(%"class.soplex::SPxPricer"* %16)
  ret void

; <label>:17                                      ; preds = %0
  %18 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
  %19 = extractvalue { i8*, i32 } %18, 0
  %20 = extractvalue { i8*, i32 } %18, 1
  %21 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 10
  invoke void @_ZN6soplex9DataArrayIdED2Ev(%"class.soplex::DataArray.3"* %21)
          to label %26 unwind label %68

; <label>:22                                      ; preds = %3
  %23 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
  %24 = extractvalue { i8*, i32 } %23, 0
  %25 = extractvalue { i8*, i32 } %23, 1
  br label %31

; <label>:26                                      ; preds = %17
  br label %31

; <label>:27                                      ; preds = %5
  %28 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
  %29 = extractvalue { i8*, i32 } %28, 0
  %30 = extractvalue { i8*, i32 } %28, 1
  br label %38

; <label>:31                                      ; preds = %26, %22
  %.01 = phi i8* [ %24, %22 ], [ %19, %26 ]
  %.0 = phi i32 [ %25, %22 ], [ %20, %26 ]
  %32 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 9
  invoke void @_ZN6soplex9DataArrayIdED2Ev(%"class.soplex::DataArray.3"* %32)
          to label %33 unwind label %68

; <label>:33                                      ; preds = %31
  br label %38

; <label>:34                                      ; preds = %7
  %35 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
  %36 = extractvalue { i8*, i32 } %35, 0
  %37 = extractvalue { i8*, i32 } %35, 1
  br label %45

; <label>:38                                      ; preds = %33, %27
  %.12 = phi i8* [ %29, %27 ], [ %.01, %33 ]
  %.1 = phi i32 [ %30, %27 ], [ %.0, %33 ]
  %39 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 4
  invoke void @_ZN6soplex8SSVectorD2Ev(%"class.soplex::SSVector"* %39)
          to label %40 unwind label %68

; <label>:40                                      ; preds = %38
  br label %45

; <label>:41                                      ; preds = %9
  %42 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
  %43 = extractvalue { i8*, i32 } %42, 0
  %44 = extractvalue { i8*, i32 } %42, 1
  br label %52

; <label>:45                                      ; preds = %40, %34
  %.23 = phi i8* [ %36, %34 ], [ %.12, %40 ]
  %.2 = phi i32 [ %37, %34 ], [ %.1, %40 ]
  %46 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 3
  invoke void @_ZN6soplex7DVectorD1Ev(%"class.soplex::DVector"* %46)
          to label %47 unwind label %68

; <label>:47                                      ; preds = %45
  br label %52

; <label>:48                                      ; preds = %11
  %49 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
  %50 = extractvalue { i8*, i32 } %49, 0
  %51 = extractvalue { i8*, i32 } %49, 1
  br label %59

; <label>:52                                      ; preds = %47, %41
  %.34 = phi i8* [ %43, %41 ], [ %.23, %47 ]
  %.3 = phi i32 [ %44, %41 ], [ %.2, %47 ]
  %53 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 2
  invoke void @_ZN6soplex7DVectorD1Ev(%"class.soplex::DVector"* %53)
          to label %54 unwind label %68

; <label>:54                                      ; preds = %52
  br label %59

; <label>:55                                      ; preds = %13
  %56 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
  %57 = extractvalue { i8*, i32 } %56, 0
  %58 = extractvalue { i8*, i32 } %56, 1
  br label %62

; <label>:59                                      ; preds = %54, %48
  %.45 = phi i8* [ %50, %48 ], [ %.34, %54 ]
  %.4 = phi i32 [ %51, %48 ], [ %.3, %54 ]
  %60 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %this, i32 0, i32 1
  invoke void @_ZN6soplex7DVectorD1Ev(%"class.soplex::DVector"* %60)
          to label %61 unwind label %68

; <label>:61                                      ; preds = %59
  br label %62

; <label>:62                                      ; preds = %61, %55
  %.56 = phi i8* [ %57, %55 ], [ %.45, %61 ]
  %.5 = phi i32 [ %58, %55 ], [ %.4, %61 ]
  %63 = bitcast %"class.soplex::SPxSteepPR"* %this to %"class.soplex::SPxPricer"*
  invoke void @_ZN6soplex9SPxPricerD2Ev(%"class.soplex::SPxPricer"* %63)
          to label %64 unwind label %68

; <label>:64                                      ; preds = %62
  br label %65

; <label>:65                                      ; preds = %64
  %66 = insertvalue { i8*, i32 } undef, i8* %.56, 0
  %67 = insertvalue { i8*, i32 } %66, i32 %.5, 1
  resume { i8*, i32 } %67

; <label>:68                                      ; preds = %62, %59, %52, %45, %38, %31, %17
  %69 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          catch i8* null
  %70 = extractvalue { i8*, i32 } %69, 0
  call void @__clang_call_terminate(i8* %70) #10
  unreachable
}

; Function Attrs: inlinehint uwtable
define linkonce_odr void @_ZN6soplex10SPxSteepPRD0Ev(%"class.soplex::SPxSteepPR"* %this) unnamed_addr #7 align 2 {
  invoke void @_ZN6soplex10SPxSteepPRD2Ev(%"class.soplex::SPxSteepPR"* %this)
          to label %1 unwind label %3

; <label>:1                                       ; preds = %0
  %2 = bitcast %"class.soplex::SPxSteepPR"* %this to i8*
  call void @_ZdlPv(i8* %2) #11
  ret void

; <label>:3                                       ; preds = %0
  %4 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
  %5 = extractvalue { i8*, i32 } %4, 0
  %6 = extractvalue { i8*, i32 } %4, 1
  %7 = bitcast %"class.soplex::SPxSteepPR"* %this to i8*
  call void @_ZdlPv(i8* %7) #11
  br label %8

; <label>:8                                       ; preds = %3
  %9 = insertvalue { i8*, i32 } undef, i8* %5, 0
  %10 = insertvalue { i8*, i32 } %9, i32 %6, 1
  resume { i8*, i32 } %10
}

; Function Attrs: uwtable
define linkonce_odr i64 @_ZN6soplex9DataArrayIdE5reMaxEii(%"class.soplex::DataArray.3"* %this, i32 %newMax, i32 %newSize) #3 align 2 {
  %1 = icmp sge i32 %newSize, 0
  br i1 %1, label %2, label %4

; <label>:2                                       ; preds = %0
  %3 = getelementptr inbounds %"class.soplex::DataArray.3"* %this, i32 0, i32 0
  store i32 %newSize, i32* %3, align 4
  br label %4

; <label>:4                                       ; preds = %2, %0
  %5 = icmp slt i32 %newMax, %newSize
  br i1 %5, label %6, label %7

; <label>:6                                       ; preds = %4
  br label %7

; <label>:7                                       ; preds = %6, %4
  %.01 = phi i32 [ %newSize, %6 ], [ %newMax, %4 ]
  %8 = icmp slt i32 %.01, 1
  br i1 %8, label %9, label %10

; <label>:9                                       ; preds = %7
  br label %10

; <label>:10                                      ; preds = %9, %7
  %.1 = phi i32 [ 1, %9 ], [ %.01, %7 ]
  %11 = getelementptr inbounds %"class.soplex::DataArray.3"* %this, i32 0, i32 1
  %12 = load i32* %11, align 4
  %13 = icmp eq i32 %.1, %12
  br i1 %13, label %14, label %15

; <label>:14                                      ; preds = %10
  br label %39

; <label>:15                                      ; preds = %10
  %16 = getelementptr inbounds %"class.soplex::DataArray.3"* %this, i32 0, i32 1
  store i32 %.1, i32* %16, align 4
  %17 = getelementptr inbounds %"class.soplex::DataArray.3"* %this, i32 0, i32 2
  %18 = load double** %17, align 8
  %19 = getelementptr inbounds %"class.soplex::DataArray.3"* %this, i32 0, i32 0
  %20 = load i32* %19, align 4
  %21 = icmp sle i32 %20, 0
  br i1 %21, label %22, label %27

; <label>:22                                      ; preds = %15
  %23 = getelementptr inbounds %"class.soplex::DataArray.3"* %this, i32 0, i32 2
  call void @_ZN6soplex8spx_freeIPdEEvRT_(double** dereferenceable(8) %23)
  %24 = getelementptr inbounds %"class.soplex::DataArray.3"* %this, i32 0, i32 2
  %25 = getelementptr inbounds %"class.soplex::DataArray.3"* %this, i32 0, i32 1
  %26 = load i32* %25, align 4
  call void @_ZN6soplex9spx_allocIPdEEvRT_i(double** dereferenceable(8) %24, i32 %26)
  br label %31

; <label>:27                                      ; preds = %15
  %28 = getelementptr inbounds %"class.soplex::DataArray.3"* %this, i32 0, i32 2
  %29 = getelementptr inbounds %"class.soplex::DataArray.3"* %this, i32 0, i32 1
  %30 = load i32* %29, align 4
  call void @_ZN6soplex11spx_reallocIPdEEvRT_i(double** dereferenceable(8) %28, i32 %30)
  br label %31

; <label>:31                                      ; preds = %27, %22
  %32 = getelementptr inbounds %"class.soplex::DataArray.3"* %this, i32 0, i32 2
  %33 = load double** %32, align 8
  %34 = bitcast double* %33 to i8*
  %35 = bitcast double* %18 to i8*
  %36 = ptrtoint i8* %34 to i64
  %37 = ptrtoint i8* %35 to i64
  %38 = sub i64 %36, %37
  br label %39

; <label>:39                                      ; preds = %31, %14
  %.0 = phi i64 [ 0, %14 ], [ %38, %31 ]
  ret i64 %.0
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr void @_ZN6soplex8spx_freeIPdEEvRT_(double** dereferenceable(8) %p) #5 {
  %1 = load double** %p, align 8
  %2 = icmp ne double* %1, null
  br i1 %2, label %3, label %4

; <label>:3                                       ; preds = %0
  br label %6

; <label>:4                                       ; preds = %0
  call void @__assert_fail(i8* getelementptr inbounds ([7 x i8]* @.str21, i32 0, i32 0), i8* getelementptr inbounds ([13 x i8]* @.str22, i32 0, i32 0), i32 88, i8* getelementptr inbounds ([42 x i8]* @__PRETTY_FUNCTION__._ZN6soplex8spx_freeIPdEEvRT_, i32 0, i32 0)) #10
  unreachable
                                                  ; No predecessors!
  br label %6

; <label>:6                                       ; preds = %5, %3
  %7 = load double** %p, align 8
  %8 = bitcast double* %7 to i8*
  call void @free(i8* %8) #1
  store double* null, double** %p, align 8
  ret void
}

; Function Attrs: inlinehint uwtable
define linkonce_odr void @_ZN6soplex9spx_allocIPdEEvRT_i(double** dereferenceable(8) %p, i32 %n) #7 {
  %1 = load double** %p, align 8
  %2 = icmp eq double* %1, null
  br i1 %2, label %3, label %4

; <label>:3                                       ; preds = %0
  br label %6

; <label>:4                                       ; preds = %0
  call void @__assert_fail(i8* getelementptr inbounds ([7 x i8]* @.str24, i32 0, i32 0), i8* getelementptr inbounds ([13 x i8]* @.str22, i32 0, i32 0), i32 50, i8* getelementptr inbounds ([48 x i8]* @__PRETTY_FUNCTION__._ZN6soplex9spx_allocIPdEEvRT_i, i32 0, i32 0)) #10
  unreachable
                                                  ; No predecessors!
  br label %6

; <label>:6                                       ; preds = %5, %3
  %7 = icmp sge i32 %n, 0
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %6
  br label %11

; <label>:9                                       ; preds = %6
  call void @__assert_fail(i8* getelementptr inbounds ([7 x i8]* @.str17, i32 0, i32 0), i8* getelementptr inbounds ([13 x i8]* @.str22, i32 0, i32 0), i32 51, i8* getelementptr inbounds ([48 x i8]* @__PRETTY_FUNCTION__._ZN6soplex9spx_allocIPdEEvRT_i, i32 0, i32 0)) #10
  unreachable
                                                  ; No predecessors!
  br label %11

; <label>:11                                      ; preds = %10, %8
  %12 = icmp eq i32 %n, 0
  br i1 %12, label %13, label %14

; <label>:13                                      ; preds = %11
  br label %14

; <label>:14                                      ; preds = %13, %11
  %.0 = phi i32 [ 1, %13 ], [ %n, %11 ]
  %15 = sext i32 %.0 to i64
  %16 = mul i64 8, %15
  %17 = call noalias i8* @malloc(i64 %16) #1
  %18 = bitcast i8* %17 to double*
  store double* %18, double** %p, align 8
  %19 = load double** %p, align 8
  %20 = icmp eq double* null, %19
  br i1 %20, label %21, label %24

; <label>:21                                      ; preds = %14
  %22 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cerr, i8* getelementptr inbounds ([22 x i8]* @.str25, i32 0, i32 0))
  %23 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* %22, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
  call void @abort() #10
  unreachable

; <label>:24                                      ; preds = %14
  ret void
}

; Function Attrs: inlinehint uwtable
define linkonce_odr void @_ZN6soplex11spx_reallocIPdEEvRT_i(double** dereferenceable(8) %p, i32 %n) #7 {
  %1 = load double** %p, align 8
  %2 = icmp ne double* %1, null
  br i1 %2, label %3, label %4

; <label>:3                                       ; preds = %0
  br label %6

; <label>:4                                       ; preds = %0
  call void @__assert_fail(i8* getelementptr inbounds ([7 x i8]* @.str21, i32 0, i32 0), i8* getelementptr inbounds ([13 x i8]* @.str22, i32 0, i32 0), i32 72, i8* getelementptr inbounds ([50 x i8]* @__PRETTY_FUNCTION__._ZN6soplex11spx_reallocIPdEEvRT_i, i32 0, i32 0)) #10
  unreachable
                                                  ; No predecessors!
  br label %6

; <label>:6                                       ; preds = %5, %3
  %7 = icmp sge i32 %n, 0
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %6
  br label %11

; <label>:9                                       ; preds = %6
  call void @__assert_fail(i8* getelementptr inbounds ([7 x i8]* @.str17, i32 0, i32 0), i8* getelementptr inbounds ([13 x i8]* @.str22, i32 0, i32 0), i32 73, i8* getelementptr inbounds ([50 x i8]* @__PRETTY_FUNCTION__._ZN6soplex11spx_reallocIPdEEvRT_i, i32 0, i32 0)) #10
  unreachable
                                                  ; No predecessors!
  br label %11

; <label>:11                                      ; preds = %10, %8
  %12 = load double** %p, align 8
  %13 = bitcast double* %12 to i8*
  %14 = sext i32 %n to i64
  %15 = mul i64 8, %14
  %16 = call i8* @realloc(i8* %13, i64 %15) #1
  %17 = bitcast i8* %16 to double*
  store double* %17, double** %p, align 8
  %18 = load double** %p, align 8
  %19 = icmp eq double* null, %18
  br i1 %19, label %20, label %23

; <label>:20                                      ; preds = %11
  %21 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cerr, i8* getelementptr inbounds ([23 x i8]* @.str23, i32 0, i32 0))
  %22 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* %21, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
  call void @abort() #10
  unreachable

; <label>:23                                      ; preds = %11
  ret void
}

; Function Attrs: nounwind
declare i8* @realloc(i8*, i64) #8

; Function Attrs: noreturn nounwind
declare void @abort() #4

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #8

; Function Attrs: nounwind
declare void @free(i8*) #8

; Function Attrs: nobuiltin nounwind
declare void @_ZdlPv(i8*) #9

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN6soplex9DataArrayIdED2Ev(%"class.soplex::DataArray.3"* %this) unnamed_addr #2 align 2 {
  %1 = getelementptr inbounds %"class.soplex::DataArray.3"* %this, i32 0, i32 2
  call void @_ZN6soplex8spx_freeIPdEEvRT_(double** dereferenceable(8) %1)
  ret void
}

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN6soplex9SPxPricer4loadEPNS_6SoPlexE(%"class.soplex::SPxPricer"* %this, %"class.soplex::SoPlex"* %p_solver) unnamed_addr #2 align 2 {
  %1 = getelementptr inbounds %"class.soplex::SPxPricer"* %this, i32 0, i32 2
  store %"class.soplex::SoPlex"* %p_solver, %"class.soplex::SoPlex"** %1, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN6soplex9SPxPricer5clearEv(%"class.soplex::SPxPricer"* %this) unnamed_addr #2 align 2 {
  %1 = getelementptr inbounds %"class.soplex::SPxPricer"* %this, i32 0, i32 2
  store %"class.soplex::SoPlex"* null, %"class.soplex::SoPlex"** %1, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN6soplex9SPxPricer7setTypeENS_6SoPlex4TypeE(%"class.soplex::SPxPricer"* %this, i32) unnamed_addr #2 align 2 {
  ret void
}

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN6soplex9SPxPricer6setRepENS_6SoPlex14RepresentationE(%"class.soplex::SPxPricer"* %this, i32) unnamed_addr #2 align 2 {
  ret void
}

declare void @__cxa_pure_virtual()

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN6soplex9SPxPricer5left4EiNS_5SPxIdE(%"class.soplex::SPxPricer"* %this, i32, %"class.soplex::SPxId"*) unnamed_addr #2 align 2 {
  ret void
}

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN6soplex9SPxPricer8entered4ENS_5SPxIdEi(%"class.soplex::SPxPricer"* %this, %"class.soplex::SPxId"*, i32) unnamed_addr #2 align 2 {
  ret void
}

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN6soplex9SPxPricer9addedVecsEi(%"class.soplex::SPxPricer"* %this, i32) unnamed_addr #2 align 2 {
  ret void
}

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN6soplex9SPxPricer11addedCoVecsEi(%"class.soplex::SPxPricer"* %this, i32) unnamed_addr #2 align 2 {
  ret void
}

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN6soplex9SPxPricer10removedVecEi(%"class.soplex::SPxPricer"* %this, i32) unnamed_addr #2 align 2 {
  ret void
}

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN6soplex9SPxPricer11removedVecsEPKi(%"class.soplex::SPxPricer"* %this, i32*) unnamed_addr #2 align 2 {
  ret void
}

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN6soplex9SPxPricer12removedCoVecEi(%"class.soplex::SPxPricer"* %this, i32) unnamed_addr #2 align 2 {
  ret void
}

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN6soplex9SPxPricer13removedCoVecsEPKi(%"class.soplex::SPxPricer"* %this, i32*) unnamed_addr #2 align 2 {
  ret void
}

; Function Attrs: nounwind uwtable
define linkonce_odr zeroext i1 @_ZNK6soplex9SPxPricer12isConsistentEv(%"class.soplex::SPxPricer"* %this) unnamed_addr #2 align 2 {
  %1 = getelementptr inbounds %"class.soplex::SPxPricer"* %this, i32 0, i32 2
  %2 = load %"class.soplex::SoPlex"** %1, align 8
  %3 = icmp ne %"class.soplex::SoPlex"* %2, null
  ret i1 %3
}

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN6soplex9SPxPricerD2Ev(%"class.soplex::SPxPricer"* %this) unnamed_addr #2 align 2 {
  %1 = bitcast %"class.soplex::SPxPricer"* %this to i32 (...)***
  store i32 (...)** bitcast (i8** getelementptr inbounds ([23 x i8*]* @_ZTVN6soplex9SPxPricerE, i64 0, i64 2) to i32 (...)**), i32 (...)*** %1
  %2 = getelementptr inbounds %"class.soplex::SPxPricer"* %this, i32 0, i32 1
  store i8* null, i8** %2, align 8
  %3 = getelementptr inbounds %"class.soplex::SPxPricer"* %this, i32 0, i32 2
  store %"class.soplex::SoPlex"* null, %"class.soplex::SoPlex"** %3, align 8
  ret void
}

; Function Attrs: uwtable
define linkonce_odr void @_ZN6soplex9SPxPricerD0Ev(%"class.soplex::SPxPricer"* %this) unnamed_addr #3 align 2 {
  invoke void @_ZN6soplex9SPxPricerD2Ev(%"class.soplex::SPxPricer"* %this)
          to label %1 unwind label %3

; <label>:1                                       ; preds = %0
  %2 = bitcast %"class.soplex::SPxPricer"* %this to i8*
  call void @_ZdlPv(i8* %2) #11
  ret void

; <label>:3                                       ; preds = %0
  %4 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
  %5 = extractvalue { i8*, i32 } %4, 0
  %6 = extractvalue { i8*, i32 } %4, 1
  %7 = bitcast %"class.soplex::SPxPricer"* %this to i8*
  call void @_ZdlPv(i8* %7) #11
  br label %8

; <label>:8                                       ; preds = %3
  %9 = insertvalue { i8*, i32 } undef, i8* %5, 0
  %10 = insertvalue { i8*, i32 } %9, i32 %6, 1
  resume { i8*, i32 } %10
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr void @_ZN6soplex8spx_freeIPiEEvRT_(i32** dereferenceable(8) %p) #5 {
  %1 = load i32** %p, align 8
  %2 = icmp ne i32* %1, null
  br i1 %2, label %3, label %4

; <label>:3                                       ; preds = %0
  br label %6

; <label>:4                                       ; preds = %0
  call void @__assert_fail(i8* getelementptr inbounds ([7 x i8]* @.str21, i32 0, i32 0), i8* getelementptr inbounds ([13 x i8]* @.str22, i32 0, i32 0), i32 88, i8* getelementptr inbounds ([39 x i8]* @__PRETTY_FUNCTION__._ZN6soplex8spx_freeIPiEEvRT_, i32 0, i32 0)) #10
  unreachable
                                                  ; No predecessors!
  br label %6

; <label>:6                                       ; preds = %5, %3
  %7 = load i32** %p, align 8
  %8 = bitcast i32* %7 to i8*
  call void @free(i8* %8) #1
  store i32* null, i32** %p, align 8
  ret void
}

declare void @_ZN6soplex7DVectorD2Ev(%"class.soplex::DVector"*) #0

declare void @_ZN6soplex7DVectorC2Ei(%"class.soplex::DVector"*, i32) #0

; Function Attrs: uwtable
define linkonce_odr void @_ZN6soplex6IdxSetC2Ev(%"class.soplex::IdxSet"* %this) unnamed_addr #3 align 2 {
  %1 = getelementptr inbounds %"class.soplex::IdxSet"* %this, i32 0, i32 0
  store i32 0, i32* %1, align 4
  %2 = getelementptr inbounds %"class.soplex::IdxSet"* %this, i32 0, i32 1
  store i32 0, i32* %2, align 4
  %3 = getelementptr inbounds %"class.soplex::IdxSet"* %this, i32 0, i32 2
  store i32* null, i32** %3, align 8
  %4 = call zeroext i1 @_ZNK6soplex6IdxSet12isConsistentEv(%"class.soplex::IdxSet"* %this)
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  br label %8

; <label>:6                                       ; preds = %0
  call void @__assert_fail(i8* getelementptr inbounds ([15 x i8]* @.str10, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8]* @.str30, i32 0, i32 0), i32 152, i8* getelementptr inbounds ([25 x i8]* @__PRETTY_FUNCTION__._ZN6soplex6IdxSetC2Ev, i32 0, i32 0)) #10
  unreachable
                                                  ; No predecessors!
  br label %8

; <label>:8                                       ; preds = %7, %5
  ret void
}

; Function Attrs: inlinehint uwtable
define linkonce_odr void @_ZN6soplex9spx_allocIPiEEvRT_i(i32** dereferenceable(8) %p, i32 %n) #7 {
  %1 = load i32** %p, align 8
  %2 = icmp eq i32* %1, null
  br i1 %2, label %3, label %4

; <label>:3                                       ; preds = %0
  br label %6

; <label>:4                                       ; preds = %0
  call void @__assert_fail(i8* getelementptr inbounds ([7 x i8]* @.str24, i32 0, i32 0), i8* getelementptr inbounds ([13 x i8]* @.str22, i32 0, i32 0), i32 50, i8* getelementptr inbounds ([45 x i8]* @__PRETTY_FUNCTION__._ZN6soplex9spx_allocIPiEEvRT_i, i32 0, i32 0)) #10
  unreachable
                                                  ; No predecessors!
  br label %6

; <label>:6                                       ; preds = %5, %3
  %7 = icmp sge i32 %n, 0
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %6
  br label %11

; <label>:9                                       ; preds = %6
  call void @__assert_fail(i8* getelementptr inbounds ([7 x i8]* @.str17, i32 0, i32 0), i8* getelementptr inbounds ([13 x i8]* @.str22, i32 0, i32 0), i32 51, i8* getelementptr inbounds ([45 x i8]* @__PRETTY_FUNCTION__._ZN6soplex9spx_allocIPiEEvRT_i, i32 0, i32 0)) #10
  unreachable
                                                  ; No predecessors!
  br label %11

; <label>:11                                      ; preds = %10, %8
  %12 = icmp eq i32 %n, 0
  br i1 %12, label %13, label %14

; <label>:13                                      ; preds = %11
  br label %14

; <label>:14                                      ; preds = %13, %11
  %.0 = phi i32 [ 1, %13 ], [ %n, %11 ]
  %15 = sext i32 %.0 to i64
  %16 = mul i64 4, %15
  %17 = call noalias i8* @malloc(i64 %16) #1
  %18 = bitcast i8* %17 to i32*
  store i32* %18, i32** %p, align 8
  %19 = load i32** %p, align 8
  %20 = icmp eq i32* null, %19
  br i1 %20, label %21, label %24

; <label>:21                                      ; preds = %14
  %22 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cerr, i8* getelementptr inbounds ([22 x i8]* @.str25, i32 0, i32 0))
  %23 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* %22, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
  call void @abort() #10
  unreachable

; <label>:24                                      ; preds = %14
  ret void
}

declare zeroext i1 @_ZNK6soplex6IdxSet12isConsistentEv(%"class.soplex::IdxSet"*) #0

; Function Attrs: nounwind uwtable
define linkonce_odr zeroext i1 @_ZNK6soplex5SPxId10isSPxRowIdEv(%"class.soplex::SPxId"* %this) #2 align 2 {
  %1 = bitcast %"class.soplex::SPxId"* %this to %"class.soplex::DataKey"*
  %2 = bitcast %"class.soplex::DataKey"* %1 to i32*
  %3 = load i32* %2, align 4
  %4 = shl i32 %3, 24
  %5 = ashr i32 %4, 24
  %6 = icmp slt i32 %5, 0
  ret i1 %6
}

; Function Attrs: uwtable
define linkonce_odr dereferenceable(8) %"class.soplex::SVector"* @_ZNK6soplex6SoPlex6vectorERKNS_8SPxRowIdE(%"class.soplex::SoPlex"* %this, %"class.soplex::SPxRowId"* dereferenceable(4) %rid) #3 align 2 {
  %1 = bitcast %"class.soplex::SPxRowId"* %rid to %"class.soplex::DataKey"*
  %2 = call i32 @_ZNK6soplex7DataKey7isValidEv(%"class.soplex::DataKey"* %1)
  %3 = icmp ne i32 %2, 0
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  br label %7

; <label>:5                                       ; preds = %0
  call void @__assert_fail(i8* getelementptr inbounds ([14 x i8]* @.str39, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8]* @.str32, i32 0, i32 0), i32 732, i8* getelementptr inbounds ([78 x i8]* @__PRETTY_FUNCTION__._ZNK6soplex6SoPlex6vectorERKNS_8SPxRowIdE, i32 0, i32 0)) #10
  unreachable
                                                  ; No predecessors!
  br label %7

; <label>:7                                       ; preds = %6, %4
  %8 = call i32 @_ZNK6soplex6SoPlex3repEv(%"class.soplex::SoPlex"* %this)
  %9 = icmp eq i32 %8, -1
  br i1 %9, label %10, label %16

; <label>:10                                      ; preds = %7
  %11 = getelementptr inbounds %"class.soplex::SoPlex"* %this, i32 0, i32 22
  %12 = load %"class.soplex::SVSet"** %11, align 8
  %13 = bitcast %"class.soplex::SoPlex"* %this to %"class.soplex::SPxLP"*
  %14 = call i32 @_ZNK6soplex5SPxLP6numberERKNS_8SPxRowIdE(%"class.soplex::SPxLP"* %13, %"class.soplex::SPxRowId"* dereferenceable(4) %rid)
  %15 = call dereferenceable(8) %"class.soplex::SVector"* @_ZNK6soplex5SVSetixEi(%"class.soplex::SVSet"* %12, i32 %14)
  br label %22

; <label>:16                                      ; preds = %7
  %17 = getelementptr inbounds %"class.soplex::SoPlex"* %this, i32 0, i32 21
  %18 = bitcast %"class.soplex::SoPlex"* %this to %"class.soplex::SPxLP"*
  %19 = call i32 @_ZNK6soplex5SPxLP6numberERKNS_8SPxRowIdE(%"class.soplex::SPxLP"* %18, %"class.soplex::SPxRowId"* dereferenceable(4) %rid)
  %20 = call dereferenceable(40) %"class.soplex::UnitVector"* @_ZNK6soplex5ArrayINS_10UnitVectorEEixEi(%"class.soplex::Array"* %17, i32 %19)
  %21 = bitcast %"class.soplex::UnitVector"* %20 to %"class.soplex::SVector"*
  br label %22

; <label>:22                                      ; preds = %16, %10
  %23 = phi %"class.soplex::SVector"* [ %15, %10 ], [ %21, %16 ]
  ret %"class.soplex::SVector"* %23
}

declare void @_ZN6soplex8SPxRowIdC1ERKNS_5SPxIdE(%"class.soplex::SPxRowId"*, %"class.soplex::SPxId"* dereferenceable(4)) #0

; Function Attrs: uwtable
define linkonce_odr dereferenceable(8) %"class.soplex::SVector"* @_ZNK6soplex6SoPlex6vectorERKNS_8SPxColIdE(%"class.soplex::SoPlex"* %this, %"class.soplex::SPxColId"* dereferenceable(4) %cid) #3 align 2 {
  %1 = bitcast %"class.soplex::SPxColId"* %cid to %"class.soplex::DataKey"*
  %2 = call i32 @_ZNK6soplex7DataKey7isValidEv(%"class.soplex::DataKey"* %1)
  %3 = icmp ne i32 %2, 0
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  br label %7

; <label>:5                                       ; preds = %0
  call void @__assert_fail(i8* getelementptr inbounds ([14 x i8]* @.str34, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8]* @.str32, i32 0, i32 0), i32 740, i8* getelementptr inbounds ([78 x i8]* @__PRETTY_FUNCTION__._ZNK6soplex6SoPlex6vectorERKNS_8SPxColIdE, i32 0, i32 0)) #10
  unreachable
                                                  ; No predecessors!
  br label %7

; <label>:7                                       ; preds = %6, %4
  %8 = call i32 @_ZNK6soplex6SoPlex3repEv(%"class.soplex::SoPlex"* %this)
  %9 = icmp eq i32 %8, 1
  br i1 %9, label %10, label %16

; <label>:10                                      ; preds = %7
  %11 = getelementptr inbounds %"class.soplex::SoPlex"* %this, i32 0, i32 22
  %12 = load %"class.soplex::SVSet"** %11, align 8
  %13 = bitcast %"class.soplex::SoPlex"* %this to %"class.soplex::SPxLP"*
  %14 = call i32 @_ZNK6soplex5SPxLP6numberERKNS_8SPxColIdE(%"class.soplex::SPxLP"* %13, %"class.soplex::SPxColId"* dereferenceable(4) %cid)
  %15 = call dereferenceable(8) %"class.soplex::SVector"* @_ZNK6soplex5SVSetixEi(%"class.soplex::SVSet"* %12, i32 %14)
  br label %22

; <label>:16                                      ; preds = %7
  %17 = getelementptr inbounds %"class.soplex::SoPlex"* %this, i32 0, i32 21
  %18 = bitcast %"class.soplex::SoPlex"* %this to %"class.soplex::SPxLP"*
  %19 = call i32 @_ZNK6soplex5SPxLP6numberERKNS_8SPxColIdE(%"class.soplex::SPxLP"* %18, %"class.soplex::SPxColId"* dereferenceable(4) %cid)
  %20 = call dereferenceable(40) %"class.soplex::UnitVector"* @_ZNK6soplex5ArrayINS_10UnitVectorEEixEi(%"class.soplex::Array"* %17, i32 %19)
  %21 = bitcast %"class.soplex::UnitVector"* %20 to %"class.soplex::SVector"*
  br label %22

; <label>:22                                      ; preds = %16, %10
  %23 = phi %"class.soplex::SVector"* [ %15, %10 ], [ %21, %16 ]
  ret %"class.soplex::SVector"* %23
}

declare void @_ZN6soplex8SPxColIdC1ERKNS_5SPxIdE(%"class.soplex::SPxColId"*, %"class.soplex::SPxId"* dereferenceable(4)) #0

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr i32 @_ZNK6soplex7DataKey7isValidEv(%"class.soplex::DataKey"* %this) #5 align 2 {
  %1 = bitcast %"class.soplex::DataKey"* %this to i32*
  %2 = load i32* %1, align 4
  %3 = ashr i32 %2, 8
  %4 = icmp sge i32 %3, 0
  %5 = zext i1 %4 to i32
  ret i32 %5
}

; Function Attrs: uwtable
define linkonce_odr dereferenceable(8) %"class.soplex::SVector"* @_ZNK6soplex5SVSetixEi(%"class.soplex::SVSet"* %this, i32 %n) #3 align 2 {
  %1 = getelementptr inbounds %"class.soplex::SVSet"* %this, i32 0, i32 1
  %2 = call dereferenceable(24) %"class.soplex::SVSet::DLPSV"* @_ZNK6soplex7DataSetINS_5SVSet5DLPSVEEixEi(%"class.soplex::DataSet"* %1, i32 %n)
  %3 = bitcast %"class.soplex::SVSet::DLPSV"* %2 to %"class.soplex::SVector"*
  ret %"class.soplex::SVector"* %3
}

; Function Attrs: uwtable
define linkonce_odr i32 @_ZNK6soplex5SPxLP6numberERKNS_8SPxColIdE(%"class.soplex::SPxLP"* %this, %"class.soplex::SPxColId"* dereferenceable(4) %id) #3 align 2 {
  %1 = bitcast %"class.soplex::SPxLP"* %this to i8*
  %2 = getelementptr inbounds i8* %1, i64 160
  %3 = bitcast i8* %2 to %"class.soplex::LPColSet"*
  %4 = bitcast %"class.soplex::SPxColId"* %id to %"class.soplex::DataKey"*
  %5 = call i32 @_ZNK6soplex8LPColSet6numberERKNS_7DataKeyE(%"class.soplex::LPColSet"* %3, %"class.soplex::DataKey"* dereferenceable(4) %4)
  ret i32 %5
}

; Function Attrs: uwtable
define linkonce_odr dereferenceable(40) %"class.soplex::UnitVector"* @_ZNK6soplex5ArrayINS_10UnitVectorEEixEi(%"class.soplex::Array"* %this, i32 %n) #3 align 2 {
  %1 = icmp sge i32 %n, 0
  br i1 %1, label %2, label %6

; <label>:2                                       ; preds = %0
  %3 = call i32 @_ZNK6soplex5ArrayINS_10UnitVectorEE4sizeEv(%"class.soplex::Array"* %this)
  %4 = icmp slt i32 %n, %3
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %2
  br label %8

; <label>:6                                       ; preds = %2, %0
  call void @__assert_fail(i8* getelementptr inbounds ([21 x i8]* @.str35, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8]* @.str36, i32 0, i32 0), i32 81, i8* getelementptr inbounds ([91 x i8]* @__PRETTY_FUNCTION__._ZNK6soplex5ArrayINS_10UnitVectorEEixEi, i32 0, i32 0)) #10
  unreachable
                                                  ; No predecessors!
  br label %8

; <label>:8                                       ; preds = %7, %5
  %9 = sext i32 %n to i64
  %10 = getelementptr inbounds %"class.soplex::Array"* %this, i32 0, i32 1
  %11 = load %"class.soplex::UnitVector"** %10, align 8
  %12 = getelementptr inbounds %"class.soplex::UnitVector"* %11, i64 %9
  ret %"class.soplex::UnitVector"* %12
}

; Function Attrs: nounwind uwtable
define linkonce_odr i32 @_ZNK6soplex5ArrayINS_10UnitVectorEE4sizeEv(%"class.soplex::Array"* %this) #2 align 2 {
  %1 = getelementptr inbounds %"class.soplex::Array"* %this, i32 0, i32 0
  %2 = load i32* %1, align 4
  ret i32 %2
}

; Function Attrs: uwtable
define linkonce_odr i32 @_ZNK6soplex8LPColSet6numberERKNS_7DataKeyE(%"class.soplex::LPColSet"* %this, %"class.soplex::DataKey"* dereferenceable(4) %k) #3 align 2 {
  %1 = bitcast %"class.soplex::LPColSet"* %this to %"class.soplex::SVSet"*
  %2 = call i32 @_ZNK6soplex5SVSet6numberERKNS_7DataKeyE(%"class.soplex::SVSet"* %1, %"class.soplex::DataKey"* dereferenceable(4) %k)
  ret i32 %2
}

; Function Attrs: uwtable
define linkonce_odr i32 @_ZNK6soplex5SVSet6numberERKNS_7DataKeyE(%"class.soplex::SVSet"* %this, %"class.soplex::DataKey"* dereferenceable(4) %k) #3 align 2 {
  %1 = getelementptr inbounds %"class.soplex::SVSet"* %this, i32 0, i32 1
  %2 = call i32 @_ZNK6soplex7DataSetINS_5SVSet5DLPSVEE6numberERKNS_7DataKeyE(%"class.soplex::DataSet"* %1, %"class.soplex::DataKey"* dereferenceable(4) %k)
  ret i32 %2
}

; Function Attrs: uwtable
define linkonce_odr i32 @_ZNK6soplex7DataSetINS_5SVSet5DLPSVEE6numberERKNS_7DataKeyE(%"class.soplex::DataSet"* %this, %"class.soplex::DataKey"* dereferenceable(4) %k) #3 align 2 {
  %1 = bitcast %"class.soplex::DataKey"* %k to i32*
  %2 = load i32* %1, align 4
  %3 = ashr i32 %2, 8
  %4 = icmp slt i32 %3, 0
  br i1 %4, label %11, label %5

; <label>:5                                       ; preds = %0
  %6 = bitcast %"class.soplex::DataKey"* %k to i32*
  %7 = load i32* %6, align 4
  %8 = ashr i32 %7, 8
  %9 = call i32 @_ZNK6soplex7DataSetINS_5SVSet5DLPSVEE4sizeEv(%"class.soplex::DataSet"* %this)
  %10 = icmp sge i32 %8, %9
  br i1 %10, label %11, label %12

; <label>:11                                      ; preds = %5, %0
  br label %22

; <label>:12                                      ; preds = %5
  %13 = bitcast %"class.soplex::DataKey"* %k to i32*
  %14 = load i32* %13, align 4
  %15 = ashr i32 %14, 8
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds %"class.soplex::DataSet"* %this, i32 0, i32 0
  %18 = load %"struct.soplex::DataSet<soplex::SVSet::DLPSV>::Item"** %17, align 8
  %19 = getelementptr inbounds %"struct.soplex::DataSet<soplex::SVSet::DLPSV>::Item"* %18, i64 %16
  %20 = getelementptr inbounds %"struct.soplex::DataSet<soplex::SVSet::DLPSV>::Item"* %19, i32 0, i32 1
  %21 = load i32* %20, align 4
  br label %22

; <label>:22                                      ; preds = %12, %11
  %23 = phi i32 [ -1, %11 ], [ %21, %12 ]
  ret i32 %23
}

; Function Attrs: nounwind uwtable
define linkonce_odr i32 @_ZNK6soplex7DataSetINS_5SVSet5DLPSVEE4sizeEv(%"class.soplex::DataSet"* %this) #2 align 2 {
  %1 = getelementptr inbounds %"class.soplex::DataSet"* %this, i32 0, i32 3
  %2 = load i32* %1, align 4
  ret i32 %2
}

; Function Attrs: nounwind uwtable
define linkonce_odr dereferenceable(24) %"class.soplex::SVSet::DLPSV"* @_ZNK6soplex7DataSetINS_5SVSet5DLPSVEEixEi(%"class.soplex::DataSet"* %this, i32 %n) #2 align 2 {
  %1 = getelementptr inbounds %"class.soplex::DataSet"* %this, i32 0, i32 4
  %2 = load i32* %1, align 4
  %3 = icmp slt i32 %n, %2
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  br label %7

; <label>:5                                       ; preds = %0
  call void @__assert_fail(i8* getelementptr inbounds ([11 x i8]* @.str37, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8]* @.str38, i32 0, i32 0), i32 345, i8* getelementptr inbounds ([103 x i8]* @__PRETTY_FUNCTION__._ZNK6soplex7DataSetINS_5SVSet5DLPSVEEixEi, i32 0, i32 0)) #10
  unreachable
                                                  ; No predecessors!
  br label %7

; <label>:7                                       ; preds = %6, %4
  %8 = sext i32 %n to i64
  %9 = getelementptr inbounds %"class.soplex::DataSet"* %this, i32 0, i32 1
  %10 = load %"class.soplex::DataKey"** %9, align 8
  %11 = getelementptr inbounds %"class.soplex::DataKey"* %10, i64 %8
  %12 = bitcast %"class.soplex::DataKey"* %11 to i32*
  %13 = load i32* %12, align 4
  %14 = ashr i32 %13, 8
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds %"class.soplex::DataSet"* %this, i32 0, i32 0
  %17 = load %"struct.soplex::DataSet<soplex::SVSet::DLPSV>::Item"** %16, align 8
  %18 = getelementptr inbounds %"struct.soplex::DataSet<soplex::SVSet::DLPSV>::Item"* %17, i64 %15
  %19 = getelementptr inbounds %"struct.soplex::DataSet<soplex::SVSet::DLPSV>::Item"* %18, i32 0, i32 0
  ret %"class.soplex::SVSet::DLPSV"* %19
}

; Function Attrs: uwtable
define linkonce_odr i32 @_ZNK6soplex5SPxLP6numberERKNS_8SPxRowIdE(%"class.soplex::SPxLP"* %this, %"class.soplex::SPxRowId"* dereferenceable(4) %id) #3 align 2 {
  %1 = bitcast %"class.soplex::SPxLP"* %this to i8*
  %2 = getelementptr inbounds i8* %1, i64 8
  %3 = bitcast i8* %2 to %"class.soplex::LPRowSet"*
  %4 = bitcast %"class.soplex::SPxRowId"* %id to %"class.soplex::DataKey"*
  %5 = call i32 @_ZNK6soplex8LPRowSet6numberERKNS_7DataKeyE(%"class.soplex::LPRowSet"* %3, %"class.soplex::DataKey"* dereferenceable(4) %4)
  ret i32 %5
}

; Function Attrs: uwtable
define linkonce_odr i32 @_ZNK6soplex8LPRowSet6numberERKNS_7DataKeyE(%"class.soplex::LPRowSet"* %this, %"class.soplex::DataKey"* dereferenceable(4) %k) #3 align 2 {
  %1 = bitcast %"class.soplex::LPRowSet"* %this to %"class.soplex::SVSet"*
  %2 = call i32 @_ZNK6soplex5SVSet6numberERKNS_7DataKeyE(%"class.soplex::SVSet"* %1, %"class.soplex::DataKey"* dereferenceable(4) %k)
  ret i32 %2
}

; Function Attrs: uwtable
define linkonce_odr void @_ZNK6soplex5SPxLP3cIdEi(%"class.soplex::SPxColId"* noalias sret %agg.result, %"class.soplex::SPxLP"* %this, i32 %n) #3 align 2 {
  %1 = alloca %"class.soplex::DataKey", align 4
  %2 = bitcast %"class.soplex::SPxLP"* %this to i8*
  %3 = getelementptr inbounds i8* %2, i64 160
  %4 = bitcast i8* %3 to %"class.soplex::LPColSet"*
  call void @_ZNK6soplex8LPColSet3keyEi(%"class.soplex::DataKey"* sret %1, %"class.soplex::LPColSet"* %4, i32 %n)
  call void @_ZN6soplex8SPxColIdC1ERKNS_7DataKeyE(%"class.soplex::SPxColId"* %agg.result, %"class.soplex::DataKey"* dereferenceable(4) %1)
  ret void
}

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN6soplex5SPxIdC2ERKNS_8SPxColIdE(%"class.soplex::SPxId"* %this, %"class.soplex::SPxColId"* dereferenceable(4) %cid) unnamed_addr #2 align 2 {
  %1 = bitcast %"class.soplex::SPxId"* %this to %"class.soplex::DataKey"*
  %2 = bitcast %"class.soplex::SPxColId"* %cid to %"class.soplex::DataKey"*
  %3 = bitcast %"class.soplex::DataKey"* %2 to i32*
  %4 = load i32* %3, align 4
  %5 = ashr i32 %4, 8
  call void @_ZN6soplex7DataKeyC2Eii(%"class.soplex::DataKey"* %1, i32 1, i32 %5)
  ret void
}

; Function Attrs: uwtable
define linkonce_odr void @_ZNK6soplex5SPxLP3rIdEi(%"class.soplex::SPxRowId"* noalias sret %agg.result, %"class.soplex::SPxLP"* %this, i32 %n) #3 align 2 {
  %1 = alloca %"class.soplex::DataKey", align 4
  %2 = bitcast %"class.soplex::SPxLP"* %this to i8*
  %3 = getelementptr inbounds i8* %2, i64 8
  %4 = bitcast i8* %3 to %"class.soplex::LPRowSet"*
  call void @_ZNK6soplex8LPRowSet3keyEi(%"class.soplex::DataKey"* sret %1, %"class.soplex::LPRowSet"* %4, i32 %n)
  call void @_ZN6soplex8SPxRowIdC1ERKNS_7DataKeyE(%"class.soplex::SPxRowId"* %agg.result, %"class.soplex::DataKey"* dereferenceable(4) %1)
  ret void
}

; Function Attrs: uwtable
define linkonce_odr void @_ZN6soplex5SPxIdC2ERKNS_8SPxRowIdE(%"class.soplex::SPxId"* %this, %"class.soplex::SPxRowId"* dereferenceable(4) %rid) unnamed_addr #3 align 2 {
  %1 = bitcast %"class.soplex::SPxId"* %this to %"class.soplex::DataKey"*
  %2 = bitcast %"class.soplex::SPxRowId"* %rid to %"class.soplex::DataKey"*
  %3 = bitcast %"class.soplex::DataKey"* %2 to i32*
  %4 = load i32* %3, align 4
  %5 = ashr i32 %4, 8
  call void @_ZN6soplex7DataKeyC2Eii(%"class.soplex::DataKey"* %1, i32 -1, i32 %5)
  ret void
}

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN6soplex7DataKeyC2Eii(%"class.soplex::DataKey"* %this, i32 %p_info, i32 %p_idx) unnamed_addr #2 align 2 {
  %1 = bitcast %"class.soplex::DataKey"* %this to i32*
  %2 = load i32* %1, align 4
  %3 = and i32 %p_info, 255
  %4 = and i32 %2, -256
  %5 = or i32 %4, %3
  store i32 %5, i32* %1, align 4
  %6 = bitcast %"class.soplex::DataKey"* %this to i32*
  %7 = load i32* %6, align 4
  %8 = and i32 %p_idx, 16777215
  %9 = shl i32 %8, 8
  %10 = and i32 %7, 255
  %11 = or i32 %10, %9
  store i32 %11, i32* %6, align 4
  ret void
}

; Function Attrs: uwtable
define linkonce_odr void @_ZNK6soplex8LPRowSet3keyEi(%"class.soplex::DataKey"* noalias sret %agg.result, %"class.soplex::LPRowSet"* %this, i32 %i) #3 align 2 {
  %1 = bitcast %"class.soplex::LPRowSet"* %this to %"class.soplex::SVSet"*
  call void @_ZNK6soplex5SVSet3keyEi(%"class.soplex::DataKey"* sret %agg.result, %"class.soplex::SVSet"* %1, i32 %i)
  ret void
}

declare void @_ZN6soplex8SPxRowIdC1ERKNS_7DataKeyE(%"class.soplex::SPxRowId"*, %"class.soplex::DataKey"* dereferenceable(4)) #0

; Function Attrs: uwtable
define linkonce_odr void @_ZNK6soplex5SVSet3keyEi(%"class.soplex::DataKey"* noalias sret %agg.result, %"class.soplex::SVSet"* %this, i32 %n) #3 align 2 {
  %1 = getelementptr inbounds %"class.soplex::SVSet"* %this, i32 0, i32 1
  call void @_ZNK6soplex7DataSetINS_5SVSet5DLPSVEE3keyEi(%"class.soplex::DataKey"* sret %agg.result, %"class.soplex::DataSet"* %1, i32 %n)
  ret void
}

; Function Attrs: uwtable
define linkonce_odr void @_ZNK6soplex7DataSetINS_5SVSet5DLPSVEE3keyEi(%"class.soplex::DataKey"* noalias sret %agg.result, %"class.soplex::DataSet"* %this, i32 %n) #3 align 2 {
  %1 = icmp sge i32 %n, 0
  br i1 %1, label %2, label %6

; <label>:2                                       ; preds = %0
  %3 = call i32 @_ZNK6soplex7DataSetINS_5SVSet5DLPSVEE3numEv(%"class.soplex::DataSet"* %this)
  %4 = icmp slt i32 %n, %3
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %2
  br label %8

; <label>:6                                       ; preds = %2, %0
  call void @__assert_fail(i8* getelementptr inbounds ([20 x i8]* @.str40, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8]* @.str38, i32 0, i32 0), i32 386, i8* getelementptr inbounds ([100 x i8]* @__PRETTY_FUNCTION__._ZNK6soplex7DataSetINS_5SVSet5DLPSVEE3keyEi, i32 0, i32 0)) #10
  unreachable
                                                  ; No predecessors!
  br label %8

; <label>:8                                       ; preds = %7, %5
  %9 = sext i32 %n to i64
  %10 = getelementptr inbounds %"class.soplex::DataSet"* %this, i32 0, i32 1
  %11 = load %"class.soplex::DataKey"** %10, align 8
  %12 = getelementptr inbounds %"class.soplex::DataKey"* %11, i64 %9
  call void @_ZN6soplex7DataKeyC2ERKS0_(%"class.soplex::DataKey"* %agg.result, %"class.soplex::DataKey"* dereferenceable(4) %12)
  ret void
}

; Function Attrs: nounwind uwtable
define linkonce_odr i32 @_ZNK6soplex7DataSetINS_5SVSet5DLPSVEE3numEv(%"class.soplex::DataSet"* %this) #2 align 2 {
  %1 = getelementptr inbounds %"class.soplex::DataSet"* %this, i32 0, i32 4
  %2 = load i32* %1, align 4
  ret i32 %2
}

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN6soplex7DataKeyC2ERKS0_(%"class.soplex::DataKey"* %this, %"class.soplex::DataKey"* dereferenceable(4) %old) unnamed_addr #2 align 2 {
  %1 = bitcast %"class.soplex::DataKey"* %this to i32*
  %2 = bitcast %"class.soplex::DataKey"* %old to i32*
  %3 = load i32* %2, align 4
  %4 = shl i32 %3, 24
  %5 = ashr i32 %4, 24
  %6 = load i32* %1, align 4
  %7 = and i32 %5, 255
  %8 = and i32 %6, -256
  %9 = or i32 %8, %7
  store i32 %9, i32* %1, align 4
  %10 = bitcast %"class.soplex::DataKey"* %this to i32*
  %11 = bitcast %"class.soplex::DataKey"* %old to i32*
  %12 = load i32* %11, align 4
  %13 = ashr i32 %12, 8
  %14 = load i32* %10, align 4
  %15 = and i32 %13, 16777215
  %16 = shl i32 %15, 8
  %17 = and i32 %14, 255
  %18 = or i32 %17, %16
  store i32 %18, i32* %10, align 4
  ret void
}

; Function Attrs: uwtable
define linkonce_odr void @_ZNK6soplex8LPColSet3keyEi(%"class.soplex::DataKey"* noalias sret %agg.result, %"class.soplex::LPColSet"* %this, i32 %i) #3 align 2 {
  %1 = bitcast %"class.soplex::LPColSet"* %this to %"class.soplex::SVSet"*
  call void @_ZNK6soplex5SVSet3keyEi(%"class.soplex::DataKey"* sret %agg.result, %"class.soplex::SVSet"* %1, i32 %i)
  ret void
}

declare void @_ZN6soplex8SPxColIdC1ERKNS_7DataKeyE(%"class.soplex::SPxColId"*, %"class.soplex::DataKey"* dereferenceable(4)) #0

; Function Attrs: nounwind uwtable
define linkonce_odr dereferenceable(4) %"class.soplex::DataKey"* @_ZN6soplex7DataKeyaSERKS0_(%"class.soplex::DataKey"* %this, %"class.soplex::DataKey"* dereferenceable(4) %rhs) #2 align 2 {
  %1 = bitcast %"class.soplex::DataKey"* %rhs to i32*
  %2 = load i32* %1, align 4
  %3 = shl i32 %2, 24
  %4 = ashr i32 %3, 24
  %5 = bitcast %"class.soplex::DataKey"* %this to i32*
  %6 = load i32* %5, align 4
  %7 = and i32 %4, 255
  %8 = and i32 %6, -256
  %9 = or i32 %8, %7
  store i32 %9, i32* %5, align 4
  %10 = bitcast %"class.soplex::DataKey"* %rhs to i32*
  %11 = load i32* %10, align 4
  %12 = ashr i32 %11, 8
  %13 = bitcast %"class.soplex::DataKey"* %this to i32*
  %14 = load i32* %13, align 4
  %15 = and i32 %12, 16777215
  %16 = shl i32 %15, 8
  %17 = and i32 %14, 255
  %18 = or i32 %17, %16
  store i32 %18, i32* %13, align 4
  ret %"class.soplex::DataKey"* %this
}

; Function Attrs: nounwind uwtable
define linkonce_odr dereferenceable(16) %"class.soplex::IdxSet"* @_ZNK6soplex8SSVector7indicesEv(%"class.soplex::SSVector"* %this) #2 align 2 {
  %1 = bitcast %"class.soplex::SSVector"* %this to i8*
  %2 = getelementptr inbounds i8* %1, i64 32
  %3 = bitcast i8* %2 to %"class.soplex::IdxSet"*
  ret %"class.soplex::IdxSet"* %3
}

declare dereferenceable(16) %"class.soplex::Vector"* @_ZN6soplex6VectoraSERKS0_(%"class.soplex::Vector"*, %"class.soplex::Vector"* dereferenceable(16)) #0

; Function Attrs: uwtable
define linkonce_odr i32 @_ZNK6soplex8LPColSet3numEv(%"class.soplex::LPColSet"* %this) #3 align 2 {
  %1 = bitcast %"class.soplex::LPColSet"* %this to %"class.soplex::SVSet"*
  %2 = call i32 @_ZNK6soplex5SVSet3numEv(%"class.soplex::SVSet"* %1)
  ret i32 %2
}

; Function Attrs: nounwind uwtable
define linkonce_odr i32 @_ZNK6soplex5SVSet3numEv(%"class.soplex::SVSet"* %this) #2 align 2 {
  %1 = getelementptr inbounds %"class.soplex::SVSet"* %this, i32 0, i32 1
  %2 = call i32 @_ZNK6soplex7DataSetINS_5SVSet5DLPSVEE3numEv(%"class.soplex::DataSet"* %1)
  ret i32 %2
}

; Function Attrs: nounwind uwtable
define linkonce_odr i32 @_ZNK6soplex8LPRowSet3numEv(%"class.soplex::LPRowSet"* %this) #2 align 2 {
  %1 = bitcast %"class.soplex::LPRowSet"* %this to %"class.soplex::SVSet"*
  %2 = call i32 @_ZNK6soplex5SVSet3numEv(%"class.soplex::SVSet"* %1)
  ret i32 %2
}

; Function Attrs: nounwind uwtable
define linkonce_odr dereferenceable(8) %"class.soplex::SVector"** @_ZNK6soplex9DataArrayIPKNS_7SVectorEEixEi(%"class.soplex::DataArray.1"* %this, i32 %n) #2 align 2 {
  %1 = icmp sge i32 %n, 0
  br i1 %1, label %2, label %3

; <label>:2                                       ; preds = %0
  br label %5

; <label>:3                                       ; preds = %0
  call void @__assert_fail(i8* getelementptr inbounds ([7 x i8]* @.str17, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8]* @.str18, i32 0, i32 0), i32 96, i8* getelementptr inbounds ([105 x i8]* @__PRETTY_FUNCTION__._ZNK6soplex9DataArrayIPKNS_7SVectorEEixEi, i32 0, i32 0)) #10
  unreachable
                                                  ; No predecessors!
  br label %5

; <label>:5                                       ; preds = %4, %2
  %6 = getelementptr inbounds %"class.soplex::DataArray.1"* %this, i32 0, i32 0
  %7 = load i32* %6, align 4
  %8 = icmp slt i32 %n, %7
  br i1 %8, label %9, label %10

; <label>:9                                       ; preds = %5
  br label %12

; <label>:10                                      ; preds = %5
  call void @__assert_fail(i8* getelementptr inbounds ([12 x i8]* @.str19, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8]* @.str18, i32 0, i32 0), i32 97, i8* getelementptr inbounds ([105 x i8]* @__PRETTY_FUNCTION__._ZNK6soplex9DataArrayIPKNS_7SVectorEEixEi, i32 0, i32 0)) #10
  unreachable
                                                  ; No predecessors!
  br label %12

; <label>:12                                      ; preds = %11, %9
  %13 = sext i32 %n to i64
  %14 = getelementptr inbounds %"class.soplex::DataArray.1"* %this, i32 0, i32 2
  %15 = load %"class.soplex::SVector"*** %14, align 8
  %16 = getelementptr inbounds %"class.soplex::SVector"** %15, i64 %13
  ret %"class.soplex::SVector"** %16
}

; Function Attrs: nounwind uwtable
define linkonce_odr i32 @_ZNK6soplex5SPxId4typeEv(%"class.soplex::SPxId"* %this) #2 align 2 {
  %1 = bitcast %"class.soplex::SPxId"* %this to %"class.soplex::DataKey"*
  %2 = bitcast %"class.soplex::DataKey"* %1 to i32*
  %3 = load i32* %2, align 4
  %4 = shl i32 %3, 24
  %5 = ashr i32 %4, 24
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %7, label %15

; <label>:7                                       ; preds = %0
  %8 = bitcast %"class.soplex::SPxId"* %this to %"class.soplex::DataKey"*
  %9 = bitcast %"class.soplex::DataKey"* %8 to i32*
  %10 = load i32* %9, align 4
  %11 = shl i32 %10, 24
  %12 = ashr i32 %11, 24
  %13 = icmp slt i32 %12, 0
  %14 = select i1 %13, i32 -1, i32 1
  br label %16

; <label>:15                                      ; preds = %0
  br label %16

; <label>:16                                      ; preds = %15, %7
  %17 = phi i32 [ %14, %7 ], [ 0, %15 ]
  ret i32 %17
}

; Function Attrs: nounwind uwtable
define linkonce_odr dereferenceable(4) %"class.soplex::SPxId"* @_ZN6soplex9DataArrayINS_5SPxIdEEixEi(%"class.soplex::DataArray.0"* %this, i32 %n) #2 align 2 {
  %1 = icmp sge i32 %n, 0
  br i1 %1, label %2, label %3

; <label>:2                                       ; preds = %0
  br label %5

; <label>:3                                       ; preds = %0
  call void @__assert_fail(i8* getelementptr inbounds ([7 x i8]* @.str17, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8]* @.str18, i32 0, i32 0), i32 89, i8* getelementptr inbounds ([73 x i8]* @__PRETTY_FUNCTION__._ZN6soplex9DataArrayINS_5SPxIdEEixEi, i32 0, i32 0)) #10
  unreachable
                                                  ; No predecessors!
  br label %5

; <label>:5                                       ; preds = %4, %2
  %6 = getelementptr inbounds %"class.soplex::DataArray.0"* %this, i32 0, i32 0
  %7 = load i32* %6, align 4
  %8 = icmp slt i32 %n, %7
  br i1 %8, label %9, label %10

; <label>:9                                       ; preds = %5
  br label %12

; <label>:10                                      ; preds = %5
  call void @__assert_fail(i8* getelementptr inbounds ([12 x i8]* @.str19, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8]* @.str18, i32 0, i32 0), i32 90, i8* getelementptr inbounds ([73 x i8]* @__PRETTY_FUNCTION__._ZN6soplex9DataArrayINS_5SPxIdEEixEi, i32 0, i32 0)) #10
  unreachable
                                                  ; No predecessors!
  br label %12

; <label>:12                                      ; preds = %11, %9
  %13 = sext i32 %n to i64
  %14 = getelementptr inbounds %"class.soplex::DataArray.0"* %this, i32 0, i32 2
  %15 = load %"class.soplex::SPxId"** %14, align 8
  %16 = getelementptr inbounds %"class.soplex::SPxId"* %15, i64 %13
  ret %"class.soplex::SPxId"* %16
}

; Function Attrs: nounwind uwtable
define linkonce_odr dereferenceable(64) %"class.soplex::SSVector"* @_ZNK6soplex12UpdateVector5deltaEv(%"class.soplex::UpdateVector"* %this) #2 align 2 {
  %1 = getelementptr inbounds %"class.soplex::UpdateVector"* %this, i32 0, i32 2
  ret %"class.soplex::SSVector"* %1
}

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #1

define internal void @_GLOBAL__sub_I_spxsteeppr.cc() section ".text.startup" {
  call void @__cxx_global_var_init()
  ret void
}

attributes #0 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { inlinehint nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { noinline noreturn nounwind }
attributes #7 = { inlinehint uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #9 = { nobuiltin nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #10 = { noreturn nounwind }
attributes #11 = { builtin nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
