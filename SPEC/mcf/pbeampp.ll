; ModuleID = 'pbeampp.c'
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
  %1 = alloca %struct.arc*, align 8
  %2 = alloca i64, align 8
  store %struct.arc* %arc, %struct.arc** %1, align 8
  store i64 %red_cost, i64* %2, align 8
  %3 = load i64* %2, align 8
  %4 = icmp slt i64 %3, 0
  br i1 %4, label %5, label %10

; <label>:5                                       ; preds = %0
  %6 = load %struct.arc** %1, align 8
  %7 = getelementptr inbounds %struct.arc* %6, i32 0, i32 3
  %8 = load i32* %7, align 4
  %9 = icmp eq i32 %8, 1
  br i1 %9, label %20, label %10

; <label>:10                                      ; preds = %5, %0
  %11 = load i64* %2, align 8
  %12 = icmp sgt i64 %11, 0
  br i1 %12, label %13, label %18

; <label>:13                                      ; preds = %10
  %14 = load %struct.arc** %1, align 8
  %15 = getelementptr inbounds %struct.arc* %14, i32 0, i32 3
  %16 = load i32* %15, align 4
  %17 = icmp eq i32 %16, 2
  br label %18

; <label>:18                                      ; preds = %13, %10
  %19 = phi i1 [ false, %10 ], [ %17, %13 ]
  br label %20

; <label>:20                                      ; preds = %18, %5
  %21 = phi i1 [ true, %5 ], [ %19, %18 ]
  %22 = zext i1 %21 to i32
  ret i32 %22
}

; Function Attrs: nounwind uwtable
define void @sort_basket(i64 %min, i64 %max) #0 {
  %1 = alloca i64, align 8
  %2 = alloca i64, align 8
  %l = alloca i64, align 8
  %r = alloca i64, align 8
  %cut = alloca i64, align 8
  %xchange = alloca %struct.basket*, align 8
  store i64 %min, i64* %1, align 8
  store i64 %max, i64* %2, align 8
  %3 = load i64* %1, align 8
  store i64 %3, i64* %l, align 8
  %4 = load i64* %2, align 8
  store i64 %4, i64* %r, align 8
  %5 = load i64* %l, align 8
  %6 = load i64* %r, align 8
  %7 = add nsw i64 %5, %6
  %8 = sdiv i64 %7, 2
  %9 = getelementptr inbounds [351 x %struct.basket*]* @perm, i32 0, i64 %8
  %10 = load %struct.basket** %9, align 8
  %11 = getelementptr inbounds %struct.basket* %10, i32 0, i32 2
  %12 = load i64* %11, align 8
  store i64 %12, i64* %cut, align 8
  br label %13

; <label>:13                                      ; preds = %63, %0
  br label %14

; <label>:14                                      ; preds = %22, %13
  %15 = load i64* %l, align 8
  %16 = getelementptr inbounds [351 x %struct.basket*]* @perm, i32 0, i64 %15
  %17 = load %struct.basket** %16, align 8
  %18 = getelementptr inbounds %struct.basket* %17, i32 0, i32 2
  %19 = load i64* %18, align 8
  %20 = load i64* %cut, align 8
  %21 = icmp sgt i64 %19, %20
  br i1 %21, label %22, label %25

; <label>:22                                      ; preds = %14
  %23 = load i64* %l, align 8
  %24 = add nsw i64 %23, 1
  store i64 %24, i64* %l, align 8
  br label %14

; <label>:25                                      ; preds = %14
  br label %26

; <label>:26                                      ; preds = %34, %25
  %27 = load i64* %cut, align 8
  %28 = load i64* %r, align 8
  %29 = getelementptr inbounds [351 x %struct.basket*]* @perm, i32 0, i64 %28
  %30 = load %struct.basket** %29, align 8
  %31 = getelementptr inbounds %struct.basket* %30, i32 0, i32 2
  %32 = load i64* %31, align 8
  %33 = icmp sgt i64 %27, %32
  br i1 %33, label %34, label %37

; <label>:34                                      ; preds = %26
  %35 = load i64* %r, align 8
  %36 = add nsw i64 %35, -1
  store i64 %36, i64* %r, align 8
  br label %26

; <label>:37                                      ; preds = %26
  %38 = load i64* %l, align 8
  %39 = load i64* %r, align 8
  %40 = icmp slt i64 %38, %39
  br i1 %40, label %41, label %53

; <label>:41                                      ; preds = %37
  %42 = load i64* %l, align 8
  %43 = getelementptr inbounds [351 x %struct.basket*]* @perm, i32 0, i64 %42
  %44 = load %struct.basket** %43, align 8
  store %struct.basket* %44, %struct.basket** %xchange, align 8
  %45 = load i64* %r, align 8
  %46 = getelementptr inbounds [351 x %struct.basket*]* @perm, i32 0, i64 %45
  %47 = load %struct.basket** %46, align 8
  %48 = load i64* %l, align 8
  %49 = getelementptr inbounds [351 x %struct.basket*]* @perm, i32 0, i64 %48
  store %struct.basket* %47, %struct.basket** %49, align 8
  %50 = load %struct.basket** %xchange, align 8
  %51 = load i64* %r, align 8
  %52 = getelementptr inbounds [351 x %struct.basket*]* @perm, i32 0, i64 %51
  store %struct.basket* %50, %struct.basket** %52, align 8
  br label %53

; <label>:53                                      ; preds = %41, %37
  %54 = load i64* %l, align 8
  %55 = load i64* %r, align 8
  %56 = icmp sle i64 %54, %55
  br i1 %56, label %57, label %62

; <label>:57                                      ; preds = %53
  %58 = load i64* %l, align 8
  %59 = add nsw i64 %58, 1
  store i64 %59, i64* %l, align 8
  %60 = load i64* %r, align 8
  %61 = add nsw i64 %60, -1
  store i64 %61, i64* %r, align 8
  br label %62

; <label>:62                                      ; preds = %57, %53
  br label %63

; <label>:63                                      ; preds = %62
  %64 = load i64* %l, align 8
  %65 = load i64* %r, align 8
  %66 = icmp sle i64 %64, %65
  br i1 %66, label %13, label %67

; <label>:67                                      ; preds = %63
  %68 = load i64* %1, align 8
  %69 = load i64* %r, align 8
  %70 = icmp slt i64 %68, %69
  br i1 %70, label %71, label %74

; <label>:71                                      ; preds = %67
  %72 = load i64* %1, align 8
  %73 = load i64* %r, align 8
  call void @sort_basket(i64 %72, i64 %73)
  br label %74

; <label>:74                                      ; preds = %71, %67
  %75 = load i64* %l, align 8
  %76 = load i64* %2, align 8
  %77 = icmp slt i64 %75, %76
  br i1 %77, label %78, label %84

; <label>:78                                      ; preds = %74
  %79 = load i64* %l, align 8
  %80 = icmp sle i64 %79, 50
  br i1 %80, label %81, label %84

; <label>:81                                      ; preds = %78
  %82 = load i64* %l, align 8
  %83 = load i64* %2, align 8
  call void @sort_basket(i64 %82, i64 %83)
  br label %84

; <label>:84                                      ; preds = %81, %78, %74
  ret void
}

; Function Attrs: nounwind uwtable
define %struct.arc* @primal_bea_mpp(i64 %m, %struct.arc* %arcs, %struct.arc* %stop_arcs, i64* %red_cost_of_bea) #0 {
  %1 = alloca %struct.arc*, align 8
  %2 = alloca i64, align 8
  %3 = alloca %struct.arc*, align 8
  %4 = alloca %struct.arc*, align 8
  %5 = alloca i64*, align 8
  %i = alloca i64, align 8
  %next = alloca i64, align 8
  %old_group_pos = alloca i64, align 8
  %arc = alloca %struct.arc*, align 8
  %red_cost = alloca i64, align 8
  store i64 %m, i64* %2, align 8
  store %struct.arc* %arcs, %struct.arc** %3, align 8
  store %struct.arc* %stop_arcs, %struct.arc** %4, align 8
  store i64* %red_cost_of_bea, i64** %5, align 8
  %6 = load i64* @initialize, align 8
  %7 = icmp ne i64 %6, 0
  br i1 %7, label %8, label %25

; <label>:8                                       ; preds = %0
  store i64 1, i64* %i, align 8
  br label %9

; <label>:9                                       ; preds = %17, %8
  %10 = load i64* %i, align 8
  %11 = icmp slt i64 %10, 351
  br i1 %11, label %12, label %20

; <label>:12                                      ; preds = %9
  %13 = load i64* %i, align 8
  %14 = getelementptr inbounds [351 x %struct.basket]* @basket, i32 0, i64 %13
  %15 = load i64* %i, align 8
  %16 = getelementptr inbounds [351 x %struct.basket*]* @perm, i32 0, i64 %15
  store %struct.basket* %14, %struct.basket** %16, align 8
  br label %17

; <label>:17                                      ; preds = %12
  %18 = load i64* %i, align 8
  %19 = add nsw i64 %18, 1
  store i64 %19, i64* %i, align 8
  br label %9

; <label>:20                                      ; preds = %9
  %21 = load i64* %2, align 8
  %22 = sub nsw i64 %21, 1
  %23 = sdiv i64 %22, 300
  %24 = add nsw i64 %23, 1
  store i64 %24, i64* @nr_group, align 8
  store i64 0, i64* @group_pos, align 8
  store i64 0, i64* @basket_size, align 8
  store i64 0, i64* @initialize, align 8
  br label %103

; <label>:25                                      ; preds = %0
  store i64 2, i64* %i, align 8
  store i64 0, i64* %next, align 8
  br label %26

; <label>:26                                      ; preds = %98, %25
  %27 = load i64* %i, align 8
  %28 = icmp sle i64 %27, 50
  br i1 %28, label %29, label %33

; <label>:29                                      ; preds = %26
  %30 = load i64* %i, align 8
  %31 = load i64* @basket_size, align 8
  %32 = icmp sle i64 %30, %31
  br label %33

; <label>:33                                      ; preds = %29, %26
  %34 = phi i1 [ false, %26 ], [ %32, %29 ]
  br i1 %34, label %35, label %101

; <label>:35                                      ; preds = %33
  %36 = load i64* %i, align 8
  %37 = getelementptr inbounds [351 x %struct.basket*]* @perm, i32 0, i64 %36
  %38 = load %struct.basket** %37, align 8
  %39 = getelementptr inbounds %struct.basket* %38, i32 0, i32 0
  %40 = load %struct.arc** %39, align 8
  store %struct.arc* %40, %struct.arc** %arc, align 8
  %41 = load %struct.arc** %arc, align 8
  %42 = getelementptr inbounds %struct.arc* %41, i32 0, i32 0
  %43 = load i64* %42, align 8
  %44 = load %struct.arc** %arc, align 8
  %45 = getelementptr inbounds %struct.arc* %44, i32 0, i32 1
  %46 = load %struct.node** %45, align 8
  %47 = getelementptr inbounds %struct.node* %46, i32 0, i32 0
  %48 = load i64* %47, align 8
  %49 = sub nsw i64 %43, %48
  %50 = load %struct.arc** %arc, align 8
  %51 = getelementptr inbounds %struct.arc* %50, i32 0, i32 2
  %52 = load %struct.node** %51, align 8
  %53 = getelementptr inbounds %struct.node* %52, i32 0, i32 0
  %54 = load i64* %53, align 8
  %55 = add nsw i64 %49, %54
  store i64 %55, i64* %red_cost, align 8
  %56 = load i64* %red_cost, align 8
  %57 = icmp slt i64 %56, 0
  br i1 %57, label %58, label %63

; <label>:58                                      ; preds = %35
  %59 = load %struct.arc** %arc, align 8
  %60 = getelementptr inbounds %struct.arc* %59, i32 0, i32 3
  %61 = load i32* %60, align 4
  %62 = icmp eq i32 %61, 1
  br i1 %62, label %71, label %63

; <label>:63                                      ; preds = %58, %35
  %64 = load i64* %red_cost, align 8
  %65 = icmp sgt i64 %64, 0
  br i1 %65, label %66, label %97

; <label>:66                                      ; preds = %63
  %67 = load %struct.arc** %arc, align 8
  %68 = getelementptr inbounds %struct.arc* %67, i32 0, i32 3
  %69 = load i32* %68, align 4
  %70 = icmp eq i32 %69, 2
  br i1 %70, label %71, label %97

; <label>:71                                      ; preds = %66, %58
  %72 = load i64* %next, align 8
  %73 = add nsw i64 %72, 1
  store i64 %73, i64* %next, align 8
  %74 = load %struct.arc** %arc, align 8
  %75 = load i64* %next, align 8
  %76 = getelementptr inbounds [351 x %struct.basket*]* @perm, i32 0, i64 %75
  %77 = load %struct.basket** %76, align 8
  %78 = getelementptr inbounds %struct.basket* %77, i32 0, i32 0
  store %struct.arc* %74, %struct.arc** %78, align 8
  %79 = load i64* %red_cost, align 8
  %80 = load i64* %next, align 8
  %81 = getelementptr inbounds [351 x %struct.basket*]* @perm, i32 0, i64 %80
  %82 = load %struct.basket** %81, align 8
  %83 = getelementptr inbounds %struct.basket* %82, i32 0, i32 1
  store i64 %79, i64* %83, align 8
  %84 = load i64* %red_cost, align 8
  %85 = icmp sge i64 %84, 0
  br i1 %85, label %86, label %88

; <label>:86                                      ; preds = %71
  %87 = load i64* %red_cost, align 8
  br label %91

; <label>:88                                      ; preds = %71
  %89 = load i64* %red_cost, align 8
  %90 = sub nsw i64 0, %89
  br label %91

; <label>:91                                      ; preds = %88, %86
  %92 = phi i64 [ %87, %86 ], [ %90, %88 ]
  %93 = load i64* %next, align 8
  %94 = getelementptr inbounds [351 x %struct.basket*]* @perm, i32 0, i64 %93
  %95 = load %struct.basket** %94, align 8
  %96 = getelementptr inbounds %struct.basket* %95, i32 0, i32 2
  store i64 %92, i64* %96, align 8
  br label %97

; <label>:97                                      ; preds = %91, %66, %63
  br label %98

; <label>:98                                      ; preds = %97
  %99 = load i64* %i, align 8
  %100 = add nsw i64 %99, 1
  store i64 %100, i64* %i, align 8
  br label %26

; <label>:101                                     ; preds = %33
  %102 = load i64* %next, align 8
  store i64 %102, i64* @basket_size, align 8
  br label %103

; <label>:103                                     ; preds = %101, %20
  %104 = load i64* @group_pos, align 8
  store i64 %104, i64* %old_group_pos, align 8
  br label %105

; <label>:105                                     ; preds = %183, %103
  %106 = load %struct.arc** %3, align 8
  %107 = load i64* @group_pos, align 8
  %108 = getelementptr inbounds %struct.arc* %106, i64 %107
  store %struct.arc* %108, %struct.arc** %arc, align 8
  br label %109

; <label>:109                                     ; preds = %166, %105
  %110 = load %struct.arc** %arc, align 8
  %111 = load %struct.arc** %4, align 8
  %112 = icmp ult %struct.arc* %110, %111
  br i1 %112, label %113, label %170

; <label>:113                                     ; preds = %109
  %114 = load %struct.arc** %arc, align 8
  %115 = getelementptr inbounds %struct.arc* %114, i32 0, i32 3
  %116 = load i32* %115, align 4
  %117 = icmp sgt i32 %116, 0
  br i1 %117, label %118, label %165

; <label>:118                                     ; preds = %113
  %119 = load %struct.arc** %arc, align 8
  %120 = getelementptr inbounds %struct.arc* %119, i32 0, i32 0
  %121 = load i64* %120, align 8
  %122 = load %struct.arc** %arc, align 8
  %123 = getelementptr inbounds %struct.arc* %122, i32 0, i32 1
  %124 = load %struct.node** %123, align 8
  %125 = getelementptr inbounds %struct.node* %124, i32 0, i32 0
  %126 = load i64* %125, align 8
  %127 = sub nsw i64 %121, %126
  %128 = load %struct.arc** %arc, align 8
  %129 = getelementptr inbounds %struct.arc* %128, i32 0, i32 2
  %130 = load %struct.node** %129, align 8
  %131 = getelementptr inbounds %struct.node* %130, i32 0, i32 0
  %132 = load i64* %131, align 8
  %133 = add nsw i64 %127, %132
  store i64 %133, i64* %red_cost, align 8
  %134 = load %struct.arc** %arc, align 8
  %135 = load i64* %red_cost, align 8
  %136 = call i32 @bea_is_dual_infeasible(%struct.arc* %134, i64 %135)
  %137 = icmp ne i32 %136, 0
  br i1 %137, label %138, label %164

; <label>:138                                     ; preds = %118
  %139 = load i64* @basket_size, align 8
  %140 = add nsw i64 %139, 1
  store i64 %140, i64* @basket_size, align 8
  %141 = load %struct.arc** %arc, align 8
  %142 = load i64* @basket_size, align 8
  %143 = getelementptr inbounds [351 x %struct.basket*]* @perm, i32 0, i64 %142
  %144 = load %struct.basket** %143, align 8
  %145 = getelementptr inbounds %struct.basket* %144, i32 0, i32 0
  store %struct.arc* %141, %struct.arc** %145, align 8
  %146 = load i64* %red_cost, align 8
  %147 = load i64* @basket_size, align 8
  %148 = getelementptr inbounds [351 x %struct.basket*]* @perm, i32 0, i64 %147
  %149 = load %struct.basket** %148, align 8
  %150 = getelementptr inbounds %struct.basket* %149, i32 0, i32 1
  store i64 %146, i64* %150, align 8
  %151 = load i64* %red_cost, align 8
  %152 = icmp sge i64 %151, 0
  br i1 %152, label %153, label %155

; <label>:153                                     ; preds = %138
  %154 = load i64* %red_cost, align 8
  br label %158

; <label>:155                                     ; preds = %138
  %156 = load i64* %red_cost, align 8
  %157 = sub nsw i64 0, %156
  br label %158

; <label>:158                                     ; preds = %155, %153
  %159 = phi i64 [ %154, %153 ], [ %157, %155 ]
  %160 = load i64* @basket_size, align 8
  %161 = getelementptr inbounds [351 x %struct.basket*]* @perm, i32 0, i64 %160
  %162 = load %struct.basket** %161, align 8
  %163 = getelementptr inbounds %struct.basket* %162, i32 0, i32 2
  store i64 %159, i64* %163, align 8
  br label %164

; <label>:164                                     ; preds = %158, %118
  br label %165

; <label>:165                                     ; preds = %164, %113
  br label %166

; <label>:166                                     ; preds = %165
  %167 = load i64* @nr_group, align 8
  %168 = load %struct.arc** %arc, align 8
  %169 = getelementptr inbounds %struct.arc* %168, i64 %167
  store %struct.arc* %169, %struct.arc** %arc, align 8
  br label %109

; <label>:170                                     ; preds = %109
  %171 = load i64* @group_pos, align 8
  %172 = add nsw i64 %171, 1
  store i64 %172, i64* @group_pos, align 8
  %173 = load i64* @nr_group, align 8
  %174 = icmp eq i64 %172, %173
  br i1 %174, label %175, label %176

; <label>:175                                     ; preds = %170
  store i64 0, i64* @group_pos, align 8
  br label %176

; <label>:176                                     ; preds = %175, %170
  %177 = load i64* @basket_size, align 8
  %178 = icmp slt i64 %177, 50
  br i1 %178, label %179, label %184

; <label>:179                                     ; preds = %176
  %180 = load i64* @group_pos, align 8
  %181 = load i64* %old_group_pos, align 8
  %182 = icmp ne i64 %180, %181
  br i1 %182, label %183, label %184

; <label>:183                                     ; preds = %179
  br label %105

; <label>:184                                     ; preds = %179, %176
  %185 = load i64* @basket_size, align 8
  %186 = icmp eq i64 %185, 0
  br i1 %186, label %187, label %189

; <label>:187                                     ; preds = %184
  store i64 1, i64* @initialize, align 8
  %188 = load i64** %5, align 8
  store i64 0, i64* %188, align 8
  store %struct.arc* null, %struct.arc** %1
  br label %198

; <label>:189                                     ; preds = %184
  %190 = load i64* @basket_size, align 8
  call void @sort_basket(i64 1, i64 %190)
  %191 = load %struct.basket** getelementptr inbounds ([351 x %struct.basket*]* @perm, i32 0, i64 1), align 8
  %192 = getelementptr inbounds %struct.basket* %191, i32 0, i32 1
  %193 = load i64* %192, align 8
  %194 = load i64** %5, align 8
  store i64 %193, i64* %194, align 8
  %195 = load %struct.basket** getelementptr inbounds ([351 x %struct.basket*]* @perm, i32 0, i64 1), align 8
  %196 = getelementptr inbounds %struct.basket* %195, i32 0, i32 0
  %197 = load %struct.arc** %196, align 8
  store %struct.arc* %197, %struct.arc** %1
  br label %198

; <label>:198                                     ; preds = %189, %187
  %199 = load %struct.arc** %1
  ret %struct.arc* %199
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
