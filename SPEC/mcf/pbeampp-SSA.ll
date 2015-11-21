; ModuleID = 'pbeampp.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.basket = type { %struct.arc*, i64, i64 }
%struct.arc = type { i64, %struct.node*, %struct.node*, i32, %struct.arc*, %struct.arc*, i64, i64 }
%struct.node = type { i64, i32, %struct.node*, %struct.node*, %struct.node*, %struct.node*, %struct.arc*, %struct.arc*, %struct.arc*, %struct.arc*, i64, i64, i32, i32 }

@perm = internal global [351 x %struct.basket*] zeroinitializer, align 16
@initialize = internal global i64 1, align 8
@basket = internal global [351 x %struct.basket] zeroinitializer, align 16
@nr_group = internal global i64 0, align 8
@group_pos = internal global i64 0, align 8
@basket_size = internal global i64 0, align 8

; Function Attrs: nounwind uwtable
define i32 @bea_is_dual_infeasible(%struct.arc* %arc, i64 %red_cost) #0 {
  %1 = icmp slt i64 %red_cost, 0
  br i1 %1, label %2, label %6

; <label>:2                                       ; preds = %0
  %3 = getelementptr inbounds %struct.arc* %arc, i32 0, i32 3
  %4 = load i32* %3, align 4
  %5 = icmp eq i32 %4, 1
  br i1 %5, label %14, label %6

; <label>:6                                       ; preds = %2, %0
  %7 = icmp sgt i64 %red_cost, 0
  br i1 %7, label %8, label %12

; <label>:8                                       ; preds = %6
  %9 = getelementptr inbounds %struct.arc* %arc, i32 0, i32 3
  %10 = load i32* %9, align 4
  %11 = icmp eq i32 %10, 2
  br label %12

; <label>:12                                      ; preds = %8, %6
  %13 = phi i1 [ false, %6 ], [ %11, %8 ]
  br label %14

; <label>:14                                      ; preds = %12, %2
  %15 = phi i1 [ true, %2 ], [ %13, %12 ]
  %16 = zext i1 %15 to i32
  ret i32 %16
}

; Function Attrs: nounwind uwtable
define void @sort_basket(i64 %min, i64 %max) #0 {
  %1 = add nsw i64 %min, %max
  %2 = sdiv i64 %1, 2
  %3 = getelementptr inbounds [351 x %struct.basket*]* @perm, i32 0, i64 %2
  %4 = load %struct.basket** %3, align 8
  %5 = getelementptr inbounds %struct.basket* %4, i32 0, i32 2
  %6 = load i64* %5, align 8
  br label %7

; <label>:7                                       ; preds = %40, %0
  %l.0 = phi i64 [ %min, %0 ], [ %l.2, %40 ]
  %r.0 = phi i64 [ %max, %0 ], [ %r.2, %40 ]
  br label %8

; <label>:8                                       ; preds = %14, %7
  %l.1 = phi i64 [ %l.0, %7 ], [ %15, %14 ]
  %9 = getelementptr inbounds [351 x %struct.basket*]* @perm, i32 0, i64 %l.1
  %10 = load %struct.basket** %9, align 8
  %11 = getelementptr inbounds %struct.basket* %10, i32 0, i32 2
  %12 = load i64* %11, align 8
  %13 = icmp sgt i64 %12, %6
  br i1 %13, label %14, label %16

; <label>:14                                      ; preds = %8
  %15 = add nsw i64 %l.1, 1
  br label %8

; <label>:16                                      ; preds = %8
  br label %17

; <label>:17                                      ; preds = %23, %16
  %r.1 = phi i64 [ %r.0, %16 ], [ %24, %23 ]
  %18 = getelementptr inbounds [351 x %struct.basket*]* @perm, i32 0, i64 %r.1
  %19 = load %struct.basket** %18, align 8
  %20 = getelementptr inbounds %struct.basket* %19, i32 0, i32 2
  %21 = load i64* %20, align 8
  %22 = icmp sgt i64 %6, %21
  br i1 %22, label %23, label %25

; <label>:23                                      ; preds = %17
  %24 = add nsw i64 %r.1, -1
  br label %17

; <label>:25                                      ; preds = %17
  %26 = icmp slt i64 %l.1, %r.1
  br i1 %26, label %27, label %34

; <label>:27                                      ; preds = %25
  %28 = getelementptr inbounds [351 x %struct.basket*]* @perm, i32 0, i64 %l.1
  %29 = load %struct.basket** %28, align 8
  %30 = getelementptr inbounds [351 x %struct.basket*]* @perm, i32 0, i64 %r.1
  %31 = load %struct.basket** %30, align 8
  %32 = getelementptr inbounds [351 x %struct.basket*]* @perm, i32 0, i64 %l.1
  store %struct.basket* %31, %struct.basket** %32, align 8
  %33 = getelementptr inbounds [351 x %struct.basket*]* @perm, i32 0, i64 %r.1
  store %struct.basket* %29, %struct.basket** %33, align 8
  br label %34

; <label>:34                                      ; preds = %27, %25
  %35 = icmp sle i64 %l.1, %r.1
  br i1 %35, label %36, label %39

; <label>:36                                      ; preds = %34
  %37 = add nsw i64 %l.1, 1
  %38 = add nsw i64 %r.1, -1
  br label %39

; <label>:39                                      ; preds = %36, %34
  %l.2 = phi i64 [ %37, %36 ], [ %l.1, %34 ]
  %r.2 = phi i64 [ %38, %36 ], [ %r.1, %34 ]
  br label %40

; <label>:40                                      ; preds = %39
  %41 = icmp sle i64 %l.2, %r.2
  br i1 %41, label %7, label %42

; <label>:42                                      ; preds = %40
  %43 = icmp slt i64 %min, %r.2
  br i1 %43, label %44, label %45

; <label>:44                                      ; preds = %42
  call void @sort_basket(i64 %min, i64 %r.2)
  br label %45

; <label>:45                                      ; preds = %44, %42
  %46 = icmp slt i64 %l.2, %max
  br i1 %46, label %47, label %50

; <label>:47                                      ; preds = %45
  %48 = icmp sle i64 %l.2, 50
  br i1 %48, label %49, label %50

; <label>:49                                      ; preds = %47
  call void @sort_basket(i64 %l.2, i64 %max)
  br label %50

; <label>:50                                      ; preds = %49, %47, %45
  ret void
}

; Function Attrs: nounwind uwtable
define %struct.arc* @primal_bea_mpp(i64 %m, %struct.arc* %arcs, %struct.arc* %stop_arcs, i64* %red_cost_of_bea) #0 {
  %1 = load i64* @initialize, align 8
  %2 = icmp ne i64 %1, 0
  br i1 %2, label %3, label %15

; <label>:3                                       ; preds = %0
  br label %4

; <label>:4                                       ; preds = %9, %3
  %i.0 = phi i64 [ 1, %3 ], [ %10, %9 ]
  %5 = icmp slt i64 %i.0, 351
  br i1 %5, label %6, label %11

; <label>:6                                       ; preds = %4
  %7 = getelementptr inbounds [351 x %struct.basket]* @basket, i32 0, i64 %i.0
  %8 = getelementptr inbounds [351 x %struct.basket*]* @perm, i32 0, i64 %i.0
  store %struct.basket* %7, %struct.basket** %8, align 8
  br label %9

; <label>:9                                       ; preds = %6
  %10 = add nsw i64 %i.0, 1
  br label %4

; <label>:11                                      ; preds = %4
  %12 = sub nsw i64 %m, 1
  %13 = sdiv i64 %12, 300
  %14 = add nsw i64 %13, 1
  store i64 %14, i64* @nr_group, align 8
  store i64 0, i64* @group_pos, align 8
  store i64 0, i64* @basket_size, align 8
  store i64 0, i64* @initialize, align 8
  br label %72

; <label>:15                                      ; preds = %0
  br label %16

; <label>:16                                      ; preds = %69, %15
  %i.1 = phi i64 [ 2, %15 ], [ %70, %69 ]
  %next.0 = phi i64 [ 0, %15 ], [ %next.1, %69 ]
  %17 = icmp sle i64 %i.1, 50
  br i1 %17, label %18, label %21

; <label>:18                                      ; preds = %16
  %19 = load i64* @basket_size, align 8
  %20 = icmp sle i64 %i.1, %19
  br label %21

; <label>:21                                      ; preds = %18, %16
  %22 = phi i1 [ false, %16 ], [ %20, %18 ]
  br i1 %22, label %23, label %71

; <label>:23                                      ; preds = %21
  %24 = getelementptr inbounds [351 x %struct.basket*]* @perm, i32 0, i64 %i.1
  %25 = load %struct.basket** %24, align 8
  %26 = getelementptr inbounds %struct.basket* %25, i32 0, i32 0
  %27 = load %struct.arc** %26, align 8
  %28 = getelementptr inbounds %struct.arc* %27, i32 0, i32 0
  %29 = load i64* %28, align 8
  %30 = getelementptr inbounds %struct.arc* %27, i32 0, i32 1
  %31 = load %struct.node** %30, align 8
  %32 = getelementptr inbounds %struct.node* %31, i32 0, i32 0
  %33 = load i64* %32, align 8
  %34 = sub nsw i64 %29, %33
  %35 = getelementptr inbounds %struct.arc* %27, i32 0, i32 2
  %36 = load %struct.node** %35, align 8
  %37 = getelementptr inbounds %struct.node* %36, i32 0, i32 0
  %38 = load i64* %37, align 8
  %39 = add nsw i64 %34, %38
  %40 = icmp slt i64 %39, 0
  br i1 %40, label %41, label %45

; <label>:41                                      ; preds = %23
  %42 = getelementptr inbounds %struct.arc* %27, i32 0, i32 3
  %43 = load i32* %42, align 4
  %44 = icmp eq i32 %43, 1
  br i1 %44, label %51, label %45

; <label>:45                                      ; preds = %41, %23
  %46 = icmp sgt i64 %39, 0
  br i1 %46, label %47, label %68

; <label>:47                                      ; preds = %45
  %48 = getelementptr inbounds %struct.arc* %27, i32 0, i32 3
  %49 = load i32* %48, align 4
  %50 = icmp eq i32 %49, 2
  br i1 %50, label %51, label %68

; <label>:51                                      ; preds = %47, %41
  %52 = add nsw i64 %next.0, 1
  %53 = getelementptr inbounds [351 x %struct.basket*]* @perm, i32 0, i64 %52
  %54 = load %struct.basket** %53, align 8
  %55 = getelementptr inbounds %struct.basket* %54, i32 0, i32 0
  store %struct.arc* %27, %struct.arc** %55, align 8
  %56 = getelementptr inbounds [351 x %struct.basket*]* @perm, i32 0, i64 %52
  %57 = load %struct.basket** %56, align 8
  %58 = getelementptr inbounds %struct.basket* %57, i32 0, i32 1
  store i64 %39, i64* %58, align 8
  %59 = icmp sge i64 %39, 0
  br i1 %59, label %60, label %61

; <label>:60                                      ; preds = %51
  br label %63

; <label>:61                                      ; preds = %51
  %62 = sub nsw i64 0, %39
  br label %63

; <label>:63                                      ; preds = %61, %60
  %64 = phi i64 [ %39, %60 ], [ %62, %61 ]
  %65 = getelementptr inbounds [351 x %struct.basket*]* @perm, i32 0, i64 %52
  %66 = load %struct.basket** %65, align 8
  %67 = getelementptr inbounds %struct.basket* %66, i32 0, i32 2
  store i64 %64, i64* %67, align 8
  br label %68

; <label>:68                                      ; preds = %63, %47, %45
  %next.1 = phi i64 [ %52, %63 ], [ %next.0, %47 ], [ %next.0, %45 ]
  br label %69

; <label>:69                                      ; preds = %68
  %70 = add nsw i64 %i.1, 1
  br label %16

; <label>:71                                      ; preds = %21
  store i64 %next.0, i64* @basket_size, align 8
  br label %72

; <label>:72                                      ; preds = %71, %11
  %73 = load i64* @group_pos, align 8
  br label %74

; <label>:74                                      ; preds = %136, %72
  %75 = load i64* @group_pos, align 8
  %76 = getelementptr inbounds %struct.arc* %arcs, i64 %75
  br label %77

; <label>:77                                      ; preds = %121, %74
  %arc.0 = phi %struct.arc* [ %76, %74 ], [ %123, %121 ]
  %78 = icmp ult %struct.arc* %arc.0, %stop_arcs
  br i1 %78, label %79, label %124

; <label>:79                                      ; preds = %77
  %80 = getelementptr inbounds %struct.arc* %arc.0, i32 0, i32 3
  %81 = load i32* %80, align 4
  %82 = icmp sgt i32 %81, 0
  br i1 %82, label %83, label %120

; <label>:83                                      ; preds = %79
  %84 = getelementptr inbounds %struct.arc* %arc.0, i32 0, i32 0
  %85 = load i64* %84, align 8
  %86 = getelementptr inbounds %struct.arc* %arc.0, i32 0, i32 1
  %87 = load %struct.node** %86, align 8
  %88 = getelementptr inbounds %struct.node* %87, i32 0, i32 0
  %89 = load i64* %88, align 8
  %90 = sub nsw i64 %85, %89
  %91 = getelementptr inbounds %struct.arc* %arc.0, i32 0, i32 2
  %92 = load %struct.node** %91, align 8
  %93 = getelementptr inbounds %struct.node* %92, i32 0, i32 0
  %94 = load i64* %93, align 8
  %95 = add nsw i64 %90, %94
  %96 = call i32 @bea_is_dual_infeasible(%struct.arc* %arc.0, i64 %95)
  %97 = icmp ne i32 %96, 0
  br i1 %97, label %98, label %119

; <label>:98                                      ; preds = %83
  %99 = load i64* @basket_size, align 8
  %100 = add nsw i64 %99, 1
  store i64 %100, i64* @basket_size, align 8
  %101 = load i64* @basket_size, align 8
  %102 = getelementptr inbounds [351 x %struct.basket*]* @perm, i32 0, i64 %101
  %103 = load %struct.basket** %102, align 8
  %104 = getelementptr inbounds %struct.basket* %103, i32 0, i32 0
  store %struct.arc* %arc.0, %struct.arc** %104, align 8
  %105 = load i64* @basket_size, align 8
  %106 = getelementptr inbounds [351 x %struct.basket*]* @perm, i32 0, i64 %105
  %107 = load %struct.basket** %106, align 8
  %108 = getelementptr inbounds %struct.basket* %107, i32 0, i32 1
  store i64 %95, i64* %108, align 8
  %109 = icmp sge i64 %95, 0
  br i1 %109, label %110, label %111

; <label>:110                                     ; preds = %98
  br label %113

; <label>:111                                     ; preds = %98
  %112 = sub nsw i64 0, %95
  br label %113

; <label>:113                                     ; preds = %111, %110
  %114 = phi i64 [ %95, %110 ], [ %112, %111 ]
  %115 = load i64* @basket_size, align 8
  %116 = getelementptr inbounds [351 x %struct.basket*]* @perm, i32 0, i64 %115
  %117 = load %struct.basket** %116, align 8
  %118 = getelementptr inbounds %struct.basket* %117, i32 0, i32 2
  store i64 %114, i64* %118, align 8
  br label %119

; <label>:119                                     ; preds = %113, %83
  br label %120

; <label>:120                                     ; preds = %119, %79
  br label %121

; <label>:121                                     ; preds = %120
  %122 = load i64* @nr_group, align 8
  %123 = getelementptr inbounds %struct.arc* %arc.0, i64 %122
  br label %77

; <label>:124                                     ; preds = %77
  %125 = load i64* @group_pos, align 8
  %126 = add nsw i64 %125, 1
  store i64 %126, i64* @group_pos, align 8
  %127 = load i64* @nr_group, align 8
  %128 = icmp eq i64 %126, %127
  br i1 %128, label %129, label %130

; <label>:129                                     ; preds = %124
  store i64 0, i64* @group_pos, align 8
  br label %130

; <label>:130                                     ; preds = %129, %124
  %131 = load i64* @basket_size, align 8
  %132 = icmp slt i64 %131, 50
  br i1 %132, label %133, label %137

; <label>:133                                     ; preds = %130
  %134 = load i64* @group_pos, align 8
  %135 = icmp ne i64 %134, %73
  br i1 %135, label %136, label %137

; <label>:136                                     ; preds = %133
  br label %74

; <label>:137                                     ; preds = %133, %130
  %138 = load i64* @basket_size, align 8
  %139 = icmp eq i64 %138, 0
  br i1 %139, label %140, label %141

; <label>:140                                     ; preds = %137
  store i64 1, i64* @initialize, align 8
  store i64 0, i64* %red_cost_of_bea, align 8
  br label %149

; <label>:141                                     ; preds = %137
  %142 = load i64* @basket_size, align 8
  call void @sort_basket(i64 1, i64 %142)
  %143 = load %struct.basket** getelementptr inbounds ([351 x %struct.basket*]* @perm, i32 0, i64 1), align 8
  %144 = getelementptr inbounds %struct.basket* %143, i32 0, i32 1
  %145 = load i64* %144, align 8
  store i64 %145, i64* %red_cost_of_bea, align 8
  %146 = load %struct.basket** getelementptr inbounds ([351 x %struct.basket*]* @perm, i32 0, i64 1), align 8
  %147 = getelementptr inbounds %struct.basket* %146, i32 0, i32 0
  %148 = load %struct.arc** %147, align 8
  br label %149

; <label>:149                                     ; preds = %141, %140
  %.0 = phi %struct.arc* [ null, %140 ], [ %148, %141 ]
  ret %struct.arc* %.0
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
