; ModuleID = 'regexec.ll'
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
%struct.regnode_charclass = type { i8, i8, i16, i32, [32 x i8] }
%struct.regnode_1 = type { i8, i8, i16, i32 }
%struct.xrv = type { %struct.sv* }
%struct.xpviv = type { i8*, i64, i64, i64 }
%struct.xpvnv = type { i8*, i64, i64, i64, double }
%struct.regnode_2 = type { i8, i8, i16, i16, i16 }
%struct.re_unwind_branch_t = type { i32, i32, i32, i32, %struct.regnode*, i8*, i32 }
%union.re_unwind_t = type { %struct.re_unwind_branch_t }

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
  %1 = icmp ne i32 %nosave, 0
  %2 = select i1 %1, i32 0, i32 1
  %3 = call i32 @Perl_regexec_flags(%struct.regexp* %prog, i8* %stringarg, i8* %strend, i8* %strbeg, i32 %minend, %struct.sv* %screamer, i8* null, i32 %2)
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @Perl_regexec_flags(%struct.regexp* %prog, i8* %stringarg, i8* %strend, i8* %strbeg, i32 %minend, %struct.sv* %sv, i8* %data, i32 %flags) #0 {
  %scream_pos = alloca i32, align 4
  %scream_olds = alloca i8*, align 8
  %d = alloca %struct.re_scream_pos_data_s, align 8
  %len = alloca i64, align 8
  store i32 -1, i32* %scream_pos, align 4
  %1 = load %struct.gv** @PL_replgv, align 8
  %2 = getelementptr inbounds %struct.gv* %1, i32 0, i32 0
  %3 = load %struct.xpvgv** %2, align 8
  %4 = getelementptr inbounds %struct.xpvgv* %3, i32 0, i32 7
  %5 = load %struct.gp** %4, align 8
  %6 = getelementptr inbounds %struct.gp* %5, i32 0, i32 0
  %7 = load %struct.sv** %6, align 8
  %8 = getelementptr inbounds %struct.sv* %sv, i32 0, i32 2
  %9 = load i32* %8, align 4
  %10 = and i32 %9, 536870912
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %12, label %20

; <label>:12                                      ; preds = %0
  %13 = load volatile %struct.cop** @PL_curcop, align 8
  %14 = getelementptr inbounds %struct.cop* %13, i32 0, i32 7
  %15 = load i8* %14, align 1
  %16 = zext i8 %15 to i32
  %17 = and i32 %16, 8
  %18 = icmp ne i32 %17, 0
  %19 = xor i1 %18, true
  br label %20

; <label>:20                                      ; preds = %12, %0
  %21 = phi i1 [ false, %0 ], [ %19, %12 ]
  %22 = zext i1 %21 to i32
  %23 = trunc i32 %22 to i8
  %24 = sext i8 %23 to i32
  %25 = icmp ne i32 %24, 0
  br i1 %25, label %26, label %30

; <label>:26                                      ; preds = %20
  %27 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 15
  %28 = load i32* %27, align 4
  %29 = or i32 %28, 268435456
  store i32 %29, i32* %27, align 4
  store i8 1, i8* @PL_reg_match_utf8, align 1
  br label %34

; <label>:30                                      ; preds = %20
  %31 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 15
  %32 = load i32* %31, align 4
  %33 = and i32 %32, -268435457
  store i32 %33, i32* %31, align 4
  store i8 0, i8* @PL_reg_match_utf8, align 1
  br label %34

; <label>:34                                      ; preds = %30, %26
  %35 = phi i32 [ 1, %26 ], [ 0, %30 ]
  store %struct.curcur* null, %struct.curcur** @PL_regcc, align 8
  %36 = call i32 (%struct.regexp*, ...)* bitcast (i32 (...)* @cache_re to i32 (%struct.regexp*, ...)*)(%struct.regexp* %prog)
  %37 = icmp eq %struct.regexp* %prog, null
  br i1 %37, label %40, label %38

; <label>:38                                      ; preds = %34
  %39 = icmp eq i8* %stringarg, null
  br i1 %39, label %40, label %41

; <label>:40                                      ; preds = %38, %34
  call void (i8*, ...)* @Perl_croak(i8* getelementptr inbounds ([22 x i8]* @.str, i32 0, i32 0))
  br label %1193

; <label>:41                                      ; preds = %38
  %42 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 10
  %43 = load i32* %42, align 4
  %44 = ptrtoint i8* %strend to i64
  %45 = ptrtoint i8* %stringarg to i64
  %46 = sub i64 %44, %45
  %47 = sext i32 %43 to i64
  %48 = icmp slt i64 %46, %47
  br i1 %48, label %49, label %50

; <label>:49                                      ; preds = %41
  br label %1188

; <label>:50                                      ; preds = %41
  %51 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 16
  %52 = getelementptr inbounds [1 x %struct.regnode]* %51, i32 0, i32 0
  %53 = bitcast %struct.regnode* %52 to i8*
  %54 = load i8* %53, align 1
  %55 = zext i8 %54 to i32
  %56 = icmp ne i32 %55, 156
  br i1 %56, label %57, label %58

; <label>:57                                      ; preds = %50
  call void (i8*, ...)* @Perl_croak(i8* getelementptr inbounds ([25 x i8]* @.str1, i32 0, i32 0))
  br label %58

; <label>:58                                      ; preds = %57, %50
  store i32 0, i32* @PL_reg_flags, align 4
  store i32 0, i32* @PL_reg_eval_set, align 4
  store i32 0, i32* @PL_reg_maxiter, align 4
  %59 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 15
  %60 = load i32* %59, align 4
  %61 = and i32 %60, 65536
  %62 = icmp ne i32 %61, 0
  br i1 %62, label %63, label %66

; <label>:63                                      ; preds = %58
  %64 = load i32* @PL_reg_flags, align 4
  %65 = or i32 %64, 8
  store i32 %65, i32* @PL_reg_flags, align 4
  br label %66

; <label>:66                                      ; preds = %63, %58
  store i8* %stringarg, i8** @PL_regbol, align 8
  store i8* %strbeg, i8** @PL_bostr, align 8
  store %struct.sv* %sv, %struct.sv** @PL_reg_sv, align 8
  store i8* %strend, i8** @PL_regeol, align 8
  %67 = sext i32 %minend to i64
  %68 = getelementptr inbounds i8* %stringarg, i64 %67
  store i8* %68, i8** @PL_regtill, align 8
  store %struct.re_cc_state* null, %struct.re_cc_state** @PL_reg_call_cc, align 8
  %69 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 15
  %70 = load i32* %69, align 4
  %71 = and i32 %70, 128
  %72 = icmp ne i32 %71, 0
  br i1 %72, label %73, label %117

; <label>:73                                      ; preds = %66
  %74 = and i32 %flags, 8
  %75 = icmp ne i32 %74, 0
  br i1 %75, label %76, label %77

; <label>:76                                      ; preds = %73
  store i8* %stringarg, i8** @PL_reg_ganch, align 8
  br label %116

; <label>:77                                      ; preds = %73
  %78 = icmp ne %struct.sv* %sv, null
  br i1 %78, label %79, label %114

; <label>:79                                      ; preds = %77
  %80 = getelementptr inbounds %struct.sv* %sv, i32 0, i32 2
  %81 = load i32* %80, align 4
  %82 = and i32 %81, 255
  %83 = icmp uge i32 %82, 7
  br i1 %83, label %84, label %114

; <label>:84                                      ; preds = %79
  %85 = getelementptr inbounds %struct.sv* %sv, i32 0, i32 0
  %86 = load i8** %85, align 8
  %87 = bitcast i8* %86 to %struct.xpvmg*
  %88 = getelementptr inbounds %struct.xpvmg* %87, i32 0, i32 5
  %89 = load %struct.magic** %88, align 8
  %90 = icmp ne %struct.magic* %89, null
  br i1 %90, label %91, label %114

; <label>:91                                      ; preds = %84
  %92 = call %struct.magic* @Perl_mg_find(%struct.sv* %sv, i32 103)
  %93 = icmp ne %struct.magic* %92, null
  br i1 %93, label %94, label %114

; <label>:94                                      ; preds = %91
  %95 = getelementptr inbounds %struct.magic* %92, i32 0, i32 7
  %96 = load i32* %95, align 4
  %97 = icmp sge i32 %96, 0
  br i1 %97, label %98, label %114

; <label>:98                                      ; preds = %94
  %99 = getelementptr inbounds %struct.magic* %92, i32 0, i32 7
  %100 = load i32* %99, align 4
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds i8* %strbeg, i64 %101
  store i8* %102, i8** @PL_reg_ganch, align 8
  %103 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 15
  %104 = load i32* %103, align 4
  %105 = and i32 %104, 8
  %106 = icmp ne i32 %105, 0
  br i1 %106, label %107, label %113

; <label>:107                                     ; preds = %98
  %108 = load i8** @PL_reg_ganch, align 8
  %109 = icmp ugt i8* %stringarg, %108
  br i1 %109, label %110, label %111

; <label>:110                                     ; preds = %107
  br label %1188

; <label>:111                                     ; preds = %107
  %112 = load i8** @PL_reg_ganch, align 8
  br label %113

; <label>:113                                     ; preds = %111, %98
  %s.0 = phi i8* [ %112, %111 ], [ %stringarg, %98 ]
  br label %115

; <label>:114                                     ; preds = %94, %91, %84, %79, %77
  store i8* %strbeg, i8** @PL_reg_ganch, align 8
  br label %115

; <label>:115                                     ; preds = %114, %113
  %s.1 = phi i8* [ %s.0, %113 ], [ %stringarg, %114 ]
  br label %116

; <label>:116                                     ; preds = %115, %76
  %s.2 = phi i8* [ %stringarg, %76 ], [ %s.1, %115 ]
  br label %117

; <label>:117                                     ; preds = %116, %66
  %s.3 = phi i8* [ %s.2, %116 ], [ %stringarg, %66 ]
  %118 = and i32 %flags, 2
  %119 = icmp ne i32 %118, 0
  br i1 %119, label %143, label %120

; <label>:120                                     ; preds = %117
  %121 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %122 = load %struct.reg_substr_data** %121, align 8
  %123 = getelementptr inbounds %struct.reg_substr_data* %122, i32 0, i32 0
  %124 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %123, i32 0, i64 2
  %125 = getelementptr inbounds %struct.reg_substr_datum* %124, i32 0, i32 2
  %126 = load %struct.sv** %125, align 8
  %127 = icmp ne %struct.sv* %126, null
  br i1 %127, label %136, label %128

; <label>:128                                     ; preds = %120
  %129 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %130 = load %struct.reg_substr_data** %129, align 8
  %131 = getelementptr inbounds %struct.reg_substr_data* %130, i32 0, i32 0
  %132 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %131, i32 0, i64 2
  %133 = getelementptr inbounds %struct.reg_substr_datum* %132, i32 0, i32 3
  %134 = load %struct.sv** %133, align 8
  %135 = icmp ne %struct.sv* %134, null
  br i1 %135, label %136, label %143

; <label>:136                                     ; preds = %128, %120
  %137 = getelementptr inbounds %struct.re_scream_pos_data_s* %d, i32 0, i32 0
  store i8** %scream_olds, i8*** %137, align 8
  %138 = getelementptr inbounds %struct.re_scream_pos_data_s* %d, i32 0, i32 1
  store i32* %scream_pos, i32** %138, align 8
  %139 = call i8* @Perl_re_intuit_start(%struct.regexp* %prog, %struct.sv* %sv, i8* %s.3, i8* %strend, i32 %flags, %struct.re_scream_pos_data_s* %d)
  %140 = icmp ne i8* %139, null
  br i1 %140, label %142, label %141

; <label>:141                                     ; preds = %136
  br label %1188

; <label>:142                                     ; preds = %136
  br label %143

; <label>:143                                     ; preds = %142, %128, %117
  %s.4 = phi i8* [ %s.3, %117 ], [ %139, %142 ], [ %s.3, %128 ]
  %144 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 15
  %145 = load i32* %144, align 4
  %146 = and i32 %145, 7
  %147 = icmp ne i32 %146, 0
  br i1 %147, label %148, label %250

; <label>:148                                     ; preds = %143
  %149 = icmp eq i8* %s.4, %stringarg
  br i1 %149, label %150, label %154

; <label>:150                                     ; preds = %148
  %151 = call i32 (%struct.regexp*, i8*, ...)* bitcast (i32 (...)* @regtry to i32 (%struct.regexp*, i8*, ...)*)(%struct.regexp* %prog, i8* %stringarg)
  %152 = icmp ne i32 %151, 0
  br i1 %152, label %153, label %154

; <label>:153                                     ; preds = %150
  br label %1111

; <label>:154                                     ; preds = %150, %148
  %155 = load i32* @PL_multiline, align 4
  %156 = icmp ne i32 %155, 0
  br i1 %156, label %167, label %157

; <label>:157                                     ; preds = %154
  %158 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 15
  %159 = load i32* %158, align 4
  %160 = and i32 %159, 32
  %161 = icmp ne i32 %160, 0
  br i1 %161, label %167, label %162

; <label>:162                                     ; preds = %157
  %163 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 15
  %164 = load i32* %163, align 4
  %165 = and i32 %164, 2
  %166 = icmp ne i32 %165, 0
  br i1 %166, label %167, label %248

; <label>:167                                     ; preds = %162, %157, %154
  %168 = icmp ne i32 %43, 0
  br i1 %168, label %169, label %171

; <label>:169                                     ; preds = %167
  %170 = sub nsw i32 %43, 1
  br label %171

; <label>:171                                     ; preds = %169, %167
  %dontbother.0 = phi i32 [ %170, %169 ], [ 0, %167 ]
  %172 = load i8* @PL_reg_match_utf8, align 1
  %173 = sext i8 %172 to i32
  %174 = icmp ne i32 %173, 0
  br i1 %174, label %175, label %180

; <label>:175                                     ; preds = %171
  %176 = sub nsw i32 0, %dontbother.0
  %177 = call i32 (i8*, i32, i8*, ...)* bitcast (i32 (...)* @reghop3 to i32 (i8*, i32, i8*, ...)*)(i8* %strend, i32 %176, i8* %strbeg)
  %178 = sext i32 %177 to i64
  %179 = inttoptr i64 %178 to i8*
  br label %184

; <label>:180                                     ; preds = %171
  %181 = sub nsw i32 0, %dontbother.0
  %182 = sext i32 %181 to i64
  %183 = getelementptr inbounds i8* %strend, i64 %182
  br label %184

; <label>:184                                     ; preds = %180, %175
  %185 = phi i8* [ %179, %175 ], [ %183, %180 ]
  %186 = getelementptr inbounds i8* %185, i64 -1
  %187 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %188 = load %struct.reg_substr_data** %187, align 8
  %189 = getelementptr inbounds %struct.reg_substr_data* %188, i32 0, i32 0
  %190 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %189, i32 0, i64 2
  %191 = getelementptr inbounds %struct.reg_substr_datum* %190, i32 0, i32 2
  %192 = load %struct.sv** %191, align 8
  %193 = icmp ne %struct.sv* %192, null
  br i1 %193, label %202, label %194

; <label>:194                                     ; preds = %184
  %195 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %196 = load %struct.reg_substr_data** %195, align 8
  %197 = getelementptr inbounds %struct.reg_substr_data* %196, i32 0, i32 0
  %198 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %197, i32 0, i64 2
  %199 = getelementptr inbounds %struct.reg_substr_datum* %198, i32 0, i32 3
  %200 = load %struct.sv** %199, align 8
  %201 = icmp ne %struct.sv* %200, null
  br i1 %201, label %202, label %228

; <label>:202                                     ; preds = %194, %184
  %203 = icmp eq i8* %s.4, %stringarg
  br i1 %203, label %204, label %205

; <label>:204                                     ; preds = %202
  br label %211

; <label>:205                                     ; preds = %202
  br label %206

; <label>:206                                     ; preds = %227, %205
  %s.5 = phi i8* [ %s.7, %227 ], [ %s.4, %205 ]
  %207 = call i32 (%struct.regexp*, i8*, ...)* bitcast (i32 (...)* @regtry to i32 (%struct.regexp*, i8*, ...)*)(%struct.regexp* %prog, i8* %s.5)
  %208 = icmp ne i32 %207, 0
  br i1 %208, label %209, label %210

; <label>:209                                     ; preds = %206
  br label %1111

; <label>:210                                     ; preds = %206
  br label %211

; <label>:211                                     ; preds = %210, %204
  %s.6 = phi i8* [ %s.4, %204 ], [ %s.5, %210 ]
  %212 = icmp uge i8* %s.6, %186
  br i1 %212, label %213, label %214

; <label>:213                                     ; preds = %211
  br label %1188

; <label>:214                                     ; preds = %211
  %215 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 15
  %216 = load i32* %215, align 4
  %217 = and i32 %216, 3145728
  %218 = icmp ne i32 %217, 0
  br i1 %218, label %219, label %225

; <label>:219                                     ; preds = %214
  %220 = getelementptr inbounds i8* %s.6, i64 1
  %221 = call i8* @Perl_re_intuit_start(%struct.regexp* %prog, %struct.sv* %sv, i8* %220, i8* %strend, i32 %flags, %struct.re_scream_pos_data_s* null)
  %222 = icmp ne i8* %221, null
  br i1 %222, label %224, label %223

; <label>:223                                     ; preds = %219
  br label %1188

; <label>:224                                     ; preds = %219
  br label %227

; <label>:225                                     ; preds = %214
  %226 = getelementptr inbounds i8* %s.6, i32 1
  br label %227

; <label>:227                                     ; preds = %225, %224
  %s.7 = phi i8* [ %221, %224 ], [ %226, %225 ]
  br label %206

; <label>:228                                     ; preds = %194
  %229 = icmp ugt i8* %s.4, %stringarg
  br i1 %229, label %230, label %232

; <label>:230                                     ; preds = %228
  %231 = getelementptr inbounds i8* %s.4, i32 -1
  br label %232

; <label>:232                                     ; preds = %230, %228
  %s.8 = phi i8* [ %231, %230 ], [ %s.4, %228 ]
  br label %233

; <label>:233                                     ; preds = %245, %232
  %s.9 = phi i8* [ %s.8, %232 ], [ %236, %245 ]
  %234 = icmp ult i8* %s.9, %186
  br i1 %234, label %235, label %246

; <label>:235                                     ; preds = %233
  %236 = getelementptr inbounds i8* %s.9, i32 1
  %237 = load i8* %s.9, align 1
  %238 = sext i8 %237 to i32
  %239 = icmp eq i32 %238, 10
  br i1 %239, label %240, label %245

; <label>:240                                     ; preds = %235
  %241 = call i32 (%struct.regexp*, i8*, ...)* bitcast (i32 (...)* @regtry to i32 (%struct.regexp*, i8*, ...)*)(%struct.regexp* %prog, i8* %236)
  %242 = icmp ne i32 %241, 0
  br i1 %242, label %243, label %244

; <label>:243                                     ; preds = %240
  br label %1111

; <label>:244                                     ; preds = %240
  br label %245

; <label>:245                                     ; preds = %244, %235
  br label %233

; <label>:246                                     ; preds = %233
  br label %247

; <label>:247                                     ; preds = %246
  br label %248

; <label>:248                                     ; preds = %247, %162
  br label %249

; <label>:249                                     ; preds = %248
  br label %1188

; <label>:250                                     ; preds = %143
  %251 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 15
  %252 = load i32* %251, align 4
  %253 = and i32 %252, 8
  %254 = icmp ne i32 %253, 0
  br i1 %254, label %255, label %261

; <label>:255                                     ; preds = %250
  %256 = load i8** @PL_reg_ganch, align 8
  %257 = call i32 (%struct.regexp*, i8*, ...)* bitcast (i32 (...)* @regtry to i32 (%struct.regexp*, i8*, ...)*)(%struct.regexp* %prog, i8* %256)
  %258 = icmp ne i32 %257, 0
  br i1 %258, label %259, label %260

; <label>:259                                     ; preds = %255
  br label %1111

; <label>:260                                     ; preds = %255
  br label %1188

; <label>:261                                     ; preds = %250
  br label %262

; <label>:262                                     ; preds = %261
  %263 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %264 = load %struct.reg_substr_data** %263, align 8
  %265 = getelementptr inbounds %struct.reg_substr_data* %264, i32 0, i32 0
  %266 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %265, i32 0, i64 0
  %267 = getelementptr inbounds %struct.reg_substr_datum* %266, i32 0, i32 2
  %268 = load %struct.sv** %267, align 8
  %269 = icmp ne %struct.sv* %268, null
  br i1 %269, label %278, label %270

; <label>:270                                     ; preds = %262
  %271 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %272 = load %struct.reg_substr_data** %271, align 8
  %273 = getelementptr inbounds %struct.reg_substr_data* %272, i32 0, i32 0
  %274 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %273, i32 0, i64 0
  %275 = getelementptr inbounds %struct.reg_substr_datum* %274, i32 0, i32 3
  %276 = load %struct.sv** %275, align 8
  %277 = icmp ne %struct.sv* %276, null
  br i1 %277, label %278, label %415

; <label>:278                                     ; preds = %270, %262
  %279 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 15
  %280 = load i32* %279, align 4
  %281 = and i32 %280, 16
  %282 = icmp ne i32 %281, 0
  br i1 %282, label %283, label %415

; <label>:283                                     ; preds = %278
  %284 = sext i8 %23 to i32
  %285 = icmp ne i32 %284, 0
  br i1 %285, label %286, label %294

; <label>:286                                     ; preds = %283
  %287 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %288 = load %struct.reg_substr_data** %287, align 8
  %289 = getelementptr inbounds %struct.reg_substr_data* %288, i32 0, i32 0
  %290 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %289, i32 0, i64 0
  %291 = getelementptr inbounds %struct.reg_substr_datum* %290, i32 0, i32 3
  %292 = load %struct.sv** %291, align 8
  %293 = icmp ne %struct.sv* %292, null
  br i1 %293, label %311, label %302

; <label>:294                                     ; preds = %283
  %295 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %296 = load %struct.reg_substr_data** %295, align 8
  %297 = getelementptr inbounds %struct.reg_substr_data* %296, i32 0, i32 0
  %298 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %297, i32 0, i64 0
  %299 = getelementptr inbounds %struct.reg_substr_datum* %298, i32 0, i32 2
  %300 = load %struct.sv** %299, align 8
  %301 = icmp ne %struct.sv* %300, null
  br i1 %301, label %311, label %302

; <label>:302                                     ; preds = %294, %286
  %303 = sext i8 %23 to i32
  %304 = icmp ne i32 %303, 0
  br i1 %304, label %305, label %307

; <label>:305                                     ; preds = %302
  %306 = call i32 (%struct.regexp*, ...)* bitcast (i32 (...)* @to_utf8_substr to i32 (%struct.regexp*, ...)*)(%struct.regexp* %prog)
  br label %309

; <label>:307                                     ; preds = %302
  %308 = call i32 (%struct.regexp*, ...)* bitcast (i32 (...)* @to_byte_substr to i32 (%struct.regexp*, ...)*)(%struct.regexp* %prog)
  br label %309

; <label>:309                                     ; preds = %307, %305
  %310 = phi i32 [ %306, %305 ], [ %308, %307 ]
  br label %311

; <label>:311                                     ; preds = %309, %294, %286
  %312 = sext i8 %23 to i32
  %313 = icmp ne i32 %312, 0
  br i1 %313, label %314, label %321

; <label>:314                                     ; preds = %311
  %315 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %316 = load %struct.reg_substr_data** %315, align 8
  %317 = getelementptr inbounds %struct.reg_substr_data* %316, i32 0, i32 0
  %318 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %317, i32 0, i64 0
  %319 = getelementptr inbounds %struct.reg_substr_datum* %318, i32 0, i32 3
  %320 = load %struct.sv** %319, align 8
  br label %328

; <label>:321                                     ; preds = %311
  %322 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %323 = load %struct.reg_substr_data** %322, align 8
  %324 = getelementptr inbounds %struct.reg_substr_data* %323, i32 0, i32 0
  %325 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %324, i32 0, i64 0
  %326 = getelementptr inbounds %struct.reg_substr_datum* %325, i32 0, i32 2
  %327 = load %struct.sv** %326, align 8
  br label %328

; <label>:328                                     ; preds = %321, %314
  %329 = phi %struct.sv* [ %320, %314 ], [ %327, %321 ]
  %330 = getelementptr inbounds %struct.sv* %329, i32 0, i32 0
  %331 = load i8** %330, align 8
  %332 = bitcast i8* %331 to %struct.xpv*
  %333 = getelementptr inbounds %struct.xpv* %332, i32 0, i32 0
  %334 = load i8** %333, align 8
  %335 = getelementptr inbounds i8* %334, i64 0
  %336 = load i8* %335, align 1
  %337 = icmp ne i8 %23, 0
  br i1 %337, label %338, label %385

; <label>:338                                     ; preds = %328
  br label %339

; <label>:339                                     ; preds = %376, %338
  %s.10 = phi i8* [ %s.4, %338 ], [ %383, %376 ]
  %340 = icmp ult i8* %s.10, %strend
  br i1 %340, label %341, label %384

; <label>:341                                     ; preds = %339
  %342 = load i8* %s.10, align 1
  %343 = sext i8 %342 to i32
  %344 = sext i8 %336 to i32
  %345 = icmp eq i32 %343, %344
  br i1 %345, label %346, label %376

; <label>:346                                     ; preds = %341
  %347 = call i32 (%struct.regexp*, i8*, ...)* bitcast (i32 (...)* @regtry to i32 (%struct.regexp*, i8*, ...)*)(%struct.regexp* %prog, i8* %s.10)
  %348 = icmp ne i32 %347, 0
  br i1 %348, label %349, label %350

; <label>:349                                     ; preds = %346
  br label %1111

; <label>:350                                     ; preds = %346
  %351 = load i8* %s.10, align 1
  %352 = zext i8 %351 to i64
  %353 = getelementptr inbounds [0 x i8]* @PL_utf8skip, i32 0, i64 %352
  %354 = load i8* %353, align 1
  %355 = zext i8 %354 to i32
  %356 = sext i32 %355 to i64
  %357 = getelementptr inbounds i8* %s.10, i64 %356
  br label %358

; <label>:358                                     ; preds = %367, %350
  %s.11 = phi i8* [ %357, %350 ], [ %374, %367 ]
  %359 = icmp ult i8* %s.11, %strend
  br i1 %359, label %360, label %365

; <label>:360                                     ; preds = %358
  %361 = load i8* %s.11, align 1
  %362 = sext i8 %361 to i32
  %363 = sext i8 %336 to i32
  %364 = icmp eq i32 %362, %363
  br label %365

; <label>:365                                     ; preds = %360, %358
  %366 = phi i1 [ false, %358 ], [ %364, %360 ]
  br i1 %366, label %367, label %375

; <label>:367                                     ; preds = %365
  %368 = load i8* %s.11, align 1
  %369 = zext i8 %368 to i64
  %370 = getelementptr inbounds [0 x i8]* @PL_utf8skip, i32 0, i64 %369
  %371 = load i8* %370, align 1
  %372 = zext i8 %371 to i32
  %373 = sext i32 %372 to i64
  %374 = getelementptr inbounds i8* %s.11, i64 %373
  br label %358

; <label>:375                                     ; preds = %365
  br label %376

; <label>:376                                     ; preds = %375, %341
  %s.12 = phi i8* [ %s.11, %375 ], [ %s.10, %341 ]
  %377 = load i8* %s.12, align 1
  %378 = zext i8 %377 to i64
  %379 = getelementptr inbounds [0 x i8]* @PL_utf8skip, i32 0, i64 %378
  %380 = load i8* %379, align 1
  %381 = zext i8 %380 to i32
  %382 = sext i32 %381 to i64
  %383 = getelementptr inbounds i8* %s.12, i64 %382
  br label %339

; <label>:384                                     ; preds = %339
  br label %414

; <label>:385                                     ; preds = %328
  br label %386

; <label>:386                                     ; preds = %411, %385
  %s.13 = phi i8* [ %s.4, %385 ], [ %412, %411 ]
  %387 = icmp ult i8* %s.13, %strend
  br i1 %387, label %388, label %413

; <label>:388                                     ; preds = %386
  %389 = load i8* %s.13, align 1
  %390 = sext i8 %389 to i32
  %391 = sext i8 %336 to i32
  %392 = icmp eq i32 %390, %391
  br i1 %392, label %393, label %411

; <label>:393                                     ; preds = %388
  %394 = call i32 (%struct.regexp*, i8*, ...)* bitcast (i32 (...)* @regtry to i32 (%struct.regexp*, i8*, ...)*)(%struct.regexp* %prog, i8* %s.13)
  %395 = icmp ne i32 %394, 0
  br i1 %395, label %396, label %397

; <label>:396                                     ; preds = %393
  br label %1111

; <label>:397                                     ; preds = %393
  %398 = getelementptr inbounds i8* %s.13, i32 1
  br label %399

; <label>:399                                     ; preds = %408, %397
  %s.14 = phi i8* [ %398, %397 ], [ %409, %408 ]
  %400 = icmp ult i8* %s.14, %strend
  br i1 %400, label %401, label %406

; <label>:401                                     ; preds = %399
  %402 = load i8* %s.14, align 1
  %403 = sext i8 %402 to i32
  %404 = sext i8 %336 to i32
  %405 = icmp eq i32 %403, %404
  br label %406

; <label>:406                                     ; preds = %401, %399
  %407 = phi i1 [ false, %399 ], [ %405, %401 ]
  br i1 %407, label %408, label %410

; <label>:408                                     ; preds = %406
  %409 = getelementptr inbounds i8* %s.14, i32 1
  br label %399

; <label>:410                                     ; preds = %406
  br label %411

; <label>:411                                     ; preds = %410, %388
  %s.15 = phi i8* [ %s.14, %410 ], [ %s.13, %388 ]
  %412 = getelementptr inbounds i8* %s.15, i32 1
  br label %386

; <label>:413                                     ; preds = %386
  br label %414

; <label>:414                                     ; preds = %413, %384
  br label %1110

; <label>:415                                     ; preds = %278, %270
  %416 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %417 = load %struct.reg_substr_data** %416, align 8
  %418 = getelementptr inbounds %struct.reg_substr_data* %417, i32 0, i32 0
  %419 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %418, i32 0, i64 0
  %420 = getelementptr inbounds %struct.reg_substr_datum* %419, i32 0, i32 2
  %421 = load %struct.sv** %420, align 8
  %422 = icmp ne %struct.sv* %421, null
  br i1 %422, label %459, label %423

; <label>:423                                     ; preds = %415
  %424 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %425 = load %struct.reg_substr_data** %424, align 8
  %426 = getelementptr inbounds %struct.reg_substr_data* %425, i32 0, i32 0
  %427 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %426, i32 0, i64 0
  %428 = getelementptr inbounds %struct.reg_substr_datum* %427, i32 0, i32 3
  %429 = load %struct.sv** %428, align 8
  %430 = icmp ne %struct.sv* %429, null
  br i1 %430, label %459, label %431

; <label>:431                                     ; preds = %423
  %432 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %433 = load %struct.reg_substr_data** %432, align 8
  %434 = getelementptr inbounds %struct.reg_substr_data* %433, i32 0, i32 0
  %435 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %434, i32 0, i64 1
  %436 = getelementptr inbounds %struct.reg_substr_datum* %435, i32 0, i32 2
  %437 = load %struct.sv** %436, align 8
  %438 = icmp ne %struct.sv* %437, null
  br i1 %438, label %447, label %439

; <label>:439                                     ; preds = %431
  %440 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %441 = load %struct.reg_substr_data** %440, align 8
  %442 = getelementptr inbounds %struct.reg_substr_data* %441, i32 0, i32 0
  %443 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %442, i32 0, i64 1
  %444 = getelementptr inbounds %struct.reg_substr_datum* %443, i32 0, i32 3
  %445 = load %struct.sv** %444, align 8
  %446 = icmp ne %struct.sv* %445, null
  br i1 %446, label %447, label %851

; <label>:447                                     ; preds = %439, %431
  %448 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %449 = load %struct.reg_substr_data** %448, align 8
  %450 = getelementptr inbounds %struct.reg_substr_data* %449, i32 0, i32 0
  %451 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %450, i32 0, i64 1
  %452 = getelementptr inbounds %struct.reg_substr_datum* %451, i32 0, i32 1
  %453 = load i32* %452, align 4
  %454 = sext i32 %453 to i64
  %455 = ptrtoint i8* %strend to i64
  %456 = ptrtoint i8* %s.4 to i64
  %457 = sub i64 %455, %456
  %458 = icmp slt i64 %454, %457
  br i1 %458, label %459, label %851

; <label>:459                                     ; preds = %447, %423, %415
  %460 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %461 = load %struct.reg_substr_data** %460, align 8
  %462 = getelementptr inbounds %struct.reg_substr_data* %461, i32 0, i32 0
  %463 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %462, i32 0, i64 0
  %464 = getelementptr inbounds %struct.reg_substr_datum* %463, i32 0, i32 2
  %465 = load %struct.sv** %464, align 8
  %466 = icmp ne %struct.sv* %465, null
  br i1 %466, label %475, label %467

; <label>:467                                     ; preds = %459
  %468 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %469 = load %struct.reg_substr_data** %468, align 8
  %470 = getelementptr inbounds %struct.reg_substr_data* %469, i32 0, i32 0
  %471 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %470, i32 0, i64 0
  %472 = getelementptr inbounds %struct.reg_substr_datum* %471, i32 0, i32 3
  %473 = load %struct.sv** %472, align 8
  %474 = icmp ne %struct.sv* %473, null
  br i1 %474, label %475, label %528

; <label>:475                                     ; preds = %467, %459
  %476 = sext i8 %23 to i32
  %477 = icmp ne i32 %476, 0
  br i1 %477, label %478, label %486

; <label>:478                                     ; preds = %475
  %479 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %480 = load %struct.reg_substr_data** %479, align 8
  %481 = getelementptr inbounds %struct.reg_substr_data* %480, i32 0, i32 0
  %482 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %481, i32 0, i64 0
  %483 = getelementptr inbounds %struct.reg_substr_datum* %482, i32 0, i32 3
  %484 = load %struct.sv** %483, align 8
  %485 = icmp ne %struct.sv* %484, null
  br i1 %485, label %503, label %494

; <label>:486                                     ; preds = %475
  %487 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %488 = load %struct.reg_substr_data** %487, align 8
  %489 = getelementptr inbounds %struct.reg_substr_data* %488, i32 0, i32 0
  %490 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %489, i32 0, i64 0
  %491 = getelementptr inbounds %struct.reg_substr_datum* %490, i32 0, i32 2
  %492 = load %struct.sv** %491, align 8
  %493 = icmp ne %struct.sv* %492, null
  br i1 %493, label %503, label %494

; <label>:494                                     ; preds = %486, %478
  %495 = sext i8 %23 to i32
  %496 = icmp ne i32 %495, 0
  br i1 %496, label %497, label %499

; <label>:497                                     ; preds = %494
  %498 = call i32 (%struct.regexp*, ...)* bitcast (i32 (...)* @to_utf8_substr to i32 (%struct.regexp*, ...)*)(%struct.regexp* %prog)
  br label %501

; <label>:499                                     ; preds = %494
  %500 = call i32 (%struct.regexp*, ...)* bitcast (i32 (...)* @to_byte_substr to i32 (%struct.regexp*, ...)*)(%struct.regexp* %prog)
  br label %501

; <label>:501                                     ; preds = %499, %497
  %502 = phi i32 [ %498, %497 ], [ %500, %499 ]
  br label %503

; <label>:503                                     ; preds = %501, %486, %478
  %504 = sext i8 %23 to i32
  %505 = icmp ne i32 %504, 0
  br i1 %505, label %506, label %513

; <label>:506                                     ; preds = %503
  %507 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %508 = load %struct.reg_substr_data** %507, align 8
  %509 = getelementptr inbounds %struct.reg_substr_data* %508, i32 0, i32 0
  %510 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %509, i32 0, i64 0
  %511 = getelementptr inbounds %struct.reg_substr_datum* %510, i32 0, i32 3
  %512 = load %struct.sv** %511, align 8
  br label %520

; <label>:513                                     ; preds = %503
  %514 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %515 = load %struct.reg_substr_data** %514, align 8
  %516 = getelementptr inbounds %struct.reg_substr_data* %515, i32 0, i32 0
  %517 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %516, i32 0, i64 0
  %518 = getelementptr inbounds %struct.reg_substr_datum* %517, i32 0, i32 2
  %519 = load %struct.sv** %518, align 8
  br label %520

; <label>:520                                     ; preds = %513, %506
  %521 = phi %struct.sv* [ %512, %506 ], [ %519, %513 ]
  %522 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %523 = load %struct.reg_substr_data** %522, align 8
  %524 = getelementptr inbounds %struct.reg_substr_data* %523, i32 0, i32 0
  %525 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %524, i32 0, i64 0
  %526 = getelementptr inbounds %struct.reg_substr_datum* %525, i32 0, i32 0
  %527 = load i32* %526, align 4
  br label %587

; <label>:528                                     ; preds = %467
  %529 = sext i8 %23 to i32
  %530 = icmp ne i32 %529, 0
  br i1 %530, label %531, label %539

; <label>:531                                     ; preds = %528
  %532 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %533 = load %struct.reg_substr_data** %532, align 8
  %534 = getelementptr inbounds %struct.reg_substr_data* %533, i32 0, i32 0
  %535 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %534, i32 0, i64 1
  %536 = getelementptr inbounds %struct.reg_substr_datum* %535, i32 0, i32 3
  %537 = load %struct.sv** %536, align 8
  %538 = icmp ne %struct.sv* %537, null
  br i1 %538, label %556, label %547

; <label>:539                                     ; preds = %528
  %540 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %541 = load %struct.reg_substr_data** %540, align 8
  %542 = getelementptr inbounds %struct.reg_substr_data* %541, i32 0, i32 0
  %543 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %542, i32 0, i64 1
  %544 = getelementptr inbounds %struct.reg_substr_datum* %543, i32 0, i32 2
  %545 = load %struct.sv** %544, align 8
  %546 = icmp ne %struct.sv* %545, null
  br i1 %546, label %556, label %547

; <label>:547                                     ; preds = %539, %531
  %548 = sext i8 %23 to i32
  %549 = icmp ne i32 %548, 0
  br i1 %549, label %550, label %552

; <label>:550                                     ; preds = %547
  %551 = call i32 (%struct.regexp*, ...)* bitcast (i32 (...)* @to_utf8_substr to i32 (%struct.regexp*, ...)*)(%struct.regexp* %prog)
  br label %554

; <label>:552                                     ; preds = %547
  %553 = call i32 (%struct.regexp*, ...)* bitcast (i32 (...)* @to_byte_substr to i32 (%struct.regexp*, ...)*)(%struct.regexp* %prog)
  br label %554

; <label>:554                                     ; preds = %552, %550
  %555 = phi i32 [ %551, %550 ], [ %553, %552 ]
  br label %556

; <label>:556                                     ; preds = %554, %539, %531
  %557 = sext i8 %23 to i32
  %558 = icmp ne i32 %557, 0
  br i1 %558, label %559, label %566

; <label>:559                                     ; preds = %556
  %560 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %561 = load %struct.reg_substr_data** %560, align 8
  %562 = getelementptr inbounds %struct.reg_substr_data* %561, i32 0, i32 0
  %563 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %562, i32 0, i64 1
  %564 = getelementptr inbounds %struct.reg_substr_datum* %563, i32 0, i32 3
  %565 = load %struct.sv** %564, align 8
  br label %573

; <label>:566                                     ; preds = %556
  %567 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %568 = load %struct.reg_substr_data** %567, align 8
  %569 = getelementptr inbounds %struct.reg_substr_data* %568, i32 0, i32 0
  %570 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %569, i32 0, i64 1
  %571 = getelementptr inbounds %struct.reg_substr_datum* %570, i32 0, i32 2
  %572 = load %struct.sv** %571, align 8
  br label %573

; <label>:573                                     ; preds = %566, %559
  %574 = phi %struct.sv* [ %565, %559 ], [ %572, %566 ]
  %575 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %576 = load %struct.reg_substr_data** %575, align 8
  %577 = getelementptr inbounds %struct.reg_substr_data* %576, i32 0, i32 0
  %578 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %577, i32 0, i64 1
  %579 = getelementptr inbounds %struct.reg_substr_datum* %578, i32 0, i32 1
  %580 = load i32* %579, align 4
  %581 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %582 = load %struct.reg_substr_data** %581, align 8
  %583 = getelementptr inbounds %struct.reg_substr_data* %582, i32 0, i32 0
  %584 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %583, i32 0, i64 1
  %585 = getelementptr inbounds %struct.reg_substr_datum* %584, i32 0, i32 0
  %586 = load i32* %585, align 4
  br label %587

; <label>:587                                     ; preds = %573, %520
  %must.0 = phi %struct.sv* [ %521, %520 ], [ %574, %573 ]
  %back_max.0 = phi i32 [ %527, %520 ], [ %580, %573 ]
  %back_min.0 = phi i32 [ %527, %520 ], [ %586, %573 ]
  %588 = icmp eq %struct.sv* %must.0, @PL_sv_undef
  br i1 %588, label %589, label %590

; <label>:589                                     ; preds = %587
  br label %1188

; <label>:590                                     ; preds = %587
  %591 = load i8* @PL_reg_match_utf8, align 1
  %592 = sext i8 %591 to i32
  %593 = icmp ne i32 %592, 0
  br i1 %593, label %594, label %621

; <label>:594                                     ; preds = %590
  %595 = sext i8 %23 to i32
  %596 = icmp ne i32 %595, 0
  br i1 %596, label %597, label %599

; <label>:597                                     ; preds = %594
  %598 = call i64 @Perl_sv_len_utf8(%struct.sv* %must.0)
  br label %605

; <label>:599                                     ; preds = %594
  %600 = getelementptr inbounds %struct.sv* %must.0, i32 0, i32 0
  %601 = load i8** %600, align 8
  %602 = bitcast i8* %601 to %struct.xpv*
  %603 = getelementptr inbounds %struct.xpv* %602, i32 0, i32 1
  %604 = load i64* %603, align 8
  br label %605

; <label>:605                                     ; preds = %599, %597
  %606 = phi i64 [ %598, %597 ], [ %604, %599 ]
  %607 = getelementptr inbounds %struct.sv* %must.0, i32 0, i32 2
  %608 = load i32* %607, align 4
  %609 = and i32 %608, 1073741824
  %610 = icmp ne i32 %609, 0
  %611 = zext i1 %610 to i32
  %612 = sext i32 %611 to i64
  %613 = sub i64 %606, %612
  %614 = sext i32 %back_min.0 to i64
  %615 = add i64 %613, %614
  %616 = trunc i64 %615 to i32
  %617 = sub nsw i32 0, %616
  %618 = call i32 (i8*, i32, i8*, ...)* bitcast (i32 (...)* @reghop3 to i32 (i8*, i32, i8*, ...)*)(i8* %strend, i32 %617, i8* %strbeg)
  %619 = sext i32 %618 to i64
  %620 = inttoptr i64 %619 to i8*
  br label %647

; <label>:621                                     ; preds = %590
  %622 = sext i8 %23 to i32
  %623 = icmp ne i32 %622, 0
  br i1 %623, label %624, label %626

; <label>:624                                     ; preds = %621
  %625 = call i64 @Perl_sv_len_utf8(%struct.sv* %must.0)
  br label %632

; <label>:626                                     ; preds = %621
  %627 = getelementptr inbounds %struct.sv* %must.0, i32 0, i32 0
  %628 = load i8** %627, align 8
  %629 = bitcast i8* %628 to %struct.xpv*
  %630 = getelementptr inbounds %struct.xpv* %629, i32 0, i32 1
  %631 = load i64* %630, align 8
  br label %632

; <label>:632                                     ; preds = %626, %624
  %633 = phi i64 [ %625, %624 ], [ %631, %626 ]
  %634 = getelementptr inbounds %struct.sv* %must.0, i32 0, i32 2
  %635 = load i32* %634, align 4
  %636 = and i32 %635, 1073741824
  %637 = icmp ne i32 %636, 0
  %638 = zext i1 %637 to i32
  %639 = sext i32 %638 to i64
  %640 = sub i64 %633, %639
  %641 = sext i32 %back_min.0 to i64
  %642 = add i64 %640, %641
  %643 = trunc i64 %642 to i32
  %644 = sub nsw i32 0, %643
  %645 = sext i32 %644 to i64
  %646 = getelementptr inbounds i8* %strend, i64 %645
  br label %647

; <label>:647                                     ; preds = %632, %605
  %648 = phi i8* [ %620, %605 ], [ %646, %632 ]
  %649 = load i8** @PL_bostr, align 8
  %650 = icmp ugt i8* %s.4, %649
  br i1 %650, label %651, label %663

; <label>:651                                     ; preds = %647
  %652 = load i8* @PL_reg_match_utf8, align 1
  %653 = sext i8 %652 to i32
  %654 = icmp ne i32 %653, 0
  br i1 %654, label %655, label %659

; <label>:655                                     ; preds = %651
  %656 = call i32 (i8*, i32, ...)* bitcast (i32 (...)* @reghop to i32 (i8*, i32, ...)*)(i8* %s.4, i32 -1)
  %657 = sext i32 %656 to i64
  %658 = inttoptr i64 %657 to i8*
  br label %661

; <label>:659                                     ; preds = %651
  %660 = getelementptr inbounds i8* %s.4, i64 -1
  br label %661

; <label>:661                                     ; preds = %659, %655
  %662 = phi i8* [ %658, %655 ], [ %660, %659 ]
  br label %665

; <label>:663                                     ; preds = %647
  %664 = getelementptr inbounds i8* %s.4, i64 -1
  br label %665

; <label>:665                                     ; preds = %663, %661
  %last1.0 = phi i8* [ %662, %661 ], [ %664, %663 ]
  store i32 -1, i32* %scream_pos, align 4
  %666 = load i8* @PL_reg_match_utf8, align 1
  %667 = sext i8 %666 to i32
  %668 = icmp ne i32 %667, 0
  br i1 %668, label %669, label %674

; <label>:669                                     ; preds = %665
  %670 = sub nsw i32 0, 0
  %671 = call i32 (i8*, i32, ...)* bitcast (i32 (...)* @reghop to i32 (i8*, i32, ...)*)(i8* %strend, i32 %670)
  %672 = sext i32 %671 to i64
  %673 = inttoptr i64 %672 to i8*
  br label %678

; <label>:674                                     ; preds = %665
  %675 = sub nsw i32 0, 0
  %676 = sext i32 %675 to i64
  %677 = getelementptr inbounds i8* %strend, i64 %676
  br label %678

; <label>:678                                     ; preds = %674, %669
  %679 = phi i8* [ %673, %669 ], [ %677, %674 ]
  br label %680

; <label>:680                                     ; preds = %849, %678
  %s.16 = phi i8* [ %s.4, %678 ], [ %s.23, %849 ]
  %last1.1 = phi i8* [ %last1.0, %678 ], [ %last1.2, %849 ]
  %681 = icmp ule i8* %s.16, %648
  br i1 %681, label %682, label %723

; <label>:682                                     ; preds = %680
  %683 = and i32 %flags, 4
  %684 = icmp ne i32 %683, 0
  br i1 %684, label %685, label %703

; <label>:685                                     ; preds = %682
  %686 = load i8* @PL_reg_match_utf8, align 1
  %687 = sext i8 %686 to i32
  %688 = icmp ne i32 %687, 0
  br i1 %688, label %689, label %693

; <label>:689                                     ; preds = %685
  %690 = call i32 (i8*, i32, i8*, ...)* bitcast (i32 (...)* @reghop3 to i32 (i8*, i32, i8*, ...)*)(i8* %s.16, i32 %back_min.0, i8* %679)
  %691 = sext i32 %690 to i64
  %692 = inttoptr i64 %691 to i8*
  br label %696

; <label>:693                                     ; preds = %685
  %694 = sext i32 %back_min.0 to i64
  %695 = getelementptr inbounds i8* %s.16, i64 %694
  br label %696

; <label>:696                                     ; preds = %693, %689
  %697 = phi i8* [ %692, %689 ], [ %695, %693 ]
  %698 = ptrtoint i8* %697 to i64
  %699 = ptrtoint i8* %strbeg to i64
  %700 = sub i64 %698, %699
  %701 = trunc i64 %700 to i32
  %702 = call i8* @Perl_screaminstr(%struct.sv* %sv, %struct.sv* %must.0, i32 %701, i32 0, i32* %scream_pos, i32 0)
  br label %720

; <label>:703                                     ; preds = %682
  %704 = load i8* @PL_reg_match_utf8, align 1
  %705 = sext i8 %704 to i32
  %706 = icmp ne i32 %705, 0
  br i1 %706, label %707, label %711

; <label>:707                                     ; preds = %703
  %708 = call i32 (i8*, i32, i8*, ...)* bitcast (i32 (...)* @reghop3 to i32 (i8*, i32, i8*, ...)*)(i8* %s.16, i32 %back_min.0, i8* %679)
  %709 = sext i32 %708 to i64
  %710 = inttoptr i64 %709 to i8*
  br label %714

; <label>:711                                     ; preds = %703
  %712 = sext i32 %back_min.0 to i64
  %713 = getelementptr inbounds i8* %s.16, i64 %712
  br label %714

; <label>:714                                     ; preds = %711, %707
  %715 = phi i8* [ %710, %707 ], [ %713, %711 ]
  %716 = load i32* @PL_multiline, align 4
  %717 = icmp ne i32 %716, 0
  %718 = select i1 %717, i32 1, i32 0
  %719 = call i8* @Perl_fbm_instr(i8* %715, i8* %679, %struct.sv* %must.0, i32 %718)
  br label %720

; <label>:720                                     ; preds = %714, %696
  %s.17 = phi i8* [ %702, %696 ], [ %719, %714 ]
  %721 = phi i8* [ %702, %696 ], [ %719, %714 ]
  %722 = icmp ne i8* %721, null
  br label %723

; <label>:723                                     ; preds = %720, %680
  %s.18 = phi i8* [ %s.17, %720 ], [ %s.16, %680 ]
  %724 = phi i1 [ false, %680 ], [ %722, %720 ]
  br i1 %724, label %725, label %850

; <label>:725                                     ; preds = %723
  %726 = and i32 %flags, 4
  %727 = icmp ne i32 %726, 0
  br i1 %727, label %728, label %743

; <label>:728                                     ; preds = %725
  %729 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 15
  %730 = load i32* %729, align 4
  %731 = and i32 %730, 262144
  %732 = icmp ne i32 %731, 0
  br i1 %732, label %733, label %743

; <label>:733                                     ; preds = %728
  %734 = getelementptr inbounds %struct.sv* %sv, i32 0, i32 0
  %735 = load i8** %734, align 8
  %736 = bitcast i8* %735 to %struct.xpv*
  %737 = getelementptr inbounds %struct.xpv* %736, i32 0, i32 0
  %738 = load i8** %737, align 8
  %739 = ptrtoint i8* %s.18 to i64
  %740 = ptrtoint i8* %738 to i64
  %741 = sub i64 %739, %740
  %742 = getelementptr inbounds i8* %strbeg, i64 %741
  br label %743

; <label>:743                                     ; preds = %733, %728, %725
  %s.19 = phi i8* [ %742, %733 ], [ %s.18, %728 ], [ %s.18, %725 ]
  %744 = load i8* @PL_reg_match_utf8, align 1
  %745 = sext i8 %744 to i32
  %746 = icmp ne i32 %745, 0
  br i1 %746, label %747, label %752

; <label>:747                                     ; preds = %743
  %748 = sub nsw i32 0, %back_max.0
  %749 = call i32 (i8*, i32, ...)* bitcast (i32 (...)* @reghop to i32 (i8*, i32, ...)*)(i8* %s.19, i32 %748)
  %750 = sext i32 %749 to i64
  %751 = inttoptr i64 %750 to i8*
  br label %756

; <label>:752                                     ; preds = %743
  %753 = sub nsw i32 0, %back_max.0
  %754 = sext i32 %753 to i64
  %755 = getelementptr inbounds i8* %s.19, i64 %754
  br label %756

; <label>:756                                     ; preds = %752, %747
  %757 = phi i8* [ %751, %747 ], [ %755, %752 ]
  %758 = icmp ugt i8* %757, %last1.1
  br i1 %758, label %759, label %788

; <label>:759                                     ; preds = %756
  %760 = load i8* @PL_reg_match_utf8, align 1
  %761 = sext i8 %760 to i32
  %762 = icmp ne i32 %761, 0
  br i1 %762, label %763, label %768

; <label>:763                                     ; preds = %759
  %764 = sub nsw i32 0, %back_min.0
  %765 = call i32 (i8*, i32, ...)* bitcast (i32 (...)* @reghop to i32 (i8*, i32, ...)*)(i8* %s.19, i32 %764)
  %766 = sext i32 %765 to i64
  %767 = inttoptr i64 %766 to i8*
  br label %772

; <label>:768                                     ; preds = %759
  %769 = sub nsw i32 0, %back_min.0
  %770 = sext i32 %769 to i64
  %771 = getelementptr inbounds i8* %s.19, i64 %770
  br label %772

; <label>:772                                     ; preds = %768, %763
  %773 = phi i8* [ %767, %763 ], [ %771, %768 ]
  %774 = load i8* @PL_reg_match_utf8, align 1
  %775 = sext i8 %774 to i32
  %776 = icmp ne i32 %775, 0
  br i1 %776, label %777, label %782

; <label>:777                                     ; preds = %772
  %778 = sub nsw i32 0, %back_max.0
  %779 = call i32 (i8*, i32, ...)* bitcast (i32 (...)* @reghop to i32 (i8*, i32, ...)*)(i8* %s.19, i32 %778)
  %780 = sext i32 %779 to i64
  %781 = inttoptr i64 %780 to i8*
  br label %786

; <label>:782                                     ; preds = %772
  %783 = sub nsw i32 0, %back_max.0
  %784 = sext i32 %783 to i64
  %785 = getelementptr inbounds i8* %s.19, i64 %784
  br label %786

; <label>:786                                     ; preds = %782, %777
  %787 = phi i8* [ %781, %777 ], [ %785, %782 ]
  br label %821

; <label>:788                                     ; preds = %756
  %789 = load i8** @PL_bostr, align 8
  %790 = icmp uge i8* %last1.1, %789
  br i1 %790, label %791, label %803

; <label>:791                                     ; preds = %788
  %792 = load i8* @PL_reg_match_utf8, align 1
  %793 = sext i8 %792 to i32
  %794 = icmp ne i32 %793, 0
  br i1 %794, label %795, label %799

; <label>:795                                     ; preds = %791
  %796 = call i32 (i8*, i32, ...)* bitcast (i32 (...)* @reghop to i32 (i8*, i32, ...)*)(i8* %last1.1, i32 1)
  %797 = sext i32 %796 to i64
  %798 = inttoptr i64 %797 to i8*
  br label %801

; <label>:799                                     ; preds = %791
  %800 = getelementptr inbounds i8* %last1.1, i64 1
  br label %801

; <label>:801                                     ; preds = %799, %795
  %802 = phi i8* [ %798, %795 ], [ %800, %799 ]
  br label %805

; <label>:803                                     ; preds = %788
  %804 = getelementptr inbounds i8* %last1.1, i64 1
  br label %805

; <label>:805                                     ; preds = %803, %801
  %806 = phi i8* [ %802, %801 ], [ %804, %803 ]
  %807 = load i8* @PL_reg_match_utf8, align 1
  %808 = sext i8 %807 to i32
  %809 = icmp ne i32 %808, 0
  br i1 %809, label %810, label %815

; <label>:810                                     ; preds = %805
  %811 = sub nsw i32 0, %back_min.0
  %812 = call i32 (i8*, i32, ...)* bitcast (i32 (...)* @reghop to i32 (i8*, i32, ...)*)(i8* %s.19, i32 %811)
  %813 = sext i32 %812 to i64
  %814 = inttoptr i64 %813 to i8*
  br label %819

; <label>:815                                     ; preds = %805
  %816 = sub nsw i32 0, %back_min.0
  %817 = sext i32 %816 to i64
  %818 = getelementptr inbounds i8* %s.19, i64 %817
  br label %819

; <label>:819                                     ; preds = %815, %810
  %820 = phi i8* [ %814, %810 ], [ %818, %815 ]
  br label %821

; <label>:821                                     ; preds = %819, %786
  %s.20 = phi i8* [ %787, %786 ], [ %806, %819 ]
  %last1.2 = phi i8* [ %773, %786 ], [ %820, %819 ]
  %822 = icmp ne i8 %23, 0
  br i1 %822, label %823, label %839

; <label>:823                                     ; preds = %821
  br label %824

; <label>:824                                     ; preds = %830, %823
  %s.21 = phi i8* [ %s.20, %823 ], [ %837, %830 ]
  %825 = icmp ule i8* %s.21, %last1.2
  br i1 %825, label %826, label %838

; <label>:826                                     ; preds = %824
  %827 = call i32 (%struct.regexp*, i8*, ...)* bitcast (i32 (...)* @regtry to i32 (%struct.regexp*, i8*, ...)*)(%struct.regexp* %prog, i8* %s.21)
  %828 = icmp ne i32 %827, 0
  br i1 %828, label %829, label %830

; <label>:829                                     ; preds = %826
  br label %1111

; <label>:830                                     ; preds = %826
  %831 = load i8* %s.21, align 1
  %832 = zext i8 %831 to i64
  %833 = getelementptr inbounds [0 x i8]* @PL_utf8skip, i32 0, i64 %832
  %834 = load i8* %833, align 1
  %835 = zext i8 %834 to i32
  %836 = sext i32 %835 to i64
  %837 = getelementptr inbounds i8* %s.21, i64 %836
  br label %824

; <label>:838                                     ; preds = %824
  br label %849

; <label>:839                                     ; preds = %821
  br label %840

; <label>:840                                     ; preds = %846, %839
  %s.22 = phi i8* [ %s.20, %839 ], [ %847, %846 ]
  %841 = icmp ule i8* %s.22, %last1.2
  br i1 %841, label %842, label %848

; <label>:842                                     ; preds = %840
  %843 = call i32 (%struct.regexp*, i8*, ...)* bitcast (i32 (...)* @regtry to i32 (%struct.regexp*, i8*, ...)*)(%struct.regexp* %prog, i8* %s.22)
  %844 = icmp ne i32 %843, 0
  br i1 %844, label %845, label %846

; <label>:845                                     ; preds = %842
  br label %1111

; <label>:846                                     ; preds = %842
  %847 = getelementptr inbounds i8* %s.22, i32 1
  br label %840

; <label>:848                                     ; preds = %840
  br label %849

; <label>:849                                     ; preds = %848, %838
  %s.23 = phi i8* [ %s.21, %838 ], [ %s.22, %848 ]
  br label %680

; <label>:850                                     ; preds = %723
  br label %1188

; <label>:851                                     ; preds = %447, %439
  %852 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 2
  %853 = load %struct.regnode** %852, align 8
  %854 = icmp ne %struct.regnode* %853, null
  br i1 %854, label %855, label %893

; <label>:855                                     ; preds = %851
  %856 = icmp ne i32 %43, 0
  br i1 %856, label %857, label %888

; <label>:857                                     ; preds = %855
  %858 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 2
  %859 = load %struct.regnode** %858, align 8
  %860 = getelementptr inbounds %struct.regnode* %859, i32 0, i32 1
  %861 = load i8* %860, align 1
  %862 = zext i8 %861 to i32
  %863 = sext i32 %862 to i64
  %864 = getelementptr inbounds [0 x i8]* @PL_regkind, i32 0, i64 %863
  %865 = load i8* %864, align 1
  %866 = zext i8 %865 to i32
  %867 = icmp ne i32 %866, 33
  br i1 %867, label %868, label %887

; <label>:868                                     ; preds = %857
  %869 = icmp ne i32 %862, 16
  br i1 %869, label %870, label %887

; <label>:870                                     ; preds = %868
  %871 = load i8* @PL_reg_match_utf8, align 1
  %872 = sext i8 %871 to i32
  %873 = icmp ne i32 %872, 0
  br i1 %873, label %874, label %880

; <label>:874                                     ; preds = %870
  %875 = sub nsw i32 %43, 1
  %876 = sub nsw i32 0, %875
  %877 = call i32 (i8*, i32, ...)* bitcast (i32 (...)* @reghop to i32 (i8*, i32, ...)*)(i8* %strend, i32 %876)
  %878 = sext i32 %877 to i64
  %879 = inttoptr i64 %878 to i8*
  br label %885

; <label>:880                                     ; preds = %870
  %881 = sub nsw i32 %43, 1
  %882 = sub nsw i32 0, %881
  %883 = sext i32 %882 to i64
  %884 = getelementptr inbounds i8* %strend, i64 %883
  br label %885

; <label>:885                                     ; preds = %880, %874
  %886 = phi i8* [ %879, %874 ], [ %884, %880 ]
  br label %887

; <label>:887                                     ; preds = %885, %868, %857
  %.01 = phi i8* [ %886, %885 ], [ %strend, %868 ], [ %strend, %857 ]
  br label %888

; <label>:888                                     ; preds = %887, %855
  %.1 = phi i8* [ %.01, %887 ], [ %strend, %855 ]
  %889 = call i32 (%struct.regexp*, %struct.regnode*, i8*, i8*, i8*, i32, ...)* bitcast (i32 (...)* @find_byclass to i32 (%struct.regexp*, %struct.regnode*, i8*, i8*, i8*, i32, ...)*)(%struct.regexp* %prog, %struct.regnode* %853, i8* %s.4, i8* %.1, i8* %stringarg, i32 0)
  %890 = icmp ne i32 %889, 0
  br i1 %890, label %891, label %892

; <label>:891                                     ; preds = %888
  br label %1111

; <label>:892                                     ; preds = %888
  br label %1108

; <label>:893                                     ; preds = %851
  %894 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %895 = load %struct.reg_substr_data** %894, align 8
  %896 = getelementptr inbounds %struct.reg_substr_data* %895, i32 0, i32 0
  %897 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %896, i32 0, i64 1
  %898 = getelementptr inbounds %struct.reg_substr_datum* %897, i32 0, i32 2
  %899 = load %struct.sv** %898, align 8
  %900 = icmp ne %struct.sv* %899, null
  br i1 %900, label %909, label %901

; <label>:901                                     ; preds = %893
  %902 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %903 = load %struct.reg_substr_data** %902, align 8
  %904 = getelementptr inbounds %struct.reg_substr_data* %903, i32 0, i32 0
  %905 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %904, i32 0, i64 1
  %906 = getelementptr inbounds %struct.reg_substr_datum* %905, i32 0, i32 3
  %907 = load %struct.sv** %906, align 8
  %908 = icmp ne %struct.sv* %907, null
  br i1 %908, label %909, label %1069

; <label>:909                                     ; preds = %901, %893
  %910 = sext i8 %23 to i32
  %911 = icmp ne i32 %910, 0
  br i1 %911, label %912, label %920

; <label>:912                                     ; preds = %909
  %913 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %914 = load %struct.reg_substr_data** %913, align 8
  %915 = getelementptr inbounds %struct.reg_substr_data* %914, i32 0, i32 0
  %916 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %915, i32 0, i64 1
  %917 = getelementptr inbounds %struct.reg_substr_datum* %916, i32 0, i32 3
  %918 = load %struct.sv** %917, align 8
  %919 = icmp ne %struct.sv* %918, null
  br i1 %919, label %937, label %928

; <label>:920                                     ; preds = %909
  %921 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %922 = load %struct.reg_substr_data** %921, align 8
  %923 = getelementptr inbounds %struct.reg_substr_data* %922, i32 0, i32 0
  %924 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %923, i32 0, i64 1
  %925 = getelementptr inbounds %struct.reg_substr_datum* %924, i32 0, i32 2
  %926 = load %struct.sv** %925, align 8
  %927 = icmp ne %struct.sv* %926, null
  br i1 %927, label %937, label %928

; <label>:928                                     ; preds = %920, %912
  %929 = sext i8 %23 to i32
  %930 = icmp ne i32 %929, 0
  br i1 %930, label %931, label %933

; <label>:931                                     ; preds = %928
  %932 = call i32 (%struct.regexp*, ...)* bitcast (i32 (...)* @to_utf8_substr to i32 (%struct.regexp*, ...)*)(%struct.regexp* %prog)
  br label %935

; <label>:933                                     ; preds = %928
  %934 = call i32 (%struct.regexp*, ...)* bitcast (i32 (...)* @to_byte_substr to i32 (%struct.regexp*, ...)*)(%struct.regexp* %prog)
  br label %935

; <label>:935                                     ; preds = %933, %931
  %936 = phi i32 [ %932, %931 ], [ %934, %933 ]
  br label %937

; <label>:937                                     ; preds = %935, %920, %912
  %938 = sext i8 %23 to i32
  %939 = icmp ne i32 %938, 0
  br i1 %939, label %940, label %947

; <label>:940                                     ; preds = %937
  %941 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %942 = load %struct.reg_substr_data** %941, align 8
  %943 = getelementptr inbounds %struct.reg_substr_data* %942, i32 0, i32 0
  %944 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %943, i32 0, i64 1
  %945 = getelementptr inbounds %struct.reg_substr_datum* %944, i32 0, i32 3
  %946 = load %struct.sv** %945, align 8
  br label %954

; <label>:947                                     ; preds = %937
  %948 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %949 = load %struct.reg_substr_data** %948, align 8
  %950 = getelementptr inbounds %struct.reg_substr_data* %949, i32 0, i32 0
  %951 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %950, i32 0, i64 1
  %952 = getelementptr inbounds %struct.reg_substr_datum* %951, i32 0, i32 2
  %953 = load %struct.sv** %952, align 8
  br label %954

; <label>:954                                     ; preds = %947, %940
  %955 = phi %struct.sv* [ %946, %940 ], [ %953, %947 ]
  %956 = and i32 %flags, 4
  %957 = icmp ne i32 %956, 0
  br i1 %957, label %958, label %984

; <label>:958                                     ; preds = %954
  %959 = ptrtoint i8* %s.4 to i64
  %960 = ptrtoint i8* %strbeg to i64
  %961 = sub i64 %959, %960
  %962 = trunc i64 %961 to i32
  %963 = call i8* @Perl_screaminstr(%struct.sv* %sv, %struct.sv* %955, i32 %962, i32 0, i32* %scream_pos, i32 1)
  %964 = icmp ne i8* %963, null
  br i1 %964, label %967, label %965

; <label>:965                                     ; preds = %958
  %966 = load i8** %scream_olds, align 8
  br label %983

; <label>:967                                     ; preds = %958
  %968 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 15
  %969 = load i32* %968, align 4
  %970 = and i32 %969, 262144
  %971 = icmp ne i32 %970, 0
  br i1 %971, label %972, label %982

; <label>:972                                     ; preds = %967
  %973 = getelementptr inbounds %struct.sv* %sv, i32 0, i32 0
  %974 = load i8** %973, align 8
  %975 = bitcast i8* %974 to %struct.xpv*
  %976 = getelementptr inbounds %struct.xpv* %975, i32 0, i32 0
  %977 = load i8** %976, align 8
  %978 = ptrtoint i8* %s.4 to i64
  %979 = ptrtoint i8* %977 to i64
  %980 = sub i64 %978, %979
  %981 = getelementptr inbounds i8* %strbeg, i64 %980
  br label %982

; <label>:982                                     ; preds = %972, %967
  %s.24 = phi i8* [ %981, %972 ], [ %s.4, %967 ]
  br label %983

; <label>:983                                     ; preds = %982, %965
  %s.25 = phi i8* [ %s.24, %982 ], [ %s.4, %965 ]
  %last2.0 = phi i8* [ %963, %982 ], [ %966, %965 ]
  br label %1053

; <label>:984                                     ; preds = %954
  %985 = getelementptr inbounds %struct.sv* %955, i32 0, i32 2
  %986 = load i32* %985, align 4
  %987 = and i32 %986, 262144
  %988 = icmp eq i32 %987, 262144
  br i1 %988, label %989, label %1000

; <label>:989                                     ; preds = %984
  %990 = getelementptr inbounds %struct.sv* %955, i32 0, i32 0
  %991 = load i8** %990, align 8
  %992 = bitcast i8* %991 to %struct.xpv*
  %993 = getelementptr inbounds %struct.xpv* %992, i32 0, i32 1
  %994 = load i64* %993, align 8
  store i64 %994, i64* %len, align 8
  %995 = getelementptr inbounds %struct.sv* %955, i32 0, i32 0
  %996 = load i8** %995, align 8
  %997 = bitcast i8* %996 to %struct.xpv*
  %998 = getelementptr inbounds %struct.xpv* %997, i32 0, i32 0
  %999 = load i8** %998, align 8
  br label %1002

; <label>:1000                                    ; preds = %984
  %1001 = call i8* @Perl_sv_2pv_flags(%struct.sv* %955, i64* %len, i32 2)
  br label %1002

; <label>:1002                                    ; preds = %1000, %989
  %1003 = phi i8* [ %999, %989 ], [ %1001, %1000 ]
  %1004 = getelementptr inbounds %struct.sv* %955, i32 0, i32 2
  %1005 = load i32* %1004, align 4
  %1006 = and i32 %1005, 1073741824
  %1007 = icmp ne i32 %1006, 0
  br i1 %1007, label %1008, label %1042

; <label>:1008                                    ; preds = %1002
  %1009 = load i64* %len, align 8
  %1010 = sub i64 0, %1009
  %1011 = getelementptr inbounds i8* %strend, i64 %1010
  %1012 = getelementptr inbounds i8* %1011, i64 1
  %1013 = load i64* %len, align 8
  %1014 = sub i64 %1013, 1
  %1015 = call i32 @memcmp(i8* %1012, i8* %1003, i64 %1014)
  %1016 = icmp ne i32 %1015, 0
  br i1 %1016, label %1022, label %1017

; <label>:1017                                    ; preds = %1008
  %1018 = load i64* %len, align 8
  %1019 = sub i64 0, %1018
  %1020 = getelementptr inbounds i8* %strend, i64 %1019
  %1021 = getelementptr inbounds i8* %1020, i64 1
  br label %1041

; <label>:1022                                    ; preds = %1008
  %1023 = load i32* @PL_multiline, align 4
  %1024 = icmp ne i32 %1023, 0
  br i1 %1024, label %1039, label %1025

; <label>:1025                                    ; preds = %1022
  %1026 = load i64* %len, align 8
  %1027 = sub i64 0, %1026
  %1028 = getelementptr inbounds i8* %strend, i64 %1027
  %1029 = load i64* %len, align 8
  %1030 = call i32 @memcmp(i8* %1028, i8* %1003, i64 %1029)
  %1031 = icmp ne i32 %1030, 0
  br i1 %1031, label %1036, label %1032

; <label>:1032                                    ; preds = %1025
  %1033 = load i64* %len, align 8
  %1034 = sub i64 0, %1033
  %1035 = getelementptr inbounds i8* %strend, i64 %1034
  br label %1037

; <label>:1036                                    ; preds = %1025
  br label %1037

; <label>:1037                                    ; preds = %1036, %1032
  %1038 = phi i8* [ %1035, %1032 ], [ null, %1036 ]
  br label %1040

; <label>:1039                                    ; preds = %1022
  br label %1043

; <label>:1040                                    ; preds = %1037
  br label %1041

; <label>:1041                                    ; preds = %1040, %1017
  %last2.1 = phi i8* [ %1038, %1040 ], [ %1021, %1017 ]
  br label %1052

; <label>:1042                                    ; preds = %1002
  br label %1043

; <label>:1043                                    ; preds = %1042, %1039
  %1044 = load i64* %len, align 8
  %1045 = icmp ne i64 %1044, 0
  br i1 %1045, label %1046, label %1050

; <label>:1046                                    ; preds = %1043
  %1047 = load i64* %len, align 8
  %1048 = getelementptr inbounds i8* %1003, i64 %1047
  %1049 = call i8* @Perl_rninstr(i8* %s.4, i8* %strend, i8* %1003, i8* %1048)
  br label %1051

; <label>:1050                                    ; preds = %1043
  br label %1051

; <label>:1051                                    ; preds = %1050, %1046
  %last2.2 = phi i8* [ %1049, %1046 ], [ %strend, %1050 ]
  br label %1052

; <label>:1052                                    ; preds = %1051, %1041
  %last2.3 = phi i8* [ %last2.2, %1051 ], [ %last2.1, %1041 ]
  br label %1053

; <label>:1053                                    ; preds = %1052, %983
  %s.26 = phi i8* [ %s.25, %983 ], [ %s.4, %1052 ]
  %last2.4 = phi i8* [ %last2.0, %983 ], [ %last2.3, %1052 ]
  %1054 = icmp eq i8* %last2.4, null
  br i1 %1054, label %1055, label %1056

; <label>:1055                                    ; preds = %1053
  br label %1188

; <label>:1056                                    ; preds = %1053
  %1057 = ptrtoint i8* %strend to i64
  %1058 = ptrtoint i8* %last2.4 to i64
  %1059 = sub i64 %1057, %1058
  %1060 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %1061 = load %struct.reg_substr_data** %1060, align 8
  %1062 = getelementptr inbounds %struct.reg_substr_data* %1061, i32 0, i32 0
  %1063 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1062, i32 0, i64 1
  %1064 = getelementptr inbounds %struct.reg_substr_datum* %1063, i32 0, i32 0
  %1065 = load i32* %1064, align 4
  %1066 = sext i32 %1065 to i64
  %1067 = add nsw i64 %1059, %1066
  %1068 = trunc i64 %1067 to i32
  br label %1069

; <label>:1069                                    ; preds = %1056, %901
  %s.27 = phi i8* [ %s.26, %1056 ], [ %s.4, %901 ]
  %dontbother.1 = phi i32 [ %1068, %1056 ], [ 0, %901 ]
  %1070 = icmp ne i32 %43, 0
  br i1 %1070, label %1071, label %1075

; <label>:1071                                    ; preds = %1069
  %1072 = icmp slt i32 %dontbother.1, %43
  br i1 %1072, label %1073, label %1075

; <label>:1073                                    ; preds = %1071
  %1074 = sub nsw i32 %43, 1
  br label %1075

; <label>:1075                                    ; preds = %1073, %1071, %1069
  %dontbother.2 = phi i32 [ %1074, %1073 ], [ %dontbother.1, %1071 ], [ %dontbother.1, %1069 ]
  %1076 = sext i32 %dontbother.2 to i64
  %1077 = sub i64 0, %1076
  %1078 = getelementptr inbounds i8* %strend, i64 %1077
  %1079 = icmp ne i8 %23, 0
  br i1 %1079, label %1080, label %1097

; <label>:1080                                    ; preds = %1075
  br label %1081

; <label>:1081                                    ; preds = %1088, %1080
  %s.28 = phi i8* [ %s.27, %1080 ], [ %1095, %1088 ]
  %1082 = call i32 (%struct.regexp*, i8*, ...)* bitcast (i32 (...)* @regtry to i32 (%struct.regexp*, i8*, ...)*)(%struct.regexp* %prog, i8* %s.28)
  %1083 = icmp ne i32 %1082, 0
  br i1 %1083, label %1084, label %1085

; <label>:1084                                    ; preds = %1081
  br label %1111

; <label>:1085                                    ; preds = %1081
  %1086 = icmp uge i8* %s.28, %1078
  br i1 %1086, label %1087, label %1088

; <label>:1087                                    ; preds = %1085
  br label %1096

; <label>:1088                                    ; preds = %1085
  %1089 = load i8* %s.28, align 1
  %1090 = zext i8 %1089 to i64
  %1091 = getelementptr inbounds [0 x i8]* @PL_utf8skip, i32 0, i64 %1090
  %1092 = load i8* %1091, align 1
  %1093 = zext i8 %1092 to i32
  %1094 = sext i32 %1093 to i64
  %1095 = getelementptr inbounds i8* %s.28, i64 %1094
  br label %1081

; <label>:1096                                    ; preds = %1087
  br label %1107

; <label>:1097                                    ; preds = %1075
  br label %1098

; <label>:1098                                    ; preds = %1103, %1097
  %s.29 = phi i8* [ %s.27, %1097 ], [ %1104, %1103 ]
  %1099 = call i32 (%struct.regexp*, i8*, ...)* bitcast (i32 (...)* @regtry to i32 (%struct.regexp*, i8*, ...)*)(%struct.regexp* %prog, i8* %s.29)
  %1100 = icmp ne i32 %1099, 0
  br i1 %1100, label %1101, label %1102

; <label>:1101                                    ; preds = %1098
  br label %1111

; <label>:1102                                    ; preds = %1098
  br label %1103

; <label>:1103                                    ; preds = %1102
  %1104 = getelementptr inbounds i8* %s.29, i32 1
  %1105 = icmp ult i8* %s.29, %1078
  br i1 %1105, label %1098, label %1106

; <label>:1106                                    ; preds = %1103
  br label %1107

; <label>:1107                                    ; preds = %1106, %1096
  br label %1108

; <label>:1108                                    ; preds = %1107, %892
  br label %1109

; <label>:1109                                    ; preds = %1108
  br label %1110

; <label>:1110                                    ; preds = %1109, %414
  br label %1188

; <label>:1111                                    ; preds = %1101, %1084, %891, %845, %829, %396, %349, %259, %243, %209, %153
  %1112 = load i32* @PL_reg_flags, align 4
  %1113 = and i32 %1112, 1
  %1114 = icmp ne i32 %1113, 0
  br i1 %1114, label %1115, label %1119

; <label>:1115                                    ; preds = %1111
  %1116 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 15
  %1117 = load i32* %1116, align 4
  %1118 = or i32 %1117, 524288
  store i32 %1118, i32* %1116, align 4
  br label %1123

; <label>:1119                                    ; preds = %1111
  %1120 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 15
  %1121 = load i32* %1120, align 4
  %1122 = and i32 %1121, -524289
  store i32 %1122, i32* %1120, align 4
  br label %1123

; <label>:1123                                    ; preds = %1119, %1115
  %1124 = phi i32 [ %1118, %1115 ], [ %1122, %1119 ]
  %1125 = load i32* @PL_reg_eval_set, align 4
  %1126 = icmp ne i32 %1125, 0
  br i1 %1126, label %1127, label %1145

; <label>:1127                                    ; preds = %1123
  %1128 = load %struct.gv** @PL_replgv, align 8
  %1129 = getelementptr inbounds %struct.gv* %1128, i32 0, i32 0
  %1130 = load %struct.xpvgv** %1129, align 8
  %1131 = getelementptr inbounds %struct.xpvgv* %1130, i32 0, i32 7
  %1132 = load %struct.gp** %1131, align 8
  %1133 = getelementptr inbounds %struct.gp* %1132, i32 0, i32 0
  %1134 = load %struct.sv** %1133, align 8
  %1135 = icmp ne %struct.sv* %7, %1134
  br i1 %1135, label %1136, label %1144

; <label>:1136                                    ; preds = %1127
  %1137 = load %struct.gv** @PL_replgv, align 8
  %1138 = getelementptr inbounds %struct.gv* %1137, i32 0, i32 0
  %1139 = load %struct.xpvgv** %1138, align 8
  %1140 = getelementptr inbounds %struct.xpvgv* %1139, i32 0, i32 7
  %1141 = load %struct.gp** %1140, align 8
  %1142 = getelementptr inbounds %struct.gp* %1141, i32 0, i32 0
  %1143 = load %struct.sv** %1142, align 8
  call void @Perl_sv_setsv_flags(%struct.sv* %7, %struct.sv* %1143, i32 2)
  br label %1144

; <label>:1144                                    ; preds = %1136, %1127
  call void @restore_pos(i8* null)
  br label %1145

; <label>:1145                                    ; preds = %1144, %1123
  %1146 = and i32 %flags, 16
  %1147 = icmp ne i32 %1146, 0
  br i1 %1147, label %1187, label %1148

; <label>:1148                                    ; preds = %1145
  %1149 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 15
  %1150 = load i32* %1149, align 4
  %1151 = and i32 %1150, 262144
  %1152 = icmp ne i32 %1151, 0
  br i1 %1152, label %1153, label %1159

; <label>:1153                                    ; preds = %1148
  %1154 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 6
  %1155 = load i8** %1154, align 8
  call void @Perl_safesysfree(i8* %1155)
  %1156 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 15
  %1157 = load i32* %1156, align 4
  %1158 = and i32 %1157, -262145
  store i32 %1158, i32* %1156, align 4
  br label %1159

; <label>:1159                                    ; preds = %1153, %1148
  %1160 = and i32 %flags, 1
  %1161 = icmp ne i32 %1160, 0
  br i1 %1161, label %1162, label %1178

; <label>:1162                                    ; preds = %1159
  %1163 = load i8** @PL_regeol, align 8
  %1164 = ptrtoint i8* %1163 to i64
  %1165 = ptrtoint i8* %stringarg to i64
  %1166 = sub i64 %1164, %1165
  %1167 = ptrtoint i8* %stringarg to i64
  %1168 = ptrtoint i8* %strbeg to i64
  %1169 = sub i64 %1167, %1168
  %1170 = add nsw i64 %1166, %1169
  %1171 = trunc i64 %1170 to i32
  %1172 = call i8* @Perl_savepvn(i8* %strbeg, i32 %1171)
  %1173 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 6
  store i8* %1172, i8** %1173, align 8
  %1174 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 8
  store i32 %1171, i32* %1174, align 4
  %1175 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 15
  %1176 = load i32* %1175, align 4
  %1177 = or i32 %1176, 262144
  store i32 %1177, i32* %1175, align 4
  br label %1186

; <label>:1178                                    ; preds = %1159
  %1179 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 6
  store i8* %strbeg, i8** %1179, align 8
  %1180 = load i8** @PL_regeol, align 8
  %1181 = ptrtoint i8* %1180 to i64
  %1182 = ptrtoint i8* %strbeg to i64
  %1183 = sub i64 %1181, %1182
  %1184 = trunc i64 %1183 to i32
  %1185 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 8
  store i32 %1184, i32* %1185, align 4
  br label %1186

; <label>:1186                                    ; preds = %1178, %1162
  br label %1187

; <label>:1187                                    ; preds = %1186, %1145
  br label %1193

; <label>:1188                                    ; preds = %1110, %1055, %850, %589, %260, %249, %223, %213, %141, %110, %49
  %1189 = load i32* @PL_reg_eval_set, align 4
  %1190 = icmp ne i32 %1189, 0
  br i1 %1190, label %1191, label %1192

; <label>:1191                                    ; preds = %1188
  call void @restore_pos(i8* null)
  br label %1192

; <label>:1192                                    ; preds = %1191, %1188
  br label %1193

; <label>:1193                                    ; preds = %1192, %1187, %40
  %.0 = phi i32 [ 0, %40 ], [ 0, %1192 ], [ 1, %1187 ]
  ret i32 %.0
}

; Function Attrs: nounwind uwtable
define i8* @Perl_re_intuit_start(%struct.regexp* %prog, %struct.sv* %sv, i8* %strpos, i8* %strend, i32 %flags, %struct.re_scream_pos_data_s* %data) #0 {
  %p = alloca i32, align 4
  %1 = icmp ne %struct.sv* %sv, null
  br i1 %1, label %2, label %6

; <label>:2                                       ; preds = %0
  %3 = getelementptr inbounds %struct.sv* %sv, i32 0, i32 2
  %4 = load i32* %3, align 4
  %5 = and i32 %4, 536870912
  br label %7

; <label>:6                                       ; preds = %0
  br label %7

; <label>:7                                       ; preds = %6, %2
  %8 = phi i32 [ %5, %2 ], [ 0, %6 ]
  %9 = icmp ne i32 %8, 0
  br i1 %9, label %10, label %14

; <label>:10                                      ; preds = %7
  %11 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 15
  %12 = load i32* %11, align 4
  %13 = or i32 %12, 268435456
  store i32 %13, i32* %11, align 4
  store i8 1, i8* @PL_reg_match_utf8, align 1
  br label %18

; <label>:14                                      ; preds = %7
  %15 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 15
  %16 = load i32* %15, align 4
  %17 = and i32 %16, -268435457
  store i32 %17, i32* %15, align 4
  store i8 0, i8* @PL_reg_match_utf8, align 1
  br label %18

; <label>:18                                      ; preds = %14, %10
  %19 = phi i32 [ 1, %10 ], [ 0, %14 ]
  %20 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 15
  %21 = load i32* %20, align 4
  %22 = and i32 %21, 65536
  %23 = icmp ne i32 %22, 0
  br i1 %23, label %24, label %27

; <label>:24                                      ; preds = %18
  %25 = load i32* @PL_reg_flags, align 4
  %26 = or i32 %25, 8
  store i32 %26, i32* @PL_reg_flags, align 4
  br label %27

; <label>:27                                      ; preds = %24, %18
  %28 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 10
  %29 = load i32* %28, align 4
  %30 = sext i32 %29 to i64
  %31 = ptrtoint i8* %strend to i64
  %32 = ptrtoint i8* %strpos to i64
  %33 = sub i64 %31, %32
  %34 = icmp sgt i64 %30, %33
  br i1 %34, label %35, label %36

; <label>:35                                      ; preds = %27
  br label %1683

; <label>:36                                      ; preds = %27
  %37 = icmp ne %struct.sv* %sv, null
  br i1 %37, label %38, label %51

; <label>:38                                      ; preds = %36
  %39 = getelementptr inbounds %struct.sv* %sv, i32 0, i32 2
  %40 = load i32* %39, align 4
  %41 = and i32 %40, 262144
  %42 = icmp ne i32 %41, 0
  br i1 %42, label %43, label %51

; <label>:43                                      ; preds = %38
  %44 = getelementptr inbounds %struct.sv* %sv, i32 0, i32 0
  %45 = load i8** %44, align 8
  %46 = bitcast i8* %45 to %struct.xpv*
  %47 = getelementptr inbounds %struct.xpv* %46, i32 0, i32 1
  %48 = load i64* %47, align 8
  %49 = sub i64 0, %48
  %50 = getelementptr inbounds i8* %strend, i64 %49
  br label %52

; <label>:51                                      ; preds = %38, %36
  br label %52

; <label>:52                                      ; preds = %51, %43
  %53 = phi i8* [ %50, %43 ], [ %strpos, %51 ]
  store i8* %strend, i8** @PL_regeol, align 8
  %54 = icmp ne i32 %8, 0
  br i1 %54, label %55, label %80

; <label>:55                                      ; preds = %52
  %56 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %57 = load %struct.reg_substr_data** %56, align 8
  %58 = getelementptr inbounds %struct.reg_substr_data* %57, i32 0, i32 0
  %59 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %58, i32 0, i64 2
  %60 = getelementptr inbounds %struct.reg_substr_datum* %59, i32 0, i32 3
  %61 = load %struct.sv** %60, align 8
  %62 = icmp ne %struct.sv* %61, null
  br i1 %62, label %73, label %63

; <label>:63                                      ; preds = %55
  %64 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %65 = load %struct.reg_substr_data** %64, align 8
  %66 = getelementptr inbounds %struct.reg_substr_data* %65, i32 0, i32 0
  %67 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %66, i32 0, i64 2
  %68 = getelementptr inbounds %struct.reg_substr_datum* %67, i32 0, i32 2
  %69 = load %struct.sv** %68, align 8
  %70 = icmp ne %struct.sv* %69, null
  br i1 %70, label %71, label %73

; <label>:71                                      ; preds = %63
  %72 = call i32 (%struct.regexp*, ...)* bitcast (i32 (...)* @to_utf8_substr to i32 (%struct.regexp*, ...)*)(%struct.regexp* %prog)
  br label %73

; <label>:73                                      ; preds = %71, %63, %55
  %74 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %75 = load %struct.reg_substr_data** %74, align 8
  %76 = getelementptr inbounds %struct.reg_substr_data* %75, i32 0, i32 0
  %77 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %76, i32 0, i64 2
  %78 = getelementptr inbounds %struct.reg_substr_datum* %77, i32 0, i32 3
  %79 = load %struct.sv** %78, align 8
  br label %105

; <label>:80                                      ; preds = %52
  %81 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %82 = load %struct.reg_substr_data** %81, align 8
  %83 = getelementptr inbounds %struct.reg_substr_data* %82, i32 0, i32 0
  %84 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %83, i32 0, i64 2
  %85 = getelementptr inbounds %struct.reg_substr_datum* %84, i32 0, i32 2
  %86 = load %struct.sv** %85, align 8
  %87 = icmp ne %struct.sv* %86, null
  br i1 %87, label %98, label %88

; <label>:88                                      ; preds = %80
  %89 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %90 = load %struct.reg_substr_data** %89, align 8
  %91 = getelementptr inbounds %struct.reg_substr_data* %90, i32 0, i32 0
  %92 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %91, i32 0, i64 2
  %93 = getelementptr inbounds %struct.reg_substr_datum* %92, i32 0, i32 3
  %94 = load %struct.sv** %93, align 8
  %95 = icmp ne %struct.sv* %94, null
  br i1 %95, label %96, label %98

; <label>:96                                      ; preds = %88
  %97 = call i32 (%struct.regexp*, ...)* bitcast (i32 (...)* @to_byte_substr to i32 (%struct.regexp*, ...)*)(%struct.regexp* %prog)
  br label %98

; <label>:98                                      ; preds = %96, %88, %80
  %99 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %100 = load %struct.reg_substr_data** %99, align 8
  %101 = getelementptr inbounds %struct.reg_substr_data* %100, i32 0, i32 0
  %102 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %101, i32 0, i64 2
  %103 = getelementptr inbounds %struct.reg_substr_datum* %102, i32 0, i32 2
  %104 = load %struct.sv** %103, align 8
  br label %105

; <label>:105                                     ; preds = %98, %73
  %check.0 = phi %struct.sv* [ %79, %73 ], [ %104, %98 ]
  %106 = icmp eq %struct.sv* %check.0, @PL_sv_undef
  br i1 %106, label %107, label %108

; <label>:107                                     ; preds = %105
  br label %1683

; <label>:108                                     ; preds = %105
  %109 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 15
  %110 = load i32* %109, align 4
  %111 = and i32 %110, 15
  %112 = icmp ne i32 %111, 0
  br i1 %112, label %113, label %366

; <label>:113                                     ; preds = %108
  %114 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 15
  %115 = load i32* %114, align 4
  %116 = and i32 %115, 12
  %117 = icmp ne i32 %116, 0
  br i1 %117, label %129, label %118

; <label>:118                                     ; preds = %113
  %119 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 15
  %120 = load i32* %119, align 4
  %121 = and i32 %120, 1
  %122 = icmp ne i32 %121, 0
  br i1 %122, label %123, label %127

; <label>:123                                     ; preds = %118
  %124 = load i32* @PL_multiline, align 4
  %125 = icmp ne i32 %124, 0
  %126 = xor i1 %125, true
  br label %127

; <label>:127                                     ; preds = %123, %118
  %128 = phi i1 [ false, %118 ], [ %126, %123 ]
  br label %129

; <label>:129                                     ; preds = %127, %113
  %130 = phi i1 [ true, %113 ], [ %128, %127 ]
  %131 = xor i1 %130, true
  %132 = zext i1 %131 to i32
  %133 = icmp ne i32 %132, 0
  br i1 %133, label %288, label %134

; <label>:134                                     ; preds = %129
  %135 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 15
  %136 = load i32* %135, align 4
  %137 = and i32 %136, 40
  %138 = icmp ne i32 %137, 0
  br i1 %138, label %149, label %139

; <label>:139                                     ; preds = %134
  %140 = icmp ne %struct.sv* %sv, null
  br i1 %140, label %141, label %149

; <label>:141                                     ; preds = %139
  %142 = getelementptr inbounds %struct.sv* %sv, i32 0, i32 2
  %143 = load i32* %142, align 4
  %144 = and i32 %143, 524288
  %145 = icmp ne i32 %144, 0
  br i1 %145, label %149, label %146

; <label>:146                                     ; preds = %141
  %147 = icmp ne i8* %strpos, %53
  br i1 %147, label %148, label %149

; <label>:148                                     ; preds = %146
  br label %1683

; <label>:149                                     ; preds = %146, %141, %139, %134
  %150 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %151 = load %struct.reg_substr_data** %150, align 8
  %152 = getelementptr inbounds %struct.reg_substr_data* %151, i32 0, i32 0
  %153 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %152, i32 0, i64 2
  %154 = getelementptr inbounds %struct.reg_substr_datum* %153, i32 0, i32 0
  %155 = load i32* %154, align 4
  %156 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %157 = load %struct.reg_substr_data** %156, align 8
  %158 = getelementptr inbounds %struct.reg_substr_data* %157, i32 0, i32 0
  %159 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %158, i32 0, i64 2
  %160 = getelementptr inbounds %struct.reg_substr_datum* %159, i32 0, i32 1
  %161 = load i32* %160, align 4
  %162 = icmp eq i32 %155, %161
  br i1 %162, label %163, label %287

; <label>:163                                     ; preds = %149
  %164 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 15
  %165 = load i32* %164, align 4
  %166 = and i32 %165, 2048
  %167 = icmp ne i32 %166, 0
  br i1 %167, label %287, label %168

; <label>:168                                     ; preds = %163
  %169 = load i8* @PL_reg_match_utf8, align 1
  %170 = sext i8 %169 to i32
  %171 = icmp ne i32 %170, 0
  br i1 %171, label %172, label %182

; <label>:172                                     ; preds = %168
  %173 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %174 = load %struct.reg_substr_data** %173, align 8
  %175 = getelementptr inbounds %struct.reg_substr_data* %174, i32 0, i32 0
  %176 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %175, i32 0, i64 2
  %177 = getelementptr inbounds %struct.reg_substr_datum* %176, i32 0, i32 0
  %178 = load i32* %177, align 4
  %179 = call i32 (i8*, i32, i8*, ...)* bitcast (i32 (...)* @reghop3 to i32 (i8*, i32, i8*, ...)*)(i8* %strpos, i32 %178, i8* %strend)
  %180 = sext i32 %179 to i64
  %181 = inttoptr i64 %180 to i8*
  br label %191

; <label>:182                                     ; preds = %168
  %183 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %184 = load %struct.reg_substr_data** %183, align 8
  %185 = getelementptr inbounds %struct.reg_substr_data* %184, i32 0, i32 0
  %186 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %185, i32 0, i64 2
  %187 = getelementptr inbounds %struct.reg_substr_datum* %186, i32 0, i32 0
  %188 = load i32* %187, align 4
  %189 = sext i32 %188 to i64
  %190 = getelementptr inbounds i8* %strpos, i64 %189
  br label %191

; <label>:191                                     ; preds = %182, %172
  %192 = phi i8* [ %181, %172 ], [ %190, %182 ]
  %193 = getelementptr inbounds %struct.sv* %check.0, i32 0, i32 2
  %194 = load i32* %193, align 4
  %195 = and i32 %194, 1073741824
  %196 = icmp ne i32 %195, 0
  br i1 %196, label %197, label %256

; <label>:197                                     ; preds = %191
  %198 = getelementptr inbounds %struct.sv* %check.0, i32 0, i32 0
  %199 = load i8** %198, align 8
  %200 = bitcast i8* %199 to %struct.xpv*
  %201 = getelementptr inbounds %struct.xpv* %200, i32 0, i32 1
  %202 = load i64* %201, align 8
  %203 = trunc i64 %202 to i32
  %204 = ptrtoint i8* %strend to i64
  %205 = ptrtoint i8* %192 to i64
  %206 = sub i64 %204, %205
  %207 = sext i32 %203 to i64
  %208 = icmp sgt i64 %206, %207
  br i1 %208, label %227, label %209

; <label>:209                                     ; preds = %197
  %210 = ptrtoint i8* %strend to i64
  %211 = ptrtoint i8* %192 to i64
  %212 = sub i64 %210, %211
  %213 = sub nsw i32 %203, 1
  %214 = sext i32 %213 to i64
  %215 = icmp slt i64 %212, %214
  br i1 %215, label %227, label %216

; <label>:216                                     ; preds = %209
  %217 = ptrtoint i8* %strend to i64
  %218 = ptrtoint i8* %192 to i64
  %219 = sub i64 %217, %218
  %220 = sext i32 %203 to i64
  %221 = icmp eq i64 %219, %220
  br i1 %221, label %222, label %228

; <label>:222                                     ; preds = %216
  %223 = getelementptr inbounds i8* %strend, i64 -1
  %224 = load i8* %223, align 1
  %225 = sext i8 %224 to i32
  %226 = icmp ne i32 %225, 10
  br i1 %226, label %227, label %228

; <label>:227                                     ; preds = %222, %209, %197
  br label %1642

; <label>:228                                     ; preds = %222, %216
  %229 = add nsw i32 %203, -1
  %230 = icmp ne i32 %229, 0
  br i1 %230, label %231, label %255

; <label>:231                                     ; preds = %228
  %232 = getelementptr inbounds %struct.sv* %check.0, i32 0, i32 0
  %233 = load i8** %232, align 8
  %234 = bitcast i8* %233 to %struct.xpv*
  %235 = getelementptr inbounds %struct.xpv* %234, i32 0, i32 0
  %236 = load i8** %235, align 8
  %237 = load i8* %236, align 1
  %238 = sext i8 %237 to i32
  %239 = load i8* %192, align 1
  %240 = sext i8 %239 to i32
  %241 = icmp ne i32 %238, %240
  br i1 %241, label %253, label %242

; <label>:242                                     ; preds = %231
  %243 = icmp sgt i32 %229, 1
  br i1 %243, label %244, label %255

; <label>:244                                     ; preds = %242
  %245 = getelementptr inbounds %struct.sv* %check.0, i32 0, i32 0
  %246 = load i8** %245, align 8
  %247 = bitcast i8* %246 to %struct.xpv*
  %248 = getelementptr inbounds %struct.xpv* %247, i32 0, i32 0
  %249 = load i8** %248, align 8
  %250 = sext i32 %229 to i64
  %251 = call i32 @memcmp(i8* %249, i8* %192, i64 %250)
  %252 = icmp ne i32 %251, 0
  br i1 %252, label %253, label %255

; <label>:253                                     ; preds = %244, %231
  br label %254

; <label>:254                                     ; preds = %284, %253
  br label %1642

; <label>:255                                     ; preds = %244, %242, %228
  br label %286

; <label>:256                                     ; preds = %191
  %257 = getelementptr inbounds %struct.sv* %check.0, i32 0, i32 0
  %258 = load i8** %257, align 8
  %259 = bitcast i8* %258 to %struct.xpv*
  %260 = getelementptr inbounds %struct.xpv* %259, i32 0, i32 0
  %261 = load i8** %260, align 8
  %262 = load i8* %261, align 1
  %263 = sext i8 %262 to i32
  %264 = load i8* %192, align 1
  %265 = sext i8 %264 to i32
  %266 = icmp ne i32 %263, %265
  br i1 %266, label %284, label %267

; <label>:267                                     ; preds = %256
  %268 = getelementptr inbounds %struct.sv* %check.0, i32 0, i32 0
  %269 = load i8** %268, align 8
  %270 = bitcast i8* %269 to %struct.xpv*
  %271 = getelementptr inbounds %struct.xpv* %270, i32 0, i32 1
  %272 = load i64* %271, align 8
  %273 = trunc i64 %272 to i32
  %274 = icmp sgt i32 %273, 1
  br i1 %274, label %275, label %285

; <label>:275                                     ; preds = %267
  %276 = getelementptr inbounds %struct.sv* %check.0, i32 0, i32 0
  %277 = load i8** %276, align 8
  %278 = bitcast i8* %277 to %struct.xpv*
  %279 = getelementptr inbounds %struct.xpv* %278, i32 0, i32 0
  %280 = load i8** %279, align 8
  %281 = sext i32 %273 to i64
  %282 = call i32 @memcmp(i8* %280, i8* %192, i64 %281)
  %283 = icmp ne i32 %282, 0
  br i1 %283, label %284, label %285

; <label>:284                                     ; preds = %275, %256
  br label %254

; <label>:285                                     ; preds = %275, %267
  br label %286

; <label>:286                                     ; preds = %285, %255
  br label %1204

; <label>:287                                     ; preds = %163, %149
  br label %288

; <label>:288                                     ; preds = %287, %129
  %289 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %290 = load %struct.reg_substr_data** %289, align 8
  %291 = getelementptr inbounds %struct.reg_substr_data* %290, i32 0, i32 0
  %292 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %291, i32 0, i64 2
  %293 = getelementptr inbounds %struct.reg_substr_datum* %292, i32 0, i32 0
  %294 = load i32* %293, align 4
  %295 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 10
  %296 = load i32* %295, align 4
  %297 = sub nsw i32 %296, %294
  %298 = sext i32 %297 to i64
  %299 = icmp ne i32 %8, 0
  br i1 %299, label %300, label %302

; <label>:300                                     ; preds = %288
  %301 = call i64 @Perl_sv_len_utf8(%struct.sv* %check.0)
  br label %308

; <label>:302                                     ; preds = %288
  %303 = getelementptr inbounds %struct.sv* %check.0, i32 0, i32 0
  %304 = load i8** %303, align 8
  %305 = bitcast i8* %304 to %struct.xpv*
  %306 = getelementptr inbounds %struct.xpv* %305, i32 0, i32 1
  %307 = load i64* %306, align 8
  br label %308

; <label>:308                                     ; preds = %302, %300
  %309 = phi i64 [ %301, %300 ], [ %307, %302 ]
  %310 = sub i64 %298, %309
  %311 = getelementptr inbounds %struct.sv* %check.0, i32 0, i32 2
  %312 = load i32* %311, align 4
  %313 = and i32 %312, 1073741824
  %314 = icmp ne i32 %313, 0
  %315 = zext i1 %314 to i32
  %316 = sext i32 %315 to i64
  %317 = add i64 %310, %316
  %318 = trunc i64 %317 to i32
  %319 = icmp ne i32 %132, 0
  br i1 %319, label %365, label %320

; <label>:320                                     ; preds = %308
  %321 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %322 = load %struct.reg_substr_data** %321, align 8
  %323 = getelementptr inbounds %struct.reg_substr_data* %322, i32 0, i32 0
  %324 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %323, i32 0, i64 2
  %325 = getelementptr inbounds %struct.reg_substr_datum* %324, i32 0, i32 1
  %326 = load i32* %325, align 4
  %327 = sext i32 %326 to i64
  %328 = icmp ne i32 %8, 0
  br i1 %328, label %329, label %331

; <label>:329                                     ; preds = %320
  %330 = call i64 @Perl_sv_len_utf8(%struct.sv* %check.0)
  br label %337

; <label>:331                                     ; preds = %320
  %332 = getelementptr inbounds %struct.sv* %check.0, i32 0, i32 0
  %333 = load i8** %332, align 8
  %334 = bitcast i8* %333 to %struct.xpv*
  %335 = getelementptr inbounds %struct.xpv* %334, i32 0, i32 1
  %336 = load i64* %335, align 8
  br label %337

; <label>:337                                     ; preds = %331, %329
  %338 = phi i64 [ %330, %329 ], [ %336, %331 ]
  %339 = add i64 %327, %338
  %340 = getelementptr inbounds %struct.sv* %check.0, i32 0, i32 2
  %341 = load i32* %340, align 4
  %342 = and i32 %341, 1073741824
  %343 = icmp ne i32 %342, 0
  %344 = zext i1 %343 to i32
  %345 = sext i32 %344 to i64
  %346 = sub i64 %339, %345
  %347 = trunc i64 %346 to i32
  %348 = load i8* @PL_reg_match_utf8, align 1
  %349 = sext i8 %348 to i32
  %350 = icmp ne i32 %349, 0
  br i1 %350, label %351, label %353

; <label>:351                                     ; preds = %337
  %352 = call i64 @Perl_utf8_distance(i8* %strend, i8* %strpos)
  br label %357

; <label>:353                                     ; preds = %337
  %354 = ptrtoint i8* %strend to i64
  %355 = ptrtoint i8* %strpos to i64
  %356 = sub i64 %354, %355
  br label %357

; <label>:357                                     ; preds = %353, %351
  %358 = phi i64 [ %352, %351 ], [ %356, %353 ]
  %359 = sext i32 %347 to i64
  %360 = sub nsw i64 %358, %359
  %361 = trunc i64 %360 to i32
  %362 = icmp slt i32 %318, %361
  br i1 %362, label %363, label %364

; <label>:363                                     ; preds = %357
  br label %364

; <label>:364                                     ; preds = %363, %357
  %end_shift.0 = phi i32 [ %361, %363 ], [ %318, %357 ]
  br label %365

; <label>:365                                     ; preds = %364, %308
  %end_shift.1 = phi i32 [ %318, %308 ], [ %end_shift.0, %364 ]
  br label %397

; <label>:366                                     ; preds = %108
  %367 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %368 = load %struct.reg_substr_data** %367, align 8
  %369 = getelementptr inbounds %struct.reg_substr_data* %368, i32 0, i32 0
  %370 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %369, i32 0, i64 2
  %371 = getelementptr inbounds %struct.reg_substr_datum* %370, i32 0, i32 0
  %372 = load i32* %371, align 4
  %373 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 10
  %374 = load i32* %373, align 4
  %375 = sub nsw i32 %374, %372
  %376 = sext i32 %375 to i64
  %377 = icmp ne i32 %8, 0
  br i1 %377, label %378, label %380

; <label>:378                                     ; preds = %366
  %379 = call i64 @Perl_sv_len_utf8(%struct.sv* %check.0)
  br label %386

; <label>:380                                     ; preds = %366
  %381 = getelementptr inbounds %struct.sv* %check.0, i32 0, i32 0
  %382 = load i8** %381, align 8
  %383 = bitcast i8* %382 to %struct.xpv*
  %384 = getelementptr inbounds %struct.xpv* %383, i32 0, i32 1
  %385 = load i64* %384, align 8
  br label %386

; <label>:386                                     ; preds = %380, %378
  %387 = phi i64 [ %379, %378 ], [ %385, %380 ]
  %388 = sub i64 %376, %387
  %389 = getelementptr inbounds %struct.sv* %check.0, i32 0, i32 2
  %390 = load i32* %389, align 4
  %391 = and i32 %390, 1073741824
  %392 = icmp ne i32 %391, 0
  %393 = zext i1 %392 to i32
  %394 = sext i32 %393 to i64
  %395 = add i64 %388, %394
  %396 = trunc i64 %395 to i32
  br label %397

; <label>:397                                     ; preds = %386, %365
  %ml_anch.0 = phi i32 [ %132, %365 ], [ 0, %386 ]
  %end_shift.2 = phi i32 [ %end_shift.1, %365 ], [ %396, %386 ]
  %start_shift.0 = phi i32 [ %294, %365 ], [ %372, %386 ]
  br label %398

; <label>:398                                     ; preds = %1594, %1149, %1052, %836, %397
  %ml_anch.1 = phi i32 [ %ml_anch.0, %397 ], [ %ml_anch.8, %1594 ], [ %ml_anch.4, %1149 ], [ %ml_anch.2, %836 ], [ %ml_anch.1, %1052 ]
  %check.1 = phi %struct.sv* [ %check.0, %397 ], [ %check.9, %1594 ], [ %check.4, %1149 ], [ %check.2, %836 ], [ %check.1, %1052 ]
  %s.1 = phi i8* [ %strpos, %397 ], [ %1584, %1594 ], [ %1150, %1149 ], [ %837, %836 ], [ %1053, %1052 ]
  %end_shift.3 = phi i32 [ %end_shift.2, %397 ], [ %end_shift.10, %1594 ], [ %end_shift.6, %1149 ], [ %end_shift.4, %836 ], [ %end_shift.3, %1052 ]
  %start_shift.1 = phi i32 [ %start_shift.0, %397 ], [ %start_shift.8, %1594 ], [ %start_shift.4, %1149 ], [ %start_shift.2, %836 ], [ %start_shift.1, %1052 ]
  %other_last.0 = phi i8* [ null, %397 ], [ %other_last.8, %1594 ], [ %1150, %1149 ], [ %826, %836 ], [ %last3.0, %1052 ]
  %.01 = phi i8* [ %strpos, %397 ], [ %.7, %1594 ], [ %1150, %1149 ], [ %.1, %836 ], [ %.01, %1052 ]
  %399 = and i32 %flags, 4
  %400 = icmp ne i32 %399, 0
  br i1 %400, label %401, label %478

; <label>:401                                     ; preds = %398
  store i32 -1, i32* %p, align 4
  %402 = icmp ne %struct.re_scream_pos_data_s* %data, null
  br i1 %402, label %403, label %406

; <label>:403                                     ; preds = %401
  %404 = getelementptr inbounds %struct.re_scream_pos_data_s* %data, i32 0, i32 1
  %405 = load i32** %404, align 8
  br label %407

; <label>:406                                     ; preds = %401
  br label %407

; <label>:407                                     ; preds = %406, %403
  %408 = phi i32* [ %405, %403 ], [ %p, %406 ]
  %409 = getelementptr inbounds %struct.sv* %check.1, i32 0, i32 0
  %410 = load i8** %409, align 8
  %411 = bitcast i8* %410 to %struct.xpvbm*
  %412 = getelementptr inbounds %struct.xpvbm* %411, i32 0, i32 9
  %413 = load i8* %412, align 1
  %414 = zext i8 %413 to i64
  %415 = load i32** @PL_screamfirst, align 8
  %416 = getelementptr inbounds i32* %415, i64 %414
  %417 = load i32* %416, align 4
  %418 = icmp sge i32 %417, 0
  br i1 %418, label %446, label %419

; <label>:419                                     ; preds = %407
  %420 = getelementptr inbounds %struct.sv* %check.1, i32 0, i32 0
  %421 = load i8** %420, align 8
  %422 = bitcast i8* %421 to %struct.xpvbm*
  %423 = getelementptr inbounds %struct.xpvbm* %422, i32 0, i32 9
  %424 = load i8* %423, align 1
  %425 = zext i8 %424 to i32
  %426 = icmp eq i32 %425, 10
  br i1 %426, label %427, label %454

; <label>:427                                     ; preds = %419
  %428 = getelementptr inbounds %struct.sv* %check.1, i32 0, i32 0
  %429 = load i8** %428, align 8
  %430 = bitcast i8* %429 to %struct.xpvbm*
  %431 = getelementptr inbounds %struct.xpvbm* %430, i32 0, i32 8
  %432 = load i16* %431, align 2
  %433 = zext i16 %432 to i64
  %434 = getelementptr inbounds %struct.sv* %check.1, i32 0, i32 0
  %435 = load i8** %434, align 8
  %436 = bitcast i8* %435 to %struct.xpv*
  %437 = getelementptr inbounds %struct.xpv* %436, i32 0, i32 1
  %438 = load i64* %437, align 8
  %439 = sub i64 %438, 1
  %440 = icmp eq i64 %433, %439
  br i1 %440, label %441, label %454

; <label>:441                                     ; preds = %427
  %442 = getelementptr inbounds %struct.sv* %check.1, i32 0, i32 2
  %443 = load i32* %442, align 4
  %444 = and i32 %443, 1073741824
  %445 = icmp ne i32 %444, 0
  br i1 %445, label %446, label %454

; <label>:446                                     ; preds = %441, %407
  %447 = sext i32 %start_shift.1 to i64
  %448 = ptrtoint i8* %s.1 to i64
  %449 = ptrtoint i8* %53 to i64
  %450 = sub i64 %448, %449
  %451 = add nsw i64 %447, %450
  %452 = trunc i64 %451 to i32
  %453 = call i8* @Perl_screaminstr(%struct.sv* %sv, %struct.sv* %check.1, i32 %452, i32 %end_shift.3, i32* %408, i32 0)
  br label %455

; <label>:454                                     ; preds = %441, %427, %419
  br label %1642

; <label>:455                                     ; preds = %446
  %456 = icmp ne i8* %453, null
  br i1 %456, label %457, label %472

; <label>:457                                     ; preds = %455
  %458 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 15
  %459 = load i32* %458, align 4
  %460 = and i32 %459, 262144
  %461 = icmp ne i32 %460, 0
  br i1 %461, label %462, label %472

; <label>:462                                     ; preds = %457
  %463 = getelementptr inbounds %struct.sv* %sv, i32 0, i32 0
  %464 = load i8** %463, align 8
  %465 = bitcast i8* %464 to %struct.xpv*
  %466 = getelementptr inbounds %struct.xpv* %465, i32 0, i32 0
  %467 = load i8** %466, align 8
  %468 = ptrtoint i8* %453 to i64
  %469 = ptrtoint i8* %467 to i64
  %470 = sub i64 %468, %469
  %471 = getelementptr inbounds i8* %53, i64 %470
  br label %472

; <label>:472                                     ; preds = %462, %457, %455
  %s.2 = phi i8* [ %471, %462 ], [ %453, %457 ], [ %453, %455 ]
  %473 = icmp ne %struct.re_scream_pos_data_s* %data, null
  br i1 %473, label %474, label %477

; <label>:474                                     ; preds = %472
  %475 = getelementptr inbounds %struct.re_scream_pos_data_s* %data, i32 0, i32 0
  %476 = load i8*** %475, align 8
  store i8* %s.2, i8** %476, align 8
  br label %477

; <label>:477                                     ; preds = %474, %472
  br label %525

; <label>:478                                     ; preds = %398
  %479 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 15
  %480 = load i32* %479, align 4
  %481 = and i32 %480, 2048
  %482 = icmp ne i32 %481, 0
  br i1 %482, label %483, label %493

; <label>:483                                     ; preds = %478
  %484 = sext i32 %start_shift.1 to i64
  %485 = getelementptr inbounds i8* %s.1, i64 %484
  %486 = sext i32 %end_shift.3 to i64
  %487 = sub i64 0, %486
  %488 = getelementptr inbounds i8* %strend, i64 %487
  %489 = load i32* @PL_multiline, align 4
  %490 = icmp ne i32 %489, 0
  %491 = select i1 %490, i32 1, i32 0
  %492 = call i8* @Perl_fbm_instr(i8* %485, i8* %488, %struct.sv* %check.1, i32 %491)
  br label %524

; <label>:493                                     ; preds = %478
  %494 = load i8* @PL_reg_match_utf8, align 1
  %495 = sext i8 %494 to i32
  %496 = icmp ne i32 %495, 0
  br i1 %496, label %497, label %501

; <label>:497                                     ; preds = %493
  %498 = call i32 (i8*, i32, i8*, ...)* bitcast (i32 (...)* @reghop3 to i32 (i8*, i32, i8*, ...)*)(i8* %s.1, i32 %start_shift.1, i8* %strend)
  %499 = sext i32 %498 to i64
  %500 = inttoptr i64 %499 to i8*
  br label %504

; <label>:501                                     ; preds = %493
  %502 = sext i32 %start_shift.1 to i64
  %503 = getelementptr inbounds i8* %s.1, i64 %502
  br label %504

; <label>:504                                     ; preds = %501, %497
  %505 = phi i8* [ %500, %497 ], [ %503, %501 ]
  %506 = load i8* @PL_reg_match_utf8, align 1
  %507 = sext i8 %506 to i32
  %508 = icmp ne i32 %507, 0
  br i1 %508, label %509, label %514

; <label>:509                                     ; preds = %504
  %510 = sub nsw i32 0, %end_shift.3
  %511 = call i32 (i8*, i32, i8*, ...)* bitcast (i32 (...)* @reghop3 to i32 (i8*, i32, i8*, ...)*)(i8* %strend, i32 %510, i8* %53)
  %512 = sext i32 %511 to i64
  %513 = inttoptr i64 %512 to i8*
  br label %518

; <label>:514                                     ; preds = %504
  %515 = sub nsw i32 0, %end_shift.3
  %516 = sext i32 %515 to i64
  %517 = getelementptr inbounds i8* %strend, i64 %516
  br label %518

; <label>:518                                     ; preds = %514, %509
  %519 = phi i8* [ %513, %509 ], [ %517, %514 ]
  %520 = load i32* @PL_multiline, align 4
  %521 = icmp ne i32 %520, 0
  %522 = select i1 %521, i32 1, i32 0
  %523 = call i8* @Perl_fbm_instr(i8* %505, i8* %519, %struct.sv* %check.1, i32 %522)
  br label %524

; <label>:524                                     ; preds = %518, %483
  %s.3 = phi i8* [ %492, %483 ], [ %523, %518 ]
  br label %525

; <label>:525                                     ; preds = %524, %477
  %s.4 = phi i8* [ %s.2, %477 ], [ %s.3, %524 ]
  %526 = icmp ne i8* %s.4, null
  br i1 %526, label %528, label %527

; <label>:527                                     ; preds = %525
  br label %1642

; <label>:528                                     ; preds = %525
  %529 = icmp ne i32 %8, 0
  br i1 %529, label %530, label %546

; <label>:530                                     ; preds = %528
  %531 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %532 = load %struct.reg_substr_data** %531, align 8
  %533 = getelementptr inbounds %struct.reg_substr_data* %532, i32 0, i32 0
  %534 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %533, i32 0, i64 1
  %535 = getelementptr inbounds %struct.reg_substr_datum* %534, i32 0, i32 3
  %536 = load %struct.sv** %535, align 8
  %537 = icmp ne %struct.sv* %536, null
  br i1 %537, label %538, label %1058

; <label>:538                                     ; preds = %530
  %539 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %540 = load %struct.reg_substr_data** %539, align 8
  %541 = getelementptr inbounds %struct.reg_substr_data* %540, i32 0, i32 0
  %542 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %541, i32 0, i64 0
  %543 = getelementptr inbounds %struct.reg_substr_datum* %542, i32 0, i32 3
  %544 = load %struct.sv** %543, align 8
  %545 = icmp ne %struct.sv* %544, null
  br i1 %545, label %562, label %1058

; <label>:546                                     ; preds = %528
  %547 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %548 = load %struct.reg_substr_data** %547, align 8
  %549 = getelementptr inbounds %struct.reg_substr_data* %548, i32 0, i32 0
  %550 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %549, i32 0, i64 1
  %551 = getelementptr inbounds %struct.reg_substr_datum* %550, i32 0, i32 2
  %552 = load %struct.sv** %551, align 8
  %553 = icmp ne %struct.sv* %552, null
  br i1 %553, label %554, label %1058

; <label>:554                                     ; preds = %546
  %555 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %556 = load %struct.reg_substr_data** %555, align 8
  %557 = getelementptr inbounds %struct.reg_substr_data* %556, i32 0, i32 0
  %558 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %557, i32 0, i64 0
  %559 = getelementptr inbounds %struct.reg_substr_datum* %558, i32 0, i32 2
  %560 = load %struct.sv** %559, align 8
  %561 = icmp ne %struct.sv* %560, null
  br i1 %561, label %562, label %1058

; <label>:562                                     ; preds = %554, %538
  %563 = icmp ne i8* %other_last.0, null
  br i1 %563, label %565, label %564

; <label>:564                                     ; preds = %562
  br label %565

; <label>:565                                     ; preds = %564, %562
  %other_last.1 = phi i8* [ %other_last.0, %562 ], [ %.01, %564 ]
  %566 = icmp ne i32 %8, 0
  br i1 %566, label %567, label %574

; <label>:567                                     ; preds = %565
  %568 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %569 = load %struct.reg_substr_data** %568, align 8
  %570 = getelementptr inbounds %struct.reg_substr_data* %569, i32 0, i32 0
  %571 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %570, i32 0, i64 1
  %572 = getelementptr inbounds %struct.reg_substr_datum* %571, i32 0, i32 3
  %573 = load %struct.sv** %572, align 8
  br label %581

; <label>:574                                     ; preds = %565
  %575 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %576 = load %struct.reg_substr_data** %575, align 8
  %577 = getelementptr inbounds %struct.reg_substr_data* %576, i32 0, i32 0
  %578 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %577, i32 0, i64 1
  %579 = getelementptr inbounds %struct.reg_substr_datum* %578, i32 0, i32 2
  %580 = load %struct.sv** %579, align 8
  br label %581

; <label>:581                                     ; preds = %574, %567
  %582 = phi %struct.sv* [ %573, %567 ], [ %580, %574 ]
  %583 = icmp eq %struct.sv* %check.1, %582
  br i1 %583, label %584, label %879

; <label>:584                                     ; preds = %581
  br label %585

; <label>:585                                     ; preds = %1603, %1145, %584
  %ml_anch.2 = phi i32 [ %ml_anch.1, %584 ], [ %ml_anch.8, %1603 ], [ %ml_anch.4, %1145 ]
  %check.2 = phi %struct.sv* [ %check.1, %584 ], [ %check.9, %1603 ], [ %check.4, %1145 ]
  %s.5 = phi i8* [ %s.4, %584 ], [ %check_at.6, %1603 ], [ %s.10, %1145 ]
  %end_shift.4 = phi i32 [ %end_shift.3, %584 ], [ %end_shift.10, %1603 ], [ %end_shift.6, %1145 ]
  %start_shift.2 = phi i32 [ %start_shift.1, %584 ], [ %start_shift.8, %1603 ], [ %start_shift.4, %1145 ]
  %other_last.2 = phi i8* [ %other_last.1, %584 ], [ %other_last.8, %1603 ], [ %other_last.4, %1145 ]
  %check_at.0 = phi i8* [ %s.4, %584 ], [ %check_at.6, %1603 ], [ %check_at.2, %1145 ]
  %.1 = phi i8* [ %.01, %584 ], [ %.7, %1603 ], [ %1146, %1145 ]
  %586 = load i8* @PL_reg_match_utf8, align 1
  %587 = sext i8 %586 to i32
  %588 = icmp ne i32 %587, 0
  br i1 %588, label %589, label %594

; <label>:589                                     ; preds = %585
  %590 = sub nsw i32 0, %start_shift.2
  %591 = call i32 (i8*, i32, i8*, ...)* bitcast (i32 (...)* @reghop3 to i32 (i8*, i32, i8*, ...)*)(i8* %s.5, i32 %590, i8* %53)
  %592 = sext i32 %591 to i64
  %593 = inttoptr i64 %592 to i8*
  br label %598

; <label>:594                                     ; preds = %585
  %595 = sub nsw i32 0, %start_shift.2
  %596 = sext i32 %595 to i64
  %597 = getelementptr inbounds i8* %s.5, i64 %596
  br label %598

; <label>:598                                     ; preds = %594, %589
  %599 = phi i8* [ %593, %589 ], [ %597, %594 ]
  %600 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %601 = load %struct.reg_substr_data** %600, align 8
  %602 = getelementptr inbounds %struct.reg_substr_data* %601, i32 0, i32 0
  %603 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %602, i32 0, i64 2
  %604 = getelementptr inbounds %struct.reg_substr_datum* %603, i32 0, i32 1
  %605 = load i32* %604, align 4
  %606 = sext i32 %605 to i64
  %607 = sub i64 0, %606
  %608 = getelementptr inbounds i8* %s.5, i64 %607
  %609 = ptrtoint i8* %s.5 to i64
  %610 = ptrtoint i8* %.1 to i64
  %611 = sub i64 %609, %610
  %612 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %613 = load %struct.reg_substr_data** %612, align 8
  %614 = getelementptr inbounds %struct.reg_substr_data* %613, i32 0, i32 0
  %615 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %614, i32 0, i64 2
  %616 = getelementptr inbounds %struct.reg_substr_datum* %615, i32 0, i32 1
  %617 = load i32* %616, align 4
  %618 = sext i32 %617 to i64
  %619 = icmp sgt i64 %611, %618
  br i1 %619, label %620, label %637

; <label>:620                                     ; preds = %598
  %621 = icmp ne i32 %8, 0
  br i1 %621, label %622, label %636

; <label>:622                                     ; preds = %620
  %623 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %624 = load %struct.reg_substr_data** %623, align 8
  %625 = getelementptr inbounds %struct.reg_substr_data* %624, i32 0, i32 0
  %626 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %625, i32 0, i64 2
  %627 = getelementptr inbounds %struct.reg_substr_datum* %626, i32 0, i32 1
  %628 = load i32* %627, align 4
  %629 = sub nsw i32 0, %628
  %630 = call i32 (i8*, i32, i8*, ...)* bitcast (i32 (...)* @reghopmaybe3 to i32 (i8*, i32, i8*, ...)*)(i8* %s.5, i32 %629, i8* %.1)
  %631 = sext i32 %630 to i64
  %632 = inttoptr i64 %631 to i8*
  %633 = icmp ne i8* %632, null
  br i1 %633, label %634, label %637

; <label>:634                                     ; preds = %622
  %635 = icmp ugt i8* %632, %.1
  br i1 %635, label %636, label %637

; <label>:636                                     ; preds = %634, %620
  %t.0 = phi i8* [ %632, %634 ], [ %608, %620 ]
  br label %638

; <label>:637                                     ; preds = %634, %622, %598
  br label %638

; <label>:638                                     ; preds = %637, %636
  %t.1 = phi i8* [ %t.0, %636 ], [ %.1, %637 ]
  %639 = load i8* @PL_reg_match_utf8, align 1
  %640 = sext i8 %639 to i32
  %641 = icmp ne i32 %640, 0
  br i1 %641, label %642, label %652

; <label>:642                                     ; preds = %638
  %643 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %644 = load %struct.reg_substr_data** %643, align 8
  %645 = getelementptr inbounds %struct.reg_substr_data* %644, i32 0, i32 0
  %646 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %645, i32 0, i64 0
  %647 = getelementptr inbounds %struct.reg_substr_datum* %646, i32 0, i32 0
  %648 = load i32* %647, align 4
  %649 = call i32 (i8*, i32, i8*, ...)* bitcast (i32 (...)* @reghop3 to i32 (i8*, i32, i8*, ...)*)(i8* %t.1, i32 %648, i8* %strend)
  %650 = sext i32 %649 to i64
  %651 = inttoptr i64 %650 to i8*
  br label %661

; <label>:652                                     ; preds = %638
  %653 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %654 = load %struct.reg_substr_data** %653, align 8
  %655 = getelementptr inbounds %struct.reg_substr_data* %654, i32 0, i32 0
  %656 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %655, i32 0, i64 0
  %657 = getelementptr inbounds %struct.reg_substr_datum* %656, i32 0, i32 0
  %658 = load i32* %657, align 4
  %659 = sext i32 %658 to i64
  %660 = getelementptr inbounds i8* %t.1, i64 %659
  br label %661

; <label>:661                                     ; preds = %652, %642
  %662 = phi i8* [ %651, %642 ], [ %660, %652 ]
  %663 = icmp ult i8* %662, %other_last.2
  br i1 %663, label %664, label %665

; <label>:664                                     ; preds = %661
  br label %665

; <label>:665                                     ; preds = %664, %661
  %t.2 = phi i8* [ %other_last.2, %664 ], [ %662, %661 ]
  %666 = load i8* @PL_reg_match_utf8, align 1
  %667 = sext i8 %666 to i32
  %668 = icmp ne i32 %667, 0
  br i1 %668, label %669, label %676

; <label>:669                                     ; preds = %665
  %670 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 10
  %671 = load i32* %670, align 4
  %672 = sub nsw i32 0, %671
  %673 = call i32 (i8*, i32, i8*, ...)* bitcast (i32 (...)* @reghop3 to i32 (i8*, i32, i8*, ...)*)(i8* %strend, i32 %672, i8* %53)
  %674 = sext i32 %673 to i64
  %675 = inttoptr i64 %674 to i8*
  br label %682

; <label>:676                                     ; preds = %665
  %677 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 10
  %678 = load i32* %677, align 4
  %679 = sub nsw i32 0, %678
  %680 = sext i32 %679 to i64
  %681 = getelementptr inbounds i8* %strend, i64 %680
  br label %682

; <label>:682                                     ; preds = %676, %669
  %683 = phi i8* [ %675, %669 ], [ %681, %676 ]
  %684 = icmp ult i8* %599, %683
  br i1 %684, label %685, label %686

; <label>:685                                     ; preds = %682
  br label %686

; <label>:686                                     ; preds = %685, %682
  %last1.0 = phi i8* [ %599, %685 ], [ %683, %682 ]
  %687 = icmp ne i32 %8, 0
  br i1 %687, label %688, label %695

; <label>:688                                     ; preds = %686
  %689 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %690 = load %struct.reg_substr_data** %689, align 8
  %691 = getelementptr inbounds %struct.reg_substr_data* %690, i32 0, i32 0
  %692 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %691, i32 0, i64 0
  %693 = getelementptr inbounds %struct.reg_substr_datum* %692, i32 0, i32 3
  %694 = load %struct.sv** %693, align 8
  br label %702

; <label>:695                                     ; preds = %686
  %696 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %697 = load %struct.reg_substr_data** %696, align 8
  %698 = getelementptr inbounds %struct.reg_substr_data* %697, i32 0, i32 0
  %699 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %698, i32 0, i64 0
  %700 = getelementptr inbounds %struct.reg_substr_datum* %699, i32 0, i32 2
  %701 = load %struct.sv** %700, align 8
  br label %702

; <label>:702                                     ; preds = %695, %688
  %703 = phi %struct.sv* [ %694, %688 ], [ %701, %695 ]
  %704 = icmp eq %struct.sv* %703, @PL_sv_undef
  br i1 %704, label %705, label %706

; <label>:705                                     ; preds = %702
  br label %795

; <label>:706                                     ; preds = %702
  %707 = load i8* @PL_reg_match_utf8, align 1
  %708 = sext i8 %707 to i32
  %709 = icmp ne i32 %708, 0
  br i1 %709, label %710, label %750

; <label>:710                                     ; preds = %706
  %711 = load i8* @PL_reg_match_utf8, align 1
  %712 = sext i8 %711 to i32
  %713 = icmp ne i32 %712, 0
  br i1 %713, label %714, label %724

; <label>:714                                     ; preds = %710
  %715 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %716 = load %struct.reg_substr_data** %715, align 8
  %717 = getelementptr inbounds %struct.reg_substr_data* %716, i32 0, i32 0
  %718 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %717, i32 0, i64 0
  %719 = getelementptr inbounds %struct.reg_substr_datum* %718, i32 0, i32 0
  %720 = load i32* %719, align 4
  %721 = call i32 (i8*, i32, i8*, ...)* bitcast (i32 (...)* @reghop3 to i32 (i8*, i32, i8*, ...)*)(i8* %last1.0, i32 %720, i8* %strend)
  %722 = sext i32 %721 to i64
  %723 = inttoptr i64 %722 to i8*
  br label %733

; <label>:724                                     ; preds = %710
  %725 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %726 = load %struct.reg_substr_data** %725, align 8
  %727 = getelementptr inbounds %struct.reg_substr_data* %726, i32 0, i32 0
  %728 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %727, i32 0, i64 0
  %729 = getelementptr inbounds %struct.reg_substr_datum* %728, i32 0, i32 0
  %730 = load i32* %729, align 4
  %731 = sext i32 %730 to i64
  %732 = getelementptr inbounds i8* %last1.0, i64 %731
  br label %733

; <label>:733                                     ; preds = %724, %714
  %734 = phi i8* [ %723, %714 ], [ %732, %724 ]
  %735 = getelementptr inbounds %struct.sv* %703, i32 0, i32 0
  %736 = load i8** %735, align 8
  %737 = bitcast i8* %736 to %struct.xpv*
  %738 = getelementptr inbounds %struct.xpv* %737, i32 0, i32 1
  %739 = load i64* %738, align 8
  %740 = getelementptr inbounds i8* %734, i64 %739
  %741 = getelementptr inbounds %struct.sv* %703, i32 0, i32 2
  %742 = load i32* %741, align 4
  %743 = and i32 %742, 1073741824
  %744 = icmp ne i32 %743, 0
  %745 = zext i1 %744 to i32
  %746 = sub nsw i32 0, %745
  %747 = call i32 (i8*, i32, i8*, ...)* bitcast (i32 (...)* @reghop3 to i32 (i8*, i32, i8*, ...)*)(i8* %740, i32 %746, i8* %53)
  %748 = sext i32 %747 to i64
  %749 = inttoptr i64 %748 to i8*
  br label %789

; <label>:750                                     ; preds = %706
  %751 = load i8* @PL_reg_match_utf8, align 1
  %752 = sext i8 %751 to i32
  %753 = icmp ne i32 %752, 0
  br i1 %753, label %754, label %764

; <label>:754                                     ; preds = %750
  %755 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %756 = load %struct.reg_substr_data** %755, align 8
  %757 = getelementptr inbounds %struct.reg_substr_data* %756, i32 0, i32 0
  %758 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %757, i32 0, i64 0
  %759 = getelementptr inbounds %struct.reg_substr_datum* %758, i32 0, i32 0
  %760 = load i32* %759, align 4
  %761 = call i32 (i8*, i32, i8*, ...)* bitcast (i32 (...)* @reghop3 to i32 (i8*, i32, i8*, ...)*)(i8* %last1.0, i32 %760, i8* %strend)
  %762 = sext i32 %761 to i64
  %763 = inttoptr i64 %762 to i8*
  br label %773

; <label>:764                                     ; preds = %750
  %765 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %766 = load %struct.reg_substr_data** %765, align 8
  %767 = getelementptr inbounds %struct.reg_substr_data* %766, i32 0, i32 0
  %768 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %767, i32 0, i64 0
  %769 = getelementptr inbounds %struct.reg_substr_datum* %768, i32 0, i32 0
  %770 = load i32* %769, align 4
  %771 = sext i32 %770 to i64
  %772 = getelementptr inbounds i8* %last1.0, i64 %771
  br label %773

; <label>:773                                     ; preds = %764, %754
  %774 = phi i8* [ %763, %754 ], [ %772, %764 ]
  %775 = getelementptr inbounds %struct.sv* %703, i32 0, i32 0
  %776 = load i8** %775, align 8
  %777 = bitcast i8* %776 to %struct.xpv*
  %778 = getelementptr inbounds %struct.xpv* %777, i32 0, i32 1
  %779 = load i64* %778, align 8
  %780 = getelementptr inbounds i8* %774, i64 %779
  %781 = getelementptr inbounds %struct.sv* %703, i32 0, i32 2
  %782 = load i32* %781, align 4
  %783 = and i32 %782, 1073741824
  %784 = icmp ne i32 %783, 0
  %785 = zext i1 %784 to i32
  %786 = sub nsw i32 0, %785
  %787 = sext i32 %786 to i64
  %788 = getelementptr inbounds i8* %780, i64 %787
  br label %789

; <label>:789                                     ; preds = %773, %733
  %790 = phi i8* [ %749, %733 ], [ %788, %773 ]
  %791 = load i32* @PL_multiline, align 4
  %792 = icmp ne i32 %791, 0
  %793 = select i1 %792, i32 1, i32 0
  %794 = call i8* @Perl_fbm_instr(i8* %t.2, i8* %790, %struct.sv* %703, i32 %793)
  br label %795

; <label>:795                                     ; preds = %789, %705
  %s.6 = phi i8* [ null, %705 ], [ %794, %789 ]
  %796 = icmp ne i8* %s.6, null
  br i1 %796, label %838, label %797

; <label>:797                                     ; preds = %795
  %798 = icmp uge i8* %last1.0, %683
  br i1 %798, label %799, label %800

; <label>:799                                     ; preds = %797
  br label %1642

; <label>:800                                     ; preds = %797
  %801 = load i8* @PL_reg_match_utf8, align 1
  %802 = sext i8 %801 to i32
  %803 = icmp ne i32 %802, 0
  br i1 %803, label %804, label %815

; <label>:804                                     ; preds = %800
  %805 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %806 = load %struct.reg_substr_data** %805, align 8
  %807 = getelementptr inbounds %struct.reg_substr_data* %806, i32 0, i32 0
  %808 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %807, i32 0, i64 0
  %809 = getelementptr inbounds %struct.reg_substr_datum* %808, i32 0, i32 0
  %810 = load i32* %809, align 4
  %811 = add nsw i32 %810, 1
  %812 = call i32 (i8*, i32, i8*, ...)* bitcast (i32 (...)* @reghop3 to i32 (i8*, i32, i8*, ...)*)(i8* %last1.0, i32 %811, i8* %strend)
  %813 = sext i32 %812 to i64
  %814 = inttoptr i64 %813 to i8*
  br label %825

; <label>:815                                     ; preds = %800
  %816 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %817 = load %struct.reg_substr_data** %816, align 8
  %818 = getelementptr inbounds %struct.reg_substr_data* %817, i32 0, i32 0
  %819 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %818, i32 0, i64 0
  %820 = getelementptr inbounds %struct.reg_substr_datum* %819, i32 0, i32 0
  %821 = load i32* %820, align 4
  %822 = sext i32 %821 to i64
  %823 = getelementptr inbounds i8* %last1.0, i64 %822
  %824 = getelementptr inbounds i8* %823, i64 1
  br label %825

; <label>:825                                     ; preds = %815, %804
  %826 = phi i8* [ %814, %804 ], [ %824, %815 ]
  %827 = load i8* @PL_reg_match_utf8, align 1
  %828 = sext i8 %827 to i32
  %829 = icmp ne i32 %828, 0
  br i1 %829, label %830, label %834

; <label>:830                                     ; preds = %825
  %831 = call i32 (i8*, i32, i8*, ...)* bitcast (i32 (...)* @reghop3 to i32 (i8*, i32, i8*, ...)*)(i8* %599, i32 1, i8* %strend)
  %832 = sext i32 %831 to i64
  %833 = inttoptr i64 %832 to i8*
  br label %836

; <label>:834                                     ; preds = %825
  %835 = getelementptr inbounds i8* %599, i64 1
  br label %836

; <label>:836                                     ; preds = %834, %830
  %837 = phi i8* [ %833, %830 ], [ %835, %834 ]
  br label %398

; <label>:838                                     ; preds = %795
  %839 = load i8* @PL_reg_match_utf8, align 1
  %840 = sext i8 %839 to i32
  %841 = icmp ne i32 %840, 0
  br i1 %841, label %842, label %853

; <label>:842                                     ; preds = %838
  %843 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %844 = load %struct.reg_substr_data** %843, align 8
  %845 = getelementptr inbounds %struct.reg_substr_data* %844, i32 0, i32 0
  %846 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %845, i32 0, i64 0
  %847 = getelementptr inbounds %struct.reg_substr_datum* %846, i32 0, i32 0
  %848 = load i32* %847, align 4
  %849 = sub nsw i32 0, %848
  %850 = call i32 (i8*, i32, i8*, ...)* bitcast (i32 (...)* @reghop3 to i32 (i8*, i32, i8*, ...)*)(i8* %s.6, i32 %849, i8* %53)
  %851 = sext i32 %850 to i64
  %852 = inttoptr i64 %851 to i8*
  br label %863

; <label>:853                                     ; preds = %838
  %854 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %855 = load %struct.reg_substr_data** %854, align 8
  %856 = getelementptr inbounds %struct.reg_substr_data* %855, i32 0, i32 0
  %857 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %856, i32 0, i64 0
  %858 = getelementptr inbounds %struct.reg_substr_datum* %857, i32 0, i32 0
  %859 = load i32* %858, align 4
  %860 = sub nsw i32 0, %859
  %861 = sext i32 %860 to i64
  %862 = getelementptr inbounds i8* %s.6, i64 %861
  br label %863

; <label>:863                                     ; preds = %853, %842
  %864 = phi i8* [ %852, %842 ], [ %862, %853 ]
  %865 = load i8* @PL_reg_match_utf8, align 1
  %866 = sext i8 %865 to i32
  %867 = icmp ne i32 %866, 0
  br i1 %867, label %868, label %872

; <label>:868                                     ; preds = %863
  %869 = call i32 (i8*, i32, i8*, ...)* bitcast (i32 (...)* @reghop3 to i32 (i8*, i32, i8*, ...)*)(i8* %s.6, i32 1, i8* %strend)
  %870 = sext i32 %869 to i64
  %871 = inttoptr i64 %870 to i8*
  br label %874

; <label>:872                                     ; preds = %863
  %873 = getelementptr inbounds i8* %s.6, i64 1
  br label %874

; <label>:874                                     ; preds = %872, %868
  %875 = phi i8* [ %871, %868 ], [ %873, %872 ]
  %876 = icmp eq i8* %864, %.1
  br i1 %876, label %877, label %878

; <label>:877                                     ; preds = %874
  br label %1181

; <label>:878                                     ; preds = %874
  br label %1096

; <label>:879                                     ; preds = %581
  %880 = load i8* @PL_reg_match_utf8, align 1
  %881 = sext i8 %880 to i32
  %882 = icmp ne i32 %881, 0
  br i1 %882, label %883, label %888

; <label>:883                                     ; preds = %879
  %884 = sub nsw i32 0, %start_shift.1
  %885 = call i32 (i8*, i32, i8*, ...)* bitcast (i32 (...)* @reghop3 to i32 (i8*, i32, i8*, ...)*)(i8* %s.4, i32 %884, i8* %53)
  %886 = sext i32 %885 to i64
  %887 = inttoptr i64 %886 to i8*
  br label %892

; <label>:888                                     ; preds = %879
  %889 = sub nsw i32 0, %start_shift.1
  %890 = sext i32 %889 to i64
  %891 = getelementptr inbounds i8* %s.4, i64 %890
  br label %892

; <label>:892                                     ; preds = %888, %883
  %893 = phi i8* [ %887, %883 ], [ %891, %888 ]
  %894 = load i8* @PL_reg_match_utf8, align 1
  %895 = sext i8 %894 to i32
  %896 = icmp ne i32 %895, 0
  br i1 %896, label %897, label %911

; <label>:897                                     ; preds = %892
  %898 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 10
  %899 = load i32* %898, align 4
  %900 = sub nsw i32 0, %899
  %901 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %902 = load %struct.reg_substr_data** %901, align 8
  %903 = getelementptr inbounds %struct.reg_substr_data* %902, i32 0, i32 0
  %904 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %903, i32 0, i64 1
  %905 = getelementptr inbounds %struct.reg_substr_datum* %904, i32 0, i32 0
  %906 = load i32* %905, align 4
  %907 = add nsw i32 %900, %906
  %908 = call i32 (i8*, i32, i8*, ...)* bitcast (i32 (...)* @reghop3 to i32 (i8*, i32, i8*, ...)*)(i8* %strend, i32 %907, i8* %53)
  %909 = sext i32 %908 to i64
  %910 = inttoptr i64 %909 to i8*
  br label %925

; <label>:911                                     ; preds = %892
  %912 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 10
  %913 = load i32* %912, align 4
  %914 = sub nsw i32 0, %913
  %915 = sext i32 %914 to i64
  %916 = getelementptr inbounds i8* %strend, i64 %915
  %917 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %918 = load %struct.reg_substr_data** %917, align 8
  %919 = getelementptr inbounds %struct.reg_substr_data* %918, i32 0, i32 0
  %920 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %919, i32 0, i64 1
  %921 = getelementptr inbounds %struct.reg_substr_datum* %920, i32 0, i32 0
  %922 = load i32* %921, align 4
  %923 = sext i32 %922 to i64
  %924 = getelementptr inbounds i8* %916, i64 %923
  br label %925

; <label>:925                                     ; preds = %911, %897
  %926 = phi i8* [ %910, %897 ], [ %924, %911 ]
  %927 = load i8* @PL_reg_match_utf8, align 1
  %928 = sext i8 %927 to i32
  %929 = icmp ne i32 %928, 0
  br i1 %929, label %930, label %932

; <label>:930                                     ; preds = %925
  %931 = call i64 @Perl_utf8_distance(i8* %926, i8* %893)
  br label %936

; <label>:932                                     ; preds = %925
  %933 = ptrtoint i8* %926 to i64
  %934 = ptrtoint i8* %893 to i64
  %935 = sub i64 %933, %934
  br label %936

; <label>:936                                     ; preds = %932, %930
  %937 = phi i64 [ %931, %930 ], [ %935, %932 ]
  %938 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %939 = load %struct.reg_substr_data** %938, align 8
  %940 = getelementptr inbounds %struct.reg_substr_data* %939, i32 0, i32 0
  %941 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %940, i32 0, i64 1
  %942 = getelementptr inbounds %struct.reg_substr_datum* %941, i32 0, i32 1
  %943 = load i32* %942, align 4
  %944 = sext i32 %943 to i64
  %945 = icmp sgt i64 %937, %944
  br i1 %945, label %946, label %971

; <label>:946                                     ; preds = %936
  %947 = load i8* @PL_reg_match_utf8, align 1
  %948 = sext i8 %947 to i32
  %949 = icmp ne i32 %948, 0
  br i1 %949, label %950, label %960

; <label>:950                                     ; preds = %946
  %951 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %952 = load %struct.reg_substr_data** %951, align 8
  %953 = getelementptr inbounds %struct.reg_substr_data* %952, i32 0, i32 0
  %954 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %953, i32 0, i64 1
  %955 = getelementptr inbounds %struct.reg_substr_datum* %954, i32 0, i32 1
  %956 = load i32* %955, align 4
  %957 = call i32 (i8*, i32, i8*, ...)* bitcast (i32 (...)* @reghop3 to i32 (i8*, i32, i8*, ...)*)(i8* %893, i32 %956, i8* %strend)
  %958 = sext i32 %957 to i64
  %959 = inttoptr i64 %958 to i8*
  br label %969

; <label>:960                                     ; preds = %946
  %961 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %962 = load %struct.reg_substr_data** %961, align 8
  %963 = getelementptr inbounds %struct.reg_substr_data* %962, i32 0, i32 0
  %964 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %963, i32 0, i64 1
  %965 = getelementptr inbounds %struct.reg_substr_datum* %964, i32 0, i32 1
  %966 = load i32* %965, align 4
  %967 = sext i32 %966 to i64
  %968 = getelementptr inbounds i8* %893, i64 %967
  br label %969

; <label>:969                                     ; preds = %960, %950
  %970 = phi i8* [ %959, %950 ], [ %968, %960 ]
  br label %971

; <label>:971                                     ; preds = %969, %936
  %last3.0 = phi i8* [ %970, %969 ], [ %926, %936 ]
  %972 = load i8* @PL_reg_match_utf8, align 1
  %973 = sext i8 %972 to i32
  %974 = icmp ne i32 %973, 0
  br i1 %974, label %975, label %985

; <label>:975                                     ; preds = %971
  %976 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %977 = load %struct.reg_substr_data** %976, align 8
  %978 = getelementptr inbounds %struct.reg_substr_data* %977, i32 0, i32 0
  %979 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %978, i32 0, i64 1
  %980 = getelementptr inbounds %struct.reg_substr_datum* %979, i32 0, i32 0
  %981 = load i32* %980, align 4
  %982 = call i32 (i8*, i32, i8*, ...)* bitcast (i32 (...)* @reghop3 to i32 (i8*, i32, i8*, ...)*)(i8* %893, i32 %981, i8* %strend)
  %983 = sext i32 %982 to i64
  %984 = inttoptr i64 %983 to i8*
  br label %994

; <label>:985                                     ; preds = %971
  %986 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %987 = load %struct.reg_substr_data** %986, align 8
  %988 = getelementptr inbounds %struct.reg_substr_data* %987, i32 0, i32 0
  %989 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %988, i32 0, i64 1
  %990 = getelementptr inbounds %struct.reg_substr_datum* %989, i32 0, i32 0
  %991 = load i32* %990, align 4
  %992 = sext i32 %991 to i64
  %993 = getelementptr inbounds i8* %893, i64 %992
  br label %994

; <label>:994                                     ; preds = %985, %975
  %995 = phi i8* [ %984, %975 ], [ %993, %985 ]
  %996 = icmp ult i8* %995, %other_last.1
  br i1 %996, label %997, label %998

; <label>:997                                     ; preds = %994
  br label %998

; <label>:998                                     ; preds = %997, %994
  %s.7 = phi i8* [ %other_last.1, %997 ], [ %995, %994 ]
  %999 = icmp ne i32 %8, 0
  br i1 %999, label %1000, label %1007

; <label>:1000                                    ; preds = %998
  %1001 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %1002 = load %struct.reg_substr_data** %1001, align 8
  %1003 = getelementptr inbounds %struct.reg_substr_data* %1002, i32 0, i32 0
  %1004 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1003, i32 0, i64 1
  %1005 = getelementptr inbounds %struct.reg_substr_datum* %1004, i32 0, i32 3
  %1006 = load %struct.sv** %1005, align 8
  br label %1014

; <label>:1007                                    ; preds = %998
  %1008 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %1009 = load %struct.reg_substr_data** %1008, align 8
  %1010 = getelementptr inbounds %struct.reg_substr_data* %1009, i32 0, i32 0
  %1011 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1010, i32 0, i64 1
  %1012 = getelementptr inbounds %struct.reg_substr_datum* %1011, i32 0, i32 2
  %1013 = load %struct.sv** %1012, align 8
  br label %1014

; <label>:1014                                    ; preds = %1007, %1000
  %1015 = phi %struct.sv* [ %1006, %1000 ], [ %1013, %1007 ]
  %1016 = icmp eq %struct.sv* %1015, @PL_sv_undef
  br i1 %1016, label %1017, label %1018

; <label>:1017                                    ; preds = %1014
  br label %1037

; <label>:1018                                    ; preds = %1014
  %1019 = getelementptr inbounds %struct.sv* %1015, i32 0, i32 0
  %1020 = load i8** %1019, align 8
  %1021 = bitcast i8* %1020 to %struct.xpv*
  %1022 = getelementptr inbounds %struct.xpv* %1021, i32 0, i32 1
  %1023 = load i64* %1022, align 8
  %1024 = getelementptr inbounds i8* %last3.0, i64 %1023
  %1025 = getelementptr inbounds %struct.sv* %1015, i32 0, i32 2
  %1026 = load i32* %1025, align 4
  %1027 = and i32 %1026, 1073741824
  %1028 = icmp ne i32 %1027, 0
  %1029 = zext i1 %1028 to i32
  %1030 = sext i32 %1029 to i64
  %1031 = sub i64 0, %1030
  %1032 = getelementptr inbounds i8* %1024, i64 %1031
  %1033 = load i32* @PL_multiline, align 4
  %1034 = icmp ne i32 %1033, 0
  %1035 = select i1 %1034, i32 1, i32 0
  %1036 = call i8* @Perl_fbm_instr(i8* %s.7, i8* %1032, %struct.sv* %1015, i32 %1035)
  br label %1037

; <label>:1037                                    ; preds = %1018, %1017
  %s.8 = phi i8* [ null, %1017 ], [ %1036, %1018 ]
  %1038 = icmp ne i8* %s.8, null
  br i1 %1038, label %1054, label %1039

; <label>:1039                                    ; preds = %1037
  %1040 = icmp eq i8* %926, %last3.0
  br i1 %1040, label %1041, label %1042

; <label>:1041                                    ; preds = %1039
  br label %1642

; <label>:1042                                    ; preds = %1039
  %1043 = load i8* @PL_reg_match_utf8, align 1
  %1044 = sext i8 %1043 to i32
  %1045 = icmp ne i32 %1044, 0
  br i1 %1045, label %1046, label %1050

; <label>:1046                                    ; preds = %1042
  %1047 = call i32 (i8*, i32, i8*, ...)* bitcast (i32 (...)* @reghop3 to i32 (i8*, i32, i8*, ...)*)(i8* %893, i32 1, i8* %strend)
  %1048 = sext i32 %1047 to i64
  %1049 = inttoptr i64 %1048 to i8*
  br label %1052

; <label>:1050                                    ; preds = %1042
  %1051 = getelementptr inbounds i8* %893, i64 1
  br label %1052

; <label>:1052                                    ; preds = %1050, %1046
  %1053 = phi i8* [ %1049, %1046 ], [ %1051, %1050 ]
  br label %398

; <label>:1054                                    ; preds = %1037
  %1055 = icmp eq i8* %893, %.01
  br i1 %1055, label %1056, label %1057

; <label>:1056                                    ; preds = %1054
  br label %1181

; <label>:1057                                    ; preds = %1054
  br label %1096

; <label>:1058                                    ; preds = %554, %546, %538, %530
  %1059 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %1060 = load %struct.reg_substr_data** %1059, align 8
  %1061 = getelementptr inbounds %struct.reg_substr_data* %1060, i32 0, i32 0
  %1062 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1061, i32 0, i64 2
  %1063 = getelementptr inbounds %struct.reg_substr_datum* %1062, i32 0, i32 1
  %1064 = load i32* %1063, align 4
  %1065 = sext i32 %1064 to i64
  %1066 = sub i64 0, %1065
  %1067 = getelementptr inbounds i8* %s.4, i64 %1066
  %1068 = ptrtoint i8* %s.4 to i64
  %1069 = ptrtoint i8* %.01 to i64
  %1070 = sub i64 %1068, %1069
  %1071 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %1072 = load %struct.reg_substr_data** %1071, align 8
  %1073 = getelementptr inbounds %struct.reg_substr_data* %1072, i32 0, i32 0
  %1074 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1073, i32 0, i64 2
  %1075 = getelementptr inbounds %struct.reg_substr_datum* %1074, i32 0, i32 1
  %1076 = load i32* %1075, align 4
  %1077 = sext i32 %1076 to i64
  %1078 = icmp sgt i64 %1070, %1077
  br i1 %1078, label %1079, label %1180

; <label>:1079                                    ; preds = %1058
  %1080 = icmp ne i32 %8, 0
  br i1 %1080, label %1081, label %1095

; <label>:1081                                    ; preds = %1079
  %1082 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %1083 = load %struct.reg_substr_data** %1082, align 8
  %1084 = getelementptr inbounds %struct.reg_substr_data* %1083, i32 0, i32 0
  %1085 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1084, i32 0, i64 2
  %1086 = getelementptr inbounds %struct.reg_substr_datum* %1085, i32 0, i32 1
  %1087 = load i32* %1086, align 4
  %1088 = sub nsw i32 0, %1087
  %1089 = call i32 (i8*, i32, i8*, ...)* bitcast (i32 (...)* @reghopmaybe3 to i32 (i8*, i32, i8*, ...)*)(i8* %s.4, i32 %1088, i8* %.01)
  %1090 = sext i32 %1089 to i64
  %1091 = inttoptr i64 %1090 to i8*
  %1092 = icmp ne i8* %1091, null
  br i1 %1092, label %1093, label %1180

; <label>:1093                                    ; preds = %1081
  %1094 = icmp ugt i8* %1091, %.01
  br i1 %1094, label %1095, label %1180

; <label>:1095                                    ; preds = %1093, %1079
  %t.3 = phi i8* [ %1091, %1093 ], [ %1067, %1079 ]
  br label %1096

; <label>:1096                                    ; preds = %1610, %1095, %1057, %878
  %t.4 = phi i8* [ %1607, %1610 ], [ %864, %878 ], [ %893, %1057 ], [ %t.3, %1095 ]
  %ml_anch.3 = phi i32 [ %ml_anch.8, %1610 ], [ %ml_anch.2, %878 ], [ %ml_anch.1, %1057 ], [ %ml_anch.1, %1095 ]
  %check.3 = phi %struct.sv* [ %check.9, %1610 ], [ %check.2, %878 ], [ %check.1, %1057 ], [ %check.1, %1095 ]
  %s.9 = phi i8* [ %1607, %1610 ], [ %s.5, %878 ], [ %s.4, %1057 ], [ %s.4, %1095 ]
  %end_shift.5 = phi i32 [ %end_shift.10, %1610 ], [ %end_shift.4, %878 ], [ %end_shift.3, %1057 ], [ %end_shift.3, %1095 ]
  %start_shift.3 = phi i32 [ %start_shift.8, %1610 ], [ %start_shift.2, %878 ], [ %start_shift.1, %1057 ], [ %start_shift.1, %1095 ]
  %other_last.3 = phi i8* [ %other_last.8, %1610 ], [ %875, %878 ], [ %s.8, %1057 ], [ %other_last.0, %1095 ]
  %check_at.1 = phi i8* [ %check_at.6, %1610 ], [ %check_at.0, %878 ], [ %s.4, %1057 ], [ %s.4, %1095 ]
  %.2 = phi i8* [ %.7, %1610 ], [ %.1, %878 ], [ %.01, %1057 ], [ %.01, %1095 ]
  %1097 = icmp ne i32 %ml_anch.3, 0
  br i1 %1097, label %1098, label %1154

; <label>:1098                                    ; preds = %1096
  %1099 = getelementptr inbounds i8* %t.4, i64 -1
  %1100 = load i8* %1099, align 1
  %1101 = sext i8 %1100 to i32
  %1102 = icmp ne i32 %1101, 10
  br i1 %1102, label %1103, label %1154

; <label>:1103                                    ; preds = %1098
  br label %1104

; <label>:1104                                    ; preds = %1202, %1103
  %t.5 = phi i8* [ %t.4, %1103 ], [ %.5, %1202 ]
  %ml_anch.4 = phi i32 [ %ml_anch.3, %1103 ], [ %ml_anch.6, %1202 ]
  %check.4 = phi %struct.sv* [ %check.3, %1103 ], [ %check.6, %1202 ]
  %s.10 = phi i8* [ %s.9, %1103 ], [ %s.12, %1202 ]
  %end_shift.6 = phi i32 [ %end_shift.5, %1103 ], [ %end_shift.8, %1202 ]
  %start_shift.4 = phi i32 [ %start_shift.3, %1103 ], [ %start_shift.6, %1202 ]
  %other_last.4 = phi i8* [ %other_last.3, %1103 ], [ %other_last.6, %1202 ]
  %check_at.2 = phi i8* [ %check_at.1, %1103 ], [ %check_at.4, %1202 ]
  %.3 = phi i8* [ %.2, %1103 ], [ %.5, %1202 ]
  br label %1105

; <label>:1105                                    ; preds = %1151, %1104
  %t.6 = phi i8* [ %t.5, %1104 ], [ %1152, %1151 ]
  %1106 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 10
  %1107 = load i32* %1106, align 4
  %1108 = sext i32 %1107 to i64
  %1109 = sub i64 0, %1108
  %1110 = getelementptr inbounds i8* %strend, i64 %1109
  %1111 = icmp ult i8* %t.6, %1110
  br i1 %1111, label %1112, label %1153

; <label>:1112                                    ; preds = %1105
  %1113 = load i8* %t.6, align 1
  %1114 = sext i8 %1113 to i32
  %1115 = icmp eq i32 %1114, 10
  br i1 %1115, label %1116, label %1151

; <label>:1116                                    ; preds = %1112
  %1117 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %1118 = load %struct.reg_substr_data** %1117, align 8
  %1119 = getelementptr inbounds %struct.reg_substr_data* %1118, i32 0, i32 0
  %1120 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1119, i32 0, i64 2
  %1121 = getelementptr inbounds %struct.reg_substr_datum* %1120, i32 0, i32 0
  %1122 = load i32* %1121, align 4
  %1123 = sext i32 %1122 to i64
  %1124 = sub i64 0, %1123
  %1125 = getelementptr inbounds i8* %check_at.2, i64 %1124
  %1126 = icmp ult i8* %t.6, %1125
  br i1 %1126, label %1127, label %1149

; <label>:1127                                    ; preds = %1116
  %1128 = icmp ne i32 %8, 0
  br i1 %1128, label %1129, label %1137

; <label>:1129                                    ; preds = %1127
  %1130 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %1131 = load %struct.reg_substr_data** %1130, align 8
  %1132 = getelementptr inbounds %struct.reg_substr_data* %1131, i32 0, i32 0
  %1133 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1132, i32 0, i64 0
  %1134 = getelementptr inbounds %struct.reg_substr_datum* %1133, i32 0, i32 3
  %1135 = load %struct.sv** %1134, align 8
  %1136 = icmp ne %struct.sv* %1135, null
  br i1 %1136, label %1145, label %1147

; <label>:1137                                    ; preds = %1127
  %1138 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %1139 = load %struct.reg_substr_data** %1138, align 8
  %1140 = getelementptr inbounds %struct.reg_substr_data* %1139, i32 0, i32 0
  %1141 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1140, i32 0, i64 0
  %1142 = getelementptr inbounds %struct.reg_substr_datum* %1141, i32 0, i32 2
  %1143 = load %struct.sv** %1142, align 8
  %1144 = icmp ne %struct.sv* %1143, null
  br i1 %1144, label %1145, label %1147

; <label>:1145                                    ; preds = %1137, %1129
  %1146 = getelementptr inbounds i8* %t.6, i64 1
  br label %585

; <label>:1147                                    ; preds = %1137, %1129
  %1148 = getelementptr inbounds i8* %t.6, i64 1
  br label %1156

; <label>:1149                                    ; preds = %1116
  %1150 = getelementptr inbounds i8* %t.6, i64 1
  br label %398

; <label>:1151                                    ; preds = %1112
  %1152 = getelementptr inbounds i8* %t.6, i32 1
  br label %1105

; <label>:1153                                    ; preds = %1105
  br label %1642

; <label>:1154                                    ; preds = %1098, %1096
  br label %1155

; <label>:1155                                    ; preds = %1154
  br label %1156

; <label>:1156                                    ; preds = %1155, %1147
  %ml_anch.5 = phi i32 [ %ml_anch.4, %1147 ], [ %ml_anch.3, %1155 ]
  %check.5 = phi %struct.sv* [ %check.4, %1147 ], [ %check.3, %1155 ]
  %s.11 = phi i8* [ %1148, %1147 ], [ %t.4, %1155 ]
  %end_shift.7 = phi i32 [ %end_shift.6, %1147 ], [ %end_shift.5, %1155 ]
  %start_shift.5 = phi i32 [ %start_shift.4, %1147 ], [ %start_shift.3, %1155 ]
  %other_last.5 = phi i8* [ %other_last.4, %1147 ], [ %other_last.3, %1155 ]
  %check_at.3 = phi i8* [ %check_at.2, %1147 ], [ %check_at.1, %1155 ]
  %.4 = phi i8* [ %.3, %1147 ], [ %.2, %1155 ]
  %1157 = icmp ne i32 %8, 0
  br i1 %1157, label %1158, label %1165

; <label>:1158                                    ; preds = %1156
  %1159 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %1160 = load %struct.reg_substr_data** %1159, align 8
  %1161 = getelementptr inbounds %struct.reg_substr_data* %1160, i32 0, i32 0
  %1162 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1161, i32 0, i64 2
  %1163 = getelementptr inbounds %struct.reg_substr_datum* %1162, i32 0, i32 3
  %1164 = load %struct.sv** %1163, align 8
  br label %1172

; <label>:1165                                    ; preds = %1156
  %1166 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %1167 = load %struct.reg_substr_data** %1166, align 8
  %1168 = getelementptr inbounds %struct.reg_substr_data* %1167, i32 0, i32 0
  %1169 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1168, i32 0, i64 2
  %1170 = getelementptr inbounds %struct.reg_substr_datum* %1169, i32 0, i32 2
  %1171 = load %struct.sv** %1170, align 8
  br label %1172

; <label>:1172                                    ; preds = %1165, %1158
  %1173 = phi %struct.sv* [ %1164, %1158 ], [ %1171, %1165 ]
  %1174 = getelementptr inbounds %struct.sv* %1173, i32 0, i32 0
  %1175 = load i8** %1174, align 8
  %1176 = bitcast i8* %1175 to %struct.xpvbm*
  %1177 = getelementptr inbounds %struct.xpvbm* %1176, i32 0, i32 7
  %1178 = load i32* %1177, align 4
  %1179 = add nsw i32 %1178, 1
  store i32 %1179, i32* %1177, align 4
  br label %1362

; <label>:1180                                    ; preds = %1093, %1081, %1058
  br label %1181

; <label>:1181                                    ; preds = %1180, %1056, %877
  %ml_anch.6 = phi i32 [ %ml_anch.2, %877 ], [ %ml_anch.1, %1056 ], [ %ml_anch.1, %1180 ]
  %check.6 = phi %struct.sv* [ %check.2, %877 ], [ %check.1, %1056 ], [ %check.1, %1180 ]
  %s.12 = phi i8* [ %s.5, %877 ], [ %s.4, %1056 ], [ %s.4, %1180 ]
  %end_shift.8 = phi i32 [ %end_shift.4, %877 ], [ %end_shift.3, %1056 ], [ %end_shift.3, %1180 ]
  %start_shift.6 = phi i32 [ %start_shift.2, %877 ], [ %start_shift.1, %1056 ], [ %start_shift.1, %1180 ]
  %other_last.6 = phi i8* [ %875, %877 ], [ %s.8, %1056 ], [ %other_last.0, %1180 ]
  %check_at.4 = phi i8* [ %check_at.0, %877 ], [ %s.4, %1056 ], [ %s.4, %1180 ]
  %.5 = phi i8* [ %.1, %877 ], [ %.01, %1056 ], [ %.01, %1180 ]
  %1182 = icmp ne i32 %ml_anch.6, 0
  br i1 %1182, label %1183, label %1203

; <label>:1183                                    ; preds = %1181
  %1184 = icmp ne %struct.sv* %sv, null
  br i1 %1184, label %1185, label %1203

; <label>:1185                                    ; preds = %1183
  %1186 = getelementptr inbounds %struct.sv* %sv, i32 0, i32 2
  %1187 = load i32* %1186, align 4
  %1188 = and i32 %1187, 524288
  %1189 = icmp ne i32 %1188, 0
  br i1 %1189, label %1203, label %1190

; <label>:1190                                    ; preds = %1185
  %1191 = icmp ne i8* %.5, %53
  br i1 %1191, label %1192, label %1203

; <label>:1192                                    ; preds = %1190
  %1193 = getelementptr inbounds i8* %.5, i64 -1
  %1194 = load i8* %1193, align 1
  %1195 = sext i8 %1194 to i32
  %1196 = icmp ne i32 %1195, 10
  br i1 %1196, label %1197, label %1203

; <label>:1197                                    ; preds = %1192
  %1198 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 15
  %1199 = load i32* %1198, align 4
  %1200 = and i32 %1199, 32
  %1201 = icmp ne i32 %1200, 0
  br i1 %1201, label %1203, label %1202

; <label>:1202                                    ; preds = %1197
  br label %1104

; <label>:1203                                    ; preds = %1197, %1192, %1190, %1185, %1183, %1181
  br label %1204

; <label>:1204                                    ; preds = %1203, %286
  %ml_anch.7 = phi i32 [ %ml_anch.6, %1203 ], [ %132, %286 ]
  %check.7 = phi %struct.sv* [ %check.6, %1203 ], [ %check.0, %286 ]
  %end_shift.9 = phi i32 [ %end_shift.8, %1203 ], [ 0, %286 ]
  %start_shift.7 = phi i32 [ %start_shift.6, %1203 ], [ 0, %286 ]
  %other_last.7 = phi i8* [ %other_last.6, %1203 ], [ null, %286 ]
  %check_at.5 = phi i8* [ %check_at.4, %1203 ], [ null, %286 ]
  %.6 = phi i8* [ %.5, %1203 ], [ %strpos, %286 ]
  %1205 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 15
  %1206 = load i32* %1205, align 4
  %1207 = and i32 %1206, 131072
  %1208 = icmp ne i32 %1207, 0
  br i1 %1208, label %1360, label %1209

; <label>:1209                                    ; preds = %1204
  %1210 = icmp ne i32 %8, 0
  br i1 %1210, label %1211, label %1247

; <label>:1211                                    ; preds = %1209
  %1212 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %1213 = load %struct.reg_substr_data** %1212, align 8
  %1214 = getelementptr inbounds %struct.reg_substr_data* %1213, i32 0, i32 0
  %1215 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1214, i32 0, i64 2
  %1216 = getelementptr inbounds %struct.reg_substr_datum* %1215, i32 0, i32 3
  %1217 = load %struct.sv** %1216, align 8
  %1218 = icmp ne %struct.sv* %1217, null
  br i1 %1218, label %1219, label %1360

; <label>:1219                                    ; preds = %1211
  %1220 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %1221 = load %struct.reg_substr_data** %1220, align 8
  %1222 = getelementptr inbounds %struct.reg_substr_data* %1221, i32 0, i32 0
  %1223 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1222, i32 0, i64 2
  %1224 = getelementptr inbounds %struct.reg_substr_datum* %1223, i32 0, i32 3
  %1225 = load %struct.sv** %1224, align 8
  %1226 = getelementptr inbounds %struct.sv* %1225, i32 0, i32 0
  %1227 = load i8** %1226, align 8
  %1228 = bitcast i8* %1227 to %struct.xpvbm*
  %1229 = getelementptr inbounds %struct.xpvbm* %1228, i32 0, i32 7
  %1230 = load i32* %1229, align 4
  %1231 = add nsw i32 %1230, -1
  store i32 %1231, i32* %1229, align 4
  %1232 = icmp slt i32 %1231, 0
  br i1 %1232, label %1233, label %1360

; <label>:1233                                    ; preds = %1219
  %1234 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %1235 = load %struct.reg_substr_data** %1234, align 8
  %1236 = getelementptr inbounds %struct.reg_substr_data* %1235, i32 0, i32 0
  %1237 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1236, i32 0, i64 2
  %1238 = getelementptr inbounds %struct.reg_substr_datum* %1237, i32 0, i32 3
  %1239 = load %struct.sv** %1238, align 8
  %1240 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %1241 = load %struct.reg_substr_data** %1240, align 8
  %1242 = getelementptr inbounds %struct.reg_substr_data* %1241, i32 0, i32 0
  %1243 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1242, i32 0, i64 1
  %1244 = getelementptr inbounds %struct.reg_substr_datum* %1243, i32 0, i32 3
  %1245 = load %struct.sv** %1244, align 8
  %1246 = icmp eq %struct.sv* %1239, %1245
  br i1 %1246, label %1283, label %1360

; <label>:1247                                    ; preds = %1209
  %1248 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %1249 = load %struct.reg_substr_data** %1248, align 8
  %1250 = getelementptr inbounds %struct.reg_substr_data* %1249, i32 0, i32 0
  %1251 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1250, i32 0, i64 2
  %1252 = getelementptr inbounds %struct.reg_substr_datum* %1251, i32 0, i32 2
  %1253 = load %struct.sv** %1252, align 8
  %1254 = icmp ne %struct.sv* %1253, null
  br i1 %1254, label %1255, label %1360

; <label>:1255                                    ; preds = %1247
  %1256 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %1257 = load %struct.reg_substr_data** %1256, align 8
  %1258 = getelementptr inbounds %struct.reg_substr_data* %1257, i32 0, i32 0
  %1259 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1258, i32 0, i64 2
  %1260 = getelementptr inbounds %struct.reg_substr_datum* %1259, i32 0, i32 2
  %1261 = load %struct.sv** %1260, align 8
  %1262 = getelementptr inbounds %struct.sv* %1261, i32 0, i32 0
  %1263 = load i8** %1262, align 8
  %1264 = bitcast i8* %1263 to %struct.xpvbm*
  %1265 = getelementptr inbounds %struct.xpvbm* %1264, i32 0, i32 7
  %1266 = load i32* %1265, align 4
  %1267 = add nsw i32 %1266, -1
  store i32 %1267, i32* %1265, align 4
  %1268 = icmp slt i32 %1267, 0
  br i1 %1268, label %1269, label %1360

; <label>:1269                                    ; preds = %1255
  %1270 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %1271 = load %struct.reg_substr_data** %1270, align 8
  %1272 = getelementptr inbounds %struct.reg_substr_data* %1271, i32 0, i32 0
  %1273 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1272, i32 0, i64 2
  %1274 = getelementptr inbounds %struct.reg_substr_datum* %1273, i32 0, i32 2
  %1275 = load %struct.sv** %1274, align 8
  %1276 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %1277 = load %struct.reg_substr_data** %1276, align 8
  %1278 = getelementptr inbounds %struct.reg_substr_data* %1277, i32 0, i32 0
  %1279 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1278, i32 0, i64 1
  %1280 = getelementptr inbounds %struct.reg_substr_datum* %1279, i32 0, i32 2
  %1281 = load %struct.sv** %1280, align 8
  %1282 = icmp eq %struct.sv* %1275, %1281
  br i1 %1282, label %1283, label %1360

; <label>:1283                                    ; preds = %1269, %1233
  %1284 = icmp ne i32 %8, 0
  br i1 %1284, label %1285, label %1292

; <label>:1285                                    ; preds = %1283
  %1286 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %1287 = load %struct.reg_substr_data** %1286, align 8
  %1288 = getelementptr inbounds %struct.reg_substr_data* %1287, i32 0, i32 0
  %1289 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1288, i32 0, i64 2
  %1290 = getelementptr inbounds %struct.reg_substr_datum* %1289, i32 0, i32 3
  %1291 = load %struct.sv** %1290, align 8
  br label %1299

; <label>:1292                                    ; preds = %1283
  %1293 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %1294 = load %struct.reg_substr_data** %1293, align 8
  %1295 = getelementptr inbounds %struct.reg_substr_data* %1294, i32 0, i32 0
  %1296 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1295, i32 0, i64 2
  %1297 = getelementptr inbounds %struct.reg_substr_datum* %1296, i32 0, i32 2
  %1298 = load %struct.sv** %1297, align 8
  br label %1299

; <label>:1299                                    ; preds = %1292, %1285
  %1300 = phi %struct.sv* [ %1291, %1285 ], [ %1298, %1292 ]
  call void @Perl_sv_free(%struct.sv* %1300)
  %1301 = icmp ne i32 %8, 0
  br i1 %1301, label %1302, label %1310

; <label>:1302                                    ; preds = %1299
  %1303 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %1304 = load %struct.reg_substr_data** %1303, align 8
  %1305 = getelementptr inbounds %struct.reg_substr_data* %1304, i32 0, i32 0
  %1306 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1305, i32 0, i64 2
  %1307 = getelementptr inbounds %struct.reg_substr_datum* %1306, i32 0, i32 2
  %1308 = load %struct.sv** %1307, align 8
  %1309 = icmp ne %struct.sv* %1308, null
  br i1 %1309, label %1318, label %1336

; <label>:1310                                    ; preds = %1299
  %1311 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %1312 = load %struct.reg_substr_data** %1311, align 8
  %1313 = getelementptr inbounds %struct.reg_substr_data* %1312, i32 0, i32 0
  %1314 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1313, i32 0, i64 2
  %1315 = getelementptr inbounds %struct.reg_substr_datum* %1314, i32 0, i32 3
  %1316 = load %struct.sv** %1315, align 8
  %1317 = icmp ne %struct.sv* %1316, null
  br i1 %1317, label %1318, label %1336

; <label>:1318                                    ; preds = %1310, %1302
  %1319 = icmp ne i32 %8, 0
  br i1 %1319, label %1320, label %1327

; <label>:1320                                    ; preds = %1318
  %1321 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %1322 = load %struct.reg_substr_data** %1321, align 8
  %1323 = getelementptr inbounds %struct.reg_substr_data* %1322, i32 0, i32 0
  %1324 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1323, i32 0, i64 2
  %1325 = getelementptr inbounds %struct.reg_substr_datum* %1324, i32 0, i32 2
  %1326 = load %struct.sv** %1325, align 8
  br label %1334

; <label>:1327                                    ; preds = %1318
  %1328 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %1329 = load %struct.reg_substr_data** %1328, align 8
  %1330 = getelementptr inbounds %struct.reg_substr_data* %1329, i32 0, i32 0
  %1331 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1330, i32 0, i64 2
  %1332 = getelementptr inbounds %struct.reg_substr_datum* %1331, i32 0, i32 3
  %1333 = load %struct.sv** %1332, align 8
  br label %1334

; <label>:1334                                    ; preds = %1327, %1320
  %1335 = phi %struct.sv* [ %1326, %1320 ], [ %1333, %1327 ]
  call void @Perl_sv_free(%struct.sv* %1335)
  br label %1336

; <label>:1336                                    ; preds = %1334, %1310, %1302
  %1337 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %1338 = load %struct.reg_substr_data** %1337, align 8
  %1339 = getelementptr inbounds %struct.reg_substr_data* %1338, i32 0, i32 0
  %1340 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1339, i32 0, i64 2
  %1341 = getelementptr inbounds %struct.reg_substr_datum* %1340, i32 0, i32 3
  store %struct.sv* null, %struct.sv** %1341, align 8
  %1342 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %1343 = load %struct.reg_substr_data** %1342, align 8
  %1344 = getelementptr inbounds %struct.reg_substr_data* %1343, i32 0, i32 0
  %1345 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1344, i32 0, i64 2
  %1346 = getelementptr inbounds %struct.reg_substr_datum* %1345, i32 0, i32 2
  store %struct.sv* null, %struct.sv** %1346, align 8
  %1347 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %1348 = load %struct.reg_substr_data** %1347, align 8
  %1349 = getelementptr inbounds %struct.reg_substr_data* %1348, i32 0, i32 0
  %1350 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1349, i32 0, i64 1
  %1351 = getelementptr inbounds %struct.reg_substr_datum* %1350, i32 0, i32 3
  store %struct.sv* null, %struct.sv** %1351, align 8
  %1352 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %1353 = load %struct.reg_substr_data** %1352, align 8
  %1354 = getelementptr inbounds %struct.reg_substr_data* %1353, i32 0, i32 0
  %1355 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1354, i32 0, i64 1
  %1356 = getelementptr inbounds %struct.reg_substr_datum* %1355, i32 0, i32 2
  store %struct.sv* null, %struct.sv** %1356, align 8
  %1357 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 15
  %1358 = load i32* %1357, align 4
  %1359 = and i32 %1358, -3145729
  store i32 %1359, i32* %1357, align 4
  br label %1361

; <label>:1360                                    ; preds = %1269, %1255, %1247, %1233, %1219, %1211, %1204
  br label %1361

; <label>:1361                                    ; preds = %1360, %1336
  %check.8 = phi %struct.sv* [ %check.7, %1360 ], [ null, %1336 ]
  br label %1362

; <label>:1362                                    ; preds = %1361, %1172
  %ml_anch.8 = phi i32 [ %ml_anch.7, %1361 ], [ %ml_anch.5, %1172 ]
  %check.9 = phi %struct.sv* [ %check.8, %1361 ], [ %check.5, %1172 ]
  %s.14 = phi i8* [ %.6, %1361 ], [ %s.11, %1172 ]
  %end_shift.10 = phi i32 [ %end_shift.9, %1361 ], [ %end_shift.7, %1172 ]
  %start_shift.8 = phi i32 [ %start_shift.7, %1361 ], [ %start_shift.5, %1172 ]
  %other_last.8 = phi i8* [ %other_last.7, %1361 ], [ %other_last.5, %1172 ]
  %check_at.6 = phi i8* [ %check_at.5, %1361 ], [ %check_at.3, %1172 ]
  %.7 = phi i8* [ %.6, %1361 ], [ %.4, %1172 ]
  %1363 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 2
  %1364 = load %struct.regnode** %1363, align 8
  %1365 = icmp ne %struct.regnode* %1364, null
  br i1 %1365, label %1366, label %1640

; <label>:1366                                    ; preds = %1362
  %1367 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 2
  %1368 = load %struct.regnode** %1367, align 8
  %1369 = bitcast %struct.regnode* %1368 to %struct.regnode_string*
  %1370 = getelementptr inbounds %struct.regnode_string* %1369, i32 0, i32 3
  %1371 = getelementptr inbounds [1 x i8]* %1370, i32 0, i32 0
  %1372 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 2
  %1373 = load %struct.regnode** %1372, align 8
  %1374 = getelementptr inbounds %struct.regnode* %1373, i32 0, i32 1
  %1375 = load i8* %1374, align 1
  %1376 = zext i8 %1375 to i64
  %1377 = getelementptr inbounds [0 x i8]* @PL_regkind, i32 0, i64 %1376
  %1378 = load i8* %1377, align 1
  %1379 = zext i8 %1378 to i32
  %1380 = icmp eq i32 %1379, 33
  br i1 %1380, label %1381, label %1409

; <label>:1381                                    ; preds = %1366
  %1382 = load i8* @PL_reg_match_utf8, align 1
  %1383 = sext i8 %1382 to i32
  %1384 = icmp ne i32 %1383, 0
  br i1 %1384, label %1385, label %1395

; <label>:1385                                    ; preds = %1381
  %1386 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 2
  %1387 = load %struct.regnode** %1386, align 8
  %1388 = bitcast %struct.regnode* %1387 to %struct.regnode_string*
  %1389 = getelementptr inbounds %struct.regnode_string* %1388, i32 0, i32 0
  %1390 = load i8* %1389, align 1
  %1391 = zext i8 %1390 to i32
  %1392 = sext i32 %1391 to i64
  %1393 = getelementptr inbounds i8* %1371, i64 %1392
  %1394 = call i64 @Perl_utf8_distance(i8* %1393, i8* %1371)
  br label %1407

; <label>:1395                                    ; preds = %1381
  %1396 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 2
  %1397 = load %struct.regnode** %1396, align 8
  %1398 = bitcast %struct.regnode* %1397 to %struct.regnode_string*
  %1399 = getelementptr inbounds %struct.regnode_string* %1398, i32 0, i32 0
  %1400 = load i8* %1399, align 1
  %1401 = zext i8 %1400 to i32
  %1402 = sext i32 %1401 to i64
  %1403 = getelementptr inbounds i8* %1371, i64 %1402
  %1404 = ptrtoint i8* %1403 to i64
  %1405 = ptrtoint i8* %1371 to i64
  %1406 = sub i64 %1404, %1405
  br label %1407

; <label>:1407                                    ; preds = %1395, %1385
  %1408 = phi i64 [ %1394, %1385 ], [ %1406, %1395 ]
  br label %1410

; <label>:1409                                    ; preds = %1366
  br label %1410

; <label>:1410                                    ; preds = %1409, %1407
  %1411 = phi i64 [ %1408, %1407 ], [ 1, %1409 ]
  %1412 = trunc i64 %1411 to i32
  %1413 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %1414 = load %struct.reg_substr_data** %1413, align 8
  %1415 = getelementptr inbounds %struct.reg_substr_data* %1414, i32 0, i32 0
  %1416 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1415, i32 0, i64 0
  %1417 = getelementptr inbounds %struct.reg_substr_datum* %1416, i32 0, i32 2
  %1418 = load %struct.sv** %1417, align 8
  %1419 = icmp ne %struct.sv* %1418, null
  br i1 %1419, label %1430, label %1420

; <label>:1420                                    ; preds = %1410
  %1421 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %1422 = load %struct.reg_substr_data** %1421, align 8
  %1423 = getelementptr inbounds %struct.reg_substr_data* %1422, i32 0, i32 0
  %1424 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1423, i32 0, i64 0
  %1425 = getelementptr inbounds %struct.reg_substr_datum* %1424, i32 0, i32 3
  %1426 = load %struct.sv** %1425, align 8
  %1427 = icmp ne %struct.sv* %1426, null
  br i1 %1427, label %1430, label %1428

; <label>:1428                                    ; preds = %1420
  %1429 = icmp ne i32 %ml_anch.8, 0
  br i1 %1429, label %1430, label %1457

; <label>:1430                                    ; preds = %1428, %1420, %1410
  %1431 = load i8* @PL_reg_match_utf8, align 1
  %1432 = sext i8 %1431 to i32
  %1433 = icmp ne i32 %1432, 0
  br i1 %1433, label %1434, label %1445

; <label>:1434                                    ; preds = %1430
  %1435 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 10
  %1436 = load i32* %1435, align 4
  %1437 = icmp ne i32 %1436, 0
  br i1 %1437, label %1438, label %1439

; <label>:1438                                    ; preds = %1434
  br label %1440

; <label>:1439                                    ; preds = %1434
  br label %1440

; <label>:1440                                    ; preds = %1439, %1438
  %1441 = phi i32 [ %1412, %1438 ], [ 0, %1439 ]
  %1442 = call i32 (i8*, i32, i8*, ...)* bitcast (i32 (...)* @reghop3 to i32 (i8*, i32, i8*, ...)*)(i8* %s.14, i32 %1441, i8* %strend)
  %1443 = sext i32 %1442 to i64
  %1444 = inttoptr i64 %1443 to i8*
  br label %1455

; <label>:1445                                    ; preds = %1430
  %1446 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 10
  %1447 = load i32* %1446, align 4
  %1448 = icmp ne i32 %1447, 0
  br i1 %1448, label %1449, label %1450

; <label>:1449                                    ; preds = %1445
  br label %1451

; <label>:1450                                    ; preds = %1445
  br label %1451

; <label>:1451                                    ; preds = %1450, %1449
  %1452 = phi i32 [ %1412, %1449 ], [ 0, %1450 ]
  %1453 = sext i32 %1452 to i64
  %1454 = getelementptr inbounds i8* %s.14, i64 %1453
  br label %1455

; <label>:1455                                    ; preds = %1451, %1440
  %1456 = phi i8* [ %1444, %1440 ], [ %1454, %1451 ]
  br label %1517

; <label>:1457                                    ; preds = %1428
  %1458 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %1459 = load %struct.reg_substr_data** %1458, align 8
  %1460 = getelementptr inbounds %struct.reg_substr_data* %1459, i32 0, i32 0
  %1461 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1460, i32 0, i64 1
  %1462 = getelementptr inbounds %struct.reg_substr_datum* %1461, i32 0, i32 2
  %1463 = load %struct.sv** %1462, align 8
  %1464 = icmp ne %struct.sv* %1463, null
  br i1 %1464, label %1473, label %1465

; <label>:1465                                    ; preds = %1457
  %1466 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %1467 = load %struct.reg_substr_data** %1466, align 8
  %1468 = getelementptr inbounds %struct.reg_substr_data* %1467, i32 0, i32 0
  %1469 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1468, i32 0, i64 1
  %1470 = getelementptr inbounds %struct.reg_substr_datum* %1469, i32 0, i32 3
  %1471 = load %struct.sv** %1470, align 8
  %1472 = icmp ne %struct.sv* %1471, null
  br i1 %1472, label %1473, label %1514

; <label>:1473                                    ; preds = %1465, %1457
  %1474 = load i8* @PL_reg_match_utf8, align 1
  %1475 = sext i8 %1474 to i32
  %1476 = icmp ne i32 %1475, 0
  br i1 %1476, label %1477, label %1495

; <label>:1477                                    ; preds = %1473
  %1478 = load i8* @PL_reg_match_utf8, align 1
  %1479 = sext i8 %1478 to i32
  %1480 = icmp ne i32 %1479, 0
  br i1 %1480, label %1481, label %1486

; <label>:1481                                    ; preds = %1477
  %1482 = sub nsw i32 0, %start_shift.8
  %1483 = call i32 (i8*, i32, i8*, ...)* bitcast (i32 (...)* @reghop3 to i32 (i8*, i32, i8*, ...)*)(i8* %check_at.6, i32 %1482, i8* %53)
  %1484 = sext i32 %1483 to i64
  %1485 = inttoptr i64 %1484 to i8*
  br label %1490

; <label>:1486                                    ; preds = %1477
  %1487 = sub nsw i32 0, %start_shift.8
  %1488 = sext i32 %1487 to i64
  %1489 = getelementptr inbounds i8* %check_at.6, i64 %1488
  br label %1490

; <label>:1490                                    ; preds = %1486, %1481
  %1491 = phi i8* [ %1485, %1481 ], [ %1489, %1486 ]
  %1492 = call i32 (i8*, i32, i8*, ...)* bitcast (i32 (...)* @reghop3 to i32 (i8*, i32, i8*, ...)*)(i8* %1491, i32 %1412, i8* %strend)
  %1493 = sext i32 %1492 to i64
  %1494 = inttoptr i64 %1493 to i8*
  br label %1512

; <label>:1495                                    ; preds = %1473
  %1496 = load i8* @PL_reg_match_utf8, align 1
  %1497 = sext i8 %1496 to i32
  %1498 = icmp ne i32 %1497, 0
  br i1 %1498, label %1499, label %1504

; <label>:1499                                    ; preds = %1495
  %1500 = sub nsw i32 0, %start_shift.8
  %1501 = call i32 (i8*, i32, i8*, ...)* bitcast (i32 (...)* @reghop3 to i32 (i8*, i32, i8*, ...)*)(i8* %check_at.6, i32 %1500, i8* %53)
  %1502 = sext i32 %1501 to i64
  %1503 = inttoptr i64 %1502 to i8*
  br label %1508

; <label>:1504                                    ; preds = %1495
  %1505 = sub nsw i32 0, %start_shift.8
  %1506 = sext i32 %1505 to i64
  %1507 = getelementptr inbounds i8* %check_at.6, i64 %1506
  br label %1508

; <label>:1508                                    ; preds = %1504, %1499
  %1509 = phi i8* [ %1503, %1499 ], [ %1507, %1504 ]
  %1510 = sext i32 %1412 to i64
  %1511 = getelementptr inbounds i8* %1509, i64 %1510
  br label %1512

; <label>:1512                                    ; preds = %1508, %1490
  %1513 = phi i8* [ %1494, %1490 ], [ %1511, %1508 ]
  br label %1515

; <label>:1514                                    ; preds = %1465
  br label %1515

; <label>:1515                                    ; preds = %1514, %1512
  %1516 = phi i8* [ %1513, %1512 ], [ %strend, %1514 ]
  br label %1517

; <label>:1517                                    ; preds = %1515, %1455
  %1518 = phi i8* [ %1456, %1455 ], [ %1516, %1515 ]
  %1519 = call i32 (%struct.regexp*, ...)* bitcast (i32 (...)* @cache_re to i32 (%struct.regexp*, ...)*)(%struct.regexp* %prog)
  %1520 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 2
  %1521 = load %struct.regnode** %1520, align 8
  %1522 = call i32 (%struct.regexp*, %struct.regnode*, i8*, i8*, i8*, i32, ...)* bitcast (i32 (...)* @find_byclass to i32 (%struct.regexp*, %struct.regnode*, i8*, i8*, i8*, i32, ...)*)(%struct.regexp* %prog, %struct.regnode* %1521, i8* %s.14, i8* %1518, i8* %53, i32 1)
  %1523 = sext i32 %1522 to i64
  %1524 = inttoptr i64 %1523 to i8*
  %1525 = icmp ne i8* %1524, null
  br i1 %1525, label %1635, label %1526

; <label>:1526                                    ; preds = %1517
  %1527 = icmp eq i8* %1518, %strend
  br i1 %1527, label %1528, label %1529

; <label>:1528                                    ; preds = %1526
  br label %1683

; <label>:1529                                    ; preds = %1526
  %1530 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 15
  %1531 = load i32* %1530, align 4
  %1532 = and i32 %1531, 15
  %1533 = icmp ne i32 %1532, 0
  br i1 %1533, label %1534, label %1537

; <label>:1534                                    ; preds = %1529
  %1535 = icmp ne i32 %ml_anch.8, 0
  br i1 %1535, label %1537, label %1536

; <label>:1536                                    ; preds = %1534
  br label %1683

; <label>:1537                                    ; preds = %1534, %1529
  %1538 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %1539 = load %struct.reg_substr_data** %1538, align 8
  %1540 = getelementptr inbounds %struct.reg_substr_data* %1539, i32 0, i32 0
  %1541 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1540, i32 0, i64 0
  %1542 = getelementptr inbounds %struct.reg_substr_datum* %1541, i32 0, i32 2
  %1543 = load %struct.sv** %1542, align 8
  %1544 = icmp ne %struct.sv* %1543, null
  br i1 %1544, label %1553, label %1545

; <label>:1545                                    ; preds = %1537
  %1546 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %1547 = load %struct.reg_substr_data** %1546, align 8
  %1548 = getelementptr inbounds %struct.reg_substr_data* %1547, i32 0, i32 0
  %1549 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1548, i32 0, i64 0
  %1550 = getelementptr inbounds %struct.reg_substr_datum* %1549, i32 0, i32 3
  %1551 = load %struct.sv** %1550, align 8
  %1552 = icmp ne %struct.sv* %1551, null
  br i1 %1552, label %1553, label %1604

; <label>:1553                                    ; preds = %1545, %1537
  %1554 = icmp ne i32 %8, 0
  br i1 %1554, label %1555, label %1562

; <label>:1555                                    ; preds = %1553
  %1556 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %1557 = load %struct.reg_substr_data** %1556, align 8
  %1558 = getelementptr inbounds %struct.reg_substr_data* %1557, i32 0, i32 0
  %1559 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1558, i32 0, i64 0
  %1560 = getelementptr inbounds %struct.reg_substr_datum* %1559, i32 0, i32 3
  %1561 = load %struct.sv** %1560, align 8
  br label %1569

; <label>:1562                                    ; preds = %1553
  %1563 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %1564 = load %struct.reg_substr_data** %1563, align 8
  %1565 = getelementptr inbounds %struct.reg_substr_data* %1564, i32 0, i32 0
  %1566 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1565, i32 0, i64 0
  %1567 = getelementptr inbounds %struct.reg_substr_datum* %1566, i32 0, i32 2
  %1568 = load %struct.sv** %1567, align 8
  br label %1569

; <label>:1569                                    ; preds = %1562, %1555
  %1570 = phi %struct.sv* [ %1561, %1555 ], [ %1568, %1562 ]
  %1571 = icmp eq %struct.sv* %1570, %check.9
  br i1 %1571, label %1572, label %1595

; <label>:1572                                    ; preds = %1569
  br label %1573

; <label>:1573                                    ; preds = %1631, %1572
  %t.7 = phi i8* [ %s.14, %1572 ], [ %1634, %1631 ]
  %1574 = load i8* @PL_reg_match_utf8, align 1
  %1575 = sext i8 %1574 to i32
  %1576 = icmp ne i32 %1575, 0
  br i1 %1576, label %1577, label %1581

; <label>:1577                                    ; preds = %1573
  %1578 = call i32 (i8*, i32, i8*, ...)* bitcast (i32 (...)* @reghop3 to i32 (i8*, i32, i8*, ...)*)(i8* %t.7, i32 1, i8* %strend)
  %1579 = sext i32 %1578 to i64
  %1580 = inttoptr i64 %1579 to i8*
  br label %1583

; <label>:1581                                    ; preds = %1573
  %1582 = getelementptr inbounds i8* %t.7, i64 1
  br label %1583

; <label>:1583                                    ; preds = %1581, %1577
  %1584 = phi i8* [ %1580, %1577 ], [ %1582, %1581 ]
  %1585 = sext i32 %start_shift.8 to i64
  %1586 = getelementptr inbounds i8* %1584, i64 %1585
  %1587 = sext i32 %end_shift.10 to i64
  %1588 = getelementptr inbounds i8* %1586, i64 %1587
  %1589 = icmp ugt i8* %1588, %strend
  br i1 %1589, label %1590, label %1591

; <label>:1590                                    ; preds = %1583
  br label %1683

; <label>:1591                                    ; preds = %1583
  %1592 = icmp ne %struct.sv* %check.9, null
  br i1 %1592, label %1594, label %1593

; <label>:1593                                    ; preds = %1591
  br label %1641

; <label>:1594                                    ; preds = %1591
  br label %398

; <label>:1595                                    ; preds = %1569
  %1596 = sext i32 %start_shift.8 to i64
  %1597 = getelementptr inbounds i8* %s.14, i64 %1596
  %1598 = icmp uge i8* %1597, %check_at.6
  br i1 %1598, label %1599, label %1600

; <label>:1599                                    ; preds = %1595
  br label %1631

; <label>:1600                                    ; preds = %1595
  %1601 = icmp ne %struct.sv* %check.9, null
  br i1 %1601, label %1603, label %1602

; <label>:1602                                    ; preds = %1600
  br label %1641

; <label>:1603                                    ; preds = %1600
  br label %585

; <label>:1604                                    ; preds = %1545
  %1605 = icmp ne i32 %ml_anch.8, 0
  br i1 %1605, label %1606, label %1611

; <label>:1606                                    ; preds = %1604
  %1607 = getelementptr inbounds i8* %s.14, i64 1
  %1608 = icmp ne %struct.sv* %check.9, null
  br i1 %1608, label %1610, label %1609

; <label>:1609                                    ; preds = %1606
  br label %1641

; <label>:1610                                    ; preds = %1606
  br label %1096

; <label>:1611                                    ; preds = %1604
  %1612 = icmp ne i32 %8, 0
  br i1 %1612, label %1613, label %1621

; <label>:1613                                    ; preds = %1611
  %1614 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %1615 = load %struct.reg_substr_data** %1614, align 8
  %1616 = getelementptr inbounds %struct.reg_substr_data* %1615, i32 0, i32 0
  %1617 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1616, i32 0, i64 1
  %1618 = getelementptr inbounds %struct.reg_substr_datum* %1617, i32 0, i32 3
  %1619 = load %struct.sv** %1618, align 8
  %1620 = icmp ne %struct.sv* %1619, null
  br i1 %1620, label %1630, label %1629

; <label>:1621                                    ; preds = %1611
  %1622 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %1623 = load %struct.reg_substr_data** %1622, align 8
  %1624 = getelementptr inbounds %struct.reg_substr_data* %1623, i32 0, i32 0
  %1625 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1624, i32 0, i64 1
  %1626 = getelementptr inbounds %struct.reg_substr_datum* %1625, i32 0, i32 2
  %1627 = load %struct.sv** %1626, align 8
  %1628 = icmp ne %struct.sv* %1627, null
  br i1 %1628, label %1630, label %1629

; <label>:1629                                    ; preds = %1621, %1613
  br label %1683

; <label>:1630                                    ; preds = %1621, %1613
  br label %1631

; <label>:1631                                    ; preds = %1630, %1599
  %1632 = sext i32 %start_shift.8 to i64
  %1633 = sub i64 0, %1632
  %1634 = getelementptr inbounds i8* %check_at.6, i64 %1633
  br label %1573

; <label>:1635                                    ; preds = %1517
  %1636 = icmp ne i8* %s.14, %1524
  br i1 %1636, label %1637, label %1638

; <label>:1637                                    ; preds = %1635
  br label %1639

; <label>:1638                                    ; preds = %1635
  br label %1639

; <label>:1639                                    ; preds = %1638, %1637
  br label %1640

; <label>:1640                                    ; preds = %1639, %1362
  %s.15 = phi i8* [ %1524, %1639 ], [ %s.14, %1362 ]
  br label %1641

; <label>:1641                                    ; preds = %1640, %1609, %1602, %1593
  %s.16 = phi i8* [ %s.15, %1640 ], [ %1584, %1593 ], [ %check_at.6, %1602 ], [ %1607, %1609 ]
  br label %1684

; <label>:1642                                    ; preds = %1153, %1041, %799, %527, %454, %254, %227
  %1643 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %1644 = load %struct.reg_substr_data** %1643, align 8
  %1645 = getelementptr inbounds %struct.reg_substr_data* %1644, i32 0, i32 0
  %1646 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1645, i32 0, i64 2
  %1647 = getelementptr inbounds %struct.reg_substr_datum* %1646, i32 0, i32 2
  %1648 = load %struct.sv** %1647, align 8
  %1649 = icmp ne %struct.sv* %1648, null
  br i1 %1649, label %1658, label %1650

; <label>:1650                                    ; preds = %1642
  %1651 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %1652 = load %struct.reg_substr_data** %1651, align 8
  %1653 = getelementptr inbounds %struct.reg_substr_data* %1652, i32 0, i32 0
  %1654 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1653, i32 0, i64 2
  %1655 = getelementptr inbounds %struct.reg_substr_datum* %1654, i32 0, i32 3
  %1656 = load %struct.sv** %1655, align 8
  %1657 = icmp ne %struct.sv* %1656, null
  br i1 %1657, label %1658, label %1682

; <label>:1658                                    ; preds = %1650, %1642
  %1659 = icmp ne i32 %8, 0
  br i1 %1659, label %1660, label %1667

; <label>:1660                                    ; preds = %1658
  %1661 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %1662 = load %struct.reg_substr_data** %1661, align 8
  %1663 = getelementptr inbounds %struct.reg_substr_data* %1662, i32 0, i32 0
  %1664 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1663, i32 0, i64 2
  %1665 = getelementptr inbounds %struct.reg_substr_datum* %1664, i32 0, i32 3
  %1666 = load %struct.sv** %1665, align 8
  br label %1674

; <label>:1667                                    ; preds = %1658
  %1668 = getelementptr inbounds %struct.regexp* %prog, i32 0, i32 3
  %1669 = load %struct.reg_substr_data** %1668, align 8
  %1670 = getelementptr inbounds %struct.reg_substr_data* %1669, i32 0, i32 0
  %1671 = getelementptr inbounds [3 x %struct.reg_substr_datum]* %1670, i32 0, i64 2
  %1672 = getelementptr inbounds %struct.reg_substr_datum* %1671, i32 0, i32 2
  %1673 = load %struct.sv** %1672, align 8
  br label %1674

; <label>:1674                                    ; preds = %1667, %1660
  %1675 = phi %struct.sv* [ %1666, %1660 ], [ %1673, %1667 ]
  %1676 = getelementptr inbounds %struct.sv* %1675, i32 0, i32 0
  %1677 = load i8** %1676, align 8
  %1678 = bitcast i8* %1677 to %struct.xpvbm*
  %1679 = getelementptr inbounds %struct.xpvbm* %1678, i32 0, i32 7
  %1680 = load i32* %1679, align 4
  %1681 = add nsw i32 %1680, 5
  store i32 %1681, i32* %1679, align 4
  br label %1682

; <label>:1682                                    ; preds = %1674, %1650
  br label %1683

; <label>:1683                                    ; preds = %1682, %1629, %1590, %1536, %1528, %148, %107, %35
  br label %1684

; <label>:1684                                    ; preds = %1683, %1641
  %.0 = phi i8* [ null, %1683 ], [ %s.16, %1641 ]
  ret i8* %.0
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
  %1 = load i32* @PL_reg_eval_set, align 4
  %2 = icmp ne i32 %1, 0
  br i1 %2, label %3, label %23

; <label>:3                                       ; preds = %0
  %4 = load i8** @PL_reg_oldsaved, align 8
  %5 = icmp ne i8* %4, null
  br i1 %5, label %6, label %18

; <label>:6                                       ; preds = %3
  %7 = load i8** @PL_reg_oldsaved, align 8
  %8 = load %struct.regexp** @PL_reg_re, align 8
  %9 = getelementptr inbounds %struct.regexp* %8, i32 0, i32 6
  store i8* %7, i8** %9, align 8
  %10 = load i64* @PL_reg_oldsavedlen, align 8
  %11 = trunc i64 %10 to i32
  %12 = load %struct.regexp** @PL_reg_re, align 8
  %13 = getelementptr inbounds %struct.regexp* %12, i32 0, i32 8
  store i32 %11, i32* %13, align 4
  %14 = load %struct.regexp** @PL_reg_re, align 8
  %15 = getelementptr inbounds %struct.regexp* %14, i32 0, i32 15
  %16 = load i32* %15, align 4
  %17 = or i32 %16, 262144
  store i32 %17, i32* %15, align 4
  br label %18

; <label>:18                                      ; preds = %6, %3
  %19 = load i32* @PL_reg_oldpos, align 4
  %20 = load %struct.magic** @PL_reg_magic, align 8
  %21 = getelementptr inbounds %struct.magic* %20, i32 0, i32 7
  store i32 %19, i32* %21, align 4
  store i32 0, i32* @PL_reg_eval_set, align 4
  %22 = load %struct.pmop** @PL_reg_oldcurpm, align 8
  store %struct.pmop* %22, %struct.pmop** @PL_curpm, align 8
  br label %23

; <label>:23                                      ; preds = %18, %0
  ret void
}

declare void @Perl_safesysfree(i8*) #1

declare i8* @Perl_savepvn(i8*, i32) #1

; Function Attrs: nounwind uwtable
define i32 @S_regmatch(%struct.regnode* %prog) #0 {
  %ulen = alloca i64, align 8
  %e2 = alloca i8*, align 8
  %inclasslen = alloca i64, align 8
  %ulen1 = alloca i64, align 8
  %ulen2 = alloca i64, align 8
  %tmpbuf1 = alloca [7 x i8], align 1
  %tmpbuf2 = alloca [7 x i8], align 1
  %state = alloca %struct.re_cc_state, align 8
  %len = alloca i64, align 8
  %pm = alloca %struct.pmop, align 8
  %cc = alloca %struct.curcur, align 8
  %l9 = alloca i32, align 4
  %ulen114 = alloca i64, align 8
  %ulen215 = alloca i64, align 8
  %tmpbuf116 = alloca [7 x i8], align 1
  %tmpbuf217 = alloca [7 x i8], align 1
  %len20 = alloca i64, align 8
  %1 = load i8** @PL_reginput, align 8
  %2 = load i8* @PL_reg_match_utf8, align 1
  %3 = load i8* %1, align 1
  %4 = zext i8 %3 to i32
  br label %5

; <label>:5                                       ; preds = %5024, %0
  %unwind.0 = phi i32 [ 0, %0 ], [ %unwind.3, %5024 ]
  %logical.0 = phi i32 [ 0, %0 ], [ %logical.6, %5024 ]
  %sw.0 = phi i32 [ 0, %0 ], [ %sw.6, %5024 ]
  %minmod.0 = phi i32 [ 0, %0 ], [ %minmod.4, %5024 ]
  %c2.0 = phi i32 [ 0, %0 ], [ %c2.20, %5024 ]
  %c1.0 = phi i32 [ 0, %0 ], [ %c1.15, %5024 ]
  %locinput.0 = phi i8* [ %1, %0 ], [ %locinput.24, %5024 ]
  %ln.0 = phi i32 [ 0, %0 ], [ %ln.18, %5024 ]
  %nextchr.0 = phi i32 [ %4, %0 ], [ %nextchr.9, %5024 ]
  %scan.0 = phi %struct.regnode* [ %prog, %0 ], [ %next.9, %5024 ]
  %6 = icmp ne %struct.regnode* %scan.0, null
  br i1 %6, label %7, label %5025

; <label>:7                                       ; preds = %5
  %8 = getelementptr inbounds %struct.regnode* %scan.0, i32 0, i32 2
  %9 = load i16* %8, align 2
  %10 = zext i16 %9 to i32
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds %struct.regnode* %scan.0, i64 %11
  %13 = icmp eq %struct.regnode* %12, %scan.0
  br i1 %13, label %14, label %15

; <label>:14                                      ; preds = %7
  br label %15

; <label>:15                                      ; preds = %14, %7
  %next.0 = phi %struct.regnode* [ null, %14 ], [ %12, %7 ]
  %16 = getelementptr inbounds %struct.regnode* %scan.0, i32 0, i32 1
  %17 = load i8* %16, align 1
  %18 = zext i8 %17 to i32
  switch i32 %18, label %4971 [
    i32 2, label %19
    i32 3, label %37
    i32 4, label %52
    i32 13, label %57
    i32 6, label %62
    i32 7, label %67
    i32 8, label %77
    i32 5, label %94
    i32 15, label %99
    i32 16, label %125
    i32 14, label %135
    i32 33, label %163
    i32 35, label %331
    i32 34, label %334
    i32 17, label %474
    i32 19, label %620
    i32 18, label %623
    i32 21, label %724
    i32 20, label %727
    i32 10, label %831
    i32 12, label %831
    i32 9, label %834
    i32 11, label %834
    i32 23, label %1047
    i32 22, label %1050
    i32 25, label %1178
    i32 24, label %1181
    i32 27, label %1274
    i32 26, label %1277
    i32 29, label %1361
    i32 28, label %1364
    i32 30, label %1451
    i32 49, label %1501
    i32 47, label %1504
    i32 48, label %1504
    i32 36, label %1642
    i32 37, label %1642
    i32 32, label %1643
    i32 57, label %1644
    i32 45, label %1974
    i32 46, label %1985
    i32 54, label %2016
    i32 53, label %2032
    i32 59, label %2053
    i32 43, label %2057
    i32 44, label %2112
    i32 56, label %2737
    i32 31, label %2748
    i32 58, label %2779
    i32 42, label %2780
    i32 41, label %3519
    i32 40, label %3544
    i32 38, label %3555
    i32 39, label %3557
    i32 0, label %4807
    i32 1, label %4851
    i32 52, label %4852
    i32 51, label %4853
    i32 50, label %4895
    i32 55, label %4961
  ]

; <label>:19                                      ; preds = %15
  %20 = load i8** @PL_bostr, align 8
  %21 = icmp eq i8* %locinput.0, %20
  br i1 %21, label %35, label %22

; <label>:22                                      ; preds = %19
  %23 = load i32* @PL_multiline, align 4
  %24 = icmp ne i32 %23, 0
  br i1 %24, label %25, label %36

; <label>:25                                      ; preds = %22
  %26 = icmp ne i32 %nextchr.0, 0
  br i1 %26, label %30, label %27

; <label>:27                                      ; preds = %25
  %28 = load i8** @PL_regeol, align 8
  %29 = icmp ult i8* %locinput.0, %28
  br i1 %29, label %30, label %36

; <label>:30                                      ; preds = %27, %25
  %31 = getelementptr inbounds i8* %locinput.0, i64 -1
  %32 = load i8* %31, align 1
  %33 = sext i8 %32 to i32
  %34 = icmp eq i32 %33, 10
  br i1 %34, label %35, label %36

; <label>:35                                      ; preds = %30, %19
  br label %5023

; <label>:36                                      ; preds = %30, %27, %22
  br label %5029

; <label>:37                                      ; preds = %15
  %38 = load i8** @PL_bostr, align 8
  %39 = icmp eq i8* %locinput.0, %38
  br i1 %39, label %50, label %40

; <label>:40                                      ; preds = %37
  %41 = icmp ne i32 %nextchr.0, 0
  br i1 %41, label %45, label %42

; <label>:42                                      ; preds = %40
  %43 = load i8** @PL_regeol, align 8
  %44 = icmp ult i8* %locinput.0, %43
  br i1 %44, label %45, label %51

; <label>:45                                      ; preds = %42, %40
  %46 = getelementptr inbounds i8* %locinput.0, i64 -1
  %47 = load i8* %46, align 1
  %48 = sext i8 %47 to i32
  %49 = icmp eq i32 %48, 10
  br i1 %49, label %50, label %51

; <label>:50                                      ; preds = %45, %37
  br label %5023

; <label>:51                                      ; preds = %45, %42
  br label %5029

; <label>:52                                      ; preds = %15
  %53 = load i8** @PL_bostr, align 8
  %54 = icmp eq i8* %locinput.0, %53
  br i1 %54, label %55, label %56

; <label>:55                                      ; preds = %52
  br label %5023

; <label>:56                                      ; preds = %52
  br label %5029

; <label>:57                                      ; preds = %15
  %58 = load i8** @PL_reg_ganch, align 8
  %59 = icmp eq i8* %locinput.0, %58
  br i1 %59, label %60, label %61

; <label>:60                                      ; preds = %57
  br label %5023

; <label>:61                                      ; preds = %57
  br label %5029

; <label>:62                                      ; preds = %15
  %63 = load i32* @PL_multiline, align 4
  %64 = icmp ne i32 %63, 0
  br i1 %64, label %65, label %66

; <label>:65                                      ; preds = %62
  br label %68

; <label>:66                                      ; preds = %62
  br label %78

; <label>:67                                      ; preds = %15
  br label %68

; <label>:68                                      ; preds = %67, %65
  %69 = icmp ne i32 %nextchr.0, 0
  br i1 %69, label %73, label %70

; <label>:70                                      ; preds = %68
  %71 = load i8** @PL_regeol, align 8
  %72 = icmp ult i8* %locinput.0, %71
  br i1 %72, label %73, label %76

; <label>:73                                      ; preds = %70, %68
  %74 = icmp ne i32 %nextchr.0, 10
  br i1 %74, label %75, label %76

; <label>:75                                      ; preds = %73
  br label %5029

; <label>:76                                      ; preds = %73, %70
  br label %5023

; <label>:77                                      ; preds = %15
  br label %78

; <label>:78                                      ; preds = %77, %66
  %79 = icmp ne i32 %nextchr.0, 0
  br i1 %79, label %83, label %80

; <label>:80                                      ; preds = %78
  %81 = load i8** @PL_regeol, align 8
  %82 = icmp ult i8* %locinput.0, %81
  br i1 %82, label %83, label %86

; <label>:83                                      ; preds = %80, %78
  %84 = icmp ne i32 %nextchr.0, 10
  br i1 %84, label %85, label %86

; <label>:85                                      ; preds = %83
  br label %5029

; <label>:86                                      ; preds = %83, %80
  %87 = load i8** @PL_regeol, align 8
  %88 = ptrtoint i8* %87 to i64
  %89 = ptrtoint i8* %locinput.0 to i64
  %90 = sub i64 %88, %89
  %91 = icmp sgt i64 %90, 1
  br i1 %91, label %92, label %93

; <label>:92                                      ; preds = %86
  br label %5029

; <label>:93                                      ; preds = %86
  br label %5023

; <label>:94                                      ; preds = %15
  %95 = load i8** @PL_regeol, align 8
  %96 = icmp ne i8* %95, %locinput.0
  br i1 %96, label %97, label %98

; <label>:97                                      ; preds = %94
  br label %5029

; <label>:98                                      ; preds = %94
  br label %5023

; <label>:99                                      ; preds = %15
  %100 = icmp ne i32 %nextchr.0, 0
  br i1 %100, label %105, label %101

; <label>:101                                     ; preds = %99
  %102 = load i8** @PL_regeol, align 8
  %103 = icmp uge i8* %locinput.0, %102
  br i1 %103, label %104, label %105

; <label>:104                                     ; preds = %101
  br label %5029

; <label>:105                                     ; preds = %101, %99
  %106 = icmp ne i8 %2, 0
  br i1 %106, label %107, label %120

; <label>:107                                     ; preds = %105
  %108 = sext i32 %nextchr.0 to i64
  %109 = getelementptr inbounds [0 x i8]* @PL_utf8skip, i32 0, i64 %108
  %110 = load i8* %109, align 1
  %111 = zext i8 %110 to i32
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds i8* %locinput.0, i64 %112
  %114 = load i8** @PL_regeol, align 8
  %115 = icmp ugt i8* %113, %114
  br i1 %115, label %116, label %117

; <label>:116                                     ; preds = %107
  br label %5029

; <label>:117                                     ; preds = %107
  %118 = load i8* %113, align 1
  %119 = zext i8 %118 to i32
  br label %124

; <label>:120                                     ; preds = %105
  %121 = getelementptr inbounds i8* %locinput.0, i32 1
  %122 = load i8* %121, align 1
  %123 = zext i8 %122 to i32
  br label %124

; <label>:124                                     ; preds = %120, %117
  %locinput.1 = phi i8* [ %113, %117 ], [ %121, %120 ]
  %nextchr.1 = phi i32 [ %119, %117 ], [ %123, %120 ]
  br label %5023

; <label>:125                                     ; preds = %15
  %126 = icmp ne i32 %nextchr.0, 0
  br i1 %126, label %131, label %127

; <label>:127                                     ; preds = %125
  %128 = load i8** @PL_regeol, align 8
  %129 = icmp uge i8* %locinput.0, %128
  br i1 %129, label %130, label %131

; <label>:130                                     ; preds = %127
  br label %5029

; <label>:131                                     ; preds = %127, %125
  %132 = getelementptr inbounds i8* %locinput.0, i32 1
  %133 = load i8* %132, align 1
  %134 = zext i8 %133 to i32
  br label %5023

; <label>:135                                     ; preds = %15
  %136 = icmp ne i32 %nextchr.0, 0
  br i1 %136, label %140, label %137

; <label>:137                                     ; preds = %135
  %138 = load i8** @PL_regeol, align 8
  %139 = icmp uge i8* %locinput.0, %138
  br i1 %139, label %142, label %140

; <label>:140                                     ; preds = %137, %135
  %141 = icmp eq i32 %nextchr.0, 10
  br i1 %141, label %142, label %143

; <label>:142                                     ; preds = %140, %137
  br label %5029

; <label>:143                                     ; preds = %140
  %144 = icmp ne i8 %2, 0
  br i1 %144, label %145, label %158

; <label>:145                                     ; preds = %143
  %146 = sext i32 %nextchr.0 to i64
  %147 = getelementptr inbounds [0 x i8]* @PL_utf8skip, i32 0, i64 %146
  %148 = load i8* %147, align 1
  %149 = zext i8 %148 to i32
  %150 = sext i32 %149 to i64
  %151 = getelementptr inbounds i8* %locinput.0, i64 %150
  %152 = load i8** @PL_regeol, align 8
  %153 = icmp ugt i8* %151, %152
  br i1 %153, label %154, label %155

; <label>:154                                     ; preds = %145
  br label %5029

; <label>:155                                     ; preds = %145
  %156 = load i8* %151, align 1
  %157 = zext i8 %156 to i32
  br label %162

; <label>:158                                     ; preds = %143
  %159 = getelementptr inbounds i8* %locinput.0, i32 1
  %160 = load i8* %159, align 1
  %161 = zext i8 %160 to i32
  br label %162

; <label>:162                                     ; preds = %158, %155
  %locinput.2 = phi i8* [ %151, %155 ], [ %159, %158 ]
  %nextchr.2 = phi i32 [ %157, %155 ], [ %161, %158 ]
  br label %5023

; <label>:163                                     ; preds = %15
  %164 = bitcast %struct.regnode* %scan.0 to %struct.regnode_string*
  %165 = getelementptr inbounds %struct.regnode_string* %164, i32 0, i32 3
  %166 = getelementptr inbounds [1 x i8]* %165, i32 0, i32 0
  %167 = bitcast %struct.regnode* %scan.0 to %struct.regnode_string*
  %168 = getelementptr inbounds %struct.regnode_string* %167, i32 0, i32 0
  %169 = load i8* %168, align 1
  %170 = zext i8 %169 to i32
  %171 = sext i8 %2 to i32
  %172 = load i32* @PL_reg_flags, align 4
  %173 = and i32 %172, 8
  %174 = icmp ne i32 %173, 0
  %175 = zext i1 %174 to i32
  %176 = icmp ne i32 %171, %175
  br i1 %176, label %177, label %306

; <label>:177                                     ; preds = %163
  %178 = sext i32 %170 to i64
  %179 = getelementptr inbounds i8* %166, i64 %178
  %180 = icmp ne i8 %2, 0
  br i1 %180, label %181, label %242

; <label>:181                                     ; preds = %177
  br label %182

; <label>:182                                     ; preds = %237, %181
  %l.0 = phi i8* [ %locinput.0, %181 ], [ %239, %237 ]
  %s.0 = phi i8* [ %166, %181 ], [ %240, %237 ]
  %183 = icmp ult i8* %s.0, %179
  br i1 %183, label %184, label %241

; <label>:184                                     ; preds = %182
  %185 = load i8** @PL_regeol, align 8
  %186 = icmp uge i8* %l.0, %185
  br i1 %186, label %187, label %188

; <label>:187                                     ; preds = %184
  br label %5029

; <label>:188                                     ; preds = %184
  %189 = load i8* %s.0, align 1
  %190 = zext i8 %189 to i64
  %191 = load volatile %struct.cop** @PL_curcop, align 8
  %192 = getelementptr inbounds %struct.cop* %191, i32 0, i32 14
  %193 = load %struct.sv** %192, align 8
  %194 = icmp ne %struct.sv* %193, null
  br i1 %194, label %195, label %219

; <label>:195                                     ; preds = %188
  %196 = load volatile %struct.cop** @PL_curcop, align 8
  %197 = getelementptr inbounds %struct.cop* %196, i32 0, i32 14
  %198 = load %struct.sv** %197, align 8
  %199 = icmp ne %struct.sv* %198, getelementptr inbounds (%struct.sv* null, i64 2)
  br i1 %199, label %200, label %219

; <label>:200                                     ; preds = %195
  %201 = load volatile %struct.cop** @PL_curcop, align 8
  %202 = getelementptr inbounds %struct.cop* %201, i32 0, i32 14
  %203 = load %struct.sv** %202, align 8
  %204 = icmp eq %struct.sv* %203, getelementptr inbounds (%struct.sv* null, i64 1)
  br i1 %204, label %231, label %205

; <label>:205                                     ; preds = %200
  %206 = load volatile %struct.cop** @PL_curcop, align 8
  %207 = getelementptr inbounds %struct.cop* %206, i32 0, i32 14
  %208 = load %struct.sv** %207, align 8
  %209 = getelementptr inbounds %struct.sv* %208, i32 0, i32 0
  %210 = load i8** %209, align 8
  %211 = bitcast i8* %210 to %struct.xpv*
  %212 = getelementptr inbounds %struct.xpv* %211, i32 0, i32 0
  %213 = load i8** %212, align 8
  %214 = getelementptr inbounds i8* %213, i64 11
  %215 = load i8* %214, align 1
  %216 = sext i8 %215 to i32
  %217 = and i32 %216, 1
  %218 = icmp ne i32 %217, 0
  br i1 %218, label %231, label %219

; <label>:219                                     ; preds = %205, %195, %188
  %220 = load volatile %struct.cop** @PL_curcop, align 8
  %221 = getelementptr inbounds %struct.cop* %220, i32 0, i32 14
  %222 = load %struct.sv** %221, align 8
  %223 = icmp eq %struct.sv* %222, null
  br i1 %223, label %224, label %229

; <label>:224                                     ; preds = %219
  %225 = load i8* @PL_dowarn, align 1
  %226 = zext i8 %225 to i32
  %227 = and i32 %226, 1
  %228 = icmp ne i32 %227, 0
  br label %229

; <label>:229                                     ; preds = %224, %219
  %230 = phi i1 [ false, %219 ], [ %228, %224 ]
  br label %231

; <label>:231                                     ; preds = %229, %205, %200
  %232 = phi i1 [ true, %205 ], [ true, %200 ], [ %230, %229 ]
  %233 = select i1 %232, i32 0, i32 255
  %234 = call i64 @Perl_utf8n_to_uvuni(i8* %l.0, i64 13, i64* %ulen, i32 %233)
  %235 = icmp ne i64 %190, %234
  br i1 %235, label %236, label %237

; <label>:236                                     ; preds = %231
  br label %5029

; <label>:237                                     ; preds = %231
  %238 = load i64* %ulen, align 8
  %239 = getelementptr inbounds i8* %l.0, i64 %238
  %240 = getelementptr inbounds i8* %s.0, i32 1
  br label %182

; <label>:241                                     ; preds = %182
  br label %303

; <label>:242                                     ; preds = %177
  br label %243

; <label>:243                                     ; preds = %298, %242
  %l.1 = phi i8* [ %locinput.0, %242 ], [ %301, %298 ]
  %s.1 = phi i8* [ %166, %242 ], [ %300, %298 ]
  %244 = icmp ult i8* %s.1, %179
  br i1 %244, label %245, label %302

; <label>:245                                     ; preds = %243
  %246 = load i8** @PL_regeol, align 8
  %247 = icmp uge i8* %l.1, %246
  br i1 %247, label %248, label %249

; <label>:248                                     ; preds = %245
  br label %5029

; <label>:249                                     ; preds = %245
  %250 = load i8* %l.1, align 1
  %251 = zext i8 %250 to i64
  %252 = load volatile %struct.cop** @PL_curcop, align 8
  %253 = getelementptr inbounds %struct.cop* %252, i32 0, i32 14
  %254 = load %struct.sv** %253, align 8
  %255 = icmp ne %struct.sv* %254, null
  br i1 %255, label %256, label %280

; <label>:256                                     ; preds = %249
  %257 = load volatile %struct.cop** @PL_curcop, align 8
  %258 = getelementptr inbounds %struct.cop* %257, i32 0, i32 14
  %259 = load %struct.sv** %258, align 8
  %260 = icmp ne %struct.sv* %259, getelementptr inbounds (%struct.sv* null, i64 2)
  br i1 %260, label %261, label %280

; <label>:261                                     ; preds = %256
  %262 = load volatile %struct.cop** @PL_curcop, align 8
  %263 = getelementptr inbounds %struct.cop* %262, i32 0, i32 14
  %264 = load %struct.sv** %263, align 8
  %265 = icmp eq %struct.sv* %264, getelementptr inbounds (%struct.sv* null, i64 1)
  br i1 %265, label %292, label %266

; <label>:266                                     ; preds = %261
  %267 = load volatile %struct.cop** @PL_curcop, align 8
  %268 = getelementptr inbounds %struct.cop* %267, i32 0, i32 14
  %269 = load %struct.sv** %268, align 8
  %270 = getelementptr inbounds %struct.sv* %269, i32 0, i32 0
  %271 = load i8** %270, align 8
  %272 = bitcast i8* %271 to %struct.xpv*
  %273 = getelementptr inbounds %struct.xpv* %272, i32 0, i32 0
  %274 = load i8** %273, align 8
  %275 = getelementptr inbounds i8* %274, i64 11
  %276 = load i8* %275, align 1
  %277 = sext i8 %276 to i32
  %278 = and i32 %277, 1
  %279 = icmp ne i32 %278, 0
  br i1 %279, label %292, label %280

; <label>:280                                     ; preds = %266, %256, %249
  %281 = load volatile %struct.cop** @PL_curcop, align 8
  %282 = getelementptr inbounds %struct.cop* %281, i32 0, i32 14
  %283 = load %struct.sv** %282, align 8
  %284 = icmp eq %struct.sv* %283, null
  br i1 %284, label %285, label %290

; <label>:285                                     ; preds = %280
  %286 = load i8* @PL_dowarn, align 1
  %287 = zext i8 %286 to i32
  %288 = and i32 %287, 1
  %289 = icmp ne i32 %288, 0
  br label %290

; <label>:290                                     ; preds = %285, %280
  %291 = phi i1 [ false, %280 ], [ %289, %285 ]
  br label %292

; <label>:292                                     ; preds = %290, %266, %261
  %293 = phi i1 [ true, %266 ], [ true, %261 ], [ %291, %290 ]
  %294 = select i1 %293, i32 0, i32 255
  %295 = call i64 @Perl_utf8n_to_uvuni(i8* %s.1, i64 13, i64* %ulen, i32 %294)
  %296 = icmp ne i64 %251, %295
  br i1 %296, label %297, label %298

; <label>:297                                     ; preds = %292
  br label %5029

; <label>:298                                     ; preds = %292
  %299 = load i64* %ulen, align 8
  %300 = getelementptr inbounds i8* %s.1, i64 %299
  %301 = getelementptr inbounds i8* %l.1, i32 1
  br label %243

; <label>:302                                     ; preds = %243
  br label %303

; <label>:303                                     ; preds = %302, %241
  %l.2 = phi i8* [ %l.0, %241 ], [ %l.1, %302 ]
  %304 = load i8* %l.2, align 1
  %305 = zext i8 %304 to i32
  br label %5023

; <label>:306                                     ; preds = %163
  %307 = load i8* %166, align 1
  %308 = zext i8 %307 to i32
  %309 = icmp ne i32 %308, %nextchr.0
  br i1 %309, label %310, label %311

; <label>:310                                     ; preds = %306
  br label %5029

; <label>:311                                     ; preds = %306
  %312 = load i8** @PL_regeol, align 8
  %313 = ptrtoint i8* %312 to i64
  %314 = ptrtoint i8* %locinput.0 to i64
  %315 = sub i64 %313, %314
  %316 = sext i32 %170 to i64
  %317 = icmp slt i64 %315, %316
  br i1 %317, label %318, label %319

; <label>:318                                     ; preds = %311
  br label %5029

; <label>:319                                     ; preds = %311
  %320 = icmp sgt i32 %170, 1
  br i1 %320, label %321, label %326

; <label>:321                                     ; preds = %319
  %322 = sext i32 %170 to i64
  %323 = call i32 @memcmp(i8* %166, i8* %locinput.0, i64 %322)
  %324 = icmp ne i32 %323, 0
  br i1 %324, label %325, label %326

; <label>:325                                     ; preds = %321
  br label %5029

; <label>:326                                     ; preds = %321, %319
  %327 = sext i32 %170 to i64
  %328 = getelementptr inbounds i8* %locinput.0, i64 %327
  %329 = load i8* %328, align 1
  %330 = zext i8 %329 to i32
  br label %5023

; <label>:331                                     ; preds = %15
  %332 = load i32* @PL_reg_flags, align 4
  %333 = or i32 %332, 1
  store i32 %333, i32* @PL_reg_flags, align 4
  br label %334

; <label>:334                                     ; preds = %331, %15
  %335 = bitcast %struct.regnode* %scan.0 to %struct.regnode_string*
  %336 = getelementptr inbounds %struct.regnode_string* %335, i32 0, i32 3
  %337 = getelementptr inbounds [1 x i8]* %336, i32 0, i32 0
  %338 = bitcast %struct.regnode* %scan.0 to %struct.regnode_string*
  %339 = getelementptr inbounds %struct.regnode_string* %338, i32 0, i32 0
  %340 = load i8* %339, align 1
  %341 = zext i8 %340 to i32
  %342 = sext i8 %2 to i32
  %343 = icmp ne i32 %342, 0
  br i1 %343, label %348, label %344

; <label>:344                                     ; preds = %334
  %345 = load i32* @PL_reg_flags, align 4
  %346 = and i32 %345, 8
  %347 = icmp ne i32 %346, 0
  br i1 %347, label %348, label %429

; <label>:348                                     ; preds = %344, %334
  %349 = load i8** @PL_regeol, align 8
  store i8* %349, i8** %e2, align 8
  %350 = sext i32 %341 to i64
  %351 = load i32* @PL_reg_flags, align 4
  %352 = and i32 %351, 8
  %353 = icmp ne i32 %352, 0
  %354 = zext i1 %353 to i32
  %355 = trunc i32 %354 to i8
  %356 = call i32 @Perl_ibcmp_utf8(i8* %337, i8** null, i64 %350, i8 signext %355, i8* %locinput.0, i8** %e2, i64 0, i8 signext %2)
  %357 = icmp ne i32 %356, 0
  br i1 %357, label %358, label %425

; <label>:358                                     ; preds = %348
  %359 = sext i8 %2 to i32
  %360 = icmp ne i32 %359, 0
  br i1 %360, label %361, label %423

; <label>:361                                     ; preds = %358
  %362 = getelementptr inbounds i8* %337, i64 0
  %363 = load i8* %362, align 1
  %364 = sext i8 %363 to i32
  %365 = icmp sge i32 %364, 65
  br i1 %365, label %366, label %376

; <label>:366                                     ; preds = %361
  %367 = getelementptr inbounds i8* %337, i64 0
  %368 = load i8* %367, align 1
  %369 = sext i8 %368 to i32
  %370 = icmp sle i32 %369, 90
  br i1 %370, label %371, label %376

; <label>:371                                     ; preds = %366
  %372 = getelementptr inbounds i8* %337, i64 0
  %373 = load i8* %372, align 1
  %374 = sext i8 %373 to i32
  %375 = add nsw i32 %374, 32
  br label %380

; <label>:376                                     ; preds = %366, %361
  %377 = getelementptr inbounds i8* %337, i64 0
  %378 = load i8* %377, align 1
  %379 = sext i8 %378 to i32
  br label %380

; <label>:380                                     ; preds = %376, %371
  %381 = phi i32 [ %375, %371 ], [ %379, %376 ]
  %382 = icmp eq i32 %381, 115
  br i1 %382, label %383, label %423

; <label>:383                                     ; preds = %380
  %384 = icmp sge i32 %341, 2
  br i1 %384, label %385, label %423

; <label>:385                                     ; preds = %383
  %386 = getelementptr inbounds i8* %337, i64 1
  %387 = load i8* %386, align 1
  %388 = sext i8 %387 to i32
  %389 = icmp sge i32 %388, 65
  br i1 %389, label %390, label %400

; <label>:390                                     ; preds = %385
  %391 = getelementptr inbounds i8* %337, i64 1
  %392 = load i8* %391, align 1
  %393 = sext i8 %392 to i32
  %394 = icmp sle i32 %393, 90
  br i1 %394, label %395, label %400

; <label>:395                                     ; preds = %390
  %396 = getelementptr inbounds i8* %337, i64 1
  %397 = load i8* %396, align 1
  %398 = sext i8 %397 to i32
  %399 = add nsw i32 %398, 32
  br label %404

; <label>:400                                     ; preds = %390, %385
  %401 = getelementptr inbounds i8* %337, i64 1
  %402 = load i8* %401, align 1
  %403 = sext i8 %402 to i32
  br label %404

; <label>:404                                     ; preds = %400, %395
  %405 = phi i32 [ %399, %395 ], [ %403, %400 ]
  %406 = icmp eq i32 %405, 115
  br i1 %406, label %407, label %423

; <label>:407                                     ; preds = %404
  %408 = getelementptr inbounds i8* %locinput.0, i64 0
  %409 = load i8* %408, align 1
  %410 = zext i8 %409 to i32
  %411 = icmp eq i32 %410, 195
  br i1 %411, label %412, label %423

; <label>:412                                     ; preds = %407
  %413 = load i8** %e2, align 8
  %414 = ptrtoint i8* %413 to i64
  %415 = ptrtoint i8* %locinput.0 to i64
  %416 = sub i64 %414, %415
  %417 = icmp sge i64 %416, 2
  br i1 %417, label %418, label %423

; <label>:418                                     ; preds = %412
  %419 = getelementptr inbounds i8* %locinput.0, i64 1
  %420 = load i8* %419, align 1
  %421 = zext i8 %420 to i32
  %422 = icmp eq i32 %421, 159
  br i1 %422, label %424, label %423

; <label>:423                                     ; preds = %418, %412, %407, %404, %383, %380, %358
  br label %5029

; <label>:424                                     ; preds = %418
  br label %425

; <label>:425                                     ; preds = %424, %348
  %426 = load i8** %e2, align 8
  %427 = load i8* %426, align 1
  %428 = zext i8 %427 to i32
  br label %5023

; <label>:429                                     ; preds = %344
  %430 = load i8* %337, align 1
  %431 = zext i8 %430 to i32
  %432 = icmp ne i32 %431, %nextchr.0
  br i1 %432, label %433, label %447

; <label>:433                                     ; preds = %429
  %434 = load i8* %337, align 1
  %435 = zext i8 %434 to i32
  %436 = sext i32 %nextchr.0 to i64
  %437 = getelementptr inbounds %struct.regnode* %scan.0, i32 0, i32 1
  %438 = load i8* %437, align 1
  %439 = zext i8 %438 to i32
  %440 = icmp eq i32 %439, 34
  %441 = select i1 %440, i8* getelementptr inbounds ([0 x i8]* @PL_fold, i32 0, i32 0), i8* getelementptr inbounds ([0 x i8]* @PL_fold_locale, i32 0, i32 0)
  %442 = getelementptr inbounds i8* %441, i64 %436
  %443 = load i8* %442, align 1
  %444 = zext i8 %443 to i32
  %445 = icmp ne i32 %435, %444
  br i1 %445, label %446, label %447

; <label>:446                                     ; preds = %433
  br label %5029

; <label>:447                                     ; preds = %433, %429
  %448 = load i8** @PL_regeol, align 8
  %449 = ptrtoint i8* %448 to i64
  %450 = ptrtoint i8* %locinput.0 to i64
  %451 = sub i64 %449, %450
  %452 = sext i32 %341 to i64
  %453 = icmp slt i64 %451, %452
  br i1 %453, label %454, label %455

; <label>:454                                     ; preds = %447
  br label %5029

; <label>:455                                     ; preds = %447
  %456 = icmp sgt i32 %341, 1
  br i1 %456, label %457, label %469

; <label>:457                                     ; preds = %455
  %458 = getelementptr inbounds %struct.regnode* %scan.0, i32 0, i32 1
  %459 = load i8* %458, align 1
  %460 = zext i8 %459 to i32
  %461 = icmp eq i32 %460, 34
  br i1 %461, label %462, label %465

; <label>:462                                     ; preds = %457
  %463 = call i32 @Perl_ibcmp(i8* %337, i8* %locinput.0, i32 %341)
  %464 = icmp ne i32 %463, 0
  br i1 %464, label %468, label %469

; <label>:465                                     ; preds = %457
  %466 = call i32 @Perl_ibcmp_locale(i8* %337, i8* %locinput.0, i32 %341)
  %467 = icmp ne i32 %466, 0
  br i1 %467, label %468, label %469

; <label>:468                                     ; preds = %465, %462
  br label %5029

; <label>:469                                     ; preds = %465, %462, %455
  %470 = sext i32 %341 to i64
  %471 = getelementptr inbounds i8* %locinput.0, i64 %470
  %472 = load i8* %471, align 1
  %473 = zext i8 %472 to i32
  br label %5023

; <label>:474                                     ; preds = %15
  %475 = icmp ne i8 %2, 0
  br i1 %475, label %476, label %505

; <label>:476                                     ; preds = %474
  %477 = load i8** @PL_regeol, align 8
  %478 = ptrtoint i8* %477 to i64
  %479 = ptrtoint i8* %locinput.0 to i64
  %480 = sub i64 %478, %479
  store i64 %480, i64* %inclasslen, align 8
  %481 = sext i8 %2 to i32
  %482 = call i32 (%struct.regnode*, i8*, i64*, i32, ...)* bitcast (i32 (...)* @reginclass to i32 (%struct.regnode*, i8*, i64*, i32, ...)*)(%struct.regnode* %scan.0, i8* %locinput.0, i64* %inclasslen, i32 %481)
  %483 = icmp ne i32 %482, 0
  br i1 %483, label %485, label %484

; <label>:484                                     ; preds = %476
  br label %546

; <label>:485                                     ; preds = %476
  %486 = load i8** @PL_regeol, align 8
  %487 = icmp uge i8* %locinput.0, %486
  br i1 %487, label %488, label %489

; <label>:488                                     ; preds = %485
  br label %5029

; <label>:489                                     ; preds = %485
  %490 = load i64* %inclasslen, align 8
  %491 = icmp ne i64 %490, 0
  br i1 %491, label %492, label %494

; <label>:492                                     ; preds = %489
  %493 = load i64* %inclasslen, align 8
  br label %500

; <label>:494                                     ; preds = %489
  %495 = load i8* %locinput.0, align 1
  %496 = zext i8 %495 to i64
  %497 = getelementptr inbounds [0 x i8]* @PL_utf8skip, i32 0, i64 %496
  %498 = load i8* %497, align 1
  %499 = zext i8 %498 to i64
  br label %500

; <label>:500                                     ; preds = %494, %492
  %501 = phi i64 [ %493, %492 ], [ %499, %494 ]
  %502 = getelementptr inbounds i8* %locinput.0, i64 %501
  %503 = load i8* %502, align 1
  %504 = zext i8 %503 to i32
  br label %5023

; <label>:505                                     ; preds = %474
  %506 = icmp slt i32 %nextchr.0, 0
  br i1 %506, label %507, label %510

; <label>:507                                     ; preds = %505
  %508 = load i8* %locinput.0, align 1
  %509 = zext i8 %508 to i32
  br label %510

; <label>:510                                     ; preds = %507, %505
  %nextchr.3 = phi i32 [ %509, %507 ], [ %nextchr.0, %505 ]
  %511 = getelementptr inbounds %struct.regnode* %scan.0, i32 0, i32 0
  %512 = load i8* %511, align 1
  %513 = zext i8 %512 to i32
  %514 = icmp ne i32 %513, 0
  br i1 %514, label %515, label %518

; <label>:515                                     ; preds = %510
  %516 = call i32 (%struct.regnode*, i8*, i32, i32, ...)* bitcast (i32 (...)* @reginclass to i32 (%struct.regnode*, i8*, i32, i32, ...)*)(%struct.regnode* %scan.0, i8* %locinput.0, i32 0, i32 0)
  %517 = icmp ne i32 %516, 0
  br i1 %517, label %536, label %535

; <label>:518                                     ; preds = %510
  %519 = load i8* %locinput.0, align 1
  %520 = zext i8 %519 to i32
  %521 = ashr i32 %520, 3
  %522 = and i32 %521, 31
  %523 = sext i32 %522 to i64
  %524 = bitcast %struct.regnode* %scan.0 to %struct.regnode_charclass*
  %525 = getelementptr inbounds %struct.regnode_charclass* %524, i32 0, i32 4
  %526 = getelementptr inbounds [32 x i8]* %525, i32 0, i64 %523
  %527 = load i8* %526, align 1
  %528 = sext i8 %527 to i32
  %529 = load i8* %locinput.0, align 1
  %530 = zext i8 %529 to i32
  %531 = and i32 %530, 7
  %532 = shl i32 1, %531
  %533 = and i32 %528, %532
  %534 = icmp ne i32 %533, 0
  br i1 %534, label %536, label %535

; <label>:535                                     ; preds = %518, %515
  br label %546

; <label>:536                                     ; preds = %518, %515
  %537 = icmp ne i32 %nextchr.3, 0
  br i1 %537, label %542, label %538

; <label>:538                                     ; preds = %536
  %539 = load i8** @PL_regeol, align 8
  %540 = icmp uge i8* %locinput.0, %539
  br i1 %540, label %541, label %542

; <label>:541                                     ; preds = %538
  br label %5029

; <label>:542                                     ; preds = %538, %536
  %543 = getelementptr inbounds i8* %locinput.0, i32 1
  %544 = load i8* %543, align 1
  %545 = zext i8 %544 to i32
  br label %5023

; <label>:546                                     ; preds = %535, %484
  %547 = bitcast %struct.regnode* %scan.0 to %struct.regnode_charclass*
  %548 = getelementptr inbounds %struct.regnode_charclass* %547, i32 0, i32 4
  %549 = getelementptr inbounds [32 x i8]* %548, i32 0, i64 27
  %550 = load i8* %549, align 1
  %551 = sext i8 %550 to i32
  %552 = and i32 %551, 128
  %553 = icmp ne i32 %552, 0
  br i1 %553, label %554, label %618

; <label>:554                                     ; preds = %546
  %555 = getelementptr inbounds %struct.regnode* %scan.0, i32 0, i32 0
  %556 = load i8* %555, align 1
  %557 = zext i8 %556 to i32
  %558 = and i32 %557, 32
  %559 = icmp ne i32 %558, 0
  br i1 %559, label %560, label %618

; <label>:560                                     ; preds = %554
  %561 = getelementptr inbounds %struct.regnode* %scan.0, i32 0, i32 0
  %562 = load i8* %561, align 1
  %563 = zext i8 %562 to i32
  %564 = and i32 %563, 2
  %565 = icmp ne i32 %564, 0
  br i1 %565, label %566, label %618

; <label>:566                                     ; preds = %560
  %567 = load i8** @PL_regeol, align 8
  %568 = getelementptr inbounds i8* %locinput.0, i64 1
  %569 = icmp ugt i8* %567, %568
  br i1 %569, label %570, label %618

; <label>:570                                     ; preds = %566
  %571 = getelementptr inbounds i8* %locinput.0, i64 0
  %572 = load i8* %571, align 1
  %573 = sext i8 %572 to i32
  %574 = icmp sge i32 %573, 65
  br i1 %574, label %575, label %585

; <label>:575                                     ; preds = %570
  %576 = getelementptr inbounds i8* %locinput.0, i64 0
  %577 = load i8* %576, align 1
  %578 = sext i8 %577 to i32
  %579 = icmp sle i32 %578, 90
  br i1 %579, label %580, label %585

; <label>:580                                     ; preds = %575
  %581 = getelementptr inbounds i8* %locinput.0, i64 0
  %582 = load i8* %581, align 1
  %583 = sext i8 %582 to i32
  %584 = add nsw i32 %583, 32
  br label %589

; <label>:585                                     ; preds = %575, %570
  %586 = getelementptr inbounds i8* %locinput.0, i64 0
  %587 = load i8* %586, align 1
  %588 = sext i8 %587 to i32
  br label %589

; <label>:589                                     ; preds = %585, %580
  %590 = phi i32 [ %584, %580 ], [ %588, %585 ]
  %591 = icmp eq i32 %590, 115
  br i1 %591, label %592, label %618

; <label>:592                                     ; preds = %589
  %593 = getelementptr inbounds i8* %locinput.0, i64 1
  %594 = load i8* %593, align 1
  %595 = sext i8 %594 to i32
  %596 = icmp sge i32 %595, 65
  br i1 %596, label %597, label %607

; <label>:597                                     ; preds = %592
  %598 = getelementptr inbounds i8* %locinput.0, i64 1
  %599 = load i8* %598, align 1
  %600 = sext i8 %599 to i32
  %601 = icmp sle i32 %600, 90
  br i1 %601, label %602, label %607

; <label>:602                                     ; preds = %597
  %603 = getelementptr inbounds i8* %locinput.0, i64 1
  %604 = load i8* %603, align 1
  %605 = sext i8 %604 to i32
  %606 = add nsw i32 %605, 32
  br label %611

; <label>:607                                     ; preds = %597, %592
  %608 = getelementptr inbounds i8* %locinput.0, i64 1
  %609 = load i8* %608, align 1
  %610 = sext i8 %609 to i32
  br label %611

; <label>:611                                     ; preds = %607, %602
  %612 = phi i32 [ %606, %602 ], [ %610, %607 ]
  %613 = icmp eq i32 %612, 115
  br i1 %613, label %614, label %618

; <label>:614                                     ; preds = %611
  %615 = getelementptr inbounds i8* %locinput.0, i64 2
  %616 = load i8* %615, align 1
  %617 = zext i8 %616 to i32
  br label %619

; <label>:618                                     ; preds = %611, %589, %566, %560, %554, %546
  br label %5029

; <label>:619                                     ; preds = %614
  br label %5023

; <label>:620                                     ; preds = %15
  %621 = load i32* @PL_reg_flags, align 4
  %622 = or i32 %621, 1
  store i32 %622, i32* @PL_reg_flags, align 4
  br label %623

; <label>:623                                     ; preds = %620, %15
  %624 = icmp ne i32 %nextchr.0, 0
  br i1 %624, label %626, label %625

; <label>:625                                     ; preds = %623
  br label %5029

; <label>:626                                     ; preds = %623
  %627 = icmp ne i8 %2, 0
  br i1 %627, label %628, label %686

; <label>:628                                     ; preds = %626
  %629 = load %struct.sv** @PL_utf8_alnum, align 8
  %630 = icmp ne %struct.sv* %629, null
  br i1 %630, label %633, label %631

; <label>:631                                     ; preds = %628
  call void @Perl_push_scope()
  call void @Perl_save_re_context()
  %632 = call signext i8 @Perl_is_utf8_alnum(i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0))
  call void @Perl_pop_scope()
  br label %633

; <label>:633                                     ; preds = %631, %628
  %634 = getelementptr inbounds %struct.regnode* %scan.0, i32 0, i32 1
  %635 = load i8* %634, align 1
  %636 = zext i8 %635 to i32
  %637 = icmp eq i32 %636, 18
  br i1 %637, label %638, label %642

; <label>:638                                     ; preds = %633
  %639 = load %struct.sv** @PL_utf8_alnum, align 8
  %640 = call i64 @Perl_swash_fetch(%struct.sv* %639, i8* %locinput.0, i8 signext %2)
  %641 = icmp ne i64 %640, 0
  br i1 %641, label %677, label %676

; <label>:642                                     ; preds = %633
  %643 = call i64 @Perl_utf8_to_uvchr(i8* %locinput.0, i64* null)
  %644 = icmp ult i64 %643, 256
  br i1 %644, label %645, label %668

; <label>:645                                     ; preds = %642
  %646 = call i64 @Perl_utf8_to_uvchr(i8* %locinput.0, i64* null)
  %647 = and i64 %646, -128
  %648 = icmp eq i64 %647, 0
  br i1 %648, label %649, label %665

; <label>:649                                     ; preds = %645
  %650 = call i64 @Perl_utf8_to_uvchr(i8* %locinput.0, i64* null)
  %651 = trunc i64 %650 to i32
  %652 = sext i32 %651 to i64
  %653 = call i16** @__ctype_b_loc()
  %654 = load i16** %653, align 8
  %655 = getelementptr inbounds i16* %654, i64 %652
  %656 = load i16* %655, align 2
  %657 = zext i16 %656 to i32
  %658 = and i32 %657, 8
  %659 = icmp ne i32 %658, 0
  br i1 %659, label %663, label %660

; <label>:660                                     ; preds = %649
  %661 = call i64 @Perl_utf8_to_uvchr(i8* %locinput.0, i64* null)
  %662 = icmp eq i64 %661, 95
  br label %663

; <label>:663                                     ; preds = %660, %649
  %664 = phi i1 [ true, %649 ], [ %662, %660 ]
  br label %665

; <label>:665                                     ; preds = %663, %645
  %666 = phi i1 [ false, %645 ], [ %664, %663 ]
  %667 = zext i1 %666 to i32
  br label %672

; <label>:668                                     ; preds = %642
  %669 = call i64 @Perl_utf8_to_uvchr(i8* %locinput.0, i64* null)
  %670 = call signext i8 @Perl_is_uni_alnum_lc(i64 %669)
  %671 = sext i8 %670 to i32
  br label %672

; <label>:672                                     ; preds = %668, %665
  %673 = phi i32 [ %667, %665 ], [ %671, %668 ]
  %674 = sext i32 %673 to i64
  %675 = icmp ne i64 %674, 0
  br i1 %675, label %677, label %676

; <label>:676                                     ; preds = %672, %638
  br label %5029

; <label>:677                                     ; preds = %672, %638
  %678 = sext i32 %nextchr.0 to i64
  %679 = getelementptr inbounds [0 x i8]* @PL_utf8skip, i32 0, i64 %678
  %680 = load i8* %679, align 1
  %681 = zext i8 %680 to i32
  %682 = sext i32 %681 to i64
  %683 = getelementptr inbounds i8* %locinput.0, i64 %682
  %684 = load i8* %683, align 1
  %685 = zext i8 %684 to i32
  br label %5023

; <label>:686                                     ; preds = %626
  %687 = getelementptr inbounds %struct.regnode* %scan.0, i32 0, i32 1
  %688 = load i8* %687, align 1
  %689 = zext i8 %688 to i32
  %690 = icmp eq i32 %689, 18
  br i1 %690, label %691, label %705

; <label>:691                                     ; preds = %686
  %692 = icmp sge i32 %nextchr.0, 65
  br i1 %692, label %693, label %695

; <label>:693                                     ; preds = %691
  %694 = icmp sle i32 %nextchr.0, 90
  br i1 %694, label %720, label %695

; <label>:695                                     ; preds = %693, %691
  %696 = icmp sge i32 %nextchr.0, 97
  br i1 %696, label %697, label %699

; <label>:697                                     ; preds = %695
  %698 = icmp sle i32 %nextchr.0, 122
  br i1 %698, label %720, label %699

; <label>:699                                     ; preds = %697, %695
  %700 = icmp sge i32 %nextchr.0, 48
  br i1 %700, label %701, label %703

; <label>:701                                     ; preds = %699
  %702 = icmp sle i32 %nextchr.0, 57
  br i1 %702, label %720, label %703

; <label>:703                                     ; preds = %701, %699
  %704 = icmp eq i32 %nextchr.0, 95
  br i1 %704, label %720, label %719

; <label>:705                                     ; preds = %686
  %706 = and i32 %nextchr.0, -128
  %707 = icmp eq i32 %706, 0
  br i1 %707, label %708, label %719

; <label>:708                                     ; preds = %705
  %709 = sext i32 %nextchr.0 to i64
  %710 = call i16** @__ctype_b_loc()
  %711 = load i16** %710, align 8
  %712 = getelementptr inbounds i16* %711, i64 %709
  %713 = load i16* %712, align 2
  %714 = zext i16 %713 to i32
  %715 = and i32 %714, 8
  %716 = icmp ne i32 %715, 0
  br i1 %716, label %720, label %717

; <label>:717                                     ; preds = %708
  %718 = icmp eq i32 %nextchr.0, 95
  br i1 %718, label %720, label %719

; <label>:719                                     ; preds = %717, %705, %703
  br label %5029

; <label>:720                                     ; preds = %717, %708, %703, %701, %697, %693
  %721 = getelementptr inbounds i8* %locinput.0, i32 1
  %722 = load i8* %721, align 1
  %723 = zext i8 %722 to i32
  br label %5023

; <label>:724                                     ; preds = %15
  %725 = load i32* @PL_reg_flags, align 4
  %726 = or i32 %725, 1
  store i32 %726, i32* @PL_reg_flags, align 4
  br label %727

; <label>:727                                     ; preds = %724, %15
  %728 = icmp ne i32 %nextchr.0, 0
  br i1 %728, label %733, label %729

; <label>:729                                     ; preds = %727
  %730 = load i8** @PL_regeol, align 8
  %731 = icmp uge i8* %locinput.0, %730
  br i1 %731, label %732, label %733

; <label>:732                                     ; preds = %729
  br label %5029

; <label>:733                                     ; preds = %729, %727
  %734 = icmp ne i8 %2, 0
  br i1 %734, label %735, label %793

; <label>:735                                     ; preds = %733
  %736 = load %struct.sv** @PL_utf8_alnum, align 8
  %737 = icmp ne %struct.sv* %736, null
  br i1 %737, label %740, label %738

; <label>:738                                     ; preds = %735
  call void @Perl_push_scope()
  call void @Perl_save_re_context()
  %739 = call signext i8 @Perl_is_utf8_alnum(i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0))
  call void @Perl_pop_scope()
  br label %740

; <label>:740                                     ; preds = %738, %735
  %741 = getelementptr inbounds %struct.regnode* %scan.0, i32 0, i32 1
  %742 = load i8* %741, align 1
  %743 = zext i8 %742 to i32
  %744 = icmp eq i32 %743, 20
  br i1 %744, label %745, label %749

; <label>:745                                     ; preds = %740
  %746 = load %struct.sv** @PL_utf8_alnum, align 8
  %747 = call i64 @Perl_swash_fetch(%struct.sv* %746, i8* %locinput.0, i8 signext %2)
  %748 = icmp ne i64 %747, 0
  br i1 %748, label %783, label %784

; <label>:749                                     ; preds = %740
  %750 = call i64 @Perl_utf8_to_uvchr(i8* %locinput.0, i64* null)
  %751 = icmp ult i64 %750, 256
  br i1 %751, label %752, label %775

; <label>:752                                     ; preds = %749
  %753 = call i64 @Perl_utf8_to_uvchr(i8* %locinput.0, i64* null)
  %754 = and i64 %753, -128
  %755 = icmp eq i64 %754, 0
  br i1 %755, label %756, label %772

; <label>:756                                     ; preds = %752
  %757 = call i64 @Perl_utf8_to_uvchr(i8* %locinput.0, i64* null)
  %758 = trunc i64 %757 to i32
  %759 = sext i32 %758 to i64
  %760 = call i16** @__ctype_b_loc()
  %761 = load i16** %760, align 8
  %762 = getelementptr inbounds i16* %761, i64 %759
  %763 = load i16* %762, align 2
  %764 = zext i16 %763 to i32
  %765 = and i32 %764, 8
  %766 = icmp ne i32 %765, 0
  br i1 %766, label %770, label %767

; <label>:767                                     ; preds = %756
  %768 = call i64 @Perl_utf8_to_uvchr(i8* %locinput.0, i64* null)
  %769 = icmp eq i64 %768, 95
  br label %770

; <label>:770                                     ; preds = %767, %756
  %771 = phi i1 [ true, %756 ], [ %769, %767 ]
  br label %772

; <label>:772                                     ; preds = %770, %752
  %773 = phi i1 [ false, %752 ], [ %771, %770 ]
  %774 = zext i1 %773 to i32
  br label %779

; <label>:775                                     ; preds = %749
  %776 = call i64 @Perl_utf8_to_uvchr(i8* %locinput.0, i64* null)
  %777 = call signext i8 @Perl_is_uni_alnum_lc(i64 %776)
  %778 = sext i8 %777 to i32
  br label %779

; <label>:779                                     ; preds = %775, %772
  %780 = phi i32 [ %774, %772 ], [ %778, %775 ]
  %781 = sext i32 %780 to i64
  %782 = icmp ne i64 %781, 0
  br i1 %782, label %783, label %784

; <label>:783                                     ; preds = %779, %745
  br label %5029

; <label>:784                                     ; preds = %779, %745
  %785 = sext i32 %nextchr.0 to i64
  %786 = getelementptr inbounds [0 x i8]* @PL_utf8skip, i32 0, i64 %785
  %787 = load i8* %786, align 1
  %788 = zext i8 %787 to i32
  %789 = sext i32 %788 to i64
  %790 = getelementptr inbounds i8* %locinput.0, i64 %789
  %791 = load i8* %790, align 1
  %792 = zext i8 %791 to i32
  br label %5023

; <label>:793                                     ; preds = %733
  %794 = getelementptr inbounds %struct.regnode* %scan.0, i32 0, i32 1
  %795 = load i8* %794, align 1
  %796 = zext i8 %795 to i32
  %797 = icmp eq i32 %796, 20
  br i1 %797, label %798, label %812

; <label>:798                                     ; preds = %793
  %799 = icmp sge i32 %nextchr.0, 65
  br i1 %799, label %800, label %802

; <label>:800                                     ; preds = %798
  %801 = icmp sle i32 %nextchr.0, 90
  br i1 %801, label %826, label %802

; <label>:802                                     ; preds = %800, %798
  %803 = icmp sge i32 %nextchr.0, 97
  br i1 %803, label %804, label %806

; <label>:804                                     ; preds = %802
  %805 = icmp sle i32 %nextchr.0, 122
  br i1 %805, label %826, label %806

; <label>:806                                     ; preds = %804, %802
  %807 = icmp sge i32 %nextchr.0, 48
  br i1 %807, label %808, label %810

; <label>:808                                     ; preds = %806
  %809 = icmp sle i32 %nextchr.0, 57
  br i1 %809, label %826, label %810

; <label>:810                                     ; preds = %808, %806
  %811 = icmp eq i32 %nextchr.0, 95
  br i1 %811, label %826, label %827

; <label>:812                                     ; preds = %793
  %813 = and i32 %nextchr.0, -128
  %814 = icmp eq i32 %813, 0
  br i1 %814, label %815, label %827

; <label>:815                                     ; preds = %812
  %816 = sext i32 %nextchr.0 to i64
  %817 = call i16** @__ctype_b_loc()
  %818 = load i16** %817, align 8
  %819 = getelementptr inbounds i16* %818, i64 %816
  %820 = load i16* %819, align 2
  %821 = zext i16 %820 to i32
  %822 = and i32 %821, 8
  %823 = icmp ne i32 %822, 0
  br i1 %823, label %826, label %824

; <label>:824                                     ; preds = %815
  %825 = icmp eq i32 %nextchr.0, 95
  br i1 %825, label %826, label %827

; <label>:826                                     ; preds = %824, %815, %810, %808, %804, %800
  br label %5029

; <label>:827                                     ; preds = %824, %812, %810
  %828 = getelementptr inbounds i8* %locinput.0, i32 1
  %829 = load i8* %828, align 1
  %830 = zext i8 %829 to i32
  br label %5023

; <label>:831                                     ; preds = %15, %15
  %832 = load i32* @PL_reg_flags, align 4
  %833 = or i32 %832, 1
  store i32 %833, i32* @PL_reg_flags, align 4
  br label %834

; <label>:834                                     ; preds = %831, %15, %15
  %835 = icmp ne i8 %2, 0
  br i1 %835, label %836, label %933

; <label>:836                                     ; preds = %834
  %837 = load i8** @PL_bostr, align 8
  %838 = icmp eq i8* %locinput.0, %837
  br i1 %838, label %839, label %840

; <label>:839                                     ; preds = %836
  br label %852

; <label>:840                                     ; preds = %836
  %841 = load i8** @PL_bostr, align 8
  %842 = call i32 (i8*, i32, i8*, ...)* bitcast (i32 (...)* @reghop3 to i32 (i8*, i32, i8*, ...)*)(i8* %locinput.0, i32 -1, i8* %841)
  %843 = sext i32 %842 to i64
  %844 = inttoptr i64 %843 to i8*
  %845 = load i8* %844, align 1
  %846 = zext i8 %845 to i64
  %847 = getelementptr inbounds [0 x i8]* @PL_utf8skip, i32 0, i64 %846
  %848 = load i8* %847, align 1
  %849 = zext i8 %848 to i64
  %850 = call i64 @Perl_utf8n_to_uvuni(i8* %844, i64 %849, i64* null, i32 0)
  %851 = trunc i64 %850 to i32
  br label %852

; <label>:852                                     ; preds = %840, %839
  %ln.1 = phi i32 [ 10, %839 ], [ %851, %840 ]
  %853 = getelementptr inbounds %struct.regnode* %scan.0, i32 0, i32 1
  %854 = load i8* %853, align 1
  %855 = zext i8 %854 to i32
  %856 = icmp eq i32 %855, 9
  br i1 %856, label %862, label %857

; <label>:857                                     ; preds = %852
  %858 = getelementptr inbounds %struct.regnode* %scan.0, i32 0, i32 1
  %859 = load i8* %858, align 1
  %860 = zext i8 %859 to i32
  %861 = icmp eq i32 %860, 11
  br i1 %861, label %862, label %874

; <label>:862                                     ; preds = %857, %852
  %863 = sext i32 %ln.1 to i64
  %864 = call signext i8 @Perl_is_uni_alnum(i64 %863)
  %865 = sext i8 %864 to i32
  %866 = load %struct.sv** @PL_utf8_alnum, align 8
  %867 = icmp ne %struct.sv* %866, null
  br i1 %867, label %870, label %868

; <label>:868                                     ; preds = %862
  call void @Perl_push_scope()
  call void @Perl_save_re_context()
  %869 = call signext i8 @Perl_is_utf8_alnum(i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0))
  call void @Perl_pop_scope()
  br label %870

; <label>:870                                     ; preds = %868, %862
  %871 = load %struct.sv** @PL_utf8_alnum, align 8
  %872 = call i64 @Perl_swash_fetch(%struct.sv* %871, i8* %locinput.0, i8 signext %2)
  %873 = trunc i64 %872 to i32
  br label %932

; <label>:874                                     ; preds = %857
  %875 = icmp slt i32 %ln.1, 256
  br i1 %875, label %876, label %895

; <label>:876                                     ; preds = %874
  %877 = and i32 %ln.1, -128
  %878 = icmp eq i32 %877, 0
  br i1 %878, label %879, label %892

; <label>:879                                     ; preds = %876
  %880 = sext i32 %ln.1 to i64
  %881 = call i16** @__ctype_b_loc()
  %882 = load i16** %881, align 8
  %883 = getelementptr inbounds i16* %882, i64 %880
  %884 = load i16* %883, align 2
  %885 = zext i16 %884 to i32
  %886 = and i32 %885, 8
  %887 = icmp ne i32 %886, 0
  br i1 %887, label %890, label %888

; <label>:888                                     ; preds = %879
  %889 = icmp eq i32 %ln.1, 95
  br label %890

; <label>:890                                     ; preds = %888, %879
  %891 = phi i1 [ true, %879 ], [ %889, %888 ]
  br label %892

; <label>:892                                     ; preds = %890, %876
  %893 = phi i1 [ false, %876 ], [ %891, %890 ]
  %894 = zext i1 %893 to i32
  br label %899

; <label>:895                                     ; preds = %874
  %896 = sext i32 %ln.1 to i64
  %897 = call signext i8 @Perl_is_uni_alnum_lc(i64 %896)
  %898 = sext i8 %897 to i32
  br label %899

; <label>:899                                     ; preds = %895, %892
  %900 = phi i32 [ %894, %892 ], [ %898, %895 ]
  %901 = call i64 @Perl_utf8_to_uvchr(i8* %locinput.0, i64* null)
  %902 = icmp ult i64 %901, 256
  br i1 %902, label %903, label %926

; <label>:903                                     ; preds = %899
  %904 = call i64 @Perl_utf8_to_uvchr(i8* %locinput.0, i64* null)
  %905 = and i64 %904, -128
  %906 = icmp eq i64 %905, 0
  br i1 %906, label %907, label %923

; <label>:907                                     ; preds = %903
  %908 = call i64 @Perl_utf8_to_uvchr(i8* %locinput.0, i64* null)
  %909 = trunc i64 %908 to i32
  %910 = sext i32 %909 to i64
  %911 = call i16** @__ctype_b_loc()
  %912 = load i16** %911, align 8
  %913 = getelementptr inbounds i16* %912, i64 %910
  %914 = load i16* %913, align 2
  %915 = zext i16 %914 to i32
  %916 = and i32 %915, 8
  %917 = icmp ne i32 %916, 0
  br i1 %917, label %921, label %918

; <label>:918                                     ; preds = %907
  %919 = call i64 @Perl_utf8_to_uvchr(i8* %locinput.0, i64* null)
  %920 = icmp eq i64 %919, 95
  br label %921

; <label>:921                                     ; preds = %918, %907
  %922 = phi i1 [ true, %907 ], [ %920, %918 ]
  br label %923

; <label>:923                                     ; preds = %921, %903
  %924 = phi i1 [ false, %903 ], [ %922, %921 ]
  %925 = zext i1 %924 to i32
  br label %930

; <label>:926                                     ; preds = %899
  %927 = call i64 @Perl_utf8_to_uvchr(i8* %locinput.0, i64* null)
  %928 = call signext i8 @Perl_is_uni_alnum_lc(i64 %927)
  %929 = sext i8 %928 to i32
  br label %930

; <label>:930                                     ; preds = %926, %923
  %931 = phi i32 [ %925, %923 ], [ %929, %926 ]
  br label %932

; <label>:932                                     ; preds = %930, %870
  %ln.2 = phi i32 [ %865, %870 ], [ %900, %930 ]
  %n.0 = phi i32 [ %873, %870 ], [ %931, %930 ]
  br label %1023

; <label>:933                                     ; preds = %834
  %934 = load i8** @PL_bostr, align 8
  %935 = icmp ne i8* %locinput.0, %934
  br i1 %935, label %936, label %940

; <label>:936                                     ; preds = %933
  %937 = getelementptr inbounds i8* %locinput.0, i64 -1
  %938 = load i8* %937, align 1
  %939 = zext i8 %938 to i32
  br label %941

; <label>:940                                     ; preds = %933
  br label %941

; <label>:941                                     ; preds = %940, %936
  %942 = phi i32 [ %939, %936 ], [ 10, %940 ]
  %943 = getelementptr inbounds %struct.regnode* %scan.0, i32 0, i32 1
  %944 = load i8* %943, align 1
  %945 = zext i8 %944 to i32
  %946 = icmp eq i32 %945, 9
  br i1 %946, label %952, label %947

; <label>:947                                     ; preds = %941
  %948 = getelementptr inbounds %struct.regnode* %scan.0, i32 0, i32 1
  %949 = load i8* %948, align 1
  %950 = zext i8 %949 to i32
  %951 = icmp eq i32 %950, 11
  br i1 %951, label %952, label %985

; <label>:952                                     ; preds = %947, %941
  %953 = icmp sge i32 %942, 65
  br i1 %953, label %954, label %956

; <label>:954                                     ; preds = %952
  %955 = icmp sle i32 %942, 90
  br i1 %955, label %966, label %956

; <label>:956                                     ; preds = %954, %952
  %957 = icmp sge i32 %942, 97
  br i1 %957, label %958, label %960

; <label>:958                                     ; preds = %956
  %959 = icmp sle i32 %942, 122
  br i1 %959, label %966, label %960

; <label>:960                                     ; preds = %958, %956
  %961 = icmp sge i32 %942, 48
  br i1 %961, label %962, label %964

; <label>:962                                     ; preds = %960
  %963 = icmp sle i32 %942, 57
  br i1 %963, label %966, label %964

; <label>:964                                     ; preds = %962, %960
  %965 = icmp eq i32 %942, 95
  br label %966

; <label>:966                                     ; preds = %964, %962, %958, %954
  %967 = phi i1 [ true, %962 ], [ true, %958 ], [ true, %954 ], [ %965, %964 ]
  %968 = zext i1 %967 to i32
  %969 = icmp sge i32 %nextchr.0, 65
  br i1 %969, label %970, label %972

; <label>:970                                     ; preds = %966
  %971 = icmp sle i32 %nextchr.0, 90
  br i1 %971, label %982, label %972

; <label>:972                                     ; preds = %970, %966
  %973 = icmp sge i32 %nextchr.0, 97
  br i1 %973, label %974, label %976

; <label>:974                                     ; preds = %972
  %975 = icmp sle i32 %nextchr.0, 122
  br i1 %975, label %982, label %976

; <label>:976                                     ; preds = %974, %972
  %977 = icmp sge i32 %nextchr.0, 48
  br i1 %977, label %978, label %980

; <label>:978                                     ; preds = %976
  %979 = icmp sle i32 %nextchr.0, 57
  br i1 %979, label %982, label %980

; <label>:980                                     ; preds = %978, %976
  %981 = icmp eq i32 %nextchr.0, 95
  br label %982

; <label>:982                                     ; preds = %980, %978, %974, %970
  %983 = phi i1 [ true, %978 ], [ true, %974 ], [ true, %970 ], [ %981, %980 ]
  %984 = zext i1 %983 to i32
  br label %1022

; <label>:985                                     ; preds = %947
  %986 = and i32 %942, -128
  %987 = icmp eq i32 %986, 0
  br i1 %987, label %988, label %1001

; <label>:988                                     ; preds = %985
  %989 = sext i32 %942 to i64
  %990 = call i16** @__ctype_b_loc()
  %991 = load i16** %990, align 8
  %992 = getelementptr inbounds i16* %991, i64 %989
  %993 = load i16* %992, align 2
  %994 = zext i16 %993 to i32
  %995 = and i32 %994, 8
  %996 = icmp ne i32 %995, 0
  br i1 %996, label %999, label %997

; <label>:997                                     ; preds = %988
  %998 = icmp eq i32 %942, 95
  br label %999

; <label>:999                                     ; preds = %997, %988
  %1000 = phi i1 [ true, %988 ], [ %998, %997 ]
  br label %1001

; <label>:1001                                    ; preds = %999, %985
  %1002 = phi i1 [ false, %985 ], [ %1000, %999 ]
  %1003 = zext i1 %1002 to i32
  %1004 = and i32 %nextchr.0, -128
  %1005 = icmp eq i32 %1004, 0
  br i1 %1005, label %1006, label %1019

; <label>:1006                                    ; preds = %1001
  %1007 = sext i32 %nextchr.0 to i64
  %1008 = call i16** @__ctype_b_loc()
  %1009 = load i16** %1008, align 8
  %1010 = getelementptr inbounds i16* %1009, i64 %1007
  %1011 = load i16* %1010, align 2
  %1012 = zext i16 %1011 to i32
  %1013 = and i32 %1012, 8
  %1014 = icmp ne i32 %1013, 0
  br i1 %1014, label %1017, label %1015

; <label>:1015                                    ; preds = %1006
  %1016 = icmp eq i32 %nextchr.0, 95
  br label %1017

; <label>:1017                                    ; preds = %1015, %1006
  %1018 = phi i1 [ true, %1006 ], [ %1016, %1015 ]
  br label %1019

; <label>:1019                                    ; preds = %1017, %1001
  %1020 = phi i1 [ false, %1001 ], [ %1018, %1017 ]
  %1021 = zext i1 %1020 to i32
  br label %1022

; <label>:1022                                    ; preds = %1019, %982
  %ln.3 = phi i32 [ %968, %982 ], [ %1003, %1019 ]
  %n.1 = phi i32 [ %984, %982 ], [ %1021, %1019 ]
  br label %1023

; <label>:1023                                    ; preds = %1022, %932
  %ln.4 = phi i32 [ %ln.2, %932 ], [ %ln.3, %1022 ]
  %n.2 = phi i32 [ %n.0, %932 ], [ %n.1, %1022 ]
  %1024 = icmp ne i32 %ln.4, 0
  %1025 = xor i1 %1024, true
  %1026 = zext i1 %1025 to i32
  %1027 = icmp ne i32 %n.2, 0
  %1028 = xor i1 %1027, true
  %1029 = zext i1 %1028 to i32
  %1030 = icmp eq i32 %1026, %1029
  %1031 = zext i1 %1030 to i32
  %1032 = getelementptr inbounds %struct.regnode* %scan.0, i32 0, i32 1
  %1033 = load i8* %1032, align 1
  %1034 = zext i8 %1033 to i32
  %1035 = icmp eq i32 %1034, 9
  br i1 %1035, label %1041, label %1036

; <label>:1036                                    ; preds = %1023
  %1037 = getelementptr inbounds %struct.regnode* %scan.0, i32 0, i32 1
  %1038 = load i8* %1037, align 1
  %1039 = zext i8 %1038 to i32
  %1040 = icmp eq i32 %1039, 10
  br label %1041

; <label>:1041                                    ; preds = %1036, %1023
  %1042 = phi i1 [ true, %1023 ], [ %1040, %1036 ]
  %1043 = zext i1 %1042 to i32
  %1044 = icmp eq i32 %1031, %1043
  br i1 %1044, label %1045, label %1046

; <label>:1045                                    ; preds = %1041
  br label %5029

; <label>:1046                                    ; preds = %1041
  br label %5023

; <label>:1047                                    ; preds = %15
  %1048 = load i32* @PL_reg_flags, align 4
  %1049 = or i32 %1048, 1
  store i32 %1049, i32* @PL_reg_flags, align 4
  br label %1050

; <label>:1050                                    ; preds = %1047, %15
  %1051 = icmp ne i32 %nextchr.0, 0
  br i1 %1051, label %1053, label %1052

; <label>:1052                                    ; preds = %1050
  br label %5029

; <label>:1053                                    ; preds = %1050
  %1054 = icmp ne i8 %2, 0
  br i1 %1054, label %1055, label %1145

; <label>:1055                                    ; preds = %1053
  %1056 = trunc i32 %nextchr.0 to i8
  %1057 = zext i8 %1056 to i32
  %1058 = and i32 %1057, 128
  %1059 = icmp ne i32 %1058, 0
  br i1 %1059, label %1060, label %1113

; <label>:1060                                    ; preds = %1055
  %1061 = load %struct.sv** @PL_utf8_space, align 8
  %1062 = icmp ne %struct.sv* %1061, null
  br i1 %1062, label %1065, label %1063

; <label>:1063                                    ; preds = %1060
  call void @Perl_push_scope()
  call void @Perl_save_re_context()
  %1064 = call signext i8 @Perl_is_utf8_space(i8* getelementptr inbounds ([2 x i8]* @.str3, i32 0, i32 0))
  call void @Perl_pop_scope()
  br label %1065

; <label>:1065                                    ; preds = %1063, %1060
  %1066 = getelementptr inbounds %struct.regnode* %scan.0, i32 0, i32 1
  %1067 = load i8* %1066, align 1
  %1068 = zext i8 %1067 to i32
  %1069 = icmp eq i32 %1068, 22
  br i1 %1069, label %1070, label %1074

; <label>:1070                                    ; preds = %1065
  %1071 = load %struct.sv** @PL_utf8_space, align 8
  %1072 = call i64 @Perl_swash_fetch(%struct.sv* %1071, i8* %locinput.0, i8 signext %2)
  %1073 = icmp ne i64 %1072, 0
  br i1 %1073, label %1104, label %1103

; <label>:1074                                    ; preds = %1065
  %1075 = call i64 @Perl_utf8_to_uvchr(i8* %locinput.0, i64* null)
  %1076 = icmp ult i64 %1075, 256
  br i1 %1076, label %1077, label %1095

; <label>:1077                                    ; preds = %1074
  %1078 = call i64 @Perl_utf8_to_uvchr(i8* %locinput.0, i64* null)
  %1079 = and i64 %1078, -128
  %1080 = icmp eq i64 %1079, 0
  br i1 %1080, label %1081, label %1092

; <label>:1081                                    ; preds = %1077
  %1082 = call i64 @Perl_utf8_to_uvchr(i8* %locinput.0, i64* null)
  %1083 = trunc i64 %1082 to i32
  %1084 = sext i32 %1083 to i64
  %1085 = call i16** @__ctype_b_loc()
  %1086 = load i16** %1085, align 8
  %1087 = getelementptr inbounds i16* %1086, i64 %1084
  %1088 = load i16* %1087, align 2
  %1089 = zext i16 %1088 to i32
  %1090 = and i32 %1089, 8192
  %1091 = icmp ne i32 %1090, 0
  br label %1092

; <label>:1092                                    ; preds = %1081, %1077
  %1093 = phi i1 [ false, %1077 ], [ %1091, %1081 ]
  %1094 = zext i1 %1093 to i32
  br label %1099

; <label>:1095                                    ; preds = %1074
  %1096 = call i64 @Perl_utf8_to_uvchr(i8* %locinput.0, i64* null)
  %1097 = call signext i8 @Perl_is_uni_space_lc(i64 %1096)
  %1098 = sext i8 %1097 to i32
  br label %1099

; <label>:1099                                    ; preds = %1095, %1092
  %1100 = phi i32 [ %1094, %1092 ], [ %1098, %1095 ]
  %1101 = sext i32 %1100 to i64
  %1102 = icmp ne i64 %1101, 0
  br i1 %1102, label %1104, label %1103

; <label>:1103                                    ; preds = %1099, %1070
  br label %5029

; <label>:1104                                    ; preds = %1099, %1070
  %1105 = sext i32 %nextchr.0 to i64
  %1106 = getelementptr inbounds [0 x i8]* @PL_utf8skip, i32 0, i64 %1105
  %1107 = load i8* %1106, align 1
  %1108 = zext i8 %1107 to i32
  %1109 = sext i32 %1108 to i64
  %1110 = getelementptr inbounds i8* %locinput.0, i64 %1109
  %1111 = load i8* %1110, align 1
  %1112 = zext i8 %1111 to i32
  br label %5023

; <label>:1113                                    ; preds = %1055
  %1114 = getelementptr inbounds %struct.regnode* %scan.0, i32 0, i32 1
  %1115 = load i8* %1114, align 1
  %1116 = zext i8 %1115 to i32
  %1117 = icmp eq i32 %1116, 22
  br i1 %1117, label %1118, label %1128

; <label>:1118                                    ; preds = %1113
  %1119 = icmp eq i32 %nextchr.0, 32
  br i1 %1119, label %1141, label %1120

; <label>:1120                                    ; preds = %1118
  %1121 = icmp eq i32 %nextchr.0, 9
  br i1 %1121, label %1141, label %1122

; <label>:1122                                    ; preds = %1120
  %1123 = icmp eq i32 %nextchr.0, 10
  br i1 %1123, label %1141, label %1124

; <label>:1124                                    ; preds = %1122
  %1125 = icmp eq i32 %nextchr.0, 13
  br i1 %1125, label %1141, label %1126

; <label>:1126                                    ; preds = %1124
  %1127 = icmp eq i32 %nextchr.0, 12
  br i1 %1127, label %1141, label %1140

; <label>:1128                                    ; preds = %1113
  %1129 = and i32 %nextchr.0, -128
  %1130 = icmp eq i32 %1129, 0
  br i1 %1130, label %1131, label %1140

; <label>:1131                                    ; preds = %1128
  %1132 = sext i32 %nextchr.0 to i64
  %1133 = call i16** @__ctype_b_loc()
  %1134 = load i16** %1133, align 8
  %1135 = getelementptr inbounds i16* %1134, i64 %1132
  %1136 = load i16* %1135, align 2
  %1137 = zext i16 %1136 to i32
  %1138 = and i32 %1137, 8192
  %1139 = icmp ne i32 %1138, 0
  br i1 %1139, label %1141, label %1140

; <label>:1140                                    ; preds = %1131, %1128, %1126
  br label %5029

; <label>:1141                                    ; preds = %1131, %1126, %1124, %1122, %1120, %1118
  %1142 = getelementptr inbounds i8* %locinput.0, i32 1
  %1143 = load i8* %1142, align 1
  %1144 = zext i8 %1143 to i32
  br label %1177

; <label>:1145                                    ; preds = %1053
  %1146 = getelementptr inbounds %struct.regnode* %scan.0, i32 0, i32 1
  %1147 = load i8* %1146, align 1
  %1148 = zext i8 %1147 to i32
  %1149 = icmp eq i32 %1148, 22
  br i1 %1149, label %1150, label %1160

; <label>:1150                                    ; preds = %1145
  %1151 = icmp eq i32 %nextchr.0, 32
  br i1 %1151, label %1173, label %1152

; <label>:1152                                    ; preds = %1150
  %1153 = icmp eq i32 %nextchr.0, 9
  br i1 %1153, label %1173, label %1154

; <label>:1154                                    ; preds = %1152
  %1155 = icmp eq i32 %nextchr.0, 10
  br i1 %1155, label %1173, label %1156

; <label>:1156                                    ; preds = %1154
  %1157 = icmp eq i32 %nextchr.0, 13
  br i1 %1157, label %1173, label %1158

; <label>:1158                                    ; preds = %1156
  %1159 = icmp eq i32 %nextchr.0, 12
  br i1 %1159, label %1173, label %1172

; <label>:1160                                    ; preds = %1145
  %1161 = and i32 %nextchr.0, -128
  %1162 = icmp eq i32 %1161, 0
  br i1 %1162, label %1163, label %1172

; <label>:1163                                    ; preds = %1160
  %1164 = sext i32 %nextchr.0 to i64
  %1165 = call i16** @__ctype_b_loc()
  %1166 = load i16** %1165, align 8
  %1167 = getelementptr inbounds i16* %1166, i64 %1164
  %1168 = load i16* %1167, align 2
  %1169 = zext i16 %1168 to i32
  %1170 = and i32 %1169, 8192
  %1171 = icmp ne i32 %1170, 0
  br i1 %1171, label %1173, label %1172

; <label>:1172                                    ; preds = %1163, %1160, %1158
  br label %5029

; <label>:1173                                    ; preds = %1163, %1158, %1156, %1154, %1152, %1150
  %1174 = getelementptr inbounds i8* %locinput.0, i32 1
  %1175 = load i8* %1174, align 1
  %1176 = zext i8 %1175 to i32
  br label %1177

; <label>:1177                                    ; preds = %1173, %1141
  %locinput.3 = phi i8* [ %1142, %1141 ], [ %1174, %1173 ]
  %nextchr.4 = phi i32 [ %1144, %1141 ], [ %1176, %1173 ]
  br label %5023

; <label>:1178                                    ; preds = %15
  %1179 = load i32* @PL_reg_flags, align 4
  %1180 = or i32 %1179, 1
  store i32 %1180, i32* @PL_reg_flags, align 4
  br label %1181

; <label>:1181                                    ; preds = %1178, %15
  %1182 = icmp ne i32 %nextchr.0, 0
  br i1 %1182, label %1187, label %1183

; <label>:1183                                    ; preds = %1181
  %1184 = load i8** @PL_regeol, align 8
  %1185 = icmp uge i8* %locinput.0, %1184
  br i1 %1185, label %1186, label %1187

; <label>:1186                                    ; preds = %1183
  br label %5029

; <label>:1187                                    ; preds = %1183, %1181
  %1188 = icmp ne i8 %2, 0
  br i1 %1188, label %1189, label %1242

; <label>:1189                                    ; preds = %1187
  %1190 = load %struct.sv** @PL_utf8_space, align 8
  %1191 = icmp ne %struct.sv* %1190, null
  br i1 %1191, label %1194, label %1192

; <label>:1192                                    ; preds = %1189
  call void @Perl_push_scope()
  call void @Perl_save_re_context()
  %1193 = call signext i8 @Perl_is_utf8_space(i8* getelementptr inbounds ([2 x i8]* @.str3, i32 0, i32 0))
  call void @Perl_pop_scope()
  br label %1194

; <label>:1194                                    ; preds = %1192, %1189
  %1195 = getelementptr inbounds %struct.regnode* %scan.0, i32 0, i32 1
  %1196 = load i8* %1195, align 1
  %1197 = zext i8 %1196 to i32
  %1198 = icmp eq i32 %1197, 24
  br i1 %1198, label %1199, label %1203

; <label>:1199                                    ; preds = %1194
  %1200 = load %struct.sv** @PL_utf8_space, align 8
  %1201 = call i64 @Perl_swash_fetch(%struct.sv* %1200, i8* %locinput.0, i8 signext %2)
  %1202 = icmp ne i64 %1201, 0
  br i1 %1202, label %1232, label %1233

; <label>:1203                                    ; preds = %1194
  %1204 = call i64 @Perl_utf8_to_uvchr(i8* %locinput.0, i64* null)
  %1205 = icmp ult i64 %1204, 256
  br i1 %1205, label %1206, label %1224

; <label>:1206                                    ; preds = %1203
  %1207 = call i64 @Perl_utf8_to_uvchr(i8* %locinput.0, i64* null)
  %1208 = and i64 %1207, -128
  %1209 = icmp eq i64 %1208, 0
  br i1 %1209, label %1210, label %1221

; <label>:1210                                    ; preds = %1206
  %1211 = call i64 @Perl_utf8_to_uvchr(i8* %locinput.0, i64* null)
  %1212 = trunc i64 %1211 to i32
  %1213 = sext i32 %1212 to i64
  %1214 = call i16** @__ctype_b_loc()
  %1215 = load i16** %1214, align 8
  %1216 = getelementptr inbounds i16* %1215, i64 %1213
  %1217 = load i16* %1216, align 2
  %1218 = zext i16 %1217 to i32
  %1219 = and i32 %1218, 8192
  %1220 = icmp ne i32 %1219, 0
  br label %1221

; <label>:1221                                    ; preds = %1210, %1206
  %1222 = phi i1 [ false, %1206 ], [ %1220, %1210 ]
  %1223 = zext i1 %1222 to i32
  br label %1228

; <label>:1224                                    ; preds = %1203
  %1225 = call i64 @Perl_utf8_to_uvchr(i8* %locinput.0, i64* null)
  %1226 = call signext i8 @Perl_is_uni_space_lc(i64 %1225)
  %1227 = sext i8 %1226 to i32
  br label %1228

; <label>:1228                                    ; preds = %1224, %1221
  %1229 = phi i32 [ %1223, %1221 ], [ %1227, %1224 ]
  %1230 = sext i32 %1229 to i64
  %1231 = icmp ne i64 %1230, 0
  br i1 %1231, label %1232, label %1233

; <label>:1232                                    ; preds = %1228, %1199
  br label %5029

; <label>:1233                                    ; preds = %1228, %1199
  %1234 = sext i32 %nextchr.0 to i64
  %1235 = getelementptr inbounds [0 x i8]* @PL_utf8skip, i32 0, i64 %1234
  %1236 = load i8* %1235, align 1
  %1237 = zext i8 %1236 to i32
  %1238 = sext i32 %1237 to i64
  %1239 = getelementptr inbounds i8* %locinput.0, i64 %1238
  %1240 = load i8* %1239, align 1
  %1241 = zext i8 %1240 to i32
  br label %5023

; <label>:1242                                    ; preds = %1187
  %1243 = getelementptr inbounds %struct.regnode* %scan.0, i32 0, i32 1
  %1244 = load i8* %1243, align 1
  %1245 = zext i8 %1244 to i32
  %1246 = icmp eq i32 %1245, 24
  br i1 %1246, label %1247, label %1257

; <label>:1247                                    ; preds = %1242
  %1248 = icmp eq i32 %nextchr.0, 32
  br i1 %1248, label %1269, label %1249

; <label>:1249                                    ; preds = %1247
  %1250 = icmp eq i32 %nextchr.0, 9
  br i1 %1250, label %1269, label %1251

; <label>:1251                                    ; preds = %1249
  %1252 = icmp eq i32 %nextchr.0, 10
  br i1 %1252, label %1269, label %1253

; <label>:1253                                    ; preds = %1251
  %1254 = icmp eq i32 %nextchr.0, 13
  br i1 %1254, label %1269, label %1255

; <label>:1255                                    ; preds = %1253
  %1256 = icmp eq i32 %nextchr.0, 12
  br i1 %1256, label %1269, label %1270

; <label>:1257                                    ; preds = %1242
  %1258 = and i32 %nextchr.0, -128
  %1259 = icmp eq i32 %1258, 0
  br i1 %1259, label %1260, label %1270

; <label>:1260                                    ; preds = %1257
  %1261 = sext i32 %nextchr.0 to i64
  %1262 = call i16** @__ctype_b_loc()
  %1263 = load i16** %1262, align 8
  %1264 = getelementptr inbounds i16* %1263, i64 %1261
  %1265 = load i16* %1264, align 2
  %1266 = zext i16 %1265 to i32
  %1267 = and i32 %1266, 8192
  %1268 = icmp ne i32 %1267, 0
  br i1 %1268, label %1269, label %1270

; <label>:1269                                    ; preds = %1260, %1255, %1253, %1251, %1249, %1247
  br label %5029

; <label>:1270                                    ; preds = %1260, %1257, %1255
  %1271 = getelementptr inbounds i8* %locinput.0, i32 1
  %1272 = load i8* %1271, align 1
  %1273 = zext i8 %1272 to i32
  br label %5023

; <label>:1274                                    ; preds = %15
  %1275 = load i32* @PL_reg_flags, align 4
  %1276 = or i32 %1275, 1
  store i32 %1276, i32* @PL_reg_flags, align 4
  br label %1277

; <label>:1277                                    ; preds = %1274, %15
  %1278 = icmp ne i32 %nextchr.0, 0
  br i1 %1278, label %1280, label %1279

; <label>:1279                                    ; preds = %1277
  br label %5029

; <label>:1280                                    ; preds = %1277
  %1281 = icmp ne i8 %2, 0
  br i1 %1281, label %1282, label %1335

; <label>:1282                                    ; preds = %1280
  %1283 = load %struct.sv** @PL_utf8_digit, align 8
  %1284 = icmp ne %struct.sv* %1283, null
  br i1 %1284, label %1287, label %1285

; <label>:1285                                    ; preds = %1282
  call void @Perl_push_scope()
  call void @Perl_save_re_context()
  %1286 = call signext i8 @Perl_is_utf8_digit(i8* getelementptr inbounds ([2 x i8]* @.str4, i32 0, i32 0))
  call void @Perl_pop_scope()
  br label %1287

; <label>:1287                                    ; preds = %1285, %1282
  %1288 = getelementptr inbounds %struct.regnode* %scan.0, i32 0, i32 1
  %1289 = load i8* %1288, align 1
  %1290 = zext i8 %1289 to i32
  %1291 = icmp eq i32 %1290, 26
  br i1 %1291, label %1292, label %1296

; <label>:1292                                    ; preds = %1287
  %1293 = load %struct.sv** @PL_utf8_digit, align 8
  %1294 = call i64 @Perl_swash_fetch(%struct.sv* %1293, i8* %locinput.0, i8 signext %2)
  %1295 = icmp ne i64 %1294, 0
  br i1 %1295, label %1326, label %1325

; <label>:1296                                    ; preds = %1287
  %1297 = call i64 @Perl_utf8_to_uvchr(i8* %locinput.0, i64* null)
  %1298 = icmp ult i64 %1297, 256
  br i1 %1298, label %1299, label %1317

; <label>:1299                                    ; preds = %1296
  %1300 = call i64 @Perl_utf8_to_uvchr(i8* %locinput.0, i64* null)
  %1301 = and i64 %1300, -128
  %1302 = icmp eq i64 %1301, 0
  br i1 %1302, label %1303, label %1314

; <label>:1303                                    ; preds = %1299
  %1304 = call i64 @Perl_utf8_to_uvchr(i8* %locinput.0, i64* null)
  %1305 = trunc i64 %1304 to i32
  %1306 = sext i32 %1305 to i64
  %1307 = call i16** @__ctype_b_loc()
  %1308 = load i16** %1307, align 8
  %1309 = getelementptr inbounds i16* %1308, i64 %1306
  %1310 = load i16* %1309, align 2
  %1311 = zext i16 %1310 to i32
  %1312 = and i32 %1311, 2048
  %1313 = icmp ne i32 %1312, 0
  br label %1314

; <label>:1314                                    ; preds = %1303, %1299
  %1315 = phi i1 [ false, %1299 ], [ %1313, %1303 ]
  %1316 = zext i1 %1315 to i32
  br label %1321

; <label>:1317                                    ; preds = %1296
  %1318 = call i64 @Perl_utf8_to_uvchr(i8* %locinput.0, i64* null)
  %1319 = call signext i8 @Perl_is_uni_digit_lc(i64 %1318)
  %1320 = sext i8 %1319 to i32
  br label %1321

; <label>:1321                                    ; preds = %1317, %1314
  %1322 = phi i32 [ %1316, %1314 ], [ %1320, %1317 ]
  %1323 = sext i32 %1322 to i64
  %1324 = icmp ne i64 %1323, 0
  br i1 %1324, label %1326, label %1325

; <label>:1325                                    ; preds = %1321, %1292
  br label %5029

; <label>:1326                                    ; preds = %1321, %1292
  %1327 = sext i32 %nextchr.0 to i64
  %1328 = getelementptr inbounds [0 x i8]* @PL_utf8skip, i32 0, i64 %1327
  %1329 = load i8* %1328, align 1
  %1330 = zext i8 %1329 to i32
  %1331 = sext i32 %1330 to i64
  %1332 = getelementptr inbounds i8* %locinput.0, i64 %1331
  %1333 = load i8* %1332, align 1
  %1334 = zext i8 %1333 to i32
  br label %5023

; <label>:1335                                    ; preds = %1280
  %1336 = getelementptr inbounds %struct.regnode* %scan.0, i32 0, i32 1
  %1337 = load i8* %1336, align 1
  %1338 = zext i8 %1337 to i32
  %1339 = icmp eq i32 %1338, 26
  br i1 %1339, label %1340, label %1344

; <label>:1340                                    ; preds = %1335
  %1341 = icmp sge i32 %nextchr.0, 48
  br i1 %1341, label %1342, label %1356

; <label>:1342                                    ; preds = %1340
  %1343 = icmp sle i32 %nextchr.0, 57
  br i1 %1343, label %1357, label %1356

; <label>:1344                                    ; preds = %1335
  %1345 = and i32 %nextchr.0, -128
  %1346 = icmp eq i32 %1345, 0
  br i1 %1346, label %1347, label %1356

; <label>:1347                                    ; preds = %1344
  %1348 = sext i32 %nextchr.0 to i64
  %1349 = call i16** @__ctype_b_loc()
  %1350 = load i16** %1349, align 8
  %1351 = getelementptr inbounds i16* %1350, i64 %1348
  %1352 = load i16* %1351, align 2
  %1353 = zext i16 %1352 to i32
  %1354 = and i32 %1353, 2048
  %1355 = icmp ne i32 %1354, 0
  br i1 %1355, label %1357, label %1356

; <label>:1356                                    ; preds = %1347, %1344, %1342, %1340
  br label %5029

; <label>:1357                                    ; preds = %1347, %1342
  %1358 = getelementptr inbounds i8* %locinput.0, i32 1
  %1359 = load i8* %1358, align 1
  %1360 = zext i8 %1359 to i32
  br label %5023

; <label>:1361                                    ; preds = %15
  %1362 = load i32* @PL_reg_flags, align 4
  %1363 = or i32 %1362, 1
  store i32 %1363, i32* @PL_reg_flags, align 4
  br label %1364

; <label>:1364                                    ; preds = %1361, %15
  %1365 = icmp ne i32 %nextchr.0, 0
  br i1 %1365, label %1370, label %1366

; <label>:1366                                    ; preds = %1364
  %1367 = load i8** @PL_regeol, align 8
  %1368 = icmp uge i8* %locinput.0, %1367
  br i1 %1368, label %1369, label %1370

; <label>:1369                                    ; preds = %1366
  br label %5029

; <label>:1370                                    ; preds = %1366, %1364
  %1371 = icmp ne i8 %2, 0
  br i1 %1371, label %1372, label %1425

; <label>:1372                                    ; preds = %1370
  %1373 = load %struct.sv** @PL_utf8_digit, align 8
  %1374 = icmp ne %struct.sv* %1373, null
  br i1 %1374, label %1377, label %1375

; <label>:1375                                    ; preds = %1372
  call void @Perl_push_scope()
  call void @Perl_save_re_context()
  %1376 = call signext i8 @Perl_is_utf8_digit(i8* getelementptr inbounds ([2 x i8]* @.str4, i32 0, i32 0))
  call void @Perl_pop_scope()
  br label %1377

; <label>:1377                                    ; preds = %1375, %1372
  %1378 = getelementptr inbounds %struct.regnode* %scan.0, i32 0, i32 1
  %1379 = load i8* %1378, align 1
  %1380 = zext i8 %1379 to i32
  %1381 = icmp eq i32 %1380, 28
  br i1 %1381, label %1382, label %1386

; <label>:1382                                    ; preds = %1377
  %1383 = load %struct.sv** @PL_utf8_digit, align 8
  %1384 = call i64 @Perl_swash_fetch(%struct.sv* %1383, i8* %locinput.0, i8 signext %2)
  %1385 = icmp ne i64 %1384, 0
  br i1 %1385, label %1415, label %1416

; <label>:1386                                    ; preds = %1377
  %1387 = call i64 @Perl_utf8_to_uvchr(i8* %locinput.0, i64* null)
  %1388 = icmp ult i64 %1387, 256
  br i1 %1388, label %1389, label %1407

; <label>:1389                                    ; preds = %1386
  %1390 = call i64 @Perl_utf8_to_uvchr(i8* %locinput.0, i64* null)
  %1391 = and i64 %1390, -128
  %1392 = icmp eq i64 %1391, 0
  br i1 %1392, label %1393, label %1404

; <label>:1393                                    ; preds = %1389
  %1394 = call i64 @Perl_utf8_to_uvchr(i8* %locinput.0, i64* null)
  %1395 = trunc i64 %1394 to i32
  %1396 = sext i32 %1395 to i64
  %1397 = call i16** @__ctype_b_loc()
  %1398 = load i16** %1397, align 8
  %1399 = getelementptr inbounds i16* %1398, i64 %1396
  %1400 = load i16* %1399, align 2
  %1401 = zext i16 %1400 to i32
  %1402 = and i32 %1401, 2048
  %1403 = icmp ne i32 %1402, 0
  br label %1404

; <label>:1404                                    ; preds = %1393, %1389
  %1405 = phi i1 [ false, %1389 ], [ %1403, %1393 ]
  %1406 = zext i1 %1405 to i32
  br label %1411

; <label>:1407                                    ; preds = %1386
  %1408 = call i64 @Perl_utf8_to_uvchr(i8* %locinput.0, i64* null)
  %1409 = call signext i8 @Perl_is_uni_digit_lc(i64 %1408)
  %1410 = sext i8 %1409 to i32
  br label %1411

; <label>:1411                                    ; preds = %1407, %1404
  %1412 = phi i32 [ %1406, %1404 ], [ %1410, %1407 ]
  %1413 = sext i32 %1412 to i64
  %1414 = icmp ne i64 %1413, 0
  br i1 %1414, label %1415, label %1416

; <label>:1415                                    ; preds = %1411, %1382
  br label %5029

; <label>:1416                                    ; preds = %1411, %1382
  %1417 = sext i32 %nextchr.0 to i64
  %1418 = getelementptr inbounds [0 x i8]* @PL_utf8skip, i32 0, i64 %1417
  %1419 = load i8* %1418, align 1
  %1420 = zext i8 %1419 to i32
  %1421 = sext i32 %1420 to i64
  %1422 = getelementptr inbounds i8* %locinput.0, i64 %1421
  %1423 = load i8* %1422, align 1
  %1424 = zext i8 %1423 to i32
  br label %5023

; <label>:1425                                    ; preds = %1370
  %1426 = getelementptr inbounds %struct.regnode* %scan.0, i32 0, i32 1
  %1427 = load i8* %1426, align 1
  %1428 = zext i8 %1427 to i32
  %1429 = icmp eq i32 %1428, 28
  br i1 %1429, label %1430, label %1434

; <label>:1430                                    ; preds = %1425
  %1431 = icmp sge i32 %nextchr.0, 48
  br i1 %1431, label %1432, label %1447

; <label>:1432                                    ; preds = %1430
  %1433 = icmp sle i32 %nextchr.0, 57
  br i1 %1433, label %1446, label %1447

; <label>:1434                                    ; preds = %1425
  %1435 = and i32 %nextchr.0, -128
  %1436 = icmp eq i32 %1435, 0
  br i1 %1436, label %1437, label %1447

; <label>:1437                                    ; preds = %1434
  %1438 = sext i32 %nextchr.0 to i64
  %1439 = call i16** @__ctype_b_loc()
  %1440 = load i16** %1439, align 8
  %1441 = getelementptr inbounds i16* %1440, i64 %1438
  %1442 = load i16* %1441, align 2
  %1443 = zext i16 %1442 to i32
  %1444 = and i32 %1443, 2048
  %1445 = icmp ne i32 %1444, 0
  br i1 %1445, label %1446, label %1447

; <label>:1446                                    ; preds = %1437, %1432
  br label %5029

; <label>:1447                                    ; preds = %1437, %1434, %1432, %1430
  %1448 = getelementptr inbounds i8* %locinput.0, i32 1
  %1449 = load i8* %1448, align 1
  %1450 = zext i8 %1449 to i32
  br label %5023

; <label>:1451                                    ; preds = %15
  %1452 = load i8** @PL_regeol, align 8
  %1453 = icmp uge i8* %locinput.0, %1452
  br i1 %1453, label %1454, label %1455

; <label>:1454                                    ; preds = %1451
  br label %5029

; <label>:1455                                    ; preds = %1451
  %1456 = icmp ne i8 %2, 0
  br i1 %1456, label %1457, label %1496

; <label>:1457                                    ; preds = %1455
  %1458 = load %struct.sv** @PL_utf8_mark, align 8
  %1459 = icmp ne %struct.sv* %1458, null
  br i1 %1459, label %1462, label %1460

; <label>:1460                                    ; preds = %1457
  call void @Perl_push_scope()
  call void @Perl_save_re_context()
  %1461 = call signext i8 @Perl_is_utf8_mark(i8* getelementptr inbounds ([2 x i8]* @.str5, i32 0, i32 0))
  call void @Perl_pop_scope()
  br label %1462

; <label>:1462                                    ; preds = %1460, %1457
  %1463 = load %struct.sv** @PL_utf8_mark, align 8
  %1464 = call i64 @Perl_swash_fetch(%struct.sv* %1463, i8* %locinput.0, i8 signext %2)
  %1465 = icmp ne i64 %1464, 0
  br i1 %1465, label %1466, label %1467

; <label>:1466                                    ; preds = %1462
  br label %5029

; <label>:1467                                    ; preds = %1462
  %1468 = sext i32 %nextchr.0 to i64
  %1469 = getelementptr inbounds [0 x i8]* @PL_utf8skip, i32 0, i64 %1468
  %1470 = load i8* %1469, align 1
  %1471 = zext i8 %1470 to i32
  %1472 = sext i32 %1471 to i64
  %1473 = getelementptr inbounds i8* %locinput.0, i64 %1472
  br label %1474

; <label>:1474                                    ; preds = %1483, %1467
  %locinput.4 = phi i8* [ %1473, %1467 ], [ %1490, %1483 ]
  %1475 = load i8** @PL_regeol, align 8
  %1476 = icmp ult i8* %locinput.4, %1475
  br i1 %1476, label %1477, label %1481

; <label>:1477                                    ; preds = %1474
  %1478 = load %struct.sv** @PL_utf8_mark, align 8
  %1479 = call i64 @Perl_swash_fetch(%struct.sv* %1478, i8* %locinput.4, i8 signext %2)
  %1480 = icmp ne i64 %1479, 0
  br label %1481

; <label>:1481                                    ; preds = %1477, %1474
  %1482 = phi i1 [ false, %1474 ], [ %1480, %1477 ]
  br i1 %1482, label %1483, label %1491

; <label>:1483                                    ; preds = %1481
  %1484 = load i8* %locinput.4, align 1
  %1485 = zext i8 %1484 to i64
  %1486 = getelementptr inbounds [0 x i8]* @PL_utf8skip, i32 0, i64 %1485
  %1487 = load i8* %1486, align 1
  %1488 = zext i8 %1487 to i32
  %1489 = sext i32 %1488 to i64
  %1490 = getelementptr inbounds i8* %locinput.4, i64 %1489
  br label %1474

; <label>:1491                                    ; preds = %1481
  %1492 = load i8** @PL_regeol, align 8
  %1493 = icmp ugt i8* %locinput.4, %1492
  br i1 %1493, label %1494, label %1495

; <label>:1494                                    ; preds = %1491
  br label %5029

; <label>:1495                                    ; preds = %1491
  br label %1498

; <label>:1496                                    ; preds = %1455
  %1497 = getelementptr inbounds i8* %locinput.0, i32 1
  br label %1498

; <label>:1498                                    ; preds = %1496, %1495
  %locinput.5 = phi i8* [ %locinput.4, %1495 ], [ %1497, %1496 ]
  %1499 = load i8* %locinput.5, align 1
  %1500 = zext i8 %1499 to i32
  br label %5023

; <label>:1501                                    ; preds = %15
  %1502 = load i32* @PL_reg_flags, align 4
  %1503 = or i32 %1502, 1
  store i32 %1503, i32* @PL_reg_flags, align 4
  br label %1504

; <label>:1504                                    ; preds = %1501, %15, %15
  %1505 = bitcast %struct.regnode* %scan.0 to %struct.regnode_1*
  %1506 = getelementptr inbounds %struct.regnode_1* %1505, i32 0, i32 3
  %1507 = load i32* %1506, align 4
  %1508 = sext i32 %1507 to i64
  %1509 = load i32** @PL_regstartp, align 8
  %1510 = getelementptr inbounds i32* %1509, i64 %1508
  %1511 = load i32* %1510, align 4
  %1512 = load i32* @PL_reg_maxiter, align 4
  store i32 %1512, i32* @PL_reg_leftiter, align 4
  %1513 = load i32** @PL_reglastparen, align 8
  %1514 = load i32* %1513, align 4
  %1515 = icmp slt i32 %1514, %1507
  br i1 %1515, label %1518, label %1516

; <label>:1516                                    ; preds = %1504
  %1517 = icmp eq i32 %1511, -1
  br i1 %1517, label %1518, label %1519

; <label>:1518                                    ; preds = %1516, %1504
  br label %5029

; <label>:1519                                    ; preds = %1516
  %1520 = sext i32 %1507 to i64
  %1521 = load i32** @PL_regendp, align 8
  %1522 = getelementptr inbounds i32* %1521, i64 %1520
  %1523 = load i32* %1522, align 4
  %1524 = icmp eq i32 %1511, %1523
  br i1 %1524, label %1525, label %1526

; <label>:1525                                    ; preds = %1519
  br label %5023

; <label>:1526                                    ; preds = %1519
  %1527 = load i8** @PL_bostr, align 8
  %1528 = sext i32 %1511 to i64
  %1529 = getelementptr inbounds i8* %1527, i64 %1528
  %1530 = sext i8 %2 to i32
  %1531 = icmp ne i32 %1530, 0
  br i1 %1531, label %1532, label %1580

; <label>:1532                                    ; preds = %1526
  %1533 = getelementptr inbounds %struct.regnode* %scan.0, i32 0, i32 1
  %1534 = load i8* %1533, align 1
  %1535 = zext i8 %1534 to i32
  %1536 = icmp ne i32 %1535, 47
  br i1 %1536, label %1537, label %1580

; <label>:1537                                    ; preds = %1532
  %1538 = load i8** @PL_bostr, align 8
  %1539 = sext i32 %1507 to i64
  %1540 = load i32** @PL_regendp, align 8
  %1541 = getelementptr inbounds i32* %1540, i64 %1539
  %1542 = load i32* %1541, align 4
  %1543 = sext i32 %1542 to i64
  %1544 = getelementptr inbounds i8* %1538, i64 %1543
  %1545 = getelementptr inbounds %struct.regnode* %scan.0, i32 0, i32 1
  %1546 = load i8* %1545, align 1
  %1547 = zext i8 %1546 to i32
  %1548 = icmp eq i32 %1547, 48
  br i1 %1548, label %1549, label %1577

; <label>:1549                                    ; preds = %1537
  br label %1550

; <label>:1550                                    ; preds = %1571, %1549
  %l3.0 = phi i8* [ %locinput.0, %1549 ], [ %1575, %1571 ]
  %s.2 = phi i8* [ %1529, %1549 ], [ %1573, %1571 ]
  %1551 = icmp ult i8* %s.2, %1544
  br i1 %1551, label %1552, label %1576

; <label>:1552                                    ; preds = %1550
  %1553 = load i8** @PL_regeol, align 8
  %1554 = icmp uge i8* %l3.0, %1553
  br i1 %1554, label %1555, label %1556

; <label>:1555                                    ; preds = %1552
  br label %5029

; <label>:1556                                    ; preds = %1552
  %1557 = getelementptr inbounds [7 x i8]* %tmpbuf1, i32 0, i32 0
  %1558 = call i64 @Perl_to_utf8_lower(i8* %s.2, i8* %1557, i64* %ulen1)
  %1559 = getelementptr inbounds [7 x i8]* %tmpbuf2, i32 0, i32 0
  %1560 = call i64 @Perl_to_utf8_lower(i8* %l3.0, i8* %1559, i64* %ulen2)
  %1561 = load i64* %ulen1, align 8
  %1562 = load i64* %ulen2, align 8
  %1563 = icmp ne i64 %1561, %1562
  br i1 %1563, label %1570, label %1564

; <label>:1564                                    ; preds = %1556
  %1565 = getelementptr inbounds [7 x i8]* %tmpbuf1, i32 0, i32 0
  %1566 = getelementptr inbounds [7 x i8]* %tmpbuf2, i32 0, i32 0
  %1567 = load i64* %ulen1, align 8
  %1568 = call i32 @memcmp(i8* %1565, i8* %1566, i64 %1567)
  %1569 = icmp ne i32 %1568, 0
  br i1 %1569, label %1570, label %1571

; <label>:1570                                    ; preds = %1564, %1556
  br label %5029

; <label>:1571                                    ; preds = %1564
  %1572 = load i64* %ulen1, align 8
  %1573 = getelementptr inbounds i8* %s.2, i64 %1572
  %1574 = load i64* %ulen2, align 8
  %1575 = getelementptr inbounds i8* %l3.0, i64 %1574
  br label %1550

; <label>:1576                                    ; preds = %1550
  br label %1577

; <label>:1577                                    ; preds = %1576, %1537
  %l3.1 = phi i8* [ %l3.0, %1576 ], [ %locinput.0, %1537 ]
  %1578 = load i8* %l3.1, align 1
  %1579 = zext i8 %1578 to i32
  br label %5023

; <label>:1580                                    ; preds = %1532, %1526
  %1581 = load i8* %1529, align 1
  %1582 = zext i8 %1581 to i32
  %1583 = icmp ne i32 %1582, %nextchr.0
  br i1 %1583, label %1584, label %1603

; <label>:1584                                    ; preds = %1580
  %1585 = getelementptr inbounds %struct.regnode* %scan.0, i32 0, i32 1
  %1586 = load i8* %1585, align 1
  %1587 = zext i8 %1586 to i32
  %1588 = icmp eq i32 %1587, 47
  br i1 %1588, label %1602, label %1589

; <label>:1589                                    ; preds = %1584
  %1590 = load i8* %1529, align 1
  %1591 = zext i8 %1590 to i32
  %1592 = sext i32 %nextchr.0 to i64
  %1593 = getelementptr inbounds %struct.regnode* %scan.0, i32 0, i32 1
  %1594 = load i8* %1593, align 1
  %1595 = zext i8 %1594 to i32
  %1596 = icmp eq i32 %1595, 48
  %1597 = select i1 %1596, i8* getelementptr inbounds ([0 x i8]* @PL_fold, i32 0, i32 0), i8* getelementptr inbounds ([0 x i8]* @PL_fold_locale, i32 0, i32 0)
  %1598 = getelementptr inbounds i8* %1597, i64 %1592
  %1599 = load i8* %1598, align 1
  %1600 = zext i8 %1599 to i32
  %1601 = icmp ne i32 %1591, %1600
  br i1 %1601, label %1602, label %1603

; <label>:1602                                    ; preds = %1589, %1584
  br label %5029

; <label>:1603                                    ; preds = %1589, %1580
  %1604 = sext i32 %1507 to i64
  %1605 = load i32** @PL_regendp, align 8
  %1606 = getelementptr inbounds i32* %1605, i64 %1604
  %1607 = load i32* %1606, align 4
  %1608 = sub nsw i32 %1607, %1511
  %1609 = sext i32 %1608 to i64
  %1610 = getelementptr inbounds i8* %locinput.0, i64 %1609
  %1611 = load i8** @PL_regeol, align 8
  %1612 = icmp ugt i8* %1610, %1611
  br i1 %1612, label %1613, label %1614

; <label>:1613                                    ; preds = %1603
  br label %5029

; <label>:1614                                    ; preds = %1603
  %1615 = icmp sgt i32 %1608, 1
  br i1 %1615, label %1616, label %1637

; <label>:1616                                    ; preds = %1614
  %1617 = getelementptr inbounds %struct.regnode* %scan.0, i32 0, i32 1
  %1618 = load i8* %1617, align 1
  %1619 = zext i8 %1618 to i32
  %1620 = icmp eq i32 %1619, 47
  br i1 %1620, label %1621, label %1625

; <label>:1621                                    ; preds = %1616
  %1622 = sext i32 %1608 to i64
  %1623 = call i32 @memcmp(i8* %1529, i8* %locinput.0, i64 %1622)
  %1624 = icmp ne i32 %1623, 0
  br i1 %1624, label %1636, label %1637

; <label>:1625                                    ; preds = %1616
  %1626 = getelementptr inbounds %struct.regnode* %scan.0, i32 0, i32 1
  %1627 = load i8* %1626, align 1
  %1628 = zext i8 %1627 to i32
  %1629 = icmp eq i32 %1628, 48
  br i1 %1629, label %1630, label %1633

; <label>:1630                                    ; preds = %1625
  %1631 = call i32 @Perl_ibcmp(i8* %1529, i8* %locinput.0, i32 %1608)
  %1632 = icmp ne i32 %1631, 0
  br i1 %1632, label %1636, label %1637

; <label>:1633                                    ; preds = %1625
  %1634 = call i32 @Perl_ibcmp_locale(i8* %1529, i8* %locinput.0, i32 %1608)
  %1635 = icmp ne i32 %1634, 0
  br i1 %1635, label %1636, label %1637

; <label>:1636                                    ; preds = %1633, %1630, %1621
  br label %5029

; <label>:1637                                    ; preds = %1633, %1630, %1621, %1614
  %1638 = sext i32 %1608 to i64
  %1639 = getelementptr inbounds i8* %locinput.0, i64 %1638
  %1640 = load i8* %1639, align 1
  %1641 = zext i8 %1640 to i32
  br label %5023

; <label>:1642                                    ; preds = %15, %15
  br label %5023

; <label>:1643                                    ; preds = %15
  br label %5023

; <label>:1644                                    ; preds = %15
  %1645 = load %struct.sv*** @PL_stack_sp, align 8
  %1646 = load %struct.op** @PL_op, align 8
  %1647 = load volatile %struct.cop** @PL_curcop, align 8
  %1648 = load %struct.regexp** @PL_reg_re, align 8
  %1649 = bitcast %struct.regnode* %scan.0 to %struct.regnode_1*
  %1650 = getelementptr inbounds %struct.regnode_1* %1649, i32 0, i32 3
  %1651 = load i32* %1650, align 4
  %1652 = sext i32 %1651 to i64
  %1653 = load %struct.reg_data** @PL_regdata, align 8
  %1654 = getelementptr inbounds %struct.reg_data* %1653, i32 0, i32 2
  %1655 = getelementptr inbounds [1 x i8*]* %1654, i32 0, i64 %1652
  %1656 = load i8** %1655, align 8
  %1657 = bitcast i8* %1656 to %struct.op*
  store %struct.op* %1657, %struct.op** @PL_op, align 8
  %1658 = load %struct.av** @PL_comppad, align 8
  %1659 = add nsw i32 %1651, 2
  %1660 = sext i32 %1659 to i64
  %1661 = load %struct.reg_data** @PL_regdata, align 8
  %1662 = getelementptr inbounds %struct.reg_data* %1661, i32 0, i32 2
  %1663 = getelementptr inbounds [1 x i8*]* %1662, i32 0, i64 %1660
  %1664 = load i8** %1663, align 8
  %1665 = bitcast i8* %1664 to %struct.av*
  store %struct.av* %1665, %struct.av** @PL_comppad, align 8
  %1666 = load %struct.av** @PL_comppad, align 8
  %1667 = icmp ne %struct.av* %1666, null
  br i1 %1667, label %1668, label %1675

; <label>:1668                                    ; preds = %1644
  %1669 = load %struct.av** @PL_comppad, align 8
  %1670 = getelementptr inbounds %struct.av* %1669, i32 0, i32 0
  %1671 = load %struct.xpvav** %1670, align 8
  %1672 = getelementptr inbounds %struct.xpvav* %1671, i32 0, i32 0
  %1673 = load i8** %1672, align 8
  %1674 = bitcast i8* %1673 to %struct.sv**
  br label %1676

; <label>:1675                                    ; preds = %1644
  br label %1676

; <label>:1676                                    ; preds = %1675, %1668
  %1677 = phi %struct.sv** [ %1674, %1668 ], [ null, %1675 ]
  store %struct.sv** %1677, %struct.sv*** @PL_curpad, align 8
  %1678 = load i8** @PL_bostr, align 8
  %1679 = ptrtoint i8* %locinput.0 to i64
  %1680 = ptrtoint i8* %1678 to i64
  %1681 = sub i64 %1679, %1680
  %1682 = trunc i64 %1681 to i32
  %1683 = load %struct.magic** @PL_reg_magic, align 8
  %1684 = getelementptr inbounds %struct.magic* %1683, i32 0, i32 7
  store i32 %1682, i32* %1684, align 4
  %1685 = load i32** @PL_regendp, align 8
  %1686 = getelementptr inbounds i32* %1685, i64 0
  store i32 %1682, i32* %1686, align 4
  %1687 = load i32 ()** @PL_runops, align 8
  %1688 = call i32 %1687()
  %1689 = load %struct.sv*** @PL_stack_sp, align 8
  %1690 = icmp eq %struct.sv** %1689, %1645
  br i1 %1690, label %1691, label %1692

; <label>:1691                                    ; preds = %1676
  br label %1695

; <label>:1692                                    ; preds = %1676
  %1693 = getelementptr inbounds %struct.sv** %1689, i32 -1
  %1694 = load %struct.sv** %1689, align 8
  store %struct.sv** %1693, %struct.sv*** @PL_stack_sp, align 8
  br label %1695

; <label>:1695                                    ; preds = %1692, %1691
  %ret.0 = phi %struct.sv* [ @PL_sv_undef, %1691 ], [ %1694, %1692 ]
  store %struct.op* %1646, %struct.op** @PL_op, align 8
  store %struct.av* %1658, %struct.av** @PL_comppad, align 8
  %1696 = load %struct.av** @PL_comppad, align 8
  %1697 = icmp ne %struct.av* %1696, null
  br i1 %1697, label %1698, label %1705

; <label>:1698                                    ; preds = %1695
  %1699 = load %struct.av** @PL_comppad, align 8
  %1700 = getelementptr inbounds %struct.av* %1699, i32 0, i32 0
  %1701 = load %struct.xpvav** %1700, align 8
  %1702 = getelementptr inbounds %struct.xpvav* %1701, i32 0, i32 0
  %1703 = load i8** %1702, align 8
  %1704 = bitcast i8* %1703 to %struct.sv**
  br label %1706

; <label>:1705                                    ; preds = %1695
  br label %1706

; <label>:1706                                    ; preds = %1705, %1698
  %1707 = phi %struct.sv** [ %1704, %1698 ], [ null, %1705 ]
  store %struct.sv** %1707, %struct.sv*** @PL_curpad, align 8
  store volatile %struct.cop* %1647, %struct.cop** @PL_curcop, align 8
  %1708 = icmp ne i32 %logical.0, 0
  br i1 %1708, label %1709, label %1969

; <label>:1709                                    ; preds = %1706
  %1710 = icmp eq i32 %logical.0, 2
  br i1 %1710, label %1711, label %1895

; <label>:1711                                    ; preds = %1709
  %1712 = getelementptr inbounds %struct.sv* %ret.0, i32 0, i32 2
  %1713 = load i32* %1712, align 4
  %1714 = and i32 %1713, 524288
  %1715 = icmp ne i32 %1714, 0
  br i1 %1715, label %1716, label %1728

; <label>:1716                                    ; preds = %1711
  %1717 = getelementptr inbounds %struct.sv* %ret.0, i32 0, i32 0
  %1718 = load i8** %1717, align 8
  %1719 = bitcast i8* %1718 to %struct.xrv*
  %1720 = getelementptr inbounds %struct.xrv* %1719, i32 0, i32 0
  %1721 = load %struct.sv** %1720, align 8
  %1722 = getelementptr inbounds %struct.sv* %1721, i32 0, i32 2
  %1723 = load i32* %1722, align 4
  %1724 = and i32 %1723, 16384
  %1725 = icmp ne i32 %1724, 0
  br i1 %1725, label %1726, label %1728

; <label>:1726                                    ; preds = %1716
  %1727 = call %struct.magic* @Perl_mg_find(%struct.sv* %1721, i32 114)
  br label %1744

; <label>:1728                                    ; preds = %1716, %1711
  %1729 = getelementptr inbounds %struct.sv* %ret.0, i32 0, i32 2
  %1730 = load i32* %1729, align 4
  %1731 = and i32 %1730, 16384
  %1732 = icmp ne i32 %1731, 0
  br i1 %1732, label %1733, label %1743

; <label>:1733                                    ; preds = %1728
  %1734 = getelementptr inbounds %struct.sv* %ret.0, i32 0, i32 2
  %1735 = load i32* %1734, align 4
  %1736 = and i32 %1735, 8192
  %1737 = icmp ne i32 %1736, 0
  br i1 %1737, label %1738, label %1740

; <label>:1738                                    ; preds = %1733
  %1739 = call i32 @Perl_sv_unmagic(%struct.sv* %ret.0, i32 114)
  br label %1742

; <label>:1740                                    ; preds = %1733
  %1741 = call %struct.magic* @Perl_mg_find(%struct.sv* %ret.0, i32 114)
  br label %1742

; <label>:1742                                    ; preds = %1740, %1738
  %mg.0 = phi %struct.magic* [ null, %1738 ], [ %1741, %1740 ]
  br label %1743

; <label>:1743                                    ; preds = %1742, %1728
  %mg.1 = phi %struct.magic* [ %mg.0, %1742 ], [ null, %1728 ]
  br label %1744

; <label>:1744                                    ; preds = %1743, %1726
  %mg.2 = phi %struct.magic* [ %1727, %1726 ], [ %mg.1, %1743 ]
  %1745 = icmp ne %struct.magic* %mg.2, null
  br i1 %1745, label %1746, label %1759

; <label>:1746                                    ; preds = %1744
  %1747 = getelementptr inbounds %struct.magic* %mg.2, i32 0, i32 5
  %1748 = load %struct.sv** %1747, align 8
  %1749 = bitcast %struct.sv* %1748 to %struct.regexp*
  %1750 = icmp ne %struct.regexp* %1749, null
  br i1 %1750, label %1751, label %1756

; <label>:1751                                    ; preds = %1746
  %1752 = getelementptr inbounds %struct.regexp* %1749, i32 0, i32 9
  %1753 = load i32* %1752, align 4
  %1754 = add nsw i32 %1753, 1
  store i32 %1754, i32* %1752, align 4
  %1755 = icmp ne i32 %1753, 0
  br label %1756

; <label>:1756                                    ; preds = %1751, %1746
  %1757 = phi i1 [ false, %1746 ], [ %1755, %1751 ]
  %1758 = zext i1 %1757 to i32
  br label %1821

; <label>:1759                                    ; preds = %1744
  %1760 = getelementptr inbounds %struct.sv* %ret.0, i32 0, i32 2
  %1761 = load i32* %1760, align 4
  %1762 = and i32 %1761, 262144
  %1763 = icmp eq i32 %1762, 262144
  br i1 %1763, label %1764, label %1775

; <label>:1764                                    ; preds = %1759
  %1765 = getelementptr inbounds %struct.sv* %ret.0, i32 0, i32 0
  %1766 = load i8** %1765, align 8
  %1767 = bitcast i8* %1766 to %struct.xpv*
  %1768 = getelementptr inbounds %struct.xpv* %1767, i32 0, i32 1
  %1769 = load i64* %1768, align 8
  store i64 %1769, i64* %len, align 8
  %1770 = getelementptr inbounds %struct.sv* %ret.0, i32 0, i32 0
  %1771 = load i8** %1770, align 8
  %1772 = bitcast i8* %1771 to %struct.xpv*
  %1773 = getelementptr inbounds %struct.xpv* %1772, i32 0, i32 0
  %1774 = load i8** %1773, align 8
  br label %1777

; <label>:1775                                    ; preds = %1759
  %1776 = call i8* @Perl_sv_2pv_flags(%struct.sv* %ret.0, i64* %len, i32 2)
  br label %1777

; <label>:1777                                    ; preds = %1775, %1764
  %1778 = phi i8* [ %1774, %1764 ], [ %1776, %1775 ]
  %1779 = load i8** @PL_regprecomp, align 8
  %1780 = load i32* @PL_regsize, align 4
  %1781 = load i32* @PL_regnpar, align 4
  %1782 = bitcast %struct.pmop* %pm to i8*
  call void @llvm.memset.p0i8.i64(i8* %1782, i8 0, i64 112, i32 1, i1 false)
  %1783 = getelementptr inbounds %struct.sv* %ret.0, i32 0, i32 2
  %1784 = load i32* %1783, align 4
  %1785 = and i32 %1784, 536870912
  %1786 = icmp ne i32 %1785, 0
  br i1 %1786, label %1787, label %1800

; <label>:1787                                    ; preds = %1777
  %1788 = load volatile %struct.cop** @PL_curcop, align 8
  %1789 = getelementptr inbounds %struct.cop* %1788, i32 0, i32 7
  %1790 = load i8* %1789, align 1
  %1791 = zext i8 %1790 to i32
  %1792 = and i32 %1791, 8
  %1793 = icmp ne i32 %1792, 0
  br i1 %1793, label %1800, label %1794

; <label>:1794                                    ; preds = %1787
  %1795 = getelementptr inbounds %struct.pmop* %pm, i32 0, i32 16
  %1796 = load i8* %1795, align 1
  %1797 = zext i8 %1796 to i32
  %1798 = or i32 %1797, 8
  %1799 = trunc i32 %1798 to i8
  store i8 %1799, i8* %1795, align 1
  br label %1800

; <label>:1800                                    ; preds = %1794, %1787, %1777
  %1801 = load %struct.regexp* (i8*, i8*, %struct.pmop*)** @PL_regcompp, align 8
  %1802 = load i64* %len, align 8
  %1803 = getelementptr inbounds i8* %1778, i64 %1802
  %1804 = call %struct.regexp* %1801(i8* %1778, i8* %1803, %struct.pmop* %pm)
  %1805 = getelementptr inbounds %struct.sv* %ret.0, i32 0, i32 2
  %1806 = load i32* %1805, align 4
  %1807 = and i32 %1806, 8399360
  %1808 = icmp ne i32 %1807, 0
  br i1 %1808, label %1820, label %1809

; <label>:1809                                    ; preds = %1800
  %1810 = icmp ne %struct.regexp* %1804, null
  br i1 %1810, label %1811, label %1816

; <label>:1811                                    ; preds = %1809
  %1812 = getelementptr inbounds %struct.regexp* %1804, i32 0, i32 9
  %1813 = load i32* %1812, align 4
  %1814 = add nsw i32 %1813, 1
  store i32 %1814, i32* %1812, align 4
  %1815 = icmp ne i32 %1813, 0
  br label %1816

; <label>:1816                                    ; preds = %1811, %1809
  %1817 = phi i1 [ false, %1809 ], [ %1815, %1811 ]
  %1818 = zext i1 %1817 to i32
  %1819 = bitcast %struct.regexp* %1804 to %struct.sv*
  call void @Perl_sv_magic(%struct.sv* %ret.0, %struct.sv* %1819, i32 114, i8* null, i32 0)
  br label %1820

; <label>:1820                                    ; preds = %1816, %1800
  store i8* %1779, i8** @PL_regprecomp, align 8
  store i32 %1780, i32* @PL_regsize, align 4
  store i32 %1781, i32* @PL_regnpar, align 4
  br label %1821

; <label>:1821                                    ; preds = %1820, %1756
  %re.0 = phi %struct.regexp* [ %1749, %1756 ], [ %1804, %1820 ]
  %1822 = getelementptr inbounds %struct.re_cc_state* %state, i32 0, i32 1
  store %struct.regnode* %next.0, %struct.regnode** %1822, align 8
  %1823 = load %struct.re_cc_state** @PL_reg_call_cc, align 8
  %1824 = getelementptr inbounds %struct.re_cc_state* %state, i32 0, i32 2
  store %struct.re_cc_state* %1823, %struct.re_cc_state** %1824, align 8
  %1825 = load %struct.curcur** @PL_regcc, align 8
  %1826 = getelementptr inbounds %struct.re_cc_state* %state, i32 0, i32 3
  store %struct.curcur* %1825, %struct.curcur** %1826, align 8
  %1827 = load %struct.regexp** @PL_reg_re, align 8
  %1828 = getelementptr inbounds %struct.re_cc_state* %state, i32 0, i32 4
  store %struct.regexp* %1827, %struct.regexp** %1828, align 8
  store %struct.curcur* null, %struct.curcur** @PL_regcc, align 8
  %1829 = call i32 (i32, ...)* bitcast (i32 (...)* @regcppush to i32 (i32, ...)*)(i32 0)
  %1830 = load i32* @PL_savestack_ix, align 4
  %1831 = call i32 (%struct.regexp*, ...)* bitcast (i32 (...)* @cache_re to i32 (%struct.regexp*, ...)*)(%struct.regexp* %re.0)
  %1832 = load i32* @PL_savestack_ix, align 4
  %1833 = getelementptr inbounds %struct.re_cc_state* %state, i32 0, i32 0
  store i32 %1832, i32* %1833, align 4
  %1834 = load i32** @PL_reglastparen, align 8
  store i32 0, i32* %1834, align 4
  %1835 = load i32** @PL_reglastcloseparen, align 8
  store i32 0, i32* %1835, align 4
  store %struct.re_cc_state* %state, %struct.re_cc_state** @PL_reg_call_cc, align 8
  store i8* %locinput.0, i8** @PL_reginput, align 8
  %1836 = load i32* @PL_reg_flags, align 4
  %1837 = and i32 %1836, 8
  %1838 = icmp ne i32 %1837, 0
  %1839 = zext i1 %1838 to i32
  %1840 = getelementptr inbounds %struct.regexp* %re.0, i32 0, i32 15
  %1841 = load i32* %1840, align 4
  %1842 = and i32 %1841, 65536
  %1843 = icmp ne i32 %1842, 0
  %1844 = zext i1 %1843 to i32
  %1845 = xor i32 %1839, %1844
  %1846 = icmp ne i32 %1845, 0
  br i1 %1846, label %1847, label %1850

; <label>:1847                                    ; preds = %1821
  %1848 = load i32* @PL_reg_flags, align 4
  %1849 = xor i32 %1848, 8
  store i32 %1849, i32* @PL_reg_flags, align 4
  br label %1850

; <label>:1850                                    ; preds = %1847, %1821
  store i32 0, i32* @PL_reg_maxiter, align 4
  %1851 = getelementptr inbounds %struct.regexp* %re.0, i32 0, i32 16
  %1852 = getelementptr inbounds [1 x %struct.regnode]* %1851, i32 0, i32 0
  %1853 = getelementptr inbounds %struct.regnode* %1852, i64 1
  %1854 = call i32 (%struct.regnode*, ...)* bitcast (i32 (...)* @regmatch to i32 (%struct.regnode*, ...)*)(%struct.regnode* %1853)
  %1855 = icmp ne i32 %1854, 0
  br i1 %1855, label %1856, label %1875

; <label>:1856                                    ; preds = %1850
  %1857 = getelementptr inbounds %struct.re_cc_state* %state, i32 0, i32 2
  %1858 = load %struct.re_cc_state** %1857, align 8
  store %struct.re_cc_state* %1858, %struct.re_cc_state** @PL_reg_call_cc, align 8
  %1859 = getelementptr inbounds %struct.re_cc_state* %state, i32 0, i32 3
  %1860 = load %struct.curcur** %1859, align 8
  store %struct.curcur* %1860, %struct.curcur** @PL_regcc, align 8
  %1861 = getelementptr inbounds %struct.re_cc_state* %state, i32 0, i32 4
  %1862 = load %struct.regexp** %1861, align 8
  store %struct.regexp* %1862, %struct.regexp** @PL_reg_re, align 8
  %1863 = load %struct.regexp** @PL_reg_re, align 8
  %1864 = call i32 (%struct.regexp*, ...)* bitcast (i32 (...)* @cache_re to i32 (%struct.regexp*, ...)*)(%struct.regexp* %1863)
  %1865 = icmp ne i32 %1845, 0
  br i1 %1865, label %1866, label %1869

; <label>:1866                                    ; preds = %1856
  %1867 = load i32* @PL_reg_flags, align 4
  %1868 = xor i32 %1867, 8
  store i32 %1868, i32* @PL_reg_flags, align 4
  br label %1869

; <label>:1869                                    ; preds = %1866, %1856
  store i32 0, i32* @PL_reg_maxiter, align 4
  %1870 = load void (%struct.regexp*)** @PL_regfree, align 8
  call void %1870(%struct.regexp* %re.0)
  %1871 = load i32* @PL_savestack_ix, align 4
  %1872 = icmp sgt i32 %1871, %1829
  br i1 %1872, label %1873, label %1874

; <label>:1873                                    ; preds = %1869
  call void @Perl_leave_scope(i32 %1829)
  br label %1874

; <label>:1874                                    ; preds = %1873, %1869
  br label %5028

; <label>:1875                                    ; preds = %1850
  %1876 = load void (%struct.regexp*)** @PL_regfree, align 8
  call void %1876(%struct.regexp* %re.0)
  %1877 = load i32* @PL_savestack_ix, align 4
  %1878 = icmp sgt i32 %1877, %1830
  br i1 %1878, label %1879, label %1880

; <label>:1879                                    ; preds = %1875
  call void @Perl_leave_scope(i32 %1830)
  br label %1880

; <label>:1880                                    ; preds = %1879, %1875
  %1881 = call i32 (...)* @regcppop()
  %1882 = getelementptr inbounds %struct.re_cc_state* %state, i32 0, i32 2
  %1883 = load %struct.re_cc_state** %1882, align 8
  store %struct.re_cc_state* %1883, %struct.re_cc_state** @PL_reg_call_cc, align 8
  %1884 = getelementptr inbounds %struct.re_cc_state* %state, i32 0, i32 3
  %1885 = load %struct.curcur** %1884, align 8
  store %struct.curcur* %1885, %struct.curcur** @PL_regcc, align 8
  %1886 = getelementptr inbounds %struct.re_cc_state* %state, i32 0, i32 4
  %1887 = load %struct.regexp** %1886, align 8
  store %struct.regexp* %1887, %struct.regexp** @PL_reg_re, align 8
  %1888 = load %struct.regexp** @PL_reg_re, align 8
  %1889 = call i32 (%struct.regexp*, ...)* bitcast (i32 (...)* @cache_re to i32 (%struct.regexp*, ...)*)(%struct.regexp* %1888)
  %1890 = icmp ne i32 %1845, 0
  br i1 %1890, label %1891, label %1894

; <label>:1891                                    ; preds = %1880
  %1892 = load i32* @PL_reg_flags, align 4
  %1893 = xor i32 %1892, 8
  store i32 %1893, i32* @PL_reg_flags, align 4
  br label %1894

; <label>:1894                                    ; preds = %1891, %1880
  store i32 0, i32* @PL_reg_maxiter, align 4
  br label %5029

; <label>:1895                                    ; preds = %1709
  %1896 = icmp ne %struct.sv* %ret.0, null
  br i1 %1896, label %1898, label %1897

; <label>:1897                                    ; preds = %1895
  br label %1967

; <label>:1898                                    ; preds = %1895
  %1899 = getelementptr inbounds %struct.sv* %ret.0, i32 0, i32 2
  %1900 = load i32* %1899, align 4
  %1901 = and i32 %1900, 262144
  %1902 = icmp ne i32 %1901, 0
  br i1 %1902, label %1903, label %1932

; <label>:1903                                    ; preds = %1898
  %1904 = getelementptr inbounds %struct.sv* %ret.0, i32 0, i32 0
  %1905 = load i8** %1904, align 8
  %1906 = bitcast i8* %1905 to %struct.xpv*
  store %struct.xpv* %1906, %struct.xpv** @PL_Xpv, align 8
  %1907 = icmp ne %struct.xpv* %1906, null
  br i1 %1907, label %1908, label %1929

; <label>:1908                                    ; preds = %1903
  %1909 = load %struct.xpv** @PL_Xpv, align 8
  %1910 = getelementptr inbounds %struct.xpv* %1909, i32 0, i32 1
  %1911 = load i64* %1910, align 8
  %1912 = icmp ugt i64 %1911, 1
  br i1 %1912, label %1927, label %1913

; <label>:1913                                    ; preds = %1908
  %1914 = load %struct.xpv** @PL_Xpv, align 8
  %1915 = getelementptr inbounds %struct.xpv* %1914, i32 0, i32 1
  %1916 = load i64* %1915, align 8
  %1917 = icmp ne i64 %1916, 0
  br i1 %1917, label %1918, label %1925

; <label>:1918                                    ; preds = %1913
  %1919 = load %struct.xpv** @PL_Xpv, align 8
  %1920 = getelementptr inbounds %struct.xpv* %1919, i32 0, i32 0
  %1921 = load i8** %1920, align 8
  %1922 = load i8* %1921, align 1
  %1923 = sext i8 %1922 to i32
  %1924 = icmp ne i32 %1923, 48
  br label %1925

; <label>:1925                                    ; preds = %1918, %1913
  %1926 = phi i1 [ false, %1913 ], [ %1924, %1918 ]
  br label %1927

; <label>:1927                                    ; preds = %1925, %1908
  %1928 = phi i1 [ true, %1908 ], [ %1926, %1925 ]
  br label %1929

; <label>:1929                                    ; preds = %1927, %1903
  %1930 = phi i1 [ false, %1903 ], [ %1928, %1927 ]
  %1931 = select i1 %1930, i32 1, i32 0
  br label %1965

; <label>:1932                                    ; preds = %1898
  %1933 = getelementptr inbounds %struct.sv* %ret.0, i32 0, i32 2
  %1934 = load i32* %1933, align 4
  %1935 = and i32 %1934, 65536
  %1936 = icmp ne i32 %1935, 0
  br i1 %1936, label %1937, label %1945

; <label>:1937                                    ; preds = %1932
  %1938 = getelementptr inbounds %struct.sv* %ret.0, i32 0, i32 0
  %1939 = load i8** %1938, align 8
  %1940 = bitcast i8* %1939 to %struct.xpviv*
  %1941 = getelementptr inbounds %struct.xpviv* %1940, i32 0, i32 3
  %1942 = load i64* %1941, align 8
  %1943 = icmp ne i64 %1942, 0
  %1944 = zext i1 %1943 to i32
  br label %1963

; <label>:1945                                    ; preds = %1932
  %1946 = getelementptr inbounds %struct.sv* %ret.0, i32 0, i32 2
  %1947 = load i32* %1946, align 4
  %1948 = and i32 %1947, 131072
  %1949 = icmp ne i32 %1948, 0
  br i1 %1949, label %1950, label %1958

; <label>:1950                                    ; preds = %1945
  %1951 = getelementptr inbounds %struct.sv* %ret.0, i32 0, i32 0
  %1952 = load i8** %1951, align 8
  %1953 = bitcast i8* %1952 to %struct.xpvnv*
  %1954 = getelementptr inbounds %struct.xpvnv* %1953, i32 0, i32 4
  %1955 = load double* %1954, align 8
  %1956 = fcmp une double %1955, 0.000000e+00
  %1957 = zext i1 %1956 to i32
  br label %1961

; <label>:1958                                    ; preds = %1945
  %1959 = call signext i8 @Perl_sv_2bool(%struct.sv* %ret.0)
  %1960 = sext i8 %1959 to i32
  br label %1961

; <label>:1961                                    ; preds = %1958, %1950
  %1962 = phi i32 [ %1957, %1950 ], [ %1960, %1958 ]
  br label %1963

; <label>:1963                                    ; preds = %1961, %1937
  %1964 = phi i32 [ %1944, %1937 ], [ %1962, %1961 ]
  br label %1965

; <label>:1965                                    ; preds = %1963, %1929
  %1966 = phi i32 [ %1931, %1929 ], [ %1964, %1963 ]
  br label %1967

; <label>:1967                                    ; preds = %1965, %1897
  %1968 = phi i32 [ 0, %1897 ], [ %1966, %1965 ]
  br label %1973

; <label>:1969                                    ; preds = %1706
  %1970 = load %struct.gv** @PL_replgv, align 8
  %1971 = call %struct.sv* @Perl_save_scalar(%struct.gv* %1970)
  call void @Perl_sv_setsv_flags(%struct.sv* %1971, %struct.sv* %ret.0, i32 2)
  %1972 = call i32 (%struct.regexp*, ...)* bitcast (i32 (...)* @cache_re to i32 (%struct.regexp*, ...)*)(%struct.regexp* %1648)
  br label %1973

; <label>:1973                                    ; preds = %1969, %1967
  %logical.1 = phi i32 [ 0, %1967 ], [ %logical.0, %1969 ]
  %sw.1 = phi i32 [ %1968, %1967 ], [ %sw.0, %1969 ]
  br label %5023

; <label>:1974                                    ; preds = %15
  %1975 = bitcast %struct.regnode* %scan.0 to %struct.regnode_1*
  %1976 = getelementptr inbounds %struct.regnode_1* %1975, i32 0, i32 3
  %1977 = load i32* %1976, align 4
  %1978 = sext i32 %1977 to i64
  %1979 = load i8*** @PL_reg_start_tmp, align 8
  %1980 = getelementptr inbounds i8** %1979, i64 %1978
  store i8* %locinput.0, i8** %1980, align 8
  %1981 = load i32* @PL_regsize, align 4
  %1982 = icmp sgt i32 %1977, %1981
  br i1 %1982, label %1983, label %1984

; <label>:1983                                    ; preds = %1974
  store i32 %1977, i32* @PL_regsize, align 4
  br label %1984

; <label>:1984                                    ; preds = %1983, %1974
  br label %5023

; <label>:1985                                    ; preds = %15
  %1986 = bitcast %struct.regnode* %scan.0 to %struct.regnode_1*
  %1987 = getelementptr inbounds %struct.regnode_1* %1986, i32 0, i32 3
  %1988 = load i32* %1987, align 4
  %1989 = sext i32 %1988 to i64
  %1990 = load i8*** @PL_reg_start_tmp, align 8
  %1991 = getelementptr inbounds i8** %1990, i64 %1989
  %1992 = load i8** %1991, align 8
  %1993 = load i8** @PL_bostr, align 8
  %1994 = ptrtoint i8* %1992 to i64
  %1995 = ptrtoint i8* %1993 to i64
  %1996 = sub i64 %1994, %1995
  %1997 = trunc i64 %1996 to i32
  %1998 = sext i32 %1988 to i64
  %1999 = load i32** @PL_regstartp, align 8
  %2000 = getelementptr inbounds i32* %1999, i64 %1998
  store i32 %1997, i32* %2000, align 4
  %2001 = load i8** @PL_bostr, align 8
  %2002 = ptrtoint i8* %locinput.0 to i64
  %2003 = ptrtoint i8* %2001 to i64
  %2004 = sub i64 %2002, %2003
  %2005 = trunc i64 %2004 to i32
  %2006 = sext i32 %1988 to i64
  %2007 = load i32** @PL_regendp, align 8
  %2008 = getelementptr inbounds i32* %2007, i64 %2006
  store i32 %2005, i32* %2008, align 4
  %2009 = load i32** @PL_reglastparen, align 8
  %2010 = load i32* %2009, align 4
  %2011 = icmp sgt i32 %1988, %2010
  br i1 %2011, label %2012, label %2014

; <label>:2012                                    ; preds = %1985
  %2013 = load i32** @PL_reglastparen, align 8
  store i32 %1988, i32* %2013, align 4
  br label %2014

; <label>:2014                                    ; preds = %2012, %1985
  %2015 = load i32** @PL_reglastcloseparen, align 8
  store i32 %1988, i32* %2015, align 4
  br label %5023

; <label>:2016                                    ; preds = %15
  %2017 = bitcast %struct.regnode* %scan.0 to %struct.regnode_1*
  %2018 = getelementptr inbounds %struct.regnode_1* %2017, i32 0, i32 3
  %2019 = load i32* %2018, align 4
  %2020 = load i32** @PL_reglastparen, align 8
  %2021 = load i32* %2020, align 4
  %2022 = icmp sge i32 %2021, %2019
  br i1 %2022, label %2023, label %2029

; <label>:2023                                    ; preds = %2016
  %2024 = sext i32 %2019 to i64
  %2025 = load i32** @PL_regendp, align 8
  %2026 = getelementptr inbounds i32* %2025, i64 %2024
  %2027 = load i32* %2026, align 4
  %2028 = icmp ne i32 %2027, -1
  br label %2029

; <label>:2029                                    ; preds = %2023, %2016
  %2030 = phi i1 [ false, %2016 ], [ %2028, %2023 ]
  %2031 = zext i1 %2030 to i32
  br label %5023

; <label>:2032                                    ; preds = %15
  %2033 = load i32* @PL_reg_maxiter, align 4
  store i32 %2033, i32* @PL_reg_leftiter, align 4
  %2034 = icmp ne i32 %sw.0, 0
  br i1 %2034, label %2035, label %2038

; <label>:2035                                    ; preds = %2032
  %2036 = getelementptr inbounds %struct.regnode* %scan.0, i64 1
  %2037 = getelementptr inbounds %struct.regnode* %2036, i64 1
  br label %2052

; <label>:2038                                    ; preds = %2032
  %2039 = bitcast %struct.regnode* %scan.0 to %struct.regnode_1*
  %2040 = getelementptr inbounds %struct.regnode_1* %2039, i32 0, i32 3
  %2041 = load i32* %2040, align 4
  %2042 = zext i32 %2041 to i64
  %2043 = getelementptr inbounds %struct.regnode* %scan.0, i64 %2042
  %2044 = getelementptr inbounds %struct.regnode* %2043, i32 0, i32 1
  %2045 = load i8* %2044, align 1
  %2046 = zext i8 %2045 to i32
  %2047 = icmp eq i32 %2046, 53
  br i1 %2047, label %2048, label %2051

; <label>:2048                                    ; preds = %2038
  %2049 = getelementptr inbounds %struct.regnode* %2043, i64 1
  %2050 = getelementptr inbounds %struct.regnode* %2049, i64 1
  br label %2051

; <label>:2051                                    ; preds = %2048, %2038
  %next.1 = phi %struct.regnode* [ %2050, %2048 ], [ %2043, %2038 ]
  br label %2052

; <label>:2052                                    ; preds = %2051, %2035
  %next.2 = phi %struct.regnode* [ %2037, %2035 ], [ %next.1, %2051 ]
  br label %5023

; <label>:2053                                    ; preds = %15
  %2054 = getelementptr inbounds %struct.regnode* %scan.0, i32 0, i32 0
  %2055 = load i8* %2054, align 1
  %2056 = zext i8 %2055 to i32
  br label %5023

; <label>:2057                                    ; preds = %15
  %2058 = load i32* @PL_savestack_ix, align 4
  %2059 = getelementptr inbounds %struct.regnode* %scan.0, i32 0, i32 0
  %2060 = load i8* %2059, align 1
  %2061 = zext i8 %2060 to i32
  %2062 = getelementptr inbounds %struct.regnode* %next.0, i64 -1
  %2063 = getelementptr inbounds %struct.regnode* %2062, i32 0, i32 1
  %2064 = load i8* %2063, align 1
  %2065 = zext i8 %2064 to i32
  %2066 = icmp eq i32 %2065, 36
  br i1 %2066, label %2067, label %2073

; <label>:2067                                    ; preds = %2057
  %2068 = bitcast %struct.regnode* %next.0 to %struct.regnode_1*
  %2069 = getelementptr inbounds %struct.regnode_1* %2068, i32 0, i32 3
  %2070 = load i32* %2069, align 4
  %2071 = zext i32 %2070 to i64
  %2072 = getelementptr inbounds %struct.regnode* %next.0, i64 %2071
  br label %2073

; <label>:2073                                    ; preds = %2067, %2057
  %next.3 = phi %struct.regnode* [ %2072, %2067 ], [ %next.0, %2057 ]
  %2074 = load %struct.curcur** @PL_regcc, align 8
  %2075 = getelementptr inbounds %struct.curcur* %cc, i32 0, i32 8
  store %struct.curcur* %2074, %struct.curcur** %2075, align 8
  store %struct.curcur* %cc, %struct.curcur** @PL_regcc, align 8
  %2076 = load i32** @PL_reglastparen, align 8
  %2077 = load i32* %2076, align 4
  %2078 = icmp sgt i32 %2061, %2077
  br i1 %2078, label %2079, label %2082

; <label>:2079                                    ; preds = %2073
  %2080 = load i32** @PL_reglastparen, align 8
  %2081 = load i32* %2080, align 4
  br label %2082

; <label>:2082                                    ; preds = %2079, %2073
  %parenfloor.0 = phi i32 [ %2081, %2079 ], [ %2061, %2073 ]
  %2083 = getelementptr inbounds %struct.curcur* %cc, i32 0, i32 0
  store i32 %parenfloor.0, i32* %2083, align 4
  %2084 = getelementptr inbounds %struct.curcur* %cc, i32 0, i32 1
  store i32 -1, i32* %2084, align 4
  %2085 = bitcast %struct.regnode* %scan.0 to %struct.regnode_2*
  %2086 = getelementptr inbounds %struct.regnode_2* %2085, i32 0, i32 3
  %2087 = load i16* %2086, align 2
  %2088 = zext i16 %2087 to i32
  %2089 = getelementptr inbounds %struct.curcur* %cc, i32 0, i32 2
  store i32 %2088, i32* %2089, align 4
  %2090 = bitcast %struct.regnode* %scan.0 to %struct.regnode_2*
  %2091 = getelementptr inbounds %struct.regnode_2* %2090, i32 0, i32 4
  %2092 = load i16* %2091, align 2
  %2093 = zext i16 %2092 to i32
  %2094 = getelementptr inbounds %struct.curcur* %cc, i32 0, i32 3
  store i32 %2093, i32* %2094, align 4
  %2095 = getelementptr inbounds %struct.regnode* %scan.0, i64 1
  %2096 = getelementptr inbounds %struct.regnode* %2095, i64 1
  %2097 = getelementptr inbounds %struct.curcur* %cc, i32 0, i32 5
  store %struct.regnode* %2096, %struct.regnode** %2097, align 8
  %2098 = getelementptr inbounds %struct.curcur* %cc, i32 0, i32 6
  store %struct.regnode* %next.3, %struct.regnode** %2098, align 8
  %2099 = getelementptr inbounds %struct.curcur* %cc, i32 0, i32 4
  store i32 %minmod.0, i32* %2099, align 4
  %2100 = getelementptr inbounds %struct.curcur* %cc, i32 0, i32 7
  store i8* null, i8** %2100, align 8
  store i8* %locinput.0, i8** @PL_reginput, align 8
  %2101 = getelementptr inbounds %struct.regnode* %next.3, i64 -1
  %2102 = call i32 (%struct.regnode*, ...)* bitcast (i32 (...)* @regmatch to i32 (%struct.regnode*, ...)*)(%struct.regnode* %2101)
  %2103 = load i32* @PL_savestack_ix, align 4
  %2104 = icmp sgt i32 %2103, %2058
  br i1 %2104, label %2105, label %2106

; <label>:2105                                    ; preds = %2082
  call void @Perl_leave_scope(i32 %2058)
  br label %2106

; <label>:2106                                    ; preds = %2105, %2082
  %2107 = getelementptr inbounds %struct.curcur* %cc, i32 0, i32 8
  %2108 = load %struct.curcur** %2107, align 8
  store %struct.curcur* %2108, %struct.curcur** @PL_regcc, align 8
  %2109 = icmp ne i32 %2102, 0
  br i1 %2109, label %2110, label %2111

; <label>:2110                                    ; preds = %2106
  br label %5028

; <label>:2111                                    ; preds = %2106
  br label %5029

; <label>:2112                                    ; preds = %15
  %2113 = load %struct.curcur** @PL_regcc, align 8
  %2114 = getelementptr inbounds %struct.curcur* %2113, i32 0, i32 7
  %2115 = load i8** %2114, align 8
  %2116 = getelementptr inbounds %struct.curcur* %2113, i32 0, i32 1
  %2117 = load i32* %2116, align 4
  %2118 = add nsw i32 %2117, 1
  store i8* %locinput.0, i8** @PL_reginput, align 8
  %2119 = getelementptr inbounds %struct.curcur* %2113, i32 0, i32 7
  %2120 = load i8** %2119, align 8
  %2121 = icmp eq i8* %locinput.0, %2120
  br i1 %2121, label %2122, label %2148

; <label>:2122                                    ; preds = %2112
  %2123 = getelementptr inbounds %struct.curcur* %2113, i32 0, i32 2
  %2124 = load i32* %2123, align 4
  %2125 = icmp sge i32 %2118, %2124
  br i1 %2125, label %2126, label %2148

; <label>:2126                                    ; preds = %2122
  %2127 = getelementptr inbounds %struct.curcur* %2113, i32 0, i32 8
  %2128 = load %struct.curcur** %2127, align 8
  store %struct.curcur* %2128, %struct.curcur** @PL_regcc, align 8
  %2129 = load %struct.curcur** @PL_regcc, align 8
  %2130 = icmp ne %struct.curcur* %2129, null
  br i1 %2130, label %2131, label %2135

; <label>:2131                                    ; preds = %2126
  %2132 = load %struct.curcur** @PL_regcc, align 8
  %2133 = getelementptr inbounds %struct.curcur* %2132, i32 0, i32 1
  %2134 = load i32* %2133, align 4
  br label %2135

; <label>:2135                                    ; preds = %2131, %2126
  %ln.5 = phi i32 [ %2134, %2131 ], [ %ln.0, %2126 ]
  %2136 = getelementptr inbounds %struct.curcur* %2113, i32 0, i32 6
  %2137 = load %struct.regnode** %2136, align 8
  %2138 = call i32 (%struct.regnode*, ...)* bitcast (i32 (...)* @regmatch to i32 (%struct.regnode*, ...)*)(%struct.regnode* %2137)
  %2139 = icmp ne i32 %2138, 0
  br i1 %2139, label %2140, label %2141

; <label>:2140                                    ; preds = %2135
  br label %5028

; <label>:2141                                    ; preds = %2135
  %2142 = load %struct.curcur** @PL_regcc, align 8
  %2143 = icmp ne %struct.curcur* %2142, null
  br i1 %2143, label %2144, label %2147

; <label>:2144                                    ; preds = %2141
  %2145 = load %struct.curcur** @PL_regcc, align 8
  %2146 = getelementptr inbounds %struct.curcur* %2145, i32 0, i32 1
  store i32 %ln.5, i32* %2146, align 4
  br label %2147

; <label>:2147                                    ; preds = %2144, %2141
  store %struct.curcur* %2113, %struct.curcur** @PL_regcc, align 8
  br label %5029

; <label>:2148                                    ; preds = %2122, %2112
  %2149 = getelementptr inbounds %struct.curcur* %2113, i32 0, i32 2
  %2150 = load i32* %2149, align 4
  %2151 = icmp slt i32 %2118, %2150
  br i1 %2151, label %2152, label %2164

; <label>:2152                                    ; preds = %2148
  %2153 = getelementptr inbounds %struct.curcur* %2113, i32 0, i32 1
  store i32 %2118, i32* %2153, align 4
  %2154 = getelementptr inbounds %struct.curcur* %2113, i32 0, i32 7
  store i8* %locinput.0, i8** %2154, align 8
  %2155 = getelementptr inbounds %struct.curcur* %2113, i32 0, i32 5
  %2156 = load %struct.regnode** %2155, align 8
  %2157 = call i32 (%struct.regnode*, ...)* bitcast (i32 (...)* @regmatch to i32 (%struct.regnode*, ...)*)(%struct.regnode* %2156)
  %2158 = icmp ne i32 %2157, 0
  br i1 %2158, label %2159, label %2160

; <label>:2159                                    ; preds = %2152
  br label %5028

; <label>:2160                                    ; preds = %2152
  %2161 = sub nsw i32 %2118, 1
  %2162 = getelementptr inbounds %struct.curcur* %2113, i32 0, i32 1
  store i32 %2161, i32* %2162, align 4
  %2163 = getelementptr inbounds %struct.curcur* %2113, i32 0, i32 7
  store i8* %2115, i8** %2163, align 8
  br label %5029

; <label>:2164                                    ; preds = %2148
  %2165 = getelementptr inbounds %struct.regnode* %scan.0, i32 0, i32 0
  %2166 = load i8* %2165, align 1
  %2167 = icmp ne i8 %2166, 0
  br i1 %2167, label %2168, label %2270

; <label>:2168                                    ; preds = %2164
  %2169 = load i32* @PL_reg_maxiter, align 4
  %2170 = icmp ne i32 %2169, 0
  br i1 %2170, label %2186, label %2171

; <label>:2171                                    ; preds = %2168
  %2172 = load i8** @PL_regeol, align 8
  %2173 = load i8** @PL_bostr, align 8
  %2174 = ptrtoint i8* %2172 to i64
  %2175 = ptrtoint i8* %2173 to i64
  %2176 = sub i64 %2174, %2175
  %2177 = add nsw i64 %2176, 1
  %2178 = getelementptr inbounds %struct.regnode* %scan.0, i32 0, i32 0
  %2179 = load i8* %2178, align 1
  %2180 = zext i8 %2179 to i32
  %2181 = ashr i32 %2180, 4
  %2182 = sext i32 %2181 to i64
  %2183 = mul nsw i64 %2177, %2182
  %2184 = trunc i64 %2183 to i32
  store i32 %2184, i32* @PL_reg_maxiter, align 4
  %2185 = load i32* @PL_reg_maxiter, align 4
  store i32 %2185, i32* @PL_reg_leftiter, align 4
  br label %2186

; <label>:2186                                    ; preds = %2171, %2168
  %2187 = load i32* @PL_reg_leftiter, align 4
  %2188 = add nsw i32 %2187, -1
  store i32 %2188, i32* @PL_reg_leftiter, align 4
  %2189 = icmp eq i32 %2187, 0
  br i1 %2189, label %2190, label %2220

; <label>:2190                                    ; preds = %2186
  %2191 = load i32* @PL_reg_maxiter, align 4
  %2192 = add nsw i32 %2191, 7
  %2193 = add nsw i32 %2192, 2
  %2194 = sdiv i32 %2193, 8
  %2195 = load i8** @PL_reg_poscache, align 8
  %2196 = icmp ne i8* %2195, null
  br i1 %2196, label %2197, label %2211

; <label>:2197                                    ; preds = %2190
  %2198 = load i64* @PL_reg_poscache_size, align 8
  %2199 = trunc i64 %2198 to i32
  %2200 = icmp slt i32 %2199, %2194
  br i1 %2200, label %2201, label %2207

; <label>:2201                                    ; preds = %2197
  %2202 = load i8** @PL_reg_poscache, align 8
  %2203 = sext i32 %2194 to i64
  %2204 = mul i64 %2203, 1
  %2205 = call i8* @Perl_safesysrealloc(i8* %2202, i64 %2204)
  store i8* %2205, i8** @PL_reg_poscache, align 8
  %2206 = sext i32 %2194 to i64
  store i64 %2206, i64* @PL_reg_poscache_size, align 8
  br label %2207

; <label>:2207                                    ; preds = %2201, %2197
  %2208 = load i8** @PL_reg_poscache, align 8
  %2209 = sext i32 %2194 to i64
  %2210 = mul i64 %2209, 1
  call void @llvm.memset.p0i8.i64(i8* %2208, i8 0, i64 %2210, i32 1, i1 false)
  br label %2219

; <label>:2211                                    ; preds = %2190
  %2212 = sext i32 %2194 to i64
  store i64 %2212, i64* @PL_reg_poscache_size, align 8
  %2213 = sext i32 %2194 to i64
  %2214 = mul i64 %2213, 1
  %2215 = call i8* @Perl_safesysmalloc(i64 %2214)
  store i8* %2215, i8** @PL_reg_poscache, align 8
  %2216 = load i8** @PL_reg_poscache, align 8
  %2217 = sext i32 %2194 to i64
  %2218 = mul i64 %2217, 1
  call void @llvm.memset.p0i8.i64(i8* %2216, i8 0, i64 %2218, i32 1, i1 false)
  br label %2219

; <label>:2219                                    ; preds = %2211, %2207
  br label %2220

; <label>:2220                                    ; preds = %2219, %2186
  %2221 = load i32* @PL_reg_leftiter, align 4
  %2222 = icmp slt i32 %2221, 0
  br i1 %2222, label %2223, label %2269

; <label>:2223                                    ; preds = %2220
  %2224 = load i8** @PL_bostr, align 8
  %2225 = ptrtoint i8* %locinput.0 to i64
  %2226 = ptrtoint i8* %2224 to i64
  %2227 = sub i64 %2225, %2226
  %2228 = trunc i64 %2227 to i32
  %2229 = getelementptr inbounds %struct.regnode* %scan.0, i32 0, i32 0
  %2230 = load i8* %2229, align 1
  %2231 = zext i8 %2230 to i32
  %2232 = and i32 %2231, 15
  %2233 = sub nsw i32 %2232, 1
  %2234 = add nsw i32 %2233, 2
  %2235 = getelementptr inbounds %struct.regnode* %scan.0, i32 0, i32 0
  %2236 = load i8* %2235, align 1
  %2237 = zext i8 %2236 to i32
  %2238 = ashr i32 %2237, 4
  %2239 = mul nsw i32 %2228, %2238
  %2240 = add nsw i32 %2234, %2239
  %2241 = srem i32 %2240, 8
  %2242 = sdiv i32 %2240, 8
  %2243 = sext i32 %2242 to i64
  %2244 = load i8** @PL_reg_poscache, align 8
  %2245 = getelementptr inbounds i8* %2244, i64 %2243
  %2246 = load i8* %2245, align 1
  %2247 = sext i8 %2246 to i32
  %2248 = shl i32 1, %2241
  %2249 = and i32 %2247, %2248
  %2250 = icmp ne i32 %2249, 0
  br i1 %2250, label %2251, label %2260

; <label>:2251                                    ; preds = %2223
  %2252 = load i8** @PL_reg_poscache, align 8
  %2253 = getelementptr inbounds i8* %2252, i64 0
  %2254 = load i8* %2253, align 1
  %2255 = sext i8 %2254 to i32
  %2256 = and i32 %2255, 1
  %2257 = icmp ne i32 %2256, 0
  br i1 %2257, label %2258, label %2259

; <label>:2258                                    ; preds = %2251
  br label %5028

; <label>:2259                                    ; preds = %2251
  br label %5031

; <label>:2260                                    ; preds = %2223
  %2261 = shl i32 1, %2241
  %2262 = sext i32 %2242 to i64
  %2263 = load i8** @PL_reg_poscache, align 8
  %2264 = getelementptr inbounds i8* %2263, i64 %2262
  %2265 = load i8* %2264, align 1
  %2266 = sext i8 %2265 to i32
  %2267 = or i32 %2266, %2261
  %2268 = trunc i32 %2267 to i8
  store i8 %2268, i8* %2264, align 1
  br label %2269

; <label>:2269                                    ; preds = %2260, %2220
  %cache_offset.0 = phi i32 [ %2242, %2260 ], [ 0, %2220 ]
  %cache_bit.0 = phi i32 [ %2241, %2260 ], [ 0, %2220 ]
  br label %2270

; <label>:2270                                    ; preds = %2269, %2164
  %cache_offset.1 = phi i32 [ %cache_offset.0, %2269 ], [ 0, %2164 ]
  %cache_bit.1 = phi i32 [ %cache_bit.0, %2269 ], [ 0, %2164 ]
  %2271 = getelementptr inbounds %struct.curcur* %2113, i32 0, i32 4
  %2272 = load i32* %2271, align 4
  %2273 = icmp ne i32 %2272, 0
  br i1 %2273, label %2274, label %2530

; <label>:2274                                    ; preds = %2270
  %2275 = getelementptr inbounds %struct.curcur* %2113, i32 0, i32 8
  %2276 = load %struct.curcur** %2275, align 8
  store %struct.curcur* %2276, %struct.curcur** @PL_regcc, align 8
  %2277 = load %struct.curcur** @PL_regcc, align 8
  %2278 = icmp ne %struct.curcur* %2277, null
  br i1 %2278, label %2279, label %2283

; <label>:2279                                    ; preds = %2274
  %2280 = load %struct.curcur** @PL_regcc, align 8
  %2281 = getelementptr inbounds %struct.curcur* %2280, i32 0, i32 1
  %2282 = load i32* %2281, align 4
  br label %2283

; <label>:2283                                    ; preds = %2279, %2274
  %ln.6 = phi i32 [ %2282, %2279 ], [ %ln.0, %2274 ]
  %2284 = getelementptr inbounds %struct.curcur* %2113, i32 0, i32 0
  %2285 = load i32* %2284, align 4
  %2286 = call i32 (i32, ...)* bitcast (i32 (...)* @regcppush to i32 (i32, ...)*)(i32 %2285)
  %2287 = load i32* @PL_savestack_ix, align 4
  %2288 = getelementptr inbounds %struct.curcur* %2113, i32 0, i32 6
  %2289 = load %struct.regnode** %2288, align 8
  %2290 = call i32 (%struct.regnode*, ...)* bitcast (i32 (...)* @regmatch to i32 (%struct.regnode*, ...)*)(%struct.regnode* %2289)
  %2291 = icmp ne i32 %2290, 0
  br i1 %2291, label %2292, label %2333

; <label>:2292                                    ; preds = %2283
  %2293 = load i32* @PL_savestack_ix, align 4
  %2294 = icmp sgt i32 %2293, %2286
  br i1 %2294, label %2295, label %2296

; <label>:2295                                    ; preds = %2292
  call void @Perl_leave_scope(i32 %2286)
  br label %2296

; <label>:2296                                    ; preds = %2295, %2292
  %2297 = or i32 %cache_offset.1, %cache_bit.1
  %2298 = icmp ne i32 %2297, 0
  br i1 %2298, label %2299, label %2332

; <label>:2299                                    ; preds = %2296
  %2300 = load i8** @PL_reg_poscache, align 8
  %2301 = getelementptr inbounds i8* %2300, i64 0
  %2302 = load i8* %2301, align 1
  %2303 = sext i8 %2302 to i32
  %2304 = and i32 %2303, 2
  %2305 = icmp ne i32 %2304, 0
  br i1 %2305, label %2313, label %2306

; <label>:2306                                    ; preds = %2299
  %2307 = load i8** @PL_reg_poscache, align 8
  %2308 = getelementptr inbounds i8* %2307, i64 0
  %2309 = load i8* %2308, align 1
  %2310 = sext i8 %2309 to i32
  %2311 = or i32 %2310, 1
  %2312 = trunc i32 %2311 to i8
  store i8 %2312, i8* %2308, align 1
  br label %2331

; <label>:2313                                    ; preds = %2299
  %2314 = load i8** @PL_reg_poscache, align 8
  %2315 = getelementptr inbounds i8* %2314, i64 0
  %2316 = load i8* %2315, align 1
  %2317 = sext i8 %2316 to i32
  %2318 = and i32 %2317, 1
  %2319 = icmp ne i32 %2318, 0
  br i1 %2319, label %2330, label %2320

; <label>:2320                                    ; preds = %2313
  %2321 = shl i32 1, %cache_bit.1
  %2322 = xor i32 %2321, -1
  %2323 = sext i32 %cache_offset.1 to i64
  %2324 = load i8** @PL_reg_poscache, align 8
  %2325 = getelementptr inbounds i8* %2324, i64 %2323
  %2326 = load i8* %2325, align 1
  %2327 = sext i8 %2326 to i32
  %2328 = and i32 %2327, %2322
  %2329 = trunc i32 %2328 to i8
  store i8 %2329, i8* %2325, align 1
  br label %2330

; <label>:2330                                    ; preds = %2320, %2313
  br label %2331

; <label>:2331                                    ; preds = %2330, %2306
  br label %2332

; <label>:2332                                    ; preds = %2331, %2296
  br label %5028

; <label>:2333                                    ; preds = %2283
  %2334 = load i32* @PL_savestack_ix, align 4
  %2335 = icmp sgt i32 %2334, %2287
  br i1 %2335, label %2336, label %2337

; <label>:2336                                    ; preds = %2333
  call void @Perl_leave_scope(i32 %2287)
  br label %2337

; <label>:2337                                    ; preds = %2336, %2333
  %2338 = call i32 (...)* @regcppop()
  %2339 = load %struct.curcur** @PL_regcc, align 8
  %2340 = icmp ne %struct.curcur* %2339, null
  br i1 %2340, label %2341, label %2344

; <label>:2341                                    ; preds = %2337
  %2342 = load %struct.curcur** @PL_regcc, align 8
  %2343 = getelementptr inbounds %struct.curcur* %2342, i32 0, i32 1
  store i32 %ln.6, i32* %2343, align 4
  br label %2344

; <label>:2344                                    ; preds = %2341, %2337
  store %struct.curcur* %2113, %struct.curcur** @PL_regcc, align 8
  %2345 = getelementptr inbounds %struct.curcur* %2113, i32 0, i32 3
  %2346 = load i32* %2345, align 4
  %2347 = icmp sge i32 %2118, %2346
  br i1 %2347, label %2348, label %2433

; <label>:2348                                    ; preds = %2344
  %2349 = load volatile %struct.cop** @PL_curcop, align 8
  %2350 = getelementptr inbounds %struct.cop* %2349, i32 0, i32 14
  %2351 = load %struct.sv** %2350, align 8
  %2352 = icmp ne %struct.sv* %2351, null
  br i1 %2352, label %2353, label %2377

; <label>:2353                                    ; preds = %2348
  %2354 = load volatile %struct.cop** @PL_curcop, align 8
  %2355 = getelementptr inbounds %struct.cop* %2354, i32 0, i32 14
  %2356 = load %struct.sv** %2355, align 8
  %2357 = icmp ne %struct.sv* %2356, getelementptr inbounds (%struct.sv* null, i64 2)
  br i1 %2357, label %2358, label %2377

; <label>:2358                                    ; preds = %2353
  %2359 = load volatile %struct.cop** @PL_curcop, align 8
  %2360 = getelementptr inbounds %struct.cop* %2359, i32 0, i32 14
  %2361 = load %struct.sv** %2360, align 8
  %2362 = icmp eq %struct.sv* %2361, getelementptr inbounds (%struct.sv* null, i64 1)
  br i1 %2362, label %2387, label %2363

; <label>:2363                                    ; preds = %2358
  %2364 = load volatile %struct.cop** @PL_curcop, align 8
  %2365 = getelementptr inbounds %struct.cop* %2364, i32 0, i32 14
  %2366 = load %struct.sv** %2365, align 8
  %2367 = getelementptr inbounds %struct.sv* %2366, i32 0, i32 0
  %2368 = load i8** %2367, align 8
  %2369 = bitcast i8* %2368 to %struct.xpv*
  %2370 = getelementptr inbounds %struct.xpv* %2369, i32 0, i32 0
  %2371 = load i8** %2370, align 8
  %2372 = getelementptr inbounds i8* %2371, i64 5
  %2373 = load i8* %2372, align 1
  %2374 = sext i8 %2373 to i32
  %2375 = and i32 %2374, 1
  %2376 = icmp ne i32 %2375, 0
  br i1 %2376, label %2387, label %2377

; <label>:2377                                    ; preds = %2363, %2353, %2348
  %2378 = load volatile %struct.cop** @PL_curcop, align 8
  %2379 = getelementptr inbounds %struct.cop* %2378, i32 0, i32 14
  %2380 = load %struct.sv** %2379, align 8
  %2381 = icmp eq %struct.sv* %2380, null
  br i1 %2381, label %2382, label %2396

; <label>:2382                                    ; preds = %2377
  %2383 = load i8* @PL_dowarn, align 1
  %2384 = zext i8 %2383 to i32
  %2385 = and i32 %2384, 1
  %2386 = icmp ne i32 %2385, 0
  br i1 %2386, label %2387, label %2396

; <label>:2387                                    ; preds = %2382, %2363, %2358
  %2388 = icmp sge i32 %2118, 32767
  br i1 %2388, label %2389, label %2396

; <label>:2389                                    ; preds = %2387
  %2390 = load i32* @PL_reg_flags, align 4
  %2391 = and i32 %2390, 2
  %2392 = icmp ne i32 %2391, 0
  br i1 %2392, label %2396, label %2393

; <label>:2393                                    ; preds = %2389
  %2394 = load i32* @PL_reg_flags, align 4
  %2395 = or i32 %2394, 2
  store i32 %2395, i32* @PL_reg_flags, align 4
  call void (i32, i8*, ...)* @Perl_warner(i32 20, i8* getelementptr inbounds ([23 x i8]* @.str6, i32 0, i32 0), i8* getelementptr inbounds ([40 x i8]* @.str7, i32 0, i32 0), i32 32766)
  br label %2396

; <label>:2396                                    ; preds = %2393, %2389, %2387, %2382, %2377
  %2397 = or i32 %cache_offset.1, %cache_bit.1
  %2398 = icmp ne i32 %2397, 0
  br i1 %2398, label %2399, label %2432

; <label>:2399                                    ; preds = %2396
  %2400 = load i8** @PL_reg_poscache, align 8
  %2401 = getelementptr inbounds i8* %2400, i64 0
  %2402 = load i8* %2401, align 1
  %2403 = sext i8 %2402 to i32
  %2404 = and i32 %2403, 2
  %2405 = icmp ne i32 %2404, 0
  br i1 %2405, label %2413, label %2406

; <label>:2406                                    ; preds = %2399
  %2407 = load i8** @PL_reg_poscache, align 8
  %2408 = getelementptr inbounds i8* %2407, i64 0
  %2409 = load i8* %2408, align 1
  %2410 = sext i8 %2409 to i32
  %2411 = or i32 %2410, 2
  %2412 = trunc i32 %2411 to i8
  store i8 %2412, i8* %2408, align 1
  br label %2431

; <label>:2413                                    ; preds = %2399
  %2414 = load i8** @PL_reg_poscache, align 8
  %2415 = getelementptr inbounds i8* %2414, i64 0
  %2416 = load i8* %2415, align 1
  %2417 = sext i8 %2416 to i32
  %2418 = and i32 %2417, 1
  %2419 = icmp ne i32 %2418, 0
  br i1 %2419, label %2420, label %2430

; <label>:2420                                    ; preds = %2413
  %2421 = shl i32 1, %cache_bit.1
  %2422 = xor i32 %2421, -1
  %2423 = sext i32 %cache_offset.1 to i64
  %2424 = load i8** @PL_reg_poscache, align 8
  %2425 = getelementptr inbounds i8* %2424, i64 %2423
  %2426 = load i8* %2425, align 1
  %2427 = sext i8 %2426 to i32
  %2428 = and i32 %2427, %2422
  %2429 = trunc i32 %2428 to i8
  store i8 %2429, i8* %2425, align 1
  br label %2430

; <label>:2430                                    ; preds = %2420, %2413
  br label %2431

; <label>:2431                                    ; preds = %2430, %2406
  br label %2432

; <label>:2432                                    ; preds = %2431, %2396
  br label %5029

; <label>:2433                                    ; preds = %2344
  store i8* %locinput.0, i8** @PL_reginput, align 8
  %2434 = getelementptr inbounds %struct.curcur* %2113, i32 0, i32 1
  store i32 %2118, i32* %2434, align 4
  %2435 = getelementptr inbounds %struct.curcur* %2113, i32 0, i32 7
  store i8* %locinput.0, i8** %2435, align 8
  %2436 = getelementptr inbounds %struct.curcur* %2113, i32 0, i32 0
  %2437 = load i32* %2436, align 4
  %2438 = call i32 (i32, ...)* bitcast (i32 (...)* @regcppush to i32 (i32, ...)*)(i32 %2437)
  %2439 = load i32* @PL_savestack_ix, align 4
  %2440 = getelementptr inbounds %struct.curcur* %2113, i32 0, i32 5
  %2441 = load %struct.regnode** %2440, align 8
  %2442 = call i32 (%struct.regnode*, ...)* bitcast (i32 (...)* @regmatch to i32 (%struct.regnode*, ...)*)(%struct.regnode* %2441)
  %2443 = icmp ne i32 %2442, 0
  br i1 %2443, label %2444, label %2485

; <label>:2444                                    ; preds = %2433
  %2445 = load i32* @PL_savestack_ix, align 4
  %2446 = icmp sgt i32 %2445, %2438
  br i1 %2446, label %2447, label %2448

; <label>:2447                                    ; preds = %2444
  call void @Perl_leave_scope(i32 %2438)
  br label %2448

; <label>:2448                                    ; preds = %2447, %2444
  %2449 = or i32 %cache_offset.1, %cache_bit.1
  %2450 = icmp ne i32 %2449, 0
  br i1 %2450, label %2451, label %2484

; <label>:2451                                    ; preds = %2448
  %2452 = load i8** @PL_reg_poscache, align 8
  %2453 = getelementptr inbounds i8* %2452, i64 0
  %2454 = load i8* %2453, align 1
  %2455 = sext i8 %2454 to i32
  %2456 = and i32 %2455, 2
  %2457 = icmp ne i32 %2456, 0
  br i1 %2457, label %2465, label %2458

; <label>:2458                                    ; preds = %2451
  %2459 = load i8** @PL_reg_poscache, align 8
  %2460 = getelementptr inbounds i8* %2459, i64 0
  %2461 = load i8* %2460, align 1
  %2462 = sext i8 %2461 to i32
  %2463 = or i32 %2462, 1
  %2464 = trunc i32 %2463 to i8
  store i8 %2464, i8* %2460, align 1
  br label %2483

; <label>:2465                                    ; preds = %2451
  %2466 = load i8** @PL_reg_poscache, align 8
  %2467 = getelementptr inbounds i8* %2466, i64 0
  %2468 = load i8* %2467, align 1
  %2469 = sext i8 %2468 to i32
  %2470 = and i32 %2469, 1
  %2471 = icmp ne i32 %2470, 0
  br i1 %2471, label %2482, label %2472

; <label>:2472                                    ; preds = %2465
  %2473 = shl i32 1, %cache_bit.1
  %2474 = xor i32 %2473, -1
  %2475 = sext i32 %cache_offset.1 to i64
  %2476 = load i8** @PL_reg_poscache, align 8
  %2477 = getelementptr inbounds i8* %2476, i64 %2475
  %2478 = load i8* %2477, align 1
  %2479 = sext i8 %2478 to i32
  %2480 = and i32 %2479, %2474
  %2481 = trunc i32 %2480 to i8
  store i8 %2481, i8* %2477, align 1
  br label %2482

; <label>:2482                                    ; preds = %2472, %2465
  br label %2483

; <label>:2483                                    ; preds = %2482, %2458
  br label %2484

; <label>:2484                                    ; preds = %2483, %2448
  br label %5028

; <label>:2485                                    ; preds = %2433
  %2486 = load i32* @PL_savestack_ix, align 4
  %2487 = icmp sgt i32 %2486, %2439
  br i1 %2487, label %2488, label %2489

; <label>:2488                                    ; preds = %2485
  call void @Perl_leave_scope(i32 %2439)
  br label %2489

; <label>:2489                                    ; preds = %2488, %2485
  %2490 = call i32 (...)* @regcppop()
  %2491 = sub nsw i32 %2118, 1
  %2492 = getelementptr inbounds %struct.curcur* %2113, i32 0, i32 1
  store i32 %2491, i32* %2492, align 4
  %2493 = getelementptr inbounds %struct.curcur* %2113, i32 0, i32 7
  store i8* %2115, i8** %2493, align 8
  %2494 = or i32 %cache_offset.1, %cache_bit.1
  %2495 = icmp ne i32 %2494, 0
  br i1 %2495, label %2496, label %2529

; <label>:2496                                    ; preds = %2489
  %2497 = load i8** @PL_reg_poscache, align 8
  %2498 = getelementptr inbounds i8* %2497, i64 0
  %2499 = load i8* %2498, align 1
  %2500 = sext i8 %2499 to i32
  %2501 = and i32 %2500, 2
  %2502 = icmp ne i32 %2501, 0
  br i1 %2502, label %2510, label %2503

; <label>:2503                                    ; preds = %2496
  %2504 = load i8** @PL_reg_poscache, align 8
  %2505 = getelementptr inbounds i8* %2504, i64 0
  %2506 = load i8* %2505, align 1
  %2507 = sext i8 %2506 to i32
  %2508 = or i32 %2507, 2
  %2509 = trunc i32 %2508 to i8
  store i8 %2509, i8* %2505, align 1
  br label %2528

; <label>:2510                                    ; preds = %2496
  %2511 = load i8** @PL_reg_poscache, align 8
  %2512 = getelementptr inbounds i8* %2511, i64 0
  %2513 = load i8* %2512, align 1
  %2514 = sext i8 %2513 to i32
  %2515 = and i32 %2514, 1
  %2516 = icmp ne i32 %2515, 0
  br i1 %2516, label %2517, label %2527

; <label>:2517                                    ; preds = %2510
  %2518 = shl i32 1, %cache_bit.1
  %2519 = xor i32 %2518, -1
  %2520 = sext i32 %cache_offset.1 to i64
  %2521 = load i8** @PL_reg_poscache, align 8
  %2522 = getelementptr inbounds i8* %2521, i64 %2520
  %2523 = load i8* %2522, align 1
  %2524 = sext i8 %2523 to i32
  %2525 = and i32 %2524, %2519
  %2526 = trunc i32 %2525 to i8
  store i8 %2526, i8* %2522, align 1
  br label %2527

; <label>:2527                                    ; preds = %2517, %2510
  br label %2528

; <label>:2528                                    ; preds = %2527, %2503
  br label %2529

; <label>:2529                                    ; preds = %2528, %2489
  br label %5029

; <label>:2530                                    ; preds = %2270
  %2531 = getelementptr inbounds %struct.curcur* %2113, i32 0, i32 3
  %2532 = load i32* %2531, align 4
  %2533 = icmp slt i32 %2118, %2532
  br i1 %2533, label %2534, label %2592

; <label>:2534                                    ; preds = %2530
  %2535 = getelementptr inbounds %struct.curcur* %2113, i32 0, i32 0
  %2536 = load i32* %2535, align 4
  %2537 = call i32 (i32, ...)* bitcast (i32 (...)* @regcppush to i32 (i32, ...)*)(i32 %2536)
  %2538 = getelementptr inbounds %struct.curcur* %2113, i32 0, i32 1
  store i32 %2118, i32* %2538, align 4
  %2539 = getelementptr inbounds %struct.curcur* %2113, i32 0, i32 7
  store i8* %locinput.0, i8** %2539, align 8
  %2540 = load i32* @PL_savestack_ix, align 4
  %2541 = getelementptr inbounds %struct.curcur* %2113, i32 0, i32 5
  %2542 = load %struct.regnode** %2541, align 8
  %2543 = call i32 (%struct.regnode*, ...)* bitcast (i32 (...)* @regmatch to i32 (%struct.regnode*, ...)*)(%struct.regnode* %2542)
  %2544 = icmp ne i32 %2543, 0
  br i1 %2544, label %2545, label %2586

; <label>:2545                                    ; preds = %2534
  %2546 = load i32* @PL_savestack_ix, align 4
  %2547 = icmp sgt i32 %2546, %2537
  br i1 %2547, label %2548, label %2549

; <label>:2548                                    ; preds = %2545
  call void @Perl_leave_scope(i32 %2537)
  br label %2549

; <label>:2549                                    ; preds = %2548, %2545
  %2550 = or i32 %cache_offset.1, %cache_bit.1
  %2551 = icmp ne i32 %2550, 0
  br i1 %2551, label %2552, label %2585

; <label>:2552                                    ; preds = %2549
  %2553 = load i8** @PL_reg_poscache, align 8
  %2554 = getelementptr inbounds i8* %2553, i64 0
  %2555 = load i8* %2554, align 1
  %2556 = sext i8 %2555 to i32
  %2557 = and i32 %2556, 2
  %2558 = icmp ne i32 %2557, 0
  br i1 %2558, label %2566, label %2559

; <label>:2559                                    ; preds = %2552
  %2560 = load i8** @PL_reg_poscache, align 8
  %2561 = getelementptr inbounds i8* %2560, i64 0
  %2562 = load i8* %2561, align 1
  %2563 = sext i8 %2562 to i32
  %2564 = or i32 %2563, 1
  %2565 = trunc i32 %2564 to i8
  store i8 %2565, i8* %2561, align 1
  br label %2584

; <label>:2566                                    ; preds = %2552
  %2567 = load i8** @PL_reg_poscache, align 8
  %2568 = getelementptr inbounds i8* %2567, i64 0
  %2569 = load i8* %2568, align 1
  %2570 = sext i8 %2569 to i32
  %2571 = and i32 %2570, 1
  %2572 = icmp ne i32 %2571, 0
  br i1 %2572, label %2583, label %2573

; <label>:2573                                    ; preds = %2566
  %2574 = shl i32 1, %cache_bit.1
  %2575 = xor i32 %2574, -1
  %2576 = sext i32 %cache_offset.1 to i64
  %2577 = load i8** @PL_reg_poscache, align 8
  %2578 = getelementptr inbounds i8* %2577, i64 %2576
  %2579 = load i8* %2578, align 1
  %2580 = sext i8 %2579 to i32
  %2581 = and i32 %2580, %2575
  %2582 = trunc i32 %2581 to i8
  store i8 %2582, i8* %2578, align 1
  br label %2583

; <label>:2583                                    ; preds = %2573, %2566
  br label %2584

; <label>:2584                                    ; preds = %2583, %2559
  br label %2585

; <label>:2585                                    ; preds = %2584, %2549
  br label %5028

; <label>:2586                                    ; preds = %2534
  %2587 = load i32* @PL_savestack_ix, align 4
  %2588 = icmp sgt i32 %2587, %2540
  br i1 %2588, label %2589, label %2590

; <label>:2589                                    ; preds = %2586
  call void @Perl_leave_scope(i32 %2540)
  br label %2590

; <label>:2590                                    ; preds = %2589, %2586
  %2591 = call i32 (...)* @regcppop()
  store i8* %locinput.0, i8** @PL_reginput, align 8
  br label %2592

; <label>:2592                                    ; preds = %2590, %2530
  %2593 = load volatile %struct.cop** @PL_curcop, align 8
  %2594 = getelementptr inbounds %struct.cop* %2593, i32 0, i32 14
  %2595 = load %struct.sv** %2594, align 8
  %2596 = icmp ne %struct.sv* %2595, null
  br i1 %2596, label %2597, label %2621

; <label>:2597                                    ; preds = %2592
  %2598 = load volatile %struct.cop** @PL_curcop, align 8
  %2599 = getelementptr inbounds %struct.cop* %2598, i32 0, i32 14
  %2600 = load %struct.sv** %2599, align 8
  %2601 = icmp ne %struct.sv* %2600, getelementptr inbounds (%struct.sv* null, i64 2)
  br i1 %2601, label %2602, label %2621

; <label>:2602                                    ; preds = %2597
  %2603 = load volatile %struct.cop** @PL_curcop, align 8
  %2604 = getelementptr inbounds %struct.cop* %2603, i32 0, i32 14
  %2605 = load %struct.sv** %2604, align 8
  %2606 = icmp eq %struct.sv* %2605, getelementptr inbounds (%struct.sv* null, i64 1)
  br i1 %2606, label %2631, label %2607

; <label>:2607                                    ; preds = %2602
  %2608 = load volatile %struct.cop** @PL_curcop, align 8
  %2609 = getelementptr inbounds %struct.cop* %2608, i32 0, i32 14
  %2610 = load %struct.sv** %2609, align 8
  %2611 = getelementptr inbounds %struct.sv* %2610, i32 0, i32 0
  %2612 = load i8** %2611, align 8
  %2613 = bitcast i8* %2612 to %struct.xpv*
  %2614 = getelementptr inbounds %struct.xpv* %2613, i32 0, i32 0
  %2615 = load i8** %2614, align 8
  %2616 = getelementptr inbounds i8* %2615, i64 5
  %2617 = load i8* %2616, align 1
  %2618 = sext i8 %2617 to i32
  %2619 = and i32 %2618, 1
  %2620 = icmp ne i32 %2619, 0
  br i1 %2620, label %2631, label %2621

; <label>:2621                                    ; preds = %2607, %2597, %2592
  %2622 = load volatile %struct.cop** @PL_curcop, align 8
  %2623 = getelementptr inbounds %struct.cop* %2622, i32 0, i32 14
  %2624 = load %struct.sv** %2623, align 8
  %2625 = icmp eq %struct.sv* %2624, null
  br i1 %2625, label %2626, label %2640

; <label>:2626                                    ; preds = %2621
  %2627 = load i8* @PL_dowarn, align 1
  %2628 = zext i8 %2627 to i32
  %2629 = and i32 %2628, 1
  %2630 = icmp ne i32 %2629, 0
  br i1 %2630, label %2631, label %2640

; <label>:2631                                    ; preds = %2626, %2607, %2602
  %2632 = icmp sge i32 %2118, 32767
  br i1 %2632, label %2633, label %2640

; <label>:2633                                    ; preds = %2631
  %2634 = load i32* @PL_reg_flags, align 4
  %2635 = and i32 %2634, 2
  %2636 = icmp ne i32 %2635, 0
  br i1 %2636, label %2640, label %2637

; <label>:2637                                    ; preds = %2633
  %2638 = load i32* @PL_reg_flags, align 4
  %2639 = or i32 %2638, 2
  store i32 %2639, i32* @PL_reg_flags, align 4
  call void (i32, i8*, ...)* @Perl_warner(i32 20, i8* getelementptr inbounds ([23 x i8]* @.str6, i32 0, i32 0), i8* getelementptr inbounds ([40 x i8]* @.str7, i32 0, i32 0), i32 32766)
  br label %2640

; <label>:2640                                    ; preds = %2637, %2633, %2631, %2626, %2621
  %2641 = getelementptr inbounds %struct.curcur* %2113, i32 0, i32 8
  %2642 = load %struct.curcur** %2641, align 8
  store %struct.curcur* %2642, %struct.curcur** @PL_regcc, align 8
  %2643 = load %struct.curcur** @PL_regcc, align 8
  %2644 = icmp ne %struct.curcur* %2643, null
  br i1 %2644, label %2645, label %2649

; <label>:2645                                    ; preds = %2640
  %2646 = load %struct.curcur** @PL_regcc, align 8
  %2647 = getelementptr inbounds %struct.curcur* %2646, i32 0, i32 1
  %2648 = load i32* %2647, align 4
  br label %2649

; <label>:2649                                    ; preds = %2645, %2640
  %ln.7 = phi i32 [ %2648, %2645 ], [ %ln.0, %2640 ]
  %2650 = getelementptr inbounds %struct.curcur* %2113, i32 0, i32 6
  %2651 = load %struct.regnode** %2650, align 8
  %2652 = call i32 (%struct.regnode*, ...)* bitcast (i32 (...)* @regmatch to i32 (%struct.regnode*, ...)*)(%struct.regnode* %2651)
  %2653 = icmp ne i32 %2652, 0
  br i1 %2653, label %2654, label %2691

; <label>:2654                                    ; preds = %2649
  %2655 = or i32 %cache_offset.1, %cache_bit.1
  %2656 = icmp ne i32 %2655, 0
  br i1 %2656, label %2657, label %2690

; <label>:2657                                    ; preds = %2654
  %2658 = load i8** @PL_reg_poscache, align 8
  %2659 = getelementptr inbounds i8* %2658, i64 0
  %2660 = load i8* %2659, align 1
  %2661 = sext i8 %2660 to i32
  %2662 = and i32 %2661, 2
  %2663 = icmp ne i32 %2662, 0
  br i1 %2663, label %2671, label %2664

; <label>:2664                                    ; preds = %2657
  %2665 = load i8** @PL_reg_poscache, align 8
  %2666 = getelementptr inbounds i8* %2665, i64 0
  %2667 = load i8* %2666, align 1
  %2668 = sext i8 %2667 to i32
  %2669 = or i32 %2668, 1
  %2670 = trunc i32 %2669 to i8
  store i8 %2670, i8* %2666, align 1
  br label %2689

; <label>:2671                                    ; preds = %2657
  %2672 = load i8** @PL_reg_poscache, align 8
  %2673 = getelementptr inbounds i8* %2672, i64 0
  %2674 = load i8* %2673, align 1
  %2675 = sext i8 %2674 to i32
  %2676 = and i32 %2675, 1
  %2677 = icmp ne i32 %2676, 0
  br i1 %2677, label %2688, label %2678

; <label>:2678                                    ; preds = %2671
  %2679 = shl i32 1, %cache_bit.1
  %2680 = xor i32 %2679, -1
  %2681 = sext i32 %cache_offset.1 to i64
  %2682 = load i8** @PL_reg_poscache, align 8
  %2683 = getelementptr inbounds i8* %2682, i64 %2681
  %2684 = load i8* %2683, align 1
  %2685 = sext i8 %2684 to i32
  %2686 = and i32 %2685, %2680
  %2687 = trunc i32 %2686 to i8
  store i8 %2687, i8* %2683, align 1
  br label %2688

; <label>:2688                                    ; preds = %2678, %2671
  br label %2689

; <label>:2689                                    ; preds = %2688, %2664
  br label %2690

; <label>:2690                                    ; preds = %2689, %2654
  br label %5028

; <label>:2691                                    ; preds = %2649
  %2692 = load %struct.curcur** @PL_regcc, align 8
  %2693 = icmp ne %struct.curcur* %2692, null
  br i1 %2693, label %2694, label %2697

; <label>:2694                                    ; preds = %2691
  %2695 = load %struct.curcur** @PL_regcc, align 8
  %2696 = getelementptr inbounds %struct.curcur* %2695, i32 0, i32 1
  store i32 %ln.7, i32* %2696, align 4
  br label %2697

; <label>:2697                                    ; preds = %2694, %2691
  store %struct.curcur* %2113, %struct.curcur** @PL_regcc, align 8
  %2698 = sub nsw i32 %2118, 1
  %2699 = getelementptr inbounds %struct.curcur* %2113, i32 0, i32 1
  store i32 %2698, i32* %2699, align 4
  %2700 = getelementptr inbounds %struct.curcur* %2113, i32 0, i32 7
  store i8* %2115, i8** %2700, align 8
  %2701 = or i32 %cache_offset.1, %cache_bit.1
  %2702 = icmp ne i32 %2701, 0
  br i1 %2702, label %2703, label %2736

; <label>:2703                                    ; preds = %2697
  %2704 = load i8** @PL_reg_poscache, align 8
  %2705 = getelementptr inbounds i8* %2704, i64 0
  %2706 = load i8* %2705, align 1
  %2707 = sext i8 %2706 to i32
  %2708 = and i32 %2707, 2
  %2709 = icmp ne i32 %2708, 0
  br i1 %2709, label %2717, label %2710

; <label>:2710                                    ; preds = %2703
  %2711 = load i8** @PL_reg_poscache, align 8
  %2712 = getelementptr inbounds i8* %2711, i64 0
  %2713 = load i8* %2712, align 1
  %2714 = sext i8 %2713 to i32
  %2715 = or i32 %2714, 2
  %2716 = trunc i32 %2715 to i8
  store i8 %2716, i8* %2712, align 1
  br label %2735

; <label>:2717                                    ; preds = %2703
  %2718 = load i8** @PL_reg_poscache, align 8
  %2719 = getelementptr inbounds i8* %2718, i64 0
  %2720 = load i8* %2719, align 1
  %2721 = sext i8 %2720 to i32
  %2722 = and i32 %2721, 1
  %2723 = icmp ne i32 %2722, 0
  br i1 %2723, label %2724, label %2734

; <label>:2724                                    ; preds = %2717
  %2725 = shl i32 1, %cache_bit.1
  %2726 = xor i32 %2725, -1
  %2727 = sext i32 %cache_offset.1 to i64
  %2728 = load i8** @PL_reg_poscache, align 8
  %2729 = getelementptr inbounds i8* %2728, i64 %2727
  %2730 = load i8* %2729, align 1
  %2731 = sext i8 %2730 to i32
  %2732 = and i32 %2731, %2726
  %2733 = trunc i32 %2732 to i8
  store i8 %2733, i8* %2729, align 1
  br label %2734

; <label>:2734                                    ; preds = %2724, %2717
  br label %2735

; <label>:2735                                    ; preds = %2734, %2710
  br label %2736

; <label>:2736                                    ; preds = %2735, %2697
  br label %5029

; <label>:2737                                    ; preds = %15
  %2738 = bitcast %struct.regnode* %scan.0 to %struct.regnode_1*
  %2739 = getelementptr inbounds %struct.regnode_1* %2738, i32 0, i32 3
  %2740 = load i32* %2739, align 4
  %2741 = zext i32 %2740 to i64
  %2742 = getelementptr inbounds %struct.regnode* %scan.0, i64 %2741
  %2743 = icmp eq %struct.regnode* %2742, %scan.0
  br i1 %2743, label %2744, label %2745

; <label>:2744                                    ; preds = %2737
  br label %2745

; <label>:2745                                    ; preds = %2744, %2737
  %next.4 = phi %struct.regnode* [ null, %2744 ], [ %2742, %2737 ]
  %2746 = getelementptr inbounds %struct.regnode* %scan.0, i64 1
  %2747 = getelementptr inbounds %struct.regnode* %2746, i64 1
  br label %2750

; <label>:2748                                    ; preds = %15
  %2749 = getelementptr inbounds %struct.regnode* %scan.0, i64 1
  br label %2750

; <label>:2750                                    ; preds = %2748, %2745
  %inner.0 = phi %struct.regnode* [ %2749, %2748 ], [ %2747, %2745 ]
  %next.5 = phi %struct.regnode* [ %next.0, %2748 ], [ %next.4, %2745 ]
  %2751 = getelementptr inbounds %struct.regnode* %scan.0, i32 0, i32 1
  %2752 = load i8* %2751, align 1
  %2753 = zext i8 %2752 to i32
  %2754 = getelementptr inbounds %struct.regnode* %next.5, i32 0, i32 1
  %2755 = load i8* %2754, align 1
  %2756 = zext i8 %2755 to i32
  %2757 = icmp ne i32 %2756, %2753
  br i1 %2757, label %2758, label %2759

; <label>:2758                                    ; preds = %2750
  br label %2778

; <label>:2759                                    ; preds = %2750
  %2760 = load i32** @PL_reglastparen, align 8
  %2761 = load i32* %2760, align 4
  %2762 = call i32 @Perl_save_alloc(i32 40, i32 0)
  %2763 = load %union.any** @PL_savestack, align 8
  %2764 = bitcast %union.any* %2763 to i8*
  %2765 = sext i32 %2762 to i64
  %2766 = getelementptr inbounds i8* %2764, i64 %2765
  %2767 = bitcast i8* %2766 to %struct.re_unwind_branch_t*
  %2768 = getelementptr inbounds %struct.re_unwind_branch_t* %2767, i32 0, i32 1
  store i32 %unwind.0, i32* %2768, align 4
  %2769 = icmp eq i32 %2753, 31
  %2770 = select i1 %2769, i32 1, i32 2
  %2771 = getelementptr inbounds %struct.re_unwind_branch_t* %2767, i32 0, i32 0
  store i32 %2770, i32* %2771, align 4
  %2772 = getelementptr inbounds %struct.re_unwind_branch_t* %2767, i32 0, i32 3
  store i32 %2761, i32* %2772, align 4
  %2773 = getelementptr inbounds %struct.re_unwind_branch_t* %2767, i32 0, i32 4
  store %struct.regnode* %next.5, %struct.regnode** %2773, align 8
  %2774 = getelementptr inbounds %struct.re_unwind_branch_t* %2767, i32 0, i32 5
  store i8* %locinput.0, i8** %2774, align 8
  %2775 = getelementptr inbounds %struct.re_unwind_branch_t* %2767, i32 0, i32 6
  store i32 %nextchr.0, i32* %2775, align 4
  %2776 = load i32* @PL_savestack_ix, align 4
  %2777 = getelementptr inbounds %struct.re_unwind_branch_t* %2767, i32 0, i32 2
  store i32 %2776, i32* %2777, align 4
  br label %2778

; <label>:2778                                    ; preds = %2759, %2758
  %unwind.1 = phi i32 [ %unwind.0, %2758 ], [ %2762, %2759 ]
  br label %5023

; <label>:2779                                    ; preds = %15
  br label %5023

; <label>:2780                                    ; preds = %15
  store i32 0, i32* %l9, align 4
  %2781 = bitcast %struct.regnode* %scan.0 to %struct.regnode_2*
  %2782 = getelementptr inbounds %struct.regnode_2* %2781, i32 0, i32 3
  %2783 = load i16* %2782, align 2
  %2784 = zext i16 %2783 to i32
  %2785 = bitcast %struct.regnode* %scan.0 to %struct.regnode_2*
  %2786 = getelementptr inbounds %struct.regnode_2* %2785, i32 0, i32 4
  %2787 = load i16* %2786, align 2
  %2788 = zext i16 %2787 to i32
  %2789 = getelementptr inbounds %struct.regnode* %scan.0, i32 0, i32 0
  %2790 = load i8* %2789, align 1
  %2791 = zext i8 %2790 to i32
  %2792 = icmp ne i32 %2791, 0
  br i1 %2792, label %2793, label %2804

; <label>:2793                                    ; preds = %2780
  %2794 = load i32* @PL_regsize, align 4
  %2795 = icmp sgt i32 %2791, %2794
  br i1 %2795, label %2796, label %2797

; <label>:2796                                    ; preds = %2793
  store i32 %2791, i32* @PL_regsize, align 4
  br label %2797

; <label>:2797                                    ; preds = %2796, %2793
  %2798 = load i32** @PL_reglastparen, align 8
  %2799 = load i32* %2798, align 4
  %2800 = icmp sgt i32 %2791, %2799
  br i1 %2800, label %2801, label %2803

; <label>:2801                                    ; preds = %2797
  %2802 = load i32** @PL_reglastparen, align 8
  store i32 %2791, i32* %2802, align 4
  br label %2803

; <label>:2803                                    ; preds = %2801, %2797
  br label %2804

; <label>:2804                                    ; preds = %2803, %2780
  %2805 = getelementptr inbounds %struct.regnode* %scan.0, i64 1
  %2806 = getelementptr inbounds %struct.regnode* %2805, i64 1
  %2807 = icmp ne i32 %2791, 0
  br i1 %2807, label %2808, label %2814

; <label>:2808                                    ; preds = %2804
  %2809 = getelementptr inbounds %struct.regnode* %2806, i32 0, i32 2
  %2810 = load i16* %2809, align 2
  %2811 = zext i16 %2810 to i32
  %2812 = sext i32 %2811 to i64
  %2813 = getelementptr inbounds %struct.regnode* %2806, i64 %2812
  br label %2814

; <label>:2814                                    ; preds = %2808, %2804
  %scan.1 = phi %struct.regnode* [ %2813, %2808 ], [ %2806, %2804 ]
  store i8* %locinput.0, i8** @PL_reginput, align 8
  %2815 = icmp ne i32 %minmod.0, 0
  br i1 %2815, label %2816, label %3167

; <label>:2816                                    ; preds = %2814
  %2817 = icmp ne i32 %2784, 0
  br i1 %2817, label %2818, label %2822

; <label>:2818                                    ; preds = %2816
  %2819 = call i32 (%struct.regnode*, i32, i32*, ...)* bitcast (i32 (...)* @regrepeat_hard to i32 (%struct.regnode*, i32, i32*, ...)*)(%struct.regnode* %scan.1, i32 %2784, i32* %l9)
  %2820 = icmp slt i32 %2819, %2784
  br i1 %2820, label %2821, label %2822

; <label>:2821                                    ; preds = %2818
  br label %5029

; <label>:2822                                    ; preds = %2818, %2816
  %2823 = load i8** @PL_reginput, align 8
  %2824 = getelementptr inbounds %struct.regnode* %next.0, i32 0, i32 1
  %2825 = load i8* %2824, align 1
  %2826 = zext i8 %2825 to i64
  %2827 = getelementptr inbounds [0 x i8]* @PL_regkind, i32 0, i64 %2826
  %2828 = load i8* %2827, align 1
  %2829 = zext i8 %2828 to i32
  %2830 = icmp eq i32 %2829, 33
  br i1 %2830, label %2888, label %2831

; <label>:2831                                    ; preds = %2822
  %2832 = getelementptr inbounds %struct.regnode* %next.0, i32 0, i32 1
  %2833 = load i8* %2832, align 1
  %2834 = zext i8 %2833 to i64
  %2835 = getelementptr inbounds [0 x i8]* @PL_regkind, i32 0, i64 %2834
  %2836 = load i8* %2835, align 1
  %2837 = zext i8 %2836 to i32
  %2838 = icmp eq i32 %2837, 47
  br i1 %2838, label %2888, label %2839

; <label>:2839                                    ; preds = %2831
  %2840 = getelementptr inbounds %struct.regnode* %next.0, i32 0, i32 1
  %2841 = load i8* %2840, align 1
  %2842 = zext i8 %2841 to i32
  %2843 = icmp eq i32 %2842, 45
  br i1 %2843, label %2888, label %2844

; <label>:2844                                    ; preds = %2839
  %2845 = getelementptr inbounds %struct.regnode* %next.0, i32 0, i32 1
  %2846 = load i8* %2845, align 1
  %2847 = zext i8 %2846 to i32
  %2848 = icmp eq i32 %2847, 46
  br i1 %2848, label %2888, label %2849

; <label>:2849                                    ; preds = %2844
  %2850 = getelementptr inbounds %struct.regnode* %next.0, i32 0, i32 1
  %2851 = load i8* %2850, align 1
  %2852 = zext i8 %2851 to i32
  %2853 = icmp eq i32 %2852, 57
  br i1 %2853, label %2888, label %2854

; <label>:2854                                    ; preds = %2849
  %2855 = getelementptr inbounds %struct.regnode* %next.0, i32 0, i32 1
  %2856 = load i8* %2855, align 1
  %2857 = zext i8 %2856 to i32
  %2858 = icmp eq i32 %2857, 52
  br i1 %2858, label %2888, label %2859

; <label>:2859                                    ; preds = %2854
  %2860 = getelementptr inbounds %struct.regnode* %next.0, i32 0, i32 1
  %2861 = load i8* %2860, align 1
  %2862 = zext i8 %2861 to i32
  %2863 = icmp eq i32 %2862, 50
  br i1 %2863, label %2888, label %2864

; <label>:2864                                    ; preds = %2859
  %2865 = getelementptr inbounds %struct.regnode* %next.0, i32 0, i32 1
  %2866 = load i8* %2865, align 1
  %2867 = zext i8 %2866 to i32
  %2868 = icmp eq i32 %2867, 39
  br i1 %2868, label %2888, label %2869

; <label>:2869                                    ; preds = %2864
  %2870 = getelementptr inbounds %struct.regnode* %next.0, i32 0, i32 1
  %2871 = load i8* %2870, align 1
  %2872 = zext i8 %2871 to i32
  %2873 = icmp eq i32 %2872, 58
  br i1 %2873, label %2888, label %2874

; <label>:2874                                    ; preds = %2869
  %2875 = getelementptr inbounds %struct.regnode* %next.0, i32 0, i32 1
  %2876 = load i8* %2875, align 1
  %2877 = zext i8 %2876 to i64
  %2878 = getelementptr inbounds [0 x i8]* @PL_regkind, i32 0, i64 %2877
  %2879 = load i8* %2878, align 1
  %2880 = zext i8 %2879 to i32
  %2881 = icmp eq i32 %2880, 40
  br i1 %2881, label %2882, label %3078

; <label>:2882                                    ; preds = %2874
  %2883 = bitcast %struct.regnode* %next.0 to %struct.regnode_2*
  %2884 = getelementptr inbounds %struct.regnode_2* %2883, i32 0, i32 3
  %2885 = load i16* %2884, align 2
  %2886 = zext i16 %2885 to i32
  %2887 = icmp sgt i32 %2886, 0
  br i1 %2887, label %2888, label %3078

; <label>:2888                                    ; preds = %2882, %2869, %2864, %2859, %2854, %2849, %2844, %2839, %2831, %2822
  %2889 = getelementptr inbounds %struct.regnode* %next.0, i32 0, i32 1
  %2890 = load i8* %2889, align 1
  %2891 = zext i8 %2890 to i64
  %2892 = getelementptr inbounds [0 x i8]* @PL_regkind, i32 0, i64 %2891
  %2893 = load i8* %2892, align 1
  %2894 = zext i8 %2893 to i32
  %2895 = icmp eq i32 %2894, 33
  br i1 %2895, label %3012, label %2896

; <label>:2896                                    ; preds = %2888
  %2897 = getelementptr inbounds %struct.regnode* %next.0, i32 0, i32 1
  %2898 = load i8* %2897, align 1
  %2899 = zext i8 %2898 to i64
  %2900 = getelementptr inbounds [0 x i8]* @PL_regkind, i32 0, i64 %2899
  %2901 = load i8* %2900, align 1
  %2902 = zext i8 %2901 to i32
  %2903 = icmp eq i32 %2902, 47
  br i1 %2903, label %3012, label %2904

; <label>:2904                                    ; preds = %2896
  br label %2905

; <label>:2905                                    ; preds = %3010, %2904
  %text_node.0 = phi %struct.regnode* [ %next.0, %2904 ], [ %text_node.3, %3010 ]
  %2906 = getelementptr inbounds %struct.regnode* %text_node.0, i32 0, i32 1
  %2907 = load i8* %2906, align 1
  %2908 = zext i8 %2907 to i32
  %2909 = icmp eq i32 %2908, 45
  br i1 %2909, label %2956, label %2910

; <label>:2910                                    ; preds = %2905
  %2911 = getelementptr inbounds %struct.regnode* %text_node.0, i32 0, i32 1
  %2912 = load i8* %2911, align 1
  %2913 = zext i8 %2912 to i32
  %2914 = icmp eq i32 %2913, 46
  br i1 %2914, label %2956, label %2915

; <label>:2915                                    ; preds = %2910
  %2916 = getelementptr inbounds %struct.regnode* %text_node.0, i32 0, i32 1
  %2917 = load i8* %2916, align 1
  %2918 = zext i8 %2917 to i32
  %2919 = icmp eq i32 %2918, 57
  br i1 %2919, label %2956, label %2920

; <label>:2920                                    ; preds = %2915
  %2921 = getelementptr inbounds %struct.regnode* %text_node.0, i32 0, i32 1
  %2922 = load i8* %2921, align 1
  %2923 = zext i8 %2922 to i32
  %2924 = icmp eq i32 %2923, 52
  br i1 %2924, label %2956, label %2925

; <label>:2925                                    ; preds = %2920
  %2926 = getelementptr inbounds %struct.regnode* %text_node.0, i32 0, i32 1
  %2927 = load i8* %2926, align 1
  %2928 = zext i8 %2927 to i32
  %2929 = icmp eq i32 %2928, 50
  br i1 %2929, label %2956, label %2930

; <label>:2930                                    ; preds = %2925
  %2931 = getelementptr inbounds %struct.regnode* %text_node.0, i32 0, i32 1
  %2932 = load i8* %2931, align 1
  %2933 = zext i8 %2932 to i32
  %2934 = icmp eq i32 %2933, 39
  br i1 %2934, label %2956, label %2935

; <label>:2935                                    ; preds = %2930
  %2936 = getelementptr inbounds %struct.regnode* %text_node.0, i32 0, i32 1
  %2937 = load i8* %2936, align 1
  %2938 = zext i8 %2937 to i32
  %2939 = icmp eq i32 %2938, 58
  br i1 %2939, label %2956, label %2940

; <label>:2940                                    ; preds = %2935
  %2941 = getelementptr inbounds %struct.regnode* %text_node.0, i32 0, i32 1
  %2942 = load i8* %2941, align 1
  %2943 = zext i8 %2942 to i64
  %2944 = getelementptr inbounds [0 x i8]* @PL_regkind, i32 0, i64 %2943
  %2945 = load i8* %2944, align 1
  %2946 = zext i8 %2945 to i32
  %2947 = icmp eq i32 %2946, 40
  br i1 %2947, label %2948, label %2954

; <label>:2948                                    ; preds = %2940
  %2949 = bitcast %struct.regnode* %text_node.0 to %struct.regnode_2*
  %2950 = getelementptr inbounds %struct.regnode_2* %2949, i32 0, i32 3
  %2951 = load i16* %2950, align 2
  %2952 = zext i16 %2951 to i32
  %2953 = icmp sgt i32 %2952, 0
  br label %2954

; <label>:2954                                    ; preds = %2948, %2940
  %2955 = phi i1 [ false, %2940 ], [ %2953, %2948 ]
  br label %2956

; <label>:2956                                    ; preds = %2954, %2935, %2930, %2925, %2920, %2915, %2910, %2905
  %2957 = phi i1 [ true, %2935 ], [ true, %2930 ], [ true, %2925 ], [ true, %2920 ], [ true, %2915 ], [ true, %2910 ], [ true, %2905 ], [ %2955, %2954 ]
  br i1 %2957, label %2958, label %3011

; <label>:2958                                    ; preds = %2956
  %2959 = getelementptr inbounds %struct.regnode* %text_node.0, i32 0, i32 1
  %2960 = load i8* %2959, align 1
  %2961 = zext i8 %2960 to i32
  %2962 = icmp eq i32 %2961, 52
  br i1 %2962, label %2971, label %2963

; <label>:2963                                    ; preds = %2958
  %2964 = getelementptr inbounds %struct.regnode* %text_node.0, i32 0, i32 1
  %2965 = load i8* %2964, align 1
  %2966 = zext i8 %2965 to i64
  %2967 = getelementptr inbounds [0 x i8]* @PL_regkind, i32 0, i64 %2966
  %2968 = load i8* %2967, align 1
  %2969 = zext i8 %2968 to i32
  %2970 = icmp eq i32 %2969, 40
  br i1 %2970, label %2971, label %2974

; <label>:2971                                    ; preds = %2963, %2958
  %2972 = getelementptr inbounds %struct.regnode* %text_node.0, i64 1
  %2973 = getelementptr inbounds %struct.regnode* %2972, i64 1
  br label %3010

; <label>:2974                                    ; preds = %2963
  %2975 = getelementptr inbounds %struct.regnode* %text_node.0, i32 0, i32 1
  %2976 = load i8* %2975, align 1
  %2977 = zext i8 %2976 to i32
  %2978 = icmp eq i32 %2977, 39
  br i1 %2978, label %2979, label %2981

; <label>:2979                                    ; preds = %2974
  %2980 = getelementptr inbounds %struct.regnode* %text_node.0, i64 1
  br label %3009

; <label>:2981                                    ; preds = %2974
  %2982 = getelementptr inbounds %struct.regnode* %text_node.0, i32 0, i32 1
  %2983 = load i8* %2982, align 1
  %2984 = zext i8 %2983 to i32
  %2985 = icmp eq i32 %2984, 50
  br i1 %2985, label %2986, label %3002

; <label>:2986                                    ; preds = %2981
  %2987 = getelementptr inbounds %struct.regnode* %text_node.0, i32 0, i32 0
  %2988 = load i8* %2987, align 1
  %2989 = zext i8 %2988 to i32
  %2990 = icmp eq i32 %2989, 0
  br i1 %2990, label %2991, label %2994

; <label>:2991                                    ; preds = %2986
  %2992 = getelementptr inbounds %struct.regnode* %text_node.0, i64 1
  %2993 = getelementptr inbounds %struct.regnode* %2992, i64 1
  br label %3000

; <label>:2994                                    ; preds = %2986
  %2995 = bitcast %struct.regnode* %text_node.0 to %struct.regnode_1*
  %2996 = getelementptr inbounds %struct.regnode_1* %2995, i32 0, i32 3
  %2997 = load i32* %2996, align 4
  %2998 = zext i32 %2997 to i64
  %2999 = getelementptr inbounds %struct.regnode* %text_node.0, i64 %2998
  br label %3000

; <label>:3000                                    ; preds = %2994, %2991
  %3001 = phi %struct.regnode* [ %2993, %2991 ], [ %2999, %2994 ]
  br label %3008

; <label>:3002                                    ; preds = %2981
  %3003 = getelementptr inbounds %struct.regnode* %text_node.0, i32 0, i32 2
  %3004 = load i16* %3003, align 2
  %3005 = zext i16 %3004 to i32
  %3006 = sext i32 %3005 to i64
  %3007 = getelementptr inbounds %struct.regnode* %text_node.0, i64 %3006
  br label %3008

; <label>:3008                                    ; preds = %3002, %3000
  %text_node.1 = phi %struct.regnode* [ %3001, %3000 ], [ %3007, %3002 ]
  br label %3009

; <label>:3009                                    ; preds = %3008, %2979
  %text_node.2 = phi %struct.regnode* [ %2980, %2979 ], [ %text_node.1, %3008 ]
  br label %3010

; <label>:3010                                    ; preds = %3009, %2971
  %text_node.3 = phi %struct.regnode* [ %2973, %2971 ], [ %text_node.2, %3009 ]
  br label %2905

; <label>:3011                                    ; preds = %2956
  br label %3012

; <label>:3012                                    ; preds = %3011, %2896, %2888
  %text_node.4 = phi %struct.regnode* [ %next.0, %2888 ], [ %next.0, %2896 ], [ %text_node.0, %3011 ]
  %3013 = getelementptr inbounds %struct.regnode* %text_node.4, i32 0, i32 1
  %3014 = load i8* %3013, align 1
  %3015 = zext i8 %3014 to i64
  %3016 = getelementptr inbounds [0 x i8]* @PL_regkind, i32 0, i64 %3015
  %3017 = load i8* %3016, align 1
  %3018 = zext i8 %3017 to i32
  %3019 = icmp eq i32 %3018, 33
  br i1 %3019, label %3029, label %3020

; <label>:3020                                    ; preds = %3012
  %3021 = getelementptr inbounds %struct.regnode* %text_node.4, i32 0, i32 1
  %3022 = load i8* %3021, align 1
  %3023 = zext i8 %3022 to i64
  %3024 = getelementptr inbounds [0 x i8]* @PL_regkind, i32 0, i64 %3023
  %3025 = load i8* %3024, align 1
  %3026 = zext i8 %3025 to i32
  %3027 = icmp eq i32 %3026, 47
  br i1 %3027, label %3029, label %3028

; <label>:3028                                    ; preds = %3020
  br label %3077

; <label>:3029                                    ; preds = %3020, %3012
  %3030 = getelementptr inbounds %struct.regnode* %text_node.4, i32 0, i32 1
  %3031 = load i8* %3030, align 1
  %3032 = zext i8 %3031 to i64
  %3033 = getelementptr inbounds [0 x i8]* @PL_regkind, i32 0, i64 %3032
  %3034 = load i8* %3033, align 1
  %3035 = zext i8 %3034 to i32
  %3036 = icmp eq i32 %3035, 47
  br i1 %3036, label %3037, label %3038

; <label>:3037                                    ; preds = %3029
  br label %3080

; <label>:3038                                    ; preds = %3029
  %3039 = bitcast %struct.regnode* %text_node.4 to %struct.regnode_string*
  %3040 = getelementptr inbounds %struct.regnode_string* %3039, i32 0, i32 3
  %3041 = getelementptr inbounds [1 x i8]* %3040, i32 0, i32 0
  %3042 = load i8* %3041, align 1
  %3043 = zext i8 %3042 to i32
  br label %3044

; <label>:3044                                    ; preds = %3038
  %3045 = getelementptr inbounds %struct.regnode* %text_node.4, i32 0, i32 1
  %3046 = load i8* %3045, align 1
  %3047 = zext i8 %3046 to i32
  %3048 = icmp eq i32 %3047, 34
  br i1 %3048, label %3054, label %3049

; <label>:3049                                    ; preds = %3044
  %3050 = getelementptr inbounds %struct.regnode* %text_node.4, i32 0, i32 1
  %3051 = load i8* %3050, align 1
  %3052 = zext i8 %3051 to i32
  %3053 = icmp eq i32 %3052, 48
  br i1 %3053, label %3054, label %3059

; <label>:3054                                    ; preds = %3049, %3044
  %3055 = sext i32 %3043 to i64
  %3056 = getelementptr inbounds [0 x i8]* @PL_fold, i32 0, i64 %3055
  %3057 = load i8* %3056, align 1
  %3058 = zext i8 %3057 to i32
  br label %3076

; <label>:3059                                    ; preds = %3049
  %3060 = getelementptr inbounds %struct.regnode* %text_node.4, i32 0, i32 1
  %3061 = load i8* %3060, align 1
  %3062 = zext i8 %3061 to i32
  %3063 = icmp eq i32 %3062, 35
  br i1 %3063, label %3069, label %3064

; <label>:3064                                    ; preds = %3059
  %3065 = getelementptr inbounds %struct.regnode* %text_node.4, i32 0, i32 1
  %3066 = load i8* %3065, align 1
  %3067 = zext i8 %3066 to i32
  %3068 = icmp eq i32 %3067, 49
  br i1 %3068, label %3069, label %3074

; <label>:3069                                    ; preds = %3064, %3059
  %3070 = sext i32 %3043 to i64
  %3071 = getelementptr inbounds [0 x i8]* @PL_fold_locale, i32 0, i64 %3070
  %3072 = load i8* %3071, align 1
  %3073 = zext i8 %3072 to i32
  br label %3075

; <label>:3074                                    ; preds = %3064
  br label %3075

; <label>:3075                                    ; preds = %3074, %3069
  %c2.1 = phi i32 [ %3073, %3069 ], [ %3043, %3074 ]
  br label %3076

; <label>:3076                                    ; preds = %3075, %3054
  %c2.2 = phi i32 [ %3058, %3054 ], [ %c2.1, %3075 ]
  br label %3077

; <label>:3077                                    ; preds = %3076, %3028
  %c2.3 = phi i32 [ %c2.2, %3076 ], [ -1000, %3028 ]
  %c1.1 = phi i32 [ %3043, %3076 ], [ -1000, %3028 ]
  br label %3079

; <label>:3078                                    ; preds = %2882, %2874
  br label %3079

; <label>:3079                                    ; preds = %3078, %3077
  %c2.4 = phi i32 [ %c2.3, %3077 ], [ -1000, %3078 ]
  %c1.2 = phi i32 [ %c1.1, %3077 ], [ -1000, %3078 ]
  br label %3080

; <label>:3080                                    ; preds = %3079, %3037
  %c2.5 = phi i32 [ -1000, %3037 ], [ %c2.4, %3079 ]
  %c1.3 = phi i32 [ -1000, %3037 ], [ %c1.2, %3079 ]
  %3081 = load i32* @PL_savestack_ix, align 4
  br label %3082

; <label>:3082                                    ; preds = %3165, %3080
  %locinput.6 = phi i8* [ %2823, %3080 ], [ %3163, %3165 ]
  %ln.8 = phi i32 [ %2784, %3080 ], [ %3162, %3165 ]
  %3083 = icmp sge i32 %2788, %ln.8
  br i1 %3083, label %3090, label %3084

; <label>:3084                                    ; preds = %3082
  %3085 = icmp eq i32 %2788, 32767
  br i1 %3085, label %3086, label %3088

; <label>:3086                                    ; preds = %3084
  %3087 = icmp sgt i32 %ln.8, 0
  br label %3088

; <label>:3088                                    ; preds = %3086, %3084
  %3089 = phi i1 [ false, %3084 ], [ %3087, %3086 ]
  br label %3090

; <label>:3090                                    ; preds = %3088, %3082
  %3091 = phi i1 [ true, %3082 ], [ %3089, %3088 ]
  br i1 %3091, label %3092, label %3166

; <label>:3092                                    ; preds = %3090
  %3093 = icmp eq i32 %c1.3, -1000
  br i1 %3093, label %3104, label %3094

; <label>:3094                                    ; preds = %3092
  %3095 = load i8** @PL_reginput, align 8
  %3096 = load i8* %3095, align 1
  %3097 = zext i8 %3096 to i32
  %3098 = icmp eq i32 %3097, %c1.3
  br i1 %3098, label %3104, label %3099

; <label>:3099                                    ; preds = %3094
  %3100 = load i8** @PL_reginput, align 8
  %3101 = load i8* %3100, align 1
  %3102 = zext i8 %3101 to i32
  %3103 = icmp eq i32 %3102, %c2.5
  br i1 %3103, label %3104, label %3158

; <label>:3104                                    ; preds = %3099, %3094, %3092
  %3105 = icmp ne i32 %2791, 0
  br i1 %3105, label %3106, label %3149

; <label>:3106                                    ; preds = %3104
  %3107 = icmp ne i32 %ln.8, 0
  br i1 %3107, label %3108, label %3144

; <label>:3108                                    ; preds = %3106
  %3109 = load i8* @PL_reg_match_utf8, align 1
  %3110 = sext i8 %3109 to i32
  %3111 = icmp ne i32 %3110, 0
  br i1 %3111, label %3112, label %3119

; <label>:3112                                    ; preds = %3108
  %3113 = load i8** @PL_reginput, align 8
  %3114 = load i32* %l9, align 4
  %3115 = sub nsw i32 0, %3114
  %3116 = call i32 (i8*, i32, ...)* bitcast (i32 (...)* @reghop to i32 (i8*, i32, ...)*)(i8* %3113, i32 %3115)
  %3117 = sext i32 %3116 to i64
  %3118 = inttoptr i64 %3117 to i8*
  br label %3125

; <label>:3119                                    ; preds = %3108
  %3120 = load i8** @PL_reginput, align 8
  %3121 = load i32* %l9, align 4
  %3122 = sub nsw i32 0, %3121
  %3123 = sext i32 %3122 to i64
  %3124 = getelementptr inbounds i8* %3120, i64 %3123
  br label %3125

; <label>:3125                                    ; preds = %3119, %3112
  %3126 = phi i8* [ %3118, %3112 ], [ %3124, %3119 ]
  %3127 = load i8** @PL_bostr, align 8
  %3128 = ptrtoint i8* %3126 to i64
  %3129 = ptrtoint i8* %3127 to i64
  %3130 = sub i64 %3128, %3129
  %3131 = trunc i64 %3130 to i32
  %3132 = sext i32 %2791 to i64
  %3133 = load i32** @PL_regstartp, align 8
  %3134 = getelementptr inbounds i32* %3133, i64 %3132
  store i32 %3131, i32* %3134, align 4
  %3135 = load i8** @PL_reginput, align 8
  %3136 = load i8** @PL_bostr, align 8
  %3137 = ptrtoint i8* %3135 to i64
  %3138 = ptrtoint i8* %3136 to i64
  %3139 = sub i64 %3137, %3138
  %3140 = trunc i64 %3139 to i32
  %3141 = sext i32 %2791 to i64
  %3142 = load i32** @PL_regendp, align 8
  %3143 = getelementptr inbounds i32* %3142, i64 %3141
  store i32 %3140, i32* %3143, align 4
  br label %3148

; <label>:3144                                    ; preds = %3106
  %3145 = sext i32 %2791 to i64
  %3146 = load i32** @PL_regendp, align 8
  %3147 = getelementptr inbounds i32* %3146, i64 %3145
  store i32 -1, i32* %3147, align 4
  br label %3148

; <label>:3148                                    ; preds = %3144, %3125
  br label %3149

; <label>:3149                                    ; preds = %3148, %3104
  %3150 = call i32 (%struct.regnode*, ...)* bitcast (i32 (...)* @regmatch to i32 (%struct.regnode*, ...)*)(%struct.regnode* %next.0)
  %3151 = icmp ne i32 %3150, 0
  br i1 %3151, label %3152, label %3153

; <label>:3152                                    ; preds = %3149
  br label %5028

; <label>:3153                                    ; preds = %3149
  %3154 = load i32* @PL_savestack_ix, align 4
  %3155 = icmp sgt i32 %3154, %3081
  br i1 %3155, label %3156, label %3157

; <label>:3156                                    ; preds = %3153
  call void @Perl_leave_scope(i32 %3081)
  br label %3157

; <label>:3157                                    ; preds = %3156, %3153
  br label %3158

; <label>:3158                                    ; preds = %3157, %3099
  store i8* %locinput.6, i8** @PL_reginput, align 8
  %3159 = call i32 (%struct.regnode*, i32, i32*, ...)* bitcast (i32 (...)* @regrepeat_hard to i32 (%struct.regnode*, i32, i32*, ...)*)(%struct.regnode* %scan.1, i32 1, i32* %l9)
  %3160 = icmp ne i32 %3159, 0
  br i1 %3160, label %3161, label %3164

; <label>:3161                                    ; preds = %3158
  %3162 = add nsw i32 %ln.8, 1
  %3163 = load i8** @PL_reginput, align 8
  br label %3165

; <label>:3164                                    ; preds = %3158
  br label %5029

; <label>:3165                                    ; preds = %3161
  br label %3082

; <label>:3166                                    ; preds = %3090
  br label %3518

; <label>:3167                                    ; preds = %2814
  %3168 = call i32 (%struct.regnode*, i32, i32*, ...)* bitcast (i32 (...)* @regrepeat_hard to i32 (%struct.regnode*, i32, i32*, ...)*)(%struct.regnode* %scan.1, i32 %2788, i32* %l9)
  %3169 = load i8** @PL_reginput, align 8
  %3170 = icmp sge i32 %3168, %2784
  br i1 %3170, label %3171, label %3428

; <label>:3171                                    ; preds = %3167
  %3172 = getelementptr inbounds %struct.regnode* %next.0, i32 0, i32 1
  %3173 = load i8* %3172, align 1
  %3174 = zext i8 %3173 to i64
  %3175 = getelementptr inbounds [0 x i8]* @PL_regkind, i32 0, i64 %3174
  %3176 = load i8* %3175, align 1
  %3177 = zext i8 %3176 to i32
  %3178 = icmp eq i32 %3177, 33
  br i1 %3178, label %3236, label %3179

; <label>:3179                                    ; preds = %3171
  %3180 = getelementptr inbounds %struct.regnode* %next.0, i32 0, i32 1
  %3181 = load i8* %3180, align 1
  %3182 = zext i8 %3181 to i64
  %3183 = getelementptr inbounds [0 x i8]* @PL_regkind, i32 0, i64 %3182
  %3184 = load i8* %3183, align 1
  %3185 = zext i8 %3184 to i32
  %3186 = icmp eq i32 %3185, 47
  br i1 %3186, label %3236, label %3187

; <label>:3187                                    ; preds = %3179
  %3188 = getelementptr inbounds %struct.regnode* %next.0, i32 0, i32 1
  %3189 = load i8* %3188, align 1
  %3190 = zext i8 %3189 to i32
  %3191 = icmp eq i32 %3190, 45
  br i1 %3191, label %3236, label %3192

; <label>:3192                                    ; preds = %3187
  %3193 = getelementptr inbounds %struct.regnode* %next.0, i32 0, i32 1
  %3194 = load i8* %3193, align 1
  %3195 = zext i8 %3194 to i32
  %3196 = icmp eq i32 %3195, 46
  br i1 %3196, label %3236, label %3197

; <label>:3197                                    ; preds = %3192
  %3198 = getelementptr inbounds %struct.regnode* %next.0, i32 0, i32 1
  %3199 = load i8* %3198, align 1
  %3200 = zext i8 %3199 to i32
  %3201 = icmp eq i32 %3200, 57
  br i1 %3201, label %3236, label %3202

; <label>:3202                                    ; preds = %3197
  %3203 = getelementptr inbounds %struct.regnode* %next.0, i32 0, i32 1
  %3204 = load i8* %3203, align 1
  %3205 = zext i8 %3204 to i32
  %3206 = icmp eq i32 %3205, 52
  br i1 %3206, label %3236, label %3207

; <label>:3207                                    ; preds = %3202
  %3208 = getelementptr inbounds %struct.regnode* %next.0, i32 0, i32 1
  %3209 = load i8* %3208, align 1
  %3210 = zext i8 %3209 to i32
  %3211 = icmp eq i32 %3210, 50
  br i1 %3211, label %3236, label %3212

; <label>:3212                                    ; preds = %3207
  %3213 = getelementptr inbounds %struct.regnode* %next.0, i32 0, i32 1
  %3214 = load i8* %3213, align 1
  %3215 = zext i8 %3214 to i32
  %3216 = icmp eq i32 %3215, 39
  br i1 %3216, label %3236, label %3217

; <label>:3217                                    ; preds = %3212
  %3218 = getelementptr inbounds %struct.regnode* %next.0, i32 0, i32 1
  %3219 = load i8* %3218, align 1
  %3220 = zext i8 %3219 to i32
  %3221 = icmp eq i32 %3220, 58
  br i1 %3221, label %3236, label %3222

; <label>:3222                                    ; preds = %3217
  %3223 = getelementptr inbounds %struct.regnode* %next.0, i32 0, i32 1
  %3224 = load i8* %3223, align 1
  %3225 = zext i8 %3224 to i64
  %3226 = getelementptr inbounds [0 x i8]* @PL_regkind, i32 0, i64 %3225
  %3227 = load i8* %3226, align 1
  %3228 = zext i8 %3227 to i32
  %3229 = icmp eq i32 %3228, 40
  br i1 %3229, label %3230, label %3426

; <label>:3230                                    ; preds = %3222
  %3231 = bitcast %struct.regnode* %next.0 to %struct.regnode_2*
  %3232 = getelementptr inbounds %struct.regnode_2* %3231, i32 0, i32 3
  %3233 = load i16* %3232, align 2
  %3234 = zext i16 %3233 to i32
  %3235 = icmp sgt i32 %3234, 0
  br i1 %3235, label %3236, label %3426

; <label>:3236                                    ; preds = %3230, %3217, %3212, %3207, %3202, %3197, %3192, %3187, %3179, %3171
  %3237 = getelementptr inbounds %struct.regnode* %next.0, i32 0, i32 1
  %3238 = load i8* %3237, align 1
  %3239 = zext i8 %3238 to i64
  %3240 = getelementptr inbounds [0 x i8]* @PL_regkind, i32 0, i64 %3239
  %3241 = load i8* %3240, align 1
  %3242 = zext i8 %3241 to i32
  %3243 = icmp eq i32 %3242, 33
  br i1 %3243, label %3360, label %3244

; <label>:3244                                    ; preds = %3236
  %3245 = getelementptr inbounds %struct.regnode* %next.0, i32 0, i32 1
  %3246 = load i8* %3245, align 1
  %3247 = zext i8 %3246 to i64
  %3248 = getelementptr inbounds [0 x i8]* @PL_regkind, i32 0, i64 %3247
  %3249 = load i8* %3248, align 1
  %3250 = zext i8 %3249 to i32
  %3251 = icmp eq i32 %3250, 47
  br i1 %3251, label %3360, label %3252

; <label>:3252                                    ; preds = %3244
  br label %3253

; <label>:3253                                    ; preds = %3358, %3252
  %text_node11.0 = phi %struct.regnode* [ %next.0, %3252 ], [ %text_node11.3, %3358 ]
  %3254 = getelementptr inbounds %struct.regnode* %text_node11.0, i32 0, i32 1
  %3255 = load i8* %3254, align 1
  %3256 = zext i8 %3255 to i32
  %3257 = icmp eq i32 %3256, 45
  br i1 %3257, label %3304, label %3258

; <label>:3258                                    ; preds = %3253
  %3259 = getelementptr inbounds %struct.regnode* %text_node11.0, i32 0, i32 1
  %3260 = load i8* %3259, align 1
  %3261 = zext i8 %3260 to i32
  %3262 = icmp eq i32 %3261, 46
  br i1 %3262, label %3304, label %3263

; <label>:3263                                    ; preds = %3258
  %3264 = getelementptr inbounds %struct.regnode* %text_node11.0, i32 0, i32 1
  %3265 = load i8* %3264, align 1
  %3266 = zext i8 %3265 to i32
  %3267 = icmp eq i32 %3266, 57
  br i1 %3267, label %3304, label %3268

; <label>:3268                                    ; preds = %3263
  %3269 = getelementptr inbounds %struct.regnode* %text_node11.0, i32 0, i32 1
  %3270 = load i8* %3269, align 1
  %3271 = zext i8 %3270 to i32
  %3272 = icmp eq i32 %3271, 52
  br i1 %3272, label %3304, label %3273

; <label>:3273                                    ; preds = %3268
  %3274 = getelementptr inbounds %struct.regnode* %text_node11.0, i32 0, i32 1
  %3275 = load i8* %3274, align 1
  %3276 = zext i8 %3275 to i32
  %3277 = icmp eq i32 %3276, 50
  br i1 %3277, label %3304, label %3278

; <label>:3278                                    ; preds = %3273
  %3279 = getelementptr inbounds %struct.regnode* %text_node11.0, i32 0, i32 1
  %3280 = load i8* %3279, align 1
  %3281 = zext i8 %3280 to i32
  %3282 = icmp eq i32 %3281, 39
  br i1 %3282, label %3304, label %3283

; <label>:3283                                    ; preds = %3278
  %3284 = getelementptr inbounds %struct.regnode* %text_node11.0, i32 0, i32 1
  %3285 = load i8* %3284, align 1
  %3286 = zext i8 %3285 to i32
  %3287 = icmp eq i32 %3286, 58
  br i1 %3287, label %3304, label %3288

; <label>:3288                                    ; preds = %3283
  %3289 = getelementptr inbounds %struct.regnode* %text_node11.0, i32 0, i32 1
  %3290 = load i8* %3289, align 1
  %3291 = zext i8 %3290 to i64
  %3292 = getelementptr inbounds [0 x i8]* @PL_regkind, i32 0, i64 %3291
  %3293 = load i8* %3292, align 1
  %3294 = zext i8 %3293 to i32
  %3295 = icmp eq i32 %3294, 40
  br i1 %3295, label %3296, label %3302

; <label>:3296                                    ; preds = %3288
  %3297 = bitcast %struct.regnode* %text_node11.0 to %struct.regnode_2*
  %3298 = getelementptr inbounds %struct.regnode_2* %3297, i32 0, i32 3
  %3299 = load i16* %3298, align 2
  %3300 = zext i16 %3299 to i32
  %3301 = icmp sgt i32 %3300, 0
  br label %3302

; <label>:3302                                    ; preds = %3296, %3288
  %3303 = phi i1 [ false, %3288 ], [ %3301, %3296 ]
  br label %3304

; <label>:3304                                    ; preds = %3302, %3283, %3278, %3273, %3268, %3263, %3258, %3253
  %3305 = phi i1 [ true, %3283 ], [ true, %3278 ], [ true, %3273 ], [ true, %3268 ], [ true, %3263 ], [ true, %3258 ], [ true, %3253 ], [ %3303, %3302 ]
  br i1 %3305, label %3306, label %3359

; <label>:3306                                    ; preds = %3304
  %3307 = getelementptr inbounds %struct.regnode* %text_node11.0, i32 0, i32 1
  %3308 = load i8* %3307, align 1
  %3309 = zext i8 %3308 to i32
  %3310 = icmp eq i32 %3309, 52
  br i1 %3310, label %3319, label %3311

; <label>:3311                                    ; preds = %3306
  %3312 = getelementptr inbounds %struct.regnode* %text_node11.0, i32 0, i32 1
  %3313 = load i8* %3312, align 1
  %3314 = zext i8 %3313 to i64
  %3315 = getelementptr inbounds [0 x i8]* @PL_regkind, i32 0, i64 %3314
  %3316 = load i8* %3315, align 1
  %3317 = zext i8 %3316 to i32
  %3318 = icmp eq i32 %3317, 40
  br i1 %3318, label %3319, label %3322

; <label>:3319                                    ; preds = %3311, %3306
  %3320 = getelementptr inbounds %struct.regnode* %text_node11.0, i64 1
  %3321 = getelementptr inbounds %struct.regnode* %3320, i64 1
  br label %3358

; <label>:3322                                    ; preds = %3311
  %3323 = getelementptr inbounds %struct.regnode* %text_node11.0, i32 0, i32 1
  %3324 = load i8* %3323, align 1
  %3325 = zext i8 %3324 to i32
  %3326 = icmp eq i32 %3325, 39
  br i1 %3326, label %3327, label %3329

; <label>:3327                                    ; preds = %3322
  %3328 = getelementptr inbounds %struct.regnode* %text_node11.0, i64 1
  br label %3357

; <label>:3329                                    ; preds = %3322
  %3330 = getelementptr inbounds %struct.regnode* %text_node11.0, i32 0, i32 1
  %3331 = load i8* %3330, align 1
  %3332 = zext i8 %3331 to i32
  %3333 = icmp eq i32 %3332, 50
  br i1 %3333, label %3334, label %3350

; <label>:3334                                    ; preds = %3329
  %3335 = getelementptr inbounds %struct.regnode* %text_node11.0, i32 0, i32 0
  %3336 = load i8* %3335, align 1
  %3337 = zext i8 %3336 to i32
  %3338 = icmp eq i32 %3337, 0
  br i1 %3338, label %3339, label %3342

; <label>:3339                                    ; preds = %3334
  %3340 = getelementptr inbounds %struct.regnode* %text_node11.0, i64 1
  %3341 = getelementptr inbounds %struct.regnode* %3340, i64 1
  br label %3348

; <label>:3342                                    ; preds = %3334
  %3343 = bitcast %struct.regnode* %text_node11.0 to %struct.regnode_1*
  %3344 = getelementptr inbounds %struct.regnode_1* %3343, i32 0, i32 3
  %3345 = load i32* %3344, align 4
  %3346 = zext i32 %3345 to i64
  %3347 = getelementptr inbounds %struct.regnode* %text_node11.0, i64 %3346
  br label %3348

; <label>:3348                                    ; preds = %3342, %3339
  %3349 = phi %struct.regnode* [ %3341, %3339 ], [ %3347, %3342 ]
  br label %3356

; <label>:3350                                    ; preds = %3329
  %3351 = getelementptr inbounds %struct.regnode* %text_node11.0, i32 0, i32 2
  %3352 = load i16* %3351, align 2
  %3353 = zext i16 %3352 to i32
  %3354 = sext i32 %3353 to i64
  %3355 = getelementptr inbounds %struct.regnode* %text_node11.0, i64 %3354
  br label %3356

; <label>:3356                                    ; preds = %3350, %3348
  %text_node11.1 = phi %struct.regnode* [ %3349, %3348 ], [ %3355, %3350 ]
  br label %3357

; <label>:3357                                    ; preds = %3356, %3327
  %text_node11.2 = phi %struct.regnode* [ %3328, %3327 ], [ %text_node11.1, %3356 ]
  br label %3358

; <label>:3358                                    ; preds = %3357, %3319
  %text_node11.3 = phi %struct.regnode* [ %3321, %3319 ], [ %text_node11.2, %3357 ]
  br label %3253

; <label>:3359                                    ; preds = %3304
  br label %3360

; <label>:3360                                    ; preds = %3359, %3244, %3236
  %text_node11.4 = phi %struct.regnode* [ %next.0, %3236 ], [ %next.0, %3244 ], [ %text_node11.0, %3359 ]
  %3361 = getelementptr inbounds %struct.regnode* %text_node11.4, i32 0, i32 1
  %3362 = load i8* %3361, align 1
  %3363 = zext i8 %3362 to i64
  %3364 = getelementptr inbounds [0 x i8]* @PL_regkind, i32 0, i64 %3363
  %3365 = load i8* %3364, align 1
  %3366 = zext i8 %3365 to i32
  %3367 = icmp eq i32 %3366, 33
  br i1 %3367, label %3377, label %3368

; <label>:3368                                    ; preds = %3360
  %3369 = getelementptr inbounds %struct.regnode* %text_node11.4, i32 0, i32 1
  %3370 = load i8* %3369, align 1
  %3371 = zext i8 %3370 to i64
  %3372 = getelementptr inbounds [0 x i8]* @PL_regkind, i32 0, i64 %3371
  %3373 = load i8* %3372, align 1
  %3374 = zext i8 %3373 to i32
  %3375 = icmp eq i32 %3374, 47
  br i1 %3375, label %3377, label %3376

; <label>:3376                                    ; preds = %3368
  br label %3425

; <label>:3377                                    ; preds = %3368, %3360
  %3378 = getelementptr inbounds %struct.regnode* %text_node11.4, i32 0, i32 1
  %3379 = load i8* %3378, align 1
  %3380 = zext i8 %3379 to i64
  %3381 = getelementptr inbounds [0 x i8]* @PL_regkind, i32 0, i64 %3380
  %3382 = load i8* %3381, align 1
  %3383 = zext i8 %3382 to i32
  %3384 = icmp eq i32 %3383, 47
  br i1 %3384, label %3385, label %3386

; <label>:3385                                    ; preds = %3377
  br label %3429

; <label>:3386                                    ; preds = %3377
  %3387 = bitcast %struct.regnode* %text_node11.4 to %struct.regnode_string*
  %3388 = getelementptr inbounds %struct.regnode_string* %3387, i32 0, i32 3
  %3389 = getelementptr inbounds [1 x i8]* %3388, i32 0, i32 0
  %3390 = load i8* %3389, align 1
  %3391 = zext i8 %3390 to i32
  br label %3392

; <label>:3392                                    ; preds = %3386
  %3393 = getelementptr inbounds %struct.regnode* %text_node11.4, i32 0, i32 1
  %3394 = load i8* %3393, align 1
  %3395 = zext i8 %3394 to i32
  %3396 = icmp eq i32 %3395, 34
  br i1 %3396, label %3402, label %3397

; <label>:3397                                    ; preds = %3392
  %3398 = getelementptr inbounds %struct.regnode* %text_node11.4, i32 0, i32 1
  %3399 = load i8* %3398, align 1
  %3400 = zext i8 %3399 to i32
  %3401 = icmp eq i32 %3400, 48
  br i1 %3401, label %3402, label %3407

; <label>:3402                                    ; preds = %3397, %3392
  %3403 = sext i32 %3391 to i64
  %3404 = getelementptr inbounds [0 x i8]* @PL_fold, i32 0, i64 %3403
  %3405 = load i8* %3404, align 1
  %3406 = zext i8 %3405 to i32
  br label %3424

; <label>:3407                                    ; preds = %3397
  %3408 = getelementptr inbounds %struct.regnode* %text_node11.4, i32 0, i32 1
  %3409 = load i8* %3408, align 1
  %3410 = zext i8 %3409 to i32
  %3411 = icmp eq i32 %3410, 35
  br i1 %3411, label %3417, label %3412

; <label>:3412                                    ; preds = %3407
  %3413 = getelementptr inbounds %struct.regnode* %text_node11.4, i32 0, i32 1
  %3414 = load i8* %3413, align 1
  %3415 = zext i8 %3414 to i32
  %3416 = icmp eq i32 %3415, 49
  br i1 %3416, label %3417, label %3422

; <label>:3417                                    ; preds = %3412, %3407
  %3418 = sext i32 %3391 to i64
  %3419 = getelementptr inbounds [0 x i8]* @PL_fold_locale, i32 0, i64 %3418
  %3420 = load i8* %3419, align 1
  %3421 = zext i8 %3420 to i32
  br label %3423

; <label>:3422                                    ; preds = %3412
  br label %3423

; <label>:3423                                    ; preds = %3422, %3417
  %c2.6 = phi i32 [ %3421, %3417 ], [ %3391, %3422 ]
  br label %3424

; <label>:3424                                    ; preds = %3423, %3402
  %c2.7 = phi i32 [ %3406, %3402 ], [ %c2.6, %3423 ]
  br label %3425

; <label>:3425                                    ; preds = %3424, %3376
  %c2.8 = phi i32 [ %c2.7, %3424 ], [ -1000, %3376 ]
  %c1.4 = phi i32 [ %3391, %3424 ], [ -1000, %3376 ]
  br label %3427

; <label>:3426                                    ; preds = %3230, %3222
  br label %3427

; <label>:3427                                    ; preds = %3426, %3425
  %c2.9 = phi i32 [ %c2.8, %3425 ], [ -1000, %3426 ]
  %c1.5 = phi i32 [ %c1.4, %3425 ], [ -1000, %3426 ]
  br label %3428

; <label>:3428                                    ; preds = %3427, %3167
  %c2.10 = phi i32 [ %c2.9, %3427 ], [ %c2.0, %3167 ]
  %c1.6 = phi i32 [ %c1.5, %3427 ], [ %c1.0, %3167 ]
  br label %3429

; <label>:3429                                    ; preds = %3428, %3385
  %c2.11 = phi i32 [ -1000, %3385 ], [ %c2.10, %3428 ]
  %c1.7 = phi i32 [ -1000, %3385 ], [ %c1.6, %3428 ]
  %3430 = load i32* @PL_savestack_ix, align 4
  br label %3431

; <label>:3431                                    ; preds = %3515, %3429
  %locinput.7 = phi i8* [ %3169, %3429 ], [ %3516, %3515 ]
  %n.3 = phi i32 [ %3168, %3429 ], [ %3500, %3515 ]
  %3432 = icmp sge i32 %n.3, %2784
  br i1 %3432, label %3433, label %3517

; <label>:3433                                    ; preds = %3431
  %3434 = icmp eq i32 %c1.7, -1000
  br i1 %3434, label %3445, label %3435

; <label>:3435                                    ; preds = %3433
  %3436 = load i8** @PL_reginput, align 8
  %3437 = load i8* %3436, align 1
  %3438 = zext i8 %3437 to i32
  %3439 = icmp eq i32 %3438, %c1.7
  br i1 %3439, label %3445, label %3440

; <label>:3440                                    ; preds = %3435
  %3441 = load i8** @PL_reginput, align 8
  %3442 = load i8* %3441, align 1
  %3443 = zext i8 %3442 to i32
  %3444 = icmp eq i32 %3443, %c2.11
  br i1 %3444, label %3445, label %3499

; <label>:3445                                    ; preds = %3440, %3435, %3433
  %3446 = icmp ne i32 %2791, 0
  br i1 %3446, label %3447, label %3490

; <label>:3447                                    ; preds = %3445
  %3448 = icmp ne i32 %n.3, 0
  br i1 %3448, label %3449, label %3485

; <label>:3449                                    ; preds = %3447
  %3450 = load i8* @PL_reg_match_utf8, align 1
  %3451 = sext i8 %3450 to i32
  %3452 = icmp ne i32 %3451, 0
  br i1 %3452, label %3453, label %3460

; <label>:3453                                    ; preds = %3449
  %3454 = load i8** @PL_reginput, align 8
  %3455 = load i32* %l9, align 4
  %3456 = sub nsw i32 0, %3455
  %3457 = call i32 (i8*, i32, ...)* bitcast (i32 (...)* @reghop to i32 (i8*, i32, ...)*)(i8* %3454, i32 %3456)
  %3458 = sext i32 %3457 to i64
  %3459 = inttoptr i64 %3458 to i8*
  br label %3466

; <label>:3460                                    ; preds = %3449
  %3461 = load i8** @PL_reginput, align 8
  %3462 = load i32* %l9, align 4
  %3463 = sub nsw i32 0, %3462
  %3464 = sext i32 %3463 to i64
  %3465 = getelementptr inbounds i8* %3461, i64 %3464
  br label %3466

; <label>:3466                                    ; preds = %3460, %3453
  %3467 = phi i8* [ %3459, %3453 ], [ %3465, %3460 ]
  %3468 = load i8** @PL_bostr, align 8
  %3469 = ptrtoint i8* %3467 to i64
  %3470 = ptrtoint i8* %3468 to i64
  %3471 = sub i64 %3469, %3470
  %3472 = trunc i64 %3471 to i32
  %3473 = sext i32 %2791 to i64
  %3474 = load i32** @PL_regstartp, align 8
  %3475 = getelementptr inbounds i32* %3474, i64 %3473
  store i32 %3472, i32* %3475, align 4
  %3476 = load i8** @PL_reginput, align 8
  %3477 = load i8** @PL_bostr, align 8
  %3478 = ptrtoint i8* %3476 to i64
  %3479 = ptrtoint i8* %3477 to i64
  %3480 = sub i64 %3478, %3479
  %3481 = trunc i64 %3480 to i32
  %3482 = sext i32 %2791 to i64
  %3483 = load i32** @PL_regendp, align 8
  %3484 = getelementptr inbounds i32* %3483, i64 %3482
  store i32 %3481, i32* %3484, align 4
  br label %3489

; <label>:3485                                    ; preds = %3447
  %3486 = sext i32 %2791 to i64
  %3487 = load i32** @PL_regendp, align 8
  %3488 = getelementptr inbounds i32* %3487, i64 %3486
  store i32 -1, i32* %3488, align 4
  br label %3489

; <label>:3489                                    ; preds = %3485, %3466
  br label %3490

; <label>:3490                                    ; preds = %3489, %3445
  %3491 = call i32 (%struct.regnode*, ...)* bitcast (i32 (...)* @regmatch to i32 (%struct.regnode*, ...)*)(%struct.regnode* %next.0)
  %3492 = icmp ne i32 %3491, 0
  br i1 %3492, label %3493, label %3494

; <label>:3493                                    ; preds = %3490
  br label %5028

; <label>:3494                                    ; preds = %3490
  %3495 = load i32* @PL_savestack_ix, align 4
  %3496 = icmp sgt i32 %3495, %3430
  br i1 %3496, label %3497, label %3498

; <label>:3497                                    ; preds = %3494
  call void @Perl_leave_scope(i32 %3430)
  br label %3498

; <label>:3498                                    ; preds = %3497, %3494
  br label %3499

; <label>:3499                                    ; preds = %3498, %3440
  %3500 = add nsw i32 %n.3, -1
  %3501 = load i8* @PL_reg_match_utf8, align 1
  %3502 = sext i8 %3501 to i32
  %3503 = icmp ne i32 %3502, 0
  br i1 %3503, label %3504, label %3510

; <label>:3504                                    ; preds = %3499
  %3505 = load i32* %l9, align 4
  %3506 = sub nsw i32 0, %3505
  %3507 = call i32 (i8*, i32, ...)* bitcast (i32 (...)* @reghop to i32 (i8*, i32, ...)*)(i8* %locinput.7, i32 %3506)
  %3508 = sext i32 %3507 to i64
  %3509 = inttoptr i64 %3508 to i8*
  br label %3515

; <label>:3510                                    ; preds = %3499
  %3511 = load i32* %l9, align 4
  %3512 = sub nsw i32 0, %3511
  %3513 = sext i32 %3512 to i64
  %3514 = getelementptr inbounds i8* %locinput.7, i64 %3513
  br label %3515

; <label>:3515                                    ; preds = %3510, %3504
  %3516 = phi i8* [ %3509, %3504 ], [ %3514, %3510 ]
  store i8* %3516, i8** @PL_reginput, align 8
  br label %3431

; <label>:3517                                    ; preds = %3431
  br label %3518

; <label>:3518                                    ; preds = %3517, %3166
  %minmod.1 = phi i32 [ 0, %3166 ], [ %minmod.0, %3517 ]
  %c2.12 = phi i32 [ %c2.5, %3166 ], [ %c2.11, %3517 ]
  %c1.8 = phi i32 [ %c1.3, %3166 ], [ %c1.7, %3517 ]
  %ln.9 = phi i32 [ %ln.8, %3166 ], [ %2784, %3517 ]
  br label %5029

; <label>:3519                                    ; preds = %15
  %3520 = getelementptr inbounds %struct.regnode* %scan.0, i32 0, i32 0
  %3521 = load i8* %3520, align 1
  %3522 = zext i8 %3521 to i32
  %3523 = load i32* @PL_regsize, align 4
  %3524 = icmp sgt i32 %3522, %3523
  br i1 %3524, label %3525, label %3526

; <label>:3525                                    ; preds = %3519
  store i32 %3522, i32* @PL_regsize, align 4
  br label %3526

; <label>:3526                                    ; preds = %3525, %3519
  %3527 = load i32** @PL_reglastparen, align 8
  %3528 = load i32* %3527, align 4
  %3529 = icmp sgt i32 %3522, %3528
  br i1 %3529, label %3530, label %3532

; <label>:3530                                    ; preds = %3526
  %3531 = load i32** @PL_reglastparen, align 8
  store i32 %3522, i32* %3531, align 4
  br label %3532

; <label>:3532                                    ; preds = %3530, %3526
  %3533 = bitcast %struct.regnode* %scan.0 to %struct.regnode_2*
  %3534 = getelementptr inbounds %struct.regnode_2* %3533, i32 0, i32 3
  %3535 = load i16* %3534, align 2
  %3536 = zext i16 %3535 to i32
  %3537 = bitcast %struct.regnode* %scan.0 to %struct.regnode_2*
  %3538 = getelementptr inbounds %struct.regnode_2* %3537, i32 0, i32 4
  %3539 = load i16* %3538, align 2
  %3540 = zext i16 %3539 to i32
  %3541 = getelementptr inbounds %struct.regnode* %scan.0, i64 1
  %3542 = getelementptr inbounds %struct.regnode* %3541, i64 1
  %3543 = call %struct.regnode* @Perl_regnext(%struct.regnode* %3542)
  br label %3559

; <label>:3544                                    ; preds = %15
  %3545 = bitcast %struct.regnode* %scan.0 to %struct.regnode_2*
  %3546 = getelementptr inbounds %struct.regnode_2* %3545, i32 0, i32 3
  %3547 = load i16* %3546, align 2
  %3548 = zext i16 %3547 to i32
  %3549 = bitcast %struct.regnode* %scan.0 to %struct.regnode_2*
  %3550 = getelementptr inbounds %struct.regnode_2* %3549, i32 0, i32 4
  %3551 = load i16* %3550, align 2
  %3552 = zext i16 %3551 to i32
  %3553 = getelementptr inbounds %struct.regnode* %scan.0, i64 1
  %3554 = getelementptr inbounds %struct.regnode* %3553, i64 1
  br label %3559

; <label>:3555                                    ; preds = %15
  %3556 = getelementptr inbounds %struct.regnode* %scan.0, i64 1
  br label %3559

; <label>:3557                                    ; preds = %15
  %3558 = getelementptr inbounds %struct.regnode* %scan.0, i64 1
  br label %3559

; <label>:3559                                    ; preds = %3557, %3555, %3544, %3532
  %paren.0 = phi i32 [ 0, %3557 ], [ 0, %3555 ], [ 0, %3544 ], [ %3522, %3532 ]
  %ln.10 = phi i32 [ 1, %3557 ], [ 0, %3555 ], [ %3548, %3544 ], [ %3536, %3532 ]
  %n.4 = phi i32 [ 32767, %3557 ], [ 32767, %3555 ], [ %3552, %3544 ], [ %3540, %3532 ]
  %scan.2 = phi %struct.regnode* [ %3558, %3557 ], [ %3556, %3555 ], [ %3554, %3544 ], [ %3543, %3532 ]
  %3560 = getelementptr inbounds %struct.regnode* %next.0, i32 0, i32 1
  %3561 = load i8* %3560, align 1
  %3562 = zext i8 %3561 to i64
  %3563 = getelementptr inbounds [0 x i8]* @PL_regkind, i32 0, i64 %3562
  %3564 = load i8* %3563, align 1
  %3565 = zext i8 %3564 to i32
  %3566 = icmp eq i32 %3565, 33
  br i1 %3566, label %3624, label %3567

; <label>:3567                                    ; preds = %3559
  %3568 = getelementptr inbounds %struct.regnode* %next.0, i32 0, i32 1
  %3569 = load i8* %3568, align 1
  %3570 = zext i8 %3569 to i64
  %3571 = getelementptr inbounds [0 x i8]* @PL_regkind, i32 0, i64 %3570
  %3572 = load i8* %3571, align 1
  %3573 = zext i8 %3572 to i32
  %3574 = icmp eq i32 %3573, 47
  br i1 %3574, label %3624, label %3575

; <label>:3575                                    ; preds = %3567
  %3576 = getelementptr inbounds %struct.regnode* %next.0, i32 0, i32 1
  %3577 = load i8* %3576, align 1
  %3578 = zext i8 %3577 to i32
  %3579 = icmp eq i32 %3578, 45
  br i1 %3579, label %3624, label %3580

; <label>:3580                                    ; preds = %3575
  %3581 = getelementptr inbounds %struct.regnode* %next.0, i32 0, i32 1
  %3582 = load i8* %3581, align 1
  %3583 = zext i8 %3582 to i32
  %3584 = icmp eq i32 %3583, 46
  br i1 %3584, label %3624, label %3585

; <label>:3585                                    ; preds = %3580
  %3586 = getelementptr inbounds %struct.regnode* %next.0, i32 0, i32 1
  %3587 = load i8* %3586, align 1
  %3588 = zext i8 %3587 to i32
  %3589 = icmp eq i32 %3588, 57
  br i1 %3589, label %3624, label %3590

; <label>:3590                                    ; preds = %3585
  %3591 = getelementptr inbounds %struct.regnode* %next.0, i32 0, i32 1
  %3592 = load i8* %3591, align 1
  %3593 = zext i8 %3592 to i32
  %3594 = icmp eq i32 %3593, 52
  br i1 %3594, label %3624, label %3595

; <label>:3595                                    ; preds = %3590
  %3596 = getelementptr inbounds %struct.regnode* %next.0, i32 0, i32 1
  %3597 = load i8* %3596, align 1
  %3598 = zext i8 %3597 to i32
  %3599 = icmp eq i32 %3598, 50
  br i1 %3599, label %3624, label %3600

; <label>:3600                                    ; preds = %3595
  %3601 = getelementptr inbounds %struct.regnode* %next.0, i32 0, i32 1
  %3602 = load i8* %3601, align 1
  %3603 = zext i8 %3602 to i32
  %3604 = icmp eq i32 %3603, 39
  br i1 %3604, label %3624, label %3605

; <label>:3605                                    ; preds = %3600
  %3606 = getelementptr inbounds %struct.regnode* %next.0, i32 0, i32 1
  %3607 = load i8* %3606, align 1
  %3608 = zext i8 %3607 to i32
  %3609 = icmp eq i32 %3608, 58
  br i1 %3609, label %3624, label %3610

; <label>:3610                                    ; preds = %3605
  %3611 = getelementptr inbounds %struct.regnode* %next.0, i32 0, i32 1
  %3612 = load i8* %3611, align 1
  %3613 = zext i8 %3612 to i64
  %3614 = getelementptr inbounds [0 x i8]* @PL_regkind, i32 0, i64 %3613
  %3615 = load i8* %3614, align 1
  %3616 = zext i8 %3615 to i32
  %3617 = icmp eq i32 %3616, 40
  br i1 %3617, label %3618, label %3972

; <label>:3618                                    ; preds = %3610
  %3619 = bitcast %struct.regnode* %next.0 to %struct.regnode_2*
  %3620 = getelementptr inbounds %struct.regnode_2* %3619, i32 0, i32 3
  %3621 = load i16* %3620, align 2
  %3622 = zext i16 %3621 to i32
  %3623 = icmp sgt i32 %3622, 0
  br i1 %3623, label %3624, label %3972

; <label>:3624                                    ; preds = %3618, %3605, %3600, %3595, %3590, %3585, %3580, %3575, %3567, %3559
  %3625 = getelementptr inbounds %struct.regnode* %next.0, i32 0, i32 1
  %3626 = load i8* %3625, align 1
  %3627 = zext i8 %3626 to i64
  %3628 = getelementptr inbounds [0 x i8]* @PL_regkind, i32 0, i64 %3627
  %3629 = load i8* %3628, align 1
  %3630 = zext i8 %3629 to i32
  %3631 = icmp eq i32 %3630, 33
  br i1 %3631, label %3748, label %3632

; <label>:3632                                    ; preds = %3624
  %3633 = getelementptr inbounds %struct.regnode* %next.0, i32 0, i32 1
  %3634 = load i8* %3633, align 1
  %3635 = zext i8 %3634 to i64
  %3636 = getelementptr inbounds [0 x i8]* @PL_regkind, i32 0, i64 %3635
  %3637 = load i8* %3636, align 1
  %3638 = zext i8 %3637 to i32
  %3639 = icmp eq i32 %3638, 47
  br i1 %3639, label %3748, label %3640

; <label>:3640                                    ; preds = %3632
  br label %3641

; <label>:3641                                    ; preds = %3746, %3640
  %text_node13.0 = phi %struct.regnode* [ %next.0, %3640 ], [ %text_node13.3, %3746 ]
  %3642 = getelementptr inbounds %struct.regnode* %text_node13.0, i32 0, i32 1
  %3643 = load i8* %3642, align 1
  %3644 = zext i8 %3643 to i32
  %3645 = icmp eq i32 %3644, 45
  br i1 %3645, label %3692, label %3646

; <label>:3646                                    ; preds = %3641
  %3647 = getelementptr inbounds %struct.regnode* %text_node13.0, i32 0, i32 1
  %3648 = load i8* %3647, align 1
  %3649 = zext i8 %3648 to i32
  %3650 = icmp eq i32 %3649, 46
  br i1 %3650, label %3692, label %3651

; <label>:3651                                    ; preds = %3646
  %3652 = getelementptr inbounds %struct.regnode* %text_node13.0, i32 0, i32 1
  %3653 = load i8* %3652, align 1
  %3654 = zext i8 %3653 to i32
  %3655 = icmp eq i32 %3654, 57
  br i1 %3655, label %3692, label %3656

; <label>:3656                                    ; preds = %3651
  %3657 = getelementptr inbounds %struct.regnode* %text_node13.0, i32 0, i32 1
  %3658 = load i8* %3657, align 1
  %3659 = zext i8 %3658 to i32
  %3660 = icmp eq i32 %3659, 52
  br i1 %3660, label %3692, label %3661

; <label>:3661                                    ; preds = %3656
  %3662 = getelementptr inbounds %struct.regnode* %text_node13.0, i32 0, i32 1
  %3663 = load i8* %3662, align 1
  %3664 = zext i8 %3663 to i32
  %3665 = icmp eq i32 %3664, 50
  br i1 %3665, label %3692, label %3666

; <label>:3666                                    ; preds = %3661
  %3667 = getelementptr inbounds %struct.regnode* %text_node13.0, i32 0, i32 1
  %3668 = load i8* %3667, align 1
  %3669 = zext i8 %3668 to i32
  %3670 = icmp eq i32 %3669, 39
  br i1 %3670, label %3692, label %3671

; <label>:3671                                    ; preds = %3666
  %3672 = getelementptr inbounds %struct.regnode* %text_node13.0, i32 0, i32 1
  %3673 = load i8* %3672, align 1
  %3674 = zext i8 %3673 to i32
  %3675 = icmp eq i32 %3674, 58
  br i1 %3675, label %3692, label %3676

; <label>:3676                                    ; preds = %3671
  %3677 = getelementptr inbounds %struct.regnode* %text_node13.0, i32 0, i32 1
  %3678 = load i8* %3677, align 1
  %3679 = zext i8 %3678 to i64
  %3680 = getelementptr inbounds [0 x i8]* @PL_regkind, i32 0, i64 %3679
  %3681 = load i8* %3680, align 1
  %3682 = zext i8 %3681 to i32
  %3683 = icmp eq i32 %3682, 40
  br i1 %3683, label %3684, label %3690

; <label>:3684                                    ; preds = %3676
  %3685 = bitcast %struct.regnode* %text_node13.0 to %struct.regnode_2*
  %3686 = getelementptr inbounds %struct.regnode_2* %3685, i32 0, i32 3
  %3687 = load i16* %3686, align 2
  %3688 = zext i16 %3687 to i32
  %3689 = icmp sgt i32 %3688, 0
  br label %3690

; <label>:3690                                    ; preds = %3684, %3676
  %3691 = phi i1 [ false, %3676 ], [ %3689, %3684 ]
  br label %3692

; <label>:3692                                    ; preds = %3690, %3671, %3666, %3661, %3656, %3651, %3646, %3641
  %3693 = phi i1 [ true, %3671 ], [ true, %3666 ], [ true, %3661 ], [ true, %3656 ], [ true, %3651 ], [ true, %3646 ], [ true, %3641 ], [ %3691, %3690 ]
  br i1 %3693, label %3694, label %3747

; <label>:3694                                    ; preds = %3692
  %3695 = getelementptr inbounds %struct.regnode* %text_node13.0, i32 0, i32 1
  %3696 = load i8* %3695, align 1
  %3697 = zext i8 %3696 to i32
  %3698 = icmp eq i32 %3697, 52
  br i1 %3698, label %3707, label %3699

; <label>:3699                                    ; preds = %3694
  %3700 = getelementptr inbounds %struct.regnode* %text_node13.0, i32 0, i32 1
  %3701 = load i8* %3700, align 1
  %3702 = zext i8 %3701 to i64
  %3703 = getelementptr inbounds [0 x i8]* @PL_regkind, i32 0, i64 %3702
  %3704 = load i8* %3703, align 1
  %3705 = zext i8 %3704 to i32
  %3706 = icmp eq i32 %3705, 40
  br i1 %3706, label %3707, label %3710

; <label>:3707                                    ; preds = %3699, %3694
  %3708 = getelementptr inbounds %struct.regnode* %text_node13.0, i64 1
  %3709 = getelementptr inbounds %struct.regnode* %3708, i64 1
  br label %3746

; <label>:3710                                    ; preds = %3699
  %3711 = getelementptr inbounds %struct.regnode* %text_node13.0, i32 0, i32 1
  %3712 = load i8* %3711, align 1
  %3713 = zext i8 %3712 to i32
  %3714 = icmp eq i32 %3713, 39
  br i1 %3714, label %3715, label %3717

; <label>:3715                                    ; preds = %3710
  %3716 = getelementptr inbounds %struct.regnode* %text_node13.0, i64 1
  br label %3745

; <label>:3717                                    ; preds = %3710
  %3718 = getelementptr inbounds %struct.regnode* %text_node13.0, i32 0, i32 1
  %3719 = load i8* %3718, align 1
  %3720 = zext i8 %3719 to i32
  %3721 = icmp eq i32 %3720, 50
  br i1 %3721, label %3722, label %3738

; <label>:3722                                    ; preds = %3717
  %3723 = getelementptr inbounds %struct.regnode* %text_node13.0, i32 0, i32 0
  %3724 = load i8* %3723, align 1
  %3725 = zext i8 %3724 to i32
  %3726 = icmp eq i32 %3725, 0
  br i1 %3726, label %3727, label %3730

; <label>:3727                                    ; preds = %3722
  %3728 = getelementptr inbounds %struct.regnode* %text_node13.0, i64 1
  %3729 = getelementptr inbounds %struct.regnode* %3728, i64 1
  br label %3736

; <label>:3730                                    ; preds = %3722
  %3731 = bitcast %struct.regnode* %text_node13.0 to %struct.regnode_1*
  %3732 = getelementptr inbounds %struct.regnode_1* %3731, i32 0, i32 3
  %3733 = load i32* %3732, align 4
  %3734 = zext i32 %3733 to i64
  %3735 = getelementptr inbounds %struct.regnode* %text_node13.0, i64 %3734
  br label %3736

; <label>:3736                                    ; preds = %3730, %3727
  %3737 = phi %struct.regnode* [ %3729, %3727 ], [ %3735, %3730 ]
  br label %3744

; <label>:3738                                    ; preds = %3717
  %3739 = getelementptr inbounds %struct.regnode* %text_node13.0, i32 0, i32 2
  %3740 = load i16* %3739, align 2
  %3741 = zext i16 %3740 to i32
  %3742 = sext i32 %3741 to i64
  %3743 = getelementptr inbounds %struct.regnode* %text_node13.0, i64 %3742
  br label %3744

; <label>:3744                                    ; preds = %3738, %3736
  %text_node13.1 = phi %struct.regnode* [ %3737, %3736 ], [ %3743, %3738 ]
  br label %3745

; <label>:3745                                    ; preds = %3744, %3715
  %text_node13.2 = phi %struct.regnode* [ %3716, %3715 ], [ %text_node13.1, %3744 ]
  br label %3746

; <label>:3746                                    ; preds = %3745, %3707
  %text_node13.3 = phi %struct.regnode* [ %3709, %3707 ], [ %text_node13.2, %3745 ]
  br label %3641

; <label>:3747                                    ; preds = %3692
  br label %3748

; <label>:3748                                    ; preds = %3747, %3632, %3624
  %text_node13.4 = phi %struct.regnode* [ %next.0, %3624 ], [ %next.0, %3632 ], [ %text_node13.0, %3747 ]
  %3749 = getelementptr inbounds %struct.regnode* %text_node13.4, i32 0, i32 1
  %3750 = load i8* %3749, align 1
  %3751 = zext i8 %3750 to i64
  %3752 = getelementptr inbounds [0 x i8]* @PL_regkind, i32 0, i64 %3751
  %3753 = load i8* %3752, align 1
  %3754 = zext i8 %3753 to i32
  %3755 = icmp eq i32 %3754, 33
  br i1 %3755, label %3765, label %3756

; <label>:3756                                    ; preds = %3748
  %3757 = getelementptr inbounds %struct.regnode* %text_node13.4, i32 0, i32 1
  %3758 = load i8* %3757, align 1
  %3759 = zext i8 %3758 to i64
  %3760 = getelementptr inbounds [0 x i8]* @PL_regkind, i32 0, i64 %3759
  %3761 = load i8* %3760, align 1
  %3762 = zext i8 %3761 to i32
  %3763 = icmp eq i32 %3762, 47
  br i1 %3763, label %3765, label %3764

; <label>:3764                                    ; preds = %3756
  br label %3971

; <label>:3765                                    ; preds = %3756, %3748
  %3766 = getelementptr inbounds %struct.regnode* %text_node13.4, i32 0, i32 1
  %3767 = load i8* %3766, align 1
  %3768 = zext i8 %3767 to i64
  %3769 = getelementptr inbounds [0 x i8]* @PL_regkind, i32 0, i64 %3768
  %3770 = load i8* %3769, align 1
  %3771 = zext i8 %3770 to i32
  %3772 = icmp eq i32 %3771, 47
  br i1 %3772, label %3773, label %3774

; <label>:3773                                    ; preds = %3765
  br label %3974

; <label>:3774                                    ; preds = %3765
  %3775 = bitcast %struct.regnode* %text_node13.4 to %struct.regnode_string*
  %3776 = getelementptr inbounds %struct.regnode_string* %3775, i32 0, i32 3
  %3777 = getelementptr inbounds [1 x i8]* %3776, i32 0, i32 0
  br label %3778

; <label>:3778                                    ; preds = %3774
  %3779 = load i32* @PL_reg_flags, align 4
  %3780 = and i32 %3779, 8
  %3781 = icmp ne i32 %3780, 0
  br i1 %3781, label %3816, label %3782

; <label>:3782                                    ; preds = %3778
  %3783 = load i8* %3777, align 1
  %3784 = zext i8 %3783 to i32
  %3785 = getelementptr inbounds %struct.regnode* %text_node13.4, i32 0, i32 1
  %3786 = load i8* %3785, align 1
  %3787 = zext i8 %3786 to i32
  %3788 = icmp eq i32 %3787, 34
  br i1 %3788, label %3794, label %3789

; <label>:3789                                    ; preds = %3782
  %3790 = getelementptr inbounds %struct.regnode* %text_node13.4, i32 0, i32 1
  %3791 = load i8* %3790, align 1
  %3792 = zext i8 %3791 to i32
  %3793 = icmp eq i32 %3792, 48
  br i1 %3793, label %3794, label %3799

; <label>:3794                                    ; preds = %3789, %3782
  %3795 = sext i32 %3784 to i64
  %3796 = getelementptr inbounds [0 x i8]* @PL_fold, i32 0, i64 %3795
  %3797 = load i8* %3796, align 1
  %3798 = zext i8 %3797 to i32
  br label %3815

; <label>:3799                                    ; preds = %3789
  %3800 = getelementptr inbounds %struct.regnode* %text_node13.4, i32 0, i32 1
  %3801 = load i8* %3800, align 1
  %3802 = zext i8 %3801 to i32
  %3803 = icmp eq i32 %3802, 35
  br i1 %3803, label %3809, label %3804

; <label>:3804                                    ; preds = %3799
  %3805 = getelementptr inbounds %struct.regnode* %text_node13.4, i32 0, i32 1
  %3806 = load i8* %3805, align 1
  %3807 = zext i8 %3806 to i32
  %3808 = icmp eq i32 %3807, 49
  br i1 %3808, label %3809, label %3814

; <label>:3809                                    ; preds = %3804, %3799
  %3810 = sext i32 %3784 to i64
  %3811 = getelementptr inbounds [0 x i8]* @PL_fold_locale, i32 0, i64 %3810
  %3812 = load i8* %3811, align 1
  %3813 = zext i8 %3812 to i32
  br label %3814

; <label>:3814                                    ; preds = %3809, %3804
  %c2.13 = phi i32 [ %3813, %3809 ], [ %3784, %3804 ]
  br label %3815

; <label>:3815                                    ; preds = %3814, %3794
  %c2.14 = phi i32 [ %3798, %3794 ], [ %c2.13, %3814 ]
  br label %3970

; <label>:3816                                    ; preds = %3778
  %3817 = getelementptr inbounds %struct.regnode* %text_node13.4, i32 0, i32 1
  %3818 = load i8* %3817, align 1
  %3819 = zext i8 %3818 to i32
  %3820 = icmp eq i32 %3819, 34
  br i1 %3820, label %3826, label %3821

; <label>:3821                                    ; preds = %3816
  %3822 = getelementptr inbounds %struct.regnode* %text_node13.4, i32 0, i32 1
  %3823 = load i8* %3822, align 1
  %3824 = zext i8 %3823 to i32
  %3825 = icmp eq i32 %3824, 48
  br i1 %3825, label %3826, label %3923

; <label>:3826                                    ; preds = %3821, %3816
  %3827 = getelementptr inbounds [7 x i8]* %tmpbuf116, i32 0, i32 0
  %3828 = call i64 @Perl_to_utf8_lower(i8* %3777, i8* %3827, i64* %ulen114)
  %3829 = getelementptr inbounds [7 x i8]* %tmpbuf217, i32 0, i32 0
  %3830 = call i64 @Perl_to_utf8_upper(i8* %3777, i8* %3829, i64* %ulen215)
  %3831 = getelementptr inbounds [7 x i8]* %tmpbuf116, i32 0, i32 0
  %3832 = load volatile %struct.cop** @PL_curcop, align 8
  %3833 = getelementptr inbounds %struct.cop* %3832, i32 0, i32 14
  %3834 = load %struct.sv** %3833, align 8
  %3835 = icmp ne %struct.sv* %3834, null
  br i1 %3835, label %3836, label %3860

; <label>:3836                                    ; preds = %3826
  %3837 = load volatile %struct.cop** @PL_curcop, align 8
  %3838 = getelementptr inbounds %struct.cop* %3837, i32 0, i32 14
  %3839 = load %struct.sv** %3838, align 8
  %3840 = icmp ne %struct.sv* %3839, getelementptr inbounds (%struct.sv* null, i64 2)
  br i1 %3840, label %3841, label %3860

; <label>:3841                                    ; preds = %3836
  %3842 = load volatile %struct.cop** @PL_curcop, align 8
  %3843 = getelementptr inbounds %struct.cop* %3842, i32 0, i32 14
  %3844 = load %struct.sv** %3843, align 8
  %3845 = icmp eq %struct.sv* %3844, getelementptr inbounds (%struct.sv* null, i64 1)
  br i1 %3845, label %3872, label %3846

; <label>:3846                                    ; preds = %3841
  %3847 = load volatile %struct.cop** @PL_curcop, align 8
  %3848 = getelementptr inbounds %struct.cop* %3847, i32 0, i32 14
  %3849 = load %struct.sv** %3848, align 8
  %3850 = getelementptr inbounds %struct.sv* %3849, i32 0, i32 0
  %3851 = load i8** %3850, align 8
  %3852 = bitcast i8* %3851 to %struct.xpv*
  %3853 = getelementptr inbounds %struct.xpv* %3852, i32 0, i32 0
  %3854 = load i8** %3853, align 8
  %3855 = getelementptr inbounds i8* %3854, i64 11
  %3856 = load i8* %3855, align 1
  %3857 = sext i8 %3856 to i32
  %3858 = and i32 %3857, 1
  %3859 = icmp ne i32 %3858, 0
  br i1 %3859, label %3872, label %3860

; <label>:3860                                    ; preds = %3846, %3836, %3826
  %3861 = load volatile %struct.cop** @PL_curcop, align 8
  %3862 = getelementptr inbounds %struct.cop* %3861, i32 0, i32 14
  %3863 = load %struct.sv** %3862, align 8
  %3864 = icmp eq %struct.sv* %3863, null
  br i1 %3864, label %3865, label %3870

; <label>:3865                                    ; preds = %3860
  %3866 = load i8* @PL_dowarn, align 1
  %3867 = zext i8 %3866 to i32
  %3868 = and i32 %3867, 1
  %3869 = icmp ne i32 %3868, 0
  br label %3870

; <label>:3870                                    ; preds = %3865, %3860
  %3871 = phi i1 [ false, %3860 ], [ %3869, %3865 ]
  br label %3872

; <label>:3872                                    ; preds = %3870, %3846, %3841
  %3873 = phi i1 [ true, %3846 ], [ true, %3841 ], [ %3871, %3870 ]
  %3874 = select i1 %3873, i32 0, i32 255
  %3875 = call i64 @Perl_utf8n_to_uvuni(i8* %3831, i64 13, i64* null, i32 %3874)
  %3876 = trunc i64 %3875 to i32
  %3877 = getelementptr inbounds [7 x i8]* %tmpbuf217, i32 0, i32 0
  %3878 = load volatile %struct.cop** @PL_curcop, align 8
  %3879 = getelementptr inbounds %struct.cop* %3878, i32 0, i32 14
  %3880 = load %struct.sv** %3879, align 8
  %3881 = icmp ne %struct.sv* %3880, null
  br i1 %3881, label %3882, label %3906

; <label>:3882                                    ; preds = %3872
  %3883 = load volatile %struct.cop** @PL_curcop, align 8
  %3884 = getelementptr inbounds %struct.cop* %3883, i32 0, i32 14
  %3885 = load %struct.sv** %3884, align 8
  %3886 = icmp ne %struct.sv* %3885, getelementptr inbounds (%struct.sv* null, i64 2)
  br i1 %3886, label %3887, label %3906

; <label>:3887                                    ; preds = %3882
  %3888 = load volatile %struct.cop** @PL_curcop, align 8
  %3889 = getelementptr inbounds %struct.cop* %3888, i32 0, i32 14
  %3890 = load %struct.sv** %3889, align 8
  %3891 = icmp eq %struct.sv* %3890, getelementptr inbounds (%struct.sv* null, i64 1)
  br i1 %3891, label %3918, label %3892

; <label>:3892                                    ; preds = %3887
  %3893 = load volatile %struct.cop** @PL_curcop, align 8
  %3894 = getelementptr inbounds %struct.cop* %3893, i32 0, i32 14
  %3895 = load %struct.sv** %3894, align 8
  %3896 = getelementptr inbounds %struct.sv* %3895, i32 0, i32 0
  %3897 = load i8** %3896, align 8
  %3898 = bitcast i8* %3897 to %struct.xpv*
  %3899 = getelementptr inbounds %struct.xpv* %3898, i32 0, i32 0
  %3900 = load i8** %3899, align 8
  %3901 = getelementptr inbounds i8* %3900, i64 11
  %3902 = load i8* %3901, align 1
  %3903 = sext i8 %3902 to i32
  %3904 = and i32 %3903, 1
  %3905 = icmp ne i32 %3904, 0
  br i1 %3905, label %3918, label %3906

; <label>:3906                                    ; preds = %3892, %3882, %3872
  %3907 = load volatile %struct.cop** @PL_curcop, align 8
  %3908 = getelementptr inbounds %struct.cop* %3907, i32 0, i32 14
  %3909 = load %struct.sv** %3908, align 8
  %3910 = icmp eq %struct.sv* %3909, null
  br i1 %3910, label %3911, label %3916

; <label>:3911                                    ; preds = %3906
  %3912 = load i8* @PL_dowarn, align 1
  %3913 = zext i8 %3912 to i32
  %3914 = and i32 %3913, 1
  %3915 = icmp ne i32 %3914, 0
  br label %3916

; <label>:3916                                    ; preds = %3911, %3906
  %3917 = phi i1 [ false, %3906 ], [ %3915, %3911 ]
  br label %3918

; <label>:3918                                    ; preds = %3916, %3892, %3887
  %3919 = phi i1 [ true, %3892 ], [ true, %3887 ], [ %3917, %3916 ]
  %3920 = select i1 %3919, i32 0, i32 255
  %3921 = call i64 @Perl_utf8n_to_uvuni(i8* %3877, i64 13, i64* null, i32 %3920)
  %3922 = trunc i64 %3921 to i32
  br label %3969

; <label>:3923                                    ; preds = %3821
  %3924 = load volatile %struct.cop** @PL_curcop, align 8
  %3925 = getelementptr inbounds %struct.cop* %3924, i32 0, i32 14
  %3926 = load %struct.sv** %3925, align 8
  %3927 = icmp ne %struct.sv* %3926, null
  br i1 %3927, label %3928, label %3952

; <label>:3928                                    ; preds = %3923
  %3929 = load volatile %struct.cop** @PL_curcop, align 8
  %3930 = getelementptr inbounds %struct.cop* %3929, i32 0, i32 14
  %3931 = load %struct.sv** %3930, align 8
  %3932 = icmp ne %struct.sv* %3931, getelementptr inbounds (%struct.sv* null, i64 2)
  br i1 %3932, label %3933, label %3952

; <label>:3933                                    ; preds = %3928
  %3934 = load volatile %struct.cop** @PL_curcop, align 8
  %3935 = getelementptr inbounds %struct.cop* %3934, i32 0, i32 14
  %3936 = load %struct.sv** %3935, align 8
  %3937 = icmp eq %struct.sv* %3936, getelementptr inbounds (%struct.sv* null, i64 1)
  br i1 %3937, label %3964, label %3938

; <label>:3938                                    ; preds = %3933
  %3939 = load volatile %struct.cop** @PL_curcop, align 8
  %3940 = getelementptr inbounds %struct.cop* %3939, i32 0, i32 14
  %3941 = load %struct.sv** %3940, align 8
  %3942 = getelementptr inbounds %struct.sv* %3941, i32 0, i32 0
  %3943 = load i8** %3942, align 8
  %3944 = bitcast i8* %3943 to %struct.xpv*
  %3945 = getelementptr inbounds %struct.xpv* %3944, i32 0, i32 0
  %3946 = load i8** %3945, align 8
  %3947 = getelementptr inbounds i8* %3946, i64 11
  %3948 = load i8* %3947, align 1
  %3949 = sext i8 %3948 to i32
  %3950 = and i32 %3949, 1
  %3951 = icmp ne i32 %3950, 0
  br i1 %3951, label %3964, label %3952

; <label>:3952                                    ; preds = %3938, %3928, %3923
  %3953 = load volatile %struct.cop** @PL_curcop, align 8
  %3954 = getelementptr inbounds %struct.cop* %3953, i32 0, i32 14
  %3955 = load %struct.sv** %3954, align 8
  %3956 = icmp eq %struct.sv* %3955, null
  br i1 %3956, label %3957, label %3962

; <label>:3957                                    ; preds = %3952
  %3958 = load i8* @PL_dowarn, align 1
  %3959 = zext i8 %3958 to i32
  %3960 = and i32 %3959, 1
  %3961 = icmp ne i32 %3960, 0
  br label %3962

; <label>:3962                                    ; preds = %3957, %3952
  %3963 = phi i1 [ false, %3952 ], [ %3961, %3957 ]
  br label %3964

; <label>:3964                                    ; preds = %3962, %3938, %3933
  %3965 = phi i1 [ true, %3938 ], [ true, %3933 ], [ %3963, %3962 ]
  %3966 = select i1 %3965, i32 0, i32 255
  %3967 = call i64 @Perl_utf8n_to_uvuni(i8* %3777, i64 13, i64* null, i32 %3966)
  %3968 = trunc i64 %3967 to i32
  br label %3969

; <label>:3969                                    ; preds = %3964, %3918
  %c2.15 = phi i32 [ %3922, %3918 ], [ %3968, %3964 ]
  %c1.9 = phi i32 [ %3876, %3918 ], [ %3968, %3964 ]
  br label %3970

; <label>:3970                                    ; preds = %3969, %3815
  %c2.16 = phi i32 [ %c2.15, %3969 ], [ %c2.14, %3815 ]
  %c1.10 = phi i32 [ %c1.9, %3969 ], [ %3784, %3815 ]
  br label %3971

; <label>:3971                                    ; preds = %3970, %3764
  %c2.17 = phi i32 [ %c2.16, %3970 ], [ -1000, %3764 ]
  %c1.11 = phi i32 [ %c1.10, %3970 ], [ -1000, %3764 ]
  br label %3973

; <label>:3972                                    ; preds = %3618, %3610
  br label %3973

; <label>:3973                                    ; preds = %3972, %3971
  %c2.18 = phi i32 [ %c2.17, %3971 ], [ -1000, %3972 ]
  %c1.12 = phi i32 [ %c1.11, %3971 ], [ -1000, %3972 ]
  br label %3974

; <label>:3974                                    ; preds = %3973, %3773
  %c2.19 = phi i32 [ -1000, %3773 ], [ %c2.18, %3973 ]
  %c1.13 = phi i32 [ -1000, %3773 ], [ %c1.12, %3973 ]
  store i8* %locinput.0, i8** @PL_reginput, align 8
  %3975 = icmp ne i32 %minmod.0, 0
  br i1 %3975, label %3976, label %4482

; <label>:3976                                    ; preds = %3974
  %3977 = icmp ne i32 %ln.10, 0
  br i1 %3977, label %3978, label %3982

; <label>:3978                                    ; preds = %3976
  %3979 = call i32 (%struct.regnode*, i32, ...)* bitcast (i32 (...)* @regrepeat to i32 (%struct.regnode*, i32, ...)*)(%struct.regnode* %scan.2, i32 %ln.10)
  %3980 = icmp slt i32 %3979, %ln.10
  br i1 %3980, label %3981, label %3982

; <label>:3981                                    ; preds = %3978
  br label %5029

; <label>:3982                                    ; preds = %3978, %3976
  %3983 = load i8** @PL_reginput, align 8
  %3984 = load i32* @PL_savestack_ix, align 4
  %3985 = icmp ne i32 %c1.13, -1000
  br i1 %3985, label %3986, label %4282

; <label>:3986                                    ; preds = %3982
  %3987 = icmp eq i32 %n.4, 32767
  br i1 %3987, label %3988, label %4007

; <label>:3988                                    ; preds = %3986
  %3989 = load i8** @PL_regeol, align 8
  %3990 = getelementptr inbounds i8* %3989, i64 -1
  %3991 = icmp ne i8 %2, 0
  br i1 %3991, label %3992, label %4006

; <label>:3992                                    ; preds = %3988
  br label %3993

; <label>:3993                                    ; preds = %4003, %3992
  %e19.0 = phi i8* [ %3990, %3992 ], [ %4004, %4003 ]
  %3994 = load i8* %e19.0, align 1
  %3995 = zext i8 %3994 to i32
  %3996 = icmp sge i32 %3995, 128
  br i1 %3996, label %3997, label %4001

; <label>:3997                                    ; preds = %3993
  %3998 = load i8* %e19.0, align 1
  %3999 = zext i8 %3998 to i32
  %4000 = icmp sle i32 %3999, 191
  br label %4001

; <label>:4001                                    ; preds = %3997, %3993
  %4002 = phi i1 [ false, %3993 ], [ %4000, %3997 ]
  br i1 %4002, label %4003, label %4005

; <label>:4003                                    ; preds = %4001
  %4004 = getelementptr inbounds i8* %e19.0, i32 -1
  br label %3993

; <label>:4005                                    ; preds = %4001
  br label %4006

; <label>:4006                                    ; preds = %4005, %3988
  %e19.1 = phi i8* [ %e19.0, %4005 ], [ %3990, %3988 ]
  br label %4049

; <label>:4007                                    ; preds = %3986
  %4008 = icmp ne i8 %2, 0
  br i1 %4008, label %4009, label %4036

; <label>:4009                                    ; preds = %4007
  %4010 = sub nsw i32 %n.4, %ln.10
  br label %4011

; <label>:4011                                    ; preds = %4033, %4009
  %e19.2 = phi i8* [ %3983, %4009 ], [ %4032, %4033 ]
  %m.0 = phi i32 [ %4010, %4009 ], [ %4034, %4033 ]
  %4012 = icmp sgt i32 %m.0, 0
  br i1 %4012, label %4013, label %4023

; <label>:4013                                    ; preds = %4011
  %4014 = load i8* %e19.2, align 1
  %4015 = zext i8 %4014 to i64
  %4016 = getelementptr inbounds [0 x i8]* @PL_utf8skip, i32 0, i64 %4015
  %4017 = load i8* %4016, align 1
  %4018 = zext i8 %4017 to i32
  %4019 = sext i32 %4018 to i64
  %4020 = getelementptr inbounds i8* %e19.2, i64 %4019
  %4021 = load i8** @PL_regeol, align 8
  %4022 = icmp ule i8* %4020, %4021
  br label %4023

; <label>:4023                                    ; preds = %4013, %4011
  %4024 = phi i1 [ false, %4011 ], [ %4022, %4013 ]
  br i1 %4024, label %4025, label %4035

; <label>:4025                                    ; preds = %4023
  %4026 = load i8* %e19.2, align 1
  %4027 = zext i8 %4026 to i64
  %4028 = getelementptr inbounds [0 x i8]* @PL_utf8skip, i32 0, i64 %4027
  %4029 = load i8* %4028, align 1
  %4030 = zext i8 %4029 to i32
  %4031 = sext i32 %4030 to i64
  %4032 = getelementptr inbounds i8* %e19.2, i64 %4031
  br label %4033

; <label>:4033                                    ; preds = %4025
  %4034 = add nsw i32 %m.0, -1
  br label %4011

; <label>:4035                                    ; preds = %4023
  br label %4048

; <label>:4036                                    ; preds = %4007
  %4037 = sext i32 %n.4 to i64
  %4038 = getelementptr inbounds i8* %3983, i64 %4037
  %4039 = sext i32 %ln.10 to i64
  %4040 = sub i64 0, %4039
  %4041 = getelementptr inbounds i8* %4038, i64 %4040
  %4042 = load i8** @PL_regeol, align 8
  %4043 = icmp uge i8* %4041, %4042
  br i1 %4043, label %4044, label %4047

; <label>:4044                                    ; preds = %4036
  %4045 = load i8** @PL_regeol, align 8
  %4046 = getelementptr inbounds i8* %4045, i64 -1
  br label %4047

; <label>:4047                                    ; preds = %4044, %4036
  %e19.3 = phi i8* [ %4046, %4044 ], [ %4041, %4036 ]
  br label %4048

; <label>:4048                                    ; preds = %4047, %4035
  %e19.4 = phi i8* [ %e19.2, %4035 ], [ %e19.3, %4047 ]
  br label %4049

; <label>:4049                                    ; preds = %4048, %4006
  %e19.5 = phi i8* [ %e19.1, %4006 ], [ %e19.4, %4048 ]
  br label %4050

; <label>:4050                                    ; preds = %4281, %4049
  %old.0 = phi i8* [ %3983, %4049 ], [ %locinput.15, %4281 ]
  %count.0 = phi i32 [ 0, %4049 ], [ 1, %4281 ]
  %locinput.8 = phi i8* [ %3983, %4049 ], [ %locinput.16, %4281 ]
  %ln.11 = phi i32 [ %ln.10, %4049 ], [ %ln.12, %4281 ]
  %4051 = icmp ne i8 %2, 0
  br i1 %4051, label %4087, label %4052

; <label>:4052                                    ; preds = %4050
  %4053 = icmp eq i32 %c1.13, %c2.19
  br i1 %4053, label %4054, label %4066

; <label>:4054                                    ; preds = %4052
  br label %4055

; <label>:4055                                    ; preds = %4063, %4054
  %locinput.9 = phi i8* [ %locinput.8, %4054 ], [ %4064, %4063 ]
  %4056 = icmp ule i8* %locinput.9, %e19.5
  br i1 %4056, label %4057, label %4061

; <label>:4057                                    ; preds = %4055
  %4058 = load i8* %locinput.9, align 1
  %4059 = zext i8 %4058 to i32
  %4060 = icmp ne i32 %4059, %c1.13
  br label %4061

; <label>:4061                                    ; preds = %4057, %4055
  %4062 = phi i1 [ false, %4055 ], [ %4060, %4057 ]
  br i1 %4062, label %4063, label %4065

; <label>:4063                                    ; preds = %4061
  %4064 = getelementptr inbounds i8* %locinput.9, i32 1
  br label %4055

; <label>:4065                                    ; preds = %4061
  br label %4082

; <label>:4066                                    ; preds = %4052
  br label %4067

; <label>:4067                                    ; preds = %4079, %4066
  %locinput.10 = phi i8* [ %locinput.8, %4066 ], [ %4080, %4079 ]
  %4068 = icmp ule i8* %locinput.10, %e19.5
  br i1 %4068, label %4069, label %4077

; <label>:4069                                    ; preds = %4067
  %4070 = load i8* %locinput.10, align 1
  %4071 = zext i8 %4070 to i32
  %4072 = icmp ne i32 %4071, %c1.13
  br i1 %4072, label %4073, label %4077

; <label>:4073                                    ; preds = %4069
  %4074 = load i8* %locinput.10, align 1
  %4075 = zext i8 %4074 to i32
  %4076 = icmp ne i32 %4075, %c2.19
  br label %4077

; <label>:4077                                    ; preds = %4073, %4069, %4067
  %4078 = phi i1 [ false, %4069 ], [ false, %4067 ], [ %4076, %4073 ]
  br i1 %4078, label %4079, label %4081

; <label>:4079                                    ; preds = %4077
  %4080 = getelementptr inbounds i8* %locinput.10, i32 1
  br label %4067

; <label>:4081                                    ; preds = %4077
  br label %4082

; <label>:4082                                    ; preds = %4081, %4065
  %locinput.11 = phi i8* [ %locinput.9, %4065 ], [ %locinput.10, %4081 ]
  %4083 = ptrtoint i8* %locinput.11 to i64
  %4084 = ptrtoint i8* %old.0 to i64
  %4085 = sub i64 %4083, %4084
  %4086 = trunc i64 %4085 to i32
  br label %4206

; <label>:4087                                    ; preds = %4050
  %4088 = icmp eq i32 %c1.13, %c2.19
  br i1 %4088, label %4089, label %4146

; <label>:4089                                    ; preds = %4087
  br label %4090

; <label>:4090                                    ; preds = %4141, %4089
  %count.1 = phi i32 [ %count.0, %4089 ], [ %4144, %4141 ]
  %locinput.12 = phi i8* [ %locinput.8, %4089 ], [ %4143, %4141 ]
  %4091 = icmp ule i8* %locinput.12, %e19.5
  br i1 %4091, label %4092, label %4139

; <label>:4092                                    ; preds = %4090
  %4093 = load volatile %struct.cop** @PL_curcop, align 8
  %4094 = getelementptr inbounds %struct.cop* %4093, i32 0, i32 14
  %4095 = load %struct.sv** %4094, align 8
  %4096 = icmp ne %struct.sv* %4095, null
  br i1 %4096, label %4097, label %4121

; <label>:4097                                    ; preds = %4092
  %4098 = load volatile %struct.cop** @PL_curcop, align 8
  %4099 = getelementptr inbounds %struct.cop* %4098, i32 0, i32 14
  %4100 = load %struct.sv** %4099, align 8
  %4101 = icmp ne %struct.sv* %4100, getelementptr inbounds (%struct.sv* null, i64 2)
  br i1 %4101, label %4102, label %4121

; <label>:4102                                    ; preds = %4097
  %4103 = load volatile %struct.cop** @PL_curcop, align 8
  %4104 = getelementptr inbounds %struct.cop* %4103, i32 0, i32 14
  %4105 = load %struct.sv** %4104, align 8
  %4106 = icmp eq %struct.sv* %4105, getelementptr inbounds (%struct.sv* null, i64 1)
  br i1 %4106, label %4133, label %4107

; <label>:4107                                    ; preds = %4102
  %4108 = load volatile %struct.cop** @PL_curcop, align 8
  %4109 = getelementptr inbounds %struct.cop* %4108, i32 0, i32 14
  %4110 = load %struct.sv** %4109, align 8
  %4111 = getelementptr inbounds %struct.sv* %4110, i32 0, i32 0
  %4112 = load i8** %4111, align 8
  %4113 = bitcast i8* %4112 to %struct.xpv*
  %4114 = getelementptr inbounds %struct.xpv* %4113, i32 0, i32 0
  %4115 = load i8** %4114, align 8
  %4116 = getelementptr inbounds i8* %4115, i64 11
  %4117 = load i8* %4116, align 1
  %4118 = sext i8 %4117 to i32
  %4119 = and i32 %4118, 1
  %4120 = icmp ne i32 %4119, 0
  br i1 %4120, label %4133, label %4121

; <label>:4121                                    ; preds = %4107, %4097, %4092
  %4122 = load volatile %struct.cop** @PL_curcop, align 8
  %4123 = getelementptr inbounds %struct.cop* %4122, i32 0, i32 14
  %4124 = load %struct.sv** %4123, align 8
  %4125 = icmp eq %struct.sv* %4124, null
  br i1 %4125, label %4126, label %4131

; <label>:4126                                    ; preds = %4121
  %4127 = load i8* @PL_dowarn, align 1
  %4128 = zext i8 %4127 to i32
  %4129 = and i32 %4128, 1
  %4130 = icmp ne i32 %4129, 0
  br label %4131

; <label>:4131                                    ; preds = %4126, %4121
  %4132 = phi i1 [ false, %4121 ], [ %4130, %4126 ]
  br label %4133

; <label>:4133                                    ; preds = %4131, %4107, %4102
  %4134 = phi i1 [ true, %4107 ], [ true, %4102 ], [ %4132, %4131 ]
  %4135 = select i1 %4134, i32 0, i32 255
  %4136 = call i64 @Perl_utf8n_to_uvuni(i8* %locinput.12, i64 13, i64* %len20, i32 %4135)
  %4137 = sext i32 %c1.13 to i64
  %4138 = icmp ne i64 %4136, %4137
  br label %4139

; <label>:4139                                    ; preds = %4133, %4090
  %4140 = phi i1 [ false, %4090 ], [ %4138, %4133 ]
  br i1 %4140, label %4141, label %4145

; <label>:4141                                    ; preds = %4139
  %4142 = load i64* %len20, align 8
  %4143 = getelementptr inbounds i8* %locinput.12, i64 %4142
  %4144 = add nsw i32 %count.1, 1
  br label %4090

; <label>:4145                                    ; preds = %4139
  br label %4205

; <label>:4146                                    ; preds = %4087
  br label %4147

; <label>:4147                                    ; preds = %4200, %4146
  %count.2 = phi i32 [ %count.0, %4146 ], [ %4203, %4200 ]
  %locinput.13 = phi i8* [ %locinput.8, %4146 ], [ %4202, %4200 ]
  %4148 = icmp ule i8* %locinput.13, %e19.5
  br i1 %4148, label %4149, label %4204

; <label>:4149                                    ; preds = %4147
  %4150 = load volatile %struct.cop** @PL_curcop, align 8
  %4151 = getelementptr inbounds %struct.cop* %4150, i32 0, i32 14
  %4152 = load %struct.sv** %4151, align 8
  %4153 = icmp ne %struct.sv* %4152, null
  br i1 %4153, label %4154, label %4178

; <label>:4154                                    ; preds = %4149
  %4155 = load volatile %struct.cop** @PL_curcop, align 8
  %4156 = getelementptr inbounds %struct.cop* %4155, i32 0, i32 14
  %4157 = load %struct.sv** %4156, align 8
  %4158 = icmp ne %struct.sv* %4157, getelementptr inbounds (%struct.sv* null, i64 2)
  br i1 %4158, label %4159, label %4178

; <label>:4159                                    ; preds = %4154
  %4160 = load volatile %struct.cop** @PL_curcop, align 8
  %4161 = getelementptr inbounds %struct.cop* %4160, i32 0, i32 14
  %4162 = load %struct.sv** %4161, align 8
  %4163 = icmp eq %struct.sv* %4162, getelementptr inbounds (%struct.sv* null, i64 1)
  br i1 %4163, label %4190, label %4164

; <label>:4164                                    ; preds = %4159
  %4165 = load volatile %struct.cop** @PL_curcop, align 8
  %4166 = getelementptr inbounds %struct.cop* %4165, i32 0, i32 14
  %4167 = load %struct.sv** %4166, align 8
  %4168 = getelementptr inbounds %struct.sv* %4167, i32 0, i32 0
  %4169 = load i8** %4168, align 8
  %4170 = bitcast i8* %4169 to %struct.xpv*
  %4171 = getelementptr inbounds %struct.xpv* %4170, i32 0, i32 0
  %4172 = load i8** %4171, align 8
  %4173 = getelementptr inbounds i8* %4172, i64 11
  %4174 = load i8* %4173, align 1
  %4175 = sext i8 %4174 to i32
  %4176 = and i32 %4175, 1
  %4177 = icmp ne i32 %4176, 0
  br i1 %4177, label %4190, label %4178

; <label>:4178                                    ; preds = %4164, %4154, %4149
  %4179 = load volatile %struct.cop** @PL_curcop, align 8
  %4180 = getelementptr inbounds %struct.cop* %4179, i32 0, i32 14
  %4181 = load %struct.sv** %4180, align 8
  %4182 = icmp eq %struct.sv* %4181, null
  br i1 %4182, label %4183, label %4188

; <label>:4183                                    ; preds = %4178
  %4184 = load i8* @PL_dowarn, align 1
  %4185 = zext i8 %4184 to i32
  %4186 = and i32 %4185, 1
  %4187 = icmp ne i32 %4186, 0
  br label %4188

; <label>:4188                                    ; preds = %4183, %4178
  %4189 = phi i1 [ false, %4178 ], [ %4187, %4183 ]
  br label %4190

; <label>:4190                                    ; preds = %4188, %4164, %4159
  %4191 = phi i1 [ true, %4164 ], [ true, %4159 ], [ %4189, %4188 ]
  %4192 = select i1 %4191, i32 0, i32 255
  %4193 = call i64 @Perl_utf8n_to_uvuni(i8* %locinput.13, i64 13, i64* %len20, i32 %4192)
  %4194 = sext i32 %c1.13 to i64
  %4195 = icmp eq i64 %4193, %4194
  br i1 %4195, label %4199, label %4196

; <label>:4196                                    ; preds = %4190
  %4197 = sext i32 %c2.19 to i64
  %4198 = icmp eq i64 %4193, %4197
  br i1 %4198, label %4199, label %4200

; <label>:4199                                    ; preds = %4196, %4190
  br label %4204

; <label>:4200                                    ; preds = %4196
  %4201 = load i64* %len20, align 8
  %4202 = getelementptr inbounds i8* %locinput.13, i64 %4201
  %4203 = add nsw i32 %count.2, 1
  br label %4147

; <label>:4204                                    ; preds = %4199, %4147
  br label %4205

; <label>:4205                                    ; preds = %4204, %4145
  %count.3 = phi i32 [ %count.1, %4145 ], [ %count.2, %4204 ]
  %locinput.14 = phi i8* [ %locinput.12, %4145 ], [ %locinput.13, %4204 ]
  br label %4206

; <label>:4206                                    ; preds = %4205, %4082
  %count.4 = phi i32 [ %count.3, %4205 ], [ %4086, %4082 ]
  %locinput.15 = phi i8* [ %locinput.14, %4205 ], [ %locinput.11, %4082 ]
  %4207 = icmp ugt i8* %locinput.15, %e19.5
  br i1 %4207, label %4208, label %4209

; <label>:4208                                    ; preds = %4206
  br label %5029

; <label>:4209                                    ; preds = %4206
  %4210 = icmp ne i8* %locinput.15, %old.0
  br i1 %4210, label %4211, label %4216

; <label>:4211                                    ; preds = %4209
  %4212 = call i32 (%struct.regnode*, i32, ...)* bitcast (i32 (...)* @regrepeat to i32 (%struct.regnode*, i32, ...)*)(%struct.regnode* %scan.2, i32 %count.4)
  %4213 = icmp slt i32 %4212, %count.4
  br i1 %4213, label %4214, label %4215

; <label>:4214                                    ; preds = %4211
  br label %5029

; <label>:4215                                    ; preds = %4211
  br label %4216

; <label>:4216                                    ; preds = %4215, %4209
  %ln.12 = phi i32 [ 1, %4215 ], [ %ln.11, %4209 ]
  %4217 = icmp ne i32 %paren.0, 0
  br i1 %4217, label %4218, label %4253

; <label>:4218                                    ; preds = %4216
  %4219 = icmp ne i32 %ln.12, 0
  br i1 %4219, label %4220, label %4248

; <label>:4220                                    ; preds = %4218
  %4221 = load i8* @PL_reg_match_utf8, align 1
  %4222 = sext i8 %4221 to i32
  %4223 = icmp ne i32 %4222, 0
  br i1 %4223, label %4224, label %4228

; <label>:4224                                    ; preds = %4220
  %4225 = call i32 (i8*, i32, ...)* bitcast (i32 (...)* @reghop to i32 (i8*, i32, ...)*)(i8* %locinput.15, i32 -1)
  %4226 = sext i32 %4225 to i64
  %4227 = inttoptr i64 %4226 to i8*
  br label %4230

; <label>:4228                                    ; preds = %4220
  %4229 = getelementptr inbounds i8* %locinput.15, i64 -1
  br label %4230

; <label>:4230                                    ; preds = %4228, %4224
  %4231 = phi i8* [ %4227, %4224 ], [ %4229, %4228 ]
  %4232 = load i8** @PL_bostr, align 8
  %4233 = ptrtoint i8* %4231 to i64
  %4234 = ptrtoint i8* %4232 to i64
  %4235 = sub i64 %4233, %4234
  %4236 = trunc i64 %4235 to i32
  %4237 = sext i32 %paren.0 to i64
  %4238 = load i32** @PL_regstartp, align 8
  %4239 = getelementptr inbounds i32* %4238, i64 %4237
  store i32 %4236, i32* %4239, align 4
  %4240 = load i8** @PL_bostr, align 8
  %4241 = ptrtoint i8* %locinput.15 to i64
  %4242 = ptrtoint i8* %4240 to i64
  %4243 = sub i64 %4241, %4242
  %4244 = trunc i64 %4243 to i32
  %4245 = sext i32 %paren.0 to i64
  %4246 = load i32** @PL_regendp, align 8
  %4247 = getelementptr inbounds i32* %4246, i64 %4245
  store i32 %4244, i32* %4247, align 4
  br label %4252

; <label>:4248                                    ; preds = %4218
  %4249 = sext i32 %paren.0 to i64
  %4250 = load i32** @PL_regendp, align 8
  %4251 = getelementptr inbounds i32* %4250, i64 %4249
  store i32 -1, i32* %4251, align 4
  br label %4252

; <label>:4252                                    ; preds = %4248, %4230
  br label %4253

; <label>:4253                                    ; preds = %4252, %4216
  %4254 = call i32 (%struct.regnode*, ...)* bitcast (i32 (...)* @regmatch to i32 (%struct.regnode*, ...)*)(%struct.regnode* %next.0)
  %4255 = icmp ne i32 %4254, 0
  br i1 %4255, label %4256, label %4257

; <label>:4256                                    ; preds = %4253
  br label %5028

; <label>:4257                                    ; preds = %4253
  %4258 = icmp ne i32 %paren.0, 0
  br i1 %4258, label %4259, label %4265

; <label>:4259                                    ; preds = %4257
  %4260 = icmp ne i32 %ln.12, 0
  br i1 %4260, label %4261, label %4265

; <label>:4261                                    ; preds = %4259
  %4262 = sext i32 %paren.0 to i64
  %4263 = load i32** @PL_regendp, align 8
  %4264 = getelementptr inbounds i32* %4263, i64 %4262
  store i32 -1, i32* %4264, align 4
  br label %4265

; <label>:4265                                    ; preds = %4261, %4259, %4257
  store i8* %locinput.15, i8** @PL_reginput, align 8
  %4266 = load i32* @PL_savestack_ix, align 4
  %4267 = icmp sgt i32 %4266, %3984
  br i1 %4267, label %4268, label %4269

; <label>:4268                                    ; preds = %4265
  call void @Perl_leave_scope(i32 %3984)
  br label %4269

; <label>:4269                                    ; preds = %4268, %4265
  %4270 = icmp ne i8 %2, 0
  br i1 %4270, label %4271, label %4279

; <label>:4271                                    ; preds = %4269
  %4272 = load i8* %locinput.15, align 1
  %4273 = zext i8 %4272 to i64
  %4274 = getelementptr inbounds [0 x i8]* @PL_utf8skip, i32 0, i64 %4273
  %4275 = load i8* %4274, align 1
  %4276 = zext i8 %4275 to i32
  %4277 = sext i32 %4276 to i64
  %4278 = getelementptr inbounds i8* %locinput.15, i64 %4277
  br label %4281

; <label>:4279                                    ; preds = %4269
  %4280 = getelementptr inbounds i8* %locinput.15, i32 1
  br label %4281

; <label>:4281                                    ; preds = %4279, %4271
  %locinput.16 = phi i8* [ %4278, %4271 ], [ %4280, %4279 ]
  br label %4050

; <label>:4282                                    ; preds = %3982
  br label %4283

; <label>:4283                                    ; preds = %4479, %4282
  %locinput.17 = phi i8* [ %3983, %4282 ], [ %4477, %4479 ]
  %ln.13 = phi i32 [ %ln.10, %4282 ], [ %4476, %4479 ]
  %4284 = icmp sge i32 %n.4, %ln.13
  br i1 %4284, label %4291, label %4285

; <label>:4285                                    ; preds = %4283
  %4286 = icmp eq i32 %n.4, 32767
  br i1 %4286, label %4287, label %4289

; <label>:4287                                    ; preds = %4285
  %4288 = icmp sgt i32 %ln.13, 0
  br label %4289

; <label>:4289                                    ; preds = %4287, %4285
  %4290 = phi i1 [ false, %4285 ], [ %4288, %4287 ]
  br label %4291

; <label>:4291                                    ; preds = %4289, %4283
  %4292 = phi i1 [ true, %4283 ], [ %4290, %4289 ]
  br i1 %4292, label %4293, label %4480

; <label>:4293                                    ; preds = %4291
  %4294 = icmp ne i32 %c1.13, -1000
  br i1 %4294, label %4295, label %4412

; <label>:4295                                    ; preds = %4293
  %4296 = icmp ne i8 %2, 0
  br i1 %4296, label %4297, label %4343

; <label>:4297                                    ; preds = %4295
  %4298 = load i8** @PL_reginput, align 8
  %4299 = load volatile %struct.cop** @PL_curcop, align 8
  %4300 = getelementptr inbounds %struct.cop* %4299, i32 0, i32 14
  %4301 = load %struct.sv** %4300, align 8
  %4302 = icmp ne %struct.sv* %4301, null
  br i1 %4302, label %4303, label %4327

; <label>:4303                                    ; preds = %4297
  %4304 = load volatile %struct.cop** @PL_curcop, align 8
  %4305 = getelementptr inbounds %struct.cop* %4304, i32 0, i32 14
  %4306 = load %struct.sv** %4305, align 8
  %4307 = icmp ne %struct.sv* %4306, getelementptr inbounds (%struct.sv* null, i64 2)
  br i1 %4307, label %4308, label %4327

; <label>:4308                                    ; preds = %4303
  %4309 = load volatile %struct.cop** @PL_curcop, align 8
  %4310 = getelementptr inbounds %struct.cop* %4309, i32 0, i32 14
  %4311 = load %struct.sv** %4310, align 8
  %4312 = icmp eq %struct.sv* %4311, getelementptr inbounds (%struct.sv* null, i64 1)
  br i1 %4312, label %4339, label %4313

; <label>:4313                                    ; preds = %4308
  %4314 = load volatile %struct.cop** @PL_curcop, align 8
  %4315 = getelementptr inbounds %struct.cop* %4314, i32 0, i32 14
  %4316 = load %struct.sv** %4315, align 8
  %4317 = getelementptr inbounds %struct.sv* %4316, i32 0, i32 0
  %4318 = load i8** %4317, align 8
  %4319 = bitcast i8* %4318 to %struct.xpv*
  %4320 = getelementptr inbounds %struct.xpv* %4319, i32 0, i32 0
  %4321 = load i8** %4320, align 8
  %4322 = getelementptr inbounds i8* %4321, i64 11
  %4323 = load i8* %4322, align 1
  %4324 = sext i8 %4323 to i32
  %4325 = and i32 %4324, 1
  %4326 = icmp ne i32 %4325, 0
  br i1 %4326, label %4339, label %4327

; <label>:4327                                    ; preds = %4313, %4303, %4297
  %4328 = load volatile %struct.cop** @PL_curcop, align 8
  %4329 = getelementptr inbounds %struct.cop* %4328, i32 0, i32 14
  %4330 = load %struct.sv** %4329, align 8
  %4331 = icmp eq %struct.sv* %4330, null
  br i1 %4331, label %4332, label %4337

; <label>:4332                                    ; preds = %4327
  %4333 = load i8* @PL_dowarn, align 1
  %4334 = zext i8 %4333 to i32
  %4335 = and i32 %4334, 1
  %4336 = icmp ne i32 %4335, 0
  br label %4337

; <label>:4337                                    ; preds = %4332, %4327
  %4338 = phi i1 [ false, %4327 ], [ %4336, %4332 ]
  br label %4339

; <label>:4339                                    ; preds = %4337, %4313, %4308
  %4340 = phi i1 [ true, %4313 ], [ true, %4308 ], [ %4338, %4337 ]
  %4341 = select i1 %4340, i32 0, i32 255
  %4342 = call i64 @Perl_utf8n_to_uvuni(i8* %4298, i64 13, i64* null, i32 %4341)
  br label %4348

; <label>:4343                                    ; preds = %4295
  %4344 = load i8** @PL_reginput, align 8
  %4345 = load i8* %4344, align 1
  %4346 = zext i8 %4345 to i32
  %4347 = sext i32 %4346 to i64
  br label %4348

; <label>:4348                                    ; preds = %4343, %4339
  %c21.0 = phi i64 [ %4342, %4339 ], [ %4347, %4343 ]
  %4349 = sext i32 %c1.13 to i64
  %4350 = icmp eq i64 %c21.0, %4349
  br i1 %4350, label %4354, label %4351

; <label>:4351                                    ; preds = %4348
  %4352 = sext i32 %c2.19 to i64
  %4353 = icmp eq i64 %c21.0, %4352
  br i1 %4353, label %4354, label %4411

; <label>:4354                                    ; preds = %4351, %4348
  %4355 = icmp ne i32 %paren.0, 0
  br i1 %4355, label %4356, label %4394

; <label>:4356                                    ; preds = %4354
  %4357 = icmp ne i32 %ln.13, 0
  br i1 %4357, label %4358, label %4389

; <label>:4358                                    ; preds = %4356
  %4359 = load i8* @PL_reg_match_utf8, align 1
  %4360 = sext i8 %4359 to i32
  %4361 = icmp ne i32 %4360, 0
  br i1 %4361, label %4362, label %4367

; <label>:4362                                    ; preds = %4358
  %4363 = load i8** @PL_reginput, align 8
  %4364 = call i32 (i8*, i32, ...)* bitcast (i32 (...)* @reghop to i32 (i8*, i32, ...)*)(i8* %4363, i32 -1)
  %4365 = sext i32 %4364 to i64
  %4366 = inttoptr i64 %4365 to i8*
  br label %4370

; <label>:4367                                    ; preds = %4358
  %4368 = load i8** @PL_reginput, align 8
  %4369 = getelementptr inbounds i8* %4368, i64 -1
  br label %4370

; <label>:4370                                    ; preds = %4367, %4362
  %4371 = phi i8* [ %4366, %4362 ], [ %4369, %4367 ]
  %4372 = load i8** @PL_bostr, align 8
  %4373 = ptrtoint i8* %4371 to i64
  %4374 = ptrtoint i8* %4372 to i64
  %4375 = sub i64 %4373, %4374
  %4376 = trunc i64 %4375 to i32
  %4377 = sext i32 %paren.0 to i64
  %4378 = load i32** @PL_regstartp, align 8
  %4379 = getelementptr inbounds i32* %4378, i64 %4377
  store i32 %4376, i32* %4379, align 4
  %4380 = load i8** @PL_reginput, align 8
  %4381 = load i8** @PL_bostr, align 8
  %4382 = ptrtoint i8* %4380 to i64
  %4383 = ptrtoint i8* %4381 to i64
  %4384 = sub i64 %4382, %4383
  %4385 = trunc i64 %4384 to i32
  %4386 = sext i32 %paren.0 to i64
  %4387 = load i32** @PL_regendp, align 8
  %4388 = getelementptr inbounds i32* %4387, i64 %4386
  store i32 %4385, i32* %4388, align 4
  br label %4393

; <label>:4389                                    ; preds = %4356
  %4390 = sext i32 %paren.0 to i64
  %4391 = load i32** @PL_regendp, align 8
  %4392 = getelementptr inbounds i32* %4391, i64 %4390
  store i32 -1, i32* %4392, align 4
  br label %4393

; <label>:4393                                    ; preds = %4389, %4370
  br label %4394

; <label>:4394                                    ; preds = %4393, %4354
  %4395 = call i32 (%struct.regnode*, ...)* bitcast (i32 (...)* @regmatch to i32 (%struct.regnode*, ...)*)(%struct.regnode* %next.0)
  %4396 = icmp ne i32 %4395, 0
  br i1 %4396, label %4397, label %4398

; <label>:4397                                    ; preds = %4394
  br label %5028

; <label>:4398                                    ; preds = %4394
  %4399 = icmp ne i32 %paren.0, 0
  br i1 %4399, label %4400, label %4406

; <label>:4400                                    ; preds = %4398
  %4401 = icmp ne i32 %ln.13, 0
  br i1 %4401, label %4402, label %4406

; <label>:4402                                    ; preds = %4400
  %4403 = sext i32 %paren.0 to i64
  %4404 = load i32** @PL_regendp, align 8
  %4405 = getelementptr inbounds i32* %4404, i64 %4403
  store i32 -1, i32* %4405, align 4
  br label %4406

; <label>:4406                                    ; preds = %4402, %4400, %4398
  %4407 = load i32* @PL_savestack_ix, align 4
  %4408 = icmp sgt i32 %4407, %3984
  br i1 %4408, label %4409, label %4410

; <label>:4409                                    ; preds = %4406
  call void @Perl_leave_scope(i32 %3984)
  br label %4410

; <label>:4410                                    ; preds = %4409, %4406
  br label %4411

; <label>:4411                                    ; preds = %4410, %4351
  br label %4472

; <label>:4412                                    ; preds = %4293
  %4413 = icmp eq i32 %c1.13, -1000
  br i1 %4413, label %4414, label %4471

; <label>:4414                                    ; preds = %4412
  %4415 = icmp ne i32 %paren.0, 0
  br i1 %4415, label %4416, label %4454

; <label>:4416                                    ; preds = %4414
  %4417 = icmp ne i32 %ln.13, 0
  br i1 %4417, label %4418, label %4449

; <label>:4418                                    ; preds = %4416
  %4419 = load i8* @PL_reg_match_utf8, align 1
  %4420 = sext i8 %4419 to i32
  %4421 = icmp ne i32 %4420, 0
  br i1 %4421, label %4422, label %4427

; <label>:4422                                    ; preds = %4418
  %4423 = load i8** @PL_reginput, align 8
  %4424 = call i32 (i8*, i32, ...)* bitcast (i32 (...)* @reghop to i32 (i8*, i32, ...)*)(i8* %4423, i32 -1)
  %4425 = sext i32 %4424 to i64
  %4426 = inttoptr i64 %4425 to i8*
  br label %4430

; <label>:4427                                    ; preds = %4418
  %4428 = load i8** @PL_reginput, align 8
  %4429 = getelementptr inbounds i8* %4428, i64 -1
  br label %4430

; <label>:4430                                    ; preds = %4427, %4422
  %4431 = phi i8* [ %4426, %4422 ], [ %4429, %4427 ]
  %4432 = load i8** @PL_bostr, align 8
  %4433 = ptrtoint i8* %4431 to i64
  %4434 = ptrtoint i8* %4432 to i64
  %4435 = sub i64 %4433, %4434
  %4436 = trunc i64 %4435 to i32
  %4437 = sext i32 %paren.0 to i64
  %4438 = load i32** @PL_regstartp, align 8
  %4439 = getelementptr inbounds i32* %4438, i64 %4437
  store i32 %4436, i32* %4439, align 4
  %4440 = load i8** @PL_reginput, align 8
  %4441 = load i8** @PL_bostr, align 8
  %4442 = ptrtoint i8* %4440 to i64
  %4443 = ptrtoint i8* %4441 to i64
  %4444 = sub i64 %4442, %4443
  %4445 = trunc i64 %4444 to i32
  %4446 = sext i32 %paren.0 to i64
  %4447 = load i32** @PL_regendp, align 8
  %4448 = getelementptr inbounds i32* %4447, i64 %4446
  store i32 %4445, i32* %4448, align 4
  br label %4453

; <label>:4449                                    ; preds = %4416
  %4450 = sext i32 %paren.0 to i64
  %4451 = load i32** @PL_regendp, align 8
  %4452 = getelementptr inbounds i32* %4451, i64 %4450
  store i32 -1, i32* %4452, align 4
  br label %4453

; <label>:4453                                    ; preds = %4449, %4430
  br label %4454

; <label>:4454                                    ; preds = %4453, %4414
  %4455 = call i32 (%struct.regnode*, ...)* bitcast (i32 (...)* @regmatch to i32 (%struct.regnode*, ...)*)(%struct.regnode* %next.0)
  %4456 = icmp ne i32 %4455, 0
  br i1 %4456, label %4457, label %4458

; <label>:4457                                    ; preds = %4454
  br label %5028

; <label>:4458                                    ; preds = %4454
  %4459 = icmp ne i32 %paren.0, 0
  br i1 %4459, label %4460, label %4466

; <label>:4460                                    ; preds = %4458
  %4461 = icmp ne i32 %ln.13, 0
  br i1 %4461, label %4462, label %4466

; <label>:4462                                    ; preds = %4460
  %4463 = sext i32 %paren.0 to i64
  %4464 = load i32** @PL_regendp, align 8
  %4465 = getelementptr inbounds i32* %4464, i64 %4463
  store i32 -1, i32* %4465, align 4
  br label %4466

; <label>:4466                                    ; preds = %4462, %4460, %4458
  %4467 = load i32* @PL_savestack_ix, align 4
  %4468 = icmp sgt i32 %4467, %3984
  br i1 %4468, label %4469, label %4470

; <label>:4469                                    ; preds = %4466
  call void @Perl_leave_scope(i32 %3984)
  br label %4470

; <label>:4470                                    ; preds = %4469, %4466
  br label %4471

; <label>:4471                                    ; preds = %4470, %4412
  br label %4472

; <label>:4472                                    ; preds = %4471, %4411
  store i8* %locinput.17, i8** @PL_reginput, align 8
  %4473 = call i32 (%struct.regnode*, i32, ...)* bitcast (i32 (...)* @regrepeat to i32 (%struct.regnode*, i32, ...)*)(%struct.regnode* %scan.2, i32 1)
  %4474 = icmp ne i32 %4473, 0
  br i1 %4474, label %4475, label %4478

; <label>:4475                                    ; preds = %4472
  %4476 = add nsw i32 %ln.13, 1
  %4477 = load i8** @PL_reginput, align 8
  br label %4479

; <label>:4478                                    ; preds = %4472
  br label %5029

; <label>:4479                                    ; preds = %4475
  br label %4283

; <label>:4480                                    ; preds = %4291
  br label %4481

; <label>:4481                                    ; preds = %4480
  br label %4806

; <label>:4482                                    ; preds = %3974
  %4483 = call i32 (%struct.regnode*, i32, ...)* bitcast (i32 (...)* @regrepeat to i32 (%struct.regnode*, i32, ...)*)(%struct.regnode* %scan.2, i32 %n.4)
  %4484 = load i8** @PL_reginput, align 8
  %4485 = icmp slt i32 %ln.10, %4483
  br i1 %4485, label %4486, label %4526

; <label>:4486                                    ; preds = %4482
  %4487 = getelementptr inbounds %struct.regnode* %next.0, i32 0, i32 1
  %4488 = load i8* %4487, align 1
  %4489 = zext i8 %4488 to i64
  %4490 = getelementptr inbounds [0 x i8]* @PL_regkind, i32 0, i64 %4489
  %4491 = load i8* %4490, align 1
  %4492 = zext i8 %4491 to i32
  %4493 = icmp eq i32 %4492, 6
  br i1 %4493, label %4494, label %4526

; <label>:4494                                    ; preds = %4486
  %4495 = load i32* @PL_multiline, align 4
  %4496 = icmp ne i32 %4495, 0
  br i1 %4496, label %4502, label %4497

; <label>:4497                                    ; preds = %4494
  %4498 = getelementptr inbounds %struct.regnode* %next.0, i32 0, i32 1
  %4499 = load i8* %4498, align 1
  %4500 = zext i8 %4499 to i32
  %4501 = icmp ne i32 %4500, 7
  br i1 %4501, label %4512, label %4502

; <label>:4502                                    ; preds = %4497, %4494
  %4503 = getelementptr inbounds %struct.regnode* %next.0, i32 0, i32 1
  %4504 = load i8* %4503, align 1
  %4505 = zext i8 %4504 to i32
  %4506 = icmp eq i32 %4505, 8
  br i1 %4506, label %4512, label %4507

; <label>:4507                                    ; preds = %4502
  %4508 = getelementptr inbounds %struct.regnode* %next.0, i32 0, i32 1
  %4509 = load i8* %4508, align 1
  %4510 = zext i8 %4509 to i32
  %4511 = icmp eq i32 %4510, 5
  br i1 %4511, label %4512, label %4526

; <label>:4512                                    ; preds = %4507, %4502, %4497
  %4513 = load i8** @PL_reginput, align 8
  %4514 = getelementptr inbounds i8* %4513, i64 -1
  %4515 = load i8* %4514, align 1
  %4516 = zext i8 %4515 to i32
  %4517 = icmp eq i32 %4516, 10
  br i1 %4517, label %4518, label %4525

; <label>:4518                                    ; preds = %4512
  %4519 = getelementptr inbounds %struct.regnode* %next.0, i32 0, i32 1
  %4520 = load i8* %4519, align 1
  %4521 = zext i8 %4520 to i32
  %4522 = icmp ne i32 %4521, 5
  br i1 %4522, label %4523, label %4525

; <label>:4523                                    ; preds = %4518
  %4524 = add nsw i32 %4483, -1
  br label %4525

; <label>:4525                                    ; preds = %4523, %4518, %4512
  %ln.14 = phi i32 [ %4524, %4523 ], [ %4483, %4518 ], [ %4483, %4512 ]
  br label %4526

; <label>:4526                                    ; preds = %4525, %4507, %4486, %4482
  %ln.15 = phi i32 [ %ln.14, %4525 ], [ %ln.10, %4507 ], [ %ln.10, %4486 ], [ %ln.10, %4482 ]
  %4527 = load i32* @PL_savestack_ix, align 4
  %4528 = icmp ne i32 %paren.0, 0
  br i1 %4528, label %4529, label %4667

; <label>:4529                                    ; preds = %4526
  br label %4530

; <label>:4530                                    ; preds = %4664, %4529
  %c23.0 = phi i64 [ 0, %4529 ], [ %c23.2, %4664 ]
  %locinput.18 = phi i8* [ %4484, %4529 ], [ %4665, %4664 ]
  %n.5 = phi i32 [ %4483, %4529 ], [ %4654, %4664 ]
  %4531 = icmp sge i32 %n.5, %ln.15
  br i1 %4531, label %4532, label %4666

; <label>:4532                                    ; preds = %4530
  %4533 = icmp ne i32 %c1.13, -1000
  br i1 %4533, label %4534, label %4588

; <label>:4534                                    ; preds = %4532
  %4535 = icmp ne i8 %2, 0
  br i1 %4535, label %4536, label %4582

; <label>:4536                                    ; preds = %4534
  %4537 = load i8** @PL_reginput, align 8
  %4538 = load volatile %struct.cop** @PL_curcop, align 8
  %4539 = getelementptr inbounds %struct.cop* %4538, i32 0, i32 14
  %4540 = load %struct.sv** %4539, align 8
  %4541 = icmp ne %struct.sv* %4540, null
  br i1 %4541, label %4542, label %4566

; <label>:4542                                    ; preds = %4536
  %4543 = load volatile %struct.cop** @PL_curcop, align 8
  %4544 = getelementptr inbounds %struct.cop* %4543, i32 0, i32 14
  %4545 = load %struct.sv** %4544, align 8
  %4546 = icmp ne %struct.sv* %4545, getelementptr inbounds (%struct.sv* null, i64 2)
  br i1 %4546, label %4547, label %4566

; <label>:4547                                    ; preds = %4542
  %4548 = load volatile %struct.cop** @PL_curcop, align 8
  %4549 = getelementptr inbounds %struct.cop* %4548, i32 0, i32 14
  %4550 = load %struct.sv** %4549, align 8
  %4551 = icmp eq %struct.sv* %4550, getelementptr inbounds (%struct.sv* null, i64 1)
  br i1 %4551, label %4578, label %4552

; <label>:4552                                    ; preds = %4547
  %4553 = load volatile %struct.cop** @PL_curcop, align 8
  %4554 = getelementptr inbounds %struct.cop* %4553, i32 0, i32 14
  %4555 = load %struct.sv** %4554, align 8
  %4556 = getelementptr inbounds %struct.sv* %4555, i32 0, i32 0
  %4557 = load i8** %4556, align 8
  %4558 = bitcast i8* %4557 to %struct.xpv*
  %4559 = getelementptr inbounds %struct.xpv* %4558, i32 0, i32 0
  %4560 = load i8** %4559, align 8
  %4561 = getelementptr inbounds i8* %4560, i64 11
  %4562 = load i8* %4561, align 1
  %4563 = sext i8 %4562 to i32
  %4564 = and i32 %4563, 1
  %4565 = icmp ne i32 %4564, 0
  br i1 %4565, label %4578, label %4566

; <label>:4566                                    ; preds = %4552, %4542, %4536
  %4567 = load volatile %struct.cop** @PL_curcop, align 8
  %4568 = getelementptr inbounds %struct.cop* %4567, i32 0, i32 14
  %4569 = load %struct.sv** %4568, align 8
  %4570 = icmp eq %struct.sv* %4569, null
  br i1 %4570, label %4571, label %4576

; <label>:4571                                    ; preds = %4566
  %4572 = load i8* @PL_dowarn, align 1
  %4573 = zext i8 %4572 to i32
  %4574 = and i32 %4573, 1
  %4575 = icmp ne i32 %4574, 0
  br label %4576

; <label>:4576                                    ; preds = %4571, %4566
  %4577 = phi i1 [ false, %4566 ], [ %4575, %4571 ]
  br label %4578

; <label>:4578                                    ; preds = %4576, %4552, %4547
  %4579 = phi i1 [ true, %4552 ], [ true, %4547 ], [ %4577, %4576 ]
  %4580 = select i1 %4579, i32 0, i32 255
  %4581 = call i64 @Perl_utf8n_to_uvuni(i8* %4537, i64 13, i64* null, i32 %4580)
  br label %4587

; <label>:4582                                    ; preds = %4534
  %4583 = load i8** @PL_reginput, align 8
  %4584 = load i8* %4583, align 1
  %4585 = zext i8 %4584 to i32
  %4586 = sext i32 %4585 to i64
  br label %4587

; <label>:4587                                    ; preds = %4582, %4578
  %c23.1 = phi i64 [ %4581, %4578 ], [ %4586, %4582 ]
  br label %4588

; <label>:4588                                    ; preds = %4587, %4532
  %c23.2 = phi i64 [ %c23.1, %4587 ], [ %c23.0, %4532 ]
  %4589 = icmp eq i32 %c1.13, -1000
  br i1 %4589, label %4596, label %4590

; <label>:4590                                    ; preds = %4588
  %4591 = sext i32 %c1.13 to i64
  %4592 = icmp eq i64 %c23.2, %4591
  br i1 %4592, label %4596, label %4593

; <label>:4593                                    ; preds = %4590
  %4594 = sext i32 %c2.19 to i64
  %4595 = icmp eq i64 %c23.2, %4594
  br i1 %4595, label %4596, label %4653

; <label>:4596                                    ; preds = %4593, %4590, %4588
  %4597 = icmp ne i32 %paren.0, 0
  br i1 %4597, label %4598, label %4636

; <label>:4598                                    ; preds = %4596
  %4599 = icmp ne i32 %n.5, 0
  br i1 %4599, label %4600, label %4631

; <label>:4600                                    ; preds = %4598
  %4601 = load i8* @PL_reg_match_utf8, align 1
  %4602 = sext i8 %4601 to i32
  %4603 = icmp ne i32 %4602, 0
  br i1 %4603, label %4604, label %4609

; <label>:4604                                    ; preds = %4600
  %4605 = load i8** @PL_reginput, align 8
  %4606 = call i32 (i8*, i32, ...)* bitcast (i32 (...)* @reghop to i32 (i8*, i32, ...)*)(i8* %4605, i32 -1)
  %4607 = sext i32 %4606 to i64
  %4608 = inttoptr i64 %4607 to i8*
  br label %4612

; <label>:4609                                    ; preds = %4600
  %4610 = load i8** @PL_reginput, align 8
  %4611 = getelementptr inbounds i8* %4610, i64 -1
  br label %4612

; <label>:4612                                    ; preds = %4609, %4604
  %4613 = phi i8* [ %4608, %4604 ], [ %4611, %4609 ]
  %4614 = load i8** @PL_bostr, align 8
  %4615 = ptrtoint i8* %4613 to i64
  %4616 = ptrtoint i8* %4614 to i64
  %4617 = sub i64 %4615, %4616
  %4618 = trunc i64 %4617 to i32
  %4619 = sext i32 %paren.0 to i64
  %4620 = load i32** @PL_regstartp, align 8
  %4621 = getelementptr inbounds i32* %4620, i64 %4619
  store i32 %4618, i32* %4621, align 4
  %4622 = load i8** @PL_reginput, align 8
  %4623 = load i8** @PL_bostr, align 8
  %4624 = ptrtoint i8* %4622 to i64
  %4625 = ptrtoint i8* %4623 to i64
  %4626 = sub i64 %4624, %4625
  %4627 = trunc i64 %4626 to i32
  %4628 = sext i32 %paren.0 to i64
  %4629 = load i32** @PL_regendp, align 8
  %4630 = getelementptr inbounds i32* %4629, i64 %4628
  store i32 %4627, i32* %4630, align 4
  br label %4635

; <label>:4631                                    ; preds = %4598
  %4632 = sext i32 %paren.0 to i64
  %4633 = load i32** @PL_regendp, align 8
  %4634 = getelementptr inbounds i32* %4633, i64 %4632
  store i32 -1, i32* %4634, align 4
  br label %4635

; <label>:4635                                    ; preds = %4631, %4612
  br label %4636

; <label>:4636                                    ; preds = %4635, %4596
  %4637 = call i32 (%struct.regnode*, ...)* bitcast (i32 (...)* @regmatch to i32 (%struct.regnode*, ...)*)(%struct.regnode* %next.0)
  %4638 = icmp ne i32 %4637, 0
  br i1 %4638, label %4639, label %4640

; <label>:4639                                    ; preds = %4636
  br label %5028

; <label>:4640                                    ; preds = %4636
  %4641 = icmp ne i32 %paren.0, 0
  br i1 %4641, label %4642, label %4648

; <label>:4642                                    ; preds = %4640
  %4643 = icmp ne i32 %n.5, 0
  br i1 %4643, label %4644, label %4648

; <label>:4644                                    ; preds = %4642
  %4645 = sext i32 %paren.0 to i64
  %4646 = load i32** @PL_regendp, align 8
  %4647 = getelementptr inbounds i32* %4646, i64 %4645
  store i32 -1, i32* %4647, align 4
  br label %4648

; <label>:4648                                    ; preds = %4644, %4642, %4640
  %4649 = load i32* @PL_savestack_ix, align 4
  %4650 = icmp sgt i32 %4649, %4527
  br i1 %4650, label %4651, label %4652

; <label>:4651                                    ; preds = %4648
  call void @Perl_leave_scope(i32 %4527)
  br label %4652

; <label>:4652                                    ; preds = %4651, %4648
  br label %4653

; <label>:4653                                    ; preds = %4652, %4593
  %4654 = add nsw i32 %n.5, -1
  %4655 = load i8* @PL_reg_match_utf8, align 1
  %4656 = sext i8 %4655 to i32
  %4657 = icmp ne i32 %4656, 0
  br i1 %4657, label %4658, label %4662

; <label>:4658                                    ; preds = %4653
  %4659 = call i32 (i8*, i32, ...)* bitcast (i32 (...)* @reghop to i32 (i8*, i32, ...)*)(i8* %locinput.18, i32 -1)
  %4660 = sext i32 %4659 to i64
  %4661 = inttoptr i64 %4660 to i8*
  br label %4664

; <label>:4662                                    ; preds = %4653
  %4663 = getelementptr inbounds i8* %locinput.18, i64 -1
  br label %4664

; <label>:4664                                    ; preds = %4662, %4658
  %4665 = phi i8* [ %4661, %4658 ], [ %4663, %4662 ]
  store i8* %4665, i8** @PL_reginput, align 8
  br label %4530

; <label>:4666                                    ; preds = %4530
  br label %4805

; <label>:4667                                    ; preds = %4526
  br label %4668

; <label>:4668                                    ; preds = %4802, %4667
  %locinput.19 = phi i8* [ %4484, %4667 ], [ %4803, %4802 ]
  %n.6 = phi i32 [ %4483, %4667 ], [ %4792, %4802 ]
  %c24.0 = phi i64 [ 0, %4667 ], [ %c24.2, %4802 ]
  %4669 = icmp sge i32 %n.6, %ln.15
  br i1 %4669, label %4670, label %4804

; <label>:4670                                    ; preds = %4668
  %4671 = icmp ne i32 %c1.13, -1000
  br i1 %4671, label %4672, label %4726

; <label>:4672                                    ; preds = %4670
  %4673 = icmp ne i8 %2, 0
  br i1 %4673, label %4674, label %4720

; <label>:4674                                    ; preds = %4672
  %4675 = load i8** @PL_reginput, align 8
  %4676 = load volatile %struct.cop** @PL_curcop, align 8
  %4677 = getelementptr inbounds %struct.cop* %4676, i32 0, i32 14
  %4678 = load %struct.sv** %4677, align 8
  %4679 = icmp ne %struct.sv* %4678, null
  br i1 %4679, label %4680, label %4704

; <label>:4680                                    ; preds = %4674
  %4681 = load volatile %struct.cop** @PL_curcop, align 8
  %4682 = getelementptr inbounds %struct.cop* %4681, i32 0, i32 14
  %4683 = load %struct.sv** %4682, align 8
  %4684 = icmp ne %struct.sv* %4683, getelementptr inbounds (%struct.sv* null, i64 2)
  br i1 %4684, label %4685, label %4704

; <label>:4685                                    ; preds = %4680
  %4686 = load volatile %struct.cop** @PL_curcop, align 8
  %4687 = getelementptr inbounds %struct.cop* %4686, i32 0, i32 14
  %4688 = load %struct.sv** %4687, align 8
  %4689 = icmp eq %struct.sv* %4688, getelementptr inbounds (%struct.sv* null, i64 1)
  br i1 %4689, label %4716, label %4690

; <label>:4690                                    ; preds = %4685
  %4691 = load volatile %struct.cop** @PL_curcop, align 8
  %4692 = getelementptr inbounds %struct.cop* %4691, i32 0, i32 14
  %4693 = load %struct.sv** %4692, align 8
  %4694 = getelementptr inbounds %struct.sv* %4693, i32 0, i32 0
  %4695 = load i8** %4694, align 8
  %4696 = bitcast i8* %4695 to %struct.xpv*
  %4697 = getelementptr inbounds %struct.xpv* %4696, i32 0, i32 0
  %4698 = load i8** %4697, align 8
  %4699 = getelementptr inbounds i8* %4698, i64 11
  %4700 = load i8* %4699, align 1
  %4701 = sext i8 %4700 to i32
  %4702 = and i32 %4701, 1
  %4703 = icmp ne i32 %4702, 0
  br i1 %4703, label %4716, label %4704

; <label>:4704                                    ; preds = %4690, %4680, %4674
  %4705 = load volatile %struct.cop** @PL_curcop, align 8
  %4706 = getelementptr inbounds %struct.cop* %4705, i32 0, i32 14
  %4707 = load %struct.sv** %4706, align 8
  %4708 = icmp eq %struct.sv* %4707, null
  br i1 %4708, label %4709, label %4714

; <label>:4709                                    ; preds = %4704
  %4710 = load i8* @PL_dowarn, align 1
  %4711 = zext i8 %4710 to i32
  %4712 = and i32 %4711, 1
  %4713 = icmp ne i32 %4712, 0
  br label %4714

; <label>:4714                                    ; preds = %4709, %4704
  %4715 = phi i1 [ false, %4704 ], [ %4713, %4709 ]
  br label %4716

; <label>:4716                                    ; preds = %4714, %4690, %4685
  %4717 = phi i1 [ true, %4690 ], [ true, %4685 ], [ %4715, %4714 ]
  %4718 = select i1 %4717, i32 0, i32 255
  %4719 = call i64 @Perl_utf8n_to_uvuni(i8* %4675, i64 13, i64* null, i32 %4718)
  br label %4725

; <label>:4720                                    ; preds = %4672
  %4721 = load i8** @PL_reginput, align 8
  %4722 = load i8* %4721, align 1
  %4723 = zext i8 %4722 to i32
  %4724 = sext i32 %4723 to i64
  br label %4725

; <label>:4725                                    ; preds = %4720, %4716
  %c24.1 = phi i64 [ %4719, %4716 ], [ %4724, %4720 ]
  br label %4726

; <label>:4726                                    ; preds = %4725, %4670
  %c24.2 = phi i64 [ %c24.1, %4725 ], [ %c24.0, %4670 ]
  %4727 = icmp eq i32 %c1.13, -1000
  br i1 %4727, label %4734, label %4728

; <label>:4728                                    ; preds = %4726
  %4729 = sext i32 %c1.13 to i64
  %4730 = icmp eq i64 %c24.2, %4729
  br i1 %4730, label %4734, label %4731

; <label>:4731                                    ; preds = %4728
  %4732 = sext i32 %c2.19 to i64
  %4733 = icmp eq i64 %c24.2, %4732
  br i1 %4733, label %4734, label %4791

; <label>:4734                                    ; preds = %4731, %4728, %4726
  %4735 = icmp ne i32 %paren.0, 0
  br i1 %4735, label %4736, label %4774

; <label>:4736                                    ; preds = %4734
  %4737 = icmp ne i32 %n.6, 0
  br i1 %4737, label %4738, label %4769

; <label>:4738                                    ; preds = %4736
  %4739 = load i8* @PL_reg_match_utf8, align 1
  %4740 = sext i8 %4739 to i32
  %4741 = icmp ne i32 %4740, 0
  br i1 %4741, label %4742, label %4747

; <label>:4742                                    ; preds = %4738
  %4743 = load i8** @PL_reginput, align 8
  %4744 = call i32 (i8*, i32, ...)* bitcast (i32 (...)* @reghop to i32 (i8*, i32, ...)*)(i8* %4743, i32 -1)
  %4745 = sext i32 %4744 to i64
  %4746 = inttoptr i64 %4745 to i8*
  br label %4750

; <label>:4747                                    ; preds = %4738
  %4748 = load i8** @PL_reginput, align 8
  %4749 = getelementptr inbounds i8* %4748, i64 -1
  br label %4750

; <label>:4750                                    ; preds = %4747, %4742
  %4751 = phi i8* [ %4746, %4742 ], [ %4749, %4747 ]
  %4752 = load i8** @PL_bostr, align 8
  %4753 = ptrtoint i8* %4751 to i64
  %4754 = ptrtoint i8* %4752 to i64
  %4755 = sub i64 %4753, %4754
  %4756 = trunc i64 %4755 to i32
  %4757 = sext i32 %paren.0 to i64
  %4758 = load i32** @PL_regstartp, align 8
  %4759 = getelementptr inbounds i32* %4758, i64 %4757
  store i32 %4756, i32* %4759, align 4
  %4760 = load i8** @PL_reginput, align 8
  %4761 = load i8** @PL_bostr, align 8
  %4762 = ptrtoint i8* %4760 to i64
  %4763 = ptrtoint i8* %4761 to i64
  %4764 = sub i64 %4762, %4763
  %4765 = trunc i64 %4764 to i32
  %4766 = sext i32 %paren.0 to i64
  %4767 = load i32** @PL_regendp, align 8
  %4768 = getelementptr inbounds i32* %4767, i64 %4766
  store i32 %4765, i32* %4768, align 4
  br label %4773

; <label>:4769                                    ; preds = %4736
  %4770 = sext i32 %paren.0 to i64
  %4771 = load i32** @PL_regendp, align 8
  %4772 = getelementptr inbounds i32* %4771, i64 %4770
  store i32 -1, i32* %4772, align 4
  br label %4773

; <label>:4773                                    ; preds = %4769, %4750
  br label %4774

; <label>:4774                                    ; preds = %4773, %4734
  %4775 = call i32 (%struct.regnode*, ...)* bitcast (i32 (...)* @regmatch to i32 (%struct.regnode*, ...)*)(%struct.regnode* %next.0)
  %4776 = icmp ne i32 %4775, 0
  br i1 %4776, label %4777, label %4778

; <label>:4777                                    ; preds = %4774
  br label %5028

; <label>:4778                                    ; preds = %4774
  %4779 = icmp ne i32 %paren.0, 0
  br i1 %4779, label %4780, label %4786

; <label>:4780                                    ; preds = %4778
  %4781 = icmp ne i32 %n.6, 0
  br i1 %4781, label %4782, label %4786

; <label>:4782                                    ; preds = %4780
  %4783 = sext i32 %paren.0 to i64
  %4784 = load i32** @PL_regendp, align 8
  %4785 = getelementptr inbounds i32* %4784, i64 %4783
  store i32 -1, i32* %4785, align 4
  br label %4786

; <label>:4786                                    ; preds = %4782, %4780, %4778
  %4787 = load i32* @PL_savestack_ix, align 4
  %4788 = icmp sgt i32 %4787, %4527
  br i1 %4788, label %4789, label %4790

; <label>:4789                                    ; preds = %4786
  call void @Perl_leave_scope(i32 %4527)
  br label %4790

; <label>:4790                                    ; preds = %4789, %4786
  br label %4791

; <label>:4791                                    ; preds = %4790, %4731
  %4792 = add nsw i32 %n.6, -1
  %4793 = load i8* @PL_reg_match_utf8, align 1
  %4794 = sext i8 %4793 to i32
  %4795 = icmp ne i32 %4794, 0
  br i1 %4795, label %4796, label %4800

; <label>:4796                                    ; preds = %4791
  %4797 = call i32 (i8*, i32, ...)* bitcast (i32 (...)* @reghop to i32 (i8*, i32, ...)*)(i8* %locinput.19, i32 -1)
  %4798 = sext i32 %4797 to i64
  %4799 = inttoptr i64 %4798 to i8*
  br label %4802

; <label>:4800                                    ; preds = %4791
  %4801 = getelementptr inbounds i8* %locinput.19, i64 -1
  br label %4802

; <label>:4802                                    ; preds = %4800, %4796
  %4803 = phi i8* [ %4799, %4796 ], [ %4801, %4800 ]
  store i8* %4803, i8** @PL_reginput, align 8
  br label %4668

; <label>:4804                                    ; preds = %4668
  br label %4805

; <label>:4805                                    ; preds = %4804, %4666
  br label %4806

; <label>:4806                                    ; preds = %4805, %4481
  %minmod.2 = phi i32 [ 0, %4481 ], [ %minmod.0, %4805 ]
  %ln.16 = phi i32 [ %ln.13, %4481 ], [ %ln.15, %4805 ]
  br label %5029

; <label>:4807                                    ; preds = %15
  %4808 = load %struct.re_cc_state** @PL_reg_call_cc, align 8
  %4809 = icmp ne %struct.re_cc_state* %4808, null
  br i1 %4809, label %4810, label %4846

; <label>:4810                                    ; preds = %4807
  %4811 = load %struct.re_cc_state** @PL_reg_call_cc, align 8
  %4812 = load %struct.curcur** @PL_regcc, align 8
  %4813 = load %struct.regexp** @PL_reg_re, align 8
  %4814 = call i32 (i32, ...)* bitcast (i32 (...)* @regcppush to i32 (i32, ...)*)(i32 0)
  %4815 = load i32* @PL_savestack_ix, align 4
  %4816 = load %struct.re_cc_state** @PL_reg_call_cc, align 8
  %4817 = getelementptr inbounds %struct.re_cc_state* %4816, i32 0, i32 0
  %4818 = load i32* %4817, align 4
  %4819 = call i32 (i32, ...)* bitcast (i32 (...)* @regcp_set_to to i32 (i32, ...)*)(i32 %4818)
  store i8* %locinput.0, i8** @PL_reginput, align 8
  %4820 = load %struct.re_cc_state** @PL_reg_call_cc, align 8
  %4821 = getelementptr inbounds %struct.re_cc_state* %4820, i32 0, i32 4
  %4822 = load %struct.regexp** %4821, align 8
  %4823 = call i32 (%struct.regexp*, ...)* bitcast (i32 (...)* @cache_re to i32 (%struct.regexp*, ...)*)(%struct.regexp* %4822)
  %4824 = load %struct.re_cc_state** @PL_reg_call_cc, align 8
  %4825 = getelementptr inbounds %struct.re_cc_state* %4824, i32 0, i32 3
  %4826 = load %struct.curcur** %4825, align 8
  store %struct.curcur* %4826, %struct.curcur** @PL_regcc, align 8
  %4827 = load %struct.re_cc_state** @PL_reg_call_cc, align 8
  %4828 = getelementptr inbounds %struct.re_cc_state* %4827, i32 0, i32 2
  %4829 = load %struct.re_cc_state** %4828, align 8
  store %struct.re_cc_state* %4829, %struct.re_cc_state** @PL_reg_call_cc, align 8
  %4830 = getelementptr inbounds %struct.re_cc_state* %4811, i32 0, i32 1
  %4831 = load %struct.regnode** %4830, align 8
  %4832 = call i32 (%struct.regnode*, ...)* bitcast (i32 (...)* @regmatch to i32 (%struct.regnode*, ...)*)(%struct.regnode* %4831)
  %4833 = icmp ne i32 %4832, 0
  br i1 %4833, label %4834, label %4839

; <label>:4834                                    ; preds = %4810
  store %struct.re_cc_state* %4811, %struct.re_cc_state** @PL_reg_call_cc, align 8
  %4835 = load i32* @PL_savestack_ix, align 4
  %4836 = icmp sgt i32 %4835, %4814
  br i1 %4836, label %4837, label %4838

; <label>:4837                                    ; preds = %4834
  call void @Perl_leave_scope(i32 %4814)
  br label %4838

; <label>:4838                                    ; preds = %4837, %4834
  br label %5028

; <label>:4839                                    ; preds = %4810
  %4840 = load i32* @PL_savestack_ix, align 4
  %4841 = icmp sgt i32 %4840, %4815
  br i1 %4841, label %4842, label %4843

; <label>:4842                                    ; preds = %4839
  call void @Perl_leave_scope(i32 %4815)
  br label %4843

; <label>:4843                                    ; preds = %4842, %4839
  %4844 = call i32 (...)* @regcppop()
  store %struct.re_cc_state* %4811, %struct.re_cc_state** @PL_reg_call_cc, align 8
  store %struct.curcur* %4812, %struct.curcur** @PL_regcc, align 8
  store %struct.regexp* %4813, %struct.regexp** @PL_reg_re, align 8
  %4845 = call i32 (%struct.regexp*, ...)* bitcast (i32 (...)* @cache_re to i32 (%struct.regexp*, ...)*)(%struct.regexp* %4813)
  br label %5031

; <label>:4846                                    ; preds = %4807
  %4847 = load i8** @PL_regtill, align 8
  %4848 = icmp ult i8* %locinput.0, %4847
  br i1 %4848, label %4849, label %4850

; <label>:4849                                    ; preds = %4846
  br label %5030

; <label>:4850                                    ; preds = %4846
  store i8* %locinput.0, i8** @PL_reginput, align 8
  br label %5027

; <label>:4851                                    ; preds = %15
  store i8* %locinput.0, i8** @PL_reginput, align 8
  br label %5026

; <label>:4852                                    ; preds = %15
  store i8* %locinput.0, i8** @PL_reginput, align 8
  br label %4937

; <label>:4853                                    ; preds = %15
  %4854 = getelementptr inbounds %struct.regnode* %scan.0, i32 0, i32 0
  %4855 = load i8* %4854, align 1
  %4856 = icmp ne i8 %4855, 0
  br i1 %4856, label %4857, label %4893

; <label>:4857                                    ; preds = %4853
  %4858 = load i8* @PL_reg_match_utf8, align 1
  %4859 = sext i8 %4858 to i32
  %4860 = icmp ne i32 %4859, 0
  br i1 %4860, label %4861, label %4869

; <label>:4861                                    ; preds = %4857
  %4862 = getelementptr inbounds %struct.regnode* %scan.0, i32 0, i32 0
  %4863 = load i8* %4862, align 1
  %4864 = zext i8 %4863 to i32
  %4865 = sub nsw i32 0, %4864
  %4866 = call i32 (i8*, i32, ...)* bitcast (i32 (...)* @reghopmaybe to i32 (i8*, i32, ...)*)(i8* %locinput.0, i32 %4865)
  %4867 = sext i32 %4866 to i64
  %4868 = inttoptr i64 %4867 to i8*
  br label %4888

; <label>:4869                                    ; preds = %4857
  %4870 = getelementptr inbounds %struct.regnode* %scan.0, i32 0, i32 0
  %4871 = load i8* %4870, align 1
  %4872 = zext i8 %4871 to i32
  %4873 = sext i32 %4872 to i64
  %4874 = sub i64 0, %4873
  %4875 = getelementptr inbounds i8* %locinput.0, i64 %4874
  %4876 = load i8** @PL_bostr, align 8
  %4877 = icmp uge i8* %4875, %4876
  br i1 %4877, label %4878, label %4885

; <label>:4878                                    ; preds = %4869
  %4879 = getelementptr inbounds %struct.regnode* %scan.0, i32 0, i32 0
  %4880 = load i8* %4879, align 1
  %4881 = zext i8 %4880 to i32
  %4882 = sext i32 %4881 to i64
  %4883 = sub i64 0, %4882
  %4884 = getelementptr inbounds i8* %locinput.0, i64 %4883
  br label %4886

; <label>:4885                                    ; preds = %4869
  br label %4886

; <label>:4886                                    ; preds = %4885, %4878
  %4887 = phi i8* [ %4884, %4878 ], [ null, %4885 ]
  br label %4888

; <label>:4888                                    ; preds = %4886, %4861
  %4889 = phi i8* [ %4868, %4861 ], [ %4887, %4886 ]
  %4890 = icmp ne i8* %4889, null
  br i1 %4890, label %4892, label %4891

; <label>:4891                                    ; preds = %4888
  br label %4948

; <label>:4892                                    ; preds = %4888
  store i8* %4889, i8** @PL_reginput, align 8
  br label %4894

; <label>:4893                                    ; preds = %4853
  store i8* %locinput.0, i8** @PL_reginput, align 8
  br label %4894

; <label>:4894                                    ; preds = %4893, %4892
  br label %4937

; <label>:4895                                    ; preds = %15
  %4896 = getelementptr inbounds %struct.regnode* %scan.0, i32 0, i32 0
  %4897 = load i8* %4896, align 1
  %4898 = icmp ne i8 %4897, 0
  br i1 %4898, label %4899, label %4935

; <label>:4899                                    ; preds = %4895
  %4900 = load i8* @PL_reg_match_utf8, align 1
  %4901 = sext i8 %4900 to i32
  %4902 = icmp ne i32 %4901, 0
  br i1 %4902, label %4903, label %4911

; <label>:4903                                    ; preds = %4899
  %4904 = getelementptr inbounds %struct.regnode* %scan.0, i32 0, i32 0
  %4905 = load i8* %4904, align 1
  %4906 = zext i8 %4905 to i32
  %4907 = sub nsw i32 0, %4906
  %4908 = call i32 (i8*, i32, ...)* bitcast (i32 (...)* @reghopmaybe to i32 (i8*, i32, ...)*)(i8* %locinput.0, i32 %4907)
  %4909 = sext i32 %4908 to i64
  %4910 = inttoptr i64 %4909 to i8*
  br label %4930

; <label>:4911                                    ; preds = %4899
  %4912 = getelementptr inbounds %struct.regnode* %scan.0, i32 0, i32 0
  %4913 = load i8* %4912, align 1
  %4914 = zext i8 %4913 to i32
  %4915 = sext i32 %4914 to i64
  %4916 = sub i64 0, %4915
  %4917 = getelementptr inbounds i8* %locinput.0, i64 %4916
  %4918 = load i8** @PL_bostr, align 8
  %4919 = icmp uge i8* %4917, %4918
  br i1 %4919, label %4920, label %4927

; <label>:4920                                    ; preds = %4911
  %4921 = getelementptr inbounds %struct.regnode* %scan.0, i32 0, i32 0
  %4922 = load i8* %4921, align 1
  %4923 = zext i8 %4922 to i32
  %4924 = sext i32 %4923 to i64
  %4925 = sub i64 0, %4924
  %4926 = getelementptr inbounds i8* %locinput.0, i64 %4925
  br label %4928

; <label>:4927                                    ; preds = %4911
  br label %4928

; <label>:4928                                    ; preds = %4927, %4920
  %4929 = phi i8* [ %4926, %4920 ], [ null, %4927 ]
  br label %4930

; <label>:4930                                    ; preds = %4928, %4903
  %4931 = phi i8* [ %4910, %4903 ], [ %4929, %4928 ]
  %4932 = icmp ne i8* %4931, null
  br i1 %4932, label %4934, label %4933

; <label>:4933                                    ; preds = %4930
  br label %4943

; <label>:4934                                    ; preds = %4930
  store i8* %4931, i8** @PL_reginput, align 8
  br label %4936

; <label>:4935                                    ; preds = %4895
  store i8* %locinput.0, i8** @PL_reginput, align 8
  br label %4936

; <label>:4936                                    ; preds = %4935, %4934
  br label %4937

; <label>:4937                                    ; preds = %4936, %4894, %4852
  %n.7 = phi i32 [ 1, %4936 ], [ 0, %4894 ], [ 1, %4852 ]
  %4938 = getelementptr inbounds %struct.regnode* %scan.0, i64 1
  %4939 = getelementptr inbounds %struct.regnode* %4938, i64 1
  %4940 = call i32 (%struct.regnode*, ...)* bitcast (i32 (...)* @regmatch to i32 (%struct.regnode*, ...)*)(%struct.regnode* %4939)
  %4941 = icmp ne i32 %4940, %n.7
  br i1 %4941, label %4942, label %4947

; <label>:4942                                    ; preds = %4937
  br label %4943

; <label>:4943                                    ; preds = %4942, %4933
  %4944 = icmp ne i32 %logical.0, 0
  br i1 %4944, label %4945, label %4946

; <label>:4945                                    ; preds = %4943
  br label %4962

; <label>:4946                                    ; preds = %4943
  br label %5029

; <label>:4947                                    ; preds = %4937
  br label %4948

; <label>:4948                                    ; preds = %4947, %4891
  %4949 = icmp ne i32 %logical.0, 0
  br i1 %4949, label %4950, label %4951

; <label>:4950                                    ; preds = %4948
  br label %4951

; <label>:4951                                    ; preds = %4950, %4948
  %logical.2 = phi i32 [ 0, %4950 ], [ %logical.0, %4948 ]
  %sw.2 = phi i32 [ 1, %4950 ], [ %sw.0, %4948 ]
  %4952 = getelementptr inbounds %struct.regnode* %scan.0, i32 0, i32 1
  %4953 = load i8* %4952, align 1
  %4954 = zext i8 %4953 to i32
  %4955 = icmp eq i32 %4954, 52
  br i1 %4955, label %4956, label %4960

; <label>:4956                                    ; preds = %4951
  %4957 = load i8** @PL_reginput, align 8
  %4958 = load i8* %4957, align 1
  %4959 = zext i8 %4958 to i32
  br label %4960

; <label>:4960                                    ; preds = %4956, %4951
  %locinput.20 = phi i8* [ %4957, %4956 ], [ %locinput.0, %4951 ]
  %nextchr.5 = phi i32 [ %4959, %4956 ], [ %nextchr.0, %4951 ]
  br label %4961

; <label>:4961                                    ; preds = %4960, %15
  %logical.3 = phi i32 [ %logical.0, %15 ], [ %logical.2, %4960 ]
  %sw.3 = phi i32 [ %sw.0, %15 ], [ %sw.2, %4960 ]
  %locinput.21 = phi i8* [ %locinput.0, %15 ], [ %locinput.20, %4960 ]
  %nextchr.6 = phi i32 [ %nextchr.0, %15 ], [ %nextchr.5, %4960 ]
  br label %4962

; <label>:4962                                    ; preds = %4961, %4945
  %logical.4 = phi i32 [ %logical.3, %4961 ], [ 0, %4945 ]
  %sw.4 = phi i32 [ %sw.3, %4961 ], [ 0, %4945 ]
  %locinput.22 = phi i8* [ %locinput.21, %4961 ], [ %locinput.0, %4945 ]
  %nextchr.7 = phi i32 [ %nextchr.6, %4961 ], [ %nextchr.0, %4945 ]
  %4963 = bitcast %struct.regnode* %scan.0 to %struct.regnode_1*
  %4964 = getelementptr inbounds %struct.regnode_1* %4963, i32 0, i32 3
  %4965 = load i32* %4964, align 4
  %4966 = zext i32 %4965 to i64
  %4967 = getelementptr inbounds %struct.regnode* %scan.0, i64 %4966
  %4968 = icmp eq %struct.regnode* %4967, %scan.0
  br i1 %4968, label %4969, label %4970

; <label>:4969                                    ; preds = %4962
  br label %4970

; <label>:4970                                    ; preds = %4969, %4962
  %next.7 = phi %struct.regnode* [ null, %4969 ], [ %4967, %4962 ]
  br label %5023

; <label>:4971                                    ; preds = %15
  %4972 = load %struct.gv** @PL_stderrgv, align 8
  %4973 = icmp ne %struct.gv* %4972, null
  br i1 %4973, label %4974, label %5014

; <label>:4974                                    ; preds = %4971
  %4975 = load %struct.gv** @PL_stderrgv, align 8
  %4976 = getelementptr inbounds %struct.gv* %4975, i32 0, i32 2
  %4977 = load i32* %4976, align 4
  %4978 = and i32 %4977, 255
  %4979 = icmp eq i32 %4978, 13
  br i1 %4979, label %4980, label %5014

; <label>:4980                                    ; preds = %4974
  %4981 = load %struct.gv** @PL_stderrgv, align 8
  %4982 = getelementptr inbounds %struct.gv* %4981, i32 0, i32 0
  %4983 = load %struct.xpvgv** %4982, align 8
  %4984 = getelementptr inbounds %struct.xpvgv* %4983, i32 0, i32 7
  %4985 = load %struct.gp** %4984, align 8
  %4986 = getelementptr inbounds %struct.gp* %4985, i32 0, i32 2
  %4987 = load %struct.io** %4986, align 8
  %4988 = icmp ne %struct.io* %4987, null
  br i1 %4988, label %4989, label %5014

; <label>:4989                                    ; preds = %4980
  %4990 = load %struct.gv** @PL_stderrgv, align 8
  %4991 = getelementptr inbounds %struct.gv* %4990, i32 0, i32 0
  %4992 = load %struct.xpvgv** %4991, align 8
  %4993 = getelementptr inbounds %struct.xpvgv* %4992, i32 0, i32 7
  %4994 = load %struct.gp** %4993, align 8
  %4995 = getelementptr inbounds %struct.gp* %4994, i32 0, i32 2
  %4996 = load %struct.io** %4995, align 8
  %4997 = getelementptr inbounds %struct.io* %4996, i32 0, i32 0
  %4998 = load %struct.xpvio** %4997, align 8
  %4999 = getelementptr inbounds %struct.xpvio* %4998, i32 0, i32 8
  %5000 = load %struct._PerlIO*** %4999, align 8
  %5001 = icmp ne %struct._PerlIO** %5000, null
  br i1 %5001, label %5002, label %5014

; <label>:5002                                    ; preds = %4989
  %5003 = load %struct.gv** @PL_stderrgv, align 8
  %5004 = getelementptr inbounds %struct.gv* %5003, i32 0, i32 0
  %5005 = load %struct.xpvgv** %5004, align 8
  %5006 = getelementptr inbounds %struct.xpvgv* %5005, i32 0, i32 7
  %5007 = load %struct.gp** %5006, align 8
  %5008 = getelementptr inbounds %struct.gp* %5007, i32 0, i32 2
  %5009 = load %struct.io** %5008, align 8
  %5010 = getelementptr inbounds %struct.io* %5009, i32 0, i32 0
  %5011 = load %struct.xpvio** %5010, align 8
  %5012 = getelementptr inbounds %struct.xpvio* %5011, i32 0, i32 8
  %5013 = load %struct._PerlIO*** %5012, align 8
  br label %5016

; <label>:5014                                    ; preds = %4989, %4980, %4974, %4971
  %5015 = call %struct._PerlIO** @Perl_PerlIO_stderr()
  br label %5016

; <label>:5016                                    ; preds = %5014, %5002
  %5017 = phi %struct._PerlIO** [ %5013, %5002 ], [ %5015, %5014 ]
  %5018 = ptrtoint %struct.regnode* %scan.0 to i64
  %5019 = getelementptr inbounds %struct.regnode* %scan.0, i32 0, i32 1
  %5020 = load i8* %5019, align 1
  %5021 = zext i8 %5020 to i32
  %5022 = call i32 (%struct._PerlIO**, i8*, ...)* @PerlIO_printf(%struct._PerlIO** %5017, i8* getelementptr inbounds ([8 x i8]* @.str8, i32 0, i32 0), i64 %5018, i32 %5021)
  call void (i8*, ...)* @Perl_croak(i8* getelementptr inbounds ([25 x i8]* @.str9, i32 0, i32 0))
  br label %5023

; <label>:5023                                    ; preds = %5016, %4970, %2779, %2778, %2053, %2052, %2029, %2014, %1984, %1973, %1643, %1642, %1637, %1577, %1525, %1498, %1447, %1416, %1357, %1326, %1270, %1233, %1177, %1104, %1046, %827, %784, %720, %677, %619, %542, %500, %469, %425, %326, %303, %162, %131, %124, %98, %93, %76, %60, %55, %50, %35
  %unwind.2 = phi i32 [ %unwind.0, %5016 ], [ %unwind.0, %4970 ], [ %unwind.0, %2779 ], [ %unwind.1, %2778 ], [ %unwind.0, %2053 ], [ %unwind.0, %2052 ], [ %unwind.0, %2029 ], [ %unwind.0, %2014 ], [ %unwind.0, %1984 ], [ %unwind.0, %1973 ], [ %unwind.0, %1643 ], [ %unwind.0, %1642 ], [ %unwind.0, %1525 ], [ %unwind.0, %1577 ], [ %unwind.0, %1637 ], [ %unwind.0, %1498 ], [ %unwind.0, %1416 ], [ %unwind.0, %1447 ], [ %unwind.0, %1326 ], [ %unwind.0, %1357 ], [ %unwind.0, %1233 ], [ %unwind.0, %1270 ], [ %unwind.0, %1104 ], [ %unwind.0, %1177 ], [ %unwind.0, %1046 ], [ %unwind.0, %784 ], [ %unwind.0, %827 ], [ %unwind.0, %677 ], [ %unwind.0, %720 ], [ %unwind.0, %500 ], [ %unwind.0, %619 ], [ %unwind.0, %542 ], [ %unwind.0, %425 ], [ %unwind.0, %469 ], [ %unwind.0, %303 ], [ %unwind.0, %326 ], [ %unwind.0, %162 ], [ %unwind.0, %131 ], [ %unwind.0, %124 ], [ %unwind.0, %98 ], [ %unwind.0, %93 ], [ %unwind.0, %76 ], [ %unwind.0, %60 ], [ %unwind.0, %55 ], [ %unwind.0, %50 ], [ %unwind.0, %35 ]
  %logical.5 = phi i32 [ %logical.0, %5016 ], [ %logical.4, %4970 ], [ %logical.0, %2779 ], [ %logical.0, %2778 ], [ %2056, %2053 ], [ %logical.0, %2052 ], [ %logical.0, %2029 ], [ %logical.0, %2014 ], [ %logical.0, %1984 ], [ %logical.1, %1973 ], [ %logical.0, %1643 ], [ %logical.0, %1642 ], [ %logical.0, %1525 ], [ %logical.0, %1577 ], [ %logical.0, %1637 ], [ %logical.0, %1498 ], [ %logical.0, %1416 ], [ %logical.0, %1447 ], [ %logical.0, %1326 ], [ %logical.0, %1357 ], [ %logical.0, %1233 ], [ %logical.0, %1270 ], [ %logical.0, %1104 ], [ %logical.0, %1177 ], [ %logical.0, %1046 ], [ %logical.0, %784 ], [ %logical.0, %827 ], [ %logical.0, %677 ], [ %logical.0, %720 ], [ %logical.0, %500 ], [ %logical.0, %619 ], [ %logical.0, %542 ], [ %logical.0, %425 ], [ %logical.0, %469 ], [ %logical.0, %303 ], [ %logical.0, %326 ], [ %logical.0, %162 ], [ %logical.0, %131 ], [ %logical.0, %124 ], [ %logical.0, %98 ], [ %logical.0, %93 ], [ %logical.0, %76 ], [ %logical.0, %60 ], [ %logical.0, %55 ], [ %logical.0, %50 ], [ %logical.0, %35 ]
  %sw.5 = phi i32 [ %sw.0, %5016 ], [ %sw.4, %4970 ], [ %sw.0, %2779 ], [ %sw.0, %2778 ], [ %sw.0, %2053 ], [ %sw.0, %2052 ], [ %2031, %2029 ], [ %sw.0, %2014 ], [ %sw.0, %1984 ], [ %sw.1, %1973 ], [ %sw.0, %1643 ], [ %sw.0, %1642 ], [ %sw.0, %1525 ], [ %sw.0, %1577 ], [ %sw.0, %1637 ], [ %sw.0, %1498 ], [ %sw.0, %1416 ], [ %sw.0, %1447 ], [ %sw.0, %1326 ], [ %sw.0, %1357 ], [ %sw.0, %1233 ], [ %sw.0, %1270 ], [ %sw.0, %1104 ], [ %sw.0, %1177 ], [ %sw.0, %1046 ], [ %sw.0, %784 ], [ %sw.0, %827 ], [ %sw.0, %677 ], [ %sw.0, %720 ], [ %sw.0, %500 ], [ %sw.0, %619 ], [ %sw.0, %542 ], [ %sw.0, %425 ], [ %sw.0, %469 ], [ %sw.0, %303 ], [ %sw.0, %326 ], [ %sw.0, %162 ], [ %sw.0, %131 ], [ %sw.0, %124 ], [ %sw.0, %98 ], [ %sw.0, %93 ], [ %sw.0, %76 ], [ %sw.0, %60 ], [ %sw.0, %55 ], [ %sw.0, %50 ], [ %sw.0, %35 ]
  %minmod.3 = phi i32 [ %minmod.0, %5016 ], [ %minmod.0, %4970 ], [ 1, %2779 ], [ %minmod.0, %2778 ], [ %minmod.0, %2053 ], [ %minmod.0, %2052 ], [ %minmod.0, %2029 ], [ %minmod.0, %2014 ], [ %minmod.0, %1984 ], [ %minmod.0, %1973 ], [ %minmod.0, %1643 ], [ %minmod.0, %1642 ], [ %minmod.0, %1525 ], [ %minmod.0, %1577 ], [ %minmod.0, %1637 ], [ %minmod.0, %1498 ], [ %minmod.0, %1416 ], [ %minmod.0, %1447 ], [ %minmod.0, %1326 ], [ %minmod.0, %1357 ], [ %minmod.0, %1233 ], [ %minmod.0, %1270 ], [ %minmod.0, %1104 ], [ %minmod.0, %1177 ], [ %minmod.0, %1046 ], [ %minmod.0, %784 ], [ %minmod.0, %827 ], [ %minmod.0, %677 ], [ %minmod.0, %720 ], [ %minmod.0, %500 ], [ %minmod.0, %619 ], [ %minmod.0, %542 ], [ %minmod.0, %425 ], [ %minmod.0, %469 ], [ %minmod.0, %303 ], [ %minmod.0, %326 ], [ %minmod.0, %162 ], [ %minmod.0, %131 ], [ %minmod.0, %124 ], [ %minmod.0, %98 ], [ %minmod.0, %93 ], [ %minmod.0, %76 ], [ %minmod.0, %60 ], [ %minmod.0, %55 ], [ %minmod.0, %50 ], [ %minmod.0, %35 ]
  %c1.14 = phi i32 [ %c1.0, %5016 ], [ %c1.0, %4970 ], [ %c1.0, %2779 ], [ %2753, %2778 ], [ %c1.0, %2053 ], [ %c1.0, %2052 ], [ %c1.0, %2029 ], [ %c1.0, %2014 ], [ %c1.0, %1984 ], [ %c1.0, %1973 ], [ %c1.0, %1643 ], [ %c1.0, %1642 ], [ %c1.0, %1525 ], [ %c1.0, %1577 ], [ %c1.0, %1637 ], [ %c1.0, %1498 ], [ %c1.0, %1416 ], [ %c1.0, %1447 ], [ %c1.0, %1326 ], [ %c1.0, %1357 ], [ %c1.0, %1233 ], [ %c1.0, %1270 ], [ %c1.0, %1104 ], [ %c1.0, %1177 ], [ %c1.0, %1046 ], [ %c1.0, %784 ], [ %c1.0, %827 ], [ %c1.0, %677 ], [ %c1.0, %720 ], [ %c1.0, %500 ], [ %c1.0, %619 ], [ %c1.0, %542 ], [ %c1.0, %425 ], [ %c1.0, %469 ], [ %c1.0, %303 ], [ %c1.0, %326 ], [ %c1.0, %162 ], [ %c1.0, %131 ], [ %c1.0, %124 ], [ %c1.0, %98 ], [ %c1.0, %93 ], [ %c1.0, %76 ], [ %c1.0, %60 ], [ %c1.0, %55 ], [ %c1.0, %50 ], [ %c1.0, %35 ]
  %locinput.23 = phi i8* [ %locinput.0, %5016 ], [ %locinput.22, %4970 ], [ %locinput.0, %2779 ], [ %locinput.0, %2778 ], [ %locinput.0, %2053 ], [ %locinput.0, %2052 ], [ %locinput.0, %2029 ], [ %locinput.0, %2014 ], [ %locinput.0, %1984 ], [ %locinput.0, %1973 ], [ %locinput.0, %1643 ], [ %locinput.0, %1642 ], [ %locinput.0, %1525 ], [ %l3.1, %1577 ], [ %1639, %1637 ], [ %locinput.5, %1498 ], [ %1422, %1416 ], [ %1448, %1447 ], [ %1332, %1326 ], [ %1358, %1357 ], [ %1239, %1233 ], [ %1271, %1270 ], [ %1110, %1104 ], [ %locinput.3, %1177 ], [ %locinput.0, %1046 ], [ %790, %784 ], [ %828, %827 ], [ %683, %677 ], [ %721, %720 ], [ %502, %500 ], [ %615, %619 ], [ %543, %542 ], [ %426, %425 ], [ %471, %469 ], [ %l.2, %303 ], [ %328, %326 ], [ %locinput.2, %162 ], [ %132, %131 ], [ %locinput.1, %124 ], [ %locinput.0, %98 ], [ %locinput.0, %93 ], [ %locinput.0, %76 ], [ %locinput.0, %60 ], [ %locinput.0, %55 ], [ %locinput.0, %50 ], [ %locinput.0, %35 ]
  %ln.17 = phi i32 [ %ln.0, %5016 ], [ %ln.0, %4970 ], [ %ln.0, %2779 ], [ %ln.0, %2778 ], [ %ln.0, %2053 ], [ %ln.0, %2052 ], [ %ln.0, %2029 ], [ %ln.0, %2014 ], [ %ln.0, %1984 ], [ %ln.0, %1973 ], [ %ln.0, %1643 ], [ %ln.0, %1642 ], [ %1511, %1525 ], [ %1511, %1577 ], [ %1608, %1637 ], [ %ln.0, %1498 ], [ %ln.0, %1416 ], [ %ln.0, %1447 ], [ %ln.0, %1326 ], [ %ln.0, %1357 ], [ %ln.0, %1233 ], [ %ln.0, %1270 ], [ %ln.0, %1104 ], [ %ln.0, %1177 ], [ %ln.4, %1046 ], [ %ln.0, %784 ], [ %ln.0, %827 ], [ %ln.0, %677 ], [ %ln.0, %720 ], [ %ln.0, %500 ], [ %ln.0, %619 ], [ %ln.0, %542 ], [ %341, %425 ], [ %341, %469 ], [ %170, %303 ], [ %170, %326 ], [ %ln.0, %162 ], [ %ln.0, %131 ], [ %ln.0, %124 ], [ %ln.0, %98 ], [ %ln.0, %93 ], [ %ln.0, %76 ], [ %ln.0, %60 ], [ %ln.0, %55 ], [ %ln.0, %50 ], [ %ln.0, %35 ]
  %nextchr.8 = phi i32 [ %nextchr.0, %5016 ], [ %nextchr.7, %4970 ], [ %nextchr.0, %2779 ], [ %nextchr.0, %2778 ], [ %nextchr.0, %2053 ], [ %nextchr.0, %2052 ], [ %nextchr.0, %2029 ], [ %nextchr.0, %2014 ], [ %nextchr.0, %1984 ], [ %nextchr.0, %1973 ], [ %nextchr.0, %1643 ], [ %nextchr.0, %1642 ], [ %nextchr.0, %1525 ], [ %1579, %1577 ], [ %1641, %1637 ], [ %1500, %1498 ], [ %1424, %1416 ], [ %1450, %1447 ], [ %1334, %1326 ], [ %1360, %1357 ], [ %1241, %1233 ], [ %1273, %1270 ], [ %1112, %1104 ], [ %nextchr.4, %1177 ], [ %nextchr.0, %1046 ], [ %792, %784 ], [ %830, %827 ], [ %685, %677 ], [ %723, %720 ], [ %504, %500 ], [ %617, %619 ], [ %545, %542 ], [ %428, %425 ], [ %473, %469 ], [ %305, %303 ], [ %330, %326 ], [ %nextchr.2, %162 ], [ %134, %131 ], [ %nextchr.1, %124 ], [ %nextchr.0, %98 ], [ %nextchr.0, %93 ], [ %nextchr.0, %76 ], [ %nextchr.0, %60 ], [ %nextchr.0, %55 ], [ %nextchr.0, %50 ], [ %nextchr.0, %35 ]
  %next.8 = phi %struct.regnode* [ %next.0, %5016 ], [ %next.7, %4970 ], [ %next.0, %2779 ], [ %inner.0, %2778 ], [ %next.0, %2053 ], [ %next.2, %2052 ], [ %next.0, %2029 ], [ %next.0, %2014 ], [ %next.0, %1984 ], [ %next.0, %1973 ], [ %next.0, %1643 ], [ %next.0, %1642 ], [ %next.0, %1525 ], [ %next.0, %1577 ], [ %next.0, %1637 ], [ %next.0, %1498 ], [ %next.0, %1416 ], [ %next.0, %1447 ], [ %next.0, %1326 ], [ %next.0, %1357 ], [ %next.0, %1233 ], [ %next.0, %1270 ], [ %next.0, %1104 ], [ %next.0, %1177 ], [ %next.0, %1046 ], [ %next.0, %784 ], [ %next.0, %827 ], [ %next.0, %677 ], [ %next.0, %720 ], [ %next.0, %500 ], [ %next.0, %619 ], [ %next.0, %542 ], [ %next.0, %425 ], [ %next.0, %469 ], [ %next.0, %303 ], [ %next.0, %326 ], [ %next.0, %162 ], [ %next.0, %131 ], [ %next.0, %124 ], [ %next.0, %98 ], [ %next.0, %93 ], [ %next.0, %76 ], [ %next.0, %60 ], [ %next.0, %55 ], [ %next.0, %50 ], [ %next.0, %35 ]
  br label %5024

; <label>:5024                                    ; preds = %5107, %5023
  %unwind.3 = phi i32 [ %unwind.2, %5023 ], [ %unwind.4, %5107 ]
  %logical.6 = phi i32 [ %logical.5, %5023 ], [ %logical.8, %5107 ]
  %sw.6 = phi i32 [ %sw.5, %5023 ], [ %sw.0, %5107 ]
  %minmod.4 = phi i32 [ %minmod.3, %5023 ], [ %minmod.6, %5107 ]
  %c2.20 = phi i32 [ %c2.0, %5023 ], [ %c2.22, %5107 ]
  %c1.15 = phi i32 [ %c1.14, %5023 ], [ %c1.17, %5107 ]
  %locinput.24 = phi i8* [ %locinput.23, %5023 ], [ %5109, %5107 ]
  %ln.18 = phi i32 [ %ln.17, %5023 ], [ %ln.20, %5107 ]
  %nextchr.9 = phi i32 [ %nextchr.8, %5023 ], [ %5111, %5107 ]
  %next.9 = phi %struct.regnode* [ %next.8, %5023 ], [ %next.11, %5107 ]
  br label %5

; <label>:5025                                    ; preds = %5
  call void (i8*, ...)* @Perl_croak(i8* getelementptr inbounds ([26 x i8]* @.str10, i32 0, i32 0))
  br label %5029

; <label>:5026                                    ; preds = %4851
  br label %5028

; <label>:5027                                    ; preds = %4850
  br label %5028

; <label>:5028                                    ; preds = %5027, %5026, %4838, %4777, %4639, %4457, %4397, %4256, %3493, %3152, %2690, %2585, %2484, %2332, %2258, %2159, %2140, %2110, %1874
  br label %5115

; <label>:5029                                    ; preds = %5025, %4946, %4806, %4478, %4214, %4208, %3981, %3518, %3164, %2821, %2736, %2529, %2432, %2160, %2147, %2111, %1894, %1636, %1613, %1602, %1570, %1555, %1518, %1494, %1466, %1454, %1446, %1415, %1369, %1356, %1325, %1279, %1269, %1232, %1186, %1172, %1140, %1103, %1052, %1045, %826, %783, %732, %719, %676, %625, %618, %541, %488, %468, %454, %446, %423, %325, %318, %310, %297, %248, %236, %187, %154, %142, %130, %116, %104, %97, %92, %85, %75, %61, %56, %51, %36
  %logical.7 = phi i32 [ %logical.0, %4946 ], [ %logical.0, %3981 ], [ %logical.0, %4208 ], [ %logical.0, %4214 ], [ %logical.0, %4478 ], [ %logical.0, %4806 ], [ %logical.0, %2821 ], [ %logical.0, %3164 ], [ %logical.0, %3518 ], [ %logical.0, %2147 ], [ %logical.0, %2160 ], [ %logical.0, %2432 ], [ %logical.0, %2529 ], [ %logical.0, %2736 ], [ %logical.0, %2111 ], [ 0, %1894 ], [ %logical.0, %1518 ], [ %logical.0, %1555 ], [ %logical.0, %1570 ], [ %logical.0, %1602 ], [ %logical.0, %1613 ], [ %logical.0, %1636 ], [ %logical.0, %1454 ], [ %logical.0, %1466 ], [ %logical.0, %1494 ], [ %logical.0, %1415 ], [ %logical.0, %1446 ], [ %logical.0, %1369 ], [ %logical.0, %1325 ], [ %logical.0, %1356 ], [ %logical.0, %1279 ], [ %logical.0, %1232 ], [ %logical.0, %1269 ], [ %logical.0, %1186 ], [ %logical.0, %1103 ], [ %logical.0, %1140 ], [ %logical.0, %1172 ], [ %logical.0, %1052 ], [ %logical.0, %1045 ], [ %logical.0, %783 ], [ %logical.0, %826 ], [ %logical.0, %732 ], [ %logical.0, %676 ], [ %logical.0, %719 ], [ %logical.0, %625 ], [ %logical.0, %488 ], [ %logical.0, %618 ], [ %logical.0, %541 ], [ %logical.0, %423 ], [ %logical.0, %446 ], [ %logical.0, %454 ], [ %logical.0, %468 ], [ %logical.0, %187 ], [ %logical.0, %236 ], [ %logical.0, %248 ], [ %logical.0, %297 ], [ %logical.0, %310 ], [ %logical.0, %318 ], [ %logical.0, %325 ], [ %logical.0, %142 ], [ %logical.0, %154 ], [ %logical.0, %130 ], [ %logical.0, %116 ], [ %logical.0, %104 ], [ %logical.0, %97 ], [ %logical.0, %85 ], [ %logical.0, %92 ], [ %logical.0, %75 ], [ %logical.0, %61 ], [ %logical.0, %56 ], [ %logical.0, %51 ], [ %logical.0, %36 ], [ %logical.0, %5025 ]
  %minmod.5 = phi i32 [ %minmod.0, %4946 ], [ 0, %3981 ], [ 0, %4208 ], [ 0, %4214 ], [ 0, %4478 ], [ %minmod.2, %4806 ], [ 0, %2821 ], [ 0, %3164 ], [ %minmod.1, %3518 ], [ %minmod.0, %2147 ], [ %minmod.0, %2160 ], [ %minmod.0, %2432 ], [ %minmod.0, %2529 ], [ %minmod.0, %2736 ], [ %minmod.0, %2111 ], [ %minmod.0, %1894 ], [ %minmod.0, %1518 ], [ %minmod.0, %1555 ], [ %minmod.0, %1570 ], [ %minmod.0, %1602 ], [ %minmod.0, %1613 ], [ %minmod.0, %1636 ], [ %minmod.0, %1454 ], [ %minmod.0, %1466 ], [ %minmod.0, %1494 ], [ %minmod.0, %1415 ], [ %minmod.0, %1446 ], [ %minmod.0, %1369 ], [ %minmod.0, %1325 ], [ %minmod.0, %1356 ], [ %minmod.0, %1279 ], [ %minmod.0, %1232 ], [ %minmod.0, %1269 ], [ %minmod.0, %1186 ], [ %minmod.0, %1103 ], [ %minmod.0, %1140 ], [ %minmod.0, %1172 ], [ %minmod.0, %1052 ], [ %minmod.0, %1045 ], [ %minmod.0, %783 ], [ %minmod.0, %826 ], [ %minmod.0, %732 ], [ %minmod.0, %676 ], [ %minmod.0, %719 ], [ %minmod.0, %625 ], [ %minmod.0, %488 ], [ %minmod.0, %618 ], [ %minmod.0, %541 ], [ %minmod.0, %423 ], [ %minmod.0, %446 ], [ %minmod.0, %454 ], [ %minmod.0, %468 ], [ %minmod.0, %187 ], [ %minmod.0, %236 ], [ %minmod.0, %248 ], [ %minmod.0, %297 ], [ %minmod.0, %310 ], [ %minmod.0, %318 ], [ %minmod.0, %325 ], [ %minmod.0, %142 ], [ %minmod.0, %154 ], [ %minmod.0, %130 ], [ %minmod.0, %116 ], [ %minmod.0, %104 ], [ %minmod.0, %97 ], [ %minmod.0, %85 ], [ %minmod.0, %92 ], [ %minmod.0, %75 ], [ %minmod.0, %61 ], [ %minmod.0, %56 ], [ %minmod.0, %51 ], [ %minmod.0, %36 ], [ %minmod.0, %5025 ]
  %c2.21 = phi i32 [ %c2.0, %4946 ], [ %c2.19, %3981 ], [ %c2.19, %4208 ], [ %c2.19, %4214 ], [ %c2.19, %4478 ], [ %c2.19, %4806 ], [ %c2.0, %2821 ], [ %c2.5, %3164 ], [ %c2.12, %3518 ], [ %c2.0, %2147 ], [ %c2.0, %2160 ], [ %c2.0, %2432 ], [ %c2.0, %2529 ], [ %c2.0, %2736 ], [ %c2.0, %2111 ], [ %c2.0, %1894 ], [ %c2.0, %1518 ], [ %c2.0, %1555 ], [ %c2.0, %1570 ], [ %c2.0, %1602 ], [ %c2.0, %1613 ], [ %c2.0, %1636 ], [ %c2.0, %1454 ], [ %c2.0, %1466 ], [ %c2.0, %1494 ], [ %c2.0, %1415 ], [ %c2.0, %1446 ], [ %c2.0, %1369 ], [ %c2.0, %1325 ], [ %c2.0, %1356 ], [ %c2.0, %1279 ], [ %c2.0, %1232 ], [ %c2.0, %1269 ], [ %c2.0, %1186 ], [ %c2.0, %1103 ], [ %c2.0, %1140 ], [ %c2.0, %1172 ], [ %c2.0, %1052 ], [ %c2.0, %1045 ], [ %c2.0, %783 ], [ %c2.0, %826 ], [ %c2.0, %732 ], [ %c2.0, %676 ], [ %c2.0, %719 ], [ %c2.0, %625 ], [ %c2.0, %488 ], [ %c2.0, %618 ], [ %c2.0, %541 ], [ %c2.0, %423 ], [ %c2.0, %446 ], [ %c2.0, %454 ], [ %c2.0, %468 ], [ %c2.0, %187 ], [ %c2.0, %236 ], [ %c2.0, %248 ], [ %c2.0, %297 ], [ %c2.0, %310 ], [ %c2.0, %318 ], [ %c2.0, %325 ], [ %c2.0, %142 ], [ %c2.0, %154 ], [ %c2.0, %130 ], [ %c2.0, %116 ], [ %c2.0, %104 ], [ %c2.0, %97 ], [ %c2.0, %85 ], [ %c2.0, %92 ], [ %c2.0, %75 ], [ %c2.0, %61 ], [ %c2.0, %56 ], [ %c2.0, %51 ], [ %c2.0, %36 ], [ %c2.0, %5025 ]
  %c1.16 = phi i32 [ %c1.0, %4946 ], [ %c1.13, %3981 ], [ %c1.13, %4208 ], [ %c1.13, %4214 ], [ %c1.13, %4478 ], [ %c1.13, %4806 ], [ %c1.0, %2821 ], [ %c1.3, %3164 ], [ %c1.8, %3518 ], [ %c1.0, %2147 ], [ %c1.0, %2160 ], [ %c1.0, %2432 ], [ %c1.0, %2529 ], [ %c1.0, %2736 ], [ %c1.0, %2111 ], [ %c1.0, %1894 ], [ %c1.0, %1518 ], [ %c1.0, %1555 ], [ %c1.0, %1570 ], [ %c1.0, %1602 ], [ %c1.0, %1613 ], [ %c1.0, %1636 ], [ %c1.0, %1454 ], [ %c1.0, %1466 ], [ %c1.0, %1494 ], [ %c1.0, %1415 ], [ %c1.0, %1446 ], [ %c1.0, %1369 ], [ %c1.0, %1325 ], [ %c1.0, %1356 ], [ %c1.0, %1279 ], [ %c1.0, %1232 ], [ %c1.0, %1269 ], [ %c1.0, %1186 ], [ %c1.0, %1103 ], [ %c1.0, %1140 ], [ %c1.0, %1172 ], [ %c1.0, %1052 ], [ %c1.0, %1045 ], [ %c1.0, %783 ], [ %c1.0, %826 ], [ %c1.0, %732 ], [ %c1.0, %676 ], [ %c1.0, %719 ], [ %c1.0, %625 ], [ %c1.0, %488 ], [ %c1.0, %618 ], [ %c1.0, %541 ], [ %c1.0, %423 ], [ %c1.0, %446 ], [ %c1.0, %454 ], [ %c1.0, %468 ], [ %c1.0, %187 ], [ %c1.0, %236 ], [ %c1.0, %248 ], [ %c1.0, %297 ], [ %c1.0, %310 ], [ %c1.0, %318 ], [ %c1.0, %325 ], [ %c1.0, %142 ], [ %c1.0, %154 ], [ %c1.0, %130 ], [ %c1.0, %116 ], [ %c1.0, %104 ], [ %c1.0, %97 ], [ %c1.0, %85 ], [ %c1.0, %92 ], [ %c1.0, %75 ], [ %c1.0, %61 ], [ %c1.0, %56 ], [ %c1.0, %51 ], [ %c1.0, %36 ], [ %c1.0, %5025 ]
  %ln.19 = phi i32 [ %ln.0, %4946 ], [ %ln.10, %3981 ], [ %ln.11, %4208 ], [ 1, %4214 ], [ %ln.13, %4478 ], [ %ln.16, %4806 ], [ %2784, %2821 ], [ %ln.8, %3164 ], [ %ln.9, %3518 ], [ %ln.5, %2147 ], [ %ln.0, %2160 ], [ %ln.6, %2432 ], [ %ln.6, %2529 ], [ %ln.7, %2736 ], [ %ln.0, %2111 ], [ %ln.0, %1894 ], [ %1511, %1518 ], [ %1511, %1555 ], [ %1511, %1570 ], [ %1511, %1602 ], [ %1608, %1613 ], [ %1608, %1636 ], [ %ln.0, %1454 ], [ %ln.0, %1466 ], [ %ln.0, %1494 ], [ %ln.0, %1415 ], [ %ln.0, %1446 ], [ %ln.0, %1369 ], [ %ln.0, %1325 ], [ %ln.0, %1356 ], [ %ln.0, %1279 ], [ %ln.0, %1232 ], [ %ln.0, %1269 ], [ %ln.0, %1186 ], [ %ln.0, %1103 ], [ %ln.0, %1140 ], [ %ln.0, %1172 ], [ %ln.0, %1052 ], [ %ln.4, %1045 ], [ %ln.0, %783 ], [ %ln.0, %826 ], [ %ln.0, %732 ], [ %ln.0, %676 ], [ %ln.0, %719 ], [ %ln.0, %625 ], [ %ln.0, %488 ], [ %ln.0, %618 ], [ %ln.0, %541 ], [ %341, %423 ], [ %341, %446 ], [ %341, %454 ], [ %341, %468 ], [ %170, %187 ], [ %170, %236 ], [ %170, %248 ], [ %170, %297 ], [ %170, %310 ], [ %170, %318 ], [ %170, %325 ], [ %ln.0, %142 ], [ %ln.0, %154 ], [ %ln.0, %130 ], [ %ln.0, %116 ], [ %ln.0, %104 ], [ %ln.0, %97 ], [ %ln.0, %85 ], [ %ln.0, %92 ], [ %ln.0, %75 ], [ %ln.0, %61 ], [ %ln.0, %56 ], [ %ln.0, %51 ], [ %ln.0, %36 ], [ %ln.0, %5025 ]
  br label %5031

; <label>:5030                                    ; preds = %4849
  br label %5031

; <label>:5031                                    ; preds = %5077, %5030, %5029, %4843, %2259
  %unwind.4 = phi i32 [ %unwind.0, %5029 ], [ %5079, %5077 ], [ %unwind.0, %4843 ], [ %unwind.0, %5030 ], [ %unwind.0, %2259 ]
  %logical.8 = phi i32 [ %logical.7, %5029 ], [ %logical.8, %5077 ], [ %logical.0, %4843 ], [ %logical.0, %5030 ], [ %logical.0, %2259 ]
  %minmod.6 = phi i32 [ %minmod.5, %5029 ], [ %minmod.6, %5077 ], [ %minmod.0, %4843 ], [ %minmod.0, %5030 ], [ %minmod.0, %2259 ]
  %c2.22 = phi i32 [ %c2.21, %5029 ], [ %c2.22, %5077 ], [ %c2.0, %4843 ], [ %c2.0, %5030 ], [ %c2.0, %2259 ]
  %c1.17 = phi i32 [ %c1.16, %5029 ], [ %c1.17, %5077 ], [ %c1.0, %4843 ], [ %c1.0, %5030 ], [ %c1.0, %2259 ]
  %ln.20 = phi i32 [ %ln.19, %5029 ], [ %ln.20, %5077 ], [ %ln.0, %4843 ], [ %ln.0, %5030 ], [ %ln.0, %2259 ]
  %5032 = icmp ne i32 %unwind.4, 0
  br i1 %5032, label %5033, label %5114

; <label>:5033                                    ; preds = %5031
  %5034 = load %union.any** @PL_savestack, align 8
  %5035 = bitcast %union.any* %5034 to i8*
  %5036 = sext i32 %unwind.4 to i64
  %5037 = getelementptr inbounds i8* %5035, i64 %5036
  %5038 = bitcast i8* %5037 to %union.re_unwind_t*
  %5039 = bitcast %union.re_unwind_t* %5038 to i32*
  %5040 = load i32* %5039, align 4
  switch i32 %5040, label %5112 [
    i32 1, label %5041
    i32 2, label %5041
  ]

; <label>:5041                                    ; preds = %5033, %5033
  %5042 = bitcast %union.re_unwind_t* %5038 to %struct.re_unwind_branch_t*
  %5043 = getelementptr inbounds %struct.re_unwind_branch_t* %5042, i32 0, i32 3
  %5044 = load i32* %5043, align 4
  %5045 = load i32* @PL_savestack_ix, align 4
  %5046 = getelementptr inbounds %struct.re_unwind_branch_t* %5042, i32 0, i32 2
  %5047 = load i32* %5046, align 4
  %5048 = icmp sgt i32 %5045, %5047
  br i1 %5048, label %5049, label %5052

; <label>:5049                                    ; preds = %5041
  %5050 = getelementptr inbounds %struct.re_unwind_branch_t* %5042, i32 0, i32 2
  %5051 = load i32* %5050, align 4
  call void @Perl_leave_scope(i32 %5051)
  br label %5052

; <label>:5052                                    ; preds = %5049, %5041
  %5053 = load i32** @PL_reglastparen, align 8
  %5054 = load i32* %5053, align 4
  br label %5055

; <label>:5055                                    ; preds = %5061, %5052
  %n.8 = phi i32 [ %5054, %5052 ], [ %5062, %5061 ]
  %5056 = icmp sgt i32 %n.8, %5044
  br i1 %5056, label %5057, label %5063

; <label>:5057                                    ; preds = %5055
  %5058 = sext i32 %n.8 to i64
  %5059 = load i32** @PL_regendp, align 8
  %5060 = getelementptr inbounds i32* %5059, i64 %5058
  store i32 -1, i32* %5060, align 4
  br label %5061

; <label>:5061                                    ; preds = %5057
  %5062 = add nsw i32 %n.8, -1
  br label %5055

; <label>:5063                                    ; preds = %5055
  %5064 = load i32** @PL_reglastparen, align 8
  store i32 %n.8, i32* %5064, align 4
  %5065 = getelementptr inbounds %struct.re_unwind_branch_t* %5042, i32 0, i32 4
  %5066 = load %struct.regnode** %5065, align 8
  %5067 = icmp ne %struct.regnode* %5066, null
  br i1 %5067, label %5068, label %5077

; <label>:5068                                    ; preds = %5063
  %5069 = getelementptr inbounds %struct.regnode* %5066, i32 0, i32 1
  %5070 = load i8* %5069, align 1
  %5071 = zext i8 %5070 to i32
  %5072 = getelementptr inbounds %struct.re_unwind_branch_t* %5042, i32 0, i32 0
  %5073 = load i32* %5072, align 4
  %5074 = icmp eq i32 %5073, 1
  %5075 = select i1 %5074, i32 31, i32 56
  %5076 = icmp ne i32 %5071, %5075
  br i1 %5076, label %5077, label %5080

; <label>:5077                                    ; preds = %5068, %5063
  %5078 = getelementptr inbounds %struct.re_unwind_branch_t* %5042, i32 0, i32 1
  %5079 = load i32* %5078, align 4
  br label %5031

; <label>:5080                                    ; preds = %5068
  %5081 = getelementptr inbounds %struct.re_unwind_branch_t* %5042, i32 0, i32 0
  %5082 = load i32* %5081, align 4
  %5083 = icmp eq i32 %5082, 1
  br i1 %5083, label %5084, label %5088

; <label>:5084                                    ; preds = %5080
  %5085 = getelementptr inbounds %struct.regnode* %5066, i32 0, i32 2
  %5086 = load i16* %5085, align 2
  %5087 = zext i16 %5086 to i32
  br label %5092

; <label>:5088                                    ; preds = %5080
  %5089 = bitcast %struct.regnode* %5066 to %struct.regnode_1*
  %5090 = getelementptr inbounds %struct.regnode_1* %5089, i32 0, i32 3
  %5091 = load i32* %5090, align 4
  br label %5092

; <label>:5092                                    ; preds = %5088, %5084
  %5093 = phi i32 [ %5087, %5084 ], [ %5091, %5088 ]
  %5094 = icmp ne i32 %5093, 0
  br i1 %5094, label %5095, label %5098

; <label>:5095                                    ; preds = %5092
  %5096 = sext i32 %5093 to i64
  %5097 = getelementptr inbounds %struct.regnode* %5066, i64 %5096
  br label %5099

; <label>:5098                                    ; preds = %5092
  br label %5099

; <label>:5099                                    ; preds = %5098, %5095
  %next.10 = phi %struct.regnode* [ %5097, %5095 ], [ null, %5098 ]
  %5100 = getelementptr inbounds %struct.re_unwind_branch_t* %5042, i32 0, i32 4
  store %struct.regnode* %next.10, %struct.regnode** %5100, align 8
  %5101 = getelementptr inbounds %struct.regnode* %5066, i64 1
  %5102 = getelementptr inbounds %struct.re_unwind_branch_t* %5042, i32 0, i32 0
  %5103 = load i32* %5102, align 4
  %5104 = icmp eq i32 %5103, 2
  br i1 %5104, label %5105, label %5107

; <label>:5105                                    ; preds = %5099
  %5106 = getelementptr inbounds %struct.regnode* %5101, i64 1
  br label %5107

; <label>:5107                                    ; preds = %5105, %5099
  %next.11 = phi %struct.regnode* [ %5106, %5105 ], [ %5101, %5099 ]
  %5108 = getelementptr inbounds %struct.re_unwind_branch_t* %5042, i32 0, i32 5
  %5109 = load i8** %5108, align 8
  %5110 = getelementptr inbounds %struct.re_unwind_branch_t* %5042, i32 0, i32 6
  %5111 = load i32* %5110, align 4
  br label %5024

; <label>:5112                                    ; preds = %5033
  call void (i8*, ...)* @Perl_croak(i8* getelementptr inbounds ([32 x i8]* @.str11, i32 0, i32 0))
  br label %5113

; <label>:5113                                    ; preds = %5112
  br label %5114

; <label>:5114                                    ; preds = %5113, %5031
  br label %5115

; <label>:5115                                    ; preds = %5114, %5028
  %.0 = phi i32 [ 0, %5114 ], [ 1, %5028 ]
  ret i32 %.0
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
  %1 = load %struct.reg_data** @PL_regdata, align 8
  %2 = icmp ne %struct.reg_data* %1, null
  br i1 %2, label %3, label %79

; <label>:3                                       ; preds = %0
  %4 = load %struct.reg_data** @PL_regdata, align 8
  %5 = getelementptr inbounds %struct.reg_data* %4, i32 0, i32 0
  %6 = load i32* %5, align 4
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %8, label %79

; <label>:8                                       ; preds = %3
  %9 = bitcast %struct.regnode* %node to %struct.regnode_1*
  %10 = getelementptr inbounds %struct.regnode_1* %9, i32 0, i32 3
  %11 = load i32* %10, align 4
  %12 = zext i32 %11 to i64
  %13 = load %struct.reg_data** @PL_regdata, align 8
  %14 = getelementptr inbounds %struct.reg_data* %13, i32 0, i32 1
  %15 = load i8** %14, align 8
  %16 = getelementptr inbounds i8* %15, i64 %12
  %17 = load i8* %16, align 1
  %18 = zext i8 %17 to i32
  %19 = icmp eq i32 %18, 115
  br i1 %19, label %20, label %78

; <label>:20                                      ; preds = %8
  %21 = zext i32 %11 to i64
  %22 = load %struct.reg_data** @PL_regdata, align 8
  %23 = getelementptr inbounds %struct.reg_data* %22, i32 0, i32 2
  %24 = getelementptr inbounds [1 x i8*]* %23, i32 0, i64 %21
  %25 = load i8** %24, align 8
  %26 = bitcast i8* %25 to %struct.sv*
  %27 = getelementptr inbounds %struct.sv* %26, i32 0, i32 0
  %28 = load i8** %27, align 8
  %29 = bitcast i8* %28 to %struct.xrv*
  %30 = getelementptr inbounds %struct.xrv* %29, i32 0, i32 0
  %31 = load %struct.sv** %30, align 8
  %32 = bitcast %struct.sv* %31 to %struct.av*
  %33 = getelementptr inbounds %struct.av* %32, i32 0, i32 0
  %34 = load %struct.xpvav** %33, align 8
  %35 = getelementptr inbounds %struct.xpvav* %34, i32 0, i32 0
  %36 = load i8** %35, align 8
  %37 = bitcast i8* %36 to %struct.sv**
  %38 = load %struct.sv** %37, align 8
  %39 = getelementptr inbounds %struct.sv** %37, i64 1
  %40 = load %struct.sv** %39, align 8
  %41 = getelementptr inbounds %struct.sv* %40, i32 0, i32 2
  %42 = load i32* %41, align 4
  %43 = and i32 %42, 255
  %44 = icmp eq i32 %43, 3
  br i1 %44, label %45, label %47

; <label>:45                                      ; preds = %20
  %46 = getelementptr inbounds %struct.sv** %37, i64 1
  br label %48

; <label>:47                                      ; preds = %20
  br label %48

; <label>:48                                      ; preds = %47, %45
  %49 = phi %struct.sv** [ %46, %45 ], [ null, %47 ]
  %50 = getelementptr inbounds %struct.sv** %37, i64 2
  %51 = load %struct.sv** %50, align 8
  %52 = getelementptr inbounds %struct.sv* %51, i32 0, i32 2
  %53 = load i32* %52, align 4
  %54 = and i32 %53, 255
  %55 = icmp eq i32 %54, 10
  br i1 %55, label %56, label %58

; <label>:56                                      ; preds = %48
  %57 = getelementptr inbounds %struct.sv** %37, i64 2
  br label %59

; <label>:58                                      ; preds = %48
  br label %59

; <label>:59                                      ; preds = %58, %56
  %60 = phi %struct.sv** [ %57, %56 ], [ null, %58 ]
  %61 = icmp ne %struct.sv** %49, null
  br i1 %61, label %62, label %64

; <label>:62                                      ; preds = %59
  %63 = load %struct.sv** %49, align 8
  br label %73

; <label>:64                                      ; preds = %59
  %65 = icmp ne %struct.sv* %38, null
  br i1 %65, label %66, label %72

; <label>:66                                      ; preds = %64
  %67 = sext i8 %doinit to i32
  %68 = icmp ne i32 %67, 0
  br i1 %68, label %69, label %72

; <label>:69                                      ; preds = %66
  %70 = call %struct.sv* @Perl_swash_init(i8* getelementptr inbounds ([5 x i8]* @.str12, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8]* @.str13, i32 0, i32 0), %struct.sv* %38, i32 1, i32 0)
  %71 = call %struct.sv** @Perl_av_store(%struct.av* %32, i32 1, %struct.sv* %70)
  br label %72

; <label>:72                                      ; preds = %69, %66, %64
  %sw.0 = phi %struct.sv* [ %70, %69 ], [ null, %66 ], [ null, %64 ]
  br label %73

; <label>:73                                      ; preds = %72, %62
  %sw.1 = phi %struct.sv* [ %63, %62 ], [ %sw.0, %72 ]
  %74 = icmp ne %struct.sv** %60, null
  br i1 %74, label %75, label %77

; <label>:75                                      ; preds = %73
  %76 = load %struct.sv** %60, align 8
  br label %77

; <label>:77                                      ; preds = %75, %73
  %alt.0 = phi %struct.sv* [ %76, %75 ], [ null, %73 ]
  br label %78

; <label>:78                                      ; preds = %77, %8
  %sw.2 = phi %struct.sv* [ %sw.1, %77 ], [ null, %8 ]
  %si.0 = phi %struct.sv* [ %38, %77 ], [ null, %8 ]
  %alt.1 = phi %struct.sv* [ %alt.0, %77 ], [ null, %8 ]
  br label %79

; <label>:79                                      ; preds = %78, %3, %0
  %sw.3 = phi %struct.sv* [ %sw.2, %78 ], [ null, %3 ], [ null, %0 ]
  %si.1 = phi %struct.sv* [ %si.0, %78 ], [ null, %3 ], [ null, %0 ]
  %alt.2 = phi %struct.sv* [ %alt.1, %78 ], [ null, %3 ], [ null, %0 ]
  %80 = icmp ne %struct.sv** %listsvp, null
  br i1 %80, label %81, label %82

; <label>:81                                      ; preds = %79
  store %struct.sv* %si.1, %struct.sv** %listsvp, align 8
  br label %82

; <label>:82                                      ; preds = %81, %79
  %83 = icmp ne %struct.sv** %altsvp, null
  br i1 %83, label %84, label %85

; <label>:84                                      ; preds = %82
  store %struct.sv* %alt.2, %struct.sv** %altsvp, align 8
  br label %85

; <label>:85                                      ; preds = %84, %82
  ret %struct.sv* %sw.3
}

declare %struct.sv* @Perl_swash_init(i8*, i8*, %struct.sv*, i32, i32) #1

declare %struct.sv** @Perl_av_store(%struct.av*, i32, %struct.sv*) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
