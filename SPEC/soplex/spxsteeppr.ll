; ModuleID = 'spxsteeppr.cc'
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
  %1 = alloca %"class.soplex::SPxSteepPR"*, align 8
  store %"class.soplex::SPxSteepPR"* %this, %"class.soplex::SPxSteepPR"** %1, align 8
  %2 = load %"class.soplex::SPxSteepPR"** %1
  %3 = bitcast %"class.soplex::SPxSteepPR"* %2 to %"class.soplex::SPxPricer"*
  %4 = getelementptr inbounds %"class.soplex::SPxPricer"* %3, i32 0, i32 2
  store %"class.soplex::SoPlex"* null, %"class.soplex::SoPlex"** %4, align 8
  %5 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %2, i32 0, i32 8
  store i32 0, i32* %5, align 4
  ret void
}

; Function Attrs: uwtable
define void @_ZN6soplex10SPxSteepPR4loadEPNS_6SoPlexE(%"class.soplex::SPxSteepPR"* %this, %"class.soplex::SoPlex"* %base) unnamed_addr #3 align 2 {
  %1 = alloca %"class.soplex::SPxSteepPR"*, align 8
  %2 = alloca %"class.soplex::SoPlex"*, align 8
  store %"class.soplex::SPxSteepPR"* %this, %"class.soplex::SPxSteepPR"** %1, align 8
  store %"class.soplex::SoPlex"* %base, %"class.soplex::SoPlex"** %2, align 8
  %3 = load %"class.soplex::SPxSteepPR"** %1
  %4 = load %"class.soplex::SoPlex"** %2, align 8
  %5 = bitcast %"class.soplex::SPxSteepPR"* %3 to %"class.soplex::SPxPricer"*
  %6 = getelementptr inbounds %"class.soplex::SPxPricer"* %5, i32 0, i32 2
  store %"class.soplex::SoPlex"* %4, %"class.soplex::SoPlex"** %6, align 8
  %7 = load %"class.soplex::SoPlex"** %2, align 8
  %8 = icmp ne %"class.soplex::SoPlex"* %7, null
  br i1 %8, label %9, label %29

; <label>:9                                       ; preds = %0
  %10 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %3, i32 0, i32 3
  %11 = bitcast %"class.soplex::DVector"* %10 to %"class.soplex::Vector"*
  call void @_ZN6soplex6Vector5clearEv(%"class.soplex::Vector"* %11)
  %12 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %3, i32 0, i32 3
  %13 = load %"class.soplex::SoPlex"** %2, align 8
  %14 = call i32 @_ZNK6soplex6SoPlex3dimEv(%"class.soplex::SoPlex"* %13)
  call void @_ZN6soplex7DVector5reDimEi(%"class.soplex::DVector"* %12, i32 %14)
  %15 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %3, i32 0, i32 4
  call void @_ZN6soplex8SSVector5clearEv(%"class.soplex::SSVector"* %15)
  %16 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %3, i32 0, i32 4
  %17 = load %"class.soplex::SoPlex"** %2, align 8
  %18 = call i32 @_ZNK6soplex6SoPlex3dimEv(%"class.soplex::SoPlex"* %17)
  call void @_ZN6soplex8SSVector5reDimEi(%"class.soplex::SSVector"* %16, i32 %18)
  %19 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %3, i32 0, i32 11
  %20 = load %"class.soplex::SoPlex"** %2, align 8
  %21 = call i32 @_ZNK6soplex6SoPlex3dimEv(%"class.soplex::SoPlex"* %20)
  call void @_ZN6soplex9DataArrayIdE6reSizeEi(%"class.soplex::DataArray.3"* %19, i32 %21)
  %22 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %3, i32 0, i32 9
  %23 = load %"class.soplex::SoPlex"** %2, align 8
  %24 = call i32 @_ZNK6soplex6SoPlex3dimEv(%"class.soplex::SoPlex"* %23)
  call void @_ZN6soplex9DataArrayIdE6reSizeEi(%"class.soplex::DataArray.3"* %22, i32 %24)
  %25 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %3, i32 0, i32 10
  %26 = load %"class.soplex::SoPlex"** %2, align 8
  %27 = call i32 @_ZNK6soplex6SoPlex5coDimEv(%"class.soplex::SoPlex"* %26)
  call void @_ZN6soplex9DataArrayIdE6reSizeEi(%"class.soplex::DataArray.3"* %25, i32 %27)
  %28 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %3, i32 0, i32 8
  store i32 0, i32* %28, align 4
  br label %29

; <label>:29                                      ; preds = %9, %0
  ret void
}

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN6soplex6Vector5clearEv(%"class.soplex::Vector"* %this) #2 align 2 {
  %1 = alloca %"class.soplex::Vector"*, align 8
  store %"class.soplex::Vector"* %this, %"class.soplex::Vector"** %1, align 8
  %2 = load %"class.soplex::Vector"** %1
  %3 = getelementptr inbounds %"class.soplex::Vector"* %2, i32 0, i32 0
  %4 = load i32* %3, align 4
  %5 = icmp ne i32 %4, 0
  br i1 %5, label %6, label %14

; <label>:6                                       ; preds = %0
  %7 = getelementptr inbounds %"class.soplex::Vector"* %2, i32 0, i32 1
  %8 = load double** %7, align 8
  %9 = bitcast double* %8 to i8*
  %10 = getelementptr inbounds %"class.soplex::Vector"* %2, i32 0, i32 0
  %11 = load i32* %10, align 4
  %12 = sext i32 %11 to i64
  %13 = mul i64 %12, 8
  call void @llvm.memset.p0i8.i64(i8* %9, i8 0, i64 %13, i32 8, i1 false)
  br label %14

; <label>:14                                      ; preds = %6, %0
  ret void
}

declare void @_ZN6soplex7DVector5reDimEi(%"class.soplex::DVector"*, i32) #0

; Function Attrs: nounwind uwtable
define linkonce_odr i32 @_ZNK6soplex6SoPlex3dimEv(%"class.soplex::SoPlex"* %this) #2 align 2 {
  %1 = alloca %"class.soplex::SoPlex"*, align 8
  store %"class.soplex::SoPlex"* %this, %"class.soplex::SoPlex"** %1, align 8
  %2 = load %"class.soplex::SoPlex"** %1
  %3 = getelementptr inbounds %"class.soplex::SoPlex"* %2, i32 0, i32 23
  %4 = load %"class.soplex::SVSet"** %3, align 8
  %5 = call i32 @_ZNK6soplex5SVSet3numEv(%"class.soplex::SVSet"* %4)
  ret i32 %5
}

declare void @_ZN6soplex8SSVector5clearEv(%"class.soplex::SSVector"*) #0

declare void @_ZN6soplex8SSVector5reDimEi(%"class.soplex::SSVector"*, i32) #0

; Function Attrs: uwtable
define linkonce_odr void @_ZN6soplex9DataArrayIdE6reSizeEi(%"class.soplex::DataArray.3"* %this, i32 %newsize) #3 align 2 {
  %1 = alloca %"class.soplex::DataArray.3"*, align 8
  %2 = alloca i32, align 4
  store %"class.soplex::DataArray.3"* %this, %"class.soplex::DataArray.3"** %1, align 8
  store i32 %newsize, i32* %2, align 4
  %3 = load %"class.soplex::DataArray.3"** %1
  %4 = getelementptr inbounds %"class.soplex::DataArray.3"* %3, i32 0, i32 3
  %5 = load double* %4, align 8
  %6 = fcmp oge double %5, 1.000000e+00
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %0
  br label %10

; <label>:8                                       ; preds = %0
  call void @__assert_fail(i8* getelementptr inbounds ([15 x i8]* @.str20, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8]* @.str18, i32 0, i32 0), i32 207, i8* getelementptr inbounds ([57 x i8]* @__PRETTY_FUNCTION__._ZN6soplex9DataArrayIdE6reSizeEi, i32 0, i32 0)) #10
  unreachable
                                                  ; No predecessors!
  br label %10

; <label>:10                                      ; preds = %9, %7
  %11 = load i32* %2, align 4
  %12 = getelementptr inbounds %"class.soplex::DataArray.3"* %3, i32 0, i32 1
  %13 = load i32* %12, align 4
  %14 = icmp sgt i32 %11, %13
  br i1 %14, label %15, label %24

; <label>:15                                      ; preds = %10
  %16 = getelementptr inbounds %"class.soplex::DataArray.3"* %3, i32 0, i32 3
  %17 = load double* %16, align 8
  %18 = load i32* %2, align 4
  %19 = sitofp i32 %18 to double
  %20 = fmul double %17, %19
  %21 = fptosi double %20 to i32
  %22 = load i32* %2, align 4
  %23 = call i64 @_ZN6soplex9DataArrayIdE5reMaxEii(%"class.soplex::DataArray.3"* %3, i32 %21, i32 %22)
  br label %33

; <label>:24                                      ; preds = %10
  %25 = load i32* %2, align 4
  %26 = icmp slt i32 %25, 0
  br i1 %26, label %27, label %29

; <label>:27                                      ; preds = %24
  %28 = getelementptr inbounds %"class.soplex::DataArray.3"* %3, i32 0, i32 0
  store i32 0, i32* %28, align 4
  br label %32

; <label>:29                                      ; preds = %24
  %30 = load i32* %2, align 4
  %31 = getelementptr inbounds %"class.soplex::DataArray.3"* %3, i32 0, i32 0
  store i32 %30, i32* %31, align 4
  br label %32

; <label>:32                                      ; preds = %29, %27
  br label %33

; <label>:33                                      ; preds = %32, %15
  ret void
}

; Function Attrs: nounwind uwtable
define linkonce_odr i32 @_ZNK6soplex6SoPlex5coDimEv(%"class.soplex::SoPlex"* %this) #2 align 2 {
  %1 = alloca %"class.soplex::SoPlex"*, align 8
  store %"class.soplex::SoPlex"* %this, %"class.soplex::SoPlex"** %1, align 8
  %2 = load %"class.soplex::SoPlex"** %1
  %3 = getelementptr inbounds %"class.soplex::SoPlex"* %2, i32 0, i32 22
  %4 = load %"class.soplex::SVSet"** %3, align 8
  %5 = call i32 @_ZNK6soplex5SVSet3numEv(%"class.soplex::SVSet"* %4)
  ret i32 %5
}

; Function Attrs: uwtable
define void @_ZN6soplex10SPxSteepPR7setTypeENS_6SoPlex4TypeE(%"class.soplex::SPxSteepPR"* %this, i32 %type) unnamed_addr #3 align 2 {
  %1 = alloca %"class.soplex::SPxSteepPR"*, align 8
  %2 = alloca i32, align 4
  %i = alloca i32, align 4
  %id = alloca %"class.soplex::SPxId", align 4
  %n = alloca i32, align 4
  %3 = alloca %"class.soplex::SPxId", align 4
  store %"class.soplex::SPxSteepPR"* %this, %"class.soplex::SPxSteepPR"** %1, align 8
  store i32 %type, i32* %2, align 4
  %4 = load %"class.soplex::SPxSteepPR"** %1
  %5 = bitcast %"class.soplex::SPxSteepPR"* %4 to %"class.soplex::SPxPricer"*
  %6 = getelementptr inbounds %"class.soplex::SPxPricer"* %5, i32 0, i32 2
  %7 = load %"class.soplex::SoPlex"** %6, align 8
  %8 = call double @_ZNK6soplex6SoPlex7epsilonEv(%"class.soplex::SoPlex"* %7)
  %9 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %4, i32 0, i32 4
  %10 = getelementptr inbounds %"class.soplex::SSVector"* %9, i32 0, i32 3
  store double %8, double* %10, align 8
  %11 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %4, i32 0, i32 10
  %12 = bitcast %"class.soplex::SPxSteepPR"* %4 to %"class.soplex::SPxPricer"*
  %13 = getelementptr inbounds %"class.soplex::SPxPricer"* %12, i32 0, i32 2
  %14 = load %"class.soplex::SoPlex"** %13, align 8
  %15 = call i32 @_ZNK6soplex6SoPlex5coDimEv(%"class.soplex::SoPlex"* %14)
  call void @_ZN6soplex9DataArrayIdE6reSizeEi(%"class.soplex::DataArray.3"* %11, i32 %15)
  %16 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %4, i32 0, i32 9
  %17 = bitcast %"class.soplex::SPxSteepPR"* %4 to %"class.soplex::SPxPricer"*
  %18 = getelementptr inbounds %"class.soplex::SPxPricer"* %17, i32 0, i32 2
  %19 = load %"class.soplex::SoPlex"** %18, align 8
  %20 = call i32 @_ZNK6soplex6SoPlex3dimEv(%"class.soplex::SoPlex"* %19)
  call void @_ZN6soplex9DataArrayIdE6reSizeEi(%"class.soplex::DataArray.3"* %16, i32 %20)
  %21 = load i32* %2, align 4
  call void @_ZN6soplex10SPxSteepPR10setupPrefsENS_6SoPlex4TypeE(%"class.soplex::SPxSteepPR"* %4, i32 %21)
  %22 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %4, i32 0, i32 12
  %23 = load i32* %22, align 4
  %24 = icmp eq i32 %23, 1
  br i1 %24, label %25, label %151

; <label>:25                                      ; preds = %0
  %26 = load i32* %2, align 4
  %27 = icmp eq i32 %26, -1
  br i1 %27, label %28, label %73

; <label>:28                                      ; preds = %25
  %29 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %4, i32 0, i32 2
  %30 = bitcast %"class.soplex::SPxSteepPR"* %4 to %"class.soplex::SPxPricer"*
  %31 = getelementptr inbounds %"class.soplex::SPxPricer"* %30, i32 0, i32 2
  %32 = load %"class.soplex::SoPlex"** %31, align 8
  %33 = call i32 @_ZNK6soplex6SoPlex3dimEv(%"class.soplex::SoPlex"* %32)
  call void @_ZN6soplex7DVector5reDimEi(%"class.soplex::DVector"* %29, i32 %33)
  %34 = bitcast %"class.soplex::SPxSteepPR"* %4 to %"class.soplex::SPxPricer"*
  %35 = getelementptr inbounds %"class.soplex::SPxPricer"* %34, i32 0, i32 2
  %36 = load %"class.soplex::SoPlex"** %35, align 8
  %37 = call i32 @_ZNK6soplex6SoPlex3dimEv(%"class.soplex::SoPlex"* %36)
  %38 = sub nsw i32 %37, 1
  store i32 %38, i32* %i, align 4
  br label %39

; <label>:39                                      ; preds = %47, %28
  %40 = load i32* %i, align 4
  %41 = icmp sge i32 %40, 0
  br i1 %41, label %42, label %50

; <label>:42                                      ; preds = %39
  %43 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %4, i32 0, i32 2
  %44 = bitcast %"class.soplex::DVector"* %43 to %"class.soplex::Vector"*
  %45 = load i32* %i, align 4
  %46 = call dereferenceable(8) double* @_ZN6soplex6VectorixEi(%"class.soplex::Vector"* %44, i32 %45)
  store double 2.000000e+00, double* %46
  br label %47

; <label>:47                                      ; preds = %42
  %48 = load i32* %i, align 4
  %49 = add nsw i32 %48, -1
  store i32 %49, i32* %i, align 4
  br label %39

; <label>:50                                      ; preds = %39
  %51 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %4, i32 0, i32 1
  %52 = bitcast %"class.soplex::SPxSteepPR"* %4 to %"class.soplex::SPxPricer"*
  %53 = getelementptr inbounds %"class.soplex::SPxPricer"* %52, i32 0, i32 2
  %54 = load %"class.soplex::SoPlex"** %53, align 8
  %55 = call i32 @_ZNK6soplex6SoPlex5coDimEv(%"class.soplex::SoPlex"* %54)
  call void @_ZN6soplex7DVector5reDimEi(%"class.soplex::DVector"* %51, i32 %55)
  %56 = bitcast %"class.soplex::SPxSteepPR"* %4 to %"class.soplex::SPxPricer"*
  %57 = getelementptr inbounds %"class.soplex::SPxPricer"* %56, i32 0, i32 2
  %58 = load %"class.soplex::SoPlex"** %57, align 8
  %59 = call i32 @_ZNK6soplex6SoPlex5coDimEv(%"class.soplex::SoPlex"* %58)
  %60 = sub nsw i32 %59, 1
  store i32 %60, i32* %i, align 4
  br label %61

; <label>:61                                      ; preds = %69, %50
  %62 = load i32* %i, align 4
  %63 = icmp sge i32 %62, 0
  br i1 %63, label %64, label %72

; <label>:64                                      ; preds = %61
  %65 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %4, i32 0, i32 1
  %66 = bitcast %"class.soplex::DVector"* %65 to %"class.soplex::Vector"*
  %67 = load i32* %i, align 4
  %68 = call dereferenceable(8) double* @_ZN6soplex6VectorixEi(%"class.soplex::Vector"* %66, i32 %67)
  store double 1.000000e+00, double* %68
  br label %69

; <label>:69                                      ; preds = %64
  %70 = load i32* %i, align 4
  %71 = add nsw i32 %70, -1
  store i32 %71, i32* %i, align 4
  br label %61

; <label>:72                                      ; preds = %61
  br label %150

; <label>:73                                      ; preds = %25
  %74 = load i32* %2, align 4
  %75 = icmp eq i32 %74, 1
  br i1 %75, label %76, label %77

; <label>:76                                      ; preds = %73
  br label %79

; <label>:77                                      ; preds = %73
  call void @__assert_fail(i8* getelementptr inbounds ([22 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8]* @.str1, i32 0, i32 0), i32 85, i8* getelementptr inbounds ([55 x i8]* @__PRETTY_FUNCTION__._ZN6soplex10SPxSteepPR7setTypeENS_6SoPlex4TypeE, i32 0, i32 0)) #10
  unreachable
                                                  ; No predecessors!
  br label %79

; <label>:79                                      ; preds = %78, %76
  %80 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %4, i32 0, i32 2
  %81 = bitcast %"class.soplex::SPxSteepPR"* %4 to %"class.soplex::SPxPricer"*
  %82 = getelementptr inbounds %"class.soplex::SPxPricer"* %81, i32 0, i32 2
  %83 = load %"class.soplex::SoPlex"** %82, align 8
  %84 = call i32 @_ZNK6soplex6SoPlex3dimEv(%"class.soplex::SoPlex"* %83)
  call void @_ZN6soplex7DVector5reDimEi(%"class.soplex::DVector"* %80, i32 %84)
  %85 = bitcast %"class.soplex::SPxSteepPR"* %4 to %"class.soplex::SPxPricer"*
  %86 = getelementptr inbounds %"class.soplex::SPxPricer"* %85, i32 0, i32 2
  %87 = load %"class.soplex::SoPlex"** %86, align 8
  %88 = call i32 @_ZNK6soplex6SoPlex3dimEv(%"class.soplex::SoPlex"* %87)
  %89 = sub nsw i32 %88, 1
  store i32 %89, i32* %i, align 4
  br label %90

; <label>:90                                      ; preds = %146, %79
  %91 = load i32* %i, align 4
  %92 = icmp sge i32 %91, 0
  br i1 %92, label %93, label %149

; <label>:93                                      ; preds = %90
  %94 = bitcast %"class.soplex::SPxSteepPR"* %4 to %"class.soplex::SPxPricer"*
  %95 = getelementptr inbounds %"class.soplex::SPxPricer"* %94, i32 0, i32 2
  %96 = load %"class.soplex::SoPlex"** %95, align 8
  %97 = call dereferenceable(208) %"class.soplex::SPxBasis"* @_ZN6soplex6SoPlex5basisEv(%"class.soplex::SoPlex"* %96)
  %98 = load i32* %i, align 4
  %99 = call dereferenceable(4) %"class.soplex::SPxId"* @_ZN6soplex8SPxBasis6baseIdEi(%"class.soplex::SPxBasis"* %97, i32 %98)
  call void @_ZN6soplex5SPxIdC2ERKS0_(%"class.soplex::SPxId"* %id, %"class.soplex::SPxId"* dereferenceable(4) %99)
  %100 = bitcast %"class.soplex::SPxSteepPR"* %4 to %"class.soplex::SPxPricer"*
  %101 = getelementptr inbounds %"class.soplex::SPxPricer"* %100, i32 0, i32 2
  %102 = load %"class.soplex::SoPlex"** %101, align 8
  %103 = bitcast %"class.soplex::SoPlex"* %102 to %"class.soplex::SPxLP"*
  %104 = call i32 @_ZNK6soplex5SPxLP6numberERKNS_5SPxIdE(%"class.soplex::SPxLP"* %103, %"class.soplex::SPxId"* dereferenceable(4) %id)
  store i32 %104, i32* %n, align 4
  %105 = bitcast %"class.soplex::SPxSteepPR"* %4 to %"class.soplex::SPxPricer"*
  %106 = getelementptr inbounds %"class.soplex::SPxPricer"* %105, i32 0, i32 2
  %107 = load %"class.soplex::SoPlex"** %106, align 8
  call void @_ZN6soplex5SPxIdC2ERKS0_(%"class.soplex::SPxId"* %3, %"class.soplex::SPxId"* dereferenceable(4) %id)
  %108 = call i32 @_ZNK6soplex6SoPlex4isIdENS_5SPxIdE(%"class.soplex::SoPlex"* %107, %"class.soplex::SPxId"* %3)
  %109 = icmp ne i32 %108, 0
  br i1 %109, label %110, label %118

; <label>:110                                     ; preds = %93
  %111 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %4, i32 0, i32 10
  %112 = load i32* %n, align 4
  %113 = call dereferenceable(8) double* @_ZN6soplex9DataArrayIdEixEi(%"class.soplex::DataArray.3"* %111, i32 %112)
  %114 = load double* %113
  %115 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %4, i32 0, i32 11
  %116 = load i32* %i, align 4
  %117 = call dereferenceable(8) double* @_ZN6soplex9DataArrayIdEixEi(%"class.soplex::DataArray.3"* %115, i32 %116)
  store double %114, double* %117
  br label %126

; <label>:118                                     ; preds = %93
  %119 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %4, i32 0, i32 9
  %120 = load i32* %n, align 4
  %121 = call dereferenceable(8) double* @_ZN6soplex9DataArrayIdEixEi(%"class.soplex::DataArray.3"* %119, i32 %120)
  %122 = load double* %121
  %123 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %4, i32 0, i32 11
  %124 = load i32* %i, align 4
  %125 = call dereferenceable(8) double* @_ZN6soplex9DataArrayIdEixEi(%"class.soplex::DataArray.3"* %123, i32 %124)
  store double %122, double* %125
  br label %126

; <label>:126                                     ; preds = %118, %110
  %127 = bitcast %"class.soplex::SPxSteepPR"* %4 to %"class.soplex::SPxPricer"*
  %128 = getelementptr inbounds %"class.soplex::SPxPricer"* %127, i32 0, i32 2
  %129 = load %"class.soplex::SoPlex"** %128, align 8
  %130 = call dereferenceable(208) %"class.soplex::SPxBasis"* @_ZN6soplex6SoPlex5basisEv(%"class.soplex::SoPlex"* %129)
  %131 = load i32* %i, align 4
  %132 = call dereferenceable(8) %"class.soplex::SVector"* @_ZNK6soplex8SPxBasis7baseVecEi(%"class.soplex::SPxBasis"* %130, i32 %131)
  %133 = call i32 @_ZNK6soplex7SVector4sizeEv(%"class.soplex::SVector"* %132)
  %134 = sitofp i32 %133 to double
  %135 = bitcast %"class.soplex::SPxSteepPR"* %4 to %"class.soplex::SPxPricer"*
  %136 = getelementptr inbounds %"class.soplex::SPxPricer"* %135, i32 0, i32 2
  %137 = load %"class.soplex::SoPlex"** %136, align 8
  %138 = call i32 @_ZNK6soplex6SoPlex3dimEv(%"class.soplex::SoPlex"* %137)
  %139 = sitofp i32 %138 to double
  %140 = fdiv double %134, %139
  %141 = fadd double 1.000000e+00, %140
  %142 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %4, i32 0, i32 2
  %143 = bitcast %"class.soplex::DVector"* %142 to %"class.soplex::Vector"*
  %144 = load i32* %i, align 4
  %145 = call dereferenceable(8) double* @_ZN6soplex6VectorixEi(%"class.soplex::Vector"* %143, i32 %144)
  store double %141, double* %145
  br label %146

; <label>:146                                     ; preds = %126
  %147 = load i32* %i, align 4
  %148 = add nsw i32 %147, -1
  store i32 %148, i32* %i, align 4
  br label %90

; <label>:149                                     ; preds = %90
  br label %150

; <label>:150                                     ; preds = %149, %72
  br label %252

; <label>:151                                     ; preds = %0
  %152 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cerr, i8* getelementptr inbounds ([65 x i8]* @.str2, i32 0, i32 0))
  %153 = load i32* %2, align 4
  %154 = icmp eq i32 %153, -1
  br i1 %154, label %155, label %207

; <label>:155                                     ; preds = %151
  %156 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %4, i32 0, i32 2
  %157 = bitcast %"class.soplex::SPxSteepPR"* %4 to %"class.soplex::SPxPricer"*
  %158 = getelementptr inbounds %"class.soplex::SPxPricer"* %157, i32 0, i32 2
  %159 = load %"class.soplex::SoPlex"** %158, align 8
  %160 = call i32 @_ZNK6soplex6SoPlex3dimEv(%"class.soplex::SoPlex"* %159)
  call void @_ZN6soplex7DVector5reDimEi(%"class.soplex::DVector"* %156, i32 %160)
  %161 = bitcast %"class.soplex::SPxSteepPR"* %4 to %"class.soplex::SPxPricer"*
  %162 = getelementptr inbounds %"class.soplex::SPxPricer"* %161, i32 0, i32 2
  %163 = load %"class.soplex::SoPlex"** %162, align 8
  %164 = call i32 @_ZNK6soplex6SoPlex3dimEv(%"class.soplex::SoPlex"* %163)
  %165 = sub nsw i32 %164, 1
  store i32 %165, i32* %i, align 4
  br label %166

; <label>:166                                     ; preds = %174, %155
  %167 = load i32* %i, align 4
  %168 = icmp sge i32 %167, 0
  br i1 %168, label %169, label %177

; <label>:169                                     ; preds = %166
  %170 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %4, i32 0, i32 2
  %171 = bitcast %"class.soplex::DVector"* %170 to %"class.soplex::Vector"*
  %172 = load i32* %i, align 4
  %173 = call dereferenceable(8) double* @_ZN6soplex6VectorixEi(%"class.soplex::Vector"* %171, i32 %172)
  store double 1.000000e+00, double* %173
  br label %174

; <label>:174                                     ; preds = %169
  %175 = load i32* %i, align 4
  %176 = add nsw i32 %175, -1
  store i32 %176, i32* %i, align 4
  br label %166

; <label>:177                                     ; preds = %166
  %178 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %4, i32 0, i32 1
  %179 = bitcast %"class.soplex::SPxSteepPR"* %4 to %"class.soplex::SPxPricer"*
  %180 = getelementptr inbounds %"class.soplex::SPxPricer"* %179, i32 0, i32 2
  %181 = load %"class.soplex::SoPlex"** %180, align 8
  %182 = call i32 @_ZNK6soplex6SoPlex5coDimEv(%"class.soplex::SoPlex"* %181)
  call void @_ZN6soplex7DVector5reDimEi(%"class.soplex::DVector"* %178, i32 %182)
  %183 = bitcast %"class.soplex::SPxSteepPR"* %4 to %"class.soplex::SPxPricer"*
  %184 = getelementptr inbounds %"class.soplex::SPxPricer"* %183, i32 0, i32 2
  %185 = load %"class.soplex::SoPlex"** %184, align 8
  %186 = call i32 @_ZNK6soplex6SoPlex5coDimEv(%"class.soplex::SoPlex"* %185)
  %187 = sub nsw i32 %186, 1
  store i32 %187, i32* %i, align 4
  br label %188

; <label>:188                                     ; preds = %203, %177
  %189 = load i32* %i, align 4
  %190 = icmp sge i32 %189, 0
  br i1 %190, label %191, label %206

; <label>:191                                     ; preds = %188
  %192 = bitcast %"class.soplex::SPxSteepPR"* %4 to %"class.soplex::SPxPricer"*
  %193 = getelementptr inbounds %"class.soplex::SPxPricer"* %192, i32 0, i32 2
  %194 = load %"class.soplex::SoPlex"** %193, align 8
  %195 = load i32* %i, align 4
  %196 = call dereferenceable(8) %"class.soplex::SVector"* @_ZNK6soplex6SoPlex6vectorEi(%"class.soplex::SoPlex"* %194, i32 %195)
  %197 = call double @_ZNK6soplex7SVector7length2Ev(%"class.soplex::SVector"* %196)
  %198 = fadd double 1.000000e+00, %197
  %199 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %4, i32 0, i32 1
  %200 = bitcast %"class.soplex::DVector"* %199 to %"class.soplex::Vector"*
  %201 = load i32* %i, align 4
  %202 = call dereferenceable(8) double* @_ZN6soplex6VectorixEi(%"class.soplex::Vector"* %200, i32 %201)
  store double %198, double* %202
  br label %203

; <label>:203                                     ; preds = %191
  %204 = load i32* %i, align 4
  %205 = add nsw i32 %204, -1
  store i32 %205, i32* %i, align 4
  br label %188

; <label>:206                                     ; preds = %188
  br label %251

; <label>:207                                     ; preds = %151
  %208 = load i32* %2, align 4
  %209 = icmp eq i32 %208, 1
  br i1 %209, label %210, label %211

; <label>:210                                     ; preds = %207
  br label %213

; <label>:211                                     ; preds = %207
  call void @__assert_fail(i8* getelementptr inbounds ([22 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8]* @.str1, i32 0, i32 0), i32 117, i8* getelementptr inbounds ([55 x i8]* @__PRETTY_FUNCTION__._ZN6soplex10SPxSteepPR7setTypeENS_6SoPlex4TypeE, i32 0, i32 0)) #10
  unreachable
                                                  ; No predecessors!
  br label %213

; <label>:213                                     ; preds = %212, %210
  %214 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %4, i32 0, i32 2
  %215 = bitcast %"class.soplex::SPxSteepPR"* %4 to %"class.soplex::SPxPricer"*
  %216 = getelementptr inbounds %"class.soplex::SPxPricer"* %215, i32 0, i32 2
  %217 = load %"class.soplex::SoPlex"** %216, align 8
  %218 = call i32 @_ZNK6soplex6SoPlex3dimEv(%"class.soplex::SoPlex"* %217)
  call void @_ZN6soplex7DVector5reDimEi(%"class.soplex::DVector"* %214, i32 %218)
  %219 = bitcast %"class.soplex::SPxSteepPR"* %4 to %"class.soplex::SPxPricer"*
  %220 = getelementptr inbounds %"class.soplex::SPxPricer"* %219, i32 0, i32 2
  %221 = load %"class.soplex::SoPlex"** %220, align 8
  %222 = call i32 @_ZNK6soplex6SoPlex3dimEv(%"class.soplex::SoPlex"* %221)
  %223 = sub nsw i32 %222, 1
  store i32 %223, i32* %i, align 4
  br label %224

; <label>:224                                     ; preds = %247, %213
  %225 = load i32* %i, align 4
  %226 = icmp sge i32 %225, 0
  br i1 %226, label %227, label %250

; <label>:227                                     ; preds = %224
  %228 = bitcast %"class.soplex::SPxSteepPR"* %4 to %"class.soplex::SPxPricer"*
  %229 = getelementptr inbounds %"class.soplex::SPxPricer"* %228, i32 0, i32 2
  %230 = load %"class.soplex::SoPlex"** %229, align 8
  %231 = call dereferenceable(208) %"class.soplex::SPxBasis"* @_ZN6soplex6SoPlex5basisEv(%"class.soplex::SoPlex"* %230)
  %232 = load i32* %i, align 4
  %233 = call dereferenceable(8) %"class.soplex::SVector"* @_ZNK6soplex8SPxBasis7baseVecEi(%"class.soplex::SPxBasis"* %231, i32 %232)
  %234 = call i32 @_ZNK6soplex7SVector4sizeEv(%"class.soplex::SVector"* %233)
  %235 = sitofp i32 %234 to double
  %236 = bitcast %"class.soplex::SPxSteepPR"* %4 to %"class.soplex::SPxPricer"*
  %237 = getelementptr inbounds %"class.soplex::SPxPricer"* %236, i32 0, i32 2
  %238 = load %"class.soplex::SoPlex"** %237, align 8
  %239 = call i32 @_ZNK6soplex6SoPlex3dimEv(%"class.soplex::SoPlex"* %238)
  %240 = sitofp i32 %239 to double
  %241 = fdiv double %235, %240
  %242 = fadd double 1.000000e+00, %241
  %243 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %4, i32 0, i32 2
  %244 = bitcast %"class.soplex::DVector"* %243 to %"class.soplex::Vector"*
  %245 = load i32* %i, align 4
  %246 = call dereferenceable(8) double* @_ZN6soplex6VectorixEi(%"class.soplex::Vector"* %244, i32 %245)
  store double %242, double* %246
  br label %247

; <label>:247                                     ; preds = %227
  %248 = load i32* %i, align 4
  %249 = add nsw i32 %248, -1
  store i32 %249, i32* %i, align 4
  br label %224

; <label>:250                                     ; preds = %224
  br label %251

; <label>:251                                     ; preds = %250, %206
  br label %252

; <label>:252                                     ; preds = %251, %150
  %253 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %4, i32 0, i32 3
  %254 = bitcast %"class.soplex::DVector"* %253 to %"class.soplex::Vector"*
  call void @_ZN6soplex6Vector5clearEv(%"class.soplex::Vector"* %254)
  %255 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %4, i32 0, i32 4
  call void @_ZN6soplex8SSVector5clearEv(%"class.soplex::SSVector"* %255)
  ret void
}

; Function Attrs: uwtable
define linkonce_odr double @_ZNK6soplex6SoPlex7epsilonEv(%"class.soplex::SoPlex"* %this) #3 align 2 {
  %1 = alloca %"class.soplex::SoPlex"*, align 8
  store %"class.soplex::SoPlex"* %this, %"class.soplex::SoPlex"** %1, align 8
  %2 = load %"class.soplex::SoPlex"** %1
  %3 = getelementptr inbounds %"class.soplex::SoPlex"* %2, i32 0, i32 27
  %4 = call dereferenceable(64) %"class.soplex::SSVector"* @_ZNK6soplex12UpdateVector5deltaEv(%"class.soplex::UpdateVector"* %3)
  %5 = getelementptr inbounds %"class.soplex::SSVector"* %4, i32 0, i32 3
  %6 = load double* %5, align 8
  ret double %6
}

; Function Attrs: uwtable
define void @_ZN6soplex10SPxSteepPR10setupPrefsENS_6SoPlex4TypeE(%"class.soplex::SPxSteepPR"* %this, i32 %tp) #3 align 2 {
  %1 = alloca %"class.soplex::SPxSteepPR"*, align 8
  %2 = alloca i32, align 4
  %mult = alloca double, align 8
  store %"class.soplex::SPxSteepPR"* %this, %"class.soplex::SPxSteepPR"** %1, align 8
  store i32 %tp, i32* %2, align 4
  %3 = load %"class.soplex::SPxSteepPR"** %1
  %4 = load i32* %2, align 4
  %5 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %3, i32 0, i32 8
  %6 = load i32* %5, align 4
  %7 = icmp ne i32 %4, %6
  br i1 %7, label %8, label %31

; <label>:8                                       ; preds = %0
  %9 = bitcast %"class.soplex::SPxSteepPR"* %3 to %"class.soplex::SPxPricer"*
  %10 = getelementptr inbounds %"class.soplex::SPxPricer"* %9, i32 0, i32 2
  %11 = load %"class.soplex::SoPlex"** %10, align 8
  %12 = call i32 @_ZNK6soplex6SoPlex3dimEv(%"class.soplex::SoPlex"* %11)
  %13 = add nsw i32 1, %12
  %14 = bitcast %"class.soplex::SPxSteepPR"* %3 to %"class.soplex::SPxPricer"*
  %15 = getelementptr inbounds %"class.soplex::SPxPricer"* %14, i32 0, i32 2
  %16 = load %"class.soplex::SoPlex"** %15, align 8
  %17 = call i32 @_ZNK6soplex6SoPlex5coDimEv(%"class.soplex::SoPlex"* %16)
  %18 = add nsw i32 %13, %17
  %19 = sitofp i32 %18 to double
  %20 = fdiv double 1.000000e-08, %19
  store double %20, double* %mult, align 8
  %21 = load i32* %2, align 4
  %22 = icmp eq i32 %21, -1
  br i1 %22, label %23, label %26

; <label>:23                                      ; preds = %8
  %24 = load double* %mult, align 8
  %25 = fsub double -0.000000e+00, %24
  call void @_ZN6soplex10SPxSteepPR10setupPrefsEdddddiiii(%"class.soplex::SPxSteepPR"* %3, double %25, double -1.000000e-05, double -1.000000e-05, double 1.000000e+00, double 1.000000e+00, i32 0, i32 0, i32 -1, i32 -1)
  br label %28

; <label>:26                                      ; preds = %8
  %27 = load double* %mult, align 8
  call void @_ZN6soplex10SPxSteepPR10setupPrefsEdddddiiii(%"class.soplex::SPxSteepPR"* %3, double %27, double 1.000000e-05, double 1.000000e-05, double 1.000000e+00, double 1.000000e+00, i32 0, i32 0, i32 -1, i32 -1)
  br label %28

; <label>:28                                      ; preds = %26, %23
  %29 = load i32* %2, align 4
  %30 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %3, i32 0, i32 8
  store i32 %29, i32* %30, align 4
  br label %31

; <label>:31                                      ; preds = %28, %0
  ret void
}

; Function Attrs: nounwind uwtable
define linkonce_odr dereferenceable(8) double* @_ZN6soplex6VectorixEi(%"class.soplex::Vector"* %this, i32 %n) #2 align 2 {
  %1 = alloca %"class.soplex::Vector"*, align 8
  %2 = alloca i32, align 4
  store %"class.soplex::Vector"* %this, %"class.soplex::Vector"** %1, align 8
  store i32 %n, i32* %2, align 4
  %3 = load %"class.soplex::Vector"** %1
  %4 = load i32* %2, align 4
  %5 = icmp sge i32 %4, 0
  br i1 %5, label %6, label %11

; <label>:6                                       ; preds = %0
  %7 = load i32* %2, align 4
  %8 = call i32 @_ZNK6soplex6Vector3dimEv(%"class.soplex::Vector"* %3)
  %9 = icmp slt i32 %7, %8
  br i1 %9, label %10, label %11

; <label>:10                                      ; preds = %6
  br label %13

; <label>:11                                      ; preds = %6, %0
  call void @__assert_fail(i8* getelementptr inbounds ([20 x i8]* @.str28, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8]* @.str29, i32 0, i32 0), i32 153, i8* getelementptr inbounds ([38 x i8]* @__PRETTY_FUNCTION__._ZN6soplex6VectorixEi, i32 0, i32 0)) #10
  unreachable
                                                  ; No predecessors!
  br label %13

; <label>:13                                      ; preds = %12, %10
  %14 = load i32* %2, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds %"class.soplex::Vector"* %3, i32 0, i32 1
  %17 = load double** %16, align 8
  %18 = getelementptr inbounds double* %17, i64 %15
  ret double* %18
}

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) #4

; Function Attrs: nounwind uwtable
define linkonce_odr dereferenceable(208) %"class.soplex::SPxBasis"* @_ZN6soplex6SoPlex5basisEv(%"class.soplex::SoPlex"* %this) #2 align 2 {
  %1 = alloca %"class.soplex::SoPlex"*, align 8
  store %"class.soplex::SoPlex"* %this, %"class.soplex::SoPlex"** %1, align 8
  %2 = load %"class.soplex::SoPlex"** %1
  %3 = bitcast %"class.soplex::SoPlex"* %2 to i8*
  %4 = getelementptr inbounds i8* %3, i64 352
  %5 = bitcast i8* %4 to %"class.soplex::SPxBasis"*
  ret %"class.soplex::SPxBasis"* %5
}

; Function Attrs: uwtable
define linkonce_odr dereferenceable(4) %"class.soplex::SPxId"* @_ZN6soplex8SPxBasis6baseIdEi(%"class.soplex::SPxBasis"* %this, i32 %i) #3 align 2 {
  %1 = alloca %"class.soplex::SPxBasis"*, align 8
  %2 = alloca i32, align 4
  store %"class.soplex::SPxBasis"* %this, %"class.soplex::SPxBasis"** %1, align 8
  store i32 %i, i32* %2, align 4
  %3 = load %"class.soplex::SPxBasis"** %1
  %4 = getelementptr inbounds %"class.soplex::SPxBasis"* %3, i32 0, i32 2
  %5 = load i32* %2, align 4
  %6 = call dereferenceable(4) %"class.soplex::SPxId"* @_ZN6soplex9DataArrayINS_5SPxIdEEixEi(%"class.soplex::DataArray.0"* %4, i32 %5)
  ret %"class.soplex::SPxId"* %6
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr void @_ZN6soplex5SPxIdC2ERKS0_(%"class.soplex::SPxId"* %this, %"class.soplex::SPxId"* dereferenceable(4)) unnamed_addr #5 align 2 {
  %2 = alloca %"class.soplex::SPxId"*, align 8
  %3 = alloca %"class.soplex::SPxId"*, align 8
  store %"class.soplex::SPxId"* %this, %"class.soplex::SPxId"** %2, align 8
  store %"class.soplex::SPxId"* %0, %"class.soplex::SPxId"** %3, align 8
  %4 = load %"class.soplex::SPxId"** %2
  %5 = bitcast %"class.soplex::SPxId"* %4 to %"class.soplex::DataKey"*
  %6 = load %"class.soplex::SPxId"** %3, align 8
  %7 = bitcast %"class.soplex::SPxId"* %6 to %"class.soplex::DataKey"*
  call void @_ZN6soplex7DataKeyC2ERKS0_(%"class.soplex::DataKey"* %5, %"class.soplex::DataKey"* dereferenceable(4) %7)
  ret void
}

; Function Attrs: uwtable
define linkonce_odr i32 @_ZNK6soplex5SPxLP6numberERKNS_5SPxIdE(%"class.soplex::SPxLP"* %this, %"class.soplex::SPxId"* dereferenceable(4) %id) #3 align 2 {
  %1 = alloca %"class.soplex::SPxLP"*, align 8
  %2 = alloca %"class.soplex::SPxId"*, align 8
  store %"class.soplex::SPxLP"* %this, %"class.soplex::SPxLP"** %1, align 8
  store %"class.soplex::SPxId"* %id, %"class.soplex::SPxId"** %2, align 8
  %3 = load %"class.soplex::SPxLP"** %1
  %4 = load %"class.soplex::SPxId"** %2, align 8
  %5 = call i32 @_ZNK6soplex5SPxId4typeEv(%"class.soplex::SPxId"* %4)
  %6 = icmp eq i32 %5, 1
  br i1 %6, label %7, label %14

; <label>:7                                       ; preds = %0
  %8 = bitcast %"class.soplex::SPxLP"* %3 to i8*
  %9 = getelementptr inbounds i8* %8, i64 160
  %10 = bitcast i8* %9 to %"class.soplex::LPColSet"*
  %11 = load %"class.soplex::SPxId"** %2, align 8
  %12 = bitcast %"class.soplex::SPxId"* %11 to %"class.soplex::DataKey"*
  %13 = call i32 @_ZNK6soplex8LPColSet6numberERKNS_7DataKeyE(%"class.soplex::LPColSet"* %10, %"class.soplex::DataKey"* dereferenceable(4) %12)
  br label %21

; <label>:14                                      ; preds = %0
  %15 = bitcast %"class.soplex::SPxLP"* %3 to i8*
  %16 = getelementptr inbounds i8* %15, i64 8
  %17 = bitcast i8* %16 to %"class.soplex::LPRowSet"*
  %18 = load %"class.soplex::SPxId"** %2, align 8
  %19 = bitcast %"class.soplex::SPxId"* %18 to %"class.soplex::DataKey"*
  %20 = call i32 @_ZNK6soplex8LPRowSet6numberERKNS_7DataKeyE(%"class.soplex::LPRowSet"* %17, %"class.soplex::DataKey"* dereferenceable(4) %19)
  br label %21

; <label>:21                                      ; preds = %14, %7
  %22 = phi i32 [ %13, %7 ], [ %20, %14 ]
  ret i32 %22
}

; Function Attrs: nounwind uwtable
define linkonce_odr i32 @_ZNK6soplex6SoPlex4isIdENS_5SPxIdE(%"class.soplex::SoPlex"* %this, %"class.soplex::SPxId"* %p_id) #2 align 2 {
  %1 = alloca %"class.soplex::SoPlex"*, align 8
  store %"class.soplex::SoPlex"* %this, %"class.soplex::SoPlex"** %1, align 8
  %2 = load %"class.soplex::SoPlex"** %1
  %3 = bitcast %"class.soplex::SPxId"* %p_id to %"class.soplex::DataKey"*
  %4 = bitcast %"class.soplex::DataKey"* %3 to i32*
  %5 = load i32* %4, align 4
  %6 = shl i32 %5, 24
  %7 = ashr i32 %6, 24
  %8 = getelementptr inbounds %"class.soplex::SoPlex"* %2, i32 0, i32 4
  %9 = load i32* %8, align 4
  %10 = mul nsw i32 %7, %9
  %11 = icmp sgt i32 %10, 0
  %12 = zext i1 %11 to i32
  ret i32 %12
}

; Function Attrs: nounwind uwtable
define linkonce_odr dereferenceable(8) double* @_ZN6soplex9DataArrayIdEixEi(%"class.soplex::DataArray.3"* %this, i32 %n) #2 align 2 {
  %1 = alloca %"class.soplex::DataArray.3"*, align 8
  %2 = alloca i32, align 4
  store %"class.soplex::DataArray.3"* %this, %"class.soplex::DataArray.3"** %1, align 8
  store i32 %n, i32* %2, align 4
  %3 = load %"class.soplex::DataArray.3"** %1
  %4 = load i32* %2, align 4
  %5 = icmp sge i32 %4, 0
  br i1 %5, label %6, label %7

; <label>:6                                       ; preds = %0
  br label %9

; <label>:7                                       ; preds = %0
  call void @__assert_fail(i8* getelementptr inbounds ([7 x i8]* @.str17, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8]* @.str18, i32 0, i32 0), i32 89, i8* getelementptr inbounds ([59 x i8]* @__PRETTY_FUNCTION__._ZN6soplex9DataArrayIdEixEi, i32 0, i32 0)) #10
  unreachable
                                                  ; No predecessors!
  br label %9

; <label>:9                                       ; preds = %8, %6
  %10 = load i32* %2, align 4
  %11 = getelementptr inbounds %"class.soplex::DataArray.3"* %3, i32 0, i32 0
  %12 = load i32* %11, align 4
  %13 = icmp slt i32 %10, %12
  br i1 %13, label %14, label %15

; <label>:14                                      ; preds = %9
  br label %17

; <label>:15                                      ; preds = %9
  call void @__assert_fail(i8* getelementptr inbounds ([12 x i8]* @.str19, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8]* @.str18, i32 0, i32 0), i32 90, i8* getelementptr inbounds ([59 x i8]* @__PRETTY_FUNCTION__._ZN6soplex9DataArrayIdEixEi, i32 0, i32 0)) #10
  unreachable
                                                  ; No predecessors!
  br label %17

; <label>:17                                      ; preds = %16, %14
  %18 = load i32* %2, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds %"class.soplex::DataArray.3"* %3, i32 0, i32 2
  %21 = load double** %20, align 8
  %22 = getelementptr inbounds double* %21, i64 %19
  ret double* %22
}

; Function Attrs: uwtable
define linkonce_odr dereferenceable(8) %"class.soplex::SVector"* @_ZNK6soplex8SPxBasis7baseVecEi(%"class.soplex::SPxBasis"* %this, i32 %i) #3 align 2 {
  %1 = alloca %"class.soplex::SPxBasis"*, align 8
  %2 = alloca i32, align 4
  store %"class.soplex::SPxBasis"* %this, %"class.soplex::SPxBasis"** %1, align 8
  store i32 %i, i32* %2, align 4
  %3 = load %"class.soplex::SPxBasis"** %1
  %4 = getelementptr inbounds %"class.soplex::SPxBasis"* %3, i32 0, i32 4
  %5 = load i8* %4, align 1
  %6 = trunc i8 %5 to i1
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %0
  br label %10

; <label>:8                                       ; preds = %0
  call void @__assert_fail(i8* getelementptr inbounds ([14 x i8]* @.str42, i32 0, i32 0), i8* getelementptr inbounds ([13 x i8]* @.str43, i32 0, i32 0), i32 429, i8* getelementptr inbounds ([60 x i8]* @__PRETTY_FUNCTION__._ZNK6soplex8SPxBasis7baseVecEi, i32 0, i32 0)) #10
  unreachable
                                                  ; No predecessors!
  br label %10

; <label>:10                                      ; preds = %9, %7
  %11 = getelementptr inbounds %"class.soplex::SPxBasis"* %3, i32 0, i32 3
  %12 = load i32* %2, align 4
  %13 = call dereferenceable(8) %"class.soplex::SVector"** @_ZNK6soplex9DataArrayIPKNS_7SVectorEEixEi(%"class.soplex::DataArray.1"* %11, i32 %12)
  %14 = load %"class.soplex::SVector"** %13
  ret %"class.soplex::SVector"* %14
}

; Function Attrs: nounwind uwtable
define linkonce_odr i32 @_ZNK6soplex7SVector4sizeEv(%"class.soplex::SVector"* %this) #2 align 2 {
  %1 = alloca i32, align 4
  %2 = alloca %"class.soplex::SVector"*, align 8
  store %"class.soplex::SVector"* %this, %"class.soplex::SVector"** %2, align 8
  %3 = load %"class.soplex::SVector"** %2
  %4 = getelementptr inbounds %"class.soplex::SVector"* %3, i32 0, i32 0
  %5 = load %"struct.soplex::SVector::Element"** %4, align 8
  %6 = icmp ne %"struct.soplex::SVector::Element"* %5, null
  br i1 %6, label %7, label %13

; <label>:7                                       ; preds = %0
  %8 = getelementptr inbounds %"class.soplex::SVector"* %3, i32 0, i32 0
  %9 = load %"struct.soplex::SVector::Element"** %8, align 8
  %10 = getelementptr inbounds %"struct.soplex::SVector::Element"* %9, i64 -1
  %11 = getelementptr inbounds %"struct.soplex::SVector::Element"* %10, i32 0, i32 1
  %12 = load i32* %11, align 4
  store i32 %12, i32* %1
  br label %14

; <label>:13                                      ; preds = %0
  store i32 0, i32* %1
  br label %14

; <label>:14                                      ; preds = %13, %7
  %15 = load i32* %1
  ret i32 %15
}

declare dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272), i8*) #0

; Function Attrs: uwtable
define linkonce_odr dereferenceable(8) %"class.soplex::SVector"* @_ZNK6soplex6SoPlex6vectorEi(%"class.soplex::SoPlex"* %this, i32 %i) #3 align 2 {
  %1 = alloca %"class.soplex::SoPlex"*, align 8
  %2 = alloca i32, align 4
  store %"class.soplex::SoPlex"* %this, %"class.soplex::SoPlex"** %1, align 8
  store i32 %i, i32* %2, align 4
  %3 = load %"class.soplex::SoPlex"** %1
  %4 = getelementptr inbounds %"class.soplex::SoPlex"* %3, i32 0, i32 22
  %5 = load %"class.soplex::SVSet"** %4, align 8
  %6 = load i32* %2, align 4
  %7 = call dereferenceable(8) %"class.soplex::SVector"* @_ZNK6soplex5SVSetixEi(%"class.soplex::SVSet"* %5, i32 %6)
  ret %"class.soplex::SVector"* %7
}

declare double @_ZNK6soplex7SVector7length2Ev(%"class.soplex::SVector"*) #0

; Function Attrs: uwtable
define void @_ZN6soplex10SPxSteepPR10setupPrefsEdddddiiii(%"class.soplex::SPxSteepPR"* %this, double %mult, double, double, double %shift, double %coshift, i32 %rs, i32 %cs, i32 %re, i32 %ce) #3 align 2 {
  %3 = alloca %"class.soplex::SPxSteepPR"*, align 8
  %4 = alloca double, align 8
  %5 = alloca double, align 8
  %6 = alloca double, align 8
  %7 = alloca double, align 8
  %8 = alloca double, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %p = alloca double*, align 8
  %cp = alloca double*, align 8
  %end = alloca double*, align 8
  %rshift = alloca double, align 8
  %cshift = alloca double, align 8
  %i = alloca i32, align 4
  store %"class.soplex::SPxSteepPR"* %this, %"class.soplex::SPxSteepPR"** %3, align 8
  store double %mult, double* %4, align 8
  store double %0, double* %5, align 8
  store double %1, double* %6, align 8
  store double %shift, double* %7, align 8
  store double %coshift, double* %8, align 8
  store i32 %rs, i32* %9, align 4
  store i32 %cs, i32* %10, align 4
  store i32 %re, i32* %11, align 4
  store i32 %ce, i32* %12, align 4
  %13 = load %"class.soplex::SPxSteepPR"** %3
  %14 = bitcast %"class.soplex::SPxSteepPR"* %13 to %"class.soplex::SPxPricer"*
  %15 = getelementptr inbounds %"class.soplex::SPxPricer"* %14, i32 0, i32 2
  %16 = load %"class.soplex::SoPlex"** %15, align 8
  %17 = call i32 @_ZNK6soplex6SoPlex3repEv(%"class.soplex::SoPlex"* %16)
  %18 = icmp eq i32 %17, 1
  br i1 %18, label %19, label %26

; <label>:19                                      ; preds = %2
  %20 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %13, i32 0, i32 10
  %21 = call double* @_ZN6soplex9DataArrayIdE7get_ptrEv(%"class.soplex::DataArray.3"* %20)
  store double* %21, double** %cp, align 8
  %22 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %13, i32 0, i32 9
  %23 = call double* @_ZN6soplex9DataArrayIdE7get_ptrEv(%"class.soplex::DataArray.3"* %22)
  store double* %23, double** %p, align 8
  %24 = load double* %7, align 8
  store double %24, double* %cshift, align 8
  %25 = load double* %8, align 8
  store double %25, double* %rshift, align 8
  br label %33

; <label>:26                                      ; preds = %2
  %27 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %13, i32 0, i32 10
  %28 = call double* @_ZN6soplex9DataArrayIdE7get_ptrEv(%"class.soplex::DataArray.3"* %27)
  store double* %28, double** %p, align 8
  %29 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %13, i32 0, i32 9
  %30 = call double* @_ZN6soplex9DataArrayIdE7get_ptrEv(%"class.soplex::DataArray.3"* %29)
  store double* %30, double** %cp, align 8
  %31 = load double* %7, align 8
  store double %31, double* %rshift, align 8
  %32 = load double* %8, align 8
  store double %32, double* %cshift, align 8
  br label %33

; <label>:33                                      ; preds = %26, %19
  %34 = load i32* %11, align 4
  %35 = icmp slt i32 %34, 0
  br i1 %35, label %36, label %42

; <label>:36                                      ; preds = %33
  %37 = bitcast %"class.soplex::SPxSteepPR"* %13 to %"class.soplex::SPxPricer"*
  %38 = getelementptr inbounds %"class.soplex::SPxPricer"* %37, i32 0, i32 2
  %39 = load %"class.soplex::SoPlex"** %38, align 8
  %40 = bitcast %"class.soplex::SoPlex"* %39 to %"class.soplex::SPxLP"*
  %41 = call i32 @_ZNK6soplex5SPxLP5nRowsEv(%"class.soplex::SPxLP"* %40)
  store i32 %41, i32* %11, align 4
  br label %42

; <label>:42                                      ; preds = %36, %33
  %43 = load i32* %11, align 4
  store i32 %43, i32* %i, align 4
  br label %44

; <label>:44                                      ; preds = %49, %42
  %45 = load i32* %i, align 4
  %46 = add nsw i32 %45, -1
  store i32 %46, i32* %i, align 4
  %47 = load i32* %9, align 4
  %48 = icmp sge i32 %46, %47
  br i1 %48, label %49, label %55

; <label>:49                                      ; preds = %44
  %50 = load double* %rshift, align 8
  %51 = load i32* %i, align 4
  %52 = sext i32 %51 to i64
  %53 = load double** %p, align 8
  %54 = getelementptr inbounds double* %53, i64 %52
  store double %50, double* %54, align 8
  br label %44

; <label>:55                                      ; preds = %44
  %56 = load i32* %12, align 4
  %57 = icmp slt i32 %56, 0
  br i1 %57, label %58, label %64

; <label>:58                                      ; preds = %55
  %59 = bitcast %"class.soplex::SPxSteepPR"* %13 to %"class.soplex::SPxPricer"*
  %60 = getelementptr inbounds %"class.soplex::SPxPricer"* %59, i32 0, i32 2
  %61 = load %"class.soplex::SoPlex"** %60, align 8
  %62 = bitcast %"class.soplex::SoPlex"* %61 to %"class.soplex::SPxLP"*
  %63 = call i32 @_ZNK6soplex5SPxLP5nColsEv(%"class.soplex::SPxLP"* %62)
  store i32 %63, i32* %12, align 4
  br label %64

; <label>:64                                      ; preds = %58, %55
  %65 = load i32* %12, align 4
  store i32 %65, i32* %i, align 4
  br label %66

; <label>:66                                      ; preds = %71, %64
  %67 = load i32* %i, align 4
  %68 = add nsw i32 %67, -1
  store i32 %68, i32* %i, align 4
  %69 = load i32* %10, align 4
  %70 = icmp sge i32 %68, %69
  br i1 %70, label %71, label %77

; <label>:71                                      ; preds = %66
  %72 = load double* %cshift, align 8
  %73 = load i32* %i, align 4
  %74 = sext i32 %73 to i64
  %75 = load double** %cp, align 8
  %76 = getelementptr inbounds double* %75, i64 %74
  store double %72, double* %76, align 8
  br label %66

; <label>:77                                      ; preds = %66
  store i32 0, i32* %i, align 4
  %78 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %13, i32 0, i32 9
  %79 = call double* @_ZN6soplex9DataArrayIdE7get_ptrEv(%"class.soplex::DataArray.3"* %78)
  store double* %79, double** %cp, align 8
  %80 = load double** %cp, align 8
  %81 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %13, i32 0, i32 9
  %82 = call i32 @_ZNK6soplex9DataArrayIdE4sizeEv(%"class.soplex::DataArray.3"* %81)
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds double* %80, i64 %83
  store double* %84, double** %end, align 8
  br label %85

; <label>:85                                      ; preds = %89, %77
  %86 = load double** %cp, align 8
  %87 = load double** %end, align 8
  %88 = icmp ult double* %86, %87
  br i1 %88, label %89, label %100

; <label>:89                                      ; preds = %85
  %90 = load double* %4, align 8
  %91 = load i32* %i, align 4
  %92 = add nsw i32 %91, 1
  store i32 %92, i32* %i, align 4
  %93 = sitofp i32 %91 to double
  %94 = fmul double %90, %93
  %95 = fsub double 1.000000e+00, %94
  %96 = load double** %cp, align 8
  %97 = getelementptr inbounds double* %96, i32 1
  store double* %97, double** %cp, align 8
  %98 = load double* %96, align 8
  %99 = fmul double %98, %95
  store double %99, double* %96, align 8
  br label %85

; <label>:100                                     ; preds = %85
  %101 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %13, i32 0, i32 10
  %102 = call double* @_ZN6soplex9DataArrayIdE7get_ptrEv(%"class.soplex::DataArray.3"* %101)
  store double* %102, double** %p, align 8
  %103 = load double** %p, align 8
  %104 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %13, i32 0, i32 10
  %105 = call i32 @_ZNK6soplex9DataArrayIdE4sizeEv(%"class.soplex::DataArray.3"* %104)
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds double* %103, i64 %106
  store double* %107, double** %end, align 8
  %108 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %13, i32 0, i32 10
  %109 = call i32 @_ZNK6soplex9DataArrayIdE4sizeEv(%"class.soplex::DataArray.3"* %108)
  store i32 %109, i32* %i, align 4
  br label %110

; <label>:110                                     ; preds = %114, %100
  %111 = load double** %p, align 8
  %112 = load double** %end, align 8
  %113 = icmp ult double* %111, %112
  br i1 %113, label %114, label %125

; <label>:114                                     ; preds = %110
  %115 = load double* %4, align 8
  %116 = load i32* %i, align 4
  %117 = add nsw i32 %116, -1
  store i32 %117, i32* %i, align 4
  %118 = sitofp i32 %116 to double
  %119 = fmul double %115, %118
  %120 = fadd double 1.000000e+00, %119
  %121 = load double** %p, align 8
  %122 = getelementptr inbounds double* %121, i32 1
  store double* %122, double** %p, align 8
  %123 = load double* %121, align 8
  %124 = fmul double %123, %120
  store double %124, double* %121, align 8
  br label %110

; <label>:125                                     ; preds = %110
  ret void
}

; Function Attrs: nounwind uwtable
define linkonce_odr i32 @_ZNK6soplex6SoPlex3repEv(%"class.soplex::SoPlex"* %this) #2 align 2 {
  %1 = alloca %"class.soplex::SoPlex"*, align 8
  store %"class.soplex::SoPlex"* %this, %"class.soplex::SoPlex"** %1, align 8
  %2 = load %"class.soplex::SoPlex"** %1
  %3 = getelementptr inbounds %"class.soplex::SoPlex"* %2, i32 0, i32 4
  %4 = load i32* %3, align 4
  ret i32 %4
}

; Function Attrs: nounwind uwtable
define linkonce_odr double* @_ZN6soplex9DataArrayIdE7get_ptrEv(%"class.soplex::DataArray.3"* %this) #2 align 2 {
  %1 = alloca %"class.soplex::DataArray.3"*, align 8
  store %"class.soplex::DataArray.3"* %this, %"class.soplex::DataArray.3"** %1, align 8
  %2 = load %"class.soplex::DataArray.3"** %1
  %3 = getelementptr inbounds %"class.soplex::DataArray.3"* %2, i32 0, i32 2
  %4 = load double** %3, align 8
  ret double* %4
}

; Function Attrs: uwtable
define linkonce_odr i32 @_ZNK6soplex5SPxLP5nRowsEv(%"class.soplex::SPxLP"* %this) #3 align 2 {
  %1 = alloca %"class.soplex::SPxLP"*, align 8
  store %"class.soplex::SPxLP"* %this, %"class.soplex::SPxLP"** %1, align 8
  %2 = load %"class.soplex::SPxLP"** %1
  %3 = bitcast %"class.soplex::SPxLP"* %2 to i8*
  %4 = getelementptr inbounds i8* %3, i64 8
  %5 = bitcast i8* %4 to %"class.soplex::LPRowSet"*
  %6 = call i32 @_ZNK6soplex8LPRowSet3numEv(%"class.soplex::LPRowSet"* %5)
  ret i32 %6
}

; Function Attrs: uwtable
define linkonce_odr i32 @_ZNK6soplex5SPxLP5nColsEv(%"class.soplex::SPxLP"* %this) #3 align 2 {
  %1 = alloca %"class.soplex::SPxLP"*, align 8
  store %"class.soplex::SPxLP"* %this, %"class.soplex::SPxLP"** %1, align 8
  %2 = load %"class.soplex::SPxLP"** %1
  %3 = bitcast %"class.soplex::SPxLP"* %2 to i8*
  %4 = getelementptr inbounds i8* %3, i64 160
  %5 = bitcast i8* %4 to %"class.soplex::LPColSet"*
  %6 = call i32 @_ZNK6soplex8LPColSet3numEv(%"class.soplex::LPColSet"* %5)
  ret i32 %6
}

; Function Attrs: nounwind uwtable
define linkonce_odr i32 @_ZNK6soplex9DataArrayIdE4sizeEv(%"class.soplex::DataArray.3"* %this) #2 align 2 {
  %1 = alloca %"class.soplex::DataArray.3"*, align 8
  store %"class.soplex::DataArray.3"* %this, %"class.soplex::DataArray.3"** %1, align 8
  %2 = load %"class.soplex::DataArray.3"** %1
  %3 = getelementptr inbounds %"class.soplex::DataArray.3"* %2, i32 0, i32 0
  %4 = load i32* %3, align 4
  ret i32 %4
}

; Function Attrs: uwtable
define void @_ZN6soplex10SPxSteepPR6setRepENS_6SoPlex14RepresentationE(%"class.soplex::SPxSteepPR"* %this, i32) unnamed_addr #3 align 2 {
  %2 = alloca %"class.soplex::SPxSteepPR"*, align 8
  %3 = alloca i32, align 4
  %tmp = alloca %"class.soplex::DVector", align 8
  %4 = alloca i8*
  %5 = alloca i32
  store %"class.soplex::SPxSteepPR"* %this, %"class.soplex::SPxSteepPR"** %2, align 8
  store i32 %0, i32* %3, align 4
  %6 = load %"class.soplex::SPxSteepPR"** %2
  %7 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %6, i32 0, i32 3
  %8 = bitcast %"class.soplex::DVector"* %7 to %"class.soplex::Vector"*
  %9 = call i32 @_ZNK6soplex6Vector3dimEv(%"class.soplex::Vector"* %8)
  %10 = bitcast %"class.soplex::SPxSteepPR"* %6 to %"class.soplex::SPxPricer"*
  %11 = getelementptr inbounds %"class.soplex::SPxPricer"* %10, i32 0, i32 2
  %12 = load %"class.soplex::SoPlex"** %11, align 8
  %13 = call i32 @_ZNK6soplex6SoPlex3dimEv(%"class.soplex::SoPlex"* %12)
  %14 = icmp ne i32 %9, %13
  br i1 %14, label %15, label %39

; <label>:15                                      ; preds = %1
  %16 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %6, i32 0, i32 1
  call void @_ZN6soplex7DVectorC1ERKS0_(%"class.soplex::DVector"* %tmp, %"class.soplex::DVector"* dereferenceable(32) %16)
  %17 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %6, i32 0, i32 1
  %18 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %6, i32 0, i32 2
  %19 = invoke dereferenceable(32) %"class.soplex::DVector"* @_ZN6soplex7DVectoraSERKS0_(%"class.soplex::DVector"* %17, %"class.soplex::DVector"* dereferenceable(32) %18)
          to label %20 unwind label %34

; <label>:20                                      ; preds = %15
  %21 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %6, i32 0, i32 2
  %22 = invoke dereferenceable(32) %"class.soplex::DVector"* @_ZN6soplex7DVectoraSERKS0_(%"class.soplex::DVector"* %21, %"class.soplex::DVector"* dereferenceable(32) %tmp)
          to label %23 unwind label %34

; <label>:23                                      ; preds = %20
  %24 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %6, i32 0, i32 3
  %25 = bitcast %"class.soplex::DVector"* %24 to %"class.soplex::Vector"*
  invoke void @_ZN6soplex6Vector5clearEv(%"class.soplex::Vector"* %25)
          to label %26 unwind label %34

; <label>:26                                      ; preds = %23
  %27 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %6, i32 0, i32 3
  %28 = bitcast %"class.soplex::SPxSteepPR"* %6 to %"class.soplex::SPxPricer"*
  %29 = getelementptr inbounds %"class.soplex::SPxPricer"* %28, i32 0, i32 2
  %30 = load %"class.soplex::SoPlex"** %29, align 8
  %31 = invoke i32 @_ZNK6soplex6SoPlex3dimEv(%"class.soplex::SoPlex"* %30)
          to label %32 unwind label %34

; <label>:32                                      ; preds = %26
  invoke void @_ZN6soplex7DVector5reDimEi(%"class.soplex::DVector"* %27, i32 %31)
          to label %33 unwind label %34

; <label>:33                                      ; preds = %32
  call void @_ZN6soplex7DVectorD1Ev(%"class.soplex::DVector"* %tmp)
  br label %39

; <label>:34                                      ; preds = %32, %26, %23, %20, %15
  %35 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
  %36 = extractvalue { i8*, i32 } %35, 0
  store i8* %36, i8** %4
  %37 = extractvalue { i8*, i32 } %35, 1
  store i32 %37, i32* %5
  invoke void @_ZN6soplex7DVectorD1Ev(%"class.soplex::DVector"* %tmp)
          to label %38 unwind label %45

; <label>:38                                      ; preds = %34
  br label %40

; <label>:39                                      ; preds = %33, %1
  ret void

; <label>:40                                      ; preds = %38
  %41 = load i8** %4
  %42 = load i32* %5
  %43 = insertvalue { i8*, i32 } undef, i8* %41, 0
  %44 = insertvalue { i8*, i32 } %43, i32 %42, 1
  resume { i8*, i32 } %44

; <label>:45                                      ; preds = %34
  %46 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          catch i8* null
  %47 = extractvalue { i8*, i32 } %46, 0
  call void @__clang_call_terminate(i8* %47) #10
  unreachable
}

; Function Attrs: nounwind uwtable
define linkonce_odr i32 @_ZNK6soplex6Vector3dimEv(%"class.soplex::Vector"* %this) #2 align 2 {
  %1 = alloca %"class.soplex::Vector"*, align 8
  store %"class.soplex::Vector"* %this, %"class.soplex::Vector"** %1, align 8
  %2 = load %"class.soplex::Vector"** %1
  %3 = getelementptr inbounds %"class.soplex::Vector"* %2, i32 0, i32 0
  %4 = load i32* %3, align 4
  ret i32 %4
}

declare void @_ZN6soplex7DVectorC1ERKS0_(%"class.soplex::DVector"*, %"class.soplex::DVector"* dereferenceable(32)) #0

; Function Attrs: uwtable
define linkonce_odr dereferenceable(32) %"class.soplex::DVector"* @_ZN6soplex7DVectoraSERKS0_(%"class.soplex::DVector"* %this, %"class.soplex::DVector"* dereferenceable(32) %vec) #3 align 2 {
  %1 = alloca %"class.soplex::DVector"*, align 8
  %2 = alloca %"class.soplex::DVector"*, align 8
  store %"class.soplex::DVector"* %this, %"class.soplex::DVector"** %1, align 8
  store %"class.soplex::DVector"* %vec, %"class.soplex::DVector"** %2, align 8
  %3 = load %"class.soplex::DVector"** %1
  %4 = load %"class.soplex::DVector"** %2, align 8
  %5 = icmp ne %"class.soplex::DVector"* %3, %4
  br i1 %5, label %6, label %22

; <label>:6                                       ; preds = %0
  %7 = load %"class.soplex::DVector"** %2, align 8
  %8 = bitcast %"class.soplex::DVector"* %7 to %"class.soplex::Vector"*
  %9 = call i32 @_ZNK6soplex6Vector3dimEv(%"class.soplex::Vector"* %8)
  %10 = bitcast %"class.soplex::DVector"* %3 to %"class.soplex::Vector"*
  %11 = call i32 @_ZNK6soplex6Vector3dimEv(%"class.soplex::Vector"* %10)
  %12 = icmp ne i32 %9, %11
  br i1 %12, label %13, label %17

; <label>:13                                      ; preds = %6
  %14 = load %"class.soplex::DVector"** %2, align 8
  %15 = bitcast %"class.soplex::DVector"* %14 to %"class.soplex::Vector"*
  %16 = call i32 @_ZNK6soplex6Vector3dimEv(%"class.soplex::Vector"* %15)
  call void @_ZN6soplex7DVector5reDimEi(%"class.soplex::DVector"* %3, i32 %16)
  br label %17

; <label>:17                                      ; preds = %13, %6
  %18 = bitcast %"class.soplex::DVector"* %3 to %"class.soplex::Vector"*
  %19 = load %"class.soplex::DVector"** %2, align 8
  %20 = bitcast %"class.soplex::DVector"* %19 to %"class.soplex::Vector"*
  %21 = call dereferenceable(16) %"class.soplex::Vector"* @_ZN6soplex6VectoraSERKS0_(%"class.soplex::Vector"* %18, %"class.soplex::Vector"* dereferenceable(16) %20)
  br label %22

; <label>:22                                      ; preds = %17, %0
  ret %"class.soplex::DVector"* %3
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
  %1 = alloca %"class.soplex::SPxSteepPR"*, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %x = alloca double, align 8
  %delta = alloca double, align 8
  %coPenalty_ptr = alloca double*, align 8
  %workVec_ptr = alloca double*, align 8
  %rhoVec = alloca double*, align 8
  %rhov_1 = alloca double, align 8
  %beta_q = alloca double, align 8
  %rhoIdx = alloca %"class.soplex::IdxSet"*, align 8
  %len = alloca i32, align 4
  store %"class.soplex::SPxSteepPR"* %this, %"class.soplex::SPxSteepPR"** %1, align 8
  store i32 %n, i32* %2, align 4
  store i32 %start, i32* %3, align 4
  store i32 %incr, i32* %4, align 4
  %5 = load %"class.soplex::SPxSteepPR"** %1
  %6 = bitcast %"class.soplex::SPxSteepPR"* %5 to %"class.soplex::SPxPricer"*
  %7 = getelementptr inbounds %"class.soplex::SPxPricer"* %6, i32 0, i32 2
  %8 = load %"class.soplex::SoPlex"** %7, align 8
  %9 = call i32 @_ZNK6soplex6SoPlex4typeEv(%"class.soplex::SoPlex"* %8)
  %10 = icmp eq i32 %9, 1
  br i1 %10, label %11, label %12

; <label>:11                                      ; preds = %0
  br label %14

; <label>:12                                      ; preds = %0
  call void @__assert_fail(i8* getelementptr inbounds ([35 x i8]* @.str3, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8]* @.str1, i32 0, i32 0), i32 225, i8* getelementptr inbounds ([62 x i8]* @__PRETTY_FUNCTION__._ZN6soplex10SPxSteepPR6left4XEiNS_5SPxIdEii, i32 0, i32 0)) #10
  unreachable
                                                  ; No predecessors!
  br label %14

; <label>:14                                      ; preds = %13, %11
  %15 = call zeroext i1 @_ZNK6soplex5SPxId7isValidEv(%"class.soplex::SPxId"* %id)
  br i1 %15, label %16, label %161

; <label>:16                                      ; preds = %14
  %17 = bitcast %"class.soplex::SPxSteepPR"* %5 to %"class.soplex::SPxPricer"*
  %18 = getelementptr inbounds %"class.soplex::SPxPricer"* %17, i32 0, i32 2
  %19 = load %"class.soplex::SoPlex"** %18, align 8
  %20 = call dereferenceable(208) %"class.soplex::SPxBasis"* @_ZN6soplex6SoPlex5basisEv(%"class.soplex::SoPlex"* %19)
  %21 = call i32 @_ZNK6soplex8SPxBasis9iterationEv(%"class.soplex::SPxBasis"* %20)
  %22 = sitofp i32 %21 to double
  %23 = fdiv double 1.000000e+00, %22
  %24 = fadd double 1.000000e-01, %23
  store double %24, double* %delta, align 8
  %25 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %5, i32 0, i32 2
  %26 = bitcast %"class.soplex::DVector"* %25 to %"class.soplex::Vector"*
  %27 = call double* @_ZN6soplex6Vector7get_ptrEv(%"class.soplex::Vector"* %26)
  store double* %27, double** %coPenalty_ptr, align 8
  %28 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %5, i32 0, i32 3
  %29 = bitcast %"class.soplex::DVector"* %28 to %"class.soplex::Vector"*
  %30 = call double* @_ZNK6soplex6Vector13get_const_ptrEv(%"class.soplex::Vector"* %29)
  store double* %30, double** %workVec_ptr, align 8
  %31 = bitcast %"class.soplex::SPxSteepPR"* %5 to %"class.soplex::SPxPricer"*
  %32 = getelementptr inbounds %"class.soplex::SPxPricer"* %31, i32 0, i32 2
  %33 = load %"class.soplex::SoPlex"** %32, align 8
  %34 = call dereferenceable(104) %"class.soplex::UpdateVector"* @_ZNK6soplex6SoPlex4fVecEv(%"class.soplex::SoPlex"* %33)
  %35 = call dereferenceable(64) %"class.soplex::SSVector"* @_ZN6soplex12UpdateVector5deltaEv(%"class.soplex::UpdateVector"* %34)
  %36 = call double* @_ZNK6soplex8SSVector6valuesEv(%"class.soplex::SSVector"* %35)
  store double* %36, double** %rhoVec, align 8
  %37 = load i32* %2, align 4
  %38 = sext i32 %37 to i64
  %39 = load double** %rhoVec, align 8
  %40 = getelementptr inbounds double* %39, i64 %38
  %41 = load double* %40, align 8
  %42 = fdiv double 1.000000e+00, %41
  store double %42, double* %rhov_1, align 8
  %43 = bitcast %"class.soplex::SPxSteepPR"* %5 to %"class.soplex::SPxPricer"*
  %44 = getelementptr inbounds %"class.soplex::SPxPricer"* %43, i32 0, i32 2
  %45 = load %"class.soplex::SoPlex"** %44, align 8
  %46 = call dereferenceable(104) %"class.soplex::UpdateVector"* @_ZNK6soplex6SoPlex6coPvecEv(%"class.soplex::SoPlex"* %45)
  %47 = call dereferenceable(64) %"class.soplex::SSVector"* @_ZN6soplex12UpdateVector5deltaEv(%"class.soplex::UpdateVector"* %46)
  %48 = call double @_ZNK6soplex8SSVector7length2Ev(%"class.soplex::SSVector"* %47)
  %49 = load double* %rhov_1, align 8
  %50 = fmul double %48, %49
  %51 = load double* %rhov_1, align 8
  %52 = fmul double %50, %51
  store double %52, double* %beta_q, align 8
  %53 = load i32* %2, align 4
  %54 = sext i32 %53 to i64
  %55 = load double** %rhoVec, align 8
  %56 = getelementptr inbounds double* %55, i64 %54
  %57 = load double* %56, align 8
  %58 = bitcast %"class.soplex::SPxSteepPR"* %5 to %"class.soplex::SPxPricer"*
  %59 = getelementptr inbounds %"class.soplex::SPxPricer"* %58, i32 0, i32 3
  %60 = load double* %59, align 8
  %61 = fcmp oge double %57, %60
  br i1 %61, label %73, label %62

; <label>:62                                      ; preds = %16
  %63 = load i32* %2, align 4
  %64 = sext i32 %63 to i64
  %65 = load double** %rhoVec, align 8
  %66 = getelementptr inbounds double* %65, i64 %64
  %67 = load double* %66, align 8
  %68 = fsub double -0.000000e+00, %67
  %69 = bitcast %"class.soplex::SPxSteepPR"* %5 to %"class.soplex::SPxPricer"*
  %70 = getelementptr inbounds %"class.soplex::SPxPricer"* %69, i32 0, i32 3
  %71 = load double* %70, align 8
  %72 = fcmp oge double %68, %71
  br i1 %72, label %73, label %74

; <label>:73                                      ; preds = %62, %16
  br label %76

; <label>:74                                      ; preds = %62
  call void @__assert_fail(i8* getelementptr inbounds ([44 x i8]* @.str4, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8]* @.str1, i32 0, i32 0), i32 240, i8* getelementptr inbounds ([62 x i8]* @__PRETTY_FUNCTION__._ZN6soplex10SPxSteepPR6left4XEiNS_5SPxIdEii, i32 0, i32 0)) #10
  unreachable
                                                  ; No predecessors!
  br label %76

; <label>:76                                      ; preds = %75, %73
  %77 = bitcast %"class.soplex::SPxSteepPR"* %5 to %"class.soplex::SPxPricer"*
  %78 = getelementptr inbounds %"class.soplex::SPxPricer"* %77, i32 0, i32 2
  %79 = load %"class.soplex::SoPlex"** %78, align 8
  %80 = call dereferenceable(104) %"class.soplex::UpdateVector"* @_ZNK6soplex6SoPlex4fVecEv(%"class.soplex::SoPlex"* %79)
  %81 = call dereferenceable(16) %"class.soplex::IdxSet"* @_ZNK6soplex12UpdateVector3idxEv(%"class.soplex::UpdateVector"* %80)
  store %"class.soplex::IdxSet"* %81, %"class.soplex::IdxSet"** %rhoIdx, align 8
  %82 = bitcast %"class.soplex::SPxSteepPR"* %5 to %"class.soplex::SPxPricer"*
  %83 = getelementptr inbounds %"class.soplex::SPxPricer"* %82, i32 0, i32 2
  %84 = load %"class.soplex::SoPlex"** %83, align 8
  %85 = call dereferenceable(104) %"class.soplex::UpdateVector"* @_ZNK6soplex6SoPlex4fVecEv(%"class.soplex::SoPlex"* %84)
  %86 = call dereferenceable(16) %"class.soplex::IdxSet"* @_ZNK6soplex12UpdateVector3idxEv(%"class.soplex::UpdateVector"* %85)
  %87 = call i32 @_ZNK6soplex6IdxSet4sizeEv(%"class.soplex::IdxSet"* %86)
  store i32 %87, i32* %len, align 4
  %88 = load i32* %len, align 4
  %89 = sub nsw i32 %88, 1
  %90 = load i32* %3, align 4
  %91 = sub nsw i32 %89, %90
  store i32 %91, i32* %i, align 4
  br label %92

; <label>:92                                      ; preds = %151, %76
  %93 = load i32* %i, align 4
  %94 = icmp sge i32 %93, 0
  br i1 %94, label %95, label %155

; <label>:95                                      ; preds = %92
  %96 = load %"class.soplex::IdxSet"** %rhoIdx, align 8
  %97 = load i32* %i, align 4
  %98 = call i32 @_ZNK6soplex6IdxSet5indexEi(%"class.soplex::IdxSet"* %96, i32 %97)
  store i32 %98, i32* %j, align 4
  %99 = load i32* %j, align 4
  %100 = sext i32 %99 to i64
  %101 = load double** %rhoVec, align 8
  %102 = getelementptr inbounds double* %101, i64 %100
  %103 = load double* %102, align 8
  %104 = load double* %beta_q, align 8
  %105 = load i32* %j, align 4
  %106 = sext i32 %105 to i64
  %107 = load double** %rhoVec, align 8
  %108 = getelementptr inbounds double* %107, i64 %106
  %109 = load double* %108, align 8
  %110 = fmul double %104, %109
  %111 = load double* %rhov_1, align 8
  %112 = fmul double 2.000000e+00, %111
  %113 = load i32* %j, align 4
  %114 = sext i32 %113 to i64
  %115 = load double** %workVec_ptr, align 8
  %116 = getelementptr inbounds double* %115, i64 %114
  %117 = load double* %116, align 8
  %118 = fmul double %112, %117
  %119 = fsub double %110, %118
  %120 = fmul double %103, %119
  %121 = load i32* %j, align 4
  %122 = sext i32 %121 to i64
  %123 = load double** %coPenalty_ptr, align 8
  %124 = getelementptr inbounds double* %123, i64 %122
  %125 = load double* %124, align 8
  %126 = fadd double %125, %120
  store double %126, double* %124, align 8
  store double %126, double* %x, align 8
  %127 = load double* %x, align 8
  %128 = load double* %delta, align 8
  %129 = fcmp olt double %127, %128
  br i1 %129, label %130, label %136

; <label>:130                                     ; preds = %95
  %131 = load double* %delta, align 8
  %132 = load i32* %j, align 4
  %133 = sext i32 %132 to i64
  %134 = load double** %coPenalty_ptr, align 8
  %135 = getelementptr inbounds double* %134, i64 %133
  store double %131, double* %135, align 8
  br label %150

; <label>:136                                     ; preds = %95
  %137 = load double* %x, align 8
  %138 = load double* @_ZN6soplex8infinityE, align 8
  %139 = fcmp oge double %137, %138
  br i1 %139, label %140, label %149

; <label>:140                                     ; preds = %136
  %141 = bitcast %"class.soplex::SPxSteepPR"* %5 to %"class.soplex::SPxPricer"*
  %142 = getelementptr inbounds %"class.soplex::SPxPricer"* %141, i32 0, i32 3
  %143 = load double* %142, align 8
  %144 = fdiv double 1.000000e+00, %143
  %145 = load i32* %j, align 4
  %146 = sext i32 %145 to i64
  %147 = load double** %coPenalty_ptr, align 8
  %148 = getelementptr inbounds double* %147, i64 %146
  store double %144, double* %148, align 8
  br label %149

; <label>:149                                     ; preds = %140, %136
  br label %150

; <label>:150                                     ; preds = %149, %130
  br label %151

; <label>:151                                     ; preds = %150
  %152 = load i32* %4, align 4
  %153 = load i32* %i, align 4
  %154 = sub nsw i32 %153, %152
  store i32 %154, i32* %i, align 4
  br label %92

; <label>:155                                     ; preds = %92
  %156 = load double* %beta_q, align 8
  %157 = load i32* %2, align 4
  %158 = sext i32 %157 to i64
  %159 = load double** %coPenalty_ptr, align 8
  %160 = getelementptr inbounds double* %159, i64 %158
  store double %156, double* %160, align 8
  br label %161

; <label>:161                                     ; preds = %155, %14
  ret void
}

; Function Attrs: nounwind uwtable
define linkonce_odr i32 @_ZNK6soplex6SoPlex4typeEv(%"class.soplex::SoPlex"* %this) #2 align 2 {
  %1 = alloca %"class.soplex::SoPlex"*, align 8
  store %"class.soplex::SoPlex"* %this, %"class.soplex::SoPlex"** %1, align 8
  %2 = load %"class.soplex::SoPlex"** %1
  %3 = getelementptr inbounds %"class.soplex::SoPlex"* %2, i32 0, i32 2
  %4 = load i32* %3, align 4
  ret i32 %4
}

; Function Attrs: nounwind uwtable
define linkonce_odr zeroext i1 @_ZNK6soplex5SPxId7isValidEv(%"class.soplex::SPxId"* %this) #2 align 2 {
  %1 = alloca %"class.soplex::SPxId"*, align 8
  store %"class.soplex::SPxId"* %this, %"class.soplex::SPxId"** %1, align 8
  %2 = load %"class.soplex::SPxId"** %1
  %3 = bitcast %"class.soplex::SPxId"* %2 to %"class.soplex::DataKey"*
  %4 = bitcast %"class.soplex::DataKey"* %3 to i32*
  %5 = load i32* %4, align 4
  %6 = shl i32 %5, 24
  %7 = ashr i32 %6, 24
  %8 = icmp ne i32 %7, 0
  ret i1 %8
}

; Function Attrs: nounwind uwtable
define linkonce_odr i32 @_ZNK6soplex8SPxBasis9iterationEv(%"class.soplex::SPxBasis"* %this) #2 align 2 {
  %1 = alloca %"class.soplex::SPxBasis"*, align 8
  store %"class.soplex::SPxBasis"* %this, %"class.soplex::SPxBasis"** %1, align 8
  %2 = load %"class.soplex::SPxBasis"** %1
  %3 = getelementptr inbounds %"class.soplex::SPxBasis"* %2, i32 0, i32 9
  %4 = load i32* %3, align 4
  ret i32 %4
}

; Function Attrs: nounwind uwtable
define linkonce_odr double* @_ZN6soplex6Vector7get_ptrEv(%"class.soplex::Vector"* %this) #2 align 2 {
  %1 = alloca %"class.soplex::Vector"*, align 8
  store %"class.soplex::Vector"* %this, %"class.soplex::Vector"** %1, align 8
  %2 = load %"class.soplex::Vector"** %1
  %3 = getelementptr inbounds %"class.soplex::Vector"* %2, i32 0, i32 1
  %4 = load double** %3, align 8
  ret double* %4
}

; Function Attrs: nounwind uwtable
define linkonce_odr double* @_ZNK6soplex6Vector13get_const_ptrEv(%"class.soplex::Vector"* %this) #2 align 2 {
  %1 = alloca %"class.soplex::Vector"*, align 8
  store %"class.soplex::Vector"* %this, %"class.soplex::Vector"** %1, align 8
  %2 = load %"class.soplex::Vector"** %1
  %3 = getelementptr inbounds %"class.soplex::Vector"* %2, i32 0, i32 1
  %4 = load double** %3, align 8
  ret double* %4
}

; Function Attrs: nounwind uwtable
define linkonce_odr dereferenceable(104) %"class.soplex::UpdateVector"* @_ZNK6soplex6SoPlex4fVecEv(%"class.soplex::SoPlex"* %this) #2 align 2 {
  %1 = alloca %"class.soplex::SoPlex"*, align 8
  store %"class.soplex::SoPlex"* %this, %"class.soplex::SoPlex"** %1, align 8
  %2 = load %"class.soplex::SoPlex"** %1
  %3 = getelementptr inbounds %"class.soplex::SoPlex"* %2, i32 0, i32 38
  %4 = load %"class.soplex::UpdateVector"** %3, align 8
  ret %"class.soplex::UpdateVector"* %4
}

; Function Attrs: nounwind uwtable
define linkonce_odr dereferenceable(64) %"class.soplex::SSVector"* @_ZN6soplex12UpdateVector5deltaEv(%"class.soplex::UpdateVector"* %this) #2 align 2 {
  %1 = alloca %"class.soplex::UpdateVector"*, align 8
  store %"class.soplex::UpdateVector"* %this, %"class.soplex::UpdateVector"** %1, align 8
  %2 = load %"class.soplex::UpdateVector"** %1
  %3 = getelementptr inbounds %"class.soplex::UpdateVector"* %2, i32 0, i32 2
  ret %"class.soplex::SSVector"* %3
}

; Function Attrs: nounwind uwtable
define linkonce_odr double* @_ZNK6soplex8SSVector6valuesEv(%"class.soplex::SSVector"* %this) #2 align 2 {
  %1 = alloca %"class.soplex::SSVector"*, align 8
  store %"class.soplex::SSVector"* %this, %"class.soplex::SSVector"** %1, align 8
  %2 = load %"class.soplex::SSVector"** %1
  %3 = bitcast %"class.soplex::SSVector"* %2 to %"class.soplex::Vector"*
  %4 = getelementptr inbounds %"class.soplex::Vector"* %3, i32 0, i32 1
  %5 = load double** %4, align 8
  ret double* %5
}

; Function Attrs: nounwind uwtable
define linkonce_odr dereferenceable(104) %"class.soplex::UpdateVector"* @_ZNK6soplex6SoPlex6coPvecEv(%"class.soplex::SoPlex"* %this) #2 align 2 {
  %1 = alloca %"class.soplex::SoPlex"*, align 8
  store %"class.soplex::SoPlex"* %this, %"class.soplex::SoPlex"** %1, align 8
  %2 = load %"class.soplex::SoPlex"** %1
  %3 = getelementptr inbounds %"class.soplex::SoPlex"* %2, i32 0, i32 40
  %4 = load %"class.soplex::UpdateVector"** %3, align 8
  ret %"class.soplex::UpdateVector"* %4
}

declare double @_ZNK6soplex8SSVector7length2Ev(%"class.soplex::SSVector"*) #0

; Function Attrs: uwtable
define linkonce_odr dereferenceable(16) %"class.soplex::IdxSet"* @_ZNK6soplex12UpdateVector3idxEv(%"class.soplex::UpdateVector"* %this) #3 align 2 {
  %1 = alloca %"class.soplex::UpdateVector"*, align 8
  store %"class.soplex::UpdateVector"* %this, %"class.soplex::UpdateVector"** %1, align 8
  %2 = load %"class.soplex::UpdateVector"** %1
  %3 = getelementptr inbounds %"class.soplex::UpdateVector"* %2, i32 0, i32 2
  %4 = call dereferenceable(16) %"class.soplex::IdxSet"* @_ZNK6soplex8SSVector7indicesEv(%"class.soplex::SSVector"* %3)
  ret %"class.soplex::IdxSet"* %4
}

; Function Attrs: nounwind uwtable
define linkonce_odr i32 @_ZNK6soplex6IdxSet4sizeEv(%"class.soplex::IdxSet"* %this) #2 align 2 {
  %1 = alloca %"class.soplex::IdxSet"*, align 8
  store %"class.soplex::IdxSet"* %this, %"class.soplex::IdxSet"** %1, align 8
  %2 = load %"class.soplex::IdxSet"** %1
  %3 = getelementptr inbounds %"class.soplex::IdxSet"* %2, i32 0, i32 0
  %4 = load i32* %3, align 4
  ret i32 %4
}

; Function Attrs: uwtable
define linkonce_odr i32 @_ZNK6soplex6IdxSet5indexEi(%"class.soplex::IdxSet"* %this, i32 %n) #3 align 2 {
  %1 = alloca %"class.soplex::IdxSet"*, align 8
  %2 = alloca i32, align 4
  store %"class.soplex::IdxSet"* %this, %"class.soplex::IdxSet"** %1, align 8
  store i32 %n, i32* %2, align 4
  %3 = load %"class.soplex::IdxSet"** %1
  %4 = load i32* %2, align 4
  %5 = icmp sge i32 %4, 0
  br i1 %5, label %6, label %11

; <label>:6                                       ; preds = %0
  %7 = load i32* %2, align 4
  %8 = call i32 @_ZNK6soplex6IdxSet4sizeEv(%"class.soplex::IdxSet"* %3)
  %9 = icmp slt i32 %7, %8
  br i1 %9, label %10, label %11

; <label>:10                                      ; preds = %6
  br label %13

; <label>:11                                      ; preds = %6, %0
  call void @__assert_fail(i8* getelementptr inbounds ([21 x i8]* @.str35, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8]* @.str30, i32 0, i32 0), i32 69, i8* getelementptr inbounds ([37 x i8]* @__PRETTY_FUNCTION__._ZNK6soplex6IdxSet5indexEi, i32 0, i32 0)) #10
  unreachable
                                                  ; No predecessors!
  br label %13

; <label>:13                                      ; preds = %12, %10
  %14 = load i32* %2, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds %"class.soplex::IdxSet"* %3, i32 0, i32 2
  %17 = load i32** %16, align 8
  %18 = getelementptr inbounds i32* %17, i64 %15
  %19 = load i32* %18, align 4
  ret i32 %19
}

; Function Attrs: uwtable
define void @_ZN6soplex10SPxSteepPR5left4EiNS_5SPxIdE(%"class.soplex::SPxSteepPR"* %this, i32 %n, %"class.soplex::SPxId"* %id) unnamed_addr #3 align 2 {
  %1 = alloca %"class.soplex::SPxSteepPR"*, align 8
  %2 = alloca i32, align 4
  %3 = alloca %"class.soplex::SPxId", align 4
  %4 = alloca %"class.soplex::SPxId", align 4
  %5 = alloca %"class.soplex::SPxId", align 4
  store %"class.soplex::SPxSteepPR"* %this, %"class.soplex::SPxSteepPR"** %1, align 8
  store i32 %n, i32* %2, align 4
  %6 = load %"class.soplex::SPxSteepPR"** %1
  %7 = bitcast %"class.soplex::SPxSteepPR"* %6 to %"class.soplex::SPxPricer"*
  %8 = getelementptr inbounds %"class.soplex::SPxPricer"* %7, i32 0, i32 2
  %9 = load %"class.soplex::SoPlex"** %8, align 8
  call void @_ZN6soplex5SPxIdC2ERKS0_(%"class.soplex::SPxId"* %3, %"class.soplex::SPxId"* dereferenceable(4) %id)
  %10 = call i32 @_ZNK6soplex6SoPlex4isIdENS_5SPxIdE(%"class.soplex::SoPlex"* %9, %"class.soplex::SPxId"* %3)
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %12, label %24

; <label>:12                                      ; preds = %0
  %13 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %6, i32 0, i32 10
  %14 = bitcast %"class.soplex::SPxSteepPR"* %6 to %"class.soplex::SPxPricer"*
  %15 = getelementptr inbounds %"class.soplex::SPxPricer"* %14, i32 0, i32 2
  %16 = load %"class.soplex::SoPlex"** %15, align 8
  %17 = bitcast %"class.soplex::SoPlex"* %16 to %"class.soplex::SPxLP"*
  %18 = call i32 @_ZNK6soplex5SPxLP6numberERKNS_5SPxIdE(%"class.soplex::SPxLP"* %17, %"class.soplex::SPxId"* dereferenceable(4) %id)
  %19 = call dereferenceable(8) double* @_ZN6soplex9DataArrayIdEixEi(%"class.soplex::DataArray.3"* %13, i32 %18)
  %20 = load double* %19
  %21 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %6, i32 0, i32 11
  %22 = load i32* %2, align 4
  %23 = call dereferenceable(8) double* @_ZN6soplex9DataArrayIdEixEi(%"class.soplex::DataArray.3"* %21, i32 %22)
  store double %20, double* %23
  br label %43

; <label>:24                                      ; preds = %0
  %25 = bitcast %"class.soplex::SPxSteepPR"* %6 to %"class.soplex::SPxPricer"*
  %26 = getelementptr inbounds %"class.soplex::SPxPricer"* %25, i32 0, i32 2
  %27 = load %"class.soplex::SoPlex"** %26, align 8
  call void @_ZN6soplex5SPxIdC2ERKS0_(%"class.soplex::SPxId"* %4, %"class.soplex::SPxId"* dereferenceable(4) %id)
  %28 = call i32 @_ZNK6soplex6SoPlex6isCoIdENS_5SPxIdE(%"class.soplex::SoPlex"* %27, %"class.soplex::SPxId"* %4)
  %29 = icmp ne i32 %28, 0
  br i1 %29, label %30, label %42

; <label>:30                                      ; preds = %24
  %31 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %6, i32 0, i32 9
  %32 = bitcast %"class.soplex::SPxSteepPR"* %6 to %"class.soplex::SPxPricer"*
  %33 = getelementptr inbounds %"class.soplex::SPxPricer"* %32, i32 0, i32 2
  %34 = load %"class.soplex::SoPlex"** %33, align 8
  %35 = bitcast %"class.soplex::SoPlex"* %34 to %"class.soplex::SPxLP"*
  %36 = call i32 @_ZNK6soplex5SPxLP6numberERKNS_5SPxIdE(%"class.soplex::SPxLP"* %35, %"class.soplex::SPxId"* dereferenceable(4) %id)
  %37 = call dereferenceable(8) double* @_ZN6soplex9DataArrayIdEixEi(%"class.soplex::DataArray.3"* %31, i32 %36)
  %38 = load double* %37
  %39 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %6, i32 0, i32 11
  %40 = load i32* %2, align 4
  %41 = call dereferenceable(8) double* @_ZN6soplex9DataArrayIdEixEi(%"class.soplex::DataArray.3"* %39, i32 %40)
  store double %38, double* %41
  br label %42

; <label>:42                                      ; preds = %30, %24
  br label %43

; <label>:43                                      ; preds = %42, %12
  %44 = load i32* %2, align 4
  call void @_ZN6soplex5SPxIdC2ERKS0_(%"class.soplex::SPxId"* %5, %"class.soplex::SPxId"* dereferenceable(4) %id)
  call void @_ZN6soplex10SPxSteepPR6left4XEiNS_5SPxIdEii(%"class.soplex::SPxSteepPR"* %6, i32 %44, %"class.soplex::SPxId"* %5, i32 0, i32 1)
  ret void
}

; Function Attrs: nounwind uwtable
define linkonce_odr i32 @_ZNK6soplex6SoPlex6isCoIdENS_5SPxIdE(%"class.soplex::SoPlex"* %this, %"class.soplex::SPxId"* %p_id) #2 align 2 {
  %1 = alloca %"class.soplex::SoPlex"*, align 8
  store %"class.soplex::SoPlex"* %this, %"class.soplex::SoPlex"** %1, align 8
  %2 = load %"class.soplex::SoPlex"** %1
  %3 = bitcast %"class.soplex::SPxId"* %p_id to %"class.soplex::DataKey"*
  %4 = bitcast %"class.soplex::DataKey"* %3 to i32*
  %5 = load i32* %4, align 4
  %6 = shl i32 %5, 24
  %7 = ashr i32 %6, 24
  %8 = getelementptr inbounds %"class.soplex::SoPlex"* %2, i32 0, i32 4
  %9 = load i32* %8, align 4
  %10 = mul nsw i32 %7, %9
  %11 = icmp slt i32 %10, 0
  %12 = zext i1 %11 to i32
  ret i32 %12
}

; Function Attrs: uwtable
define i32 @_ZN6soplex10SPxSteepPR12selectLeaveXERdii(%"class.soplex::SPxSteepPR"* %this, double* dereferenceable(8) %best, i32 %start, i32 %incr) #3 align 2 {
  %1 = alloca %"class.soplex::SPxSteepPR"*, align 8
  %2 = alloca double*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %coPenalty_ptr = alloca double*, align 8
  %fTest = alloca double*, align 8
  %p = alloca double*, align 8
  %x = alloca double, align 8
  %selIdx = alloca i32, align 4
  %i = alloca i32, align 4
  store %"class.soplex::SPxSteepPR"* %this, %"class.soplex::SPxSteepPR"** %1, align 8
  store double* %best, double** %2, align 8
  store i32 %start, i32* %3, align 4
  store i32 %incr, i32* %4, align 4
  %5 = load %"class.soplex::SPxSteepPR"** %1
  %6 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %5, i32 0, i32 2
  %7 = bitcast %"class.soplex::DVector"* %6 to %"class.soplex::Vector"*
  %8 = call double* @_ZNK6soplex6Vector13get_const_ptrEv(%"class.soplex::Vector"* %7)
  store double* %8, double** %coPenalty_ptr, align 8
  %9 = bitcast %"class.soplex::SPxSteepPR"* %5 to %"class.soplex::SPxPricer"*
  %10 = getelementptr inbounds %"class.soplex::SPxPricer"* %9, i32 0, i32 2
  %11 = load %"class.soplex::SoPlex"** %10, align 8
  %12 = call dereferenceable(16) %"class.soplex::Vector"* @_ZNK6soplex6SoPlex5fTestEv(%"class.soplex::SoPlex"* %11)
  %13 = call double* @_ZNK6soplex6Vector13get_const_ptrEv(%"class.soplex::Vector"* %12)
  store double* %13, double** %fTest, align 8
  %14 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %5, i32 0, i32 11
  %15 = call double* @_ZNK6soplex9DataArrayIdE13get_const_ptrEv(%"class.soplex::DataArray.3"* %14)
  store double* %15, double** %p, align 8
  %16 = load double* @_ZN6soplex8infinityE, align 8
  %17 = fsub double -0.000000e+00, %16
  %18 = load double** %2, align 8
  store double %17, double* %18, align 8
  store i32 -1, i32* %selIdx, align 4
  %19 = bitcast %"class.soplex::SPxSteepPR"* %5 to %"class.soplex::SPxPricer"*
  %20 = getelementptr inbounds %"class.soplex::SPxPricer"* %19, i32 0, i32 2
  %21 = load %"class.soplex::SoPlex"** %20, align 8
  %22 = call i32 @_ZNK6soplex6SoPlex3dimEv(%"class.soplex::SoPlex"* %21)
  %23 = sub nsw i32 %22, 1
  %24 = load i32* %3, align 4
  %25 = sub nsw i32 %23, %24
  store i32 %25, i32* %i, align 4
  br label %26

; <label>:26                                      ; preds = %113, %0
  %27 = load i32* %i, align 4
  %28 = icmp sge i32 %27, 0
  br i1 %28, label %29, label %117

; <label>:29                                      ; preds = %26
  %30 = load i32* %i, align 4
  %31 = sext i32 %30 to i64
  %32 = load double** %fTest, align 8
  %33 = getelementptr inbounds double* %32, i64 %31
  %34 = load double* %33, align 8
  store double %34, double* %x, align 8
  %35 = load double* %x, align 8
  %36 = bitcast %"class.soplex::SPxSteepPR"* %5 to %"class.soplex::SPxPricer"*
  %37 = getelementptr inbounds %"class.soplex::SPxPricer"* %36, i32 0, i32 3
  %38 = load double* %37, align 8
  %39 = fsub double -0.000000e+00, %38
  %40 = fcmp olt double %35, %39
  br i1 %40, label %41, label %112

; <label>:41                                      ; preds = %29
  %42 = load i32* %i, align 4
  %43 = sext i32 %42 to i64
  %44 = load double** %coPenalty_ptr, align 8
  %45 = getelementptr inbounds double* %44, i64 %43
  %46 = load double* %45, align 8
  %47 = bitcast %"class.soplex::SPxSteepPR"* %5 to %"class.soplex::SPxPricer"*
  %48 = getelementptr inbounds %"class.soplex::SPxPricer"* %47, i32 0, i32 3
  %49 = load double* %48, align 8
  %50 = fcmp olt double %46, %49
  br i1 %50, label %51, label %86

; <label>:51                                      ; preds = %41
  %52 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cerr, i8* getelementptr inbounds ([47 x i8]* @.str5, i32 0, i32 0))
  %53 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* %52, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
  %54 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cerr, i8* getelementptr inbounds ([3 x i8]* @.str6, i32 0, i32 0))
  %55 = load i32* %i, align 4
  %56 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* %54, i32 %55)
  %57 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %56, i8* getelementptr inbounds ([4 x i8]* @.str7, i32 0, i32 0))
  %58 = load double* %x, align 8
  %59 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEd(%"class.std::basic_ostream"* %57, double %58)
  %60 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %59, i8* getelementptr inbounds ([19 x i8]* @.str8, i32 0, i32 0))
  %61 = load i32* %i, align 4
  %62 = sext i32 %61 to i64
  %63 = load double** %coPenalty_ptr, align 8
  %64 = getelementptr inbounds double* %63, i64 %62
  %65 = load double* %64, align 8
  %66 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEd(%"class.std::basic_ostream"* %60, double %65)
  %67 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %66, i8* getelementptr inbounds ([9 x i8]* @.str9, i32 0, i32 0))
  %68 = bitcast %"class.soplex::SPxSteepPR"* %5 to %"class.soplex::SPxPricer"*
  %69 = getelementptr inbounds %"class.soplex::SPxPricer"* %68, i32 0, i32 3
  %70 = load double* %69, align 8
  %71 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEd(%"class.std::basic_ostream"* %67, double %70)
  %72 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* %71, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
  %73 = load double* %x, align 8
  %74 = load double* %x, align 8
  %75 = fmul double %73, %74
  %76 = bitcast %"class.soplex::SPxSteepPR"* %5 to %"class.soplex::SPxPricer"*
  %77 = getelementptr inbounds %"class.soplex::SPxPricer"* %76, i32 0, i32 3
  %78 = load double* %77, align 8
  %79 = fdiv double %75, %78
  %80 = load i32* %i, align 4
  %81 = sext i32 %80 to i64
  %82 = load double** %p, align 8
  %83 = getelementptr inbounds double* %82, i64 %81
  %84 = load double* %83, align 8
  %85 = fmul double %79, %84
  store double %85, double* %x, align 8
  br label %102

; <label>:86                                      ; preds = %41
  %87 = load double* %x, align 8
  %88 = load double* %x, align 8
  %89 = fmul double %87, %88
  %90 = load i32* %i, align 4
  %91 = sext i32 %90 to i64
  %92 = load double** %coPenalty_ptr, align 8
  %93 = getelementptr inbounds double* %92, i64 %91
  %94 = load double* %93, align 8
  %95 = fdiv double %89, %94
  %96 = load i32* %i, align 4
  %97 = sext i32 %96 to i64
  %98 = load double** %p, align 8
  %99 = getelementptr inbounds double* %98, i64 %97
  %100 = load double* %99, align 8
  %101 = fmul double %95, %100
  store double %101, double* %x, align 8
  br label %102

; <label>:102                                     ; preds = %86, %51
  %103 = load double* %x, align 8
  %104 = load double** %2, align 8
  %105 = load double* %104, align 8
  %106 = fcmp ogt double %103, %105
  br i1 %106, label %107, label %111

; <label>:107                                     ; preds = %102
  %108 = load double* %x, align 8
  %109 = load double** %2, align 8
  store double %108, double* %109, align 8
  %110 = load i32* %i, align 4
  store i32 %110, i32* %selIdx, align 4
  br label %111

; <label>:111                                     ; preds = %107, %102
  br label %112

; <label>:112                                     ; preds = %111, %29
  br label %113

; <label>:113                                     ; preds = %112
  %114 = load i32* %4, align 4
  %115 = load i32* %i, align 4
  %116 = sub nsw i32 %115, %114
  store i32 %116, i32* %i, align 4
  br label %26

; <label>:117                                     ; preds = %26
  %118 = load i32* %selIdx, align 4
  ret i32 %118
}

; Function Attrs: uwtable
define linkonce_odr dereferenceable(16) %"class.soplex::Vector"* @_ZNK6soplex6SoPlex5fTestEv(%"class.soplex::SoPlex"* %this) #3 align 2 {
  %1 = alloca %"class.soplex::SoPlex"*, align 8
  store %"class.soplex::SoPlex"* %this, %"class.soplex::SoPlex"** %1, align 8
  %2 = load %"class.soplex::SoPlex"** %1
  %3 = call i32 @_ZNK6soplex6SoPlex4typeEv(%"class.soplex::SoPlex"* %2)
  %4 = icmp eq i32 %3, 1
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  br label %8

; <label>:6                                       ; preds = %0
  call void @__assert_fail(i8* getelementptr inbounds ([16 x i8]* @.str41, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8]* @.str32, i32 0, i32 0), i32 952, i8* getelementptr inbounds ([52 x i8]* @__PRETTY_FUNCTION__._ZNK6soplex6SoPlex5fTestEv, i32 0, i32 0)) #10
  unreachable
                                                  ; No predecessors!
  br label %8

; <label>:8                                       ; preds = %7, %5
  %9 = getelementptr inbounds %"class.soplex::SoPlex"* %2, i32 0, i32 48
  %10 = bitcast %"class.soplex::DVector"* %9 to %"class.soplex::Vector"*
  ret %"class.soplex::Vector"* %10
}

; Function Attrs: nounwind uwtable
define linkonce_odr double* @_ZNK6soplex9DataArrayIdE13get_const_ptrEv(%"class.soplex::DataArray.3"* %this) #2 align 2 {
  %1 = alloca %"class.soplex::DataArray.3"*, align 8
  store %"class.soplex::DataArray.3"* %this, %"class.soplex::DataArray.3"** %1, align 8
  %2 = load %"class.soplex::DataArray.3"** %1
  %3 = getelementptr inbounds %"class.soplex::DataArray.3"* %2, i32 0, i32 2
  %4 = load double** %3, align 8
  ret double* %4
}

declare dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"*, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)*) #0

declare dereferenceable(272) %"class.std::basic_ostream"* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(%"class.std::basic_ostream"* dereferenceable(272)) #0

declare dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"*, i32) #0

declare dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEd(%"class.std::basic_ostream"*, double) #0

; Function Attrs: uwtable
define i32 @_ZN6soplex10SPxSteepPR11selectLeaveEv(%"class.soplex::SPxSteepPR"* %this) unnamed_addr #3 align 2 {
  %1 = alloca %"class.soplex::SPxSteepPR"*, align 8
  %best = alloca double, align 8
  store %"class.soplex::SPxSteepPR"* %this, %"class.soplex::SPxSteepPR"** %1, align 8
  %2 = load %"class.soplex::SPxSteepPR"** %1
  %3 = bitcast %"class.soplex::SPxSteepPR"* %2 to i1 (%"class.soplex::SPxSteepPR"*)***
  %4 = load i1 (%"class.soplex::SPxSteepPR"*)*** %3
  %5 = getelementptr inbounds i1 (%"class.soplex::SPxSteepPR"*)** %4, i64 18
  %6 = load i1 (%"class.soplex::SPxSteepPR"*)** %5
  %7 = call zeroext i1 %6(%"class.soplex::SPxSteepPR"* %2)
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %0
  br label %11

; <label>:9                                       ; preds = %0
  call void @__assert_fail(i8* getelementptr inbounds ([15 x i8]* @.str10, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8]* @.str1, i32 0, i32 0), i32 330, i8* getelementptr inbounds ([46 x i8]* @__PRETTY_FUNCTION__._ZN6soplex10SPxSteepPR11selectLeaveEv, i32 0, i32 0)) #10
  unreachable
                                                  ; No predecessors!
  br label %11

; <label>:11                                      ; preds = %10, %8
  %12 = call i32 @_ZN6soplex10SPxSteepPR12selectLeaveXERdii(%"class.soplex::SPxSteepPR"* %2, double* dereferenceable(8) %best, i32 0, i32 1)
  %13 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %2, i32 0, i32 5
  store i32 %12, i32* %13, align 4
  %14 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %2, i32 0, i32 5
  %15 = load i32* %14, align 4
  %16 = icmp sge i32 %15, 0
  br i1 %16, label %17, label %49

; <label>:17                                      ; preds = %11
  %18 = bitcast %"class.soplex::SPxSteepPR"* %2 to %"class.soplex::SPxPricer"*
  %19 = getelementptr inbounds %"class.soplex::SPxPricer"* %18, i32 0, i32 2
  %20 = load %"class.soplex::SoPlex"** %19, align 8
  %21 = call dereferenceable(208) %"class.soplex::SPxBasis"* @_ZN6soplex6SoPlex5basisEv(%"class.soplex::SoPlex"* %20)
  %22 = bitcast %"class.soplex::SPxSteepPR"* %2 to %"class.soplex::SPxPricer"*
  %23 = getelementptr inbounds %"class.soplex::SPxPricer"* %22, i32 0, i32 2
  %24 = load %"class.soplex::SoPlex"** %23, align 8
  %25 = call dereferenceable(104) %"class.soplex::UpdateVector"* @_ZNK6soplex6SoPlex6coPvecEv(%"class.soplex::SoPlex"* %24)
  %26 = call dereferenceable(64) %"class.soplex::SSVector"* @_ZN6soplex12UpdateVector5deltaEv(%"class.soplex::UpdateVector"* %25)
  %27 = bitcast %"class.soplex::SPxSteepPR"* %2 to %"class.soplex::SPxPricer"*
  %28 = getelementptr inbounds %"class.soplex::SPxPricer"* %27, i32 0, i32 2
  %29 = load %"class.soplex::SoPlex"** %28, align 8
  %30 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %2, i32 0, i32 5
  %31 = load i32* %30, align 4
  %32 = call dereferenceable(8) %"class.soplex::SVector"* @_ZNK6soplex6SoPlex10unitVectorEi(%"class.soplex::SoPlex"* %29, i32 %31)
  call void @_ZN6soplex8SPxBasis7coSolveERNS_8SSVectorERKNS_7SVectorE(%"class.soplex::SPxBasis"* %21, %"class.soplex::SSVector"* dereferenceable(64) %26, %"class.soplex::SVector"* dereferenceable(8) %32)
  %33 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %2, i32 0, i32 13
  %34 = load double* %33, align 8
  %35 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %2, i32 0, i32 4
  %36 = getelementptr inbounds %"class.soplex::SSVector"* %35, i32 0, i32 3
  store double %34, double* %36, align 8
  %37 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %2, i32 0, i32 4
  %38 = bitcast %"class.soplex::SPxSteepPR"* %2 to %"class.soplex::SPxPricer"*
  %39 = getelementptr inbounds %"class.soplex::SPxPricer"* %38, i32 0, i32 2
  %40 = load %"class.soplex::SoPlex"** %39, align 8
  %41 = call dereferenceable(104) %"class.soplex::UpdateVector"* @_ZNK6soplex6SoPlex6coPvecEv(%"class.soplex::SoPlex"* %40)
  %42 = call dereferenceable(64) %"class.soplex::SSVector"* @_ZN6soplex12UpdateVector5deltaEv(%"class.soplex::UpdateVector"* %41)
  call void @_ZN6soplex8SSVector16setup_and_assignERS0_(%"class.soplex::SSVector"* %37, %"class.soplex::SSVector"* dereferenceable(64) %42)
  %43 = bitcast %"class.soplex::SPxSteepPR"* %2 to %"class.soplex::SPxPricer"*
  %44 = getelementptr inbounds %"class.soplex::SPxPricer"* %43, i32 0, i32 2
  %45 = load %"class.soplex::SoPlex"** %44, align 8
  %46 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %2, i32 0, i32 3
  %47 = bitcast %"class.soplex::DVector"* %46 to %"class.soplex::Vector"*
  %48 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %2, i32 0, i32 4
  call void @_ZN6soplex6SoPlex11setup4solveEPNS_6VectorEPNS_8SSVectorE(%"class.soplex::SoPlex"* %45, %"class.soplex::Vector"* %47, %"class.soplex::SSVector"* %48)
  br label %49

; <label>:49                                      ; preds = %17, %11
  %50 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %2, i32 0, i32 5
  %51 = load i32* %50, align 4
  ret i32 %51
}

; Function Attrs: uwtable
define linkonce_odr void @_ZN6soplex8SPxBasis7coSolveERNS_8SSVectorERKNS_7SVectorE(%"class.soplex::SPxBasis"* %this, %"class.soplex::SSVector"* dereferenceable(64) %x, %"class.soplex::SVector"* dereferenceable(8) %rhs) #3 align 2 {
  %1 = alloca %"class.soplex::SPxBasis"*, align 8
  %2 = alloca %"class.soplex::SSVector"*, align 8
  %3 = alloca %"class.soplex::SVector"*, align 8
  store %"class.soplex::SPxBasis"* %this, %"class.soplex::SPxBasis"** %1, align 8
  store %"class.soplex::SSVector"* %x, %"class.soplex::SSVector"** %2, align 8
  store %"class.soplex::SVector"* %rhs, %"class.soplex::SVector"** %3, align 8
  %4 = load %"class.soplex::SPxBasis"** %1
  %5 = getelementptr inbounds %"class.soplex::SPxBasis"* %4, i32 0, i32 6
  %6 = load i8* %5, align 1
  %7 = trunc i8 %6 to i1
  br i1 %7, label %13, label %8

; <label>:8                                       ; preds = %0
  %9 = bitcast %"class.soplex::SPxBasis"* %4 to void (%"class.soplex::SPxBasis"*)***
  %10 = load void (%"class.soplex::SPxBasis"*)*** %9
  %11 = getelementptr inbounds void (%"class.soplex::SPxBasis"*)** %10, i64 10
  %12 = load void (%"class.soplex::SPxBasis"*)** %11
  call void %12(%"class.soplex::SPxBasis"* %4)
  br label %13

; <label>:13                                      ; preds = %8, %0
  %14 = getelementptr inbounds %"class.soplex::SPxBasis"* %4, i32 0, i32 5
  %15 = load %"class.soplex::SLinSolver"** %14, align 8
  %16 = bitcast %"class.soplex::SLinSolver"* %15 to void (%"class.soplex::SLinSolver"*, %"class.soplex::SSVector"*, %"class.soplex::SVector"*)***
  %17 = load void (%"class.soplex::SLinSolver"*, %"class.soplex::SSVector"*, %"class.soplex::SVector"*)*** %16
  %18 = getelementptr inbounds void (%"class.soplex::SLinSolver"*, %"class.soplex::SSVector"*, %"class.soplex::SVector"*)** %17, i64 24
  %19 = load void (%"class.soplex::SLinSolver"*, %"class.soplex::SSVector"*, %"class.soplex::SVector"*)** %18
  %20 = load %"class.soplex::SSVector"** %2, align 8
  %21 = load %"class.soplex::SVector"** %3, align 8
  call void %19(%"class.soplex::SLinSolver"* %15, %"class.soplex::SSVector"* dereferenceable(64) %20, %"class.soplex::SVector"* dereferenceable(8) %21)
  ret void
}

; Function Attrs: uwtable
define linkonce_odr dereferenceable(8) %"class.soplex::SVector"* @_ZNK6soplex6SoPlex10unitVectorEi(%"class.soplex::SoPlex"* %this, i32 %i) #3 align 2 {
  %1 = alloca %"class.soplex::SoPlex"*, align 8
  %2 = alloca i32, align 4
  store %"class.soplex::SoPlex"* %this, %"class.soplex::SoPlex"** %1, align 8
  store i32 %i, i32* %2, align 4
  %3 = load %"class.soplex::SoPlex"** %1
  %4 = getelementptr inbounds %"class.soplex::SoPlex"* %3, i32 0, i32 21
  %5 = load i32* %2, align 4
  %6 = call dereferenceable(40) %"class.soplex::UnitVector"* @_ZNK6soplex5ArrayINS_10UnitVectorEEixEi(%"class.soplex::Array"* %4, i32 %5)
  %7 = bitcast %"class.soplex::UnitVector"* %6 to %"class.soplex::SVector"*
  ret %"class.soplex::SVector"* %7
}

declare void @_ZN6soplex8SSVector16setup_and_assignERS0_(%"class.soplex::SSVector"*, %"class.soplex::SSVector"* dereferenceable(64)) #0

; Function Attrs: uwtable
define linkonce_odr void @_ZN6soplex6SoPlex11setup4solveEPNS_6VectorEPNS_8SSVectorE(%"class.soplex::SoPlex"* %this, %"class.soplex::Vector"* %p_y, %"class.soplex::SSVector"* %p_rhs) #3 align 2 {
  %1 = alloca %"class.soplex::SoPlex"*, align 8
  %2 = alloca %"class.soplex::Vector"*, align 8
  %3 = alloca %"class.soplex::SSVector"*, align 8
  store %"class.soplex::SoPlex"* %this, %"class.soplex::SoPlex"** %1, align 8
  store %"class.soplex::Vector"* %p_y, %"class.soplex::Vector"** %2, align 8
  store %"class.soplex::SSVector"* %p_rhs, %"class.soplex::SSVector"** %3, align 8
  %4 = load %"class.soplex::SoPlex"** %1
  %5 = call i32 @_ZNK6soplex6SoPlex4typeEv(%"class.soplex::SoPlex"* %4)
  %6 = icmp eq i32 %5, 1
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %0
  br label %10

; <label>:8                                       ; preds = %0
  call void @__assert_fail(i8* getelementptr inbounds ([16 x i8]* @.str41, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8]* @.str32, i32 0, i32 0), i32 1261, i8* getelementptr inbounds ([71 x i8]* @__PRETTY_FUNCTION__._ZN6soplex6SoPlex11setup4solveEPNS_6VectorEPNS_8SSVectorE, i32 0, i32 0)) #10
  unreachable
                                                  ; No predecessors!
  br label %10

; <label>:10                                      ; preds = %9, %7
  %11 = load %"class.soplex::Vector"** %2, align 8
  %12 = getelementptr inbounds %"class.soplex::SoPlex"* %4, i32 0, i32 16
  store %"class.soplex::Vector"* %11, %"class.soplex::Vector"** %12, align 8
  %13 = load %"class.soplex::SSVector"** %3, align 8
  %14 = getelementptr inbounds %"class.soplex::SoPlex"* %4, i32 0, i32 17
  store %"class.soplex::SSVector"* %13, %"class.soplex::SSVector"** %14, align 8
  ret void
}

; Function Attrs: uwtable
define void @_ZN6soplex10SPxSteepPR9entered4XENS_5SPxIdEiiiii(%"class.soplex::SPxSteepPR"* %this, %"class.soplex::SPxId"*, i32 %n, i32 %start2, i32 %incr2, i32 %start1, i32 %incr1) #3 align 2 {
  %2 = alloca %"class.soplex::SPxSteepPR"*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %delta = alloca double, align 8
  %coPenalty_ptr = alloca double*, align 8
  %penalty_ptr = alloca double*, align 8
  %workVec_ptr = alloca double*, align 8
  %pVec = alloca double*, align 8
  %pIdx = alloca %"class.soplex::IdxSet"*, align 8
  %coPvec = alloca double*, align 8
  %coPidx = alloca %"class.soplex::IdxSet"*, align 8
  %xi_p = alloca double, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %xi_ip = alloca double, align 8
  %x = alloca double, align 8
  store %"class.soplex::SPxSteepPR"* %this, %"class.soplex::SPxSteepPR"** %2, align 8
  store i32 %n, i32* %3, align 4
  store i32 %start2, i32* %4, align 4
  store i32 %incr2, i32* %5, align 4
  store i32 %start1, i32* %6, align 4
  store i32 %incr1, i32* %7, align 4
  %8 = load %"class.soplex::SPxSteepPR"** %2
  %9 = bitcast %"class.soplex::SPxSteepPR"* %8 to %"class.soplex::SPxPricer"*
  %10 = getelementptr inbounds %"class.soplex::SPxPricer"* %9, i32 0, i32 2
  %11 = load %"class.soplex::SoPlex"** %10, align 8
  %12 = call i32 @_ZNK6soplex6SoPlex4typeEv(%"class.soplex::SoPlex"* %11)
  %13 = icmp eq i32 %12, -1
  br i1 %13, label %14, label %15

; <label>:14                                      ; preds = %1
  br label %17

; <label>:15                                      ; preds = %1
  call void @__assert_fail(i8* getelementptr inbounds ([35 x i8]* @.str11, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8]* @.str1, i32 0, i32 0), i32 364, i8* getelementptr inbounds ([75 x i8]* @__PRETTY_FUNCTION__._ZN6soplex10SPxSteepPR9entered4XENS_5SPxIdEiiiii, i32 0, i32 0)) #10
  unreachable
                                                  ; No predecessors!
  br label %17

; <label>:17                                      ; preds = %16, %14
  %18 = load i32* %3, align 4
  %19 = icmp sge i32 %18, 0
  br i1 %19, label %20, label %244

; <label>:20                                      ; preds = %17
  %21 = load i32* %3, align 4
  %22 = bitcast %"class.soplex::SPxSteepPR"* %8 to %"class.soplex::SPxPricer"*
  %23 = getelementptr inbounds %"class.soplex::SPxPricer"* %22, i32 0, i32 2
  %24 = load %"class.soplex::SoPlex"** %23, align 8
  %25 = call i32 @_ZNK6soplex6SoPlex3dimEv(%"class.soplex::SoPlex"* %24)
  %26 = icmp slt i32 %21, %25
  br i1 %26, label %27, label %244

; <label>:27                                      ; preds = %20
  %28 = bitcast %"class.soplex::SPxSteepPR"* %8 to %"class.soplex::SPxPricer"*
  %29 = getelementptr inbounds %"class.soplex::SPxPricer"* %28, i32 0, i32 2
  %30 = load %"class.soplex::SoPlex"** %29, align 8
  %31 = call dereferenceable(208) %"class.soplex::SPxBasis"* @_ZN6soplex6SoPlex5basisEv(%"class.soplex::SoPlex"* %30)
  %32 = call i32 @_ZNK6soplex8SPxBasis9iterationEv(%"class.soplex::SPxBasis"* %31)
  %33 = sitofp i32 %32 to double
  %34 = fdiv double 1.000000e+00, %33
  %35 = fadd double 2.000000e+00, %34
  store double %35, double* %delta, align 8
  %36 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %8, i32 0, i32 2
  %37 = bitcast %"class.soplex::DVector"* %36 to %"class.soplex::Vector"*
  %38 = call double* @_ZN6soplex6Vector7get_ptrEv(%"class.soplex::Vector"* %37)
  store double* %38, double** %coPenalty_ptr, align 8
  %39 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %8, i32 0, i32 1
  %40 = bitcast %"class.soplex::DVector"* %39 to %"class.soplex::Vector"*
  %41 = call double* @_ZN6soplex6Vector7get_ptrEv(%"class.soplex::Vector"* %40)
  store double* %41, double** %penalty_ptr, align 8
  %42 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %8, i32 0, i32 3
  %43 = bitcast %"class.soplex::DVector"* %42 to %"class.soplex::Vector"*
  %44 = call double* @_ZNK6soplex6Vector13get_const_ptrEv(%"class.soplex::Vector"* %43)
  store double* %44, double** %workVec_ptr, align 8
  %45 = bitcast %"class.soplex::SPxSteepPR"* %8 to %"class.soplex::SPxPricer"*
  %46 = getelementptr inbounds %"class.soplex::SPxPricer"* %45, i32 0, i32 2
  %47 = load %"class.soplex::SoPlex"** %46, align 8
  %48 = call dereferenceable(104) %"class.soplex::UpdateVector"* @_ZNK6soplex6SoPlex4pVecEv(%"class.soplex::SoPlex"* %47)
  %49 = call dereferenceable(64) %"class.soplex::SSVector"* @_ZN6soplex12UpdateVector5deltaEv(%"class.soplex::UpdateVector"* %48)
  %50 = call double* @_ZNK6soplex8SSVector6valuesEv(%"class.soplex::SSVector"* %49)
  store double* %50, double** %pVec, align 8
  %51 = bitcast %"class.soplex::SPxSteepPR"* %8 to %"class.soplex::SPxPricer"*
  %52 = getelementptr inbounds %"class.soplex::SPxPricer"* %51, i32 0, i32 2
  %53 = load %"class.soplex::SoPlex"** %52, align 8
  %54 = call dereferenceable(104) %"class.soplex::UpdateVector"* @_ZNK6soplex6SoPlex4pVecEv(%"class.soplex::SoPlex"* %53)
  %55 = call dereferenceable(16) %"class.soplex::IdxSet"* @_ZNK6soplex12UpdateVector3idxEv(%"class.soplex::UpdateVector"* %54)
  store %"class.soplex::IdxSet"* %55, %"class.soplex::IdxSet"** %pIdx, align 8
  %56 = bitcast %"class.soplex::SPxSteepPR"* %8 to %"class.soplex::SPxPricer"*
  %57 = getelementptr inbounds %"class.soplex::SPxPricer"* %56, i32 0, i32 2
  %58 = load %"class.soplex::SoPlex"** %57, align 8
  %59 = call dereferenceable(104) %"class.soplex::UpdateVector"* @_ZNK6soplex6SoPlex6coPvecEv(%"class.soplex::SoPlex"* %58)
  %60 = call dereferenceable(64) %"class.soplex::SSVector"* @_ZN6soplex12UpdateVector5deltaEv(%"class.soplex::UpdateVector"* %59)
  %61 = call double* @_ZNK6soplex8SSVector6valuesEv(%"class.soplex::SSVector"* %60)
  store double* %61, double** %coPvec, align 8
  %62 = bitcast %"class.soplex::SPxSteepPR"* %8 to %"class.soplex::SPxPricer"*
  %63 = getelementptr inbounds %"class.soplex::SPxPricer"* %62, i32 0, i32 2
  %64 = load %"class.soplex::SoPlex"** %63, align 8
  %65 = call dereferenceable(104) %"class.soplex::UpdateVector"* @_ZNK6soplex6SoPlex6coPvecEv(%"class.soplex::SoPlex"* %64)
  %66 = call dereferenceable(16) %"class.soplex::IdxSet"* @_ZNK6soplex12UpdateVector3idxEv(%"class.soplex::UpdateVector"* %65)
  store %"class.soplex::IdxSet"* %66, %"class.soplex::IdxSet"** %coPidx, align 8
  %67 = bitcast %"class.soplex::SPxSteepPR"* %8 to %"class.soplex::SPxPricer"*
  %68 = getelementptr inbounds %"class.soplex::SPxPricer"* %67, i32 0, i32 2
  %69 = load %"class.soplex::SoPlex"** %68, align 8
  %70 = call dereferenceable(104) %"class.soplex::UpdateVector"* @_ZNK6soplex6SoPlex4fVecEv(%"class.soplex::SoPlex"* %69)
  %71 = call dereferenceable(64) %"class.soplex::SSVector"* @_ZN6soplex12UpdateVector5deltaEv(%"class.soplex::UpdateVector"* %70)
  %72 = load i32* %3, align 4
  %73 = call double @_ZNK6soplex8SSVectorixEi(%"class.soplex::SSVector"* %71, i32 %72)
  %74 = fdiv double 1.000000e+00, %73
  store double %74, double* %xi_p, align 8
  %75 = bitcast %"class.soplex::SPxSteepPR"* %8 to %"class.soplex::SPxPricer"*
  %76 = getelementptr inbounds %"class.soplex::SPxPricer"* %75, i32 0, i32 2
  %77 = load %"class.soplex::SoPlex"** %76, align 8
  %78 = call dereferenceable(104) %"class.soplex::UpdateVector"* @_ZNK6soplex6SoPlex4fVecEv(%"class.soplex::SoPlex"* %77)
  %79 = call dereferenceable(64) %"class.soplex::SSVector"* @_ZN6soplex12UpdateVector5deltaEv(%"class.soplex::UpdateVector"* %78)
  %80 = load i32* %3, align 4
  %81 = call double @_ZNK6soplex8SSVectorixEi(%"class.soplex::SSVector"* %79, i32 %80)
  %82 = bitcast %"class.soplex::SPxSteepPR"* %8 to %"class.soplex::SPxPricer"*
  %83 = getelementptr inbounds %"class.soplex::SPxPricer"* %82, i32 0, i32 2
  %84 = load %"class.soplex::SoPlex"** %83, align 8
  %85 = call double @_ZNK6soplex6SoPlex7epsilonEv(%"class.soplex::SoPlex"* %84)
  %86 = fcmp ogt double %81, %85
  br i1 %86, label %101, label %87

; <label>:87                                      ; preds = %27
  %88 = bitcast %"class.soplex::SPxSteepPR"* %8 to %"class.soplex::SPxPricer"*
  %89 = getelementptr inbounds %"class.soplex::SPxPricer"* %88, i32 0, i32 2
  %90 = load %"class.soplex::SoPlex"** %89, align 8
  %91 = call dereferenceable(104) %"class.soplex::UpdateVector"* @_ZNK6soplex6SoPlex4fVecEv(%"class.soplex::SoPlex"* %90)
  %92 = call dereferenceable(64) %"class.soplex::SSVector"* @_ZN6soplex12UpdateVector5deltaEv(%"class.soplex::UpdateVector"* %91)
  %93 = load i32* %3, align 4
  %94 = call double @_ZNK6soplex8SSVectorixEi(%"class.soplex::SSVector"* %92, i32 %93)
  %95 = bitcast %"class.soplex::SPxSteepPR"* %8 to %"class.soplex::SPxPricer"*
  %96 = getelementptr inbounds %"class.soplex::SPxPricer"* %95, i32 0, i32 2
  %97 = load %"class.soplex::SoPlex"** %96, align 8
  %98 = call double @_ZNK6soplex6SoPlex7epsilonEv(%"class.soplex::SoPlex"* %97)
  %99 = fsub double -0.000000e+00, %98
  %100 = fcmp olt double %94, %99
  br i1 %100, label %101, label %102

; <label>:101                                     ; preds = %87, %27
  br label %104

; <label>:102                                     ; preds = %87
  call void @__assert_fail(i8* getelementptr inbounds ([108 x i8]* @.str12, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8]* @.str1, i32 0, i32 0), i32 381, i8* getelementptr inbounds ([75 x i8]* @__PRETTY_FUNCTION__._ZN6soplex10SPxSteepPR9entered4XENS_5SPxIdEiiiii, i32 0, i32 0)) #10
  unreachable
                                                  ; No predecessors!
  br label %104

; <label>:104                                     ; preds = %103, %101
  %105 = load %"class.soplex::IdxSet"** %coPidx, align 8
  %106 = call i32 @_ZNK6soplex6IdxSet4sizeEv(%"class.soplex::IdxSet"* %105)
  %107 = sub nsw i32 %106, 1
  %108 = load i32* %6, align 4
  %109 = sub nsw i32 %107, %108
  store i32 %109, i32* %j, align 4
  br label %110

; <label>:110                                     ; preds = %168, %104
  %111 = load i32* %j, align 4
  %112 = icmp sge i32 %111, 0
  br i1 %112, label %113, label %172

; <label>:113                                     ; preds = %110
  %114 = load %"class.soplex::IdxSet"** %coPidx, align 8
  %115 = load i32* %j, align 4
  %116 = call i32 @_ZNK6soplex6IdxSet5indexEi(%"class.soplex::IdxSet"* %114, i32 %115)
  store i32 %116, i32* %i, align 4
  %117 = load double* %xi_p, align 8
  %118 = load i32* %i, align 4
  %119 = sext i32 %118 to i64
  %120 = load double** %coPvec, align 8
  %121 = getelementptr inbounds double* %120, i64 %119
  %122 = load double* %121, align 8
  %123 = fmul double %117, %122
  store double %123, double* %xi_ip, align 8
  %124 = load double* %xi_ip, align 8
  %125 = load double* %xi_ip, align 8
  %126 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %8, i32 0, i32 7
  %127 = load double* %126, align 8
  %128 = fmul double %125, %127
  %129 = load i32* %i, align 4
  %130 = sext i32 %129 to i64
  %131 = load double** %workVec_ptr, align 8
  %132 = getelementptr inbounds double* %131, i64 %130
  %133 = load double* %132, align 8
  %134 = fmul double 2.000000e+00, %133
  %135 = fsub double %128, %134
  %136 = fmul double %124, %135
  %137 = load i32* %i, align 4
  %138 = sext i32 %137 to i64
  %139 = load double** %coPenalty_ptr, align 8
  %140 = getelementptr inbounds double* %139, i64 %138
  %141 = load double* %140, align 8
  %142 = fadd double %141, %136
  store double %142, double* %140, align 8
  store double %142, double* %x, align 8
  %143 = load double* %x, align 8
  %144 = load double* %delta, align 8
  %145 = fcmp olt double %143, %144
  br i1 %145, label %146, label %152

; <label>:146                                     ; preds = %113
  %147 = load double* %delta, align 8
  %148 = load i32* %i, align 4
  %149 = sext i32 %148 to i64
  %150 = load double** %coPenalty_ptr, align 8
  %151 = getelementptr inbounds double* %150, i64 %149
  store double %147, double* %151, align 8
  br label %167

; <label>:152                                     ; preds = %113
  %153 = load double* %x, align 8
  %154 = load double* @_ZN6soplex8infinityE, align 8
  %155 = fcmp ogt double %153, %154
  br i1 %155, label %156, label %166

; <label>:156                                     ; preds = %152
  %157 = bitcast %"class.soplex::SPxSteepPR"* %8 to %"class.soplex::SPxPricer"*
  %158 = getelementptr inbounds %"class.soplex::SPxPricer"* %157, i32 0, i32 2
  %159 = load %"class.soplex::SoPlex"** %158, align 8
  %160 = call double @_ZNK6soplex6SoPlex7epsilonEv(%"class.soplex::SoPlex"* %159)
  %161 = fdiv double 1.000000e+00, %160
  %162 = load i32* %i, align 4
  %163 = sext i32 %162 to i64
  %164 = load double** %coPenalty_ptr, align 8
  %165 = getelementptr inbounds double* %164, i64 %163
  store double %161, double* %165, align 8
  br label %166

; <label>:166                                     ; preds = %156, %152
  br label %167

; <label>:167                                     ; preds = %166, %146
  br label %168

; <label>:168                                     ; preds = %167
  %169 = load i32* %7, align 4
  %170 = load i32* %j, align 4
  %171 = sub nsw i32 %170, %169
  store i32 %171, i32* %j, align 4
  br label %110

; <label>:172                                     ; preds = %110
  %173 = load %"class.soplex::IdxSet"** %pIdx, align 8
  %174 = call i32 @_ZNK6soplex6IdxSet4sizeEv(%"class.soplex::IdxSet"* %173)
  %175 = sub nsw i32 %174, 1
  %176 = load i32* %4, align 4
  %177 = sub nsw i32 %175, %176
  store i32 %177, i32* %j, align 4
  br label %178

; <label>:178                                     ; preds = %239, %172
  %179 = load i32* %j, align 4
  %180 = icmp sge i32 %179, 0
  br i1 %180, label %181, label %243

; <label>:181                                     ; preds = %178
  %182 = load %"class.soplex::IdxSet"** %pIdx, align 8
  %183 = load i32* %j, align 4
  %184 = call i32 @_ZNK6soplex6IdxSet5indexEi(%"class.soplex::IdxSet"* %182, i32 %183)
  store i32 %184, i32* %i, align 4
  %185 = load double* %xi_p, align 8
  %186 = load i32* %i, align 4
  %187 = sext i32 %186 to i64
  %188 = load double** %pVec, align 8
  %189 = getelementptr inbounds double* %188, i64 %187
  %190 = load double* %189, align 8
  %191 = fmul double %185, %190
  store double %191, double* %xi_ip, align 8
  %192 = load double* %xi_ip, align 8
  %193 = load double* %xi_ip, align 8
  %194 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %8, i32 0, i32 7
  %195 = load double* %194, align 8
  %196 = fmul double %193, %195
  %197 = bitcast %"class.soplex::SPxSteepPR"* %8 to %"class.soplex::SPxPricer"*
  %198 = getelementptr inbounds %"class.soplex::SPxPricer"* %197, i32 0, i32 2
  %199 = load %"class.soplex::SoPlex"** %198, align 8
  %200 = load i32* %i, align 4
  %201 = call dereferenceable(8) %"class.soplex::SVector"* @_ZNK6soplex6SoPlex6vectorEi(%"class.soplex::SoPlex"* %199, i32 %200)
  %202 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %8, i32 0, i32 3
  %203 = bitcast %"class.soplex::DVector"* %202 to %"class.soplex::Vector"*
  %204 = call double @_ZNK6soplex7SVectormlERKNS_6VectorE(%"class.soplex::SVector"* %201, %"class.soplex::Vector"* dereferenceable(16) %203)
  %205 = fmul double 2.000000e+00, %204
  %206 = fsub double %196, %205
  %207 = fmul double %192, %206
  %208 = load i32* %i, align 4
  %209 = sext i32 %208 to i64
  %210 = load double** %penalty_ptr, align 8
  %211 = getelementptr inbounds double* %210, i64 %209
  %212 = load double* %211, align 8
  %213 = fadd double %212, %207
  store double %213, double* %211, align 8
  store double %213, double* %x, align 8
  %214 = load double* %x, align 8
  %215 = load double* %delta, align 8
  %216 = fcmp olt double %214, %215
  br i1 %216, label %217, label %223

; <label>:217                                     ; preds = %181
  %218 = load double* %delta, align 8
  %219 = load i32* %i, align 4
  %220 = sext i32 %219 to i64
  %221 = load double** %penalty_ptr, align 8
  %222 = getelementptr inbounds double* %221, i64 %220
  store double %218, double* %222, align 8
  br label %238

; <label>:223                                     ; preds = %181
  %224 = load double* %x, align 8
  %225 = load double* @_ZN6soplex8infinityE, align 8
  %226 = fcmp ogt double %224, %225
  br i1 %226, label %227, label %237

; <label>:227                                     ; preds = %223
  %228 = bitcast %"class.soplex::SPxSteepPR"* %8 to %"class.soplex::SPxPricer"*
  %229 = getelementptr inbounds %"class.soplex::SPxPricer"* %228, i32 0, i32 2
  %230 = load %"class.soplex::SoPlex"** %229, align 8
  %231 = call double @_ZNK6soplex6SoPlex7epsilonEv(%"class.soplex::SoPlex"* %230)
  %232 = fdiv double 1.000000e+00, %231
  %233 = load i32* %i, align 4
  %234 = sext i32 %233 to i64
  %235 = load double** %penalty_ptr, align 8
  %236 = getelementptr inbounds double* %235, i64 %234
  store double %232, double* %236, align 8
  br label %237

; <label>:237                                     ; preds = %227, %223
  br label %238

; <label>:238                                     ; preds = %237, %217
  br label %239

; <label>:239                                     ; preds = %238
  %240 = load i32* %5, align 4
  %241 = load i32* %j, align 4
  %242 = sub nsw i32 %241, %240
  store i32 %242, i32* %j, align 4
  br label %178

; <label>:243                                     ; preds = %178
  br label %244

; <label>:244                                     ; preds = %243, %20, %17
  ret void
}

; Function Attrs: nounwind uwtable
define linkonce_odr dereferenceable(104) %"class.soplex::UpdateVector"* @_ZNK6soplex6SoPlex4pVecEv(%"class.soplex::SoPlex"* %this) #2 align 2 {
  %1 = alloca %"class.soplex::SoPlex"*, align 8
  store %"class.soplex::SoPlex"* %this, %"class.soplex::SoPlex"** %1, align 8
  %2 = load %"class.soplex::SoPlex"** %1
  %3 = getelementptr inbounds %"class.soplex::SoPlex"* %2, i32 0, i32 41
  %4 = load %"class.soplex::UpdateVector"** %3, align 8
  ret %"class.soplex::UpdateVector"* %4
}

; Function Attrs: nounwind uwtable
define linkonce_odr double @_ZNK6soplex8SSVectorixEi(%"class.soplex::SSVector"* %this, i32 %i) #2 align 2 {
  %1 = alloca %"class.soplex::SSVector"*, align 8
  %2 = alloca i32, align 4
  store %"class.soplex::SSVector"* %this, %"class.soplex::SSVector"** %1, align 8
  store i32 %i, i32* %2, align 4
  %3 = load %"class.soplex::SSVector"** %1
  %4 = load i32* %2, align 4
  %5 = sext i32 %4 to i64
  %6 = bitcast %"class.soplex::SSVector"* %3 to %"class.soplex::Vector"*
  %7 = getelementptr inbounds %"class.soplex::Vector"* %6, i32 0, i32 1
  %8 = load double** %7, align 8
  %9 = getelementptr inbounds double* %8, i64 %5
  %10 = load double* %9, align 8
  ret double %10
}

; Function Attrs: uwtable
define linkonce_odr double @_ZNK6soplex7SVectormlERKNS_6VectorE(%"class.soplex::SVector"* %this, %"class.soplex::Vector"* dereferenceable(16) %w) #3 align 2 {
  %1 = alloca %"class.soplex::SVector"*, align 8
  %2 = alloca %"class.soplex::Vector"*, align 8
  %x = alloca double, align 8
  %n = alloca i32, align 4
  %e = alloca %"struct.soplex::SVector::Element"*, align 8
  store %"class.soplex::SVector"* %this, %"class.soplex::SVector"** %1, align 8
  store %"class.soplex::Vector"* %w, %"class.soplex::Vector"** %2, align 8
  %3 = load %"class.soplex::SVector"** %1
  store double 0.000000e+00, double* %x, align 8
  %4 = call i32 @_ZNK6soplex7SVector4sizeEv(%"class.soplex::SVector"* %3)
  store i32 %4, i32* %n, align 4
  %5 = getelementptr inbounds %"class.soplex::SVector"* %3, i32 0, i32 0
  %6 = load %"struct.soplex::SVector::Element"** %5, align 8
  store %"struct.soplex::SVector::Element"* %6, %"struct.soplex::SVector::Element"** %e, align 8
  br label %7

; <label>:7                                       ; preds = %11, %0
  %8 = load i32* %n, align 4
  %9 = add nsw i32 %8, -1
  store i32 %9, i32* %n, align 4
  %10 = icmp ne i32 %8, 0
  br i1 %10, label %11, label %25

; <label>:11                                      ; preds = %7
  %12 = load %"struct.soplex::SVector::Element"** %e, align 8
  %13 = getelementptr inbounds %"struct.soplex::SVector::Element"* %12, i32 0, i32 0
  %14 = load double* %13, align 8
  %15 = load %"class.soplex::Vector"** %2, align 8
  %16 = load %"struct.soplex::SVector::Element"** %e, align 8
  %17 = getelementptr inbounds %"struct.soplex::SVector::Element"* %16, i32 0, i32 1
  %18 = load i32* %17, align 4
  %19 = call double @_ZNK6soplex6VectorixEi(%"class.soplex::Vector"* %15, i32 %18)
  %20 = fmul double %14, %19
  %21 = load double* %x, align 8
  %22 = fadd double %21, %20
  store double %22, double* %x, align 8
  %23 = load %"struct.soplex::SVector::Element"** %e, align 8
  %24 = getelementptr inbounds %"struct.soplex::SVector::Element"* %23, i32 1
  store %"struct.soplex::SVector::Element"* %24, %"struct.soplex::SVector::Element"** %e, align 8
  br label %7

; <label>:25                                      ; preds = %7
  %26 = load double* %x, align 8
  ret double %26
}

; Function Attrs: uwtable
define void @_ZN6soplex10SPxSteepPR8entered4ENS_5SPxIdEi(%"class.soplex::SPxSteepPR"* %this, %"class.soplex::SPxId"* %id, i32 %n) unnamed_addr #3 align 2 {
  %1 = alloca %"class.soplex::SPxSteepPR"*, align 8
  %2 = alloca i32, align 4
  %3 = alloca %"class.soplex::SPxId", align 4
  store %"class.soplex::SPxSteepPR"* %this, %"class.soplex::SPxSteepPR"** %1, align 8
  store i32 %n, i32* %2, align 4
  %4 = load %"class.soplex::SPxSteepPR"** %1
  call void @_ZN6soplex5SPxIdC2ERKS0_(%"class.soplex::SPxId"* %3, %"class.soplex::SPxId"* dereferenceable(4) %id)
  %5 = load i32* %2, align 4
  call void @_ZN6soplex10SPxSteepPR9entered4XENS_5SPxIdEiiiii(%"class.soplex::SPxSteepPR"* %4, %"class.soplex::SPxId"* %3, i32 %5, i32 0, i32 1, i32 0, i32 1)
  ret void
}

; Function Attrs: uwtable
define void @_ZN6soplex10SPxSteepPR12selectEnterXERdiiii(%"class.soplex::SPxId"* noalias sret %agg.result, %"class.soplex::SPxSteepPR"* %this, double* dereferenceable(8) %best, i32 %start1, i32 %incr1, i32 %start2, i32 %incr2) #3 align 2 {
  %1 = alloca %"class.soplex::SPxSteepPR"*, align 8
  %2 = alloca double*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %p = alloca double*, align 8
  %cp = alloca double*, align 8
  %test = alloca double*, align 8
  %coTest = alloca double*, align 8
  %penalty_ptr = alloca double*, align 8
  %coPenalty_ptr = alloca double*, align 8
  %x = alloca double, align 8
  %i = alloca i32, align 4
  %end = alloca i32, align 4
  %7 = alloca %"class.soplex::SPxId", align 4
  %8 = alloca %"class.soplex::SPxId", align 4
  store %"class.soplex::SPxSteepPR"* %this, %"class.soplex::SPxSteepPR"** %1, align 8
  store double* %best, double** %2, align 8
  store i32 %start1, i32* %3, align 4
  store i32 %incr1, i32* %4, align 4
  store i32 %start2, i32* %5, align 4
  store i32 %incr2, i32* %6, align 4
  %9 = load %"class.soplex::SPxSteepPR"** %1
  %10 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %9, i32 0, i32 10
  %11 = call double* @_ZNK6soplex9DataArrayIdE13get_const_ptrEv(%"class.soplex::DataArray.3"* %10)
  store double* %11, double** %p, align 8
  %12 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %9, i32 0, i32 9
  %13 = call double* @_ZNK6soplex9DataArrayIdE13get_const_ptrEv(%"class.soplex::DataArray.3"* %12)
  store double* %13, double** %cp, align 8
  %14 = bitcast %"class.soplex::SPxSteepPR"* %9 to %"class.soplex::SPxPricer"*
  %15 = getelementptr inbounds %"class.soplex::SPxPricer"* %14, i32 0, i32 2
  %16 = load %"class.soplex::SoPlex"** %15, align 8
  %17 = call dereferenceable(16) %"class.soplex::Vector"* @_ZNK6soplex6SoPlex4testEv(%"class.soplex::SoPlex"* %16)
  %18 = call double* @_ZNK6soplex6Vector13get_const_ptrEv(%"class.soplex::Vector"* %17)
  store double* %18, double** %test, align 8
  %19 = bitcast %"class.soplex::SPxSteepPR"* %9 to %"class.soplex::SPxPricer"*
  %20 = getelementptr inbounds %"class.soplex::SPxPricer"* %19, i32 0, i32 2
  %21 = load %"class.soplex::SoPlex"** %20, align 8
  %22 = call dereferenceable(16) %"class.soplex::Vector"* @_ZNK6soplex6SoPlex6coTestEv(%"class.soplex::SoPlex"* %21)
  %23 = call double* @_ZNK6soplex6Vector13get_const_ptrEv(%"class.soplex::Vector"* %22)
  store double* %23, double** %coTest, align 8
  %24 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %9, i32 0, i32 1
  %25 = bitcast %"class.soplex::DVector"* %24 to %"class.soplex::Vector"*
  %26 = call double* @_ZNK6soplex6Vector13get_const_ptrEv(%"class.soplex::Vector"* %25)
  store double* %26, double** %penalty_ptr, align 8
  %27 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %9, i32 0, i32 2
  %28 = bitcast %"class.soplex::DVector"* %27 to %"class.soplex::Vector"*
  %29 = call double* @_ZNK6soplex6Vector13get_const_ptrEv(%"class.soplex::Vector"* %28)
  store double* %29, double** %coPenalty_ptr, align 8
  call void @_ZN6soplex5SPxIdC2Ev(%"class.soplex::SPxId"* %agg.result)
  %30 = load double* @_ZN6soplex8infinityE, align 8
  %31 = fsub double -0.000000e+00, %30
  %32 = load double** %2, align 8
  store double %31, double* %32, align 8
  %33 = bitcast %"class.soplex::SPxSteepPR"* %9 to %"class.soplex::SPxPricer"*
  %34 = getelementptr inbounds %"class.soplex::SPxPricer"* %33, i32 0, i32 2
  %35 = load %"class.soplex::SoPlex"** %34, align 8
  %36 = call i32 @_ZNK6soplex6SoPlex5coDimEv(%"class.soplex::SoPlex"* %35)
  store i32 %36, i32* %end, align 4
  %37 = load i32* %5, align 4
  store i32 %37, i32* %i, align 4
  br label %38

; <label>:38                                      ; preds = %85, %0
  %39 = load i32* %i, align 4
  %40 = load i32* %end, align 4
  %41 = icmp slt i32 %39, %40
  br i1 %41, label %42, label %89

; <label>:42                                      ; preds = %38
  %43 = load i32* %i, align 4
  %44 = sext i32 %43 to i64
  %45 = load double** %test, align 8
  %46 = getelementptr inbounds double* %45, i64 %44
  %47 = load double* %46, align 8
  store double %47, double* %x, align 8
  %48 = load double* %x, align 8
  %49 = bitcast %"class.soplex::SPxSteepPR"* %9 to %"class.soplex::SPxPricer"*
  %50 = getelementptr inbounds %"class.soplex::SPxPricer"* %49, i32 0, i32 3
  %51 = load double* %50, align 8
  %52 = fsub double -0.000000e+00, %51
  %53 = fcmp olt double %48, %52
  br i1 %53, label %54, label %84

; <label>:54                                      ; preds = %42
  %55 = load double* %x, align 8
  %56 = load i32* %i, align 4
  %57 = sext i32 %56 to i64
  %58 = load double** %penalty_ptr, align 8
  %59 = getelementptr inbounds double* %58, i64 %57
  %60 = load double* %59, align 8
  %61 = fdiv double %55, %60
  %62 = load double* %x, align 8
  %63 = fmul double %62, %61
  store double %63, double* %x, align 8
  %64 = load i32* %i, align 4
  %65 = sext i32 %64 to i64
  %66 = load double** %p, align 8
  %67 = getelementptr inbounds double* %66, i64 %65
  %68 = load double* %67, align 8
  %69 = load double* %x, align 8
  %70 = fmul double %69, %68
  store double %70, double* %x, align 8
  %71 = load double* %x, align 8
  %72 = load double** %2, align 8
  %73 = load double* %72, align 8
  %74 = fcmp ogt double %71, %73
  br i1 %74, label %75, label %83

; <label>:75                                      ; preds = %54
  %76 = load double* %x, align 8
  %77 = load double** %2, align 8
  store double %76, double* %77, align 8
  %78 = bitcast %"class.soplex::SPxSteepPR"* %9 to %"class.soplex::SPxPricer"*
  %79 = getelementptr inbounds %"class.soplex::SPxPricer"* %78, i32 0, i32 2
  %80 = load %"class.soplex::SoPlex"** %79, align 8
  %81 = load i32* %i, align 4
  call void @_ZNK6soplex6SoPlex2idEi(%"class.soplex::SPxId"* sret %7, %"class.soplex::SoPlex"* %80, i32 %81)
  %82 = call dereferenceable(4) %"class.soplex::SPxId"* @_ZN6soplex5SPxIdaSERKS0_(%"class.soplex::SPxId"* %agg.result, %"class.soplex::SPxId"* dereferenceable(4) %7)
  br label %83

; <label>:83                                      ; preds = %75, %54
  br label %84

; <label>:84                                      ; preds = %83, %42
  br label %85

; <label>:85                                      ; preds = %84
  %86 = load i32* %6, align 4
  %87 = load i32* %i, align 4
  %88 = add nsw i32 %87, %86
  store i32 %88, i32* %i, align 4
  br label %38

; <label>:89                                      ; preds = %38
  %90 = load i32* %end, align 4
  store i32 %90, i32* %6, align 4
  %91 = bitcast %"class.soplex::SPxSteepPR"* %9 to %"class.soplex::SPxPricer"*
  %92 = getelementptr inbounds %"class.soplex::SPxPricer"* %91, i32 0, i32 2
  %93 = load %"class.soplex::SoPlex"** %92, align 8
  %94 = call i32 @_ZNK6soplex6SoPlex3dimEv(%"class.soplex::SoPlex"* %93)
  store i32 %94, i32* %end, align 4
  %95 = load i32* %3, align 4
  store i32 %95, i32* %i, align 4
  br label %96

; <label>:96                                      ; preds = %143, %89
  %97 = load i32* %i, align 4
  %98 = load i32* %end, align 4
  %99 = icmp slt i32 %97, %98
  br i1 %99, label %100, label %147

; <label>:100                                     ; preds = %96
  %101 = load i32* %i, align 4
  %102 = sext i32 %101 to i64
  %103 = load double** %coTest, align 8
  %104 = getelementptr inbounds double* %103, i64 %102
  %105 = load double* %104, align 8
  store double %105, double* %x, align 8
  %106 = load double* %x, align 8
  %107 = bitcast %"class.soplex::SPxSteepPR"* %9 to %"class.soplex::SPxPricer"*
  %108 = getelementptr inbounds %"class.soplex::SPxPricer"* %107, i32 0, i32 3
  %109 = load double* %108, align 8
  %110 = fsub double -0.000000e+00, %109
  %111 = fcmp olt double %106, %110
  br i1 %111, label %112, label %142

; <label>:112                                     ; preds = %100
  %113 = load double* %x, align 8
  %114 = load i32* %i, align 4
  %115 = sext i32 %114 to i64
  %116 = load double** %coPenalty_ptr, align 8
  %117 = getelementptr inbounds double* %116, i64 %115
  %118 = load double* %117, align 8
  %119 = fdiv double %113, %118
  %120 = load double* %x, align 8
  %121 = fmul double %120, %119
  store double %121, double* %x, align 8
  %122 = load i32* %i, align 4
  %123 = sext i32 %122 to i64
  %124 = load double** %cp, align 8
  %125 = getelementptr inbounds double* %124, i64 %123
  %126 = load double* %125, align 8
  %127 = load double* %x, align 8
  %128 = fmul double %127, %126
  store double %128, double* %x, align 8
  %129 = load double* %x, align 8
  %130 = load double** %2, align 8
  %131 = load double* %130, align 8
  %132 = fcmp ogt double %129, %131
  br i1 %132, label %133, label %141

; <label>:133                                     ; preds = %112
  %134 = load double* %x, align 8
  %135 = load double** %2, align 8
  store double %134, double* %135, align 8
  %136 = bitcast %"class.soplex::SPxSteepPR"* %9 to %"class.soplex::SPxPricer"*
  %137 = getelementptr inbounds %"class.soplex::SPxPricer"* %136, i32 0, i32 2
  %138 = load %"class.soplex::SoPlex"** %137, align 8
  %139 = load i32* %i, align 4
  call void @_ZNK6soplex6SoPlex4coIdEi(%"class.soplex::SPxId"* sret %8, %"class.soplex::SoPlex"* %138, i32 %139)
  %140 = call dereferenceable(4) %"class.soplex::SPxId"* @_ZN6soplex5SPxIdaSERKS0_(%"class.soplex::SPxId"* %agg.result, %"class.soplex::SPxId"* dereferenceable(4) %8)
  br label %141

; <label>:141                                     ; preds = %133, %112
  br label %142

; <label>:142                                     ; preds = %141, %100
  br label %143

; <label>:143                                     ; preds = %142
  %144 = load i32* %4, align 4
  %145 = load i32* %i, align 4
  %146 = add nsw i32 %145, %144
  store i32 %146, i32* %i, align 4
  br label %96

; <label>:147                                     ; preds = %96
  %148 = bitcast %"class.soplex::SPxSteepPR"* %9 to i1 (%"class.soplex::SPxSteepPR"*)***
  %149 = load i1 (%"class.soplex::SPxSteepPR"*)*** %148
  %150 = getelementptr inbounds i1 (%"class.soplex::SPxSteepPR"*)** %149, i64 18
  %151 = load i1 (%"class.soplex::SPxSteepPR"*)** %150
  %152 = call zeroext i1 %151(%"class.soplex::SPxSteepPR"* %9)
  br i1 %152, label %153, label %154

; <label>:153                                     ; preds = %147
  br label %156

; <label>:154                                     ; preds = %147
  call void @__assert_fail(i8* getelementptr inbounds ([15 x i8]* @.str10, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8]* @.str1, i32 0, i32 0), i32 482, i8* getelementptr inbounds ([75 x i8]* @__PRETTY_FUNCTION__._ZN6soplex10SPxSteepPR12selectEnterXERdiiii, i32 0, i32 0)) #10
  unreachable
                                                  ; No predecessors!
  br label %156

; <label>:156                                     ; preds = %155, %153
  ret void
}

; Function Attrs: uwtable
define linkonce_odr dereferenceable(16) %"class.soplex::Vector"* @_ZNK6soplex6SoPlex4testEv(%"class.soplex::SoPlex"* %this) #3 align 2 {
  %1 = alloca %"class.soplex::SoPlex"*, align 8
  store %"class.soplex::SoPlex"* %this, %"class.soplex::SoPlex"** %1, align 8
  %2 = load %"class.soplex::SoPlex"** %1
  %3 = call i32 @_ZNK6soplex6SoPlex4typeEv(%"class.soplex::SoPlex"* %2)
  %4 = icmp eq i32 %3, -1
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  br label %8

; <label>:6                                       ; preds = %0
  call void @__assert_fail(i8* getelementptr inbounds ([16 x i8]* @.str31, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8]* @.str32, i32 0, i32 0), i32 1098, i8* getelementptr inbounds ([51 x i8]* @__PRETTY_FUNCTION__._ZNK6soplex6SoPlex4testEv, i32 0, i32 0)) #10
  unreachable
                                                  ; No predecessors!
  br label %8

; <label>:8                                       ; preds = %7, %5
  %9 = getelementptr inbounds %"class.soplex::SoPlex"* %2, i32 0, i32 49
  %10 = bitcast %"class.soplex::DVector"* %9 to %"class.soplex::Vector"*
  ret %"class.soplex::Vector"* %10
}

; Function Attrs: uwtable
define linkonce_odr dereferenceable(16) %"class.soplex::Vector"* @_ZNK6soplex6SoPlex6coTestEv(%"class.soplex::SoPlex"* %this) #3 align 2 {
  %1 = alloca %"class.soplex::SoPlex"*, align 8
  store %"class.soplex::SoPlex"* %this, %"class.soplex::SoPlex"** %1, align 8
  %2 = load %"class.soplex::SoPlex"** %1
  %3 = call i32 @_ZNK6soplex6SoPlex4typeEv(%"class.soplex::SoPlex"* %2)
  %4 = icmp eq i32 %3, -1
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  br label %8

; <label>:6                                       ; preds = %0
  call void @__assert_fail(i8* getelementptr inbounds ([16 x i8]* @.str31, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8]* @.str32, i32 0, i32 0), i32 1032, i8* getelementptr inbounds ([53 x i8]* @__PRETTY_FUNCTION__._ZNK6soplex6SoPlex6coTestEv, i32 0, i32 0)) #10
  unreachable
                                                  ; No predecessors!
  br label %8

; <label>:8                                       ; preds = %7, %5
  %9 = getelementptr inbounds %"class.soplex::SoPlex"* %2, i32 0, i32 48
  %10 = bitcast %"class.soplex::DVector"* %9 to %"class.soplex::Vector"*
  ret %"class.soplex::Vector"* %10
}

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN6soplex5SPxIdC2Ev(%"class.soplex::SPxId"* %this) unnamed_addr #2 align 2 {
  %1 = alloca %"class.soplex::SPxId"*, align 8
  store %"class.soplex::SPxId"* %this, %"class.soplex::SPxId"** %1, align 8
  %2 = load %"class.soplex::SPxId"** %1
  %3 = bitcast %"class.soplex::SPxId"* %2 to %"class.soplex::DataKey"*
  call void @_ZN6soplex7DataKeyC2Eii(%"class.soplex::DataKey"* %3, i32 0, i32 -1)
  ret void
}

; Function Attrs: uwtable
define linkonce_odr dereferenceable(4) %"class.soplex::SPxId"* @_ZN6soplex5SPxIdaSERKS0_(%"class.soplex::SPxId"* %this, %"class.soplex::SPxId"* dereferenceable(4) %id) #3 align 2 {
  %1 = alloca %"class.soplex::SPxId"*, align 8
  %2 = alloca %"class.soplex::SPxId"*, align 8
  store %"class.soplex::SPxId"* %this, %"class.soplex::SPxId"** %1, align 8
  store %"class.soplex::SPxId"* %id, %"class.soplex::SPxId"** %2, align 8
  %3 = load %"class.soplex::SPxId"** %1
  %4 = load %"class.soplex::SPxId"** %2, align 8
  %5 = icmp ne %"class.soplex::SPxId"* %3, %4
  br i1 %5, label %6, label %11

; <label>:6                                       ; preds = %0
  %7 = bitcast %"class.soplex::SPxId"* %3 to %"class.soplex::DataKey"*
  %8 = load %"class.soplex::SPxId"** %2, align 8
  %9 = bitcast %"class.soplex::SPxId"* %8 to %"class.soplex::DataKey"*
  %10 = call dereferenceable(4) %"class.soplex::DataKey"* @_ZN6soplex7DataKeyaSERKS0_(%"class.soplex::DataKey"* %7, %"class.soplex::DataKey"* dereferenceable(4) %9)
  br label %11

; <label>:11                                      ; preds = %6, %0
  ret %"class.soplex::SPxId"* %3
}

; Function Attrs: uwtable
define linkonce_odr void @_ZNK6soplex6SoPlex2idEi(%"class.soplex::SPxId"* noalias sret %agg.result, %"class.soplex::SoPlex"* %this, i32 %i) #3 align 2 {
  %1 = alloca %"class.soplex::SoPlex"*, align 8
  %2 = alloca i32, align 4
  %rid = alloca %"class.soplex::SPxRowId", align 4
  %cid = alloca %"class.soplex::SPxColId", align 4
  store %"class.soplex::SoPlex"* %this, %"class.soplex::SoPlex"** %1, align 8
  store i32 %i, i32* %2, align 4
  %3 = load %"class.soplex::SoPlex"** %1
  %4 = call i32 @_ZNK6soplex6SoPlex3repEv(%"class.soplex::SoPlex"* %3)
  %5 = icmp eq i32 %4, -1
  br i1 %5, label %6, label %9

; <label>:6                                       ; preds = %0
  %7 = bitcast %"class.soplex::SoPlex"* %3 to %"class.soplex::SPxLP"*
  %8 = load i32* %2, align 4
  call void @_ZNK6soplex5SPxLP3rIdEi(%"class.soplex::SPxRowId"* sret %rid, %"class.soplex::SPxLP"* %7, i32 %8)
  call void @_ZN6soplex5SPxIdC2ERKNS_8SPxRowIdE(%"class.soplex::SPxId"* %agg.result, %"class.soplex::SPxRowId"* dereferenceable(4) %rid)
  br label %12

; <label>:9                                       ; preds = %0
  %10 = bitcast %"class.soplex::SoPlex"* %3 to %"class.soplex::SPxLP"*
  %11 = load i32* %2, align 4
  call void @_ZNK6soplex5SPxLP3cIdEi(%"class.soplex::SPxColId"* sret %cid, %"class.soplex::SPxLP"* %10, i32 %11)
  call void @_ZN6soplex5SPxIdC2ERKNS_8SPxColIdE(%"class.soplex::SPxId"* %agg.result, %"class.soplex::SPxColId"* dereferenceable(4) %cid)
  br label %12

; <label>:12                                      ; preds = %9, %6
  ret void
}

; Function Attrs: uwtable
define linkonce_odr void @_ZNK6soplex6SoPlex4coIdEi(%"class.soplex::SPxId"* noalias sret %agg.result, %"class.soplex::SoPlex"* %this, i32 %i) #3 align 2 {
  %1 = alloca %"class.soplex::SoPlex"*, align 8
  %2 = alloca i32, align 4
  %cid = alloca %"class.soplex::SPxColId", align 4
  %rid = alloca %"class.soplex::SPxRowId", align 4
  store %"class.soplex::SoPlex"* %this, %"class.soplex::SoPlex"** %1, align 8
  store i32 %i, i32* %2, align 4
  %3 = load %"class.soplex::SoPlex"** %1
  %4 = call i32 @_ZNK6soplex6SoPlex3repEv(%"class.soplex::SoPlex"* %3)
  %5 = icmp eq i32 %4, -1
  br i1 %5, label %6, label %9

; <label>:6                                       ; preds = %0
  %7 = bitcast %"class.soplex::SoPlex"* %3 to %"class.soplex::SPxLP"*
  %8 = load i32* %2, align 4
  call void @_ZNK6soplex5SPxLP3cIdEi(%"class.soplex::SPxColId"* sret %cid, %"class.soplex::SPxLP"* %7, i32 %8)
  call void @_ZN6soplex5SPxIdC2ERKNS_8SPxColIdE(%"class.soplex::SPxId"* %agg.result, %"class.soplex::SPxColId"* dereferenceable(4) %cid)
  br label %12

; <label>:9                                       ; preds = %0
  %10 = bitcast %"class.soplex::SoPlex"* %3 to %"class.soplex::SPxLP"*
  %11 = load i32* %2, align 4
  call void @_ZNK6soplex5SPxLP3rIdEi(%"class.soplex::SPxRowId"* sret %rid, %"class.soplex::SPxLP"* %10, i32 %11)
  call void @_ZN6soplex5SPxIdC2ERKNS_8SPxRowIdE(%"class.soplex::SPxId"* %agg.result, %"class.soplex::SPxRowId"* dereferenceable(4) %rid)
  br label %12

; <label>:12                                      ; preds = %9, %6
  ret void
}

; Function Attrs: uwtable
define void @_ZN6soplex10SPxSteepPR11selectEnterEv(%"class.soplex::SPxId"* noalias sret %agg.result, %"class.soplex::SPxSteepPR"* %this) unnamed_addr #3 align 2 {
  %1 = alloca %"class.soplex::SPxSteepPR"*, align 8
  %best = alloca double, align 8
  %2 = alloca %"class.soplex::SPxId", align 4
  %delta = alloca %"class.soplex::SSVector"*, align 8
  store %"class.soplex::SPxSteepPR"* %this, %"class.soplex::SPxSteepPR"** %1, align 8
  %3 = load %"class.soplex::SPxSteepPR"** %1
  %4 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %3, i32 0, i32 6
  call void @_ZN6soplex10SPxSteepPR12selectEnterXERdiiii(%"class.soplex::SPxId"* sret %2, %"class.soplex::SPxSteepPR"* %3, double* dereferenceable(8) %best, i32 0, i32 1, i32 0, i32 1)
  %5 = call dereferenceable(4) %"class.soplex::SPxId"* @_ZN6soplex5SPxIdaSERKS0_(%"class.soplex::SPxId"* %4, %"class.soplex::SPxId"* dereferenceable(4) %2)
  %6 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %3, i32 0, i32 6
  %7 = call zeroext i1 @_ZNK6soplex5SPxId7isValidEv(%"class.soplex::SPxId"* %6)
  br i1 %7, label %8, label %40

; <label>:8                                       ; preds = %0
  %9 = bitcast %"class.soplex::SPxSteepPR"* %3 to %"class.soplex::SPxPricer"*
  %10 = getelementptr inbounds %"class.soplex::SPxPricer"* %9, i32 0, i32 2
  %11 = load %"class.soplex::SoPlex"** %10, align 8
  %12 = call dereferenceable(104) %"class.soplex::UpdateVector"* @_ZNK6soplex6SoPlex4fVecEv(%"class.soplex::SoPlex"* %11)
  %13 = call dereferenceable(64) %"class.soplex::SSVector"* @_ZN6soplex12UpdateVector5deltaEv(%"class.soplex::UpdateVector"* %12)
  store %"class.soplex::SSVector"* %13, %"class.soplex::SSVector"** %delta, align 8
  %14 = bitcast %"class.soplex::SPxSteepPR"* %3 to %"class.soplex::SPxPricer"*
  %15 = getelementptr inbounds %"class.soplex::SPxPricer"* %14, i32 0, i32 2
  %16 = load %"class.soplex::SoPlex"** %15, align 8
  %17 = call dereferenceable(208) %"class.soplex::SPxBasis"* @_ZN6soplex6SoPlex5basisEv(%"class.soplex::SoPlex"* %16)
  %18 = load %"class.soplex::SSVector"** %delta, align 8
  %19 = bitcast %"class.soplex::SPxSteepPR"* %3 to %"class.soplex::SPxPricer"*
  %20 = getelementptr inbounds %"class.soplex::SPxPricer"* %19, i32 0, i32 2
  %21 = load %"class.soplex::SoPlex"** %20, align 8
  %22 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %3, i32 0, i32 6
  %23 = call dereferenceable(8) %"class.soplex::SVector"* @_ZNK6soplex6SoPlex6vectorERKNS_5SPxIdE(%"class.soplex::SoPlex"* %21, %"class.soplex::SPxId"* dereferenceable(4) %22)
  call void @_ZN6soplex8SPxBasis12solve4updateERNS_8SSVectorERKNS_7SVectorE(%"class.soplex::SPxBasis"* %17, %"class.soplex::SSVector"* dereferenceable(64) %18, %"class.soplex::SVector"* dereferenceable(8) %23)
  %24 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %3, i32 0, i32 13
  %25 = load double* %24, align 8
  %26 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %3, i32 0, i32 4
  %27 = getelementptr inbounds %"class.soplex::SSVector"* %26, i32 0, i32 3
  store double %25, double* %27, align 8
  %28 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %3, i32 0, i32 4
  %29 = load %"class.soplex::SSVector"** %delta, align 8
  call void @_ZN6soplex8SSVector16setup_and_assignERS0_(%"class.soplex::SSVector"* %28, %"class.soplex::SSVector"* dereferenceable(64) %29)
  %30 = load %"class.soplex::SSVector"** %delta, align 8
  %31 = call double @_ZNK6soplex8SSVector7length2Ev(%"class.soplex::SSVector"* %30)
  %32 = fadd double 1.000000e+00, %31
  %33 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %3, i32 0, i32 7
  store double %32, double* %33, align 8
  %34 = bitcast %"class.soplex::SPxSteepPR"* %3 to %"class.soplex::SPxPricer"*
  %35 = getelementptr inbounds %"class.soplex::SPxPricer"* %34, i32 0, i32 2
  %36 = load %"class.soplex::SoPlex"** %35, align 8
  %37 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %3, i32 0, i32 3
  %38 = bitcast %"class.soplex::DVector"* %37 to %"class.soplex::Vector"*
  %39 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %3, i32 0, i32 4
  call void @_ZN6soplex6SoPlex13setup4coSolveEPNS_6VectorEPNS_8SSVectorE(%"class.soplex::SoPlex"* %36, %"class.soplex::Vector"* %38, %"class.soplex::SSVector"* %39)
  br label %40

; <label>:40                                      ; preds = %8, %0
  %41 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %3, i32 0, i32 6
  call void @_ZN6soplex5SPxIdC2ERKS0_(%"class.soplex::SPxId"* %agg.result, %"class.soplex::SPxId"* dereferenceable(4) %41)
  ret void
}

; Function Attrs: uwtable
define linkonce_odr void @_ZN6soplex8SPxBasis12solve4updateERNS_8SSVectorERKNS_7SVectorE(%"class.soplex::SPxBasis"* %this, %"class.soplex::SSVector"* dereferenceable(64) %x, %"class.soplex::SVector"* dereferenceable(8) %rhs) #3 align 2 {
  %1 = alloca %"class.soplex::SPxBasis"*, align 8
  %2 = alloca %"class.soplex::SSVector"*, align 8
  %3 = alloca %"class.soplex::SVector"*, align 8
  store %"class.soplex::SPxBasis"* %this, %"class.soplex::SPxBasis"** %1, align 8
  store %"class.soplex::SSVector"* %x, %"class.soplex::SSVector"** %2, align 8
  store %"class.soplex::SVector"* %rhs, %"class.soplex::SVector"** %3, align 8
  %4 = load %"class.soplex::SPxBasis"** %1
  %5 = getelementptr inbounds %"class.soplex::SPxBasis"* %4, i32 0, i32 6
  %6 = load i8* %5, align 1
  %7 = trunc i8 %6 to i1
  br i1 %7, label %13, label %8

; <label>:8                                       ; preds = %0
  %9 = bitcast %"class.soplex::SPxBasis"* %4 to void (%"class.soplex::SPxBasis"*)***
  %10 = load void (%"class.soplex::SPxBasis"*)*** %9
  %11 = getelementptr inbounds void (%"class.soplex::SPxBasis"*)** %10, i64 10
  %12 = load void (%"class.soplex::SPxBasis"*)** %11
  call void %12(%"class.soplex::SPxBasis"* %4)
  br label %13

; <label>:13                                      ; preds = %8, %0
  %14 = getelementptr inbounds %"class.soplex::SPxBasis"* %4, i32 0, i32 5
  %15 = load %"class.soplex::SLinSolver"** %14, align 8
  %16 = bitcast %"class.soplex::SLinSolver"* %15 to void (%"class.soplex::SLinSolver"*, %"class.soplex::SSVector"*, %"class.soplex::SVector"*)***
  %17 = load void (%"class.soplex::SLinSolver"*, %"class.soplex::SSVector"*, %"class.soplex::SVector"*)*** %16
  %18 = getelementptr inbounds void (%"class.soplex::SLinSolver"*, %"class.soplex::SSVector"*, %"class.soplex::SVector"*)** %17, i64 16
  %19 = load void (%"class.soplex::SLinSolver"*, %"class.soplex::SSVector"*, %"class.soplex::SVector"*)** %18
  %20 = load %"class.soplex::SSVector"** %2, align 8
  %21 = load %"class.soplex::SVector"** %3, align 8
  call void %19(%"class.soplex::SLinSolver"* %15, %"class.soplex::SSVector"* dereferenceable(64) %20, %"class.soplex::SVector"* dereferenceable(8) %21)
  ret void
}

; Function Attrs: uwtable
define linkonce_odr dereferenceable(8) %"class.soplex::SVector"* @_ZNK6soplex6SoPlex6vectorERKNS_5SPxIdE(%"class.soplex::SoPlex"* %this, %"class.soplex::SPxId"* dereferenceable(4) %p_id) #3 align 2 {
  %1 = alloca %"class.soplex::SoPlex"*, align 8
  %2 = alloca %"class.soplex::SPxId"*, align 8
  %3 = alloca %"class.soplex::SPxRowId", align 4
  %4 = alloca %"class.soplex::SPxColId", align 4
  store %"class.soplex::SoPlex"* %this, %"class.soplex::SoPlex"** %1, align 8
  store %"class.soplex::SPxId"* %p_id, %"class.soplex::SPxId"** %2, align 8
  %5 = load %"class.soplex::SoPlex"** %1
  %6 = load %"class.soplex::SPxId"** %2, align 8
  %7 = call zeroext i1 @_ZNK6soplex5SPxId7isValidEv(%"class.soplex::SPxId"* %6)
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %0
  br label %11

; <label>:9                                       ; preds = %0
  call void @__assert_fail(i8* getelementptr inbounds ([15 x i8]* @.str33, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8]* @.str32, i32 0, i32 0), i32 757, i8* getelementptr inbounds ([75 x i8]* @__PRETTY_FUNCTION__._ZNK6soplex6SoPlex6vectorERKNS_5SPxIdE, i32 0, i32 0)) #10
  unreachable
                                                  ; No predecessors!
  br label %11

; <label>:11                                      ; preds = %10, %8
  %12 = load %"class.soplex::SPxId"** %2, align 8
  %13 = call zeroext i1 @_ZNK6soplex5SPxId10isSPxRowIdEv(%"class.soplex::SPxId"* %12)
  br i1 %13, label %14, label %17

; <label>:14                                      ; preds = %11
  %15 = load %"class.soplex::SPxId"** %2, align 8
  call void @_ZN6soplex8SPxRowIdC1ERKNS_5SPxIdE(%"class.soplex::SPxRowId"* %3, %"class.soplex::SPxId"* dereferenceable(4) %15)
  %16 = call dereferenceable(8) %"class.soplex::SVector"* @_ZNK6soplex6SoPlex6vectorERKNS_8SPxRowIdE(%"class.soplex::SoPlex"* %5, %"class.soplex::SPxRowId"* dereferenceable(4) %3)
  br label %20

; <label>:17                                      ; preds = %11
  %18 = load %"class.soplex::SPxId"** %2, align 8
  call void @_ZN6soplex8SPxColIdC1ERKNS_5SPxIdE(%"class.soplex::SPxColId"* %4, %"class.soplex::SPxId"* dereferenceable(4) %18)
  %19 = call dereferenceable(8) %"class.soplex::SVector"* @_ZNK6soplex6SoPlex6vectorERKNS_8SPxColIdE(%"class.soplex::SoPlex"* %5, %"class.soplex::SPxColId"* dereferenceable(4) %4)
  br label %20

; <label>:20                                      ; preds = %17, %14
  %21 = phi %"class.soplex::SVector"* [ %16, %14 ], [ %19, %17 ]
  ret %"class.soplex::SVector"* %21
}

; Function Attrs: uwtable
define linkonce_odr void @_ZN6soplex6SoPlex13setup4coSolveEPNS_6VectorEPNS_8SSVectorE(%"class.soplex::SoPlex"* %this, %"class.soplex::Vector"* %p_y, %"class.soplex::SSVector"* %p_rhs) #3 align 2 {
  %1 = alloca %"class.soplex::SoPlex"*, align 8
  %2 = alloca %"class.soplex::Vector"*, align 8
  %3 = alloca %"class.soplex::SSVector"*, align 8
  store %"class.soplex::SoPlex"* %this, %"class.soplex::SoPlex"** %1, align 8
  store %"class.soplex::Vector"* %p_y, %"class.soplex::Vector"** %2, align 8
  store %"class.soplex::SSVector"* %p_rhs, %"class.soplex::SSVector"** %3, align 8
  %4 = load %"class.soplex::SoPlex"** %1
  %5 = call i32 @_ZNK6soplex6SoPlex4typeEv(%"class.soplex::SoPlex"* %4)
  %6 = icmp eq i32 %5, -1
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %0
  br label %10

; <label>:8                                       ; preds = %0
  call void @__assert_fail(i8* getelementptr inbounds ([16 x i8]* @.str31, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8]* @.str32, i32 0, i32 0), i32 1275, i8* getelementptr inbounds ([73 x i8]* @__PRETTY_FUNCTION__._ZN6soplex6SoPlex13setup4coSolveEPNS_6VectorEPNS_8SSVectorE, i32 0, i32 0)) #10
  unreachable
                                                  ; No predecessors!
  br label %10

; <label>:10                                      ; preds = %9, %7
  %11 = load %"class.soplex::Vector"** %2, align 8
  %12 = getelementptr inbounds %"class.soplex::SoPlex"* %4, i32 0, i32 18
  store %"class.soplex::Vector"* %11, %"class.soplex::Vector"** %12, align 8
  %13 = load %"class.soplex::SSVector"** %3, align 8
  %14 = getelementptr inbounds %"class.soplex::SoPlex"* %4, i32 0, i32 19
  store %"class.soplex::SSVector"* %13, %"class.soplex::SSVector"** %14, align 8
  ret void
}

; Function Attrs: uwtable
define void @_ZN6soplex10SPxSteepPR9addedVecsEi(%"class.soplex::SPxSteepPR"* %this, i32 %n) unnamed_addr #3 align 2 {
  %1 = alloca %"class.soplex::SPxSteepPR"*, align 8
  %2 = alloca i32, align 4
  store %"class.soplex::SPxSteepPR"* %this, %"class.soplex::SPxSteepPR"** %1, align 8
  store i32 %n, i32* %2, align 4
  %3 = load %"class.soplex::SPxSteepPR"** %1
  %4 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %3, i32 0, i32 1
  %5 = bitcast %"class.soplex::DVector"* %4 to %"class.soplex::Vector"*
  %6 = call i32 @_ZNK6soplex6Vector3dimEv(%"class.soplex::Vector"* %5)
  store i32 %6, i32* %2, align 4
  %7 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %3, i32 0, i32 10
  %8 = bitcast %"class.soplex::SPxSteepPR"* %3 to %"class.soplex::SPxPricer"*
  %9 = getelementptr inbounds %"class.soplex::SPxPricer"* %8, i32 0, i32 2
  %10 = load %"class.soplex::SoPlex"** %9, align 8
  %11 = call i32 @_ZNK6soplex6SoPlex5coDimEv(%"class.soplex::SoPlex"* %10)
  call void @_ZN6soplex9DataArrayIdE6reSizeEi(%"class.soplex::DataArray.3"* %7, i32 %11)
  %12 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %3, i32 0, i32 1
  %13 = bitcast %"class.soplex::SPxSteepPR"* %3 to %"class.soplex::SPxPricer"*
  %14 = getelementptr inbounds %"class.soplex::SPxPricer"* %13, i32 0, i32 2
  %15 = load %"class.soplex::SoPlex"** %14, align 8
  %16 = call i32 @_ZNK6soplex6SoPlex5coDimEv(%"class.soplex::SoPlex"* %15)
  call void @_ZN6soplex7DVector5reDimEi(%"class.soplex::DVector"* %12, i32 %16)
  %17 = bitcast %"class.soplex::SPxSteepPR"* %3 to %"class.soplex::SPxPricer"*
  %18 = getelementptr inbounds %"class.soplex::SPxPricer"* %17, i32 0, i32 2
  %19 = load %"class.soplex::SoPlex"** %18, align 8
  %20 = call i32 @_ZNK6soplex6SoPlex4typeEv(%"class.soplex::SoPlex"* %19)
  %21 = icmp eq i32 %20, -1
  br i1 %21, label %22, label %42

; <label>:22                                      ; preds = %0
  %23 = bitcast %"class.soplex::SPxSteepPR"* %3 to %"class.soplex::SPxPricer"*
  %24 = getelementptr inbounds %"class.soplex::SPxPricer"* %23, i32 0, i32 2
  %25 = load %"class.soplex::SoPlex"** %24, align 8
  %26 = call i32 @_ZNK6soplex6SoPlex4typeEv(%"class.soplex::SoPlex"* %25)
  call void @_ZN6soplex10SPxSteepPR10setupPrefsENS_6SoPlex4TypeE(%"class.soplex::SPxSteepPR"* %3, i32 %26)
  br label %27

; <label>:27                                      ; preds = %38, %22
  %28 = load i32* %2, align 4
  %29 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %3, i32 0, i32 1
  %30 = bitcast %"class.soplex::DVector"* %29 to %"class.soplex::Vector"*
  %31 = call i32 @_ZNK6soplex6Vector3dimEv(%"class.soplex::Vector"* %30)
  %32 = icmp slt i32 %28, %31
  br i1 %32, label %33, label %41

; <label>:33                                      ; preds = %27
  %34 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %3, i32 0, i32 1
  %35 = bitcast %"class.soplex::DVector"* %34 to %"class.soplex::Vector"*
  %36 = load i32* %2, align 4
  %37 = call dereferenceable(8) double* @_ZN6soplex6VectorixEi(%"class.soplex::Vector"* %35, i32 %36)
  store double 2.000000e+00, double* %37
  br label %38

; <label>:38                                      ; preds = %33
  %39 = load i32* %2, align 4
  %40 = add nsw i32 %39, 1
  store i32 %40, i32* %2, align 4
  br label %27

; <label>:41                                      ; preds = %27
  br label %42

; <label>:42                                      ; preds = %41, %0
  %43 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %3, i32 0, i32 8
  store i32 0, i32* %43, align 4
  ret void
}

; Function Attrs: uwtable
define void @_ZN6soplex10SPxSteepPR11addedCoVecsEi(%"class.soplex::SPxSteepPR"* %this, i32 %n) unnamed_addr #3 align 2 {
  %1 = alloca %"class.soplex::SPxSteepPR"*, align 8
  %2 = alloca i32, align 4
  store %"class.soplex::SPxSteepPR"* %this, %"class.soplex::SPxSteepPR"** %1, align 8
  store i32 %n, i32* %2, align 4
  %3 = load %"class.soplex::SPxSteepPR"** %1
  %4 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %3, i32 0, i32 2
  %5 = bitcast %"class.soplex::DVector"* %4 to %"class.soplex::Vector"*
  %6 = call i32 @_ZNK6soplex6Vector3dimEv(%"class.soplex::Vector"* %5)
  store i32 %6, i32* %2, align 4
  %7 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %3, i32 0, i32 11
  %8 = bitcast %"class.soplex::SPxSteepPR"* %3 to %"class.soplex::SPxPricer"*
  %9 = getelementptr inbounds %"class.soplex::SPxPricer"* %8, i32 0, i32 2
  %10 = load %"class.soplex::SoPlex"** %9, align 8
  %11 = call i32 @_ZNK6soplex6SoPlex3dimEv(%"class.soplex::SoPlex"* %10)
  call void @_ZN6soplex9DataArrayIdE6reSizeEi(%"class.soplex::DataArray.3"* %7, i32 %11)
  %12 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %3, i32 0, i32 9
  %13 = bitcast %"class.soplex::SPxSteepPR"* %3 to %"class.soplex::SPxPricer"*
  %14 = getelementptr inbounds %"class.soplex::SPxPricer"* %13, i32 0, i32 2
  %15 = load %"class.soplex::SoPlex"** %14, align 8
  %16 = call i32 @_ZNK6soplex6SoPlex3dimEv(%"class.soplex::SoPlex"* %15)
  call void @_ZN6soplex9DataArrayIdE6reSizeEi(%"class.soplex::DataArray.3"* %12, i32 %16)
  %17 = bitcast %"class.soplex::SPxSteepPR"* %3 to %"class.soplex::SPxPricer"*
  %18 = getelementptr inbounds %"class.soplex::SPxPricer"* %17, i32 0, i32 2
  %19 = load %"class.soplex::SoPlex"** %18, align 8
  %20 = call i32 @_ZNK6soplex6SoPlex4typeEv(%"class.soplex::SoPlex"* %19)
  call void @_ZN6soplex10SPxSteepPR10setupPrefsENS_6SoPlex4TypeE(%"class.soplex::SPxSteepPR"* %3, i32 %20)
  %21 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %3, i32 0, i32 3
  %22 = bitcast %"class.soplex::SPxSteepPR"* %3 to %"class.soplex::SPxPricer"*
  %23 = getelementptr inbounds %"class.soplex::SPxPricer"* %22, i32 0, i32 2
  %24 = load %"class.soplex::SoPlex"** %23, align 8
  %25 = call i32 @_ZNK6soplex6SoPlex3dimEv(%"class.soplex::SoPlex"* %24)
  call void @_ZN6soplex7DVector5reDimEi(%"class.soplex::DVector"* %21, i32 %25)
  %26 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %3, i32 0, i32 2
  %27 = bitcast %"class.soplex::SPxSteepPR"* %3 to %"class.soplex::SPxPricer"*
  %28 = getelementptr inbounds %"class.soplex::SPxPricer"* %27, i32 0, i32 2
  %29 = load %"class.soplex::SoPlex"** %28, align 8
  %30 = call i32 @_ZNK6soplex6SoPlex3dimEv(%"class.soplex::SoPlex"* %29)
  call void @_ZN6soplex7DVector5reDimEi(%"class.soplex::DVector"* %26, i32 %30)
  br label %31

; <label>:31                                      ; preds = %42, %0
  %32 = load i32* %2, align 4
  %33 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %3, i32 0, i32 2
  %34 = bitcast %"class.soplex::DVector"* %33 to %"class.soplex::Vector"*
  %35 = call i32 @_ZNK6soplex6Vector3dimEv(%"class.soplex::Vector"* %34)
  %36 = icmp slt i32 %32, %35
  br i1 %36, label %37, label %45

; <label>:37                                      ; preds = %31
  %38 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %3, i32 0, i32 2
  %39 = bitcast %"class.soplex::DVector"* %38 to %"class.soplex::Vector"*
  %40 = load i32* %2, align 4
  %41 = call dereferenceable(8) double* @_ZN6soplex6VectorixEi(%"class.soplex::Vector"* %39, i32 %40)
  store double 1.000000e+00, double* %41
  br label %42

; <label>:42                                      ; preds = %37
  %43 = load i32* %2, align 4
  %44 = add nsw i32 %43, 1
  store i32 %44, i32* %2, align 4
  br label %31

; <label>:45                                      ; preds = %31
  %46 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %3, i32 0, i32 8
  store i32 0, i32* %46, align 4
  ret void
}

; Function Attrs: uwtable
define void @_ZN6soplex10SPxSteepPR10removedVecEi(%"class.soplex::SPxSteepPR"* %this, i32 %i) unnamed_addr #3 align 2 {
  %1 = alloca %"class.soplex::SPxSteepPR"*, align 8
  %2 = alloca i32, align 4
  store %"class.soplex::SPxSteepPR"* %this, %"class.soplex::SPxSteepPR"** %1, align 8
  store i32 %i, i32* %2, align 4
  %3 = load %"class.soplex::SPxSteepPR"** %1
  %4 = bitcast %"class.soplex::SPxSteepPR"* %3 to %"class.soplex::SPxPricer"*
  %5 = getelementptr inbounds %"class.soplex::SPxPricer"* %4, i32 0, i32 2
  %6 = load %"class.soplex::SoPlex"** %5, align 8
  %7 = icmp ne %"class.soplex::SoPlex"* %6, null
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %0
  br label %11

; <label>:9                                       ; preds = %0
  call void @__assert_fail(i8* getelementptr inbounds ([15 x i8]* @.str13, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8]* @.str1, i32 0, i32 0), i32 540, i8* getelementptr inbounds ([49 x i8]* @__PRETTY_FUNCTION__._ZN6soplex10SPxSteepPR10removedVecEi, i32 0, i32 0)) #10
  unreachable
                                                  ; No predecessors!
  br label %11

; <label>:11                                      ; preds = %10, %8
  %12 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %3, i32 0, i32 1
  %13 = bitcast %"class.soplex::DVector"* %12 to %"class.soplex::Vector"*
  %14 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %3, i32 0, i32 1
  %15 = bitcast %"class.soplex::DVector"* %14 to %"class.soplex::Vector"*
  %16 = call i32 @_ZNK6soplex6Vector3dimEv(%"class.soplex::Vector"* %15)
  %17 = call dereferenceable(8) double* @_ZN6soplex6VectorixEi(%"class.soplex::Vector"* %13, i32 %16)
  %18 = load double* %17
  %19 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %3, i32 0, i32 1
  %20 = bitcast %"class.soplex::DVector"* %19 to %"class.soplex::Vector"*
  %21 = load i32* %2, align 4
  %22 = call dereferenceable(8) double* @_ZN6soplex6VectorixEi(%"class.soplex::Vector"* %20, i32 %21)
  store double %18, double* %22
  %23 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %3, i32 0, i32 1
  %24 = bitcast %"class.soplex::SPxSteepPR"* %3 to %"class.soplex::SPxPricer"*
  %25 = getelementptr inbounds %"class.soplex::SPxPricer"* %24, i32 0, i32 2
  %26 = load %"class.soplex::SoPlex"** %25, align 8
  %27 = call i32 @_ZNK6soplex6SoPlex5coDimEv(%"class.soplex::SoPlex"* %26)
  call void @_ZN6soplex7DVector5reDimEi(%"class.soplex::DVector"* %23, i32 %27)
  %28 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %3, i32 0, i32 8
  store i32 0, i32* %28, align 4
  ret void
}

; Function Attrs: uwtable
define void @_ZN6soplex10SPxSteepPR11removedVecsEPKi(%"class.soplex::SPxSteepPR"* %this, i32* %perm) unnamed_addr #3 align 2 {
  %1 = alloca %"class.soplex::SPxSteepPR"*, align 8
  %2 = alloca i32*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store %"class.soplex::SPxSteepPR"* %this, %"class.soplex::SPxSteepPR"** %1, align 8
  store i32* %perm, i32** %2, align 8
  %3 = load %"class.soplex::SPxSteepPR"** %1
  %4 = bitcast %"class.soplex::SPxSteepPR"* %3 to %"class.soplex::SPxPricer"*
  %5 = getelementptr inbounds %"class.soplex::SPxPricer"* %4, i32 0, i32 2
  %6 = load %"class.soplex::SoPlex"** %5, align 8
  %7 = icmp ne %"class.soplex::SoPlex"* %6, null
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %0
  br label %11

; <label>:9                                       ; preds = %0
  call void @__assert_fail(i8* getelementptr inbounds ([15 x i8]* @.str13, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8]* @.str1, i32 0, i32 0), i32 548, i8* getelementptr inbounds ([58 x i8]* @__PRETTY_FUNCTION__._ZN6soplex10SPxSteepPR11removedVecsEPKi, i32 0, i32 0)) #10
  unreachable
                                                  ; No predecessors!
  br label %11

; <label>:11                                      ; preds = %10, %8
  %12 = bitcast %"class.soplex::SPxSteepPR"* %3 to %"class.soplex::SPxPricer"*
  %13 = getelementptr inbounds %"class.soplex::SPxPricer"* %12, i32 0, i32 2
  %14 = load %"class.soplex::SoPlex"** %13, align 8
  %15 = call i32 @_ZNK6soplex6SoPlex4typeEv(%"class.soplex::SoPlex"* %14)
  %16 = icmp eq i32 %15, -1
  br i1 %16, label %17, label %51

; <label>:17                                      ; preds = %11
  %18 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %3, i32 0, i32 1
  %19 = bitcast %"class.soplex::DVector"* %18 to %"class.soplex::Vector"*
  %20 = call i32 @_ZNK6soplex6Vector3dimEv(%"class.soplex::Vector"* %19)
  store i32 %20, i32* %j, align 4
  store i32 0, i32* %i, align 4
  br label %21

; <label>:21                                      ; preds = %47, %17
  %22 = load i32* %i, align 4
  %23 = load i32* %j, align 4
  %24 = icmp slt i32 %22, %23
  br i1 %24, label %25, label %50

; <label>:25                                      ; preds = %21
  %26 = load i32* %i, align 4
  %27 = sext i32 %26 to i64
  %28 = load i32** %2, align 8
  %29 = getelementptr inbounds i32* %28, i64 %27
  %30 = load i32* %29, align 4
  %31 = icmp sge i32 %30, 0
  br i1 %31, label %32, label %46

; <label>:32                                      ; preds = %25
  %33 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %3, i32 0, i32 1
  %34 = bitcast %"class.soplex::DVector"* %33 to %"class.soplex::Vector"*
  %35 = load i32* %i, align 4
  %36 = call dereferenceable(8) double* @_ZN6soplex6VectorixEi(%"class.soplex::Vector"* %34, i32 %35)
  %37 = load double* %36
  %38 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %3, i32 0, i32 1
  %39 = bitcast %"class.soplex::DVector"* %38 to %"class.soplex::Vector"*
  %40 = load i32* %i, align 4
  %41 = sext i32 %40 to i64
  %42 = load i32** %2, align 8
  %43 = getelementptr inbounds i32* %42, i64 %41
  %44 = load i32* %43, align 4
  %45 = call dereferenceable(8) double* @_ZN6soplex6VectorixEi(%"class.soplex::Vector"* %39, i32 %44)
  store double %37, double* %45
  br label %46

; <label>:46                                      ; preds = %32, %25
  br label %47

; <label>:47                                      ; preds = %46
  %48 = load i32* %i, align 4
  %49 = add nsw i32 %48, 1
  store i32 %49, i32* %i, align 4
  br label %21

; <label>:50                                      ; preds = %21
  br label %51

; <label>:51                                      ; preds = %50, %11
  %52 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %3, i32 0, i32 1
  %53 = bitcast %"class.soplex::SPxSteepPR"* %3 to %"class.soplex::SPxPricer"*
  %54 = getelementptr inbounds %"class.soplex::SPxPricer"* %53, i32 0, i32 2
  %55 = load %"class.soplex::SoPlex"** %54, align 8
  %56 = call i32 @_ZNK6soplex6SoPlex5coDimEv(%"class.soplex::SoPlex"* %55)
  call void @_ZN6soplex7DVector5reDimEi(%"class.soplex::DVector"* %52, i32 %56)
  %57 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %3, i32 0, i32 8
  store i32 0, i32* %57, align 4
  ret void
}

; Function Attrs: uwtable
define void @_ZN6soplex10SPxSteepPR12removedCoVecEi(%"class.soplex::SPxSteepPR"* %this, i32 %i) unnamed_addr #3 align 2 {
  %1 = alloca %"class.soplex::SPxSteepPR"*, align 8
  %2 = alloca i32, align 4
  store %"class.soplex::SPxSteepPR"* %this, %"class.soplex::SPxSteepPR"** %1, align 8
  store i32 %i, i32* %2, align 4
  %3 = load %"class.soplex::SPxSteepPR"** %1
  %4 = bitcast %"class.soplex::SPxSteepPR"* %3 to %"class.soplex::SPxPricer"*
  %5 = getelementptr inbounds %"class.soplex::SPxPricer"* %4, i32 0, i32 2
  %6 = load %"class.soplex::SoPlex"** %5, align 8
  %7 = icmp ne %"class.soplex::SoPlex"* %6, null
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %0
  br label %11

; <label>:9                                       ; preds = %0
  call void @__assert_fail(i8* getelementptr inbounds ([15 x i8]* @.str13, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8]* @.str1, i32 0, i32 0), i32 563, i8* getelementptr inbounds ([51 x i8]* @__PRETTY_FUNCTION__._ZN6soplex10SPxSteepPR12removedCoVecEi, i32 0, i32 0)) #10
  unreachable
                                                  ; No predecessors!
  br label %11

; <label>:11                                      ; preds = %10, %8
  %12 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %3, i32 0, i32 2
  %13 = bitcast %"class.soplex::DVector"* %12 to %"class.soplex::Vector"*
  %14 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %3, i32 0, i32 2
  %15 = bitcast %"class.soplex::DVector"* %14 to %"class.soplex::Vector"*
  %16 = call i32 @_ZNK6soplex6Vector3dimEv(%"class.soplex::Vector"* %15)
  %17 = call dereferenceable(8) double* @_ZN6soplex6VectorixEi(%"class.soplex::Vector"* %13, i32 %16)
  %18 = load double* %17
  %19 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %3, i32 0, i32 2
  %20 = bitcast %"class.soplex::DVector"* %19 to %"class.soplex::Vector"*
  %21 = load i32* %2, align 4
  %22 = call dereferenceable(8) double* @_ZN6soplex6VectorixEi(%"class.soplex::Vector"* %20, i32 %21)
  store double %18, double* %22
  %23 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %3, i32 0, i32 2
  %24 = bitcast %"class.soplex::SPxSteepPR"* %3 to %"class.soplex::SPxPricer"*
  %25 = getelementptr inbounds %"class.soplex::SPxPricer"* %24, i32 0, i32 2
  %26 = load %"class.soplex::SoPlex"** %25, align 8
  %27 = call i32 @_ZNK6soplex6SoPlex3dimEv(%"class.soplex::SoPlex"* %26)
  call void @_ZN6soplex7DVector5reDimEi(%"class.soplex::DVector"* %23, i32 %27)
  %28 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %3, i32 0, i32 8
  store i32 0, i32* %28, align 4
  ret void
}

; Function Attrs: uwtable
define void @_ZN6soplex10SPxSteepPR13removedCoVecsEPKi(%"class.soplex::SPxSteepPR"* %this, i32* %perm) unnamed_addr #3 align 2 {
  %1 = alloca %"class.soplex::SPxSteepPR"*, align 8
  %2 = alloca i32*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store %"class.soplex::SPxSteepPR"* %this, %"class.soplex::SPxSteepPR"** %1, align 8
  store i32* %perm, i32** %2, align 8
  %3 = load %"class.soplex::SPxSteepPR"** %1
  %4 = bitcast %"class.soplex::SPxSteepPR"* %3 to %"class.soplex::SPxPricer"*
  %5 = getelementptr inbounds %"class.soplex::SPxPricer"* %4, i32 0, i32 2
  %6 = load %"class.soplex::SoPlex"** %5, align 8
  %7 = icmp ne %"class.soplex::SoPlex"* %6, null
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %0
  br label %11

; <label>:9                                       ; preds = %0
  call void @__assert_fail(i8* getelementptr inbounds ([15 x i8]* @.str13, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8]* @.str1, i32 0, i32 0), i32 571, i8* getelementptr inbounds ([60 x i8]* @__PRETTY_FUNCTION__._ZN6soplex10SPxSteepPR13removedCoVecsEPKi, i32 0, i32 0)) #10
  unreachable
                                                  ; No predecessors!
  br label %11

; <label>:11                                      ; preds = %10, %8
  %12 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %3, i32 0, i32 2
  %13 = bitcast %"class.soplex::DVector"* %12 to %"class.soplex::Vector"*
  %14 = call i32 @_ZNK6soplex6Vector3dimEv(%"class.soplex::Vector"* %13)
  store i32 %14, i32* %j, align 4
  store i32 0, i32* %i, align 4
  br label %15

; <label>:15                                      ; preds = %41, %11
  %16 = load i32* %i, align 4
  %17 = load i32* %j, align 4
  %18 = icmp slt i32 %16, %17
  br i1 %18, label %19, label %44

; <label>:19                                      ; preds = %15
  %20 = load i32* %i, align 4
  %21 = sext i32 %20 to i64
  %22 = load i32** %2, align 8
  %23 = getelementptr inbounds i32* %22, i64 %21
  %24 = load i32* %23, align 4
  %25 = icmp sge i32 %24, 0
  br i1 %25, label %26, label %40

; <label>:26                                      ; preds = %19
  %27 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %3, i32 0, i32 2
  %28 = bitcast %"class.soplex::DVector"* %27 to %"class.soplex::Vector"*
  %29 = load i32* %i, align 4
  %30 = call dereferenceable(8) double* @_ZN6soplex6VectorixEi(%"class.soplex::Vector"* %28, i32 %29)
  %31 = load double* %30
  %32 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %3, i32 0, i32 2
  %33 = bitcast %"class.soplex::DVector"* %32 to %"class.soplex::Vector"*
  %34 = load i32* %i, align 4
  %35 = sext i32 %34 to i64
  %36 = load i32** %2, align 8
  %37 = getelementptr inbounds i32* %36, i64 %35
  %38 = load i32* %37, align 4
  %39 = call dereferenceable(8) double* @_ZN6soplex6VectorixEi(%"class.soplex::Vector"* %33, i32 %38)
  store double %31, double* %39
  br label %40

; <label>:40                                      ; preds = %26, %19
  br label %41

; <label>:41                                      ; preds = %40
  %42 = load i32* %i, align 4
  %43 = add nsw i32 %42, 1
  store i32 %43, i32* %i, align 4
  br label %15

; <label>:44                                      ; preds = %15
  %45 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %3, i32 0, i32 2
  %46 = bitcast %"class.soplex::SPxSteepPR"* %3 to %"class.soplex::SPxPricer"*
  %47 = getelementptr inbounds %"class.soplex::SPxPricer"* %46, i32 0, i32 2
  %48 = load %"class.soplex::SoPlex"** %47, align 8
  %49 = call i32 @_ZNK6soplex6SoPlex3dimEv(%"class.soplex::SoPlex"* %48)
  call void @_ZN6soplex7DVector5reDimEi(%"class.soplex::DVector"* %45, i32 %49)
  %50 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %3, i32 0, i32 8
  store i32 0, i32* %50, align 4
  ret void
}

; Function Attrs: uwtable
define zeroext i1 @_ZNK6soplex10SPxSteepPR12isConsistentEv(%"class.soplex::SPxSteepPR"* %this) unnamed_addr #3 align 2 {
  %1 = alloca i1, align 1
  %2 = alloca %"class.soplex::SPxSteepPR"*, align 8
  %i = alloca i32, align 4
  %tmp = alloca %"class.soplex::SSVector", align 8
  %x = alloca double, align 8
  %3 = alloca i8*
  %4 = alloca i32
  %i1 = alloca i32, align 4
  store %"class.soplex::SPxSteepPR"* %this, %"class.soplex::SPxSteepPR"** %2, align 8
  %5 = load %"class.soplex::SPxSteepPR"** %2
  %6 = bitcast %"class.soplex::SPxSteepPR"* %5 to %"class.soplex::SPxPricer"*
  %7 = getelementptr inbounds %"class.soplex::SPxPricer"* %6, i32 0, i32 2
  %8 = load %"class.soplex::SoPlex"** %7, align 8
  %9 = icmp ne %"class.soplex::SoPlex"* %8, null
  br i1 %9, label %10, label %98

; <label>:10                                      ; preds = %0
  %11 = bitcast %"class.soplex::SPxSteepPR"* %5 to %"class.soplex::SPxPricer"*
  %12 = getelementptr inbounds %"class.soplex::SPxPricer"* %11, i32 0, i32 2
  %13 = load %"class.soplex::SoPlex"** %12, align 8
  %14 = call i32 @_ZNK6soplex6SoPlex4typeEv(%"class.soplex::SoPlex"* %13)
  %15 = icmp eq i32 %14, 1
  br i1 %15, label %16, label %98

; <label>:16                                      ; preds = %10
  %17 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %5, i32 0, i32 12
  %18 = load i32* %17, align 4
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %20, label %98

; <label>:20                                      ; preds = %16
  %21 = bitcast %"class.soplex::SPxSteepPR"* %5 to %"class.soplex::SPxPricer"*
  %22 = getelementptr inbounds %"class.soplex::SPxPricer"* %21, i32 0, i32 2
  %23 = load %"class.soplex::SoPlex"** %22, align 8
  %24 = call i32 @_ZNK6soplex6SoPlex3dimEv(%"class.soplex::SoPlex"* %23)
  %25 = bitcast %"class.soplex::SPxSteepPR"* %5 to %"class.soplex::SPxPricer"*
  %26 = getelementptr inbounds %"class.soplex::SPxPricer"* %25, i32 0, i32 2
  %27 = load %"class.soplex::SoPlex"** %26, align 8
  %28 = call double @_ZNK6soplex6SoPlex7epsilonEv(%"class.soplex::SoPlex"* %27)
  call void @_ZN6soplex8SSVectorC2Eid(%"class.soplex::SSVector"* %tmp, i32 %24, double %28)
  %29 = bitcast %"class.soplex::SPxSteepPR"* %5 to %"class.soplex::SPxPricer"*
  %30 = getelementptr inbounds %"class.soplex::SPxPricer"* %29, i32 0, i32 2
  %31 = load %"class.soplex::SoPlex"** %30, align 8
  %32 = invoke i32 @_ZNK6soplex6SoPlex3dimEv(%"class.soplex::SoPlex"* %31)
          to label %33 unwind label %88

; <label>:33                                      ; preds = %20
  %34 = sub nsw i32 %32, 1
  store i32 %34, i32* %i, align 4
  br label %35

; <label>:35                                      ; preds = %93, %33
  %36 = load i32* %i, align 4
  %37 = icmp sge i32 %36, 0
  br i1 %37, label %38, label %96

; <label>:38                                      ; preds = %35
  %39 = bitcast %"class.soplex::SPxSteepPR"* %5 to %"class.soplex::SPxPricer"*
  %40 = getelementptr inbounds %"class.soplex::SPxPricer"* %39, i32 0, i32 2
  %41 = load %"class.soplex::SoPlex"** %40, align 8
  %42 = invoke dereferenceable(208) %"class.soplex::SPxBasis"* @_ZN6soplex6SoPlex5basisEv(%"class.soplex::SoPlex"* %41)
          to label %43 unwind label %88

; <label>:43                                      ; preds = %38
  %44 = bitcast %"class.soplex::SPxSteepPR"* %5 to %"class.soplex::SPxPricer"*
  %45 = getelementptr inbounds %"class.soplex::SPxPricer"* %44, i32 0, i32 2
  %46 = load %"class.soplex::SoPlex"** %45, align 8
  %47 = load i32* %i, align 4
  %48 = invoke dereferenceable(8) %"class.soplex::SVector"* @_ZNK6soplex6SoPlex10unitVectorEi(%"class.soplex::SoPlex"* %46, i32 %47)
          to label %49 unwind label %88

; <label>:49                                      ; preds = %43
  invoke void @_ZN6soplex8SPxBasis7coSolveERNS_8SSVectorERKNS_7SVectorE(%"class.soplex::SPxBasis"* %42, %"class.soplex::SSVector"* dereferenceable(64) %tmp, %"class.soplex::SVector"* dereferenceable(8) %48)
          to label %50 unwind label %88

; <label>:50                                      ; preds = %49
  %51 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %5, i32 0, i32 2
  %52 = bitcast %"class.soplex::DVector"* %51 to %"class.soplex::Vector"*
  %53 = load i32* %i, align 4
  %54 = invoke double @_ZNK6soplex6VectorixEi(%"class.soplex::Vector"* %52, i32 %53)
          to label %55 unwind label %88

; <label>:55                                      ; preds = %50
  %56 = invoke double @_ZNK6soplex8SSVector7length2Ev(%"class.soplex::SSVector"* %tmp)
          to label %57 unwind label %88

; <label>:57                                      ; preds = %55
  %58 = fsub double %54, %56
  store double %58, double* %x, align 8
  %59 = load double* %x, align 8
  %60 = bitcast %"class.soplex::SPxSteepPR"* %5 to %"class.soplex::SPxPricer"*
  %61 = getelementptr inbounds %"class.soplex::SPxPricer"* %60, i32 0, i32 2
  %62 = load %"class.soplex::SoPlex"** %61, align 8
  %63 = invoke double @_ZNK6soplex6SoPlex5deltaEv(%"class.soplex::SoPlex"* %62)
          to label %64 unwind label %88

; <label>:64                                      ; preds = %57
  %65 = fcmp ogt double %59, %63
  br i1 %65, label %75, label %66

; <label>:66                                      ; preds = %64
  %67 = load double* %x, align 8
  %68 = fsub double -0.000000e+00, %67
  %69 = bitcast %"class.soplex::SPxSteepPR"* %5 to %"class.soplex::SPxPricer"*
  %70 = getelementptr inbounds %"class.soplex::SPxPricer"* %69, i32 0, i32 2
  %71 = load %"class.soplex::SoPlex"** %70, align 8
  %72 = invoke double @_ZNK6soplex6SoPlex5deltaEv(%"class.soplex::SoPlex"* %71)
          to label %73 unwind label %88

; <label>:73                                      ; preds = %66
  %74 = fcmp ogt double %68, %72
  br i1 %74, label %75, label %92

; <label>:75                                      ; preds = %73, %64
  %76 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cerr, i8* getelementptr inbounds ([3 x i8]* @.str14, i32 0, i32 0))
          to label %77 unwind label %88

; <label>:77                                      ; preds = %75
  %78 = load i32* %i, align 4
  %79 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* %76, i32 %78)
          to label %80 unwind label %88

; <label>:80                                      ; preds = %77
  %81 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %79, i8* getelementptr inbounds ([5 x i8]* @.str15, i32 0, i32 0))
          to label %82 unwind label %88

; <label>:82                                      ; preds = %80
  %83 = load double* %x, align 8
  %84 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEd(%"class.std::basic_ostream"* %81, double %83)
          to label %85 unwind label %88

; <label>:85                                      ; preds = %82
  %86 = invoke dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* %84, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
          to label %87 unwind label %88

; <label>:87                                      ; preds = %85
  br label %92

; <label>:88                                      ; preds = %85, %82, %80, %77, %75, %66, %57, %55, %50, %49, %43, %38, %20
  %89 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
  %90 = extractvalue { i8*, i32 } %89, 0
  store i8* %90, i8** %3
  %91 = extractvalue { i8*, i32 } %89, 1
  store i32 %91, i32* %4
  invoke void @_ZN6soplex8SSVectorD2Ev(%"class.soplex::SSVector"* %tmp)
          to label %97 unwind label %168

; <label>:92                                      ; preds = %87, %73
  br label %93

; <label>:93                                      ; preds = %92
  %94 = load i32* %i, align 4
  %95 = add nsw i32 %94, -1
  store i32 %95, i32* %i, align 4
  br label %35

; <label>:96                                      ; preds = %35
  call void @_ZN6soplex8SSVectorD2Ev(%"class.soplex::SSVector"* %tmp)
  br label %98

; <label>:97                                      ; preds = %88
  br label %163

; <label>:98                                      ; preds = %96, %16, %10, %0
  %99 = bitcast %"class.soplex::SPxSteepPR"* %5 to %"class.soplex::SPxPricer"*
  %100 = getelementptr inbounds %"class.soplex::SPxPricer"* %99, i32 0, i32 2
  %101 = load %"class.soplex::SoPlex"** %100, align 8
  %102 = icmp ne %"class.soplex::SoPlex"* %101, null
  br i1 %102, label %103, label %160

; <label>:103                                     ; preds = %98
  %104 = bitcast %"class.soplex::SPxSteepPR"* %5 to %"class.soplex::SPxPricer"*
  %105 = getelementptr inbounds %"class.soplex::SPxPricer"* %104, i32 0, i32 2
  %106 = load %"class.soplex::SoPlex"** %105, align 8
  %107 = call i32 @_ZNK6soplex6SoPlex4typeEv(%"class.soplex::SoPlex"* %106)
  %108 = icmp eq i32 %107, -1
  br i1 %108, label %109, label %160

; <label>:109                                     ; preds = %103
  %110 = bitcast %"class.soplex::SPxSteepPR"* %5 to %"class.soplex::SPxPricer"*
  %111 = getelementptr inbounds %"class.soplex::SPxPricer"* %110, i32 0, i32 2
  %112 = load %"class.soplex::SoPlex"** %111, align 8
  %113 = call i32 @_ZNK6soplex6SoPlex3dimEv(%"class.soplex::SoPlex"* %112)
  %114 = sub nsw i32 %113, 1
  store i32 %114, i32* %i1, align 4
  br label %115

; <label>:115                                     ; preds = %131, %109
  %116 = load i32* %i1, align 4
  %117 = icmp sge i32 %116, 0
  br i1 %117, label %118, label %134

; <label>:118                                     ; preds = %115
  %119 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %5, i32 0, i32 2
  %120 = bitcast %"class.soplex::DVector"* %119 to %"class.soplex::Vector"*
  %121 = load i32* %i1, align 4
  %122 = call double @_ZNK6soplex6VectorixEi(%"class.soplex::Vector"* %120, i32 %121)
  %123 = bitcast %"class.soplex::SPxSteepPR"* %5 to %"class.soplex::SPxPricer"*
  %124 = getelementptr inbounds %"class.soplex::SPxPricer"* %123, i32 0, i32 2
  %125 = load %"class.soplex::SoPlex"** %124, align 8
  %126 = call double @_ZNK6soplex6SoPlex7epsilonEv(%"class.soplex::SoPlex"* %125)
  %127 = fcmp olt double %122, %126
  br i1 %127, label %128, label %130

; <label>:128                                     ; preds = %118
  %129 = call zeroext i1 @_ZN6soplex15msginconsistentEPKcS1_i(i8* getelementptr inbounds ([11 x i8]* @.str16, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8]* @.str1, i32 0, i32 0), i32 604)
  store i1 %129, i1* %1
  br label %161

; <label>:130                                     ; preds = %118
  br label %131

; <label>:131                                     ; preds = %130
  %132 = load i32* %i1, align 4
  %133 = add nsw i32 %132, -1
  store i32 %133, i32* %i1, align 4
  br label %115

; <label>:134                                     ; preds = %115
  %135 = bitcast %"class.soplex::SPxSteepPR"* %5 to %"class.soplex::SPxPricer"*
  %136 = getelementptr inbounds %"class.soplex::SPxPricer"* %135, i32 0, i32 2
  %137 = load %"class.soplex::SoPlex"** %136, align 8
  %138 = call i32 @_ZNK6soplex6SoPlex5coDimEv(%"class.soplex::SoPlex"* %137)
  %139 = sub nsw i32 %138, 1
  store i32 %139, i32* %i1, align 4
  br label %140

; <label>:140                                     ; preds = %156, %134
  %141 = load i32* %i1, align 4
  %142 = icmp sge i32 %141, 0
  br i1 %142, label %143, label %159

; <label>:143                                     ; preds = %140
  %144 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %5, i32 0, i32 1
  %145 = bitcast %"class.soplex::DVector"* %144 to %"class.soplex::Vector"*
  %146 = load i32* %i1, align 4
  %147 = call double @_ZNK6soplex6VectorixEi(%"class.soplex::Vector"* %145, i32 %146)
  %148 = bitcast %"class.soplex::SPxSteepPR"* %5 to %"class.soplex::SPxPricer"*
  %149 = getelementptr inbounds %"class.soplex::SPxPricer"* %148, i32 0, i32 2
  %150 = load %"class.soplex::SoPlex"** %149, align 8
  %151 = call double @_ZNK6soplex6SoPlex7epsilonEv(%"class.soplex::SoPlex"* %150)
  %152 = fcmp olt double %147, %151
  br i1 %152, label %153, label %155

; <label>:153                                     ; preds = %143
  %154 = call zeroext i1 @_ZN6soplex15msginconsistentEPKcS1_i(i8* getelementptr inbounds ([11 x i8]* @.str16, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8]* @.str1, i32 0, i32 0), i32 608)
  store i1 %154, i1* %1
  br label %161

; <label>:155                                     ; preds = %143
  br label %156

; <label>:156                                     ; preds = %155
  %157 = load i32* %i1, align 4
  %158 = add nsw i32 %157, -1
  store i32 %158, i32* %i1, align 4
  br label %140

; <label>:159                                     ; preds = %140
  br label %160

; <label>:160                                     ; preds = %159, %103, %98
  store i1 true, i1* %1
  br label %161

; <label>:161                                     ; preds = %160, %153, %128
  %162 = load i1* %1
  ret i1 %162

; <label>:163                                     ; preds = %97
  %164 = load i8** %3
  %165 = load i32* %4
  %166 = insertvalue { i8*, i32 } undef, i8* %164, 0
  %167 = insertvalue { i8*, i32 } %166, i32 %165, 1
  resume { i8*, i32 } %167

; <label>:168                                     ; preds = %88
  %169 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          catch i8* null
  %170 = extractvalue { i8*, i32 } %169, 0
  call void @__clang_call_terminate(i8* %170) #10
  unreachable
}

; Function Attrs: uwtable
define linkonce_odr void @_ZN6soplex8SSVectorC2Eid(%"class.soplex::SSVector"* %this, i32 %p_dim, double %p_eps) unnamed_addr #3 align 2 {
  %1 = alloca %"class.soplex::SSVector"*, align 8
  %2 = alloca i32, align 4
  %3 = alloca double, align 8
  %4 = alloca i8*
  %5 = alloca i32
  store %"class.soplex::SSVector"* %this, %"class.soplex::SSVector"** %1, align 8
  store i32 %p_dim, i32* %2, align 4
  store double %p_eps, double* %3, align 8
  %6 = load %"class.soplex::SSVector"** %1
  %7 = bitcast %"class.soplex::SSVector"* %6 to %"class.soplex::DVector"*
  %8 = load i32* %2, align 4
  call void @_ZN6soplex7DVectorC2Ei(%"class.soplex::DVector"* %7, i32 %8)
  %9 = bitcast %"class.soplex::SSVector"* %6 to i8*
  %10 = getelementptr inbounds i8* %9, i64 32
  %11 = bitcast i8* %10 to %"class.soplex::IdxSet"*
  invoke void @_ZN6soplex6IdxSetC2Ev(%"class.soplex::IdxSet"* %11)
          to label %12 unwind label %39

; <label>:12                                      ; preds = %0
  %13 = getelementptr inbounds %"class.soplex::SSVector"* %6, i32 0, i32 2
  store i8 1, i8* %13, align 1
  %14 = getelementptr inbounds %"class.soplex::SSVector"* %6, i32 0, i32 3
  %15 = load double* %3, align 8
  store double %15, double* %14, align 8
  %16 = load i32* %2, align 4
  %17 = icmp slt i32 %16, 1
  br i1 %17, label %18, label %19

; <label>:18                                      ; preds = %12
  br label %21

; <label>:19                                      ; preds = %12
  %20 = load i32* %2, align 4
  br label %21

; <label>:21                                      ; preds = %19, %18
  %22 = phi i32 [ 1, %18 ], [ %20, %19 ]
  %23 = bitcast %"class.soplex::SSVector"* %6 to i8*
  %24 = getelementptr inbounds i8* %23, i64 32
  %25 = bitcast i8* %24 to %"class.soplex::IdxSet"*
  %26 = getelementptr inbounds %"class.soplex::IdxSet"* %25, i32 0, i32 1
  store i32 %22, i32* %26, align 4
  %27 = bitcast %"class.soplex::SSVector"* %6 to i8*
  %28 = getelementptr inbounds i8* %27, i64 32
  %29 = bitcast i8* %28 to %"class.soplex::IdxSet"*
  %30 = getelementptr inbounds %"class.soplex::IdxSet"* %29, i32 0, i32 2
  %31 = bitcast %"class.soplex::SSVector"* %6 to i8*
  %32 = getelementptr inbounds i8* %31, i64 32
  %33 = bitcast i8* %32 to %"class.soplex::IdxSet"*
  %34 = getelementptr inbounds %"class.soplex::IdxSet"* %33, i32 0, i32 1
  %35 = load i32* %34, align 4
  invoke void @_ZN6soplex9spx_allocIPiEEvRT_i(i32** dereferenceable(8) %30, i32 %35)
          to label %36 unwind label %39

; <label>:36                                      ; preds = %21
  %37 = bitcast %"class.soplex::SSVector"* %6 to %"class.soplex::Vector"*
  invoke void @_ZN6soplex6Vector5clearEv(%"class.soplex::Vector"* %37)
          to label %38 unwind label %39

; <label>:38                                      ; preds = %36
  ret void

; <label>:39                                      ; preds = %36, %21, %0
  %40 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
  %41 = extractvalue { i8*, i32 } %40, 0
  store i8* %41, i8** %4
  %42 = extractvalue { i8*, i32 } %40, 1
  store i32 %42, i32* %5
  %43 = bitcast %"class.soplex::SSVector"* %6 to %"class.soplex::DVector"*
  invoke void @_ZN6soplex7DVectorD2Ev(%"class.soplex::DVector"* %43)
          to label %44 unwind label %50

; <label>:44                                      ; preds = %39
  br label %45

; <label>:45                                      ; preds = %44
  %46 = load i8** %4
  %47 = load i32* %5
  %48 = insertvalue { i8*, i32 } undef, i8* %46, 0
  %49 = insertvalue { i8*, i32 } %48, i32 %47, 1
  resume { i8*, i32 } %49

; <label>:50                                      ; preds = %39
  %51 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          catch i8* null
  %52 = extractvalue { i8*, i32 } %51, 0
  call void @__clang_call_terminate(i8* %52) #10
  unreachable
}

; Function Attrs: uwtable
define linkonce_odr double @_ZNK6soplex6VectorixEi(%"class.soplex::Vector"* %this, i32 %n) #3 align 2 {
  %1 = alloca %"class.soplex::Vector"*, align 8
  %2 = alloca i32, align 4
  store %"class.soplex::Vector"* %this, %"class.soplex::Vector"** %1, align 8
  store i32 %n, i32* %2, align 4
  %3 = load %"class.soplex::Vector"** %1
  %4 = load i32* %2, align 4
  %5 = icmp sge i32 %4, 0
  br i1 %5, label %6, label %11

; <label>:6                                       ; preds = %0
  %7 = load i32* %2, align 4
  %8 = call i32 @_ZNK6soplex6Vector3dimEv(%"class.soplex::Vector"* %3)
  %9 = icmp slt i32 %7, %8
  br i1 %9, label %10, label %11

; <label>:10                                      ; preds = %6
  br label %13

; <label>:11                                      ; preds = %6, %0
  call void @__assert_fail(i8* getelementptr inbounds ([20 x i8]* @.str28, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8]* @.str29, i32 0, i32 0), i32 160, i8* getelementptr inbounds ([43 x i8]* @__PRETTY_FUNCTION__._ZNK6soplex6VectorixEi, i32 0, i32 0)) #10
  unreachable
                                                  ; No predecessors!
  br label %13

; <label>:13                                      ; preds = %12, %10
  %14 = load i32* %2, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds %"class.soplex::Vector"* %3, i32 0, i32 1
  %17 = load double** %16, align 8
  %18 = getelementptr inbounds double* %17, i64 %15
  %19 = load double* %18, align 8
  ret double %19
}

; Function Attrs: nounwind uwtable
define linkonce_odr double @_ZNK6soplex6SoPlex5deltaEv(%"class.soplex::SoPlex"* %this) #2 align 2 {
  %1 = alloca %"class.soplex::SoPlex"*, align 8
  store %"class.soplex::SoPlex"* %this, %"class.soplex::SoPlex"** %1, align 8
  %2 = load %"class.soplex::SoPlex"** %1
  %3 = getelementptr inbounds %"class.soplex::SoPlex"* %2, i32 0, i32 10
  %4 = load double* %3, align 8
  ret double %4
}

; Function Attrs: uwtable
define linkonce_odr void @_ZN6soplex8SSVectorD2Ev(%"class.soplex::SSVector"* %this) unnamed_addr #3 align 2 {
  %1 = alloca %"class.soplex::SSVector"*, align 8
  %2 = alloca i8*
  %3 = alloca i32
  store %"class.soplex::SSVector"* %this, %"class.soplex::SSVector"** %1, align 8
  %4 = load %"class.soplex::SSVector"** %1
  %5 = bitcast %"class.soplex::SSVector"* %4 to i8*
  %6 = getelementptr inbounds i8* %5, i64 32
  %7 = bitcast i8* %6 to %"class.soplex::IdxSet"*
  %8 = getelementptr inbounds %"class.soplex::IdxSet"* %7, i32 0, i32 2
  %9 = load i32** %8, align 8
  %10 = icmp ne i32* %9, null
  br i1 %10, label %11, label %22

; <label>:11                                      ; preds = %0
  %12 = bitcast %"class.soplex::SSVector"* %4 to i8*
  %13 = getelementptr inbounds i8* %12, i64 32
  %14 = bitcast i8* %13 to %"class.soplex::IdxSet"*
  %15 = getelementptr inbounds %"class.soplex::IdxSet"* %14, i32 0, i32 2
  invoke void @_ZN6soplex8spx_freeIPiEEvRT_(i32** dereferenceable(8) %15)
          to label %16 unwind label %17

; <label>:16                                      ; preds = %11
  br label %22

; <label>:17                                      ; preds = %11
  %18 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
  %19 = extractvalue { i8*, i32 } %18, 0
  store i8* %19, i8** %2
  %20 = extractvalue { i8*, i32 } %18, 1
  store i32 %20, i32* %3
  %21 = bitcast %"class.soplex::SSVector"* %4 to %"class.soplex::DVector"*
  invoke void @_ZN6soplex7DVectorD2Ev(%"class.soplex::DVector"* %21)
          to label %24 unwind label %30

; <label>:22                                      ; preds = %16, %0
  %23 = bitcast %"class.soplex::SSVector"* %4 to %"class.soplex::DVector"*
  call void @_ZN6soplex7DVectorD2Ev(%"class.soplex::DVector"* %23)
  ret void

; <label>:24                                      ; preds = %17
  br label %25

; <label>:25                                      ; preds = %24
  %26 = load i8** %2
  %27 = load i32* %3
  %28 = insertvalue { i8*, i32 } undef, i8* %26, 0
  %29 = insertvalue { i8*, i32 } %28, i32 %27, 1
  resume { i8*, i32 } %29

; <label>:30                                      ; preds = %17
  %31 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          catch i8* null
  %32 = extractvalue { i8*, i32 } %31, 0
  call void @__clang_call_terminate(i8* %32) #10
  unreachable
}

declare zeroext i1 @_ZN6soplex15msginconsistentEPKcS1_i(i8*, i8*, i32) #0

; Function Attrs: nounwind uwtable
define linkonce_odr i8* @_ZNK6soplex9SPxPricer7getNameEv(%"class.soplex::SPxPricer"* %this) unnamed_addr #2 align 2 {
  %1 = alloca %"class.soplex::SPxPricer"*, align 8
  store %"class.soplex::SPxPricer"* %this, %"class.soplex::SPxPricer"** %1, align 8
  %2 = load %"class.soplex::SPxPricer"** %1
  %3 = getelementptr inbounds %"class.soplex::SPxPricer"* %2, i32 0, i32 1
  %4 = load i8** %3, align 8
  ret i8* %4
}

; Function Attrs: nounwind uwtable
define linkonce_odr %"class.soplex::SoPlex"* @_ZNK6soplex9SPxPricer6solverEv(%"class.soplex::SPxPricer"* %this) unnamed_addr #2 align 2 {
  %1 = alloca %"class.soplex::SPxPricer"*, align 8
  store %"class.soplex::SPxPricer"* %this, %"class.soplex::SPxPricer"** %1, align 8
  %2 = load %"class.soplex::SPxPricer"** %1
  %3 = getelementptr inbounds %"class.soplex::SPxPricer"* %2, i32 0, i32 2
  %4 = load %"class.soplex::SoPlex"** %3, align 8
  ret %"class.soplex::SoPlex"* %4
}

; Function Attrs: nounwind uwtable
define linkonce_odr double @_ZNK6soplex9SPxPricer7epsilonEv(%"class.soplex::SPxPricer"* %this) unnamed_addr #2 align 2 {
  %1 = alloca %"class.soplex::SPxPricer"*, align 8
  store %"class.soplex::SPxPricer"* %this, %"class.soplex::SPxPricer"** %1, align 8
  %2 = load %"class.soplex::SPxPricer"** %1
  %3 = getelementptr inbounds %"class.soplex::SPxPricer"* %2, i32 0, i32 3
  %4 = load double* %3, align 8
  ret double %4
}

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN6soplex9SPxPricer10setEpsilonEd(%"class.soplex::SPxPricer"* %this, double %eps) unnamed_addr #2 align 2 {
  %1 = alloca %"class.soplex::SPxPricer"*, align 8
  %2 = alloca double, align 8
  store %"class.soplex::SPxPricer"* %this, %"class.soplex::SPxPricer"** %1, align 8
  store double %eps, double* %2, align 8
  %3 = load %"class.soplex::SPxPricer"** %1
  %4 = load double* %2, align 8
  %5 = fcmp oge double %4, 0.000000e+00
  br i1 %5, label %6, label %7

; <label>:6                                       ; preds = %0
  br label %9

; <label>:7                                       ; preds = %0
  call void @__assert_fail(i8* getelementptr inbounds ([11 x i8]* @.str26, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8]* @.str27, i32 0, i32 0), i32 99, i8* getelementptr inbounds ([49 x i8]* @__PRETTY_FUNCTION__._ZN6soplex9SPxPricer10setEpsilonEd, i32 0, i32 0)) #10
  unreachable
                                                  ; No predecessors!
  br label %9

; <label>:9                                       ; preds = %8, %6
  %10 = load double* %2, align 8
  %11 = getelementptr inbounds %"class.soplex::SPxPricer"* %3, i32 0, i32 3
  store double %10, double* %11, align 8
  ret void
}

; Function Attrs: inlinehint uwtable
define linkonce_odr void @_ZN6soplex10SPxSteepPRD2Ev(%"class.soplex::SPxSteepPR"* %this) unnamed_addr #7 align 2 {
  %1 = alloca %"class.soplex::SPxSteepPR"*, align 8
  %2 = alloca i8*
  %3 = alloca i32
  store %"class.soplex::SPxSteepPR"* %this, %"class.soplex::SPxSteepPR"** %1, align 8
  %4 = load %"class.soplex::SPxSteepPR"** %1
  %5 = bitcast %"class.soplex::SPxSteepPR"* %4 to i32 (...)***
  store i32 (...)** bitcast (i8** getelementptr inbounds ([23 x i8*]* @_ZTVN6soplex10SPxSteepPRE, i64 0, i64 2) to i32 (...)**), i32 (...)*** %5
  %6 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %4, i32 0, i32 11
  invoke void @_ZN6soplex9DataArrayIdED2Ev(%"class.soplex::DataArray.3"* %6)
          to label %7 unwind label %21

; <label>:7                                       ; preds = %0
  %8 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %4, i32 0, i32 10
  invoke void @_ZN6soplex9DataArrayIdED2Ev(%"class.soplex::DataArray.3"* %8)
          to label %9 unwind label %26

; <label>:9                                       ; preds = %7
  %10 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %4, i32 0, i32 9
  invoke void @_ZN6soplex9DataArrayIdED2Ev(%"class.soplex::DataArray.3"* %10)
          to label %11 unwind label %31

; <label>:11                                      ; preds = %9
  %12 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %4, i32 0, i32 4
  invoke void @_ZN6soplex8SSVectorD2Ev(%"class.soplex::SSVector"* %12)
          to label %13 unwind label %38

; <label>:13                                      ; preds = %11
  %14 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %4, i32 0, i32 3
  invoke void @_ZN6soplex7DVectorD1Ev(%"class.soplex::DVector"* %14)
          to label %15 unwind label %45

; <label>:15                                      ; preds = %13
  %16 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %4, i32 0, i32 2
  invoke void @_ZN6soplex7DVectorD1Ev(%"class.soplex::DVector"* %16)
          to label %17 unwind label %52

; <label>:17                                      ; preds = %15
  %18 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %4, i32 0, i32 1
  invoke void @_ZN6soplex7DVectorD1Ev(%"class.soplex::DVector"* %18)
          to label %19 unwind label %59

; <label>:19                                      ; preds = %17
  %20 = bitcast %"class.soplex::SPxSteepPR"* %4 to %"class.soplex::SPxPricer"*
  call void @_ZN6soplex9SPxPricerD2Ev(%"class.soplex::SPxPricer"* %20)
  ret void

; <label>:21                                      ; preds = %0
  %22 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
  %23 = extractvalue { i8*, i32 } %22, 0
  store i8* %23, i8** %2
  %24 = extractvalue { i8*, i32 } %22, 1
  store i32 %24, i32* %3
  %25 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %4, i32 0, i32 10
  invoke void @_ZN6soplex9DataArrayIdED2Ev(%"class.soplex::DataArray.3"* %25)
          to label %30 unwind label %74

; <label>:26                                      ; preds = %7
  %27 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
  %28 = extractvalue { i8*, i32 } %27, 0
  store i8* %28, i8** %2
  %29 = extractvalue { i8*, i32 } %27, 1
  store i32 %29, i32* %3
  br label %35

; <label>:30                                      ; preds = %21
  br label %35

; <label>:31                                      ; preds = %9
  %32 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
  %33 = extractvalue { i8*, i32 } %32, 0
  store i8* %33, i8** %2
  %34 = extractvalue { i8*, i32 } %32, 1
  store i32 %34, i32* %3
  br label %42

; <label>:35                                      ; preds = %30, %26
  %36 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %4, i32 0, i32 9
  invoke void @_ZN6soplex9DataArrayIdED2Ev(%"class.soplex::DataArray.3"* %36)
          to label %37 unwind label %74

; <label>:37                                      ; preds = %35
  br label %42

; <label>:38                                      ; preds = %11
  %39 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
  %40 = extractvalue { i8*, i32 } %39, 0
  store i8* %40, i8** %2
  %41 = extractvalue { i8*, i32 } %39, 1
  store i32 %41, i32* %3
  br label %49

; <label>:42                                      ; preds = %37, %31
  %43 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %4, i32 0, i32 4
  invoke void @_ZN6soplex8SSVectorD2Ev(%"class.soplex::SSVector"* %43)
          to label %44 unwind label %74

; <label>:44                                      ; preds = %42
  br label %49

; <label>:45                                      ; preds = %13
  %46 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
  %47 = extractvalue { i8*, i32 } %46, 0
  store i8* %47, i8** %2
  %48 = extractvalue { i8*, i32 } %46, 1
  store i32 %48, i32* %3
  br label %56

; <label>:49                                      ; preds = %44, %38
  %50 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %4, i32 0, i32 3
  invoke void @_ZN6soplex7DVectorD1Ev(%"class.soplex::DVector"* %50)
          to label %51 unwind label %74

; <label>:51                                      ; preds = %49
  br label %56

; <label>:52                                      ; preds = %15
  %53 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
  %54 = extractvalue { i8*, i32 } %53, 0
  store i8* %54, i8** %2
  %55 = extractvalue { i8*, i32 } %53, 1
  store i32 %55, i32* %3
  br label %63

; <label>:56                                      ; preds = %51, %45
  %57 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %4, i32 0, i32 2
  invoke void @_ZN6soplex7DVectorD1Ev(%"class.soplex::DVector"* %57)
          to label %58 unwind label %74

; <label>:58                                      ; preds = %56
  br label %63

; <label>:59                                      ; preds = %17
  %60 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
  %61 = extractvalue { i8*, i32 } %60, 0
  store i8* %61, i8** %2
  %62 = extractvalue { i8*, i32 } %60, 1
  store i32 %62, i32* %3
  br label %66

; <label>:63                                      ; preds = %58, %52
  %64 = getelementptr inbounds %"class.soplex::SPxSteepPR"* %4, i32 0, i32 1
  invoke void @_ZN6soplex7DVectorD1Ev(%"class.soplex::DVector"* %64)
          to label %65 unwind label %74

; <label>:65                                      ; preds = %63
  br label %66

; <label>:66                                      ; preds = %65, %59
  %67 = bitcast %"class.soplex::SPxSteepPR"* %4 to %"class.soplex::SPxPricer"*
  invoke void @_ZN6soplex9SPxPricerD2Ev(%"class.soplex::SPxPricer"* %67)
          to label %68 unwind label %74

; <label>:68                                      ; preds = %66
  br label %69

; <label>:69                                      ; preds = %68
  %70 = load i8** %2
  %71 = load i32* %3
  %72 = insertvalue { i8*, i32 } undef, i8* %70, 0
  %73 = insertvalue { i8*, i32 } %72, i32 %71, 1
  resume { i8*, i32 } %73

; <label>:74                                      ; preds = %66, %63, %56, %49, %42, %35, %21
  %75 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          catch i8* null
  %76 = extractvalue { i8*, i32 } %75, 0
  call void @__clang_call_terminate(i8* %76) #10
  unreachable
}

; Function Attrs: inlinehint uwtable
define linkonce_odr void @_ZN6soplex10SPxSteepPRD0Ev(%"class.soplex::SPxSteepPR"* %this) unnamed_addr #7 align 2 {
  %1 = alloca %"class.soplex::SPxSteepPR"*, align 8
  %2 = alloca i8*
  %3 = alloca i32
  store %"class.soplex::SPxSteepPR"* %this, %"class.soplex::SPxSteepPR"** %1, align 8
  %4 = load %"class.soplex::SPxSteepPR"** %1
  invoke void @_ZN6soplex10SPxSteepPRD2Ev(%"class.soplex::SPxSteepPR"* %4)
          to label %5 unwind label %7

; <label>:5                                       ; preds = %0
  %6 = bitcast %"class.soplex::SPxSteepPR"* %4 to i8*
  call void @_ZdlPv(i8* %6) #11
  ret void

; <label>:7                                       ; preds = %0
  %8 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
  %9 = extractvalue { i8*, i32 } %8, 0
  store i8* %9, i8** %2
  %10 = extractvalue { i8*, i32 } %8, 1
  store i32 %10, i32* %3
  %11 = bitcast %"class.soplex::SPxSteepPR"* %4 to i8*
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
define linkonce_odr i64 @_ZN6soplex9DataArrayIdE5reMaxEii(%"class.soplex::DataArray.3"* %this, i32 %newMax, i32 %newSize) #3 align 2 {
  %1 = alloca i64, align 8
  %2 = alloca %"class.soplex::DataArray.3"*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %olddata = alloca double*, align 8
  store %"class.soplex::DataArray.3"* %this, %"class.soplex::DataArray.3"** %2, align 8
  store i32 %newMax, i32* %3, align 4
  store i32 %newSize, i32* %4, align 4
  %5 = load %"class.soplex::DataArray.3"** %2
  %6 = load i32* %4, align 4
  %7 = icmp sge i32 %6, 0
  br i1 %7, label %8, label %11

; <label>:8                                       ; preds = %0
  %9 = load i32* %4, align 4
  %10 = getelementptr inbounds %"class.soplex::DataArray.3"* %5, i32 0, i32 0
  store i32 %9, i32* %10, align 4
  br label %11

; <label>:11                                      ; preds = %8, %0
  %12 = load i32* %3, align 4
  %13 = load i32* %4, align 4
  %14 = icmp slt i32 %12, %13
  br i1 %14, label %15, label %17

; <label>:15                                      ; preds = %11
  %16 = load i32* %4, align 4
  store i32 %16, i32* %3, align 4
  br label %17

; <label>:17                                      ; preds = %15, %11
  %18 = load i32* %3, align 4
  %19 = icmp slt i32 %18, 1
  br i1 %19, label %20, label %21

; <label>:20                                      ; preds = %17
  store i32 1, i32* %3, align 4
  br label %21

; <label>:21                                      ; preds = %20, %17
  %22 = load i32* %3, align 4
  %23 = getelementptr inbounds %"class.soplex::DataArray.3"* %5, i32 0, i32 1
  %24 = load i32* %23, align 4
  %25 = icmp eq i32 %22, %24
  br i1 %25, label %26, label %27

; <label>:26                                      ; preds = %21
  store i64 0, i64* %1
  br label %53

; <label>:27                                      ; preds = %21
  %28 = load i32* %3, align 4
  %29 = getelementptr inbounds %"class.soplex::DataArray.3"* %5, i32 0, i32 1
  store i32 %28, i32* %29, align 4
  %30 = getelementptr inbounds %"class.soplex::DataArray.3"* %5, i32 0, i32 2
  %31 = load double** %30, align 8
  store double* %31, double** %olddata, align 8
  %32 = getelementptr inbounds %"class.soplex::DataArray.3"* %5, i32 0, i32 0
  %33 = load i32* %32, align 4
  %34 = icmp sle i32 %33, 0
  br i1 %34, label %35, label %40

; <label>:35                                      ; preds = %27
  %36 = getelementptr inbounds %"class.soplex::DataArray.3"* %5, i32 0, i32 2
  call void @_ZN6soplex8spx_freeIPdEEvRT_(double** dereferenceable(8) %36)
  %37 = getelementptr inbounds %"class.soplex::DataArray.3"* %5, i32 0, i32 2
  %38 = getelementptr inbounds %"class.soplex::DataArray.3"* %5, i32 0, i32 1
  %39 = load i32* %38, align 4
  call void @_ZN6soplex9spx_allocIPdEEvRT_i(double** dereferenceable(8) %37, i32 %39)
  br label %44

; <label>:40                                      ; preds = %27
  %41 = getelementptr inbounds %"class.soplex::DataArray.3"* %5, i32 0, i32 2
  %42 = getelementptr inbounds %"class.soplex::DataArray.3"* %5, i32 0, i32 1
  %43 = load i32* %42, align 4
  call void @_ZN6soplex11spx_reallocIPdEEvRT_i(double** dereferenceable(8) %41, i32 %43)
  br label %44

; <label>:44                                      ; preds = %40, %35
  %45 = getelementptr inbounds %"class.soplex::DataArray.3"* %5, i32 0, i32 2
  %46 = load double** %45, align 8
  %47 = bitcast double* %46 to i8*
  %48 = load double** %olddata, align 8
  %49 = bitcast double* %48 to i8*
  %50 = ptrtoint i8* %47 to i64
  %51 = ptrtoint i8* %49 to i64
  %52 = sub i64 %50, %51
  store i64 %52, i64* %1
  br label %53

; <label>:53                                      ; preds = %44, %26
  %54 = load i64* %1
  ret i64 %54
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr void @_ZN6soplex8spx_freeIPdEEvRT_(double** dereferenceable(8) %p) #5 {
  %1 = alloca double**, align 8
  store double** %p, double*** %1, align 8
  %2 = load double*** %1, align 8
  %3 = load double** %2, align 8
  %4 = icmp ne double* %3, null
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  br label %8

; <label>:6                                       ; preds = %0
  call void @__assert_fail(i8* getelementptr inbounds ([7 x i8]* @.str21, i32 0, i32 0), i8* getelementptr inbounds ([13 x i8]* @.str22, i32 0, i32 0), i32 88, i8* getelementptr inbounds ([42 x i8]* @__PRETTY_FUNCTION__._ZN6soplex8spx_freeIPdEEvRT_, i32 0, i32 0)) #10
  unreachable
                                                  ; No predecessors!
  br label %8

; <label>:8                                       ; preds = %7, %5
  %9 = load double*** %1, align 8
  %10 = load double** %9, align 8
  %11 = bitcast double* %10 to i8*
  call void @free(i8* %11) #1
  %12 = load double*** %1, align 8
  store double* null, double** %12, align 8
  ret void
}

; Function Attrs: inlinehint uwtable
define linkonce_odr void @_ZN6soplex9spx_allocIPdEEvRT_i(double** dereferenceable(8) %p, i32 %n) #7 {
  %1 = alloca double**, align 8
  %2 = alloca i32, align 4
  store double** %p, double*** %1, align 8
  store i32 %n, i32* %2, align 4
  %3 = load double*** %1, align 8
  %4 = load double** %3, align 8
  %5 = icmp eq double* %4, null
  br i1 %5, label %6, label %7

; <label>:6                                       ; preds = %0
  br label %9

; <label>:7                                       ; preds = %0
  call void @__assert_fail(i8* getelementptr inbounds ([7 x i8]* @.str24, i32 0, i32 0), i8* getelementptr inbounds ([13 x i8]* @.str22, i32 0, i32 0), i32 50, i8* getelementptr inbounds ([48 x i8]* @__PRETTY_FUNCTION__._ZN6soplex9spx_allocIPdEEvRT_i, i32 0, i32 0)) #10
  unreachable
                                                  ; No predecessors!
  br label %9

; <label>:9                                       ; preds = %8, %6
  %10 = load i32* %2, align 4
  %11 = icmp sge i32 %10, 0
  br i1 %11, label %12, label %13

; <label>:12                                      ; preds = %9
  br label %15

; <label>:13                                      ; preds = %9
  call void @__assert_fail(i8* getelementptr inbounds ([7 x i8]* @.str17, i32 0, i32 0), i8* getelementptr inbounds ([13 x i8]* @.str22, i32 0, i32 0), i32 51, i8* getelementptr inbounds ([48 x i8]* @__PRETTY_FUNCTION__._ZN6soplex9spx_allocIPdEEvRT_i, i32 0, i32 0)) #10
  unreachable
                                                  ; No predecessors!
  br label %15

; <label>:15                                      ; preds = %14, %12
  %16 = load i32* %2, align 4
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %18, label %19

; <label>:18                                      ; preds = %15
  store i32 1, i32* %2, align 4
  br label %19

; <label>:19                                      ; preds = %18, %15
  %20 = load i32* %2, align 4
  %21 = sext i32 %20 to i64
  %22 = mul i64 8, %21
  %23 = call noalias i8* @malloc(i64 %22) #1
  %24 = bitcast i8* %23 to double*
  %25 = load double*** %1, align 8
  store double* %24, double** %25, align 8
  %26 = load double*** %1, align 8
  %27 = load double** %26, align 8
  %28 = icmp eq double* null, %27
  br i1 %28, label %29, label %32

; <label>:29                                      ; preds = %19
  %30 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cerr, i8* getelementptr inbounds ([22 x i8]* @.str25, i32 0, i32 0))
  %31 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* %30, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
  call void @abort() #10
  unreachable

; <label>:32                                      ; preds = %19
  ret void
}

; Function Attrs: inlinehint uwtable
define linkonce_odr void @_ZN6soplex11spx_reallocIPdEEvRT_i(double** dereferenceable(8) %p, i32 %n) #7 {
  %1 = alloca double**, align 8
  %2 = alloca i32, align 4
  store double** %p, double*** %1, align 8
  store i32 %n, i32* %2, align 4
  %3 = load double*** %1, align 8
  %4 = load double** %3, align 8
  %5 = icmp ne double* %4, null
  br i1 %5, label %6, label %7

; <label>:6                                       ; preds = %0
  br label %9

; <label>:7                                       ; preds = %0
  call void @__assert_fail(i8* getelementptr inbounds ([7 x i8]* @.str21, i32 0, i32 0), i8* getelementptr inbounds ([13 x i8]* @.str22, i32 0, i32 0), i32 72, i8* getelementptr inbounds ([50 x i8]* @__PRETTY_FUNCTION__._ZN6soplex11spx_reallocIPdEEvRT_i, i32 0, i32 0)) #10
  unreachable
                                                  ; No predecessors!
  br label %9

; <label>:9                                       ; preds = %8, %6
  %10 = load i32* %2, align 4
  %11 = icmp sge i32 %10, 0
  br i1 %11, label %12, label %13

; <label>:12                                      ; preds = %9
  br label %15

; <label>:13                                      ; preds = %9
  call void @__assert_fail(i8* getelementptr inbounds ([7 x i8]* @.str17, i32 0, i32 0), i8* getelementptr inbounds ([13 x i8]* @.str22, i32 0, i32 0), i32 73, i8* getelementptr inbounds ([50 x i8]* @__PRETTY_FUNCTION__._ZN6soplex11spx_reallocIPdEEvRT_i, i32 0, i32 0)) #10
  unreachable
                                                  ; No predecessors!
  br label %15

; <label>:15                                      ; preds = %14, %12
  %16 = load double*** %1, align 8
  %17 = load double** %16, align 8
  %18 = bitcast double* %17 to i8*
  %19 = load i32* %2, align 4
  %20 = sext i32 %19 to i64
  %21 = mul i64 8, %20
  %22 = call i8* @realloc(i8* %18, i64 %21) #1
  %23 = bitcast i8* %22 to double*
  %24 = load double*** %1, align 8
  store double* %23, double** %24, align 8
  %25 = load double*** %1, align 8
  %26 = load double** %25, align 8
  %27 = icmp eq double* null, %26
  br i1 %27, label %28, label %31

; <label>:28                                      ; preds = %15
  %29 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cerr, i8* getelementptr inbounds ([23 x i8]* @.str23, i32 0, i32 0))
  %30 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* %29, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
  call void @abort() #10
  unreachable

; <label>:31                                      ; preds = %15
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
  %1 = alloca %"class.soplex::DataArray.3"*, align 8
  store %"class.soplex::DataArray.3"* %this, %"class.soplex::DataArray.3"** %1, align 8
  %2 = load %"class.soplex::DataArray.3"** %1
  %3 = getelementptr inbounds %"class.soplex::DataArray.3"* %2, i32 0, i32 2
  call void @_ZN6soplex8spx_freeIPdEEvRT_(double** dereferenceable(8) %3)
  ret void
}

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN6soplex9SPxPricer4loadEPNS_6SoPlexE(%"class.soplex::SPxPricer"* %this, %"class.soplex::SoPlex"* %p_solver) unnamed_addr #2 align 2 {
  %1 = alloca %"class.soplex::SPxPricer"*, align 8
  %2 = alloca %"class.soplex::SoPlex"*, align 8
  store %"class.soplex::SPxPricer"* %this, %"class.soplex::SPxPricer"** %1, align 8
  store %"class.soplex::SoPlex"* %p_solver, %"class.soplex::SoPlex"** %2, align 8
  %3 = load %"class.soplex::SPxPricer"** %1
  %4 = load %"class.soplex::SoPlex"** %2, align 8
  %5 = getelementptr inbounds %"class.soplex::SPxPricer"* %3, i32 0, i32 2
  store %"class.soplex::SoPlex"* %4, %"class.soplex::SoPlex"** %5, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN6soplex9SPxPricer5clearEv(%"class.soplex::SPxPricer"* %this) unnamed_addr #2 align 2 {
  %1 = alloca %"class.soplex::SPxPricer"*, align 8
  store %"class.soplex::SPxPricer"* %this, %"class.soplex::SPxPricer"** %1, align 8
  %2 = load %"class.soplex::SPxPricer"** %1
  %3 = getelementptr inbounds %"class.soplex::SPxPricer"* %2, i32 0, i32 2
  store %"class.soplex::SoPlex"* null, %"class.soplex::SoPlex"** %3, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN6soplex9SPxPricer7setTypeENS_6SoPlex4TypeE(%"class.soplex::SPxPricer"* %this, i32) unnamed_addr #2 align 2 {
  %2 = alloca %"class.soplex::SPxPricer"*, align 8
  %3 = alloca i32, align 4
  store %"class.soplex::SPxPricer"* %this, %"class.soplex::SPxPricer"** %2, align 8
  store i32 %0, i32* %3, align 4
  %4 = load %"class.soplex::SPxPricer"** %2
  ret void
}

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN6soplex9SPxPricer6setRepENS_6SoPlex14RepresentationE(%"class.soplex::SPxPricer"* %this, i32) unnamed_addr #2 align 2 {
  %2 = alloca %"class.soplex::SPxPricer"*, align 8
  %3 = alloca i32, align 4
  store %"class.soplex::SPxPricer"* %this, %"class.soplex::SPxPricer"** %2, align 8
  store i32 %0, i32* %3, align 4
  %4 = load %"class.soplex::SPxPricer"** %2
  ret void
}

declare void @__cxa_pure_virtual()

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN6soplex9SPxPricer5left4EiNS_5SPxIdE(%"class.soplex::SPxPricer"* %this, i32, %"class.soplex::SPxId"*) unnamed_addr #2 align 2 {
  %3 = alloca %"class.soplex::SPxPricer"*, align 8
  %4 = alloca i32, align 4
  store %"class.soplex::SPxPricer"* %this, %"class.soplex::SPxPricer"** %3, align 8
  store i32 %0, i32* %4, align 4
  %5 = load %"class.soplex::SPxPricer"** %3
  ret void
}

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN6soplex9SPxPricer8entered4ENS_5SPxIdEi(%"class.soplex::SPxPricer"* %this, %"class.soplex::SPxId"*, i32) unnamed_addr #2 align 2 {
  %3 = alloca %"class.soplex::SPxPricer"*, align 8
  %4 = alloca i32, align 4
  store %"class.soplex::SPxPricer"* %this, %"class.soplex::SPxPricer"** %3, align 8
  store i32 %1, i32* %4, align 4
  %5 = load %"class.soplex::SPxPricer"** %3
  ret void
}

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN6soplex9SPxPricer9addedVecsEi(%"class.soplex::SPxPricer"* %this, i32) unnamed_addr #2 align 2 {
  %2 = alloca %"class.soplex::SPxPricer"*, align 8
  %3 = alloca i32, align 4
  store %"class.soplex::SPxPricer"* %this, %"class.soplex::SPxPricer"** %2, align 8
  store i32 %0, i32* %3, align 4
  %4 = load %"class.soplex::SPxPricer"** %2
  ret void
}

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN6soplex9SPxPricer11addedCoVecsEi(%"class.soplex::SPxPricer"* %this, i32) unnamed_addr #2 align 2 {
  %2 = alloca %"class.soplex::SPxPricer"*, align 8
  %3 = alloca i32, align 4
  store %"class.soplex::SPxPricer"* %this, %"class.soplex::SPxPricer"** %2, align 8
  store i32 %0, i32* %3, align 4
  %4 = load %"class.soplex::SPxPricer"** %2
  ret void
}

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN6soplex9SPxPricer10removedVecEi(%"class.soplex::SPxPricer"* %this, i32) unnamed_addr #2 align 2 {
  %2 = alloca %"class.soplex::SPxPricer"*, align 8
  %3 = alloca i32, align 4
  store %"class.soplex::SPxPricer"* %this, %"class.soplex::SPxPricer"** %2, align 8
  store i32 %0, i32* %3, align 4
  %4 = load %"class.soplex::SPxPricer"** %2
  ret void
}

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN6soplex9SPxPricer11removedVecsEPKi(%"class.soplex::SPxPricer"* %this, i32*) unnamed_addr #2 align 2 {
  %2 = alloca %"class.soplex::SPxPricer"*, align 8
  %3 = alloca i32*, align 8
  store %"class.soplex::SPxPricer"* %this, %"class.soplex::SPxPricer"** %2, align 8
  store i32* %0, i32** %3, align 8
  %4 = load %"class.soplex::SPxPricer"** %2
  ret void
}

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN6soplex9SPxPricer12removedCoVecEi(%"class.soplex::SPxPricer"* %this, i32) unnamed_addr #2 align 2 {
  %2 = alloca %"class.soplex::SPxPricer"*, align 8
  %3 = alloca i32, align 4
  store %"class.soplex::SPxPricer"* %this, %"class.soplex::SPxPricer"** %2, align 8
  store i32 %0, i32* %3, align 4
  %4 = load %"class.soplex::SPxPricer"** %2
  ret void
}

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN6soplex9SPxPricer13removedCoVecsEPKi(%"class.soplex::SPxPricer"* %this, i32*) unnamed_addr #2 align 2 {
  %2 = alloca %"class.soplex::SPxPricer"*, align 8
  %3 = alloca i32*, align 8
  store %"class.soplex::SPxPricer"* %this, %"class.soplex::SPxPricer"** %2, align 8
  store i32* %0, i32** %3, align 8
  %4 = load %"class.soplex::SPxPricer"** %2
  ret void
}

; Function Attrs: nounwind uwtable
define linkonce_odr zeroext i1 @_ZNK6soplex9SPxPricer12isConsistentEv(%"class.soplex::SPxPricer"* %this) unnamed_addr #2 align 2 {
  %1 = alloca %"class.soplex::SPxPricer"*, align 8
  store %"class.soplex::SPxPricer"* %this, %"class.soplex::SPxPricer"** %1, align 8
  %2 = load %"class.soplex::SPxPricer"** %1
  %3 = getelementptr inbounds %"class.soplex::SPxPricer"* %2, i32 0, i32 2
  %4 = load %"class.soplex::SoPlex"** %3, align 8
  %5 = icmp ne %"class.soplex::SoPlex"* %4, null
  ret i1 %5
}

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN6soplex9SPxPricerD2Ev(%"class.soplex::SPxPricer"* %this) unnamed_addr #2 align 2 {
  %1 = alloca %"class.soplex::SPxPricer"*, align 8
  store %"class.soplex::SPxPricer"* %this, %"class.soplex::SPxPricer"** %1, align 8
  %2 = load %"class.soplex::SPxPricer"** %1
  %3 = bitcast %"class.soplex::SPxPricer"* %2 to i32 (...)***
  store i32 (...)** bitcast (i8** getelementptr inbounds ([23 x i8*]* @_ZTVN6soplex9SPxPricerE, i64 0, i64 2) to i32 (...)**), i32 (...)*** %3
  %4 = getelementptr inbounds %"class.soplex::SPxPricer"* %2, i32 0, i32 1
  store i8* null, i8** %4, align 8
  %5 = getelementptr inbounds %"class.soplex::SPxPricer"* %2, i32 0, i32 2
  store %"class.soplex::SoPlex"* null, %"class.soplex::SoPlex"** %5, align 8
  ret void
}

; Function Attrs: uwtable
define linkonce_odr void @_ZN6soplex9SPxPricerD0Ev(%"class.soplex::SPxPricer"* %this) unnamed_addr #3 align 2 {
  %1 = alloca %"class.soplex::SPxPricer"*, align 8
  %2 = alloca i8*
  %3 = alloca i32
  store %"class.soplex::SPxPricer"* %this, %"class.soplex::SPxPricer"** %1, align 8
  %4 = load %"class.soplex::SPxPricer"** %1
  invoke void @_ZN6soplex9SPxPricerD2Ev(%"class.soplex::SPxPricer"* %4)
          to label %5 unwind label %7

; <label>:5                                       ; preds = %0
  %6 = bitcast %"class.soplex::SPxPricer"* %4 to i8*
  call void @_ZdlPv(i8* %6) #11
  ret void

; <label>:7                                       ; preds = %0
  %8 = landingpad { i8*, i32 } personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
          cleanup
  %9 = extractvalue { i8*, i32 } %8, 0
  store i8* %9, i8** %2
  %10 = extractvalue { i8*, i32 } %8, 1
  store i32 %10, i32* %3
  %11 = bitcast %"class.soplex::SPxPricer"* %4 to i8*
  call void @_ZdlPv(i8* %11) #11
  br label %12

; <label>:12                                      ; preds = %7
  %13 = load i8** %2
  %14 = load i32* %3
  %15 = insertvalue { i8*, i32 } undef, i8* %13, 0
  %16 = insertvalue { i8*, i32 } %15, i32 %14, 1
  resume { i8*, i32 } %16
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr void @_ZN6soplex8spx_freeIPiEEvRT_(i32** dereferenceable(8) %p) #5 {
  %1 = alloca i32**, align 8
  store i32** %p, i32*** %1, align 8
  %2 = load i32*** %1, align 8
  %3 = load i32** %2, align 8
  %4 = icmp ne i32* %3, null
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  br label %8

; <label>:6                                       ; preds = %0
  call void @__assert_fail(i8* getelementptr inbounds ([7 x i8]* @.str21, i32 0, i32 0), i8* getelementptr inbounds ([13 x i8]* @.str22, i32 0, i32 0), i32 88, i8* getelementptr inbounds ([39 x i8]* @__PRETTY_FUNCTION__._ZN6soplex8spx_freeIPiEEvRT_, i32 0, i32 0)) #10
  unreachable
                                                  ; No predecessors!
  br label %8

; <label>:8                                       ; preds = %7, %5
  %9 = load i32*** %1, align 8
  %10 = load i32** %9, align 8
  %11 = bitcast i32* %10 to i8*
  call void @free(i8* %11) #1
  %12 = load i32*** %1, align 8
  store i32* null, i32** %12, align 8
  ret void
}

declare void @_ZN6soplex7DVectorD2Ev(%"class.soplex::DVector"*) #0

declare void @_ZN6soplex7DVectorC2Ei(%"class.soplex::DVector"*, i32) #0

; Function Attrs: uwtable
define linkonce_odr void @_ZN6soplex6IdxSetC2Ev(%"class.soplex::IdxSet"* %this) unnamed_addr #3 align 2 {
  %1 = alloca %"class.soplex::IdxSet"*, align 8
  store %"class.soplex::IdxSet"* %this, %"class.soplex::IdxSet"** %1, align 8
  %2 = load %"class.soplex::IdxSet"** %1
  %3 = getelementptr inbounds %"class.soplex::IdxSet"* %2, i32 0, i32 0
  store i32 0, i32* %3, align 4
  %4 = getelementptr inbounds %"class.soplex::IdxSet"* %2, i32 0, i32 1
  store i32 0, i32* %4, align 4
  %5 = getelementptr inbounds %"class.soplex::IdxSet"* %2, i32 0, i32 2
  store i32* null, i32** %5, align 8
  %6 = call zeroext i1 @_ZNK6soplex6IdxSet12isConsistentEv(%"class.soplex::IdxSet"* %2)
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %0
  br label %10

; <label>:8                                       ; preds = %0
  call void @__assert_fail(i8* getelementptr inbounds ([15 x i8]* @.str10, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8]* @.str30, i32 0, i32 0), i32 152, i8* getelementptr inbounds ([25 x i8]* @__PRETTY_FUNCTION__._ZN6soplex6IdxSetC2Ev, i32 0, i32 0)) #10
  unreachable
                                                  ; No predecessors!
  br label %10

; <label>:10                                      ; preds = %9, %7
  ret void
}

; Function Attrs: inlinehint uwtable
define linkonce_odr void @_ZN6soplex9spx_allocIPiEEvRT_i(i32** dereferenceable(8) %p, i32 %n) #7 {
  %1 = alloca i32**, align 8
  %2 = alloca i32, align 4
  store i32** %p, i32*** %1, align 8
  store i32 %n, i32* %2, align 4
  %3 = load i32*** %1, align 8
  %4 = load i32** %3, align 8
  %5 = icmp eq i32* %4, null
  br i1 %5, label %6, label %7

; <label>:6                                       ; preds = %0
  br label %9

; <label>:7                                       ; preds = %0
  call void @__assert_fail(i8* getelementptr inbounds ([7 x i8]* @.str24, i32 0, i32 0), i8* getelementptr inbounds ([13 x i8]* @.str22, i32 0, i32 0), i32 50, i8* getelementptr inbounds ([45 x i8]* @__PRETTY_FUNCTION__._ZN6soplex9spx_allocIPiEEvRT_i, i32 0, i32 0)) #10
  unreachable
                                                  ; No predecessors!
  br label %9

; <label>:9                                       ; preds = %8, %6
  %10 = load i32* %2, align 4
  %11 = icmp sge i32 %10, 0
  br i1 %11, label %12, label %13

; <label>:12                                      ; preds = %9
  br label %15

; <label>:13                                      ; preds = %9
  call void @__assert_fail(i8* getelementptr inbounds ([7 x i8]* @.str17, i32 0, i32 0), i8* getelementptr inbounds ([13 x i8]* @.str22, i32 0, i32 0), i32 51, i8* getelementptr inbounds ([45 x i8]* @__PRETTY_FUNCTION__._ZN6soplex9spx_allocIPiEEvRT_i, i32 0, i32 0)) #10
  unreachable
                                                  ; No predecessors!
  br label %15

; <label>:15                                      ; preds = %14, %12
  %16 = load i32* %2, align 4
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %18, label %19

; <label>:18                                      ; preds = %15
  store i32 1, i32* %2, align 4
  br label %19

; <label>:19                                      ; preds = %18, %15
  %20 = load i32* %2, align 4
  %21 = sext i32 %20 to i64
  %22 = mul i64 4, %21
  %23 = call noalias i8* @malloc(i64 %22) #1
  %24 = bitcast i8* %23 to i32*
  %25 = load i32*** %1, align 8
  store i32* %24, i32** %25, align 8
  %26 = load i32*** %1, align 8
  %27 = load i32** %26, align 8
  %28 = icmp eq i32* null, %27
  br i1 %28, label %29, label %32

; <label>:29                                      ; preds = %19
  %30 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) @_ZSt4cerr, i8* getelementptr inbounds ([22 x i8]* @.str25, i32 0, i32 0))
  %31 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* %30, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
  call void @abort() #10
  unreachable

; <label>:32                                      ; preds = %19
  ret void
}

declare zeroext i1 @_ZNK6soplex6IdxSet12isConsistentEv(%"class.soplex::IdxSet"*) #0

; Function Attrs: nounwind uwtable
define linkonce_odr zeroext i1 @_ZNK6soplex5SPxId10isSPxRowIdEv(%"class.soplex::SPxId"* %this) #2 align 2 {
  %1 = alloca %"class.soplex::SPxId"*, align 8
  store %"class.soplex::SPxId"* %this, %"class.soplex::SPxId"** %1, align 8
  %2 = load %"class.soplex::SPxId"** %1
  %3 = bitcast %"class.soplex::SPxId"* %2 to %"class.soplex::DataKey"*
  %4 = bitcast %"class.soplex::DataKey"* %3 to i32*
  %5 = load i32* %4, align 4
  %6 = shl i32 %5, 24
  %7 = ashr i32 %6, 24
  %8 = icmp slt i32 %7, 0
  ret i1 %8
}

; Function Attrs: uwtable
define linkonce_odr dereferenceable(8) %"class.soplex::SVector"* @_ZNK6soplex6SoPlex6vectorERKNS_8SPxRowIdE(%"class.soplex::SoPlex"* %this, %"class.soplex::SPxRowId"* dereferenceable(4) %rid) #3 align 2 {
  %1 = alloca %"class.soplex::SoPlex"*, align 8
  %2 = alloca %"class.soplex::SPxRowId"*, align 8
  store %"class.soplex::SoPlex"* %this, %"class.soplex::SoPlex"** %1, align 8
  store %"class.soplex::SPxRowId"* %rid, %"class.soplex::SPxRowId"** %2, align 8
  %3 = load %"class.soplex::SoPlex"** %1
  %4 = load %"class.soplex::SPxRowId"** %2, align 8
  %5 = bitcast %"class.soplex::SPxRowId"* %4 to %"class.soplex::DataKey"*
  %6 = call i32 @_ZNK6soplex7DataKey7isValidEv(%"class.soplex::DataKey"* %5)
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %0
  br label %11

; <label>:9                                       ; preds = %0
  call void @__assert_fail(i8* getelementptr inbounds ([14 x i8]* @.str39, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8]* @.str32, i32 0, i32 0), i32 732, i8* getelementptr inbounds ([78 x i8]* @__PRETTY_FUNCTION__._ZNK6soplex6SoPlex6vectorERKNS_8SPxRowIdE, i32 0, i32 0)) #10
  unreachable
                                                  ; No predecessors!
  br label %11

; <label>:11                                      ; preds = %10, %8
  %12 = call i32 @_ZNK6soplex6SoPlex3repEv(%"class.soplex::SoPlex"* %3)
  %13 = icmp eq i32 %12, -1
  br i1 %13, label %14, label %21

; <label>:14                                      ; preds = %11
  %15 = getelementptr inbounds %"class.soplex::SoPlex"* %3, i32 0, i32 22
  %16 = load %"class.soplex::SVSet"** %15, align 8
  %17 = bitcast %"class.soplex::SoPlex"* %3 to %"class.soplex::SPxLP"*
  %18 = load %"class.soplex::SPxRowId"** %2, align 8
  %19 = call i32 @_ZNK6soplex5SPxLP6numberERKNS_8SPxRowIdE(%"class.soplex::SPxLP"* %17, %"class.soplex::SPxRowId"* dereferenceable(4) %18)
  %20 = call dereferenceable(8) %"class.soplex::SVector"* @_ZNK6soplex5SVSetixEi(%"class.soplex::SVSet"* %16, i32 %19)
  br label %28

; <label>:21                                      ; preds = %11
  %22 = getelementptr inbounds %"class.soplex::SoPlex"* %3, i32 0, i32 21
  %23 = bitcast %"class.soplex::SoPlex"* %3 to %"class.soplex::SPxLP"*
  %24 = load %"class.soplex::SPxRowId"** %2, align 8
  %25 = call i32 @_ZNK6soplex5SPxLP6numberERKNS_8SPxRowIdE(%"class.soplex::SPxLP"* %23, %"class.soplex::SPxRowId"* dereferenceable(4) %24)
  %26 = call dereferenceable(40) %"class.soplex::UnitVector"* @_ZNK6soplex5ArrayINS_10UnitVectorEEixEi(%"class.soplex::Array"* %22, i32 %25)
  %27 = bitcast %"class.soplex::UnitVector"* %26 to %"class.soplex::SVector"*
  br label %28

; <label>:28                                      ; preds = %21, %14
  %29 = phi %"class.soplex::SVector"* [ %20, %14 ], [ %27, %21 ]
  ret %"class.soplex::SVector"* %29
}

declare void @_ZN6soplex8SPxRowIdC1ERKNS_5SPxIdE(%"class.soplex::SPxRowId"*, %"class.soplex::SPxId"* dereferenceable(4)) #0

; Function Attrs: uwtable
define linkonce_odr dereferenceable(8) %"class.soplex::SVector"* @_ZNK6soplex6SoPlex6vectorERKNS_8SPxColIdE(%"class.soplex::SoPlex"* %this, %"class.soplex::SPxColId"* dereferenceable(4) %cid) #3 align 2 {
  %1 = alloca %"class.soplex::SoPlex"*, align 8
  %2 = alloca %"class.soplex::SPxColId"*, align 8
  store %"class.soplex::SoPlex"* %this, %"class.soplex::SoPlex"** %1, align 8
  store %"class.soplex::SPxColId"* %cid, %"class.soplex::SPxColId"** %2, align 8
  %3 = load %"class.soplex::SoPlex"** %1
  %4 = load %"class.soplex::SPxColId"** %2, align 8
  %5 = bitcast %"class.soplex::SPxColId"* %4 to %"class.soplex::DataKey"*
  %6 = call i32 @_ZNK6soplex7DataKey7isValidEv(%"class.soplex::DataKey"* %5)
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %0
  br label %11

; <label>:9                                       ; preds = %0
  call void @__assert_fail(i8* getelementptr inbounds ([14 x i8]* @.str34, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8]* @.str32, i32 0, i32 0), i32 740, i8* getelementptr inbounds ([78 x i8]* @__PRETTY_FUNCTION__._ZNK6soplex6SoPlex6vectorERKNS_8SPxColIdE, i32 0, i32 0)) #10
  unreachable
                                                  ; No predecessors!
  br label %11

; <label>:11                                      ; preds = %10, %8
  %12 = call i32 @_ZNK6soplex6SoPlex3repEv(%"class.soplex::SoPlex"* %3)
  %13 = icmp eq i32 %12, 1
  br i1 %13, label %14, label %21

; <label>:14                                      ; preds = %11
  %15 = getelementptr inbounds %"class.soplex::SoPlex"* %3, i32 0, i32 22
  %16 = load %"class.soplex::SVSet"** %15, align 8
  %17 = bitcast %"class.soplex::SoPlex"* %3 to %"class.soplex::SPxLP"*
  %18 = load %"class.soplex::SPxColId"** %2, align 8
  %19 = call i32 @_ZNK6soplex5SPxLP6numberERKNS_8SPxColIdE(%"class.soplex::SPxLP"* %17, %"class.soplex::SPxColId"* dereferenceable(4) %18)
  %20 = call dereferenceable(8) %"class.soplex::SVector"* @_ZNK6soplex5SVSetixEi(%"class.soplex::SVSet"* %16, i32 %19)
  br label %28

; <label>:21                                      ; preds = %11
  %22 = getelementptr inbounds %"class.soplex::SoPlex"* %3, i32 0, i32 21
  %23 = bitcast %"class.soplex::SoPlex"* %3 to %"class.soplex::SPxLP"*
  %24 = load %"class.soplex::SPxColId"** %2, align 8
  %25 = call i32 @_ZNK6soplex5SPxLP6numberERKNS_8SPxColIdE(%"class.soplex::SPxLP"* %23, %"class.soplex::SPxColId"* dereferenceable(4) %24)
  %26 = call dereferenceable(40) %"class.soplex::UnitVector"* @_ZNK6soplex5ArrayINS_10UnitVectorEEixEi(%"class.soplex::Array"* %22, i32 %25)
  %27 = bitcast %"class.soplex::UnitVector"* %26 to %"class.soplex::SVector"*
  br label %28

; <label>:28                                      ; preds = %21, %14
  %29 = phi %"class.soplex::SVector"* [ %20, %14 ], [ %27, %21 ]
  ret %"class.soplex::SVector"* %29
}

declare void @_ZN6soplex8SPxColIdC1ERKNS_5SPxIdE(%"class.soplex::SPxColId"*, %"class.soplex::SPxId"* dereferenceable(4)) #0

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr i32 @_ZNK6soplex7DataKey7isValidEv(%"class.soplex::DataKey"* %this) #5 align 2 {
  %1 = alloca %"class.soplex::DataKey"*, align 8
  store %"class.soplex::DataKey"* %this, %"class.soplex::DataKey"** %1, align 8
  %2 = load %"class.soplex::DataKey"** %1
  %3 = bitcast %"class.soplex::DataKey"* %2 to i32*
  %4 = load i32* %3, align 4
  %5 = ashr i32 %4, 8
  %6 = icmp sge i32 %5, 0
  %7 = zext i1 %6 to i32
  ret i32 %7
}

; Function Attrs: uwtable
define linkonce_odr dereferenceable(8) %"class.soplex::SVector"* @_ZNK6soplex5SVSetixEi(%"class.soplex::SVSet"* %this, i32 %n) #3 align 2 {
  %1 = alloca %"class.soplex::SVSet"*, align 8
  %2 = alloca i32, align 4
  store %"class.soplex::SVSet"* %this, %"class.soplex::SVSet"** %1, align 8
  store i32 %n, i32* %2, align 4
  %3 = load %"class.soplex::SVSet"** %1
  %4 = getelementptr inbounds %"class.soplex::SVSet"* %3, i32 0, i32 1
  %5 = load i32* %2, align 4
  %6 = call dereferenceable(24) %"class.soplex::SVSet::DLPSV"* @_ZNK6soplex7DataSetINS_5SVSet5DLPSVEEixEi(%"class.soplex::DataSet"* %4, i32 %5)
  %7 = bitcast %"class.soplex::SVSet::DLPSV"* %6 to %"class.soplex::SVector"*
  ret %"class.soplex::SVector"* %7
}

; Function Attrs: uwtable
define linkonce_odr i32 @_ZNK6soplex5SPxLP6numberERKNS_8SPxColIdE(%"class.soplex::SPxLP"* %this, %"class.soplex::SPxColId"* dereferenceable(4) %id) #3 align 2 {
  %1 = alloca %"class.soplex::SPxLP"*, align 8
  %2 = alloca %"class.soplex::SPxColId"*, align 8
  store %"class.soplex::SPxLP"* %this, %"class.soplex::SPxLP"** %1, align 8
  store %"class.soplex::SPxColId"* %id, %"class.soplex::SPxColId"** %2, align 8
  %3 = load %"class.soplex::SPxLP"** %1
  %4 = bitcast %"class.soplex::SPxLP"* %3 to i8*
  %5 = getelementptr inbounds i8* %4, i64 160
  %6 = bitcast i8* %5 to %"class.soplex::LPColSet"*
  %7 = load %"class.soplex::SPxColId"** %2, align 8
  %8 = bitcast %"class.soplex::SPxColId"* %7 to %"class.soplex::DataKey"*
  %9 = call i32 @_ZNK6soplex8LPColSet6numberERKNS_7DataKeyE(%"class.soplex::LPColSet"* %6, %"class.soplex::DataKey"* dereferenceable(4) %8)
  ret i32 %9
}

; Function Attrs: uwtable
define linkonce_odr dereferenceable(40) %"class.soplex::UnitVector"* @_ZNK6soplex5ArrayINS_10UnitVectorEEixEi(%"class.soplex::Array"* %this, i32 %n) #3 align 2 {
  %1 = alloca %"class.soplex::Array"*, align 8
  %2 = alloca i32, align 4
  store %"class.soplex::Array"* %this, %"class.soplex::Array"** %1, align 8
  store i32 %n, i32* %2, align 4
  %3 = load %"class.soplex::Array"** %1
  %4 = load i32* %2, align 4
  %5 = icmp sge i32 %4, 0
  br i1 %5, label %6, label %11

; <label>:6                                       ; preds = %0
  %7 = load i32* %2, align 4
  %8 = call i32 @_ZNK6soplex5ArrayINS_10UnitVectorEE4sizeEv(%"class.soplex::Array"* %3)
  %9 = icmp slt i32 %7, %8
  br i1 %9, label %10, label %11

; <label>:10                                      ; preds = %6
  br label %13

; <label>:11                                      ; preds = %6, %0
  call void @__assert_fail(i8* getelementptr inbounds ([21 x i8]* @.str35, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8]* @.str36, i32 0, i32 0), i32 81, i8* getelementptr inbounds ([91 x i8]* @__PRETTY_FUNCTION__._ZNK6soplex5ArrayINS_10UnitVectorEEixEi, i32 0, i32 0)) #10
  unreachable
                                                  ; No predecessors!
  br label %13

; <label>:13                                      ; preds = %12, %10
  %14 = load i32* %2, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds %"class.soplex::Array"* %3, i32 0, i32 1
  %17 = load %"class.soplex::UnitVector"** %16, align 8
  %18 = getelementptr inbounds %"class.soplex::UnitVector"* %17, i64 %15
  ret %"class.soplex::UnitVector"* %18
}

; Function Attrs: nounwind uwtable
define linkonce_odr i32 @_ZNK6soplex5ArrayINS_10UnitVectorEE4sizeEv(%"class.soplex::Array"* %this) #2 align 2 {
  %1 = alloca %"class.soplex::Array"*, align 8
  store %"class.soplex::Array"* %this, %"class.soplex::Array"** %1, align 8
  %2 = load %"class.soplex::Array"** %1
  %3 = getelementptr inbounds %"class.soplex::Array"* %2, i32 0, i32 0
  %4 = load i32* %3, align 4
  ret i32 %4
}

; Function Attrs: uwtable
define linkonce_odr i32 @_ZNK6soplex8LPColSet6numberERKNS_7DataKeyE(%"class.soplex::LPColSet"* %this, %"class.soplex::DataKey"* dereferenceable(4) %k) #3 align 2 {
  %1 = alloca %"class.soplex::LPColSet"*, align 8
  %2 = alloca %"class.soplex::DataKey"*, align 8
  store %"class.soplex::LPColSet"* %this, %"class.soplex::LPColSet"** %1, align 8
  store %"class.soplex::DataKey"* %k, %"class.soplex::DataKey"** %2, align 8
  %3 = load %"class.soplex::LPColSet"** %1
  %4 = bitcast %"class.soplex::LPColSet"* %3 to %"class.soplex::SVSet"*
  %5 = load %"class.soplex::DataKey"** %2, align 8
  %6 = call i32 @_ZNK6soplex5SVSet6numberERKNS_7DataKeyE(%"class.soplex::SVSet"* %4, %"class.soplex::DataKey"* dereferenceable(4) %5)
  ret i32 %6
}

; Function Attrs: uwtable
define linkonce_odr i32 @_ZNK6soplex5SVSet6numberERKNS_7DataKeyE(%"class.soplex::SVSet"* %this, %"class.soplex::DataKey"* dereferenceable(4) %k) #3 align 2 {
  %1 = alloca %"class.soplex::SVSet"*, align 8
  %2 = alloca %"class.soplex::DataKey"*, align 8
  store %"class.soplex::SVSet"* %this, %"class.soplex::SVSet"** %1, align 8
  store %"class.soplex::DataKey"* %k, %"class.soplex::DataKey"** %2, align 8
  %3 = load %"class.soplex::SVSet"** %1
  %4 = getelementptr inbounds %"class.soplex::SVSet"* %3, i32 0, i32 1
  %5 = load %"class.soplex::DataKey"** %2, align 8
  %6 = call i32 @_ZNK6soplex7DataSetINS_5SVSet5DLPSVEE6numberERKNS_7DataKeyE(%"class.soplex::DataSet"* %4, %"class.soplex::DataKey"* dereferenceable(4) %5)
  ret i32 %6
}

; Function Attrs: uwtable
define linkonce_odr i32 @_ZNK6soplex7DataSetINS_5SVSet5DLPSVEE6numberERKNS_7DataKeyE(%"class.soplex::DataSet"* %this, %"class.soplex::DataKey"* dereferenceable(4) %k) #3 align 2 {
  %1 = alloca %"class.soplex::DataSet"*, align 8
  %2 = alloca %"class.soplex::DataKey"*, align 8
  store %"class.soplex::DataSet"* %this, %"class.soplex::DataSet"** %1, align 8
  store %"class.soplex::DataKey"* %k, %"class.soplex::DataKey"** %2, align 8
  %3 = load %"class.soplex::DataSet"** %1
  %4 = load %"class.soplex::DataKey"** %2, align 8
  %5 = bitcast %"class.soplex::DataKey"* %4 to i32*
  %6 = load i32* %5, align 4
  %7 = ashr i32 %6, 8
  %8 = icmp slt i32 %7, 0
  br i1 %8, label %16, label %9

; <label>:9                                       ; preds = %0
  %10 = load %"class.soplex::DataKey"** %2, align 8
  %11 = bitcast %"class.soplex::DataKey"* %10 to i32*
  %12 = load i32* %11, align 4
  %13 = ashr i32 %12, 8
  %14 = call i32 @_ZNK6soplex7DataSetINS_5SVSet5DLPSVEE4sizeEv(%"class.soplex::DataSet"* %3)
  %15 = icmp sge i32 %13, %14
  br i1 %15, label %16, label %17

; <label>:16                                      ; preds = %9, %0
  br label %28

; <label>:17                                      ; preds = %9
  %18 = load %"class.soplex::DataKey"** %2, align 8
  %19 = bitcast %"class.soplex::DataKey"* %18 to i32*
  %20 = load i32* %19, align 4
  %21 = ashr i32 %20, 8
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds %"class.soplex::DataSet"* %3, i32 0, i32 0
  %24 = load %"struct.soplex::DataSet<soplex::SVSet::DLPSV>::Item"** %23, align 8
  %25 = getelementptr inbounds %"struct.soplex::DataSet<soplex::SVSet::DLPSV>::Item"* %24, i64 %22
  %26 = getelementptr inbounds %"struct.soplex::DataSet<soplex::SVSet::DLPSV>::Item"* %25, i32 0, i32 1
  %27 = load i32* %26, align 4
  br label %28

; <label>:28                                      ; preds = %17, %16
  %29 = phi i32 [ -1, %16 ], [ %27, %17 ]
  ret i32 %29
}

; Function Attrs: nounwind uwtable
define linkonce_odr i32 @_ZNK6soplex7DataSetINS_5SVSet5DLPSVEE4sizeEv(%"class.soplex::DataSet"* %this) #2 align 2 {
  %1 = alloca %"class.soplex::DataSet"*, align 8
  store %"class.soplex::DataSet"* %this, %"class.soplex::DataSet"** %1, align 8
  %2 = load %"class.soplex::DataSet"** %1
  %3 = getelementptr inbounds %"class.soplex::DataSet"* %2, i32 0, i32 3
  %4 = load i32* %3, align 4
  ret i32 %4
}

; Function Attrs: nounwind uwtable
define linkonce_odr dereferenceable(24) %"class.soplex::SVSet::DLPSV"* @_ZNK6soplex7DataSetINS_5SVSet5DLPSVEEixEi(%"class.soplex::DataSet"* %this, i32 %n) #2 align 2 {
  %1 = alloca %"class.soplex::DataSet"*, align 8
  %2 = alloca i32, align 4
  store %"class.soplex::DataSet"* %this, %"class.soplex::DataSet"** %1, align 8
  store i32 %n, i32* %2, align 4
  %3 = load %"class.soplex::DataSet"** %1
  %4 = load i32* %2, align 4
  %5 = getelementptr inbounds %"class.soplex::DataSet"* %3, i32 0, i32 4
  %6 = load i32* %5, align 4
  %7 = icmp slt i32 %4, %6
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %0
  br label %11

; <label>:9                                       ; preds = %0
  call void @__assert_fail(i8* getelementptr inbounds ([11 x i8]* @.str37, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8]* @.str38, i32 0, i32 0), i32 345, i8* getelementptr inbounds ([103 x i8]* @__PRETTY_FUNCTION__._ZNK6soplex7DataSetINS_5SVSet5DLPSVEEixEi, i32 0, i32 0)) #10
  unreachable
                                                  ; No predecessors!
  br label %11

; <label>:11                                      ; preds = %10, %8
  %12 = load i32* %2, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds %"class.soplex::DataSet"* %3, i32 0, i32 1
  %15 = load %"class.soplex::DataKey"** %14, align 8
  %16 = getelementptr inbounds %"class.soplex::DataKey"* %15, i64 %13
  %17 = bitcast %"class.soplex::DataKey"* %16 to i32*
  %18 = load i32* %17, align 4
  %19 = ashr i32 %18, 8
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds %"class.soplex::DataSet"* %3, i32 0, i32 0
  %22 = load %"struct.soplex::DataSet<soplex::SVSet::DLPSV>::Item"** %21, align 8
  %23 = getelementptr inbounds %"struct.soplex::DataSet<soplex::SVSet::DLPSV>::Item"* %22, i64 %20
  %24 = getelementptr inbounds %"struct.soplex::DataSet<soplex::SVSet::DLPSV>::Item"* %23, i32 0, i32 0
  ret %"class.soplex::SVSet::DLPSV"* %24
}

; Function Attrs: uwtable
define linkonce_odr i32 @_ZNK6soplex5SPxLP6numberERKNS_8SPxRowIdE(%"class.soplex::SPxLP"* %this, %"class.soplex::SPxRowId"* dereferenceable(4) %id) #3 align 2 {
  %1 = alloca %"class.soplex::SPxLP"*, align 8
  %2 = alloca %"class.soplex::SPxRowId"*, align 8
  store %"class.soplex::SPxLP"* %this, %"class.soplex::SPxLP"** %1, align 8
  store %"class.soplex::SPxRowId"* %id, %"class.soplex::SPxRowId"** %2, align 8
  %3 = load %"class.soplex::SPxLP"** %1
  %4 = bitcast %"class.soplex::SPxLP"* %3 to i8*
  %5 = getelementptr inbounds i8* %4, i64 8
  %6 = bitcast i8* %5 to %"class.soplex::LPRowSet"*
  %7 = load %"class.soplex::SPxRowId"** %2, align 8
  %8 = bitcast %"class.soplex::SPxRowId"* %7 to %"class.soplex::DataKey"*
  %9 = call i32 @_ZNK6soplex8LPRowSet6numberERKNS_7DataKeyE(%"class.soplex::LPRowSet"* %6, %"class.soplex::DataKey"* dereferenceable(4) %8)
  ret i32 %9
}

; Function Attrs: uwtable
define linkonce_odr i32 @_ZNK6soplex8LPRowSet6numberERKNS_7DataKeyE(%"class.soplex::LPRowSet"* %this, %"class.soplex::DataKey"* dereferenceable(4) %k) #3 align 2 {
  %1 = alloca %"class.soplex::LPRowSet"*, align 8
  %2 = alloca %"class.soplex::DataKey"*, align 8
  store %"class.soplex::LPRowSet"* %this, %"class.soplex::LPRowSet"** %1, align 8
  store %"class.soplex::DataKey"* %k, %"class.soplex::DataKey"** %2, align 8
  %3 = load %"class.soplex::LPRowSet"** %1
  %4 = bitcast %"class.soplex::LPRowSet"* %3 to %"class.soplex::SVSet"*
  %5 = load %"class.soplex::DataKey"** %2, align 8
  %6 = call i32 @_ZNK6soplex5SVSet6numberERKNS_7DataKeyE(%"class.soplex::SVSet"* %4, %"class.soplex::DataKey"* dereferenceable(4) %5)
  ret i32 %6
}

; Function Attrs: uwtable
define linkonce_odr void @_ZNK6soplex5SPxLP3cIdEi(%"class.soplex::SPxColId"* noalias sret %agg.result, %"class.soplex::SPxLP"* %this, i32 %n) #3 align 2 {
  %1 = alloca %"class.soplex::SPxLP"*, align 8
  %2 = alloca i32, align 4
  %3 = alloca %"class.soplex::DataKey", align 4
  store %"class.soplex::SPxLP"* %this, %"class.soplex::SPxLP"** %1, align 8
  store i32 %n, i32* %2, align 4
  %4 = load %"class.soplex::SPxLP"** %1
  %5 = bitcast %"class.soplex::SPxLP"* %4 to i8*
  %6 = getelementptr inbounds i8* %5, i64 160
  %7 = bitcast i8* %6 to %"class.soplex::LPColSet"*
  %8 = load i32* %2, align 4
  call void @_ZNK6soplex8LPColSet3keyEi(%"class.soplex::DataKey"* sret %3, %"class.soplex::LPColSet"* %7, i32 %8)
  call void @_ZN6soplex8SPxColIdC1ERKNS_7DataKeyE(%"class.soplex::SPxColId"* %agg.result, %"class.soplex::DataKey"* dereferenceable(4) %3)
  ret void
}

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN6soplex5SPxIdC2ERKNS_8SPxColIdE(%"class.soplex::SPxId"* %this, %"class.soplex::SPxColId"* dereferenceable(4) %cid) unnamed_addr #2 align 2 {
  %1 = alloca %"class.soplex::SPxId"*, align 8
  %2 = alloca %"class.soplex::SPxColId"*, align 8
  store %"class.soplex::SPxId"* %this, %"class.soplex::SPxId"** %1, align 8
  store %"class.soplex::SPxColId"* %cid, %"class.soplex::SPxColId"** %2, align 8
  %3 = load %"class.soplex::SPxId"** %1
  %4 = bitcast %"class.soplex::SPxId"* %3 to %"class.soplex::DataKey"*
  %5 = load %"class.soplex::SPxColId"** %2, align 8
  %6 = bitcast %"class.soplex::SPxColId"* %5 to %"class.soplex::DataKey"*
  %7 = bitcast %"class.soplex::DataKey"* %6 to i32*
  %8 = load i32* %7, align 4
  %9 = ashr i32 %8, 8
  call void @_ZN6soplex7DataKeyC2Eii(%"class.soplex::DataKey"* %4, i32 1, i32 %9)
  ret void
}

; Function Attrs: uwtable
define linkonce_odr void @_ZNK6soplex5SPxLP3rIdEi(%"class.soplex::SPxRowId"* noalias sret %agg.result, %"class.soplex::SPxLP"* %this, i32 %n) #3 align 2 {
  %1 = alloca %"class.soplex::SPxLP"*, align 8
  %2 = alloca i32, align 4
  %3 = alloca %"class.soplex::DataKey", align 4
  store %"class.soplex::SPxLP"* %this, %"class.soplex::SPxLP"** %1, align 8
  store i32 %n, i32* %2, align 4
  %4 = load %"class.soplex::SPxLP"** %1
  %5 = bitcast %"class.soplex::SPxLP"* %4 to i8*
  %6 = getelementptr inbounds i8* %5, i64 8
  %7 = bitcast i8* %6 to %"class.soplex::LPRowSet"*
  %8 = load i32* %2, align 4
  call void @_ZNK6soplex8LPRowSet3keyEi(%"class.soplex::DataKey"* sret %3, %"class.soplex::LPRowSet"* %7, i32 %8)
  call void @_ZN6soplex8SPxRowIdC1ERKNS_7DataKeyE(%"class.soplex::SPxRowId"* %agg.result, %"class.soplex::DataKey"* dereferenceable(4) %3)
  ret void
}

; Function Attrs: uwtable
define linkonce_odr void @_ZN6soplex5SPxIdC2ERKNS_8SPxRowIdE(%"class.soplex::SPxId"* %this, %"class.soplex::SPxRowId"* dereferenceable(4) %rid) unnamed_addr #3 align 2 {
  %1 = alloca %"class.soplex::SPxId"*, align 8
  %2 = alloca %"class.soplex::SPxRowId"*, align 8
  store %"class.soplex::SPxId"* %this, %"class.soplex::SPxId"** %1, align 8
  store %"class.soplex::SPxRowId"* %rid, %"class.soplex::SPxRowId"** %2, align 8
  %3 = load %"class.soplex::SPxId"** %1
  %4 = bitcast %"class.soplex::SPxId"* %3 to %"class.soplex::DataKey"*
  %5 = load %"class.soplex::SPxRowId"** %2, align 8
  %6 = bitcast %"class.soplex::SPxRowId"* %5 to %"class.soplex::DataKey"*
  %7 = bitcast %"class.soplex::DataKey"* %6 to i32*
  %8 = load i32* %7, align 4
  %9 = ashr i32 %8, 8
  call void @_ZN6soplex7DataKeyC2Eii(%"class.soplex::DataKey"* %4, i32 -1, i32 %9)
  ret void
}

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN6soplex7DataKeyC2Eii(%"class.soplex::DataKey"* %this, i32 %p_info, i32 %p_idx) unnamed_addr #2 align 2 {
  %1 = alloca %"class.soplex::DataKey"*, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store %"class.soplex::DataKey"* %this, %"class.soplex::DataKey"** %1, align 8
  store i32 %p_info, i32* %2, align 4
  store i32 %p_idx, i32* %3, align 4
  %4 = load %"class.soplex::DataKey"** %1
  %5 = bitcast %"class.soplex::DataKey"* %4 to i32*
  %6 = load i32* %2, align 4
  %7 = load i32* %5, align 4
  %8 = and i32 %6, 255
  %9 = and i32 %7, -256
  %10 = or i32 %9, %8
  store i32 %10, i32* %5, align 4
  %11 = bitcast %"class.soplex::DataKey"* %4 to i32*
  %12 = load i32* %3, align 4
  %13 = load i32* %11, align 4
  %14 = and i32 %12, 16777215
  %15 = shl i32 %14, 8
  %16 = and i32 %13, 255
  %17 = or i32 %16, %15
  store i32 %17, i32* %11, align 4
  ret void
}

; Function Attrs: uwtable
define linkonce_odr void @_ZNK6soplex8LPRowSet3keyEi(%"class.soplex::DataKey"* noalias sret %agg.result, %"class.soplex::LPRowSet"* %this, i32 %i) #3 align 2 {
  %1 = alloca %"class.soplex::LPRowSet"*, align 8
  %2 = alloca i32, align 4
  store %"class.soplex::LPRowSet"* %this, %"class.soplex::LPRowSet"** %1, align 8
  store i32 %i, i32* %2, align 4
  %3 = load %"class.soplex::LPRowSet"** %1
  %4 = bitcast %"class.soplex::LPRowSet"* %3 to %"class.soplex::SVSet"*
  %5 = load i32* %2, align 4
  call void @_ZNK6soplex5SVSet3keyEi(%"class.soplex::DataKey"* sret %agg.result, %"class.soplex::SVSet"* %4, i32 %5)
  ret void
}

declare void @_ZN6soplex8SPxRowIdC1ERKNS_7DataKeyE(%"class.soplex::SPxRowId"*, %"class.soplex::DataKey"* dereferenceable(4)) #0

; Function Attrs: uwtable
define linkonce_odr void @_ZNK6soplex5SVSet3keyEi(%"class.soplex::DataKey"* noalias sret %agg.result, %"class.soplex::SVSet"* %this, i32 %n) #3 align 2 {
  %1 = alloca %"class.soplex::SVSet"*, align 8
  %2 = alloca i32, align 4
  store %"class.soplex::SVSet"* %this, %"class.soplex::SVSet"** %1, align 8
  store i32 %n, i32* %2, align 4
  %3 = load %"class.soplex::SVSet"** %1
  %4 = getelementptr inbounds %"class.soplex::SVSet"* %3, i32 0, i32 1
  %5 = load i32* %2, align 4
  call void @_ZNK6soplex7DataSetINS_5SVSet5DLPSVEE3keyEi(%"class.soplex::DataKey"* sret %agg.result, %"class.soplex::DataSet"* %4, i32 %5)
  ret void
}

; Function Attrs: uwtable
define linkonce_odr void @_ZNK6soplex7DataSetINS_5SVSet5DLPSVEE3keyEi(%"class.soplex::DataKey"* noalias sret %agg.result, %"class.soplex::DataSet"* %this, i32 %n) #3 align 2 {
  %1 = alloca %"class.soplex::DataSet"*, align 8
  %2 = alloca i32, align 4
  store %"class.soplex::DataSet"* %this, %"class.soplex::DataSet"** %1, align 8
  store i32 %n, i32* %2, align 4
  %3 = load %"class.soplex::DataSet"** %1
  %4 = load i32* %2, align 4
  %5 = icmp sge i32 %4, 0
  br i1 %5, label %6, label %11

; <label>:6                                       ; preds = %0
  %7 = load i32* %2, align 4
  %8 = call i32 @_ZNK6soplex7DataSetINS_5SVSet5DLPSVEE3numEv(%"class.soplex::DataSet"* %3)
  %9 = icmp slt i32 %7, %8
  br i1 %9, label %10, label %11

; <label>:10                                      ; preds = %6
  br label %13

; <label>:11                                      ; preds = %6, %0
  call void @__assert_fail(i8* getelementptr inbounds ([20 x i8]* @.str40, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8]* @.str38, i32 0, i32 0), i32 386, i8* getelementptr inbounds ([100 x i8]* @__PRETTY_FUNCTION__._ZNK6soplex7DataSetINS_5SVSet5DLPSVEE3keyEi, i32 0, i32 0)) #10
  unreachable
                                                  ; No predecessors!
  br label %13

; <label>:13                                      ; preds = %12, %10
  %14 = load i32* %2, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds %"class.soplex::DataSet"* %3, i32 0, i32 1
  %17 = load %"class.soplex::DataKey"** %16, align 8
  %18 = getelementptr inbounds %"class.soplex::DataKey"* %17, i64 %15
  call void @_ZN6soplex7DataKeyC2ERKS0_(%"class.soplex::DataKey"* %agg.result, %"class.soplex::DataKey"* dereferenceable(4) %18)
  ret void
}

; Function Attrs: nounwind uwtable
define linkonce_odr i32 @_ZNK6soplex7DataSetINS_5SVSet5DLPSVEE3numEv(%"class.soplex::DataSet"* %this) #2 align 2 {
  %1 = alloca %"class.soplex::DataSet"*, align 8
  store %"class.soplex::DataSet"* %this, %"class.soplex::DataSet"** %1, align 8
  %2 = load %"class.soplex::DataSet"** %1
  %3 = getelementptr inbounds %"class.soplex::DataSet"* %2, i32 0, i32 4
  %4 = load i32* %3, align 4
  ret i32 %4
}

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN6soplex7DataKeyC2ERKS0_(%"class.soplex::DataKey"* %this, %"class.soplex::DataKey"* dereferenceable(4) %old) unnamed_addr #2 align 2 {
  %1 = alloca %"class.soplex::DataKey"*, align 8
  %2 = alloca %"class.soplex::DataKey"*, align 8
  store %"class.soplex::DataKey"* %this, %"class.soplex::DataKey"** %1, align 8
  store %"class.soplex::DataKey"* %old, %"class.soplex::DataKey"** %2, align 8
  %3 = load %"class.soplex::DataKey"** %1
  %4 = bitcast %"class.soplex::DataKey"* %3 to i32*
  %5 = load %"class.soplex::DataKey"** %2, align 8
  %6 = bitcast %"class.soplex::DataKey"* %5 to i32*
  %7 = load i32* %6, align 4
  %8 = shl i32 %7, 24
  %9 = ashr i32 %8, 24
  %10 = load i32* %4, align 4
  %11 = and i32 %9, 255
  %12 = and i32 %10, -256
  %13 = or i32 %12, %11
  store i32 %13, i32* %4, align 4
  %14 = bitcast %"class.soplex::DataKey"* %3 to i32*
  %15 = load %"class.soplex::DataKey"** %2, align 8
  %16 = bitcast %"class.soplex::DataKey"* %15 to i32*
  %17 = load i32* %16, align 4
  %18 = ashr i32 %17, 8
  %19 = load i32* %14, align 4
  %20 = and i32 %18, 16777215
  %21 = shl i32 %20, 8
  %22 = and i32 %19, 255
  %23 = or i32 %22, %21
  store i32 %23, i32* %14, align 4
  ret void
}

; Function Attrs: uwtable
define linkonce_odr void @_ZNK6soplex8LPColSet3keyEi(%"class.soplex::DataKey"* noalias sret %agg.result, %"class.soplex::LPColSet"* %this, i32 %i) #3 align 2 {
  %1 = alloca %"class.soplex::LPColSet"*, align 8
  %2 = alloca i32, align 4
  store %"class.soplex::LPColSet"* %this, %"class.soplex::LPColSet"** %1, align 8
  store i32 %i, i32* %2, align 4
  %3 = load %"class.soplex::LPColSet"** %1
  %4 = bitcast %"class.soplex::LPColSet"* %3 to %"class.soplex::SVSet"*
  %5 = load i32* %2, align 4
  call void @_ZNK6soplex5SVSet3keyEi(%"class.soplex::DataKey"* sret %agg.result, %"class.soplex::SVSet"* %4, i32 %5)
  ret void
}

declare void @_ZN6soplex8SPxColIdC1ERKNS_7DataKeyE(%"class.soplex::SPxColId"*, %"class.soplex::DataKey"* dereferenceable(4)) #0

; Function Attrs: nounwind uwtable
define linkonce_odr dereferenceable(4) %"class.soplex::DataKey"* @_ZN6soplex7DataKeyaSERKS0_(%"class.soplex::DataKey"* %this, %"class.soplex::DataKey"* dereferenceable(4) %rhs) #2 align 2 {
  %1 = alloca %"class.soplex::DataKey"*, align 8
  %2 = alloca %"class.soplex::DataKey"*, align 8
  store %"class.soplex::DataKey"* %this, %"class.soplex::DataKey"** %1, align 8
  store %"class.soplex::DataKey"* %rhs, %"class.soplex::DataKey"** %2, align 8
  %3 = load %"class.soplex::DataKey"** %1
  %4 = load %"class.soplex::DataKey"** %2, align 8
  %5 = bitcast %"class.soplex::DataKey"* %4 to i32*
  %6 = load i32* %5, align 4
  %7 = shl i32 %6, 24
  %8 = ashr i32 %7, 24
  %9 = bitcast %"class.soplex::DataKey"* %3 to i32*
  %10 = load i32* %9, align 4
  %11 = and i32 %8, 255
  %12 = and i32 %10, -256
  %13 = or i32 %12, %11
  store i32 %13, i32* %9, align 4
  %14 = load %"class.soplex::DataKey"** %2, align 8
  %15 = bitcast %"class.soplex::DataKey"* %14 to i32*
  %16 = load i32* %15, align 4
  %17 = ashr i32 %16, 8
  %18 = bitcast %"class.soplex::DataKey"* %3 to i32*
  %19 = load i32* %18, align 4
  %20 = and i32 %17, 16777215
  %21 = shl i32 %20, 8
  %22 = and i32 %19, 255
  %23 = or i32 %22, %21
  store i32 %23, i32* %18, align 4
  ret %"class.soplex::DataKey"* %3
}

; Function Attrs: nounwind uwtable
define linkonce_odr dereferenceable(16) %"class.soplex::IdxSet"* @_ZNK6soplex8SSVector7indicesEv(%"class.soplex::SSVector"* %this) #2 align 2 {
  %1 = alloca %"class.soplex::SSVector"*, align 8
  store %"class.soplex::SSVector"* %this, %"class.soplex::SSVector"** %1, align 8
  %2 = load %"class.soplex::SSVector"** %1
  %3 = bitcast %"class.soplex::SSVector"* %2 to i8*
  %4 = getelementptr inbounds i8* %3, i64 32
  %5 = bitcast i8* %4 to %"class.soplex::IdxSet"*
  ret %"class.soplex::IdxSet"* %5
}

declare dereferenceable(16) %"class.soplex::Vector"* @_ZN6soplex6VectoraSERKS0_(%"class.soplex::Vector"*, %"class.soplex::Vector"* dereferenceable(16)) #0

; Function Attrs: uwtable
define linkonce_odr i32 @_ZNK6soplex8LPColSet3numEv(%"class.soplex::LPColSet"* %this) #3 align 2 {
  %1 = alloca %"class.soplex::LPColSet"*, align 8
  store %"class.soplex::LPColSet"* %this, %"class.soplex::LPColSet"** %1, align 8
  %2 = load %"class.soplex::LPColSet"** %1
  %3 = bitcast %"class.soplex::LPColSet"* %2 to %"class.soplex::SVSet"*
  %4 = call i32 @_ZNK6soplex5SVSet3numEv(%"class.soplex::SVSet"* %3)
  ret i32 %4
}

; Function Attrs: nounwind uwtable
define linkonce_odr i32 @_ZNK6soplex5SVSet3numEv(%"class.soplex::SVSet"* %this) #2 align 2 {
  %1 = alloca %"class.soplex::SVSet"*, align 8
  store %"class.soplex::SVSet"* %this, %"class.soplex::SVSet"** %1, align 8
  %2 = load %"class.soplex::SVSet"** %1
  %3 = getelementptr inbounds %"class.soplex::SVSet"* %2, i32 0, i32 1
  %4 = call i32 @_ZNK6soplex7DataSetINS_5SVSet5DLPSVEE3numEv(%"class.soplex::DataSet"* %3)
  ret i32 %4
}

; Function Attrs: nounwind uwtable
define linkonce_odr i32 @_ZNK6soplex8LPRowSet3numEv(%"class.soplex::LPRowSet"* %this) #2 align 2 {
  %1 = alloca %"class.soplex::LPRowSet"*, align 8
  store %"class.soplex::LPRowSet"* %this, %"class.soplex::LPRowSet"** %1, align 8
  %2 = load %"class.soplex::LPRowSet"** %1
  %3 = bitcast %"class.soplex::LPRowSet"* %2 to %"class.soplex::SVSet"*
  %4 = call i32 @_ZNK6soplex5SVSet3numEv(%"class.soplex::SVSet"* %3)
  ret i32 %4
}

; Function Attrs: nounwind uwtable
define linkonce_odr dereferenceable(8) %"class.soplex::SVector"** @_ZNK6soplex9DataArrayIPKNS_7SVectorEEixEi(%"class.soplex::DataArray.1"* %this, i32 %n) #2 align 2 {
  %1 = alloca %"class.soplex::DataArray.1"*, align 8
  %2 = alloca i32, align 4
  store %"class.soplex::DataArray.1"* %this, %"class.soplex::DataArray.1"** %1, align 8
  store i32 %n, i32* %2, align 4
  %3 = load %"class.soplex::DataArray.1"** %1
  %4 = load i32* %2, align 4
  %5 = icmp sge i32 %4, 0
  br i1 %5, label %6, label %7

; <label>:6                                       ; preds = %0
  br label %9

; <label>:7                                       ; preds = %0
  call void @__assert_fail(i8* getelementptr inbounds ([7 x i8]* @.str17, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8]* @.str18, i32 0, i32 0), i32 96, i8* getelementptr inbounds ([105 x i8]* @__PRETTY_FUNCTION__._ZNK6soplex9DataArrayIPKNS_7SVectorEEixEi, i32 0, i32 0)) #10
  unreachable
                                                  ; No predecessors!
  br label %9

; <label>:9                                       ; preds = %8, %6
  %10 = load i32* %2, align 4
  %11 = getelementptr inbounds %"class.soplex::DataArray.1"* %3, i32 0, i32 0
  %12 = load i32* %11, align 4
  %13 = icmp slt i32 %10, %12
  br i1 %13, label %14, label %15

; <label>:14                                      ; preds = %9
  br label %17

; <label>:15                                      ; preds = %9
  call void @__assert_fail(i8* getelementptr inbounds ([12 x i8]* @.str19, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8]* @.str18, i32 0, i32 0), i32 97, i8* getelementptr inbounds ([105 x i8]* @__PRETTY_FUNCTION__._ZNK6soplex9DataArrayIPKNS_7SVectorEEixEi, i32 0, i32 0)) #10
  unreachable
                                                  ; No predecessors!
  br label %17

; <label>:17                                      ; preds = %16, %14
  %18 = load i32* %2, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds %"class.soplex::DataArray.1"* %3, i32 0, i32 2
  %21 = load %"class.soplex::SVector"*** %20, align 8
  %22 = getelementptr inbounds %"class.soplex::SVector"** %21, i64 %19
  ret %"class.soplex::SVector"** %22
}

; Function Attrs: nounwind uwtable
define linkonce_odr i32 @_ZNK6soplex5SPxId4typeEv(%"class.soplex::SPxId"* %this) #2 align 2 {
  %1 = alloca %"class.soplex::SPxId"*, align 8
  store %"class.soplex::SPxId"* %this, %"class.soplex::SPxId"** %1, align 8
  %2 = load %"class.soplex::SPxId"** %1
  %3 = bitcast %"class.soplex::SPxId"* %2 to %"class.soplex::DataKey"*
  %4 = bitcast %"class.soplex::DataKey"* %3 to i32*
  %5 = load i32* %4, align 4
  %6 = shl i32 %5, 24
  %7 = ashr i32 %6, 24
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %9, label %17

; <label>:9                                       ; preds = %0
  %10 = bitcast %"class.soplex::SPxId"* %2 to %"class.soplex::DataKey"*
  %11 = bitcast %"class.soplex::DataKey"* %10 to i32*
  %12 = load i32* %11, align 4
  %13 = shl i32 %12, 24
  %14 = ashr i32 %13, 24
  %15 = icmp slt i32 %14, 0
  %16 = select i1 %15, i32 -1, i32 1
  br label %18

; <label>:17                                      ; preds = %0
  br label %18

; <label>:18                                      ; preds = %17, %9
  %19 = phi i32 [ %16, %9 ], [ 0, %17 ]
  ret i32 %19
}

; Function Attrs: nounwind uwtable
define linkonce_odr dereferenceable(4) %"class.soplex::SPxId"* @_ZN6soplex9DataArrayINS_5SPxIdEEixEi(%"class.soplex::DataArray.0"* %this, i32 %n) #2 align 2 {
  %1 = alloca %"class.soplex::DataArray.0"*, align 8
  %2 = alloca i32, align 4
  store %"class.soplex::DataArray.0"* %this, %"class.soplex::DataArray.0"** %1, align 8
  store i32 %n, i32* %2, align 4
  %3 = load %"class.soplex::DataArray.0"** %1
  %4 = load i32* %2, align 4
  %5 = icmp sge i32 %4, 0
  br i1 %5, label %6, label %7

; <label>:6                                       ; preds = %0
  br label %9

; <label>:7                                       ; preds = %0
  call void @__assert_fail(i8* getelementptr inbounds ([7 x i8]* @.str17, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8]* @.str18, i32 0, i32 0), i32 89, i8* getelementptr inbounds ([73 x i8]* @__PRETTY_FUNCTION__._ZN6soplex9DataArrayINS_5SPxIdEEixEi, i32 0, i32 0)) #10
  unreachable
                                                  ; No predecessors!
  br label %9

; <label>:9                                       ; preds = %8, %6
  %10 = load i32* %2, align 4
  %11 = getelementptr inbounds %"class.soplex::DataArray.0"* %3, i32 0, i32 0
  %12 = load i32* %11, align 4
  %13 = icmp slt i32 %10, %12
  br i1 %13, label %14, label %15

; <label>:14                                      ; preds = %9
  br label %17

; <label>:15                                      ; preds = %9
  call void @__assert_fail(i8* getelementptr inbounds ([12 x i8]* @.str19, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8]* @.str18, i32 0, i32 0), i32 90, i8* getelementptr inbounds ([73 x i8]* @__PRETTY_FUNCTION__._ZN6soplex9DataArrayINS_5SPxIdEEixEi, i32 0, i32 0)) #10
  unreachable
                                                  ; No predecessors!
  br label %17

; <label>:17                                      ; preds = %16, %14
  %18 = load i32* %2, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds %"class.soplex::DataArray.0"* %3, i32 0, i32 2
  %21 = load %"class.soplex::SPxId"** %20, align 8
  %22 = getelementptr inbounds %"class.soplex::SPxId"* %21, i64 %19
  ret %"class.soplex::SPxId"* %22
}

; Function Attrs: nounwind uwtable
define linkonce_odr dereferenceable(64) %"class.soplex::SSVector"* @_ZNK6soplex12UpdateVector5deltaEv(%"class.soplex::UpdateVector"* %this) #2 align 2 {
  %1 = alloca %"class.soplex::UpdateVector"*, align 8
  store %"class.soplex::UpdateVector"* %this, %"class.soplex::UpdateVector"** %1, align 8
  %2 = load %"class.soplex::UpdateVector"** %1
  %3 = getelementptr inbounds %"class.soplex::UpdateVector"* %2, i32 0, i32 2
  ret %"class.soplex::SSVector"* %3
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
