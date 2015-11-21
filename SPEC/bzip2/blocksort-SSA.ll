; ModuleID = 'blocksort.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.EState = type { %struct.bz_stream*, i32, i32, i32, i32*, i32*, i32*, i32, i32*, i8*, i16*, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, [256 x i8], [256 x i8], i32, i32, i32, i32, i32, i32, i32, i32, [258 x i32], [18002 x i8], [18002 x i8], [6 x [258 x i8]], [6 x [258 x i32]], [6 x [258 x i32]], [258 x [4 x i32]] }
%struct.bz_stream = type { i8*, i32, i32, i32, i8*, i32, i32, i32, i8*, i8* (i8*, i32, i32)*, void (i8*, i8*)*, i8* }

@stderr = external global %struct._IO_FILE*
@.str = private unnamed_addr constant [38 x i8] c"      %d work, %d block, ratio %5.2f\0A\00", align 1
@.str1 = private unnamed_addr constant [54 x i8] c"    too repetitive; using fallback sorting algorithm\0A\00", align 1
@.str2 = private unnamed_addr constant [34 x i8] c"        main sort initialise ...\0A\00", align 1
@.str3 = private unnamed_addr constant [28 x i8] c"        bucket sorting ...\0A\00", align 1
@.str4 = private unnamed_addr constant [48 x i8] c"        qsort [0x%x, 0x%x]   done %d   this %d\0A\00", align 1
@.str5 = private unnamed_addr constant [44 x i8] c"        %d pointers, %d sorted, %d scanned\0A\00", align 1
@incs = internal global [14 x i32] [i32 1, i32 4, i32 13, i32 40, i32 121, i32 364, i32 1093, i32 3280, i32 9841, i32 29524, i32 88573, i32 265720, i32 797161, i32 2391484], align 16
@.str6 = private unnamed_addr constant [23 x i8] c"        depth %6d has \00", align 1
@.str7 = private unnamed_addr constant [24 x i8] c"%6d unresolved strings\0A\00", align 1
@.str8 = private unnamed_addr constant [34 x i8] c"        reconstructing block ...\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @BZ2_blockSort(%struct.EState* %s) #0 {
  %budget = alloca i32, align 4
  %1 = getelementptr inbounds %struct.EState* %s, i32 0, i32 8
  %2 = load i32** %1, align 8
  %3 = getelementptr inbounds %struct.EState* %s, i32 0, i32 9
  %4 = load i8** %3, align 8
  %5 = getelementptr inbounds %struct.EState* %s, i32 0, i32 6
  %6 = load i32** %5, align 8
  %7 = getelementptr inbounds %struct.EState* %s, i32 0, i32 17
  %8 = load i32* %7, align 4
  %9 = getelementptr inbounds %struct.EState* %s, i32 0, i32 28
  %10 = load i32* %9, align 4
  %11 = getelementptr inbounds %struct.EState* %s, i32 0, i32 12
  %12 = load i32* %11, align 4
  %13 = icmp slt i32 %8, 10000
  br i1 %13, label %14, label %19

; <label>:14                                      ; preds = %0
  %15 = getelementptr inbounds %struct.EState* %s, i32 0, i32 4
  %16 = load i32** %15, align 8
  %17 = getelementptr inbounds %struct.EState* %s, i32 0, i32 5
  %18 = load i32** %17, align 8
  call void @fallbackSort(i32* %16, i32* %18, i32* %6, i32 %8, i32 %10)
  br label %69

; <label>:19                                      ; preds = %0
  %20 = add nsw i32 %8, 34
  %21 = and i32 %20, 1
  %22 = icmp ne i32 %21, 0
  br i1 %22, label %23, label %25

; <label>:23                                      ; preds = %19
  %24 = add nsw i32 %20, 1
  br label %25

; <label>:25                                      ; preds = %23, %19
  %i.0 = phi i32 [ %24, %23 ], [ %20, %19 ]
  %26 = sext i32 %i.0 to i64
  %27 = getelementptr inbounds i8* %4, i64 %26
  %28 = bitcast i8* %27 to i16*
  %29 = icmp slt i32 %12, 1
  br i1 %29, label %30, label %31

; <label>:30                                      ; preds = %25
  br label %31

; <label>:31                                      ; preds = %30, %25
  %wfact.0 = phi i32 [ 1, %30 ], [ %12, %25 ]
  %32 = icmp sgt i32 %wfact.0, 100
  br i1 %32, label %33, label %34

; <label>:33                                      ; preds = %31
  br label %34

; <label>:34                                      ; preds = %33, %31
  %wfact.1 = phi i32 [ 100, %33 ], [ %wfact.0, %31 ]
  %35 = sub nsw i32 %wfact.1, 1
  %36 = sdiv i32 %35, 3
  %37 = mul nsw i32 %8, %36
  store i32 %37, i32* %budget, align 4
  call void @mainSort(i32* %2, i8* %4, i16* %28, i32* %6, i32 %8, i32 %10, i32* %budget)
  %38 = icmp sge i32 %10, 3
  br i1 %38, label %39, label %55

; <label>:39                                      ; preds = %34
  %40 = load %struct._IO_FILE** @stderr, align 8
  %41 = load i32* %budget, align 4
  %42 = sub nsw i32 %37, %41
  %43 = load i32* %budget, align 4
  %44 = sub nsw i32 %37, %43
  %45 = sitofp i32 %44 to float
  %46 = icmp eq i32 %8, 0
  br i1 %46, label %47, label %48

; <label>:47                                      ; preds = %39
  br label %49

; <label>:48                                      ; preds = %39
  br label %49

; <label>:49                                      ; preds = %48, %47
  %50 = phi i32 [ 1, %47 ], [ %8, %48 ]
  %51 = sitofp i32 %50 to float
  %52 = fdiv float %45, %51
  %53 = fpext float %52 to double
  %54 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %40, i8* getelementptr inbounds ([38 x i8]* @.str, i32 0, i32 0), i32 %42, i32 %8, double %53)
  br label %55

; <label>:55                                      ; preds = %49, %34
  %56 = load i32* %budget, align 4
  %57 = icmp slt i32 %56, 0
  br i1 %57, label %58, label %68

; <label>:58                                      ; preds = %55
  %59 = icmp sge i32 %10, 2
  br i1 %59, label %60, label %63

; <label>:60                                      ; preds = %58
  %61 = load %struct._IO_FILE** @stderr, align 8
  %62 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %61, i8* getelementptr inbounds ([54 x i8]* @.str1, i32 0, i32 0))
  br label %63

; <label>:63                                      ; preds = %60, %58
  %64 = getelementptr inbounds %struct.EState* %s, i32 0, i32 4
  %65 = load i32** %64, align 8
  %66 = getelementptr inbounds %struct.EState* %s, i32 0, i32 5
  %67 = load i32** %66, align 8
  call void @fallbackSort(i32* %65, i32* %67, i32* %6, i32 %8, i32 %10)
  br label %68

; <label>:68                                      ; preds = %63, %55
  br label %69

; <label>:69                                      ; preds = %68, %14
  %70 = getelementptr inbounds %struct.EState* %s, i32 0, i32 7
  store i32 -1, i32* %70, align 4
  br label %71

; <label>:71                                      ; preds = %83, %69
  %i.1 = phi i32 [ 0, %69 ], [ %84, %83 ]
  %72 = getelementptr inbounds %struct.EState* %s, i32 0, i32 17
  %73 = load i32* %72, align 4
  %74 = icmp slt i32 %i.1, %73
  br i1 %74, label %75, label %85

; <label>:75                                      ; preds = %71
  %76 = sext i32 %i.1 to i64
  %77 = getelementptr inbounds i32* %2, i64 %76
  %78 = load i32* %77, align 4
  %79 = icmp eq i32 %78, 0
  br i1 %79, label %80, label %82

; <label>:80                                      ; preds = %75
  %81 = getelementptr inbounds %struct.EState* %s, i32 0, i32 7
  store i32 %i.1, i32* %81, align 4
  br label %85

; <label>:82                                      ; preds = %75
  br label %83

; <label>:83                                      ; preds = %82
  %84 = add nsw i32 %i.1, 1
  br label %71

; <label>:85                                      ; preds = %80, %71
  %86 = getelementptr inbounds %struct.EState* %s, i32 0, i32 7
  %87 = load i32* %86, align 4
  %88 = icmp ne i32 %87, -1
  br i1 %88, label %90, label %89

; <label>:89                                      ; preds = %85
  call void @BZ2_bz__AssertH__fail(i32 1003)
  br label %90

; <label>:90                                      ; preds = %89, %85
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @fallbackSort(i32* %fmap, i32* %eclass, i32* %bhtab, i32 %nblock, i32 %verb) #0 {
  %ftab = alloca [257 x i32], align 16
  %ftabCopy = alloca [256 x i32], align 16
  %1 = bitcast i32* %eclass to i8*
  %2 = icmp sge i32 %verb, 4
  br i1 %2, label %3, label %6

; <label>:3                                       ; preds = %0
  %4 = load %struct._IO_FILE** @stderr, align 8
  %5 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([28 x i8]* @.str3, i32 0, i32 0))
  br label %6

; <label>:6                                       ; preds = %3, %0
  br label %7

; <label>:7                                       ; preds = %12, %6
  %i.0 = phi i32 [ 0, %6 ], [ %13, %12 ]
  %8 = icmp slt i32 %i.0, 257
  br i1 %8, label %9, label %14

; <label>:9                                       ; preds = %7
  %10 = sext i32 %i.0 to i64
  %11 = getelementptr inbounds [257 x i32]* %ftab, i32 0, i64 %10
  store i32 0, i32* %11, align 4
  br label %12

; <label>:12                                      ; preds = %9
  %13 = add nsw i32 %i.0, 1
  br label %7

; <label>:14                                      ; preds = %7
  br label %15

; <label>:15                                      ; preds = %25, %14
  %i.1 = phi i32 [ 0, %14 ], [ %26, %25 ]
  %16 = icmp slt i32 %i.1, %nblock
  br i1 %16, label %17, label %27

; <label>:17                                      ; preds = %15
  %18 = sext i32 %i.1 to i64
  %19 = getelementptr inbounds i8* %1, i64 %18
  %20 = load i8* %19, align 1
  %21 = zext i8 %20 to i64
  %22 = getelementptr inbounds [257 x i32]* %ftab, i32 0, i64 %21
  %23 = load i32* %22, align 4
  %24 = add nsw i32 %23, 1
  store i32 %24, i32* %22, align 4
  br label %25

; <label>:25                                      ; preds = %17
  %26 = add nsw i32 %i.1, 1
  br label %15

; <label>:27                                      ; preds = %15
  br label %28

; <label>:28                                      ; preds = %36, %27
  %i.2 = phi i32 [ 0, %27 ], [ %37, %36 ]
  %29 = icmp slt i32 %i.2, 256
  br i1 %29, label %30, label %38

; <label>:30                                      ; preds = %28
  %31 = sext i32 %i.2 to i64
  %32 = getelementptr inbounds [257 x i32]* %ftab, i32 0, i64 %31
  %33 = load i32* %32, align 4
  %34 = sext i32 %i.2 to i64
  %35 = getelementptr inbounds [256 x i32]* %ftabCopy, i32 0, i64 %34
  store i32 %33, i32* %35, align 4
  br label %36

; <label>:36                                      ; preds = %30
  %37 = add nsw i32 %i.2, 1
  br label %28

; <label>:38                                      ; preds = %28
  br label %39

; <label>:39                                      ; preds = %50, %38
  %i.3 = phi i32 [ 1, %38 ], [ %51, %50 ]
  %40 = icmp slt i32 %i.3, 257
  br i1 %40, label %41, label %52

; <label>:41                                      ; preds = %39
  %42 = sub nsw i32 %i.3, 1
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds [257 x i32]* %ftab, i32 0, i64 %43
  %45 = load i32* %44, align 4
  %46 = sext i32 %i.3 to i64
  %47 = getelementptr inbounds [257 x i32]* %ftab, i32 0, i64 %46
  %48 = load i32* %47, align 4
  %49 = add nsw i32 %48, %45
  store i32 %49, i32* %47, align 4
  br label %50

; <label>:50                                      ; preds = %41
  %51 = add nsw i32 %i.3, 1
  br label %39

; <label>:52                                      ; preds = %39
  br label %53

; <label>:53                                      ; preds = %68, %52
  %i.4 = phi i32 [ 0, %52 ], [ %69, %68 ]
  %54 = icmp slt i32 %i.4, %nblock
  br i1 %54, label %55, label %70

; <label>:55                                      ; preds = %53
  %56 = sext i32 %i.4 to i64
  %57 = getelementptr inbounds i8* %1, i64 %56
  %58 = load i8* %57, align 1
  %59 = zext i8 %58 to i32
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds [257 x i32]* %ftab, i32 0, i64 %60
  %62 = load i32* %61, align 4
  %63 = sub nsw i32 %62, 1
  %64 = sext i32 %59 to i64
  %65 = getelementptr inbounds [257 x i32]* %ftab, i32 0, i64 %64
  store i32 %63, i32* %65, align 4
  %66 = sext i32 %63 to i64
  %67 = getelementptr inbounds i32* %fmap, i64 %66
  store i32 %i.4, i32* %67, align 4
  br label %68

; <label>:68                                      ; preds = %55
  %69 = add nsw i32 %i.4, 1
  br label %53

; <label>:70                                      ; preds = %53
  %71 = sdiv i32 %nblock, 32
  %72 = add nsw i32 2, %71
  br label %73

; <label>:73                                      ; preds = %78, %70
  %i.5 = phi i32 [ 0, %70 ], [ %79, %78 ]
  %74 = icmp slt i32 %i.5, %72
  br i1 %74, label %75, label %80

; <label>:75                                      ; preds = %73
  %76 = sext i32 %i.5 to i64
  %77 = getelementptr inbounds i32* %bhtab, i64 %76
  store i32 0, i32* %77, align 4
  br label %78

; <label>:78                                      ; preds = %75
  %79 = add nsw i32 %i.5, 1
  br label %73

; <label>:80                                      ; preds = %73
  br label %81

; <label>:81                                      ; preds = %97, %80
  %i.6 = phi i32 [ 0, %80 ], [ %98, %97 ]
  %82 = icmp slt i32 %i.6, 256
  br i1 %82, label %83, label %99

; <label>:83                                      ; preds = %81
  %84 = sext i32 %i.6 to i64
  %85 = getelementptr inbounds [257 x i32]* %ftab, i32 0, i64 %84
  %86 = load i32* %85, align 4
  %87 = and i32 %86, 31
  %88 = shl i32 1, %87
  %89 = sext i32 %i.6 to i64
  %90 = getelementptr inbounds [257 x i32]* %ftab, i32 0, i64 %89
  %91 = load i32* %90, align 4
  %92 = ashr i32 %91, 5
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds i32* %bhtab, i64 %93
  %95 = load i32* %94, align 4
  %96 = or i32 %95, %88
  store i32 %96, i32* %94, align 4
  br label %97

; <label>:97                                      ; preds = %83
  %98 = add nsw i32 %i.6, 1
  br label %81

; <label>:99                                      ; preds = %81
  br label %100

; <label>:100                                     ; preds = %128, %99
  %i.7 = phi i32 [ 0, %99 ], [ %129, %128 ]
  %101 = icmp slt i32 %i.7, 32
  br i1 %101, label %102, label %130

; <label>:102                                     ; preds = %100
  %103 = mul nsw i32 2, %i.7
  %104 = add nsw i32 %nblock, %103
  %105 = and i32 %104, 31
  %106 = shl i32 1, %105
  %107 = mul nsw i32 2, %i.7
  %108 = add nsw i32 %nblock, %107
  %109 = ashr i32 %108, 5
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds i32* %bhtab, i64 %110
  %112 = load i32* %111, align 4
  %113 = or i32 %112, %106
  store i32 %113, i32* %111, align 4
  %114 = mul nsw i32 2, %i.7
  %115 = add nsw i32 %nblock, %114
  %116 = add nsw i32 %115, 1
  %117 = and i32 %116, 31
  %118 = shl i32 1, %117
  %119 = xor i32 %118, -1
  %120 = mul nsw i32 2, %i.7
  %121 = add nsw i32 %nblock, %120
  %122 = add nsw i32 %121, 1
  %123 = ashr i32 %122, 5
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds i32* %bhtab, i64 %124
  %126 = load i32* %125, align 4
  %127 = and i32 %126, %119
  store i32 %127, i32* %125, align 4
  br label %128

; <label>:128                                     ; preds = %102
  %129 = add nsw i32 %i.7, 1
  br label %100

; <label>:130                                     ; preds = %100
  br label %131

; <label>:131                                     ; preds = %309, %130
  %H.0 = phi i32 [ 1, %130 ], [ %304, %309 ]
  %132 = icmp sge i32 %verb, 4
  br i1 %132, label %133, label %136

; <label>:133                                     ; preds = %131
  %134 = load %struct._IO_FILE** @stderr, align 8
  %135 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %134, i8* getelementptr inbounds ([23 x i8]* @.str6, i32 0, i32 0), i32 %H.0)
  br label %136

; <label>:136                                     ; preds = %133, %131
  br label %137

; <label>:137                                     ; preds = %160, %136
  %i.8 = phi i32 [ 0, %136 ], [ %161, %160 ]
  %j.0 = phi i32 [ 0, %136 ], [ %j.1, %160 ]
  %138 = icmp slt i32 %i.8, %nblock
  br i1 %138, label %139, label %162

; <label>:139                                     ; preds = %137
  %140 = ashr i32 %i.8, 5
  %141 = sext i32 %140 to i64
  %142 = getelementptr inbounds i32* %bhtab, i64 %141
  %143 = load i32* %142, align 4
  %144 = and i32 %i.8, 31
  %145 = shl i32 1, %144
  %146 = and i32 %143, %145
  %147 = icmp ne i32 %146, 0
  br i1 %147, label %148, label %149

; <label>:148                                     ; preds = %139
  br label %149

; <label>:149                                     ; preds = %148, %139
  %j.1 = phi i32 [ %i.8, %148 ], [ %j.0, %139 ]
  %150 = sext i32 %i.8 to i64
  %151 = getelementptr inbounds i32* %fmap, i64 %150
  %152 = load i32* %151, align 4
  %153 = sub i32 %152, %H.0
  %154 = icmp slt i32 %153, 0
  br i1 %154, label %155, label %157

; <label>:155                                     ; preds = %149
  %156 = add nsw i32 %153, %nblock
  br label %157

; <label>:157                                     ; preds = %155, %149
  %k.0 = phi i32 [ %156, %155 ], [ %153, %149 ]
  %158 = sext i32 %k.0 to i64
  %159 = getelementptr inbounds i32* %eclass, i64 %158
  store i32 %j.1, i32* %159, align 4
  br label %160

; <label>:160                                     ; preds = %157
  %161 = add nsw i32 %i.8, 1
  br label %137

; <label>:162                                     ; preds = %137
  br label %163

; <label>:163                                     ; preds = %297, %162
  %r.0 = phi i32 [ -1, %162 ], [ %266, %297 ]
  %nNotDone.0 = phi i32 [ 0, %162 ], [ %nNotDone.1, %297 ]
  %164 = add nsw i32 %r.0, 1
  br label %165

; <label>:165                                     ; preds = %179, %163
  %k.1 = phi i32 [ %164, %163 ], [ %180, %179 ]
  %166 = ashr i32 %k.1, 5
  %167 = sext i32 %166 to i64
  %168 = getelementptr inbounds i32* %bhtab, i64 %167
  %169 = load i32* %168, align 4
  %170 = and i32 %k.1, 31
  %171 = shl i32 1, %170
  %172 = and i32 %169, %171
  %173 = icmp ne i32 %172, 0
  br i1 %173, label %174, label %177

; <label>:174                                     ; preds = %165
  %175 = and i32 %k.1, 31
  %176 = icmp ne i32 %175, 0
  br label %177

; <label>:177                                     ; preds = %174, %165
  %178 = phi i1 [ false, %165 ], [ %176, %174 ]
  br i1 %178, label %179, label %181

; <label>:179                                     ; preds = %177
  %180 = add nsw i32 %k.1, 1
  br label %165

; <label>:181                                     ; preds = %177
  %182 = ashr i32 %k.1, 5
  %183 = sext i32 %182 to i64
  %184 = getelementptr inbounds i32* %bhtab, i64 %183
  %185 = load i32* %184, align 4
  %186 = and i32 %k.1, 31
  %187 = shl i32 1, %186
  %188 = and i32 %185, %187
  %189 = icmp ne i32 %188, 0
  br i1 %189, label %190, label %212

; <label>:190                                     ; preds = %181
  br label %191

; <label>:191                                     ; preds = %197, %190
  %k.2 = phi i32 [ %k.1, %190 ], [ %198, %197 ]
  %192 = ashr i32 %k.2, 5
  %193 = sext i32 %192 to i64
  %194 = getelementptr inbounds i32* %bhtab, i64 %193
  %195 = load i32* %194, align 4
  %196 = icmp eq i32 %195, -1
  br i1 %196, label %197, label %199

; <label>:197                                     ; preds = %191
  %198 = add nsw i32 %k.2, 32
  br label %191

; <label>:199                                     ; preds = %191
  br label %200

; <label>:200                                     ; preds = %209, %199
  %k.3 = phi i32 [ %k.2, %199 ], [ %210, %209 ]
  %201 = ashr i32 %k.3, 5
  %202 = sext i32 %201 to i64
  %203 = getelementptr inbounds i32* %bhtab, i64 %202
  %204 = load i32* %203, align 4
  %205 = and i32 %k.3, 31
  %206 = shl i32 1, %205
  %207 = and i32 %204, %206
  %208 = icmp ne i32 %207, 0
  br i1 %208, label %209, label %211

; <label>:209                                     ; preds = %200
  %210 = add nsw i32 %k.3, 1
  br label %200

; <label>:211                                     ; preds = %200
  br label %212

; <label>:212                                     ; preds = %211, %181
  %k.4 = phi i32 [ %k.3, %211 ], [ %k.1, %181 ]
  %213 = sub nsw i32 %k.4, 1
  %214 = icmp sge i32 %213, %nblock
  br i1 %214, label %215, label %216

; <label>:215                                     ; preds = %212
  br label %298

; <label>:216                                     ; preds = %212
  br label %217

; <label>:217                                     ; preds = %231, %216
  %k.5 = phi i32 [ %k.4, %216 ], [ %232, %231 ]
  %218 = ashr i32 %k.5, 5
  %219 = sext i32 %218 to i64
  %220 = getelementptr inbounds i32* %bhtab, i64 %219
  %221 = load i32* %220, align 4
  %222 = and i32 %k.5, 31
  %223 = shl i32 1, %222
  %224 = and i32 %221, %223
  %225 = icmp ne i32 %224, 0
  br i1 %225, label %229, label %226

; <label>:226                                     ; preds = %217
  %227 = and i32 %k.5, 31
  %228 = icmp ne i32 %227, 0
  br label %229

; <label>:229                                     ; preds = %226, %217
  %230 = phi i1 [ false, %217 ], [ %228, %226 ]
  br i1 %230, label %231, label %233

; <label>:231                                     ; preds = %229
  %232 = add nsw i32 %k.5, 1
  br label %217

; <label>:233                                     ; preds = %229
  %234 = ashr i32 %k.5, 5
  %235 = sext i32 %234 to i64
  %236 = getelementptr inbounds i32* %bhtab, i64 %235
  %237 = load i32* %236, align 4
  %238 = and i32 %k.5, 31
  %239 = shl i32 1, %238
  %240 = and i32 %237, %239
  %241 = icmp ne i32 %240, 0
  br i1 %241, label %265, label %242

; <label>:242                                     ; preds = %233
  br label %243

; <label>:243                                     ; preds = %249, %242
  %k.6 = phi i32 [ %k.5, %242 ], [ %250, %249 ]
  %244 = ashr i32 %k.6, 5
  %245 = sext i32 %244 to i64
  %246 = getelementptr inbounds i32* %bhtab, i64 %245
  %247 = load i32* %246, align 4
  %248 = icmp eq i32 %247, 0
  br i1 %248, label %249, label %251

; <label>:249                                     ; preds = %243
  %250 = add nsw i32 %k.6, 32
  br label %243

; <label>:251                                     ; preds = %243
  br label %252

; <label>:252                                     ; preds = %262, %251
  %k.7 = phi i32 [ %k.6, %251 ], [ %263, %262 ]
  %253 = ashr i32 %k.7, 5
  %254 = sext i32 %253 to i64
  %255 = getelementptr inbounds i32* %bhtab, i64 %254
  %256 = load i32* %255, align 4
  %257 = and i32 %k.7, 31
  %258 = shl i32 1, %257
  %259 = and i32 %256, %258
  %260 = icmp ne i32 %259, 0
  %261 = xor i1 %260, true
  br i1 %261, label %262, label %264

; <label>:262                                     ; preds = %252
  %263 = add nsw i32 %k.7, 1
  br label %252

; <label>:264                                     ; preds = %252
  br label %265

; <label>:265                                     ; preds = %264, %233
  %k.8 = phi i32 [ %k.5, %233 ], [ %k.7, %264 ]
  %266 = sub nsw i32 %k.8, 1
  %267 = icmp sge i32 %266, %nblock
  br i1 %267, label %268, label %269

; <label>:268                                     ; preds = %265
  br label %298

; <label>:269                                     ; preds = %265
  %270 = icmp sgt i32 %266, %213
  br i1 %270, label %271, label %297

; <label>:271                                     ; preds = %269
  %272 = sub nsw i32 %266, %213
  %273 = add nsw i32 %272, 1
  %274 = add nsw i32 %nNotDone.0, %273
  call void @fallbackQSort3(i32* %fmap, i32* %eclass, i32 %213, i32 %266)
  br label %275

; <label>:275                                     ; preds = %294, %271
  %i.9 = phi i32 [ %213, %271 ], [ %295, %294 ]
  %cc.0 = phi i32 [ -1, %271 ], [ %cc.1, %294 ]
  %276 = icmp sle i32 %i.9, %266
  br i1 %276, label %277, label %296

; <label>:277                                     ; preds = %275
  %278 = sext i32 %i.9 to i64
  %279 = getelementptr inbounds i32* %fmap, i64 %278
  %280 = load i32* %279, align 4
  %281 = zext i32 %280 to i64
  %282 = getelementptr inbounds i32* %eclass, i64 %281
  %283 = load i32* %282, align 4
  %284 = icmp ne i32 %cc.0, %283
  br i1 %284, label %285, label %293

; <label>:285                                     ; preds = %277
  %286 = and i32 %i.9, 31
  %287 = shl i32 1, %286
  %288 = ashr i32 %i.9, 5
  %289 = sext i32 %288 to i64
  %290 = getelementptr inbounds i32* %bhtab, i64 %289
  %291 = load i32* %290, align 4
  %292 = or i32 %291, %287
  store i32 %292, i32* %290, align 4
  br label %293

; <label>:293                                     ; preds = %285, %277
  %cc.1 = phi i32 [ %283, %285 ], [ %cc.0, %277 ]
  br label %294

; <label>:294                                     ; preds = %293
  %295 = add nsw i32 %i.9, 1
  br label %275

; <label>:296                                     ; preds = %275
  br label %297

; <label>:297                                     ; preds = %296, %269
  %nNotDone.1 = phi i32 [ %274, %296 ], [ %nNotDone.0, %269 ]
  br label %163

; <label>:298                                     ; preds = %268, %215
  %299 = icmp sge i32 %verb, 4
  br i1 %299, label %300, label %303

; <label>:300                                     ; preds = %298
  %301 = load %struct._IO_FILE** @stderr, align 8
  %302 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %301, i8* getelementptr inbounds ([24 x i8]* @.str7, i32 0, i32 0), i32 %nNotDone.0)
  br label %303

; <label>:303                                     ; preds = %300, %298
  %304 = mul nsw i32 %H.0, 2
  %305 = icmp sgt i32 %304, %nblock
  br i1 %305, label %308, label %306

; <label>:306                                     ; preds = %303
  %307 = icmp eq i32 %nNotDone.0, 0
  br i1 %307, label %308, label %309

; <label>:308                                     ; preds = %306, %303
  br label %310

; <label>:309                                     ; preds = %306
  br label %131

; <label>:310                                     ; preds = %308
  %311 = icmp sge i32 %verb, 4
  br i1 %311, label %312, label %315

; <label>:312                                     ; preds = %310
  %313 = load %struct._IO_FILE** @stderr, align 8
  %314 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %313, i8* getelementptr inbounds ([34 x i8]* @.str8, i32 0, i32 0))
  br label %315

; <label>:315                                     ; preds = %312, %310
  br label %316

; <label>:316                                     ; preds = %337, %315
  %i.10 = phi i32 [ 0, %315 ], [ %338, %337 ]
  %j.2 = phi i32 [ 0, %315 ], [ %j.3, %337 ]
  %317 = icmp slt i32 %i.10, %nblock
  br i1 %317, label %318, label %339

; <label>:318                                     ; preds = %316
  br label %319

; <label>:319                                     ; preds = %324, %318
  %j.3 = phi i32 [ %j.2, %318 ], [ %325, %324 ]
  %320 = sext i32 %j.3 to i64
  %321 = getelementptr inbounds [256 x i32]* %ftabCopy, i32 0, i64 %320
  %322 = load i32* %321, align 4
  %323 = icmp eq i32 %322, 0
  br i1 %323, label %324, label %326

; <label>:324                                     ; preds = %319
  %325 = add nsw i32 %j.3, 1
  br label %319

; <label>:326                                     ; preds = %319
  %327 = sext i32 %j.3 to i64
  %328 = getelementptr inbounds [256 x i32]* %ftabCopy, i32 0, i64 %327
  %329 = load i32* %328, align 4
  %330 = add nsw i32 %329, -1
  store i32 %330, i32* %328, align 4
  %331 = trunc i32 %j.3 to i8
  %332 = sext i32 %i.10 to i64
  %333 = getelementptr inbounds i32* %fmap, i64 %332
  %334 = load i32* %333, align 4
  %335 = zext i32 %334 to i64
  %336 = getelementptr inbounds i8* %1, i64 %335
  store i8 %331, i8* %336, align 1
  br label %337

; <label>:337                                     ; preds = %326
  %338 = add nsw i32 %i.10, 1
  br label %316

; <label>:339                                     ; preds = %316
  %340 = icmp slt i32 %j.2, 256
  br i1 %340, label %342, label %341

; <label>:341                                     ; preds = %339
  call void @BZ2_bz__AssertH__fail(i32 1005)
  br label %342

; <label>:342                                     ; preds = %341, %339
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @mainSort(i32* %ptr, i8* %block, i16* %quadrant, i32* %ftab, i32 %nblock, i32 %verb, i32* %budget) #0 {
  %runningOrder = alloca [256 x i32], align 16
  %bigDone = alloca [256 x i8], align 16
  %copyStart = alloca [256 x i32], align 16
  %copyEnd = alloca [256 x i32], align 16
  %1 = icmp sge i32 %verb, 4
  br i1 %1, label %2, label %5

; <label>:2                                       ; preds = %0
  %3 = load %struct._IO_FILE** @stderr, align 8
  %4 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([34 x i8]* @.str2, i32 0, i32 0))
  br label %5

; <label>:5                                       ; preds = %2, %0
  br label %6

; <label>:6                                       ; preds = %11, %5
  %i.0 = phi i32 [ 65536, %5 ], [ %12, %11 ]
  %7 = icmp sge i32 %i.0, 0
  br i1 %7, label %8, label %13

; <label>:8                                       ; preds = %6
  %9 = sext i32 %i.0 to i64
  %10 = getelementptr inbounds i32* %ftab, i64 %9
  store i32 0, i32* %10, align 4
  br label %11

; <label>:11                                      ; preds = %8
  %12 = add nsw i32 %i.0, -1
  br label %6

; <label>:13                                      ; preds = %6
  %14 = getelementptr inbounds i8* %block, i64 0
  %15 = load i8* %14, align 1
  %16 = zext i8 %15 to i32
  %17 = shl i32 %16, 8
  %18 = sub nsw i32 %nblock, 1
  br label %19

; <label>:19                                      ; preds = %84, %13
  %i.1 = phi i32 [ %18, %13 ], [ %85, %84 ]
  %j.0 = phi i32 [ %17, %13 ], [ %79, %84 ]
  %20 = icmp sge i32 %i.1, 3
  br i1 %20, label %21, label %86

; <label>:21                                      ; preds = %19
  %22 = sext i32 %i.1 to i64
  %23 = getelementptr inbounds i16* %quadrant, i64 %22
  store i16 0, i16* %23, align 2
  %24 = ashr i32 %j.0, 8
  %25 = sext i32 %i.1 to i64
  %26 = getelementptr inbounds i8* %block, i64 %25
  %27 = load i8* %26, align 1
  %28 = zext i8 %27 to i16
  %29 = zext i16 %28 to i32
  %30 = shl i32 %29, 8
  %31 = or i32 %24, %30
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds i32* %ftab, i64 %32
  %34 = load i32* %33, align 4
  %35 = add i32 %34, 1
  store i32 %35, i32* %33, align 4
  %36 = sub nsw i32 %i.1, 1
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds i16* %quadrant, i64 %37
  store i16 0, i16* %38, align 2
  %39 = ashr i32 %31, 8
  %40 = sub nsw i32 %i.1, 1
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds i8* %block, i64 %41
  %43 = load i8* %42, align 1
  %44 = zext i8 %43 to i16
  %45 = zext i16 %44 to i32
  %46 = shl i32 %45, 8
  %47 = or i32 %39, %46
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds i32* %ftab, i64 %48
  %50 = load i32* %49, align 4
  %51 = add i32 %50, 1
  store i32 %51, i32* %49, align 4
  %52 = sub nsw i32 %i.1, 2
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds i16* %quadrant, i64 %53
  store i16 0, i16* %54, align 2
  %55 = ashr i32 %47, 8
  %56 = sub nsw i32 %i.1, 2
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds i8* %block, i64 %57
  %59 = load i8* %58, align 1
  %60 = zext i8 %59 to i16
  %61 = zext i16 %60 to i32
  %62 = shl i32 %61, 8
  %63 = or i32 %55, %62
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds i32* %ftab, i64 %64
  %66 = load i32* %65, align 4
  %67 = add i32 %66, 1
  store i32 %67, i32* %65, align 4
  %68 = sub nsw i32 %i.1, 3
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds i16* %quadrant, i64 %69
  store i16 0, i16* %70, align 2
  %71 = ashr i32 %63, 8
  %72 = sub nsw i32 %i.1, 3
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds i8* %block, i64 %73
  %75 = load i8* %74, align 1
  %76 = zext i8 %75 to i16
  %77 = zext i16 %76 to i32
  %78 = shl i32 %77, 8
  %79 = or i32 %71, %78
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds i32* %ftab, i64 %80
  %82 = load i32* %81, align 4
  %83 = add i32 %82, 1
  store i32 %83, i32* %81, align 4
  br label %84

; <label>:84                                      ; preds = %21
  %85 = sub nsw i32 %i.1, 4
  br label %19

; <label>:86                                      ; preds = %19
  br label %87

; <label>:87                                      ; preds = %104, %86
  %i.2 = phi i32 [ %i.1, %86 ], [ %105, %104 ]
  %j.1 = phi i32 [ %j.0, %86 ], [ %99, %104 ]
  %88 = icmp sge i32 %i.2, 0
  br i1 %88, label %89, label %106

; <label>:89                                      ; preds = %87
  %90 = sext i32 %i.2 to i64
  %91 = getelementptr inbounds i16* %quadrant, i64 %90
  store i16 0, i16* %91, align 2
  %92 = ashr i32 %j.1, 8
  %93 = sext i32 %i.2 to i64
  %94 = getelementptr inbounds i8* %block, i64 %93
  %95 = load i8* %94, align 1
  %96 = zext i8 %95 to i16
  %97 = zext i16 %96 to i32
  %98 = shl i32 %97, 8
  %99 = or i32 %92, %98
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds i32* %ftab, i64 %100
  %102 = load i32* %101, align 4
  %103 = add i32 %102, 1
  store i32 %103, i32* %101, align 4
  br label %104

; <label>:104                                     ; preds = %89
  %105 = add nsw i32 %i.2, -1
  br label %87

; <label>:106                                     ; preds = %87
  br label %107

; <label>:107                                     ; preds = %119, %106
  %i.3 = phi i32 [ 0, %106 ], [ %120, %119 ]
  %108 = icmp slt i32 %i.3, 34
  br i1 %108, label %109, label %121

; <label>:109                                     ; preds = %107
  %110 = sext i32 %i.3 to i64
  %111 = getelementptr inbounds i8* %block, i64 %110
  %112 = load i8* %111, align 1
  %113 = add nsw i32 %nblock, %i.3
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds i8* %block, i64 %114
  store i8 %112, i8* %115, align 1
  %116 = add nsw i32 %nblock, %i.3
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds i16* %quadrant, i64 %117
  store i16 0, i16* %118, align 2
  br label %119

; <label>:119                                     ; preds = %109
  %120 = add nsw i32 %i.3, 1
  br label %107

; <label>:121                                     ; preds = %107
  %122 = icmp sge i32 %verb, 4
  br i1 %122, label %123, label %126

; <label>:123                                     ; preds = %121
  %124 = load %struct._IO_FILE** @stderr, align 8
  %125 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %124, i8* getelementptr inbounds ([28 x i8]* @.str3, i32 0, i32 0))
  br label %126

; <label>:126                                     ; preds = %123, %121
  br label %127

; <label>:127                                     ; preds = %138, %126
  %i.4 = phi i32 [ 1, %126 ], [ %139, %138 ]
  %128 = icmp sle i32 %i.4, 65536
  br i1 %128, label %129, label %140

; <label>:129                                     ; preds = %127
  %130 = sub nsw i32 %i.4, 1
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds i32* %ftab, i64 %131
  %133 = load i32* %132, align 4
  %134 = sext i32 %i.4 to i64
  %135 = getelementptr inbounds i32* %ftab, i64 %134
  %136 = load i32* %135, align 4
  %137 = add i32 %136, %133
  store i32 %137, i32* %135, align 4
  br label %138

; <label>:138                                     ; preds = %129
  %139 = add nsw i32 %i.4, 1
  br label %127

; <label>:140                                     ; preds = %127
  %141 = getelementptr inbounds i8* %block, i64 0
  %142 = load i8* %141, align 1
  %143 = zext i8 %142 to i32
  %144 = shl i32 %143, 8
  %145 = trunc i32 %144 to i16
  %146 = sub nsw i32 %nblock, 1
  br label %147

; <label>:147                                     ; preds = %224, %140
  %i.5 = phi i32 [ %146, %140 ], [ %225, %224 ]
  %s.0 = phi i16 [ %145, %140 ], [ %214, %224 ]
  %148 = icmp sge i32 %i.5, 3
  br i1 %148, label %149, label %226

; <label>:149                                     ; preds = %147
  %150 = zext i16 %s.0 to i32
  %151 = ashr i32 %150, 8
  %152 = sext i32 %i.5 to i64
  %153 = getelementptr inbounds i8* %block, i64 %152
  %154 = load i8* %153, align 1
  %155 = zext i8 %154 to i32
  %156 = shl i32 %155, 8
  %157 = or i32 %151, %156
  %158 = trunc i32 %157 to i16
  %159 = zext i16 %158 to i64
  %160 = getelementptr inbounds i32* %ftab, i64 %159
  %161 = load i32* %160, align 4
  %162 = sub i32 %161, 1
  %163 = zext i16 %158 to i64
  %164 = getelementptr inbounds i32* %ftab, i64 %163
  store i32 %162, i32* %164, align 4
  %165 = sext i32 %162 to i64
  %166 = getelementptr inbounds i32* %ptr, i64 %165
  store i32 %i.5, i32* %166, align 4
  %167 = zext i16 %158 to i32
  %168 = ashr i32 %167, 8
  %169 = sub nsw i32 %i.5, 1
  %170 = sext i32 %169 to i64
  %171 = getelementptr inbounds i8* %block, i64 %170
  %172 = load i8* %171, align 1
  %173 = zext i8 %172 to i32
  %174 = shl i32 %173, 8
  %175 = or i32 %168, %174
  %176 = trunc i32 %175 to i16
  %177 = zext i16 %176 to i64
  %178 = getelementptr inbounds i32* %ftab, i64 %177
  %179 = load i32* %178, align 4
  %180 = sub i32 %179, 1
  %181 = zext i16 %176 to i64
  %182 = getelementptr inbounds i32* %ftab, i64 %181
  store i32 %180, i32* %182, align 4
  %183 = sub nsw i32 %i.5, 1
  %184 = sext i32 %180 to i64
  %185 = getelementptr inbounds i32* %ptr, i64 %184
  store i32 %183, i32* %185, align 4
  %186 = zext i16 %176 to i32
  %187 = ashr i32 %186, 8
  %188 = sub nsw i32 %i.5, 2
  %189 = sext i32 %188 to i64
  %190 = getelementptr inbounds i8* %block, i64 %189
  %191 = load i8* %190, align 1
  %192 = zext i8 %191 to i32
  %193 = shl i32 %192, 8
  %194 = or i32 %187, %193
  %195 = trunc i32 %194 to i16
  %196 = zext i16 %195 to i64
  %197 = getelementptr inbounds i32* %ftab, i64 %196
  %198 = load i32* %197, align 4
  %199 = sub i32 %198, 1
  %200 = zext i16 %195 to i64
  %201 = getelementptr inbounds i32* %ftab, i64 %200
  store i32 %199, i32* %201, align 4
  %202 = sub nsw i32 %i.5, 2
  %203 = sext i32 %199 to i64
  %204 = getelementptr inbounds i32* %ptr, i64 %203
  store i32 %202, i32* %204, align 4
  %205 = zext i16 %195 to i32
  %206 = ashr i32 %205, 8
  %207 = sub nsw i32 %i.5, 3
  %208 = sext i32 %207 to i64
  %209 = getelementptr inbounds i8* %block, i64 %208
  %210 = load i8* %209, align 1
  %211 = zext i8 %210 to i32
  %212 = shl i32 %211, 8
  %213 = or i32 %206, %212
  %214 = trunc i32 %213 to i16
  %215 = zext i16 %214 to i64
  %216 = getelementptr inbounds i32* %ftab, i64 %215
  %217 = load i32* %216, align 4
  %218 = sub i32 %217, 1
  %219 = zext i16 %214 to i64
  %220 = getelementptr inbounds i32* %ftab, i64 %219
  store i32 %218, i32* %220, align 4
  %221 = sub nsw i32 %i.5, 3
  %222 = sext i32 %218 to i64
  %223 = getelementptr inbounds i32* %ptr, i64 %222
  store i32 %221, i32* %223, align 4
  br label %224

; <label>:224                                     ; preds = %149
  %225 = sub nsw i32 %i.5, 4
  br label %147

; <label>:226                                     ; preds = %147
  br label %227

; <label>:227                                     ; preds = %247, %226
  %i.6 = phi i32 [ %i.5, %226 ], [ %248, %247 ]
  %s.1 = phi i16 [ %s.0, %226 ], [ %238, %247 ]
  %228 = icmp sge i32 %i.6, 0
  br i1 %228, label %229, label %249

; <label>:229                                     ; preds = %227
  %230 = zext i16 %s.1 to i32
  %231 = ashr i32 %230, 8
  %232 = sext i32 %i.6 to i64
  %233 = getelementptr inbounds i8* %block, i64 %232
  %234 = load i8* %233, align 1
  %235 = zext i8 %234 to i32
  %236 = shl i32 %235, 8
  %237 = or i32 %231, %236
  %238 = trunc i32 %237 to i16
  %239 = zext i16 %238 to i64
  %240 = getelementptr inbounds i32* %ftab, i64 %239
  %241 = load i32* %240, align 4
  %242 = sub i32 %241, 1
  %243 = zext i16 %238 to i64
  %244 = getelementptr inbounds i32* %ftab, i64 %243
  store i32 %242, i32* %244, align 4
  %245 = sext i32 %242 to i64
  %246 = getelementptr inbounds i32* %ptr, i64 %245
  store i32 %i.6, i32* %246, align 4
  br label %247

; <label>:247                                     ; preds = %229
  %248 = add nsw i32 %i.6, -1
  br label %227

; <label>:249                                     ; preds = %227
  br label %250

; <label>:250                                     ; preds = %257, %249
  %i.7 = phi i32 [ 0, %249 ], [ %258, %257 ]
  %251 = icmp sle i32 %i.7, 255
  br i1 %251, label %252, label %259

; <label>:252                                     ; preds = %250
  %253 = sext i32 %i.7 to i64
  %254 = getelementptr inbounds [256 x i8]* %bigDone, i32 0, i64 %253
  store i8 0, i8* %254, align 1
  %255 = sext i32 %i.7 to i64
  %256 = getelementptr inbounds [256 x i32]* %runningOrder, i32 0, i64 %255
  store i32 %i.7, i32* %256, align 4
  br label %257

; <label>:257                                     ; preds = %252
  %258 = add nsw i32 %i.7, 1
  br label %250

; <label>:259                                     ; preds = %250
  br label %260

; <label>:260                                     ; preds = %263, %259
  %h.0 = phi i32 [ 1, %259 ], [ %262, %263 ]
  %261 = mul nsw i32 3, %h.0
  %262 = add nsw i32 %261, 1
  br label %263

; <label>:263                                     ; preds = %260
  %264 = icmp sle i32 %262, 256
  br i1 %264, label %260, label %265

; <label>:265                                     ; preds = %263
  br label %266

; <label>:266                                     ; preds = %323, %265
  %h.1 = phi i32 [ %262, %265 ], [ %267, %323 ]
  %267 = sdiv i32 %h.1, 3
  br label %268

; <label>:268                                     ; preds = %320, %266
  %i.8 = phi i32 [ %267, %266 ], [ %321, %320 ]
  %269 = icmp sle i32 %i.8, 255
  br i1 %269, label %270, label %322

; <label>:270                                     ; preds = %268
  %271 = sext i32 %i.8 to i64
  %272 = getelementptr inbounds [256 x i32]* %runningOrder, i32 0, i64 %271
  %273 = load i32* %272, align 4
  br label %274

; <label>:274                                     ; preds = %315, %270
  %j.2 = phi i32 [ %i.8, %270 ], [ %311, %315 ]
  %275 = sub nsw i32 %j.2, %267
  %276 = sext i32 %275 to i64
  %277 = getelementptr inbounds [256 x i32]* %runningOrder, i32 0, i64 %276
  %278 = load i32* %277, align 4
  %279 = add nsw i32 %278, 1
  %280 = shl i32 %279, 8
  %281 = sext i32 %280 to i64
  %282 = getelementptr inbounds i32* %ftab, i64 %281
  %283 = load i32* %282, align 4
  %284 = sub nsw i32 %j.2, %267
  %285 = sext i32 %284 to i64
  %286 = getelementptr inbounds [256 x i32]* %runningOrder, i32 0, i64 %285
  %287 = load i32* %286, align 4
  %288 = shl i32 %287, 8
  %289 = sext i32 %288 to i64
  %290 = getelementptr inbounds i32* %ftab, i64 %289
  %291 = load i32* %290, align 4
  %292 = sub i32 %283, %291
  %293 = add nsw i32 %273, 1
  %294 = shl i32 %293, 8
  %295 = sext i32 %294 to i64
  %296 = getelementptr inbounds i32* %ftab, i64 %295
  %297 = load i32* %296, align 4
  %298 = shl i32 %273, 8
  %299 = sext i32 %298 to i64
  %300 = getelementptr inbounds i32* %ftab, i64 %299
  %301 = load i32* %300, align 4
  %302 = sub i32 %297, %301
  %303 = icmp ugt i32 %292, %302
  br i1 %303, label %304, label %316

; <label>:304                                     ; preds = %274
  %305 = sub nsw i32 %j.2, %267
  %306 = sext i32 %305 to i64
  %307 = getelementptr inbounds [256 x i32]* %runningOrder, i32 0, i64 %306
  %308 = load i32* %307, align 4
  %309 = sext i32 %j.2 to i64
  %310 = getelementptr inbounds [256 x i32]* %runningOrder, i32 0, i64 %309
  store i32 %308, i32* %310, align 4
  %311 = sub nsw i32 %j.2, %267
  %312 = sub nsw i32 %267, 1
  %313 = icmp sle i32 %311, %312
  br i1 %313, label %314, label %315

; <label>:314                                     ; preds = %304
  br label %317

; <label>:315                                     ; preds = %304
  br label %274

; <label>:316                                     ; preds = %274
  br label %317

; <label>:317                                     ; preds = %316, %314
  %j.3 = phi i32 [ %311, %314 ], [ %j.2, %316 ]
  %318 = sext i32 %j.3 to i64
  %319 = getelementptr inbounds [256 x i32]* %runningOrder, i32 0, i64 %318
  store i32 %273, i32* %319, align 4
  br label %320

; <label>:320                                     ; preds = %317
  %321 = add nsw i32 %i.8, 1
  br label %268

; <label>:322                                     ; preds = %268
  br label %323

; <label>:323                                     ; preds = %322
  %324 = icmp ne i32 %267, 1
  br i1 %324, label %266, label %325

; <label>:325                                     ; preds = %323
  br label %326

; <label>:326                                     ; preds = %569, %325
  %i.9 = phi i32 [ 0, %325 ], [ %570, %569 ]
  %numQSorted.0 = phi i32 [ 0, %325 ], [ %numQSorted.1, %569 ]
  %327 = icmp sle i32 %i.9, 255
  br i1 %327, label %328, label %571

; <label>:328                                     ; preds = %326
  %329 = sext i32 %i.9 to i64
  %330 = getelementptr inbounds [256 x i32]* %runningOrder, i32 0, i64 %329
  %331 = load i32* %330, align 4
  br label %332

; <label>:332                                     ; preds = %378, %328
  %j.4 = phi i32 [ 0, %328 ], [ %379, %378 ]
  %numQSorted.1 = phi i32 [ %numQSorted.0, %328 ], [ %numQSorted.4, %378 ]
  %333 = icmp sle i32 %j.4, 255
  br i1 %333, label %334, label %380

; <label>:334                                     ; preds = %332
  %335 = icmp ne i32 %j.4, %331
  br i1 %335, label %336, label %377

; <label>:336                                     ; preds = %334
  %337 = shl i32 %331, 8
  %338 = add nsw i32 %337, %j.4
  %339 = sext i32 %338 to i64
  %340 = getelementptr inbounds i32* %ftab, i64 %339
  %341 = load i32* %340, align 4
  %342 = and i32 %341, 2097152
  %343 = icmp ne i32 %342, 0
  br i1 %343, label %372, label %344

; <label>:344                                     ; preds = %336
  %345 = sext i32 %338 to i64
  %346 = getelementptr inbounds i32* %ftab, i64 %345
  %347 = load i32* %346, align 4
  %348 = and i32 %347, -2097153
  %349 = add nsw i32 %338, 1
  %350 = sext i32 %349 to i64
  %351 = getelementptr inbounds i32* %ftab, i64 %350
  %352 = load i32* %351, align 4
  %353 = and i32 %352, -2097153
  %354 = sub i32 %353, 1
  %355 = icmp sgt i32 %354, %348
  br i1 %355, label %356, label %371

; <label>:356                                     ; preds = %344
  %357 = icmp sge i32 %verb, 4
  br i1 %357, label %358, label %363

; <label>:358                                     ; preds = %356
  %359 = load %struct._IO_FILE** @stderr, align 8
  %360 = sub nsw i32 %354, %348
  %361 = add nsw i32 %360, 1
  %362 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %359, i8* getelementptr inbounds ([48 x i8]* @.str4, i32 0, i32 0), i32 %331, i32 %j.4, i32 %numQSorted.1, i32 %361)
  br label %363

; <label>:363                                     ; preds = %358, %356
  call void @mainQSort3(i32* %ptr, i8* %block, i16* %quadrant, i32 %nblock, i32 %348, i32 %354, i32 2, i32* %budget)
  %364 = sub nsw i32 %354, %348
  %365 = add nsw i32 %364, 1
  %366 = add nsw i32 %numQSorted.1, %365
  %367 = load i32* %budget, align 4
  %368 = icmp slt i32 %367, 0
  br i1 %368, label %369, label %370

; <label>:369                                     ; preds = %363
  br label %577

; <label>:370                                     ; preds = %363
  br label %371

; <label>:371                                     ; preds = %370, %344
  %numQSorted.2 = phi i32 [ %366, %370 ], [ %numQSorted.1, %344 ]
  br label %372

; <label>:372                                     ; preds = %371, %336
  %numQSorted.3 = phi i32 [ %numQSorted.1, %336 ], [ %numQSorted.2, %371 ]
  %373 = sext i32 %338 to i64
  %374 = getelementptr inbounds i32* %ftab, i64 %373
  %375 = load i32* %374, align 4
  %376 = or i32 %375, 2097152
  store i32 %376, i32* %374, align 4
  br label %377

; <label>:377                                     ; preds = %372, %334
  %numQSorted.4 = phi i32 [ %numQSorted.3, %372 ], [ %numQSorted.1, %334 ]
  br label %378

; <label>:378                                     ; preds = %377
  %379 = add nsw i32 %j.4, 1
  br label %332

; <label>:380                                     ; preds = %332
  %381 = sext i32 %331 to i64
  %382 = getelementptr inbounds [256 x i8]* %bigDone, i32 0, i64 %381
  %383 = load i8* %382, align 1
  %384 = icmp ne i8 %383, 0
  br i1 %384, label %385, label %386

; <label>:385                                     ; preds = %380
  call void @BZ2_bz__AssertH__fail(i32 1006)
  br label %386

; <label>:386                                     ; preds = %385, %380
  br label %387

; <label>:387                                     ; preds = %408, %386
  %j.5 = phi i32 [ 0, %386 ], [ %409, %408 ]
  %388 = icmp sle i32 %j.5, 255
  br i1 %388, label %389, label %410

; <label>:389                                     ; preds = %387
  %390 = shl i32 %j.5, 8
  %391 = add nsw i32 %390, %331
  %392 = sext i32 %391 to i64
  %393 = getelementptr inbounds i32* %ftab, i64 %392
  %394 = load i32* %393, align 4
  %395 = and i32 %394, -2097153
  %396 = sext i32 %j.5 to i64
  %397 = getelementptr inbounds [256 x i32]* %copyStart, i32 0, i64 %396
  store i32 %395, i32* %397, align 4
  %398 = shl i32 %j.5, 8
  %399 = add nsw i32 %398, %331
  %400 = add nsw i32 %399, 1
  %401 = sext i32 %400 to i64
  %402 = getelementptr inbounds i32* %ftab, i64 %401
  %403 = load i32* %402, align 4
  %404 = and i32 %403, -2097153
  %405 = sub i32 %404, 1
  %406 = sext i32 %j.5 to i64
  %407 = getelementptr inbounds [256 x i32]* %copyEnd, i32 0, i64 %406
  store i32 %405, i32* %407, align 4
  br label %408

; <label>:408                                     ; preds = %389
  %409 = add nsw i32 %j.5, 1
  br label %387

; <label>:410                                     ; preds = %387
  %411 = shl i32 %331, 8
  %412 = sext i32 %411 to i64
  %413 = getelementptr inbounds i32* %ftab, i64 %412
  %414 = load i32* %413, align 4
  %415 = and i32 %414, -2097153
  br label %416

; <label>:416                                     ; preds = %445, %410
  %j.6 = phi i32 [ %415, %410 ], [ %446, %445 ]
  %417 = sext i32 %331 to i64
  %418 = getelementptr inbounds [256 x i32]* %copyStart, i32 0, i64 %417
  %419 = load i32* %418, align 4
  %420 = icmp slt i32 %j.6, %419
  br i1 %420, label %421, label %447

; <label>:421                                     ; preds = %416
  %422 = sext i32 %j.6 to i64
  %423 = getelementptr inbounds i32* %ptr, i64 %422
  %424 = load i32* %423, align 4
  %425 = sub i32 %424, 1
  %426 = icmp slt i32 %425, 0
  br i1 %426, label %427, label %429

; <label>:427                                     ; preds = %421
  %428 = add nsw i32 %425, %nblock
  br label %429

; <label>:429                                     ; preds = %427, %421
  %k.0 = phi i32 [ %428, %427 ], [ %425, %421 ]
  %430 = sext i32 %k.0 to i64
  %431 = getelementptr inbounds i8* %block, i64 %430
  %432 = load i8* %431, align 1
  %433 = zext i8 %432 to i64
  %434 = getelementptr inbounds [256 x i8]* %bigDone, i32 0, i64 %433
  %435 = load i8* %434, align 1
  %436 = icmp ne i8 %435, 0
  br i1 %436, label %444, label %437

; <label>:437                                     ; preds = %429
  %438 = zext i8 %432 to i64
  %439 = getelementptr inbounds [256 x i32]* %copyStart, i32 0, i64 %438
  %440 = load i32* %439, align 4
  %441 = add nsw i32 %440, 1
  store i32 %441, i32* %439, align 4
  %442 = sext i32 %440 to i64
  %443 = getelementptr inbounds i32* %ptr, i64 %442
  store i32 %k.0, i32* %443, align 4
  br label %444

; <label>:444                                     ; preds = %437, %429
  br label %445

; <label>:445                                     ; preds = %444
  %446 = add nsw i32 %j.6, 1
  br label %416

; <label>:447                                     ; preds = %416
  %448 = add nsw i32 %331, 1
  %449 = shl i32 %448, 8
  %450 = sext i32 %449 to i64
  %451 = getelementptr inbounds i32* %ftab, i64 %450
  %452 = load i32* %451, align 4
  %453 = and i32 %452, -2097153
  %454 = sub i32 %453, 1
  br label %455

; <label>:455                                     ; preds = %484, %447
  %j.7 = phi i32 [ %454, %447 ], [ %485, %484 ]
  %456 = sext i32 %331 to i64
  %457 = getelementptr inbounds [256 x i32]* %copyEnd, i32 0, i64 %456
  %458 = load i32* %457, align 4
  %459 = icmp sgt i32 %j.7, %458
  br i1 %459, label %460, label %486

; <label>:460                                     ; preds = %455
  %461 = sext i32 %j.7 to i64
  %462 = getelementptr inbounds i32* %ptr, i64 %461
  %463 = load i32* %462, align 4
  %464 = sub i32 %463, 1
  %465 = icmp slt i32 %464, 0
  br i1 %465, label %466, label %468

; <label>:466                                     ; preds = %460
  %467 = add nsw i32 %464, %nblock
  br label %468

; <label>:468                                     ; preds = %466, %460
  %k.1 = phi i32 [ %467, %466 ], [ %464, %460 ]
  %469 = sext i32 %k.1 to i64
  %470 = getelementptr inbounds i8* %block, i64 %469
  %471 = load i8* %470, align 1
  %472 = zext i8 %471 to i64
  %473 = getelementptr inbounds [256 x i8]* %bigDone, i32 0, i64 %472
  %474 = load i8* %473, align 1
  %475 = icmp ne i8 %474, 0
  br i1 %475, label %483, label %476

; <label>:476                                     ; preds = %468
  %477 = zext i8 %471 to i64
  %478 = getelementptr inbounds [256 x i32]* %copyEnd, i32 0, i64 %477
  %479 = load i32* %478, align 4
  %480 = add nsw i32 %479, -1
  store i32 %480, i32* %478, align 4
  %481 = sext i32 %479 to i64
  %482 = getelementptr inbounds i32* %ptr, i64 %481
  store i32 %k.1, i32* %482, align 4
  br label %483

; <label>:483                                     ; preds = %476, %468
  br label %484

; <label>:484                                     ; preds = %483
  %485 = add nsw i32 %j.7, -1
  br label %455

; <label>:486                                     ; preds = %455
  %487 = sext i32 %331 to i64
  %488 = getelementptr inbounds [256 x i32]* %copyStart, i32 0, i64 %487
  %489 = load i32* %488, align 4
  %490 = sub nsw i32 %489, 1
  %491 = sext i32 %331 to i64
  %492 = getelementptr inbounds [256 x i32]* %copyEnd, i32 0, i64 %491
  %493 = load i32* %492, align 4
  %494 = icmp eq i32 %490, %493
  br i1 %494, label %507, label %495

; <label>:495                                     ; preds = %486
  %496 = sext i32 %331 to i64
  %497 = getelementptr inbounds [256 x i32]* %copyStart, i32 0, i64 %496
  %498 = load i32* %497, align 4
  %499 = icmp eq i32 %498, 0
  br i1 %499, label %500, label %506

; <label>:500                                     ; preds = %495
  %501 = sext i32 %331 to i64
  %502 = getelementptr inbounds [256 x i32]* %copyEnd, i32 0, i64 %501
  %503 = load i32* %502, align 4
  %504 = sub nsw i32 %nblock, 1
  %505 = icmp eq i32 %503, %504
  br i1 %505, label %507, label %506

; <label>:506                                     ; preds = %500, %495
  call void @BZ2_bz__AssertH__fail(i32 1007)
  br label %507

; <label>:507                                     ; preds = %506, %500, %486
  br label %508

; <label>:508                                     ; preds = %517, %507
  %j.8 = phi i32 [ 0, %507 ], [ %518, %517 ]
  %509 = icmp sle i32 %j.8, 255
  br i1 %509, label %510, label %519

; <label>:510                                     ; preds = %508
  %511 = shl i32 %j.8, 8
  %512 = add nsw i32 %511, %331
  %513 = sext i32 %512 to i64
  %514 = getelementptr inbounds i32* %ftab, i64 %513
  %515 = load i32* %514, align 4
  %516 = or i32 %515, 2097152
  store i32 %516, i32* %514, align 4
  br label %517

; <label>:517                                     ; preds = %510
  %518 = add nsw i32 %j.8, 1
  br label %508

; <label>:519                                     ; preds = %508
  %520 = sext i32 %331 to i64
  %521 = getelementptr inbounds [256 x i8]* %bigDone, i32 0, i64 %520
  store i8 1, i8* %521, align 1
  %522 = icmp slt i32 %i.9, 255
  br i1 %522, label %523, label %568

; <label>:523                                     ; preds = %519
  %524 = shl i32 %331, 8
  %525 = sext i32 %524 to i64
  %526 = getelementptr inbounds i32* %ftab, i64 %525
  %527 = load i32* %526, align 4
  %528 = and i32 %527, -2097153
  %529 = add nsw i32 %331, 1
  %530 = shl i32 %529, 8
  %531 = sext i32 %530 to i64
  %532 = getelementptr inbounds i32* %ftab, i64 %531
  %533 = load i32* %532, align 4
  %534 = and i32 %533, -2097153
  %535 = sub i32 %534, %528
  br label %536

; <label>:536                                     ; preds = %539, %523
  %shifts.0 = phi i32 [ 0, %523 ], [ %540, %539 ]
  %537 = ashr i32 %535, %shifts.0
  %538 = icmp sgt i32 %537, 65534
  br i1 %538, label %539, label %541

; <label>:539                                     ; preds = %536
  %540 = add nsw i32 %shifts.0, 1
  br label %536

; <label>:541                                     ; preds = %536
  %542 = sub nsw i32 %535, 1
  br label %543

; <label>:543                                     ; preds = %560, %541
  %j.9 = phi i32 [ %542, %541 ], [ %561, %560 ]
  %544 = icmp sge i32 %j.9, 0
  br i1 %544, label %545, label %562

; <label>:545                                     ; preds = %543
  %546 = add nsw i32 %528, %j.9
  %547 = sext i32 %546 to i64
  %548 = getelementptr inbounds i32* %ptr, i64 %547
  %549 = load i32* %548, align 4
  %550 = ashr i32 %j.9, %shifts.0
  %551 = trunc i32 %550 to i16
  %552 = sext i32 %549 to i64
  %553 = getelementptr inbounds i16* %quadrant, i64 %552
  store i16 %551, i16* %553, align 2
  %554 = icmp slt i32 %549, 34
  br i1 %554, label %555, label %559

; <label>:555                                     ; preds = %545
  %556 = add nsw i32 %549, %nblock
  %557 = sext i32 %556 to i64
  %558 = getelementptr inbounds i16* %quadrant, i64 %557
  store i16 %551, i16* %558, align 2
  br label %559

; <label>:559                                     ; preds = %555, %545
  br label %560

; <label>:560                                     ; preds = %559
  %561 = add nsw i32 %j.9, -1
  br label %543

; <label>:562                                     ; preds = %543
  %563 = sub nsw i32 %535, 1
  %564 = ashr i32 %563, %shifts.0
  %565 = icmp sle i32 %564, 65535
  br i1 %565, label %567, label %566

; <label>:566                                     ; preds = %562
  call void @BZ2_bz__AssertH__fail(i32 1002)
  br label %567

; <label>:567                                     ; preds = %566, %562
  br label %568

; <label>:568                                     ; preds = %567, %519
  br label %569

; <label>:569                                     ; preds = %568
  %570 = add nsw i32 %i.9, 1
  br label %326

; <label>:571                                     ; preds = %326
  %572 = icmp sge i32 %verb, 4
  br i1 %572, label %573, label %577

; <label>:573                                     ; preds = %571
  %574 = load %struct._IO_FILE** @stderr, align 8
  %575 = sub nsw i32 %nblock, %numQSorted.0
  %576 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %574, i8* getelementptr inbounds ([44 x i8]* @.str5, i32 0, i32 0), i32 %nblock, i32 %numQSorted.0, i32 %575)
  br label %577

; <label>:577                                     ; preds = %573, %571, %369
  ret void
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

declare void @BZ2_bz__AssertH__fail(i32) #1

; Function Attrs: nounwind uwtable
define internal void @mainQSort3(i32* %ptr, i8* %block, i16* %quadrant, i32 %nblock, i32 %loSt, i32 %hiSt, i32 %dSt, i32* %budget) #0 {
  %stackLo = alloca [100 x i32], align 16
  %stackHi = alloca [100 x i32], align 16
  %stackD = alloca [100 x i32], align 16
  %nextLo = alloca [3 x i32], align 4
  %nextHi = alloca [3 x i32], align 4
  %nextD = alloca [3 x i32], align 4
  %1 = sext i32 0 to i64
  %2 = getelementptr inbounds [100 x i32]* %stackLo, i32 0, i64 %1
  store i32 %loSt, i32* %2, align 4
  %3 = sext i32 0 to i64
  %4 = getelementptr inbounds [100 x i32]* %stackHi, i32 0, i64 %3
  store i32 %hiSt, i32* %4, align 4
  %5 = sext i32 0 to i64
  %6 = getelementptr inbounds [100 x i32]* %stackD, i32 0, i64 %5
  store i32 %dSt, i32* %6, align 4
  %7 = add nsw i32 0, 1
  br label %8

; <label>:8                                       ; preds = %318, %143, %32, %0
  %sp.0 = phi i32 [ %7, %0 ], [ %14, %32 ], [ %151, %143 ], [ %357, %318 ]
  %9 = icmp sgt i32 %sp.0, 0
  br i1 %9, label %10, label %358

; <label>:10                                      ; preds = %8
  %11 = icmp slt i32 %sp.0, 100
  br i1 %11, label %13, label %12

; <label>:12                                      ; preds = %10
  call void @BZ2_bz__AssertH__fail(i32 1001)
  br label %13

; <label>:13                                      ; preds = %12, %10
  %14 = add nsw i32 %sp.0, -1
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [100 x i32]* %stackLo, i32 0, i64 %15
  %17 = load i32* %16, align 4
  %18 = sext i32 %14 to i64
  %19 = getelementptr inbounds [100 x i32]* %stackHi, i32 0, i64 %18
  %20 = load i32* %19, align 4
  %21 = sext i32 %14 to i64
  %22 = getelementptr inbounds [100 x i32]* %stackD, i32 0, i64 %21
  %23 = load i32* %22, align 4
  %24 = sub nsw i32 %20, %17
  %25 = icmp slt i32 %24, 20
  br i1 %25, label %28, label %26

; <label>:26                                      ; preds = %13
  %27 = icmp sgt i32 %23, 14
  br i1 %27, label %28, label %33

; <label>:28                                      ; preds = %26, %13
  call void @mainSimpleSort(i32* %ptr, i8* %block, i16* %quadrant, i32 %nblock, i32 %17, i32 %20, i32 %23, i32* %budget)
  %29 = load i32* %budget, align 4
  %30 = icmp slt i32 %29, 0
  br i1 %30, label %31, label %32

; <label>:31                                      ; preds = %28
  br label %358

; <label>:32                                      ; preds = %28
  br label %8

; <label>:33                                      ; preds = %26
  %34 = sext i32 %17 to i64
  %35 = getelementptr inbounds i32* %ptr, i64 %34
  %36 = load i32* %35, align 4
  %37 = add i32 %36, %23
  %38 = zext i32 %37 to i64
  %39 = getelementptr inbounds i8* %block, i64 %38
  %40 = load i8* %39, align 1
  %41 = sext i32 %20 to i64
  %42 = getelementptr inbounds i32* %ptr, i64 %41
  %43 = load i32* %42, align 4
  %44 = add i32 %43, %23
  %45 = zext i32 %44 to i64
  %46 = getelementptr inbounds i8* %block, i64 %45
  %47 = load i8* %46, align 1
  %48 = add nsw i32 %17, %20
  %49 = ashr i32 %48, 1
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds i32* %ptr, i64 %50
  %52 = load i32* %51, align 4
  %53 = add i32 %52, %23
  %54 = zext i32 %53 to i64
  %55 = getelementptr inbounds i8* %block, i64 %54
  %56 = load i8* %55, align 1
  %57 = call zeroext i8 @mmed3(i8 zeroext %40, i8 zeroext %47, i8 zeroext %56)
  %58 = zext i8 %57 to i32
  br label %59

; <label>:59                                      ; preds = %128, %33
  %gtHi.0 = phi i32 [ %20, %33 ], [ %gtHi.1, %128 ]
  %ltLo.0 = phi i32 [ %17, %33 ], [ %ltLo.1, %128 ]
  %unHi.0 = phi i32 [ %20, %33 ], [ %140, %128 ]
  %unLo.0 = phi i32 [ %17, %33 ], [ %139, %128 ]
  br label %60

; <label>:60                                      ; preds = %90, %74, %59
  %ltLo.1 = phi i32 [ %ltLo.0, %59 ], [ %85, %74 ], [ %ltLo.1, %90 ]
  %unLo.1 = phi i32 [ %unLo.0, %59 ], [ %86, %74 ], [ %91, %90 ]
  %61 = icmp sgt i32 %unLo.1, %unHi.0
  br i1 %61, label %62, label %63

; <label>:62                                      ; preds = %60
  br label %92

; <label>:63                                      ; preds = %60
  %64 = sext i32 %unLo.1 to i64
  %65 = getelementptr inbounds i32* %ptr, i64 %64
  %66 = load i32* %65, align 4
  %67 = add i32 %66, %23
  %68 = zext i32 %67 to i64
  %69 = getelementptr inbounds i8* %block, i64 %68
  %70 = load i8* %69, align 1
  %71 = zext i8 %70 to i32
  %72 = sub nsw i32 %71, %58
  %73 = icmp eq i32 %72, 0
  br i1 %73, label %74, label %87

; <label>:74                                      ; preds = %63
  %75 = sext i32 %unLo.1 to i64
  %76 = getelementptr inbounds i32* %ptr, i64 %75
  %77 = load i32* %76, align 4
  %78 = sext i32 %ltLo.1 to i64
  %79 = getelementptr inbounds i32* %ptr, i64 %78
  %80 = load i32* %79, align 4
  %81 = sext i32 %unLo.1 to i64
  %82 = getelementptr inbounds i32* %ptr, i64 %81
  store i32 %80, i32* %82, align 4
  %83 = sext i32 %ltLo.1 to i64
  %84 = getelementptr inbounds i32* %ptr, i64 %83
  store i32 %77, i32* %84, align 4
  %85 = add nsw i32 %ltLo.1, 1
  %86 = add nsw i32 %unLo.1, 1
  br label %60

; <label>:87                                      ; preds = %63
  %88 = icmp sgt i32 %72, 0
  br i1 %88, label %89, label %90

; <label>:89                                      ; preds = %87
  br label %92

; <label>:90                                      ; preds = %87
  %91 = add nsw i32 %unLo.1, 1
  br label %60

; <label>:92                                      ; preds = %89, %62
  br label %93

; <label>:93                                      ; preds = %123, %107, %92
  %gtHi.1 = phi i32 [ %gtHi.0, %92 ], [ %118, %107 ], [ %gtHi.1, %123 ]
  %unHi.1 = phi i32 [ %unHi.0, %92 ], [ %119, %107 ], [ %124, %123 ]
  %94 = icmp sgt i32 %unLo.1, %unHi.1
  br i1 %94, label %95, label %96

; <label>:95                                      ; preds = %93
  br label %125

; <label>:96                                      ; preds = %93
  %97 = sext i32 %unHi.1 to i64
  %98 = getelementptr inbounds i32* %ptr, i64 %97
  %99 = load i32* %98, align 4
  %100 = add i32 %99, %23
  %101 = zext i32 %100 to i64
  %102 = getelementptr inbounds i8* %block, i64 %101
  %103 = load i8* %102, align 1
  %104 = zext i8 %103 to i32
  %105 = sub nsw i32 %104, %58
  %106 = icmp eq i32 %105, 0
  br i1 %106, label %107, label %120

; <label>:107                                     ; preds = %96
  %108 = sext i32 %unHi.1 to i64
  %109 = getelementptr inbounds i32* %ptr, i64 %108
  %110 = load i32* %109, align 4
  %111 = sext i32 %gtHi.1 to i64
  %112 = getelementptr inbounds i32* %ptr, i64 %111
  %113 = load i32* %112, align 4
  %114 = sext i32 %unHi.1 to i64
  %115 = getelementptr inbounds i32* %ptr, i64 %114
  store i32 %113, i32* %115, align 4
  %116 = sext i32 %gtHi.1 to i64
  %117 = getelementptr inbounds i32* %ptr, i64 %116
  store i32 %110, i32* %117, align 4
  %118 = add nsw i32 %gtHi.1, -1
  %119 = add nsw i32 %unHi.1, -1
  br label %93

; <label>:120                                     ; preds = %96
  %121 = icmp slt i32 %105, 0
  br i1 %121, label %122, label %123

; <label>:122                                     ; preds = %120
  br label %125

; <label>:123                                     ; preds = %120
  %124 = add nsw i32 %unHi.1, -1
  br label %93

; <label>:125                                     ; preds = %122, %95
  %126 = icmp sgt i32 %unLo.1, %unHi.1
  br i1 %126, label %127, label %128

; <label>:127                                     ; preds = %125
  br label %141

; <label>:128                                     ; preds = %125
  %129 = sext i32 %unLo.1 to i64
  %130 = getelementptr inbounds i32* %ptr, i64 %129
  %131 = load i32* %130, align 4
  %132 = sext i32 %unHi.1 to i64
  %133 = getelementptr inbounds i32* %ptr, i64 %132
  %134 = load i32* %133, align 4
  %135 = sext i32 %unLo.1 to i64
  %136 = getelementptr inbounds i32* %ptr, i64 %135
  store i32 %134, i32* %136, align 4
  %137 = sext i32 %unHi.1 to i64
  %138 = getelementptr inbounds i32* %ptr, i64 %137
  store i32 %131, i32* %138, align 4
  %139 = add nsw i32 %unLo.1, 1
  %140 = add nsw i32 %unHi.1, -1
  br label %59

; <label>:141                                     ; preds = %127
  %142 = icmp slt i32 %gtHi.1, %ltLo.1
  br i1 %142, label %143, label %152

; <label>:143                                     ; preds = %141
  %144 = sext i32 %14 to i64
  %145 = getelementptr inbounds [100 x i32]* %stackLo, i32 0, i64 %144
  store i32 %17, i32* %145, align 4
  %146 = sext i32 %14 to i64
  %147 = getelementptr inbounds [100 x i32]* %stackHi, i32 0, i64 %146
  store i32 %20, i32* %147, align 4
  %148 = add nsw i32 %23, 1
  %149 = sext i32 %14 to i64
  %150 = getelementptr inbounds [100 x i32]* %stackD, i32 0, i64 %149
  store i32 %148, i32* %150, align 4
  %151 = add nsw i32 %14, 1
  br label %8

; <label>:152                                     ; preds = %141
  %153 = sub nsw i32 %ltLo.1, %17
  %154 = sub nsw i32 %unLo.1, %ltLo.1
  %155 = icmp slt i32 %153, %154
  br i1 %155, label %156, label %158

; <label>:156                                     ; preds = %152
  %157 = sub nsw i32 %ltLo.1, %17
  br label %160

; <label>:158                                     ; preds = %152
  %159 = sub nsw i32 %unLo.1, %ltLo.1
  br label %160

; <label>:160                                     ; preds = %158, %156
  %161 = phi i32 [ %157, %156 ], [ %159, %158 ]
  %162 = sub nsw i32 %unLo.1, %161
  br label %163

; <label>:163                                     ; preds = %165, %160
  %yyp1.0 = phi i32 [ %17, %160 ], [ %176, %165 ]
  %yyp2.0 = phi i32 [ %162, %160 ], [ %177, %165 ]
  %yyn.0 = phi i32 [ %161, %160 ], [ %178, %165 ]
  %164 = icmp sgt i32 %yyn.0, 0
  br i1 %164, label %165, label %179

; <label>:165                                     ; preds = %163
  %166 = sext i32 %yyp1.0 to i64
  %167 = getelementptr inbounds i32* %ptr, i64 %166
  %168 = load i32* %167, align 4
  %169 = sext i32 %yyp2.0 to i64
  %170 = getelementptr inbounds i32* %ptr, i64 %169
  %171 = load i32* %170, align 4
  %172 = sext i32 %yyp1.0 to i64
  %173 = getelementptr inbounds i32* %ptr, i64 %172
  store i32 %171, i32* %173, align 4
  %174 = sext i32 %yyp2.0 to i64
  %175 = getelementptr inbounds i32* %ptr, i64 %174
  store i32 %168, i32* %175, align 4
  %176 = add nsw i32 %yyp1.0, 1
  %177 = add nsw i32 %yyp2.0, 1
  %178 = add nsw i32 %yyn.0, -1
  br label %163

; <label>:179                                     ; preds = %163
  %180 = sub nsw i32 %20, %gtHi.1
  %181 = sub nsw i32 %gtHi.1, %unHi.1
  %182 = icmp slt i32 %180, %181
  br i1 %182, label %183, label %185

; <label>:183                                     ; preds = %179
  %184 = sub nsw i32 %20, %gtHi.1
  br label %187

; <label>:185                                     ; preds = %179
  %186 = sub nsw i32 %gtHi.1, %unHi.1
  br label %187

; <label>:187                                     ; preds = %185, %183
  %188 = phi i32 [ %184, %183 ], [ %186, %185 ]
  %189 = sub nsw i32 %20, %188
  %190 = add nsw i32 %189, 1
  br label %191

; <label>:191                                     ; preds = %193, %187
  %yyp14.0 = phi i32 [ %unLo.1, %187 ], [ %204, %193 ]
  %yyp25.0 = phi i32 [ %190, %187 ], [ %205, %193 ]
  %yyn6.0 = phi i32 [ %188, %187 ], [ %206, %193 ]
  %192 = icmp sgt i32 %yyn6.0, 0
  br i1 %192, label %193, label %207

; <label>:193                                     ; preds = %191
  %194 = sext i32 %yyp14.0 to i64
  %195 = getelementptr inbounds i32* %ptr, i64 %194
  %196 = load i32* %195, align 4
  %197 = sext i32 %yyp25.0 to i64
  %198 = getelementptr inbounds i32* %ptr, i64 %197
  %199 = load i32* %198, align 4
  %200 = sext i32 %yyp14.0 to i64
  %201 = getelementptr inbounds i32* %ptr, i64 %200
  store i32 %199, i32* %201, align 4
  %202 = sext i32 %yyp25.0 to i64
  %203 = getelementptr inbounds i32* %ptr, i64 %202
  store i32 %196, i32* %203, align 4
  %204 = add nsw i32 %yyp14.0, 1
  %205 = add nsw i32 %yyp25.0, 1
  %206 = add nsw i32 %yyn6.0, -1
  br label %191

; <label>:207                                     ; preds = %191
  %208 = add nsw i32 %17, %unLo.1
  %209 = sub nsw i32 %208, %ltLo.1
  %210 = sub nsw i32 %209, 1
  %211 = sub nsw i32 %gtHi.1, %unHi.1
  %212 = sub nsw i32 %20, %211
  %213 = add nsw i32 %212, 1
  %214 = getelementptr inbounds [3 x i32]* %nextLo, i32 0, i64 0
  store i32 %17, i32* %214, align 4
  %215 = getelementptr inbounds [3 x i32]* %nextHi, i32 0, i64 0
  store i32 %210, i32* %215, align 4
  %216 = getelementptr inbounds [3 x i32]* %nextD, i32 0, i64 0
  store i32 %23, i32* %216, align 4
  %217 = getelementptr inbounds [3 x i32]* %nextLo, i32 0, i64 1
  store i32 %213, i32* %217, align 4
  %218 = getelementptr inbounds [3 x i32]* %nextHi, i32 0, i64 1
  store i32 %20, i32* %218, align 4
  %219 = getelementptr inbounds [3 x i32]* %nextD, i32 0, i64 1
  store i32 %23, i32* %219, align 4
  %220 = add nsw i32 %210, 1
  %221 = getelementptr inbounds [3 x i32]* %nextLo, i32 0, i64 2
  store i32 %220, i32* %221, align 4
  %222 = sub nsw i32 %213, 1
  %223 = getelementptr inbounds [3 x i32]* %nextHi, i32 0, i64 2
  store i32 %222, i32* %223, align 4
  %224 = add nsw i32 %23, 1
  %225 = getelementptr inbounds [3 x i32]* %nextD, i32 0, i64 2
  store i32 %224, i32* %225, align 4
  %226 = getelementptr inbounds [3 x i32]* %nextHi, i32 0, i64 0
  %227 = load i32* %226, align 4
  %228 = getelementptr inbounds [3 x i32]* %nextLo, i32 0, i64 0
  %229 = load i32* %228, align 4
  %230 = sub nsw i32 %227, %229
  %231 = getelementptr inbounds [3 x i32]* %nextHi, i32 0, i64 1
  %232 = load i32* %231, align 4
  %233 = getelementptr inbounds [3 x i32]* %nextLo, i32 0, i64 1
  %234 = load i32* %233, align 4
  %235 = sub nsw i32 %232, %234
  %236 = icmp slt i32 %230, %235
  br i1 %236, label %237, label %256

; <label>:237                                     ; preds = %207
  %238 = getelementptr inbounds [3 x i32]* %nextLo, i32 0, i64 0
  %239 = load i32* %238, align 4
  %240 = getelementptr inbounds [3 x i32]* %nextLo, i32 0, i64 1
  %241 = load i32* %240, align 4
  %242 = getelementptr inbounds [3 x i32]* %nextLo, i32 0, i64 0
  store i32 %241, i32* %242, align 4
  %243 = getelementptr inbounds [3 x i32]* %nextLo, i32 0, i64 1
  store i32 %239, i32* %243, align 4
  %244 = getelementptr inbounds [3 x i32]* %nextHi, i32 0, i64 0
  %245 = load i32* %244, align 4
  %246 = getelementptr inbounds [3 x i32]* %nextHi, i32 0, i64 1
  %247 = load i32* %246, align 4
  %248 = getelementptr inbounds [3 x i32]* %nextHi, i32 0, i64 0
  store i32 %247, i32* %248, align 4
  %249 = getelementptr inbounds [3 x i32]* %nextHi, i32 0, i64 1
  store i32 %245, i32* %249, align 4
  %250 = getelementptr inbounds [3 x i32]* %nextD, i32 0, i64 0
  %251 = load i32* %250, align 4
  %252 = getelementptr inbounds [3 x i32]* %nextD, i32 0, i64 1
  %253 = load i32* %252, align 4
  %254 = getelementptr inbounds [3 x i32]* %nextD, i32 0, i64 0
  store i32 %253, i32* %254, align 4
  %255 = getelementptr inbounds [3 x i32]* %nextD, i32 0, i64 1
  store i32 %251, i32* %255, align 4
  br label %256

; <label>:256                                     ; preds = %237, %207
  %257 = getelementptr inbounds [3 x i32]* %nextHi, i32 0, i64 1
  %258 = load i32* %257, align 4
  %259 = getelementptr inbounds [3 x i32]* %nextLo, i32 0, i64 1
  %260 = load i32* %259, align 4
  %261 = sub nsw i32 %258, %260
  %262 = getelementptr inbounds [3 x i32]* %nextHi, i32 0, i64 2
  %263 = load i32* %262, align 4
  %264 = getelementptr inbounds [3 x i32]* %nextLo, i32 0, i64 2
  %265 = load i32* %264, align 4
  %266 = sub nsw i32 %263, %265
  %267 = icmp slt i32 %261, %266
  br i1 %267, label %268, label %287

; <label>:268                                     ; preds = %256
  %269 = getelementptr inbounds [3 x i32]* %nextLo, i32 0, i64 1
  %270 = load i32* %269, align 4
  %271 = getelementptr inbounds [3 x i32]* %nextLo, i32 0, i64 2
  %272 = load i32* %271, align 4
  %273 = getelementptr inbounds [3 x i32]* %nextLo, i32 0, i64 1
  store i32 %272, i32* %273, align 4
  %274 = getelementptr inbounds [3 x i32]* %nextLo, i32 0, i64 2
  store i32 %270, i32* %274, align 4
  %275 = getelementptr inbounds [3 x i32]* %nextHi, i32 0, i64 1
  %276 = load i32* %275, align 4
  %277 = getelementptr inbounds [3 x i32]* %nextHi, i32 0, i64 2
  %278 = load i32* %277, align 4
  %279 = getelementptr inbounds [3 x i32]* %nextHi, i32 0, i64 1
  store i32 %278, i32* %279, align 4
  %280 = getelementptr inbounds [3 x i32]* %nextHi, i32 0, i64 2
  store i32 %276, i32* %280, align 4
  %281 = getelementptr inbounds [3 x i32]* %nextD, i32 0, i64 1
  %282 = load i32* %281, align 4
  %283 = getelementptr inbounds [3 x i32]* %nextD, i32 0, i64 2
  %284 = load i32* %283, align 4
  %285 = getelementptr inbounds [3 x i32]* %nextD, i32 0, i64 1
  store i32 %284, i32* %285, align 4
  %286 = getelementptr inbounds [3 x i32]* %nextD, i32 0, i64 2
  store i32 %282, i32* %286, align 4
  br label %287

; <label>:287                                     ; preds = %268, %256
  %288 = getelementptr inbounds [3 x i32]* %nextHi, i32 0, i64 0
  %289 = load i32* %288, align 4
  %290 = getelementptr inbounds [3 x i32]* %nextLo, i32 0, i64 0
  %291 = load i32* %290, align 4
  %292 = sub nsw i32 %289, %291
  %293 = getelementptr inbounds [3 x i32]* %nextHi, i32 0, i64 1
  %294 = load i32* %293, align 4
  %295 = getelementptr inbounds [3 x i32]* %nextLo, i32 0, i64 1
  %296 = load i32* %295, align 4
  %297 = sub nsw i32 %294, %296
  %298 = icmp slt i32 %292, %297
  br i1 %298, label %299, label %318

; <label>:299                                     ; preds = %287
  %300 = getelementptr inbounds [3 x i32]* %nextLo, i32 0, i64 0
  %301 = load i32* %300, align 4
  %302 = getelementptr inbounds [3 x i32]* %nextLo, i32 0, i64 1
  %303 = load i32* %302, align 4
  %304 = getelementptr inbounds [3 x i32]* %nextLo, i32 0, i64 0
  store i32 %303, i32* %304, align 4
  %305 = getelementptr inbounds [3 x i32]* %nextLo, i32 0, i64 1
  store i32 %301, i32* %305, align 4
  %306 = getelementptr inbounds [3 x i32]* %nextHi, i32 0, i64 0
  %307 = load i32* %306, align 4
  %308 = getelementptr inbounds [3 x i32]* %nextHi, i32 0, i64 1
  %309 = load i32* %308, align 4
  %310 = getelementptr inbounds [3 x i32]* %nextHi, i32 0, i64 0
  store i32 %309, i32* %310, align 4
  %311 = getelementptr inbounds [3 x i32]* %nextHi, i32 0, i64 1
  store i32 %307, i32* %311, align 4
  %312 = getelementptr inbounds [3 x i32]* %nextD, i32 0, i64 0
  %313 = load i32* %312, align 4
  %314 = getelementptr inbounds [3 x i32]* %nextD, i32 0, i64 1
  %315 = load i32* %314, align 4
  %316 = getelementptr inbounds [3 x i32]* %nextD, i32 0, i64 0
  store i32 %315, i32* %316, align 4
  %317 = getelementptr inbounds [3 x i32]* %nextD, i32 0, i64 1
  store i32 %313, i32* %317, align 4
  br label %318

; <label>:318                                     ; preds = %299, %287
  %319 = getelementptr inbounds [3 x i32]* %nextLo, i32 0, i64 0
  %320 = load i32* %319, align 4
  %321 = sext i32 %14 to i64
  %322 = getelementptr inbounds [100 x i32]* %stackLo, i32 0, i64 %321
  store i32 %320, i32* %322, align 4
  %323 = getelementptr inbounds [3 x i32]* %nextHi, i32 0, i64 0
  %324 = load i32* %323, align 4
  %325 = sext i32 %14 to i64
  %326 = getelementptr inbounds [100 x i32]* %stackHi, i32 0, i64 %325
  store i32 %324, i32* %326, align 4
  %327 = getelementptr inbounds [3 x i32]* %nextD, i32 0, i64 0
  %328 = load i32* %327, align 4
  %329 = sext i32 %14 to i64
  %330 = getelementptr inbounds [100 x i32]* %stackD, i32 0, i64 %329
  store i32 %328, i32* %330, align 4
  %331 = add nsw i32 %14, 1
  %332 = getelementptr inbounds [3 x i32]* %nextLo, i32 0, i64 1
  %333 = load i32* %332, align 4
  %334 = sext i32 %331 to i64
  %335 = getelementptr inbounds [100 x i32]* %stackLo, i32 0, i64 %334
  store i32 %333, i32* %335, align 4
  %336 = getelementptr inbounds [3 x i32]* %nextHi, i32 0, i64 1
  %337 = load i32* %336, align 4
  %338 = sext i32 %331 to i64
  %339 = getelementptr inbounds [100 x i32]* %stackHi, i32 0, i64 %338
  store i32 %337, i32* %339, align 4
  %340 = getelementptr inbounds [3 x i32]* %nextD, i32 0, i64 1
  %341 = load i32* %340, align 4
  %342 = sext i32 %331 to i64
  %343 = getelementptr inbounds [100 x i32]* %stackD, i32 0, i64 %342
  store i32 %341, i32* %343, align 4
  %344 = add nsw i32 %331, 1
  %345 = getelementptr inbounds [3 x i32]* %nextLo, i32 0, i64 2
  %346 = load i32* %345, align 4
  %347 = sext i32 %344 to i64
  %348 = getelementptr inbounds [100 x i32]* %stackLo, i32 0, i64 %347
  store i32 %346, i32* %348, align 4
  %349 = getelementptr inbounds [3 x i32]* %nextHi, i32 0, i64 2
  %350 = load i32* %349, align 4
  %351 = sext i32 %344 to i64
  %352 = getelementptr inbounds [100 x i32]* %stackHi, i32 0, i64 %351
  store i32 %350, i32* %352, align 4
  %353 = getelementptr inbounds [3 x i32]* %nextD, i32 0, i64 2
  %354 = load i32* %353, align 4
  %355 = sext i32 %344 to i64
  %356 = getelementptr inbounds [100 x i32]* %stackD, i32 0, i64 %355
  store i32 %354, i32* %356, align 4
  %357 = add nsw i32 %344, 1
  br label %8

; <label>:358                                     ; preds = %31, %8
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @mainSimpleSort(i32* %ptr, i8* %block, i16* %quadrant, i32 %nblock, i32 %lo, i32 %hi, i32 %d, i32* %budget) #0 {
  %1 = sub nsw i32 %hi, %lo
  %2 = add nsw i32 %1, 1
  %3 = icmp slt i32 %2, 2
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  br label %126

; <label>:5                                       ; preds = %0
  br label %6

; <label>:6                                       ; preds = %11, %5
  %hp.0 = phi i32 [ 0, %5 ], [ %12, %11 ]
  %7 = sext i32 %hp.0 to i64
  %8 = getelementptr inbounds [14 x i32]* @incs, i32 0, i64 %7
  %9 = load i32* %8, align 4
  %10 = icmp slt i32 %9, %2
  br i1 %10, label %11, label %13

; <label>:11                                      ; preds = %6
  %12 = add nsw i32 %hp.0, 1
  br label %6

; <label>:13                                      ; preds = %6
  %14 = add nsw i32 %hp.0, -1
  br label %15

; <label>:15                                      ; preds = %124, %13
  %hp.1 = phi i32 [ %14, %13 ], [ %125, %124 ]
  %16 = icmp sge i32 %hp.1, 0
  br i1 %16, label %17, label %126

; <label>:17                                      ; preds = %15
  %18 = sext i32 %hp.1 to i64
  %19 = getelementptr inbounds [14 x i32]* @incs, i32 0, i64 %18
  %20 = load i32* %19, align 4
  %21 = add nsw i32 %lo, %20
  br label %22

; <label>:22                                      ; preds = %122, %17
  %i.0 = phi i32 [ %21, %17 ], [ %118, %122 ]
  %23 = icmp sgt i32 %i.0, %hi
  br i1 %23, label %24, label %25

; <label>:24                                      ; preds = %22
  br label %123

; <label>:25                                      ; preds = %22
  %26 = sext i32 %i.0 to i64
  %27 = getelementptr inbounds i32* %ptr, i64 %26
  %28 = load i32* %27, align 4
  br label %29

; <label>:29                                      ; preds = %50, %25
  %j.0 = phi i32 [ %i.0, %25 ], [ %45, %50 ]
  %30 = sub nsw i32 %j.0, %20
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds i32* %ptr, i64 %31
  %33 = load i32* %32, align 4
  %34 = add i32 %33, %d
  %35 = add i32 %28, %d
  %36 = call zeroext i8 @mainGtU(i32 %34, i32 %35, i8* %block, i16* %quadrant, i32 %nblock, i32* %budget)
  %37 = icmp ne i8 %36, 0
  br i1 %37, label %38, label %51

; <label>:38                                      ; preds = %29
  %39 = sub nsw i32 %j.0, %20
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds i32* %ptr, i64 %40
  %42 = load i32* %41, align 4
  %43 = sext i32 %j.0 to i64
  %44 = getelementptr inbounds i32* %ptr, i64 %43
  store i32 %42, i32* %44, align 4
  %45 = sub nsw i32 %j.0, %20
  %46 = add nsw i32 %lo, %20
  %47 = sub nsw i32 %46, 1
  %48 = icmp sle i32 %45, %47
  br i1 %48, label %49, label %50

; <label>:49                                      ; preds = %38
  br label %51

; <label>:50                                      ; preds = %38
  br label %29

; <label>:51                                      ; preds = %49, %29
  %j.1 = phi i32 [ %45, %49 ], [ %j.0, %29 ]
  %52 = sext i32 %j.1 to i64
  %53 = getelementptr inbounds i32* %ptr, i64 %52
  store i32 %28, i32* %53, align 4
  %54 = add nsw i32 %i.0, 1
  %55 = icmp sgt i32 %54, %hi
  br i1 %55, label %56, label %57

; <label>:56                                      ; preds = %51
  br label %123

; <label>:57                                      ; preds = %51
  %58 = sext i32 %54 to i64
  %59 = getelementptr inbounds i32* %ptr, i64 %58
  %60 = load i32* %59, align 4
  br label %61

; <label>:61                                      ; preds = %82, %57
  %j.2 = phi i32 [ %54, %57 ], [ %77, %82 ]
  %62 = sub nsw i32 %j.2, %20
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds i32* %ptr, i64 %63
  %65 = load i32* %64, align 4
  %66 = add i32 %65, %d
  %67 = add i32 %60, %d
  %68 = call zeroext i8 @mainGtU(i32 %66, i32 %67, i8* %block, i16* %quadrant, i32 %nblock, i32* %budget)
  %69 = icmp ne i8 %68, 0
  br i1 %69, label %70, label %83

; <label>:70                                      ; preds = %61
  %71 = sub nsw i32 %j.2, %20
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds i32* %ptr, i64 %72
  %74 = load i32* %73, align 4
  %75 = sext i32 %j.2 to i64
  %76 = getelementptr inbounds i32* %ptr, i64 %75
  store i32 %74, i32* %76, align 4
  %77 = sub nsw i32 %j.2, %20
  %78 = add nsw i32 %lo, %20
  %79 = sub nsw i32 %78, 1
  %80 = icmp sle i32 %77, %79
  br i1 %80, label %81, label %82

; <label>:81                                      ; preds = %70
  br label %83

; <label>:82                                      ; preds = %70
  br label %61

; <label>:83                                      ; preds = %81, %61
  %j.3 = phi i32 [ %77, %81 ], [ %j.2, %61 ]
  %84 = sext i32 %j.3 to i64
  %85 = getelementptr inbounds i32* %ptr, i64 %84
  store i32 %60, i32* %85, align 4
  %86 = add nsw i32 %54, 1
  %87 = icmp sgt i32 %86, %hi
  br i1 %87, label %88, label %89

; <label>:88                                      ; preds = %83
  br label %123

; <label>:89                                      ; preds = %83
  %90 = sext i32 %86 to i64
  %91 = getelementptr inbounds i32* %ptr, i64 %90
  %92 = load i32* %91, align 4
  br label %93

; <label>:93                                      ; preds = %114, %89
  %j.4 = phi i32 [ %86, %89 ], [ %109, %114 ]
  %94 = sub nsw i32 %j.4, %20
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds i32* %ptr, i64 %95
  %97 = load i32* %96, align 4
  %98 = add i32 %97, %d
  %99 = add i32 %92, %d
  %100 = call zeroext i8 @mainGtU(i32 %98, i32 %99, i8* %block, i16* %quadrant, i32 %nblock, i32* %budget)
  %101 = icmp ne i8 %100, 0
  br i1 %101, label %102, label %115

; <label>:102                                     ; preds = %93
  %103 = sub nsw i32 %j.4, %20
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds i32* %ptr, i64 %104
  %106 = load i32* %105, align 4
  %107 = sext i32 %j.4 to i64
  %108 = getelementptr inbounds i32* %ptr, i64 %107
  store i32 %106, i32* %108, align 4
  %109 = sub nsw i32 %j.4, %20
  %110 = add nsw i32 %lo, %20
  %111 = sub nsw i32 %110, 1
  %112 = icmp sle i32 %109, %111
  br i1 %112, label %113, label %114

; <label>:113                                     ; preds = %102
  br label %115

; <label>:114                                     ; preds = %102
  br label %93

; <label>:115                                     ; preds = %113, %93
  %j.5 = phi i32 [ %109, %113 ], [ %j.4, %93 ]
  %116 = sext i32 %j.5 to i64
  %117 = getelementptr inbounds i32* %ptr, i64 %116
  store i32 %92, i32* %117, align 4
  %118 = add nsw i32 %86, 1
  %119 = load i32* %budget, align 4
  %120 = icmp slt i32 %119, 0
  br i1 %120, label %121, label %122

; <label>:121                                     ; preds = %115
  br label %126

; <label>:122                                     ; preds = %115
  br label %22

; <label>:123                                     ; preds = %88, %56, %24
  br label %124

; <label>:124                                     ; preds = %123
  %125 = add nsw i32 %hp.1, -1
  br label %15

; <label>:126                                     ; preds = %121, %15, %4
  ret void
}

; Function Attrs: inlinehint nounwind uwtable
define internal zeroext i8 @mmed3(i8 zeroext %a, i8 zeroext %b, i8 zeroext %c) #2 {
  %1 = zext i8 %a to i32
  %2 = zext i8 %b to i32
  %3 = icmp sgt i32 %1, %2
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  br label %5

; <label>:5                                       ; preds = %4, %0
  %.01 = phi i8 [ %a, %4 ], [ %b, %0 ]
  %.0 = phi i8 [ %b, %4 ], [ %a, %0 ]
  %6 = zext i8 %.01 to i32
  %7 = zext i8 %c to i32
  %8 = icmp sgt i32 %6, %7
  br i1 %8, label %9, label %15

; <label>:9                                       ; preds = %5
  %10 = zext i8 %.0 to i32
  %11 = zext i8 %c to i32
  %12 = icmp sgt i32 %10, %11
  br i1 %12, label %13, label %14

; <label>:13                                      ; preds = %9
  br label %14

; <label>:14                                      ; preds = %13, %9
  %.1 = phi i8 [ %.0, %13 ], [ %c, %9 ]
  br label %15

; <label>:15                                      ; preds = %14, %5
  %.2 = phi i8 [ %.1, %14 ], [ %.01, %5 ]
  ret i8 %.2
}

; Function Attrs: inlinehint nounwind uwtable
define internal zeroext i8 @mainGtU(i32 %i1, i32 %i2, i8* %block, i16* %quadrant, i32 %nblock, i32* %budget) #2 {
  %1 = zext i32 %i1 to i64
  %2 = getelementptr inbounds i8* %block, i64 %1
  %3 = load i8* %2, align 1
  %4 = zext i32 %i2 to i64
  %5 = getelementptr inbounds i8* %block, i64 %4
  %6 = load i8* %5, align 1
  %7 = zext i8 %3 to i32
  %8 = zext i8 %6 to i32
  %9 = icmp ne i32 %7, %8
  br i1 %9, label %10, label %16

; <label>:10                                      ; preds = %0
  %11 = zext i8 %3 to i32
  %12 = zext i8 %6 to i32
  %13 = icmp sgt i32 %11, %12
  %14 = zext i1 %13 to i32
  %15 = trunc i32 %14 to i8
  br label %505

; <label>:16                                      ; preds = %0
  %17 = add i32 %i1, 1
  %18 = add i32 %i2, 1
  %19 = zext i32 %17 to i64
  %20 = getelementptr inbounds i8* %block, i64 %19
  %21 = load i8* %20, align 1
  %22 = zext i32 %18 to i64
  %23 = getelementptr inbounds i8* %block, i64 %22
  %24 = load i8* %23, align 1
  %25 = zext i8 %21 to i32
  %26 = zext i8 %24 to i32
  %27 = icmp ne i32 %25, %26
  br i1 %27, label %28, label %34

; <label>:28                                      ; preds = %16
  %29 = zext i8 %21 to i32
  %30 = zext i8 %24 to i32
  %31 = icmp sgt i32 %29, %30
  %32 = zext i1 %31 to i32
  %33 = trunc i32 %32 to i8
  br label %505

; <label>:34                                      ; preds = %16
  %35 = add i32 %17, 1
  %36 = add i32 %18, 1
  %37 = zext i32 %35 to i64
  %38 = getelementptr inbounds i8* %block, i64 %37
  %39 = load i8* %38, align 1
  %40 = zext i32 %36 to i64
  %41 = getelementptr inbounds i8* %block, i64 %40
  %42 = load i8* %41, align 1
  %43 = zext i8 %39 to i32
  %44 = zext i8 %42 to i32
  %45 = icmp ne i32 %43, %44
  br i1 %45, label %46, label %52

; <label>:46                                      ; preds = %34
  %47 = zext i8 %39 to i32
  %48 = zext i8 %42 to i32
  %49 = icmp sgt i32 %47, %48
  %50 = zext i1 %49 to i32
  %51 = trunc i32 %50 to i8
  br label %505

; <label>:52                                      ; preds = %34
  %53 = add i32 %35, 1
  %54 = add i32 %36, 1
  %55 = zext i32 %53 to i64
  %56 = getelementptr inbounds i8* %block, i64 %55
  %57 = load i8* %56, align 1
  %58 = zext i32 %54 to i64
  %59 = getelementptr inbounds i8* %block, i64 %58
  %60 = load i8* %59, align 1
  %61 = zext i8 %57 to i32
  %62 = zext i8 %60 to i32
  %63 = icmp ne i32 %61, %62
  br i1 %63, label %64, label %70

; <label>:64                                      ; preds = %52
  %65 = zext i8 %57 to i32
  %66 = zext i8 %60 to i32
  %67 = icmp sgt i32 %65, %66
  %68 = zext i1 %67 to i32
  %69 = trunc i32 %68 to i8
  br label %505

; <label>:70                                      ; preds = %52
  %71 = add i32 %53, 1
  %72 = add i32 %54, 1
  %73 = zext i32 %71 to i64
  %74 = getelementptr inbounds i8* %block, i64 %73
  %75 = load i8* %74, align 1
  %76 = zext i32 %72 to i64
  %77 = getelementptr inbounds i8* %block, i64 %76
  %78 = load i8* %77, align 1
  %79 = zext i8 %75 to i32
  %80 = zext i8 %78 to i32
  %81 = icmp ne i32 %79, %80
  br i1 %81, label %82, label %88

; <label>:82                                      ; preds = %70
  %83 = zext i8 %75 to i32
  %84 = zext i8 %78 to i32
  %85 = icmp sgt i32 %83, %84
  %86 = zext i1 %85 to i32
  %87 = trunc i32 %86 to i8
  br label %505

; <label>:88                                      ; preds = %70
  %89 = add i32 %71, 1
  %90 = add i32 %72, 1
  %91 = zext i32 %89 to i64
  %92 = getelementptr inbounds i8* %block, i64 %91
  %93 = load i8* %92, align 1
  %94 = zext i32 %90 to i64
  %95 = getelementptr inbounds i8* %block, i64 %94
  %96 = load i8* %95, align 1
  %97 = zext i8 %93 to i32
  %98 = zext i8 %96 to i32
  %99 = icmp ne i32 %97, %98
  br i1 %99, label %100, label %106

; <label>:100                                     ; preds = %88
  %101 = zext i8 %93 to i32
  %102 = zext i8 %96 to i32
  %103 = icmp sgt i32 %101, %102
  %104 = zext i1 %103 to i32
  %105 = trunc i32 %104 to i8
  br label %505

; <label>:106                                     ; preds = %88
  %107 = add i32 %89, 1
  %108 = add i32 %90, 1
  %109 = zext i32 %107 to i64
  %110 = getelementptr inbounds i8* %block, i64 %109
  %111 = load i8* %110, align 1
  %112 = zext i32 %108 to i64
  %113 = getelementptr inbounds i8* %block, i64 %112
  %114 = load i8* %113, align 1
  %115 = zext i8 %111 to i32
  %116 = zext i8 %114 to i32
  %117 = icmp ne i32 %115, %116
  br i1 %117, label %118, label %124

; <label>:118                                     ; preds = %106
  %119 = zext i8 %111 to i32
  %120 = zext i8 %114 to i32
  %121 = icmp sgt i32 %119, %120
  %122 = zext i1 %121 to i32
  %123 = trunc i32 %122 to i8
  br label %505

; <label>:124                                     ; preds = %106
  %125 = add i32 %107, 1
  %126 = add i32 %108, 1
  %127 = zext i32 %125 to i64
  %128 = getelementptr inbounds i8* %block, i64 %127
  %129 = load i8* %128, align 1
  %130 = zext i32 %126 to i64
  %131 = getelementptr inbounds i8* %block, i64 %130
  %132 = load i8* %131, align 1
  %133 = zext i8 %129 to i32
  %134 = zext i8 %132 to i32
  %135 = icmp ne i32 %133, %134
  br i1 %135, label %136, label %142

; <label>:136                                     ; preds = %124
  %137 = zext i8 %129 to i32
  %138 = zext i8 %132 to i32
  %139 = icmp sgt i32 %137, %138
  %140 = zext i1 %139 to i32
  %141 = trunc i32 %140 to i8
  br label %505

; <label>:142                                     ; preds = %124
  %143 = add i32 %125, 1
  %144 = add i32 %126, 1
  %145 = zext i32 %143 to i64
  %146 = getelementptr inbounds i8* %block, i64 %145
  %147 = load i8* %146, align 1
  %148 = zext i32 %144 to i64
  %149 = getelementptr inbounds i8* %block, i64 %148
  %150 = load i8* %149, align 1
  %151 = zext i8 %147 to i32
  %152 = zext i8 %150 to i32
  %153 = icmp ne i32 %151, %152
  br i1 %153, label %154, label %160

; <label>:154                                     ; preds = %142
  %155 = zext i8 %147 to i32
  %156 = zext i8 %150 to i32
  %157 = icmp sgt i32 %155, %156
  %158 = zext i1 %157 to i32
  %159 = trunc i32 %158 to i8
  br label %505

; <label>:160                                     ; preds = %142
  %161 = add i32 %143, 1
  %162 = add i32 %144, 1
  %163 = zext i32 %161 to i64
  %164 = getelementptr inbounds i8* %block, i64 %163
  %165 = load i8* %164, align 1
  %166 = zext i32 %162 to i64
  %167 = getelementptr inbounds i8* %block, i64 %166
  %168 = load i8* %167, align 1
  %169 = zext i8 %165 to i32
  %170 = zext i8 %168 to i32
  %171 = icmp ne i32 %169, %170
  br i1 %171, label %172, label %178

; <label>:172                                     ; preds = %160
  %173 = zext i8 %165 to i32
  %174 = zext i8 %168 to i32
  %175 = icmp sgt i32 %173, %174
  %176 = zext i1 %175 to i32
  %177 = trunc i32 %176 to i8
  br label %505

; <label>:178                                     ; preds = %160
  %179 = add i32 %161, 1
  %180 = add i32 %162, 1
  %181 = zext i32 %179 to i64
  %182 = getelementptr inbounds i8* %block, i64 %181
  %183 = load i8* %182, align 1
  %184 = zext i32 %180 to i64
  %185 = getelementptr inbounds i8* %block, i64 %184
  %186 = load i8* %185, align 1
  %187 = zext i8 %183 to i32
  %188 = zext i8 %186 to i32
  %189 = icmp ne i32 %187, %188
  br i1 %189, label %190, label %196

; <label>:190                                     ; preds = %178
  %191 = zext i8 %183 to i32
  %192 = zext i8 %186 to i32
  %193 = icmp sgt i32 %191, %192
  %194 = zext i1 %193 to i32
  %195 = trunc i32 %194 to i8
  br label %505

; <label>:196                                     ; preds = %178
  %197 = add i32 %179, 1
  %198 = add i32 %180, 1
  %199 = zext i32 %197 to i64
  %200 = getelementptr inbounds i8* %block, i64 %199
  %201 = load i8* %200, align 1
  %202 = zext i32 %198 to i64
  %203 = getelementptr inbounds i8* %block, i64 %202
  %204 = load i8* %203, align 1
  %205 = zext i8 %201 to i32
  %206 = zext i8 %204 to i32
  %207 = icmp ne i32 %205, %206
  br i1 %207, label %208, label %214

; <label>:208                                     ; preds = %196
  %209 = zext i8 %201 to i32
  %210 = zext i8 %204 to i32
  %211 = icmp sgt i32 %209, %210
  %212 = zext i1 %211 to i32
  %213 = trunc i32 %212 to i8
  br label %505

; <label>:214                                     ; preds = %196
  %215 = add i32 %197, 1
  %216 = add i32 %198, 1
  %217 = add i32 %nblock, 8
  br label %218

; <label>:218                                     ; preds = %502, %214
  %k.0 = phi i32 [ %217, %214 ], [ %499, %502 ]
  %.02 = phi i32 [ %216, %214 ], [ %.13, %502 ]
  %.01 = phi i32 [ %215, %214 ], [ %.1, %502 ]
  %219 = zext i32 %.01 to i64
  %220 = getelementptr inbounds i8* %block, i64 %219
  %221 = load i8* %220, align 1
  %222 = zext i32 %.02 to i64
  %223 = getelementptr inbounds i8* %block, i64 %222
  %224 = load i8* %223, align 1
  %225 = zext i8 %221 to i32
  %226 = zext i8 %224 to i32
  %227 = icmp ne i32 %225, %226
  br i1 %227, label %228, label %234

; <label>:228                                     ; preds = %218
  %229 = zext i8 %221 to i32
  %230 = zext i8 %224 to i32
  %231 = icmp sgt i32 %229, %230
  %232 = zext i1 %231 to i32
  %233 = trunc i32 %232 to i8
  br label %505

; <label>:234                                     ; preds = %218
  %235 = zext i32 %.01 to i64
  %236 = getelementptr inbounds i16* %quadrant, i64 %235
  %237 = load i16* %236, align 2
  %238 = zext i32 %.02 to i64
  %239 = getelementptr inbounds i16* %quadrant, i64 %238
  %240 = load i16* %239, align 2
  %241 = zext i16 %237 to i32
  %242 = zext i16 %240 to i32
  %243 = icmp ne i32 %241, %242
  br i1 %243, label %244, label %250

; <label>:244                                     ; preds = %234
  %245 = zext i16 %237 to i32
  %246 = zext i16 %240 to i32
  %247 = icmp sgt i32 %245, %246
  %248 = zext i1 %247 to i32
  %249 = trunc i32 %248 to i8
  br label %505

; <label>:250                                     ; preds = %234
  %251 = add i32 %.01, 1
  %252 = add i32 %.02, 1
  %253 = zext i32 %251 to i64
  %254 = getelementptr inbounds i8* %block, i64 %253
  %255 = load i8* %254, align 1
  %256 = zext i32 %252 to i64
  %257 = getelementptr inbounds i8* %block, i64 %256
  %258 = load i8* %257, align 1
  %259 = zext i8 %255 to i32
  %260 = zext i8 %258 to i32
  %261 = icmp ne i32 %259, %260
  br i1 %261, label %262, label %268

; <label>:262                                     ; preds = %250
  %263 = zext i8 %255 to i32
  %264 = zext i8 %258 to i32
  %265 = icmp sgt i32 %263, %264
  %266 = zext i1 %265 to i32
  %267 = trunc i32 %266 to i8
  br label %505

; <label>:268                                     ; preds = %250
  %269 = zext i32 %251 to i64
  %270 = getelementptr inbounds i16* %quadrant, i64 %269
  %271 = load i16* %270, align 2
  %272 = zext i32 %252 to i64
  %273 = getelementptr inbounds i16* %quadrant, i64 %272
  %274 = load i16* %273, align 2
  %275 = zext i16 %271 to i32
  %276 = zext i16 %274 to i32
  %277 = icmp ne i32 %275, %276
  br i1 %277, label %278, label %284

; <label>:278                                     ; preds = %268
  %279 = zext i16 %271 to i32
  %280 = zext i16 %274 to i32
  %281 = icmp sgt i32 %279, %280
  %282 = zext i1 %281 to i32
  %283 = trunc i32 %282 to i8
  br label %505

; <label>:284                                     ; preds = %268
  %285 = add i32 %251, 1
  %286 = add i32 %252, 1
  %287 = zext i32 %285 to i64
  %288 = getelementptr inbounds i8* %block, i64 %287
  %289 = load i8* %288, align 1
  %290 = zext i32 %286 to i64
  %291 = getelementptr inbounds i8* %block, i64 %290
  %292 = load i8* %291, align 1
  %293 = zext i8 %289 to i32
  %294 = zext i8 %292 to i32
  %295 = icmp ne i32 %293, %294
  br i1 %295, label %296, label %302

; <label>:296                                     ; preds = %284
  %297 = zext i8 %289 to i32
  %298 = zext i8 %292 to i32
  %299 = icmp sgt i32 %297, %298
  %300 = zext i1 %299 to i32
  %301 = trunc i32 %300 to i8
  br label %505

; <label>:302                                     ; preds = %284
  %303 = zext i32 %285 to i64
  %304 = getelementptr inbounds i16* %quadrant, i64 %303
  %305 = load i16* %304, align 2
  %306 = zext i32 %286 to i64
  %307 = getelementptr inbounds i16* %quadrant, i64 %306
  %308 = load i16* %307, align 2
  %309 = zext i16 %305 to i32
  %310 = zext i16 %308 to i32
  %311 = icmp ne i32 %309, %310
  br i1 %311, label %312, label %318

; <label>:312                                     ; preds = %302
  %313 = zext i16 %305 to i32
  %314 = zext i16 %308 to i32
  %315 = icmp sgt i32 %313, %314
  %316 = zext i1 %315 to i32
  %317 = trunc i32 %316 to i8
  br label %505

; <label>:318                                     ; preds = %302
  %319 = add i32 %285, 1
  %320 = add i32 %286, 1
  %321 = zext i32 %319 to i64
  %322 = getelementptr inbounds i8* %block, i64 %321
  %323 = load i8* %322, align 1
  %324 = zext i32 %320 to i64
  %325 = getelementptr inbounds i8* %block, i64 %324
  %326 = load i8* %325, align 1
  %327 = zext i8 %323 to i32
  %328 = zext i8 %326 to i32
  %329 = icmp ne i32 %327, %328
  br i1 %329, label %330, label %336

; <label>:330                                     ; preds = %318
  %331 = zext i8 %323 to i32
  %332 = zext i8 %326 to i32
  %333 = icmp sgt i32 %331, %332
  %334 = zext i1 %333 to i32
  %335 = trunc i32 %334 to i8
  br label %505

; <label>:336                                     ; preds = %318
  %337 = zext i32 %319 to i64
  %338 = getelementptr inbounds i16* %quadrant, i64 %337
  %339 = load i16* %338, align 2
  %340 = zext i32 %320 to i64
  %341 = getelementptr inbounds i16* %quadrant, i64 %340
  %342 = load i16* %341, align 2
  %343 = zext i16 %339 to i32
  %344 = zext i16 %342 to i32
  %345 = icmp ne i32 %343, %344
  br i1 %345, label %346, label %352

; <label>:346                                     ; preds = %336
  %347 = zext i16 %339 to i32
  %348 = zext i16 %342 to i32
  %349 = icmp sgt i32 %347, %348
  %350 = zext i1 %349 to i32
  %351 = trunc i32 %350 to i8
  br label %505

; <label>:352                                     ; preds = %336
  %353 = add i32 %319, 1
  %354 = add i32 %320, 1
  %355 = zext i32 %353 to i64
  %356 = getelementptr inbounds i8* %block, i64 %355
  %357 = load i8* %356, align 1
  %358 = zext i32 %354 to i64
  %359 = getelementptr inbounds i8* %block, i64 %358
  %360 = load i8* %359, align 1
  %361 = zext i8 %357 to i32
  %362 = zext i8 %360 to i32
  %363 = icmp ne i32 %361, %362
  br i1 %363, label %364, label %370

; <label>:364                                     ; preds = %352
  %365 = zext i8 %357 to i32
  %366 = zext i8 %360 to i32
  %367 = icmp sgt i32 %365, %366
  %368 = zext i1 %367 to i32
  %369 = trunc i32 %368 to i8
  br label %505

; <label>:370                                     ; preds = %352
  %371 = zext i32 %353 to i64
  %372 = getelementptr inbounds i16* %quadrant, i64 %371
  %373 = load i16* %372, align 2
  %374 = zext i32 %354 to i64
  %375 = getelementptr inbounds i16* %quadrant, i64 %374
  %376 = load i16* %375, align 2
  %377 = zext i16 %373 to i32
  %378 = zext i16 %376 to i32
  %379 = icmp ne i32 %377, %378
  br i1 %379, label %380, label %386

; <label>:380                                     ; preds = %370
  %381 = zext i16 %373 to i32
  %382 = zext i16 %376 to i32
  %383 = icmp sgt i32 %381, %382
  %384 = zext i1 %383 to i32
  %385 = trunc i32 %384 to i8
  br label %505

; <label>:386                                     ; preds = %370
  %387 = add i32 %353, 1
  %388 = add i32 %354, 1
  %389 = zext i32 %387 to i64
  %390 = getelementptr inbounds i8* %block, i64 %389
  %391 = load i8* %390, align 1
  %392 = zext i32 %388 to i64
  %393 = getelementptr inbounds i8* %block, i64 %392
  %394 = load i8* %393, align 1
  %395 = zext i8 %391 to i32
  %396 = zext i8 %394 to i32
  %397 = icmp ne i32 %395, %396
  br i1 %397, label %398, label %404

; <label>:398                                     ; preds = %386
  %399 = zext i8 %391 to i32
  %400 = zext i8 %394 to i32
  %401 = icmp sgt i32 %399, %400
  %402 = zext i1 %401 to i32
  %403 = trunc i32 %402 to i8
  br label %505

; <label>:404                                     ; preds = %386
  %405 = zext i32 %387 to i64
  %406 = getelementptr inbounds i16* %quadrant, i64 %405
  %407 = load i16* %406, align 2
  %408 = zext i32 %388 to i64
  %409 = getelementptr inbounds i16* %quadrant, i64 %408
  %410 = load i16* %409, align 2
  %411 = zext i16 %407 to i32
  %412 = zext i16 %410 to i32
  %413 = icmp ne i32 %411, %412
  br i1 %413, label %414, label %420

; <label>:414                                     ; preds = %404
  %415 = zext i16 %407 to i32
  %416 = zext i16 %410 to i32
  %417 = icmp sgt i32 %415, %416
  %418 = zext i1 %417 to i32
  %419 = trunc i32 %418 to i8
  br label %505

; <label>:420                                     ; preds = %404
  %421 = add i32 %387, 1
  %422 = add i32 %388, 1
  %423 = zext i32 %421 to i64
  %424 = getelementptr inbounds i8* %block, i64 %423
  %425 = load i8* %424, align 1
  %426 = zext i32 %422 to i64
  %427 = getelementptr inbounds i8* %block, i64 %426
  %428 = load i8* %427, align 1
  %429 = zext i8 %425 to i32
  %430 = zext i8 %428 to i32
  %431 = icmp ne i32 %429, %430
  br i1 %431, label %432, label %438

; <label>:432                                     ; preds = %420
  %433 = zext i8 %425 to i32
  %434 = zext i8 %428 to i32
  %435 = icmp sgt i32 %433, %434
  %436 = zext i1 %435 to i32
  %437 = trunc i32 %436 to i8
  br label %505

; <label>:438                                     ; preds = %420
  %439 = zext i32 %421 to i64
  %440 = getelementptr inbounds i16* %quadrant, i64 %439
  %441 = load i16* %440, align 2
  %442 = zext i32 %422 to i64
  %443 = getelementptr inbounds i16* %quadrant, i64 %442
  %444 = load i16* %443, align 2
  %445 = zext i16 %441 to i32
  %446 = zext i16 %444 to i32
  %447 = icmp ne i32 %445, %446
  br i1 %447, label %448, label %454

; <label>:448                                     ; preds = %438
  %449 = zext i16 %441 to i32
  %450 = zext i16 %444 to i32
  %451 = icmp sgt i32 %449, %450
  %452 = zext i1 %451 to i32
  %453 = trunc i32 %452 to i8
  br label %505

; <label>:454                                     ; preds = %438
  %455 = add i32 %421, 1
  %456 = add i32 %422, 1
  %457 = zext i32 %455 to i64
  %458 = getelementptr inbounds i8* %block, i64 %457
  %459 = load i8* %458, align 1
  %460 = zext i32 %456 to i64
  %461 = getelementptr inbounds i8* %block, i64 %460
  %462 = load i8* %461, align 1
  %463 = zext i8 %459 to i32
  %464 = zext i8 %462 to i32
  %465 = icmp ne i32 %463, %464
  br i1 %465, label %466, label %472

; <label>:466                                     ; preds = %454
  %467 = zext i8 %459 to i32
  %468 = zext i8 %462 to i32
  %469 = icmp sgt i32 %467, %468
  %470 = zext i1 %469 to i32
  %471 = trunc i32 %470 to i8
  br label %505

; <label>:472                                     ; preds = %454
  %473 = zext i32 %455 to i64
  %474 = getelementptr inbounds i16* %quadrant, i64 %473
  %475 = load i16* %474, align 2
  %476 = zext i32 %456 to i64
  %477 = getelementptr inbounds i16* %quadrant, i64 %476
  %478 = load i16* %477, align 2
  %479 = zext i16 %475 to i32
  %480 = zext i16 %478 to i32
  %481 = icmp ne i32 %479, %480
  br i1 %481, label %482, label %488

; <label>:482                                     ; preds = %472
  %483 = zext i16 %475 to i32
  %484 = zext i16 %478 to i32
  %485 = icmp sgt i32 %483, %484
  %486 = zext i1 %485 to i32
  %487 = trunc i32 %486 to i8
  br label %505

; <label>:488                                     ; preds = %472
  %489 = add i32 %455, 1
  %490 = add i32 %456, 1
  %491 = icmp uge i32 %489, %nblock
  br i1 %491, label %492, label %494

; <label>:492                                     ; preds = %488
  %493 = sub i32 %489, %nblock
  br label %494

; <label>:494                                     ; preds = %492, %488
  %.1 = phi i32 [ %493, %492 ], [ %489, %488 ]
  %495 = icmp uge i32 %490, %nblock
  br i1 %495, label %496, label %498

; <label>:496                                     ; preds = %494
  %497 = sub i32 %490, %nblock
  br label %498

; <label>:498                                     ; preds = %496, %494
  %.13 = phi i32 [ %497, %496 ], [ %490, %494 ]
  %499 = sub nsw i32 %k.0, 8
  %500 = load i32* %budget, align 4
  %501 = add nsw i32 %500, -1
  store i32 %501, i32* %budget, align 4
  br label %502

; <label>:502                                     ; preds = %498
  %503 = icmp sge i32 %499, 0
  br i1 %503, label %218, label %504

; <label>:504                                     ; preds = %502
  br label %505

; <label>:505                                     ; preds = %504, %482, %466, %448, %432, %414, %398, %380, %364, %346, %330, %312, %296, %278, %262, %244, %228, %208, %190, %172, %154, %136, %118, %100, %82, %64, %46, %28, %10
  %.0 = phi i8 [ %15, %10 ], [ %33, %28 ], [ %51, %46 ], [ %69, %64 ], [ %87, %82 ], [ %105, %100 ], [ %123, %118 ], [ %141, %136 ], [ %159, %154 ], [ %177, %172 ], [ %195, %190 ], [ %213, %208 ], [ %233, %228 ], [ %249, %244 ], [ %267, %262 ], [ %283, %278 ], [ %301, %296 ], [ %317, %312 ], [ %335, %330 ], [ %351, %346 ], [ %369, %364 ], [ %385, %380 ], [ %403, %398 ], [ %419, %414 ], [ %437, %432 ], [ %453, %448 ], [ %471, %466 ], [ %487, %482 ], [ 0, %504 ]
  ret i8 %.0
}

; Function Attrs: nounwind uwtable
define internal void @fallbackQSort3(i32* %fmap, i32* %eclass, i32 %loSt, i32 %hiSt) #0 {
  %stackLo = alloca [100 x i32], align 16
  %stackHi = alloca [100 x i32], align 16
  %1 = sext i32 0 to i64
  %2 = getelementptr inbounds [100 x i32]* %stackLo, i32 0, i64 %1
  store i32 %loSt, i32* %2, align 4
  %3 = sext i32 0 to i64
  %4 = getelementptr inbounds [100 x i32]* %stackHi, i32 0, i64 %3
  store i32 %hiSt, i32* %4, align 4
  %5 = add nsw i32 0, 1
  br label %6

; <label>:6                                       ; preds = %223, %135, %21, %0
  %r.0 = phi i32 [ 0, %0 ], [ %r.0, %21 ], [ %25, %135 ], [ %25, %223 ]
  %sp.0 = phi i32 [ %5, %0 ], [ %12, %21 ], [ %12, %135 ], [ %sp.1, %223 ]
  %7 = icmp sgt i32 %sp.0, 0
  br i1 %7, label %8, label %224

; <label>:8                                       ; preds = %6
  %9 = icmp slt i32 %sp.0, 100
  br i1 %9, label %11, label %10

; <label>:10                                      ; preds = %8
  call void @BZ2_bz__AssertH__fail(i32 1004)
  br label %11

; <label>:11                                      ; preds = %10, %8
  %12 = add nsw i32 %sp.0, -1
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [100 x i32]* %stackLo, i32 0, i64 %13
  %15 = load i32* %14, align 4
  %16 = sext i32 %12 to i64
  %17 = getelementptr inbounds [100 x i32]* %stackHi, i32 0, i64 %16
  %18 = load i32* %17, align 4
  %19 = sub nsw i32 %18, %15
  %20 = icmp slt i32 %19, 10
  br i1 %20, label %21, label %22

; <label>:21                                      ; preds = %11
  call void @fallbackSimpleSort(i32* %fmap, i32* %eclass, i32 %15, i32 %18)
  br label %6

; <label>:22                                      ; preds = %11
  %23 = mul i32 %r.0, 7621
  %24 = add i32 %23, 1
  %25 = urem i32 %24, 32768
  %26 = urem i32 %25, 3
  %27 = icmp eq i32 %26, 0
  br i1 %27, label %28, label %35

; <label>:28                                      ; preds = %22
  %29 = sext i32 %15 to i64
  %30 = getelementptr inbounds i32* %fmap, i64 %29
  %31 = load i32* %30, align 4
  %32 = zext i32 %31 to i64
  %33 = getelementptr inbounds i32* %eclass, i64 %32
  %34 = load i32* %33, align 4
  br label %54

; <label>:35                                      ; preds = %22
  %36 = icmp eq i32 %26, 1
  br i1 %36, label %37, label %46

; <label>:37                                      ; preds = %35
  %38 = add nsw i32 %15, %18
  %39 = ashr i32 %38, 1
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds i32* %fmap, i64 %40
  %42 = load i32* %41, align 4
  %43 = zext i32 %42 to i64
  %44 = getelementptr inbounds i32* %eclass, i64 %43
  %45 = load i32* %44, align 4
  br label %53

; <label>:46                                      ; preds = %35
  %47 = sext i32 %18 to i64
  %48 = getelementptr inbounds i32* %fmap, i64 %47
  %49 = load i32* %48, align 4
  %50 = zext i32 %49 to i64
  %51 = getelementptr inbounds i32* %eclass, i64 %50
  %52 = load i32* %51, align 4
  br label %53

; <label>:53                                      ; preds = %46, %37
  %med.0 = phi i32 [ %45, %37 ], [ %52, %46 ]
  br label %54

; <label>:54                                      ; preds = %53, %28
  %med.1 = phi i32 [ %34, %28 ], [ %med.0, %53 ]
  br label %55

; <label>:55                                      ; preds = %120, %54
  %gtHi.0 = phi i32 [ %18, %54 ], [ %gtHi.1, %120 ]
  %ltLo.0 = phi i32 [ %15, %54 ], [ %ltLo.1, %120 ]
  %unHi.0 = phi i32 [ %18, %54 ], [ %132, %120 ]
  %unLo.0 = phi i32 [ %15, %54 ], [ %131, %120 ]
  br label %56

; <label>:56                                      ; preds = %84, %68, %55
  %ltLo.1 = phi i32 [ %ltLo.0, %55 ], [ %79, %68 ], [ %ltLo.1, %84 ]
  %unLo.1 = phi i32 [ %unLo.0, %55 ], [ %80, %68 ], [ %85, %84 ]
  %57 = icmp sgt i32 %unLo.1, %unHi.0
  br i1 %57, label %58, label %59

; <label>:58                                      ; preds = %56
  br label %86

; <label>:59                                      ; preds = %56
  %60 = sext i32 %unLo.1 to i64
  %61 = getelementptr inbounds i32* %fmap, i64 %60
  %62 = load i32* %61, align 4
  %63 = zext i32 %62 to i64
  %64 = getelementptr inbounds i32* %eclass, i64 %63
  %65 = load i32* %64, align 4
  %66 = sub nsw i32 %65, %med.1
  %67 = icmp eq i32 %66, 0
  br i1 %67, label %68, label %81

; <label>:68                                      ; preds = %59
  %69 = sext i32 %unLo.1 to i64
  %70 = getelementptr inbounds i32* %fmap, i64 %69
  %71 = load i32* %70, align 4
  %72 = sext i32 %ltLo.1 to i64
  %73 = getelementptr inbounds i32* %fmap, i64 %72
  %74 = load i32* %73, align 4
  %75 = sext i32 %unLo.1 to i64
  %76 = getelementptr inbounds i32* %fmap, i64 %75
  store i32 %74, i32* %76, align 4
  %77 = sext i32 %ltLo.1 to i64
  %78 = getelementptr inbounds i32* %fmap, i64 %77
  store i32 %71, i32* %78, align 4
  %79 = add nsw i32 %ltLo.1, 1
  %80 = add nsw i32 %unLo.1, 1
  br label %56

; <label>:81                                      ; preds = %59
  %82 = icmp sgt i32 %66, 0
  br i1 %82, label %83, label %84

; <label>:83                                      ; preds = %81
  br label %86

; <label>:84                                      ; preds = %81
  %85 = add nsw i32 %unLo.1, 1
  br label %56

; <label>:86                                      ; preds = %83, %58
  br label %87

; <label>:87                                      ; preds = %115, %99, %86
  %gtHi.1 = phi i32 [ %gtHi.0, %86 ], [ %110, %99 ], [ %gtHi.1, %115 ]
  %unHi.1 = phi i32 [ %unHi.0, %86 ], [ %111, %99 ], [ %116, %115 ]
  %88 = icmp sgt i32 %unLo.1, %unHi.1
  br i1 %88, label %89, label %90

; <label>:89                                      ; preds = %87
  br label %117

; <label>:90                                      ; preds = %87
  %91 = sext i32 %unHi.1 to i64
  %92 = getelementptr inbounds i32* %fmap, i64 %91
  %93 = load i32* %92, align 4
  %94 = zext i32 %93 to i64
  %95 = getelementptr inbounds i32* %eclass, i64 %94
  %96 = load i32* %95, align 4
  %97 = sub nsw i32 %96, %med.1
  %98 = icmp eq i32 %97, 0
  br i1 %98, label %99, label %112

; <label>:99                                      ; preds = %90
  %100 = sext i32 %unHi.1 to i64
  %101 = getelementptr inbounds i32* %fmap, i64 %100
  %102 = load i32* %101, align 4
  %103 = sext i32 %gtHi.1 to i64
  %104 = getelementptr inbounds i32* %fmap, i64 %103
  %105 = load i32* %104, align 4
  %106 = sext i32 %unHi.1 to i64
  %107 = getelementptr inbounds i32* %fmap, i64 %106
  store i32 %105, i32* %107, align 4
  %108 = sext i32 %gtHi.1 to i64
  %109 = getelementptr inbounds i32* %fmap, i64 %108
  store i32 %102, i32* %109, align 4
  %110 = add nsw i32 %gtHi.1, -1
  %111 = add nsw i32 %unHi.1, -1
  br label %87

; <label>:112                                     ; preds = %90
  %113 = icmp slt i32 %97, 0
  br i1 %113, label %114, label %115

; <label>:114                                     ; preds = %112
  br label %117

; <label>:115                                     ; preds = %112
  %116 = add nsw i32 %unHi.1, -1
  br label %87

; <label>:117                                     ; preds = %114, %89
  %118 = icmp sgt i32 %unLo.1, %unHi.1
  br i1 %118, label %119, label %120

; <label>:119                                     ; preds = %117
  br label %133

; <label>:120                                     ; preds = %117
  %121 = sext i32 %unLo.1 to i64
  %122 = getelementptr inbounds i32* %fmap, i64 %121
  %123 = load i32* %122, align 4
  %124 = sext i32 %unHi.1 to i64
  %125 = getelementptr inbounds i32* %fmap, i64 %124
  %126 = load i32* %125, align 4
  %127 = sext i32 %unLo.1 to i64
  %128 = getelementptr inbounds i32* %fmap, i64 %127
  store i32 %126, i32* %128, align 4
  %129 = sext i32 %unHi.1 to i64
  %130 = getelementptr inbounds i32* %fmap, i64 %129
  store i32 %123, i32* %130, align 4
  %131 = add nsw i32 %unLo.1, 1
  %132 = add nsw i32 %unHi.1, -1
  br label %55

; <label>:133                                     ; preds = %119
  %134 = icmp slt i32 %gtHi.1, %ltLo.1
  br i1 %134, label %135, label %136

; <label>:135                                     ; preds = %133
  br label %6

; <label>:136                                     ; preds = %133
  %137 = sub nsw i32 %ltLo.1, %15
  %138 = sub nsw i32 %unLo.1, %ltLo.1
  %139 = icmp slt i32 %137, %138
  br i1 %139, label %140, label %142

; <label>:140                                     ; preds = %136
  %141 = sub nsw i32 %ltLo.1, %15
  br label %144

; <label>:142                                     ; preds = %136
  %143 = sub nsw i32 %unLo.1, %ltLo.1
  br label %144

; <label>:144                                     ; preds = %142, %140
  %145 = phi i32 [ %141, %140 ], [ %143, %142 ]
  %146 = sub nsw i32 %unLo.1, %145
  br label %147

; <label>:147                                     ; preds = %149, %144
  %yyp1.0 = phi i32 [ %15, %144 ], [ %160, %149 ]
  %yyp2.0 = phi i32 [ %146, %144 ], [ %161, %149 ]
  %yyn.0 = phi i32 [ %145, %144 ], [ %162, %149 ]
  %148 = icmp sgt i32 %yyn.0, 0
  br i1 %148, label %149, label %163

; <label>:149                                     ; preds = %147
  %150 = sext i32 %yyp1.0 to i64
  %151 = getelementptr inbounds i32* %fmap, i64 %150
  %152 = load i32* %151, align 4
  %153 = sext i32 %yyp2.0 to i64
  %154 = getelementptr inbounds i32* %fmap, i64 %153
  %155 = load i32* %154, align 4
  %156 = sext i32 %yyp1.0 to i64
  %157 = getelementptr inbounds i32* %fmap, i64 %156
  store i32 %155, i32* %157, align 4
  %158 = sext i32 %yyp2.0 to i64
  %159 = getelementptr inbounds i32* %fmap, i64 %158
  store i32 %152, i32* %159, align 4
  %160 = add nsw i32 %yyp1.0, 1
  %161 = add nsw i32 %yyp2.0, 1
  %162 = add nsw i32 %yyn.0, -1
  br label %147

; <label>:163                                     ; preds = %147
  %164 = sub nsw i32 %18, %gtHi.1
  %165 = sub nsw i32 %gtHi.1, %unHi.1
  %166 = icmp slt i32 %164, %165
  br i1 %166, label %167, label %169

; <label>:167                                     ; preds = %163
  %168 = sub nsw i32 %18, %gtHi.1
  br label %171

; <label>:169                                     ; preds = %163
  %170 = sub nsw i32 %gtHi.1, %unHi.1
  br label %171

; <label>:171                                     ; preds = %169, %167
  %172 = phi i32 [ %168, %167 ], [ %170, %169 ]
  %173 = sub nsw i32 %18, %172
  %174 = add nsw i32 %173, 1
  br label %175

; <label>:175                                     ; preds = %177, %171
  %yyp14.0 = phi i32 [ %unLo.1, %171 ], [ %188, %177 ]
  %yyp25.0 = phi i32 [ %174, %171 ], [ %189, %177 ]
  %yyn6.0 = phi i32 [ %172, %171 ], [ %190, %177 ]
  %176 = icmp sgt i32 %yyn6.0, 0
  br i1 %176, label %177, label %191

; <label>:177                                     ; preds = %175
  %178 = sext i32 %yyp14.0 to i64
  %179 = getelementptr inbounds i32* %fmap, i64 %178
  %180 = load i32* %179, align 4
  %181 = sext i32 %yyp25.0 to i64
  %182 = getelementptr inbounds i32* %fmap, i64 %181
  %183 = load i32* %182, align 4
  %184 = sext i32 %yyp14.0 to i64
  %185 = getelementptr inbounds i32* %fmap, i64 %184
  store i32 %183, i32* %185, align 4
  %186 = sext i32 %yyp25.0 to i64
  %187 = getelementptr inbounds i32* %fmap, i64 %186
  store i32 %180, i32* %187, align 4
  %188 = add nsw i32 %yyp14.0, 1
  %189 = add nsw i32 %yyp25.0, 1
  %190 = add nsw i32 %yyn6.0, -1
  br label %175

; <label>:191                                     ; preds = %175
  %192 = add nsw i32 %15, %unLo.1
  %193 = sub nsw i32 %192, %ltLo.1
  %194 = sub nsw i32 %193, 1
  %195 = sub nsw i32 %gtHi.1, %unHi.1
  %196 = sub nsw i32 %18, %195
  %197 = add nsw i32 %196, 1
  %198 = sub nsw i32 %194, %15
  %199 = sub nsw i32 %18, %197
  %200 = icmp sgt i32 %198, %199
  br i1 %200, label %201, label %212

; <label>:201                                     ; preds = %191
  %202 = sext i32 %12 to i64
  %203 = getelementptr inbounds [100 x i32]* %stackLo, i32 0, i64 %202
  store i32 %15, i32* %203, align 4
  %204 = sext i32 %12 to i64
  %205 = getelementptr inbounds [100 x i32]* %stackHi, i32 0, i64 %204
  store i32 %194, i32* %205, align 4
  %206 = add nsw i32 %12, 1
  %207 = sext i32 %206 to i64
  %208 = getelementptr inbounds [100 x i32]* %stackLo, i32 0, i64 %207
  store i32 %197, i32* %208, align 4
  %209 = sext i32 %206 to i64
  %210 = getelementptr inbounds [100 x i32]* %stackHi, i32 0, i64 %209
  store i32 %18, i32* %210, align 4
  %211 = add nsw i32 %206, 1
  br label %223

; <label>:212                                     ; preds = %191
  %213 = sext i32 %12 to i64
  %214 = getelementptr inbounds [100 x i32]* %stackLo, i32 0, i64 %213
  store i32 %197, i32* %214, align 4
  %215 = sext i32 %12 to i64
  %216 = getelementptr inbounds [100 x i32]* %stackHi, i32 0, i64 %215
  store i32 %18, i32* %216, align 4
  %217 = add nsw i32 %12, 1
  %218 = sext i32 %217 to i64
  %219 = getelementptr inbounds [100 x i32]* %stackLo, i32 0, i64 %218
  store i32 %15, i32* %219, align 4
  %220 = sext i32 %217 to i64
  %221 = getelementptr inbounds [100 x i32]* %stackHi, i32 0, i64 %220
  store i32 %194, i32* %221, align 4
  %222 = add nsw i32 %217, 1
  br label %223

; <label>:223                                     ; preds = %212, %201
  %sp.1 = phi i32 [ %211, %201 ], [ %222, %212 ]
  br label %6

; <label>:224                                     ; preds = %6
  ret void
}

; Function Attrs: inlinehint nounwind uwtable
define internal void @fallbackSimpleSort(i32* %fmap, i32* %eclass, i32 %lo, i32 %hi) #2 {
  %1 = icmp eq i32 %lo, %hi
  br i1 %1, label %2, label %3

; <label>:2                                       ; preds = %0
  br label %85

; <label>:3                                       ; preds = %0
  %4 = sub nsw i32 %hi, %lo
  %5 = icmp sgt i32 %4, 3
  br i1 %5, label %6, label %46

; <label>:6                                       ; preds = %3
  %7 = sub nsw i32 %hi, 4
  br label %8

; <label>:8                                       ; preds = %43, %6
  %i.0 = phi i32 [ %7, %6 ], [ %44, %43 ]
  %9 = icmp sge i32 %i.0, %lo
  br i1 %9, label %10, label %45

; <label>:10                                      ; preds = %8
  %11 = sext i32 %i.0 to i64
  %12 = getelementptr inbounds i32* %fmap, i64 %11
  %13 = load i32* %12, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds i32* %eclass, i64 %14
  %16 = load i32* %15, align 4
  %17 = add nsw i32 %i.0, 4
  br label %18

; <label>:18                                      ; preds = %37, %10
  %j.0 = phi i32 [ %17, %10 ], [ %38, %37 ]
  %19 = icmp sle i32 %j.0, %hi
  br i1 %19, label %20, label %28

; <label>:20                                      ; preds = %18
  %21 = sext i32 %j.0 to i64
  %22 = getelementptr inbounds i32* %fmap, i64 %21
  %23 = load i32* %22, align 4
  %24 = zext i32 %23 to i64
  %25 = getelementptr inbounds i32* %eclass, i64 %24
  %26 = load i32* %25, align 4
  %27 = icmp ugt i32 %16, %26
  br label %28

; <label>:28                                      ; preds = %20, %18
  %29 = phi i1 [ false, %18 ], [ %27, %20 ]
  br i1 %29, label %30, label %39

; <label>:30                                      ; preds = %28
  %31 = sext i32 %j.0 to i64
  %32 = getelementptr inbounds i32* %fmap, i64 %31
  %33 = load i32* %32, align 4
  %34 = sub nsw i32 %j.0, 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds i32* %fmap, i64 %35
  store i32 %33, i32* %36, align 4
  br label %37

; <label>:37                                      ; preds = %30
  %38 = add nsw i32 %j.0, 4
  br label %18

; <label>:39                                      ; preds = %28
  %40 = sub nsw i32 %j.0, 4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds i32* %fmap, i64 %41
  store i32 %13, i32* %42, align 4
  br label %43

; <label>:43                                      ; preds = %39
  %44 = add nsw i32 %i.0, -1
  br label %8

; <label>:45                                      ; preds = %8
  br label %46

; <label>:46                                      ; preds = %45, %3
  %47 = sub nsw i32 %hi, 1
  br label %48

; <label>:48                                      ; preds = %83, %46
  %i.1 = phi i32 [ %47, %46 ], [ %84, %83 ]
  %49 = icmp sge i32 %i.1, %lo
  br i1 %49, label %50, label %85

; <label>:50                                      ; preds = %48
  %51 = sext i32 %i.1 to i64
  %52 = getelementptr inbounds i32* %fmap, i64 %51
  %53 = load i32* %52, align 4
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds i32* %eclass, i64 %54
  %56 = load i32* %55, align 4
  %57 = add nsw i32 %i.1, 1
  br label %58

; <label>:58                                      ; preds = %77, %50
  %j.1 = phi i32 [ %57, %50 ], [ %78, %77 ]
  %59 = icmp sle i32 %j.1, %hi
  br i1 %59, label %60, label %68

; <label>:60                                      ; preds = %58
  %61 = sext i32 %j.1 to i64
  %62 = getelementptr inbounds i32* %fmap, i64 %61
  %63 = load i32* %62, align 4
  %64 = zext i32 %63 to i64
  %65 = getelementptr inbounds i32* %eclass, i64 %64
  %66 = load i32* %65, align 4
  %67 = icmp ugt i32 %56, %66
  br label %68

; <label>:68                                      ; preds = %60, %58
  %69 = phi i1 [ false, %58 ], [ %67, %60 ]
  br i1 %69, label %70, label %79

; <label>:70                                      ; preds = %68
  %71 = sext i32 %j.1 to i64
  %72 = getelementptr inbounds i32* %fmap, i64 %71
  %73 = load i32* %72, align 4
  %74 = sub nsw i32 %j.1, 1
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds i32* %fmap, i64 %75
  store i32 %73, i32* %76, align 4
  br label %77

; <label>:77                                      ; preds = %70
  %78 = add nsw i32 %j.1, 1
  br label %58

; <label>:79                                      ; preds = %68
  %80 = sub nsw i32 %j.1, 1
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds i32* %fmap, i64 %81
  store i32 %53, i32* %82, align 4
  br label %83

; <label>:83                                      ; preds = %79
  %84 = add nsw i32 %i.1, -1
  br label %48

; <label>:85                                      ; preds = %48, %2
  ret void
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { inlinehint nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
