; ModuleID = 'Way_.cpp'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%class.wayobj = type <{ i32, i32, i32, i32, i32, i32, i32, i32, i32, float, float, float, float, float, %struct.createwaymnginfot, %struct.createwayinfot, [4 x i8], i16*, %struct.waymapcellt*, i32*, i32*, i32, i32, i8, [3 x i8], i32, i16, i16, [4 x i8] }>
%struct.createwaymnginfot = type { float, float, float, float, i32, i32, float, float }
%struct.createwayinfot = type <{ %class.rvectort, %class.rvectort, i8, [3 x i8] }>
%class.rvectort = type { float, float, float }
%struct.waymapcellt = type { i16, i16 }

; Function Attrs: nounwind uwtable
define zeroext i1 @_ZN6wayobj5ismapEii(%class.wayobj* %this, i32 %x, i32 %y) #0 align 2 {
  %1 = alloca i1, align 1
  %2 = alloca %class.wayobj*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store %class.wayobj* %this, %class.wayobj** %2, align 8
  store i32 %x, i32* %3, align 4
  store i32 %y, i32* %4, align 4
  %5 = load %class.wayobj** %2
  %6 = load i32* %3, align 4
  %7 = icmp slt i32 %6, 1
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %0
  store i1 false, i1* %1
  br label %26

; <label>:9                                       ; preds = %0
  %10 = load i32* %4, align 4
  %11 = icmp slt i32 %10, 1
  br i1 %11, label %12, label %13

; <label>:12                                      ; preds = %9
  store i1 false, i1* %1
  br label %26

; <label>:13                                      ; preds = %9
  %14 = load i32* %3, align 4
  %15 = getelementptr inbounds %class.wayobj* %5, i32 0, i32 5
  %16 = load i32* %15, align 4
  %17 = icmp sgt i32 %14, %16
  br i1 %17, label %18, label %19

; <label>:18                                      ; preds = %13
  store i1 false, i1* %1
  br label %26

; <label>:19                                      ; preds = %13
  %20 = load i32* %4, align 4
  %21 = getelementptr inbounds %class.wayobj* %5, i32 0, i32 6
  %22 = load i32* %21, align 4
  %23 = icmp sgt i32 %20, %22
  br i1 %23, label %24, label %25

; <label>:24                                      ; preds = %19
  store i1 false, i1* %1
  br label %26

; <label>:25                                      ; preds = %19
  store i1 true, i1* %1
  br label %26

; <label>:26                                      ; preds = %25, %24, %18, %12, %8
  %27 = load i1* %1
  ret i1 %27
}

; Function Attrs: uwtable
define zeroext i1 @_ZN6wayobj10ismoveableEff(%class.wayobj* %this, float %x, float %y) #1 align 2 {
  %1 = alloca i1, align 1
  %2 = alloca %class.wayobj*, align 8
  %3 = alloca float, align 4
  %4 = alloca float, align 4
  %mapx = alloca i32, align 4
  %mapy = alloca i32, align 4
  store %class.wayobj* %this, %class.wayobj** %2, align 8
  store float %x, float* %3, align 4
  store float %y, float* %4, align 4
  %5 = load %class.wayobj** %2
  %6 = load float* %3, align 4
  %7 = call i32 @_ZN6wayobj4getxEf(%class.wayobj* %5, float %6)
  store i32 %7, i32* %mapx, align 4
  %8 = load float* %4, align 4
  %9 = call i32 @_ZN6wayobj4getyEf(%class.wayobj* %5, float %8)
  store i32 %9, i32* %mapy, align 4
  %10 = load i32* %mapx, align 4
  %11 = load i32* %mapy, align 4
  %12 = call zeroext i1 @_ZN6wayobj5ismapEii(%class.wayobj* %5, i32 %10, i32 %11)
  br i1 %12, label %14, label %13

; <label>:13                                      ; preds = %0
  store i1 false, i1* %1
  br label %22

; <label>:14                                      ; preds = %0
  %15 = load i32* %mapx, align 4
  %16 = load i32* %mapy, align 4
  %17 = call dereferenceable(2) i16* @_ZN6wayobj3mapEii(%class.wayobj* %5, i32 %15, i32 %16)
  %18 = load i16* %17
  %19 = icmp ne i16 %18, 0
  br i1 %19, label %20, label %21

; <label>:20                                      ; preds = %14
  store i1 false, i1* %1
  br label %22

; <label>:21                                      ; preds = %14
  store i1 true, i1* %1
  br label %22

; <label>:22                                      ; preds = %21, %20, %13
  %23 = load i1* %1
  ret i1 %23
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr i32 @_ZN6wayobj4getxEf(%class.wayobj* %this, float %x) #2 align 2 {
  %1 = alloca %class.wayobj*, align 8
  %2 = alloca float, align 4
  store %class.wayobj* %this, %class.wayobj** %1, align 8
  store float %x, float* %2, align 4
  %3 = load %class.wayobj** %1
  %4 = load float* %2, align 4
  %5 = getelementptr inbounds %class.wayobj* %3, i32 0, i32 9
  %6 = load float* %5, align 4
  %7 = fmul float %4, %6
  %8 = getelementptr inbounds %class.wayobj* %3, i32 0, i32 10
  %9 = load float* %8, align 4
  %10 = fadd float %7, %9
  %11 = fptosi float %10 to i32
  ret i32 %11
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr i32 @_ZN6wayobj4getyEf(%class.wayobj* %this, float %y) #2 align 2 {
  %1 = alloca %class.wayobj*, align 8
  %2 = alloca float, align 4
  store %class.wayobj* %this, %class.wayobj** %1, align 8
  store float %y, float* %2, align 4
  %3 = load %class.wayobj** %1
  %4 = load float* %2, align 4
  %5 = getelementptr inbounds %class.wayobj* %3, i32 0, i32 11
  %6 = load float* %5, align 4
  %7 = fmul float %4, %6
  %8 = getelementptr inbounds %class.wayobj* %3, i32 0, i32 12
  %9 = load float* %8, align 4
  %10 = fadd float %7, %9
  %11 = fptosi float %10 to i32
  ret i32 %11
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dereferenceable(2) i16* @_ZN6wayobj3mapEii(%class.wayobj* %this, i32 %x, i32 %y) #2 align 2 {
  %1 = alloca %class.wayobj*, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store %class.wayobj* %this, %class.wayobj** %1, align 8
  store i32 %x, i32* %2, align 4
  store i32 %y, i32* %3, align 4
  %4 = load %class.wayobj** %1
  %5 = load i32* %3, align 4
  %6 = getelementptr inbounds %class.wayobj* %4, i32 0, i32 2
  %7 = load i32* %6, align 4
  %8 = shl i32 %5, %7
  %9 = load i32* %2, align 4
  %10 = or i32 %8, %9
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds %class.wayobj* %4, i32 0, i32 17
  %13 = load i16** %12, align 8
  %14 = getelementptr inbounds i16* %13, i64 %11
  ret i16* %14
}

; Function Attrs: uwtable
define { <2 x float>, float } @_ZN6wayobj8getpointEi(%class.wayobj* %this, i32 %index) #1 align 2 {
  %1 = alloca %class.rvectort, align 4
  %2 = alloca %class.wayobj*, align 8
  %3 = alloca i32, align 4
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  %4 = alloca { <2 x float>, float }
  store %class.wayobj* %this, %class.wayobj** %2, align 8
  store i32 %index, i32* %3, align 4
  %5 = load %class.wayobj** %2
  call void @_ZN8rvectortC2Ev(%class.rvectort* %1)
  %6 = load i32* %3, align 4
  %7 = getelementptr inbounds %class.wayobj* %5, i32 0, i32 22
  %8 = load i32* %7, align 4
  %9 = and i32 %6, %8
  store i32 %9, i32* %x, align 4
  %10 = load i32* %3, align 4
  %11 = getelementptr inbounds %class.wayobj* %5, i32 0, i32 2
  %12 = load i32* %11, align 4
  %13 = ashr i32 %10, %12
  store i32 %13, i32* %y, align 4
  %14 = getelementptr inbounds %class.wayobj* %5, i32 0, i32 14
  %15 = getelementptr inbounds %struct.createwaymnginfot* %14, i32 0, i32 0
  %16 = load float* %15, align 4
  %17 = getelementptr inbounds %class.wayobj* %5, i32 0, i32 13
  %18 = load float* %17, align 4
  %19 = fadd float %16, %18
  %20 = load i32* %x, align 4
  %21 = sitofp i32 %20 to float
  %22 = getelementptr inbounds %class.wayobj* %5, i32 0, i32 14
  %23 = getelementptr inbounds %struct.createwaymnginfot* %22, i32 0, i32 1
  %24 = load float* %23, align 4
  %25 = getelementptr inbounds %class.wayobj* %5, i32 0, i32 14
  %26 = getelementptr inbounds %struct.createwaymnginfot* %25, i32 0, i32 0
  %27 = load float* %26, align 4
  %28 = fsub float %24, %27
  %29 = fmul float %21, %28
  %30 = getelementptr inbounds %class.wayobj* %5, i32 0, i32 7
  %31 = load i32* %30, align 4
  %32 = sitofp i32 %31 to float
  %33 = fdiv float %29, %32
  %34 = fadd float %19, %33
  %35 = getelementptr inbounds %class.rvectort* %1, i32 0, i32 0
  store float %34, float* %35, align 4
  %36 = getelementptr inbounds %class.rvectort* %1, i32 0, i32 1
  store float 0.000000e+00, float* %36, align 4
  %37 = getelementptr inbounds %class.wayobj* %5, i32 0, i32 14
  %38 = getelementptr inbounds %struct.createwaymnginfot* %37, i32 0, i32 2
  %39 = load float* %38, align 4
  %40 = getelementptr inbounds %class.wayobj* %5, i32 0, i32 13
  %41 = load float* %40, align 4
  %42 = fadd float %39, %41
  %43 = load i32* %y, align 4
  %44 = sitofp i32 %43 to float
  %45 = getelementptr inbounds %class.wayobj* %5, i32 0, i32 14
  %46 = getelementptr inbounds %struct.createwaymnginfot* %45, i32 0, i32 3
  %47 = load float* %46, align 4
  %48 = getelementptr inbounds %class.wayobj* %5, i32 0, i32 14
  %49 = getelementptr inbounds %struct.createwaymnginfot* %48, i32 0, i32 2
  %50 = load float* %49, align 4
  %51 = fsub float %47, %50
  %52 = fmul float %44, %51
  %53 = getelementptr inbounds %class.wayobj* %5, i32 0, i32 8
  %54 = load i32* %53, align 4
  %55 = sitofp i32 %54 to float
  %56 = fdiv float %52, %55
  %57 = fadd float %42, %56
  %58 = getelementptr inbounds %class.rvectort* %1, i32 0, i32 2
  store float %57, float* %58, align 4
  %59 = bitcast { <2 x float>, float }* %4 to i8*
  %60 = bitcast %class.rvectort* %1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %59, i8* %60, i64 12, i32 1, i1 false)
  %61 = load { <2 x float>, float }* %4
  ret { <2 x float>, float } %61
}

; Function Attrs: nounwind uwtable
define linkonce_odr void @_ZN8rvectortC2Ev(%class.rvectort* %this) unnamed_addr #0 align 2 {
  %1 = alloca %class.rvectort*, align 8
  store %class.rvectort* %this, %class.rvectort** %1, align 8
  %2 = load %class.rvectort** %1
  ret void
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #3

; Function Attrs: nounwind uwtable
define i32 @_ZN6wayobj10makebound2EPiiS0_(%class.wayobj* %this, i32* %bound1p, i32 %bound1l, i32* %bound2p) #0 align 2 {
  %1 = alloca i32, align 4
  %2 = alloca %class.wayobj*, align 8
  %3 = alloca i32*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32*, align 8
  %bound2l = alloca i32, align 4
  %index = alloca i32, align 4
  %index1 = alloca i32, align 4
  %yoffset = alloca i32, align 4
  %waymap = alloca %struct.waymapcellt*, align 8
  %i = alloca i32, align 4
  store %class.wayobj* %this, %class.wayobj** %2, align 8
  store i32* %bound1p, i32** %3, align 8
  store i32 %bound1l, i32* %4, align 4
  store i32* %bound2p, i32** %5, align 8
  %6 = load %class.wayobj** %2
  %7 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 8
  %8 = load i32* %7, align 4
  store i32 %8, i32* %yoffset, align 4
  %9 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 18
  %10 = load %struct.waymapcellt** %9, align 8
  store %struct.waymapcellt* %10, %struct.waymapcellt** %waymap, align 8
  store i32 0, i32* %bound2l, align 4
  store i32 0, i32* %i, align 4
  br label %11

; <label>:11                                      ; preds = %472, %0
  %12 = load i32* %i, align 4
  %13 = load i32* %4, align 4
  %14 = icmp slt i32 %12, %13
  br i1 %14, label %15, label %475

; <label>:15                                      ; preds = %11
  %16 = load i32* %i, align 4
  %17 = sext i32 %16 to i64
  %18 = load i32** %3, align 8
  %19 = getelementptr inbounds i32* %18, i64 %17
  %20 = load i32* %19, align 4
  store i32 %20, i32* %index, align 4
  %21 = load i32* %index, align 4
  %22 = load i32* %yoffset, align 4
  %23 = sub nsw i32 %21, %22
  %24 = sub nsw i32 %23, 1
  store i32 %24, i32* %index1, align 4
  %25 = load i32* %index1, align 4
  %26 = sext i32 %25 to i64
  %27 = load %struct.waymapcellt** %waymap, align 8
  %28 = getelementptr inbounds %struct.waymapcellt* %27, i64 %26
  %29 = getelementptr inbounds %struct.waymapcellt* %28, i32 0, i32 0
  %30 = load i16* %29, align 2
  %31 = zext i16 %30 to i32
  %32 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 27
  %33 = load i16* %32, align 2
  %34 = zext i16 %33 to i32
  %35 = icmp ne i32 %31, %34
  br i1 %35, label %36, label %76

; <label>:36                                      ; preds = %15
  %37 = load i32* %index1, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 17
  %40 = load i16** %39, align 8
  %41 = getelementptr inbounds i16* %40, i64 %38
  %42 = load i16* %41, align 2
  %43 = sext i16 %42 to i32
  %44 = icmp eq i32 %43, 0
  br i1 %44, label %45, label %75

; <label>:45                                      ; preds = %36
  %46 = load i32* %index1, align 4
  %47 = load i32* %bound2l, align 4
  %48 = sext i32 %47 to i64
  %49 = load i32** %5, align 8
  %50 = getelementptr inbounds i32* %49, i64 %48
  store i32 %46, i32* %50, align 4
  %51 = load i32* %bound2l, align 4
  %52 = add nsw i32 %51, 1
  store i32 %52, i32* %bound2l, align 4
  %53 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 27
  %54 = load i16* %53, align 2
  %55 = load i32* %index1, align 4
  %56 = sext i32 %55 to i64
  %57 = load %struct.waymapcellt** %waymap, align 8
  %58 = getelementptr inbounds %struct.waymapcellt* %57, i64 %56
  %59 = getelementptr inbounds %struct.waymapcellt* %58, i32 0, i32 0
  store i16 %54, i16* %59, align 2
  %60 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 26
  %61 = load i16* %60, align 2
  %62 = load i32* %index1, align 4
  %63 = sext i32 %62 to i64
  %64 = load %struct.waymapcellt** %waymap, align 8
  %65 = getelementptr inbounds %struct.waymapcellt* %64, i64 %63
  %66 = getelementptr inbounds %struct.waymapcellt* %65, i32 0, i32 1
  store i16 %61, i16* %66, align 2
  %67 = load i32* %index1, align 4
  %68 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 25
  %69 = load i32* %68, align 4
  %70 = icmp eq i32 %67, %69
  br i1 %70, label %71, label %74

; <label>:71                                      ; preds = %45
  %72 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 23
  store i8 1, i8* %72, align 1
  %73 = load i32* %bound2l, align 4
  store i32 %73, i32* %1
  br label %477

; <label>:74                                      ; preds = %45
  br label %75

; <label>:75                                      ; preds = %74, %36
  br label %76

; <label>:76                                      ; preds = %75, %15
  %77 = load i32* %index, align 4
  %78 = load i32* %yoffset, align 4
  %79 = sub nsw i32 %77, %78
  store i32 %79, i32* %index1, align 4
  %80 = load i32* %index1, align 4
  %81 = sext i32 %80 to i64
  %82 = load %struct.waymapcellt** %waymap, align 8
  %83 = getelementptr inbounds %struct.waymapcellt* %82, i64 %81
  %84 = getelementptr inbounds %struct.waymapcellt* %83, i32 0, i32 0
  %85 = load i16* %84, align 2
  %86 = zext i16 %85 to i32
  %87 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 27
  %88 = load i16* %87, align 2
  %89 = zext i16 %88 to i32
  %90 = icmp ne i32 %86, %89
  br i1 %90, label %91, label %131

; <label>:91                                      ; preds = %76
  %92 = load i32* %index1, align 4
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 17
  %95 = load i16** %94, align 8
  %96 = getelementptr inbounds i16* %95, i64 %93
  %97 = load i16* %96, align 2
  %98 = sext i16 %97 to i32
  %99 = icmp eq i32 %98, 0
  br i1 %99, label %100, label %130

; <label>:100                                     ; preds = %91
  %101 = load i32* %index1, align 4
  %102 = load i32* %bound2l, align 4
  %103 = sext i32 %102 to i64
  %104 = load i32** %5, align 8
  %105 = getelementptr inbounds i32* %104, i64 %103
  store i32 %101, i32* %105, align 4
  %106 = load i32* %bound2l, align 4
  %107 = add nsw i32 %106, 1
  store i32 %107, i32* %bound2l, align 4
  %108 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 27
  %109 = load i16* %108, align 2
  %110 = load i32* %index1, align 4
  %111 = sext i32 %110 to i64
  %112 = load %struct.waymapcellt** %waymap, align 8
  %113 = getelementptr inbounds %struct.waymapcellt* %112, i64 %111
  %114 = getelementptr inbounds %struct.waymapcellt* %113, i32 0, i32 0
  store i16 %109, i16* %114, align 2
  %115 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 26
  %116 = load i16* %115, align 2
  %117 = load i32* %index1, align 4
  %118 = sext i32 %117 to i64
  %119 = load %struct.waymapcellt** %waymap, align 8
  %120 = getelementptr inbounds %struct.waymapcellt* %119, i64 %118
  %121 = getelementptr inbounds %struct.waymapcellt* %120, i32 0, i32 1
  store i16 %116, i16* %121, align 2
  %122 = load i32* %index1, align 4
  %123 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 25
  %124 = load i32* %123, align 4
  %125 = icmp eq i32 %122, %124
  br i1 %125, label %126, label %129

; <label>:126                                     ; preds = %100
  %127 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 23
  store i8 1, i8* %127, align 1
  %128 = load i32* %bound2l, align 4
  store i32 %128, i32* %1
  br label %477

; <label>:129                                     ; preds = %100
  br label %130

; <label>:130                                     ; preds = %129, %91
  br label %131

; <label>:131                                     ; preds = %130, %76
  %132 = load i32* %index, align 4
  %133 = load i32* %yoffset, align 4
  %134 = sub nsw i32 %132, %133
  %135 = add nsw i32 %134, 1
  store i32 %135, i32* %index1, align 4
  %136 = load i32* %index1, align 4
  %137 = sext i32 %136 to i64
  %138 = load %struct.waymapcellt** %waymap, align 8
  %139 = getelementptr inbounds %struct.waymapcellt* %138, i64 %137
  %140 = getelementptr inbounds %struct.waymapcellt* %139, i32 0, i32 0
  %141 = load i16* %140, align 2
  %142 = zext i16 %141 to i32
  %143 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 27
  %144 = load i16* %143, align 2
  %145 = zext i16 %144 to i32
  %146 = icmp ne i32 %142, %145
  br i1 %146, label %147, label %187

; <label>:147                                     ; preds = %131
  %148 = load i32* %index1, align 4
  %149 = sext i32 %148 to i64
  %150 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 17
  %151 = load i16** %150, align 8
  %152 = getelementptr inbounds i16* %151, i64 %149
  %153 = load i16* %152, align 2
  %154 = sext i16 %153 to i32
  %155 = icmp eq i32 %154, 0
  br i1 %155, label %156, label %186

; <label>:156                                     ; preds = %147
  %157 = load i32* %index1, align 4
  %158 = load i32* %bound2l, align 4
  %159 = sext i32 %158 to i64
  %160 = load i32** %5, align 8
  %161 = getelementptr inbounds i32* %160, i64 %159
  store i32 %157, i32* %161, align 4
  %162 = load i32* %bound2l, align 4
  %163 = add nsw i32 %162, 1
  store i32 %163, i32* %bound2l, align 4
  %164 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 27
  %165 = load i16* %164, align 2
  %166 = load i32* %index1, align 4
  %167 = sext i32 %166 to i64
  %168 = load %struct.waymapcellt** %waymap, align 8
  %169 = getelementptr inbounds %struct.waymapcellt* %168, i64 %167
  %170 = getelementptr inbounds %struct.waymapcellt* %169, i32 0, i32 0
  store i16 %165, i16* %170, align 2
  %171 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 26
  %172 = load i16* %171, align 2
  %173 = load i32* %index1, align 4
  %174 = sext i32 %173 to i64
  %175 = load %struct.waymapcellt** %waymap, align 8
  %176 = getelementptr inbounds %struct.waymapcellt* %175, i64 %174
  %177 = getelementptr inbounds %struct.waymapcellt* %176, i32 0, i32 1
  store i16 %172, i16* %177, align 2
  %178 = load i32* %index1, align 4
  %179 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 25
  %180 = load i32* %179, align 4
  %181 = icmp eq i32 %178, %180
  br i1 %181, label %182, label %185

; <label>:182                                     ; preds = %156
  %183 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 23
  store i8 1, i8* %183, align 1
  %184 = load i32* %bound2l, align 4
  store i32 %184, i32* %1
  br label %477

; <label>:185                                     ; preds = %156
  br label %186

; <label>:186                                     ; preds = %185, %147
  br label %187

; <label>:187                                     ; preds = %186, %131
  %188 = load i32* %index, align 4
  %189 = sub nsw i32 %188, 1
  store i32 %189, i32* %index1, align 4
  %190 = load i32* %index1, align 4
  %191 = sext i32 %190 to i64
  %192 = load %struct.waymapcellt** %waymap, align 8
  %193 = getelementptr inbounds %struct.waymapcellt* %192, i64 %191
  %194 = getelementptr inbounds %struct.waymapcellt* %193, i32 0, i32 0
  %195 = load i16* %194, align 2
  %196 = zext i16 %195 to i32
  %197 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 27
  %198 = load i16* %197, align 2
  %199 = zext i16 %198 to i32
  %200 = icmp ne i32 %196, %199
  br i1 %200, label %201, label %241

; <label>:201                                     ; preds = %187
  %202 = load i32* %index1, align 4
  %203 = sext i32 %202 to i64
  %204 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 17
  %205 = load i16** %204, align 8
  %206 = getelementptr inbounds i16* %205, i64 %203
  %207 = load i16* %206, align 2
  %208 = sext i16 %207 to i32
  %209 = icmp eq i32 %208, 0
  br i1 %209, label %210, label %240

; <label>:210                                     ; preds = %201
  %211 = load i32* %index1, align 4
  %212 = load i32* %bound2l, align 4
  %213 = sext i32 %212 to i64
  %214 = load i32** %5, align 8
  %215 = getelementptr inbounds i32* %214, i64 %213
  store i32 %211, i32* %215, align 4
  %216 = load i32* %bound2l, align 4
  %217 = add nsw i32 %216, 1
  store i32 %217, i32* %bound2l, align 4
  %218 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 27
  %219 = load i16* %218, align 2
  %220 = load i32* %index1, align 4
  %221 = sext i32 %220 to i64
  %222 = load %struct.waymapcellt** %waymap, align 8
  %223 = getelementptr inbounds %struct.waymapcellt* %222, i64 %221
  %224 = getelementptr inbounds %struct.waymapcellt* %223, i32 0, i32 0
  store i16 %219, i16* %224, align 2
  %225 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 26
  %226 = load i16* %225, align 2
  %227 = load i32* %index1, align 4
  %228 = sext i32 %227 to i64
  %229 = load %struct.waymapcellt** %waymap, align 8
  %230 = getelementptr inbounds %struct.waymapcellt* %229, i64 %228
  %231 = getelementptr inbounds %struct.waymapcellt* %230, i32 0, i32 1
  store i16 %226, i16* %231, align 2
  %232 = load i32* %index1, align 4
  %233 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 25
  %234 = load i32* %233, align 4
  %235 = icmp eq i32 %232, %234
  br i1 %235, label %236, label %239

; <label>:236                                     ; preds = %210
  %237 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 23
  store i8 1, i8* %237, align 1
  %238 = load i32* %bound2l, align 4
  store i32 %238, i32* %1
  br label %477

; <label>:239                                     ; preds = %210
  br label %240

; <label>:240                                     ; preds = %239, %201
  br label %241

; <label>:241                                     ; preds = %240, %187
  %242 = load i32* %index, align 4
  %243 = add nsw i32 %242, 1
  store i32 %243, i32* %index1, align 4
  %244 = load i32* %index1, align 4
  %245 = sext i32 %244 to i64
  %246 = load %struct.waymapcellt** %waymap, align 8
  %247 = getelementptr inbounds %struct.waymapcellt* %246, i64 %245
  %248 = getelementptr inbounds %struct.waymapcellt* %247, i32 0, i32 0
  %249 = load i16* %248, align 2
  %250 = zext i16 %249 to i32
  %251 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 27
  %252 = load i16* %251, align 2
  %253 = zext i16 %252 to i32
  %254 = icmp ne i32 %250, %253
  br i1 %254, label %255, label %295

; <label>:255                                     ; preds = %241
  %256 = load i32* %index1, align 4
  %257 = sext i32 %256 to i64
  %258 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 17
  %259 = load i16** %258, align 8
  %260 = getelementptr inbounds i16* %259, i64 %257
  %261 = load i16* %260, align 2
  %262 = sext i16 %261 to i32
  %263 = icmp eq i32 %262, 0
  br i1 %263, label %264, label %294

; <label>:264                                     ; preds = %255
  %265 = load i32* %index1, align 4
  %266 = load i32* %bound2l, align 4
  %267 = sext i32 %266 to i64
  %268 = load i32** %5, align 8
  %269 = getelementptr inbounds i32* %268, i64 %267
  store i32 %265, i32* %269, align 4
  %270 = load i32* %bound2l, align 4
  %271 = add nsw i32 %270, 1
  store i32 %271, i32* %bound2l, align 4
  %272 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 27
  %273 = load i16* %272, align 2
  %274 = load i32* %index1, align 4
  %275 = sext i32 %274 to i64
  %276 = load %struct.waymapcellt** %waymap, align 8
  %277 = getelementptr inbounds %struct.waymapcellt* %276, i64 %275
  %278 = getelementptr inbounds %struct.waymapcellt* %277, i32 0, i32 0
  store i16 %273, i16* %278, align 2
  %279 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 26
  %280 = load i16* %279, align 2
  %281 = load i32* %index1, align 4
  %282 = sext i32 %281 to i64
  %283 = load %struct.waymapcellt** %waymap, align 8
  %284 = getelementptr inbounds %struct.waymapcellt* %283, i64 %282
  %285 = getelementptr inbounds %struct.waymapcellt* %284, i32 0, i32 1
  store i16 %280, i16* %285, align 2
  %286 = load i32* %index1, align 4
  %287 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 25
  %288 = load i32* %287, align 4
  %289 = icmp eq i32 %286, %288
  br i1 %289, label %290, label %293

; <label>:290                                     ; preds = %264
  %291 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 23
  store i8 1, i8* %291, align 1
  %292 = load i32* %bound2l, align 4
  store i32 %292, i32* %1
  br label %477

; <label>:293                                     ; preds = %264
  br label %294

; <label>:294                                     ; preds = %293, %255
  br label %295

; <label>:295                                     ; preds = %294, %241
  %296 = load i32* %index, align 4
  %297 = load i32* %yoffset, align 4
  %298 = add nsw i32 %296, %297
  %299 = sub nsw i32 %298, 1
  store i32 %299, i32* %index1, align 4
  %300 = load i32* %index1, align 4
  %301 = sext i32 %300 to i64
  %302 = load %struct.waymapcellt** %waymap, align 8
  %303 = getelementptr inbounds %struct.waymapcellt* %302, i64 %301
  %304 = getelementptr inbounds %struct.waymapcellt* %303, i32 0, i32 0
  %305 = load i16* %304, align 2
  %306 = zext i16 %305 to i32
  %307 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 27
  %308 = load i16* %307, align 2
  %309 = zext i16 %308 to i32
  %310 = icmp ne i32 %306, %309
  br i1 %310, label %311, label %351

; <label>:311                                     ; preds = %295
  %312 = load i32* %index1, align 4
  %313 = sext i32 %312 to i64
  %314 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 17
  %315 = load i16** %314, align 8
  %316 = getelementptr inbounds i16* %315, i64 %313
  %317 = load i16* %316, align 2
  %318 = sext i16 %317 to i32
  %319 = icmp eq i32 %318, 0
  br i1 %319, label %320, label %350

; <label>:320                                     ; preds = %311
  %321 = load i32* %index1, align 4
  %322 = load i32* %bound2l, align 4
  %323 = sext i32 %322 to i64
  %324 = load i32** %5, align 8
  %325 = getelementptr inbounds i32* %324, i64 %323
  store i32 %321, i32* %325, align 4
  %326 = load i32* %bound2l, align 4
  %327 = add nsw i32 %326, 1
  store i32 %327, i32* %bound2l, align 4
  %328 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 27
  %329 = load i16* %328, align 2
  %330 = load i32* %index1, align 4
  %331 = sext i32 %330 to i64
  %332 = load %struct.waymapcellt** %waymap, align 8
  %333 = getelementptr inbounds %struct.waymapcellt* %332, i64 %331
  %334 = getelementptr inbounds %struct.waymapcellt* %333, i32 0, i32 0
  store i16 %329, i16* %334, align 2
  %335 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 26
  %336 = load i16* %335, align 2
  %337 = load i32* %index1, align 4
  %338 = sext i32 %337 to i64
  %339 = load %struct.waymapcellt** %waymap, align 8
  %340 = getelementptr inbounds %struct.waymapcellt* %339, i64 %338
  %341 = getelementptr inbounds %struct.waymapcellt* %340, i32 0, i32 1
  store i16 %336, i16* %341, align 2
  %342 = load i32* %index1, align 4
  %343 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 25
  %344 = load i32* %343, align 4
  %345 = icmp eq i32 %342, %344
  br i1 %345, label %346, label %349

; <label>:346                                     ; preds = %320
  %347 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 23
  store i8 1, i8* %347, align 1
  %348 = load i32* %bound2l, align 4
  store i32 %348, i32* %1
  br label %477

; <label>:349                                     ; preds = %320
  br label %350

; <label>:350                                     ; preds = %349, %311
  br label %351

; <label>:351                                     ; preds = %350, %295
  %352 = load i32* %index, align 4
  %353 = load i32* %yoffset, align 4
  %354 = add nsw i32 %352, %353
  store i32 %354, i32* %index1, align 4
  %355 = load i32* %index1, align 4
  %356 = sext i32 %355 to i64
  %357 = load %struct.waymapcellt** %waymap, align 8
  %358 = getelementptr inbounds %struct.waymapcellt* %357, i64 %356
  %359 = getelementptr inbounds %struct.waymapcellt* %358, i32 0, i32 0
  %360 = load i16* %359, align 2
  %361 = zext i16 %360 to i32
  %362 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 27
  %363 = load i16* %362, align 2
  %364 = zext i16 %363 to i32
  %365 = icmp ne i32 %361, %364
  br i1 %365, label %366, label %406

; <label>:366                                     ; preds = %351
  %367 = load i32* %index1, align 4
  %368 = sext i32 %367 to i64
  %369 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 17
  %370 = load i16** %369, align 8
  %371 = getelementptr inbounds i16* %370, i64 %368
  %372 = load i16* %371, align 2
  %373 = sext i16 %372 to i32
  %374 = icmp eq i32 %373, 0
  br i1 %374, label %375, label %405

; <label>:375                                     ; preds = %366
  %376 = load i32* %index1, align 4
  %377 = load i32* %bound2l, align 4
  %378 = sext i32 %377 to i64
  %379 = load i32** %5, align 8
  %380 = getelementptr inbounds i32* %379, i64 %378
  store i32 %376, i32* %380, align 4
  %381 = load i32* %bound2l, align 4
  %382 = add nsw i32 %381, 1
  store i32 %382, i32* %bound2l, align 4
  %383 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 27
  %384 = load i16* %383, align 2
  %385 = load i32* %index1, align 4
  %386 = sext i32 %385 to i64
  %387 = load %struct.waymapcellt** %waymap, align 8
  %388 = getelementptr inbounds %struct.waymapcellt* %387, i64 %386
  %389 = getelementptr inbounds %struct.waymapcellt* %388, i32 0, i32 0
  store i16 %384, i16* %389, align 2
  %390 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 26
  %391 = load i16* %390, align 2
  %392 = load i32* %index1, align 4
  %393 = sext i32 %392 to i64
  %394 = load %struct.waymapcellt** %waymap, align 8
  %395 = getelementptr inbounds %struct.waymapcellt* %394, i64 %393
  %396 = getelementptr inbounds %struct.waymapcellt* %395, i32 0, i32 1
  store i16 %391, i16* %396, align 2
  %397 = load i32* %index1, align 4
  %398 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 25
  %399 = load i32* %398, align 4
  %400 = icmp eq i32 %397, %399
  br i1 %400, label %401, label %404

; <label>:401                                     ; preds = %375
  %402 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 23
  store i8 1, i8* %402, align 1
  %403 = load i32* %bound2l, align 4
  store i32 %403, i32* %1
  br label %477

; <label>:404                                     ; preds = %375
  br label %405

; <label>:405                                     ; preds = %404, %366
  br label %406

; <label>:406                                     ; preds = %405, %351
  %407 = load i32* %index, align 4
  %408 = load i32* %yoffset, align 4
  %409 = add nsw i32 %407, %408
  %410 = add nsw i32 %409, 1
  store i32 %410, i32* %index1, align 4
  %411 = load i32* %index1, align 4
  %412 = sext i32 %411 to i64
  %413 = load %struct.waymapcellt** %waymap, align 8
  %414 = getelementptr inbounds %struct.waymapcellt* %413, i64 %412
  %415 = getelementptr inbounds %struct.waymapcellt* %414, i32 0, i32 0
  %416 = load i16* %415, align 2
  %417 = zext i16 %416 to i32
  %418 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 27
  %419 = load i16* %418, align 2
  %420 = zext i16 %419 to i32
  %421 = icmp ne i32 %417, %420
  br i1 %421, label %422, label %462

; <label>:422                                     ; preds = %406
  %423 = load i32* %index1, align 4
  %424 = sext i32 %423 to i64
  %425 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 17
  %426 = load i16** %425, align 8
  %427 = getelementptr inbounds i16* %426, i64 %424
  %428 = load i16* %427, align 2
  %429 = sext i16 %428 to i32
  %430 = icmp eq i32 %429, 0
  br i1 %430, label %431, label %461

; <label>:431                                     ; preds = %422
  %432 = load i32* %index1, align 4
  %433 = load i32* %bound2l, align 4
  %434 = sext i32 %433 to i64
  %435 = load i32** %5, align 8
  %436 = getelementptr inbounds i32* %435, i64 %434
  store i32 %432, i32* %436, align 4
  %437 = load i32* %bound2l, align 4
  %438 = add nsw i32 %437, 1
  store i32 %438, i32* %bound2l, align 4
  %439 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 27
  %440 = load i16* %439, align 2
  %441 = load i32* %index1, align 4
  %442 = sext i32 %441 to i64
  %443 = load %struct.waymapcellt** %waymap, align 8
  %444 = getelementptr inbounds %struct.waymapcellt* %443, i64 %442
  %445 = getelementptr inbounds %struct.waymapcellt* %444, i32 0, i32 0
  store i16 %440, i16* %445, align 2
  %446 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 26
  %447 = load i16* %446, align 2
  %448 = load i32* %index1, align 4
  %449 = sext i32 %448 to i64
  %450 = load %struct.waymapcellt** %waymap, align 8
  %451 = getelementptr inbounds %struct.waymapcellt* %450, i64 %449
  %452 = getelementptr inbounds %struct.waymapcellt* %451, i32 0, i32 1
  store i16 %447, i16* %452, align 2
  %453 = load i32* %index1, align 4
  %454 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 25
  %455 = load i32* %454, align 4
  %456 = icmp eq i32 %453, %455
  br i1 %456, label %457, label %460

; <label>:457                                     ; preds = %431
  %458 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 23
  store i8 1, i8* %458, align 1
  %459 = load i32* %bound2l, align 4
  store i32 %459, i32* %1
  br label %477

; <label>:460                                     ; preds = %431
  br label %461

; <label>:461                                     ; preds = %460, %422
  br label %462

; <label>:462                                     ; preds = %461, %406
  %463 = load i32* %bound2l, align 4
  %464 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 21
  %465 = load i32* %464, align 4
  %466 = icmp sge i32 %463, %465
  br i1 %466, label %467, label %471

; <label>:467                                     ; preds = %462
  %468 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 21
  %469 = load i32* %468, align 4
  %470 = sub nsw i32 %469, 1
  store i32 %470, i32* %bound2l, align 4
  br label %471

; <label>:471                                     ; preds = %467, %462
  br label %472

; <label>:472                                     ; preds = %471
  %473 = load i32* %i, align 4
  %474 = add nsw i32 %473, 1
  store i32 %474, i32* %i, align 4
  br label %11

; <label>:475                                     ; preds = %11
  %476 = load i32* %bound2l, align 4
  store i32 %476, i32* %1
  br label %477

; <label>:477                                     ; preds = %475, %457, %401, %346, %290, %236, %182, %126, %71
  %478 = load i32* %1
  ret i32 %478
}

; Function Attrs: uwtable
define zeroext i1 @_ZN6wayobj4fillEiiii(%class.wayobj* %this, i32 %startx, i32 %starty, i32 %endx, i32 %endy) #1 align 2 {
  %1 = alloca %class.wayobj*, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %boundl = alloca i32, align 4
  %flodd = alloca i8, align 1
  store %class.wayobj* %this, %class.wayobj** %1, align 8
  store i32 %startx, i32* %2, align 4
  store i32 %starty, i32* %3, align 4
  store i32 %endx, i32* %4, align 4
  store i32 %endy, i32* %5, align 4
  %6 = load %class.wayobj** %1
  %7 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 27
  %8 = load i16* %7, align 2
  %9 = zext i16 %8 to i32
  %10 = icmp eq i32 %9, 65535
  br i1 %10, label %11, label %24

; <label>:11                                      ; preds = %0
  %12 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 18
  %13 = load %struct.waymapcellt** %12, align 8
  %14 = bitcast %struct.waymapcellt* %13 to i8*
  %15 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 0
  %16 = load i32* %15, align 4
  %17 = shl i32 1, %16
  %18 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 1
  %19 = load i32* %18, align 4
  %20 = shl i32 %17, %19
  %21 = sext i32 %20 to i64
  %22 = mul i64 %21, 4
  call void @llvm.memset.p0i8.i64(i8* %14, i8 0, i64 %22, i32 2, i1 false)
  %23 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 27
  store i16 0, i16* %23, align 2
  br label %24

; <label>:24                                      ; preds = %11, %0
  %25 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 27
  %26 = load i16* %25, align 2
  %27 = add i16 %26, 1
  store i16 %27, i16* %25, align 2
  %28 = load i32* %2, align 4
  %29 = load i32* %3, align 4
  %30 = call i32 @_ZN6wayobj5indexEii(%class.wayobj* %6, i32 %28, i32 %29)
  %31 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 19
  %32 = load i32** %31, align 8
  %33 = getelementptr inbounds i32* %32, i64 0
  store i32 %30, i32* %33, align 4
  %34 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 27
  %35 = load i16* %34, align 2
  %36 = load i32* %3, align 4
  %37 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 2
  %38 = load i32* %37, align 4
  %39 = shl i32 %36, %38
  %40 = load i32* %2, align 4
  %41 = or i32 %39, %40
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 18
  %44 = load %struct.waymapcellt** %43, align 8
  %45 = getelementptr inbounds %struct.waymapcellt* %44, i64 %42
  %46 = getelementptr inbounds %struct.waymapcellt* %45, i32 0, i32 0
  store i16 %35, i16* %46, align 2
  %47 = load i32* %3, align 4
  %48 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 2
  %49 = load i32* %48, align 4
  %50 = shl i32 %47, %49
  %51 = load i32* %2, align 4
  %52 = or i32 %50, %51
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 18
  %55 = load %struct.waymapcellt** %54, align 8
  %56 = getelementptr inbounds %struct.waymapcellt* %55, i64 %53
  %57 = getelementptr inbounds %struct.waymapcellt* %56, i32 0, i32 1
  store i16 0, i16* %57, align 2
  store i8 0, i8* %flodd, align 1
  store i32 1, i32* %boundl, align 4
  %58 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 23
  store i8 0, i8* %58, align 1
  %59 = load i32* %4, align 4
  %60 = load i32* %5, align 4
  %61 = call i32 @_ZN6wayobj5indexEii(%class.wayobj* %6, i32 %59, i32 %60)
  %62 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 25
  store i32 %61, i32* %62, align 4
  %63 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 26
  store i16 1, i16* %63, align 2
  br label %64

; <label>:64                                      ; preds = %94, %24
  %65 = load i32* %boundl, align 4
  %66 = icmp ne i32 %65, 0
  br i1 %66, label %67, label %73

; <label>:67                                      ; preds = %64
  %68 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 23
  %69 = load i8* %68, align 1
  %70 = trunc i8 %69 to i1
  %71 = zext i1 %70 to i32
  %72 = icmp eq i32 %71, 0
  br label %73

; <label>:73                                      ; preds = %67, %64
  %74 = phi i1 [ false, %64 ], [ %72, %67 ]
  br i1 %74, label %75, label %98

; <label>:75                                      ; preds = %73
  %76 = load i8* %flodd, align 1
  %77 = trunc i8 %76 to i1
  %78 = zext i1 %77 to i32
  %79 = icmp eq i32 %78, 0
  br i1 %79, label %80, label %87

; <label>:80                                      ; preds = %75
  %81 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 19
  %82 = load i32** %81, align 8
  %83 = load i32* %boundl, align 4
  %84 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 20
  %85 = load i32** %84, align 8
  %86 = call i32 @_ZN6wayobj10makebound2EPiiS0_(%class.wayobj* %6, i32* %82, i32 %83, i32* %85)
  store i32 %86, i32* %boundl, align 4
  store i8 1, i8* %flodd, align 1
  br label %94

; <label>:87                                      ; preds = %75
  %88 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 20
  %89 = load i32** %88, align 8
  %90 = load i32* %boundl, align 4
  %91 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 19
  %92 = load i32** %91, align 8
  %93 = call i32 @_ZN6wayobj10makebound2EPiiS0_(%class.wayobj* %6, i32* %89, i32 %90, i32* %92)
  store i32 %93, i32* %boundl, align 4
  store i8 0, i8* %flodd, align 1
  br label %94

; <label>:94                                      ; preds = %87, %80
  %95 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 26
  %96 = load i16* %95, align 2
  %97 = add i16 %96, 1
  store i16 %97, i16* %95, align 2
  br label %64

; <label>:98                                      ; preds = %73
  %99 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 23
  %100 = load i8* %99, align 1
  %101 = trunc i8 %100 to i1
  ret i1 %101
}

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #3

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr i32 @_ZN6wayobj5indexEii(%class.wayobj* %this, i32 %x, i32 %y) #2 align 2 {
  %1 = alloca %class.wayobj*, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store %class.wayobj* %this, %class.wayobj** %1, align 8
  store i32 %x, i32* %2, align 4
  store i32 %y, i32* %3, align 4
  %4 = load %class.wayobj** %1
  %5 = load i32* %3, align 4
  %6 = getelementptr inbounds %class.wayobj* %4, i32 0, i32 2
  %7 = load i32* %6, align 4
  %8 = shl i32 %5, %7
  %9 = load i32* %2, align 4
  %10 = or i32 %8, %9
  ret i32 %10
}

; Function Attrs: nounwind uwtable
define i32 @_ZN6wayobj18makeobstaclebound2EPiiS0_(%class.wayobj* %this, i32* %bound1p, i32 %bound1l, i32* %bound2p) #0 align 2 {
  %1 = alloca i32, align 4
  %2 = alloca %class.wayobj*, align 8
  %3 = alloca i32*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32*, align 8
  %bound2l = alloca i32, align 4
  %index = alloca i32, align 4
  %index1 = alloca i32, align 4
  %yoffset = alloca i32, align 4
  %waymap = alloca %struct.waymapcellt*, align 8
  %i = alloca i32, align 4
  store %class.wayobj* %this, %class.wayobj** %2, align 8
  store i32* %bound1p, i32** %3, align 8
  store i32 %bound1l, i32* %4, align 4
  store i32* %bound2p, i32** %5, align 8
  %6 = load %class.wayobj** %2
  %7 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 8
  %8 = load i32* %7, align 4
  store i32 %8, i32* %yoffset, align 4
  %9 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 18
  %10 = load %struct.waymapcellt** %9, align 8
  store %struct.waymapcellt* %10, %struct.waymapcellt** %waymap, align 8
  store i32 0, i32* %bound2l, align 4
  store i32 0, i32* %i, align 4
  br label %11

; <label>:11                                      ; preds = %528, %0
  %12 = load i32* %i, align 4
  %13 = load i32* %4, align 4
  %14 = icmp slt i32 %12, %13
  br i1 %14, label %15, label %531

; <label>:15                                      ; preds = %11
  %16 = load i32* %i, align 4
  %17 = sext i32 %16 to i64
  %18 = load i32** %3, align 8
  %19 = getelementptr inbounds i32* %18, i64 %17
  %20 = load i32* %19, align 4
  store i32 %20, i32* %index, align 4
  %21 = load i32* %index, align 4
  %22 = load i32* %yoffset, align 4
  %23 = sub nsw i32 %21, %22
  %24 = sub nsw i32 %23, 1
  store i32 %24, i32* %index1, align 4
  %25 = load i32* %index1, align 4
  %26 = sext i32 %25 to i64
  %27 = load %struct.waymapcellt** %waymap, align 8
  %28 = getelementptr inbounds %struct.waymapcellt* %27, i64 %26
  %29 = getelementptr inbounds %struct.waymapcellt* %28, i32 0, i32 0
  %30 = load i16* %29, align 2
  %31 = zext i16 %30 to i32
  %32 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 27
  %33 = load i16* %32, align 2
  %34 = zext i16 %33 to i32
  %35 = icmp ne i32 %31, %34
  br i1 %35, label %36, label %83

; <label>:36                                      ; preds = %15
  %37 = load i32* %index1, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 17
  %40 = load i16** %39, align 8
  %41 = getelementptr inbounds i16* %40, i64 %38
  %42 = load i16* %41, align 2
  %43 = sext i16 %42 to i32
  %44 = icmp sgt i32 %43, 0
  br i1 %44, label %45, label %67

; <label>:45                                      ; preds = %36
  %46 = load i32* %index1, align 4
  %47 = load i32* %bound2l, align 4
  %48 = sext i32 %47 to i64
  %49 = load i32** %5, align 8
  %50 = getelementptr inbounds i32* %49, i64 %48
  store i32 %46, i32* %50, align 4
  %51 = load i32* %bound2l, align 4
  %52 = add nsw i32 %51, 1
  store i32 %52, i32* %bound2l, align 4
  %53 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 27
  %54 = load i16* %53, align 2
  %55 = load i32* %index1, align 4
  %56 = sext i32 %55 to i64
  %57 = load %struct.waymapcellt** %waymap, align 8
  %58 = getelementptr inbounds %struct.waymapcellt* %57, i64 %56
  %59 = getelementptr inbounds %struct.waymapcellt* %58, i32 0, i32 0
  store i16 %54, i16* %59, align 2
  %60 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 26
  %61 = load i16* %60, align 2
  %62 = load i32* %index1, align 4
  %63 = sext i32 %62 to i64
  %64 = load %struct.waymapcellt** %waymap, align 8
  %65 = getelementptr inbounds %struct.waymapcellt* %64, i64 %63
  %66 = getelementptr inbounds %struct.waymapcellt* %65, i32 0, i32 1
  store i16 %61, i16* %66, align 2
  br label %82

; <label>:67                                      ; preds = %36
  %68 = load i32* %index1, align 4
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 17
  %71 = load i16** %70, align 8
  %72 = getelementptr inbounds i16* %71, i64 %69
  %73 = load i16* %72, align 2
  %74 = sext i16 %73 to i32
  %75 = icmp eq i32 %74, 0
  br i1 %75, label %76, label %81

; <label>:76                                      ; preds = %67
  %77 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 23
  store i8 1, i8* %77, align 1
  %78 = load i32* %index1, align 4
  %79 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 25
  store i32 %78, i32* %79, align 4
  %80 = load i32* %bound2l, align 4
  store i32 %80, i32* %1
  br label %533

; <label>:81                                      ; preds = %67
  br label %82

; <label>:82                                      ; preds = %81, %45
  br label %83

; <label>:83                                      ; preds = %82, %15
  %84 = load i32* %index, align 4
  %85 = load i32* %yoffset, align 4
  %86 = sub nsw i32 %84, %85
  store i32 %86, i32* %index1, align 4
  %87 = load i32* %index1, align 4
  %88 = sext i32 %87 to i64
  %89 = load %struct.waymapcellt** %waymap, align 8
  %90 = getelementptr inbounds %struct.waymapcellt* %89, i64 %88
  %91 = getelementptr inbounds %struct.waymapcellt* %90, i32 0, i32 0
  %92 = load i16* %91, align 2
  %93 = zext i16 %92 to i32
  %94 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 27
  %95 = load i16* %94, align 2
  %96 = zext i16 %95 to i32
  %97 = icmp ne i32 %93, %96
  br i1 %97, label %98, label %145

; <label>:98                                      ; preds = %83
  %99 = load i32* %index1, align 4
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 17
  %102 = load i16** %101, align 8
  %103 = getelementptr inbounds i16* %102, i64 %100
  %104 = load i16* %103, align 2
  %105 = sext i16 %104 to i32
  %106 = icmp sgt i32 %105, 0
  br i1 %106, label %107, label %129

; <label>:107                                     ; preds = %98
  %108 = load i32* %index1, align 4
  %109 = load i32* %bound2l, align 4
  %110 = sext i32 %109 to i64
  %111 = load i32** %5, align 8
  %112 = getelementptr inbounds i32* %111, i64 %110
  store i32 %108, i32* %112, align 4
  %113 = load i32* %bound2l, align 4
  %114 = add nsw i32 %113, 1
  store i32 %114, i32* %bound2l, align 4
  %115 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 27
  %116 = load i16* %115, align 2
  %117 = load i32* %index1, align 4
  %118 = sext i32 %117 to i64
  %119 = load %struct.waymapcellt** %waymap, align 8
  %120 = getelementptr inbounds %struct.waymapcellt* %119, i64 %118
  %121 = getelementptr inbounds %struct.waymapcellt* %120, i32 0, i32 0
  store i16 %116, i16* %121, align 2
  %122 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 26
  %123 = load i16* %122, align 2
  %124 = load i32* %index1, align 4
  %125 = sext i32 %124 to i64
  %126 = load %struct.waymapcellt** %waymap, align 8
  %127 = getelementptr inbounds %struct.waymapcellt* %126, i64 %125
  %128 = getelementptr inbounds %struct.waymapcellt* %127, i32 0, i32 1
  store i16 %123, i16* %128, align 2
  br label %144

; <label>:129                                     ; preds = %98
  %130 = load i32* %index1, align 4
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 17
  %133 = load i16** %132, align 8
  %134 = getelementptr inbounds i16* %133, i64 %131
  %135 = load i16* %134, align 2
  %136 = sext i16 %135 to i32
  %137 = icmp eq i32 %136, 0
  br i1 %137, label %138, label %143

; <label>:138                                     ; preds = %129
  %139 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 23
  store i8 1, i8* %139, align 1
  %140 = load i32* %index1, align 4
  %141 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 25
  store i32 %140, i32* %141, align 4
  %142 = load i32* %bound2l, align 4
  store i32 %142, i32* %1
  br label %533

; <label>:143                                     ; preds = %129
  br label %144

; <label>:144                                     ; preds = %143, %107
  br label %145

; <label>:145                                     ; preds = %144, %83
  %146 = load i32* %index, align 4
  %147 = load i32* %yoffset, align 4
  %148 = sub nsw i32 %146, %147
  %149 = add nsw i32 %148, 1
  store i32 %149, i32* %index1, align 4
  %150 = load i32* %index1, align 4
  %151 = sext i32 %150 to i64
  %152 = load %struct.waymapcellt** %waymap, align 8
  %153 = getelementptr inbounds %struct.waymapcellt* %152, i64 %151
  %154 = getelementptr inbounds %struct.waymapcellt* %153, i32 0, i32 0
  %155 = load i16* %154, align 2
  %156 = zext i16 %155 to i32
  %157 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 27
  %158 = load i16* %157, align 2
  %159 = zext i16 %158 to i32
  %160 = icmp ne i32 %156, %159
  br i1 %160, label %161, label %208

; <label>:161                                     ; preds = %145
  %162 = load i32* %index1, align 4
  %163 = sext i32 %162 to i64
  %164 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 17
  %165 = load i16** %164, align 8
  %166 = getelementptr inbounds i16* %165, i64 %163
  %167 = load i16* %166, align 2
  %168 = sext i16 %167 to i32
  %169 = icmp sgt i32 %168, 0
  br i1 %169, label %170, label %192

; <label>:170                                     ; preds = %161
  %171 = load i32* %index1, align 4
  %172 = load i32* %bound2l, align 4
  %173 = sext i32 %172 to i64
  %174 = load i32** %5, align 8
  %175 = getelementptr inbounds i32* %174, i64 %173
  store i32 %171, i32* %175, align 4
  %176 = load i32* %bound2l, align 4
  %177 = add nsw i32 %176, 1
  store i32 %177, i32* %bound2l, align 4
  %178 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 27
  %179 = load i16* %178, align 2
  %180 = load i32* %index1, align 4
  %181 = sext i32 %180 to i64
  %182 = load %struct.waymapcellt** %waymap, align 8
  %183 = getelementptr inbounds %struct.waymapcellt* %182, i64 %181
  %184 = getelementptr inbounds %struct.waymapcellt* %183, i32 0, i32 0
  store i16 %179, i16* %184, align 2
  %185 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 26
  %186 = load i16* %185, align 2
  %187 = load i32* %index1, align 4
  %188 = sext i32 %187 to i64
  %189 = load %struct.waymapcellt** %waymap, align 8
  %190 = getelementptr inbounds %struct.waymapcellt* %189, i64 %188
  %191 = getelementptr inbounds %struct.waymapcellt* %190, i32 0, i32 1
  store i16 %186, i16* %191, align 2
  br label %207

; <label>:192                                     ; preds = %161
  %193 = load i32* %index1, align 4
  %194 = sext i32 %193 to i64
  %195 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 17
  %196 = load i16** %195, align 8
  %197 = getelementptr inbounds i16* %196, i64 %194
  %198 = load i16* %197, align 2
  %199 = sext i16 %198 to i32
  %200 = icmp eq i32 %199, 0
  br i1 %200, label %201, label %206

; <label>:201                                     ; preds = %192
  %202 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 23
  store i8 1, i8* %202, align 1
  %203 = load i32* %index1, align 4
  %204 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 25
  store i32 %203, i32* %204, align 4
  %205 = load i32* %bound2l, align 4
  store i32 %205, i32* %1
  br label %533

; <label>:206                                     ; preds = %192
  br label %207

; <label>:207                                     ; preds = %206, %170
  br label %208

; <label>:208                                     ; preds = %207, %145
  %209 = load i32* %index, align 4
  %210 = sub nsw i32 %209, 1
  store i32 %210, i32* %index1, align 4
  %211 = load i32* %index1, align 4
  %212 = sext i32 %211 to i64
  %213 = load %struct.waymapcellt** %waymap, align 8
  %214 = getelementptr inbounds %struct.waymapcellt* %213, i64 %212
  %215 = getelementptr inbounds %struct.waymapcellt* %214, i32 0, i32 0
  %216 = load i16* %215, align 2
  %217 = zext i16 %216 to i32
  %218 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 27
  %219 = load i16* %218, align 2
  %220 = zext i16 %219 to i32
  %221 = icmp ne i32 %217, %220
  br i1 %221, label %222, label %269

; <label>:222                                     ; preds = %208
  %223 = load i32* %index1, align 4
  %224 = sext i32 %223 to i64
  %225 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 17
  %226 = load i16** %225, align 8
  %227 = getelementptr inbounds i16* %226, i64 %224
  %228 = load i16* %227, align 2
  %229 = sext i16 %228 to i32
  %230 = icmp sgt i32 %229, 0
  br i1 %230, label %231, label %253

; <label>:231                                     ; preds = %222
  %232 = load i32* %index1, align 4
  %233 = load i32* %bound2l, align 4
  %234 = sext i32 %233 to i64
  %235 = load i32** %5, align 8
  %236 = getelementptr inbounds i32* %235, i64 %234
  store i32 %232, i32* %236, align 4
  %237 = load i32* %bound2l, align 4
  %238 = add nsw i32 %237, 1
  store i32 %238, i32* %bound2l, align 4
  %239 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 27
  %240 = load i16* %239, align 2
  %241 = load i32* %index1, align 4
  %242 = sext i32 %241 to i64
  %243 = load %struct.waymapcellt** %waymap, align 8
  %244 = getelementptr inbounds %struct.waymapcellt* %243, i64 %242
  %245 = getelementptr inbounds %struct.waymapcellt* %244, i32 0, i32 0
  store i16 %240, i16* %245, align 2
  %246 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 26
  %247 = load i16* %246, align 2
  %248 = load i32* %index1, align 4
  %249 = sext i32 %248 to i64
  %250 = load %struct.waymapcellt** %waymap, align 8
  %251 = getelementptr inbounds %struct.waymapcellt* %250, i64 %249
  %252 = getelementptr inbounds %struct.waymapcellt* %251, i32 0, i32 1
  store i16 %247, i16* %252, align 2
  br label %268

; <label>:253                                     ; preds = %222
  %254 = load i32* %index1, align 4
  %255 = sext i32 %254 to i64
  %256 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 17
  %257 = load i16** %256, align 8
  %258 = getelementptr inbounds i16* %257, i64 %255
  %259 = load i16* %258, align 2
  %260 = sext i16 %259 to i32
  %261 = icmp eq i32 %260, 0
  br i1 %261, label %262, label %267

; <label>:262                                     ; preds = %253
  %263 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 23
  store i8 1, i8* %263, align 1
  %264 = load i32* %index1, align 4
  %265 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 25
  store i32 %264, i32* %265, align 4
  %266 = load i32* %bound2l, align 4
  store i32 %266, i32* %1
  br label %533

; <label>:267                                     ; preds = %253
  br label %268

; <label>:268                                     ; preds = %267, %231
  br label %269

; <label>:269                                     ; preds = %268, %208
  %270 = load i32* %index, align 4
  %271 = add nsw i32 %270, 1
  store i32 %271, i32* %index1, align 4
  %272 = load i32* %index1, align 4
  %273 = sext i32 %272 to i64
  %274 = load %struct.waymapcellt** %waymap, align 8
  %275 = getelementptr inbounds %struct.waymapcellt* %274, i64 %273
  %276 = getelementptr inbounds %struct.waymapcellt* %275, i32 0, i32 0
  %277 = load i16* %276, align 2
  %278 = zext i16 %277 to i32
  %279 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 27
  %280 = load i16* %279, align 2
  %281 = zext i16 %280 to i32
  %282 = icmp ne i32 %278, %281
  br i1 %282, label %283, label %330

; <label>:283                                     ; preds = %269
  %284 = load i32* %index1, align 4
  %285 = sext i32 %284 to i64
  %286 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 17
  %287 = load i16** %286, align 8
  %288 = getelementptr inbounds i16* %287, i64 %285
  %289 = load i16* %288, align 2
  %290 = sext i16 %289 to i32
  %291 = icmp sgt i32 %290, 0
  br i1 %291, label %292, label %314

; <label>:292                                     ; preds = %283
  %293 = load i32* %index1, align 4
  %294 = load i32* %bound2l, align 4
  %295 = sext i32 %294 to i64
  %296 = load i32** %5, align 8
  %297 = getelementptr inbounds i32* %296, i64 %295
  store i32 %293, i32* %297, align 4
  %298 = load i32* %bound2l, align 4
  %299 = add nsw i32 %298, 1
  store i32 %299, i32* %bound2l, align 4
  %300 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 27
  %301 = load i16* %300, align 2
  %302 = load i32* %index1, align 4
  %303 = sext i32 %302 to i64
  %304 = load %struct.waymapcellt** %waymap, align 8
  %305 = getelementptr inbounds %struct.waymapcellt* %304, i64 %303
  %306 = getelementptr inbounds %struct.waymapcellt* %305, i32 0, i32 0
  store i16 %301, i16* %306, align 2
  %307 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 26
  %308 = load i16* %307, align 2
  %309 = load i32* %index1, align 4
  %310 = sext i32 %309 to i64
  %311 = load %struct.waymapcellt** %waymap, align 8
  %312 = getelementptr inbounds %struct.waymapcellt* %311, i64 %310
  %313 = getelementptr inbounds %struct.waymapcellt* %312, i32 0, i32 1
  store i16 %308, i16* %313, align 2
  br label %329

; <label>:314                                     ; preds = %283
  %315 = load i32* %index1, align 4
  %316 = sext i32 %315 to i64
  %317 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 17
  %318 = load i16** %317, align 8
  %319 = getelementptr inbounds i16* %318, i64 %316
  %320 = load i16* %319, align 2
  %321 = sext i16 %320 to i32
  %322 = icmp eq i32 %321, 0
  br i1 %322, label %323, label %328

; <label>:323                                     ; preds = %314
  %324 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 23
  store i8 1, i8* %324, align 1
  %325 = load i32* %index1, align 4
  %326 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 25
  store i32 %325, i32* %326, align 4
  %327 = load i32* %bound2l, align 4
  store i32 %327, i32* %1
  br label %533

; <label>:328                                     ; preds = %314
  br label %329

; <label>:329                                     ; preds = %328, %292
  br label %330

; <label>:330                                     ; preds = %329, %269
  %331 = load i32* %index, align 4
  %332 = load i32* %yoffset, align 4
  %333 = add nsw i32 %331, %332
  %334 = sub nsw i32 %333, 1
  store i32 %334, i32* %index1, align 4
  %335 = load i32* %index1, align 4
  %336 = sext i32 %335 to i64
  %337 = load %struct.waymapcellt** %waymap, align 8
  %338 = getelementptr inbounds %struct.waymapcellt* %337, i64 %336
  %339 = getelementptr inbounds %struct.waymapcellt* %338, i32 0, i32 0
  %340 = load i16* %339, align 2
  %341 = zext i16 %340 to i32
  %342 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 27
  %343 = load i16* %342, align 2
  %344 = zext i16 %343 to i32
  %345 = icmp ne i32 %341, %344
  br i1 %345, label %346, label %393

; <label>:346                                     ; preds = %330
  %347 = load i32* %index1, align 4
  %348 = sext i32 %347 to i64
  %349 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 17
  %350 = load i16** %349, align 8
  %351 = getelementptr inbounds i16* %350, i64 %348
  %352 = load i16* %351, align 2
  %353 = sext i16 %352 to i32
  %354 = icmp sgt i32 %353, 0
  br i1 %354, label %355, label %377

; <label>:355                                     ; preds = %346
  %356 = load i32* %index1, align 4
  %357 = load i32* %bound2l, align 4
  %358 = sext i32 %357 to i64
  %359 = load i32** %5, align 8
  %360 = getelementptr inbounds i32* %359, i64 %358
  store i32 %356, i32* %360, align 4
  %361 = load i32* %bound2l, align 4
  %362 = add nsw i32 %361, 1
  store i32 %362, i32* %bound2l, align 4
  %363 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 27
  %364 = load i16* %363, align 2
  %365 = load i32* %index1, align 4
  %366 = sext i32 %365 to i64
  %367 = load %struct.waymapcellt** %waymap, align 8
  %368 = getelementptr inbounds %struct.waymapcellt* %367, i64 %366
  %369 = getelementptr inbounds %struct.waymapcellt* %368, i32 0, i32 0
  store i16 %364, i16* %369, align 2
  %370 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 26
  %371 = load i16* %370, align 2
  %372 = load i32* %index1, align 4
  %373 = sext i32 %372 to i64
  %374 = load %struct.waymapcellt** %waymap, align 8
  %375 = getelementptr inbounds %struct.waymapcellt* %374, i64 %373
  %376 = getelementptr inbounds %struct.waymapcellt* %375, i32 0, i32 1
  store i16 %371, i16* %376, align 2
  br label %392

; <label>:377                                     ; preds = %346
  %378 = load i32* %index1, align 4
  %379 = sext i32 %378 to i64
  %380 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 17
  %381 = load i16** %380, align 8
  %382 = getelementptr inbounds i16* %381, i64 %379
  %383 = load i16* %382, align 2
  %384 = sext i16 %383 to i32
  %385 = icmp eq i32 %384, 0
  br i1 %385, label %386, label %391

; <label>:386                                     ; preds = %377
  %387 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 23
  store i8 1, i8* %387, align 1
  %388 = load i32* %index1, align 4
  %389 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 25
  store i32 %388, i32* %389, align 4
  %390 = load i32* %bound2l, align 4
  store i32 %390, i32* %1
  br label %533

; <label>:391                                     ; preds = %377
  br label %392

; <label>:392                                     ; preds = %391, %355
  br label %393

; <label>:393                                     ; preds = %392, %330
  %394 = load i32* %index, align 4
  %395 = load i32* %yoffset, align 4
  %396 = add nsw i32 %394, %395
  store i32 %396, i32* %index1, align 4
  %397 = load i32* %index1, align 4
  %398 = sext i32 %397 to i64
  %399 = load %struct.waymapcellt** %waymap, align 8
  %400 = getelementptr inbounds %struct.waymapcellt* %399, i64 %398
  %401 = getelementptr inbounds %struct.waymapcellt* %400, i32 0, i32 0
  %402 = load i16* %401, align 2
  %403 = zext i16 %402 to i32
  %404 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 27
  %405 = load i16* %404, align 2
  %406 = zext i16 %405 to i32
  %407 = icmp ne i32 %403, %406
  br i1 %407, label %408, label %455

; <label>:408                                     ; preds = %393
  %409 = load i32* %index1, align 4
  %410 = sext i32 %409 to i64
  %411 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 17
  %412 = load i16** %411, align 8
  %413 = getelementptr inbounds i16* %412, i64 %410
  %414 = load i16* %413, align 2
  %415 = sext i16 %414 to i32
  %416 = icmp sgt i32 %415, 0
  br i1 %416, label %417, label %439

; <label>:417                                     ; preds = %408
  %418 = load i32* %index1, align 4
  %419 = load i32* %bound2l, align 4
  %420 = sext i32 %419 to i64
  %421 = load i32** %5, align 8
  %422 = getelementptr inbounds i32* %421, i64 %420
  store i32 %418, i32* %422, align 4
  %423 = load i32* %bound2l, align 4
  %424 = add nsw i32 %423, 1
  store i32 %424, i32* %bound2l, align 4
  %425 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 27
  %426 = load i16* %425, align 2
  %427 = load i32* %index1, align 4
  %428 = sext i32 %427 to i64
  %429 = load %struct.waymapcellt** %waymap, align 8
  %430 = getelementptr inbounds %struct.waymapcellt* %429, i64 %428
  %431 = getelementptr inbounds %struct.waymapcellt* %430, i32 0, i32 0
  store i16 %426, i16* %431, align 2
  %432 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 26
  %433 = load i16* %432, align 2
  %434 = load i32* %index1, align 4
  %435 = sext i32 %434 to i64
  %436 = load %struct.waymapcellt** %waymap, align 8
  %437 = getelementptr inbounds %struct.waymapcellt* %436, i64 %435
  %438 = getelementptr inbounds %struct.waymapcellt* %437, i32 0, i32 1
  store i16 %433, i16* %438, align 2
  br label %454

; <label>:439                                     ; preds = %408
  %440 = load i32* %index1, align 4
  %441 = sext i32 %440 to i64
  %442 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 17
  %443 = load i16** %442, align 8
  %444 = getelementptr inbounds i16* %443, i64 %441
  %445 = load i16* %444, align 2
  %446 = sext i16 %445 to i32
  %447 = icmp eq i32 %446, 0
  br i1 %447, label %448, label %453

; <label>:448                                     ; preds = %439
  %449 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 23
  store i8 1, i8* %449, align 1
  %450 = load i32* %index1, align 4
  %451 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 25
  store i32 %450, i32* %451, align 4
  %452 = load i32* %bound2l, align 4
  store i32 %452, i32* %1
  br label %533

; <label>:453                                     ; preds = %439
  br label %454

; <label>:454                                     ; preds = %453, %417
  br label %455

; <label>:455                                     ; preds = %454, %393
  %456 = load i32* %index, align 4
  %457 = load i32* %yoffset, align 4
  %458 = add nsw i32 %456, %457
  %459 = add nsw i32 %458, 1
  store i32 %459, i32* %index1, align 4
  %460 = load i32* %index1, align 4
  %461 = sext i32 %460 to i64
  %462 = load %struct.waymapcellt** %waymap, align 8
  %463 = getelementptr inbounds %struct.waymapcellt* %462, i64 %461
  %464 = getelementptr inbounds %struct.waymapcellt* %463, i32 0, i32 0
  %465 = load i16* %464, align 2
  %466 = zext i16 %465 to i32
  %467 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 27
  %468 = load i16* %467, align 2
  %469 = zext i16 %468 to i32
  %470 = icmp ne i32 %466, %469
  br i1 %470, label %471, label %518

; <label>:471                                     ; preds = %455
  %472 = load i32* %index1, align 4
  %473 = sext i32 %472 to i64
  %474 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 17
  %475 = load i16** %474, align 8
  %476 = getelementptr inbounds i16* %475, i64 %473
  %477 = load i16* %476, align 2
  %478 = sext i16 %477 to i32
  %479 = icmp sgt i32 %478, 0
  br i1 %479, label %480, label %502

; <label>:480                                     ; preds = %471
  %481 = load i32* %index1, align 4
  %482 = load i32* %bound2l, align 4
  %483 = sext i32 %482 to i64
  %484 = load i32** %5, align 8
  %485 = getelementptr inbounds i32* %484, i64 %483
  store i32 %481, i32* %485, align 4
  %486 = load i32* %bound2l, align 4
  %487 = add nsw i32 %486, 1
  store i32 %487, i32* %bound2l, align 4
  %488 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 27
  %489 = load i16* %488, align 2
  %490 = load i32* %index1, align 4
  %491 = sext i32 %490 to i64
  %492 = load %struct.waymapcellt** %waymap, align 8
  %493 = getelementptr inbounds %struct.waymapcellt* %492, i64 %491
  %494 = getelementptr inbounds %struct.waymapcellt* %493, i32 0, i32 0
  store i16 %489, i16* %494, align 2
  %495 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 26
  %496 = load i16* %495, align 2
  %497 = load i32* %index1, align 4
  %498 = sext i32 %497 to i64
  %499 = load %struct.waymapcellt** %waymap, align 8
  %500 = getelementptr inbounds %struct.waymapcellt* %499, i64 %498
  %501 = getelementptr inbounds %struct.waymapcellt* %500, i32 0, i32 1
  store i16 %496, i16* %501, align 2
  br label %517

; <label>:502                                     ; preds = %471
  %503 = load i32* %index1, align 4
  %504 = sext i32 %503 to i64
  %505 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 17
  %506 = load i16** %505, align 8
  %507 = getelementptr inbounds i16* %506, i64 %504
  %508 = load i16* %507, align 2
  %509 = sext i16 %508 to i32
  %510 = icmp eq i32 %509, 0
  br i1 %510, label %511, label %516

; <label>:511                                     ; preds = %502
  %512 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 23
  store i8 1, i8* %512, align 1
  %513 = load i32* %index1, align 4
  %514 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 25
  store i32 %513, i32* %514, align 4
  %515 = load i32* %bound2l, align 4
  store i32 %515, i32* %1
  br label %533

; <label>:516                                     ; preds = %502
  br label %517

; <label>:517                                     ; preds = %516, %480
  br label %518

; <label>:518                                     ; preds = %517, %455
  %519 = load i32* %bound2l, align 4
  %520 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 21
  %521 = load i32* %520, align 4
  %522 = icmp sge i32 %519, %521
  br i1 %522, label %523, label %527

; <label>:523                                     ; preds = %518
  %524 = getelementptr inbounds %class.wayobj* %6, i32 0, i32 21
  %525 = load i32* %524, align 4
  %526 = sub nsw i32 %525, 1
  store i32 %526, i32* %bound2l, align 4
  br label %527

; <label>:527                                     ; preds = %523, %518
  br label %528

; <label>:528                                     ; preds = %527
  %529 = load i32* %i, align 4
  %530 = add nsw i32 %529, 1
  store i32 %530, i32* %i, align 4
  br label %11

; <label>:531                                     ; preds = %11
  %532 = load i32* %bound2l, align 4
  store i32 %532, i32* %1
  br label %533

; <label>:533                                     ; preds = %531, %511, %448, %386, %323, %262, %201, %138, %76
  %534 = load i32* %1
  ret i32 %534
}

; Function Attrs: uwtable
define zeroext i1 @_ZN6wayobj13findfreepointEiiRiS0_(%class.wayobj* %this, i32 %startx, i32 %starty, i32* dereferenceable(4) %freepointx, i32* dereferenceable(4) %freepointy) #1 align 2 {
  %1 = alloca i1, align 1
  %2 = alloca %class.wayobj*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32*, align 8
  %6 = alloca i32*, align 8
  %boundl = alloca i32, align 4
  %flodd = alloca i8, align 1
  store %class.wayobj* %this, %class.wayobj** %2, align 8
  store i32 %startx, i32* %3, align 4
  store i32 %starty, i32* %4, align 4
  store i32* %freepointx, i32** %5, align 8
  store i32* %freepointy, i32** %6, align 8
  %7 = load %class.wayobj** %2
  %8 = load i32* %3, align 4
  %9 = load i32* %4, align 4
  %10 = call zeroext i1 @_ZN6wayobj5ismapEii(%class.wayobj* %7, i32 %8, i32 %9)
  br i1 %10, label %16, label %11

; <label>:11                                      ; preds = %0
  %12 = load i32* %3, align 4
  %13 = load i32** %5, align 8
  store i32 %12, i32* %13, align 4
  %14 = load i32* %4, align 4
  %15 = load i32** %6, align 8
  store i32 %14, i32* %15, align 4
  store i1 true, i1* %1
  br label %128

; <label>:16                                      ; preds = %0
  %17 = load i32* %3, align 4
  %18 = load i32* %4, align 4
  %19 = call dereferenceable(2) i16* @_ZN6wayobj3mapEii(%class.wayobj* %7, i32 %17, i32 %18)
  %20 = load i16* %19
  %21 = sext i16 %20 to i32
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %23, label %28

; <label>:23                                      ; preds = %16
  %24 = load i32* %3, align 4
  %25 = load i32** %5, align 8
  store i32 %24, i32* %25, align 4
  %26 = load i32* %4, align 4
  %27 = load i32** %6, align 8
  store i32 %26, i32* %27, align 4
  store i1 true, i1* %1
  br label %128

; <label>:28                                      ; preds = %16
  %29 = getelementptr inbounds %class.wayobj* %7, i32 0, i32 27
  %30 = load i16* %29, align 2
  %31 = zext i16 %30 to i32
  %32 = icmp eq i32 %31, 65535
  br i1 %32, label %33, label %46

; <label>:33                                      ; preds = %28
  %34 = getelementptr inbounds %class.wayobj* %7, i32 0, i32 18
  %35 = load %struct.waymapcellt** %34, align 8
  %36 = bitcast %struct.waymapcellt* %35 to i8*
  %37 = getelementptr inbounds %class.wayobj* %7, i32 0, i32 0
  %38 = load i32* %37, align 4
  %39 = shl i32 1, %38
  %40 = getelementptr inbounds %class.wayobj* %7, i32 0, i32 1
  %41 = load i32* %40, align 4
  %42 = shl i32 %39, %41
  %43 = sext i32 %42 to i64
  %44 = mul i64 %43, 4
  call void @llvm.memset.p0i8.i64(i8* %36, i8 0, i64 %44, i32 2, i1 false)
  %45 = getelementptr inbounds %class.wayobj* %7, i32 0, i32 27
  store i16 0, i16* %45, align 2
  br label %46

; <label>:46                                      ; preds = %33, %28
  %47 = getelementptr inbounds %class.wayobj* %7, i32 0, i32 27
  %48 = load i16* %47, align 2
  %49 = add i16 %48, 1
  store i16 %49, i16* %47, align 2
  %50 = load i32* %3, align 4
  %51 = load i32* %4, align 4
  %52 = call i32 @_ZN6wayobj5indexEii(%class.wayobj* %7, i32 %50, i32 %51)
  %53 = getelementptr inbounds %class.wayobj* %7, i32 0, i32 19
  %54 = load i32** %53, align 8
  %55 = getelementptr inbounds i32* %54, i64 0
  store i32 %52, i32* %55, align 4
  %56 = getelementptr inbounds %class.wayobj* %7, i32 0, i32 27
  %57 = load i16* %56, align 2
  %58 = load i32* %4, align 4
  %59 = getelementptr inbounds %class.wayobj* %7, i32 0, i32 2
  %60 = load i32* %59, align 4
  %61 = shl i32 %58, %60
  %62 = load i32* %3, align 4
  %63 = or i32 %61, %62
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds %class.wayobj* %7, i32 0, i32 18
  %66 = load %struct.waymapcellt** %65, align 8
  %67 = getelementptr inbounds %struct.waymapcellt* %66, i64 %64
  %68 = getelementptr inbounds %struct.waymapcellt* %67, i32 0, i32 0
  store i16 %57, i16* %68, align 2
  %69 = load i32* %4, align 4
  %70 = getelementptr inbounds %class.wayobj* %7, i32 0, i32 2
  %71 = load i32* %70, align 4
  %72 = shl i32 %69, %71
  %73 = load i32* %3, align 4
  %74 = or i32 %72, %73
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds %class.wayobj* %7, i32 0, i32 18
  %77 = load %struct.waymapcellt** %76, align 8
  %78 = getelementptr inbounds %struct.waymapcellt* %77, i64 %75
  %79 = getelementptr inbounds %struct.waymapcellt* %78, i32 0, i32 1
  store i16 0, i16* %79, align 2
  store i8 0, i8* %flodd, align 1
  store i32 1, i32* %boundl, align 4
  %80 = getelementptr inbounds %class.wayobj* %7, i32 0, i32 23
  store i8 0, i8* %80, align 1
  %81 = getelementptr inbounds %class.wayobj* %7, i32 0, i32 26
  store i16 1, i16* %81, align 2
  br label %82

; <label>:82                                      ; preds = %112, %46
  %83 = load i32* %boundl, align 4
  %84 = icmp ne i32 %83, 0
  br i1 %84, label %85, label %91

; <label>:85                                      ; preds = %82
  %86 = getelementptr inbounds %class.wayobj* %7, i32 0, i32 23
  %87 = load i8* %86, align 1
  %88 = trunc i8 %87 to i1
  %89 = zext i1 %88 to i32
  %90 = icmp eq i32 %89, 0
  br label %91

; <label>:91                                      ; preds = %85, %82
  %92 = phi i1 [ false, %82 ], [ %90, %85 ]
  br i1 %92, label %93, label %116

; <label>:93                                      ; preds = %91
  %94 = load i8* %flodd, align 1
  %95 = trunc i8 %94 to i1
  %96 = zext i1 %95 to i32
  %97 = icmp eq i32 %96, 0
  br i1 %97, label %98, label %105

; <label>:98                                      ; preds = %93
  %99 = getelementptr inbounds %class.wayobj* %7, i32 0, i32 19
  %100 = load i32** %99, align 8
  %101 = load i32* %boundl, align 4
  %102 = getelementptr inbounds %class.wayobj* %7, i32 0, i32 20
  %103 = load i32** %102, align 8
  %104 = call i32 @_ZN6wayobj18makeobstaclebound2EPiiS0_(%class.wayobj* %7, i32* %100, i32 %101, i32* %103)
  store i32 %104, i32* %boundl, align 4
  store i8 1, i8* %flodd, align 1
  br label %112

; <label>:105                                     ; preds = %93
  %106 = getelementptr inbounds %class.wayobj* %7, i32 0, i32 20
  %107 = load i32** %106, align 8
  %108 = load i32* %boundl, align 4
  %109 = getelementptr inbounds %class.wayobj* %7, i32 0, i32 19
  %110 = load i32** %109, align 8
  %111 = call i32 @_ZN6wayobj18makeobstaclebound2EPiiS0_(%class.wayobj* %7, i32* %107, i32 %108, i32* %110)
  store i32 %111, i32* %boundl, align 4
  store i8 0, i8* %flodd, align 1
  br label %112

; <label>:112                                     ; preds = %105, %98
  %113 = getelementptr inbounds %class.wayobj* %7, i32 0, i32 26
  %114 = load i16* %113, align 2
  %115 = add i16 %114, 1
  store i16 %115, i16* %113, align 2
  br label %82

; <label>:116                                     ; preds = %91
  %117 = getelementptr inbounds %class.wayobj* %7, i32 0, i32 25
  %118 = load i32* %117, align 4
  %119 = call i32 @_ZN6wayobj6indexxEi(%class.wayobj* %7, i32 %118)
  %120 = load i32** %5, align 8
  store i32 %119, i32* %120, align 4
  %121 = getelementptr inbounds %class.wayobj* %7, i32 0, i32 25
  %122 = load i32* %121, align 4
  %123 = call i32 @_ZN6wayobj6indexyEi(%class.wayobj* %7, i32 %122)
  %124 = load i32** %6, align 8
  store i32 %123, i32* %124, align 4
  %125 = getelementptr inbounds %class.wayobj* %7, i32 0, i32 23
  %126 = load i8* %125, align 1
  %127 = trunc i8 %126 to i1
  store i1 %127, i1* %1
  br label %128

; <label>:128                                     ; preds = %116, %23, %11
  %129 = load i1* %1
  ret i1 %129
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr i32 @_ZN6wayobj6indexxEi(%class.wayobj* %this, i32 %index) #2 align 2 {
  %1 = alloca %class.wayobj*, align 8
  %2 = alloca i32, align 4
  store %class.wayobj* %this, %class.wayobj** %1, align 8
  store i32 %index, i32* %2, align 4
  %3 = load %class.wayobj** %1
  %4 = load i32* %2, align 4
  %5 = getelementptr inbounds %class.wayobj* %3, i32 0, i32 22
  %6 = load i32* %5, align 4
  %7 = and i32 %4, %6
  ret i32 %7
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr i32 @_ZN6wayobj6indexyEi(%class.wayobj* %this, i32 %index) #2 align 2 {
  %1 = alloca %class.wayobj*, align 8
  %2 = alloca i32, align 4
  store %class.wayobj* %this, %class.wayobj** %1, align 8
  store i32 %index, i32* %2, align 4
  %3 = load %class.wayobj** %1
  %4 = load i32* %2, align 4
  %5 = getelementptr inbounds %class.wayobj* %3, i32 0, i32 2
  %6 = load i32* %5, align 4
  %7 = ashr i32 %4, %6
  ret i32 %7
}

; Function Attrs: uwtable
define zeroext i1 @_ZN6wayobj13findfreepointEffRfS0_(%class.wayobj* %this, float %startx, float %starty, float* dereferenceable(4) %freepointx, float* dereferenceable(4) %freepointy) #1 align 2 {
  %1 = alloca %class.wayobj*, align 8
  %2 = alloca float, align 4
  %3 = alloca float, align 4
  %4 = alloca float*, align 8
  %5 = alloca float*, align 8
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  %freex = alloca i32, align 4
  %freey = alloca i32, align 4
  %res = alloca i8, align 1
  store %class.wayobj* %this, %class.wayobj** %1, align 8
  store float %startx, float* %2, align 4
  store float %starty, float* %3, align 4
  store float* %freepointx, float** %4, align 8
  store float* %freepointy, float** %5, align 8
  %6 = load %class.wayobj** %1
  %7 = load float* %2, align 4
  %8 = call i32 @_ZN6wayobj4getxEf(%class.wayobj* %6, float %7)
  store i32 %8, i32* %x, align 4
  %9 = load float* %3, align 4
  %10 = call i32 @_ZN6wayobj4getyEf(%class.wayobj* %6, float %9)
  store i32 %10, i32* %y, align 4
  %11 = load i32* %x, align 4
  %12 = load i32* %y, align 4
  %13 = call zeroext i1 @_ZN6wayobj13findfreepointEiiRiS0_(%class.wayobj* %6, i32 %11, i32 %12, i32* dereferenceable(4) %freex, i32* dereferenceable(4) %freey)
  %14 = zext i1 %13 to i8
  store i8 %14, i8* %res, align 1
  %15 = load i32* %freex, align 4
  %16 = call float @_ZN6wayobj9getxcoordEi(%class.wayobj* %6, i32 %15)
  %17 = load float** %4, align 8
  store float %16, float* %17, align 4
  %18 = load i32* %freey, align 4
  %19 = call float @_ZN6wayobj9getycoordEi(%class.wayobj* %6, i32 %18)
  %20 = load float** %5, align 8
  store float %19, float* %20, align 4
  %21 = load i8* %res, align 1
  %22 = trunc i8 %21 to i1
  ret i1 %22
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr float @_ZN6wayobj9getxcoordEi(%class.wayobj* %this, i32 %x) #2 align 2 {
  %1 = alloca %class.wayobj*, align 8
  %2 = alloca i32, align 4
  store %class.wayobj* %this, %class.wayobj** %1, align 8
  store i32 %x, i32* %2, align 4
  %3 = load %class.wayobj** %1
  %4 = getelementptr inbounds %class.wayobj* %3, i32 0, i32 14
  %5 = getelementptr inbounds %struct.createwaymnginfot* %4, i32 0, i32 0
  %6 = load float* %5, align 4
  %7 = getelementptr inbounds %class.wayobj* %3, i32 0, i32 13
  %8 = load float* %7, align 4
  %9 = fadd float %6, %8
  %10 = load i32* %2, align 4
  %11 = sitofp i32 %10 to float
  %12 = getelementptr inbounds %class.wayobj* %3, i32 0, i32 14
  %13 = getelementptr inbounds %struct.createwaymnginfot* %12, i32 0, i32 1
  %14 = load float* %13, align 4
  %15 = getelementptr inbounds %class.wayobj* %3, i32 0, i32 14
  %16 = getelementptr inbounds %struct.createwaymnginfot* %15, i32 0, i32 0
  %17 = load float* %16, align 4
  %18 = fsub float %14, %17
  %19 = fmul float %11, %18
  %20 = getelementptr inbounds %class.wayobj* %3, i32 0, i32 7
  %21 = load i32* %20, align 4
  %22 = sitofp i32 %21 to float
  %23 = fdiv float %19, %22
  %24 = fadd float %9, %23
  ret float %24
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr float @_ZN6wayobj9getycoordEi(%class.wayobj* %this, i32 %y) #2 align 2 {
  %1 = alloca %class.wayobj*, align 8
  %2 = alloca i32, align 4
  store %class.wayobj* %this, %class.wayobj** %1, align 8
  store i32 %y, i32* %2, align 4
  %3 = load %class.wayobj** %1
  %4 = getelementptr inbounds %class.wayobj* %3, i32 0, i32 14
  %5 = getelementptr inbounds %struct.createwaymnginfot* %4, i32 0, i32 2
  %6 = load float* %5, align 4
  %7 = getelementptr inbounds %class.wayobj* %3, i32 0, i32 13
  %8 = load float* %7, align 4
  %9 = fadd float %6, %8
  %10 = load i32* %2, align 4
  %11 = sitofp i32 %10 to float
  %12 = getelementptr inbounds %class.wayobj* %3, i32 0, i32 14
  %13 = getelementptr inbounds %struct.createwaymnginfot* %12, i32 0, i32 3
  %14 = load float* %13, align 4
  %15 = getelementptr inbounds %class.wayobj* %3, i32 0, i32 14
  %16 = getelementptr inbounds %struct.createwaymnginfot* %15, i32 0, i32 2
  %17 = load float* %16, align 4
  %18 = fsub float %14, %17
  %19 = fmul float %11, %18
  %20 = getelementptr inbounds %class.wayobj* %3, i32 0, i32 8
  %21 = load i32* %20, align 4
  %22 = sitofp i32 %21 to float
  %23 = fdiv float %19, %22
  %24 = fadd float %9, %23
  ret float %24
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { inlinehint nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
