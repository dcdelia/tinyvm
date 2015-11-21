; ModuleID = 'Way_.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%class.wayobj = type <{ i32, i32, i32, i32, i32, i32, i32, i32, i32, float, float, float, float, float, %struct.createwaymnginfot, %struct.createwayinfot, [4 x i8], i16*, %struct.waymapcellt*, i32*, i32*, i32, i32, i8, [3 x i8], i32, i16, i16, [4 x i8] }>
%struct.createwaymnginfot = type { float, float, float, float, i32, i32, float, float }
%struct.createwayinfot = type <{ %class.rvectort, %class.rvectort, i8, [3 x i8] }>
%class.rvectort = type { float, float, float }
%struct.waymapcellt = type { i16, i16 }

; Function Attrs: nounwind uwtable
define zeroext i1 @_ZN6wayobj5ismapEii(%class.wayobj* %this, i32 %x, i32 %y) #0 align 2 {
  %1 = icmp slt i32 %x, 1
  br i1 %1, label %2, label %3

; <label>:2                                       ; preds = %0
  br label %17

; <label>:3                                       ; preds = %0
  %4 = icmp slt i32 %y, 1
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %3
  br label %17

; <label>:6                                       ; preds = %3
  %7 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 5
  %8 = load i32* %7, align 4
  %9 = icmp sgt i32 %x, %8
  br i1 %9, label %10, label %11

; <label>:10                                      ; preds = %6
  br label %17

; <label>:11                                      ; preds = %6
  %12 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 6
  %13 = load i32* %12, align 4
  %14 = icmp sgt i32 %y, %13
  br i1 %14, label %15, label %16

; <label>:15                                      ; preds = %11
  br label %17

; <label>:16                                      ; preds = %11
  br label %17

; <label>:17                                      ; preds = %16, %15, %10, %5, %2
  %.0 = phi i1 [ false, %2 ], [ false, %5 ], [ false, %10 ], [ false, %15 ], [ true, %16 ]
  ret i1 %.0
}

; Function Attrs: uwtable
define zeroext i1 @_ZN6wayobj10ismoveableEff(%class.wayobj* %this, float %x, float %y) #1 align 2 {
  %1 = call i32 @_ZN6wayobj4getxEf(%class.wayobj* %this, float %x)
  %2 = call i32 @_ZN6wayobj4getyEf(%class.wayobj* %this, float %y)
  %3 = call zeroext i1 @_ZN6wayobj5ismapEii(%class.wayobj* %this, i32 %1, i32 %2)
  br i1 %3, label %5, label %4

; <label>:4                                       ; preds = %0
  br label %11

; <label>:5                                       ; preds = %0
  %6 = call dereferenceable(2) i16* @_ZN6wayobj3mapEii(%class.wayobj* %this, i32 %1, i32 %2)
  %7 = load i16* %6
  %8 = icmp ne i16 %7, 0
  br i1 %8, label %9, label %10

; <label>:9                                       ; preds = %5
  br label %11

; <label>:10                                      ; preds = %5
  br label %11

; <label>:11                                      ; preds = %10, %9, %4
  %.0 = phi i1 [ false, %9 ], [ true, %10 ], [ false, %4 ]
  ret i1 %.0
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr i32 @_ZN6wayobj4getxEf(%class.wayobj* %this, float %x) #2 align 2 {
  %1 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 9
  %2 = load float* %1, align 4
  %3 = fmul float %x, %2
  %4 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 10
  %5 = load float* %4, align 4
  %6 = fadd float %3, %5
  %7 = fptosi float %6 to i32
  ret i32 %7
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr i32 @_ZN6wayobj4getyEf(%class.wayobj* %this, float %y) #2 align 2 {
  %1 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 11
  %2 = load float* %1, align 4
  %3 = fmul float %y, %2
  %4 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 12
  %5 = load float* %4, align 4
  %6 = fadd float %3, %5
  %7 = fptosi float %6 to i32
  ret i32 %7
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dereferenceable(2) i16* @_ZN6wayobj3mapEii(%class.wayobj* %this, i32 %x, i32 %y) #2 align 2 {
  %1 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 2
  %2 = load i32* %1, align 4
  %3 = shl i32 %y, %2
  %4 = or i32 %3, %x
  %5 = sext i32 %4 to i64
  %6 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 17
  %7 = load i16** %6, align 8
  %8 = getelementptr inbounds i16* %7, i64 %5
  ret i16* %8
}

; Function Attrs: uwtable
define { <2 x float>, float } @_ZN6wayobj8getpointEi(%class.wayobj* %this, i32 %index) #1 align 2 {
  %1 = alloca %class.rvectort, align 4
  %2 = alloca { <2 x float>, float }
  call void @_ZN8rvectortC2Ev(%class.rvectort* %1)
  %3 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 22
  %4 = load i32* %3, align 4
  %5 = and i32 %index, %4
  %6 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 2
  %7 = load i32* %6, align 4
  %8 = ashr i32 %index, %7
  %9 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 14
  %10 = getelementptr inbounds %struct.createwaymnginfot* %9, i32 0, i32 0
  %11 = load float* %10, align 4
  %12 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 13
  %13 = load float* %12, align 4
  %14 = fadd float %11, %13
  %15 = sitofp i32 %5 to float
  %16 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 14
  %17 = getelementptr inbounds %struct.createwaymnginfot* %16, i32 0, i32 1
  %18 = load float* %17, align 4
  %19 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 14
  %20 = getelementptr inbounds %struct.createwaymnginfot* %19, i32 0, i32 0
  %21 = load float* %20, align 4
  %22 = fsub float %18, %21
  %23 = fmul float %15, %22
  %24 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 7
  %25 = load i32* %24, align 4
  %26 = sitofp i32 %25 to float
  %27 = fdiv float %23, %26
  %28 = fadd float %14, %27
  %29 = getelementptr inbounds %class.rvectort* %1, i32 0, i32 0
  store float %28, float* %29, align 4
  %30 = getelementptr inbounds %class.rvectort* %1, i32 0, i32 1
  store float 0.000000e+00, float* %30, align 4
  %31 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 14
  %32 = getelementptr inbounds %struct.createwaymnginfot* %31, i32 0, i32 2
  %33 = load float* %32, align 4
  %34 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 13
  %35 = load float* %34, align 4
  %36 = fadd float %33, %35
  %37 = sitofp i32 %8 to float
  %38 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 14
  %39 = getelementptr inbounds %struct.createwaymnginfot* %38, i32 0, i32 3
  %40 = load float* %39, align 4
  %41 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 14
  %42 = getelementptr inbounds %struct.createwaymnginfot* %41, i32 0, i32 2
  %43 = load float* %42, align 4
  %44 = fsub float %40, %43
  %45 = fmul float %37, %44
  %46 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 8
  %47 = load i32* %46, align 4
  %48 = sitofp i32 %47 to float
  %49 = fdiv float %45, %48
  %50 = fadd float %36, %49
  %51 = getelementptr inbounds %class.rvectort* %1, i32 0, i32 2
  store float %50, float* %51, align 4
  %52 = bitcast { <2 x float>, float }* %2 to i8*
  %53 = bitcast %class.rvectort* %1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %52, i8* %53, i64 12, i32 1, i1 false)
  %54 = load { <2 x float>, float }* %2
  ret { <2 x float>, float } %54
}

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN8rvectortC2Ev(%class.rvectort* %this) unnamed_addr #0 align 2 {
  ret void
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #3

; Function Attrs: nounwind uwtable
define i32 @_ZN6wayobj10makebound2EPiiS0_(%class.wayobj* %this, i32* %bound1p, i32 %bound1l, i32* %bound2p) #0 align 2 {
  %1 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 8
  %2 = load i32* %1, align 4
  %3 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 18
  %4 = load %struct.waymapcellt** %3, align 8
  br label %5

; <label>:5                                       ; preds = %343, %0
  %bound2l.0 = phi i32 [ 0, %0 ], [ %bound2l.17, %343 ]
  %i.0 = phi i32 [ 0, %0 ], [ %344, %343 ]
  %6 = icmp slt i32 %i.0, %bound1l
  br i1 %6, label %7, label %345

; <label>:7                                       ; preds = %5
  %8 = sext i32 %i.0 to i64
  %9 = getelementptr inbounds i32* %bound1p, i64 %8
  %10 = load i32* %9, align 4
  %11 = sub nsw i32 %10, %2
  %12 = sub nsw i32 %11, 1
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds %struct.waymapcellt* %4, i64 %13
  %15 = getelementptr inbounds %struct.waymapcellt* %14, i32 0, i32 0
  %16 = load i16* %15, align 2
  %17 = zext i16 %16 to i32
  %18 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 27
  %19 = load i16* %18, align 2
  %20 = zext i16 %19 to i32
  %21 = icmp ne i32 %17, %20
  br i1 %21, label %22, label %51

; <label>:22                                      ; preds = %7
  %23 = sext i32 %12 to i64
  %24 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 17
  %25 = load i16** %24, align 8
  %26 = getelementptr inbounds i16* %25, i64 %23
  %27 = load i16* %26, align 2
  %28 = sext i16 %27 to i32
  %29 = icmp eq i32 %28, 0
  br i1 %29, label %30, label %50

; <label>:30                                      ; preds = %22
  %31 = sext i32 %bound2l.0 to i64
  %32 = getelementptr inbounds i32* %bound2p, i64 %31
  store i32 %12, i32* %32, align 4
  %33 = add nsw i32 %bound2l.0, 1
  %34 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 27
  %35 = load i16* %34, align 2
  %36 = sext i32 %12 to i64
  %37 = getelementptr inbounds %struct.waymapcellt* %4, i64 %36
  %38 = getelementptr inbounds %struct.waymapcellt* %37, i32 0, i32 0
  store i16 %35, i16* %38, align 2
  %39 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 26
  %40 = load i16* %39, align 2
  %41 = sext i32 %12 to i64
  %42 = getelementptr inbounds %struct.waymapcellt* %4, i64 %41
  %43 = getelementptr inbounds %struct.waymapcellt* %42, i32 0, i32 1
  store i16 %40, i16* %43, align 2
  %44 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 25
  %45 = load i32* %44, align 4
  %46 = icmp eq i32 %12, %45
  br i1 %46, label %47, label %49

; <label>:47                                      ; preds = %30
  %48 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 23
  store i8 1, i8* %48, align 1
  br label %346

; <label>:49                                      ; preds = %30
  br label %50

; <label>:50                                      ; preds = %49, %22
  %bound2l.1 = phi i32 [ %33, %49 ], [ %bound2l.0, %22 ]
  br label %51

; <label>:51                                      ; preds = %50, %7
  %bound2l.2 = phi i32 [ %bound2l.1, %50 ], [ %bound2l.0, %7 ]
  %52 = sub nsw i32 %10, %2
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds %struct.waymapcellt* %4, i64 %53
  %55 = getelementptr inbounds %struct.waymapcellt* %54, i32 0, i32 0
  %56 = load i16* %55, align 2
  %57 = zext i16 %56 to i32
  %58 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 27
  %59 = load i16* %58, align 2
  %60 = zext i16 %59 to i32
  %61 = icmp ne i32 %57, %60
  br i1 %61, label %62, label %91

; <label>:62                                      ; preds = %51
  %63 = sext i32 %52 to i64
  %64 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 17
  %65 = load i16** %64, align 8
  %66 = getelementptr inbounds i16* %65, i64 %63
  %67 = load i16* %66, align 2
  %68 = sext i16 %67 to i32
  %69 = icmp eq i32 %68, 0
  br i1 %69, label %70, label %90

; <label>:70                                      ; preds = %62
  %71 = sext i32 %bound2l.2 to i64
  %72 = getelementptr inbounds i32* %bound2p, i64 %71
  store i32 %52, i32* %72, align 4
  %73 = add nsw i32 %bound2l.2, 1
  %74 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 27
  %75 = load i16* %74, align 2
  %76 = sext i32 %52 to i64
  %77 = getelementptr inbounds %struct.waymapcellt* %4, i64 %76
  %78 = getelementptr inbounds %struct.waymapcellt* %77, i32 0, i32 0
  store i16 %75, i16* %78, align 2
  %79 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 26
  %80 = load i16* %79, align 2
  %81 = sext i32 %52 to i64
  %82 = getelementptr inbounds %struct.waymapcellt* %4, i64 %81
  %83 = getelementptr inbounds %struct.waymapcellt* %82, i32 0, i32 1
  store i16 %80, i16* %83, align 2
  %84 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 25
  %85 = load i32* %84, align 4
  %86 = icmp eq i32 %52, %85
  br i1 %86, label %87, label %89

; <label>:87                                      ; preds = %70
  %88 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 23
  store i8 1, i8* %88, align 1
  br label %346

; <label>:89                                      ; preds = %70
  br label %90

; <label>:90                                      ; preds = %89, %62
  %bound2l.3 = phi i32 [ %73, %89 ], [ %bound2l.2, %62 ]
  br label %91

; <label>:91                                      ; preds = %90, %51
  %bound2l.4 = phi i32 [ %bound2l.3, %90 ], [ %bound2l.2, %51 ]
  %92 = sub nsw i32 %10, %2
  %93 = add nsw i32 %92, 1
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds %struct.waymapcellt* %4, i64 %94
  %96 = getelementptr inbounds %struct.waymapcellt* %95, i32 0, i32 0
  %97 = load i16* %96, align 2
  %98 = zext i16 %97 to i32
  %99 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 27
  %100 = load i16* %99, align 2
  %101 = zext i16 %100 to i32
  %102 = icmp ne i32 %98, %101
  br i1 %102, label %103, label %132

; <label>:103                                     ; preds = %91
  %104 = sext i32 %93 to i64
  %105 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 17
  %106 = load i16** %105, align 8
  %107 = getelementptr inbounds i16* %106, i64 %104
  %108 = load i16* %107, align 2
  %109 = sext i16 %108 to i32
  %110 = icmp eq i32 %109, 0
  br i1 %110, label %111, label %131

; <label>:111                                     ; preds = %103
  %112 = sext i32 %bound2l.4 to i64
  %113 = getelementptr inbounds i32* %bound2p, i64 %112
  store i32 %93, i32* %113, align 4
  %114 = add nsw i32 %bound2l.4, 1
  %115 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 27
  %116 = load i16* %115, align 2
  %117 = sext i32 %93 to i64
  %118 = getelementptr inbounds %struct.waymapcellt* %4, i64 %117
  %119 = getelementptr inbounds %struct.waymapcellt* %118, i32 0, i32 0
  store i16 %116, i16* %119, align 2
  %120 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 26
  %121 = load i16* %120, align 2
  %122 = sext i32 %93 to i64
  %123 = getelementptr inbounds %struct.waymapcellt* %4, i64 %122
  %124 = getelementptr inbounds %struct.waymapcellt* %123, i32 0, i32 1
  store i16 %121, i16* %124, align 2
  %125 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 25
  %126 = load i32* %125, align 4
  %127 = icmp eq i32 %93, %126
  br i1 %127, label %128, label %130

; <label>:128                                     ; preds = %111
  %129 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 23
  store i8 1, i8* %129, align 1
  br label %346

; <label>:130                                     ; preds = %111
  br label %131

; <label>:131                                     ; preds = %130, %103
  %bound2l.5 = phi i32 [ %114, %130 ], [ %bound2l.4, %103 ]
  br label %132

; <label>:132                                     ; preds = %131, %91
  %bound2l.6 = phi i32 [ %bound2l.5, %131 ], [ %bound2l.4, %91 ]
  %133 = sub nsw i32 %10, 1
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds %struct.waymapcellt* %4, i64 %134
  %136 = getelementptr inbounds %struct.waymapcellt* %135, i32 0, i32 0
  %137 = load i16* %136, align 2
  %138 = zext i16 %137 to i32
  %139 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 27
  %140 = load i16* %139, align 2
  %141 = zext i16 %140 to i32
  %142 = icmp ne i32 %138, %141
  br i1 %142, label %143, label %172

; <label>:143                                     ; preds = %132
  %144 = sext i32 %133 to i64
  %145 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 17
  %146 = load i16** %145, align 8
  %147 = getelementptr inbounds i16* %146, i64 %144
  %148 = load i16* %147, align 2
  %149 = sext i16 %148 to i32
  %150 = icmp eq i32 %149, 0
  br i1 %150, label %151, label %171

; <label>:151                                     ; preds = %143
  %152 = sext i32 %bound2l.6 to i64
  %153 = getelementptr inbounds i32* %bound2p, i64 %152
  store i32 %133, i32* %153, align 4
  %154 = add nsw i32 %bound2l.6, 1
  %155 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 27
  %156 = load i16* %155, align 2
  %157 = sext i32 %133 to i64
  %158 = getelementptr inbounds %struct.waymapcellt* %4, i64 %157
  %159 = getelementptr inbounds %struct.waymapcellt* %158, i32 0, i32 0
  store i16 %156, i16* %159, align 2
  %160 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 26
  %161 = load i16* %160, align 2
  %162 = sext i32 %133 to i64
  %163 = getelementptr inbounds %struct.waymapcellt* %4, i64 %162
  %164 = getelementptr inbounds %struct.waymapcellt* %163, i32 0, i32 1
  store i16 %161, i16* %164, align 2
  %165 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 25
  %166 = load i32* %165, align 4
  %167 = icmp eq i32 %133, %166
  br i1 %167, label %168, label %170

; <label>:168                                     ; preds = %151
  %169 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 23
  store i8 1, i8* %169, align 1
  br label %346

; <label>:170                                     ; preds = %151
  br label %171

; <label>:171                                     ; preds = %170, %143
  %bound2l.7 = phi i32 [ %154, %170 ], [ %bound2l.6, %143 ]
  br label %172

; <label>:172                                     ; preds = %171, %132
  %bound2l.8 = phi i32 [ %bound2l.7, %171 ], [ %bound2l.6, %132 ]
  %173 = add nsw i32 %10, 1
  %174 = sext i32 %173 to i64
  %175 = getelementptr inbounds %struct.waymapcellt* %4, i64 %174
  %176 = getelementptr inbounds %struct.waymapcellt* %175, i32 0, i32 0
  %177 = load i16* %176, align 2
  %178 = zext i16 %177 to i32
  %179 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 27
  %180 = load i16* %179, align 2
  %181 = zext i16 %180 to i32
  %182 = icmp ne i32 %178, %181
  br i1 %182, label %183, label %212

; <label>:183                                     ; preds = %172
  %184 = sext i32 %173 to i64
  %185 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 17
  %186 = load i16** %185, align 8
  %187 = getelementptr inbounds i16* %186, i64 %184
  %188 = load i16* %187, align 2
  %189 = sext i16 %188 to i32
  %190 = icmp eq i32 %189, 0
  br i1 %190, label %191, label %211

; <label>:191                                     ; preds = %183
  %192 = sext i32 %bound2l.8 to i64
  %193 = getelementptr inbounds i32* %bound2p, i64 %192
  store i32 %173, i32* %193, align 4
  %194 = add nsw i32 %bound2l.8, 1
  %195 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 27
  %196 = load i16* %195, align 2
  %197 = sext i32 %173 to i64
  %198 = getelementptr inbounds %struct.waymapcellt* %4, i64 %197
  %199 = getelementptr inbounds %struct.waymapcellt* %198, i32 0, i32 0
  store i16 %196, i16* %199, align 2
  %200 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 26
  %201 = load i16* %200, align 2
  %202 = sext i32 %173 to i64
  %203 = getelementptr inbounds %struct.waymapcellt* %4, i64 %202
  %204 = getelementptr inbounds %struct.waymapcellt* %203, i32 0, i32 1
  store i16 %201, i16* %204, align 2
  %205 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 25
  %206 = load i32* %205, align 4
  %207 = icmp eq i32 %173, %206
  br i1 %207, label %208, label %210

; <label>:208                                     ; preds = %191
  %209 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 23
  store i8 1, i8* %209, align 1
  br label %346

; <label>:210                                     ; preds = %191
  br label %211

; <label>:211                                     ; preds = %210, %183
  %bound2l.9 = phi i32 [ %194, %210 ], [ %bound2l.8, %183 ]
  br label %212

; <label>:212                                     ; preds = %211, %172
  %bound2l.10 = phi i32 [ %bound2l.9, %211 ], [ %bound2l.8, %172 ]
  %213 = add nsw i32 %10, %2
  %214 = sub nsw i32 %213, 1
  %215 = sext i32 %214 to i64
  %216 = getelementptr inbounds %struct.waymapcellt* %4, i64 %215
  %217 = getelementptr inbounds %struct.waymapcellt* %216, i32 0, i32 0
  %218 = load i16* %217, align 2
  %219 = zext i16 %218 to i32
  %220 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 27
  %221 = load i16* %220, align 2
  %222 = zext i16 %221 to i32
  %223 = icmp ne i32 %219, %222
  br i1 %223, label %224, label %253

; <label>:224                                     ; preds = %212
  %225 = sext i32 %214 to i64
  %226 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 17
  %227 = load i16** %226, align 8
  %228 = getelementptr inbounds i16* %227, i64 %225
  %229 = load i16* %228, align 2
  %230 = sext i16 %229 to i32
  %231 = icmp eq i32 %230, 0
  br i1 %231, label %232, label %252

; <label>:232                                     ; preds = %224
  %233 = sext i32 %bound2l.10 to i64
  %234 = getelementptr inbounds i32* %bound2p, i64 %233
  store i32 %214, i32* %234, align 4
  %235 = add nsw i32 %bound2l.10, 1
  %236 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 27
  %237 = load i16* %236, align 2
  %238 = sext i32 %214 to i64
  %239 = getelementptr inbounds %struct.waymapcellt* %4, i64 %238
  %240 = getelementptr inbounds %struct.waymapcellt* %239, i32 0, i32 0
  store i16 %237, i16* %240, align 2
  %241 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 26
  %242 = load i16* %241, align 2
  %243 = sext i32 %214 to i64
  %244 = getelementptr inbounds %struct.waymapcellt* %4, i64 %243
  %245 = getelementptr inbounds %struct.waymapcellt* %244, i32 0, i32 1
  store i16 %242, i16* %245, align 2
  %246 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 25
  %247 = load i32* %246, align 4
  %248 = icmp eq i32 %214, %247
  br i1 %248, label %249, label %251

; <label>:249                                     ; preds = %232
  %250 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 23
  store i8 1, i8* %250, align 1
  br label %346

; <label>:251                                     ; preds = %232
  br label %252

; <label>:252                                     ; preds = %251, %224
  %bound2l.11 = phi i32 [ %235, %251 ], [ %bound2l.10, %224 ]
  br label %253

; <label>:253                                     ; preds = %252, %212
  %bound2l.12 = phi i32 [ %bound2l.11, %252 ], [ %bound2l.10, %212 ]
  %254 = add nsw i32 %10, %2
  %255 = sext i32 %254 to i64
  %256 = getelementptr inbounds %struct.waymapcellt* %4, i64 %255
  %257 = getelementptr inbounds %struct.waymapcellt* %256, i32 0, i32 0
  %258 = load i16* %257, align 2
  %259 = zext i16 %258 to i32
  %260 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 27
  %261 = load i16* %260, align 2
  %262 = zext i16 %261 to i32
  %263 = icmp ne i32 %259, %262
  br i1 %263, label %264, label %293

; <label>:264                                     ; preds = %253
  %265 = sext i32 %254 to i64
  %266 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 17
  %267 = load i16** %266, align 8
  %268 = getelementptr inbounds i16* %267, i64 %265
  %269 = load i16* %268, align 2
  %270 = sext i16 %269 to i32
  %271 = icmp eq i32 %270, 0
  br i1 %271, label %272, label %292

; <label>:272                                     ; preds = %264
  %273 = sext i32 %bound2l.12 to i64
  %274 = getelementptr inbounds i32* %bound2p, i64 %273
  store i32 %254, i32* %274, align 4
  %275 = add nsw i32 %bound2l.12, 1
  %276 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 27
  %277 = load i16* %276, align 2
  %278 = sext i32 %254 to i64
  %279 = getelementptr inbounds %struct.waymapcellt* %4, i64 %278
  %280 = getelementptr inbounds %struct.waymapcellt* %279, i32 0, i32 0
  store i16 %277, i16* %280, align 2
  %281 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 26
  %282 = load i16* %281, align 2
  %283 = sext i32 %254 to i64
  %284 = getelementptr inbounds %struct.waymapcellt* %4, i64 %283
  %285 = getelementptr inbounds %struct.waymapcellt* %284, i32 0, i32 1
  store i16 %282, i16* %285, align 2
  %286 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 25
  %287 = load i32* %286, align 4
  %288 = icmp eq i32 %254, %287
  br i1 %288, label %289, label %291

; <label>:289                                     ; preds = %272
  %290 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 23
  store i8 1, i8* %290, align 1
  br label %346

; <label>:291                                     ; preds = %272
  br label %292

; <label>:292                                     ; preds = %291, %264
  %bound2l.13 = phi i32 [ %275, %291 ], [ %bound2l.12, %264 ]
  br label %293

; <label>:293                                     ; preds = %292, %253
  %bound2l.14 = phi i32 [ %bound2l.13, %292 ], [ %bound2l.12, %253 ]
  %294 = add nsw i32 %10, %2
  %295 = add nsw i32 %294, 1
  %296 = sext i32 %295 to i64
  %297 = getelementptr inbounds %struct.waymapcellt* %4, i64 %296
  %298 = getelementptr inbounds %struct.waymapcellt* %297, i32 0, i32 0
  %299 = load i16* %298, align 2
  %300 = zext i16 %299 to i32
  %301 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 27
  %302 = load i16* %301, align 2
  %303 = zext i16 %302 to i32
  %304 = icmp ne i32 %300, %303
  br i1 %304, label %305, label %334

; <label>:305                                     ; preds = %293
  %306 = sext i32 %295 to i64
  %307 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 17
  %308 = load i16** %307, align 8
  %309 = getelementptr inbounds i16* %308, i64 %306
  %310 = load i16* %309, align 2
  %311 = sext i16 %310 to i32
  %312 = icmp eq i32 %311, 0
  br i1 %312, label %313, label %333

; <label>:313                                     ; preds = %305
  %314 = sext i32 %bound2l.14 to i64
  %315 = getelementptr inbounds i32* %bound2p, i64 %314
  store i32 %295, i32* %315, align 4
  %316 = add nsw i32 %bound2l.14, 1
  %317 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 27
  %318 = load i16* %317, align 2
  %319 = sext i32 %295 to i64
  %320 = getelementptr inbounds %struct.waymapcellt* %4, i64 %319
  %321 = getelementptr inbounds %struct.waymapcellt* %320, i32 0, i32 0
  store i16 %318, i16* %321, align 2
  %322 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 26
  %323 = load i16* %322, align 2
  %324 = sext i32 %295 to i64
  %325 = getelementptr inbounds %struct.waymapcellt* %4, i64 %324
  %326 = getelementptr inbounds %struct.waymapcellt* %325, i32 0, i32 1
  store i16 %323, i16* %326, align 2
  %327 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 25
  %328 = load i32* %327, align 4
  %329 = icmp eq i32 %295, %328
  br i1 %329, label %330, label %332

; <label>:330                                     ; preds = %313
  %331 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 23
  store i8 1, i8* %331, align 1
  br label %346

; <label>:332                                     ; preds = %313
  br label %333

; <label>:333                                     ; preds = %332, %305
  %bound2l.15 = phi i32 [ %316, %332 ], [ %bound2l.14, %305 ]
  br label %334

; <label>:334                                     ; preds = %333, %293
  %bound2l.16 = phi i32 [ %bound2l.15, %333 ], [ %bound2l.14, %293 ]
  %335 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 21
  %336 = load i32* %335, align 4
  %337 = icmp sge i32 %bound2l.16, %336
  br i1 %337, label %338, label %342

; <label>:338                                     ; preds = %334
  %339 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 21
  %340 = load i32* %339, align 4
  %341 = sub nsw i32 %340, 1
  br label %342

; <label>:342                                     ; preds = %338, %334
  %bound2l.17 = phi i32 [ %341, %338 ], [ %bound2l.16, %334 ]
  br label %343

; <label>:343                                     ; preds = %342
  %344 = add nsw i32 %i.0, 1
  br label %5

; <label>:345                                     ; preds = %5
  br label %346

; <label>:346                                     ; preds = %345, %330, %289, %249, %208, %168, %128, %87, %47
  %.0 = phi i32 [ %33, %47 ], [ %73, %87 ], [ %114, %128 ], [ %154, %168 ], [ %194, %208 ], [ %235, %249 ], [ %275, %289 ], [ %316, %330 ], [ %bound2l.0, %345 ]
  ret i32 %.0
}

; Function Attrs: uwtable
define zeroext i1 @_ZN6wayobj4fillEiiii(%class.wayobj* %this, i32 %startx, i32 %starty, i32 %endx, i32 %endy) #1 align 2 {
  %1 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 27
  %2 = load i16* %1, align 2
  %3 = zext i16 %2 to i32
  %4 = icmp eq i32 %3, 65535
  br i1 %4, label %5, label %18

; <label>:5                                       ; preds = %0
  %6 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 18
  %7 = load %struct.waymapcellt** %6, align 8
  %8 = bitcast %struct.waymapcellt* %7 to i8*
  %9 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 0
  %10 = load i32* %9, align 4
  %11 = shl i32 1, %10
  %12 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 1
  %13 = load i32* %12, align 4
  %14 = shl i32 %11, %13
  %15 = sext i32 %14 to i64
  %16 = mul i64 %15, 4
  call void @llvm.memset.p0i8.i64(i8* %8, i8 0, i64 %16, i32 2, i1 false)
  %17 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 27
  store i16 0, i16* %17, align 2
  br label %18

; <label>:18                                      ; preds = %5, %0
  %19 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 27
  %20 = load i16* %19, align 2
  %21 = add i16 %20, 1
  store i16 %21, i16* %19, align 2
  %22 = call i32 @_ZN6wayobj5indexEii(%class.wayobj* %this, i32 %startx, i32 %starty)
  %23 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 19
  %24 = load i32** %23, align 8
  %25 = getelementptr inbounds i32* %24, i64 0
  store i32 %22, i32* %25, align 4
  %26 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 27
  %27 = load i16* %26, align 2
  %28 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 2
  %29 = load i32* %28, align 4
  %30 = shl i32 %starty, %29
  %31 = or i32 %30, %startx
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 18
  %34 = load %struct.waymapcellt** %33, align 8
  %35 = getelementptr inbounds %struct.waymapcellt* %34, i64 %32
  %36 = getelementptr inbounds %struct.waymapcellt* %35, i32 0, i32 0
  store i16 %27, i16* %36, align 2
  %37 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 2
  %38 = load i32* %37, align 4
  %39 = shl i32 %starty, %38
  %40 = or i32 %39, %startx
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 18
  %43 = load %struct.waymapcellt** %42, align 8
  %44 = getelementptr inbounds %struct.waymapcellt* %43, i64 %41
  %45 = getelementptr inbounds %struct.waymapcellt* %44, i32 0, i32 1
  store i16 0, i16* %45, align 2
  %46 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 23
  store i8 0, i8* %46, align 1
  %47 = call i32 @_ZN6wayobj5indexEii(%class.wayobj* %this, i32 %endx, i32 %endy)
  %48 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 25
  store i32 %47, i32* %48, align 4
  %49 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 26
  store i16 1, i16* %49, align 2
  br label %50

; <label>:50                                      ; preds = %76, %18
  %boundl.0 = phi i32 [ 1, %18 ], [ %boundl.1, %76 ]
  %flodd.0 = phi i8 [ 0, %18 ], [ %flodd.1, %76 ]
  %51 = icmp ne i32 %boundl.0, 0
  br i1 %51, label %52, label %58

; <label>:52                                      ; preds = %50
  %53 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 23
  %54 = load i8* %53, align 1
  %55 = trunc i8 %54 to i1
  %56 = zext i1 %55 to i32
  %57 = icmp eq i32 %56, 0
  br label %58

; <label>:58                                      ; preds = %52, %50
  %59 = phi i1 [ false, %50 ], [ %57, %52 ]
  br i1 %59, label %60, label %80

; <label>:60                                      ; preds = %58
  %61 = trunc i8 %flodd.0 to i1
  %62 = zext i1 %61 to i32
  %63 = icmp eq i32 %62, 0
  br i1 %63, label %64, label %70

; <label>:64                                      ; preds = %60
  %65 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 19
  %66 = load i32** %65, align 8
  %67 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 20
  %68 = load i32** %67, align 8
  %69 = call i32 @_ZN6wayobj10makebound2EPiiS0_(%class.wayobj* %this, i32* %66, i32 %boundl.0, i32* %68)
  br label %76

; <label>:70                                      ; preds = %60
  %71 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 20
  %72 = load i32** %71, align 8
  %73 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 19
  %74 = load i32** %73, align 8
  %75 = call i32 @_ZN6wayobj10makebound2EPiiS0_(%class.wayobj* %this, i32* %72, i32 %boundl.0, i32* %74)
  br label %76

; <label>:76                                      ; preds = %70, %64
  %boundl.1 = phi i32 [ %69, %64 ], [ %75, %70 ]
  %flodd.1 = phi i8 [ 1, %64 ], [ 0, %70 ]
  %77 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 26
  %78 = load i16* %77, align 2
  %79 = add i16 %78, 1
  store i16 %79, i16* %77, align 2
  br label %50

; <label>:80                                      ; preds = %58
  %81 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 23
  %82 = load i8* %81, align 1
  %83 = trunc i8 %82 to i1
  ret i1 %83
}

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #3

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr i32 @_ZN6wayobj5indexEii(%class.wayobj* %this, i32 %x, i32 %y) #2 align 2 {
  %1 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 2
  %2 = load i32* %1, align 4
  %3 = shl i32 %y, %2
  %4 = or i32 %3, %x
  ret i32 %4
}

; Function Attrs: nounwind uwtable
define i32 @_ZN6wayobj18makeobstaclebound2EPiiS0_(%class.wayobj* %this, i32* %bound1p, i32 %bound1l, i32* %bound2p) #0 align 2 {
  %1 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 8
  %2 = load i32* %1, align 4
  %3 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 18
  %4 = load %struct.waymapcellt** %3, align 8
  br label %5

; <label>:5                                       ; preds = %391, %0
  %bound2l.0 = phi i32 [ 0, %0 ], [ %bound2l.17, %391 ]
  %i.0 = phi i32 [ 0, %0 ], [ %392, %391 ]
  %6 = icmp slt i32 %i.0, %bound1l
  br i1 %6, label %7, label %393

; <label>:7                                       ; preds = %5
  %8 = sext i32 %i.0 to i64
  %9 = getelementptr inbounds i32* %bound1p, i64 %8
  %10 = load i32* %9, align 4
  %11 = sub nsw i32 %10, %2
  %12 = sub nsw i32 %11, 1
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds %struct.waymapcellt* %4, i64 %13
  %15 = getelementptr inbounds %struct.waymapcellt* %14, i32 0, i32 0
  %16 = load i16* %15, align 2
  %17 = zext i16 %16 to i32
  %18 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 27
  %19 = load i16* %18, align 2
  %20 = zext i16 %19 to i32
  %21 = icmp ne i32 %17, %20
  br i1 %21, label %22, label %57

; <label>:22                                      ; preds = %7
  %23 = sext i32 %12 to i64
  %24 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 17
  %25 = load i16** %24, align 8
  %26 = getelementptr inbounds i16* %25, i64 %23
  %27 = load i16* %26, align 2
  %28 = sext i16 %27 to i32
  %29 = icmp sgt i32 %28, 0
  br i1 %29, label %30, label %44

; <label>:30                                      ; preds = %22
  %31 = sext i32 %bound2l.0 to i64
  %32 = getelementptr inbounds i32* %bound2p, i64 %31
  store i32 %12, i32* %32, align 4
  %33 = add nsw i32 %bound2l.0, 1
  %34 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 27
  %35 = load i16* %34, align 2
  %36 = sext i32 %12 to i64
  %37 = getelementptr inbounds %struct.waymapcellt* %4, i64 %36
  %38 = getelementptr inbounds %struct.waymapcellt* %37, i32 0, i32 0
  store i16 %35, i16* %38, align 2
  %39 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 26
  %40 = load i16* %39, align 2
  %41 = sext i32 %12 to i64
  %42 = getelementptr inbounds %struct.waymapcellt* %4, i64 %41
  %43 = getelementptr inbounds %struct.waymapcellt* %42, i32 0, i32 1
  store i16 %40, i16* %43, align 2
  br label %56

; <label>:44                                      ; preds = %22
  %45 = sext i32 %12 to i64
  %46 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 17
  %47 = load i16** %46, align 8
  %48 = getelementptr inbounds i16* %47, i64 %45
  %49 = load i16* %48, align 2
  %50 = sext i16 %49 to i32
  %51 = icmp eq i32 %50, 0
  br i1 %51, label %52, label %55

; <label>:52                                      ; preds = %44
  %53 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 23
  store i8 1, i8* %53, align 1
  %54 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 25
  store i32 %12, i32* %54, align 4
  br label %394

; <label>:55                                      ; preds = %44
  br label %56

; <label>:56                                      ; preds = %55, %30
  %bound2l.1 = phi i32 [ %33, %30 ], [ %bound2l.0, %55 ]
  br label %57

; <label>:57                                      ; preds = %56, %7
  %bound2l.2 = phi i32 [ %bound2l.1, %56 ], [ %bound2l.0, %7 ]
  %58 = sub nsw i32 %10, %2
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds %struct.waymapcellt* %4, i64 %59
  %61 = getelementptr inbounds %struct.waymapcellt* %60, i32 0, i32 0
  %62 = load i16* %61, align 2
  %63 = zext i16 %62 to i32
  %64 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 27
  %65 = load i16* %64, align 2
  %66 = zext i16 %65 to i32
  %67 = icmp ne i32 %63, %66
  br i1 %67, label %68, label %103

; <label>:68                                      ; preds = %57
  %69 = sext i32 %58 to i64
  %70 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 17
  %71 = load i16** %70, align 8
  %72 = getelementptr inbounds i16* %71, i64 %69
  %73 = load i16* %72, align 2
  %74 = sext i16 %73 to i32
  %75 = icmp sgt i32 %74, 0
  br i1 %75, label %76, label %90

; <label>:76                                      ; preds = %68
  %77 = sext i32 %bound2l.2 to i64
  %78 = getelementptr inbounds i32* %bound2p, i64 %77
  store i32 %58, i32* %78, align 4
  %79 = add nsw i32 %bound2l.2, 1
  %80 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 27
  %81 = load i16* %80, align 2
  %82 = sext i32 %58 to i64
  %83 = getelementptr inbounds %struct.waymapcellt* %4, i64 %82
  %84 = getelementptr inbounds %struct.waymapcellt* %83, i32 0, i32 0
  store i16 %81, i16* %84, align 2
  %85 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 26
  %86 = load i16* %85, align 2
  %87 = sext i32 %58 to i64
  %88 = getelementptr inbounds %struct.waymapcellt* %4, i64 %87
  %89 = getelementptr inbounds %struct.waymapcellt* %88, i32 0, i32 1
  store i16 %86, i16* %89, align 2
  br label %102

; <label>:90                                      ; preds = %68
  %91 = sext i32 %58 to i64
  %92 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 17
  %93 = load i16** %92, align 8
  %94 = getelementptr inbounds i16* %93, i64 %91
  %95 = load i16* %94, align 2
  %96 = sext i16 %95 to i32
  %97 = icmp eq i32 %96, 0
  br i1 %97, label %98, label %101

; <label>:98                                      ; preds = %90
  %99 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 23
  store i8 1, i8* %99, align 1
  %100 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 25
  store i32 %58, i32* %100, align 4
  br label %394

; <label>:101                                     ; preds = %90
  br label %102

; <label>:102                                     ; preds = %101, %76
  %bound2l.3 = phi i32 [ %79, %76 ], [ %bound2l.2, %101 ]
  br label %103

; <label>:103                                     ; preds = %102, %57
  %bound2l.4 = phi i32 [ %bound2l.3, %102 ], [ %bound2l.2, %57 ]
  %104 = sub nsw i32 %10, %2
  %105 = add nsw i32 %104, 1
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds %struct.waymapcellt* %4, i64 %106
  %108 = getelementptr inbounds %struct.waymapcellt* %107, i32 0, i32 0
  %109 = load i16* %108, align 2
  %110 = zext i16 %109 to i32
  %111 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 27
  %112 = load i16* %111, align 2
  %113 = zext i16 %112 to i32
  %114 = icmp ne i32 %110, %113
  br i1 %114, label %115, label %150

; <label>:115                                     ; preds = %103
  %116 = sext i32 %105 to i64
  %117 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 17
  %118 = load i16** %117, align 8
  %119 = getelementptr inbounds i16* %118, i64 %116
  %120 = load i16* %119, align 2
  %121 = sext i16 %120 to i32
  %122 = icmp sgt i32 %121, 0
  br i1 %122, label %123, label %137

; <label>:123                                     ; preds = %115
  %124 = sext i32 %bound2l.4 to i64
  %125 = getelementptr inbounds i32* %bound2p, i64 %124
  store i32 %105, i32* %125, align 4
  %126 = add nsw i32 %bound2l.4, 1
  %127 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 27
  %128 = load i16* %127, align 2
  %129 = sext i32 %105 to i64
  %130 = getelementptr inbounds %struct.waymapcellt* %4, i64 %129
  %131 = getelementptr inbounds %struct.waymapcellt* %130, i32 0, i32 0
  store i16 %128, i16* %131, align 2
  %132 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 26
  %133 = load i16* %132, align 2
  %134 = sext i32 %105 to i64
  %135 = getelementptr inbounds %struct.waymapcellt* %4, i64 %134
  %136 = getelementptr inbounds %struct.waymapcellt* %135, i32 0, i32 1
  store i16 %133, i16* %136, align 2
  br label %149

; <label>:137                                     ; preds = %115
  %138 = sext i32 %105 to i64
  %139 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 17
  %140 = load i16** %139, align 8
  %141 = getelementptr inbounds i16* %140, i64 %138
  %142 = load i16* %141, align 2
  %143 = sext i16 %142 to i32
  %144 = icmp eq i32 %143, 0
  br i1 %144, label %145, label %148

; <label>:145                                     ; preds = %137
  %146 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 23
  store i8 1, i8* %146, align 1
  %147 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 25
  store i32 %105, i32* %147, align 4
  br label %394

; <label>:148                                     ; preds = %137
  br label %149

; <label>:149                                     ; preds = %148, %123
  %bound2l.5 = phi i32 [ %126, %123 ], [ %bound2l.4, %148 ]
  br label %150

; <label>:150                                     ; preds = %149, %103
  %bound2l.6 = phi i32 [ %bound2l.5, %149 ], [ %bound2l.4, %103 ]
  %151 = sub nsw i32 %10, 1
  %152 = sext i32 %151 to i64
  %153 = getelementptr inbounds %struct.waymapcellt* %4, i64 %152
  %154 = getelementptr inbounds %struct.waymapcellt* %153, i32 0, i32 0
  %155 = load i16* %154, align 2
  %156 = zext i16 %155 to i32
  %157 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 27
  %158 = load i16* %157, align 2
  %159 = zext i16 %158 to i32
  %160 = icmp ne i32 %156, %159
  br i1 %160, label %161, label %196

; <label>:161                                     ; preds = %150
  %162 = sext i32 %151 to i64
  %163 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 17
  %164 = load i16** %163, align 8
  %165 = getelementptr inbounds i16* %164, i64 %162
  %166 = load i16* %165, align 2
  %167 = sext i16 %166 to i32
  %168 = icmp sgt i32 %167, 0
  br i1 %168, label %169, label %183

; <label>:169                                     ; preds = %161
  %170 = sext i32 %bound2l.6 to i64
  %171 = getelementptr inbounds i32* %bound2p, i64 %170
  store i32 %151, i32* %171, align 4
  %172 = add nsw i32 %bound2l.6, 1
  %173 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 27
  %174 = load i16* %173, align 2
  %175 = sext i32 %151 to i64
  %176 = getelementptr inbounds %struct.waymapcellt* %4, i64 %175
  %177 = getelementptr inbounds %struct.waymapcellt* %176, i32 0, i32 0
  store i16 %174, i16* %177, align 2
  %178 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 26
  %179 = load i16* %178, align 2
  %180 = sext i32 %151 to i64
  %181 = getelementptr inbounds %struct.waymapcellt* %4, i64 %180
  %182 = getelementptr inbounds %struct.waymapcellt* %181, i32 0, i32 1
  store i16 %179, i16* %182, align 2
  br label %195

; <label>:183                                     ; preds = %161
  %184 = sext i32 %151 to i64
  %185 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 17
  %186 = load i16** %185, align 8
  %187 = getelementptr inbounds i16* %186, i64 %184
  %188 = load i16* %187, align 2
  %189 = sext i16 %188 to i32
  %190 = icmp eq i32 %189, 0
  br i1 %190, label %191, label %194

; <label>:191                                     ; preds = %183
  %192 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 23
  store i8 1, i8* %192, align 1
  %193 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 25
  store i32 %151, i32* %193, align 4
  br label %394

; <label>:194                                     ; preds = %183
  br label %195

; <label>:195                                     ; preds = %194, %169
  %bound2l.7 = phi i32 [ %172, %169 ], [ %bound2l.6, %194 ]
  br label %196

; <label>:196                                     ; preds = %195, %150
  %bound2l.8 = phi i32 [ %bound2l.7, %195 ], [ %bound2l.6, %150 ]
  %197 = add nsw i32 %10, 1
  %198 = sext i32 %197 to i64
  %199 = getelementptr inbounds %struct.waymapcellt* %4, i64 %198
  %200 = getelementptr inbounds %struct.waymapcellt* %199, i32 0, i32 0
  %201 = load i16* %200, align 2
  %202 = zext i16 %201 to i32
  %203 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 27
  %204 = load i16* %203, align 2
  %205 = zext i16 %204 to i32
  %206 = icmp ne i32 %202, %205
  br i1 %206, label %207, label %242

; <label>:207                                     ; preds = %196
  %208 = sext i32 %197 to i64
  %209 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 17
  %210 = load i16** %209, align 8
  %211 = getelementptr inbounds i16* %210, i64 %208
  %212 = load i16* %211, align 2
  %213 = sext i16 %212 to i32
  %214 = icmp sgt i32 %213, 0
  br i1 %214, label %215, label %229

; <label>:215                                     ; preds = %207
  %216 = sext i32 %bound2l.8 to i64
  %217 = getelementptr inbounds i32* %bound2p, i64 %216
  store i32 %197, i32* %217, align 4
  %218 = add nsw i32 %bound2l.8, 1
  %219 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 27
  %220 = load i16* %219, align 2
  %221 = sext i32 %197 to i64
  %222 = getelementptr inbounds %struct.waymapcellt* %4, i64 %221
  %223 = getelementptr inbounds %struct.waymapcellt* %222, i32 0, i32 0
  store i16 %220, i16* %223, align 2
  %224 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 26
  %225 = load i16* %224, align 2
  %226 = sext i32 %197 to i64
  %227 = getelementptr inbounds %struct.waymapcellt* %4, i64 %226
  %228 = getelementptr inbounds %struct.waymapcellt* %227, i32 0, i32 1
  store i16 %225, i16* %228, align 2
  br label %241

; <label>:229                                     ; preds = %207
  %230 = sext i32 %197 to i64
  %231 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 17
  %232 = load i16** %231, align 8
  %233 = getelementptr inbounds i16* %232, i64 %230
  %234 = load i16* %233, align 2
  %235 = sext i16 %234 to i32
  %236 = icmp eq i32 %235, 0
  br i1 %236, label %237, label %240

; <label>:237                                     ; preds = %229
  %238 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 23
  store i8 1, i8* %238, align 1
  %239 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 25
  store i32 %197, i32* %239, align 4
  br label %394

; <label>:240                                     ; preds = %229
  br label %241

; <label>:241                                     ; preds = %240, %215
  %bound2l.9 = phi i32 [ %218, %215 ], [ %bound2l.8, %240 ]
  br label %242

; <label>:242                                     ; preds = %241, %196
  %bound2l.10 = phi i32 [ %bound2l.9, %241 ], [ %bound2l.8, %196 ]
  %243 = add nsw i32 %10, %2
  %244 = sub nsw i32 %243, 1
  %245 = sext i32 %244 to i64
  %246 = getelementptr inbounds %struct.waymapcellt* %4, i64 %245
  %247 = getelementptr inbounds %struct.waymapcellt* %246, i32 0, i32 0
  %248 = load i16* %247, align 2
  %249 = zext i16 %248 to i32
  %250 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 27
  %251 = load i16* %250, align 2
  %252 = zext i16 %251 to i32
  %253 = icmp ne i32 %249, %252
  br i1 %253, label %254, label %289

; <label>:254                                     ; preds = %242
  %255 = sext i32 %244 to i64
  %256 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 17
  %257 = load i16** %256, align 8
  %258 = getelementptr inbounds i16* %257, i64 %255
  %259 = load i16* %258, align 2
  %260 = sext i16 %259 to i32
  %261 = icmp sgt i32 %260, 0
  br i1 %261, label %262, label %276

; <label>:262                                     ; preds = %254
  %263 = sext i32 %bound2l.10 to i64
  %264 = getelementptr inbounds i32* %bound2p, i64 %263
  store i32 %244, i32* %264, align 4
  %265 = add nsw i32 %bound2l.10, 1
  %266 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 27
  %267 = load i16* %266, align 2
  %268 = sext i32 %244 to i64
  %269 = getelementptr inbounds %struct.waymapcellt* %4, i64 %268
  %270 = getelementptr inbounds %struct.waymapcellt* %269, i32 0, i32 0
  store i16 %267, i16* %270, align 2
  %271 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 26
  %272 = load i16* %271, align 2
  %273 = sext i32 %244 to i64
  %274 = getelementptr inbounds %struct.waymapcellt* %4, i64 %273
  %275 = getelementptr inbounds %struct.waymapcellt* %274, i32 0, i32 1
  store i16 %272, i16* %275, align 2
  br label %288

; <label>:276                                     ; preds = %254
  %277 = sext i32 %244 to i64
  %278 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 17
  %279 = load i16** %278, align 8
  %280 = getelementptr inbounds i16* %279, i64 %277
  %281 = load i16* %280, align 2
  %282 = sext i16 %281 to i32
  %283 = icmp eq i32 %282, 0
  br i1 %283, label %284, label %287

; <label>:284                                     ; preds = %276
  %285 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 23
  store i8 1, i8* %285, align 1
  %286 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 25
  store i32 %244, i32* %286, align 4
  br label %394

; <label>:287                                     ; preds = %276
  br label %288

; <label>:288                                     ; preds = %287, %262
  %bound2l.11 = phi i32 [ %265, %262 ], [ %bound2l.10, %287 ]
  br label %289

; <label>:289                                     ; preds = %288, %242
  %bound2l.12 = phi i32 [ %bound2l.11, %288 ], [ %bound2l.10, %242 ]
  %290 = add nsw i32 %10, %2
  %291 = sext i32 %290 to i64
  %292 = getelementptr inbounds %struct.waymapcellt* %4, i64 %291
  %293 = getelementptr inbounds %struct.waymapcellt* %292, i32 0, i32 0
  %294 = load i16* %293, align 2
  %295 = zext i16 %294 to i32
  %296 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 27
  %297 = load i16* %296, align 2
  %298 = zext i16 %297 to i32
  %299 = icmp ne i32 %295, %298
  br i1 %299, label %300, label %335

; <label>:300                                     ; preds = %289
  %301 = sext i32 %290 to i64
  %302 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 17
  %303 = load i16** %302, align 8
  %304 = getelementptr inbounds i16* %303, i64 %301
  %305 = load i16* %304, align 2
  %306 = sext i16 %305 to i32
  %307 = icmp sgt i32 %306, 0
  br i1 %307, label %308, label %322

; <label>:308                                     ; preds = %300
  %309 = sext i32 %bound2l.12 to i64
  %310 = getelementptr inbounds i32* %bound2p, i64 %309
  store i32 %290, i32* %310, align 4
  %311 = add nsw i32 %bound2l.12, 1
  %312 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 27
  %313 = load i16* %312, align 2
  %314 = sext i32 %290 to i64
  %315 = getelementptr inbounds %struct.waymapcellt* %4, i64 %314
  %316 = getelementptr inbounds %struct.waymapcellt* %315, i32 0, i32 0
  store i16 %313, i16* %316, align 2
  %317 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 26
  %318 = load i16* %317, align 2
  %319 = sext i32 %290 to i64
  %320 = getelementptr inbounds %struct.waymapcellt* %4, i64 %319
  %321 = getelementptr inbounds %struct.waymapcellt* %320, i32 0, i32 1
  store i16 %318, i16* %321, align 2
  br label %334

; <label>:322                                     ; preds = %300
  %323 = sext i32 %290 to i64
  %324 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 17
  %325 = load i16** %324, align 8
  %326 = getelementptr inbounds i16* %325, i64 %323
  %327 = load i16* %326, align 2
  %328 = sext i16 %327 to i32
  %329 = icmp eq i32 %328, 0
  br i1 %329, label %330, label %333

; <label>:330                                     ; preds = %322
  %331 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 23
  store i8 1, i8* %331, align 1
  %332 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 25
  store i32 %290, i32* %332, align 4
  br label %394

; <label>:333                                     ; preds = %322
  br label %334

; <label>:334                                     ; preds = %333, %308
  %bound2l.13 = phi i32 [ %311, %308 ], [ %bound2l.12, %333 ]
  br label %335

; <label>:335                                     ; preds = %334, %289
  %bound2l.14 = phi i32 [ %bound2l.13, %334 ], [ %bound2l.12, %289 ]
  %336 = add nsw i32 %10, %2
  %337 = add nsw i32 %336, 1
  %338 = sext i32 %337 to i64
  %339 = getelementptr inbounds %struct.waymapcellt* %4, i64 %338
  %340 = getelementptr inbounds %struct.waymapcellt* %339, i32 0, i32 0
  %341 = load i16* %340, align 2
  %342 = zext i16 %341 to i32
  %343 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 27
  %344 = load i16* %343, align 2
  %345 = zext i16 %344 to i32
  %346 = icmp ne i32 %342, %345
  br i1 %346, label %347, label %382

; <label>:347                                     ; preds = %335
  %348 = sext i32 %337 to i64
  %349 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 17
  %350 = load i16** %349, align 8
  %351 = getelementptr inbounds i16* %350, i64 %348
  %352 = load i16* %351, align 2
  %353 = sext i16 %352 to i32
  %354 = icmp sgt i32 %353, 0
  br i1 %354, label %355, label %369

; <label>:355                                     ; preds = %347
  %356 = sext i32 %bound2l.14 to i64
  %357 = getelementptr inbounds i32* %bound2p, i64 %356
  store i32 %337, i32* %357, align 4
  %358 = add nsw i32 %bound2l.14, 1
  %359 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 27
  %360 = load i16* %359, align 2
  %361 = sext i32 %337 to i64
  %362 = getelementptr inbounds %struct.waymapcellt* %4, i64 %361
  %363 = getelementptr inbounds %struct.waymapcellt* %362, i32 0, i32 0
  store i16 %360, i16* %363, align 2
  %364 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 26
  %365 = load i16* %364, align 2
  %366 = sext i32 %337 to i64
  %367 = getelementptr inbounds %struct.waymapcellt* %4, i64 %366
  %368 = getelementptr inbounds %struct.waymapcellt* %367, i32 0, i32 1
  store i16 %365, i16* %368, align 2
  br label %381

; <label>:369                                     ; preds = %347
  %370 = sext i32 %337 to i64
  %371 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 17
  %372 = load i16** %371, align 8
  %373 = getelementptr inbounds i16* %372, i64 %370
  %374 = load i16* %373, align 2
  %375 = sext i16 %374 to i32
  %376 = icmp eq i32 %375, 0
  br i1 %376, label %377, label %380

; <label>:377                                     ; preds = %369
  %378 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 23
  store i8 1, i8* %378, align 1
  %379 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 25
  store i32 %337, i32* %379, align 4
  br label %394

; <label>:380                                     ; preds = %369
  br label %381

; <label>:381                                     ; preds = %380, %355
  %bound2l.15 = phi i32 [ %358, %355 ], [ %bound2l.14, %380 ]
  br label %382

; <label>:382                                     ; preds = %381, %335
  %bound2l.16 = phi i32 [ %bound2l.15, %381 ], [ %bound2l.14, %335 ]
  %383 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 21
  %384 = load i32* %383, align 4
  %385 = icmp sge i32 %bound2l.16, %384
  br i1 %385, label %386, label %390

; <label>:386                                     ; preds = %382
  %387 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 21
  %388 = load i32* %387, align 4
  %389 = sub nsw i32 %388, 1
  br label %390

; <label>:390                                     ; preds = %386, %382
  %bound2l.17 = phi i32 [ %389, %386 ], [ %bound2l.16, %382 ]
  br label %391

; <label>:391                                     ; preds = %390
  %392 = add nsw i32 %i.0, 1
  br label %5

; <label>:393                                     ; preds = %5
  br label %394

; <label>:394                                     ; preds = %393, %377, %330, %284, %237, %191, %145, %98, %52
  %.0 = phi i32 [ %bound2l.14, %377 ], [ %bound2l.12, %330 ], [ %bound2l.10, %284 ], [ %bound2l.8, %237 ], [ %bound2l.6, %191 ], [ %bound2l.4, %145 ], [ %bound2l.2, %98 ], [ %bound2l.0, %52 ], [ %bound2l.0, %393 ]
  ret i32 %.0
}

; Function Attrs: uwtable
define zeroext i1 @_ZN6wayobj13findfreepointEiiRiS0_(%class.wayobj* %this, i32 %startx, i32 %starty, i32* dereferenceable(4) %freepointx, i32* dereferenceable(4) %freepointy) #1 align 2 {
  %1 = call zeroext i1 @_ZN6wayobj5ismapEii(%class.wayobj* %this, i32 %startx, i32 %starty)
  br i1 %1, label %3, label %2

; <label>:2                                       ; preds = %0
  store i32 %startx, i32* %freepointx, align 4
  store i32 %starty, i32* %freepointy, align 4
  br label %97

; <label>:3                                       ; preds = %0
  %4 = call dereferenceable(2) i16* @_ZN6wayobj3mapEii(%class.wayobj* %this, i32 %startx, i32 %starty)
  %5 = load i16* %4
  %6 = sext i16 %5 to i32
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %3
  store i32 %startx, i32* %freepointx, align 4
  store i32 %starty, i32* %freepointy, align 4
  br label %97

; <label>:9                                       ; preds = %3
  %10 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 27
  %11 = load i16* %10, align 2
  %12 = zext i16 %11 to i32
  %13 = icmp eq i32 %12, 65535
  br i1 %13, label %14, label %27

; <label>:14                                      ; preds = %9
  %15 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 18
  %16 = load %struct.waymapcellt** %15, align 8
  %17 = bitcast %struct.waymapcellt* %16 to i8*
  %18 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 0
  %19 = load i32* %18, align 4
  %20 = shl i32 1, %19
  %21 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 1
  %22 = load i32* %21, align 4
  %23 = shl i32 %20, %22
  %24 = sext i32 %23 to i64
  %25 = mul i64 %24, 4
  call void @llvm.memset.p0i8.i64(i8* %17, i8 0, i64 %25, i32 2, i1 false)
  %26 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 27
  store i16 0, i16* %26, align 2
  br label %27

; <label>:27                                      ; preds = %14, %9
  %28 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 27
  %29 = load i16* %28, align 2
  %30 = add i16 %29, 1
  store i16 %30, i16* %28, align 2
  %31 = call i32 @_ZN6wayobj5indexEii(%class.wayobj* %this, i32 %startx, i32 %starty)
  %32 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 19
  %33 = load i32** %32, align 8
  %34 = getelementptr inbounds i32* %33, i64 0
  store i32 %31, i32* %34, align 4
  %35 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 27
  %36 = load i16* %35, align 2
  %37 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 2
  %38 = load i32* %37, align 4
  %39 = shl i32 %starty, %38
  %40 = or i32 %39, %startx
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 18
  %43 = load %struct.waymapcellt** %42, align 8
  %44 = getelementptr inbounds %struct.waymapcellt* %43, i64 %41
  %45 = getelementptr inbounds %struct.waymapcellt* %44, i32 0, i32 0
  store i16 %36, i16* %45, align 2
  %46 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 2
  %47 = load i32* %46, align 4
  %48 = shl i32 %starty, %47
  %49 = or i32 %48, %startx
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 18
  %52 = load %struct.waymapcellt** %51, align 8
  %53 = getelementptr inbounds %struct.waymapcellt* %52, i64 %50
  %54 = getelementptr inbounds %struct.waymapcellt* %53, i32 0, i32 1
  store i16 0, i16* %54, align 2
  %55 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 23
  store i8 0, i8* %55, align 1
  %56 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 26
  store i16 1, i16* %56, align 2
  br label %57

; <label>:57                                      ; preds = %83, %27
  %boundl.0 = phi i32 [ 1, %27 ], [ %boundl.1, %83 ]
  %flodd.0 = phi i8 [ 0, %27 ], [ %flodd.1, %83 ]
  %58 = icmp ne i32 %boundl.0, 0
  br i1 %58, label %59, label %65

; <label>:59                                      ; preds = %57
  %60 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 23
  %61 = load i8* %60, align 1
  %62 = trunc i8 %61 to i1
  %63 = zext i1 %62 to i32
  %64 = icmp eq i32 %63, 0
  br label %65

; <label>:65                                      ; preds = %59, %57
  %66 = phi i1 [ false, %57 ], [ %64, %59 ]
  br i1 %66, label %67, label %87

; <label>:67                                      ; preds = %65
  %68 = trunc i8 %flodd.0 to i1
  %69 = zext i1 %68 to i32
  %70 = icmp eq i32 %69, 0
  br i1 %70, label %71, label %77

; <label>:71                                      ; preds = %67
  %72 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 19
  %73 = load i32** %72, align 8
  %74 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 20
  %75 = load i32** %74, align 8
  %76 = call i32 @_ZN6wayobj18makeobstaclebound2EPiiS0_(%class.wayobj* %this, i32* %73, i32 %boundl.0, i32* %75)
  br label %83

; <label>:77                                      ; preds = %67
  %78 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 20
  %79 = load i32** %78, align 8
  %80 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 19
  %81 = load i32** %80, align 8
  %82 = call i32 @_ZN6wayobj18makeobstaclebound2EPiiS0_(%class.wayobj* %this, i32* %79, i32 %boundl.0, i32* %81)
  br label %83

; <label>:83                                      ; preds = %77, %71
  %boundl.1 = phi i32 [ %76, %71 ], [ %82, %77 ]
  %flodd.1 = phi i8 [ 1, %71 ], [ 0, %77 ]
  %84 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 26
  %85 = load i16* %84, align 2
  %86 = add i16 %85, 1
  store i16 %86, i16* %84, align 2
  br label %57

; <label>:87                                      ; preds = %65
  %88 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 25
  %89 = load i32* %88, align 4
  %90 = call i32 @_ZN6wayobj6indexxEi(%class.wayobj* %this, i32 %89)
  store i32 %90, i32* %freepointx, align 4
  %91 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 25
  %92 = load i32* %91, align 4
  %93 = call i32 @_ZN6wayobj6indexyEi(%class.wayobj* %this, i32 %92)
  store i32 %93, i32* %freepointy, align 4
  %94 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 23
  %95 = load i8* %94, align 1
  %96 = trunc i8 %95 to i1
  br label %97

; <label>:97                                      ; preds = %87, %8, %2
  %.0 = phi i1 [ true, %8 ], [ %96, %87 ], [ true, %2 ]
  ret i1 %.0
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr i32 @_ZN6wayobj6indexxEi(%class.wayobj* %this, i32 %index) #2 align 2 {
  %1 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 22
  %2 = load i32* %1, align 4
  %3 = and i32 %index, %2
  ret i32 %3
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr i32 @_ZN6wayobj6indexyEi(%class.wayobj* %this, i32 %index) #2 align 2 {
  %1 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 2
  %2 = load i32* %1, align 4
  %3 = ashr i32 %index, %2
  ret i32 %3
}

; Function Attrs: uwtable
define zeroext i1 @_ZN6wayobj13findfreepointEffRfS0_(%class.wayobj* %this, float %startx, float %starty, float* dereferenceable(4) %freepointx, float* dereferenceable(4) %freepointy) #1 align 2 {
  %freex = alloca i32, align 4
  %freey = alloca i32, align 4
  %1 = call i32 @_ZN6wayobj4getxEf(%class.wayobj* %this, float %startx)
  %2 = call i32 @_ZN6wayobj4getyEf(%class.wayobj* %this, float %starty)
  %3 = call zeroext i1 @_ZN6wayobj13findfreepointEiiRiS0_(%class.wayobj* %this, i32 %1, i32 %2, i32* dereferenceable(4) %freex, i32* dereferenceable(4) %freey)
  %4 = zext i1 %3 to i8
  %5 = load i32* %freex, align 4
  %6 = call float @_ZN6wayobj9getxcoordEi(%class.wayobj* %this, i32 %5)
  store float %6, float* %freepointx, align 4
  %7 = load i32* %freey, align 4
  %8 = call float @_ZN6wayobj9getycoordEi(%class.wayobj* %this, i32 %7)
  store float %8, float* %freepointy, align 4
  %9 = trunc i8 %4 to i1
  ret i1 %9
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr float @_ZN6wayobj9getxcoordEi(%class.wayobj* %this, i32 %x) #2 align 2 {
  %1 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 14
  %2 = getelementptr inbounds %struct.createwaymnginfot* %1, i32 0, i32 0
  %3 = load float* %2, align 4
  %4 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 13
  %5 = load float* %4, align 4
  %6 = fadd float %3, %5
  %7 = sitofp i32 %x to float
  %8 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 14
  %9 = getelementptr inbounds %struct.createwaymnginfot* %8, i32 0, i32 1
  %10 = load float* %9, align 4
  %11 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 14
  %12 = getelementptr inbounds %struct.createwaymnginfot* %11, i32 0, i32 0
  %13 = load float* %12, align 4
  %14 = fsub float %10, %13
  %15 = fmul float %7, %14
  %16 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 7
  %17 = load i32* %16, align 4
  %18 = sitofp i32 %17 to float
  %19 = fdiv float %15, %18
  %20 = fadd float %6, %19
  ret float %20
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr float @_ZN6wayobj9getycoordEi(%class.wayobj* %this, i32 %y) #2 align 2 {
  %1 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 14
  %2 = getelementptr inbounds %struct.createwaymnginfot* %1, i32 0, i32 2
  %3 = load float* %2, align 4
  %4 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 13
  %5 = load float* %4, align 4
  %6 = fadd float %3, %5
  %7 = sitofp i32 %y to float
  %8 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 14
  %9 = getelementptr inbounds %struct.createwaymnginfot* %8, i32 0, i32 3
  %10 = load float* %9, align 4
  %11 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 14
  %12 = getelementptr inbounds %struct.createwaymnginfot* %11, i32 0, i32 2
  %13 = load float* %12, align 4
  %14 = fsub float %10, %13
  %15 = fmul float %7, %14
  %16 = getelementptr inbounds %class.wayobj* %this, i32 0, i32 8
  %17 = load i32* %16, align 4
  %18 = sitofp i32 %17 to float
  %19 = fdiv float %15, %18
  %20 = fadd float %6, %19
  ret float %20
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { inlinehint nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
