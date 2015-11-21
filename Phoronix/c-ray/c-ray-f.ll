; ModuleID = 'c-ray-f.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.vec3 = type { double, double, double }
%struct.sphere = type { %struct.vec3, double, %struct.material, %struct.sphere* }
%struct.material = type { %struct.vec3, double, double }
%struct.camera = type { %struct.vec3, %struct.vec3, double }
%struct.timeval = type { i64, i64 }
%struct.timezone = type { i32, i32 }
%struct.ray = type { %struct.vec3, %struct.vec3 }
%struct.spoint = type { %struct.vec3, %struct.vec3, %struct.vec3, double }

@xres = global i32 800, align 4
@yres = global i32 600, align 4
@aspect = global double 1.333333e+00, align 8
@lnum = global i32 0, align 4
@.str = private unnamed_addr constant [363 x i8] c"Usage: c-ray-f [options]\0A  Reads a scene file from stdin, writes the image to stdout, and stats to stderr.\0A\0AOptions:\0A  -s WxH     where W is the width and H the height of the image\0A  -r <rays>  shoot <rays> rays per pixel (antialiasing)\0A  -i <file>  read from <file> instead of stdin\0A  -o <file>  write to <file> instead of stdout\0A  -h         this help screen\0A\0A\00", align 1
@usage = global i8* getelementptr inbounds ([363 x i8]* @.str, i32 0, i32 0), align 8
@stdin = external global %struct._IO_FILE*
@stdout = external global %struct._IO_FILE*
@.str1 = private unnamed_addr constant [49 x i8] c"-s must be followed by something like \22640x480\22\0A\00", align 1
@stderr = external global %struct._IO_FILE*
@.str2 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str3 = private unnamed_addr constant [34 x i8] c"failed to open input file %s: %s\0A\00", align 1
@.str4 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str5 = private unnamed_addr constant [35 x i8] c"failed to open output file %s: %s\0A\00", align 1
@.str6 = private unnamed_addr constant [50 x i8] c"-r must be followed by a number (rays per pixel)\0A\00", align 1
@.str7 = private unnamed_addr constant [27 x i8] c"unrecognized argument: %s\0A\00", align 1
@.str8 = private unnamed_addr constant [31 x i8] c"pixel buffer allocation failed\00", align 1
@urand = common global [1024 x %struct.vec3] zeroinitializer, align 16
@irand = common global [1024 x i32] zeroinitializer, align 16
@.str9 = private unnamed_addr constant [48 x i8] c"Rendering took: %lu seconds (%lu milliseconds)\0A\00", align 1
@.str10 = private unnamed_addr constant [14 x i8] c"P6\0A%d %d\0A255\0A\00", align 1
@obj_list = common global %struct.sphere* null, align 8
@lights = common global [16 x %struct.vec3] zeroinitializer, align 16
@get_primary_ray.j = private unnamed_addr constant %struct.vec3 { double 0.000000e+00, double 1.000000e+00, double 0.000000e+00 }, align 8
@cam = common global %struct.camera zeroinitializer, align 8
@get_sample_pos.sf = internal global double 0.000000e+00, align 8
@.str11 = private unnamed_addr constant [4 x i8] c" \09\0A\00", align 1
@.str12 = private unnamed_addr constant [18 x i8] c"unknown type: %c\0A\00", align 1
@get_msec.timeval = internal global %struct.timeval zeroinitializer, align 8
@get_msec.first_timeval = internal global %struct.timeval zeroinitializer, align 8

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %i = alloca i32, align 4
  %rend_time = alloca i64, align 8
  %start_time = alloca i64, align 8
  %pixels = alloca i32*, align 8
  %rays_per_pixel = alloca i32, align 4
  %infile = alloca %struct._IO_FILE*, align 8
  %outfile = alloca %struct._IO_FILE*, align 8
  %sep = alloca i8*, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  store i32 1, i32* %rays_per_pixel, align 4
  %4 = load %struct._IO_FILE** @stdin, align 8
  store %struct._IO_FILE* %4, %struct._IO_FILE** %infile, align 8
  %5 = load %struct._IO_FILE** @stdout, align 8
  store %struct._IO_FILE* %5, %struct._IO_FILE** %outfile, align 8
  store i32 1, i32* %i, align 4
  br label %6

; <label>:6                                       ; preds = %194, %0
  %7 = load i32* %i, align 4
  %8 = load i32* %2, align 4
  %9 = icmp slt i32 %7, %8
  br i1 %9, label %10, label %197

; <label>:10                                      ; preds = %6
  %11 = load i32* %i, align 4
  %12 = sext i32 %11 to i64
  %13 = load i8*** %3, align 8
  %14 = getelementptr inbounds i8** %13, i64 %12
  %15 = load i8** %14, align 8
  %16 = getelementptr inbounds i8* %15, i64 0
  %17 = load i8* %16, align 1
  %18 = sext i8 %17 to i32
  %19 = icmp eq i32 %18, 45
  br i1 %19, label %20, label %182

; <label>:20                                      ; preds = %10
  %21 = load i32* %i, align 4
  %22 = sext i32 %21 to i64
  %23 = load i8*** %3, align 8
  %24 = getelementptr inbounds i8** %23, i64 %22
  %25 = load i8** %24, align 8
  %26 = getelementptr inbounds i8* %25, i64 2
  %27 = load i8* %26, align 1
  %28 = sext i8 %27 to i32
  %29 = icmp eq i32 %28, 0
  br i1 %29, label %30, label %182

; <label>:30                                      ; preds = %20
  %31 = load i32* %i, align 4
  %32 = sext i32 %31 to i64
  %33 = load i8*** %3, align 8
  %34 = getelementptr inbounds i8** %33, i64 %32
  %35 = load i8** %34, align 8
  %36 = getelementptr inbounds i8* %35, i64 1
  %37 = load i8* %36, align 1
  %38 = sext i8 %37 to i32
  switch i32 %38, label %170 [
    i32 115, label %39
    i32 105, label %96
    i32 111, label %117
    i32 114, label %138
    i32 104, label %166
  ]

; <label>:39                                      ; preds = %30
  %40 = load i32* %i, align 4
  %41 = add nsw i32 %40, 1
  store i32 %41, i32* %i, align 4
  %42 = sext i32 %41 to i64
  %43 = load i8*** %3, align 8
  %44 = getelementptr inbounds i8** %43, i64 %42
  %45 = load i8** %44, align 8
  %46 = getelementptr inbounds i8* %45, i64 0
  %47 = load i8* %46, align 1
  %48 = sext i8 %47 to i32
  %49 = sext i32 %48 to i64
  %50 = call i16** @__ctype_b_loc() #6
  %51 = load i16** %50, align 8
  %52 = getelementptr inbounds i16* %51, i64 %49
  %53 = load i16* %52, align 2
  %54 = zext i16 %53 to i32
  %55 = and i32 %54, 2048
  %56 = icmp ne i32 %55, 0
  br i1 %56, label %57, label %78

; <label>:57                                      ; preds = %39
  %58 = load i32* %i, align 4
  %59 = sext i32 %58 to i64
  %60 = load i8*** %3, align 8
  %61 = getelementptr inbounds i8** %60, i64 %59
  %62 = load i8** %61, align 8
  %63 = call i8* @strchr(i8* %62, i32 120) #7
  store i8* %63, i8** %sep, align 8
  %64 = icmp ne i8* %63, null
  br i1 %64, label %65, label %78

; <label>:65                                      ; preds = %57
  %66 = load i8** %sep, align 8
  %67 = getelementptr inbounds i8* %66, i64 1
  %68 = load i8* %67, align 1
  %69 = sext i8 %68 to i32
  %70 = sext i32 %69 to i64
  %71 = call i16** @__ctype_b_loc() #6
  %72 = load i16** %71, align 8
  %73 = getelementptr inbounds i16* %72, i64 %70
  %74 = load i16* %73, align 2
  %75 = zext i16 %74 to i32
  %76 = and i32 %75, 2048
  %77 = icmp ne i32 %76, 0
  br i1 %77, label %81, label %78

; <label>:78                                      ; preds = %65, %57, %39
  %79 = load %struct._IO_FILE** @stderr, align 8
  %80 = call i32 @fputs(i8* getelementptr inbounds ([49 x i8]* @.str1, i32 0, i32 0), %struct._IO_FILE* %79)
  store i32 1, i32* %1
  br label %328

; <label>:81                                      ; preds = %65
  %82 = load i32* %i, align 4
  %83 = sext i32 %82 to i64
  %84 = load i8*** %3, align 8
  %85 = getelementptr inbounds i8** %84, i64 %83
  %86 = load i8** %85, align 8
  %87 = call i32 @atoi(i8* %86) #7
  store i32 %87, i32* @xres, align 4
  %88 = load i8** %sep, align 8
  %89 = getelementptr inbounds i8* %88, i64 1
  %90 = call i32 @atoi(i8* %89) #7
  store i32 %90, i32* @yres, align 4
  %91 = load i32* @xres, align 4
  %92 = sitofp i32 %91 to double
  %93 = load i32* @yres, align 4
  %94 = sitofp i32 %93 to double
  %95 = fdiv double %92, %94
  store double %95, double* @aspect, align 8
  br label %181

; <label>:96                                      ; preds = %30
  %97 = load i32* %i, align 4
  %98 = add nsw i32 %97, 1
  store i32 %98, i32* %i, align 4
  %99 = sext i32 %98 to i64
  %100 = load i8*** %3, align 8
  %101 = getelementptr inbounds i8** %100, i64 %99
  %102 = load i8** %101, align 8
  %103 = call %struct._IO_FILE* @fopen(i8* %102, i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0))
  store %struct._IO_FILE* %103, %struct._IO_FILE** %infile, align 8
  %104 = icmp ne %struct._IO_FILE* %103, null
  br i1 %104, label %116, label %105

; <label>:105                                     ; preds = %96
  %106 = load %struct._IO_FILE** @stderr, align 8
  %107 = load i32* %i, align 4
  %108 = sext i32 %107 to i64
  %109 = load i8*** %3, align 8
  %110 = getelementptr inbounds i8** %109, i64 %108
  %111 = load i8** %110, align 8
  %112 = call i32* @__errno_location() #6
  %113 = load i32* %112, align 4
  %114 = call i8* @strerror(i32 %113) #5
  %115 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %106, i8* getelementptr inbounds ([34 x i8]* @.str3, i32 0, i32 0), i8* %111, i8* %114)
  store i32 1, i32* %1
  br label %328

; <label>:116                                     ; preds = %96
  br label %181

; <label>:117                                     ; preds = %30
  %118 = load i32* %i, align 4
  %119 = add nsw i32 %118, 1
  store i32 %119, i32* %i, align 4
  %120 = sext i32 %119 to i64
  %121 = load i8*** %3, align 8
  %122 = getelementptr inbounds i8** %121, i64 %120
  %123 = load i8** %122, align 8
  %124 = call %struct._IO_FILE* @fopen(i8* %123, i8* getelementptr inbounds ([2 x i8]* @.str4, i32 0, i32 0))
  store %struct._IO_FILE* %124, %struct._IO_FILE** %outfile, align 8
  %125 = icmp ne %struct._IO_FILE* %124, null
  br i1 %125, label %137, label %126

; <label>:126                                     ; preds = %117
  %127 = load %struct._IO_FILE** @stderr, align 8
  %128 = load i32* %i, align 4
  %129 = sext i32 %128 to i64
  %130 = load i8*** %3, align 8
  %131 = getelementptr inbounds i8** %130, i64 %129
  %132 = load i8** %131, align 8
  %133 = call i32* @__errno_location() #6
  %134 = load i32* %133, align 4
  %135 = call i8* @strerror(i32 %134) #5
  %136 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %127, i8* getelementptr inbounds ([35 x i8]* @.str5, i32 0, i32 0), i8* %132, i8* %135)
  store i32 1, i32* %1
  br label %328

; <label>:137                                     ; preds = %117
  br label %181

; <label>:138                                     ; preds = %30
  %139 = load i32* %i, align 4
  %140 = add nsw i32 %139, 1
  store i32 %140, i32* %i, align 4
  %141 = sext i32 %140 to i64
  %142 = load i8*** %3, align 8
  %143 = getelementptr inbounds i8** %142, i64 %141
  %144 = load i8** %143, align 8
  %145 = getelementptr inbounds i8* %144, i64 0
  %146 = load i8* %145, align 1
  %147 = sext i8 %146 to i32
  %148 = sext i32 %147 to i64
  %149 = call i16** @__ctype_b_loc() #6
  %150 = load i16** %149, align 8
  %151 = getelementptr inbounds i16* %150, i64 %148
  %152 = load i16* %151, align 2
  %153 = zext i16 %152 to i32
  %154 = and i32 %153, 2048
  %155 = icmp ne i32 %154, 0
  br i1 %155, label %159, label %156

; <label>:156                                     ; preds = %138
  %157 = load %struct._IO_FILE** @stderr, align 8
  %158 = call i32 @fputs(i8* getelementptr inbounds ([50 x i8]* @.str6, i32 0, i32 0), %struct._IO_FILE* %157)
  store i32 1, i32* %1
  br label %328

; <label>:159                                     ; preds = %138
  %160 = load i32* %i, align 4
  %161 = sext i32 %160 to i64
  %162 = load i8*** %3, align 8
  %163 = getelementptr inbounds i8** %162, i64 %161
  %164 = load i8** %163, align 8
  %165 = call i32 @atoi(i8* %164) #7
  store i32 %165, i32* %rays_per_pixel, align 4
  br label %181

; <label>:166                                     ; preds = %30
  %167 = load i8** @usage, align 8
  %168 = load %struct._IO_FILE** @stdout, align 8
  %169 = call i32 @fputs(i8* %167, %struct._IO_FILE* %168)
  store i32 0, i32* %1
  br label %328

; <label>:170                                     ; preds = %30
  %171 = load %struct._IO_FILE** @stderr, align 8
  %172 = load i32* %i, align 4
  %173 = sext i32 %172 to i64
  %174 = load i8*** %3, align 8
  %175 = getelementptr inbounds i8** %174, i64 %173
  %176 = load i8** %175, align 8
  %177 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %171, i8* getelementptr inbounds ([27 x i8]* @.str7, i32 0, i32 0), i8* %176)
  %178 = load i8** @usage, align 8
  %179 = load %struct._IO_FILE** @stderr, align 8
  %180 = call i32 @fputs(i8* %178, %struct._IO_FILE* %179)
  store i32 1, i32* %1
  br label %328

; <label>:181                                     ; preds = %159, %137, %116, %81
  br label %193

; <label>:182                                     ; preds = %20, %10
  %183 = load %struct._IO_FILE** @stderr, align 8
  %184 = load i32* %i, align 4
  %185 = sext i32 %184 to i64
  %186 = load i8*** %3, align 8
  %187 = getelementptr inbounds i8** %186, i64 %185
  %188 = load i8** %187, align 8
  %189 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %183, i8* getelementptr inbounds ([27 x i8]* @.str7, i32 0, i32 0), i8* %188)
  %190 = load i8** @usage, align 8
  %191 = load %struct._IO_FILE** @stderr, align 8
  %192 = call i32 @fputs(i8* %190, %struct._IO_FILE* %191)
  store i32 1, i32* %1
  br label %328

; <label>:193                                     ; preds = %181
  br label %194

; <label>:194                                     ; preds = %193
  %195 = load i32* %i, align 4
  %196 = add nsw i32 %195, 1
  store i32 %196, i32* %i, align 4
  br label %6

; <label>:197                                     ; preds = %6
  %198 = load i32* @xres, align 4
  %199 = load i32* @yres, align 4
  %200 = mul nsw i32 %198, %199
  %201 = sext i32 %200 to i64
  %202 = mul i64 %201, 4
  %203 = call noalias i8* @malloc(i64 %202) #5
  %204 = bitcast i8* %203 to i32*
  store i32* %204, i32** %pixels, align 8
  %205 = icmp ne i32* %204, null
  br i1 %205, label %207, label %206

; <label>:206                                     ; preds = %197
  call void @perror(i8* getelementptr inbounds ([31 x i8]* @.str8, i32 0, i32 0))
  store i32 1, i32* %1
  br label %328

; <label>:207                                     ; preds = %197
  %208 = load %struct._IO_FILE** %infile, align 8
  call void @load_scene(%struct._IO_FILE* %208)
  store i32 0, i32* %i, align 4
  br label %209

; <label>:209                                     ; preds = %221, %207
  %210 = load i32* %i, align 4
  %211 = icmp slt i32 %210, 1024
  br i1 %211, label %212, label %224

; <label>:212                                     ; preds = %209
  %213 = call i32 @rand() #5
  %214 = sitofp i32 %213 to double
  %215 = fdiv double %214, 0x41DFFFFFFFC00000
  %216 = fsub double %215, 5.000000e-01
  %217 = load i32* %i, align 4
  %218 = sext i32 %217 to i64
  %219 = getelementptr inbounds [1024 x %struct.vec3]* @urand, i32 0, i64 %218
  %220 = getelementptr inbounds %struct.vec3* %219, i32 0, i32 0
  store double %216, double* %220, align 8
  br label %221

; <label>:221                                     ; preds = %212
  %222 = load i32* %i, align 4
  %223 = add nsw i32 %222, 1
  store i32 %223, i32* %i, align 4
  br label %209

; <label>:224                                     ; preds = %209
  store i32 0, i32* %i, align 4
  br label %225

; <label>:225                                     ; preds = %237, %224
  %226 = load i32* %i, align 4
  %227 = icmp slt i32 %226, 1024
  br i1 %227, label %228, label %240

; <label>:228                                     ; preds = %225
  %229 = call i32 @rand() #5
  %230 = sitofp i32 %229 to double
  %231 = fdiv double %230, 0x41DFFFFFFFC00000
  %232 = fsub double %231, 5.000000e-01
  %233 = load i32* %i, align 4
  %234 = sext i32 %233 to i64
  %235 = getelementptr inbounds [1024 x %struct.vec3]* @urand, i32 0, i64 %234
  %236 = getelementptr inbounds %struct.vec3* %235, i32 0, i32 1
  store double %232, double* %236, align 8
  br label %237

; <label>:237                                     ; preds = %228
  %238 = load i32* %i, align 4
  %239 = add nsw i32 %238, 1
  store i32 %239, i32* %i, align 4
  br label %225

; <label>:240                                     ; preds = %225
  store i32 0, i32* %i, align 4
  br label %241

; <label>:241                                     ; preds = %253, %240
  %242 = load i32* %i, align 4
  %243 = icmp slt i32 %242, 1024
  br i1 %243, label %244, label %256

; <label>:244                                     ; preds = %241
  %245 = call i32 @rand() #5
  %246 = sitofp i32 %245 to double
  %247 = fdiv double %246, 0x41DFFFFFFFC00000
  %248 = fmul double 1.024000e+03, %247
  %249 = fptosi double %248 to i32
  %250 = load i32* %i, align 4
  %251 = sext i32 %250 to i64
  %252 = getelementptr inbounds [1024 x i32]* @irand, i32 0, i64 %251
  store i32 %249, i32* %252, align 4
  br label %253

; <label>:253                                     ; preds = %244
  %254 = load i32* %i, align 4
  %255 = add nsw i32 %254, 1
  store i32 %255, i32* %i, align 4
  br label %241

; <label>:256                                     ; preds = %241
  %257 = call i64 @get_msec()
  store i64 %257, i64* %start_time, align 8
  %258 = load i32* @xres, align 4
  %259 = load i32* @yres, align 4
  %260 = load i32** %pixels, align 8
  %261 = load i32* %rays_per_pixel, align 4
  call void @render(i32 %258, i32 %259, i32* %260, i32 %261)
  %262 = call i64 @get_msec()
  %263 = load i64* %start_time, align 8
  %264 = sub i64 %262, %263
  store i64 %264, i64* %rend_time, align 8
  %265 = load %struct._IO_FILE** @stderr, align 8
  %266 = load i64* %rend_time, align 8
  %267 = udiv i64 %266, 1000
  %268 = load i64* %rend_time, align 8
  %269 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %265, i8* getelementptr inbounds ([48 x i8]* @.str9, i32 0, i32 0), i64 %267, i64 %268)
  %270 = load %struct._IO_FILE** %outfile, align 8
  %271 = load i32* @xres, align 4
  %272 = load i32* @yres, align 4
  %273 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %270, i8* getelementptr inbounds ([14 x i8]* @.str10, i32 0, i32 0), i32 %271, i32 %272)
  store i32 0, i32* %i, align 4
  br label %274

; <label>:274                                     ; preds = %308, %256
  %275 = load i32* %i, align 4
  %276 = load i32* @xres, align 4
  %277 = load i32* @yres, align 4
  %278 = mul nsw i32 %276, %277
  %279 = icmp slt i32 %275, %278
  br i1 %279, label %280, label %311

; <label>:280                                     ; preds = %274
  %281 = load i32* %i, align 4
  %282 = sext i32 %281 to i64
  %283 = load i32** %pixels, align 8
  %284 = getelementptr inbounds i32* %283, i64 %282
  %285 = load i32* %284, align 4
  %286 = lshr i32 %285, 16
  %287 = and i32 %286, 255
  %288 = load %struct._IO_FILE** %outfile, align 8
  %289 = call i32 @fputc(i32 %287, %struct._IO_FILE* %288)
  %290 = load i32* %i, align 4
  %291 = sext i32 %290 to i64
  %292 = load i32** %pixels, align 8
  %293 = getelementptr inbounds i32* %292, i64 %291
  %294 = load i32* %293, align 4
  %295 = lshr i32 %294, 8
  %296 = and i32 %295, 255
  %297 = load %struct._IO_FILE** %outfile, align 8
  %298 = call i32 @fputc(i32 %296, %struct._IO_FILE* %297)
  %299 = load i32* %i, align 4
  %300 = sext i32 %299 to i64
  %301 = load i32** %pixels, align 8
  %302 = getelementptr inbounds i32* %301, i64 %300
  %303 = load i32* %302, align 4
  %304 = lshr i32 %303, 0
  %305 = and i32 %304, 255
  %306 = load %struct._IO_FILE** %outfile, align 8
  %307 = call i32 @fputc(i32 %305, %struct._IO_FILE* %306)
  br label %308

; <label>:308                                     ; preds = %280
  %309 = load i32* %i, align 4
  %310 = add nsw i32 %309, 1
  store i32 %310, i32* %i, align 4
  br label %274

; <label>:311                                     ; preds = %274
  %312 = load %struct._IO_FILE** %outfile, align 8
  %313 = call i32 @fflush(%struct._IO_FILE* %312)
  %314 = load %struct._IO_FILE** %infile, align 8
  %315 = load %struct._IO_FILE** @stdin, align 8
  %316 = icmp ne %struct._IO_FILE* %314, %315
  br i1 %316, label %317, label %320

; <label>:317                                     ; preds = %311
  %318 = load %struct._IO_FILE** %infile, align 8
  %319 = call i32 @fclose(%struct._IO_FILE* %318)
  br label %320

; <label>:320                                     ; preds = %317, %311
  %321 = load %struct._IO_FILE** %outfile, align 8
  %322 = load %struct._IO_FILE** @stdout, align 8
  %323 = icmp ne %struct._IO_FILE* %321, %322
  br i1 %323, label %324, label %327

; <label>:324                                     ; preds = %320
  %325 = load %struct._IO_FILE** %outfile, align 8
  %326 = call i32 @fclose(%struct._IO_FILE* %325)
  br label %327

; <label>:327                                     ; preds = %324, %320
  store i32 0, i32* %1
  br label %328

; <label>:328                                     ; preds = %327, %206, %182, %170, %166, %156, %126, %105, %78
  %329 = load i32* %1
  ret i32 %329
}

; Function Attrs: nounwind readnone
declare i16** @__ctype_b_loc() #1

; Function Attrs: nounwind readonly
declare i8* @strchr(i8*, i32) #2

declare i32 @fputs(i8*, %struct._IO_FILE*) #3

; Function Attrs: nounwind readonly
declare i32 @atoi(i8*) #2

declare %struct._IO_FILE* @fopen(i8*, i8*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #3

; Function Attrs: nounwind
declare i8* @strerror(i32) #4

; Function Attrs: nounwind readnone
declare i32* @__errno_location() #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #4

declare void @perror(i8*) #3

; Function Attrs: nounwind uwtable
define void @load_scene(%struct._IO_FILE* %fp) #0 {
  %1 = alloca %struct._IO_FILE*, align 8
  %line = alloca [256 x i8], align 16
  %ptr = alloca i8*, align 8
  %type = alloca i8, align 1
  %i = alloca i32, align 4
  %pos = alloca %struct.vec3, align 8
  %col = alloca %struct.vec3, align 8
  %rad = alloca double, align 8
  %spow = alloca double, align 8
  %refl = alloca double, align 8
  %sph = alloca %struct.sphere*, align 8
  store %struct._IO_FILE* %fp, %struct._IO_FILE** %1, align 8
  %2 = call noalias i8* @malloc(i64 80) #5
  %3 = bitcast i8* %2 to %struct.sphere*
  store %struct.sphere* %3, %struct.sphere** @obj_list, align 8
  %4 = load %struct.sphere** @obj_list, align 8
  %5 = getelementptr inbounds %struct.sphere* %4, i32 0, i32 3
  store %struct.sphere* null, %struct.sphere** %5, align 8
  br label %6

; <label>:6                                       ; preds = %158, %115, %109, %102, %77, %67, %42, %37, %0
  %7 = getelementptr inbounds [256 x i8]* %line, i32 0, i32 0
  %8 = load %struct._IO_FILE** %1, align 8
  %9 = call i8* @fgets(i8* %7, i32 256, %struct._IO_FILE* %8)
  store i8* %9, i8** %ptr, align 8
  %10 = icmp ne i8* %9, null
  br i1 %10, label %11, label %159

; <label>:11                                      ; preds = %6
  br label %12

; <label>:12                                      ; preds = %24, %11
  %13 = load i8** %ptr, align 8
  %14 = load i8* %13, align 1
  %15 = sext i8 %14 to i32
  %16 = icmp eq i32 %15, 32
  br i1 %16, label %22, label %17

; <label>:17                                      ; preds = %12
  %18 = load i8** %ptr, align 8
  %19 = load i8* %18, align 1
  %20 = sext i8 %19 to i32
  %21 = icmp eq i32 %20, 9
  br label %22

; <label>:22                                      ; preds = %17, %12
  %23 = phi i1 [ true, %12 ], [ %21, %17 ]
  br i1 %23, label %24, label %27

; <label>:24                                      ; preds = %22
  %25 = load i8** %ptr, align 8
  %26 = getelementptr inbounds i8* %25, i32 1
  store i8* %26, i8** %ptr, align 8
  br label %12

; <label>:27                                      ; preds = %22
  %28 = load i8** %ptr, align 8
  %29 = load i8* %28, align 1
  %30 = sext i8 %29 to i32
  %31 = icmp eq i32 %30, 35
  br i1 %31, label %37, label %32

; <label>:32                                      ; preds = %27
  %33 = load i8** %ptr, align 8
  %34 = load i8* %33, align 1
  %35 = sext i8 %34 to i32
  %36 = icmp eq i32 %35, 10
  br i1 %36, label %37, label %38

; <label>:37                                      ; preds = %32, %27
  br label %6

; <label>:38                                      ; preds = %32
  %39 = getelementptr inbounds [256 x i8]* %line, i32 0, i32 0
  %40 = call i8* @strtok(i8* %39, i8* getelementptr inbounds ([4 x i8]* @.str11, i32 0, i32 0)) #5
  store i8* %40, i8** %ptr, align 8
  %41 = icmp ne i8* %40, null
  br i1 %41, label %43, label %42

; <label>:42                                      ; preds = %38
  br label %6

; <label>:43                                      ; preds = %38
  %44 = load i8** %ptr, align 8
  %45 = load i8* %44, align 1
  store i8 %45, i8* %type, align 1
  store i32 0, i32* %i, align 4
  br label %46

; <label>:46                                      ; preds = %60, %43
  %47 = load i32* %i, align 4
  %48 = icmp slt i32 %47, 3
  br i1 %48, label %49, label %63

; <label>:49                                      ; preds = %46
  %50 = call i8* @strtok(i8* null, i8* getelementptr inbounds ([4 x i8]* @.str11, i32 0, i32 0)) #5
  store i8* %50, i8** %ptr, align 8
  %51 = icmp ne i8* %50, null
  br i1 %51, label %53, label %52

; <label>:52                                      ; preds = %49
  br label %63

; <label>:53                                      ; preds = %49
  %54 = load i8** %ptr, align 8
  %55 = call double @atof(i8* %54) #7
  %56 = getelementptr inbounds %struct.vec3* %pos, i32 0, i32 0
  %57 = load i32* %i, align 4
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds double* %56, i64 %58
  store double %55, double* %59, align 8
  br label %60

; <label>:60                                      ; preds = %53
  %61 = load i32* %i, align 4
  %62 = add nsw i32 %61, 1
  store i32 %62, i32* %i, align 4
  br label %46

; <label>:63                                      ; preds = %52, %46
  %64 = load i8* %type, align 1
  %65 = sext i8 %64 to i32
  %66 = icmp eq i32 %65, 108
  br i1 %66, label %67, label %74

; <label>:67                                      ; preds = %63
  %68 = load i32* @lnum, align 4
  %69 = add nsw i32 %68, 1
  store i32 %69, i32* @lnum, align 4
  %70 = sext i32 %68 to i64
  %71 = getelementptr inbounds [16 x %struct.vec3]* @lights, i32 0, i64 %70
  %72 = bitcast %struct.vec3* %71 to i8*
  %73 = bitcast %struct.vec3* %pos to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %72, i8* %73, i64 24, i32 8, i1 false)
  br label %6

; <label>:74                                      ; preds = %63
  %75 = call i8* @strtok(i8* null, i8* getelementptr inbounds ([4 x i8]* @.str11, i32 0, i32 0)) #5
  store i8* %75, i8** %ptr, align 8
  %76 = icmp ne i8* %75, null
  br i1 %76, label %78, label %77

; <label>:77                                      ; preds = %74
  br label %6

; <label>:78                                      ; preds = %74
  %79 = load i8** %ptr, align 8
  %80 = call double @atof(i8* %79) #7
  store double %80, double* %rad, align 8
  store i32 0, i32* %i, align 4
  br label %81

; <label>:81                                      ; preds = %95, %78
  %82 = load i32* %i, align 4
  %83 = icmp slt i32 %82, 3
  br i1 %83, label %84, label %98

; <label>:84                                      ; preds = %81
  %85 = call i8* @strtok(i8* null, i8* getelementptr inbounds ([4 x i8]* @.str11, i32 0, i32 0)) #5
  store i8* %85, i8** %ptr, align 8
  %86 = icmp ne i8* %85, null
  br i1 %86, label %88, label %87

; <label>:87                                      ; preds = %84
  br label %98

; <label>:88                                      ; preds = %84
  %89 = load i8** %ptr, align 8
  %90 = call double @atof(i8* %89) #7
  %91 = getelementptr inbounds %struct.vec3* %col, i32 0, i32 0
  %92 = load i32* %i, align 4
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds double* %91, i64 %93
  store double %90, double* %94, align 8
  br label %95

; <label>:95                                      ; preds = %88
  %96 = load i32* %i, align 4
  %97 = add nsw i32 %96, 1
  store i32 %97, i32* %i, align 4
  br label %81

; <label>:98                                      ; preds = %87, %81
  %99 = load i8* %type, align 1
  %100 = sext i8 %99 to i32
  %101 = icmp eq i32 %100, 99
  br i1 %101, label %102, label %106

; <label>:102                                     ; preds = %98
  %103 = bitcast %struct.vec3* %pos to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* bitcast (%struct.camera* @cam to i8*), i8* %103, i64 24, i32 8, i1 false)
  %104 = bitcast %struct.vec3* %col to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* bitcast (%struct.vec3* getelementptr inbounds (%struct.camera* @cam, i32 0, i32 1) to i8*), i8* %104, i64 24, i32 8, i1 false)
  %105 = load double* %rad, align 8
  store double %105, double* getelementptr inbounds (%struct.camera* @cam, i32 0, i32 2), align 8
  br label %6

; <label>:106                                     ; preds = %98
  %107 = call i8* @strtok(i8* null, i8* getelementptr inbounds ([4 x i8]* @.str11, i32 0, i32 0)) #5
  store i8* %107, i8** %ptr, align 8
  %108 = icmp ne i8* %107, null
  br i1 %108, label %110, label %109

; <label>:109                                     ; preds = %106
  br label %6

; <label>:110                                     ; preds = %106
  %111 = load i8** %ptr, align 8
  %112 = call double @atof(i8* %111) #7
  store double %112, double* %spow, align 8
  %113 = call i8* @strtok(i8* null, i8* getelementptr inbounds ([4 x i8]* @.str11, i32 0, i32 0)) #5
  store i8* %113, i8** %ptr, align 8
  %114 = icmp ne i8* %113, null
  br i1 %114, label %116, label %115

; <label>:115                                     ; preds = %110
  br label %6

; <label>:116                                     ; preds = %110
  %117 = load i8** %ptr, align 8
  %118 = call double @atof(i8* %117) #7
  store double %118, double* %refl, align 8
  %119 = load i8* %type, align 1
  %120 = sext i8 %119 to i32
  %121 = icmp eq i32 %120, 115
  br i1 %121, label %122, label %153

; <label>:122                                     ; preds = %116
  %123 = call noalias i8* @malloc(i64 80) #5
  %124 = bitcast i8* %123 to %struct.sphere*
  store %struct.sphere* %124, %struct.sphere** %sph, align 8
  %125 = load %struct.sphere** @obj_list, align 8
  %126 = getelementptr inbounds %struct.sphere* %125, i32 0, i32 3
  %127 = load %struct.sphere** %126, align 8
  %128 = load %struct.sphere** %sph, align 8
  %129 = getelementptr inbounds %struct.sphere* %128, i32 0, i32 3
  store %struct.sphere* %127, %struct.sphere** %129, align 8
  %130 = load %struct.sphere** %sph, align 8
  %131 = load %struct.sphere** @obj_list, align 8
  %132 = getelementptr inbounds %struct.sphere* %131, i32 0, i32 3
  store %struct.sphere* %130, %struct.sphere** %132, align 8
  %133 = load %struct.sphere** %sph, align 8
  %134 = getelementptr inbounds %struct.sphere* %133, i32 0, i32 0
  %135 = bitcast %struct.vec3* %134 to i8*
  %136 = bitcast %struct.vec3* %pos to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %135, i8* %136, i64 24, i32 8, i1 false)
  %137 = load double* %rad, align 8
  %138 = load %struct.sphere** %sph, align 8
  %139 = getelementptr inbounds %struct.sphere* %138, i32 0, i32 1
  store double %137, double* %139, align 8
  %140 = load %struct.sphere** %sph, align 8
  %141 = getelementptr inbounds %struct.sphere* %140, i32 0, i32 2
  %142 = getelementptr inbounds %struct.material* %141, i32 0, i32 0
  %143 = bitcast %struct.vec3* %142 to i8*
  %144 = bitcast %struct.vec3* %col to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %143, i8* %144, i64 24, i32 8, i1 false)
  %145 = load double* %spow, align 8
  %146 = load %struct.sphere** %sph, align 8
  %147 = getelementptr inbounds %struct.sphere* %146, i32 0, i32 2
  %148 = getelementptr inbounds %struct.material* %147, i32 0, i32 1
  store double %145, double* %148, align 8
  %149 = load double* %refl, align 8
  %150 = load %struct.sphere** %sph, align 8
  %151 = getelementptr inbounds %struct.sphere* %150, i32 0, i32 2
  %152 = getelementptr inbounds %struct.material* %151, i32 0, i32 2
  store double %149, double* %152, align 8
  br label %158

; <label>:153                                     ; preds = %116
  %154 = load %struct._IO_FILE** @stderr, align 8
  %155 = load i8* %type, align 1
  %156 = sext i8 %155 to i32
  %157 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %154, i8* getelementptr inbounds ([18 x i8]* @.str12, i32 0, i32 0), i32 %156)
  br label %158

; <label>:158                                     ; preds = %153, %122
  br label %6

; <label>:159                                     ; preds = %6
  ret void
}

; Function Attrs: nounwind
declare i32 @rand() #4

; Function Attrs: nounwind uwtable
define i64 @get_msec() #0 {
  %1 = alloca i64, align 8
  %2 = call i32 @gettimeofday(%struct.timeval* @get_msec.timeval, %struct.timezone* null) #5
  %3 = load i64* getelementptr inbounds (%struct.timeval* @get_msec.first_timeval, i32 0, i32 0), align 8
  %4 = icmp eq i64 %3, 0
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* bitcast (%struct.timeval* @get_msec.first_timeval to i8*), i8* bitcast (%struct.timeval* @get_msec.timeval to i8*), i64 16, i32 8, i1 false)
  store i64 0, i64* %1
  br label %16

; <label>:6                                       ; preds = %0
  %7 = load i64* getelementptr inbounds (%struct.timeval* @get_msec.timeval, i32 0, i32 0), align 8
  %8 = load i64* getelementptr inbounds (%struct.timeval* @get_msec.first_timeval, i32 0, i32 0), align 8
  %9 = sub nsw i64 %7, %8
  %10 = mul nsw i64 %9, 1000
  %11 = load i64* getelementptr inbounds (%struct.timeval* @get_msec.timeval, i32 0, i32 1), align 8
  %12 = load i64* getelementptr inbounds (%struct.timeval* @get_msec.first_timeval, i32 0, i32 1), align 8
  %13 = sub nsw i64 %11, %12
  %14 = sdiv i64 %13, 1000
  %15 = add nsw i64 %10, %14
  store i64 %15, i64* %1
  br label %16

; <label>:16                                      ; preds = %6, %5
  %17 = load i64* %1
  ret i64 %17
}

; Function Attrs: nounwind uwtable
define void @render(i32 %xsz, i32 %ysz, i32* %fb, i32 %samples) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32*, align 8
  %4 = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %s = alloca i32, align 4
  %rcp_samples = alloca double, align 8
  %r = alloca double, align 8
  %g = alloca double, align 8
  %b = alloca double, align 8
  %col = alloca %struct.vec3, align 8
  %5 = alloca %struct.ray, align 8
  store i32 %xsz, i32* %1, align 4
  store i32 %ysz, i32* %2, align 4
  store i32* %fb, i32** %3, align 8
  store i32 %samples, i32* %4, align 4
  %6 = load i32* %4, align 4
  %7 = sitofp i32 %6 to double
  %8 = fdiv double 1.000000e+00, %7
  store double %8, double* %rcp_samples, align 8
  store i32 0, i32* %j, align 4
  br label %9

; <label>:9                                       ; preds = %93, %0
  %10 = load i32* %j, align 4
  %11 = load i32* %2, align 4
  %12 = icmp slt i32 %10, %11
  br i1 %12, label %13, label %96

; <label>:13                                      ; preds = %9
  store i32 0, i32* %i, align 4
  br label %14

; <label>:14                                      ; preds = %89, %13
  %15 = load i32* %i, align 4
  %16 = load i32* %1, align 4
  %17 = icmp slt i32 %15, %16
  br i1 %17, label %18, label %92

; <label>:18                                      ; preds = %14
  store double 0.000000e+00, double* %b, align 8
  store double 0.000000e+00, double* %g, align 8
  store double 0.000000e+00, double* %r, align 8
  store i32 0, i32* %s, align 4
  br label %19

; <label>:19                                      ; preds = %39, %18
  %20 = load i32* %s, align 4
  %21 = load i32* %4, align 4
  %22 = icmp slt i32 %20, %21
  br i1 %22, label %23, label %42

; <label>:23                                      ; preds = %19
  %24 = load i32* %i, align 4
  %25 = load i32* %j, align 4
  %26 = load i32* %s, align 4
  call void @get_primary_ray(%struct.ray* sret %5, i32 %24, i32 %25, i32 %26)
  call void @trace(%struct.vec3* sret %col, %struct.ray* byval align 8 %5, i32 0)
  %27 = getelementptr inbounds %struct.vec3* %col, i32 0, i32 0
  %28 = load double* %27, align 8
  %29 = load double* %r, align 8
  %30 = fadd double %29, %28
  store double %30, double* %r, align 8
  %31 = getelementptr inbounds %struct.vec3* %col, i32 0, i32 1
  %32 = load double* %31, align 8
  %33 = load double* %g, align 8
  %34 = fadd double %33, %32
  store double %34, double* %g, align 8
  %35 = getelementptr inbounds %struct.vec3* %col, i32 0, i32 2
  %36 = load double* %35, align 8
  %37 = load double* %b, align 8
  %38 = fadd double %37, %36
  store double %38, double* %b, align 8
  br label %39

; <label>:39                                      ; preds = %23
  %40 = load i32* %s, align 4
  %41 = add nsw i32 %40, 1
  store i32 %41, i32* %s, align 4
  br label %19

; <label>:42                                      ; preds = %19
  %43 = load double* %r, align 8
  %44 = load double* %rcp_samples, align 8
  %45 = fmul double %43, %44
  store double %45, double* %r, align 8
  %46 = load double* %g, align 8
  %47 = load double* %rcp_samples, align 8
  %48 = fmul double %46, %47
  store double %48, double* %g, align 8
  %49 = load double* %b, align 8
  %50 = load double* %rcp_samples, align 8
  %51 = fmul double %49, %50
  store double %51, double* %b, align 8
  %52 = load double* %r, align 8
  %53 = fcmp olt double %52, 1.000000e+00
  br i1 %53, label %54, label %56

; <label>:54                                      ; preds = %42
  %55 = load double* %r, align 8
  br label %57

; <label>:56                                      ; preds = %42
  br label %57

; <label>:57                                      ; preds = %56, %54
  %58 = phi double [ %55, %54 ], [ 1.000000e+00, %56 ]
  %59 = fmul double %58, 2.550000e+02
  %60 = fptoui double %59 to i32
  %61 = and i32 %60, 255
  %62 = shl i32 %61, 16
  %63 = load double* %g, align 8
  %64 = fcmp olt double %63, 1.000000e+00
  br i1 %64, label %65, label %67

; <label>:65                                      ; preds = %57
  %66 = load double* %g, align 8
  br label %68

; <label>:67                                      ; preds = %57
  br label %68

; <label>:68                                      ; preds = %67, %65
  %69 = phi double [ %66, %65 ], [ 1.000000e+00, %67 ]
  %70 = fmul double %69, 2.550000e+02
  %71 = fptoui double %70 to i32
  %72 = and i32 %71, 255
  %73 = shl i32 %72, 8
  %74 = or i32 %62, %73
  %75 = load double* %b, align 8
  %76 = fcmp olt double %75, 1.000000e+00
  br i1 %76, label %77, label %79

; <label>:77                                      ; preds = %68
  %78 = load double* %b, align 8
  br label %80

; <label>:79                                      ; preds = %68
  br label %80

; <label>:80                                      ; preds = %79, %77
  %81 = phi double [ %78, %77 ], [ 1.000000e+00, %79 ]
  %82 = fmul double %81, 2.550000e+02
  %83 = fptoui double %82 to i32
  %84 = and i32 %83, 255
  %85 = shl i32 %84, 0
  %86 = or i32 %74, %85
  %87 = load i32** %3, align 8
  %88 = getelementptr inbounds i32* %87, i32 1
  store i32* %88, i32** %3, align 8
  store i32 %86, i32* %87, align 4
  br label %89

; <label>:89                                      ; preds = %80
  %90 = load i32* %i, align 4
  %91 = add nsw i32 %90, 1
  store i32 %91, i32* %i, align 4
  br label %14

; <label>:92                                      ; preds = %14
  br label %93

; <label>:93                                      ; preds = %92
  %94 = load i32* %j, align 4
  %95 = add nsw i32 %94, 1
  store i32 %95, i32* %j, align 4
  br label %9

; <label>:96                                      ; preds = %9
  ret void
}

declare i32 @fputc(i32, %struct._IO_FILE*) #3

declare i32 @fflush(%struct._IO_FILE*) #3

declare i32 @fclose(%struct._IO_FILE*) #3

; Function Attrs: nounwind uwtable
define void @trace(%struct.vec3* noalias sret %agg.result, %struct.ray* byval align 8 %ray, i32 %depth) #0 {
  %1 = alloca i32, align 4
  %col = alloca %struct.vec3, align 8
  %sp = alloca %struct.spoint, align 8
  %nearest_sp = alloca %struct.spoint, align 8
  %nearest_obj = alloca %struct.sphere*, align 8
  %iter = alloca %struct.sphere*, align 8
  %2 = alloca %struct.vec3, align 8
  store i32 %depth, i32* %1, align 4
  store %struct.sphere* null, %struct.sphere** %nearest_obj, align 8
  %3 = load %struct.sphere** @obj_list, align 8
  %4 = getelementptr inbounds %struct.sphere* %3, i32 0, i32 3
  %5 = load %struct.sphere** %4, align 8
  store %struct.sphere* %5, %struct.sphere** %iter, align 8
  %6 = load i32* %1, align 4
  %7 = icmp sge i32 %6, 5
  br i1 %7, label %8, label %14

; <label>:8                                       ; preds = %0
  %9 = getelementptr inbounds %struct.vec3* %col, i32 0, i32 2
  store double 0.000000e+00, double* %9, align 8
  %10 = getelementptr inbounds %struct.vec3* %col, i32 0, i32 1
  store double 0.000000e+00, double* %10, align 8
  %11 = getelementptr inbounds %struct.vec3* %col, i32 0, i32 0
  store double 0.000000e+00, double* %11, align 8
  %12 = bitcast %struct.vec3* %agg.result to i8*
  %13 = bitcast %struct.vec3* %col to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %12, i8* %13, i64 24, i32 8, i1 false)
  br label %55

; <label>:14                                      ; preds = %0
  br label %15

; <label>:15                                      ; preds = %36, %14
  %16 = load %struct.sphere** %iter, align 8
  %17 = icmp ne %struct.sphere* %16, null
  br i1 %17, label %18, label %40

; <label>:18                                      ; preds = %15
  %19 = load %struct.sphere** %iter, align 8
  %20 = call i32 @ray_sphere(%struct.sphere* %19, %struct.ray* byval align 8 %ray, %struct.spoint* %sp)
  %21 = icmp ne i32 %20, 0
  br i1 %21, label %22, label %36

; <label>:22                                      ; preds = %18
  %23 = load %struct.sphere** %nearest_obj, align 8
  %24 = icmp ne %struct.sphere* %23, null
  br i1 %24, label %25, label %31

; <label>:25                                      ; preds = %22
  %26 = getelementptr inbounds %struct.spoint* %sp, i32 0, i32 3
  %27 = load double* %26, align 8
  %28 = getelementptr inbounds %struct.spoint* %nearest_sp, i32 0, i32 3
  %29 = load double* %28, align 8
  %30 = fcmp olt double %27, %29
  br i1 %30, label %31, label %35

; <label>:31                                      ; preds = %25, %22
  %32 = load %struct.sphere** %iter, align 8
  store %struct.sphere* %32, %struct.sphere** %nearest_obj, align 8
  %33 = bitcast %struct.spoint* %nearest_sp to i8*
  %34 = bitcast %struct.spoint* %sp to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %33, i8* %34, i64 80, i32 8, i1 false)
  br label %35

; <label>:35                                      ; preds = %31, %25
  br label %36

; <label>:36                                      ; preds = %35, %18
  %37 = load %struct.sphere** %iter, align 8
  %38 = getelementptr inbounds %struct.sphere* %37, i32 0, i32 3
  %39 = load %struct.sphere** %38, align 8
  store %struct.sphere* %39, %struct.sphere** %iter, align 8
  br label %15

; <label>:40                                      ; preds = %15
  %41 = load %struct.sphere** %nearest_obj, align 8
  %42 = icmp ne %struct.sphere* %41, null
  br i1 %42, label %43, label %48

; <label>:43                                      ; preds = %40
  %44 = load %struct.sphere** %nearest_obj, align 8
  %45 = load i32* %1, align 4
  call void @shade(%struct.vec3* sret %2, %struct.sphere* %44, %struct.spoint* %nearest_sp, i32 %45)
  %46 = bitcast %struct.vec3* %col to i8*
  %47 = bitcast %struct.vec3* %2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %46, i8* %47, i64 24, i32 8, i1 false)
  br label %52

; <label>:48                                      ; preds = %40
  %49 = getelementptr inbounds %struct.vec3* %col, i32 0, i32 2
  store double 0.000000e+00, double* %49, align 8
  %50 = getelementptr inbounds %struct.vec3* %col, i32 0, i32 1
  store double 0.000000e+00, double* %50, align 8
  %51 = getelementptr inbounds %struct.vec3* %col, i32 0, i32 0
  store double 0.000000e+00, double* %51, align 8
  br label %52

; <label>:52                                      ; preds = %48, %43
  %53 = bitcast %struct.vec3* %agg.result to i8*
  %54 = bitcast %struct.vec3* %col to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %53, i8* %54, i64 24, i32 8, i1 false)
  br label %55

; <label>:55                                      ; preds = %52, %8
  ret void
}

; Function Attrs: nounwind uwtable
define void @get_primary_ray(%struct.ray* noalias sret %agg.result, i32 %x, i32 %y, i32 %sample) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %ray = alloca %struct.ray, align 8
  %m = alloca [3 x [3 x float]], align 16
  %i = alloca %struct.vec3, align 8
  %j = alloca %struct.vec3, align 8
  %k = alloca %struct.vec3, align 8
  %dir = alloca %struct.vec3, align 8
  %orig = alloca %struct.vec3, align 8
  %foo = alloca %struct.vec3, align 8
  %len = alloca double, align 8
  %4 = alloca %struct.vec3, align 8
  %5 = alloca %struct.vec3, align 8
  %6 = alloca %struct.vec3, align 8
  store i32 %x, i32* %1, align 4
  store i32 %y, i32* %2, align 4
  store i32 %sample, i32* %3, align 4
  %7 = bitcast %struct.vec3* %j to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %7, i8* bitcast (%struct.vec3* @get_primary_ray.j to i8*), i64 24, i32 8, i1 false)
  %8 = load double* getelementptr inbounds (%struct.camera* @cam, i32 0, i32 1, i32 0), align 8
  %9 = load double* getelementptr inbounds (%struct.camera* @cam, i32 0, i32 0, i32 0), align 8
  %10 = fsub double %8, %9
  %11 = getelementptr inbounds %struct.vec3* %k, i32 0, i32 0
  store double %10, double* %11, align 8
  %12 = load double* getelementptr inbounds (%struct.camera* @cam, i32 0, i32 1, i32 1), align 8
  %13 = load double* getelementptr inbounds (%struct.camera* @cam, i32 0, i32 0, i32 1), align 8
  %14 = fsub double %12, %13
  %15 = getelementptr inbounds %struct.vec3* %k, i32 0, i32 1
  store double %14, double* %15, align 8
  %16 = load double* getelementptr inbounds (%struct.camera* @cam, i32 0, i32 1, i32 2), align 8
  %17 = load double* getelementptr inbounds (%struct.camera* @cam, i32 0, i32 0, i32 2), align 8
  %18 = fsub double %16, %17
  %19 = getelementptr inbounds %struct.vec3* %k, i32 0, i32 2
  store double %18, double* %19, align 8
  br label %20

; <label>:20                                      ; preds = %0
  %21 = getelementptr inbounds %struct.vec3* %k, i32 0, i32 0
  %22 = load double* %21, align 8
  %23 = getelementptr inbounds %struct.vec3* %k, i32 0, i32 0
  %24 = load double* %23, align 8
  %25 = fmul double %22, %24
  %26 = getelementptr inbounds %struct.vec3* %k, i32 0, i32 1
  %27 = load double* %26, align 8
  %28 = getelementptr inbounds %struct.vec3* %k, i32 0, i32 1
  %29 = load double* %28, align 8
  %30 = fmul double %27, %29
  %31 = fadd double %25, %30
  %32 = getelementptr inbounds %struct.vec3* %k, i32 0, i32 2
  %33 = load double* %32, align 8
  %34 = getelementptr inbounds %struct.vec3* %k, i32 0, i32 2
  %35 = load double* %34, align 8
  %36 = fmul double %33, %35
  %37 = fadd double %31, %36
  %38 = call double @sqrt(double %37) #5
  store double %38, double* %len, align 8
  %39 = load double* %len, align 8
  %40 = getelementptr inbounds %struct.vec3* %k, i32 0, i32 0
  %41 = load double* %40, align 8
  %42 = fdiv double %41, %39
  store double %42, double* %40, align 8
  %43 = load double* %len, align 8
  %44 = getelementptr inbounds %struct.vec3* %k, i32 0, i32 1
  %45 = load double* %44, align 8
  %46 = fdiv double %45, %43
  store double %46, double* %44, align 8
  %47 = load double* %len, align 8
  %48 = getelementptr inbounds %struct.vec3* %k, i32 0, i32 2
  %49 = load double* %48, align 8
  %50 = fdiv double %49, %47
  store double %50, double* %48, align 8
  br label %51

; <label>:51                                      ; preds = %20
  call void @cross_product(%struct.vec3* sret %4, %struct.vec3* byval align 8 %j, %struct.vec3* byval align 8 %k)
  %52 = bitcast %struct.vec3* %i to i8*
  %53 = bitcast %struct.vec3* %4 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %52, i8* %53, i64 24, i32 8, i1 false)
  call void @cross_product(%struct.vec3* sret %5, %struct.vec3* byval align 8 %k, %struct.vec3* byval align 8 %i)
  %54 = bitcast %struct.vec3* %j to i8*
  %55 = bitcast %struct.vec3* %5 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %54, i8* %55, i64 24, i32 8, i1 false)
  %56 = getelementptr inbounds %struct.vec3* %i, i32 0, i32 0
  %57 = load double* %56, align 8
  %58 = fptrunc double %57 to float
  %59 = getelementptr inbounds [3 x [3 x float]]* %m, i32 0, i64 0
  %60 = getelementptr inbounds [3 x float]* %59, i32 0, i64 0
  store float %58, float* %60, align 4
  %61 = getelementptr inbounds %struct.vec3* %j, i32 0, i32 0
  %62 = load double* %61, align 8
  %63 = fptrunc double %62 to float
  %64 = getelementptr inbounds [3 x [3 x float]]* %m, i32 0, i64 0
  %65 = getelementptr inbounds [3 x float]* %64, i32 0, i64 1
  store float %63, float* %65, align 4
  %66 = getelementptr inbounds %struct.vec3* %k, i32 0, i32 0
  %67 = load double* %66, align 8
  %68 = fptrunc double %67 to float
  %69 = getelementptr inbounds [3 x [3 x float]]* %m, i32 0, i64 0
  %70 = getelementptr inbounds [3 x float]* %69, i32 0, i64 2
  store float %68, float* %70, align 4
  %71 = getelementptr inbounds %struct.vec3* %i, i32 0, i32 1
  %72 = load double* %71, align 8
  %73 = fptrunc double %72 to float
  %74 = getelementptr inbounds [3 x [3 x float]]* %m, i32 0, i64 1
  %75 = getelementptr inbounds [3 x float]* %74, i32 0, i64 0
  store float %73, float* %75, align 4
  %76 = getelementptr inbounds %struct.vec3* %j, i32 0, i32 1
  %77 = load double* %76, align 8
  %78 = fptrunc double %77 to float
  %79 = getelementptr inbounds [3 x [3 x float]]* %m, i32 0, i64 1
  %80 = getelementptr inbounds [3 x float]* %79, i32 0, i64 1
  store float %78, float* %80, align 4
  %81 = getelementptr inbounds %struct.vec3* %k, i32 0, i32 1
  %82 = load double* %81, align 8
  %83 = fptrunc double %82 to float
  %84 = getelementptr inbounds [3 x [3 x float]]* %m, i32 0, i64 1
  %85 = getelementptr inbounds [3 x float]* %84, i32 0, i64 2
  store float %83, float* %85, align 4
  %86 = getelementptr inbounds %struct.vec3* %i, i32 0, i32 2
  %87 = load double* %86, align 8
  %88 = fptrunc double %87 to float
  %89 = getelementptr inbounds [3 x [3 x float]]* %m, i32 0, i64 2
  %90 = getelementptr inbounds [3 x float]* %89, i32 0, i64 0
  store float %88, float* %90, align 4
  %91 = getelementptr inbounds %struct.vec3* %j, i32 0, i32 2
  %92 = load double* %91, align 8
  %93 = fptrunc double %92 to float
  %94 = getelementptr inbounds [3 x [3 x float]]* %m, i32 0, i64 2
  %95 = getelementptr inbounds [3 x float]* %94, i32 0, i64 1
  store float %93, float* %95, align 4
  %96 = getelementptr inbounds %struct.vec3* %k, i32 0, i32 2
  %97 = load double* %96, align 8
  %98 = fptrunc double %97 to float
  %99 = getelementptr inbounds [3 x [3 x float]]* %m, i32 0, i64 2
  %100 = getelementptr inbounds [3 x float]* %99, i32 0, i64 2
  store float %98, float* %100, align 4
  %101 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 0
  %102 = getelementptr inbounds %struct.vec3* %101, i32 0, i32 2
  store double 0.000000e+00, double* %102, align 8
  %103 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 0
  %104 = getelementptr inbounds %struct.vec3* %103, i32 0, i32 1
  store double 0.000000e+00, double* %104, align 8
  %105 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 0
  %106 = getelementptr inbounds %struct.vec3* %105, i32 0, i32 0
  store double 0.000000e+00, double* %106, align 8
  %107 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 1
  %108 = load i32* %1, align 4
  %109 = load i32* %2, align 4
  %110 = load i32* %3, align 4
  call void @get_sample_pos(%struct.vec3* sret %6, i32 %108, i32 %109, i32 %110)
  %111 = bitcast %struct.vec3* %107 to i8*
  %112 = bitcast %struct.vec3* %6 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %111, i8* %112, i64 24, i32 8, i1 false)
  %113 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 1
  %114 = getelementptr inbounds %struct.vec3* %113, i32 0, i32 2
  store double 0x40045F306F4445A0, double* %114, align 8
  %115 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 1
  %116 = getelementptr inbounds %struct.vec3* %115, i32 0, i32 0
  %117 = load double* %116, align 8
  %118 = fmul double %117, 1.000000e+03
  store double %118, double* %116, align 8
  %119 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 1
  %120 = getelementptr inbounds %struct.vec3* %119, i32 0, i32 1
  %121 = load double* %120, align 8
  %122 = fmul double %121, 1.000000e+03
  store double %122, double* %120, align 8
  %123 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 1
  %124 = getelementptr inbounds %struct.vec3* %123, i32 0, i32 2
  %125 = load double* %124, align 8
  %126 = fmul double %125, 1.000000e+03
  store double %126, double* %124, align 8
  %127 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 1
  %128 = getelementptr inbounds %struct.vec3* %127, i32 0, i32 0
  %129 = load double* %128, align 8
  %130 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 0
  %131 = getelementptr inbounds %struct.vec3* %130, i32 0, i32 0
  %132 = load double* %131, align 8
  %133 = fadd double %129, %132
  %134 = getelementptr inbounds %struct.vec3* %dir, i32 0, i32 0
  store double %133, double* %134, align 8
  %135 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 1
  %136 = getelementptr inbounds %struct.vec3* %135, i32 0, i32 1
  %137 = load double* %136, align 8
  %138 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 0
  %139 = getelementptr inbounds %struct.vec3* %138, i32 0, i32 1
  %140 = load double* %139, align 8
  %141 = fadd double %137, %140
  %142 = getelementptr inbounds %struct.vec3* %dir, i32 0, i32 1
  store double %141, double* %142, align 8
  %143 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 1
  %144 = getelementptr inbounds %struct.vec3* %143, i32 0, i32 2
  %145 = load double* %144, align 8
  %146 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 0
  %147 = getelementptr inbounds %struct.vec3* %146, i32 0, i32 2
  %148 = load double* %147, align 8
  %149 = fadd double %145, %148
  %150 = getelementptr inbounds %struct.vec3* %dir, i32 0, i32 2
  store double %149, double* %150, align 8
  %151 = getelementptr inbounds %struct.vec3* %dir, i32 0, i32 0
  %152 = load double* %151, align 8
  %153 = getelementptr inbounds [3 x [3 x float]]* %m, i32 0, i64 0
  %154 = getelementptr inbounds [3 x float]* %153, i32 0, i64 0
  %155 = load float* %154, align 4
  %156 = fpext float %155 to double
  %157 = fmul double %152, %156
  %158 = getelementptr inbounds %struct.vec3* %dir, i32 0, i32 1
  %159 = load double* %158, align 8
  %160 = getelementptr inbounds [3 x [3 x float]]* %m, i32 0, i64 0
  %161 = getelementptr inbounds [3 x float]* %160, i32 0, i64 1
  %162 = load float* %161, align 4
  %163 = fpext float %162 to double
  %164 = fmul double %159, %163
  %165 = fadd double %157, %164
  %166 = getelementptr inbounds %struct.vec3* %dir, i32 0, i32 2
  %167 = load double* %166, align 8
  %168 = getelementptr inbounds [3 x [3 x float]]* %m, i32 0, i64 0
  %169 = getelementptr inbounds [3 x float]* %168, i32 0, i64 2
  %170 = load float* %169, align 4
  %171 = fpext float %170 to double
  %172 = fmul double %167, %171
  %173 = fadd double %165, %172
  %174 = getelementptr inbounds %struct.vec3* %foo, i32 0, i32 0
  store double %173, double* %174, align 8
  %175 = getelementptr inbounds %struct.vec3* %dir, i32 0, i32 0
  %176 = load double* %175, align 8
  %177 = getelementptr inbounds [3 x [3 x float]]* %m, i32 0, i64 1
  %178 = getelementptr inbounds [3 x float]* %177, i32 0, i64 0
  %179 = load float* %178, align 4
  %180 = fpext float %179 to double
  %181 = fmul double %176, %180
  %182 = getelementptr inbounds %struct.vec3* %dir, i32 0, i32 1
  %183 = load double* %182, align 8
  %184 = getelementptr inbounds [3 x [3 x float]]* %m, i32 0, i64 1
  %185 = getelementptr inbounds [3 x float]* %184, i32 0, i64 1
  %186 = load float* %185, align 4
  %187 = fpext float %186 to double
  %188 = fmul double %183, %187
  %189 = fadd double %181, %188
  %190 = getelementptr inbounds %struct.vec3* %dir, i32 0, i32 2
  %191 = load double* %190, align 8
  %192 = getelementptr inbounds [3 x [3 x float]]* %m, i32 0, i64 1
  %193 = getelementptr inbounds [3 x float]* %192, i32 0, i64 2
  %194 = load float* %193, align 4
  %195 = fpext float %194 to double
  %196 = fmul double %191, %195
  %197 = fadd double %189, %196
  %198 = getelementptr inbounds %struct.vec3* %foo, i32 0, i32 1
  store double %197, double* %198, align 8
  %199 = getelementptr inbounds %struct.vec3* %dir, i32 0, i32 0
  %200 = load double* %199, align 8
  %201 = getelementptr inbounds [3 x [3 x float]]* %m, i32 0, i64 2
  %202 = getelementptr inbounds [3 x float]* %201, i32 0, i64 0
  %203 = load float* %202, align 4
  %204 = fpext float %203 to double
  %205 = fmul double %200, %204
  %206 = getelementptr inbounds %struct.vec3* %dir, i32 0, i32 1
  %207 = load double* %206, align 8
  %208 = getelementptr inbounds [3 x [3 x float]]* %m, i32 0, i64 2
  %209 = getelementptr inbounds [3 x float]* %208, i32 0, i64 1
  %210 = load float* %209, align 4
  %211 = fpext float %210 to double
  %212 = fmul double %207, %211
  %213 = fadd double %205, %212
  %214 = getelementptr inbounds %struct.vec3* %dir, i32 0, i32 2
  %215 = load double* %214, align 8
  %216 = getelementptr inbounds [3 x [3 x float]]* %m, i32 0, i64 2
  %217 = getelementptr inbounds [3 x float]* %216, i32 0, i64 2
  %218 = load float* %217, align 4
  %219 = fpext float %218 to double
  %220 = fmul double %215, %219
  %221 = fadd double %213, %220
  %222 = getelementptr inbounds %struct.vec3* %foo, i32 0, i32 2
  store double %221, double* %222, align 8
  %223 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 0
  %224 = getelementptr inbounds %struct.vec3* %223, i32 0, i32 0
  %225 = load double* %224, align 8
  %226 = getelementptr inbounds [3 x [3 x float]]* %m, i32 0, i64 0
  %227 = getelementptr inbounds [3 x float]* %226, i32 0, i64 0
  %228 = load float* %227, align 4
  %229 = fpext float %228 to double
  %230 = fmul double %225, %229
  %231 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 0
  %232 = getelementptr inbounds %struct.vec3* %231, i32 0, i32 1
  %233 = load double* %232, align 8
  %234 = getelementptr inbounds [3 x [3 x float]]* %m, i32 0, i64 0
  %235 = getelementptr inbounds [3 x float]* %234, i32 0, i64 1
  %236 = load float* %235, align 4
  %237 = fpext float %236 to double
  %238 = fmul double %233, %237
  %239 = fadd double %230, %238
  %240 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 0
  %241 = getelementptr inbounds %struct.vec3* %240, i32 0, i32 2
  %242 = load double* %241, align 8
  %243 = getelementptr inbounds [3 x [3 x float]]* %m, i32 0, i64 0
  %244 = getelementptr inbounds [3 x float]* %243, i32 0, i64 2
  %245 = load float* %244, align 4
  %246 = fpext float %245 to double
  %247 = fmul double %242, %246
  %248 = fadd double %239, %247
  %249 = load double* getelementptr inbounds (%struct.camera* @cam, i32 0, i32 0, i32 0), align 8
  %250 = fadd double %248, %249
  %251 = getelementptr inbounds %struct.vec3* %orig, i32 0, i32 0
  store double %250, double* %251, align 8
  %252 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 0
  %253 = getelementptr inbounds %struct.vec3* %252, i32 0, i32 0
  %254 = load double* %253, align 8
  %255 = getelementptr inbounds [3 x [3 x float]]* %m, i32 0, i64 1
  %256 = getelementptr inbounds [3 x float]* %255, i32 0, i64 0
  %257 = load float* %256, align 4
  %258 = fpext float %257 to double
  %259 = fmul double %254, %258
  %260 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 0
  %261 = getelementptr inbounds %struct.vec3* %260, i32 0, i32 1
  %262 = load double* %261, align 8
  %263 = getelementptr inbounds [3 x [3 x float]]* %m, i32 0, i64 1
  %264 = getelementptr inbounds [3 x float]* %263, i32 0, i64 1
  %265 = load float* %264, align 4
  %266 = fpext float %265 to double
  %267 = fmul double %262, %266
  %268 = fadd double %259, %267
  %269 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 0
  %270 = getelementptr inbounds %struct.vec3* %269, i32 0, i32 2
  %271 = load double* %270, align 8
  %272 = getelementptr inbounds [3 x [3 x float]]* %m, i32 0, i64 1
  %273 = getelementptr inbounds [3 x float]* %272, i32 0, i64 2
  %274 = load float* %273, align 4
  %275 = fpext float %274 to double
  %276 = fmul double %271, %275
  %277 = fadd double %268, %276
  %278 = load double* getelementptr inbounds (%struct.camera* @cam, i32 0, i32 0, i32 1), align 8
  %279 = fadd double %277, %278
  %280 = getelementptr inbounds %struct.vec3* %orig, i32 0, i32 1
  store double %279, double* %280, align 8
  %281 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 0
  %282 = getelementptr inbounds %struct.vec3* %281, i32 0, i32 0
  %283 = load double* %282, align 8
  %284 = getelementptr inbounds [3 x [3 x float]]* %m, i32 0, i64 2
  %285 = getelementptr inbounds [3 x float]* %284, i32 0, i64 0
  %286 = load float* %285, align 4
  %287 = fpext float %286 to double
  %288 = fmul double %283, %287
  %289 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 0
  %290 = getelementptr inbounds %struct.vec3* %289, i32 0, i32 1
  %291 = load double* %290, align 8
  %292 = getelementptr inbounds [3 x [3 x float]]* %m, i32 0, i64 2
  %293 = getelementptr inbounds [3 x float]* %292, i32 0, i64 1
  %294 = load float* %293, align 4
  %295 = fpext float %294 to double
  %296 = fmul double %291, %295
  %297 = fadd double %288, %296
  %298 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 0
  %299 = getelementptr inbounds %struct.vec3* %298, i32 0, i32 2
  %300 = load double* %299, align 8
  %301 = getelementptr inbounds [3 x [3 x float]]* %m, i32 0, i64 2
  %302 = getelementptr inbounds [3 x float]* %301, i32 0, i64 2
  %303 = load float* %302, align 4
  %304 = fpext float %303 to double
  %305 = fmul double %300, %304
  %306 = fadd double %297, %305
  %307 = load double* getelementptr inbounds (%struct.camera* @cam, i32 0, i32 0, i32 2), align 8
  %308 = fadd double %306, %307
  %309 = getelementptr inbounds %struct.vec3* %orig, i32 0, i32 2
  store double %308, double* %309, align 8
  %310 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 0
  %311 = bitcast %struct.vec3* %310 to i8*
  %312 = bitcast %struct.vec3* %orig to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %311, i8* %312, i64 24, i32 8, i1 false)
  %313 = getelementptr inbounds %struct.vec3* %foo, i32 0, i32 0
  %314 = load double* %313, align 8
  %315 = getelementptr inbounds %struct.vec3* %orig, i32 0, i32 0
  %316 = load double* %315, align 8
  %317 = fadd double %314, %316
  %318 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 1
  %319 = getelementptr inbounds %struct.vec3* %318, i32 0, i32 0
  store double %317, double* %319, align 8
  %320 = getelementptr inbounds %struct.vec3* %foo, i32 0, i32 1
  %321 = load double* %320, align 8
  %322 = getelementptr inbounds %struct.vec3* %orig, i32 0, i32 1
  %323 = load double* %322, align 8
  %324 = fadd double %321, %323
  %325 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 1
  %326 = getelementptr inbounds %struct.vec3* %325, i32 0, i32 1
  store double %324, double* %326, align 8
  %327 = getelementptr inbounds %struct.vec3* %foo, i32 0, i32 2
  %328 = load double* %327, align 8
  %329 = getelementptr inbounds %struct.vec3* %orig, i32 0, i32 2
  %330 = load double* %329, align 8
  %331 = fadd double %328, %330
  %332 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 1
  %333 = getelementptr inbounds %struct.vec3* %332, i32 0, i32 2
  store double %331, double* %333, align 8
  %334 = bitcast %struct.ray* %agg.result to i8*
  %335 = bitcast %struct.ray* %ray to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %334, i8* %335, i64 48, i32 8, i1 false)
  ret void
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #5

; Function Attrs: nounwind uwtable
define i32 @ray_sphere(%struct.sphere* %sph, %struct.ray* byval align 8 %ray, %struct.spoint* %sp) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.sphere*, align 8
  %3 = alloca %struct.spoint*, align 8
  %a = alloca double, align 8
  %b = alloca double, align 8
  %c = alloca double, align 8
  %d = alloca double, align 8
  %sqrt_d = alloca double, align 8
  %t1 = alloca double, align 8
  %t2 = alloca double, align 8
  %4 = alloca %struct.vec3, align 8
  %len = alloca double, align 8
  store %struct.sphere* %sph, %struct.sphere** %2, align 8
  store %struct.spoint* %sp, %struct.spoint** %3, align 8
  %5 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 1
  %6 = getelementptr inbounds %struct.vec3* %5, i32 0, i32 0
  %7 = load double* %6, align 8
  %8 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 1
  %9 = getelementptr inbounds %struct.vec3* %8, i32 0, i32 0
  %10 = load double* %9, align 8
  %11 = fmul double %7, %10
  %12 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 1
  %13 = getelementptr inbounds %struct.vec3* %12, i32 0, i32 1
  %14 = load double* %13, align 8
  %15 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 1
  %16 = getelementptr inbounds %struct.vec3* %15, i32 0, i32 1
  %17 = load double* %16, align 8
  %18 = fmul double %14, %17
  %19 = fadd double %11, %18
  %20 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 1
  %21 = getelementptr inbounds %struct.vec3* %20, i32 0, i32 2
  %22 = load double* %21, align 8
  %23 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 1
  %24 = getelementptr inbounds %struct.vec3* %23, i32 0, i32 2
  %25 = load double* %24, align 8
  %26 = fmul double %22, %25
  %27 = fadd double %19, %26
  store double %27, double* %a, align 8
  %28 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 1
  %29 = getelementptr inbounds %struct.vec3* %28, i32 0, i32 0
  %30 = load double* %29, align 8
  %31 = fmul double 2.000000e+00, %30
  %32 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 0
  %33 = getelementptr inbounds %struct.vec3* %32, i32 0, i32 0
  %34 = load double* %33, align 8
  %35 = load %struct.sphere** %2, align 8
  %36 = getelementptr inbounds %struct.sphere* %35, i32 0, i32 0
  %37 = getelementptr inbounds %struct.vec3* %36, i32 0, i32 0
  %38 = load double* %37, align 8
  %39 = fsub double %34, %38
  %40 = fmul double %31, %39
  %41 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 1
  %42 = getelementptr inbounds %struct.vec3* %41, i32 0, i32 1
  %43 = load double* %42, align 8
  %44 = fmul double 2.000000e+00, %43
  %45 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 0
  %46 = getelementptr inbounds %struct.vec3* %45, i32 0, i32 1
  %47 = load double* %46, align 8
  %48 = load %struct.sphere** %2, align 8
  %49 = getelementptr inbounds %struct.sphere* %48, i32 0, i32 0
  %50 = getelementptr inbounds %struct.vec3* %49, i32 0, i32 1
  %51 = load double* %50, align 8
  %52 = fsub double %47, %51
  %53 = fmul double %44, %52
  %54 = fadd double %40, %53
  %55 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 1
  %56 = getelementptr inbounds %struct.vec3* %55, i32 0, i32 2
  %57 = load double* %56, align 8
  %58 = fmul double 2.000000e+00, %57
  %59 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 0
  %60 = getelementptr inbounds %struct.vec3* %59, i32 0, i32 2
  %61 = load double* %60, align 8
  %62 = load %struct.sphere** %2, align 8
  %63 = getelementptr inbounds %struct.sphere* %62, i32 0, i32 0
  %64 = getelementptr inbounds %struct.vec3* %63, i32 0, i32 2
  %65 = load double* %64, align 8
  %66 = fsub double %61, %65
  %67 = fmul double %58, %66
  %68 = fadd double %54, %67
  store double %68, double* %b, align 8
  %69 = load %struct.sphere** %2, align 8
  %70 = getelementptr inbounds %struct.sphere* %69, i32 0, i32 0
  %71 = getelementptr inbounds %struct.vec3* %70, i32 0, i32 0
  %72 = load double* %71, align 8
  %73 = load %struct.sphere** %2, align 8
  %74 = getelementptr inbounds %struct.sphere* %73, i32 0, i32 0
  %75 = getelementptr inbounds %struct.vec3* %74, i32 0, i32 0
  %76 = load double* %75, align 8
  %77 = fmul double %72, %76
  %78 = load %struct.sphere** %2, align 8
  %79 = getelementptr inbounds %struct.sphere* %78, i32 0, i32 0
  %80 = getelementptr inbounds %struct.vec3* %79, i32 0, i32 1
  %81 = load double* %80, align 8
  %82 = load %struct.sphere** %2, align 8
  %83 = getelementptr inbounds %struct.sphere* %82, i32 0, i32 0
  %84 = getelementptr inbounds %struct.vec3* %83, i32 0, i32 1
  %85 = load double* %84, align 8
  %86 = fmul double %81, %85
  %87 = fadd double %77, %86
  %88 = load %struct.sphere** %2, align 8
  %89 = getelementptr inbounds %struct.sphere* %88, i32 0, i32 0
  %90 = getelementptr inbounds %struct.vec3* %89, i32 0, i32 2
  %91 = load double* %90, align 8
  %92 = load %struct.sphere** %2, align 8
  %93 = getelementptr inbounds %struct.sphere* %92, i32 0, i32 0
  %94 = getelementptr inbounds %struct.vec3* %93, i32 0, i32 2
  %95 = load double* %94, align 8
  %96 = fmul double %91, %95
  %97 = fadd double %87, %96
  %98 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 0
  %99 = getelementptr inbounds %struct.vec3* %98, i32 0, i32 0
  %100 = load double* %99, align 8
  %101 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 0
  %102 = getelementptr inbounds %struct.vec3* %101, i32 0, i32 0
  %103 = load double* %102, align 8
  %104 = fmul double %100, %103
  %105 = fadd double %97, %104
  %106 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 0
  %107 = getelementptr inbounds %struct.vec3* %106, i32 0, i32 1
  %108 = load double* %107, align 8
  %109 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 0
  %110 = getelementptr inbounds %struct.vec3* %109, i32 0, i32 1
  %111 = load double* %110, align 8
  %112 = fmul double %108, %111
  %113 = fadd double %105, %112
  %114 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 0
  %115 = getelementptr inbounds %struct.vec3* %114, i32 0, i32 2
  %116 = load double* %115, align 8
  %117 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 0
  %118 = getelementptr inbounds %struct.vec3* %117, i32 0, i32 2
  %119 = load double* %118, align 8
  %120 = fmul double %116, %119
  %121 = fadd double %113, %120
  %122 = load %struct.sphere** %2, align 8
  %123 = getelementptr inbounds %struct.sphere* %122, i32 0, i32 0
  %124 = getelementptr inbounds %struct.vec3* %123, i32 0, i32 0
  %125 = load double* %124, align 8
  %126 = fsub double -0.000000e+00, %125
  %127 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 0
  %128 = getelementptr inbounds %struct.vec3* %127, i32 0, i32 0
  %129 = load double* %128, align 8
  %130 = fmul double %126, %129
  %131 = load %struct.sphere** %2, align 8
  %132 = getelementptr inbounds %struct.sphere* %131, i32 0, i32 0
  %133 = getelementptr inbounds %struct.vec3* %132, i32 0, i32 1
  %134 = load double* %133, align 8
  %135 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 0
  %136 = getelementptr inbounds %struct.vec3* %135, i32 0, i32 1
  %137 = load double* %136, align 8
  %138 = fmul double %134, %137
  %139 = fsub double %130, %138
  %140 = load %struct.sphere** %2, align 8
  %141 = getelementptr inbounds %struct.sphere* %140, i32 0, i32 0
  %142 = getelementptr inbounds %struct.vec3* %141, i32 0, i32 2
  %143 = load double* %142, align 8
  %144 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 0
  %145 = getelementptr inbounds %struct.vec3* %144, i32 0, i32 2
  %146 = load double* %145, align 8
  %147 = fmul double %143, %146
  %148 = fsub double %139, %147
  %149 = fmul double 2.000000e+00, %148
  %150 = fadd double %121, %149
  %151 = load %struct.sphere** %2, align 8
  %152 = getelementptr inbounds %struct.sphere* %151, i32 0, i32 1
  %153 = load double* %152, align 8
  %154 = load %struct.sphere** %2, align 8
  %155 = getelementptr inbounds %struct.sphere* %154, i32 0, i32 1
  %156 = load double* %155, align 8
  %157 = fmul double %153, %156
  %158 = fsub double %150, %157
  store double %158, double* %c, align 8
  %159 = load double* %b, align 8
  %160 = load double* %b, align 8
  %161 = fmul double %159, %160
  %162 = load double* %a, align 8
  %163 = fmul double 4.000000e+00, %162
  %164 = load double* %c, align 8
  %165 = fmul double %163, %164
  %166 = fsub double %161, %165
  store double %166, double* %d, align 8
  %167 = fcmp olt double %166, 0.000000e+00
  br i1 %167, label %168, label %169

; <label>:168                                     ; preds = %0
  store i32 0, i32* %1
  br label %371

; <label>:169                                     ; preds = %0
  %170 = load double* %d, align 8
  %171 = call double @sqrt(double %170) #5
  store double %171, double* %sqrt_d, align 8
  %172 = load double* %b, align 8
  %173 = fsub double -0.000000e+00, %172
  %174 = load double* %sqrt_d, align 8
  %175 = fadd double %173, %174
  %176 = load double* %a, align 8
  %177 = fmul double 2.000000e+00, %176
  %178 = fdiv double %175, %177
  store double %178, double* %t1, align 8
  %179 = load double* %b, align 8
  %180 = fsub double -0.000000e+00, %179
  %181 = load double* %sqrt_d, align 8
  %182 = fsub double %180, %181
  %183 = load double* %a, align 8
  %184 = fmul double 2.000000e+00, %183
  %185 = fdiv double %182, %184
  store double %185, double* %t2, align 8
  %186 = load double* %t1, align 8
  %187 = fcmp olt double %186, 1.000000e-06
  br i1 %187, label %188, label %191

; <label>:188                                     ; preds = %169
  %189 = load double* %t2, align 8
  %190 = fcmp olt double %189, 1.000000e-06
  br i1 %190, label %197, label %191

; <label>:191                                     ; preds = %188, %169
  %192 = load double* %t1, align 8
  %193 = fcmp ogt double %192, 1.000000e+00
  br i1 %193, label %194, label %198

; <label>:194                                     ; preds = %191
  %195 = load double* %t2, align 8
  %196 = fcmp ogt double %195, 1.000000e+00
  br i1 %196, label %197, label %198

; <label>:197                                     ; preds = %194, %188
  store i32 0, i32* %1
  br label %371

; <label>:198                                     ; preds = %194, %191
  %199 = load %struct.spoint** %3, align 8
  %200 = icmp ne %struct.spoint* %199, null
  br i1 %200, label %201, label %370

; <label>:201                                     ; preds = %198
  %202 = load double* %t1, align 8
  %203 = fcmp olt double %202, 1.000000e-06
  br i1 %203, label %204, label %206

; <label>:204                                     ; preds = %201
  %205 = load double* %t2, align 8
  store double %205, double* %t1, align 8
  br label %206

; <label>:206                                     ; preds = %204, %201
  %207 = load double* %t2, align 8
  %208 = fcmp olt double %207, 1.000000e-06
  br i1 %208, label %209, label %211

; <label>:209                                     ; preds = %206
  %210 = load double* %t1, align 8
  store double %210, double* %t2, align 8
  br label %211

; <label>:211                                     ; preds = %209, %206
  %212 = load double* %t1, align 8
  %213 = load double* %t2, align 8
  %214 = fcmp olt double %212, %213
  br i1 %214, label %215, label %217

; <label>:215                                     ; preds = %211
  %216 = load double* %t1, align 8
  br label %219

; <label>:217                                     ; preds = %211
  %218 = load double* %t2, align 8
  br label %219

; <label>:219                                     ; preds = %217, %215
  %220 = phi double [ %216, %215 ], [ %218, %217 ]
  %221 = load %struct.spoint** %3, align 8
  %222 = getelementptr inbounds %struct.spoint* %221, i32 0, i32 3
  store double %220, double* %222, align 8
  %223 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 0
  %224 = getelementptr inbounds %struct.vec3* %223, i32 0, i32 0
  %225 = load double* %224, align 8
  %226 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 1
  %227 = getelementptr inbounds %struct.vec3* %226, i32 0, i32 0
  %228 = load double* %227, align 8
  %229 = load %struct.spoint** %3, align 8
  %230 = getelementptr inbounds %struct.spoint* %229, i32 0, i32 3
  %231 = load double* %230, align 8
  %232 = fmul double %228, %231
  %233 = fadd double %225, %232
  %234 = load %struct.spoint** %3, align 8
  %235 = getelementptr inbounds %struct.spoint* %234, i32 0, i32 0
  %236 = getelementptr inbounds %struct.vec3* %235, i32 0, i32 0
  store double %233, double* %236, align 8
  %237 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 0
  %238 = getelementptr inbounds %struct.vec3* %237, i32 0, i32 1
  %239 = load double* %238, align 8
  %240 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 1
  %241 = getelementptr inbounds %struct.vec3* %240, i32 0, i32 1
  %242 = load double* %241, align 8
  %243 = load %struct.spoint** %3, align 8
  %244 = getelementptr inbounds %struct.spoint* %243, i32 0, i32 3
  %245 = load double* %244, align 8
  %246 = fmul double %242, %245
  %247 = fadd double %239, %246
  %248 = load %struct.spoint** %3, align 8
  %249 = getelementptr inbounds %struct.spoint* %248, i32 0, i32 0
  %250 = getelementptr inbounds %struct.vec3* %249, i32 0, i32 1
  store double %247, double* %250, align 8
  %251 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 0
  %252 = getelementptr inbounds %struct.vec3* %251, i32 0, i32 2
  %253 = load double* %252, align 8
  %254 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 1
  %255 = getelementptr inbounds %struct.vec3* %254, i32 0, i32 2
  %256 = load double* %255, align 8
  %257 = load %struct.spoint** %3, align 8
  %258 = getelementptr inbounds %struct.spoint* %257, i32 0, i32 3
  %259 = load double* %258, align 8
  %260 = fmul double %256, %259
  %261 = fadd double %253, %260
  %262 = load %struct.spoint** %3, align 8
  %263 = getelementptr inbounds %struct.spoint* %262, i32 0, i32 0
  %264 = getelementptr inbounds %struct.vec3* %263, i32 0, i32 2
  store double %261, double* %264, align 8
  %265 = load %struct.spoint** %3, align 8
  %266 = getelementptr inbounds %struct.spoint* %265, i32 0, i32 0
  %267 = getelementptr inbounds %struct.vec3* %266, i32 0, i32 0
  %268 = load double* %267, align 8
  %269 = load %struct.sphere** %2, align 8
  %270 = getelementptr inbounds %struct.sphere* %269, i32 0, i32 0
  %271 = getelementptr inbounds %struct.vec3* %270, i32 0, i32 0
  %272 = load double* %271, align 8
  %273 = fsub double %268, %272
  %274 = load %struct.sphere** %2, align 8
  %275 = getelementptr inbounds %struct.sphere* %274, i32 0, i32 1
  %276 = load double* %275, align 8
  %277 = fdiv double %273, %276
  %278 = load %struct.spoint** %3, align 8
  %279 = getelementptr inbounds %struct.spoint* %278, i32 0, i32 1
  %280 = getelementptr inbounds %struct.vec3* %279, i32 0, i32 0
  store double %277, double* %280, align 8
  %281 = load %struct.spoint** %3, align 8
  %282 = getelementptr inbounds %struct.spoint* %281, i32 0, i32 0
  %283 = getelementptr inbounds %struct.vec3* %282, i32 0, i32 1
  %284 = load double* %283, align 8
  %285 = load %struct.sphere** %2, align 8
  %286 = getelementptr inbounds %struct.sphere* %285, i32 0, i32 0
  %287 = getelementptr inbounds %struct.vec3* %286, i32 0, i32 1
  %288 = load double* %287, align 8
  %289 = fsub double %284, %288
  %290 = load %struct.sphere** %2, align 8
  %291 = getelementptr inbounds %struct.sphere* %290, i32 0, i32 1
  %292 = load double* %291, align 8
  %293 = fdiv double %289, %292
  %294 = load %struct.spoint** %3, align 8
  %295 = getelementptr inbounds %struct.spoint* %294, i32 0, i32 1
  %296 = getelementptr inbounds %struct.vec3* %295, i32 0, i32 1
  store double %293, double* %296, align 8
  %297 = load %struct.spoint** %3, align 8
  %298 = getelementptr inbounds %struct.spoint* %297, i32 0, i32 0
  %299 = getelementptr inbounds %struct.vec3* %298, i32 0, i32 2
  %300 = load double* %299, align 8
  %301 = load %struct.sphere** %2, align 8
  %302 = getelementptr inbounds %struct.sphere* %301, i32 0, i32 0
  %303 = getelementptr inbounds %struct.vec3* %302, i32 0, i32 2
  %304 = load double* %303, align 8
  %305 = fsub double %300, %304
  %306 = load %struct.sphere** %2, align 8
  %307 = getelementptr inbounds %struct.sphere* %306, i32 0, i32 1
  %308 = load double* %307, align 8
  %309 = fdiv double %305, %308
  %310 = load %struct.spoint** %3, align 8
  %311 = getelementptr inbounds %struct.spoint* %310, i32 0, i32 1
  %312 = getelementptr inbounds %struct.vec3* %311, i32 0, i32 2
  store double %309, double* %312, align 8
  %313 = load %struct.spoint** %3, align 8
  %314 = getelementptr inbounds %struct.spoint* %313, i32 0, i32 2
  %315 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 1
  %316 = load %struct.spoint** %3, align 8
  %317 = getelementptr inbounds %struct.spoint* %316, i32 0, i32 1
  call void @reflect(%struct.vec3* sret %4, %struct.vec3* byval align 8 %315, %struct.vec3* byval align 8 %317)
  %318 = bitcast %struct.vec3* %314 to i8*
  %319 = bitcast %struct.vec3* %4 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %318, i8* %319, i64 24, i32 8, i1 false)
  br label %320

; <label>:320                                     ; preds = %219
  %321 = load %struct.spoint** %3, align 8
  %322 = getelementptr inbounds %struct.spoint* %321, i32 0, i32 2
  %323 = getelementptr inbounds %struct.vec3* %322, i32 0, i32 0
  %324 = load double* %323, align 8
  %325 = load %struct.spoint** %3, align 8
  %326 = getelementptr inbounds %struct.spoint* %325, i32 0, i32 2
  %327 = getelementptr inbounds %struct.vec3* %326, i32 0, i32 0
  %328 = load double* %327, align 8
  %329 = fmul double %324, %328
  %330 = load %struct.spoint** %3, align 8
  %331 = getelementptr inbounds %struct.spoint* %330, i32 0, i32 2
  %332 = getelementptr inbounds %struct.vec3* %331, i32 0, i32 1
  %333 = load double* %332, align 8
  %334 = load %struct.spoint** %3, align 8
  %335 = getelementptr inbounds %struct.spoint* %334, i32 0, i32 2
  %336 = getelementptr inbounds %struct.vec3* %335, i32 0, i32 1
  %337 = load double* %336, align 8
  %338 = fmul double %333, %337
  %339 = fadd double %329, %338
  %340 = load %struct.spoint** %3, align 8
  %341 = getelementptr inbounds %struct.spoint* %340, i32 0, i32 2
  %342 = getelementptr inbounds %struct.vec3* %341, i32 0, i32 2
  %343 = load double* %342, align 8
  %344 = load %struct.spoint** %3, align 8
  %345 = getelementptr inbounds %struct.spoint* %344, i32 0, i32 2
  %346 = getelementptr inbounds %struct.vec3* %345, i32 0, i32 2
  %347 = load double* %346, align 8
  %348 = fmul double %343, %347
  %349 = fadd double %339, %348
  %350 = call double @sqrt(double %349) #5
  store double %350, double* %len, align 8
  %351 = load double* %len, align 8
  %352 = load %struct.spoint** %3, align 8
  %353 = getelementptr inbounds %struct.spoint* %352, i32 0, i32 2
  %354 = getelementptr inbounds %struct.vec3* %353, i32 0, i32 0
  %355 = load double* %354, align 8
  %356 = fdiv double %355, %351
  store double %356, double* %354, align 8
  %357 = load double* %len, align 8
  %358 = load %struct.spoint** %3, align 8
  %359 = getelementptr inbounds %struct.spoint* %358, i32 0, i32 2
  %360 = getelementptr inbounds %struct.vec3* %359, i32 0, i32 1
  %361 = load double* %360, align 8
  %362 = fdiv double %361, %357
  store double %362, double* %360, align 8
  %363 = load double* %len, align 8
  %364 = load %struct.spoint** %3, align 8
  %365 = getelementptr inbounds %struct.spoint* %364, i32 0, i32 2
  %366 = getelementptr inbounds %struct.vec3* %365, i32 0, i32 2
  %367 = load double* %366, align 8
  %368 = fdiv double %367, %363
  store double %368, double* %366, align 8
  br label %369

; <label>:369                                     ; preds = %320
  br label %370

; <label>:370                                     ; preds = %369, %198
  store i32 1, i32* %1
  br label %371

; <label>:371                                     ; preds = %370, %197, %168
  %372 = load i32* %1
  ret i32 %372
}

; Function Attrs: nounwind uwtable
define void @shade(%struct.vec3* noalias sret %agg.result, %struct.sphere* %obj, %struct.spoint* %sp, i32 %depth) #0 {
  %1 = alloca %struct.sphere*, align 8
  %2 = alloca %struct.spoint*, align 8
  %3 = alloca i32, align 4
  %i = alloca i32, align 4
  %col = alloca %struct.vec3, align 8
  %ispec = alloca double, align 8
  %idiff = alloca double, align 8
  %ldir = alloca %struct.vec3, align 8
  %shadow_ray = alloca %struct.ray, align 8
  %iter = alloca %struct.sphere*, align 8
  %in_shadow = alloca i32, align 4
  %len = alloca double, align 8
  %ray = alloca %struct.ray, align 8
  %rcol = alloca %struct.vec3, align 8
  %4 = alloca %struct.vec3, align 8
  store %struct.sphere* %obj, %struct.sphere** %1, align 8
  store %struct.spoint* %sp, %struct.spoint** %2, align 8
  store i32 %depth, i32* %3, align 4
  %5 = bitcast %struct.vec3* %col to i8*
  call void @llvm.memset.p0i8.i64(i8* %5, i8 0, i64 24, i32 8, i1 false)
  store i32 0, i32* %i, align 4
  br label %6

; <label>:6                                       ; preds = %256, %0
  %7 = load i32* %i, align 4
  %8 = load i32* @lnum, align 4
  %9 = icmp slt i32 %7, %8
  br i1 %9, label %10, label %259

; <label>:10                                      ; preds = %6
  %11 = load %struct.sphere** @obj_list, align 8
  %12 = getelementptr inbounds %struct.sphere* %11, i32 0, i32 3
  %13 = load %struct.sphere** %12, align 8
  store %struct.sphere* %13, %struct.sphere** %iter, align 8
  store i32 0, i32* %in_shadow, align 4
  %14 = load i32* %i, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [16 x %struct.vec3]* @lights, i32 0, i64 %15
  %17 = getelementptr inbounds %struct.vec3* %16, i32 0, i32 0
  %18 = load double* %17, align 8
  %19 = load %struct.spoint** %2, align 8
  %20 = getelementptr inbounds %struct.spoint* %19, i32 0, i32 0
  %21 = getelementptr inbounds %struct.vec3* %20, i32 0, i32 0
  %22 = load double* %21, align 8
  %23 = fsub double %18, %22
  %24 = getelementptr inbounds %struct.vec3* %ldir, i32 0, i32 0
  store double %23, double* %24, align 8
  %25 = load i32* %i, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds [16 x %struct.vec3]* @lights, i32 0, i64 %26
  %28 = getelementptr inbounds %struct.vec3* %27, i32 0, i32 1
  %29 = load double* %28, align 8
  %30 = load %struct.spoint** %2, align 8
  %31 = getelementptr inbounds %struct.spoint* %30, i32 0, i32 0
  %32 = getelementptr inbounds %struct.vec3* %31, i32 0, i32 1
  %33 = load double* %32, align 8
  %34 = fsub double %29, %33
  %35 = getelementptr inbounds %struct.vec3* %ldir, i32 0, i32 1
  store double %34, double* %35, align 8
  %36 = load i32* %i, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds [16 x %struct.vec3]* @lights, i32 0, i64 %37
  %39 = getelementptr inbounds %struct.vec3* %38, i32 0, i32 2
  %40 = load double* %39, align 8
  %41 = load %struct.spoint** %2, align 8
  %42 = getelementptr inbounds %struct.spoint* %41, i32 0, i32 0
  %43 = getelementptr inbounds %struct.vec3* %42, i32 0, i32 2
  %44 = load double* %43, align 8
  %45 = fsub double %40, %44
  %46 = getelementptr inbounds %struct.vec3* %ldir, i32 0, i32 2
  store double %45, double* %46, align 8
  %47 = getelementptr inbounds %struct.ray* %shadow_ray, i32 0, i32 0
  %48 = load %struct.spoint** %2, align 8
  %49 = getelementptr inbounds %struct.spoint* %48, i32 0, i32 0
  %50 = bitcast %struct.vec3* %47 to i8*
  %51 = bitcast %struct.vec3* %49 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %50, i8* %51, i64 24, i32 8, i1 false)
  %52 = getelementptr inbounds %struct.ray* %shadow_ray, i32 0, i32 1
  %53 = bitcast %struct.vec3* %52 to i8*
  %54 = bitcast %struct.vec3* %ldir to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %53, i8* %54, i64 24, i32 8, i1 false)
  br label %55

; <label>:55                                      ; preds = %63, %10
  %56 = load %struct.sphere** %iter, align 8
  %57 = icmp ne %struct.sphere* %56, null
  br i1 %57, label %58, label %67

; <label>:58                                      ; preds = %55
  %59 = load %struct.sphere** %iter, align 8
  %60 = call i32 @ray_sphere(%struct.sphere* %59, %struct.ray* byval align 8 %shadow_ray, %struct.spoint* null)
  %61 = icmp ne i32 %60, 0
  br i1 %61, label %62, label %63

; <label>:62                                      ; preds = %58
  store i32 1, i32* %in_shadow, align 4
  br label %67

; <label>:63                                      ; preds = %58
  %64 = load %struct.sphere** %iter, align 8
  %65 = getelementptr inbounds %struct.sphere* %64, i32 0, i32 3
  %66 = load %struct.sphere** %65, align 8
  store %struct.sphere* %66, %struct.sphere** %iter, align 8
  br label %55

; <label>:67                                      ; preds = %62, %55
  %68 = load i32* %in_shadow, align 4
  %69 = icmp ne i32 %68, 0
  br i1 %69, label %255, label %70

; <label>:70                                      ; preds = %67
  br label %71

; <label>:71                                      ; preds = %70
  %72 = getelementptr inbounds %struct.vec3* %ldir, i32 0, i32 0
  %73 = load double* %72, align 8
  %74 = getelementptr inbounds %struct.vec3* %ldir, i32 0, i32 0
  %75 = load double* %74, align 8
  %76 = fmul double %73, %75
  %77 = getelementptr inbounds %struct.vec3* %ldir, i32 0, i32 1
  %78 = load double* %77, align 8
  %79 = getelementptr inbounds %struct.vec3* %ldir, i32 0, i32 1
  %80 = load double* %79, align 8
  %81 = fmul double %78, %80
  %82 = fadd double %76, %81
  %83 = getelementptr inbounds %struct.vec3* %ldir, i32 0, i32 2
  %84 = load double* %83, align 8
  %85 = getelementptr inbounds %struct.vec3* %ldir, i32 0, i32 2
  %86 = load double* %85, align 8
  %87 = fmul double %84, %86
  %88 = fadd double %82, %87
  %89 = call double @sqrt(double %88) #5
  store double %89, double* %len, align 8
  %90 = load double* %len, align 8
  %91 = getelementptr inbounds %struct.vec3* %ldir, i32 0, i32 0
  %92 = load double* %91, align 8
  %93 = fdiv double %92, %90
  store double %93, double* %91, align 8
  %94 = load double* %len, align 8
  %95 = getelementptr inbounds %struct.vec3* %ldir, i32 0, i32 1
  %96 = load double* %95, align 8
  %97 = fdiv double %96, %94
  store double %97, double* %95, align 8
  %98 = load double* %len, align 8
  %99 = getelementptr inbounds %struct.vec3* %ldir, i32 0, i32 2
  %100 = load double* %99, align 8
  %101 = fdiv double %100, %98
  store double %101, double* %99, align 8
  br label %102

; <label>:102                                     ; preds = %71
  %103 = load %struct.spoint** %2, align 8
  %104 = getelementptr inbounds %struct.spoint* %103, i32 0, i32 1
  %105 = getelementptr inbounds %struct.vec3* %104, i32 0, i32 0
  %106 = load double* %105, align 8
  %107 = getelementptr inbounds %struct.vec3* %ldir, i32 0, i32 0
  %108 = load double* %107, align 8
  %109 = fmul double %106, %108
  %110 = load %struct.spoint** %2, align 8
  %111 = getelementptr inbounds %struct.spoint* %110, i32 0, i32 1
  %112 = getelementptr inbounds %struct.vec3* %111, i32 0, i32 1
  %113 = load double* %112, align 8
  %114 = getelementptr inbounds %struct.vec3* %ldir, i32 0, i32 1
  %115 = load double* %114, align 8
  %116 = fmul double %113, %115
  %117 = fadd double %109, %116
  %118 = load %struct.spoint** %2, align 8
  %119 = getelementptr inbounds %struct.spoint* %118, i32 0, i32 1
  %120 = getelementptr inbounds %struct.vec3* %119, i32 0, i32 2
  %121 = load double* %120, align 8
  %122 = getelementptr inbounds %struct.vec3* %ldir, i32 0, i32 2
  %123 = load double* %122, align 8
  %124 = fmul double %121, %123
  %125 = fadd double %117, %124
  %126 = fcmp ogt double %125, 0.000000e+00
  br i1 %126, label %127, label %151

; <label>:127                                     ; preds = %102
  %128 = load %struct.spoint** %2, align 8
  %129 = getelementptr inbounds %struct.spoint* %128, i32 0, i32 1
  %130 = getelementptr inbounds %struct.vec3* %129, i32 0, i32 0
  %131 = load double* %130, align 8
  %132 = getelementptr inbounds %struct.vec3* %ldir, i32 0, i32 0
  %133 = load double* %132, align 8
  %134 = fmul double %131, %133
  %135 = load %struct.spoint** %2, align 8
  %136 = getelementptr inbounds %struct.spoint* %135, i32 0, i32 1
  %137 = getelementptr inbounds %struct.vec3* %136, i32 0, i32 1
  %138 = load double* %137, align 8
  %139 = getelementptr inbounds %struct.vec3* %ldir, i32 0, i32 1
  %140 = load double* %139, align 8
  %141 = fmul double %138, %140
  %142 = fadd double %134, %141
  %143 = load %struct.spoint** %2, align 8
  %144 = getelementptr inbounds %struct.spoint* %143, i32 0, i32 1
  %145 = getelementptr inbounds %struct.vec3* %144, i32 0, i32 2
  %146 = load double* %145, align 8
  %147 = getelementptr inbounds %struct.vec3* %ldir, i32 0, i32 2
  %148 = load double* %147, align 8
  %149 = fmul double %146, %148
  %150 = fadd double %142, %149
  br label %152

; <label>:151                                     ; preds = %102
  br label %152

; <label>:152                                     ; preds = %151, %127
  %153 = phi double [ %150, %127 ], [ 0.000000e+00, %151 ]
  store double %153, double* %idiff, align 8
  %154 = load %struct.sphere** %1, align 8
  %155 = getelementptr inbounds %struct.sphere* %154, i32 0, i32 2
  %156 = getelementptr inbounds %struct.material* %155, i32 0, i32 1
  %157 = load double* %156, align 8
  %158 = fcmp ogt double %157, 0.000000e+00
  br i1 %158, label %159, label %216

; <label>:159                                     ; preds = %152
  %160 = load %struct.spoint** %2, align 8
  %161 = getelementptr inbounds %struct.spoint* %160, i32 0, i32 2
  %162 = getelementptr inbounds %struct.vec3* %161, i32 0, i32 0
  %163 = load double* %162, align 8
  %164 = getelementptr inbounds %struct.vec3* %ldir, i32 0, i32 0
  %165 = load double* %164, align 8
  %166 = fmul double %163, %165
  %167 = load %struct.spoint** %2, align 8
  %168 = getelementptr inbounds %struct.spoint* %167, i32 0, i32 2
  %169 = getelementptr inbounds %struct.vec3* %168, i32 0, i32 1
  %170 = load double* %169, align 8
  %171 = getelementptr inbounds %struct.vec3* %ldir, i32 0, i32 1
  %172 = load double* %171, align 8
  %173 = fmul double %170, %172
  %174 = fadd double %166, %173
  %175 = load %struct.spoint** %2, align 8
  %176 = getelementptr inbounds %struct.spoint* %175, i32 0, i32 2
  %177 = getelementptr inbounds %struct.vec3* %176, i32 0, i32 2
  %178 = load double* %177, align 8
  %179 = getelementptr inbounds %struct.vec3* %ldir, i32 0, i32 2
  %180 = load double* %179, align 8
  %181 = fmul double %178, %180
  %182 = fadd double %174, %181
  %183 = fcmp ogt double %182, 0.000000e+00
  br i1 %183, label %184, label %208

; <label>:184                                     ; preds = %159
  %185 = load %struct.spoint** %2, align 8
  %186 = getelementptr inbounds %struct.spoint* %185, i32 0, i32 2
  %187 = getelementptr inbounds %struct.vec3* %186, i32 0, i32 0
  %188 = load double* %187, align 8
  %189 = getelementptr inbounds %struct.vec3* %ldir, i32 0, i32 0
  %190 = load double* %189, align 8
  %191 = fmul double %188, %190
  %192 = load %struct.spoint** %2, align 8
  %193 = getelementptr inbounds %struct.spoint* %192, i32 0, i32 2
  %194 = getelementptr inbounds %struct.vec3* %193, i32 0, i32 1
  %195 = load double* %194, align 8
  %196 = getelementptr inbounds %struct.vec3* %ldir, i32 0, i32 1
  %197 = load double* %196, align 8
  %198 = fmul double %195, %197
  %199 = fadd double %191, %198
  %200 = load %struct.spoint** %2, align 8
  %201 = getelementptr inbounds %struct.spoint* %200, i32 0, i32 2
  %202 = getelementptr inbounds %struct.vec3* %201, i32 0, i32 2
  %203 = load double* %202, align 8
  %204 = getelementptr inbounds %struct.vec3* %ldir, i32 0, i32 2
  %205 = load double* %204, align 8
  %206 = fmul double %203, %205
  %207 = fadd double %199, %206
  br label %209

; <label>:208                                     ; preds = %159
  br label %209

; <label>:209                                     ; preds = %208, %184
  %210 = phi double [ %207, %184 ], [ 0.000000e+00, %208 ]
  %211 = load %struct.sphere** %1, align 8
  %212 = getelementptr inbounds %struct.sphere* %211, i32 0, i32 2
  %213 = getelementptr inbounds %struct.material* %212, i32 0, i32 1
  %214 = load double* %213, align 8
  %215 = call double @pow(double %210, double %214) #5
  br label %217

; <label>:216                                     ; preds = %152
  br label %217

; <label>:217                                     ; preds = %216, %209
  %218 = phi double [ %215, %209 ], [ 0.000000e+00, %216 ]
  store double %218, double* %ispec, align 8
  %219 = load double* %idiff, align 8
  %220 = load %struct.sphere** %1, align 8
  %221 = getelementptr inbounds %struct.sphere* %220, i32 0, i32 2
  %222 = getelementptr inbounds %struct.material* %221, i32 0, i32 0
  %223 = getelementptr inbounds %struct.vec3* %222, i32 0, i32 0
  %224 = load double* %223, align 8
  %225 = fmul double %219, %224
  %226 = load double* %ispec, align 8
  %227 = fadd double %225, %226
  %228 = getelementptr inbounds %struct.vec3* %col, i32 0, i32 0
  %229 = load double* %228, align 8
  %230 = fadd double %229, %227
  store double %230, double* %228, align 8
  %231 = load double* %idiff, align 8
  %232 = load %struct.sphere** %1, align 8
  %233 = getelementptr inbounds %struct.sphere* %232, i32 0, i32 2
  %234 = getelementptr inbounds %struct.material* %233, i32 0, i32 0
  %235 = getelementptr inbounds %struct.vec3* %234, i32 0, i32 1
  %236 = load double* %235, align 8
  %237 = fmul double %231, %236
  %238 = load double* %ispec, align 8
  %239 = fadd double %237, %238
  %240 = getelementptr inbounds %struct.vec3* %col, i32 0, i32 1
  %241 = load double* %240, align 8
  %242 = fadd double %241, %239
  store double %242, double* %240, align 8
  %243 = load double* %idiff, align 8
  %244 = load %struct.sphere** %1, align 8
  %245 = getelementptr inbounds %struct.sphere* %244, i32 0, i32 2
  %246 = getelementptr inbounds %struct.material* %245, i32 0, i32 0
  %247 = getelementptr inbounds %struct.vec3* %246, i32 0, i32 2
  %248 = load double* %247, align 8
  %249 = fmul double %243, %248
  %250 = load double* %ispec, align 8
  %251 = fadd double %249, %250
  %252 = getelementptr inbounds %struct.vec3* %col, i32 0, i32 2
  %253 = load double* %252, align 8
  %254 = fadd double %253, %251
  store double %254, double* %252, align 8
  br label %255

; <label>:255                                     ; preds = %217, %67
  br label %256

; <label>:256                                     ; preds = %255
  %257 = load i32* %i, align 4
  %258 = add nsw i32 %257, 1
  store i32 %258, i32* %i, align 4
  br label %6

; <label>:259                                     ; preds = %6
  %260 = load %struct.sphere** %1, align 8
  %261 = getelementptr inbounds %struct.sphere* %260, i32 0, i32 2
  %262 = getelementptr inbounds %struct.material* %261, i32 0, i32 2
  %263 = load double* %262, align 8
  %264 = fcmp ogt double %263, 0.000000e+00
  br i1 %264, label %265, label %322

; <label>:265                                     ; preds = %259
  %266 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 0
  %267 = load %struct.spoint** %2, align 8
  %268 = getelementptr inbounds %struct.spoint* %267, i32 0, i32 0
  %269 = bitcast %struct.vec3* %266 to i8*
  %270 = bitcast %struct.vec3* %268 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %269, i8* %270, i64 24, i32 8, i1 false)
  %271 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 1
  %272 = load %struct.spoint** %2, align 8
  %273 = getelementptr inbounds %struct.spoint* %272, i32 0, i32 2
  %274 = bitcast %struct.vec3* %271 to i8*
  %275 = bitcast %struct.vec3* %273 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %274, i8* %275, i64 24, i32 8, i1 false)
  %276 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 1
  %277 = getelementptr inbounds %struct.vec3* %276, i32 0, i32 0
  %278 = load double* %277, align 8
  %279 = fmul double %278, 1.000000e+03
  store double %279, double* %277, align 8
  %280 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 1
  %281 = getelementptr inbounds %struct.vec3* %280, i32 0, i32 1
  %282 = load double* %281, align 8
  %283 = fmul double %282, 1.000000e+03
  store double %283, double* %281, align 8
  %284 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 1
  %285 = getelementptr inbounds %struct.vec3* %284, i32 0, i32 2
  %286 = load double* %285, align 8
  %287 = fmul double %286, 1.000000e+03
  store double %287, double* %285, align 8
  %288 = load i32* %3, align 4
  %289 = add nsw i32 %288, 1
  call void @trace(%struct.vec3* sret %4, %struct.ray* byval align 8 %ray, i32 %289)
  %290 = bitcast %struct.vec3* %rcol to i8*
  %291 = bitcast %struct.vec3* %4 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %290, i8* %291, i64 24, i32 8, i1 false)
  %292 = getelementptr inbounds %struct.vec3* %rcol, i32 0, i32 0
  %293 = load double* %292, align 8
  %294 = load %struct.sphere** %1, align 8
  %295 = getelementptr inbounds %struct.sphere* %294, i32 0, i32 2
  %296 = getelementptr inbounds %struct.material* %295, i32 0, i32 2
  %297 = load double* %296, align 8
  %298 = fmul double %293, %297
  %299 = getelementptr inbounds %struct.vec3* %col, i32 0, i32 0
  %300 = load double* %299, align 8
  %301 = fadd double %300, %298
  store double %301, double* %299, align 8
  %302 = getelementptr inbounds %struct.vec3* %rcol, i32 0, i32 1
  %303 = load double* %302, align 8
  %304 = load %struct.sphere** %1, align 8
  %305 = getelementptr inbounds %struct.sphere* %304, i32 0, i32 2
  %306 = getelementptr inbounds %struct.material* %305, i32 0, i32 2
  %307 = load double* %306, align 8
  %308 = fmul double %303, %307
  %309 = getelementptr inbounds %struct.vec3* %col, i32 0, i32 1
  %310 = load double* %309, align 8
  %311 = fadd double %310, %308
  store double %311, double* %309, align 8
  %312 = getelementptr inbounds %struct.vec3* %rcol, i32 0, i32 2
  %313 = load double* %312, align 8
  %314 = load %struct.sphere** %1, align 8
  %315 = getelementptr inbounds %struct.sphere* %314, i32 0, i32 2
  %316 = getelementptr inbounds %struct.material* %315, i32 0, i32 2
  %317 = load double* %316, align 8
  %318 = fmul double %313, %317
  %319 = getelementptr inbounds %struct.vec3* %col, i32 0, i32 2
  %320 = load double* %319, align 8
  %321 = fadd double %320, %318
  store double %321, double* %319, align 8
  br label %322

; <label>:322                                     ; preds = %265, %259
  %323 = bitcast %struct.vec3* %agg.result to i8*
  %324 = bitcast %struct.vec3* %col to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %323, i8* %324, i64 24, i32 8, i1 false)
  ret void
}

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #5

; Function Attrs: nounwind
declare double @sqrt(double) #4

; Function Attrs: nounwind
declare double @pow(double, double) #4

; Function Attrs: nounwind uwtable
define void @reflect(%struct.vec3* noalias sret %agg.result, %struct.vec3* byval align 8 %v, %struct.vec3* byval align 8 %n) #0 {
  %res = alloca %struct.vec3, align 8
  %dot = alloca double, align 8
  %1 = getelementptr inbounds %struct.vec3* %v, i32 0, i32 0
  %2 = load double* %1, align 8
  %3 = getelementptr inbounds %struct.vec3* %n, i32 0, i32 0
  %4 = load double* %3, align 8
  %5 = fmul double %2, %4
  %6 = getelementptr inbounds %struct.vec3* %v, i32 0, i32 1
  %7 = load double* %6, align 8
  %8 = getelementptr inbounds %struct.vec3* %n, i32 0, i32 1
  %9 = load double* %8, align 8
  %10 = fmul double %7, %9
  %11 = fadd double %5, %10
  %12 = getelementptr inbounds %struct.vec3* %v, i32 0, i32 2
  %13 = load double* %12, align 8
  %14 = getelementptr inbounds %struct.vec3* %n, i32 0, i32 2
  %15 = load double* %14, align 8
  %16 = fmul double %13, %15
  %17 = fadd double %11, %16
  store double %17, double* %dot, align 8
  %18 = load double* %dot, align 8
  %19 = fmul double 2.000000e+00, %18
  %20 = getelementptr inbounds %struct.vec3* %n, i32 0, i32 0
  %21 = load double* %20, align 8
  %22 = fmul double %19, %21
  %23 = getelementptr inbounds %struct.vec3* %v, i32 0, i32 0
  %24 = load double* %23, align 8
  %25 = fsub double %22, %24
  %26 = fsub double -0.000000e+00, %25
  %27 = getelementptr inbounds %struct.vec3* %res, i32 0, i32 0
  store double %26, double* %27, align 8
  %28 = load double* %dot, align 8
  %29 = fmul double 2.000000e+00, %28
  %30 = getelementptr inbounds %struct.vec3* %n, i32 0, i32 1
  %31 = load double* %30, align 8
  %32 = fmul double %29, %31
  %33 = getelementptr inbounds %struct.vec3* %v, i32 0, i32 1
  %34 = load double* %33, align 8
  %35 = fsub double %32, %34
  %36 = fsub double -0.000000e+00, %35
  %37 = getelementptr inbounds %struct.vec3* %res, i32 0, i32 1
  store double %36, double* %37, align 8
  %38 = load double* %dot, align 8
  %39 = fmul double 2.000000e+00, %38
  %40 = getelementptr inbounds %struct.vec3* %n, i32 0, i32 2
  %41 = load double* %40, align 8
  %42 = fmul double %39, %41
  %43 = getelementptr inbounds %struct.vec3* %v, i32 0, i32 2
  %44 = load double* %43, align 8
  %45 = fsub double %42, %44
  %46 = fsub double -0.000000e+00, %45
  %47 = getelementptr inbounds %struct.vec3* %res, i32 0, i32 2
  store double %46, double* %47, align 8
  %48 = bitcast %struct.vec3* %agg.result to i8*
  %49 = bitcast %struct.vec3* %res to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %48, i8* %49, i64 24, i32 8, i1 false)
  ret void
}

; Function Attrs: nounwind uwtable
define void @cross_product(%struct.vec3* noalias sret %agg.result, %struct.vec3* byval align 8 %v1, %struct.vec3* byval align 8 %v2) #0 {
  %res = alloca %struct.vec3, align 8
  %1 = getelementptr inbounds %struct.vec3* %v1, i32 0, i32 1
  %2 = load double* %1, align 8
  %3 = getelementptr inbounds %struct.vec3* %v2, i32 0, i32 2
  %4 = load double* %3, align 8
  %5 = fmul double %2, %4
  %6 = getelementptr inbounds %struct.vec3* %v1, i32 0, i32 2
  %7 = load double* %6, align 8
  %8 = getelementptr inbounds %struct.vec3* %v2, i32 0, i32 1
  %9 = load double* %8, align 8
  %10 = fmul double %7, %9
  %11 = fsub double %5, %10
  %12 = getelementptr inbounds %struct.vec3* %res, i32 0, i32 0
  store double %11, double* %12, align 8
  %13 = getelementptr inbounds %struct.vec3* %v1, i32 0, i32 2
  %14 = load double* %13, align 8
  %15 = getelementptr inbounds %struct.vec3* %v2, i32 0, i32 0
  %16 = load double* %15, align 8
  %17 = fmul double %14, %16
  %18 = getelementptr inbounds %struct.vec3* %v1, i32 0, i32 0
  %19 = load double* %18, align 8
  %20 = getelementptr inbounds %struct.vec3* %v2, i32 0, i32 2
  %21 = load double* %20, align 8
  %22 = fmul double %19, %21
  %23 = fsub double %17, %22
  %24 = getelementptr inbounds %struct.vec3* %res, i32 0, i32 1
  store double %23, double* %24, align 8
  %25 = getelementptr inbounds %struct.vec3* %v1, i32 0, i32 0
  %26 = load double* %25, align 8
  %27 = getelementptr inbounds %struct.vec3* %v2, i32 0, i32 1
  %28 = load double* %27, align 8
  %29 = fmul double %26, %28
  %30 = getelementptr inbounds %struct.vec3* %v1, i32 0, i32 1
  %31 = load double* %30, align 8
  %32 = getelementptr inbounds %struct.vec3* %v2, i32 0, i32 0
  %33 = load double* %32, align 8
  %34 = fmul double %31, %33
  %35 = fsub double %29, %34
  %36 = getelementptr inbounds %struct.vec3* %res, i32 0, i32 2
  store double %35, double* %36, align 8
  %37 = bitcast %struct.vec3* %agg.result to i8*
  %38 = bitcast %struct.vec3* %res to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %37, i8* %38, i64 24, i32 8, i1 false)
  ret void
}

; Function Attrs: nounwind uwtable
define void @get_sample_pos(%struct.vec3* noalias sret %agg.result, i32 %x, i32 %y, i32 %sample) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %pt = alloca %struct.vec3, align 8
  %xsz = alloca double, align 8
  %ysz = alloca double, align 8
  %jt = alloca %struct.vec3, align 8
  store i32 %x, i32* %1, align 4
  store i32 %y, i32* %2, align 4
  store i32 %sample, i32* %3, align 4
  store double 2.000000e+00, double* %xsz, align 8
  %4 = load i32* @xres, align 4
  %5 = sitofp i32 %4 to double
  %6 = load double* @aspect, align 8
  %7 = fdiv double %5, %6
  store double %7, double* %ysz, align 8
  %8 = load double* @get_sample_pos.sf, align 8
  %9 = fcmp oeq double %8, 0.000000e+00
  br i1 %9, label %10, label %14

; <label>:10                                      ; preds = %0
  %11 = load i32* @xres, align 4
  %12 = sitofp i32 %11 to double
  %13 = fdiv double 2.000000e+00, %12
  store double %13, double* @get_sample_pos.sf, align 8
  br label %14

; <label>:14                                      ; preds = %10, %0
  %15 = load i32* %1, align 4
  %16 = sitofp i32 %15 to double
  %17 = load i32* @xres, align 4
  %18 = sitofp i32 %17 to double
  %19 = fdiv double %16, %18
  %20 = fsub double %19, 5.000000e-01
  %21 = getelementptr inbounds %struct.vec3* %pt, i32 0, i32 0
  store double %20, double* %21, align 8
  %22 = load i32* %2, align 4
  %23 = sitofp i32 %22 to double
  %24 = load i32* @yres, align 4
  %25 = sitofp i32 %24 to double
  %26 = fdiv double %23, %25
  %27 = fsub double %26, 6.500000e-01
  %28 = fsub double -0.000000e+00, %27
  %29 = load double* @aspect, align 8
  %30 = fdiv double %28, %29
  %31 = getelementptr inbounds %struct.vec3* %pt, i32 0, i32 1
  store double %30, double* %31, align 8
  %32 = load i32* %3, align 4
  %33 = icmp ne i32 %32, 0
  br i1 %33, label %34, label %54

; <label>:34                                      ; preds = %14
  %35 = load i32* %1, align 4
  %36 = load i32* %2, align 4
  %37 = load i32* %3, align 4
  call void @jitter(%struct.vec3* sret %jt, i32 %35, i32 %36, i32 %37)
  %38 = getelementptr inbounds %struct.vec3* %jt, i32 0, i32 0
  %39 = load double* %38, align 8
  %40 = load double* @get_sample_pos.sf, align 8
  %41 = fmul double %39, %40
  %42 = getelementptr inbounds %struct.vec3* %pt, i32 0, i32 0
  %43 = load double* %42, align 8
  %44 = fadd double %43, %41
  store double %44, double* %42, align 8
  %45 = getelementptr inbounds %struct.vec3* %jt, i32 0, i32 1
  %46 = load double* %45, align 8
  %47 = load double* @get_sample_pos.sf, align 8
  %48 = fmul double %46, %47
  %49 = load double* @aspect, align 8
  %50 = fdiv double %48, %49
  %51 = getelementptr inbounds %struct.vec3* %pt, i32 0, i32 1
  %52 = load double* %51, align 8
  %53 = fadd double %52, %50
  store double %53, double* %51, align 8
  br label %54

; <label>:54                                      ; preds = %34, %14
  %55 = bitcast %struct.vec3* %agg.result to i8*
  %56 = bitcast %struct.vec3* %pt to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %55, i8* %56, i64 24, i32 8, i1 false)
  ret void
}

; Function Attrs: nounwind uwtable
define void @jitter(%struct.vec3* noalias sret %agg.result, i32 %x, i32 %y, i32 %s) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %pt = alloca %struct.vec3, align 8
  store i32 %x, i32* %1, align 4
  store i32 %y, i32* %2, align 4
  store i32 %s, i32* %3, align 4
  %4 = load i32* %1, align 4
  %5 = load i32* %2, align 4
  %6 = shl i32 %5, 2
  %7 = add nsw i32 %4, %6
  %8 = load i32* %1, align 4
  %9 = load i32* %3, align 4
  %10 = add nsw i32 %8, %9
  %11 = and i32 %10, 1023
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [1024 x i32]* @irand, i32 0, i64 %12
  %14 = load i32* %13, align 4
  %15 = add nsw i32 %7, %14
  %16 = and i32 %15, 1023
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [1024 x %struct.vec3]* @urand, i32 0, i64 %17
  %19 = getelementptr inbounds %struct.vec3* %18, i32 0, i32 0
  %20 = load double* %19, align 8
  %21 = getelementptr inbounds %struct.vec3* %pt, i32 0, i32 0
  store double %20, double* %21, align 8
  %22 = load i32* %2, align 4
  %23 = load i32* %1, align 4
  %24 = shl i32 %23, 2
  %25 = add nsw i32 %22, %24
  %26 = load i32* %2, align 4
  %27 = load i32* %3, align 4
  %28 = add nsw i32 %26, %27
  %29 = and i32 %28, 1023
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [1024 x i32]* @irand, i32 0, i64 %30
  %32 = load i32* %31, align 4
  %33 = add nsw i32 %25, %32
  %34 = and i32 %33, 1023
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds [1024 x %struct.vec3]* @urand, i32 0, i64 %35
  %37 = getelementptr inbounds %struct.vec3* %36, i32 0, i32 1
  %38 = load double* %37, align 8
  %39 = getelementptr inbounds %struct.vec3* %pt, i32 0, i32 1
  store double %38, double* %39, align 8
  %40 = bitcast %struct.vec3* %agg.result to i8*
  %41 = bitcast %struct.vec3* %pt to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %40, i8* %41, i64 24, i32 8, i1 false)
  ret void
}

declare i8* @fgets(i8*, i32, %struct._IO_FILE*) #3

; Function Attrs: nounwind
declare i8* @strtok(i8*, i8*) #4

; Function Attrs: nounwind readonly
declare double @atof(i8*) #2

; Function Attrs: nounwind
declare i32 @gettimeofday(%struct.timeval*, %struct.timezone*) #4

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readnone }
attributes #7 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
