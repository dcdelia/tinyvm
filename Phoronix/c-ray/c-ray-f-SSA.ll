; ModuleID = 'c-ray-f.ll'
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
  %1 = load %struct._IO_FILE** @stdin, align 8
  %2 = load %struct._IO_FILE** @stdout, align 8
  br label %3

; <label>:3                                       ; preds = %159, %0
  %rays_per_pixel.0 = phi i32 [ 1, %0 ], [ %rays_per_pixel.1, %159 ]
  %i.0 = phi i32 [ 1, %0 ], [ %160, %159 ]
  %infile.0 = phi %struct._IO_FILE* [ %1, %0 ], [ %infile.1, %159 ]
  %outfile.0 = phi %struct._IO_FILE* [ %2, %0 ], [ %outfile.1, %159 ]
  %4 = icmp slt i32 %i.0, %argc
  br i1 %4, label %5, label %161

; <label>:5                                       ; preds = %3
  %6 = sext i32 %i.0 to i64
  %7 = getelementptr inbounds i8** %argv, i64 %6
  %8 = load i8** %7, align 8
  %9 = getelementptr inbounds i8* %8, i64 0
  %10 = load i8* %9, align 1
  %11 = sext i8 %10 to i32
  %12 = icmp eq i32 %11, 45
  br i1 %12, label %13, label %149

; <label>:13                                      ; preds = %5
  %14 = sext i32 %i.0 to i64
  %15 = getelementptr inbounds i8** %argv, i64 %14
  %16 = load i8** %15, align 8
  %17 = getelementptr inbounds i8* %16, i64 2
  %18 = load i8* %17, align 1
  %19 = sext i8 %18 to i32
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %21, label %149

; <label>:21                                      ; preds = %13
  %22 = sext i32 %i.0 to i64
  %23 = getelementptr inbounds i8** %argv, i64 %22
  %24 = load i8** %23, align 8
  %25 = getelementptr inbounds i8* %24, i64 1
  %26 = load i8* %25, align 1
  %27 = sext i8 %26 to i32
  switch i32 %27, label %139 [
    i32 115, label %28
    i32 105, label %77
    i32 111, label %94
    i32 114, label %111
    i32 104, label %135
  ]

; <label>:28                                      ; preds = %21
  %29 = add nsw i32 %i.0, 1
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds i8** %argv, i64 %30
  %32 = load i8** %31, align 8
  %33 = getelementptr inbounds i8* %32, i64 0
  %34 = load i8* %33, align 1
  %35 = sext i8 %34 to i32
  %36 = sext i32 %35 to i64
  %37 = call i16** @__ctype_b_loc() #6
  %38 = load i16** %37, align 8
  %39 = getelementptr inbounds i16* %38, i64 %36
  %40 = load i16* %39, align 2
  %41 = zext i16 %40 to i32
  %42 = and i32 %41, 2048
  %43 = icmp ne i32 %42, 0
  br i1 %43, label %44, label %62

; <label>:44                                      ; preds = %28
  %45 = sext i32 %29 to i64
  %46 = getelementptr inbounds i8** %argv, i64 %45
  %47 = load i8** %46, align 8
  %48 = call i8* @strchr(i8* %47, i32 120) #7
  %49 = icmp ne i8* %48, null
  br i1 %49, label %50, label %62

; <label>:50                                      ; preds = %44
  %51 = getelementptr inbounds i8* %48, i64 1
  %52 = load i8* %51, align 1
  %53 = sext i8 %52 to i32
  %54 = sext i32 %53 to i64
  %55 = call i16** @__ctype_b_loc() #6
  %56 = load i16** %55, align 8
  %57 = getelementptr inbounds i16* %56, i64 %54
  %58 = load i16* %57, align 2
  %59 = zext i16 %58 to i32
  %60 = and i32 %59, 2048
  %61 = icmp ne i32 %60, 0
  br i1 %61, label %65, label %62

; <label>:62                                      ; preds = %50, %44, %28
  %63 = load %struct._IO_FILE** @stderr, align 8
  %64 = call i32 @fputs(i8* getelementptr inbounds ([49 x i8]* @.str1, i32 0, i32 0), %struct._IO_FILE* %63)
  br label %260

; <label>:65                                      ; preds = %50
  %66 = sext i32 %29 to i64
  %67 = getelementptr inbounds i8** %argv, i64 %66
  %68 = load i8** %67, align 8
  %69 = call i32 @atoi(i8* %68) #7
  store i32 %69, i32* @xres, align 4
  %70 = getelementptr inbounds i8* %48, i64 1
  %71 = call i32 @atoi(i8* %70) #7
  store i32 %71, i32* @yres, align 4
  %72 = load i32* @xres, align 4
  %73 = sitofp i32 %72 to double
  %74 = load i32* @yres, align 4
  %75 = sitofp i32 %74 to double
  %76 = fdiv double %73, %75
  store double %76, double* @aspect, align 8
  br label %148

; <label>:77                                      ; preds = %21
  %78 = add nsw i32 %i.0, 1
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds i8** %argv, i64 %79
  %81 = load i8** %80, align 8
  %82 = call %struct._IO_FILE* @fopen(i8* %81, i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0))
  %83 = icmp ne %struct._IO_FILE* %82, null
  br i1 %83, label %93, label %84

; <label>:84                                      ; preds = %77
  %85 = load %struct._IO_FILE** @stderr, align 8
  %86 = sext i32 %78 to i64
  %87 = getelementptr inbounds i8** %argv, i64 %86
  %88 = load i8** %87, align 8
  %89 = call i32* @__errno_location() #6
  %90 = load i32* %89, align 4
  %91 = call i8* @strerror(i32 %90) #5
  %92 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %85, i8* getelementptr inbounds ([34 x i8]* @.str3, i32 0, i32 0), i8* %88, i8* %91)
  br label %260

; <label>:93                                      ; preds = %77
  br label %148

; <label>:94                                      ; preds = %21
  %95 = add nsw i32 %i.0, 1
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds i8** %argv, i64 %96
  %98 = load i8** %97, align 8
  %99 = call %struct._IO_FILE* @fopen(i8* %98, i8* getelementptr inbounds ([2 x i8]* @.str4, i32 0, i32 0))
  %100 = icmp ne %struct._IO_FILE* %99, null
  br i1 %100, label %110, label %101

; <label>:101                                     ; preds = %94
  %102 = load %struct._IO_FILE** @stderr, align 8
  %103 = sext i32 %95 to i64
  %104 = getelementptr inbounds i8** %argv, i64 %103
  %105 = load i8** %104, align 8
  %106 = call i32* @__errno_location() #6
  %107 = load i32* %106, align 4
  %108 = call i8* @strerror(i32 %107) #5
  %109 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %102, i8* getelementptr inbounds ([35 x i8]* @.str5, i32 0, i32 0), i8* %105, i8* %108)
  br label %260

; <label>:110                                     ; preds = %94
  br label %148

; <label>:111                                     ; preds = %21
  %112 = add nsw i32 %i.0, 1
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds i8** %argv, i64 %113
  %115 = load i8** %114, align 8
  %116 = getelementptr inbounds i8* %115, i64 0
  %117 = load i8* %116, align 1
  %118 = sext i8 %117 to i32
  %119 = sext i32 %118 to i64
  %120 = call i16** @__ctype_b_loc() #6
  %121 = load i16** %120, align 8
  %122 = getelementptr inbounds i16* %121, i64 %119
  %123 = load i16* %122, align 2
  %124 = zext i16 %123 to i32
  %125 = and i32 %124, 2048
  %126 = icmp ne i32 %125, 0
  br i1 %126, label %130, label %127

; <label>:127                                     ; preds = %111
  %128 = load %struct._IO_FILE** @stderr, align 8
  %129 = call i32 @fputs(i8* getelementptr inbounds ([50 x i8]* @.str6, i32 0, i32 0), %struct._IO_FILE* %128)
  br label %260

; <label>:130                                     ; preds = %111
  %131 = sext i32 %112 to i64
  %132 = getelementptr inbounds i8** %argv, i64 %131
  %133 = load i8** %132, align 8
  %134 = call i32 @atoi(i8* %133) #7
  br label %148

; <label>:135                                     ; preds = %21
  %136 = load i8** @usage, align 8
  %137 = load %struct._IO_FILE** @stdout, align 8
  %138 = call i32 @fputs(i8* %136, %struct._IO_FILE* %137)
  br label %260

; <label>:139                                     ; preds = %21
  %140 = load %struct._IO_FILE** @stderr, align 8
  %141 = sext i32 %i.0 to i64
  %142 = getelementptr inbounds i8** %argv, i64 %141
  %143 = load i8** %142, align 8
  %144 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %140, i8* getelementptr inbounds ([27 x i8]* @.str7, i32 0, i32 0), i8* %143)
  %145 = load i8** @usage, align 8
  %146 = load %struct._IO_FILE** @stderr, align 8
  %147 = call i32 @fputs(i8* %145, %struct._IO_FILE* %146)
  br label %260

; <label>:148                                     ; preds = %130, %110, %93, %65
  %rays_per_pixel.1 = phi i32 [ %134, %130 ], [ %rays_per_pixel.0, %110 ], [ %rays_per_pixel.0, %93 ], [ %rays_per_pixel.0, %65 ]
  %i.1 = phi i32 [ %112, %130 ], [ %95, %110 ], [ %78, %93 ], [ %29, %65 ]
  %infile.1 = phi %struct._IO_FILE* [ %infile.0, %130 ], [ %infile.0, %110 ], [ %82, %93 ], [ %infile.0, %65 ]
  %outfile.1 = phi %struct._IO_FILE* [ %outfile.0, %130 ], [ %99, %110 ], [ %outfile.0, %93 ], [ %outfile.0, %65 ]
  br label %158

; <label>:149                                     ; preds = %13, %5
  %150 = load %struct._IO_FILE** @stderr, align 8
  %151 = sext i32 %i.0 to i64
  %152 = getelementptr inbounds i8** %argv, i64 %151
  %153 = load i8** %152, align 8
  %154 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %150, i8* getelementptr inbounds ([27 x i8]* @.str7, i32 0, i32 0), i8* %153)
  %155 = load i8** @usage, align 8
  %156 = load %struct._IO_FILE** @stderr, align 8
  %157 = call i32 @fputs(i8* %155, %struct._IO_FILE* %156)
  br label %260

; <label>:158                                     ; preds = %148
  br label %159

; <label>:159                                     ; preds = %158
  %160 = add nsw i32 %i.1, 1
  br label %3

; <label>:161                                     ; preds = %3
  %162 = load i32* @xres, align 4
  %163 = load i32* @yres, align 4
  %164 = mul nsw i32 %162, %163
  %165 = sext i32 %164 to i64
  %166 = mul i64 %165, 4
  %167 = call noalias i8* @malloc(i64 %166) #5
  %168 = bitcast i8* %167 to i32*
  %169 = icmp ne i32* %168, null
  br i1 %169, label %171, label %170

; <label>:170                                     ; preds = %161
  call void @perror(i8* getelementptr inbounds ([31 x i8]* @.str8, i32 0, i32 0))
  br label %260

; <label>:171                                     ; preds = %161
  call void @load_scene(%struct._IO_FILE* %infile.0)
  br label %172

; <label>:172                                     ; preds = %182, %171
  %i.2 = phi i32 [ 0, %171 ], [ %183, %182 ]
  %173 = icmp slt i32 %i.2, 1024
  br i1 %173, label %174, label %184

; <label>:174                                     ; preds = %172
  %175 = call i32 @rand() #5
  %176 = sitofp i32 %175 to double
  %177 = fdiv double %176, 0x41DFFFFFFFC00000
  %178 = fsub double %177, 5.000000e-01
  %179 = sext i32 %i.2 to i64
  %180 = getelementptr inbounds [1024 x %struct.vec3]* @urand, i32 0, i64 %179
  %181 = getelementptr inbounds %struct.vec3* %180, i32 0, i32 0
  store double %178, double* %181, align 8
  br label %182

; <label>:182                                     ; preds = %174
  %183 = add nsw i32 %i.2, 1
  br label %172

; <label>:184                                     ; preds = %172
  br label %185

; <label>:185                                     ; preds = %195, %184
  %i.3 = phi i32 [ 0, %184 ], [ %196, %195 ]
  %186 = icmp slt i32 %i.3, 1024
  br i1 %186, label %187, label %197

; <label>:187                                     ; preds = %185
  %188 = call i32 @rand() #5
  %189 = sitofp i32 %188 to double
  %190 = fdiv double %189, 0x41DFFFFFFFC00000
  %191 = fsub double %190, 5.000000e-01
  %192 = sext i32 %i.3 to i64
  %193 = getelementptr inbounds [1024 x %struct.vec3]* @urand, i32 0, i64 %192
  %194 = getelementptr inbounds %struct.vec3* %193, i32 0, i32 1
  store double %191, double* %194, align 8
  br label %195

; <label>:195                                     ; preds = %187
  %196 = add nsw i32 %i.3, 1
  br label %185

; <label>:197                                     ; preds = %185
  br label %198

; <label>:198                                     ; preds = %208, %197
  %i.4 = phi i32 [ 0, %197 ], [ %209, %208 ]
  %199 = icmp slt i32 %i.4, 1024
  br i1 %199, label %200, label %210

; <label>:200                                     ; preds = %198
  %201 = call i32 @rand() #5
  %202 = sitofp i32 %201 to double
  %203 = fdiv double %202, 0x41DFFFFFFFC00000
  %204 = fmul double 1.024000e+03, %203
  %205 = fptosi double %204 to i32
  %206 = sext i32 %i.4 to i64
  %207 = getelementptr inbounds [1024 x i32]* @irand, i32 0, i64 %206
  store i32 %205, i32* %207, align 4
  br label %208

; <label>:208                                     ; preds = %200
  %209 = add nsw i32 %i.4, 1
  br label %198

; <label>:210                                     ; preds = %198
  %211 = call i64 @get_msec()
  %212 = load i32* @xres, align 4
  %213 = load i32* @yres, align 4
  call void @render(i32 %212, i32 %213, i32* %168, i32 %rays_per_pixel.0)
  %214 = call i64 @get_msec()
  %215 = sub i64 %214, %211
  %216 = load %struct._IO_FILE** @stderr, align 8
  %217 = udiv i64 %215, 1000
  %218 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %216, i8* getelementptr inbounds ([48 x i8]* @.str9, i32 0, i32 0), i64 %217, i64 %215)
  %219 = load i32* @xres, align 4
  %220 = load i32* @yres, align 4
  %221 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %outfile.0, i8* getelementptr inbounds ([14 x i8]* @.str10, i32 0, i32 0), i32 %219, i32 %220)
  br label %222

; <label>:222                                     ; preds = %246, %210
  %i.5 = phi i32 [ 0, %210 ], [ %247, %246 ]
  %223 = load i32* @xres, align 4
  %224 = load i32* @yres, align 4
  %225 = mul nsw i32 %223, %224
  %226 = icmp slt i32 %i.5, %225
  br i1 %226, label %227, label %248

; <label>:227                                     ; preds = %222
  %228 = sext i32 %i.5 to i64
  %229 = getelementptr inbounds i32* %168, i64 %228
  %230 = load i32* %229, align 4
  %231 = lshr i32 %230, 16
  %232 = and i32 %231, 255
  %233 = call i32 @fputc(i32 %232, %struct._IO_FILE* %outfile.0)
  %234 = sext i32 %i.5 to i64
  %235 = getelementptr inbounds i32* %168, i64 %234
  %236 = load i32* %235, align 4
  %237 = lshr i32 %236, 8
  %238 = and i32 %237, 255
  %239 = call i32 @fputc(i32 %238, %struct._IO_FILE* %outfile.0)
  %240 = sext i32 %i.5 to i64
  %241 = getelementptr inbounds i32* %168, i64 %240
  %242 = load i32* %241, align 4
  %243 = lshr i32 %242, 0
  %244 = and i32 %243, 255
  %245 = call i32 @fputc(i32 %244, %struct._IO_FILE* %outfile.0)
  br label %246

; <label>:246                                     ; preds = %227
  %247 = add nsw i32 %i.5, 1
  br label %222

; <label>:248                                     ; preds = %222
  %249 = call i32 @fflush(%struct._IO_FILE* %outfile.0)
  %250 = load %struct._IO_FILE** @stdin, align 8
  %251 = icmp ne %struct._IO_FILE* %infile.0, %250
  br i1 %251, label %252, label %254

; <label>:252                                     ; preds = %248
  %253 = call i32 @fclose(%struct._IO_FILE* %infile.0)
  br label %254

; <label>:254                                     ; preds = %252, %248
  %255 = load %struct._IO_FILE** @stdout, align 8
  %256 = icmp ne %struct._IO_FILE* %outfile.0, %255
  br i1 %256, label %257, label %259

; <label>:257                                     ; preds = %254
  %258 = call i32 @fclose(%struct._IO_FILE* %outfile.0)
  br label %259

; <label>:259                                     ; preds = %257, %254
  br label %260

; <label>:260                                     ; preds = %259, %170, %149, %139, %135, %127, %101, %84, %62
  %.0 = phi i32 [ 1, %139 ], [ 0, %135 ], [ 1, %127 ], [ 1, %101 ], [ 1, %84 ], [ 1, %62 ], [ 1, %149 ], [ 0, %259 ], [ 1, %170 ]
  ret i32 %.0
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
  %line = alloca [256 x i8], align 16
  %pos = alloca %struct.vec3, align 8
  %col = alloca %struct.vec3, align 8
  %1 = call noalias i8* @malloc(i64 80) #5
  %2 = bitcast i8* %1 to %struct.sphere*
  store %struct.sphere* %2, %struct.sphere** @obj_list, align 8
  %3 = load %struct.sphere** @obj_list, align 8
  %4 = getelementptr inbounds %struct.sphere* %3, i32 0, i32 3
  store %struct.sphere* null, %struct.sphere** %4, align 8
  br label %5

; <label>:5                                       ; preds = %124, %94, %89, %83, %64, %54, %35, %30, %0
  %6 = getelementptr inbounds [256 x i8]* %line, i32 0, i32 0
  %7 = call i8* @fgets(i8* %6, i32 256, %struct._IO_FILE* %fp)
  %8 = icmp ne i8* %7, null
  br i1 %8, label %9, label %125

; <label>:9                                       ; preds = %5
  br label %10

; <label>:10                                      ; preds = %20, %9
  %ptr.0 = phi i8* [ %7, %9 ], [ %21, %20 ]
  %11 = load i8* %ptr.0, align 1
  %12 = sext i8 %11 to i32
  %13 = icmp eq i32 %12, 32
  br i1 %13, label %18, label %14

; <label>:14                                      ; preds = %10
  %15 = load i8* %ptr.0, align 1
  %16 = sext i8 %15 to i32
  %17 = icmp eq i32 %16, 9
  br label %18

; <label>:18                                      ; preds = %14, %10
  %19 = phi i1 [ true, %10 ], [ %17, %14 ]
  br i1 %19, label %20, label %22

; <label>:20                                      ; preds = %18
  %21 = getelementptr inbounds i8* %ptr.0, i32 1
  br label %10

; <label>:22                                      ; preds = %18
  %23 = load i8* %ptr.0, align 1
  %24 = sext i8 %23 to i32
  %25 = icmp eq i32 %24, 35
  br i1 %25, label %30, label %26

; <label>:26                                      ; preds = %22
  %27 = load i8* %ptr.0, align 1
  %28 = sext i8 %27 to i32
  %29 = icmp eq i32 %28, 10
  br i1 %29, label %30, label %31

; <label>:30                                      ; preds = %26, %22
  br label %5

; <label>:31                                      ; preds = %26
  %32 = getelementptr inbounds [256 x i8]* %line, i32 0, i32 0
  %33 = call i8* @strtok(i8* %32, i8* getelementptr inbounds ([4 x i8]* @.str11, i32 0, i32 0)) #5
  %34 = icmp ne i8* %33, null
  br i1 %34, label %36, label %35

; <label>:35                                      ; preds = %31
  br label %5

; <label>:36                                      ; preds = %31
  %37 = load i8* %33, align 1
  br label %38

; <label>:38                                      ; preds = %49, %36
  %i.0 = phi i32 [ 0, %36 ], [ %50, %49 ]
  %39 = icmp slt i32 %i.0, 3
  br i1 %39, label %40, label %51

; <label>:40                                      ; preds = %38
  %41 = call i8* @strtok(i8* null, i8* getelementptr inbounds ([4 x i8]* @.str11, i32 0, i32 0)) #5
  %42 = icmp ne i8* %41, null
  br i1 %42, label %44, label %43

; <label>:43                                      ; preds = %40
  br label %51

; <label>:44                                      ; preds = %40
  %45 = call double @atof(i8* %41) #7
  %46 = getelementptr inbounds %struct.vec3* %pos, i32 0, i32 0
  %47 = sext i32 %i.0 to i64
  %48 = getelementptr inbounds double* %46, i64 %47
  store double %45, double* %48, align 8
  br label %49

; <label>:49                                      ; preds = %44
  %50 = add nsw i32 %i.0, 1
  br label %38

; <label>:51                                      ; preds = %43, %38
  %52 = sext i8 %37 to i32
  %53 = icmp eq i32 %52, 108
  br i1 %53, label %54, label %61

; <label>:54                                      ; preds = %51
  %55 = load i32* @lnum, align 4
  %56 = add nsw i32 %55, 1
  store i32 %56, i32* @lnum, align 4
  %57 = sext i32 %55 to i64
  %58 = getelementptr inbounds [16 x %struct.vec3]* @lights, i32 0, i64 %57
  %59 = bitcast %struct.vec3* %58 to i8*
  %60 = bitcast %struct.vec3* %pos to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %59, i8* %60, i64 24, i32 8, i1 false)
  br label %5

; <label>:61                                      ; preds = %51
  %62 = call i8* @strtok(i8* null, i8* getelementptr inbounds ([4 x i8]* @.str11, i32 0, i32 0)) #5
  %63 = icmp ne i8* %62, null
  br i1 %63, label %65, label %64

; <label>:64                                      ; preds = %61
  br label %5

; <label>:65                                      ; preds = %61
  %66 = call double @atof(i8* %62) #7
  br label %67

; <label>:67                                      ; preds = %78, %65
  %i.1 = phi i32 [ 0, %65 ], [ %79, %78 ]
  %68 = icmp slt i32 %i.1, 3
  br i1 %68, label %69, label %80

; <label>:69                                      ; preds = %67
  %70 = call i8* @strtok(i8* null, i8* getelementptr inbounds ([4 x i8]* @.str11, i32 0, i32 0)) #5
  %71 = icmp ne i8* %70, null
  br i1 %71, label %73, label %72

; <label>:72                                      ; preds = %69
  br label %80

; <label>:73                                      ; preds = %69
  %74 = call double @atof(i8* %70) #7
  %75 = getelementptr inbounds %struct.vec3* %col, i32 0, i32 0
  %76 = sext i32 %i.1 to i64
  %77 = getelementptr inbounds double* %75, i64 %76
  store double %74, double* %77, align 8
  br label %78

; <label>:78                                      ; preds = %73
  %79 = add nsw i32 %i.1, 1
  br label %67

; <label>:80                                      ; preds = %72, %67
  %81 = sext i8 %37 to i32
  %82 = icmp eq i32 %81, 99
  br i1 %82, label %83, label %86

; <label>:83                                      ; preds = %80
  %84 = bitcast %struct.vec3* %pos to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* bitcast (%struct.camera* @cam to i8*), i8* %84, i64 24, i32 8, i1 false)
  %85 = bitcast %struct.vec3* %col to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* bitcast (%struct.vec3* getelementptr inbounds (%struct.camera* @cam, i32 0, i32 1) to i8*), i8* %85, i64 24, i32 8, i1 false)
  store double %66, double* getelementptr inbounds (%struct.camera* @cam, i32 0, i32 2), align 8
  br label %5

; <label>:86                                      ; preds = %80
  %87 = call i8* @strtok(i8* null, i8* getelementptr inbounds ([4 x i8]* @.str11, i32 0, i32 0)) #5
  %88 = icmp ne i8* %87, null
  br i1 %88, label %90, label %89

; <label>:89                                      ; preds = %86
  br label %5

; <label>:90                                      ; preds = %86
  %91 = call double @atof(i8* %87) #7
  %92 = call i8* @strtok(i8* null, i8* getelementptr inbounds ([4 x i8]* @.str11, i32 0, i32 0)) #5
  %93 = icmp ne i8* %92, null
  br i1 %93, label %95, label %94

; <label>:94                                      ; preds = %90
  br label %5

; <label>:95                                      ; preds = %90
  %96 = call double @atof(i8* %92) #7
  %97 = sext i8 %37 to i32
  %98 = icmp eq i32 %97, 115
  br i1 %98, label %99, label %120

; <label>:99                                      ; preds = %95
  %100 = call noalias i8* @malloc(i64 80) #5
  %101 = bitcast i8* %100 to %struct.sphere*
  %102 = load %struct.sphere** @obj_list, align 8
  %103 = getelementptr inbounds %struct.sphere* %102, i32 0, i32 3
  %104 = load %struct.sphere** %103, align 8
  %105 = getelementptr inbounds %struct.sphere* %101, i32 0, i32 3
  store %struct.sphere* %104, %struct.sphere** %105, align 8
  %106 = load %struct.sphere** @obj_list, align 8
  %107 = getelementptr inbounds %struct.sphere* %106, i32 0, i32 3
  store %struct.sphere* %101, %struct.sphere** %107, align 8
  %108 = getelementptr inbounds %struct.sphere* %101, i32 0, i32 0
  %109 = bitcast %struct.vec3* %108 to i8*
  %110 = bitcast %struct.vec3* %pos to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %109, i8* %110, i64 24, i32 8, i1 false)
  %111 = getelementptr inbounds %struct.sphere* %101, i32 0, i32 1
  store double %66, double* %111, align 8
  %112 = getelementptr inbounds %struct.sphere* %101, i32 0, i32 2
  %113 = getelementptr inbounds %struct.material* %112, i32 0, i32 0
  %114 = bitcast %struct.vec3* %113 to i8*
  %115 = bitcast %struct.vec3* %col to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %114, i8* %115, i64 24, i32 8, i1 false)
  %116 = getelementptr inbounds %struct.sphere* %101, i32 0, i32 2
  %117 = getelementptr inbounds %struct.material* %116, i32 0, i32 1
  store double %91, double* %117, align 8
  %118 = getelementptr inbounds %struct.sphere* %101, i32 0, i32 2
  %119 = getelementptr inbounds %struct.material* %118, i32 0, i32 2
  store double %96, double* %119, align 8
  br label %124

; <label>:120                                     ; preds = %95
  %121 = load %struct._IO_FILE** @stderr, align 8
  %122 = sext i8 %37 to i32
  %123 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %121, i8* getelementptr inbounds ([18 x i8]* @.str12, i32 0, i32 0), i32 %122)
  br label %124

; <label>:124                                     ; preds = %120, %99
  br label %5

; <label>:125                                     ; preds = %5
  ret void
}

; Function Attrs: nounwind
declare i32 @rand() #4

; Function Attrs: nounwind uwtable
define i64 @get_msec() #0 {
  %1 = call i32 @gettimeofday(%struct.timeval* @get_msec.timeval, %struct.timezone* null) #5
  %2 = load i64* getelementptr inbounds (%struct.timeval* @get_msec.first_timeval, i32 0, i32 0), align 8
  %3 = icmp eq i64 %2, 0
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* bitcast (%struct.timeval* @get_msec.first_timeval to i8*), i8* bitcast (%struct.timeval* @get_msec.timeval to i8*), i64 16, i32 8, i1 false)
  br label %15

; <label>:5                                       ; preds = %0
  %6 = load i64* getelementptr inbounds (%struct.timeval* @get_msec.timeval, i32 0, i32 0), align 8
  %7 = load i64* getelementptr inbounds (%struct.timeval* @get_msec.first_timeval, i32 0, i32 0), align 8
  %8 = sub nsw i64 %6, %7
  %9 = mul nsw i64 %8, 1000
  %10 = load i64* getelementptr inbounds (%struct.timeval* @get_msec.timeval, i32 0, i32 1), align 8
  %11 = load i64* getelementptr inbounds (%struct.timeval* @get_msec.first_timeval, i32 0, i32 1), align 8
  %12 = sub nsw i64 %10, %11
  %13 = sdiv i64 %12, 1000
  %14 = add nsw i64 %9, %13
  br label %15

; <label>:15                                      ; preds = %5, %4
  %.0 = phi i64 [ 0, %4 ], [ %14, %5 ]
  ret i64 %.0
}

; Function Attrs: nounwind uwtable
define void @render(i32 %xsz, i32 %ysz, i32* %fb, i32 %samples) #0 {
  %col = alloca %struct.vec3, align 8
  %1 = alloca %struct.ray, align 8
  %2 = sitofp i32 %samples to double
  %3 = fdiv double 1.000000e+00, %2
  br label %4

; <label>:4                                       ; preds = %61, %0
  %j.0 = phi i32 [ 0, %0 ], [ %62, %61 ]
  %.0 = phi i32* [ %fb, %0 ], [ %.1, %61 ]
  %5 = icmp slt i32 %j.0, %ysz
  br i1 %5, label %6, label %63

; <label>:6                                       ; preds = %4
  br label %7

; <label>:7                                       ; preds = %58, %6
  %i.0 = phi i32 [ 0, %6 ], [ %59, %58 ]
  %.1 = phi i32* [ %.0, %6 ], [ %57, %58 ]
  %8 = icmp slt i32 %i.0, %xsz
  br i1 %8, label %9, label %60

; <label>:9                                       ; preds = %7
  br label %10

; <label>:10                                      ; preds = %22, %9
  %s.0 = phi i32 [ 0, %9 ], [ %23, %22 ]
  %r.0 = phi double [ 0.000000e+00, %9 ], [ %15, %22 ]
  %g.0 = phi double [ 0.000000e+00, %9 ], [ %18, %22 ]
  %b.0 = phi double [ 0.000000e+00, %9 ], [ %21, %22 ]
  %11 = icmp slt i32 %s.0, %samples
  br i1 %11, label %12, label %24

; <label>:12                                      ; preds = %10
  call void @get_primary_ray(%struct.ray* sret %1, i32 %i.0, i32 %j.0, i32 %s.0)
  call void @trace(%struct.vec3* sret %col, %struct.ray* byval align 8 %1, i32 0)
  %13 = getelementptr inbounds %struct.vec3* %col, i32 0, i32 0
  %14 = load double* %13, align 8
  %15 = fadd double %r.0, %14
  %16 = getelementptr inbounds %struct.vec3* %col, i32 0, i32 1
  %17 = load double* %16, align 8
  %18 = fadd double %g.0, %17
  %19 = getelementptr inbounds %struct.vec3* %col, i32 0, i32 2
  %20 = load double* %19, align 8
  %21 = fadd double %b.0, %20
  br label %22

; <label>:22                                      ; preds = %12
  %23 = add nsw i32 %s.0, 1
  br label %10

; <label>:24                                      ; preds = %10
  %25 = fmul double %r.0, %3
  %26 = fmul double %g.0, %3
  %27 = fmul double %b.0, %3
  %28 = fcmp olt double %25, 1.000000e+00
  br i1 %28, label %29, label %30

; <label>:29                                      ; preds = %24
  br label %31

; <label>:30                                      ; preds = %24
  br label %31

; <label>:31                                      ; preds = %30, %29
  %32 = phi double [ %25, %29 ], [ 1.000000e+00, %30 ]
  %33 = fmul double %32, 2.550000e+02
  %34 = fptoui double %33 to i32
  %35 = and i32 %34, 255
  %36 = shl i32 %35, 16
  %37 = fcmp olt double %26, 1.000000e+00
  br i1 %37, label %38, label %39

; <label>:38                                      ; preds = %31
  br label %40

; <label>:39                                      ; preds = %31
  br label %40

; <label>:40                                      ; preds = %39, %38
  %41 = phi double [ %26, %38 ], [ 1.000000e+00, %39 ]
  %42 = fmul double %41, 2.550000e+02
  %43 = fptoui double %42 to i32
  %44 = and i32 %43, 255
  %45 = shl i32 %44, 8
  %46 = or i32 %36, %45
  %47 = fcmp olt double %27, 1.000000e+00
  br i1 %47, label %48, label %49

; <label>:48                                      ; preds = %40
  br label %50

; <label>:49                                      ; preds = %40
  br label %50

; <label>:50                                      ; preds = %49, %48
  %51 = phi double [ %27, %48 ], [ 1.000000e+00, %49 ]
  %52 = fmul double %51, 2.550000e+02
  %53 = fptoui double %52 to i32
  %54 = and i32 %53, 255
  %55 = shl i32 %54, 0
  %56 = or i32 %46, %55
  %57 = getelementptr inbounds i32* %.1, i32 1
  store i32 %56, i32* %.1, align 4
  br label %58

; <label>:58                                      ; preds = %50
  %59 = add nsw i32 %i.0, 1
  br label %7

; <label>:60                                      ; preds = %7
  br label %61

; <label>:61                                      ; preds = %60
  %62 = add nsw i32 %j.0, 1
  br label %4

; <label>:63                                      ; preds = %4
  ret void
}

declare i32 @fputc(i32, %struct._IO_FILE*) #3

declare i32 @fflush(%struct._IO_FILE*) #3

declare i32 @fclose(%struct._IO_FILE*) #3

; Function Attrs: nounwind uwtable
define void @trace(%struct.vec3* noalias sret %agg.result, %struct.ray* byval align 8 %ray, i32 %depth) #0 {
  %col = alloca %struct.vec3, align 8
  %sp = alloca %struct.spoint, align 8
  %nearest_sp = alloca %struct.spoint, align 8
  %1 = alloca %struct.vec3, align 8
  %2 = load %struct.sphere** @obj_list, align 8
  %3 = getelementptr inbounds %struct.sphere* %2, i32 0, i32 3
  %4 = load %struct.sphere** %3, align 8
  %5 = icmp sge i32 %depth, 5
  br i1 %5, label %6, label %12

; <label>:6                                       ; preds = %0
  %7 = getelementptr inbounds %struct.vec3* %col, i32 0, i32 2
  store double 0.000000e+00, double* %7, align 8
  %8 = getelementptr inbounds %struct.vec3* %col, i32 0, i32 1
  store double 0.000000e+00, double* %8, align 8
  %9 = getelementptr inbounds %struct.vec3* %col, i32 0, i32 0
  store double 0.000000e+00, double* %9, align 8
  %10 = bitcast %struct.vec3* %agg.result to i8*
  %11 = bitcast %struct.vec3* %col to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %10, i8* %11, i64 24, i32 8, i1 false)
  br label %45

; <label>:12                                      ; preds = %0
  br label %13

; <label>:13                                      ; preds = %30, %12
  %nearest_obj.0 = phi %struct.sphere* [ null, %12 ], [ %nearest_obj.2, %30 ]
  %iter.0 = phi %struct.sphere* [ %4, %12 ], [ %32, %30 ]
  %14 = icmp ne %struct.sphere* %iter.0, null
  br i1 %14, label %15, label %33

; <label>:15                                      ; preds = %13
  %16 = call i32 @ray_sphere(%struct.sphere* %iter.0, %struct.ray* byval align 8 %ray, %struct.spoint* %sp)
  %17 = icmp ne i32 %16, 0
  br i1 %17, label %18, label %30

; <label>:18                                      ; preds = %15
  %19 = icmp ne %struct.sphere* %nearest_obj.0, null
  br i1 %19, label %20, label %26

; <label>:20                                      ; preds = %18
  %21 = getelementptr inbounds %struct.spoint* %sp, i32 0, i32 3
  %22 = load double* %21, align 8
  %23 = getelementptr inbounds %struct.spoint* %nearest_sp, i32 0, i32 3
  %24 = load double* %23, align 8
  %25 = fcmp olt double %22, %24
  br i1 %25, label %26, label %29

; <label>:26                                      ; preds = %20, %18
  %27 = bitcast %struct.spoint* %nearest_sp to i8*
  %28 = bitcast %struct.spoint* %sp to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %27, i8* %28, i64 80, i32 8, i1 false)
  br label %29

; <label>:29                                      ; preds = %26, %20
  %nearest_obj.1 = phi %struct.sphere* [ %iter.0, %26 ], [ %nearest_obj.0, %20 ]
  br label %30

; <label>:30                                      ; preds = %29, %15
  %nearest_obj.2 = phi %struct.sphere* [ %nearest_obj.1, %29 ], [ %nearest_obj.0, %15 ]
  %31 = getelementptr inbounds %struct.sphere* %iter.0, i32 0, i32 3
  %32 = load %struct.sphere** %31, align 8
  br label %13

; <label>:33                                      ; preds = %13
  %34 = icmp ne %struct.sphere* %nearest_obj.0, null
  br i1 %34, label %35, label %38

; <label>:35                                      ; preds = %33
  call void @shade(%struct.vec3* sret %1, %struct.sphere* %nearest_obj.0, %struct.spoint* %nearest_sp, i32 %depth)
  %36 = bitcast %struct.vec3* %col to i8*
  %37 = bitcast %struct.vec3* %1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %36, i8* %37, i64 24, i32 8, i1 false)
  br label %42

; <label>:38                                      ; preds = %33
  %39 = getelementptr inbounds %struct.vec3* %col, i32 0, i32 2
  store double 0.000000e+00, double* %39, align 8
  %40 = getelementptr inbounds %struct.vec3* %col, i32 0, i32 1
  store double 0.000000e+00, double* %40, align 8
  %41 = getelementptr inbounds %struct.vec3* %col, i32 0, i32 0
  store double 0.000000e+00, double* %41, align 8
  br label %42

; <label>:42                                      ; preds = %38, %35
  %43 = bitcast %struct.vec3* %agg.result to i8*
  %44 = bitcast %struct.vec3* %col to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %43, i8* %44, i64 24, i32 8, i1 false)
  br label %45

; <label>:45                                      ; preds = %42, %6
  ret void
}

; Function Attrs: nounwind uwtable
define void @get_primary_ray(%struct.ray* noalias sret %agg.result, i32 %x, i32 %y, i32 %sample) #0 {
  %ray = alloca %struct.ray, align 8
  %m = alloca [3 x [3 x float]], align 16
  %i = alloca %struct.vec3, align 8
  %j = alloca %struct.vec3, align 8
  %k = alloca %struct.vec3, align 8
  %dir = alloca %struct.vec3, align 8
  %orig = alloca %struct.vec3, align 8
  %foo = alloca %struct.vec3, align 8
  %1 = alloca %struct.vec3, align 8
  %2 = alloca %struct.vec3, align 8
  %3 = alloca %struct.vec3, align 8
  %4 = bitcast %struct.vec3* %j to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %4, i8* bitcast (%struct.vec3* @get_primary_ray.j to i8*), i64 24, i32 8, i1 false)
  %5 = load double* getelementptr inbounds (%struct.camera* @cam, i32 0, i32 1, i32 0), align 8
  %6 = load double* getelementptr inbounds (%struct.camera* @cam, i32 0, i32 0, i32 0), align 8
  %7 = fsub double %5, %6
  %8 = getelementptr inbounds %struct.vec3* %k, i32 0, i32 0
  store double %7, double* %8, align 8
  %9 = load double* getelementptr inbounds (%struct.camera* @cam, i32 0, i32 1, i32 1), align 8
  %10 = load double* getelementptr inbounds (%struct.camera* @cam, i32 0, i32 0, i32 1), align 8
  %11 = fsub double %9, %10
  %12 = getelementptr inbounds %struct.vec3* %k, i32 0, i32 1
  store double %11, double* %12, align 8
  %13 = load double* getelementptr inbounds (%struct.camera* @cam, i32 0, i32 1, i32 2), align 8
  %14 = load double* getelementptr inbounds (%struct.camera* @cam, i32 0, i32 0, i32 2), align 8
  %15 = fsub double %13, %14
  %16 = getelementptr inbounds %struct.vec3* %k, i32 0, i32 2
  store double %15, double* %16, align 8
  br label %17

; <label>:17                                      ; preds = %0
  %18 = getelementptr inbounds %struct.vec3* %k, i32 0, i32 0
  %19 = load double* %18, align 8
  %20 = getelementptr inbounds %struct.vec3* %k, i32 0, i32 0
  %21 = load double* %20, align 8
  %22 = fmul double %19, %21
  %23 = getelementptr inbounds %struct.vec3* %k, i32 0, i32 1
  %24 = load double* %23, align 8
  %25 = getelementptr inbounds %struct.vec3* %k, i32 0, i32 1
  %26 = load double* %25, align 8
  %27 = fmul double %24, %26
  %28 = fadd double %22, %27
  %29 = getelementptr inbounds %struct.vec3* %k, i32 0, i32 2
  %30 = load double* %29, align 8
  %31 = getelementptr inbounds %struct.vec3* %k, i32 0, i32 2
  %32 = load double* %31, align 8
  %33 = fmul double %30, %32
  %34 = fadd double %28, %33
  %35 = call double @sqrt(double %34) #5
  %36 = getelementptr inbounds %struct.vec3* %k, i32 0, i32 0
  %37 = load double* %36, align 8
  %38 = fdiv double %37, %35
  store double %38, double* %36, align 8
  %39 = getelementptr inbounds %struct.vec3* %k, i32 0, i32 1
  %40 = load double* %39, align 8
  %41 = fdiv double %40, %35
  store double %41, double* %39, align 8
  %42 = getelementptr inbounds %struct.vec3* %k, i32 0, i32 2
  %43 = load double* %42, align 8
  %44 = fdiv double %43, %35
  store double %44, double* %42, align 8
  br label %45

; <label>:45                                      ; preds = %17
  call void @cross_product(%struct.vec3* sret %1, %struct.vec3* byval align 8 %j, %struct.vec3* byval align 8 %k)
  %46 = bitcast %struct.vec3* %i to i8*
  %47 = bitcast %struct.vec3* %1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %46, i8* %47, i64 24, i32 8, i1 false)
  call void @cross_product(%struct.vec3* sret %2, %struct.vec3* byval align 8 %k, %struct.vec3* byval align 8 %i)
  %48 = bitcast %struct.vec3* %j to i8*
  %49 = bitcast %struct.vec3* %2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %48, i8* %49, i64 24, i32 8, i1 false)
  %50 = getelementptr inbounds %struct.vec3* %i, i32 0, i32 0
  %51 = load double* %50, align 8
  %52 = fptrunc double %51 to float
  %53 = getelementptr inbounds [3 x [3 x float]]* %m, i32 0, i64 0
  %54 = getelementptr inbounds [3 x float]* %53, i32 0, i64 0
  store float %52, float* %54, align 4
  %55 = getelementptr inbounds %struct.vec3* %j, i32 0, i32 0
  %56 = load double* %55, align 8
  %57 = fptrunc double %56 to float
  %58 = getelementptr inbounds [3 x [3 x float]]* %m, i32 0, i64 0
  %59 = getelementptr inbounds [3 x float]* %58, i32 0, i64 1
  store float %57, float* %59, align 4
  %60 = getelementptr inbounds %struct.vec3* %k, i32 0, i32 0
  %61 = load double* %60, align 8
  %62 = fptrunc double %61 to float
  %63 = getelementptr inbounds [3 x [3 x float]]* %m, i32 0, i64 0
  %64 = getelementptr inbounds [3 x float]* %63, i32 0, i64 2
  store float %62, float* %64, align 4
  %65 = getelementptr inbounds %struct.vec3* %i, i32 0, i32 1
  %66 = load double* %65, align 8
  %67 = fptrunc double %66 to float
  %68 = getelementptr inbounds [3 x [3 x float]]* %m, i32 0, i64 1
  %69 = getelementptr inbounds [3 x float]* %68, i32 0, i64 0
  store float %67, float* %69, align 4
  %70 = getelementptr inbounds %struct.vec3* %j, i32 0, i32 1
  %71 = load double* %70, align 8
  %72 = fptrunc double %71 to float
  %73 = getelementptr inbounds [3 x [3 x float]]* %m, i32 0, i64 1
  %74 = getelementptr inbounds [3 x float]* %73, i32 0, i64 1
  store float %72, float* %74, align 4
  %75 = getelementptr inbounds %struct.vec3* %k, i32 0, i32 1
  %76 = load double* %75, align 8
  %77 = fptrunc double %76 to float
  %78 = getelementptr inbounds [3 x [3 x float]]* %m, i32 0, i64 1
  %79 = getelementptr inbounds [3 x float]* %78, i32 0, i64 2
  store float %77, float* %79, align 4
  %80 = getelementptr inbounds %struct.vec3* %i, i32 0, i32 2
  %81 = load double* %80, align 8
  %82 = fptrunc double %81 to float
  %83 = getelementptr inbounds [3 x [3 x float]]* %m, i32 0, i64 2
  %84 = getelementptr inbounds [3 x float]* %83, i32 0, i64 0
  store float %82, float* %84, align 4
  %85 = getelementptr inbounds %struct.vec3* %j, i32 0, i32 2
  %86 = load double* %85, align 8
  %87 = fptrunc double %86 to float
  %88 = getelementptr inbounds [3 x [3 x float]]* %m, i32 0, i64 2
  %89 = getelementptr inbounds [3 x float]* %88, i32 0, i64 1
  store float %87, float* %89, align 4
  %90 = getelementptr inbounds %struct.vec3* %k, i32 0, i32 2
  %91 = load double* %90, align 8
  %92 = fptrunc double %91 to float
  %93 = getelementptr inbounds [3 x [3 x float]]* %m, i32 0, i64 2
  %94 = getelementptr inbounds [3 x float]* %93, i32 0, i64 2
  store float %92, float* %94, align 4
  %95 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 0
  %96 = getelementptr inbounds %struct.vec3* %95, i32 0, i32 2
  store double 0.000000e+00, double* %96, align 8
  %97 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 0
  %98 = getelementptr inbounds %struct.vec3* %97, i32 0, i32 1
  store double 0.000000e+00, double* %98, align 8
  %99 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 0
  %100 = getelementptr inbounds %struct.vec3* %99, i32 0, i32 0
  store double 0.000000e+00, double* %100, align 8
  %101 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 1
  call void @get_sample_pos(%struct.vec3* sret %3, i32 %x, i32 %y, i32 %sample)
  %102 = bitcast %struct.vec3* %101 to i8*
  %103 = bitcast %struct.vec3* %3 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %102, i8* %103, i64 24, i32 8, i1 false)
  %104 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 1
  %105 = getelementptr inbounds %struct.vec3* %104, i32 0, i32 2
  store double 0x40045F306F4445A0, double* %105, align 8
  %106 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 1
  %107 = getelementptr inbounds %struct.vec3* %106, i32 0, i32 0
  %108 = load double* %107, align 8
  %109 = fmul double %108, 1.000000e+03
  store double %109, double* %107, align 8
  %110 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 1
  %111 = getelementptr inbounds %struct.vec3* %110, i32 0, i32 1
  %112 = load double* %111, align 8
  %113 = fmul double %112, 1.000000e+03
  store double %113, double* %111, align 8
  %114 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 1
  %115 = getelementptr inbounds %struct.vec3* %114, i32 0, i32 2
  %116 = load double* %115, align 8
  %117 = fmul double %116, 1.000000e+03
  store double %117, double* %115, align 8
  %118 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 1
  %119 = getelementptr inbounds %struct.vec3* %118, i32 0, i32 0
  %120 = load double* %119, align 8
  %121 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 0
  %122 = getelementptr inbounds %struct.vec3* %121, i32 0, i32 0
  %123 = load double* %122, align 8
  %124 = fadd double %120, %123
  %125 = getelementptr inbounds %struct.vec3* %dir, i32 0, i32 0
  store double %124, double* %125, align 8
  %126 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 1
  %127 = getelementptr inbounds %struct.vec3* %126, i32 0, i32 1
  %128 = load double* %127, align 8
  %129 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 0
  %130 = getelementptr inbounds %struct.vec3* %129, i32 0, i32 1
  %131 = load double* %130, align 8
  %132 = fadd double %128, %131
  %133 = getelementptr inbounds %struct.vec3* %dir, i32 0, i32 1
  store double %132, double* %133, align 8
  %134 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 1
  %135 = getelementptr inbounds %struct.vec3* %134, i32 0, i32 2
  %136 = load double* %135, align 8
  %137 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 0
  %138 = getelementptr inbounds %struct.vec3* %137, i32 0, i32 2
  %139 = load double* %138, align 8
  %140 = fadd double %136, %139
  %141 = getelementptr inbounds %struct.vec3* %dir, i32 0, i32 2
  store double %140, double* %141, align 8
  %142 = getelementptr inbounds %struct.vec3* %dir, i32 0, i32 0
  %143 = load double* %142, align 8
  %144 = getelementptr inbounds [3 x [3 x float]]* %m, i32 0, i64 0
  %145 = getelementptr inbounds [3 x float]* %144, i32 0, i64 0
  %146 = load float* %145, align 4
  %147 = fpext float %146 to double
  %148 = fmul double %143, %147
  %149 = getelementptr inbounds %struct.vec3* %dir, i32 0, i32 1
  %150 = load double* %149, align 8
  %151 = getelementptr inbounds [3 x [3 x float]]* %m, i32 0, i64 0
  %152 = getelementptr inbounds [3 x float]* %151, i32 0, i64 1
  %153 = load float* %152, align 4
  %154 = fpext float %153 to double
  %155 = fmul double %150, %154
  %156 = fadd double %148, %155
  %157 = getelementptr inbounds %struct.vec3* %dir, i32 0, i32 2
  %158 = load double* %157, align 8
  %159 = getelementptr inbounds [3 x [3 x float]]* %m, i32 0, i64 0
  %160 = getelementptr inbounds [3 x float]* %159, i32 0, i64 2
  %161 = load float* %160, align 4
  %162 = fpext float %161 to double
  %163 = fmul double %158, %162
  %164 = fadd double %156, %163
  %165 = getelementptr inbounds %struct.vec3* %foo, i32 0, i32 0
  store double %164, double* %165, align 8
  %166 = getelementptr inbounds %struct.vec3* %dir, i32 0, i32 0
  %167 = load double* %166, align 8
  %168 = getelementptr inbounds [3 x [3 x float]]* %m, i32 0, i64 1
  %169 = getelementptr inbounds [3 x float]* %168, i32 0, i64 0
  %170 = load float* %169, align 4
  %171 = fpext float %170 to double
  %172 = fmul double %167, %171
  %173 = getelementptr inbounds %struct.vec3* %dir, i32 0, i32 1
  %174 = load double* %173, align 8
  %175 = getelementptr inbounds [3 x [3 x float]]* %m, i32 0, i64 1
  %176 = getelementptr inbounds [3 x float]* %175, i32 0, i64 1
  %177 = load float* %176, align 4
  %178 = fpext float %177 to double
  %179 = fmul double %174, %178
  %180 = fadd double %172, %179
  %181 = getelementptr inbounds %struct.vec3* %dir, i32 0, i32 2
  %182 = load double* %181, align 8
  %183 = getelementptr inbounds [3 x [3 x float]]* %m, i32 0, i64 1
  %184 = getelementptr inbounds [3 x float]* %183, i32 0, i64 2
  %185 = load float* %184, align 4
  %186 = fpext float %185 to double
  %187 = fmul double %182, %186
  %188 = fadd double %180, %187
  %189 = getelementptr inbounds %struct.vec3* %foo, i32 0, i32 1
  store double %188, double* %189, align 8
  %190 = getelementptr inbounds %struct.vec3* %dir, i32 0, i32 0
  %191 = load double* %190, align 8
  %192 = getelementptr inbounds [3 x [3 x float]]* %m, i32 0, i64 2
  %193 = getelementptr inbounds [3 x float]* %192, i32 0, i64 0
  %194 = load float* %193, align 4
  %195 = fpext float %194 to double
  %196 = fmul double %191, %195
  %197 = getelementptr inbounds %struct.vec3* %dir, i32 0, i32 1
  %198 = load double* %197, align 8
  %199 = getelementptr inbounds [3 x [3 x float]]* %m, i32 0, i64 2
  %200 = getelementptr inbounds [3 x float]* %199, i32 0, i64 1
  %201 = load float* %200, align 4
  %202 = fpext float %201 to double
  %203 = fmul double %198, %202
  %204 = fadd double %196, %203
  %205 = getelementptr inbounds %struct.vec3* %dir, i32 0, i32 2
  %206 = load double* %205, align 8
  %207 = getelementptr inbounds [3 x [3 x float]]* %m, i32 0, i64 2
  %208 = getelementptr inbounds [3 x float]* %207, i32 0, i64 2
  %209 = load float* %208, align 4
  %210 = fpext float %209 to double
  %211 = fmul double %206, %210
  %212 = fadd double %204, %211
  %213 = getelementptr inbounds %struct.vec3* %foo, i32 0, i32 2
  store double %212, double* %213, align 8
  %214 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 0
  %215 = getelementptr inbounds %struct.vec3* %214, i32 0, i32 0
  %216 = load double* %215, align 8
  %217 = getelementptr inbounds [3 x [3 x float]]* %m, i32 0, i64 0
  %218 = getelementptr inbounds [3 x float]* %217, i32 0, i64 0
  %219 = load float* %218, align 4
  %220 = fpext float %219 to double
  %221 = fmul double %216, %220
  %222 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 0
  %223 = getelementptr inbounds %struct.vec3* %222, i32 0, i32 1
  %224 = load double* %223, align 8
  %225 = getelementptr inbounds [3 x [3 x float]]* %m, i32 0, i64 0
  %226 = getelementptr inbounds [3 x float]* %225, i32 0, i64 1
  %227 = load float* %226, align 4
  %228 = fpext float %227 to double
  %229 = fmul double %224, %228
  %230 = fadd double %221, %229
  %231 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 0
  %232 = getelementptr inbounds %struct.vec3* %231, i32 0, i32 2
  %233 = load double* %232, align 8
  %234 = getelementptr inbounds [3 x [3 x float]]* %m, i32 0, i64 0
  %235 = getelementptr inbounds [3 x float]* %234, i32 0, i64 2
  %236 = load float* %235, align 4
  %237 = fpext float %236 to double
  %238 = fmul double %233, %237
  %239 = fadd double %230, %238
  %240 = load double* getelementptr inbounds (%struct.camera* @cam, i32 0, i32 0, i32 0), align 8
  %241 = fadd double %239, %240
  %242 = getelementptr inbounds %struct.vec3* %orig, i32 0, i32 0
  store double %241, double* %242, align 8
  %243 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 0
  %244 = getelementptr inbounds %struct.vec3* %243, i32 0, i32 0
  %245 = load double* %244, align 8
  %246 = getelementptr inbounds [3 x [3 x float]]* %m, i32 0, i64 1
  %247 = getelementptr inbounds [3 x float]* %246, i32 0, i64 0
  %248 = load float* %247, align 4
  %249 = fpext float %248 to double
  %250 = fmul double %245, %249
  %251 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 0
  %252 = getelementptr inbounds %struct.vec3* %251, i32 0, i32 1
  %253 = load double* %252, align 8
  %254 = getelementptr inbounds [3 x [3 x float]]* %m, i32 0, i64 1
  %255 = getelementptr inbounds [3 x float]* %254, i32 0, i64 1
  %256 = load float* %255, align 4
  %257 = fpext float %256 to double
  %258 = fmul double %253, %257
  %259 = fadd double %250, %258
  %260 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 0
  %261 = getelementptr inbounds %struct.vec3* %260, i32 0, i32 2
  %262 = load double* %261, align 8
  %263 = getelementptr inbounds [3 x [3 x float]]* %m, i32 0, i64 1
  %264 = getelementptr inbounds [3 x float]* %263, i32 0, i64 2
  %265 = load float* %264, align 4
  %266 = fpext float %265 to double
  %267 = fmul double %262, %266
  %268 = fadd double %259, %267
  %269 = load double* getelementptr inbounds (%struct.camera* @cam, i32 0, i32 0, i32 1), align 8
  %270 = fadd double %268, %269
  %271 = getelementptr inbounds %struct.vec3* %orig, i32 0, i32 1
  store double %270, double* %271, align 8
  %272 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 0
  %273 = getelementptr inbounds %struct.vec3* %272, i32 0, i32 0
  %274 = load double* %273, align 8
  %275 = getelementptr inbounds [3 x [3 x float]]* %m, i32 0, i64 2
  %276 = getelementptr inbounds [3 x float]* %275, i32 0, i64 0
  %277 = load float* %276, align 4
  %278 = fpext float %277 to double
  %279 = fmul double %274, %278
  %280 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 0
  %281 = getelementptr inbounds %struct.vec3* %280, i32 0, i32 1
  %282 = load double* %281, align 8
  %283 = getelementptr inbounds [3 x [3 x float]]* %m, i32 0, i64 2
  %284 = getelementptr inbounds [3 x float]* %283, i32 0, i64 1
  %285 = load float* %284, align 4
  %286 = fpext float %285 to double
  %287 = fmul double %282, %286
  %288 = fadd double %279, %287
  %289 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 0
  %290 = getelementptr inbounds %struct.vec3* %289, i32 0, i32 2
  %291 = load double* %290, align 8
  %292 = getelementptr inbounds [3 x [3 x float]]* %m, i32 0, i64 2
  %293 = getelementptr inbounds [3 x float]* %292, i32 0, i64 2
  %294 = load float* %293, align 4
  %295 = fpext float %294 to double
  %296 = fmul double %291, %295
  %297 = fadd double %288, %296
  %298 = load double* getelementptr inbounds (%struct.camera* @cam, i32 0, i32 0, i32 2), align 8
  %299 = fadd double %297, %298
  %300 = getelementptr inbounds %struct.vec3* %orig, i32 0, i32 2
  store double %299, double* %300, align 8
  %301 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 0
  %302 = bitcast %struct.vec3* %301 to i8*
  %303 = bitcast %struct.vec3* %orig to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %302, i8* %303, i64 24, i32 8, i1 false)
  %304 = getelementptr inbounds %struct.vec3* %foo, i32 0, i32 0
  %305 = load double* %304, align 8
  %306 = getelementptr inbounds %struct.vec3* %orig, i32 0, i32 0
  %307 = load double* %306, align 8
  %308 = fadd double %305, %307
  %309 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 1
  %310 = getelementptr inbounds %struct.vec3* %309, i32 0, i32 0
  store double %308, double* %310, align 8
  %311 = getelementptr inbounds %struct.vec3* %foo, i32 0, i32 1
  %312 = load double* %311, align 8
  %313 = getelementptr inbounds %struct.vec3* %orig, i32 0, i32 1
  %314 = load double* %313, align 8
  %315 = fadd double %312, %314
  %316 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 1
  %317 = getelementptr inbounds %struct.vec3* %316, i32 0, i32 1
  store double %315, double* %317, align 8
  %318 = getelementptr inbounds %struct.vec3* %foo, i32 0, i32 2
  %319 = load double* %318, align 8
  %320 = getelementptr inbounds %struct.vec3* %orig, i32 0, i32 2
  %321 = load double* %320, align 8
  %322 = fadd double %319, %321
  %323 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 1
  %324 = getelementptr inbounds %struct.vec3* %323, i32 0, i32 2
  store double %322, double* %324, align 8
  %325 = bitcast %struct.ray* %agg.result to i8*
  %326 = bitcast %struct.ray* %ray to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %325, i8* %326, i64 48, i32 8, i1 false)
  ret void
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #5

; Function Attrs: nounwind uwtable
define i32 @ray_sphere(%struct.sphere* %sph, %struct.ray* byval align 8 %ray, %struct.spoint* %sp) #0 {
  %1 = alloca %struct.vec3, align 8
  %2 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 1
  %3 = getelementptr inbounds %struct.vec3* %2, i32 0, i32 0
  %4 = load double* %3, align 8
  %5 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 1
  %6 = getelementptr inbounds %struct.vec3* %5, i32 0, i32 0
  %7 = load double* %6, align 8
  %8 = fmul double %4, %7
  %9 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 1
  %10 = getelementptr inbounds %struct.vec3* %9, i32 0, i32 1
  %11 = load double* %10, align 8
  %12 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 1
  %13 = getelementptr inbounds %struct.vec3* %12, i32 0, i32 1
  %14 = load double* %13, align 8
  %15 = fmul double %11, %14
  %16 = fadd double %8, %15
  %17 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 1
  %18 = getelementptr inbounds %struct.vec3* %17, i32 0, i32 2
  %19 = load double* %18, align 8
  %20 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 1
  %21 = getelementptr inbounds %struct.vec3* %20, i32 0, i32 2
  %22 = load double* %21, align 8
  %23 = fmul double %19, %22
  %24 = fadd double %16, %23
  %25 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 1
  %26 = getelementptr inbounds %struct.vec3* %25, i32 0, i32 0
  %27 = load double* %26, align 8
  %28 = fmul double 2.000000e+00, %27
  %29 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 0
  %30 = getelementptr inbounds %struct.vec3* %29, i32 0, i32 0
  %31 = load double* %30, align 8
  %32 = getelementptr inbounds %struct.sphere* %sph, i32 0, i32 0
  %33 = getelementptr inbounds %struct.vec3* %32, i32 0, i32 0
  %34 = load double* %33, align 8
  %35 = fsub double %31, %34
  %36 = fmul double %28, %35
  %37 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 1
  %38 = getelementptr inbounds %struct.vec3* %37, i32 0, i32 1
  %39 = load double* %38, align 8
  %40 = fmul double 2.000000e+00, %39
  %41 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 0
  %42 = getelementptr inbounds %struct.vec3* %41, i32 0, i32 1
  %43 = load double* %42, align 8
  %44 = getelementptr inbounds %struct.sphere* %sph, i32 0, i32 0
  %45 = getelementptr inbounds %struct.vec3* %44, i32 0, i32 1
  %46 = load double* %45, align 8
  %47 = fsub double %43, %46
  %48 = fmul double %40, %47
  %49 = fadd double %36, %48
  %50 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 1
  %51 = getelementptr inbounds %struct.vec3* %50, i32 0, i32 2
  %52 = load double* %51, align 8
  %53 = fmul double 2.000000e+00, %52
  %54 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 0
  %55 = getelementptr inbounds %struct.vec3* %54, i32 0, i32 2
  %56 = load double* %55, align 8
  %57 = getelementptr inbounds %struct.sphere* %sph, i32 0, i32 0
  %58 = getelementptr inbounds %struct.vec3* %57, i32 0, i32 2
  %59 = load double* %58, align 8
  %60 = fsub double %56, %59
  %61 = fmul double %53, %60
  %62 = fadd double %49, %61
  %63 = getelementptr inbounds %struct.sphere* %sph, i32 0, i32 0
  %64 = getelementptr inbounds %struct.vec3* %63, i32 0, i32 0
  %65 = load double* %64, align 8
  %66 = getelementptr inbounds %struct.sphere* %sph, i32 0, i32 0
  %67 = getelementptr inbounds %struct.vec3* %66, i32 0, i32 0
  %68 = load double* %67, align 8
  %69 = fmul double %65, %68
  %70 = getelementptr inbounds %struct.sphere* %sph, i32 0, i32 0
  %71 = getelementptr inbounds %struct.vec3* %70, i32 0, i32 1
  %72 = load double* %71, align 8
  %73 = getelementptr inbounds %struct.sphere* %sph, i32 0, i32 0
  %74 = getelementptr inbounds %struct.vec3* %73, i32 0, i32 1
  %75 = load double* %74, align 8
  %76 = fmul double %72, %75
  %77 = fadd double %69, %76
  %78 = getelementptr inbounds %struct.sphere* %sph, i32 0, i32 0
  %79 = getelementptr inbounds %struct.vec3* %78, i32 0, i32 2
  %80 = load double* %79, align 8
  %81 = getelementptr inbounds %struct.sphere* %sph, i32 0, i32 0
  %82 = getelementptr inbounds %struct.vec3* %81, i32 0, i32 2
  %83 = load double* %82, align 8
  %84 = fmul double %80, %83
  %85 = fadd double %77, %84
  %86 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 0
  %87 = getelementptr inbounds %struct.vec3* %86, i32 0, i32 0
  %88 = load double* %87, align 8
  %89 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 0
  %90 = getelementptr inbounds %struct.vec3* %89, i32 0, i32 0
  %91 = load double* %90, align 8
  %92 = fmul double %88, %91
  %93 = fadd double %85, %92
  %94 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 0
  %95 = getelementptr inbounds %struct.vec3* %94, i32 0, i32 1
  %96 = load double* %95, align 8
  %97 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 0
  %98 = getelementptr inbounds %struct.vec3* %97, i32 0, i32 1
  %99 = load double* %98, align 8
  %100 = fmul double %96, %99
  %101 = fadd double %93, %100
  %102 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 0
  %103 = getelementptr inbounds %struct.vec3* %102, i32 0, i32 2
  %104 = load double* %103, align 8
  %105 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 0
  %106 = getelementptr inbounds %struct.vec3* %105, i32 0, i32 2
  %107 = load double* %106, align 8
  %108 = fmul double %104, %107
  %109 = fadd double %101, %108
  %110 = getelementptr inbounds %struct.sphere* %sph, i32 0, i32 0
  %111 = getelementptr inbounds %struct.vec3* %110, i32 0, i32 0
  %112 = load double* %111, align 8
  %113 = fsub double -0.000000e+00, %112
  %114 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 0
  %115 = getelementptr inbounds %struct.vec3* %114, i32 0, i32 0
  %116 = load double* %115, align 8
  %117 = fmul double %113, %116
  %118 = getelementptr inbounds %struct.sphere* %sph, i32 0, i32 0
  %119 = getelementptr inbounds %struct.vec3* %118, i32 0, i32 1
  %120 = load double* %119, align 8
  %121 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 0
  %122 = getelementptr inbounds %struct.vec3* %121, i32 0, i32 1
  %123 = load double* %122, align 8
  %124 = fmul double %120, %123
  %125 = fsub double %117, %124
  %126 = getelementptr inbounds %struct.sphere* %sph, i32 0, i32 0
  %127 = getelementptr inbounds %struct.vec3* %126, i32 0, i32 2
  %128 = load double* %127, align 8
  %129 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 0
  %130 = getelementptr inbounds %struct.vec3* %129, i32 0, i32 2
  %131 = load double* %130, align 8
  %132 = fmul double %128, %131
  %133 = fsub double %125, %132
  %134 = fmul double 2.000000e+00, %133
  %135 = fadd double %109, %134
  %136 = getelementptr inbounds %struct.sphere* %sph, i32 0, i32 1
  %137 = load double* %136, align 8
  %138 = getelementptr inbounds %struct.sphere* %sph, i32 0, i32 1
  %139 = load double* %138, align 8
  %140 = fmul double %137, %139
  %141 = fsub double %135, %140
  %142 = fmul double %62, %62
  %143 = fmul double 4.000000e+00, %24
  %144 = fmul double %143, %141
  %145 = fsub double %142, %144
  %146 = fcmp olt double %145, 0.000000e+00
  br i1 %146, label %147, label %148

; <label>:147                                     ; preds = %0
  br label %297

; <label>:148                                     ; preds = %0
  %149 = call double @sqrt(double %145) #5
  %150 = fsub double -0.000000e+00, %62
  %151 = fadd double %150, %149
  %152 = fmul double 2.000000e+00, %24
  %153 = fdiv double %151, %152
  %154 = fsub double -0.000000e+00, %62
  %155 = fsub double %154, %149
  %156 = fmul double 2.000000e+00, %24
  %157 = fdiv double %155, %156
  %158 = fcmp olt double %153, 1.000000e-06
  br i1 %158, label %159, label %161

; <label>:159                                     ; preds = %148
  %160 = fcmp olt double %157, 1.000000e-06
  br i1 %160, label %165, label %161

; <label>:161                                     ; preds = %159, %148
  %162 = fcmp ogt double %153, 1.000000e+00
  br i1 %162, label %163, label %166

; <label>:163                                     ; preds = %161
  %164 = fcmp ogt double %157, 1.000000e+00
  br i1 %164, label %165, label %166

; <label>:165                                     ; preds = %163, %159
  br label %297

; <label>:166                                     ; preds = %163, %161
  %167 = icmp ne %struct.spoint* %sp, null
  br i1 %167, label %168, label %296

; <label>:168                                     ; preds = %166
  %169 = fcmp olt double %153, 1.000000e-06
  br i1 %169, label %170, label %171

; <label>:170                                     ; preds = %168
  br label %171

; <label>:171                                     ; preds = %170, %168
  %t1.0 = phi double [ %157, %170 ], [ %153, %168 ]
  %172 = fcmp olt double %157, 1.000000e-06
  br i1 %172, label %173, label %174

; <label>:173                                     ; preds = %171
  br label %174

; <label>:174                                     ; preds = %173, %171
  %t2.0 = phi double [ %t1.0, %173 ], [ %157, %171 ]
  %175 = fcmp olt double %t1.0, %t2.0
  br i1 %175, label %176, label %177

; <label>:176                                     ; preds = %174
  br label %178

; <label>:177                                     ; preds = %174
  br label %178

; <label>:178                                     ; preds = %177, %176
  %179 = phi double [ %t1.0, %176 ], [ %t2.0, %177 ]
  %180 = getelementptr inbounds %struct.spoint* %sp, i32 0, i32 3
  store double %179, double* %180, align 8
  %181 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 0
  %182 = getelementptr inbounds %struct.vec3* %181, i32 0, i32 0
  %183 = load double* %182, align 8
  %184 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 1
  %185 = getelementptr inbounds %struct.vec3* %184, i32 0, i32 0
  %186 = load double* %185, align 8
  %187 = getelementptr inbounds %struct.spoint* %sp, i32 0, i32 3
  %188 = load double* %187, align 8
  %189 = fmul double %186, %188
  %190 = fadd double %183, %189
  %191 = getelementptr inbounds %struct.spoint* %sp, i32 0, i32 0
  %192 = getelementptr inbounds %struct.vec3* %191, i32 0, i32 0
  store double %190, double* %192, align 8
  %193 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 0
  %194 = getelementptr inbounds %struct.vec3* %193, i32 0, i32 1
  %195 = load double* %194, align 8
  %196 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 1
  %197 = getelementptr inbounds %struct.vec3* %196, i32 0, i32 1
  %198 = load double* %197, align 8
  %199 = getelementptr inbounds %struct.spoint* %sp, i32 0, i32 3
  %200 = load double* %199, align 8
  %201 = fmul double %198, %200
  %202 = fadd double %195, %201
  %203 = getelementptr inbounds %struct.spoint* %sp, i32 0, i32 0
  %204 = getelementptr inbounds %struct.vec3* %203, i32 0, i32 1
  store double %202, double* %204, align 8
  %205 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 0
  %206 = getelementptr inbounds %struct.vec3* %205, i32 0, i32 2
  %207 = load double* %206, align 8
  %208 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 1
  %209 = getelementptr inbounds %struct.vec3* %208, i32 0, i32 2
  %210 = load double* %209, align 8
  %211 = getelementptr inbounds %struct.spoint* %sp, i32 0, i32 3
  %212 = load double* %211, align 8
  %213 = fmul double %210, %212
  %214 = fadd double %207, %213
  %215 = getelementptr inbounds %struct.spoint* %sp, i32 0, i32 0
  %216 = getelementptr inbounds %struct.vec3* %215, i32 0, i32 2
  store double %214, double* %216, align 8
  %217 = getelementptr inbounds %struct.spoint* %sp, i32 0, i32 0
  %218 = getelementptr inbounds %struct.vec3* %217, i32 0, i32 0
  %219 = load double* %218, align 8
  %220 = getelementptr inbounds %struct.sphere* %sph, i32 0, i32 0
  %221 = getelementptr inbounds %struct.vec3* %220, i32 0, i32 0
  %222 = load double* %221, align 8
  %223 = fsub double %219, %222
  %224 = getelementptr inbounds %struct.sphere* %sph, i32 0, i32 1
  %225 = load double* %224, align 8
  %226 = fdiv double %223, %225
  %227 = getelementptr inbounds %struct.spoint* %sp, i32 0, i32 1
  %228 = getelementptr inbounds %struct.vec3* %227, i32 0, i32 0
  store double %226, double* %228, align 8
  %229 = getelementptr inbounds %struct.spoint* %sp, i32 0, i32 0
  %230 = getelementptr inbounds %struct.vec3* %229, i32 0, i32 1
  %231 = load double* %230, align 8
  %232 = getelementptr inbounds %struct.sphere* %sph, i32 0, i32 0
  %233 = getelementptr inbounds %struct.vec3* %232, i32 0, i32 1
  %234 = load double* %233, align 8
  %235 = fsub double %231, %234
  %236 = getelementptr inbounds %struct.sphere* %sph, i32 0, i32 1
  %237 = load double* %236, align 8
  %238 = fdiv double %235, %237
  %239 = getelementptr inbounds %struct.spoint* %sp, i32 0, i32 1
  %240 = getelementptr inbounds %struct.vec3* %239, i32 0, i32 1
  store double %238, double* %240, align 8
  %241 = getelementptr inbounds %struct.spoint* %sp, i32 0, i32 0
  %242 = getelementptr inbounds %struct.vec3* %241, i32 0, i32 2
  %243 = load double* %242, align 8
  %244 = getelementptr inbounds %struct.sphere* %sph, i32 0, i32 0
  %245 = getelementptr inbounds %struct.vec3* %244, i32 0, i32 2
  %246 = load double* %245, align 8
  %247 = fsub double %243, %246
  %248 = getelementptr inbounds %struct.sphere* %sph, i32 0, i32 1
  %249 = load double* %248, align 8
  %250 = fdiv double %247, %249
  %251 = getelementptr inbounds %struct.spoint* %sp, i32 0, i32 1
  %252 = getelementptr inbounds %struct.vec3* %251, i32 0, i32 2
  store double %250, double* %252, align 8
  %253 = getelementptr inbounds %struct.spoint* %sp, i32 0, i32 2
  %254 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 1
  %255 = getelementptr inbounds %struct.spoint* %sp, i32 0, i32 1
  call void @reflect(%struct.vec3* sret %1, %struct.vec3* byval align 8 %254, %struct.vec3* byval align 8 %255)
  %256 = bitcast %struct.vec3* %253 to i8*
  %257 = bitcast %struct.vec3* %1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %256, i8* %257, i64 24, i32 8, i1 false)
  br label %258

; <label>:258                                     ; preds = %178
  %259 = getelementptr inbounds %struct.spoint* %sp, i32 0, i32 2
  %260 = getelementptr inbounds %struct.vec3* %259, i32 0, i32 0
  %261 = load double* %260, align 8
  %262 = getelementptr inbounds %struct.spoint* %sp, i32 0, i32 2
  %263 = getelementptr inbounds %struct.vec3* %262, i32 0, i32 0
  %264 = load double* %263, align 8
  %265 = fmul double %261, %264
  %266 = getelementptr inbounds %struct.spoint* %sp, i32 0, i32 2
  %267 = getelementptr inbounds %struct.vec3* %266, i32 0, i32 1
  %268 = load double* %267, align 8
  %269 = getelementptr inbounds %struct.spoint* %sp, i32 0, i32 2
  %270 = getelementptr inbounds %struct.vec3* %269, i32 0, i32 1
  %271 = load double* %270, align 8
  %272 = fmul double %268, %271
  %273 = fadd double %265, %272
  %274 = getelementptr inbounds %struct.spoint* %sp, i32 0, i32 2
  %275 = getelementptr inbounds %struct.vec3* %274, i32 0, i32 2
  %276 = load double* %275, align 8
  %277 = getelementptr inbounds %struct.spoint* %sp, i32 0, i32 2
  %278 = getelementptr inbounds %struct.vec3* %277, i32 0, i32 2
  %279 = load double* %278, align 8
  %280 = fmul double %276, %279
  %281 = fadd double %273, %280
  %282 = call double @sqrt(double %281) #5
  %283 = getelementptr inbounds %struct.spoint* %sp, i32 0, i32 2
  %284 = getelementptr inbounds %struct.vec3* %283, i32 0, i32 0
  %285 = load double* %284, align 8
  %286 = fdiv double %285, %282
  store double %286, double* %284, align 8
  %287 = getelementptr inbounds %struct.spoint* %sp, i32 0, i32 2
  %288 = getelementptr inbounds %struct.vec3* %287, i32 0, i32 1
  %289 = load double* %288, align 8
  %290 = fdiv double %289, %282
  store double %290, double* %288, align 8
  %291 = getelementptr inbounds %struct.spoint* %sp, i32 0, i32 2
  %292 = getelementptr inbounds %struct.vec3* %291, i32 0, i32 2
  %293 = load double* %292, align 8
  %294 = fdiv double %293, %282
  store double %294, double* %292, align 8
  br label %295

; <label>:295                                     ; preds = %258
  br label %296

; <label>:296                                     ; preds = %295, %166
  br label %297

; <label>:297                                     ; preds = %296, %165, %147
  %.0 = phi i32 [ 0, %147 ], [ 0, %165 ], [ 1, %296 ]
  ret i32 %.0
}

; Function Attrs: nounwind uwtable
define void @shade(%struct.vec3* noalias sret %agg.result, %struct.sphere* %obj, %struct.spoint* %sp, i32 %depth) #0 {
  %col = alloca %struct.vec3, align 8
  %ldir = alloca %struct.vec3, align 8
  %shadow_ray = alloca %struct.ray, align 8
  %ray = alloca %struct.ray, align 8
  %rcol = alloca %struct.vec3, align 8
  %1 = alloca %struct.vec3, align 8
  %2 = bitcast %struct.vec3* %col to i8*
  call void @llvm.memset.p0i8.i64(i8* %2, i8 0, i64 24, i32 8, i1 false)
  br label %3

; <label>:3                                       ; preds = %215, %0
  %i.0 = phi i32 [ 0, %0 ], [ %216, %215 ]
  %4 = load i32* @lnum, align 4
  %5 = icmp slt i32 %i.0, %4
  br i1 %5, label %6, label %217

; <label>:6                                       ; preds = %3
  %7 = load %struct.sphere** @obj_list, align 8
  %8 = getelementptr inbounds %struct.sphere* %7, i32 0, i32 3
  %9 = load %struct.sphere** %8, align 8
  %10 = sext i32 %i.0 to i64
  %11 = getelementptr inbounds [16 x %struct.vec3]* @lights, i32 0, i64 %10
  %12 = getelementptr inbounds %struct.vec3* %11, i32 0, i32 0
  %13 = load double* %12, align 8
  %14 = getelementptr inbounds %struct.spoint* %sp, i32 0, i32 0
  %15 = getelementptr inbounds %struct.vec3* %14, i32 0, i32 0
  %16 = load double* %15, align 8
  %17 = fsub double %13, %16
  %18 = getelementptr inbounds %struct.vec3* %ldir, i32 0, i32 0
  store double %17, double* %18, align 8
  %19 = sext i32 %i.0 to i64
  %20 = getelementptr inbounds [16 x %struct.vec3]* @lights, i32 0, i64 %19
  %21 = getelementptr inbounds %struct.vec3* %20, i32 0, i32 1
  %22 = load double* %21, align 8
  %23 = getelementptr inbounds %struct.spoint* %sp, i32 0, i32 0
  %24 = getelementptr inbounds %struct.vec3* %23, i32 0, i32 1
  %25 = load double* %24, align 8
  %26 = fsub double %22, %25
  %27 = getelementptr inbounds %struct.vec3* %ldir, i32 0, i32 1
  store double %26, double* %27, align 8
  %28 = sext i32 %i.0 to i64
  %29 = getelementptr inbounds [16 x %struct.vec3]* @lights, i32 0, i64 %28
  %30 = getelementptr inbounds %struct.vec3* %29, i32 0, i32 2
  %31 = load double* %30, align 8
  %32 = getelementptr inbounds %struct.spoint* %sp, i32 0, i32 0
  %33 = getelementptr inbounds %struct.vec3* %32, i32 0, i32 2
  %34 = load double* %33, align 8
  %35 = fsub double %31, %34
  %36 = getelementptr inbounds %struct.vec3* %ldir, i32 0, i32 2
  store double %35, double* %36, align 8
  %37 = getelementptr inbounds %struct.ray* %shadow_ray, i32 0, i32 0
  %38 = getelementptr inbounds %struct.spoint* %sp, i32 0, i32 0
  %39 = bitcast %struct.vec3* %37 to i8*
  %40 = bitcast %struct.vec3* %38 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %39, i8* %40, i64 24, i32 8, i1 false)
  %41 = getelementptr inbounds %struct.ray* %shadow_ray, i32 0, i32 1
  %42 = bitcast %struct.vec3* %41 to i8*
  %43 = bitcast %struct.vec3* %ldir to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %42, i8* %43, i64 24, i32 8, i1 false)
  br label %44

; <label>:44                                      ; preds = %50, %6
  %iter.0 = phi %struct.sphere* [ %9, %6 ], [ %52, %50 ]
  %45 = icmp ne %struct.sphere* %iter.0, null
  br i1 %45, label %46, label %53

; <label>:46                                      ; preds = %44
  %47 = call i32 @ray_sphere(%struct.sphere* %iter.0, %struct.ray* byval align 8 %shadow_ray, %struct.spoint* null)
  %48 = icmp ne i32 %47, 0
  br i1 %48, label %49, label %50

; <label>:49                                      ; preds = %46
  br label %53

; <label>:50                                      ; preds = %46
  %51 = getelementptr inbounds %struct.sphere* %iter.0, i32 0, i32 3
  %52 = load %struct.sphere** %51, align 8
  br label %44

; <label>:53                                      ; preds = %49, %44
  %in_shadow.0 = phi i32 [ 1, %49 ], [ 0, %44 ]
  %54 = icmp ne i32 %in_shadow.0, 0
  br i1 %54, label %214, label %55

; <label>:55                                      ; preds = %53
  br label %56

; <label>:56                                      ; preds = %55
  %57 = getelementptr inbounds %struct.vec3* %ldir, i32 0, i32 0
  %58 = load double* %57, align 8
  %59 = getelementptr inbounds %struct.vec3* %ldir, i32 0, i32 0
  %60 = load double* %59, align 8
  %61 = fmul double %58, %60
  %62 = getelementptr inbounds %struct.vec3* %ldir, i32 0, i32 1
  %63 = load double* %62, align 8
  %64 = getelementptr inbounds %struct.vec3* %ldir, i32 0, i32 1
  %65 = load double* %64, align 8
  %66 = fmul double %63, %65
  %67 = fadd double %61, %66
  %68 = getelementptr inbounds %struct.vec3* %ldir, i32 0, i32 2
  %69 = load double* %68, align 8
  %70 = getelementptr inbounds %struct.vec3* %ldir, i32 0, i32 2
  %71 = load double* %70, align 8
  %72 = fmul double %69, %71
  %73 = fadd double %67, %72
  %74 = call double @sqrt(double %73) #5
  %75 = getelementptr inbounds %struct.vec3* %ldir, i32 0, i32 0
  %76 = load double* %75, align 8
  %77 = fdiv double %76, %74
  store double %77, double* %75, align 8
  %78 = getelementptr inbounds %struct.vec3* %ldir, i32 0, i32 1
  %79 = load double* %78, align 8
  %80 = fdiv double %79, %74
  store double %80, double* %78, align 8
  %81 = getelementptr inbounds %struct.vec3* %ldir, i32 0, i32 2
  %82 = load double* %81, align 8
  %83 = fdiv double %82, %74
  store double %83, double* %81, align 8
  br label %84

; <label>:84                                      ; preds = %56
  %85 = getelementptr inbounds %struct.spoint* %sp, i32 0, i32 1
  %86 = getelementptr inbounds %struct.vec3* %85, i32 0, i32 0
  %87 = load double* %86, align 8
  %88 = getelementptr inbounds %struct.vec3* %ldir, i32 0, i32 0
  %89 = load double* %88, align 8
  %90 = fmul double %87, %89
  %91 = getelementptr inbounds %struct.spoint* %sp, i32 0, i32 1
  %92 = getelementptr inbounds %struct.vec3* %91, i32 0, i32 1
  %93 = load double* %92, align 8
  %94 = getelementptr inbounds %struct.vec3* %ldir, i32 0, i32 1
  %95 = load double* %94, align 8
  %96 = fmul double %93, %95
  %97 = fadd double %90, %96
  %98 = getelementptr inbounds %struct.spoint* %sp, i32 0, i32 1
  %99 = getelementptr inbounds %struct.vec3* %98, i32 0, i32 2
  %100 = load double* %99, align 8
  %101 = getelementptr inbounds %struct.vec3* %ldir, i32 0, i32 2
  %102 = load double* %101, align 8
  %103 = fmul double %100, %102
  %104 = fadd double %97, %103
  %105 = fcmp ogt double %104, 0.000000e+00
  br i1 %105, label %106, label %127

; <label>:106                                     ; preds = %84
  %107 = getelementptr inbounds %struct.spoint* %sp, i32 0, i32 1
  %108 = getelementptr inbounds %struct.vec3* %107, i32 0, i32 0
  %109 = load double* %108, align 8
  %110 = getelementptr inbounds %struct.vec3* %ldir, i32 0, i32 0
  %111 = load double* %110, align 8
  %112 = fmul double %109, %111
  %113 = getelementptr inbounds %struct.spoint* %sp, i32 0, i32 1
  %114 = getelementptr inbounds %struct.vec3* %113, i32 0, i32 1
  %115 = load double* %114, align 8
  %116 = getelementptr inbounds %struct.vec3* %ldir, i32 0, i32 1
  %117 = load double* %116, align 8
  %118 = fmul double %115, %117
  %119 = fadd double %112, %118
  %120 = getelementptr inbounds %struct.spoint* %sp, i32 0, i32 1
  %121 = getelementptr inbounds %struct.vec3* %120, i32 0, i32 2
  %122 = load double* %121, align 8
  %123 = getelementptr inbounds %struct.vec3* %ldir, i32 0, i32 2
  %124 = load double* %123, align 8
  %125 = fmul double %122, %124
  %126 = fadd double %119, %125
  br label %128

; <label>:127                                     ; preds = %84
  br label %128

; <label>:128                                     ; preds = %127, %106
  %129 = phi double [ %126, %106 ], [ 0.000000e+00, %127 ]
  %130 = getelementptr inbounds %struct.sphere* %obj, i32 0, i32 2
  %131 = getelementptr inbounds %struct.material* %130, i32 0, i32 1
  %132 = load double* %131, align 8
  %133 = fcmp ogt double %132, 0.000000e+00
  br i1 %133, label %134, label %184

; <label>:134                                     ; preds = %128
  %135 = getelementptr inbounds %struct.spoint* %sp, i32 0, i32 2
  %136 = getelementptr inbounds %struct.vec3* %135, i32 0, i32 0
  %137 = load double* %136, align 8
  %138 = getelementptr inbounds %struct.vec3* %ldir, i32 0, i32 0
  %139 = load double* %138, align 8
  %140 = fmul double %137, %139
  %141 = getelementptr inbounds %struct.spoint* %sp, i32 0, i32 2
  %142 = getelementptr inbounds %struct.vec3* %141, i32 0, i32 1
  %143 = load double* %142, align 8
  %144 = getelementptr inbounds %struct.vec3* %ldir, i32 0, i32 1
  %145 = load double* %144, align 8
  %146 = fmul double %143, %145
  %147 = fadd double %140, %146
  %148 = getelementptr inbounds %struct.spoint* %sp, i32 0, i32 2
  %149 = getelementptr inbounds %struct.vec3* %148, i32 0, i32 2
  %150 = load double* %149, align 8
  %151 = getelementptr inbounds %struct.vec3* %ldir, i32 0, i32 2
  %152 = load double* %151, align 8
  %153 = fmul double %150, %152
  %154 = fadd double %147, %153
  %155 = fcmp ogt double %154, 0.000000e+00
  br i1 %155, label %156, label %177

; <label>:156                                     ; preds = %134
  %157 = getelementptr inbounds %struct.spoint* %sp, i32 0, i32 2
  %158 = getelementptr inbounds %struct.vec3* %157, i32 0, i32 0
  %159 = load double* %158, align 8
  %160 = getelementptr inbounds %struct.vec3* %ldir, i32 0, i32 0
  %161 = load double* %160, align 8
  %162 = fmul double %159, %161
  %163 = getelementptr inbounds %struct.spoint* %sp, i32 0, i32 2
  %164 = getelementptr inbounds %struct.vec3* %163, i32 0, i32 1
  %165 = load double* %164, align 8
  %166 = getelementptr inbounds %struct.vec3* %ldir, i32 0, i32 1
  %167 = load double* %166, align 8
  %168 = fmul double %165, %167
  %169 = fadd double %162, %168
  %170 = getelementptr inbounds %struct.spoint* %sp, i32 0, i32 2
  %171 = getelementptr inbounds %struct.vec3* %170, i32 0, i32 2
  %172 = load double* %171, align 8
  %173 = getelementptr inbounds %struct.vec3* %ldir, i32 0, i32 2
  %174 = load double* %173, align 8
  %175 = fmul double %172, %174
  %176 = fadd double %169, %175
  br label %178

; <label>:177                                     ; preds = %134
  br label %178

; <label>:178                                     ; preds = %177, %156
  %179 = phi double [ %176, %156 ], [ 0.000000e+00, %177 ]
  %180 = getelementptr inbounds %struct.sphere* %obj, i32 0, i32 2
  %181 = getelementptr inbounds %struct.material* %180, i32 0, i32 1
  %182 = load double* %181, align 8
  %183 = call double @pow(double %179, double %182) #5
  br label %185

; <label>:184                                     ; preds = %128
  br label %185

; <label>:185                                     ; preds = %184, %178
  %186 = phi double [ %183, %178 ], [ 0.000000e+00, %184 ]
  %187 = getelementptr inbounds %struct.sphere* %obj, i32 0, i32 2
  %188 = getelementptr inbounds %struct.material* %187, i32 0, i32 0
  %189 = getelementptr inbounds %struct.vec3* %188, i32 0, i32 0
  %190 = load double* %189, align 8
  %191 = fmul double %129, %190
  %192 = fadd double %191, %186
  %193 = getelementptr inbounds %struct.vec3* %col, i32 0, i32 0
  %194 = load double* %193, align 8
  %195 = fadd double %194, %192
  store double %195, double* %193, align 8
  %196 = getelementptr inbounds %struct.sphere* %obj, i32 0, i32 2
  %197 = getelementptr inbounds %struct.material* %196, i32 0, i32 0
  %198 = getelementptr inbounds %struct.vec3* %197, i32 0, i32 1
  %199 = load double* %198, align 8
  %200 = fmul double %129, %199
  %201 = fadd double %200, %186
  %202 = getelementptr inbounds %struct.vec3* %col, i32 0, i32 1
  %203 = load double* %202, align 8
  %204 = fadd double %203, %201
  store double %204, double* %202, align 8
  %205 = getelementptr inbounds %struct.sphere* %obj, i32 0, i32 2
  %206 = getelementptr inbounds %struct.material* %205, i32 0, i32 0
  %207 = getelementptr inbounds %struct.vec3* %206, i32 0, i32 2
  %208 = load double* %207, align 8
  %209 = fmul double %129, %208
  %210 = fadd double %209, %186
  %211 = getelementptr inbounds %struct.vec3* %col, i32 0, i32 2
  %212 = load double* %211, align 8
  %213 = fadd double %212, %210
  store double %213, double* %211, align 8
  br label %214

; <label>:214                                     ; preds = %185, %53
  br label %215

; <label>:215                                     ; preds = %214
  %216 = add nsw i32 %i.0, 1
  br label %3

; <label>:217                                     ; preds = %3
  %218 = getelementptr inbounds %struct.sphere* %obj, i32 0, i32 2
  %219 = getelementptr inbounds %struct.material* %218, i32 0, i32 2
  %220 = load double* %219, align 8
  %221 = fcmp ogt double %220, 0.000000e+00
  br i1 %221, label %222, label %273

; <label>:222                                     ; preds = %217
  %223 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 0
  %224 = getelementptr inbounds %struct.spoint* %sp, i32 0, i32 0
  %225 = bitcast %struct.vec3* %223 to i8*
  %226 = bitcast %struct.vec3* %224 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %225, i8* %226, i64 24, i32 8, i1 false)
  %227 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 1
  %228 = getelementptr inbounds %struct.spoint* %sp, i32 0, i32 2
  %229 = bitcast %struct.vec3* %227 to i8*
  %230 = bitcast %struct.vec3* %228 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %229, i8* %230, i64 24, i32 8, i1 false)
  %231 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 1
  %232 = getelementptr inbounds %struct.vec3* %231, i32 0, i32 0
  %233 = load double* %232, align 8
  %234 = fmul double %233, 1.000000e+03
  store double %234, double* %232, align 8
  %235 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 1
  %236 = getelementptr inbounds %struct.vec3* %235, i32 0, i32 1
  %237 = load double* %236, align 8
  %238 = fmul double %237, 1.000000e+03
  store double %238, double* %236, align 8
  %239 = getelementptr inbounds %struct.ray* %ray, i32 0, i32 1
  %240 = getelementptr inbounds %struct.vec3* %239, i32 0, i32 2
  %241 = load double* %240, align 8
  %242 = fmul double %241, 1.000000e+03
  store double %242, double* %240, align 8
  %243 = add nsw i32 %depth, 1
  call void @trace(%struct.vec3* sret %1, %struct.ray* byval align 8 %ray, i32 %243)
  %244 = bitcast %struct.vec3* %rcol to i8*
  %245 = bitcast %struct.vec3* %1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %244, i8* %245, i64 24, i32 8, i1 false)
  %246 = getelementptr inbounds %struct.vec3* %rcol, i32 0, i32 0
  %247 = load double* %246, align 8
  %248 = getelementptr inbounds %struct.sphere* %obj, i32 0, i32 2
  %249 = getelementptr inbounds %struct.material* %248, i32 0, i32 2
  %250 = load double* %249, align 8
  %251 = fmul double %247, %250
  %252 = getelementptr inbounds %struct.vec3* %col, i32 0, i32 0
  %253 = load double* %252, align 8
  %254 = fadd double %253, %251
  store double %254, double* %252, align 8
  %255 = getelementptr inbounds %struct.vec3* %rcol, i32 0, i32 1
  %256 = load double* %255, align 8
  %257 = getelementptr inbounds %struct.sphere* %obj, i32 0, i32 2
  %258 = getelementptr inbounds %struct.material* %257, i32 0, i32 2
  %259 = load double* %258, align 8
  %260 = fmul double %256, %259
  %261 = getelementptr inbounds %struct.vec3* %col, i32 0, i32 1
  %262 = load double* %261, align 8
  %263 = fadd double %262, %260
  store double %263, double* %261, align 8
  %264 = getelementptr inbounds %struct.vec3* %rcol, i32 0, i32 2
  %265 = load double* %264, align 8
  %266 = getelementptr inbounds %struct.sphere* %obj, i32 0, i32 2
  %267 = getelementptr inbounds %struct.material* %266, i32 0, i32 2
  %268 = load double* %267, align 8
  %269 = fmul double %265, %268
  %270 = getelementptr inbounds %struct.vec3* %col, i32 0, i32 2
  %271 = load double* %270, align 8
  %272 = fadd double %271, %269
  store double %272, double* %270, align 8
  br label %273

; <label>:273                                     ; preds = %222, %217
  %274 = bitcast %struct.vec3* %agg.result to i8*
  %275 = bitcast %struct.vec3* %col to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %274, i8* %275, i64 24, i32 8, i1 false)
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
  %18 = fmul double 2.000000e+00, %17
  %19 = getelementptr inbounds %struct.vec3* %n, i32 0, i32 0
  %20 = load double* %19, align 8
  %21 = fmul double %18, %20
  %22 = getelementptr inbounds %struct.vec3* %v, i32 0, i32 0
  %23 = load double* %22, align 8
  %24 = fsub double %21, %23
  %25 = fsub double -0.000000e+00, %24
  %26 = getelementptr inbounds %struct.vec3* %res, i32 0, i32 0
  store double %25, double* %26, align 8
  %27 = fmul double 2.000000e+00, %17
  %28 = getelementptr inbounds %struct.vec3* %n, i32 0, i32 1
  %29 = load double* %28, align 8
  %30 = fmul double %27, %29
  %31 = getelementptr inbounds %struct.vec3* %v, i32 0, i32 1
  %32 = load double* %31, align 8
  %33 = fsub double %30, %32
  %34 = fsub double -0.000000e+00, %33
  %35 = getelementptr inbounds %struct.vec3* %res, i32 0, i32 1
  store double %34, double* %35, align 8
  %36 = fmul double 2.000000e+00, %17
  %37 = getelementptr inbounds %struct.vec3* %n, i32 0, i32 2
  %38 = load double* %37, align 8
  %39 = fmul double %36, %38
  %40 = getelementptr inbounds %struct.vec3* %v, i32 0, i32 2
  %41 = load double* %40, align 8
  %42 = fsub double %39, %41
  %43 = fsub double -0.000000e+00, %42
  %44 = getelementptr inbounds %struct.vec3* %res, i32 0, i32 2
  store double %43, double* %44, align 8
  %45 = bitcast %struct.vec3* %agg.result to i8*
  %46 = bitcast %struct.vec3* %res to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %45, i8* %46, i64 24, i32 8, i1 false)
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
  %pt = alloca %struct.vec3, align 8
  %jt = alloca %struct.vec3, align 8
  %1 = load i32* @xres, align 4
  %2 = sitofp i32 %1 to double
  %3 = load double* @aspect, align 8
  %4 = fdiv double %2, %3
  %5 = load double* @get_sample_pos.sf, align 8
  %6 = fcmp oeq double %5, 0.000000e+00
  br i1 %6, label %7, label %11

; <label>:7                                       ; preds = %0
  %8 = load i32* @xres, align 4
  %9 = sitofp i32 %8 to double
  %10 = fdiv double 2.000000e+00, %9
  store double %10, double* @get_sample_pos.sf, align 8
  br label %11

; <label>:11                                      ; preds = %7, %0
  %12 = sitofp i32 %x to double
  %13 = load i32* @xres, align 4
  %14 = sitofp i32 %13 to double
  %15 = fdiv double %12, %14
  %16 = fsub double %15, 5.000000e-01
  %17 = getelementptr inbounds %struct.vec3* %pt, i32 0, i32 0
  store double %16, double* %17, align 8
  %18 = sitofp i32 %y to double
  %19 = load i32* @yres, align 4
  %20 = sitofp i32 %19 to double
  %21 = fdiv double %18, %20
  %22 = fsub double %21, 6.500000e-01
  %23 = fsub double -0.000000e+00, %22
  %24 = load double* @aspect, align 8
  %25 = fdiv double %23, %24
  %26 = getelementptr inbounds %struct.vec3* %pt, i32 0, i32 1
  store double %25, double* %26, align 8
  %27 = icmp ne i32 %sample, 0
  br i1 %27, label %28, label %45

; <label>:28                                      ; preds = %11
  call void @jitter(%struct.vec3* sret %jt, i32 %x, i32 %y, i32 %sample)
  %29 = getelementptr inbounds %struct.vec3* %jt, i32 0, i32 0
  %30 = load double* %29, align 8
  %31 = load double* @get_sample_pos.sf, align 8
  %32 = fmul double %30, %31
  %33 = getelementptr inbounds %struct.vec3* %pt, i32 0, i32 0
  %34 = load double* %33, align 8
  %35 = fadd double %34, %32
  store double %35, double* %33, align 8
  %36 = getelementptr inbounds %struct.vec3* %jt, i32 0, i32 1
  %37 = load double* %36, align 8
  %38 = load double* @get_sample_pos.sf, align 8
  %39 = fmul double %37, %38
  %40 = load double* @aspect, align 8
  %41 = fdiv double %39, %40
  %42 = getelementptr inbounds %struct.vec3* %pt, i32 0, i32 1
  %43 = load double* %42, align 8
  %44 = fadd double %43, %41
  store double %44, double* %42, align 8
  br label %45

; <label>:45                                      ; preds = %28, %11
  %46 = bitcast %struct.vec3* %agg.result to i8*
  %47 = bitcast %struct.vec3* %pt to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %46, i8* %47, i64 24, i32 8, i1 false)
  ret void
}

; Function Attrs: nounwind uwtable
define void @jitter(%struct.vec3* noalias sret %agg.result, i32 %x, i32 %y, i32 %s) #0 {
  %pt = alloca %struct.vec3, align 8
  %1 = shl i32 %y, 2
  %2 = add nsw i32 %x, %1
  %3 = add nsw i32 %x, %s
  %4 = and i32 %3, 1023
  %5 = sext i32 %4 to i64
  %6 = getelementptr inbounds [1024 x i32]* @irand, i32 0, i64 %5
  %7 = load i32* %6, align 4
  %8 = add nsw i32 %2, %7
  %9 = and i32 %8, 1023
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds [1024 x %struct.vec3]* @urand, i32 0, i64 %10
  %12 = getelementptr inbounds %struct.vec3* %11, i32 0, i32 0
  %13 = load double* %12, align 8
  %14 = getelementptr inbounds %struct.vec3* %pt, i32 0, i32 0
  store double %13, double* %14, align 8
  %15 = shl i32 %x, 2
  %16 = add nsw i32 %y, %15
  %17 = add nsw i32 %y, %s
  %18 = and i32 %17, 1023
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds [1024 x i32]* @irand, i32 0, i64 %19
  %21 = load i32* %20, align 4
  %22 = add nsw i32 %16, %21
  %23 = and i32 %22, 1023
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds [1024 x %struct.vec3]* @urand, i32 0, i64 %24
  %26 = getelementptr inbounds %struct.vec3* %25, i32 0, i32 1
  %27 = load double* %26, align 8
  %28 = getelementptr inbounds %struct.vec3* %pt, i32 0, i32 1
  store double %27, double* %28, align 8
  %29 = bitcast %struct.vec3* %agg.result to i8*
  %30 = bitcast %struct.vec3* %pt to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %29, i8* %30, i64 24, i32 8, i1 false)
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
