; ModuleID = 'regexec.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.sv = type { i8*, i32, i32 }
%struct.gv = type { %struct.xpvgv*, i32, i32 }
%struct.xpvgv = type { i8*, i64, i64, i64, double, %struct.magic*, %struct.hv*, %struct.gp*, i8*, i64, %struct.hv*, i8 }
%struct.magic = type { %struct.magic*, %struct.mgvtbl*, i16, i8, i8, %struct.sv*, i8*, i32 }
%struct.mgvtbl = type { i32 (%struct.sv*, %struct.magic*)*, i32 (%struct.sv*, %struct.magic*)*, i32 (%struct.sv*, %struct.magic*)*, i32 (%struct.sv*, %struct.magic*)*, i32 (%struct.sv*, %struct.magic*)*, i32 (%struct.sv*, %struct.magic*, %struct.sv*, i8*, i32)*, i32 (%struct.magic*, %struct.clone_params*)* }
%struct.clone_params = type { %struct.av*, i64, %struct.interpreter* }
%struct.av = type { %struct.xpvav*, i32, i32 }
%struct.xpvav = type { i8*, i64, i64, i64, double, %struct.magic*, %struct.hv*, %struct.sv**, %struct.sv*, i8 }
%struct.interpreter = type { i8 }
%struct.gp = type { %struct.sv*, i32, %struct.io*, %struct.cv*, %struct.av*, %struct.hv*, %struct.gv*, %struct.cv*, i32, i32, i32, i8* }
%struct.io = type { %struct.xpvio*, i32, i32 }
%struct.xpvio = type { i8*, i64, i64, i64, double, %struct.magic*, %struct.hv*, %struct._PerlIO**, %struct._PerlIO**, %union.anon, i64, i64, i64, i64, i8*, %struct.gv*, i8*, %struct.gv*, i8*, %struct.gv*, i16, i8, i8 }
%struct._PerlIO = type opaque
%union.anon = type { %struct.__dirstream* }
%struct.__dirstream = type opaque
%struct.cv = type { %struct.xpvcv*, i32, i32 }
%struct.xpvcv = type { i8*, i64, i64, i64, double, %struct.magic*, %struct.hv*, %struct.hv*, %struct.op*, %struct.op*, void (%struct.cv*)*, %union.any, %struct.gv*, i8*, i64, %struct.av*, %struct.cv*, i16, i32 }
%struct.op = type { %struct.op*, %struct.op*, %struct.op* ()*, i64, i16, i16, i8, i8 }
%union.any = type { i8* }
%struct.hv = type { %struct.xpvhv*, i32, i32 }
%struct.xpvhv = type { i8*, i64, i64, i64, double, %struct.magic*, %struct.hv*, i32, %struct.he*, %struct.pmop*, i8* }
%struct.he = type { %struct.he*, %struct.hek*, %struct.sv* }
%struct.hek = type { i32, i32, [1 x i8] }
%struct.pmop = type { %struct.op*, %struct.op*, %struct.op* ()*, i64, i16, i16, i8, i8, %struct.op*, %struct.op*, %struct.op*, %struct.op*, %struct.pmop*, %struct.regexp*, i32, i32, i8, %struct.hv* }
%struct.regexp = type { i32*, i32*, %struct.regnode*, %struct.reg_substr_data*, i8*, %struct.reg_data*, i8*, i32*, i32, i32, i32, i32, i32, i32, i32, i32, [1 x %struct.regnode] }
%struct.regnode = type { i8, i8, i16 }
%struct.reg_substr_data = type { [3 x %struct.reg_substr_datum] }
%struct.reg_substr_datum = type { i32, i32, %struct.sv*, %struct.sv* }
%struct.reg_data = type { i32, i8*, [1 x i8*] }
%struct.cop = type { %struct.op*, %struct.op*, %struct.op* ()*, i64, i16, i16, i8, i8, i8*, %struct.hv*, %struct.gv*, i32, i32, i32, %struct.sv*, %struct.sv* }
%struct.curcur = type { i32, i32, i32, i32, i32, %struct.regnode*, %struct.regnode*, i8*, %struct.curcur* }
%struct.re_cc_state = type { i32, %struct.regnode*, %struct.re_cc_state*, %struct.curcur*, %struct.regexp* }
%struct.xpv = type { i8*, i64, i64 }
%struct.re_scream_pos_data_s = type { i8**, i32* }
%struct.xpvmg = type { i8*, i64, i64, i64, double, %struct.magic*, %struct.hv* }
%struct.xpvbm = type { i8*, i64, i64, i64, double, %struct.magic*, %struct.hv*, i32, i16, i8 }
%struct.regnode_string = type { i8, i8, i16, [1 x i8] }
%struct.re_unwind_branch_t = type { i32, i32, i32, i32, %struct.regnode*, i8*, i32 }
%union.re_unwind_t = type { %struct.re_unwind_branch_t }
%struct.regnode_charclass = type { i8, i8, i16, i32, [32 x i8] }
%struct.regnode_1 = type { i8, i8, i16, i32 }
%struct.xrv = type { %struct.sv* }
%struct.xpviv = type { i8*, i64, i64, i64 }
%struct.xpvnv = type { i8*, i64, i64, i64, double }
%struct.regnode_2 = type { i8, i8, i16, i16, i16 }

@PL_reg_match_utf8 = external global i8
@PL_reg_flags = external global i32
@PL_regeol = external global i8*
@PL_sv_undef = external global %struct.sv
@PL_multiline = external global i32
@PL_screamfirst = external global i32*
@PL_regkind = external constant [0 x i8]
@PL_replgv = external global %struct.gv*
@PL_curcop = external global %struct.cop*
@PL_regcc = external global %struct.curcur*
@.str = private unnamed_addr constant [22 x i8] c"NULL regexp parameter\00", align 1
@.str1 = private unnamed_addr constant [25 x i8] c"corrupted regexp program\00", align 1
@PL_reg_eval_set = external global i32
@PL_reg_maxiter = external global i32
@PL_regbol = external global i8*
@PL_bostr = external global i8*
@PL_reg_sv = external global %struct.sv*
@PL_regtill = external global i8*
@PL_reg_call_cc = external global %struct.re_cc_state*
@PL_reg_ganch = external global i8*
@PL_utf8skip = external constant [0 x i8]
@PL_reginput = external global i8*
@PL_dowarn = external global i8
@PL_fold = external constant [0 x i8]
@PL_fold_locale = external global [0 x i8]
@PL_utf8_alnum = external global %struct.sv*
@.str2 = private unnamed_addr constant [2 x i8] c"a\00", align 1
@PL_utf8_space = external global %struct.sv*
@.str3 = private unnamed_addr constant [2 x i8] c" \00", align 1
@PL_utf8_digit = external global %struct.sv*
@.str4 = private unnamed_addr constant [2 x i8] c"0\00", align 1
@PL_utf8_mark = external global %struct.sv*
@.str5 = private unnamed_addr constant [2 x i8] c"~\00", align 1
@PL_regstartp = external global i32*
@PL_reg_leftiter = external global i32
@PL_reglastparen = external global i32*
@PL_regendp = external global i32*
@PL_stack_sp = external global %struct.sv**
@PL_op = external global %struct.op*
@PL_reg_re = external global %struct.regexp*
@PL_regdata = external global %struct.reg_data*
@PL_comppad = external global %struct.av*
@PL_curpad = external global %struct.sv**
@PL_reg_magic = external global %struct.magic*
@PL_runops = external global i32 ()*
@PL_regprecomp = external global i8*
@PL_regsize = external global i32
@PL_regnpar = external global i32
@PL_regcompp = external global %struct.regexp* (i8*, i8*, %struct.pmop*)*
@PL_savestack_ix = external global i32
@PL_reglastcloseparen = external global i32*
@PL_regfree = external global void (%struct.regexp*)*
@PL_Xpv = external global %struct.xpv*
@PL_reg_start_tmp = external global i8**
@PL_reg_poscache = external global i8*
@PL_reg_poscache_size = external global i64
@.str6 = private unnamed_addr constant [23 x i8] c"%s limit (%d) exceeded\00", align 1
@.str7 = private unnamed_addr constant [40 x i8] c"Complex regular subexpression recursion\00", align 1
@PL_savestack = external global %union.any*
@PL_stderrgv = external global %struct.gv*
@.str8 = private unnamed_addr constant [8 x i8] c"%lx %d\0A\00", align 1
@.str9 = private unnamed_addr constant [25 x i8] c"regexp memory corruption\00", align 1
@.str10 = private unnamed_addr constant [26 x i8] c"corrupted regexp pointers\00", align 1
@.str11 = private unnamed_addr constant [32 x i8] c"regexp unwind memory corruption\00", align 1
@.str12 = private unnamed_addr constant [5 x i8] c"utf8\00", align 1
@.str13 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@PL_reg_oldsaved = external global i8*
@PL_reg_oldsavedlen = external global i64
@PL_reg_oldpos = external global i32
@PL_reg_oldcurpm = external global %struct.pmop*
@PL_curpm = external global %struct.pmop*

; Function Attrs: nounwind uwtable
define i32 @Perl_pregexec(%struct.regexp* %prog, i8* %stringarg, i8* %strend, i8* %strbeg, i32 %minend, %struct.sv* %screamer, i32 %nosave) #0 {
  %1 = alloca %struct.regexp*, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca %struct.sv*, align 8
  %7 = alloca i32, align 4
  store %struct.regexp* %prog, %struct.regexp** %1, align 8
  store i8* %stringarg, i8** %2, align 8
  store i8* %strend, i8** %3, align 8
  store i8* %strbeg, i8** %4, align 8
  store i32 %minend, i32* %5, align 4
  store %struct.sv* %screamer, %struct.sv** %6, align 8
  store i32 %nosave, i32* %7, align 4
  %8 = load %struct.regexp** %1, align 8
  %9 = load i8** %2, align 8
  %10 = load i8** %3, align 8
  %11 = load i8** %4, align 8
  %12 = load i32* %5, align 4
  %13 = load %struct.sv** %6, align 8
  %14 = load i32* %7, align 4
  %15 = icmp ne i32 %14, 0
  %16 = select i1 %15, i32 0, i32 1
  %17 = call i32 @Perl_regexec_flags(%struct.regexp* %8, i8* %9, i8* %10, i8* %11, i32 %12, %struct.sv* %13, i8* null, i32 %16)
  ret i32 %17
}

; Function Attrs: nounwind uwtable
define i32 @Perl_regexec_flags(%struct.regexp* %prog, i8* %stringarg, i8* %strend, i8* %strbeg, i32 %minend, %struct.sv* %sv, i8* %data, i32 %flags) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.regexp*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca %struct.sv*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i32, align 4
  %s = alloca i8*, align 8
  %c = alloca %struct.regnode*, align 8
  %startpos = alloca i8*, align 8
  %minlen = alloca i32, align 4
  %dontbother = alloca i32, align 4
  %end_shift = alloca i32, align 4
  %scream_pos = alloca i32, align 4
  %scream_olds = alloca i8*, align 8
  %oreplsv = alloca %struct.sv*, align 8
  %do_utf8 = alloca i8, align 1
  %mg = alloca %struct.magic*, align 8
  %d = alloca %struct.re_scream_pos_data_s, align 8
  %end = alloca i8*, align 8
  %ch = alloca i8, align 1
  %must = alloca %struct.sv*, align 8
  %back_max = alloca i32, align 4
  %back_min = alloca i32, align 4
  %last = alloca i8*, align 8
  %last1 = alloca i8*, align 8
  %t = alloca i8*, align 8
  %op = alloca i32, align 4
  %last2 = alloca i8*, align 8
  %float_real = alloca %struct.sv*, align 8
  %len = alloca i64, align 8
  %little = alloca i8*, align 8
  %i = alloca i32, align 4
  store %struct.regexp* %prog, %struct.regexp** %2, align 8
  store i8* %stringarg, i8** %3, align 8
  store i8* %strend, i8** %4, align 8
  store i8* %strbeg, i8** %5, align 8
  store i32 %minend, i32* %6, align 4
  store %struct.sv* %sv, %struct.sv** %7, align 8
  store i8* %data, i8** %8, align 8
  store i32 %flags, i32* %9, align 4
  %10 = load i8** %3, align 8
  store i8* %10, i8** %startpos, align 8
  store i32 0, i32* %dontbother, align 4
  store i32 0, i32* %end_shift, align 4
  store i32 -1, i32* %scream_pos, align 4
  %11 = load %struct.gv** @PL_replgv, align 8
  %12 = getelementptr inbounds %struct.gv* %11, i32 0, i32 0
  %13 = load %struct.xpvgv** %12, align 8
  %14 = getelementptr inbounds %struct.xpvgv* %13, i32 0, i32 7
  %15 = load %struct.gp** %14, align 8
  %16 = getelementptr inbounds %struct.gp* %15, i32 0, i32 0
  %17 = load %struct.sv** %16, align 8
  store %struct.sv* %17, %struct.sv** %oreplsv, align 8
  %18 = load %struct.sv** %7, align 8
  %19 = getelementptr inbounds %struct.sv* %18, i32 0, i32 2
  %20 = load i32* %19, align 4
  %21 = and i32 %20, 536870912
  %22 = icmp ne i32 %21, 0
  br i1 %22, label %23, label %31

; <label>:23                                      ; preds = %0
  %24 = load volatile %struct.cop** @PL_curcop, align 8
  %25 = getelementptr inbounds %struct.cop* %24, i32 0, i32 7
  %26 = load i8* %25, align 1
  %27 = zext i8 %26 to i32
  %28 = and i32 %27, 8
  %29 = icmp ne i32 %28, 0
  %30 = xor i1 %29, true
  br label %31

; <label>:31                                      ; preds = %23, %0
  %32 = phi i1 [ false, %0 ], [ %30, %23 ]
  %33 = zext i1 %32 to i32
  %34 = trunc i32 %33 to i8
  store i8 %34, i8* %do_utf8, align 1
  %35 = load i8* %do_utf8, align 1
  %36 = sext i8 %35 to i32
  %37 = icmp ne i32 %36, 0
  br i1 %37, label %38, label %43

; <label>:38                                      ; preds = %31
  %39 = load %struct.regexp** %2, align 8
  %40 = getelementptr inbounds %struct.regexp* %39, i32 0, i32 15
  %41 = load i32* %40, align 4
  %42 = or i32 %41, 268435456
  store i32 %42, i32* %40, align 4
  store i8 1, i8* @PL_reg_match_utf8, align 1
  br label %48

; <label>:43                                      ; preds = %31
  %44 = load %struct.regexp** %2, align 8
  %45 = getelementptr inbounds %struct.regexp* %44, i32 0, i32 15
  %46 = load i32* %45, align 4
  %47 = and i32 %46, -268435457
  store i32 %47, i32* %45, align 4
  store i8 0, i8* @PL_reg_match_utf8, align 1
  br label %48

; <label>:48                                      ; preds = %43, %38
  %49 = phi i32 [ 1, %38 ], [ 0, %43 ]
  store %struct.curcur* null, %struct.curcur** @PL_regcc, align 8
  %50 = load %struct.regexp** %2, align 8
  %51 = call i32 (%struct.regexp*, ...)* bitcast (i32 (...)* @cache_re to i32 (%struct.regexp*, ...)*)(%struct.regexp* %50)
  %52 = load %struct.regexp** %2, align 8
  %53 = icmp eq %struct.regexp* %52, null
  br i1 %53, label %57, label %54

; <label>:54                                      ; preds = %48
  %55 = load i8** %startpos, align 8
  %56 = icmp eq i8* %55, null
  br i1 %56, label %57, label %58

; <label>:57                                      ; preds = %54, %48
  call void (i8*, ...)* @Perl_croak(i8* getelementptr inbounds ([22 x i8]* @.str, i32 0, i32 0))
  store i32 0, i32* %1
  br label %1534

; <label>:58                                      ; preds = %54
  %59 = load %struct.regexp** %2, align 8
  %60 = getelementptr inbounds %struct.regexp* %59, i32 0, i32 10
  %61 = load i32* %60, align 4
  store i32 %61, i32* %minlen, align 4
  %62 = load i8** %4, align 8
  %63 = load i8** %startpos, align 8
  %64 = ptrtoint i8* %62 to i64
  %65 = ptrtoint i8* %63 to i64
  %66 = sub i64 %64, %65
  %67 = load i32* %minlen, align 4
  %68 = sext i32 %67 to i64
  %69 = icmp slt i64 %66, %68
  br i1 %69, label %70, label %71

; <label>:70                                      ; preds = %58
  br label %1529

; <label>:71                                      ; preds = %58
  %72 = load %struct.regexp** %2, align 8
  %73 = getelementptr inbounds %struct.regexp* %72, i32 0, i32 16
  %74 = getelementptr inbounds [1 x %struct.regnode]* %73, i32 0, i32 0
  %75 = bitcast %struct.regnode* %74 to i8*
  %76 = load i8* %75, align 1
  %77 = zext i8 %76 to i32
  %78 = icmp ne i32 %77, 156
  br i1 %78, label %79, label %80

; <label>:79                                      ; preds = %71
  call void (i8*, ...)* @Perl_croak(i8* getelementptr inbounds ([25 x i8]* @.str1, i32 0, i32 0))
  br label %80

; <label>:80                                      ; preds = %79, %71
  store i32 0, i32* @PL_reg_flags, align 4
  store i32 0, i32* @PL_reg_eval_set, align 4
  store i32 0, i32* @PL_reg_maxiter, align 4
  %81 = load %struct.regexp** %2, align 8
  %82 = getelementptr inbounds %struct.regexp* %81, i32 0, i32 15
  %83 = load i32* %82, align 4
  %84 = and i32 %83, 65536
  %85 = icmp ne i32 %84, 0
  br i1 %85, label %86, label %89

; <label>:86                                      ; preds = %80
  %87 = load i32* @PL_reg_flags, align 4
  %88 = or i32 %87, 8
  store i32 %88, i32* @PL_reg_flags, align 4
  br label %89

; <label>:89                                      ; preds = %86, %80
  %90 = load i8** %startpos, align 8
  store i8* %90, i8** @PL_regbol, align 8
  %91 = load i8** %5, align 8
  store i8* %91, i8** @PL_bostr, align 8
  %92 = load %struct.sv** %7, align 8
  store %struct.sv* %92, %struct.sv** @PL_reg_sv, align 8
  %93 = load i8** %4, align 8
  store i8* %93, i8** @PL_regeol, align 8
  %94 = load i8** %startpos, align 8
  %95 = load i32* %6, align 4
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds i8* %94, i64 %96
  store i8* %97, i8** @PL_regtill, align 8
  store %struct.re_cc_state* null, %struct.re_cc_state** @PL_reg_call_cc, align 8
  %98 = load i8** %startpos, align 8
  store i8* %98, i8** %s, align 8
  %99 = load %struct.regexp** %2, align 8
  %100 = getelementptr inbounds %struct.regexp* %99, i32 0, i32 15
  %101 = load i32* %100, align 4
  %102 = and i32 %101, 128
  %103 = icmp ne i32 %102, 0
  br i1 %103, label %104, label %160

; <label>:104                                     ; preds = %89
  %105 = load i32* %9, align 4
  %106 = and i32 %105, 8
  %107 = icmp ne i32 %106, 0
  br i1 %107, label %108, label %110

; <label>:108                                     ; preds = %104
  %109 = load i8** %startpos, align 8
  store i8* %109, i8** @PL_reg_ganch, align 8
  br label %159

; <label>:110                                     ; preds = %104
  %111 = load %struct.sv** %7, align 8
  %112 = icmp ne %struct.sv* %111, null
  br i1 %112, label %113, label %156

; <label>:113                                     ; preds = %110
  %114 = load %struct.sv** %7, align 8
  %115 = getelementptr inbounds %struct.sv* %114, i32 0, i32 2
  %116 = load i32* %115, align 4
  %117 = and i32 %116, 255
  %118 = icmp uge i32 %117, 7
  br i1 %118, label %119, label %156

; <label>:119                                     ; preds = %113
  %120 = load %struct.sv** %7, align 8
  %121 = getelementptr inbounds %struct.sv* %120, i32 0, i32 0
  %122 = load i8** %121, align 8
  %123 = bitcast i8* %122 to %struct.xpvmg*
  %124 = getelementptr inbounds %struct.xpvmg* %123, i32 0, i32 5
  %125 = load %struct.magic** %124, align 8
  %126 = icmp ne %struct.magic* %125, null
  br i1 %126, label %127, label %156

; <label>:127                                     ; preds = %119
  %128 = load %struct.sv** %7, align 8
  %129 = call %struct.magic* @Perl_mg_find(%struct.sv* %128, i32 103)
  store %struct.magic* %129, %struct.magic** %mg, align 8
  %130 = icmp ne %struct.magic* %129, null
  br i1 %130, label %131, label %156

; <label>:131                                     ; preds = %127
  %132 = load %struct.magic** %mg, align 8
  %133 = getelementptr inbounds %struct.magic* %132, i32 0, i32 7
  %134 = load i32* %133, align 4
  %135 = icmp sge i32 %134, 0
  br i1 %135, label %136, label %156

; <label>:136                                     ; preds = %131
  %137 = load i8** %5, align 8
  %138 = load %struct.magic** %mg, align 8
  %139 = getelementptr inbounds %struct.magic* %138, i32 0, i32 7
  %140 = load i32* %139, align 4
  %141 = sext i32 %140 to i64
  %142 = getelementptr inbounds i8* %137, i64 %141
  store i8* %142, i8** @PL_reg_ganch, align 8
  %143 = load %struct.regexp** %2, align 8
  %144 = getelementptr inbounds %struct.regexp* %143, i32 0, i32 15
  %145 = load i32* %144, align 4
  %146 = and i32 %145, 8
  %147 = icmp ne i32 %146, 0
  br i1 %147, label %148, label %155

; <label>:148                                     ; preds = %136
  %149 = load i8** %s, align 8
  %150 = load i8** @PL_reg_ganch, align 8
  %151 = icmp ugt i8* %149, %150
  br i1 %151, label %152, label %153

; <label>:152                                     ; preds = %148
  br label %1529

; <label>:153                                     ; preds = %148
  %154 = load i8** @PL_reg_ganch, align 8
  store i8* %154, i8** %s, align 8
  br label %155

; <label>:155                                     ; preds = %153, %136
  br label %158

; <label>:156                                     ; preds = %131, %127, %119, %113, %110
  %157 = load i8** %5, align 8
  store i8* %157, i8** @PL_reg_ganch, align 8
  br label %158

; <label>:158                                     ; preds = %156, %155
  br label %159

; <label>:159                                     ; preds = %158, %108
  br label %160

; <label>:160                                     ; preds = %159, %89
  %161 = load i32* %9, align 4
  %162 = and i32 %161, 2
  %163 = icmp ne i32 %162, 0
  br i1 %163, label %195, label %164

; <label>:164                                     ; preds = %160
  %165 = load %struct.regexp** %2, align 8
  %166 = getelementptr inbounds %struct.regexp* %165, i32 0, i32 3
  %167 = load %struct.reg_substr_data** %166, align 8
  %168 = getelementptr inbounds %struct.reg_substr_data* %167, i32 0, i32 0
  %169 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %168, i32 0, i64 2
  %170 = getelementptr inbounds %struct.reg_substr_datum* %169, i32 0, i32 2
  %171 = load %struct.sv** %170, align 8
  %172 = icmp ne %struct.sv* %171, null
  br i1 %172, label %182, label %173

; <label>:173                                     ; preds = %164
  %174 = load %struct.regexp** %2, align 8
  %175 = getelementptr inbounds %struct.regexp* %174, i32 0, i32 3
  %176 = load %struct.reg_substr_data** %175, align 8
  %177 = getelementptr inbounds %struct.reg_substr_data* %176, i32 0, i32 0
  %178 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %177, i32 0, i64 2
  %179 = getelementptr inbounds %struct.reg_substr_datum* %178, i32 0, i32 3
  %180 = load %struct.sv** %179, align 8
  %181 = icmp ne %struct.sv* %180, null
  br i1 %181, label %182, label %195

; <label>:182                                     ; preds = %173, %164
  %183 = getelementptr inbounds %struct.re_scream_pos_data_s* %d, i32 0, i32 0
  store i8** %scream_olds, i8*** %183, align 8
  %184 = getelementptr inbounds %struct.re_scream_pos_data_s* %d, i32 0, i32 1
  store i32* %scream_pos, i32** %184, align 8
  %185 = load %struct.regexp** %2, align 8
  %186 = load %struct.sv** %7, align 8
  %187 = load i8** %s, align 8
  %188 = load i8** %4, align 8
  %189 = load i32* %9, align 4
  %190 = call i8* @Perl_re_intuit_start(%struct.regexp* %185, %struct.sv* %186, i8* %187, i8* %188, i32 %189, %struct.re_scream_pos_data_s* %d)
  store i8* %190, i8** %s, align 8
  %191 = load i8** %s, align 8
  %192 = icmp ne i8* %191, null
  br i1 %192, label %194, label %193

; <label>:193                                     ; preds = %182
  br label %1529

; <label>:194                                     ; preds = %182
  br label %195

; <label>:195                                     ; preds = %194, %173, %160
  %196 = load %struct.regexp** %2, align 8
  %197 = getelementptr inbounds %struct.regexp* %196, i32 0, i32 15
  %198 = load i32* %197, align 4
  %199 = and i32 %198, 7
  %200 = icmp ne i32 %199, 0
  br i1 %200, label %201, label %340

; <label>:201                                     ; preds = %195
  %202 = load i8** %s, align 8
  %203 = load i8** %startpos, align 8
  %204 = icmp eq i8* %202, %203
  br i1 %204, label %205, label %211

; <label>:205                                     ; preds = %201
  %206 = load %struct.regexp** %2, align 8
  %207 = load i8** %startpos, align 8
  %208 = call i32 (%struct.regexp*, i8*, ...)* bitcast (i32 (...)* @regtry to i32 (%struct.regexp*, i8*, ...)*)(%struct.regexp* %206, i8* %207)
  %209 = icmp ne i32 %208, 0
  br i1 %209, label %210, label %211

; <label>:210                                     ; preds = %205
  br label %1429

; <label>:211                                     ; preds = %205, %201
  %212 = load i32* @PL_multiline, align 4
  %213 = icmp ne i32 %212, 0
  br i1 %213, label %226, label %214

; <label>:214                                     ; preds = %211
  %215 = load %struct.regexp** %2, align 8
  %216 = getelementptr inbounds %struct.regexp* %215, i32 0, i32 15
  %217 = load i32* %216, align 4
  %218 = and i32 %217, 32
  %219 = icmp ne i32 %218, 0
  br i1 %219, label %226, label %220

; <label>:220                                     ; preds = %214
  %221 = load %struct.regexp** %2, align 8
  %222 = getelementptr inbounds %struct.regexp* %221, i32 0, i32 15
  %223 = load i32* %222, align 4
  %224 = and i32 %223, 2
  %225 = icmp ne i32 %224, 0
  br i1 %225, label %226, label %338

; <label>:226                                     ; preds = %220, %214, %211
  %227 = load i32* %minlen, align 4
  %228 = icmp ne i32 %227, 0
  br i1 %228, label %229, label %232

; <label>:229                                     ; preds = %226
  %230 = load i32* %minlen, align 4
  %231 = sub nsw i32 %230, 1
  store i32 %231, i32* %dontbother, align 4
  br label %232

; <label>:232                                     ; preds = %229, %226
  %233 = load i8* @PL_reg_match_utf8, align 1
  %234 = sext i8 %233 to i32
  %235 = icmp ne i32 %234, 0
  br i1 %235, label %236, label %244

; <label>:236                                     ; preds = %232
  %237 = load i8** %4, align 8
  %238 = load i32* %dontbother, align 4
  %239 = sub nsw i32 0, %238
  %240 = load i8** %5, align 8
  %241 = call i32 (i8*, i32, i8*, ...)* bitcast (i32 (...)* @reghop3 to i32 (i8*, i32, i8*, ...)*)(i8* %237, i32 %239, i8* %240)
  %242 = sext i32 %241 to i64
  %243 = inttoptr i64 %242 to i8*
  br label %250

; <label>:244                                     ; preds = %232
  %245 = load i8** %4, align 8
  %246 = load i32* %dontbother, align 4
  %247 = sub nsw i32 0, %246
  %248 = sext i32 %247 to i64
  %249 = getelementptr inbounds i8* %245, i64 %248
  br label %250

; <label>:250                                     ; preds = %244, %236
  %251 = phi i8* [ %243, %236 ], [ %249, %244 ]
  %252 = getelementptr inbounds i8* %251, i64 -1
  store i8* %252, i8** %end, align 8
  %253 = load %struct.regexp** %2, align 8
  %254 = getelementptr inbounds %struct.regexp* %253, i32 0, i32 3
  %255 = load %struct.reg_substr_data** %254, align 8
  %256 = getelementptr inbounds %struct.reg_substr_data* %255, i32 0, i32 0
  %257 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %256, i32 0, i64 2
  %258 = getelementptr inbounds %struct.reg_substr_datum* %257, i32 0, i32 2
  %259 = load %struct.sv** %258, align 8
  %260 = icmp ne %struct.sv* %259, null
  br i1 %260, label %270, label %261

; <label>:261                                     ; preds = %250
  %262 = load %struct.regexp** %2, align 8
  %263 = getelementptr inbounds %struct.regexp* %262, i32 0, i32 3
  %264 = load %struct.reg_substr_data** %263, align 8
  %265 = getelementptr inbounds %struct.reg_substr_data* %264, i32 0, i32 0
  %266 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %265, i32 0, i64 2
  %267 = getelementptr inbounds %struct.reg_substr_datum* %266, i32 0, i32 3
  %268 = load %struct.sv** %267, align 8
  %269 = icmp ne %struct.sv* %268, null
  br i1 %269, label %270, label %310

; <label>:270                                     ; preds = %261, %250
  %271 = load i8** %s, align 8
  %272 = load i8** %startpos, align 8
  %273 = icmp eq i8* %271, %272
  br i1 %273, label %274, label %275

; <label>:274                                     ; preds = %270
  br label %283

; <label>:275                                     ; preds = %270
  br label %276

; <label>:276                                     ; preds = %275, %309
  %277 = load %struct.regexp** %2, align 8
  %278 = load i8** %s, align 8
  %279 = call i32 (%struct.regexp*, i8*, ...)* bitcast (i32 (...)* @regtry to i32 (%struct.regexp*, i8*, ...)*)(%struct.regexp* %277, i8* %278)
  %280 = icmp ne i32 %279, 0
  br i1 %280, label %281, label %282

; <label>:281                                     ; preds = %276
  br label %1429

; <label>:282                                     ; preds = %276
  br label %283

; <label>:283                                     ; preds = %282, %274
  %284 = load i8** %s, align 8
  %285 = load i8** %end, align 8
  %286 = icmp uge i8* %284, %285
  br i1 %286, label %287, label %288

; <label>:287                                     ; preds = %283
  br label %1529

; <label>:288                                     ; preds = %283
  %289 = load %struct.regexp** %2, align 8
  %290 = getelementptr inbounds %struct.regexp* %289, i32 0, i32 15
  %291 = load i32* %290, align 4
  %292 = and i32 %291, 3145728
  %293 = icmp ne i32 %292, 0
  br i1 %293, label %294, label %306

; <label>:294                                     ; preds = %288
  %295 = load %struct.regexp** %2, align 8
  %296 = load %struct.sv** %7, align 8
  %297 = load i8** %s, align 8
  %298 = getelementptr inbounds i8* %297, i64 1
  %299 = load i8** %4, align 8
  %300 = load i32* %9, align 4
  %301 = call i8* @Perl_re_intuit_start(%struct.regexp* %295, %struct.sv* %296, i8* %298, i8* %299, i32 %300, %struct.re_scream_pos_data_s* null)
  store i8* %301, i8** %s, align 8
  %302 = load i8** %s, align 8
  %303 = icmp ne i8* %302, null
  br i1 %303, label %305, label %304

; <label>:304                                     ; preds = %294
  br label %1529

; <label>:305                                     ; preds = %294
  br label %309

; <label>:306                                     ; preds = %288
  %307 = load i8** %s, align 8
  %308 = getelementptr inbounds i8* %307, i32 1
  store i8* %308, i8** %s, align 8
  br label %309

; <label>:309                                     ; preds = %306, %305
  br label %276

; <label>:310                                     ; preds = %261
  %311 = load i8** %s, align 8
  %312 = load i8** %startpos, align 8
  %313 = icmp ugt i8* %311, %312
  br i1 %313, label %314, label %317

; <label>:314                                     ; preds = %310
  %315 = load i8** %s, align 8
  %316 = getelementptr inbounds i8* %315, i32 -1
  store i8* %316, i8** %s, align 8
  br label %317

; <label>:317                                     ; preds = %314, %310
  br label %318

; <label>:318                                     ; preds = %335, %317
  %319 = load i8** %s, align 8
  %320 = load i8** %end, align 8
  %321 = icmp ult i8* %319, %320
  br i1 %321, label %322, label %336

; <label>:322                                     ; preds = %318
  %323 = load i8** %s, align 8
  %324 = getelementptr inbounds i8* %323, i32 1
  store i8* %324, i8** %s, align 8
  %325 = load i8* %323, align 1
  %326 = sext i8 %325 to i32
  %327 = icmp eq i32 %326, 10
  br i1 %327, label %328, label %335

; <label>:328                                     ; preds = %322
  %329 = load %struct.regexp** %2, align 8
  %330 = load i8** %s, align 8
  %331 = call i32 (%struct.regexp*, i8*, ...)* bitcast (i32 (...)* @regtry to i32 (%struct.regexp*, i8*, ...)*)(%struct.regexp* %329, i8* %330)
  %332 = icmp ne i32 %331, 0
  br i1 %332, label %333, label %334

; <label>:333                                     ; preds = %328
  br label %1429

; <label>:334                                     ; preds = %328
  br label %335

; <label>:335                                     ; preds = %334, %322
  br label %318

; <label>:336                                     ; preds = %318
  br label %337

; <label>:337                                     ; preds = %336
  br label %338

; <label>:338                                     ; preds = %337, %220
  br label %339

; <label>:339                                     ; preds = %338
  br label %1529

; <label>:340                                     ; preds = %195
  %341 = load %struct.regexp** %2, align 8
  %342 = getelementptr inbounds %struct.regexp* %341, i32 0, i32 15
  %343 = load i32* %342, align 4
  %344 = and i32 %343, 8
  %345 = icmp ne i32 %344, 0
  br i1 %345, label %346, label %353

; <label>:346                                     ; preds = %340
  %347 = load %struct.regexp** %2, align 8
  %348 = load i8** @PL_reg_ganch, align 8
  %349 = call i32 (%struct.regexp*, i8*, ...)* bitcast (i32 (...)* @regtry to i32 (%struct.regexp*, i8*, ...)*)(%struct.regexp* %347, i8* %348)
  %350 = icmp ne i32 %349, 0
  br i1 %350, label %351, label %352

; <label>:351                                     ; preds = %346
  br label %1429

; <label>:352                                     ; preds = %346
  br label %1529

; <label>:353                                     ; preds = %340
  br label %354

; <label>:354                                     ; preds = %353
  %355 = load %struct.regexp** %2, align 8
  %356 = getelementptr inbounds %struct.regexp* %355, i32 0, i32 3
  %357 = load %struct.reg_substr_data** %356, align 8
  %358 = getelementptr inbounds %struct.reg_substr_data* %357, i32 0, i32 0
  %359 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %358, i32 0, i64 0
  %360 = getelementptr inbounds %struct.reg_substr_datum* %359, i32 0, i32 2
  %361 = load %struct.sv** %360, align 8
  %362 = icmp ne %struct.sv* %361, null
  br i1 %362, label %372, label %363

; <label>:363                                     ; preds = %354
  %364 = load %struct.regexp** %2, align 8
  %365 = getelementptr inbounds %struct.regexp* %364, i32 0, i32 3
  %366 = load %struct.reg_substr_data** %365, align 8
  %367 = getelementptr inbounds %struct.reg_substr_data* %366, i32 0, i32 0
  %368 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %367, i32 0, i64 0
  %369 = getelementptr inbounds %struct.reg_substr_datum* %368, i32 0, i32 3
  %370 = load %struct.sv** %369, align 8
  %371 = icmp ne %struct.sv* %370, null
  br i1 %371, label %372, label %549

; <label>:372                                     ; preds = %363, %354
  %373 = load %struct.regexp** %2, align 8
  %374 = getelementptr inbounds %struct.regexp* %373, i32 0, i32 15
  %375 = load i32* %374, align 4
  %376 = and i32 %375, 16
  %377 = icmp ne i32 %376, 0
  br i1 %377, label %378, label %549

; <label>:378                                     ; preds = %372
  %379 = load i8* %do_utf8, align 1
  %380 = sext i8 %379 to i32
  %381 = icmp ne i32 %380, 0
  br i1 %381, label %382, label %391

; <label>:382                                     ; preds = %378
  %383 = load %struct.regexp** %2, align 8
  %384 = getelementptr inbounds %struct.regexp* %383, i32 0, i32 3
  %385 = load %struct.reg_substr_data** %384, align 8
  %386 = getelementptr inbounds %struct.reg_substr_data* %385, i32 0, i32 0
  %387 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %386, i32 0, i64 0
  %388 = getelementptr inbounds %struct.reg_substr_datum* %387, i32 0, i32 3
  %389 = load %struct.sv** %388, align 8
  %390 = icmp ne %struct.sv* %389, null
  br i1 %390, label %412, label %400

; <label>:391                                     ; preds = %378
  %392 = load %struct.regexp** %2, align 8
  %393 = getelementptr inbounds %struct.regexp* %392, i32 0, i32 3
  %394 = load %struct.reg_substr_data** %393, align 8
  %395 = getelementptr inbounds %struct.reg_substr_data* %394, i32 0, i32 0
  %396 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %395, i32 0, i64 0
  %397 = getelementptr inbounds %struct.reg_substr_datum* %396, i32 0, i32 2
  %398 = load %struct.sv** %397, align 8
  %399 = icmp ne %struct.sv* %398, null
  br i1 %399, label %412, label %400

; <label>:400                                     ; preds = %391, %382
  %401 = load i8* %do_utf8, align 1
  %402 = sext i8 %401 to i32
  %403 = icmp ne i32 %402, 0
  br i1 %403, label %404, label %407

; <label>:404                                     ; preds = %400
  %405 = load %struct.regexp** %2, align 8
  %406 = call i32 (%struct.regexp*, ...)* bitcast (i32 (...)* @to_utf8_substr to i32 (%struct.regexp*, ...)*)(%struct.regexp* %405)
  br label %410

; <label>:407                                     ; preds = %400
  %408 = load %struct.regexp** %2, align 8
  %409 = call i32 (%struct.regexp*, ...)* bitcast (i32 (...)* @to_byte_substr to i32 (%struct.regexp*, ...)*)(%struct.regexp* %408)
  br label %410

; <label>:410                                     ; preds = %407, %404
  %411 = phi i32 [ %406, %404 ], [ %409, %407 ]
  br label %412

; <label>:412                                     ; preds = %410, %391, %382
  %413 = load i8* %do_utf8, align 1
  %414 = sext i8 %413 to i32
  %415 = icmp ne i32 %414, 0
  br i1 %415, label %416, label %424

; <label>:416                                     ; preds = %412
  %417 = load %struct.regexp** %2, align 8
  %418 = getelementptr inbounds %struct.regexp* %417, i32 0, i32 3
  %419 = load %struct.reg_substr_data** %418, align 8
  %420 = getelementptr inbounds %struct.reg_substr_data* %419, i32 0, i32 0
  %421 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %420, i32 0, i64 0
  %422 = getelementptr inbounds %struct.reg_substr_datum* %421, i32 0, i32 3
  %423 = load %struct.sv** %422, align 8
  br label %432

; <label>:424                                     ; preds = %412
  %425 = load %struct.regexp** %2, align 8
  %426 = getelementptr inbounds %struct.regexp* %425, i32 0, i32 3
  %427 = load %struct.reg_substr_data** %426, align 8
  %428 = getelementptr inbounds %struct.reg_substr_data* %427, i32 0, i32 0
  %429 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %428, i32 0, i64 0
  %430 = getelementptr inbounds %struct.reg_substr_datum* %429, i32 0, i32 2
  %431 = load %struct.sv** %430, align 8
  br label %432

; <label>:432                                     ; preds = %424, %416
  %433 = phi %struct.sv* [ %423, %416 ], [ %431, %424 ]
  %434 = getelementptr inbounds %struct.sv* %433, i32 0, i32 0
  %435 = load i8** %434, align 8
  %436 = bitcast i8* %435 to %struct.xpv*
  %437 = getelementptr inbounds %struct.xpv* %436, i32 0, i32 0
  %438 = load i8** %437, align 8
  %439 = getelementptr inbounds i8* %438, i64 0
  %440 = load i8* %439, align 1
  store i8 %440, i8* %ch, align 1
  %441 = load i8* %do_utf8, align 1
  %442 = icmp ne i8 %441, 0
  br i1 %442, label %443, label %506

; <label>:443                                     ; preds = %432
  br label %444

; <label>:444                                     ; preds = %495, %443
  %445 = load i8** %s, align 8
  %446 = load i8** %4, align 8
  %447 = icmp ult i8* %445, %446
  br i1 %447, label %448, label %505

; <label>:448                                     ; preds = %444
  %449 = load i8** %s, align 8
  %450 = load i8* %449, align 1
  %451 = sext i8 %450 to i32
  %452 = load i8* %ch, align 1
  %453 = sext i8 %452 to i32
  %454 = icmp eq i32 %451, %453
  br i1 %454, label %455, label %495

; <label>:455                                     ; preds = %448
  %456 = load %struct.regexp** %2, align 8
  %457 = load i8** %s, align 8
  %458 = call i32 (%struct.regexp*, i8*, ...)* bitcast (i32 (...)* @regtry to i32 (%struct.regexp*, i8*, ...)*)(%struct.regexp* %456, i8* %457)
  %459 = icmp ne i32 %458, 0
  br i1 %459, label %460, label %461

; <label>:460                                     ; preds = %455
  br label %1429

; <label>:461                                     ; preds = %455
  %462 = load i8** %s, align 8
  %463 = load i8* %462, align 1
  %464 = zext i8 %463 to i64
  %465 = getelementptr inbounds [0 x i8]* @PL_utf8skip, i32 0, i64 %464
  %466 = load i8* %465, align 1
  %467 = zext i8 %466 to i32
  %468 = load i8** %s, align 8
  %469 = sext i32 %467 to i64
  %470 = getelementptr inbounds i8* %468, i64 %469
  store i8* %470, i8** %s, align 8
  br label %471

; <label>:471                                     ; preds = %484, %461
  %472 = load i8** %s, align 8
  %473 = load i8** %4, align 8
  %474 = icmp ult i8* %472, %473
  br i1 %474, label %475, label %482

; <label>:475                                     ; preds = %471
  %476 = load i8** %s, align 8
  %477 = load i8* %476, align 1
  %478 = sext i8 %477 to i32
  %479 = load i8* %ch, align 1
  %480 = sext i8 %479 to i32
  %481 = icmp eq i32 %478, %480
  br label %482

; <label>:482                                     ; preds = %475, %471
  %483 = phi i1 [ false, %471 ], [ %481, %475 ]
  br i1 %483, label %484, label %494

; <label>:484                                     ; preds = %482
  %485 = load i8** %s, align 8
  %486 = load i8* %485, align 1
  %487 = zext i8 %486 to i64
  %488 = getelementptr inbounds [0 x i8]* @PL_utf8skip, i32 0, i64 %487
  %489 = load i8* %488, align 1
  %490 = zext i8 %489 to i32
  %491 = load i8** %s, align 8
  %492 = sext i32 %490 to i64
  %493 = getelementptr inbounds i8* %491, i64 %492
  store i8* %493, i8** %s, align 8
  br label %471

; <label>:494                                     ; preds = %482
  br label %495

; <label>:495                                     ; preds = %494, %448
  %496 = load i8** %s, align 8
  %497 = load i8* %496, align 1
  %498 = zext i8 %497 to i64
  %499 = getelementptr inbounds [0 x i8]* @PL_utf8skip, i32 0, i64 %498
  %500 = load i8* %499, align 1
  %501 = zext i8 %500 to i32
  %502 = load i8** %s, align 8
  %503 = sext i32 %501 to i64
  %504 = getelementptr inbounds i8* %502, i64 %503
  store i8* %504, i8** %s, align 8
  br label %444

; <label>:505                                     ; preds = %444
  br label %548

; <label>:506                                     ; preds = %432
  br label %507

; <label>:507                                     ; preds = %544, %506
  %508 = load i8** %s, align 8
  %509 = load i8** %4, align 8
  %510 = icmp ult i8* %508, %509
  br i1 %510, label %511, label %547

; <label>:511                                     ; preds = %507
  %512 = load i8** %s, align 8
  %513 = load i8* %512, align 1
  %514 = sext i8 %513 to i32
  %515 = load i8* %ch, align 1
  %516 = sext i8 %515 to i32
  %517 = icmp eq i32 %514, %516
  br i1 %517, label %518, label %544

; <label>:518                                     ; preds = %511
  %519 = load %struct.regexp** %2, align 8
  %520 = load i8** %s, align 8
  %521 = call i32 (%struct.regexp*, i8*, ...)* bitcast (i32 (...)* @regtry to i32 (%struct.regexp*, i8*, ...)*)(%struct.regexp* %519, i8* %520)
  %522 = icmp ne i32 %521, 0
  br i1 %522, label %523, label %524

; <label>:523                                     ; preds = %518
  br label %1429

; <label>:524                                     ; preds = %518
  %525 = load i8** %s, align 8
  %526 = getelementptr inbounds i8* %525, i32 1
  store i8* %526, i8** %s, align 8
  br label %527

; <label>:527                                     ; preds = %540, %524
  %528 = load i8** %s, align 8
  %529 = load i8** %4, align 8
  %530 = icmp ult i8* %528, %529
  br i1 %530, label %531, label %538

; <label>:531                                     ; preds = %527
  %532 = load i8** %s, align 8
  %533 = load i8* %532, align 1
  %534 = sext i8 %533 to i32
  %535 = load i8* %ch, align 1
  %536 = sext i8 %535 to i32
  %537 = icmp eq i32 %534, %536
  br label %538

; <label>:538                                     ; preds = %531, %527
  %539 = phi i1 [ false, %527 ], [ %537, %531 ]
  br i1 %539, label %540, label %543

; <label>:540                                     ; preds = %538
  %541 = load i8** %s, align 8
  %542 = getelementptr inbounds i8* %541, i32 1
  store i8* %542, i8** %s, align 8
  br label %527

; <label>:543                                     ; preds = %538
  br label %544

; <label>:544                                     ; preds = %543, %511
  %545 = load i8** %s, align 8
  %546 = getelementptr inbounds i8* %545, i32 1
  store i8* %546, i8** %s, align 8
  br label %507

; <label>:547                                     ; preds = %507
  br label %548

; <label>:548                                     ; preds = %547, %505
  br label %1428

; <label>:549                                     ; preds = %372, %363
  %550 = load %struct.regexp** %2, align 8
  %551 = getelementptr inbounds %struct.regexp* %550, i32 0, i32 3
  %552 = load %struct.reg_substr_data** %551, align 8
  %553 = getelementptr inbounds %struct.reg_substr_data* %552, i32 0, i32 0
  %554 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %553, i32 0, i64 0
  %555 = getelementptr inbounds %struct.reg_substr_datum* %554, i32 0, i32 2
  %556 = load %struct.sv** %555, align 8
  %557 = icmp ne %struct.sv* %556, null
  br i1 %557, label %600, label %558

; <label>:558                                     ; preds = %549
  %559 = load %struct.regexp** %2, align 8
  %560 = getelementptr inbounds %struct.regexp* %559, i32 0, i32 3
  %561 = load %struct.reg_substr_data** %560, align 8
  %562 = getelementptr inbounds %struct.reg_substr_data* %561, i32 0, i32 0
  %563 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %562, i32 0, i64 0
  %564 = getelementptr inbounds %struct.reg_substr_datum* %563, i32 0, i32 3
  %565 = load %struct.sv** %564, align 8
  %566 = icmp ne %struct.sv* %565, null
  br i1 %566, label %600, label %567

; <label>:567                                     ; preds = %558
  %568 = load %struct.regexp** %2, align 8
  %569 = getelementptr inbounds %struct.regexp* %568, i32 0, i32 3
  %570 = load %struct.reg_substr_data** %569, align 8
  %571 = getelementptr inbounds %struct.reg_substr_data* %570, i32 0, i32 0
  %572 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %571, i32 0, i64 1
  %573 = getelementptr inbounds %struct.reg_substr_datum* %572, i32 0, i32 2
  %574 = load %struct.sv** %573, align 8
  %575 = icmp ne %struct.sv* %574, null
  br i1 %575, label %585, label %576

; <label>:576                                     ; preds = %567
  %577 = load %struct.regexp** %2, align 8
  %578 = getelementptr inbounds %struct.regexp* %577, i32 0, i32 3
  %579 = load %struct.reg_substr_data** %578, align 8
  %580 = getelementptr inbounds %struct.reg_substr_data* %579, i32 0, i32 0
  %581 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %580, i32 0, i64 1
  %582 = getelementptr inbounds %struct.reg_substr_datum* %581, i32 0, i32 3
  %583 = load %struct.sv** %582, align 8
  %584 = icmp ne %struct.sv* %583, null
  br i1 %584, label %585, label %1096

; <label>:585                                     ; preds = %576, %567
  %586 = load %struct.regexp** %2, align 8
  %587 = getelementptr inbounds %struct.regexp* %586, i32 0, i32 3
  %588 = load %struct.reg_substr_data** %587, align 8
  %589 = getelementptr inbounds %struct.reg_substr_data* %588, i32 0, i32 0
  %590 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %589, i32 0, i64 1
  %591 = getelementptr inbounds %struct.reg_substr_datum* %590, i32 0, i32 1
  %592 = load i32* %591, align 4
  %593 = sext i32 %592 to i64
  %594 = load i8** %4, align 8
  %595 = load i8** %s, align 8
  %596 = ptrtoint i8* %594 to i64
  %597 = ptrtoint i8* %595 to i64
  %598 = sub i64 %596, %597
  %599 = icmp slt i64 %593, %598
  br i1 %599, label %600, label %1096

; <label>:600                                     ; preds = %585, %558, %549
  %601 = load %struct.regexp** %2, align 8
  %602 = getelementptr inbounds %struct.regexp* %601, i32 0, i32 3
  %603 = load %struct.reg_substr_data** %602, align 8
  %604 = getelementptr inbounds %struct.reg_substr_data* %603, i32 0, i32 0
  %605 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %604, i32 0, i64 0
  %606 = getelementptr inbounds %struct.reg_substr_datum* %605, i32 0, i32 2
  %607 = load %struct.sv** %606, align 8
  %608 = icmp ne %struct.sv* %607, null
  br i1 %608, label %618, label %609

; <label>:609                                     ; preds = %600
  %610 = load %struct.regexp** %2, align 8
  %611 = getelementptr inbounds %struct.regexp* %610, i32 0, i32 3
  %612 = load %struct.reg_substr_data** %611, align 8
  %613 = getelementptr inbounds %struct.reg_substr_data* %612, i32 0, i32 0
  %614 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %613, i32 0, i64 0
  %615 = getelementptr inbounds %struct.reg_substr_datum* %614, i32 0, i32 3
  %616 = load %struct.sv** %615, align 8
  %617 = icmp ne %struct.sv* %616, null
  br i1 %617, label %618, label %681

; <label>:618                                     ; preds = %609, %600
  %619 = load i8* %do_utf8, align 1
  %620 = sext i8 %619 to i32
  %621 = icmp ne i32 %620, 0
  br i1 %621, label %622, label %631

; <label>:622                                     ; preds = %618
  %623 = load %struct.regexp** %2, align 8
  %624 = getelementptr inbounds %struct.regexp* %623, i32 0, i32 3
  %625 = load %struct.reg_substr_data** %624, align 8
  %626 = getelementptr inbounds %struct.reg_substr_data* %625, i32 0, i32 0
  %627 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %626, i32 0, i64 0
  %628 = getelementptr inbounds %struct.reg_substr_datum* %627, i32 0, i32 3
  %629 = load %struct.sv** %628, align 8
  %630 = icmp ne %struct.sv* %629, null
  br i1 %630, label %652, label %640

; <label>:631                                     ; preds = %618
  %632 = load %struct.regexp** %2, align 8
  %633 = getelementptr inbounds %struct.regexp* %632, i32 0, i32 3
  %634 = load %struct.reg_substr_data** %633, align 8
  %635 = getelementptr inbounds %struct.reg_substr_data* %634, i32 0, i32 0
  %636 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %635, i32 0, i64 0
  %637 = getelementptr inbounds %struct.reg_substr_datum* %636, i32 0, i32 2
  %638 = load %struct.sv** %637, align 8
  %639 = icmp ne %struct.sv* %638, null
  br i1 %639, label %652, label %640

; <label>:640                                     ; preds = %631, %622
  %641 = load i8* %do_utf8, align 1
  %642 = sext i8 %641 to i32
  %643 = icmp ne i32 %642, 0
  br i1 %643, label %644, label %647

; <label>:644                                     ; preds = %640
  %645 = load %struct.regexp** %2, align 8
  %646 = call i32 (%struct.regexp*, ...)* bitcast (i32 (...)* @to_utf8_substr to i32 (%struct.regexp*, ...)*)(%struct.regexp* %645)
  br label %650

; <label>:647                                     ; preds = %640
  %648 = load %struct.regexp** %2, align 8
  %649 = call i32 (%struct.regexp*, ...)* bitcast (i32 (...)* @to_byte_substr to i32 (%struct.regexp*, ...)*)(%struct.regexp* %648)
  br label %650

; <label>:650                                     ; preds = %647, %644
  %651 = phi i32 [ %646, %644 ], [ %649, %647 ]
  br label %652

; <label>:652                                     ; preds = %650, %631, %622
  %653 = load i8* %do_utf8, align 1
  %654 = sext i8 %653 to i32
  %655 = icmp ne i32 %654, 0
  br i1 %655, label %656, label %664

; <label>:656                                     ; preds = %652
  %657 = load %struct.regexp** %2, align 8
  %658 = getelementptr inbounds %struct.regexp* %657, i32 0, i32 3
  %659 = load %struct.reg_substr_data** %658, align 8
  %660 = getelementptr inbounds %struct.reg_substr_data* %659, i32 0, i32 0
  %661 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %660, i32 0, i64 0
  %662 = getelementptr inbounds %struct.reg_substr_datum* %661, i32 0, i32 3
  %663 = load %struct.sv** %662, align 8
  br label %672

; <label>:664                                     ; preds = %652
  %665 = load %struct.regexp** %2, align 8
  %666 = getelementptr inbounds %struct.regexp* %665, i32 0, i32 3
  %667 = load %struct.reg_substr_data** %666, align 8
  %668 = getelementptr inbounds %struct.reg_substr_data* %667, i32 0, i32 0
  %669 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %668, i32 0, i64 0
  %670 = getelementptr inbounds %struct.reg_substr_datum* %669, i32 0, i32 2
  %671 = load %struct.sv** %670, align 8
  br label %672

; <label>:672                                     ; preds = %664, %656
  %673 = phi %struct.sv* [ %663, %656 ], [ %671, %664 ]
  store %struct.sv* %673, %struct.sv** %must, align 8
  %674 = load %struct.regexp** %2, align 8
  %675 = getelementptr inbounds %struct.regexp* %674, i32 0, i32 3
  %676 = load %struct.reg_substr_data** %675, align 8
  %677 = getelementptr inbounds %struct.reg_substr_data* %676, i32 0, i32 0
  %678 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %677, i32 0, i64 0
  %679 = getelementptr inbounds %struct.reg_substr_datum* %678, i32 0, i32 0
  %680 = load i32* %679, align 4
  store i32 %680, i32* %back_min, align 4
  store i32 %680, i32* %back_max, align 4
  br label %751

; <label>:681                                     ; preds = %609
  %682 = load i8* %do_utf8, align 1
  %683 = sext i8 %682 to i32
  %684 = icmp ne i32 %683, 0
  br i1 %684, label %685, label %694

; <label>:685                                     ; preds = %681
  %686 = load %struct.regexp** %2, align 8
  %687 = getelementptr inbounds %struct.regexp* %686, i32 0, i32 3
  %688 = load %struct.reg_substr_data** %687, align 8
  %689 = getelementptr inbounds %struct.reg_substr_data* %688, i32 0, i32 0
  %690 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %689, i32 0, i64 1
  %691 = getelementptr inbounds %struct.reg_substr_datum* %690, i32 0, i32 3
  %692 = load %struct.sv** %691, align 8
  %693 = icmp ne %struct.sv* %692, null
  br i1 %693, label %715, label %703

; <label>:694                                     ; preds = %681
  %695 = load %struct.regexp** %2, align 8
  %696 = getelementptr inbounds %struct.regexp* %695, i32 0, i32 3
  %697 = load %struct.reg_substr_data** %696, align 8
  %698 = getelementptr inbounds %struct.reg_substr_data* %697, i32 0, i32 0
  %699 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %698, i32 0, i64 1
  %700 = getelementptr inbounds %struct.reg_substr_datum* %699, i32 0, i32 2
  %701 = load %struct.sv** %700, align 8
  %702 = icmp ne %struct.sv* %701, null
  br i1 %702, label %715, label %703

; <label>:703                                     ; preds = %694, %685
  %704 = load i8* %do_utf8, align 1
  %705 = sext i8 %704 to i32
  %706 = icmp ne i32 %705, 0
  br i1 %706, label %707, label %710

; <label>:707                                     ; preds = %703
  %708 = load %struct.regexp** %2, align 8
  %709 = call i32 (%struct.regexp*, ...)* bitcast (i32 (...)* @to_utf8_substr to i32 (%struct.regexp*, ...)*)(%struct.regexp* %708)
  br label %713

; <label>:710                                     ; preds = %703
  %711 = load %struct.regexp** %2, align 8
  %712 = call i32 (%struct.regexp*, ...)* bitcast (i32 (...)* @to_byte_substr to i32 (%struct.regexp*, ...)*)(%struct.regexp* %711)
  br label %713

; <label>:713                                     ; preds = %710, %707
  %714 = phi i32 [ %709, %707 ], [ %712, %710 ]
  br label %715

; <label>:715                                     ; preds = %713, %694, %685
  %716 = load i8* %do_utf8, align 1
  %717 = sext i8 %716 to i32
  %718 = icmp ne i32 %717, 0
  br i1 %718, label %719, label %727

; <label>:719                                     ; preds = %715
  %720 = load %struct.regexp** %2, align 8
  %721 = getelementptr inbounds %struct.regexp* %720, i32 0, i32 3
  %722 = load %struct.reg_substr_data** %721, align 8
  %723 = getelementptr inbounds %struct.reg_substr_data* %722, i32 0, i32 0
  %724 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %723, i32 0, i64 1
  %725 = getelementptr inbounds %struct.reg_substr_datum* %724, i32 0, i32 3
  %726 = load %struct.sv** %725, align 8
  br label %735

; <label>:727                                     ; preds = %715
  %728 = load %struct.regexp** %2, align 8
  %729 = getelementptr inbounds %struct.regexp* %728, i32 0, i32 3
  %730 = load %struct.reg_substr_data** %729, align 8
  %731 = getelementptr inbounds %struct.reg_substr_data* %730, i32 0, i32 0
  %732 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %731, i32 0, i64 1
  %733 = getelementptr inbounds %struct.reg_substr_datum* %732, i32 0, i32 2
  %734 = load %struct.sv** %733, align 8
  br label %735

; <label>:735                                     ; preds = %727, %719
  %736 = phi %struct.sv* [ %726, %719 ], [ %734, %727 ]
  store %struct.sv* %736, %struct.sv** %must, align 8
  %737 = load %struct.regexp** %2, align 8
  %738 = getelementptr inbounds %struct.regexp* %737, i32 0, i32 3
  %739 = load %struct.reg_substr_data** %738, align 8
  %740 = getelementptr inbounds %struct.reg_substr_data* %739, i32 0, i32 0
  %741 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %740, i32 0, i64 1
  %742 = getelementptr inbounds %struct.reg_substr_datum* %741, i32 0, i32 1
  %743 = load i32* %742, align 4
  store i32 %743, i32* %back_max, align 4
  %744 = load %struct.regexp** %2, align 8
  %745 = getelementptr inbounds %struct.regexp* %744, i32 0, i32 3
  %746 = load %struct.reg_substr_data** %745, align 8
  %747 = getelementptr inbounds %struct.reg_substr_data* %746, i32 0, i32 0
  %748 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %747, i32 0, i64 1
  %749 = getelementptr inbounds %struct.reg_substr_datum* %748, i32 0, i32 0
  %750 = load i32* %749, align 4
  store i32 %750, i32* %back_min, align 4
  br label %751

; <label>:751                                     ; preds = %735, %672
  %752 = load %struct.sv** %must, align 8
  %753 = icmp eq %struct.sv* %752, @PL_sv_undef
  br i1 %753, label %754, label %755

; <label>:754                                     ; preds = %751
  br label %1529

; <label>:755                                     ; preds = %751
  %756 = load i8* @PL_reg_match_utf8, align 1
  %757 = sext i8 %756 to i32
  %758 = icmp ne i32 %757, 0
  br i1 %758, label %759, label %793

; <label>:759                                     ; preds = %755
  %760 = load i8** %4, align 8
  %761 = load i8* %do_utf8, align 1
  %762 = sext i8 %761 to i32
  %763 = icmp ne i32 %762, 0
  br i1 %763, label %764, label %767

; <label>:764                                     ; preds = %759
  %765 = load %struct.sv** %must, align 8
  %766 = call i64 @Perl_sv_len_utf8(%struct.sv* %765)
  br label %774

; <label>:767                                     ; preds = %759
  %768 = load %struct.sv** %must, align 8
  %769 = getelementptr inbounds %struct.sv* %768, i32 0, i32 0
  %770 = load i8** %769, align 8
  %771 = bitcast i8* %770 to %struct.xpv*
  %772 = getelementptr inbounds %struct.xpv* %771, i32 0, i32 1
  %773 = load i64* %772, align 8
  br label %774

; <label>:774                                     ; preds = %767, %764
  %775 = phi i64 [ %766, %764 ], [ %773, %767 ]
  %776 = load %struct.sv** %must, align 8
  %777 = getelementptr inbounds %struct.sv* %776, i32 0, i32 2
  %778 = load i32* %777, align 4
  %779 = and i32 %778, 1073741824
  %780 = icmp ne i32 %779, 0
  %781 = zext i1 %780 to i32
  %782 = sext i32 %781 to i64
  %783 = sub i64 %775, %782
  %784 = load i32* %back_min, align 4
  %785 = sext i32 %784 to i64
  %786 = add i64 %783, %785
  %787 = trunc i64 %786 to i32
  %788 = sub nsw i32 0, %787
  %789 = load i8** %5, align 8
  %790 = call i32 (i8*, i32, i8*, ...)* bitcast (i32 (...)* @reghop3 to i32 (i8*, i32, i8*, ...)*)(i8* %760, i32 %788, i8* %789)
  %791 = sext i32 %790 to i64
  %792 = inttoptr i64 %791 to i8*
  br label %825

; <label>:793                                     ; preds = %755
  %794 = load i8** %4, align 8
  %795 = load i8* %do_utf8, align 1
  %796 = sext i8 %795 to i32
  %797 = icmp ne i32 %796, 0
  br i1 %797, label %798, label %801

; <label>:798                                     ; preds = %793
  %799 = load %struct.sv** %must, align 8
  %800 = call i64 @Perl_sv_len_utf8(%struct.sv* %799)
  br label %808

; <label>:801                                     ; preds = %793
  %802 = load %struct.sv** %must, align 8
  %803 = getelementptr inbounds %struct.sv* %802, i32 0, i32 0
  %804 = load i8** %803, align 8
  %805 = bitcast i8* %804 to %struct.xpv*
  %806 = getelementptr inbounds %struct.xpv* %805, i32 0, i32 1
  %807 = load i64* %806, align 8
  br label %808

; <label>:808                                     ; preds = %801, %798
  %809 = phi i64 [ %800, %798 ], [ %807, %801 ]
  %810 = load %struct.sv** %must, align 8
  %811 = getelementptr inbounds %struct.sv* %810, i32 0, i32 2
  %812 = load i32* %811, align 4
  %813 = and i32 %812, 1073741824
  %814 = icmp ne i32 %813, 0
  %815 = zext i1 %814 to i32
  %816 = sext i32 %815 to i64
  %817 = sub i64 %809, %816
  %818 = load i32* %back_min, align 4
  %819 = sext i32 %818 to i64
  %820 = add i64 %817, %819
  %821 = trunc i64 %820 to i32
  %822 = sub nsw i32 0, %821
  %823 = sext i32 %822 to i64
  %824 = getelementptr inbounds i8* %794, i64 %823
  br label %825

; <label>:825                                     ; preds = %808, %774
  %826 = phi i8* [ %792, %774 ], [ %824, %808 ]
  store i8* %826, i8** %last, align 8
  %827 = load i8** %s, align 8
  %828 = load i8** @PL_bostr, align 8
  %829 = icmp ugt i8* %827, %828
  br i1 %829, label %830, label %844

; <label>:830                                     ; preds = %825
  %831 = load i8* @PL_reg_match_utf8, align 1
  %832 = sext i8 %831 to i32
  %833 = icmp ne i32 %832, 0
  br i1 %833, label %834, label %839

; <label>:834                                     ; preds = %830
  %835 = load i8** %s, align 8
  %836 = call i32 (i8*, i32, ...)* bitcast (i32 (...)* @reghop to i32 (i8*, i32, ...)*)(i8* %835, i32 -1)
  %837 = sext i32 %836 to i64
  %838 = inttoptr i64 %837 to i8*
  br label %842

; <label>:839                                     ; preds = %830
  %840 = load i8** %s, align 8
  %841 = getelementptr inbounds i8* %840, i64 -1
  br label %842

; <label>:842                                     ; preds = %839, %834
  %843 = phi i8* [ %838, %834 ], [ %841, %839 ]
  store i8* %843, i8** %last1, align 8
  br label %847

; <label>:844                                     ; preds = %825
  %845 = load i8** %s, align 8
  %846 = getelementptr inbounds i8* %845, i64 -1
  store i8* %846, i8** %last1, align 8
  br label %847

; <label>:847                                     ; preds = %844, %842
  store i32 -1, i32* %scream_pos, align 4
  %848 = load i32* %end_shift, align 4
  store i32 %848, i32* %dontbother, align 4
  %849 = load i8* @PL_reg_match_utf8, align 1
  %850 = sext i8 %849 to i32
  %851 = icmp ne i32 %850, 0
  br i1 %851, label %852, label %859

; <label>:852                                     ; preds = %847
  %853 = load i8** %4, align 8
  %854 = load i32* %dontbother, align 4
  %855 = sub nsw i32 0, %854
  %856 = call i32 (i8*, i32, ...)* bitcast (i32 (...)* @reghop to i32 (i8*, i32, ...)*)(i8* %853, i32 %855)
  %857 = sext i32 %856 to i64
  %858 = inttoptr i64 %857 to i8*
  br label %865

; <label>:859                                     ; preds = %847
  %860 = load i8** %4, align 8
  %861 = load i32* %dontbother, align 4
  %862 = sub nsw i32 0, %861
  %863 = sext i32 %862 to i64
  %864 = getelementptr inbounds i8* %860, i64 %863
  br label %865

; <label>:865                                     ; preds = %859, %852
  %866 = phi i8* [ %858, %852 ], [ %864, %859 ]
  store i8* %866, i8** %4, align 8
  br label %867

; <label>:867                                     ; preds = %1094, %865
  %868 = load i8** %s, align 8
  %869 = load i8** %last, align 8
  %870 = icmp ule i8* %868, %869
  br i1 %870, label %871, label %929

; <label>:871                                     ; preds = %867
  %872 = load i32* %9, align 4
  %873 = and i32 %872, 4
  %874 = icmp ne i32 %873, 0
  br i1 %874, label %875, label %902

; <label>:875                                     ; preds = %871
  %876 = load %struct.sv** %7, align 8
  %877 = load %struct.sv** %must, align 8
  %878 = load i8* @PL_reg_match_utf8, align 1
  %879 = sext i8 %878 to i32
  %880 = icmp ne i32 %879, 0
  br i1 %880, label %881, label %888

; <label>:881                                     ; preds = %875
  %882 = load i8** %s, align 8
  %883 = load i32* %back_min, align 4
  %884 = load i8** %4, align 8
  %885 = call i32 (i8*, i32, i8*, ...)* bitcast (i32 (...)* @reghop3 to i32 (i8*, i32, i8*, ...)*)(i8* %882, i32 %883, i8* %884)
  %886 = sext i32 %885 to i64
  %887 = inttoptr i64 %886 to i8*
  br label %893

; <label>:888                                     ; preds = %875
  %889 = load i8** %s, align 8
  %890 = load i32* %back_min, align 4
  %891 = sext i32 %890 to i64
  %892 = getelementptr inbounds i8* %889, i64 %891
  br label %893

; <label>:893                                     ; preds = %888, %881
  %894 = phi i8* [ %887, %881 ], [ %892, %888 ]
  %895 = load i8** %5, align 8
  %896 = ptrtoint i8* %894 to i64
  %897 = ptrtoint i8* %895 to i64
  %898 = sub i64 %896, %897
  %899 = trunc i64 %898 to i32
  %900 = load i32* %end_shift, align 4
  %901 = call i8* @Perl_screaminstr(%struct.sv* %876, %struct.sv* %877, i32 %899, i32 %900, i32* %scream_pos, i32 0)
  store i8* %901, i8** %s, align 8
  br label %926

; <label>:902                                     ; preds = %871
  %903 = load i8* @PL_reg_match_utf8, align 1
  %904 = sext i8 %903 to i32
  %905 = icmp ne i32 %904, 0
  br i1 %905, label %906, label %913

; <label>:906                                     ; preds = %902
  %907 = load i8** %s, align 8
  %908 = load i32* %back_min, align 4
  %909 = load i8** %4, align 8
  %910 = call i32 (i8*, i32, i8*, ...)* bitcast (i32 (...)* @reghop3 to i32 (i8*, i32, i8*, ...)*)(i8* %907, i32 %908, i8* %909)
  %911 = sext i32 %910 to i64
  %912 = inttoptr i64 %911 to i8*
  br label %918

; <label>:913                                     ; preds = %902
  %914 = load i8** %s, align 8
  %915 = load i32* %back_min, align 4
  %916 = sext i32 %915 to i64
  %917 = getelementptr inbounds i8* %914, i64 %916
  br label %918

; <label>:918                                     ; preds = %913, %906
  %919 = phi i8* [ %912, %906 ], [ %917, %913 ]
  %920 = load i8** %4, align 8
  %921 = load %struct.sv** %must, align 8
  %922 = load i32* @PL_multiline, align 4
  %923 = icmp ne i32 %922, 0
  %924 = select i1 %923, i32 1, i32 0
  %925 = call i8* @Perl_fbm_instr(i8* %919, i8* %920, %struct.sv* %921, i32 %924)
  store i8* %925, i8** %s, align 8
  br label %926

; <label>:926                                     ; preds = %918, %893
  %927 = phi i8* [ %901, %893 ], [ %925, %918 ]
  %928 = icmp ne i8* %927, null
  br label %929

; <label>:929                                     ; preds = %926, %867
  %930 = phi i1 [ false, %867 ], [ %928, %926 ]
  br i1 %930, label %931, label %1095

; <label>:931                                     ; preds = %929
  %932 = load i32* %9, align 4
  %933 = and i32 %932, 4
  %934 = icmp ne i32 %933, 0
  br i1 %934, label %935, label %954

; <label>:935                                     ; preds = %931
  %936 = load %struct.regexp** %2, align 8
  %937 = getelementptr inbounds %struct.regexp* %936, i32 0, i32 15
  %938 = load i32* %937, align 4
  %939 = and i32 %938, 262144
  %940 = icmp ne i32 %939, 0
  br i1 %940, label %941, label %954

; <label>:941                                     ; preds = %935
  %942 = load i8** %5, align 8
  %943 = load i8** %s, align 8
  %944 = load %struct.sv** %7, align 8
  %945 = getelementptr inbounds %struct.sv* %944, i32 0, i32 0
  %946 = load i8** %945, align 8
  %947 = bitcast i8* %946 to %struct.xpv*
  %948 = getelementptr inbounds %struct.xpv* %947, i32 0, i32 0
  %949 = load i8** %948, align 8
  %950 = ptrtoint i8* %943 to i64
  %951 = ptrtoint i8* %949 to i64
  %952 = sub i64 %950, %951
  %953 = getelementptr inbounds i8* %942, i64 %952
  store i8* %953, i8** %s, align 8
  br label %954

; <label>:954                                     ; preds = %941, %935, %931
  %955 = load i8* @PL_reg_match_utf8, align 1
  %956 = sext i8 %955 to i32
  %957 = icmp ne i32 %956, 0
  br i1 %957, label %958, label %965

; <label>:958                                     ; preds = %954
  %959 = load i8** %s, align 8
  %960 = load i32* %back_max, align 4
  %961 = sub nsw i32 0, %960
  %962 = call i32 (i8*, i32, ...)* bitcast (i32 (...)* @reghop to i32 (i8*, i32, ...)*)(i8* %959, i32 %961)
  %963 = sext i32 %962 to i64
  %964 = inttoptr i64 %963 to i8*
  br label %971

; <label>:965                                     ; preds = %954
  %966 = load i8** %s, align 8
  %967 = load i32* %back_max, align 4
  %968 = sub nsw i32 0, %967
  %969 = sext i32 %968 to i64
  %970 = getelementptr inbounds i8* %966, i64 %969
  br label %971

; <label>:971                                     ; preds = %965, %958
  %972 = phi i8* [ %964, %958 ], [ %970, %965 ]
  %973 = load i8** %last1, align 8
  %974 = icmp ugt i8* %972, %973
  br i1 %974, label %975, label %1012

; <label>:975                                     ; preds = %971
  %976 = load i8* @PL_reg_match_utf8, align 1
  %977 = sext i8 %976 to i32
  %978 = icmp ne i32 %977, 0
  br i1 %978, label %979, label %986

; <label>:979                                     ; preds = %975
  %980 = load i8** %s, align 8
  %981 = load i32* %back_min, align 4
  %982 = sub nsw i32 0, %981
  %983 = call i32 (i8*, i32, ...)* bitcast (i32 (...)* @reghop to i32 (i8*, i32, ...)*)(i8* %980, i32 %982)
  %984 = sext i32 %983 to i64
  %985 = inttoptr i64 %984 to i8*
  br label %992

; <label>:986                                     ; preds = %975
  %987 = load i8** %s, align 8
  %988 = load i32* %back_min, align 4
  %989 = sub nsw i32 0, %988
  %990 = sext i32 %989 to i64
  %991 = getelementptr inbounds i8* %987, i64 %990
  br label %992

; <label>:992                                     ; preds = %986, %979
  %993 = phi i8* [ %985, %979 ], [ %991, %986 ]
  store i8* %993, i8** %last1, align 8
  %994 = load i8* @PL_reg_match_utf8, align 1
  %995 = sext i8 %994 to i32
  %996 = icmp ne i32 %995, 0
  br i1 %996, label %997, label %1004

; <label>:997                                     ; preds = %992
  %998 = load i8** %s, align 8
  %999 = load i32* %back_max, align 4
  %1000 = sub nsw i32 0, %999
  %1001 = call i32 (i8*, i32, ...)* bitcast (i32 (...)* @reghop to i32 (i8*, i32, ...)*)(i8* %998, i32 %1000)
  %1002 = sext i32 %1001 to i64
  %1003 = inttoptr i64 %1002 to i8*
  br label %1010

; <label>:1004                                    ; preds = %992
  %1005 = load i8** %s, align 8
  %1006 = load i32* %back_max, align 4
  %1007 = sub nsw i32 0, %1006
  %1008 = sext i32 %1007 to i64
  %1009 = getelementptr inbounds i8* %1005, i64 %1008
  br label %1010

; <label>:1010                                    ; preds = %1004, %997
  %1011 = phi i8* [ %1003, %997 ], [ %1009, %1004 ]
  store i8* %1011, i8** %s, align 8
  br label %1054

; <label>:1012                                    ; preds = %971
  %1013 = load i8** %last1, align 8
  %1014 = load i8** @PL_bostr, align 8
  %1015 = icmp uge i8* %1013, %1014
  br i1 %1015, label %1016, label %1030

; <label>:1016                                    ; preds = %1012
  %1017 = load i8* @PL_reg_match_utf8, align 1
  %1018 = sext i8 %1017 to i32
  %1019 = icmp ne i32 %1018, 0
  br i1 %1019, label %1020, label %1025

; <label>:1020                                    ; preds = %1016
  %1021 = load i8** %last1, align 8
  %1022 = call i32 (i8*, i32, ...)* bitcast (i32 (...)* @reghop to i32 (i8*, i32, ...)*)(i8* %1021, i32 1)
  %1023 = sext i32 %1022 to i64
  %1024 = inttoptr i64 %1023 to i8*
  br label %1028

; <label>:1025                                    ; preds = %1016
  %1026 = load i8** %last1, align 8
  %1027 = getelementptr inbounds i8* %1026, i64 1
  br label %1028

; <label>:1028                                    ; preds = %1025, %1020
  %1029 = phi i8* [ %1024, %1020 ], [ %1027, %1025 ]
  br label %1033

; <label>:1030                                    ; preds = %1012
  %1031 = load i8** %last1, align 8
  %1032 = getelementptr inbounds i8* %1031, i64 1
  br label %1033

; <label>:1033                                    ; preds = %1030, %1028
  %1034 = phi i8* [ %1029, %1028 ], [ %1032, %1030 ]
  store i8* %1034, i8** %t, align 8
  %1035 = load i8* @PL_reg_match_utf8, align 1
  %1036 = sext i8 %1035 to i32
  %1037 = icmp ne i32 %1036, 0
  br i1 %1037, label %1038, label %1045

; <label>:1038                                    ; preds = %1033
  %1039 = load i8** %s, align 8
  %1040 = load i32* %back_min, align 4
  %1041 = sub nsw i32 0, %1040
  %1042 = call i32 (i8*, i32, ...)* bitcast (i32 (...)* @reghop to i32 (i8*, i32, ...)*)(i8* %1039, i32 %1041)
  %1043 = sext i32 %1042 to i64
  %1044 = inttoptr i64 %1043 to i8*
  br label %1051

; <label>:1045                                    ; preds = %1033
  %1046 = load i8** %s, align 8
  %1047 = load i32* %back_min, align 4
  %1048 = sub nsw i32 0, %1047
  %1049 = sext i32 %1048 to i64
  %1050 = getelementptr inbounds i8* %1046, i64 %1049
  br label %1051

; <label>:1051                                    ; preds = %1045, %1038
  %1052 = phi i8* [ %1044, %1038 ], [ %1050, %1045 ]
  store i8* %1052, i8** %last1, align 8
  %1053 = load i8** %t, align 8
  store i8* %1053, i8** %s, align 8
  br label %1054

; <label>:1054                                    ; preds = %1051, %1010
  %1055 = load i8* %do_utf8, align 1
  %1056 = icmp ne i8 %1055, 0
  br i1 %1056, label %1057, label %1079

; <label>:1057                                    ; preds = %1054
  br label %1058

; <label>:1058                                    ; preds = %1068, %1057
  %1059 = load i8** %s, align 8
  %1060 = load i8** %last1, align 8
  %1061 = icmp ule i8* %1059, %1060
  br i1 %1061, label %1062, label %1078

; <label>:1062                                    ; preds = %1058
  %1063 = load %struct.regexp** %2, align 8
  %1064 = load i8** %s, align 8
  %1065 = call i32 (%struct.regexp*, i8*, ...)* bitcast (i32 (...)* @regtry to i32 (%struct.regexp*, i8*, ...)*)(%struct.regexp* %1063, i8* %1064)
  %1066 = icmp ne i32 %1065, 0
  br i1 %1066, label %1067, label %1068

; <label>:1067                                    ; preds = %1062
  br label %1429

; <label>:1068                                    ; preds = %1062
  %1069 = load i8** %s, align 8
  %1070 = load i8* %1069, align 1
  %1071 = zext i8 %1070 to i64
  %1072 = getelementptr inbounds [0 x i8]* @PL_utf8skip, i32 0, i64 %1071
  %1073 = load i8* %1072, align 1
  %1074 = zext i8 %1073 to i32
  %1075 = load i8** %s, align 8
  %1076 = sext i32 %1074 to i64
  %1077 = getelementptr inbounds i8* %1075, i64 %1076
  store i8* %1077, i8** %s, align 8
  br label %1058

; <label>:1078                                    ; preds = %1058
  br label %1094

; <label>:1079                                    ; preds = %1054
  br label %1080

; <label>:1080                                    ; preds = %1090, %1079
  %1081 = load i8** %s, align 8
  %1082 = load i8** %last1, align 8
  %1083 = icmp ule i8* %1081, %1082
  br i1 %1083, label %1084, label %1093

; <label>:1084                                    ; preds = %1080
  %1085 = load %struct.regexp** %2, align 8
  %1086 = load i8** %s, align 8
  %1087 = call i32 (%struct.regexp*, i8*, ...)* bitcast (i32 (...)* @regtry to i32 (%struct.regexp*, i8*, ...)*)(%struct.regexp* %1085, i8* %1086)
  %1088 = icmp ne i32 %1087, 0
  br i1 %1088, label %1089, label %1090

; <label>:1089                                    ; preds = %1084
  br label %1429

; <label>:1090                                    ; preds = %1084
  %1091 = load i8** %s, align 8
  %1092 = getelementptr inbounds i8* %1091, i32 1
  store i8* %1092, i8** %s, align 8
  br label %1080

; <label>:1093                                    ; preds = %1080
  br label %1094

; <label>:1094                                    ; preds = %1093, %1078
  br label %867

; <label>:1095                                    ; preds = %929
  br label %1529

; <label>:1096                                    ; preds = %585, %576
  %1097 = load %struct.regexp** %2, align 8
  %1098 = getelementptr inbounds %struct.regexp* %1097, i32 0, i32 2
  %1099 = load %struct.regnode** %1098, align 8
  store %struct.regnode* %1099, %struct.regnode** %c, align 8
  %1100 = icmp ne %struct.regnode* %1099, null
  br i1 %1100, label %1101, label %1152

; <label>:1101                                    ; preds = %1096
  %1102 = load i32* %minlen, align 4
  %1103 = icmp ne i32 %1102, 0
  br i1 %1103, label %1104, label %1142

; <label>:1104                                    ; preds = %1101
  %1105 = load %struct.regexp** %2, align 8
  %1106 = getelementptr inbounds %struct.regexp* %1105, i32 0, i32 2
  %1107 = load %struct.regnode** %1106, align 8
  %1108 = getelementptr inbounds %struct.regnode* %1107, i32 0, i32 1
  %1109 = load i8* %1108, align 1
  %1110 = zext i8 %1109 to i32
  store i32 %1110, i32* %op, align 4
  %1111 = load i32* %op, align 4
  %1112 = sext i32 %1111 to i64
  %1113 = getelementptr inbounds [0 x i8]* @PL_regkind, i32 0, i64 %1112
  %1114 = load i8* %1113, align 1
  %1115 = zext i8 %1114 to i32
  %1116 = icmp ne i32 %1115, 33
  br i1 %1116, label %1117, label %1141

; <label>:1117                                    ; preds = %1104
  %1118 = load i32* %op, align 4
  %1119 = icmp ne i32 %1118, 16
  br i1 %1119, label %1120, label %1141

; <label>:1120                                    ; preds = %1117
  %1121 = load i8* @PL_reg_match_utf8, align 1
  %1122 = sext i8 %1121 to i32
  %1123 = icmp ne i32 %1122, 0
  br i1 %1123, label %1124, label %1132

; <label>:1124                                    ; preds = %1120
  %1125 = load i8** %4, align 8
  %1126 = load i32* %minlen, align 4
  %1127 = sub nsw i32 %1126, 1
  %1128 = sub nsw i32 0, %1127
  %1129 = call i32 (i8*, i32, ...)* bitcast (i32 (...)* @reghop to i32 (i8*, i32, ...)*)(i8* %1125, i32 %1128)
  %1130 = sext i32 %1129 to i64
  %1131 = inttoptr i64 %1130 to i8*
  br label %1139

; <label>:1132                                    ; preds = %1120
  %1133 = load i8** %4, align 8
  %1134 = load i32* %minlen, align 4
  %1135 = sub nsw i32 %1134, 1
  %1136 = sub nsw i32 0, %1135
  %1137 = sext i32 %1136 to i64
  %1138 = getelementptr inbounds i8* %1133, i64 %1137
  br label %1139

; <label>:1139                                    ; preds = %1132, %1124
  %1140 = phi i8* [ %1131, %1124 ], [ %1138, %1132 ]
  store i8* %1140, i8** %4, align 8
  br label %1141

; <label>:1141                                    ; preds = %1139, %1117, %1104
  br label %1142

; <label>:1142                                    ; preds = %1141, %1101
  %1143 = load %struct.regexp** %2, align 8
  %1144 = load %struct.regnode** %c, align 8
  %1145 = load i8** %s, align 8
  %1146 = load i8** %4, align 8
  %1147 = load i8** %startpos, align 8
  %1148 = call i32 (%struct.regexp*, %struct.regnode*, i8*, i8*, i8*, i32, ...)* bitcast (i32 (...)* @find_byclass to i32 (%struct.regexp*, %struct.regnode*, i8*, i8*, i8*, i32, ...)*)(%struct.regexp* %1143, %struct.regnode* %1144, i8* %1145, i8* %1146, i8* %1147, i32 0)
  %1149 = icmp ne i32 %1148, 0
  br i1 %1149, label %1150, label %1151

; <label>:1150                                    ; preds = %1142
  br label %1429

; <label>:1151                                    ; preds = %1142
  br label %1426

; <label>:1152                                    ; preds = %1096
  store i32 0, i32* %dontbother, align 4
  %1153 = load %struct.regexp** %2, align 8
  %1154 = getelementptr inbounds %struct.regexp* %1153, i32 0, i32 3
  %1155 = load %struct.reg_substr_data** %1154, align 8
  %1156 = getelementptr inbounds %struct.reg_substr_data* %1155, i32 0, i32 0
  %1157 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1156, i32 0, i64 1
  %1158 = getelementptr inbounds %struct.reg_substr_datum* %1157, i32 0, i32 2
  %1159 = load %struct.sv** %1158, align 8
  %1160 = icmp ne %struct.sv* %1159, null
  br i1 %1160, label %1170, label %1161

; <label>:1161                                    ; preds = %1152
  %1162 = load %struct.regexp** %2, align 8
  %1163 = getelementptr inbounds %struct.regexp* %1162, i32 0, i32 3
  %1164 = load %struct.reg_substr_data** %1163, align 8
  %1165 = getelementptr inbounds %struct.reg_substr_data* %1164, i32 0, i32 0
  %1166 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1165, i32 0, i64 1
  %1167 = getelementptr inbounds %struct.reg_substr_datum* %1166, i32 0, i32 3
  %1168 = load %struct.sv** %1167, align 8
  %1169 = icmp ne %struct.sv* %1168, null
  br i1 %1169, label %1170, label %1370

; <label>:1170                                    ; preds = %1161, %1152
  %1171 = load i8* %do_utf8, align 1
  %1172 = sext i8 %1171 to i32
  %1173 = icmp ne i32 %1172, 0
  br i1 %1173, label %1174, label %1183

; <label>:1174                                    ; preds = %1170
  %1175 = load %struct.regexp** %2, align 8
  %1176 = getelementptr inbounds %struct.regexp* %1175, i32 0, i32 3
  %1177 = load %struct.reg_substr_data** %1176, align 8
  %1178 = getelementptr inbounds %struct.reg_substr_data* %1177, i32 0, i32 0
  %1179 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1178, i32 0, i64 1
  %1180 = getelementptr inbounds %struct.reg_substr_datum* %1179, i32 0, i32 3
  %1181 = load %struct.sv** %1180, align 8
  %1182 = icmp ne %struct.sv* %1181, null
  br i1 %1182, label %1204, label %1192

; <label>:1183                                    ; preds = %1170
  %1184 = load %struct.regexp** %2, align 8
  %1185 = getelementptr inbounds %struct.regexp* %1184, i32 0, i32 3
  %1186 = load %struct.reg_substr_data** %1185, align 8
  %1187 = getelementptr inbounds %struct.reg_substr_data* %1186, i32 0, i32 0
  %1188 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1187, i32 0, i64 1
  %1189 = getelementptr inbounds %struct.reg_substr_datum* %1188, i32 0, i32 2
  %1190 = load %struct.sv** %1189, align 8
  %1191 = icmp ne %struct.sv* %1190, null
  br i1 %1191, label %1204, label %1192

; <label>:1192                                    ; preds = %1183, %1174
  %1193 = load i8* %do_utf8, align 1
  %1194 = sext i8 %1193 to i32
  %1195 = icmp ne i32 %1194, 0
  br i1 %1195, label %1196, label %1199

; <label>:1196                                    ; preds = %1192
  %1197 = load %struct.regexp** %2, align 8
  %1198 = call i32 (%struct.regexp*, ...)* bitcast (i32 (...)* @to_utf8_substr to i32 (%struct.regexp*, ...)*)(%struct.regexp* %1197)
  br label %1202

; <label>:1199                                    ; preds = %1192
  %1200 = load %struct.regexp** %2, align 8
  %1201 = call i32 (%struct.regexp*, ...)* bitcast (i32 (...)* @to_byte_substr to i32 (%struct.regexp*, ...)*)(%struct.regexp* %1200)
  br label %1202

; <label>:1202                                    ; preds = %1199, %1196
  %1203 = phi i32 [ %1198, %1196 ], [ %1201, %1199 ]
  br label %1204

; <label>:1204                                    ; preds = %1202, %1183, %1174
  %1205 = load i8* %do_utf8, align 1
  %1206 = sext i8 %1205 to i32
  %1207 = icmp ne i32 %1206, 0
  br i1 %1207, label %1208, label %1216

; <label>:1208                                    ; preds = %1204
  %1209 = load %struct.regexp** %2, align 8
  %1210 = getelementptr inbounds %struct.regexp* %1209, i32 0, i32 3
  %1211 = load %struct.reg_substr_data** %1210, align 8
  %1212 = getelementptr inbounds %struct.reg_substr_data* %1211, i32 0, i32 0
  %1213 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1212, i32 0, i64 1
  %1214 = getelementptr inbounds %struct.reg_substr_datum* %1213, i32 0, i32 3
  %1215 = load %struct.sv** %1214, align 8
  br label %1224

; <label>:1216                                    ; preds = %1204
  %1217 = load %struct.regexp** %2, align 8
  %1218 = getelementptr inbounds %struct.regexp* %1217, i32 0, i32 3
  %1219 = load %struct.reg_substr_data** %1218, align 8
  %1220 = getelementptr inbounds %struct.reg_substr_data* %1219, i32 0, i32 0
  %1221 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1220, i32 0, i64 1
  %1222 = getelementptr inbounds %struct.reg_substr_datum* %1221, i32 0, i32 2
  %1223 = load %struct.sv** %1222, align 8
  br label %1224

; <label>:1224                                    ; preds = %1216, %1208
  %1225 = phi %struct.sv* [ %1215, %1208 ], [ %1223, %1216 ]
  store %struct.sv* %1225, %struct.sv** %float_real, align 8
  %1226 = load i32* %9, align 4
  %1227 = and i32 %1226, 4
  %1228 = icmp ne i32 %1227, 0
  br i1 %1228, label %1229, label %1265

; <label>:1229                                    ; preds = %1224
  %1230 = load %struct.sv** %7, align 8
  %1231 = load %struct.sv** %float_real, align 8
  %1232 = load i8** %s, align 8
  %1233 = load i8** %5, align 8
  %1234 = ptrtoint i8* %1232 to i64
  %1235 = ptrtoint i8* %1233 to i64
  %1236 = sub i64 %1234, %1235
  %1237 = trunc i64 %1236 to i32
  %1238 = load i32* %end_shift, align 4
  %1239 = call i8* @Perl_screaminstr(%struct.sv* %1230, %struct.sv* %1231, i32 %1237, i32 %1238, i32* %scream_pos, i32 1)
  store i8* %1239, i8** %last2, align 8
  %1240 = load i8** %last2, align 8
  %1241 = icmp ne i8* %1240, null
  br i1 %1241, label %1244, label %1242

; <label>:1242                                    ; preds = %1229
  %1243 = load i8** %scream_olds, align 8
  store i8* %1243, i8** %last2, align 8
  br label %1264

; <label>:1244                                    ; preds = %1229
  %1245 = load %struct.regexp** %2, align 8
  %1246 = getelementptr inbounds %struct.regexp* %1245, i32 0, i32 15
  %1247 = load i32* %1246, align 4
  %1248 = and i32 %1247, 262144
  %1249 = icmp ne i32 %1248, 0
  br i1 %1249, label %1250, label %1263

; <label>:1250                                    ; preds = %1244
  %1251 = load i8** %5, align 8
  %1252 = load i8** %s, align 8
  %1253 = load %struct.sv** %7, align 8
  %1254 = getelementptr inbounds %struct.sv* %1253, i32 0, i32 0
  %1255 = load i8** %1254, align 8
  %1256 = bitcast i8* %1255 to %struct.xpv*
  %1257 = getelementptr inbounds %struct.xpv* %1256, i32 0, i32 0
  %1258 = load i8** %1257, align 8
  %1259 = ptrtoint i8* %1252 to i64
  %1260 = ptrtoint i8* %1258 to i64
  %1261 = sub i64 %1259, %1260
  %1262 = getelementptr inbounds i8* %1251, i64 %1261
  store i8* %1262, i8** %s, align 8
  br label %1263

; <label>:1263                                    ; preds = %1250, %1244
  br label %1264

; <label>:1264                                    ; preds = %1263, %1242
  br label %1350

; <label>:1265                                    ; preds = %1224
  %1266 = load %struct.sv** %float_real, align 8
  %1267 = getelementptr inbounds %struct.sv* %1266, i32 0, i32 2
  %1268 = load i32* %1267, align 4
  %1269 = and i32 %1268, 262144
  %1270 = icmp eq i32 %1269, 262144
  br i1 %1270, label %1271, label %1284

; <label>:1271                                    ; preds = %1265
  %1272 = load %struct.sv** %float_real, align 8
  %1273 = getelementptr inbounds %struct.sv* %1272, i32 0, i32 0
  %1274 = load i8** %1273, align 8
  %1275 = bitcast i8* %1274 to %struct.xpv*
  %1276 = getelementptr inbounds %struct.xpv* %1275, i32 0, i32 1
  %1277 = load i64* %1276, align 8
  store i64 %1277, i64* %len, align 8
  %1278 = load %struct.sv** %float_real, align 8
  %1279 = getelementptr inbounds %struct.sv* %1278, i32 0, i32 0
  %1280 = load i8** %1279, align 8
  %1281 = bitcast i8* %1280 to %struct.xpv*
  %1282 = getelementptr inbounds %struct.xpv* %1281, i32 0, i32 0
  %1283 = load i8** %1282, align 8
  br label %1287

; <label>:1284                                    ; preds = %1265
  %1285 = load %struct.sv** %float_real, align 8
  %1286 = call i8* @Perl_sv_2pv_flags(%struct.sv* %1285, i64* %len, i32 2)
  br label %1287

; <label>:1287                                    ; preds = %1284, %1271
  %1288 = phi i8* [ %1283, %1271 ], [ %1286, %1284 ]
  store i8* %1288, i8** %little, align 8
  %1289 = load %struct.sv** %float_real, align 8
  %1290 = getelementptr inbounds %struct.sv* %1289, i32 0, i32 2
  %1291 = load i32* %1290, align 4
  %1292 = and i32 %1291, 1073741824
  %1293 = icmp ne i32 %1292, 0
  br i1 %1293, label %1294, label %1334

; <label>:1294                                    ; preds = %1287
  %1295 = load i8** %4, align 8
  %1296 = load i64* %len, align 8
  %1297 = sub i64 0, %1296
  %1298 = getelementptr inbounds i8* %1295, i64 %1297
  %1299 = getelementptr inbounds i8* %1298, i64 1
  %1300 = load i8** %little, align 8
  %1301 = load i64* %len, align 8
  %1302 = sub i64 %1301, 1
  %1303 = call i32 @memcmp(i8* %1299, i8* %1300, i64 %1302)
  %1304 = icmp ne i32 %1303, 0
  br i1 %1304, label %1311, label %1305

; <label>:1305                                    ; preds = %1294
  %1306 = load i8** %4, align 8
  %1307 = load i64* %len, align 8
  %1308 = sub i64 0, %1307
  %1309 = getelementptr inbounds i8* %1306, i64 %1308
  %1310 = getelementptr inbounds i8* %1309, i64 1
  store i8* %1310, i8** %last2, align 8
  br label %1333

; <label>:1311                                    ; preds = %1294
  %1312 = load i32* @PL_multiline, align 4
  %1313 = icmp ne i32 %1312, 0
  br i1 %1313, label %1331, label %1314

; <label>:1314                                    ; preds = %1311
  %1315 = load i8** %4, align 8
  %1316 = load i64* %len, align 8
  %1317 = sub i64 0, %1316
  %1318 = getelementptr inbounds i8* %1315, i64 %1317
  %1319 = load i8** %little, align 8
  %1320 = load i64* %len, align 8
  %1321 = call i32 @memcmp(i8* %1318, i8* %1319, i64 %1320)
  %1322 = icmp ne i32 %1321, 0
  br i1 %1322, label %1328, label %1323

; <label>:1323                                    ; preds = %1314
  %1324 = load i8** %4, align 8
  %1325 = load i64* %len, align 8
  %1326 = sub i64 0, %1325
  %1327 = getelementptr inbounds i8* %1324, i64 %1326
  br label %1329

; <label>:1328                                    ; preds = %1314
  br label %1329

; <label>:1329                                    ; preds = %1328, %1323
  %1330 = phi i8* [ %1327, %1323 ], [ null, %1328 ]
  store i8* %1330, i8** %last2, align 8
  br label %1332

; <label>:1331                                    ; preds = %1311
  br label %1335

; <label>:1332                                    ; preds = %1329
  br label %1333

; <label>:1333                                    ; preds = %1332, %1305
  br label %1349

; <label>:1334                                    ; preds = %1287
  br label %1335

; <label>:1335                                    ; preds = %1334, %1331
  %1336 = load i64* %len, align 8
  %1337 = icmp ne i64 %1336, 0
  br i1 %1337, label %1338, label %1346

; <label>:1338                                    ; preds = %1335
  %1339 = load i8** %s, align 8
  %1340 = load i8** %4, align 8
  %1341 = load i8** %little, align 8
  %1342 = load i8** %little, align 8
  %1343 = load i64* %len, align 8
  %1344 = getelementptr inbounds i8* %1342, i64 %1343
  %1345 = call i8* @Perl_rninstr(i8* %1339, i8* %1340, i8* %1341, i8* %1344)
  store i8* %1345, i8** %last2, align 8
  br label %1348

; <label>:1346                                    ; preds = %1335
  %1347 = load i8** %4, align 8
  store i8* %1347, i8** %last2, align 8
  br label %1348

; <label>:1348                                    ; preds = %1346, %1338
  br label %1349

; <label>:1349                                    ; preds = %1348, %1333
  br label %1350

; <label>:1350                                    ; preds = %1349, %1264
  %1351 = load i8** %last2, align 8
  %1352 = icmp eq i8* %1351, null
  br i1 %1352, label %1353, label %1354

; <label>:1353                                    ; preds = %1350
  br label %1529

; <label>:1354                                    ; preds = %1350
  %1355 = load i8** %4, align 8
  %1356 = load i8** %last2, align 8
  %1357 = ptrtoint i8* %1355 to i64
  %1358 = ptrtoint i8* %1356 to i64
  %1359 = sub i64 %1357, %1358
  %1360 = load %struct.regexp** %2, align 8
  %1361 = getelementptr inbounds %struct.regexp* %1360, i32 0, i32 3
  %1362 = load %struct.reg_substr_data** %1361, align 8
  %1363 = getelementptr inbounds %struct.reg_substr_data* %1362, i32 0, i32 0
  %1364 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1363, i32 0, i64 1
  %1365 = getelementptr inbounds %struct.reg_substr_datum* %1364, i32 0, i32 0
  %1366 = load i32* %1365, align 4
  %1367 = sext i32 %1366 to i64
  %1368 = add nsw i64 %1359, %1367
  %1369 = trunc i64 %1368 to i32
  store i32 %1369, i32* %dontbother, align 4
  br label %1370

; <label>:1370                                    ; preds = %1354, %1161
  %1371 = load i32* %minlen, align 4
  %1372 = icmp ne i32 %1371, 0
  br i1 %1372, label %1373, label %1380

; <label>:1373                                    ; preds = %1370
  %1374 = load i32* %dontbother, align 4
  %1375 = load i32* %minlen, align 4
  %1376 = icmp slt i32 %1374, %1375
  br i1 %1376, label %1377, label %1380

; <label>:1377                                    ; preds = %1373
  %1378 = load i32* %minlen, align 4
  %1379 = sub nsw i32 %1378, 1
  store i32 %1379, i32* %dontbother, align 4
  br label %1380

; <label>:1380                                    ; preds = %1377, %1373, %1370
  %1381 = load i32* %dontbother, align 4
  %1382 = load i8** %4, align 8
  %1383 = sext i32 %1381 to i64
  %1384 = sub i64 0, %1383
  %1385 = getelementptr inbounds i8* %1382, i64 %1384
  store i8* %1385, i8** %4, align 8
  %1386 = load i8* %do_utf8, align 1
  %1387 = icmp ne i8 %1386, 0
  br i1 %1387, label %1388, label %1411

; <label>:1388                                    ; preds = %1380
  br label %1389

; <label>:1389                                    ; preds = %1400, %1388
  %1390 = load %struct.regexp** %2, align 8
  %1391 = load i8** %s, align 8
  %1392 = call i32 (%struct.regexp*, i8*, ...)* bitcast (i32 (...)* @regtry to i32 (%struct.regexp*, i8*, ...)*)(%struct.regexp* %1390, i8* %1391)
  %1393 = icmp ne i32 %1392, 0
  br i1 %1393, label %1394, label %1395

; <label>:1394                                    ; preds = %1389
  br label %1429

; <label>:1395                                    ; preds = %1389
  %1396 = load i8** %s, align 8
  %1397 = load i8** %4, align 8
  %1398 = icmp uge i8* %1396, %1397
  br i1 %1398, label %1399, label %1400

; <label>:1399                                    ; preds = %1395
  br label %1410

; <label>:1400                                    ; preds = %1395
  %1401 = load i8** %s, align 8
  %1402 = load i8* %1401, align 1
  %1403 = zext i8 %1402 to i64
  %1404 = getelementptr inbounds [0 x i8]* @PL_utf8skip, i32 0, i64 %1403
  %1405 = load i8* %1404, align 1
  %1406 = zext i8 %1405 to i32
  %1407 = load i8** %s, align 8
  %1408 = sext i32 %1406 to i64
  %1409 = getelementptr inbounds i8* %1407, i64 %1408
  store i8* %1409, i8** %s, align 8
  br label %1389

; <label>:1410                                    ; preds = %1399
  br label %1425

; <label>:1411                                    ; preds = %1380
  br label %1412

; <label>:1412                                    ; preds = %1419, %1411
  %1413 = load %struct.regexp** %2, align 8
  %1414 = load i8** %s, align 8
  %1415 = call i32 (%struct.regexp*, i8*, ...)* bitcast (i32 (...)* @regtry to i32 (%struct.regexp*, i8*, ...)*)(%struct.regexp* %1413, i8* %1414)
  %1416 = icmp ne i32 %1415, 0
  br i1 %1416, label %1417, label %1418

; <label>:1417                                    ; preds = %1412
  br label %1429

; <label>:1418                                    ; preds = %1412
  br label %1419

; <label>:1419                                    ; preds = %1418
  %1420 = load i8** %s, align 8
  %1421 = getelementptr inbounds i8* %1420, i32 1
  store i8* %1421, i8** %s, align 8
  %1422 = load i8** %4, align 8
  %1423 = icmp ult i8* %1420, %1422
  br i1 %1423, label %1412, label %1424

; <label>:1424                                    ; preds = %1419
  br label %1425

; <label>:1425                                    ; preds = %1424, %1410
  br label %1426

; <label>:1426                                    ; preds = %1425, %1151
  br label %1427

; <label>:1427                                    ; preds = %1426
  br label %1428

; <label>:1428                                    ; preds = %1427, %548
  br label %1529

; <label>:1429                                    ; preds = %1417, %1394, %1150, %1089, %1067, %523, %460, %351, %333, %281, %210
  %1430 = load i32* @PL_reg_flags, align 4
  %1431 = and i32 %1430, 1
  %1432 = icmp ne i32 %1431, 0
  br i1 %1432, label %1433, label %1438

; <label>:1433                                    ; preds = %1429
  %1434 = load %struct.regexp** %2, align 8
  %1435 = getelementptr inbounds %struct.regexp* %1434, i32 0, i32 15
  %1436 = load i32* %1435, align 4
  %1437 = or i32 %1436, 524288
  store i32 %1437, i32* %1435, align 4
  br label %1443

; <label>:1438                                    ; preds = %1429
  %1439 = load %struct.regexp** %2, align 8
  %1440 = getelementptr inbounds %struct.regexp* %1439, i32 0, i32 15
  %1441 = load i32* %1440, align 4
  %1442 = and i32 %1441, -524289
  store i32 %1442, i32* %1440, align 4
  br label %1443

; <label>:1443                                    ; preds = %1438, %1433
  %1444 = phi i32 [ %1437, %1433 ], [ %1442, %1438 ]
  %1445 = load i32* @PL_reg_eval_set, align 4
  %1446 = icmp ne i32 %1445, 0
  br i1 %1446, label %1447, label %1467

; <label>:1447                                    ; preds = %1443
  %1448 = load %struct.sv** %oreplsv, align 8
  %1449 = load %struct.gv** @PL_replgv, align 8
  %1450 = getelementptr inbounds %struct.gv* %1449, i32 0, i32 0
  %1451 = load %struct.xpvgv** %1450, align 8
  %1452 = getelementptr inbounds %struct.xpvgv* %1451, i32 0, i32 7
  %1453 = load %struct.gp** %1452, align 8
  %1454 = getelementptr inbounds %struct.gp* %1453, i32 0, i32 0
  %1455 = load %struct.sv** %1454, align 8
  %1456 = icmp ne %struct.sv* %1448, %1455
  br i1 %1456, label %1457, label %1466

; <label>:1457                                    ; preds = %1447
  %1458 = load %struct.sv** %oreplsv, align 8
  %1459 = load %struct.gv** @PL_replgv, align 8
  %1460 = getelementptr inbounds %struct.gv* %1459, i32 0, i32 0
  %1461 = load %struct.xpvgv** %1460, align 8
  %1462 = getelementptr inbounds %struct.xpvgv* %1461, i32 0, i32 7
  %1463 = load %struct.gp** %1462, align 8
  %1464 = getelementptr inbounds %struct.gp* %1463, i32 0, i32 0
  %1465 = load %struct.sv** %1464, align 8
  call void @Perl_sv_setsv_flags(%struct.sv* %1458, %struct.sv* %1465, i32 2)
  br label %1466

; <label>:1466                                    ; preds = %1457, %1447
  call void @restore_pos(i8* null)
  br label %1467

; <label>:1467                                    ; preds = %1466, %1443
  %1468 = load i32* %9, align 4
  %1469 = and i32 %1468, 16
  %1470 = icmp ne i32 %1469, 0
  br i1 %1470, label %1528, label %1471

; <label>:1471                                    ; preds = %1467
  %1472 = load %struct.regexp** %2, align 8
  %1473 = getelementptr inbounds %struct.regexp* %1472, i32 0, i32 15
  %1474 = load i32* %1473, align 4
  %1475 = and i32 %1474, 262144
  %1476 = icmp ne i32 %1475, 0
  br i1 %1476, label %1477, label %1485

; <label>:1477                                    ; preds = %1471
  %1478 = load %struct.regexp** %2, align 8
  %1479 = getelementptr inbounds %struct.regexp* %1478, i32 0, i32 6
  %1480 = load i8** %1479, align 8
  call void @Perl_safesysfree(i8* %1480)
  %1481 = load %struct.regexp** %2, align 8
  %1482 = getelementptr inbounds %struct.regexp* %1481, i32 0, i32 15
  %1483 = load i32* %1482, align 4
  %1484 = and i32 %1483, -262145
  store i32 %1484, i32* %1482, align 4
  br label %1485

; <label>:1485                                    ; preds = %1477, %1471
  %1486 = load i32* %9, align 4
  %1487 = and i32 %1486, 1
  %1488 = icmp ne i32 %1487, 0
  br i1 %1488, label %1489, label %1515

; <label>:1489                                    ; preds = %1485
  %1490 = load i8** @PL_regeol, align 8
  %1491 = load i8** %startpos, align 8
  %1492 = ptrtoint i8* %1490 to i64
  %1493 = ptrtoint i8* %1491 to i64
  %1494 = sub i64 %1492, %1493
  %1495 = load i8** %3, align 8
  %1496 = load i8** %5, align 8
  %1497 = ptrtoint i8* %1495 to i64
  %1498 = ptrtoint i8* %1496 to i64
  %1499 = sub i64 %1497, %1498
  %1500 = add nsw i64 %1494, %1499
  %1501 = trunc i64 %1500 to i32
  store i32 %1501, i32* %i, align 4
  %1502 = load i8** %5, align 8
  %1503 = load i32* %i, align 4
  %1504 = call i8* @Perl_savepvn(i8* %1502, i32 %1503)
  store i8* %1504, i8** %s, align 8
  %1505 = load i8** %s, align 8
  %1506 = load %struct.regexp** %2, align 8
  %1507 = getelementptr inbounds %struct.regexp* %1506, i32 0, i32 6
  store i8* %1505, i8** %1507, align 8
  %1508 = load i32* %i, align 4
  %1509 = load %struct.regexp** %2, align 8
  %1510 = getelementptr inbounds %struct.regexp* %1509, i32 0, i32 8
  store i32 %1508, i32* %1510, align 4
  %1511 = load %struct.regexp** %2, align 8
  %1512 = getelementptr inbounds %struct.regexp* %1511, i32 0, i32 15
  %1513 = load i32* %1512, align 4
  %1514 = or i32 %1513, 262144
  store i32 %1514, i32* %1512, align 4
  br label %1527

; <label>:1515                                    ; preds = %1485
  %1516 = load i8** %5, align 8
  %1517 = load %struct.regexp** %2, align 8
  %1518 = getelementptr inbounds %struct.regexp* %1517, i32 0, i32 6
  store i8* %1516, i8** %1518, align 8
  %1519 = load i8** @PL_regeol, align 8
  %1520 = load i8** %5, align 8
  %1521 = ptrtoint i8* %1519 to i64
  %1522 = ptrtoint i8* %1520 to i64
  %1523 = sub i64 %1521, %1522
  %1524 = trunc i64 %1523 to i32
  %1525 = load %struct.regexp** %2, align 8
  %1526 = getelementptr inbounds %struct.regexp* %1525, i32 0, i32 8
  store i32 %1524, i32* %1526, align 4
  br label %1527

; <label>:1527                                    ; preds = %1515, %1489
  br label %1528

; <label>:1528                                    ; preds = %1527, %1467
  store i32 1, i32* %1
  br label %1534

; <label>:1529                                    ; preds = %1428, %1353, %1095, %754, %352, %339, %304, %287, %193, %152, %70
  %1530 = load i32* @PL_reg_eval_set, align 4
  %1531 = icmp ne i32 %1530, 0
  br i1 %1531, label %1532, label %1533

; <label>:1532                                    ; preds = %1529
  call void @restore_pos(i8* null)
  br label %1533

; <label>:1533                                    ; preds = %1532, %1529
  store i32 0, i32* %1
  br label %1534

; <label>:1534                                    ; preds = %1533, %1528, %57
  %1535 = load i32* %1
  ret i32 %1535
}

; Function Attrs: nounwind uwtable
define i8* @Perl_re_intuit_start(%struct.regexp* %prog, %struct.sv* %sv, i8* %strpos, i8* %strend, i32 %flags, %struct.re_scream_pos_data_s* %data) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca %struct.regexp*, align 8
  %3 = alloca %struct.sv*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca %struct.re_scream_pos_data_s*, align 8
  %start_shift = alloca i32, align 4
  %end_shift = alloca i32, align 4
  %s = alloca i8*, align 8
  %check = alloca %struct.sv*, align 8
  %strbeg = alloca i8*, align 8
  %t = alloca i8*, align 8
  %do_utf8 = alloca i32, align 4
  %ml_anch = alloca i32, align 4
  %other_last = alloca i8*, align 8
  %check_at = alloca i8*, align 8
  %slen = alloca i32, align 4
  %end = alloca i32, align 4
  %eshift = alloca i32, align 4
  %p = alloca i32, align 4
  %pp = alloca i32*, align 8
  %last = alloca i8*, align 8
  %last1 = alloca i8*, align 8
  %last2 = alloca i8*, align 8
  %s1 = alloca i8*, align 8
  %must = alloca %struct.sv*, align 8
  %last3 = alloca i8*, align 8
  %last14 = alloca i8*, align 8
  %s15 = alloca i8*, align 8
  %must6 = alloca %struct.sv*, align 8
  %str = alloca i8*, align 8
  %cl_l = alloca i32, align 4
  %endpos = alloca i8*, align 8
  %startpos = alloca i8*, align 8
  store %struct.regexp* %prog, %struct.regexp** %2, align 8
  store %struct.sv* %sv, %struct.sv** %3, align 8
  store i8* %strpos, i8** %4, align 8
  store i8* %strend, i8** %5, align 8
  store i32 %flags, i32* %6, align 4
  store %struct.re_scream_pos_data_s* %data, %struct.re_scream_pos_data_s** %7, align 8
  store i32 0, i32* %start_shift, align 4
  store i32 0, i32* %end_shift, align 4
  %8 = load %struct.sv** %3, align 8
  %9 = icmp ne %struct.sv* %8, null
  br i1 %9, label %10, label %15

; <label>:10                                      ; preds = %0
  %11 = load %struct.sv** %3, align 8
  %12 = getelementptr inbounds %struct.sv* %11, i32 0, i32 2
  %13 = load i32* %12, align 4
  %14 = and i32 %13, 536870912
  br label %16

; <label>:15                                      ; preds = %0
  br label %16

; <label>:16                                      ; preds = %15, %10
  %17 = phi i32 [ %14, %10 ], [ 0, %15 ]
  store i32 %17, i32* %do_utf8, align 4
  store i8* null, i8** %other_last, align 8
  store i8* null, i8** %check_at, align 8
  %18 = load i32* %do_utf8, align 4
  %19 = icmp ne i32 %18, 0
  br i1 %19, label %20, label %25

; <label>:20                                      ; preds = %16
  %21 = load %struct.regexp** %2, align 8
  %22 = getelementptr inbounds %struct.regexp* %21, i32 0, i32 15
  %23 = load i32* %22, align 4
  %24 = or i32 %23, 268435456
  store i32 %24, i32* %22, align 4
  store i8 1, i8* @PL_reg_match_utf8, align 1
  br label %30

; <label>:25                                      ; preds = %16
  %26 = load %struct.regexp** %2, align 8
  %27 = getelementptr inbounds %struct.regexp* %26, i32 0, i32 15
  %28 = load i32* %27, align 4
  %29 = and i32 %28, -268435457
  store i32 %29, i32* %27, align 4
  store i8 0, i8* @PL_reg_match_utf8, align 1
  br label %30

; <label>:30                                      ; preds = %25, %20
  %31 = phi i32 [ 1, %20 ], [ 0, %25 ]
  %32 = load %struct.regexp** %2, align 8
  %33 = getelementptr inbounds %struct.regexp* %32, i32 0, i32 15
  %34 = load i32* %33, align 4
  %35 = and i32 %34, 65536
  %36 = icmp ne i32 %35, 0
  br i1 %36, label %37, label %40

; <label>:37                                      ; preds = %30
  %38 = load i32* @PL_reg_flags, align 4
  %39 = or i32 %38, 8
  store i32 %39, i32* @PL_reg_flags, align 4
  br label %40

; <label>:40                                      ; preds = %37, %30
  %41 = load %struct.regexp** %2, align 8
  %42 = getelementptr inbounds %struct.regexp* %41, i32 0, i32 10
  %43 = load i32* %42, align 4
  %44 = sext i32 %43 to i64
  %45 = load i8** %5, align 8
  %46 = load i8** %4, align 8
  %47 = ptrtoint i8* %45 to i64
  %48 = ptrtoint i8* %46 to i64
  %49 = sub i64 %47, %48
  %50 = icmp sgt i64 %44, %49
  br i1 %50, label %51, label %52

; <label>:51                                      ; preds = %40
  br label %2117

; <label>:52                                      ; preds = %40
  %53 = load %struct.sv** %3, align 8
  %54 = icmp ne %struct.sv* %53, null
  br i1 %54, label %55, label %71

; <label>:55                                      ; preds = %52
  %56 = load %struct.sv** %3, align 8
  %57 = getelementptr inbounds %struct.sv* %56, i32 0, i32 2
  %58 = load i32* %57, align 4
  %59 = and i32 %58, 262144
  %60 = icmp ne i32 %59, 0
  br i1 %60, label %61, label %71

; <label>:61                                      ; preds = %55
  %62 = load i8** %5, align 8
  %63 = load %struct.sv** %3, align 8
  %64 = getelementptr inbounds %struct.sv* %63, i32 0, i32 0
  %65 = load i8** %64, align 8
  %66 = bitcast i8* %65 to %struct.xpv*
  %67 = getelementptr inbounds %struct.xpv* %66, i32 0, i32 1
  %68 = load i64* %67, align 8
  %69 = sub i64 0, %68
  %70 = getelementptr inbounds i8* %62, i64 %69
  br label %73

; <label>:71                                      ; preds = %55, %52
  %72 = load i8** %4, align 8
  br label %73

; <label>:73                                      ; preds = %71, %61
  %74 = phi i8* [ %70, %61 ], [ %72, %71 ]
  store i8* %74, i8** %strbeg, align 8
  %75 = load i8** %5, align 8
  store i8* %75, i8** @PL_regeol, align 8
  %76 = load i32* %do_utf8, align 4
  %77 = icmp ne i32 %76, 0
  br i1 %77, label %78, label %107

; <label>:78                                      ; preds = %73
  %79 = load %struct.regexp** %2, align 8
  %80 = getelementptr inbounds %struct.regexp* %79, i32 0, i32 3
  %81 = load %struct.reg_substr_data** %80, align 8
  %82 = getelementptr inbounds %struct.reg_substr_data* %81, i32 0, i32 0
  %83 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %82, i32 0, i64 2
  %84 = getelementptr inbounds %struct.reg_substr_datum* %83, i32 0, i32 3
  %85 = load %struct.sv** %84, align 8
  %86 = icmp ne %struct.sv* %85, null
  br i1 %86, label %99, label %87

; <label>:87                                      ; preds = %78
  %88 = load %struct.regexp** %2, align 8
  %89 = getelementptr inbounds %struct.regexp* %88, i32 0, i32 3
  %90 = load %struct.reg_substr_data** %89, align 8
  %91 = getelementptr inbounds %struct.reg_substr_data* %90, i32 0, i32 0
  %92 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %91, i32 0, i64 2
  %93 = getelementptr inbounds %struct.reg_substr_datum* %92, i32 0, i32 2
  %94 = load %struct.sv** %93, align 8
  %95 = icmp ne %struct.sv* %94, null
  br i1 %95, label %96, label %99

; <label>:96                                      ; preds = %87
  %97 = load %struct.regexp** %2, align 8
  %98 = call i32 (%struct.regexp*, ...)* bitcast (i32 (...)* @to_utf8_substr to i32 (%struct.regexp*, ...)*)(%struct.regexp* %97)
  br label %99

; <label>:99                                      ; preds = %96, %87, %78
  %100 = load %struct.regexp** %2, align 8
  %101 = getelementptr inbounds %struct.regexp* %100, i32 0, i32 3
  %102 = load %struct.reg_substr_data** %101, align 8
  %103 = getelementptr inbounds %struct.reg_substr_data* %102, i32 0, i32 0
  %104 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %103, i32 0, i64 2
  %105 = getelementptr inbounds %struct.reg_substr_datum* %104, i32 0, i32 3
  %106 = load %struct.sv** %105, align 8
  store %struct.sv* %106, %struct.sv** %check, align 8
  br label %136

; <label>:107                                     ; preds = %73
  %108 = load %struct.regexp** %2, align 8
  %109 = getelementptr inbounds %struct.regexp* %108, i32 0, i32 3
  %110 = load %struct.reg_substr_data** %109, align 8
  %111 = getelementptr inbounds %struct.reg_substr_data* %110, i32 0, i32 0
  %112 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %111, i32 0, i64 2
  %113 = getelementptr inbounds %struct.reg_substr_datum* %112, i32 0, i32 2
  %114 = load %struct.sv** %113, align 8
  %115 = icmp ne %struct.sv* %114, null
  br i1 %115, label %128, label %116

; <label>:116                                     ; preds = %107
  %117 = load %struct.regexp** %2, align 8
  %118 = getelementptr inbounds %struct.regexp* %117, i32 0, i32 3
  %119 = load %struct.reg_substr_data** %118, align 8
  %120 = getelementptr inbounds %struct.reg_substr_data* %119, i32 0, i32 0
  %121 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %120, i32 0, i64 2
  %122 = getelementptr inbounds %struct.reg_substr_datum* %121, i32 0, i32 3
  %123 = load %struct.sv** %122, align 8
  %124 = icmp ne %struct.sv* %123, null
  br i1 %124, label %125, label %128

; <label>:125                                     ; preds = %116
  %126 = load %struct.regexp** %2, align 8
  %127 = call i32 (%struct.regexp*, ...)* bitcast (i32 (...)* @to_byte_substr to i32 (%struct.regexp*, ...)*)(%struct.regexp* %126)
  br label %128

; <label>:128                                     ; preds = %125, %116, %107
  %129 = load %struct.regexp** %2, align 8
  %130 = getelementptr inbounds %struct.regexp* %129, i32 0, i32 3
  %131 = load %struct.reg_substr_data** %130, align 8
  %132 = getelementptr inbounds %struct.reg_substr_data* %131, i32 0, i32 0
  %133 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %132, i32 0, i64 2
  %134 = getelementptr inbounds %struct.reg_substr_datum* %133, i32 0, i32 2
  %135 = load %struct.sv** %134, align 8
  store %struct.sv* %135, %struct.sv** %check, align 8
  br label %136

; <label>:136                                     ; preds = %128, %99
  %137 = load %struct.sv** %check, align 8
  %138 = icmp eq %struct.sv* %137, @PL_sv_undef
  br i1 %138, label %139, label %140

; <label>:139                                     ; preds = %136
  br label %2117

; <label>:140                                     ; preds = %136
  %141 = load %struct.regexp** %2, align 8
  %142 = getelementptr inbounds %struct.regexp* %141, i32 0, i32 15
  %143 = load i32* %142, align 4
  %144 = and i32 %143, 15
  %145 = icmp ne i32 %144, 0
  br i1 %145, label %146, label %463

; <label>:146                                     ; preds = %140
  %147 = load %struct.regexp** %2, align 8
  %148 = getelementptr inbounds %struct.regexp* %147, i32 0, i32 15
  %149 = load i32* %148, align 4
  %150 = and i32 %149, 12
  %151 = icmp ne i32 %150, 0
  br i1 %151, label %164, label %152

; <label>:152                                     ; preds = %146
  %153 = load %struct.regexp** %2, align 8
  %154 = getelementptr inbounds %struct.regexp* %153, i32 0, i32 15
  %155 = load i32* %154, align 4
  %156 = and i32 %155, 1
  %157 = icmp ne i32 %156, 0
  br i1 %157, label %158, label %162

; <label>:158                                     ; preds = %152
  %159 = load i32* @PL_multiline, align 4
  %160 = icmp ne i32 %159, 0
  %161 = xor i1 %160, true
  br label %162

; <label>:162                                     ; preds = %158, %152
  %163 = phi i1 [ false, %152 ], [ %161, %158 ]
  br label %164

; <label>:164                                     ; preds = %162, %146
  %165 = phi i1 [ true, %146 ], [ %163, %162 ]
  %166 = xor i1 %165, true
  %167 = zext i1 %166 to i32
  store i32 %167, i32* %ml_anch, align 4
  %168 = load i32* %ml_anch, align 4
  %169 = icmp ne i32 %168, 0
  br i1 %169, label %363, label %170

; <label>:170                                     ; preds = %164
  %171 = load %struct.regexp** %2, align 8
  %172 = getelementptr inbounds %struct.regexp* %171, i32 0, i32 15
  %173 = load i32* %172, align 4
  %174 = and i32 %173, 40
  %175 = icmp ne i32 %174, 0
  br i1 %175, label %190, label %176

; <label>:176                                     ; preds = %170
  %177 = load %struct.sv** %3, align 8
  %178 = icmp ne %struct.sv* %177, null
  br i1 %178, label %179, label %190

; <label>:179                                     ; preds = %176
  %180 = load %struct.sv** %3, align 8
  %181 = getelementptr inbounds %struct.sv* %180, i32 0, i32 2
  %182 = load i32* %181, align 4
  %183 = and i32 %182, 524288
  %184 = icmp ne i32 %183, 0
  br i1 %184, label %190, label %185

; <label>:185                                     ; preds = %179
  %186 = load i8** %4, align 8
  %187 = load i8** %strbeg, align 8
  %188 = icmp ne i8* %186, %187
  br i1 %188, label %189, label %190

; <label>:189                                     ; preds = %185
  br label %2117

; <label>:190                                     ; preds = %185, %179, %176, %170
  %191 = load %struct.regexp** %2, align 8
  %192 = getelementptr inbounds %struct.regexp* %191, i32 0, i32 3
  %193 = load %struct.reg_substr_data** %192, align 8
  %194 = getelementptr inbounds %struct.reg_substr_data* %193, i32 0, i32 0
  %195 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %194, i32 0, i64 2
  %196 = getelementptr inbounds %struct.reg_substr_datum* %195, i32 0, i32 0
  %197 = load i32* %196, align 4
  %198 = load %struct.regexp** %2, align 8
  %199 = getelementptr inbounds %struct.regexp* %198, i32 0, i32 3
  %200 = load %struct.reg_substr_data** %199, align 8
  %201 = getelementptr inbounds %struct.reg_substr_data* %200, i32 0, i32 0
  %202 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %201, i32 0, i64 2
  %203 = getelementptr inbounds %struct.reg_substr_datum* %202, i32 0, i32 1
  %204 = load i32* %203, align 4
  %205 = icmp eq i32 %197, %204
  br i1 %205, label %206, label %362

; <label>:206                                     ; preds = %190
  %207 = load %struct.regexp** %2, align 8
  %208 = getelementptr inbounds %struct.regexp* %207, i32 0, i32 15
  %209 = load i32* %208, align 4
  %210 = and i32 %209, 2048
  %211 = icmp ne i32 %210, 0
  br i1 %211, label %362, label %212

; <label>:212                                     ; preds = %206
  %213 = load i8* @PL_reg_match_utf8, align 1
  %214 = sext i8 %213 to i32
  %215 = icmp ne i32 %214, 0
  br i1 %215, label %216, label %229

; <label>:216                                     ; preds = %212
  %217 = load i8** %4, align 8
  %218 = load %struct.regexp** %2, align 8
  %219 = getelementptr inbounds %struct.regexp* %218, i32 0, i32 3
  %220 = load %struct.reg_substr_data** %219, align 8
  %221 = getelementptr inbounds %struct.reg_substr_data* %220, i32 0, i32 0
  %222 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %221, i32 0, i64 2
  %223 = getelementptr inbounds %struct.reg_substr_datum* %222, i32 0, i32 0
  %224 = load i32* %223, align 4
  %225 = load i8** %5, align 8
  %226 = call i32 (i8*, i32, i8*, ...)* bitcast (i32 (...)* @reghop3 to i32 (i8*, i32, i8*, ...)*)(i8* %217, i32 %224, i8* %225)
  %227 = sext i32 %226 to i64
  %228 = inttoptr i64 %227 to i8*
  br label %240

; <label>:229                                     ; preds = %212
  %230 = load i8** %4, align 8
  %231 = load %struct.regexp** %2, align 8
  %232 = getelementptr inbounds %struct.regexp* %231, i32 0, i32 3
  %233 = load %struct.reg_substr_data** %232, align 8
  %234 = getelementptr inbounds %struct.reg_substr_data* %233, i32 0, i32 0
  %235 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %234, i32 0, i64 2
  %236 = getelementptr inbounds %struct.reg_substr_datum* %235, i32 0, i32 0
  %237 = load i32* %236, align 4
  %238 = sext i32 %237 to i64
  %239 = getelementptr inbounds i8* %230, i64 %238
  br label %240

; <label>:240                                     ; preds = %229, %216
  %241 = phi i8* [ %228, %216 ], [ %239, %229 ]
  store i8* %241, i8** %s, align 8
  %242 = load %struct.sv** %check, align 8
  %243 = getelementptr inbounds %struct.sv* %242, i32 0, i32 2
  %244 = load i32* %243, align 4
  %245 = and i32 %244, 1073741824
  %246 = icmp ne i32 %245, 0
  br i1 %246, label %247, label %325

; <label>:247                                     ; preds = %240
  %248 = load %struct.sv** %check, align 8
  %249 = getelementptr inbounds %struct.sv* %248, i32 0, i32 0
  %250 = load i8** %249, align 8
  %251 = bitcast i8* %250 to %struct.xpv*
  %252 = getelementptr inbounds %struct.xpv* %251, i32 0, i32 1
  %253 = load i64* %252, align 8
  %254 = trunc i64 %253 to i32
  store i32 %254, i32* %slen, align 4
  %255 = load i8** %5, align 8
  %256 = load i8** %s, align 8
  %257 = ptrtoint i8* %255 to i64
  %258 = ptrtoint i8* %256 to i64
  %259 = sub i64 %257, %258
  %260 = load i32* %slen, align 4
  %261 = sext i32 %260 to i64
  %262 = icmp sgt i64 %259, %261
  br i1 %262, label %288, label %263

; <label>:263                                     ; preds = %247
  %264 = load i8** %5, align 8
  %265 = load i8** %s, align 8
  %266 = ptrtoint i8* %264 to i64
  %267 = ptrtoint i8* %265 to i64
  %268 = sub i64 %266, %267
  %269 = load i32* %slen, align 4
  %270 = sub nsw i32 %269, 1
  %271 = sext i32 %270 to i64
  %272 = icmp slt i64 %268, %271
  br i1 %272, label %288, label %273

; <label>:273                                     ; preds = %263
  %274 = load i8** %5, align 8
  %275 = load i8** %s, align 8
  %276 = ptrtoint i8* %274 to i64
  %277 = ptrtoint i8* %275 to i64
  %278 = sub i64 %276, %277
  %279 = load i32* %slen, align 4
  %280 = sext i32 %279 to i64
  %281 = icmp eq i64 %278, %280
  br i1 %281, label %282, label %289

; <label>:282                                     ; preds = %273
  %283 = load i8** %5, align 8
  %284 = getelementptr inbounds i8* %283, i64 -1
  %285 = load i8* %284, align 1
  %286 = sext i8 %285 to i32
  %287 = icmp ne i32 %286, 10
  br i1 %287, label %288, label %289

; <label>:288                                     ; preds = %282, %263, %247
  br label %2071

; <label>:289                                     ; preds = %282, %273
  %290 = load i32* %slen, align 4
  %291 = add nsw i32 %290, -1
  store i32 %291, i32* %slen, align 4
  %292 = load i32* %slen, align 4
  %293 = icmp ne i32 %292, 0
  br i1 %293, label %294, label %324

; <label>:294                                     ; preds = %289
  %295 = load %struct.sv** %check, align 8
  %296 = getelementptr inbounds %struct.sv* %295, i32 0, i32 0
  %297 = load i8** %296, align 8
  %298 = bitcast i8* %297 to %struct.xpv*
  %299 = getelementptr inbounds %struct.xpv* %298, i32 0, i32 0
  %300 = load i8** %299, align 8
  %301 = load i8* %300, align 1
  %302 = sext i8 %301 to i32
  %303 = load i8** %s, align 8
  %304 = load i8* %303, align 1
  %305 = sext i8 %304 to i32
  %306 = icmp ne i32 %302, %305
  br i1 %306, label %322, label %307

; <label>:307                                     ; preds = %294
  %308 = load i32* %slen, align 4
  %309 = icmp sgt i32 %308, 1
  br i1 %309, label %310, label %324

; <label>:310                                     ; preds = %307
  %311 = load %struct.sv** %check, align 8
  %312 = getelementptr inbounds %struct.sv* %311, i32 0, i32 0
  %313 = load i8** %312, align 8
  %314 = bitcast i8* %313 to %struct.xpv*
  %315 = getelementptr inbounds %struct.xpv* %314, i32 0, i32 0
  %316 = load i8** %315, align 8
  %317 = load i8** %s, align 8
  %318 = load i32* %slen, align 4
  %319 = sext i32 %318 to i64
  %320 = call i32 @memcmp(i8* %316, i8* %317, i64 %319)
  %321 = icmp ne i32 %320, 0
  br i1 %321, label %322, label %324

; <label>:322                                     ; preds = %310, %294
  br label %323

; <label>:323                                     ; preds = %359, %322
  br label %2071

; <label>:324                                     ; preds = %310, %307, %289
  br label %361

; <label>:325                                     ; preds = %240
  %326 = load %struct.sv** %check, align 8
  %327 = getelementptr inbounds %struct.sv* %326, i32 0, i32 0
  %328 = load i8** %327, align 8
  %329 = bitcast i8* %328 to %struct.xpv*
  %330 = getelementptr inbounds %struct.xpv* %329, i32 0, i32 0
  %331 = load i8** %330, align 8
  %332 = load i8* %331, align 1
  %333 = sext i8 %332 to i32
  %334 = load i8** %s, align 8
  %335 = load i8* %334, align 1
  %336 = sext i8 %335 to i32
  %337 = icmp ne i32 %333, %336
  br i1 %337, label %359, label %338

; <label>:338                                     ; preds = %325
  %339 = load %struct.sv** %check, align 8
  %340 = getelementptr inbounds %struct.sv* %339, i32 0, i32 0
  %341 = load i8** %340, align 8
  %342 = bitcast i8* %341 to %struct.xpv*
  %343 = getelementptr inbounds %struct.xpv* %342, i32 0, i32 1
  %344 = load i64* %343, align 8
  %345 = trunc i64 %344 to i32
  store i32 %345, i32* %slen, align 4
  %346 = icmp sgt i32 %345, 1
  br i1 %346, label %347, label %360

; <label>:347                                     ; preds = %338
  %348 = load %struct.sv** %check, align 8
  %349 = getelementptr inbounds %struct.sv* %348, i32 0, i32 0
  %350 = load i8** %349, align 8
  %351 = bitcast i8* %350 to %struct.xpv*
  %352 = getelementptr inbounds %struct.xpv* %351, i32 0, i32 0
  %353 = load i8** %352, align 8
  %354 = load i8** %s, align 8
  %355 = load i32* %slen, align 4
  %356 = sext i32 %355 to i64
  %357 = call i32 @memcmp(i8* %353, i8* %354, i64 %356)
  %358 = icmp ne i32 %357, 0
  br i1 %358, label %359, label %360

; <label>:359                                     ; preds = %347, %325
  br label %323

; <label>:360                                     ; preds = %347, %338
  br label %361

; <label>:361                                     ; preds = %360, %324
  br label %1529

; <label>:362                                     ; preds = %206, %190
  br label %363

; <label>:363                                     ; preds = %362, %164
  %364 = load i8** %4, align 8
  store i8* %364, i8** %s, align 8
  %365 = load %struct.regexp** %2, align 8
  %366 = getelementptr inbounds %struct.regexp* %365, i32 0, i32 3
  %367 = load %struct.reg_substr_data** %366, align 8
  %368 = getelementptr inbounds %struct.reg_substr_data* %367, i32 0, i32 0
  %369 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %368, i32 0, i64 2
  %370 = getelementptr inbounds %struct.reg_substr_datum* %369, i32 0, i32 0
  %371 = load i32* %370, align 4
  store i32 %371, i32* %start_shift, align 4
  %372 = load %struct.regexp** %2, align 8
  %373 = getelementptr inbounds %struct.regexp* %372, i32 0, i32 10
  %374 = load i32* %373, align 4
  %375 = load i32* %start_shift, align 4
  %376 = sub nsw i32 %374, %375
  %377 = sext i32 %376 to i64
  %378 = load i32* %do_utf8, align 4
  %379 = icmp ne i32 %378, 0
  br i1 %379, label %380, label %383

; <label>:380                                     ; preds = %363
  %381 = load %struct.sv** %check, align 8
  %382 = call i64 @Perl_sv_len_utf8(%struct.sv* %381)
  br label %390

; <label>:383                                     ; preds = %363
  %384 = load %struct.sv** %check, align 8
  %385 = getelementptr inbounds %struct.sv* %384, i32 0, i32 0
  %386 = load i8** %385, align 8
  %387 = bitcast i8* %386 to %struct.xpv*
  %388 = getelementptr inbounds %struct.xpv* %387, i32 0, i32 1
  %389 = load i64* %388, align 8
  br label %390

; <label>:390                                     ; preds = %383, %380
  %391 = phi i64 [ %382, %380 ], [ %389, %383 ]
  %392 = sub i64 %377, %391
  %393 = load %struct.sv** %check, align 8
  %394 = getelementptr inbounds %struct.sv* %393, i32 0, i32 2
  %395 = load i32* %394, align 4
  %396 = and i32 %395, 1073741824
  %397 = icmp ne i32 %396, 0
  %398 = zext i1 %397 to i32
  %399 = sext i32 %398 to i64
  %400 = add i64 %392, %399
  %401 = trunc i64 %400 to i32
  store i32 %401, i32* %end_shift, align 4
  %402 = load i32* %ml_anch, align 4
  %403 = icmp ne i32 %402, 0
  br i1 %403, label %462, label %404

; <label>:404                                     ; preds = %390
  %405 = load %struct.regexp** %2, align 8
  %406 = getelementptr inbounds %struct.regexp* %405, i32 0, i32 3
  %407 = load %struct.reg_substr_data** %406, align 8
  %408 = getelementptr inbounds %struct.reg_substr_data* %407, i32 0, i32 0
  %409 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %408, i32 0, i64 2
  %410 = getelementptr inbounds %struct.reg_substr_datum* %409, i32 0, i32 1
  %411 = load i32* %410, align 4
  %412 = sext i32 %411 to i64
  %413 = load i32* %do_utf8, align 4
  %414 = icmp ne i32 %413, 0
  br i1 %414, label %415, label %418

; <label>:415                                     ; preds = %404
  %416 = load %struct.sv** %check, align 8
  %417 = call i64 @Perl_sv_len_utf8(%struct.sv* %416)
  br label %425

; <label>:418                                     ; preds = %404
  %419 = load %struct.sv** %check, align 8
  %420 = getelementptr inbounds %struct.sv* %419, i32 0, i32 0
  %421 = load i8** %420, align 8
  %422 = bitcast i8* %421 to %struct.xpv*
  %423 = getelementptr inbounds %struct.xpv* %422, i32 0, i32 1
  %424 = load i64* %423, align 8
  br label %425

; <label>:425                                     ; preds = %418, %415
  %426 = phi i64 [ %417, %415 ], [ %424, %418 ]
  %427 = add i64 %412, %426
  %428 = load %struct.sv** %check, align 8
  %429 = getelementptr inbounds %struct.sv* %428, i32 0, i32 2
  %430 = load i32* %429, align 4
  %431 = and i32 %430, 1073741824
  %432 = icmp ne i32 %431, 0
  %433 = zext i1 %432 to i32
  %434 = sext i32 %433 to i64
  %435 = sub i64 %427, %434
  %436 = trunc i64 %435 to i32
  store i32 %436, i32* %end, align 4
  %437 = load i8* @PL_reg_match_utf8, align 1
  %438 = sext i8 %437 to i32
  %439 = icmp ne i32 %438, 0
  br i1 %439, label %440, label %444

; <label>:440                                     ; preds = %425
  %441 = load i8** %5, align 8
  %442 = load i8** %s, align 8
  %443 = call i64 @Perl_utf8_distance(i8* %441, i8* %442)
  br label %450

; <label>:444                                     ; preds = %425
  %445 = load i8** %5, align 8
  %446 = load i8** %s, align 8
  %447 = ptrtoint i8* %445 to i64
  %448 = ptrtoint i8* %446 to i64
  %449 = sub i64 %447, %448
  br label %450

; <label>:450                                     ; preds = %444, %440
  %451 = phi i64 [ %443, %440 ], [ %449, %444 ]
  %452 = load i32* %end, align 4
  %453 = sext i32 %452 to i64
  %454 = sub nsw i64 %451, %453
  %455 = trunc i64 %454 to i32
  store i32 %455, i32* %eshift, align 4
  %456 = load i32* %end_shift, align 4
  %457 = load i32* %eshift, align 4
  %458 = icmp slt i32 %456, %457
  br i1 %458, label %459, label %461

; <label>:459                                     ; preds = %450
  %460 = load i32* %eshift, align 4
  store i32 %460, i32* %end_shift, align 4
  br label %461

; <label>:461                                     ; preds = %459, %450
  br label %462

; <label>:462                                     ; preds = %461, %390
  br label %502

; <label>:463                                     ; preds = %140
  store i32 0, i32* %ml_anch, align 4
  %464 = load i8** %4, align 8
  store i8* %464, i8** %s, align 8
  %465 = load %struct.regexp** %2, align 8
  %466 = getelementptr inbounds %struct.regexp* %465, i32 0, i32 3
  %467 = load %struct.reg_substr_data** %466, align 8
  %468 = getelementptr inbounds %struct.reg_substr_data* %467, i32 0, i32 0
  %469 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %468, i32 0, i64 2
  %470 = getelementptr inbounds %struct.reg_substr_datum* %469, i32 0, i32 0
  %471 = load i32* %470, align 4
  store i32 %471, i32* %start_shift, align 4
  %472 = load %struct.regexp** %2, align 8
  %473 = getelementptr inbounds %struct.regexp* %472, i32 0, i32 10
  %474 = load i32* %473, align 4
  %475 = load i32* %start_shift, align 4
  %476 = sub nsw i32 %474, %475
  %477 = sext i32 %476 to i64
  %478 = load i32* %do_utf8, align 4
  %479 = icmp ne i32 %478, 0
  br i1 %479, label %480, label %483

; <label>:480                                     ; preds = %463
  %481 = load %struct.sv** %check, align 8
  %482 = call i64 @Perl_sv_len_utf8(%struct.sv* %481)
  br label %490

; <label>:483                                     ; preds = %463
  %484 = load %struct.sv** %check, align 8
  %485 = getelementptr inbounds %struct.sv* %484, i32 0, i32 0
  %486 = load i8** %485, align 8
  %487 = bitcast i8* %486 to %struct.xpv*
  %488 = getelementptr inbounds %struct.xpv* %487, i32 0, i32 1
  %489 = load i64* %488, align 8
  br label %490

; <label>:490                                     ; preds = %483, %480
  %491 = phi i64 [ %482, %480 ], [ %489, %483 ]
  %492 = sub i64 %477, %491
  %493 = load %struct.sv** %check, align 8
  %494 = getelementptr inbounds %struct.sv* %493, i32 0, i32 2
  %495 = load i32* %494, align 4
  %496 = and i32 %495, 1073741824
  %497 = icmp ne i32 %496, 0
  %498 = zext i1 %497 to i32
  %499 = sext i32 %498 to i64
  %500 = add i64 %492, %499
  %501 = trunc i64 %500 to i32
  store i32 %501, i32* %end_shift, align 4
  br label %502

; <label>:502                                     ; preds = %490, %462
  br label %503

; <label>:503                                     ; preds = %2007, %1460, %1334, %1060, %502
  %504 = load i32* %6, align 4
  %505 = and i32 %504, 4
  %506 = icmp ne i32 %505, 0
  br i1 %506, label %507, label %606

; <label>:507                                     ; preds = %503
  store i32 -1, i32* %p, align 4
  %508 = load %struct.re_scream_pos_data_s** %7, align 8
  %509 = icmp ne %struct.re_scream_pos_data_s* %508, null
  br i1 %509, label %510, label %514

; <label>:510                                     ; preds = %507
  %511 = load %struct.re_scream_pos_data_s** %7, align 8
  %512 = getelementptr inbounds %struct.re_scream_pos_data_s* %511, i32 0, i32 1
  %513 = load i32** %512, align 8
  br label %515

; <label>:514                                     ; preds = %507
  br label %515

; <label>:515                                     ; preds = %514, %510
  %516 = phi i32* [ %513, %510 ], [ %p, %514 ]
  store i32* %516, i32** %pp, align 8
  %517 = load %struct.sv** %check, align 8
  %518 = getelementptr inbounds %struct.sv* %517, i32 0, i32 0
  %519 = load i8** %518, align 8
  %520 = bitcast i8* %519 to %struct.xpvbm*
  %521 = getelementptr inbounds %struct.xpvbm* %520, i32 0, i32 9
  %522 = load i8* %521, align 1
  %523 = zext i8 %522 to i64
  %524 = load i32** @PL_screamfirst, align 8
  %525 = getelementptr inbounds i32* %524, i64 %523
  %526 = load i32* %525, align 4
  %527 = icmp sge i32 %526, 0
  br i1 %527, label %559, label %528

; <label>:528                                     ; preds = %515
  %529 = load %struct.sv** %check, align 8
  %530 = getelementptr inbounds %struct.sv* %529, i32 0, i32 0
  %531 = load i8** %530, align 8
  %532 = bitcast i8* %531 to %struct.xpvbm*
  %533 = getelementptr inbounds %struct.xpvbm* %532, i32 0, i32 9
  %534 = load i8* %533, align 1
  %535 = zext i8 %534 to i32
  %536 = icmp eq i32 %535, 10
  br i1 %536, label %537, label %574

; <label>:537                                     ; preds = %528
  %538 = load %struct.sv** %check, align 8
  %539 = getelementptr inbounds %struct.sv* %538, i32 0, i32 0
  %540 = load i8** %539, align 8
  %541 = bitcast i8* %540 to %struct.xpvbm*
  %542 = getelementptr inbounds %struct.xpvbm* %541, i32 0, i32 8
  %543 = load i16* %542, align 2
  %544 = zext i16 %543 to i64
  %545 = load %struct.sv** %check, align 8
  %546 = getelementptr inbounds %struct.sv* %545, i32 0, i32 0
  %547 = load i8** %546, align 8
  %548 = bitcast i8* %547 to %struct.xpv*
  %549 = getelementptr inbounds %struct.xpv* %548, i32 0, i32 1
  %550 = load i64* %549, align 8
  %551 = sub i64 %550, 1
  %552 = icmp eq i64 %544, %551
  br i1 %552, label %553, label %574

; <label>:553                                     ; preds = %537
  %554 = load %struct.sv** %check, align 8
  %555 = getelementptr inbounds %struct.sv* %554, i32 0, i32 2
  %556 = load i32* %555, align 4
  %557 = and i32 %556, 1073741824
  %558 = icmp ne i32 %557, 0
  br i1 %558, label %559, label %574

; <label>:559                                     ; preds = %553, %515
  %560 = load %struct.sv** %3, align 8
  %561 = load %struct.sv** %check, align 8
  %562 = load i32* %start_shift, align 4
  %563 = sext i32 %562 to i64
  %564 = load i8** %s, align 8
  %565 = load i8** %strbeg, align 8
  %566 = ptrtoint i8* %564 to i64
  %567 = ptrtoint i8* %565 to i64
  %568 = sub i64 %566, %567
  %569 = add nsw i64 %563, %568
  %570 = trunc i64 %569 to i32
  %571 = load i32* %end_shift, align 4
  %572 = load i32** %pp, align 8
  %573 = call i8* @Perl_screaminstr(%struct.sv* %560, %struct.sv* %561, i32 %570, i32 %571, i32* %572, i32 0)
  store i8* %573, i8** %s, align 8
  br label %575

; <label>:574                                     ; preds = %553, %537, %528
  br label %2071

; <label>:575                                     ; preds = %559
  %576 = load i8** %s, align 8
  %577 = icmp ne i8* %576, null
  br i1 %577, label %578, label %597

; <label>:578                                     ; preds = %575
  %579 = load %struct.regexp** %2, align 8
  %580 = getelementptr inbounds %struct.regexp* %579, i32 0, i32 15
  %581 = load i32* %580, align 4
  %582 = and i32 %581, 262144
  %583 = icmp ne i32 %582, 0
  br i1 %583, label %584, label %597

; <label>:584                                     ; preds = %578
  %585 = load i8** %strbeg, align 8
  %586 = load i8** %s, align 8
  %587 = load %struct.sv** %3, align 8
  %588 = getelementptr inbounds %struct.sv* %587, i32 0, i32 0
  %589 = load i8** %588, align 8
  %590 = bitcast i8* %589 to %struct.xpv*
  %591 = getelementptr inbounds %struct.xpv* %590, i32 0, i32 0
  %592 = load i8** %591, align 8
  %593 = ptrtoint i8* %586 to i64
  %594 = ptrtoint i8* %592 to i64
  %595 = sub i64 %593, %594
  %596 = getelementptr inbounds i8* %585, i64 %595
  store i8* %596, i8** %s, align 8
  br label %597

; <label>:597                                     ; preds = %584, %578, %575
  %598 = load %struct.re_scream_pos_data_s** %7, align 8
  %599 = icmp ne %struct.re_scream_pos_data_s* %598, null
  br i1 %599, label %600, label %605

; <label>:600                                     ; preds = %597
  %601 = load i8** %s, align 8
  %602 = load %struct.re_scream_pos_data_s** %7, align 8
  %603 = getelementptr inbounds %struct.re_scream_pos_data_s* %602, i32 0, i32 0
  %604 = load i8*** %603, align 8
  store i8* %601, i8** %604, align 8
  br label %605

; <label>:605                                     ; preds = %600, %597
  br label %670

; <label>:606                                     ; preds = %503
  %607 = load %struct.regexp** %2, align 8
  %608 = getelementptr inbounds %struct.regexp* %607, i32 0, i32 15
  %609 = load i32* %608, align 4
  %610 = and i32 %609, 2048
  %611 = icmp ne i32 %610, 0
  br i1 %611, label %612, label %627

; <label>:612                                     ; preds = %606
  %613 = load i8** %s, align 8
  %614 = load i32* %start_shift, align 4
  %615 = sext i32 %614 to i64
  %616 = getelementptr inbounds i8* %613, i64 %615
  %617 = load i8** %5, align 8
  %618 = load i32* %end_shift, align 4
  %619 = sext i32 %618 to i64
  %620 = sub i64 0, %619
  %621 = getelementptr inbounds i8* %617, i64 %620
  %622 = load %struct.sv** %check, align 8
  %623 = load i32* @PL_multiline, align 4
  %624 = icmp ne i32 %623, 0
  %625 = select i1 %624, i32 1, i32 0
  %626 = call i8* @Perl_fbm_instr(i8* %616, i8* %621, %struct.sv* %622, i32 %625)
  store i8* %626, i8** %s, align 8
  br label %669

; <label>:627                                     ; preds = %606
  %628 = load i8* @PL_reg_match_utf8, align 1
  %629 = sext i8 %628 to i32
  %630 = icmp ne i32 %629, 0
  br i1 %630, label %631, label %638

; <label>:631                                     ; preds = %627
  %632 = load i8** %s, align 8
  %633 = load i32* %start_shift, align 4
  %634 = load i8** %5, align 8
  %635 = call i32 (i8*, i32, i8*, ...)* bitcast (i32 (...)* @reghop3 to i32 (i8*, i32, i8*, ...)*)(i8* %632, i32 %633, i8* %634)
  %636 = sext i32 %635 to i64
  %637 = inttoptr i64 %636 to i8*
  br label %643

; <label>:638                                     ; preds = %627
  %639 = load i8** %s, align 8
  %640 = load i32* %start_shift, align 4
  %641 = sext i32 %640 to i64
  %642 = getelementptr inbounds i8* %639, i64 %641
  br label %643

; <label>:643                                     ; preds = %638, %631
  %644 = phi i8* [ %637, %631 ], [ %642, %638 ]
  %645 = load i8* @PL_reg_match_utf8, align 1
  %646 = sext i8 %645 to i32
  %647 = icmp ne i32 %646, 0
  br i1 %647, label %648, label %656

; <label>:648                                     ; preds = %643
  %649 = load i8** %5, align 8
  %650 = load i32* %end_shift, align 4
  %651 = sub nsw i32 0, %650
  %652 = load i8** %strbeg, align 8
  %653 = call i32 (i8*, i32, i8*, ...)* bitcast (i32 (...)* @reghop3 to i32 (i8*, i32, i8*, ...)*)(i8* %649, i32 %651, i8* %652)
  %654 = sext i32 %653 to i64
  %655 = inttoptr i64 %654 to i8*
  br label %662

; <label>:656                                     ; preds = %643
  %657 = load i8** %5, align 8
  %658 = load i32* %end_shift, align 4
  %659 = sub nsw i32 0, %658
  %660 = sext i32 %659 to i64
  %661 = getelementptr inbounds i8* %657, i64 %660
  br label %662

; <label>:662                                     ; preds = %656, %648
  %663 = phi i8* [ %655, %648 ], [ %661, %656 ]
  %664 = load %struct.sv** %check, align 8
  %665 = load i32* @PL_multiline, align 4
  %666 = icmp ne i32 %665, 0
  %667 = select i1 %666, i32 1, i32 0
  %668 = call i8* @Perl_fbm_instr(i8* %644, i8* %663, %struct.sv* %664, i32 %667)
  store i8* %668, i8** %s, align 8
  br label %669

; <label>:669                                     ; preds = %662, %612
  br label %670

; <label>:670                                     ; preds = %669, %605
  %671 = load i8** %s, align 8
  %672 = icmp ne i8* %671, null
  br i1 %672, label %674, label %673

; <label>:673                                     ; preds = %670
  br label %2071

; <label>:674                                     ; preds = %670
  %675 = load i8** %s, align 8
  store i8* %675, i8** %check_at, align 8
  %676 = load i32* %do_utf8, align 4
  %677 = icmp ne i32 %676, 0
  br i1 %677, label %678, label %696

; <label>:678                                     ; preds = %674
  %679 = load %struct.regexp** %2, align 8
  %680 = getelementptr inbounds %struct.regexp* %679, i32 0, i32 3
  %681 = load %struct.reg_substr_data** %680, align 8
  %682 = getelementptr inbounds %struct.reg_substr_data* %681, i32 0, i32 0
  %683 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %682, i32 0, i64 1
  %684 = getelementptr inbounds %struct.reg_substr_datum* %683, i32 0, i32 3
  %685 = load %struct.sv** %684, align 8
  %686 = icmp ne %struct.sv* %685, null
  br i1 %686, label %687, label %1344

; <label>:687                                     ; preds = %678
  %688 = load %struct.regexp** %2, align 8
  %689 = getelementptr inbounds %struct.regexp* %688, i32 0, i32 3
  %690 = load %struct.reg_substr_data** %689, align 8
  %691 = getelementptr inbounds %struct.reg_substr_data* %690, i32 0, i32 0
  %692 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %691, i32 0, i64 0
  %693 = getelementptr inbounds %struct.reg_substr_datum* %692, i32 0, i32 3
  %694 = load %struct.sv** %693, align 8
  %695 = icmp ne %struct.sv* %694, null
  br i1 %695, label %714, label %1344

; <label>:696                                     ; preds = %674
  %697 = load %struct.regexp** %2, align 8
  %698 = getelementptr inbounds %struct.regexp* %697, i32 0, i32 3
  %699 = load %struct.reg_substr_data** %698, align 8
  %700 = getelementptr inbounds %struct.reg_substr_data* %699, i32 0, i32 0
  %701 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %700, i32 0, i64 1
  %702 = getelementptr inbounds %struct.reg_substr_datum* %701, i32 0, i32 2
  %703 = load %struct.sv** %702, align 8
  %704 = icmp ne %struct.sv* %703, null
  br i1 %704, label %705, label %1344

; <label>:705                                     ; preds = %696
  %706 = load %struct.regexp** %2, align 8
  %707 = getelementptr inbounds %struct.regexp* %706, i32 0, i32 3
  %708 = load %struct.reg_substr_data** %707, align 8
  %709 = getelementptr inbounds %struct.reg_substr_data* %708, i32 0, i32 0
  %710 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %709, i32 0, i64 0
  %711 = getelementptr inbounds %struct.reg_substr_datum* %710, i32 0, i32 2
  %712 = load %struct.sv** %711, align 8
  %713 = icmp ne %struct.sv* %712, null
  br i1 %713, label %714, label %1344

; <label>:714                                     ; preds = %705, %687
  %715 = load i8** %other_last, align 8
  %716 = icmp ne i8* %715, null
  br i1 %716, label %719, label %717

; <label>:717                                     ; preds = %714
  %718 = load i8** %4, align 8
  store i8* %718, i8** %other_last, align 8
  br label %719

; <label>:719                                     ; preds = %717, %714
  %720 = load %struct.sv** %check, align 8
  %721 = load i32* %do_utf8, align 4
  %722 = icmp ne i32 %721, 0
  br i1 %722, label %723, label %731

; <label>:723                                     ; preds = %719
  %724 = load %struct.regexp** %2, align 8
  %725 = getelementptr inbounds %struct.regexp* %724, i32 0, i32 3
  %726 = load %struct.reg_substr_data** %725, align 8
  %727 = getelementptr inbounds %struct.reg_substr_data* %726, i32 0, i32 0
  %728 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %727, i32 0, i64 1
  %729 = getelementptr inbounds %struct.reg_substr_datum* %728, i32 0, i32 3
  %730 = load %struct.sv** %729, align 8
  br label %739

; <label>:731                                     ; preds = %719
  %732 = load %struct.regexp** %2, align 8
  %733 = getelementptr inbounds %struct.regexp* %732, i32 0, i32 3
  %734 = load %struct.reg_substr_data** %733, align 8
  %735 = getelementptr inbounds %struct.reg_substr_data* %734, i32 0, i32 0
  %736 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %735, i32 0, i64 1
  %737 = getelementptr inbounds %struct.reg_substr_datum* %736, i32 0, i32 2
  %738 = load %struct.sv** %737, align 8
  br label %739

; <label>:739                                     ; preds = %731, %723
  %740 = phi %struct.sv* [ %730, %723 ], [ %738, %731 ]
  %741 = icmp eq %struct.sv* %720, %740
  br i1 %741, label %742, label %1114

; <label>:742                                     ; preds = %739
  br label %743

; <label>:743                                     ; preds = %2021, %1454, %742
  %744 = load i8* @PL_reg_match_utf8, align 1
  %745 = sext i8 %744 to i32
  %746 = icmp ne i32 %745, 0
  br i1 %746, label %747, label %755

; <label>:747                                     ; preds = %743
  %748 = load i8** %s, align 8
  %749 = load i32* %start_shift, align 4
  %750 = sub nsw i32 0, %749
  %751 = load i8** %strbeg, align 8
  %752 = call i32 (i8*, i32, i8*, ...)* bitcast (i32 (...)* @reghop3 to i32 (i8*, i32, i8*, ...)*)(i8* %748, i32 %750, i8* %751)
  %753 = sext i32 %752 to i64
  %754 = inttoptr i64 %753 to i8*
  br label %761

; <label>:755                                     ; preds = %743
  %756 = load i8** %s, align 8
  %757 = load i32* %start_shift, align 4
  %758 = sub nsw i32 0, %757
  %759 = sext i32 %758 to i64
  %760 = getelementptr inbounds i8* %756, i64 %759
  br label %761

; <label>:761                                     ; preds = %755, %747
  %762 = phi i8* [ %754, %747 ], [ %760, %755 ]
  store i8* %762, i8** %last, align 8
  %763 = load i8** %s, align 8
  store i8* %763, i8** %s1, align 8
  %764 = load i8** %s, align 8
  %765 = load %struct.regexp** %2, align 8
  %766 = getelementptr inbounds %struct.regexp* %765, i32 0, i32 3
  %767 = load %struct.reg_substr_data** %766, align 8
  %768 = getelementptr inbounds %struct.reg_substr_data* %767, i32 0, i32 0
  %769 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %768, i32 0, i64 2
  %770 = getelementptr inbounds %struct.reg_substr_datum* %769, i32 0, i32 1
  %771 = load i32* %770, align 4
  %772 = sext i32 %771 to i64
  %773 = sub i64 0, %772
  %774 = getelementptr inbounds i8* %764, i64 %773
  store i8* %774, i8** %t, align 8
  %775 = load i8** %s, align 8
  %776 = load i8** %4, align 8
  %777 = ptrtoint i8* %775 to i64
  %778 = ptrtoint i8* %776 to i64
  %779 = sub i64 %777, %778
  %780 = load %struct.regexp** %2, align 8
  %781 = getelementptr inbounds %struct.regexp* %780, i32 0, i32 3
  %782 = load %struct.reg_substr_data** %781, align 8
  %783 = getelementptr inbounds %struct.reg_substr_data* %782, i32 0, i32 0
  %784 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %783, i32 0, i64 2
  %785 = getelementptr inbounds %struct.reg_substr_datum* %784, i32 0, i32 1
  %786 = load i32* %785, align 4
  %787 = sext i32 %786 to i64
  %788 = icmp sgt i64 %779, %787
  br i1 %788, label %789, label %812

; <label>:789                                     ; preds = %761
  %790 = load i32* %do_utf8, align 4
  %791 = icmp ne i32 %790, 0
  br i1 %791, label %792, label %811

; <label>:792                                     ; preds = %789
  %793 = load i8** %s, align 8
  %794 = load %struct.regexp** %2, align 8
  %795 = getelementptr inbounds %struct.regexp* %794, i32 0, i32 3
  %796 = load %struct.reg_substr_data** %795, align 8
  %797 = getelementptr inbounds %struct.reg_substr_data* %796, i32 0, i32 0
  %798 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %797, i32 0, i64 2
  %799 = getelementptr inbounds %struct.reg_substr_datum* %798, i32 0, i32 1
  %800 = load i32* %799, align 4
  %801 = sub nsw i32 0, %800
  %802 = load i8** %4, align 8
  %803 = call i32 (i8*, i32, i8*, ...)* bitcast (i32 (...)* @reghopmaybe3 to i32 (i8*, i32, i8*, ...)*)(i8* %793, i32 %801, i8* %802)
  %804 = sext i32 %803 to i64
  %805 = inttoptr i64 %804 to i8*
  store i8* %805, i8** %t, align 8
  %806 = icmp ne i8* %805, null
  br i1 %806, label %807, label %812

; <label>:807                                     ; preds = %792
  %808 = load i8** %t, align 8
  %809 = load i8** %4, align 8
  %810 = icmp ugt i8* %808, %809
  br i1 %810, label %811, label %812

; <label>:811                                     ; preds = %807, %789
  br label %814

; <label>:812                                     ; preds = %807, %792, %761
  %813 = load i8** %4, align 8
  store i8* %813, i8** %t, align 8
  br label %814

; <label>:814                                     ; preds = %812, %811
  %815 = load i8* @PL_reg_match_utf8, align 1
  %816 = sext i8 %815 to i32
  %817 = icmp ne i32 %816, 0
  br i1 %817, label %818, label %831

; <label>:818                                     ; preds = %814
  %819 = load i8** %t, align 8
  %820 = load %struct.regexp** %2, align 8
  %821 = getelementptr inbounds %struct.regexp* %820, i32 0, i32 3
  %822 = load %struct.reg_substr_data** %821, align 8
  %823 = getelementptr inbounds %struct.reg_substr_data* %822, i32 0, i32 0
  %824 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %823, i32 0, i64 0
  %825 = getelementptr inbounds %struct.reg_substr_datum* %824, i32 0, i32 0
  %826 = load i32* %825, align 4
  %827 = load i8** %5, align 8
  %828 = call i32 (i8*, i32, i8*, ...)* bitcast (i32 (...)* @reghop3 to i32 (i8*, i32, i8*, ...)*)(i8* %819, i32 %826, i8* %827)
  %829 = sext i32 %828 to i64
  %830 = inttoptr i64 %829 to i8*
  br label %842

; <label>:831                                     ; preds = %814
  %832 = load i8** %t, align 8
  %833 = load %struct.regexp** %2, align 8
  %834 = getelementptr inbounds %struct.regexp* %833, i32 0, i32 3
  %835 = load %struct.reg_substr_data** %834, align 8
  %836 = getelementptr inbounds %struct.reg_substr_data* %835, i32 0, i32 0
  %837 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %836, i32 0, i64 0
  %838 = getelementptr inbounds %struct.reg_substr_datum* %837, i32 0, i32 0
  %839 = load i32* %838, align 4
  %840 = sext i32 %839 to i64
  %841 = getelementptr inbounds i8* %832, i64 %840
  br label %842

; <label>:842                                     ; preds = %831, %818
  %843 = phi i8* [ %830, %818 ], [ %841, %831 ]
  store i8* %843, i8** %t, align 8
  %844 = load i8** %t, align 8
  %845 = load i8** %other_last, align 8
  %846 = icmp ult i8* %844, %845
  br i1 %846, label %847, label %849

; <label>:847                                     ; preds = %842
  %848 = load i8** %other_last, align 8
  store i8* %848, i8** %t, align 8
  br label %849

; <label>:849                                     ; preds = %847, %842
  %850 = load i8* @PL_reg_match_utf8, align 1
  %851 = sext i8 %850 to i32
  %852 = icmp ne i32 %851, 0
  br i1 %852, label %853, label %863

; <label>:853                                     ; preds = %849
  %854 = load i8** %5, align 8
  %855 = load %struct.regexp** %2, align 8
  %856 = getelementptr inbounds %struct.regexp* %855, i32 0, i32 10
  %857 = load i32* %856, align 4
  %858 = sub nsw i32 0, %857
  %859 = load i8** %strbeg, align 8
  %860 = call i32 (i8*, i32, i8*, ...)* bitcast (i32 (...)* @reghop3 to i32 (i8*, i32, i8*, ...)*)(i8* %854, i32 %858, i8* %859)
  %861 = sext i32 %860 to i64
  %862 = inttoptr i64 %861 to i8*
  br label %871

; <label>:863                                     ; preds = %849
  %864 = load i8** %5, align 8
  %865 = load %struct.regexp** %2, align 8
  %866 = getelementptr inbounds %struct.regexp* %865, i32 0, i32 10
  %867 = load i32* %866, align 4
  %868 = sub nsw i32 0, %867
  %869 = sext i32 %868 to i64
  %870 = getelementptr inbounds i8* %864, i64 %869
  br label %871

; <label>:871                                     ; preds = %863, %853
  %872 = phi i8* [ %862, %853 ], [ %870, %863 ]
  store i8* %872, i8** %last1, align 8
  store i8* %872, i8** %last2, align 8
  %873 = load i8** %last, align 8
  %874 = load i8** %last1, align 8
  %875 = icmp ult i8* %873, %874
  br i1 %875, label %876, label %878

; <label>:876                                     ; preds = %871
  %877 = load i8** %last, align 8
  store i8* %877, i8** %last1, align 8
  br label %878

; <label>:878                                     ; preds = %876, %871
  %879 = load i32* %do_utf8, align 4
  %880 = icmp ne i32 %879, 0
  br i1 %880, label %881, label %889

; <label>:881                                     ; preds = %878
  %882 = load %struct.regexp** %2, align 8
  %883 = getelementptr inbounds %struct.regexp* %882, i32 0, i32 3
  %884 = load %struct.reg_substr_data** %883, align 8
  %885 = getelementptr inbounds %struct.reg_substr_data* %884, i32 0, i32 0
  %886 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %885, i32 0, i64 0
  %887 = getelementptr inbounds %struct.reg_substr_datum* %886, i32 0, i32 3
  %888 = load %struct.sv** %887, align 8
  br label %897

; <label>:889                                     ; preds = %878
  %890 = load %struct.regexp** %2, align 8
  %891 = getelementptr inbounds %struct.regexp* %890, i32 0, i32 3
  %892 = load %struct.reg_substr_data** %891, align 8
  %893 = getelementptr inbounds %struct.reg_substr_data* %892, i32 0, i32 0
  %894 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %893, i32 0, i64 0
  %895 = getelementptr inbounds %struct.reg_substr_datum* %894, i32 0, i32 2
  %896 = load %struct.sv** %895, align 8
  br label %897

; <label>:897                                     ; preds = %889, %881
  %898 = phi %struct.sv* [ %888, %881 ], [ %896, %889 ]
  store %struct.sv* %898, %struct.sv** %must, align 8
  %899 = load %struct.sv** %must, align 8
  %900 = icmp eq %struct.sv* %899, @PL_sv_undef
  br i1 %900, label %901, label %902

; <label>:901                                     ; preds = %897
  store i8* null, i8** %s, align 8
  br label %1008

; <label>:902                                     ; preds = %897
  %903 = load i8** %t, align 8
  %904 = load i8* @PL_reg_match_utf8, align 1
  %905 = sext i8 %904 to i32
  %906 = icmp ne i32 %905, 0
  br i1 %906, label %907, label %955

; <label>:907                                     ; preds = %902
  %908 = load i8* @PL_reg_match_utf8, align 1
  %909 = sext i8 %908 to i32
  %910 = icmp ne i32 %909, 0
  br i1 %910, label %911, label %924

; <label>:911                                     ; preds = %907
  %912 = load i8** %last1, align 8
  %913 = load %struct.regexp** %2, align 8
  %914 = getelementptr inbounds %struct.regexp* %913, i32 0, i32 3
  %915 = load %struct.reg_substr_data** %914, align 8
  %916 = getelementptr inbounds %struct.reg_substr_data* %915, i32 0, i32 0
  %917 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %916, i32 0, i64 0
  %918 = getelementptr inbounds %struct.reg_substr_datum* %917, i32 0, i32 0
  %919 = load i32* %918, align 4
  %920 = load i8** %5, align 8
  %921 = call i32 (i8*, i32, i8*, ...)* bitcast (i32 (...)* @reghop3 to i32 (i8*, i32, i8*, ...)*)(i8* %912, i32 %919, i8* %920)
  %922 = sext i32 %921 to i64
  %923 = inttoptr i64 %922 to i8*
  br label %935

; <label>:924                                     ; preds = %907
  %925 = load i8** %last1, align 8
  %926 = load %struct.regexp** %2, align 8
  %927 = getelementptr inbounds %struct.regexp* %926, i32 0, i32 3
  %928 = load %struct.reg_substr_data** %927, align 8
  %929 = getelementptr inbounds %struct.reg_substr_data* %928, i32 0, i32 0
  %930 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %929, i32 0, i64 0
  %931 = getelementptr inbounds %struct.reg_substr_datum* %930, i32 0, i32 0
  %932 = load i32* %931, align 4
  %933 = sext i32 %932 to i64
  %934 = getelementptr inbounds i8* %925, i64 %933
  br label %935

; <label>:935                                     ; preds = %924, %911
  %936 = phi i8* [ %923, %911 ], [ %934, %924 ]
  %937 = load %struct.sv** %must, align 8
  %938 = getelementptr inbounds %struct.sv* %937, i32 0, i32 0
  %939 = load i8** %938, align 8
  %940 = bitcast i8* %939 to %struct.xpv*
  %941 = getelementptr inbounds %struct.xpv* %940, i32 0, i32 1
  %942 = load i64* %941, align 8
  %943 = getelementptr inbounds i8* %936, i64 %942
  %944 = load %struct.sv** %must, align 8
  %945 = getelementptr inbounds %struct.sv* %944, i32 0, i32 2
  %946 = load i32* %945, align 4
  %947 = and i32 %946, 1073741824
  %948 = icmp ne i32 %947, 0
  %949 = zext i1 %948 to i32
  %950 = sub nsw i32 0, %949
  %951 = load i8** %strbeg, align 8
  %952 = call i32 (i8*, i32, i8*, ...)* bitcast (i32 (...)* @reghop3 to i32 (i8*, i32, i8*, ...)*)(i8* %943, i32 %950, i8* %951)
  %953 = sext i32 %952 to i64
  %954 = inttoptr i64 %953 to i8*
  br label %1001

; <label>:955                                     ; preds = %902
  %956 = load i8* @PL_reg_match_utf8, align 1
  %957 = sext i8 %956 to i32
  %958 = icmp ne i32 %957, 0
  br i1 %958, label %959, label %972

; <label>:959                                     ; preds = %955
  %960 = load i8** %last1, align 8
  %961 = load %struct.regexp** %2, align 8
  %962 = getelementptr inbounds %struct.regexp* %961, i32 0, i32 3
  %963 = load %struct.reg_substr_data** %962, align 8
  %964 = getelementptr inbounds %struct.reg_substr_data* %963, i32 0, i32 0
  %965 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %964, i32 0, i64 0
  %966 = getelementptr inbounds %struct.reg_substr_datum* %965, i32 0, i32 0
  %967 = load i32* %966, align 4
  %968 = load i8** %5, align 8
  %969 = call i32 (i8*, i32, i8*, ...)* bitcast (i32 (...)* @reghop3 to i32 (i8*, i32, i8*, ...)*)(i8* %960, i32 %967, i8* %968)
  %970 = sext i32 %969 to i64
  %971 = inttoptr i64 %970 to i8*
  br label %983

; <label>:972                                     ; preds = %955
  %973 = load i8** %last1, align 8
  %974 = load %struct.regexp** %2, align 8
  %975 = getelementptr inbounds %struct.regexp* %974, i32 0, i32 3
  %976 = load %struct.reg_substr_data** %975, align 8
  %977 = getelementptr inbounds %struct.reg_substr_data* %976, i32 0, i32 0
  %978 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %977, i32 0, i64 0
  %979 = getelementptr inbounds %struct.reg_substr_datum* %978, i32 0, i32 0
  %980 = load i32* %979, align 4
  %981 = sext i32 %980 to i64
  %982 = getelementptr inbounds i8* %973, i64 %981
  br label %983

; <label>:983                                     ; preds = %972, %959
  %984 = phi i8* [ %971, %959 ], [ %982, %972 ]
  %985 = load %struct.sv** %must, align 8
  %986 = getelementptr inbounds %struct.sv* %985, i32 0, i32 0
  %987 = load i8** %986, align 8
  %988 = bitcast i8* %987 to %struct.xpv*
  %989 = getelementptr inbounds %struct.xpv* %988, i32 0, i32 1
  %990 = load i64* %989, align 8
  %991 = getelementptr inbounds i8* %984, i64 %990
  %992 = load %struct.sv** %must, align 8
  %993 = getelementptr inbounds %struct.sv* %992, i32 0, i32 2
  %994 = load i32* %993, align 4
  %995 = and i32 %994, 1073741824
  %996 = icmp ne i32 %995, 0
  %997 = zext i1 %996 to i32
  %998 = sub nsw i32 0, %997
  %999 = sext i32 %998 to i64
  %1000 = getelementptr inbounds i8* %991, i64 %999
  br label %1001

; <label>:1001                                    ; preds = %983, %935
  %1002 = phi i8* [ %954, %935 ], [ %1000, %983 ]
  %1003 = load %struct.sv** %must, align 8
  %1004 = load i32* @PL_multiline, align 4
  %1005 = icmp ne i32 %1004, 0
  %1006 = select i1 %1005, i32 1, i32 0
  %1007 = call i8* @Perl_fbm_instr(i8* %903, i8* %1002, %struct.sv* %1003, i32 %1006)
  store i8* %1007, i8** %s, align 8
  br label %1008

; <label>:1008                                    ; preds = %1001, %901
  %1009 = load i8** %s, align 8
  %1010 = icmp ne i8* %1009, null
  br i1 %1010, label %1062, label %1011

; <label>:1011                                    ; preds = %1008
  %1012 = load i8** %last1, align 8
  %1013 = load i8** %last2, align 8
  %1014 = icmp uge i8* %1012, %1013
  br i1 %1014, label %1015, label %1016

; <label>:1015                                    ; preds = %1011
  br label %2071

; <label>:1016                                    ; preds = %1011
  %1017 = load i8* @PL_reg_match_utf8, align 1
  %1018 = sext i8 %1017 to i32
  %1019 = icmp ne i32 %1018, 0
  br i1 %1019, label %1020, label %1034

; <label>:1020                                    ; preds = %1016
  %1021 = load i8** %last1, align 8
  %1022 = load %struct.regexp** %2, align 8
  %1023 = getelementptr inbounds %struct.regexp* %1022, i32 0, i32 3
  %1024 = load %struct.reg_substr_data** %1023, align 8
  %1025 = getelementptr inbounds %struct.reg_substr_data* %1024, i32 0, i32 0
  %1026 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1025, i32 0, i64 0
  %1027 = getelementptr inbounds %struct.reg_substr_datum* %1026, i32 0, i32 0
  %1028 = load i32* %1027, align 4
  %1029 = add nsw i32 %1028, 1
  %1030 = load i8** %5, align 8
  %1031 = call i32 (i8*, i32, i8*, ...)* bitcast (i32 (...)* @reghop3 to i32 (i8*, i32, i8*, ...)*)(i8* %1021, i32 %1029, i8* %1030)
  %1032 = sext i32 %1031 to i64
  %1033 = inttoptr i64 %1032 to i8*
  br label %1046

; <label>:1034                                    ; preds = %1016
  %1035 = load i8** %last1, align 8
  %1036 = load %struct.regexp** %2, align 8
  %1037 = getelementptr inbounds %struct.regexp* %1036, i32 0, i32 3
  %1038 = load %struct.reg_substr_data** %1037, align 8
  %1039 = getelementptr inbounds %struct.reg_substr_data* %1038, i32 0, i32 0
  %1040 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1039, i32 0, i64 0
  %1041 = getelementptr inbounds %struct.reg_substr_datum* %1040, i32 0, i32 0
  %1042 = load i32* %1041, align 4
  %1043 = sext i32 %1042 to i64
  %1044 = getelementptr inbounds i8* %1035, i64 %1043
  %1045 = getelementptr inbounds i8* %1044, i64 1
  br label %1046

; <label>:1046                                    ; preds = %1034, %1020
  %1047 = phi i8* [ %1033, %1020 ], [ %1045, %1034 ]
  store i8* %1047, i8** %other_last, align 8
  %1048 = load i8* @PL_reg_match_utf8, align 1
  %1049 = sext i8 %1048 to i32
  %1050 = icmp ne i32 %1049, 0
  br i1 %1050, label %1051, label %1057

; <label>:1051                                    ; preds = %1046
  %1052 = load i8** %last, align 8
  %1053 = load i8** %5, align 8
  %1054 = call i32 (i8*, i32, i8*, ...)* bitcast (i32 (...)* @reghop3 to i32 (i8*, i32, i8*, ...)*)(i8* %1052, i32 1, i8* %1053)
  %1055 = sext i32 %1054 to i64
  %1056 = inttoptr i64 %1055 to i8*
  br label %1060

; <label>:1057                                    ; preds = %1046
  %1058 = load i8** %last, align 8
  %1059 = getelementptr inbounds i8* %1058, i64 1
  br label %1060

; <label>:1060                                    ; preds = %1057, %1051
  %1061 = phi i8* [ %1056, %1051 ], [ %1059, %1057 ]
  store i8* %1061, i8** %s, align 8
  br label %503

; <label>:1062                                    ; preds = %1008
  %1063 = load i8* @PL_reg_match_utf8, align 1
  %1064 = sext i8 %1063 to i32
  %1065 = icmp ne i32 %1064, 0
  br i1 %1065, label %1066, label %1080

; <label>:1066                                    ; preds = %1062
  %1067 = load i8** %s, align 8
  %1068 = load %struct.regexp** %2, align 8
  %1069 = getelementptr inbounds %struct.regexp* %1068, i32 0, i32 3
  %1070 = load %struct.reg_substr_data** %1069, align 8
  %1071 = getelementptr inbounds %struct.reg_substr_data* %1070, i32 0, i32 0
  %1072 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1071, i32 0, i64 0
  %1073 = getelementptr inbounds %struct.reg_substr_datum* %1072, i32 0, i32 0
  %1074 = load i32* %1073, align 4
  %1075 = sub nsw i32 0, %1074
  %1076 = load i8** %strbeg, align 8
  %1077 = call i32 (i8*, i32, i8*, ...)* bitcast (i32 (...)* @reghop3 to i32 (i8*, i32, i8*, ...)*)(i8* %1067, i32 %1075, i8* %1076)
  %1078 = sext i32 %1077 to i64
  %1079 = inttoptr i64 %1078 to i8*
  br label %1092

; <label>:1080                                    ; preds = %1062
  %1081 = load i8** %s, align 8
  %1082 = load %struct.regexp** %2, align 8
  %1083 = getelementptr inbounds %struct.regexp* %1082, i32 0, i32 3
  %1084 = load %struct.reg_substr_data** %1083, align 8
  %1085 = getelementptr inbounds %struct.reg_substr_data* %1084, i32 0, i32 0
  %1086 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1085, i32 0, i64 0
  %1087 = getelementptr inbounds %struct.reg_substr_datum* %1086, i32 0, i32 0
  %1088 = load i32* %1087, align 4
  %1089 = sub nsw i32 0, %1088
  %1090 = sext i32 %1089 to i64
  %1091 = getelementptr inbounds i8* %1081, i64 %1090
  br label %1092

; <label>:1092                                    ; preds = %1080, %1066
  %1093 = phi i8* [ %1079, %1066 ], [ %1091, %1080 ]
  store i8* %1093, i8** %t, align 8
  %1094 = load i8* @PL_reg_match_utf8, align 1
  %1095 = sext i8 %1094 to i32
  %1096 = icmp ne i32 %1095, 0
  br i1 %1096, label %1097, label %1103

; <label>:1097                                    ; preds = %1092
  %1098 = load i8** %s, align 8
  %1099 = load i8** %5, align 8
  %1100 = call i32 (i8*, i32, i8*, ...)* bitcast (i32 (...)* @reghop3 to i32 (i8*, i32, i8*, ...)*)(i8* %1098, i32 1, i8* %1099)
  %1101 = sext i32 %1100 to i64
  %1102 = inttoptr i64 %1101 to i8*
  br label %1106

; <label>:1103                                    ; preds = %1092
  %1104 = load i8** %s, align 8
  %1105 = getelementptr inbounds i8* %1104, i64 1
  br label %1106

; <label>:1106                                    ; preds = %1103, %1097
  %1107 = phi i8* [ %1102, %1097 ], [ %1105, %1103 ]
  store i8* %1107, i8** %other_last, align 8
  %1108 = load i8** %s1, align 8
  store i8* %1108, i8** %s, align 8
  %1109 = load i8** %t, align 8
  %1110 = load i8** %4, align 8
  %1111 = icmp eq i8* %1109, %1110
  br i1 %1111, label %1112, label %1113

; <label>:1112                                    ; preds = %1106
  br label %1498

; <label>:1113                                    ; preds = %1106
  br label %1393

; <label>:1114                                    ; preds = %739
  %1115 = load i8** %s, align 8
  store i8* %1115, i8** %s15, align 8
  %1116 = load i8* @PL_reg_match_utf8, align 1
  %1117 = sext i8 %1116 to i32
  %1118 = icmp ne i32 %1117, 0
  br i1 %1118, label %1119, label %1127

; <label>:1119                                    ; preds = %1114
  %1120 = load i8** %s, align 8
  %1121 = load i32* %start_shift, align 4
  %1122 = sub nsw i32 0, %1121
  %1123 = load i8** %strbeg, align 8
  %1124 = call i32 (i8*, i32, i8*, ...)* bitcast (i32 (...)* @reghop3 to i32 (i8*, i32, i8*, ...)*)(i8* %1120, i32 %1122, i8* %1123)
  %1125 = sext i32 %1124 to i64
  %1126 = inttoptr i64 %1125 to i8*
  br label %1133

; <label>:1127                                    ; preds = %1114
  %1128 = load i8** %s, align 8
  %1129 = load i32* %start_shift, align 4
  %1130 = sub nsw i32 0, %1129
  %1131 = sext i32 %1130 to i64
  %1132 = getelementptr inbounds i8* %1128, i64 %1131
  br label %1133

; <label>:1133                                    ; preds = %1127, %1119
  %1134 = phi i8* [ %1126, %1119 ], [ %1132, %1127 ]
  store i8* %1134, i8** %t, align 8
  %1135 = load i8* @PL_reg_match_utf8, align 1
  %1136 = sext i8 %1135 to i32
  %1137 = icmp ne i32 %1136, 0
  br i1 %1137, label %1138, label %1156

; <label>:1138                                    ; preds = %1133
  %1139 = load i8** %5, align 8
  %1140 = load %struct.regexp** %2, align 8
  %1141 = getelementptr inbounds %struct.regexp* %1140, i32 0, i32 10
  %1142 = load i32* %1141, align 4
  %1143 = sub nsw i32 0, %1142
  %1144 = load %struct.regexp** %2, align 8
  %1145 = getelementptr inbounds %struct.regexp* %1144, i32 0, i32 3
  %1146 = load %struct.reg_substr_data** %1145, align 8
  %1147 = getelementptr inbounds %struct.reg_substr_data* %1146, i32 0, i32 0
  %1148 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1147, i32 0, i64 1
  %1149 = getelementptr inbounds %struct.reg_substr_datum* %1148, i32 0, i32 0
  %1150 = load i32* %1149, align 4
  %1151 = add nsw i32 %1143, %1150
  %1152 = load i8** %strbeg, align 8
  %1153 = call i32 (i8*, i32, i8*, ...)* bitcast (i32 (...)* @reghop3 to i32 (i8*, i32, i8*, ...)*)(i8* %1139, i32 %1151, i8* %1152)
  %1154 = sext i32 %1153 to i64
  %1155 = inttoptr i64 %1154 to i8*
  br label %1173

; <label>:1156                                    ; preds = %1133
  %1157 = load i8** %5, align 8
  %1158 = load %struct.regexp** %2, align 8
  %1159 = getelementptr inbounds %struct.regexp* %1158, i32 0, i32 10
  %1160 = load i32* %1159, align 4
  %1161 = sub nsw i32 0, %1160
  %1162 = sext i32 %1161 to i64
  %1163 = getelementptr inbounds i8* %1157, i64 %1162
  %1164 = load %struct.regexp** %2, align 8
  %1165 = getelementptr inbounds %struct.regexp* %1164, i32 0, i32 3
  %1166 = load %struct.reg_substr_data** %1165, align 8
  %1167 = getelementptr inbounds %struct.reg_substr_data* %1166, i32 0, i32 0
  %1168 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1167, i32 0, i64 1
  %1169 = getelementptr inbounds %struct.reg_substr_datum* %1168, i32 0, i32 0
  %1170 = load i32* %1169, align 4
  %1171 = sext i32 %1170 to i64
  %1172 = getelementptr inbounds i8* %1163, i64 %1171
  br label %1173

; <label>:1173                                    ; preds = %1156, %1138
  %1174 = phi i8* [ %1155, %1138 ], [ %1172, %1156 ]
  store i8* %1174, i8** %last3, align 8
  store i8* %1174, i8** %last14, align 8
  %1175 = load i8* @PL_reg_match_utf8, align 1
  %1176 = sext i8 %1175 to i32
  %1177 = icmp ne i32 %1176, 0
  br i1 %1177, label %1178, label %1182

; <label>:1178                                    ; preds = %1173
  %1179 = load i8** %last3, align 8
  %1180 = load i8** %t, align 8
  %1181 = call i64 @Perl_utf8_distance(i8* %1179, i8* %1180)
  br label %1188

; <label>:1182                                    ; preds = %1173
  %1183 = load i8** %last3, align 8
  %1184 = load i8** %t, align 8
  %1185 = ptrtoint i8* %1183 to i64
  %1186 = ptrtoint i8* %1184 to i64
  %1187 = sub i64 %1185, %1186
  br label %1188

; <label>:1188                                    ; preds = %1182, %1178
  %1189 = phi i64 [ %1181, %1178 ], [ %1187, %1182 ]
  %1190 = load %struct.regexp** %2, align 8
  %1191 = getelementptr inbounds %struct.regexp* %1190, i32 0, i32 3
  %1192 = load %struct.reg_substr_data** %1191, align 8
  %1193 = getelementptr inbounds %struct.reg_substr_data* %1192, i32 0, i32 0
  %1194 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1193, i32 0, i64 1
  %1195 = getelementptr inbounds %struct.reg_substr_datum* %1194, i32 0, i32 1
  %1196 = load i32* %1195, align 4
  %1197 = sext i32 %1196 to i64
  %1198 = icmp sgt i64 %1189, %1197
  br i1 %1198, label %1199, label %1229

; <label>:1199                                    ; preds = %1188
  %1200 = load i8* @PL_reg_match_utf8, align 1
  %1201 = sext i8 %1200 to i32
  %1202 = icmp ne i32 %1201, 0
  br i1 %1202, label %1203, label %1216

; <label>:1203                                    ; preds = %1199
  %1204 = load i8** %t, align 8
  %1205 = load %struct.regexp** %2, align 8
  %1206 = getelementptr inbounds %struct.regexp* %1205, i32 0, i32 3
  %1207 = load %struct.reg_substr_data** %1206, align 8
  %1208 = getelementptr inbounds %struct.reg_substr_data* %1207, i32 0, i32 0
  %1209 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1208, i32 0, i64 1
  %1210 = getelementptr inbounds %struct.reg_substr_datum* %1209, i32 0, i32 1
  %1211 = load i32* %1210, align 4
  %1212 = load i8** %5, align 8
  %1213 = call i32 (i8*, i32, i8*, ...)* bitcast (i32 (...)* @reghop3 to i32 (i8*, i32, i8*, ...)*)(i8* %1204, i32 %1211, i8* %1212)
  %1214 = sext i32 %1213 to i64
  %1215 = inttoptr i64 %1214 to i8*
  br label %1227

; <label>:1216                                    ; preds = %1199
  %1217 = load i8** %t, align 8
  %1218 = load %struct.regexp** %2, align 8
  %1219 = getelementptr inbounds %struct.regexp* %1218, i32 0, i32 3
  %1220 = load %struct.reg_substr_data** %1219, align 8
  %1221 = getelementptr inbounds %struct.reg_substr_data* %1220, i32 0, i32 0
  %1222 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1221, i32 0, i64 1
  %1223 = getelementptr inbounds %struct.reg_substr_datum* %1222, i32 0, i32 1
  %1224 = load i32* %1223, align 4
  %1225 = sext i32 %1224 to i64
  %1226 = getelementptr inbounds i8* %1217, i64 %1225
  br label %1227

; <label>:1227                                    ; preds = %1216, %1203
  %1228 = phi i8* [ %1215, %1203 ], [ %1226, %1216 ]
  store i8* %1228, i8** %last3, align 8
  br label %1229

; <label>:1229                                    ; preds = %1227, %1188
  %1230 = load i8* @PL_reg_match_utf8, align 1
  %1231 = sext i8 %1230 to i32
  %1232 = icmp ne i32 %1231, 0
  br i1 %1232, label %1233, label %1246

; <label>:1233                                    ; preds = %1229
  %1234 = load i8** %t, align 8
  %1235 = load %struct.regexp** %2, align 8
  %1236 = getelementptr inbounds %struct.regexp* %1235, i32 0, i32 3
  %1237 = load %struct.reg_substr_data** %1236, align 8
  %1238 = getelementptr inbounds %struct.reg_substr_data* %1237, i32 0, i32 0
  %1239 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1238, i32 0, i64 1
  %1240 = getelementptr inbounds %struct.reg_substr_datum* %1239, i32 0, i32 0
  %1241 = load i32* %1240, align 4
  %1242 = load i8** %5, align 8
  %1243 = call i32 (i8*, i32, i8*, ...)* bitcast (i32 (...)* @reghop3 to i32 (i8*, i32, i8*, ...)*)(i8* %1234, i32 %1241, i8* %1242)
  %1244 = sext i32 %1243 to i64
  %1245 = inttoptr i64 %1244 to i8*
  br label %1257

; <label>:1246                                    ; preds = %1229
  %1247 = load i8** %t, align 8
  %1248 = load %struct.regexp** %2, align 8
  %1249 = getelementptr inbounds %struct.regexp* %1248, i32 0, i32 3
  %1250 = load %struct.reg_substr_data** %1249, align 8
  %1251 = getelementptr inbounds %struct.reg_substr_data* %1250, i32 0, i32 0
  %1252 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1251, i32 0, i64 1
  %1253 = getelementptr inbounds %struct.reg_substr_datum* %1252, i32 0, i32 0
  %1254 = load i32* %1253, align 4
  %1255 = sext i32 %1254 to i64
  %1256 = getelementptr inbounds i8* %1247, i64 %1255
  br label %1257

; <label>:1257                                    ; preds = %1246, %1233
  %1258 = phi i8* [ %1245, %1233 ], [ %1256, %1246 ]
  store i8* %1258, i8** %s, align 8
  %1259 = load i8** %s, align 8
  %1260 = load i8** %other_last, align 8
  %1261 = icmp ult i8* %1259, %1260
  br i1 %1261, label %1262, label %1264

; <label>:1262                                    ; preds = %1257
  %1263 = load i8** %other_last, align 8
  store i8* %1263, i8** %s, align 8
  br label %1264

; <label>:1264                                    ; preds = %1262, %1257
  %1265 = load i32* %do_utf8, align 4
  %1266 = icmp ne i32 %1265, 0
  br i1 %1266, label %1267, label %1275

; <label>:1267                                    ; preds = %1264
  %1268 = load %struct.regexp** %2, align 8
  %1269 = getelementptr inbounds %struct.regexp* %1268, i32 0, i32 3
  %1270 = load %struct.reg_substr_data** %1269, align 8
  %1271 = getelementptr inbounds %struct.reg_substr_data* %1270, i32 0, i32 0
  %1272 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1271, i32 0, i64 1
  %1273 = getelementptr inbounds %struct.reg_substr_datum* %1272, i32 0, i32 3
  %1274 = load %struct.sv** %1273, align 8
  br label %1283

; <label>:1275                                    ; preds = %1264
  %1276 = load %struct.regexp** %2, align 8
  %1277 = getelementptr inbounds %struct.regexp* %1276, i32 0, i32 3
  %1278 = load %struct.reg_substr_data** %1277, align 8
  %1279 = getelementptr inbounds %struct.reg_substr_data* %1278, i32 0, i32 0
  %1280 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1279, i32 0, i64 1
  %1281 = getelementptr inbounds %struct.reg_substr_datum* %1280, i32 0, i32 2
  %1282 = load %struct.sv** %1281, align 8
  br label %1283

; <label>:1283                                    ; preds = %1275, %1267
  %1284 = phi %struct.sv* [ %1274, %1267 ], [ %1282, %1275 ]
  store %struct.sv* %1284, %struct.sv** %must6, align 8
  %1285 = load %struct.sv** %must6, align 8
  %1286 = icmp eq %struct.sv* %1285, @PL_sv_undef
  br i1 %1286, label %1287, label %1288

; <label>:1287                                    ; preds = %1283
  store i8* null, i8** %s, align 8
  br label %1312

; <label>:1288                                    ; preds = %1283
  %1289 = load i8** %s, align 8
  %1290 = load i8** %last3, align 8
  %1291 = load %struct.sv** %must6, align 8
  %1292 = getelementptr inbounds %struct.sv* %1291, i32 0, i32 0
  %1293 = load i8** %1292, align 8
  %1294 = bitcast i8* %1293 to %struct.xpv*
  %1295 = getelementptr inbounds %struct.xpv* %1294, i32 0, i32 1
  %1296 = load i64* %1295, align 8
  %1297 = getelementptr inbounds i8* %1290, i64 %1296
  %1298 = load %struct.sv** %must6, align 8
  %1299 = getelementptr inbounds %struct.sv* %1298, i32 0, i32 2
  %1300 = load i32* %1299, align 4
  %1301 = and i32 %1300, 1073741824
  %1302 = icmp ne i32 %1301, 0
  %1303 = zext i1 %1302 to i32
  %1304 = sext i32 %1303 to i64
  %1305 = sub i64 0, %1304
  %1306 = getelementptr inbounds i8* %1297, i64 %1305
  %1307 = load %struct.sv** %must6, align 8
  %1308 = load i32* @PL_multiline, align 4
  %1309 = icmp ne i32 %1308, 0
  %1310 = select i1 %1309, i32 1, i32 0
  %1311 = call i8* @Perl_fbm_instr(i8* %1289, i8* %1306, %struct.sv* %1307, i32 %1310)
  store i8* %1311, i8** %s, align 8
  br label %1312

; <label>:1312                                    ; preds = %1288, %1287
  %1313 = load i8** %s, align 8
  %1314 = icmp ne i8* %1313, null
  br i1 %1314, label %1336, label %1315

; <label>:1315                                    ; preds = %1312
  %1316 = load i8** %last14, align 8
  %1317 = load i8** %last3, align 8
  %1318 = icmp eq i8* %1316, %1317
  br i1 %1318, label %1319, label %1320

; <label>:1319                                    ; preds = %1315
  br label %2071

; <label>:1320                                    ; preds = %1315
  %1321 = load i8** %last3, align 8
  store i8* %1321, i8** %other_last, align 8
  %1322 = load i8* @PL_reg_match_utf8, align 1
  %1323 = sext i8 %1322 to i32
  %1324 = icmp ne i32 %1323, 0
  br i1 %1324, label %1325, label %1331

; <label>:1325                                    ; preds = %1320
  %1326 = load i8** %t, align 8
  %1327 = load i8** %5, align 8
  %1328 = call i32 (i8*, i32, i8*, ...)* bitcast (i32 (...)* @reghop3 to i32 (i8*, i32, i8*, ...)*)(i8* %1326, i32 1, i8* %1327)
  %1329 = sext i32 %1328 to i64
  %1330 = inttoptr i64 %1329 to i8*
  br label %1334

; <label>:1331                                    ; preds = %1320
  %1332 = load i8** %t, align 8
  %1333 = getelementptr inbounds i8* %1332, i64 1
  br label %1334

; <label>:1334                                    ; preds = %1331, %1325
  %1335 = phi i8* [ %1330, %1325 ], [ %1333, %1331 ]
  store i8* %1335, i8** %s, align 8
  br label %503

; <label>:1336                                    ; preds = %1312
  %1337 = load i8** %s, align 8
  store i8* %1337, i8** %other_last, align 8
  %1338 = load i8** %s15, align 8
  store i8* %1338, i8** %s, align 8
  %1339 = load i8** %t, align 8
  %1340 = load i8** %4, align 8
  %1341 = icmp eq i8* %1339, %1340
  br i1 %1341, label %1342, label %1343

; <label>:1342                                    ; preds = %1336
  br label %1498

; <label>:1343                                    ; preds = %1336
  br label %1393

; <label>:1344                                    ; preds = %705, %696, %687, %678
  %1345 = load i8** %s, align 8
  %1346 = load %struct.regexp** %2, align 8
  %1347 = getelementptr inbounds %struct.regexp* %1346, i32 0, i32 3
  %1348 = load %struct.reg_substr_data** %1347, align 8
  %1349 = getelementptr inbounds %struct.reg_substr_data* %1348, i32 0, i32 0
  %1350 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1349, i32 0, i64 2
  %1351 = getelementptr inbounds %struct.reg_substr_datum* %1350, i32 0, i32 1
  %1352 = load i32* %1351, align 4
  %1353 = sext i32 %1352 to i64
  %1354 = sub i64 0, %1353
  %1355 = getelementptr inbounds i8* %1345, i64 %1354
  store i8* %1355, i8** %t, align 8
  %1356 = load i8** %s, align 8
  %1357 = load i8** %4, align 8
  %1358 = ptrtoint i8* %1356 to i64
  %1359 = ptrtoint i8* %1357 to i64
  %1360 = sub i64 %1358, %1359
  %1361 = load %struct.regexp** %2, align 8
  %1362 = getelementptr inbounds %struct.regexp* %1361, i32 0, i32 3
  %1363 = load %struct.reg_substr_data** %1362, align 8
  %1364 = getelementptr inbounds %struct.reg_substr_data* %1363, i32 0, i32 0
  %1365 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1364, i32 0, i64 2
  %1366 = getelementptr inbounds %struct.reg_substr_datum* %1365, i32 0, i32 1
  %1367 = load i32* %1366, align 4
  %1368 = sext i32 %1367 to i64
  %1369 = icmp sgt i64 %1360, %1368
  br i1 %1369, label %1370, label %1497

; <label>:1370                                    ; preds = %1344
  %1371 = load i32* %do_utf8, align 4
  %1372 = icmp ne i32 %1371, 0
  br i1 %1372, label %1373, label %1392

; <label>:1373                                    ; preds = %1370
  %1374 = load i8** %s, align 8
  %1375 = load %struct.regexp** %2, align 8
  %1376 = getelementptr inbounds %struct.regexp* %1375, i32 0, i32 3
  %1377 = load %struct.reg_substr_data** %1376, align 8
  %1378 = getelementptr inbounds %struct.reg_substr_data* %1377, i32 0, i32 0
  %1379 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1378, i32 0, i64 2
  %1380 = getelementptr inbounds %struct.reg_substr_datum* %1379, i32 0, i32 1
  %1381 = load i32* %1380, align 4
  %1382 = sub nsw i32 0, %1381
  %1383 = load i8** %4, align 8
  %1384 = call i32 (i8*, i32, i8*, ...)* bitcast (i32 (...)* @reghopmaybe3 to i32 (i8*, i32, i8*, ...)*)(i8* %1374, i32 %1382, i8* %1383)
  %1385 = sext i32 %1384 to i64
  %1386 = inttoptr i64 %1385 to i8*
  store i8* %1386, i8** %t, align 8
  %1387 = icmp ne i8* %1386, null
  br i1 %1387, label %1388, label %1497

; <label>:1388                                    ; preds = %1373
  %1389 = load i8** %t, align 8
  %1390 = load i8** %4, align 8
  %1391 = icmp ugt i8* %1389, %1390
  br i1 %1391, label %1392, label %1497

; <label>:1392                                    ; preds = %1388, %1370
  br label %1393

; <label>:1393                                    ; preds = %2031, %1392, %1343, %1113
  %1394 = load i32* %ml_anch, align 4
  %1395 = icmp ne i32 %1394, 0
  br i1 %1395, label %1396, label %1467

; <label>:1396                                    ; preds = %1393
  %1397 = load i8** %t, align 8
  %1398 = getelementptr inbounds i8* %1397, i64 -1
  %1399 = load i8* %1398, align 1
  %1400 = sext i8 %1399 to i32
  %1401 = icmp ne i32 %1400, 10
  br i1 %1401, label %1402, label %1467

; <label>:1402                                    ; preds = %1396
  br label %1403

; <label>:1403                                    ; preds = %1526, %1402
  br label %1404

; <label>:1404                                    ; preds = %1463, %1403
  %1405 = load i8** %t, align 8
  %1406 = load i8** %5, align 8
  %1407 = load %struct.regexp** %2, align 8
  %1408 = getelementptr inbounds %struct.regexp* %1407, i32 0, i32 10
  %1409 = load i32* %1408, align 4
  %1410 = sext i32 %1409 to i64
  %1411 = sub i64 0, %1410
  %1412 = getelementptr inbounds i8* %1406, i64 %1411
  %1413 = icmp ult i8* %1405, %1412
  br i1 %1413, label %1414, label %1466

; <label>:1414                                    ; preds = %1404
  %1415 = load i8** %t, align 8
  %1416 = load i8* %1415, align 1
  %1417 = sext i8 %1416 to i32
  %1418 = icmp eq i32 %1417, 10
  br i1 %1418, label %1419, label %1463

; <label>:1419                                    ; preds = %1414
  %1420 = load i8** %t, align 8
  %1421 = load i8** %check_at, align 8
  %1422 = load %struct.regexp** %2, align 8
  %1423 = getelementptr inbounds %struct.regexp* %1422, i32 0, i32 3
  %1424 = load %struct.reg_substr_data** %1423, align 8
  %1425 = getelementptr inbounds %struct.reg_substr_data* %1424, i32 0, i32 0
  %1426 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1425, i32 0, i64 2
  %1427 = getelementptr inbounds %struct.reg_substr_datum* %1426, i32 0, i32 0
  %1428 = load i32* %1427, align 4
  %1429 = sext i32 %1428 to i64
  %1430 = sub i64 0, %1429
  %1431 = getelementptr inbounds i8* %1421, i64 %1430
  %1432 = icmp ult i8* %1420, %1431
  br i1 %1432, label %1433, label %1460

; <label>:1433                                    ; preds = %1419
  %1434 = load i32* %do_utf8, align 4
  %1435 = icmp ne i32 %1434, 0
  br i1 %1435, label %1436, label %1445

; <label>:1436                                    ; preds = %1433
  %1437 = load %struct.regexp** %2, align 8
  %1438 = getelementptr inbounds %struct.regexp* %1437, i32 0, i32 3
  %1439 = load %struct.reg_substr_data** %1438, align 8
  %1440 = getelementptr inbounds %struct.reg_substr_data* %1439, i32 0, i32 0
  %1441 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1440, i32 0, i64 0
  %1442 = getelementptr inbounds %struct.reg_substr_datum* %1441, i32 0, i32 3
  %1443 = load %struct.sv** %1442, align 8
  %1444 = icmp ne %struct.sv* %1443, null
  br i1 %1444, label %1454, label %1457

; <label>:1445                                    ; preds = %1433
  %1446 = load %struct.regexp** %2, align 8
  %1447 = getelementptr inbounds %struct.regexp* %1446, i32 0, i32 3
  %1448 = load %struct.reg_substr_data** %1447, align 8
  %1449 = getelementptr inbounds %struct.reg_substr_data* %1448, i32 0, i32 0
  %1450 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1449, i32 0, i64 0
  %1451 = getelementptr inbounds %struct.reg_substr_datum* %1450, i32 0, i32 2
  %1452 = load %struct.sv** %1451, align 8
  %1453 = icmp ne %struct.sv* %1452, null
  br i1 %1453, label %1454, label %1457

; <label>:1454                                    ; preds = %1445, %1436
  %1455 = load i8** %t, align 8
  %1456 = getelementptr inbounds i8* %1455, i64 1
  store i8* %1456, i8** %4, align 8
  br label %743

; <label>:1457                                    ; preds = %1445, %1436
  %1458 = load i8** %t, align 8
  %1459 = getelementptr inbounds i8* %1458, i64 1
  store i8* %1459, i8** %s, align 8
  br label %1470

; <label>:1460                                    ; preds = %1419
  %1461 = load i8** %t, align 8
  %1462 = getelementptr inbounds i8* %1461, i64 1
  store i8* %1462, i8** %s, align 8
  store i8* %1462, i8** %4, align 8
  store i8* %1462, i8** %other_last, align 8
  br label %503

; <label>:1463                                    ; preds = %1414
  %1464 = load i8** %t, align 8
  %1465 = getelementptr inbounds i8* %1464, i32 1
  store i8* %1465, i8** %t, align 8
  br label %1404

; <label>:1466                                    ; preds = %1404
  br label %2071

; <label>:1467                                    ; preds = %1396, %1393
  br label %1468

; <label>:1468                                    ; preds = %1467
  %1469 = load i8** %t, align 8
  store i8* %1469, i8** %s, align 8
  br label %1470

; <label>:1470                                    ; preds = %1468, %1457
  %1471 = load i32* %do_utf8, align 4
  %1472 = icmp ne i32 %1471, 0
  br i1 %1472, label %1473, label %1481

; <label>:1473                                    ; preds = %1470
  %1474 = load %struct.regexp** %2, align 8
  %1475 = getelementptr inbounds %struct.regexp* %1474, i32 0, i32 3
  %1476 = load %struct.reg_substr_data** %1475, align 8
  %1477 = getelementptr inbounds %struct.reg_substr_data* %1476, i32 0, i32 0
  %1478 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1477, i32 0, i64 2
  %1479 = getelementptr inbounds %struct.reg_substr_datum* %1478, i32 0, i32 3
  %1480 = load %struct.sv** %1479, align 8
  br label %1489

; <label>:1481                                    ; preds = %1470
  %1482 = load %struct.regexp** %2, align 8
  %1483 = getelementptr inbounds %struct.regexp* %1482, i32 0, i32 3
  %1484 = load %struct.reg_substr_data** %1483, align 8
  %1485 = getelementptr inbounds %struct.reg_substr_data* %1484, i32 0, i32 0
  %1486 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1485, i32 0, i64 2
  %1487 = getelementptr inbounds %struct.reg_substr_datum* %1486, i32 0, i32 2
  %1488 = load %struct.sv** %1487, align 8
  br label %1489

; <label>:1489                                    ; preds = %1481, %1473
  %1490 = phi %struct.sv* [ %1480, %1473 ], [ %1488, %1481 ]
  %1491 = getelementptr inbounds %struct.sv* %1490, i32 0, i32 0
  %1492 = load i8** %1491, align 8
  %1493 = bitcast i8* %1492 to %struct.xpvbm*
  %1494 = getelementptr inbounds %struct.xpvbm* %1493, i32 0, i32 7
  %1495 = load i32* %1494, align 4
  %1496 = add nsw i32 %1495, 1
  store i32 %1496, i32* %1494, align 4
  br label %1713

; <label>:1497                                    ; preds = %1388, %1373, %1344
  br label %1498

; <label>:1498                                    ; preds = %1497, %1342, %1112
  %1499 = load i32* %ml_anch, align 4
  %1500 = icmp ne i32 %1499, 0
  br i1 %1500, label %1501, label %1528

; <label>:1501                                    ; preds = %1498
  %1502 = load %struct.sv** %3, align 8
  %1503 = icmp ne %struct.sv* %1502, null
  br i1 %1503, label %1504, label %1528

; <label>:1504                                    ; preds = %1501
  %1505 = load %struct.sv** %3, align 8
  %1506 = getelementptr inbounds %struct.sv* %1505, i32 0, i32 2
  %1507 = load i32* %1506, align 4
  %1508 = and i32 %1507, 524288
  %1509 = icmp ne i32 %1508, 0
  br i1 %1509, label %1528, label %1510

; <label>:1510                                    ; preds = %1504
  %1511 = load i8** %4, align 8
  %1512 = load i8** %strbeg, align 8
  %1513 = icmp ne i8* %1511, %1512
  br i1 %1513, label %1514, label %1528

; <label>:1514                                    ; preds = %1510
  %1515 = load i8** %4, align 8
  %1516 = getelementptr inbounds i8* %1515, i64 -1
  %1517 = load i8* %1516, align 1
  %1518 = sext i8 %1517 to i32
  %1519 = icmp ne i32 %1518, 10
  br i1 %1519, label %1520, label %1528

; <label>:1520                                    ; preds = %1514
  %1521 = load %struct.regexp** %2, align 8
  %1522 = getelementptr inbounds %struct.regexp* %1521, i32 0, i32 15
  %1523 = load i32* %1522, align 4
  %1524 = and i32 %1523, 32
  %1525 = icmp ne i32 %1524, 0
  br i1 %1525, label %1528, label %1526

; <label>:1526                                    ; preds = %1520
  %1527 = load i8** %4, align 8
  store i8* %1527, i8** %t, align 8
  br label %1403

; <label>:1528                                    ; preds = %1520, %1514, %1510, %1504, %1501, %1498
  br label %1529

; <label>:1529                                    ; preds = %1528, %361
  %1530 = load %struct.regexp** %2, align 8
  %1531 = getelementptr inbounds %struct.regexp* %1530, i32 0, i32 15
  %1532 = load i32* %1531, align 4
  %1533 = and i32 %1532, 131072
  %1534 = icmp ne i32 %1533, 0
  br i1 %1534, label %1710, label %1535

; <label>:1535                                    ; preds = %1529
  %1536 = load i32* %do_utf8, align 4
  %1537 = icmp ne i32 %1536, 0
  br i1 %1537, label %1538, label %1578

; <label>:1538                                    ; preds = %1535
  %1539 = load %struct.regexp** %2, align 8
  %1540 = getelementptr inbounds %struct.regexp* %1539, i32 0, i32 3
  %1541 = load %struct.reg_substr_data** %1540, align 8
  %1542 = getelementptr inbounds %struct.reg_substr_data* %1541, i32 0, i32 0
  %1543 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1542, i32 0, i64 2
  %1544 = getelementptr inbounds %struct.reg_substr_datum* %1543, i32 0, i32 3
  %1545 = load %struct.sv** %1544, align 8
  %1546 = icmp ne %struct.sv* %1545, null
  br i1 %1546, label %1547, label %1710

; <label>:1547                                    ; preds = %1538
  %1548 = load %struct.regexp** %2, align 8
  %1549 = getelementptr inbounds %struct.regexp* %1548, i32 0, i32 3
  %1550 = load %struct.reg_substr_data** %1549, align 8
  %1551 = getelementptr inbounds %struct.reg_substr_data* %1550, i32 0, i32 0
  %1552 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1551, i32 0, i64 2
  %1553 = getelementptr inbounds %struct.reg_substr_datum* %1552, i32 0, i32 3
  %1554 = load %struct.sv** %1553, align 8
  %1555 = getelementptr inbounds %struct.sv* %1554, i32 0, i32 0
  %1556 = load i8** %1555, align 8
  %1557 = bitcast i8* %1556 to %struct.xpvbm*
  %1558 = getelementptr inbounds %struct.xpvbm* %1557, i32 0, i32 7
  %1559 = load i32* %1558, align 4
  %1560 = add nsw i32 %1559, -1
  store i32 %1560, i32* %1558, align 4
  %1561 = icmp slt i32 %1560, 0
  br i1 %1561, label %1562, label %1710

; <label>:1562                                    ; preds = %1547
  %1563 = load %struct.regexp** %2, align 8
  %1564 = getelementptr inbounds %struct.regexp* %1563, i32 0, i32 3
  %1565 = load %struct.reg_substr_data** %1564, align 8
  %1566 = getelementptr inbounds %struct.reg_substr_data* %1565, i32 0, i32 0
  %1567 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1566, i32 0, i64 2
  %1568 = getelementptr inbounds %struct.reg_substr_datum* %1567, i32 0, i32 3
  %1569 = load %struct.sv** %1568, align 8
  %1570 = load %struct.regexp** %2, align 8
  %1571 = getelementptr inbounds %struct.regexp* %1570, i32 0, i32 3
  %1572 = load %struct.reg_substr_data** %1571, align 8
  %1573 = getelementptr inbounds %struct.reg_substr_data* %1572, i32 0, i32 0
  %1574 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1573, i32 0, i64 1
  %1575 = getelementptr inbounds %struct.reg_substr_datum* %1574, i32 0, i32 3
  %1576 = load %struct.sv** %1575, align 8
  %1577 = icmp eq %struct.sv* %1569, %1576
  br i1 %1577, label %1618, label %1710

; <label>:1578                                    ; preds = %1535
  %1579 = load %struct.regexp** %2, align 8
  %1580 = getelementptr inbounds %struct.regexp* %1579, i32 0, i32 3
  %1581 = load %struct.reg_substr_data** %1580, align 8
  %1582 = getelementptr inbounds %struct.reg_substr_data* %1581, i32 0, i32 0
  %1583 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1582, i32 0, i64 2
  %1584 = getelementptr inbounds %struct.reg_substr_datum* %1583, i32 0, i32 2
  %1585 = load %struct.sv** %1584, align 8
  %1586 = icmp ne %struct.sv* %1585, null
  br i1 %1586, label %1587, label %1710

; <label>:1587                                    ; preds = %1578
  %1588 = load %struct.regexp** %2, align 8
  %1589 = getelementptr inbounds %struct.regexp* %1588, i32 0, i32 3
  %1590 = load %struct.reg_substr_data** %1589, align 8
  %1591 = getelementptr inbounds %struct.reg_substr_data* %1590, i32 0, i32 0
  %1592 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1591, i32 0, i64 2
  %1593 = getelementptr inbounds %struct.reg_substr_datum* %1592, i32 0, i32 2
  %1594 = load %struct.sv** %1593, align 8
  %1595 = getelementptr inbounds %struct.sv* %1594, i32 0, i32 0
  %1596 = load i8** %1595, align 8
  %1597 = bitcast i8* %1596 to %struct.xpvbm*
  %1598 = getelementptr inbounds %struct.xpvbm* %1597, i32 0, i32 7
  %1599 = load i32* %1598, align 4
  %1600 = add nsw i32 %1599, -1
  store i32 %1600, i32* %1598, align 4
  %1601 = icmp slt i32 %1600, 0
  br i1 %1601, label %1602, label %1710

; <label>:1602                                    ; preds = %1587
  %1603 = load %struct.regexp** %2, align 8
  %1604 = getelementptr inbounds %struct.regexp* %1603, i32 0, i32 3
  %1605 = load %struct.reg_substr_data** %1604, align 8
  %1606 = getelementptr inbounds %struct.reg_substr_data* %1605, i32 0, i32 0
  %1607 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1606, i32 0, i64 2
  %1608 = getelementptr inbounds %struct.reg_substr_datum* %1607, i32 0, i32 2
  %1609 = load %struct.sv** %1608, align 8
  %1610 = load %struct.regexp** %2, align 8
  %1611 = getelementptr inbounds %struct.regexp* %1610, i32 0, i32 3
  %1612 = load %struct.reg_substr_data** %1611, align 8
  %1613 = getelementptr inbounds %struct.reg_substr_data* %1612, i32 0, i32 0
  %1614 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1613, i32 0, i64 1
  %1615 = getelementptr inbounds %struct.reg_substr_datum* %1614, i32 0, i32 2
  %1616 = load %struct.sv** %1615, align 8
  %1617 = icmp eq %struct.sv* %1609, %1616
  br i1 %1617, label %1618, label %1710

; <label>:1618                                    ; preds = %1602, %1562
  %1619 = load i32* %do_utf8, align 4
  %1620 = icmp ne i32 %1619, 0
  br i1 %1620, label %1621, label %1629

; <label>:1621                                    ; preds = %1618
  %1622 = load %struct.regexp** %2, align 8
  %1623 = getelementptr inbounds %struct.regexp* %1622, i32 0, i32 3
  %1624 = load %struct.reg_substr_data** %1623, align 8
  %1625 = getelementptr inbounds %struct.reg_substr_data* %1624, i32 0, i32 0
  %1626 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1625, i32 0, i64 2
  %1627 = getelementptr inbounds %struct.reg_substr_datum* %1626, i32 0, i32 3
  %1628 = load %struct.sv** %1627, align 8
  br label %1637

; <label>:1629                                    ; preds = %1618
  %1630 = load %struct.regexp** %2, align 8
  %1631 = getelementptr inbounds %struct.regexp* %1630, i32 0, i32 3
  %1632 = load %struct.reg_substr_data** %1631, align 8
  %1633 = getelementptr inbounds %struct.reg_substr_data* %1632, i32 0, i32 0
  %1634 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1633, i32 0, i64 2
  %1635 = getelementptr inbounds %struct.reg_substr_datum* %1634, i32 0, i32 2
  %1636 = load %struct.sv** %1635, align 8
  br label %1637

; <label>:1637                                    ; preds = %1629, %1621
  %1638 = phi %struct.sv* [ %1628, %1621 ], [ %1636, %1629 ]
  call void @Perl_sv_free(%struct.sv* %1638)
  %1639 = load i32* %do_utf8, align 4
  %1640 = icmp ne i32 %1639, 0
  br i1 %1640, label %1641, label %1650

; <label>:1641                                    ; preds = %1637
  %1642 = load %struct.regexp** %2, align 8
  %1643 = getelementptr inbounds %struct.regexp* %1642, i32 0, i32 3
  %1644 = load %struct.reg_substr_data** %1643, align 8
  %1645 = getelementptr inbounds %struct.reg_substr_data* %1644, i32 0, i32 0
  %1646 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1645, i32 0, i64 2
  %1647 = getelementptr inbounds %struct.reg_substr_datum* %1646, i32 0, i32 2
  %1648 = load %struct.sv** %1647, align 8
  %1649 = icmp ne %struct.sv* %1648, null
  br i1 %1649, label %1659, label %1680

; <label>:1650                                    ; preds = %1637
  %1651 = load %struct.regexp** %2, align 8
  %1652 = getelementptr inbounds %struct.regexp* %1651, i32 0, i32 3
  %1653 = load %struct.reg_substr_data** %1652, align 8
  %1654 = getelementptr inbounds %struct.reg_substr_data* %1653, i32 0, i32 0
  %1655 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1654, i32 0, i64 2
  %1656 = getelementptr inbounds %struct.reg_substr_datum* %1655, i32 0, i32 3
  %1657 = load %struct.sv** %1656, align 8
  %1658 = icmp ne %struct.sv* %1657, null
  br i1 %1658, label %1659, label %1680

; <label>:1659                                    ; preds = %1650, %1641
  %1660 = load i32* %do_utf8, align 4
  %1661 = icmp ne i32 %1660, 0
  br i1 %1661, label %1662, label %1670

; <label>:1662                                    ; preds = %1659
  %1663 = load %struct.regexp** %2, align 8
  %1664 = getelementptr inbounds %struct.regexp* %1663, i32 0, i32 3
  %1665 = load %struct.reg_substr_data** %1664, align 8
  %1666 = getelementptr inbounds %struct.reg_substr_data* %1665, i32 0, i32 0
  %1667 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1666, i32 0, i64 2
  %1668 = getelementptr inbounds %struct.reg_substr_datum* %1667, i32 0, i32 2
  %1669 = load %struct.sv** %1668, align 8
  br label %1678

; <label>:1670                                    ; preds = %1659
  %1671 = load %struct.regexp** %2, align 8
  %1672 = getelementptr inbounds %struct.regexp* %1671, i32 0, i32 3
  %1673 = load %struct.reg_substr_data** %1672, align 8
  %1674 = getelementptr inbounds %struct.reg_substr_data* %1673, i32 0, i32 0
  %1675 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1674, i32 0, i64 2
  %1676 = getelementptr inbounds %struct.reg_substr_datum* %1675, i32 0, i32 3
  %1677 = load %struct.sv** %1676, align 8
  br label %1678

; <label>:1678                                    ; preds = %1670, %1662
  %1679 = phi %struct.sv* [ %1669, %1662 ], [ %1677, %1670 ]
  call void @Perl_sv_free(%struct.sv* %1679)
  br label %1680

; <label>:1680                                    ; preds = %1678, %1650, %1641
  %1681 = load %struct.regexp** %2, align 8
  %1682 = getelementptr inbounds %struct.regexp* %1681, i32 0, i32 3
  %1683 = load %struct.reg_substr_data** %1682, align 8
  %1684 = getelementptr inbounds %struct.reg_substr_data* %1683, i32 0, i32 0
  %1685 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1684, i32 0, i64 2
  %1686 = getelementptr inbounds %struct.reg_substr_datum* %1685, i32 0, i32 3
  store %struct.sv* null, %struct.sv** %1686, align 8
  %1687 = load %struct.regexp** %2, align 8
  %1688 = getelementptr inbounds %struct.regexp* %1687, i32 0, i32 3
  %1689 = load %struct.reg_substr_data** %1688, align 8
  %1690 = getelementptr inbounds %struct.reg_substr_data* %1689, i32 0, i32 0
  %1691 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1690, i32 0, i64 2
  %1692 = getelementptr inbounds %struct.reg_substr_datum* %1691, i32 0, i32 2
  store %struct.sv* null, %struct.sv** %1692, align 8
  %1693 = load %struct.regexp** %2, align 8
  %1694 = getelementptr inbounds %struct.regexp* %1693, i32 0, i32 3
  %1695 = load %struct.reg_substr_data** %1694, align 8
  %1696 = getelementptr inbounds %struct.reg_substr_data* %1695, i32 0, i32 0
  %1697 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1696, i32 0, i64 1
  %1698 = getelementptr inbounds %struct.reg_substr_datum* %1697, i32 0, i32 3
  store %struct.sv* null, %struct.sv** %1698, align 8
  %1699 = load %struct.regexp** %2, align 8
  %1700 = getelementptr inbounds %struct.regexp* %1699, i32 0, i32 3
  %1701 = load %struct.reg_substr_data** %1700, align 8
  %1702 = getelementptr inbounds %struct.reg_substr_data* %1701, i32 0, i32 0
  %1703 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1702, i32 0, i64 1
  %1704 = getelementptr inbounds %struct.reg_substr_datum* %1703, i32 0, i32 2
  store %struct.sv* null, %struct.sv** %1704, align 8
  store %struct.sv* null, %struct.sv** %check, align 8
  %1705 = load i8** %4, align 8
  store i8* %1705, i8** %s, align 8
  %1706 = load %struct.regexp** %2, align 8
  %1707 = getelementptr inbounds %struct.regexp* %1706, i32 0, i32 15
  %1708 = load i32* %1707, align 4
  %1709 = and i32 %1708, -3145729
  store i32 %1709, i32* %1707, align 4
  br label %1712

; <label>:1710                                    ; preds = %1602, %1587, %1578, %1562, %1547, %1538, %1529
  %1711 = load i8** %4, align 8
  store i8* %1711, i8** %s, align 8
  br label %1712

; <label>:1712                                    ; preds = %1710, %1680
  br label %1713

; <label>:1713                                    ; preds = %1712, %1489
  %1714 = load %struct.regexp** %2, align 8
  %1715 = getelementptr inbounds %struct.regexp* %1714, i32 0, i32 2
  %1716 = load %struct.regnode** %1715, align 8
  %1717 = icmp ne %struct.regnode* %1716, null
  br i1 %1717, label %1718, label %2068

; <label>:1718                                    ; preds = %1713
  %1719 = load %struct.regexp** %2, align 8
  %1720 = getelementptr inbounds %struct.regexp* %1719, i32 0, i32 2
  %1721 = load %struct.regnode** %1720, align 8
  %1722 = bitcast %struct.regnode* %1721 to %struct.regnode_string*
  %1723 = getelementptr inbounds %struct.regnode_string* %1722, i32 0, i32 3
  %1724 = getelementptr inbounds [1 x i8]* %1723, i32 0, i32 0
  store i8* %1724, i8** %str, align 8
  %1725 = load %struct.regexp** %2, align 8
  %1726 = getelementptr inbounds %struct.regexp* %1725, i32 0, i32 2
  %1727 = load %struct.regnode** %1726, align 8
  %1728 = getelementptr inbounds %struct.regnode* %1727, i32 0, i32 1
  %1729 = load i8* %1728, align 1
  %1730 = zext i8 %1729 to i64
  %1731 = getelementptr inbounds [0 x i8]* @PL_regkind, i32 0, i64 %1730
  %1732 = load i8* %1731, align 1
  %1733 = zext i8 %1732 to i32
  %1734 = icmp eq i32 %1733, 33
  br i1 %1734, label %1735, label %1769

; <label>:1735                                    ; preds = %1718
  %1736 = load i8* @PL_reg_match_utf8, align 1
  %1737 = sext i8 %1736 to i32
  %1738 = icmp ne i32 %1737, 0
  br i1 %1738, label %1739, label %1752

; <label>:1739                                    ; preds = %1735
  %1740 = load i8** %str, align 8
  %1741 = load %struct.regexp** %2, align 8
  %1742 = getelementptr inbounds %struct.regexp* %1741, i32 0, i32 2
  %1743 = load %struct.regnode** %1742, align 8
  %1744 = bitcast %struct.regnode* %1743 to %struct.regnode_string*
  %1745 = getelementptr inbounds %struct.regnode_string* %1744, i32 0, i32 0
  %1746 = load i8* %1745, align 1
  %1747 = zext i8 %1746 to i32
  %1748 = sext i32 %1747 to i64
  %1749 = getelementptr inbounds i8* %1740, i64 %1748
  %1750 = load i8** %str, align 8
  %1751 = call i64 @Perl_utf8_distance(i8* %1749, i8* %1750)
  br label %1767

; <label>:1752                                    ; preds = %1735
  %1753 = load i8** %str, align 8
  %1754 = load %struct.regexp** %2, align 8
  %1755 = getelementptr inbounds %struct.regexp* %1754, i32 0, i32 2
  %1756 = load %struct.regnode** %1755, align 8
  %1757 = bitcast %struct.regnode* %1756 to %struct.regnode_string*
  %1758 = getelementptr inbounds %struct.regnode_string* %1757, i32 0, i32 0
  %1759 = load i8* %1758, align 1
  %1760 = zext i8 %1759 to i32
  %1761 = sext i32 %1760 to i64
  %1762 = getelementptr inbounds i8* %1753, i64 %1761
  %1763 = load i8** %str, align 8
  %1764 = ptrtoint i8* %1762 to i64
  %1765 = ptrtoint i8* %1763 to i64
  %1766 = sub i64 %1764, %1765
  br label %1767

; <label>:1767                                    ; preds = %1752, %1739
  %1768 = phi i64 [ %1751, %1739 ], [ %1766, %1752 ]
  br label %1770

; <label>:1769                                    ; preds = %1718
  br label %1770

; <label>:1770                                    ; preds = %1769, %1767
  %1771 = phi i64 [ %1768, %1767 ], [ 1, %1769 ]
  %1772 = trunc i64 %1771 to i32
  store i32 %1772, i32* %cl_l, align 4
  %1773 = load %struct.regexp** %2, align 8
  %1774 = getelementptr inbounds %struct.regexp* %1773, i32 0, i32 3
  %1775 = load %struct.reg_substr_data** %1774, align 8
  %1776 = getelementptr inbounds %struct.reg_substr_data* %1775, i32 0, i32 0
  %1777 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1776, i32 0, i64 0
  %1778 = getelementptr inbounds %struct.reg_substr_datum* %1777, i32 0, i32 2
  %1779 = load %struct.sv** %1778, align 8
  %1780 = icmp ne %struct.sv* %1779, null
  br i1 %1780, label %1793, label %1781

; <label>:1781                                    ; preds = %1770
  %1782 = load %struct.regexp** %2, align 8
  %1783 = getelementptr inbounds %struct.regexp* %1782, i32 0, i32 3
  %1784 = load %struct.reg_substr_data** %1783, align 8
  %1785 = getelementptr inbounds %struct.reg_substr_data* %1784, i32 0, i32 0
  %1786 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1785, i32 0, i64 0
  %1787 = getelementptr inbounds %struct.reg_substr_datum* %1786, i32 0, i32 3
  %1788 = load %struct.sv** %1787, align 8
  %1789 = icmp ne %struct.sv* %1788, null
  br i1 %1789, label %1793, label %1790

; <label>:1790                                    ; preds = %1781
  %1791 = load i32* %ml_anch, align 4
  %1792 = icmp ne i32 %1791, 0
  br i1 %1792, label %1793, label %1827

; <label>:1793                                    ; preds = %1790, %1781, %1770
  %1794 = load i8* @PL_reg_match_utf8, align 1
  %1795 = sext i8 %1794 to i32
  %1796 = icmp ne i32 %1795, 0
  br i1 %1796, label %1797, label %1812

; <label>:1797                                    ; preds = %1793
  %1798 = load i8** %s, align 8
  %1799 = load %struct.regexp** %2, align 8
  %1800 = getelementptr inbounds %struct.regexp* %1799, i32 0, i32 10
  %1801 = load i32* %1800, align 4
  %1802 = icmp ne i32 %1801, 0
  br i1 %1802, label %1803, label %1805

; <label>:1803                                    ; preds = %1797
  %1804 = load i32* %cl_l, align 4
  br label %1806

; <label>:1805                                    ; preds = %1797
  br label %1806

; <label>:1806                                    ; preds = %1805, %1803
  %1807 = phi i32 [ %1804, %1803 ], [ 0, %1805 ]
  %1808 = load i8** %5, align 8
  %1809 = call i32 (i8*, i32, i8*, ...)* bitcast (i32 (...)* @reghop3 to i32 (i8*, i32, i8*, ...)*)(i8* %1798, i32 %1807, i8* %1808)
  %1810 = sext i32 %1809 to i64
  %1811 = inttoptr i64 %1810 to i8*
  br label %1825

; <label>:1812                                    ; preds = %1793
  %1813 = load i8** %s, align 8
  %1814 = load %struct.regexp** %2, align 8
  %1815 = getelementptr inbounds %struct.regexp* %1814, i32 0, i32 10
  %1816 = load i32* %1815, align 4
  %1817 = icmp ne i32 %1816, 0
  br i1 %1817, label %1818, label %1820

; <label>:1818                                    ; preds = %1812
  %1819 = load i32* %cl_l, align 4
  br label %1821

; <label>:1820                                    ; preds = %1812
  br label %1821

; <label>:1821                                    ; preds = %1820, %1818
  %1822 = phi i32 [ %1819, %1818 ], [ 0, %1820 ]
  %1823 = sext i32 %1822 to i64
  %1824 = getelementptr inbounds i8* %1813, i64 %1823
  br label %1825

; <label>:1825                                    ; preds = %1821, %1806
  %1826 = phi i8* [ %1811, %1806 ], [ %1824, %1821 ]
  br label %1903

; <label>:1827                                    ; preds = %1790
  %1828 = load %struct.regexp** %2, align 8
  %1829 = getelementptr inbounds %struct.regexp* %1828, i32 0, i32 3
  %1830 = load %struct.reg_substr_data** %1829, align 8
  %1831 = getelementptr inbounds %struct.reg_substr_data* %1830, i32 0, i32 0
  %1832 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1831, i32 0, i64 1
  %1833 = getelementptr inbounds %struct.reg_substr_datum* %1832, i32 0, i32 2
  %1834 = load %struct.sv** %1833, align 8
  %1835 = icmp ne %struct.sv* %1834, null
  br i1 %1835, label %1845, label %1836

; <label>:1836                                    ; preds = %1827
  %1837 = load %struct.regexp** %2, align 8
  %1838 = getelementptr inbounds %struct.regexp* %1837, i32 0, i32 3
  %1839 = load %struct.reg_substr_data** %1838, align 8
  %1840 = getelementptr inbounds %struct.reg_substr_data* %1839, i32 0, i32 0
  %1841 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1840, i32 0, i64 1
  %1842 = getelementptr inbounds %struct.reg_substr_datum* %1841, i32 0, i32 3
  %1843 = load %struct.sv** %1842, align 8
  %1844 = icmp ne %struct.sv* %1843, null
  br i1 %1844, label %1845, label %1899

; <label>:1845                                    ; preds = %1836, %1827
  %1846 = load i8* @PL_reg_match_utf8, align 1
  %1847 = sext i8 %1846 to i32
  %1848 = icmp ne i32 %1847, 0
  br i1 %1848, label %1849, label %1874

; <label>:1849                                    ; preds = %1845
  %1850 = load i8* @PL_reg_match_utf8, align 1
  %1851 = sext i8 %1850 to i32
  %1852 = icmp ne i32 %1851, 0
  br i1 %1852, label %1853, label %1861

; <label>:1853                                    ; preds = %1849
  %1854 = load i8** %check_at, align 8
  %1855 = load i32* %start_shift, align 4
  %1856 = sub nsw i32 0, %1855
  %1857 = load i8** %strbeg, align 8
  %1858 = call i32 (i8*, i32, i8*, ...)* bitcast (i32 (...)* @reghop3 to i32 (i8*, i32, i8*, ...)*)(i8* %1854, i32 %1856, i8* %1857)
  %1859 = sext i32 %1858 to i64
  %1860 = inttoptr i64 %1859 to i8*
  br label %1867

; <label>:1861                                    ; preds = %1849
  %1862 = load i8** %check_at, align 8
  %1863 = load i32* %start_shift, align 4
  %1864 = sub nsw i32 0, %1863
  %1865 = sext i32 %1864 to i64
  %1866 = getelementptr inbounds i8* %1862, i64 %1865
  br label %1867

; <label>:1867                                    ; preds = %1861, %1853
  %1868 = phi i8* [ %1860, %1853 ], [ %1866, %1861 ]
  %1869 = load i32* %cl_l, align 4
  %1870 = load i8** %5, align 8
  %1871 = call i32 (i8*, i32, i8*, ...)* bitcast (i32 (...)* @reghop3 to i32 (i8*, i32, i8*, ...)*)(i8* %1868, i32 %1869, i8* %1870)
  %1872 = sext i32 %1871 to i64
  %1873 = inttoptr i64 %1872 to i8*
  br label %1897

; <label>:1874                                    ; preds = %1845
  %1875 = load i8* @PL_reg_match_utf8, align 1
  %1876 = sext i8 %1875 to i32
  %1877 = icmp ne i32 %1876, 0
  br i1 %1877, label %1878, label %1886

; <label>:1878                                    ; preds = %1874
  %1879 = load i8** %check_at, align 8
  %1880 = load i32* %start_shift, align 4
  %1881 = sub nsw i32 0, %1880
  %1882 = load i8** %strbeg, align 8
  %1883 = call i32 (i8*, i32, i8*, ...)* bitcast (i32 (...)* @reghop3 to i32 (i8*, i32, i8*, ...)*)(i8* %1879, i32 %1881, i8* %1882)
  %1884 = sext i32 %1883 to i64
  %1885 = inttoptr i64 %1884 to i8*
  br label %1892

; <label>:1886                                    ; preds = %1874
  %1887 = load i8** %check_at, align 8
  %1888 = load i32* %start_shift, align 4
  %1889 = sub nsw i32 0, %1888
  %1890 = sext i32 %1889 to i64
  %1891 = getelementptr inbounds i8* %1887, i64 %1890
  br label %1892

; <label>:1892                                    ; preds = %1886, %1878
  %1893 = phi i8* [ %1885, %1878 ], [ %1891, %1886 ]
  %1894 = load i32* %cl_l, align 4
  %1895 = sext i32 %1894 to i64
  %1896 = getelementptr inbounds i8* %1893, i64 %1895
  br label %1897

; <label>:1897                                    ; preds = %1892, %1867
  %1898 = phi i8* [ %1873, %1867 ], [ %1896, %1892 ]
  br label %1901

; <label>:1899                                    ; preds = %1836
  %1900 = load i8** %5, align 8
  br label %1901

; <label>:1901                                    ; preds = %1899, %1897
  %1902 = phi i8* [ %1898, %1897 ], [ %1900, %1899 ]
  br label %1903

; <label>:1903                                    ; preds = %1901, %1825
  %1904 = phi i8* [ %1826, %1825 ], [ %1902, %1901 ]
  store i8* %1904, i8** %endpos, align 8
  %1905 = load i8** %strbeg, align 8
  store i8* %1905, i8** %startpos, align 8
  %1906 = load i8** %s, align 8
  store i8* %1906, i8** %t, align 8
  %1907 = load %struct.regexp** %2, align 8
  %1908 = call i32 (%struct.regexp*, ...)* bitcast (i32 (...)* @cache_re to i32 (%struct.regexp*, ...)*)(%struct.regexp* %1907)
  %1909 = load %struct.regexp** %2, align 8
  %1910 = load %struct.regexp** %2, align 8
  %1911 = getelementptr inbounds %struct.regexp* %1910, i32 0, i32 2
  %1912 = load %struct.regnode** %1911, align 8
  %1913 = load i8** %s, align 8
  %1914 = load i8** %endpos, align 8
  %1915 = load i8** %startpos, align 8
  %1916 = call i32 (%struct.regexp*, %struct.regnode*, i8*, i8*, i8*, i32, ...)* bitcast (i32 (...)* @find_byclass to i32 (%struct.regexp*, %struct.regnode*, i8*, i8*, i8*, i32, ...)*)(%struct.regexp* %1909, %struct.regnode* %1912, i8* %1913, i8* %1914, i8* %1915, i32 1)
  %1917 = sext i32 %1916 to i64
  %1918 = inttoptr i64 %1917 to i8*
  store i8* %1918, i8** %s, align 8
  %1919 = load i8** %s, align 8
  %1920 = icmp ne i8* %1919, null
  br i1 %1920, label %2061, label %1921

; <label>:1921                                    ; preds = %1903
  %1922 = load i8** %endpos, align 8
  %1923 = load i8** %5, align 8
  %1924 = icmp eq i8* %1922, %1923
  br i1 %1924, label %1925, label %1926

; <label>:1925                                    ; preds = %1921
  br label %2117

; <label>:1926                                    ; preds = %1921
  %1927 = load %struct.regexp** %2, align 8
  %1928 = getelementptr inbounds %struct.regexp* %1927, i32 0, i32 15
  %1929 = load i32* %1928, align 4
  %1930 = and i32 %1929, 15
  %1931 = icmp ne i32 %1930, 0
  br i1 %1931, label %1932, label %1936

; <label>:1932                                    ; preds = %1926
  %1933 = load i32* %ml_anch, align 4
  %1934 = icmp ne i32 %1933, 0
  br i1 %1934, label %1936, label %1935

; <label>:1935                                    ; preds = %1932
  br label %2117

; <label>:1936                                    ; preds = %1932, %1926
  %1937 = load %struct.regexp** %2, align 8
  %1938 = getelementptr inbounds %struct.regexp* %1937, i32 0, i32 3
  %1939 = load %struct.reg_substr_data** %1938, align 8
  %1940 = getelementptr inbounds %struct.reg_substr_data* %1939, i32 0, i32 0
  %1941 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1940, i32 0, i64 0
  %1942 = getelementptr inbounds %struct.reg_substr_datum* %1941, i32 0, i32 2
  %1943 = load %struct.sv** %1942, align 8
  %1944 = icmp ne %struct.sv* %1943, null
  br i1 %1944, label %1954, label %1945

; <label>:1945                                    ; preds = %1936
  %1946 = load %struct.regexp** %2, align 8
  %1947 = getelementptr inbounds %struct.regexp* %1946, i32 0, i32 3
  %1948 = load %struct.reg_substr_data** %1947, align 8
  %1949 = getelementptr inbounds %struct.reg_substr_data* %1948, i32 0, i32 0
  %1950 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1949, i32 0, i64 0
  %1951 = getelementptr inbounds %struct.reg_substr_datum* %1950, i32 0, i32 3
  %1952 = load %struct.sv** %1951, align 8
  %1953 = icmp ne %struct.sv* %1952, null
  br i1 %1953, label %1954, label %2022

; <label>:1954                                    ; preds = %1945, %1936
  %1955 = load i32* %do_utf8, align 4
  %1956 = icmp ne i32 %1955, 0
  br i1 %1956, label %1957, label %1965

; <label>:1957                                    ; preds = %1954
  %1958 = load %struct.regexp** %2, align 8
  %1959 = getelementptr inbounds %struct.regexp* %1958, i32 0, i32 3
  %1960 = load %struct.reg_substr_data** %1959, align 8
  %1961 = getelementptr inbounds %struct.reg_substr_data* %1960, i32 0, i32 0
  %1962 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1961, i32 0, i64 0
  %1963 = getelementptr inbounds %struct.reg_substr_datum* %1962, i32 0, i32 3
  %1964 = load %struct.sv** %1963, align 8
  br label %1973

; <label>:1965                                    ; preds = %1954
  %1966 = load %struct.regexp** %2, align 8
  %1967 = getelementptr inbounds %struct.regexp* %1966, i32 0, i32 3
  %1968 = load %struct.reg_substr_data** %1967, align 8
  %1969 = getelementptr inbounds %struct.reg_substr_data* %1968, i32 0, i32 0
  %1970 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1969, i32 0, i64 0
  %1971 = getelementptr inbounds %struct.reg_substr_datum* %1970, i32 0, i32 2
  %1972 = load %struct.sv** %1971, align 8
  br label %1973

; <label>:1973                                    ; preds = %1965, %1957
  %1974 = phi %struct.sv* [ %1964, %1957 ], [ %1972, %1965 ]
  %1975 = load %struct.sv** %check, align 8
  %1976 = icmp eq %struct.sv* %1974, %1975
  br i1 %1976, label %1977, label %2008

; <label>:1977                                    ; preds = %1973
  br label %1978

; <label>:1978                                    ; preds = %2055, %1977
  %1979 = load i8* @PL_reg_match_utf8, align 1
  %1980 = sext i8 %1979 to i32
  %1981 = icmp ne i32 %1980, 0
  br i1 %1981, label %1982, label %1988

; <label>:1982                                    ; preds = %1978
  %1983 = load i8** %t, align 8
  %1984 = load i8** %5, align 8
  %1985 = call i32 (i8*, i32, i8*, ...)* bitcast (i32 (...)* @reghop3 to i32 (i8*, i32, i8*, ...)*)(i8* %1983, i32 1, i8* %1984)
  %1986 = sext i32 %1985 to i64
  %1987 = inttoptr i64 %1986 to i8*
  br label %1991

; <label>:1988                                    ; preds = %1978
  %1989 = load i8** %t, align 8
  %1990 = getelementptr inbounds i8* %1989, i64 1
  br label %1991

; <label>:1991                                    ; preds = %1988, %1982
  %1992 = phi i8* [ %1987, %1982 ], [ %1990, %1988 ]
  store i8* %1992, i8** %s, align 8
  %1993 = load i8** %s, align 8
  %1994 = load i32* %start_shift, align 4
  %1995 = sext i32 %1994 to i64
  %1996 = getelementptr inbounds i8* %1993, i64 %1995
  %1997 = load i32* %end_shift, align 4
  %1998 = sext i32 %1997 to i64
  %1999 = getelementptr inbounds i8* %1996, i64 %1998
  %2000 = load i8** %5, align 8
  %2001 = icmp ugt i8* %1999, %2000
  br i1 %2001, label %2002, label %2003

; <label>:2002                                    ; preds = %1991
  br label %2117

; <label>:2003                                    ; preds = %1991
  %2004 = load %struct.sv** %check, align 8
  %2005 = icmp ne %struct.sv* %2004, null
  br i1 %2005, label %2007, label %2006

; <label>:2006                                    ; preds = %2003
  br label %2069

; <label>:2007                                    ; preds = %2003
  br label %503

; <label>:2008                                    ; preds = %1973
  %2009 = load i8** %t, align 8
  %2010 = load i32* %start_shift, align 4
  %2011 = sext i32 %2010 to i64
  %2012 = getelementptr inbounds i8* %2009, i64 %2011
  %2013 = load i8** %check_at, align 8
  %2014 = icmp uge i8* %2012, %2013
  br i1 %2014, label %2015, label %2016

; <label>:2015                                    ; preds = %2008
  br label %2055

; <label>:2016                                    ; preds = %2008
  %2017 = load i8** %check_at, align 8
  store i8* %2017, i8** %s, align 8
  %2018 = load %struct.sv** %check, align 8
  %2019 = icmp ne %struct.sv* %2018, null
  br i1 %2019, label %2021, label %2020

; <label>:2020                                    ; preds = %2016
  br label %2069

; <label>:2021                                    ; preds = %2016
  br label %743

; <label>:2022                                    ; preds = %1945
  %2023 = load i32* %ml_anch, align 4
  %2024 = icmp ne i32 %2023, 0
  br i1 %2024, label %2025, label %2032

; <label>:2025                                    ; preds = %2022
  %2026 = load i8** %t, align 8
  %2027 = getelementptr inbounds i8* %2026, i64 1
  store i8* %2027, i8** %t, align 8
  store i8* %2027, i8** %s, align 8
  %2028 = load %struct.sv** %check, align 8
  %2029 = icmp ne %struct.sv* %2028, null
  br i1 %2029, label %2031, label %2030

; <label>:2030                                    ; preds = %2025
  br label %2069

; <label>:2031                                    ; preds = %2025
  br label %1393

; <label>:2032                                    ; preds = %2022
  %2033 = load i32* %do_utf8, align 4
  %2034 = icmp ne i32 %2033, 0
  br i1 %2034, label %2035, label %2044

; <label>:2035                                    ; preds = %2032
  %2036 = load %struct.regexp** %2, align 8
  %2037 = getelementptr inbounds %struct.regexp* %2036, i32 0, i32 3
  %2038 = load %struct.reg_substr_data** %2037, align 8
  %2039 = getelementptr inbounds %struct.reg_substr_data* %2038, i32 0, i32 0
  %2040 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %2039, i32 0, i64 1
  %2041 = getelementptr inbounds %struct.reg_substr_datum* %2040, i32 0, i32 3
  %2042 = load %struct.sv** %2041, align 8
  %2043 = icmp ne %struct.sv* %2042, null
  br i1 %2043, label %2054, label %2053

; <label>:2044                                    ; preds = %2032
  %2045 = load %struct.regexp** %2, align 8
  %2046 = getelementptr inbounds %struct.regexp* %2045, i32 0, i32 3
  %2047 = load %struct.reg_substr_data** %2046, align 8
  %2048 = getelementptr inbounds %struct.reg_substr_data* %2047, i32 0, i32 0
  %2049 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %2048, i32 0, i64 1
  %2050 = getelementptr inbounds %struct.reg_substr_datum* %2049, i32 0, i32 2
  %2051 = load %struct.sv** %2050, align 8
  %2052 = icmp ne %struct.sv* %2051, null
  br i1 %2052, label %2054, label %2053

; <label>:2053                                    ; preds = %2044, %2035
  br label %2117

; <label>:2054                                    ; preds = %2044, %2035
  br label %2055

; <label>:2055                                    ; preds = %2054, %2015
  %2056 = load i8** %check_at, align 8
  %2057 = load i32* %start_shift, align 4
  %2058 = sext i32 %2057 to i64
  %2059 = sub i64 0, %2058
  %2060 = getelementptr inbounds i8* %2056, i64 %2059
  store i8* %2060, i8** %t, align 8
  br label %1978

; <label>:2061                                    ; preds = %1903
  %2062 = load i8** %t, align 8
  %2063 = load i8** %s, align 8
  %2064 = icmp ne i8* %2062, %2063
  br i1 %2064, label %2065, label %2066

; <label>:2065                                    ; preds = %2061
  br label %2067

; <label>:2066                                    ; preds = %2061
  br label %2067

; <label>:2067                                    ; preds = %2066, %2065
  br label %2068

; <label>:2068                                    ; preds = %2067, %1713
  br label %2069

; <label>:2069                                    ; preds = %2068, %2030, %2020, %2006
  %2070 = load i8** %s, align 8
  store i8* %2070, i8** %1
  br label %2118

; <label>:2071                                    ; preds = %1466, %1319, %1015, %673, %574, %323, %288
  %2072 = load %struct.regexp** %2, align 8
  %2073 = getelementptr inbounds %struct.regexp* %2072, i32 0, i32 3
  %2074 = load %struct.reg_substr_data** %2073, align 8
  %2075 = getelementptr inbounds %struct.reg_substr_data* %2074, i32 0, i32 0
  %2076 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %2075, i32 0, i64 2
  %2077 = getelementptr inbounds %struct.reg_substr_datum* %2076, i32 0, i32 2
  %2078 = load %struct.sv** %2077, align 8
  %2079 = icmp ne %struct.sv* %2078, null
  br i1 %2079, label %2089, label %2080

; <label>:2080                                    ; preds = %2071
  %2081 = load %struct.regexp** %2, align 8
  %2082 = getelementptr inbounds %struct.regexp* %2081, i32 0, i32 3
  %2083 = load %struct.reg_substr_data** %2082, align 8
  %2084 = getelementptr inbounds %struct.reg_substr_data* %2083, i32 0, i32 0
  %2085 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %2084, i32 0, i64 2
  %2086 = getelementptr inbounds %struct.reg_substr_datum* %2085, i32 0, i32 3
  %2087 = load %struct.sv** %2086, align 8
  %2088 = icmp ne %struct.sv* %2087, null
  br i1 %2088, label %2089, label %2116

; <label>:2089                                    ; preds = %2080, %2071
  %2090 = load i32* %do_utf8, align 4
  %2091 = icmp ne i32 %2090, 0
  br i1 %2091, label %2092, label %2100

; <label>:2092                                    ; preds = %2089
  %2093 = load %struct.regexp** %2, align 8
  %2094 = getelementptr inbounds %struct.regexp* %2093, i32 0, i32 3
  %2095 = load %struct.reg_substr_data** %2094, align 8
  %2096 = getelementptr inbounds %struct.reg_substr_data* %2095, i32 0, i32 0
  %2097 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %2096, i32 0, i64 2
  %2098 = getelementptr inbounds %struct.reg_substr_datum* %2097, i32 0, i32 3
  %2099 = load %struct.sv** %2098, align 8
  br label %2108

; <label>:2100                                    ; preds = %2089
  %2101 = load %struct.regexp** %2, align 8
  %2102 = getelementptr inbounds %struct.regexp* %2101, i32 0, i32 3
  %2103 = load %struct.reg_substr_data** %2102, align 8
  %2104 = getelementptr inbounds %struct.reg_substr_data* %2103, i32 0, i32 0
  %2105 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %2104, i32 0, i64 2
  %2106 = getelementptr inbounds %struct.reg_substr_datum* %2105, i32 0, i32 2
  %2107 = load %struct.sv** %2106, align 8
  br label %2108

; <label>:2108                                    ; preds = %2100, %2092
  %2109 = phi %struct.sv* [ %2099, %2092 ], [ %2107, %2100 ]
  %2110 = getelementptr inbounds %struct.sv* %2109, i32 0, i32 0
  %2111 = load i8** %2110, align 8
  %2112 = bitcast i8* %2111 to %struct.xpvbm*
  %2113 = getelementptr inbounds %struct.xpvbm* %2112, i32 0, i32 7
  %2114 = load i32* %2113, align 4
  %2115 = add nsw i32 %2114, 5
  store i32 %2115, i32* %2113, align 4
  br label %2116

; <label>:2116                                    ; preds = %2108, %2080
  br label %2117

; <label>:2117                                    ; preds = %2116, %2053, %2002, %1935, %1925, %189, %139, %51
  store i8* null, i8** %1
  br label %2118

; <label>:2118                                    ; preds = %2117, %2069
  %2119 = load i8** %1
  ret i8* %2119
}

declare i32 @to_utf8_substr(...) #1

declare i32 @to_byte_substr(...) #1

declare i32 @reghop3(...) #1

declare i32 @memcmp(i8*, i8*, i64) #1

declare i64 @Perl_sv_len_utf8(%struct.sv*) #1

declare i64 @Perl_utf8_distance(i8*, i8*) #1

declare i8* @Perl_screaminstr(%struct.sv*, %struct.sv*, i32, i32, i32*, i32) #1

declare i8* @Perl_fbm_instr(i8*, i8*, %struct.sv*, i32) #1

declare i32 @reghopmaybe3(...) #1

declare void @Perl_sv_free(%struct.sv*) #1

declare i32 @cache_re(...) #1

declare i32 @find_byclass(...) #1

declare void @Perl_croak(i8*, ...) #1

declare %struct.magic* @Perl_mg_find(%struct.sv*, i32) #1

declare i32 @regtry(...) #1

declare i32 @reghop(...) #1

declare i8* @Perl_sv_2pv_flags(%struct.sv*, i64*, i32) #1

declare i8* @Perl_rninstr(i8*, i8*, i8*, i8*) #1

declare void @Perl_sv_setsv_flags(%struct.sv*, %struct.sv*, i32) #1

; Function Attrs: nounwind uwtable
define internal void @restore_pos(i8* %arg) #0 {
  %1 = alloca i8*, align 8
  store i8* %arg, i8** %1, align 8
  %2 = load i32* @PL_reg_eval_set, align 4
  %3 = icmp ne i32 %2, 0
  br i1 %3, label %4, label %24

; <label>:4                                       ; preds = %0
  %5 = load i8** @PL_reg_oldsaved, align 8
  %6 = icmp ne i8* %5, null
  br i1 %6, label %7, label %19

; <label>:7                                       ; preds = %4
  %8 = load i8** @PL_reg_oldsaved, align 8
  %9 = load %struct.regexp** @PL_reg_re, align 8
  %10 = getelementptr inbounds %struct.regexp* %9, i32 0, i32 6
  store i8* %8, i8** %10, align 8
  %11 = load i64* @PL_reg_oldsavedlen, align 8
  %12 = trunc i64 %11 to i32
  %13 = load %struct.regexp** @PL_reg_re, align 8
  %14 = getelementptr inbounds %struct.regexp* %13, i32 0, i32 8
  store i32 %12, i32* %14, align 4
  %15 = load %struct.regexp** @PL_reg_re, align 8
  %16 = getelementptr inbounds %struct.regexp* %15, i32 0, i32 15
  %17 = load i32* %16, align 4
  %18 = or i32 %17, 262144
  store i32 %18, i32* %16, align 4
  br label %19

; <label>:19                                      ; preds = %7, %4
  %20 = load i32* @PL_reg_oldpos, align 4
  %21 = load %struct.magic** @PL_reg_magic, align 8
  %22 = getelementptr inbounds %struct.magic* %21, i32 0, i32 7
  store i32 %20, i32* %22, align 4
  store i32 0, i32* @PL_reg_eval_set, align 4
  %23 = load %struct.pmop** @PL_reg_oldcurpm, align 8
  store %struct.pmop* %23, %struct.pmop** @PL_curpm, align 8
  br label %24

; <label>:24                                      ; preds = %19, %0
  ret void
}

declare void @Perl_safesysfree(i8*) #1

declare i8* @Perl_savepvn(i8*, i32) #1

; Function Attrs: nounwind uwtable
define i32 @S_regmatch(%struct.regnode* %prog) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.regnode*, align 8
  %scan = alloca %struct.regnode*, align 8
  %next = alloca %struct.regnode*, align 8
  %inner = alloca %struct.regnode*, align 8
  %nextchr = alloca i32, align 4
  %n = alloca i32, align 4
  %ln = alloca i32, align 4
  %s = alloca i8*, align 8
  %locinput = alloca i8*, align 8
  %c1 = alloca i32, align 4
  %c2 = alloca i32, align 4
  %paren = alloca i32, align 4
  %minmod = alloca i32, align 4
  %sw = alloca i32, align 4
  %logical = alloca i32, align 4
  %unwind = alloca i32, align 4
  %do_utf8 = alloca i8, align 1
  %l = alloca i8*, align 8
  %e = alloca i8*, align 8
  %ulen = alloca i64, align 8
  %l1 = alloca i8*, align 8
  %e2 = alloca i8*, align 8
  %inclasslen = alloca i64, align 8
  %r = alloca i8*, align 8
  %l3 = alloca i8*, align 8
  %e4 = alloca i8*, align 8
  %ulen1 = alloca i64, align 8
  %ulen2 = alloca i64, align 8
  %tmpbuf1 = alloca [7 x i8], align 1
  %tmpbuf2 = alloca [7 x i8], align 1
  %sp = alloca %struct.sv**, align 8
  %oop = alloca %struct.op*, align 8
  %ocurcop = alloca %struct.cop*, align 8
  %old_comppad = alloca %struct.av*, align 8
  %ret = alloca %struct.sv*, align 8
  %oreg = alloca %struct.regexp*, align 8
  %before = alloca %struct.sv**, align 8
  %re = alloca %struct.regexp*, align 8
  %mg = alloca %struct.magic*, align 8
  %state = alloca %struct.re_cc_state, align 8
  %cp = alloca i32, align 4
  %lastcp = alloca i32, align 4
  %toggleutf = alloca i32, align 4
  %sv = alloca %struct.sv*, align 8
  %len = alloca i64, align 8
  %t = alloca i8*, align 8
  %pm = alloca %struct.pmop, align 8
  %oprecomp = alloca i8*, align 8
  %osize = alloca i32, align 4
  %onpar = alloca i32, align 4
  %cc = alloca %struct.curcur, align 8
  %cp5 = alloca i32, align 4
  %parenfloor = alloca i32, align 4
  %cp6 = alloca i32, align 4
  %lastcp7 = alloca i32, align 4
  %cc8 = alloca %struct.curcur*, align 8
  %lastloc = alloca i8*, align 8
  %cache_offset = alloca i32, align 4
  %cache_bit = alloca i32, align 4
  %size = alloca i32, align 4
  %lastparen = alloca i32, align 4
  %unwind1 = alloca i32, align 4
  %uw = alloca %struct.re_unwind_branch_t*, align 8
  %l9 = alloca i32, align 4
  %lastcp10 = alloca i32, align 4
  %text_node = alloca %struct.regnode*, align 8
  %text_node11 = alloca %struct.regnode*, align 8
  %s12 = alloca i8*, align 8
  %text_node13 = alloca %struct.regnode*, align 8
  %ulen114 = alloca i64, align 8
  %ulen215 = alloca i64, align 8
  %tmpbuf116 = alloca [7 x i8], align 1
  %tmpbuf217 = alloca [7 x i8], align 1
  %lastcp18 = alloca i32, align 4
  %e19 = alloca i8*, align 8
  %old = alloca i8*, align 8
  %count = alloca i32, align 4
  %m = alloca i32, align 4
  %len20 = alloca i64, align 8
  %c = alloca i64, align 8
  %c21 = alloca i64, align 8
  %lastcp22 = alloca i32, align 4
  %c23 = alloca i64, align 8
  %c24 = alloca i64, align 8
  %cur_call_cc = alloca %struct.re_cc_state*, align 8
  %cctmp = alloca %struct.curcur*, align 8
  %re25 = alloca %struct.regexp*, align 8
  %cp26 = alloca i32, align 4
  %lastcp27 = alloca i32, align 4
  %uw28 = alloca %union.re_unwind_t*, align 8
  %uwb = alloca %struct.re_unwind_branch_t*, align 8
  %lastparen29 = alloca i32, align 4
  store %struct.regnode* %prog, %struct.regnode** %2, align 8
  store i32 0, i32* %ln, align 4
  store i8* null, i8** %s, align 8
  %3 = load i8** @PL_reginput, align 8
  store i8* %3, i8** %locinput, align 8
  store i32 0, i32* %c1, align 4
  store i32 0, i32* %c2, align 4
  store i32 0, i32* %minmod, align 4
  store i32 0, i32* %sw, align 4
  store i32 0, i32* %logical, align 4
  store i32 0, i32* %unwind, align 4
  %4 = load i8* @PL_reg_match_utf8, align 1
  store i8 %4, i8* %do_utf8, align 1
  %5 = load i8** %locinput, align 8
  %6 = load i8* %5, align 1
  %7 = zext i8 %6 to i32
  store i32 %7, i32* %nextchr, align 4
  %8 = load %struct.regnode** %2, align 8
  store %struct.regnode* %8, %struct.regnode** %scan, align 8
  br label %9

; <label>:9                                       ; preds = %6121, %0
  %10 = load %struct.regnode** %scan, align 8
  %11 = icmp ne %struct.regnode* %10, null
  br i1 %11, label %12, label %6123

; <label>:12                                      ; preds = %9
  %13 = load %struct.regnode** %scan, align 8
  %14 = load %struct.regnode** %scan, align 8
  %15 = getelementptr inbounds %struct.regnode* %14, i32 0, i32 2
  %16 = load i16* %15, align 2
  %17 = zext i16 %16 to i32
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds %struct.regnode* %13, i64 %18
  store %struct.regnode* %19, %struct.regnode** %next, align 8
  %20 = load %struct.regnode** %next, align 8
  %21 = load %struct.regnode** %scan, align 8
  %22 = icmp eq %struct.regnode* %20, %21
  br i1 %22, label %23, label %24

; <label>:23                                      ; preds = %12
  store %struct.regnode* null, %struct.regnode** %next, align 8
  br label %24

; <label>:24                                      ; preds = %23, %12
  %25 = load %struct.regnode** %scan, align 8
  %26 = getelementptr inbounds %struct.regnode* %25, i32 0, i32 1
  %27 = load i8* %26, align 1
  %28 = zext i8 %27 to i32
  switch i32 %28, label %6066 [
    i32 2, label %29
    i32 3, label %51
    i32 4, label %70
    i32 13, label %76
    i32 6, label %82
    i32 7, label %87
    i32 8, label %100
    i32 5, label %121
    i32 15, label %127
    i32 16, label %161
    i32 14, label %174
    i32 33, label %211
    i32 35, label %413
    i32 34, label %416
    i32 17, label %596
    i32 19, label %776
    i32 18, label %779
    i32 21, label %905
    i32 20, label %908
    i32 10, label %1038
    i32 12, label %1038
    i32 9, label %1041
    i32 11, label %1041
    i32 23, label %1302
    i32 22, label %1305
    i32 25, label %1464
    i32 24, label %1467
    i32 27, label %1582
    i32 26, label %1585
    i32 29, label %1687
    i32 28, label %1690
    i32 30, label %1796
    i32 49, label %1860
    i32 47, label %1863
    i32 48, label %1863
    i32 36, label %2047
    i32 37, label %2047
    i32 32, label %2048
    i32 57, label %2049
    i32 45, label %2444
    i32 46, label %2460
    i32 54, label %2499
    i32 53, label %2518
    i32 59, label %2545
    i32 43, label %2550
    i32 44, label %2621
    i32 56, label %3365
    i32 31, label %3381
    i32 58, label %3433
    i32 42, label %3434
    i32 41, label %4322
    i32 40, label %4355
    i32 38, label %4369
    i32 39, label %4372
    i32 0, label %5856
    i32 1, label %5913
    i32 52, label %5915
    i32 51, label %5917
    i32 50, label %5969
    i32 55, label %6052
  ]

; <label>:29                                      ; preds = %24
  %30 = load i8** %locinput, align 8
  %31 = load i8** @PL_bostr, align 8
  %32 = icmp eq i8* %30, %31
  br i1 %32, label %49, label %33

; <label>:33                                      ; preds = %29
  %34 = load i32* @PL_multiline, align 4
  %35 = icmp ne i32 %34, 0
  br i1 %35, label %36, label %50

; <label>:36                                      ; preds = %33
  %37 = load i32* %nextchr, align 4
  %38 = icmp ne i32 %37, 0
  br i1 %38, label %43, label %39

; <label>:39                                      ; preds = %36
  %40 = load i8** %locinput, align 8
  %41 = load i8** @PL_regeol, align 8
  %42 = icmp ult i8* %40, %41
  br i1 %42, label %43, label %50

; <label>:43                                      ; preds = %39, %36
  %44 = load i8** %locinput, align 8
  %45 = getelementptr inbounds i8* %44, i64 -1
  %46 = load i8* %45, align 1
  %47 = sext i8 %46 to i32
  %48 = icmp eq i32 %47, 10
  br i1 %48, label %49, label %50

; <label>:49                                      ; preds = %43, %29
  br label %6120

; <label>:50                                      ; preds = %43, %39, %33
  br label %6127

; <label>:51                                      ; preds = %24
  %52 = load i8** %locinput, align 8
  %53 = load i8** @PL_bostr, align 8
  %54 = icmp eq i8* %52, %53
  br i1 %54, label %68, label %55

; <label>:55                                      ; preds = %51
  %56 = load i32* %nextchr, align 4
  %57 = icmp ne i32 %56, 0
  br i1 %57, label %62, label %58

; <label>:58                                      ; preds = %55
  %59 = load i8** %locinput, align 8
  %60 = load i8** @PL_regeol, align 8
  %61 = icmp ult i8* %59, %60
  br i1 %61, label %62, label %69

; <label>:62                                      ; preds = %58, %55
  %63 = load i8** %locinput, align 8
  %64 = getelementptr inbounds i8* %63, i64 -1
  %65 = load i8* %64, align 1
  %66 = sext i8 %65 to i32
  %67 = icmp eq i32 %66, 10
  br i1 %67, label %68, label %69

; <label>:68                                      ; preds = %62, %51
  br label %6120

; <label>:69                                      ; preds = %62, %58
  br label %6127

; <label>:70                                      ; preds = %24
  %71 = load i8** %locinput, align 8
  %72 = load i8** @PL_bostr, align 8
  %73 = icmp eq i8* %71, %72
  br i1 %73, label %74, label %75

; <label>:74                                      ; preds = %70
  br label %6120

; <label>:75                                      ; preds = %70
  br label %6127

; <label>:76                                      ; preds = %24
  %77 = load i8** %locinput, align 8
  %78 = load i8** @PL_reg_ganch, align 8
  %79 = icmp eq i8* %77, %78
  br i1 %79, label %80, label %81

; <label>:80                                      ; preds = %76
  br label %6120

; <label>:81                                      ; preds = %76
  br label %6127

; <label>:82                                      ; preds = %24
  %83 = load i32* @PL_multiline, align 4
  %84 = icmp ne i32 %83, 0
  br i1 %84, label %85, label %86

; <label>:85                                      ; preds = %82
  br label %88

; <label>:86                                      ; preds = %82
  br label %101

; <label>:87                                      ; preds = %24
  br label %88

; <label>:88                                      ; preds = %87, %85
  %89 = load i32* %nextchr, align 4
  %90 = icmp ne i32 %89, 0
  br i1 %90, label %95, label %91

; <label>:91                                      ; preds = %88
  %92 = load i8** %locinput, align 8
  %93 = load i8** @PL_regeol, align 8
  %94 = icmp ult i8* %92, %93
  br i1 %94, label %95, label %99

; <label>:95                                      ; preds = %91, %88
  %96 = load i32* %nextchr, align 4
  %97 = icmp ne i32 %96, 10
  br i1 %97, label %98, label %99

; <label>:98                                      ; preds = %95
  br label %6127

; <label>:99                                      ; preds = %95, %91
  br label %6120

; <label>:100                                     ; preds = %24
  br label %101

; <label>:101                                     ; preds = %100, %86
  %102 = load i32* %nextchr, align 4
  %103 = icmp ne i32 %102, 0
  br i1 %103, label %108, label %104

; <label>:104                                     ; preds = %101
  %105 = load i8** %locinput, align 8
  %106 = load i8** @PL_regeol, align 8
  %107 = icmp ult i8* %105, %106
  br i1 %107, label %108, label %112

; <label>:108                                     ; preds = %104, %101
  %109 = load i32* %nextchr, align 4
  %110 = icmp ne i32 %109, 10
  br i1 %110, label %111, label %112

; <label>:111                                     ; preds = %108
  br label %6127

; <label>:112                                     ; preds = %108, %104
  %113 = load i8** @PL_regeol, align 8
  %114 = load i8** %locinput, align 8
  %115 = ptrtoint i8* %113 to i64
  %116 = ptrtoint i8* %114 to i64
  %117 = sub i64 %115, %116
  %118 = icmp sgt i64 %117, 1
  br i1 %118, label %119, label %120

; <label>:119                                     ; preds = %112
  br label %6127

; <label>:120                                     ; preds = %112
  br label %6120

; <label>:121                                     ; preds = %24
  %122 = load i8** @PL_regeol, align 8
  %123 = load i8** %locinput, align 8
  %124 = icmp ne i8* %122, %123
  br i1 %124, label %125, label %126

; <label>:125                                     ; preds = %121
  br label %6127

; <label>:126                                     ; preds = %121
  br label %6120

; <label>:127                                     ; preds = %24
  %128 = load i32* %nextchr, align 4
  %129 = icmp ne i32 %128, 0
  br i1 %129, label %135, label %130

; <label>:130                                     ; preds = %127
  %131 = load i8** %locinput, align 8
  %132 = load i8** @PL_regeol, align 8
  %133 = icmp uge i8* %131, %132
  br i1 %133, label %134, label %135

; <label>:134                                     ; preds = %130
  br label %6127

; <label>:135                                     ; preds = %130, %127
  %136 = load i8* %do_utf8, align 1
  %137 = icmp ne i8 %136, 0
  br i1 %137, label %138, label %155

; <label>:138                                     ; preds = %135
  %139 = load i32* %nextchr, align 4
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds [0 x i8]* @PL_utf8skip, i32 0, i64 %140
  %142 = load i8* %141, align 1
  %143 = zext i8 %142 to i32
  %144 = load i8** %locinput, align 8
  %145 = sext i32 %143 to i64
  %146 = getelementptr inbounds i8* %144, i64 %145
  store i8* %146, i8** %locinput, align 8
  %147 = load i8** %locinput, align 8
  %148 = load i8** @PL_regeol, align 8
  %149 = icmp ugt i8* %147, %148
  br i1 %149, label %150, label %151

; <label>:150                                     ; preds = %138
  br label %6127

; <label>:151                                     ; preds = %138
  %152 = load i8** %locinput, align 8
  %153 = load i8* %152, align 1
  %154 = zext i8 %153 to i32
  store i32 %154, i32* %nextchr, align 4
  br label %160

; <label>:155                                     ; preds = %135
  %156 = load i8** %locinput, align 8
  %157 = getelementptr inbounds i8* %156, i32 1
  store i8* %157, i8** %locinput, align 8
  %158 = load i8* %157, align 1
  %159 = zext i8 %158 to i32
  store i32 %159, i32* %nextchr, align 4
  br label %160

; <label>:160                                     ; preds = %155, %151
  br label %6120

; <label>:161                                     ; preds = %24
  %162 = load i32* %nextchr, align 4
  %163 = icmp ne i32 %162, 0
  br i1 %163, label %169, label %164

; <label>:164                                     ; preds = %161
  %165 = load i8** %locinput, align 8
  %166 = load i8** @PL_regeol, align 8
  %167 = icmp uge i8* %165, %166
  br i1 %167, label %168, label %169

; <label>:168                                     ; preds = %164
  br label %6127

; <label>:169                                     ; preds = %164, %161
  %170 = load i8** %locinput, align 8
  %171 = getelementptr inbounds i8* %170, i32 1
  store i8* %171, i8** %locinput, align 8
  %172 = load i8* %171, align 1
  %173 = zext i8 %172 to i32
  store i32 %173, i32* %nextchr, align 4
  br label %6120

; <label>:174                                     ; preds = %24
  %175 = load i32* %nextchr, align 4
  %176 = icmp ne i32 %175, 0
  br i1 %176, label %181, label %177

; <label>:177                                     ; preds = %174
  %178 = load i8** %locinput, align 8
  %179 = load i8** @PL_regeol, align 8
  %180 = icmp uge i8* %178, %179
  br i1 %180, label %184, label %181

; <label>:181                                     ; preds = %177, %174
  %182 = load i32* %nextchr, align 4
  %183 = icmp eq i32 %182, 10
  br i1 %183, label %184, label %185

; <label>:184                                     ; preds = %181, %177
  br label %6127

; <label>:185                                     ; preds = %181
  %186 = load i8* %do_utf8, align 1
  %187 = icmp ne i8 %186, 0
  br i1 %187, label %188, label %205

; <label>:188                                     ; preds = %185
  %189 = load i32* %nextchr, align 4
  %190 = sext i32 %189 to i64
  %191 = getelementptr inbounds [0 x i8]* @PL_utf8skip, i32 0, i64 %190
  %192 = load i8* %191, align 1
  %193 = zext i8 %192 to i32
  %194 = load i8** %locinput, align 8
  %195 = sext i32 %193 to i64
  %196 = getelementptr inbounds i8* %194, i64 %195
  store i8* %196, i8** %locinput, align 8
  %197 = load i8** %locinput, align 8
  %198 = load i8** @PL_regeol, align 8
  %199 = icmp ugt i8* %197, %198
  br i1 %199, label %200, label %201

; <label>:200                                     ; preds = %188
  br label %6127

; <label>:201                                     ; preds = %188
  %202 = load i8** %locinput, align 8
  %203 = load i8* %202, align 1
  %204 = zext i8 %203 to i32
  store i32 %204, i32* %nextchr, align 4
  br label %210

; <label>:205                                     ; preds = %185
  %206 = load i8** %locinput, align 8
  %207 = getelementptr inbounds i8* %206, i32 1
  store i8* %207, i8** %locinput, align 8
  %208 = load i8* %207, align 1
  %209 = zext i8 %208 to i32
  store i32 %209, i32* %nextchr, align 4
  br label %210

; <label>:210                                     ; preds = %205, %201
  br label %6120

; <label>:211                                     ; preds = %24
  %212 = load %struct.regnode** %scan, align 8
  %213 = bitcast %struct.regnode* %212 to %struct.regnode_string*
  %214 = getelementptr inbounds %struct.regnode_string* %213, i32 0, i32 3
  %215 = getelementptr inbounds [1 x i8]* %214, i32 0, i32 0
  store i8* %215, i8** %s, align 8
  %216 = load %struct.regnode** %scan, align 8
  %217 = bitcast %struct.regnode* %216 to %struct.regnode_string*
  %218 = getelementptr inbounds %struct.regnode_string* %217, i32 0, i32 0
  %219 = load i8* %218, align 1
  %220 = zext i8 %219 to i32
  store i32 %220, i32* %ln, align 4
  %221 = load i8* %do_utf8, align 1
  %222 = sext i8 %221 to i32
  %223 = load i32* @PL_reg_flags, align 4
  %224 = and i32 %223, 8
  %225 = icmp ne i32 %224, 0
  %226 = zext i1 %225 to i32
  %227 = icmp ne i32 %222, %226
  br i1 %227, label %228, label %377

; <label>:228                                     ; preds = %211
  %229 = load i8** %locinput, align 8
  store i8* %229, i8** %l, align 8
  %230 = load i8** %s, align 8
  %231 = load i32* %ln, align 4
  %232 = sext i32 %231 to i64
  %233 = getelementptr inbounds i8* %230, i64 %232
  store i8* %233, i8** %e, align 8
  %234 = load i8* %do_utf8, align 1
  %235 = icmp ne i8 %234, 0
  br i1 %235, label %236, label %304

; <label>:236                                     ; preds = %228
  br label %237

; <label>:237                                     ; preds = %297, %236
  %238 = load i8** %s, align 8
  %239 = load i8** %e, align 8
  %240 = icmp ult i8* %238, %239
  br i1 %240, label %241, label %303

; <label>:241                                     ; preds = %237
  %242 = load i8** %l, align 8
  %243 = load i8** @PL_regeol, align 8
  %244 = icmp uge i8* %242, %243
  br i1 %244, label %245, label %246

; <label>:245                                     ; preds = %241
  br label %6127

; <label>:246                                     ; preds = %241
  %247 = load i8** %s, align 8
  %248 = load i8* %247, align 1
  %249 = zext i8 %248 to i64
  %250 = load i8** %l, align 8
  %251 = load volatile %struct.cop** @PL_curcop, align 8
  %252 = getelementptr inbounds %struct.cop* %251, i32 0, i32 14
  %253 = load %struct.sv** %252, align 8
  %254 = icmp ne %struct.sv* %253, null
  br i1 %254, label %255, label %279

; <label>:255                                     ; preds = %246
  %256 = load volatile %struct.cop** @PL_curcop, align 8
  %257 = getelementptr inbounds %struct.cop* %256, i32 0, i32 14
  %258 = load %struct.sv** %257, align 8
  %259 = icmp ne %struct.sv* %258, getelementptr inbounds (%struct.sv* null, i64 2)
  br i1 %259, label %260, label %279

; <label>:260                                     ; preds = %255
  %261 = load volatile %struct.cop** @PL_curcop, align 8
  %262 = getelementptr inbounds %struct.cop* %261, i32 0, i32 14
  %263 = load %struct.sv** %262, align 8
  %264 = icmp eq %struct.sv* %263, getelementptr inbounds (%struct.sv* null, i64 1)
  br i1 %264, label %291, label %265

; <label>:265                                     ; preds = %260
  %266 = load volatile %struct.cop** @PL_curcop, align 8
  %267 = getelementptr inbounds %struct.cop* %266, i32 0, i32 14
  %268 = load %struct.sv** %267, align 8
  %269 = getelementptr inbounds %struct.sv* %268, i32 0, i32 0
  %270 = load i8** %269, align 8
  %271 = bitcast i8* %270 to %struct.xpv*
  %272 = getelementptr inbounds %struct.xpv* %271, i32 0, i32 0
  %273 = load i8** %272, align 8
  %274 = getelementptr inbounds i8* %273, i64 11
  %275 = load i8* %274, align 1
  %276 = sext i8 %275 to i32
  %277 = and i32 %276, 1
  %278 = icmp ne i32 %277, 0
  br i1 %278, label %291, label %279

; <label>:279                                     ; preds = %265, %255, %246
  %280 = load volatile %struct.cop** @PL_curcop, align 8
  %281 = getelementptr inbounds %struct.cop* %280, i32 0, i32 14
  %282 = load %struct.sv** %281, align 8
  %283 = icmp eq %struct.sv* %282, null
  br i1 %283, label %284, label %289

; <label>:284                                     ; preds = %279
  %285 = load i8* @PL_dowarn, align 1
  %286 = zext i8 %285 to i32
  %287 = and i32 %286, 1
  %288 = icmp ne i32 %287, 0
  br label %289

; <label>:289                                     ; preds = %284, %279
  %290 = phi i1 [ false, %279 ], [ %288, %284 ]
  br label %291

; <label>:291                                     ; preds = %289, %265, %260
  %292 = phi i1 [ true, %265 ], [ true, %260 ], [ %290, %289 ]
  %293 = select i1 %292, i32 0, i32 255
  %294 = call i64 @Perl_utf8n_to_uvuni(i8* %250, i64 13, i64* %ulen, i32 %293)
  %295 = icmp ne i64 %249, %294
  br i1 %295, label %296, label %297

; <label>:296                                     ; preds = %291
  br label %6127

; <label>:297                                     ; preds = %291
  %298 = load i64* %ulen, align 8
  %299 = load i8** %l, align 8
  %300 = getelementptr inbounds i8* %299, i64 %298
  store i8* %300, i8** %l, align 8
  %301 = load i8** %s, align 8
  %302 = getelementptr inbounds i8* %301, i32 1
  store i8* %302, i8** %s, align 8
  br label %237

; <label>:303                                     ; preds = %237
  br label %372

; <label>:304                                     ; preds = %228
  br label %305

; <label>:305                                     ; preds = %365, %304
  %306 = load i8** %s, align 8
  %307 = load i8** %e, align 8
  %308 = icmp ult i8* %306, %307
  br i1 %308, label %309, label %371

; <label>:309                                     ; preds = %305
  %310 = load i8** %l, align 8
  %311 = load i8** @PL_regeol, align 8
  %312 = icmp uge i8* %310, %311
  br i1 %312, label %313, label %314

; <label>:313                                     ; preds = %309
  br label %6127

; <label>:314                                     ; preds = %309
  %315 = load i8** %l, align 8
  %316 = load i8* %315, align 1
  %317 = zext i8 %316 to i64
  %318 = load i8** %s, align 8
  %319 = load volatile %struct.cop** @PL_curcop, align 8
  %320 = getelementptr inbounds %struct.cop* %319, i32 0, i32 14
  %321 = load %struct.sv** %320, align 8
  %322 = icmp ne %struct.sv* %321, null
  br i1 %322, label %323, label %347

; <label>:323                                     ; preds = %314
  %324 = load volatile %struct.cop** @PL_curcop, align 8
  %325 = getelementptr inbounds %struct.cop* %324, i32 0, i32 14
  %326 = load %struct.sv** %325, align 8
  %327 = icmp ne %struct.sv* %326, getelementptr inbounds (%struct.sv* null, i64 2)
  br i1 %327, label %328, label %347

; <label>:328                                     ; preds = %323
  %329 = load volatile %struct.cop** @PL_curcop, align 8
  %330 = getelementptr inbounds %struct.cop* %329, i32 0, i32 14
  %331 = load %struct.sv** %330, align 8
  %332 = icmp eq %struct.sv* %331, getelementptr inbounds (%struct.sv* null, i64 1)
  br i1 %332, label %359, label %333

; <label>:333                                     ; preds = %328
  %334 = load volatile %struct.cop** @PL_curcop, align 8
  %335 = getelementptr inbounds %struct.cop* %334, i32 0, i32 14
  %336 = load %struct.sv** %335, align 8
  %337 = getelementptr inbounds %struct.sv* %336, i32 0, i32 0
  %338 = load i8** %337, align 8
  %339 = bitcast i8* %338 to %struct.xpv*
  %340 = getelementptr inbounds %struct.xpv* %339, i32 0, i32 0
  %341 = load i8** %340, align 8
  %342 = getelementptr inbounds i8* %341, i64 11
  %343 = load i8* %342, align 1
  %344 = sext i8 %343 to i32
  %345 = and i32 %344, 1
  %346 = icmp ne i32 %345, 0
  br i1 %346, label %359, label %347

; <label>:347                                     ; preds = %333, %323, %314
  %348 = load volatile %struct.cop** @PL_curcop, align 8
  %349 = getelementptr inbounds %struct.cop* %348, i32 0, i32 14
  %350 = load %struct.sv** %349, align 8
  %351 = icmp eq %struct.sv* %350, null
  br i1 %351, label %352, label %357

; <label>:352                                     ; preds = %347
  %353 = load i8* @PL_dowarn, align 1
  %354 = zext i8 %353 to i32
  %355 = and i32 %354, 1
  %356 = icmp ne i32 %355, 0
  br label %357

; <label>:357                                     ; preds = %352, %347
  %358 = phi i1 [ false, %347 ], [ %356, %352 ]
  br label %359

; <label>:359                                     ; preds = %357, %333, %328
  %360 = phi i1 [ true, %333 ], [ true, %328 ], [ %358, %357 ]
  %361 = select i1 %360, i32 0, i32 255
  %362 = call i64 @Perl_utf8n_to_uvuni(i8* %318, i64 13, i64* %ulen, i32 %361)
  %363 = icmp ne i64 %317, %362
  br i1 %363, label %364, label %365

; <label>:364                                     ; preds = %359
  br label %6127

; <label>:365                                     ; preds = %359
  %366 = load i64* %ulen, align 8
  %367 = load i8** %s, align 8
  %368 = getelementptr inbounds i8* %367, i64 %366
  store i8* %368, i8** %s, align 8
  %369 = load i8** %l, align 8
  %370 = getelementptr inbounds i8* %369, i32 1
  store i8* %370, i8** %l, align 8
  br label %305

; <label>:371                                     ; preds = %305
  br label %372

; <label>:372                                     ; preds = %371, %303
  %373 = load i8** %l, align 8
  store i8* %373, i8** %locinput, align 8
  %374 = load i8** %locinput, align 8
  %375 = load i8* %374, align 1
  %376 = zext i8 %375 to i32
  store i32 %376, i32* %nextchr, align 4
  br label %6120

; <label>:377                                     ; preds = %211
  %378 = load i8** %s, align 8
  %379 = load i8* %378, align 1
  %380 = zext i8 %379 to i32
  %381 = load i32* %nextchr, align 4
  %382 = icmp ne i32 %380, %381
  br i1 %382, label %383, label %384

; <label>:383                                     ; preds = %377
  br label %6127

; <label>:384                                     ; preds = %377
  %385 = load i8** @PL_regeol, align 8
  %386 = load i8** %locinput, align 8
  %387 = ptrtoint i8* %385 to i64
  %388 = ptrtoint i8* %386 to i64
  %389 = sub i64 %387, %388
  %390 = load i32* %ln, align 4
  %391 = sext i32 %390 to i64
  %392 = icmp slt i64 %389, %391
  br i1 %392, label %393, label %394

; <label>:393                                     ; preds = %384
  br label %6127

; <label>:394                                     ; preds = %384
  %395 = load i32* %ln, align 4
  %396 = icmp sgt i32 %395, 1
  br i1 %396, label %397, label %405

; <label>:397                                     ; preds = %394
  %398 = load i8** %s, align 8
  %399 = load i8** %locinput, align 8
  %400 = load i32* %ln, align 4
  %401 = sext i32 %400 to i64
  %402 = call i32 @memcmp(i8* %398, i8* %399, i64 %401)
  %403 = icmp ne i32 %402, 0
  br i1 %403, label %404, label %405

; <label>:404                                     ; preds = %397
  br label %6127

; <label>:405                                     ; preds = %397, %394
  %406 = load i32* %ln, align 4
  %407 = load i8** %locinput, align 8
  %408 = sext i32 %406 to i64
  %409 = getelementptr inbounds i8* %407, i64 %408
  store i8* %409, i8** %locinput, align 8
  %410 = load i8** %locinput, align 8
  %411 = load i8* %410, align 1
  %412 = zext i8 %411 to i32
  store i32 %412, i32* %nextchr, align 4
  br label %6120

; <label>:413                                     ; preds = %24
  %414 = load i32* @PL_reg_flags, align 4
  %415 = or i32 %414, 1
  store i32 %415, i32* @PL_reg_flags, align 4
  br label %416

; <label>:416                                     ; preds = %24, %413
  %417 = load %struct.regnode** %scan, align 8
  %418 = bitcast %struct.regnode* %417 to %struct.regnode_string*
  %419 = getelementptr inbounds %struct.regnode_string* %418, i32 0, i32 3
  %420 = getelementptr inbounds [1 x i8]* %419, i32 0, i32 0
  store i8* %420, i8** %s, align 8
  %421 = load %struct.regnode** %scan, align 8
  %422 = bitcast %struct.regnode* %421 to %struct.regnode_string*
  %423 = getelementptr inbounds %struct.regnode_string* %422, i32 0, i32 0
  %424 = load i8* %423, align 1
  %425 = zext i8 %424 to i32
  store i32 %425, i32* %ln, align 4
  %426 = load i8* %do_utf8, align 1
  %427 = sext i8 %426 to i32
  %428 = icmp ne i32 %427, 0
  br i1 %428, label %433, label %429

; <label>:429                                     ; preds = %416
  %430 = load i32* @PL_reg_flags, align 4
  %431 = and i32 %430, 8
  %432 = icmp ne i32 %431, 0
  br i1 %432, label %433, label %533

; <label>:433                                     ; preds = %429, %416
  %434 = load i8** %locinput, align 8
  store i8* %434, i8** %l1, align 8
  %435 = load i8** @PL_regeol, align 8
  store i8* %435, i8** %e2, align 8
  %436 = load i8** %s, align 8
  %437 = load i32* %ln, align 4
  %438 = sext i32 %437 to i64
  %439 = load i32* @PL_reg_flags, align 4
  %440 = and i32 %439, 8
  %441 = icmp ne i32 %440, 0
  %442 = zext i1 %441 to i32
  %443 = trunc i32 %442 to i8
  %444 = load i8** %l1, align 8
  %445 = load i8* %do_utf8, align 1
  %446 = call i32 @Perl_ibcmp_utf8(i8* %436, i8** null, i64 %438, i8 signext %443, i8* %444, i8** %e2, i64 0, i8 signext %445)
  %447 = icmp ne i32 %446, 0
  br i1 %447, label %448, label %528

; <label>:448                                     ; preds = %433
  %449 = load i8* %do_utf8, align 1
  %450 = sext i8 %449 to i32
  %451 = icmp ne i32 %450, 0
  br i1 %451, label %452, label %526

; <label>:452                                     ; preds = %448
  %453 = load i8** %s, align 8
  %454 = getelementptr inbounds i8* %453, i64 0
  %455 = load i8* %454, align 1
  %456 = sext i8 %455 to i32
  %457 = icmp sge i32 %456, 65
  br i1 %457, label %458, label %470

; <label>:458                                     ; preds = %452
  %459 = load i8** %s, align 8
  %460 = getelementptr inbounds i8* %459, i64 0
  %461 = load i8* %460, align 1
  %462 = sext i8 %461 to i32
  %463 = icmp sle i32 %462, 90
  br i1 %463, label %464, label %470

; <label>:464                                     ; preds = %458
  %465 = load i8** %s, align 8
  %466 = getelementptr inbounds i8* %465, i64 0
  %467 = load i8* %466, align 1
  %468 = sext i8 %467 to i32
  %469 = add nsw i32 %468, 32
  br label %475

; <label>:470                                     ; preds = %458, %452
  %471 = load i8** %s, align 8
  %472 = getelementptr inbounds i8* %471, i64 0
  %473 = load i8* %472, align 1
  %474 = sext i8 %473 to i32
  br label %475

; <label>:475                                     ; preds = %470, %464
  %476 = phi i32 [ %469, %464 ], [ %474, %470 ]
  %477 = icmp eq i32 %476, 115
  br i1 %477, label %478, label %526

; <label>:478                                     ; preds = %475
  %479 = load i32* %ln, align 4
  %480 = icmp sge i32 %479, 2
  br i1 %480, label %481, label %526

; <label>:481                                     ; preds = %478
  %482 = load i8** %s, align 8
  %483 = getelementptr inbounds i8* %482, i64 1
  %484 = load i8* %483, align 1
  %485 = sext i8 %484 to i32
  %486 = icmp sge i32 %485, 65
  br i1 %486, label %487, label %499

; <label>:487                                     ; preds = %481
  %488 = load i8** %s, align 8
  %489 = getelementptr inbounds i8* %488, i64 1
  %490 = load i8* %489, align 1
  %491 = sext i8 %490 to i32
  %492 = icmp sle i32 %491, 90
  br i1 %492, label %493, label %499

; <label>:493                                     ; preds = %487
  %494 = load i8** %s, align 8
  %495 = getelementptr inbounds i8* %494, i64 1
  %496 = load i8* %495, align 1
  %497 = sext i8 %496 to i32
  %498 = add nsw i32 %497, 32
  br label %504

; <label>:499                                     ; preds = %487, %481
  %500 = load i8** %s, align 8
  %501 = getelementptr inbounds i8* %500, i64 1
  %502 = load i8* %501, align 1
  %503 = sext i8 %502 to i32
  br label %504

; <label>:504                                     ; preds = %499, %493
  %505 = phi i32 [ %498, %493 ], [ %503, %499 ]
  %506 = icmp eq i32 %505, 115
  br i1 %506, label %507, label %526

; <label>:507                                     ; preds = %504
  %508 = load i8** %l1, align 8
  %509 = getelementptr inbounds i8* %508, i64 0
  %510 = load i8* %509, align 1
  %511 = zext i8 %510 to i32
  %512 = icmp eq i32 %511, 195
  br i1 %512, label %513, label %526

; <label>:513                                     ; preds = %507
  %514 = load i8** %e2, align 8
  %515 = load i8** %l1, align 8
  %516 = ptrtoint i8* %514 to i64
  %517 = ptrtoint i8* %515 to i64
  %518 = sub i64 %516, %517
  %519 = icmp sge i64 %518, 2
  br i1 %519, label %520, label %526

; <label>:520                                     ; preds = %513
  %521 = load i8** %l1, align 8
  %522 = getelementptr inbounds i8* %521, i64 1
  %523 = load i8* %522, align 1
  %524 = zext i8 %523 to i32
  %525 = icmp eq i32 %524, 159
  br i1 %525, label %527, label %526

; <label>:526                                     ; preds = %520, %513, %507, %504, %478, %475, %448
  br label %6127

; <label>:527                                     ; preds = %520
  br label %528

; <label>:528                                     ; preds = %527, %433
  %529 = load i8** %e2, align 8
  store i8* %529, i8** %locinput, align 8
  %530 = load i8** %locinput, align 8
  %531 = load i8* %530, align 1
  %532 = zext i8 %531 to i32
  store i32 %532, i32* %nextchr, align 4
  br label %6120

; <label>:533                                     ; preds = %429
  %534 = load i8** %s, align 8
  %535 = load i8* %534, align 1
  %536 = zext i8 %535 to i32
  %537 = load i32* %nextchr, align 4
  %538 = icmp ne i32 %536, %537
  br i1 %538, label %539, label %556

; <label>:539                                     ; preds = %533
  %540 = load i8** %s, align 8
  %541 = load i8* %540, align 1
  %542 = zext i8 %541 to i32
  %543 = load i32* %nextchr, align 4
  %544 = sext i32 %543 to i64
  %545 = load %struct.regnode** %scan, align 8
  %546 = getelementptr inbounds %struct.regnode* %545, i32 0, i32 1
  %547 = load i8* %546, align 1
  %548 = zext i8 %547 to i32
  %549 = icmp eq i32 %548, 34
  %550 = select i1 %549, i8* getelementptr inbounds ([0 x i8]* @PL_fold, i32 0, i32 0), i8* getelementptr inbounds ([0 x i8]* @PL_fold_locale, i32 0, i32 0)
  %551 = getelementptr inbounds i8* %550, i64 %544
  %552 = load i8* %551, align 1
  %553 = zext i8 %552 to i32
  %554 = icmp ne i32 %542, %553
  br i1 %554, label %555, label %556

; <label>:555                                     ; preds = %539
  br label %6127

; <label>:556                                     ; preds = %539, %533
  %557 = load i8** @PL_regeol, align 8
  %558 = load i8** %locinput, align 8
  %559 = ptrtoint i8* %557 to i64
  %560 = ptrtoint i8* %558 to i64
  %561 = sub i64 %559, %560
  %562 = load i32* %ln, align 4
  %563 = sext i32 %562 to i64
  %564 = icmp slt i64 %561, %563
  br i1 %564, label %565, label %566

; <label>:565                                     ; preds = %556
  br label %6127

; <label>:566                                     ; preds = %556
  %567 = load i32* %ln, align 4
  %568 = icmp sgt i32 %567, 1
  br i1 %568, label %569, label %588

; <label>:569                                     ; preds = %566
  %570 = load %struct.regnode** %scan, align 8
  %571 = getelementptr inbounds %struct.regnode* %570, i32 0, i32 1
  %572 = load i8* %571, align 1
  %573 = zext i8 %572 to i32
  %574 = icmp eq i32 %573, 34
  br i1 %574, label %575, label %581

; <label>:575                                     ; preds = %569
  %576 = load i8** %s, align 8
  %577 = load i8** %locinput, align 8
  %578 = load i32* %ln, align 4
  %579 = call i32 @Perl_ibcmp(i8* %576, i8* %577, i32 %578)
  %580 = icmp ne i32 %579, 0
  br i1 %580, label %587, label %588

; <label>:581                                     ; preds = %569
  %582 = load i8** %s, align 8
  %583 = load i8** %locinput, align 8
  %584 = load i32* %ln, align 4
  %585 = call i32 @Perl_ibcmp_locale(i8* %582, i8* %583, i32 %584)
  %586 = icmp ne i32 %585, 0
  br i1 %586, label %587, label %588

; <label>:587                                     ; preds = %581, %575
  br label %6127

; <label>:588                                     ; preds = %581, %575, %566
  %589 = load i32* %ln, align 4
  %590 = load i8** %locinput, align 8
  %591 = sext i32 %589 to i64
  %592 = getelementptr inbounds i8* %590, i64 %591
  store i8* %592, i8** %locinput, align 8
  %593 = load i8** %locinput, align 8
  %594 = load i8* %593, align 1
  %595 = zext i8 %594 to i32
  store i32 %595, i32* %nextchr, align 4
  br label %6120

; <label>:596                                     ; preds = %24
  %597 = load i8* %do_utf8, align 1
  %598 = icmp ne i8 %597, 0
  br i1 %598, label %599, label %636

; <label>:599                                     ; preds = %596
  %600 = load i8** @PL_regeol, align 8
  %601 = load i8** %locinput, align 8
  %602 = ptrtoint i8* %600 to i64
  %603 = ptrtoint i8* %601 to i64
  %604 = sub i64 %602, %603
  store i64 %604, i64* %inclasslen, align 8
  %605 = load %struct.regnode** %scan, align 8
  %606 = load i8** %locinput, align 8
  %607 = load i8* %do_utf8, align 1
  %608 = sext i8 %607 to i32
  %609 = call i32 (%struct.regnode*, i8*, i64*, i32, ...)* bitcast (i32 (...)* @reginclass to i32 (%struct.regnode*, i8*, i64*, i32, ...)*)(%struct.regnode* %605, i8* %606, i64* %inclasslen, i32 %608)
  %610 = icmp ne i32 %609, 0
  br i1 %610, label %612, label %611

; <label>:611                                     ; preds = %599
  br label %688

; <label>:612                                     ; preds = %599
  %613 = load i8** %locinput, align 8
  %614 = load i8** @PL_regeol, align 8
  %615 = icmp uge i8* %613, %614
  br i1 %615, label %616, label %617

; <label>:616                                     ; preds = %612
  br label %6127

; <label>:617                                     ; preds = %612
  %618 = load i64* %inclasslen, align 8
  %619 = icmp ne i64 %618, 0
  br i1 %619, label %620, label %622

; <label>:620                                     ; preds = %617
  %621 = load i64* %inclasslen, align 8
  br label %629

; <label>:622                                     ; preds = %617
  %623 = load i8** %locinput, align 8
  %624 = load i8* %623, align 1
  %625 = zext i8 %624 to i64
  %626 = getelementptr inbounds [0 x i8]* @PL_utf8skip, i32 0, i64 %625
  %627 = load i8* %626, align 1
  %628 = zext i8 %627 to i64
  br label %629

; <label>:629                                     ; preds = %622, %620
  %630 = phi i64 [ %621, %620 ], [ %628, %622 ]
  %631 = load i8** %locinput, align 8
  %632 = getelementptr inbounds i8* %631, i64 %630
  store i8* %632, i8** %locinput, align 8
  %633 = load i8** %locinput, align 8
  %634 = load i8* %633, align 1
  %635 = zext i8 %634 to i32
  store i32 %635, i32* %nextchr, align 4
  br label %6120

; <label>:636                                     ; preds = %596
  %637 = load i32* %nextchr, align 4
  %638 = icmp slt i32 %637, 0
  br i1 %638, label %639, label %643

; <label>:639                                     ; preds = %636
  %640 = load i8** %locinput, align 8
  %641 = load i8* %640, align 1
  %642 = zext i8 %641 to i32
  store i32 %642, i32* %nextchr, align 4
  br label %643

; <label>:643                                     ; preds = %639, %636
  %644 = load %struct.regnode** %scan, align 8
  %645 = getelementptr inbounds %struct.regnode* %644, i32 0, i32 0
  %646 = load i8* %645, align 1
  %647 = zext i8 %646 to i32
  %648 = icmp ne i32 %647, 0
  br i1 %648, label %649, label %654

; <label>:649                                     ; preds = %643
  %650 = load %struct.regnode** %scan, align 8
  %651 = load i8** %locinput, align 8
  %652 = call i32 (%struct.regnode*, i8*, i32, i32, ...)* bitcast (i32 (...)* @reginclass to i32 (%struct.regnode*, i8*, i32, i32, ...)*)(%struct.regnode* %650, i8* %651, i32 0, i32 0)
  %653 = icmp ne i32 %652, 0
  br i1 %653, label %675, label %674

; <label>:654                                     ; preds = %643
  %655 = load i8** %locinput, align 8
  %656 = load i8* %655, align 1
  %657 = zext i8 %656 to i32
  %658 = ashr i32 %657, 3
  %659 = and i32 %658, 31
  %660 = sext i32 %659 to i64
  %661 = load %struct.regnode** %scan, align 8
  %662 = bitcast %struct.regnode* %661 to %struct.regnode_charclass*
  %663 = getelementptr inbounds %struct.regnode_charclass* %662, i32 0, i32 4
  %664 = getelementptr inbounds [32 x i8]* %663, i32 0, i64 %660
  %665 = load i8* %664, align 1
  %666 = sext i8 %665 to i32
  %667 = load i8** %locinput, align 8
  %668 = load i8* %667, align 1
  %669 = zext i8 %668 to i32
  %670 = and i32 %669, 7
  %671 = shl i32 1, %670
  %672 = and i32 %666, %671
  %673 = icmp ne i32 %672, 0
  br i1 %673, label %675, label %674

; <label>:674                                     ; preds = %654, %649
  br label %688

; <label>:675                                     ; preds = %654, %649
  %676 = load i32* %nextchr, align 4
  %677 = icmp ne i32 %676, 0
  br i1 %677, label %683, label %678

; <label>:678                                     ; preds = %675
  %679 = load i8** %locinput, align 8
  %680 = load i8** @PL_regeol, align 8
  %681 = icmp uge i8* %679, %680
  br i1 %681, label %682, label %683

; <label>:682                                     ; preds = %678
  br label %6127

; <label>:683                                     ; preds = %678, %675
  %684 = load i8** %locinput, align 8
  %685 = getelementptr inbounds i8* %684, i32 1
  store i8* %685, i8** %locinput, align 8
  %686 = load i8* %685, align 1
  %687 = zext i8 %686 to i32
  store i32 %687, i32* %nextchr, align 4
  br label %6120

; <label>:688                                     ; preds = %674, %611
  %689 = load %struct.regnode** %scan, align 8
  %690 = bitcast %struct.regnode* %689 to %struct.regnode_charclass*
  %691 = getelementptr inbounds %struct.regnode_charclass* %690, i32 0, i32 4
  %692 = getelementptr inbounds [32 x i8]* %691, i32 0, i64 27
  %693 = load i8* %692, align 1
  %694 = sext i8 %693 to i32
  %695 = and i32 %694, 128
  %696 = icmp ne i32 %695, 0
  br i1 %696, label %697, label %774

; <label>:697                                     ; preds = %688
  %698 = load %struct.regnode** %scan, align 8
  %699 = getelementptr inbounds %struct.regnode* %698, i32 0, i32 0
  %700 = load i8* %699, align 1
  %701 = zext i8 %700 to i32
  %702 = and i32 %701, 32
  %703 = icmp ne i32 %702, 0
  br i1 %703, label %704, label %774

; <label>:704                                     ; preds = %697
  %705 = load %struct.regnode** %scan, align 8
  %706 = getelementptr inbounds %struct.regnode* %705, i32 0, i32 0
  %707 = load i8* %706, align 1
  %708 = zext i8 %707 to i32
  %709 = and i32 %708, 2
  %710 = icmp ne i32 %709, 0
  br i1 %710, label %711, label %774

; <label>:711                                     ; preds = %704
  %712 = load i8** @PL_regeol, align 8
  %713 = load i8** %locinput, align 8
  %714 = getelementptr inbounds i8* %713, i64 1
  %715 = icmp ugt i8* %712, %714
  br i1 %715, label %716, label %774

; <label>:716                                     ; preds = %711
  %717 = load i8** %locinput, align 8
  %718 = getelementptr inbounds i8* %717, i64 0
  %719 = load i8* %718, align 1
  %720 = sext i8 %719 to i32
  %721 = icmp sge i32 %720, 65
  br i1 %721, label %722, label %734

; <label>:722                                     ; preds = %716
  %723 = load i8** %locinput, align 8
  %724 = getelementptr inbounds i8* %723, i64 0
  %725 = load i8* %724, align 1
  %726 = sext i8 %725 to i32
  %727 = icmp sle i32 %726, 90
  br i1 %727, label %728, label %734

; <label>:728                                     ; preds = %722
  %729 = load i8** %locinput, align 8
  %730 = getelementptr inbounds i8* %729, i64 0
  %731 = load i8* %730, align 1
  %732 = sext i8 %731 to i32
  %733 = add nsw i32 %732, 32
  br label %739

; <label>:734                                     ; preds = %722, %716
  %735 = load i8** %locinput, align 8
  %736 = getelementptr inbounds i8* %735, i64 0
  %737 = load i8* %736, align 1
  %738 = sext i8 %737 to i32
  br label %739

; <label>:739                                     ; preds = %734, %728
  %740 = phi i32 [ %733, %728 ], [ %738, %734 ]
  %741 = icmp eq i32 %740, 115
  br i1 %741, label %742, label %774

; <label>:742                                     ; preds = %739
  %743 = load i8** %locinput, align 8
  %744 = getelementptr inbounds i8* %743, i64 1
  %745 = load i8* %744, align 1
  %746 = sext i8 %745 to i32
  %747 = icmp sge i32 %746, 65
  br i1 %747, label %748, label %760

; <label>:748                                     ; preds = %742
  %749 = load i8** %locinput, align 8
  %750 = getelementptr inbounds i8* %749, i64 1
  %751 = load i8* %750, align 1
  %752 = sext i8 %751 to i32
  %753 = icmp sle i32 %752, 90
  br i1 %753, label %754, label %760

; <label>:754                                     ; preds = %748
  %755 = load i8** %locinput, align 8
  %756 = getelementptr inbounds i8* %755, i64 1
  %757 = load i8* %756, align 1
  %758 = sext i8 %757 to i32
  %759 = add nsw i32 %758, 32
  br label %765

; <label>:760                                     ; preds = %748, %742
  %761 = load i8** %locinput, align 8
  %762 = getelementptr inbounds i8* %761, i64 1
  %763 = load i8* %762, align 1
  %764 = sext i8 %763 to i32
  br label %765

; <label>:765                                     ; preds = %760, %754
  %766 = phi i32 [ %759, %754 ], [ %764, %760 ]
  %767 = icmp eq i32 %766, 115
  br i1 %767, label %768, label %774

; <label>:768                                     ; preds = %765
  %769 = load i8** %locinput, align 8
  %770 = getelementptr inbounds i8* %769, i64 2
  store i8* %770, i8** %locinput, align 8
  %771 = load i8** %locinput, align 8
  %772 = load i8* %771, align 1
  %773 = zext i8 %772 to i32
  store i32 %773, i32* %nextchr, align 4
  br label %775

; <label>:774                                     ; preds = %765, %739, %711, %704, %697, %688
  br label %6127

; <label>:775                                     ; preds = %768
  br label %6120

; <label>:776                                     ; preds = %24
  %777 = load i32* @PL_reg_flags, align 4
  %778 = or i32 %777, 1
  store i32 %778, i32* @PL_reg_flags, align 4
  br label %779

; <label>:779                                     ; preds = %24, %776
  %780 = load i32* %nextchr, align 4
  %781 = icmp ne i32 %780, 0
  br i1 %781, label %783, label %782

; <label>:782                                     ; preds = %779
  br label %6127

; <label>:783                                     ; preds = %779
  %784 = load i8* %do_utf8, align 1
  %785 = icmp ne i8 %784, 0
  br i1 %785, label %786, label %855

; <label>:786                                     ; preds = %783
  %787 = load %struct.sv** @PL_utf8_alnum, align 8
  %788 = icmp ne %struct.sv* %787, null
  br i1 %788, label %791, label %789

; <label>:789                                     ; preds = %786
  call void @Perl_push_scope()
  call void @Perl_save_re_context()
  %790 = call signext i8 @Perl_is_utf8_alnum(i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0))
  call void @Perl_pop_scope()
  br label %791

; <label>:791                                     ; preds = %789, %786
  %792 = load %struct.regnode** %scan, align 8
  %793 = getelementptr inbounds %struct.regnode* %792, i32 0, i32 1
  %794 = load i8* %793, align 1
  %795 = zext i8 %794 to i32
  %796 = icmp eq i32 %795, 18
  br i1 %796, label %797, label %803

; <label>:797                                     ; preds = %791
  %798 = load %struct.sv** @PL_utf8_alnum, align 8
  %799 = load i8** %locinput, align 8
  %800 = load i8* %do_utf8, align 1
  %801 = call i64 @Perl_swash_fetch(%struct.sv* %798, i8* %799, i8 signext %800)
  %802 = icmp ne i64 %801, 0
  br i1 %802, label %843, label %842

; <label>:803                                     ; preds = %791
  %804 = load i8** %locinput, align 8
  %805 = call i64 @Perl_utf8_to_uvchr(i8* %804, i64* null)
  %806 = icmp ult i64 %805, 256
  br i1 %806, label %807, label %833

; <label>:807                                     ; preds = %803
  %808 = load i8** %locinput, align 8
  %809 = call i64 @Perl_utf8_to_uvchr(i8* %808, i64* null)
  %810 = and i64 %809, -128
  %811 = icmp eq i64 %810, 0
  br i1 %811, label %812, label %830

; <label>:812                                     ; preds = %807
  %813 = load i8** %locinput, align 8
  %814 = call i64 @Perl_utf8_to_uvchr(i8* %813, i64* null)
  %815 = trunc i64 %814 to i32
  %816 = sext i32 %815 to i64
  %817 = call i16** @__ctype_b_loc()
  %818 = load i16** %817, align 8
  %819 = getelementptr inbounds i16* %818, i64 %816
  %820 = load i16* %819, align 2
  %821 = zext i16 %820 to i32
  %822 = and i32 %821, 8
  %823 = icmp ne i32 %822, 0
  br i1 %823, label %828, label %824

; <label>:824                                     ; preds = %812
  %825 = load i8** %locinput, align 8
  %826 = call i64 @Perl_utf8_to_uvchr(i8* %825, i64* null)
  %827 = icmp eq i64 %826, 95
  br label %828

; <label>:828                                     ; preds = %824, %812
  %829 = phi i1 [ true, %812 ], [ %827, %824 ]
  br label %830

; <label>:830                                     ; preds = %828, %807
  %831 = phi i1 [ false, %807 ], [ %829, %828 ]
  %832 = zext i1 %831 to i32
  br label %838

; <label>:833                                     ; preds = %803
  %834 = load i8** %locinput, align 8
  %835 = call i64 @Perl_utf8_to_uvchr(i8* %834, i64* null)
  %836 = call signext i8 @Perl_is_uni_alnum_lc(i64 %835)
  %837 = sext i8 %836 to i32
  br label %838

; <label>:838                                     ; preds = %833, %830
  %839 = phi i32 [ %832, %830 ], [ %837, %833 ]
  %840 = sext i32 %839 to i64
  %841 = icmp ne i64 %840, 0
  br i1 %841, label %843, label %842

; <label>:842                                     ; preds = %838, %797
  br label %6127

; <label>:843                                     ; preds = %838, %797
  %844 = load i32* %nextchr, align 4
  %845 = sext i32 %844 to i64
  %846 = getelementptr inbounds [0 x i8]* @PL_utf8skip, i32 0, i64 %845
  %847 = load i8* %846, align 1
  %848 = zext i8 %847 to i32
  %849 = load i8** %locinput, align 8
  %850 = sext i32 %848 to i64
  %851 = getelementptr inbounds i8* %849, i64 %850
  store i8* %851, i8** %locinput, align 8
  %852 = load i8** %locinput, align 8
  %853 = load i8* %852, align 1
  %854 = zext i8 %853 to i32
  store i32 %854, i32* %nextchr, align 4
  br label %6120

; <label>:855                                     ; preds = %783
  %856 = load %struct.regnode** %scan, align 8
  %857 = getelementptr inbounds %struct.regnode* %856, i32 0, i32 1
  %858 = load i8* %857, align 1
  %859 = zext i8 %858 to i32
  %860 = icmp eq i32 %859, 18
  br i1 %860, label %861, label %882

; <label>:861                                     ; preds = %855
  %862 = load i32* %nextchr, align 4
  %863 = icmp sge i32 %862, 65
  br i1 %863, label %864, label %867

; <label>:864                                     ; preds = %861
  %865 = load i32* %nextchr, align 4
  %866 = icmp sle i32 %865, 90
  br i1 %866, label %900, label %867

; <label>:867                                     ; preds = %864, %861
  %868 = load i32* %nextchr, align 4
  %869 = icmp sge i32 %868, 97
  br i1 %869, label %870, label %873

; <label>:870                                     ; preds = %867
  %871 = load i32* %nextchr, align 4
  %872 = icmp sle i32 %871, 122
  br i1 %872, label %900, label %873

; <label>:873                                     ; preds = %870, %867
  %874 = load i32* %nextchr, align 4
  %875 = icmp sge i32 %874, 48
  br i1 %875, label %876, label %879

; <label>:876                                     ; preds = %873
  %877 = load i32* %nextchr, align 4
  %878 = icmp sle i32 %877, 57
  br i1 %878, label %900, label %879

; <label>:879                                     ; preds = %876, %873
  %880 = load i32* %nextchr, align 4
  %881 = icmp eq i32 %880, 95
  br i1 %881, label %900, label %899

; <label>:882                                     ; preds = %855
  %883 = load i32* %nextchr, align 4
  %884 = and i32 %883, -128
  %885 = icmp eq i32 %884, 0
  br i1 %885, label %886, label %899

; <label>:886                                     ; preds = %882
  %887 = load i32* %nextchr, align 4
  %888 = sext i32 %887 to i64
  %889 = call i16** @__ctype_b_loc()
  %890 = load i16** %889, align 8
  %891 = getelementptr inbounds i16* %890, i64 %888
  %892 = load i16* %891, align 2
  %893 = zext i16 %892 to i32
  %894 = and i32 %893, 8
  %895 = icmp ne i32 %894, 0
  br i1 %895, label %900, label %896

; <label>:896                                     ; preds = %886
  %897 = load i32* %nextchr, align 4
  %898 = icmp eq i32 %897, 95
  br i1 %898, label %900, label %899

; <label>:899                                     ; preds = %896, %882, %879
  br label %6127

; <label>:900                                     ; preds = %896, %886, %879, %876, %870, %864
  %901 = load i8** %locinput, align 8
  %902 = getelementptr inbounds i8* %901, i32 1
  store i8* %902, i8** %locinput, align 8
  %903 = load i8* %902, align 1
  %904 = zext i8 %903 to i32
  store i32 %904, i32* %nextchr, align 4
  br label %6120

; <label>:905                                     ; preds = %24
  %906 = load i32* @PL_reg_flags, align 4
  %907 = or i32 %906, 1
  store i32 %907, i32* @PL_reg_flags, align 4
  br label %908

; <label>:908                                     ; preds = %24, %905
  %909 = load i32* %nextchr, align 4
  %910 = icmp ne i32 %909, 0
  br i1 %910, label %916, label %911

; <label>:911                                     ; preds = %908
  %912 = load i8** %locinput, align 8
  %913 = load i8** @PL_regeol, align 8
  %914 = icmp uge i8* %912, %913
  br i1 %914, label %915, label %916

; <label>:915                                     ; preds = %911
  br label %6127

; <label>:916                                     ; preds = %911, %908
  %917 = load i8* %do_utf8, align 1
  %918 = icmp ne i8 %917, 0
  br i1 %918, label %919, label %988

; <label>:919                                     ; preds = %916
  %920 = load %struct.sv** @PL_utf8_alnum, align 8
  %921 = icmp ne %struct.sv* %920, null
  br i1 %921, label %924, label %922

; <label>:922                                     ; preds = %919
  call void @Perl_push_scope()
  call void @Perl_save_re_context()
  %923 = call signext i8 @Perl_is_utf8_alnum(i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0))
  call void @Perl_pop_scope()
  br label %924

; <label>:924                                     ; preds = %922, %919
  %925 = load %struct.regnode** %scan, align 8
  %926 = getelementptr inbounds %struct.regnode* %925, i32 0, i32 1
  %927 = load i8* %926, align 1
  %928 = zext i8 %927 to i32
  %929 = icmp eq i32 %928, 20
  br i1 %929, label %930, label %936

; <label>:930                                     ; preds = %924
  %931 = load %struct.sv** @PL_utf8_alnum, align 8
  %932 = load i8** %locinput, align 8
  %933 = load i8* %do_utf8, align 1
  %934 = call i64 @Perl_swash_fetch(%struct.sv* %931, i8* %932, i8 signext %933)
  %935 = icmp ne i64 %934, 0
  br i1 %935, label %975, label %976

; <label>:936                                     ; preds = %924
  %937 = load i8** %locinput, align 8
  %938 = call i64 @Perl_utf8_to_uvchr(i8* %937, i64* null)
  %939 = icmp ult i64 %938, 256
  br i1 %939, label %940, label %966

; <label>:940                                     ; preds = %936
  %941 = load i8** %locinput, align 8
  %942 = call i64 @Perl_utf8_to_uvchr(i8* %941, i64* null)
  %943 = and i64 %942, -128
  %944 = icmp eq i64 %943, 0
  br i1 %944, label %945, label %963

; <label>:945                                     ; preds = %940
  %946 = load i8** %locinput, align 8
  %947 = call i64 @Perl_utf8_to_uvchr(i8* %946, i64* null)
  %948 = trunc i64 %947 to i32
  %949 = sext i32 %948 to i64
  %950 = call i16** @__ctype_b_loc()
  %951 = load i16** %950, align 8
  %952 = getelementptr inbounds i16* %951, i64 %949
  %953 = load i16* %952, align 2
  %954 = zext i16 %953 to i32
  %955 = and i32 %954, 8
  %956 = icmp ne i32 %955, 0
  br i1 %956, label %961, label %957

; <label>:957                                     ; preds = %945
  %958 = load i8** %locinput, align 8
  %959 = call i64 @Perl_utf8_to_uvchr(i8* %958, i64* null)
  %960 = icmp eq i64 %959, 95
  br label %961

; <label>:961                                     ; preds = %957, %945
  %962 = phi i1 [ true, %945 ], [ %960, %957 ]
  br label %963

; <label>:963                                     ; preds = %961, %940
  %964 = phi i1 [ false, %940 ], [ %962, %961 ]
  %965 = zext i1 %964 to i32
  br label %971

; <label>:966                                     ; preds = %936
  %967 = load i8** %locinput, align 8
  %968 = call i64 @Perl_utf8_to_uvchr(i8* %967, i64* null)
  %969 = call signext i8 @Perl_is_uni_alnum_lc(i64 %968)
  %970 = sext i8 %969 to i32
  br label %971

; <label>:971                                     ; preds = %966, %963
  %972 = phi i32 [ %965, %963 ], [ %970, %966 ]
  %973 = sext i32 %972 to i64
  %974 = icmp ne i64 %973, 0
  br i1 %974, label %975, label %976

; <label>:975                                     ; preds = %971, %930
  br label %6127

; <label>:976                                     ; preds = %971, %930
  %977 = load i32* %nextchr, align 4
  %978 = sext i32 %977 to i64
  %979 = getelementptr inbounds [0 x i8]* @PL_utf8skip, i32 0, i64 %978
  %980 = load i8* %979, align 1
  %981 = zext i8 %980 to i32
  %982 = load i8** %locinput, align 8
  %983 = sext i32 %981 to i64
  %984 = getelementptr inbounds i8* %982, i64 %983
  store i8* %984, i8** %locinput, align 8
  %985 = load i8** %locinput, align 8
  %986 = load i8* %985, align 1
  %987 = zext i8 %986 to i32
  store i32 %987, i32* %nextchr, align 4
  br label %6120

; <label>:988                                     ; preds = %916
  %989 = load %struct.regnode** %scan, align 8
  %990 = getelementptr inbounds %struct.regnode* %989, i32 0, i32 1
  %991 = load i8* %990, align 1
  %992 = zext i8 %991 to i32
  %993 = icmp eq i32 %992, 20
  br i1 %993, label %994, label %1015

; <label>:994                                     ; preds = %988
  %995 = load i32* %nextchr, align 4
  %996 = icmp sge i32 %995, 65
  br i1 %996, label %997, label %1000

; <label>:997                                     ; preds = %994
  %998 = load i32* %nextchr, align 4
  %999 = icmp sle i32 %998, 90
  br i1 %999, label %1032, label %1000

; <label>:1000                                    ; preds = %997, %994
  %1001 = load i32* %nextchr, align 4
  %1002 = icmp sge i32 %1001, 97
  br i1 %1002, label %1003, label %1006

; <label>:1003                                    ; preds = %1000
  %1004 = load i32* %nextchr, align 4
  %1005 = icmp sle i32 %1004, 122
  br i1 %1005, label %1032, label %1006

; <label>:1006                                    ; preds = %1003, %1000
  %1007 = load i32* %nextchr, align 4
  %1008 = icmp sge i32 %1007, 48
  br i1 %1008, label %1009, label %1012

; <label>:1009                                    ; preds = %1006
  %1010 = load i32* %nextchr, align 4
  %1011 = icmp sle i32 %1010, 57
  br i1 %1011, label %1032, label %1012

; <label>:1012                                    ; preds = %1009, %1006
  %1013 = load i32* %nextchr, align 4
  %1014 = icmp eq i32 %1013, 95
  br i1 %1014, label %1032, label %1033

; <label>:1015                                    ; preds = %988
  %1016 = load i32* %nextchr, align 4
  %1017 = and i32 %1016, -128
  %1018 = icmp eq i32 %1017, 0
  br i1 %1018, label %1019, label %1033

; <label>:1019                                    ; preds = %1015
  %1020 = load i32* %nextchr, align 4
  %1021 = sext i32 %1020 to i64
  %1022 = call i16** @__ctype_b_loc()
  %1023 = load i16** %1022, align 8
  %1024 = getelementptr inbounds i16* %1023, i64 %1021
  %1025 = load i16* %1024, align 2
  %1026 = zext i16 %1025 to i32
  %1027 = and i32 %1026, 8
  %1028 = icmp ne i32 %1027, 0
  br i1 %1028, label %1032, label %1029

; <label>:1029                                    ; preds = %1019
  %1030 = load i32* %nextchr, align 4
  %1031 = icmp eq i32 %1030, 95
  br i1 %1031, label %1032, label %1033

; <label>:1032                                    ; preds = %1029, %1019, %1012, %1009, %1003, %997
  br label %6127

; <label>:1033                                    ; preds = %1029, %1015, %1012
  %1034 = load i8** %locinput, align 8
  %1035 = getelementptr inbounds i8* %1034, i32 1
  store i8* %1035, i8** %locinput, align 8
  %1036 = load i8* %1035, align 1
  %1037 = zext i8 %1036 to i32
  store i32 %1037, i32* %nextchr, align 4
  br label %6120

; <label>:1038                                    ; preds = %24, %24
  %1039 = load i32* @PL_reg_flags, align 4
  %1040 = or i32 %1039, 1
  store i32 %1040, i32* @PL_reg_flags, align 4
  br label %1041

; <label>:1041                                    ; preds = %24, %24, %1038
  %1042 = load i8* %do_utf8, align 1
  %1043 = icmp ne i8 %1042, 0
  br i1 %1043, label %1044, label %1160

; <label>:1044                                    ; preds = %1041
  %1045 = load i8** %locinput, align 8
  %1046 = load i8** @PL_bostr, align 8
  %1047 = icmp eq i8* %1045, %1046
  br i1 %1047, label %1048, label %1049

; <label>:1048                                    ; preds = %1044
  store i32 10, i32* %ln, align 4
  br label %1064

; <label>:1049                                    ; preds = %1044
  %1050 = load i8** %locinput, align 8
  %1051 = load i8** @PL_bostr, align 8
  %1052 = call i32 (i8*, i32, i8*, ...)* bitcast (i32 (...)* @reghop3 to i32 (i8*, i32, i8*, ...)*)(i8* %1050, i32 -1, i8* %1051)
  %1053 = sext i32 %1052 to i64
  %1054 = inttoptr i64 %1053 to i8*
  store i8* %1054, i8** %r, align 8
  %1055 = load i8** %r, align 8
  %1056 = load i8** %r, align 8
  %1057 = load i8* %1056, align 1
  %1058 = zext i8 %1057 to i64
  %1059 = getelementptr inbounds [0 x i8]* @PL_utf8skip, i32 0, i64 %1058
  %1060 = load i8* %1059, align 1
  %1061 = zext i8 %1060 to i64
  %1062 = call i64 @Perl_utf8n_to_uvuni(i8* %1055, i64 %1061, i64* null, i32 0)
  %1063 = trunc i64 %1062 to i32
  store i32 %1063, i32* %ln, align 4
  br label %1064

; <label>:1064                                    ; preds = %1049, %1048
  %1065 = load %struct.regnode** %scan, align 8
  %1066 = getelementptr inbounds %struct.regnode* %1065, i32 0, i32 1
  %1067 = load i8* %1066, align 1
  %1068 = zext i8 %1067 to i32
  %1069 = icmp eq i32 %1068, 9
  br i1 %1069, label %1076, label %1070

; <label>:1070                                    ; preds = %1064
  %1071 = load %struct.regnode** %scan, align 8
  %1072 = getelementptr inbounds %struct.regnode* %1071, i32 0, i32 1
  %1073 = load i8* %1072, align 1
  %1074 = zext i8 %1073 to i32
  %1075 = icmp eq i32 %1074, 11
  br i1 %1075, label %1076, label %1091

; <label>:1076                                    ; preds = %1070, %1064
  %1077 = load i32* %ln, align 4
  %1078 = sext i32 %1077 to i64
  %1079 = call signext i8 @Perl_is_uni_alnum(i64 %1078)
  %1080 = sext i8 %1079 to i32
  store i32 %1080, i32* %ln, align 4
  %1081 = load %struct.sv** @PL_utf8_alnum, align 8
  %1082 = icmp ne %struct.sv* %1081, null
  br i1 %1082, label %1085, label %1083

; <label>:1083                                    ; preds = %1076
  call void @Perl_push_scope()
  call void @Perl_save_re_context()
  %1084 = call signext i8 @Perl_is_utf8_alnum(i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0))
  call void @Perl_pop_scope()
  br label %1085

; <label>:1085                                    ; preds = %1083, %1076
  %1086 = load %struct.sv** @PL_utf8_alnum, align 8
  %1087 = load i8** %locinput, align 8
  %1088 = load i8* %do_utf8, align 1
  %1089 = call i64 @Perl_swash_fetch(%struct.sv* %1086, i8* %1087, i8 signext %1088)
  %1090 = trunc i64 %1089 to i32
  store i32 %1090, i32* %n, align 4
  br label %1159

; <label>:1091                                    ; preds = %1070
  %1092 = load i32* %ln, align 4
  %1093 = icmp slt i32 %1092, 256
  br i1 %1093, label %1094, label %1116

; <label>:1094                                    ; preds = %1091
  %1095 = load i32* %ln, align 4
  %1096 = and i32 %1095, -128
  %1097 = icmp eq i32 %1096, 0
  br i1 %1097, label %1098, label %1113

; <label>:1098                                    ; preds = %1094
  %1099 = load i32* %ln, align 4
  %1100 = sext i32 %1099 to i64
  %1101 = call i16** @__ctype_b_loc()
  %1102 = load i16** %1101, align 8
  %1103 = getelementptr inbounds i16* %1102, i64 %1100
  %1104 = load i16* %1103, align 2
  %1105 = zext i16 %1104 to i32
  %1106 = and i32 %1105, 8
  %1107 = icmp ne i32 %1106, 0
  br i1 %1107, label %1111, label %1108

; <label>:1108                                    ; preds = %1098
  %1109 = load i32* %ln, align 4
  %1110 = icmp eq i32 %1109, 95
  br label %1111

; <label>:1111                                    ; preds = %1108, %1098
  %1112 = phi i1 [ true, %1098 ], [ %1110, %1108 ]
  br label %1113

; <label>:1113                                    ; preds = %1111, %1094
  %1114 = phi i1 [ false, %1094 ], [ %1112, %1111 ]
  %1115 = zext i1 %1114 to i32
  br label %1121

; <label>:1116                                    ; preds = %1091
  %1117 = load i32* %ln, align 4
  %1118 = sext i32 %1117 to i64
  %1119 = call signext i8 @Perl_is_uni_alnum_lc(i64 %1118)
  %1120 = sext i8 %1119 to i32
  br label %1121

; <label>:1121                                    ; preds = %1116, %1113
  %1122 = phi i32 [ %1115, %1113 ], [ %1120, %1116 ]
  store i32 %1122, i32* %ln, align 4
  %1123 = load i8** %locinput, align 8
  %1124 = call i64 @Perl_utf8_to_uvchr(i8* %1123, i64* null)
  %1125 = icmp ult i64 %1124, 256
  br i1 %1125, label %1126, label %1152

; <label>:1126                                    ; preds = %1121
  %1127 = load i8** %locinput, align 8
  %1128 = call i64 @Perl_utf8_to_uvchr(i8* %1127, i64* null)
  %1129 = and i64 %1128, -128
  %1130 = icmp eq i64 %1129, 0
  br i1 %1130, label %1131, label %1149

; <label>:1131                                    ; preds = %1126
  %1132 = load i8** %locinput, align 8
  %1133 = call i64 @Perl_utf8_to_uvchr(i8* %1132, i64* null)
  %1134 = trunc i64 %1133 to i32
  %1135 = sext i32 %1134 to i64
  %1136 = call i16** @__ctype_b_loc()
  %1137 = load i16** %1136, align 8
  %1138 = getelementptr inbounds i16* %1137, i64 %1135
  %1139 = load i16* %1138, align 2
  %1140 = zext i16 %1139 to i32
  %1141 = and i32 %1140, 8
  %1142 = icmp ne i32 %1141, 0
  br i1 %1142, label %1147, label %1143

; <label>:1143                                    ; preds = %1131
  %1144 = load i8** %locinput, align 8
  %1145 = call i64 @Perl_utf8_to_uvchr(i8* %1144, i64* null)
  %1146 = icmp eq i64 %1145, 95
  br label %1147

; <label>:1147                                    ; preds = %1143, %1131
  %1148 = phi i1 [ true, %1131 ], [ %1146, %1143 ]
  br label %1149

; <label>:1149                                    ; preds = %1147, %1126
  %1150 = phi i1 [ false, %1126 ], [ %1148, %1147 ]
  %1151 = zext i1 %1150 to i32
  br label %1157

; <label>:1152                                    ; preds = %1121
  %1153 = load i8** %locinput, align 8
  %1154 = call i64 @Perl_utf8_to_uvchr(i8* %1153, i64* null)
  %1155 = call signext i8 @Perl_is_uni_alnum_lc(i64 %1154)
  %1156 = sext i8 %1155 to i32
  br label %1157

; <label>:1157                                    ; preds = %1152, %1149
  %1158 = phi i32 [ %1151, %1149 ], [ %1156, %1152 ]
  store i32 %1158, i32* %n, align 4
  br label %1159

; <label>:1159                                    ; preds = %1157, %1085
  br label %1274

; <label>:1160                                    ; preds = %1041
  %1161 = load i8** %locinput, align 8
  %1162 = load i8** @PL_bostr, align 8
  %1163 = icmp ne i8* %1161, %1162
  br i1 %1163, label %1164, label %1169

; <label>:1164                                    ; preds = %1160
  %1165 = load i8** %locinput, align 8
  %1166 = getelementptr inbounds i8* %1165, i64 -1
  %1167 = load i8* %1166, align 1
  %1168 = zext i8 %1167 to i32
  br label %1170

; <label>:1169                                    ; preds = %1160
  br label %1170

; <label>:1170                                    ; preds = %1169, %1164
  %1171 = phi i32 [ %1168, %1164 ], [ 10, %1169 ]
  store i32 %1171, i32* %ln, align 4
  %1172 = load %struct.regnode** %scan, align 8
  %1173 = getelementptr inbounds %struct.regnode* %1172, i32 0, i32 1
  %1174 = load i8* %1173, align 1
  %1175 = zext i8 %1174 to i32
  %1176 = icmp eq i32 %1175, 9
  br i1 %1176, label %1183, label %1177

; <label>:1177                                    ; preds = %1170
  %1178 = load %struct.regnode** %scan, align 8
  %1179 = getelementptr inbounds %struct.regnode* %1178, i32 0, i32 1
  %1180 = load i8* %1179, align 1
  %1181 = zext i8 %1180 to i32
  %1182 = icmp eq i32 %1181, 11
  br i1 %1182, label %1183, label %1230

; <label>:1183                                    ; preds = %1177, %1170
  %1184 = load i32* %ln, align 4
  %1185 = icmp sge i32 %1184, 65
  br i1 %1185, label %1186, label %1189

; <label>:1186                                    ; preds = %1183
  %1187 = load i32* %ln, align 4
  %1188 = icmp sle i32 %1187, 90
  br i1 %1188, label %1204, label %1189

; <label>:1189                                    ; preds = %1186, %1183
  %1190 = load i32* %ln, align 4
  %1191 = icmp sge i32 %1190, 97
  br i1 %1191, label %1192, label %1195

; <label>:1192                                    ; preds = %1189
  %1193 = load i32* %ln, align 4
  %1194 = icmp sle i32 %1193, 122
  br i1 %1194, label %1204, label %1195

; <label>:1195                                    ; preds = %1192, %1189
  %1196 = load i32* %ln, align 4
  %1197 = icmp sge i32 %1196, 48
  br i1 %1197, label %1198, label %1201

; <label>:1198                                    ; preds = %1195
  %1199 = load i32* %ln, align 4
  %1200 = icmp sle i32 %1199, 57
  br i1 %1200, label %1204, label %1201

; <label>:1201                                    ; preds = %1198, %1195
  %1202 = load i32* %ln, align 4
  %1203 = icmp eq i32 %1202, 95
  br label %1204

; <label>:1204                                    ; preds = %1201, %1198, %1192, %1186
  %1205 = phi i1 [ true, %1198 ], [ true, %1192 ], [ true, %1186 ], [ %1203, %1201 ]
  %1206 = zext i1 %1205 to i32
  store i32 %1206, i32* %ln, align 4
  %1207 = load i32* %nextchr, align 4
  %1208 = icmp sge i32 %1207, 65
  br i1 %1208, label %1209, label %1212

; <label>:1209                                    ; preds = %1204
  %1210 = load i32* %nextchr, align 4
  %1211 = icmp sle i32 %1210, 90
  br i1 %1211, label %1227, label %1212

; <label>:1212                                    ; preds = %1209, %1204
  %1213 = load i32* %nextchr, align 4
  %1214 = icmp sge i32 %1213, 97
  br i1 %1214, label %1215, label %1218

; <label>:1215                                    ; preds = %1212
  %1216 = load i32* %nextchr, align 4
  %1217 = icmp sle i32 %1216, 122
  br i1 %1217, label %1227, label %1218

; <label>:1218                                    ; preds = %1215, %1212
  %1219 = load i32* %nextchr, align 4
  %1220 = icmp sge i32 %1219, 48
  br i1 %1220, label %1221, label %1224

; <label>:1221                                    ; preds = %1218
  %1222 = load i32* %nextchr, align 4
  %1223 = icmp sle i32 %1222, 57
  br i1 %1223, label %1227, label %1224

; <label>:1224                                    ; preds = %1221, %1218
  %1225 = load i32* %nextchr, align 4
  %1226 = icmp eq i32 %1225, 95
  br label %1227

; <label>:1227                                    ; preds = %1224, %1221, %1215, %1209
  %1228 = phi i1 [ true, %1221 ], [ true, %1215 ], [ true, %1209 ], [ %1226, %1224 ]
  %1229 = zext i1 %1228 to i32
  store i32 %1229, i32* %n, align 4
  br label %1273

; <label>:1230                                    ; preds = %1177
  %1231 = load i32* %ln, align 4
  %1232 = and i32 %1231, -128
  %1233 = icmp eq i32 %1232, 0
  br i1 %1233, label %1234, label %1249

; <label>:1234                                    ; preds = %1230
  %1235 = load i32* %ln, align 4
  %1236 = sext i32 %1235 to i64
  %1237 = call i16** @__ctype_b_loc()
  %1238 = load i16** %1237, align 8
  %1239 = getelementptr inbounds i16* %1238, i64 %1236
  %1240 = load i16* %1239, align 2
  %1241 = zext i16 %1240 to i32
  %1242 = and i32 %1241, 8
  %1243 = icmp ne i32 %1242, 0
  br i1 %1243, label %1247, label %1244

; <label>:1244                                    ; preds = %1234
  %1245 = load i32* %ln, align 4
  %1246 = icmp eq i32 %1245, 95
  br label %1247

; <label>:1247                                    ; preds = %1244, %1234
  %1248 = phi i1 [ true, %1234 ], [ %1246, %1244 ]
  br label %1249

; <label>:1249                                    ; preds = %1247, %1230
  %1250 = phi i1 [ false, %1230 ], [ %1248, %1247 ]
  %1251 = zext i1 %1250 to i32
  store i32 %1251, i32* %ln, align 4
  %1252 = load i32* %nextchr, align 4
  %1253 = and i32 %1252, -128
  %1254 = icmp eq i32 %1253, 0
  br i1 %1254, label %1255, label %1270

; <label>:1255                                    ; preds = %1249
  %1256 = load i32* %nextchr, align 4
  %1257 = sext i32 %1256 to i64
  %1258 = call i16** @__ctype_b_loc()
  %1259 = load i16** %1258, align 8
  %1260 = getelementptr inbounds i16* %1259, i64 %1257
  %1261 = load i16* %1260, align 2
  %1262 = zext i16 %1261 to i32
  %1263 = and i32 %1262, 8
  %1264 = icmp ne i32 %1263, 0
  br i1 %1264, label %1268, label %1265

; <label>:1265                                    ; preds = %1255
  %1266 = load i32* %nextchr, align 4
  %1267 = icmp eq i32 %1266, 95
  br label %1268

; <label>:1268                                    ; preds = %1265, %1255
  %1269 = phi i1 [ true, %1255 ], [ %1267, %1265 ]
  br label %1270

; <label>:1270                                    ; preds = %1268, %1249
  %1271 = phi i1 [ false, %1249 ], [ %1269, %1268 ]
  %1272 = zext i1 %1271 to i32
  store i32 %1272, i32* %n, align 4
  br label %1273

; <label>:1273                                    ; preds = %1270, %1227
  br label %1274

; <label>:1274                                    ; preds = %1273, %1159
  %1275 = load i32* %ln, align 4
  %1276 = icmp ne i32 %1275, 0
  %1277 = xor i1 %1276, true
  %1278 = zext i1 %1277 to i32
  %1279 = load i32* %n, align 4
  %1280 = icmp ne i32 %1279, 0
  %1281 = xor i1 %1280, true
  %1282 = zext i1 %1281 to i32
  %1283 = icmp eq i32 %1278, %1282
  %1284 = zext i1 %1283 to i32
  %1285 = load %struct.regnode** %scan, align 8
  %1286 = getelementptr inbounds %struct.regnode* %1285, i32 0, i32 1
  %1287 = load i8* %1286, align 1
  %1288 = zext i8 %1287 to i32
  %1289 = icmp eq i32 %1288, 9
  br i1 %1289, label %1296, label %1290

; <label>:1290                                    ; preds = %1274
  %1291 = load %struct.regnode** %scan, align 8
  %1292 = getelementptr inbounds %struct.regnode* %1291, i32 0, i32 1
  %1293 = load i8* %1292, align 1
  %1294 = zext i8 %1293 to i32
  %1295 = icmp eq i32 %1294, 10
  br label %1296

; <label>:1296                                    ; preds = %1290, %1274
  %1297 = phi i1 [ true, %1274 ], [ %1295, %1290 ]
  %1298 = zext i1 %1297 to i32
  %1299 = icmp eq i32 %1284, %1298
  br i1 %1299, label %1300, label %1301

; <label>:1300                                    ; preds = %1296
  br label %6127

; <label>:1301                                    ; preds = %1296
  br label %6120

; <label>:1302                                    ; preds = %24
  %1303 = load i32* @PL_reg_flags, align 4
  %1304 = or i32 %1303, 1
  store i32 %1304, i32* @PL_reg_flags, align 4
  br label %1305

; <label>:1305                                    ; preds = %24, %1302
  %1306 = load i32* %nextchr, align 4
  %1307 = icmp ne i32 %1306, 0
  br i1 %1307, label %1309, label %1308

; <label>:1308                                    ; preds = %1305
  br label %6127

; <label>:1309                                    ; preds = %1305
  %1310 = load i8* %do_utf8, align 1
  %1311 = icmp ne i8 %1310, 0
  br i1 %1311, label %1312, label %1422

; <label>:1312                                    ; preds = %1309
  %1313 = load i32* %nextchr, align 4
  %1314 = trunc i32 %1313 to i8
  %1315 = zext i8 %1314 to i32
  %1316 = and i32 %1315, 128
  %1317 = icmp ne i32 %1316, 0
  br i1 %1317, label %1318, label %1381

; <label>:1318                                    ; preds = %1312
  %1319 = load %struct.sv** @PL_utf8_space, align 8
  %1320 = icmp ne %struct.sv* %1319, null
  br i1 %1320, label %1323, label %1321

; <label>:1321                                    ; preds = %1318
  call void @Perl_push_scope()
  call void @Perl_save_re_context()
  %1322 = call signext i8 @Perl_is_utf8_space(i8* getelementptr inbounds ([2 x i8]* @.str3, i32 0, i32 0))
  call void @Perl_pop_scope()
  br label %1323

; <label>:1323                                    ; preds = %1321, %1318
  %1324 = load %struct.regnode** %scan, align 8
  %1325 = getelementptr inbounds %struct.regnode* %1324, i32 0, i32 1
  %1326 = load i8* %1325, align 1
  %1327 = zext i8 %1326 to i32
  %1328 = icmp eq i32 %1327, 22
  br i1 %1328, label %1329, label %1335

; <label>:1329                                    ; preds = %1323
  %1330 = load %struct.sv** @PL_utf8_space, align 8
  %1331 = load i8** %locinput, align 8
  %1332 = load i8* %do_utf8, align 1
  %1333 = call i64 @Perl_swash_fetch(%struct.sv* %1330, i8* %1331, i8 signext %1332)
  %1334 = icmp ne i64 %1333, 0
  br i1 %1334, label %1369, label %1368

; <label>:1335                                    ; preds = %1323
  %1336 = load i8** %locinput, align 8
  %1337 = call i64 @Perl_utf8_to_uvchr(i8* %1336, i64* null)
  %1338 = icmp ult i64 %1337, 256
  br i1 %1338, label %1339, label %1359

; <label>:1339                                    ; preds = %1335
  %1340 = load i8** %locinput, align 8
  %1341 = call i64 @Perl_utf8_to_uvchr(i8* %1340, i64* null)
  %1342 = and i64 %1341, -128
  %1343 = icmp eq i64 %1342, 0
  br i1 %1343, label %1344, label %1356

; <label>:1344                                    ; preds = %1339
  %1345 = load i8** %locinput, align 8
  %1346 = call i64 @Perl_utf8_to_uvchr(i8* %1345, i64* null)
  %1347 = trunc i64 %1346 to i32
  %1348 = sext i32 %1347 to i64
  %1349 = call i16** @__ctype_b_loc()
  %1350 = load i16** %1349, align 8
  %1351 = getelementptr inbounds i16* %1350, i64 %1348
  %1352 = load i16* %1351, align 2
  %1353 = zext i16 %1352 to i32
  %1354 = and i32 %1353, 8192
  %1355 = icmp ne i32 %1354, 0
  br label %1356

; <label>:1356                                    ; preds = %1344, %1339
  %1357 = phi i1 [ false, %1339 ], [ %1355, %1344 ]
  %1358 = zext i1 %1357 to i32
  br label %1364

; <label>:1359                                    ; preds = %1335
  %1360 = load i8** %locinput, align 8
  %1361 = call i64 @Perl_utf8_to_uvchr(i8* %1360, i64* null)
  %1362 = call signext i8 @Perl_is_uni_space_lc(i64 %1361)
  %1363 = sext i8 %1362 to i32
  br label %1364

; <label>:1364                                    ; preds = %1359, %1356
  %1365 = phi i32 [ %1358, %1356 ], [ %1363, %1359 ]
  %1366 = sext i32 %1365 to i64
  %1367 = icmp ne i64 %1366, 0
  br i1 %1367, label %1369, label %1368

; <label>:1368                                    ; preds = %1364, %1329
  br label %6127

; <label>:1369                                    ; preds = %1364, %1329
  %1370 = load i32* %nextchr, align 4
  %1371 = sext i32 %1370 to i64
  %1372 = getelementptr inbounds [0 x i8]* @PL_utf8skip, i32 0, i64 %1371
  %1373 = load i8* %1372, align 1
  %1374 = zext i8 %1373 to i32
  %1375 = load i8** %locinput, align 8
  %1376 = sext i32 %1374 to i64
  %1377 = getelementptr inbounds i8* %1375, i64 %1376
  store i8* %1377, i8** %locinput, align 8
  %1378 = load i8** %locinput, align 8
  %1379 = load i8* %1378, align 1
  %1380 = zext i8 %1379 to i32
  store i32 %1380, i32* %nextchr, align 4
  br label %6120

; <label>:1381                                    ; preds = %1312
  %1382 = load %struct.regnode** %scan, align 8
  %1383 = getelementptr inbounds %struct.regnode* %1382, i32 0, i32 1
  %1384 = load i8* %1383, align 1
  %1385 = zext i8 %1384 to i32
  %1386 = icmp eq i32 %1385, 22
  br i1 %1386, label %1387, label %1402

; <label>:1387                                    ; preds = %1381
  %1388 = load i32* %nextchr, align 4
  %1389 = icmp eq i32 %1388, 32
  br i1 %1389, label %1417, label %1390

; <label>:1390                                    ; preds = %1387
  %1391 = load i32* %nextchr, align 4
  %1392 = icmp eq i32 %1391, 9
  br i1 %1392, label %1417, label %1393

; <label>:1393                                    ; preds = %1390
  %1394 = load i32* %nextchr, align 4
  %1395 = icmp eq i32 %1394, 10
  br i1 %1395, label %1417, label %1396

; <label>:1396                                    ; preds = %1393
  %1397 = load i32* %nextchr, align 4
  %1398 = icmp eq i32 %1397, 13
  br i1 %1398, label %1417, label %1399

; <label>:1399                                    ; preds = %1396
  %1400 = load i32* %nextchr, align 4
  %1401 = icmp eq i32 %1400, 12
  br i1 %1401, label %1417, label %1416

; <label>:1402                                    ; preds = %1381
  %1403 = load i32* %nextchr, align 4
  %1404 = and i32 %1403, -128
  %1405 = icmp eq i32 %1404, 0
  br i1 %1405, label %1406, label %1416

; <label>:1406                                    ; preds = %1402
  %1407 = load i32* %nextchr, align 4
  %1408 = sext i32 %1407 to i64
  %1409 = call i16** @__ctype_b_loc()
  %1410 = load i16** %1409, align 8
  %1411 = getelementptr inbounds i16* %1410, i64 %1408
  %1412 = load i16* %1411, align 2
  %1413 = zext i16 %1412 to i32
  %1414 = and i32 %1413, 8192
  %1415 = icmp ne i32 %1414, 0
  br i1 %1415, label %1417, label %1416

; <label>:1416                                    ; preds = %1406, %1402, %1399
  br label %6127

; <label>:1417                                    ; preds = %1406, %1399, %1396, %1393, %1390, %1387
  %1418 = load i8** %locinput, align 8
  %1419 = getelementptr inbounds i8* %1418, i32 1
  store i8* %1419, i8** %locinput, align 8
  %1420 = load i8* %1419, align 1
  %1421 = zext i8 %1420 to i32
  store i32 %1421, i32* %nextchr, align 4
  br label %1463

; <label>:1422                                    ; preds = %1309
  %1423 = load %struct.regnode** %scan, align 8
  %1424 = getelementptr inbounds %struct.regnode* %1423, i32 0, i32 1
  %1425 = load i8* %1424, align 1
  %1426 = zext i8 %1425 to i32
  %1427 = icmp eq i32 %1426, 22
  br i1 %1427, label %1428, label %1443

; <label>:1428                                    ; preds = %1422
  %1429 = load i32* %nextchr, align 4
  %1430 = icmp eq i32 %1429, 32
  br i1 %1430, label %1458, label %1431

; <label>:1431                                    ; preds = %1428
  %1432 = load i32* %nextchr, align 4
  %1433 = icmp eq i32 %1432, 9
  br i1 %1433, label %1458, label %1434

; <label>:1434                                    ; preds = %1431
  %1435 = load i32* %nextchr, align 4
  %1436 = icmp eq i32 %1435, 10
  br i1 %1436, label %1458, label %1437

; <label>:1437                                    ; preds = %1434
  %1438 = load i32* %nextchr, align 4
  %1439 = icmp eq i32 %1438, 13
  br i1 %1439, label %1458, label %1440

; <label>:1440                                    ; preds = %1437
  %1441 = load i32* %nextchr, align 4
  %1442 = icmp eq i32 %1441, 12
  br i1 %1442, label %1458, label %1457

; <label>:1443                                    ; preds = %1422
  %1444 = load i32* %nextchr, align 4
  %1445 = and i32 %1444, -128
  %1446 = icmp eq i32 %1445, 0
  br i1 %1446, label %1447, label %1457

; <label>:1447                                    ; preds = %1443
  %1448 = load i32* %nextchr, align 4
  %1449 = sext i32 %1448 to i64
  %1450 = call i16** @__ctype_b_loc()
  %1451 = load i16** %1450, align 8
  %1452 = getelementptr inbounds i16* %1451, i64 %1449
  %1453 = load i16* %1452, align 2
  %1454 = zext i16 %1453 to i32
  %1455 = and i32 %1454, 8192
  %1456 = icmp ne i32 %1455, 0
  br i1 %1456, label %1458, label %1457

; <label>:1457                                    ; preds = %1447, %1443, %1440
  br label %6127

; <label>:1458                                    ; preds = %1447, %1440, %1437, %1434, %1431, %1428
  %1459 = load i8** %locinput, align 8
  %1460 = getelementptr inbounds i8* %1459, i32 1
  store i8* %1460, i8** %locinput, align 8
  %1461 = load i8* %1460, align 1
  %1462 = zext i8 %1461 to i32
  store i32 %1462, i32* %nextchr, align 4
  br label %1463

; <label>:1463                                    ; preds = %1458, %1417
  br label %6120

; <label>:1464                                    ; preds = %24
  %1465 = load i32* @PL_reg_flags, align 4
  %1466 = or i32 %1465, 1
  store i32 %1466, i32* @PL_reg_flags, align 4
  br label %1467

; <label>:1467                                    ; preds = %24, %1464
  %1468 = load i32* %nextchr, align 4
  %1469 = icmp ne i32 %1468, 0
  br i1 %1469, label %1475, label %1470

; <label>:1470                                    ; preds = %1467
  %1471 = load i8** %locinput, align 8
  %1472 = load i8** @PL_regeol, align 8
  %1473 = icmp uge i8* %1471, %1472
  br i1 %1473, label %1474, label %1475

; <label>:1474                                    ; preds = %1470
  br label %6127

; <label>:1475                                    ; preds = %1470, %1467
  %1476 = load i8* %do_utf8, align 1
  %1477 = icmp ne i8 %1476, 0
  br i1 %1477, label %1478, label %1541

; <label>:1478                                    ; preds = %1475
  %1479 = load %struct.sv** @PL_utf8_space, align 8
  %1480 = icmp ne %struct.sv* %1479, null
  br i1 %1480, label %1483, label %1481

; <label>:1481                                    ; preds = %1478
  call void @Perl_push_scope()
  call void @Perl_save_re_context()
  %1482 = call signext i8 @Perl_is_utf8_space(i8* getelementptr inbounds ([2 x i8]* @.str3, i32 0, i32 0))
  call void @Perl_pop_scope()
  br label %1483

; <label>:1483                                    ; preds = %1481, %1478
  %1484 = load %struct.regnode** %scan, align 8
  %1485 = getelementptr inbounds %struct.regnode* %1484, i32 0, i32 1
  %1486 = load i8* %1485, align 1
  %1487 = zext i8 %1486 to i32
  %1488 = icmp eq i32 %1487, 24
  br i1 %1488, label %1489, label %1495

; <label>:1489                                    ; preds = %1483
  %1490 = load %struct.sv** @PL_utf8_space, align 8
  %1491 = load i8** %locinput, align 8
  %1492 = load i8* %do_utf8, align 1
  %1493 = call i64 @Perl_swash_fetch(%struct.sv* %1490, i8* %1491, i8 signext %1492)
  %1494 = icmp ne i64 %1493, 0
  br i1 %1494, label %1528, label %1529

; <label>:1495                                    ; preds = %1483
  %1496 = load i8** %locinput, align 8
  %1497 = call i64 @Perl_utf8_to_uvchr(i8* %1496, i64* null)
  %1498 = icmp ult i64 %1497, 256
  br i1 %1498, label %1499, label %1519

; <label>:1499                                    ; preds = %1495
  %1500 = load i8** %locinput, align 8
  %1501 = call i64 @Perl_utf8_to_uvchr(i8* %1500, i64* null)
  %1502 = and i64 %1501, -128
  %1503 = icmp eq i64 %1502, 0
  br i1 %1503, label %1504, label %1516

; <label>:1504                                    ; preds = %1499
  %1505 = load i8** %locinput, align 8
  %1506 = call i64 @Perl_utf8_to_uvchr(i8* %1505, i64* null)
  %1507 = trunc i64 %1506 to i32
  %1508 = sext i32 %1507 to i64
  %1509 = call i16** @__ctype_b_loc()
  %1510 = load i16** %1509, align 8
  %1511 = getelementptr inbounds i16* %1510, i64 %1508
  %1512 = load i16* %1511, align 2
  %1513 = zext i16 %1512 to i32
  %1514 = and i32 %1513, 8192
  %1515 = icmp ne i32 %1514, 0
  br label %1516

; <label>:1516                                    ; preds = %1504, %1499
  %1517 = phi i1 [ false, %1499 ], [ %1515, %1504 ]
  %1518 = zext i1 %1517 to i32
  br label %1524

; <label>:1519                                    ; preds = %1495
  %1520 = load i8** %locinput, align 8
  %1521 = call i64 @Perl_utf8_to_uvchr(i8* %1520, i64* null)
  %1522 = call signext i8 @Perl_is_uni_space_lc(i64 %1521)
  %1523 = sext i8 %1522 to i32
  br label %1524

; <label>:1524                                    ; preds = %1519, %1516
  %1525 = phi i32 [ %1518, %1516 ], [ %1523, %1519 ]
  %1526 = sext i32 %1525 to i64
  %1527 = icmp ne i64 %1526, 0
  br i1 %1527, label %1528, label %1529

; <label>:1528                                    ; preds = %1524, %1489
  br label %6127

; <label>:1529                                    ; preds = %1524, %1489
  %1530 = load i32* %nextchr, align 4
  %1531 = sext i32 %1530 to i64
  %1532 = getelementptr inbounds [0 x i8]* @PL_utf8skip, i32 0, i64 %1531
  %1533 = load i8* %1532, align 1
  %1534 = zext i8 %1533 to i32
  %1535 = load i8** %locinput, align 8
  %1536 = sext i32 %1534 to i64
  %1537 = getelementptr inbounds i8* %1535, i64 %1536
  store i8* %1537, i8** %locinput, align 8
  %1538 = load i8** %locinput, align 8
  %1539 = load i8* %1538, align 1
  %1540 = zext i8 %1539 to i32
  store i32 %1540, i32* %nextchr, align 4
  br label %6120

; <label>:1541                                    ; preds = %1475
  %1542 = load %struct.regnode** %scan, align 8
  %1543 = getelementptr inbounds %struct.regnode* %1542, i32 0, i32 1
  %1544 = load i8* %1543, align 1
  %1545 = zext i8 %1544 to i32
  %1546 = icmp eq i32 %1545, 24
  br i1 %1546, label %1547, label %1562

; <label>:1547                                    ; preds = %1541
  %1548 = load i32* %nextchr, align 4
  %1549 = icmp eq i32 %1548, 32
  br i1 %1549, label %1576, label %1550

; <label>:1550                                    ; preds = %1547
  %1551 = load i32* %nextchr, align 4
  %1552 = icmp eq i32 %1551, 9
  br i1 %1552, label %1576, label %1553

; <label>:1553                                    ; preds = %1550
  %1554 = load i32* %nextchr, align 4
  %1555 = icmp eq i32 %1554, 10
  br i1 %1555, label %1576, label %1556

; <label>:1556                                    ; preds = %1553
  %1557 = load i32* %nextchr, align 4
  %1558 = icmp eq i32 %1557, 13
  br i1 %1558, label %1576, label %1559

; <label>:1559                                    ; preds = %1556
  %1560 = load i32* %nextchr, align 4
  %1561 = icmp eq i32 %1560, 12
  br i1 %1561, label %1576, label %1577

; <label>:1562                                    ; preds = %1541
  %1563 = load i32* %nextchr, align 4
  %1564 = and i32 %1563, -128
  %1565 = icmp eq i32 %1564, 0
  br i1 %1565, label %1566, label %1577

; <label>:1566                                    ; preds = %1562
  %1567 = load i32* %nextchr, align 4
  %1568 = sext i32 %1567 to i64
  %1569 = call i16** @__ctype_b_loc()
  %1570 = load i16** %1569, align 8
  %1571 = getelementptr inbounds i16* %1570, i64 %1568
  %1572 = load i16* %1571, align 2
  %1573 = zext i16 %1572 to i32
  %1574 = and i32 %1573, 8192
  %1575 = icmp ne i32 %1574, 0
  br i1 %1575, label %1576, label %1577

; <label>:1576                                    ; preds = %1566, %1559, %1556, %1553, %1550, %1547
  br label %6127

; <label>:1577                                    ; preds = %1566, %1562, %1559
  %1578 = load i8** %locinput, align 8
  %1579 = getelementptr inbounds i8* %1578, i32 1
  store i8* %1579, i8** %locinput, align 8
  %1580 = load i8* %1579, align 1
  %1581 = zext i8 %1580 to i32
  store i32 %1581, i32* %nextchr, align 4
  br label %6120

; <label>:1582                                    ; preds = %24
  %1583 = load i32* @PL_reg_flags, align 4
  %1584 = or i32 %1583, 1
  store i32 %1584, i32* @PL_reg_flags, align 4
  br label %1585

; <label>:1585                                    ; preds = %24, %1582
  %1586 = load i32* %nextchr, align 4
  %1587 = icmp ne i32 %1586, 0
  br i1 %1587, label %1589, label %1588

; <label>:1588                                    ; preds = %1585
  br label %6127

; <label>:1589                                    ; preds = %1585
  %1590 = load i8* %do_utf8, align 1
  %1591 = icmp ne i8 %1590, 0
  br i1 %1591, label %1592, label %1655

; <label>:1592                                    ; preds = %1589
  %1593 = load %struct.sv** @PL_utf8_digit, align 8
  %1594 = icmp ne %struct.sv* %1593, null
  br i1 %1594, label %1597, label %1595

; <label>:1595                                    ; preds = %1592
  call void @Perl_push_scope()
  call void @Perl_save_re_context()
  %1596 = call signext i8 @Perl_is_utf8_digit(i8* getelementptr inbounds ([2 x i8]* @.str4, i32 0, i32 0))
  call void @Perl_pop_scope()
  br label %1597

; <label>:1597                                    ; preds = %1595, %1592
  %1598 = load %struct.regnode** %scan, align 8
  %1599 = getelementptr inbounds %struct.regnode* %1598, i32 0, i32 1
  %1600 = load i8* %1599, align 1
  %1601 = zext i8 %1600 to i32
  %1602 = icmp eq i32 %1601, 26
  br i1 %1602, label %1603, label %1609

; <label>:1603                                    ; preds = %1597
  %1604 = load %struct.sv** @PL_utf8_digit, align 8
  %1605 = load i8** %locinput, align 8
  %1606 = load i8* %do_utf8, align 1
  %1607 = call i64 @Perl_swash_fetch(%struct.sv* %1604, i8* %1605, i8 signext %1606)
  %1608 = icmp ne i64 %1607, 0
  br i1 %1608, label %1643, label %1642

; <label>:1609                                    ; preds = %1597
  %1610 = load i8** %locinput, align 8
  %1611 = call i64 @Perl_utf8_to_uvchr(i8* %1610, i64* null)
  %1612 = icmp ult i64 %1611, 256
  br i1 %1612, label %1613, label %1633

; <label>:1613                                    ; preds = %1609
  %1614 = load i8** %locinput, align 8
  %1615 = call i64 @Perl_utf8_to_uvchr(i8* %1614, i64* null)
  %1616 = and i64 %1615, -128
  %1617 = icmp eq i64 %1616, 0
  br i1 %1617, label %1618, label %1630

; <label>:1618                                    ; preds = %1613
  %1619 = load i8** %locinput, align 8
  %1620 = call i64 @Perl_utf8_to_uvchr(i8* %1619, i64* null)
  %1621 = trunc i64 %1620 to i32
  %1622 = sext i32 %1621 to i64
  %1623 = call i16** @__ctype_b_loc()
  %1624 = load i16** %1623, align 8
  %1625 = getelementptr inbounds i16* %1624, i64 %1622
  %1626 = load i16* %1625, align 2
  %1627 = zext i16 %1626 to i32
  %1628 = and i32 %1627, 2048
  %1629 = icmp ne i32 %1628, 0
  br label %1630

; <label>:1630                                    ; preds = %1618, %1613
  %1631 = phi i1 [ false, %1613 ], [ %1629, %1618 ]
  %1632 = zext i1 %1631 to i32
  br label %1638

; <label>:1633                                    ; preds = %1609
  %1634 = load i8** %locinput, align 8
  %1635 = call i64 @Perl_utf8_to_uvchr(i8* %1634, i64* null)
  %1636 = call signext i8 @Perl_is_uni_digit_lc(i64 %1635)
  %1637 = sext i8 %1636 to i32
  br label %1638

; <label>:1638                                    ; preds = %1633, %1630
  %1639 = phi i32 [ %1632, %1630 ], [ %1637, %1633 ]
  %1640 = sext i32 %1639 to i64
  %1641 = icmp ne i64 %1640, 0
  br i1 %1641, label %1643, label %1642

; <label>:1642                                    ; preds = %1638, %1603
  br label %6127

; <label>:1643                                    ; preds = %1638, %1603
  %1644 = load i32* %nextchr, align 4
  %1645 = sext i32 %1644 to i64
  %1646 = getelementptr inbounds [0 x i8]* @PL_utf8skip, i32 0, i64 %1645
  %1647 = load i8* %1646, align 1
  %1648 = zext i8 %1647 to i32
  %1649 = load i8** %locinput, align 8
  %1650 = sext i32 %1648 to i64
  %1651 = getelementptr inbounds i8* %1649, i64 %1650
  store i8* %1651, i8** %locinput, align 8
  %1652 = load i8** %locinput, align 8
  %1653 = load i8* %1652, align 1
  %1654 = zext i8 %1653 to i32
  store i32 %1654, i32* %nextchr, align 4
  br label %6120

; <label>:1655                                    ; preds = %1589
  %1656 = load %struct.regnode** %scan, align 8
  %1657 = getelementptr inbounds %struct.regnode* %1656, i32 0, i32 1
  %1658 = load i8* %1657, align 1
  %1659 = zext i8 %1658 to i32
  %1660 = icmp eq i32 %1659, 26
  br i1 %1660, label %1661, label %1667

; <label>:1661                                    ; preds = %1655
  %1662 = load i32* %nextchr, align 4
  %1663 = icmp sge i32 %1662, 48
  br i1 %1663, label %1664, label %1681

; <label>:1664                                    ; preds = %1661
  %1665 = load i32* %nextchr, align 4
  %1666 = icmp sle i32 %1665, 57
  br i1 %1666, label %1682, label %1681

; <label>:1667                                    ; preds = %1655
  %1668 = load i32* %nextchr, align 4
  %1669 = and i32 %1668, -128
  %1670 = icmp eq i32 %1669, 0
  br i1 %1670, label %1671, label %1681

; <label>:1671                                    ; preds = %1667
  %1672 = load i32* %nextchr, align 4
  %1673 = sext i32 %1672 to i64
  %1674 = call i16** @__ctype_b_loc()
  %1675 = load i16** %1674, align 8
  %1676 = getelementptr inbounds i16* %1675, i64 %1673
  %1677 = load i16* %1676, align 2
  %1678 = zext i16 %1677 to i32
  %1679 = and i32 %1678, 2048
  %1680 = icmp ne i32 %1679, 0
  br i1 %1680, label %1682, label %1681

; <label>:1681                                    ; preds = %1671, %1667, %1664, %1661
  br label %6127

; <label>:1682                                    ; preds = %1671, %1664
  %1683 = load i8** %locinput, align 8
  %1684 = getelementptr inbounds i8* %1683, i32 1
  store i8* %1684, i8** %locinput, align 8
  %1685 = load i8* %1684, align 1
  %1686 = zext i8 %1685 to i32
  store i32 %1686, i32* %nextchr, align 4
  br label %6120

; <label>:1687                                    ; preds = %24
  %1688 = load i32* @PL_reg_flags, align 4
  %1689 = or i32 %1688, 1
  store i32 %1689, i32* @PL_reg_flags, align 4
  br label %1690

; <label>:1690                                    ; preds = %24, %1687
  %1691 = load i32* %nextchr, align 4
  %1692 = icmp ne i32 %1691, 0
  br i1 %1692, label %1698, label %1693

; <label>:1693                                    ; preds = %1690
  %1694 = load i8** %locinput, align 8
  %1695 = load i8** @PL_regeol, align 8
  %1696 = icmp uge i8* %1694, %1695
  br i1 %1696, label %1697, label %1698

; <label>:1697                                    ; preds = %1693
  br label %6127

; <label>:1698                                    ; preds = %1693, %1690
  %1699 = load i8* %do_utf8, align 1
  %1700 = icmp ne i8 %1699, 0
  br i1 %1700, label %1701, label %1764

; <label>:1701                                    ; preds = %1698
  %1702 = load %struct.sv** @PL_utf8_digit, align 8
  %1703 = icmp ne %struct.sv* %1702, null
  br i1 %1703, label %1706, label %1704

; <label>:1704                                    ; preds = %1701
  call void @Perl_push_scope()
  call void @Perl_save_re_context()
  %1705 = call signext i8 @Perl_is_utf8_digit(i8* getelementptr inbounds ([2 x i8]* @.str4, i32 0, i32 0))
  call void @Perl_pop_scope()
  br label %1706

; <label>:1706                                    ; preds = %1704, %1701
  %1707 = load %struct.regnode** %scan, align 8
  %1708 = getelementptr inbounds %struct.regnode* %1707, i32 0, i32 1
  %1709 = load i8* %1708, align 1
  %1710 = zext i8 %1709 to i32
  %1711 = icmp eq i32 %1710, 28
  br i1 %1711, label %1712, label %1718

; <label>:1712                                    ; preds = %1706
  %1713 = load %struct.sv** @PL_utf8_digit, align 8
  %1714 = load i8** %locinput, align 8
  %1715 = load i8* %do_utf8, align 1
  %1716 = call i64 @Perl_swash_fetch(%struct.sv* %1713, i8* %1714, i8 signext %1715)
  %1717 = icmp ne i64 %1716, 0
  br i1 %1717, label %1751, label %1752

; <label>:1718                                    ; preds = %1706
  %1719 = load i8** %locinput, align 8
  %1720 = call i64 @Perl_utf8_to_uvchr(i8* %1719, i64* null)
  %1721 = icmp ult i64 %1720, 256
  br i1 %1721, label %1722, label %1742

; <label>:1722                                    ; preds = %1718
  %1723 = load i8** %locinput, align 8
  %1724 = call i64 @Perl_utf8_to_uvchr(i8* %1723, i64* null)
  %1725 = and i64 %1724, -128
  %1726 = icmp eq i64 %1725, 0
  br i1 %1726, label %1727, label %1739

; <label>:1727                                    ; preds = %1722
  %1728 = load i8** %locinput, align 8
  %1729 = call i64 @Perl_utf8_to_uvchr(i8* %1728, i64* null)
  %1730 = trunc i64 %1729 to i32
  %1731 = sext i32 %1730 to i64
  %1732 = call i16** @__ctype_b_loc()
  %1733 = load i16** %1732, align 8
  %1734 = getelementptr inbounds i16* %1733, i64 %1731
  %1735 = load i16* %1734, align 2
  %1736 = zext i16 %1735 to i32
  %1737 = and i32 %1736, 2048
  %1738 = icmp ne i32 %1737, 0
  br label %1739

; <label>:1739                                    ; preds = %1727, %1722
  %1740 = phi i1 [ false, %1722 ], [ %1738, %1727 ]
  %1741 = zext i1 %1740 to i32
  br label %1747

; <label>:1742                                    ; preds = %1718
  %1743 = load i8** %locinput, align 8
  %1744 = call i64 @Perl_utf8_to_uvchr(i8* %1743, i64* null)
  %1745 = call signext i8 @Perl_is_uni_digit_lc(i64 %1744)
  %1746 = sext i8 %1745 to i32
  br label %1747

; <label>:1747                                    ; preds = %1742, %1739
  %1748 = phi i32 [ %1741, %1739 ], [ %1746, %1742 ]
  %1749 = sext i32 %1748 to i64
  %1750 = icmp ne i64 %1749, 0
  br i1 %1750, label %1751, label %1752

; <label>:1751                                    ; preds = %1747, %1712
  br label %6127

; <label>:1752                                    ; preds = %1747, %1712
  %1753 = load i32* %nextchr, align 4
  %1754 = sext i32 %1753 to i64
  %1755 = getelementptr inbounds [0 x i8]* @PL_utf8skip, i32 0, i64 %1754
  %1756 = load i8* %1755, align 1
  %1757 = zext i8 %1756 to i32
  %1758 = load i8** %locinput, align 8
  %1759 = sext i32 %1757 to i64
  %1760 = getelementptr inbounds i8* %1758, i64 %1759
  store i8* %1760, i8** %locinput, align 8
  %1761 = load i8** %locinput, align 8
  %1762 = load i8* %1761, align 1
  %1763 = zext i8 %1762 to i32
  store i32 %1763, i32* %nextchr, align 4
  br label %6120

; <label>:1764                                    ; preds = %1698
  %1765 = load %struct.regnode** %scan, align 8
  %1766 = getelementptr inbounds %struct.regnode* %1765, i32 0, i32 1
  %1767 = load i8* %1766, align 1
  %1768 = zext i8 %1767 to i32
  %1769 = icmp eq i32 %1768, 28
  br i1 %1769, label %1770, label %1776

; <label>:1770                                    ; preds = %1764
  %1771 = load i32* %nextchr, align 4
  %1772 = icmp sge i32 %1771, 48
  br i1 %1772, label %1773, label %1791

; <label>:1773                                    ; preds = %1770
  %1774 = load i32* %nextchr, align 4
  %1775 = icmp sle i32 %1774, 57
  br i1 %1775, label %1790, label %1791

; <label>:1776                                    ; preds = %1764
  %1777 = load i32* %nextchr, align 4
  %1778 = and i32 %1777, -128
  %1779 = icmp eq i32 %1778, 0
  br i1 %1779, label %1780, label %1791

; <label>:1780                                    ; preds = %1776
  %1781 = load i32* %nextchr, align 4
  %1782 = sext i32 %1781 to i64
  %1783 = call i16** @__ctype_b_loc()
  %1784 = load i16** %1783, align 8
  %1785 = getelementptr inbounds i16* %1784, i64 %1782
  %1786 = load i16* %1785, align 2
  %1787 = zext i16 %1786 to i32
  %1788 = and i32 %1787, 2048
  %1789 = icmp ne i32 %1788, 0
  br i1 %1789, label %1790, label %1791

; <label>:1790                                    ; preds = %1780, %1773
  br label %6127

; <label>:1791                                    ; preds = %1780, %1776, %1773, %1770
  %1792 = load i8** %locinput, align 8
  %1793 = getelementptr inbounds i8* %1792, i32 1
  store i8* %1793, i8** %locinput, align 8
  %1794 = load i8* %1793, align 1
  %1795 = zext i8 %1794 to i32
  store i32 %1795, i32* %nextchr, align 4
  br label %6120

; <label>:1796                                    ; preds = %24
  %1797 = load i8** %locinput, align 8
  %1798 = load i8** @PL_regeol, align 8
  %1799 = icmp uge i8* %1797, %1798
  br i1 %1799, label %1800, label %1801

; <label>:1800                                    ; preds = %1796
  br label %6127

; <label>:1801                                    ; preds = %1796
  %1802 = load i8* %do_utf8, align 1
  %1803 = icmp ne i8 %1802, 0
  br i1 %1803, label %1804, label %1853

; <label>:1804                                    ; preds = %1801
  %1805 = load %struct.sv** @PL_utf8_mark, align 8
  %1806 = icmp ne %struct.sv* %1805, null
  br i1 %1806, label %1809, label %1807

; <label>:1807                                    ; preds = %1804
  call void @Perl_push_scope()
  call void @Perl_save_re_context()
  %1808 = call signext i8 @Perl_is_utf8_mark(i8* getelementptr inbounds ([2 x i8]* @.str5, i32 0, i32 0))
  call void @Perl_pop_scope()
  br label %1809

; <label>:1809                                    ; preds = %1807, %1804
  %1810 = load %struct.sv** @PL_utf8_mark, align 8
  %1811 = load i8** %locinput, align 8
  %1812 = load i8* %do_utf8, align 1
  %1813 = call i64 @Perl_swash_fetch(%struct.sv* %1810, i8* %1811, i8 signext %1812)
  %1814 = icmp ne i64 %1813, 0
  br i1 %1814, label %1815, label %1816

; <label>:1815                                    ; preds = %1809
  br label %6127

; <label>:1816                                    ; preds = %1809
  %1817 = load i32* %nextchr, align 4
  %1818 = sext i32 %1817 to i64
  %1819 = getelementptr inbounds [0 x i8]* @PL_utf8skip, i32 0, i64 %1818
  %1820 = load i8* %1819, align 1
  %1821 = zext i8 %1820 to i32
  %1822 = load i8** %locinput, align 8
  %1823 = sext i32 %1821 to i64
  %1824 = getelementptr inbounds i8* %1822, i64 %1823
  store i8* %1824, i8** %locinput, align 8
  br label %1825

; <label>:1825                                    ; preds = %1837, %1816
  %1826 = load i8** %locinput, align 8
  %1827 = load i8** @PL_regeol, align 8
  %1828 = icmp ult i8* %1826, %1827
  br i1 %1828, label %1829, label %1835

; <label>:1829                                    ; preds = %1825
  %1830 = load %struct.sv** @PL_utf8_mark, align 8
  %1831 = load i8** %locinput, align 8
  %1832 = load i8* %do_utf8, align 1
  %1833 = call i64 @Perl_swash_fetch(%struct.sv* %1830, i8* %1831, i8 signext %1832)
  %1834 = icmp ne i64 %1833, 0
  br label %1835

; <label>:1835                                    ; preds = %1829, %1825
  %1836 = phi i1 [ false, %1825 ], [ %1834, %1829 ]
  br i1 %1836, label %1837, label %1847

; <label>:1837                                    ; preds = %1835
  %1838 = load i8** %locinput, align 8
  %1839 = load i8* %1838, align 1
  %1840 = zext i8 %1839 to i64
  %1841 = getelementptr inbounds [0 x i8]* @PL_utf8skip, i32 0, i64 %1840
  %1842 = load i8* %1841, align 1
  %1843 = zext i8 %1842 to i32
  %1844 = load i8** %locinput, align 8
  %1845 = sext i32 %1843 to i64
  %1846 = getelementptr inbounds i8* %1844, i64 %1845
  store i8* %1846, i8** %locinput, align 8
  br label %1825

; <label>:1847                                    ; preds = %1835
  %1848 = load i8** %locinput, align 8
  %1849 = load i8** @PL_regeol, align 8
  %1850 = icmp ugt i8* %1848, %1849
  br i1 %1850, label %1851, label %1852

; <label>:1851                                    ; preds = %1847
  br label %6127

; <label>:1852                                    ; preds = %1847
  br label %1856

; <label>:1853                                    ; preds = %1801
  %1854 = load i8** %locinput, align 8
  %1855 = getelementptr inbounds i8* %1854, i32 1
  store i8* %1855, i8** %locinput, align 8
  br label %1856

; <label>:1856                                    ; preds = %1853, %1852
  %1857 = load i8** %locinput, align 8
  %1858 = load i8* %1857, align 1
  %1859 = zext i8 %1858 to i32
  store i32 %1859, i32* %nextchr, align 4
  br label %6120

; <label>:1860                                    ; preds = %24
  %1861 = load i32* @PL_reg_flags, align 4
  %1862 = or i32 %1861, 1
  store i32 %1862, i32* @PL_reg_flags, align 4
  br label %1863

; <label>:1863                                    ; preds = %24, %24, %1860
  %1864 = load %struct.regnode** %scan, align 8
  %1865 = bitcast %struct.regnode* %1864 to %struct.regnode_1*
  %1866 = getelementptr inbounds %struct.regnode_1* %1865, i32 0, i32 3
  %1867 = load i32* %1866, align 4
  store i32 %1867, i32* %n, align 4
  %1868 = load i32* %n, align 4
  %1869 = sext i32 %1868 to i64
  %1870 = load i32** @PL_regstartp, align 8
  %1871 = getelementptr inbounds i32* %1870, i64 %1869
  %1872 = load i32* %1871, align 4
  store i32 %1872, i32* %ln, align 4
  %1873 = load i32* @PL_reg_maxiter, align 4
  store i32 %1873, i32* @PL_reg_leftiter, align 4
  %1874 = load i32** @PL_reglastparen, align 8
  %1875 = load i32* %1874, align 4
  %1876 = load i32* %n, align 4
  %1877 = icmp slt i32 %1875, %1876
  br i1 %1877, label %1881, label %1878

; <label>:1878                                    ; preds = %1863
  %1879 = load i32* %ln, align 4
  %1880 = icmp eq i32 %1879, -1
  br i1 %1880, label %1881, label %1882

; <label>:1881                                    ; preds = %1878, %1863
  br label %6127

; <label>:1882                                    ; preds = %1878
  %1883 = load i32* %ln, align 4
  %1884 = load i32* %n, align 4
  %1885 = sext i32 %1884 to i64
  %1886 = load i32** @PL_regendp, align 8
  %1887 = getelementptr inbounds i32* %1886, i64 %1885
  %1888 = load i32* %1887, align 4
  %1889 = icmp eq i32 %1883, %1888
  br i1 %1889, label %1890, label %1891

; <label>:1890                                    ; preds = %1882
  br label %6120

; <label>:1891                                    ; preds = %1882
  %1892 = load i8** @PL_bostr, align 8
  %1893 = load i32* %ln, align 4
  %1894 = sext i32 %1893 to i64
  %1895 = getelementptr inbounds i8* %1892, i64 %1894
  store i8* %1895, i8** %s, align 8
  %1896 = load i8* %do_utf8, align 1
  %1897 = sext i8 %1896 to i32
  %1898 = icmp ne i32 %1897, 0
  br i1 %1898, label %1899, label %1960

; <label>:1899                                    ; preds = %1891
  %1900 = load %struct.regnode** %scan, align 8
  %1901 = getelementptr inbounds %struct.regnode* %1900, i32 0, i32 1
  %1902 = load i8* %1901, align 1
  %1903 = zext i8 %1902 to i32
  %1904 = icmp ne i32 %1903, 47
  br i1 %1904, label %1905, label %1960

; <label>:1905                                    ; preds = %1899
  %1906 = load i8** %locinput, align 8
  store i8* %1906, i8** %l3, align 8
  %1907 = load i8** @PL_bostr, align 8
  %1908 = load i32* %n, align 4
  %1909 = sext i32 %1908 to i64
  %1910 = load i32** @PL_regendp, align 8
  %1911 = getelementptr inbounds i32* %1910, i64 %1909
  %1912 = load i32* %1911, align 4
  %1913 = sext i32 %1912 to i64
  %1914 = getelementptr inbounds i8* %1907, i64 %1913
  store i8* %1914, i8** %e4, align 8
  %1915 = load %struct.regnode** %scan, align 8
  %1916 = getelementptr inbounds %struct.regnode* %1915, i32 0, i32 1
  %1917 = load i8* %1916, align 1
  %1918 = zext i8 %1917 to i32
  %1919 = icmp eq i32 %1918, 48
  br i1 %1919, label %1920, label %1955

; <label>:1920                                    ; preds = %1905
  br label %1921

; <label>:1921                                    ; preds = %1947, %1920
  %1922 = load i8** %s, align 8
  %1923 = load i8** %e4, align 8
  %1924 = icmp ult i8* %1922, %1923
  br i1 %1924, label %1925, label %1954

; <label>:1925                                    ; preds = %1921
  %1926 = load i8** %l3, align 8
  %1927 = load i8** @PL_regeol, align 8
  %1928 = icmp uge i8* %1926, %1927
  br i1 %1928, label %1929, label %1930

; <label>:1929                                    ; preds = %1925
  br label %6127

; <label>:1930                                    ; preds = %1925
  %1931 = load i8** %s, align 8
  %1932 = getelementptr inbounds [7 x i8]* %tmpbuf1, i32 0, i32 0
  %1933 = call i64 @Perl_to_utf8_lower(i8* %1931, i8* %1932, i64* %ulen1)
  %1934 = load i8** %l3, align 8
  %1935 = getelementptr inbounds [7 x i8]* %tmpbuf2, i32 0, i32 0
  %1936 = call i64 @Perl_to_utf8_lower(i8* %1934, i8* %1935, i64* %ulen2)
  %1937 = load i64* %ulen1, align 8
  %1938 = load i64* %ulen2, align 8
  %1939 = icmp ne i64 %1937, %1938
  br i1 %1939, label %1946, label %1940

; <label>:1940                                    ; preds = %1930
  %1941 = getelementptr inbounds [7 x i8]* %tmpbuf1, i32 0, i32 0
  %1942 = getelementptr inbounds [7 x i8]* %tmpbuf2, i32 0, i32 0
  %1943 = load i64* %ulen1, align 8
  %1944 = call i32 @memcmp(i8* %1941, i8* %1942, i64 %1943)
  %1945 = icmp ne i32 %1944, 0
  br i1 %1945, label %1946, label %1947

; <label>:1946                                    ; preds = %1940, %1930
  br label %6127

; <label>:1947                                    ; preds = %1940
  %1948 = load i64* %ulen1, align 8
  %1949 = load i8** %s, align 8
  %1950 = getelementptr inbounds i8* %1949, i64 %1948
  store i8* %1950, i8** %s, align 8
  %1951 = load i64* %ulen2, align 8
  %1952 = load i8** %l3, align 8
  %1953 = getelementptr inbounds i8* %1952, i64 %1951
  store i8* %1953, i8** %l3, align 8
  br label %1921

; <label>:1954                                    ; preds = %1921
  br label %1955

; <label>:1955                                    ; preds = %1954, %1905
  %1956 = load i8** %l3, align 8
  store i8* %1956, i8** %locinput, align 8
  %1957 = load i8** %locinput, align 8
  %1958 = load i8* %1957, align 1
  %1959 = zext i8 %1958 to i32
  store i32 %1959, i32* %nextchr, align 4
  br label %6120

; <label>:1960                                    ; preds = %1899, %1891
  %1961 = load i8** %s, align 8
  %1962 = load i8* %1961, align 1
  %1963 = zext i8 %1962 to i32
  %1964 = load i32* %nextchr, align 4
  %1965 = icmp ne i32 %1963, %1964
  br i1 %1965, label %1966, label %1989

; <label>:1966                                    ; preds = %1960
  %1967 = load %struct.regnode** %scan, align 8
  %1968 = getelementptr inbounds %struct.regnode* %1967, i32 0, i32 1
  %1969 = load i8* %1968, align 1
  %1970 = zext i8 %1969 to i32
  %1971 = icmp eq i32 %1970, 47
  br i1 %1971, label %1988, label %1972

; <label>:1972                                    ; preds = %1966
  %1973 = load i8** %s, align 8
  %1974 = load i8* %1973, align 1
  %1975 = zext i8 %1974 to i32
  %1976 = load i32* %nextchr, align 4
  %1977 = sext i32 %1976 to i64
  %1978 = load %struct.regnode** %scan, align 8
  %1979 = getelementptr inbounds %struct.regnode* %1978, i32 0, i32 1
  %1980 = load i8* %1979, align 1
  %1981 = zext i8 %1980 to i32
  %1982 = icmp eq i32 %1981, 48
  %1983 = select i1 %1982, i8* getelementptr inbounds ([0 x i8]* @PL_fold, i32 0, i32 0), i8* getelementptr inbounds ([0 x i8]* @PL_fold_locale, i32 0, i32 0)
  %1984 = getelementptr inbounds i8* %1983, i64 %1977
  %1985 = load i8* %1984, align 1
  %1986 = zext i8 %1985 to i32
  %1987 = icmp ne i32 %1975, %1986
  br i1 %1987, label %1988, label %1989

; <label>:1988                                    ; preds = %1972, %1966
  br label %6127

; <label>:1989                                    ; preds = %1972, %1960
  %1990 = load i32* %n, align 4
  %1991 = sext i32 %1990 to i64
  %1992 = load i32** @PL_regendp, align 8
  %1993 = getelementptr inbounds i32* %1992, i64 %1991
  %1994 = load i32* %1993, align 4
  %1995 = load i32* %ln, align 4
  %1996 = sub nsw i32 %1994, %1995
  store i32 %1996, i32* %ln, align 4
  %1997 = load i8** %locinput, align 8
  %1998 = load i32* %ln, align 4
  %1999 = sext i32 %1998 to i64
  %2000 = getelementptr inbounds i8* %1997, i64 %1999
  %2001 = load i8** @PL_regeol, align 8
  %2002 = icmp ugt i8* %2000, %2001
  br i1 %2002, label %2003, label %2004

; <label>:2003                                    ; preds = %1989
  br label %6127

; <label>:2004                                    ; preds = %1989
  %2005 = load i32* %ln, align 4
  %2006 = icmp sgt i32 %2005, 1
  br i1 %2006, label %2007, label %2039

; <label>:2007                                    ; preds = %2004
  %2008 = load %struct.regnode** %scan, align 8
  %2009 = getelementptr inbounds %struct.regnode* %2008, i32 0, i32 1
  %2010 = load i8* %2009, align 1
  %2011 = zext i8 %2010 to i32
  %2012 = icmp eq i32 %2011, 47
  br i1 %2012, label %2013, label %2020

; <label>:2013                                    ; preds = %2007
  %2014 = load i8** %s, align 8
  %2015 = load i8** %locinput, align 8
  %2016 = load i32* %ln, align 4
  %2017 = sext i32 %2016 to i64
  %2018 = call i32 @memcmp(i8* %2014, i8* %2015, i64 %2017)
  %2019 = icmp ne i32 %2018, 0
  br i1 %2019, label %2038, label %2039

; <label>:2020                                    ; preds = %2007
  %2021 = load %struct.regnode** %scan, align 8
  %2022 = getelementptr inbounds %struct.regnode* %2021, i32 0, i32 1
  %2023 = load i8* %2022, align 1
  %2024 = zext i8 %2023 to i32
  %2025 = icmp eq i32 %2024, 48
  br i1 %2025, label %2026, label %2032

; <label>:2026                                    ; preds = %2020
  %2027 = load i8** %s, align 8
  %2028 = load i8** %locinput, align 8
  %2029 = load i32* %ln, align 4
  %2030 = call i32 @Perl_ibcmp(i8* %2027, i8* %2028, i32 %2029)
  %2031 = icmp ne i32 %2030, 0
  br i1 %2031, label %2038, label %2039

; <label>:2032                                    ; preds = %2020
  %2033 = load i8** %s, align 8
  %2034 = load i8** %locinput, align 8
  %2035 = load i32* %ln, align 4
  %2036 = call i32 @Perl_ibcmp_locale(i8* %2033, i8* %2034, i32 %2035)
  %2037 = icmp ne i32 %2036, 0
  br i1 %2037, label %2038, label %2039

; <label>:2038                                    ; preds = %2032, %2026, %2013
  br label %6127

; <label>:2039                                    ; preds = %2032, %2026, %2013, %2004
  %2040 = load i32* %ln, align 4
  %2041 = load i8** %locinput, align 8
  %2042 = sext i32 %2040 to i64
  %2043 = getelementptr inbounds i8* %2041, i64 %2042
  store i8* %2043, i8** %locinput, align 8
  %2044 = load i8** %locinput, align 8
  %2045 = load i8* %2044, align 1
  %2046 = zext i8 %2045 to i32
  store i32 %2046, i32* %nextchr, align 4
  br label %6120

; <label>:2047                                    ; preds = %24, %24
  br label %6120

; <label>:2048                                    ; preds = %24
  br label %6120

; <label>:2049                                    ; preds = %24
  %2050 = load %struct.sv*** @PL_stack_sp, align 8
  store %struct.sv** %2050, %struct.sv*** %sp, align 8
  %2051 = load %struct.op** @PL_op, align 8
  store %struct.op* %2051, %struct.op** %oop, align 8
  %2052 = load volatile %struct.cop** @PL_curcop, align 8
  store %struct.cop* %2052, %struct.cop** %ocurcop, align 8
  %2053 = load %struct.regexp** @PL_reg_re, align 8
  store %struct.regexp* %2053, %struct.regexp** %oreg, align 8
  %2054 = load %struct.regnode** %scan, align 8
  %2055 = bitcast %struct.regnode* %2054 to %struct.regnode_1*
  %2056 = getelementptr inbounds %struct.regnode_1* %2055, i32 0, i32 3
  %2057 = load i32* %2056, align 4
  store i32 %2057, i32* %n, align 4
  %2058 = load i32* %n, align 4
  %2059 = sext i32 %2058 to i64
  %2060 = load %struct.reg_data** @PL_regdata, align 8
  %2061 = getelementptr inbounds %struct.reg_data* %2060, i32 0, i32 2
  %2062 = getelementptr inbounds [1 x i8*]* %2061, i32 0, i64 %2059
  %2063 = load i8** %2062, align 8
  %2064 = bitcast i8* %2063 to %struct.op*
  store %struct.op* %2064, %struct.op** @PL_op, align 8
  %2065 = load %struct.av** @PL_comppad, align 8
  store %struct.av* %2065, %struct.av** %old_comppad, align 8
  %2066 = load i32* %n, align 4
  %2067 = add nsw i32 %2066, 2
  %2068 = sext i32 %2067 to i64
  %2069 = load %struct.reg_data** @PL_regdata, align 8
  %2070 = getelementptr inbounds %struct.reg_data* %2069, i32 0, i32 2
  %2071 = getelementptr inbounds [1 x i8*]* %2070, i32 0, i64 %2068
  %2072 = load i8** %2071, align 8
  %2073 = bitcast i8* %2072 to %struct.av*
  store %struct.av* %2073, %struct.av** @PL_comppad, align 8
  %2074 = load %struct.av** @PL_comppad, align 8
  %2075 = icmp ne %struct.av* %2074, null
  br i1 %2075, label %2076, label %2083

; <label>:2076                                    ; preds = %2049
  %2077 = load %struct.av** @PL_comppad, align 8
  %2078 = getelementptr inbounds %struct.av* %2077, i32 0, i32 0
  %2079 = load %struct.xpvav** %2078, align 8
  %2080 = getelementptr inbounds %struct.xpvav* %2079, i32 0, i32 0
  %2081 = load i8** %2080, align 8
  %2082 = bitcast i8* %2081 to %struct.sv**
  br label %2084

; <label>:2083                                    ; preds = %2049
  br label %2084

; <label>:2084                                    ; preds = %2083, %2076
  %2085 = phi %struct.sv** [ %2082, %2076 ], [ null, %2083 ]
  store %struct.sv** %2085, %struct.sv*** @PL_curpad, align 8
  %2086 = load i8** %locinput, align 8
  %2087 = load i8** @PL_bostr, align 8
  %2088 = ptrtoint i8* %2086 to i64
  %2089 = ptrtoint i8* %2087 to i64
  %2090 = sub i64 %2088, %2089
  %2091 = trunc i64 %2090 to i32
  %2092 = load %struct.magic** @PL_reg_magic, align 8
  %2093 = getelementptr inbounds %struct.magic* %2092, i32 0, i32 7
  store i32 %2091, i32* %2093, align 4
  %2094 = load i32** @PL_regendp, align 8
  %2095 = getelementptr inbounds i32* %2094, i64 0
  store i32 %2091, i32* %2095, align 4
  %2096 = load %struct.sv*** %sp, align 8
  store %struct.sv** %2096, %struct.sv*** %before, align 8
  %2097 = load i32 ()** @PL_runops, align 8
  %2098 = call i32 %2097()
  %2099 = load %struct.sv*** @PL_stack_sp, align 8
  store %struct.sv** %2099, %struct.sv*** %sp, align 8
  %2100 = load %struct.sv*** %sp, align 8
  %2101 = load %struct.sv*** %before, align 8
  %2102 = icmp eq %struct.sv** %2100, %2101
  br i1 %2102, label %2103, label %2104

; <label>:2103                                    ; preds = %2084
  store %struct.sv* @PL_sv_undef, %struct.sv** %ret, align 8
  br label %2109

; <label>:2104                                    ; preds = %2084
  %2105 = load %struct.sv*** %sp, align 8
  %2106 = getelementptr inbounds %struct.sv** %2105, i32 -1
  store %struct.sv** %2106, %struct.sv*** %sp, align 8
  %2107 = load %struct.sv** %2105, align 8
  store %struct.sv* %2107, %struct.sv** %ret, align 8
  %2108 = load %struct.sv*** %sp, align 8
  store %struct.sv** %2108, %struct.sv*** @PL_stack_sp, align 8
  br label %2109

; <label>:2109                                    ; preds = %2104, %2103
  %2110 = load %struct.op** %oop, align 8
  store %struct.op* %2110, %struct.op** @PL_op, align 8
  %2111 = load %struct.av** %old_comppad, align 8
  store %struct.av* %2111, %struct.av** @PL_comppad, align 8
  %2112 = load %struct.av** @PL_comppad, align 8
  %2113 = icmp ne %struct.av* %2112, null
  br i1 %2113, label %2114, label %2121

; <label>:2114                                    ; preds = %2109
  %2115 = load %struct.av** @PL_comppad, align 8
  %2116 = getelementptr inbounds %struct.av* %2115, i32 0, i32 0
  %2117 = load %struct.xpvav** %2116, align 8
  %2118 = getelementptr inbounds %struct.xpvav* %2117, i32 0, i32 0
  %2119 = load i8** %2118, align 8
  %2120 = bitcast i8* %2119 to %struct.sv**
  br label %2122

; <label>:2121                                    ; preds = %2109
  br label %2122

; <label>:2122                                    ; preds = %2121, %2114
  %2123 = phi %struct.sv** [ %2120, %2114 ], [ null, %2121 ]
  store %struct.sv** %2123, %struct.sv*** @PL_curpad, align 8
  %2124 = load %struct.cop** %ocurcop, align 8
  store volatile %struct.cop* %2124, %struct.cop** @PL_curcop, align 8
  %2125 = load i32* %logical, align 4
  %2126 = icmp ne i32 %2125, 0
  br i1 %2126, label %2127, label %2437

; <label>:2127                                    ; preds = %2122
  %2128 = load i32* %logical, align 4
  %2129 = icmp eq i32 %2128, 2
  br i1 %2129, label %2130, label %2355

; <label>:2130                                    ; preds = %2127
  store %struct.magic* null, %struct.magic** %mg, align 8
  %2131 = load %struct.sv** %ret, align 8
  %2132 = getelementptr inbounds %struct.sv* %2131, i32 0, i32 2
  %2133 = load i32* %2132, align 4
  %2134 = and i32 %2133, 524288
  %2135 = icmp ne i32 %2134, 0
  br i1 %2135, label %2136, label %2150

; <label>:2136                                    ; preds = %2130
  %2137 = load %struct.sv** %ret, align 8
  %2138 = getelementptr inbounds %struct.sv* %2137, i32 0, i32 0
  %2139 = load i8** %2138, align 8
  %2140 = bitcast i8* %2139 to %struct.xrv*
  %2141 = getelementptr inbounds %struct.xrv* %2140, i32 0, i32 0
  %2142 = load %struct.sv** %2141, align 8
  store %struct.sv* %2142, %struct.sv** %sv, align 8
  %2143 = getelementptr inbounds %struct.sv* %2142, i32 0, i32 2
  %2144 = load i32* %2143, align 4
  %2145 = and i32 %2144, 16384
  %2146 = icmp ne i32 %2145, 0
  br i1 %2146, label %2147, label %2150

; <label>:2147                                    ; preds = %2136
  %2148 = load %struct.sv** %sv, align 8
  %2149 = call %struct.magic* @Perl_mg_find(%struct.sv* %2148, i32 114)
  store %struct.magic* %2149, %struct.magic** %mg, align 8
  br label %2170

; <label>:2150                                    ; preds = %2136, %2130
  %2151 = load %struct.sv** %ret, align 8
  %2152 = getelementptr inbounds %struct.sv* %2151, i32 0, i32 2
  %2153 = load i32* %2152, align 4
  %2154 = and i32 %2153, 16384
  %2155 = icmp ne i32 %2154, 0
  br i1 %2155, label %2156, label %2169

; <label>:2156                                    ; preds = %2150
  %2157 = load %struct.sv** %ret, align 8
  %2158 = getelementptr inbounds %struct.sv* %2157, i32 0, i32 2
  %2159 = load i32* %2158, align 4
  %2160 = and i32 %2159, 8192
  %2161 = icmp ne i32 %2160, 0
  br i1 %2161, label %2162, label %2165

; <label>:2162                                    ; preds = %2156
  %2163 = load %struct.sv** %ret, align 8
  %2164 = call i32 @Perl_sv_unmagic(%struct.sv* %2163, i32 114)
  br label %2168

; <label>:2165                                    ; preds = %2156
  %2166 = load %struct.sv** %ret, align 8
  %2167 = call %struct.magic* @Perl_mg_find(%struct.sv* %2166, i32 114)
  store %struct.magic* %2167, %struct.magic** %mg, align 8
  br label %2168

; <label>:2168                                    ; preds = %2165, %2162
  br label %2169

; <label>:2169                                    ; preds = %2168, %2150
  br label %2170

; <label>:2170                                    ; preds = %2169, %2147
  %2171 = load %struct.magic** %mg, align 8
  %2172 = icmp ne %struct.magic* %2171, null
  br i1 %2172, label %2173, label %2190

; <label>:2173                                    ; preds = %2170
  %2174 = load %struct.magic** %mg, align 8
  %2175 = getelementptr inbounds %struct.magic* %2174, i32 0, i32 5
  %2176 = load %struct.sv** %2175, align 8
  %2177 = bitcast %struct.sv* %2176 to %struct.regexp*
  store %struct.regexp* %2177, %struct.regexp** %re, align 8
  %2178 = load %struct.regexp** %re, align 8
  %2179 = icmp ne %struct.regexp* %2178, null
  br i1 %2179, label %2180, label %2186

; <label>:2180                                    ; preds = %2173
  %2181 = load %struct.regexp** %re, align 8
  %2182 = getelementptr inbounds %struct.regexp* %2181, i32 0, i32 9
  %2183 = load i32* %2182, align 4
  %2184 = add nsw i32 %2183, 1
  store i32 %2184, i32* %2182, align 4
  %2185 = icmp ne i32 %2183, 0
  br label %2186

; <label>:2186                                    ; preds = %2180, %2173
  %2187 = phi i1 [ false, %2173 ], [ %2185, %2180 ]
  %2188 = zext i1 %2187 to i32
  %2189 = load %struct.regexp** %re, align 8
  br label %2267

; <label>:2190                                    ; preds = %2170
  %2191 = load %struct.sv** %ret, align 8
  %2192 = getelementptr inbounds %struct.sv* %2191, i32 0, i32 2
  %2193 = load i32* %2192, align 4
  %2194 = and i32 %2193, 262144
  %2195 = icmp eq i32 %2194, 262144
  br i1 %2195, label %2196, label %2209

; <label>:2196                                    ; preds = %2190
  %2197 = load %struct.sv** %ret, align 8
  %2198 = getelementptr inbounds %struct.sv* %2197, i32 0, i32 0
  %2199 = load i8** %2198, align 8
  %2200 = bitcast i8* %2199 to %struct.xpv*
  %2201 = getelementptr inbounds %struct.xpv* %2200, i32 0, i32 1
  %2202 = load i64* %2201, align 8
  store i64 %2202, i64* %len, align 8
  %2203 = load %struct.sv** %ret, align 8
  %2204 = getelementptr inbounds %struct.sv* %2203, i32 0, i32 0
  %2205 = load i8** %2204, align 8
  %2206 = bitcast i8* %2205 to %struct.xpv*
  %2207 = getelementptr inbounds %struct.xpv* %2206, i32 0, i32 0
  %2208 = load i8** %2207, align 8
  br label %2212

; <label>:2209                                    ; preds = %2190
  %2210 = load %struct.sv** %ret, align 8
  %2211 = call i8* @Perl_sv_2pv_flags(%struct.sv* %2210, i64* %len, i32 2)
  br label %2212

; <label>:2212                                    ; preds = %2209, %2196
  %2213 = phi i8* [ %2208, %2196 ], [ %2211, %2209 ]
  store i8* %2213, i8** %t, align 8
  %2214 = load i8** @PL_regprecomp, align 8
  store i8* %2214, i8** %oprecomp, align 8
  %2215 = load i32* @PL_regsize, align 4
  store i32 %2215, i32* %osize, align 4
  %2216 = load i32* @PL_regnpar, align 4
  store i32 %2216, i32* %onpar, align 4
  %2217 = bitcast %struct.pmop* %pm to i8*
  call void @llvm.memset.p0i8.i64(i8* %2217, i8 0, i64 112, i32 1, i1 false)
  %2218 = load %struct.sv** %ret, align 8
  %2219 = getelementptr inbounds %struct.sv* %2218, i32 0, i32 2
  %2220 = load i32* %2219, align 4
  %2221 = and i32 %2220, 536870912
  %2222 = icmp ne i32 %2221, 0
  br i1 %2222, label %2223, label %2236

; <label>:2223                                    ; preds = %2212
  %2224 = load volatile %struct.cop** @PL_curcop, align 8
  %2225 = getelementptr inbounds %struct.cop* %2224, i32 0, i32 7
  %2226 = load i8* %2225, align 1
  %2227 = zext i8 %2226 to i32
  %2228 = and i32 %2227, 8
  %2229 = icmp ne i32 %2228, 0
  br i1 %2229, label %2236, label %2230

; <label>:2230                                    ; preds = %2223
  %2231 = getelementptr inbounds %struct.pmop* %pm, i32 0, i32 16
  %2232 = load i8* %2231, align 1
  %2233 = zext i8 %2232 to i32
  %2234 = or i32 %2233, 8
  %2235 = trunc i32 %2234 to i8
  store i8 %2235, i8* %2231, align 1
  br label %2236

; <label>:2236                                    ; preds = %2230, %2223, %2212
  %2237 = load %struct.regexp* (i8*, i8*, %struct.pmop*)** @PL_regcompp, align 8
  %2238 = load i8** %t, align 8
  %2239 = load i8** %t, align 8
  %2240 = load i64* %len, align 8
  %2241 = getelementptr inbounds i8* %2239, i64 %2240
  %2242 = call %struct.regexp* %2237(i8* %2238, i8* %2241, %struct.pmop* %pm)
  store %struct.regexp* %2242, %struct.regexp** %re, align 8
  %2243 = load %struct.sv** %ret, align 8
  %2244 = getelementptr inbounds %struct.sv* %2243, i32 0, i32 2
  %2245 = load i32* %2244, align 4
  %2246 = and i32 %2245, 8399360
  %2247 = icmp ne i32 %2246, 0
  br i1 %2247, label %2263, label %2248

; <label>:2248                                    ; preds = %2236
  %2249 = load %struct.sv** %ret, align 8
  %2250 = load %struct.regexp** %re, align 8
  %2251 = icmp ne %struct.regexp* %2250, null
  br i1 %2251, label %2252, label %2258

; <label>:2252                                    ; preds = %2248
  %2253 = load %struct.regexp** %re, align 8
  %2254 = getelementptr inbounds %struct.regexp* %2253, i32 0, i32 9
  %2255 = load i32* %2254, align 4
  %2256 = add nsw i32 %2255, 1
  store i32 %2256, i32* %2254, align 4
  %2257 = icmp ne i32 %2255, 0
  br label %2258

; <label>:2258                                    ; preds = %2252, %2248
  %2259 = phi i1 [ false, %2248 ], [ %2257, %2252 ]
  %2260 = zext i1 %2259 to i32
  %2261 = load %struct.regexp** %re, align 8
  %2262 = bitcast %struct.regexp* %2261 to %struct.sv*
  call void @Perl_sv_magic(%struct.sv* %2249, %struct.sv* %2262, i32 114, i8* null, i32 0)
  br label %2263

; <label>:2263                                    ; preds = %2258, %2236
  %2264 = load i8** %oprecomp, align 8
  store i8* %2264, i8** @PL_regprecomp, align 8
  %2265 = load i32* %osize, align 4
  store i32 %2265, i32* @PL_regsize, align 4
  %2266 = load i32* %onpar, align 4
  store i32 %2266, i32* @PL_regnpar, align 4
  br label %2267

; <label>:2267                                    ; preds = %2263, %2186
  %2268 = load %struct.regnode** %next, align 8
  %2269 = getelementptr inbounds %struct.re_cc_state* %state, i32 0, i32 1
  store %struct.regnode* %2268, %struct.regnode** %2269, align 8
  %2270 = load %struct.re_cc_state** @PL_reg_call_cc, align 8
  %2271 = getelementptr inbounds %struct.re_cc_state* %state, i32 0, i32 2
  store %struct.re_cc_state* %2270, %struct.re_cc_state** %2271, align 8
  %2272 = load %struct.curcur** @PL_regcc, align 8
  %2273 = getelementptr inbounds %struct.re_cc_state* %state, i32 0, i32 3
  store %struct.curcur* %2272, %struct.curcur** %2273, align 8
  %2274 = load %struct.regexp** @PL_reg_re, align 8
  %2275 = getelementptr inbounds %struct.re_cc_state* %state, i32 0, i32 4
  store %struct.regexp* %2274, %struct.regexp** %2275, align 8
  store %struct.curcur* null, %struct.curcur** @PL_regcc, align 8
  %2276 = call i32 (i32, ...)* bitcast (i32 (...)* @regcppush to i32 (i32, ...)*)(i32 0)
  store i32 %2276, i32* %cp, align 4
  %2277 = load i32* @PL_savestack_ix, align 4
  store i32 %2277, i32* %lastcp, align 4
  %2278 = load %struct.regexp** %re, align 8
  %2279 = call i32 (%struct.regexp*, ...)* bitcast (i32 (...)* @cache_re to i32 (%struct.regexp*, ...)*)(%struct.regexp* %2278)
  %2280 = load i32* @PL_savestack_ix, align 4
  %2281 = getelementptr inbounds %struct.re_cc_state* %state, i32 0, i32 0
  store i32 %2280, i32* %2281, align 4
  %2282 = load i32** @PL_reglastparen, align 8
  store i32 0, i32* %2282, align 4
  %2283 = load i32** @PL_reglastcloseparen, align 8
  store i32 0, i32* %2283, align 4
  store %struct.re_cc_state* %state, %struct.re_cc_state** @PL_reg_call_cc, align 8
  %2284 = load i8** %locinput, align 8
  store i8* %2284, i8** @PL_reginput, align 8
  %2285 = load i32* @PL_reg_flags, align 4
  %2286 = and i32 %2285, 8
  %2287 = icmp ne i32 %2286, 0
  %2288 = zext i1 %2287 to i32
  %2289 = load %struct.regexp** %re, align 8
  %2290 = getelementptr inbounds %struct.regexp* %2289, i32 0, i32 15
  %2291 = load i32* %2290, align 4
  %2292 = and i32 %2291, 65536
  %2293 = icmp ne i32 %2292, 0
  %2294 = zext i1 %2293 to i32
  %2295 = xor i32 %2288, %2294
  store i32 %2295, i32* %toggleutf, align 4
  %2296 = load i32* %toggleutf, align 4
  %2297 = icmp ne i32 %2296, 0
  br i1 %2297, label %2298, label %2301

; <label>:2298                                    ; preds = %2267
  %2299 = load i32* @PL_reg_flags, align 4
  %2300 = xor i32 %2299, 8
  store i32 %2300, i32* @PL_reg_flags, align 4
  br label %2301

; <label>:2301                                    ; preds = %2298, %2267
  store i32 0, i32* @PL_reg_maxiter, align 4
  %2302 = load %struct.regexp** %re, align 8
  %2303 = getelementptr inbounds %struct.regexp* %2302, i32 0, i32 16
  %2304 = getelementptr inbounds [1 x %struct.regnode]* %2303, i32 0, i32 0
  %2305 = getelementptr inbounds %struct.regnode* %2304, i64 1
  %2306 = call i32 (%struct.regnode*, ...)* bitcast (i32 (...)* @regmatch to i32 (%struct.regnode*, ...)*)(%struct.regnode* %2305)
  %2307 = icmp ne i32 %2306, 0
  br i1 %2307, label %2308, label %2331

; <label>:2308                                    ; preds = %2301
  %2309 = getelementptr inbounds %struct.re_cc_state* %state, i32 0, i32 2
  %2310 = load %struct.re_cc_state** %2309, align 8
  store %struct.re_cc_state* %2310, %struct.re_cc_state** @PL_reg_call_cc, align 8
  %2311 = getelementptr inbounds %struct.re_cc_state* %state, i32 0, i32 3
  %2312 = load %struct.curcur** %2311, align 8
  store %struct.curcur* %2312, %struct.curcur** @PL_regcc, align 8
  %2313 = getelementptr inbounds %struct.re_cc_state* %state, i32 0, i32 4
  %2314 = load %struct.regexp** %2313, align 8
  store %struct.regexp* %2314, %struct.regexp** @PL_reg_re, align 8
  %2315 = load %struct.regexp** @PL_reg_re, align 8
  %2316 = call i32 (%struct.regexp*, ...)* bitcast (i32 (...)* @cache_re to i32 (%struct.regexp*, ...)*)(%struct.regexp* %2315)
  %2317 = load i32* %toggleutf, align 4
  %2318 = icmp ne i32 %2317, 0
  br i1 %2318, label %2319, label %2322

; <label>:2319                                    ; preds = %2308
  %2320 = load i32* @PL_reg_flags, align 4
  %2321 = xor i32 %2320, 8
  store i32 %2321, i32* @PL_reg_flags, align 4
  br label %2322

; <label>:2322                                    ; preds = %2319, %2308
  store i32 0, i32* @PL_reg_maxiter, align 4
  %2323 = load void (%struct.regexp*)** @PL_regfree, align 8
  %2324 = load %struct.regexp** %re, align 8
  call void %2323(%struct.regexp* %2324)
  %2325 = load i32* @PL_savestack_ix, align 4
  %2326 = load i32* %cp, align 4
  %2327 = icmp sgt i32 %2325, %2326
  br i1 %2327, label %2328, label %2330

; <label>:2328                                    ; preds = %2322
  %2329 = load i32* %cp, align 4
  call void @Perl_leave_scope(i32 %2329)
  br label %2330

; <label>:2330                                    ; preds = %2328, %2322
  br label %6126

; <label>:2331                                    ; preds = %2301
  %2332 = load void (%struct.regexp*)** @PL_regfree, align 8
  %2333 = load %struct.regexp** %re, align 8
  call void %2332(%struct.regexp* %2333)
  %2334 = load i32* @PL_savestack_ix, align 4
  %2335 = load i32* %lastcp, align 4
  %2336 = icmp sgt i32 %2334, %2335
  br i1 %2336, label %2337, label %2339

; <label>:2337                                    ; preds = %2331
  %2338 = load i32* %lastcp, align 4
  call void @Perl_leave_scope(i32 %2338)
  br label %2339

; <label>:2339                                    ; preds = %2337, %2331
  %2340 = call i32 (...)* @regcppop()
  %2341 = getelementptr inbounds %struct.re_cc_state* %state, i32 0, i32 2
  %2342 = load %struct.re_cc_state** %2341, align 8
  store %struct.re_cc_state* %2342, %struct.re_cc_state** @PL_reg_call_cc, align 8
  %2343 = getelementptr inbounds %struct.re_cc_state* %state, i32 0, i32 3
  %2344 = load %struct.curcur** %2343, align 8
  store %struct.curcur* %2344, %struct.curcur** @PL_regcc, align 8
  %2345 = getelementptr inbounds %struct.re_cc_state* %state, i32 0, i32 4
  %2346 = load %struct.regexp** %2345, align 8
  store %struct.regexp* %2346, %struct.regexp** @PL_reg_re, align 8
  %2347 = load %struct.regexp** @PL_reg_re, align 8
  %2348 = call i32 (%struct.regexp*, ...)* bitcast (i32 (...)* @cache_re to i32 (%struct.regexp*, ...)*)(%struct.regexp* %2347)
  %2349 = load i32* %toggleutf, align 4
  %2350 = icmp ne i32 %2349, 0
  br i1 %2350, label %2351, label %2354

; <label>:2351                                    ; preds = %2339
  %2352 = load i32* @PL_reg_flags, align 4
  %2353 = xor i32 %2352, 8
  store i32 %2353, i32* @PL_reg_flags, align 4
  br label %2354

; <label>:2354                                    ; preds = %2351, %2339
  store i32 0, i32* @PL_reg_maxiter, align 4
  store i32 0, i32* %logical, align 4
  br label %6127

; <label>:2355                                    ; preds = %2127
  %2356 = load %struct.sv** %ret, align 8
  %2357 = icmp ne %struct.sv* %2356, null
  br i1 %2357, label %2359, label %2358

; <label>:2358                                    ; preds = %2355
  br label %2435

; <label>:2359                                    ; preds = %2355
  %2360 = load %struct.sv** %ret, align 8
  %2361 = getelementptr inbounds %struct.sv* %2360, i32 0, i32 2
  %2362 = load i32* %2361, align 4
  %2363 = and i32 %2362, 262144
  %2364 = icmp ne i32 %2363, 0
  br i1 %2364, label %2365, label %2395

; <label>:2365                                    ; preds = %2359
  %2366 = load %struct.sv** %ret, align 8
  %2367 = getelementptr inbounds %struct.sv* %2366, i32 0, i32 0
  %2368 = load i8** %2367, align 8
  %2369 = bitcast i8* %2368 to %struct.xpv*
  store %struct.xpv* %2369, %struct.xpv** @PL_Xpv, align 8
  %2370 = icmp ne %struct.xpv* %2369, null
  br i1 %2370, label %2371, label %2392

; <label>:2371                                    ; preds = %2365
  %2372 = load %struct.xpv** @PL_Xpv, align 8
  %2373 = getelementptr inbounds %struct.xpv* %2372, i32 0, i32 1
  %2374 = load i64* %2373, align 8
  %2375 = icmp ugt i64 %2374, 1
  br i1 %2375, label %2390, label %2376

; <label>:2376                                    ; preds = %2371
  %2377 = load %struct.xpv** @PL_Xpv, align 8
  %2378 = getelementptr inbounds %struct.xpv* %2377, i32 0, i32 1
  %2379 = load i64* %2378, align 8
  %2380 = icmp ne i64 %2379, 0
  br i1 %2380, label %2381, label %2388

; <label>:2381                                    ; preds = %2376
  %2382 = load %struct.xpv** @PL_Xpv, align 8
  %2383 = getelementptr inbounds %struct.xpv* %2382, i32 0, i32 0
  %2384 = load i8** %2383, align 8
  %2385 = load i8* %2384, align 1
  %2386 = sext i8 %2385 to i32
  %2387 = icmp ne i32 %2386, 48
  br label %2388

; <label>:2388                                    ; preds = %2381, %2376
  %2389 = phi i1 [ false, %2376 ], [ %2387, %2381 ]
  br label %2390

; <label>:2390                                    ; preds = %2388, %2371
  %2391 = phi i1 [ true, %2371 ], [ %2389, %2388 ]
  br label %2392

; <label>:2392                                    ; preds = %2390, %2365
  %2393 = phi i1 [ false, %2365 ], [ %2391, %2390 ]
  %2394 = select i1 %2393, i32 1, i32 0
  br label %2433

; <label>:2395                                    ; preds = %2359
  %2396 = load %struct.sv** %ret, align 8
  %2397 = getelementptr inbounds %struct.sv* %2396, i32 0, i32 2
  %2398 = load i32* %2397, align 4
  %2399 = and i32 %2398, 65536
  %2400 = icmp ne i32 %2399, 0
  br i1 %2400, label %2401, label %2410

; <label>:2401                                    ; preds = %2395
  %2402 = load %struct.sv** %ret, align 8
  %2403 = getelementptr inbounds %struct.sv* %2402, i32 0, i32 0
  %2404 = load i8** %2403, align 8
  %2405 = bitcast i8* %2404 to %struct.xpviv*
  %2406 = getelementptr inbounds %struct.xpviv* %2405, i32 0, i32 3
  %2407 = load i64* %2406, align 8
  %2408 = icmp ne i64 %2407, 0
  %2409 = zext i1 %2408 to i32
  br label %2431

; <label>:2410                                    ; preds = %2395
  %2411 = load %struct.sv** %ret, align 8
  %2412 = getelementptr inbounds %struct.sv* %2411, i32 0, i32 2
  %2413 = load i32* %2412, align 4
  %2414 = and i32 %2413, 131072
  %2415 = icmp ne i32 %2414, 0
  br i1 %2415, label %2416, label %2425

; <label>:2416                                    ; preds = %2410
  %2417 = load %struct.sv** %ret, align 8
  %2418 = getelementptr inbounds %struct.sv* %2417, i32 0, i32 0
  %2419 = load i8** %2418, align 8
  %2420 = bitcast i8* %2419 to %struct.xpvnv*
  %2421 = getelementptr inbounds %struct.xpvnv* %2420, i32 0, i32 4
  %2422 = load double* %2421, align 8
  %2423 = fcmp une double %2422, 0.000000e+00
  %2424 = zext i1 %2423 to i32
  br label %2429

; <label>:2425                                    ; preds = %2410
  %2426 = load %struct.sv** %ret, align 8
  %2427 = call signext i8 @Perl_sv_2bool(%struct.sv* %2426)
  %2428 = sext i8 %2427 to i32
  br label %2429

; <label>:2429                                    ; preds = %2425, %2416
  %2430 = phi i32 [ %2424, %2416 ], [ %2428, %2425 ]
  br label %2431

; <label>:2431                                    ; preds = %2429, %2401
  %2432 = phi i32 [ %2409, %2401 ], [ %2430, %2429 ]
  br label %2433

; <label>:2433                                    ; preds = %2431, %2392
  %2434 = phi i32 [ %2394, %2392 ], [ %2432, %2431 ]
  br label %2435

; <label>:2435                                    ; preds = %2433, %2358
  %2436 = phi i32 [ 0, %2358 ], [ %2434, %2433 ]
  store i32 %2436, i32* %sw, align 4
  store i32 0, i32* %logical, align 4
  br label %2443

; <label>:2437                                    ; preds = %2122
  %2438 = load %struct.gv** @PL_replgv, align 8
  %2439 = call %struct.sv* @Perl_save_scalar(%struct.gv* %2438)
  %2440 = load %struct.sv** %ret, align 8
  call void @Perl_sv_setsv_flags(%struct.sv* %2439, %struct.sv* %2440, i32 2)
  %2441 = load %struct.regexp** %oreg, align 8
  %2442 = call i32 (%struct.regexp*, ...)* bitcast (i32 (...)* @cache_re to i32 (%struct.regexp*, ...)*)(%struct.regexp* %2441)
  br label %2443

; <label>:2443                                    ; preds = %2437, %2435
  br label %6120

; <label>:2444                                    ; preds = %24
  %2445 = load %struct.regnode** %scan, align 8
  %2446 = bitcast %struct.regnode* %2445 to %struct.regnode_1*
  %2447 = getelementptr inbounds %struct.regnode_1* %2446, i32 0, i32 3
  %2448 = load i32* %2447, align 4
  store i32 %2448, i32* %n, align 4
  %2449 = load i8** %locinput, align 8
  %2450 = load i32* %n, align 4
  %2451 = sext i32 %2450 to i64
  %2452 = load i8*** @PL_reg_start_tmp, align 8
  %2453 = getelementptr inbounds i8** %2452, i64 %2451
  store i8* %2449, i8** %2453, align 8
  %2454 = load i32* %n, align 4
  %2455 = load i32* @PL_regsize, align 4
  %2456 = icmp sgt i32 %2454, %2455
  br i1 %2456, label %2457, label %2459

; <label>:2457                                    ; preds = %2444
  %2458 = load i32* %n, align 4
  store i32 %2458, i32* @PL_regsize, align 4
  br label %2459

; <label>:2459                                    ; preds = %2457, %2444
  br label %6120

; <label>:2460                                    ; preds = %24
  %2461 = load %struct.regnode** %scan, align 8
  %2462 = bitcast %struct.regnode* %2461 to %struct.regnode_1*
  %2463 = getelementptr inbounds %struct.regnode_1* %2462, i32 0, i32 3
  %2464 = load i32* %2463, align 4
  store i32 %2464, i32* %n, align 4
  %2465 = load i32* %n, align 4
  %2466 = sext i32 %2465 to i64
  %2467 = load i8*** @PL_reg_start_tmp, align 8
  %2468 = getelementptr inbounds i8** %2467, i64 %2466
  %2469 = load i8** %2468, align 8
  %2470 = load i8** @PL_bostr, align 8
  %2471 = ptrtoint i8* %2469 to i64
  %2472 = ptrtoint i8* %2470 to i64
  %2473 = sub i64 %2471, %2472
  %2474 = trunc i64 %2473 to i32
  %2475 = load i32* %n, align 4
  %2476 = sext i32 %2475 to i64
  %2477 = load i32** @PL_regstartp, align 8
  %2478 = getelementptr inbounds i32* %2477, i64 %2476
  store i32 %2474, i32* %2478, align 4
  %2479 = load i8** %locinput, align 8
  %2480 = load i8** @PL_bostr, align 8
  %2481 = ptrtoint i8* %2479 to i64
  %2482 = ptrtoint i8* %2480 to i64
  %2483 = sub i64 %2481, %2482
  %2484 = trunc i64 %2483 to i32
  %2485 = load i32* %n, align 4
  %2486 = sext i32 %2485 to i64
  %2487 = load i32** @PL_regendp, align 8
  %2488 = getelementptr inbounds i32* %2487, i64 %2486
  store i32 %2484, i32* %2488, align 4
  %2489 = load i32* %n, align 4
  %2490 = load i32** @PL_reglastparen, align 8
  %2491 = load i32* %2490, align 4
  %2492 = icmp sgt i32 %2489, %2491
  br i1 %2492, label %2493, label %2496

; <label>:2493                                    ; preds = %2460
  %2494 = load i32* %n, align 4
  %2495 = load i32** @PL_reglastparen, align 8
  store i32 %2494, i32* %2495, align 4
  br label %2496

; <label>:2496                                    ; preds = %2493, %2460
  %2497 = load i32* %n, align 4
  %2498 = load i32** @PL_reglastcloseparen, align 8
  store i32 %2497, i32* %2498, align 4
  br label %6120

; <label>:2499                                    ; preds = %24
  %2500 = load %struct.regnode** %scan, align 8
  %2501 = bitcast %struct.regnode* %2500 to %struct.regnode_1*
  %2502 = getelementptr inbounds %struct.regnode_1* %2501, i32 0, i32 3
  %2503 = load i32* %2502, align 4
  store i32 %2503, i32* %n, align 4
  %2504 = load i32** @PL_reglastparen, align 8
  %2505 = load i32* %2504, align 4
  %2506 = load i32* %n, align 4
  %2507 = icmp sge i32 %2505, %2506
  br i1 %2507, label %2508, label %2515

; <label>:2508                                    ; preds = %2499
  %2509 = load i32* %n, align 4
  %2510 = sext i32 %2509 to i64
  %2511 = load i32** @PL_regendp, align 8
  %2512 = getelementptr inbounds i32* %2511, i64 %2510
  %2513 = load i32* %2512, align 4
  %2514 = icmp ne i32 %2513, -1
  br label %2515

; <label>:2515                                    ; preds = %2508, %2499
  %2516 = phi i1 [ false, %2499 ], [ %2514, %2508 ]
  %2517 = zext i1 %2516 to i32
  store i32 %2517, i32* %sw, align 4
  br label %6120

; <label>:2518                                    ; preds = %24
  %2519 = load i32* @PL_reg_maxiter, align 4
  store i32 %2519, i32* @PL_reg_leftiter, align 4
  %2520 = load i32* %sw, align 4
  %2521 = icmp ne i32 %2520, 0
  br i1 %2521, label %2522, label %2526

; <label>:2522                                    ; preds = %2518
  %2523 = load %struct.regnode** %scan, align 8
  %2524 = getelementptr inbounds %struct.regnode* %2523, i64 1
  %2525 = getelementptr inbounds %struct.regnode* %2524, i64 1
  store %struct.regnode* %2525, %struct.regnode** %next, align 8
  br label %2544

; <label>:2526                                    ; preds = %2518
  %2527 = load %struct.regnode** %scan, align 8
  %2528 = load %struct.regnode** %scan, align 8
  %2529 = bitcast %struct.regnode* %2528 to %struct.regnode_1*
  %2530 = getelementptr inbounds %struct.regnode_1* %2529, i32 0, i32 3
  %2531 = load i32* %2530, align 4
  %2532 = zext i32 %2531 to i64
  %2533 = getelementptr inbounds %struct.regnode* %2527, i64 %2532
  store %struct.regnode* %2533, %struct.regnode** %next, align 8
  %2534 = load %struct.regnode** %next, align 8
  %2535 = getelementptr inbounds %struct.regnode* %2534, i32 0, i32 1
  %2536 = load i8* %2535, align 1
  %2537 = zext i8 %2536 to i32
  %2538 = icmp eq i32 %2537, 53
  br i1 %2538, label %2539, label %2543

; <label>:2539                                    ; preds = %2526
  %2540 = load %struct.regnode** %next, align 8
  %2541 = getelementptr inbounds %struct.regnode* %2540, i64 1
  %2542 = getelementptr inbounds %struct.regnode* %2541, i64 1
  store %struct.regnode* %2542, %struct.regnode** %next, align 8
  br label %2543

; <label>:2543                                    ; preds = %2539, %2526
  br label %2544

; <label>:2544                                    ; preds = %2543, %2522
  br label %6120

; <label>:2545                                    ; preds = %24
  %2546 = load %struct.regnode** %scan, align 8
  %2547 = getelementptr inbounds %struct.regnode* %2546, i32 0, i32 0
  %2548 = load i8* %2547, align 1
  %2549 = zext i8 %2548 to i32
  store i32 %2549, i32* %logical, align 4
  br label %6120

; <label>:2550                                    ; preds = %24
  %2551 = load i32* @PL_savestack_ix, align 4
  store i32 %2551, i32* %cp5, align 4
  %2552 = load %struct.regnode** %scan, align 8
  %2553 = getelementptr inbounds %struct.regnode* %2552, i32 0, i32 0
  %2554 = load i8* %2553, align 1
  %2555 = zext i8 %2554 to i32
  store i32 %2555, i32* %parenfloor, align 4
  %2556 = load %struct.regnode** %next, align 8
  %2557 = getelementptr inbounds %struct.regnode* %2556, i64 -1
  %2558 = getelementptr inbounds %struct.regnode* %2557, i32 0, i32 1
  %2559 = load i8* %2558, align 1
  %2560 = zext i8 %2559 to i32
  %2561 = icmp eq i32 %2560, 36
  br i1 %2561, label %2562, label %2570

; <label>:2562                                    ; preds = %2550
  %2563 = load %struct.regnode** %next, align 8
  %2564 = bitcast %struct.regnode* %2563 to %struct.regnode_1*
  %2565 = getelementptr inbounds %struct.regnode_1* %2564, i32 0, i32 3
  %2566 = load i32* %2565, align 4
  %2567 = load %struct.regnode** %next, align 8
  %2568 = zext i32 %2566 to i64
  %2569 = getelementptr inbounds %struct.regnode* %2567, i64 %2568
  store %struct.regnode* %2569, %struct.regnode** %next, align 8
  br label %2570

; <label>:2570                                    ; preds = %2562, %2550
  %2571 = load %struct.curcur** @PL_regcc, align 8
  %2572 = getelementptr inbounds %struct.curcur* %cc, i32 0, i32 8
  store %struct.curcur* %2571, %struct.curcur** %2572, align 8
  store %struct.curcur* %cc, %struct.curcur** @PL_regcc, align 8
  %2573 = load i32* %parenfloor, align 4
  %2574 = load i32** @PL_reglastparen, align 8
  %2575 = load i32* %2574, align 4
  %2576 = icmp sgt i32 %2573, %2575
  br i1 %2576, label %2577, label %2580

; <label>:2577                                    ; preds = %2570
  %2578 = load i32** @PL_reglastparen, align 8
  %2579 = load i32* %2578, align 4
  store i32 %2579, i32* %parenfloor, align 4
  br label %2580

; <label>:2580                                    ; preds = %2577, %2570
  %2581 = load i32* %parenfloor, align 4
  %2582 = getelementptr inbounds %struct.curcur* %cc, i32 0, i32 0
  store i32 %2581, i32* %2582, align 4
  %2583 = getelementptr inbounds %struct.curcur* %cc, i32 0, i32 1
  store i32 -1, i32* %2583, align 4
  %2584 = load %struct.regnode** %scan, align 8
  %2585 = bitcast %struct.regnode* %2584 to %struct.regnode_2*
  %2586 = getelementptr inbounds %struct.regnode_2* %2585, i32 0, i32 3
  %2587 = load i16* %2586, align 2
  %2588 = zext i16 %2587 to i32
  %2589 = getelementptr inbounds %struct.curcur* %cc, i32 0, i32 2
  store i32 %2588, i32* %2589, align 4
  %2590 = load %struct.regnode** %scan, align 8
  %2591 = bitcast %struct.regnode* %2590 to %struct.regnode_2*
  %2592 = getelementptr inbounds %struct.regnode_2* %2591, i32 0, i32 4
  %2593 = load i16* %2592, align 2
  %2594 = zext i16 %2593 to i32
  %2595 = getelementptr inbounds %struct.curcur* %cc, i32 0, i32 3
  store i32 %2594, i32* %2595, align 4
  %2596 = load %struct.regnode** %scan, align 8
  %2597 = getelementptr inbounds %struct.regnode* %2596, i64 1
  %2598 = getelementptr inbounds %struct.regnode* %2597, i64 1
  %2599 = getelementptr inbounds %struct.curcur* %cc, i32 0, i32 5
  store %struct.regnode* %2598, %struct.regnode** %2599, align 8
  %2600 = load %struct.regnode** %next, align 8
  %2601 = getelementptr inbounds %struct.curcur* %cc, i32 0, i32 6
  store %struct.regnode* %2600, %struct.regnode** %2601, align 8
  %2602 = load i32* %minmod, align 4
  %2603 = getelementptr inbounds %struct.curcur* %cc, i32 0, i32 4
  store i32 %2602, i32* %2603, align 4
  %2604 = getelementptr inbounds %struct.curcur* %cc, i32 0, i32 7
  store i8* null, i8** %2604, align 8
  %2605 = load i8** %locinput, align 8
  store i8* %2605, i8** @PL_reginput, align 8
  %2606 = load %struct.regnode** %next, align 8
  %2607 = getelementptr inbounds %struct.regnode* %2606, i64 -1
  %2608 = call i32 (%struct.regnode*, ...)* bitcast (i32 (...)* @regmatch to i32 (%struct.regnode*, ...)*)(%struct.regnode* %2607)
  store i32 %2608, i32* %n, align 4
  %2609 = load i32* @PL_savestack_ix, align 4
  %2610 = load i32* %cp5, align 4
  %2611 = icmp sgt i32 %2609, %2610
  br i1 %2611, label %2612, label %2614

; <label>:2612                                    ; preds = %2580
  %2613 = load i32* %cp5, align 4
  call void @Perl_leave_scope(i32 %2613)
  br label %2614

; <label>:2614                                    ; preds = %2612, %2580
  %2615 = getelementptr inbounds %struct.curcur* %cc, i32 0, i32 8
  %2616 = load %struct.curcur** %2615, align 8
  store %struct.curcur* %2616, %struct.curcur** @PL_regcc, align 8
  %2617 = load i32* %n, align 4
  %2618 = icmp ne i32 %2617, 0
  br i1 %2618, label %2619, label %2620

; <label>:2619                                    ; preds = %2614
  br label %6126

; <label>:2620                                    ; preds = %2614
  br label %6127

; <label>:2621                                    ; preds = %24
  %2622 = load %struct.curcur** @PL_regcc, align 8
  store %struct.curcur* %2622, %struct.curcur** %cc8, align 8
  %2623 = load %struct.curcur** %cc8, align 8
  %2624 = getelementptr inbounds %struct.curcur* %2623, i32 0, i32 7
  %2625 = load i8** %2624, align 8
  store i8* %2625, i8** %lastloc, align 8
  store i32 0, i32* %cache_offset, align 4
  store i32 0, i32* %cache_bit, align 4
  %2626 = load %struct.curcur** %cc8, align 8
  %2627 = getelementptr inbounds %struct.curcur* %2626, i32 0, i32 1
  %2628 = load i32* %2627, align 4
  %2629 = add nsw i32 %2628, 1
  store i32 %2629, i32* %n, align 4
  %2630 = load i8** %locinput, align 8
  store i8* %2630, i8** @PL_reginput, align 8
  %2631 = load i8** %locinput, align 8
  %2632 = load %struct.curcur** %cc8, align 8
  %2633 = getelementptr inbounds %struct.curcur* %2632, i32 0, i32 7
  %2634 = load i8** %2633, align 8
  %2635 = icmp eq i8* %2631, %2634
  br i1 %2635, label %2636, label %2668

; <label>:2636                                    ; preds = %2621
  %2637 = load i32* %n, align 4
  %2638 = load %struct.curcur** %cc8, align 8
  %2639 = getelementptr inbounds %struct.curcur* %2638, i32 0, i32 2
  %2640 = load i32* %2639, align 4
  %2641 = icmp sge i32 %2637, %2640
  br i1 %2641, label %2642, label %2668

; <label>:2642                                    ; preds = %2636
  %2643 = load %struct.curcur** %cc8, align 8
  %2644 = getelementptr inbounds %struct.curcur* %2643, i32 0, i32 8
  %2645 = load %struct.curcur** %2644, align 8
  store %struct.curcur* %2645, %struct.curcur** @PL_regcc, align 8
  %2646 = load %struct.curcur** @PL_regcc, align 8
  %2647 = icmp ne %struct.curcur* %2646, null
  br i1 %2647, label %2648, label %2652

; <label>:2648                                    ; preds = %2642
  %2649 = load %struct.curcur** @PL_regcc, align 8
  %2650 = getelementptr inbounds %struct.curcur* %2649, i32 0, i32 1
  %2651 = load i32* %2650, align 4
  store i32 %2651, i32* %ln, align 4
  br label %2652

; <label>:2652                                    ; preds = %2648, %2642
  %2653 = load %struct.curcur** %cc8, align 8
  %2654 = getelementptr inbounds %struct.curcur* %2653, i32 0, i32 6
  %2655 = load %struct.regnode** %2654, align 8
  %2656 = call i32 (%struct.regnode*, ...)* bitcast (i32 (...)* @regmatch to i32 (%struct.regnode*, ...)*)(%struct.regnode* %2655)
  %2657 = icmp ne i32 %2656, 0
  br i1 %2657, label %2658, label %2659

; <label>:2658                                    ; preds = %2652
  br label %6126

; <label>:2659                                    ; preds = %2652
  %2660 = load %struct.curcur** @PL_regcc, align 8
  %2661 = icmp ne %struct.curcur* %2660, null
  br i1 %2661, label %2662, label %2666

; <label>:2662                                    ; preds = %2659
  %2663 = load i32* %ln, align 4
  %2664 = load %struct.curcur** @PL_regcc, align 8
  %2665 = getelementptr inbounds %struct.curcur* %2664, i32 0, i32 1
  store i32 %2663, i32* %2665, align 4
  br label %2666

; <label>:2666                                    ; preds = %2662, %2659
  %2667 = load %struct.curcur** %cc8, align 8
  store %struct.curcur* %2667, %struct.curcur** @PL_regcc, align 8
  br label %6127

; <label>:2668                                    ; preds = %2636, %2621
  %2669 = load i32* %n, align 4
  %2670 = load %struct.curcur** %cc8, align 8
  %2671 = getelementptr inbounds %struct.curcur* %2670, i32 0, i32 2
  %2672 = load i32* %2671, align 4
  %2673 = icmp slt i32 %2669, %2672
  br i1 %2673, label %2674, label %2695

; <label>:2674                                    ; preds = %2668
  %2675 = load i32* %n, align 4
  %2676 = load %struct.curcur** %cc8, align 8
  %2677 = getelementptr inbounds %struct.curcur* %2676, i32 0, i32 1
  store i32 %2675, i32* %2677, align 4
  %2678 = load i8** %locinput, align 8
  %2679 = load %struct.curcur** %cc8, align 8
  %2680 = getelementptr inbounds %struct.curcur* %2679, i32 0, i32 7
  store i8* %2678, i8** %2680, align 8
  %2681 = load %struct.curcur** %cc8, align 8
  %2682 = getelementptr inbounds %struct.curcur* %2681, i32 0, i32 5
  %2683 = load %struct.regnode** %2682, align 8
  %2684 = call i32 (%struct.regnode*, ...)* bitcast (i32 (...)* @regmatch to i32 (%struct.regnode*, ...)*)(%struct.regnode* %2683)
  %2685 = icmp ne i32 %2684, 0
  br i1 %2685, label %2686, label %2687

; <label>:2686                                    ; preds = %2674
  br label %6126

; <label>:2687                                    ; preds = %2674
  %2688 = load i32* %n, align 4
  %2689 = sub nsw i32 %2688, 1
  %2690 = load %struct.curcur** %cc8, align 8
  %2691 = getelementptr inbounds %struct.curcur* %2690, i32 0, i32 1
  store i32 %2689, i32* %2691, align 4
  %2692 = load i8** %lastloc, align 8
  %2693 = load %struct.curcur** %cc8, align 8
  %2694 = getelementptr inbounds %struct.curcur* %2693, i32 0, i32 7
  store i8* %2692, i8** %2694, align 8
  br label %6127

; <label>:2695                                    ; preds = %2668
  %2696 = load %struct.regnode** %scan, align 8
  %2697 = getelementptr inbounds %struct.regnode* %2696, i32 0, i32 0
  %2698 = load i8* %2697, align 1
  %2699 = icmp ne i8 %2698, 0
  br i1 %2699, label %2700, label %2820

; <label>:2700                                    ; preds = %2695
  %2701 = load i32* @PL_reg_maxiter, align 4
  %2702 = icmp ne i32 %2701, 0
  br i1 %2702, label %2719, label %2703

; <label>:2703                                    ; preds = %2700
  %2704 = load i8** @PL_regeol, align 8
  %2705 = load i8** @PL_bostr, align 8
  %2706 = ptrtoint i8* %2704 to i64
  %2707 = ptrtoint i8* %2705 to i64
  %2708 = sub i64 %2706, %2707
  %2709 = add nsw i64 %2708, 1
  %2710 = load %struct.regnode** %scan, align 8
  %2711 = getelementptr inbounds %struct.regnode* %2710, i32 0, i32 0
  %2712 = load i8* %2711, align 1
  %2713 = zext i8 %2712 to i32
  %2714 = ashr i32 %2713, 4
  %2715 = sext i32 %2714 to i64
  %2716 = mul nsw i64 %2709, %2715
  %2717 = trunc i64 %2716 to i32
  store i32 %2717, i32* @PL_reg_maxiter, align 4
  %2718 = load i32* @PL_reg_maxiter, align 4
  store i32 %2718, i32* @PL_reg_leftiter, align 4
  br label %2719

; <label>:2719                                    ; preds = %2703, %2700
  %2720 = load i32* @PL_reg_leftiter, align 4
  %2721 = add nsw i32 %2720, -1
  store i32 %2721, i32* @PL_reg_leftiter, align 4
  %2722 = icmp eq i32 %2720, 0
  br i1 %2722, label %2723, label %2760

; <label>:2723                                    ; preds = %2719
  %2724 = load i32* @PL_reg_maxiter, align 4
  %2725 = add nsw i32 %2724, 7
  %2726 = add nsw i32 %2725, 2
  %2727 = sdiv i32 %2726, 8
  store i32 %2727, i32* %size, align 4
  %2728 = load i8** @PL_reg_poscache, align 8
  %2729 = icmp ne i8* %2728, null
  br i1 %2729, label %2730, label %2748

; <label>:2730                                    ; preds = %2723
  %2731 = load i64* @PL_reg_poscache_size, align 8
  %2732 = trunc i64 %2731 to i32
  %2733 = load i32* %size, align 4
  %2734 = icmp slt i32 %2732, %2733
  br i1 %2734, label %2735, label %2743

; <label>:2735                                    ; preds = %2730
  %2736 = load i8** @PL_reg_poscache, align 8
  %2737 = load i32* %size, align 4
  %2738 = sext i32 %2737 to i64
  %2739 = mul i64 %2738, 1
  %2740 = call i8* @Perl_safesysrealloc(i8* %2736, i64 %2739)
  store i8* %2740, i8** @PL_reg_poscache, align 8
  %2741 = load i32* %size, align 4
  %2742 = sext i32 %2741 to i64
  store i64 %2742, i64* @PL_reg_poscache_size, align 8
  br label %2743

; <label>:2743                                    ; preds = %2735, %2730
  %2744 = load i8** @PL_reg_poscache, align 8
  %2745 = load i32* %size, align 4
  %2746 = sext i32 %2745 to i64
  %2747 = mul i64 %2746, 1
  call void @llvm.memset.p0i8.i64(i8* %2744, i8 0, i64 %2747, i32 1, i1 false)
  br label %2759

; <label>:2748                                    ; preds = %2723
  %2749 = load i32* %size, align 4
  %2750 = sext i32 %2749 to i64
  store i64 %2750, i64* @PL_reg_poscache_size, align 8
  %2751 = load i32* %size, align 4
  %2752 = sext i32 %2751 to i64
  %2753 = mul i64 %2752, 1
  %2754 = call i8* @Perl_safesysmalloc(i64 %2753)
  store i8* %2754, i8** @PL_reg_poscache, align 8
  %2755 = load i8** @PL_reg_poscache, align 8
  %2756 = load i32* %size, align 4
  %2757 = sext i32 %2756 to i64
  %2758 = mul i64 %2757, 1
  call void @llvm.memset.p0i8.i64(i8* %2755, i8 0, i64 %2758, i32 1, i1 false)
  br label %2759

; <label>:2759                                    ; preds = %2748, %2743
  br label %2760

; <label>:2760                                    ; preds = %2759, %2719
  %2761 = load i32* @PL_reg_leftiter, align 4
  %2762 = icmp slt i32 %2761, 0
  br i1 %2762, label %2763, label %2819

; <label>:2763                                    ; preds = %2760
  %2764 = load i8** %locinput, align 8
  %2765 = load i8** @PL_bostr, align 8
  %2766 = ptrtoint i8* %2764 to i64
  %2767 = ptrtoint i8* %2765 to i64
  %2768 = sub i64 %2766, %2767
  %2769 = trunc i64 %2768 to i32
  store i32 %2769, i32* %cache_offset, align 4
  %2770 = load %struct.regnode** %scan, align 8
  %2771 = getelementptr inbounds %struct.regnode* %2770, i32 0, i32 0
  %2772 = load i8* %2771, align 1
  %2773 = zext i8 %2772 to i32
  %2774 = and i32 %2773, 15
  %2775 = sub nsw i32 %2774, 1
  %2776 = add nsw i32 %2775, 2
  %2777 = load i32* %cache_offset, align 4
  %2778 = load %struct.regnode** %scan, align 8
  %2779 = getelementptr inbounds %struct.regnode* %2778, i32 0, i32 0
  %2780 = load i8* %2779, align 1
  %2781 = zext i8 %2780 to i32
  %2782 = ashr i32 %2781, 4
  %2783 = mul nsw i32 %2777, %2782
  %2784 = add nsw i32 %2776, %2783
  store i32 %2784, i32* %cache_offset, align 4
  %2785 = load i32* %cache_offset, align 4
  %2786 = srem i32 %2785, 8
  store i32 %2786, i32* %cache_bit, align 4
  %2787 = load i32* %cache_offset, align 4
  %2788 = sdiv i32 %2787, 8
  store i32 %2788, i32* %cache_offset, align 4
  %2789 = load i32* %cache_offset, align 4
  %2790 = sext i32 %2789 to i64
  %2791 = load i8** @PL_reg_poscache, align 8
  %2792 = getelementptr inbounds i8* %2791, i64 %2790
  %2793 = load i8* %2792, align 1
  %2794 = sext i8 %2793 to i32
  %2795 = load i32* %cache_bit, align 4
  %2796 = shl i32 1, %2795
  %2797 = and i32 %2794, %2796
  %2798 = icmp ne i32 %2797, 0
  br i1 %2798, label %2799, label %2808

; <label>:2799                                    ; preds = %2763
  %2800 = load i8** @PL_reg_poscache, align 8
  %2801 = getelementptr inbounds i8* %2800, i64 0
  %2802 = load i8* %2801, align 1
  %2803 = sext i8 %2802 to i32
  %2804 = and i32 %2803, 1
  %2805 = icmp ne i32 %2804, 0
  br i1 %2805, label %2806, label %2807

; <label>:2806                                    ; preds = %2799
  br label %6126

; <label>:2807                                    ; preds = %2799
  br label %6129

; <label>:2808                                    ; preds = %2763
  %2809 = load i32* %cache_bit, align 4
  %2810 = shl i32 1, %2809
  %2811 = load i32* %cache_offset, align 4
  %2812 = sext i32 %2811 to i64
  %2813 = load i8** @PL_reg_poscache, align 8
  %2814 = getelementptr inbounds i8* %2813, i64 %2812
  %2815 = load i8* %2814, align 1
  %2816 = sext i8 %2815 to i32
  %2817 = or i32 %2816, %2810
  %2818 = trunc i32 %2817 to i8
  store i8 %2818, i8* %2814, align 1
  br label %2819

; <label>:2819                                    ; preds = %2808, %2760
  br label %2820

; <label>:2820                                    ; preds = %2819, %2695
  %2821 = load %struct.curcur** %cc8, align 8
  %2822 = getelementptr inbounds %struct.curcur* %2821, i32 0, i32 4
  %2823 = load i32* %2822, align 4
  %2824 = icmp ne i32 %2823, 0
  br i1 %2824, label %2825, label %3124

; <label>:2825                                    ; preds = %2820
  %2826 = load %struct.curcur** %cc8, align 8
  %2827 = getelementptr inbounds %struct.curcur* %2826, i32 0, i32 8
  %2828 = load %struct.curcur** %2827, align 8
  store %struct.curcur* %2828, %struct.curcur** @PL_regcc, align 8
  %2829 = load %struct.curcur** @PL_regcc, align 8
  %2830 = icmp ne %struct.curcur* %2829, null
  br i1 %2830, label %2831, label %2835

; <label>:2831                                    ; preds = %2825
  %2832 = load %struct.curcur** @PL_regcc, align 8
  %2833 = getelementptr inbounds %struct.curcur* %2832, i32 0, i32 1
  %2834 = load i32* %2833, align 4
  store i32 %2834, i32* %ln, align 4
  br label %2835

; <label>:2835                                    ; preds = %2831, %2825
  %2836 = load %struct.curcur** %cc8, align 8
  %2837 = getelementptr inbounds %struct.curcur* %2836, i32 0, i32 0
  %2838 = load i32* %2837, align 4
  %2839 = call i32 (i32, ...)* bitcast (i32 (...)* @regcppush to i32 (i32, ...)*)(i32 %2838)
  store i32 %2839, i32* %cp6, align 4
  %2840 = load i32* @PL_savestack_ix, align 4
  store i32 %2840, i32* %lastcp7, align 4
  %2841 = load %struct.curcur** %cc8, align 8
  %2842 = getelementptr inbounds %struct.curcur* %2841, i32 0, i32 6
  %2843 = load %struct.regnode** %2842, align 8
  %2844 = call i32 (%struct.regnode*, ...)* bitcast (i32 (...)* @regmatch to i32 (%struct.regnode*, ...)*)(%struct.regnode* %2843)
  %2845 = icmp ne i32 %2844, 0
  br i1 %2845, label %2846, label %2893

; <label>:2846                                    ; preds = %2835
  %2847 = load i32* @PL_savestack_ix, align 4
  %2848 = load i32* %cp6, align 4
  %2849 = icmp sgt i32 %2847, %2848
  br i1 %2849, label %2850, label %2852

; <label>:2850                                    ; preds = %2846
  %2851 = load i32* %cp6, align 4
  call void @Perl_leave_scope(i32 %2851)
  br label %2852

; <label>:2852                                    ; preds = %2850, %2846
  %2853 = load i32* %cache_offset, align 4
  %2854 = load i32* %cache_bit, align 4
  %2855 = or i32 %2853, %2854
  %2856 = icmp ne i32 %2855, 0
  br i1 %2856, label %2857, label %2892

; <label>:2857                                    ; preds = %2852
  %2858 = load i8** @PL_reg_poscache, align 8
  %2859 = getelementptr inbounds i8* %2858, i64 0
  %2860 = load i8* %2859, align 1
  %2861 = sext i8 %2860 to i32
  %2862 = and i32 %2861, 2
  %2863 = icmp ne i32 %2862, 0
  br i1 %2863, label %2871, label %2864

; <label>:2864                                    ; preds = %2857
  %2865 = load i8** @PL_reg_poscache, align 8
  %2866 = getelementptr inbounds i8* %2865, i64 0
  %2867 = load i8* %2866, align 1
  %2868 = sext i8 %2867 to i32
  %2869 = or i32 %2868, 1
  %2870 = trunc i32 %2869 to i8
  store i8 %2870, i8* %2866, align 1
  br label %2891

; <label>:2871                                    ; preds = %2857
  %2872 = load i8** @PL_reg_poscache, align 8
  %2873 = getelementptr inbounds i8* %2872, i64 0
  %2874 = load i8* %2873, align 1
  %2875 = sext i8 %2874 to i32
  %2876 = and i32 %2875, 1
  %2877 = icmp ne i32 %2876, 0
  br i1 %2877, label %2890, label %2878

; <label>:2878                                    ; preds = %2871
  %2879 = load i32* %cache_bit, align 4
  %2880 = shl i32 1, %2879
  %2881 = xor i32 %2880, -1
  %2882 = load i32* %cache_offset, align 4
  %2883 = sext i32 %2882 to i64
  %2884 = load i8** @PL_reg_poscache, align 8
  %2885 = getelementptr inbounds i8* %2884, i64 %2883
  %2886 = load i8* %2885, align 1
  %2887 = sext i8 %2886 to i32
  %2888 = and i32 %2887, %2881
  %2889 = trunc i32 %2888 to i8
  store i8 %2889, i8* %2885, align 1
  br label %2890

; <label>:2890                                    ; preds = %2878, %2871
  br label %2891

; <label>:2891                                    ; preds = %2890, %2864
  br label %2892

; <label>:2892                                    ; preds = %2891, %2852
  br label %6126

; <label>:2893                                    ; preds = %2835
  %2894 = load i32* @PL_savestack_ix, align 4
  %2895 = load i32* %lastcp7, align 4
  %2896 = icmp sgt i32 %2894, %2895
  br i1 %2896, label %2897, label %2899

; <label>:2897                                    ; preds = %2893
  %2898 = load i32* %lastcp7, align 4
  call void @Perl_leave_scope(i32 %2898)
  br label %2899

; <label>:2899                                    ; preds = %2897, %2893
  %2900 = call i32 (...)* @regcppop()
  %2901 = load %struct.curcur** @PL_regcc, align 8
  %2902 = icmp ne %struct.curcur* %2901, null
  br i1 %2902, label %2903, label %2907

; <label>:2903                                    ; preds = %2899
  %2904 = load i32* %ln, align 4
  %2905 = load %struct.curcur** @PL_regcc, align 8
  %2906 = getelementptr inbounds %struct.curcur* %2905, i32 0, i32 1
  store i32 %2904, i32* %2906, align 4
  br label %2907

; <label>:2907                                    ; preds = %2903, %2899
  %2908 = load %struct.curcur** %cc8, align 8
  store %struct.curcur* %2908, %struct.curcur** @PL_regcc, align 8
  %2909 = load i32* %n, align 4
  %2910 = load %struct.curcur** %cc8, align 8
  %2911 = getelementptr inbounds %struct.curcur* %2910, i32 0, i32 3
  %2912 = load i32* %2911, align 4
  %2913 = icmp sge i32 %2909, %2912
  br i1 %2913, label %2914, label %3004

; <label>:2914                                    ; preds = %2907
  %2915 = load volatile %struct.cop** @PL_curcop, align 8
  %2916 = getelementptr inbounds %struct.cop* %2915, i32 0, i32 14
  %2917 = load %struct.sv** %2916, align 8
  %2918 = icmp ne %struct.sv* %2917, null
  br i1 %2918, label %2919, label %2943

; <label>:2919                                    ; preds = %2914
  %2920 = load volatile %struct.cop** @PL_curcop, align 8
  %2921 = getelementptr inbounds %struct.cop* %2920, i32 0, i32 14
  %2922 = load %struct.sv** %2921, align 8
  %2923 = icmp ne %struct.sv* %2922, getelementptr inbounds (%struct.sv* null, i64 2)
  br i1 %2923, label %2924, label %2943

; <label>:2924                                    ; preds = %2919
  %2925 = load volatile %struct.cop** @PL_curcop, align 8
  %2926 = getelementptr inbounds %struct.cop* %2925, i32 0, i32 14
  %2927 = load %struct.sv** %2926, align 8
  %2928 = icmp eq %struct.sv* %2927, getelementptr inbounds (%struct.sv* null, i64 1)
  br i1 %2928, label %2953, label %2929

; <label>:2929                                    ; preds = %2924
  %2930 = load volatile %struct.cop** @PL_curcop, align 8
  %2931 = getelementptr inbounds %struct.cop* %2930, i32 0, i32 14
  %2932 = load %struct.sv** %2931, align 8
  %2933 = getelementptr inbounds %struct.sv* %2932, i32 0, i32 0
  %2934 = load i8** %2933, align 8
  %2935 = bitcast i8* %2934 to %struct.xpv*
  %2936 = getelementptr inbounds %struct.xpv* %2935, i32 0, i32 0
  %2937 = load i8** %2936, align 8
  %2938 = getelementptr inbounds i8* %2937, i64 5
  %2939 = load i8* %2938, align 1
  %2940 = sext i8 %2939 to i32
  %2941 = and i32 %2940, 1
  %2942 = icmp ne i32 %2941, 0
  br i1 %2942, label %2953, label %2943

; <label>:2943                                    ; preds = %2929, %2919, %2914
  %2944 = load volatile %struct.cop** @PL_curcop, align 8
  %2945 = getelementptr inbounds %struct.cop* %2944, i32 0, i32 14
  %2946 = load %struct.sv** %2945, align 8
  %2947 = icmp eq %struct.sv* %2946, null
  br i1 %2947, label %2948, label %2963

; <label>:2948                                    ; preds = %2943
  %2949 = load i8* @PL_dowarn, align 1
  %2950 = zext i8 %2949 to i32
  %2951 = and i32 %2950, 1
  %2952 = icmp ne i32 %2951, 0
  br i1 %2952, label %2953, label %2963

; <label>:2953                                    ; preds = %2948, %2929, %2924
  %2954 = load i32* %n, align 4
  %2955 = icmp sge i32 %2954, 32767
  br i1 %2955, label %2956, label %2963

; <label>:2956                                    ; preds = %2953
  %2957 = load i32* @PL_reg_flags, align 4
  %2958 = and i32 %2957, 2
  %2959 = icmp ne i32 %2958, 0
  br i1 %2959, label %2963, label %2960

; <label>:2960                                    ; preds = %2956
  %2961 = load i32* @PL_reg_flags, align 4
  %2962 = or i32 %2961, 2
  store i32 %2962, i32* @PL_reg_flags, align 4
  call void (i32, i8*, ...)* @Perl_warner(i32 20, i8* getelementptr inbounds ([23 x i8]* @.str6, i32 0, i32 0), i8* getelementptr inbounds ([40 x i8]* @.str7, i32 0, i32 0), i32 32766)
  br label %2963

; <label>:2963                                    ; preds = %2960, %2956, %2953, %2948, %2943
  %2964 = load i32* %cache_offset, align 4
  %2965 = load i32* %cache_bit, align 4
  %2966 = or i32 %2964, %2965
  %2967 = icmp ne i32 %2966, 0
  br i1 %2967, label %2968, label %3003

; <label>:2968                                    ; preds = %2963
  %2969 = load i8** @PL_reg_poscache, align 8
  %2970 = getelementptr inbounds i8* %2969, i64 0
  %2971 = load i8* %2970, align 1
  %2972 = sext i8 %2971 to i32
  %2973 = and i32 %2972, 2
  %2974 = icmp ne i32 %2973, 0
  br i1 %2974, label %2982, label %2975

; <label>:2975                                    ; preds = %2968
  %2976 = load i8** @PL_reg_poscache, align 8
  %2977 = getelementptr inbounds i8* %2976, i64 0
  %2978 = load i8* %2977, align 1
  %2979 = sext i8 %2978 to i32
  %2980 = or i32 %2979, 2
  %2981 = trunc i32 %2980 to i8
  store i8 %2981, i8* %2977, align 1
  br label %3002

; <label>:2982                                    ; preds = %2968
  %2983 = load i8** @PL_reg_poscache, align 8
  %2984 = getelementptr inbounds i8* %2983, i64 0
  %2985 = load i8* %2984, align 1
  %2986 = sext i8 %2985 to i32
  %2987 = and i32 %2986, 1
  %2988 = icmp ne i32 %2987, 0
  br i1 %2988, label %2989, label %3001

; <label>:2989                                    ; preds = %2982
  %2990 = load i32* %cache_bit, align 4
  %2991 = shl i32 1, %2990
  %2992 = xor i32 %2991, -1
  %2993 = load i32* %cache_offset, align 4
  %2994 = sext i32 %2993 to i64
  %2995 = load i8** @PL_reg_poscache, align 8
  %2996 = getelementptr inbounds i8* %2995, i64 %2994
  %2997 = load i8* %2996, align 1
  %2998 = sext i8 %2997 to i32
  %2999 = and i32 %2998, %2992
  %3000 = trunc i32 %2999 to i8
  store i8 %3000, i8* %2996, align 1
  br label %3001

; <label>:3001                                    ; preds = %2989, %2982
  br label %3002

; <label>:3002                                    ; preds = %3001, %2975
  br label %3003

; <label>:3003                                    ; preds = %3002, %2963
  br label %6127

; <label>:3004                                    ; preds = %2907
  %3005 = load i8** %locinput, align 8
  store i8* %3005, i8** @PL_reginput, align 8
  %3006 = load i32* %n, align 4
  %3007 = load %struct.curcur** %cc8, align 8
  %3008 = getelementptr inbounds %struct.curcur* %3007, i32 0, i32 1
  store i32 %3006, i32* %3008, align 4
  %3009 = load i8** %locinput, align 8
  %3010 = load %struct.curcur** %cc8, align 8
  %3011 = getelementptr inbounds %struct.curcur* %3010, i32 0, i32 7
  store i8* %3009, i8** %3011, align 8
  %3012 = load %struct.curcur** %cc8, align 8
  %3013 = getelementptr inbounds %struct.curcur* %3012, i32 0, i32 0
  %3014 = load i32* %3013, align 4
  %3015 = call i32 (i32, ...)* bitcast (i32 (...)* @regcppush to i32 (i32, ...)*)(i32 %3014)
  store i32 %3015, i32* %cp6, align 4
  %3016 = load i32* @PL_savestack_ix, align 4
  store i32 %3016, i32* %lastcp7, align 4
  %3017 = load %struct.curcur** %cc8, align 8
  %3018 = getelementptr inbounds %struct.curcur* %3017, i32 0, i32 5
  %3019 = load %struct.regnode** %3018, align 8
  %3020 = call i32 (%struct.regnode*, ...)* bitcast (i32 (...)* @regmatch to i32 (%struct.regnode*, ...)*)(%struct.regnode* %3019)
  %3021 = icmp ne i32 %3020, 0
  br i1 %3021, label %3022, label %3069

; <label>:3022                                    ; preds = %3004
  %3023 = load i32* @PL_savestack_ix, align 4
  %3024 = load i32* %cp6, align 4
  %3025 = icmp sgt i32 %3023, %3024
  br i1 %3025, label %3026, label %3028

; <label>:3026                                    ; preds = %3022
  %3027 = load i32* %cp6, align 4
  call void @Perl_leave_scope(i32 %3027)
  br label %3028

; <label>:3028                                    ; preds = %3026, %3022
  %3029 = load i32* %cache_offset, align 4
  %3030 = load i32* %cache_bit, align 4
  %3031 = or i32 %3029, %3030
  %3032 = icmp ne i32 %3031, 0
  br i1 %3032, label %3033, label %3068

; <label>:3033                                    ; preds = %3028
  %3034 = load i8** @PL_reg_poscache, align 8
  %3035 = getelementptr inbounds i8* %3034, i64 0
  %3036 = load i8* %3035, align 1
  %3037 = sext i8 %3036 to i32
  %3038 = and i32 %3037, 2
  %3039 = icmp ne i32 %3038, 0
  br i1 %3039, label %3047, label %3040

; <label>:3040                                    ; preds = %3033
  %3041 = load i8** @PL_reg_poscache, align 8
  %3042 = getelementptr inbounds i8* %3041, i64 0
  %3043 = load i8* %3042, align 1
  %3044 = sext i8 %3043 to i32
  %3045 = or i32 %3044, 1
  %3046 = trunc i32 %3045 to i8
  store i8 %3046, i8* %3042, align 1
  br label %3067

; <label>:3047                                    ; preds = %3033
  %3048 = load i8** @PL_reg_poscache, align 8
  %3049 = getelementptr inbounds i8* %3048, i64 0
  %3050 = load i8* %3049, align 1
  %3051 = sext i8 %3050 to i32
  %3052 = and i32 %3051, 1
  %3053 = icmp ne i32 %3052, 0
  br i1 %3053, label %3066, label %3054

; <label>:3054                                    ; preds = %3047
  %3055 = load i32* %cache_bit, align 4
  %3056 = shl i32 1, %3055
  %3057 = xor i32 %3056, -1
  %3058 = load i32* %cache_offset, align 4
  %3059 = sext i32 %3058 to i64
  %3060 = load i8** @PL_reg_poscache, align 8
  %3061 = getelementptr inbounds i8* %3060, i64 %3059
  %3062 = load i8* %3061, align 1
  %3063 = sext i8 %3062 to i32
  %3064 = and i32 %3063, %3057
  %3065 = trunc i32 %3064 to i8
  store i8 %3065, i8* %3061, align 1
  br label %3066

; <label>:3066                                    ; preds = %3054, %3047
  br label %3067

; <label>:3067                                    ; preds = %3066, %3040
  br label %3068

; <label>:3068                                    ; preds = %3067, %3028
  br label %6126

; <label>:3069                                    ; preds = %3004
  %3070 = load i32* @PL_savestack_ix, align 4
  %3071 = load i32* %lastcp7, align 4
  %3072 = icmp sgt i32 %3070, %3071
  br i1 %3072, label %3073, label %3075

; <label>:3073                                    ; preds = %3069
  %3074 = load i32* %lastcp7, align 4
  call void @Perl_leave_scope(i32 %3074)
  br label %3075

; <label>:3075                                    ; preds = %3073, %3069
  %3076 = call i32 (...)* @regcppop()
  %3077 = load i32* %n, align 4
  %3078 = sub nsw i32 %3077, 1
  %3079 = load %struct.curcur** %cc8, align 8
  %3080 = getelementptr inbounds %struct.curcur* %3079, i32 0, i32 1
  store i32 %3078, i32* %3080, align 4
  %3081 = load i8** %lastloc, align 8
  %3082 = load %struct.curcur** %cc8, align 8
  %3083 = getelementptr inbounds %struct.curcur* %3082, i32 0, i32 7
  store i8* %3081, i8** %3083, align 8
  %3084 = load i32* %cache_offset, align 4
  %3085 = load i32* %cache_bit, align 4
  %3086 = or i32 %3084, %3085
  %3087 = icmp ne i32 %3086, 0
  br i1 %3087, label %3088, label %3123

; <label>:3088                                    ; preds = %3075
  %3089 = load i8** @PL_reg_poscache, align 8
  %3090 = getelementptr inbounds i8* %3089, i64 0
  %3091 = load i8* %3090, align 1
  %3092 = sext i8 %3091 to i32
  %3093 = and i32 %3092, 2
  %3094 = icmp ne i32 %3093, 0
  br i1 %3094, label %3102, label %3095

; <label>:3095                                    ; preds = %3088
  %3096 = load i8** @PL_reg_poscache, align 8
  %3097 = getelementptr inbounds i8* %3096, i64 0
  %3098 = load i8* %3097, align 1
  %3099 = sext i8 %3098 to i32
  %3100 = or i32 %3099, 2
  %3101 = trunc i32 %3100 to i8
  store i8 %3101, i8* %3097, align 1
  br label %3122

; <label>:3102                                    ; preds = %3088
  %3103 = load i8** @PL_reg_poscache, align 8
  %3104 = getelementptr inbounds i8* %3103, i64 0
  %3105 = load i8* %3104, align 1
  %3106 = sext i8 %3105 to i32
  %3107 = and i32 %3106, 1
  %3108 = icmp ne i32 %3107, 0
  br i1 %3108, label %3109, label %3121

; <label>:3109                                    ; preds = %3102
  %3110 = load i32* %cache_bit, align 4
  %3111 = shl i32 1, %3110
  %3112 = xor i32 %3111, -1
  %3113 = load i32* %cache_offset, align 4
  %3114 = sext i32 %3113 to i64
  %3115 = load i8** @PL_reg_poscache, align 8
  %3116 = getelementptr inbounds i8* %3115, i64 %3114
  %3117 = load i8* %3116, align 1
  %3118 = sext i8 %3117 to i32
  %3119 = and i32 %3118, %3112
  %3120 = trunc i32 %3119 to i8
  store i8 %3120, i8* %3116, align 1
  br label %3121

; <label>:3121                                    ; preds = %3109, %3102
  br label %3122

; <label>:3122                                    ; preds = %3121, %3095
  br label %3123

; <label>:3123                                    ; preds = %3122, %3075
  br label %6127

; <label>:3124                                    ; preds = %2820
  %3125 = load i32* %n, align 4
  %3126 = load %struct.curcur** %cc8, align 8
  %3127 = getelementptr inbounds %struct.curcur* %3126, i32 0, i32 3
  %3128 = load i32* %3127, align 4
  %3129 = icmp slt i32 %3125, %3128
  br i1 %3129, label %3130, label %3203

; <label>:3130                                    ; preds = %3124
  %3131 = load %struct.curcur** %cc8, align 8
  %3132 = getelementptr inbounds %struct.curcur* %3131, i32 0, i32 0
  %3133 = load i32* %3132, align 4
  %3134 = call i32 (i32, ...)* bitcast (i32 (...)* @regcppush to i32 (i32, ...)*)(i32 %3133)
  store i32 %3134, i32* %cp6, align 4
  %3135 = load i32* %n, align 4
  %3136 = load %struct.curcur** %cc8, align 8
  %3137 = getelementptr inbounds %struct.curcur* %3136, i32 0, i32 1
  store i32 %3135, i32* %3137, align 4
  %3138 = load i8** %locinput, align 8
  %3139 = load %struct.curcur** %cc8, align 8
  %3140 = getelementptr inbounds %struct.curcur* %3139, i32 0, i32 7
  store i8* %3138, i8** %3140, align 8
  %3141 = load i32* @PL_savestack_ix, align 4
  store i32 %3141, i32* %lastcp7, align 4
  %3142 = load %struct.curcur** %cc8, align 8
  %3143 = getelementptr inbounds %struct.curcur* %3142, i32 0, i32 5
  %3144 = load %struct.regnode** %3143, align 8
  %3145 = call i32 (%struct.regnode*, ...)* bitcast (i32 (...)* @regmatch to i32 (%struct.regnode*, ...)*)(%struct.regnode* %3144)
  %3146 = icmp ne i32 %3145, 0
  br i1 %3146, label %3147, label %3194

; <label>:3147                                    ; preds = %3130
  %3148 = load i32* @PL_savestack_ix, align 4
  %3149 = load i32* %cp6, align 4
  %3150 = icmp sgt i32 %3148, %3149
  br i1 %3150, label %3151, label %3153

; <label>:3151                                    ; preds = %3147
  %3152 = load i32* %cp6, align 4
  call void @Perl_leave_scope(i32 %3152)
  br label %3153

; <label>:3153                                    ; preds = %3151, %3147
  %3154 = load i32* %cache_offset, align 4
  %3155 = load i32* %cache_bit, align 4
  %3156 = or i32 %3154, %3155
  %3157 = icmp ne i32 %3156, 0
  br i1 %3157, label %3158, label %3193

; <label>:3158                                    ; preds = %3153
  %3159 = load i8** @PL_reg_poscache, align 8
  %3160 = getelementptr inbounds i8* %3159, i64 0
  %3161 = load i8* %3160, align 1
  %3162 = sext i8 %3161 to i32
  %3163 = and i32 %3162, 2
  %3164 = icmp ne i32 %3163, 0
  br i1 %3164, label %3172, label %3165

; <label>:3165                                    ; preds = %3158
  %3166 = load i8** @PL_reg_poscache, align 8
  %3167 = getelementptr inbounds i8* %3166, i64 0
  %3168 = load i8* %3167, align 1
  %3169 = sext i8 %3168 to i32
  %3170 = or i32 %3169, 1
  %3171 = trunc i32 %3170 to i8
  store i8 %3171, i8* %3167, align 1
  br label %3192

; <label>:3172                                    ; preds = %3158
  %3173 = load i8** @PL_reg_poscache, align 8
  %3174 = getelementptr inbounds i8* %3173, i64 0
  %3175 = load i8* %3174, align 1
  %3176 = sext i8 %3175 to i32
  %3177 = and i32 %3176, 1
  %3178 = icmp ne i32 %3177, 0
  br i1 %3178, label %3191, label %3179

; <label>:3179                                    ; preds = %3172
  %3180 = load i32* %cache_bit, align 4
  %3181 = shl i32 1, %3180
  %3182 = xor i32 %3181, -1
  %3183 = load i32* %cache_offset, align 4
  %3184 = sext i32 %3183 to i64
  %3185 = load i8** @PL_reg_poscache, align 8
  %3186 = getelementptr inbounds i8* %3185, i64 %3184
  %3187 = load i8* %3186, align 1
  %3188 = sext i8 %3187 to i32
  %3189 = and i32 %3188, %3182
  %3190 = trunc i32 %3189 to i8
  store i8 %3190, i8* %3186, align 1
  br label %3191

; <label>:3191                                    ; preds = %3179, %3172
  br label %3192

; <label>:3192                                    ; preds = %3191, %3165
  br label %3193

; <label>:3193                                    ; preds = %3192, %3153
  br label %6126

; <label>:3194                                    ; preds = %3130
  %3195 = load i32* @PL_savestack_ix, align 4
  %3196 = load i32* %lastcp7, align 4
  %3197 = icmp sgt i32 %3195, %3196
  br i1 %3197, label %3198, label %3200

; <label>:3198                                    ; preds = %3194
  %3199 = load i32* %lastcp7, align 4
  call void @Perl_leave_scope(i32 %3199)
  br label %3200

; <label>:3200                                    ; preds = %3198, %3194
  %3201 = call i32 (...)* @regcppop()
  %3202 = load i8** %locinput, align 8
  store i8* %3202, i8** @PL_reginput, align 8
  br label %3203

; <label>:3203                                    ; preds = %3200, %3124
  %3204 = load volatile %struct.cop** @PL_curcop, align 8
  %3205 = getelementptr inbounds %struct.cop* %3204, i32 0, i32 14
  %3206 = load %struct.sv** %3205, align 8
  %3207 = icmp ne %struct.sv* %3206, null
  br i1 %3207, label %3208, label %3232

; <label>:3208                                    ; preds = %3203
  %3209 = load volatile %struct.cop** @PL_curcop, align 8
  %3210 = getelementptr inbounds %struct.cop* %3209, i32 0, i32 14
  %3211 = load %struct.sv** %3210, align 8
  %3212 = icmp ne %struct.sv* %3211, getelementptr inbounds (%struct.sv* null, i64 2)
  br i1 %3212, label %3213, label %3232

; <label>:3213                                    ; preds = %3208
  %3214 = load volatile %struct.cop** @PL_curcop, align 8
  %3215 = getelementptr inbounds %struct.cop* %3214, i32 0, i32 14
  %3216 = load %struct.sv** %3215, align 8
  %3217 = icmp eq %struct.sv* %3216, getelementptr inbounds (%struct.sv* null, i64 1)
  br i1 %3217, label %3242, label %3218

; <label>:3218                                    ; preds = %3213
  %3219 = load volatile %struct.cop** @PL_curcop, align 8
  %3220 = getelementptr inbounds %struct.cop* %3219, i32 0, i32 14
  %3221 = load %struct.sv** %3220, align 8
  %3222 = getelementptr inbounds %struct.sv* %3221, i32 0, i32 0
  %3223 = load i8** %3222, align 8
  %3224 = bitcast i8* %3223 to %struct.xpv*
  %3225 = getelementptr inbounds %struct.xpv* %3224, i32 0, i32 0
  %3226 = load i8** %3225, align 8
  %3227 = getelementptr inbounds i8* %3226, i64 5
  %3228 = load i8* %3227, align 1
  %3229 = sext i8 %3228 to i32
  %3230 = and i32 %3229, 1
  %3231 = icmp ne i32 %3230, 0
  br i1 %3231, label %3242, label %3232

; <label>:3232                                    ; preds = %3218, %3208, %3203
  %3233 = load volatile %struct.cop** @PL_curcop, align 8
  %3234 = getelementptr inbounds %struct.cop* %3233, i32 0, i32 14
  %3235 = load %struct.sv** %3234, align 8
  %3236 = icmp eq %struct.sv* %3235, null
  br i1 %3236, label %3237, label %3252

; <label>:3237                                    ; preds = %3232
  %3238 = load i8* @PL_dowarn, align 1
  %3239 = zext i8 %3238 to i32
  %3240 = and i32 %3239, 1
  %3241 = icmp ne i32 %3240, 0
  br i1 %3241, label %3242, label %3252

; <label>:3242                                    ; preds = %3237, %3218, %3213
  %3243 = load i32* %n, align 4
  %3244 = icmp sge i32 %3243, 32767
  br i1 %3244, label %3245, label %3252

; <label>:3245                                    ; preds = %3242
  %3246 = load i32* @PL_reg_flags, align 4
  %3247 = and i32 %3246, 2
  %3248 = icmp ne i32 %3247, 0
  br i1 %3248, label %3252, label %3249

; <label>:3249                                    ; preds = %3245
  %3250 = load i32* @PL_reg_flags, align 4
  %3251 = or i32 %3250, 2
  store i32 %3251, i32* @PL_reg_flags, align 4
  call void (i32, i8*, ...)* @Perl_warner(i32 20, i8* getelementptr inbounds ([23 x i8]* @.str6, i32 0, i32 0), i8* getelementptr inbounds ([40 x i8]* @.str7, i32 0, i32 0), i32 32766)
  br label %3252

; <label>:3252                                    ; preds = %3249, %3245, %3242, %3237, %3232
  %3253 = load %struct.curcur** %cc8, align 8
  %3254 = getelementptr inbounds %struct.curcur* %3253, i32 0, i32 8
  %3255 = load %struct.curcur** %3254, align 8
  store %struct.curcur* %3255, %struct.curcur** @PL_regcc, align 8
  %3256 = load %struct.curcur** @PL_regcc, align 8
  %3257 = icmp ne %struct.curcur* %3256, null
  br i1 %3257, label %3258, label %3262

; <label>:3258                                    ; preds = %3252
  %3259 = load %struct.curcur** @PL_regcc, align 8
  %3260 = getelementptr inbounds %struct.curcur* %3259, i32 0, i32 1
  %3261 = load i32* %3260, align 4
  store i32 %3261, i32* %ln, align 4
  br label %3262

; <label>:3262                                    ; preds = %3258, %3252
  %3263 = load %struct.curcur** %cc8, align 8
  %3264 = getelementptr inbounds %struct.curcur* %3263, i32 0, i32 6
  %3265 = load %struct.regnode** %3264, align 8
  %3266 = call i32 (%struct.regnode*, ...)* bitcast (i32 (...)* @regmatch to i32 (%struct.regnode*, ...)*)(%struct.regnode* %3265)
  %3267 = icmp ne i32 %3266, 0
  br i1 %3267, label %3268, label %3309

; <label>:3268                                    ; preds = %3262
  %3269 = load i32* %cache_offset, align 4
  %3270 = load i32* %cache_bit, align 4
  %3271 = or i32 %3269, %3270
  %3272 = icmp ne i32 %3271, 0
  br i1 %3272, label %3273, label %3308

; <label>:3273                                    ; preds = %3268
  %3274 = load i8** @PL_reg_poscache, align 8
  %3275 = getelementptr inbounds i8* %3274, i64 0
  %3276 = load i8* %3275, align 1
  %3277 = sext i8 %3276 to i32
  %3278 = and i32 %3277, 2
  %3279 = icmp ne i32 %3278, 0
  br i1 %3279, label %3287, label %3280

; <label>:3280                                    ; preds = %3273
  %3281 = load i8** @PL_reg_poscache, align 8
  %3282 = getelementptr inbounds i8* %3281, i64 0
  %3283 = load i8* %3282, align 1
  %3284 = sext i8 %3283 to i32
  %3285 = or i32 %3284, 1
  %3286 = trunc i32 %3285 to i8
  store i8 %3286, i8* %3282, align 1
  br label %3307

; <label>:3287                                    ; preds = %3273
  %3288 = load i8** @PL_reg_poscache, align 8
  %3289 = getelementptr inbounds i8* %3288, i64 0
  %3290 = load i8* %3289, align 1
  %3291 = sext i8 %3290 to i32
  %3292 = and i32 %3291, 1
  %3293 = icmp ne i32 %3292, 0
  br i1 %3293, label %3306, label %3294

; <label>:3294                                    ; preds = %3287
  %3295 = load i32* %cache_bit, align 4
  %3296 = shl i32 1, %3295
  %3297 = xor i32 %3296, -1
  %3298 = load i32* %cache_offset, align 4
  %3299 = sext i32 %3298 to i64
  %3300 = load i8** @PL_reg_poscache, align 8
  %3301 = getelementptr inbounds i8* %3300, i64 %3299
  %3302 = load i8* %3301, align 1
  %3303 = sext i8 %3302 to i32
  %3304 = and i32 %3303, %3297
  %3305 = trunc i32 %3304 to i8
  store i8 %3305, i8* %3301, align 1
  br label %3306

; <label>:3306                                    ; preds = %3294, %3287
  br label %3307

; <label>:3307                                    ; preds = %3306, %3280
  br label %3308

; <label>:3308                                    ; preds = %3307, %3268
  br label %6126

; <label>:3309                                    ; preds = %3262
  %3310 = load %struct.curcur** @PL_regcc, align 8
  %3311 = icmp ne %struct.curcur* %3310, null
  br i1 %3311, label %3312, label %3316

; <label>:3312                                    ; preds = %3309
  %3313 = load i32* %ln, align 4
  %3314 = load %struct.curcur** @PL_regcc, align 8
  %3315 = getelementptr inbounds %struct.curcur* %3314, i32 0, i32 1
  store i32 %3313, i32* %3315, align 4
  br label %3316

; <label>:3316                                    ; preds = %3312, %3309
  %3317 = load %struct.curcur** %cc8, align 8
  store %struct.curcur* %3317, %struct.curcur** @PL_regcc, align 8
  %3318 = load i32* %n, align 4
  %3319 = sub nsw i32 %3318, 1
  %3320 = load %struct.curcur** %cc8, align 8
  %3321 = getelementptr inbounds %struct.curcur* %3320, i32 0, i32 1
  store i32 %3319, i32* %3321, align 4
  %3322 = load i8** %lastloc, align 8
  %3323 = load %struct.curcur** %cc8, align 8
  %3324 = getelementptr inbounds %struct.curcur* %3323, i32 0, i32 7
  store i8* %3322, i8** %3324, align 8
  %3325 = load i32* %cache_offset, align 4
  %3326 = load i32* %cache_bit, align 4
  %3327 = or i32 %3325, %3326
  %3328 = icmp ne i32 %3327, 0
  br i1 %3328, label %3329, label %3364

; <label>:3329                                    ; preds = %3316
  %3330 = load i8** @PL_reg_poscache, align 8
  %3331 = getelementptr inbounds i8* %3330, i64 0
  %3332 = load i8* %3331, align 1
  %3333 = sext i8 %3332 to i32
  %3334 = and i32 %3333, 2
  %3335 = icmp ne i32 %3334, 0
  br i1 %3335, label %3343, label %3336

; <label>:3336                                    ; preds = %3329
  %3337 = load i8** @PL_reg_poscache, align 8
  %3338 = getelementptr inbounds i8* %3337, i64 0
  %3339 = load i8* %3338, align 1
  %3340 = sext i8 %3339 to i32
  %3341 = or i32 %3340, 2
  %3342 = trunc i32 %3341 to i8
  store i8 %3342, i8* %3338, align 1
  br label %3363

; <label>:3343                                    ; preds = %3329
  %3344 = load i8** @PL_reg_poscache, align 8
  %3345 = getelementptr inbounds i8* %3344, i64 0
  %3346 = load i8* %3345, align 1
  %3347 = sext i8 %3346 to i32
  %3348 = and i32 %3347, 1
  %3349 = icmp ne i32 %3348, 0
  br i1 %3349, label %3350, label %3362

; <label>:3350                                    ; preds = %3343
  %3351 = load i32* %cache_bit, align 4
  %3352 = shl i32 1, %3351
  %3353 = xor i32 %3352, -1
  %3354 = load i32* %cache_offset, align 4
  %3355 = sext i32 %3354 to i64
  %3356 = load i8** @PL_reg_poscache, align 8
  %3357 = getelementptr inbounds i8* %3356, i64 %3355
  %3358 = load i8* %3357, align 1
  %3359 = sext i8 %3358 to i32
  %3360 = and i32 %3359, %3353
  %3361 = trunc i32 %3360 to i8
  store i8 %3361, i8* %3357, align 1
  br label %3362

; <label>:3362                                    ; preds = %3350, %3343
  br label %3363

; <label>:3363                                    ; preds = %3362, %3336
  br label %3364

; <label>:3364                                    ; preds = %3363, %3316
  br label %6127

; <label>:3365                                    ; preds = %24
  %3366 = load %struct.regnode** %scan, align 8
  %3367 = load %struct.regnode** %scan, align 8
  %3368 = bitcast %struct.regnode* %3367 to %struct.regnode_1*
  %3369 = getelementptr inbounds %struct.regnode_1* %3368, i32 0, i32 3
  %3370 = load i32* %3369, align 4
  %3371 = zext i32 %3370 to i64
  %3372 = getelementptr inbounds %struct.regnode* %3366, i64 %3371
  store %struct.regnode* %3372, %struct.regnode** %next, align 8
  %3373 = load %struct.regnode** %next, align 8
  %3374 = load %struct.regnode** %scan, align 8
  %3375 = icmp eq %struct.regnode* %3373, %3374
  br i1 %3375, label %3376, label %3377

; <label>:3376                                    ; preds = %3365
  store %struct.regnode* null, %struct.regnode** %next, align 8
  br label %3377

; <label>:3377                                    ; preds = %3376, %3365
  %3378 = load %struct.regnode** %scan, align 8
  %3379 = getelementptr inbounds %struct.regnode* %3378, i64 1
  %3380 = getelementptr inbounds %struct.regnode* %3379, i64 1
  store %struct.regnode* %3380, %struct.regnode** %inner, align 8
  br label %3384

; <label>:3381                                    ; preds = %24
  %3382 = load %struct.regnode** %scan, align 8
  %3383 = getelementptr inbounds %struct.regnode* %3382, i64 1
  store %struct.regnode* %3383, %struct.regnode** %inner, align 8
  br label %3384

; <label>:3384                                    ; preds = %3381, %3377
  %3385 = load %struct.regnode** %scan, align 8
  %3386 = getelementptr inbounds %struct.regnode* %3385, i32 0, i32 1
  %3387 = load i8* %3386, align 1
  %3388 = zext i8 %3387 to i32
  store i32 %3388, i32* %c1, align 4
  %3389 = load %struct.regnode** %next, align 8
  %3390 = getelementptr inbounds %struct.regnode* %3389, i32 0, i32 1
  %3391 = load i8* %3390, align 1
  %3392 = zext i8 %3391 to i32
  %3393 = load i32* %c1, align 4
  %3394 = icmp ne i32 %3392, %3393
  br i1 %3394, label %3395, label %3397

; <label>:3395                                    ; preds = %3384
  %3396 = load %struct.regnode** %inner, align 8
  store %struct.regnode* %3396, %struct.regnode** %next, align 8
  br label %3432

; <label>:3397                                    ; preds = %3384
  %3398 = load i32** @PL_reglastparen, align 8
  %3399 = load i32* %3398, align 4
  store i32 %3399, i32* %lastparen, align 4
  %3400 = call i32 @Perl_save_alloc(i32 40, i32 0)
  store i32 %3400, i32* %unwind1, align 4
  %3401 = load %union.any** @PL_savestack, align 8
  %3402 = bitcast %union.any* %3401 to i8*
  %3403 = load i32* %unwind1, align 4
  %3404 = sext i32 %3403 to i64
  %3405 = getelementptr inbounds i8* %3402, i64 %3404
  %3406 = bitcast i8* %3405 to %struct.re_unwind_branch_t*
  store %struct.re_unwind_branch_t* %3406, %struct.re_unwind_branch_t** %uw, align 8
  %3407 = load i32* %unwind, align 4
  %3408 = load %struct.re_unwind_branch_t** %uw, align 8
  %3409 = getelementptr inbounds %struct.re_unwind_branch_t* %3408, i32 0, i32 1
  store i32 %3407, i32* %3409, align 4
  %3410 = load i32* %unwind1, align 4
  store i32 %3410, i32* %unwind, align 4
  %3411 = load i32* %c1, align 4
  %3412 = icmp eq i32 %3411, 31
  %3413 = select i1 %3412, i32 1, i32 2
  %3414 = load %struct.re_unwind_branch_t** %uw, align 8
  %3415 = getelementptr inbounds %struct.re_unwind_branch_t* %3414, i32 0, i32 0
  store i32 %3413, i32* %3415, align 4
  %3416 = load i32* %lastparen, align 4
  %3417 = load %struct.re_unwind_branch_t** %uw, align 8
  %3418 = getelementptr inbounds %struct.re_unwind_branch_t* %3417, i32 0, i32 3
  store i32 %3416, i32* %3418, align 4
  %3419 = load %struct.regnode** %next, align 8
  %3420 = load %struct.re_unwind_branch_t** %uw, align 8
  %3421 = getelementptr inbounds %struct.re_unwind_branch_t* %3420, i32 0, i32 4
  store %struct.regnode* %3419, %struct.regnode** %3421, align 8
  %3422 = load i8** %locinput, align 8
  %3423 = load %struct.re_unwind_branch_t** %uw, align 8
  %3424 = getelementptr inbounds %struct.re_unwind_branch_t* %3423, i32 0, i32 5
  store i8* %3422, i8** %3424, align 8
  %3425 = load i32* %nextchr, align 4
  %3426 = load %struct.re_unwind_branch_t** %uw, align 8
  %3427 = getelementptr inbounds %struct.re_unwind_branch_t* %3426, i32 0, i32 6
  store i32 %3425, i32* %3427, align 4
  %3428 = load i32* @PL_savestack_ix, align 4
  %3429 = load %struct.re_unwind_branch_t** %uw, align 8
  %3430 = getelementptr inbounds %struct.re_unwind_branch_t* %3429, i32 0, i32 2
  store i32 %3428, i32* %3430, align 4
  %3431 = load %struct.regnode** %inner, align 8
  store %struct.regnode* %3431, %struct.regnode** %next, align 8
  br label %3432

; <label>:3432                                    ; preds = %3397, %3395
  br label %6120

; <label>:3433                                    ; preds = %24
  store i32 1, i32* %minmod, align 4
  br label %6120

; <label>:3434                                    ; preds = %24
  store i32 0, i32* %l9, align 4
  %3435 = load %struct.regnode** %scan, align 8
  %3436 = bitcast %struct.regnode* %3435 to %struct.regnode_2*
  %3437 = getelementptr inbounds %struct.regnode_2* %3436, i32 0, i32 3
  %3438 = load i16* %3437, align 2
  %3439 = zext i16 %3438 to i32
  store i32 %3439, i32* %ln, align 4
  %3440 = load %struct.regnode** %scan, align 8
  %3441 = bitcast %struct.regnode* %3440 to %struct.regnode_2*
  %3442 = getelementptr inbounds %struct.regnode_2* %3441, i32 0, i32 4
  %3443 = load i16* %3442, align 2
  %3444 = zext i16 %3443 to i32
  store i32 %3444, i32* %n, align 4
  %3445 = load %struct.regnode** %scan, align 8
  %3446 = getelementptr inbounds %struct.regnode* %3445, i32 0, i32 0
  %3447 = load i8* %3446, align 1
  %3448 = zext i8 %3447 to i32
  store i32 %3448, i32* %paren, align 4
  %3449 = load i32* %paren, align 4
  %3450 = icmp ne i32 %3449, 0
  br i1 %3450, label %3451, label %3466

; <label>:3451                                    ; preds = %3434
  %3452 = load i32* %paren, align 4
  %3453 = load i32* @PL_regsize, align 4
  %3454 = icmp sgt i32 %3452, %3453
  br i1 %3454, label %3455, label %3457

; <label>:3455                                    ; preds = %3451
  %3456 = load i32* %paren, align 4
  store i32 %3456, i32* @PL_regsize, align 4
  br label %3457

; <label>:3457                                    ; preds = %3455, %3451
  %3458 = load i32* %paren, align 4
  %3459 = load i32** @PL_reglastparen, align 8
  %3460 = load i32* %3459, align 4
  %3461 = icmp sgt i32 %3458, %3460
  br i1 %3461, label %3462, label %3465

; <label>:3462                                    ; preds = %3457
  %3463 = load i32* %paren, align 4
  %3464 = load i32** @PL_reglastparen, align 8
  store i32 %3463, i32* %3464, align 4
  br label %3465

; <label>:3465                                    ; preds = %3462, %3457
  br label %3466

; <label>:3466                                    ; preds = %3465, %3434
  %3467 = load %struct.regnode** %scan, align 8
  %3468 = getelementptr inbounds %struct.regnode* %3467, i64 1
  %3469 = getelementptr inbounds %struct.regnode* %3468, i64 1
  store %struct.regnode* %3469, %struct.regnode** %scan, align 8
  %3470 = load i32* %paren, align 4
  %3471 = icmp ne i32 %3470, 0
  br i1 %3471, label %3472, label %3480

; <label>:3472                                    ; preds = %3466
  %3473 = load %struct.regnode** %scan, align 8
  %3474 = getelementptr inbounds %struct.regnode* %3473, i32 0, i32 2
  %3475 = load i16* %3474, align 2
  %3476 = zext i16 %3475 to i32
  %3477 = load %struct.regnode** %scan, align 8
  %3478 = sext i32 %3476 to i64
  %3479 = getelementptr inbounds %struct.regnode* %3477, i64 %3478
  store %struct.regnode* %3479, %struct.regnode** %scan, align 8
  br label %3480

; <label>:3480                                    ; preds = %3472, %3466
  %3481 = load i8** %locinput, align 8
  store i8* %3481, i8** @PL_reginput, align 8
  %3482 = load i32* %minmod, align 4
  %3483 = icmp ne i32 %3482, 0
  br i1 %3483, label %3484, label %3903

; <label>:3484                                    ; preds = %3480
  store i32 0, i32* %minmod, align 4
  %3485 = load i32* %ln, align 4
  %3486 = icmp ne i32 %3485, 0
  br i1 %3486, label %3487, label %3494

; <label>:3487                                    ; preds = %3484
  %3488 = load %struct.regnode** %scan, align 8
  %3489 = load i32* %ln, align 4
  %3490 = call i32 (%struct.regnode*, i32, i32*, ...)* bitcast (i32 (...)* @regrepeat_hard to i32 (%struct.regnode*, i32, i32*, ...)*)(%struct.regnode* %3488, i32 %3489, i32* %l9)
  %3491 = load i32* %ln, align 4
  %3492 = icmp slt i32 %3490, %3491
  br i1 %3492, label %3493, label %3494

; <label>:3493                                    ; preds = %3487
  br label %6127

; <label>:3494                                    ; preds = %3487, %3484
  %3495 = load i8** @PL_reginput, align 8
  store i8* %3495, i8** %locinput, align 8
  %3496 = load %struct.regnode** %next, align 8
  %3497 = getelementptr inbounds %struct.regnode* %3496, i32 0, i32 1
  %3498 = load i8* %3497, align 1
  %3499 = zext i8 %3498 to i64
  %3500 = getelementptr inbounds [0 x i8]* @PL_regkind, i32 0, i64 %3499
  %3501 = load i8* %3500, align 1
  %3502 = zext i8 %3501 to i32
  %3503 = icmp eq i32 %3502, 33
  br i1 %3503, label %3571, label %3504

; <label>:3504                                    ; preds = %3494
  %3505 = load %struct.regnode** %next, align 8
  %3506 = getelementptr inbounds %struct.regnode* %3505, i32 0, i32 1
  %3507 = load i8* %3506, align 1
  %3508 = zext i8 %3507 to i64
  %3509 = getelementptr inbounds [0 x i8]* @PL_regkind, i32 0, i64 %3508
  %3510 = load i8* %3509, align 1
  %3511 = zext i8 %3510 to i32
  %3512 = icmp eq i32 %3511, 47
  br i1 %3512, label %3571, label %3513

; <label>:3513                                    ; preds = %3504
  %3514 = load %struct.regnode** %next, align 8
  %3515 = getelementptr inbounds %struct.regnode* %3514, i32 0, i32 1
  %3516 = load i8* %3515, align 1
  %3517 = zext i8 %3516 to i32
  %3518 = icmp eq i32 %3517, 45
  br i1 %3518, label %3571, label %3519

; <label>:3519                                    ; preds = %3513
  %3520 = load %struct.regnode** %next, align 8
  %3521 = getelementptr inbounds %struct.regnode* %3520, i32 0, i32 1
  %3522 = load i8* %3521, align 1
  %3523 = zext i8 %3522 to i32
  %3524 = icmp eq i32 %3523, 46
  br i1 %3524, label %3571, label %3525

; <label>:3525                                    ; preds = %3519
  %3526 = load %struct.regnode** %next, align 8
  %3527 = getelementptr inbounds %struct.regnode* %3526, i32 0, i32 1
  %3528 = load i8* %3527, align 1
  %3529 = zext i8 %3528 to i32
  %3530 = icmp eq i32 %3529, 57
  br i1 %3530, label %3571, label %3531

; <label>:3531                                    ; preds = %3525
  %3532 = load %struct.regnode** %next, align 8
  %3533 = getelementptr inbounds %struct.regnode* %3532, i32 0, i32 1
  %3534 = load i8* %3533, align 1
  %3535 = zext i8 %3534 to i32
  %3536 = icmp eq i32 %3535, 52
  br i1 %3536, label %3571, label %3537

; <label>:3537                                    ; preds = %3531
  %3538 = load %struct.regnode** %next, align 8
  %3539 = getelementptr inbounds %struct.regnode* %3538, i32 0, i32 1
  %3540 = load i8* %3539, align 1
  %3541 = zext i8 %3540 to i32
  %3542 = icmp eq i32 %3541, 50
  br i1 %3542, label %3571, label %3543

; <label>:3543                                    ; preds = %3537
  %3544 = load %struct.regnode** %next, align 8
  %3545 = getelementptr inbounds %struct.regnode* %3544, i32 0, i32 1
  %3546 = load i8* %3545, align 1
  %3547 = zext i8 %3546 to i32
  %3548 = icmp eq i32 %3547, 39
  br i1 %3548, label %3571, label %3549

; <label>:3549                                    ; preds = %3543
  %3550 = load %struct.regnode** %next, align 8
  %3551 = getelementptr inbounds %struct.regnode* %3550, i32 0, i32 1
  %3552 = load i8* %3551, align 1
  %3553 = zext i8 %3552 to i32
  %3554 = icmp eq i32 %3553, 58
  br i1 %3554, label %3571, label %3555

; <label>:3555                                    ; preds = %3549
  %3556 = load %struct.regnode** %next, align 8
  %3557 = getelementptr inbounds %struct.regnode* %3556, i32 0, i32 1
  %3558 = load i8* %3557, align 1
  %3559 = zext i8 %3558 to i64
  %3560 = getelementptr inbounds [0 x i8]* @PL_regkind, i32 0, i64 %3559
  %3561 = load i8* %3560, align 1
  %3562 = zext i8 %3561 to i32
  %3563 = icmp eq i32 %3562, 40
  br i1 %3563, label %3564, label %3796

; <label>:3564                                    ; preds = %3555
  %3565 = load %struct.regnode** %next, align 8
  %3566 = bitcast %struct.regnode* %3565 to %struct.regnode_2*
  %3567 = getelementptr inbounds %struct.regnode_2* %3566, i32 0, i32 3
  %3568 = load i16* %3567, align 2
  %3569 = zext i16 %3568 to i32
  %3570 = icmp sgt i32 %3569, 0
  br i1 %3570, label %3571, label %3796

; <label>:3571                                    ; preds = %3564, %3549, %3543, %3537, %3531, %3525, %3519, %3513, %3504, %3494
  %3572 = load %struct.regnode** %next, align 8
  store %struct.regnode* %3572, %struct.regnode** %text_node, align 8
  %3573 = load %struct.regnode** %text_node, align 8
  %3574 = getelementptr inbounds %struct.regnode* %3573, i32 0, i32 1
  %3575 = load i8* %3574, align 1
  %3576 = zext i8 %3575 to i64
  %3577 = getelementptr inbounds [0 x i8]* @PL_regkind, i32 0, i64 %3576
  %3578 = load i8* %3577, align 1
  %3579 = zext i8 %3578 to i32
  %3580 = icmp eq i32 %3579, 33
  br i1 %3580, label %3719, label %3581

; <label>:3581                                    ; preds = %3571
  %3582 = load %struct.regnode** %text_node, align 8
  %3583 = getelementptr inbounds %struct.regnode* %3582, i32 0, i32 1
  %3584 = load i8* %3583, align 1
  %3585 = zext i8 %3584 to i64
  %3586 = getelementptr inbounds [0 x i8]* @PL_regkind, i32 0, i64 %3585
  %3587 = load i8* %3586, align 1
  %3588 = zext i8 %3587 to i32
  %3589 = icmp eq i32 %3588, 47
  br i1 %3589, label %3719, label %3590

; <label>:3590                                    ; preds = %3581
  br label %3591

; <label>:3591                                    ; preds = %3717, %3590
  %3592 = load %struct.regnode** %text_node, align 8
  %3593 = getelementptr inbounds %struct.regnode* %3592, i32 0, i32 1
  %3594 = load i8* %3593, align 1
  %3595 = zext i8 %3594 to i32
  %3596 = icmp eq i32 %3595, 45
  br i1 %3596, label %3651, label %3597

; <label>:3597                                    ; preds = %3591
  %3598 = load %struct.regnode** %text_node, align 8
  %3599 = getelementptr inbounds %struct.regnode* %3598, i32 0, i32 1
  %3600 = load i8* %3599, align 1
  %3601 = zext i8 %3600 to i32
  %3602 = icmp eq i32 %3601, 46
  br i1 %3602, label %3651, label %3603

; <label>:3603                                    ; preds = %3597
  %3604 = load %struct.regnode** %text_node, align 8
  %3605 = getelementptr inbounds %struct.regnode* %3604, i32 0, i32 1
  %3606 = load i8* %3605, align 1
  %3607 = zext i8 %3606 to i32
  %3608 = icmp eq i32 %3607, 57
  br i1 %3608, label %3651, label %3609

; <label>:3609                                    ; preds = %3603
  %3610 = load %struct.regnode** %text_node, align 8
  %3611 = getelementptr inbounds %struct.regnode* %3610, i32 0, i32 1
  %3612 = load i8* %3611, align 1
  %3613 = zext i8 %3612 to i32
  %3614 = icmp eq i32 %3613, 52
  br i1 %3614, label %3651, label %3615

; <label>:3615                                    ; preds = %3609
  %3616 = load %struct.regnode** %text_node, align 8
  %3617 = getelementptr inbounds %struct.regnode* %3616, i32 0, i32 1
  %3618 = load i8* %3617, align 1
  %3619 = zext i8 %3618 to i32
  %3620 = icmp eq i32 %3619, 50
  br i1 %3620, label %3651, label %3621

; <label>:3621                                    ; preds = %3615
  %3622 = load %struct.regnode** %text_node, align 8
  %3623 = getelementptr inbounds %struct.regnode* %3622, i32 0, i32 1
  %3624 = load i8* %3623, align 1
  %3625 = zext i8 %3624 to i32
  %3626 = icmp eq i32 %3625, 39
  br i1 %3626, label %3651, label %3627

; <label>:3627                                    ; preds = %3621
  %3628 = load %struct.regnode** %text_node, align 8
  %3629 = getelementptr inbounds %struct.regnode* %3628, i32 0, i32 1
  %3630 = load i8* %3629, align 1
  %3631 = zext i8 %3630 to i32
  %3632 = icmp eq i32 %3631, 58
  br i1 %3632, label %3651, label %3633

; <label>:3633                                    ; preds = %3627
  %3634 = load %struct.regnode** %text_node, align 8
  %3635 = getelementptr inbounds %struct.regnode* %3634, i32 0, i32 1
  %3636 = load i8* %3635, align 1
  %3637 = zext i8 %3636 to i64
  %3638 = getelementptr inbounds [0 x i8]* @PL_regkind, i32 0, i64 %3637
  %3639 = load i8* %3638, align 1
  %3640 = zext i8 %3639 to i32
  %3641 = icmp eq i32 %3640, 40
  br i1 %3641, label %3642, label %3649

; <label>:3642                                    ; preds = %3633
  %3643 = load %struct.regnode** %text_node, align 8
  %3644 = bitcast %struct.regnode* %3643 to %struct.regnode_2*
  %3645 = getelementptr inbounds %struct.regnode_2* %3644, i32 0, i32 3
  %3646 = load i16* %3645, align 2
  %3647 = zext i16 %3646 to i32
  %3648 = icmp sgt i32 %3647, 0
  br label %3649

; <label>:3649                                    ; preds = %3642, %3633
  %3650 = phi i1 [ false, %3633 ], [ %3648, %3642 ]
  br label %3651

; <label>:3651                                    ; preds = %3649, %3627, %3621, %3615, %3609, %3603, %3597, %3591
  %3652 = phi i1 [ true, %3627 ], [ true, %3621 ], [ true, %3615 ], [ true, %3609 ], [ true, %3603 ], [ true, %3597 ], [ true, %3591 ], [ %3650, %3649 ]
  br i1 %3652, label %3653, label %3718

; <label>:3653                                    ; preds = %3651
  %3654 = load %struct.regnode** %text_node, align 8
  %3655 = getelementptr inbounds %struct.regnode* %3654, i32 0, i32 1
  %3656 = load i8* %3655, align 1
  %3657 = zext i8 %3656 to i32
  %3658 = icmp eq i32 %3657, 52
  br i1 %3658, label %3668, label %3659

; <label>:3659                                    ; preds = %3653
  %3660 = load %struct.regnode** %text_node, align 8
  %3661 = getelementptr inbounds %struct.regnode* %3660, i32 0, i32 1
  %3662 = load i8* %3661, align 1
  %3663 = zext i8 %3662 to i64
  %3664 = getelementptr inbounds [0 x i8]* @PL_regkind, i32 0, i64 %3663
  %3665 = load i8* %3664, align 1
  %3666 = zext i8 %3665 to i32
  %3667 = icmp eq i32 %3666, 40
  br i1 %3667, label %3668, label %3672

; <label>:3668                                    ; preds = %3659, %3653
  %3669 = load %struct.regnode** %text_node, align 8
  %3670 = getelementptr inbounds %struct.regnode* %3669, i64 1
  %3671 = getelementptr inbounds %struct.regnode* %3670, i64 1
  store %struct.regnode* %3671, %struct.regnode** %text_node, align 8
  br label %3717

; <label>:3672                                    ; preds = %3659
  %3673 = load %struct.regnode** %text_node, align 8
  %3674 = getelementptr inbounds %struct.regnode* %3673, i32 0, i32 1
  %3675 = load i8* %3674, align 1
  %3676 = zext i8 %3675 to i32
  %3677 = icmp eq i32 %3676, 39
  br i1 %3677, label %3678, label %3681

; <label>:3678                                    ; preds = %3672
  %3679 = load %struct.regnode** %text_node, align 8
  %3680 = getelementptr inbounds %struct.regnode* %3679, i64 1
  store %struct.regnode* %3680, %struct.regnode** %text_node, align 8
  br label %3716

; <label>:3681                                    ; preds = %3672
  %3682 = load %struct.regnode** %text_node, align 8
  %3683 = getelementptr inbounds %struct.regnode* %3682, i32 0, i32 1
  %3684 = load i8* %3683, align 1
  %3685 = zext i8 %3684 to i32
  %3686 = icmp eq i32 %3685, 50
  br i1 %3686, label %3687, label %3707

; <label>:3687                                    ; preds = %3681
  %3688 = load %struct.regnode** %text_node, align 8
  %3689 = getelementptr inbounds %struct.regnode* %3688, i32 0, i32 0
  %3690 = load i8* %3689, align 1
  %3691 = zext i8 %3690 to i32
  %3692 = icmp eq i32 %3691, 0
  br i1 %3692, label %3693, label %3697

; <label>:3693                                    ; preds = %3687
  %3694 = load %struct.regnode** %text_node, align 8
  %3695 = getelementptr inbounds %struct.regnode* %3694, i64 1
  %3696 = getelementptr inbounds %struct.regnode* %3695, i64 1
  br label %3705

; <label>:3697                                    ; preds = %3687
  %3698 = load %struct.regnode** %text_node, align 8
  %3699 = load %struct.regnode** %text_node, align 8
  %3700 = bitcast %struct.regnode* %3699 to %struct.regnode_1*
  %3701 = getelementptr inbounds %struct.regnode_1* %3700, i32 0, i32 3
  %3702 = load i32* %3701, align 4
  %3703 = zext i32 %3702 to i64
  %3704 = getelementptr inbounds %struct.regnode* %3698, i64 %3703
  br label %3705

; <label>:3705                                    ; preds = %3697, %3693
  %3706 = phi %struct.regnode* [ %3696, %3693 ], [ %3704, %3697 ]
  store %struct.regnode* %3706, %struct.regnode** %text_node, align 8
  br label %3715

; <label>:3707                                    ; preds = %3681
  %3708 = load %struct.regnode** %text_node, align 8
  %3709 = getelementptr inbounds %struct.regnode* %3708, i32 0, i32 2
  %3710 = load i16* %3709, align 2
  %3711 = zext i16 %3710 to i32
  %3712 = load %struct.regnode** %text_node, align 8
  %3713 = sext i32 %3711 to i64
  %3714 = getelementptr inbounds %struct.regnode* %3712, i64 %3713
  store %struct.regnode* %3714, %struct.regnode** %text_node, align 8
  br label %3715

; <label>:3715                                    ; preds = %3707, %3705
  br label %3716

; <label>:3716                                    ; preds = %3715, %3678
  br label %3717

; <label>:3717                                    ; preds = %3716, %3668
  br label %3591

; <label>:3718                                    ; preds = %3651
  br label %3719

; <label>:3719                                    ; preds = %3718, %3581, %3571
  %3720 = load %struct.regnode** %text_node, align 8
  %3721 = getelementptr inbounds %struct.regnode* %3720, i32 0, i32 1
  %3722 = load i8* %3721, align 1
  %3723 = zext i8 %3722 to i64
  %3724 = getelementptr inbounds [0 x i8]* @PL_regkind, i32 0, i64 %3723
  %3725 = load i8* %3724, align 1
  %3726 = zext i8 %3725 to i32
  %3727 = icmp eq i32 %3726, 33
  br i1 %3727, label %3738, label %3728

; <label>:3728                                    ; preds = %3719
  %3729 = load %struct.regnode** %text_node, align 8
  %3730 = getelementptr inbounds %struct.regnode* %3729, i32 0, i32 1
  %3731 = load i8* %3730, align 1
  %3732 = zext i8 %3731 to i64
  %3733 = getelementptr inbounds [0 x i8]* @PL_regkind, i32 0, i64 %3732
  %3734 = load i8* %3733, align 1
  %3735 = zext i8 %3734 to i32
  %3736 = icmp eq i32 %3735, 47
  br i1 %3736, label %3738, label %3737

; <label>:3737                                    ; preds = %3728
  store i32 -1000, i32* %c2, align 4
  store i32 -1000, i32* %c1, align 4
  br label %3795

; <label>:3738                                    ; preds = %3728, %3719
  %3739 = load %struct.regnode** %text_node, align 8
  %3740 = getelementptr inbounds %struct.regnode* %3739, i32 0, i32 1
  %3741 = load i8* %3740, align 1
  %3742 = zext i8 %3741 to i64
  %3743 = getelementptr inbounds [0 x i8]* @PL_regkind, i32 0, i64 %3742
  %3744 = load i8* %3743, align 1
  %3745 = zext i8 %3744 to i32
  %3746 = icmp eq i32 %3745, 47
  br i1 %3746, label %3747, label %3748

; <label>:3747                                    ; preds = %3738
  store i32 -1000, i32* %c2, align 4
  store i32 -1000, i32* %c1, align 4
  br label %3798

; <label>:3748                                    ; preds = %3738
  %3749 = load %struct.regnode** %text_node, align 8
  %3750 = bitcast %struct.regnode* %3749 to %struct.regnode_string*
  %3751 = getelementptr inbounds %struct.regnode_string* %3750, i32 0, i32 3
  %3752 = getelementptr inbounds [1 x i8]* %3751, i32 0, i32 0
  %3753 = load i8* %3752, align 1
  %3754 = zext i8 %3753 to i32
  store i32 %3754, i32* %c1, align 4
  br label %3755

; <label>:3755                                    ; preds = %3748
  %3756 = load %struct.regnode** %text_node, align 8
  %3757 = getelementptr inbounds %struct.regnode* %3756, i32 0, i32 1
  %3758 = load i8* %3757, align 1
  %3759 = zext i8 %3758 to i32
  %3760 = icmp eq i32 %3759, 34
  br i1 %3760, label %3767, label %3761

; <label>:3761                                    ; preds = %3755
  %3762 = load %struct.regnode** %text_node, align 8
  %3763 = getelementptr inbounds %struct.regnode* %3762, i32 0, i32 1
  %3764 = load i8* %3763, align 1
  %3765 = zext i8 %3764 to i32
  %3766 = icmp eq i32 %3765, 48
  br i1 %3766, label %3767, label %3773

; <label>:3767                                    ; preds = %3761, %3755
  %3768 = load i32* %c1, align 4
  %3769 = sext i32 %3768 to i64
  %3770 = getelementptr inbounds [0 x i8]* @PL_fold, i32 0, i64 %3769
  %3771 = load i8* %3770, align 1
  %3772 = zext i8 %3771 to i32
  store i32 %3772, i32* %c2, align 4
  br label %3794

; <label>:3773                                    ; preds = %3761
  %3774 = load %struct.regnode** %text_node, align 8
  %3775 = getelementptr inbounds %struct.regnode* %3774, i32 0, i32 1
  %3776 = load i8* %3775, align 1
  %3777 = zext i8 %3776 to i32
  %3778 = icmp eq i32 %3777, 35
  br i1 %3778, label %3785, label %3779

; <label>:3779                                    ; preds = %3773
  %3780 = load %struct.regnode** %text_node, align 8
  %3781 = getelementptr inbounds %struct.regnode* %3780, i32 0, i32 1
  %3782 = load i8* %3781, align 1
  %3783 = zext i8 %3782 to i32
  %3784 = icmp eq i32 %3783, 49
  br i1 %3784, label %3785, label %3791

; <label>:3785                                    ; preds = %3779, %3773
  %3786 = load i32* %c1, align 4
  %3787 = sext i32 %3786 to i64
  %3788 = getelementptr inbounds [0 x i8]* @PL_fold_locale, i32 0, i64 %3787
  %3789 = load i8* %3788, align 1
  %3790 = zext i8 %3789 to i32
  store i32 %3790, i32* %c2, align 4
  br label %3793

; <label>:3791                                    ; preds = %3779
  %3792 = load i32* %c1, align 4
  store i32 %3792, i32* %c2, align 4
  br label %3793

; <label>:3793                                    ; preds = %3791, %3785
  br label %3794

; <label>:3794                                    ; preds = %3793, %3767
  br label %3795

; <label>:3795                                    ; preds = %3794, %3737
  br label %3797

; <label>:3796                                    ; preds = %3564, %3555
  store i32 -1000, i32* %c2, align 4
  store i32 -1000, i32* %c1, align 4
  br label %3797

; <label>:3797                                    ; preds = %3796, %3795
  br label %3798

; <label>:3798                                    ; preds = %3797, %3747
  %3799 = load i32* @PL_savestack_ix, align 4
  store i32 %3799, i32* %lastcp10, align 4
  br label %3800

; <label>:3800                                    ; preds = %3901, %3798
  %3801 = load i32* %n, align 4
  %3802 = load i32* %ln, align 4
  %3803 = icmp sge i32 %3801, %3802
  br i1 %3803, label %3812, label %3804

; <label>:3804                                    ; preds = %3800
  %3805 = load i32* %n, align 4
  %3806 = icmp eq i32 %3805, 32767
  br i1 %3806, label %3807, label %3810

; <label>:3807                                    ; preds = %3804
  %3808 = load i32* %ln, align 4
  %3809 = icmp sgt i32 %3808, 0
  br label %3810

; <label>:3810                                    ; preds = %3807, %3804
  %3811 = phi i1 [ false, %3804 ], [ %3809, %3807 ]
  br label %3812

; <label>:3812                                    ; preds = %3810, %3800
  %3813 = phi i1 [ true, %3800 ], [ %3811, %3810 ]
  br i1 %3813, label %3814, label %3902

; <label>:3814                                    ; preds = %3812
  %3815 = load i32* %c1, align 4
  %3816 = icmp eq i32 %3815, -1000
  br i1 %3816, label %3829, label %3817

; <label>:3817                                    ; preds = %3814
  %3818 = load i8** @PL_reginput, align 8
  %3819 = load i8* %3818, align 1
  %3820 = zext i8 %3819 to i32
  %3821 = load i32* %c1, align 4
  %3822 = icmp eq i32 %3820, %3821
  br i1 %3822, label %3829, label %3823

; <label>:3823                                    ; preds = %3817
  %3824 = load i8** @PL_reginput, align 8
  %3825 = load i8* %3824, align 1
  %3826 = zext i8 %3825 to i32
  %3827 = load i32* %c2, align 4
  %3828 = icmp eq i32 %3826, %3827
  br i1 %3828, label %3829, label %3891

; <label>:3829                                    ; preds = %3823, %3817, %3814
  %3830 = load i32* %paren, align 4
  %3831 = icmp ne i32 %3830, 0
  br i1 %3831, label %3832, label %3879

; <label>:3832                                    ; preds = %3829
  %3833 = load i32* %ln, align 4
  %3834 = icmp ne i32 %3833, 0
  br i1 %3834, label %3835, label %3873

; <label>:3835                                    ; preds = %3832
  %3836 = load i8* @PL_reg_match_utf8, align 1
  %3837 = sext i8 %3836 to i32
  %3838 = icmp ne i32 %3837, 0
  br i1 %3838, label %3839, label %3846

; <label>:3839                                    ; preds = %3835
  %3840 = load i8** @PL_reginput, align 8
  %3841 = load i32* %l9, align 4
  %3842 = sub nsw i32 0, %3841
  %3843 = call i32 (i8*, i32, ...)* bitcast (i32 (...)* @reghop to i32 (i8*, i32, ...)*)(i8* %3840, i32 %3842)
  %3844 = sext i32 %3843 to i64
  %3845 = inttoptr i64 %3844 to i8*
  br label %3852

; <label>:3846                                    ; preds = %3835
  %3847 = load i8** @PL_reginput, align 8
  %3848 = load i32* %l9, align 4
  %3849 = sub nsw i32 0, %3848
  %3850 = sext i32 %3849 to i64
  %3851 = getelementptr inbounds i8* %3847, i64 %3850
  br label %3852

; <label>:3852                                    ; preds = %3846, %3839
  %3853 = phi i8* [ %3845, %3839 ], [ %3851, %3846 ]
  %3854 = load i8** @PL_bostr, align 8
  %3855 = ptrtoint i8* %3853 to i64
  %3856 = ptrtoint i8* %3854 to i64
  %3857 = sub i64 %3855, %3856
  %3858 = trunc i64 %3857 to i32
  %3859 = load i32* %paren, align 4
  %3860 = sext i32 %3859 to i64
  %3861 = load i32** @PL_regstartp, align 8
  %3862 = getelementptr inbounds i32* %3861, i64 %3860
  store i32 %3858, i32* %3862, align 4
  %3863 = load i8** @PL_reginput, align 8
  %3864 = load i8** @PL_bostr, align 8
  %3865 = ptrtoint i8* %3863 to i64
  %3866 = ptrtoint i8* %3864 to i64
  %3867 = sub i64 %3865, %3866
  %3868 = trunc i64 %3867 to i32
  %3869 = load i32* %paren, align 4
  %3870 = sext i32 %3869 to i64
  %3871 = load i32** @PL_regendp, align 8
  %3872 = getelementptr inbounds i32* %3871, i64 %3870
  store i32 %3868, i32* %3872, align 4
  br label %3878

; <label>:3873                                    ; preds = %3832
  %3874 = load i32* %paren, align 4
  %3875 = sext i32 %3874 to i64
  %3876 = load i32** @PL_regendp, align 8
  %3877 = getelementptr inbounds i32* %3876, i64 %3875
  store i32 -1, i32* %3877, align 4
  br label %3878

; <label>:3878                                    ; preds = %3873, %3852
  br label %3879

; <label>:3879                                    ; preds = %3878, %3829
  %3880 = load %struct.regnode** %next, align 8
  %3881 = call i32 (%struct.regnode*, ...)* bitcast (i32 (...)* @regmatch to i32 (%struct.regnode*, ...)*)(%struct.regnode* %3880)
  %3882 = icmp ne i32 %3881, 0
  br i1 %3882, label %3883, label %3884

; <label>:3883                                    ; preds = %3879
  br label %6126

; <label>:3884                                    ; preds = %3879
  %3885 = load i32* @PL_savestack_ix, align 4
  %3886 = load i32* %lastcp10, align 4
  %3887 = icmp sgt i32 %3885, %3886
  br i1 %3887, label %3888, label %3890

; <label>:3888                                    ; preds = %3884
  %3889 = load i32* %lastcp10, align 4
  call void @Perl_leave_scope(i32 %3889)
  br label %3890

; <label>:3890                                    ; preds = %3888, %3884
  br label %3891

; <label>:3891                                    ; preds = %3890, %3823
  %3892 = load i8** %locinput, align 8
  store i8* %3892, i8** @PL_reginput, align 8
  %3893 = load %struct.regnode** %scan, align 8
  %3894 = call i32 (%struct.regnode*, i32, i32*, ...)* bitcast (i32 (...)* @regrepeat_hard to i32 (%struct.regnode*, i32, i32*, ...)*)(%struct.regnode* %3893, i32 1, i32* %l9)
  %3895 = icmp ne i32 %3894, 0
  br i1 %3895, label %3896, label %3900

; <label>:3896                                    ; preds = %3891
  %3897 = load i32* %ln, align 4
  %3898 = add nsw i32 %3897, 1
  store i32 %3898, i32* %ln, align 4
  %3899 = load i8** @PL_reginput, align 8
  store i8* %3899, i8** %locinput, align 8
  br label %3901

; <label>:3900                                    ; preds = %3891
  br label %6127

; <label>:3901                                    ; preds = %3896
  br label %3800

; <label>:3902                                    ; preds = %3812
  br label %4321

; <label>:3903                                    ; preds = %3480
  %3904 = load %struct.regnode** %scan, align 8
  %3905 = load i32* %n, align 4
  %3906 = call i32 (%struct.regnode*, i32, i32*, ...)* bitcast (i32 (...)* @regrepeat_hard to i32 (%struct.regnode*, i32, i32*, ...)*)(%struct.regnode* %3904, i32 %3905, i32* %l9)
  store i32 %3906, i32* %n, align 4
  %3907 = load i8** @PL_reginput, align 8
  store i8* %3907, i8** %locinput, align 8
  %3908 = load i32* %n, align 4
  %3909 = load i32* %ln, align 4
  %3910 = icmp sge i32 %3908, %3909
  br i1 %3910, label %3911, label %4214

; <label>:3911                                    ; preds = %3903
  %3912 = load %struct.regnode** %next, align 8
  %3913 = getelementptr inbounds %struct.regnode* %3912, i32 0, i32 1
  %3914 = load i8* %3913, align 1
  %3915 = zext i8 %3914 to i64
  %3916 = getelementptr inbounds [0 x i8]* @PL_regkind, i32 0, i64 %3915
  %3917 = load i8* %3916, align 1
  %3918 = zext i8 %3917 to i32
  %3919 = icmp eq i32 %3918, 33
  br i1 %3919, label %3987, label %3920

; <label>:3920                                    ; preds = %3911
  %3921 = load %struct.regnode** %next, align 8
  %3922 = getelementptr inbounds %struct.regnode* %3921, i32 0, i32 1
  %3923 = load i8* %3922, align 1
  %3924 = zext i8 %3923 to i64
  %3925 = getelementptr inbounds [0 x i8]* @PL_regkind, i32 0, i64 %3924
  %3926 = load i8* %3925, align 1
  %3927 = zext i8 %3926 to i32
  %3928 = icmp eq i32 %3927, 47
  br i1 %3928, label %3987, label %3929

; <label>:3929                                    ; preds = %3920
  %3930 = load %struct.regnode** %next, align 8
  %3931 = getelementptr inbounds %struct.regnode* %3930, i32 0, i32 1
  %3932 = load i8* %3931, align 1
  %3933 = zext i8 %3932 to i32
  %3934 = icmp eq i32 %3933, 45
  br i1 %3934, label %3987, label %3935

; <label>:3935                                    ; preds = %3929
  %3936 = load %struct.regnode** %next, align 8
  %3937 = getelementptr inbounds %struct.regnode* %3936, i32 0, i32 1
  %3938 = load i8* %3937, align 1
  %3939 = zext i8 %3938 to i32
  %3940 = icmp eq i32 %3939, 46
  br i1 %3940, label %3987, label %3941

; <label>:3941                                    ; preds = %3935
  %3942 = load %struct.regnode** %next, align 8
  %3943 = getelementptr inbounds %struct.regnode* %3942, i32 0, i32 1
  %3944 = load i8* %3943, align 1
  %3945 = zext i8 %3944 to i32
  %3946 = icmp eq i32 %3945, 57
  br i1 %3946, label %3987, label %3947

; <label>:3947                                    ; preds = %3941
  %3948 = load %struct.regnode** %next, align 8
  %3949 = getelementptr inbounds %struct.regnode* %3948, i32 0, i32 1
  %3950 = load i8* %3949, align 1
  %3951 = zext i8 %3950 to i32
  %3952 = icmp eq i32 %3951, 52
  br i1 %3952, label %3987, label %3953

; <label>:3953                                    ; preds = %3947
  %3954 = load %struct.regnode** %next, align 8
  %3955 = getelementptr inbounds %struct.regnode* %3954, i32 0, i32 1
  %3956 = load i8* %3955, align 1
  %3957 = zext i8 %3956 to i32
  %3958 = icmp eq i32 %3957, 50
  br i1 %3958, label %3987, label %3959

; <label>:3959                                    ; preds = %3953
  %3960 = load %struct.regnode** %next, align 8
  %3961 = getelementptr inbounds %struct.regnode* %3960, i32 0, i32 1
  %3962 = load i8* %3961, align 1
  %3963 = zext i8 %3962 to i32
  %3964 = icmp eq i32 %3963, 39
  br i1 %3964, label %3987, label %3965

; <label>:3965                                    ; preds = %3959
  %3966 = load %struct.regnode** %next, align 8
  %3967 = getelementptr inbounds %struct.regnode* %3966, i32 0, i32 1
  %3968 = load i8* %3967, align 1
  %3969 = zext i8 %3968 to i32
  %3970 = icmp eq i32 %3969, 58
  br i1 %3970, label %3987, label %3971

; <label>:3971                                    ; preds = %3965
  %3972 = load %struct.regnode** %next, align 8
  %3973 = getelementptr inbounds %struct.regnode* %3972, i32 0, i32 1
  %3974 = load i8* %3973, align 1
  %3975 = zext i8 %3974 to i64
  %3976 = getelementptr inbounds [0 x i8]* @PL_regkind, i32 0, i64 %3975
  %3977 = load i8* %3976, align 1
  %3978 = zext i8 %3977 to i32
  %3979 = icmp eq i32 %3978, 40
  br i1 %3979, label %3980, label %4212

; <label>:3980                                    ; preds = %3971
  %3981 = load %struct.regnode** %next, align 8
  %3982 = bitcast %struct.regnode* %3981 to %struct.regnode_2*
  %3983 = getelementptr inbounds %struct.regnode_2* %3982, i32 0, i32 3
  %3984 = load i16* %3983, align 2
  %3985 = zext i16 %3984 to i32
  %3986 = icmp sgt i32 %3985, 0
  br i1 %3986, label %3987, label %4212

; <label>:3987                                    ; preds = %3980, %3965, %3959, %3953, %3947, %3941, %3935, %3929, %3920, %3911
  %3988 = load %struct.regnode** %next, align 8
  store %struct.regnode* %3988, %struct.regnode** %text_node11, align 8
  %3989 = load %struct.regnode** %text_node11, align 8
  %3990 = getelementptr inbounds %struct.regnode* %3989, i32 0, i32 1
  %3991 = load i8* %3990, align 1
  %3992 = zext i8 %3991 to i64
  %3993 = getelementptr inbounds [0 x i8]* @PL_regkind, i32 0, i64 %3992
  %3994 = load i8* %3993, align 1
  %3995 = zext i8 %3994 to i32
  %3996 = icmp eq i32 %3995, 33
  br i1 %3996, label %4135, label %3997

; <label>:3997                                    ; preds = %3987
  %3998 = load %struct.regnode** %text_node11, align 8
  %3999 = getelementptr inbounds %struct.regnode* %3998, i32 0, i32 1
  %4000 = load i8* %3999, align 1
  %4001 = zext i8 %4000 to i64
  %4002 = getelementptr inbounds [0 x i8]* @PL_regkind, i32 0, i64 %4001
  %4003 = load i8* %4002, align 1
  %4004 = zext i8 %4003 to i32
  %4005 = icmp eq i32 %4004, 47
  br i1 %4005, label %4135, label %4006

; <label>:4006                                    ; preds = %3997
  br label %4007

; <label>:4007                                    ; preds = %4133, %4006
  %4008 = load %struct.regnode** %text_node11, align 8
  %4009 = getelementptr inbounds %struct.regnode* %4008, i32 0, i32 1
  %4010 = load i8* %4009, align 1
  %4011 = zext i8 %4010 to i32
  %4012 = icmp eq i32 %4011, 45
  br i1 %4012, label %4067, label %4013

; <label>:4013                                    ; preds = %4007
  %4014 = load %struct.regnode** %text_node11, align 8
  %4015 = getelementptr inbounds %struct.regnode* %4014, i32 0, i32 1
  %4016 = load i8* %4015, align 1
  %4017 = zext i8 %4016 to i32
  %4018 = icmp eq i32 %4017, 46
  br i1 %4018, label %4067, label %4019

; <label>:4019                                    ; preds = %4013
  %4020 = load %struct.regnode** %text_node11, align 8
  %4021 = getelementptr inbounds %struct.regnode* %4020, i32 0, i32 1
  %4022 = load i8* %4021, align 1
  %4023 = zext i8 %4022 to i32
  %4024 = icmp eq i32 %4023, 57
  br i1 %4024, label %4067, label %4025

; <label>:4025                                    ; preds = %4019
  %4026 = load %struct.regnode** %text_node11, align 8
  %4027 = getelementptr inbounds %struct.regnode* %4026, i32 0, i32 1
  %4028 = load i8* %4027, align 1
  %4029 = zext i8 %4028 to i32
  %4030 = icmp eq i32 %4029, 52
  br i1 %4030, label %4067, label %4031

; <label>:4031                                    ; preds = %4025
  %4032 = load %struct.regnode** %text_node11, align 8
  %4033 = getelementptr inbounds %struct.regnode* %4032, i32 0, i32 1
  %4034 = load i8* %4033, align 1
  %4035 = zext i8 %4034 to i32
  %4036 = icmp eq i32 %4035, 50
  br i1 %4036, label %4067, label %4037

; <label>:4037                                    ; preds = %4031
  %4038 = load %struct.regnode** %text_node11, align 8
  %4039 = getelementptr inbounds %struct.regnode* %4038, i32 0, i32 1
  %4040 = load i8* %4039, align 1
  %4041 = zext i8 %4040 to i32
  %4042 = icmp eq i32 %4041, 39
  br i1 %4042, label %4067, label %4043

; <label>:4043                                    ; preds = %4037
  %4044 = load %struct.regnode** %text_node11, align 8
  %4045 = getelementptr inbounds %struct.regnode* %4044, i32 0, i32 1
  %4046 = load i8* %4045, align 1
  %4047 = zext i8 %4046 to i32
  %4048 = icmp eq i32 %4047, 58
  br i1 %4048, label %4067, label %4049

; <label>:4049                                    ; preds = %4043
  %4050 = load %struct.regnode** %text_node11, align 8
  %4051 = getelementptr inbounds %struct.regnode* %4050, i32 0, i32 1
  %4052 = load i8* %4051, align 1
  %4053 = zext i8 %4052 to i64
  %4054 = getelementptr inbounds [0 x i8]* @PL_regkind, i32 0, i64 %4053
  %4055 = load i8* %4054, align 1
  %4056 = zext i8 %4055 to i32
  %4057 = icmp eq i32 %4056, 40
  br i1 %4057, label %4058, label %4065

; <label>:4058                                    ; preds = %4049
  %4059 = load %struct.regnode** %text_node11, align 8
  %4060 = bitcast %struct.regnode* %4059 to %struct.regnode_2*
  %4061 = getelementptr inbounds %struct.regnode_2* %4060, i32 0, i32 3
  %4062 = load i16* %4061, align 2
  %4063 = zext i16 %4062 to i32
  %4064 = icmp sgt i32 %4063, 0
  br label %4065

; <label>:4065                                    ; preds = %4058, %4049
  %4066 = phi i1 [ false, %4049 ], [ %4064, %4058 ]
  br label %4067

; <label>:4067                                    ; preds = %4065, %4043, %4037, %4031, %4025, %4019, %4013, %4007
  %4068 = phi i1 [ true, %4043 ], [ true, %4037 ], [ true, %4031 ], [ true, %4025 ], [ true, %4019 ], [ true, %4013 ], [ true, %4007 ], [ %4066, %4065 ]
  br i1 %4068, label %4069, label %4134

; <label>:4069                                    ; preds = %4067
  %4070 = load %struct.regnode** %text_node11, align 8
  %4071 = getelementptr inbounds %struct.regnode* %4070, i32 0, i32 1
  %4072 = load i8* %4071, align 1
  %4073 = zext i8 %4072 to i32
  %4074 = icmp eq i32 %4073, 52
  br i1 %4074, label %4084, label %4075

; <label>:4075                                    ; preds = %4069
  %4076 = load %struct.regnode** %text_node11, align 8
  %4077 = getelementptr inbounds %struct.regnode* %4076, i32 0, i32 1
  %4078 = load i8* %4077, align 1
  %4079 = zext i8 %4078 to i64
  %4080 = getelementptr inbounds [0 x i8]* @PL_regkind, i32 0, i64 %4079
  %4081 = load i8* %4080, align 1
  %4082 = zext i8 %4081 to i32
  %4083 = icmp eq i32 %4082, 40
  br i1 %4083, label %4084, label %4088

; <label>:4084                                    ; preds = %4075, %4069
  %4085 = load %struct.regnode** %text_node11, align 8
  %4086 = getelementptr inbounds %struct.regnode* %4085, i64 1
  %4087 = getelementptr inbounds %struct.regnode* %4086, i64 1
  store %struct.regnode* %4087, %struct.regnode** %text_node11, align 8
  br label %4133

; <label>:4088                                    ; preds = %4075
  %4089 = load %struct.regnode** %text_node11, align 8
  %4090 = getelementptr inbounds %struct.regnode* %4089, i32 0, i32 1
  %4091 = load i8* %4090, align 1
  %4092 = zext i8 %4091 to i32
  %4093 = icmp eq i32 %4092, 39
  br i1 %4093, label %4094, label %4097

; <label>:4094                                    ; preds = %4088
  %4095 = load %struct.regnode** %text_node11, align 8
  %4096 = getelementptr inbounds %struct.regnode* %4095, i64 1
  store %struct.regnode* %4096, %struct.regnode** %text_node11, align 8
  br label %4132

; <label>:4097                                    ; preds = %4088
  %4098 = load %struct.regnode** %text_node11, align 8
  %4099 = getelementptr inbounds %struct.regnode* %4098, i32 0, i32 1
  %4100 = load i8* %4099, align 1
  %4101 = zext i8 %4100 to i32
  %4102 = icmp eq i32 %4101, 50
  br i1 %4102, label %4103, label %4123

; <label>:4103                                    ; preds = %4097
  %4104 = load %struct.regnode** %text_node11, align 8
  %4105 = getelementptr inbounds %struct.regnode* %4104, i32 0, i32 0
  %4106 = load i8* %4105, align 1
  %4107 = zext i8 %4106 to i32
  %4108 = icmp eq i32 %4107, 0
  br i1 %4108, label %4109, label %4113

; <label>:4109                                    ; preds = %4103
  %4110 = load %struct.regnode** %text_node11, align 8
  %4111 = getelementptr inbounds %struct.regnode* %4110, i64 1
  %4112 = getelementptr inbounds %struct.regnode* %4111, i64 1
  br label %4121

; <label>:4113                                    ; preds = %4103
  %4114 = load %struct.regnode** %text_node11, align 8
  %4115 = load %struct.regnode** %text_node11, align 8
  %4116 = bitcast %struct.regnode* %4115 to %struct.regnode_1*
  %4117 = getelementptr inbounds %struct.regnode_1* %4116, i32 0, i32 3
  %4118 = load i32* %4117, align 4
  %4119 = zext i32 %4118 to i64
  %4120 = getelementptr inbounds %struct.regnode* %4114, i64 %4119
  br label %4121

; <label>:4121                                    ; preds = %4113, %4109
  %4122 = phi %struct.regnode* [ %4112, %4109 ], [ %4120, %4113 ]
  store %struct.regnode* %4122, %struct.regnode** %text_node11, align 8
  br label %4131

; <label>:4123                                    ; preds = %4097
  %4124 = load %struct.regnode** %text_node11, align 8
  %4125 = getelementptr inbounds %struct.regnode* %4124, i32 0, i32 2
  %4126 = load i16* %4125, align 2
  %4127 = zext i16 %4126 to i32
  %4128 = load %struct.regnode** %text_node11, align 8
  %4129 = sext i32 %4127 to i64
  %4130 = getelementptr inbounds %struct.regnode* %4128, i64 %4129
  store %struct.regnode* %4130, %struct.regnode** %text_node11, align 8
  br label %4131

; <label>:4131                                    ; preds = %4123, %4121
  br label %4132

; <label>:4132                                    ; preds = %4131, %4094
  br label %4133

; <label>:4133                                    ; preds = %4132, %4084
  br label %4007

; <label>:4134                                    ; preds = %4067
  br label %4135

; <label>:4135                                    ; preds = %4134, %3997, %3987
  %4136 = load %struct.regnode** %text_node11, align 8
  %4137 = getelementptr inbounds %struct.regnode* %4136, i32 0, i32 1
  %4138 = load i8* %4137, align 1
  %4139 = zext i8 %4138 to i64
  %4140 = getelementptr inbounds [0 x i8]* @PL_regkind, i32 0, i64 %4139
  %4141 = load i8* %4140, align 1
  %4142 = zext i8 %4141 to i32
  %4143 = icmp eq i32 %4142, 33
  br i1 %4143, label %4154, label %4144

; <label>:4144                                    ; preds = %4135
  %4145 = load %struct.regnode** %text_node11, align 8
  %4146 = getelementptr inbounds %struct.regnode* %4145, i32 0, i32 1
  %4147 = load i8* %4146, align 1
  %4148 = zext i8 %4147 to i64
  %4149 = getelementptr inbounds [0 x i8]* @PL_regkind, i32 0, i64 %4148
  %4150 = load i8* %4149, align 1
  %4151 = zext i8 %4150 to i32
  %4152 = icmp eq i32 %4151, 47
  br i1 %4152, label %4154, label %4153

; <label>:4153                                    ; preds = %4144
  store i32 -1000, i32* %c2, align 4
  store i32 -1000, i32* %c1, align 4
  br label %4211

; <label>:4154                                    ; preds = %4144, %4135
  %4155 = load %struct.regnode** %text_node11, align 8
  %4156 = getelementptr inbounds %struct.regnode* %4155, i32 0, i32 1
  %4157 = load i8* %4156, align 1
  %4158 = zext i8 %4157 to i64
  %4159 = getelementptr inbounds [0 x i8]* @PL_regkind, i32 0, i64 %4158
  %4160 = load i8* %4159, align 1
  %4161 = zext i8 %4160 to i32
  %4162 = icmp eq i32 %4161, 47
  br i1 %4162, label %4163, label %4164

; <label>:4163                                    ; preds = %4154
  store i32 -1000, i32* %c2, align 4
  store i32 -1000, i32* %c1, align 4
  br label %4215

; <label>:4164                                    ; preds = %4154
  %4165 = load %struct.regnode** %text_node11, align 8
  %4166 = bitcast %struct.regnode* %4165 to %struct.regnode_string*
  %4167 = getelementptr inbounds %struct.regnode_string* %4166, i32 0, i32 3
  %4168 = getelementptr inbounds [1 x i8]* %4167, i32 0, i32 0
  %4169 = load i8* %4168, align 1
  %4170 = zext i8 %4169 to i32
  store i32 %4170, i32* %c1, align 4
  br label %4171

; <label>:4171                                    ; preds = %4164
  %4172 = load %struct.regnode** %text_node11, align 8
  %4173 = getelementptr inbounds %struct.regnode* %4172, i32 0, i32 1
  %4174 = load i8* %4173, align 1
  %4175 = zext i8 %4174 to i32
  %4176 = icmp eq i32 %4175, 34
  br i1 %4176, label %4183, label %4177

; <label>:4177                                    ; preds = %4171
  %4178 = load %struct.regnode** %text_node11, align 8
  %4179 = getelementptr inbounds %struct.regnode* %4178, i32 0, i32 1
  %4180 = load i8* %4179, align 1
  %4181 = zext i8 %4180 to i32
  %4182 = icmp eq i32 %4181, 48
  br i1 %4182, label %4183, label %4189

; <label>:4183                                    ; preds = %4177, %4171
  %4184 = load i32* %c1, align 4
  %4185 = sext i32 %4184 to i64
  %4186 = getelementptr inbounds [0 x i8]* @PL_fold, i32 0, i64 %4185
  %4187 = load i8* %4186, align 1
  %4188 = zext i8 %4187 to i32
  store i32 %4188, i32* %c2, align 4
  br label %4210

; <label>:4189                                    ; preds = %4177
  %4190 = load %struct.regnode** %text_node11, align 8
  %4191 = getelementptr inbounds %struct.regnode* %4190, i32 0, i32 1
  %4192 = load i8* %4191, align 1
  %4193 = zext i8 %4192 to i32
  %4194 = icmp eq i32 %4193, 35
  br i1 %4194, label %4201, label %4195

; <label>:4195                                    ; preds = %4189
  %4196 = load %struct.regnode** %text_node11, align 8
  %4197 = getelementptr inbounds %struct.regnode* %4196, i32 0, i32 1
  %4198 = load i8* %4197, align 1
  %4199 = zext i8 %4198 to i32
  %4200 = icmp eq i32 %4199, 49
  br i1 %4200, label %4201, label %4207

; <label>:4201                                    ; preds = %4195, %4189
  %4202 = load i32* %c1, align 4
  %4203 = sext i32 %4202 to i64
  %4204 = getelementptr inbounds [0 x i8]* @PL_fold_locale, i32 0, i64 %4203
  %4205 = load i8* %4204, align 1
  %4206 = zext i8 %4205 to i32
  store i32 %4206, i32* %c2, align 4
  br label %4209

; <label>:4207                                    ; preds = %4195
  %4208 = load i32* %c1, align 4
  store i32 %4208, i32* %c2, align 4
  br label %4209

; <label>:4209                                    ; preds = %4207, %4201
  br label %4210

; <label>:4210                                    ; preds = %4209, %4183
  br label %4211

; <label>:4211                                    ; preds = %4210, %4153
  br label %4213

; <label>:4212                                    ; preds = %3980, %3971
  store i32 -1000, i32* %c2, align 4
  store i32 -1000, i32* %c1, align 4
  br label %4213

; <label>:4213                                    ; preds = %4212, %4211
  br label %4214

; <label>:4214                                    ; preds = %4213, %3903
  br label %4215

; <label>:4215                                    ; preds = %4214, %4163
  %4216 = load i32* @PL_savestack_ix, align 4
  store i32 %4216, i32* %lastcp10, align 4
  br label %4217

; <label>:4217                                    ; preds = %4317, %4215
  %4218 = load i32* %n, align 4
  %4219 = load i32* %ln, align 4
  %4220 = icmp sge i32 %4218, %4219
  br i1 %4220, label %4221, label %4320

; <label>:4221                                    ; preds = %4217
  %4222 = load i32* %c1, align 4
  %4223 = icmp eq i32 %4222, -1000
  br i1 %4223, label %4236, label %4224

; <label>:4224                                    ; preds = %4221
  %4225 = load i8** @PL_reginput, align 8
  %4226 = load i8* %4225, align 1
  %4227 = zext i8 %4226 to i32
  %4228 = load i32* %c1, align 4
  %4229 = icmp eq i32 %4227, %4228
  br i1 %4229, label %4236, label %4230

; <label>:4230                                    ; preds = %4224
  %4231 = load i8** @PL_reginput, align 8
  %4232 = load i8* %4231, align 1
  %4233 = zext i8 %4232 to i32
  %4234 = load i32* %c2, align 4
  %4235 = icmp eq i32 %4233, %4234
  br i1 %4235, label %4236, label %4298

; <label>:4236                                    ; preds = %4230, %4224, %4221
  %4237 = load i32* %paren, align 4
  %4238 = icmp ne i32 %4237, 0
  br i1 %4238, label %4239, label %4286

; <label>:4239                                    ; preds = %4236
  %4240 = load i32* %n, align 4
  %4241 = icmp ne i32 %4240, 0
  br i1 %4241, label %4242, label %4280

; <label>:4242                                    ; preds = %4239
  %4243 = load i8* @PL_reg_match_utf8, align 1
  %4244 = sext i8 %4243 to i32
  %4245 = icmp ne i32 %4244, 0
  br i1 %4245, label %4246, label %4253

; <label>:4246                                    ; preds = %4242
  %4247 = load i8** @PL_reginput, align 8
  %4248 = load i32* %l9, align 4
  %4249 = sub nsw i32 0, %4248
  %4250 = call i32 (i8*, i32, ...)* bitcast (i32 (...)* @reghop to i32 (i8*, i32, ...)*)(i8* %4247, i32 %4249)
  %4251 = sext i32 %4250 to i64
  %4252 = inttoptr i64 %4251 to i8*
  br label %4259

; <label>:4253                                    ; preds = %4242
  %4254 = load i8** @PL_reginput, align 8
  %4255 = load i32* %l9, align 4
  %4256 = sub nsw i32 0, %4255
  %4257 = sext i32 %4256 to i64
  %4258 = getelementptr inbounds i8* %4254, i64 %4257
  br label %4259

; <label>:4259                                    ; preds = %4253, %4246
  %4260 = phi i8* [ %4252, %4246 ], [ %4258, %4253 ]
  %4261 = load i8** @PL_bostr, align 8
  %4262 = ptrtoint i8* %4260 to i64
  %4263 = ptrtoint i8* %4261 to i64
  %4264 = sub i64 %4262, %4263
  %4265 = trunc i64 %4264 to i32
  %4266 = load i32* %paren, align 4
  %4267 = sext i32 %4266 to i64
  %4268 = load i32** @PL_regstartp, align 8
  %4269 = getelementptr inbounds i32* %4268, i64 %4267
  store i32 %4265, i32* %4269, align 4
  %4270 = load i8** @PL_reginput, align 8
  %4271 = load i8** @PL_bostr, align 8
  %4272 = ptrtoint i8* %4270 to i64
  %4273 = ptrtoint i8* %4271 to i64
  %4274 = sub i64 %4272, %4273
  %4275 = trunc i64 %4274 to i32
  %4276 = load i32* %paren, align 4
  %4277 = sext i32 %4276 to i64
  %4278 = load i32** @PL_regendp, align 8
  %4279 = getelementptr inbounds i32* %4278, i64 %4277
  store i32 %4275, i32* %4279, align 4
  br label %4285

; <label>:4280                                    ; preds = %4239
  %4281 = load i32* %paren, align 4
  %4282 = sext i32 %4281 to i64
  %4283 = load i32** @PL_regendp, align 8
  %4284 = getelementptr inbounds i32* %4283, i64 %4282
  store i32 -1, i32* %4284, align 4
  br label %4285

; <label>:4285                                    ; preds = %4280, %4259
  br label %4286

; <label>:4286                                    ; preds = %4285, %4236
  %4287 = load %struct.regnode** %next, align 8
  %4288 = call i32 (%struct.regnode*, ...)* bitcast (i32 (...)* @regmatch to i32 (%struct.regnode*, ...)*)(%struct.regnode* %4287)
  %4289 = icmp ne i32 %4288, 0
  br i1 %4289, label %4290, label %4291

; <label>:4290                                    ; preds = %4286
  br label %6126

; <label>:4291                                    ; preds = %4286
  %4292 = load i32* @PL_savestack_ix, align 4
  %4293 = load i32* %lastcp10, align 4
  %4294 = icmp sgt i32 %4292, %4293
  br i1 %4294, label %4295, label %4297

; <label>:4295                                    ; preds = %4291
  %4296 = load i32* %lastcp10, align 4
  call void @Perl_leave_scope(i32 %4296)
  br label %4297

; <label>:4297                                    ; preds = %4295, %4291
  br label %4298

; <label>:4298                                    ; preds = %4297, %4230
  %4299 = load i32* %n, align 4
  %4300 = add nsw i32 %4299, -1
  store i32 %4300, i32* %n, align 4
  %4301 = load i8* @PL_reg_match_utf8, align 1
  %4302 = sext i8 %4301 to i32
  %4303 = icmp ne i32 %4302, 0
  br i1 %4303, label %4304, label %4311

; <label>:4304                                    ; preds = %4298
  %4305 = load i8** %locinput, align 8
  %4306 = load i32* %l9, align 4
  %4307 = sub nsw i32 0, %4306
  %4308 = call i32 (i8*, i32, ...)* bitcast (i32 (...)* @reghop to i32 (i8*, i32, ...)*)(i8* %4305, i32 %4307)
  %4309 = sext i32 %4308 to i64
  %4310 = inttoptr i64 %4309 to i8*
  br label %4317

; <label>:4311                                    ; preds = %4298
  %4312 = load i8** %locinput, align 8
  %4313 = load i32* %l9, align 4
  %4314 = sub nsw i32 0, %4313
  %4315 = sext i32 %4314 to i64
  %4316 = getelementptr inbounds i8* %4312, i64 %4315
  br label %4317

; <label>:4317                                    ; preds = %4311, %4304
  %4318 = phi i8* [ %4310, %4304 ], [ %4316, %4311 ]
  store i8* %4318, i8** %locinput, align 8
  %4319 = load i8** %locinput, align 8
  store i8* %4319, i8** @PL_reginput, align 8
  br label %4217

; <label>:4320                                    ; preds = %4217
  br label %4321

; <label>:4321                                    ; preds = %4320, %3902
  br label %6127

; <label>:4322                                    ; preds = %24
  %4323 = load %struct.regnode** %scan, align 8
  %4324 = getelementptr inbounds %struct.regnode* %4323, i32 0, i32 0
  %4325 = load i8* %4324, align 1
  %4326 = zext i8 %4325 to i32
  store i32 %4326, i32* %paren, align 4
  %4327 = load i32* %paren, align 4
  %4328 = load i32* @PL_regsize, align 4
  %4329 = icmp sgt i32 %4327, %4328
  br i1 %4329, label %4330, label %4332

; <label>:4330                                    ; preds = %4322
  %4331 = load i32* %paren, align 4
  store i32 %4331, i32* @PL_regsize, align 4
  br label %4332

; <label>:4332                                    ; preds = %4330, %4322
  %4333 = load i32* %paren, align 4
  %4334 = load i32** @PL_reglastparen, align 8
  %4335 = load i32* %4334, align 4
  %4336 = icmp sgt i32 %4333, %4335
  br i1 %4336, label %4337, label %4340

; <label>:4337                                    ; preds = %4332
  %4338 = load i32* %paren, align 4
  %4339 = load i32** @PL_reglastparen, align 8
  store i32 %4338, i32* %4339, align 4
  br label %4340

; <label>:4340                                    ; preds = %4337, %4332
  %4341 = load %struct.regnode** %scan, align 8
  %4342 = bitcast %struct.regnode* %4341 to %struct.regnode_2*
  %4343 = getelementptr inbounds %struct.regnode_2* %4342, i32 0, i32 3
  %4344 = load i16* %4343, align 2
  %4345 = zext i16 %4344 to i32
  store i32 %4345, i32* %ln, align 4
  %4346 = load %struct.regnode** %scan, align 8
  %4347 = bitcast %struct.regnode* %4346 to %struct.regnode_2*
  %4348 = getelementptr inbounds %struct.regnode_2* %4347, i32 0, i32 4
  %4349 = load i16* %4348, align 2
  %4350 = zext i16 %4349 to i32
  store i32 %4350, i32* %n, align 4
  %4351 = load %struct.regnode** %scan, align 8
  %4352 = getelementptr inbounds %struct.regnode* %4351, i64 1
  %4353 = getelementptr inbounds %struct.regnode* %4352, i64 1
  %4354 = call %struct.regnode* @Perl_regnext(%struct.regnode* %4353)
  store %struct.regnode* %4354, %struct.regnode** %scan, align 8
  br label %4375

; <label>:4355                                    ; preds = %24
  store i32 0, i32* %paren, align 4
  %4356 = load %struct.regnode** %scan, align 8
  %4357 = bitcast %struct.regnode* %4356 to %struct.regnode_2*
  %4358 = getelementptr inbounds %struct.regnode_2* %4357, i32 0, i32 3
  %4359 = load i16* %4358, align 2
  %4360 = zext i16 %4359 to i32
  store i32 %4360, i32* %ln, align 4
  %4361 = load %struct.regnode** %scan, align 8
  %4362 = bitcast %struct.regnode* %4361 to %struct.regnode_2*
  %4363 = getelementptr inbounds %struct.regnode_2* %4362, i32 0, i32 4
  %4364 = load i16* %4363, align 2
  %4365 = zext i16 %4364 to i32
  store i32 %4365, i32* %n, align 4
  %4366 = load %struct.regnode** %scan, align 8
  %4367 = getelementptr inbounds %struct.regnode* %4366, i64 1
  %4368 = getelementptr inbounds %struct.regnode* %4367, i64 1
  store %struct.regnode* %4368, %struct.regnode** %scan, align 8
  br label %4375

; <label>:4369                                    ; preds = %24
  store i32 0, i32* %ln, align 4
  store i32 32767, i32* %n, align 4
  %4370 = load %struct.regnode** %scan, align 8
  %4371 = getelementptr inbounds %struct.regnode* %4370, i64 1
  store %struct.regnode* %4371, %struct.regnode** %scan, align 8
  store i32 0, i32* %paren, align 4
  br label %4375

; <label>:4372                                    ; preds = %24
  store i32 1, i32* %ln, align 4
  store i32 32767, i32* %n, align 4
  %4373 = load %struct.regnode** %scan, align 8
  %4374 = getelementptr inbounds %struct.regnode* %4373, i64 1
  store %struct.regnode* %4374, %struct.regnode** %scan, align 8
  store i32 0, i32* %paren, align 4
  br label %4375

; <label>:4375                                    ; preds = %4372, %4369, %4355, %4340
  %4376 = load %struct.regnode** %next, align 8
  %4377 = getelementptr inbounds %struct.regnode* %4376, i32 0, i32 1
  %4378 = load i8* %4377, align 1
  %4379 = zext i8 %4378 to i64
  %4380 = getelementptr inbounds [0 x i8]* @PL_regkind, i32 0, i64 %4379
  %4381 = load i8* %4380, align 1
  %4382 = zext i8 %4381 to i32
  %4383 = icmp eq i32 %4382, 33
  br i1 %4383, label %4451, label %4384

; <label>:4384                                    ; preds = %4375
  %4385 = load %struct.regnode** %next, align 8
  %4386 = getelementptr inbounds %struct.regnode* %4385, i32 0, i32 1
  %4387 = load i8* %4386, align 1
  %4388 = zext i8 %4387 to i64
  %4389 = getelementptr inbounds [0 x i8]* @PL_regkind, i32 0, i64 %4388
  %4390 = load i8* %4389, align 1
  %4391 = zext i8 %4390 to i32
  %4392 = icmp eq i32 %4391, 47
  br i1 %4392, label %4451, label %4393

; <label>:4393                                    ; preds = %4384
  %4394 = load %struct.regnode** %next, align 8
  %4395 = getelementptr inbounds %struct.regnode* %4394, i32 0, i32 1
  %4396 = load i8* %4395, align 1
  %4397 = zext i8 %4396 to i32
  %4398 = icmp eq i32 %4397, 45
  br i1 %4398, label %4451, label %4399

; <label>:4399                                    ; preds = %4393
  %4400 = load %struct.regnode** %next, align 8
  %4401 = getelementptr inbounds %struct.regnode* %4400, i32 0, i32 1
  %4402 = load i8* %4401, align 1
  %4403 = zext i8 %4402 to i32
  %4404 = icmp eq i32 %4403, 46
  br i1 %4404, label %4451, label %4405

; <label>:4405                                    ; preds = %4399
  %4406 = load %struct.regnode** %next, align 8
  %4407 = getelementptr inbounds %struct.regnode* %4406, i32 0, i32 1
  %4408 = load i8* %4407, align 1
  %4409 = zext i8 %4408 to i32
  %4410 = icmp eq i32 %4409, 57
  br i1 %4410, label %4451, label %4411

; <label>:4411                                    ; preds = %4405
  %4412 = load %struct.regnode** %next, align 8
  %4413 = getelementptr inbounds %struct.regnode* %4412, i32 0, i32 1
  %4414 = load i8* %4413, align 1
  %4415 = zext i8 %4414 to i32
  %4416 = icmp eq i32 %4415, 52
  br i1 %4416, label %4451, label %4417

; <label>:4417                                    ; preds = %4411
  %4418 = load %struct.regnode** %next, align 8
  %4419 = getelementptr inbounds %struct.regnode* %4418, i32 0, i32 1
  %4420 = load i8* %4419, align 1
  %4421 = zext i8 %4420 to i32
  %4422 = icmp eq i32 %4421, 50
  br i1 %4422, label %4451, label %4423

; <label>:4423                                    ; preds = %4417
  %4424 = load %struct.regnode** %next, align 8
  %4425 = getelementptr inbounds %struct.regnode* %4424, i32 0, i32 1
  %4426 = load i8* %4425, align 1
  %4427 = zext i8 %4426 to i32
  %4428 = icmp eq i32 %4427, 39
  br i1 %4428, label %4451, label %4429

; <label>:4429                                    ; preds = %4423
  %4430 = load %struct.regnode** %next, align 8
  %4431 = getelementptr inbounds %struct.regnode* %4430, i32 0, i32 1
  %4432 = load i8* %4431, align 1
  %4433 = zext i8 %4432 to i32
  %4434 = icmp eq i32 %4433, 58
  br i1 %4434, label %4451, label %4435

; <label>:4435                                    ; preds = %4429
  %4436 = load %struct.regnode** %next, align 8
  %4437 = getelementptr inbounds %struct.regnode* %4436, i32 0, i32 1
  %4438 = load i8* %4437, align 1
  %4439 = zext i8 %4438 to i64
  %4440 = getelementptr inbounds [0 x i8]* @PL_regkind, i32 0, i64 %4439
  %4441 = load i8* %4440, align 1
  %4442 = zext i8 %4441 to i32
  %4443 = icmp eq i32 %4442, 40
  br i1 %4443, label %4444, label %4839

; <label>:4444                                    ; preds = %4435
  %4445 = load %struct.regnode** %next, align 8
  %4446 = bitcast %struct.regnode* %4445 to %struct.regnode_2*
  %4447 = getelementptr inbounds %struct.regnode_2* %4446, i32 0, i32 3
  %4448 = load i16* %4447, align 2
  %4449 = zext i16 %4448 to i32
  %4450 = icmp sgt i32 %4449, 0
  br i1 %4450, label %4451, label %4839

; <label>:4451                                    ; preds = %4444, %4429, %4423, %4417, %4411, %4405, %4399, %4393, %4384, %4375
  %4452 = load %struct.regnode** %next, align 8
  store %struct.regnode* %4452, %struct.regnode** %text_node13, align 8
  %4453 = load %struct.regnode** %text_node13, align 8
  %4454 = getelementptr inbounds %struct.regnode* %4453, i32 0, i32 1
  %4455 = load i8* %4454, align 1
  %4456 = zext i8 %4455 to i64
  %4457 = getelementptr inbounds [0 x i8]* @PL_regkind, i32 0, i64 %4456
  %4458 = load i8* %4457, align 1
  %4459 = zext i8 %4458 to i32
  %4460 = icmp eq i32 %4459, 33
  br i1 %4460, label %4599, label %4461

; <label>:4461                                    ; preds = %4451
  %4462 = load %struct.regnode** %text_node13, align 8
  %4463 = getelementptr inbounds %struct.regnode* %4462, i32 0, i32 1
  %4464 = load i8* %4463, align 1
  %4465 = zext i8 %4464 to i64
  %4466 = getelementptr inbounds [0 x i8]* @PL_regkind, i32 0, i64 %4465
  %4467 = load i8* %4466, align 1
  %4468 = zext i8 %4467 to i32
  %4469 = icmp eq i32 %4468, 47
  br i1 %4469, label %4599, label %4470

; <label>:4470                                    ; preds = %4461
  br label %4471

; <label>:4471                                    ; preds = %4597, %4470
  %4472 = load %struct.regnode** %text_node13, align 8
  %4473 = getelementptr inbounds %struct.regnode* %4472, i32 0, i32 1
  %4474 = load i8* %4473, align 1
  %4475 = zext i8 %4474 to i32
  %4476 = icmp eq i32 %4475, 45
  br i1 %4476, label %4531, label %4477

; <label>:4477                                    ; preds = %4471
  %4478 = load %struct.regnode** %text_node13, align 8
  %4479 = getelementptr inbounds %struct.regnode* %4478, i32 0, i32 1
  %4480 = load i8* %4479, align 1
  %4481 = zext i8 %4480 to i32
  %4482 = icmp eq i32 %4481, 46
  br i1 %4482, label %4531, label %4483

; <label>:4483                                    ; preds = %4477
  %4484 = load %struct.regnode** %text_node13, align 8
  %4485 = getelementptr inbounds %struct.regnode* %4484, i32 0, i32 1
  %4486 = load i8* %4485, align 1
  %4487 = zext i8 %4486 to i32
  %4488 = icmp eq i32 %4487, 57
  br i1 %4488, label %4531, label %4489

; <label>:4489                                    ; preds = %4483
  %4490 = load %struct.regnode** %text_node13, align 8
  %4491 = getelementptr inbounds %struct.regnode* %4490, i32 0, i32 1
  %4492 = load i8* %4491, align 1
  %4493 = zext i8 %4492 to i32
  %4494 = icmp eq i32 %4493, 52
  br i1 %4494, label %4531, label %4495

; <label>:4495                                    ; preds = %4489
  %4496 = load %struct.regnode** %text_node13, align 8
  %4497 = getelementptr inbounds %struct.regnode* %4496, i32 0, i32 1
  %4498 = load i8* %4497, align 1
  %4499 = zext i8 %4498 to i32
  %4500 = icmp eq i32 %4499, 50
  br i1 %4500, label %4531, label %4501

; <label>:4501                                    ; preds = %4495
  %4502 = load %struct.regnode** %text_node13, align 8
  %4503 = getelementptr inbounds %struct.regnode* %4502, i32 0, i32 1
  %4504 = load i8* %4503, align 1
  %4505 = zext i8 %4504 to i32
  %4506 = icmp eq i32 %4505, 39
  br i1 %4506, label %4531, label %4507

; <label>:4507                                    ; preds = %4501
  %4508 = load %struct.regnode** %text_node13, align 8
  %4509 = getelementptr inbounds %struct.regnode* %4508, i32 0, i32 1
  %4510 = load i8* %4509, align 1
  %4511 = zext i8 %4510 to i32
  %4512 = icmp eq i32 %4511, 58
  br i1 %4512, label %4531, label %4513

; <label>:4513                                    ; preds = %4507
  %4514 = load %struct.regnode** %text_node13, align 8
  %4515 = getelementptr inbounds %struct.regnode* %4514, i32 0, i32 1
  %4516 = load i8* %4515, align 1
  %4517 = zext i8 %4516 to i64
  %4518 = getelementptr inbounds [0 x i8]* @PL_regkind, i32 0, i64 %4517
  %4519 = load i8* %4518, align 1
  %4520 = zext i8 %4519 to i32
  %4521 = icmp eq i32 %4520, 40
  br i1 %4521, label %4522, label %4529

; <label>:4522                                    ; preds = %4513
  %4523 = load %struct.regnode** %text_node13, align 8
  %4524 = bitcast %struct.regnode* %4523 to %struct.regnode_2*
  %4525 = getelementptr inbounds %struct.regnode_2* %4524, i32 0, i32 3
  %4526 = load i16* %4525, align 2
  %4527 = zext i16 %4526 to i32
  %4528 = icmp sgt i32 %4527, 0
  br label %4529

; <label>:4529                                    ; preds = %4522, %4513
  %4530 = phi i1 [ false, %4513 ], [ %4528, %4522 ]
  br label %4531

; <label>:4531                                    ; preds = %4529, %4507, %4501, %4495, %4489, %4483, %4477, %4471
  %4532 = phi i1 [ true, %4507 ], [ true, %4501 ], [ true, %4495 ], [ true, %4489 ], [ true, %4483 ], [ true, %4477 ], [ true, %4471 ], [ %4530, %4529 ]
  br i1 %4532, label %4533, label %4598

; <label>:4533                                    ; preds = %4531
  %4534 = load %struct.regnode** %text_node13, align 8
  %4535 = getelementptr inbounds %struct.regnode* %4534, i32 0, i32 1
  %4536 = load i8* %4535, align 1
  %4537 = zext i8 %4536 to i32
  %4538 = icmp eq i32 %4537, 52
  br i1 %4538, label %4548, label %4539

; <label>:4539                                    ; preds = %4533
  %4540 = load %struct.regnode** %text_node13, align 8
  %4541 = getelementptr inbounds %struct.regnode* %4540, i32 0, i32 1
  %4542 = load i8* %4541, align 1
  %4543 = zext i8 %4542 to i64
  %4544 = getelementptr inbounds [0 x i8]* @PL_regkind, i32 0, i64 %4543
  %4545 = load i8* %4544, align 1
  %4546 = zext i8 %4545 to i32
  %4547 = icmp eq i32 %4546, 40
  br i1 %4547, label %4548, label %4552

; <label>:4548                                    ; preds = %4539, %4533
  %4549 = load %struct.regnode** %text_node13, align 8
  %4550 = getelementptr inbounds %struct.regnode* %4549, i64 1
  %4551 = getelementptr inbounds %struct.regnode* %4550, i64 1
  store %struct.regnode* %4551, %struct.regnode** %text_node13, align 8
  br label %4597

; <label>:4552                                    ; preds = %4539
  %4553 = load %struct.regnode** %text_node13, align 8
  %4554 = getelementptr inbounds %struct.regnode* %4553, i32 0, i32 1
  %4555 = load i8* %4554, align 1
  %4556 = zext i8 %4555 to i32
  %4557 = icmp eq i32 %4556, 39
  br i1 %4557, label %4558, label %4561

; <label>:4558                                    ; preds = %4552
  %4559 = load %struct.regnode** %text_node13, align 8
  %4560 = getelementptr inbounds %struct.regnode* %4559, i64 1
  store %struct.regnode* %4560, %struct.regnode** %text_node13, align 8
  br label %4596

; <label>:4561                                    ; preds = %4552
  %4562 = load %struct.regnode** %text_node13, align 8
  %4563 = getelementptr inbounds %struct.regnode* %4562, i32 0, i32 1
  %4564 = load i8* %4563, align 1
  %4565 = zext i8 %4564 to i32
  %4566 = icmp eq i32 %4565, 50
  br i1 %4566, label %4567, label %4587

; <label>:4567                                    ; preds = %4561
  %4568 = load %struct.regnode** %text_node13, align 8
  %4569 = getelementptr inbounds %struct.regnode* %4568, i32 0, i32 0
  %4570 = load i8* %4569, align 1
  %4571 = zext i8 %4570 to i32
  %4572 = icmp eq i32 %4571, 0
  br i1 %4572, label %4573, label %4577

; <label>:4573                                    ; preds = %4567
  %4574 = load %struct.regnode** %text_node13, align 8
  %4575 = getelementptr inbounds %struct.regnode* %4574, i64 1
  %4576 = getelementptr inbounds %struct.regnode* %4575, i64 1
  br label %4585

; <label>:4577                                    ; preds = %4567
  %4578 = load %struct.regnode** %text_node13, align 8
  %4579 = load %struct.regnode** %text_node13, align 8
  %4580 = bitcast %struct.regnode* %4579 to %struct.regnode_1*
  %4581 = getelementptr inbounds %struct.regnode_1* %4580, i32 0, i32 3
  %4582 = load i32* %4581, align 4
  %4583 = zext i32 %4582 to i64
  %4584 = getelementptr inbounds %struct.regnode* %4578, i64 %4583
  br label %4585

; <label>:4585                                    ; preds = %4577, %4573
  %4586 = phi %struct.regnode* [ %4576, %4573 ], [ %4584, %4577 ]
  store %struct.regnode* %4586, %struct.regnode** %text_node13, align 8
  br label %4595

; <label>:4587                                    ; preds = %4561
  %4588 = load %struct.regnode** %text_node13, align 8
  %4589 = getelementptr inbounds %struct.regnode* %4588, i32 0, i32 2
  %4590 = load i16* %4589, align 2
  %4591 = zext i16 %4590 to i32
  %4592 = load %struct.regnode** %text_node13, align 8
  %4593 = sext i32 %4591 to i64
  %4594 = getelementptr inbounds %struct.regnode* %4592, i64 %4593
  store %struct.regnode* %4594, %struct.regnode** %text_node13, align 8
  br label %4595

; <label>:4595                                    ; preds = %4587, %4585
  br label %4596

; <label>:4596                                    ; preds = %4595, %4558
  br label %4597

; <label>:4597                                    ; preds = %4596, %4548
  br label %4471

; <label>:4598                                    ; preds = %4531
  br label %4599

; <label>:4599                                    ; preds = %4598, %4461, %4451
  %4600 = load %struct.regnode** %text_node13, align 8
  %4601 = getelementptr inbounds %struct.regnode* %4600, i32 0, i32 1
  %4602 = load i8* %4601, align 1
  %4603 = zext i8 %4602 to i64
  %4604 = getelementptr inbounds [0 x i8]* @PL_regkind, i32 0, i64 %4603
  %4605 = load i8* %4604, align 1
  %4606 = zext i8 %4605 to i32
  %4607 = icmp eq i32 %4606, 33
  br i1 %4607, label %4618, label %4608

; <label>:4608                                    ; preds = %4599
  %4609 = load %struct.regnode** %text_node13, align 8
  %4610 = getelementptr inbounds %struct.regnode* %4609, i32 0, i32 1
  %4611 = load i8* %4610, align 1
  %4612 = zext i8 %4611 to i64
  %4613 = getelementptr inbounds [0 x i8]* @PL_regkind, i32 0, i64 %4612
  %4614 = load i8* %4613, align 1
  %4615 = zext i8 %4614 to i32
  %4616 = icmp eq i32 %4615, 47
  br i1 %4616, label %4618, label %4617

; <label>:4617                                    ; preds = %4608
  store i32 -1000, i32* %c2, align 4
  store i32 -1000, i32* %c1, align 4
  br label %4838

; <label>:4618                                    ; preds = %4608, %4599
  %4619 = load %struct.regnode** %text_node13, align 8
  %4620 = getelementptr inbounds %struct.regnode* %4619, i32 0, i32 1
  %4621 = load i8* %4620, align 1
  %4622 = zext i8 %4621 to i64
  %4623 = getelementptr inbounds [0 x i8]* @PL_regkind, i32 0, i64 %4622
  %4624 = load i8* %4623, align 1
  %4625 = zext i8 %4624 to i32
  %4626 = icmp eq i32 %4625, 47
  br i1 %4626, label %4627, label %4628

; <label>:4627                                    ; preds = %4618
  store i32 -1000, i32* %c2, align 4
  store i32 -1000, i32* %c1, align 4
  br label %4841

; <label>:4628                                    ; preds = %4618
  %4629 = load %struct.regnode** %text_node13, align 8
  %4630 = bitcast %struct.regnode* %4629 to %struct.regnode_string*
  %4631 = getelementptr inbounds %struct.regnode_string* %4630, i32 0, i32 3
  %4632 = getelementptr inbounds [1 x i8]* %4631, i32 0, i32 0
  store i8* %4632, i8** %s12, align 8
  br label %4633

; <label>:4633                                    ; preds = %4628
  %4634 = load i32* @PL_reg_flags, align 4
  %4635 = and i32 %4634, 8
  %4636 = icmp ne i32 %4635, 0
  br i1 %4636, label %4678, label %4637

; <label>:4637                                    ; preds = %4633
  %4638 = load i8** %s12, align 8
  %4639 = load i8* %4638, align 1
  %4640 = zext i8 %4639 to i32
  store i32 %4640, i32* %c1, align 4
  store i32 %4640, i32* %c2, align 4
  %4641 = load %struct.regnode** %text_node13, align 8
  %4642 = getelementptr inbounds %struct.regnode* %4641, i32 0, i32 1
  %4643 = load i8* %4642, align 1
  %4644 = zext i8 %4643 to i32
  %4645 = icmp eq i32 %4644, 34
  br i1 %4645, label %4652, label %4646

; <label>:4646                                    ; preds = %4637
  %4647 = load %struct.regnode** %text_node13, align 8
  %4648 = getelementptr inbounds %struct.regnode* %4647, i32 0, i32 1
  %4649 = load i8* %4648, align 1
  %4650 = zext i8 %4649 to i32
  %4651 = icmp eq i32 %4650, 48
  br i1 %4651, label %4652, label %4658

; <label>:4652                                    ; preds = %4646, %4637
  %4653 = load i32* %c1, align 4
  %4654 = sext i32 %4653 to i64
  %4655 = getelementptr inbounds [0 x i8]* @PL_fold, i32 0, i64 %4654
  %4656 = load i8* %4655, align 1
  %4657 = zext i8 %4656 to i32
  store i32 %4657, i32* %c2, align 4
  br label %4677

; <label>:4658                                    ; preds = %4646
  %4659 = load %struct.regnode** %text_node13, align 8
  %4660 = getelementptr inbounds %struct.regnode* %4659, i32 0, i32 1
  %4661 = load i8* %4660, align 1
  %4662 = zext i8 %4661 to i32
  %4663 = icmp eq i32 %4662, 35
  br i1 %4663, label %4670, label %4664

; <label>:4664                                    ; preds = %4658
  %4665 = load %struct.regnode** %text_node13, align 8
  %4666 = getelementptr inbounds %struct.regnode* %4665, i32 0, i32 1
  %4667 = load i8* %4666, align 1
  %4668 = zext i8 %4667 to i32
  %4669 = icmp eq i32 %4668, 49
  br i1 %4669, label %4670, label %4676

; <label>:4670                                    ; preds = %4664, %4658
  %4671 = load i32* %c1, align 4
  %4672 = sext i32 %4671 to i64
  %4673 = getelementptr inbounds [0 x i8]* @PL_fold_locale, i32 0, i64 %4672
  %4674 = load i8* %4673, align 1
  %4675 = zext i8 %4674 to i32
  store i32 %4675, i32* %c2, align 4
  br label %4676

; <label>:4676                                    ; preds = %4670, %4664
  br label %4677

; <label>:4677                                    ; preds = %4676, %4652
  br label %4837

; <label>:4678                                    ; preds = %4633
  %4679 = load %struct.regnode** %text_node13, align 8
  %4680 = getelementptr inbounds %struct.regnode* %4679, i32 0, i32 1
  %4681 = load i8* %4680, align 1
  %4682 = zext i8 %4681 to i32
  %4683 = icmp eq i32 %4682, 34
  br i1 %4683, label %4690, label %4684

; <label>:4684                                    ; preds = %4678
  %4685 = load %struct.regnode** %text_node13, align 8
  %4686 = getelementptr inbounds %struct.regnode* %4685, i32 0, i32 1
  %4687 = load i8* %4686, align 1
  %4688 = zext i8 %4687 to i32
  %4689 = icmp eq i32 %4688, 48
  br i1 %4689, label %4690, label %4789

; <label>:4690                                    ; preds = %4684, %4678
  %4691 = load i8** %s12, align 8
  %4692 = getelementptr inbounds [7 x i8]* %tmpbuf116, i32 0, i32 0
  %4693 = call i64 @Perl_to_utf8_lower(i8* %4691, i8* %4692, i64* %ulen114)
  %4694 = load i8** %s12, align 8
  %4695 = getelementptr inbounds [7 x i8]* %tmpbuf217, i32 0, i32 0
  %4696 = call i64 @Perl_to_utf8_upper(i8* %4694, i8* %4695, i64* %ulen215)
  %4697 = getelementptr inbounds [7 x i8]* %tmpbuf116, i32 0, i32 0
  %4698 = load volatile %struct.cop** @PL_curcop, align 8
  %4699 = getelementptr inbounds %struct.cop* %4698, i32 0, i32 14
  %4700 = load %struct.sv** %4699, align 8
  %4701 = icmp ne %struct.sv* %4700, null
  br i1 %4701, label %4702, label %4726

; <label>:4702                                    ; preds = %4690
  %4703 = load volatile %struct.cop** @PL_curcop, align 8
  %4704 = getelementptr inbounds %struct.cop* %4703, i32 0, i32 14
  %4705 = load %struct.sv** %4704, align 8
  %4706 = icmp ne %struct.sv* %4705, getelementptr inbounds (%struct.sv* null, i64 2)
  br i1 %4706, label %4707, label %4726

; <label>:4707                                    ; preds = %4702
  %4708 = load volatile %struct.cop** @PL_curcop, align 8
  %4709 = getelementptr inbounds %struct.cop* %4708, i32 0, i32 14
  %4710 = load %struct.sv** %4709, align 8
  %4711 = icmp eq %struct.sv* %4710, getelementptr inbounds (%struct.sv* null, i64 1)
  br i1 %4711, label %4738, label %4712

; <label>:4712                                    ; preds = %4707
  %4713 = load volatile %struct.cop** @PL_curcop, align 8
  %4714 = getelementptr inbounds %struct.cop* %4713, i32 0, i32 14
  %4715 = load %struct.sv** %4714, align 8
  %4716 = getelementptr inbounds %struct.sv* %4715, i32 0, i32 0
  %4717 = load i8** %4716, align 8
  %4718 = bitcast i8* %4717 to %struct.xpv*
  %4719 = getelementptr inbounds %struct.xpv* %4718, i32 0, i32 0
  %4720 = load i8** %4719, align 8
  %4721 = getelementptr inbounds i8* %4720, i64 11
  %4722 = load i8* %4721, align 1
  %4723 = sext i8 %4722 to i32
  %4724 = and i32 %4723, 1
  %4725 = icmp ne i32 %4724, 0
  br i1 %4725, label %4738, label %4726

; <label>:4726                                    ; preds = %4712, %4702, %4690
  %4727 = load volatile %struct.cop** @PL_curcop, align 8
  %4728 = getelementptr inbounds %struct.cop* %4727, i32 0, i32 14
  %4729 = load %struct.sv** %4728, align 8
  %4730 = icmp eq %struct.sv* %4729, null
  br i1 %4730, label %4731, label %4736

; <label>:4731                                    ; preds = %4726
  %4732 = load i8* @PL_dowarn, align 1
  %4733 = zext i8 %4732 to i32
  %4734 = and i32 %4733, 1
  %4735 = icmp ne i32 %4734, 0
  br label %4736

; <label>:4736                                    ; preds = %4731, %4726
  %4737 = phi i1 [ false, %4726 ], [ %4735, %4731 ]
  br label %4738

; <label>:4738                                    ; preds = %4736, %4712, %4707
  %4739 = phi i1 [ true, %4712 ], [ true, %4707 ], [ %4737, %4736 ]
  %4740 = select i1 %4739, i32 0, i32 255
  %4741 = call i64 @Perl_utf8n_to_uvuni(i8* %4697, i64 13, i64* null, i32 %4740)
  %4742 = trunc i64 %4741 to i32
  store i32 %4742, i32* %c1, align 4
  %4743 = getelementptr inbounds [7 x i8]* %tmpbuf217, i32 0, i32 0
  %4744 = load volatile %struct.cop** @PL_curcop, align 8
  %4745 = getelementptr inbounds %struct.cop* %4744, i32 0, i32 14
  %4746 = load %struct.sv** %4745, align 8
  %4747 = icmp ne %struct.sv* %4746, null
  br i1 %4747, label %4748, label %4772

; <label>:4748                                    ; preds = %4738
  %4749 = load volatile %struct.cop** @PL_curcop, align 8
  %4750 = getelementptr inbounds %struct.cop* %4749, i32 0, i32 14
  %4751 = load %struct.sv** %4750, align 8
  %4752 = icmp ne %struct.sv* %4751, getelementptr inbounds (%struct.sv* null, i64 2)
  br i1 %4752, label %4753, label %4772

; <label>:4753                                    ; preds = %4748
  %4754 = load volatile %struct.cop** @PL_curcop, align 8
  %4755 = getelementptr inbounds %struct.cop* %4754, i32 0, i32 14
  %4756 = load %struct.sv** %4755, align 8
  %4757 = icmp eq %struct.sv* %4756, getelementptr inbounds (%struct.sv* null, i64 1)
  br i1 %4757, label %4784, label %4758

; <label>:4758                                    ; preds = %4753
  %4759 = load volatile %struct.cop** @PL_curcop, align 8
  %4760 = getelementptr inbounds %struct.cop* %4759, i32 0, i32 14
  %4761 = load %struct.sv** %4760, align 8
  %4762 = getelementptr inbounds %struct.sv* %4761, i32 0, i32 0
  %4763 = load i8** %4762, align 8
  %4764 = bitcast i8* %4763 to %struct.xpv*
  %4765 = getelementptr inbounds %struct.xpv* %4764, i32 0, i32 0
  %4766 = load i8** %4765, align 8
  %4767 = getelementptr inbounds i8* %4766, i64 11
  %4768 = load i8* %4767, align 1
  %4769 = sext i8 %4768 to i32
  %4770 = and i32 %4769, 1
  %4771 = icmp ne i32 %4770, 0
  br i1 %4771, label %4784, label %4772

; <label>:4772                                    ; preds = %4758, %4748, %4738
  %4773 = load volatile %struct.cop** @PL_curcop, align 8
  %4774 = getelementptr inbounds %struct.cop* %4773, i32 0, i32 14
  %4775 = load %struct.sv** %4774, align 8
  %4776 = icmp eq %struct.sv* %4775, null
  br i1 %4776, label %4777, label %4782

; <label>:4777                                    ; preds = %4772
  %4778 = load i8* @PL_dowarn, align 1
  %4779 = zext i8 %4778 to i32
  %4780 = and i32 %4779, 1
  %4781 = icmp ne i32 %4780, 0
  br label %4782

; <label>:4782                                    ; preds = %4777, %4772
  %4783 = phi i1 [ false, %4772 ], [ %4781, %4777 ]
  br label %4784

; <label>:4784                                    ; preds = %4782, %4758, %4753
  %4785 = phi i1 [ true, %4758 ], [ true, %4753 ], [ %4783, %4782 ]
  %4786 = select i1 %4785, i32 0, i32 255
  %4787 = call i64 @Perl_utf8n_to_uvuni(i8* %4743, i64 13, i64* null, i32 %4786)
  %4788 = trunc i64 %4787 to i32
  store i32 %4788, i32* %c2, align 4
  br label %4836

; <label>:4789                                    ; preds = %4684
  %4790 = load i8** %s12, align 8
  %4791 = load volatile %struct.cop** @PL_curcop, align 8
  %4792 = getelementptr inbounds %struct.cop* %4791, i32 0, i32 14
  %4793 = load %struct.sv** %4792, align 8
  %4794 = icmp ne %struct.sv* %4793, null
  br i1 %4794, label %4795, label %4819

; <label>:4795                                    ; preds = %4789
  %4796 = load volatile %struct.cop** @PL_curcop, align 8
  %4797 = getelementptr inbounds %struct.cop* %4796, i32 0, i32 14
  %4798 = load %struct.sv** %4797, align 8
  %4799 = icmp ne %struct.sv* %4798, getelementptr inbounds (%struct.sv* null, i64 2)
  br i1 %4799, label %4800, label %4819

; <label>:4800                                    ; preds = %4795
  %4801 = load volatile %struct.cop** @PL_curcop, align 8
  %4802 = getelementptr inbounds %struct.cop* %4801, i32 0, i32 14
  %4803 = load %struct.sv** %4802, align 8
  %4804 = icmp eq %struct.sv* %4803, getelementptr inbounds (%struct.sv* null, i64 1)
  br i1 %4804, label %4831, label %4805

; <label>:4805                                    ; preds = %4800
  %4806 = load volatile %struct.cop** @PL_curcop, align 8
  %4807 = getelementptr inbounds %struct.cop* %4806, i32 0, i32 14
  %4808 = load %struct.sv** %4807, align 8
  %4809 = getelementptr inbounds %struct.sv* %4808, i32 0, i32 0
  %4810 = load i8** %4809, align 8
  %4811 = bitcast i8* %4810 to %struct.xpv*
  %4812 = getelementptr inbounds %struct.xpv* %4811, i32 0, i32 0
  %4813 = load i8** %4812, align 8
  %4814 = getelementptr inbounds i8* %4813, i64 11
  %4815 = load i8* %4814, align 1
  %4816 = sext i8 %4815 to i32
  %4817 = and i32 %4816, 1
  %4818 = icmp ne i32 %4817, 0
  br i1 %4818, label %4831, label %4819

; <label>:4819                                    ; preds = %4805, %4795, %4789
  %4820 = load volatile %struct.cop** @PL_curcop, align 8
  %4821 = getelementptr inbounds %struct.cop* %4820, i32 0, i32 14
  %4822 = load %struct.sv** %4821, align 8
  %4823 = icmp eq %struct.sv* %4822, null
  br i1 %4823, label %4824, label %4829

; <label>:4824                                    ; preds = %4819
  %4825 = load i8* @PL_dowarn, align 1
  %4826 = zext i8 %4825 to i32
  %4827 = and i32 %4826, 1
  %4828 = icmp ne i32 %4827, 0
  br label %4829

; <label>:4829                                    ; preds = %4824, %4819
  %4830 = phi i1 [ false, %4819 ], [ %4828, %4824 ]
  br label %4831

; <label>:4831                                    ; preds = %4829, %4805, %4800
  %4832 = phi i1 [ true, %4805 ], [ true, %4800 ], [ %4830, %4829 ]
  %4833 = select i1 %4832, i32 0, i32 255
  %4834 = call i64 @Perl_utf8n_to_uvuni(i8* %4790, i64 13, i64* null, i32 %4833)
  %4835 = trunc i64 %4834 to i32
  store i32 %4835, i32* %c1, align 4
  store i32 %4835, i32* %c2, align 4
  br label %4836

; <label>:4836                                    ; preds = %4831, %4784
  br label %4837

; <label>:4837                                    ; preds = %4836, %4677
  br label %4838

; <label>:4838                                    ; preds = %4837, %4617
  br label %4840

; <label>:4839                                    ; preds = %4444, %4435
  store i32 -1000, i32* %c2, align 4
  store i32 -1000, i32* %c1, align 4
  br label %4840

; <label>:4840                                    ; preds = %4839, %4838
  br label %4841

; <label>:4841                                    ; preds = %4840, %4627
  %4842 = load i8** %locinput, align 8
  store i8* %4842, i8** @PL_reginput, align 8
  %4843 = load i32* %minmod, align 4
  %4844 = icmp ne i32 %4843, 0
  br i1 %4844, label %4845, label %5473

; <label>:4845                                    ; preds = %4841
  store i32 0, i32* %minmod, align 4
  %4846 = load i32* %ln, align 4
  %4847 = icmp ne i32 %4846, 0
  br i1 %4847, label %4848, label %4855

; <label>:4848                                    ; preds = %4845
  %4849 = load %struct.regnode** %scan, align 8
  %4850 = load i32* %ln, align 4
  %4851 = call i32 (%struct.regnode*, i32, ...)* bitcast (i32 (...)* @regrepeat to i32 (%struct.regnode*, i32, ...)*)(%struct.regnode* %4849, i32 %4850)
  %4852 = load i32* %ln, align 4
  %4853 = icmp slt i32 %4851, %4852
  br i1 %4853, label %4854, label %4855

; <label>:4854                                    ; preds = %4848
  br label %6127

; <label>:4855                                    ; preds = %4848, %4845
  %4856 = load i8** @PL_reginput, align 8
  store i8* %4856, i8** %locinput, align 8
  %4857 = load i32* @PL_savestack_ix, align 4
  store i32 %4857, i32* %lastcp18, align 4
  %4858 = load i32* %c1, align 4
  %4859 = icmp ne i32 %4858, -1000
  br i1 %4859, label %4860, label %5237

; <label>:4860                                    ; preds = %4855
  %4861 = load i8** %locinput, align 8
  store i8* %4861, i8** %old, align 8
  store i32 0, i32* %count, align 4
  %4862 = load i32* %n, align 4
  %4863 = icmp eq i32 %4862, 32767
  br i1 %4863, label %4864, label %4887

; <label>:4864                                    ; preds = %4860
  %4865 = load i8** @PL_regeol, align 8
  %4866 = getelementptr inbounds i8* %4865, i64 -1
  store i8* %4866, i8** %e19, align 8
  %4867 = load i8* %do_utf8, align 1
  %4868 = icmp ne i8 %4867, 0
  br i1 %4868, label %4869, label %4886

; <label>:4869                                    ; preds = %4864
  br label %4870

; <label>:4870                                    ; preds = %4882, %4869
  %4871 = load i8** %e19, align 8
  %4872 = load i8* %4871, align 1
  %4873 = zext i8 %4872 to i32
  %4874 = icmp sge i32 %4873, 128
  br i1 %4874, label %4875, label %4880

; <label>:4875                                    ; preds = %4870
  %4876 = load i8** %e19, align 8
  %4877 = load i8* %4876, align 1
  %4878 = zext i8 %4877 to i32
  %4879 = icmp sle i32 %4878, 191
  br label %4880

; <label>:4880                                    ; preds = %4875, %4870
  %4881 = phi i1 [ false, %4870 ], [ %4879, %4875 ]
  br i1 %4881, label %4882, label %4885

; <label>:4882                                    ; preds = %4880
  %4883 = load i8** %e19, align 8
  %4884 = getelementptr inbounds i8* %4883, i32 -1
  store i8* %4884, i8** %e19, align 8
  br label %4870

; <label>:4885                                    ; preds = %4880
  br label %4886

; <label>:4886                                    ; preds = %4885, %4864
  br label %4943

; <label>:4887                                    ; preds = %4860
  %4888 = load i8* %do_utf8, align 1
  %4889 = icmp ne i8 %4888, 0
  br i1 %4889, label %4890, label %4926

; <label>:4890                                    ; preds = %4887
  %4891 = load i32* %n, align 4
  %4892 = load i32* %ln, align 4
  %4893 = sub nsw i32 %4891, %4892
  store i32 %4893, i32* %m, align 4
  %4894 = load i8** %locinput, align 8
  store i8* %4894, i8** %e19, align 8
  br label %4895

; <label>:4895                                    ; preds = %4922, %4890
  %4896 = load i32* %m, align 4
  %4897 = icmp sgt i32 %4896, 0
  br i1 %4897, label %4898, label %4910

; <label>:4898                                    ; preds = %4895
  %4899 = load i8** %e19, align 8
  %4900 = load i8** %e19, align 8
  %4901 = load i8* %4900, align 1
  %4902 = zext i8 %4901 to i64
  %4903 = getelementptr inbounds [0 x i8]* @PL_utf8skip, i32 0, i64 %4902
  %4904 = load i8* %4903, align 1
  %4905 = zext i8 %4904 to i32
  %4906 = sext i32 %4905 to i64
  %4907 = getelementptr inbounds i8* %4899, i64 %4906
  %4908 = load i8** @PL_regeol, align 8
  %4909 = icmp ule i8* %4907, %4908
  br label %4910

; <label>:4910                                    ; preds = %4898, %4895
  %4911 = phi i1 [ false, %4895 ], [ %4909, %4898 ]
  br i1 %4911, label %4912, label %4925

; <label>:4912                                    ; preds = %4910
  %4913 = load i8** %e19, align 8
  %4914 = load i8* %4913, align 1
  %4915 = zext i8 %4914 to i64
  %4916 = getelementptr inbounds [0 x i8]* @PL_utf8skip, i32 0, i64 %4915
  %4917 = load i8* %4916, align 1
  %4918 = zext i8 %4917 to i32
  %4919 = load i8** %e19, align 8
  %4920 = sext i32 %4918 to i64
  %4921 = getelementptr inbounds i8* %4919, i64 %4920
  store i8* %4921, i8** %e19, align 8
  br label %4922

; <label>:4922                                    ; preds = %4912
  %4923 = load i32* %m, align 4
  %4924 = add nsw i32 %4923, -1
  store i32 %4924, i32* %m, align 4
  br label %4895

; <label>:4925                                    ; preds = %4910
  br label %4942

; <label>:4926                                    ; preds = %4887
  %4927 = load i8** %locinput, align 8
  %4928 = load i32* %n, align 4
  %4929 = sext i32 %4928 to i64
  %4930 = getelementptr inbounds i8* %4927, i64 %4929
  %4931 = load i32* %ln, align 4
  %4932 = sext i32 %4931 to i64
  %4933 = sub i64 0, %4932
  %4934 = getelementptr inbounds i8* %4930, i64 %4933
  store i8* %4934, i8** %e19, align 8
  %4935 = load i8** %e19, align 8
  %4936 = load i8** @PL_regeol, align 8
  %4937 = icmp uge i8* %4935, %4936
  br i1 %4937, label %4938, label %4941

; <label>:4938                                    ; preds = %4926
  %4939 = load i8** @PL_regeol, align 8
  %4940 = getelementptr inbounds i8* %4939, i64 -1
  store i8* %4940, i8** %e19, align 8
  br label %4941

; <label>:4941                                    ; preds = %4938, %4926
  br label %4942

; <label>:4942                                    ; preds = %4941, %4925
  br label %4943

; <label>:4943                                    ; preds = %4942, %4886
  br label %4944

; <label>:4944                                    ; preds = %4943, %5236
  %4945 = load i8* %do_utf8, align 1
  %4946 = icmp ne i8 %4945, 0
  br i1 %4946, label %4998, label %4947

; <label>:4947                                    ; preds = %4944
  %4948 = load i32* %c1, align 4
  %4949 = load i32* %c2, align 4
  %4950 = icmp eq i32 %4948, %4949
  br i1 %4950, label %4951, label %4968

; <label>:4951                                    ; preds = %4947
  br label %4952

; <label>:4952                                    ; preds = %4964, %4951
  %4953 = load i8** %locinput, align 8
  %4954 = load i8** %e19, align 8
  %4955 = icmp ule i8* %4953, %4954
  br i1 %4955, label %4956, label %4962

; <label>:4956                                    ; preds = %4952
  %4957 = load i8** %locinput, align 8
  %4958 = load i8* %4957, align 1
  %4959 = zext i8 %4958 to i32
  %4960 = load i32* %c1, align 4
  %4961 = icmp ne i32 %4959, %4960
  br label %4962

; <label>:4962                                    ; preds = %4956, %4952
  %4963 = phi i1 [ false, %4952 ], [ %4961, %4956 ]
  br i1 %4963, label %4964, label %4967

; <label>:4964                                    ; preds = %4962
  %4965 = load i8** %locinput, align 8
  %4966 = getelementptr inbounds i8* %4965, i32 1
  store i8* %4966, i8** %locinput, align 8
  br label %4952

; <label>:4967                                    ; preds = %4962
  br label %4991

; <label>:4968                                    ; preds = %4947
  br label %4969

; <label>:4969                                    ; preds = %4987, %4968
  %4970 = load i8** %locinput, align 8
  %4971 = load i8** %e19, align 8
  %4972 = icmp ule i8* %4970, %4971
  br i1 %4972, label %4973, label %4985

; <label>:4973                                    ; preds = %4969
  %4974 = load i8** %locinput, align 8
  %4975 = load i8* %4974, align 1
  %4976 = zext i8 %4975 to i32
  %4977 = load i32* %c1, align 4
  %4978 = icmp ne i32 %4976, %4977
  br i1 %4978, label %4979, label %4985

; <label>:4979                                    ; preds = %4973
  %4980 = load i8** %locinput, align 8
  %4981 = load i8* %4980, align 1
  %4982 = zext i8 %4981 to i32
  %4983 = load i32* %c2, align 4
  %4984 = icmp ne i32 %4982, %4983
  br label %4985

; <label>:4985                                    ; preds = %4979, %4973, %4969
  %4986 = phi i1 [ false, %4973 ], [ false, %4969 ], [ %4984, %4979 ]
  br i1 %4986, label %4987, label %4990

; <label>:4987                                    ; preds = %4985
  %4988 = load i8** %locinput, align 8
  %4989 = getelementptr inbounds i8* %4988, i32 1
  store i8* %4989, i8** %locinput, align 8
  br label %4969

; <label>:4990                                    ; preds = %4985
  br label %4991

; <label>:4991                                    ; preds = %4990, %4967
  %4992 = load i8** %locinput, align 8
  %4993 = load i8** %old, align 8
  %4994 = ptrtoint i8* %4992 to i64
  %4995 = ptrtoint i8* %4993 to i64
  %4996 = sub i64 %4994, %4995
  %4997 = trunc i64 %4996 to i32
  store i32 %4997, i32* %count, align 4
  br label %5134

; <label>:4998                                    ; preds = %4944
  %4999 = load i32* %c1, align 4
  %5000 = load i32* %c2, align 4
  %5001 = icmp eq i32 %4999, %5000
  br i1 %5001, label %5002, label %5065

; <label>:5002                                    ; preds = %4998
  br label %5003

; <label>:5003                                    ; preds = %5058, %5002
  %5004 = load i8** %locinput, align 8
  %5005 = load i8** %e19, align 8
  %5006 = icmp ule i8* %5004, %5005
  br i1 %5006, label %5007, label %5056

; <label>:5007                                    ; preds = %5003
  %5008 = load i8** %locinput, align 8
  %5009 = load volatile %struct.cop** @PL_curcop, align 8
  %5010 = getelementptr inbounds %struct.cop* %5009, i32 0, i32 14
  %5011 = load %struct.sv** %5010, align 8
  %5012 = icmp ne %struct.sv* %5011, null
  br i1 %5012, label %5013, label %5037

; <label>:5013                                    ; preds = %5007
  %5014 = load volatile %struct.cop** @PL_curcop, align 8
  %5015 = getelementptr inbounds %struct.cop* %5014, i32 0, i32 14
  %5016 = load %struct.sv** %5015, align 8
  %5017 = icmp ne %struct.sv* %5016, getelementptr inbounds (%struct.sv* null, i64 2)
  br i1 %5017, label %5018, label %5037

; <label>:5018                                    ; preds = %5013
  %5019 = load volatile %struct.cop** @PL_curcop, align 8
  %5020 = getelementptr inbounds %struct.cop* %5019, i32 0, i32 14
  %5021 = load %struct.sv** %5020, align 8
  %5022 = icmp eq %struct.sv* %5021, getelementptr inbounds (%struct.sv* null, i64 1)
  br i1 %5022, label %5049, label %5023

; <label>:5023                                    ; preds = %5018
  %5024 = load volatile %struct.cop** @PL_curcop, align 8
  %5025 = getelementptr inbounds %struct.cop* %5024, i32 0, i32 14
  %5026 = load %struct.sv** %5025, align 8
  %5027 = getelementptr inbounds %struct.sv* %5026, i32 0, i32 0
  %5028 = load i8** %5027, align 8
  %5029 = bitcast i8* %5028 to %struct.xpv*
  %5030 = getelementptr inbounds %struct.xpv* %5029, i32 0, i32 0
  %5031 = load i8** %5030, align 8
  %5032 = getelementptr inbounds i8* %5031, i64 11
  %5033 = load i8* %5032, align 1
  %5034 = sext i8 %5033 to i32
  %5035 = and i32 %5034, 1
  %5036 = icmp ne i32 %5035, 0
  br i1 %5036, label %5049, label %5037

; <label>:5037                                    ; preds = %5023, %5013, %5007
  %5038 = load volatile %struct.cop** @PL_curcop, align 8
  %5039 = getelementptr inbounds %struct.cop* %5038, i32 0, i32 14
  %5040 = load %struct.sv** %5039, align 8
  %5041 = icmp eq %struct.sv* %5040, null
  br i1 %5041, label %5042, label %5047

; <label>:5042                                    ; preds = %5037
  %5043 = load i8* @PL_dowarn, align 1
  %5044 = zext i8 %5043 to i32
  %5045 = and i32 %5044, 1
  %5046 = icmp ne i32 %5045, 0
  br label %5047

; <label>:5047                                    ; preds = %5042, %5037
  %5048 = phi i1 [ false, %5037 ], [ %5046, %5042 ]
  br label %5049

; <label>:5049                                    ; preds = %5047, %5023, %5018
  %5050 = phi i1 [ true, %5023 ], [ true, %5018 ], [ %5048, %5047 ]
  %5051 = select i1 %5050, i32 0, i32 255
  %5052 = call i64 @Perl_utf8n_to_uvuni(i8* %5008, i64 13, i64* %len20, i32 %5051)
  %5053 = load i32* %c1, align 4
  %5054 = sext i32 %5053 to i64
  %5055 = icmp ne i64 %5052, %5054
  br label %5056

; <label>:5056                                    ; preds = %5049, %5003
  %5057 = phi i1 [ false, %5003 ], [ %5055, %5049 ]
  br i1 %5057, label %5058, label %5064

; <label>:5058                                    ; preds = %5056
  %5059 = load i64* %len20, align 8
  %5060 = load i8** %locinput, align 8
  %5061 = getelementptr inbounds i8* %5060, i64 %5059
  store i8* %5061, i8** %locinput, align 8
  %5062 = load i32* %count, align 4
  %5063 = add nsw i32 %5062, 1
  store i32 %5063, i32* %count, align 4
  br label %5003

; <label>:5064                                    ; preds = %5056
  br label %5133

; <label>:5065                                    ; preds = %4998
  br label %5066

; <label>:5066                                    ; preds = %5126, %5065
  %5067 = load i8** %locinput, align 8
  %5068 = load i8** %e19, align 8
  %5069 = icmp ule i8* %5067, %5068
  br i1 %5069, label %5070, label %5132

; <label>:5070                                    ; preds = %5066
  %5071 = load i8** %locinput, align 8
  %5072 = load volatile %struct.cop** @PL_curcop, align 8
  %5073 = getelementptr inbounds %struct.cop* %5072, i32 0, i32 14
  %5074 = load %struct.sv** %5073, align 8
  %5075 = icmp ne %struct.sv* %5074, null
  br i1 %5075, label %5076, label %5100

; <label>:5076                                    ; preds = %5070
  %5077 = load volatile %struct.cop** @PL_curcop, align 8
  %5078 = getelementptr inbounds %struct.cop* %5077, i32 0, i32 14
  %5079 = load %struct.sv** %5078, align 8
  %5080 = icmp ne %struct.sv* %5079, getelementptr inbounds (%struct.sv* null, i64 2)
  br i1 %5080, label %5081, label %5100

; <label>:5081                                    ; preds = %5076
  %5082 = load volatile %struct.cop** @PL_curcop, align 8
  %5083 = getelementptr inbounds %struct.cop* %5082, i32 0, i32 14
  %5084 = load %struct.sv** %5083, align 8
  %5085 = icmp eq %struct.sv* %5084, getelementptr inbounds (%struct.sv* null, i64 1)
  br i1 %5085, label %5112, label %5086

; <label>:5086                                    ; preds = %5081
  %5087 = load volatile %struct.cop** @PL_curcop, align 8
  %5088 = getelementptr inbounds %struct.cop* %5087, i32 0, i32 14
  %5089 = load %struct.sv** %5088, align 8
  %5090 = getelementptr inbounds %struct.sv* %5089, i32 0, i32 0
  %5091 = load i8** %5090, align 8
  %5092 = bitcast i8* %5091 to %struct.xpv*
  %5093 = getelementptr inbounds %struct.xpv* %5092, i32 0, i32 0
  %5094 = load i8** %5093, align 8
  %5095 = getelementptr inbounds i8* %5094, i64 11
  %5096 = load i8* %5095, align 1
  %5097 = sext i8 %5096 to i32
  %5098 = and i32 %5097, 1
  %5099 = icmp ne i32 %5098, 0
  br i1 %5099, label %5112, label %5100

; <label>:5100                                    ; preds = %5086, %5076, %5070
  %5101 = load volatile %struct.cop** @PL_curcop, align 8
  %5102 = getelementptr inbounds %struct.cop* %5101, i32 0, i32 14
  %5103 = load %struct.sv** %5102, align 8
  %5104 = icmp eq %struct.sv* %5103, null
  br i1 %5104, label %5105, label %5110

; <label>:5105                                    ; preds = %5100
  %5106 = load i8* @PL_dowarn, align 1
  %5107 = zext i8 %5106 to i32
  %5108 = and i32 %5107, 1
  %5109 = icmp ne i32 %5108, 0
  br label %5110

; <label>:5110                                    ; preds = %5105, %5100
  %5111 = phi i1 [ false, %5100 ], [ %5109, %5105 ]
  br label %5112

; <label>:5112                                    ; preds = %5110, %5086, %5081
  %5113 = phi i1 [ true, %5086 ], [ true, %5081 ], [ %5111, %5110 ]
  %5114 = select i1 %5113, i32 0, i32 255
  %5115 = call i64 @Perl_utf8n_to_uvuni(i8* %5071, i64 13, i64* %len20, i32 %5114)
  store i64 %5115, i64* %c, align 8
  %5116 = load i64* %c, align 8
  %5117 = load i32* %c1, align 4
  %5118 = sext i32 %5117 to i64
  %5119 = icmp eq i64 %5116, %5118
  br i1 %5119, label %5125, label %5120

; <label>:5120                                    ; preds = %5112
  %5121 = load i64* %c, align 8
  %5122 = load i32* %c2, align 4
  %5123 = sext i32 %5122 to i64
  %5124 = icmp eq i64 %5121, %5123
  br i1 %5124, label %5125, label %5126

; <label>:5125                                    ; preds = %5120, %5112
  br label %5132

; <label>:5126                                    ; preds = %5120
  %5127 = load i64* %len20, align 8
  %5128 = load i8** %locinput, align 8
  %5129 = getelementptr inbounds i8* %5128, i64 %5127
  store i8* %5129, i8** %locinput, align 8
  %5130 = load i32* %count, align 4
  %5131 = add nsw i32 %5130, 1
  store i32 %5131, i32* %count, align 4
  br label %5066

; <label>:5132                                    ; preds = %5125, %5066
  br label %5133

; <label>:5133                                    ; preds = %5132, %5064
  br label %5134

; <label>:5134                                    ; preds = %5133, %4991
  %5135 = load i8** %locinput, align 8
  %5136 = load i8** %e19, align 8
  %5137 = icmp ugt i8* %5135, %5136
  br i1 %5137, label %5138, label %5139

; <label>:5138                                    ; preds = %5134
  br label %6127

; <label>:5139                                    ; preds = %5134
  %5140 = load i8** %locinput, align 8
  %5141 = load i8** %old, align 8
  %5142 = icmp ne i8* %5140, %5141
  br i1 %5142, label %5143, label %5151

; <label>:5143                                    ; preds = %5139
  store i32 1, i32* %ln, align 4
  %5144 = load %struct.regnode** %scan, align 8
  %5145 = load i32* %count, align 4
  %5146 = call i32 (%struct.regnode*, i32, ...)* bitcast (i32 (...)* @regrepeat to i32 (%struct.regnode*, i32, ...)*)(%struct.regnode* %5144, i32 %5145)
  %5147 = load i32* %count, align 4
  %5148 = icmp slt i32 %5146, %5147
  br i1 %5148, label %5149, label %5150

; <label>:5149                                    ; preds = %5143
  br label %6127

; <label>:5150                                    ; preds = %5143
  br label %5151

; <label>:5151                                    ; preds = %5150, %5139
  %5152 = load i32* %paren, align 4
  %5153 = icmp ne i32 %5152, 0
  br i1 %5153, label %5154, label %5196

; <label>:5154                                    ; preds = %5151
  %5155 = load i32* %ln, align 4
  %5156 = icmp ne i32 %5155, 0
  br i1 %5156, label %5157, label %5190

; <label>:5157                                    ; preds = %5154
  %5158 = load i8* @PL_reg_match_utf8, align 1
  %5159 = sext i8 %5158 to i32
  %5160 = icmp ne i32 %5159, 0
  br i1 %5160, label %5161, label %5166

; <label>:5161                                    ; preds = %5157
  %5162 = load i8** %locinput, align 8
  %5163 = call i32 (i8*, i32, ...)* bitcast (i32 (...)* @reghop to i32 (i8*, i32, ...)*)(i8* %5162, i32 -1)
  %5164 = sext i32 %5163 to i64
  %5165 = inttoptr i64 %5164 to i8*
  br label %5169

; <label>:5166                                    ; preds = %5157
  %5167 = load i8** %locinput, align 8
  %5168 = getelementptr inbounds i8* %5167, i64 -1
  br label %5169

; <label>:5169                                    ; preds = %5166, %5161
  %5170 = phi i8* [ %5165, %5161 ], [ %5168, %5166 ]
  %5171 = load i8** @PL_bostr, align 8
  %5172 = ptrtoint i8* %5170 to i64
  %5173 = ptrtoint i8* %5171 to i64
  %5174 = sub i64 %5172, %5173
  %5175 = trunc i64 %5174 to i32
  %5176 = load i32* %paren, align 4
  %5177 = sext i32 %5176 to i64
  %5178 = load i32** @PL_regstartp, align 8
  %5179 = getelementptr inbounds i32* %5178, i64 %5177
  store i32 %5175, i32* %5179, align 4
  %5180 = load i8** %locinput, align 8
  %5181 = load i8** @PL_bostr, align 8
  %5182 = ptrtoint i8* %5180 to i64
  %5183 = ptrtoint i8* %5181 to i64
  %5184 = sub i64 %5182, %5183
  %5185 = trunc i64 %5184 to i32
  %5186 = load i32* %paren, align 4
  %5187 = sext i32 %5186 to i64
  %5188 = load i32** @PL_regendp, align 8
  %5189 = getelementptr inbounds i32* %5188, i64 %5187
  store i32 %5185, i32* %5189, align 4
  br label %5195

; <label>:5190                                    ; preds = %5154
  %5191 = load i32* %paren, align 4
  %5192 = sext i32 %5191 to i64
  %5193 = load i32** @PL_regendp, align 8
  %5194 = getelementptr inbounds i32* %5193, i64 %5192
  store i32 -1, i32* %5194, align 4
  br label %5195

; <label>:5195                                    ; preds = %5190, %5169
  br label %5196

; <label>:5196                                    ; preds = %5195, %5151
  %5197 = load %struct.regnode** %next, align 8
  %5198 = call i32 (%struct.regnode*, ...)* bitcast (i32 (...)* @regmatch to i32 (%struct.regnode*, ...)*)(%struct.regnode* %5197)
  %5199 = icmp ne i32 %5198, 0
  br i1 %5199, label %5200, label %5201

; <label>:5200                                    ; preds = %5196
  br label %6126

; <label>:5201                                    ; preds = %5196
  %5202 = load i32* %paren, align 4
  %5203 = icmp ne i32 %5202, 0
  br i1 %5203, label %5204, label %5212

; <label>:5204                                    ; preds = %5201
  %5205 = load i32* %ln, align 4
  %5206 = icmp ne i32 %5205, 0
  br i1 %5206, label %5207, label %5212

; <label>:5207                                    ; preds = %5204
  %5208 = load i32* %paren, align 4
  %5209 = sext i32 %5208 to i64
  %5210 = load i32** @PL_regendp, align 8
  %5211 = getelementptr inbounds i32* %5210, i64 %5209
  store i32 -1, i32* %5211, align 4
  br label %5212

; <label>:5212                                    ; preds = %5207, %5204, %5201
  %5213 = load i8** %locinput, align 8
  store i8* %5213, i8** @PL_reginput, align 8
  %5214 = load i32* @PL_savestack_ix, align 4
  %5215 = load i32* %lastcp18, align 4
  %5216 = icmp sgt i32 %5214, %5215
  br i1 %5216, label %5217, label %5219

; <label>:5217                                    ; preds = %5212
  %5218 = load i32* %lastcp18, align 4
  call void @Perl_leave_scope(i32 %5218)
  br label %5219

; <label>:5219                                    ; preds = %5217, %5212
  %5220 = load i8** %locinput, align 8
  store i8* %5220, i8** %old, align 8
  %5221 = load i8* %do_utf8, align 1
  %5222 = icmp ne i8 %5221, 0
  br i1 %5222, label %5223, label %5233

; <label>:5223                                    ; preds = %5219
  %5224 = load i8** %locinput, align 8
  %5225 = load i8* %5224, align 1
  %5226 = zext i8 %5225 to i64
  %5227 = getelementptr inbounds [0 x i8]* @PL_utf8skip, i32 0, i64 %5226
  %5228 = load i8* %5227, align 1
  %5229 = zext i8 %5228 to i32
  %5230 = load i8** %locinput, align 8
  %5231 = sext i32 %5229 to i64
  %5232 = getelementptr inbounds i8* %5230, i64 %5231
  store i8* %5232, i8** %locinput, align 8
  br label %5236

; <label>:5233                                    ; preds = %5219
  %5234 = load i8** %locinput, align 8
  %5235 = getelementptr inbounds i8* %5234, i32 1
  store i8* %5235, i8** %locinput, align 8
  br label %5236

; <label>:5236                                    ; preds = %5233, %5223
  store i32 1, i32* %count, align 4
  br label %4944

; <label>:5237                                    ; preds = %4855
  br label %5238

; <label>:5238                                    ; preds = %5470, %5237
  %5239 = load i32* %n, align 4
  %5240 = load i32* %ln, align 4
  %5241 = icmp sge i32 %5239, %5240
  br i1 %5241, label %5250, label %5242

; <label>:5242                                    ; preds = %5238
  %5243 = load i32* %n, align 4
  %5244 = icmp eq i32 %5243, 32767
  br i1 %5244, label %5245, label %5248

; <label>:5245                                    ; preds = %5242
  %5246 = load i32* %ln, align 4
  %5247 = icmp sgt i32 %5246, 0
  br label %5248

; <label>:5248                                    ; preds = %5245, %5242
  %5249 = phi i1 [ false, %5242 ], [ %5247, %5245 ]
  br label %5250

; <label>:5250                                    ; preds = %5248, %5238
  %5251 = phi i1 [ true, %5238 ], [ %5249, %5248 ]
  br i1 %5251, label %5252, label %5471

; <label>:5252                                    ; preds = %5250
  %5253 = load i32* %c1, align 4
  %5254 = icmp ne i32 %5253, -1000
  br i1 %5254, label %5255, label %5388

; <label>:5255                                    ; preds = %5252
  %5256 = load i8* %do_utf8, align 1
  %5257 = icmp ne i8 %5256, 0
  br i1 %5257, label %5258, label %5304

; <label>:5258                                    ; preds = %5255
  %5259 = load i8** @PL_reginput, align 8
  %5260 = load volatile %struct.cop** @PL_curcop, align 8
  %5261 = getelementptr inbounds %struct.cop* %5260, i32 0, i32 14
  %5262 = load %struct.sv** %5261, align 8
  %5263 = icmp ne %struct.sv* %5262, null
  br i1 %5263, label %5264, label %5288

; <label>:5264                                    ; preds = %5258
  %5265 = load volatile %struct.cop** @PL_curcop, align 8
  %5266 = getelementptr inbounds %struct.cop* %5265, i32 0, i32 14
  %5267 = load %struct.sv** %5266, align 8
  %5268 = icmp ne %struct.sv* %5267, getelementptr inbounds (%struct.sv* null, i64 2)
  br i1 %5268, label %5269, label %5288

; <label>:5269                                    ; preds = %5264
  %5270 = load volatile %struct.cop** @PL_curcop, align 8
  %5271 = getelementptr inbounds %struct.cop* %5270, i32 0, i32 14
  %5272 = load %struct.sv** %5271, align 8
  %5273 = icmp eq %struct.sv* %5272, getelementptr inbounds (%struct.sv* null, i64 1)
  br i1 %5273, label %5300, label %5274

; <label>:5274                                    ; preds = %5269
  %5275 = load volatile %struct.cop** @PL_curcop, align 8
  %5276 = getelementptr inbounds %struct.cop* %5275, i32 0, i32 14
  %5277 = load %struct.sv** %5276, align 8
  %5278 = getelementptr inbounds %struct.sv* %5277, i32 0, i32 0
  %5279 = load i8** %5278, align 8
  %5280 = bitcast i8* %5279 to %struct.xpv*
  %5281 = getelementptr inbounds %struct.xpv* %5280, i32 0, i32 0
  %5282 = load i8** %5281, align 8
  %5283 = getelementptr inbounds i8* %5282, i64 11
  %5284 = load i8* %5283, align 1
  %5285 = sext i8 %5284 to i32
  %5286 = and i32 %5285, 1
  %5287 = icmp ne i32 %5286, 0
  br i1 %5287, label %5300, label %5288

; <label>:5288                                    ; preds = %5274, %5264, %5258
  %5289 = load volatile %struct.cop** @PL_curcop, align 8
  %5290 = getelementptr inbounds %struct.cop* %5289, i32 0, i32 14
  %5291 = load %struct.sv** %5290, align 8
  %5292 = icmp eq %struct.sv* %5291, null
  br i1 %5292, label %5293, label %5298

; <label>:5293                                    ; preds = %5288
  %5294 = load i8* @PL_dowarn, align 1
  %5295 = zext i8 %5294 to i32
  %5296 = and i32 %5295, 1
  %5297 = icmp ne i32 %5296, 0
  br label %5298

; <label>:5298                                    ; preds = %5293, %5288
  %5299 = phi i1 [ false, %5288 ], [ %5297, %5293 ]
  br label %5300

; <label>:5300                                    ; preds = %5298, %5274, %5269
  %5301 = phi i1 [ true, %5274 ], [ true, %5269 ], [ %5299, %5298 ]
  %5302 = select i1 %5301, i32 0, i32 255
  %5303 = call i64 @Perl_utf8n_to_uvuni(i8* %5259, i64 13, i64* null, i32 %5302)
  store i64 %5303, i64* %c21, align 8
  br label %5309

; <label>:5304                                    ; preds = %5255
  %5305 = load i8** @PL_reginput, align 8
  %5306 = load i8* %5305, align 1
  %5307 = zext i8 %5306 to i32
  %5308 = sext i32 %5307 to i64
  store i64 %5308, i64* %c21, align 8
  br label %5309

; <label>:5309                                    ; preds = %5304, %5300
  %5310 = load i64* %c21, align 8
  %5311 = load i32* %c1, align 4
  %5312 = sext i32 %5311 to i64
  %5313 = icmp eq i64 %5310, %5312
  br i1 %5313, label %5319, label %5314

; <label>:5314                                    ; preds = %5309
  %5315 = load i64* %c21, align 8
  %5316 = load i32* %c2, align 4
  %5317 = sext i32 %5316 to i64
  %5318 = icmp eq i64 %5315, %5317
  br i1 %5318, label %5319, label %5387

; <label>:5319                                    ; preds = %5314, %5309
  %5320 = load i32* %paren, align 4
  %5321 = icmp ne i32 %5320, 0
  br i1 %5321, label %5322, label %5364

; <label>:5322                                    ; preds = %5319
  %5323 = load i32* %ln, align 4
  %5324 = icmp ne i32 %5323, 0
  br i1 %5324, label %5325, label %5358

; <label>:5325                                    ; preds = %5322
  %5326 = load i8* @PL_reg_match_utf8, align 1
  %5327 = sext i8 %5326 to i32
  %5328 = icmp ne i32 %5327, 0
  br i1 %5328, label %5329, label %5334

; <label>:5329                                    ; preds = %5325
  %5330 = load i8** @PL_reginput, align 8
  %5331 = call i32 (i8*, i32, ...)* bitcast (i32 (...)* @reghop to i32 (i8*, i32, ...)*)(i8* %5330, i32 -1)
  %5332 = sext i32 %5331 to i64
  %5333 = inttoptr i64 %5332 to i8*
  br label %5337

; <label>:5334                                    ; preds = %5325
  %5335 = load i8** @PL_reginput, align 8
  %5336 = getelementptr inbounds i8* %5335, i64 -1
  br label %5337

; <label>:5337                                    ; preds = %5334, %5329
  %5338 = phi i8* [ %5333, %5329 ], [ %5336, %5334 ]
  %5339 = load i8** @PL_bostr, align 8
  %5340 = ptrtoint i8* %5338 to i64
  %5341 = ptrtoint i8* %5339 to i64
  %5342 = sub i64 %5340, %5341
  %5343 = trunc i64 %5342 to i32
  %5344 = load i32* %paren, align 4
  %5345 = sext i32 %5344 to i64
  %5346 = load i32** @PL_regstartp, align 8
  %5347 = getelementptr inbounds i32* %5346, i64 %5345
  store i32 %5343, i32* %5347, align 4
  %5348 = load i8** @PL_reginput, align 8
  %5349 = load i8** @PL_bostr, align 8
  %5350 = ptrtoint i8* %5348 to i64
  %5351 = ptrtoint i8* %5349 to i64
  %5352 = sub i64 %5350, %5351
  %5353 = trunc i64 %5352 to i32
  %5354 = load i32* %paren, align 4
  %5355 = sext i32 %5354 to i64
  %5356 = load i32** @PL_regendp, align 8
  %5357 = getelementptr inbounds i32* %5356, i64 %5355
  store i32 %5353, i32* %5357, align 4
  br label %5363

; <label>:5358                                    ; preds = %5322
  %5359 = load i32* %paren, align 4
  %5360 = sext i32 %5359 to i64
  %5361 = load i32** @PL_regendp, align 8
  %5362 = getelementptr inbounds i32* %5361, i64 %5360
  store i32 -1, i32* %5362, align 4
  br label %5363

; <label>:5363                                    ; preds = %5358, %5337
  br label %5364

; <label>:5364                                    ; preds = %5363, %5319
  %5365 = load %struct.regnode** %next, align 8
  %5366 = call i32 (%struct.regnode*, ...)* bitcast (i32 (...)* @regmatch to i32 (%struct.regnode*, ...)*)(%struct.regnode* %5365)
  %5367 = icmp ne i32 %5366, 0
  br i1 %5367, label %5368, label %5369

; <label>:5368                                    ; preds = %5364
  br label %6126

; <label>:5369                                    ; preds = %5364
  %5370 = load i32* %paren, align 4
  %5371 = icmp ne i32 %5370, 0
  br i1 %5371, label %5372, label %5380

; <label>:5372                                    ; preds = %5369
  %5373 = load i32* %ln, align 4
  %5374 = icmp ne i32 %5373, 0
  br i1 %5374, label %5375, label %5380

; <label>:5375                                    ; preds = %5372
  %5376 = load i32* %paren, align 4
  %5377 = sext i32 %5376 to i64
  %5378 = load i32** @PL_regendp, align 8
  %5379 = getelementptr inbounds i32* %5378, i64 %5377
  store i32 -1, i32* %5379, align 4
  br label %5380

; <label>:5380                                    ; preds = %5375, %5372, %5369
  %5381 = load i32* @PL_savestack_ix, align 4
  %5382 = load i32* %lastcp18, align 4
  %5383 = icmp sgt i32 %5381, %5382
  br i1 %5383, label %5384, label %5386

; <label>:5384                                    ; preds = %5380
  %5385 = load i32* %lastcp18, align 4
  call void @Perl_leave_scope(i32 %5385)
  br label %5386

; <label>:5386                                    ; preds = %5384, %5380
  br label %5387

; <label>:5387                                    ; preds = %5386, %5314
  br label %5460

; <label>:5388                                    ; preds = %5252
  %5389 = load i32* %c1, align 4
  %5390 = icmp eq i32 %5389, -1000
  br i1 %5390, label %5391, label %5459

; <label>:5391                                    ; preds = %5388
  %5392 = load i32* %paren, align 4
  %5393 = icmp ne i32 %5392, 0
  br i1 %5393, label %5394, label %5436

; <label>:5394                                    ; preds = %5391
  %5395 = load i32* %ln, align 4
  %5396 = icmp ne i32 %5395, 0
  br i1 %5396, label %5397, label %5430

; <label>:5397                                    ; preds = %5394
  %5398 = load i8* @PL_reg_match_utf8, align 1
  %5399 = sext i8 %5398 to i32
  %5400 = icmp ne i32 %5399, 0
  br i1 %5400, label %5401, label %5406

; <label>:5401                                    ; preds = %5397
  %5402 = load i8** @PL_reginput, align 8
  %5403 = call i32 (i8*, i32, ...)* bitcast (i32 (...)* @reghop to i32 (i8*, i32, ...)*)(i8* %5402, i32 -1)
  %5404 = sext i32 %5403 to i64
  %5405 = inttoptr i64 %5404 to i8*
  br label %5409

; <label>:5406                                    ; preds = %5397
  %5407 = load i8** @PL_reginput, align 8
  %5408 = getelementptr inbounds i8* %5407, i64 -1
  br label %5409

; <label>:5409                                    ; preds = %5406, %5401
  %5410 = phi i8* [ %5405, %5401 ], [ %5408, %5406 ]
  %5411 = load i8** @PL_bostr, align 8
  %5412 = ptrtoint i8* %5410 to i64
  %5413 = ptrtoint i8* %5411 to i64
  %5414 = sub i64 %5412, %5413
  %5415 = trunc i64 %5414 to i32
  %5416 = load i32* %paren, align 4
  %5417 = sext i32 %5416 to i64
  %5418 = load i32** @PL_regstartp, align 8
  %5419 = getelementptr inbounds i32* %5418, i64 %5417
  store i32 %5415, i32* %5419, align 4
  %5420 = load i8** @PL_reginput, align 8
  %5421 = load i8** @PL_bostr, align 8
  %5422 = ptrtoint i8* %5420 to i64
  %5423 = ptrtoint i8* %5421 to i64
  %5424 = sub i64 %5422, %5423
  %5425 = trunc i64 %5424 to i32
  %5426 = load i32* %paren, align 4
  %5427 = sext i32 %5426 to i64
  %5428 = load i32** @PL_regendp, align 8
  %5429 = getelementptr inbounds i32* %5428, i64 %5427
  store i32 %5425, i32* %5429, align 4
  br label %5435

; <label>:5430                                    ; preds = %5394
  %5431 = load i32* %paren, align 4
  %5432 = sext i32 %5431 to i64
  %5433 = load i32** @PL_regendp, align 8
  %5434 = getelementptr inbounds i32* %5433, i64 %5432
  store i32 -1, i32* %5434, align 4
  br label %5435

; <label>:5435                                    ; preds = %5430, %5409
  br label %5436

; <label>:5436                                    ; preds = %5435, %5391
  %5437 = load %struct.regnode** %next, align 8
  %5438 = call i32 (%struct.regnode*, ...)* bitcast (i32 (...)* @regmatch to i32 (%struct.regnode*, ...)*)(%struct.regnode* %5437)
  %5439 = icmp ne i32 %5438, 0
  br i1 %5439, label %5440, label %5441

; <label>:5440                                    ; preds = %5436
  br label %6126

; <label>:5441                                    ; preds = %5436
  %5442 = load i32* %paren, align 4
  %5443 = icmp ne i32 %5442, 0
  br i1 %5443, label %5444, label %5452

; <label>:5444                                    ; preds = %5441
  %5445 = load i32* %ln, align 4
  %5446 = icmp ne i32 %5445, 0
  br i1 %5446, label %5447, label %5452

; <label>:5447                                    ; preds = %5444
  %5448 = load i32* %paren, align 4
  %5449 = sext i32 %5448 to i64
  %5450 = load i32** @PL_regendp, align 8
  %5451 = getelementptr inbounds i32* %5450, i64 %5449
  store i32 -1, i32* %5451, align 4
  br label %5452

; <label>:5452                                    ; preds = %5447, %5444, %5441
  %5453 = load i32* @PL_savestack_ix, align 4
  %5454 = load i32* %lastcp18, align 4
  %5455 = icmp sgt i32 %5453, %5454
  br i1 %5455, label %5456, label %5458

; <label>:5456                                    ; preds = %5452
  %5457 = load i32* %lastcp18, align 4
  call void @Perl_leave_scope(i32 %5457)
  br label %5458

; <label>:5458                                    ; preds = %5456, %5452
  br label %5459

; <label>:5459                                    ; preds = %5458, %5388
  br label %5460

; <label>:5460                                    ; preds = %5459, %5387
  %5461 = load i8** %locinput, align 8
  store i8* %5461, i8** @PL_reginput, align 8
  %5462 = load %struct.regnode** %scan, align 8
  %5463 = call i32 (%struct.regnode*, i32, ...)* bitcast (i32 (...)* @regrepeat to i32 (%struct.regnode*, i32, ...)*)(%struct.regnode* %5462, i32 1)
  %5464 = icmp ne i32 %5463, 0
  br i1 %5464, label %5465, label %5469

; <label>:5465                                    ; preds = %5460
  %5466 = load i32* %ln, align 4
  %5467 = add nsw i32 %5466, 1
  store i32 %5467, i32* %ln, align 4
  %5468 = load i8** @PL_reginput, align 8
  store i8* %5468, i8** %locinput, align 8
  br label %5470

; <label>:5469                                    ; preds = %5460
  br label %6127

; <label>:5470                                    ; preds = %5465
  br label %5238

; <label>:5471                                    ; preds = %5250
  br label %5472

; <label>:5472                                    ; preds = %5471
  br label %5855

; <label>:5473                                    ; preds = %4841
  %5474 = load %struct.regnode** %scan, align 8
  %5475 = load i32* %n, align 4
  %5476 = call i32 (%struct.regnode*, i32, ...)* bitcast (i32 (...)* @regrepeat to i32 (%struct.regnode*, i32, ...)*)(%struct.regnode* %5474, i32 %5475)
  store i32 %5476, i32* %n, align 4
  %5477 = load i8** @PL_reginput, align 8
  store i8* %5477, i8** %locinput, align 8
  %5478 = load i32* %ln, align 4
  %5479 = load i32* %n, align 4
  %5480 = icmp slt i32 %5478, %5479
  br i1 %5480, label %5481, label %5528

; <label>:5481                                    ; preds = %5473
  %5482 = load %struct.regnode** %next, align 8
  %5483 = getelementptr inbounds %struct.regnode* %5482, i32 0, i32 1
  %5484 = load i8* %5483, align 1
  %5485 = zext i8 %5484 to i64
  %5486 = getelementptr inbounds [0 x i8]* @PL_regkind, i32 0, i64 %5485
  %5487 = load i8* %5486, align 1
  %5488 = zext i8 %5487 to i32
  %5489 = icmp eq i32 %5488, 6
  br i1 %5489, label %5490, label %5528

; <label>:5490                                    ; preds = %5481
  %5491 = load i32* @PL_multiline, align 4
  %5492 = icmp ne i32 %5491, 0
  br i1 %5492, label %5499, label %5493

; <label>:5493                                    ; preds = %5490
  %5494 = load %struct.regnode** %next, align 8
  %5495 = getelementptr inbounds %struct.regnode* %5494, i32 0, i32 1
  %5496 = load i8* %5495, align 1
  %5497 = zext i8 %5496 to i32
  %5498 = icmp ne i32 %5497, 7
  br i1 %5498, label %5511, label %5499

; <label>:5499                                    ; preds = %5493, %5490
  %5500 = load %struct.regnode** %next, align 8
  %5501 = getelementptr inbounds %struct.regnode* %5500, i32 0, i32 1
  %5502 = load i8* %5501, align 1
  %5503 = zext i8 %5502 to i32
  %5504 = icmp eq i32 %5503, 8
  br i1 %5504, label %5511, label %5505

; <label>:5505                                    ; preds = %5499
  %5506 = load %struct.regnode** %next, align 8
  %5507 = getelementptr inbounds %struct.regnode* %5506, i32 0, i32 1
  %5508 = load i8* %5507, align 1
  %5509 = zext i8 %5508 to i32
  %5510 = icmp eq i32 %5509, 5
  br i1 %5510, label %5511, label %5528

; <label>:5511                                    ; preds = %5505, %5499, %5493
  %5512 = load i32* %n, align 4
  store i32 %5512, i32* %ln, align 4
  %5513 = load i8** @PL_reginput, align 8
  %5514 = getelementptr inbounds i8* %5513, i64 -1
  %5515 = load i8* %5514, align 1
  %5516 = zext i8 %5515 to i32
  %5517 = icmp eq i32 %5516, 10
  br i1 %5517, label %5518, label %5527

; <label>:5518                                    ; preds = %5511
  %5519 = load %struct.regnode** %next, align 8
  %5520 = getelementptr inbounds %struct.regnode* %5519, i32 0, i32 1
  %5521 = load i8* %5520, align 1
  %5522 = zext i8 %5521 to i32
  %5523 = icmp ne i32 %5522, 5
  br i1 %5523, label %5524, label %5527

; <label>:5524                                    ; preds = %5518
  %5525 = load i32* %ln, align 4
  %5526 = add nsw i32 %5525, -1
  store i32 %5526, i32* %ln, align 4
  br label %5527

; <label>:5527                                    ; preds = %5524, %5518, %5511
  br label %5528

; <label>:5528                                    ; preds = %5527, %5505, %5481, %5473
  %5529 = load i32* @PL_savestack_ix, align 4
  store i32 %5529, i32* %lastcp22, align 4
  %5530 = load i32* %paren, align 4
  %5531 = icmp ne i32 %5530, 0
  br i1 %5531, label %5532, label %5693

; <label>:5532                                    ; preds = %5528
  store i64 0, i64* %c23, align 8
  br label %5533

; <label>:5533                                    ; preds = %5690, %5532
  %5534 = load i32* %n, align 4
  %5535 = load i32* %ln, align 4
  %5536 = icmp sge i32 %5534, %5535
  br i1 %5536, label %5537, label %5692

; <label>:5537                                    ; preds = %5533
  %5538 = load i32* %c1, align 4
  %5539 = icmp ne i32 %5538, -1000
  br i1 %5539, label %5540, label %5595

; <label>:5540                                    ; preds = %5537
  %5541 = load i8* %do_utf8, align 1
  %5542 = icmp ne i8 %5541, 0
  br i1 %5542, label %5543, label %5589

; <label>:5543                                    ; preds = %5540
  %5544 = load i8** @PL_reginput, align 8
  %5545 = load volatile %struct.cop** @PL_curcop, align 8
  %5546 = getelementptr inbounds %struct.cop* %5545, i32 0, i32 14
  %5547 = load %struct.sv** %5546, align 8
  %5548 = icmp ne %struct.sv* %5547, null
  br i1 %5548, label %5549, label %5573

; <label>:5549                                    ; preds = %5543
  %5550 = load volatile %struct.cop** @PL_curcop, align 8
  %5551 = getelementptr inbounds %struct.cop* %5550, i32 0, i32 14
  %5552 = load %struct.sv** %5551, align 8
  %5553 = icmp ne %struct.sv* %5552, getelementptr inbounds (%struct.sv* null, i64 2)
  br i1 %5553, label %5554, label %5573

; <label>:5554                                    ; preds = %5549
  %5555 = load volatile %struct.cop** @PL_curcop, align 8
  %5556 = getelementptr inbounds %struct.cop* %5555, i32 0, i32 14
  %5557 = load %struct.sv** %5556, align 8
  %5558 = icmp eq %struct.sv* %5557, getelementptr inbounds (%struct.sv* null, i64 1)
  br i1 %5558, label %5585, label %5559

; <label>:5559                                    ; preds = %5554
  %5560 = load volatile %struct.cop** @PL_curcop, align 8
  %5561 = getelementptr inbounds %struct.cop* %5560, i32 0, i32 14
  %5562 = load %struct.sv** %5561, align 8
  %5563 = getelementptr inbounds %struct.sv* %5562, i32 0, i32 0
  %5564 = load i8** %5563, align 8
  %5565 = bitcast i8* %5564 to %struct.xpv*
  %5566 = getelementptr inbounds %struct.xpv* %5565, i32 0, i32 0
  %5567 = load i8** %5566, align 8
  %5568 = getelementptr inbounds i8* %5567, i64 11
  %5569 = load i8* %5568, align 1
  %5570 = sext i8 %5569 to i32
  %5571 = and i32 %5570, 1
  %5572 = icmp ne i32 %5571, 0
  br i1 %5572, label %5585, label %5573

; <label>:5573                                    ; preds = %5559, %5549, %5543
  %5574 = load volatile %struct.cop** @PL_curcop, align 8
  %5575 = getelementptr inbounds %struct.cop* %5574, i32 0, i32 14
  %5576 = load %struct.sv** %5575, align 8
  %5577 = icmp eq %struct.sv* %5576, null
  br i1 %5577, label %5578, label %5583

; <label>:5578                                    ; preds = %5573
  %5579 = load i8* @PL_dowarn, align 1
  %5580 = zext i8 %5579 to i32
  %5581 = and i32 %5580, 1
  %5582 = icmp ne i32 %5581, 0
  br label %5583

; <label>:5583                                    ; preds = %5578, %5573
  %5584 = phi i1 [ false, %5573 ], [ %5582, %5578 ]
  br label %5585

; <label>:5585                                    ; preds = %5583, %5559, %5554
  %5586 = phi i1 [ true, %5559 ], [ true, %5554 ], [ %5584, %5583 ]
  %5587 = select i1 %5586, i32 0, i32 255
  %5588 = call i64 @Perl_utf8n_to_uvuni(i8* %5544, i64 13, i64* null, i32 %5587)
  store i64 %5588, i64* %c23, align 8
  br label %5594

; <label>:5589                                    ; preds = %5540
  %5590 = load i8** @PL_reginput, align 8
  %5591 = load i8* %5590, align 1
  %5592 = zext i8 %5591 to i32
  %5593 = sext i32 %5592 to i64
  store i64 %5593, i64* %c23, align 8
  br label %5594

; <label>:5594                                    ; preds = %5589, %5585
  br label %5595

; <label>:5595                                    ; preds = %5594, %5537
  %5596 = load i32* %c1, align 4
  %5597 = icmp eq i32 %5596, -1000
  br i1 %5597, label %5608, label %5598

; <label>:5598                                    ; preds = %5595
  %5599 = load i64* %c23, align 8
  %5600 = load i32* %c1, align 4
  %5601 = sext i32 %5600 to i64
  %5602 = icmp eq i64 %5599, %5601
  br i1 %5602, label %5608, label %5603

; <label>:5603                                    ; preds = %5598
  %5604 = load i64* %c23, align 8
  %5605 = load i32* %c2, align 4
  %5606 = sext i32 %5605 to i64
  %5607 = icmp eq i64 %5604, %5606
  br i1 %5607, label %5608, label %5676

; <label>:5608                                    ; preds = %5603, %5598, %5595
  %5609 = load i32* %paren, align 4
  %5610 = icmp ne i32 %5609, 0
  br i1 %5610, label %5611, label %5653

; <label>:5611                                    ; preds = %5608
  %5612 = load i32* %n, align 4
  %5613 = icmp ne i32 %5612, 0
  br i1 %5613, label %5614, label %5647

; <label>:5614                                    ; preds = %5611
  %5615 = load i8* @PL_reg_match_utf8, align 1
  %5616 = sext i8 %5615 to i32
  %5617 = icmp ne i32 %5616, 0
  br i1 %5617, label %5618, label %5623

; <label>:5618                                    ; preds = %5614
  %5619 = load i8** @PL_reginput, align 8
  %5620 = call i32 (i8*, i32, ...)* bitcast (i32 (...)* @reghop to i32 (i8*, i32, ...)*)(i8* %5619, i32 -1)
  %5621 = sext i32 %5620 to i64
  %5622 = inttoptr i64 %5621 to i8*
  br label %5626

; <label>:5623                                    ; preds = %5614
  %5624 = load i8** @PL_reginput, align 8
  %5625 = getelementptr inbounds i8* %5624, i64 -1
  br label %5626

; <label>:5626                                    ; preds = %5623, %5618
  %5627 = phi i8* [ %5622, %5618 ], [ %5625, %5623 ]
  %5628 = load i8** @PL_bostr, align 8
  %5629 = ptrtoint i8* %5627 to i64
  %5630 = ptrtoint i8* %5628 to i64
  %5631 = sub i64 %5629, %5630
  %5632 = trunc i64 %5631 to i32
  %5633 = load i32* %paren, align 4
  %5634 = sext i32 %5633 to i64
  %5635 = load i32** @PL_regstartp, align 8
  %5636 = getelementptr inbounds i32* %5635, i64 %5634
  store i32 %5632, i32* %5636, align 4
  %5637 = load i8** @PL_reginput, align 8
  %5638 = load i8** @PL_bostr, align 8
  %5639 = ptrtoint i8* %5637 to i64
  %5640 = ptrtoint i8* %5638 to i64
  %5641 = sub i64 %5639, %5640
  %5642 = trunc i64 %5641 to i32
  %5643 = load i32* %paren, align 4
  %5644 = sext i32 %5643 to i64
  %5645 = load i32** @PL_regendp, align 8
  %5646 = getelementptr inbounds i32* %5645, i64 %5644
  store i32 %5642, i32* %5646, align 4
  br label %5652

; <label>:5647                                    ; preds = %5611
  %5648 = load i32* %paren, align 4
  %5649 = sext i32 %5648 to i64
  %5650 = load i32** @PL_regendp, align 8
  %5651 = getelementptr inbounds i32* %5650, i64 %5649
  store i32 -1, i32* %5651, align 4
  br label %5652

; <label>:5652                                    ; preds = %5647, %5626
  br label %5653

; <label>:5653                                    ; preds = %5652, %5608
  %5654 = load %struct.regnode** %next, align 8
  %5655 = call i32 (%struct.regnode*, ...)* bitcast (i32 (...)* @regmatch to i32 (%struct.regnode*, ...)*)(%struct.regnode* %5654)
  %5656 = icmp ne i32 %5655, 0
  br i1 %5656, label %5657, label %5658

; <label>:5657                                    ; preds = %5653
  br label %6126

; <label>:5658                                    ; preds = %5653
  %5659 = load i32* %paren, align 4
  %5660 = icmp ne i32 %5659, 0
  br i1 %5660, label %5661, label %5669

; <label>:5661                                    ; preds = %5658
  %5662 = load i32* %n, align 4
  %5663 = icmp ne i32 %5662, 0
  br i1 %5663, label %5664, label %5669

; <label>:5664                                    ; preds = %5661
  %5665 = load i32* %paren, align 4
  %5666 = sext i32 %5665 to i64
  %5667 = load i32** @PL_regendp, align 8
  %5668 = getelementptr inbounds i32* %5667, i64 %5666
  store i32 -1, i32* %5668, align 4
  br label %5669

; <label>:5669                                    ; preds = %5664, %5661, %5658
  %5670 = load i32* @PL_savestack_ix, align 4
  %5671 = load i32* %lastcp22, align 4
  %5672 = icmp sgt i32 %5670, %5671
  br i1 %5672, label %5673, label %5675

; <label>:5673                                    ; preds = %5669
  %5674 = load i32* %lastcp22, align 4
  call void @Perl_leave_scope(i32 %5674)
  br label %5675

; <label>:5675                                    ; preds = %5673, %5669
  br label %5676

; <label>:5676                                    ; preds = %5675, %5603
  %5677 = load i32* %n, align 4
  %5678 = add nsw i32 %5677, -1
  store i32 %5678, i32* %n, align 4
  %5679 = load i8* @PL_reg_match_utf8, align 1
  %5680 = sext i8 %5679 to i32
  %5681 = icmp ne i32 %5680, 0
  br i1 %5681, label %5682, label %5687

; <label>:5682                                    ; preds = %5676
  %5683 = load i8** %locinput, align 8
  %5684 = call i32 (i8*, i32, ...)* bitcast (i32 (...)* @reghop to i32 (i8*, i32, ...)*)(i8* %5683, i32 -1)
  %5685 = sext i32 %5684 to i64
  %5686 = inttoptr i64 %5685 to i8*
  br label %5690

; <label>:5687                                    ; preds = %5676
  %5688 = load i8** %locinput, align 8
  %5689 = getelementptr inbounds i8* %5688, i64 -1
  br label %5690

; <label>:5690                                    ; preds = %5687, %5682
  %5691 = phi i8* [ %5686, %5682 ], [ %5689, %5687 ]
  store i8* %5691, i8** %locinput, align 8
  store i8* %5691, i8** @PL_reginput, align 8
  br label %5533

; <label>:5692                                    ; preds = %5533
  br label %5854

; <label>:5693                                    ; preds = %5528
  store i64 0, i64* %c24, align 8
  br label %5694

; <label>:5694                                    ; preds = %5851, %5693
  %5695 = load i32* %n, align 4
  %5696 = load i32* %ln, align 4
  %5697 = icmp sge i32 %5695, %5696
  br i1 %5697, label %5698, label %5853

; <label>:5698                                    ; preds = %5694
  %5699 = load i32* %c1, align 4
  %5700 = icmp ne i32 %5699, -1000
  br i1 %5700, label %5701, label %5756

; <label>:5701                                    ; preds = %5698
  %5702 = load i8* %do_utf8, align 1
  %5703 = icmp ne i8 %5702, 0
  br i1 %5703, label %5704, label %5750

; <label>:5704                                    ; preds = %5701
  %5705 = load i8** @PL_reginput, align 8
  %5706 = load volatile %struct.cop** @PL_curcop, align 8
  %5707 = getelementptr inbounds %struct.cop* %5706, i32 0, i32 14
  %5708 = load %struct.sv** %5707, align 8
  %5709 = icmp ne %struct.sv* %5708, null
  br i1 %5709, label %5710, label %5734

; <label>:5710                                    ; preds = %5704
  %5711 = load volatile %struct.cop** @PL_curcop, align 8
  %5712 = getelementptr inbounds %struct.cop* %5711, i32 0, i32 14
  %5713 = load %struct.sv** %5712, align 8
  %5714 = icmp ne %struct.sv* %5713, getelementptr inbounds (%struct.sv* null, i64 2)
  br i1 %5714, label %5715, label %5734

; <label>:5715                                    ; preds = %5710
  %5716 = load volatile %struct.cop** @PL_curcop, align 8
  %5717 = getelementptr inbounds %struct.cop* %5716, i32 0, i32 14
  %5718 = load %struct.sv** %5717, align 8
  %5719 = icmp eq %struct.sv* %5718, getelementptr inbounds (%struct.sv* null, i64 1)
  br i1 %5719, label %5746, label %5720

; <label>:5720                                    ; preds = %5715
  %5721 = load volatile %struct.cop** @PL_curcop, align 8
  %5722 = getelementptr inbounds %struct.cop* %5721, i32 0, i32 14
  %5723 = load %struct.sv** %5722, align 8
  %5724 = getelementptr inbounds %struct.sv* %5723, i32 0, i32 0
  %5725 = load i8** %5724, align 8
  %5726 = bitcast i8* %5725 to %struct.xpv*
  %5727 = getelementptr inbounds %struct.xpv* %5726, i32 0, i32 0
  %5728 = load i8** %5727, align 8
  %5729 = getelementptr inbounds i8* %5728, i64 11
  %5730 = load i8* %5729, align 1
  %5731 = sext i8 %5730 to i32
  %5732 = and i32 %5731, 1
  %5733 = icmp ne i32 %5732, 0
  br i1 %5733, label %5746, label %5734

; <label>:5734                                    ; preds = %5720, %5710, %5704
  %5735 = load volatile %struct.cop** @PL_curcop, align 8
  %5736 = getelementptr inbounds %struct.cop* %5735, i32 0, i32 14
  %5737 = load %struct.sv** %5736, align 8
  %5738 = icmp eq %struct.sv* %5737, null
  br i1 %5738, label %5739, label %5744

; <label>:5739                                    ; preds = %5734
  %5740 = load i8* @PL_dowarn, align 1
  %5741 = zext i8 %5740 to i32
  %5742 = and i32 %5741, 1
  %5743 = icmp ne i32 %5742, 0
  br label %5744

; <label>:5744                                    ; preds = %5739, %5734
  %5745 = phi i1 [ false, %5734 ], [ %5743, %5739 ]
  br label %5746

; <label>:5746                                    ; preds = %5744, %5720, %5715
  %5747 = phi i1 [ true, %5720 ], [ true, %5715 ], [ %5745, %5744 ]
  %5748 = select i1 %5747, i32 0, i32 255
  %5749 = call i64 @Perl_utf8n_to_uvuni(i8* %5705, i64 13, i64* null, i32 %5748)
  store i64 %5749, i64* %c24, align 8
  br label %5755

; <label>:5750                                    ; preds = %5701
  %5751 = load i8** @PL_reginput, align 8
  %5752 = load i8* %5751, align 1
  %5753 = zext i8 %5752 to i32
  %5754 = sext i32 %5753 to i64
  store i64 %5754, i64* %c24, align 8
  br label %5755

; <label>:5755                                    ; preds = %5750, %5746
  br label %5756

; <label>:5756                                    ; preds = %5755, %5698
  %5757 = load i32* %c1, align 4
  %5758 = icmp eq i32 %5757, -1000
  br i1 %5758, label %5769, label %5759

; <label>:5759                                    ; preds = %5756
  %5760 = load i64* %c24, align 8
  %5761 = load i32* %c1, align 4
  %5762 = sext i32 %5761 to i64
  %5763 = icmp eq i64 %5760, %5762
  br i1 %5763, label %5769, label %5764

; <label>:5764                                    ; preds = %5759
  %5765 = load i64* %c24, align 8
  %5766 = load i32* %c2, align 4
  %5767 = sext i32 %5766 to i64
  %5768 = icmp eq i64 %5765, %5767
  br i1 %5768, label %5769, label %5837

; <label>:5769                                    ; preds = %5764, %5759, %5756
  %5770 = load i32* %paren, align 4
  %5771 = icmp ne i32 %5770, 0
  br i1 %5771, label %5772, label %5814

; <label>:5772                                    ; preds = %5769
  %5773 = load i32* %n, align 4
  %5774 = icmp ne i32 %5773, 0
  br i1 %5774, label %5775, label %5808

; <label>:5775                                    ; preds = %5772
  %5776 = load i8* @PL_reg_match_utf8, align 1
  %5777 = sext i8 %5776 to i32
  %5778 = icmp ne i32 %5777, 0
  br i1 %5778, label %5779, label %5784

; <label>:5779                                    ; preds = %5775
  %5780 = load i8** @PL_reginput, align 8
  %5781 = call i32 (i8*, i32, ...)* bitcast (i32 (...)* @reghop to i32 (i8*, i32, ...)*)(i8* %5780, i32 -1)
  %5782 = sext i32 %5781 to i64
  %5783 = inttoptr i64 %5782 to i8*
  br label %5787

; <label>:5784                                    ; preds = %5775
  %5785 = load i8** @PL_reginput, align 8
  %5786 = getelementptr inbounds i8* %5785, i64 -1
  br label %5787

; <label>:5787                                    ; preds = %5784, %5779
  %5788 = phi i8* [ %5783, %5779 ], [ %5786, %5784 ]
  %5789 = load i8** @PL_bostr, align 8
  %5790 = ptrtoint i8* %5788 to i64
  %5791 = ptrtoint i8* %5789 to i64
  %5792 = sub i64 %5790, %5791
  %5793 = trunc i64 %5792 to i32
  %5794 = load i32* %paren, align 4
  %5795 = sext i32 %5794 to i64
  %5796 = load i32** @PL_regstartp, align 8
  %5797 = getelementptr inbounds i32* %5796, i64 %5795
  store i32 %5793, i32* %5797, align 4
  %5798 = load i8** @PL_reginput, align 8
  %5799 = load i8** @PL_bostr, align 8
  %5800 = ptrtoint i8* %5798 to i64
  %5801 = ptrtoint i8* %5799 to i64
  %5802 = sub i64 %5800, %5801
  %5803 = trunc i64 %5802 to i32
  %5804 = load i32* %paren, align 4
  %5805 = sext i32 %5804 to i64
  %5806 = load i32** @PL_regendp, align 8
  %5807 = getelementptr inbounds i32* %5806, i64 %5805
  store i32 %5803, i32* %5807, align 4
  br label %5813

; <label>:5808                                    ; preds = %5772
  %5809 = load i32* %paren, align 4
  %5810 = sext i32 %5809 to i64
  %5811 = load i32** @PL_regendp, align 8
  %5812 = getelementptr inbounds i32* %5811, i64 %5810
  store i32 -1, i32* %5812, align 4
  br label %5813

; <label>:5813                                    ; preds = %5808, %5787
  br label %5814

; <label>:5814                                    ; preds = %5813, %5769
  %5815 = load %struct.regnode** %next, align 8
  %5816 = call i32 (%struct.regnode*, ...)* bitcast (i32 (...)* @regmatch to i32 (%struct.regnode*, ...)*)(%struct.regnode* %5815)
  %5817 = icmp ne i32 %5816, 0
  br i1 %5817, label %5818, label %5819

; <label>:5818                                    ; preds = %5814
  br label %6126

; <label>:5819                                    ; preds = %5814
  %5820 = load i32* %paren, align 4
  %5821 = icmp ne i32 %5820, 0
  br i1 %5821, label %5822, label %5830

; <label>:5822                                    ; preds = %5819
  %5823 = load i32* %n, align 4
  %5824 = icmp ne i32 %5823, 0
  br i1 %5824, label %5825, label %5830

; <label>:5825                                    ; preds = %5822
  %5826 = load i32* %paren, align 4
  %5827 = sext i32 %5826 to i64
  %5828 = load i32** @PL_regendp, align 8
  %5829 = getelementptr inbounds i32* %5828, i64 %5827
  store i32 -1, i32* %5829, align 4
  br label %5830

; <label>:5830                                    ; preds = %5825, %5822, %5819
  %5831 = load i32* @PL_savestack_ix, align 4
  %5832 = load i32* %lastcp22, align 4
  %5833 = icmp sgt i32 %5831, %5832
  br i1 %5833, label %5834, label %5836

; <label>:5834                                    ; preds = %5830
  %5835 = load i32* %lastcp22, align 4
  call void @Perl_leave_scope(i32 %5835)
  br label %5836

; <label>:5836                                    ; preds = %5834, %5830
  br label %5837

; <label>:5837                                    ; preds = %5836, %5764
  %5838 = load i32* %n, align 4
  %5839 = add nsw i32 %5838, -1
  store i32 %5839, i32* %n, align 4
  %5840 = load i8* @PL_reg_match_utf8, align 1
  %5841 = sext i8 %5840 to i32
  %5842 = icmp ne i32 %5841, 0
  br i1 %5842, label %5843, label %5848

; <label>:5843                                    ; preds = %5837
  %5844 = load i8** %locinput, align 8
  %5845 = call i32 (i8*, i32, ...)* bitcast (i32 (...)* @reghop to i32 (i8*, i32, ...)*)(i8* %5844, i32 -1)
  %5846 = sext i32 %5845 to i64
  %5847 = inttoptr i64 %5846 to i8*
  br label %5851

; <label>:5848                                    ; preds = %5837
  %5849 = load i8** %locinput, align 8
  %5850 = getelementptr inbounds i8* %5849, i64 -1
  br label %5851

; <label>:5851                                    ; preds = %5848, %5843
  %5852 = phi i8* [ %5847, %5843 ], [ %5850, %5848 ]
  store i8* %5852, i8** %locinput, align 8
  store i8* %5852, i8** @PL_reginput, align 8
  br label %5694

; <label>:5853                                    ; preds = %5694
  br label %5854

; <label>:5854                                    ; preds = %5853, %5692
  br label %5855

; <label>:5855                                    ; preds = %5854, %5472
  br label %6127

; <label>:5856                                    ; preds = %24
  %5857 = load %struct.re_cc_state** @PL_reg_call_cc, align 8
  %5858 = icmp ne %struct.re_cc_state* %5857, null
  br i1 %5858, label %5859, label %5906

; <label>:5859                                    ; preds = %5856
  %5860 = load %struct.re_cc_state** @PL_reg_call_cc, align 8
  store %struct.re_cc_state* %5860, %struct.re_cc_state** %cur_call_cc, align 8
  %5861 = load %struct.curcur** @PL_regcc, align 8
  store %struct.curcur* %5861, %struct.curcur** %cctmp, align 8
  %5862 = load %struct.regexp** @PL_reg_re, align 8
  store %struct.regexp* %5862, %struct.regexp** %re25, align 8
  %5863 = call i32 (i32, ...)* bitcast (i32 (...)* @regcppush to i32 (i32, ...)*)(i32 0)
  store i32 %5863, i32* %cp26, align 4
  %5864 = load i32* @PL_savestack_ix, align 4
  store i32 %5864, i32* %lastcp27, align 4
  %5865 = load %struct.re_cc_state** @PL_reg_call_cc, align 8
  %5866 = getelementptr inbounds %struct.re_cc_state* %5865, i32 0, i32 0
  %5867 = load i32* %5866, align 4
  %5868 = call i32 (i32, ...)* bitcast (i32 (...)* @regcp_set_to to i32 (i32, ...)*)(i32 %5867)
  %5869 = load i8** %locinput, align 8
  store i8* %5869, i8** @PL_reginput, align 8
  %5870 = load %struct.re_cc_state** @PL_reg_call_cc, align 8
  %5871 = getelementptr inbounds %struct.re_cc_state* %5870, i32 0, i32 4
  %5872 = load %struct.regexp** %5871, align 8
  %5873 = call i32 (%struct.regexp*, ...)* bitcast (i32 (...)* @cache_re to i32 (%struct.regexp*, ...)*)(%struct.regexp* %5872)
  %5874 = load %struct.re_cc_state** @PL_reg_call_cc, align 8
  %5875 = getelementptr inbounds %struct.re_cc_state* %5874, i32 0, i32 3
  %5876 = load %struct.curcur** %5875, align 8
  store %struct.curcur* %5876, %struct.curcur** @PL_regcc, align 8
  %5877 = load %struct.re_cc_state** @PL_reg_call_cc, align 8
  %5878 = getelementptr inbounds %struct.re_cc_state* %5877, i32 0, i32 2
  %5879 = load %struct.re_cc_state** %5878, align 8
  store %struct.re_cc_state* %5879, %struct.re_cc_state** @PL_reg_call_cc, align 8
  %5880 = load %struct.re_cc_state** %cur_call_cc, align 8
  %5881 = getelementptr inbounds %struct.re_cc_state* %5880, i32 0, i32 1
  %5882 = load %struct.regnode** %5881, align 8
  %5883 = call i32 (%struct.regnode*, ...)* bitcast (i32 (...)* @regmatch to i32 (%struct.regnode*, ...)*)(%struct.regnode* %5882)
  %5884 = icmp ne i32 %5883, 0
  br i1 %5884, label %5885, label %5893

; <label>:5885                                    ; preds = %5859
  %5886 = load %struct.re_cc_state** %cur_call_cc, align 8
  store %struct.re_cc_state* %5886, %struct.re_cc_state** @PL_reg_call_cc, align 8
  %5887 = load i32* @PL_savestack_ix, align 4
  %5888 = load i32* %cp26, align 4
  %5889 = icmp sgt i32 %5887, %5888
  br i1 %5889, label %5890, label %5892

; <label>:5890                                    ; preds = %5885
  %5891 = load i32* %cp26, align 4
  call void @Perl_leave_scope(i32 %5891)
  br label %5892

; <label>:5892                                    ; preds = %5890, %5885
  br label %6126

; <label>:5893                                    ; preds = %5859
  %5894 = load i32* @PL_savestack_ix, align 4
  %5895 = load i32* %lastcp27, align 4
  %5896 = icmp sgt i32 %5894, %5895
  br i1 %5896, label %5897, label %5899

; <label>:5897                                    ; preds = %5893
  %5898 = load i32* %lastcp27, align 4
  call void @Perl_leave_scope(i32 %5898)
  br label %5899

; <label>:5899                                    ; preds = %5897, %5893
  %5900 = call i32 (...)* @regcppop()
  %5901 = load %struct.re_cc_state** %cur_call_cc, align 8
  store %struct.re_cc_state* %5901, %struct.re_cc_state** @PL_reg_call_cc, align 8
  %5902 = load %struct.curcur** %cctmp, align 8
  store %struct.curcur* %5902, %struct.curcur** @PL_regcc, align 8
  %5903 = load %struct.regexp** %re25, align 8
  store %struct.regexp* %5903, %struct.regexp** @PL_reg_re, align 8
  %5904 = load %struct.regexp** %re25, align 8
  %5905 = call i32 (%struct.regexp*, ...)* bitcast (i32 (...)* @cache_re to i32 (%struct.regexp*, ...)*)(%struct.regexp* %5904)
  br label %6129

; <label>:5906                                    ; preds = %5856
  %5907 = load i8** %locinput, align 8
  %5908 = load i8** @PL_regtill, align 8
  %5909 = icmp ult i8* %5907, %5908
  br i1 %5909, label %5910, label %5911

; <label>:5910                                    ; preds = %5906
  br label %6128

; <label>:5911                                    ; preds = %5906
  %5912 = load i8** %locinput, align 8
  store i8* %5912, i8** @PL_reginput, align 8
  br label %6125

; <label>:5913                                    ; preds = %24
  %5914 = load i8** %locinput, align 8
  store i8* %5914, i8** @PL_reginput, align 8
  br label %6124

; <label>:5915                                    ; preds = %24
  store i32 1, i32* %n, align 4
  %5916 = load i8** %locinput, align 8
  store i8* %5916, i8** @PL_reginput, align 8
  br label %6021

; <label>:5917                                    ; preds = %24
  store i32 0, i32* %n, align 4
  %5918 = load %struct.regnode** %scan, align 8
  %5919 = getelementptr inbounds %struct.regnode* %5918, i32 0, i32 0
  %5920 = load i8* %5919, align 1
  %5921 = icmp ne i8 %5920, 0
  br i1 %5921, label %5922, label %5966

; <label>:5922                                    ; preds = %5917
  %5923 = load i8* @PL_reg_match_utf8, align 1
  %5924 = sext i8 %5923 to i32
  %5925 = icmp ne i32 %5924, 0
  br i1 %5925, label %5926, label %5936

; <label>:5926                                    ; preds = %5922
  %5927 = load i8** %locinput, align 8
  %5928 = load %struct.regnode** %scan, align 8
  %5929 = getelementptr inbounds %struct.regnode* %5928, i32 0, i32 0
  %5930 = load i8* %5929, align 1
  %5931 = zext i8 %5930 to i32
  %5932 = sub nsw i32 0, %5931
  %5933 = call i32 (i8*, i32, ...)* bitcast (i32 (...)* @reghopmaybe to i32 (i8*, i32, ...)*)(i8* %5927, i32 %5932)
  %5934 = sext i32 %5933 to i64
  %5935 = inttoptr i64 %5934 to i8*
  br label %5959

; <label>:5936                                    ; preds = %5922
  %5937 = load i8** %locinput, align 8
  %5938 = load %struct.regnode** %scan, align 8
  %5939 = getelementptr inbounds %struct.regnode* %5938, i32 0, i32 0
  %5940 = load i8* %5939, align 1
  %5941 = zext i8 %5940 to i32
  %5942 = sext i32 %5941 to i64
  %5943 = sub i64 0, %5942
  %5944 = getelementptr inbounds i8* %5937, i64 %5943
  %5945 = load i8** @PL_bostr, align 8
  %5946 = icmp uge i8* %5944, %5945
  br i1 %5946, label %5947, label %5956

; <label>:5947                                    ; preds = %5936
  %5948 = load i8** %locinput, align 8
  %5949 = load %struct.regnode** %scan, align 8
  %5950 = getelementptr inbounds %struct.regnode* %5949, i32 0, i32 0
  %5951 = load i8* %5950, align 1
  %5952 = zext i8 %5951 to i32
  %5953 = sext i32 %5952 to i64
  %5954 = sub i64 0, %5953
  %5955 = getelementptr inbounds i8* %5948, i64 %5954
  br label %5957

; <label>:5956                                    ; preds = %5936
  br label %5957

; <label>:5957                                    ; preds = %5956, %5947
  %5958 = phi i8* [ %5955, %5947 ], [ null, %5956 ]
  br label %5959

; <label>:5959                                    ; preds = %5957, %5926
  %5960 = phi i8* [ %5935, %5926 ], [ %5958, %5957 ]
  store i8* %5960, i8** %s, align 8
  %5961 = load i8** %s, align 8
  %5962 = icmp ne i8* %5961, null
  br i1 %5962, label %5964, label %5963

; <label>:5963                                    ; preds = %5959
  br label %6036

; <label>:5964                                    ; preds = %5959
  %5965 = load i8** %s, align 8
  store i8* %5965, i8** @PL_reginput, align 8
  br label %5968

; <label>:5966                                    ; preds = %5917
  %5967 = load i8** %locinput, align 8
  store i8* %5967, i8** @PL_reginput, align 8
  br label %5968

; <label>:5968                                    ; preds = %5966, %5964
  br label %6021

; <label>:5969                                    ; preds = %24
  store i32 1, i32* %n, align 4
  %5970 = load %struct.regnode** %scan, align 8
  %5971 = getelementptr inbounds %struct.regnode* %5970, i32 0, i32 0
  %5972 = load i8* %5971, align 1
  %5973 = icmp ne i8 %5972, 0
  br i1 %5973, label %5974, label %6018

; <label>:5974                                    ; preds = %5969
  %5975 = load i8* @PL_reg_match_utf8, align 1
  %5976 = sext i8 %5975 to i32
  %5977 = icmp ne i32 %5976, 0
  br i1 %5977, label %5978, label %5988

; <label>:5978                                    ; preds = %5974
  %5979 = load i8** %locinput, align 8
  %5980 = load %struct.regnode** %scan, align 8
  %5981 = getelementptr inbounds %struct.regnode* %5980, i32 0, i32 0
  %5982 = load i8* %5981, align 1
  %5983 = zext i8 %5982 to i32
  %5984 = sub nsw i32 0, %5983
  %5985 = call i32 (i8*, i32, ...)* bitcast (i32 (...)* @reghopmaybe to i32 (i8*, i32, ...)*)(i8* %5979, i32 %5984)
  %5986 = sext i32 %5985 to i64
  %5987 = inttoptr i64 %5986 to i8*
  br label %6011

; <label>:5988                                    ; preds = %5974
  %5989 = load i8** %locinput, align 8
  %5990 = load %struct.regnode** %scan, align 8
  %5991 = getelementptr inbounds %struct.regnode* %5990, i32 0, i32 0
  %5992 = load i8* %5991, align 1
  %5993 = zext i8 %5992 to i32
  %5994 = sext i32 %5993 to i64
  %5995 = sub i64 0, %5994
  %5996 = getelementptr inbounds i8* %5989, i64 %5995
  %5997 = load i8** @PL_bostr, align 8
  %5998 = icmp uge i8* %5996, %5997
  br i1 %5998, label %5999, label %6008

; <label>:5999                                    ; preds = %5988
  %6000 = load i8** %locinput, align 8
  %6001 = load %struct.regnode** %scan, align 8
  %6002 = getelementptr inbounds %struct.regnode* %6001, i32 0, i32 0
  %6003 = load i8* %6002, align 1
  %6004 = zext i8 %6003 to i32
  %6005 = sext i32 %6004 to i64
  %6006 = sub i64 0, %6005
  %6007 = getelementptr inbounds i8* %6000, i64 %6006
  br label %6009

; <label>:6008                                    ; preds = %5988
  br label %6009

; <label>:6009                                    ; preds = %6008, %5999
  %6010 = phi i8* [ %6007, %5999 ], [ null, %6008 ]
  br label %6011

; <label>:6011                                    ; preds = %6009, %5978
  %6012 = phi i8* [ %5987, %5978 ], [ %6010, %6009 ]
  store i8* %6012, i8** %s, align 8
  %6013 = load i8** %s, align 8
  %6014 = icmp ne i8* %6013, null
  br i1 %6014, label %6016, label %6015

; <label>:6015                                    ; preds = %6011
  br label %6030

; <label>:6016                                    ; preds = %6011
  %6017 = load i8** %s, align 8
  store i8* %6017, i8** @PL_reginput, align 8
  br label %6020

; <label>:6018                                    ; preds = %5969
  %6019 = load i8** %locinput, align 8
  store i8* %6019, i8** @PL_reginput, align 8
  br label %6020

; <label>:6020                                    ; preds = %6018, %6016
  br label %6021

; <label>:6021                                    ; preds = %6020, %5968, %5915
  %6022 = load %struct.regnode** %scan, align 8
  %6023 = getelementptr inbounds %struct.regnode* %6022, i64 1
  %6024 = getelementptr inbounds %struct.regnode* %6023, i64 1
  store %struct.regnode* %6024, %struct.regnode** %inner, align 8
  %6025 = load %struct.regnode** %inner, align 8
  %6026 = call i32 (%struct.regnode*, ...)* bitcast (i32 (...)* @regmatch to i32 (%struct.regnode*, ...)*)(%struct.regnode* %6025)
  %6027 = load i32* %n, align 4
  %6028 = icmp ne i32 %6026, %6027
  br i1 %6028, label %6029, label %6035

; <label>:6029                                    ; preds = %6021
  br label %6030

; <label>:6030                                    ; preds = %6029, %6015
  %6031 = load i32* %logical, align 4
  %6032 = icmp ne i32 %6031, 0
  br i1 %6032, label %6033, label %6034

; <label>:6033                                    ; preds = %6030
  store i32 0, i32* %logical, align 4
  store i32 0, i32* %sw, align 4
  br label %6053

; <label>:6034                                    ; preds = %6030
  br label %6127

; <label>:6035                                    ; preds = %6021
  br label %6036

; <label>:6036                                    ; preds = %6035, %5963
  %6037 = load i32* %logical, align 4
  %6038 = icmp ne i32 %6037, 0
  br i1 %6038, label %6039, label %6040

; <label>:6039                                    ; preds = %6036
  store i32 0, i32* %logical, align 4
  store i32 1, i32* %sw, align 4
  br label %6040

; <label>:6040                                    ; preds = %6039, %6036
  %6041 = load %struct.regnode** %scan, align 8
  %6042 = getelementptr inbounds %struct.regnode* %6041, i32 0, i32 1
  %6043 = load i8* %6042, align 1
  %6044 = zext i8 %6043 to i32
  %6045 = icmp eq i32 %6044, 52
  br i1 %6045, label %6046, label %6051

; <label>:6046                                    ; preds = %6040
  %6047 = load i8** @PL_reginput, align 8
  store i8* %6047, i8** %locinput, align 8
  %6048 = load i8** %locinput, align 8
  %6049 = load i8* %6048, align 1
  %6050 = zext i8 %6049 to i32
  store i32 %6050, i32* %nextchr, align 4
  br label %6051

; <label>:6051                                    ; preds = %6046, %6040
  br label %6052

; <label>:6052                                    ; preds = %24, %6051
  br label %6053

; <label>:6053                                    ; preds = %6052, %6033
  %6054 = load %struct.regnode** %scan, align 8
  %6055 = load %struct.regnode** %scan, align 8
  %6056 = bitcast %struct.regnode* %6055 to %struct.regnode_1*
  %6057 = getelementptr inbounds %struct.regnode_1* %6056, i32 0, i32 3
  %6058 = load i32* %6057, align 4
  %6059 = zext i32 %6058 to i64
  %6060 = getelementptr inbounds %struct.regnode* %6054, i64 %6059
  store %struct.regnode* %6060, %struct.regnode** %next, align 8
  %6061 = load %struct.regnode** %next, align 8
  %6062 = load %struct.regnode** %scan, align 8
  %6063 = icmp eq %struct.regnode* %6061, %6062
  br i1 %6063, label %6064, label %6065

; <label>:6064                                    ; preds = %6053
  store %struct.regnode* null, %struct.regnode** %next, align 8
  br label %6065

; <label>:6065                                    ; preds = %6064, %6053
  br label %6120

; <label>:6066                                    ; preds = %24
  %6067 = load %struct.gv** @PL_stderrgv, align 8
  %6068 = icmp ne %struct.gv* %6067, null
  br i1 %6068, label %6069, label %6109

; <label>:6069                                    ; preds = %6066
  %6070 = load %struct.gv** @PL_stderrgv, align 8
  %6071 = getelementptr inbounds %struct.gv* %6070, i32 0, i32 2
  %6072 = load i32* %6071, align 4
  %6073 = and i32 %6072, 255
  %6074 = icmp eq i32 %6073, 13
  br i1 %6074, label %6075, label %6109

; <label>:6075                                    ; preds = %6069
  %6076 = load %struct.gv** @PL_stderrgv, align 8
  %6077 = getelementptr inbounds %struct.gv* %6076, i32 0, i32 0
  %6078 = load %struct.xpvgv** %6077, align 8
  %6079 = getelementptr inbounds %struct.xpvgv* %6078, i32 0, i32 7
  %6080 = load %struct.gp** %6079, align 8
  %6081 = getelementptr inbounds %struct.gp* %6080, i32 0, i32 2
  %6082 = load %struct.io** %6081, align 8
  %6083 = icmp ne %struct.io* %6082, null
  br i1 %6083, label %6084, label %6109

; <label>:6084                                    ; preds = %6075
  %6085 = load %struct.gv** @PL_stderrgv, align 8
  %6086 = getelementptr inbounds %struct.gv* %6085, i32 0, i32 0
  %6087 = load %struct.xpvgv** %6086, align 8
  %6088 = getelementptr inbounds %struct.xpvgv* %6087, i32 0, i32 7
  %6089 = load %struct.gp** %6088, align 8
  %6090 = getelementptr inbounds %struct.gp* %6089, i32 0, i32 2
  %6091 = load %struct.io** %6090, align 8
  %6092 = getelementptr inbounds %struct.io* %6091, i32 0, i32 0
  %6093 = load %struct.xpvio** %6092, align 8
  %6094 = getelementptr inbounds %struct.xpvio* %6093, i32 0, i32 8
  %6095 = load %struct._PerlIO*** %6094, align 8
  %6096 = icmp ne %struct._PerlIO** %6095, null
  br i1 %6096, label %6097, label %6109

; <label>:6097                                    ; preds = %6084
  %6098 = load %struct.gv** @PL_stderrgv, align 8
  %6099 = getelementptr inbounds %struct.gv* %6098, i32 0, i32 0
  %6100 = load %struct.xpvgv** %6099, align 8
  %6101 = getelementptr inbounds %struct.xpvgv* %6100, i32 0, i32 7
  %6102 = load %struct.gp** %6101, align 8
  %6103 = getelementptr inbounds %struct.gp* %6102, i32 0, i32 2
  %6104 = load %struct.io** %6103, align 8
  %6105 = getelementptr inbounds %struct.io* %6104, i32 0, i32 0
  %6106 = load %struct.xpvio** %6105, align 8
  %6107 = getelementptr inbounds %struct.xpvio* %6106, i32 0, i32 8
  %6108 = load %struct._PerlIO*** %6107, align 8
  br label %6111

; <label>:6109                                    ; preds = %6084, %6075, %6069, %6066
  %6110 = call %struct._PerlIO** @Perl_PerlIO_stderr()
  br label %6111

; <label>:6111                                    ; preds = %6109, %6097
  %6112 = phi %struct._PerlIO** [ %6108, %6097 ], [ %6110, %6109 ]
  %6113 = load %struct.regnode** %scan, align 8
  %6114 = ptrtoint %struct.regnode* %6113 to i64
  %6115 = load %struct.regnode** %scan, align 8
  %6116 = getelementptr inbounds %struct.regnode* %6115, i32 0, i32 1
  %6117 = load i8* %6116, align 1
  %6118 = zext i8 %6117 to i32
  %6119 = call i32 (%struct._PerlIO**, i8*, ...)* @PerlIO_printf(%struct._PerlIO** %6112, i8* getelementptr inbounds ([8 x i8]* @.str8, i32 0, i32 0), i64 %6114, i32 %6118)
  call void (i8*, ...)* @Perl_croak(i8* getelementptr inbounds ([25 x i8]* @.str9, i32 0, i32 0))
  br label %6120

; <label>:6120                                    ; preds = %6111, %6065, %3433, %3432, %2545, %2544, %2515, %2496, %2459, %2443, %2048, %2047, %2039, %1955, %1890, %1856, %1791, %1752, %1682, %1643, %1577, %1529, %1463, %1369, %1301, %1033, %976, %900, %843, %775, %683, %629, %588, %528, %405, %372, %210, %169, %160, %126, %120, %99, %80, %74, %68, %49
  br label %6121

; <label>:6121                                    ; preds = %6232, %6120
  %6122 = load %struct.regnode** %next, align 8
  store %struct.regnode* %6122, %struct.regnode** %scan, align 8
  br label %9

; <label>:6123                                    ; preds = %9
  call void (i8*, ...)* @Perl_croak(i8* getelementptr inbounds ([26 x i8]* @.str10, i32 0, i32 0))
  br label %6127

; <label>:6124                                    ; preds = %5913
  br label %6126

; <label>:6125                                    ; preds = %5911
  br label %6126

; <label>:6126                                    ; preds = %6125, %6124, %5892, %5818, %5657, %5440, %5368, %5200, %4290, %3883, %3308, %3193, %3068, %2892, %2806, %2686, %2658, %2619, %2330
  store i32 1, i32* %1
  br label %6242

; <label>:6127                                    ; preds = %6123, %6034, %5855, %5469, %5149, %5138, %4854, %4321, %3900, %3493, %3364, %3123, %3003, %2687, %2666, %2620, %2354, %2038, %2003, %1988, %1946, %1929, %1881, %1851, %1815, %1800, %1790, %1751, %1697, %1681, %1642, %1588, %1576, %1528, %1474, %1457, %1416, %1368, %1308, %1300, %1032, %975, %915, %899, %842, %782, %774, %682, %616, %587, %565, %555, %526, %404, %393, %383, %364, %313, %296, %245, %200, %184, %168, %150, %134, %125, %119, %111, %98, %81, %75, %69, %50
  br label %6129

; <label>:6128                                    ; preds = %5910
  br label %6129

; <label>:6129                                    ; preds = %6191, %6128, %6127, %5899, %2807
  %6130 = load i32* %unwind, align 4
  %6131 = icmp ne i32 %6130, 0
  br i1 %6131, label %6132, label %6241

; <label>:6132                                    ; preds = %6129
  %6133 = load %union.any** @PL_savestack, align 8
  %6134 = bitcast %union.any* %6133 to i8*
  %6135 = load i32* %unwind, align 4
  %6136 = sext i32 %6135 to i64
  %6137 = getelementptr inbounds i8* %6134, i64 %6136
  %6138 = bitcast i8* %6137 to %union.re_unwind_t*
  store %union.re_unwind_t* %6138, %union.re_unwind_t** %uw28, align 8
  %6139 = load %union.re_unwind_t** %uw28, align 8
  %6140 = bitcast %union.re_unwind_t* %6139 to i32*
  %6141 = load i32* %6140, align 4
  switch i32 %6141, label %6239 [
    i32 1, label %6142
    i32 2, label %6142
  ]

; <label>:6142                                    ; preds = %6132, %6132
  %6143 = load %union.re_unwind_t** %uw28, align 8
  %6144 = bitcast %union.re_unwind_t* %6143 to %struct.re_unwind_branch_t*
  store %struct.re_unwind_branch_t* %6144, %struct.re_unwind_branch_t** %uwb, align 8
  %6145 = load %struct.re_unwind_branch_t** %uwb, align 8
  %6146 = getelementptr inbounds %struct.re_unwind_branch_t* %6145, i32 0, i32 3
  %6147 = load i32* %6146, align 4
  store i32 %6147, i32* %lastparen29, align 4
  %6148 = load i32* @PL_savestack_ix, align 4
  %6149 = load %struct.re_unwind_branch_t** %uwb, align 8
  %6150 = getelementptr inbounds %struct.re_unwind_branch_t* %6149, i32 0, i32 2
  %6151 = load i32* %6150, align 4
  %6152 = icmp sgt i32 %6148, %6151
  br i1 %6152, label %6153, label %6157

; <label>:6153                                    ; preds = %6142
  %6154 = load %struct.re_unwind_branch_t** %uwb, align 8
  %6155 = getelementptr inbounds %struct.re_unwind_branch_t* %6154, i32 0, i32 2
  %6156 = load i32* %6155, align 4
  call void @Perl_leave_scope(i32 %6156)
  br label %6157

; <label>:6157                                    ; preds = %6153, %6142
  %6158 = load i32** @PL_reglastparen, align 8
  %6159 = load i32* %6158, align 4
  store i32 %6159, i32* %n, align 4
  br label %6160

; <label>:6160                                    ; preds = %6169, %6157
  %6161 = load i32* %n, align 4
  %6162 = load i32* %lastparen29, align 4
  %6163 = icmp sgt i32 %6161, %6162
  br i1 %6163, label %6164, label %6172

; <label>:6164                                    ; preds = %6160
  %6165 = load i32* %n, align 4
  %6166 = sext i32 %6165 to i64
  %6167 = load i32** @PL_regendp, align 8
  %6168 = getelementptr inbounds i32* %6167, i64 %6166
  store i32 -1, i32* %6168, align 4
  br label %6169

; <label>:6169                                    ; preds = %6164
  %6170 = load i32* %n, align 4
  %6171 = add nsw i32 %6170, -1
  store i32 %6171, i32* %n, align 4
  br label %6160

; <label>:6172                                    ; preds = %6160
  %6173 = load i32* %n, align 4
  %6174 = load i32** @PL_reglastparen, align 8
  store i32 %6173, i32* %6174, align 4
  %6175 = load %struct.re_unwind_branch_t** %uwb, align 8
  %6176 = getelementptr inbounds %struct.re_unwind_branch_t* %6175, i32 0, i32 4
  %6177 = load %struct.regnode** %6176, align 8
  store %struct.regnode* %6177, %struct.regnode** %next, align 8
  store %struct.regnode* %6177, %struct.regnode** %scan, align 8
  %6178 = load %struct.regnode** %scan, align 8
  %6179 = icmp ne %struct.regnode* %6178, null
  br i1 %6179, label %6180, label %6191

; <label>:6180                                    ; preds = %6172
  %6181 = load %struct.regnode** %scan, align 8
  %6182 = getelementptr inbounds %struct.regnode* %6181, i32 0, i32 1
  %6183 = load i8* %6182, align 1
  %6184 = zext i8 %6183 to i32
  %6185 = load %struct.re_unwind_branch_t** %uwb, align 8
  %6186 = getelementptr inbounds %struct.re_unwind_branch_t* %6185, i32 0, i32 0
  %6187 = load i32* %6186, align 4
  %6188 = icmp eq i32 %6187, 1
  %6189 = select i1 %6188, i32 31, i32 56
  %6190 = icmp ne i32 %6184, %6189
  br i1 %6190, label %6191, label %6195

; <label>:6191                                    ; preds = %6180, %6172
  %6192 = load %struct.re_unwind_branch_t** %uwb, align 8
  %6193 = getelementptr inbounds %struct.re_unwind_branch_t* %6192, i32 0, i32 1
  %6194 = load i32* %6193, align 4
  store i32 %6194, i32* %unwind, align 4
  br label %6129

; <label>:6195                                    ; preds = %6180
  %6196 = load %struct.re_unwind_branch_t** %uwb, align 8
  %6197 = getelementptr inbounds %struct.re_unwind_branch_t* %6196, i32 0, i32 0
  %6198 = load i32* %6197, align 4
  %6199 = icmp eq i32 %6198, 1
  br i1 %6199, label %6200, label %6205

; <label>:6200                                    ; preds = %6195
  %6201 = load %struct.regnode** %next, align 8
  %6202 = getelementptr inbounds %struct.regnode* %6201, i32 0, i32 2
  %6203 = load i16* %6202, align 2
  %6204 = zext i16 %6203 to i32
  br label %6210

; <label>:6205                                    ; preds = %6195
  %6206 = load %struct.regnode** %next, align 8
  %6207 = bitcast %struct.regnode* %6206 to %struct.regnode_1*
  %6208 = getelementptr inbounds %struct.regnode_1* %6207, i32 0, i32 3
  %6209 = load i32* %6208, align 4
  br label %6210

; <label>:6210                                    ; preds = %6205, %6200
  %6211 = phi i32 [ %6204, %6200 ], [ %6209, %6205 ]
  store i32 %6211, i32* %n, align 4
  %6212 = icmp ne i32 %6211, 0
  br i1 %6212, label %6213, label %6218

; <label>:6213                                    ; preds = %6210
  %6214 = load i32* %n, align 4
  %6215 = load %struct.regnode** %next, align 8
  %6216 = sext i32 %6214 to i64
  %6217 = getelementptr inbounds %struct.regnode* %6215, i64 %6216
  store %struct.regnode* %6217, %struct.regnode** %next, align 8
  br label %6219

; <label>:6218                                    ; preds = %6210
  store %struct.regnode* null, %struct.regnode** %next, align 8
  br label %6219

; <label>:6219                                    ; preds = %6218, %6213
  %6220 = load %struct.regnode** %next, align 8
  %6221 = load %struct.re_unwind_branch_t** %uwb, align 8
  %6222 = getelementptr inbounds %struct.re_unwind_branch_t* %6221, i32 0, i32 4
  store %struct.regnode* %6220, %struct.regnode** %6222, align 8
  %6223 = load %struct.regnode** %scan, align 8
  %6224 = getelementptr inbounds %struct.regnode* %6223, i64 1
  store %struct.regnode* %6224, %struct.regnode** %next, align 8
  %6225 = load %struct.re_unwind_branch_t** %uwb, align 8
  %6226 = getelementptr inbounds %struct.re_unwind_branch_t* %6225, i32 0, i32 0
  %6227 = load i32* %6226, align 4
  %6228 = icmp eq i32 %6227, 2
  br i1 %6228, label %6229, label %6232

; <label>:6229                                    ; preds = %6219
  %6230 = load %struct.regnode** %next, align 8
  %6231 = getelementptr inbounds %struct.regnode* %6230, i64 1
  store %struct.regnode* %6231, %struct.regnode** %next, align 8
  br label %6232

; <label>:6232                                    ; preds = %6229, %6219
  %6233 = load %struct.re_unwind_branch_t** %uwb, align 8
  %6234 = getelementptr inbounds %struct.re_unwind_branch_t* %6233, i32 0, i32 5
  %6235 = load i8** %6234, align 8
  store i8* %6235, i8** %locinput, align 8
  %6236 = load %struct.re_unwind_branch_t** %uwb, align 8
  %6237 = getelementptr inbounds %struct.re_unwind_branch_t* %6236, i32 0, i32 6
  %6238 = load i32* %6237, align 4
  store i32 %6238, i32* %nextchr, align 4
  br label %6121

; <label>:6239                                    ; preds = %6132
  call void (i8*, ...)* @Perl_croak(i8* getelementptr inbounds ([32 x i8]* @.str11, i32 0, i32 0))
  br label %6240

; <label>:6240                                    ; preds = %6239
  br label %6241

; <label>:6241                                    ; preds = %6240, %6129
  store i32 0, i32* %1
  br label %6242

; <label>:6242                                    ; preds = %6241, %6126
  %6243 = load i32* %1
  ret i32 %6243
}

declare i64 @Perl_utf8n_to_uvuni(i8*, i64, i64*, i32) #1

declare i32 @Perl_ibcmp_utf8(i8*, i8**, i64, i8 signext, i8*, i8**, i64, i8 signext) #1

declare i32 @Perl_ibcmp(i8*, i8*, i32) #1

declare i32 @Perl_ibcmp_locale(i8*, i8*, i32) #1

declare i32 @reginclass(...) #1

declare void @Perl_push_scope() #1

declare void @Perl_save_re_context() #1

declare signext i8 @Perl_is_utf8_alnum(i8*) #1

declare void @Perl_pop_scope() #1

declare i64 @Perl_swash_fetch(%struct.sv*, i8*, i8 signext) #1

declare i64 @Perl_utf8_to_uvchr(i8*, i64*) #1

declare i16** @__ctype_b_loc() #1

declare signext i8 @Perl_is_uni_alnum_lc(i64) #1

declare signext i8 @Perl_is_uni_alnum(i64) #1

declare signext i8 @Perl_is_utf8_space(i8*) #1

declare signext i8 @Perl_is_uni_space_lc(i64) #1

declare signext i8 @Perl_is_utf8_digit(i8*) #1

declare signext i8 @Perl_is_uni_digit_lc(i64) #1

declare signext i8 @Perl_is_utf8_mark(i8*) #1

declare i64 @Perl_to_utf8_lower(i8*, i8*, i64*) #1

declare i32 @Perl_sv_unmagic(%struct.sv*, i32) #1

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #2

declare void @Perl_sv_magic(%struct.sv*, %struct.sv*, i32, i8*, i32) #1

declare i32 @regcppush(...) #1

declare i32 @regmatch(...) #1

declare void @Perl_leave_scope(i32) #1

declare i32 @regcppop(...) #1

declare signext i8 @Perl_sv_2bool(%struct.sv*) #1

declare %struct.sv* @Perl_save_scalar(%struct.gv*) #1

declare i8* @Perl_safesysrealloc(i8*, i64) #1

declare i8* @Perl_safesysmalloc(i64) #1

declare void @Perl_warner(i32, i8*, ...) #1

declare i32 @Perl_save_alloc(i32, i32) #1

declare i32 @regrepeat_hard(...) #1

declare %struct.regnode* @Perl_regnext(%struct.regnode*) #1

declare i64 @Perl_to_utf8_upper(i8*, i8*, i64*) #1

declare i32 @regrepeat(...) #1

declare i32 @regcp_set_to(...) #1

declare i32 @reghopmaybe(...) #1

declare i32 @PerlIO_printf(%struct._PerlIO**, i8*, ...) #1

declare %struct._PerlIO** @Perl_PerlIO_stderr() #1

; Function Attrs: nounwind uwtable
define %struct.sv* @Perl_regclass_swash(%struct.regnode* %node, i8 signext %doinit, %struct.sv** %listsvp, %struct.sv** %altsvp) #0 {
  %1 = alloca %struct.regnode*, align 8
  %2 = alloca i8, align 1
  %3 = alloca %struct.sv**, align 8
  %4 = alloca %struct.sv**, align 8
  %sw = alloca %struct.sv*, align 8
  %si = alloca %struct.sv*, align 8
  %alt = alloca %struct.sv*, align 8
  %n = alloca i32, align 4
  %rv = alloca %struct.sv*, align 8
  %av = alloca %struct.av*, align 8
  %ary = alloca %struct.sv**, align 8
  %a = alloca %struct.sv**, align 8
  %b = alloca %struct.sv**, align 8
  store %struct.regnode* %node, %struct.regnode** %1, align 8
  store i8 %doinit, i8* %2, align 1
  store %struct.sv** %listsvp, %struct.sv*** %3, align 8
  store %struct.sv** %altsvp, %struct.sv*** %4, align 8
  store %struct.sv* null, %struct.sv** %sw, align 8
  store %struct.sv* null, %struct.sv** %si, align 8
  store %struct.sv* null, %struct.sv** %alt, align 8
  %5 = load %struct.reg_data** @PL_regdata, align 8
  %6 = icmp ne %struct.reg_data* %5, null
  br i1 %6, label %7, label %102

; <label>:7                                       ; preds = %0
  %8 = load %struct.reg_data** @PL_regdata, align 8
  %9 = getelementptr inbounds %struct.reg_data* %8, i32 0, i32 0
  %10 = load i32* %9, align 4
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %12, label %102

; <label>:12                                      ; preds = %7
  %13 = load %struct.regnode** %1, align 8
  %14 = bitcast %struct.regnode* %13 to %struct.regnode_1*
  %15 = getelementptr inbounds %struct.regnode_1* %14, i32 0, i32 3
  %16 = load i32* %15, align 4
  store i32 %16, i32* %n, align 4
  %17 = load i32* %n, align 4
  %18 = zext i32 %17 to i64
  %19 = load %struct.reg_data** @PL_regdata, align 8
  %20 = getelementptr inbounds %struct.reg_data* %19, i32 0, i32 1
  %21 = load i8** %20, align 8
  %22 = getelementptr inbounds i8* %21, i64 %18
  %23 = load i8* %22, align 1
  %24 = zext i8 %23 to i32
  %25 = icmp eq i32 %24, 115
  br i1 %25, label %26, label %101

; <label>:26                                      ; preds = %12
  %27 = load i32* %n, align 4
  %28 = zext i32 %27 to i64
  %29 = load %struct.reg_data** @PL_regdata, align 8
  %30 = getelementptr inbounds %struct.reg_data* %29, i32 0, i32 2
  %31 = getelementptr inbounds [1 x i8*]* %30, i32 0, i64 %28
  %32 = load i8** %31, align 8
  %33 = bitcast i8* %32 to %struct.sv*
  store %struct.sv* %33, %struct.sv** %rv, align 8
  %34 = load %struct.sv** %rv, align 8
  %35 = getelementptr inbounds %struct.sv* %34, i32 0, i32 0
  %36 = load i8** %35, align 8
  %37 = bitcast i8* %36 to %struct.xrv*
  %38 = getelementptr inbounds %struct.xrv* %37, i32 0, i32 0
  %39 = load %struct.sv** %38, align 8
  %40 = bitcast %struct.sv* %39 to %struct.av*
  store %struct.av* %40, %struct.av** %av, align 8
  %41 = load %struct.av** %av, align 8
  %42 = getelementptr inbounds %struct.av* %41, i32 0, i32 0
  %43 = load %struct.xpvav** %42, align 8
  %44 = getelementptr inbounds %struct.xpvav* %43, i32 0, i32 0
  %45 = load i8** %44, align 8
  %46 = bitcast i8* %45 to %struct.sv**
  store %struct.sv** %46, %struct.sv*** %ary, align 8
  %47 = load %struct.sv*** %ary, align 8
  %48 = load %struct.sv** %47, align 8
  store %struct.sv* %48, %struct.sv** %si, align 8
  %49 = load %struct.sv*** %ary, align 8
  %50 = getelementptr inbounds %struct.sv** %49, i64 1
  %51 = load %struct.sv** %50, align 8
  %52 = getelementptr inbounds %struct.sv* %51, i32 0, i32 2
  %53 = load i32* %52, align 4
  %54 = and i32 %53, 255
  %55 = icmp eq i32 %54, 3
  br i1 %55, label %56, label %59

; <label>:56                                      ; preds = %26
  %57 = load %struct.sv*** %ary, align 8
  %58 = getelementptr inbounds %struct.sv** %57, i64 1
  br label %60

; <label>:59                                      ; preds = %26
  br label %60

; <label>:60                                      ; preds = %59, %56
  %61 = phi %struct.sv** [ %58, %56 ], [ null, %59 ]
  store %struct.sv** %61, %struct.sv*** %a, align 8
  %62 = load %struct.sv*** %ary, align 8
  %63 = getelementptr inbounds %struct.sv** %62, i64 2
  %64 = load %struct.sv** %63, align 8
  %65 = getelementptr inbounds %struct.sv* %64, i32 0, i32 2
  %66 = load i32* %65, align 4
  %67 = and i32 %66, 255
  %68 = icmp eq i32 %67, 10
  br i1 %68, label %69, label %72

; <label>:69                                      ; preds = %60
  %70 = load %struct.sv*** %ary, align 8
  %71 = getelementptr inbounds %struct.sv** %70, i64 2
  br label %73

; <label>:72                                      ; preds = %60
  br label %73

; <label>:73                                      ; preds = %72, %69
  %74 = phi %struct.sv** [ %71, %69 ], [ null, %72 ]
  store %struct.sv** %74, %struct.sv*** %b, align 8
  %75 = load %struct.sv*** %a, align 8
  %76 = icmp ne %struct.sv** %75, null
  br i1 %76, label %77, label %80

; <label>:77                                      ; preds = %73
  %78 = load %struct.sv*** %a, align 8
  %79 = load %struct.sv** %78, align 8
  store %struct.sv* %79, %struct.sv** %sw, align 8
  br label %94

; <label>:80                                      ; preds = %73
  %81 = load %struct.sv** %si, align 8
  %82 = icmp ne %struct.sv* %81, null
  br i1 %82, label %83, label %93

; <label>:83                                      ; preds = %80
  %84 = load i8* %2, align 1
  %85 = sext i8 %84 to i32
  %86 = icmp ne i32 %85, 0
  br i1 %86, label %87, label %93

; <label>:87                                      ; preds = %83
  %88 = load %struct.sv** %si, align 8
  %89 = call %struct.sv* @Perl_swash_init(i8* getelementptr inbounds ([5 x i8]* @.str12, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8]* @.str13, i32 0, i32 0), %struct.sv* %88, i32 1, i32 0)
  store %struct.sv* %89, %struct.sv** %sw, align 8
  %90 = load %struct.av** %av, align 8
  %91 = load %struct.sv** %sw, align 8
  %92 = call %struct.sv** @Perl_av_store(%struct.av* %90, i32 1, %struct.sv* %91)
  br label %93

; <label>:93                                      ; preds = %87, %83, %80
  br label %94

; <label>:94                                      ; preds = %93, %77
  %95 = load %struct.sv*** %b, align 8
  %96 = icmp ne %struct.sv** %95, null
  br i1 %96, label %97, label %100

; <label>:97                                      ; preds = %94
  %98 = load %struct.sv*** %b, align 8
  %99 = load %struct.sv** %98, align 8
  store %struct.sv* %99, %struct.sv** %alt, align 8
  br label %100

; <label>:100                                     ; preds = %97, %94
  br label %101

; <label>:101                                     ; preds = %100, %12
  br label %102

; <label>:102                                     ; preds = %101, %7, %0
  %103 = load %struct.sv*** %3, align 8
  %104 = icmp ne %struct.sv** %103, null
  br i1 %104, label %105, label %108

; <label>:105                                     ; preds = %102
  %106 = load %struct.sv** %si, align 8
  %107 = load %struct.sv*** %3, align 8
  store %struct.sv* %106, %struct.sv** %107, align 8
  br label %108

; <label>:108                                     ; preds = %105, %102
  %109 = load %struct.sv*** %4, align 8
  %110 = icmp ne %struct.sv** %109, null
  br i1 %110, label %111, label %114

; <label>:111                                     ; preds = %108
  %112 = load %struct.sv** %alt, align 8
  %113 = load %struct.sv*** %4, align 8
  store %struct.sv* %112, %struct.sv** %113, align 8
  br label %114

; <label>:114                                     ; preds = %111, %108
  %115 = load %struct.sv** %sw, align 8
  ret %struct.sv* %115
}

declare %struct.sv* @Perl_swash_init(i8*, i8*, %struct.sv*, i32, i32) #1

declare %struct.sv** @Perl_av_store(%struct.av*, i32, %struct.sv*) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
