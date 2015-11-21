; ModuleID = 'mv-search.ll'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.InputParameters = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, [8 x [2 x i32]], [8 x [2 x i32]], i32, i32, i32, i32, [200 x i8], [200 x i8], [200 x i8], [200 x i8], [200 x i8], i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, [1024 x i8], i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, double, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, [200 x i8], [200 x i8], i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, [200 x i8], i32, i32, i32*, i32*, i8*, i32*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, [8 x i32], i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, [6 x double], [200 x i8], i32 }
%struct.ImageParameters = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, float, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32**, i32**, i32, i32***, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, [9 x [16 x [16 x i16]]], [5 x [16 x [16 x i16]]], [9 x [8 x [8 x i16]]], [2 x [4 x [16 x [16 x i16]]]], [16 x [16 x i16]], [16 x [16 x i32]], i32****, i32***, %struct.Picture*, %struct.Slice*, %struct.macroblock*, [1200 x %struct.syntaxelement], i32*, i32*, i32, i32, i32, i32, [4 x [4 x i32]], i32, i32, i32, i32, i32, double, i32, i32, i32, i32, i16******, i16******, i16******, i16******, [15 x i16], i32, i32, i32, i32, i32, i32, i32, i32, [6 x [15 x i32]], i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, [1 x i32], i32, i32, [2 x i32], i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %struct.DecRefPicMarking_s*, i32, i32, i32, i32, i32, double, i32, i32, i32, i32, i32, i32, i32, double*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, [2 x i32], i32, i32, i32 }
%struct.Picture = type { i32, i32, [100 x %struct.Slice*], i32, float, float, float }
%struct.Slice = type { i32, i32, i32, i32, i32, i32, %struct.datapartition*, %struct.MotionInfoContexts*, %struct.TextureInfoContexts*, %struct.RMPNIbuffer_s*, i32, i32*, i32*, i32*, i32, i32*, i32*, i32*, i32 (i32)*, [3 x [2 x i32]] }
%struct.datapartition = type { %struct.Bitstream*, %struct.EncodingEnvironment, i32 (%struct.syntaxelement*, %struct.datapartition*)* }
%struct.Bitstream = type { i32, i32, i8, i32, i32, i8, i8, i32, i32, i8*, i32 }
%struct.EncodingEnvironment = type { i32, i32, i32, i32, i32, i8*, i32*, i32, i32, i32, i32, i32, i8*, i32*, i32, i32, i32, i32, i32, i32 }
%struct.syntaxelement = type { i32, i32, i32, i32, i32, i32, i32, i32, void (i32, i32, i32*, i32*)*, void (%struct.syntaxelement*, %struct.EncodingEnvironment*)* }
%struct.MotionInfoContexts = type { [3 x [11 x %struct.BiContextType]], [2 x [9 x %struct.BiContextType]], [2 x [10 x %struct.BiContextType]], [2 x [6 x %struct.BiContextType]], [4 x %struct.BiContextType], [4 x %struct.BiContextType], [3 x %struct.BiContextType] }
%struct.BiContextType = type { i16, i8, i64 }
%struct.TextureInfoContexts = type { [2 x %struct.BiContextType], [4 x %struct.BiContextType], [3 x [4 x %struct.BiContextType]], [10 x [4 x %struct.BiContextType]], [10 x [15 x %struct.BiContextType]], [10 x [15 x %struct.BiContextType]], [10 x [5 x %struct.BiContextType]], [10 x [5 x %struct.BiContextType]], [10 x [15 x %struct.BiContextType]], [10 x [15 x %struct.BiContextType]] }
%struct.RMPNIbuffer_s = type { i32, i32, %struct.RMPNIbuffer_s* }
%struct.macroblock = type { i32, i32, i32, i32, i32, [8 x i32], %struct.macroblock*, %struct.macroblock*, i32, [2 x [4 x [4 x [2 x i32]]]], [16 x i32], [16 x i32], i32, i64, [4 x i32], [4 x i32], i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, double, i32, i32, i32, i32, i32, i32, i32, i32, i32 }
%struct.DecRefPicMarking_s = type { i32, i32, i32, i32, i32, %struct.DecRefPicMarking_s* }
%struct.pic_parameter_set_rbsp_t = type { i32, i32, i32, i32, i32, i32, [8 x i32], i32, i32, i32, [8 x i32], [8 x i32], [8 x i32], i32, i32, i32, i8*, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }
%struct.storable_picture = type { i32, i32, i32, i32, i32, i32, [6 x [33 x i64]], [6 x [33 x i64]], [6 x [33 x i64]], [6 x [33 x i64]], i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i16**, i16*, i16*, i16**, i16**, i16***, i8*, i16***, i64***, i64***, i16****, i8**, i8**, %struct.storable_picture*, %struct.storable_picture*, %struct.storable_picture*, i32, i32, i32, i32, i32, i32, i32 }
%struct.colocated_params = type { i32, i32, i32, [6 x [33 x i64]], i16***, i64***, i16****, i8**, [6 x [33 x i64]], i16***, i64***, i16****, i8**, [6 x [33 x i64]], i16***, i64***, i16****, i8**, i32, i8** }
%struct.seq_parameter_set_rbsp_t = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, [8 x i32], i32, i32, i32, i32, i32, i32, i32, i32, i32, [256 x i32], i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %struct.vui_seq_parameters_t }
%struct.vui_seq_parameters_t = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, %struct.hrd_parameters_t, i32, %struct.hrd_parameters_t, i32, i32, i32, i32, i32, i32, i32, i32, i32 }
%struct.hrd_parameters_t = type { i32, i32, i32, [32 x i32], [32 x i32], [32 x i32], i32, i32, i32, i32 }
%struct.GOP_DATA = type { i32, i32, i32, i32, i32, i32 }
%struct.RD_DATA = type { double, [16 x [16 x i32]], [16 x [16 x i32]], [16 x [16 x i32]], i32****, i32***, i32, i32, [4 x i32], [4 x i32], i32**, [16 x i32], i32, i64, i32, i16******, i16******, i16******, i16******, [2 x [4 x [4 x i16]]], i32, i32, i32, i32, i32, i32, i32 }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.pix_pos = type { i32, i32, i32, i32, i32, i32 }
%struct.timeb = type { i64, i16, i16, i16 }

@QP2QUANT = constant [40 x i32] [i32 1, i32 1, i32 1, i32 1, i32 2, i32 2, i32 2, i32 2, i32 3, i32 3, i32 3, i32 4, i32 4, i32 4, i32 5, i32 6, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 13, i32 14, i32 16, i32 18, i32 20, i32 23, i32 25, i32 29, i32 32, i32 36, i32 40, i32 45, i32 51, i32 57, i32 64, i32 72, i32 81, i32 91], align 16
@input = external global %struct.InputParameters*
@BlockSAD = internal global i32***** null, align 8
@.str = private unnamed_addr constant [42 x i8] c"InitializeFastFullIntegerSearch: BlockSAD\00", align 1
@img = external global %struct.ImageParameters*
@search_setup_done = internal global i32** null, align 8
@.str1 = private unnamed_addr constant [51 x i8] c"InitializeFastFullIntegerSearch: search_setup_done\00", align 1
@search_center_x = internal global i32** null, align 8
@.str2 = private unnamed_addr constant [49 x i8] c"InitializeFastFullIntegerSearch: search_center_x\00", align 1
@search_center_y = internal global i32** null, align 8
@.str3 = private unnamed_addr constant [49 x i8] c"InitializeFastFullIntegerSearch: search_center_y\00", align 1
@pos_00 = internal global i32** null, align 8
@.str4 = private unnamed_addr constant [40 x i8] c"InitializeFastFullIntegerSearch: pos_00\00", align 1
@max_search_range = internal global i32** null, align 8
@.str5 = private unnamed_addr constant [50 x i8] c"InitializeFastFullIntegerSearch: max_search_range\00", align 1
@active_pps = common global %struct.pic_parameter_set_rbsp_t* null, align 8
@listX = external global [6 x %struct.storable_picture**]
@enc_picture = external global %struct.storable_picture*
@imgY_org = common global i16** null, align 8
@PelYline_11 = internal global i16* (i16*, i32, i32, i32, i32)* null, align 8
@spiral_search_x = common global i32* null, align 8
@spiral_search_y = common global i32* null, align 8
@byte_abs = common global i32* null, align 8
@pred_SAD_space = common global i32 0, align 4
@FME_blocktype = common global i32 0, align 4
@all_bwmincost = common global i32***** null, align 8
@all_mincost = common global i32***** null, align 8
@max_mvd = common global i32 0, align 4
@.str6 = private unnamed_addr constant [43 x i8] c"Init_Motion_Search_Module: spiral_search_x\00", align 1
@.str7 = private unnamed_addr constant [43 x i8] c"Init_Motion_Search_Module: spiral_search_y\00", align 1
@mvbits = common global i32* null, align 8
@.str8 = private unnamed_addr constant [34 x i8] c"Init_Motion_Search_Module: mvbits\00", align 1
@refbits = common global i32* null, align 8
@.str9 = private unnamed_addr constant [35 x i8] c"Init_Motion_Search_Module: refbits\00", align 1
@.str10 = private unnamed_addr constant [36 x i8] c"Init_Motion_Search_Module: byte_abs\00", align 1
@motion_cost = common global i32**** null, align 8
@PelY_14 = internal global i16 (i16**, i32, i32, i32, i32)* null, align 8
@wbp_weight = common global i32**** null, align 8
@luma_log_weight_denom = common global i32 0, align 4
@wp_offset = common global i32*** null, align 8
@wp_luma_round = common global i32 0, align 4
@PelY_14b = internal global i16 (i16**, i32, i32, i32, i32)* null, align 8
@BPredPartitionCost.bx0 = internal global [5 x [4 x i32]] [[4 x i32] zeroinitializer, [4 x i32] zeroinitializer, [4 x i32] zeroinitializer, [4 x i32] [i32 0, i32 2, i32 0, i32 0], [4 x i32] [i32 0, i32 2, i32 0, i32 2]], align 16
@BPredPartitionCost.by0 = internal global [5 x [4 x i32]] [[4 x i32] zeroinitializer, [4 x i32] zeroinitializer, [4 x i32] [i32 0, i32 2, i32 0, i32 0], [4 x i32] zeroinitializer, [4 x i32] [i32 0, i32 0, i32 2, i32 2]], align 16
@BlockMotionSearch.orig_val = internal global [256 x i16] zeroinitializer, align 16
@BlockMotionSearch.orig_pic = internal global [16 x i16*] [i16* getelementptr inbounds ([256 x i16]* @BlockMotionSearch.orig_val, i32 0, i32 0), i16* bitcast (i8* getelementptr (i8* bitcast ([256 x i16]* @BlockMotionSearch.orig_val to i8*), i64 32) to i16*), i16* bitcast (i8* getelementptr (i8* bitcast ([256 x i16]* @BlockMotionSearch.orig_val to i8*), i64 64) to i16*), i16* bitcast (i8* getelementptr (i8* bitcast ([256 x i16]* @BlockMotionSearch.orig_val to i8*), i64 96) to i16*), i16* bitcast (i8* getelementptr (i8* bitcast ([256 x i16]* @BlockMotionSearch.orig_val to i8*), i64 128) to i16*), i16* bitcast (i8* getelementptr (i8* bitcast ([256 x i16]* @BlockMotionSearch.orig_val to i8*), i64 160) to i16*), i16* bitcast (i8* getelementptr (i8* bitcast ([256 x i16]* @BlockMotionSearch.orig_val to i8*), i64 192) to i16*), i16* bitcast (i8* getelementptr (i8* bitcast ([256 x i16]* @BlockMotionSearch.orig_val to i8*), i64 224) to i16*), i16* bitcast (i8* getelementptr (i8* bitcast ([256 x i16]* @BlockMotionSearch.orig_val to i8*), i64 256) to i16*), i16* bitcast (i8* getelementptr (i8* bitcast ([256 x i16]* @BlockMotionSearch.orig_val to i8*), i64 288) to i16*), i16* bitcast (i8* getelementptr (i8* bitcast ([256 x i16]* @BlockMotionSearch.orig_val to i8*), i64 320) to i16*), i16* bitcast (i8* getelementptr (i8* bitcast ([256 x i16]* @BlockMotionSearch.orig_val to i8*), i64 352) to i16*), i16* bitcast (i8* getelementptr (i8* bitcast ([256 x i16]* @BlockMotionSearch.orig_val to i8*), i64 384) to i16*), i16* bitcast (i8* getelementptr (i8* bitcast ([256 x i16]* @BlockMotionSearch.orig_val to i8*), i64 416) to i16*), i16* bitcast (i8* getelementptr (i8* bitcast ([256 x i16]* @BlockMotionSearch.orig_val to i8*), i64 448) to i16*), i16* bitcast (i8* getelementptr (i8* bitcast ([256 x i16]* @BlockMotionSearch.orig_val to i8*), i64 480) to i16*)], align 16
@Bframe_ctr = common global i32 0, align 4
@pred_MV_uplayer = common global [2 x i32] zeroinitializer, align 4
@pred_SAD_uplayer = common global i32 0, align 4
@flag_intra_SAD = common global i32 0, align 4
@pred_SAD_time = common global i32 0, align 4
@pred_MV_time = common global [2 x i32] zeroinitializer, align 4
@pred_SAD_ref = common global i32 0, align 4
@pred_MV_ref = common global [2 x i32] zeroinitializer, align 4
@me_tot_time = common global i32 0, align 4
@me_time = common global i32 0, align 4
@BIDPartitionCost.bx0 = internal global [5 x [4 x i32]] [[4 x i32] zeroinitializer, [4 x i32] zeroinitializer, [4 x i32] zeroinitializer, [4 x i32] [i32 0, i32 2, i32 0, i32 0], [4 x i32] [i32 0, i32 2, i32 0, i32 2]], align 16
@BIDPartitionCost.by0 = internal global [5 x [4 x i32]] [[4 x i32] zeroinitializer, [4 x i32] zeroinitializer, [4 x i32] [i32 0, i32 2, i32 0, i32 0], [4 x i32] zeroinitializer, [4 x i32] [i32 0, i32 0, i32 2, i32 2]], align 16
@direct_pdir = common global i16** null, align 8
@direct_ref_idx = common global i16*** null, align 8
@PartitionMotionSearch.bx0 = internal global [5 x [4 x i32]] [[4 x i32] zeroinitializer, [4 x i32] zeroinitializer, [4 x i32] zeroinitializer, [4 x i32] [i32 0, i32 2, i32 0, i32 0], [4 x i32] [i32 0, i32 2, i32 0, i32 2]], align 16
@PartitionMotionSearch.by0 = internal global [5 x [4 x i32]] [[4 x i32] zeroinitializer, [4 x i32] zeroinitializer, [4 x i32] [i32 0, i32 2, i32 0, i32 0], [4 x i32] zeroinitializer, [4 x i32] [i32 0, i32 0, i32 2, i32 2]], align 16
@listXsize = external global [6 x i32]
@Co_located = external global %struct.colocated_params*
@top_pic = common global %struct.Picture* null, align 8
@bottom_pic = common global %struct.Picture* null, align 8
@frame_pic = common global %struct.Picture* null, align 8
@frame_pic2 = common global %struct.Picture* null, align 8
@frame_pic3 = common global %struct.Picture* null, align 8
@imgUV_org = common global i16*** null, align 8
@img4Y_tmp = common global i32** null, align 8
@log2_max_frame_num_minus4 = common global i32 0, align 4
@log2_max_pic_order_cnt_lsb_minus4 = common global i32 0, align 4
@active_sps = common global %struct.seq_parameter_set_rbsp_t* null, align 8
@mb_adaptive = common global i32 0, align 4
@MBPairIsField = common global i32 0, align 4
@wp_weight = common global i32*** null, align 8
@chroma_log_weight_denom = common global i32 0, align 4
@wp_chroma_round = common global i32 0, align 4
@imgY_org_top = common global i16** null, align 8
@imgY_org_bot = common global i16** null, align 8
@imgUV_org_top = common global i16*** null, align 8
@imgUV_org_bot = common global i16*** null, align 8
@imgY_org_frm = common global i16** null, align 8
@imgUV_org_frm = common global i16*** null, align 8
@imgY_com = common global i16** null, align 8
@imgUV_com = common global i16*** null, align 8
@pixel_map = common global i8** null, align 8
@refresh_map = common global i8** null, align 8
@intras = common global i32 0, align 4
@Iframe_ctr = common global i32 0, align 4
@Pframe_ctr = common global i32 0, align 4
@frame_no = common global i32 0, align 4
@nextP_tr_fld = common global i32 0, align 4
@nextP_tr_frm = common global i32 0, align 4
@tot_time = common global i32 0, align 4
@errortext = common global [300 x i8] zeroinitializer, align 16
@resTrans_R = common global [16 x [16 x i32]] zeroinitializer, align 16
@resTrans_G = common global [16 x [16 x i32]] zeroinitializer, align 16
@resTrans_B = common global [16 x [16 x i32]] zeroinitializer, align 16
@rec_resR = common global [16 x [16 x i32]] zeroinitializer, align 16
@rec_resG = common global [16 x [16 x i32]] zeroinitializer, align 16
@rec_resB = common global [16 x [16 x i32]] zeroinitializer, align 16
@mprRGB = common global [3 x [16 x [16 x i32]]] zeroinitializer, align 16
@dc_level = common global [2 x [4 x [4 x i32]]] zeroinitializer, align 16
@dc_level_temp = common global [2 x [4 x [4 x i32]]] zeroinitializer, align 16
@cbp_chroma_block = common global [2 x [4 x [4 x i32]]] zeroinitializer, align 16
@cbp_chroma_block_temp = common global [2 x [4 x [4 x i32]]] zeroinitializer, align 16
@b8_ipredmode8x8 = common global [4 x [4 x i32]] zeroinitializer, align 16
@b8_intra_pred_modes8x8 = common global [16 x i32] zeroinitializer, align 16
@gop_structure = common global %struct.GOP_DATA* null, align 8
@rdopt = common global %struct.RD_DATA* null, align 8
@rddata_top_frame_mb = common global %struct.RD_DATA zeroinitializer, align 8
@rddata_bot_frame_mb = common global %struct.RD_DATA zeroinitializer, align 8
@rddata_top_field_mb = common global %struct.RD_DATA zeroinitializer, align 8
@rddata_bot_field_mb = common global %struct.RD_DATA zeroinitializer, align 8
@p_stat = common global %struct._IO_FILE* null, align 8
@p_log = common global %struct._IO_FILE* null, align 8
@p_trace = common global %struct._IO_FILE* null, align 8
@p_in = common global i32 0, align 4
@p_dec = common global i32 0, align 4
@glob_remapping_of_pic_nums_idc_l0 = common global [20 x i32] zeroinitializer, align 16
@glob_abs_diff_pic_num_minus1_l0 = common global [20 x i32] zeroinitializer, align 16
@glob_long_term_pic_idx_l0 = common global [20 x i32] zeroinitializer, align 16
@glob_remapping_of_pic_nums_idc_l1 = common global [20 x i32] zeroinitializer, align 16
@glob_abs_diff_pic_num_minus1_l1 = common global [20 x i32] zeroinitializer, align 16
@glob_long_term_pic_idx_l1 = common global [20 x i32] zeroinitializer, align 16
@Bytes_After_Header = common global i32 0, align 4
@rpc_bytes_to_go = common global i32 0, align 4
@rpc_bits_to_go = common global i32 0, align 4
@McostState = common global i32** null, align 8
@Quantize_step = common global float 0.000000e+00, align 4
@Bsize = common global [8 x float] zeroinitializer, align 16
@Thresh4x4 = common global i32 0, align 4
@AlphaSec = common global [8 x float] zeroinitializer, align 16
@AlphaThird = common global [8 x float] zeroinitializer, align 16
@flag_intra = common global i32* null, align 8
@SearchState = common global i8** null, align 8

; Function Attrs: nounwind uwtable
define void @InitializeFastFullIntegerSearch() #0 {
  %1 = load %struct.InputParameters** @input, align 8
  %2 = getelementptr inbounds %struct.InputParameters* %1, i32 0, i32 8
  %3 = load i32* %2, align 4
  %4 = mul nsw i32 2, %3
  %5 = add nsw i32 %4, 1
  %6 = mul nsw i32 2, %3
  %7 = add nsw i32 %6, 1
  %8 = mul nsw i32 %5, %7
  %9 = call noalias i8* @malloc(i64 16) #3
  %10 = bitcast i8* %9 to i32*****
  store i32***** %10, i32****** @BlockSAD, align 8
  %11 = icmp eq i32***** %10, null
  br i1 %11, label %12, label %13

; <label>:12                                      ; preds = %0
  call void @no_mem_exit(i8* getelementptr inbounds ([42 x i8]* @.str, i32 0, i32 0))
  br label %13

; <label>:13                                      ; preds = %12, %0
  br label %14

; <label>:14                                      ; preds = %96, %13
  %list.0 = phi i32 [ 0, %13 ], [ %97, %96 ]
  %15 = icmp slt i32 %list.0, 2
  br i1 %15, label %16, label %98

; <label>:16                                      ; preds = %14
  %17 = load %struct.ImageParameters** @img, align 8
  %18 = getelementptr inbounds %struct.ImageParameters* %17, i32 0, i32 9
  %19 = load i32* %18, align 4
  %20 = add nsw i32 %19, 1
  %21 = sext i32 %20 to i64
  %22 = mul i64 %21, 8
  %23 = call noalias i8* @malloc(i64 %22) #3
  %24 = bitcast i8* %23 to i32****
  %25 = sext i32 %list.0 to i64
  %26 = load i32****** @BlockSAD, align 8
  %27 = getelementptr inbounds i32***** %26, i64 %25
  store i32**** %24, i32***** %27, align 8
  %28 = icmp eq i32**** %24, null
  br i1 %28, label %29, label %30

; <label>:29                                      ; preds = %16
  call void @no_mem_exit(i8* getelementptr inbounds ([42 x i8]* @.str, i32 0, i32 0))
  br label %30

; <label>:30                                      ; preds = %29, %16
  br label %31

; <label>:31                                      ; preds = %93, %30
  %i.0 = phi i32 [ 0, %30 ], [ %94, %93 ]
  %32 = load %struct.ImageParameters** @img, align 8
  %33 = getelementptr inbounds %struct.ImageParameters* %32, i32 0, i32 9
  %34 = load i32* %33, align 4
  %35 = icmp sle i32 %i.0, %34
  br i1 %35, label %36, label %95

; <label>:36                                      ; preds = %31
  %37 = call noalias i8* @malloc(i64 64) #3
  %38 = bitcast i8* %37 to i32***
  %39 = sext i32 %i.0 to i64
  %40 = sext i32 %list.0 to i64
  %41 = load i32****** @BlockSAD, align 8
  %42 = getelementptr inbounds i32***** %41, i64 %40
  %43 = load i32***** %42, align 8
  %44 = getelementptr inbounds i32**** %43, i64 %39
  store i32*** %38, i32**** %44, align 8
  %45 = icmp eq i32*** %38, null
  br i1 %45, label %46, label %47

; <label>:46                                      ; preds = %36
  call void @no_mem_exit(i8* getelementptr inbounds ([42 x i8]* @.str, i32 0, i32 0))
  br label %47

; <label>:47                                      ; preds = %46, %36
  br label %48

; <label>:48                                      ; preds = %90, %47
  %j.0 = phi i32 [ 1, %47 ], [ %91, %90 ]
  %49 = icmp slt i32 %j.0, 8
  br i1 %49, label %50, label %92

; <label>:50                                      ; preds = %48
  %51 = call noalias i8* @malloc(i64 128) #3
  %52 = bitcast i8* %51 to i32**
  %53 = sext i32 %j.0 to i64
  %54 = sext i32 %i.0 to i64
  %55 = sext i32 %list.0 to i64
  %56 = load i32****** @BlockSAD, align 8
  %57 = getelementptr inbounds i32***** %56, i64 %55
  %58 = load i32***** %57, align 8
  %59 = getelementptr inbounds i32**** %58, i64 %54
  %60 = load i32**** %59, align 8
  %61 = getelementptr inbounds i32*** %60, i64 %53
  store i32** %52, i32*** %61, align 8
  %62 = icmp eq i32** %52, null
  br i1 %62, label %63, label %64

; <label>:63                                      ; preds = %50
  call void @no_mem_exit(i8* getelementptr inbounds ([42 x i8]* @.str, i32 0, i32 0))
  br label %64

; <label>:64                                      ; preds = %63, %50
  br label %65

; <label>:65                                      ; preds = %87, %64
  %k.0 = phi i32 [ 0, %64 ], [ %88, %87 ]
  %66 = icmp slt i32 %k.0, 16
  br i1 %66, label %67, label %89

; <label>:67                                      ; preds = %65
  %68 = sext i32 %8 to i64
  %69 = mul i64 %68, 4
  %70 = call noalias i8* @malloc(i64 %69) #3
  %71 = bitcast i8* %70 to i32*
  %72 = sext i32 %k.0 to i64
  %73 = sext i32 %j.0 to i64
  %74 = sext i32 %i.0 to i64
  %75 = sext i32 %list.0 to i64
  %76 = load i32****** @BlockSAD, align 8
  %77 = getelementptr inbounds i32***** %76, i64 %75
  %78 = load i32***** %77, align 8
  %79 = getelementptr inbounds i32**** %78, i64 %74
  %80 = load i32**** %79, align 8
  %81 = getelementptr inbounds i32*** %80, i64 %73
  %82 = load i32*** %81, align 8
  %83 = getelementptr inbounds i32** %82, i64 %72
  store i32* %71, i32** %83, align 8
  %84 = icmp eq i32* %71, null
  br i1 %84, label %85, label %86

; <label>:85                                      ; preds = %67
  call void @no_mem_exit(i8* getelementptr inbounds ([42 x i8]* @.str, i32 0, i32 0))
  br label %86

; <label>:86                                      ; preds = %85, %67
  br label %87

; <label>:87                                      ; preds = %86
  %88 = add nsw i32 %k.0, 1
  br label %65

; <label>:89                                      ; preds = %65
  br label %90

; <label>:90                                      ; preds = %89
  %91 = add nsw i32 %j.0, 1
  br label %48

; <label>:92                                      ; preds = %48
  br label %93

; <label>:93                                      ; preds = %92
  %94 = add nsw i32 %i.0, 1
  br label %31

; <label>:95                                      ; preds = %31
  br label %96

; <label>:96                                      ; preds = %95
  %97 = add nsw i32 %list.0, 1
  br label %14

; <label>:98                                      ; preds = %14
  %99 = call noalias i8* @malloc(i64 16) #3
  %100 = bitcast i8* %99 to i32**
  store i32** %100, i32*** @search_setup_done, align 8
  %101 = icmp eq i32** %100, null
  br i1 %101, label %102, label %103

; <label>:102                                     ; preds = %98
  call void @no_mem_exit(i8* getelementptr inbounds ([51 x i8]* @.str1, i32 0, i32 0))
  br label %103

; <label>:103                                     ; preds = %102, %98
  %104 = call noalias i8* @malloc(i64 16) #3
  %105 = bitcast i8* %104 to i32**
  store i32** %105, i32*** @search_center_x, align 8
  %106 = icmp eq i32** %105, null
  br i1 %106, label %107, label %108

; <label>:107                                     ; preds = %103
  call void @no_mem_exit(i8* getelementptr inbounds ([49 x i8]* @.str2, i32 0, i32 0))
  br label %108

; <label>:108                                     ; preds = %107, %103
  %109 = call noalias i8* @malloc(i64 16) #3
  %110 = bitcast i8* %109 to i32**
  store i32** %110, i32*** @search_center_y, align 8
  %111 = icmp eq i32** %110, null
  br i1 %111, label %112, label %113

; <label>:112                                     ; preds = %108
  call void @no_mem_exit(i8* getelementptr inbounds ([49 x i8]* @.str3, i32 0, i32 0))
  br label %113

; <label>:113                                     ; preds = %112, %108
  %114 = call noalias i8* @malloc(i64 16) #3
  %115 = bitcast i8* %114 to i32**
  store i32** %115, i32*** @pos_00, align 8
  %116 = icmp eq i32** %115, null
  br i1 %116, label %117, label %118

; <label>:117                                     ; preds = %113
  call void @no_mem_exit(i8* getelementptr inbounds ([40 x i8]* @.str4, i32 0, i32 0))
  br label %118

; <label>:118                                     ; preds = %117, %113
  %119 = call noalias i8* @malloc(i64 16) #3
  %120 = bitcast i8* %119 to i32**
  store i32** %120, i32*** @max_search_range, align 8
  %121 = icmp eq i32** %120, null
  br i1 %121, label %122, label %123

; <label>:122                                     ; preds = %118
  call void @no_mem_exit(i8* getelementptr inbounds ([50 x i8]* @.str5, i32 0, i32 0))
  br label %123

; <label>:123                                     ; preds = %122, %118
  br label %124

; <label>:124                                     ; preds = %197, %123
  %list.1 = phi i32 [ 0, %123 ], [ %198, %197 ]
  %125 = icmp slt i32 %list.1, 2
  br i1 %125, label %126, label %199

; <label>:126                                     ; preds = %124
  %127 = load %struct.ImageParameters** @img, align 8
  %128 = getelementptr inbounds %struct.ImageParameters* %127, i32 0, i32 9
  %129 = load i32* %128, align 4
  %130 = add nsw i32 %129, 1
  %131 = sext i32 %130 to i64
  %132 = mul i64 %131, 4
  %133 = call noalias i8* @malloc(i64 %132) #3
  %134 = bitcast i8* %133 to i32*
  %135 = sext i32 %list.1 to i64
  %136 = load i32*** @search_setup_done, align 8
  %137 = getelementptr inbounds i32** %136, i64 %135
  store i32* %134, i32** %137, align 8
  %138 = icmp eq i32* %134, null
  br i1 %138, label %139, label %140

; <label>:139                                     ; preds = %126
  call void @no_mem_exit(i8* getelementptr inbounds ([51 x i8]* @.str1, i32 0, i32 0))
  br label %140

; <label>:140                                     ; preds = %139, %126
  %141 = load %struct.ImageParameters** @img, align 8
  %142 = getelementptr inbounds %struct.ImageParameters* %141, i32 0, i32 9
  %143 = load i32* %142, align 4
  %144 = add nsw i32 %143, 1
  %145 = sext i32 %144 to i64
  %146 = mul i64 %145, 4
  %147 = call noalias i8* @malloc(i64 %146) #3
  %148 = bitcast i8* %147 to i32*
  %149 = sext i32 %list.1 to i64
  %150 = load i32*** @search_center_x, align 8
  %151 = getelementptr inbounds i32** %150, i64 %149
  store i32* %148, i32** %151, align 8
  %152 = icmp eq i32* %148, null
  br i1 %152, label %153, label %154

; <label>:153                                     ; preds = %140
  call void @no_mem_exit(i8* getelementptr inbounds ([49 x i8]* @.str2, i32 0, i32 0))
  br label %154

; <label>:154                                     ; preds = %153, %140
  %155 = load %struct.ImageParameters** @img, align 8
  %156 = getelementptr inbounds %struct.ImageParameters* %155, i32 0, i32 9
  %157 = load i32* %156, align 4
  %158 = add nsw i32 %157, 1
  %159 = sext i32 %158 to i64
  %160 = mul i64 %159, 4
  %161 = call noalias i8* @malloc(i64 %160) #3
  %162 = bitcast i8* %161 to i32*
  %163 = sext i32 %list.1 to i64
  %164 = load i32*** @search_center_y, align 8
  %165 = getelementptr inbounds i32** %164, i64 %163
  store i32* %162, i32** %165, align 8
  %166 = icmp eq i32* %162, null
  br i1 %166, label %167, label %168

; <label>:167                                     ; preds = %154
  call void @no_mem_exit(i8* getelementptr inbounds ([49 x i8]* @.str3, i32 0, i32 0))
  br label %168

; <label>:168                                     ; preds = %167, %154
  %169 = load %struct.ImageParameters** @img, align 8
  %170 = getelementptr inbounds %struct.ImageParameters* %169, i32 0, i32 9
  %171 = load i32* %170, align 4
  %172 = add nsw i32 %171, 1
  %173 = sext i32 %172 to i64
  %174 = mul i64 %173, 4
  %175 = call noalias i8* @malloc(i64 %174) #3
  %176 = bitcast i8* %175 to i32*
  %177 = sext i32 %list.1 to i64
  %178 = load i32*** @pos_00, align 8
  %179 = getelementptr inbounds i32** %178, i64 %177
  store i32* %176, i32** %179, align 8
  %180 = icmp eq i32* %176, null
  br i1 %180, label %181, label %182

; <label>:181                                     ; preds = %168
  call void @no_mem_exit(i8* getelementptr inbounds ([40 x i8]* @.str4, i32 0, i32 0))
  br label %182

; <label>:182                                     ; preds = %181, %168
  %183 = load %struct.ImageParameters** @img, align 8
  %184 = getelementptr inbounds %struct.ImageParameters* %183, i32 0, i32 9
  %185 = load i32* %184, align 4
  %186 = add nsw i32 %185, 1
  %187 = sext i32 %186 to i64
  %188 = mul i64 %187, 4
  %189 = call noalias i8* @malloc(i64 %188) #3
  %190 = bitcast i8* %189 to i32*
  %191 = sext i32 %list.1 to i64
  %192 = load i32*** @max_search_range, align 8
  %193 = getelementptr inbounds i32** %192, i64 %191
  store i32* %190, i32** %193, align 8
  %194 = icmp eq i32* %190, null
  br i1 %194, label %195, label %196

; <label>:195                                     ; preds = %182
  call void @no_mem_exit(i8* getelementptr inbounds ([50 x i8]* @.str5, i32 0, i32 0))
  br label %196

; <label>:196                                     ; preds = %195, %182
  br label %197

; <label>:197                                     ; preds = %196
  %198 = add nsw i32 %list.1, 1
  br label %124

; <label>:199                                     ; preds = %124
  %200 = load %struct.InputParameters** @input, align 8
  %201 = getelementptr inbounds %struct.InputParameters* %200, i32 0, i32 78
  %202 = load i32* %201, align 4
  %203 = icmp eq i32 %202, 2
  br i1 %203, label %204, label %226

; <label>:204                                     ; preds = %199
  br label %205

; <label>:205                                     ; preds = %223, %204
  %list.2 = phi i32 [ 0, %204 ], [ %224, %223 ]
  %206 = icmp slt i32 %list.2, 2
  br i1 %206, label %207, label %225

; <label>:207                                     ; preds = %205
  br label %208

; <label>:208                                     ; preds = %220, %207
  %i.1 = phi i32 [ 0, %207 ], [ %221, %220 ]
  %209 = load %struct.ImageParameters** @img, align 8
  %210 = getelementptr inbounds %struct.ImageParameters* %209, i32 0, i32 9
  %211 = load i32* %210, align 4
  %212 = icmp sle i32 %i.1, %211
  br i1 %212, label %213, label %222

; <label>:213                                     ; preds = %208
  %214 = sext i32 %i.1 to i64
  %215 = sext i32 %list.2 to i64
  %216 = load i32*** @max_search_range, align 8
  %217 = getelementptr inbounds i32** %216, i64 %215
  %218 = load i32** %217, align 8
  %219 = getelementptr inbounds i32* %218, i64 %214
  store i32 %3, i32* %219, align 4
  br label %220

; <label>:220                                     ; preds = %213
  %221 = add nsw i32 %i.1, 1
  br label %208

; <label>:222                                     ; preds = %208
  br label %223

; <label>:223                                     ; preds = %222
  %224 = add nsw i32 %list.2, 1
  br label %205

; <label>:225                                     ; preds = %205
  br label %263

; <label>:226                                     ; preds = %199
  br label %227

; <label>:227                                     ; preds = %260, %226
  %list.3 = phi i32 [ 0, %226 ], [ %261, %260 ]
  %228 = icmp slt i32 %list.3, 2
  br i1 %228, label %229, label %262

; <label>:229                                     ; preds = %227
  %230 = load %struct.ImageParameters** @img, align 8
  %231 = getelementptr inbounds %struct.ImageParameters* %230, i32 0, i32 9
  %232 = load i32* %231, align 4
  %233 = sext i32 %232 to i64
  %234 = sext i32 %list.3 to i64
  %235 = load i32*** @max_search_range, align 8
  %236 = getelementptr inbounds i32** %235, i64 %234
  %237 = load i32** %236, align 8
  %238 = getelementptr inbounds i32* %237, i64 %233
  store i32 %3, i32* %238, align 4
  %239 = sext i32 %list.3 to i64
  %240 = load i32*** @max_search_range, align 8
  %241 = getelementptr inbounds i32** %240, i64 %239
  %242 = load i32** %241, align 8
  %243 = getelementptr inbounds i32* %242, i64 0
  store i32 %3, i32* %243, align 4
  br label %244

; <label>:244                                     ; preds = %257, %229
  %i.2 = phi i32 [ 1, %229 ], [ %258, %257 ]
  %245 = load %struct.ImageParameters** @img, align 8
  %246 = getelementptr inbounds %struct.ImageParameters* %245, i32 0, i32 9
  %247 = load i32* %246, align 4
  %248 = icmp slt i32 %i.2, %247
  br i1 %248, label %249, label %259

; <label>:249                                     ; preds = %244
  %250 = sdiv i32 %3, 2
  %251 = sext i32 %i.2 to i64
  %252 = sext i32 %list.3 to i64
  %253 = load i32*** @max_search_range, align 8
  %254 = getelementptr inbounds i32** %253, i64 %252
  %255 = load i32** %254, align 8
  %256 = getelementptr inbounds i32* %255, i64 %251
  store i32 %250, i32* %256, align 4
  br label %257

; <label>:257                                     ; preds = %249
  %258 = add nsw i32 %i.2, 1
  br label %244

; <label>:259                                     ; preds = %244
  br label %260

; <label>:260                                     ; preds = %259
  %261 = add nsw i32 %list.3, 1
  br label %227

; <label>:262                                     ; preds = %227
  br label %263

; <label>:263                                     ; preds = %262, %225
  ret void
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

declare void @no_mem_exit(i8*) #2

; Function Attrs: nounwind uwtable
define void @ClearFastFullIntegerSearch() #0 {
  br label %1

; <label>:1                                       ; preds = %63, %0
  %list.0 = phi i32 [ 0, %0 ], [ %64, %63 ]
  %2 = icmp slt i32 %list.0, 2
  br i1 %2, label %3, label %65

; <label>:3                                       ; preds = %1
  br label %4

; <label>:4                                       ; preds = %55, %3
  %i.0 = phi i32 [ 0, %3 ], [ %56, %55 ]
  %5 = load %struct.ImageParameters** @img, align 8
  %6 = getelementptr inbounds %struct.ImageParameters* %5, i32 0, i32 9
  %7 = load i32* %6, align 4
  %8 = icmp sle i32 %i.0, %7
  br i1 %8, label %9, label %57

; <label>:9                                       ; preds = %4
  br label %10

; <label>:10                                      ; preds = %44, %9
  %j.0 = phi i32 [ 1, %9 ], [ %45, %44 ]
  %11 = icmp slt i32 %j.0, 8
  br i1 %11, label %12, label %46

; <label>:12                                      ; preds = %10
  br label %13

; <label>:13                                      ; preds = %30, %12
  %k.0 = phi i32 [ 0, %12 ], [ %31, %30 ]
  %14 = icmp slt i32 %k.0, 16
  br i1 %14, label %15, label %32

; <label>:15                                      ; preds = %13
  %16 = sext i32 %k.0 to i64
  %17 = sext i32 %j.0 to i64
  %18 = sext i32 %i.0 to i64
  %19 = sext i32 %list.0 to i64
  %20 = load i32****** @BlockSAD, align 8
  %21 = getelementptr inbounds i32***** %20, i64 %19
  %22 = load i32***** %21, align 8
  %23 = getelementptr inbounds i32**** %22, i64 %18
  %24 = load i32**** %23, align 8
  %25 = getelementptr inbounds i32*** %24, i64 %17
  %26 = load i32*** %25, align 8
  %27 = getelementptr inbounds i32** %26, i64 %16
  %28 = load i32** %27, align 8
  %29 = bitcast i32* %28 to i8*
  call void @free(i8* %29) #3
  br label %30

; <label>:30                                      ; preds = %15
  %31 = add nsw i32 %k.0, 1
  br label %13

; <label>:32                                      ; preds = %13
  %33 = sext i32 %j.0 to i64
  %34 = sext i32 %i.0 to i64
  %35 = sext i32 %list.0 to i64
  %36 = load i32****** @BlockSAD, align 8
  %37 = getelementptr inbounds i32***** %36, i64 %35
  %38 = load i32***** %37, align 8
  %39 = getelementptr inbounds i32**** %38, i64 %34
  %40 = load i32**** %39, align 8
  %41 = getelementptr inbounds i32*** %40, i64 %33
  %42 = load i32*** %41, align 8
  %43 = bitcast i32** %42 to i8*
  call void @free(i8* %43) #3
  br label %44

; <label>:44                                      ; preds = %32
  %45 = add nsw i32 %j.0, 1
  br label %10

; <label>:46                                      ; preds = %10
  %47 = sext i32 %i.0 to i64
  %48 = sext i32 %list.0 to i64
  %49 = load i32****** @BlockSAD, align 8
  %50 = getelementptr inbounds i32***** %49, i64 %48
  %51 = load i32***** %50, align 8
  %52 = getelementptr inbounds i32**** %51, i64 %47
  %53 = load i32**** %52, align 8
  %54 = bitcast i32*** %53 to i8*
  call void @free(i8* %54) #3
  br label %55

; <label>:55                                      ; preds = %46
  %56 = add nsw i32 %i.0, 1
  br label %4

; <label>:57                                      ; preds = %4
  %58 = sext i32 %list.0 to i64
  %59 = load i32****** @BlockSAD, align 8
  %60 = getelementptr inbounds i32***** %59, i64 %58
  %61 = load i32***** %60, align 8
  %62 = bitcast i32**** %61 to i8*
  call void @free(i8* %62) #3
  br label %63

; <label>:63                                      ; preds = %57
  %64 = add nsw i32 %list.0, 1
  br label %1

; <label>:65                                      ; preds = %1
  %66 = load i32****** @BlockSAD, align 8
  %67 = bitcast i32***** %66 to i8*
  call void @free(i8* %67) #3
  br label %68

; <label>:68                                      ; preds = %96, %65
  %list.1 = phi i32 [ 0, %65 ], [ %97, %96 ]
  %69 = icmp slt i32 %list.1, 2
  br i1 %69, label %70, label %98

; <label>:70                                      ; preds = %68
  %71 = sext i32 %list.1 to i64
  %72 = load i32*** @search_setup_done, align 8
  %73 = getelementptr inbounds i32** %72, i64 %71
  %74 = load i32** %73, align 8
  %75 = bitcast i32* %74 to i8*
  call void @free(i8* %75) #3
  %76 = sext i32 %list.1 to i64
  %77 = load i32*** @search_center_x, align 8
  %78 = getelementptr inbounds i32** %77, i64 %76
  %79 = load i32** %78, align 8
  %80 = bitcast i32* %79 to i8*
  call void @free(i8* %80) #3
  %81 = sext i32 %list.1 to i64
  %82 = load i32*** @search_center_y, align 8
  %83 = getelementptr inbounds i32** %82, i64 %81
  %84 = load i32** %83, align 8
  %85 = bitcast i32* %84 to i8*
  call void @free(i8* %85) #3
  %86 = sext i32 %list.1 to i64
  %87 = load i32*** @pos_00, align 8
  %88 = getelementptr inbounds i32** %87, i64 %86
  %89 = load i32** %88, align 8
  %90 = bitcast i32* %89 to i8*
  call void @free(i8* %90) #3
  %91 = sext i32 %list.1 to i64
  %92 = load i32*** @max_search_range, align 8
  %93 = getelementptr inbounds i32** %92, i64 %91
  %94 = load i32** %93, align 8
  %95 = bitcast i32* %94 to i8*
  call void @free(i8* %95) #3
  br label %96

; <label>:96                                      ; preds = %70
  %97 = add nsw i32 %list.1, 1
  br label %68

; <label>:98                                      ; preds = %68
  %99 = load i32*** @search_setup_done, align 8
  %100 = bitcast i32** %99 to i8*
  call void @free(i8* %100) #3
  %101 = load i32*** @search_center_x, align 8
  %102 = bitcast i32** %101 to i8*
  call void @free(i8* %102) #3
  %103 = load i32*** @search_center_y, align 8
  %104 = bitcast i32** %103 to i8*
  call void @free(i8* %104) #3
  %105 = load i32*** @pos_00, align 8
  %106 = bitcast i32** %105 to i8*
  call void @free(i8* %106) #3
  %107 = load i32*** @max_search_range, align 8
  %108 = bitcast i32** %107 to i8*
  call void @free(i8* %108) #3
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #1

; Function Attrs: nounwind uwtable
define void @ResetFastFullIntegerSearch() #0 {
  br label %1

; <label>:1                                       ; preds = %19, %0
  %list.0 = phi i32 [ 0, %0 ], [ %20, %19 ]
  %2 = icmp slt i32 %list.0, 2
  br i1 %2, label %3, label %21

; <label>:3                                       ; preds = %1
  br label %4

; <label>:4                                       ; preds = %16, %3
  %i.0 = phi i32 [ 0, %3 ], [ %17, %16 ]
  %5 = load %struct.ImageParameters** @img, align 8
  %6 = getelementptr inbounds %struct.ImageParameters* %5, i32 0, i32 9
  %7 = load i32* %6, align 4
  %8 = icmp sle i32 %i.0, %7
  br i1 %8, label %9, label %18

; <label>:9                                       ; preds = %4
  %10 = sext i32 %i.0 to i64
  %11 = sext i32 %list.0 to i64
  %12 = load i32*** @search_setup_done, align 8
  %13 = getelementptr inbounds i32** %12, i64 %11
  %14 = load i32** %13, align 8
  %15 = getelementptr inbounds i32* %14, i64 %10
  store i32 0, i32* %15, align 4
  br label %16

; <label>:16                                      ; preds = %9
  %17 = add nsw i32 %i.0, 1
  br label %4

; <label>:18                                      ; preds = %4
  br label %19

; <label>:19                                      ; preds = %18
  %20 = add nsw i32 %list.0, 1
  br label %1

; <label>:21                                      ; preds = %1
  ret void
}

; Function Attrs: nounwind uwtable
define void @SetupLargerBlocks(i32 %list, i32 %refindex, i32 %max_pos) #0 {
  %1 = sext i32 %refindex to i64
  %2 = sext i32 %list to i64
  %3 = load i32****** @BlockSAD, align 8
  %4 = getelementptr inbounds i32***** %3, i64 %2
  %5 = load i32***** %4, align 8
  %6 = getelementptr inbounds i32**** %5, i64 %1
  %7 = load i32**** %6, align 8
  %8 = getelementptr inbounds i32*** %7, i64 6
  %9 = load i32*** %8, align 8
  %10 = sext i32 %refindex to i64
  %11 = sext i32 %list to i64
  %12 = load i32****** @BlockSAD, align 8
  %13 = getelementptr inbounds i32***** %12, i64 %11
  %14 = load i32***** %13, align 8
  %15 = getelementptr inbounds i32**** %14, i64 %10
  %16 = load i32**** %15, align 8
  %17 = getelementptr inbounds i32*** %16, i64 7
  %18 = load i32*** %17, align 8
  %19 = getelementptr inbounds i32** %18, i64 4
  %20 = load i32** %9, align 8
  %21 = load i32** %18, align 8
  %22 = load i32** %19, align 8
  br label %23

; <label>:23                                      ; preds = %35, %0
  %pos.0 = phi i32 [ 0, %0 ], [ %36, %35 ]
  %24 = icmp slt i32 %pos.0, %max_pos
  br i1 %24, label %25, label %37

; <label>:25                                      ; preds = %23
  %26 = sext i32 %pos.0 to i64
  %27 = getelementptr inbounds i32* %21, i64 %26
  %28 = load i32* %27, align 4
  %29 = sext i32 %pos.0 to i64
  %30 = getelementptr inbounds i32* %22, i64 %29
  %31 = load i32* %30, align 4
  %32 = add nsw i32 %28, %31
  %33 = sext i32 %pos.0 to i64
  %34 = getelementptr inbounds i32* %20, i64 %33
  store i32 %32, i32* %34, align 4
  br label %35

; <label>:35                                      ; preds = %25
  %36 = add nsw i32 %pos.0, 1
  br label %23

; <label>:37                                      ; preds = %23
  %38 = getelementptr inbounds i32** %9, i64 1
  %39 = getelementptr inbounds i32** %18, i64 1
  %40 = getelementptr inbounds i32** %19, i64 1
  %41 = load i32** %38, align 8
  %42 = load i32** %39, align 8
  %43 = load i32** %40, align 8
  br label %44

; <label>:44                                      ; preds = %56, %37
  %pos.1 = phi i32 [ 0, %37 ], [ %57, %56 ]
  %45 = icmp slt i32 %pos.1, %max_pos
  br i1 %45, label %46, label %58

; <label>:46                                      ; preds = %44
  %47 = sext i32 %pos.1 to i64
  %48 = getelementptr inbounds i32* %42, i64 %47
  %49 = load i32* %48, align 4
  %50 = sext i32 %pos.1 to i64
  %51 = getelementptr inbounds i32* %43, i64 %50
  %52 = load i32* %51, align 4
  %53 = add nsw i32 %49, %52
  %54 = sext i32 %pos.1 to i64
  %55 = getelementptr inbounds i32* %41, i64 %54
  store i32 %53, i32* %55, align 4
  br label %56

; <label>:56                                      ; preds = %46
  %57 = add nsw i32 %pos.1, 1
  br label %44

; <label>:58                                      ; preds = %44
  %59 = getelementptr inbounds i32** %38, i64 1
  %60 = getelementptr inbounds i32** %39, i64 1
  %61 = getelementptr inbounds i32** %40, i64 1
  %62 = load i32** %59, align 8
  %63 = load i32** %60, align 8
  %64 = load i32** %61, align 8
  br label %65

; <label>:65                                      ; preds = %77, %58
  %pos.2 = phi i32 [ 0, %58 ], [ %78, %77 ]
  %66 = icmp slt i32 %pos.2, %max_pos
  br i1 %66, label %67, label %79

; <label>:67                                      ; preds = %65
  %68 = sext i32 %pos.2 to i64
  %69 = getelementptr inbounds i32* %63, i64 %68
  %70 = load i32* %69, align 4
  %71 = sext i32 %pos.2 to i64
  %72 = getelementptr inbounds i32* %64, i64 %71
  %73 = load i32* %72, align 4
  %74 = add nsw i32 %70, %73
  %75 = sext i32 %pos.2 to i64
  %76 = getelementptr inbounds i32* %62, i64 %75
  store i32 %74, i32* %76, align 4
  br label %77

; <label>:77                                      ; preds = %67
  %78 = add nsw i32 %pos.2, 1
  br label %65

; <label>:79                                      ; preds = %65
  %80 = getelementptr inbounds i32** %59, i64 1
  %81 = getelementptr inbounds i32** %60, i64 1
  %82 = getelementptr inbounds i32** %61, i64 1
  %83 = load i32** %80, align 8
  %84 = load i32** %81, align 8
  %85 = load i32** %82, align 8
  br label %86

; <label>:86                                      ; preds = %98, %79
  %pos.3 = phi i32 [ 0, %79 ], [ %99, %98 ]
  %87 = icmp slt i32 %pos.3, %max_pos
  br i1 %87, label %88, label %100

; <label>:88                                      ; preds = %86
  %89 = sext i32 %pos.3 to i64
  %90 = getelementptr inbounds i32* %84, i64 %89
  %91 = load i32* %90, align 4
  %92 = sext i32 %pos.3 to i64
  %93 = getelementptr inbounds i32* %85, i64 %92
  %94 = load i32* %93, align 4
  %95 = add nsw i32 %91, %94
  %96 = sext i32 %pos.3 to i64
  %97 = getelementptr inbounds i32* %83, i64 %96
  store i32 %95, i32* %97, align 4
  br label %98

; <label>:98                                      ; preds = %88
  %99 = add nsw i32 %pos.3, 1
  br label %86

; <label>:100                                     ; preds = %86
  %101 = getelementptr inbounds i32** %80, i64 5
  %102 = getelementptr inbounds i32** %81, i64 5
  %103 = getelementptr inbounds i32** %82, i64 5
  %104 = load i32** %101, align 8
  %105 = load i32** %102, align 8
  %106 = load i32** %103, align 8
  br label %107

; <label>:107                                     ; preds = %119, %100
  %pos.4 = phi i32 [ 0, %100 ], [ %120, %119 ]
  %108 = icmp slt i32 %pos.4, %max_pos
  br i1 %108, label %109, label %121

; <label>:109                                     ; preds = %107
  %110 = sext i32 %pos.4 to i64
  %111 = getelementptr inbounds i32* %105, i64 %110
  %112 = load i32* %111, align 4
  %113 = sext i32 %pos.4 to i64
  %114 = getelementptr inbounds i32* %106, i64 %113
  %115 = load i32* %114, align 4
  %116 = add nsw i32 %112, %115
  %117 = sext i32 %pos.4 to i64
  %118 = getelementptr inbounds i32* %104, i64 %117
  store i32 %116, i32* %118, align 4
  br label %119

; <label>:119                                     ; preds = %109
  %120 = add nsw i32 %pos.4, 1
  br label %107

; <label>:121                                     ; preds = %107
  %122 = getelementptr inbounds i32** %101, i64 1
  %123 = getelementptr inbounds i32** %102, i64 1
  %124 = getelementptr inbounds i32** %103, i64 1
  %125 = load i32** %122, align 8
  %126 = load i32** %123, align 8
  %127 = load i32** %124, align 8
  br label %128

; <label>:128                                     ; preds = %140, %121
  %pos.5 = phi i32 [ 0, %121 ], [ %141, %140 ]
  %129 = icmp slt i32 %pos.5, %max_pos
  br i1 %129, label %130, label %142

; <label>:130                                     ; preds = %128
  %131 = sext i32 %pos.5 to i64
  %132 = getelementptr inbounds i32* %126, i64 %131
  %133 = load i32* %132, align 4
  %134 = sext i32 %pos.5 to i64
  %135 = getelementptr inbounds i32* %127, i64 %134
  %136 = load i32* %135, align 4
  %137 = add nsw i32 %133, %136
  %138 = sext i32 %pos.5 to i64
  %139 = getelementptr inbounds i32* %125, i64 %138
  store i32 %137, i32* %139, align 4
  br label %140

; <label>:140                                     ; preds = %130
  %141 = add nsw i32 %pos.5, 1
  br label %128

; <label>:142                                     ; preds = %128
  %143 = getelementptr inbounds i32** %122, i64 1
  %144 = getelementptr inbounds i32** %123, i64 1
  %145 = getelementptr inbounds i32** %124, i64 1
  %146 = load i32** %143, align 8
  %147 = load i32** %144, align 8
  %148 = load i32** %145, align 8
  br label %149

; <label>:149                                     ; preds = %161, %142
  %pos.6 = phi i32 [ 0, %142 ], [ %162, %161 ]
  %150 = icmp slt i32 %pos.6, %max_pos
  br i1 %150, label %151, label %163

; <label>:151                                     ; preds = %149
  %152 = sext i32 %pos.6 to i64
  %153 = getelementptr inbounds i32* %147, i64 %152
  %154 = load i32* %153, align 4
  %155 = sext i32 %pos.6 to i64
  %156 = getelementptr inbounds i32* %148, i64 %155
  %157 = load i32* %156, align 4
  %158 = add nsw i32 %154, %157
  %159 = sext i32 %pos.6 to i64
  %160 = getelementptr inbounds i32* %146, i64 %159
  store i32 %158, i32* %160, align 4
  br label %161

; <label>:161                                     ; preds = %151
  %162 = add nsw i32 %pos.6, 1
  br label %149

; <label>:163                                     ; preds = %149
  %164 = getelementptr inbounds i32** %143, i64 1
  %165 = getelementptr inbounds i32** %144, i64 1
  %166 = getelementptr inbounds i32** %145, i64 1
  %167 = load i32** %164, align 8
  %168 = load i32** %165, align 8
  %169 = load i32** %166, align 8
  br label %170

; <label>:170                                     ; preds = %182, %163
  %pos.7 = phi i32 [ 0, %163 ], [ %183, %182 ]
  %171 = icmp slt i32 %pos.7, %max_pos
  br i1 %171, label %172, label %184

; <label>:172                                     ; preds = %170
  %173 = sext i32 %pos.7 to i64
  %174 = getelementptr inbounds i32* %168, i64 %173
  %175 = load i32* %174, align 4
  %176 = sext i32 %pos.7 to i64
  %177 = getelementptr inbounds i32* %169, i64 %176
  %178 = load i32* %177, align 4
  %179 = add nsw i32 %175, %178
  %180 = sext i32 %pos.7 to i64
  %181 = getelementptr inbounds i32* %167, i64 %180
  store i32 %179, i32* %181, align 4
  br label %182

; <label>:182                                     ; preds = %172
  %183 = add nsw i32 %pos.7, 1
  br label %170

; <label>:184                                     ; preds = %170
  %185 = sext i32 %refindex to i64
  %186 = sext i32 %list to i64
  %187 = load i32****** @BlockSAD, align 8
  %188 = getelementptr inbounds i32***** %187, i64 %186
  %189 = load i32***** %188, align 8
  %190 = getelementptr inbounds i32**** %189, i64 %185
  %191 = load i32**** %190, align 8
  %192 = getelementptr inbounds i32*** %191, i64 5
  %193 = load i32*** %192, align 8
  %194 = sext i32 %refindex to i64
  %195 = sext i32 %list to i64
  %196 = load i32****** @BlockSAD, align 8
  %197 = getelementptr inbounds i32***** %196, i64 %195
  %198 = load i32***** %197, align 8
  %199 = getelementptr inbounds i32**** %198, i64 %194
  %200 = load i32**** %199, align 8
  %201 = getelementptr inbounds i32*** %200, i64 7
  %202 = load i32*** %201, align 8
  %203 = getelementptr inbounds i32** %202, i64 1
  %204 = load i32** %193, align 8
  %205 = load i32** %202, align 8
  %206 = load i32** %203, align 8
  br label %207

; <label>:207                                     ; preds = %219, %184
  %pos.8 = phi i32 [ 0, %184 ], [ %220, %219 ]
  %208 = icmp slt i32 %pos.8, %max_pos
  br i1 %208, label %209, label %221

; <label>:209                                     ; preds = %207
  %210 = sext i32 %pos.8 to i64
  %211 = getelementptr inbounds i32* %205, i64 %210
  %212 = load i32* %211, align 4
  %213 = sext i32 %pos.8 to i64
  %214 = getelementptr inbounds i32* %206, i64 %213
  %215 = load i32* %214, align 4
  %216 = add nsw i32 %212, %215
  %217 = sext i32 %pos.8 to i64
  %218 = getelementptr inbounds i32* %204, i64 %217
  store i32 %216, i32* %218, align 4
  br label %219

; <label>:219                                     ; preds = %209
  %220 = add nsw i32 %pos.8, 1
  br label %207

; <label>:221                                     ; preds = %207
  %222 = getelementptr inbounds i32** %193, i64 2
  %223 = getelementptr inbounds i32** %202, i64 2
  %224 = getelementptr inbounds i32** %203, i64 2
  %225 = load i32** %222, align 8
  %226 = load i32** %223, align 8
  %227 = load i32** %224, align 8
  br label %228

; <label>:228                                     ; preds = %240, %221
  %pos.9 = phi i32 [ 0, %221 ], [ %241, %240 ]
  %229 = icmp slt i32 %pos.9, %max_pos
  br i1 %229, label %230, label %242

; <label>:230                                     ; preds = %228
  %231 = sext i32 %pos.9 to i64
  %232 = getelementptr inbounds i32* %226, i64 %231
  %233 = load i32* %232, align 4
  %234 = sext i32 %pos.9 to i64
  %235 = getelementptr inbounds i32* %227, i64 %234
  %236 = load i32* %235, align 4
  %237 = add nsw i32 %233, %236
  %238 = sext i32 %pos.9 to i64
  %239 = getelementptr inbounds i32* %225, i64 %238
  store i32 %237, i32* %239, align 4
  br label %240

; <label>:240                                     ; preds = %230
  %241 = add nsw i32 %pos.9, 1
  br label %228

; <label>:242                                     ; preds = %228
  %243 = getelementptr inbounds i32** %222, i64 2
  %244 = getelementptr inbounds i32** %223, i64 2
  %245 = getelementptr inbounds i32** %224, i64 2
  %246 = load i32** %243, align 8
  %247 = load i32** %244, align 8
  %248 = load i32** %245, align 8
  br label %249

; <label>:249                                     ; preds = %261, %242
  %pos.10 = phi i32 [ 0, %242 ], [ %262, %261 ]
  %250 = icmp slt i32 %pos.10, %max_pos
  br i1 %250, label %251, label %263

; <label>:251                                     ; preds = %249
  %252 = sext i32 %pos.10 to i64
  %253 = getelementptr inbounds i32* %247, i64 %252
  %254 = load i32* %253, align 4
  %255 = sext i32 %pos.10 to i64
  %256 = getelementptr inbounds i32* %248, i64 %255
  %257 = load i32* %256, align 4
  %258 = add nsw i32 %254, %257
  %259 = sext i32 %pos.10 to i64
  %260 = getelementptr inbounds i32* %246, i64 %259
  store i32 %258, i32* %260, align 4
  br label %261

; <label>:261                                     ; preds = %251
  %262 = add nsw i32 %pos.10, 1
  br label %249

; <label>:263                                     ; preds = %249
  %264 = getelementptr inbounds i32** %243, i64 2
  %265 = getelementptr inbounds i32** %244, i64 2
  %266 = getelementptr inbounds i32** %245, i64 2
  %267 = load i32** %264, align 8
  %268 = load i32** %265, align 8
  %269 = load i32** %266, align 8
  br label %270

; <label>:270                                     ; preds = %282, %263
  %pos.11 = phi i32 [ 0, %263 ], [ %283, %282 ]
  %271 = icmp slt i32 %pos.11, %max_pos
  br i1 %271, label %272, label %284

; <label>:272                                     ; preds = %270
  %273 = sext i32 %pos.11 to i64
  %274 = getelementptr inbounds i32* %268, i64 %273
  %275 = load i32* %274, align 4
  %276 = sext i32 %pos.11 to i64
  %277 = getelementptr inbounds i32* %269, i64 %276
  %278 = load i32* %277, align 4
  %279 = add nsw i32 %275, %278
  %280 = sext i32 %pos.11 to i64
  %281 = getelementptr inbounds i32* %267, i64 %280
  store i32 %279, i32* %281, align 4
  br label %282

; <label>:282                                     ; preds = %272
  %283 = add nsw i32 %pos.11, 1
  br label %270

; <label>:284                                     ; preds = %270
  %285 = getelementptr inbounds i32** %264, i64 2
  %286 = getelementptr inbounds i32** %265, i64 2
  %287 = getelementptr inbounds i32** %266, i64 2
  %288 = load i32** %285, align 8
  %289 = load i32** %286, align 8
  %290 = load i32** %287, align 8
  br label %291

; <label>:291                                     ; preds = %303, %284
  %pos.12 = phi i32 [ 0, %284 ], [ %304, %303 ]
  %292 = icmp slt i32 %pos.12, %max_pos
  br i1 %292, label %293, label %305

; <label>:293                                     ; preds = %291
  %294 = sext i32 %pos.12 to i64
  %295 = getelementptr inbounds i32* %289, i64 %294
  %296 = load i32* %295, align 4
  %297 = sext i32 %pos.12 to i64
  %298 = getelementptr inbounds i32* %290, i64 %297
  %299 = load i32* %298, align 4
  %300 = add nsw i32 %296, %299
  %301 = sext i32 %pos.12 to i64
  %302 = getelementptr inbounds i32* %288, i64 %301
  store i32 %300, i32* %302, align 4
  br label %303

; <label>:303                                     ; preds = %293
  %304 = add nsw i32 %pos.12, 1
  br label %291

; <label>:305                                     ; preds = %291
  %306 = getelementptr inbounds i32** %285, i64 2
  %307 = getelementptr inbounds i32** %286, i64 2
  %308 = getelementptr inbounds i32** %287, i64 2
  %309 = load i32** %306, align 8
  %310 = load i32** %307, align 8
  %311 = load i32** %308, align 8
  br label %312

; <label>:312                                     ; preds = %324, %305
  %pos.13 = phi i32 [ 0, %305 ], [ %325, %324 ]
  %313 = icmp slt i32 %pos.13, %max_pos
  br i1 %313, label %314, label %326

; <label>:314                                     ; preds = %312
  %315 = sext i32 %pos.13 to i64
  %316 = getelementptr inbounds i32* %310, i64 %315
  %317 = load i32* %316, align 4
  %318 = sext i32 %pos.13 to i64
  %319 = getelementptr inbounds i32* %311, i64 %318
  %320 = load i32* %319, align 4
  %321 = add nsw i32 %317, %320
  %322 = sext i32 %pos.13 to i64
  %323 = getelementptr inbounds i32* %309, i64 %322
  store i32 %321, i32* %323, align 4
  br label %324

; <label>:324                                     ; preds = %314
  %325 = add nsw i32 %pos.13, 1
  br label %312

; <label>:326                                     ; preds = %312
  %327 = getelementptr inbounds i32** %306, i64 2
  %328 = getelementptr inbounds i32** %307, i64 2
  %329 = getelementptr inbounds i32** %308, i64 2
  %330 = load i32** %327, align 8
  %331 = load i32** %328, align 8
  %332 = load i32** %329, align 8
  br label %333

; <label>:333                                     ; preds = %345, %326
  %pos.14 = phi i32 [ 0, %326 ], [ %346, %345 ]
  %334 = icmp slt i32 %pos.14, %max_pos
  br i1 %334, label %335, label %347

; <label>:335                                     ; preds = %333
  %336 = sext i32 %pos.14 to i64
  %337 = getelementptr inbounds i32* %331, i64 %336
  %338 = load i32* %337, align 4
  %339 = sext i32 %pos.14 to i64
  %340 = getelementptr inbounds i32* %332, i64 %339
  %341 = load i32* %340, align 4
  %342 = add nsw i32 %338, %341
  %343 = sext i32 %pos.14 to i64
  %344 = getelementptr inbounds i32* %330, i64 %343
  store i32 %342, i32* %344, align 4
  br label %345

; <label>:345                                     ; preds = %335
  %346 = add nsw i32 %pos.14, 1
  br label %333

; <label>:347                                     ; preds = %333
  %348 = getelementptr inbounds i32** %327, i64 2
  %349 = getelementptr inbounds i32** %328, i64 2
  %350 = getelementptr inbounds i32** %329, i64 2
  %351 = load i32** %348, align 8
  %352 = load i32** %349, align 8
  %353 = load i32** %350, align 8
  br label %354

; <label>:354                                     ; preds = %366, %347
  %pos.15 = phi i32 [ 0, %347 ], [ %367, %366 ]
  %355 = icmp slt i32 %pos.15, %max_pos
  br i1 %355, label %356, label %368

; <label>:356                                     ; preds = %354
  %357 = sext i32 %pos.15 to i64
  %358 = getelementptr inbounds i32* %352, i64 %357
  %359 = load i32* %358, align 4
  %360 = sext i32 %pos.15 to i64
  %361 = getelementptr inbounds i32* %353, i64 %360
  %362 = load i32* %361, align 4
  %363 = add nsw i32 %359, %362
  %364 = sext i32 %pos.15 to i64
  %365 = getelementptr inbounds i32* %351, i64 %364
  store i32 %363, i32* %365, align 4
  br label %366

; <label>:366                                     ; preds = %356
  %367 = add nsw i32 %pos.15, 1
  br label %354

; <label>:368                                     ; preds = %354
  %369 = sext i32 %refindex to i64
  %370 = sext i32 %list to i64
  %371 = load i32****** @BlockSAD, align 8
  %372 = getelementptr inbounds i32***** %371, i64 %370
  %373 = load i32***** %372, align 8
  %374 = getelementptr inbounds i32**** %373, i64 %369
  %375 = load i32**** %374, align 8
  %376 = getelementptr inbounds i32*** %375, i64 4
  %377 = load i32*** %376, align 8
  %378 = sext i32 %refindex to i64
  %379 = sext i32 %list to i64
  %380 = load i32****** @BlockSAD, align 8
  %381 = getelementptr inbounds i32***** %380, i64 %379
  %382 = load i32***** %381, align 8
  %383 = getelementptr inbounds i32**** %382, i64 %378
  %384 = load i32**** %383, align 8
  %385 = getelementptr inbounds i32*** %384, i64 6
  %386 = load i32*** %385, align 8
  %387 = getelementptr inbounds i32** %386, i64 1
  %388 = load i32** %377, align 8
  %389 = load i32** %386, align 8
  %390 = load i32** %387, align 8
  br label %391

; <label>:391                                     ; preds = %403, %368
  %pos.16 = phi i32 [ 0, %368 ], [ %404, %403 ]
  %392 = icmp slt i32 %pos.16, %max_pos
  br i1 %392, label %393, label %405

; <label>:393                                     ; preds = %391
  %394 = sext i32 %pos.16 to i64
  %395 = getelementptr inbounds i32* %389, i64 %394
  %396 = load i32* %395, align 4
  %397 = sext i32 %pos.16 to i64
  %398 = getelementptr inbounds i32* %390, i64 %397
  %399 = load i32* %398, align 4
  %400 = add nsw i32 %396, %399
  %401 = sext i32 %pos.16 to i64
  %402 = getelementptr inbounds i32* %388, i64 %401
  store i32 %400, i32* %402, align 4
  br label %403

; <label>:403                                     ; preds = %393
  %404 = add nsw i32 %pos.16, 1
  br label %391

; <label>:405                                     ; preds = %391
  %406 = getelementptr inbounds i32** %377, i64 2
  %407 = getelementptr inbounds i32** %386, i64 2
  %408 = getelementptr inbounds i32** %387, i64 2
  %409 = load i32** %406, align 8
  %410 = load i32** %407, align 8
  %411 = load i32** %408, align 8
  br label %412

; <label>:412                                     ; preds = %424, %405
  %pos.17 = phi i32 [ 0, %405 ], [ %425, %424 ]
  %413 = icmp slt i32 %pos.17, %max_pos
  br i1 %413, label %414, label %426

; <label>:414                                     ; preds = %412
  %415 = sext i32 %pos.17 to i64
  %416 = getelementptr inbounds i32* %410, i64 %415
  %417 = load i32* %416, align 4
  %418 = sext i32 %pos.17 to i64
  %419 = getelementptr inbounds i32* %411, i64 %418
  %420 = load i32* %419, align 4
  %421 = add nsw i32 %417, %420
  %422 = sext i32 %pos.17 to i64
  %423 = getelementptr inbounds i32* %409, i64 %422
  store i32 %421, i32* %423, align 4
  br label %424

; <label>:424                                     ; preds = %414
  %425 = add nsw i32 %pos.17, 1
  br label %412

; <label>:426                                     ; preds = %412
  %427 = getelementptr inbounds i32** %406, i64 6
  %428 = getelementptr inbounds i32** %407, i64 6
  %429 = getelementptr inbounds i32** %408, i64 6
  %430 = load i32** %427, align 8
  %431 = load i32** %428, align 8
  %432 = load i32** %429, align 8
  br label %433

; <label>:433                                     ; preds = %445, %426
  %pos.18 = phi i32 [ 0, %426 ], [ %446, %445 ]
  %434 = icmp slt i32 %pos.18, %max_pos
  br i1 %434, label %435, label %447

; <label>:435                                     ; preds = %433
  %436 = sext i32 %pos.18 to i64
  %437 = getelementptr inbounds i32* %431, i64 %436
  %438 = load i32* %437, align 4
  %439 = sext i32 %pos.18 to i64
  %440 = getelementptr inbounds i32* %432, i64 %439
  %441 = load i32* %440, align 4
  %442 = add nsw i32 %438, %441
  %443 = sext i32 %pos.18 to i64
  %444 = getelementptr inbounds i32* %430, i64 %443
  store i32 %442, i32* %444, align 4
  br label %445

; <label>:445                                     ; preds = %435
  %446 = add nsw i32 %pos.18, 1
  br label %433

; <label>:447                                     ; preds = %433
  %448 = getelementptr inbounds i32** %427, i64 2
  %449 = getelementptr inbounds i32** %428, i64 2
  %450 = getelementptr inbounds i32** %429, i64 2
  %451 = load i32** %448, align 8
  %452 = load i32** %449, align 8
  %453 = load i32** %450, align 8
  br label %454

; <label>:454                                     ; preds = %466, %447
  %pos.19 = phi i32 [ 0, %447 ], [ %467, %466 ]
  %455 = icmp slt i32 %pos.19, %max_pos
  br i1 %455, label %456, label %468

; <label>:456                                     ; preds = %454
  %457 = sext i32 %pos.19 to i64
  %458 = getelementptr inbounds i32* %452, i64 %457
  %459 = load i32* %458, align 4
  %460 = sext i32 %pos.19 to i64
  %461 = getelementptr inbounds i32* %453, i64 %460
  %462 = load i32* %461, align 4
  %463 = add nsw i32 %459, %462
  %464 = sext i32 %pos.19 to i64
  %465 = getelementptr inbounds i32* %451, i64 %464
  store i32 %463, i32* %465, align 4
  br label %466

; <label>:466                                     ; preds = %456
  %467 = add nsw i32 %pos.19, 1
  br label %454

; <label>:468                                     ; preds = %454
  %469 = sext i32 %refindex to i64
  %470 = sext i32 %list to i64
  %471 = load i32****** @BlockSAD, align 8
  %472 = getelementptr inbounds i32***** %471, i64 %470
  %473 = load i32***** %472, align 8
  %474 = getelementptr inbounds i32**** %473, i64 %469
  %475 = load i32**** %474, align 8
  %476 = getelementptr inbounds i32*** %475, i64 3
  %477 = load i32*** %476, align 8
  %478 = sext i32 %refindex to i64
  %479 = sext i32 %list to i64
  %480 = load i32****** @BlockSAD, align 8
  %481 = getelementptr inbounds i32***** %480, i64 %479
  %482 = load i32***** %481, align 8
  %483 = getelementptr inbounds i32**** %482, i64 %478
  %484 = load i32**** %483, align 8
  %485 = getelementptr inbounds i32*** %484, i64 4
  %486 = load i32*** %485, align 8
  %487 = getelementptr inbounds i32** %486, i64 8
  %488 = load i32** %477, align 8
  %489 = load i32** %486, align 8
  %490 = load i32** %487, align 8
  br label %491

; <label>:491                                     ; preds = %503, %468
  %pos.20 = phi i32 [ 0, %468 ], [ %504, %503 ]
  %492 = icmp slt i32 %pos.20, %max_pos
  br i1 %492, label %493, label %505

; <label>:493                                     ; preds = %491
  %494 = sext i32 %pos.20 to i64
  %495 = getelementptr inbounds i32* %489, i64 %494
  %496 = load i32* %495, align 4
  %497 = sext i32 %pos.20 to i64
  %498 = getelementptr inbounds i32* %490, i64 %497
  %499 = load i32* %498, align 4
  %500 = add nsw i32 %496, %499
  %501 = sext i32 %pos.20 to i64
  %502 = getelementptr inbounds i32* %488, i64 %501
  store i32 %500, i32* %502, align 4
  br label %503

; <label>:503                                     ; preds = %493
  %504 = add nsw i32 %pos.20, 1
  br label %491

; <label>:505                                     ; preds = %491
  %506 = getelementptr inbounds i32** %477, i64 2
  %507 = getelementptr inbounds i32** %486, i64 2
  %508 = getelementptr inbounds i32** %487, i64 2
  %509 = load i32** %506, align 8
  %510 = load i32** %507, align 8
  %511 = load i32** %508, align 8
  br label %512

; <label>:512                                     ; preds = %524, %505
  %pos.21 = phi i32 [ 0, %505 ], [ %525, %524 ]
  %513 = icmp slt i32 %pos.21, %max_pos
  br i1 %513, label %514, label %526

; <label>:514                                     ; preds = %512
  %515 = sext i32 %pos.21 to i64
  %516 = getelementptr inbounds i32* %510, i64 %515
  %517 = load i32* %516, align 4
  %518 = sext i32 %pos.21 to i64
  %519 = getelementptr inbounds i32* %511, i64 %518
  %520 = load i32* %519, align 4
  %521 = add nsw i32 %517, %520
  %522 = sext i32 %pos.21 to i64
  %523 = getelementptr inbounds i32* %509, i64 %522
  store i32 %521, i32* %523, align 4
  br label %524

; <label>:524                                     ; preds = %514
  %525 = add nsw i32 %pos.21, 1
  br label %512

; <label>:526                                     ; preds = %512
  %527 = sext i32 %refindex to i64
  %528 = sext i32 %list to i64
  %529 = load i32****** @BlockSAD, align 8
  %530 = getelementptr inbounds i32***** %529, i64 %528
  %531 = load i32***** %530, align 8
  %532 = getelementptr inbounds i32**** %531, i64 %527
  %533 = load i32**** %532, align 8
  %534 = getelementptr inbounds i32*** %533, i64 2
  %535 = load i32*** %534, align 8
  %536 = sext i32 %refindex to i64
  %537 = sext i32 %list to i64
  %538 = load i32****** @BlockSAD, align 8
  %539 = getelementptr inbounds i32***** %538, i64 %537
  %540 = load i32***** %539, align 8
  %541 = getelementptr inbounds i32**** %540, i64 %536
  %542 = load i32**** %541, align 8
  %543 = getelementptr inbounds i32*** %542, i64 4
  %544 = load i32*** %543, align 8
  %545 = getelementptr inbounds i32** %544, i64 2
  %546 = load i32** %535, align 8
  %547 = load i32** %544, align 8
  %548 = load i32** %545, align 8
  br label %549

; <label>:549                                     ; preds = %561, %526
  %pos.22 = phi i32 [ 0, %526 ], [ %562, %561 ]
  %550 = icmp slt i32 %pos.22, %max_pos
  br i1 %550, label %551, label %563

; <label>:551                                     ; preds = %549
  %552 = sext i32 %pos.22 to i64
  %553 = getelementptr inbounds i32* %547, i64 %552
  %554 = load i32* %553, align 4
  %555 = sext i32 %pos.22 to i64
  %556 = getelementptr inbounds i32* %548, i64 %555
  %557 = load i32* %556, align 4
  %558 = add nsw i32 %554, %557
  %559 = sext i32 %pos.22 to i64
  %560 = getelementptr inbounds i32* %546, i64 %559
  store i32 %558, i32* %560, align 4
  br label %561

; <label>:561                                     ; preds = %551
  %562 = add nsw i32 %pos.22, 1
  br label %549

; <label>:563                                     ; preds = %549
  %564 = getelementptr inbounds i32** %535, i64 8
  %565 = getelementptr inbounds i32** %544, i64 8
  %566 = getelementptr inbounds i32** %545, i64 8
  %567 = load i32** %564, align 8
  %568 = load i32** %565, align 8
  %569 = load i32** %566, align 8
  br label %570

; <label>:570                                     ; preds = %582, %563
  %pos.23 = phi i32 [ 0, %563 ], [ %583, %582 ]
  %571 = icmp slt i32 %pos.23, %max_pos
  br i1 %571, label %572, label %584

; <label>:572                                     ; preds = %570
  %573 = sext i32 %pos.23 to i64
  %574 = getelementptr inbounds i32* %568, i64 %573
  %575 = load i32* %574, align 4
  %576 = sext i32 %pos.23 to i64
  %577 = getelementptr inbounds i32* %569, i64 %576
  %578 = load i32* %577, align 4
  %579 = add nsw i32 %575, %578
  %580 = sext i32 %pos.23 to i64
  %581 = getelementptr inbounds i32* %567, i64 %580
  store i32 %579, i32* %581, align 4
  br label %582

; <label>:582                                     ; preds = %572
  %583 = add nsw i32 %pos.23, 1
  br label %570

; <label>:584                                     ; preds = %570
  %585 = sext i32 %refindex to i64
  %586 = sext i32 %list to i64
  %587 = load i32****** @BlockSAD, align 8
  %588 = getelementptr inbounds i32***** %587, i64 %586
  %589 = load i32***** %588, align 8
  %590 = getelementptr inbounds i32**** %589, i64 %585
  %591 = load i32**** %590, align 8
  %592 = getelementptr inbounds i32*** %591, i64 1
  %593 = load i32*** %592, align 8
  %594 = sext i32 %refindex to i64
  %595 = sext i32 %list to i64
  %596 = load i32****** @BlockSAD, align 8
  %597 = getelementptr inbounds i32***** %596, i64 %595
  %598 = load i32***** %597, align 8
  %599 = getelementptr inbounds i32**** %598, i64 %594
  %600 = load i32**** %599, align 8
  %601 = getelementptr inbounds i32*** %600, i64 3
  %602 = load i32*** %601, align 8
  %603 = getelementptr inbounds i32** %602, i64 2
  %604 = load i32** %593, align 8
  %605 = load i32** %602, align 8
  %606 = load i32** %603, align 8
  br label %607

; <label>:607                                     ; preds = %619, %584
  %pos.24 = phi i32 [ 0, %584 ], [ %620, %619 ]
  %608 = icmp slt i32 %pos.24, %max_pos
  br i1 %608, label %609, label %621

; <label>:609                                     ; preds = %607
  %610 = sext i32 %pos.24 to i64
  %611 = getelementptr inbounds i32* %605, i64 %610
  %612 = load i32* %611, align 4
  %613 = sext i32 %pos.24 to i64
  %614 = getelementptr inbounds i32* %606, i64 %613
  %615 = load i32* %614, align 4
  %616 = add nsw i32 %612, %615
  %617 = sext i32 %pos.24 to i64
  %618 = getelementptr inbounds i32* %604, i64 %617
  store i32 %616, i32* %618, align 4
  br label %619

; <label>:619                                     ; preds = %609
  %620 = add nsw i32 %pos.24, 1
  br label %607

; <label>:621                                     ; preds = %607
  ret void
}

; Function Attrs: nounwind uwtable
define void @SetupFastFullPelSearch(i16 signext %ref, i32 %list) #0 {
  %pmv = alloca [2 x i16], align 2
  %orig_blocks = alloca [256 x i16], align 16
  %1 = getelementptr inbounds [256 x i16]* %orig_blocks, i32 0, i32 0
  %2 = sext i16 %ref to i64
  %3 = sext i32 %list to i64
  %4 = load i32****** @BlockSAD, align 8
  %5 = getelementptr inbounds i32***** %4, i64 %3
  %6 = load i32***** %5, align 8
  %7 = getelementptr inbounds i32**** %6, i64 %2
  %8 = load i32**** %7, align 8
  %9 = getelementptr inbounds i32*** %8, i64 7
  %10 = load i32*** %9, align 8
  %11 = sext i16 %ref to i64
  %12 = sext i32 %list to i64
  %13 = load i32*** @max_search_range, align 8
  %14 = getelementptr inbounds i32** %13, i64 %12
  %15 = load i32** %14, align 8
  %16 = getelementptr inbounds i32* %15, i64 %11
  %17 = load i32* %16, align 4
  %18 = mul nsw i32 2, %17
  %19 = add nsw i32 %18, 1
  %20 = mul nsw i32 2, %17
  %21 = add nsw i32 %20, 1
  %22 = mul nsw i32 %19, %21
  %23 = load %struct.ImageParameters** @img, align 8
  %24 = getelementptr inbounds %struct.ImageParameters* %23, i32 0, i32 90
  %25 = load i32* %24, align 4
  %26 = icmp ne i32 %25, 0
  br i1 %26, label %27, label %46

; <label>:27                                      ; preds = %0
  %28 = load %struct.ImageParameters** @img, align 8
  %29 = getelementptr inbounds %struct.ImageParameters* %28, i32 0, i32 3
  %30 = load i32* %29, align 4
  %31 = sext i32 %30 to i64
  %32 = load %struct.ImageParameters** @img, align 8
  %33 = getelementptr inbounds %struct.ImageParameters* %32, i32 0, i32 51
  %34 = load %struct.macroblock** %33, align 8
  %35 = getelementptr inbounds %struct.macroblock* %34, i64 %31
  %36 = getelementptr inbounds %struct.macroblock* %35, i32 0, i32 22
  %37 = load i32* %36, align 4
  %38 = icmp ne i32 %37, 0
  br i1 %38, label %39, label %46

; <label>:39                                      ; preds = %27
  %40 = load %struct.ImageParameters** @img, align 8
  %41 = getelementptr inbounds %struct.ImageParameters* %40, i32 0, i32 3
  %42 = load i32* %41, align 4
  %43 = srem i32 %42, 2
  %44 = icmp ne i32 %43, 0
  %45 = select i1 %44, i32 4, i32 2
  br label %47

; <label>:46                                      ; preds = %27, %0
  br label %47

; <label>:47                                      ; preds = %46, %39
  %48 = phi i32 [ %45, %39 ], [ 0, %46 ]
  %49 = load %struct.pic_parameter_set_rbsp_t** @active_pps, align 8
  %50 = getelementptr inbounds %struct.pic_parameter_set_rbsp_t* %49, i32 0, i32 19
  %51 = load i32* %50, align 4
  %52 = icmp ne i32 %51, 0
  br i1 %52, label %53, label %63

; <label>:53                                      ; preds = %47
  %54 = load %struct.ImageParameters** @img, align 8
  %55 = getelementptr inbounds %struct.ImageParameters* %54, i32 0, i32 6
  %56 = load i32* %55, align 4
  %57 = icmp eq i32 %56, 0
  br i1 %57, label %75, label %58

; <label>:58                                      ; preds = %53
  %59 = load %struct.ImageParameters** @img, align 8
  %60 = getelementptr inbounds %struct.ImageParameters* %59, i32 0, i32 6
  %61 = load i32* %60, align 4
  %62 = icmp eq i32 %61, 3
  br i1 %62, label %75, label %63

; <label>:63                                      ; preds = %58, %47
  %64 = load %struct.pic_parameter_set_rbsp_t** @active_pps, align 8
  %65 = getelementptr inbounds %struct.pic_parameter_set_rbsp_t* %64, i32 0, i32 20
  %66 = load i32* %65, align 4
  %67 = icmp ne i32 %66, 0
  br i1 %67, label %68, label %73

; <label>:68                                      ; preds = %63
  %69 = load %struct.ImageParameters** @img, align 8
  %70 = getelementptr inbounds %struct.ImageParameters* %69, i32 0, i32 6
  %71 = load i32* %70, align 4
  %72 = icmp eq i32 %71, 1
  br label %73

; <label>:73                                      ; preds = %68, %63
  %74 = phi i1 [ false, %63 ], [ %72, %68 ]
  br label %75

; <label>:75                                      ; preds = %73, %58, %53
  %76 = phi i1 [ true, %58 ], [ true, %53 ], [ %74, %73 ]
  %77 = zext i1 %76 to i32
  %78 = sext i16 %ref to i64
  %79 = add nsw i32 %list, %48
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds [6 x %struct.storable_picture**]* @listX, i32 0, i64 %80
  %82 = load %struct.storable_picture*** %81, align 8
  %83 = getelementptr inbounds %struct.storable_picture** %82, i64 %78
  %84 = load %struct.storable_picture** %83, align 8
  %85 = icmp ne i32 %77, 0
  br i1 %85, label %86, label %94

; <label>:86                                      ; preds = %75
  %87 = load %struct.InputParameters** @input, align 8
  %88 = getelementptr inbounds %struct.InputParameters* %87, i32 0, i32 48
  %89 = load i32* %88, align 4
  %90 = icmp ne i32 %89, 0
  br i1 %90, label %91, label %94

; <label>:91                                      ; preds = %86
  %92 = getelementptr inbounds %struct.storable_picture* %84, i32 0, i32 27
  %93 = load i16** %92, align 8
  br label %97

; <label>:94                                      ; preds = %86, %75
  %95 = getelementptr inbounds %struct.storable_picture* %84, i32 0, i32 26
  %96 = load i16** %95, align 8
  br label %97

; <label>:97                                      ; preds = %94, %91
  %ref_pic.0 = phi i16* [ %93, %91 ], [ %96, %94 ]
  %98 = getelementptr inbounds %struct.storable_picture* %84, i32 0, i32 18
  %99 = load i32* %98, align 4
  %100 = sub nsw i32 %99, 17
  %101 = getelementptr inbounds %struct.storable_picture* %84, i32 0, i32 19
  %102 = load i32* %101, align 4
  %103 = sub nsw i32 %102, 17
  %104 = getelementptr inbounds %struct.storable_picture* %84, i32 0, i32 18
  %105 = load i32* %104, align 4
  %106 = getelementptr inbounds %struct.storable_picture* %84, i32 0, i32 19
  %107 = load i32* %106, align 4
  %108 = getelementptr inbounds [2 x i16]* %pmv, i32 0, i32 0
  %109 = load %struct.storable_picture** @enc_picture, align 8
  %110 = getelementptr inbounds %struct.storable_picture* %109, i32 0, i32 32
  %111 = load i16**** %110, align 8
  %112 = load %struct.storable_picture** @enc_picture, align 8
  %113 = getelementptr inbounds %struct.storable_picture* %112, i32 0, i32 35
  %114 = load i16***** %113, align 8
  call void @SetMotionVectorPredictor(i16* %108, i16*** %111, i16**** %114, i16 signext %ref, i32 %list, i32 0, i32 0, i32 16, i32 16)
  %115 = getelementptr inbounds [2 x i16]* %pmv, i32 0, i64 0
  %116 = load i16* %115, align 2
  %117 = sext i16 %116 to i32
  %118 = sdiv i32 %117, 4
  %119 = sext i16 %ref to i64
  %120 = sext i32 %list to i64
  %121 = load i32*** @search_center_x, align 8
  %122 = getelementptr inbounds i32** %121, i64 %120
  %123 = load i32** %122, align 8
  %124 = getelementptr inbounds i32* %123, i64 %119
  store i32 %118, i32* %124, align 4
  %125 = getelementptr inbounds [2 x i16]* %pmv, i32 0, i64 1
  %126 = load i16* %125, align 2
  %127 = sext i16 %126 to i32
  %128 = sdiv i32 %127, 4
  %129 = sext i16 %ref to i64
  %130 = sext i32 %list to i64
  %131 = load i32*** @search_center_y, align 8
  %132 = getelementptr inbounds i32** %131, i64 %130
  %133 = load i32** %132, align 8
  %134 = getelementptr inbounds i32* %133, i64 %129
  store i32 %128, i32* %134, align 4
  %135 = load %struct.InputParameters** @input, align 8
  %136 = getelementptr inbounds %struct.InputParameters* %135, i32 0, i32 85
  %137 = load i32* %136, align 4
  %138 = icmp ne i32 %137, 0
  br i1 %138, label %242, label %139

; <label>:139                                     ; preds = %97
  %140 = sub nsw i32 0, %17
  %141 = sext i16 %ref to i64
  %142 = sext i32 %list to i64
  %143 = load i32*** @search_center_x, align 8
  %144 = getelementptr inbounds i32** %143, i64 %142
  %145 = load i32** %144, align 8
  %146 = getelementptr inbounds i32* %145, i64 %141
  %147 = load i32* %146, align 4
  %148 = icmp slt i32 %17, %147
  br i1 %148, label %149, label %150

; <label>:149                                     ; preds = %139
  br label %158

; <label>:150                                     ; preds = %139
  %151 = sext i16 %ref to i64
  %152 = sext i32 %list to i64
  %153 = load i32*** @search_center_x, align 8
  %154 = getelementptr inbounds i32** %153, i64 %152
  %155 = load i32** %154, align 8
  %156 = getelementptr inbounds i32* %155, i64 %151
  %157 = load i32* %156, align 4
  br label %158

; <label>:158                                     ; preds = %150, %149
  %159 = phi i32 [ %17, %149 ], [ %157, %150 ]
  %160 = icmp sgt i32 %140, %159
  br i1 %160, label %161, label %163

; <label>:161                                     ; preds = %158
  %162 = sub nsw i32 0, %17
  br label %183

; <label>:163                                     ; preds = %158
  %164 = sext i16 %ref to i64
  %165 = sext i32 %list to i64
  %166 = load i32*** @search_center_x, align 8
  %167 = getelementptr inbounds i32** %166, i64 %165
  %168 = load i32** %167, align 8
  %169 = getelementptr inbounds i32* %168, i64 %164
  %170 = load i32* %169, align 4
  %171 = icmp slt i32 %17, %170
  br i1 %171, label %172, label %173

; <label>:172                                     ; preds = %163
  br label %181

; <label>:173                                     ; preds = %163
  %174 = sext i16 %ref to i64
  %175 = sext i32 %list to i64
  %176 = load i32*** @search_center_x, align 8
  %177 = getelementptr inbounds i32** %176, i64 %175
  %178 = load i32** %177, align 8
  %179 = getelementptr inbounds i32* %178, i64 %174
  %180 = load i32* %179, align 4
  br label %181

; <label>:181                                     ; preds = %173, %172
  %182 = phi i32 [ %17, %172 ], [ %180, %173 ]
  br label %183

; <label>:183                                     ; preds = %181, %161
  %184 = phi i32 [ %162, %161 ], [ %182, %181 ]
  %185 = sext i16 %ref to i64
  %186 = sext i32 %list to i64
  %187 = load i32*** @search_center_x, align 8
  %188 = getelementptr inbounds i32** %187, i64 %186
  %189 = load i32** %188, align 8
  %190 = getelementptr inbounds i32* %189, i64 %185
  store i32 %184, i32* %190, align 4
  %191 = sub nsw i32 0, %17
  %192 = sext i16 %ref to i64
  %193 = sext i32 %list to i64
  %194 = load i32*** @search_center_y, align 8
  %195 = getelementptr inbounds i32** %194, i64 %193
  %196 = load i32** %195, align 8
  %197 = getelementptr inbounds i32* %196, i64 %192
  %198 = load i32* %197, align 4
  %199 = icmp slt i32 %17, %198
  br i1 %199, label %200, label %201

; <label>:200                                     ; preds = %183
  br label %209

; <label>:201                                     ; preds = %183
  %202 = sext i16 %ref to i64
  %203 = sext i32 %list to i64
  %204 = load i32*** @search_center_y, align 8
  %205 = getelementptr inbounds i32** %204, i64 %203
  %206 = load i32** %205, align 8
  %207 = getelementptr inbounds i32* %206, i64 %202
  %208 = load i32* %207, align 4
  br label %209

; <label>:209                                     ; preds = %201, %200
  %210 = phi i32 [ %17, %200 ], [ %208, %201 ]
  %211 = icmp sgt i32 %191, %210
  br i1 %211, label %212, label %214

; <label>:212                                     ; preds = %209
  %213 = sub nsw i32 0, %17
  br label %234

; <label>:214                                     ; preds = %209
  %215 = sext i16 %ref to i64
  %216 = sext i32 %list to i64
  %217 = load i32*** @search_center_y, align 8
  %218 = getelementptr inbounds i32** %217, i64 %216
  %219 = load i32** %218, align 8
  %220 = getelementptr inbounds i32* %219, i64 %215
  %221 = load i32* %220, align 4
  %222 = icmp slt i32 %17, %221
  br i1 %222, label %223, label %224

; <label>:223                                     ; preds = %214
  br label %232

; <label>:224                                     ; preds = %214
  %225 = sext i16 %ref to i64
  %226 = sext i32 %list to i64
  %227 = load i32*** @search_center_y, align 8
  %228 = getelementptr inbounds i32** %227, i64 %226
  %229 = load i32** %228, align 8
  %230 = getelementptr inbounds i32* %229, i64 %225
  %231 = load i32* %230, align 4
  br label %232

; <label>:232                                     ; preds = %224, %223
  %233 = phi i32 [ %17, %223 ], [ %231, %224 ]
  br label %234

; <label>:234                                     ; preds = %232, %212
  %235 = phi i32 [ %213, %212 ], [ %233, %232 ]
  %236 = sext i16 %ref to i64
  %237 = sext i32 %list to i64
  %238 = load i32*** @search_center_y, align 8
  %239 = getelementptr inbounds i32** %238, i64 %237
  %240 = load i32** %239, align 8
  %241 = getelementptr inbounds i32* %240, i64 %236
  store i32 %235, i32* %241, align 4
  br label %242

; <label>:242                                     ; preds = %234, %97
  %243 = load %struct.ImageParameters** @img, align 8
  %244 = getelementptr inbounds %struct.ImageParameters* %243, i32 0, i32 37
  %245 = load i32* %244, align 4
  %246 = sext i16 %ref to i64
  %247 = sext i32 %list to i64
  %248 = load i32*** @search_center_x, align 8
  %249 = getelementptr inbounds i32** %248, i64 %247
  %250 = load i32** %249, align 8
  %251 = getelementptr inbounds i32* %250, i64 %246
  %252 = load i32* %251, align 4
  %253 = add nsw i32 %252, %245
  store i32 %253, i32* %251, align 4
  %254 = load %struct.ImageParameters** @img, align 8
  %255 = getelementptr inbounds %struct.ImageParameters* %254, i32 0, i32 38
  %256 = load i32* %255, align 4
  %257 = sext i16 %ref to i64
  %258 = sext i32 %list to i64
  %259 = load i32*** @search_center_y, align 8
  %260 = getelementptr inbounds i32** %259, i64 %258
  %261 = load i32** %260, align 8
  %262 = getelementptr inbounds i32* %261, i64 %257
  %263 = load i32* %262, align 4
  %264 = add nsw i32 %263, %256
  store i32 %264, i32* %262, align 4
  %265 = sext i16 %ref to i64
  %266 = sext i32 %list to i64
  %267 = load i32*** @search_center_x, align 8
  %268 = getelementptr inbounds i32** %267, i64 %266
  %269 = load i32** %268, align 8
  %270 = getelementptr inbounds i32* %269, i64 %265
  %271 = load i32* %270, align 4
  %272 = sext i16 %ref to i64
  %273 = sext i32 %list to i64
  %274 = load i32*** @search_center_y, align 8
  %275 = getelementptr inbounds i32** %274, i64 %273
  %276 = load i32** %275, align 8
  %277 = getelementptr inbounds i32* %276, i64 %272
  %278 = load i32* %277, align 4
  %279 = load %struct.ImageParameters** @img, align 8
  %280 = getelementptr inbounds %struct.ImageParameters* %279, i32 0, i32 38
  %281 = load i32* %280, align 4
  br label %282

; <label>:282                                     ; preds = %310, %242
  %y.0 = phi i32 [ %281, %242 ], [ %311, %310 ]
  %orgptr.0 = phi i16* [ %1, %242 ], [ %orgptr.1, %310 ]
  %283 = load %struct.ImageParameters** @img, align 8
  %284 = getelementptr inbounds %struct.ImageParameters* %283, i32 0, i32 38
  %285 = load i32* %284, align 4
  %286 = add nsw i32 %285, 16
  %287 = icmp slt i32 %y.0, %286
  br i1 %287, label %288, label %312

; <label>:288                                     ; preds = %282
  %289 = load %struct.ImageParameters** @img, align 8
  %290 = getelementptr inbounds %struct.ImageParameters* %289, i32 0, i32 37
  %291 = load i32* %290, align 4
  br label %292

; <label>:292                                     ; preds = %307, %288
  %x.0 = phi i32 [ %291, %288 ], [ %308, %307 ]
  %orgptr.1 = phi i16* [ %orgptr.0, %288 ], [ %306, %307 ]
  %293 = load %struct.ImageParameters** @img, align 8
  %294 = getelementptr inbounds %struct.ImageParameters* %293, i32 0, i32 37
  %295 = load i32* %294, align 4
  %296 = add nsw i32 %295, 16
  %297 = icmp slt i32 %x.0, %296
  br i1 %297, label %298, label %309

; <label>:298                                     ; preds = %292
  %299 = sext i32 %x.0 to i64
  %300 = sext i32 %y.0 to i64
  %301 = load i16*** @imgY_org, align 8
  %302 = getelementptr inbounds i16** %301, i64 %300
  %303 = load i16** %302, align 8
  %304 = getelementptr inbounds i16* %303, i64 %299
  %305 = load i16* %304, align 2
  %306 = getelementptr inbounds i16* %orgptr.1, i32 1
  store i16 %305, i16* %orgptr.1, align 2
  br label %307

; <label>:307                                     ; preds = %298
  %308 = add nsw i32 %x.0, 1
  br label %292

; <label>:309                                     ; preds = %292
  br label %310

; <label>:310                                     ; preds = %309
  %311 = add nsw i32 %y.0, 1
  br label %282

; <label>:312                                     ; preds = %282
  %313 = icmp sge i32 %271, %17
  br i1 %313, label %314, label %323

; <label>:314                                     ; preds = %312
  %315 = sub nsw i32 %100, %17
  %316 = icmp sle i32 %271, %315
  br i1 %316, label %317, label %323

; <label>:317                                     ; preds = %314
  %318 = icmp sge i32 %278, %17
  br i1 %318, label %319, label %323

; <label>:319                                     ; preds = %317
  %320 = sub nsw i32 %103, %17
  %321 = icmp sle i32 %278, %320
  br i1 %321, label %322, label %323

; <label>:322                                     ; preds = %319
  store i16* (i16*, i32, i32, i32, i32)* @FastLine16Y_11, i16* (i16*, i32, i32, i32, i32)** @PelYline_11, align 8
  br label %324

; <label>:323                                     ; preds = %319, %317, %314, %312
  br label %324

; <label>:324                                     ; preds = %323, %322
  %range_partly_outside.0 = phi i32 [ 0, %322 ], [ 1, %323 ]
  %325 = load %struct.InputParameters** @input, align 8
  %326 = getelementptr inbounds %struct.InputParameters* %325, i32 0, i32 85
  %327 = load i32* %326, align 4
  %328 = icmp ne i32 %327, 0
  br i1 %328, label %363, label %329

; <label>:329                                     ; preds = %324
  %330 = load %struct.ImageParameters** @img, align 8
  %331 = getelementptr inbounds %struct.ImageParameters* %330, i32 0, i32 37
  %332 = load i32* %331, align 4
  %333 = sub nsw i32 %332, %271
  %334 = load %struct.ImageParameters** @img, align 8
  %335 = getelementptr inbounds %struct.ImageParameters* %334, i32 0, i32 38
  %336 = load i32* %335, align 4
  %337 = sub nsw i32 %336, %278
  br label %338

; <label>:338                                     ; preds = %360, %329
  %pos.0 = phi i32 [ 0, %329 ], [ %361, %360 ]
  %339 = icmp slt i32 %pos.0, %22
  br i1 %339, label %340, label %362

; <label>:340                                     ; preds = %338
  %341 = sext i32 %pos.0 to i64
  %342 = load i32** @spiral_search_x, align 8
  %343 = getelementptr inbounds i32* %342, i64 %341
  %344 = load i32* %343, align 4
  %345 = icmp eq i32 %333, %344
  br i1 %345, label %346, label %359

; <label>:346                                     ; preds = %340
  %347 = sext i32 %pos.0 to i64
  %348 = load i32** @spiral_search_y, align 8
  %349 = getelementptr inbounds i32* %348, i64 %347
  %350 = load i32* %349, align 4
  %351 = icmp eq i32 %337, %350
  br i1 %351, label %352, label %359

; <label>:352                                     ; preds = %346
  %353 = sext i16 %ref to i64
  %354 = sext i32 %list to i64
  %355 = load i32*** @pos_00, align 8
  %356 = getelementptr inbounds i32** %355, i64 %354
  %357 = load i32** %356, align 8
  %358 = getelementptr inbounds i32* %357, i64 %353
  store i32 %pos.0, i32* %358, align 4
  br label %362

; <label>:359                                     ; preds = %346, %340
  br label %360

; <label>:360                                     ; preds = %359
  %361 = add nsw i32 %pos.0, 1
  br label %338

; <label>:362                                     ; preds = %352, %338
  br label %363

; <label>:363                                     ; preds = %362, %324
  br label %364

; <label>:364                                     ; preds = %622, %363
  %pos.1 = phi i32 [ 0, %363 ], [ %623, %622 ]
  %365 = icmp slt i32 %pos.1, %22
  br i1 %365, label %366, label %624

; <label>:366                                     ; preds = %364
  %367 = sext i32 %pos.1 to i64
  %368 = load i32** @spiral_search_y, align 8
  %369 = getelementptr inbounds i32* %368, i64 %367
  %370 = load i32* %369, align 4
  %371 = add nsw i32 %278, %370
  %372 = sext i32 %pos.1 to i64
  %373 = load i32** @spiral_search_x, align 8
  %374 = getelementptr inbounds i32* %373, i64 %372
  %375 = load i32* %374, align 4
  %376 = add nsw i32 %271, %375
  %377 = icmp ne i32 %range_partly_outside.0, 0
  br i1 %377, label %378, label %389

; <label>:378                                     ; preds = %366
  %379 = icmp sge i32 %371, 0
  br i1 %379, label %380, label %387

; <label>:380                                     ; preds = %378
  %381 = icmp sle i32 %371, %103
  br i1 %381, label %382, label %387

; <label>:382                                     ; preds = %380
  %383 = icmp sge i32 %376, 0
  br i1 %383, label %384, label %387

; <label>:384                                     ; preds = %382
  %385 = icmp sle i32 %376, %100
  br i1 %385, label %386, label %387

; <label>:386                                     ; preds = %384
  store i16* (i16*, i32, i32, i32, i32)* @FastLine16Y_11, i16* (i16*, i32, i32, i32, i32)** @PelYline_11, align 8
  br label %388

; <label>:387                                     ; preds = %384, %382, %380, %378
  store i16* (i16*, i32, i32, i32, i32)* @UMVLine16Y_11, i16* (i16*, i32, i32, i32, i32)** @PelYline_11, align 8
  br label %388

; <label>:388                                     ; preds = %387, %386
  br label %389

; <label>:389                                     ; preds = %388, %366
  %390 = getelementptr inbounds [256 x i16]* %orig_blocks, i32 0, i32 0
  br label %391

; <label>:391                                     ; preds = %619, %389
  %abs_y.0 = phi i32 [ %371, %389 ], [ %abs_y.1, %619 ]
  %bindex.0 = phi i32 [ 0, %389 ], [ %614, %619 ]
  %blky.0 = phi i32 [ 0, %389 ], [ %620, %619 ]
  %orgptr.2 = phi i16* [ %390, %389 ], [ %orgptr.3, %619 ]
  %392 = icmp slt i32 %blky.0, 4
  br i1 %392, label %393, label %621

; <label>:393                                     ; preds = %391
  br label %394

; <label>:394                                     ; preds = %592, %393
  %abs_y.1 = phi i32 [ %abs_y.0, %393 ], [ %398, %592 ]
  %y.1 = phi i32 [ 0, %393 ], [ %593, %592 ]
  %LineSadBlk0.0 = phi i32 [ 0, %393 ], [ %447, %592 ]
  %LineSadBlk1.0 = phi i32 [ 0, %393 ], [ %495, %592 ]
  %LineSadBlk2.0 = phi i32 [ 0, %393 ], [ %543, %592 ]
  %orgptr.3 = phi i16* [ %orgptr.2, %393 ], [ %583, %592 ]
  %LineSadBlk3.0 = phi i32 [ 0, %393 ], [ %591, %592 ]
  %395 = icmp slt i32 %y.1, 4
  br i1 %395, label %396, label %594

; <label>:396                                     ; preds = %394
  %397 = load i16* (i16*, i32, i32, i32, i32)** @PelYline_11, align 8
  %398 = add nsw i32 %abs_y.1, 1
  %399 = call i16* %397(i16* %ref_pic.0, i32 %abs_y.1, i32 %376, i32 %107, i32 %105)
  %400 = getelementptr inbounds i16* %399, i32 1
  %401 = load i16* %399, align 2
  %402 = zext i16 %401 to i32
  %403 = getelementptr inbounds i16* %orgptr.3, i32 1
  %404 = load i16* %orgptr.3, align 2
  %405 = zext i16 %404 to i32
  %406 = sub nsw i32 %402, %405
  %407 = sext i32 %406 to i64
  %408 = load i32** @byte_abs, align 8
  %409 = getelementptr inbounds i32* %408, i64 %407
  %410 = load i32* %409, align 4
  %411 = add nsw i32 %LineSadBlk0.0, %410
  %412 = getelementptr inbounds i16* %400, i32 1
  %413 = load i16* %400, align 2
  %414 = zext i16 %413 to i32
  %415 = getelementptr inbounds i16* %403, i32 1
  %416 = load i16* %403, align 2
  %417 = zext i16 %416 to i32
  %418 = sub nsw i32 %414, %417
  %419 = sext i32 %418 to i64
  %420 = load i32** @byte_abs, align 8
  %421 = getelementptr inbounds i32* %420, i64 %419
  %422 = load i32* %421, align 4
  %423 = add nsw i32 %411, %422
  %424 = getelementptr inbounds i16* %412, i32 1
  %425 = load i16* %412, align 2
  %426 = zext i16 %425 to i32
  %427 = getelementptr inbounds i16* %415, i32 1
  %428 = load i16* %415, align 2
  %429 = zext i16 %428 to i32
  %430 = sub nsw i32 %426, %429
  %431 = sext i32 %430 to i64
  %432 = load i32** @byte_abs, align 8
  %433 = getelementptr inbounds i32* %432, i64 %431
  %434 = load i32* %433, align 4
  %435 = add nsw i32 %423, %434
  %436 = getelementptr inbounds i16* %424, i32 1
  %437 = load i16* %424, align 2
  %438 = zext i16 %437 to i32
  %439 = getelementptr inbounds i16* %427, i32 1
  %440 = load i16* %427, align 2
  %441 = zext i16 %440 to i32
  %442 = sub nsw i32 %438, %441
  %443 = sext i32 %442 to i64
  %444 = load i32** @byte_abs, align 8
  %445 = getelementptr inbounds i32* %444, i64 %443
  %446 = load i32* %445, align 4
  %447 = add nsw i32 %435, %446
  %448 = getelementptr inbounds i16* %436, i32 1
  %449 = load i16* %436, align 2
  %450 = zext i16 %449 to i32
  %451 = getelementptr inbounds i16* %439, i32 1
  %452 = load i16* %439, align 2
  %453 = zext i16 %452 to i32
  %454 = sub nsw i32 %450, %453
  %455 = sext i32 %454 to i64
  %456 = load i32** @byte_abs, align 8
  %457 = getelementptr inbounds i32* %456, i64 %455
  %458 = load i32* %457, align 4
  %459 = add nsw i32 %LineSadBlk1.0, %458
  %460 = getelementptr inbounds i16* %448, i32 1
  %461 = load i16* %448, align 2
  %462 = zext i16 %461 to i32
  %463 = getelementptr inbounds i16* %451, i32 1
  %464 = load i16* %451, align 2
  %465 = zext i16 %464 to i32
  %466 = sub nsw i32 %462, %465
  %467 = sext i32 %466 to i64
  %468 = load i32** @byte_abs, align 8
  %469 = getelementptr inbounds i32* %468, i64 %467
  %470 = load i32* %469, align 4
  %471 = add nsw i32 %459, %470
  %472 = getelementptr inbounds i16* %460, i32 1
  %473 = load i16* %460, align 2
  %474 = zext i16 %473 to i32
  %475 = getelementptr inbounds i16* %463, i32 1
  %476 = load i16* %463, align 2
  %477 = zext i16 %476 to i32
  %478 = sub nsw i32 %474, %477
  %479 = sext i32 %478 to i64
  %480 = load i32** @byte_abs, align 8
  %481 = getelementptr inbounds i32* %480, i64 %479
  %482 = load i32* %481, align 4
  %483 = add nsw i32 %471, %482
  %484 = getelementptr inbounds i16* %472, i32 1
  %485 = load i16* %472, align 2
  %486 = zext i16 %485 to i32
  %487 = getelementptr inbounds i16* %475, i32 1
  %488 = load i16* %475, align 2
  %489 = zext i16 %488 to i32
  %490 = sub nsw i32 %486, %489
  %491 = sext i32 %490 to i64
  %492 = load i32** @byte_abs, align 8
  %493 = getelementptr inbounds i32* %492, i64 %491
  %494 = load i32* %493, align 4
  %495 = add nsw i32 %483, %494
  %496 = getelementptr inbounds i16* %484, i32 1
  %497 = load i16* %484, align 2
  %498 = zext i16 %497 to i32
  %499 = getelementptr inbounds i16* %487, i32 1
  %500 = load i16* %487, align 2
  %501 = zext i16 %500 to i32
  %502 = sub nsw i32 %498, %501
  %503 = sext i32 %502 to i64
  %504 = load i32** @byte_abs, align 8
  %505 = getelementptr inbounds i32* %504, i64 %503
  %506 = load i32* %505, align 4
  %507 = add nsw i32 %LineSadBlk2.0, %506
  %508 = getelementptr inbounds i16* %496, i32 1
  %509 = load i16* %496, align 2
  %510 = zext i16 %509 to i32
  %511 = getelementptr inbounds i16* %499, i32 1
  %512 = load i16* %499, align 2
  %513 = zext i16 %512 to i32
  %514 = sub nsw i32 %510, %513
  %515 = sext i32 %514 to i64
  %516 = load i32** @byte_abs, align 8
  %517 = getelementptr inbounds i32* %516, i64 %515
  %518 = load i32* %517, align 4
  %519 = add nsw i32 %507, %518
  %520 = getelementptr inbounds i16* %508, i32 1
  %521 = load i16* %508, align 2
  %522 = zext i16 %521 to i32
  %523 = getelementptr inbounds i16* %511, i32 1
  %524 = load i16* %511, align 2
  %525 = zext i16 %524 to i32
  %526 = sub nsw i32 %522, %525
  %527 = sext i32 %526 to i64
  %528 = load i32** @byte_abs, align 8
  %529 = getelementptr inbounds i32* %528, i64 %527
  %530 = load i32* %529, align 4
  %531 = add nsw i32 %519, %530
  %532 = getelementptr inbounds i16* %520, i32 1
  %533 = load i16* %520, align 2
  %534 = zext i16 %533 to i32
  %535 = getelementptr inbounds i16* %523, i32 1
  %536 = load i16* %523, align 2
  %537 = zext i16 %536 to i32
  %538 = sub nsw i32 %534, %537
  %539 = sext i32 %538 to i64
  %540 = load i32** @byte_abs, align 8
  %541 = getelementptr inbounds i32* %540, i64 %539
  %542 = load i32* %541, align 4
  %543 = add nsw i32 %531, %542
  %544 = getelementptr inbounds i16* %532, i32 1
  %545 = load i16* %532, align 2
  %546 = zext i16 %545 to i32
  %547 = getelementptr inbounds i16* %535, i32 1
  %548 = load i16* %535, align 2
  %549 = zext i16 %548 to i32
  %550 = sub nsw i32 %546, %549
  %551 = sext i32 %550 to i64
  %552 = load i32** @byte_abs, align 8
  %553 = getelementptr inbounds i32* %552, i64 %551
  %554 = load i32* %553, align 4
  %555 = add nsw i32 %LineSadBlk3.0, %554
  %556 = getelementptr inbounds i16* %544, i32 1
  %557 = load i16* %544, align 2
  %558 = zext i16 %557 to i32
  %559 = getelementptr inbounds i16* %547, i32 1
  %560 = load i16* %547, align 2
  %561 = zext i16 %560 to i32
  %562 = sub nsw i32 %558, %561
  %563 = sext i32 %562 to i64
  %564 = load i32** @byte_abs, align 8
  %565 = getelementptr inbounds i32* %564, i64 %563
  %566 = load i32* %565, align 4
  %567 = add nsw i32 %555, %566
  %568 = getelementptr inbounds i16* %556, i32 1
  %569 = load i16* %556, align 2
  %570 = zext i16 %569 to i32
  %571 = getelementptr inbounds i16* %559, i32 1
  %572 = load i16* %559, align 2
  %573 = zext i16 %572 to i32
  %574 = sub nsw i32 %570, %573
  %575 = sext i32 %574 to i64
  %576 = load i32** @byte_abs, align 8
  %577 = getelementptr inbounds i32* %576, i64 %575
  %578 = load i32* %577, align 4
  %579 = add nsw i32 %567, %578
  %580 = getelementptr inbounds i16* %568, i32 1
  %581 = load i16* %568, align 2
  %582 = zext i16 %581 to i32
  %583 = getelementptr inbounds i16* %571, i32 1
  %584 = load i16* %571, align 2
  %585 = zext i16 %584 to i32
  %586 = sub nsw i32 %582, %585
  %587 = sext i32 %586 to i64
  %588 = load i32** @byte_abs, align 8
  %589 = getelementptr inbounds i32* %588, i64 %587
  %590 = load i32* %589, align 4
  %591 = add nsw i32 %579, %590
  br label %592

; <label>:592                                     ; preds = %396
  %593 = add nsw i32 %y.1, 1
  br label %394

; <label>:594                                     ; preds = %394
  %595 = sext i32 %pos.1 to i64
  %596 = add nsw i32 %bindex.0, 1
  %597 = sext i32 %bindex.0 to i64
  %598 = getelementptr inbounds i32** %10, i64 %597
  %599 = load i32** %598, align 8
  %600 = getelementptr inbounds i32* %599, i64 %595
  store i32 %LineSadBlk0.0, i32* %600, align 4
  %601 = sext i32 %pos.1 to i64
  %602 = add nsw i32 %596, 1
  %603 = sext i32 %596 to i64
  %604 = getelementptr inbounds i32** %10, i64 %603
  %605 = load i32** %604, align 8
  %606 = getelementptr inbounds i32* %605, i64 %601
  store i32 %LineSadBlk1.0, i32* %606, align 4
  %607 = sext i32 %pos.1 to i64
  %608 = add nsw i32 %602, 1
  %609 = sext i32 %602 to i64
  %610 = getelementptr inbounds i32** %10, i64 %609
  %611 = load i32** %610, align 8
  %612 = getelementptr inbounds i32* %611, i64 %607
  store i32 %LineSadBlk2.0, i32* %612, align 4
  %613 = sext i32 %pos.1 to i64
  %614 = add nsw i32 %608, 1
  %615 = sext i32 %608 to i64
  %616 = getelementptr inbounds i32** %10, i64 %615
  %617 = load i32** %616, align 8
  %618 = getelementptr inbounds i32* %617, i64 %613
  store i32 %LineSadBlk3.0, i32* %618, align 4
  br label %619

; <label>:619                                     ; preds = %594
  %620 = add nsw i32 %blky.0, 1
  br label %391

; <label>:621                                     ; preds = %391
  br label %622

; <label>:622                                     ; preds = %621
  %623 = add nsw i32 %pos.1, 1
  br label %364

; <label>:624                                     ; preds = %364
  %625 = sext i16 %ref to i32
  call void @SetupLargerBlocks(i32 %list, i32 %625, i32 %22)
  %626 = sext i16 %ref to i64
  %627 = sext i32 %list to i64
  %628 = load i32*** @search_setup_done, align 8
  %629 = getelementptr inbounds i32** %628, i64 %627
  %630 = load i32** %629, align 8
  %631 = getelementptr inbounds i32* %630, i64 %626
  store i32 1, i32* %631, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @SetMotionVectorPredictor(i16* %pmv, i16*** %refPic, i16**** %tmp_mv, i16 signext %ref_frame, i32 %list, i32 %block_x, i32 %block_y, i32 %blockshape_x, i32 %blockshape_y) #0 {
  %block_a = alloca %struct.pix_pos, align 4
  %block_b = alloca %struct.pix_pos, align 4
  %block_c = alloca %struct.pix_pos, align 4
  %block_d = alloca %struct.pix_pos, align 4
  %temp_pred_SAD = alloca [2 x i32], align 4
  %1 = mul nsw i32 4, %block_x
  %2 = mul nsw i32 4, %block_y
  %3 = load %struct.ImageParameters** @img, align 8
  %4 = getelementptr inbounds %struct.ImageParameters* %3, i32 0, i32 3
  %5 = load i32* %4, align 4
  %6 = load %struct.InputParameters** @input, align 8
  %7 = getelementptr inbounds %struct.InputParameters* %6, i32 0, i32 134
  %8 = load i32* %7, align 4
  %9 = icmp ne i32 %8, 0
  br i1 %9, label %10, label %11

; <label>:10                                      ; preds = %0
  store i32 0, i32* @pred_SAD_space, align 4
  br label %11

; <label>:11                                      ; preds = %10, %0
  call void @getLuma4x4Neighbour(i32 %5, i32 %block_x, i32 %block_y, i32 -1, i32 0, %struct.pix_pos* %block_a)
  call void @getLuma4x4Neighbour(i32 %5, i32 %block_x, i32 %block_y, i32 0, i32 -1, %struct.pix_pos* %block_b)
  call void @getLuma4x4Neighbour(i32 %5, i32 %block_x, i32 %block_y, i32 %blockshape_x, i32 -1, %struct.pix_pos* %block_c)
  call void @getLuma4x4Neighbour(i32 %5, i32 %block_x, i32 %block_y, i32 -1, i32 -1, %struct.pix_pos* %block_d)
  %12 = icmp sgt i32 %2, 0
  br i1 %12, label %13, label %48

; <label>:13                                      ; preds = %11
  %14 = icmp slt i32 %1, 8
  br i1 %14, label %15, label %37

; <label>:15                                      ; preds = %13
  %16 = icmp eq i32 %2, 8
  br i1 %16, label %17, label %26

; <label>:17                                      ; preds = %15
  %18 = icmp eq i32 %blockshape_x, 16
  br i1 %18, label %19, label %21

; <label>:19                                      ; preds = %17
  %20 = getelementptr inbounds %struct.pix_pos* %block_c, i32 0, i32 0
  store i32 0, i32* %20, align 4
  br label %25

; <label>:21                                      ; preds = %17
  %22 = getelementptr inbounds %struct.pix_pos* %block_c, i32 0, i32 0
  %23 = load i32* %22, align 4
  %24 = and i32 %23, 1
  store i32 %24, i32* %22, align 4
  br label %25

; <label>:25                                      ; preds = %21, %19
  br label %36

; <label>:26                                      ; preds = %15
  %27 = add nsw i32 %1, %blockshape_x
  %28 = icmp ne i32 %27, 8
  br i1 %28, label %29, label %33

; <label>:29                                      ; preds = %26
  %30 = getelementptr inbounds %struct.pix_pos* %block_c, i32 0, i32 0
  %31 = load i32* %30, align 4
  %32 = and i32 %31, 1
  store i32 %32, i32* %30, align 4
  br label %35

; <label>:33                                      ; preds = %26
  %34 = getelementptr inbounds %struct.pix_pos* %block_c, i32 0, i32 0
  store i32 0, i32* %34, align 4
  br label %35

; <label>:35                                      ; preds = %33, %29
  br label %36

; <label>:36                                      ; preds = %35, %25
  br label %47

; <label>:37                                      ; preds = %13
  %38 = add nsw i32 %1, %blockshape_x
  %39 = icmp ne i32 %38, 16
  br i1 %39, label %40, label %44

; <label>:40                                      ; preds = %37
  %41 = getelementptr inbounds %struct.pix_pos* %block_c, i32 0, i32 0
  %42 = load i32* %41, align 4
  %43 = and i32 %42, 1
  store i32 %43, i32* %41, align 4
  br label %46

; <label>:44                                      ; preds = %37
  %45 = getelementptr inbounds %struct.pix_pos* %block_c, i32 0, i32 0
  store i32 0, i32* %45, align 4
  br label %46

; <label>:46                                      ; preds = %44, %40
  br label %47

; <label>:47                                      ; preds = %46, %36
  br label %48

; <label>:48                                      ; preds = %47, %11
  %49 = getelementptr inbounds %struct.pix_pos* %block_c, i32 0, i32 0
  %50 = load i32* %49, align 4
  %51 = icmp ne i32 %50, 0
  br i1 %51, label %55, label %52

; <label>:52                                      ; preds = %48
  %53 = bitcast %struct.pix_pos* %block_c to i8*
  %54 = bitcast %struct.pix_pos* %block_d to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %53, i8* %54, i64 24, i32 4, i1 false)
  br label %55

; <label>:55                                      ; preds = %52, %48
  %56 = load %struct.ImageParameters** @img, align 8
  %57 = getelementptr inbounds %struct.ImageParameters* %56, i32 0, i32 90
  %58 = load i32* %57, align 4
  %59 = icmp ne i32 %58, 0
  br i1 %59, label %124, label %60

; <label>:60                                      ; preds = %55
  %61 = getelementptr inbounds %struct.pix_pos* %block_a, i32 0, i32 0
  %62 = load i32* %61, align 4
  %63 = icmp ne i32 %62, 0
  br i1 %63, label %64, label %79

; <label>:64                                      ; preds = %60
  %65 = getelementptr inbounds %struct.pix_pos* %block_a, i32 0, i32 5
  %66 = load i32* %65, align 4
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds %struct.pix_pos* %block_a, i32 0, i32 4
  %69 = load i32* %68, align 4
  %70 = sext i32 %69 to i64
  %71 = sext i32 %list to i64
  %72 = getelementptr inbounds i16*** %refPic, i64 %71
  %73 = load i16*** %72, align 8
  %74 = getelementptr inbounds i16** %73, i64 %70
  %75 = load i16** %74, align 8
  %76 = getelementptr inbounds i16* %75, i64 %67
  %77 = load i16* %76, align 2
  %78 = sext i16 %77 to i32
  br label %80

; <label>:79                                      ; preds = %60
  br label %80

; <label>:80                                      ; preds = %79, %64
  %81 = phi i32 [ %78, %64 ], [ -1, %79 ]
  %82 = getelementptr inbounds %struct.pix_pos* %block_b, i32 0, i32 0
  %83 = load i32* %82, align 4
  %84 = icmp ne i32 %83, 0
  br i1 %84, label %85, label %100

; <label>:85                                      ; preds = %80
  %86 = getelementptr inbounds %struct.pix_pos* %block_b, i32 0, i32 5
  %87 = load i32* %86, align 4
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds %struct.pix_pos* %block_b, i32 0, i32 4
  %90 = load i32* %89, align 4
  %91 = sext i32 %90 to i64
  %92 = sext i32 %list to i64
  %93 = getelementptr inbounds i16*** %refPic, i64 %92
  %94 = load i16*** %93, align 8
  %95 = getelementptr inbounds i16** %94, i64 %91
  %96 = load i16** %95, align 8
  %97 = getelementptr inbounds i16* %96, i64 %88
  %98 = load i16* %97, align 2
  %99 = sext i16 %98 to i32
  br label %101

; <label>:100                                     ; preds = %80
  br label %101

; <label>:101                                     ; preds = %100, %85
  %102 = phi i32 [ %99, %85 ], [ -1, %100 ]
  %103 = getelementptr inbounds %struct.pix_pos* %block_c, i32 0, i32 0
  %104 = load i32* %103, align 4
  %105 = icmp ne i32 %104, 0
  br i1 %105, label %106, label %121

; <label>:106                                     ; preds = %101
  %107 = getelementptr inbounds %struct.pix_pos* %block_c, i32 0, i32 5
  %108 = load i32* %107, align 4
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds %struct.pix_pos* %block_c, i32 0, i32 4
  %111 = load i32* %110, align 4
  %112 = sext i32 %111 to i64
  %113 = sext i32 %list to i64
  %114 = getelementptr inbounds i16*** %refPic, i64 %113
  %115 = load i16*** %114, align 8
  %116 = getelementptr inbounds i16** %115, i64 %112
  %117 = load i16** %116, align 8
  %118 = getelementptr inbounds i16* %117, i64 %109
  %119 = load i16* %118, align 2
  %120 = sext i16 %119 to i32
  br label %122

; <label>:121                                     ; preds = %101
  br label %122

; <label>:122                                     ; preds = %121, %106
  %123 = phi i32 [ %120, %106 ], [ -1, %121 ]
  br label %439

; <label>:124                                     ; preds = %55
  %125 = load %struct.ImageParameters** @img, align 8
  %126 = getelementptr inbounds %struct.ImageParameters* %125, i32 0, i32 3
  %127 = load i32* %126, align 4
  %128 = sext i32 %127 to i64
  %129 = load %struct.ImageParameters** @img, align 8
  %130 = getelementptr inbounds %struct.ImageParameters* %129, i32 0, i32 51
  %131 = load %struct.macroblock** %130, align 8
  %132 = getelementptr inbounds %struct.macroblock* %131, i64 %128
  %133 = getelementptr inbounds %struct.macroblock* %132, i32 0, i32 22
  %134 = load i32* %133, align 4
  %135 = icmp ne i32 %134, 0
  br i1 %135, label %136, label %287

; <label>:136                                     ; preds = %124
  %137 = getelementptr inbounds %struct.pix_pos* %block_a, i32 0, i32 0
  %138 = load i32* %137, align 4
  %139 = icmp ne i32 %138, 0
  br i1 %139, label %140, label %184

; <label>:140                                     ; preds = %136
  %141 = getelementptr inbounds %struct.pix_pos* %block_a, i32 0, i32 1
  %142 = load i32* %141, align 4
  %143 = sext i32 %142 to i64
  %144 = load %struct.ImageParameters** @img, align 8
  %145 = getelementptr inbounds %struct.ImageParameters* %144, i32 0, i32 51
  %146 = load %struct.macroblock** %145, align 8
  %147 = getelementptr inbounds %struct.macroblock* %146, i64 %143
  %148 = getelementptr inbounds %struct.macroblock* %147, i32 0, i32 22
  %149 = load i32* %148, align 4
  %150 = icmp ne i32 %149, 0
  br i1 %150, label %151, label %166

; <label>:151                                     ; preds = %140
  %152 = getelementptr inbounds %struct.pix_pos* %block_a, i32 0, i32 5
  %153 = load i32* %152, align 4
  %154 = sext i32 %153 to i64
  %155 = getelementptr inbounds %struct.pix_pos* %block_a, i32 0, i32 4
  %156 = load i32* %155, align 4
  %157 = sext i32 %156 to i64
  %158 = sext i32 %list to i64
  %159 = getelementptr inbounds i16*** %refPic, i64 %158
  %160 = load i16*** %159, align 8
  %161 = getelementptr inbounds i16** %160, i64 %157
  %162 = load i16** %161, align 8
  %163 = getelementptr inbounds i16* %162, i64 %154
  %164 = load i16* %163, align 2
  %165 = sext i16 %164 to i32
  br label %182

; <label>:166                                     ; preds = %140
  %167 = getelementptr inbounds %struct.pix_pos* %block_a, i32 0, i32 5
  %168 = load i32* %167, align 4
  %169 = sext i32 %168 to i64
  %170 = getelementptr inbounds %struct.pix_pos* %block_a, i32 0, i32 4
  %171 = load i32* %170, align 4
  %172 = sext i32 %171 to i64
  %173 = sext i32 %list to i64
  %174 = getelementptr inbounds i16*** %refPic, i64 %173
  %175 = load i16*** %174, align 8
  %176 = getelementptr inbounds i16** %175, i64 %172
  %177 = load i16** %176, align 8
  %178 = getelementptr inbounds i16* %177, i64 %169
  %179 = load i16* %178, align 2
  %180 = sext i16 %179 to i32
  %181 = mul nsw i32 %180, 2
  br label %182

; <label>:182                                     ; preds = %166, %151
  %183 = phi i32 [ %165, %151 ], [ %181, %166 ]
  br label %185

; <label>:184                                     ; preds = %136
  br label %185

; <label>:185                                     ; preds = %184, %182
  %186 = phi i32 [ %183, %182 ], [ -1, %184 ]
  %187 = getelementptr inbounds %struct.pix_pos* %block_b, i32 0, i32 0
  %188 = load i32* %187, align 4
  %189 = icmp ne i32 %188, 0
  br i1 %189, label %190, label %234

; <label>:190                                     ; preds = %185
  %191 = getelementptr inbounds %struct.pix_pos* %block_b, i32 0, i32 1
  %192 = load i32* %191, align 4
  %193 = sext i32 %192 to i64
  %194 = load %struct.ImageParameters** @img, align 8
  %195 = getelementptr inbounds %struct.ImageParameters* %194, i32 0, i32 51
  %196 = load %struct.macroblock** %195, align 8
  %197 = getelementptr inbounds %struct.macroblock* %196, i64 %193
  %198 = getelementptr inbounds %struct.macroblock* %197, i32 0, i32 22
  %199 = load i32* %198, align 4
  %200 = icmp ne i32 %199, 0
  br i1 %200, label %201, label %216

; <label>:201                                     ; preds = %190
  %202 = getelementptr inbounds %struct.pix_pos* %block_b, i32 0, i32 5
  %203 = load i32* %202, align 4
  %204 = sext i32 %203 to i64
  %205 = getelementptr inbounds %struct.pix_pos* %block_b, i32 0, i32 4
  %206 = load i32* %205, align 4
  %207 = sext i32 %206 to i64
  %208 = sext i32 %list to i64
  %209 = getelementptr inbounds i16*** %refPic, i64 %208
  %210 = load i16*** %209, align 8
  %211 = getelementptr inbounds i16** %210, i64 %207
  %212 = load i16** %211, align 8
  %213 = getelementptr inbounds i16* %212, i64 %204
  %214 = load i16* %213, align 2
  %215 = sext i16 %214 to i32
  br label %232

; <label>:216                                     ; preds = %190
  %217 = getelementptr inbounds %struct.pix_pos* %block_b, i32 0, i32 5
  %218 = load i32* %217, align 4
  %219 = sext i32 %218 to i64
  %220 = getelementptr inbounds %struct.pix_pos* %block_b, i32 0, i32 4
  %221 = load i32* %220, align 4
  %222 = sext i32 %221 to i64
  %223 = sext i32 %list to i64
  %224 = getelementptr inbounds i16*** %refPic, i64 %223
  %225 = load i16*** %224, align 8
  %226 = getelementptr inbounds i16** %225, i64 %222
  %227 = load i16** %226, align 8
  %228 = getelementptr inbounds i16* %227, i64 %219
  %229 = load i16* %228, align 2
  %230 = sext i16 %229 to i32
  %231 = mul nsw i32 %230, 2
  br label %232

; <label>:232                                     ; preds = %216, %201
  %233 = phi i32 [ %215, %201 ], [ %231, %216 ]
  br label %235

; <label>:234                                     ; preds = %185
  br label %235

; <label>:235                                     ; preds = %234, %232
  %236 = phi i32 [ %233, %232 ], [ -1, %234 ]
  %237 = getelementptr inbounds %struct.pix_pos* %block_c, i32 0, i32 0
  %238 = load i32* %237, align 4
  %239 = icmp ne i32 %238, 0
  br i1 %239, label %240, label %284

; <label>:240                                     ; preds = %235
  %241 = getelementptr inbounds %struct.pix_pos* %block_c, i32 0, i32 1
  %242 = load i32* %241, align 4
  %243 = sext i32 %242 to i64
  %244 = load %struct.ImageParameters** @img, align 8
  %245 = getelementptr inbounds %struct.ImageParameters* %244, i32 0, i32 51
  %246 = load %struct.macroblock** %245, align 8
  %247 = getelementptr inbounds %struct.macroblock* %246, i64 %243
  %248 = getelementptr inbounds %struct.macroblock* %247, i32 0, i32 22
  %249 = load i32* %248, align 4
  %250 = icmp ne i32 %249, 0
  br i1 %250, label %251, label %266

; <label>:251                                     ; preds = %240
  %252 = getelementptr inbounds %struct.pix_pos* %block_c, i32 0, i32 5
  %253 = load i32* %252, align 4
  %254 = sext i32 %253 to i64
  %255 = getelementptr inbounds %struct.pix_pos* %block_c, i32 0, i32 4
  %256 = load i32* %255, align 4
  %257 = sext i32 %256 to i64
  %258 = sext i32 %list to i64
  %259 = getelementptr inbounds i16*** %refPic, i64 %258
  %260 = load i16*** %259, align 8
  %261 = getelementptr inbounds i16** %260, i64 %257
  %262 = load i16** %261, align 8
  %263 = getelementptr inbounds i16* %262, i64 %254
  %264 = load i16* %263, align 2
  %265 = sext i16 %264 to i32
  br label %282

; <label>:266                                     ; preds = %240
  %267 = getelementptr inbounds %struct.pix_pos* %block_c, i32 0, i32 5
  %268 = load i32* %267, align 4
  %269 = sext i32 %268 to i64
  %270 = getelementptr inbounds %struct.pix_pos* %block_c, i32 0, i32 4
  %271 = load i32* %270, align 4
  %272 = sext i32 %271 to i64
  %273 = sext i32 %list to i64
  %274 = getelementptr inbounds i16*** %refPic, i64 %273
  %275 = load i16*** %274, align 8
  %276 = getelementptr inbounds i16** %275, i64 %272
  %277 = load i16** %276, align 8
  %278 = getelementptr inbounds i16* %277, i64 %269
  %279 = load i16* %278, align 2
  %280 = sext i16 %279 to i32
  %281 = mul nsw i32 %280, 2
  br label %282

; <label>:282                                     ; preds = %266, %251
  %283 = phi i32 [ %265, %251 ], [ %281, %266 ]
  br label %285

; <label>:284                                     ; preds = %235
  br label %285

; <label>:285                                     ; preds = %284, %282
  %286 = phi i32 [ %283, %282 ], [ -1, %284 ]
  br label %438

; <label>:287                                     ; preds = %124
  %288 = getelementptr inbounds %struct.pix_pos* %block_a, i32 0, i32 0
  %289 = load i32* %288, align 4
  %290 = icmp ne i32 %289, 0
  br i1 %290, label %291, label %335

; <label>:291                                     ; preds = %287
  %292 = getelementptr inbounds %struct.pix_pos* %block_a, i32 0, i32 1
  %293 = load i32* %292, align 4
  %294 = sext i32 %293 to i64
  %295 = load %struct.ImageParameters** @img, align 8
  %296 = getelementptr inbounds %struct.ImageParameters* %295, i32 0, i32 51
  %297 = load %struct.macroblock** %296, align 8
  %298 = getelementptr inbounds %struct.macroblock* %297, i64 %294
  %299 = getelementptr inbounds %struct.macroblock* %298, i32 0, i32 22
  %300 = load i32* %299, align 4
  %301 = icmp ne i32 %300, 0
  br i1 %301, label %302, label %318

; <label>:302                                     ; preds = %291
  %303 = getelementptr inbounds %struct.pix_pos* %block_a, i32 0, i32 5
  %304 = load i32* %303, align 4
  %305 = sext i32 %304 to i64
  %306 = getelementptr inbounds %struct.pix_pos* %block_a, i32 0, i32 4
  %307 = load i32* %306, align 4
  %308 = sext i32 %307 to i64
  %309 = sext i32 %list to i64
  %310 = getelementptr inbounds i16*** %refPic, i64 %309
  %311 = load i16*** %310, align 8
  %312 = getelementptr inbounds i16** %311, i64 %308
  %313 = load i16** %312, align 8
  %314 = getelementptr inbounds i16* %313, i64 %305
  %315 = load i16* %314, align 2
  %316 = sext i16 %315 to i32
  %317 = ashr i32 %316, 1
  br label %333

; <label>:318                                     ; preds = %291
  %319 = getelementptr inbounds %struct.pix_pos* %block_a, i32 0, i32 5
  %320 = load i32* %319, align 4
  %321 = sext i32 %320 to i64
  %322 = getelementptr inbounds %struct.pix_pos* %block_a, i32 0, i32 4
  %323 = load i32* %322, align 4
  %324 = sext i32 %323 to i64
  %325 = sext i32 %list to i64
  %326 = getelementptr inbounds i16*** %refPic, i64 %325
  %327 = load i16*** %326, align 8
  %328 = getelementptr inbounds i16** %327, i64 %324
  %329 = load i16** %328, align 8
  %330 = getelementptr inbounds i16* %329, i64 %321
  %331 = load i16* %330, align 2
  %332 = sext i16 %331 to i32
  br label %333

; <label>:333                                     ; preds = %318, %302
  %334 = phi i32 [ %317, %302 ], [ %332, %318 ]
  br label %336

; <label>:335                                     ; preds = %287
  br label %336

; <label>:336                                     ; preds = %335, %333
  %337 = phi i32 [ %334, %333 ], [ -1, %335 ]
  %338 = getelementptr inbounds %struct.pix_pos* %block_b, i32 0, i32 0
  %339 = load i32* %338, align 4
  %340 = icmp ne i32 %339, 0
  br i1 %340, label %341, label %385

; <label>:341                                     ; preds = %336
  %342 = getelementptr inbounds %struct.pix_pos* %block_b, i32 0, i32 1
  %343 = load i32* %342, align 4
  %344 = sext i32 %343 to i64
  %345 = load %struct.ImageParameters** @img, align 8
  %346 = getelementptr inbounds %struct.ImageParameters* %345, i32 0, i32 51
  %347 = load %struct.macroblock** %346, align 8
  %348 = getelementptr inbounds %struct.macroblock* %347, i64 %344
  %349 = getelementptr inbounds %struct.macroblock* %348, i32 0, i32 22
  %350 = load i32* %349, align 4
  %351 = icmp ne i32 %350, 0
  br i1 %351, label %352, label %368

; <label>:352                                     ; preds = %341
  %353 = getelementptr inbounds %struct.pix_pos* %block_b, i32 0, i32 5
  %354 = load i32* %353, align 4
  %355 = sext i32 %354 to i64
  %356 = getelementptr inbounds %struct.pix_pos* %block_b, i32 0, i32 4
  %357 = load i32* %356, align 4
  %358 = sext i32 %357 to i64
  %359 = sext i32 %list to i64
  %360 = getelementptr inbounds i16*** %refPic, i64 %359
  %361 = load i16*** %360, align 8
  %362 = getelementptr inbounds i16** %361, i64 %358
  %363 = load i16** %362, align 8
  %364 = getelementptr inbounds i16* %363, i64 %355
  %365 = load i16* %364, align 2
  %366 = sext i16 %365 to i32
  %367 = ashr i32 %366, 1
  br label %383

; <label>:368                                     ; preds = %341
  %369 = getelementptr inbounds %struct.pix_pos* %block_b, i32 0, i32 5
  %370 = load i32* %369, align 4
  %371 = sext i32 %370 to i64
  %372 = getelementptr inbounds %struct.pix_pos* %block_b, i32 0, i32 4
  %373 = load i32* %372, align 4
  %374 = sext i32 %373 to i64
  %375 = sext i32 %list to i64
  %376 = getelementptr inbounds i16*** %refPic, i64 %375
  %377 = load i16*** %376, align 8
  %378 = getelementptr inbounds i16** %377, i64 %374
  %379 = load i16** %378, align 8
  %380 = getelementptr inbounds i16* %379, i64 %371
  %381 = load i16* %380, align 2
  %382 = sext i16 %381 to i32
  br label %383

; <label>:383                                     ; preds = %368, %352
  %384 = phi i32 [ %367, %352 ], [ %382, %368 ]
  br label %386

; <label>:385                                     ; preds = %336
  br label %386

; <label>:386                                     ; preds = %385, %383
  %387 = phi i32 [ %384, %383 ], [ -1, %385 ]
  %388 = getelementptr inbounds %struct.pix_pos* %block_c, i32 0, i32 0
  %389 = load i32* %388, align 4
  %390 = icmp ne i32 %389, 0
  br i1 %390, label %391, label %435

; <label>:391                                     ; preds = %386
  %392 = getelementptr inbounds %struct.pix_pos* %block_c, i32 0, i32 1
  %393 = load i32* %392, align 4
  %394 = sext i32 %393 to i64
  %395 = load %struct.ImageParameters** @img, align 8
  %396 = getelementptr inbounds %struct.ImageParameters* %395, i32 0, i32 51
  %397 = load %struct.macroblock** %396, align 8
  %398 = getelementptr inbounds %struct.macroblock* %397, i64 %394
  %399 = getelementptr inbounds %struct.macroblock* %398, i32 0, i32 22
  %400 = load i32* %399, align 4
  %401 = icmp ne i32 %400, 0
  br i1 %401, label %402, label %418

; <label>:402                                     ; preds = %391
  %403 = getelementptr inbounds %struct.pix_pos* %block_c, i32 0, i32 5
  %404 = load i32* %403, align 4
  %405 = sext i32 %404 to i64
  %406 = getelementptr inbounds %struct.pix_pos* %block_c, i32 0, i32 4
  %407 = load i32* %406, align 4
  %408 = sext i32 %407 to i64
  %409 = sext i32 %list to i64
  %410 = getelementptr inbounds i16*** %refPic, i64 %409
  %411 = load i16*** %410, align 8
  %412 = getelementptr inbounds i16** %411, i64 %408
  %413 = load i16** %412, align 8
  %414 = getelementptr inbounds i16* %413, i64 %405
  %415 = load i16* %414, align 2
  %416 = sext i16 %415 to i32
  %417 = ashr i32 %416, 1
  br label %433

; <label>:418                                     ; preds = %391
  %419 = getelementptr inbounds %struct.pix_pos* %block_c, i32 0, i32 5
  %420 = load i32* %419, align 4
  %421 = sext i32 %420 to i64
  %422 = getelementptr inbounds %struct.pix_pos* %block_c, i32 0, i32 4
  %423 = load i32* %422, align 4
  %424 = sext i32 %423 to i64
  %425 = sext i32 %list to i64
  %426 = getelementptr inbounds i16*** %refPic, i64 %425
  %427 = load i16*** %426, align 8
  %428 = getelementptr inbounds i16** %427, i64 %424
  %429 = load i16** %428, align 8
  %430 = getelementptr inbounds i16* %429, i64 %421
  %431 = load i16* %430, align 2
  %432 = sext i16 %431 to i32
  br label %433

; <label>:433                                     ; preds = %418, %402
  %434 = phi i32 [ %417, %402 ], [ %432, %418 ]
  br label %436

; <label>:435                                     ; preds = %386
  br label %436

; <label>:436                                     ; preds = %435, %433
  %437 = phi i32 [ %434, %433 ], [ -1, %435 ]
  br label %438

; <label>:438                                     ; preds = %436, %285
  %rFrameL.0 = phi i32 [ %186, %285 ], [ %337, %436 ]
  %rFrameU.0 = phi i32 [ %236, %285 ], [ %387, %436 ]
  %rFrameUR.0 = phi i32 [ %286, %285 ], [ %437, %436 ]
  br label %439

; <label>:439                                     ; preds = %438, %122
  %rFrameL.1 = phi i32 [ %rFrameL.0, %438 ], [ %81, %122 ]
  %rFrameU.1 = phi i32 [ %rFrameU.0, %438 ], [ %102, %122 ]
  %rFrameUR.1 = phi i32 [ %rFrameUR.0, %438 ], [ %123, %122 ]
  %440 = sext i16 %ref_frame to i32
  %441 = icmp eq i32 %rFrameL.1, %440
  br i1 %441, label %442, label %449

; <label>:442                                     ; preds = %439
  %443 = sext i16 %ref_frame to i32
  %444 = icmp ne i32 %rFrameU.1, %443
  br i1 %444, label %445, label %449

; <label>:445                                     ; preds = %442
  %446 = sext i16 %ref_frame to i32
  %447 = icmp ne i32 %rFrameUR.1, %446
  br i1 %447, label %448, label %449

; <label>:448                                     ; preds = %445
  br label %471

; <label>:449                                     ; preds = %445, %442, %439
  %450 = sext i16 %ref_frame to i32
  %451 = icmp ne i32 %rFrameL.1, %450
  br i1 %451, label %452, label %459

; <label>:452                                     ; preds = %449
  %453 = sext i16 %ref_frame to i32
  %454 = icmp eq i32 %rFrameU.1, %453
  br i1 %454, label %455, label %459

; <label>:455                                     ; preds = %452
  %456 = sext i16 %ref_frame to i32
  %457 = icmp ne i32 %rFrameUR.1, %456
  br i1 %457, label %458, label %459

; <label>:458                                     ; preds = %455
  br label %470

; <label>:459                                     ; preds = %455, %452, %449
  %460 = sext i16 %ref_frame to i32
  %461 = icmp ne i32 %rFrameL.1, %460
  br i1 %461, label %462, label %469

; <label>:462                                     ; preds = %459
  %463 = sext i16 %ref_frame to i32
  %464 = icmp ne i32 %rFrameU.1, %463
  br i1 %464, label %465, label %469

; <label>:465                                     ; preds = %462
  %466 = sext i16 %ref_frame to i32
  %467 = icmp eq i32 %rFrameUR.1, %466
  br i1 %467, label %468, label %469

; <label>:468                                     ; preds = %465
  br label %469

; <label>:469                                     ; preds = %468, %465, %462, %459
  %mvPredType.0 = phi i32 [ 3, %468 ], [ 0, %465 ], [ 0, %462 ], [ 0, %459 ]
  br label %470

; <label>:470                                     ; preds = %469, %458
  %mvPredType.1 = phi i32 [ 2, %458 ], [ %mvPredType.0, %469 ]
  br label %471

; <label>:471                                     ; preds = %470, %448
  %mvPredType.2 = phi i32 [ 1, %448 ], [ %mvPredType.1, %470 ]
  %472 = icmp eq i32 %blockshape_x, 8
  br i1 %472, label %473, label %488

; <label>:473                                     ; preds = %471
  %474 = icmp eq i32 %blockshape_y, 16
  br i1 %474, label %475, label %488

; <label>:475                                     ; preds = %473
  %476 = icmp eq i32 %1, 0
  br i1 %476, label %477, label %482

; <label>:477                                     ; preds = %475
  %478 = sext i16 %ref_frame to i32
  %479 = icmp eq i32 %rFrameL.1, %478
  br i1 %479, label %480, label %481

; <label>:480                                     ; preds = %477
  br label %481

; <label>:481                                     ; preds = %480, %477
  %mvPredType.3 = phi i32 [ 1, %480 ], [ %mvPredType.2, %477 ]
  br label %487

; <label>:482                                     ; preds = %475
  %483 = sext i16 %ref_frame to i32
  %484 = icmp eq i32 %rFrameUR.1, %483
  br i1 %484, label %485, label %486

; <label>:485                                     ; preds = %482
  br label %486

; <label>:486                                     ; preds = %485, %482
  %mvPredType.4 = phi i32 [ 3, %485 ], [ %mvPredType.2, %482 ]
  br label %487

; <label>:487                                     ; preds = %486, %481
  %mvPredType.5 = phi i32 [ %mvPredType.3, %481 ], [ %mvPredType.4, %486 ]
  br label %506

; <label>:488                                     ; preds = %473, %471
  %489 = icmp eq i32 %blockshape_x, 16
  br i1 %489, label %490, label %505

; <label>:490                                     ; preds = %488
  %491 = icmp eq i32 %blockshape_y, 8
  br i1 %491, label %492, label %505

; <label>:492                                     ; preds = %490
  %493 = icmp eq i32 %2, 0
  br i1 %493, label %494, label %499

; <label>:494                                     ; preds = %492
  %495 = sext i16 %ref_frame to i32
  %496 = icmp eq i32 %rFrameU.1, %495
  br i1 %496, label %497, label %498

; <label>:497                                     ; preds = %494
  br label %498

; <label>:498                                     ; preds = %497, %494
  %mvPredType.6 = phi i32 [ 2, %497 ], [ %mvPredType.2, %494 ]
  br label %504

; <label>:499                                     ; preds = %492
  %500 = sext i16 %ref_frame to i32
  %501 = icmp eq i32 %rFrameL.1, %500
  br i1 %501, label %502, label %503

; <label>:502                                     ; preds = %499
  br label %503

; <label>:503                                     ; preds = %502, %499
  %mvPredType.7 = phi i32 [ 1, %502 ], [ %mvPredType.2, %499 ]
  br label %504

; <label>:504                                     ; preds = %503, %498
  %mvPredType.8 = phi i32 [ %mvPredType.6, %498 ], [ %mvPredType.7, %503 ]
  br label %505

; <label>:505                                     ; preds = %504, %490, %488
  %mvPredType.9 = phi i32 [ %mvPredType.8, %504 ], [ %mvPredType.2, %490 ], [ %mvPredType.2, %488 ]
  br label %506

; <label>:506                                     ; preds = %505, %487
  %mvPredType.10 = phi i32 [ %mvPredType.5, %487 ], [ %mvPredType.9, %505 ]
  br label %507

; <label>:507                                     ; preds = %1260, %506
  %pred_vec.0 = phi i32 [ 0, %506 ], [ %pred_vec.2, %1260 ]
  %hv.0 = phi i32 [ 0, %506 ], [ %1261, %1260 ]
  %SAD_a.0 = phi i32 [ 0, %506 ], [ %SAD_a.1, %1260 ]
  %SAD_b.0 = phi i32 [ 0, %506 ], [ %SAD_b.1, %1260 ]
  %SAD_c.0 = phi i32 [ 0, %506 ], [ %SAD_c.1, %1260 ]
  %508 = icmp slt i32 %hv.0, 2
  br i1 %508, label %509, label %1262

; <label>:509                                     ; preds = %507
  %510 = load %struct.ImageParameters** @img, align 8
  %511 = getelementptr inbounds %struct.ImageParameters* %510, i32 0, i32 90
  %512 = load i32* %511, align 4
  %513 = icmp ne i32 %512, 0
  br i1 %513, label %514, label %516

; <label>:514                                     ; preds = %509
  %515 = icmp eq i32 %hv.0, 0
  br i1 %515, label %516, label %589

; <label>:516                                     ; preds = %514, %509
  %517 = getelementptr inbounds %struct.pix_pos* %block_a, i32 0, i32 0
  %518 = load i32* %517, align 4
  %519 = icmp ne i32 %518, 0
  br i1 %519, label %520, label %538

; <label>:520                                     ; preds = %516
  %521 = sext i32 %hv.0 to i64
  %522 = getelementptr inbounds %struct.pix_pos* %block_a, i32 0, i32 5
  %523 = load i32* %522, align 4
  %524 = sext i32 %523 to i64
  %525 = getelementptr inbounds %struct.pix_pos* %block_a, i32 0, i32 4
  %526 = load i32* %525, align 4
  %527 = sext i32 %526 to i64
  %528 = sext i32 %list to i64
  %529 = getelementptr inbounds i16**** %tmp_mv, i64 %528
  %530 = load i16**** %529, align 8
  %531 = getelementptr inbounds i16*** %530, i64 %527
  %532 = load i16*** %531, align 8
  %533 = getelementptr inbounds i16** %532, i64 %524
  %534 = load i16** %533, align 8
  %535 = getelementptr inbounds i16* %534, i64 %521
  %536 = load i16* %535, align 2
  %537 = sext i16 %536 to i32
  br label %539

; <label>:538                                     ; preds = %516
  br label %539

; <label>:539                                     ; preds = %538, %520
  %540 = phi i32 [ %537, %520 ], [ 0, %538 ]
  %541 = getelementptr inbounds %struct.pix_pos* %block_b, i32 0, i32 0
  %542 = load i32* %541, align 4
  %543 = icmp ne i32 %542, 0
  br i1 %543, label %544, label %562

; <label>:544                                     ; preds = %539
  %545 = sext i32 %hv.0 to i64
  %546 = getelementptr inbounds %struct.pix_pos* %block_b, i32 0, i32 5
  %547 = load i32* %546, align 4
  %548 = sext i32 %547 to i64
  %549 = getelementptr inbounds %struct.pix_pos* %block_b, i32 0, i32 4
  %550 = load i32* %549, align 4
  %551 = sext i32 %550 to i64
  %552 = sext i32 %list to i64
  %553 = getelementptr inbounds i16**** %tmp_mv, i64 %552
  %554 = load i16**** %553, align 8
  %555 = getelementptr inbounds i16*** %554, i64 %551
  %556 = load i16*** %555, align 8
  %557 = getelementptr inbounds i16** %556, i64 %548
  %558 = load i16** %557, align 8
  %559 = getelementptr inbounds i16* %558, i64 %545
  %560 = load i16* %559, align 2
  %561 = sext i16 %560 to i32
  br label %563

; <label>:562                                     ; preds = %539
  br label %563

; <label>:563                                     ; preds = %562, %544
  %564 = phi i32 [ %561, %544 ], [ 0, %562 ]
  %565 = getelementptr inbounds %struct.pix_pos* %block_c, i32 0, i32 0
  %566 = load i32* %565, align 4
  %567 = icmp ne i32 %566, 0
  br i1 %567, label %568, label %586

; <label>:568                                     ; preds = %563
  %569 = sext i32 %hv.0 to i64
  %570 = getelementptr inbounds %struct.pix_pos* %block_c, i32 0, i32 5
  %571 = load i32* %570, align 4
  %572 = sext i32 %571 to i64
  %573 = getelementptr inbounds %struct.pix_pos* %block_c, i32 0, i32 4
  %574 = load i32* %573, align 4
  %575 = sext i32 %574 to i64
  %576 = sext i32 %list to i64
  %577 = getelementptr inbounds i16**** %tmp_mv, i64 %576
  %578 = load i16**** %577, align 8
  %579 = getelementptr inbounds i16*** %578, i64 %575
  %580 = load i16*** %579, align 8
  %581 = getelementptr inbounds i16** %580, i64 %572
  %582 = load i16** %581, align 8
  %583 = getelementptr inbounds i16* %582, i64 %569
  %584 = load i16* %583, align 2
  %585 = sext i16 %584 to i32
  br label %587

; <label>:586                                     ; preds = %563
  br label %587

; <label>:587                                     ; preds = %586, %568
  %588 = phi i32 [ %585, %568 ], [ 0, %586 ]
  br label %940

; <label>:589                                     ; preds = %514
  %590 = load %struct.ImageParameters** @img, align 8
  %591 = getelementptr inbounds %struct.ImageParameters* %590, i32 0, i32 3
  %592 = load i32* %591, align 4
  %593 = sext i32 %592 to i64
  %594 = load %struct.ImageParameters** @img, align 8
  %595 = getelementptr inbounds %struct.ImageParameters* %594, i32 0, i32 51
  %596 = load %struct.macroblock** %595, align 8
  %597 = getelementptr inbounds %struct.macroblock* %596, i64 %593
  %598 = getelementptr inbounds %struct.macroblock* %597, i32 0, i32 22
  %599 = load i32* %598, align 4
  %600 = icmp ne i32 %599, 0
  br i1 %600, label %601, label %770

; <label>:601                                     ; preds = %589
  %602 = getelementptr inbounds %struct.pix_pos* %block_a, i32 0, i32 0
  %603 = load i32* %602, align 4
  %604 = icmp ne i32 %603, 0
  br i1 %604, label %605, label %655

; <label>:605                                     ; preds = %601
  %606 = getelementptr inbounds %struct.pix_pos* %block_a, i32 0, i32 1
  %607 = load i32* %606, align 4
  %608 = sext i32 %607 to i64
  %609 = load %struct.ImageParameters** @img, align 8
  %610 = getelementptr inbounds %struct.ImageParameters* %609, i32 0, i32 51
  %611 = load %struct.macroblock** %610, align 8
  %612 = getelementptr inbounds %struct.macroblock* %611, i64 %608
  %613 = getelementptr inbounds %struct.macroblock* %612, i32 0, i32 22
  %614 = load i32* %613, align 4
  %615 = icmp ne i32 %614, 0
  br i1 %615, label %616, label %634

; <label>:616                                     ; preds = %605
  %617 = sext i32 %hv.0 to i64
  %618 = getelementptr inbounds %struct.pix_pos* %block_a, i32 0, i32 5
  %619 = load i32* %618, align 4
  %620 = sext i32 %619 to i64
  %621 = getelementptr inbounds %struct.pix_pos* %block_a, i32 0, i32 4
  %622 = load i32* %621, align 4
  %623 = sext i32 %622 to i64
  %624 = sext i32 %list to i64
  %625 = getelementptr inbounds i16**** %tmp_mv, i64 %624
  %626 = load i16**** %625, align 8
  %627 = getelementptr inbounds i16*** %626, i64 %623
  %628 = load i16*** %627, align 8
  %629 = getelementptr inbounds i16** %628, i64 %620
  %630 = load i16** %629, align 8
  %631 = getelementptr inbounds i16* %630, i64 %617
  %632 = load i16* %631, align 2
  %633 = sext i16 %632 to i32
  br label %653

; <label>:634                                     ; preds = %605
  %635 = sext i32 %hv.0 to i64
  %636 = getelementptr inbounds %struct.pix_pos* %block_a, i32 0, i32 5
  %637 = load i32* %636, align 4
  %638 = sext i32 %637 to i64
  %639 = getelementptr inbounds %struct.pix_pos* %block_a, i32 0, i32 4
  %640 = load i32* %639, align 4
  %641 = sext i32 %640 to i64
  %642 = sext i32 %list to i64
  %643 = getelementptr inbounds i16**** %tmp_mv, i64 %642
  %644 = load i16**** %643, align 8
  %645 = getelementptr inbounds i16*** %644, i64 %641
  %646 = load i16*** %645, align 8
  %647 = getelementptr inbounds i16** %646, i64 %638
  %648 = load i16** %647, align 8
  %649 = getelementptr inbounds i16* %648, i64 %635
  %650 = load i16* %649, align 2
  %651 = sext i16 %650 to i32
  %652 = sdiv i32 %651, 2
  br label %653

; <label>:653                                     ; preds = %634, %616
  %654 = phi i32 [ %633, %616 ], [ %652, %634 ]
  br label %656

; <label>:655                                     ; preds = %601
  br label %656

; <label>:656                                     ; preds = %655, %653
  %657 = phi i32 [ %654, %653 ], [ 0, %655 ]
  %658 = getelementptr inbounds %struct.pix_pos* %block_b, i32 0, i32 0
  %659 = load i32* %658, align 4
  %660 = icmp ne i32 %659, 0
  br i1 %660, label %661, label %711

; <label>:661                                     ; preds = %656
  %662 = getelementptr inbounds %struct.pix_pos* %block_b, i32 0, i32 1
  %663 = load i32* %662, align 4
  %664 = sext i32 %663 to i64
  %665 = load %struct.ImageParameters** @img, align 8
  %666 = getelementptr inbounds %struct.ImageParameters* %665, i32 0, i32 51
  %667 = load %struct.macroblock** %666, align 8
  %668 = getelementptr inbounds %struct.macroblock* %667, i64 %664
  %669 = getelementptr inbounds %struct.macroblock* %668, i32 0, i32 22
  %670 = load i32* %669, align 4
  %671 = icmp ne i32 %670, 0
  br i1 %671, label %672, label %690

; <label>:672                                     ; preds = %661
  %673 = sext i32 %hv.0 to i64
  %674 = getelementptr inbounds %struct.pix_pos* %block_b, i32 0, i32 5
  %675 = load i32* %674, align 4
  %676 = sext i32 %675 to i64
  %677 = getelementptr inbounds %struct.pix_pos* %block_b, i32 0, i32 4
  %678 = load i32* %677, align 4
  %679 = sext i32 %678 to i64
  %680 = sext i32 %list to i64
  %681 = getelementptr inbounds i16**** %tmp_mv, i64 %680
  %682 = load i16**** %681, align 8
  %683 = getelementptr inbounds i16*** %682, i64 %679
  %684 = load i16*** %683, align 8
  %685 = getelementptr inbounds i16** %684, i64 %676
  %686 = load i16** %685, align 8
  %687 = getelementptr inbounds i16* %686, i64 %673
  %688 = load i16* %687, align 2
  %689 = sext i16 %688 to i32
  br label %709

; <label>:690                                     ; preds = %661
  %691 = sext i32 %hv.0 to i64
  %692 = getelementptr inbounds %struct.pix_pos* %block_b, i32 0, i32 5
  %693 = load i32* %692, align 4
  %694 = sext i32 %693 to i64
  %695 = getelementptr inbounds %struct.pix_pos* %block_b, i32 0, i32 4
  %696 = load i32* %695, align 4
  %697 = sext i32 %696 to i64
  %698 = sext i32 %list to i64
  %699 = getelementptr inbounds i16**** %tmp_mv, i64 %698
  %700 = load i16**** %699, align 8
  %701 = getelementptr inbounds i16*** %700, i64 %697
  %702 = load i16*** %701, align 8
  %703 = getelementptr inbounds i16** %702, i64 %694
  %704 = load i16** %703, align 8
  %705 = getelementptr inbounds i16* %704, i64 %691
  %706 = load i16* %705, align 2
  %707 = sext i16 %706 to i32
  %708 = sdiv i32 %707, 2
  br label %709

; <label>:709                                     ; preds = %690, %672
  %710 = phi i32 [ %689, %672 ], [ %708, %690 ]
  br label %712

; <label>:711                                     ; preds = %656
  br label %712

; <label>:712                                     ; preds = %711, %709
  %713 = phi i32 [ %710, %709 ], [ 0, %711 ]
  %714 = getelementptr inbounds %struct.pix_pos* %block_c, i32 0, i32 0
  %715 = load i32* %714, align 4
  %716 = icmp ne i32 %715, 0
  br i1 %716, label %717, label %767

; <label>:717                                     ; preds = %712
  %718 = getelementptr inbounds %struct.pix_pos* %block_c, i32 0, i32 1
  %719 = load i32* %718, align 4
  %720 = sext i32 %719 to i64
  %721 = load %struct.ImageParameters** @img, align 8
  %722 = getelementptr inbounds %struct.ImageParameters* %721, i32 0, i32 51
  %723 = load %struct.macroblock** %722, align 8
  %724 = getelementptr inbounds %struct.macroblock* %723, i64 %720
  %725 = getelementptr inbounds %struct.macroblock* %724, i32 0, i32 22
  %726 = load i32* %725, align 4
  %727 = icmp ne i32 %726, 0
  br i1 %727, label %728, label %746

; <label>:728                                     ; preds = %717
  %729 = sext i32 %hv.0 to i64
  %730 = getelementptr inbounds %struct.pix_pos* %block_c, i32 0, i32 5
  %731 = load i32* %730, align 4
  %732 = sext i32 %731 to i64
  %733 = getelementptr inbounds %struct.pix_pos* %block_c, i32 0, i32 4
  %734 = load i32* %733, align 4
  %735 = sext i32 %734 to i64
  %736 = sext i32 %list to i64
  %737 = getelementptr inbounds i16**** %tmp_mv, i64 %736
  %738 = load i16**** %737, align 8
  %739 = getelementptr inbounds i16*** %738, i64 %735
  %740 = load i16*** %739, align 8
  %741 = getelementptr inbounds i16** %740, i64 %732
  %742 = load i16** %741, align 8
  %743 = getelementptr inbounds i16* %742, i64 %729
  %744 = load i16* %743, align 2
  %745 = sext i16 %744 to i32
  br label %765

; <label>:746                                     ; preds = %717
  %747 = sext i32 %hv.0 to i64
  %748 = getelementptr inbounds %struct.pix_pos* %block_c, i32 0, i32 5
  %749 = load i32* %748, align 4
  %750 = sext i32 %749 to i64
  %751 = getelementptr inbounds %struct.pix_pos* %block_c, i32 0, i32 4
  %752 = load i32* %751, align 4
  %753 = sext i32 %752 to i64
  %754 = sext i32 %list to i64
  %755 = getelementptr inbounds i16**** %tmp_mv, i64 %754
  %756 = load i16**** %755, align 8
  %757 = getelementptr inbounds i16*** %756, i64 %753
  %758 = load i16*** %757, align 8
  %759 = getelementptr inbounds i16** %758, i64 %750
  %760 = load i16** %759, align 8
  %761 = getelementptr inbounds i16* %760, i64 %747
  %762 = load i16* %761, align 2
  %763 = sext i16 %762 to i32
  %764 = sdiv i32 %763, 2
  br label %765

; <label>:765                                     ; preds = %746, %728
  %766 = phi i32 [ %745, %728 ], [ %764, %746 ]
  br label %768

; <label>:767                                     ; preds = %712
  br label %768

; <label>:768                                     ; preds = %767, %765
  %769 = phi i32 [ %766, %765 ], [ 0, %767 ]
  br label %939

; <label>:770                                     ; preds = %589
  %771 = getelementptr inbounds %struct.pix_pos* %block_a, i32 0, i32 0
  %772 = load i32* %771, align 4
  %773 = icmp ne i32 %772, 0
  br i1 %773, label %774, label %824

; <label>:774                                     ; preds = %770
  %775 = getelementptr inbounds %struct.pix_pos* %block_a, i32 0, i32 1
  %776 = load i32* %775, align 4
  %777 = sext i32 %776 to i64
  %778 = load %struct.ImageParameters** @img, align 8
  %779 = getelementptr inbounds %struct.ImageParameters* %778, i32 0, i32 51
  %780 = load %struct.macroblock** %779, align 8
  %781 = getelementptr inbounds %struct.macroblock* %780, i64 %777
  %782 = getelementptr inbounds %struct.macroblock* %781, i32 0, i32 22
  %783 = load i32* %782, align 4
  %784 = icmp ne i32 %783, 0
  br i1 %784, label %785, label %804

; <label>:785                                     ; preds = %774
  %786 = sext i32 %hv.0 to i64
  %787 = getelementptr inbounds %struct.pix_pos* %block_a, i32 0, i32 5
  %788 = load i32* %787, align 4
  %789 = sext i32 %788 to i64
  %790 = getelementptr inbounds %struct.pix_pos* %block_a, i32 0, i32 4
  %791 = load i32* %790, align 4
  %792 = sext i32 %791 to i64
  %793 = sext i32 %list to i64
  %794 = getelementptr inbounds i16**** %tmp_mv, i64 %793
  %795 = load i16**** %794, align 8
  %796 = getelementptr inbounds i16*** %795, i64 %792
  %797 = load i16*** %796, align 8
  %798 = getelementptr inbounds i16** %797, i64 %789
  %799 = load i16** %798, align 8
  %800 = getelementptr inbounds i16* %799, i64 %786
  %801 = load i16* %800, align 2
  %802 = sext i16 %801 to i32
  %803 = mul nsw i32 %802, 2
  br label %822

; <label>:804                                     ; preds = %774
  %805 = sext i32 %hv.0 to i64
  %806 = getelementptr inbounds %struct.pix_pos* %block_a, i32 0, i32 5
  %807 = load i32* %806, align 4
  %808 = sext i32 %807 to i64
  %809 = getelementptr inbounds %struct.pix_pos* %block_a, i32 0, i32 4
  %810 = load i32* %809, align 4
  %811 = sext i32 %810 to i64
  %812 = sext i32 %list to i64
  %813 = getelementptr inbounds i16**** %tmp_mv, i64 %812
  %814 = load i16**** %813, align 8
  %815 = getelementptr inbounds i16*** %814, i64 %811
  %816 = load i16*** %815, align 8
  %817 = getelementptr inbounds i16** %816, i64 %808
  %818 = load i16** %817, align 8
  %819 = getelementptr inbounds i16* %818, i64 %805
  %820 = load i16* %819, align 2
  %821 = sext i16 %820 to i32
  br label %822

; <label>:822                                     ; preds = %804, %785
  %823 = phi i32 [ %803, %785 ], [ %821, %804 ]
  br label %825

; <label>:824                                     ; preds = %770
  br label %825

; <label>:825                                     ; preds = %824, %822
  %826 = phi i32 [ %823, %822 ], [ 0, %824 ]
  %827 = getelementptr inbounds %struct.pix_pos* %block_b, i32 0, i32 0
  %828 = load i32* %827, align 4
  %829 = icmp ne i32 %828, 0
  br i1 %829, label %830, label %880

; <label>:830                                     ; preds = %825
  %831 = getelementptr inbounds %struct.pix_pos* %block_b, i32 0, i32 1
  %832 = load i32* %831, align 4
  %833 = sext i32 %832 to i64
  %834 = load %struct.ImageParameters** @img, align 8
  %835 = getelementptr inbounds %struct.ImageParameters* %834, i32 0, i32 51
  %836 = load %struct.macroblock** %835, align 8
  %837 = getelementptr inbounds %struct.macroblock* %836, i64 %833
  %838 = getelementptr inbounds %struct.macroblock* %837, i32 0, i32 22
  %839 = load i32* %838, align 4
  %840 = icmp ne i32 %839, 0
  br i1 %840, label %841, label %860

; <label>:841                                     ; preds = %830
  %842 = sext i32 %hv.0 to i64
  %843 = getelementptr inbounds %struct.pix_pos* %block_b, i32 0, i32 5
  %844 = load i32* %843, align 4
  %845 = sext i32 %844 to i64
  %846 = getelementptr inbounds %struct.pix_pos* %block_b, i32 0, i32 4
  %847 = load i32* %846, align 4
  %848 = sext i32 %847 to i64
  %849 = sext i32 %list to i64
  %850 = getelementptr inbounds i16**** %tmp_mv, i64 %849
  %851 = load i16**** %850, align 8
  %852 = getelementptr inbounds i16*** %851, i64 %848
  %853 = load i16*** %852, align 8
  %854 = getelementptr inbounds i16** %853, i64 %845
  %855 = load i16** %854, align 8
  %856 = getelementptr inbounds i16* %855, i64 %842
  %857 = load i16* %856, align 2
  %858 = sext i16 %857 to i32
  %859 = mul nsw i32 %858, 2
  br label %878

; <label>:860                                     ; preds = %830
  %861 = sext i32 %hv.0 to i64
  %862 = getelementptr inbounds %struct.pix_pos* %block_b, i32 0, i32 5
  %863 = load i32* %862, align 4
  %864 = sext i32 %863 to i64
  %865 = getelementptr inbounds %struct.pix_pos* %block_b, i32 0, i32 4
  %866 = load i32* %865, align 4
  %867 = sext i32 %866 to i64
  %868 = sext i32 %list to i64
  %869 = getelementptr inbounds i16**** %tmp_mv, i64 %868
  %870 = load i16**** %869, align 8
  %871 = getelementptr inbounds i16*** %870, i64 %867
  %872 = load i16*** %871, align 8
  %873 = getelementptr inbounds i16** %872, i64 %864
  %874 = load i16** %873, align 8
  %875 = getelementptr inbounds i16* %874, i64 %861
  %876 = load i16* %875, align 2
  %877 = sext i16 %876 to i32
  br label %878

; <label>:878                                     ; preds = %860, %841
  %879 = phi i32 [ %859, %841 ], [ %877, %860 ]
  br label %881

; <label>:880                                     ; preds = %825
  br label %881

; <label>:881                                     ; preds = %880, %878
  %882 = phi i32 [ %879, %878 ], [ 0, %880 ]
  %883 = getelementptr inbounds %struct.pix_pos* %block_c, i32 0, i32 0
  %884 = load i32* %883, align 4
  %885 = icmp ne i32 %884, 0
  br i1 %885, label %886, label %936

; <label>:886                                     ; preds = %881
  %887 = getelementptr inbounds %struct.pix_pos* %block_c, i32 0, i32 1
  %888 = load i32* %887, align 4
  %889 = sext i32 %888 to i64
  %890 = load %struct.ImageParameters** @img, align 8
  %891 = getelementptr inbounds %struct.ImageParameters* %890, i32 0, i32 51
  %892 = load %struct.macroblock** %891, align 8
  %893 = getelementptr inbounds %struct.macroblock* %892, i64 %889
  %894 = getelementptr inbounds %struct.macroblock* %893, i32 0, i32 22
  %895 = load i32* %894, align 4
  %896 = icmp ne i32 %895, 0
  br i1 %896, label %897, label %916

; <label>:897                                     ; preds = %886
  %898 = sext i32 %hv.0 to i64
  %899 = getelementptr inbounds %struct.pix_pos* %block_c, i32 0, i32 5
  %900 = load i32* %899, align 4
  %901 = sext i32 %900 to i64
  %902 = getelementptr inbounds %struct.pix_pos* %block_c, i32 0, i32 4
  %903 = load i32* %902, align 4
  %904 = sext i32 %903 to i64
  %905 = sext i32 %list to i64
  %906 = getelementptr inbounds i16**** %tmp_mv, i64 %905
  %907 = load i16**** %906, align 8
  %908 = getelementptr inbounds i16*** %907, i64 %904
  %909 = load i16*** %908, align 8
  %910 = getelementptr inbounds i16** %909, i64 %901
  %911 = load i16** %910, align 8
  %912 = getelementptr inbounds i16* %911, i64 %898
  %913 = load i16* %912, align 2
  %914 = sext i16 %913 to i32
  %915 = mul nsw i32 %914, 2
  br label %934

; <label>:916                                     ; preds = %886
  %917 = sext i32 %hv.0 to i64
  %918 = getelementptr inbounds %struct.pix_pos* %block_c, i32 0, i32 5
  %919 = load i32* %918, align 4
  %920 = sext i32 %919 to i64
  %921 = getelementptr inbounds %struct.pix_pos* %block_c, i32 0, i32 4
  %922 = load i32* %921, align 4
  %923 = sext i32 %922 to i64
  %924 = sext i32 %list to i64
  %925 = getelementptr inbounds i16**** %tmp_mv, i64 %924
  %926 = load i16**** %925, align 8
  %927 = getelementptr inbounds i16*** %926, i64 %923
  %928 = load i16*** %927, align 8
  %929 = getelementptr inbounds i16** %928, i64 %920
  %930 = load i16** %929, align 8
  %931 = getelementptr inbounds i16* %930, i64 %917
  %932 = load i16* %931, align 2
  %933 = sext i16 %932 to i32
  br label %934

; <label>:934                                     ; preds = %916, %897
  %935 = phi i32 [ %915, %897 ], [ %933, %916 ]
  br label %937

; <label>:936                                     ; preds = %881
  br label %937

; <label>:937                                     ; preds = %936, %934
  %938 = phi i32 [ %935, %934 ], [ 0, %936 ]
  br label %939

; <label>:939                                     ; preds = %937, %768
  %mv_a.0 = phi i32 [ %657, %768 ], [ %826, %937 ]
  %mv_b.0 = phi i32 [ %713, %768 ], [ %882, %937 ]
  %mv_c.0 = phi i32 [ %769, %768 ], [ %938, %937 ]
  br label %940

; <label>:940                                     ; preds = %939, %587
  %mv_a.1 = phi i32 [ %540, %587 ], [ %mv_a.0, %939 ]
  %mv_b.1 = phi i32 [ %564, %587 ], [ %mv_b.0, %939 ]
  %mv_c.1 = phi i32 [ %588, %587 ], [ %mv_c.0, %939 ]
  %941 = load %struct.InputParameters** @input, align 8
  %942 = getelementptr inbounds %struct.InputParameters* %941, i32 0, i32 134
  %943 = load i32* %942, align 4
  %944 = icmp ne i32 %943, 0
  br i1 %944, label %945, label %1150

; <label>:945                                     ; preds = %940
  %946 = getelementptr inbounds %struct.pix_pos* %block_a, i32 0, i32 0
  %947 = load i32* %946, align 4
  %948 = icmp ne i32 %947, 0
  br i1 %948, label %949, label %994

; <label>:949                                     ; preds = %945
  %950 = icmp eq i32 %list, 1
  br i1 %950, label %951, label %971

; <label>:951                                     ; preds = %949
  %952 = load i32* @FME_blocktype, align 4
  %953 = sext i32 %952 to i64
  %954 = getelementptr inbounds %struct.pix_pos* %block_a, i32 0, i32 5
  %955 = load i32* %954, align 4
  %956 = sext i32 %955 to i64
  %957 = getelementptr inbounds %struct.pix_pos* %block_a, i32 0, i32 4
  %958 = load i32* %957, align 4
  %959 = sext i32 %958 to i64
  %960 = load i32****** @all_bwmincost, align 8
  %961 = getelementptr inbounds i32***** %960, i64 %959
  %962 = load i32***** %961, align 8
  %963 = getelementptr inbounds i32**** %962, i64 %956
  %964 = load i32**** %963, align 8
  %965 = getelementptr inbounds i32*** %964, i64 0
  %966 = load i32*** %965, align 8
  %967 = getelementptr inbounds i32** %966, i64 %953
  %968 = load i32** %967, align 8
  %969 = getelementptr inbounds i32* %968, i64 0
  %970 = load i32* %969, align 4
  br label %992

; <label>:971                                     ; preds = %949
  %972 = load i32* @FME_blocktype, align 4
  %973 = sext i32 %972 to i64
  %974 = sext i16 %ref_frame to i64
  %975 = getelementptr inbounds %struct.pix_pos* %block_a, i32 0, i32 5
  %976 = load i32* %975, align 4
  %977 = sext i32 %976 to i64
  %978 = getelementptr inbounds %struct.pix_pos* %block_a, i32 0, i32 4
  %979 = load i32* %978, align 4
  %980 = sext i32 %979 to i64
  %981 = load i32****** @all_mincost, align 8
  %982 = getelementptr inbounds i32***** %981, i64 %980
  %983 = load i32***** %982, align 8
  %984 = getelementptr inbounds i32**** %983, i64 %977
  %985 = load i32**** %984, align 8
  %986 = getelementptr inbounds i32*** %985, i64 %974
  %987 = load i32*** %986, align 8
  %988 = getelementptr inbounds i32** %987, i64 %973
  %989 = load i32** %988, align 8
  %990 = getelementptr inbounds i32* %989, i64 0
  %991 = load i32* %990, align 4
  br label %992

; <label>:992                                     ; preds = %971, %951
  %993 = phi i32 [ %970, %951 ], [ %991, %971 ]
  br label %995

; <label>:994                                     ; preds = %945
  br label %995

; <label>:995                                     ; preds = %994, %992
  %996 = phi i32 [ %993, %992 ], [ 0, %994 ]
  %997 = getelementptr inbounds %struct.pix_pos* %block_b, i32 0, i32 0
  %998 = load i32* %997, align 4
  %999 = icmp ne i32 %998, 0
  br i1 %999, label %1000, label %1045

; <label>:1000                                    ; preds = %995
  %1001 = icmp eq i32 %list, 1
  br i1 %1001, label %1002, label %1022

; <label>:1002                                    ; preds = %1000
  %1003 = load i32* @FME_blocktype, align 4
  %1004 = sext i32 %1003 to i64
  %1005 = getelementptr inbounds %struct.pix_pos* %block_b, i32 0, i32 5
  %1006 = load i32* %1005, align 4
  %1007 = sext i32 %1006 to i64
  %1008 = getelementptr inbounds %struct.pix_pos* %block_b, i32 0, i32 4
  %1009 = load i32* %1008, align 4
  %1010 = sext i32 %1009 to i64
  %1011 = load i32****** @all_bwmincost, align 8
  %1012 = getelementptr inbounds i32***** %1011, i64 %1010
  %1013 = load i32***** %1012, align 8
  %1014 = getelementptr inbounds i32**** %1013, i64 %1007
  %1015 = load i32**** %1014, align 8
  %1016 = getelementptr inbounds i32*** %1015, i64 0
  %1017 = load i32*** %1016, align 8
  %1018 = getelementptr inbounds i32** %1017, i64 %1004
  %1019 = load i32** %1018, align 8
  %1020 = getelementptr inbounds i32* %1019, i64 0
  %1021 = load i32* %1020, align 4
  br label %1043

; <label>:1022                                    ; preds = %1000
  %1023 = load i32* @FME_blocktype, align 4
  %1024 = sext i32 %1023 to i64
  %1025 = sext i16 %ref_frame to i64
  %1026 = getelementptr inbounds %struct.pix_pos* %block_b, i32 0, i32 5
  %1027 = load i32* %1026, align 4
  %1028 = sext i32 %1027 to i64
  %1029 = getelementptr inbounds %struct.pix_pos* %block_b, i32 0, i32 4
  %1030 = load i32* %1029, align 4
  %1031 = sext i32 %1030 to i64
  %1032 = load i32****** @all_mincost, align 8
  %1033 = getelementptr inbounds i32***** %1032, i64 %1031
  %1034 = load i32***** %1033, align 8
  %1035 = getelementptr inbounds i32**** %1034, i64 %1028
  %1036 = load i32**** %1035, align 8
  %1037 = getelementptr inbounds i32*** %1036, i64 %1025
  %1038 = load i32*** %1037, align 8
  %1039 = getelementptr inbounds i32** %1038, i64 %1024
  %1040 = load i32** %1039, align 8
  %1041 = getelementptr inbounds i32* %1040, i64 0
  %1042 = load i32* %1041, align 4
  br label %1043

; <label>:1043                                    ; preds = %1022, %1002
  %1044 = phi i32 [ %1021, %1002 ], [ %1042, %1022 ]
  br label %1046

; <label>:1045                                    ; preds = %995
  br label %1046

; <label>:1046                                    ; preds = %1045, %1043
  %1047 = phi i32 [ %1044, %1043 ], [ 0, %1045 ]
  %1048 = getelementptr inbounds %struct.pix_pos* %block_d, i32 0, i32 0
  %1049 = load i32* %1048, align 4
  %1050 = icmp ne i32 %1049, 0
  br i1 %1050, label %1051, label %1096

; <label>:1051                                    ; preds = %1046
  %1052 = icmp eq i32 %list, 1
  br i1 %1052, label %1053, label %1073

; <label>:1053                                    ; preds = %1051
  %1054 = load i32* @FME_blocktype, align 4
  %1055 = sext i32 %1054 to i64
  %1056 = getelementptr inbounds %struct.pix_pos* %block_d, i32 0, i32 5
  %1057 = load i32* %1056, align 4
  %1058 = sext i32 %1057 to i64
  %1059 = getelementptr inbounds %struct.pix_pos* %block_d, i32 0, i32 4
  %1060 = load i32* %1059, align 4
  %1061 = sext i32 %1060 to i64
  %1062 = load i32****** @all_bwmincost, align 8
  %1063 = getelementptr inbounds i32***** %1062, i64 %1061
  %1064 = load i32***** %1063, align 8
  %1065 = getelementptr inbounds i32**** %1064, i64 %1058
  %1066 = load i32**** %1065, align 8
  %1067 = getelementptr inbounds i32*** %1066, i64 0
  %1068 = load i32*** %1067, align 8
  %1069 = getelementptr inbounds i32** %1068, i64 %1055
  %1070 = load i32** %1069, align 8
  %1071 = getelementptr inbounds i32* %1070, i64 0
  %1072 = load i32* %1071, align 4
  br label %1094

; <label>:1073                                    ; preds = %1051
  %1074 = load i32* @FME_blocktype, align 4
  %1075 = sext i32 %1074 to i64
  %1076 = sext i16 %ref_frame to i64
  %1077 = getelementptr inbounds %struct.pix_pos* %block_d, i32 0, i32 5
  %1078 = load i32* %1077, align 4
  %1079 = sext i32 %1078 to i64
  %1080 = getelementptr inbounds %struct.pix_pos* %block_d, i32 0, i32 4
  %1081 = load i32* %1080, align 4
  %1082 = sext i32 %1081 to i64
  %1083 = load i32****** @all_mincost, align 8
  %1084 = getelementptr inbounds i32***** %1083, i64 %1082
  %1085 = load i32***** %1084, align 8
  %1086 = getelementptr inbounds i32**** %1085, i64 %1079
  %1087 = load i32**** %1086, align 8
  %1088 = getelementptr inbounds i32*** %1087, i64 %1076
  %1089 = load i32*** %1088, align 8
  %1090 = getelementptr inbounds i32** %1089, i64 %1075
  %1091 = load i32** %1090, align 8
  %1092 = getelementptr inbounds i32* %1091, i64 0
  %1093 = load i32* %1092, align 4
  br label %1094

; <label>:1094                                    ; preds = %1073, %1053
  %1095 = phi i32 [ %1072, %1053 ], [ %1093, %1073 ]
  br label %1097

; <label>:1096                                    ; preds = %1046
  br label %1097

; <label>:1097                                    ; preds = %1096, %1094
  %1098 = phi i32 [ %1095, %1094 ], [ 0, %1096 ]
  %1099 = getelementptr inbounds %struct.pix_pos* %block_c, i32 0, i32 0
  %1100 = load i32* %1099, align 4
  %1101 = icmp ne i32 %1100, 0
  br i1 %1101, label %1102, label %1147

; <label>:1102                                    ; preds = %1097
  %1103 = icmp eq i32 %list, 1
  br i1 %1103, label %1104, label %1124

; <label>:1104                                    ; preds = %1102
  %1105 = load i32* @FME_blocktype, align 4
  %1106 = sext i32 %1105 to i64
  %1107 = getelementptr inbounds %struct.pix_pos* %block_c, i32 0, i32 5
  %1108 = load i32* %1107, align 4
  %1109 = sext i32 %1108 to i64
  %1110 = getelementptr inbounds %struct.pix_pos* %block_c, i32 0, i32 4
  %1111 = load i32* %1110, align 4
  %1112 = sext i32 %1111 to i64
  %1113 = load i32****** @all_bwmincost, align 8
  %1114 = getelementptr inbounds i32***** %1113, i64 %1112
  %1115 = load i32***** %1114, align 8
  %1116 = getelementptr inbounds i32**** %1115, i64 %1109
  %1117 = load i32**** %1116, align 8
  %1118 = getelementptr inbounds i32*** %1117, i64 0
  %1119 = load i32*** %1118, align 8
  %1120 = getelementptr inbounds i32** %1119, i64 %1106
  %1121 = load i32** %1120, align 8
  %1122 = getelementptr inbounds i32* %1121, i64 0
  %1123 = load i32* %1122, align 4
  br label %1145

; <label>:1124                                    ; preds = %1102
  %1125 = load i32* @FME_blocktype, align 4
  %1126 = sext i32 %1125 to i64
  %1127 = sext i16 %ref_frame to i64
  %1128 = getelementptr inbounds %struct.pix_pos* %block_c, i32 0, i32 5
  %1129 = load i32* %1128, align 4
  %1130 = sext i32 %1129 to i64
  %1131 = getelementptr inbounds %struct.pix_pos* %block_c, i32 0, i32 4
  %1132 = load i32* %1131, align 4
  %1133 = sext i32 %1132 to i64
  %1134 = load i32****** @all_mincost, align 8
  %1135 = getelementptr inbounds i32***** %1134, i64 %1133
  %1136 = load i32***** %1135, align 8
  %1137 = getelementptr inbounds i32**** %1136, i64 %1130
  %1138 = load i32**** %1137, align 8
  %1139 = getelementptr inbounds i32*** %1138, i64 %1127
  %1140 = load i32*** %1139, align 8
  %1141 = getelementptr inbounds i32** %1140, i64 %1126
  %1142 = load i32** %1141, align 8
  %1143 = getelementptr inbounds i32* %1142, i64 0
  %1144 = load i32* %1143, align 4
  br label %1145

; <label>:1145                                    ; preds = %1124, %1104
  %1146 = phi i32 [ %1123, %1104 ], [ %1144, %1124 ]
  br label %1148

; <label>:1147                                    ; preds = %1097
  br label %1148

; <label>:1148                                    ; preds = %1147, %1145
  %1149 = phi i32 [ %1146, %1145 ], [ %1098, %1147 ]
  br label %1150

; <label>:1150                                    ; preds = %1148, %940
  %SAD_a.1 = phi i32 [ %996, %1148 ], [ %SAD_a.0, %940 ]
  %SAD_b.1 = phi i32 [ %1047, %1148 ], [ %SAD_b.0, %940 ]
  %SAD_c.1 = phi i32 [ %1149, %1148 ], [ %SAD_c.0, %940 ]
  switch i32 %mvPredType.10, label %1255 [
    i32 0, label %1151
    i32 1, label %1228
    i32 2, label %1237
    i32 3, label %1246
  ]

; <label>:1151                                    ; preds = %1150
  %1152 = getelementptr inbounds %struct.pix_pos* %block_b, i32 0, i32 0
  %1153 = load i32* %1152, align 4
  %1154 = icmp ne i32 %1153, 0
  br i1 %1154, label %1168, label %1155

; <label>:1155                                    ; preds = %1151
  %1156 = getelementptr inbounds %struct.pix_pos* %block_c, i32 0, i32 0
  %1157 = load i32* %1156, align 4
  %1158 = icmp ne i32 %1157, 0
  br i1 %1158, label %1168, label %1159

; <label>:1159                                    ; preds = %1155
  %1160 = load %struct.InputParameters** @input, align 8
  %1161 = getelementptr inbounds %struct.InputParameters* %1160, i32 0, i32 134
  %1162 = load i32* %1161, align 4
  %1163 = icmp ne i32 %1162, 0
  br i1 %1163, label %1164, label %1167

; <label>:1164                                    ; preds = %1159
  %1165 = sext i32 %hv.0 to i64
  %1166 = getelementptr inbounds [2 x i32]* %temp_pred_SAD, i32 0, i64 %1165
  store i32 %SAD_a.1, i32* %1166, align 4
  br label %1167

; <label>:1167                                    ; preds = %1164, %1159
  br label %1203

; <label>:1168                                    ; preds = %1155, %1151
  %1169 = add nsw i32 %mv_a.1, %mv_b.1
  %1170 = add nsw i32 %1169, %mv_c.1
  %1171 = icmp slt i32 %mv_b.1, %mv_c.1
  br i1 %1171, label %1172, label %1173

; <label>:1172                                    ; preds = %1168
  br label %1174

; <label>:1173                                    ; preds = %1168
  br label %1174

; <label>:1174                                    ; preds = %1173, %1172
  %1175 = phi i32 [ %mv_b.1, %1172 ], [ %mv_c.1, %1173 ]
  %1176 = icmp slt i32 %mv_a.1, %1175
  br i1 %1176, label %1177, label %1178

; <label>:1177                                    ; preds = %1174
  br label %1184

; <label>:1178                                    ; preds = %1174
  %1179 = icmp slt i32 %mv_b.1, %mv_c.1
  br i1 %1179, label %1180, label %1181

; <label>:1180                                    ; preds = %1178
  br label %1182

; <label>:1181                                    ; preds = %1178
  br label %1182

; <label>:1182                                    ; preds = %1181, %1180
  %1183 = phi i32 [ %mv_b.1, %1180 ], [ %mv_c.1, %1181 ]
  br label %1184

; <label>:1184                                    ; preds = %1182, %1177
  %1185 = phi i32 [ %mv_a.1, %1177 ], [ %1183, %1182 ]
  %1186 = sub nsw i32 %1170, %1185
  %1187 = icmp sgt i32 %mv_b.1, %mv_c.1
  br i1 %1187, label %1188, label %1189

; <label>:1188                                    ; preds = %1184
  br label %1190

; <label>:1189                                    ; preds = %1184
  br label %1190

; <label>:1190                                    ; preds = %1189, %1188
  %1191 = phi i32 [ %mv_b.1, %1188 ], [ %mv_c.1, %1189 ]
  %1192 = icmp sgt i32 %mv_a.1, %1191
  br i1 %1192, label %1193, label %1194

; <label>:1193                                    ; preds = %1190
  br label %1200

; <label>:1194                                    ; preds = %1190
  %1195 = icmp sgt i32 %mv_b.1, %mv_c.1
  br i1 %1195, label %1196, label %1197

; <label>:1196                                    ; preds = %1194
  br label %1198

; <label>:1197                                    ; preds = %1194
  br label %1198

; <label>:1198                                    ; preds = %1197, %1196
  %1199 = phi i32 [ %mv_b.1, %1196 ], [ %mv_c.1, %1197 ]
  br label %1200

; <label>:1200                                    ; preds = %1198, %1193
  %1201 = phi i32 [ %mv_a.1, %1193 ], [ %1199, %1198 ]
  %1202 = sub nsw i32 %1186, %1201
  br label %1203

; <label>:1203                                    ; preds = %1200, %1167
  %pred_vec.1 = phi i32 [ %1202, %1200 ], [ %mv_a.1, %1167 ]
  %1204 = load %struct.InputParameters** @input, align 8
  %1205 = getelementptr inbounds %struct.InputParameters* %1204, i32 0, i32 134
  %1206 = load i32* %1205, align 4
  %1207 = icmp ne i32 %1206, 0
  br i1 %1207, label %1208, label %1227

; <label>:1208                                    ; preds = %1203
  %1209 = icmp eq i32 %pred_vec.1, %mv_a.1
  br i1 %1209, label %1210, label %1215

; <label>:1210                                    ; preds = %1208
  %1211 = icmp ne i32 %SAD_a.1, 0
  br i1 %1211, label %1212, label %1215

; <label>:1212                                    ; preds = %1210
  %1213 = sext i32 %hv.0 to i64
  %1214 = getelementptr inbounds [2 x i32]* %temp_pred_SAD, i32 0, i64 %1213
  store i32 %SAD_a.1, i32* %1214, align 4
  br label %1226

; <label>:1215                                    ; preds = %1210, %1208
  %1216 = icmp eq i32 %pred_vec.1, %mv_b.1
  br i1 %1216, label %1217, label %1222

; <label>:1217                                    ; preds = %1215
  %1218 = icmp ne i32 %SAD_b.1, 0
  br i1 %1218, label %1219, label %1222

; <label>:1219                                    ; preds = %1217
  %1220 = sext i32 %hv.0 to i64
  %1221 = getelementptr inbounds [2 x i32]* %temp_pred_SAD, i32 0, i64 %1220
  store i32 %SAD_b.1, i32* %1221, align 4
  br label %1225

; <label>:1222                                    ; preds = %1217, %1215
  %1223 = sext i32 %hv.0 to i64
  %1224 = getelementptr inbounds [2 x i32]* %temp_pred_SAD, i32 0, i64 %1223
  store i32 %SAD_c.1, i32* %1224, align 4
  br label %1225

; <label>:1225                                    ; preds = %1222, %1219
  br label %1226

; <label>:1226                                    ; preds = %1225, %1212
  br label %1227

; <label>:1227                                    ; preds = %1226, %1203
  br label %1256

; <label>:1228                                    ; preds = %1150
  %1229 = load %struct.InputParameters** @input, align 8
  %1230 = getelementptr inbounds %struct.InputParameters* %1229, i32 0, i32 134
  %1231 = load i32* %1230, align 4
  %1232 = icmp ne i32 %1231, 0
  br i1 %1232, label %1233, label %1236

; <label>:1233                                    ; preds = %1228
  %1234 = sext i32 %hv.0 to i64
  %1235 = getelementptr inbounds [2 x i32]* %temp_pred_SAD, i32 0, i64 %1234
  store i32 %SAD_a.1, i32* %1235, align 4
  br label %1236

; <label>:1236                                    ; preds = %1233, %1228
  br label %1256

; <label>:1237                                    ; preds = %1150
  %1238 = load %struct.InputParameters** @input, align 8
  %1239 = getelementptr inbounds %struct.InputParameters* %1238, i32 0, i32 134
  %1240 = load i32* %1239, align 4
  %1241 = icmp ne i32 %1240, 0
  br i1 %1241, label %1242, label %1245

; <label>:1242                                    ; preds = %1237
  %1243 = sext i32 %hv.0 to i64
  %1244 = getelementptr inbounds [2 x i32]* %temp_pred_SAD, i32 0, i64 %1243
  store i32 %SAD_b.1, i32* %1244, align 4
  br label %1245

; <label>:1245                                    ; preds = %1242, %1237
  br label %1256

; <label>:1246                                    ; preds = %1150
  %1247 = load %struct.InputParameters** @input, align 8
  %1248 = getelementptr inbounds %struct.InputParameters* %1247, i32 0, i32 134
  %1249 = load i32* %1248, align 4
  %1250 = icmp ne i32 %1249, 0
  br i1 %1250, label %1251, label %1254

; <label>:1251                                    ; preds = %1246
  %1252 = sext i32 %hv.0 to i64
  %1253 = getelementptr inbounds [2 x i32]* %temp_pred_SAD, i32 0, i64 %1252
  store i32 %SAD_c.1, i32* %1253, align 4
  br label %1254

; <label>:1254                                    ; preds = %1251, %1246
  br label %1256

; <label>:1255                                    ; preds = %1150
  br label %1256

; <label>:1256                                    ; preds = %1255, %1254, %1245, %1236, %1227
  %pred_vec.2 = phi i32 [ %pred_vec.0, %1255 ], [ %mv_c.1, %1254 ], [ %mv_b.1, %1245 ], [ %mv_a.1, %1236 ], [ %pred_vec.1, %1227 ]
  %1257 = trunc i32 %pred_vec.2 to i16
  %1258 = sext i32 %hv.0 to i64
  %1259 = getelementptr inbounds i16* %pmv, i64 %1258
  store i16 %1257, i16* %1259, align 2
  br label %1260

; <label>:1260                                    ; preds = %1256
  %1261 = add nsw i32 %hv.0, 1
  br label %507

; <label>:1262                                    ; preds = %507
  %1263 = load %struct.InputParameters** @input, align 8
  %1264 = getelementptr inbounds %struct.InputParameters* %1263, i32 0, i32 134
  %1265 = load i32* %1264, align 4
  %1266 = icmp ne i32 %1265, 0
  br i1 %1266, label %1267, label %1281

; <label>:1267                                    ; preds = %1262
  %1268 = getelementptr inbounds [2 x i32]* %temp_pred_SAD, i32 0, i64 0
  %1269 = load i32* %1268, align 4
  %1270 = getelementptr inbounds [2 x i32]* %temp_pred_SAD, i32 0, i64 1
  %1271 = load i32* %1270, align 4
  %1272 = icmp sgt i32 %1269, %1271
  br i1 %1272, label %1273, label %1276

; <label>:1273                                    ; preds = %1267
  %1274 = getelementptr inbounds [2 x i32]* %temp_pred_SAD, i32 0, i64 1
  %1275 = load i32* %1274, align 4
  br label %1279

; <label>:1276                                    ; preds = %1267
  %1277 = getelementptr inbounds [2 x i32]* %temp_pred_SAD, i32 0, i64 0
  %1278 = load i32* %1277, align 4
  br label %1279

; <label>:1279                                    ; preds = %1276, %1273
  %1280 = phi i32 [ %1275, %1273 ], [ %1278, %1276 ]
  store i32 %1280, i32* @pred_SAD_space, align 4
  br label %1281

; <label>:1281                                    ; preds = %1279, %1262
  ret void
}

declare i16* @FastLine16Y_11(i16*, i32, i32, i32, i32) #2

declare i16* @UMVLine16Y_11(i16*, i32, i32, i32, i32) #2

declare void @getLuma4x4Neighbour(i32, i32, i32, i32, i32, %struct.pix_pos*) #2

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #3

; Function Attrs: nounwind uwtable
define void @Init_Motion_Search_Module() #0 {
  %1 = load %struct.ImageParameters** @img, align 8
  %2 = getelementptr inbounds %struct.ImageParameters* %1, i32 0, i32 155
  %3 = load i32* %2, align 4
  %4 = load %struct.ImageParameters** @img, align 8
  %5 = getelementptr inbounds %struct.ImageParameters* %4, i32 0, i32 156
  %6 = load i32* %5, align 4
  %7 = icmp sgt i32 %3, %6
  br i1 %7, label %8, label %14

; <label>:8                                       ; preds = %0
  %9 = load %struct.ImageParameters** @img, align 8
  %10 = getelementptr inbounds %struct.ImageParameters* %9, i32 0, i32 155
  %11 = load i32* %10, align 4
  %12 = add nsw i32 %11, 1
  %13 = mul nsw i32 %12, 2
  br label %20

; <label>:14                                      ; preds = %0
  %15 = load %struct.ImageParameters** @img, align 8
  %16 = getelementptr inbounds %struct.ImageParameters* %15, i32 0, i32 156
  %17 = load i32* %16, align 4
  %18 = add nsw i32 %17, 1
  %19 = mul nsw i32 %18, 2
  br label %20

; <label>:20                                      ; preds = %14, %8
  %21 = phi i32 [ %13, %8 ], [ %19, %14 ]
  %22 = load %struct.InputParameters** @input, align 8
  %23 = getelementptr inbounds %struct.InputParameters* %22, i32 0, i32 8
  %24 = load i32* %23, align 4
  %25 = load %struct.ImageParameters** @img, align 8
  %26 = getelementptr inbounds %struct.ImageParameters* %25, i32 0, i32 9
  %27 = load i32* %26, align 4
  %28 = mul nsw i32 2, %24
  %29 = add nsw i32 %28, 1
  %30 = mul nsw i32 2, %24
  %31 = add nsw i32 %30, 1
  %32 = mul nsw i32 %29, %31
  %33 = icmp sgt i32 9, %32
  br i1 %33, label %34, label %35

; <label>:34                                      ; preds = %20
  br label %41

; <label>:35                                      ; preds = %20
  %36 = mul nsw i32 2, %24
  %37 = add nsw i32 %36, 1
  %38 = mul nsw i32 2, %24
  %39 = add nsw i32 %38, 1
  %40 = mul nsw i32 %37, %39
  br label %41

; <label>:41                                      ; preds = %35, %34
  %42 = phi i32 [ 9, %34 ], [ %40, %35 ]
  %43 = add nsw i32 %27, 1
  %44 = icmp sgt i32 16, %43
  br i1 %44, label %45, label %46

; <label>:45                                      ; preds = %41
  br label %48

; <label>:46                                      ; preds = %41
  %47 = add nsw i32 %27, 1
  br label %48

; <label>:48                                      ; preds = %46, %45
  %49 = phi i32 [ 16, %45 ], [ %47, %46 ]
  %50 = sitofp i32 %49 to double
  %51 = call double @log(double %50) #3
  %52 = call double @log(double 2.000000e+00) #3
  %53 = fdiv double %51, %52
  %54 = fadd double %53, 1.000000e-10
  %55 = call double @floor(double %54) #5
  %56 = fptosi double %55 to i32
  %57 = mul nsw i32 2, %56
  %58 = add nsw i32 1, %57
  %59 = ashr i32 %58, 1
  %60 = add nsw i32 %59, 1
  %61 = shl i32 1, %60
  %62 = sub nsw i32 %61, 1
  %63 = mul nsw i32 2, %24
  %64 = add nsw i32 %63, 3
  %65 = mul nsw i32 4, %64
  %66 = add nsw i32 %65, 1
  %67 = sitofp i32 %66 to double
  %68 = call double @log(double %67) #3
  %69 = call double @log(double 2.000000e+00) #3
  %70 = fdiv double %68, %69
  %71 = fadd double %70, 1.000000e-10
  %72 = call double @ceil(double %71) #5
  %73 = fptosi double %72 to i32
  %74 = mul nsw i32 2, %73
  %75 = add nsw i32 3, %74
  %76 = ashr i32 %75, 1
  %77 = shl i32 1, %76
  %78 = sub nsw i32 %77, 1
  store i32 %78, i32* @max_mvd, align 4
  %79 = sext i32 %42 to i64
  %80 = call noalias i8* @calloc(i64 %79, i64 4) #3
  %81 = bitcast i8* %80 to i32*
  store i32* %81, i32** @spiral_search_x, align 8
  %82 = icmp eq i32* %81, null
  br i1 %82, label %83, label %84

; <label>:83                                      ; preds = %48
  call void @no_mem_exit(i8* getelementptr inbounds ([43 x i8]* @.str6, i32 0, i32 0))
  br label %84

; <label>:84                                      ; preds = %83, %48
  %85 = sext i32 %42 to i64
  %86 = call noalias i8* @calloc(i64 %85, i64 4) #3
  %87 = bitcast i8* %86 to i32*
  store i32* %87, i32** @spiral_search_y, align 8
  %88 = icmp eq i32* %87, null
  br i1 %88, label %89, label %90

; <label>:89                                      ; preds = %84
  call void @no_mem_exit(i8* getelementptr inbounds ([43 x i8]* @.str7, i32 0, i32 0))
  br label %90

; <label>:90                                      ; preds = %89, %84
  %91 = load i32* @max_mvd, align 4
  %92 = mul nsw i32 2, %91
  %93 = add nsw i32 %92, 1
  %94 = sext i32 %93 to i64
  %95 = call noalias i8* @calloc(i64 %94, i64 4) #3
  %96 = bitcast i8* %95 to i32*
  store i32* %96, i32** @mvbits, align 8
  %97 = icmp eq i32* %96, null
  br i1 %97, label %98, label %99

; <label>:98                                      ; preds = %90
  call void @no_mem_exit(i8* getelementptr inbounds ([34 x i8]* @.str8, i32 0, i32 0))
  br label %99

; <label>:99                                      ; preds = %98, %90
  %100 = sext i32 %62 to i64
  %101 = call noalias i8* @calloc(i64 %100, i64 4) #3
  %102 = bitcast i8* %101 to i32*
  store i32* %102, i32** @refbits, align 8
  %103 = icmp eq i32* %102, null
  br i1 %103, label %104, label %105

; <label>:104                                     ; preds = %99
  call void @no_mem_exit(i8* getelementptr inbounds ([35 x i8]* @.str9, i32 0, i32 0))
  br label %105

; <label>:105                                     ; preds = %104, %99
  %106 = sext i32 %21 to i64
  %107 = call noalias i8* @calloc(i64 %106, i64 4) #3
  %108 = bitcast i8* %107 to i32*
  store i32* %108, i32** @byte_abs, align 8
  %109 = icmp eq i32* %108, null
  br i1 %109, label %110, label %111

; <label>:110                                     ; preds = %105
  call void @no_mem_exit(i8* getelementptr inbounds ([36 x i8]* @.str10, i32 0, i32 0))
  br label %111

; <label>:111                                     ; preds = %110, %105
  %112 = load %struct.ImageParameters** @img, align 8
  %113 = getelementptr inbounds %struct.ImageParameters* %112, i32 0, i32 9
  %114 = load i32* %113, align 4
  %115 = add nsw i32 %114, 1
  %116 = call i32 @get_mem4Dint(i32***** @motion_cost, i32 8, i32 2, i32 %115, i32 4)
  %117 = load i32* @max_mvd, align 4
  %118 = load i32** @mvbits, align 8
  %119 = sext i32 %117 to i64
  %120 = getelementptr inbounds i32* %118, i64 %119
  store i32* %120, i32** @mvbits, align 8
  %121 = sdiv i32 %21, 2
  %122 = load i32** @byte_abs, align 8
  %123 = sext i32 %121 to i64
  %124 = getelementptr inbounds i32* %122, i64 %123
  store i32* %124, i32** @byte_abs, align 8
  %125 = load i32** @mvbits, align 8
  %126 = getelementptr inbounds i32* %125, i64 0
  store i32 1, i32* %126, align 4
  br label %127

; <label>:127                                     ; preds = %146, %111
  %bits.0 = phi i32 [ 3, %111 ], [ %147, %146 ]
  %128 = icmp sle i32 %bits.0, %75
  br i1 %128, label %129, label %148

; <label>:129                                     ; preds = %127
  %130 = ashr i32 %bits.0, 1
  %131 = shl i32 1, %130
  %132 = ashr i32 %131, 1
  br label %133

; <label>:133                                     ; preds = %143, %129
  %i.0 = phi i32 [ %132, %129 ], [ %144, %143 ]
  %134 = icmp slt i32 %i.0, %131
  br i1 %134, label %135, label %145

; <label>:135                                     ; preds = %133
  %136 = sext i32 %i.0 to i64
  %137 = load i32** @mvbits, align 8
  %138 = getelementptr inbounds i32* %137, i64 %136
  store i32 %bits.0, i32* %138, align 4
  %139 = sub nsw i32 0, %i.0
  %140 = sext i32 %139 to i64
  %141 = load i32** @mvbits, align 8
  %142 = getelementptr inbounds i32* %141, i64 %140
  store i32 %bits.0, i32* %142, align 4
  br label %143

; <label>:143                                     ; preds = %135
  %144 = add nsw i32 %i.0, 1
  br label %133

; <label>:145                                     ; preds = %133
  br label %146

; <label>:146                                     ; preds = %145
  %147 = add nsw i32 %bits.0, 2
  br label %127

; <label>:148                                     ; preds = %127
  %149 = load i32** @refbits, align 8
  %150 = getelementptr inbounds i32* %149, i64 0
  store i32 1, i32* %150, align 4
  br label %151

; <label>:151                                     ; preds = %168, %148
  %bits.1 = phi i32 [ 3, %148 ], [ %169, %168 ]
  %152 = icmp sle i32 %bits.1, %58
  br i1 %152, label %153, label %170

; <label>:153                                     ; preds = %151
  %154 = ashr i32 %bits.1, 1
  %155 = add nsw i32 %154, 1
  %156 = shl i32 1, %155
  %157 = sub nsw i32 %156, 1
  %158 = ashr i32 %157, 1
  br label %159

; <label>:159                                     ; preds = %165, %153
  %i.1 = phi i32 [ %158, %153 ], [ %166, %165 ]
  %160 = icmp slt i32 %i.1, %157
  br i1 %160, label %161, label %167

; <label>:161                                     ; preds = %159
  %162 = sext i32 %i.1 to i64
  %163 = load i32** @refbits, align 8
  %164 = getelementptr inbounds i32* %163, i64 %162
  store i32 %bits.1, i32* %164, align 4
  br label %165

; <label>:165                                     ; preds = %161
  %166 = add nsw i32 %i.1, 1
  br label %159

; <label>:167                                     ; preds = %159
  br label %168

; <label>:168                                     ; preds = %167
  %169 = add nsw i32 %bits.1, 2
  br label %151

; <label>:170                                     ; preds = %151
  %171 = load i32** @byte_abs, align 8
  %172 = getelementptr inbounds i32* %171, i64 0
  store i32 0, i32* %172, align 4
  br label %173

; <label>:173                                     ; preds = %184, %170
  %i.2 = phi i32 [ 1, %170 ], [ %185, %184 ]
  %174 = sdiv i32 %21, 2
  %175 = icmp slt i32 %i.2, %174
  br i1 %175, label %176, label %186

; <label>:176                                     ; preds = %173
  %177 = sub nsw i32 0, %i.2
  %178 = sext i32 %177 to i64
  %179 = load i32** @byte_abs, align 8
  %180 = getelementptr inbounds i32* %179, i64 %178
  store i32 %i.2, i32* %180, align 4
  %181 = sext i32 %i.2 to i64
  %182 = load i32** @byte_abs, align 8
  %183 = getelementptr inbounds i32* %182, i64 %181
  store i32 %i.2, i32* %183, align 4
  br label %184

; <label>:184                                     ; preds = %176
  %185 = add nsw i32 %i.2, 1
  br label %173

; <label>:186                                     ; preds = %173
  %187 = load i32** @spiral_search_y, align 8
  %188 = getelementptr inbounds i32* %187, i64 0
  store i32 0, i32* %188, align 4
  %189 = load i32** @spiral_search_x, align 8
  %190 = getelementptr inbounds i32* %189, i64 0
  store i32 0, i32* %190, align 4
  br label %191

; <label>:191                                     ; preds = %244, %186
  %l.0 = phi i32 [ 1, %186 ], [ %245, %244 ]
  %k.0 = phi i32 [ 1, %186 ], [ %k.2, %244 ]
  %192 = icmp sgt i32 1, %24
  br i1 %192, label %193, label %194

; <label>:193                                     ; preds = %191
  br label %195

; <label>:194                                     ; preds = %191
  br label %195

; <label>:195                                     ; preds = %194, %193
  %196 = phi i32 [ 1, %193 ], [ %24, %194 ]
  %197 = icmp sle i32 %l.0, %196
  br i1 %197, label %198, label %246

; <label>:198                                     ; preds = %195
  %199 = sub nsw i32 0, %l.0
  %200 = add nsw i32 %199, 1
  br label %201

; <label>:201                                     ; preds = %219, %198
  %k.1 = phi i32 [ %k.0, %198 ], [ %215, %219 ]
  %i.3 = phi i32 [ %200, %198 ], [ %220, %219 ]
  %202 = icmp slt i32 %i.3, %l.0
  br i1 %202, label %203, label %221

; <label>:203                                     ; preds = %201
  %204 = sext i32 %k.1 to i64
  %205 = load i32** @spiral_search_x, align 8
  %206 = getelementptr inbounds i32* %205, i64 %204
  store i32 %i.3, i32* %206, align 4
  %207 = sub nsw i32 0, %l.0
  %208 = add nsw i32 %k.1, 1
  %209 = sext i32 %k.1 to i64
  %210 = load i32** @spiral_search_y, align 8
  %211 = getelementptr inbounds i32* %210, i64 %209
  store i32 %207, i32* %211, align 4
  %212 = sext i32 %208 to i64
  %213 = load i32** @spiral_search_x, align 8
  %214 = getelementptr inbounds i32* %213, i64 %212
  store i32 %i.3, i32* %214, align 4
  %215 = add nsw i32 %208, 1
  %216 = sext i32 %208 to i64
  %217 = load i32** @spiral_search_y, align 8
  %218 = getelementptr inbounds i32* %217, i64 %216
  store i32 %l.0, i32* %218, align 4
  br label %219

; <label>:219                                     ; preds = %203
  %220 = add nsw i32 %i.3, 1
  br label %201

; <label>:221                                     ; preds = %201
  %222 = sub nsw i32 0, %l.0
  br label %223

; <label>:223                                     ; preds = %241, %221
  %k.2 = phi i32 [ %k.1, %221 ], [ %237, %241 ]
  %i.4 = phi i32 [ %222, %221 ], [ %242, %241 ]
  %224 = icmp sle i32 %i.4, %l.0
  br i1 %224, label %225, label %243

; <label>:225                                     ; preds = %223
  %226 = sub nsw i32 0, %l.0
  %227 = sext i32 %k.2 to i64
  %228 = load i32** @spiral_search_x, align 8
  %229 = getelementptr inbounds i32* %228, i64 %227
  store i32 %226, i32* %229, align 4
  %230 = add nsw i32 %k.2, 1
  %231 = sext i32 %k.2 to i64
  %232 = load i32** @spiral_search_y, align 8
  %233 = getelementptr inbounds i32* %232, i64 %231
  store i32 %i.4, i32* %233, align 4
  %234 = sext i32 %230 to i64
  %235 = load i32** @spiral_search_x, align 8
  %236 = getelementptr inbounds i32* %235, i64 %234
  store i32 %l.0, i32* %236, align 4
  %237 = add nsw i32 %230, 1
  %238 = sext i32 %230 to i64
  %239 = load i32** @spiral_search_y, align 8
  %240 = getelementptr inbounds i32* %239, i64 %238
  store i32 %i.4, i32* %240, align 4
  br label %241

; <label>:241                                     ; preds = %225
  %242 = add nsw i32 %i.4, 1
  br label %223

; <label>:243                                     ; preds = %223
  br label %244

; <label>:244                                     ; preds = %243
  %245 = add nsw i32 %l.0, 1
  br label %191

; <label>:246                                     ; preds = %195
  %247 = load %struct.InputParameters** @input, align 8
  %248 = getelementptr inbounds %struct.InputParameters* %247, i32 0, i32 134
  %249 = load i32* %248, align 4
  %250 = icmp ne i32 %249, 0
  br i1 %250, label %252, label %251

; <label>:251                                     ; preds = %246
  call void @InitializeFastFullIntegerSearch()
  br label %252

; <label>:252                                     ; preds = %251, %246
  ret void
}

; Function Attrs: nounwind readnone
declare double @floor(double) #4

; Function Attrs: nounwind
declare double @log(double) #1

; Function Attrs: nounwind readnone
declare double @ceil(double) #4

; Function Attrs: nounwind
declare noalias i8* @calloc(i64, i64) #1

declare i32 @get_mem4Dint(i32*****, i32, i32, i32, i32) #2

; Function Attrs: nounwind uwtable
define void @Clear_Motion_Search_Module() #0 {
  %1 = load i32* @max_mvd, align 4
  %2 = load i32** @mvbits, align 8
  %3 = sext i32 %1 to i64
  %4 = sub i64 0, %3
  %5 = getelementptr inbounds i32* %2, i64 %4
  store i32* %5, i32** @mvbits, align 8
  %6 = load %struct.ImageParameters** @img, align 8
  %7 = getelementptr inbounds %struct.ImageParameters* %6, i32 0, i32 155
  %8 = load i32* %7, align 4
  %9 = load %struct.ImageParameters** @img, align 8
  %10 = getelementptr inbounds %struct.ImageParameters* %9, i32 0, i32 156
  %11 = load i32* %10, align 4
  %12 = icmp sgt i32 %8, %11
  br i1 %12, label %13, label %18

; <label>:13                                      ; preds = %0
  %14 = load %struct.ImageParameters** @img, align 8
  %15 = getelementptr inbounds %struct.ImageParameters* %14, i32 0, i32 155
  %16 = load i32* %15, align 4
  %17 = add nsw i32 %16, 1
  br label %23

; <label>:18                                      ; preds = %0
  %19 = load %struct.ImageParameters** @img, align 8
  %20 = getelementptr inbounds %struct.ImageParameters* %19, i32 0, i32 156
  %21 = load i32* %20, align 4
  %22 = add nsw i32 %21, 1
  br label %23

; <label>:23                                      ; preds = %18, %13
  %24 = phi i32 [ %17, %13 ], [ %22, %18 ]
  %25 = load i32** @byte_abs, align 8
  %26 = sext i32 %24 to i64
  %27 = sub i64 0, %26
  %28 = getelementptr inbounds i32* %25, i64 %27
  store i32* %28, i32** @byte_abs, align 8
  %29 = load i32** @spiral_search_x, align 8
  %30 = bitcast i32* %29 to i8*
  call void @free(i8* %30) #3
  %31 = load i32** @spiral_search_y, align 8
  %32 = bitcast i32* %31 to i8*
  call void @free(i8* %32) #3
  %33 = load i32** @mvbits, align 8
  %34 = bitcast i32* %33 to i8*
  call void @free(i8* %34) #3
  %35 = load i32** @refbits, align 8
  %36 = bitcast i32* %35 to i8*
  call void @free(i8* %36) #3
  %37 = load i32** @byte_abs, align 8
  %38 = bitcast i32* %37 to i8*
  call void @free(i8* %38) #3
  %39 = load i32***** @motion_cost, align 8
  call void @free_mem4Dint(i32**** %39, i32 8, i32 2)
  %40 = load %struct.InputParameters** @input, align 8
  %41 = getelementptr inbounds %struct.InputParameters* %40, i32 0, i32 134
  %42 = load i32* %41, align 4
  %43 = icmp ne i32 %42, 0
  br i1 %43, label %45, label %44

; <label>:44                                      ; preds = %23
  call void @ClearFastFullIntegerSearch()
  br label %45

; <label>:45                                      ; preds = %44, %23
  ret void
}

declare void @free_mem4Dint(i32****, i32, i32) #2

; Function Attrs: nounwind uwtable
define i32 @FullPelBlockMotionSearch(i16** %orig_pic, i16 signext %ref, i32 %list, i32 %pic_pix_x, i32 %pic_pix_y, i32 %blocktype, i16 signext %pred_mv_x, i16 signext %pred_mv_y, i16* %mv_x, i16* %mv_y, i32 %search_range, i32 %min_mcost, double %lambda) #0 {
  %1 = load %struct.ImageParameters** @img, align 8
  %2 = getelementptr inbounds %struct.ImageParameters* %1, i32 0, i32 90
  %3 = load i32* %2, align 4
  %4 = icmp ne i32 %3, 0
  br i1 %4, label %5, label %24

; <label>:5                                       ; preds = %0
  %6 = load %struct.ImageParameters** @img, align 8
  %7 = getelementptr inbounds %struct.ImageParameters* %6, i32 0, i32 3
  %8 = load i32* %7, align 4
  %9 = sext i32 %8 to i64
  %10 = load %struct.ImageParameters** @img, align 8
  %11 = getelementptr inbounds %struct.ImageParameters* %10, i32 0, i32 51
  %12 = load %struct.macroblock** %11, align 8
  %13 = getelementptr inbounds %struct.macroblock* %12, i64 %9
  %14 = getelementptr inbounds %struct.macroblock* %13, i32 0, i32 22
  %15 = load i32* %14, align 4
  %16 = icmp ne i32 %15, 0
  br i1 %16, label %17, label %24

; <label>:17                                      ; preds = %5
  %18 = load %struct.ImageParameters** @img, align 8
  %19 = getelementptr inbounds %struct.ImageParameters* %18, i32 0, i32 3
  %20 = load i32* %19, align 4
  %21 = srem i32 %20, 2
  %22 = icmp ne i32 %21, 0
  %23 = select i1 %22, i32 4, i32 2
  br label %25

; <label>:24                                      ; preds = %5, %0
  br label %25

; <label>:25                                      ; preds = %24, %17
  %26 = phi i32 [ %23, %17 ], [ 0, %24 ]
  %27 = sext i16 %ref to i64
  %28 = add nsw i32 %list, %26
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds [6 x %struct.storable_picture**]* @listX, i32 0, i64 %29
  %31 = load %struct.storable_picture*** %30, align 8
  %32 = getelementptr inbounds %struct.storable_picture** %31, i64 %27
  %33 = load %struct.storable_picture** %32, align 8
  %34 = getelementptr inbounds %struct.storable_picture* %33, i32 0, i32 26
  %35 = load i16** %34, align 8
  %36 = sext i16 %ref to i64
  %37 = add nsw i32 %list, %26
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds [6 x %struct.storable_picture**]* @listX, i32 0, i64 %38
  %40 = load %struct.storable_picture*** %39, align 8
  %41 = getelementptr inbounds %struct.storable_picture** %40, i64 %36
  %42 = load %struct.storable_picture** %41, align 8
  %43 = getelementptr inbounds %struct.storable_picture* %42, i32 0, i32 18
  %44 = load i32* %43, align 4
  %45 = sext i16 %ref to i64
  %46 = add nsw i32 %list, %26
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds [6 x %struct.storable_picture**]* @listX, i32 0, i64 %47
  %49 = load %struct.storable_picture*** %48, align 8
  %50 = getelementptr inbounds %struct.storable_picture** %49, i64 %45
  %51 = load %struct.storable_picture** %50, align 8
  %52 = getelementptr inbounds %struct.storable_picture* %51, i32 0, i32 19
  %53 = load i32* %52, align 4
  %54 = mul nsw i32 2, %search_range
  %55 = add nsw i32 %54, 1
  %56 = mul nsw i32 2, %search_range
  %57 = add nsw i32 %56, 1
  %58 = mul nsw i32 %55, %57
  %59 = fmul double 6.553600e+04, %lambda
  %60 = fadd double %59, 5.000000e-01
  %61 = fptosi double %60 to i32
  %62 = sext i32 %blocktype to i64
  %63 = load %struct.InputParameters** @input, align 8
  %64 = getelementptr inbounds %struct.InputParameters* %63, i32 0, i32 20
  %65 = getelementptr inbounds [8 x [2 x i32]]* %64, i32 0, i64 %62
  %66 = getelementptr inbounds [2 x i32]* %65, i32 0, i64 1
  %67 = load i32* %66, align 4
  %68 = sext i32 %blocktype to i64
  %69 = load %struct.InputParameters** @input, align 8
  %70 = getelementptr inbounds %struct.InputParameters* %69, i32 0, i32 20
  %71 = getelementptr inbounds [8 x [2 x i32]]* %70, i32 0, i64 %68
  %72 = getelementptr inbounds [2 x i32]* %71, i32 0, i64 0
  %73 = load i32* %72, align 4
  %74 = ashr i32 %73, 2
  %75 = shl i32 %pic_pix_x, 2
  %76 = sext i16 %pred_mv_x to i32
  %77 = add nsw i32 %75, %76
  %78 = shl i32 %pic_pix_y, 2
  %79 = sext i16 %pred_mv_y to i32
  %80 = add nsw i32 %78, %79
  %81 = load i16* %mv_x, align 2
  %82 = sext i16 %81 to i32
  %83 = add nsw i32 %pic_pix_x, %82
  %84 = load i16* %mv_y, align 2
  %85 = sext i16 %84 to i32
  %86 = add nsw i32 %pic_pix_y, %85
  %87 = icmp eq i32 %blocktype, 1
  br i1 %87, label %88, label %101

; <label>:88                                      ; preds = %25
  %89 = load %struct.InputParameters** @input, align 8
  %90 = getelementptr inbounds %struct.InputParameters* %89, i32 0, i32 85
  %91 = load i32* %90, align 4
  %92 = icmp ne i32 %91, 0
  br i1 %92, label %101, label %93

; <label>:93                                      ; preds = %88
  %94 = load %struct.ImageParameters** @img, align 8
  %95 = getelementptr inbounds %struct.ImageParameters* %94, i32 0, i32 6
  %96 = load i32* %95, align 4
  %97 = icmp ne i32 %96, 1
  br i1 %97, label %98, label %101

; <label>:98                                      ; preds = %93
  %99 = sext i16 %ref to i32
  %100 = icmp eq i32 %99, 0
  br label %101

; <label>:101                                     ; preds = %98, %93, %88, %25
  %102 = phi i1 [ false, %93 ], [ false, %88 ], [ false, %25 ], [ %100, %98 ]
  %103 = zext i1 %102 to i32
  %104 = load %struct.pic_parameter_set_rbsp_t** @active_pps, align 8
  %105 = getelementptr inbounds %struct.pic_parameter_set_rbsp_t* %104, i32 0, i32 19
  %106 = load i32* %105, align 4
  %107 = icmp ne i32 %106, 0
  br i1 %107, label %108, label %118

; <label>:108                                     ; preds = %101
  %109 = load %struct.ImageParameters** @img, align 8
  %110 = getelementptr inbounds %struct.ImageParameters* %109, i32 0, i32 6
  %111 = load i32* %110, align 4
  %112 = icmp eq i32 %111, 0
  br i1 %112, label %130, label %113

; <label>:113                                     ; preds = %108
  %114 = load %struct.ImageParameters** @img, align 8
  %115 = getelementptr inbounds %struct.ImageParameters* %114, i32 0, i32 6
  %116 = load i32* %115, align 4
  %117 = icmp eq i32 %116, 3
  br i1 %117, label %130, label %118

; <label>:118                                     ; preds = %113, %101
  %119 = load %struct.pic_parameter_set_rbsp_t** @active_pps, align 8
  %120 = getelementptr inbounds %struct.pic_parameter_set_rbsp_t* %119, i32 0, i32 20
  %121 = load i32* %120, align 4
  %122 = icmp ne i32 %121, 0
  br i1 %122, label %123, label %128

; <label>:123                                     ; preds = %118
  %124 = load %struct.ImageParameters** @img, align 8
  %125 = getelementptr inbounds %struct.ImageParameters* %124, i32 0, i32 6
  %126 = load i32* %125, align 4
  %127 = icmp eq i32 %126, 1
  br label %128

; <label>:128                                     ; preds = %123, %118
  %129 = phi i1 [ false, %118 ], [ %127, %123 ]
  br label %130

; <label>:130                                     ; preds = %128, %113, %108
  %131 = phi i1 [ true, %113 ], [ true, %108 ], [ %129, %128 ]
  %132 = zext i1 %131 to i32
  %133 = icmp ne i32 %132, 0
  br i1 %133, label %134, label %149

; <label>:134                                     ; preds = %130
  %135 = load %struct.InputParameters** @input, align 8
  %136 = getelementptr inbounds %struct.InputParameters* %135, i32 0, i32 48
  %137 = load i32* %136, align 4
  %138 = icmp ne i32 %137, 0
  br i1 %138, label %139, label %149

; <label>:139                                     ; preds = %134
  %140 = sext i16 %ref to i64
  %141 = add nsw i32 %list, %26
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds [6 x %struct.storable_picture**]* @listX, i32 0, i64 %142
  %144 = load %struct.storable_picture*** %143, align 8
  %145 = getelementptr inbounds %struct.storable_picture** %144, i64 %140
  %146 = load %struct.storable_picture** %145, align 8
  %147 = getelementptr inbounds %struct.storable_picture* %146, i32 0, i32 27
  %148 = load i16** %147, align 8
  br label %159

; <label>:149                                     ; preds = %134, %130
  %150 = sext i16 %ref to i64
  %151 = add nsw i32 %list, %26
  %152 = sext i32 %151 to i64
  %153 = getelementptr inbounds [6 x %struct.storable_picture**]* @listX, i32 0, i64 %152
  %154 = load %struct.storable_picture*** %153, align 8
  %155 = getelementptr inbounds %struct.storable_picture** %154, i64 %150
  %156 = load %struct.storable_picture** %155, align 8
  %157 = getelementptr inbounds %struct.storable_picture* %156, i32 0, i32 26
  %158 = load i16** %157, align 8
  br label %159

; <label>:159                                     ; preds = %149, %139
  %ref_pic.0 = phi i16* [ %148, %139 ], [ %158, %149 ]
  %160 = icmp sgt i32 %83, %search_range
  br i1 %160, label %161, label %180

; <label>:161                                     ; preds = %159
  %162 = load %struct.ImageParameters** @img, align 8
  %163 = getelementptr inbounds %struct.ImageParameters* %162, i32 0, i32 13
  %164 = load i32* %163, align 4
  %165 = sub nsw i32 %164, 1
  %166 = sub nsw i32 %165, %search_range
  %167 = sub nsw i32 %166, %73
  %168 = icmp slt i32 %83, %167
  br i1 %168, label %169, label %180

; <label>:169                                     ; preds = %161
  %170 = icmp sgt i32 %86, %search_range
  br i1 %170, label %171, label %180

; <label>:171                                     ; preds = %169
  %172 = load %struct.ImageParameters** @img, align 8
  %173 = getelementptr inbounds %struct.ImageParameters* %172, i32 0, i32 15
  %174 = load i32* %173, align 4
  %175 = sub nsw i32 %174, 1
  %176 = sub nsw i32 %175, %search_range
  %177 = sub nsw i32 %176, %67
  %178 = icmp slt i32 %86, %177
  br i1 %178, label %179, label %180

; <label>:179                                     ; preds = %171
  br label %181

; <label>:180                                     ; preds = %171, %169, %161, %159
  br label %181

; <label>:181                                     ; preds = %180, %179
  %get_ref_line.0 = phi i16* (i32, i16*, i32, i32, i32, i32)* [ @FastLineX, %179 ], [ @UMVLineX, %180 ]
  br label %182

; <label>:182                                     ; preds = %294, %181
  %.0 = phi i32 [ %min_mcost, %181 ], [ %.2, %294 ]
  %pos.0 = phi i32 [ 0, %181 ], [ %295, %294 ]
  %best_pos.0 = phi i32 [ 0, %181 ], [ %best_pos.2, %294 ]
  %183 = icmp slt i32 %pos.0, %58
  br i1 %183, label %184, label %296

; <label>:184                                     ; preds = %182
  %185 = sext i32 %pos.0 to i64
  %186 = load i32** @spiral_search_x, align 8
  %187 = getelementptr inbounds i32* %186, i64 %185
  %188 = load i32* %187, align 4
  %189 = add nsw i32 %83, %188
  %190 = sext i32 %pos.0 to i64
  %191 = load i32** @spiral_search_y, align 8
  %192 = getelementptr inbounds i32* %191, i64 %190
  %193 = load i32* %192, align 4
  %194 = add nsw i32 %86, %193
  %195 = shl i32 %189, 2
  %196 = sub nsw i32 %195, %77
  %197 = sext i32 %196 to i64
  %198 = load i32** @mvbits, align 8
  %199 = getelementptr inbounds i32* %198, i64 %197
  %200 = load i32* %199, align 4
  %201 = shl i32 %194, 2
  %202 = sub nsw i32 %201, %80
  %203 = sext i32 %202 to i64
  %204 = load i32** @mvbits, align 8
  %205 = getelementptr inbounds i32* %204, i64 %203
  %206 = load i32* %205, align 4
  %207 = add nsw i32 %200, %206
  %208 = mul nsw i32 %61, %207
  %209 = ashr i32 %208, 16
  %210 = icmp ne i32 %103, 0
  br i1 %210, label %211, label %219

; <label>:211                                     ; preds = %184
  %212 = icmp eq i32 %189, %pic_pix_x
  br i1 %212, label %213, label %219

; <label>:213                                     ; preds = %211
  %214 = icmp eq i32 %194, %pic_pix_y
  br i1 %214, label %215, label %219

; <label>:215                                     ; preds = %213
  %216 = mul nsw i32 %61, 16
  %217 = ashr i32 %216, 16
  %218 = sub nsw i32 %209, %217
  br label %219

; <label>:219                                     ; preds = %215, %213, %211, %184
  %mcost.0 = phi i32 [ %218, %215 ], [ %209, %213 ], [ %209, %211 ], [ %209, %184 ]
  %220 = icmp sge i32 %mcost.0, %.0
  br i1 %220, label %221, label %222

; <label>:221                                     ; preds = %219
  br label %294

; <label>:222                                     ; preds = %219
  br label %223

; <label>:223                                     ; preds = %288, %222
  %y.0 = phi i32 [ 0, %222 ], [ %289, %288 ]
  %mcost.1 = phi i32 [ %mcost.0, %222 ], [ %mcost.2, %288 ]
  %224 = icmp slt i32 %y.0, %67
  br i1 %224, label %225, label %290

; <label>:225                                     ; preds = %223
  %226 = add nsw i32 %194, %y.0
  %227 = call i16* %get_ref_line.0(i32 %73, i16* %ref_pic.0, i32 %226, i32 %189, i32 %53, i32 %44)
  %228 = sext i32 %y.0 to i64
  %229 = getelementptr inbounds i16** %orig_pic, i64 %228
  %230 = load i16** %229, align 8
  br label %231

; <label>:231                                     ; preds = %282, %225
  %x4.0 = phi i32 [ 0, %225 ], [ %283, %282 ]
  %mcost.2 = phi i32 [ %mcost.1, %225 ], [ %281, %282 ]
  %orig_line.0 = phi i16* [ %230, %225 ], [ %270, %282 ]
  %ref_line.0 = phi i16* [ %227, %225 ], [ %273, %282 ]
  %232 = icmp slt i32 %x4.0, %74
  br i1 %232, label %233, label %284

; <label>:233                                     ; preds = %231
  %234 = getelementptr inbounds i16* %orig_line.0, i32 1
  %235 = load i16* %orig_line.0, align 2
  %236 = zext i16 %235 to i32
  %237 = getelementptr inbounds i16* %ref_line.0, i32 1
  %238 = load i16* %ref_line.0, align 2
  %239 = zext i16 %238 to i32
  %240 = sub nsw i32 %236, %239
  %241 = sext i32 %240 to i64
  %242 = load i32** @byte_abs, align 8
  %243 = getelementptr inbounds i32* %242, i64 %241
  %244 = load i32* %243, align 4
  %245 = add nsw i32 %mcost.2, %244
  %246 = getelementptr inbounds i16* %234, i32 1
  %247 = load i16* %234, align 2
  %248 = zext i16 %247 to i32
  %249 = getelementptr inbounds i16* %237, i32 1
  %250 = load i16* %237, align 2
  %251 = zext i16 %250 to i32
  %252 = sub nsw i32 %248, %251
  %253 = sext i32 %252 to i64
  %254 = load i32** @byte_abs, align 8
  %255 = getelementptr inbounds i32* %254, i64 %253
  %256 = load i32* %255, align 4
  %257 = add nsw i32 %245, %256
  %258 = getelementptr inbounds i16* %246, i32 1
  %259 = load i16* %246, align 2
  %260 = zext i16 %259 to i32
  %261 = getelementptr inbounds i16* %249, i32 1
  %262 = load i16* %249, align 2
  %263 = zext i16 %262 to i32
  %264 = sub nsw i32 %260, %263
  %265 = sext i32 %264 to i64
  %266 = load i32** @byte_abs, align 8
  %267 = getelementptr inbounds i32* %266, i64 %265
  %268 = load i32* %267, align 4
  %269 = add nsw i32 %257, %268
  %270 = getelementptr inbounds i16* %258, i32 1
  %271 = load i16* %258, align 2
  %272 = zext i16 %271 to i32
  %273 = getelementptr inbounds i16* %261, i32 1
  %274 = load i16* %261, align 2
  %275 = zext i16 %274 to i32
  %276 = sub nsw i32 %272, %275
  %277 = sext i32 %276 to i64
  %278 = load i32** @byte_abs, align 8
  %279 = getelementptr inbounds i32* %278, i64 %277
  %280 = load i32* %279, align 4
  %281 = add nsw i32 %269, %280
  br label %282

; <label>:282                                     ; preds = %233
  %283 = add nsw i32 %x4.0, 1
  br label %231

; <label>:284                                     ; preds = %231
  %285 = icmp sge i32 %mcost.2, %.0
  br i1 %285, label %286, label %287

; <label>:286                                     ; preds = %284
  br label %290

; <label>:287                                     ; preds = %284
  br label %288

; <label>:288                                     ; preds = %287
  %289 = add nsw i32 %y.0, 1
  br label %223

; <label>:290                                     ; preds = %286, %223
  %mcost.3 = phi i32 [ %mcost.2, %286 ], [ %mcost.1, %223 ]
  %291 = icmp slt i32 %mcost.3, %.0
  br i1 %291, label %292, label %293

; <label>:292                                     ; preds = %290
  br label %293

; <label>:293                                     ; preds = %292, %290
  %.1 = phi i32 [ %mcost.3, %292 ], [ %.0, %290 ]
  %best_pos.1 = phi i32 [ %pos.0, %292 ], [ %best_pos.0, %290 ]
  br label %294

; <label>:294                                     ; preds = %293, %221
  %.2 = phi i32 [ %.0, %221 ], [ %.1, %293 ]
  %best_pos.2 = phi i32 [ %best_pos.0, %221 ], [ %best_pos.1, %293 ]
  %295 = add nsw i32 %pos.0, 1
  br label %182

; <label>:296                                     ; preds = %182
  %297 = icmp ne i32 %best_pos.0, 0
  br i1 %297, label %298, label %315

; <label>:298                                     ; preds = %296
  %299 = sext i32 %best_pos.0 to i64
  %300 = load i32** @spiral_search_x, align 8
  %301 = getelementptr inbounds i32* %300, i64 %299
  %302 = load i32* %301, align 4
  %303 = load i16* %mv_x, align 2
  %304 = sext i16 %303 to i32
  %305 = add nsw i32 %304, %302
  %306 = trunc i32 %305 to i16
  store i16 %306, i16* %mv_x, align 2
  %307 = sext i32 %best_pos.0 to i64
  %308 = load i32** @spiral_search_y, align 8
  %309 = getelementptr inbounds i32* %308, i64 %307
  %310 = load i32* %309, align 4
  %311 = load i16* %mv_y, align 2
  %312 = sext i16 %311 to i32
  %313 = add nsw i32 %312, %310
  %314 = trunc i32 %313 to i16
  store i16 %314, i16* %mv_y, align 2
  br label %315

; <label>:315                                     ; preds = %298, %296
  ret i32 %.0
}

declare i16* @FastLineX(i32, i16*, i32, i32, i32, i32) #2

declare i16* @UMVLineX(i32, i16*, i32, i32, i32, i32) #2

; Function Attrs: nounwind uwtable
define i32 @FastFullPelBlockMotionSearch(i16** %orig_pic, i16 signext %ref, i32 %list, i32 %pic_pix_x, i32 %pic_pix_y, i32 %blocktype, i16 signext %pred_mv_x, i16 signext %pred_mv_y, i16* %mv_x, i16* %mv_y, i32 %search_range, i32 %min_mcost, double %lambda) #0 {
  %1 = mul nsw i32 2, %search_range
  %2 = add nsw i32 %1, 1
  %3 = mul nsw i32 2, %search_range
  %4 = add nsw i32 %3, 1
  %5 = mul nsw i32 %2, %4
  %6 = fmul double 6.553600e+04, %lambda
  %7 = fadd double %6, 5.000000e-01
  %8 = fptosi double %7 to i32
  %9 = load %struct.ImageParameters** @img, align 8
  %10 = getelementptr inbounds %struct.ImageParameters* %9, i32 0, i32 38
  %11 = load i32* %10, align 4
  %12 = sub nsw i32 %pic_pix_y, %11
  %13 = load %struct.ImageParameters** @img, align 8
  %14 = getelementptr inbounds %struct.ImageParameters* %13, i32 0, i32 37
  %15 = load i32* %14, align 4
  %16 = sub nsw i32 %pic_pix_x, %15
  %17 = ashr i32 %16, 2
  %18 = add nsw i32 %12, %17
  %19 = sext i32 %18 to i64
  %20 = sext i32 %blocktype to i64
  %21 = sext i16 %ref to i64
  %22 = sext i32 %list to i64
  %23 = load i32****** @BlockSAD, align 8
  %24 = getelementptr inbounds i32***** %23, i64 %22
  %25 = load i32***** %24, align 8
  %26 = getelementptr inbounds i32**** %25, i64 %21
  %27 = load i32**** %26, align 8
  %28 = getelementptr inbounds i32*** %27, i64 %20
  %29 = load i32*** %28, align 8
  %30 = getelementptr inbounds i32** %29, i64 %19
  %31 = load i32** %30, align 8
  %32 = sext i16 %ref to i64
  %33 = sext i32 %list to i64
  %34 = load i32*** @search_setup_done, align 8
  %35 = getelementptr inbounds i32** %34, i64 %33
  %36 = load i32** %35, align 8
  %37 = getelementptr inbounds i32* %36, i64 %32
  %38 = load i32* %37, align 4
  %39 = icmp ne i32 %38, 0
  br i1 %39, label %41, label %40

; <label>:40                                      ; preds = %0
  call void @SetupFastFullPelSearch(i16 signext %ref, i32 %list)
  br label %41

; <label>:41                                      ; preds = %40, %0
  %42 = sext i16 %ref to i64
  %43 = sext i32 %list to i64
  %44 = load i32*** @search_center_x, align 8
  %45 = getelementptr inbounds i32** %44, i64 %43
  %46 = load i32** %45, align 8
  %47 = getelementptr inbounds i32* %46, i64 %42
  %48 = load i32* %47, align 4
  %49 = load %struct.ImageParameters** @img, align 8
  %50 = getelementptr inbounds %struct.ImageParameters* %49, i32 0, i32 37
  %51 = load i32* %50, align 4
  %52 = sub nsw i32 %48, %51
  %53 = sext i16 %ref to i64
  %54 = sext i32 %list to i64
  %55 = load i32*** @search_center_y, align 8
  %56 = getelementptr inbounds i32** %55, i64 %54
  %57 = load i32** %56, align 8
  %58 = getelementptr inbounds i32* %57, i64 %53
  %59 = load i32* %58, align 4
  %60 = load %struct.ImageParameters** @img, align 8
  %61 = getelementptr inbounds %struct.ImageParameters* %60, i32 0, i32 38
  %62 = load i32* %61, align 4
  %63 = sub nsw i32 %59, %62
  %64 = load %struct.InputParameters** @input, align 8
  %65 = getelementptr inbounds %struct.InputParameters* %64, i32 0, i32 85
  %66 = load i32* %65, align 4
  %67 = icmp ne i32 %66, 0
  br i1 %67, label %105, label %68

; <label>:68                                      ; preds = %41
  %69 = sext i16 %ref to i64
  %70 = sext i32 %list to i64
  %71 = load i32*** @pos_00, align 8
  %72 = getelementptr inbounds i32** %71, i64 %70
  %73 = load i32** %72, align 8
  %74 = getelementptr inbounds i32* %73, i64 %69
  %75 = load i32* %74, align 4
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds i32* %31, i64 %76
  %78 = load i32* %77, align 4
  %79 = sext i16 %pred_mv_x to i32
  %80 = sub nsw i32 0, %79
  %81 = sext i32 %80 to i64
  %82 = load i32** @mvbits, align 8
  %83 = getelementptr inbounds i32* %82, i64 %81
  %84 = load i32* %83, align 4
  %85 = sext i16 %pred_mv_y to i32
  %86 = sub nsw i32 0, %85
  %87 = sext i32 %86 to i64
  %88 = load i32** @mvbits, align 8
  %89 = getelementptr inbounds i32* %88, i64 %87
  %90 = load i32* %89, align 4
  %91 = add nsw i32 %84, %90
  %92 = mul nsw i32 %8, %91
  %93 = ashr i32 %92, 16
  %94 = add nsw i32 %78, %93
  %95 = icmp slt i32 %94, %min_mcost
  br i1 %95, label %96, label %104

; <label>:96                                      ; preds = %68
  %97 = sext i16 %ref to i64
  %98 = sext i32 %list to i64
  %99 = load i32*** @pos_00, align 8
  %100 = getelementptr inbounds i32** %99, i64 %98
  %101 = load i32** %100, align 8
  %102 = getelementptr inbounds i32* %101, i64 %97
  %103 = load i32* %102, align 4
  br label %104

; <label>:104                                     ; preds = %96, %68
  %.0 = phi i32 [ %94, %96 ], [ %min_mcost, %68 ]
  %best_pos.0 = phi i32 [ %103, %96 ], [ 0, %68 ]
  br label %105

; <label>:105                                     ; preds = %104, %41
  %.1 = phi i32 [ %min_mcost, %41 ], [ %.0, %104 ]
  %best_pos.1 = phi i32 [ 0, %41 ], [ %best_pos.0, %104 ]
  br label %106

; <label>:106                                     ; preds = %145, %105
  %.2 = phi i32 [ %.1, %105 ], [ %.4, %145 ]
  %pos.0 = phi i32 [ 0, %105 ], [ %146, %145 ]
  %best_pos.2 = phi i32 [ %best_pos.1, %105 ], [ %best_pos.4, %145 ]
  %block_sad.0 = phi i32* [ %31, %105 ], [ %147, %145 ]
  %107 = icmp slt i32 %pos.0, %5
  br i1 %107, label %108, label %148

; <label>:108                                     ; preds = %106
  %109 = load i32* %block_sad.0, align 4
  %110 = icmp slt i32 %109, %.2
  br i1 %110, label %111, label %144

; <label>:111                                     ; preds = %108
  %112 = sext i32 %pos.0 to i64
  %113 = load i32** @spiral_search_x, align 8
  %114 = getelementptr inbounds i32* %113, i64 %112
  %115 = load i32* %114, align 4
  %116 = add nsw i32 %52, %115
  %117 = sext i32 %pos.0 to i64
  %118 = load i32** @spiral_search_y, align 8
  %119 = getelementptr inbounds i32* %118, i64 %117
  %120 = load i32* %119, align 4
  %121 = add nsw i32 %63, %120
  %122 = load i32* %block_sad.0, align 4
  %123 = shl i32 %116, 2
  %124 = sext i16 %pred_mv_x to i32
  %125 = sub nsw i32 %123, %124
  %126 = sext i32 %125 to i64
  %127 = load i32** @mvbits, align 8
  %128 = getelementptr inbounds i32* %127, i64 %126
  %129 = load i32* %128, align 4
  %130 = shl i32 %121, 2
  %131 = sext i16 %pred_mv_y to i32
  %132 = sub nsw i32 %130, %131
  %133 = sext i32 %132 to i64
  %134 = load i32** @mvbits, align 8
  %135 = getelementptr inbounds i32* %134, i64 %133
  %136 = load i32* %135, align 4
  %137 = add nsw i32 %129, %136
  %138 = mul nsw i32 %8, %137
  %139 = ashr i32 %138, 16
  %140 = add nsw i32 %122, %139
  %141 = icmp slt i32 %140, %.2
  br i1 %141, label %142, label %143

; <label>:142                                     ; preds = %111
  br label %143

; <label>:143                                     ; preds = %142, %111
  %.3 = phi i32 [ %140, %142 ], [ %.2, %111 ]
  %best_pos.3 = phi i32 [ %pos.0, %142 ], [ %best_pos.2, %111 ]
  br label %144

; <label>:144                                     ; preds = %143, %108
  %.4 = phi i32 [ %.3, %143 ], [ %.2, %108 ]
  %best_pos.4 = phi i32 [ %best_pos.3, %143 ], [ %best_pos.2, %108 ]
  br label %145

; <label>:145                                     ; preds = %144
  %146 = add nsw i32 %pos.0, 1
  %147 = getelementptr inbounds i32* %block_sad.0, i32 1
  br label %106

; <label>:148                                     ; preds = %106
  %149 = sext i32 %best_pos.2 to i64
  %150 = load i32** @spiral_search_x, align 8
  %151 = getelementptr inbounds i32* %150, i64 %149
  %152 = load i32* %151, align 4
  %153 = add nsw i32 %52, %152
  %154 = trunc i32 %153 to i16
  store i16 %154, i16* %mv_x, align 2
  %155 = sext i32 %best_pos.2 to i64
  %156 = load i32** @spiral_search_y, align 8
  %157 = getelementptr inbounds i32* %156, i64 %155
  %158 = load i32* %157, align 4
  %159 = add nsw i32 %63, %158
  %160 = trunc i32 %159 to i16
  store i16 %160, i16* %mv_y, align 2
  ret i32 %.2
}

; Function Attrs: nounwind uwtable
define i32 @SATD(i32* %diff, i32 %use_hadamard) #0 {
  %m = alloca [16 x i32], align 16
  %d = alloca [16 x i32], align 16
  %1 = icmp ne i32 %use_hadamard, 0
  br i1 %1, label %2, label %407

; <label>:2                                       ; preds = %0
  %3 = getelementptr inbounds i32* %diff, i64 0
  %4 = load i32* %3, align 4
  %5 = getelementptr inbounds i32* %diff, i64 12
  %6 = load i32* %5, align 4
  %7 = add nsw i32 %4, %6
  %8 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 0
  store i32 %7, i32* %8, align 4
  %9 = getelementptr inbounds i32* %diff, i64 4
  %10 = load i32* %9, align 4
  %11 = getelementptr inbounds i32* %diff, i64 8
  %12 = load i32* %11, align 4
  %13 = add nsw i32 %10, %12
  %14 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 4
  store i32 %13, i32* %14, align 4
  %15 = getelementptr inbounds i32* %diff, i64 4
  %16 = load i32* %15, align 4
  %17 = getelementptr inbounds i32* %diff, i64 8
  %18 = load i32* %17, align 4
  %19 = sub nsw i32 %16, %18
  %20 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 8
  store i32 %19, i32* %20, align 4
  %21 = getelementptr inbounds i32* %diff, i64 0
  %22 = load i32* %21, align 4
  %23 = getelementptr inbounds i32* %diff, i64 12
  %24 = load i32* %23, align 4
  %25 = sub nsw i32 %22, %24
  %26 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 12
  store i32 %25, i32* %26, align 4
  %27 = getelementptr inbounds i32* %diff, i64 1
  %28 = load i32* %27, align 4
  %29 = getelementptr inbounds i32* %diff, i64 13
  %30 = load i32* %29, align 4
  %31 = add nsw i32 %28, %30
  %32 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 1
  store i32 %31, i32* %32, align 4
  %33 = getelementptr inbounds i32* %diff, i64 5
  %34 = load i32* %33, align 4
  %35 = getelementptr inbounds i32* %diff, i64 9
  %36 = load i32* %35, align 4
  %37 = add nsw i32 %34, %36
  %38 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 5
  store i32 %37, i32* %38, align 4
  %39 = getelementptr inbounds i32* %diff, i64 5
  %40 = load i32* %39, align 4
  %41 = getelementptr inbounds i32* %diff, i64 9
  %42 = load i32* %41, align 4
  %43 = sub nsw i32 %40, %42
  %44 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 9
  store i32 %43, i32* %44, align 4
  %45 = getelementptr inbounds i32* %diff, i64 1
  %46 = load i32* %45, align 4
  %47 = getelementptr inbounds i32* %diff, i64 13
  %48 = load i32* %47, align 4
  %49 = sub nsw i32 %46, %48
  %50 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 13
  store i32 %49, i32* %50, align 4
  %51 = getelementptr inbounds i32* %diff, i64 2
  %52 = load i32* %51, align 4
  %53 = getelementptr inbounds i32* %diff, i64 14
  %54 = load i32* %53, align 4
  %55 = add nsw i32 %52, %54
  %56 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 2
  store i32 %55, i32* %56, align 4
  %57 = getelementptr inbounds i32* %diff, i64 6
  %58 = load i32* %57, align 4
  %59 = getelementptr inbounds i32* %diff, i64 10
  %60 = load i32* %59, align 4
  %61 = add nsw i32 %58, %60
  %62 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 6
  store i32 %61, i32* %62, align 4
  %63 = getelementptr inbounds i32* %diff, i64 6
  %64 = load i32* %63, align 4
  %65 = getelementptr inbounds i32* %diff, i64 10
  %66 = load i32* %65, align 4
  %67 = sub nsw i32 %64, %66
  %68 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 10
  store i32 %67, i32* %68, align 4
  %69 = getelementptr inbounds i32* %diff, i64 2
  %70 = load i32* %69, align 4
  %71 = getelementptr inbounds i32* %diff, i64 14
  %72 = load i32* %71, align 4
  %73 = sub nsw i32 %70, %72
  %74 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 14
  store i32 %73, i32* %74, align 4
  %75 = getelementptr inbounds i32* %diff, i64 3
  %76 = load i32* %75, align 4
  %77 = getelementptr inbounds i32* %diff, i64 15
  %78 = load i32* %77, align 4
  %79 = add nsw i32 %76, %78
  %80 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 3
  store i32 %79, i32* %80, align 4
  %81 = getelementptr inbounds i32* %diff, i64 7
  %82 = load i32* %81, align 4
  %83 = getelementptr inbounds i32* %diff, i64 11
  %84 = load i32* %83, align 4
  %85 = add nsw i32 %82, %84
  %86 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 7
  store i32 %85, i32* %86, align 4
  %87 = getelementptr inbounds i32* %diff, i64 7
  %88 = load i32* %87, align 4
  %89 = getelementptr inbounds i32* %diff, i64 11
  %90 = load i32* %89, align 4
  %91 = sub nsw i32 %88, %90
  %92 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 11
  store i32 %91, i32* %92, align 4
  %93 = getelementptr inbounds i32* %diff, i64 3
  %94 = load i32* %93, align 4
  %95 = getelementptr inbounds i32* %diff, i64 15
  %96 = load i32* %95, align 4
  %97 = sub nsw i32 %94, %96
  %98 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 15
  store i32 %97, i32* %98, align 4
  %99 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 0
  %100 = load i32* %99, align 4
  %101 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 4
  %102 = load i32* %101, align 4
  %103 = add nsw i32 %100, %102
  %104 = getelementptr inbounds [16 x i32]* %d, i32 0, i64 0
  store i32 %103, i32* %104, align 4
  %105 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 0
  %106 = load i32* %105, align 4
  %107 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 4
  %108 = load i32* %107, align 4
  %109 = sub nsw i32 %106, %108
  %110 = getelementptr inbounds [16 x i32]* %d, i32 0, i64 8
  store i32 %109, i32* %110, align 4
  %111 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 8
  %112 = load i32* %111, align 4
  %113 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 12
  %114 = load i32* %113, align 4
  %115 = add nsw i32 %112, %114
  %116 = getelementptr inbounds [16 x i32]* %d, i32 0, i64 4
  store i32 %115, i32* %116, align 4
  %117 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 12
  %118 = load i32* %117, align 4
  %119 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 8
  %120 = load i32* %119, align 4
  %121 = sub nsw i32 %118, %120
  %122 = getelementptr inbounds [16 x i32]* %d, i32 0, i64 12
  store i32 %121, i32* %122, align 4
  %123 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 1
  %124 = load i32* %123, align 4
  %125 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 5
  %126 = load i32* %125, align 4
  %127 = add nsw i32 %124, %126
  %128 = getelementptr inbounds [16 x i32]* %d, i32 0, i64 1
  store i32 %127, i32* %128, align 4
  %129 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 1
  %130 = load i32* %129, align 4
  %131 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 5
  %132 = load i32* %131, align 4
  %133 = sub nsw i32 %130, %132
  %134 = getelementptr inbounds [16 x i32]* %d, i32 0, i64 9
  store i32 %133, i32* %134, align 4
  %135 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 9
  %136 = load i32* %135, align 4
  %137 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 13
  %138 = load i32* %137, align 4
  %139 = add nsw i32 %136, %138
  %140 = getelementptr inbounds [16 x i32]* %d, i32 0, i64 5
  store i32 %139, i32* %140, align 4
  %141 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 13
  %142 = load i32* %141, align 4
  %143 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 9
  %144 = load i32* %143, align 4
  %145 = sub nsw i32 %142, %144
  %146 = getelementptr inbounds [16 x i32]* %d, i32 0, i64 13
  store i32 %145, i32* %146, align 4
  %147 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 2
  %148 = load i32* %147, align 4
  %149 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 6
  %150 = load i32* %149, align 4
  %151 = add nsw i32 %148, %150
  %152 = getelementptr inbounds [16 x i32]* %d, i32 0, i64 2
  store i32 %151, i32* %152, align 4
  %153 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 2
  %154 = load i32* %153, align 4
  %155 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 6
  %156 = load i32* %155, align 4
  %157 = sub nsw i32 %154, %156
  %158 = getelementptr inbounds [16 x i32]* %d, i32 0, i64 10
  store i32 %157, i32* %158, align 4
  %159 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 10
  %160 = load i32* %159, align 4
  %161 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 14
  %162 = load i32* %161, align 4
  %163 = add nsw i32 %160, %162
  %164 = getelementptr inbounds [16 x i32]* %d, i32 0, i64 6
  store i32 %163, i32* %164, align 4
  %165 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 14
  %166 = load i32* %165, align 4
  %167 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 10
  %168 = load i32* %167, align 4
  %169 = sub nsw i32 %166, %168
  %170 = getelementptr inbounds [16 x i32]* %d, i32 0, i64 14
  store i32 %169, i32* %170, align 4
  %171 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 3
  %172 = load i32* %171, align 4
  %173 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 7
  %174 = load i32* %173, align 4
  %175 = add nsw i32 %172, %174
  %176 = getelementptr inbounds [16 x i32]* %d, i32 0, i64 3
  store i32 %175, i32* %176, align 4
  %177 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 3
  %178 = load i32* %177, align 4
  %179 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 7
  %180 = load i32* %179, align 4
  %181 = sub nsw i32 %178, %180
  %182 = getelementptr inbounds [16 x i32]* %d, i32 0, i64 11
  store i32 %181, i32* %182, align 4
  %183 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 11
  %184 = load i32* %183, align 4
  %185 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 15
  %186 = load i32* %185, align 4
  %187 = add nsw i32 %184, %186
  %188 = getelementptr inbounds [16 x i32]* %d, i32 0, i64 7
  store i32 %187, i32* %188, align 4
  %189 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 15
  %190 = load i32* %189, align 4
  %191 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 11
  %192 = load i32* %191, align 4
  %193 = sub nsw i32 %190, %192
  %194 = getelementptr inbounds [16 x i32]* %d, i32 0, i64 15
  store i32 %193, i32* %194, align 4
  %195 = getelementptr inbounds [16 x i32]* %d, i32 0, i64 0
  %196 = load i32* %195, align 4
  %197 = getelementptr inbounds [16 x i32]* %d, i32 0, i64 3
  %198 = load i32* %197, align 4
  %199 = add nsw i32 %196, %198
  %200 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 0
  store i32 %199, i32* %200, align 4
  %201 = getelementptr inbounds [16 x i32]* %d, i32 0, i64 1
  %202 = load i32* %201, align 4
  %203 = getelementptr inbounds [16 x i32]* %d, i32 0, i64 2
  %204 = load i32* %203, align 4
  %205 = add nsw i32 %202, %204
  %206 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 1
  store i32 %205, i32* %206, align 4
  %207 = getelementptr inbounds [16 x i32]* %d, i32 0, i64 1
  %208 = load i32* %207, align 4
  %209 = getelementptr inbounds [16 x i32]* %d, i32 0, i64 2
  %210 = load i32* %209, align 4
  %211 = sub nsw i32 %208, %210
  %212 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 2
  store i32 %211, i32* %212, align 4
  %213 = getelementptr inbounds [16 x i32]* %d, i32 0, i64 0
  %214 = load i32* %213, align 4
  %215 = getelementptr inbounds [16 x i32]* %d, i32 0, i64 3
  %216 = load i32* %215, align 4
  %217 = sub nsw i32 %214, %216
  %218 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 3
  store i32 %217, i32* %218, align 4
  %219 = getelementptr inbounds [16 x i32]* %d, i32 0, i64 4
  %220 = load i32* %219, align 4
  %221 = getelementptr inbounds [16 x i32]* %d, i32 0, i64 7
  %222 = load i32* %221, align 4
  %223 = add nsw i32 %220, %222
  %224 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 4
  store i32 %223, i32* %224, align 4
  %225 = getelementptr inbounds [16 x i32]* %d, i32 0, i64 5
  %226 = load i32* %225, align 4
  %227 = getelementptr inbounds [16 x i32]* %d, i32 0, i64 6
  %228 = load i32* %227, align 4
  %229 = add nsw i32 %226, %228
  %230 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 5
  store i32 %229, i32* %230, align 4
  %231 = getelementptr inbounds [16 x i32]* %d, i32 0, i64 5
  %232 = load i32* %231, align 4
  %233 = getelementptr inbounds [16 x i32]* %d, i32 0, i64 6
  %234 = load i32* %233, align 4
  %235 = sub nsw i32 %232, %234
  %236 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 6
  store i32 %235, i32* %236, align 4
  %237 = getelementptr inbounds [16 x i32]* %d, i32 0, i64 4
  %238 = load i32* %237, align 4
  %239 = getelementptr inbounds [16 x i32]* %d, i32 0, i64 7
  %240 = load i32* %239, align 4
  %241 = sub nsw i32 %238, %240
  %242 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 7
  store i32 %241, i32* %242, align 4
  %243 = getelementptr inbounds [16 x i32]* %d, i32 0, i64 8
  %244 = load i32* %243, align 4
  %245 = getelementptr inbounds [16 x i32]* %d, i32 0, i64 11
  %246 = load i32* %245, align 4
  %247 = add nsw i32 %244, %246
  %248 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 8
  store i32 %247, i32* %248, align 4
  %249 = getelementptr inbounds [16 x i32]* %d, i32 0, i64 9
  %250 = load i32* %249, align 4
  %251 = getelementptr inbounds [16 x i32]* %d, i32 0, i64 10
  %252 = load i32* %251, align 4
  %253 = add nsw i32 %250, %252
  %254 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 9
  store i32 %253, i32* %254, align 4
  %255 = getelementptr inbounds [16 x i32]* %d, i32 0, i64 9
  %256 = load i32* %255, align 4
  %257 = getelementptr inbounds [16 x i32]* %d, i32 0, i64 10
  %258 = load i32* %257, align 4
  %259 = sub nsw i32 %256, %258
  %260 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 10
  store i32 %259, i32* %260, align 4
  %261 = getelementptr inbounds [16 x i32]* %d, i32 0, i64 8
  %262 = load i32* %261, align 4
  %263 = getelementptr inbounds [16 x i32]* %d, i32 0, i64 11
  %264 = load i32* %263, align 4
  %265 = sub nsw i32 %262, %264
  %266 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 11
  store i32 %265, i32* %266, align 4
  %267 = getelementptr inbounds [16 x i32]* %d, i32 0, i64 12
  %268 = load i32* %267, align 4
  %269 = getelementptr inbounds [16 x i32]* %d, i32 0, i64 15
  %270 = load i32* %269, align 4
  %271 = add nsw i32 %268, %270
  %272 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 12
  store i32 %271, i32* %272, align 4
  %273 = getelementptr inbounds [16 x i32]* %d, i32 0, i64 13
  %274 = load i32* %273, align 4
  %275 = getelementptr inbounds [16 x i32]* %d, i32 0, i64 14
  %276 = load i32* %275, align 4
  %277 = add nsw i32 %274, %276
  %278 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 13
  store i32 %277, i32* %278, align 4
  %279 = getelementptr inbounds [16 x i32]* %d, i32 0, i64 13
  %280 = load i32* %279, align 4
  %281 = getelementptr inbounds [16 x i32]* %d, i32 0, i64 14
  %282 = load i32* %281, align 4
  %283 = sub nsw i32 %280, %282
  %284 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 14
  store i32 %283, i32* %284, align 4
  %285 = getelementptr inbounds [16 x i32]* %d, i32 0, i64 12
  %286 = load i32* %285, align 4
  %287 = getelementptr inbounds [16 x i32]* %d, i32 0, i64 15
  %288 = load i32* %287, align 4
  %289 = sub nsw i32 %286, %288
  %290 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 15
  store i32 %289, i32* %290, align 4
  %291 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 0
  %292 = load i32* %291, align 4
  %293 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 1
  %294 = load i32* %293, align 4
  %295 = add nsw i32 %292, %294
  %296 = getelementptr inbounds [16 x i32]* %d, i32 0, i64 0
  store i32 %295, i32* %296, align 4
  %297 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 0
  %298 = load i32* %297, align 4
  %299 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 1
  %300 = load i32* %299, align 4
  %301 = sub nsw i32 %298, %300
  %302 = getelementptr inbounds [16 x i32]* %d, i32 0, i64 1
  store i32 %301, i32* %302, align 4
  %303 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 2
  %304 = load i32* %303, align 4
  %305 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 3
  %306 = load i32* %305, align 4
  %307 = add nsw i32 %304, %306
  %308 = getelementptr inbounds [16 x i32]* %d, i32 0, i64 2
  store i32 %307, i32* %308, align 4
  %309 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 3
  %310 = load i32* %309, align 4
  %311 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 2
  %312 = load i32* %311, align 4
  %313 = sub nsw i32 %310, %312
  %314 = getelementptr inbounds [16 x i32]* %d, i32 0, i64 3
  store i32 %313, i32* %314, align 4
  %315 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 4
  %316 = load i32* %315, align 4
  %317 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 5
  %318 = load i32* %317, align 4
  %319 = add nsw i32 %316, %318
  %320 = getelementptr inbounds [16 x i32]* %d, i32 0, i64 4
  store i32 %319, i32* %320, align 4
  %321 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 4
  %322 = load i32* %321, align 4
  %323 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 5
  %324 = load i32* %323, align 4
  %325 = sub nsw i32 %322, %324
  %326 = getelementptr inbounds [16 x i32]* %d, i32 0, i64 5
  store i32 %325, i32* %326, align 4
  %327 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 6
  %328 = load i32* %327, align 4
  %329 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 7
  %330 = load i32* %329, align 4
  %331 = add nsw i32 %328, %330
  %332 = getelementptr inbounds [16 x i32]* %d, i32 0, i64 6
  store i32 %331, i32* %332, align 4
  %333 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 7
  %334 = load i32* %333, align 4
  %335 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 6
  %336 = load i32* %335, align 4
  %337 = sub nsw i32 %334, %336
  %338 = getelementptr inbounds [16 x i32]* %d, i32 0, i64 7
  store i32 %337, i32* %338, align 4
  %339 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 8
  %340 = load i32* %339, align 4
  %341 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 9
  %342 = load i32* %341, align 4
  %343 = add nsw i32 %340, %342
  %344 = getelementptr inbounds [16 x i32]* %d, i32 0, i64 8
  store i32 %343, i32* %344, align 4
  %345 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 8
  %346 = load i32* %345, align 4
  %347 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 9
  %348 = load i32* %347, align 4
  %349 = sub nsw i32 %346, %348
  %350 = getelementptr inbounds [16 x i32]* %d, i32 0, i64 9
  store i32 %349, i32* %350, align 4
  %351 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 10
  %352 = load i32* %351, align 4
  %353 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 11
  %354 = load i32* %353, align 4
  %355 = add nsw i32 %352, %354
  %356 = getelementptr inbounds [16 x i32]* %d, i32 0, i64 10
  store i32 %355, i32* %356, align 4
  %357 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 11
  %358 = load i32* %357, align 4
  %359 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 10
  %360 = load i32* %359, align 4
  %361 = sub nsw i32 %358, %360
  %362 = getelementptr inbounds [16 x i32]* %d, i32 0, i64 11
  store i32 %361, i32* %362, align 4
  %363 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 12
  %364 = load i32* %363, align 4
  %365 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 13
  %366 = load i32* %365, align 4
  %367 = add nsw i32 %364, %366
  %368 = getelementptr inbounds [16 x i32]* %d, i32 0, i64 12
  store i32 %367, i32* %368, align 4
  %369 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 12
  %370 = load i32* %369, align 4
  %371 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 13
  %372 = load i32* %371, align 4
  %373 = sub nsw i32 %370, %372
  %374 = getelementptr inbounds [16 x i32]* %d, i32 0, i64 13
  store i32 %373, i32* %374, align 4
  %375 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 14
  %376 = load i32* %375, align 4
  %377 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 15
  %378 = load i32* %377, align 4
  %379 = add nsw i32 %376, %378
  %380 = getelementptr inbounds [16 x i32]* %d, i32 0, i64 14
  store i32 %379, i32* %380, align 4
  %381 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 15
  %382 = load i32* %381, align 4
  %383 = getelementptr inbounds [16 x i32]* %m, i32 0, i64 14
  %384 = load i32* %383, align 4
  %385 = sub nsw i32 %382, %384
  %386 = getelementptr inbounds [16 x i32]* %d, i32 0, i64 15
  store i32 %385, i32* %386, align 4
  %387 = getelementptr inbounds [16 x i32]* %d, i32 0, i64 0
  %388 = load i32* %387, align 4
  br label %389

; <label>:389                                     ; preds = %399, %2
  %k.0 = phi i32 [ 0, %2 ], [ %400, %399 ]
  %satd.0 = phi i32 [ 0, %2 ], [ %398, %399 ]
  %dd.0 = phi i32 [ %388, %2 ], [ %403, %399 ]
  %390 = icmp slt i32 %k.0, 16
  br i1 %390, label %391, label %404

; <label>:391                                     ; preds = %389
  %392 = icmp slt i32 %dd.0, 0
  br i1 %392, label %393, label %395

; <label>:393                                     ; preds = %391
  %394 = sub nsw i32 0, %dd.0
  br label %396

; <label>:395                                     ; preds = %391
  br label %396

; <label>:396                                     ; preds = %395, %393
  %397 = phi i32 [ %394, %393 ], [ %dd.0, %395 ]
  %398 = add nsw i32 %satd.0, %397
  br label %399

; <label>:399                                     ; preds = %396
  %400 = add nsw i32 %k.0, 1
  %401 = sext i32 %400 to i64
  %402 = getelementptr inbounds [16 x i32]* %d, i32 0, i64 %401
  %403 = load i32* %402, align 4
  br label %389

; <label>:404                                     ; preds = %389
  %405 = add nsw i32 %satd.0, 1
  %406 = ashr i32 %405, 1
  br label %422

; <label>:407                                     ; preds = %0
  br label %408

; <label>:408                                     ; preds = %419, %407
  %k.1 = phi i32 [ 0, %407 ], [ %420, %419 ]
  %satd.1 = phi i32 [ 0, %407 ], [ %418, %419 ]
  %409 = icmp slt i32 %k.1, 16
  br i1 %409, label %410, label %421

; <label>:410                                     ; preds = %408
  %411 = sext i32 %k.1 to i64
  %412 = getelementptr inbounds i32* %diff, i64 %411
  %413 = load i32* %412, align 4
  %414 = sext i32 %413 to i64
  %415 = load i32** @byte_abs, align 8
  %416 = getelementptr inbounds i32* %415, i64 %414
  %417 = load i32* %416, align 4
  %418 = add nsw i32 %satd.1, %417
  br label %419

; <label>:419                                     ; preds = %410
  %420 = add nsw i32 %k.1, 1
  br label %408

; <label>:421                                     ; preds = %408
  br label %422

; <label>:422                                     ; preds = %421, %404
  %satd.2 = phi i32 [ %406, %404 ], [ %satd.1, %421 ]
  ret i32 %satd.2
}

; Function Attrs: nounwind uwtable
define i32 @SATD8X8(i32* %diff, i32 %use_hadamard) #0 {
  %m1 = alloca [8 x [8 x i32]], align 16
  %m2 = alloca [8 x [8 x i32]], align 16
  %m3 = alloca [8 x [8 x i32]], align 16
  %1 = icmp ne i32 %use_hadamard, 0
  br i1 %1, label %2, label %641

; <label>:2                                       ; preds = %0
  br label %3

; <label>:3                                       ; preds = %308, %2
  %j.0 = phi i32 [ 0, %2 ], [ %309, %308 ]
  %4 = icmp slt i32 %j.0, 8
  br i1 %4, label %5, label %310

; <label>:5                                       ; preds = %3
  %6 = shl i32 %j.0, 3
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds i32* %diff, i64 %7
  %9 = load i32* %8, align 4
  %10 = shl i32 %j.0, 3
  %11 = add nsw i32 %10, 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds i32* %diff, i64 %12
  %14 = load i32* %13, align 4
  %15 = add nsw i32 %9, %14
  %16 = sext i32 %j.0 to i64
  %17 = getelementptr inbounds [8 x [8 x i32]]* %m2, i32 0, i64 %16
  %18 = getelementptr inbounds [8 x i32]* %17, i32 0, i64 0
  store i32 %15, i32* %18, align 4
  %19 = shl i32 %j.0, 3
  %20 = add nsw i32 %19, 1
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds i32* %diff, i64 %21
  %23 = load i32* %22, align 4
  %24 = shl i32 %j.0, 3
  %25 = add nsw i32 %24, 5
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds i32* %diff, i64 %26
  %28 = load i32* %27, align 4
  %29 = add nsw i32 %23, %28
  %30 = sext i32 %j.0 to i64
  %31 = getelementptr inbounds [8 x [8 x i32]]* %m2, i32 0, i64 %30
  %32 = getelementptr inbounds [8 x i32]* %31, i32 0, i64 1
  store i32 %29, i32* %32, align 4
  %33 = shl i32 %j.0, 3
  %34 = add nsw i32 %33, 2
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds i32* %diff, i64 %35
  %37 = load i32* %36, align 4
  %38 = shl i32 %j.0, 3
  %39 = add nsw i32 %38, 6
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds i32* %diff, i64 %40
  %42 = load i32* %41, align 4
  %43 = add nsw i32 %37, %42
  %44 = sext i32 %j.0 to i64
  %45 = getelementptr inbounds [8 x [8 x i32]]* %m2, i32 0, i64 %44
  %46 = getelementptr inbounds [8 x i32]* %45, i32 0, i64 2
  store i32 %43, i32* %46, align 4
  %47 = shl i32 %j.0, 3
  %48 = add nsw i32 %47, 3
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds i32* %diff, i64 %49
  %51 = load i32* %50, align 4
  %52 = shl i32 %j.0, 3
  %53 = add nsw i32 %52, 7
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds i32* %diff, i64 %54
  %56 = load i32* %55, align 4
  %57 = add nsw i32 %51, %56
  %58 = sext i32 %j.0 to i64
  %59 = getelementptr inbounds [8 x [8 x i32]]* %m2, i32 0, i64 %58
  %60 = getelementptr inbounds [8 x i32]* %59, i32 0, i64 3
  store i32 %57, i32* %60, align 4
  %61 = shl i32 %j.0, 3
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds i32* %diff, i64 %62
  %64 = load i32* %63, align 4
  %65 = shl i32 %j.0, 3
  %66 = add nsw i32 %65, 4
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds i32* %diff, i64 %67
  %69 = load i32* %68, align 4
  %70 = sub nsw i32 %64, %69
  %71 = sext i32 %j.0 to i64
  %72 = getelementptr inbounds [8 x [8 x i32]]* %m2, i32 0, i64 %71
  %73 = getelementptr inbounds [8 x i32]* %72, i32 0, i64 4
  store i32 %70, i32* %73, align 4
  %74 = shl i32 %j.0, 3
  %75 = add nsw i32 %74, 1
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds i32* %diff, i64 %76
  %78 = load i32* %77, align 4
  %79 = shl i32 %j.0, 3
  %80 = add nsw i32 %79, 5
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds i32* %diff, i64 %81
  %83 = load i32* %82, align 4
  %84 = sub nsw i32 %78, %83
  %85 = sext i32 %j.0 to i64
  %86 = getelementptr inbounds [8 x [8 x i32]]* %m2, i32 0, i64 %85
  %87 = getelementptr inbounds [8 x i32]* %86, i32 0, i64 5
  store i32 %84, i32* %87, align 4
  %88 = shl i32 %j.0, 3
  %89 = add nsw i32 %88, 2
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds i32* %diff, i64 %90
  %92 = load i32* %91, align 4
  %93 = shl i32 %j.0, 3
  %94 = add nsw i32 %93, 6
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds i32* %diff, i64 %95
  %97 = load i32* %96, align 4
  %98 = sub nsw i32 %92, %97
  %99 = sext i32 %j.0 to i64
  %100 = getelementptr inbounds [8 x [8 x i32]]* %m2, i32 0, i64 %99
  %101 = getelementptr inbounds [8 x i32]* %100, i32 0, i64 6
  store i32 %98, i32* %101, align 4
  %102 = shl i32 %j.0, 3
  %103 = add nsw i32 %102, 3
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds i32* %diff, i64 %104
  %106 = load i32* %105, align 4
  %107 = shl i32 %j.0, 3
  %108 = add nsw i32 %107, 7
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds i32* %diff, i64 %109
  %111 = load i32* %110, align 4
  %112 = sub nsw i32 %106, %111
  %113 = sext i32 %j.0 to i64
  %114 = getelementptr inbounds [8 x [8 x i32]]* %m2, i32 0, i64 %113
  %115 = getelementptr inbounds [8 x i32]* %114, i32 0, i64 7
  store i32 %112, i32* %115, align 4
  %116 = sext i32 %j.0 to i64
  %117 = getelementptr inbounds [8 x [8 x i32]]* %m2, i32 0, i64 %116
  %118 = getelementptr inbounds [8 x i32]* %117, i32 0, i64 0
  %119 = load i32* %118, align 4
  %120 = sext i32 %j.0 to i64
  %121 = getelementptr inbounds [8 x [8 x i32]]* %m2, i32 0, i64 %120
  %122 = getelementptr inbounds [8 x i32]* %121, i32 0, i64 2
  %123 = load i32* %122, align 4
  %124 = add nsw i32 %119, %123
  %125 = sext i32 %j.0 to i64
  %126 = getelementptr inbounds [8 x [8 x i32]]* %m1, i32 0, i64 %125
  %127 = getelementptr inbounds [8 x i32]* %126, i32 0, i64 0
  store i32 %124, i32* %127, align 4
  %128 = sext i32 %j.0 to i64
  %129 = getelementptr inbounds [8 x [8 x i32]]* %m2, i32 0, i64 %128
  %130 = getelementptr inbounds [8 x i32]* %129, i32 0, i64 1
  %131 = load i32* %130, align 4
  %132 = sext i32 %j.0 to i64
  %133 = getelementptr inbounds [8 x [8 x i32]]* %m2, i32 0, i64 %132
  %134 = getelementptr inbounds [8 x i32]* %133, i32 0, i64 3
  %135 = load i32* %134, align 4
  %136 = add nsw i32 %131, %135
  %137 = sext i32 %j.0 to i64
  %138 = getelementptr inbounds [8 x [8 x i32]]* %m1, i32 0, i64 %137
  %139 = getelementptr inbounds [8 x i32]* %138, i32 0, i64 1
  store i32 %136, i32* %139, align 4
  %140 = sext i32 %j.0 to i64
  %141 = getelementptr inbounds [8 x [8 x i32]]* %m2, i32 0, i64 %140
  %142 = getelementptr inbounds [8 x i32]* %141, i32 0, i64 0
  %143 = load i32* %142, align 4
  %144 = sext i32 %j.0 to i64
  %145 = getelementptr inbounds [8 x [8 x i32]]* %m2, i32 0, i64 %144
  %146 = getelementptr inbounds [8 x i32]* %145, i32 0, i64 2
  %147 = load i32* %146, align 4
  %148 = sub nsw i32 %143, %147
  %149 = sext i32 %j.0 to i64
  %150 = getelementptr inbounds [8 x [8 x i32]]* %m1, i32 0, i64 %149
  %151 = getelementptr inbounds [8 x i32]* %150, i32 0, i64 2
  store i32 %148, i32* %151, align 4
  %152 = sext i32 %j.0 to i64
  %153 = getelementptr inbounds [8 x [8 x i32]]* %m2, i32 0, i64 %152
  %154 = getelementptr inbounds [8 x i32]* %153, i32 0, i64 1
  %155 = load i32* %154, align 4
  %156 = sext i32 %j.0 to i64
  %157 = getelementptr inbounds [8 x [8 x i32]]* %m2, i32 0, i64 %156
  %158 = getelementptr inbounds [8 x i32]* %157, i32 0, i64 3
  %159 = load i32* %158, align 4
  %160 = sub nsw i32 %155, %159
  %161 = sext i32 %j.0 to i64
  %162 = getelementptr inbounds [8 x [8 x i32]]* %m1, i32 0, i64 %161
  %163 = getelementptr inbounds [8 x i32]* %162, i32 0, i64 3
  store i32 %160, i32* %163, align 4
  %164 = sext i32 %j.0 to i64
  %165 = getelementptr inbounds [8 x [8 x i32]]* %m2, i32 0, i64 %164
  %166 = getelementptr inbounds [8 x i32]* %165, i32 0, i64 4
  %167 = load i32* %166, align 4
  %168 = sext i32 %j.0 to i64
  %169 = getelementptr inbounds [8 x [8 x i32]]* %m2, i32 0, i64 %168
  %170 = getelementptr inbounds [8 x i32]* %169, i32 0, i64 6
  %171 = load i32* %170, align 4
  %172 = add nsw i32 %167, %171
  %173 = sext i32 %j.0 to i64
  %174 = getelementptr inbounds [8 x [8 x i32]]* %m1, i32 0, i64 %173
  %175 = getelementptr inbounds [8 x i32]* %174, i32 0, i64 4
  store i32 %172, i32* %175, align 4
  %176 = sext i32 %j.0 to i64
  %177 = getelementptr inbounds [8 x [8 x i32]]* %m2, i32 0, i64 %176
  %178 = getelementptr inbounds [8 x i32]* %177, i32 0, i64 5
  %179 = load i32* %178, align 4
  %180 = sext i32 %j.0 to i64
  %181 = getelementptr inbounds [8 x [8 x i32]]* %m2, i32 0, i64 %180
  %182 = getelementptr inbounds [8 x i32]* %181, i32 0, i64 7
  %183 = load i32* %182, align 4
  %184 = add nsw i32 %179, %183
  %185 = sext i32 %j.0 to i64
  %186 = getelementptr inbounds [8 x [8 x i32]]* %m1, i32 0, i64 %185
  %187 = getelementptr inbounds [8 x i32]* %186, i32 0, i64 5
  store i32 %184, i32* %187, align 4
  %188 = sext i32 %j.0 to i64
  %189 = getelementptr inbounds [8 x [8 x i32]]* %m2, i32 0, i64 %188
  %190 = getelementptr inbounds [8 x i32]* %189, i32 0, i64 4
  %191 = load i32* %190, align 4
  %192 = sext i32 %j.0 to i64
  %193 = getelementptr inbounds [8 x [8 x i32]]* %m2, i32 0, i64 %192
  %194 = getelementptr inbounds [8 x i32]* %193, i32 0, i64 6
  %195 = load i32* %194, align 4
  %196 = sub nsw i32 %191, %195
  %197 = sext i32 %j.0 to i64
  %198 = getelementptr inbounds [8 x [8 x i32]]* %m1, i32 0, i64 %197
  %199 = getelementptr inbounds [8 x i32]* %198, i32 0, i64 6
  store i32 %196, i32* %199, align 4
  %200 = sext i32 %j.0 to i64
  %201 = getelementptr inbounds [8 x [8 x i32]]* %m2, i32 0, i64 %200
  %202 = getelementptr inbounds [8 x i32]* %201, i32 0, i64 5
  %203 = load i32* %202, align 4
  %204 = sext i32 %j.0 to i64
  %205 = getelementptr inbounds [8 x [8 x i32]]* %m2, i32 0, i64 %204
  %206 = getelementptr inbounds [8 x i32]* %205, i32 0, i64 7
  %207 = load i32* %206, align 4
  %208 = sub nsw i32 %203, %207
  %209 = sext i32 %j.0 to i64
  %210 = getelementptr inbounds [8 x [8 x i32]]* %m1, i32 0, i64 %209
  %211 = getelementptr inbounds [8 x i32]* %210, i32 0, i64 7
  store i32 %208, i32* %211, align 4
  %212 = sext i32 %j.0 to i64
  %213 = getelementptr inbounds [8 x [8 x i32]]* %m1, i32 0, i64 %212
  %214 = getelementptr inbounds [8 x i32]* %213, i32 0, i64 0
  %215 = load i32* %214, align 4
  %216 = sext i32 %j.0 to i64
  %217 = getelementptr inbounds [8 x [8 x i32]]* %m1, i32 0, i64 %216
  %218 = getelementptr inbounds [8 x i32]* %217, i32 0, i64 1
  %219 = load i32* %218, align 4
  %220 = add nsw i32 %215, %219
  %221 = sext i32 %j.0 to i64
  %222 = getelementptr inbounds [8 x [8 x i32]]* %m2, i32 0, i64 %221
  %223 = getelementptr inbounds [8 x i32]* %222, i32 0, i64 0
  store i32 %220, i32* %223, align 4
  %224 = sext i32 %j.0 to i64
  %225 = getelementptr inbounds [8 x [8 x i32]]* %m1, i32 0, i64 %224
  %226 = getelementptr inbounds [8 x i32]* %225, i32 0, i64 0
  %227 = load i32* %226, align 4
  %228 = sext i32 %j.0 to i64
  %229 = getelementptr inbounds [8 x [8 x i32]]* %m1, i32 0, i64 %228
  %230 = getelementptr inbounds [8 x i32]* %229, i32 0, i64 1
  %231 = load i32* %230, align 4
  %232 = sub nsw i32 %227, %231
  %233 = sext i32 %j.0 to i64
  %234 = getelementptr inbounds [8 x [8 x i32]]* %m2, i32 0, i64 %233
  %235 = getelementptr inbounds [8 x i32]* %234, i32 0, i64 1
  store i32 %232, i32* %235, align 4
  %236 = sext i32 %j.0 to i64
  %237 = getelementptr inbounds [8 x [8 x i32]]* %m1, i32 0, i64 %236
  %238 = getelementptr inbounds [8 x i32]* %237, i32 0, i64 2
  %239 = load i32* %238, align 4
  %240 = sext i32 %j.0 to i64
  %241 = getelementptr inbounds [8 x [8 x i32]]* %m1, i32 0, i64 %240
  %242 = getelementptr inbounds [8 x i32]* %241, i32 0, i64 3
  %243 = load i32* %242, align 4
  %244 = add nsw i32 %239, %243
  %245 = sext i32 %j.0 to i64
  %246 = getelementptr inbounds [8 x [8 x i32]]* %m2, i32 0, i64 %245
  %247 = getelementptr inbounds [8 x i32]* %246, i32 0, i64 2
  store i32 %244, i32* %247, align 4
  %248 = sext i32 %j.0 to i64
  %249 = getelementptr inbounds [8 x [8 x i32]]* %m1, i32 0, i64 %248
  %250 = getelementptr inbounds [8 x i32]* %249, i32 0, i64 2
  %251 = load i32* %250, align 4
  %252 = sext i32 %j.0 to i64
  %253 = getelementptr inbounds [8 x [8 x i32]]* %m1, i32 0, i64 %252
  %254 = getelementptr inbounds [8 x i32]* %253, i32 0, i64 3
  %255 = load i32* %254, align 4
  %256 = sub nsw i32 %251, %255
  %257 = sext i32 %j.0 to i64
  %258 = getelementptr inbounds [8 x [8 x i32]]* %m2, i32 0, i64 %257
  %259 = getelementptr inbounds [8 x i32]* %258, i32 0, i64 3
  store i32 %256, i32* %259, align 4
  %260 = sext i32 %j.0 to i64
  %261 = getelementptr inbounds [8 x [8 x i32]]* %m1, i32 0, i64 %260
  %262 = getelementptr inbounds [8 x i32]* %261, i32 0, i64 4
  %263 = load i32* %262, align 4
  %264 = sext i32 %j.0 to i64
  %265 = getelementptr inbounds [8 x [8 x i32]]* %m1, i32 0, i64 %264
  %266 = getelementptr inbounds [8 x i32]* %265, i32 0, i64 5
  %267 = load i32* %266, align 4
  %268 = add nsw i32 %263, %267
  %269 = sext i32 %j.0 to i64
  %270 = getelementptr inbounds [8 x [8 x i32]]* %m2, i32 0, i64 %269
  %271 = getelementptr inbounds [8 x i32]* %270, i32 0, i64 4
  store i32 %268, i32* %271, align 4
  %272 = sext i32 %j.0 to i64
  %273 = getelementptr inbounds [8 x [8 x i32]]* %m1, i32 0, i64 %272
  %274 = getelementptr inbounds [8 x i32]* %273, i32 0, i64 4
  %275 = load i32* %274, align 4
  %276 = sext i32 %j.0 to i64
  %277 = getelementptr inbounds [8 x [8 x i32]]* %m1, i32 0, i64 %276
  %278 = getelementptr inbounds [8 x i32]* %277, i32 0, i64 5
  %279 = load i32* %278, align 4
  %280 = sub nsw i32 %275, %279
  %281 = sext i32 %j.0 to i64
  %282 = getelementptr inbounds [8 x [8 x i32]]* %m2, i32 0, i64 %281
  %283 = getelementptr inbounds [8 x i32]* %282, i32 0, i64 5
  store i32 %280, i32* %283, align 4
  %284 = sext i32 %j.0 to i64
  %285 = getelementptr inbounds [8 x [8 x i32]]* %m1, i32 0, i64 %284
  %286 = getelementptr inbounds [8 x i32]* %285, i32 0, i64 6
  %287 = load i32* %286, align 4
  %288 = sext i32 %j.0 to i64
  %289 = getelementptr inbounds [8 x [8 x i32]]* %m1, i32 0, i64 %288
  %290 = getelementptr inbounds [8 x i32]* %289, i32 0, i64 7
  %291 = load i32* %290, align 4
  %292 = add nsw i32 %287, %291
  %293 = sext i32 %j.0 to i64
  %294 = getelementptr inbounds [8 x [8 x i32]]* %m2, i32 0, i64 %293
  %295 = getelementptr inbounds [8 x i32]* %294, i32 0, i64 6
  store i32 %292, i32* %295, align 4
  %296 = sext i32 %j.0 to i64
  %297 = getelementptr inbounds [8 x [8 x i32]]* %m1, i32 0, i64 %296
  %298 = getelementptr inbounds [8 x i32]* %297, i32 0, i64 6
  %299 = load i32* %298, align 4
  %300 = sext i32 %j.0 to i64
  %301 = getelementptr inbounds [8 x [8 x i32]]* %m1, i32 0, i64 %300
  %302 = getelementptr inbounds [8 x i32]* %301, i32 0, i64 7
  %303 = load i32* %302, align 4
  %304 = sub nsw i32 %299, %303
  %305 = sext i32 %j.0 to i64
  %306 = getelementptr inbounds [8 x [8 x i32]]* %m2, i32 0, i64 %305
  %307 = getelementptr inbounds [8 x i32]* %306, i32 0, i64 7
  store i32 %304, i32* %307, align 4
  br label %308

; <label>:308                                     ; preds = %5
  %309 = add nsw i32 %j.0, 1
  br label %3

; <label>:310                                     ; preds = %3
  br label %311

; <label>:311                                     ; preds = %602, %310
  %i.0 = phi i32 [ 0, %310 ], [ %603, %602 ]
  %312 = icmp slt i32 %i.0, 8
  br i1 %312, label %313, label %604

; <label>:313                                     ; preds = %311
  %314 = sext i32 %i.0 to i64
  %315 = getelementptr inbounds [8 x [8 x i32]]* %m2, i32 0, i64 0
  %316 = getelementptr inbounds [8 x i32]* %315, i32 0, i64 %314
  %317 = load i32* %316, align 4
  %318 = sext i32 %i.0 to i64
  %319 = getelementptr inbounds [8 x [8 x i32]]* %m2, i32 0, i64 4
  %320 = getelementptr inbounds [8 x i32]* %319, i32 0, i64 %318
  %321 = load i32* %320, align 4
  %322 = add nsw i32 %317, %321
  %323 = sext i32 %i.0 to i64
  %324 = getelementptr inbounds [8 x [8 x i32]]* %m3, i32 0, i64 0
  %325 = getelementptr inbounds [8 x i32]* %324, i32 0, i64 %323
  store i32 %322, i32* %325, align 4
  %326 = sext i32 %i.0 to i64
  %327 = getelementptr inbounds [8 x [8 x i32]]* %m2, i32 0, i64 1
  %328 = getelementptr inbounds [8 x i32]* %327, i32 0, i64 %326
  %329 = load i32* %328, align 4
  %330 = sext i32 %i.0 to i64
  %331 = getelementptr inbounds [8 x [8 x i32]]* %m2, i32 0, i64 5
  %332 = getelementptr inbounds [8 x i32]* %331, i32 0, i64 %330
  %333 = load i32* %332, align 4
  %334 = add nsw i32 %329, %333
  %335 = sext i32 %i.0 to i64
  %336 = getelementptr inbounds [8 x [8 x i32]]* %m3, i32 0, i64 1
  %337 = getelementptr inbounds [8 x i32]* %336, i32 0, i64 %335
  store i32 %334, i32* %337, align 4
  %338 = sext i32 %i.0 to i64
  %339 = getelementptr inbounds [8 x [8 x i32]]* %m2, i32 0, i64 2
  %340 = getelementptr inbounds [8 x i32]* %339, i32 0, i64 %338
  %341 = load i32* %340, align 4
  %342 = sext i32 %i.0 to i64
  %343 = getelementptr inbounds [8 x [8 x i32]]* %m2, i32 0, i64 6
  %344 = getelementptr inbounds [8 x i32]* %343, i32 0, i64 %342
  %345 = load i32* %344, align 4
  %346 = add nsw i32 %341, %345
  %347 = sext i32 %i.0 to i64
  %348 = getelementptr inbounds [8 x [8 x i32]]* %m3, i32 0, i64 2
  %349 = getelementptr inbounds [8 x i32]* %348, i32 0, i64 %347
  store i32 %346, i32* %349, align 4
  %350 = sext i32 %i.0 to i64
  %351 = getelementptr inbounds [8 x [8 x i32]]* %m2, i32 0, i64 3
  %352 = getelementptr inbounds [8 x i32]* %351, i32 0, i64 %350
  %353 = load i32* %352, align 4
  %354 = sext i32 %i.0 to i64
  %355 = getelementptr inbounds [8 x [8 x i32]]* %m2, i32 0, i64 7
  %356 = getelementptr inbounds [8 x i32]* %355, i32 0, i64 %354
  %357 = load i32* %356, align 4
  %358 = add nsw i32 %353, %357
  %359 = sext i32 %i.0 to i64
  %360 = getelementptr inbounds [8 x [8 x i32]]* %m3, i32 0, i64 3
  %361 = getelementptr inbounds [8 x i32]* %360, i32 0, i64 %359
  store i32 %358, i32* %361, align 4
  %362 = sext i32 %i.0 to i64
  %363 = getelementptr inbounds [8 x [8 x i32]]* %m2, i32 0, i64 0
  %364 = getelementptr inbounds [8 x i32]* %363, i32 0, i64 %362
  %365 = load i32* %364, align 4
  %366 = sext i32 %i.0 to i64
  %367 = getelementptr inbounds [8 x [8 x i32]]* %m2, i32 0, i64 4
  %368 = getelementptr inbounds [8 x i32]* %367, i32 0, i64 %366
  %369 = load i32* %368, align 4
  %370 = sub nsw i32 %365, %369
  %371 = sext i32 %i.0 to i64
  %372 = getelementptr inbounds [8 x [8 x i32]]* %m3, i32 0, i64 4
  %373 = getelementptr inbounds [8 x i32]* %372, i32 0, i64 %371
  store i32 %370, i32* %373, align 4
  %374 = sext i32 %i.0 to i64
  %375 = getelementptr inbounds [8 x [8 x i32]]* %m2, i32 0, i64 1
  %376 = getelementptr inbounds [8 x i32]* %375, i32 0, i64 %374
  %377 = load i32* %376, align 4
  %378 = sext i32 %i.0 to i64
  %379 = getelementptr inbounds [8 x [8 x i32]]* %m2, i32 0, i64 5
  %380 = getelementptr inbounds [8 x i32]* %379, i32 0, i64 %378
  %381 = load i32* %380, align 4
  %382 = sub nsw i32 %377, %381
  %383 = sext i32 %i.0 to i64
  %384 = getelementptr inbounds [8 x [8 x i32]]* %m3, i32 0, i64 5
  %385 = getelementptr inbounds [8 x i32]* %384, i32 0, i64 %383
  store i32 %382, i32* %385, align 4
  %386 = sext i32 %i.0 to i64
  %387 = getelementptr inbounds [8 x [8 x i32]]* %m2, i32 0, i64 2
  %388 = getelementptr inbounds [8 x i32]* %387, i32 0, i64 %386
  %389 = load i32* %388, align 4
  %390 = sext i32 %i.0 to i64
  %391 = getelementptr inbounds [8 x [8 x i32]]* %m2, i32 0, i64 6
  %392 = getelementptr inbounds [8 x i32]* %391, i32 0, i64 %390
  %393 = load i32* %392, align 4
  %394 = sub nsw i32 %389, %393
  %395 = sext i32 %i.0 to i64
  %396 = getelementptr inbounds [8 x [8 x i32]]* %m3, i32 0, i64 6
  %397 = getelementptr inbounds [8 x i32]* %396, i32 0, i64 %395
  store i32 %394, i32* %397, align 4
  %398 = sext i32 %i.0 to i64
  %399 = getelementptr inbounds [8 x [8 x i32]]* %m2, i32 0, i64 3
  %400 = getelementptr inbounds [8 x i32]* %399, i32 0, i64 %398
  %401 = load i32* %400, align 4
  %402 = sext i32 %i.0 to i64
  %403 = getelementptr inbounds [8 x [8 x i32]]* %m2, i32 0, i64 7
  %404 = getelementptr inbounds [8 x i32]* %403, i32 0, i64 %402
  %405 = load i32* %404, align 4
  %406 = sub nsw i32 %401, %405
  %407 = sext i32 %i.0 to i64
  %408 = getelementptr inbounds [8 x [8 x i32]]* %m3, i32 0, i64 7
  %409 = getelementptr inbounds [8 x i32]* %408, i32 0, i64 %407
  store i32 %406, i32* %409, align 4
  %410 = sext i32 %i.0 to i64
  %411 = getelementptr inbounds [8 x [8 x i32]]* %m3, i32 0, i64 0
  %412 = getelementptr inbounds [8 x i32]* %411, i32 0, i64 %410
  %413 = load i32* %412, align 4
  %414 = sext i32 %i.0 to i64
  %415 = getelementptr inbounds [8 x [8 x i32]]* %m3, i32 0, i64 2
  %416 = getelementptr inbounds [8 x i32]* %415, i32 0, i64 %414
  %417 = load i32* %416, align 4
  %418 = add nsw i32 %413, %417
  %419 = sext i32 %i.0 to i64
  %420 = getelementptr inbounds [8 x [8 x i32]]* %m1, i32 0, i64 0
  %421 = getelementptr inbounds [8 x i32]* %420, i32 0, i64 %419
  store i32 %418, i32* %421, align 4
  %422 = sext i32 %i.0 to i64
  %423 = getelementptr inbounds [8 x [8 x i32]]* %m3, i32 0, i64 1
  %424 = getelementptr inbounds [8 x i32]* %423, i32 0, i64 %422
  %425 = load i32* %424, align 4
  %426 = sext i32 %i.0 to i64
  %427 = getelementptr inbounds [8 x [8 x i32]]* %m3, i32 0, i64 3
  %428 = getelementptr inbounds [8 x i32]* %427, i32 0, i64 %426
  %429 = load i32* %428, align 4
  %430 = add nsw i32 %425, %429
  %431 = sext i32 %i.0 to i64
  %432 = getelementptr inbounds [8 x [8 x i32]]* %m1, i32 0, i64 1
  %433 = getelementptr inbounds [8 x i32]* %432, i32 0, i64 %431
  store i32 %430, i32* %433, align 4
  %434 = sext i32 %i.0 to i64
  %435 = getelementptr inbounds [8 x [8 x i32]]* %m3, i32 0, i64 0
  %436 = getelementptr inbounds [8 x i32]* %435, i32 0, i64 %434
  %437 = load i32* %436, align 4
  %438 = sext i32 %i.0 to i64
  %439 = getelementptr inbounds [8 x [8 x i32]]* %m3, i32 0, i64 2
  %440 = getelementptr inbounds [8 x i32]* %439, i32 0, i64 %438
  %441 = load i32* %440, align 4
  %442 = sub nsw i32 %437, %441
  %443 = sext i32 %i.0 to i64
  %444 = getelementptr inbounds [8 x [8 x i32]]* %m1, i32 0, i64 2
  %445 = getelementptr inbounds [8 x i32]* %444, i32 0, i64 %443
  store i32 %442, i32* %445, align 4
  %446 = sext i32 %i.0 to i64
  %447 = getelementptr inbounds [8 x [8 x i32]]* %m3, i32 0, i64 1
  %448 = getelementptr inbounds [8 x i32]* %447, i32 0, i64 %446
  %449 = load i32* %448, align 4
  %450 = sext i32 %i.0 to i64
  %451 = getelementptr inbounds [8 x [8 x i32]]* %m3, i32 0, i64 3
  %452 = getelementptr inbounds [8 x i32]* %451, i32 0, i64 %450
  %453 = load i32* %452, align 4
  %454 = sub nsw i32 %449, %453
  %455 = sext i32 %i.0 to i64
  %456 = getelementptr inbounds [8 x [8 x i32]]* %m1, i32 0, i64 3
  %457 = getelementptr inbounds [8 x i32]* %456, i32 0, i64 %455
  store i32 %454, i32* %457, align 4
  %458 = sext i32 %i.0 to i64
  %459 = getelementptr inbounds [8 x [8 x i32]]* %m3, i32 0, i64 4
  %460 = getelementptr inbounds [8 x i32]* %459, i32 0, i64 %458
  %461 = load i32* %460, align 4
  %462 = sext i32 %i.0 to i64
  %463 = getelementptr inbounds [8 x [8 x i32]]* %m3, i32 0, i64 6
  %464 = getelementptr inbounds [8 x i32]* %463, i32 0, i64 %462
  %465 = load i32* %464, align 4
  %466 = add nsw i32 %461, %465
  %467 = sext i32 %i.0 to i64
  %468 = getelementptr inbounds [8 x [8 x i32]]* %m1, i32 0, i64 4
  %469 = getelementptr inbounds [8 x i32]* %468, i32 0, i64 %467
  store i32 %466, i32* %469, align 4
  %470 = sext i32 %i.0 to i64
  %471 = getelementptr inbounds [8 x [8 x i32]]* %m3, i32 0, i64 5
  %472 = getelementptr inbounds [8 x i32]* %471, i32 0, i64 %470
  %473 = load i32* %472, align 4
  %474 = sext i32 %i.0 to i64
  %475 = getelementptr inbounds [8 x [8 x i32]]* %m3, i32 0, i64 7
  %476 = getelementptr inbounds [8 x i32]* %475, i32 0, i64 %474
  %477 = load i32* %476, align 4
  %478 = add nsw i32 %473, %477
  %479 = sext i32 %i.0 to i64
  %480 = getelementptr inbounds [8 x [8 x i32]]* %m1, i32 0, i64 5
  %481 = getelementptr inbounds [8 x i32]* %480, i32 0, i64 %479
  store i32 %478, i32* %481, align 4
  %482 = sext i32 %i.0 to i64
  %483 = getelementptr inbounds [8 x [8 x i32]]* %m3, i32 0, i64 4
  %484 = getelementptr inbounds [8 x i32]* %483, i32 0, i64 %482
  %485 = load i32* %484, align 4
  %486 = sext i32 %i.0 to i64
  %487 = getelementptr inbounds [8 x [8 x i32]]* %m3, i32 0, i64 6
  %488 = getelementptr inbounds [8 x i32]* %487, i32 0, i64 %486
  %489 = load i32* %488, align 4
  %490 = sub nsw i32 %485, %489
  %491 = sext i32 %i.0 to i64
  %492 = getelementptr inbounds [8 x [8 x i32]]* %m1, i32 0, i64 6
  %493 = getelementptr inbounds [8 x i32]* %492, i32 0, i64 %491
  store i32 %490, i32* %493, align 4
  %494 = sext i32 %i.0 to i64
  %495 = getelementptr inbounds [8 x [8 x i32]]* %m3, i32 0, i64 5
  %496 = getelementptr inbounds [8 x i32]* %495, i32 0, i64 %494
  %497 = load i32* %496, align 4
  %498 = sext i32 %i.0 to i64
  %499 = getelementptr inbounds [8 x [8 x i32]]* %m3, i32 0, i64 7
  %500 = getelementptr inbounds [8 x i32]* %499, i32 0, i64 %498
  %501 = load i32* %500, align 4
  %502 = sub nsw i32 %497, %501
  %503 = sext i32 %i.0 to i64
  %504 = getelementptr inbounds [8 x [8 x i32]]* %m1, i32 0, i64 7
  %505 = getelementptr inbounds [8 x i32]* %504, i32 0, i64 %503
  store i32 %502, i32* %505, align 4
  %506 = sext i32 %i.0 to i64
  %507 = getelementptr inbounds [8 x [8 x i32]]* %m1, i32 0, i64 0
  %508 = getelementptr inbounds [8 x i32]* %507, i32 0, i64 %506
  %509 = load i32* %508, align 4
  %510 = sext i32 %i.0 to i64
  %511 = getelementptr inbounds [8 x [8 x i32]]* %m1, i32 0, i64 1
  %512 = getelementptr inbounds [8 x i32]* %511, i32 0, i64 %510
  %513 = load i32* %512, align 4
  %514 = add nsw i32 %509, %513
  %515 = sext i32 %i.0 to i64
  %516 = getelementptr inbounds [8 x [8 x i32]]* %m2, i32 0, i64 0
  %517 = getelementptr inbounds [8 x i32]* %516, i32 0, i64 %515
  store i32 %514, i32* %517, align 4
  %518 = sext i32 %i.0 to i64
  %519 = getelementptr inbounds [8 x [8 x i32]]* %m1, i32 0, i64 0
  %520 = getelementptr inbounds [8 x i32]* %519, i32 0, i64 %518
  %521 = load i32* %520, align 4
  %522 = sext i32 %i.0 to i64
  %523 = getelementptr inbounds [8 x [8 x i32]]* %m1, i32 0, i64 1
  %524 = getelementptr inbounds [8 x i32]* %523, i32 0, i64 %522
  %525 = load i32* %524, align 4
  %526 = sub nsw i32 %521, %525
  %527 = sext i32 %i.0 to i64
  %528 = getelementptr inbounds [8 x [8 x i32]]* %m2, i32 0, i64 1
  %529 = getelementptr inbounds [8 x i32]* %528, i32 0, i64 %527
  store i32 %526, i32* %529, align 4
  %530 = sext i32 %i.0 to i64
  %531 = getelementptr inbounds [8 x [8 x i32]]* %m1, i32 0, i64 2
  %532 = getelementptr inbounds [8 x i32]* %531, i32 0, i64 %530
  %533 = load i32* %532, align 4
  %534 = sext i32 %i.0 to i64
  %535 = getelementptr inbounds [8 x [8 x i32]]* %m1, i32 0, i64 3
  %536 = getelementptr inbounds [8 x i32]* %535, i32 0, i64 %534
  %537 = load i32* %536, align 4
  %538 = add nsw i32 %533, %537
  %539 = sext i32 %i.0 to i64
  %540 = getelementptr inbounds [8 x [8 x i32]]* %m2, i32 0, i64 2
  %541 = getelementptr inbounds [8 x i32]* %540, i32 0, i64 %539
  store i32 %538, i32* %541, align 4
  %542 = sext i32 %i.0 to i64
  %543 = getelementptr inbounds [8 x [8 x i32]]* %m1, i32 0, i64 2
  %544 = getelementptr inbounds [8 x i32]* %543, i32 0, i64 %542
  %545 = load i32* %544, align 4
  %546 = sext i32 %i.0 to i64
  %547 = getelementptr inbounds [8 x [8 x i32]]* %m1, i32 0, i64 3
  %548 = getelementptr inbounds [8 x i32]* %547, i32 0, i64 %546
  %549 = load i32* %548, align 4
  %550 = sub nsw i32 %545, %549
  %551 = sext i32 %i.0 to i64
  %552 = getelementptr inbounds [8 x [8 x i32]]* %m2, i32 0, i64 3
  %553 = getelementptr inbounds [8 x i32]* %552, i32 0, i64 %551
  store i32 %550, i32* %553, align 4
  %554 = sext i32 %i.0 to i64
  %555 = getelementptr inbounds [8 x [8 x i32]]* %m1, i32 0, i64 4
  %556 = getelementptr inbounds [8 x i32]* %555, i32 0, i64 %554
  %557 = load i32* %556, align 4
  %558 = sext i32 %i.0 to i64
  %559 = getelementptr inbounds [8 x [8 x i32]]* %m1, i32 0, i64 5
  %560 = getelementptr inbounds [8 x i32]* %559, i32 0, i64 %558
  %561 = load i32* %560, align 4
  %562 = add nsw i32 %557, %561
  %563 = sext i32 %i.0 to i64
  %564 = getelementptr inbounds [8 x [8 x i32]]* %m2, i32 0, i64 4
  %565 = getelementptr inbounds [8 x i32]* %564, i32 0, i64 %563
  store i32 %562, i32* %565, align 4
  %566 = sext i32 %i.0 to i64
  %567 = getelementptr inbounds [8 x [8 x i32]]* %m1, i32 0, i64 4
  %568 = getelementptr inbounds [8 x i32]* %567, i32 0, i64 %566
  %569 = load i32* %568, align 4
  %570 = sext i32 %i.0 to i64
  %571 = getelementptr inbounds [8 x [8 x i32]]* %m1, i32 0, i64 5
  %572 = getelementptr inbounds [8 x i32]* %571, i32 0, i64 %570
  %573 = load i32* %572, align 4
  %574 = sub nsw i32 %569, %573
  %575 = sext i32 %i.0 to i64
  %576 = getelementptr inbounds [8 x [8 x i32]]* %m2, i32 0, i64 5
  %577 = getelementptr inbounds [8 x i32]* %576, i32 0, i64 %575
  store i32 %574, i32* %577, align 4
  %578 = sext i32 %i.0 to i64
  %579 = getelementptr inbounds [8 x [8 x i32]]* %m1, i32 0, i64 6
  %580 = getelementptr inbounds [8 x i32]* %579, i32 0, i64 %578
  %581 = load i32* %580, align 4
  %582 = sext i32 %i.0 to i64
  %583 = getelementptr inbounds [8 x [8 x i32]]* %m1, i32 0, i64 7
  %584 = getelementptr inbounds [8 x i32]* %583, i32 0, i64 %582
  %585 = load i32* %584, align 4
  %586 = add nsw i32 %581, %585
  %587 = sext i32 %i.0 to i64
  %588 = getelementptr inbounds [8 x [8 x i32]]* %m2, i32 0, i64 6
  %589 = getelementptr inbounds [8 x i32]* %588, i32 0, i64 %587
  store i32 %586, i32* %589, align 4
  %590 = sext i32 %i.0 to i64
  %591 = getelementptr inbounds [8 x [8 x i32]]* %m1, i32 0, i64 6
  %592 = getelementptr inbounds [8 x i32]* %591, i32 0, i64 %590
  %593 = load i32* %592, align 4
  %594 = sext i32 %i.0 to i64
  %595 = getelementptr inbounds [8 x [8 x i32]]* %m1, i32 0, i64 7
  %596 = getelementptr inbounds [8 x i32]* %595, i32 0, i64 %594
  %597 = load i32* %596, align 4
  %598 = sub nsw i32 %593, %597
  %599 = sext i32 %i.0 to i64
  %600 = getelementptr inbounds [8 x [8 x i32]]* %m2, i32 0, i64 7
  %601 = getelementptr inbounds [8 x i32]* %600, i32 0, i64 %599
  store i32 %598, i32* %601, align 4
  br label %602

; <label>:602                                     ; preds = %313
  %603 = add nsw i32 %i.0, 1
  br label %311

; <label>:604                                     ; preds = %311
  br label %605

; <label>:605                                     ; preds = %636, %604
  %j.1 = phi i32 [ 0, %604 ], [ %637, %636 ]
  %sad.0 = phi i32 [ 0, %604 ], [ %sad.1, %636 ]
  %606 = icmp slt i32 %j.1, 8
  br i1 %606, label %607, label %638

; <label>:607                                     ; preds = %605
  br label %608

; <label>:608                                     ; preds = %633, %607
  %i.1 = phi i32 [ 0, %607 ], [ %634, %633 ]
  %sad.1 = phi i32 [ %sad.0, %607 ], [ %632, %633 ]
  %609 = icmp slt i32 %i.1, 8
  br i1 %609, label %610, label %635

; <label>:610                                     ; preds = %608
  %611 = sext i32 %i.1 to i64
  %612 = sext i32 %j.1 to i64
  %613 = getelementptr inbounds [8 x [8 x i32]]* %m2, i32 0, i64 %612
  %614 = getelementptr inbounds [8 x i32]* %613, i32 0, i64 %611
  %615 = load i32* %614, align 4
  %616 = icmp slt i32 %615, 0
  br i1 %616, label %617, label %624

; <label>:617                                     ; preds = %610
  %618 = sext i32 %i.1 to i64
  %619 = sext i32 %j.1 to i64
  %620 = getelementptr inbounds [8 x [8 x i32]]* %m2, i32 0, i64 %619
  %621 = getelementptr inbounds [8 x i32]* %620, i32 0, i64 %618
  %622 = load i32* %621, align 4
  %623 = sub nsw i32 0, %622
  br label %630

; <label>:624                                     ; preds = %610
  %625 = sext i32 %i.1 to i64
  %626 = sext i32 %j.1 to i64
  %627 = getelementptr inbounds [8 x [8 x i32]]* %m2, i32 0, i64 %626
  %628 = getelementptr inbounds [8 x i32]* %627, i32 0, i64 %625
  %629 = load i32* %628, align 4
  br label %630

; <label>:630                                     ; preds = %624, %617
  %631 = phi i32 [ %623, %617 ], [ %629, %624 ]
  %632 = add nsw i32 %sad.1, %631
  br label %633

; <label>:633                                     ; preds = %630
  %634 = add nsw i32 %i.1, 1
  br label %608

; <label>:635                                     ; preds = %608
  br label %636

; <label>:636                                     ; preds = %635
  %637 = add nsw i32 %j.1, 1
  br label %605

; <label>:638                                     ; preds = %605
  %639 = add nsw i32 %sad.0, 2
  %640 = ashr i32 %639, 2
  br label %656

; <label>:641                                     ; preds = %0
  br label %642

; <label>:642                                     ; preds = %653, %641
  %i.2 = phi i32 [ 0, %641 ], [ %654, %653 ]
  %sad.2 = phi i32 [ 0, %641 ], [ %652, %653 ]
  %643 = icmp slt i32 %i.2, 64
  br i1 %643, label %644, label %655

; <label>:644                                     ; preds = %642
  %645 = sext i32 %i.2 to i64
  %646 = getelementptr inbounds i32* %diff, i64 %645
  %647 = load i32* %646, align 4
  %648 = sext i32 %647 to i64
  %649 = load i32** @byte_abs, align 8
  %650 = getelementptr inbounds i32* %649, i64 %648
  %651 = load i32* %650, align 4
  %652 = add nsw i32 %sad.2, %651
  br label %653

; <label>:653                                     ; preds = %644
  %654 = add nsw i32 %i.2, 1
  br label %642

; <label>:655                                     ; preds = %642
  br label %656

; <label>:656                                     ; preds = %655, %638
  %sad.3 = phi i32 [ %640, %638 ], [ %sad.2, %655 ]
  ret i32 %sad.3
}

; Function Attrs: nounwind uwtable
define i32 @find_SATD([16 x i32]* %curr_diff, i32 %use_hadamard, i32 %blocktype) #0 {
  %diff = alloca [256 x i32], align 16
  %1 = sext i32 %blocktype to i64
  %2 = load %struct.InputParameters** @input, align 8
  %3 = getelementptr inbounds %struct.InputParameters* %2, i32 0, i32 20
  %4 = getelementptr inbounds [8 x [2 x i32]]* %3, i32 0, i64 %1
  %5 = getelementptr inbounds [2 x i32]* %4, i32 0, i64 0
  %6 = load i32* %5, align 4
  %7 = sext i32 %blocktype to i64
  %8 = load %struct.InputParameters** @input, align 8
  %9 = getelementptr inbounds %struct.InputParameters* %8, i32 0, i32 20
  %10 = getelementptr inbounds [8 x [2 x i32]]* %9, i32 0, i64 %7
  %11 = getelementptr inbounds [2 x i32]* %10, i32 0, i64 1
  %12 = load i32* %11, align 4
  %13 = icmp sgt i32 %blocktype, 4
  %14 = select i1 %13, i32 4, i32 8
  br label %15

; <label>:15                                      ; preds = %46, %0
  %k.0 = phi i32 [ 0, %0 ], [ %k.1, %46 ]
  %y.0 = phi i32 [ 0, %0 ], [ %47, %46 ]
  %16 = icmp slt i32 %y.0, %12
  br i1 %16, label %17, label %48

; <label>:17                                      ; preds = %15
  br label %18

; <label>:18                                      ; preds = %43, %17
  %k.1 = phi i32 [ %k.0, %17 ], [ %k.2, %43 ]
  %x.0 = phi i32 [ 0, %17 ], [ %44, %43 ]
  %19 = icmp slt i32 %x.0, %6
  br i1 %19, label %20, label %45

; <label>:20                                      ; preds = %18
  br label %21

; <label>:21                                      ; preds = %40, %20
  %k.2 = phi i32 [ %k.1, %20 ], [ %k.3, %40 ]
  %j.0 = phi i32 [ %y.0, %20 ], [ %41, %40 ]
  %22 = add nsw i32 %y.0, %14
  %23 = icmp slt i32 %j.0, %22
  br i1 %23, label %24, label %42

; <label>:24                                      ; preds = %21
  br label %25

; <label>:25                                      ; preds = %36, %24
  %k.3 = phi i32 [ %k.2, %24 ], [ %38, %36 ]
  %i.0 = phi i32 [ %x.0, %24 ], [ %37, %36 ]
  %26 = add nsw i32 %x.0, %14
  %27 = icmp slt i32 %i.0, %26
  br i1 %27, label %28, label %39

; <label>:28                                      ; preds = %25
  %29 = sext i32 %i.0 to i64
  %30 = sext i32 %j.0 to i64
  %31 = getelementptr inbounds [16 x i32]* %curr_diff, i64 %30
  %32 = getelementptr inbounds [16 x i32]* %31, i32 0, i64 %29
  %33 = load i32* %32, align 4
  %34 = sext i32 %k.3 to i64
  %35 = getelementptr inbounds [256 x i32]* %diff, i32 0, i64 %34
  store i32 %33, i32* %35, align 4
  br label %36

; <label>:36                                      ; preds = %28
  %37 = add nsw i32 %i.0, 1
  %38 = add nsw i32 %k.3, 1
  br label %25

; <label>:39                                      ; preds = %25
  br label %40

; <label>:40                                      ; preds = %39
  %41 = add nsw i32 %j.0, 1
  br label %21

; <label>:42                                      ; preds = %21
  br label %43

; <label>:43                                      ; preds = %42
  %44 = add nsw i32 %x.0, %14
  br label %18

; <label>:45                                      ; preds = %18
  br label %46

; <label>:46                                      ; preds = %45
  %47 = add nsw i32 %y.0, %14
  br label %15

; <label>:48                                      ; preds = %15
  %49 = icmp ne i32 %use_hadamard, 0
  br i1 %49, label %50, label %113

; <label>:50                                      ; preds = %48
  switch i32 %blocktype, label %111 [
    i32 1, label %51
    i32 2, label %75
    i32 3, label %75
    i32 4, label %87
    i32 5, label %93
    i32 6, label %93
    i32 7, label %105
  ]

; <label>:51                                      ; preds = %50
  %52 = getelementptr inbounds [256 x i32]* %diff, i32 0, i32 0
  %53 = load %struct.InputParameters** @input, align 8
  %54 = getelementptr inbounds %struct.InputParameters* %53, i32 0, i32 6
  %55 = load i32* %54, align 4
  %56 = call i32 @SATD8X8(i32* %52, i32 %55)
  %57 = getelementptr inbounds [256 x i32]* %diff, i32 0, i64 64
  %58 = load %struct.InputParameters** @input, align 8
  %59 = getelementptr inbounds %struct.InputParameters* %58, i32 0, i32 6
  %60 = load i32* %59, align 4
  %61 = call i32 @SATD8X8(i32* %57, i32 %60)
  %62 = add nsw i32 %56, %61
  %63 = getelementptr inbounds [256 x i32]* %diff, i32 0, i64 128
  %64 = load %struct.InputParameters** @input, align 8
  %65 = getelementptr inbounds %struct.InputParameters* %64, i32 0, i32 6
  %66 = load i32* %65, align 4
  %67 = call i32 @SATD8X8(i32* %63, i32 %66)
  %68 = add nsw i32 %62, %67
  %69 = getelementptr inbounds [256 x i32]* %diff, i32 0, i64 192
  %70 = load %struct.InputParameters** @input, align 8
  %71 = getelementptr inbounds %struct.InputParameters* %70, i32 0, i32 6
  %72 = load i32* %71, align 4
  %73 = call i32 @SATD8X8(i32* %69, i32 %72)
  %74 = add nsw i32 %68, %73
  br label %112

; <label>:75                                      ; preds = %50, %50
  %76 = getelementptr inbounds [256 x i32]* %diff, i32 0, i32 0
  %77 = load %struct.InputParameters** @input, align 8
  %78 = getelementptr inbounds %struct.InputParameters* %77, i32 0, i32 6
  %79 = load i32* %78, align 4
  %80 = call i32 @SATD8X8(i32* %76, i32 %79)
  %81 = getelementptr inbounds [256 x i32]* %diff, i32 0, i64 64
  %82 = load %struct.InputParameters** @input, align 8
  %83 = getelementptr inbounds %struct.InputParameters* %82, i32 0, i32 6
  %84 = load i32* %83, align 4
  %85 = call i32 @SATD8X8(i32* %81, i32 %84)
  %86 = add nsw i32 %80, %85
  br label %112

; <label>:87                                      ; preds = %50
  %88 = getelementptr inbounds [256 x i32]* %diff, i32 0, i32 0
  %89 = load %struct.InputParameters** @input, align 8
  %90 = getelementptr inbounds %struct.InputParameters* %89, i32 0, i32 6
  %91 = load i32* %90, align 4
  %92 = call i32 @SATD8X8(i32* %88, i32 %91)
  br label %112

; <label>:93                                      ; preds = %50, %50
  %94 = getelementptr inbounds [256 x i32]* %diff, i32 0, i32 0
  %95 = load %struct.InputParameters** @input, align 8
  %96 = getelementptr inbounds %struct.InputParameters* %95, i32 0, i32 6
  %97 = load i32* %96, align 4
  %98 = call i32 @SATD(i32* %94, i32 %97)
  %99 = getelementptr inbounds [256 x i32]* %diff, i32 0, i64 16
  %100 = load %struct.InputParameters** @input, align 8
  %101 = getelementptr inbounds %struct.InputParameters* %100, i32 0, i32 6
  %102 = load i32* %101, align 4
  %103 = call i32 @SATD(i32* %99, i32 %102)
  %104 = add nsw i32 %98, %103
  br label %112

; <label>:105                                     ; preds = %50
  %106 = getelementptr inbounds [256 x i32]* %diff, i32 0, i32 0
  %107 = load %struct.InputParameters** @input, align 8
  %108 = getelementptr inbounds %struct.InputParameters* %107, i32 0, i32 6
  %109 = load i32* %108, align 4
  %110 = call i32 @SATD(i32* %106, i32 %109)
  br label %112

; <label>:111                                     ; preds = %50
  br label %112

; <label>:112                                     ; preds = %111, %105, %93, %87, %75, %51
  %sad.0 = phi i32 [ -1, %111 ], [ %110, %105 ], [ %104, %93 ], [ %92, %87 ], [ %86, %75 ], [ %74, %51 ]
  br label %129

; <label>:113                                     ; preds = %48
  br label %114

; <label>:114                                     ; preds = %126, %113
  %i.1 = phi i32 [ 0, %113 ], [ %127, %126 ]
  %sad.1 = phi i32 [ 0, %113 ], [ %125, %126 ]
  %115 = mul nsw i32 %12, %6
  %116 = icmp slt i32 %i.1, %115
  br i1 %116, label %117, label %128

; <label>:117                                     ; preds = %114
  %118 = sext i32 %i.1 to i64
  %119 = getelementptr inbounds [256 x i32]* %diff, i32 0, i64 %118
  %120 = load i32* %119, align 4
  %121 = sext i32 %120 to i64
  %122 = load i32** @byte_abs, align 8
  %123 = getelementptr inbounds i32* %122, i64 %121
  %124 = load i32* %123, align 4
  %125 = add nsw i32 %sad.1, %124
  br label %126

; <label>:126                                     ; preds = %117
  %127 = add nsw i32 %i.1, 1
  br label %114

; <label>:128                                     ; preds = %114
  br label %129

; <label>:129                                     ; preds = %128, %112
  %sad.2 = phi i32 [ %sad.0, %112 ], [ %sad.1, %128 ]
  ret i32 %sad.2
}

; Function Attrs: nounwind uwtable
define i32 @SubPelBlockMotionSearch(i16** %orig_pic, i16 signext %ref, i32 %list, i32 %pic_pix_x, i32 %pic_pix_y, i32 %blocktype, i16 signext %pred_mv_x, i16 signext %pred_mv_y, i16* %mv_x, i16* %mv_y, i32 %search_pos2, i32 %search_pos4, i32 %min_mcost, double %lambda) #0 {
  %curr_diff = alloca [16 x [16 x i32]], align 16
  %diff = alloca [16 x i32], align 16
  %1 = fmul double 6.553600e+04, %lambda
  %2 = fadd double %1, 5.000000e-01
  %3 = fptosi double %2 to i32
  %4 = icmp eq i32 %blocktype, 1
  br i1 %4, label %5, label %31

; <label>:5                                       ; preds = %0
  %6 = load i16* %mv_x, align 2
  %7 = sext i16 %6 to i32
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %31

; <label>:9                                       ; preds = %5
  %10 = load i16* %mv_y, align 2
  %11 = sext i16 %10 to i32
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %31

; <label>:13                                      ; preds = %9
  %14 = load %struct.InputParameters** @input, align 8
  %15 = getelementptr inbounds %struct.InputParameters* %14, i32 0, i32 6
  %16 = load i32* %15, align 4
  %17 = icmp ne i32 %16, 0
  br i1 %17, label %18, label %31

; <label>:18                                      ; preds = %13
  %19 = load %struct.InputParameters** @input, align 8
  %20 = getelementptr inbounds %struct.InputParameters* %19, i32 0, i32 85
  %21 = load i32* %20, align 4
  %22 = icmp ne i32 %21, 0
  br i1 %22, label %31, label %23

; <label>:23                                      ; preds = %18
  %24 = load %struct.ImageParameters** @img, align 8
  %25 = getelementptr inbounds %struct.ImageParameters* %24, i32 0, i32 6
  %26 = load i32* %25, align 4
  %27 = icmp ne i32 %26, 1
  br i1 %27, label %28, label %31

; <label>:28                                      ; preds = %23
  %29 = sext i16 %ref to i32
  %30 = icmp eq i32 %29, 0
  br label %31

; <label>:31                                      ; preds = %28, %23, %18, %13, %9, %5, %0
  %32 = phi i1 [ false, %23 ], [ false, %18 ], [ false, %13 ], [ false, %9 ], [ false, %5 ], [ false, %0 ], [ %30, %28 ]
  %33 = zext i1 %32 to i32
  %34 = sext i32 %blocktype to i64
  %35 = load %struct.InputParameters** @input, align 8
  %36 = getelementptr inbounds %struct.InputParameters* %35, i32 0, i32 20
  %37 = getelementptr inbounds [8 x [2 x i32]]* %36, i32 0, i64 %34
  %38 = getelementptr inbounds [2 x i32]* %37, i32 0, i64 0
  %39 = load i32* %38, align 4
  %40 = sext i32 %blocktype to i64
  %41 = load %struct.InputParameters** @input, align 8
  %42 = getelementptr inbounds %struct.InputParameters* %41, i32 0, i32 20
  %43 = getelementptr inbounds [8 x [2 x i32]]* %42, i32 0, i64 %40
  %44 = getelementptr inbounds [2 x i32]* %43, i32 0, i64 1
  %45 = load i32* %44, align 4
  %46 = shl i32 %pic_pix_x, 2
  %47 = shl i32 %pic_pix_y, 2
  %48 = load %struct.InputParameters** @input, align 8
  %49 = getelementptr inbounds %struct.InputParameters* %48, i32 0, i32 6
  %50 = load i32* %49, align 4
  %51 = icmp ne i32 %50, 0
  br i1 %51, label %52, label %58

; <label>:52                                      ; preds = %31
  %53 = load %struct.InputParameters** @input, align 8
  %54 = getelementptr inbounds %struct.InputParameters* %53, i32 0, i32 7
  %55 = load i32* %54, align 4
  %56 = icmp ne i32 %55, 0
  %57 = select i1 %56, i32 1, i32 0
  br label %59

; <label>:58                                      ; preds = %31
  br label %59

; <label>:59                                      ; preds = %58, %52
  %60 = phi i32 [ %57, %52 ], [ 1, %58 ]
  %61 = load %struct.InputParameters** @input, align 8
  %62 = getelementptr inbounds %struct.InputParameters* %61, i32 0, i32 6
  %63 = load i32* %62, align 4
  %64 = icmp ne i32 %63, 0
  br i1 %64, label %65, label %71

; <label>:65                                      ; preds = %59
  %66 = icmp sgt i32 1, %search_pos2
  br i1 %66, label %67, label %68

; <label>:67                                      ; preds = %65
  br label %69

; <label>:68                                      ; preds = %65
  br label %69

; <label>:69                                      ; preds = %68, %67
  %70 = phi i32 [ 1, %67 ], [ %search_pos2, %68 ]
  br label %72

; <label>:71                                      ; preds = %59
  br label %72

; <label>:72                                      ; preds = %71, %69
  %73 = phi i32 [ %70, %69 ], [ %search_pos2, %71 ]
  %74 = load %struct.ImageParameters** @img, align 8
  %75 = getelementptr inbounds %struct.ImageParameters* %74, i32 0, i32 90
  %76 = load i32* %75, align 4
  %77 = icmp ne i32 %76, 0
  br i1 %77, label %78, label %97

; <label>:78                                      ; preds = %72
  %79 = load %struct.ImageParameters** @img, align 8
  %80 = getelementptr inbounds %struct.ImageParameters* %79, i32 0, i32 3
  %81 = load i32* %80, align 4
  %82 = sext i32 %81 to i64
  %83 = load %struct.ImageParameters** @img, align 8
  %84 = getelementptr inbounds %struct.ImageParameters* %83, i32 0, i32 51
  %85 = load %struct.macroblock** %84, align 8
  %86 = getelementptr inbounds %struct.macroblock* %85, i64 %82
  %87 = getelementptr inbounds %struct.macroblock* %86, i32 0, i32 22
  %88 = load i32* %87, align 4
  %89 = icmp ne i32 %88, 0
  br i1 %89, label %90, label %97

; <label>:90                                      ; preds = %78
  %91 = load %struct.ImageParameters** @img, align 8
  %92 = getelementptr inbounds %struct.ImageParameters* %91, i32 0, i32 3
  %93 = load i32* %92, align 4
  %94 = srem i32 %93, 2
  %95 = icmp ne i32 %94, 0
  %96 = select i1 %95, i32 4, i32 2
  br label %98

; <label>:97                                      ; preds = %78, %72
  br label %98

; <label>:98                                      ; preds = %97, %90
  %99 = phi i32 [ %96, %90 ], [ 0, %97 ]
  %100 = load %struct.pic_parameter_set_rbsp_t** @active_pps, align 8
  %101 = getelementptr inbounds %struct.pic_parameter_set_rbsp_t* %100, i32 0, i32 19
  %102 = load i32* %101, align 4
  %103 = icmp ne i32 %102, 0
  br i1 %103, label %104, label %114

; <label>:104                                     ; preds = %98
  %105 = load %struct.ImageParameters** @img, align 8
  %106 = getelementptr inbounds %struct.ImageParameters* %105, i32 0, i32 6
  %107 = load i32* %106, align 4
  %108 = icmp eq i32 %107, 0
  br i1 %108, label %126, label %109

; <label>:109                                     ; preds = %104
  %110 = load %struct.ImageParameters** @img, align 8
  %111 = getelementptr inbounds %struct.ImageParameters* %110, i32 0, i32 6
  %112 = load i32* %111, align 4
  %113 = icmp eq i32 %112, 3
  br i1 %113, label %126, label %114

; <label>:114                                     ; preds = %109, %98
  %115 = load %struct.pic_parameter_set_rbsp_t** @active_pps, align 8
  %116 = getelementptr inbounds %struct.pic_parameter_set_rbsp_t* %115, i32 0, i32 20
  %117 = load i32* %116, align 4
  %118 = icmp ne i32 %117, 0
  br i1 %118, label %119, label %124

; <label>:119                                     ; preds = %114
  %120 = load %struct.ImageParameters** @img, align 8
  %121 = getelementptr inbounds %struct.ImageParameters* %120, i32 0, i32 6
  %122 = load i32* %121, align 4
  %123 = icmp eq i32 %122, 1
  br label %124

; <label>:124                                     ; preds = %119, %114
  %125 = phi i1 [ false, %114 ], [ %123, %119 ]
  br label %126

; <label>:126                                     ; preds = %124, %109, %104
  %127 = phi i1 [ true, %109 ], [ true, %104 ], [ %125, %124 ]
  %128 = zext i1 %127 to i32
  %129 = load %struct.InputParameters** @input, align 8
  %130 = getelementptr inbounds %struct.InputParameters* %129, i32 0, i32 7
  %131 = load i32* %130, align 4
  %132 = icmp ne i32 %131, 0
  br i1 %132, label %133, label %134

; <label>:133                                     ; preds = %126
  br label %138

; <label>:134                                     ; preds = %126
  %135 = load %struct.InputParameters** @input, align 8
  %136 = getelementptr inbounds %struct.InputParameters* %135, i32 0, i32 6
  %137 = load i32* %136, align 4
  br label %138

; <label>:138                                     ; preds = %134, %133
  %139 = phi i32 [ 0, %133 ], [ %137, %134 ]
  %140 = load %struct.InputParameters** @input, align 8
  %141 = getelementptr inbounds %struct.InputParameters* %140, i32 0, i32 7
  %142 = load i32* %141, align 4
  %143 = icmp ne i32 %142, 0
  %144 = select i1 %143, i32 0, i32 1
  %145 = sext i16 %ref to i64
  %146 = add nsw i32 %list, %99
  %147 = sext i32 %146 to i64
  %148 = getelementptr inbounds [6 x %struct.storable_picture**]* @listX, i32 0, i64 %147
  %149 = load %struct.storable_picture*** %148, align 8
  %150 = getelementptr inbounds %struct.storable_picture** %149, i64 %145
  %151 = load %struct.storable_picture** %150, align 8
  %152 = icmp ne i32 %128, 0
  br i1 %152, label %153, label %168

; <label>:153                                     ; preds = %138
  %154 = load %struct.InputParameters** @input, align 8
  %155 = getelementptr inbounds %struct.InputParameters* %154, i32 0, i32 48
  %156 = load i32* %155, align 4
  %157 = icmp ne i32 %156, 0
  br i1 %157, label %158, label %168

; <label>:158                                     ; preds = %153
  %159 = sext i16 %ref to i64
  %160 = add nsw i32 %list, %99
  %161 = sext i32 %160 to i64
  %162 = getelementptr inbounds [6 x %struct.storable_picture**]* @listX, i32 0, i64 %161
  %163 = load %struct.storable_picture*** %162, align 8
  %164 = getelementptr inbounds %struct.storable_picture** %163, i64 %159
  %165 = load %struct.storable_picture** %164, align 8
  %166 = getelementptr inbounds %struct.storable_picture* %165, i32 0, i32 29
  %167 = load i16*** %166, align 8
  br label %178

; <label>:168                                     ; preds = %153, %138
  %169 = sext i16 %ref to i64
  %170 = add nsw i32 %list, %99
  %171 = sext i32 %170 to i64
  %172 = getelementptr inbounds [6 x %struct.storable_picture**]* @listX, i32 0, i64 %171
  %173 = load %struct.storable_picture*** %172, align 8
  %174 = getelementptr inbounds %struct.storable_picture** %173, i64 %169
  %175 = load %struct.storable_picture** %174, align 8
  %176 = getelementptr inbounds %struct.storable_picture* %175, i32 0, i32 28
  %177 = load i16*** %176, align 8
  br label %178

; <label>:178                                     ; preds = %168, %158
  %ref_pic.0 = phi i16** [ %167, %158 ], [ %177, %168 ]
  %179 = getelementptr inbounds %struct.storable_picture* %151, i32 0, i32 18
  %180 = load i32* %179, align 4
  %181 = getelementptr inbounds %struct.storable_picture* %151, i32 0, i32 19
  %182 = load i32* %181, align 4
  %183 = getelementptr inbounds %struct.storable_picture* %151, i32 0, i32 18
  %184 = load i32* %183, align 4
  %185 = sub nsw i32 %184, %39
  %186 = add nsw i32 %185, 1
  %187 = shl i32 %186, 2
  %188 = getelementptr inbounds %struct.storable_picture* %151, i32 0, i32 19
  %189 = load i32* %188, align 4
  %190 = sub nsw i32 %189, %45
  %191 = add nsw i32 %190, 1
  %192 = shl i32 %191, 2
  %193 = load i16* %mv_x, align 2
  %194 = sext i16 %193 to i32
  %195 = shl i32 %194, 2
  %196 = trunc i32 %195 to i16
  store i16 %196, i16* %mv_x, align 2
  %197 = load i16* %mv_y, align 2
  %198 = sext i16 %197 to i32
  %199 = shl i32 %198, 2
  %200 = trunc i32 %199 to i16
  store i16 %200, i16* %mv_y, align 2
  %201 = load i16* %mv_x, align 2
  %202 = sext i16 %201 to i32
  %203 = add nsw i32 %46, %202
  %204 = icmp sgt i32 %203, 1
  br i1 %204, label %205, label %223

; <label>:205                                     ; preds = %178
  %206 = load i16* %mv_x, align 2
  %207 = sext i16 %206 to i32
  %208 = add nsw i32 %46, %207
  %209 = sub nsw i32 %187, 2
  %210 = icmp slt i32 %208, %209
  br i1 %210, label %211, label %223

; <label>:211                                     ; preds = %205
  %212 = load i16* %mv_y, align 2
  %213 = sext i16 %212 to i32
  %214 = add nsw i32 %47, %213
  %215 = icmp sgt i32 %214, 1
  br i1 %215, label %216, label %223

; <label>:216                                     ; preds = %211
  %217 = load i16* %mv_y, align 2
  %218 = sext i16 %217 to i32
  %219 = add nsw i32 %47, %218
  %220 = sub nsw i32 %192, 2
  %221 = icmp slt i32 %219, %220
  br i1 %221, label %222, label %223

; <label>:222                                     ; preds = %216
  store i16 (i16**, i32, i32, i32, i32)* @FastPelY_14, i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  br label %224

; <label>:223                                     ; preds = %216, %211, %205, %178
  store i16 (i16**, i32, i32, i32, i32)* @UMVPelY_14, i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  br label %224

; <label>:224                                     ; preds = %223, %222
  br label %225

; <label>:225                                     ; preds = %528, %224
  %pos.0 = phi i32 [ %60, %224 ], [ %529, %528 ]
  %.0 = phi i32 [ %min_mcost, %224 ], [ %.2, %528 ]
  %best_pos.0 = phi i32 [ 0, %224 ], [ %best_pos.2, %528 ]
  %226 = icmp slt i32 %pos.0, %73
  br i1 %226, label %227, label %530

; <label>:227                                     ; preds = %225
  %228 = load i16* %mv_x, align 2
  %229 = sext i16 %228 to i32
  %230 = sext i32 %pos.0 to i64
  %231 = load i32** @spiral_search_x, align 8
  %232 = getelementptr inbounds i32* %231, i64 %230
  %233 = load i32* %232, align 4
  %234 = shl i32 %233, 1
  %235 = add nsw i32 %229, %234
  %236 = load i16* %mv_y, align 2
  %237 = sext i16 %236 to i32
  %238 = sext i32 %pos.0 to i64
  %239 = load i32** @spiral_search_y, align 8
  %240 = getelementptr inbounds i32* %239, i64 %238
  %241 = load i32* %240, align 4
  %242 = shl i32 %241, 1
  %243 = add nsw i32 %237, %242
  %244 = shl i32 %235, 0
  %245 = sext i16 %pred_mv_x to i32
  %246 = sub nsw i32 %244, %245
  %247 = sext i32 %246 to i64
  %248 = load i32** @mvbits, align 8
  %249 = getelementptr inbounds i32* %248, i64 %247
  %250 = load i32* %249, align 4
  %251 = shl i32 %243, 0
  %252 = sext i16 %pred_mv_y to i32
  %253 = sub nsw i32 %251, %252
  %254 = sext i32 %253 to i64
  %255 = load i32** @mvbits, align 8
  %256 = getelementptr inbounds i32* %255, i64 %254
  %257 = load i32* %256, align 4
  %258 = add nsw i32 %250, %257
  %259 = mul nsw i32 %3, %258
  %260 = ashr i32 %259, 16
  %261 = icmp ne i32 %33, 0
  br i1 %261, label %262, label %268

; <label>:262                                     ; preds = %227
  %263 = icmp eq i32 %pos.0, 0
  br i1 %263, label %264, label %268

; <label>:264                                     ; preds = %262
  %265 = mul nsw i32 %3, 16
  %266 = ashr i32 %265, 16
  %267 = sub nsw i32 %260, %266
  br label %268

; <label>:268                                     ; preds = %264, %262, %227
  %mcost.0 = phi i32 [ %267, %264 ], [ %260, %262 ], [ %260, %227 ]
  %269 = icmp sge i32 %mcost.0, %.0
  br i1 %269, label %270, label %271

; <label>:270                                     ; preds = %268
  br label %528

; <label>:271                                     ; preds = %268
  br label %272

; <label>:272                                     ; preds = %513, %271
  %mcost.1 = phi i32 [ %mcost.0, %271 ], [ %mcost.4, %513 ]
  %abort_search.0 = phi i32 [ 0, %271 ], [ %abort_search.1, %513 ]
  %y0.0 = phi i32 [ 0, %271 ], [ %514, %513 ]
  %273 = icmp slt i32 %y0.0, %45
  br i1 %273, label %274, label %277

; <label>:274                                     ; preds = %272
  %275 = icmp ne i32 %abort_search.0, 0
  %276 = xor i1 %275, true
  br label %277

; <label>:277                                     ; preds = %274, %272
  %278 = phi i1 [ false, %272 ], [ %276, %274 ]
  br i1 %278, label %279, label %515

; <label>:279                                     ; preds = %277
  %280 = add nsw i32 %pic_pix_y, %y0.0
  %281 = shl i32 %280, 2
  %282 = add nsw i32 %281, %243
  br label %283

; <label>:283                                     ; preds = %510, %279
  %mcost.2 = phi i32 [ %mcost.1, %279 ], [ %mcost.3, %510 ]
  %x0.0 = phi i32 [ 0, %279 ], [ %511, %510 ]
  %284 = icmp slt i32 %x0.0, %39
  br i1 %284, label %285, label %512

; <label>:285                                     ; preds = %283
  %286 = add nsw i32 %pic_pix_x, %x0.0
  %287 = shl i32 %286, 2
  %288 = add nsw i32 %287, %235
  %289 = getelementptr inbounds [16 x i32]* %diff, i32 0, i32 0
  %290 = sext i32 %y0.0 to i64
  %291 = getelementptr inbounds i16** %orig_pic, i64 %290
  %292 = load i16** %291, align 8
  %293 = sext i32 %x0.0 to i64
  %294 = getelementptr inbounds i16* %292, i64 %293
  %295 = load i16* %294, align 2
  %296 = zext i16 %295 to i32
  %297 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %298 = call zeroext i16 %297(i16** %ref_pic.0, i32 %282, i32 %288, i32 %182, i32 %180)
  %299 = zext i16 %298 to i32
  %300 = sub nsw i32 %296, %299
  %301 = getelementptr inbounds i32* %289, i32 1
  store i32 %300, i32* %289, align 4
  %302 = add nsw i32 %x0.0, 1
  %303 = sext i32 %302 to i64
  %304 = getelementptr inbounds i16* %292, i64 %303
  %305 = load i16* %304, align 2
  %306 = zext i16 %305 to i32
  %307 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %308 = add nsw i32 %288, 4
  %309 = call zeroext i16 %307(i16** %ref_pic.0, i32 %282, i32 %308, i32 %182, i32 %180)
  %310 = zext i16 %309 to i32
  %311 = sub nsw i32 %306, %310
  %312 = getelementptr inbounds i32* %301, i32 1
  store i32 %311, i32* %301, align 4
  %313 = add nsw i32 %x0.0, 2
  %314 = sext i32 %313 to i64
  %315 = getelementptr inbounds i16* %292, i64 %314
  %316 = load i16* %315, align 2
  %317 = zext i16 %316 to i32
  %318 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %319 = add nsw i32 %288, 8
  %320 = call zeroext i16 %318(i16** %ref_pic.0, i32 %282, i32 %319, i32 %182, i32 %180)
  %321 = zext i16 %320 to i32
  %322 = sub nsw i32 %317, %321
  %323 = getelementptr inbounds i32* %312, i32 1
  store i32 %322, i32* %312, align 4
  %324 = add nsw i32 %x0.0, 3
  %325 = sext i32 %324 to i64
  %326 = getelementptr inbounds i16* %292, i64 %325
  %327 = load i16* %326, align 2
  %328 = zext i16 %327 to i32
  %329 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %330 = add nsw i32 %288, 12
  %331 = call zeroext i16 %329(i16** %ref_pic.0, i32 %282, i32 %330, i32 %182, i32 %180)
  %332 = zext i16 %331 to i32
  %333 = sub nsw i32 %328, %332
  %334 = getelementptr inbounds i32* %323, i32 1
  store i32 %333, i32* %323, align 4
  %335 = add nsw i32 %y0.0, 1
  %336 = sext i32 %335 to i64
  %337 = getelementptr inbounds i16** %orig_pic, i64 %336
  %338 = load i16** %337, align 8
  %339 = add nsw i32 %282, 4
  %340 = sext i32 %x0.0 to i64
  %341 = getelementptr inbounds i16* %338, i64 %340
  %342 = load i16* %341, align 2
  %343 = zext i16 %342 to i32
  %344 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %345 = call zeroext i16 %344(i16** %ref_pic.0, i32 %339, i32 %288, i32 %182, i32 %180)
  %346 = zext i16 %345 to i32
  %347 = sub nsw i32 %343, %346
  %348 = getelementptr inbounds i32* %334, i32 1
  store i32 %347, i32* %334, align 4
  %349 = add nsw i32 %x0.0, 1
  %350 = sext i32 %349 to i64
  %351 = getelementptr inbounds i16* %338, i64 %350
  %352 = load i16* %351, align 2
  %353 = zext i16 %352 to i32
  %354 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %355 = add nsw i32 %288, 4
  %356 = call zeroext i16 %354(i16** %ref_pic.0, i32 %339, i32 %355, i32 %182, i32 %180)
  %357 = zext i16 %356 to i32
  %358 = sub nsw i32 %353, %357
  %359 = getelementptr inbounds i32* %348, i32 1
  store i32 %358, i32* %348, align 4
  %360 = add nsw i32 %x0.0, 2
  %361 = sext i32 %360 to i64
  %362 = getelementptr inbounds i16* %338, i64 %361
  %363 = load i16* %362, align 2
  %364 = zext i16 %363 to i32
  %365 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %366 = add nsw i32 %288, 8
  %367 = call zeroext i16 %365(i16** %ref_pic.0, i32 %339, i32 %366, i32 %182, i32 %180)
  %368 = zext i16 %367 to i32
  %369 = sub nsw i32 %364, %368
  %370 = getelementptr inbounds i32* %359, i32 1
  store i32 %369, i32* %359, align 4
  %371 = add nsw i32 %x0.0, 3
  %372 = sext i32 %371 to i64
  %373 = getelementptr inbounds i16* %338, i64 %372
  %374 = load i16* %373, align 2
  %375 = zext i16 %374 to i32
  %376 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %377 = add nsw i32 %288, 12
  %378 = call zeroext i16 %376(i16** %ref_pic.0, i32 %339, i32 %377, i32 %182, i32 %180)
  %379 = zext i16 %378 to i32
  %380 = sub nsw i32 %375, %379
  %381 = getelementptr inbounds i32* %370, i32 1
  store i32 %380, i32* %370, align 4
  %382 = add nsw i32 %y0.0, 2
  %383 = sext i32 %382 to i64
  %384 = getelementptr inbounds i16** %orig_pic, i64 %383
  %385 = load i16** %384, align 8
  %386 = add nsw i32 %282, 8
  %387 = sext i32 %x0.0 to i64
  %388 = getelementptr inbounds i16* %385, i64 %387
  %389 = load i16* %388, align 2
  %390 = zext i16 %389 to i32
  %391 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %392 = call zeroext i16 %391(i16** %ref_pic.0, i32 %386, i32 %288, i32 %182, i32 %180)
  %393 = zext i16 %392 to i32
  %394 = sub nsw i32 %390, %393
  %395 = getelementptr inbounds i32* %381, i32 1
  store i32 %394, i32* %381, align 4
  %396 = add nsw i32 %x0.0, 1
  %397 = sext i32 %396 to i64
  %398 = getelementptr inbounds i16* %385, i64 %397
  %399 = load i16* %398, align 2
  %400 = zext i16 %399 to i32
  %401 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %402 = add nsw i32 %288, 4
  %403 = call zeroext i16 %401(i16** %ref_pic.0, i32 %386, i32 %402, i32 %182, i32 %180)
  %404 = zext i16 %403 to i32
  %405 = sub nsw i32 %400, %404
  %406 = getelementptr inbounds i32* %395, i32 1
  store i32 %405, i32* %395, align 4
  %407 = add nsw i32 %x0.0, 2
  %408 = sext i32 %407 to i64
  %409 = getelementptr inbounds i16* %385, i64 %408
  %410 = load i16* %409, align 2
  %411 = zext i16 %410 to i32
  %412 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %413 = add nsw i32 %288, 8
  %414 = call zeroext i16 %412(i16** %ref_pic.0, i32 %386, i32 %413, i32 %182, i32 %180)
  %415 = zext i16 %414 to i32
  %416 = sub nsw i32 %411, %415
  %417 = getelementptr inbounds i32* %406, i32 1
  store i32 %416, i32* %406, align 4
  %418 = add nsw i32 %x0.0, 3
  %419 = sext i32 %418 to i64
  %420 = getelementptr inbounds i16* %385, i64 %419
  %421 = load i16* %420, align 2
  %422 = zext i16 %421 to i32
  %423 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %424 = add nsw i32 %288, 12
  %425 = call zeroext i16 %423(i16** %ref_pic.0, i32 %386, i32 %424, i32 %182, i32 %180)
  %426 = zext i16 %425 to i32
  %427 = sub nsw i32 %422, %426
  %428 = getelementptr inbounds i32* %417, i32 1
  store i32 %427, i32* %417, align 4
  %429 = add nsw i32 %y0.0, 3
  %430 = sext i32 %429 to i64
  %431 = getelementptr inbounds i16** %orig_pic, i64 %430
  %432 = load i16** %431, align 8
  %433 = add nsw i32 %282, 12
  %434 = sext i32 %x0.0 to i64
  %435 = getelementptr inbounds i16* %432, i64 %434
  %436 = load i16* %435, align 2
  %437 = zext i16 %436 to i32
  %438 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %439 = call zeroext i16 %438(i16** %ref_pic.0, i32 %433, i32 %288, i32 %182, i32 %180)
  %440 = zext i16 %439 to i32
  %441 = sub nsw i32 %437, %440
  %442 = getelementptr inbounds i32* %428, i32 1
  store i32 %441, i32* %428, align 4
  %443 = add nsw i32 %x0.0, 1
  %444 = sext i32 %443 to i64
  %445 = getelementptr inbounds i16* %432, i64 %444
  %446 = load i16* %445, align 2
  %447 = zext i16 %446 to i32
  %448 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %449 = add nsw i32 %288, 4
  %450 = call zeroext i16 %448(i16** %ref_pic.0, i32 %433, i32 %449, i32 %182, i32 %180)
  %451 = zext i16 %450 to i32
  %452 = sub nsw i32 %447, %451
  %453 = getelementptr inbounds i32* %442, i32 1
  store i32 %452, i32* %442, align 4
  %454 = add nsw i32 %x0.0, 2
  %455 = sext i32 %454 to i64
  %456 = getelementptr inbounds i16* %432, i64 %455
  %457 = load i16* %456, align 2
  %458 = zext i16 %457 to i32
  %459 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %460 = add nsw i32 %288, 8
  %461 = call zeroext i16 %459(i16** %ref_pic.0, i32 %433, i32 %460, i32 %182, i32 %180)
  %462 = zext i16 %461 to i32
  %463 = sub nsw i32 %458, %462
  %464 = getelementptr inbounds i32* %453, i32 1
  store i32 %463, i32* %453, align 4
  %465 = add nsw i32 %x0.0, 3
  %466 = sext i32 %465 to i64
  %467 = getelementptr inbounds i16* %432, i64 %466
  %468 = load i16* %467, align 2
  %469 = zext i16 %468 to i32
  %470 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %471 = add nsw i32 %288, 12
  %472 = call zeroext i16 %470(i16** %ref_pic.0, i32 %433, i32 %471, i32 %182, i32 %180)
  %473 = zext i16 %472 to i32
  %474 = sub nsw i32 %469, %473
  store i32 %474, i32* %464, align 4
  %475 = load %struct.InputParameters** @input, align 8
  %476 = getelementptr inbounds %struct.InputParameters* %475, i32 0, i32 123
  %477 = load i32* %476, align 4
  %478 = icmp ne i32 %477, 0
  br i1 %478, label %486, label %479

; <label>:479                                     ; preds = %285
  %480 = getelementptr inbounds [16 x i32]* %diff, i32 0, i32 0
  %481 = call i32 @SATD(i32* %480, i32 %139)
  %482 = add nsw i32 %mcost.2, %481
  %483 = icmp sgt i32 %482, %.0
  br i1 %483, label %484, label %485

; <label>:484                                     ; preds = %479
  br label %512

; <label>:485                                     ; preds = %479
  br label %509

; <label>:486                                     ; preds = %285
  br label %487

; <label>:487                                     ; preds = %506, %486
  %k.0 = phi i32 [ 0, %486 ], [ %k.1, %506 ]
  %j.0 = phi i32 [ 0, %486 ], [ %507, %506 ]
  %488 = icmp slt i32 %j.0, 4
  br i1 %488, label %489, label %508

; <label>:489                                     ; preds = %487
  br label %490

; <label>:490                                     ; preds = %502, %489
  %k.1 = phi i32 [ %k.0, %489 ], [ %504, %502 ]
  %i.0 = phi i32 [ 0, %489 ], [ %503, %502 ]
  %491 = icmp slt i32 %i.0, 4
  br i1 %491, label %492, label %505

; <label>:492                                     ; preds = %490
  %493 = sext i32 %k.1 to i64
  %494 = getelementptr inbounds [16 x i32]* %diff, i32 0, i64 %493
  %495 = load i32* %494, align 4
  %496 = add nsw i32 %x0.0, %i.0
  %497 = sext i32 %496 to i64
  %498 = add nsw i32 %y0.0, %j.0
  %499 = sext i32 %498 to i64
  %500 = getelementptr inbounds [16 x [16 x i32]]* %curr_diff, i32 0, i64 %499
  %501 = getelementptr inbounds [16 x i32]* %500, i32 0, i64 %497
  store i32 %495, i32* %501, align 4
  br label %502

; <label>:502                                     ; preds = %492
  %503 = add nsw i32 %i.0, 1
  %504 = add nsw i32 %k.1, 1
  br label %490

; <label>:505                                     ; preds = %490
  br label %506

; <label>:506                                     ; preds = %505
  %507 = add nsw i32 %j.0, 1
  br label %487

; <label>:508                                     ; preds = %487
  br label %509

; <label>:509                                     ; preds = %508, %485
  %mcost.3 = phi i32 [ %mcost.2, %508 ], [ %482, %485 ]
  br label %510

; <label>:510                                     ; preds = %509
  %511 = add nsw i32 %x0.0, 4
  br label %283

; <label>:512                                     ; preds = %484, %283
  %mcost.4 = phi i32 [ %482, %484 ], [ %mcost.2, %283 ]
  %abort_search.1 = phi i32 [ 1, %484 ], [ %abort_search.0, %283 ]
  br label %513

; <label>:513                                     ; preds = %512
  %514 = add nsw i32 %y0.0, 4
  br label %272

; <label>:515                                     ; preds = %277
  %516 = load %struct.InputParameters** @input, align 8
  %517 = getelementptr inbounds %struct.InputParameters* %516, i32 0, i32 123
  %518 = load i32* %517, align 4
  %519 = icmp ne i32 %518, 0
  br i1 %519, label %520, label %524

; <label>:520                                     ; preds = %515
  %521 = getelementptr inbounds [16 x [16 x i32]]* %curr_diff, i32 0, i32 0
  %522 = call i32 @find_SATD([16 x i32]* %521, i32 %139, i32 %blocktype)
  %523 = add nsw i32 %mcost.1, %522
  br label %524

; <label>:524                                     ; preds = %520, %515
  %mcost.5 = phi i32 [ %523, %520 ], [ %mcost.1, %515 ]
  %525 = icmp slt i32 %mcost.5, %.0
  br i1 %525, label %526, label %527

; <label>:526                                     ; preds = %524
  br label %527

; <label>:527                                     ; preds = %526, %524
  %.1 = phi i32 [ %mcost.5, %526 ], [ %.0, %524 ]
  %best_pos.1 = phi i32 [ %pos.0, %526 ], [ %best_pos.0, %524 ]
  br label %528

; <label>:528                                     ; preds = %527, %270
  %.2 = phi i32 [ %.0, %270 ], [ %.1, %527 ]
  %best_pos.2 = phi i32 [ %best_pos.0, %270 ], [ %best_pos.1, %527 ]
  %529 = add nsw i32 %pos.0, 1
  br label %225

; <label>:530                                     ; preds = %225
  %531 = icmp ne i32 %best_pos.0, 0
  br i1 %531, label %532, label %551

; <label>:532                                     ; preds = %530
  %533 = sext i32 %best_pos.0 to i64
  %534 = load i32** @spiral_search_x, align 8
  %535 = getelementptr inbounds i32* %534, i64 %533
  %536 = load i32* %535, align 4
  %537 = shl i32 %536, 1
  %538 = load i16* %mv_x, align 2
  %539 = sext i16 %538 to i32
  %540 = add nsw i32 %539, %537
  %541 = trunc i32 %540 to i16
  store i16 %541, i16* %mv_x, align 2
  %542 = sext i32 %best_pos.0 to i64
  %543 = load i32** @spiral_search_y, align 8
  %544 = getelementptr inbounds i32* %543, i64 %542
  %545 = load i32* %544, align 4
  %546 = shl i32 %545, 1
  %547 = load i16* %mv_y, align 2
  %548 = sext i16 %547 to i32
  %549 = add nsw i32 %548, %546
  %550 = trunc i32 %549 to i16
  store i16 %550, i16* %mv_y, align 2
  br label %551

; <label>:551                                     ; preds = %532, %530
  %552 = load %struct.InputParameters** @input, align 8
  %553 = getelementptr inbounds %struct.InputParameters* %552, i32 0, i32 7
  %554 = load i32* %553, align 4
  %555 = icmp ne i32 %554, 0
  br i1 %555, label %556, label %557

; <label>:556                                     ; preds = %551
  br label %557

; <label>:557                                     ; preds = %556, %551
  %.3 = phi i32 [ 2147483647, %556 ], [ %.0, %551 ]
  %558 = load i16* %mv_x, align 2
  %559 = sext i16 %558 to i32
  %560 = add nsw i32 %46, %559
  %561 = icmp sgt i32 %560, 1
  br i1 %561, label %562, label %580

; <label>:562                                     ; preds = %557
  %563 = load i16* %mv_x, align 2
  %564 = sext i16 %563 to i32
  %565 = add nsw i32 %46, %564
  %566 = sub nsw i32 %187, 1
  %567 = icmp slt i32 %565, %566
  br i1 %567, label %568, label %580

; <label>:568                                     ; preds = %562
  %569 = load i16* %mv_y, align 2
  %570 = sext i16 %569 to i32
  %571 = add nsw i32 %47, %570
  %572 = icmp sgt i32 %571, 1
  br i1 %572, label %573, label %580

; <label>:573                                     ; preds = %568
  %574 = load i16* %mv_y, align 2
  %575 = sext i16 %574 to i32
  %576 = add nsw i32 %47, %575
  %577 = sub nsw i32 %192, 1
  %578 = icmp slt i32 %576, %577
  br i1 %578, label %579, label %580

; <label>:579                                     ; preds = %573
  store i16 (i16**, i32, i32, i32, i32)* @FastPelY_14, i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  br label %581

; <label>:580                                     ; preds = %573, %568, %562, %557
  store i16 (i16**, i32, i32, i32, i32)* @UMVPelY_14, i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  br label %581

; <label>:581                                     ; preds = %580, %579
  br label %582

; <label>:582                                     ; preds = %881, %581
  %pos.1 = phi i32 [ %144, %581 ], [ %882, %881 ]
  %.4 = phi i32 [ %.3, %581 ], [ %.6, %881 ]
  %best_pos.3 = phi i32 [ 0, %581 ], [ %best_pos.5, %881 ]
  %583 = icmp slt i32 %pos.1, %search_pos4
  br i1 %583, label %584, label %883

; <label>:584                                     ; preds = %582
  %585 = load i16* %mv_x, align 2
  %586 = sext i16 %585 to i32
  %587 = sext i32 %pos.1 to i64
  %588 = load i32** @spiral_search_x, align 8
  %589 = getelementptr inbounds i32* %588, i64 %587
  %590 = load i32* %589, align 4
  %591 = add nsw i32 %586, %590
  %592 = load i16* %mv_y, align 2
  %593 = sext i16 %592 to i32
  %594 = sext i32 %pos.1 to i64
  %595 = load i32** @spiral_search_y, align 8
  %596 = getelementptr inbounds i32* %595, i64 %594
  %597 = load i32* %596, align 4
  %598 = add nsw i32 %593, %597
  %599 = shl i32 %591, 0
  %600 = sext i16 %pred_mv_x to i32
  %601 = sub nsw i32 %599, %600
  %602 = sext i32 %601 to i64
  %603 = load i32** @mvbits, align 8
  %604 = getelementptr inbounds i32* %603, i64 %602
  %605 = load i32* %604, align 4
  %606 = shl i32 %598, 0
  %607 = sext i16 %pred_mv_y to i32
  %608 = sub nsw i32 %606, %607
  %609 = sext i32 %608 to i64
  %610 = load i32** @mvbits, align 8
  %611 = getelementptr inbounds i32* %610, i64 %609
  %612 = load i32* %611, align 4
  %613 = add nsw i32 %605, %612
  %614 = mul nsw i32 %3, %613
  %615 = ashr i32 %614, 16
  %616 = icmp sge i32 %615, %.4
  br i1 %616, label %617, label %618

; <label>:617                                     ; preds = %584
  br label %881

; <label>:618                                     ; preds = %584
  br label %619

; <label>:619                                     ; preds = %863, %618
  %mcost.6 = phi i32 [ %615, %618 ], [ %mcost.9, %863 ]
  %abort_search.2 = phi i32 [ 0, %618 ], [ %abort_search.3, %863 ]
  %y0.1 = phi i32 [ 0, %618 ], [ %864, %863 ]
  %620 = icmp slt i32 %y0.1, %45
  br i1 %620, label %621, label %624

; <label>:621                                     ; preds = %619
  %622 = icmp ne i32 %abort_search.2, 0
  %623 = xor i1 %622, true
  br label %624

; <label>:624                                     ; preds = %621, %619
  %625 = phi i1 [ false, %619 ], [ %623, %621 ]
  br i1 %625, label %626, label %865

; <label>:626                                     ; preds = %624
  %627 = add nsw i32 %pic_pix_y, %y0.1
  %628 = shl i32 %627, 2
  %629 = add nsw i32 %628, %598
  br label %630

; <label>:630                                     ; preds = %860, %626
  %mcost.7 = phi i32 [ %mcost.6, %626 ], [ %mcost.8, %860 ]
  %x0.1 = phi i32 [ 0, %626 ], [ %861, %860 ]
  %631 = icmp slt i32 %x0.1, %39
  br i1 %631, label %632, label %862

; <label>:632                                     ; preds = %630
  %633 = add nsw i32 %pic_pix_x, %x0.1
  %634 = shl i32 %633, 2
  %635 = add nsw i32 %634, %591
  %636 = getelementptr inbounds [16 x i32]* %diff, i32 0, i32 0
  %637 = sext i32 %y0.1 to i64
  %638 = getelementptr inbounds i16** %orig_pic, i64 %637
  %639 = load i16** %638, align 8
  %640 = sext i32 %x0.1 to i64
  %641 = getelementptr inbounds i16* %639, i64 %640
  %642 = load i16* %641, align 2
  %643 = zext i16 %642 to i32
  %644 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %645 = call zeroext i16 %644(i16** %ref_pic.0, i32 %629, i32 %635, i32 %182, i32 %180)
  %646 = zext i16 %645 to i32
  %647 = sub nsw i32 %643, %646
  %648 = getelementptr inbounds i32* %636, i32 1
  store i32 %647, i32* %636, align 4
  %649 = add nsw i32 %x0.1, 1
  %650 = sext i32 %649 to i64
  %651 = getelementptr inbounds i16* %639, i64 %650
  %652 = load i16* %651, align 2
  %653 = zext i16 %652 to i32
  %654 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %655 = add nsw i32 %635, 4
  %656 = call zeroext i16 %654(i16** %ref_pic.0, i32 %629, i32 %655, i32 %182, i32 %180)
  %657 = zext i16 %656 to i32
  %658 = sub nsw i32 %653, %657
  %659 = getelementptr inbounds i32* %648, i32 1
  store i32 %658, i32* %648, align 4
  %660 = add nsw i32 %x0.1, 2
  %661 = sext i32 %660 to i64
  %662 = getelementptr inbounds i16* %639, i64 %661
  %663 = load i16* %662, align 2
  %664 = zext i16 %663 to i32
  %665 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %666 = add nsw i32 %635, 8
  %667 = call zeroext i16 %665(i16** %ref_pic.0, i32 %629, i32 %666, i32 %182, i32 %180)
  %668 = zext i16 %667 to i32
  %669 = sub nsw i32 %664, %668
  %670 = getelementptr inbounds i32* %659, i32 1
  store i32 %669, i32* %659, align 4
  %671 = add nsw i32 %x0.1, 3
  %672 = sext i32 %671 to i64
  %673 = getelementptr inbounds i16* %639, i64 %672
  %674 = load i16* %673, align 2
  %675 = zext i16 %674 to i32
  %676 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %677 = add nsw i32 %635, 12
  %678 = call zeroext i16 %676(i16** %ref_pic.0, i32 %629, i32 %677, i32 %182, i32 %180)
  %679 = zext i16 %678 to i32
  %680 = sub nsw i32 %675, %679
  %681 = getelementptr inbounds i32* %670, i32 1
  store i32 %680, i32* %670, align 4
  %682 = add nsw i32 %y0.1, 1
  %683 = sext i32 %682 to i64
  %684 = getelementptr inbounds i16** %orig_pic, i64 %683
  %685 = load i16** %684, align 8
  %686 = add nsw i32 %629, 4
  %687 = sext i32 %x0.1 to i64
  %688 = getelementptr inbounds i16* %685, i64 %687
  %689 = load i16* %688, align 2
  %690 = zext i16 %689 to i32
  %691 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %692 = call zeroext i16 %691(i16** %ref_pic.0, i32 %686, i32 %635, i32 %182, i32 %180)
  %693 = zext i16 %692 to i32
  %694 = sub nsw i32 %690, %693
  %695 = getelementptr inbounds i32* %681, i32 1
  store i32 %694, i32* %681, align 4
  %696 = add nsw i32 %x0.1, 1
  %697 = sext i32 %696 to i64
  %698 = getelementptr inbounds i16* %685, i64 %697
  %699 = load i16* %698, align 2
  %700 = zext i16 %699 to i32
  %701 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %702 = add nsw i32 %635, 4
  %703 = call zeroext i16 %701(i16** %ref_pic.0, i32 %686, i32 %702, i32 %182, i32 %180)
  %704 = zext i16 %703 to i32
  %705 = sub nsw i32 %700, %704
  %706 = getelementptr inbounds i32* %695, i32 1
  store i32 %705, i32* %695, align 4
  %707 = add nsw i32 %x0.1, 2
  %708 = sext i32 %707 to i64
  %709 = getelementptr inbounds i16* %685, i64 %708
  %710 = load i16* %709, align 2
  %711 = zext i16 %710 to i32
  %712 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %713 = add nsw i32 %635, 8
  %714 = call zeroext i16 %712(i16** %ref_pic.0, i32 %686, i32 %713, i32 %182, i32 %180)
  %715 = zext i16 %714 to i32
  %716 = sub nsw i32 %711, %715
  %717 = getelementptr inbounds i32* %706, i32 1
  store i32 %716, i32* %706, align 4
  %718 = add nsw i32 %x0.1, 3
  %719 = sext i32 %718 to i64
  %720 = getelementptr inbounds i16* %685, i64 %719
  %721 = load i16* %720, align 2
  %722 = zext i16 %721 to i32
  %723 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %724 = add nsw i32 %635, 12
  %725 = call zeroext i16 %723(i16** %ref_pic.0, i32 %686, i32 %724, i32 %182, i32 %180)
  %726 = zext i16 %725 to i32
  %727 = sub nsw i32 %722, %726
  %728 = getelementptr inbounds i32* %717, i32 1
  store i32 %727, i32* %717, align 4
  %729 = add nsw i32 %y0.1, 2
  %730 = sext i32 %729 to i64
  %731 = getelementptr inbounds i16** %orig_pic, i64 %730
  %732 = load i16** %731, align 8
  %733 = add nsw i32 %629, 8
  %734 = sext i32 %x0.1 to i64
  %735 = getelementptr inbounds i16* %732, i64 %734
  %736 = load i16* %735, align 2
  %737 = zext i16 %736 to i32
  %738 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %739 = call zeroext i16 %738(i16** %ref_pic.0, i32 %733, i32 %635, i32 %182, i32 %180)
  %740 = zext i16 %739 to i32
  %741 = sub nsw i32 %737, %740
  %742 = getelementptr inbounds i32* %728, i32 1
  store i32 %741, i32* %728, align 4
  %743 = add nsw i32 %x0.1, 1
  %744 = sext i32 %743 to i64
  %745 = getelementptr inbounds i16* %732, i64 %744
  %746 = load i16* %745, align 2
  %747 = zext i16 %746 to i32
  %748 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %749 = add nsw i32 %635, 4
  %750 = call zeroext i16 %748(i16** %ref_pic.0, i32 %733, i32 %749, i32 %182, i32 %180)
  %751 = zext i16 %750 to i32
  %752 = sub nsw i32 %747, %751
  %753 = getelementptr inbounds i32* %742, i32 1
  store i32 %752, i32* %742, align 4
  %754 = add nsw i32 %x0.1, 2
  %755 = sext i32 %754 to i64
  %756 = getelementptr inbounds i16* %732, i64 %755
  %757 = load i16* %756, align 2
  %758 = zext i16 %757 to i32
  %759 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %760 = add nsw i32 %635, 8
  %761 = call zeroext i16 %759(i16** %ref_pic.0, i32 %733, i32 %760, i32 %182, i32 %180)
  %762 = zext i16 %761 to i32
  %763 = sub nsw i32 %758, %762
  %764 = getelementptr inbounds i32* %753, i32 1
  store i32 %763, i32* %753, align 4
  %765 = add nsw i32 %x0.1, 3
  %766 = sext i32 %765 to i64
  %767 = getelementptr inbounds i16* %732, i64 %766
  %768 = load i16* %767, align 2
  %769 = zext i16 %768 to i32
  %770 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %771 = add nsw i32 %635, 12
  %772 = call zeroext i16 %770(i16** %ref_pic.0, i32 %733, i32 %771, i32 %182, i32 %180)
  %773 = zext i16 %772 to i32
  %774 = sub nsw i32 %769, %773
  %775 = getelementptr inbounds i32* %764, i32 1
  store i32 %774, i32* %764, align 4
  %776 = add nsw i32 %y0.1, 3
  %777 = sext i32 %776 to i64
  %778 = getelementptr inbounds i16** %orig_pic, i64 %777
  %779 = load i16** %778, align 8
  %780 = add nsw i32 %629, 12
  %781 = sext i32 %x0.1 to i64
  %782 = getelementptr inbounds i16* %779, i64 %781
  %783 = load i16* %782, align 2
  %784 = zext i16 %783 to i32
  %785 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %786 = call zeroext i16 %785(i16** %ref_pic.0, i32 %780, i32 %635, i32 %182, i32 %180)
  %787 = zext i16 %786 to i32
  %788 = sub nsw i32 %784, %787
  %789 = getelementptr inbounds i32* %775, i32 1
  store i32 %788, i32* %775, align 4
  %790 = add nsw i32 %x0.1, 1
  %791 = sext i32 %790 to i64
  %792 = getelementptr inbounds i16* %779, i64 %791
  %793 = load i16* %792, align 2
  %794 = zext i16 %793 to i32
  %795 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %796 = add nsw i32 %635, 4
  %797 = call zeroext i16 %795(i16** %ref_pic.0, i32 %780, i32 %796, i32 %182, i32 %180)
  %798 = zext i16 %797 to i32
  %799 = sub nsw i32 %794, %798
  %800 = getelementptr inbounds i32* %789, i32 1
  store i32 %799, i32* %789, align 4
  %801 = add nsw i32 %x0.1, 2
  %802 = sext i32 %801 to i64
  %803 = getelementptr inbounds i16* %779, i64 %802
  %804 = load i16* %803, align 2
  %805 = zext i16 %804 to i32
  %806 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %807 = add nsw i32 %635, 8
  %808 = call zeroext i16 %806(i16** %ref_pic.0, i32 %780, i32 %807, i32 %182, i32 %180)
  %809 = zext i16 %808 to i32
  %810 = sub nsw i32 %805, %809
  %811 = getelementptr inbounds i32* %800, i32 1
  store i32 %810, i32* %800, align 4
  %812 = add nsw i32 %x0.1, 3
  %813 = sext i32 %812 to i64
  %814 = getelementptr inbounds i16* %779, i64 %813
  %815 = load i16* %814, align 2
  %816 = zext i16 %815 to i32
  %817 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %818 = add nsw i32 %635, 12
  %819 = call zeroext i16 %817(i16** %ref_pic.0, i32 %780, i32 %818, i32 %182, i32 %180)
  %820 = zext i16 %819 to i32
  %821 = sub nsw i32 %816, %820
  store i32 %821, i32* %811, align 4
  %822 = load %struct.InputParameters** @input, align 8
  %823 = getelementptr inbounds %struct.InputParameters* %822, i32 0, i32 123
  %824 = load i32* %823, align 4
  %825 = icmp ne i32 %824, 0
  br i1 %825, label %836, label %826

; <label>:826                                     ; preds = %632
  %827 = getelementptr inbounds [16 x i32]* %diff, i32 0, i32 0
  %828 = load %struct.InputParameters** @input, align 8
  %829 = getelementptr inbounds %struct.InputParameters* %828, i32 0, i32 6
  %830 = load i32* %829, align 4
  %831 = call i32 @SATD(i32* %827, i32 %830)
  %832 = add nsw i32 %mcost.7, %831
  %833 = icmp sgt i32 %832, %.4
  br i1 %833, label %834, label %835

; <label>:834                                     ; preds = %826
  br label %862

; <label>:835                                     ; preds = %826
  br label %859

; <label>:836                                     ; preds = %632
  br label %837

; <label>:837                                     ; preds = %856, %836
  %k.2 = phi i32 [ 0, %836 ], [ %k.3, %856 ]
  %j.1 = phi i32 [ 0, %836 ], [ %857, %856 ]
  %838 = icmp slt i32 %j.1, 4
  br i1 %838, label %839, label %858

; <label>:839                                     ; preds = %837
  br label %840

; <label>:840                                     ; preds = %852, %839
  %k.3 = phi i32 [ %k.2, %839 ], [ %854, %852 ]
  %i.1 = phi i32 [ 0, %839 ], [ %853, %852 ]
  %841 = icmp slt i32 %i.1, 4
  br i1 %841, label %842, label %855

; <label>:842                                     ; preds = %840
  %843 = sext i32 %k.3 to i64
  %844 = getelementptr inbounds [16 x i32]* %diff, i32 0, i64 %843
  %845 = load i32* %844, align 4
  %846 = add nsw i32 %x0.1, %i.1
  %847 = sext i32 %846 to i64
  %848 = add nsw i32 %y0.1, %j.1
  %849 = sext i32 %848 to i64
  %850 = getelementptr inbounds [16 x [16 x i32]]* %curr_diff, i32 0, i64 %849
  %851 = getelementptr inbounds [16 x i32]* %850, i32 0, i64 %847
  store i32 %845, i32* %851, align 4
  br label %852

; <label>:852                                     ; preds = %842
  %853 = add nsw i32 %i.1, 1
  %854 = add nsw i32 %k.3, 1
  br label %840

; <label>:855                                     ; preds = %840
  br label %856

; <label>:856                                     ; preds = %855
  %857 = add nsw i32 %j.1, 1
  br label %837

; <label>:858                                     ; preds = %837
  br label %859

; <label>:859                                     ; preds = %858, %835
  %mcost.8 = phi i32 [ %mcost.7, %858 ], [ %832, %835 ]
  br label %860

; <label>:860                                     ; preds = %859
  %861 = add nsw i32 %x0.1, 4
  br label %630

; <label>:862                                     ; preds = %834, %630
  %mcost.9 = phi i32 [ %832, %834 ], [ %mcost.7, %630 ]
  %abort_search.3 = phi i32 [ 1, %834 ], [ %abort_search.2, %630 ]
  br label %863

; <label>:863                                     ; preds = %862
  %864 = add nsw i32 %y0.1, 4
  br label %619

; <label>:865                                     ; preds = %624
  %866 = load %struct.InputParameters** @input, align 8
  %867 = getelementptr inbounds %struct.InputParameters* %866, i32 0, i32 123
  %868 = load i32* %867, align 4
  %869 = icmp ne i32 %868, 0
  br i1 %869, label %870, label %877

; <label>:870                                     ; preds = %865
  %871 = getelementptr inbounds [16 x [16 x i32]]* %curr_diff, i32 0, i32 0
  %872 = load %struct.InputParameters** @input, align 8
  %873 = getelementptr inbounds %struct.InputParameters* %872, i32 0, i32 6
  %874 = load i32* %873, align 4
  %875 = call i32 @find_SATD([16 x i32]* %871, i32 %874, i32 %blocktype)
  %876 = add nsw i32 %mcost.6, %875
  br label %877

; <label>:877                                     ; preds = %870, %865
  %mcost.10 = phi i32 [ %876, %870 ], [ %mcost.6, %865 ]
  %878 = icmp slt i32 %mcost.10, %.4
  br i1 %878, label %879, label %880

; <label>:879                                     ; preds = %877
  br label %880

; <label>:880                                     ; preds = %879, %877
  %.5 = phi i32 [ %mcost.10, %879 ], [ %.4, %877 ]
  %best_pos.4 = phi i32 [ %pos.1, %879 ], [ %best_pos.3, %877 ]
  br label %881

; <label>:881                                     ; preds = %880, %617
  %.6 = phi i32 [ %.4, %617 ], [ %.5, %880 ]
  %best_pos.5 = phi i32 [ %best_pos.3, %617 ], [ %best_pos.4, %880 ]
  %882 = add nsw i32 %pos.1, 1
  br label %582

; <label>:883                                     ; preds = %582
  %884 = icmp ne i32 %best_pos.3, 0
  br i1 %884, label %885, label %902

; <label>:885                                     ; preds = %883
  %886 = sext i32 %best_pos.3 to i64
  %887 = load i32** @spiral_search_x, align 8
  %888 = getelementptr inbounds i32* %887, i64 %886
  %889 = load i32* %888, align 4
  %890 = load i16* %mv_x, align 2
  %891 = sext i16 %890 to i32
  %892 = add nsw i32 %891, %889
  %893 = trunc i32 %892 to i16
  store i16 %893, i16* %mv_x, align 2
  %894 = sext i32 %best_pos.3 to i64
  %895 = load i32** @spiral_search_y, align 8
  %896 = getelementptr inbounds i32* %895, i64 %894
  %897 = load i32* %896, align 4
  %898 = load i16* %mv_y, align 2
  %899 = sext i16 %898 to i32
  %900 = add nsw i32 %899, %897
  %901 = trunc i32 %900 to i16
  store i16 %901, i16* %mv_y, align 2
  br label %902

; <label>:902                                     ; preds = %885, %883
  ret i32 %.4
}

declare zeroext i16 @FastPelY_14(i16**, i32, i32, i32, i32) #2

declare zeroext i16 @UMVPelY_14(i16**, i32, i32, i32, i32) #2

; Function Attrs: nounwind uwtable
define i32 @FullPelBlockMotionBiPred(i16** %orig_pic, i16 signext %ref, i32 %list, i32 %pic_pix_x, i32 %pic_pix_y, i32 %blocktype, i32 %iteration, i16 signext %pred_mv_x1, i16 signext %pred_mv_y1, i16 signext %pred_mv_x2, i16 signext %pred_mv_y2, i16* %mv_x, i16* %mv_y, i16* %s_mv_x, i16* %s_mv_y, i32 %search_range, i32 %min_mcost, double %lambda) #0 {
  %1 = load %struct.ImageParameters** @img, align 8
  %2 = getelementptr inbounds %struct.ImageParameters* %1, i32 0, i32 90
  %3 = load i32* %2, align 4
  %4 = icmp ne i32 %3, 0
  br i1 %4, label %5, label %24

; <label>:5                                       ; preds = %0
  %6 = load %struct.ImageParameters** @img, align 8
  %7 = getelementptr inbounds %struct.ImageParameters* %6, i32 0, i32 3
  %8 = load i32* %7, align 4
  %9 = sext i32 %8 to i64
  %10 = load %struct.ImageParameters** @img, align 8
  %11 = getelementptr inbounds %struct.ImageParameters* %10, i32 0, i32 51
  %12 = load %struct.macroblock** %11, align 8
  %13 = getelementptr inbounds %struct.macroblock* %12, i64 %9
  %14 = getelementptr inbounds %struct.macroblock* %13, i32 0, i32 22
  %15 = load i32* %14, align 4
  %16 = icmp ne i32 %15, 0
  br i1 %16, label %17, label %24

; <label>:17                                      ; preds = %5
  %18 = load %struct.ImageParameters** @img, align 8
  %19 = getelementptr inbounds %struct.ImageParameters* %18, i32 0, i32 3
  %20 = load i32* %19, align 4
  %21 = srem i32 %20, 2
  %22 = icmp ne i32 %21, 0
  %23 = select i1 %22, i32 4, i32 2
  br label %25

; <label>:24                                      ; preds = %5, %0
  br label %25

; <label>:25                                      ; preds = %24, %17
  %26 = phi i32 [ %23, %17 ], [ 0, %24 ]
  %27 = sext i16 %ref to i64
  %28 = add nsw i32 %list, %26
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds [6 x %struct.storable_picture**]* @listX, i32 0, i64 %29
  %31 = load %struct.storable_picture*** %30, align 8
  %32 = getelementptr inbounds %struct.storable_picture** %31, i64 %27
  %33 = load %struct.storable_picture** %32, align 8
  %34 = getelementptr inbounds %struct.storable_picture* %33, i32 0, i32 26
  %35 = load i16** %34, align 8
  %36 = icmp eq i32 %list, 0
  br i1 %36, label %37, label %39

; <label>:37                                      ; preds = %25
  %38 = add nsw i32 1, %26
  br label %40

; <label>:39                                      ; preds = %25
  br label %40

; <label>:40                                      ; preds = %39, %37
  %41 = phi i32 [ %38, %37 ], [ %26, %39 ]
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds [6 x %struct.storable_picture**]* @listX, i32 0, i64 %42
  %44 = load %struct.storable_picture*** %43, align 8
  %45 = getelementptr inbounds %struct.storable_picture** %44, i64 0
  %46 = load %struct.storable_picture** %45, align 8
  %47 = getelementptr inbounds %struct.storable_picture* %46, i32 0, i32 26
  %48 = load i16** %47, align 8
  %49 = sext i16 %ref to i64
  %50 = add nsw i32 %list, %26
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds [6 x %struct.storable_picture**]* @listX, i32 0, i64 %51
  %53 = load %struct.storable_picture*** %52, align 8
  %54 = getelementptr inbounds %struct.storable_picture** %53, i64 %49
  %55 = load %struct.storable_picture** %54, align 8
  %56 = getelementptr inbounds %struct.storable_picture* %55, i32 0, i32 18
  %57 = load i32* %56, align 4
  %58 = sext i16 %ref to i64
  %59 = add nsw i32 %list, %26
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds [6 x %struct.storable_picture**]* @listX, i32 0, i64 %60
  %62 = load %struct.storable_picture*** %61, align 8
  %63 = getelementptr inbounds %struct.storable_picture** %62, i64 %58
  %64 = load %struct.storable_picture** %63, align 8
  %65 = getelementptr inbounds %struct.storable_picture* %64, i32 0, i32 19
  %66 = load i32* %65, align 4
  %67 = mul nsw i32 2, %search_range
  %68 = add nsw i32 %67, 1
  %69 = mul nsw i32 2, %search_range
  %70 = add nsw i32 %69, 1
  %71 = mul nsw i32 %68, %70
  %72 = fmul double 6.553600e+04, %lambda
  %73 = fadd double %72, 5.000000e-01
  %74 = fptosi double %73 to i32
  %75 = sext i32 %blocktype to i64
  %76 = load %struct.InputParameters** @input, align 8
  %77 = getelementptr inbounds %struct.InputParameters* %76, i32 0, i32 20
  %78 = getelementptr inbounds [8 x [2 x i32]]* %77, i32 0, i64 %75
  %79 = getelementptr inbounds [2 x i32]* %78, i32 0, i64 1
  %80 = load i32* %79, align 4
  %81 = sext i32 %blocktype to i64
  %82 = load %struct.InputParameters** @input, align 8
  %83 = getelementptr inbounds %struct.InputParameters* %82, i32 0, i32 20
  %84 = getelementptr inbounds [8 x [2 x i32]]* %83, i32 0, i64 %81
  %85 = getelementptr inbounds [2 x i32]* %84, i32 0, i64 0
  %86 = load i32* %85, align 4
  %87 = ashr i32 %86, 2
  %88 = shl i32 %pic_pix_x, 2
  %89 = sext i16 %pred_mv_x1 to i32
  %90 = add nsw i32 %88, %89
  %91 = shl i32 %pic_pix_y, 2
  %92 = sext i16 %pred_mv_y1 to i32
  %93 = add nsw i32 %91, %92
  %94 = shl i32 %pic_pix_x, 2
  %95 = sext i16 %pred_mv_x2 to i32
  %96 = add nsw i32 %94, %95
  %97 = shl i32 %pic_pix_y, 2
  %98 = sext i16 %pred_mv_y2 to i32
  %99 = add nsw i32 %97, %98
  %100 = load i16* %mv_x, align 2
  %101 = sext i16 %100 to i32
  %102 = add nsw i32 %pic_pix_x, %101
  %103 = trunc i32 %102 to i16
  %104 = load i16* %mv_y, align 2
  %105 = sext i16 %104 to i32
  %106 = add nsw i32 %pic_pix_y, %105
  %107 = trunc i32 %106 to i16
  %108 = load i16* %s_mv_x, align 2
  %109 = sext i16 %108 to i32
  %110 = add nsw i32 %pic_pix_x, %109
  %111 = trunc i32 %110 to i16
  %112 = load i16* %s_mv_y, align 2
  %113 = sext i16 %112 to i32
  %114 = add nsw i32 %pic_pix_y, %113
  %115 = trunc i32 %114 to i16
  %116 = load %struct.pic_parameter_set_rbsp_t** @active_pps, align 8
  %117 = getelementptr inbounds %struct.pic_parameter_set_rbsp_t* %116, i32 0, i32 20
  %118 = load i32* %117, align 4
  %119 = icmp ugt i32 %118, 0
  %120 = zext i1 %119 to i32
  %121 = trunc i32 %120 to i16
  %122 = sext i16 %121 to i32
  %123 = icmp ne i32 %122, 0
  br i1 %123, label %124, label %153

; <label>:124                                     ; preds = %40
  %125 = icmp eq i32 %list, 0
  br i1 %125, label %126, label %138

; <label>:126                                     ; preds = %124
  %127 = sext i16 %ref to i64
  %128 = sext i32 %26 to i64
  %129 = load i32***** @wbp_weight, align 8
  %130 = getelementptr inbounds i32**** %129, i64 %128
  %131 = load i32**** %130, align 8
  %132 = getelementptr inbounds i32*** %131, i64 %127
  %133 = load i32*** %132, align 8
  %134 = getelementptr inbounds i32** %133, i64 0
  %135 = load i32** %134, align 8
  %136 = getelementptr inbounds i32* %135, i64 0
  %137 = load i32* %136, align 4
  br label %151

; <label>:138                                     ; preds = %124
  %139 = sext i16 %ref to i64
  %140 = add nsw i32 %26, 1
  %141 = sext i32 %140 to i64
  %142 = load i32***** @wbp_weight, align 8
  %143 = getelementptr inbounds i32**** %142, i64 %141
  %144 = load i32**** %143, align 8
  %145 = getelementptr inbounds i32*** %144, i64 0
  %146 = load i32*** %145, align 8
  %147 = getelementptr inbounds i32** %146, i64 %139
  %148 = load i32** %147, align 8
  %149 = getelementptr inbounds i32* %148, i64 0
  %150 = load i32* %149, align 4
  br label %151

; <label>:151                                     ; preds = %138, %126
  %152 = phi i32 [ %137, %126 ], [ %150, %138 ]
  br label %156

; <label>:153                                     ; preds = %40
  %154 = load i32* @luma_log_weight_denom, align 4
  %155 = shl i32 1, %154
  br label %156

; <label>:156                                     ; preds = %153, %151
  %157 = phi i32 [ %152, %151 ], [ %155, %153 ]
  %158 = trunc i32 %157 to i16
  %159 = sext i16 %121 to i32
  %160 = icmp ne i32 %159, 0
  br i1 %160, label %161, label %190

; <label>:161                                     ; preds = %156
  %162 = icmp eq i32 %list, 0
  br i1 %162, label %163, label %176

; <label>:163                                     ; preds = %161
  %164 = sext i16 %ref to i64
  %165 = add nsw i32 %26, 1
  %166 = sext i32 %165 to i64
  %167 = load i32***** @wbp_weight, align 8
  %168 = getelementptr inbounds i32**** %167, i64 %166
  %169 = load i32**** %168, align 8
  %170 = getelementptr inbounds i32*** %169, i64 %164
  %171 = load i32*** %170, align 8
  %172 = getelementptr inbounds i32** %171, i64 0
  %173 = load i32** %172, align 8
  %174 = getelementptr inbounds i32* %173, i64 0
  %175 = load i32* %174, align 4
  br label %188

; <label>:176                                     ; preds = %161
  %177 = sext i16 %ref to i64
  %178 = sext i32 %26 to i64
  %179 = load i32***** @wbp_weight, align 8
  %180 = getelementptr inbounds i32**** %179, i64 %178
  %181 = load i32**** %180, align 8
  %182 = getelementptr inbounds i32*** %181, i64 0
  %183 = load i32*** %182, align 8
  %184 = getelementptr inbounds i32** %183, i64 %177
  %185 = load i32** %184, align 8
  %186 = getelementptr inbounds i32* %185, i64 0
  %187 = load i32* %186, align 4
  br label %188

; <label>:188                                     ; preds = %176, %163
  %189 = phi i32 [ %175, %163 ], [ %187, %176 ]
  br label %193

; <label>:190                                     ; preds = %156
  %191 = load i32* @luma_log_weight_denom, align 4
  %192 = shl i32 1, %191
  br label %193

; <label>:193                                     ; preds = %190, %188
  %194 = phi i32 [ %189, %188 ], [ %192, %190 ]
  %195 = trunc i32 %194 to i16
  %196 = sext i16 %121 to i32
  %197 = icmp ne i32 %196, 0
  br i1 %197, label %198, label %222

; <label>:198                                     ; preds = %193
  %199 = icmp eq i32 %list, 0
  br i1 %199, label %200, label %210

; <label>:200                                     ; preds = %198
  %201 = sext i16 %ref to i64
  %202 = sext i32 %26 to i64
  %203 = load i32**** @wp_offset, align 8
  %204 = getelementptr inbounds i32*** %203, i64 %202
  %205 = load i32*** %204, align 8
  %206 = getelementptr inbounds i32** %205, i64 %201
  %207 = load i32** %206, align 8
  %208 = getelementptr inbounds i32* %207, i64 0
  %209 = load i32* %208, align 4
  br label %220

; <label>:210                                     ; preds = %198
  %211 = add nsw i32 %26, 1
  %212 = sext i32 %211 to i64
  %213 = load i32**** @wp_offset, align 8
  %214 = getelementptr inbounds i32*** %213, i64 %212
  %215 = load i32*** %214, align 8
  %216 = getelementptr inbounds i32** %215, i64 0
  %217 = load i32** %216, align 8
  %218 = getelementptr inbounds i32* %217, i64 0
  %219 = load i32* %218, align 4
  br label %220

; <label>:220                                     ; preds = %210, %200
  %221 = phi i32 [ %209, %200 ], [ %219, %210 ]
  br label %223

; <label>:222                                     ; preds = %193
  br label %223

; <label>:223                                     ; preds = %222, %220
  %224 = phi i32 [ %221, %220 ], [ 0, %222 ]
  %225 = trunc i32 %224 to i16
  %226 = sext i16 %121 to i32
  %227 = icmp ne i32 %226, 0
  br i1 %227, label %228, label %252

; <label>:228                                     ; preds = %223
  %229 = icmp eq i32 %list, 0
  br i1 %229, label %230, label %241

; <label>:230                                     ; preds = %228
  %231 = sext i16 %ref to i64
  %232 = add nsw i32 %26, 1
  %233 = sext i32 %232 to i64
  %234 = load i32**** @wp_offset, align 8
  %235 = getelementptr inbounds i32*** %234, i64 %233
  %236 = load i32*** %235, align 8
  %237 = getelementptr inbounds i32** %236, i64 %231
  %238 = load i32** %237, align 8
  %239 = getelementptr inbounds i32* %238, i64 0
  %240 = load i32* %239, align 4
  br label %250

; <label>:241                                     ; preds = %228
  %242 = sext i32 %26 to i64
  %243 = load i32**** @wp_offset, align 8
  %244 = getelementptr inbounds i32*** %243, i64 %242
  %245 = load i32*** %244, align 8
  %246 = getelementptr inbounds i32** %245, i64 0
  %247 = load i32** %246, align 8
  %248 = getelementptr inbounds i32* %247, i64 0
  %249 = load i32* %248, align 4
  br label %250

; <label>:250                                     ; preds = %241, %230
  %251 = phi i32 [ %240, %230 ], [ %249, %241 ]
  br label %253

; <label>:252                                     ; preds = %223
  br label %253

; <label>:253                                     ; preds = %252, %250
  %254 = phi i32 [ %251, %250 ], [ 0, %252 ]
  %255 = trunc i32 %254 to i16
  %256 = sext i16 %255 to i32
  %257 = sext i16 %225 to i32
  %258 = add nsw i32 %256, %257
  %259 = add nsw i32 %258, 1
  %260 = ashr i32 %259, 1
  %261 = trunc i32 %260 to i16
  %262 = sext i16 %103 to i32
  %263 = icmp sgt i32 %262, %search_range
  br i1 %263, label %264, label %286

; <label>:264                                     ; preds = %253
  %265 = sext i16 %103 to i32
  %266 = load %struct.ImageParameters** @img, align 8
  %267 = getelementptr inbounds %struct.ImageParameters* %266, i32 0, i32 13
  %268 = load i32* %267, align 4
  %269 = sub nsw i32 %268, 1
  %270 = sub nsw i32 %269, %search_range
  %271 = sub nsw i32 %270, %86
  %272 = icmp slt i32 %265, %271
  br i1 %272, label %273, label %286

; <label>:273                                     ; preds = %264
  %274 = sext i16 %107 to i32
  %275 = icmp sgt i32 %274, %search_range
  br i1 %275, label %276, label %286

; <label>:276                                     ; preds = %273
  %277 = sext i16 %107 to i32
  %278 = load %struct.ImageParameters** @img, align 8
  %279 = getelementptr inbounds %struct.ImageParameters* %278, i32 0, i32 15
  %280 = load i32* %279, align 4
  %281 = sub nsw i32 %280, 1
  %282 = sub nsw i32 %281, %search_range
  %283 = sub nsw i32 %282, %80
  %284 = icmp slt i32 %277, %283
  br i1 %284, label %285, label %286

; <label>:285                                     ; preds = %276
  br label %287

; <label>:286                                     ; preds = %276, %273, %264, %253
  br label %287

; <label>:287                                     ; preds = %286, %285
  %get_ref_line2.0 = phi i16* (i32, i16*, i32, i32, i32, i32)* [ @FastLineX, %285 ], [ @UMVLineX, %286 ]
  %288 = sext i16 %111 to i32
  %289 = icmp sgt i32 %288, %search_range
  br i1 %289, label %290, label %312

; <label>:290                                     ; preds = %287
  %291 = sext i16 %111 to i32
  %292 = load %struct.ImageParameters** @img, align 8
  %293 = getelementptr inbounds %struct.ImageParameters* %292, i32 0, i32 13
  %294 = load i32* %293, align 4
  %295 = sub nsw i32 %294, 1
  %296 = sub nsw i32 %295, %search_range
  %297 = sub nsw i32 %296, %86
  %298 = icmp slt i32 %291, %297
  br i1 %298, label %299, label %312

; <label>:299                                     ; preds = %290
  %300 = sext i16 %115 to i32
  %301 = icmp sgt i32 %300, %search_range
  br i1 %301, label %302, label %312

; <label>:302                                     ; preds = %299
  %303 = sext i16 %115 to i32
  %304 = load %struct.ImageParameters** @img, align 8
  %305 = getelementptr inbounds %struct.ImageParameters* %304, i32 0, i32 15
  %306 = load i32* %305, align 4
  %307 = sub nsw i32 %306, 1
  %308 = sub nsw i32 %307, %search_range
  %309 = sub nsw i32 %308, %80
  %310 = icmp slt i32 %303, %309
  br i1 %310, label %311, label %312

; <label>:311                                     ; preds = %302
  br label %313

; <label>:312                                     ; preds = %302, %299, %290, %287
  br label %313

; <label>:313                                     ; preds = %312, %311
  %get_ref_line1.0 = phi i16* (i32, i16*, i32, i32, i32, i32)* [ @FastLineX, %311 ], [ @UMVLineX, %312 ]
  br label %314

; <label>:314                                     ; preds = %776, %313
  %.0 = phi i32 [ %min_mcost, %313 ], [ %.2, %776 ]
  %pos.0 = phi i32 [ 0, %313 ], [ %777, %776 ]
  %best_pos.0 = phi i32 [ 0, %313 ], [ %best_pos.2, %776 ]
  %315 = icmp slt i32 %pos.0, %71
  br i1 %315, label %316, label %778

; <label>:316                                     ; preds = %314
  %317 = sext i16 %103 to i32
  %318 = sext i32 %pos.0 to i64
  %319 = load i32** @spiral_search_x, align 8
  %320 = getelementptr inbounds i32* %319, i64 %318
  %321 = load i32* %320, align 4
  %322 = add nsw i32 %317, %321
  %323 = sext i16 %107 to i32
  %324 = sext i32 %pos.0 to i64
  %325 = load i32** @spiral_search_y, align 8
  %326 = getelementptr inbounds i32* %325, i64 %324
  %327 = load i32* %326, align 4
  %328 = add nsw i32 %323, %327
  %329 = sext i16 %111 to i32
  %330 = shl i32 %329, 2
  %331 = sub nsw i32 %330, %90
  %332 = sext i32 %331 to i64
  %333 = load i32** @mvbits, align 8
  %334 = getelementptr inbounds i32* %333, i64 %332
  %335 = load i32* %334, align 4
  %336 = sext i16 %115 to i32
  %337 = shl i32 %336, 2
  %338 = sub nsw i32 %337, %93
  %339 = sext i32 %338 to i64
  %340 = load i32** @mvbits, align 8
  %341 = getelementptr inbounds i32* %340, i64 %339
  %342 = load i32* %341, align 4
  %343 = add nsw i32 %335, %342
  %344 = mul nsw i32 %74, %343
  %345 = ashr i32 %344, 16
  %346 = shl i32 %322, 2
  %347 = sub nsw i32 %346, %96
  %348 = sext i32 %347 to i64
  %349 = load i32** @mvbits, align 8
  %350 = getelementptr inbounds i32* %349, i64 %348
  %351 = load i32* %350, align 4
  %352 = shl i32 %328, 2
  %353 = sub nsw i32 %352, %99
  %354 = sext i32 %353 to i64
  %355 = load i32** @mvbits, align 8
  %356 = getelementptr inbounds i32* %355, i64 %354
  %357 = load i32* %356, align 4
  %358 = add nsw i32 %351, %357
  %359 = mul nsw i32 %74, %358
  %360 = ashr i32 %359, 16
  %361 = add nsw i32 %345, %360
  %362 = icmp sge i32 %361, %.0
  br i1 %362, label %363, label %364

; <label>:363                                     ; preds = %316
  br label %776

; <label>:364                                     ; preds = %316
  %365 = icmp ne i16 %121, 0
  br i1 %365, label %366, label %679

; <label>:366                                     ; preds = %364
  br label %367

; <label>:367                                     ; preds = %676, %366
  %y.0 = phi i32 [ 0, %366 ], [ %677, %676 ]
  %mcost.0 = phi i32 [ %361, %366 ], [ %mcost.1, %676 ]
  %368 = icmp slt i32 %y.0, %80
  br i1 %368, label %369, label %678

; <label>:369                                     ; preds = %367
  %370 = add nsw i32 %328, %y.0
  %371 = call i16* %get_ref_line2.0(i32 %86, i16* %48, i32 %370, i32 %322, i32 %66, i32 %57)
  %372 = sext i16 %115 to i32
  %373 = add nsw i32 %372, %y.0
  %374 = sext i16 %111 to i32
  %375 = call i16* %get_ref_line1.0(i32 %86, i16* %35, i32 %373, i32 %374, i32 %66, i32 %57)
  %376 = sext i32 %y.0 to i64
  %377 = getelementptr inbounds i16** %orig_pic, i64 %376
  %378 = load i16** %377, align 8
  br label %379

; <label>:379                                     ; preds = %670, %369
  %x4.0 = phi i32 [ 0, %369 ], [ %671, %670 ]
  %mcost.1 = phi i32 [ %mcost.0, %369 ], [ %669, %670 ]
  %orig_line.0 = phi i16* [ %378, %369 ], [ %660, %670 ]
  %ref2_line.0 = phi i16* [ %371, %369 ], [ %605, %670 ]
  %ref1_line.0 = phi i16* [ %375, %369 ], [ %599, %670 ]
  %380 = icmp slt i32 %x4.0, %87
  br i1 %380, label %381, label %672

; <label>:381                                     ; preds = %379
  %382 = sext i16 %158 to i32
  %383 = getelementptr inbounds i16* %ref1_line.0, i32 1
  %384 = load i16* %ref1_line.0, align 2
  %385 = zext i16 %384 to i32
  %386 = mul nsw i32 %382, %385
  %387 = trunc i32 %386 to i16
  %388 = sext i16 %195 to i32
  %389 = getelementptr inbounds i16* %ref2_line.0, i32 1
  %390 = load i16* %ref2_line.0, align 2
  %391 = zext i16 %390 to i32
  %392 = mul nsw i32 %388, %391
  %393 = trunc i32 %392 to i16
  %394 = sext i16 %387 to i32
  %395 = sext i16 %393 to i32
  %396 = add nsw i32 %394, %395
  %397 = load i32* @wp_luma_round, align 4
  %398 = mul nsw i32 2, %397
  %399 = add nsw i32 %396, %398
  %400 = load i32* @luma_log_weight_denom, align 4
  %401 = add nsw i32 %400, 1
  %402 = ashr i32 %399, %401
  %403 = sext i16 %261 to i32
  %404 = add nsw i32 %402, %403
  %405 = icmp slt i32 %404, 0
  br i1 %405, label %406, label %407

; <label>:406                                     ; preds = %381
  br label %441

; <label>:407                                     ; preds = %381
  %408 = sext i16 %387 to i32
  %409 = sext i16 %393 to i32
  %410 = add nsw i32 %408, %409
  %411 = load i32* @wp_luma_round, align 4
  %412 = mul nsw i32 2, %411
  %413 = add nsw i32 %410, %412
  %414 = load i32* @luma_log_weight_denom, align 4
  %415 = add nsw i32 %414, 1
  %416 = ashr i32 %413, %415
  %417 = sext i16 %261 to i32
  %418 = add nsw i32 %416, %417
  %419 = load %struct.ImageParameters** @img, align 8
  %420 = getelementptr inbounds %struct.ImageParameters* %419, i32 0, i32 155
  %421 = load i32* %420, align 4
  %422 = icmp sgt i32 %418, %421
  br i1 %422, label %423, label %427

; <label>:423                                     ; preds = %407
  %424 = load %struct.ImageParameters** @img, align 8
  %425 = getelementptr inbounds %struct.ImageParameters* %424, i32 0, i32 155
  %426 = load i32* %425, align 4
  br label %439

; <label>:427                                     ; preds = %407
  %428 = sext i16 %387 to i32
  %429 = sext i16 %393 to i32
  %430 = add nsw i32 %428, %429
  %431 = load i32* @wp_luma_round, align 4
  %432 = mul nsw i32 2, %431
  %433 = add nsw i32 %430, %432
  %434 = load i32* @luma_log_weight_denom, align 4
  %435 = add nsw i32 %434, 1
  %436 = ashr i32 %433, %435
  %437 = sext i16 %261 to i32
  %438 = add nsw i32 %436, %437
  br label %439

; <label>:439                                     ; preds = %427, %423
  %440 = phi i32 [ %426, %423 ], [ %438, %427 ]
  br label %441

; <label>:441                                     ; preds = %439, %406
  %442 = phi i32 [ 0, %406 ], [ %440, %439 ]
  %443 = trunc i32 %442 to i16
  %444 = getelementptr inbounds i16* %orig_line.0, i32 1
  %445 = load i16* %orig_line.0, align 2
  %446 = zext i16 %445 to i32
  %447 = sext i16 %443 to i32
  %448 = sub nsw i32 %446, %447
  %449 = sext i32 %448 to i64
  %450 = load i32** @byte_abs, align 8
  %451 = getelementptr inbounds i32* %450, i64 %449
  %452 = load i32* %451, align 4
  %453 = add nsw i32 %mcost.1, %452
  %454 = sext i16 %158 to i32
  %455 = getelementptr inbounds i16* %383, i32 1
  %456 = load i16* %383, align 2
  %457 = zext i16 %456 to i32
  %458 = mul nsw i32 %454, %457
  %459 = trunc i32 %458 to i16
  %460 = sext i16 %195 to i32
  %461 = getelementptr inbounds i16* %389, i32 1
  %462 = load i16* %389, align 2
  %463 = zext i16 %462 to i32
  %464 = mul nsw i32 %460, %463
  %465 = trunc i32 %464 to i16
  %466 = sext i16 %459 to i32
  %467 = sext i16 %465 to i32
  %468 = add nsw i32 %466, %467
  %469 = load i32* @wp_luma_round, align 4
  %470 = mul nsw i32 2, %469
  %471 = add nsw i32 %468, %470
  %472 = load i32* @luma_log_weight_denom, align 4
  %473 = add nsw i32 %472, 1
  %474 = ashr i32 %471, %473
  %475 = sext i16 %261 to i32
  %476 = add nsw i32 %474, %475
  %477 = icmp slt i32 %476, 0
  br i1 %477, label %478, label %479

; <label>:478                                     ; preds = %441
  br label %513

; <label>:479                                     ; preds = %441
  %480 = sext i16 %459 to i32
  %481 = sext i16 %465 to i32
  %482 = add nsw i32 %480, %481
  %483 = load i32* @wp_luma_round, align 4
  %484 = mul nsw i32 2, %483
  %485 = add nsw i32 %482, %484
  %486 = load i32* @luma_log_weight_denom, align 4
  %487 = add nsw i32 %486, 1
  %488 = ashr i32 %485, %487
  %489 = sext i16 %261 to i32
  %490 = add nsw i32 %488, %489
  %491 = load %struct.ImageParameters** @img, align 8
  %492 = getelementptr inbounds %struct.ImageParameters* %491, i32 0, i32 155
  %493 = load i32* %492, align 4
  %494 = icmp sgt i32 %490, %493
  br i1 %494, label %495, label %499

; <label>:495                                     ; preds = %479
  %496 = load %struct.ImageParameters** @img, align 8
  %497 = getelementptr inbounds %struct.ImageParameters* %496, i32 0, i32 155
  %498 = load i32* %497, align 4
  br label %511

; <label>:499                                     ; preds = %479
  %500 = sext i16 %459 to i32
  %501 = sext i16 %465 to i32
  %502 = add nsw i32 %500, %501
  %503 = load i32* @wp_luma_round, align 4
  %504 = mul nsw i32 2, %503
  %505 = add nsw i32 %502, %504
  %506 = load i32* @luma_log_weight_denom, align 4
  %507 = add nsw i32 %506, 1
  %508 = ashr i32 %505, %507
  %509 = sext i16 %261 to i32
  %510 = add nsw i32 %508, %509
  br label %511

; <label>:511                                     ; preds = %499, %495
  %512 = phi i32 [ %498, %495 ], [ %510, %499 ]
  br label %513

; <label>:513                                     ; preds = %511, %478
  %514 = phi i32 [ 0, %478 ], [ %512, %511 ]
  %515 = trunc i32 %514 to i16
  %516 = getelementptr inbounds i16* %444, i32 1
  %517 = load i16* %444, align 2
  %518 = zext i16 %517 to i32
  %519 = sext i16 %515 to i32
  %520 = sub nsw i32 %518, %519
  %521 = sext i32 %520 to i64
  %522 = load i32** @byte_abs, align 8
  %523 = getelementptr inbounds i32* %522, i64 %521
  %524 = load i32* %523, align 4
  %525 = add nsw i32 %453, %524
  %526 = sext i16 %158 to i32
  %527 = getelementptr inbounds i16* %455, i32 1
  %528 = load i16* %455, align 2
  %529 = zext i16 %528 to i32
  %530 = mul nsw i32 %526, %529
  %531 = trunc i32 %530 to i16
  %532 = sext i16 %195 to i32
  %533 = getelementptr inbounds i16* %461, i32 1
  %534 = load i16* %461, align 2
  %535 = zext i16 %534 to i32
  %536 = mul nsw i32 %532, %535
  %537 = trunc i32 %536 to i16
  %538 = sext i16 %531 to i32
  %539 = sext i16 %537 to i32
  %540 = add nsw i32 %538, %539
  %541 = load i32* @wp_luma_round, align 4
  %542 = mul nsw i32 2, %541
  %543 = add nsw i32 %540, %542
  %544 = load i32* @luma_log_weight_denom, align 4
  %545 = add nsw i32 %544, 1
  %546 = ashr i32 %543, %545
  %547 = sext i16 %261 to i32
  %548 = add nsw i32 %546, %547
  %549 = icmp slt i32 %548, 0
  br i1 %549, label %550, label %551

; <label>:550                                     ; preds = %513
  br label %585

; <label>:551                                     ; preds = %513
  %552 = sext i16 %531 to i32
  %553 = sext i16 %537 to i32
  %554 = add nsw i32 %552, %553
  %555 = load i32* @wp_luma_round, align 4
  %556 = mul nsw i32 2, %555
  %557 = add nsw i32 %554, %556
  %558 = load i32* @luma_log_weight_denom, align 4
  %559 = add nsw i32 %558, 1
  %560 = ashr i32 %557, %559
  %561 = sext i16 %261 to i32
  %562 = add nsw i32 %560, %561
  %563 = load %struct.ImageParameters** @img, align 8
  %564 = getelementptr inbounds %struct.ImageParameters* %563, i32 0, i32 155
  %565 = load i32* %564, align 4
  %566 = icmp sgt i32 %562, %565
  br i1 %566, label %567, label %571

; <label>:567                                     ; preds = %551
  %568 = load %struct.ImageParameters** @img, align 8
  %569 = getelementptr inbounds %struct.ImageParameters* %568, i32 0, i32 155
  %570 = load i32* %569, align 4
  br label %583

; <label>:571                                     ; preds = %551
  %572 = sext i16 %531 to i32
  %573 = sext i16 %537 to i32
  %574 = add nsw i32 %572, %573
  %575 = load i32* @wp_luma_round, align 4
  %576 = mul nsw i32 2, %575
  %577 = add nsw i32 %574, %576
  %578 = load i32* @luma_log_weight_denom, align 4
  %579 = add nsw i32 %578, 1
  %580 = ashr i32 %577, %579
  %581 = sext i16 %261 to i32
  %582 = add nsw i32 %580, %581
  br label %583

; <label>:583                                     ; preds = %571, %567
  %584 = phi i32 [ %570, %567 ], [ %582, %571 ]
  br label %585

; <label>:585                                     ; preds = %583, %550
  %586 = phi i32 [ 0, %550 ], [ %584, %583 ]
  %587 = trunc i32 %586 to i16
  %588 = getelementptr inbounds i16* %516, i32 1
  %589 = load i16* %516, align 2
  %590 = zext i16 %589 to i32
  %591 = sext i16 %587 to i32
  %592 = sub nsw i32 %590, %591
  %593 = sext i32 %592 to i64
  %594 = load i32** @byte_abs, align 8
  %595 = getelementptr inbounds i32* %594, i64 %593
  %596 = load i32* %595, align 4
  %597 = add nsw i32 %525, %596
  %598 = sext i16 %158 to i32
  %599 = getelementptr inbounds i16* %527, i32 1
  %600 = load i16* %527, align 2
  %601 = zext i16 %600 to i32
  %602 = mul nsw i32 %598, %601
  %603 = trunc i32 %602 to i16
  %604 = sext i16 %195 to i32
  %605 = getelementptr inbounds i16* %533, i32 1
  %606 = load i16* %533, align 2
  %607 = zext i16 %606 to i32
  %608 = mul nsw i32 %604, %607
  %609 = trunc i32 %608 to i16
  %610 = sext i16 %603 to i32
  %611 = sext i16 %609 to i32
  %612 = add nsw i32 %610, %611
  %613 = load i32* @wp_luma_round, align 4
  %614 = mul nsw i32 2, %613
  %615 = add nsw i32 %612, %614
  %616 = load i32* @luma_log_weight_denom, align 4
  %617 = add nsw i32 %616, 1
  %618 = ashr i32 %615, %617
  %619 = sext i16 %261 to i32
  %620 = add nsw i32 %618, %619
  %621 = icmp slt i32 %620, 0
  br i1 %621, label %622, label %623

; <label>:622                                     ; preds = %585
  br label %657

; <label>:623                                     ; preds = %585
  %624 = sext i16 %603 to i32
  %625 = sext i16 %609 to i32
  %626 = add nsw i32 %624, %625
  %627 = load i32* @wp_luma_round, align 4
  %628 = mul nsw i32 2, %627
  %629 = add nsw i32 %626, %628
  %630 = load i32* @luma_log_weight_denom, align 4
  %631 = add nsw i32 %630, 1
  %632 = ashr i32 %629, %631
  %633 = sext i16 %261 to i32
  %634 = add nsw i32 %632, %633
  %635 = load %struct.ImageParameters** @img, align 8
  %636 = getelementptr inbounds %struct.ImageParameters* %635, i32 0, i32 155
  %637 = load i32* %636, align 4
  %638 = icmp sgt i32 %634, %637
  br i1 %638, label %639, label %643

; <label>:639                                     ; preds = %623
  %640 = load %struct.ImageParameters** @img, align 8
  %641 = getelementptr inbounds %struct.ImageParameters* %640, i32 0, i32 155
  %642 = load i32* %641, align 4
  br label %655

; <label>:643                                     ; preds = %623
  %644 = sext i16 %603 to i32
  %645 = sext i16 %609 to i32
  %646 = add nsw i32 %644, %645
  %647 = load i32* @wp_luma_round, align 4
  %648 = mul nsw i32 2, %647
  %649 = add nsw i32 %646, %648
  %650 = load i32* @luma_log_weight_denom, align 4
  %651 = add nsw i32 %650, 1
  %652 = ashr i32 %649, %651
  %653 = sext i16 %261 to i32
  %654 = add nsw i32 %652, %653
  br label %655

; <label>:655                                     ; preds = %643, %639
  %656 = phi i32 [ %642, %639 ], [ %654, %643 ]
  br label %657

; <label>:657                                     ; preds = %655, %622
  %658 = phi i32 [ 0, %622 ], [ %656, %655 ]
  %659 = trunc i32 %658 to i16
  %660 = getelementptr inbounds i16* %588, i32 1
  %661 = load i16* %588, align 2
  %662 = zext i16 %661 to i32
  %663 = sext i16 %659 to i32
  %664 = sub nsw i32 %662, %663
  %665 = sext i32 %664 to i64
  %666 = load i32** @byte_abs, align 8
  %667 = getelementptr inbounds i32* %666, i64 %665
  %668 = load i32* %667, align 4
  %669 = add nsw i32 %597, %668
  br label %670

; <label>:670                                     ; preds = %657
  %671 = add nsw i32 %x4.0, 1
  br label %379

; <label>:672                                     ; preds = %379
  %673 = icmp sge i32 %mcost.1, %.0
  br i1 %673, label %674, label %675

; <label>:674                                     ; preds = %672
  br label %678

; <label>:675                                     ; preds = %672
  br label %676

; <label>:676                                     ; preds = %675
  %677 = add nsw i32 %y.0, 1
  br label %367

; <label>:678                                     ; preds = %674, %367
  %mcost.2 = phi i32 [ %mcost.1, %674 ], [ %mcost.0, %367 ]
  br label %772

; <label>:679                                     ; preds = %364
  br label %680

; <label>:680                                     ; preds = %769, %679
  %y.1 = phi i32 [ 0, %679 ], [ %770, %769 ]
  %mcost.3 = phi i32 [ %361, %679 ], [ %mcost.4, %769 ]
  %681 = icmp slt i32 %y.1, %80
  br i1 %681, label %682, label %771

; <label>:682                                     ; preds = %680
  %683 = add nsw i32 %328, %y.1
  %684 = call i16* %get_ref_line2.0(i32 %86, i16* %48, i32 %683, i32 %322, i32 %66, i32 %57)
  %685 = sext i16 %115 to i32
  %686 = add nsw i32 %685, %y.1
  %687 = sext i16 %111 to i32
  %688 = call i16* %get_ref_line1.0(i32 %86, i16* %35, i32 %686, i32 %687, i32 %66, i32 %57)
  %689 = sext i32 %y.1 to i64
  %690 = getelementptr inbounds i16** %orig_pic, i64 %689
  %691 = load i16** %690, align 8
  br label %692

; <label>:692                                     ; preds = %763, %682
  %x4.1 = phi i32 [ 0, %682 ], [ %764, %763 ]
  %mcost.4 = phi i32 [ %mcost.3, %682 ], [ %762, %763 ]
  %orig_line.1 = phi i16* [ %691, %682 ], [ %746, %763 ]
  %ref2_line.1 = phi i16* [ %684, %682 ], [ %752, %763 ]
  %ref1_line.1 = phi i16* [ %688, %682 ], [ %749, %763 ]
  %693 = icmp slt i32 %x4.1, %87
  br i1 %693, label %694, label %765

; <label>:694                                     ; preds = %692
  %695 = getelementptr inbounds i16* %orig_line.1, i32 1
  %696 = load i16* %orig_line.1, align 2
  %697 = zext i16 %696 to i32
  %698 = getelementptr inbounds i16* %ref1_line.1, i32 1
  %699 = load i16* %ref1_line.1, align 2
  %700 = zext i16 %699 to i32
  %701 = getelementptr inbounds i16* %ref2_line.1, i32 1
  %702 = load i16* %ref2_line.1, align 2
  %703 = zext i16 %702 to i32
  %704 = add nsw i32 %700, %703
  %705 = ashr i32 %704, 1
  %706 = sub nsw i32 %697, %705
  %707 = sext i32 %706 to i64
  %708 = load i32** @byte_abs, align 8
  %709 = getelementptr inbounds i32* %708, i64 %707
  %710 = load i32* %709, align 4
  %711 = add nsw i32 %mcost.4, %710
  %712 = getelementptr inbounds i16* %695, i32 1
  %713 = load i16* %695, align 2
  %714 = zext i16 %713 to i32
  %715 = getelementptr inbounds i16* %698, i32 1
  %716 = load i16* %698, align 2
  %717 = zext i16 %716 to i32
  %718 = getelementptr inbounds i16* %701, i32 1
  %719 = load i16* %701, align 2
  %720 = zext i16 %719 to i32
  %721 = add nsw i32 %717, %720
  %722 = ashr i32 %721, 1
  %723 = sub nsw i32 %714, %722
  %724 = sext i32 %723 to i64
  %725 = load i32** @byte_abs, align 8
  %726 = getelementptr inbounds i32* %725, i64 %724
  %727 = load i32* %726, align 4
  %728 = add nsw i32 %711, %727
  %729 = getelementptr inbounds i16* %712, i32 1
  %730 = load i16* %712, align 2
  %731 = zext i16 %730 to i32
  %732 = getelementptr inbounds i16* %715, i32 1
  %733 = load i16* %715, align 2
  %734 = zext i16 %733 to i32
  %735 = getelementptr inbounds i16* %718, i32 1
  %736 = load i16* %718, align 2
  %737 = zext i16 %736 to i32
  %738 = add nsw i32 %734, %737
  %739 = ashr i32 %738, 1
  %740 = sub nsw i32 %731, %739
  %741 = sext i32 %740 to i64
  %742 = load i32** @byte_abs, align 8
  %743 = getelementptr inbounds i32* %742, i64 %741
  %744 = load i32* %743, align 4
  %745 = add nsw i32 %728, %744
  %746 = getelementptr inbounds i16* %729, i32 1
  %747 = load i16* %729, align 2
  %748 = zext i16 %747 to i32
  %749 = getelementptr inbounds i16* %732, i32 1
  %750 = load i16* %732, align 2
  %751 = zext i16 %750 to i32
  %752 = getelementptr inbounds i16* %735, i32 1
  %753 = load i16* %735, align 2
  %754 = zext i16 %753 to i32
  %755 = add nsw i32 %751, %754
  %756 = ashr i32 %755, 1
  %757 = sub nsw i32 %748, %756
  %758 = sext i32 %757 to i64
  %759 = load i32** @byte_abs, align 8
  %760 = getelementptr inbounds i32* %759, i64 %758
  %761 = load i32* %760, align 4
  %762 = add nsw i32 %745, %761
  br label %763

; <label>:763                                     ; preds = %694
  %764 = add nsw i32 %x4.1, 1
  br label %692

; <label>:765                                     ; preds = %692
  %766 = icmp sge i32 %mcost.4, %.0
  br i1 %766, label %767, label %768

; <label>:767                                     ; preds = %765
  br label %771

; <label>:768                                     ; preds = %765
  br label %769

; <label>:769                                     ; preds = %768
  %770 = add nsw i32 %y.1, 1
  br label %680

; <label>:771                                     ; preds = %767, %680
  %mcost.5 = phi i32 [ %mcost.4, %767 ], [ %mcost.3, %680 ]
  br label %772

; <label>:772                                     ; preds = %771, %678
  %mcost.6 = phi i32 [ %mcost.2, %678 ], [ %mcost.5, %771 ]
  %773 = icmp slt i32 %mcost.6, %.0
  br i1 %773, label %774, label %775

; <label>:774                                     ; preds = %772
  br label %775

; <label>:775                                     ; preds = %774, %772
  %.1 = phi i32 [ %mcost.6, %774 ], [ %.0, %772 ]
  %best_pos.1 = phi i32 [ %pos.0, %774 ], [ %best_pos.0, %772 ]
  br label %776

; <label>:776                                     ; preds = %775, %363
  %.2 = phi i32 [ %.0, %363 ], [ %.1, %775 ]
  %best_pos.2 = phi i32 [ %best_pos.0, %363 ], [ %best_pos.1, %775 ]
  %777 = add nsw i32 %pos.0, 1
  br label %314

; <label>:778                                     ; preds = %314
  %779 = icmp ne i32 %best_pos.0, 0
  br i1 %779, label %780, label %797

; <label>:780                                     ; preds = %778
  %781 = sext i32 %best_pos.0 to i64
  %782 = load i32** @spiral_search_x, align 8
  %783 = getelementptr inbounds i32* %782, i64 %781
  %784 = load i32* %783, align 4
  %785 = load i16* %mv_x, align 2
  %786 = sext i16 %785 to i32
  %787 = add nsw i32 %786, %784
  %788 = trunc i32 %787 to i16
  store i16 %788, i16* %mv_x, align 2
  %789 = sext i32 %best_pos.0 to i64
  %790 = load i32** @spiral_search_y, align 8
  %791 = getelementptr inbounds i32* %790, i64 %789
  %792 = load i32* %791, align 4
  %793 = load i16* %mv_y, align 2
  %794 = sext i16 %793 to i32
  %795 = add nsw i32 %794, %792
  %796 = trunc i32 %795 to i16
  store i16 %796, i16* %mv_y, align 2
  br label %797

; <label>:797                                     ; preds = %780, %778
  ret i32 %.0
}

; Function Attrs: nounwind uwtable
define i32 @SubPelBlockSearchBiPred(i16** %orig_pic, i16 signext %ref, i32 %list, i32 %pic_pix_x, i32 %pic_pix_y, i32 %blocktype, i16 signext %pred_mv_x, i16 signext %pred_mv_y, i16* %mv_x, i16* %mv_y, i16* %s_mv_x, i16* %s_mv_y, i32 %search_pos2, i32 %search_pos4, i32 %min_mcost, double %lambda) #0 {
  %curr_diff = alloca [16 x [16 x i32]], align 16
  %diff = alloca [16 x i32], align 16
  %1 = fmul double 6.553600e+04, %lambda
  %2 = fadd double %1, 5.000000e-01
  %3 = fptosi double %2 to i32
  %4 = sext i32 %blocktype to i64
  %5 = load %struct.InputParameters** @input, align 8
  %6 = getelementptr inbounds %struct.InputParameters* %5, i32 0, i32 20
  %7 = getelementptr inbounds [8 x [2 x i32]]* %6, i32 0, i64 %4
  %8 = getelementptr inbounds [2 x i32]* %7, i32 0, i64 0
  %9 = load i32* %8, align 4
  %10 = trunc i32 %9 to i16
  %11 = sext i32 %blocktype to i64
  %12 = load %struct.InputParameters** @input, align 8
  %13 = getelementptr inbounds %struct.InputParameters* %12, i32 0, i32 20
  %14 = getelementptr inbounds [8 x [2 x i32]]* %13, i32 0, i64 %11
  %15 = getelementptr inbounds [2 x i32]* %14, i32 0, i64 1
  %16 = load i32* %15, align 4
  %17 = trunc i32 %16 to i16
  %18 = shl i32 %pic_pix_x, 2
  %19 = trunc i32 %18 to i16
  %20 = shl i32 %pic_pix_y, 2
  %21 = trunc i32 %20 to i16
  %22 = load %struct.InputParameters** @input, align 8
  %23 = getelementptr inbounds %struct.InputParameters* %22, i32 0, i32 6
  %24 = load i32* %23, align 4
  %25 = icmp ne i32 %24, 0
  %26 = select i1 %25, i32 0, i32 1
  %27 = trunc i32 %26 to i16
  %28 = load %struct.InputParameters** @input, align 8
  %29 = getelementptr inbounds %struct.InputParameters* %28, i32 0, i32 6
  %30 = load i32* %29, align 4
  %31 = icmp ne i32 %30, 0
  br i1 %31, label %32, label %38

; <label>:32                                      ; preds = %0
  %33 = icmp sgt i32 1, %search_pos2
  br i1 %33, label %34, label %35

; <label>:34                                      ; preds = %32
  br label %36

; <label>:35                                      ; preds = %32
  br label %36

; <label>:36                                      ; preds = %35, %34
  %37 = phi i32 [ 1, %34 ], [ %search_pos2, %35 ]
  br label %39

; <label>:38                                      ; preds = %0
  br label %39

; <label>:39                                      ; preds = %38, %36
  %40 = phi i32 [ %37, %36 ], [ %search_pos2, %38 ]
  %41 = trunc i32 %40 to i16
  %42 = load %struct.ImageParameters** @img, align 8
  %43 = getelementptr inbounds %struct.ImageParameters* %42, i32 0, i32 90
  %44 = load i32* %43, align 4
  %45 = icmp ne i32 %44, 0
  br i1 %45, label %46, label %65

; <label>:46                                      ; preds = %39
  %47 = load %struct.ImageParameters** @img, align 8
  %48 = getelementptr inbounds %struct.ImageParameters* %47, i32 0, i32 3
  %49 = load i32* %48, align 4
  %50 = sext i32 %49 to i64
  %51 = load %struct.ImageParameters** @img, align 8
  %52 = getelementptr inbounds %struct.ImageParameters* %51, i32 0, i32 51
  %53 = load %struct.macroblock** %52, align 8
  %54 = getelementptr inbounds %struct.macroblock* %53, i64 %50
  %55 = getelementptr inbounds %struct.macroblock* %54, i32 0, i32 22
  %56 = load i32* %55, align 4
  %57 = icmp ne i32 %56, 0
  br i1 %57, label %58, label %65

; <label>:58                                      ; preds = %46
  %59 = load %struct.ImageParameters** @img, align 8
  %60 = getelementptr inbounds %struct.ImageParameters* %59, i32 0, i32 3
  %61 = load i32* %60, align 4
  %62 = srem i32 %61, 2
  %63 = icmp ne i32 %62, 0
  %64 = select i1 %63, i32 4, i32 2
  br label %66

; <label>:65                                      ; preds = %46, %39
  br label %66

; <label>:66                                      ; preds = %65, %58
  %67 = phi i32 [ %64, %58 ], [ 0, %65 ]
  %68 = trunc i32 %67 to i16
  %69 = load %struct.pic_parameter_set_rbsp_t** @active_pps, align 8
  %70 = getelementptr inbounds %struct.pic_parameter_set_rbsp_t* %69, i32 0, i32 20
  %71 = load i32* %70, align 4
  %72 = trunc i32 %71 to i16
  %73 = sext i16 %72 to i32
  %74 = icmp ne i32 %73, 0
  br i1 %74, label %75, label %105

; <label>:75                                      ; preds = %66
  %76 = icmp eq i32 %list, 0
  br i1 %76, label %77, label %89

; <label>:77                                      ; preds = %75
  %78 = sext i16 %ref to i64
  %79 = sext i16 %68 to i64
  %80 = load i32***** @wbp_weight, align 8
  %81 = getelementptr inbounds i32**** %80, i64 %79
  %82 = load i32**** %81, align 8
  %83 = getelementptr inbounds i32*** %82, i64 %78
  %84 = load i32*** %83, align 8
  %85 = getelementptr inbounds i32** %84, i64 0
  %86 = load i32** %85, align 8
  %87 = getelementptr inbounds i32* %86, i64 0
  %88 = load i32* %87, align 4
  br label %103

; <label>:89                                      ; preds = %75
  %90 = sext i16 %ref to i64
  %91 = sext i16 %68 to i32
  %92 = add nsw i32 %91, 1
  %93 = sext i32 %92 to i64
  %94 = load i32***** @wbp_weight, align 8
  %95 = getelementptr inbounds i32**** %94, i64 %93
  %96 = load i32**** %95, align 8
  %97 = getelementptr inbounds i32*** %96, i64 0
  %98 = load i32*** %97, align 8
  %99 = getelementptr inbounds i32** %98, i64 %90
  %100 = load i32** %99, align 8
  %101 = getelementptr inbounds i32* %100, i64 0
  %102 = load i32* %101, align 4
  br label %103

; <label>:103                                     ; preds = %89, %77
  %104 = phi i32 [ %88, %77 ], [ %102, %89 ]
  br label %106

; <label>:105                                     ; preds = %66
  br label %106

; <label>:106                                     ; preds = %105, %103
  %107 = phi i32 [ %104, %103 ], [ 1, %105 ]
  %108 = trunc i32 %107 to i16
  %109 = sext i16 %72 to i32
  %110 = icmp ne i32 %109, 0
  br i1 %110, label %111, label %141

; <label>:111                                     ; preds = %106
  %112 = icmp eq i32 %list, 0
  br i1 %112, label %113, label %127

; <label>:113                                     ; preds = %111
  %114 = sext i16 %ref to i64
  %115 = sext i16 %68 to i32
  %116 = add nsw i32 %115, 1
  %117 = sext i32 %116 to i64
  %118 = load i32***** @wbp_weight, align 8
  %119 = getelementptr inbounds i32**** %118, i64 %117
  %120 = load i32**** %119, align 8
  %121 = getelementptr inbounds i32*** %120, i64 %114
  %122 = load i32*** %121, align 8
  %123 = getelementptr inbounds i32** %122, i64 0
  %124 = load i32** %123, align 8
  %125 = getelementptr inbounds i32* %124, i64 0
  %126 = load i32* %125, align 4
  br label %139

; <label>:127                                     ; preds = %111
  %128 = sext i16 %ref to i64
  %129 = sext i16 %68 to i64
  %130 = load i32***** @wbp_weight, align 8
  %131 = getelementptr inbounds i32**** %130, i64 %129
  %132 = load i32**** %131, align 8
  %133 = getelementptr inbounds i32*** %132, i64 0
  %134 = load i32*** %133, align 8
  %135 = getelementptr inbounds i32** %134, i64 %128
  %136 = load i32** %135, align 8
  %137 = getelementptr inbounds i32* %136, i64 0
  %138 = load i32* %137, align 4
  br label %139

; <label>:139                                     ; preds = %127, %113
  %140 = phi i32 [ %126, %113 ], [ %138, %127 ]
  br label %142

; <label>:141                                     ; preds = %106
  br label %142

; <label>:142                                     ; preds = %141, %139
  %143 = phi i32 [ %140, %139 ], [ 1, %141 ]
  %144 = trunc i32 %143 to i16
  %145 = sext i16 %72 to i32
  %146 = icmp ne i32 %145, 0
  br i1 %146, label %147, label %172

; <label>:147                                     ; preds = %142
  %148 = icmp eq i32 %list, 0
  br i1 %148, label %149, label %159

; <label>:149                                     ; preds = %147
  %150 = sext i16 %ref to i64
  %151 = sext i16 %68 to i64
  %152 = load i32**** @wp_offset, align 8
  %153 = getelementptr inbounds i32*** %152, i64 %151
  %154 = load i32*** %153, align 8
  %155 = getelementptr inbounds i32** %154, i64 %150
  %156 = load i32** %155, align 8
  %157 = getelementptr inbounds i32* %156, i64 0
  %158 = load i32* %157, align 4
  br label %170

; <label>:159                                     ; preds = %147
  %160 = sext i16 %68 to i32
  %161 = add nsw i32 %160, 1
  %162 = sext i32 %161 to i64
  %163 = load i32**** @wp_offset, align 8
  %164 = getelementptr inbounds i32*** %163, i64 %162
  %165 = load i32*** %164, align 8
  %166 = getelementptr inbounds i32** %165, i64 0
  %167 = load i32** %166, align 8
  %168 = getelementptr inbounds i32* %167, i64 0
  %169 = load i32* %168, align 4
  br label %170

; <label>:170                                     ; preds = %159, %149
  %171 = phi i32 [ %158, %149 ], [ %169, %159 ]
  br label %173

; <label>:172                                     ; preds = %142
  br label %173

; <label>:173                                     ; preds = %172, %170
  %174 = phi i32 [ %171, %170 ], [ 0, %172 ]
  %175 = trunc i32 %174 to i16
  %176 = sext i16 %72 to i32
  %177 = icmp ne i32 %176, 0
  br i1 %177, label %178, label %203

; <label>:178                                     ; preds = %173
  %179 = icmp eq i32 %list, 0
  br i1 %179, label %180, label %192

; <label>:180                                     ; preds = %178
  %181 = sext i16 %ref to i64
  %182 = sext i16 %68 to i32
  %183 = add nsw i32 %182, 1
  %184 = sext i32 %183 to i64
  %185 = load i32**** @wp_offset, align 8
  %186 = getelementptr inbounds i32*** %185, i64 %184
  %187 = load i32*** %186, align 8
  %188 = getelementptr inbounds i32** %187, i64 %181
  %189 = load i32** %188, align 8
  %190 = getelementptr inbounds i32* %189, i64 0
  %191 = load i32* %190, align 4
  br label %201

; <label>:192                                     ; preds = %178
  %193 = sext i16 %68 to i64
  %194 = load i32**** @wp_offset, align 8
  %195 = getelementptr inbounds i32*** %194, i64 %193
  %196 = load i32*** %195, align 8
  %197 = getelementptr inbounds i32** %196, i64 0
  %198 = load i32** %197, align 8
  %199 = getelementptr inbounds i32* %198, i64 0
  %200 = load i32* %199, align 4
  br label %201

; <label>:201                                     ; preds = %192, %180
  %202 = phi i32 [ %191, %180 ], [ %200, %192 ]
  br label %204

; <label>:203                                     ; preds = %173
  br label %204

; <label>:204                                     ; preds = %203, %201
  %205 = phi i32 [ %202, %201 ], [ 0, %203 ]
  %206 = trunc i32 %205 to i16
  %207 = sext i16 %206 to i32
  %208 = sext i16 %175 to i32
  %209 = add nsw i32 %207, %208
  %210 = add nsw i32 %209, 1
  %211 = ashr i32 %210, 1
  %212 = trunc i32 %211 to i16
  %213 = load %struct.InputParameters** @input, align 8
  %214 = getelementptr inbounds %struct.InputParameters* %213, i32 0, i32 7
  %215 = load i32* %214, align 4
  %216 = icmp ne i32 %215, 0
  br i1 %216, label %217, label %218

; <label>:217                                     ; preds = %204
  br label %222

; <label>:218                                     ; preds = %204
  %219 = load %struct.InputParameters** @input, align 8
  %220 = getelementptr inbounds %struct.InputParameters* %219, i32 0, i32 6
  %221 = load i32* %220, align 4
  br label %222

; <label>:222                                     ; preds = %218, %217
  %223 = phi i32 [ 0, %217 ], [ %221, %218 ]
  %224 = load %struct.InputParameters** @input, align 8
  %225 = getelementptr inbounds %struct.InputParameters* %224, i32 0, i32 7
  %226 = load i32* %225, align 4
  %227 = icmp ne i32 %226, 0
  %228 = select i1 %227, i32 0, i32 1
  %229 = sext i16 %ref to i64
  %230 = sext i16 %68 to i32
  %231 = add nsw i32 %list, %230
  %232 = sext i32 %231 to i64
  %233 = getelementptr inbounds [6 x %struct.storable_picture**]* @listX, i32 0, i64 %232
  %234 = load %struct.storable_picture*** %233, align 8
  %235 = getelementptr inbounds %struct.storable_picture** %234, i64 %229
  %236 = load %struct.storable_picture** %235, align 8
  %237 = getelementptr inbounds %struct.storable_picture* %236, i32 0, i32 28
  %238 = load i16*** %237, align 8
  %239 = icmp eq i32 %list, 0
  br i1 %239, label %240, label %243

; <label>:240                                     ; preds = %222
  %241 = sext i16 %68 to i32
  %242 = add nsw i32 1, %241
  br label %245

; <label>:243                                     ; preds = %222
  %244 = sext i16 %68 to i32
  br label %245

; <label>:245                                     ; preds = %243, %240
  %246 = phi i32 [ %242, %240 ], [ %244, %243 ]
  %247 = sext i32 %246 to i64
  %248 = getelementptr inbounds [6 x %struct.storable_picture**]* @listX, i32 0, i64 %247
  %249 = load %struct.storable_picture*** %248, align 8
  %250 = getelementptr inbounds %struct.storable_picture** %249, i64 0
  %251 = load %struct.storable_picture** %250, align 8
  %252 = getelementptr inbounds %struct.storable_picture* %251, i32 0, i32 28
  %253 = load i16*** %252, align 8
  %254 = sext i16 %ref to i64
  %255 = sext i16 %68 to i32
  %256 = add nsw i32 %list, %255
  %257 = sext i32 %256 to i64
  %258 = getelementptr inbounds [6 x %struct.storable_picture**]* @listX, i32 0, i64 %257
  %259 = load %struct.storable_picture*** %258, align 8
  %260 = getelementptr inbounds %struct.storable_picture** %259, i64 %254
  %261 = load %struct.storable_picture** %260, align 8
  %262 = getelementptr inbounds %struct.storable_picture* %261, i32 0, i32 18
  %263 = load i32* %262, align 4
  %264 = getelementptr inbounds %struct.storable_picture* %261, i32 0, i32 19
  %265 = load i32* %264, align 4
  %266 = getelementptr inbounds %struct.storable_picture* %261, i32 0, i32 18
  %267 = load i32* %266, align 4
  %268 = sext i16 %10 to i32
  %269 = sub nsw i32 %267, %268
  %270 = add nsw i32 %269, 1
  %271 = shl i32 %270, 2
  %272 = trunc i32 %271 to i16
  %273 = getelementptr inbounds %struct.storable_picture* %261, i32 0, i32 19
  %274 = load i32* %273, align 4
  %275 = sext i16 %17 to i32
  %276 = sub nsw i32 %274, %275
  %277 = add nsw i32 %276, 1
  %278 = shl i32 %277, 2
  %279 = trunc i32 %278 to i16
  %280 = load i16* %mv_x, align 2
  %281 = sext i16 %280 to i32
  %282 = shl i32 %281, 2
  %283 = trunc i32 %282 to i16
  store i16 %283, i16* %mv_x, align 2
  %284 = load i16* %mv_y, align 2
  %285 = sext i16 %284 to i32
  %286 = shl i32 %285, 2
  %287 = trunc i32 %286 to i16
  store i16 %287, i16* %mv_y, align 2
  %288 = sext i16 %19 to i32
  %289 = load i16* %mv_x, align 2
  %290 = sext i16 %289 to i32
  %291 = add nsw i32 %288, %290
  %292 = icmp sgt i32 %291, 1
  br i1 %292, label %293, label %316

; <label>:293                                     ; preds = %245
  %294 = sext i16 %19 to i32
  %295 = load i16* %mv_x, align 2
  %296 = sext i16 %295 to i32
  %297 = add nsw i32 %294, %296
  %298 = sext i16 %272 to i32
  %299 = sub nsw i32 %298, 2
  %300 = icmp slt i32 %297, %299
  br i1 %300, label %301, label %316

; <label>:301                                     ; preds = %293
  %302 = sext i16 %21 to i32
  %303 = load i16* %mv_y, align 2
  %304 = sext i16 %303 to i32
  %305 = add nsw i32 %302, %304
  %306 = icmp sgt i32 %305, 1
  br i1 %306, label %307, label %316

; <label>:307                                     ; preds = %301
  %308 = sext i16 %21 to i32
  %309 = load i16* %mv_y, align 2
  %310 = sext i16 %309 to i32
  %311 = add nsw i32 %308, %310
  %312 = sext i16 %279 to i32
  %313 = sub nsw i32 %312, 2
  %314 = icmp slt i32 %311, %313
  br i1 %314, label %315, label %316

; <label>:315                                     ; preds = %307
  store i16 (i16**, i32, i32, i32, i32)* @FastPelY_14, i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  br label %317

; <label>:316                                     ; preds = %307, %301, %293, %245
  store i16 (i16**, i32, i32, i32, i32)* @UMVPelY_14, i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  br label %317

; <label>:317                                     ; preds = %316, %315
  %318 = sext i16 %19 to i32
  %319 = load i16* %s_mv_x, align 2
  %320 = sext i16 %319 to i32
  %321 = add nsw i32 %318, %320
  %322 = icmp sgt i32 %321, 1
  br i1 %322, label %323, label %346

; <label>:323                                     ; preds = %317
  %324 = sext i16 %19 to i32
  %325 = load i16* %s_mv_x, align 2
  %326 = sext i16 %325 to i32
  %327 = add nsw i32 %324, %326
  %328 = sext i16 %272 to i32
  %329 = sub nsw i32 %328, 2
  %330 = icmp slt i32 %327, %329
  br i1 %330, label %331, label %346

; <label>:331                                     ; preds = %323
  %332 = sext i16 %21 to i32
  %333 = load i16* %s_mv_y, align 2
  %334 = sext i16 %333 to i32
  %335 = add nsw i32 %332, %334
  %336 = icmp sgt i32 %335, 1
  br i1 %336, label %337, label %346

; <label>:337                                     ; preds = %331
  %338 = sext i16 %21 to i32
  %339 = load i16* %s_mv_y, align 2
  %340 = sext i16 %339 to i32
  %341 = add nsw i32 %338, %340
  %342 = sext i16 %279 to i32
  %343 = sub nsw i32 %342, 2
  %344 = icmp slt i32 %341, %343
  br i1 %344, label %345, label %346

; <label>:345                                     ; preds = %337
  store i16 (i16**, i32, i32, i32, i32)* @FastPelY_14, i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  br label %347

; <label>:346                                     ; preds = %337, %331, %323, %317
  store i16 (i16**, i32, i32, i32, i32)* @UMVPelY_14, i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  br label %347

; <label>:347                                     ; preds = %346, %345
  br label %348

; <label>:348                                     ; preds = %2527, %347
  %pos.0 = phi i16 [ %27, %347 ], [ %2528, %2527 ]
  %best_pos.0 = phi i16 [ 0, %347 ], [ %best_pos.1, %2527 ]
  %.0 = phi i32 [ %min_mcost, %347 ], [ %.1, %2527 ]
  %349 = sext i16 %pos.0 to i32
  %350 = sext i16 %41 to i32
  %351 = icmp slt i32 %349, %350
  br i1 %351, label %352, label %2529

; <label>:352                                     ; preds = %348
  %353 = load i16* %mv_x, align 2
  %354 = sext i16 %353 to i32
  %355 = sext i16 %pos.0 to i64
  %356 = load i32** @spiral_search_x, align 8
  %357 = getelementptr inbounds i32* %356, i64 %355
  %358 = load i32* %357, align 4
  %359 = shl i32 %358, 1
  %360 = add nsw i32 %354, %359
  %361 = trunc i32 %360 to i16
  %362 = load i16* %mv_y, align 2
  %363 = sext i16 %362 to i32
  %364 = sext i16 %pos.0 to i64
  %365 = load i32** @spiral_search_y, align 8
  %366 = getelementptr inbounds i32* %365, i64 %364
  %367 = load i32* %366, align 4
  %368 = shl i32 %367, 1
  %369 = add nsw i32 %363, %368
  %370 = trunc i32 %369 to i16
  %371 = sext i16 %361 to i32
  %372 = sext i16 0 to i32
  %373 = shl i32 %371, %372
  %374 = sext i16 %pred_mv_x to i32
  %375 = sub nsw i32 %373, %374
  %376 = sext i32 %375 to i64
  %377 = load i32** @mvbits, align 8
  %378 = getelementptr inbounds i32* %377, i64 %376
  %379 = load i32* %378, align 4
  %380 = sext i16 %370 to i32
  %381 = sext i16 0 to i32
  %382 = shl i32 %380, %381
  %383 = sext i16 %pred_mv_y to i32
  %384 = sub nsw i32 %382, %383
  %385 = sext i32 %384 to i64
  %386 = load i32** @mvbits, align 8
  %387 = getelementptr inbounds i32* %386, i64 %385
  %388 = load i32* %387, align 4
  %389 = add nsw i32 %379, %388
  %390 = mul nsw i32 %3, %389
  %391 = ashr i32 %390, 16
  %392 = trunc i32 %391 to i16
  br label %393

; <label>:393                                     ; preds = %2506, %352
  %mcost.0 = phi i16 [ %392, %352 ], [ %mcost.7, %2506 ]
  %abort_search.0 = phi i16 [ 0, %352 ], [ %abort_search.3, %2506 ]
  %y0.0 = phi i16 [ 0, %352 ], [ %2509, %2506 ]
  %394 = sext i16 %y0.0 to i32
  %395 = sext i16 %17 to i32
  %396 = icmp slt i32 %394, %395
  br i1 %396, label %397, label %400

; <label>:397                                     ; preds = %393
  %398 = icmp ne i16 %abort_search.0, 0
  %399 = xor i1 %398, true
  br label %400

; <label>:400                                     ; preds = %397, %393
  %401 = phi i1 [ false, %393 ], [ %399, %397 ]
  br i1 %401, label %402, label %2510

; <label>:402                                     ; preds = %400
  %403 = sext i16 %y0.0 to i32
  %404 = add nsw i32 %pic_pix_y, %403
  %405 = shl i32 %404, 2
  %406 = load i16* %s_mv_y, align 2
  %407 = sext i16 %406 to i32
  %408 = add nsw i32 %405, %407
  %409 = trunc i32 %408 to i16
  %410 = sext i16 %y0.0 to i32
  %411 = add nsw i32 %pic_pix_y, %410
  %412 = shl i32 %411, 2
  %413 = sext i16 %370 to i32
  %414 = add nsw i32 %412, %413
  %415 = trunc i32 %414 to i16
  %416 = icmp ne i16 %72, 0
  br i1 %416, label %417, label %2069

; <label>:417                                     ; preds = %402
  br label %418

; <label>:418                                     ; preds = %2064, %417
  %mcost.1 = phi i16 [ %mcost.0, %417 ], [ %mcost.2, %2064 ]
  %x0.0 = phi i16 [ 0, %417 ], [ %2067, %2064 ]
  %419 = sext i16 %x0.0 to i32
  %420 = sext i16 %10 to i32
  %421 = icmp slt i32 %419, %420
  br i1 %421, label %422, label %2068

; <label>:422                                     ; preds = %418
  %423 = sext i16 %x0.0 to i32
  %424 = add nsw i32 %pic_pix_x, %423
  %425 = shl i32 %424, 2
  %426 = load i16* %s_mv_x, align 2
  %427 = sext i16 %426 to i32
  %428 = add nsw i32 %425, %427
  %429 = trunc i32 %428 to i16
  %430 = sext i16 %x0.0 to i32
  %431 = add nsw i32 %pic_pix_x, %430
  %432 = shl i32 %431, 2
  %433 = sext i16 %361 to i32
  %434 = add nsw i32 %432, %433
  %435 = trunc i32 %434 to i16
  %436 = getelementptr inbounds [16 x i32]* %diff, i32 0, i32 0
  %437 = sext i16 %y0.0 to i64
  %438 = getelementptr inbounds i16** %orig_pic, i64 %437
  %439 = load i16** %438, align 8
  %440 = sext i16 %108 to i32
  %441 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %442 = sext i16 %409 to i32
  %443 = sext i16 %429 to i32
  %444 = call zeroext i16 %441(i16** %238, i32 %442, i32 %443, i32 %265, i32 %263)
  %445 = zext i16 %444 to i32
  %446 = mul nsw i32 %440, %445
  %447 = sext i16 %144 to i32
  %448 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %449 = sext i16 %415 to i32
  %450 = sext i16 %435 to i32
  %451 = call zeroext i16 %448(i16** %253, i32 %449, i32 %450, i32 %265, i32 %263)
  %452 = zext i16 %451 to i32
  %453 = mul nsw i32 %447, %452
  %454 = add nsw i32 %446, %453
  %455 = load i32* @wp_luma_round, align 4
  %456 = mul nsw i32 2, %455
  %457 = add nsw i32 %454, %456
  %458 = load i32* @luma_log_weight_denom, align 4
  %459 = add nsw i32 %458, 1
  %460 = ashr i32 %457, %459
  %461 = sext i16 %212 to i32
  %462 = add nsw i32 %460, %461
  %463 = icmp slt i32 %462, 0
  br i1 %463, label %464, label %465

; <label>:464                                     ; preds = %422
  br label %523

; <label>:465                                     ; preds = %422
  %466 = sext i16 %108 to i32
  %467 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %468 = sext i16 %409 to i32
  %469 = sext i16 %429 to i32
  %470 = call zeroext i16 %467(i16** %238, i32 %468, i32 %469, i32 %265, i32 %263)
  %471 = zext i16 %470 to i32
  %472 = mul nsw i32 %466, %471
  %473 = sext i16 %144 to i32
  %474 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %475 = sext i16 %415 to i32
  %476 = sext i16 %435 to i32
  %477 = call zeroext i16 %474(i16** %253, i32 %475, i32 %476, i32 %265, i32 %263)
  %478 = zext i16 %477 to i32
  %479 = mul nsw i32 %473, %478
  %480 = add nsw i32 %472, %479
  %481 = load i32* @wp_luma_round, align 4
  %482 = mul nsw i32 2, %481
  %483 = add nsw i32 %480, %482
  %484 = load i32* @luma_log_weight_denom, align 4
  %485 = add nsw i32 %484, 1
  %486 = ashr i32 %483, %485
  %487 = sext i16 %212 to i32
  %488 = add nsw i32 %486, %487
  %489 = load %struct.ImageParameters** @img, align 8
  %490 = getelementptr inbounds %struct.ImageParameters* %489, i32 0, i32 155
  %491 = load i32* %490, align 4
  %492 = icmp sgt i32 %488, %491
  br i1 %492, label %493, label %497

; <label>:493                                     ; preds = %465
  %494 = load %struct.ImageParameters** @img, align 8
  %495 = getelementptr inbounds %struct.ImageParameters* %494, i32 0, i32 155
  %496 = load i32* %495, align 4
  br label %521

; <label>:497                                     ; preds = %465
  %498 = sext i16 %108 to i32
  %499 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %500 = sext i16 %409 to i32
  %501 = sext i16 %429 to i32
  %502 = call zeroext i16 %499(i16** %238, i32 %500, i32 %501, i32 %265, i32 %263)
  %503 = zext i16 %502 to i32
  %504 = mul nsw i32 %498, %503
  %505 = sext i16 %144 to i32
  %506 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %507 = sext i16 %415 to i32
  %508 = sext i16 %435 to i32
  %509 = call zeroext i16 %506(i16** %253, i32 %507, i32 %508, i32 %265, i32 %263)
  %510 = zext i16 %509 to i32
  %511 = mul nsw i32 %505, %510
  %512 = add nsw i32 %504, %511
  %513 = load i32* @wp_luma_round, align 4
  %514 = mul nsw i32 2, %513
  %515 = add nsw i32 %512, %514
  %516 = load i32* @luma_log_weight_denom, align 4
  %517 = add nsw i32 %516, 1
  %518 = ashr i32 %515, %517
  %519 = sext i16 %212 to i32
  %520 = add nsw i32 %518, %519
  br label %521

; <label>:521                                     ; preds = %497, %493
  %522 = phi i32 [ %496, %493 ], [ %520, %497 ]
  br label %523

; <label>:523                                     ; preds = %521, %464
  %524 = phi i32 [ 0, %464 ], [ %522, %521 ]
  %525 = sext i16 %x0.0 to i64
  %526 = getelementptr inbounds i16* %439, i64 %525
  %527 = load i16* %526, align 2
  %528 = zext i16 %527 to i32
  %529 = sub nsw i32 %528, %524
  %530 = getelementptr inbounds i32* %436, i32 1
  store i32 %529, i32* %436, align 4
  %531 = sext i16 %108 to i32
  %532 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %533 = sext i16 %409 to i32
  %534 = sext i16 %429 to i32
  %535 = add nsw i32 %534, 4
  %536 = call zeroext i16 %532(i16** %238, i32 %533, i32 %535, i32 %265, i32 %263)
  %537 = zext i16 %536 to i32
  %538 = mul nsw i32 %531, %537
  %539 = sext i16 %144 to i32
  %540 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %541 = sext i16 %415 to i32
  %542 = sext i16 %435 to i32
  %543 = add nsw i32 %542, 4
  %544 = call zeroext i16 %540(i16** %253, i32 %541, i32 %543, i32 %265, i32 %263)
  %545 = zext i16 %544 to i32
  %546 = mul nsw i32 %539, %545
  %547 = add nsw i32 %538, %546
  %548 = load i32* @wp_luma_round, align 4
  %549 = mul nsw i32 2, %548
  %550 = add nsw i32 %547, %549
  %551 = load i32* @luma_log_weight_denom, align 4
  %552 = add nsw i32 %551, 1
  %553 = ashr i32 %550, %552
  %554 = sext i16 %212 to i32
  %555 = add nsw i32 %553, %554
  %556 = icmp slt i32 %555, 0
  br i1 %556, label %557, label %558

; <label>:557                                     ; preds = %523
  br label %620

; <label>:558                                     ; preds = %523
  %559 = sext i16 %108 to i32
  %560 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %561 = sext i16 %409 to i32
  %562 = sext i16 %429 to i32
  %563 = add nsw i32 %562, 4
  %564 = call zeroext i16 %560(i16** %238, i32 %561, i32 %563, i32 %265, i32 %263)
  %565 = zext i16 %564 to i32
  %566 = mul nsw i32 %559, %565
  %567 = sext i16 %144 to i32
  %568 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %569 = sext i16 %415 to i32
  %570 = sext i16 %435 to i32
  %571 = add nsw i32 %570, 4
  %572 = call zeroext i16 %568(i16** %253, i32 %569, i32 %571, i32 %265, i32 %263)
  %573 = zext i16 %572 to i32
  %574 = mul nsw i32 %567, %573
  %575 = add nsw i32 %566, %574
  %576 = load i32* @wp_luma_round, align 4
  %577 = mul nsw i32 2, %576
  %578 = add nsw i32 %575, %577
  %579 = load i32* @luma_log_weight_denom, align 4
  %580 = add nsw i32 %579, 1
  %581 = ashr i32 %578, %580
  %582 = sext i16 %212 to i32
  %583 = add nsw i32 %581, %582
  %584 = load %struct.ImageParameters** @img, align 8
  %585 = getelementptr inbounds %struct.ImageParameters* %584, i32 0, i32 155
  %586 = load i32* %585, align 4
  %587 = icmp sgt i32 %583, %586
  br i1 %587, label %588, label %592

; <label>:588                                     ; preds = %558
  %589 = load %struct.ImageParameters** @img, align 8
  %590 = getelementptr inbounds %struct.ImageParameters* %589, i32 0, i32 155
  %591 = load i32* %590, align 4
  br label %618

; <label>:592                                     ; preds = %558
  %593 = sext i16 %108 to i32
  %594 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %595 = sext i16 %409 to i32
  %596 = sext i16 %429 to i32
  %597 = add nsw i32 %596, 4
  %598 = call zeroext i16 %594(i16** %238, i32 %595, i32 %597, i32 %265, i32 %263)
  %599 = zext i16 %598 to i32
  %600 = mul nsw i32 %593, %599
  %601 = sext i16 %144 to i32
  %602 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %603 = sext i16 %415 to i32
  %604 = sext i16 %435 to i32
  %605 = add nsw i32 %604, 4
  %606 = call zeroext i16 %602(i16** %253, i32 %603, i32 %605, i32 %265, i32 %263)
  %607 = zext i16 %606 to i32
  %608 = mul nsw i32 %601, %607
  %609 = add nsw i32 %600, %608
  %610 = load i32* @wp_luma_round, align 4
  %611 = mul nsw i32 2, %610
  %612 = add nsw i32 %609, %611
  %613 = load i32* @luma_log_weight_denom, align 4
  %614 = add nsw i32 %613, 1
  %615 = ashr i32 %612, %614
  %616 = sext i16 %212 to i32
  %617 = add nsw i32 %615, %616
  br label %618

; <label>:618                                     ; preds = %592, %588
  %619 = phi i32 [ %591, %588 ], [ %617, %592 ]
  br label %620

; <label>:620                                     ; preds = %618, %557
  %621 = phi i32 [ 0, %557 ], [ %619, %618 ]
  %622 = sext i16 %x0.0 to i32
  %623 = add nsw i32 %622, 1
  %624 = sext i32 %623 to i64
  %625 = getelementptr inbounds i16* %439, i64 %624
  %626 = load i16* %625, align 2
  %627 = zext i16 %626 to i32
  %628 = sub nsw i32 %627, %621
  %629 = getelementptr inbounds i32* %530, i32 1
  store i32 %628, i32* %530, align 4
  %630 = sext i16 %108 to i32
  %631 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %632 = sext i16 %409 to i32
  %633 = sext i16 %429 to i32
  %634 = add nsw i32 %633, 8
  %635 = call zeroext i16 %631(i16** %238, i32 %632, i32 %634, i32 %265, i32 %263)
  %636 = zext i16 %635 to i32
  %637 = mul nsw i32 %630, %636
  %638 = sext i16 %144 to i32
  %639 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %640 = sext i16 %415 to i32
  %641 = sext i16 %435 to i32
  %642 = add nsw i32 %641, 8
  %643 = call zeroext i16 %639(i16** %253, i32 %640, i32 %642, i32 %265, i32 %263)
  %644 = zext i16 %643 to i32
  %645 = mul nsw i32 %638, %644
  %646 = add nsw i32 %637, %645
  %647 = load i32* @wp_luma_round, align 4
  %648 = mul nsw i32 2, %647
  %649 = add nsw i32 %646, %648
  %650 = load i32* @luma_log_weight_denom, align 4
  %651 = add nsw i32 %650, 1
  %652 = ashr i32 %649, %651
  %653 = sext i16 %212 to i32
  %654 = add nsw i32 %652, %653
  %655 = icmp slt i32 %654, 0
  br i1 %655, label %656, label %657

; <label>:656                                     ; preds = %620
  br label %719

; <label>:657                                     ; preds = %620
  %658 = sext i16 %108 to i32
  %659 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %660 = sext i16 %409 to i32
  %661 = sext i16 %429 to i32
  %662 = add nsw i32 %661, 8
  %663 = call zeroext i16 %659(i16** %238, i32 %660, i32 %662, i32 %265, i32 %263)
  %664 = zext i16 %663 to i32
  %665 = mul nsw i32 %658, %664
  %666 = sext i16 %144 to i32
  %667 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %668 = sext i16 %415 to i32
  %669 = sext i16 %435 to i32
  %670 = add nsw i32 %669, 8
  %671 = call zeroext i16 %667(i16** %253, i32 %668, i32 %670, i32 %265, i32 %263)
  %672 = zext i16 %671 to i32
  %673 = mul nsw i32 %666, %672
  %674 = add nsw i32 %665, %673
  %675 = load i32* @wp_luma_round, align 4
  %676 = mul nsw i32 2, %675
  %677 = add nsw i32 %674, %676
  %678 = load i32* @luma_log_weight_denom, align 4
  %679 = add nsw i32 %678, 1
  %680 = ashr i32 %677, %679
  %681 = sext i16 %212 to i32
  %682 = add nsw i32 %680, %681
  %683 = load %struct.ImageParameters** @img, align 8
  %684 = getelementptr inbounds %struct.ImageParameters* %683, i32 0, i32 155
  %685 = load i32* %684, align 4
  %686 = icmp sgt i32 %682, %685
  br i1 %686, label %687, label %691

; <label>:687                                     ; preds = %657
  %688 = load %struct.ImageParameters** @img, align 8
  %689 = getelementptr inbounds %struct.ImageParameters* %688, i32 0, i32 155
  %690 = load i32* %689, align 4
  br label %717

; <label>:691                                     ; preds = %657
  %692 = sext i16 %108 to i32
  %693 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %694 = sext i16 %409 to i32
  %695 = sext i16 %429 to i32
  %696 = add nsw i32 %695, 8
  %697 = call zeroext i16 %693(i16** %238, i32 %694, i32 %696, i32 %265, i32 %263)
  %698 = zext i16 %697 to i32
  %699 = mul nsw i32 %692, %698
  %700 = sext i16 %144 to i32
  %701 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %702 = sext i16 %415 to i32
  %703 = sext i16 %435 to i32
  %704 = add nsw i32 %703, 8
  %705 = call zeroext i16 %701(i16** %253, i32 %702, i32 %704, i32 %265, i32 %263)
  %706 = zext i16 %705 to i32
  %707 = mul nsw i32 %700, %706
  %708 = add nsw i32 %699, %707
  %709 = load i32* @wp_luma_round, align 4
  %710 = mul nsw i32 2, %709
  %711 = add nsw i32 %708, %710
  %712 = load i32* @luma_log_weight_denom, align 4
  %713 = add nsw i32 %712, 1
  %714 = ashr i32 %711, %713
  %715 = sext i16 %212 to i32
  %716 = add nsw i32 %714, %715
  br label %717

; <label>:717                                     ; preds = %691, %687
  %718 = phi i32 [ %690, %687 ], [ %716, %691 ]
  br label %719

; <label>:719                                     ; preds = %717, %656
  %720 = phi i32 [ 0, %656 ], [ %718, %717 ]
  %721 = sext i16 %x0.0 to i32
  %722 = add nsw i32 %721, 2
  %723 = sext i32 %722 to i64
  %724 = getelementptr inbounds i16* %439, i64 %723
  %725 = load i16* %724, align 2
  %726 = zext i16 %725 to i32
  %727 = sub nsw i32 %726, %720
  %728 = getelementptr inbounds i32* %629, i32 1
  store i32 %727, i32* %629, align 4
  %729 = sext i16 %108 to i32
  %730 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %731 = sext i16 %409 to i32
  %732 = sext i16 %429 to i32
  %733 = add nsw i32 %732, 12
  %734 = call zeroext i16 %730(i16** %238, i32 %731, i32 %733, i32 %265, i32 %263)
  %735 = zext i16 %734 to i32
  %736 = mul nsw i32 %729, %735
  %737 = sext i16 %144 to i32
  %738 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %739 = sext i16 %415 to i32
  %740 = sext i16 %435 to i32
  %741 = add nsw i32 %740, 12
  %742 = call zeroext i16 %738(i16** %253, i32 %739, i32 %741, i32 %265, i32 %263)
  %743 = zext i16 %742 to i32
  %744 = mul nsw i32 %737, %743
  %745 = add nsw i32 %736, %744
  %746 = load i32* @wp_luma_round, align 4
  %747 = mul nsw i32 2, %746
  %748 = add nsw i32 %745, %747
  %749 = load i32* @luma_log_weight_denom, align 4
  %750 = add nsw i32 %749, 1
  %751 = ashr i32 %748, %750
  %752 = sext i16 %212 to i32
  %753 = add nsw i32 %751, %752
  %754 = icmp slt i32 %753, 0
  br i1 %754, label %755, label %756

; <label>:755                                     ; preds = %719
  br label %818

; <label>:756                                     ; preds = %719
  %757 = sext i16 %108 to i32
  %758 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %759 = sext i16 %409 to i32
  %760 = sext i16 %429 to i32
  %761 = add nsw i32 %760, 12
  %762 = call zeroext i16 %758(i16** %238, i32 %759, i32 %761, i32 %265, i32 %263)
  %763 = zext i16 %762 to i32
  %764 = mul nsw i32 %757, %763
  %765 = sext i16 %144 to i32
  %766 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %767 = sext i16 %415 to i32
  %768 = sext i16 %435 to i32
  %769 = add nsw i32 %768, 12
  %770 = call zeroext i16 %766(i16** %253, i32 %767, i32 %769, i32 %265, i32 %263)
  %771 = zext i16 %770 to i32
  %772 = mul nsw i32 %765, %771
  %773 = add nsw i32 %764, %772
  %774 = load i32* @wp_luma_round, align 4
  %775 = mul nsw i32 2, %774
  %776 = add nsw i32 %773, %775
  %777 = load i32* @luma_log_weight_denom, align 4
  %778 = add nsw i32 %777, 1
  %779 = ashr i32 %776, %778
  %780 = sext i16 %212 to i32
  %781 = add nsw i32 %779, %780
  %782 = load %struct.ImageParameters** @img, align 8
  %783 = getelementptr inbounds %struct.ImageParameters* %782, i32 0, i32 155
  %784 = load i32* %783, align 4
  %785 = icmp sgt i32 %781, %784
  br i1 %785, label %786, label %790

; <label>:786                                     ; preds = %756
  %787 = load %struct.ImageParameters** @img, align 8
  %788 = getelementptr inbounds %struct.ImageParameters* %787, i32 0, i32 155
  %789 = load i32* %788, align 4
  br label %816

; <label>:790                                     ; preds = %756
  %791 = sext i16 %108 to i32
  %792 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %793 = sext i16 %409 to i32
  %794 = sext i16 %429 to i32
  %795 = add nsw i32 %794, 12
  %796 = call zeroext i16 %792(i16** %238, i32 %793, i32 %795, i32 %265, i32 %263)
  %797 = zext i16 %796 to i32
  %798 = mul nsw i32 %791, %797
  %799 = sext i16 %144 to i32
  %800 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %801 = sext i16 %415 to i32
  %802 = sext i16 %435 to i32
  %803 = add nsw i32 %802, 12
  %804 = call zeroext i16 %800(i16** %253, i32 %801, i32 %803, i32 %265, i32 %263)
  %805 = zext i16 %804 to i32
  %806 = mul nsw i32 %799, %805
  %807 = add nsw i32 %798, %806
  %808 = load i32* @wp_luma_round, align 4
  %809 = mul nsw i32 2, %808
  %810 = add nsw i32 %807, %809
  %811 = load i32* @luma_log_weight_denom, align 4
  %812 = add nsw i32 %811, 1
  %813 = ashr i32 %810, %812
  %814 = sext i16 %212 to i32
  %815 = add nsw i32 %813, %814
  br label %816

; <label>:816                                     ; preds = %790, %786
  %817 = phi i32 [ %789, %786 ], [ %815, %790 ]
  br label %818

; <label>:818                                     ; preds = %816, %755
  %819 = phi i32 [ 0, %755 ], [ %817, %816 ]
  %820 = sext i16 %x0.0 to i32
  %821 = add nsw i32 %820, 3
  %822 = sext i32 %821 to i64
  %823 = getelementptr inbounds i16* %439, i64 %822
  %824 = load i16* %823, align 2
  %825 = zext i16 %824 to i32
  %826 = sub nsw i32 %825, %819
  %827 = getelementptr inbounds i32* %728, i32 1
  store i32 %826, i32* %728, align 4
  %828 = sext i16 %409 to i32
  %829 = add nsw i32 %828, 4
  %830 = trunc i32 %829 to i16
  %831 = sext i16 %415 to i32
  %832 = add nsw i32 %831, 4
  %833 = trunc i32 %832 to i16
  %834 = sext i16 %y0.0 to i32
  %835 = add nsw i32 %834, 1
  %836 = sext i32 %835 to i64
  %837 = getelementptr inbounds i16** %orig_pic, i64 %836
  %838 = load i16** %837, align 8
  %839 = sext i16 %108 to i32
  %840 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %841 = sext i16 %830 to i32
  %842 = sext i16 %429 to i32
  %843 = call zeroext i16 %840(i16** %238, i32 %841, i32 %842, i32 %265, i32 %263)
  %844 = zext i16 %843 to i32
  %845 = mul nsw i32 %839, %844
  %846 = sext i16 %144 to i32
  %847 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %848 = sext i16 %833 to i32
  %849 = sext i16 %435 to i32
  %850 = call zeroext i16 %847(i16** %253, i32 %848, i32 %849, i32 %265, i32 %263)
  %851 = zext i16 %850 to i32
  %852 = mul nsw i32 %846, %851
  %853 = add nsw i32 %845, %852
  %854 = load i32* @wp_luma_round, align 4
  %855 = mul nsw i32 2, %854
  %856 = add nsw i32 %853, %855
  %857 = load i32* @luma_log_weight_denom, align 4
  %858 = add nsw i32 %857, 1
  %859 = ashr i32 %856, %858
  %860 = sext i16 %212 to i32
  %861 = add nsw i32 %859, %860
  %862 = icmp slt i32 %861, 0
  br i1 %862, label %863, label %864

; <label>:863                                     ; preds = %818
  br label %922

; <label>:864                                     ; preds = %818
  %865 = sext i16 %108 to i32
  %866 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %867 = sext i16 %830 to i32
  %868 = sext i16 %429 to i32
  %869 = call zeroext i16 %866(i16** %238, i32 %867, i32 %868, i32 %265, i32 %263)
  %870 = zext i16 %869 to i32
  %871 = mul nsw i32 %865, %870
  %872 = sext i16 %144 to i32
  %873 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %874 = sext i16 %833 to i32
  %875 = sext i16 %435 to i32
  %876 = call zeroext i16 %873(i16** %253, i32 %874, i32 %875, i32 %265, i32 %263)
  %877 = zext i16 %876 to i32
  %878 = mul nsw i32 %872, %877
  %879 = add nsw i32 %871, %878
  %880 = load i32* @wp_luma_round, align 4
  %881 = mul nsw i32 2, %880
  %882 = add nsw i32 %879, %881
  %883 = load i32* @luma_log_weight_denom, align 4
  %884 = add nsw i32 %883, 1
  %885 = ashr i32 %882, %884
  %886 = sext i16 %212 to i32
  %887 = add nsw i32 %885, %886
  %888 = load %struct.ImageParameters** @img, align 8
  %889 = getelementptr inbounds %struct.ImageParameters* %888, i32 0, i32 155
  %890 = load i32* %889, align 4
  %891 = icmp sgt i32 %887, %890
  br i1 %891, label %892, label %896

; <label>:892                                     ; preds = %864
  %893 = load %struct.ImageParameters** @img, align 8
  %894 = getelementptr inbounds %struct.ImageParameters* %893, i32 0, i32 155
  %895 = load i32* %894, align 4
  br label %920

; <label>:896                                     ; preds = %864
  %897 = sext i16 %108 to i32
  %898 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %899 = sext i16 %830 to i32
  %900 = sext i16 %429 to i32
  %901 = call zeroext i16 %898(i16** %238, i32 %899, i32 %900, i32 %265, i32 %263)
  %902 = zext i16 %901 to i32
  %903 = mul nsw i32 %897, %902
  %904 = sext i16 %144 to i32
  %905 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %906 = sext i16 %833 to i32
  %907 = sext i16 %435 to i32
  %908 = call zeroext i16 %905(i16** %253, i32 %906, i32 %907, i32 %265, i32 %263)
  %909 = zext i16 %908 to i32
  %910 = mul nsw i32 %904, %909
  %911 = add nsw i32 %903, %910
  %912 = load i32* @wp_luma_round, align 4
  %913 = mul nsw i32 2, %912
  %914 = add nsw i32 %911, %913
  %915 = load i32* @luma_log_weight_denom, align 4
  %916 = add nsw i32 %915, 1
  %917 = ashr i32 %914, %916
  %918 = sext i16 %212 to i32
  %919 = add nsw i32 %917, %918
  br label %920

; <label>:920                                     ; preds = %896, %892
  %921 = phi i32 [ %895, %892 ], [ %919, %896 ]
  br label %922

; <label>:922                                     ; preds = %920, %863
  %923 = phi i32 [ 0, %863 ], [ %921, %920 ]
  %924 = sext i16 %x0.0 to i64
  %925 = getelementptr inbounds i16* %838, i64 %924
  %926 = load i16* %925, align 2
  %927 = zext i16 %926 to i32
  %928 = sub nsw i32 %927, %923
  %929 = getelementptr inbounds i32* %827, i32 1
  store i32 %928, i32* %827, align 4
  %930 = sext i16 %108 to i32
  %931 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %932 = sext i16 %830 to i32
  %933 = sext i16 %429 to i32
  %934 = add nsw i32 %933, 4
  %935 = call zeroext i16 %931(i16** %238, i32 %932, i32 %934, i32 %265, i32 %263)
  %936 = zext i16 %935 to i32
  %937 = mul nsw i32 %930, %936
  %938 = sext i16 %144 to i32
  %939 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %940 = sext i16 %833 to i32
  %941 = sext i16 %435 to i32
  %942 = add nsw i32 %941, 4
  %943 = call zeroext i16 %939(i16** %253, i32 %940, i32 %942, i32 %265, i32 %263)
  %944 = zext i16 %943 to i32
  %945 = mul nsw i32 %938, %944
  %946 = add nsw i32 %937, %945
  %947 = load i32* @wp_luma_round, align 4
  %948 = mul nsw i32 2, %947
  %949 = add nsw i32 %946, %948
  %950 = load i32* @luma_log_weight_denom, align 4
  %951 = add nsw i32 %950, 1
  %952 = ashr i32 %949, %951
  %953 = sext i16 %212 to i32
  %954 = add nsw i32 %952, %953
  %955 = icmp slt i32 %954, 0
  br i1 %955, label %956, label %957

; <label>:956                                     ; preds = %922
  br label %1019

; <label>:957                                     ; preds = %922
  %958 = sext i16 %108 to i32
  %959 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %960 = sext i16 %830 to i32
  %961 = sext i16 %429 to i32
  %962 = add nsw i32 %961, 4
  %963 = call zeroext i16 %959(i16** %238, i32 %960, i32 %962, i32 %265, i32 %263)
  %964 = zext i16 %963 to i32
  %965 = mul nsw i32 %958, %964
  %966 = sext i16 %144 to i32
  %967 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %968 = sext i16 %833 to i32
  %969 = sext i16 %435 to i32
  %970 = add nsw i32 %969, 4
  %971 = call zeroext i16 %967(i16** %253, i32 %968, i32 %970, i32 %265, i32 %263)
  %972 = zext i16 %971 to i32
  %973 = mul nsw i32 %966, %972
  %974 = add nsw i32 %965, %973
  %975 = load i32* @wp_luma_round, align 4
  %976 = mul nsw i32 2, %975
  %977 = add nsw i32 %974, %976
  %978 = load i32* @luma_log_weight_denom, align 4
  %979 = add nsw i32 %978, 1
  %980 = ashr i32 %977, %979
  %981 = sext i16 %212 to i32
  %982 = add nsw i32 %980, %981
  %983 = load %struct.ImageParameters** @img, align 8
  %984 = getelementptr inbounds %struct.ImageParameters* %983, i32 0, i32 155
  %985 = load i32* %984, align 4
  %986 = icmp sgt i32 %982, %985
  br i1 %986, label %987, label %991

; <label>:987                                     ; preds = %957
  %988 = load %struct.ImageParameters** @img, align 8
  %989 = getelementptr inbounds %struct.ImageParameters* %988, i32 0, i32 155
  %990 = load i32* %989, align 4
  br label %1017

; <label>:991                                     ; preds = %957
  %992 = sext i16 %108 to i32
  %993 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %994 = sext i16 %830 to i32
  %995 = sext i16 %429 to i32
  %996 = add nsw i32 %995, 4
  %997 = call zeroext i16 %993(i16** %238, i32 %994, i32 %996, i32 %265, i32 %263)
  %998 = zext i16 %997 to i32
  %999 = mul nsw i32 %992, %998
  %1000 = sext i16 %144 to i32
  %1001 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %1002 = sext i16 %833 to i32
  %1003 = sext i16 %435 to i32
  %1004 = add nsw i32 %1003, 4
  %1005 = call zeroext i16 %1001(i16** %253, i32 %1002, i32 %1004, i32 %265, i32 %263)
  %1006 = zext i16 %1005 to i32
  %1007 = mul nsw i32 %1000, %1006
  %1008 = add nsw i32 %999, %1007
  %1009 = load i32* @wp_luma_round, align 4
  %1010 = mul nsw i32 2, %1009
  %1011 = add nsw i32 %1008, %1010
  %1012 = load i32* @luma_log_weight_denom, align 4
  %1013 = add nsw i32 %1012, 1
  %1014 = ashr i32 %1011, %1013
  %1015 = sext i16 %212 to i32
  %1016 = add nsw i32 %1014, %1015
  br label %1017

; <label>:1017                                    ; preds = %991, %987
  %1018 = phi i32 [ %990, %987 ], [ %1016, %991 ]
  br label %1019

; <label>:1019                                    ; preds = %1017, %956
  %1020 = phi i32 [ 0, %956 ], [ %1018, %1017 ]
  %1021 = sext i16 %x0.0 to i32
  %1022 = add nsw i32 %1021, 1
  %1023 = sext i32 %1022 to i64
  %1024 = getelementptr inbounds i16* %838, i64 %1023
  %1025 = load i16* %1024, align 2
  %1026 = zext i16 %1025 to i32
  %1027 = sub nsw i32 %1026, %1020
  %1028 = getelementptr inbounds i32* %929, i32 1
  store i32 %1027, i32* %929, align 4
  %1029 = sext i16 %108 to i32
  %1030 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %1031 = sext i16 %830 to i32
  %1032 = sext i16 %429 to i32
  %1033 = add nsw i32 %1032, 8
  %1034 = call zeroext i16 %1030(i16** %238, i32 %1031, i32 %1033, i32 %265, i32 %263)
  %1035 = zext i16 %1034 to i32
  %1036 = mul nsw i32 %1029, %1035
  %1037 = sext i16 %144 to i32
  %1038 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %1039 = sext i16 %833 to i32
  %1040 = sext i16 %435 to i32
  %1041 = add nsw i32 %1040, 8
  %1042 = call zeroext i16 %1038(i16** %253, i32 %1039, i32 %1041, i32 %265, i32 %263)
  %1043 = zext i16 %1042 to i32
  %1044 = mul nsw i32 %1037, %1043
  %1045 = add nsw i32 %1036, %1044
  %1046 = load i32* @wp_luma_round, align 4
  %1047 = mul nsw i32 2, %1046
  %1048 = add nsw i32 %1045, %1047
  %1049 = load i32* @luma_log_weight_denom, align 4
  %1050 = add nsw i32 %1049, 1
  %1051 = ashr i32 %1048, %1050
  %1052 = sext i16 %212 to i32
  %1053 = add nsw i32 %1051, %1052
  %1054 = icmp slt i32 %1053, 0
  br i1 %1054, label %1055, label %1056

; <label>:1055                                    ; preds = %1019
  br label %1118

; <label>:1056                                    ; preds = %1019
  %1057 = sext i16 %108 to i32
  %1058 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %1059 = sext i16 %830 to i32
  %1060 = sext i16 %429 to i32
  %1061 = add nsw i32 %1060, 8
  %1062 = call zeroext i16 %1058(i16** %238, i32 %1059, i32 %1061, i32 %265, i32 %263)
  %1063 = zext i16 %1062 to i32
  %1064 = mul nsw i32 %1057, %1063
  %1065 = sext i16 %144 to i32
  %1066 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %1067 = sext i16 %833 to i32
  %1068 = sext i16 %435 to i32
  %1069 = add nsw i32 %1068, 8
  %1070 = call zeroext i16 %1066(i16** %253, i32 %1067, i32 %1069, i32 %265, i32 %263)
  %1071 = zext i16 %1070 to i32
  %1072 = mul nsw i32 %1065, %1071
  %1073 = add nsw i32 %1064, %1072
  %1074 = load i32* @wp_luma_round, align 4
  %1075 = mul nsw i32 2, %1074
  %1076 = add nsw i32 %1073, %1075
  %1077 = load i32* @luma_log_weight_denom, align 4
  %1078 = add nsw i32 %1077, 1
  %1079 = ashr i32 %1076, %1078
  %1080 = sext i16 %212 to i32
  %1081 = add nsw i32 %1079, %1080
  %1082 = load %struct.ImageParameters** @img, align 8
  %1083 = getelementptr inbounds %struct.ImageParameters* %1082, i32 0, i32 155
  %1084 = load i32* %1083, align 4
  %1085 = icmp sgt i32 %1081, %1084
  br i1 %1085, label %1086, label %1090

; <label>:1086                                    ; preds = %1056
  %1087 = load %struct.ImageParameters** @img, align 8
  %1088 = getelementptr inbounds %struct.ImageParameters* %1087, i32 0, i32 155
  %1089 = load i32* %1088, align 4
  br label %1116

; <label>:1090                                    ; preds = %1056
  %1091 = sext i16 %108 to i32
  %1092 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %1093 = sext i16 %830 to i32
  %1094 = sext i16 %429 to i32
  %1095 = add nsw i32 %1094, 8
  %1096 = call zeroext i16 %1092(i16** %238, i32 %1093, i32 %1095, i32 %265, i32 %263)
  %1097 = zext i16 %1096 to i32
  %1098 = mul nsw i32 %1091, %1097
  %1099 = sext i16 %144 to i32
  %1100 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %1101 = sext i16 %833 to i32
  %1102 = sext i16 %435 to i32
  %1103 = add nsw i32 %1102, 8
  %1104 = call zeroext i16 %1100(i16** %253, i32 %1101, i32 %1103, i32 %265, i32 %263)
  %1105 = zext i16 %1104 to i32
  %1106 = mul nsw i32 %1099, %1105
  %1107 = add nsw i32 %1098, %1106
  %1108 = load i32* @wp_luma_round, align 4
  %1109 = mul nsw i32 2, %1108
  %1110 = add nsw i32 %1107, %1109
  %1111 = load i32* @luma_log_weight_denom, align 4
  %1112 = add nsw i32 %1111, 1
  %1113 = ashr i32 %1110, %1112
  %1114 = sext i16 %212 to i32
  %1115 = add nsw i32 %1113, %1114
  br label %1116

; <label>:1116                                    ; preds = %1090, %1086
  %1117 = phi i32 [ %1089, %1086 ], [ %1115, %1090 ]
  br label %1118

; <label>:1118                                    ; preds = %1116, %1055
  %1119 = phi i32 [ 0, %1055 ], [ %1117, %1116 ]
  %1120 = sext i16 %x0.0 to i32
  %1121 = add nsw i32 %1120, 2
  %1122 = sext i32 %1121 to i64
  %1123 = getelementptr inbounds i16* %838, i64 %1122
  %1124 = load i16* %1123, align 2
  %1125 = zext i16 %1124 to i32
  %1126 = sub nsw i32 %1125, %1119
  %1127 = getelementptr inbounds i32* %1028, i32 1
  store i32 %1126, i32* %1028, align 4
  %1128 = sext i16 %108 to i32
  %1129 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %1130 = sext i16 %830 to i32
  %1131 = sext i16 %429 to i32
  %1132 = add nsw i32 %1131, 12
  %1133 = call zeroext i16 %1129(i16** %238, i32 %1130, i32 %1132, i32 %265, i32 %263)
  %1134 = zext i16 %1133 to i32
  %1135 = mul nsw i32 %1128, %1134
  %1136 = sext i16 %144 to i32
  %1137 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %1138 = sext i16 %833 to i32
  %1139 = sext i16 %435 to i32
  %1140 = add nsw i32 %1139, 12
  %1141 = call zeroext i16 %1137(i16** %253, i32 %1138, i32 %1140, i32 %265, i32 %263)
  %1142 = zext i16 %1141 to i32
  %1143 = mul nsw i32 %1136, %1142
  %1144 = add nsw i32 %1135, %1143
  %1145 = load i32* @wp_luma_round, align 4
  %1146 = mul nsw i32 2, %1145
  %1147 = add nsw i32 %1144, %1146
  %1148 = load i32* @luma_log_weight_denom, align 4
  %1149 = add nsw i32 %1148, 1
  %1150 = ashr i32 %1147, %1149
  %1151 = sext i16 %212 to i32
  %1152 = add nsw i32 %1150, %1151
  %1153 = icmp slt i32 %1152, 0
  br i1 %1153, label %1154, label %1155

; <label>:1154                                    ; preds = %1118
  br label %1217

; <label>:1155                                    ; preds = %1118
  %1156 = sext i16 %108 to i32
  %1157 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %1158 = sext i16 %830 to i32
  %1159 = sext i16 %429 to i32
  %1160 = add nsw i32 %1159, 12
  %1161 = call zeroext i16 %1157(i16** %238, i32 %1158, i32 %1160, i32 %265, i32 %263)
  %1162 = zext i16 %1161 to i32
  %1163 = mul nsw i32 %1156, %1162
  %1164 = sext i16 %144 to i32
  %1165 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %1166 = sext i16 %833 to i32
  %1167 = sext i16 %435 to i32
  %1168 = add nsw i32 %1167, 12
  %1169 = call zeroext i16 %1165(i16** %253, i32 %1166, i32 %1168, i32 %265, i32 %263)
  %1170 = zext i16 %1169 to i32
  %1171 = mul nsw i32 %1164, %1170
  %1172 = add nsw i32 %1163, %1171
  %1173 = load i32* @wp_luma_round, align 4
  %1174 = mul nsw i32 2, %1173
  %1175 = add nsw i32 %1172, %1174
  %1176 = load i32* @luma_log_weight_denom, align 4
  %1177 = add nsw i32 %1176, 1
  %1178 = ashr i32 %1175, %1177
  %1179 = sext i16 %212 to i32
  %1180 = add nsw i32 %1178, %1179
  %1181 = load %struct.ImageParameters** @img, align 8
  %1182 = getelementptr inbounds %struct.ImageParameters* %1181, i32 0, i32 155
  %1183 = load i32* %1182, align 4
  %1184 = icmp sgt i32 %1180, %1183
  br i1 %1184, label %1185, label %1189

; <label>:1185                                    ; preds = %1155
  %1186 = load %struct.ImageParameters** @img, align 8
  %1187 = getelementptr inbounds %struct.ImageParameters* %1186, i32 0, i32 155
  %1188 = load i32* %1187, align 4
  br label %1215

; <label>:1189                                    ; preds = %1155
  %1190 = sext i16 %108 to i32
  %1191 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %1192 = sext i16 %830 to i32
  %1193 = sext i16 %429 to i32
  %1194 = add nsw i32 %1193, 12
  %1195 = call zeroext i16 %1191(i16** %238, i32 %1192, i32 %1194, i32 %265, i32 %263)
  %1196 = zext i16 %1195 to i32
  %1197 = mul nsw i32 %1190, %1196
  %1198 = sext i16 %144 to i32
  %1199 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %1200 = sext i16 %833 to i32
  %1201 = sext i16 %435 to i32
  %1202 = add nsw i32 %1201, 12
  %1203 = call zeroext i16 %1199(i16** %253, i32 %1200, i32 %1202, i32 %265, i32 %263)
  %1204 = zext i16 %1203 to i32
  %1205 = mul nsw i32 %1198, %1204
  %1206 = add nsw i32 %1197, %1205
  %1207 = load i32* @wp_luma_round, align 4
  %1208 = mul nsw i32 2, %1207
  %1209 = add nsw i32 %1206, %1208
  %1210 = load i32* @luma_log_weight_denom, align 4
  %1211 = add nsw i32 %1210, 1
  %1212 = ashr i32 %1209, %1211
  %1213 = sext i16 %212 to i32
  %1214 = add nsw i32 %1212, %1213
  br label %1215

; <label>:1215                                    ; preds = %1189, %1185
  %1216 = phi i32 [ %1188, %1185 ], [ %1214, %1189 ]
  br label %1217

; <label>:1217                                    ; preds = %1215, %1154
  %1218 = phi i32 [ 0, %1154 ], [ %1216, %1215 ]
  %1219 = sext i16 %x0.0 to i32
  %1220 = add nsw i32 %1219, 3
  %1221 = sext i32 %1220 to i64
  %1222 = getelementptr inbounds i16* %838, i64 %1221
  %1223 = load i16* %1222, align 2
  %1224 = zext i16 %1223 to i32
  %1225 = sub nsw i32 %1224, %1218
  %1226 = getelementptr inbounds i32* %1127, i32 1
  store i32 %1225, i32* %1127, align 4
  %1227 = sext i16 %409 to i32
  %1228 = add nsw i32 %1227, 8
  %1229 = trunc i32 %1228 to i16
  %1230 = sext i16 %415 to i32
  %1231 = add nsw i32 %1230, 8
  %1232 = trunc i32 %1231 to i16
  %1233 = sext i16 %y0.0 to i32
  %1234 = add nsw i32 %1233, 2
  %1235 = sext i32 %1234 to i64
  %1236 = getelementptr inbounds i16** %orig_pic, i64 %1235
  %1237 = load i16** %1236, align 8
  %1238 = sext i16 %108 to i32
  %1239 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %1240 = sext i16 %1229 to i32
  %1241 = sext i16 %429 to i32
  %1242 = call zeroext i16 %1239(i16** %238, i32 %1240, i32 %1241, i32 %265, i32 %263)
  %1243 = zext i16 %1242 to i32
  %1244 = mul nsw i32 %1238, %1243
  %1245 = sext i16 %144 to i32
  %1246 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %1247 = sext i16 %1232 to i32
  %1248 = sext i16 %435 to i32
  %1249 = call zeroext i16 %1246(i16** %253, i32 %1247, i32 %1248, i32 %265, i32 %263)
  %1250 = zext i16 %1249 to i32
  %1251 = mul nsw i32 %1245, %1250
  %1252 = add nsw i32 %1244, %1251
  %1253 = load i32* @wp_luma_round, align 4
  %1254 = mul nsw i32 2, %1253
  %1255 = add nsw i32 %1252, %1254
  %1256 = load i32* @luma_log_weight_denom, align 4
  %1257 = add nsw i32 %1256, 1
  %1258 = ashr i32 %1255, %1257
  %1259 = sext i16 %212 to i32
  %1260 = add nsw i32 %1258, %1259
  %1261 = icmp slt i32 %1260, 0
  br i1 %1261, label %1262, label %1263

; <label>:1262                                    ; preds = %1217
  br label %1321

; <label>:1263                                    ; preds = %1217
  %1264 = sext i16 %108 to i32
  %1265 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %1266 = sext i16 %1229 to i32
  %1267 = sext i16 %429 to i32
  %1268 = call zeroext i16 %1265(i16** %238, i32 %1266, i32 %1267, i32 %265, i32 %263)
  %1269 = zext i16 %1268 to i32
  %1270 = mul nsw i32 %1264, %1269
  %1271 = sext i16 %144 to i32
  %1272 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %1273 = sext i16 %1232 to i32
  %1274 = sext i16 %435 to i32
  %1275 = call zeroext i16 %1272(i16** %253, i32 %1273, i32 %1274, i32 %265, i32 %263)
  %1276 = zext i16 %1275 to i32
  %1277 = mul nsw i32 %1271, %1276
  %1278 = add nsw i32 %1270, %1277
  %1279 = load i32* @wp_luma_round, align 4
  %1280 = mul nsw i32 2, %1279
  %1281 = add nsw i32 %1278, %1280
  %1282 = load i32* @luma_log_weight_denom, align 4
  %1283 = add nsw i32 %1282, 1
  %1284 = ashr i32 %1281, %1283
  %1285 = sext i16 %212 to i32
  %1286 = add nsw i32 %1284, %1285
  %1287 = load %struct.ImageParameters** @img, align 8
  %1288 = getelementptr inbounds %struct.ImageParameters* %1287, i32 0, i32 155
  %1289 = load i32* %1288, align 4
  %1290 = icmp sgt i32 %1286, %1289
  br i1 %1290, label %1291, label %1295

; <label>:1291                                    ; preds = %1263
  %1292 = load %struct.ImageParameters** @img, align 8
  %1293 = getelementptr inbounds %struct.ImageParameters* %1292, i32 0, i32 155
  %1294 = load i32* %1293, align 4
  br label %1319

; <label>:1295                                    ; preds = %1263
  %1296 = sext i16 %108 to i32
  %1297 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %1298 = sext i16 %1229 to i32
  %1299 = sext i16 %429 to i32
  %1300 = call zeroext i16 %1297(i16** %238, i32 %1298, i32 %1299, i32 %265, i32 %263)
  %1301 = zext i16 %1300 to i32
  %1302 = mul nsw i32 %1296, %1301
  %1303 = sext i16 %144 to i32
  %1304 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %1305 = sext i16 %1232 to i32
  %1306 = sext i16 %435 to i32
  %1307 = call zeroext i16 %1304(i16** %253, i32 %1305, i32 %1306, i32 %265, i32 %263)
  %1308 = zext i16 %1307 to i32
  %1309 = mul nsw i32 %1303, %1308
  %1310 = add nsw i32 %1302, %1309
  %1311 = load i32* @wp_luma_round, align 4
  %1312 = mul nsw i32 2, %1311
  %1313 = add nsw i32 %1310, %1312
  %1314 = load i32* @luma_log_weight_denom, align 4
  %1315 = add nsw i32 %1314, 1
  %1316 = ashr i32 %1313, %1315
  %1317 = sext i16 %212 to i32
  %1318 = add nsw i32 %1316, %1317
  br label %1319

; <label>:1319                                    ; preds = %1295, %1291
  %1320 = phi i32 [ %1294, %1291 ], [ %1318, %1295 ]
  br label %1321

; <label>:1321                                    ; preds = %1319, %1262
  %1322 = phi i32 [ 0, %1262 ], [ %1320, %1319 ]
  %1323 = sext i16 %x0.0 to i64
  %1324 = getelementptr inbounds i16* %1237, i64 %1323
  %1325 = load i16* %1324, align 2
  %1326 = zext i16 %1325 to i32
  %1327 = sub nsw i32 %1326, %1322
  %1328 = getelementptr inbounds i32* %1226, i32 1
  store i32 %1327, i32* %1226, align 4
  %1329 = sext i16 %108 to i32
  %1330 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %1331 = sext i16 %1229 to i32
  %1332 = sext i16 %429 to i32
  %1333 = add nsw i32 %1332, 4
  %1334 = call zeroext i16 %1330(i16** %238, i32 %1331, i32 %1333, i32 %265, i32 %263)
  %1335 = zext i16 %1334 to i32
  %1336 = mul nsw i32 %1329, %1335
  %1337 = sext i16 %144 to i32
  %1338 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %1339 = sext i16 %1232 to i32
  %1340 = sext i16 %435 to i32
  %1341 = add nsw i32 %1340, 4
  %1342 = call zeroext i16 %1338(i16** %253, i32 %1339, i32 %1341, i32 %265, i32 %263)
  %1343 = zext i16 %1342 to i32
  %1344 = mul nsw i32 %1337, %1343
  %1345 = add nsw i32 %1336, %1344
  %1346 = load i32* @wp_luma_round, align 4
  %1347 = mul nsw i32 2, %1346
  %1348 = add nsw i32 %1345, %1347
  %1349 = load i32* @luma_log_weight_denom, align 4
  %1350 = add nsw i32 %1349, 1
  %1351 = ashr i32 %1348, %1350
  %1352 = sext i16 %212 to i32
  %1353 = add nsw i32 %1351, %1352
  %1354 = icmp slt i32 %1353, 0
  br i1 %1354, label %1355, label %1356

; <label>:1355                                    ; preds = %1321
  br label %1418

; <label>:1356                                    ; preds = %1321
  %1357 = sext i16 %108 to i32
  %1358 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %1359 = sext i16 %1229 to i32
  %1360 = sext i16 %429 to i32
  %1361 = add nsw i32 %1360, 4
  %1362 = call zeroext i16 %1358(i16** %238, i32 %1359, i32 %1361, i32 %265, i32 %263)
  %1363 = zext i16 %1362 to i32
  %1364 = mul nsw i32 %1357, %1363
  %1365 = sext i16 %144 to i32
  %1366 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %1367 = sext i16 %1232 to i32
  %1368 = sext i16 %435 to i32
  %1369 = add nsw i32 %1368, 4
  %1370 = call zeroext i16 %1366(i16** %253, i32 %1367, i32 %1369, i32 %265, i32 %263)
  %1371 = zext i16 %1370 to i32
  %1372 = mul nsw i32 %1365, %1371
  %1373 = add nsw i32 %1364, %1372
  %1374 = load i32* @wp_luma_round, align 4
  %1375 = mul nsw i32 2, %1374
  %1376 = add nsw i32 %1373, %1375
  %1377 = load i32* @luma_log_weight_denom, align 4
  %1378 = add nsw i32 %1377, 1
  %1379 = ashr i32 %1376, %1378
  %1380 = sext i16 %212 to i32
  %1381 = add nsw i32 %1379, %1380
  %1382 = load %struct.ImageParameters** @img, align 8
  %1383 = getelementptr inbounds %struct.ImageParameters* %1382, i32 0, i32 155
  %1384 = load i32* %1383, align 4
  %1385 = icmp sgt i32 %1381, %1384
  br i1 %1385, label %1386, label %1390

; <label>:1386                                    ; preds = %1356
  %1387 = load %struct.ImageParameters** @img, align 8
  %1388 = getelementptr inbounds %struct.ImageParameters* %1387, i32 0, i32 155
  %1389 = load i32* %1388, align 4
  br label %1416

; <label>:1390                                    ; preds = %1356
  %1391 = sext i16 %108 to i32
  %1392 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %1393 = sext i16 %1229 to i32
  %1394 = sext i16 %429 to i32
  %1395 = add nsw i32 %1394, 4
  %1396 = call zeroext i16 %1392(i16** %238, i32 %1393, i32 %1395, i32 %265, i32 %263)
  %1397 = zext i16 %1396 to i32
  %1398 = mul nsw i32 %1391, %1397
  %1399 = sext i16 %144 to i32
  %1400 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %1401 = sext i16 %1232 to i32
  %1402 = sext i16 %435 to i32
  %1403 = add nsw i32 %1402, 4
  %1404 = call zeroext i16 %1400(i16** %253, i32 %1401, i32 %1403, i32 %265, i32 %263)
  %1405 = zext i16 %1404 to i32
  %1406 = mul nsw i32 %1399, %1405
  %1407 = add nsw i32 %1398, %1406
  %1408 = load i32* @wp_luma_round, align 4
  %1409 = mul nsw i32 2, %1408
  %1410 = add nsw i32 %1407, %1409
  %1411 = load i32* @luma_log_weight_denom, align 4
  %1412 = add nsw i32 %1411, 1
  %1413 = ashr i32 %1410, %1412
  %1414 = sext i16 %212 to i32
  %1415 = add nsw i32 %1413, %1414
  br label %1416

; <label>:1416                                    ; preds = %1390, %1386
  %1417 = phi i32 [ %1389, %1386 ], [ %1415, %1390 ]
  br label %1418

; <label>:1418                                    ; preds = %1416, %1355
  %1419 = phi i32 [ 0, %1355 ], [ %1417, %1416 ]
  %1420 = sext i16 %x0.0 to i32
  %1421 = add nsw i32 %1420, 1
  %1422 = sext i32 %1421 to i64
  %1423 = getelementptr inbounds i16* %1237, i64 %1422
  %1424 = load i16* %1423, align 2
  %1425 = zext i16 %1424 to i32
  %1426 = sub nsw i32 %1425, %1419
  %1427 = getelementptr inbounds i32* %1328, i32 1
  store i32 %1426, i32* %1328, align 4
  %1428 = sext i16 %108 to i32
  %1429 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %1430 = sext i16 %1229 to i32
  %1431 = sext i16 %429 to i32
  %1432 = add nsw i32 %1431, 8
  %1433 = call zeroext i16 %1429(i16** %238, i32 %1430, i32 %1432, i32 %265, i32 %263)
  %1434 = zext i16 %1433 to i32
  %1435 = mul nsw i32 %1428, %1434
  %1436 = sext i16 %144 to i32
  %1437 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %1438 = sext i16 %1232 to i32
  %1439 = sext i16 %435 to i32
  %1440 = add nsw i32 %1439, 8
  %1441 = call zeroext i16 %1437(i16** %253, i32 %1438, i32 %1440, i32 %265, i32 %263)
  %1442 = zext i16 %1441 to i32
  %1443 = mul nsw i32 %1436, %1442
  %1444 = add nsw i32 %1435, %1443
  %1445 = load i32* @wp_luma_round, align 4
  %1446 = mul nsw i32 2, %1445
  %1447 = add nsw i32 %1444, %1446
  %1448 = load i32* @luma_log_weight_denom, align 4
  %1449 = add nsw i32 %1448, 1
  %1450 = ashr i32 %1447, %1449
  %1451 = sext i16 %212 to i32
  %1452 = add nsw i32 %1450, %1451
  %1453 = icmp slt i32 %1452, 0
  br i1 %1453, label %1454, label %1455

; <label>:1454                                    ; preds = %1418
  br label %1517

; <label>:1455                                    ; preds = %1418
  %1456 = sext i16 %108 to i32
  %1457 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %1458 = sext i16 %1229 to i32
  %1459 = sext i16 %429 to i32
  %1460 = add nsw i32 %1459, 8
  %1461 = call zeroext i16 %1457(i16** %238, i32 %1458, i32 %1460, i32 %265, i32 %263)
  %1462 = zext i16 %1461 to i32
  %1463 = mul nsw i32 %1456, %1462
  %1464 = sext i16 %144 to i32
  %1465 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %1466 = sext i16 %1232 to i32
  %1467 = sext i16 %435 to i32
  %1468 = add nsw i32 %1467, 8
  %1469 = call zeroext i16 %1465(i16** %253, i32 %1466, i32 %1468, i32 %265, i32 %263)
  %1470 = zext i16 %1469 to i32
  %1471 = mul nsw i32 %1464, %1470
  %1472 = add nsw i32 %1463, %1471
  %1473 = load i32* @wp_luma_round, align 4
  %1474 = mul nsw i32 2, %1473
  %1475 = add nsw i32 %1472, %1474
  %1476 = load i32* @luma_log_weight_denom, align 4
  %1477 = add nsw i32 %1476, 1
  %1478 = ashr i32 %1475, %1477
  %1479 = sext i16 %212 to i32
  %1480 = add nsw i32 %1478, %1479
  %1481 = load %struct.ImageParameters** @img, align 8
  %1482 = getelementptr inbounds %struct.ImageParameters* %1481, i32 0, i32 155
  %1483 = load i32* %1482, align 4
  %1484 = icmp sgt i32 %1480, %1483
  br i1 %1484, label %1485, label %1489

; <label>:1485                                    ; preds = %1455
  %1486 = load %struct.ImageParameters** @img, align 8
  %1487 = getelementptr inbounds %struct.ImageParameters* %1486, i32 0, i32 155
  %1488 = load i32* %1487, align 4
  br label %1515

; <label>:1489                                    ; preds = %1455
  %1490 = sext i16 %108 to i32
  %1491 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %1492 = sext i16 %1229 to i32
  %1493 = sext i16 %429 to i32
  %1494 = add nsw i32 %1493, 8
  %1495 = call zeroext i16 %1491(i16** %238, i32 %1492, i32 %1494, i32 %265, i32 %263)
  %1496 = zext i16 %1495 to i32
  %1497 = mul nsw i32 %1490, %1496
  %1498 = sext i16 %144 to i32
  %1499 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %1500 = sext i16 %1232 to i32
  %1501 = sext i16 %435 to i32
  %1502 = add nsw i32 %1501, 8
  %1503 = call zeroext i16 %1499(i16** %253, i32 %1500, i32 %1502, i32 %265, i32 %263)
  %1504 = zext i16 %1503 to i32
  %1505 = mul nsw i32 %1498, %1504
  %1506 = add nsw i32 %1497, %1505
  %1507 = load i32* @wp_luma_round, align 4
  %1508 = mul nsw i32 2, %1507
  %1509 = add nsw i32 %1506, %1508
  %1510 = load i32* @luma_log_weight_denom, align 4
  %1511 = add nsw i32 %1510, 1
  %1512 = ashr i32 %1509, %1511
  %1513 = sext i16 %212 to i32
  %1514 = add nsw i32 %1512, %1513
  br label %1515

; <label>:1515                                    ; preds = %1489, %1485
  %1516 = phi i32 [ %1488, %1485 ], [ %1514, %1489 ]
  br label %1517

; <label>:1517                                    ; preds = %1515, %1454
  %1518 = phi i32 [ 0, %1454 ], [ %1516, %1515 ]
  %1519 = sext i16 %x0.0 to i32
  %1520 = add nsw i32 %1519, 2
  %1521 = sext i32 %1520 to i64
  %1522 = getelementptr inbounds i16* %1237, i64 %1521
  %1523 = load i16* %1522, align 2
  %1524 = zext i16 %1523 to i32
  %1525 = sub nsw i32 %1524, %1518
  %1526 = getelementptr inbounds i32* %1427, i32 1
  store i32 %1525, i32* %1427, align 4
  %1527 = sext i16 %108 to i32
  %1528 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %1529 = sext i16 %1229 to i32
  %1530 = sext i16 %429 to i32
  %1531 = add nsw i32 %1530, 12
  %1532 = call zeroext i16 %1528(i16** %238, i32 %1529, i32 %1531, i32 %265, i32 %263)
  %1533 = zext i16 %1532 to i32
  %1534 = mul nsw i32 %1527, %1533
  %1535 = sext i16 %144 to i32
  %1536 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %1537 = sext i16 %1232 to i32
  %1538 = sext i16 %435 to i32
  %1539 = add nsw i32 %1538, 12
  %1540 = call zeroext i16 %1536(i16** %253, i32 %1537, i32 %1539, i32 %265, i32 %263)
  %1541 = zext i16 %1540 to i32
  %1542 = mul nsw i32 %1535, %1541
  %1543 = add nsw i32 %1534, %1542
  %1544 = load i32* @wp_luma_round, align 4
  %1545 = mul nsw i32 2, %1544
  %1546 = add nsw i32 %1543, %1545
  %1547 = load i32* @luma_log_weight_denom, align 4
  %1548 = add nsw i32 %1547, 1
  %1549 = ashr i32 %1546, %1548
  %1550 = sext i16 %212 to i32
  %1551 = add nsw i32 %1549, %1550
  %1552 = icmp slt i32 %1551, 0
  br i1 %1552, label %1553, label %1554

; <label>:1553                                    ; preds = %1517
  br label %1616

; <label>:1554                                    ; preds = %1517
  %1555 = sext i16 %108 to i32
  %1556 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %1557 = sext i16 %1229 to i32
  %1558 = sext i16 %429 to i32
  %1559 = add nsw i32 %1558, 12
  %1560 = call zeroext i16 %1556(i16** %238, i32 %1557, i32 %1559, i32 %265, i32 %263)
  %1561 = zext i16 %1560 to i32
  %1562 = mul nsw i32 %1555, %1561
  %1563 = sext i16 %144 to i32
  %1564 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %1565 = sext i16 %1232 to i32
  %1566 = sext i16 %435 to i32
  %1567 = add nsw i32 %1566, 12
  %1568 = call zeroext i16 %1564(i16** %253, i32 %1565, i32 %1567, i32 %265, i32 %263)
  %1569 = zext i16 %1568 to i32
  %1570 = mul nsw i32 %1563, %1569
  %1571 = add nsw i32 %1562, %1570
  %1572 = load i32* @wp_luma_round, align 4
  %1573 = mul nsw i32 2, %1572
  %1574 = add nsw i32 %1571, %1573
  %1575 = load i32* @luma_log_weight_denom, align 4
  %1576 = add nsw i32 %1575, 1
  %1577 = ashr i32 %1574, %1576
  %1578 = sext i16 %212 to i32
  %1579 = add nsw i32 %1577, %1578
  %1580 = load %struct.ImageParameters** @img, align 8
  %1581 = getelementptr inbounds %struct.ImageParameters* %1580, i32 0, i32 155
  %1582 = load i32* %1581, align 4
  %1583 = icmp sgt i32 %1579, %1582
  br i1 %1583, label %1584, label %1588

; <label>:1584                                    ; preds = %1554
  %1585 = load %struct.ImageParameters** @img, align 8
  %1586 = getelementptr inbounds %struct.ImageParameters* %1585, i32 0, i32 155
  %1587 = load i32* %1586, align 4
  br label %1614

; <label>:1588                                    ; preds = %1554
  %1589 = sext i16 %108 to i32
  %1590 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %1591 = sext i16 %1229 to i32
  %1592 = sext i16 %429 to i32
  %1593 = add nsw i32 %1592, 12
  %1594 = call zeroext i16 %1590(i16** %238, i32 %1591, i32 %1593, i32 %265, i32 %263)
  %1595 = zext i16 %1594 to i32
  %1596 = mul nsw i32 %1589, %1595
  %1597 = sext i16 %144 to i32
  %1598 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %1599 = sext i16 %1232 to i32
  %1600 = sext i16 %435 to i32
  %1601 = add nsw i32 %1600, 12
  %1602 = call zeroext i16 %1598(i16** %253, i32 %1599, i32 %1601, i32 %265, i32 %263)
  %1603 = zext i16 %1602 to i32
  %1604 = mul nsw i32 %1597, %1603
  %1605 = add nsw i32 %1596, %1604
  %1606 = load i32* @wp_luma_round, align 4
  %1607 = mul nsw i32 2, %1606
  %1608 = add nsw i32 %1605, %1607
  %1609 = load i32* @luma_log_weight_denom, align 4
  %1610 = add nsw i32 %1609, 1
  %1611 = ashr i32 %1608, %1610
  %1612 = sext i16 %212 to i32
  %1613 = add nsw i32 %1611, %1612
  br label %1614

; <label>:1614                                    ; preds = %1588, %1584
  %1615 = phi i32 [ %1587, %1584 ], [ %1613, %1588 ]
  br label %1616

; <label>:1616                                    ; preds = %1614, %1553
  %1617 = phi i32 [ 0, %1553 ], [ %1615, %1614 ]
  %1618 = sext i16 %x0.0 to i32
  %1619 = add nsw i32 %1618, 3
  %1620 = sext i32 %1619 to i64
  %1621 = getelementptr inbounds i16* %1237, i64 %1620
  %1622 = load i16* %1621, align 2
  %1623 = zext i16 %1622 to i32
  %1624 = sub nsw i32 %1623, %1617
  %1625 = getelementptr inbounds i32* %1526, i32 1
  store i32 %1624, i32* %1526, align 4
  %1626 = sext i16 %409 to i32
  %1627 = add nsw i32 %1626, 12
  %1628 = trunc i32 %1627 to i16
  %1629 = sext i16 %415 to i32
  %1630 = add nsw i32 %1629, 12
  %1631 = trunc i32 %1630 to i16
  %1632 = sext i16 %y0.0 to i32
  %1633 = add nsw i32 %1632, 3
  %1634 = sext i32 %1633 to i64
  %1635 = getelementptr inbounds i16** %orig_pic, i64 %1634
  %1636 = load i16** %1635, align 8
  %1637 = sext i16 %108 to i32
  %1638 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %1639 = sext i16 %1628 to i32
  %1640 = sext i16 %429 to i32
  %1641 = call zeroext i16 %1638(i16** %238, i32 %1639, i32 %1640, i32 %265, i32 %263)
  %1642 = zext i16 %1641 to i32
  %1643 = mul nsw i32 %1637, %1642
  %1644 = sext i16 %144 to i32
  %1645 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %1646 = sext i16 %1631 to i32
  %1647 = sext i16 %435 to i32
  %1648 = call zeroext i16 %1645(i16** %253, i32 %1646, i32 %1647, i32 %265, i32 %263)
  %1649 = zext i16 %1648 to i32
  %1650 = mul nsw i32 %1644, %1649
  %1651 = add nsw i32 %1643, %1650
  %1652 = load i32* @wp_luma_round, align 4
  %1653 = mul nsw i32 2, %1652
  %1654 = add nsw i32 %1651, %1653
  %1655 = load i32* @luma_log_weight_denom, align 4
  %1656 = add nsw i32 %1655, 1
  %1657 = ashr i32 %1654, %1656
  %1658 = sext i16 %212 to i32
  %1659 = add nsw i32 %1657, %1658
  %1660 = icmp slt i32 %1659, 0
  br i1 %1660, label %1661, label %1662

; <label>:1661                                    ; preds = %1616
  br label %1720

; <label>:1662                                    ; preds = %1616
  %1663 = sext i16 %108 to i32
  %1664 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %1665 = sext i16 %1628 to i32
  %1666 = sext i16 %429 to i32
  %1667 = call zeroext i16 %1664(i16** %238, i32 %1665, i32 %1666, i32 %265, i32 %263)
  %1668 = zext i16 %1667 to i32
  %1669 = mul nsw i32 %1663, %1668
  %1670 = sext i16 %144 to i32
  %1671 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %1672 = sext i16 %1631 to i32
  %1673 = sext i16 %435 to i32
  %1674 = call zeroext i16 %1671(i16** %253, i32 %1672, i32 %1673, i32 %265, i32 %263)
  %1675 = zext i16 %1674 to i32
  %1676 = mul nsw i32 %1670, %1675
  %1677 = add nsw i32 %1669, %1676
  %1678 = load i32* @wp_luma_round, align 4
  %1679 = mul nsw i32 2, %1678
  %1680 = add nsw i32 %1677, %1679
  %1681 = load i32* @luma_log_weight_denom, align 4
  %1682 = add nsw i32 %1681, 1
  %1683 = ashr i32 %1680, %1682
  %1684 = sext i16 %212 to i32
  %1685 = add nsw i32 %1683, %1684
  %1686 = load %struct.ImageParameters** @img, align 8
  %1687 = getelementptr inbounds %struct.ImageParameters* %1686, i32 0, i32 155
  %1688 = load i32* %1687, align 4
  %1689 = icmp sgt i32 %1685, %1688
  br i1 %1689, label %1690, label %1694

; <label>:1690                                    ; preds = %1662
  %1691 = load %struct.ImageParameters** @img, align 8
  %1692 = getelementptr inbounds %struct.ImageParameters* %1691, i32 0, i32 155
  %1693 = load i32* %1692, align 4
  br label %1718

; <label>:1694                                    ; preds = %1662
  %1695 = sext i16 %108 to i32
  %1696 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %1697 = sext i16 %1628 to i32
  %1698 = sext i16 %429 to i32
  %1699 = call zeroext i16 %1696(i16** %238, i32 %1697, i32 %1698, i32 %265, i32 %263)
  %1700 = zext i16 %1699 to i32
  %1701 = mul nsw i32 %1695, %1700
  %1702 = sext i16 %144 to i32
  %1703 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %1704 = sext i16 %1631 to i32
  %1705 = sext i16 %435 to i32
  %1706 = call zeroext i16 %1703(i16** %253, i32 %1704, i32 %1705, i32 %265, i32 %263)
  %1707 = zext i16 %1706 to i32
  %1708 = mul nsw i32 %1702, %1707
  %1709 = add nsw i32 %1701, %1708
  %1710 = load i32* @wp_luma_round, align 4
  %1711 = mul nsw i32 2, %1710
  %1712 = add nsw i32 %1709, %1711
  %1713 = load i32* @luma_log_weight_denom, align 4
  %1714 = add nsw i32 %1713, 1
  %1715 = ashr i32 %1712, %1714
  %1716 = sext i16 %212 to i32
  %1717 = add nsw i32 %1715, %1716
  br label %1718

; <label>:1718                                    ; preds = %1694, %1690
  %1719 = phi i32 [ %1693, %1690 ], [ %1717, %1694 ]
  br label %1720

; <label>:1720                                    ; preds = %1718, %1661
  %1721 = phi i32 [ 0, %1661 ], [ %1719, %1718 ]
  %1722 = sext i16 %x0.0 to i64
  %1723 = getelementptr inbounds i16* %1636, i64 %1722
  %1724 = load i16* %1723, align 2
  %1725 = zext i16 %1724 to i32
  %1726 = sub nsw i32 %1725, %1721
  %1727 = getelementptr inbounds i32* %1625, i32 1
  store i32 %1726, i32* %1625, align 4
  %1728 = sext i16 %108 to i32
  %1729 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %1730 = sext i16 %1628 to i32
  %1731 = sext i16 %429 to i32
  %1732 = add nsw i32 %1731, 4
  %1733 = call zeroext i16 %1729(i16** %238, i32 %1730, i32 %1732, i32 %265, i32 %263)
  %1734 = zext i16 %1733 to i32
  %1735 = mul nsw i32 %1728, %1734
  %1736 = sext i16 %144 to i32
  %1737 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %1738 = sext i16 %1631 to i32
  %1739 = sext i16 %435 to i32
  %1740 = add nsw i32 %1739, 4
  %1741 = call zeroext i16 %1737(i16** %253, i32 %1738, i32 %1740, i32 %265, i32 %263)
  %1742 = zext i16 %1741 to i32
  %1743 = mul nsw i32 %1736, %1742
  %1744 = add nsw i32 %1735, %1743
  %1745 = load i32* @wp_luma_round, align 4
  %1746 = mul nsw i32 2, %1745
  %1747 = add nsw i32 %1744, %1746
  %1748 = load i32* @luma_log_weight_denom, align 4
  %1749 = add nsw i32 %1748, 1
  %1750 = ashr i32 %1747, %1749
  %1751 = sext i16 %212 to i32
  %1752 = add nsw i32 %1750, %1751
  %1753 = icmp slt i32 %1752, 0
  br i1 %1753, label %1754, label %1755

; <label>:1754                                    ; preds = %1720
  br label %1817

; <label>:1755                                    ; preds = %1720
  %1756 = sext i16 %108 to i32
  %1757 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %1758 = sext i16 %1628 to i32
  %1759 = sext i16 %429 to i32
  %1760 = add nsw i32 %1759, 4
  %1761 = call zeroext i16 %1757(i16** %238, i32 %1758, i32 %1760, i32 %265, i32 %263)
  %1762 = zext i16 %1761 to i32
  %1763 = mul nsw i32 %1756, %1762
  %1764 = sext i16 %144 to i32
  %1765 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %1766 = sext i16 %1631 to i32
  %1767 = sext i16 %435 to i32
  %1768 = add nsw i32 %1767, 4
  %1769 = call zeroext i16 %1765(i16** %253, i32 %1766, i32 %1768, i32 %265, i32 %263)
  %1770 = zext i16 %1769 to i32
  %1771 = mul nsw i32 %1764, %1770
  %1772 = add nsw i32 %1763, %1771
  %1773 = load i32* @wp_luma_round, align 4
  %1774 = mul nsw i32 2, %1773
  %1775 = add nsw i32 %1772, %1774
  %1776 = load i32* @luma_log_weight_denom, align 4
  %1777 = add nsw i32 %1776, 1
  %1778 = ashr i32 %1775, %1777
  %1779 = sext i16 %212 to i32
  %1780 = add nsw i32 %1778, %1779
  %1781 = load %struct.ImageParameters** @img, align 8
  %1782 = getelementptr inbounds %struct.ImageParameters* %1781, i32 0, i32 155
  %1783 = load i32* %1782, align 4
  %1784 = icmp sgt i32 %1780, %1783
  br i1 %1784, label %1785, label %1789

; <label>:1785                                    ; preds = %1755
  %1786 = load %struct.ImageParameters** @img, align 8
  %1787 = getelementptr inbounds %struct.ImageParameters* %1786, i32 0, i32 155
  %1788 = load i32* %1787, align 4
  br label %1815

; <label>:1789                                    ; preds = %1755
  %1790 = sext i16 %108 to i32
  %1791 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %1792 = sext i16 %1628 to i32
  %1793 = sext i16 %429 to i32
  %1794 = add nsw i32 %1793, 4
  %1795 = call zeroext i16 %1791(i16** %238, i32 %1792, i32 %1794, i32 %265, i32 %263)
  %1796 = zext i16 %1795 to i32
  %1797 = mul nsw i32 %1790, %1796
  %1798 = sext i16 %144 to i32
  %1799 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %1800 = sext i16 %1631 to i32
  %1801 = sext i16 %435 to i32
  %1802 = add nsw i32 %1801, 4
  %1803 = call zeroext i16 %1799(i16** %253, i32 %1800, i32 %1802, i32 %265, i32 %263)
  %1804 = zext i16 %1803 to i32
  %1805 = mul nsw i32 %1798, %1804
  %1806 = add nsw i32 %1797, %1805
  %1807 = load i32* @wp_luma_round, align 4
  %1808 = mul nsw i32 2, %1807
  %1809 = add nsw i32 %1806, %1808
  %1810 = load i32* @luma_log_weight_denom, align 4
  %1811 = add nsw i32 %1810, 1
  %1812 = ashr i32 %1809, %1811
  %1813 = sext i16 %212 to i32
  %1814 = add nsw i32 %1812, %1813
  br label %1815

; <label>:1815                                    ; preds = %1789, %1785
  %1816 = phi i32 [ %1788, %1785 ], [ %1814, %1789 ]
  br label %1817

; <label>:1817                                    ; preds = %1815, %1754
  %1818 = phi i32 [ 0, %1754 ], [ %1816, %1815 ]
  %1819 = sext i16 %x0.0 to i32
  %1820 = add nsw i32 %1819, 1
  %1821 = sext i32 %1820 to i64
  %1822 = getelementptr inbounds i16* %1636, i64 %1821
  %1823 = load i16* %1822, align 2
  %1824 = zext i16 %1823 to i32
  %1825 = sub nsw i32 %1824, %1818
  %1826 = getelementptr inbounds i32* %1727, i32 1
  store i32 %1825, i32* %1727, align 4
  %1827 = sext i16 %108 to i32
  %1828 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %1829 = sext i16 %1628 to i32
  %1830 = sext i16 %429 to i32
  %1831 = add nsw i32 %1830, 8
  %1832 = call zeroext i16 %1828(i16** %238, i32 %1829, i32 %1831, i32 %265, i32 %263)
  %1833 = zext i16 %1832 to i32
  %1834 = mul nsw i32 %1827, %1833
  %1835 = sext i16 %144 to i32
  %1836 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %1837 = sext i16 %1631 to i32
  %1838 = sext i16 %435 to i32
  %1839 = add nsw i32 %1838, 8
  %1840 = call zeroext i16 %1836(i16** %253, i32 %1837, i32 %1839, i32 %265, i32 %263)
  %1841 = zext i16 %1840 to i32
  %1842 = mul nsw i32 %1835, %1841
  %1843 = add nsw i32 %1834, %1842
  %1844 = load i32* @wp_luma_round, align 4
  %1845 = mul nsw i32 2, %1844
  %1846 = add nsw i32 %1843, %1845
  %1847 = load i32* @luma_log_weight_denom, align 4
  %1848 = add nsw i32 %1847, 1
  %1849 = ashr i32 %1846, %1848
  %1850 = sext i16 %212 to i32
  %1851 = add nsw i32 %1849, %1850
  %1852 = icmp slt i32 %1851, 0
  br i1 %1852, label %1853, label %1854

; <label>:1853                                    ; preds = %1817
  br label %1916

; <label>:1854                                    ; preds = %1817
  %1855 = sext i16 %108 to i32
  %1856 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %1857 = sext i16 %1628 to i32
  %1858 = sext i16 %429 to i32
  %1859 = add nsw i32 %1858, 8
  %1860 = call zeroext i16 %1856(i16** %238, i32 %1857, i32 %1859, i32 %265, i32 %263)
  %1861 = zext i16 %1860 to i32
  %1862 = mul nsw i32 %1855, %1861
  %1863 = sext i16 %144 to i32
  %1864 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %1865 = sext i16 %1631 to i32
  %1866 = sext i16 %435 to i32
  %1867 = add nsw i32 %1866, 8
  %1868 = call zeroext i16 %1864(i16** %253, i32 %1865, i32 %1867, i32 %265, i32 %263)
  %1869 = zext i16 %1868 to i32
  %1870 = mul nsw i32 %1863, %1869
  %1871 = add nsw i32 %1862, %1870
  %1872 = load i32* @wp_luma_round, align 4
  %1873 = mul nsw i32 2, %1872
  %1874 = add nsw i32 %1871, %1873
  %1875 = load i32* @luma_log_weight_denom, align 4
  %1876 = add nsw i32 %1875, 1
  %1877 = ashr i32 %1874, %1876
  %1878 = sext i16 %212 to i32
  %1879 = add nsw i32 %1877, %1878
  %1880 = load %struct.ImageParameters** @img, align 8
  %1881 = getelementptr inbounds %struct.ImageParameters* %1880, i32 0, i32 155
  %1882 = load i32* %1881, align 4
  %1883 = icmp sgt i32 %1879, %1882
  br i1 %1883, label %1884, label %1888

; <label>:1884                                    ; preds = %1854
  %1885 = load %struct.ImageParameters** @img, align 8
  %1886 = getelementptr inbounds %struct.ImageParameters* %1885, i32 0, i32 155
  %1887 = load i32* %1886, align 4
  br label %1914

; <label>:1888                                    ; preds = %1854
  %1889 = sext i16 %108 to i32
  %1890 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %1891 = sext i16 %1628 to i32
  %1892 = sext i16 %429 to i32
  %1893 = add nsw i32 %1892, 8
  %1894 = call zeroext i16 %1890(i16** %238, i32 %1891, i32 %1893, i32 %265, i32 %263)
  %1895 = zext i16 %1894 to i32
  %1896 = mul nsw i32 %1889, %1895
  %1897 = sext i16 %144 to i32
  %1898 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %1899 = sext i16 %1631 to i32
  %1900 = sext i16 %435 to i32
  %1901 = add nsw i32 %1900, 8
  %1902 = call zeroext i16 %1898(i16** %253, i32 %1899, i32 %1901, i32 %265, i32 %263)
  %1903 = zext i16 %1902 to i32
  %1904 = mul nsw i32 %1897, %1903
  %1905 = add nsw i32 %1896, %1904
  %1906 = load i32* @wp_luma_round, align 4
  %1907 = mul nsw i32 2, %1906
  %1908 = add nsw i32 %1905, %1907
  %1909 = load i32* @luma_log_weight_denom, align 4
  %1910 = add nsw i32 %1909, 1
  %1911 = ashr i32 %1908, %1910
  %1912 = sext i16 %212 to i32
  %1913 = add nsw i32 %1911, %1912
  br label %1914

; <label>:1914                                    ; preds = %1888, %1884
  %1915 = phi i32 [ %1887, %1884 ], [ %1913, %1888 ]
  br label %1916

; <label>:1916                                    ; preds = %1914, %1853
  %1917 = phi i32 [ 0, %1853 ], [ %1915, %1914 ]
  %1918 = sext i16 %x0.0 to i32
  %1919 = add nsw i32 %1918, 2
  %1920 = sext i32 %1919 to i64
  %1921 = getelementptr inbounds i16* %1636, i64 %1920
  %1922 = load i16* %1921, align 2
  %1923 = zext i16 %1922 to i32
  %1924 = sub nsw i32 %1923, %1917
  %1925 = getelementptr inbounds i32* %1826, i32 1
  store i32 %1924, i32* %1826, align 4
  %1926 = sext i16 %108 to i32
  %1927 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %1928 = sext i16 %1628 to i32
  %1929 = sext i16 %429 to i32
  %1930 = add nsw i32 %1929, 12
  %1931 = call zeroext i16 %1927(i16** %238, i32 %1928, i32 %1930, i32 %265, i32 %263)
  %1932 = zext i16 %1931 to i32
  %1933 = mul nsw i32 %1926, %1932
  %1934 = sext i16 %144 to i32
  %1935 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %1936 = sext i16 %1631 to i32
  %1937 = sext i16 %435 to i32
  %1938 = add nsw i32 %1937, 12
  %1939 = call zeroext i16 %1935(i16** %253, i32 %1936, i32 %1938, i32 %265, i32 %263)
  %1940 = zext i16 %1939 to i32
  %1941 = mul nsw i32 %1934, %1940
  %1942 = add nsw i32 %1933, %1941
  %1943 = load i32* @wp_luma_round, align 4
  %1944 = mul nsw i32 2, %1943
  %1945 = add nsw i32 %1942, %1944
  %1946 = load i32* @luma_log_weight_denom, align 4
  %1947 = add nsw i32 %1946, 1
  %1948 = ashr i32 %1945, %1947
  %1949 = sext i16 %212 to i32
  %1950 = add nsw i32 %1948, %1949
  %1951 = icmp slt i32 %1950, 0
  br i1 %1951, label %1952, label %1953

; <label>:1952                                    ; preds = %1916
  br label %2015

; <label>:1953                                    ; preds = %1916
  %1954 = sext i16 %108 to i32
  %1955 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %1956 = sext i16 %1628 to i32
  %1957 = sext i16 %429 to i32
  %1958 = add nsw i32 %1957, 12
  %1959 = call zeroext i16 %1955(i16** %238, i32 %1956, i32 %1958, i32 %265, i32 %263)
  %1960 = zext i16 %1959 to i32
  %1961 = mul nsw i32 %1954, %1960
  %1962 = sext i16 %144 to i32
  %1963 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %1964 = sext i16 %1631 to i32
  %1965 = sext i16 %435 to i32
  %1966 = add nsw i32 %1965, 12
  %1967 = call zeroext i16 %1963(i16** %253, i32 %1964, i32 %1966, i32 %265, i32 %263)
  %1968 = zext i16 %1967 to i32
  %1969 = mul nsw i32 %1962, %1968
  %1970 = add nsw i32 %1961, %1969
  %1971 = load i32* @wp_luma_round, align 4
  %1972 = mul nsw i32 2, %1971
  %1973 = add nsw i32 %1970, %1972
  %1974 = load i32* @luma_log_weight_denom, align 4
  %1975 = add nsw i32 %1974, 1
  %1976 = ashr i32 %1973, %1975
  %1977 = sext i16 %212 to i32
  %1978 = add nsw i32 %1976, %1977
  %1979 = load %struct.ImageParameters** @img, align 8
  %1980 = getelementptr inbounds %struct.ImageParameters* %1979, i32 0, i32 155
  %1981 = load i32* %1980, align 4
  %1982 = icmp sgt i32 %1978, %1981
  br i1 %1982, label %1983, label %1987

; <label>:1983                                    ; preds = %1953
  %1984 = load %struct.ImageParameters** @img, align 8
  %1985 = getelementptr inbounds %struct.ImageParameters* %1984, i32 0, i32 155
  %1986 = load i32* %1985, align 4
  br label %2013

; <label>:1987                                    ; preds = %1953
  %1988 = sext i16 %108 to i32
  %1989 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %1990 = sext i16 %1628 to i32
  %1991 = sext i16 %429 to i32
  %1992 = add nsw i32 %1991, 12
  %1993 = call zeroext i16 %1989(i16** %238, i32 %1990, i32 %1992, i32 %265, i32 %263)
  %1994 = zext i16 %1993 to i32
  %1995 = mul nsw i32 %1988, %1994
  %1996 = sext i16 %144 to i32
  %1997 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %1998 = sext i16 %1631 to i32
  %1999 = sext i16 %435 to i32
  %2000 = add nsw i32 %1999, 12
  %2001 = call zeroext i16 %1997(i16** %253, i32 %1998, i32 %2000, i32 %265, i32 %263)
  %2002 = zext i16 %2001 to i32
  %2003 = mul nsw i32 %1996, %2002
  %2004 = add nsw i32 %1995, %2003
  %2005 = load i32* @wp_luma_round, align 4
  %2006 = mul nsw i32 2, %2005
  %2007 = add nsw i32 %2004, %2006
  %2008 = load i32* @luma_log_weight_denom, align 4
  %2009 = add nsw i32 %2008, 1
  %2010 = ashr i32 %2007, %2009
  %2011 = sext i16 %212 to i32
  %2012 = add nsw i32 %2010, %2011
  br label %2013

; <label>:2013                                    ; preds = %1987, %1983
  %2014 = phi i32 [ %1986, %1983 ], [ %2012, %1987 ]
  br label %2015

; <label>:2015                                    ; preds = %2013, %1952
  %2016 = phi i32 [ 0, %1952 ], [ %2014, %2013 ]
  %2017 = sext i16 %x0.0 to i32
  %2018 = add nsw i32 %2017, 3
  %2019 = sext i32 %2018 to i64
  %2020 = getelementptr inbounds i16* %1636, i64 %2019
  %2021 = load i16* %2020, align 2
  %2022 = zext i16 %2021 to i32
  %2023 = sub nsw i32 %2022, %2016
  store i32 %2023, i32* %1925, align 4
  %2024 = load %struct.InputParameters** @input, align 8
  %2025 = getelementptr inbounds %struct.InputParameters* %2024, i32 0, i32 123
  %2026 = load i32* %2025, align 4
  %2027 = icmp ne i32 %2026, 0
  br i1 %2027, label %2038, label %2028

; <label>:2028                                    ; preds = %2015
  %2029 = getelementptr inbounds [16 x i32]* %diff, i32 0, i32 0
  %2030 = call i32 @SATD(i32* %2029, i32 %223)
  %2031 = sext i16 %mcost.1 to i32
  %2032 = add nsw i32 %2031, %2030
  %2033 = trunc i32 %2032 to i16
  %2034 = sext i16 %2033 to i32
  %2035 = icmp sgt i32 %2034, %.0
  br i1 %2035, label %2036, label %2037

; <label>:2036                                    ; preds = %2028
  br label %2068

; <label>:2037                                    ; preds = %2028
  br label %2063

; <label>:2038                                    ; preds = %2015
  br label %2039

; <label>:2039                                    ; preds = %2060, %2038
  %k.0 = phi i32 [ 0, %2038 ], [ %k.1, %2060 ]
  %j.0 = phi i32 [ 0, %2038 ], [ %2061, %2060 ]
  %2040 = icmp slt i32 %j.0, 4
  br i1 %2040, label %2041, label %2062

; <label>:2041                                    ; preds = %2039
  br label %2042

; <label>:2042                                    ; preds = %2056, %2041
  %k.1 = phi i32 [ %k.0, %2041 ], [ %2058, %2056 ]
  %i.0 = phi i32 [ 0, %2041 ], [ %2057, %2056 ]
  %2043 = icmp slt i32 %i.0, 4
  br i1 %2043, label %2044, label %2059

; <label>:2044                                    ; preds = %2042
  %2045 = sext i32 %k.1 to i64
  %2046 = getelementptr inbounds [16 x i32]* %diff, i32 0, i64 %2045
  %2047 = load i32* %2046, align 4
  %2048 = sext i16 %x0.0 to i32
  %2049 = add nsw i32 %2048, %i.0
  %2050 = sext i32 %2049 to i64
  %2051 = sext i16 %y0.0 to i32
  %2052 = add nsw i32 %2051, %j.0
  %2053 = sext i32 %2052 to i64
  %2054 = getelementptr inbounds [16 x [16 x i32]]* %curr_diff, i32 0, i64 %2053
  %2055 = getelementptr inbounds [16 x i32]* %2054, i32 0, i64 %2050
  store i32 %2047, i32* %2055, align 4
  br label %2056

; <label>:2056                                    ; preds = %2044
  %2057 = add nsw i32 %i.0, 1
  %2058 = add nsw i32 %k.1, 1
  br label %2042

; <label>:2059                                    ; preds = %2042
  br label %2060

; <label>:2060                                    ; preds = %2059
  %2061 = add nsw i32 %j.0, 1
  br label %2039

; <label>:2062                                    ; preds = %2039
  br label %2063

; <label>:2063                                    ; preds = %2062, %2037
  %mcost.2 = phi i16 [ %mcost.1, %2062 ], [ %2033, %2037 ]
  br label %2064

; <label>:2064                                    ; preds = %2063
  %2065 = sext i16 %x0.0 to i32
  %2066 = add nsw i32 %2065, 4
  %2067 = trunc i32 %2066 to i16
  br label %418

; <label>:2068                                    ; preds = %2036, %418
  %mcost.3 = phi i16 [ %2033, %2036 ], [ %mcost.1, %418 ]
  %abort_search.1 = phi i16 [ 1, %2036 ], [ %abort_search.0, %418 ]
  br label %2505

; <label>:2069                                    ; preds = %402
  br label %2070

; <label>:2070                                    ; preds = %2500, %2069
  %mcost.4 = phi i16 [ %mcost.0, %2069 ], [ %mcost.5, %2500 ]
  %x0.1 = phi i16 [ 0, %2069 ], [ %2503, %2500 ]
  %2071 = sext i16 %x0.1 to i32
  %2072 = sext i16 %10 to i32
  %2073 = icmp slt i32 %2071, %2072
  br i1 %2073, label %2074, label %2504

; <label>:2074                                    ; preds = %2070
  %2075 = sext i16 %x0.1 to i32
  %2076 = add nsw i32 %pic_pix_x, %2075
  %2077 = shl i32 %2076, 2
  %2078 = load i16* %s_mv_x, align 2
  %2079 = sext i16 %2078 to i32
  %2080 = add nsw i32 %2077, %2079
  %2081 = trunc i32 %2080 to i16
  %2082 = sext i16 %x0.1 to i32
  %2083 = add nsw i32 %pic_pix_x, %2082
  %2084 = shl i32 %2083, 2
  %2085 = sext i16 %361 to i32
  %2086 = add nsw i32 %2084, %2085
  %2087 = trunc i32 %2086 to i16
  %2088 = getelementptr inbounds [16 x i32]* %diff, i32 0, i32 0
  %2089 = sext i16 %y0.0 to i64
  %2090 = getelementptr inbounds i16** %orig_pic, i64 %2089
  %2091 = load i16** %2090, align 8
  %2092 = sext i16 %x0.1 to i64
  %2093 = getelementptr inbounds i16* %2091, i64 %2092
  %2094 = load i16* %2093, align 2
  %2095 = zext i16 %2094 to i32
  %2096 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %2097 = sext i16 %409 to i32
  %2098 = sext i16 %2081 to i32
  %2099 = call zeroext i16 %2096(i16** %238, i32 %2097, i32 %2098, i32 %265, i32 %263)
  %2100 = zext i16 %2099 to i32
  %2101 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %2102 = sext i16 %415 to i32
  %2103 = sext i16 %2087 to i32
  %2104 = call zeroext i16 %2101(i16** %253, i32 %2102, i32 %2103, i32 %265, i32 %263)
  %2105 = zext i16 %2104 to i32
  %2106 = add nsw i32 %2100, %2105
  %2107 = ashr i32 %2106, 1
  %2108 = sub nsw i32 %2095, %2107
  %2109 = getelementptr inbounds i32* %2088, i32 1
  store i32 %2108, i32* %2088, align 4
  %2110 = sext i16 %x0.1 to i32
  %2111 = add nsw i32 %2110, 1
  %2112 = sext i32 %2111 to i64
  %2113 = getelementptr inbounds i16* %2091, i64 %2112
  %2114 = load i16* %2113, align 2
  %2115 = zext i16 %2114 to i32
  %2116 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %2117 = sext i16 %409 to i32
  %2118 = sext i16 %2081 to i32
  %2119 = add nsw i32 %2118, 4
  %2120 = call zeroext i16 %2116(i16** %238, i32 %2117, i32 %2119, i32 %265, i32 %263)
  %2121 = zext i16 %2120 to i32
  %2122 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %2123 = sext i16 %415 to i32
  %2124 = sext i16 %2087 to i32
  %2125 = add nsw i32 %2124, 4
  %2126 = call zeroext i16 %2122(i16** %253, i32 %2123, i32 %2125, i32 %265, i32 %263)
  %2127 = zext i16 %2126 to i32
  %2128 = add nsw i32 %2121, %2127
  %2129 = ashr i32 %2128, 1
  %2130 = sub nsw i32 %2115, %2129
  %2131 = getelementptr inbounds i32* %2109, i32 1
  store i32 %2130, i32* %2109, align 4
  %2132 = sext i16 %x0.1 to i32
  %2133 = add nsw i32 %2132, 2
  %2134 = sext i32 %2133 to i64
  %2135 = getelementptr inbounds i16* %2091, i64 %2134
  %2136 = load i16* %2135, align 2
  %2137 = zext i16 %2136 to i32
  %2138 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %2139 = sext i16 %409 to i32
  %2140 = sext i16 %2081 to i32
  %2141 = add nsw i32 %2140, 8
  %2142 = call zeroext i16 %2138(i16** %238, i32 %2139, i32 %2141, i32 %265, i32 %263)
  %2143 = zext i16 %2142 to i32
  %2144 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %2145 = sext i16 %415 to i32
  %2146 = sext i16 %2087 to i32
  %2147 = add nsw i32 %2146, 8
  %2148 = call zeroext i16 %2144(i16** %253, i32 %2145, i32 %2147, i32 %265, i32 %263)
  %2149 = zext i16 %2148 to i32
  %2150 = add nsw i32 %2143, %2149
  %2151 = ashr i32 %2150, 1
  %2152 = sub nsw i32 %2137, %2151
  %2153 = getelementptr inbounds i32* %2131, i32 1
  store i32 %2152, i32* %2131, align 4
  %2154 = sext i16 %x0.1 to i32
  %2155 = add nsw i32 %2154, 3
  %2156 = sext i32 %2155 to i64
  %2157 = getelementptr inbounds i16* %2091, i64 %2156
  %2158 = load i16* %2157, align 2
  %2159 = zext i16 %2158 to i32
  %2160 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %2161 = sext i16 %409 to i32
  %2162 = sext i16 %2081 to i32
  %2163 = add nsw i32 %2162, 12
  %2164 = call zeroext i16 %2160(i16** %238, i32 %2161, i32 %2163, i32 %265, i32 %263)
  %2165 = zext i16 %2164 to i32
  %2166 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %2167 = sext i16 %415 to i32
  %2168 = sext i16 %2087 to i32
  %2169 = add nsw i32 %2168, 12
  %2170 = call zeroext i16 %2166(i16** %253, i32 %2167, i32 %2169, i32 %265, i32 %263)
  %2171 = zext i16 %2170 to i32
  %2172 = add nsw i32 %2165, %2171
  %2173 = ashr i32 %2172, 1
  %2174 = sub nsw i32 %2159, %2173
  %2175 = getelementptr inbounds i32* %2153, i32 1
  store i32 %2174, i32* %2153, align 4
  %2176 = sext i16 %409 to i32
  %2177 = add nsw i32 %2176, 4
  %2178 = trunc i32 %2177 to i16
  %2179 = sext i16 %415 to i32
  %2180 = add nsw i32 %2179, 4
  %2181 = trunc i32 %2180 to i16
  %2182 = sext i16 %y0.0 to i32
  %2183 = add nsw i32 %2182, 1
  %2184 = sext i32 %2183 to i64
  %2185 = getelementptr inbounds i16** %orig_pic, i64 %2184
  %2186 = load i16** %2185, align 8
  %2187 = sext i16 %x0.1 to i64
  %2188 = getelementptr inbounds i16* %2186, i64 %2187
  %2189 = load i16* %2188, align 2
  %2190 = zext i16 %2189 to i32
  %2191 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %2192 = sext i16 %2178 to i32
  %2193 = sext i16 %2081 to i32
  %2194 = call zeroext i16 %2191(i16** %238, i32 %2192, i32 %2193, i32 %265, i32 %263)
  %2195 = zext i16 %2194 to i32
  %2196 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %2197 = sext i16 %2181 to i32
  %2198 = sext i16 %2087 to i32
  %2199 = call zeroext i16 %2196(i16** %253, i32 %2197, i32 %2198, i32 %265, i32 %263)
  %2200 = zext i16 %2199 to i32
  %2201 = add nsw i32 %2195, %2200
  %2202 = ashr i32 %2201, 2
  %2203 = sub nsw i32 %2190, %2202
  %2204 = getelementptr inbounds i32* %2175, i32 1
  store i32 %2203, i32* %2175, align 4
  %2205 = sext i16 %x0.1 to i32
  %2206 = add nsw i32 %2205, 1
  %2207 = sext i32 %2206 to i64
  %2208 = getelementptr inbounds i16* %2186, i64 %2207
  %2209 = load i16* %2208, align 2
  %2210 = zext i16 %2209 to i32
  %2211 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %2212 = sext i16 %2178 to i32
  %2213 = sext i16 %2081 to i32
  %2214 = add nsw i32 %2213, 4
  %2215 = call zeroext i16 %2211(i16** %238, i32 %2212, i32 %2214, i32 %265, i32 %263)
  %2216 = zext i16 %2215 to i32
  %2217 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %2218 = sext i16 %2181 to i32
  %2219 = sext i16 %2087 to i32
  %2220 = add nsw i32 %2219, 4
  %2221 = call zeroext i16 %2217(i16** %253, i32 %2218, i32 %2220, i32 %265, i32 %263)
  %2222 = zext i16 %2221 to i32
  %2223 = add nsw i32 %2216, %2222
  %2224 = ashr i32 %2223, 2
  %2225 = sub nsw i32 %2210, %2224
  %2226 = getelementptr inbounds i32* %2204, i32 1
  store i32 %2225, i32* %2204, align 4
  %2227 = sext i16 %x0.1 to i32
  %2228 = add nsw i32 %2227, 2
  %2229 = sext i32 %2228 to i64
  %2230 = getelementptr inbounds i16* %2186, i64 %2229
  %2231 = load i16* %2230, align 2
  %2232 = zext i16 %2231 to i32
  %2233 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %2234 = sext i16 %2178 to i32
  %2235 = sext i16 %2081 to i32
  %2236 = add nsw i32 %2235, 8
  %2237 = call zeroext i16 %2233(i16** %238, i32 %2234, i32 %2236, i32 %265, i32 %263)
  %2238 = zext i16 %2237 to i32
  %2239 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %2240 = sext i16 %2181 to i32
  %2241 = sext i16 %2087 to i32
  %2242 = add nsw i32 %2241, 8
  %2243 = call zeroext i16 %2239(i16** %253, i32 %2240, i32 %2242, i32 %265, i32 %263)
  %2244 = zext i16 %2243 to i32
  %2245 = add nsw i32 %2238, %2244
  %2246 = ashr i32 %2245, 2
  %2247 = sub nsw i32 %2232, %2246
  %2248 = getelementptr inbounds i32* %2226, i32 1
  store i32 %2247, i32* %2226, align 4
  %2249 = sext i16 %x0.1 to i32
  %2250 = add nsw i32 %2249, 3
  %2251 = sext i32 %2250 to i64
  %2252 = getelementptr inbounds i16* %2186, i64 %2251
  %2253 = load i16* %2252, align 2
  %2254 = zext i16 %2253 to i32
  %2255 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %2256 = sext i16 %2178 to i32
  %2257 = sext i16 %2081 to i32
  %2258 = add nsw i32 %2257, 12
  %2259 = call zeroext i16 %2255(i16** %238, i32 %2256, i32 %2258, i32 %265, i32 %263)
  %2260 = zext i16 %2259 to i32
  %2261 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %2262 = sext i16 %2181 to i32
  %2263 = sext i16 %2087 to i32
  %2264 = add nsw i32 %2263, 12
  %2265 = call zeroext i16 %2261(i16** %253, i32 %2262, i32 %2264, i32 %265, i32 %263)
  %2266 = zext i16 %2265 to i32
  %2267 = add nsw i32 %2260, %2266
  %2268 = ashr i32 %2267, 2
  %2269 = sub nsw i32 %2254, %2268
  %2270 = getelementptr inbounds i32* %2248, i32 1
  store i32 %2269, i32* %2248, align 4
  %2271 = sext i16 %409 to i32
  %2272 = add nsw i32 %2271, 8
  %2273 = trunc i32 %2272 to i16
  %2274 = sext i16 %415 to i32
  %2275 = add nsw i32 %2274, 8
  %2276 = trunc i32 %2275 to i16
  %2277 = sext i16 %y0.0 to i32
  %2278 = add nsw i32 %2277, 2
  %2279 = sext i32 %2278 to i64
  %2280 = getelementptr inbounds i16** %orig_pic, i64 %2279
  %2281 = load i16** %2280, align 8
  %2282 = sext i16 %x0.1 to i64
  %2283 = getelementptr inbounds i16* %2281, i64 %2282
  %2284 = load i16* %2283, align 2
  %2285 = zext i16 %2284 to i32
  %2286 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %2287 = sext i16 %2273 to i32
  %2288 = sext i16 %2081 to i32
  %2289 = call zeroext i16 %2286(i16** %238, i32 %2287, i32 %2288, i32 %265, i32 %263)
  %2290 = zext i16 %2289 to i32
  %2291 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %2292 = sext i16 %2276 to i32
  %2293 = sext i16 %2087 to i32
  %2294 = call zeroext i16 %2291(i16** %253, i32 %2292, i32 %2293, i32 %265, i32 %263)
  %2295 = zext i16 %2294 to i32
  %2296 = add nsw i32 %2290, %2295
  %2297 = ashr i32 %2296, 1
  %2298 = sub nsw i32 %2285, %2297
  %2299 = getelementptr inbounds i32* %2270, i32 1
  store i32 %2298, i32* %2270, align 4
  %2300 = sext i16 %x0.1 to i32
  %2301 = add nsw i32 %2300, 1
  %2302 = sext i32 %2301 to i64
  %2303 = getelementptr inbounds i16* %2281, i64 %2302
  %2304 = load i16* %2303, align 2
  %2305 = zext i16 %2304 to i32
  %2306 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %2307 = sext i16 %2273 to i32
  %2308 = sext i16 %2081 to i32
  %2309 = add nsw i32 %2308, 4
  %2310 = call zeroext i16 %2306(i16** %238, i32 %2307, i32 %2309, i32 %265, i32 %263)
  %2311 = zext i16 %2310 to i32
  %2312 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %2313 = sext i16 %2276 to i32
  %2314 = sext i16 %2087 to i32
  %2315 = add nsw i32 %2314, 4
  %2316 = call zeroext i16 %2312(i16** %253, i32 %2313, i32 %2315, i32 %265, i32 %263)
  %2317 = zext i16 %2316 to i32
  %2318 = add nsw i32 %2311, %2317
  %2319 = ashr i32 %2318, 1
  %2320 = sub nsw i32 %2305, %2319
  %2321 = getelementptr inbounds i32* %2299, i32 1
  store i32 %2320, i32* %2299, align 4
  %2322 = sext i16 %x0.1 to i32
  %2323 = add nsw i32 %2322, 2
  %2324 = sext i32 %2323 to i64
  %2325 = getelementptr inbounds i16* %2281, i64 %2324
  %2326 = load i16* %2325, align 2
  %2327 = zext i16 %2326 to i32
  %2328 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %2329 = sext i16 %2273 to i32
  %2330 = sext i16 %2081 to i32
  %2331 = add nsw i32 %2330, 8
  %2332 = call zeroext i16 %2328(i16** %238, i32 %2329, i32 %2331, i32 %265, i32 %263)
  %2333 = zext i16 %2332 to i32
  %2334 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %2335 = sext i16 %2276 to i32
  %2336 = sext i16 %2087 to i32
  %2337 = add nsw i32 %2336, 8
  %2338 = call zeroext i16 %2334(i16** %253, i32 %2335, i32 %2337, i32 %265, i32 %263)
  %2339 = zext i16 %2338 to i32
  %2340 = add nsw i32 %2333, %2339
  %2341 = ashr i32 %2340, 1
  %2342 = sub nsw i32 %2327, %2341
  %2343 = getelementptr inbounds i32* %2321, i32 1
  store i32 %2342, i32* %2321, align 4
  %2344 = sext i16 %x0.1 to i32
  %2345 = add nsw i32 %2344, 3
  %2346 = sext i32 %2345 to i64
  %2347 = getelementptr inbounds i16* %2281, i64 %2346
  %2348 = load i16* %2347, align 2
  %2349 = zext i16 %2348 to i32
  %2350 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %2351 = sext i16 %2273 to i32
  %2352 = sext i16 %2081 to i32
  %2353 = add nsw i32 %2352, 12
  %2354 = call zeroext i16 %2350(i16** %238, i32 %2351, i32 %2353, i32 %265, i32 %263)
  %2355 = zext i16 %2354 to i32
  %2356 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %2357 = sext i16 %2276 to i32
  %2358 = sext i16 %2087 to i32
  %2359 = add nsw i32 %2358, 12
  %2360 = call zeroext i16 %2356(i16** %253, i32 %2357, i32 %2359, i32 %265, i32 %263)
  %2361 = zext i16 %2360 to i32
  %2362 = add nsw i32 %2355, %2361
  %2363 = ashr i32 %2362, 1
  %2364 = sub nsw i32 %2349, %2363
  %2365 = getelementptr inbounds i32* %2343, i32 1
  store i32 %2364, i32* %2343, align 4
  %2366 = sext i16 %409 to i32
  %2367 = add nsw i32 %2366, 12
  %2368 = trunc i32 %2367 to i16
  %2369 = sext i16 %415 to i32
  %2370 = add nsw i32 %2369, 12
  %2371 = trunc i32 %2370 to i16
  %2372 = sext i16 %y0.0 to i32
  %2373 = add nsw i32 %2372, 3
  %2374 = sext i32 %2373 to i64
  %2375 = getelementptr inbounds i16** %orig_pic, i64 %2374
  %2376 = load i16** %2375, align 8
  %2377 = sext i16 %x0.1 to i64
  %2378 = getelementptr inbounds i16* %2376, i64 %2377
  %2379 = load i16* %2378, align 2
  %2380 = zext i16 %2379 to i32
  %2381 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %2382 = sext i16 %2368 to i32
  %2383 = sext i16 %2081 to i32
  %2384 = call zeroext i16 %2381(i16** %238, i32 %2382, i32 %2383, i32 %265, i32 %263)
  %2385 = zext i16 %2384 to i32
  %2386 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %2387 = sext i16 %2371 to i32
  %2388 = sext i16 %2087 to i32
  %2389 = call zeroext i16 %2386(i16** %253, i32 %2387, i32 %2388, i32 %265, i32 %263)
  %2390 = zext i16 %2389 to i32
  %2391 = add nsw i32 %2385, %2390
  %2392 = ashr i32 %2391, 1
  %2393 = sub nsw i32 %2380, %2392
  %2394 = getelementptr inbounds i32* %2365, i32 1
  store i32 %2393, i32* %2365, align 4
  %2395 = sext i16 %x0.1 to i32
  %2396 = add nsw i32 %2395, 1
  %2397 = sext i32 %2396 to i64
  %2398 = getelementptr inbounds i16* %2376, i64 %2397
  %2399 = load i16* %2398, align 2
  %2400 = zext i16 %2399 to i32
  %2401 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %2402 = sext i16 %2368 to i32
  %2403 = sext i16 %2081 to i32
  %2404 = add nsw i32 %2403, 4
  %2405 = call zeroext i16 %2401(i16** %238, i32 %2402, i32 %2404, i32 %265, i32 %263)
  %2406 = zext i16 %2405 to i32
  %2407 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %2408 = sext i16 %2371 to i32
  %2409 = sext i16 %2087 to i32
  %2410 = add nsw i32 %2409, 4
  %2411 = call zeroext i16 %2407(i16** %253, i32 %2408, i32 %2410, i32 %265, i32 %263)
  %2412 = zext i16 %2411 to i32
  %2413 = add nsw i32 %2406, %2412
  %2414 = ashr i32 %2413, 1
  %2415 = sub nsw i32 %2400, %2414
  %2416 = getelementptr inbounds i32* %2394, i32 1
  store i32 %2415, i32* %2394, align 4
  %2417 = sext i16 %x0.1 to i32
  %2418 = add nsw i32 %2417, 2
  %2419 = sext i32 %2418 to i64
  %2420 = getelementptr inbounds i16* %2376, i64 %2419
  %2421 = load i16* %2420, align 2
  %2422 = zext i16 %2421 to i32
  %2423 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %2424 = sext i16 %2368 to i32
  %2425 = sext i16 %2081 to i32
  %2426 = add nsw i32 %2425, 8
  %2427 = call zeroext i16 %2423(i16** %238, i32 %2424, i32 %2426, i32 %265, i32 %263)
  %2428 = zext i16 %2427 to i32
  %2429 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %2430 = sext i16 %2371 to i32
  %2431 = sext i16 %2087 to i32
  %2432 = add nsw i32 %2431, 8
  %2433 = call zeroext i16 %2429(i16** %253, i32 %2430, i32 %2432, i32 %265, i32 %263)
  %2434 = zext i16 %2433 to i32
  %2435 = add nsw i32 %2428, %2434
  %2436 = ashr i32 %2435, 1
  %2437 = sub nsw i32 %2422, %2436
  %2438 = getelementptr inbounds i32* %2416, i32 1
  store i32 %2437, i32* %2416, align 4
  %2439 = sext i16 %x0.1 to i32
  %2440 = add nsw i32 %2439, 3
  %2441 = sext i32 %2440 to i64
  %2442 = getelementptr inbounds i16* %2376, i64 %2441
  %2443 = load i16* %2442, align 2
  %2444 = zext i16 %2443 to i32
  %2445 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %2446 = sext i16 %2368 to i32
  %2447 = sext i16 %2081 to i32
  %2448 = add nsw i32 %2447, 12
  %2449 = call zeroext i16 %2445(i16** %238, i32 %2446, i32 %2448, i32 %265, i32 %263)
  %2450 = zext i16 %2449 to i32
  %2451 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %2452 = sext i16 %2371 to i32
  %2453 = sext i16 %2087 to i32
  %2454 = add nsw i32 %2453, 12
  %2455 = call zeroext i16 %2451(i16** %253, i32 %2452, i32 %2454, i32 %265, i32 %263)
  %2456 = zext i16 %2455 to i32
  %2457 = add nsw i32 %2450, %2456
  %2458 = ashr i32 %2457, 1
  %2459 = sub nsw i32 %2444, %2458
  store i32 %2459, i32* %2438, align 4
  %2460 = load %struct.InputParameters** @input, align 8
  %2461 = getelementptr inbounds %struct.InputParameters* %2460, i32 0, i32 123
  %2462 = load i32* %2461, align 4
  %2463 = icmp ne i32 %2462, 0
  br i1 %2463, label %2474, label %2464

; <label>:2464                                    ; preds = %2074
  %2465 = getelementptr inbounds [16 x i32]* %diff, i32 0, i32 0
  %2466 = call i32 @SATD(i32* %2465, i32 %223)
  %2467 = sext i16 %mcost.4 to i32
  %2468 = add nsw i32 %2467, %2466
  %2469 = trunc i32 %2468 to i16
  %2470 = sext i16 %2469 to i32
  %2471 = icmp sgt i32 %2470, %.0
  br i1 %2471, label %2472, label %2473

; <label>:2472                                    ; preds = %2464
  br label %2504

; <label>:2473                                    ; preds = %2464
  br label %2499

; <label>:2474                                    ; preds = %2074
  br label %2475

; <label>:2475                                    ; preds = %2496, %2474
  %k.2 = phi i32 [ 0, %2474 ], [ %k.3, %2496 ]
  %j.1 = phi i32 [ 0, %2474 ], [ %2497, %2496 ]
  %2476 = icmp slt i32 %j.1, 4
  br i1 %2476, label %2477, label %2498

; <label>:2477                                    ; preds = %2475
  br label %2478

; <label>:2478                                    ; preds = %2492, %2477
  %k.3 = phi i32 [ %k.2, %2477 ], [ %2494, %2492 ]
  %i.1 = phi i32 [ 0, %2477 ], [ %2493, %2492 ]
  %2479 = icmp slt i32 %i.1, 4
  br i1 %2479, label %2480, label %2495

; <label>:2480                                    ; preds = %2478
  %2481 = sext i32 %k.3 to i64
  %2482 = getelementptr inbounds [16 x i32]* %diff, i32 0, i64 %2481
  %2483 = load i32* %2482, align 4
  %2484 = sext i16 %x0.1 to i32
  %2485 = add nsw i32 %2484, %i.1
  %2486 = sext i32 %2485 to i64
  %2487 = sext i16 %y0.0 to i32
  %2488 = add nsw i32 %2487, %j.1
  %2489 = sext i32 %2488 to i64
  %2490 = getelementptr inbounds [16 x [16 x i32]]* %curr_diff, i32 0, i64 %2489
  %2491 = getelementptr inbounds [16 x i32]* %2490, i32 0, i64 %2486
  store i32 %2483, i32* %2491, align 4
  br label %2492

; <label>:2492                                    ; preds = %2480
  %2493 = add nsw i32 %i.1, 1
  %2494 = add nsw i32 %k.3, 1
  br label %2478

; <label>:2495                                    ; preds = %2478
  br label %2496

; <label>:2496                                    ; preds = %2495
  %2497 = add nsw i32 %j.1, 1
  br label %2475

; <label>:2498                                    ; preds = %2475
  br label %2499

; <label>:2499                                    ; preds = %2498, %2473
  %mcost.5 = phi i16 [ %mcost.4, %2498 ], [ %2469, %2473 ]
  br label %2500

; <label>:2500                                    ; preds = %2499
  %2501 = sext i16 %x0.1 to i32
  %2502 = add nsw i32 %2501, 4
  %2503 = trunc i32 %2502 to i16
  br label %2070

; <label>:2504                                    ; preds = %2472, %2070
  %mcost.6 = phi i16 [ %2469, %2472 ], [ %mcost.4, %2070 ]
  %abort_search.2 = phi i16 [ 1, %2472 ], [ %abort_search.0, %2070 ]
  br label %2505

; <label>:2505                                    ; preds = %2504, %2068
  %mcost.7 = phi i16 [ %mcost.3, %2068 ], [ %mcost.6, %2504 ]
  %abort_search.3 = phi i16 [ %abort_search.1, %2068 ], [ %abort_search.2, %2504 ]
  br label %2506

; <label>:2506                                    ; preds = %2505
  %2507 = sext i16 %y0.0 to i32
  %2508 = add nsw i32 %2507, 4
  %2509 = trunc i32 %2508 to i16
  br label %393

; <label>:2510                                    ; preds = %400
  %2511 = load %struct.InputParameters** @input, align 8
  %2512 = getelementptr inbounds %struct.InputParameters* %2511, i32 0, i32 123
  %2513 = load i32* %2512, align 4
  %2514 = icmp ne i32 %2513, 0
  br i1 %2514, label %2515, label %2521

; <label>:2515                                    ; preds = %2510
  %2516 = getelementptr inbounds [16 x [16 x i32]]* %curr_diff, i32 0, i32 0
  %2517 = call i32 @find_SATD([16 x i32]* %2516, i32 %223, i32 %blocktype)
  %2518 = sext i16 %mcost.0 to i32
  %2519 = add nsw i32 %2518, %2517
  %2520 = trunc i32 %2519 to i16
  br label %2521

; <label>:2521                                    ; preds = %2515, %2510
  %mcost.8 = phi i16 [ %2520, %2515 ], [ %mcost.0, %2510 ]
  %2522 = sext i16 %mcost.8 to i32
  %2523 = icmp slt i32 %2522, %.0
  br i1 %2523, label %2524, label %2526

; <label>:2524                                    ; preds = %2521
  %2525 = sext i16 %mcost.8 to i32
  br label %2526

; <label>:2526                                    ; preds = %2524, %2521
  %best_pos.1 = phi i16 [ %pos.0, %2524 ], [ %best_pos.0, %2521 ]
  %.1 = phi i32 [ %2525, %2524 ], [ %.0, %2521 ]
  br label %2527

; <label>:2527                                    ; preds = %2526
  %2528 = add i16 %pos.0, 1
  br label %348

; <label>:2529                                    ; preds = %348
  %2530 = icmp ne i16 %best_pos.0, 0
  br i1 %2530, label %2531, label %2550

; <label>:2531                                    ; preds = %2529
  %2532 = sext i16 %best_pos.0 to i64
  %2533 = load i32** @spiral_search_x, align 8
  %2534 = getelementptr inbounds i32* %2533, i64 %2532
  %2535 = load i32* %2534, align 4
  %2536 = shl i32 %2535, 1
  %2537 = load i16* %mv_x, align 2
  %2538 = sext i16 %2537 to i32
  %2539 = add nsw i32 %2538, %2536
  %2540 = trunc i32 %2539 to i16
  store i16 %2540, i16* %mv_x, align 2
  %2541 = sext i16 %best_pos.0 to i64
  %2542 = load i32** @spiral_search_y, align 8
  %2543 = getelementptr inbounds i32* %2542, i64 %2541
  %2544 = load i32* %2543, align 4
  %2545 = shl i32 %2544, 1
  %2546 = load i16* %mv_y, align 2
  %2547 = sext i16 %2546 to i32
  %2548 = add nsw i32 %2547, %2545
  %2549 = trunc i32 %2548 to i16
  store i16 %2549, i16* %mv_y, align 2
  br label %2550

; <label>:2550                                    ; preds = %2531, %2529
  %2551 = load %struct.InputParameters** @input, align 8
  %2552 = getelementptr inbounds %struct.InputParameters* %2551, i32 0, i32 7
  %2553 = load i32* %2552, align 4
  %2554 = icmp ne i32 %2553, 0
  br i1 %2554, label %2555, label %2556

; <label>:2555                                    ; preds = %2550
  br label %2556

; <label>:2556                                    ; preds = %2555, %2550
  %.2 = phi i32 [ 2147483647, %2555 ], [ %.0, %2550 ]
  %2557 = sext i16 %19 to i32
  %2558 = load i16* %mv_x, align 2
  %2559 = sext i16 %2558 to i32
  %2560 = add nsw i32 %2557, %2559
  %2561 = icmp sgt i32 %2560, 1
  br i1 %2561, label %2562, label %2585

; <label>:2562                                    ; preds = %2556
  %2563 = sext i16 %19 to i32
  %2564 = load i16* %mv_x, align 2
  %2565 = sext i16 %2564 to i32
  %2566 = add nsw i32 %2563, %2565
  %2567 = sext i16 %272 to i32
  %2568 = sub nsw i32 %2567, 1
  %2569 = icmp slt i32 %2566, %2568
  br i1 %2569, label %2570, label %2585

; <label>:2570                                    ; preds = %2562
  %2571 = sext i16 %21 to i32
  %2572 = load i16* %mv_y, align 2
  %2573 = sext i16 %2572 to i32
  %2574 = add nsw i32 %2571, %2573
  %2575 = icmp sgt i32 %2574, 1
  br i1 %2575, label %2576, label %2585

; <label>:2576                                    ; preds = %2570
  %2577 = sext i16 %21 to i32
  %2578 = load i16* %mv_y, align 2
  %2579 = sext i16 %2578 to i32
  %2580 = add nsw i32 %2577, %2579
  %2581 = sext i16 %279 to i32
  %2582 = sub nsw i32 %2581, 1
  %2583 = icmp slt i32 %2580, %2582
  br i1 %2583, label %2584, label %2585

; <label>:2584                                    ; preds = %2576
  store i16 (i16**, i32, i32, i32, i32)* @FastPelY_14, i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  br label %2586

; <label>:2585                                    ; preds = %2576, %2570, %2562, %2556
  store i16 (i16**, i32, i32, i32, i32)* @UMVPelY_14, i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  br label %2586

; <label>:2586                                    ; preds = %2585, %2584
  %2587 = trunc i32 %228 to i16
  br label %2588

; <label>:2588                                    ; preds = %4773, %2586
  %pos.1 = phi i16 [ %2587, %2586 ], [ %4774, %4773 ]
  %best_pos.2 = phi i16 [ 0, %2586 ], [ %best_pos.3, %4773 ]
  %.3 = phi i32 [ %.2, %2586 ], [ %.4, %4773 ]
  %2589 = sext i16 %pos.1 to i32
  %2590 = icmp slt i32 %2589, %search_pos4
  br i1 %2590, label %2591, label %4775

; <label>:2591                                    ; preds = %2588
  %2592 = load i16* %mv_x, align 2
  %2593 = sext i16 %2592 to i32
  %2594 = sext i16 %pos.1 to i64
  %2595 = load i32** @spiral_search_x, align 8
  %2596 = getelementptr inbounds i32* %2595, i64 %2594
  %2597 = load i32* %2596, align 4
  %2598 = add nsw i32 %2593, %2597
  %2599 = trunc i32 %2598 to i16
  %2600 = load i16* %mv_y, align 2
  %2601 = sext i16 %2600 to i32
  %2602 = sext i16 %pos.1 to i64
  %2603 = load i32** @spiral_search_y, align 8
  %2604 = getelementptr inbounds i32* %2603, i64 %2602
  %2605 = load i32* %2604, align 4
  %2606 = add nsw i32 %2601, %2605
  %2607 = trunc i32 %2606 to i16
  %2608 = sext i16 %2599 to i32
  %2609 = sext i16 0 to i32
  %2610 = shl i32 %2608, %2609
  %2611 = sext i16 %pred_mv_x to i32
  %2612 = sub nsw i32 %2610, %2611
  %2613 = sext i32 %2612 to i64
  %2614 = load i32** @mvbits, align 8
  %2615 = getelementptr inbounds i32* %2614, i64 %2613
  %2616 = load i32* %2615, align 4
  %2617 = sext i16 %2607 to i32
  %2618 = sext i16 0 to i32
  %2619 = shl i32 %2617, %2618
  %2620 = sext i16 %pred_mv_y to i32
  %2621 = sub nsw i32 %2619, %2620
  %2622 = sext i32 %2621 to i64
  %2623 = load i32** @mvbits, align 8
  %2624 = getelementptr inbounds i32* %2623, i64 %2622
  %2625 = load i32* %2624, align 4
  %2626 = add nsw i32 %2616, %2625
  %2627 = mul nsw i32 %3, %2626
  %2628 = ashr i32 %2627, 16
  %2629 = trunc i32 %2628 to i16
  br label %2630

; <label>:2630                                    ; preds = %4749, %2591
  %mcost.9 = phi i16 [ %2629, %2591 ], [ %mcost.16, %4749 ]
  %abort_search.4 = phi i16 [ 0, %2591 ], [ %abort_search.7, %4749 ]
  %y0.1 = phi i16 [ 0, %2591 ], [ %4752, %4749 ]
  %2631 = sext i16 %y0.1 to i32
  %2632 = sext i16 %17 to i32
  %2633 = icmp slt i32 %2631, %2632
  br i1 %2633, label %2634, label %2637

; <label>:2634                                    ; preds = %2630
  %2635 = icmp ne i16 %abort_search.4, 0
  %2636 = xor i1 %2635, true
  br label %2637

; <label>:2637                                    ; preds = %2634, %2630
  %2638 = phi i1 [ false, %2630 ], [ %2636, %2634 ]
  br i1 %2638, label %2639, label %4753

; <label>:2639                                    ; preds = %2637
  %2640 = sext i16 %y0.1 to i32
  %2641 = add nsw i32 %pic_pix_y, %2640
  %2642 = shl i32 %2641, 2
  %2643 = load i16* %s_mv_y, align 2
  %2644 = sext i16 %2643 to i32
  %2645 = add nsw i32 %2642, %2644
  %2646 = trunc i32 %2645 to i16
  %2647 = sext i16 %y0.1 to i32
  %2648 = add nsw i32 %pic_pix_y, %2647
  %2649 = shl i32 %2648, 2
  %2650 = sext i16 %2607 to i32
  %2651 = add nsw i32 %2649, %2650
  %2652 = trunc i32 %2651 to i16
  %2653 = icmp ne i16 %72, 0
  br i1 %2653, label %2654, label %4309

; <label>:2654                                    ; preds = %2639
  br label %2655

; <label>:2655                                    ; preds = %4304, %2654
  %mcost.10 = phi i16 [ %mcost.9, %2654 ], [ %mcost.11, %4304 ]
  %x0.2 = phi i16 [ 0, %2654 ], [ %4307, %4304 ]
  %2656 = sext i16 %x0.2 to i32
  %2657 = sext i16 %10 to i32
  %2658 = icmp slt i32 %2656, %2657
  br i1 %2658, label %2659, label %4308

; <label>:2659                                    ; preds = %2655
  %2660 = sext i16 %x0.2 to i32
  %2661 = add nsw i32 %pic_pix_x, %2660
  %2662 = shl i32 %2661, 2
  %2663 = load i16* %s_mv_x, align 2
  %2664 = sext i16 %2663 to i32
  %2665 = add nsw i32 %2662, %2664
  %2666 = trunc i32 %2665 to i16
  %2667 = sext i16 %x0.2 to i32
  %2668 = add nsw i32 %pic_pix_x, %2667
  %2669 = shl i32 %2668, 2
  %2670 = sext i16 %2599 to i32
  %2671 = add nsw i32 %2669, %2670
  %2672 = trunc i32 %2671 to i16
  %2673 = getelementptr inbounds [16 x i32]* %diff, i32 0, i32 0
  %2674 = sext i16 %y0.1 to i64
  %2675 = getelementptr inbounds i16** %orig_pic, i64 %2674
  %2676 = load i16** %2675, align 8
  %2677 = sext i16 %108 to i32
  %2678 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %2679 = sext i16 %2646 to i32
  %2680 = sext i16 %2666 to i32
  %2681 = call zeroext i16 %2678(i16** %238, i32 %2679, i32 %2680, i32 %265, i32 %263)
  %2682 = zext i16 %2681 to i32
  %2683 = mul nsw i32 %2677, %2682
  %2684 = sext i16 %144 to i32
  %2685 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %2686 = sext i16 %2652 to i32
  %2687 = sext i16 %2672 to i32
  %2688 = call zeroext i16 %2685(i16** %253, i32 %2686, i32 %2687, i32 %265, i32 %263)
  %2689 = zext i16 %2688 to i32
  %2690 = mul nsw i32 %2684, %2689
  %2691 = add nsw i32 %2683, %2690
  %2692 = load i32* @wp_luma_round, align 4
  %2693 = mul nsw i32 2, %2692
  %2694 = add nsw i32 %2691, %2693
  %2695 = load i32* @luma_log_weight_denom, align 4
  %2696 = add nsw i32 %2695, 1
  %2697 = ashr i32 %2694, %2696
  %2698 = sext i16 %212 to i32
  %2699 = add nsw i32 %2697, %2698
  %2700 = icmp slt i32 %2699, 0
  br i1 %2700, label %2701, label %2702

; <label>:2701                                    ; preds = %2659
  br label %2760

; <label>:2702                                    ; preds = %2659
  %2703 = sext i16 %108 to i32
  %2704 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %2705 = sext i16 %2646 to i32
  %2706 = sext i16 %2666 to i32
  %2707 = call zeroext i16 %2704(i16** %238, i32 %2705, i32 %2706, i32 %265, i32 %263)
  %2708 = zext i16 %2707 to i32
  %2709 = mul nsw i32 %2703, %2708
  %2710 = sext i16 %144 to i32
  %2711 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %2712 = sext i16 %2652 to i32
  %2713 = sext i16 %2672 to i32
  %2714 = call zeroext i16 %2711(i16** %253, i32 %2712, i32 %2713, i32 %265, i32 %263)
  %2715 = zext i16 %2714 to i32
  %2716 = mul nsw i32 %2710, %2715
  %2717 = add nsw i32 %2709, %2716
  %2718 = load i32* @wp_luma_round, align 4
  %2719 = mul nsw i32 2, %2718
  %2720 = add nsw i32 %2717, %2719
  %2721 = load i32* @luma_log_weight_denom, align 4
  %2722 = add nsw i32 %2721, 1
  %2723 = ashr i32 %2720, %2722
  %2724 = sext i16 %212 to i32
  %2725 = add nsw i32 %2723, %2724
  %2726 = load %struct.ImageParameters** @img, align 8
  %2727 = getelementptr inbounds %struct.ImageParameters* %2726, i32 0, i32 155
  %2728 = load i32* %2727, align 4
  %2729 = icmp sgt i32 %2725, %2728
  br i1 %2729, label %2730, label %2734

; <label>:2730                                    ; preds = %2702
  %2731 = load %struct.ImageParameters** @img, align 8
  %2732 = getelementptr inbounds %struct.ImageParameters* %2731, i32 0, i32 155
  %2733 = load i32* %2732, align 4
  br label %2758

; <label>:2734                                    ; preds = %2702
  %2735 = sext i16 %108 to i32
  %2736 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %2737 = sext i16 %2646 to i32
  %2738 = sext i16 %2666 to i32
  %2739 = call zeroext i16 %2736(i16** %238, i32 %2737, i32 %2738, i32 %265, i32 %263)
  %2740 = zext i16 %2739 to i32
  %2741 = mul nsw i32 %2735, %2740
  %2742 = sext i16 %144 to i32
  %2743 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %2744 = sext i16 %2652 to i32
  %2745 = sext i16 %2672 to i32
  %2746 = call zeroext i16 %2743(i16** %253, i32 %2744, i32 %2745, i32 %265, i32 %263)
  %2747 = zext i16 %2746 to i32
  %2748 = mul nsw i32 %2742, %2747
  %2749 = add nsw i32 %2741, %2748
  %2750 = load i32* @wp_luma_round, align 4
  %2751 = mul nsw i32 2, %2750
  %2752 = add nsw i32 %2749, %2751
  %2753 = load i32* @luma_log_weight_denom, align 4
  %2754 = add nsw i32 %2753, 1
  %2755 = ashr i32 %2752, %2754
  %2756 = sext i16 %212 to i32
  %2757 = add nsw i32 %2755, %2756
  br label %2758

; <label>:2758                                    ; preds = %2734, %2730
  %2759 = phi i32 [ %2733, %2730 ], [ %2757, %2734 ]
  br label %2760

; <label>:2760                                    ; preds = %2758, %2701
  %2761 = phi i32 [ 0, %2701 ], [ %2759, %2758 ]
  %2762 = sext i16 %x0.2 to i64
  %2763 = getelementptr inbounds i16* %2676, i64 %2762
  %2764 = load i16* %2763, align 2
  %2765 = zext i16 %2764 to i32
  %2766 = sub nsw i32 %2765, %2761
  %2767 = getelementptr inbounds i32* %2673, i32 1
  store i32 %2766, i32* %2673, align 4
  %2768 = sext i16 %108 to i32
  %2769 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %2770 = sext i16 %2646 to i32
  %2771 = sext i16 %2666 to i32
  %2772 = add nsw i32 %2771, 4
  %2773 = call zeroext i16 %2769(i16** %238, i32 %2770, i32 %2772, i32 %265, i32 %263)
  %2774 = zext i16 %2773 to i32
  %2775 = mul nsw i32 %2768, %2774
  %2776 = sext i16 %144 to i32
  %2777 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %2778 = sext i16 %2652 to i32
  %2779 = sext i16 %2672 to i32
  %2780 = add nsw i32 %2779, 4
  %2781 = call zeroext i16 %2777(i16** %253, i32 %2778, i32 %2780, i32 %265, i32 %263)
  %2782 = zext i16 %2781 to i32
  %2783 = mul nsw i32 %2776, %2782
  %2784 = add nsw i32 %2775, %2783
  %2785 = load i32* @wp_luma_round, align 4
  %2786 = mul nsw i32 2, %2785
  %2787 = add nsw i32 %2784, %2786
  %2788 = load i32* @luma_log_weight_denom, align 4
  %2789 = add nsw i32 %2788, 1
  %2790 = ashr i32 %2787, %2789
  %2791 = sext i16 %212 to i32
  %2792 = add nsw i32 %2790, %2791
  %2793 = icmp slt i32 %2792, 0
  br i1 %2793, label %2794, label %2795

; <label>:2794                                    ; preds = %2760
  br label %2857

; <label>:2795                                    ; preds = %2760
  %2796 = sext i16 %108 to i32
  %2797 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %2798 = sext i16 %2646 to i32
  %2799 = sext i16 %2666 to i32
  %2800 = add nsw i32 %2799, 4
  %2801 = call zeroext i16 %2797(i16** %238, i32 %2798, i32 %2800, i32 %265, i32 %263)
  %2802 = zext i16 %2801 to i32
  %2803 = mul nsw i32 %2796, %2802
  %2804 = sext i16 %144 to i32
  %2805 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %2806 = sext i16 %2652 to i32
  %2807 = sext i16 %2672 to i32
  %2808 = add nsw i32 %2807, 4
  %2809 = call zeroext i16 %2805(i16** %253, i32 %2806, i32 %2808, i32 %265, i32 %263)
  %2810 = zext i16 %2809 to i32
  %2811 = mul nsw i32 %2804, %2810
  %2812 = add nsw i32 %2803, %2811
  %2813 = load i32* @wp_luma_round, align 4
  %2814 = mul nsw i32 2, %2813
  %2815 = add nsw i32 %2812, %2814
  %2816 = load i32* @luma_log_weight_denom, align 4
  %2817 = add nsw i32 %2816, 1
  %2818 = ashr i32 %2815, %2817
  %2819 = sext i16 %212 to i32
  %2820 = add nsw i32 %2818, %2819
  %2821 = load %struct.ImageParameters** @img, align 8
  %2822 = getelementptr inbounds %struct.ImageParameters* %2821, i32 0, i32 155
  %2823 = load i32* %2822, align 4
  %2824 = icmp sgt i32 %2820, %2823
  br i1 %2824, label %2825, label %2829

; <label>:2825                                    ; preds = %2795
  %2826 = load %struct.ImageParameters** @img, align 8
  %2827 = getelementptr inbounds %struct.ImageParameters* %2826, i32 0, i32 155
  %2828 = load i32* %2827, align 4
  br label %2855

; <label>:2829                                    ; preds = %2795
  %2830 = sext i16 %108 to i32
  %2831 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %2832 = sext i16 %2646 to i32
  %2833 = sext i16 %2666 to i32
  %2834 = add nsw i32 %2833, 4
  %2835 = call zeroext i16 %2831(i16** %238, i32 %2832, i32 %2834, i32 %265, i32 %263)
  %2836 = zext i16 %2835 to i32
  %2837 = mul nsw i32 %2830, %2836
  %2838 = sext i16 %144 to i32
  %2839 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %2840 = sext i16 %2652 to i32
  %2841 = sext i16 %2672 to i32
  %2842 = add nsw i32 %2841, 4
  %2843 = call zeroext i16 %2839(i16** %253, i32 %2840, i32 %2842, i32 %265, i32 %263)
  %2844 = zext i16 %2843 to i32
  %2845 = mul nsw i32 %2838, %2844
  %2846 = add nsw i32 %2837, %2845
  %2847 = load i32* @wp_luma_round, align 4
  %2848 = mul nsw i32 2, %2847
  %2849 = add nsw i32 %2846, %2848
  %2850 = load i32* @luma_log_weight_denom, align 4
  %2851 = add nsw i32 %2850, 1
  %2852 = ashr i32 %2849, %2851
  %2853 = sext i16 %212 to i32
  %2854 = add nsw i32 %2852, %2853
  br label %2855

; <label>:2855                                    ; preds = %2829, %2825
  %2856 = phi i32 [ %2828, %2825 ], [ %2854, %2829 ]
  br label %2857

; <label>:2857                                    ; preds = %2855, %2794
  %2858 = phi i32 [ 0, %2794 ], [ %2856, %2855 ]
  %2859 = sext i16 %x0.2 to i32
  %2860 = add nsw i32 %2859, 1
  %2861 = sext i32 %2860 to i64
  %2862 = getelementptr inbounds i16* %2676, i64 %2861
  %2863 = load i16* %2862, align 2
  %2864 = zext i16 %2863 to i32
  %2865 = sub nsw i32 %2864, %2858
  %2866 = getelementptr inbounds i32* %2767, i32 1
  store i32 %2865, i32* %2767, align 4
  %2867 = sext i16 %108 to i32
  %2868 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %2869 = sext i16 %2646 to i32
  %2870 = sext i16 %2666 to i32
  %2871 = add nsw i32 %2870, 8
  %2872 = call zeroext i16 %2868(i16** %238, i32 %2869, i32 %2871, i32 %265, i32 %263)
  %2873 = zext i16 %2872 to i32
  %2874 = mul nsw i32 %2867, %2873
  %2875 = sext i16 %144 to i32
  %2876 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %2877 = sext i16 %2652 to i32
  %2878 = sext i16 %2672 to i32
  %2879 = add nsw i32 %2878, 8
  %2880 = call zeroext i16 %2876(i16** %253, i32 %2877, i32 %2879, i32 %265, i32 %263)
  %2881 = zext i16 %2880 to i32
  %2882 = mul nsw i32 %2875, %2881
  %2883 = add nsw i32 %2874, %2882
  %2884 = load i32* @wp_luma_round, align 4
  %2885 = mul nsw i32 2, %2884
  %2886 = add nsw i32 %2883, %2885
  %2887 = load i32* @luma_log_weight_denom, align 4
  %2888 = add nsw i32 %2887, 1
  %2889 = ashr i32 %2886, %2888
  %2890 = sext i16 %212 to i32
  %2891 = add nsw i32 %2889, %2890
  %2892 = icmp slt i32 %2891, 0
  br i1 %2892, label %2893, label %2894

; <label>:2893                                    ; preds = %2857
  br label %2956

; <label>:2894                                    ; preds = %2857
  %2895 = sext i16 %108 to i32
  %2896 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %2897 = sext i16 %2646 to i32
  %2898 = sext i16 %2666 to i32
  %2899 = add nsw i32 %2898, 8
  %2900 = call zeroext i16 %2896(i16** %238, i32 %2897, i32 %2899, i32 %265, i32 %263)
  %2901 = zext i16 %2900 to i32
  %2902 = mul nsw i32 %2895, %2901
  %2903 = sext i16 %144 to i32
  %2904 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %2905 = sext i16 %2652 to i32
  %2906 = sext i16 %2672 to i32
  %2907 = add nsw i32 %2906, 8
  %2908 = call zeroext i16 %2904(i16** %253, i32 %2905, i32 %2907, i32 %265, i32 %263)
  %2909 = zext i16 %2908 to i32
  %2910 = mul nsw i32 %2903, %2909
  %2911 = add nsw i32 %2902, %2910
  %2912 = load i32* @wp_luma_round, align 4
  %2913 = mul nsw i32 2, %2912
  %2914 = add nsw i32 %2911, %2913
  %2915 = load i32* @luma_log_weight_denom, align 4
  %2916 = add nsw i32 %2915, 1
  %2917 = ashr i32 %2914, %2916
  %2918 = sext i16 %212 to i32
  %2919 = add nsw i32 %2917, %2918
  %2920 = load %struct.ImageParameters** @img, align 8
  %2921 = getelementptr inbounds %struct.ImageParameters* %2920, i32 0, i32 155
  %2922 = load i32* %2921, align 4
  %2923 = icmp sgt i32 %2919, %2922
  br i1 %2923, label %2924, label %2928

; <label>:2924                                    ; preds = %2894
  %2925 = load %struct.ImageParameters** @img, align 8
  %2926 = getelementptr inbounds %struct.ImageParameters* %2925, i32 0, i32 155
  %2927 = load i32* %2926, align 4
  br label %2954

; <label>:2928                                    ; preds = %2894
  %2929 = sext i16 %108 to i32
  %2930 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %2931 = sext i16 %2646 to i32
  %2932 = sext i16 %2666 to i32
  %2933 = add nsw i32 %2932, 8
  %2934 = call zeroext i16 %2930(i16** %238, i32 %2931, i32 %2933, i32 %265, i32 %263)
  %2935 = zext i16 %2934 to i32
  %2936 = mul nsw i32 %2929, %2935
  %2937 = sext i16 %144 to i32
  %2938 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %2939 = sext i16 %2652 to i32
  %2940 = sext i16 %2672 to i32
  %2941 = add nsw i32 %2940, 8
  %2942 = call zeroext i16 %2938(i16** %253, i32 %2939, i32 %2941, i32 %265, i32 %263)
  %2943 = zext i16 %2942 to i32
  %2944 = mul nsw i32 %2937, %2943
  %2945 = add nsw i32 %2936, %2944
  %2946 = load i32* @wp_luma_round, align 4
  %2947 = mul nsw i32 2, %2946
  %2948 = add nsw i32 %2945, %2947
  %2949 = load i32* @luma_log_weight_denom, align 4
  %2950 = add nsw i32 %2949, 1
  %2951 = ashr i32 %2948, %2950
  %2952 = sext i16 %212 to i32
  %2953 = add nsw i32 %2951, %2952
  br label %2954

; <label>:2954                                    ; preds = %2928, %2924
  %2955 = phi i32 [ %2927, %2924 ], [ %2953, %2928 ]
  br label %2956

; <label>:2956                                    ; preds = %2954, %2893
  %2957 = phi i32 [ 0, %2893 ], [ %2955, %2954 ]
  %2958 = sext i16 %x0.2 to i32
  %2959 = add nsw i32 %2958, 2
  %2960 = sext i32 %2959 to i64
  %2961 = getelementptr inbounds i16* %2676, i64 %2960
  %2962 = load i16* %2961, align 2
  %2963 = zext i16 %2962 to i32
  %2964 = sub nsw i32 %2963, %2957
  %2965 = getelementptr inbounds i32* %2866, i32 1
  store i32 %2964, i32* %2866, align 4
  %2966 = sext i16 %108 to i32
  %2967 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %2968 = sext i16 %2646 to i32
  %2969 = sext i16 %2666 to i32
  %2970 = add nsw i32 %2969, 12
  %2971 = call zeroext i16 %2967(i16** %238, i32 %2968, i32 %2970, i32 %265, i32 %263)
  %2972 = zext i16 %2971 to i32
  %2973 = mul nsw i32 %2966, %2972
  %2974 = sext i16 %144 to i32
  %2975 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %2976 = sext i16 %2652 to i32
  %2977 = sext i16 %2672 to i32
  %2978 = add nsw i32 %2977, 12
  %2979 = call zeroext i16 %2975(i16** %253, i32 %2976, i32 %2978, i32 %265, i32 %263)
  %2980 = zext i16 %2979 to i32
  %2981 = mul nsw i32 %2974, %2980
  %2982 = add nsw i32 %2973, %2981
  %2983 = load i32* @wp_luma_round, align 4
  %2984 = mul nsw i32 2, %2983
  %2985 = add nsw i32 %2982, %2984
  %2986 = load i32* @luma_log_weight_denom, align 4
  %2987 = add nsw i32 %2986, 1
  %2988 = ashr i32 %2985, %2987
  %2989 = sext i16 %212 to i32
  %2990 = add nsw i32 %2988, %2989
  %2991 = icmp slt i32 %2990, 0
  br i1 %2991, label %2992, label %2993

; <label>:2992                                    ; preds = %2956
  br label %3055

; <label>:2993                                    ; preds = %2956
  %2994 = sext i16 %108 to i32
  %2995 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %2996 = sext i16 %2646 to i32
  %2997 = sext i16 %2666 to i32
  %2998 = add nsw i32 %2997, 12
  %2999 = call zeroext i16 %2995(i16** %238, i32 %2996, i32 %2998, i32 %265, i32 %263)
  %3000 = zext i16 %2999 to i32
  %3001 = mul nsw i32 %2994, %3000
  %3002 = sext i16 %144 to i32
  %3003 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %3004 = sext i16 %2652 to i32
  %3005 = sext i16 %2672 to i32
  %3006 = add nsw i32 %3005, 12
  %3007 = call zeroext i16 %3003(i16** %253, i32 %3004, i32 %3006, i32 %265, i32 %263)
  %3008 = zext i16 %3007 to i32
  %3009 = mul nsw i32 %3002, %3008
  %3010 = add nsw i32 %3001, %3009
  %3011 = load i32* @wp_luma_round, align 4
  %3012 = mul nsw i32 2, %3011
  %3013 = add nsw i32 %3010, %3012
  %3014 = load i32* @luma_log_weight_denom, align 4
  %3015 = add nsw i32 %3014, 1
  %3016 = ashr i32 %3013, %3015
  %3017 = sext i16 %212 to i32
  %3018 = add nsw i32 %3016, %3017
  %3019 = load %struct.ImageParameters** @img, align 8
  %3020 = getelementptr inbounds %struct.ImageParameters* %3019, i32 0, i32 155
  %3021 = load i32* %3020, align 4
  %3022 = icmp sgt i32 %3018, %3021
  br i1 %3022, label %3023, label %3027

; <label>:3023                                    ; preds = %2993
  %3024 = load %struct.ImageParameters** @img, align 8
  %3025 = getelementptr inbounds %struct.ImageParameters* %3024, i32 0, i32 155
  %3026 = load i32* %3025, align 4
  br label %3053

; <label>:3027                                    ; preds = %2993
  %3028 = sext i16 %108 to i32
  %3029 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %3030 = sext i16 %2646 to i32
  %3031 = sext i16 %2666 to i32
  %3032 = add nsw i32 %3031, 12
  %3033 = call zeroext i16 %3029(i16** %238, i32 %3030, i32 %3032, i32 %265, i32 %263)
  %3034 = zext i16 %3033 to i32
  %3035 = mul nsw i32 %3028, %3034
  %3036 = sext i16 %144 to i32
  %3037 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %3038 = sext i16 %2652 to i32
  %3039 = sext i16 %2672 to i32
  %3040 = add nsw i32 %3039, 12
  %3041 = call zeroext i16 %3037(i16** %253, i32 %3038, i32 %3040, i32 %265, i32 %263)
  %3042 = zext i16 %3041 to i32
  %3043 = mul nsw i32 %3036, %3042
  %3044 = add nsw i32 %3035, %3043
  %3045 = load i32* @wp_luma_round, align 4
  %3046 = mul nsw i32 2, %3045
  %3047 = add nsw i32 %3044, %3046
  %3048 = load i32* @luma_log_weight_denom, align 4
  %3049 = add nsw i32 %3048, 1
  %3050 = ashr i32 %3047, %3049
  %3051 = sext i16 %212 to i32
  %3052 = add nsw i32 %3050, %3051
  br label %3053

; <label>:3053                                    ; preds = %3027, %3023
  %3054 = phi i32 [ %3026, %3023 ], [ %3052, %3027 ]
  br label %3055

; <label>:3055                                    ; preds = %3053, %2992
  %3056 = phi i32 [ 0, %2992 ], [ %3054, %3053 ]
  %3057 = sext i16 %x0.2 to i32
  %3058 = add nsw i32 %3057, 3
  %3059 = sext i32 %3058 to i64
  %3060 = getelementptr inbounds i16* %2676, i64 %3059
  %3061 = load i16* %3060, align 2
  %3062 = zext i16 %3061 to i32
  %3063 = sub nsw i32 %3062, %3056
  %3064 = getelementptr inbounds i32* %2965, i32 1
  store i32 %3063, i32* %2965, align 4
  %3065 = sext i16 %2646 to i32
  %3066 = add nsw i32 %3065, 4
  %3067 = trunc i32 %3066 to i16
  %3068 = sext i16 %y0.1 to i32
  %3069 = add nsw i32 %3068, 1
  %3070 = sext i32 %3069 to i64
  %3071 = getelementptr inbounds i16** %orig_pic, i64 %3070
  %3072 = load i16** %3071, align 8
  %3073 = sext i16 %2652 to i32
  %3074 = add nsw i32 %3073, 4
  %3075 = trunc i32 %3074 to i16
  %3076 = sext i16 %108 to i32
  %3077 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %3078 = sext i16 %3067 to i32
  %3079 = sext i16 %2666 to i32
  %3080 = call zeroext i16 %3077(i16** %238, i32 %3078, i32 %3079, i32 %265, i32 %263)
  %3081 = zext i16 %3080 to i32
  %3082 = mul nsw i32 %3076, %3081
  %3083 = sext i16 %144 to i32
  %3084 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %3085 = sext i16 %3075 to i32
  %3086 = sext i16 %2672 to i32
  %3087 = call zeroext i16 %3084(i16** %253, i32 %3085, i32 %3086, i32 %265, i32 %263)
  %3088 = zext i16 %3087 to i32
  %3089 = mul nsw i32 %3083, %3088
  %3090 = add nsw i32 %3082, %3089
  %3091 = load i32* @wp_luma_round, align 4
  %3092 = mul nsw i32 2, %3091
  %3093 = add nsw i32 %3090, %3092
  %3094 = load i32* @luma_log_weight_denom, align 4
  %3095 = add nsw i32 %3094, 1
  %3096 = ashr i32 %3093, %3095
  %3097 = sext i16 %212 to i32
  %3098 = add nsw i32 %3096, %3097
  %3099 = icmp slt i32 %3098, 0
  br i1 %3099, label %3100, label %3101

; <label>:3100                                    ; preds = %3055
  br label %3159

; <label>:3101                                    ; preds = %3055
  %3102 = sext i16 %108 to i32
  %3103 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %3104 = sext i16 %3067 to i32
  %3105 = sext i16 %2666 to i32
  %3106 = call zeroext i16 %3103(i16** %238, i32 %3104, i32 %3105, i32 %265, i32 %263)
  %3107 = zext i16 %3106 to i32
  %3108 = mul nsw i32 %3102, %3107
  %3109 = sext i16 %144 to i32
  %3110 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %3111 = sext i16 %3075 to i32
  %3112 = sext i16 %2672 to i32
  %3113 = call zeroext i16 %3110(i16** %253, i32 %3111, i32 %3112, i32 %265, i32 %263)
  %3114 = zext i16 %3113 to i32
  %3115 = mul nsw i32 %3109, %3114
  %3116 = add nsw i32 %3108, %3115
  %3117 = load i32* @wp_luma_round, align 4
  %3118 = mul nsw i32 2, %3117
  %3119 = add nsw i32 %3116, %3118
  %3120 = load i32* @luma_log_weight_denom, align 4
  %3121 = add nsw i32 %3120, 1
  %3122 = ashr i32 %3119, %3121
  %3123 = sext i16 %212 to i32
  %3124 = add nsw i32 %3122, %3123
  %3125 = load %struct.ImageParameters** @img, align 8
  %3126 = getelementptr inbounds %struct.ImageParameters* %3125, i32 0, i32 155
  %3127 = load i32* %3126, align 4
  %3128 = icmp sgt i32 %3124, %3127
  br i1 %3128, label %3129, label %3133

; <label>:3129                                    ; preds = %3101
  %3130 = load %struct.ImageParameters** @img, align 8
  %3131 = getelementptr inbounds %struct.ImageParameters* %3130, i32 0, i32 155
  %3132 = load i32* %3131, align 4
  br label %3157

; <label>:3133                                    ; preds = %3101
  %3134 = sext i16 %108 to i32
  %3135 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %3136 = sext i16 %3067 to i32
  %3137 = sext i16 %2666 to i32
  %3138 = call zeroext i16 %3135(i16** %238, i32 %3136, i32 %3137, i32 %265, i32 %263)
  %3139 = zext i16 %3138 to i32
  %3140 = mul nsw i32 %3134, %3139
  %3141 = sext i16 %144 to i32
  %3142 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %3143 = sext i16 %3075 to i32
  %3144 = sext i16 %2672 to i32
  %3145 = call zeroext i16 %3142(i16** %253, i32 %3143, i32 %3144, i32 %265, i32 %263)
  %3146 = zext i16 %3145 to i32
  %3147 = mul nsw i32 %3141, %3146
  %3148 = add nsw i32 %3140, %3147
  %3149 = load i32* @wp_luma_round, align 4
  %3150 = mul nsw i32 2, %3149
  %3151 = add nsw i32 %3148, %3150
  %3152 = load i32* @luma_log_weight_denom, align 4
  %3153 = add nsw i32 %3152, 1
  %3154 = ashr i32 %3151, %3153
  %3155 = sext i16 %212 to i32
  %3156 = add nsw i32 %3154, %3155
  br label %3157

; <label>:3157                                    ; preds = %3133, %3129
  %3158 = phi i32 [ %3132, %3129 ], [ %3156, %3133 ]
  br label %3159

; <label>:3159                                    ; preds = %3157, %3100
  %3160 = phi i32 [ 0, %3100 ], [ %3158, %3157 ]
  %3161 = sext i16 %x0.2 to i64
  %3162 = getelementptr inbounds i16* %3072, i64 %3161
  %3163 = load i16* %3162, align 2
  %3164 = zext i16 %3163 to i32
  %3165 = sub nsw i32 %3164, %3160
  %3166 = getelementptr inbounds i32* %3064, i32 1
  store i32 %3165, i32* %3064, align 4
  %3167 = sext i16 %108 to i32
  %3168 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %3169 = sext i16 %3067 to i32
  %3170 = sext i16 %2666 to i32
  %3171 = add nsw i32 %3170, 4
  %3172 = call zeroext i16 %3168(i16** %238, i32 %3169, i32 %3171, i32 %265, i32 %263)
  %3173 = zext i16 %3172 to i32
  %3174 = mul nsw i32 %3167, %3173
  %3175 = sext i16 %144 to i32
  %3176 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %3177 = sext i16 %3075 to i32
  %3178 = sext i16 %2672 to i32
  %3179 = add nsw i32 %3178, 4
  %3180 = call zeroext i16 %3176(i16** %253, i32 %3177, i32 %3179, i32 %265, i32 %263)
  %3181 = zext i16 %3180 to i32
  %3182 = mul nsw i32 %3175, %3181
  %3183 = add nsw i32 %3174, %3182
  %3184 = load i32* @wp_luma_round, align 4
  %3185 = mul nsw i32 2, %3184
  %3186 = add nsw i32 %3183, %3185
  %3187 = load i32* @luma_log_weight_denom, align 4
  %3188 = add nsw i32 %3187, 1
  %3189 = ashr i32 %3186, %3188
  %3190 = sext i16 %212 to i32
  %3191 = add nsw i32 %3189, %3190
  %3192 = icmp slt i32 %3191, 0
  br i1 %3192, label %3193, label %3194

; <label>:3193                                    ; preds = %3159
  br label %3256

; <label>:3194                                    ; preds = %3159
  %3195 = sext i16 %108 to i32
  %3196 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %3197 = sext i16 %3067 to i32
  %3198 = sext i16 %2666 to i32
  %3199 = add nsw i32 %3198, 4
  %3200 = call zeroext i16 %3196(i16** %238, i32 %3197, i32 %3199, i32 %265, i32 %263)
  %3201 = zext i16 %3200 to i32
  %3202 = mul nsw i32 %3195, %3201
  %3203 = sext i16 %144 to i32
  %3204 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %3205 = sext i16 %3075 to i32
  %3206 = sext i16 %2672 to i32
  %3207 = add nsw i32 %3206, 4
  %3208 = call zeroext i16 %3204(i16** %253, i32 %3205, i32 %3207, i32 %265, i32 %263)
  %3209 = zext i16 %3208 to i32
  %3210 = mul nsw i32 %3203, %3209
  %3211 = add nsw i32 %3202, %3210
  %3212 = load i32* @wp_luma_round, align 4
  %3213 = mul nsw i32 2, %3212
  %3214 = add nsw i32 %3211, %3213
  %3215 = load i32* @luma_log_weight_denom, align 4
  %3216 = add nsw i32 %3215, 1
  %3217 = ashr i32 %3214, %3216
  %3218 = sext i16 %212 to i32
  %3219 = add nsw i32 %3217, %3218
  %3220 = load %struct.ImageParameters** @img, align 8
  %3221 = getelementptr inbounds %struct.ImageParameters* %3220, i32 0, i32 155
  %3222 = load i32* %3221, align 4
  %3223 = icmp sgt i32 %3219, %3222
  br i1 %3223, label %3224, label %3228

; <label>:3224                                    ; preds = %3194
  %3225 = load %struct.ImageParameters** @img, align 8
  %3226 = getelementptr inbounds %struct.ImageParameters* %3225, i32 0, i32 155
  %3227 = load i32* %3226, align 4
  br label %3254

; <label>:3228                                    ; preds = %3194
  %3229 = sext i16 %108 to i32
  %3230 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %3231 = sext i16 %3067 to i32
  %3232 = sext i16 %2666 to i32
  %3233 = add nsw i32 %3232, 4
  %3234 = call zeroext i16 %3230(i16** %238, i32 %3231, i32 %3233, i32 %265, i32 %263)
  %3235 = zext i16 %3234 to i32
  %3236 = mul nsw i32 %3229, %3235
  %3237 = sext i16 %144 to i32
  %3238 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %3239 = sext i16 %3075 to i32
  %3240 = sext i16 %2672 to i32
  %3241 = add nsw i32 %3240, 4
  %3242 = call zeroext i16 %3238(i16** %253, i32 %3239, i32 %3241, i32 %265, i32 %263)
  %3243 = zext i16 %3242 to i32
  %3244 = mul nsw i32 %3237, %3243
  %3245 = add nsw i32 %3236, %3244
  %3246 = load i32* @wp_luma_round, align 4
  %3247 = mul nsw i32 2, %3246
  %3248 = add nsw i32 %3245, %3247
  %3249 = load i32* @luma_log_weight_denom, align 4
  %3250 = add nsw i32 %3249, 1
  %3251 = ashr i32 %3248, %3250
  %3252 = sext i16 %212 to i32
  %3253 = add nsw i32 %3251, %3252
  br label %3254

; <label>:3254                                    ; preds = %3228, %3224
  %3255 = phi i32 [ %3227, %3224 ], [ %3253, %3228 ]
  br label %3256

; <label>:3256                                    ; preds = %3254, %3193
  %3257 = phi i32 [ 0, %3193 ], [ %3255, %3254 ]
  %3258 = sext i16 %x0.2 to i32
  %3259 = add nsw i32 %3258, 1
  %3260 = sext i32 %3259 to i64
  %3261 = getelementptr inbounds i16* %3072, i64 %3260
  %3262 = load i16* %3261, align 2
  %3263 = zext i16 %3262 to i32
  %3264 = sub nsw i32 %3263, %3257
  %3265 = getelementptr inbounds i32* %3166, i32 1
  store i32 %3264, i32* %3166, align 4
  %3266 = sext i16 %108 to i32
  %3267 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %3268 = sext i16 %3067 to i32
  %3269 = sext i16 %2666 to i32
  %3270 = add nsw i32 %3269, 8
  %3271 = call zeroext i16 %3267(i16** %238, i32 %3268, i32 %3270, i32 %265, i32 %263)
  %3272 = zext i16 %3271 to i32
  %3273 = mul nsw i32 %3266, %3272
  %3274 = sext i16 %144 to i32
  %3275 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %3276 = sext i16 %3075 to i32
  %3277 = sext i16 %2672 to i32
  %3278 = add nsw i32 %3277, 8
  %3279 = call zeroext i16 %3275(i16** %253, i32 %3276, i32 %3278, i32 %265, i32 %263)
  %3280 = zext i16 %3279 to i32
  %3281 = mul nsw i32 %3274, %3280
  %3282 = add nsw i32 %3273, %3281
  %3283 = load i32* @wp_luma_round, align 4
  %3284 = mul nsw i32 2, %3283
  %3285 = add nsw i32 %3282, %3284
  %3286 = load i32* @luma_log_weight_denom, align 4
  %3287 = add nsw i32 %3286, 1
  %3288 = ashr i32 %3285, %3287
  %3289 = sext i16 %212 to i32
  %3290 = add nsw i32 %3288, %3289
  %3291 = icmp slt i32 %3290, 0
  br i1 %3291, label %3292, label %3293

; <label>:3292                                    ; preds = %3256
  br label %3355

; <label>:3293                                    ; preds = %3256
  %3294 = sext i16 %108 to i32
  %3295 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %3296 = sext i16 %3067 to i32
  %3297 = sext i16 %2666 to i32
  %3298 = add nsw i32 %3297, 8
  %3299 = call zeroext i16 %3295(i16** %238, i32 %3296, i32 %3298, i32 %265, i32 %263)
  %3300 = zext i16 %3299 to i32
  %3301 = mul nsw i32 %3294, %3300
  %3302 = sext i16 %144 to i32
  %3303 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %3304 = sext i16 %3075 to i32
  %3305 = sext i16 %2672 to i32
  %3306 = add nsw i32 %3305, 8
  %3307 = call zeroext i16 %3303(i16** %253, i32 %3304, i32 %3306, i32 %265, i32 %263)
  %3308 = zext i16 %3307 to i32
  %3309 = mul nsw i32 %3302, %3308
  %3310 = add nsw i32 %3301, %3309
  %3311 = load i32* @wp_luma_round, align 4
  %3312 = mul nsw i32 2, %3311
  %3313 = add nsw i32 %3310, %3312
  %3314 = load i32* @luma_log_weight_denom, align 4
  %3315 = add nsw i32 %3314, 1
  %3316 = ashr i32 %3313, %3315
  %3317 = sext i16 %212 to i32
  %3318 = add nsw i32 %3316, %3317
  %3319 = load %struct.ImageParameters** @img, align 8
  %3320 = getelementptr inbounds %struct.ImageParameters* %3319, i32 0, i32 155
  %3321 = load i32* %3320, align 4
  %3322 = icmp sgt i32 %3318, %3321
  br i1 %3322, label %3323, label %3327

; <label>:3323                                    ; preds = %3293
  %3324 = load %struct.ImageParameters** @img, align 8
  %3325 = getelementptr inbounds %struct.ImageParameters* %3324, i32 0, i32 155
  %3326 = load i32* %3325, align 4
  br label %3353

; <label>:3327                                    ; preds = %3293
  %3328 = sext i16 %108 to i32
  %3329 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %3330 = sext i16 %3067 to i32
  %3331 = sext i16 %2666 to i32
  %3332 = add nsw i32 %3331, 8
  %3333 = call zeroext i16 %3329(i16** %238, i32 %3330, i32 %3332, i32 %265, i32 %263)
  %3334 = zext i16 %3333 to i32
  %3335 = mul nsw i32 %3328, %3334
  %3336 = sext i16 %144 to i32
  %3337 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %3338 = sext i16 %3075 to i32
  %3339 = sext i16 %2672 to i32
  %3340 = add nsw i32 %3339, 8
  %3341 = call zeroext i16 %3337(i16** %253, i32 %3338, i32 %3340, i32 %265, i32 %263)
  %3342 = zext i16 %3341 to i32
  %3343 = mul nsw i32 %3336, %3342
  %3344 = add nsw i32 %3335, %3343
  %3345 = load i32* @wp_luma_round, align 4
  %3346 = mul nsw i32 2, %3345
  %3347 = add nsw i32 %3344, %3346
  %3348 = load i32* @luma_log_weight_denom, align 4
  %3349 = add nsw i32 %3348, 1
  %3350 = ashr i32 %3347, %3349
  %3351 = sext i16 %212 to i32
  %3352 = add nsw i32 %3350, %3351
  br label %3353

; <label>:3353                                    ; preds = %3327, %3323
  %3354 = phi i32 [ %3326, %3323 ], [ %3352, %3327 ]
  br label %3355

; <label>:3355                                    ; preds = %3353, %3292
  %3356 = phi i32 [ 0, %3292 ], [ %3354, %3353 ]
  %3357 = sext i16 %x0.2 to i32
  %3358 = add nsw i32 %3357, 2
  %3359 = sext i32 %3358 to i64
  %3360 = getelementptr inbounds i16* %3072, i64 %3359
  %3361 = load i16* %3360, align 2
  %3362 = zext i16 %3361 to i32
  %3363 = sub nsw i32 %3362, %3356
  %3364 = getelementptr inbounds i32* %3265, i32 1
  store i32 %3363, i32* %3265, align 4
  %3365 = sext i16 %108 to i32
  %3366 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %3367 = sext i16 %3067 to i32
  %3368 = sext i16 %2666 to i32
  %3369 = add nsw i32 %3368, 12
  %3370 = call zeroext i16 %3366(i16** %238, i32 %3367, i32 %3369, i32 %265, i32 %263)
  %3371 = zext i16 %3370 to i32
  %3372 = mul nsw i32 %3365, %3371
  %3373 = sext i16 %144 to i32
  %3374 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %3375 = sext i16 %3075 to i32
  %3376 = sext i16 %2672 to i32
  %3377 = add nsw i32 %3376, 12
  %3378 = call zeroext i16 %3374(i16** %253, i32 %3375, i32 %3377, i32 %265, i32 %263)
  %3379 = zext i16 %3378 to i32
  %3380 = mul nsw i32 %3373, %3379
  %3381 = add nsw i32 %3372, %3380
  %3382 = load i32* @wp_luma_round, align 4
  %3383 = mul nsw i32 2, %3382
  %3384 = add nsw i32 %3381, %3383
  %3385 = load i32* @luma_log_weight_denom, align 4
  %3386 = add nsw i32 %3385, 1
  %3387 = ashr i32 %3384, %3386
  %3388 = sext i16 %212 to i32
  %3389 = add nsw i32 %3387, %3388
  %3390 = icmp slt i32 %3389, 0
  br i1 %3390, label %3391, label %3392

; <label>:3391                                    ; preds = %3355
  br label %3454

; <label>:3392                                    ; preds = %3355
  %3393 = sext i16 %108 to i32
  %3394 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %3395 = sext i16 %3067 to i32
  %3396 = sext i16 %2666 to i32
  %3397 = add nsw i32 %3396, 12
  %3398 = call zeroext i16 %3394(i16** %238, i32 %3395, i32 %3397, i32 %265, i32 %263)
  %3399 = zext i16 %3398 to i32
  %3400 = mul nsw i32 %3393, %3399
  %3401 = sext i16 %144 to i32
  %3402 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %3403 = sext i16 %3075 to i32
  %3404 = sext i16 %2672 to i32
  %3405 = add nsw i32 %3404, 12
  %3406 = call zeroext i16 %3402(i16** %253, i32 %3403, i32 %3405, i32 %265, i32 %263)
  %3407 = zext i16 %3406 to i32
  %3408 = mul nsw i32 %3401, %3407
  %3409 = add nsw i32 %3400, %3408
  %3410 = load i32* @wp_luma_round, align 4
  %3411 = mul nsw i32 2, %3410
  %3412 = add nsw i32 %3409, %3411
  %3413 = load i32* @luma_log_weight_denom, align 4
  %3414 = add nsw i32 %3413, 1
  %3415 = ashr i32 %3412, %3414
  %3416 = sext i16 %212 to i32
  %3417 = add nsw i32 %3415, %3416
  %3418 = load %struct.ImageParameters** @img, align 8
  %3419 = getelementptr inbounds %struct.ImageParameters* %3418, i32 0, i32 155
  %3420 = load i32* %3419, align 4
  %3421 = icmp sgt i32 %3417, %3420
  br i1 %3421, label %3422, label %3426

; <label>:3422                                    ; preds = %3392
  %3423 = load %struct.ImageParameters** @img, align 8
  %3424 = getelementptr inbounds %struct.ImageParameters* %3423, i32 0, i32 155
  %3425 = load i32* %3424, align 4
  br label %3452

; <label>:3426                                    ; preds = %3392
  %3427 = sext i16 %108 to i32
  %3428 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %3429 = sext i16 %3067 to i32
  %3430 = sext i16 %2666 to i32
  %3431 = add nsw i32 %3430, 12
  %3432 = call zeroext i16 %3428(i16** %238, i32 %3429, i32 %3431, i32 %265, i32 %263)
  %3433 = zext i16 %3432 to i32
  %3434 = mul nsw i32 %3427, %3433
  %3435 = sext i16 %144 to i32
  %3436 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %3437 = sext i16 %3075 to i32
  %3438 = sext i16 %2672 to i32
  %3439 = add nsw i32 %3438, 12
  %3440 = call zeroext i16 %3436(i16** %253, i32 %3437, i32 %3439, i32 %265, i32 %263)
  %3441 = zext i16 %3440 to i32
  %3442 = mul nsw i32 %3435, %3441
  %3443 = add nsw i32 %3434, %3442
  %3444 = load i32* @wp_luma_round, align 4
  %3445 = mul nsw i32 2, %3444
  %3446 = add nsw i32 %3443, %3445
  %3447 = load i32* @luma_log_weight_denom, align 4
  %3448 = add nsw i32 %3447, 1
  %3449 = ashr i32 %3446, %3448
  %3450 = sext i16 %212 to i32
  %3451 = add nsw i32 %3449, %3450
  br label %3452

; <label>:3452                                    ; preds = %3426, %3422
  %3453 = phi i32 [ %3425, %3422 ], [ %3451, %3426 ]
  br label %3454

; <label>:3454                                    ; preds = %3452, %3391
  %3455 = phi i32 [ 0, %3391 ], [ %3453, %3452 ]
  %3456 = sext i16 %x0.2 to i32
  %3457 = add nsw i32 %3456, 3
  %3458 = sext i32 %3457 to i64
  %3459 = getelementptr inbounds i16* %3072, i64 %3458
  %3460 = load i16* %3459, align 2
  %3461 = zext i16 %3460 to i32
  %3462 = sub nsw i32 %3461, %3455
  %3463 = getelementptr inbounds i32* %3364, i32 1
  store i32 %3462, i32* %3364, align 4
  %3464 = sext i16 %2646 to i32
  %3465 = add nsw i32 %3464, 8
  %3466 = trunc i32 %3465 to i16
  %3467 = sext i16 %y0.1 to i32
  %3468 = add nsw i32 %3467, 2
  %3469 = sext i32 %3468 to i64
  %3470 = getelementptr inbounds i16** %orig_pic, i64 %3469
  %3471 = load i16** %3470, align 8
  %3472 = sext i16 %2652 to i32
  %3473 = add nsw i32 %3472, 8
  %3474 = trunc i32 %3473 to i16
  %3475 = sext i16 %108 to i32
  %3476 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %3477 = sext i16 %3466 to i32
  %3478 = sext i16 %2666 to i32
  %3479 = call zeroext i16 %3476(i16** %238, i32 %3477, i32 %3478, i32 %265, i32 %263)
  %3480 = zext i16 %3479 to i32
  %3481 = mul nsw i32 %3475, %3480
  %3482 = sext i16 %144 to i32
  %3483 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %3484 = sext i16 %3474 to i32
  %3485 = sext i16 %2672 to i32
  %3486 = call zeroext i16 %3483(i16** %253, i32 %3484, i32 %3485, i32 %265, i32 %263)
  %3487 = zext i16 %3486 to i32
  %3488 = mul nsw i32 %3482, %3487
  %3489 = add nsw i32 %3481, %3488
  %3490 = load i32* @wp_luma_round, align 4
  %3491 = mul nsw i32 2, %3490
  %3492 = add nsw i32 %3489, %3491
  %3493 = load i32* @luma_log_weight_denom, align 4
  %3494 = add nsw i32 %3493, 1
  %3495 = ashr i32 %3492, %3494
  %3496 = sext i16 %212 to i32
  %3497 = add nsw i32 %3495, %3496
  %3498 = icmp slt i32 %3497, 0
  br i1 %3498, label %3499, label %3500

; <label>:3499                                    ; preds = %3454
  br label %3558

; <label>:3500                                    ; preds = %3454
  %3501 = sext i16 %108 to i32
  %3502 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %3503 = sext i16 %3466 to i32
  %3504 = sext i16 %2666 to i32
  %3505 = call zeroext i16 %3502(i16** %238, i32 %3503, i32 %3504, i32 %265, i32 %263)
  %3506 = zext i16 %3505 to i32
  %3507 = mul nsw i32 %3501, %3506
  %3508 = sext i16 %144 to i32
  %3509 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %3510 = sext i16 %3474 to i32
  %3511 = sext i16 %2672 to i32
  %3512 = call zeroext i16 %3509(i16** %253, i32 %3510, i32 %3511, i32 %265, i32 %263)
  %3513 = zext i16 %3512 to i32
  %3514 = mul nsw i32 %3508, %3513
  %3515 = add nsw i32 %3507, %3514
  %3516 = load i32* @wp_luma_round, align 4
  %3517 = mul nsw i32 2, %3516
  %3518 = add nsw i32 %3515, %3517
  %3519 = load i32* @luma_log_weight_denom, align 4
  %3520 = add nsw i32 %3519, 1
  %3521 = ashr i32 %3518, %3520
  %3522 = sext i16 %212 to i32
  %3523 = add nsw i32 %3521, %3522
  %3524 = load %struct.ImageParameters** @img, align 8
  %3525 = getelementptr inbounds %struct.ImageParameters* %3524, i32 0, i32 155
  %3526 = load i32* %3525, align 4
  %3527 = icmp sgt i32 %3523, %3526
  br i1 %3527, label %3528, label %3532

; <label>:3528                                    ; preds = %3500
  %3529 = load %struct.ImageParameters** @img, align 8
  %3530 = getelementptr inbounds %struct.ImageParameters* %3529, i32 0, i32 155
  %3531 = load i32* %3530, align 4
  br label %3556

; <label>:3532                                    ; preds = %3500
  %3533 = sext i16 %108 to i32
  %3534 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %3535 = sext i16 %3466 to i32
  %3536 = sext i16 %2666 to i32
  %3537 = call zeroext i16 %3534(i16** %238, i32 %3535, i32 %3536, i32 %265, i32 %263)
  %3538 = zext i16 %3537 to i32
  %3539 = mul nsw i32 %3533, %3538
  %3540 = sext i16 %144 to i32
  %3541 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %3542 = sext i16 %3474 to i32
  %3543 = sext i16 %2672 to i32
  %3544 = call zeroext i16 %3541(i16** %253, i32 %3542, i32 %3543, i32 %265, i32 %263)
  %3545 = zext i16 %3544 to i32
  %3546 = mul nsw i32 %3540, %3545
  %3547 = add nsw i32 %3539, %3546
  %3548 = load i32* @wp_luma_round, align 4
  %3549 = mul nsw i32 2, %3548
  %3550 = add nsw i32 %3547, %3549
  %3551 = load i32* @luma_log_weight_denom, align 4
  %3552 = add nsw i32 %3551, 1
  %3553 = ashr i32 %3550, %3552
  %3554 = sext i16 %212 to i32
  %3555 = add nsw i32 %3553, %3554
  br label %3556

; <label>:3556                                    ; preds = %3532, %3528
  %3557 = phi i32 [ %3531, %3528 ], [ %3555, %3532 ]
  br label %3558

; <label>:3558                                    ; preds = %3556, %3499
  %3559 = phi i32 [ 0, %3499 ], [ %3557, %3556 ]
  %3560 = sext i16 %x0.2 to i64
  %3561 = getelementptr inbounds i16* %3471, i64 %3560
  %3562 = load i16* %3561, align 2
  %3563 = zext i16 %3562 to i32
  %3564 = sub nsw i32 %3563, %3559
  %3565 = getelementptr inbounds i32* %3463, i32 1
  store i32 %3564, i32* %3463, align 4
  %3566 = sext i16 %108 to i32
  %3567 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %3568 = sext i16 %3466 to i32
  %3569 = sext i16 %2666 to i32
  %3570 = add nsw i32 %3569, 4
  %3571 = call zeroext i16 %3567(i16** %238, i32 %3568, i32 %3570, i32 %265, i32 %263)
  %3572 = zext i16 %3571 to i32
  %3573 = mul nsw i32 %3566, %3572
  %3574 = sext i16 %144 to i32
  %3575 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %3576 = sext i16 %3474 to i32
  %3577 = sext i16 %2672 to i32
  %3578 = add nsw i32 %3577, 4
  %3579 = call zeroext i16 %3575(i16** %253, i32 %3576, i32 %3578, i32 %265, i32 %263)
  %3580 = zext i16 %3579 to i32
  %3581 = mul nsw i32 %3574, %3580
  %3582 = add nsw i32 %3573, %3581
  %3583 = load i32* @wp_luma_round, align 4
  %3584 = mul nsw i32 2, %3583
  %3585 = add nsw i32 %3582, %3584
  %3586 = load i32* @luma_log_weight_denom, align 4
  %3587 = add nsw i32 %3586, 1
  %3588 = ashr i32 %3585, %3587
  %3589 = sext i16 %212 to i32
  %3590 = add nsw i32 %3588, %3589
  %3591 = icmp slt i32 %3590, 0
  br i1 %3591, label %3592, label %3593

; <label>:3592                                    ; preds = %3558
  br label %3655

; <label>:3593                                    ; preds = %3558
  %3594 = sext i16 %108 to i32
  %3595 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %3596 = sext i16 %3466 to i32
  %3597 = sext i16 %2666 to i32
  %3598 = add nsw i32 %3597, 4
  %3599 = call zeroext i16 %3595(i16** %238, i32 %3596, i32 %3598, i32 %265, i32 %263)
  %3600 = zext i16 %3599 to i32
  %3601 = mul nsw i32 %3594, %3600
  %3602 = sext i16 %144 to i32
  %3603 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %3604 = sext i16 %3474 to i32
  %3605 = sext i16 %2672 to i32
  %3606 = add nsw i32 %3605, 4
  %3607 = call zeroext i16 %3603(i16** %253, i32 %3604, i32 %3606, i32 %265, i32 %263)
  %3608 = zext i16 %3607 to i32
  %3609 = mul nsw i32 %3602, %3608
  %3610 = add nsw i32 %3601, %3609
  %3611 = load i32* @wp_luma_round, align 4
  %3612 = mul nsw i32 2, %3611
  %3613 = add nsw i32 %3610, %3612
  %3614 = load i32* @luma_log_weight_denom, align 4
  %3615 = add nsw i32 %3614, 1
  %3616 = ashr i32 %3613, %3615
  %3617 = sext i16 %212 to i32
  %3618 = add nsw i32 %3616, %3617
  %3619 = load %struct.ImageParameters** @img, align 8
  %3620 = getelementptr inbounds %struct.ImageParameters* %3619, i32 0, i32 155
  %3621 = load i32* %3620, align 4
  %3622 = icmp sgt i32 %3618, %3621
  br i1 %3622, label %3623, label %3627

; <label>:3623                                    ; preds = %3593
  %3624 = load %struct.ImageParameters** @img, align 8
  %3625 = getelementptr inbounds %struct.ImageParameters* %3624, i32 0, i32 155
  %3626 = load i32* %3625, align 4
  br label %3653

; <label>:3627                                    ; preds = %3593
  %3628 = sext i16 %108 to i32
  %3629 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %3630 = sext i16 %3466 to i32
  %3631 = sext i16 %2666 to i32
  %3632 = add nsw i32 %3631, 4
  %3633 = call zeroext i16 %3629(i16** %238, i32 %3630, i32 %3632, i32 %265, i32 %263)
  %3634 = zext i16 %3633 to i32
  %3635 = mul nsw i32 %3628, %3634
  %3636 = sext i16 %144 to i32
  %3637 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %3638 = sext i16 %3474 to i32
  %3639 = sext i16 %2672 to i32
  %3640 = add nsw i32 %3639, 4
  %3641 = call zeroext i16 %3637(i16** %253, i32 %3638, i32 %3640, i32 %265, i32 %263)
  %3642 = zext i16 %3641 to i32
  %3643 = mul nsw i32 %3636, %3642
  %3644 = add nsw i32 %3635, %3643
  %3645 = load i32* @wp_luma_round, align 4
  %3646 = mul nsw i32 2, %3645
  %3647 = add nsw i32 %3644, %3646
  %3648 = load i32* @luma_log_weight_denom, align 4
  %3649 = add nsw i32 %3648, 1
  %3650 = ashr i32 %3647, %3649
  %3651 = sext i16 %212 to i32
  %3652 = add nsw i32 %3650, %3651
  br label %3653

; <label>:3653                                    ; preds = %3627, %3623
  %3654 = phi i32 [ %3626, %3623 ], [ %3652, %3627 ]
  br label %3655

; <label>:3655                                    ; preds = %3653, %3592
  %3656 = phi i32 [ 0, %3592 ], [ %3654, %3653 ]
  %3657 = sext i16 %x0.2 to i32
  %3658 = add nsw i32 %3657, 1
  %3659 = sext i32 %3658 to i64
  %3660 = getelementptr inbounds i16* %3471, i64 %3659
  %3661 = load i16* %3660, align 2
  %3662 = zext i16 %3661 to i32
  %3663 = sub nsw i32 %3662, %3656
  %3664 = getelementptr inbounds i32* %3565, i32 1
  store i32 %3663, i32* %3565, align 4
  %3665 = sext i16 %108 to i32
  %3666 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %3667 = sext i16 %3466 to i32
  %3668 = sext i16 %2666 to i32
  %3669 = add nsw i32 %3668, 8
  %3670 = call zeroext i16 %3666(i16** %238, i32 %3667, i32 %3669, i32 %265, i32 %263)
  %3671 = zext i16 %3670 to i32
  %3672 = mul nsw i32 %3665, %3671
  %3673 = sext i16 %144 to i32
  %3674 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %3675 = sext i16 %3474 to i32
  %3676 = sext i16 %2672 to i32
  %3677 = add nsw i32 %3676, 8
  %3678 = call zeroext i16 %3674(i16** %253, i32 %3675, i32 %3677, i32 %265, i32 %263)
  %3679 = zext i16 %3678 to i32
  %3680 = mul nsw i32 %3673, %3679
  %3681 = add nsw i32 %3672, %3680
  %3682 = load i32* @wp_luma_round, align 4
  %3683 = mul nsw i32 2, %3682
  %3684 = add nsw i32 %3681, %3683
  %3685 = load i32* @luma_log_weight_denom, align 4
  %3686 = add nsw i32 %3685, 1
  %3687 = ashr i32 %3684, %3686
  %3688 = sext i16 %212 to i32
  %3689 = add nsw i32 %3687, %3688
  %3690 = icmp slt i32 %3689, 0
  br i1 %3690, label %3691, label %3692

; <label>:3691                                    ; preds = %3655
  br label %3754

; <label>:3692                                    ; preds = %3655
  %3693 = sext i16 %108 to i32
  %3694 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %3695 = sext i16 %3466 to i32
  %3696 = sext i16 %2666 to i32
  %3697 = add nsw i32 %3696, 8
  %3698 = call zeroext i16 %3694(i16** %238, i32 %3695, i32 %3697, i32 %265, i32 %263)
  %3699 = zext i16 %3698 to i32
  %3700 = mul nsw i32 %3693, %3699
  %3701 = sext i16 %144 to i32
  %3702 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %3703 = sext i16 %3474 to i32
  %3704 = sext i16 %2672 to i32
  %3705 = add nsw i32 %3704, 8
  %3706 = call zeroext i16 %3702(i16** %253, i32 %3703, i32 %3705, i32 %265, i32 %263)
  %3707 = zext i16 %3706 to i32
  %3708 = mul nsw i32 %3701, %3707
  %3709 = add nsw i32 %3700, %3708
  %3710 = load i32* @wp_luma_round, align 4
  %3711 = mul nsw i32 2, %3710
  %3712 = add nsw i32 %3709, %3711
  %3713 = load i32* @luma_log_weight_denom, align 4
  %3714 = add nsw i32 %3713, 1
  %3715 = ashr i32 %3712, %3714
  %3716 = sext i16 %212 to i32
  %3717 = add nsw i32 %3715, %3716
  %3718 = load %struct.ImageParameters** @img, align 8
  %3719 = getelementptr inbounds %struct.ImageParameters* %3718, i32 0, i32 155
  %3720 = load i32* %3719, align 4
  %3721 = icmp sgt i32 %3717, %3720
  br i1 %3721, label %3722, label %3726

; <label>:3722                                    ; preds = %3692
  %3723 = load %struct.ImageParameters** @img, align 8
  %3724 = getelementptr inbounds %struct.ImageParameters* %3723, i32 0, i32 155
  %3725 = load i32* %3724, align 4
  br label %3752

; <label>:3726                                    ; preds = %3692
  %3727 = sext i16 %108 to i32
  %3728 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %3729 = sext i16 %3466 to i32
  %3730 = sext i16 %2666 to i32
  %3731 = add nsw i32 %3730, 8
  %3732 = call zeroext i16 %3728(i16** %238, i32 %3729, i32 %3731, i32 %265, i32 %263)
  %3733 = zext i16 %3732 to i32
  %3734 = mul nsw i32 %3727, %3733
  %3735 = sext i16 %144 to i32
  %3736 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %3737 = sext i16 %3474 to i32
  %3738 = sext i16 %2672 to i32
  %3739 = add nsw i32 %3738, 8
  %3740 = call zeroext i16 %3736(i16** %253, i32 %3737, i32 %3739, i32 %265, i32 %263)
  %3741 = zext i16 %3740 to i32
  %3742 = mul nsw i32 %3735, %3741
  %3743 = add nsw i32 %3734, %3742
  %3744 = load i32* @wp_luma_round, align 4
  %3745 = mul nsw i32 2, %3744
  %3746 = add nsw i32 %3743, %3745
  %3747 = load i32* @luma_log_weight_denom, align 4
  %3748 = add nsw i32 %3747, 1
  %3749 = ashr i32 %3746, %3748
  %3750 = sext i16 %212 to i32
  %3751 = add nsw i32 %3749, %3750
  br label %3752

; <label>:3752                                    ; preds = %3726, %3722
  %3753 = phi i32 [ %3725, %3722 ], [ %3751, %3726 ]
  br label %3754

; <label>:3754                                    ; preds = %3752, %3691
  %3755 = phi i32 [ 0, %3691 ], [ %3753, %3752 ]
  %3756 = sext i16 %x0.2 to i32
  %3757 = add nsw i32 %3756, 2
  %3758 = sext i32 %3757 to i64
  %3759 = getelementptr inbounds i16* %3471, i64 %3758
  %3760 = load i16* %3759, align 2
  %3761 = zext i16 %3760 to i32
  %3762 = sub nsw i32 %3761, %3755
  %3763 = getelementptr inbounds i32* %3664, i32 1
  store i32 %3762, i32* %3664, align 4
  %3764 = sext i16 %108 to i32
  %3765 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %3766 = sext i16 %3466 to i32
  %3767 = sext i16 %2666 to i32
  %3768 = add nsw i32 %3767, 12
  %3769 = call zeroext i16 %3765(i16** %238, i32 %3766, i32 %3768, i32 %265, i32 %263)
  %3770 = zext i16 %3769 to i32
  %3771 = mul nsw i32 %3764, %3770
  %3772 = sext i16 %144 to i32
  %3773 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %3774 = sext i16 %3474 to i32
  %3775 = sext i16 %2672 to i32
  %3776 = add nsw i32 %3775, 12
  %3777 = call zeroext i16 %3773(i16** %253, i32 %3774, i32 %3776, i32 %265, i32 %263)
  %3778 = zext i16 %3777 to i32
  %3779 = mul nsw i32 %3772, %3778
  %3780 = add nsw i32 %3771, %3779
  %3781 = load i32* @wp_luma_round, align 4
  %3782 = mul nsw i32 2, %3781
  %3783 = add nsw i32 %3780, %3782
  %3784 = load i32* @luma_log_weight_denom, align 4
  %3785 = add nsw i32 %3784, 1
  %3786 = ashr i32 %3783, %3785
  %3787 = sext i16 %212 to i32
  %3788 = add nsw i32 %3786, %3787
  %3789 = icmp slt i32 %3788, 0
  br i1 %3789, label %3790, label %3791

; <label>:3790                                    ; preds = %3754
  br label %3853

; <label>:3791                                    ; preds = %3754
  %3792 = sext i16 %108 to i32
  %3793 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %3794 = sext i16 %3466 to i32
  %3795 = sext i16 %2666 to i32
  %3796 = add nsw i32 %3795, 12
  %3797 = call zeroext i16 %3793(i16** %238, i32 %3794, i32 %3796, i32 %265, i32 %263)
  %3798 = zext i16 %3797 to i32
  %3799 = mul nsw i32 %3792, %3798
  %3800 = sext i16 %144 to i32
  %3801 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %3802 = sext i16 %3474 to i32
  %3803 = sext i16 %2672 to i32
  %3804 = add nsw i32 %3803, 12
  %3805 = call zeroext i16 %3801(i16** %253, i32 %3802, i32 %3804, i32 %265, i32 %263)
  %3806 = zext i16 %3805 to i32
  %3807 = mul nsw i32 %3800, %3806
  %3808 = add nsw i32 %3799, %3807
  %3809 = load i32* @wp_luma_round, align 4
  %3810 = mul nsw i32 2, %3809
  %3811 = add nsw i32 %3808, %3810
  %3812 = load i32* @luma_log_weight_denom, align 4
  %3813 = add nsw i32 %3812, 1
  %3814 = ashr i32 %3811, %3813
  %3815 = sext i16 %212 to i32
  %3816 = add nsw i32 %3814, %3815
  %3817 = load %struct.ImageParameters** @img, align 8
  %3818 = getelementptr inbounds %struct.ImageParameters* %3817, i32 0, i32 155
  %3819 = load i32* %3818, align 4
  %3820 = icmp sgt i32 %3816, %3819
  br i1 %3820, label %3821, label %3825

; <label>:3821                                    ; preds = %3791
  %3822 = load %struct.ImageParameters** @img, align 8
  %3823 = getelementptr inbounds %struct.ImageParameters* %3822, i32 0, i32 155
  %3824 = load i32* %3823, align 4
  br label %3851

; <label>:3825                                    ; preds = %3791
  %3826 = sext i16 %108 to i32
  %3827 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %3828 = sext i16 %3466 to i32
  %3829 = sext i16 %2666 to i32
  %3830 = add nsw i32 %3829, 12
  %3831 = call zeroext i16 %3827(i16** %238, i32 %3828, i32 %3830, i32 %265, i32 %263)
  %3832 = zext i16 %3831 to i32
  %3833 = mul nsw i32 %3826, %3832
  %3834 = sext i16 %144 to i32
  %3835 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %3836 = sext i16 %3474 to i32
  %3837 = sext i16 %2672 to i32
  %3838 = add nsw i32 %3837, 12
  %3839 = call zeroext i16 %3835(i16** %253, i32 %3836, i32 %3838, i32 %265, i32 %263)
  %3840 = zext i16 %3839 to i32
  %3841 = mul nsw i32 %3834, %3840
  %3842 = add nsw i32 %3833, %3841
  %3843 = load i32* @wp_luma_round, align 4
  %3844 = mul nsw i32 2, %3843
  %3845 = add nsw i32 %3842, %3844
  %3846 = load i32* @luma_log_weight_denom, align 4
  %3847 = add nsw i32 %3846, 1
  %3848 = ashr i32 %3845, %3847
  %3849 = sext i16 %212 to i32
  %3850 = add nsw i32 %3848, %3849
  br label %3851

; <label>:3851                                    ; preds = %3825, %3821
  %3852 = phi i32 [ %3824, %3821 ], [ %3850, %3825 ]
  br label %3853

; <label>:3853                                    ; preds = %3851, %3790
  %3854 = phi i32 [ 0, %3790 ], [ %3852, %3851 ]
  %3855 = sext i16 %x0.2 to i32
  %3856 = add nsw i32 %3855, 3
  %3857 = sext i32 %3856 to i64
  %3858 = getelementptr inbounds i16* %3471, i64 %3857
  %3859 = load i16* %3858, align 2
  %3860 = zext i16 %3859 to i32
  %3861 = sub nsw i32 %3860, %3854
  %3862 = getelementptr inbounds i32* %3763, i32 1
  store i32 %3861, i32* %3763, align 4
  %3863 = sext i16 %2646 to i32
  %3864 = add nsw i32 %3863, 12
  %3865 = trunc i32 %3864 to i16
  %3866 = sext i16 %y0.1 to i32
  %3867 = add nsw i32 %3866, 3
  %3868 = sext i32 %3867 to i64
  %3869 = getelementptr inbounds i16** %orig_pic, i64 %3868
  %3870 = load i16** %3869, align 8
  %3871 = sext i16 %2652 to i32
  %3872 = add nsw i32 %3871, 12
  %3873 = trunc i32 %3872 to i16
  %3874 = sext i16 %108 to i32
  %3875 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %3876 = sext i16 %3865 to i32
  %3877 = sext i16 %2666 to i32
  %3878 = call zeroext i16 %3875(i16** %238, i32 %3876, i32 %3877, i32 %265, i32 %263)
  %3879 = zext i16 %3878 to i32
  %3880 = mul nsw i32 %3874, %3879
  %3881 = sext i16 %144 to i32
  %3882 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %3883 = sext i16 %3873 to i32
  %3884 = sext i16 %2672 to i32
  %3885 = call zeroext i16 %3882(i16** %253, i32 %3883, i32 %3884, i32 %265, i32 %263)
  %3886 = zext i16 %3885 to i32
  %3887 = mul nsw i32 %3881, %3886
  %3888 = add nsw i32 %3880, %3887
  %3889 = load i32* @wp_luma_round, align 4
  %3890 = mul nsw i32 2, %3889
  %3891 = add nsw i32 %3888, %3890
  %3892 = load i32* @luma_log_weight_denom, align 4
  %3893 = add nsw i32 %3892, 1
  %3894 = ashr i32 %3891, %3893
  %3895 = sext i16 %212 to i32
  %3896 = add nsw i32 %3894, %3895
  %3897 = icmp slt i32 %3896, 0
  br i1 %3897, label %3898, label %3899

; <label>:3898                                    ; preds = %3853
  br label %3957

; <label>:3899                                    ; preds = %3853
  %3900 = sext i16 %108 to i32
  %3901 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %3902 = sext i16 %3865 to i32
  %3903 = sext i16 %2666 to i32
  %3904 = call zeroext i16 %3901(i16** %238, i32 %3902, i32 %3903, i32 %265, i32 %263)
  %3905 = zext i16 %3904 to i32
  %3906 = mul nsw i32 %3900, %3905
  %3907 = sext i16 %144 to i32
  %3908 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %3909 = sext i16 %3873 to i32
  %3910 = sext i16 %2672 to i32
  %3911 = call zeroext i16 %3908(i16** %253, i32 %3909, i32 %3910, i32 %265, i32 %263)
  %3912 = zext i16 %3911 to i32
  %3913 = mul nsw i32 %3907, %3912
  %3914 = add nsw i32 %3906, %3913
  %3915 = load i32* @wp_luma_round, align 4
  %3916 = mul nsw i32 2, %3915
  %3917 = add nsw i32 %3914, %3916
  %3918 = load i32* @luma_log_weight_denom, align 4
  %3919 = add nsw i32 %3918, 1
  %3920 = ashr i32 %3917, %3919
  %3921 = sext i16 %212 to i32
  %3922 = add nsw i32 %3920, %3921
  %3923 = load %struct.ImageParameters** @img, align 8
  %3924 = getelementptr inbounds %struct.ImageParameters* %3923, i32 0, i32 155
  %3925 = load i32* %3924, align 4
  %3926 = icmp sgt i32 %3922, %3925
  br i1 %3926, label %3927, label %3931

; <label>:3927                                    ; preds = %3899
  %3928 = load %struct.ImageParameters** @img, align 8
  %3929 = getelementptr inbounds %struct.ImageParameters* %3928, i32 0, i32 155
  %3930 = load i32* %3929, align 4
  br label %3955

; <label>:3931                                    ; preds = %3899
  %3932 = sext i16 %108 to i32
  %3933 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %3934 = sext i16 %3865 to i32
  %3935 = sext i16 %2666 to i32
  %3936 = call zeroext i16 %3933(i16** %238, i32 %3934, i32 %3935, i32 %265, i32 %263)
  %3937 = zext i16 %3936 to i32
  %3938 = mul nsw i32 %3932, %3937
  %3939 = sext i16 %144 to i32
  %3940 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %3941 = sext i16 %3873 to i32
  %3942 = sext i16 %2672 to i32
  %3943 = call zeroext i16 %3940(i16** %253, i32 %3941, i32 %3942, i32 %265, i32 %263)
  %3944 = zext i16 %3943 to i32
  %3945 = mul nsw i32 %3939, %3944
  %3946 = add nsw i32 %3938, %3945
  %3947 = load i32* @wp_luma_round, align 4
  %3948 = mul nsw i32 2, %3947
  %3949 = add nsw i32 %3946, %3948
  %3950 = load i32* @luma_log_weight_denom, align 4
  %3951 = add nsw i32 %3950, 1
  %3952 = ashr i32 %3949, %3951
  %3953 = sext i16 %212 to i32
  %3954 = add nsw i32 %3952, %3953
  br label %3955

; <label>:3955                                    ; preds = %3931, %3927
  %3956 = phi i32 [ %3930, %3927 ], [ %3954, %3931 ]
  br label %3957

; <label>:3957                                    ; preds = %3955, %3898
  %3958 = phi i32 [ 0, %3898 ], [ %3956, %3955 ]
  %3959 = sext i16 %x0.2 to i64
  %3960 = getelementptr inbounds i16* %3870, i64 %3959
  %3961 = load i16* %3960, align 2
  %3962 = zext i16 %3961 to i32
  %3963 = sub nsw i32 %3962, %3958
  %3964 = getelementptr inbounds i32* %3862, i32 1
  store i32 %3963, i32* %3862, align 4
  %3965 = sext i16 %108 to i32
  %3966 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %3967 = sext i16 %3865 to i32
  %3968 = sext i16 %2666 to i32
  %3969 = add nsw i32 %3968, 4
  %3970 = call zeroext i16 %3966(i16** %238, i32 %3967, i32 %3969, i32 %265, i32 %263)
  %3971 = zext i16 %3970 to i32
  %3972 = mul nsw i32 %3965, %3971
  %3973 = sext i16 %144 to i32
  %3974 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %3975 = sext i16 %3873 to i32
  %3976 = sext i16 %2672 to i32
  %3977 = add nsw i32 %3976, 4
  %3978 = call zeroext i16 %3974(i16** %253, i32 %3975, i32 %3977, i32 %265, i32 %263)
  %3979 = zext i16 %3978 to i32
  %3980 = mul nsw i32 %3973, %3979
  %3981 = add nsw i32 %3972, %3980
  %3982 = load i32* @wp_luma_round, align 4
  %3983 = mul nsw i32 2, %3982
  %3984 = add nsw i32 %3981, %3983
  %3985 = load i32* @luma_log_weight_denom, align 4
  %3986 = add nsw i32 %3985, 1
  %3987 = ashr i32 %3984, %3986
  %3988 = sext i16 %212 to i32
  %3989 = add nsw i32 %3987, %3988
  %3990 = icmp slt i32 %3989, 0
  br i1 %3990, label %3991, label %3992

; <label>:3991                                    ; preds = %3957
  br label %4054

; <label>:3992                                    ; preds = %3957
  %3993 = sext i16 %108 to i32
  %3994 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %3995 = sext i16 %3865 to i32
  %3996 = sext i16 %2666 to i32
  %3997 = add nsw i32 %3996, 4
  %3998 = call zeroext i16 %3994(i16** %238, i32 %3995, i32 %3997, i32 %265, i32 %263)
  %3999 = zext i16 %3998 to i32
  %4000 = mul nsw i32 %3993, %3999
  %4001 = sext i16 %144 to i32
  %4002 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %4003 = sext i16 %3873 to i32
  %4004 = sext i16 %2672 to i32
  %4005 = add nsw i32 %4004, 4
  %4006 = call zeroext i16 %4002(i16** %253, i32 %4003, i32 %4005, i32 %265, i32 %263)
  %4007 = zext i16 %4006 to i32
  %4008 = mul nsw i32 %4001, %4007
  %4009 = add nsw i32 %4000, %4008
  %4010 = load i32* @wp_luma_round, align 4
  %4011 = mul nsw i32 2, %4010
  %4012 = add nsw i32 %4009, %4011
  %4013 = load i32* @luma_log_weight_denom, align 4
  %4014 = add nsw i32 %4013, 1
  %4015 = ashr i32 %4012, %4014
  %4016 = sext i16 %212 to i32
  %4017 = add nsw i32 %4015, %4016
  %4018 = load %struct.ImageParameters** @img, align 8
  %4019 = getelementptr inbounds %struct.ImageParameters* %4018, i32 0, i32 155
  %4020 = load i32* %4019, align 4
  %4021 = icmp sgt i32 %4017, %4020
  br i1 %4021, label %4022, label %4026

; <label>:4022                                    ; preds = %3992
  %4023 = load %struct.ImageParameters** @img, align 8
  %4024 = getelementptr inbounds %struct.ImageParameters* %4023, i32 0, i32 155
  %4025 = load i32* %4024, align 4
  br label %4052

; <label>:4026                                    ; preds = %3992
  %4027 = sext i16 %108 to i32
  %4028 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %4029 = sext i16 %3865 to i32
  %4030 = sext i16 %2666 to i32
  %4031 = add nsw i32 %4030, 4
  %4032 = call zeroext i16 %4028(i16** %238, i32 %4029, i32 %4031, i32 %265, i32 %263)
  %4033 = zext i16 %4032 to i32
  %4034 = mul nsw i32 %4027, %4033
  %4035 = sext i16 %144 to i32
  %4036 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %4037 = sext i16 %3873 to i32
  %4038 = sext i16 %2672 to i32
  %4039 = add nsw i32 %4038, 4
  %4040 = call zeroext i16 %4036(i16** %253, i32 %4037, i32 %4039, i32 %265, i32 %263)
  %4041 = zext i16 %4040 to i32
  %4042 = mul nsw i32 %4035, %4041
  %4043 = add nsw i32 %4034, %4042
  %4044 = load i32* @wp_luma_round, align 4
  %4045 = mul nsw i32 2, %4044
  %4046 = add nsw i32 %4043, %4045
  %4047 = load i32* @luma_log_weight_denom, align 4
  %4048 = add nsw i32 %4047, 1
  %4049 = ashr i32 %4046, %4048
  %4050 = sext i16 %212 to i32
  %4051 = add nsw i32 %4049, %4050
  br label %4052

; <label>:4052                                    ; preds = %4026, %4022
  %4053 = phi i32 [ %4025, %4022 ], [ %4051, %4026 ]
  br label %4054

; <label>:4054                                    ; preds = %4052, %3991
  %4055 = phi i32 [ 0, %3991 ], [ %4053, %4052 ]
  %4056 = sext i16 %x0.2 to i32
  %4057 = add nsw i32 %4056, 1
  %4058 = sext i32 %4057 to i64
  %4059 = getelementptr inbounds i16* %3870, i64 %4058
  %4060 = load i16* %4059, align 2
  %4061 = zext i16 %4060 to i32
  %4062 = sub nsw i32 %4061, %4055
  %4063 = getelementptr inbounds i32* %3964, i32 1
  store i32 %4062, i32* %3964, align 4
  %4064 = sext i16 %108 to i32
  %4065 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %4066 = sext i16 %3865 to i32
  %4067 = sext i16 %2666 to i32
  %4068 = add nsw i32 %4067, 8
  %4069 = call zeroext i16 %4065(i16** %238, i32 %4066, i32 %4068, i32 %265, i32 %263)
  %4070 = zext i16 %4069 to i32
  %4071 = mul nsw i32 %4064, %4070
  %4072 = sext i16 %144 to i32
  %4073 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %4074 = sext i16 %3873 to i32
  %4075 = sext i16 %2672 to i32
  %4076 = add nsw i32 %4075, 8
  %4077 = call zeroext i16 %4073(i16** %253, i32 %4074, i32 %4076, i32 %265, i32 %263)
  %4078 = zext i16 %4077 to i32
  %4079 = mul nsw i32 %4072, %4078
  %4080 = add nsw i32 %4071, %4079
  %4081 = load i32* @wp_luma_round, align 4
  %4082 = mul nsw i32 2, %4081
  %4083 = add nsw i32 %4080, %4082
  %4084 = load i32* @luma_log_weight_denom, align 4
  %4085 = add nsw i32 %4084, 1
  %4086 = ashr i32 %4083, %4085
  %4087 = sext i16 %212 to i32
  %4088 = add nsw i32 %4086, %4087
  %4089 = icmp slt i32 %4088, 0
  br i1 %4089, label %4090, label %4091

; <label>:4090                                    ; preds = %4054
  br label %4153

; <label>:4091                                    ; preds = %4054
  %4092 = sext i16 %108 to i32
  %4093 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %4094 = sext i16 %3865 to i32
  %4095 = sext i16 %2666 to i32
  %4096 = add nsw i32 %4095, 8
  %4097 = call zeroext i16 %4093(i16** %238, i32 %4094, i32 %4096, i32 %265, i32 %263)
  %4098 = zext i16 %4097 to i32
  %4099 = mul nsw i32 %4092, %4098
  %4100 = sext i16 %144 to i32
  %4101 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %4102 = sext i16 %3873 to i32
  %4103 = sext i16 %2672 to i32
  %4104 = add nsw i32 %4103, 8
  %4105 = call zeroext i16 %4101(i16** %253, i32 %4102, i32 %4104, i32 %265, i32 %263)
  %4106 = zext i16 %4105 to i32
  %4107 = mul nsw i32 %4100, %4106
  %4108 = add nsw i32 %4099, %4107
  %4109 = load i32* @wp_luma_round, align 4
  %4110 = mul nsw i32 2, %4109
  %4111 = add nsw i32 %4108, %4110
  %4112 = load i32* @luma_log_weight_denom, align 4
  %4113 = add nsw i32 %4112, 1
  %4114 = ashr i32 %4111, %4113
  %4115 = sext i16 %212 to i32
  %4116 = add nsw i32 %4114, %4115
  %4117 = load %struct.ImageParameters** @img, align 8
  %4118 = getelementptr inbounds %struct.ImageParameters* %4117, i32 0, i32 155
  %4119 = load i32* %4118, align 4
  %4120 = icmp sgt i32 %4116, %4119
  br i1 %4120, label %4121, label %4125

; <label>:4121                                    ; preds = %4091
  %4122 = load %struct.ImageParameters** @img, align 8
  %4123 = getelementptr inbounds %struct.ImageParameters* %4122, i32 0, i32 155
  %4124 = load i32* %4123, align 4
  br label %4151

; <label>:4125                                    ; preds = %4091
  %4126 = sext i16 %108 to i32
  %4127 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %4128 = sext i16 %3865 to i32
  %4129 = sext i16 %2666 to i32
  %4130 = add nsw i32 %4129, 8
  %4131 = call zeroext i16 %4127(i16** %238, i32 %4128, i32 %4130, i32 %265, i32 %263)
  %4132 = zext i16 %4131 to i32
  %4133 = mul nsw i32 %4126, %4132
  %4134 = sext i16 %144 to i32
  %4135 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %4136 = sext i16 %3873 to i32
  %4137 = sext i16 %2672 to i32
  %4138 = add nsw i32 %4137, 8
  %4139 = call zeroext i16 %4135(i16** %253, i32 %4136, i32 %4138, i32 %265, i32 %263)
  %4140 = zext i16 %4139 to i32
  %4141 = mul nsw i32 %4134, %4140
  %4142 = add nsw i32 %4133, %4141
  %4143 = load i32* @wp_luma_round, align 4
  %4144 = mul nsw i32 2, %4143
  %4145 = add nsw i32 %4142, %4144
  %4146 = load i32* @luma_log_weight_denom, align 4
  %4147 = add nsw i32 %4146, 1
  %4148 = ashr i32 %4145, %4147
  %4149 = sext i16 %212 to i32
  %4150 = add nsw i32 %4148, %4149
  br label %4151

; <label>:4151                                    ; preds = %4125, %4121
  %4152 = phi i32 [ %4124, %4121 ], [ %4150, %4125 ]
  br label %4153

; <label>:4153                                    ; preds = %4151, %4090
  %4154 = phi i32 [ 0, %4090 ], [ %4152, %4151 ]
  %4155 = sext i16 %x0.2 to i32
  %4156 = add nsw i32 %4155, 2
  %4157 = sext i32 %4156 to i64
  %4158 = getelementptr inbounds i16* %3870, i64 %4157
  %4159 = load i16* %4158, align 2
  %4160 = zext i16 %4159 to i32
  %4161 = sub nsw i32 %4160, %4154
  %4162 = getelementptr inbounds i32* %4063, i32 1
  store i32 %4161, i32* %4063, align 4
  %4163 = sext i16 %108 to i32
  %4164 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %4165 = sext i16 %3865 to i32
  %4166 = sext i16 %2666 to i32
  %4167 = add nsw i32 %4166, 12
  %4168 = call zeroext i16 %4164(i16** %238, i32 %4165, i32 %4167, i32 %265, i32 %263)
  %4169 = zext i16 %4168 to i32
  %4170 = mul nsw i32 %4163, %4169
  %4171 = sext i16 %144 to i32
  %4172 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %4173 = sext i16 %3873 to i32
  %4174 = sext i16 %2672 to i32
  %4175 = add nsw i32 %4174, 12
  %4176 = call zeroext i16 %4172(i16** %253, i32 %4173, i32 %4175, i32 %265, i32 %263)
  %4177 = zext i16 %4176 to i32
  %4178 = mul nsw i32 %4171, %4177
  %4179 = add nsw i32 %4170, %4178
  %4180 = load i32* @wp_luma_round, align 4
  %4181 = mul nsw i32 2, %4180
  %4182 = add nsw i32 %4179, %4181
  %4183 = load i32* @luma_log_weight_denom, align 4
  %4184 = add nsw i32 %4183, 1
  %4185 = ashr i32 %4182, %4184
  %4186 = sext i16 %212 to i32
  %4187 = add nsw i32 %4185, %4186
  %4188 = icmp slt i32 %4187, 0
  br i1 %4188, label %4189, label %4190

; <label>:4189                                    ; preds = %4153
  br label %4252

; <label>:4190                                    ; preds = %4153
  %4191 = sext i16 %108 to i32
  %4192 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %4193 = sext i16 %3865 to i32
  %4194 = sext i16 %2666 to i32
  %4195 = add nsw i32 %4194, 12
  %4196 = call zeroext i16 %4192(i16** %238, i32 %4193, i32 %4195, i32 %265, i32 %263)
  %4197 = zext i16 %4196 to i32
  %4198 = mul nsw i32 %4191, %4197
  %4199 = sext i16 %144 to i32
  %4200 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %4201 = sext i16 %3873 to i32
  %4202 = sext i16 %2672 to i32
  %4203 = add nsw i32 %4202, 12
  %4204 = call zeroext i16 %4200(i16** %253, i32 %4201, i32 %4203, i32 %265, i32 %263)
  %4205 = zext i16 %4204 to i32
  %4206 = mul nsw i32 %4199, %4205
  %4207 = add nsw i32 %4198, %4206
  %4208 = load i32* @wp_luma_round, align 4
  %4209 = mul nsw i32 2, %4208
  %4210 = add nsw i32 %4207, %4209
  %4211 = load i32* @luma_log_weight_denom, align 4
  %4212 = add nsw i32 %4211, 1
  %4213 = ashr i32 %4210, %4212
  %4214 = sext i16 %212 to i32
  %4215 = add nsw i32 %4213, %4214
  %4216 = load %struct.ImageParameters** @img, align 8
  %4217 = getelementptr inbounds %struct.ImageParameters* %4216, i32 0, i32 155
  %4218 = load i32* %4217, align 4
  %4219 = icmp sgt i32 %4215, %4218
  br i1 %4219, label %4220, label %4224

; <label>:4220                                    ; preds = %4190
  %4221 = load %struct.ImageParameters** @img, align 8
  %4222 = getelementptr inbounds %struct.ImageParameters* %4221, i32 0, i32 155
  %4223 = load i32* %4222, align 4
  br label %4250

; <label>:4224                                    ; preds = %4190
  %4225 = sext i16 %108 to i32
  %4226 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %4227 = sext i16 %3865 to i32
  %4228 = sext i16 %2666 to i32
  %4229 = add nsw i32 %4228, 12
  %4230 = call zeroext i16 %4226(i16** %238, i32 %4227, i32 %4229, i32 %265, i32 %263)
  %4231 = zext i16 %4230 to i32
  %4232 = mul nsw i32 %4225, %4231
  %4233 = sext i16 %144 to i32
  %4234 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %4235 = sext i16 %3873 to i32
  %4236 = sext i16 %2672 to i32
  %4237 = add nsw i32 %4236, 12
  %4238 = call zeroext i16 %4234(i16** %253, i32 %4235, i32 %4237, i32 %265, i32 %263)
  %4239 = zext i16 %4238 to i32
  %4240 = mul nsw i32 %4233, %4239
  %4241 = add nsw i32 %4232, %4240
  %4242 = load i32* @wp_luma_round, align 4
  %4243 = mul nsw i32 2, %4242
  %4244 = add nsw i32 %4241, %4243
  %4245 = load i32* @luma_log_weight_denom, align 4
  %4246 = add nsw i32 %4245, 1
  %4247 = ashr i32 %4244, %4246
  %4248 = sext i16 %212 to i32
  %4249 = add nsw i32 %4247, %4248
  br label %4250

; <label>:4250                                    ; preds = %4224, %4220
  %4251 = phi i32 [ %4223, %4220 ], [ %4249, %4224 ]
  br label %4252

; <label>:4252                                    ; preds = %4250, %4189
  %4253 = phi i32 [ 0, %4189 ], [ %4251, %4250 ]
  %4254 = sext i16 %x0.2 to i32
  %4255 = add nsw i32 %4254, 3
  %4256 = sext i32 %4255 to i64
  %4257 = getelementptr inbounds i16* %3870, i64 %4256
  %4258 = load i16* %4257, align 2
  %4259 = zext i16 %4258 to i32
  %4260 = sub nsw i32 %4259, %4253
  store i32 %4260, i32* %4162, align 4
  %4261 = load %struct.InputParameters** @input, align 8
  %4262 = getelementptr inbounds %struct.InputParameters* %4261, i32 0, i32 123
  %4263 = load i32* %4262, align 4
  %4264 = icmp ne i32 %4263, 0
  br i1 %4264, label %4278, label %4265

; <label>:4265                                    ; preds = %4252
  %4266 = getelementptr inbounds [16 x i32]* %diff, i32 0, i32 0
  %4267 = load %struct.InputParameters** @input, align 8
  %4268 = getelementptr inbounds %struct.InputParameters* %4267, i32 0, i32 6
  %4269 = load i32* %4268, align 4
  %4270 = call i32 @SATD(i32* %4266, i32 %4269)
  %4271 = sext i16 %mcost.10 to i32
  %4272 = add nsw i32 %4271, %4270
  %4273 = trunc i32 %4272 to i16
  %4274 = sext i16 %4273 to i32
  %4275 = icmp sgt i32 %4274, %.3
  br i1 %4275, label %4276, label %4277

; <label>:4276                                    ; preds = %4265
  br label %4308

; <label>:4277                                    ; preds = %4265
  br label %4303

; <label>:4278                                    ; preds = %4252
  br label %4279

; <label>:4279                                    ; preds = %4300, %4278
  %k.4 = phi i32 [ 0, %4278 ], [ %k.5, %4300 ]
  %j.2 = phi i32 [ 0, %4278 ], [ %4301, %4300 ]
  %4280 = icmp slt i32 %j.2, 4
  br i1 %4280, label %4281, label %4302

; <label>:4281                                    ; preds = %4279
  br label %4282

; <label>:4282                                    ; preds = %4296, %4281
  %k.5 = phi i32 [ %k.4, %4281 ], [ %4298, %4296 ]
  %i.2 = phi i32 [ 0, %4281 ], [ %4297, %4296 ]
  %4283 = icmp slt i32 %i.2, 4
  br i1 %4283, label %4284, label %4299

; <label>:4284                                    ; preds = %4282
  %4285 = sext i32 %k.5 to i64
  %4286 = getelementptr inbounds [16 x i32]* %diff, i32 0, i64 %4285
  %4287 = load i32* %4286, align 4
  %4288 = sext i16 %x0.2 to i32
  %4289 = add nsw i32 %4288, %i.2
  %4290 = sext i32 %4289 to i64
  %4291 = sext i16 %y0.1 to i32
  %4292 = add nsw i32 %4291, %j.2
  %4293 = sext i32 %4292 to i64
  %4294 = getelementptr inbounds [16 x [16 x i32]]* %curr_diff, i32 0, i64 %4293
  %4295 = getelementptr inbounds [16 x i32]* %4294, i32 0, i64 %4290
  store i32 %4287, i32* %4295, align 4
  br label %4296

; <label>:4296                                    ; preds = %4284
  %4297 = add nsw i32 %i.2, 1
  %4298 = add nsw i32 %k.5, 1
  br label %4282

; <label>:4299                                    ; preds = %4282
  br label %4300

; <label>:4300                                    ; preds = %4299
  %4301 = add nsw i32 %j.2, 1
  br label %4279

; <label>:4302                                    ; preds = %4279
  br label %4303

; <label>:4303                                    ; preds = %4302, %4277
  %mcost.11 = phi i16 [ %mcost.10, %4302 ], [ %4273, %4277 ]
  br label %4304

; <label>:4304                                    ; preds = %4303
  %4305 = sext i16 %x0.2 to i32
  %4306 = add nsw i32 %4305, 4
  %4307 = trunc i32 %4306 to i16
  br label %2655

; <label>:4308                                    ; preds = %4276, %2655
  %mcost.12 = phi i16 [ %4273, %4276 ], [ %mcost.10, %2655 ]
  %abort_search.5 = phi i16 [ 1, %4276 ], [ %abort_search.4, %2655 ]
  br label %4748

; <label>:4309                                    ; preds = %2639
  br label %4310

; <label>:4310                                    ; preds = %4743, %4309
  %mcost.13 = phi i16 [ %mcost.9, %4309 ], [ %mcost.14, %4743 ]
  %x0.3 = phi i16 [ 0, %4309 ], [ %4746, %4743 ]
  %4311 = sext i16 %x0.3 to i32
  %4312 = sext i16 %10 to i32
  %4313 = icmp slt i32 %4311, %4312
  br i1 %4313, label %4314, label %4747

; <label>:4314                                    ; preds = %4310
  %4315 = sext i16 %x0.3 to i32
  %4316 = add nsw i32 %pic_pix_x, %4315
  %4317 = shl i32 %4316, 2
  %4318 = load i16* %s_mv_x, align 2
  %4319 = sext i16 %4318 to i32
  %4320 = add nsw i32 %4317, %4319
  %4321 = trunc i32 %4320 to i16
  %4322 = sext i16 %x0.3 to i32
  %4323 = add nsw i32 %pic_pix_x, %4322
  %4324 = shl i32 %4323, 2
  %4325 = sext i16 %2599 to i32
  %4326 = add nsw i32 %4324, %4325
  %4327 = trunc i32 %4326 to i16
  %4328 = getelementptr inbounds [16 x i32]* %diff, i32 0, i32 0
  %4329 = sext i16 %y0.1 to i64
  %4330 = getelementptr inbounds i16** %orig_pic, i64 %4329
  %4331 = load i16** %4330, align 8
  %4332 = sext i16 %x0.3 to i64
  %4333 = getelementptr inbounds i16* %4331, i64 %4332
  %4334 = load i16* %4333, align 2
  %4335 = zext i16 %4334 to i32
  %4336 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %4337 = sext i16 %2646 to i32
  %4338 = sext i16 %4321 to i32
  %4339 = call zeroext i16 %4336(i16** %238, i32 %4337, i32 %4338, i32 %265, i32 %263)
  %4340 = zext i16 %4339 to i32
  %4341 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %4342 = sext i16 %2652 to i32
  %4343 = sext i16 %4327 to i32
  %4344 = call zeroext i16 %4341(i16** %253, i32 %4342, i32 %4343, i32 %265, i32 %263)
  %4345 = zext i16 %4344 to i32
  %4346 = add nsw i32 %4340, %4345
  %4347 = ashr i32 %4346, 1
  %4348 = sub nsw i32 %4335, %4347
  %4349 = getelementptr inbounds i32* %4328, i32 1
  store i32 %4348, i32* %4328, align 4
  %4350 = sext i16 %x0.3 to i32
  %4351 = add nsw i32 %4350, 1
  %4352 = sext i32 %4351 to i64
  %4353 = getelementptr inbounds i16* %4331, i64 %4352
  %4354 = load i16* %4353, align 2
  %4355 = zext i16 %4354 to i32
  %4356 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %4357 = sext i16 %2646 to i32
  %4358 = sext i16 %4321 to i32
  %4359 = add nsw i32 %4358, 4
  %4360 = call zeroext i16 %4356(i16** %238, i32 %4357, i32 %4359, i32 %265, i32 %263)
  %4361 = zext i16 %4360 to i32
  %4362 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %4363 = sext i16 %2652 to i32
  %4364 = sext i16 %4327 to i32
  %4365 = add nsw i32 %4364, 4
  %4366 = call zeroext i16 %4362(i16** %253, i32 %4363, i32 %4365, i32 %265, i32 %263)
  %4367 = zext i16 %4366 to i32
  %4368 = add nsw i32 %4361, %4367
  %4369 = ashr i32 %4368, 1
  %4370 = sub nsw i32 %4355, %4369
  %4371 = getelementptr inbounds i32* %4349, i32 1
  store i32 %4370, i32* %4349, align 4
  %4372 = sext i16 %x0.3 to i32
  %4373 = add nsw i32 %4372, 2
  %4374 = sext i32 %4373 to i64
  %4375 = getelementptr inbounds i16* %4331, i64 %4374
  %4376 = load i16* %4375, align 2
  %4377 = zext i16 %4376 to i32
  %4378 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %4379 = sext i16 %2646 to i32
  %4380 = sext i16 %4321 to i32
  %4381 = add nsw i32 %4380, 8
  %4382 = call zeroext i16 %4378(i16** %238, i32 %4379, i32 %4381, i32 %265, i32 %263)
  %4383 = zext i16 %4382 to i32
  %4384 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %4385 = sext i16 %2652 to i32
  %4386 = sext i16 %4327 to i32
  %4387 = add nsw i32 %4386, 8
  %4388 = call zeroext i16 %4384(i16** %253, i32 %4385, i32 %4387, i32 %265, i32 %263)
  %4389 = zext i16 %4388 to i32
  %4390 = add nsw i32 %4383, %4389
  %4391 = ashr i32 %4390, 1
  %4392 = sub nsw i32 %4377, %4391
  %4393 = getelementptr inbounds i32* %4371, i32 1
  store i32 %4392, i32* %4371, align 4
  %4394 = sext i16 %x0.3 to i32
  %4395 = add nsw i32 %4394, 3
  %4396 = sext i32 %4395 to i64
  %4397 = getelementptr inbounds i16* %4331, i64 %4396
  %4398 = load i16* %4397, align 2
  %4399 = zext i16 %4398 to i32
  %4400 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %4401 = sext i16 %2646 to i32
  %4402 = sext i16 %4321 to i32
  %4403 = add nsw i32 %4402, 12
  %4404 = call zeroext i16 %4400(i16** %238, i32 %4401, i32 %4403, i32 %265, i32 %263)
  %4405 = zext i16 %4404 to i32
  %4406 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %4407 = sext i16 %2652 to i32
  %4408 = sext i16 %4327 to i32
  %4409 = add nsw i32 %4408, 12
  %4410 = call zeroext i16 %4406(i16** %253, i32 %4407, i32 %4409, i32 %265, i32 %263)
  %4411 = zext i16 %4410 to i32
  %4412 = add nsw i32 %4405, %4411
  %4413 = ashr i32 %4412, 1
  %4414 = sub nsw i32 %4399, %4413
  %4415 = getelementptr inbounds i32* %4393, i32 1
  store i32 %4414, i32* %4393, align 4
  %4416 = sext i16 %2646 to i32
  %4417 = add nsw i32 %4416, 4
  %4418 = trunc i32 %4417 to i16
  %4419 = sext i16 %2652 to i32
  %4420 = add nsw i32 %4419, 4
  %4421 = trunc i32 %4420 to i16
  %4422 = sext i16 %y0.1 to i32
  %4423 = add nsw i32 %4422, 1
  %4424 = sext i32 %4423 to i64
  %4425 = getelementptr inbounds i16** %orig_pic, i64 %4424
  %4426 = load i16** %4425, align 8
  %4427 = sext i16 %x0.3 to i64
  %4428 = getelementptr inbounds i16* %4426, i64 %4427
  %4429 = load i16* %4428, align 2
  %4430 = zext i16 %4429 to i32
  %4431 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %4432 = sext i16 %4418 to i32
  %4433 = sext i16 %4321 to i32
  %4434 = call zeroext i16 %4431(i16** %238, i32 %4432, i32 %4433, i32 %265, i32 %263)
  %4435 = zext i16 %4434 to i32
  %4436 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %4437 = sext i16 %4421 to i32
  %4438 = sext i16 %4327 to i32
  %4439 = call zeroext i16 %4436(i16** %253, i32 %4437, i32 %4438, i32 %265, i32 %263)
  %4440 = zext i16 %4439 to i32
  %4441 = add nsw i32 %4435, %4440
  %4442 = ashr i32 %4441, 1
  %4443 = sub nsw i32 %4430, %4442
  %4444 = getelementptr inbounds i32* %4415, i32 1
  store i32 %4443, i32* %4415, align 4
  %4445 = sext i16 %x0.3 to i32
  %4446 = add nsw i32 %4445, 1
  %4447 = sext i32 %4446 to i64
  %4448 = getelementptr inbounds i16* %4426, i64 %4447
  %4449 = load i16* %4448, align 2
  %4450 = zext i16 %4449 to i32
  %4451 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %4452 = sext i16 %4418 to i32
  %4453 = sext i16 %4321 to i32
  %4454 = add nsw i32 %4453, 4
  %4455 = call zeroext i16 %4451(i16** %238, i32 %4452, i32 %4454, i32 %265, i32 %263)
  %4456 = zext i16 %4455 to i32
  %4457 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %4458 = sext i16 %4421 to i32
  %4459 = sext i16 %4327 to i32
  %4460 = add nsw i32 %4459, 4
  %4461 = call zeroext i16 %4457(i16** %253, i32 %4458, i32 %4460, i32 %265, i32 %263)
  %4462 = zext i16 %4461 to i32
  %4463 = add nsw i32 %4456, %4462
  %4464 = ashr i32 %4463, 1
  %4465 = sub nsw i32 %4450, %4464
  %4466 = getelementptr inbounds i32* %4444, i32 1
  store i32 %4465, i32* %4444, align 4
  %4467 = sext i16 %x0.3 to i32
  %4468 = add nsw i32 %4467, 2
  %4469 = sext i32 %4468 to i64
  %4470 = getelementptr inbounds i16* %4426, i64 %4469
  %4471 = load i16* %4470, align 2
  %4472 = zext i16 %4471 to i32
  %4473 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %4474 = sext i16 %4418 to i32
  %4475 = sext i16 %4321 to i32
  %4476 = add nsw i32 %4475, 8
  %4477 = call zeroext i16 %4473(i16** %238, i32 %4474, i32 %4476, i32 %265, i32 %263)
  %4478 = zext i16 %4477 to i32
  %4479 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %4480 = sext i16 %4421 to i32
  %4481 = sext i16 %4327 to i32
  %4482 = add nsw i32 %4481, 8
  %4483 = call zeroext i16 %4479(i16** %253, i32 %4480, i32 %4482, i32 %265, i32 %263)
  %4484 = zext i16 %4483 to i32
  %4485 = add nsw i32 %4478, %4484
  %4486 = ashr i32 %4485, 1
  %4487 = sub nsw i32 %4472, %4486
  %4488 = getelementptr inbounds i32* %4466, i32 1
  store i32 %4487, i32* %4466, align 4
  %4489 = sext i16 %x0.3 to i32
  %4490 = add nsw i32 %4489, 3
  %4491 = sext i32 %4490 to i64
  %4492 = getelementptr inbounds i16* %4426, i64 %4491
  %4493 = load i16* %4492, align 2
  %4494 = zext i16 %4493 to i32
  %4495 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %4496 = sext i16 %4418 to i32
  %4497 = sext i16 %4321 to i32
  %4498 = add nsw i32 %4497, 12
  %4499 = call zeroext i16 %4495(i16** %238, i32 %4496, i32 %4498, i32 %265, i32 %263)
  %4500 = zext i16 %4499 to i32
  %4501 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %4502 = sext i16 %4421 to i32
  %4503 = sext i16 %4327 to i32
  %4504 = add nsw i32 %4503, 12
  %4505 = call zeroext i16 %4501(i16** %253, i32 %4502, i32 %4504, i32 %265, i32 %263)
  %4506 = zext i16 %4505 to i32
  %4507 = add nsw i32 %4500, %4506
  %4508 = ashr i32 %4507, 1
  %4509 = sub nsw i32 %4494, %4508
  %4510 = getelementptr inbounds i32* %4488, i32 1
  store i32 %4509, i32* %4488, align 4
  %4511 = sext i16 %2646 to i32
  %4512 = add nsw i32 %4511, 8
  %4513 = trunc i32 %4512 to i16
  %4514 = sext i16 %2652 to i32
  %4515 = add nsw i32 %4514, 8
  %4516 = trunc i32 %4515 to i16
  %4517 = sext i16 %y0.1 to i32
  %4518 = add nsw i32 %4517, 2
  %4519 = sext i32 %4518 to i64
  %4520 = getelementptr inbounds i16** %orig_pic, i64 %4519
  %4521 = load i16** %4520, align 8
  %4522 = sext i16 %x0.3 to i64
  %4523 = getelementptr inbounds i16* %4521, i64 %4522
  %4524 = load i16* %4523, align 2
  %4525 = zext i16 %4524 to i32
  %4526 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %4527 = sext i16 %4513 to i32
  %4528 = sext i16 %4321 to i32
  %4529 = call zeroext i16 %4526(i16** %238, i32 %4527, i32 %4528, i32 %265, i32 %263)
  %4530 = zext i16 %4529 to i32
  %4531 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %4532 = sext i16 %4516 to i32
  %4533 = sext i16 %4327 to i32
  %4534 = call zeroext i16 %4531(i16** %253, i32 %4532, i32 %4533, i32 %265, i32 %263)
  %4535 = zext i16 %4534 to i32
  %4536 = add nsw i32 %4530, %4535
  %4537 = ashr i32 %4536, 1
  %4538 = sub nsw i32 %4525, %4537
  %4539 = getelementptr inbounds i32* %4510, i32 1
  store i32 %4538, i32* %4510, align 4
  %4540 = sext i16 %x0.3 to i32
  %4541 = add nsw i32 %4540, 1
  %4542 = sext i32 %4541 to i64
  %4543 = getelementptr inbounds i16* %4521, i64 %4542
  %4544 = load i16* %4543, align 2
  %4545 = zext i16 %4544 to i32
  %4546 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %4547 = sext i16 %4513 to i32
  %4548 = sext i16 %4321 to i32
  %4549 = add nsw i32 %4548, 4
  %4550 = call zeroext i16 %4546(i16** %238, i32 %4547, i32 %4549, i32 %265, i32 %263)
  %4551 = zext i16 %4550 to i32
  %4552 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %4553 = sext i16 %4516 to i32
  %4554 = sext i16 %4327 to i32
  %4555 = add nsw i32 %4554, 4
  %4556 = call zeroext i16 %4552(i16** %253, i32 %4553, i32 %4555, i32 %265, i32 %263)
  %4557 = zext i16 %4556 to i32
  %4558 = add nsw i32 %4551, %4557
  %4559 = ashr i32 %4558, 1
  %4560 = sub nsw i32 %4545, %4559
  %4561 = getelementptr inbounds i32* %4539, i32 1
  store i32 %4560, i32* %4539, align 4
  %4562 = sext i16 %x0.3 to i32
  %4563 = add nsw i32 %4562, 2
  %4564 = sext i32 %4563 to i64
  %4565 = getelementptr inbounds i16* %4521, i64 %4564
  %4566 = load i16* %4565, align 2
  %4567 = zext i16 %4566 to i32
  %4568 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %4569 = sext i16 %4513 to i32
  %4570 = sext i16 %4321 to i32
  %4571 = add nsw i32 %4570, 8
  %4572 = call zeroext i16 %4568(i16** %238, i32 %4569, i32 %4571, i32 %265, i32 %263)
  %4573 = zext i16 %4572 to i32
  %4574 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %4575 = sext i16 %4516 to i32
  %4576 = sext i16 %4327 to i32
  %4577 = add nsw i32 %4576, 8
  %4578 = call zeroext i16 %4574(i16** %253, i32 %4575, i32 %4577, i32 %265, i32 %263)
  %4579 = zext i16 %4578 to i32
  %4580 = add nsw i32 %4573, %4579
  %4581 = ashr i32 %4580, 1
  %4582 = sub nsw i32 %4567, %4581
  %4583 = getelementptr inbounds i32* %4561, i32 1
  store i32 %4582, i32* %4561, align 4
  %4584 = sext i16 %x0.3 to i32
  %4585 = add nsw i32 %4584, 3
  %4586 = sext i32 %4585 to i64
  %4587 = getelementptr inbounds i16* %4521, i64 %4586
  %4588 = load i16* %4587, align 2
  %4589 = zext i16 %4588 to i32
  %4590 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %4591 = sext i16 %4513 to i32
  %4592 = sext i16 %4321 to i32
  %4593 = add nsw i32 %4592, 12
  %4594 = call zeroext i16 %4590(i16** %238, i32 %4591, i32 %4593, i32 %265, i32 %263)
  %4595 = zext i16 %4594 to i32
  %4596 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %4597 = sext i16 %4516 to i32
  %4598 = sext i16 %4327 to i32
  %4599 = add nsw i32 %4598, 12
  %4600 = call zeroext i16 %4596(i16** %253, i32 %4597, i32 %4599, i32 %265, i32 %263)
  %4601 = zext i16 %4600 to i32
  %4602 = add nsw i32 %4595, %4601
  %4603 = ashr i32 %4602, 1
  %4604 = sub nsw i32 %4589, %4603
  %4605 = getelementptr inbounds i32* %4583, i32 1
  store i32 %4604, i32* %4583, align 4
  %4606 = sext i16 %2646 to i32
  %4607 = add nsw i32 %4606, 12
  %4608 = trunc i32 %4607 to i16
  %4609 = sext i16 %2652 to i32
  %4610 = add nsw i32 %4609, 12
  %4611 = trunc i32 %4610 to i16
  %4612 = sext i16 %y0.1 to i32
  %4613 = add nsw i32 %4612, 3
  %4614 = sext i32 %4613 to i64
  %4615 = getelementptr inbounds i16** %orig_pic, i64 %4614
  %4616 = load i16** %4615, align 8
  %4617 = sext i16 %x0.3 to i64
  %4618 = getelementptr inbounds i16* %4616, i64 %4617
  %4619 = load i16* %4618, align 2
  %4620 = zext i16 %4619 to i32
  %4621 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %4622 = sext i16 %4608 to i32
  %4623 = sext i16 %4321 to i32
  %4624 = call zeroext i16 %4621(i16** %238, i32 %4622, i32 %4623, i32 %265, i32 %263)
  %4625 = zext i16 %4624 to i32
  %4626 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %4627 = sext i16 %4611 to i32
  %4628 = sext i16 %4327 to i32
  %4629 = call zeroext i16 %4626(i16** %253, i32 %4627, i32 %4628, i32 %265, i32 %263)
  %4630 = zext i16 %4629 to i32
  %4631 = add nsw i32 %4625, %4630
  %4632 = ashr i32 %4631, 1
  %4633 = sub nsw i32 %4620, %4632
  %4634 = getelementptr inbounds i32* %4605, i32 1
  store i32 %4633, i32* %4605, align 4
  %4635 = sext i16 %x0.3 to i32
  %4636 = add nsw i32 %4635, 1
  %4637 = sext i32 %4636 to i64
  %4638 = getelementptr inbounds i16* %4616, i64 %4637
  %4639 = load i16* %4638, align 2
  %4640 = zext i16 %4639 to i32
  %4641 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %4642 = sext i16 %4608 to i32
  %4643 = sext i16 %4321 to i32
  %4644 = add nsw i32 %4643, 4
  %4645 = call zeroext i16 %4641(i16** %238, i32 %4642, i32 %4644, i32 %265, i32 %263)
  %4646 = zext i16 %4645 to i32
  %4647 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %4648 = sext i16 %4611 to i32
  %4649 = sext i16 %4327 to i32
  %4650 = add nsw i32 %4649, 4
  %4651 = call zeroext i16 %4647(i16** %253, i32 %4648, i32 %4650, i32 %265, i32 %263)
  %4652 = zext i16 %4651 to i32
  %4653 = add nsw i32 %4646, %4652
  %4654 = ashr i32 %4653, 1
  %4655 = sub nsw i32 %4640, %4654
  %4656 = getelementptr inbounds i32* %4634, i32 1
  store i32 %4655, i32* %4634, align 4
  %4657 = sext i16 %x0.3 to i32
  %4658 = add nsw i32 %4657, 2
  %4659 = sext i32 %4658 to i64
  %4660 = getelementptr inbounds i16* %4616, i64 %4659
  %4661 = load i16* %4660, align 2
  %4662 = zext i16 %4661 to i32
  %4663 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %4664 = sext i16 %4608 to i32
  %4665 = sext i16 %4321 to i32
  %4666 = add nsw i32 %4665, 8
  %4667 = call zeroext i16 %4663(i16** %238, i32 %4664, i32 %4666, i32 %265, i32 %263)
  %4668 = zext i16 %4667 to i32
  %4669 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %4670 = sext i16 %4611 to i32
  %4671 = sext i16 %4327 to i32
  %4672 = add nsw i32 %4671, 8
  %4673 = call zeroext i16 %4669(i16** %253, i32 %4670, i32 %4672, i32 %265, i32 %263)
  %4674 = zext i16 %4673 to i32
  %4675 = add nsw i32 %4668, %4674
  %4676 = ashr i32 %4675, 1
  %4677 = sub nsw i32 %4662, %4676
  %4678 = getelementptr inbounds i32* %4656, i32 1
  store i32 %4677, i32* %4656, align 4
  %4679 = sext i16 %x0.3 to i32
  %4680 = add nsw i32 %4679, 3
  %4681 = sext i32 %4680 to i64
  %4682 = getelementptr inbounds i16* %4616, i64 %4681
  %4683 = load i16* %4682, align 2
  %4684 = zext i16 %4683 to i32
  %4685 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14b, align 8
  %4686 = sext i16 %4608 to i32
  %4687 = sext i16 %4321 to i32
  %4688 = add nsw i32 %4687, 12
  %4689 = call zeroext i16 %4685(i16** %238, i32 %4686, i32 %4688, i32 %265, i32 %263)
  %4690 = zext i16 %4689 to i32
  %4691 = load i16 (i16**, i32, i32, i32, i32)** @PelY_14, align 8
  %4692 = sext i16 %4611 to i32
  %4693 = sext i16 %4327 to i32
  %4694 = add nsw i32 %4693, 12
  %4695 = call zeroext i16 %4691(i16** %253, i32 %4692, i32 %4694, i32 %265, i32 %263)
  %4696 = zext i16 %4695 to i32
  %4697 = add nsw i32 %4690, %4696
  %4698 = ashr i32 %4697, 1
  %4699 = sub nsw i32 %4684, %4698
  store i32 %4699, i32* %4678, align 4
  %4700 = load %struct.InputParameters** @input, align 8
  %4701 = getelementptr inbounds %struct.InputParameters* %4700, i32 0, i32 123
  %4702 = load i32* %4701, align 4
  %4703 = icmp ne i32 %4702, 0
  br i1 %4703, label %4717, label %4704

; <label>:4704                                    ; preds = %4314
  %4705 = getelementptr inbounds [16 x i32]* %diff, i32 0, i32 0
  %4706 = load %struct.InputParameters** @input, align 8
  %4707 = getelementptr inbounds %struct.InputParameters* %4706, i32 0, i32 6
  %4708 = load i32* %4707, align 4
  %4709 = call i32 @SATD(i32* %4705, i32 %4708)
  %4710 = sext i16 %mcost.13 to i32
  %4711 = add nsw i32 %4710, %4709
  %4712 = trunc i32 %4711 to i16
  %4713 = sext i16 %4712 to i32
  %4714 = icmp sgt i32 %4713, %.3
  br i1 %4714, label %4715, label %4716

; <label>:4715                                    ; preds = %4704
  br label %4747

; <label>:4716                                    ; preds = %4704
  br label %4742

; <label>:4717                                    ; preds = %4314
  br label %4718

; <label>:4718                                    ; preds = %4739, %4717
  %k.6 = phi i32 [ 0, %4717 ], [ %k.7, %4739 ]
  %j.3 = phi i32 [ 0, %4717 ], [ %4740, %4739 ]
  %4719 = icmp slt i32 %j.3, 4
  br i1 %4719, label %4720, label %4741

; <label>:4720                                    ; preds = %4718
  br label %4721

; <label>:4721                                    ; preds = %4735, %4720
  %k.7 = phi i32 [ %k.6, %4720 ], [ %4737, %4735 ]
  %i.3 = phi i32 [ 0, %4720 ], [ %4736, %4735 ]
  %4722 = icmp slt i32 %i.3, 4
  br i1 %4722, label %4723, label %4738

; <label>:4723                                    ; preds = %4721
  %4724 = sext i32 %k.7 to i64
  %4725 = getelementptr inbounds [16 x i32]* %diff, i32 0, i64 %4724
  %4726 = load i32* %4725, align 4
  %4727 = sext i16 %x0.3 to i32
  %4728 = add nsw i32 %4727, %i.3
  %4729 = sext i32 %4728 to i64
  %4730 = sext i16 %y0.1 to i32
  %4731 = add nsw i32 %4730, %j.3
  %4732 = sext i32 %4731 to i64
  %4733 = getelementptr inbounds [16 x [16 x i32]]* %curr_diff, i32 0, i64 %4732
  %4734 = getelementptr inbounds [16 x i32]* %4733, i32 0, i64 %4729
  store i32 %4726, i32* %4734, align 4
  br label %4735

; <label>:4735                                    ; preds = %4723
  %4736 = add nsw i32 %i.3, 1
  %4737 = add nsw i32 %k.7, 1
  br label %4721

; <label>:4738                                    ; preds = %4721
  br label %4739

; <label>:4739                                    ; preds = %4738
  %4740 = add nsw i32 %j.3, 1
  br label %4718

; <label>:4741                                    ; preds = %4718
  br label %4742

; <label>:4742                                    ; preds = %4741, %4716
  %mcost.14 = phi i16 [ %mcost.13, %4741 ], [ %4712, %4716 ]
  br label %4743

; <label>:4743                                    ; preds = %4742
  %4744 = sext i16 %x0.3 to i32
  %4745 = add nsw i32 %4744, 4
  %4746 = trunc i32 %4745 to i16
  br label %4310

; <label>:4747                                    ; preds = %4715, %4310
  %mcost.15 = phi i16 [ %4712, %4715 ], [ %mcost.13, %4310 ]
  %abort_search.6 = phi i16 [ 1, %4715 ], [ %abort_search.4, %4310 ]
  br label %4748

; <label>:4748                                    ; preds = %4747, %4308
  %mcost.16 = phi i16 [ %mcost.12, %4308 ], [ %mcost.15, %4747 ]
  %abort_search.7 = phi i16 [ %abort_search.5, %4308 ], [ %abort_search.6, %4747 ]
  br label %4749

; <label>:4749                                    ; preds = %4748
  %4750 = sext i16 %y0.1 to i32
  %4751 = add nsw i32 %4750, 4
  %4752 = trunc i32 %4751 to i16
  br label %2630

; <label>:4753                                    ; preds = %2637
  %4754 = load %struct.InputParameters** @input, align 8
  %4755 = getelementptr inbounds %struct.InputParameters* %4754, i32 0, i32 123
  %4756 = load i32* %4755, align 4
  %4757 = icmp ne i32 %4756, 0
  br i1 %4757, label %4758, label %4767

; <label>:4758                                    ; preds = %4753
  %4759 = getelementptr inbounds [16 x [16 x i32]]* %curr_diff, i32 0, i32 0
  %4760 = load %struct.InputParameters** @input, align 8
  %4761 = getelementptr inbounds %struct.InputParameters* %4760, i32 0, i32 6
  %4762 = load i32* %4761, align 4
  %4763 = call i32 @find_SATD([16 x i32]* %4759, i32 %4762, i32 %blocktype)
  %4764 = sext i16 %mcost.9 to i32
  %4765 = add nsw i32 %4764, %4763
  %4766 = trunc i32 %4765 to i16
  br label %4767

; <label>:4767                                    ; preds = %4758, %4753
  %mcost.17 = phi i16 [ %4766, %4758 ], [ %mcost.9, %4753 ]
  %4768 = sext i16 %mcost.17 to i32
  %4769 = icmp slt i32 %4768, %.3
  br i1 %4769, label %4770, label %4772

; <label>:4770                                    ; preds = %4767
  %4771 = sext i16 %mcost.17 to i32
  br label %4772

; <label>:4772                                    ; preds = %4770, %4767
  %best_pos.3 = phi i16 [ %pos.1, %4770 ], [ %best_pos.2, %4767 ]
  %.4 = phi i32 [ %4771, %4770 ], [ %.3, %4767 ]
  br label %4773

; <label>:4773                                    ; preds = %4772
  %4774 = add i16 %pos.1, 1
  br label %2588

; <label>:4775                                    ; preds = %2588
  %4776 = icmp ne i16 %best_pos.2, 0
  br i1 %4776, label %4777, label %4794

; <label>:4777                                    ; preds = %4775
  %4778 = sext i16 %best_pos.2 to i64
  %4779 = load i32** @spiral_search_x, align 8
  %4780 = getelementptr inbounds i32* %4779, i64 %4778
  %4781 = load i32* %4780, align 4
  %4782 = load i16* %mv_x, align 2
  %4783 = sext i16 %4782 to i32
  %4784 = add nsw i32 %4783, %4781
  %4785 = trunc i32 %4784 to i16
  store i16 %4785, i16* %mv_x, align 2
  %4786 = sext i16 %best_pos.2 to i64
  %4787 = load i32** @spiral_search_y, align 8
  %4788 = getelementptr inbounds i32* %4787, i64 %4786
  %4789 = load i32* %4788, align 4
  %4790 = load i16* %mv_y, align 2
  %4791 = sext i16 %4790 to i32
  %4792 = add nsw i32 %4791, %4789
  %4793 = trunc i32 %4792 to i16
  store i16 %4793, i16* %mv_y, align 2
  br label %4794

; <label>:4794                                    ; preds = %4777, %4775
  ret i32 %.3
}

; Function Attrs: nounwind uwtable
define i32 @BPredPartitionCost(i32 %blocktype, i32 %block8x8, i16 signext %fw_ref, i16 signext %bw_ref, i32 %lambda_factor, i32 %list) #0 {
  %diff = alloca [64 x i32], align 16
  %curr_blk = alloca [16 x [16 x i32]], align 16
  %1 = sext i32 %blocktype to i64
  %2 = load %struct.InputParameters** @input, align 8
  %3 = getelementptr inbounds %struct.InputParameters* %2, i32 0, i32 20
  %4 = getelementptr inbounds [8 x [2 x i32]]* %3, i32 0, i64 %1
  %5 = getelementptr inbounds [2 x i32]* %4, i32 0, i64 0
  %6 = load i32* %5, align 4
  %7 = icmp slt i32 %6, 8
  br i1 %7, label %8, label %15

; <label>:8                                       ; preds = %0
  %9 = sext i32 %blocktype to i64
  %10 = load %struct.InputParameters** @input, align 8
  %11 = getelementptr inbounds %struct.InputParameters* %10, i32 0, i32 20
  %12 = getelementptr inbounds [8 x [2 x i32]]* %11, i32 0, i64 %9
  %13 = getelementptr inbounds [2 x i32]* %12, i32 0, i64 0
  %14 = load i32* %13, align 4
  br label %16

; <label>:15                                      ; preds = %0
  br label %16

; <label>:16                                      ; preds = %15, %8
  %17 = phi i32 [ %14, %8 ], [ 8, %15 ]
  %18 = sext i32 %blocktype to i64
  %19 = load %struct.InputParameters** @input, align 8
  %20 = getelementptr inbounds %struct.InputParameters* %19, i32 0, i32 20
  %21 = getelementptr inbounds [8 x [2 x i32]]* %20, i32 0, i64 %18
  %22 = getelementptr inbounds [2 x i32]* %21, i32 0, i64 1
  %23 = load i32* %22, align 4
  %24 = icmp slt i32 %23, 8
  br i1 %24, label %25, label %32

; <label>:25                                      ; preds = %16
  %26 = sext i32 %blocktype to i64
  %27 = load %struct.InputParameters** @input, align 8
  %28 = getelementptr inbounds %struct.InputParameters* %27, i32 0, i32 20
  %29 = getelementptr inbounds [8 x [2 x i32]]* %28, i32 0, i64 %26
  %30 = getelementptr inbounds [2 x i32]* %29, i32 0, i64 1
  %31 = load i32* %30, align 4
  br label %33

; <label>:32                                      ; preds = %16
  br label %33

; <label>:33                                      ; preds = %32, %25
  %34 = phi i32 [ %31, %25 ], [ 8, %32 ]
  %35 = icmp slt i32 %blocktype, 4
  br i1 %35, label %36, label %37

; <label>:36                                      ; preds = %33
  br label %38

; <label>:37                                      ; preds = %33
  br label %38

; <label>:38                                      ; preds = %37, %36
  %39 = phi i32 [ %blocktype, %36 ], [ 4, %37 ]
  %40 = sext i32 %39 to i64
  %41 = load %struct.InputParameters** @input, align 8
  %42 = getelementptr inbounds %struct.InputParameters* %41, i32 0, i32 21
  %43 = getelementptr inbounds [8 x [2 x i32]]* %42, i32 0, i64 %40
  %44 = getelementptr inbounds [2 x i32]* %43, i32 0, i64 0
  %45 = load i32* %44, align 4
  %46 = sext i32 %39 to i64
  %47 = load %struct.InputParameters** @input, align 8
  %48 = getelementptr inbounds %struct.InputParameters* %47, i32 0, i32 21
  %49 = getelementptr inbounds [8 x [2 x i32]]* %48, i32 0, i64 %46
  %50 = getelementptr inbounds [2 x i32]* %49, i32 0, i64 1
  %51 = load i32* %50, align 4
  %52 = sext i32 %blocktype to i64
  %53 = load %struct.InputParameters** @input, align 8
  %54 = getelementptr inbounds %struct.InputParameters* %53, i32 0, i32 21
  %55 = getelementptr inbounds [8 x [2 x i32]]* %54, i32 0, i64 %52
  %56 = getelementptr inbounds [2 x i32]* %55, i32 0, i64 0
  %57 = load i32* %56, align 4
  %58 = sext i32 %blocktype to i64
  %59 = load %struct.InputParameters** @input, align 8
  %60 = getelementptr inbounds %struct.InputParameters* %59, i32 0, i32 21
  %61 = getelementptr inbounds [8 x [2 x i32]]* %60, i32 0, i64 %58
  %62 = getelementptr inbounds [2 x i32]* %61, i32 0, i64 1
  %63 = load i32* %62, align 4
  %64 = icmp ne i32 %list, 0
  br i1 %64, label %65, label %69

; <label>:65                                      ; preds = %38
  %66 = load %struct.ImageParameters** @img, align 8
  %67 = getelementptr inbounds %struct.ImageParameters* %66, i32 0, i32 72
  %68 = load i16******* %67, align 8
  br label %73

; <label>:69                                      ; preds = %38
  %70 = load %struct.ImageParameters** @img, align 8
  %71 = getelementptr inbounds %struct.ImageParameters* %70, i32 0, i32 73
  %72 = load i16******* %71, align 8
  br label %73

; <label>:73                                      ; preds = %69, %65
  %74 = phi i16****** [ %68, %65 ], [ %72, %69 ]
  %75 = load %struct.ImageParameters** @img, align 8
  %76 = getelementptr inbounds %struct.ImageParameters* %75, i32 0, i32 70
  %77 = load i16******* %76, align 8
  %78 = sext i32 %block8x8 to i64
  %79 = sext i32 %39 to i64
  %80 = getelementptr inbounds [5 x [4 x i32]]* @BPredPartitionCost.by0, i32 0, i64 %79
  %81 = getelementptr inbounds [4 x i32]* %80, i32 0, i64 %78
  %82 = load i32* %81, align 4
  br label %83

; <label>:83                                      ; preds = %269, %73
  %v.0 = phi i32 [ %82, %73 ], [ %270, %269 ]
  %mvd_bits.0 = phi i32 [ 0, %73 ], [ %mvd_bits.1, %269 ]
  %84 = sext i32 %block8x8 to i64
  %85 = sext i32 %39 to i64
  %86 = getelementptr inbounds [5 x [4 x i32]]* @BPredPartitionCost.by0, i32 0, i64 %85
  %87 = getelementptr inbounds [4 x i32]* %86, i32 0, i64 %84
  %88 = load i32* %87, align 4
  %89 = add nsw i32 %88, %51
  %90 = icmp slt i32 %v.0, %89
  br i1 %90, label %91, label %271

; <label>:91                                      ; preds = %83
  %92 = sext i32 %block8x8 to i64
  %93 = sext i32 %39 to i64
  %94 = getelementptr inbounds [5 x [4 x i32]]* @BPredPartitionCost.bx0, i32 0, i64 %93
  %95 = getelementptr inbounds [4 x i32]* %94, i32 0, i64 %92
  %96 = load i32* %95, align 4
  br label %97

; <label>:97                                      ; preds = %266, %91
  %h.0 = phi i32 [ %96, %91 ], [ %267, %266 ]
  %mvd_bits.1 = phi i32 [ %mvd_bits.0, %91 ], [ %265, %266 ]
  %98 = sext i32 %block8x8 to i64
  %99 = sext i32 %39 to i64
  %100 = getelementptr inbounds [5 x [4 x i32]]* @BPredPartitionCost.bx0, i32 0, i64 %99
  %101 = getelementptr inbounds [4 x i32]* %100, i32 0, i64 %98
  %102 = load i32* %101, align 4
  %103 = add nsw i32 %102, %45
  %104 = icmp slt i32 %h.0, %103
  br i1 %104, label %105, label %268

; <label>:105                                     ; preds = %97
  %106 = sext i32 %blocktype to i64
  %107 = sext i16 %fw_ref to i64
  %108 = sext i32 %v.0 to i64
  %109 = sext i32 %h.0 to i64
  %110 = getelementptr inbounds i16****** %74, i64 %109
  %111 = load i16****** %110, align 8
  %112 = getelementptr inbounds i16***** %111, i64 %108
  %113 = load i16***** %112, align 8
  %114 = getelementptr inbounds i16**** %113, i64 0
  %115 = load i16**** %114, align 8
  %116 = getelementptr inbounds i16*** %115, i64 %107
  %117 = load i16*** %116, align 8
  %118 = getelementptr inbounds i16** %117, i64 %106
  %119 = load i16** %118, align 8
  %120 = getelementptr inbounds i16* %119, i64 0
  %121 = load i16* %120, align 2
  %122 = sext i16 %121 to i32
  %123 = sext i32 %blocktype to i64
  %124 = sext i16 %fw_ref to i64
  %125 = sext i32 %v.0 to i64
  %126 = sext i32 %h.0 to i64
  %127 = getelementptr inbounds i16****** %77, i64 %126
  %128 = load i16****** %127, align 8
  %129 = getelementptr inbounds i16***** %128, i64 %125
  %130 = load i16***** %129, align 8
  %131 = getelementptr inbounds i16**** %130, i64 0
  %132 = load i16**** %131, align 8
  %133 = getelementptr inbounds i16*** %132, i64 %124
  %134 = load i16*** %133, align 8
  %135 = getelementptr inbounds i16** %134, i64 %123
  %136 = load i16** %135, align 8
  %137 = getelementptr inbounds i16* %136, i64 0
  %138 = load i16* %137, align 2
  %139 = sext i16 %138 to i32
  %140 = sub nsw i32 %122, %139
  %141 = sext i32 %140 to i64
  %142 = load i32** @mvbits, align 8
  %143 = getelementptr inbounds i32* %142, i64 %141
  %144 = load i32* %143, align 4
  %145 = add nsw i32 %mvd_bits.1, %144
  %146 = sext i32 %blocktype to i64
  %147 = sext i16 %fw_ref to i64
  %148 = sext i32 %v.0 to i64
  %149 = sext i32 %h.0 to i64
  %150 = getelementptr inbounds i16****** %74, i64 %149
  %151 = load i16****** %150, align 8
  %152 = getelementptr inbounds i16***** %151, i64 %148
  %153 = load i16***** %152, align 8
  %154 = getelementptr inbounds i16**** %153, i64 0
  %155 = load i16**** %154, align 8
  %156 = getelementptr inbounds i16*** %155, i64 %147
  %157 = load i16*** %156, align 8
  %158 = getelementptr inbounds i16** %157, i64 %146
  %159 = load i16** %158, align 8
  %160 = getelementptr inbounds i16* %159, i64 1
  %161 = load i16* %160, align 2
  %162 = sext i16 %161 to i32
  %163 = sext i32 %blocktype to i64
  %164 = sext i16 %fw_ref to i64
  %165 = sext i32 %v.0 to i64
  %166 = sext i32 %h.0 to i64
  %167 = getelementptr inbounds i16****** %77, i64 %166
  %168 = load i16****** %167, align 8
  %169 = getelementptr inbounds i16***** %168, i64 %165
  %170 = load i16***** %169, align 8
  %171 = getelementptr inbounds i16**** %170, i64 0
  %172 = load i16**** %171, align 8
  %173 = getelementptr inbounds i16*** %172, i64 %164
  %174 = load i16*** %173, align 8
  %175 = getelementptr inbounds i16** %174, i64 %163
  %176 = load i16** %175, align 8
  %177 = getelementptr inbounds i16* %176, i64 1
  %178 = load i16* %177, align 2
  %179 = sext i16 %178 to i32
  %180 = sub nsw i32 %162, %179
  %181 = sext i32 %180 to i64
  %182 = load i32** @mvbits, align 8
  %183 = getelementptr inbounds i32* %182, i64 %181
  %184 = load i32* %183, align 4
  %185 = add nsw i32 %145, %184
  %186 = sext i32 %blocktype to i64
  %187 = sext i16 %bw_ref to i64
  %188 = sext i32 %v.0 to i64
  %189 = sext i32 %h.0 to i64
  %190 = getelementptr inbounds i16****** %74, i64 %189
  %191 = load i16****** %190, align 8
  %192 = getelementptr inbounds i16***** %191, i64 %188
  %193 = load i16***** %192, align 8
  %194 = getelementptr inbounds i16**** %193, i64 1
  %195 = load i16**** %194, align 8
  %196 = getelementptr inbounds i16*** %195, i64 %187
  %197 = load i16*** %196, align 8
  %198 = getelementptr inbounds i16** %197, i64 %186
  %199 = load i16** %198, align 8
  %200 = getelementptr inbounds i16* %199, i64 0
  %201 = load i16* %200, align 2
  %202 = sext i16 %201 to i32
  %203 = sext i32 %blocktype to i64
  %204 = sext i16 %bw_ref to i64
  %205 = sext i32 %v.0 to i64
  %206 = sext i32 %h.0 to i64
  %207 = getelementptr inbounds i16****** %77, i64 %206
  %208 = load i16****** %207, align 8
  %209 = getelementptr inbounds i16***** %208, i64 %205
  %210 = load i16***** %209, align 8
  %211 = getelementptr inbounds i16**** %210, i64 1
  %212 = load i16**** %211, align 8
  %213 = getelementptr inbounds i16*** %212, i64 %204
  %214 = load i16*** %213, align 8
  %215 = getelementptr inbounds i16** %214, i64 %203
  %216 = load i16** %215, align 8
  %217 = getelementptr inbounds i16* %216, i64 0
  %218 = load i16* %217, align 2
  %219 = sext i16 %218 to i32
  %220 = sub nsw i32 %202, %219
  %221 = sext i32 %220 to i64
  %222 = load i32** @mvbits, align 8
  %223 = getelementptr inbounds i32* %222, i64 %221
  %224 = load i32* %223, align 4
  %225 = add nsw i32 %185, %224
  %226 = sext i32 %blocktype to i64
  %227 = sext i16 %bw_ref to i64
  %228 = sext i32 %v.0 to i64
  %229 = sext i32 %h.0 to i64
  %230 = getelementptr inbounds i16****** %74, i64 %229
  %231 = load i16****** %230, align 8
  %232 = getelementptr inbounds i16***** %231, i64 %228
  %233 = load i16***** %232, align 8
  %234 = getelementptr inbounds i16**** %233, i64 1
  %235 = load i16**** %234, align 8
  %236 = getelementptr inbounds i16*** %235, i64 %227
  %237 = load i16*** %236, align 8
  %238 = getelementptr inbounds i16** %237, i64 %226
  %239 = load i16** %238, align 8
  %240 = getelementptr inbounds i16* %239, i64 1
  %241 = load i16* %240, align 2
  %242 = sext i16 %241 to i32
  %243 = sext i32 %blocktype to i64
  %244 = sext i16 %bw_ref to i64
  %245 = sext i32 %v.0 to i64
  %246 = sext i32 %h.0 to i64
  %247 = getelementptr inbounds i16****** %77, i64 %246
  %248 = load i16****** %247, align 8
  %249 = getelementptr inbounds i16***** %248, i64 %245
  %250 = load i16***** %249, align 8
  %251 = getelementptr inbounds i16**** %250, i64 1
  %252 = load i16**** %251, align 8
  %253 = getelementptr inbounds i16*** %252, i64 %244
  %254 = load i16*** %253, align 8
  %255 = getelementptr inbounds i16** %254, i64 %243
  %256 = load i16** %255, align 8
  %257 = getelementptr inbounds i16* %256, i64 1
  %258 = load i16* %257, align 2
  %259 = sext i16 %258 to i32
  %260 = sub nsw i32 %242, %259
  %261 = sext i32 %260 to i64
  %262 = load i32** @mvbits, align 8
  %263 = getelementptr inbounds i32* %262, i64 %261
  %264 = load i32* %263, align 4
  %265 = add nsw i32 %225, %264
  br label %266

; <label>:266                                     ; preds = %105
  %267 = add nsw i32 %h.0, %57
  br label %97

; <label>:268                                     ; preds = %97
  br label %269

; <label>:269                                     ; preds = %268
  %270 = add nsw i32 %v.0, %63
  br label %83

; <label>:271                                     ; preds = %83
  %272 = mul nsw i32 %lambda_factor, %mvd_bits.0
  %273 = ashr i32 %272, 16
  %274 = sext i32 %block8x8 to i64
  %275 = sext i32 %39 to i64
  %276 = getelementptr inbounds [5 x [4 x i32]]* @BPredPartitionCost.by0, i32 0, i64 %275
  %277 = getelementptr inbounds [4 x i32]* %276, i32 0, i64 %274
  %278 = load i32* %277, align 4
  br label %279

; <label>:279                                     ; preds = %372, %271
  %v.1 = phi i32 [ %278, %271 ], [ %374, %372 ]
  %mcost.0 = phi i32 [ %273, %271 ], [ %mcost.1, %372 ]
  %byy.0 = phi i32 [ 0, %271 ], [ %373, %372 ]
  %280 = sext i32 %block8x8 to i64
  %281 = sext i32 %39 to i64
  %282 = getelementptr inbounds [5 x [4 x i32]]* @BPredPartitionCost.by0, i32 0, i64 %281
  %283 = getelementptr inbounds [4 x i32]* %282, i32 0, i64 %280
  %284 = load i32* %283, align 4
  %285 = add nsw i32 %284, %51
  %286 = icmp slt i32 %v.1, %285
  br i1 %286, label %287, label %375

; <label>:287                                     ; preds = %279
  %288 = load %struct.ImageParameters** @img, align 8
  %289 = getelementptr inbounds %struct.ImageParameters* %288, i32 0, i32 38
  %290 = load i32* %289, align 4
  %291 = shl i32 %v.1, 2
  %292 = add nsw i32 %290, %291
  %293 = sext i32 %block8x8 to i64
  %294 = sext i32 %39 to i64
  %295 = getelementptr inbounds [5 x [4 x i32]]* @BPredPartitionCost.bx0, i32 0, i64 %294
  %296 = getelementptr inbounds [4 x i32]* %295, i32 0, i64 %293
  %297 = load i32* %296, align 4
  br label %298

; <label>:298                                     ; preds = %368, %287
  %h.1 = phi i32 [ %297, %287 ], [ %370, %368 ]
  %mcost.1 = phi i32 [ %mcost.0, %287 ], [ %mcost.2, %368 ]
  %bxx.0 = phi i32 [ 0, %287 ], [ %369, %368 ]
  %299 = sext i32 %block8x8 to i64
  %300 = sext i32 %39 to i64
  %301 = getelementptr inbounds [5 x [4 x i32]]* @BPredPartitionCost.bx0, i32 0, i64 %300
  %302 = getelementptr inbounds [4 x i32]* %301, i32 0, i64 %299
  %303 = load i32* %302, align 4
  %304 = add nsw i32 %303, %45
  %305 = icmp slt i32 %h.1, %304
  br i1 %305, label %306, label %371

; <label>:306                                     ; preds = %298
  %307 = load %struct.ImageParameters** @img, align 8
  %308 = getelementptr inbounds %struct.ImageParameters* %307, i32 0, i32 37
  %309 = load i32* %308, align 4
  %310 = shl i32 %h.1, 2
  %311 = add nsw i32 %309, %310
  call void @LumaPrediction4x4Bi(i32 %310, i32 %291, i32 2, i32 %blocktype, i32 %blocktype, i16 signext %fw_ref, i16 signext %bw_ref, i32 %list)
  br label %312

; <label>:312                                     ; preds = %351, %306
  %j.0 = phi i32 [ 0, %306 ], [ %352, %351 ]
  %k.0 = phi i32 [ 0, %306 ], [ %k.1, %351 ]
  %313 = icmp slt i32 %j.0, 4
  br i1 %313, label %314, label %353

; <label>:314                                     ; preds = %312
  br label %315

; <label>:315                                     ; preds = %347, %314
  %i.0 = phi i32 [ 0, %314 ], [ %348, %347 ]
  %k.1 = phi i32 [ %k.0, %314 ], [ %349, %347 ]
  %316 = icmp slt i32 %i.0, 4
  br i1 %316, label %317, label %350

; <label>:317                                     ; preds = %315
  %318 = add nsw i32 %311, %i.0
  %319 = sext i32 %318 to i64
  %320 = add nsw i32 %292, %j.0
  %321 = sext i32 %320 to i64
  %322 = load i16*** @imgY_org, align 8
  %323 = getelementptr inbounds i16** %322, i64 %321
  %324 = load i16** %323, align 8
  %325 = getelementptr inbounds i16* %324, i64 %319
  %326 = load i16* %325, align 2
  %327 = zext i16 %326 to i32
  %328 = add nsw i32 %j.0, %291
  %329 = sext i32 %328 to i64
  %330 = add nsw i32 %i.0, %310
  %331 = sext i32 %330 to i64
  %332 = load %struct.ImageParameters** @img, align 8
  %333 = getelementptr inbounds %struct.ImageParameters* %332, i32 0, i32 45
  %334 = getelementptr inbounds [16 x [16 x i16]]* %333, i32 0, i64 %331
  %335 = getelementptr inbounds [16 x i16]* %334, i32 0, i64 %329
  %336 = load i16* %335, align 2
  %337 = zext i16 %336 to i32
  %338 = sub nsw i32 %327, %337
  %339 = add nsw i32 %bxx.0, %i.0
  %340 = sext i32 %339 to i64
  %341 = add nsw i32 %byy.0, %j.0
  %342 = sext i32 %341 to i64
  %343 = getelementptr inbounds [16 x [16 x i32]]* %curr_blk, i32 0, i64 %342
  %344 = getelementptr inbounds [16 x i32]* %343, i32 0, i64 %340
  store i32 %338, i32* %344, align 4
  %345 = sext i32 %k.1 to i64
  %346 = getelementptr inbounds [64 x i32]* %diff, i32 0, i64 %345
  store i32 %338, i32* %346, align 4
  br label %347

; <label>:347                                     ; preds = %317
  %348 = add nsw i32 %i.0, 1
  %349 = add nsw i32 %k.1, 1
  br label %315

; <label>:350                                     ; preds = %315
  br label %351

; <label>:351                                     ; preds = %350
  %352 = add nsw i32 %j.0, 1
  br label %312

; <label>:353                                     ; preds = %312
  %354 = load %struct.InputParameters** @input, align 8
  %355 = getelementptr inbounds %struct.InputParameters* %354, i32 0, i32 123
  %356 = load i32* %355, align 4
  %357 = icmp ne i32 %356, 0
  br i1 %357, label %358, label %360

; <label>:358                                     ; preds = %353
  %359 = icmp sgt i32 %blocktype, 4
  br i1 %359, label %360, label %367

; <label>:360                                     ; preds = %358, %353
  %361 = getelementptr inbounds [64 x i32]* %diff, i32 0, i32 0
  %362 = load %struct.InputParameters** @input, align 8
  %363 = getelementptr inbounds %struct.InputParameters* %362, i32 0, i32 6
  %364 = load i32* %363, align 4
  %365 = call i32 @SATD(i32* %361, i32 %364)
  %366 = add nsw i32 %mcost.1, %365
  br label %367

; <label>:367                                     ; preds = %360, %358
  %mcost.2 = phi i32 [ %366, %360 ], [ %mcost.1, %358 ]
  br label %368

; <label>:368                                     ; preds = %367
  %369 = add nsw i32 %bxx.0, 4
  %370 = add nsw i32 %h.1, 1
  br label %298

; <label>:371                                     ; preds = %298
  br label %372

; <label>:372                                     ; preds = %371
  %373 = add nsw i32 %byy.0, 4
  %374 = add nsw i32 %v.1, 1
  br label %279

; <label>:375                                     ; preds = %279
  %376 = load %struct.InputParameters** @input, align 8
  %377 = getelementptr inbounds %struct.InputParameters* %376, i32 0, i32 123
  %378 = load i32* %377, align 4
  %379 = icmp ne i32 %378, 0
  br i1 %379, label %380, label %435

; <label>:380                                     ; preds = %375
  %381 = icmp sle i32 %blocktype, 4
  br i1 %381, label %382, label %435

; <label>:382                                     ; preds = %380
  br label %383

; <label>:383                                     ; preds = %432, %382
  %mcost.3 = phi i32 [ %mcost.0, %382 ], [ %mcost.4, %432 ]
  %byy.1 = phi i32 [ 0, %382 ], [ %433, %432 ]
  %384 = sext i32 %39 to i64
  %385 = load %struct.InputParameters** @input, align 8
  %386 = getelementptr inbounds %struct.InputParameters* %385, i32 0, i32 20
  %387 = getelementptr inbounds [8 x [2 x i32]]* %386, i32 0, i64 %384
  %388 = getelementptr inbounds [2 x i32]* %387, i32 0, i64 1
  %389 = load i32* %388, align 4
  %390 = icmp slt i32 %byy.1, %389
  br i1 %390, label %391, label %434

; <label>:391                                     ; preds = %383
  br label %392

; <label>:392                                     ; preds = %429, %391
  %mcost.4 = phi i32 [ %mcost.3, %391 ], [ %428, %429 ]
  %bxx.1 = phi i32 [ 0, %391 ], [ %430, %429 ]
  %393 = sext i32 %39 to i64
  %394 = load %struct.InputParameters** @input, align 8
  %395 = getelementptr inbounds %struct.InputParameters* %394, i32 0, i32 20
  %396 = getelementptr inbounds [8 x [2 x i32]]* %395, i32 0, i64 %393
  %397 = getelementptr inbounds [2 x i32]* %396, i32 0, i64 0
  %398 = load i32* %397, align 4
  %399 = icmp slt i32 %bxx.1, %398
  br i1 %399, label %400, label %431

; <label>:400                                     ; preds = %392
  br label %401

; <label>:401                                     ; preds = %420, %400
  %i.1 = phi i32 [ 0, %400 ], [ %421, %420 ]
  %k.2 = phi i32 [ 0, %400 ], [ %k.3, %420 ]
  %402 = icmp slt i32 %i.1, 8
  br i1 %402, label %403, label %422

; <label>:403                                     ; preds = %401
  br label %404

; <label>:404                                     ; preds = %417, %403
  %j.1 = phi i32 [ 0, %403 ], [ %418, %417 ]
  %k.3 = phi i32 [ %k.2, %403 ], [ %414, %417 ]
  %405 = icmp slt i32 %j.1, 8
  br i1 %405, label %406, label %419

; <label>:406                                     ; preds = %404
  %407 = add nsw i32 %j.1, %bxx.1
  %408 = sext i32 %407 to i64
  %409 = add nsw i32 %i.1, %byy.1
  %410 = sext i32 %409 to i64
  %411 = getelementptr inbounds [16 x [16 x i32]]* %curr_blk, i32 0, i64 %410
  %412 = getelementptr inbounds [16 x i32]* %411, i32 0, i64 %408
  %413 = load i32* %412, align 4
  %414 = add nsw i32 %k.3, 1
  %415 = sext i32 %k.3 to i64
  %416 = getelementptr inbounds [64 x i32]* %diff, i32 0, i64 %415
  store i32 %413, i32* %416, align 4
  br label %417

; <label>:417                                     ; preds = %406
  %418 = add nsw i32 %j.1, 1
  br label %404

; <label>:419                                     ; preds = %404
  br label %420

; <label>:420                                     ; preds = %419
  %421 = add nsw i32 %i.1, 1
  br label %401

; <label>:422                                     ; preds = %401
  %423 = getelementptr inbounds [64 x i32]* %diff, i32 0, i32 0
  %424 = load %struct.InputParameters** @input, align 8
  %425 = getelementptr inbounds %struct.InputParameters* %424, i32 0, i32 6
  %426 = load i32* %425, align 4
  %427 = call i32 @SATD8X8(i32* %423, i32 %426)
  %428 = add nsw i32 %mcost.4, %427
  br label %429

; <label>:429                                     ; preds = %422
  %430 = add nsw i32 %bxx.1, %17
  br label %392

; <label>:431                                     ; preds = %392
  br label %432

; <label>:432                                     ; preds = %431
  %433 = add nsw i32 %byy.1, %34
  br label %383

; <label>:434                                     ; preds = %383
  br label %435

; <label>:435                                     ; preds = %434, %380, %375
  %mcost.5 = phi i32 [ %mcost.3, %434 ], [ %mcost.0, %380 ], [ %mcost.0, %375 ]
  ret i32 %mcost.5
}

declare void @LumaPrediction4x4Bi(i32, i32, i32, i32, i32, i16 signext, i16 signext, i32) #2

; Function Attrs: nounwind uwtable
define i32 @BlockMotionSearch(i16 signext %ref, i32 %list, i32 %mb_x, i32 %mb_y, i32 %blocktype, i32 %search_range, double %lambda) #0 {
  %mv_x = alloca i16, align 2
  %mv_y = alloca i16, align 2
  %tstruct1 = alloca %struct.timeb, align 8
  %tstruct2 = alloca %struct.timeb, align 8
  %bimv_x = alloca i16, align 2
  %bimv_y = alloca i16, align 2
  %tempmv_x = alloca i16, align 2
  %tempmv_y = alloca i16, align 2
  %pred_mv_bi = alloca [2 x i16], align 2
  %1 = ashr i32 %mb_x, 2
  %2 = ashr i32 %mb_y, 2
  %3 = sext i32 %blocktype to i64
  %4 = load %struct.InputParameters** @input, align 8
  %5 = getelementptr inbounds %struct.InputParameters* %4, i32 0, i32 20
  %6 = getelementptr inbounds [8 x [2 x i32]]* %5, i32 0, i64 %3
  %7 = getelementptr inbounds [2 x i32]* %6, i32 0, i64 0
  %8 = load i32* %7, align 4
  %9 = sext i32 %blocktype to i64
  %10 = load %struct.InputParameters** @input, align 8
  %11 = getelementptr inbounds %struct.InputParameters* %10, i32 0, i32 20
  %12 = getelementptr inbounds [8 x [2 x i32]]* %11, i32 0, i64 %9
  %13 = getelementptr inbounds [2 x i32]* %12, i32 0, i64 1
  %14 = load i32* %13, align 4
  %15 = load %struct.ImageParameters** @img, align 8
  %16 = getelementptr inbounds %struct.ImageParameters* %15, i32 0, i32 37
  %17 = load i32* %16, align 4
  %18 = add nsw i32 %17, %mb_x
  %19 = load %struct.ImageParameters** @img, align 8
  %20 = getelementptr inbounds %struct.ImageParameters* %19, i32 0, i32 38
  %21 = load i32* %20, align 4
  %22 = add nsw i32 %21, %mb_y
  %23 = sext i32 %list to i64
  %24 = load %struct.storable_picture** @enc_picture, align 8
  %25 = getelementptr inbounds %struct.storable_picture* %24, i32 0, i32 35
  %26 = load i16***** %25, align 8
  %27 = getelementptr inbounds i16**** %26, i64 %23
  %28 = load i16**** %27, align 8
  %29 = load %struct.ImageParameters** @img, align 8
  %30 = getelementptr inbounds %struct.ImageParameters* %29, i32 0, i32 71
  %31 = load i16******* %30, align 8
  %32 = call i32 @ftime(%struct.timeb* %tstruct1)
  %33 = load %struct.InputParameters** @input, align 8
  %34 = getelementptr inbounds %struct.InputParameters* %33, i32 0, i32 134
  %35 = load i32* %34, align 4
  %36 = icmp ne i32 %35, 0
  br i1 %36, label %37, label %49

; <label>:37                                      ; preds = %0
  %38 = load %struct.InputParameters** @input, align 8
  %39 = getelementptr inbounds %struct.InputParameters* %38, i32 0, i32 34
  %40 = load i32* %39, align 4
  %41 = icmp ne i32 %40, 0
  br i1 %41, label %42, label %46

; <label>:42                                      ; preds = %37
  %43 = load i32* @Bframe_ctr, align 4
  %44 = srem i32 %43, %40
  %45 = add nsw i32 %44, 1
  br label %47

; <label>:46                                      ; preds = %37
  br label %47

; <label>:47                                      ; preds = %46, %42
  %48 = phi i32 [ %45, %42 ], [ 0, %46 ]
  br label %49

; <label>:49                                      ; preds = %47, %0
  %N_Bframe.0 = phi i32 [ %40, %47 ], [ 0, %0 ]
  %n_Bframe.0 = phi i32 [ %48, %47 ], [ 0, %0 ]
  %50 = sext i32 %blocktype to i64
  %51 = sext i16 %ref to i64
  %52 = sext i32 %list to i64
  %53 = sext i32 %2 to i64
  %54 = sext i32 %1 to i64
  %55 = load %struct.ImageParameters** @img, align 8
  %56 = getelementptr inbounds %struct.ImageParameters* %55, i32 0, i32 70
  %57 = load i16******* %56, align 8
  %58 = getelementptr inbounds i16****** %57, i64 %54
  %59 = load i16****** %58, align 8
  %60 = getelementptr inbounds i16***** %59, i64 %53
  %61 = load i16***** %60, align 8
  %62 = getelementptr inbounds i16**** %61, i64 %52
  %63 = load i16**** %62, align 8
  %64 = getelementptr inbounds i16*** %63, i64 %51
  %65 = load i16*** %64, align 8
  %66 = getelementptr inbounds i16** %65, i64 %50
  %67 = load i16** %66, align 8
  br label %68

; <label>:68                                      ; preds = %91, %49
  %j.0 = phi i32 [ 0, %49 ], [ %92, %91 ]
  %69 = icmp slt i32 %j.0, %14
  br i1 %69, label %70, label %93

; <label>:70                                      ; preds = %68
  br label %71

; <label>:71                                      ; preds = %88, %70
  %i.0 = phi i32 [ 0, %70 ], [ %89, %88 ]
  %72 = icmp slt i32 %i.0, %8
  br i1 %72, label %73, label %90

; <label>:73                                      ; preds = %71
  %74 = add nsw i32 %18, %i.0
  %75 = sext i32 %74 to i64
  %76 = add nsw i32 %22, %j.0
  %77 = sext i32 %76 to i64
  %78 = load i16*** @imgY_org, align 8
  %79 = getelementptr inbounds i16** %78, i64 %77
  %80 = load i16** %79, align 8
  %81 = getelementptr inbounds i16* %80, i64 %75
  %82 = load i16* %81, align 2
  %83 = sext i32 %i.0 to i64
  %84 = sext i32 %j.0 to i64
  %85 = getelementptr inbounds [16 x i16*]* @BlockMotionSearch.orig_pic, i32 0, i64 %84
  %86 = load i16** %85, align 8
  %87 = getelementptr inbounds i16* %86, i64 %83
  store i16 %82, i16* %87, align 2
  br label %88

; <label>:88                                      ; preds = %73
  %89 = add nsw i32 %i.0, 1
  br label %71

; <label>:90                                      ; preds = %71
  br label %91

; <label>:91                                      ; preds = %90
  %92 = add nsw i32 %j.0, 1
  br label %68

; <label>:93                                      ; preds = %68
  %94 = load %struct.InputParameters** @input, align 8
  %95 = getelementptr inbounds %struct.InputParameters* %94, i32 0, i32 134
  %96 = load i32* %95, align 4
  %97 = icmp ne i32 %96, 0
  br i1 %97, label %98, label %1499

; <label>:98                                      ; preds = %93
  %99 = icmp sgt i32 %blocktype, 6
  br i1 %99, label %100, label %189

; <label>:100                                     ; preds = %98
  %101 = sext i16 %ref to i64
  %102 = sext i32 %list to i64
  %103 = sext i32 %2 to i64
  %104 = sext i32 %1 to i64
  %105 = getelementptr inbounds i16****** %31, i64 %104
  %106 = load i16****** %105, align 8
  %107 = getelementptr inbounds i16***** %106, i64 %103
  %108 = load i16***** %107, align 8
  %109 = getelementptr inbounds i16**** %108, i64 %102
  %110 = load i16**** %109, align 8
  %111 = getelementptr inbounds i16*** %110, i64 %101
  %112 = load i16*** %111, align 8
  %113 = getelementptr inbounds i16** %112, i64 5
  %114 = load i16** %113, align 8
  %115 = getelementptr inbounds i16* %114, i64 0
  %116 = load i16* %115, align 2
  %117 = sext i16 %116 to i32
  store i32 %117, i32* getelementptr inbounds ([2 x i32]* @pred_MV_uplayer, i32 0, i64 0), align 4
  %118 = sext i16 %ref to i64
  %119 = sext i32 %list to i64
  %120 = sext i32 %2 to i64
  %121 = sext i32 %1 to i64
  %122 = getelementptr inbounds i16****** %31, i64 %121
  %123 = load i16****** %122, align 8
  %124 = getelementptr inbounds i16***** %123, i64 %120
  %125 = load i16***** %124, align 8
  %126 = getelementptr inbounds i16**** %125, i64 %119
  %127 = load i16**** %126, align 8
  %128 = getelementptr inbounds i16*** %127, i64 %118
  %129 = load i16*** %128, align 8
  %130 = getelementptr inbounds i16** %129, i64 5
  %131 = load i16** %130, align 8
  %132 = getelementptr inbounds i16* %131, i64 1
  %133 = load i16* %132, align 2
  %134 = sext i16 %133 to i32
  store i32 %134, i32* getelementptr inbounds ([2 x i32]* @pred_MV_uplayer, i32 0, i64 1), align 4
  %135 = icmp eq i32 %list, 1
  br i1 %135, label %136, label %160

; <label>:136                                     ; preds = %100
  %137 = load %struct.ImageParameters** @img, align 8
  %138 = getelementptr inbounds %struct.ImageParameters* %137, i32 0, i32 34
  %139 = load i32* %138, align 4
  %140 = ashr i32 %139, 2
  %141 = add nsw i32 %140, %2
  %142 = sext i32 %141 to i64
  %143 = load %struct.ImageParameters** @img, align 8
  %144 = getelementptr inbounds %struct.ImageParameters* %143, i32 0, i32 33
  %145 = load i32* %144, align 4
  %146 = ashr i32 %145, 2
  %147 = add nsw i32 %146, %1
  %148 = sext i32 %147 to i64
  %149 = load i32****** @all_bwmincost, align 8
  %150 = getelementptr inbounds i32***** %149, i64 %148
  %151 = load i32***** %150, align 8
  %152 = getelementptr inbounds i32**** %151, i64 %142
  %153 = load i32**** %152, align 8
  %154 = getelementptr inbounds i32*** %153, i64 0
  %155 = load i32*** %154, align 8
  %156 = getelementptr inbounds i32** %155, i64 5
  %157 = load i32** %156, align 8
  %158 = getelementptr inbounds i32* %157, i64 0
  %159 = load i32* %158, align 4
  br label %185

; <label>:160                                     ; preds = %100
  %161 = sext i16 %ref to i64
  %162 = load %struct.ImageParameters** @img, align 8
  %163 = getelementptr inbounds %struct.ImageParameters* %162, i32 0, i32 34
  %164 = load i32* %163, align 4
  %165 = ashr i32 %164, 2
  %166 = add nsw i32 %165, %2
  %167 = sext i32 %166 to i64
  %168 = load %struct.ImageParameters** @img, align 8
  %169 = getelementptr inbounds %struct.ImageParameters* %168, i32 0, i32 33
  %170 = load i32* %169, align 4
  %171 = ashr i32 %170, 2
  %172 = add nsw i32 %171, %1
  %173 = sext i32 %172 to i64
  %174 = load i32****** @all_mincost, align 8
  %175 = getelementptr inbounds i32***** %174, i64 %173
  %176 = load i32***** %175, align 8
  %177 = getelementptr inbounds i32**** %176, i64 %167
  %178 = load i32**** %177, align 8
  %179 = getelementptr inbounds i32*** %178, i64 %161
  %180 = load i32*** %179, align 8
  %181 = getelementptr inbounds i32** %180, i64 5
  %182 = load i32** %181, align 8
  %183 = getelementptr inbounds i32* %182, i64 0
  %184 = load i32* %183, align 4
  br label %185

; <label>:185                                     ; preds = %160, %136
  %186 = phi i32 [ %159, %136 ], [ %184, %160 ]
  store i32 %186, i32* @pred_SAD_uplayer, align 4
  %187 = load i32* @pred_SAD_uplayer, align 4
  %188 = sdiv i32 %187, 2
  store i32 %188, i32* @pred_SAD_uplayer, align 4
  br label %465

; <label>:189                                     ; preds = %98
  %190 = icmp sgt i32 %blocktype, 4
  br i1 %190, label %191, label %280

; <label>:191                                     ; preds = %189
  %192 = sext i16 %ref to i64
  %193 = sext i32 %list to i64
  %194 = sext i32 %2 to i64
  %195 = sext i32 %1 to i64
  %196 = getelementptr inbounds i16****** %31, i64 %195
  %197 = load i16****** %196, align 8
  %198 = getelementptr inbounds i16***** %197, i64 %194
  %199 = load i16***** %198, align 8
  %200 = getelementptr inbounds i16**** %199, i64 %193
  %201 = load i16**** %200, align 8
  %202 = getelementptr inbounds i16*** %201, i64 %192
  %203 = load i16*** %202, align 8
  %204 = getelementptr inbounds i16** %203, i64 4
  %205 = load i16** %204, align 8
  %206 = getelementptr inbounds i16* %205, i64 0
  %207 = load i16* %206, align 2
  %208 = sext i16 %207 to i32
  store i32 %208, i32* getelementptr inbounds ([2 x i32]* @pred_MV_uplayer, i32 0, i64 0), align 4
  %209 = sext i16 %ref to i64
  %210 = sext i32 %list to i64
  %211 = sext i32 %2 to i64
  %212 = sext i32 %1 to i64
  %213 = getelementptr inbounds i16****** %31, i64 %212
  %214 = load i16****** %213, align 8
  %215 = getelementptr inbounds i16***** %214, i64 %211
  %216 = load i16***** %215, align 8
  %217 = getelementptr inbounds i16**** %216, i64 %210
  %218 = load i16**** %217, align 8
  %219 = getelementptr inbounds i16*** %218, i64 %209
  %220 = load i16*** %219, align 8
  %221 = getelementptr inbounds i16** %220, i64 4
  %222 = load i16** %221, align 8
  %223 = getelementptr inbounds i16* %222, i64 1
  %224 = load i16* %223, align 2
  %225 = sext i16 %224 to i32
  store i32 %225, i32* getelementptr inbounds ([2 x i32]* @pred_MV_uplayer, i32 0, i64 1), align 4
  %226 = icmp eq i32 %list, 1
  br i1 %226, label %227, label %251

; <label>:227                                     ; preds = %191
  %228 = load %struct.ImageParameters** @img, align 8
  %229 = getelementptr inbounds %struct.ImageParameters* %228, i32 0, i32 34
  %230 = load i32* %229, align 4
  %231 = ashr i32 %230, 2
  %232 = add nsw i32 %231, %2
  %233 = sext i32 %232 to i64
  %234 = load %struct.ImageParameters** @img, align 8
  %235 = getelementptr inbounds %struct.ImageParameters* %234, i32 0, i32 33
  %236 = load i32* %235, align 4
  %237 = ashr i32 %236, 2
  %238 = add nsw i32 %237, %1
  %239 = sext i32 %238 to i64
  %240 = load i32****** @all_bwmincost, align 8
  %241 = getelementptr inbounds i32***** %240, i64 %239
  %242 = load i32***** %241, align 8
  %243 = getelementptr inbounds i32**** %242, i64 %233
  %244 = load i32**** %243, align 8
  %245 = getelementptr inbounds i32*** %244, i64 0
  %246 = load i32*** %245, align 8
  %247 = getelementptr inbounds i32** %246, i64 4
  %248 = load i32** %247, align 8
  %249 = getelementptr inbounds i32* %248, i64 0
  %250 = load i32* %249, align 4
  br label %276

; <label>:251                                     ; preds = %191
  %252 = sext i16 %ref to i64
  %253 = load %struct.ImageParameters** @img, align 8
  %254 = getelementptr inbounds %struct.ImageParameters* %253, i32 0, i32 34
  %255 = load i32* %254, align 4
  %256 = ashr i32 %255, 2
  %257 = add nsw i32 %256, %2
  %258 = sext i32 %257 to i64
  %259 = load %struct.ImageParameters** @img, align 8
  %260 = getelementptr inbounds %struct.ImageParameters* %259, i32 0, i32 33
  %261 = load i32* %260, align 4
  %262 = ashr i32 %261, 2
  %263 = add nsw i32 %262, %1
  %264 = sext i32 %263 to i64
  %265 = load i32****** @all_mincost, align 8
  %266 = getelementptr inbounds i32***** %265, i64 %264
  %267 = load i32***** %266, align 8
  %268 = getelementptr inbounds i32**** %267, i64 %258
  %269 = load i32**** %268, align 8
  %270 = getelementptr inbounds i32*** %269, i64 %252
  %271 = load i32*** %270, align 8
  %272 = getelementptr inbounds i32** %271, i64 4
  %273 = load i32** %272, align 8
  %274 = getelementptr inbounds i32* %273, i64 0
  %275 = load i32* %274, align 4
  br label %276

; <label>:276                                     ; preds = %251, %227
  %277 = phi i32 [ %250, %227 ], [ %275, %251 ]
  store i32 %277, i32* @pred_SAD_uplayer, align 4
  %278 = load i32* @pred_SAD_uplayer, align 4
  %279 = sdiv i32 %278, 2
  store i32 %279, i32* @pred_SAD_uplayer, align 4
  br label %464

; <label>:280                                     ; preds = %189
  %281 = icmp eq i32 %blocktype, 4
  br i1 %281, label %282, label %371

; <label>:282                                     ; preds = %280
  %283 = sext i16 %ref to i64
  %284 = sext i32 %list to i64
  %285 = sext i32 %2 to i64
  %286 = sext i32 %1 to i64
  %287 = getelementptr inbounds i16****** %31, i64 %286
  %288 = load i16****** %287, align 8
  %289 = getelementptr inbounds i16***** %288, i64 %285
  %290 = load i16***** %289, align 8
  %291 = getelementptr inbounds i16**** %290, i64 %284
  %292 = load i16**** %291, align 8
  %293 = getelementptr inbounds i16*** %292, i64 %283
  %294 = load i16*** %293, align 8
  %295 = getelementptr inbounds i16** %294, i64 2
  %296 = load i16** %295, align 8
  %297 = getelementptr inbounds i16* %296, i64 0
  %298 = load i16* %297, align 2
  %299 = sext i16 %298 to i32
  store i32 %299, i32* getelementptr inbounds ([2 x i32]* @pred_MV_uplayer, i32 0, i64 0), align 4
  %300 = sext i16 %ref to i64
  %301 = sext i32 %list to i64
  %302 = sext i32 %2 to i64
  %303 = sext i32 %1 to i64
  %304 = getelementptr inbounds i16****** %31, i64 %303
  %305 = load i16****** %304, align 8
  %306 = getelementptr inbounds i16***** %305, i64 %302
  %307 = load i16***** %306, align 8
  %308 = getelementptr inbounds i16**** %307, i64 %301
  %309 = load i16**** %308, align 8
  %310 = getelementptr inbounds i16*** %309, i64 %300
  %311 = load i16*** %310, align 8
  %312 = getelementptr inbounds i16** %311, i64 2
  %313 = load i16** %312, align 8
  %314 = getelementptr inbounds i16* %313, i64 1
  %315 = load i16* %314, align 2
  %316 = sext i16 %315 to i32
  store i32 %316, i32* getelementptr inbounds ([2 x i32]* @pred_MV_uplayer, i32 0, i64 1), align 4
  %317 = icmp eq i32 %list, 1
  br i1 %317, label %318, label %342

; <label>:318                                     ; preds = %282
  %319 = load %struct.ImageParameters** @img, align 8
  %320 = getelementptr inbounds %struct.ImageParameters* %319, i32 0, i32 34
  %321 = load i32* %320, align 4
  %322 = ashr i32 %321, 2
  %323 = add nsw i32 %322, %2
  %324 = sext i32 %323 to i64
  %325 = load %struct.ImageParameters** @img, align 8
  %326 = getelementptr inbounds %struct.ImageParameters* %325, i32 0, i32 33
  %327 = load i32* %326, align 4
  %328 = ashr i32 %327, 2
  %329 = add nsw i32 %328, %1
  %330 = sext i32 %329 to i64
  %331 = load i32****** @all_bwmincost, align 8
  %332 = getelementptr inbounds i32***** %331, i64 %330
  %333 = load i32***** %332, align 8
  %334 = getelementptr inbounds i32**** %333, i64 %324
  %335 = load i32**** %334, align 8
  %336 = getelementptr inbounds i32*** %335, i64 0
  %337 = load i32*** %336, align 8
  %338 = getelementptr inbounds i32** %337, i64 2
  %339 = load i32** %338, align 8
  %340 = getelementptr inbounds i32* %339, i64 0
  %341 = load i32* %340, align 4
  br label %367

; <label>:342                                     ; preds = %282
  %343 = sext i16 %ref to i64
  %344 = load %struct.ImageParameters** @img, align 8
  %345 = getelementptr inbounds %struct.ImageParameters* %344, i32 0, i32 34
  %346 = load i32* %345, align 4
  %347 = ashr i32 %346, 2
  %348 = add nsw i32 %347, %2
  %349 = sext i32 %348 to i64
  %350 = load %struct.ImageParameters** @img, align 8
  %351 = getelementptr inbounds %struct.ImageParameters* %350, i32 0, i32 33
  %352 = load i32* %351, align 4
  %353 = ashr i32 %352, 2
  %354 = add nsw i32 %353, %1
  %355 = sext i32 %354 to i64
  %356 = load i32****** @all_mincost, align 8
  %357 = getelementptr inbounds i32***** %356, i64 %355
  %358 = load i32***** %357, align 8
  %359 = getelementptr inbounds i32**** %358, i64 %349
  %360 = load i32**** %359, align 8
  %361 = getelementptr inbounds i32*** %360, i64 %343
  %362 = load i32*** %361, align 8
  %363 = getelementptr inbounds i32** %362, i64 2
  %364 = load i32** %363, align 8
  %365 = getelementptr inbounds i32* %364, i64 0
  %366 = load i32* %365, align 4
  br label %367

; <label>:367                                     ; preds = %342, %318
  %368 = phi i32 [ %341, %318 ], [ %366, %342 ]
  store i32 %368, i32* @pred_SAD_uplayer, align 4
  %369 = load i32* @pred_SAD_uplayer, align 4
  %370 = sdiv i32 %369, 2
  store i32 %370, i32* @pred_SAD_uplayer, align 4
  br label %463

; <label>:371                                     ; preds = %280
  %372 = icmp sgt i32 %blocktype, 1
  br i1 %372, label %373, label %462

; <label>:373                                     ; preds = %371
  %374 = sext i16 %ref to i64
  %375 = sext i32 %list to i64
  %376 = sext i32 %2 to i64
  %377 = sext i32 %1 to i64
  %378 = getelementptr inbounds i16****** %31, i64 %377
  %379 = load i16****** %378, align 8
  %380 = getelementptr inbounds i16***** %379, i64 %376
  %381 = load i16***** %380, align 8
  %382 = getelementptr inbounds i16**** %381, i64 %375
  %383 = load i16**** %382, align 8
  %384 = getelementptr inbounds i16*** %383, i64 %374
  %385 = load i16*** %384, align 8
  %386 = getelementptr inbounds i16** %385, i64 1
  %387 = load i16** %386, align 8
  %388 = getelementptr inbounds i16* %387, i64 0
  %389 = load i16* %388, align 2
  %390 = sext i16 %389 to i32
  store i32 %390, i32* getelementptr inbounds ([2 x i32]* @pred_MV_uplayer, i32 0, i64 0), align 4
  %391 = sext i16 %ref to i64
  %392 = sext i32 %list to i64
  %393 = sext i32 %2 to i64
  %394 = sext i32 %1 to i64
  %395 = getelementptr inbounds i16****** %31, i64 %394
  %396 = load i16****** %395, align 8
  %397 = getelementptr inbounds i16***** %396, i64 %393
  %398 = load i16***** %397, align 8
  %399 = getelementptr inbounds i16**** %398, i64 %392
  %400 = load i16**** %399, align 8
  %401 = getelementptr inbounds i16*** %400, i64 %391
  %402 = load i16*** %401, align 8
  %403 = getelementptr inbounds i16** %402, i64 1
  %404 = load i16** %403, align 8
  %405 = getelementptr inbounds i16* %404, i64 1
  %406 = load i16* %405, align 2
  %407 = sext i16 %406 to i32
  store i32 %407, i32* getelementptr inbounds ([2 x i32]* @pred_MV_uplayer, i32 0, i64 1), align 4
  %408 = icmp eq i32 %list, 1
  br i1 %408, label %409, label %433

; <label>:409                                     ; preds = %373
  %410 = load %struct.ImageParameters** @img, align 8
  %411 = getelementptr inbounds %struct.ImageParameters* %410, i32 0, i32 34
  %412 = load i32* %411, align 4
  %413 = ashr i32 %412, 2
  %414 = add nsw i32 %413, %2
  %415 = sext i32 %414 to i64
  %416 = load %struct.ImageParameters** @img, align 8
  %417 = getelementptr inbounds %struct.ImageParameters* %416, i32 0, i32 33
  %418 = load i32* %417, align 4
  %419 = ashr i32 %418, 2
  %420 = add nsw i32 %419, %1
  %421 = sext i32 %420 to i64
  %422 = load i32****** @all_bwmincost, align 8
  %423 = getelementptr inbounds i32***** %422, i64 %421
  %424 = load i32***** %423, align 8
  %425 = getelementptr inbounds i32**** %424, i64 %415
  %426 = load i32**** %425, align 8
  %427 = getelementptr inbounds i32*** %426, i64 0
  %428 = load i32*** %427, align 8
  %429 = getelementptr inbounds i32** %428, i64 1
  %430 = load i32** %429, align 8
  %431 = getelementptr inbounds i32* %430, i64 0
  %432 = load i32* %431, align 4
  br label %458

; <label>:433                                     ; preds = %373
  %434 = sext i16 %ref to i64
  %435 = load %struct.ImageParameters** @img, align 8
  %436 = getelementptr inbounds %struct.ImageParameters* %435, i32 0, i32 34
  %437 = load i32* %436, align 4
  %438 = ashr i32 %437, 2
  %439 = add nsw i32 %438, %2
  %440 = sext i32 %439 to i64
  %441 = load %struct.ImageParameters** @img, align 8
  %442 = getelementptr inbounds %struct.ImageParameters* %441, i32 0, i32 33
  %443 = load i32* %442, align 4
  %444 = ashr i32 %443, 2
  %445 = add nsw i32 %444, %1
  %446 = sext i32 %445 to i64
  %447 = load i32****** @all_mincost, align 8
  %448 = getelementptr inbounds i32***** %447, i64 %446
  %449 = load i32***** %448, align 8
  %450 = getelementptr inbounds i32**** %449, i64 %440
  %451 = load i32**** %450, align 8
  %452 = getelementptr inbounds i32*** %451, i64 %434
  %453 = load i32*** %452, align 8
  %454 = getelementptr inbounds i32** %453, i64 1
  %455 = load i32** %454, align 8
  %456 = getelementptr inbounds i32* %455, i64 0
  %457 = load i32* %456, align 4
  br label %458

; <label>:458                                     ; preds = %433, %409
  %459 = phi i32 [ %432, %409 ], [ %457, %433 ]
  store i32 %459, i32* @pred_SAD_uplayer, align 4
  %460 = load i32* @pred_SAD_uplayer, align 4
  %461 = sdiv i32 %460, 2
  store i32 %461, i32* @pred_SAD_uplayer, align 4
  br label %462

; <label>:462                                     ; preds = %458, %371
  br label %463

; <label>:463                                     ; preds = %462, %367
  br label %464

; <label>:464                                     ; preds = %463, %276
  br label %465

; <label>:465                                     ; preds = %464, %185
  %466 = load %struct.ImageParameters** @img, align 8
  %467 = getelementptr inbounds %struct.ImageParameters* %466, i32 0, i32 6
  %468 = load i32* %467, align 4
  %469 = icmp eq i32 %468, 1
  br i1 %469, label %470, label %843

; <label>:470                                     ; preds = %465
  %471 = load %struct.ImageParameters** @img, align 8
  %472 = getelementptr inbounds %struct.ImageParameters* %471, i32 0, i32 113
  %473 = load i32* %472, align 4
  %474 = icmp sgt i32 %473, 0
  br i1 %474, label %475, label %843

; <label>:475                                     ; preds = %470
  %476 = icmp sgt i32 %blocktype, 6
  br i1 %476, label %477, label %566

; <label>:477                                     ; preds = %475
  %478 = sext i16 %ref to i64
  %479 = sext i32 %list to i64
  %480 = sext i32 %2 to i64
  %481 = sext i32 %1 to i64
  %482 = getelementptr inbounds i16****** %31, i64 %481
  %483 = load i16****** %482, align 8
  %484 = getelementptr inbounds i16***** %483, i64 %480
  %485 = load i16***** %484, align 8
  %486 = getelementptr inbounds i16**** %485, i64 %479
  %487 = load i16**** %486, align 8
  %488 = getelementptr inbounds i16*** %487, i64 %478
  %489 = load i16*** %488, align 8
  %490 = getelementptr inbounds i16** %489, i64 5
  %491 = load i16** %490, align 8
  %492 = getelementptr inbounds i16* %491, i64 0
  %493 = load i16* %492, align 2
  %494 = sext i16 %493 to i32
  store i32 %494, i32* getelementptr inbounds ([2 x i32]* @pred_MV_uplayer, i32 0, i64 0), align 4
  %495 = sext i16 %ref to i64
  %496 = sext i32 %list to i64
  %497 = sext i32 %2 to i64
  %498 = sext i32 %1 to i64
  %499 = getelementptr inbounds i16****** %31, i64 %498
  %500 = load i16****** %499, align 8
  %501 = getelementptr inbounds i16***** %500, i64 %497
  %502 = load i16***** %501, align 8
  %503 = getelementptr inbounds i16**** %502, i64 %496
  %504 = load i16**** %503, align 8
  %505 = getelementptr inbounds i16*** %504, i64 %495
  %506 = load i16*** %505, align 8
  %507 = getelementptr inbounds i16** %506, i64 5
  %508 = load i16** %507, align 8
  %509 = getelementptr inbounds i16* %508, i64 1
  %510 = load i16* %509, align 2
  %511 = sext i16 %510 to i32
  store i32 %511, i32* getelementptr inbounds ([2 x i32]* @pred_MV_uplayer, i32 0, i64 1), align 4
  %512 = icmp eq i32 %list, 1
  br i1 %512, label %513, label %537

; <label>:513                                     ; preds = %477
  %514 = load %struct.ImageParameters** @img, align 8
  %515 = getelementptr inbounds %struct.ImageParameters* %514, i32 0, i32 34
  %516 = load i32* %515, align 4
  %517 = ashr i32 %516, 2
  %518 = add nsw i32 %517, %2
  %519 = sext i32 %518 to i64
  %520 = load %struct.ImageParameters** @img, align 8
  %521 = getelementptr inbounds %struct.ImageParameters* %520, i32 0, i32 33
  %522 = load i32* %521, align 4
  %523 = ashr i32 %522, 2
  %524 = add nsw i32 %523, %1
  %525 = sext i32 %524 to i64
  %526 = load i32****** @all_bwmincost, align 8
  %527 = getelementptr inbounds i32***** %526, i64 %525
  %528 = load i32***** %527, align 8
  %529 = getelementptr inbounds i32**** %528, i64 %519
  %530 = load i32**** %529, align 8
  %531 = getelementptr inbounds i32*** %530, i64 0
  %532 = load i32*** %531, align 8
  %533 = getelementptr inbounds i32** %532, i64 5
  %534 = load i32** %533, align 8
  %535 = getelementptr inbounds i32* %534, i64 0
  %536 = load i32* %535, align 4
  br label %562

; <label>:537                                     ; preds = %477
  %538 = sext i16 %ref to i64
  %539 = load %struct.ImageParameters** @img, align 8
  %540 = getelementptr inbounds %struct.ImageParameters* %539, i32 0, i32 34
  %541 = load i32* %540, align 4
  %542 = ashr i32 %541, 2
  %543 = add nsw i32 %542, %2
  %544 = sext i32 %543 to i64
  %545 = load %struct.ImageParameters** @img, align 8
  %546 = getelementptr inbounds %struct.ImageParameters* %545, i32 0, i32 33
  %547 = load i32* %546, align 4
  %548 = ashr i32 %547, 2
  %549 = add nsw i32 %548, %1
  %550 = sext i32 %549 to i64
  %551 = load i32****** @all_mincost, align 8
  %552 = getelementptr inbounds i32***** %551, i64 %550
  %553 = load i32***** %552, align 8
  %554 = getelementptr inbounds i32**** %553, i64 %544
  %555 = load i32**** %554, align 8
  %556 = getelementptr inbounds i32*** %555, i64 %538
  %557 = load i32*** %556, align 8
  %558 = getelementptr inbounds i32** %557, i64 5
  %559 = load i32** %558, align 8
  %560 = getelementptr inbounds i32* %559, i64 0
  %561 = load i32* %560, align 4
  br label %562

; <label>:562                                     ; preds = %537, %513
  %563 = phi i32 [ %536, %513 ], [ %561, %537 ]
  store i32 %563, i32* @pred_SAD_uplayer, align 4
  %564 = load i32* @pred_SAD_uplayer, align 4
  %565 = sdiv i32 %564, 2
  store i32 %565, i32* @pred_SAD_uplayer, align 4
  br label %842

; <label>:566                                     ; preds = %475
  %567 = icmp sgt i32 %blocktype, 4
  br i1 %567, label %568, label %657

; <label>:568                                     ; preds = %566
  %569 = sext i16 %ref to i64
  %570 = sext i32 %list to i64
  %571 = sext i32 %2 to i64
  %572 = sext i32 %1 to i64
  %573 = getelementptr inbounds i16****** %31, i64 %572
  %574 = load i16****** %573, align 8
  %575 = getelementptr inbounds i16***** %574, i64 %571
  %576 = load i16***** %575, align 8
  %577 = getelementptr inbounds i16**** %576, i64 %570
  %578 = load i16**** %577, align 8
  %579 = getelementptr inbounds i16*** %578, i64 %569
  %580 = load i16*** %579, align 8
  %581 = getelementptr inbounds i16** %580, i64 4
  %582 = load i16** %581, align 8
  %583 = getelementptr inbounds i16* %582, i64 0
  %584 = load i16* %583, align 2
  %585 = sext i16 %584 to i32
  store i32 %585, i32* getelementptr inbounds ([2 x i32]* @pred_MV_uplayer, i32 0, i64 0), align 4
  %586 = sext i16 %ref to i64
  %587 = sext i32 %list to i64
  %588 = sext i32 %2 to i64
  %589 = sext i32 %1 to i64
  %590 = getelementptr inbounds i16****** %31, i64 %589
  %591 = load i16****** %590, align 8
  %592 = getelementptr inbounds i16***** %591, i64 %588
  %593 = load i16***** %592, align 8
  %594 = getelementptr inbounds i16**** %593, i64 %587
  %595 = load i16**** %594, align 8
  %596 = getelementptr inbounds i16*** %595, i64 %586
  %597 = load i16*** %596, align 8
  %598 = getelementptr inbounds i16** %597, i64 4
  %599 = load i16** %598, align 8
  %600 = getelementptr inbounds i16* %599, i64 1
  %601 = load i16* %600, align 2
  %602 = sext i16 %601 to i32
  store i32 %602, i32* getelementptr inbounds ([2 x i32]* @pred_MV_uplayer, i32 0, i64 1), align 4
  %603 = icmp eq i32 %list, 1
  br i1 %603, label %604, label %628

; <label>:604                                     ; preds = %568
  %605 = load %struct.ImageParameters** @img, align 8
  %606 = getelementptr inbounds %struct.ImageParameters* %605, i32 0, i32 34
  %607 = load i32* %606, align 4
  %608 = ashr i32 %607, 2
  %609 = add nsw i32 %608, %2
  %610 = sext i32 %609 to i64
  %611 = load %struct.ImageParameters** @img, align 8
  %612 = getelementptr inbounds %struct.ImageParameters* %611, i32 0, i32 33
  %613 = load i32* %612, align 4
  %614 = ashr i32 %613, 2
  %615 = add nsw i32 %614, %1
  %616 = sext i32 %615 to i64
  %617 = load i32****** @all_bwmincost, align 8
  %618 = getelementptr inbounds i32***** %617, i64 %616
  %619 = load i32***** %618, align 8
  %620 = getelementptr inbounds i32**** %619, i64 %610
  %621 = load i32**** %620, align 8
  %622 = getelementptr inbounds i32*** %621, i64 0
  %623 = load i32*** %622, align 8
  %624 = getelementptr inbounds i32** %623, i64 4
  %625 = load i32** %624, align 8
  %626 = getelementptr inbounds i32* %625, i64 0
  %627 = load i32* %626, align 4
  br label %653

; <label>:628                                     ; preds = %568
  %629 = sext i16 %ref to i64
  %630 = load %struct.ImageParameters** @img, align 8
  %631 = getelementptr inbounds %struct.ImageParameters* %630, i32 0, i32 34
  %632 = load i32* %631, align 4
  %633 = ashr i32 %632, 2
  %634 = add nsw i32 %633, %2
  %635 = sext i32 %634 to i64
  %636 = load %struct.ImageParameters** @img, align 8
  %637 = getelementptr inbounds %struct.ImageParameters* %636, i32 0, i32 33
  %638 = load i32* %637, align 4
  %639 = ashr i32 %638, 2
  %640 = add nsw i32 %639, %1
  %641 = sext i32 %640 to i64
  %642 = load i32****** @all_mincost, align 8
  %643 = getelementptr inbounds i32***** %642, i64 %641
  %644 = load i32***** %643, align 8
  %645 = getelementptr inbounds i32**** %644, i64 %635
  %646 = load i32**** %645, align 8
  %647 = getelementptr inbounds i32*** %646, i64 %629
  %648 = load i32*** %647, align 8
  %649 = getelementptr inbounds i32** %648, i64 4
  %650 = load i32** %649, align 8
  %651 = getelementptr inbounds i32* %650, i64 0
  %652 = load i32* %651, align 4
  br label %653

; <label>:653                                     ; preds = %628, %604
  %654 = phi i32 [ %627, %604 ], [ %652, %628 ]
  store i32 %654, i32* @pred_SAD_uplayer, align 4
  %655 = load i32* @pred_SAD_uplayer, align 4
  %656 = sdiv i32 %655, 2
  store i32 %656, i32* @pred_SAD_uplayer, align 4
  br label %841

; <label>:657                                     ; preds = %566
  %658 = icmp eq i32 %blocktype, 4
  br i1 %658, label %659, label %748

; <label>:659                                     ; preds = %657
  %660 = sext i16 %ref to i64
  %661 = sext i32 %list to i64
  %662 = sext i32 %2 to i64
  %663 = sext i32 %1 to i64
  %664 = getelementptr inbounds i16****** %31, i64 %663
  %665 = load i16****** %664, align 8
  %666 = getelementptr inbounds i16***** %665, i64 %662
  %667 = load i16***** %666, align 8
  %668 = getelementptr inbounds i16**** %667, i64 %661
  %669 = load i16**** %668, align 8
  %670 = getelementptr inbounds i16*** %669, i64 %660
  %671 = load i16*** %670, align 8
  %672 = getelementptr inbounds i16** %671, i64 2
  %673 = load i16** %672, align 8
  %674 = getelementptr inbounds i16* %673, i64 0
  %675 = load i16* %674, align 2
  %676 = sext i16 %675 to i32
  store i32 %676, i32* getelementptr inbounds ([2 x i32]* @pred_MV_uplayer, i32 0, i64 0), align 4
  %677 = sext i16 %ref to i64
  %678 = sext i32 %list to i64
  %679 = sext i32 %2 to i64
  %680 = sext i32 %1 to i64
  %681 = getelementptr inbounds i16****** %31, i64 %680
  %682 = load i16****** %681, align 8
  %683 = getelementptr inbounds i16***** %682, i64 %679
  %684 = load i16***** %683, align 8
  %685 = getelementptr inbounds i16**** %684, i64 %678
  %686 = load i16**** %685, align 8
  %687 = getelementptr inbounds i16*** %686, i64 %677
  %688 = load i16*** %687, align 8
  %689 = getelementptr inbounds i16** %688, i64 2
  %690 = load i16** %689, align 8
  %691 = getelementptr inbounds i16* %690, i64 1
  %692 = load i16* %691, align 2
  %693 = sext i16 %692 to i32
  store i32 %693, i32* getelementptr inbounds ([2 x i32]* @pred_MV_uplayer, i32 0, i64 1), align 4
  %694 = icmp eq i32 %list, 1
  br i1 %694, label %695, label %719

; <label>:695                                     ; preds = %659
  %696 = load %struct.ImageParameters** @img, align 8
  %697 = getelementptr inbounds %struct.ImageParameters* %696, i32 0, i32 34
  %698 = load i32* %697, align 4
  %699 = ashr i32 %698, 2
  %700 = add nsw i32 %699, %2
  %701 = sext i32 %700 to i64
  %702 = load %struct.ImageParameters** @img, align 8
  %703 = getelementptr inbounds %struct.ImageParameters* %702, i32 0, i32 33
  %704 = load i32* %703, align 4
  %705 = ashr i32 %704, 2
  %706 = add nsw i32 %705, %1
  %707 = sext i32 %706 to i64
  %708 = load i32****** @all_bwmincost, align 8
  %709 = getelementptr inbounds i32***** %708, i64 %707
  %710 = load i32***** %709, align 8
  %711 = getelementptr inbounds i32**** %710, i64 %701
  %712 = load i32**** %711, align 8
  %713 = getelementptr inbounds i32*** %712, i64 0
  %714 = load i32*** %713, align 8
  %715 = getelementptr inbounds i32** %714, i64 2
  %716 = load i32** %715, align 8
  %717 = getelementptr inbounds i32* %716, i64 0
  %718 = load i32* %717, align 4
  br label %744

; <label>:719                                     ; preds = %659
  %720 = sext i16 %ref to i64
  %721 = load %struct.ImageParameters** @img, align 8
  %722 = getelementptr inbounds %struct.ImageParameters* %721, i32 0, i32 34
  %723 = load i32* %722, align 4
  %724 = ashr i32 %723, 2
  %725 = add nsw i32 %724, %2
  %726 = sext i32 %725 to i64
  %727 = load %struct.ImageParameters** @img, align 8
  %728 = getelementptr inbounds %struct.ImageParameters* %727, i32 0, i32 33
  %729 = load i32* %728, align 4
  %730 = ashr i32 %729, 2
  %731 = add nsw i32 %730, %1
  %732 = sext i32 %731 to i64
  %733 = load i32****** @all_mincost, align 8
  %734 = getelementptr inbounds i32***** %733, i64 %732
  %735 = load i32***** %734, align 8
  %736 = getelementptr inbounds i32**** %735, i64 %726
  %737 = load i32**** %736, align 8
  %738 = getelementptr inbounds i32*** %737, i64 %720
  %739 = load i32*** %738, align 8
  %740 = getelementptr inbounds i32** %739, i64 2
  %741 = load i32** %740, align 8
  %742 = getelementptr inbounds i32* %741, i64 0
  %743 = load i32* %742, align 4
  br label %744

; <label>:744                                     ; preds = %719, %695
  %745 = phi i32 [ %718, %695 ], [ %743, %719 ]
  store i32 %745, i32* @pred_SAD_uplayer, align 4
  %746 = load i32* @pred_SAD_uplayer, align 4
  %747 = sdiv i32 %746, 2
  store i32 %747, i32* @pred_SAD_uplayer, align 4
  br label %840

; <label>:748                                     ; preds = %657
  %749 = icmp sgt i32 %blocktype, 1
  br i1 %749, label %750, label %839

; <label>:750                                     ; preds = %748
  %751 = sext i16 %ref to i64
  %752 = sext i32 %list to i64
  %753 = sext i32 %2 to i64
  %754 = sext i32 %1 to i64
  %755 = getelementptr inbounds i16****** %31, i64 %754
  %756 = load i16****** %755, align 8
  %757 = getelementptr inbounds i16***** %756, i64 %753
  %758 = load i16***** %757, align 8
  %759 = getelementptr inbounds i16**** %758, i64 %752
  %760 = load i16**** %759, align 8
  %761 = getelementptr inbounds i16*** %760, i64 %751
  %762 = load i16*** %761, align 8
  %763 = getelementptr inbounds i16** %762, i64 1
  %764 = load i16** %763, align 8
  %765 = getelementptr inbounds i16* %764, i64 0
  %766 = load i16* %765, align 2
  %767 = sext i16 %766 to i32
  store i32 %767, i32* getelementptr inbounds ([2 x i32]* @pred_MV_uplayer, i32 0, i64 0), align 4
  %768 = sext i16 %ref to i64
  %769 = sext i32 %list to i64
  %770 = sext i32 %2 to i64
  %771 = sext i32 %1 to i64
  %772 = getelementptr inbounds i16****** %31, i64 %771
  %773 = load i16****** %772, align 8
  %774 = getelementptr inbounds i16***** %773, i64 %770
  %775 = load i16***** %774, align 8
  %776 = getelementptr inbounds i16**** %775, i64 %769
  %777 = load i16**** %776, align 8
  %778 = getelementptr inbounds i16*** %777, i64 %768
  %779 = load i16*** %778, align 8
  %780 = getelementptr inbounds i16** %779, i64 1
  %781 = load i16** %780, align 8
  %782 = getelementptr inbounds i16* %781, i64 1
  %783 = load i16* %782, align 2
  %784 = sext i16 %783 to i32
  store i32 %784, i32* getelementptr inbounds ([2 x i32]* @pred_MV_uplayer, i32 0, i64 1), align 4
  %785 = icmp eq i32 %list, 1
  br i1 %785, label %786, label %810

; <label>:786                                     ; preds = %750
  %787 = load %struct.ImageParameters** @img, align 8
  %788 = getelementptr inbounds %struct.ImageParameters* %787, i32 0, i32 34
  %789 = load i32* %788, align 4
  %790 = ashr i32 %789, 2
  %791 = add nsw i32 %790, %2
  %792 = sext i32 %791 to i64
  %793 = load %struct.ImageParameters** @img, align 8
  %794 = getelementptr inbounds %struct.ImageParameters* %793, i32 0, i32 33
  %795 = load i32* %794, align 4
  %796 = ashr i32 %795, 2
  %797 = add nsw i32 %796, %1
  %798 = sext i32 %797 to i64
  %799 = load i32****** @all_bwmincost, align 8
  %800 = getelementptr inbounds i32***** %799, i64 %798
  %801 = load i32***** %800, align 8
  %802 = getelementptr inbounds i32**** %801, i64 %792
  %803 = load i32**** %802, align 8
  %804 = getelementptr inbounds i32*** %803, i64 0
  %805 = load i32*** %804, align 8
  %806 = getelementptr inbounds i32** %805, i64 1
  %807 = load i32** %806, align 8
  %808 = getelementptr inbounds i32* %807, i64 0
  %809 = load i32* %808, align 4
  br label %835

; <label>:810                                     ; preds = %750
  %811 = sext i16 %ref to i64
  %812 = load %struct.ImageParameters** @img, align 8
  %813 = getelementptr inbounds %struct.ImageParameters* %812, i32 0, i32 34
  %814 = load i32* %813, align 4
  %815 = ashr i32 %814, 2
  %816 = add nsw i32 %815, %2
  %817 = sext i32 %816 to i64
  %818 = load %struct.ImageParameters** @img, align 8
  %819 = getelementptr inbounds %struct.ImageParameters* %818, i32 0, i32 33
  %820 = load i32* %819, align 4
  %821 = ashr i32 %820, 2
  %822 = add nsw i32 %821, %1
  %823 = sext i32 %822 to i64
  %824 = load i32****** @all_mincost, align 8
  %825 = getelementptr inbounds i32***** %824, i64 %823
  %826 = load i32***** %825, align 8
  %827 = getelementptr inbounds i32**** %826, i64 %817
  %828 = load i32**** %827, align 8
  %829 = getelementptr inbounds i32*** %828, i64 %811
  %830 = load i32*** %829, align 8
  %831 = getelementptr inbounds i32** %830, i64 1
  %832 = load i32** %831, align 8
  %833 = getelementptr inbounds i32* %832, i64 0
  %834 = load i32* %833, align 4
  br label %835

; <label>:835                                     ; preds = %810, %786
  %836 = phi i32 [ %809, %786 ], [ %834, %810 ]
  store i32 %836, i32* @pred_SAD_uplayer, align 4
  %837 = load i32* @pred_SAD_uplayer, align 4
  %838 = sdiv i32 %837, 2
  store i32 %838, i32* @pred_SAD_uplayer, align 4
  br label %839

; <label>:839                                     ; preds = %835, %748
  br label %840

; <label>:840                                     ; preds = %839, %744
  br label %841

; <label>:841                                     ; preds = %840, %653
  br label %842

; <label>:842                                     ; preds = %841, %562
  br label %843

; <label>:843                                     ; preds = %842, %470, %465
  %844 = load i32* @flag_intra_SAD, align 4
  %845 = icmp ne i32 %844, 0
  br i1 %845, label %846, label %847

; <label>:846                                     ; preds = %843
  br label %849

; <label>:847                                     ; preds = %843
  %848 = load i32* @pred_SAD_uplayer, align 4
  br label %849

; <label>:849                                     ; preds = %847, %846
  %850 = phi i32 [ 0, %846 ], [ %848, %847 ]
  store i32 %850, i32* @pred_SAD_uplayer, align 4
  %851 = load %struct.ImageParameters** @img, align 8
  %852 = getelementptr inbounds %struct.ImageParameters* %851, i32 0, i32 0
  %853 = load i32* %852, align 4
  %854 = sext i16 %ref to i32
  %855 = add nsw i32 %854, 1
  %856 = icmp sgt i32 %853, %855
  br i1 %856, label %857, label %933

; <label>:857                                     ; preds = %849
  %858 = sext i32 %blocktype to i64
  %859 = sext i16 %ref to i64
  %860 = load %struct.ImageParameters** @img, align 8
  %861 = getelementptr inbounds %struct.ImageParameters* %860, i32 0, i32 34
  %862 = load i32* %861, align 4
  %863 = ashr i32 %862, 2
  %864 = add nsw i32 %863, %2
  %865 = sext i32 %864 to i64
  %866 = load %struct.ImageParameters** @img, align 8
  %867 = getelementptr inbounds %struct.ImageParameters* %866, i32 0, i32 33
  %868 = load i32* %867, align 4
  %869 = ashr i32 %868, 2
  %870 = add nsw i32 %869, %1
  %871 = sext i32 %870 to i64
  %872 = load i32****** @all_mincost, align 8
  %873 = getelementptr inbounds i32***** %872, i64 %871
  %874 = load i32***** %873, align 8
  %875 = getelementptr inbounds i32**** %874, i64 %865
  %876 = load i32**** %875, align 8
  %877 = getelementptr inbounds i32*** %876, i64 %859
  %878 = load i32*** %877, align 8
  %879 = getelementptr inbounds i32** %878, i64 %858
  %880 = load i32** %879, align 8
  %881 = getelementptr inbounds i32* %880, i64 0
  %882 = load i32* %881, align 4
  store i32 %882, i32* @pred_SAD_time, align 4
  %883 = sext i32 %blocktype to i64
  %884 = sext i16 %ref to i64
  %885 = load %struct.ImageParameters** @img, align 8
  %886 = getelementptr inbounds %struct.ImageParameters* %885, i32 0, i32 34
  %887 = load i32* %886, align 4
  %888 = ashr i32 %887, 2
  %889 = add nsw i32 %888, %2
  %890 = sext i32 %889 to i64
  %891 = load %struct.ImageParameters** @img, align 8
  %892 = getelementptr inbounds %struct.ImageParameters* %891, i32 0, i32 33
  %893 = load i32* %892, align 4
  %894 = ashr i32 %893, 2
  %895 = add nsw i32 %894, %1
  %896 = sext i32 %895 to i64
  %897 = load i32****** @all_mincost, align 8
  %898 = getelementptr inbounds i32***** %897, i64 %896
  %899 = load i32***** %898, align 8
  %900 = getelementptr inbounds i32**** %899, i64 %890
  %901 = load i32**** %900, align 8
  %902 = getelementptr inbounds i32*** %901, i64 %884
  %903 = load i32*** %902, align 8
  %904 = getelementptr inbounds i32** %903, i64 %883
  %905 = load i32** %904, align 8
  %906 = getelementptr inbounds i32* %905, i64 1
  %907 = load i32* %906, align 4
  store i32 %907, i32* getelementptr inbounds ([2 x i32]* @pred_MV_time, i32 0, i64 0), align 4
  %908 = sext i32 %blocktype to i64
  %909 = sext i16 %ref to i64
  %910 = load %struct.ImageParameters** @img, align 8
  %911 = getelementptr inbounds %struct.ImageParameters* %910, i32 0, i32 34
  %912 = load i32* %911, align 4
  %913 = ashr i32 %912, 2
  %914 = add nsw i32 %913, %2
  %915 = sext i32 %914 to i64
  %916 = load %struct.ImageParameters** @img, align 8
  %917 = getelementptr inbounds %struct.ImageParameters* %916, i32 0, i32 33
  %918 = load i32* %917, align 4
  %919 = ashr i32 %918, 2
  %920 = add nsw i32 %919, %1
  %921 = sext i32 %920 to i64
  %922 = load i32****** @all_mincost, align 8
  %923 = getelementptr inbounds i32***** %922, i64 %921
  %924 = load i32***** %923, align 8
  %925 = getelementptr inbounds i32**** %924, i64 %915
  %926 = load i32**** %925, align 8
  %927 = getelementptr inbounds i32*** %926, i64 %909
  %928 = load i32*** %927, align 8
  %929 = getelementptr inbounds i32** %928, i64 %908
  %930 = load i32** %929, align 8
  %931 = getelementptr inbounds i32* %930, i64 2
  %932 = load i32* %931, align 4
  store i32 %932, i32* getelementptr inbounds ([2 x i32]* @pred_MV_time, i32 0, i64 1), align 4
  br label %933

; <label>:933                                     ; preds = %857, %849
  %934 = icmp eq i32 %list, 1
  br i1 %934, label %935, label %1045

; <label>:935                                     ; preds = %933
  %936 = load i32* @Bframe_ctr, align 4
  %937 = srem i32 %936, %N_Bframe.0
  %938 = icmp sgt i32 %937, 1
  br i1 %938, label %939, label %1045

; <label>:939                                     ; preds = %935
  %940 = sext i32 %blocktype to i64
  %941 = sext i16 %ref to i64
  %942 = load %struct.ImageParameters** @img, align 8
  %943 = getelementptr inbounds %struct.ImageParameters* %942, i32 0, i32 34
  %944 = load i32* %943, align 4
  %945 = ashr i32 %944, 2
  %946 = add nsw i32 %945, %2
  %947 = sext i32 %946 to i64
  %948 = load %struct.ImageParameters** @img, align 8
  %949 = getelementptr inbounds %struct.ImageParameters* %948, i32 0, i32 33
  %950 = load i32* %949, align 4
  %951 = ashr i32 %950, 2
  %952 = add nsw i32 %951, %1
  %953 = sext i32 %952 to i64
  %954 = load i32****** @all_bwmincost, align 8
  %955 = getelementptr inbounds i32***** %954, i64 %953
  %956 = load i32***** %955, align 8
  %957 = getelementptr inbounds i32**** %956, i64 %947
  %958 = load i32**** %957, align 8
  %959 = getelementptr inbounds i32*** %958, i64 %941
  %960 = load i32*** %959, align 8
  %961 = getelementptr inbounds i32** %960, i64 %940
  %962 = load i32** %961, align 8
  %963 = getelementptr inbounds i32* %962, i64 0
  %964 = load i32* %963, align 4
  store i32 %964, i32* @pred_SAD_time, align 4
  %965 = sext i32 %blocktype to i64
  %966 = load %struct.ImageParameters** @img, align 8
  %967 = getelementptr inbounds %struct.ImageParameters* %966, i32 0, i32 34
  %968 = load i32* %967, align 4
  %969 = ashr i32 %968, 2
  %970 = add nsw i32 %969, %2
  %971 = sext i32 %970 to i64
  %972 = load %struct.ImageParameters** @img, align 8
  %973 = getelementptr inbounds %struct.ImageParameters* %972, i32 0, i32 33
  %974 = load i32* %973, align 4
  %975 = ashr i32 %974, 2
  %976 = add nsw i32 %975, %1
  %977 = sext i32 %976 to i64
  %978 = load i32****** @all_bwmincost, align 8
  %979 = getelementptr inbounds i32***** %978, i64 %977
  %980 = load i32***** %979, align 8
  %981 = getelementptr inbounds i32**** %980, i64 %971
  %982 = load i32**** %981, align 8
  %983 = getelementptr inbounds i32*** %982, i64 0
  %984 = load i32*** %983, align 8
  %985 = getelementptr inbounds i32** %984, i64 %965
  %986 = load i32** %985, align 8
  %987 = getelementptr inbounds i32* %986, i64 1
  %988 = load i32* %987, align 4
  %989 = sitofp i32 %988 to double
  %990 = icmp eq i32 %n_Bframe.0, 1
  br i1 %990, label %991, label %993

; <label>:991                                     ; preds = %939
  %992 = sitofp i32 %N_Bframe.0 to double
  br label %1001

; <label>:993                                     ; preds = %939
  %994 = sub nsw i32 %N_Bframe.0, %n_Bframe.0
  %995 = sitofp i32 %994 to double
  %996 = fadd double %995, 1.000000e+00
  %997 = sub nsw i32 %N_Bframe.0, %n_Bframe.0
  %998 = sitofp i32 %997 to double
  %999 = fadd double %998, 2.000000e+00
  %1000 = fdiv double %996, %999
  br label %1001

; <label>:1001                                    ; preds = %993, %991
  %1002 = phi double [ %992, %991 ], [ %1000, %993 ]
  %1003 = fmul double %989, %1002
  %1004 = fptosi double %1003 to i32
  store i32 %1004, i32* getelementptr inbounds ([2 x i32]* @pred_MV_time, i32 0, i64 0), align 4
  %1005 = sext i32 %blocktype to i64
  %1006 = load %struct.ImageParameters** @img, align 8
  %1007 = getelementptr inbounds %struct.ImageParameters* %1006, i32 0, i32 34
  %1008 = load i32* %1007, align 4
  %1009 = ashr i32 %1008, 2
  %1010 = add nsw i32 %1009, %2
  %1011 = sext i32 %1010 to i64
  %1012 = load %struct.ImageParameters** @img, align 8
  %1013 = getelementptr inbounds %struct.ImageParameters* %1012, i32 0, i32 33
  %1014 = load i32* %1013, align 4
  %1015 = ashr i32 %1014, 2
  %1016 = add nsw i32 %1015, %1
  %1017 = sext i32 %1016 to i64
  %1018 = load i32****** @all_bwmincost, align 8
  %1019 = getelementptr inbounds i32***** %1018, i64 %1017
  %1020 = load i32***** %1019, align 8
  %1021 = getelementptr inbounds i32**** %1020, i64 %1011
  %1022 = load i32**** %1021, align 8
  %1023 = getelementptr inbounds i32*** %1022, i64 0
  %1024 = load i32*** %1023, align 8
  %1025 = getelementptr inbounds i32** %1024, i64 %1005
  %1026 = load i32** %1025, align 8
  %1027 = getelementptr inbounds i32* %1026, i64 2
  %1028 = load i32* %1027, align 4
  %1029 = sitofp i32 %1028 to double
  %1030 = icmp eq i32 %n_Bframe.0, 1
  br i1 %1030, label %1031, label %1033

; <label>:1031                                    ; preds = %1001
  %1032 = sitofp i32 %N_Bframe.0 to double
  br label %1041

; <label>:1033                                    ; preds = %1001
  %1034 = sub nsw i32 %N_Bframe.0, %n_Bframe.0
  %1035 = sitofp i32 %1034 to double
  %1036 = fadd double %1035, 1.000000e+00
  %1037 = sub nsw i32 %N_Bframe.0, %n_Bframe.0
  %1038 = sitofp i32 %1037 to double
  %1039 = fadd double %1038, 2.000000e+00
  %1040 = fdiv double %1036, %1039
  br label %1041

; <label>:1041                                    ; preds = %1033, %1031
  %1042 = phi double [ %1032, %1031 ], [ %1040, %1033 ]
  %1043 = fmul double %1029, %1042
  %1044 = fptosi double %1043 to i32
  store i32 %1044, i32* getelementptr inbounds ([2 x i32]* @pred_MV_time, i32 0, i64 1), align 4
  br label %1045

; <label>:1045                                    ; preds = %1041, %935, %933
  %1046 = load %struct.InputParameters** @input, align 8
  %1047 = getelementptr inbounds %struct.InputParameters* %1046, i32 0, i32 91
  %1048 = load i32* %1047, align 4
  %1049 = icmp eq i32 %1048, 1
  br i1 %1049, label %1050, label %1281

; <label>:1050                                    ; preds = %1045
  %1051 = load %struct.ImageParameters** @img, align 8
  %1052 = getelementptr inbounds %struct.ImageParameters* %1051, i32 0, i32 6
  %1053 = load i32* %1052, align 4
  %1054 = icmp eq i32 %1053, 0
  br i1 %1054, label %1055, label %1169

; <label>:1055                                    ; preds = %1050
  %1056 = sext i16 %ref to i32
  %1057 = icmp sgt i32 %1056, 1
  br i1 %1057, label %1058, label %1169

; <label>:1058                                    ; preds = %1055
  %1059 = sext i32 %blocktype to i64
  %1060 = sext i16 %ref to i32
  %1061 = sub nsw i32 %1060, 2
  %1062 = sext i32 %1061 to i64
  %1063 = load %struct.ImageParameters** @img, align 8
  %1064 = getelementptr inbounds %struct.ImageParameters* %1063, i32 0, i32 34
  %1065 = load i32* %1064, align 4
  %1066 = ashr i32 %1065, 2
  %1067 = add nsw i32 %1066, %2
  %1068 = sext i32 %1067 to i64
  %1069 = load %struct.ImageParameters** @img, align 8
  %1070 = getelementptr inbounds %struct.ImageParameters* %1069, i32 0, i32 33
  %1071 = load i32* %1070, align 4
  %1072 = ashr i32 %1071, 2
  %1073 = add nsw i32 %1072, %1
  %1074 = sext i32 %1073 to i64
  %1075 = load i32****** @all_mincost, align 8
  %1076 = getelementptr inbounds i32***** %1075, i64 %1074
  %1077 = load i32***** %1076, align 8
  %1078 = getelementptr inbounds i32**** %1077, i64 %1068
  %1079 = load i32**** %1078, align 8
  %1080 = getelementptr inbounds i32*** %1079, i64 %1062
  %1081 = load i32*** %1080, align 8
  %1082 = getelementptr inbounds i32** %1081, i64 %1059
  %1083 = load i32** %1082, align 8
  %1084 = getelementptr inbounds i32* %1083, i64 0
  %1085 = load i32* %1084, align 4
  store i32 %1085, i32* @pred_SAD_ref, align 4
  %1086 = load i32* @flag_intra_SAD, align 4
  %1087 = icmp ne i32 %1086, 0
  br i1 %1087, label %1088, label %1089

; <label>:1088                                    ; preds = %1058
  br label %1091

; <label>:1089                                    ; preds = %1058
  %1090 = load i32* @pred_SAD_ref, align 4
  br label %1091

; <label>:1091                                    ; preds = %1089, %1088
  %1092 = phi i32 [ 0, %1088 ], [ %1090, %1089 ]
  store i32 %1092, i32* @pred_SAD_ref, align 4
  %1093 = sext i32 %blocktype to i64
  %1094 = sext i16 %ref to i32
  %1095 = sub nsw i32 %1094, 2
  %1096 = sext i32 %1095 to i64
  %1097 = load %struct.ImageParameters** @img, align 8
  %1098 = getelementptr inbounds %struct.ImageParameters* %1097, i32 0, i32 34
  %1099 = load i32* %1098, align 4
  %1100 = ashr i32 %1099, 2
  %1101 = add nsw i32 %1100, %2
  %1102 = sext i32 %1101 to i64
  %1103 = load %struct.ImageParameters** @img, align 8
  %1104 = getelementptr inbounds %struct.ImageParameters* %1103, i32 0, i32 33
  %1105 = load i32* %1104, align 4
  %1106 = ashr i32 %1105, 2
  %1107 = add nsw i32 %1106, %1
  %1108 = sext i32 %1107 to i64
  %1109 = load i32****** @all_mincost, align 8
  %1110 = getelementptr inbounds i32***** %1109, i64 %1108
  %1111 = load i32***** %1110, align 8
  %1112 = getelementptr inbounds i32**** %1111, i64 %1102
  %1113 = load i32**** %1112, align 8
  %1114 = getelementptr inbounds i32*** %1113, i64 %1096
  %1115 = load i32*** %1114, align 8
  %1116 = getelementptr inbounds i32** %1115, i64 %1093
  %1117 = load i32** %1116, align 8
  %1118 = getelementptr inbounds i32* %1117, i64 1
  %1119 = load i32* %1118, align 4
  store i32 %1119, i32* getelementptr inbounds ([2 x i32]* @pred_MV_ref, i32 0, i64 0), align 4
  %1120 = load i32* getelementptr inbounds ([2 x i32]* @pred_MV_ref, i32 0, i64 0), align 4
  %1121 = sext i16 %ref to i32
  %1122 = ashr i32 %1121, 1
  %1123 = add nsw i32 %1122, 1
  %1124 = mul nsw i32 %1120, %1123
  %1125 = sitofp i32 %1124 to float
  %1126 = sext i16 %ref to i32
  %1127 = ashr i32 %1126, 1
  %1128 = sitofp i32 %1127 to float
  %1129 = fdiv float %1125, %1128
  %1130 = fptosi float %1129 to i32
  store i32 %1130, i32* getelementptr inbounds ([2 x i32]* @pred_MV_ref, i32 0, i64 0), align 4
  %1131 = sext i32 %blocktype to i64
  %1132 = sext i16 %ref to i32
  %1133 = sub nsw i32 %1132, 2
  %1134 = sext i32 %1133 to i64
  %1135 = load %struct.ImageParameters** @img, align 8
  %1136 = getelementptr inbounds %struct.ImageParameters* %1135, i32 0, i32 34
  %1137 = load i32* %1136, align 4
  %1138 = ashr i32 %1137, 2
  %1139 = add nsw i32 %1138, %2
  %1140 = sext i32 %1139 to i64
  %1141 = load %struct.ImageParameters** @img, align 8
  %1142 = getelementptr inbounds %struct.ImageParameters* %1141, i32 0, i32 33
  %1143 = load i32* %1142, align 4
  %1144 = ashr i32 %1143, 2
  %1145 = add nsw i32 %1144, %1
  %1146 = sext i32 %1145 to i64
  %1147 = load i32****** @all_mincost, align 8
  %1148 = getelementptr inbounds i32***** %1147, i64 %1146
  %1149 = load i32***** %1148, align 8
  %1150 = getelementptr inbounds i32**** %1149, i64 %1140
  %1151 = load i32**** %1150, align 8
  %1152 = getelementptr inbounds i32*** %1151, i64 %1134
  %1153 = load i32*** %1152, align 8
  %1154 = getelementptr inbounds i32** %1153, i64 %1131
  %1155 = load i32** %1154, align 8
  %1156 = getelementptr inbounds i32* %1155, i64 2
  %1157 = load i32* %1156, align 4
  store i32 %1157, i32* getelementptr inbounds ([2 x i32]* @pred_MV_ref, i32 0, i64 1), align 4
  %1158 = load i32* getelementptr inbounds ([2 x i32]* @pred_MV_ref, i32 0, i64 1), align 4
  %1159 = sext i16 %ref to i32
  %1160 = ashr i32 %1159, 1
  %1161 = add nsw i32 %1160, 1
  %1162 = mul nsw i32 %1158, %1161
  %1163 = sitofp i32 %1162 to float
  %1164 = sext i16 %ref to i32
  %1165 = ashr i32 %1164, 1
  %1166 = sitofp i32 %1165 to float
  %1167 = fdiv float %1163, %1166
  %1168 = fptosi float %1167 to i32
  store i32 %1168, i32* getelementptr inbounds ([2 x i32]* @pred_MV_ref, i32 0, i64 1), align 4
  br label %1169

; <label>:1169                                    ; preds = %1091, %1055, %1050
  %1170 = load %struct.ImageParameters** @img, align 8
  %1171 = getelementptr inbounds %struct.ImageParameters* %1170, i32 0, i32 6
  %1172 = load i32* %1171, align 4
  %1173 = icmp eq i32 %1172, 1
  br i1 %1173, label %1174, label %1280

; <label>:1174                                    ; preds = %1169
  %1175 = icmp eq i32 %list, 0
  br i1 %1175, label %1176, label %1280

; <label>:1176                                    ; preds = %1174
  %1177 = sext i16 %ref to i32
  %1178 = icmp eq i32 %1177, 0
  br i1 %1178, label %1182, label %1179

; <label>:1179                                    ; preds = %1176
  %1180 = sext i16 %ref to i32
  %1181 = icmp eq i32 %1180, 1
  br i1 %1181, label %1182, label %1280

; <label>:1182                                    ; preds = %1179, %1176
  %1183 = sext i32 %blocktype to i64
  %1184 = load %struct.ImageParameters** @img, align 8
  %1185 = getelementptr inbounds %struct.ImageParameters* %1184, i32 0, i32 34
  %1186 = load i32* %1185, align 4
  %1187 = ashr i32 %1186, 2
  %1188 = add nsw i32 %1187, %2
  %1189 = sext i32 %1188 to i64
  %1190 = load %struct.ImageParameters** @img, align 8
  %1191 = getelementptr inbounds %struct.ImageParameters* %1190, i32 0, i32 33
  %1192 = load i32* %1191, align 4
  %1193 = ashr i32 %1192, 2
  %1194 = add nsw i32 %1193, %1
  %1195 = sext i32 %1194 to i64
  %1196 = load i32****** @all_bwmincost, align 8
  %1197 = getelementptr inbounds i32***** %1196, i64 %1195
  %1198 = load i32***** %1197, align 8
  %1199 = getelementptr inbounds i32**** %1198, i64 %1189
  %1200 = load i32**** %1199, align 8
  %1201 = getelementptr inbounds i32*** %1200, i64 0
  %1202 = load i32*** %1201, align 8
  %1203 = getelementptr inbounds i32** %1202, i64 %1183
  %1204 = load i32** %1203, align 8
  %1205 = getelementptr inbounds i32* %1204, i64 0
  %1206 = load i32* %1205, align 4
  store i32 %1206, i32* @pred_SAD_ref, align 4
  %1207 = load i32* @flag_intra_SAD, align 4
  %1208 = icmp ne i32 %1207, 0
  br i1 %1208, label %1209, label %1210

; <label>:1209                                    ; preds = %1182
  br label %1212

; <label>:1210                                    ; preds = %1182
  %1211 = load i32* @pred_SAD_ref, align 4
  br label %1212

; <label>:1212                                    ; preds = %1210, %1209
  %1213 = phi i32 [ 0, %1209 ], [ %1211, %1210 ]
  store i32 %1213, i32* @pred_SAD_ref, align 4
  %1214 = sext i32 %blocktype to i64
  %1215 = sext i16 %ref to i64
  %1216 = load %struct.ImageParameters** @img, align 8
  %1217 = getelementptr inbounds %struct.ImageParameters* %1216, i32 0, i32 34
  %1218 = load i32* %1217, align 4
  %1219 = ashr i32 %1218, 2
  %1220 = add nsw i32 %1219, %2
  %1221 = sext i32 %1220 to i64
  %1222 = load %struct.ImageParameters** @img, align 8
  %1223 = getelementptr inbounds %struct.ImageParameters* %1222, i32 0, i32 33
  %1224 = load i32* %1223, align 4
  %1225 = ashr i32 %1224, 2
  %1226 = add nsw i32 %1225, %1
  %1227 = sext i32 %1226 to i64
  %1228 = load i32****** @all_bwmincost, align 8
  %1229 = getelementptr inbounds i32***** %1228, i64 %1227
  %1230 = load i32***** %1229, align 8
  %1231 = getelementptr inbounds i32**** %1230, i64 %1221
  %1232 = load i32**** %1231, align 8
  %1233 = getelementptr inbounds i32*** %1232, i64 %1215
  %1234 = load i32*** %1233, align 8
  %1235 = getelementptr inbounds i32** %1234, i64 %1214
  %1236 = load i32** %1235, align 8
  %1237 = getelementptr inbounds i32* %1236, i64 1
  %1238 = load i32* %1237, align 4
  %1239 = sub nsw i32 0, %n_Bframe.0
  %1240 = mul nsw i32 %1238, %1239
  %1241 = sitofp i32 %1240 to float
  %1242 = sub nsw i32 %N_Bframe.0, %n_Bframe.0
  %1243 = sitofp i32 %1242 to float
  %1244 = fadd float %1243, 1.000000e+00
  %1245 = fdiv float %1241, %1244
  %1246 = fptosi float %1245 to i32
  store i32 %1246, i32* getelementptr inbounds ([2 x i32]* @pred_MV_ref, i32 0, i64 0), align 4
  %1247 = sext i32 %blocktype to i64
  %1248 = sext i16 %ref to i64
  %1249 = load %struct.ImageParameters** @img, align 8
  %1250 = getelementptr inbounds %struct.ImageParameters* %1249, i32 0, i32 34
  %1251 = load i32* %1250, align 4
  %1252 = ashr i32 %1251, 2
  %1253 = add nsw i32 %1252, %2
  %1254 = sext i32 %1253 to i64
  %1255 = load %struct.ImageParameters** @img, align 8
  %1256 = getelementptr inbounds %struct.ImageParameters* %1255, i32 0, i32 33
  %1257 = load i32* %1256, align 4
  %1258 = ashr i32 %1257, 2
  %1259 = add nsw i32 %1258, %1
  %1260 = sext i32 %1259 to i64
  %1261 = load i32****** @all_bwmincost, align 8
  %1262 = getelementptr inbounds i32***** %1261, i64 %1260
  %1263 = load i32***** %1262, align 8
  %1264 = getelementptr inbounds i32**** %1263, i64 %1254
  %1265 = load i32**** %1264, align 8
  %1266 = getelementptr inbounds i32*** %1265, i64 %1248
  %1267 = load i32*** %1266, align 8
  %1268 = getelementptr inbounds i32** %1267, i64 %1247
  %1269 = load i32** %1268, align 8
  %1270 = getelementptr inbounds i32* %1269, i64 2
  %1271 = load i32* %1270, align 4
  %1272 = sub nsw i32 0, %n_Bframe.0
  %1273 = mul nsw i32 %1271, %1272
  %1274 = sitofp i32 %1273 to float
  %1275 = sub nsw i32 %N_Bframe.0, %n_Bframe.0
  %1276 = sitofp i32 %1275 to float
  %1277 = fadd float %1276, 1.000000e+00
  %1278 = fdiv float %1274, %1277
  %1279 = fptosi float %1278 to i32
  store i32 %1279, i32* getelementptr inbounds ([2 x i32]* @pred_MV_ref, i32 0, i64 1), align 4
  br label %1280

; <label>:1280                                    ; preds = %1212, %1179, %1174, %1169
  br label %1498

; <label>:1281                                    ; preds = %1045
  %1282 = sext i16 %ref to i32
  %1283 = icmp sgt i32 %1282, 0
  br i1 %1283, label %1284, label %1389

; <label>:1284                                    ; preds = %1281
  %1285 = sext i32 %blocktype to i64
  %1286 = sext i16 %ref to i32
  %1287 = sub nsw i32 %1286, 1
  %1288 = sext i32 %1287 to i64
  %1289 = load %struct.ImageParameters** @img, align 8
  %1290 = getelementptr inbounds %struct.ImageParameters* %1289, i32 0, i32 34
  %1291 = load i32* %1290, align 4
  %1292 = ashr i32 %1291, 2
  %1293 = add nsw i32 %1292, %2
  %1294 = sext i32 %1293 to i64
  %1295 = load %struct.ImageParameters** @img, align 8
  %1296 = getelementptr inbounds %struct.ImageParameters* %1295, i32 0, i32 33
  %1297 = load i32* %1296, align 4
  %1298 = ashr i32 %1297, 2
  %1299 = add nsw i32 %1298, %1
  %1300 = sext i32 %1299 to i64
  %1301 = load i32****** @all_mincost, align 8
  %1302 = getelementptr inbounds i32***** %1301, i64 %1300
  %1303 = load i32***** %1302, align 8
  %1304 = getelementptr inbounds i32**** %1303, i64 %1294
  %1305 = load i32**** %1304, align 8
  %1306 = getelementptr inbounds i32*** %1305, i64 %1288
  %1307 = load i32*** %1306, align 8
  %1308 = getelementptr inbounds i32** %1307, i64 %1285
  %1309 = load i32** %1308, align 8
  %1310 = getelementptr inbounds i32* %1309, i64 0
  %1311 = load i32* %1310, align 4
  store i32 %1311, i32* @pred_SAD_ref, align 4
  %1312 = load i32* @flag_intra_SAD, align 4
  %1313 = icmp ne i32 %1312, 0
  br i1 %1313, label %1314, label %1315

; <label>:1314                                    ; preds = %1284
  br label %1317

; <label>:1315                                    ; preds = %1284
  %1316 = load i32* @pred_SAD_ref, align 4
  br label %1317

; <label>:1317                                    ; preds = %1315, %1314
  %1318 = phi i32 [ 0, %1314 ], [ %1316, %1315 ]
  store i32 %1318, i32* @pred_SAD_ref, align 4
  %1319 = sext i32 %blocktype to i64
  %1320 = sext i16 %ref to i32
  %1321 = sub nsw i32 %1320, 1
  %1322 = sext i32 %1321 to i64
  %1323 = load %struct.ImageParameters** @img, align 8
  %1324 = getelementptr inbounds %struct.ImageParameters* %1323, i32 0, i32 34
  %1325 = load i32* %1324, align 4
  %1326 = ashr i32 %1325, 2
  %1327 = add nsw i32 %1326, %2
  %1328 = sext i32 %1327 to i64
  %1329 = load %struct.ImageParameters** @img, align 8
  %1330 = getelementptr inbounds %struct.ImageParameters* %1329, i32 0, i32 33
  %1331 = load i32* %1330, align 4
  %1332 = ashr i32 %1331, 2
  %1333 = add nsw i32 %1332, %1
  %1334 = sext i32 %1333 to i64
  %1335 = load i32****** @all_mincost, align 8
  %1336 = getelementptr inbounds i32***** %1335, i64 %1334
  %1337 = load i32***** %1336, align 8
  %1338 = getelementptr inbounds i32**** %1337, i64 %1328
  %1339 = load i32**** %1338, align 8
  %1340 = getelementptr inbounds i32*** %1339, i64 %1322
  %1341 = load i32*** %1340, align 8
  %1342 = getelementptr inbounds i32** %1341, i64 %1319
  %1343 = load i32** %1342, align 8
  %1344 = getelementptr inbounds i32* %1343, i64 1
  %1345 = load i32* %1344, align 4
  store i32 %1345, i32* getelementptr inbounds ([2 x i32]* @pred_MV_ref, i32 0, i64 0), align 4
  %1346 = load i32* getelementptr inbounds ([2 x i32]* @pred_MV_ref, i32 0, i64 0), align 4
  %1347 = sext i16 %ref to i32
  %1348 = add nsw i32 %1347, 1
  %1349 = mul nsw i32 %1346, %1348
  %1350 = sitofp i32 %1349 to float
  %1351 = sitofp i16 %ref to float
  %1352 = fdiv float %1350, %1351
  %1353 = fptosi float %1352 to i32
  store i32 %1353, i32* getelementptr inbounds ([2 x i32]* @pred_MV_ref, i32 0, i64 0), align 4
  %1354 = sext i32 %blocktype to i64
  %1355 = sext i16 %ref to i32
  %1356 = sub nsw i32 %1355, 1
  %1357 = sext i32 %1356 to i64
  %1358 = load %struct.ImageParameters** @img, align 8
  %1359 = getelementptr inbounds %struct.ImageParameters* %1358, i32 0, i32 34
  %1360 = load i32* %1359, align 4
  %1361 = ashr i32 %1360, 2
  %1362 = add nsw i32 %1361, %2
  %1363 = sext i32 %1362 to i64
  %1364 = load %struct.ImageParameters** @img, align 8
  %1365 = getelementptr inbounds %struct.ImageParameters* %1364, i32 0, i32 33
  %1366 = load i32* %1365, align 4
  %1367 = ashr i32 %1366, 2
  %1368 = add nsw i32 %1367, %1
  %1369 = sext i32 %1368 to i64
  %1370 = load i32****** @all_mincost, align 8
  %1371 = getelementptr inbounds i32***** %1370, i64 %1369
  %1372 = load i32***** %1371, align 8
  %1373 = getelementptr inbounds i32**** %1372, i64 %1363
  %1374 = load i32**** %1373, align 8
  %1375 = getelementptr inbounds i32*** %1374, i64 %1357
  %1376 = load i32*** %1375, align 8
  %1377 = getelementptr inbounds i32** %1376, i64 %1354
  %1378 = load i32** %1377, align 8
  %1379 = getelementptr inbounds i32* %1378, i64 2
  %1380 = load i32* %1379, align 4
  store i32 %1380, i32* getelementptr inbounds ([2 x i32]* @pred_MV_ref, i32 0, i64 1), align 4
  %1381 = load i32* getelementptr inbounds ([2 x i32]* @pred_MV_ref, i32 0, i64 1), align 4
  %1382 = sext i16 %ref to i32
  %1383 = add nsw i32 %1382, 1
  %1384 = mul nsw i32 %1381, %1383
  %1385 = sitofp i32 %1384 to float
  %1386 = sitofp i16 %ref to float
  %1387 = fdiv float %1385, %1386
  %1388 = fptosi float %1387 to i32
  store i32 %1388, i32* getelementptr inbounds ([2 x i32]* @pred_MV_ref, i32 0, i64 1), align 4
  br label %1389

; <label>:1389                                    ; preds = %1317, %1281
  %1390 = load %struct.ImageParameters** @img, align 8
  %1391 = getelementptr inbounds %struct.ImageParameters* %1390, i32 0, i32 6
  %1392 = load i32* %1391, align 4
  %1393 = icmp eq i32 %1392, 1
  br i1 %1393, label %1394, label %1497

; <label>:1394                                    ; preds = %1389
  %1395 = icmp eq i32 %list, 0
  br i1 %1395, label %1396, label %1497

; <label>:1396                                    ; preds = %1394
  %1397 = sext i16 %ref to i32
  %1398 = icmp eq i32 %1397, 0
  br i1 %1398, label %1399, label %1497

; <label>:1399                                    ; preds = %1396
  %1400 = sext i32 %blocktype to i64
  %1401 = load %struct.ImageParameters** @img, align 8
  %1402 = getelementptr inbounds %struct.ImageParameters* %1401, i32 0, i32 34
  %1403 = load i32* %1402, align 4
  %1404 = ashr i32 %1403, 2
  %1405 = add nsw i32 %1404, %2
  %1406 = sext i32 %1405 to i64
  %1407 = load %struct.ImageParameters** @img, align 8
  %1408 = getelementptr inbounds %struct.ImageParameters* %1407, i32 0, i32 33
  %1409 = load i32* %1408, align 4
  %1410 = ashr i32 %1409, 2
  %1411 = add nsw i32 %1410, %1
  %1412 = sext i32 %1411 to i64
  %1413 = load i32****** @all_bwmincost, align 8
  %1414 = getelementptr inbounds i32***** %1413, i64 %1412
  %1415 = load i32***** %1414, align 8
  %1416 = getelementptr inbounds i32**** %1415, i64 %1406
  %1417 = load i32**** %1416, align 8
  %1418 = getelementptr inbounds i32*** %1417, i64 0
  %1419 = load i32*** %1418, align 8
  %1420 = getelementptr inbounds i32** %1419, i64 %1400
  %1421 = load i32** %1420, align 8
  %1422 = getelementptr inbounds i32* %1421, i64 0
  %1423 = load i32* %1422, align 4
  store i32 %1423, i32* @pred_SAD_ref, align 4
  %1424 = load i32* @flag_intra_SAD, align 4
  %1425 = icmp ne i32 %1424, 0
  br i1 %1425, label %1426, label %1427

; <label>:1426                                    ; preds = %1399
  br label %1429

; <label>:1427                                    ; preds = %1399
  %1428 = load i32* @pred_SAD_ref, align 4
  br label %1429

; <label>:1429                                    ; preds = %1427, %1426
  %1430 = phi i32 [ 0, %1426 ], [ %1428, %1427 ]
  store i32 %1430, i32* @pred_SAD_ref, align 4
  %1431 = sext i32 %blocktype to i64
  %1432 = sext i16 %ref to i64
  %1433 = load %struct.ImageParameters** @img, align 8
  %1434 = getelementptr inbounds %struct.ImageParameters* %1433, i32 0, i32 34
  %1435 = load i32* %1434, align 4
  %1436 = ashr i32 %1435, 2
  %1437 = add nsw i32 %1436, %2
  %1438 = sext i32 %1437 to i64
  %1439 = load %struct.ImageParameters** @img, align 8
  %1440 = getelementptr inbounds %struct.ImageParameters* %1439, i32 0, i32 33
  %1441 = load i32* %1440, align 4
  %1442 = ashr i32 %1441, 2
  %1443 = add nsw i32 %1442, %1
  %1444 = sext i32 %1443 to i64
  %1445 = load i32****** @all_bwmincost, align 8
  %1446 = getelementptr inbounds i32***** %1445, i64 %1444
  %1447 = load i32***** %1446, align 8
  %1448 = getelementptr inbounds i32**** %1447, i64 %1438
  %1449 = load i32**** %1448, align 8
  %1450 = getelementptr inbounds i32*** %1449, i64 %1432
  %1451 = load i32*** %1450, align 8
  %1452 = getelementptr inbounds i32** %1451, i64 %1431
  %1453 = load i32** %1452, align 8
  %1454 = getelementptr inbounds i32* %1453, i64 1
  %1455 = load i32* %1454, align 4
  %1456 = sub nsw i32 0, %n_Bframe.0
  %1457 = mul nsw i32 %1455, %1456
  %1458 = sitofp i32 %1457 to float
  %1459 = sub nsw i32 %N_Bframe.0, %n_Bframe.0
  %1460 = sitofp i32 %1459 to float
  %1461 = fadd float %1460, 1.000000e+00
  %1462 = fdiv float %1458, %1461
  %1463 = fptosi float %1462 to i32
  store i32 %1463, i32* getelementptr inbounds ([2 x i32]* @pred_MV_ref, i32 0, i64 0), align 4
  %1464 = sext i32 %blocktype to i64
  %1465 = sext i16 %ref to i64
  %1466 = load %struct.ImageParameters** @img, align 8
  %1467 = getelementptr inbounds %struct.ImageParameters* %1466, i32 0, i32 34
  %1468 = load i32* %1467, align 4
  %1469 = ashr i32 %1468, 2
  %1470 = add nsw i32 %1469, %2
  %1471 = sext i32 %1470 to i64
  %1472 = load %struct.ImageParameters** @img, align 8
  %1473 = getelementptr inbounds %struct.ImageParameters* %1472, i32 0, i32 33
  %1474 = load i32* %1473, align 4
  %1475 = ashr i32 %1474, 2
  %1476 = add nsw i32 %1475, %1
  %1477 = sext i32 %1476 to i64
  %1478 = load i32****** @all_bwmincost, align 8
  %1479 = getelementptr inbounds i32***** %1478, i64 %1477
  %1480 = load i32***** %1479, align 8
  %1481 = getelementptr inbounds i32**** %1480, i64 %1471
  %1482 = load i32**** %1481, align 8
  %1483 = getelementptr inbounds i32*** %1482, i64 %1465
  %1484 = load i32*** %1483, align 8
  %1485 = getelementptr inbounds i32** %1484, i64 %1464
  %1486 = load i32** %1485, align 8
  %1487 = getelementptr inbounds i32* %1486, i64 2
  %1488 = load i32* %1487, align 4
  %1489 = sub nsw i32 0, %n_Bframe.0
  %1490 = mul nsw i32 %1488, %1489
  %1491 = sitofp i32 %1490 to float
  %1492 = sub nsw i32 %N_Bframe.0, %n_Bframe.0
  %1493 = sitofp i32 %1492 to float
  %1494 = fadd float %1493, 1.000000e+00
  %1495 = fdiv float %1491, %1494
  %1496 = fptosi float %1495 to i32
  store i32 %1496, i32* getelementptr inbounds ([2 x i32]* @pred_MV_ref, i32 0, i64 1), align 4
  br label %1497

; <label>:1497                                    ; preds = %1429, %1396, %1394, %1389
  br label %1498

; <label>:1498                                    ; preds = %1497, %1280
  br label %1499

; <label>:1499                                    ; preds = %1498, %93
  %1500 = load %struct.InputParameters** @input, align 8
  %1501 = getelementptr inbounds %struct.InputParameters* %1500, i32 0, i32 134
  %1502 = load i32* %1501, align 4
  %1503 = icmp ne i32 %1502, 0
  br i1 %1503, label %1504, label %1505

; <label>:1504                                    ; preds = %1499
  store i32 %blocktype, i32* @FME_blocktype, align 4
  br label %1505

; <label>:1505                                    ; preds = %1504, %1499
  %1506 = load %struct.storable_picture** @enc_picture, align 8
  %1507 = getelementptr inbounds %struct.storable_picture* %1506, i32 0, i32 32
  %1508 = load i16**** %1507, align 8
  %1509 = load %struct.storable_picture** @enc_picture, align 8
  %1510 = getelementptr inbounds %struct.storable_picture* %1509, i32 0, i32 35
  %1511 = load i16***** %1510, align 8
  call void @SetMotionVectorPredictor(i16* %67, i16*** %1508, i16**** %1511, i16 signext %ref, i32 %list, i32 %1, i32 %2, i32 %8, i32 %14)
  %1512 = getelementptr inbounds i16* %67, i64 0
  %1513 = load i16* %1512, align 2
  %1514 = getelementptr inbounds i16* %67, i64 1
  %1515 = load i16* %1514, align 2
  %1516 = load %struct.InputParameters** @input, align 8
  %1517 = getelementptr inbounds %struct.InputParameters* %1516, i32 0, i32 134
  %1518 = load i32* %1517, align 4
  %1519 = icmp ne i32 %1518, 0
  br i1 %1519, label %1520, label %1656

; <label>:1520                                    ; preds = %1505
  %1521 = sext i16 %1513 to i32
  %1522 = sdiv i32 %1521, 4
  %1523 = trunc i32 %1522 to i16
  store i16 %1523, i16* %mv_x, align 2
  %1524 = sext i16 %1515 to i32
  %1525 = sdiv i32 %1524, 4
  %1526 = trunc i32 %1525 to i16
  store i16 %1526, i16* %mv_y, align 2
  %1527 = load %struct.InputParameters** @input, align 8
  %1528 = getelementptr inbounds %struct.InputParameters* %1527, i32 0, i32 85
  %1529 = load i32* %1528, align 4
  %1530 = icmp ne i32 %1529, 0
  br i1 %1530, label %1584, label %1531

; <label>:1531                                    ; preds = %1520
  %1532 = sub nsw i32 0, %search_range
  %1533 = load i16* %mv_x, align 2
  %1534 = sext i16 %1533 to i32
  %1535 = icmp slt i32 %search_range, %1534
  br i1 %1535, label %1536, label %1537

; <label>:1536                                    ; preds = %1531
  br label %1540

; <label>:1537                                    ; preds = %1531
  %1538 = load i16* %mv_x, align 2
  %1539 = sext i16 %1538 to i32
  br label %1540

; <label>:1540                                    ; preds = %1537, %1536
  %1541 = phi i32 [ %search_range, %1536 ], [ %1539, %1537 ]
  %1542 = icmp sgt i32 %1532, %1541
  br i1 %1542, label %1543, label %1545

; <label>:1543                                    ; preds = %1540
  %1544 = sub nsw i32 0, %search_range
  br label %1555

; <label>:1545                                    ; preds = %1540
  %1546 = load i16* %mv_x, align 2
  %1547 = sext i16 %1546 to i32
  %1548 = icmp slt i32 %search_range, %1547
  br i1 %1548, label %1549, label %1550

; <label>:1549                                    ; preds = %1545
  br label %1553

; <label>:1550                                    ; preds = %1545
  %1551 = load i16* %mv_x, align 2
  %1552 = sext i16 %1551 to i32
  br label %1553

; <label>:1553                                    ; preds = %1550, %1549
  %1554 = phi i32 [ %search_range, %1549 ], [ %1552, %1550 ]
  br label %1555

; <label>:1555                                    ; preds = %1553, %1543
  %1556 = phi i32 [ %1544, %1543 ], [ %1554, %1553 ]
  %1557 = trunc i32 %1556 to i16
  store i16 %1557, i16* %mv_x, align 2
  %1558 = sub nsw i32 0, %search_range
  %1559 = load i16* %mv_y, align 2
  %1560 = sext i16 %1559 to i32
  %1561 = icmp slt i32 %search_range, %1560
  br i1 %1561, label %1562, label %1563

; <label>:1562                                    ; preds = %1555
  br label %1566

; <label>:1563                                    ; preds = %1555
  %1564 = load i16* %mv_y, align 2
  %1565 = sext i16 %1564 to i32
  br label %1566

; <label>:1566                                    ; preds = %1563, %1562
  %1567 = phi i32 [ %search_range, %1562 ], [ %1565, %1563 ]
  %1568 = icmp sgt i32 %1558, %1567
  br i1 %1568, label %1569, label %1571

; <label>:1569                                    ; preds = %1566
  %1570 = sub nsw i32 0, %search_range
  br label %1581

; <label>:1571                                    ; preds = %1566
  %1572 = load i16* %mv_y, align 2
  %1573 = sext i16 %1572 to i32
  %1574 = icmp slt i32 %search_range, %1573
  br i1 %1574, label %1575, label %1576

; <label>:1575                                    ; preds = %1571
  br label %1579

; <label>:1576                                    ; preds = %1571
  %1577 = load i16* %mv_y, align 2
  %1578 = sext i16 %1577 to i32
  br label %1579

; <label>:1579                                    ; preds = %1576, %1575
  %1580 = phi i32 [ %search_range, %1575 ], [ %1578, %1576 ]
  br label %1581

; <label>:1581                                    ; preds = %1579, %1569
  %1582 = phi i32 [ %1570, %1569 ], [ %1580, %1579 ]
  %1583 = trunc i32 %1582 to i16
  store i16 %1583, i16* %mv_y, align 2
  br label %1584

; <label>:1584                                    ; preds = %1581, %1520
  %1585 = call i32 @FastIntegerPelBlockMotionSearch(i16** getelementptr inbounds ([16 x i16*]* @BlockMotionSearch.orig_pic, i32 0, i32 0), i16 signext %ref, i32 %list, i32 %18, i32 %22, i32 %blocktype, i16 signext %1513, i16 signext %1515, i16* %mv_x, i16* %mv_y, i32 %search_range, i32 2147483647, double %lambda)
  br label %1586

; <label>:1586                                    ; preds = %1653, %1584
  %i.1 = phi i32 [ 0, %1584 ], [ %1654, %1653 ]
  %1587 = ashr i32 %8, 2
  %1588 = icmp slt i32 %i.1, %1587
  br i1 %1588, label %1589, label %1655

; <label>:1589                                    ; preds = %1586
  br label %1590

; <label>:1590                                    ; preds = %1650, %1589
  %j.1 = phi i32 [ 0, %1589 ], [ %1651, %1650 ]
  %1591 = ashr i32 %14, 2
  %1592 = icmp slt i32 %j.1, %1591
  br i1 %1592, label %1593, label %1652

; <label>:1593                                    ; preds = %1590
  %1594 = icmp eq i32 %list, 0
  br i1 %1594, label %1595, label %1622

; <label>:1595                                    ; preds = %1593
  %1596 = sext i32 %blocktype to i64
  %1597 = sext i16 %ref to i64
  %1598 = load %struct.ImageParameters** @img, align 8
  %1599 = getelementptr inbounds %struct.ImageParameters* %1598, i32 0, i32 34
  %1600 = load i32* %1599, align 4
  %1601 = ashr i32 %1600, 2
  %1602 = add nsw i32 %1601, %2
  %1603 = add nsw i32 %1602, %j.1
  %1604 = sext i32 %1603 to i64
  %1605 = load %struct.ImageParameters** @img, align 8
  %1606 = getelementptr inbounds %struct.ImageParameters* %1605, i32 0, i32 33
  %1607 = load i32* %1606, align 4
  %1608 = ashr i32 %1607, 2
  %1609 = add nsw i32 %1608, %1
  %1610 = add nsw i32 %1609, %i.1
  %1611 = sext i32 %1610 to i64
  %1612 = load i32****** @all_mincost, align 8
  %1613 = getelementptr inbounds i32***** %1612, i64 %1611
  %1614 = load i32***** %1613, align 8
  %1615 = getelementptr inbounds i32**** %1614, i64 %1604
  %1616 = load i32**** %1615, align 8
  %1617 = getelementptr inbounds i32*** %1616, i64 %1597
  %1618 = load i32*** %1617, align 8
  %1619 = getelementptr inbounds i32** %1618, i64 %1596
  %1620 = load i32** %1619, align 8
  %1621 = getelementptr inbounds i32* %1620, i64 0
  store i32 %1585, i32* %1621, align 4
  br label %1649

; <label>:1622                                    ; preds = %1593
  %1623 = sext i32 %blocktype to i64
  %1624 = sext i16 %ref to i64
  %1625 = load %struct.ImageParameters** @img, align 8
  %1626 = getelementptr inbounds %struct.ImageParameters* %1625, i32 0, i32 34
  %1627 = load i32* %1626, align 4
  %1628 = ashr i32 %1627, 2
  %1629 = add nsw i32 %1628, %2
  %1630 = add nsw i32 %1629, %j.1
  %1631 = sext i32 %1630 to i64
  %1632 = load %struct.ImageParameters** @img, align 8
  %1633 = getelementptr inbounds %struct.ImageParameters* %1632, i32 0, i32 33
  %1634 = load i32* %1633, align 4
  %1635 = ashr i32 %1634, 2
  %1636 = add nsw i32 %1635, %1
  %1637 = add nsw i32 %1636, %i.1
  %1638 = sext i32 %1637 to i64
  %1639 = load i32****** @all_bwmincost, align 8
  %1640 = getelementptr inbounds i32***** %1639, i64 %1638
  %1641 = load i32***** %1640, align 8
  %1642 = getelementptr inbounds i32**** %1641, i64 %1631
  %1643 = load i32**** %1642, align 8
  %1644 = getelementptr inbounds i32*** %1643, i64 %1624
  %1645 = load i32*** %1644, align 8
  %1646 = getelementptr inbounds i32** %1645, i64 %1623
  %1647 = load i32** %1646, align 8
  %1648 = getelementptr inbounds i32* %1647, i64 0
  store i32 %1585, i32* %1648, align 4
  br label %1649

; <label>:1649                                    ; preds = %1622, %1595
  br label %1650

; <label>:1650                                    ; preds = %1649
  %1651 = add nsw i32 %j.1, 1
  br label %1590

; <label>:1652                                    ; preds = %1590
  br label %1653

; <label>:1653                                    ; preds = %1652
  %1654 = add nsw i32 %i.1, 1
  br label %1586

; <label>:1655                                    ; preds = %1586
  br label %1658

; <label>:1656                                    ; preds = %1505
  %1657 = call i32 @FastFullPelBlockMotionSearch(i16** getelementptr inbounds ([16 x i16*]* @BlockMotionSearch.orig_pic, i32 0, i32 0), i16 signext %ref, i32 %list, i32 %18, i32 %22, i32 %blocktype, i16 signext %1513, i16 signext %1515, i16* %mv_x, i16* %mv_y, i32 %search_range, i32 2147483647, double %lambda)
  br label %1658

; <label>:1658                                    ; preds = %1656, %1655
  %min_mcost.0 = phi i32 [ %1585, %1655 ], [ %1657, %1656 ]
  %1659 = load %struct.InputParameters** @input, align 8
  %1660 = getelementptr inbounds %struct.InputParameters* %1659, i32 0, i32 6
  %1661 = load i32* %1660, align 4
  %1662 = icmp ne i32 %1661, 0
  br i1 %1662, label %1663, label %1669

; <label>:1663                                    ; preds = %1658
  %1664 = load %struct.InputParameters** @input, align 8
  %1665 = getelementptr inbounds %struct.InputParameters* %1664, i32 0, i32 7
  %1666 = load i32* %1665, align 4
  %1667 = icmp ne i32 %1666, 0
  br i1 %1667, label %1669, label %1668

; <label>:1668                                    ; preds = %1663
  br label %1669

; <label>:1669                                    ; preds = %1668, %1663, %1658
  %min_mcost.1 = phi i32 [ %min_mcost.0, %1663 ], [ 2147483647, %1668 ], [ %min_mcost.0, %1658 ]
  %1670 = load %struct.InputParameters** @input, align 8
  %1671 = getelementptr inbounds %struct.InputParameters* %1670, i32 0, i32 134
  %1672 = load i32* %1671, align 4
  %1673 = icmp ne i32 %1672, 0
  br i1 %1673, label %1674, label %1811

; <label>:1674                                    ; preds = %1669
  %1675 = icmp sgt i32 %blocktype, 3
  br i1 %1675, label %1676, label %1678

; <label>:1676                                    ; preds = %1674
  %1677 = call i32 @FastSubPelBlockMotionSearch(i16** getelementptr inbounds ([16 x i16*]* @BlockMotionSearch.orig_pic, i32 0, i32 0), i16 signext %ref, i32 %list, i32 %18, i32 %22, i32 %blocktype, i16 signext %1513, i16 signext %1515, i16* %mv_x, i16* %mv_y, i32 9, i32 9, i32 %min_mcost.1, double %lambda, i32 0)
  br label %1680

; <label>:1678                                    ; preds = %1674
  %1679 = call i32 @SubPelBlockMotionSearch(i16** getelementptr inbounds ([16 x i16*]* @BlockMotionSearch.orig_pic, i32 0, i32 0), i16 signext %ref, i32 %list, i32 %18, i32 %22, i32 %blocktype, i16 signext %1513, i16 signext %1515, i16* %mv_x, i16* %mv_y, i32 9, i32 9, i32 %min_mcost.1, double %lambda)
  br label %1680

; <label>:1680                                    ; preds = %1678, %1676
  %min_mcost.2 = phi i32 [ %1677, %1676 ], [ %1679, %1678 ]
  br label %1681

; <label>:1681                                    ; preds = %1808, %1680
  %i.2 = phi i32 [ 0, %1680 ], [ %1809, %1808 ]
  %1682 = ashr i32 %8, 2
  %1683 = icmp slt i32 %i.2, %1682
  br i1 %1683, label %1684, label %1810

; <label>:1684                                    ; preds = %1681
  br label %1685

; <label>:1685                                    ; preds = %1805, %1684
  %j.2 = phi i32 [ 0, %1684 ], [ %1806, %1805 ]
  %1686 = ashr i32 %14, 2
  %1687 = icmp slt i32 %j.2, %1686
  br i1 %1687, label %1688, label %1807

; <label>:1688                                    ; preds = %1685
  %1689 = icmp eq i32 %list, 0
  br i1 %1689, label %1690, label %1747

; <label>:1690                                    ; preds = %1688
  %1691 = load i16* %mv_x, align 2
  %1692 = sext i16 %1691 to i32
  %1693 = sext i32 %blocktype to i64
  %1694 = sext i16 %ref to i64
  %1695 = load %struct.ImageParameters** @img, align 8
  %1696 = getelementptr inbounds %struct.ImageParameters* %1695, i32 0, i32 34
  %1697 = load i32* %1696, align 4
  %1698 = ashr i32 %1697, 2
  %1699 = add nsw i32 %1698, %2
  %1700 = add nsw i32 %1699, %j.2
  %1701 = sext i32 %1700 to i64
  %1702 = load %struct.ImageParameters** @img, align 8
  %1703 = getelementptr inbounds %struct.ImageParameters* %1702, i32 0, i32 33
  %1704 = load i32* %1703, align 4
  %1705 = ashr i32 %1704, 2
  %1706 = add nsw i32 %1705, %1
  %1707 = add nsw i32 %1706, %i.2
  %1708 = sext i32 %1707 to i64
  %1709 = load i32****** @all_mincost, align 8
  %1710 = getelementptr inbounds i32***** %1709, i64 %1708
  %1711 = load i32***** %1710, align 8
  %1712 = getelementptr inbounds i32**** %1711, i64 %1701
  %1713 = load i32**** %1712, align 8
  %1714 = getelementptr inbounds i32*** %1713, i64 %1694
  %1715 = load i32*** %1714, align 8
  %1716 = getelementptr inbounds i32** %1715, i64 %1693
  %1717 = load i32** %1716, align 8
  %1718 = getelementptr inbounds i32* %1717, i64 1
  store i32 %1692, i32* %1718, align 4
  %1719 = load i16* %mv_y, align 2
  %1720 = sext i16 %1719 to i32
  %1721 = sext i32 %blocktype to i64
  %1722 = sext i16 %ref to i64
  %1723 = load %struct.ImageParameters** @img, align 8
  %1724 = getelementptr inbounds %struct.ImageParameters* %1723, i32 0, i32 34
  %1725 = load i32* %1724, align 4
  %1726 = ashr i32 %1725, 2
  %1727 = add nsw i32 %1726, %2
  %1728 = add nsw i32 %1727, %j.2
  %1729 = sext i32 %1728 to i64
  %1730 = load %struct.ImageParameters** @img, align 8
  %1731 = getelementptr inbounds %struct.ImageParameters* %1730, i32 0, i32 33
  %1732 = load i32* %1731, align 4
  %1733 = ashr i32 %1732, 2
  %1734 = add nsw i32 %1733, %1
  %1735 = add nsw i32 %1734, %i.2
  %1736 = sext i32 %1735 to i64
  %1737 = load i32****** @all_mincost, align 8
  %1738 = getelementptr inbounds i32***** %1737, i64 %1736
  %1739 = load i32***** %1738, align 8
  %1740 = getelementptr inbounds i32**** %1739, i64 %1729
  %1741 = load i32**** %1740, align 8
  %1742 = getelementptr inbounds i32*** %1741, i64 %1722
  %1743 = load i32*** %1742, align 8
  %1744 = getelementptr inbounds i32** %1743, i64 %1721
  %1745 = load i32** %1744, align 8
  %1746 = getelementptr inbounds i32* %1745, i64 2
  store i32 %1720, i32* %1746, align 4
  br label %1804

; <label>:1747                                    ; preds = %1688
  %1748 = load i16* %mv_x, align 2
  %1749 = sext i16 %1748 to i32
  %1750 = sext i32 %blocktype to i64
  %1751 = sext i16 %ref to i64
  %1752 = load %struct.ImageParameters** @img, align 8
  %1753 = getelementptr inbounds %struct.ImageParameters* %1752, i32 0, i32 34
  %1754 = load i32* %1753, align 4
  %1755 = ashr i32 %1754, 2
  %1756 = add nsw i32 %1755, %2
  %1757 = add nsw i32 %1756, %j.2
  %1758 = sext i32 %1757 to i64
  %1759 = load %struct.ImageParameters** @img, align 8
  %1760 = getelementptr inbounds %struct.ImageParameters* %1759, i32 0, i32 33
  %1761 = load i32* %1760, align 4
  %1762 = ashr i32 %1761, 2
  %1763 = add nsw i32 %1762, %1
  %1764 = add nsw i32 %1763, %i.2
  %1765 = sext i32 %1764 to i64
  %1766 = load i32****** @all_bwmincost, align 8
  %1767 = getelementptr inbounds i32***** %1766, i64 %1765
  %1768 = load i32***** %1767, align 8
  %1769 = getelementptr inbounds i32**** %1768, i64 %1758
  %1770 = load i32**** %1769, align 8
  %1771 = getelementptr inbounds i32*** %1770, i64 %1751
  %1772 = load i32*** %1771, align 8
  %1773 = getelementptr inbounds i32** %1772, i64 %1750
  %1774 = load i32** %1773, align 8
  %1775 = getelementptr inbounds i32* %1774, i64 1
  store i32 %1749, i32* %1775, align 4
  %1776 = load i16* %mv_y, align 2
  %1777 = sext i16 %1776 to i32
  %1778 = sext i32 %blocktype to i64
  %1779 = sext i16 %ref to i64
  %1780 = load %struct.ImageParameters** @img, align 8
  %1781 = getelementptr inbounds %struct.ImageParameters* %1780, i32 0, i32 34
  %1782 = load i32* %1781, align 4
  %1783 = ashr i32 %1782, 2
  %1784 = add nsw i32 %1783, %2
  %1785 = add nsw i32 %1784, %j.2
  %1786 = sext i32 %1785 to i64
  %1787 = load %struct.ImageParameters** @img, align 8
  %1788 = getelementptr inbounds %struct.ImageParameters* %1787, i32 0, i32 33
  %1789 = load i32* %1788, align 4
  %1790 = ashr i32 %1789, 2
  %1791 = add nsw i32 %1790, %1
  %1792 = add nsw i32 %1791, %i.2
  %1793 = sext i32 %1792 to i64
  %1794 = load i32****** @all_bwmincost, align 8
  %1795 = getelementptr inbounds i32***** %1794, i64 %1793
  %1796 = load i32***** %1795, align 8
  %1797 = getelementptr inbounds i32**** %1796, i64 %1786
  %1798 = load i32**** %1797, align 8
  %1799 = getelementptr inbounds i32*** %1798, i64 %1779
  %1800 = load i32*** %1799, align 8
  %1801 = getelementptr inbounds i32** %1800, i64 %1778
  %1802 = load i32** %1801, align 8
  %1803 = getelementptr inbounds i32* %1802, i64 2
  store i32 %1777, i32* %1803, align 4
  br label %1804

; <label>:1804                                    ; preds = %1747, %1690
  br label %1805

; <label>:1805                                    ; preds = %1804
  %1806 = add nsw i32 %j.2, 1
  br label %1685

; <label>:1807                                    ; preds = %1685
  br label %1808

; <label>:1808                                    ; preds = %1807
  %1809 = add nsw i32 %i.2, 1
  br label %1681

; <label>:1810                                    ; preds = %1681
  br label %1824

; <label>:1811                                    ; preds = %1669
  %1812 = load %struct.InputParameters** @input, align 8
  %1813 = getelementptr inbounds %struct.InputParameters* %1812, i32 0, i32 6
  %1814 = load i32* %1813, align 4
  %1815 = icmp ne i32 %1814, 0
  br i1 %1815, label %1816, label %1822

; <label>:1816                                    ; preds = %1811
  %1817 = load %struct.InputParameters** @input, align 8
  %1818 = getelementptr inbounds %struct.InputParameters* %1817, i32 0, i32 7
  %1819 = load i32* %1818, align 4
  %1820 = icmp ne i32 %1819, 0
  br i1 %1820, label %1822, label %1821

; <label>:1821                                    ; preds = %1816
  br label %1822

; <label>:1822                                    ; preds = %1821, %1816, %1811
  %min_mcost.3 = phi i32 [ %min_mcost.1, %1816 ], [ 2147483647, %1821 ], [ %min_mcost.1, %1811 ]
  %1823 = call i32 @SubPelBlockMotionSearch(i16** getelementptr inbounds ([16 x i16*]* @BlockMotionSearch.orig_pic, i32 0, i32 0), i16 signext %ref, i32 %list, i32 %18, i32 %22, i32 %blocktype, i16 signext %1513, i16 signext %1515, i16* %mv_x, i16* %mv_y, i32 9, i32 9, i32 %min_mcost.3, double %lambda)
  br label %1824

; <label>:1824                                    ; preds = %1822, %1810
  %min_mcost.4 = phi i32 [ %min_mcost.2, %1810 ], [ %1823, %1822 ]
  %1825 = load %struct.InputParameters** @input, align 8
  %1826 = getelementptr inbounds %struct.InputParameters* %1825, i32 0, i32 85
  %1827 = load i32* %1826, align 4
  %1828 = icmp ne i32 %1827, 0
  br i1 %1828, label %1882, label %1829

; <label>:1829                                    ; preds = %1824
  %1830 = icmp eq i32 %blocktype, 1
  br i1 %1830, label %1831, label %1881

; <label>:1831                                    ; preds = %1829
  %1832 = load %struct.ImageParameters** @img, align 8
  %1833 = getelementptr inbounds %struct.ImageParameters* %1832, i32 0, i32 6
  %1834 = load i32* %1833, align 4
  %1835 = icmp eq i32 %1834, 0
  br i1 %1835, label %1841, label %1836

; <label>:1836                                    ; preds = %1831
  %1837 = load %struct.ImageParameters** @img, align 8
  %1838 = getelementptr inbounds %struct.ImageParameters* %1837, i32 0, i32 6
  %1839 = load i32* %1838, align 4
  %1840 = icmp eq i32 %1839, 3
  br i1 %1840, label %1841, label %1881

; <label>:1841                                    ; preds = %1836, %1831
  call void @FindSkipModeMotionVector()
  %1842 = call i32 @GetSkipCostMB(double %lambda)
  %1843 = fmul double 8.000000e+00, %lambda
  %1844 = fadd double %1843, 4.999000e-01
  %1845 = call double @floor(double %1844) #5
  %1846 = fptosi double %1845 to i32
  %1847 = sub nsw i32 %1842, %1846
  %1848 = icmp slt i32 %1847, %min_mcost.4
  br i1 %1848, label %1849, label %1880

; <label>:1849                                    ; preds = %1841
  %1850 = load %struct.ImageParameters** @img, align 8
  %1851 = getelementptr inbounds %struct.ImageParameters* %1850, i32 0, i32 71
  %1852 = load i16******* %1851, align 8
  %1853 = getelementptr inbounds i16****** %1852, i64 0
  %1854 = load i16****** %1853, align 8
  %1855 = getelementptr inbounds i16***** %1854, i64 0
  %1856 = load i16***** %1855, align 8
  %1857 = getelementptr inbounds i16**** %1856, i64 0
  %1858 = load i16**** %1857, align 8
  %1859 = getelementptr inbounds i16*** %1858, i64 0
  %1860 = load i16*** %1859, align 8
  %1861 = getelementptr inbounds i16** %1860, i64 0
  %1862 = load i16** %1861, align 8
  %1863 = getelementptr inbounds i16* %1862, i64 0
  %1864 = load i16* %1863, align 2
  store i16 %1864, i16* %mv_x, align 2
  %1865 = load %struct.ImageParameters** @img, align 8
  %1866 = getelementptr inbounds %struct.ImageParameters* %1865, i32 0, i32 71
  %1867 = load i16******* %1866, align 8
  %1868 = getelementptr inbounds i16****** %1867, i64 0
  %1869 = load i16****** %1868, align 8
  %1870 = getelementptr inbounds i16***** %1869, i64 0
  %1871 = load i16***** %1870, align 8
  %1872 = getelementptr inbounds i16**** %1871, i64 0
  %1873 = load i16**** %1872, align 8
  %1874 = getelementptr inbounds i16*** %1873, i64 0
  %1875 = load i16*** %1874, align 8
  %1876 = getelementptr inbounds i16** %1875, i64 0
  %1877 = load i16** %1876, align 8
  %1878 = getelementptr inbounds i16* %1877, i64 1
  %1879 = load i16* %1878, align 2
  store i16 %1879, i16* %mv_y, align 2
  br label %1880

; <label>:1880                                    ; preds = %1849, %1841
  %min_mcost.5 = phi i32 [ %1847, %1849 ], [ %min_mcost.4, %1841 ]
  br label %1881

; <label>:1881                                    ; preds = %1880, %1836, %1829
  %min_mcost.6 = phi i32 [ %min_mcost.5, %1880 ], [ %min_mcost.4, %1836 ], [ %min_mcost.4, %1829 ]
  br label %1882

; <label>:1882                                    ; preds = %1881, %1824
  %min_mcost.7 = phi i32 [ %min_mcost.4, %1824 ], [ %min_mcost.6, %1881 ]
  %1883 = load %struct.InputParameters** @input, align 8
  %1884 = getelementptr inbounds %struct.InputParameters* %1883, i32 0, i32 134
  %1885 = load i32* %1884, align 4
  %1886 = icmp ne i32 %1885, 0
  br i1 %1886, label %1887, label %1970

; <label>:1887                                    ; preds = %1882
  %1888 = load %struct.ImageParameters** @img, align 8
  %1889 = getelementptr inbounds %struct.ImageParameters* %1888, i32 0, i32 33
  %1890 = load i32* %1889, align 4
  %1891 = ashr i32 %1890, 2
  %1892 = add nsw i32 %1891, %1
  %1893 = load %struct.ImageParameters** @img, align 8
  %1894 = getelementptr inbounds %struct.ImageParameters* %1893, i32 0, i32 34
  %1895 = load i32* %1894, align 4
  %1896 = ashr i32 %1895, 2
  %1897 = add nsw i32 %1896, %2
  br label %1898

; <label>:1898                                    ; preds = %1967, %1887
  %i.3 = phi i32 [ 0, %1887 ], [ %1968, %1967 ]
  %1899 = ashr i32 %8, 2
  %1900 = icmp slt i32 %i.3, %1899
  br i1 %1900, label %1901, label %1969

; <label>:1901                                    ; preds = %1898
  br label %1902

; <label>:1902                                    ; preds = %1964, %1901
  %j.3 = phi i32 [ 0, %1901 ], [ %1965, %1964 ]
  %1903 = ashr i32 %14, 2
  %1904 = icmp slt i32 %j.3, %1903
  br i1 %1904, label %1905, label %1966

; <label>:1905                                    ; preds = %1902
  %1906 = load i16* %mv_x, align 2
  %1907 = sext i32 %blocktype to i64
  %1908 = sext i16 %ref to i64
  %1909 = sext i32 %list to i64
  %1910 = add nsw i32 %2, %j.3
  %1911 = sext i32 %1910 to i64
  %1912 = add nsw i32 %1, %i.3
  %1913 = sext i32 %1912 to i64
  %1914 = getelementptr inbounds i16****** %31, i64 %1913
  %1915 = load i16****** %1914, align 8
  %1916 = getelementptr inbounds i16***** %1915, i64 %1911
  %1917 = load i16***** %1916, align 8
  %1918 = getelementptr inbounds i16**** %1917, i64 %1909
  %1919 = load i16**** %1918, align 8
  %1920 = getelementptr inbounds i16*** %1919, i64 %1908
  %1921 = load i16*** %1920, align 8
  %1922 = getelementptr inbounds i16** %1921, i64 %1907
  %1923 = load i16** %1922, align 8
  %1924 = getelementptr inbounds i16* %1923, i64 0
  store i16 %1906, i16* %1924, align 2
  %1925 = load i16* %mv_y, align 2
  %1926 = sext i32 %blocktype to i64
  %1927 = sext i16 %ref to i64
  %1928 = sext i32 %list to i64
  %1929 = add nsw i32 %2, %j.3
  %1930 = sext i32 %1929 to i64
  %1931 = add nsw i32 %1, %i.3
  %1932 = sext i32 %1931 to i64
  %1933 = getelementptr inbounds i16****** %31, i64 %1932
  %1934 = load i16****** %1933, align 8
  %1935 = getelementptr inbounds i16***** %1934, i64 %1930
  %1936 = load i16***** %1935, align 8
  %1937 = getelementptr inbounds i16**** %1936, i64 %1928
  %1938 = load i16**** %1937, align 8
  %1939 = getelementptr inbounds i16*** %1938, i64 %1927
  %1940 = load i16*** %1939, align 8
  %1941 = getelementptr inbounds i16** %1940, i64 %1926
  %1942 = load i16** %1941, align 8
  %1943 = getelementptr inbounds i16* %1942, i64 1
  store i16 %1925, i16* %1943, align 2
  %1944 = load i16* %mv_x, align 2
  %1945 = add nsw i32 %1897, %j.3
  %1946 = sext i32 %1945 to i64
  %1947 = add nsw i32 %1892, %i.3
  %1948 = sext i32 %1947 to i64
  %1949 = getelementptr inbounds i16*** %28, i64 %1948
  %1950 = load i16*** %1949, align 8
  %1951 = getelementptr inbounds i16** %1950, i64 %1946
  %1952 = load i16** %1951, align 8
  %1953 = getelementptr inbounds i16* %1952, i64 0
  store i16 %1944, i16* %1953, align 2
  %1954 = load i16* %mv_y, align 2
  %1955 = add nsw i32 %1897, %j.3
  %1956 = sext i32 %1955 to i64
  %1957 = add nsw i32 %1892, %i.3
  %1958 = sext i32 %1957 to i64
  %1959 = getelementptr inbounds i16*** %28, i64 %1958
  %1960 = load i16*** %1959, align 8
  %1961 = getelementptr inbounds i16** %1960, i64 %1956
  %1962 = load i16** %1961, align 8
  %1963 = getelementptr inbounds i16* %1962, i64 1
  store i16 %1954, i16* %1963, align 2
  br label %1964

; <label>:1964                                    ; preds = %1905
  %1965 = add nsw i32 %j.3, 1
  br label %1902

; <label>:1966                                    ; preds = %1902
  br label %1967

; <label>:1967                                    ; preds = %1966
  %1968 = add nsw i32 %i.3, 1
  br label %1898

; <label>:1969                                    ; preds = %1898
  br label %2023

; <label>:1970                                    ; preds = %1882
  br label %1971

; <label>:1971                                    ; preds = %2020, %1970
  %i.4 = phi i32 [ 0, %1970 ], [ %2021, %2020 ]
  %1972 = ashr i32 %8, 2
  %1973 = icmp slt i32 %i.4, %1972
  br i1 %1973, label %1974, label %2022

; <label>:1974                                    ; preds = %1971
  br label %1975

; <label>:1975                                    ; preds = %2017, %1974
  %j.4 = phi i32 [ 0, %1974 ], [ %2018, %2017 ]
  %1976 = ashr i32 %14, 2
  %1977 = icmp slt i32 %j.4, %1976
  br i1 %1977, label %1978, label %2019

; <label>:1978                                    ; preds = %1975
  %1979 = load i16* %mv_x, align 2
  %1980 = sext i32 %blocktype to i64
  %1981 = sext i16 %ref to i64
  %1982 = sext i32 %list to i64
  %1983 = add nsw i32 %2, %j.4
  %1984 = sext i32 %1983 to i64
  %1985 = add nsw i32 %1, %i.4
  %1986 = sext i32 %1985 to i64
  %1987 = getelementptr inbounds i16****** %31, i64 %1986
  %1988 = load i16****** %1987, align 8
  %1989 = getelementptr inbounds i16***** %1988, i64 %1984
  %1990 = load i16***** %1989, align 8
  %1991 = getelementptr inbounds i16**** %1990, i64 %1982
  %1992 = load i16**** %1991, align 8
  %1993 = getelementptr inbounds i16*** %1992, i64 %1981
  %1994 = load i16*** %1993, align 8
  %1995 = getelementptr inbounds i16** %1994, i64 %1980
  %1996 = load i16** %1995, align 8
  %1997 = getelementptr inbounds i16* %1996, i64 0
  store i16 %1979, i16* %1997, align 2
  %1998 = load i16* %mv_y, align 2
  %1999 = sext i32 %blocktype to i64
  %2000 = sext i16 %ref to i64
  %2001 = sext i32 %list to i64
  %2002 = add nsw i32 %2, %j.4
  %2003 = sext i32 %2002 to i64
  %2004 = add nsw i32 %1, %i.4
  %2005 = sext i32 %2004 to i64
  %2006 = getelementptr inbounds i16****** %31, i64 %2005
  %2007 = load i16****** %2006, align 8
  %2008 = getelementptr inbounds i16***** %2007, i64 %2003
  %2009 = load i16***** %2008, align 8
  %2010 = getelementptr inbounds i16**** %2009, i64 %2001
  %2011 = load i16**** %2010, align 8
  %2012 = getelementptr inbounds i16*** %2011, i64 %2000
  %2013 = load i16*** %2012, align 8
  %2014 = getelementptr inbounds i16** %2013, i64 %1999
  %2015 = load i16** %2014, align 8
  %2016 = getelementptr inbounds i16* %2015, i64 1
  store i16 %1998, i16* %2016, align 2
  br label %2017

; <label>:2017                                    ; preds = %1978
  %2018 = add nsw i32 %j.4, 1
  br label %1975

; <label>:2019                                    ; preds = %1975
  br label %2020

; <label>:2020                                    ; preds = %2019
  %2021 = add nsw i32 %i.4, 1
  br label %1971

; <label>:2022                                    ; preds = %1971
  br label %2023

; <label>:2023                                    ; preds = %2022, %1969
  %2024 = load %struct.ImageParameters** @img, align 8
  %2025 = getelementptr inbounds %struct.ImageParameters* %2024, i32 0, i32 6
  %2026 = load i32* %2025, align 4
  %2027 = icmp eq i32 %2026, 1
  br i1 %2027, label %2028, label %2278

; <label>:2028                                    ; preds = %2023
  %2029 = load %struct.InputParameters** @input, align 8
  %2030 = getelementptr inbounds %struct.InputParameters* %2029, i32 0, i32 39
  %2031 = load i32* %2030, align 4
  %2032 = icmp ne i32 %2031, 0
  br i1 %2032, label %2033, label %2278

; <label>:2033                                    ; preds = %2028
  %2034 = icmp eq i32 %blocktype, 1
  br i1 %2034, label %2035, label %2278

; <label>:2035                                    ; preds = %2033
  %2036 = sext i16 %ref to i32
  %2037 = icmp eq i32 %2036, 0
  br i1 %2037, label %2038, label %2278

; <label>:2038                                    ; preds = %2035
  %2039 = icmp ne i32 %list, 0
  br i1 %2039, label %2040, label %2044

; <label>:2040                                    ; preds = %2038
  %2041 = load %struct.ImageParameters** @img, align 8
  %2042 = getelementptr inbounds %struct.ImageParameters* %2041, i32 0, i32 72
  %2043 = load i16******* %2042, align 8
  br label %2048

; <label>:2044                                    ; preds = %2038
  %2045 = load %struct.ImageParameters** @img, align 8
  %2046 = getelementptr inbounds %struct.ImageParameters* %2045, i32 0, i32 73
  %2047 = load i16******* %2046, align 8
  br label %2048

; <label>:2048                                    ; preds = %2044, %2040
  %2049 = phi i16****** [ %2043, %2040 ], [ %2047, %2044 ]
  %2050 = trunc i32 %list to i16
  %2051 = getelementptr inbounds [2 x i16]* %pred_mv_bi, i32 0, i32 0
  %2052 = load %struct.storable_picture** @enc_picture, align 8
  %2053 = getelementptr inbounds %struct.storable_picture* %2052, i32 0, i32 32
  %2054 = load i16**** %2053, align 8
  %2055 = load %struct.storable_picture** @enc_picture, align 8
  %2056 = getelementptr inbounds %struct.storable_picture* %2055, i32 0, i32 35
  %2057 = load i16***** %2056, align 8
  %2058 = icmp eq i32 %list, 0
  %2059 = select i1 %2058, i32 1, i32 0
  call void @SetMotionVectorPredictor(i16* %2051, i16*** %2054, i16**** %2057, i16 signext 0, i32 %2059, i32 %1, i32 %2, i32 %8, i32 %14)
  %2060 = load i16* %mv_x, align 2
  %2061 = sext i16 %2060 to i32
  %2062 = add nsw i32 %2061, 2
  %2063 = ashr i32 %2062, 2
  %2064 = trunc i32 %2063 to i16
  store i16 %2064, i16* %mv_x, align 2
  %2065 = load i16* %mv_y, align 2
  %2066 = sext i16 %2065 to i32
  %2067 = add nsw i32 %2066, 2
  %2068 = ashr i32 %2067, 2
  %2069 = trunc i32 %2068 to i16
  store i16 %2069, i16* %mv_y, align 2
  br label %2070

; <label>:2070                                    ; preds = %2131, %2048
  %i.5 = phi i32 [ 0, %2048 ], [ %2132, %2131 ]
  %min_mcostbi.0 = phi i32 [ 2147483647, %2048 ], [ %2128, %2131 ]
  %pred_mv_x2.0 = phi i16 [ 0, %2048 ], [ %pred_mv_x2.1, %2131 ]
  %pred_mv_y2.0 = phi i16 [ 0, %2048 ], [ %pred_mv_y2.1, %2131 ]
  %iterlist.0 = phi i16 [ %2050, %2048 ], [ %iterlist.1, %2131 ]
  %2071 = load %struct.InputParameters** @input, align 8
  %2072 = getelementptr inbounds %struct.InputParameters* %2071, i32 0, i32 40
  %2073 = load i32* %2072, align 4
  %2074 = icmp sle i32 %i.5, %2073
  br i1 %2074, label %2075, label %2133

; <label>:2075                                    ; preds = %2070
  %2076 = srem i32 %i.5, 2
  %2077 = icmp ne i32 %2076, 0
  br i1 %2077, label %2078, label %2094

; <label>:2078                                    ; preds = %2075
  %2079 = getelementptr inbounds i16* %67, i64 0
  %2080 = load i16* %2079, align 2
  %2081 = getelementptr inbounds i16* %67, i64 1
  %2082 = load i16* %2081, align 2
  %2083 = getelementptr inbounds [2 x i16]* %pred_mv_bi, i32 0, i64 0
  %2084 = load i16* %2083, align 2
  %2085 = getelementptr inbounds [2 x i16]* %pred_mv_bi, i32 0, i64 1
  %2086 = load i16* %2085, align 2
  %2087 = load i16* %bimv_x, align 2
  store i16 %2087, i16* %tempmv_x, align 2
  %2088 = load i16* %bimv_y, align 2
  store i16 %2088, i16* %tempmv_y, align 2
  %2089 = load i16* %mv_x, align 2
  store i16 %2089, i16* %bimv_x, align 2
  %2090 = load i16* %mv_y, align 2
  store i16 %2090, i16* %bimv_y, align 2
  %2091 = icmp eq i32 %list, 0
  %2092 = select i1 %2091, i32 1, i32 0
  %2093 = trunc i32 %2092 to i16
  br label %2122

; <label>:2094                                    ; preds = %2075
  %2095 = getelementptr inbounds i16* %67, i64 0
  %2096 = load i16* %2095, align 2
  %2097 = getelementptr inbounds i16* %67, i64 1
  %2098 = load i16* %2097, align 2
  %2099 = getelementptr inbounds [2 x i16]* %pred_mv_bi, i32 0, i64 0
  %2100 = load i16* %2099, align 2
  %2101 = getelementptr inbounds [2 x i16]* %pred_mv_bi, i32 0, i64 1
  %2102 = load i16* %2101, align 2
  %2103 = icmp ne i32 %i.5, 0
  br i1 %2103, label %2104, label %2109

; <label>:2104                                    ; preds = %2094
  %2105 = load i16* %bimv_x, align 2
  store i16 %2105, i16* %tempmv_x, align 2
  %2106 = load i16* %bimv_y, align 2
  store i16 %2106, i16* %tempmv_y, align 2
  %2107 = load i16* %mv_x, align 2
  store i16 %2107, i16* %bimv_x, align 2
  %2108 = load i16* %mv_y, align 2
  store i16 %2108, i16* %bimv_y, align 2
  br label %2120

; <label>:2109                                    ; preds = %2094
  %2110 = load i16* %mv_x, align 2
  store i16 %2110, i16* %tempmv_x, align 2
  %2111 = load i16* %mv_y, align 2
  store i16 %2111, i16* %tempmv_y, align 2
  %2112 = sext i16 %2100 to i32
  %2113 = add nsw i32 %2112, 2
  %2114 = ashr i32 %2113, 2
  %2115 = trunc i32 %2114 to i16
  store i16 %2115, i16* %bimv_x, align 2
  %2116 = sext i16 %2102 to i32
  %2117 = add nsw i32 %2116, 2
  %2118 = ashr i32 %2117, 2
  %2119 = trunc i32 %2118 to i16
  store i16 %2119, i16* %bimv_y, align 2
  br label %2120

; <label>:2120                                    ; preds = %2109, %2104
  %2121 = trunc i32 %list to i16
  br label %2122

; <label>:2122                                    ; preds = %2120, %2078
  %pred_mv_x1.0 = phi i16 [ %2084, %2078 ], [ %2096, %2120 ]
  %pred_mv_y1.0 = phi i16 [ %2086, %2078 ], [ %2098, %2120 ]
  %pred_mv_x2.1 = phi i16 [ %2080, %2078 ], [ %2100, %2120 ]
  %pred_mv_y2.1 = phi i16 [ %2082, %2078 ], [ %2102, %2120 ]
  %iterlist.1 = phi i16 [ %2093, %2078 ], [ %2121, %2120 ]
  %2123 = sext i16 %iterlist.1 to i32
  %2124 = load %struct.InputParameters** @input, align 8
  %2125 = getelementptr inbounds %struct.InputParameters* %2124, i32 0, i32 41
  %2126 = load i32* %2125, align 4
  %2127 = ashr i32 %2126, %i.5
  %2128 = call i32 @FullPelBlockMotionBiPred(i16** getelementptr inbounds ([16 x i16*]* @BlockMotionSearch.orig_pic, i32 0, i32 0), i16 signext %ref, i32 %2123, i32 %18, i32 %22, i32 %blocktype, i32 %i.5, i16 signext %pred_mv_x1.0, i16 signext %pred_mv_y1.0, i16 signext %pred_mv_x2.1, i16 signext %pred_mv_y2.1, i16* %bimv_x, i16* %bimv_y, i16* %tempmv_x, i16* %tempmv_y, i32 %2127, i32 %min_mcostbi.0, double %lambda)
  %2129 = load i16* %tempmv_x, align 2
  store i16 %2129, i16* %mv_x, align 2
  %2130 = load i16* %tempmv_y, align 2
  store i16 %2130, i16* %mv_y, align 2
  br label %2131

; <label>:2131                                    ; preds = %2122
  %2132 = add nsw i32 %i.5, 1
  br label %2070

; <label>:2133                                    ; preds = %2070
  %2134 = load i16* %tempmv_x, align 2
  %2135 = sext i16 %2134 to i32
  %2136 = shl i32 %2135, 2
  %2137 = trunc i32 %2136 to i16
  store i16 %2137, i16* %tempmv_x, align 2
  %2138 = load i16* %tempmv_y, align 2
  %2139 = sext i16 %2138 to i32
  %2140 = shl i32 %2139, 2
  %2141 = trunc i32 %2140 to i16
  store i16 %2141, i16* %tempmv_y, align 2
  %2142 = load %struct.InputParameters** @input, align 8
  %2143 = getelementptr inbounds %struct.InputParameters* %2142, i32 0, i32 42
  %2144 = load i32* %2143, align 4
  %2145 = icmp ne i32 %2144, 0
  br i1 %2145, label %2146, label %2156

; <label>:2146                                    ; preds = %2133
  %2147 = load %struct.InputParameters** @input, align 8
  %2148 = getelementptr inbounds %struct.InputParameters* %2147, i32 0, i32 6
  %2149 = load i32* %2148, align 4
  %2150 = icmp ne i32 %2149, 0
  br i1 %2150, label %2151, label %2152

; <label>:2151                                    ; preds = %2146
  br label %2152

; <label>:2152                                    ; preds = %2151, %2146
  %min_mcostbi.1 = phi i32 [ 2147483647, %2151 ], [ %min_mcostbi.0, %2146 ]
  %2153 = sext i16 %iterlist.0 to i32
  %2154 = fmul double %lambda, 5.000000e-01
  %2155 = call i32 @SubPelBlockSearchBiPred(i16** getelementptr inbounds ([16 x i16*]* @BlockMotionSearch.orig_pic, i32 0, i32 0), i16 signext 0, i32 %2153, i32 %18, i32 %22, i32 %blocktype, i16 signext %pred_mv_x2.0, i16 signext %pred_mv_y2.0, i16* %bimv_x, i16* %bimv_y, i16* %tempmv_x, i16* %tempmv_y, i32 9, i32 9, i32 %min_mcostbi.1, double %2154)
  br label %2165

; <label>:2156                                    ; preds = %2133
  %2157 = load i16* %bimv_x, align 2
  %2158 = sext i16 %2157 to i32
  %2159 = shl i32 %2158, 2
  %2160 = trunc i32 %2159 to i16
  store i16 %2160, i16* %bimv_x, align 2
  %2161 = load i16* %bimv_y, align 2
  %2162 = sext i16 %2161 to i32
  %2163 = shl i32 %2162, 2
  %2164 = trunc i32 %2163 to i16
  store i16 %2164, i16* %bimv_y, align 2
  br label %2165

; <label>:2165                                    ; preds = %2156, %2152
  %min_mcostbi.2 = phi i32 [ %2155, %2152 ], [ %min_mcostbi.0, %2156 ]
  %2166 = load %struct.InputParameters** @input, align 8
  %2167 = getelementptr inbounds %struct.InputParameters* %2166, i32 0, i32 42
  %2168 = load i32* %2167, align 4
  %2169 = icmp eq i32 %2168, 2
  br i1 %2169, label %2170, label %2182

; <label>:2170                                    ; preds = %2165
  %2171 = load %struct.InputParameters** @input, align 8
  %2172 = getelementptr inbounds %struct.InputParameters* %2171, i32 0, i32 6
  %2173 = load i32* %2172, align 4
  %2174 = icmp ne i32 %2173, 0
  br i1 %2174, label %2175, label %2176

; <label>:2175                                    ; preds = %2170
  br label %2176

; <label>:2176                                    ; preds = %2175, %2170
  %min_mcostbi.3 = phi i32 [ 2147483647, %2175 ], [ %min_mcostbi.2, %2170 ]
  %2177 = sext i16 %iterlist.0 to i32
  %2178 = icmp eq i32 %2177, 0
  %2179 = select i1 %2178, i32 1, i32 0
  %2180 = fmul double %lambda, 5.000000e-01
  %2181 = call i32 @SubPelBlockSearchBiPred(i16** getelementptr inbounds ([16 x i16*]* @BlockMotionSearch.orig_pic, i32 0, i32 0), i16 signext 0, i32 %2179, i32 %18, i32 %22, i32 %blocktype, i16 signext %1513, i16 signext %1515, i16* %mv_x, i16* %mv_y, i16* %bimv_x, i16* %bimv_y, i32 9, i32 9, i32 %min_mcostbi.3, double %2180)
  br label %2185

; <label>:2182                                    ; preds = %2165
  %2183 = load i16* %tempmv_x, align 2
  store i16 %2183, i16* %mv_x, align 2
  %2184 = load i16* %tempmv_y, align 2
  store i16 %2184, i16* %mv_y, align 2
  br label %2185

; <label>:2185                                    ; preds = %2182, %2176
  br label %2186

; <label>:2186                                    ; preds = %2275, %2185
  %i.6 = phi i32 [ 0, %2185 ], [ %2276, %2275 ]
  %2187 = ashr i32 %8, 2
  %2188 = icmp slt i32 %i.6, %2187
  br i1 %2188, label %2189, label %2277

; <label>:2189                                    ; preds = %2186
  br label %2190

; <label>:2190                                    ; preds = %2272, %2189
  %j.5 = phi i32 [ 0, %2189 ], [ %2273, %2272 ]
  %2191 = ashr i32 %14, 2
  %2192 = icmp slt i32 %j.5, %2191
  br i1 %2192, label %2193, label %2274

; <label>:2193                                    ; preds = %2190
  %2194 = load i16* %mv_x, align 2
  %2195 = sext i32 %blocktype to i64
  %2196 = sext i16 %iterlist.0 to i64
  %2197 = add nsw i32 %2, %j.5
  %2198 = sext i32 %2197 to i64
  %2199 = add nsw i32 %1, %i.6
  %2200 = sext i32 %2199 to i64
  %2201 = getelementptr inbounds i16****** %2049, i64 %2200
  %2202 = load i16****** %2201, align 8
  %2203 = getelementptr inbounds i16***** %2202, i64 %2198
  %2204 = load i16***** %2203, align 8
  %2205 = getelementptr inbounds i16**** %2204, i64 %2196
  %2206 = load i16**** %2205, align 8
  %2207 = getelementptr inbounds i16*** %2206, i64 0
  %2208 = load i16*** %2207, align 8
  %2209 = getelementptr inbounds i16** %2208, i64 %2195
  %2210 = load i16** %2209, align 8
  %2211 = getelementptr inbounds i16* %2210, i64 0
  store i16 %2194, i16* %2211, align 2
  %2212 = load i16* %mv_y, align 2
  %2213 = sext i32 %blocktype to i64
  %2214 = sext i16 %iterlist.0 to i64
  %2215 = add nsw i32 %2, %j.5
  %2216 = sext i32 %2215 to i64
  %2217 = add nsw i32 %1, %i.6
  %2218 = sext i32 %2217 to i64
  %2219 = getelementptr inbounds i16****** %2049, i64 %2218
  %2220 = load i16****** %2219, align 8
  %2221 = getelementptr inbounds i16***** %2220, i64 %2216
  %2222 = load i16***** %2221, align 8
  %2223 = getelementptr inbounds i16**** %2222, i64 %2214
  %2224 = load i16**** %2223, align 8
  %2225 = getelementptr inbounds i16*** %2224, i64 0
  %2226 = load i16*** %2225, align 8
  %2227 = getelementptr inbounds i16** %2226, i64 %2213
  %2228 = load i16** %2227, align 8
  %2229 = getelementptr inbounds i16* %2228, i64 1
  store i16 %2212, i16* %2229, align 2
  %2230 = load i16* %bimv_x, align 2
  %2231 = sext i32 %blocktype to i64
  %2232 = sext i16 %iterlist.0 to i32
  %2233 = icmp eq i32 %2232, 0
  %2234 = select i1 %2233, i32 1, i32 0
  %2235 = sext i32 %2234 to i64
  %2236 = add nsw i32 %2, %j.5
  %2237 = sext i32 %2236 to i64
  %2238 = add nsw i32 %1, %i.6
  %2239 = sext i32 %2238 to i64
  %2240 = getelementptr inbounds i16****** %2049, i64 %2239
  %2241 = load i16****** %2240, align 8
  %2242 = getelementptr inbounds i16***** %2241, i64 %2237
  %2243 = load i16***** %2242, align 8
  %2244 = getelementptr inbounds i16**** %2243, i64 %2235
  %2245 = load i16**** %2244, align 8
  %2246 = getelementptr inbounds i16*** %2245, i64 0
  %2247 = load i16*** %2246, align 8
  %2248 = getelementptr inbounds i16** %2247, i64 %2231
  %2249 = load i16** %2248, align 8
  %2250 = getelementptr inbounds i16* %2249, i64 0
  store i16 %2230, i16* %2250, align 2
  %2251 = load i16* %bimv_y, align 2
  %2252 = sext i32 %blocktype to i64
  %2253 = sext i16 %iterlist.0 to i32
  %2254 = icmp eq i32 %2253, 0
  %2255 = select i1 %2254, i32 1, i32 0
  %2256 = sext i32 %2255 to i64
  %2257 = add nsw i32 %2, %j.5
  %2258 = sext i32 %2257 to i64
  %2259 = add nsw i32 %1, %i.6
  %2260 = sext i32 %2259 to i64
  %2261 = getelementptr inbounds i16****** %2049, i64 %2260
  %2262 = load i16****** %2261, align 8
  %2263 = getelementptr inbounds i16***** %2262, i64 %2258
  %2264 = load i16***** %2263, align 8
  %2265 = getelementptr inbounds i16**** %2264, i64 %2256
  %2266 = load i16**** %2265, align 8
  %2267 = getelementptr inbounds i16*** %2266, i64 0
  %2268 = load i16*** %2267, align 8
  %2269 = getelementptr inbounds i16** %2268, i64 %2252
  %2270 = load i16** %2269, align 8
  %2271 = getelementptr inbounds i16* %2270, i64 1
  store i16 %2251, i16* %2271, align 2
  br label %2272

; <label>:2272                                    ; preds = %2193
  %2273 = add nsw i32 %j.5, 1
  br label %2190

; <label>:2274                                    ; preds = %2190
  br label %2275

; <label>:2275                                    ; preds = %2274
  %2276 = add nsw i32 %i.6, 1
  br label %2186

; <label>:2277                                    ; preds = %2186
  br label %2278

; <label>:2278                                    ; preds = %2277, %2035, %2033, %2028, %2023
  %2279 = call i32 @ftime(%struct.timeb* %tstruct2)
  %2280 = getelementptr inbounds %struct.timeb* %tstruct2, i32 0, i32 0
  %2281 = load i64* %2280, align 8
  %2282 = mul nsw i64 %2281, 1000
  %2283 = getelementptr inbounds %struct.timeb* %tstruct2, i32 0, i32 1
  %2284 = load i16* %2283, align 2
  %2285 = zext i16 %2284 to i64
  %2286 = add nsw i64 %2282, %2285
  %2287 = getelementptr inbounds %struct.timeb* %tstruct1, i32 0, i32 0
  %2288 = load i64* %2287, align 8
  %2289 = mul nsw i64 %2288, 1000
  %2290 = getelementptr inbounds %struct.timeb* %tstruct1, i32 0, i32 1
  %2291 = load i16* %2290, align 2
  %2292 = zext i16 %2291 to i64
  %2293 = add nsw i64 %2289, %2292
  %2294 = sub nsw i64 %2286, %2293
  %2295 = trunc i64 %2294 to i32
  %2296 = load i32* @me_tot_time, align 4
  %2297 = add nsw i32 %2296, %2295
  store i32 %2297, i32* @me_tot_time, align 4
  %2298 = load i32* @me_time, align 4
  %2299 = add nsw i32 %2298, %2295
  store i32 %2299, i32* @me_time, align 4
  ret i32 %min_mcost.7
}

declare i32 @ftime(%struct.timeb*) #2

declare i32 @FastIntegerPelBlockMotionSearch(i16**, i16 signext, i32, i32, i32, i32, i16 signext, i16 signext, i16*, i16*, i32, i32, double) #2

declare i32 @FastSubPelBlockMotionSearch(i16**, i16 signext, i32, i32, i32, i32, i16 signext, i16 signext, i16*, i16*, i32, i32, i32, double, i32) #2

; Function Attrs: nounwind uwtable
define i32 @GetSkipCostMB(double %lambda) #0 {
  %diff = alloca [16 x i32], align 16
  %curr_diff = alloca [8 x [8 x i32]], align 16
  %diff8x8 = alloca [64 x i32], align 16
  br label %1

; <label>:1                                       ; preds = %128, %0
  %cost.0 = phi i32 [ 0, %0 ], [ %cost.4, %128 ]
  %block.0 = phi i32 [ 0, %0 ], [ %129, %128 ]
  %2 = icmp slt i32 %block.0, 4
  br i1 %2, label %3, label %130

; <label>:3                                       ; preds = %1
  %4 = sdiv i32 %block.0, 2
  %5 = shl i32 %4, 3
  %6 = srem i32 %block.0, 2
  %7 = shl i32 %6, 3
  br label %8

; <label>:8                                       ; preds = %88, %3
  %cost.1 = phi i32 [ %cost.0, %3 ], [ %cost.2, %88 ]
  %block_y.0 = phi i32 [ %5, %3 ], [ %89, %88 ]
  %9 = add nsw i32 %5, 8
  %10 = icmp slt i32 %block_y.0, %9
  br i1 %10, label %11, label %90

; <label>:11                                      ; preds = %8
  %12 = load %struct.ImageParameters** @img, align 8
  %13 = getelementptr inbounds %struct.ImageParameters* %12, i32 0, i32 38
  %14 = load i32* %13, align 4
  %15 = add nsw i32 %14, %block_y.0
  br label %16

; <label>:16                                      ; preds = %85, %11
  %cost.2 = phi i32 [ %cost.1, %11 ], [ %cost.3, %85 ]
  %block_x.0 = phi i32 [ %7, %11 ], [ %86, %85 ]
  %17 = add nsw i32 %7, 8
  %18 = icmp slt i32 %block_x.0, %17
  br i1 %18, label %19, label %87

; <label>:19                                      ; preds = %16
  %20 = load %struct.ImageParameters** @img, align 8
  %21 = getelementptr inbounds %struct.ImageParameters* %20, i32 0, i32 37
  %22 = load i32* %21, align 4
  %23 = add nsw i32 %22, %block_x.0
  call void @LumaPrediction4x4(i32 %block_x.0, i32 %block_y.0, i32 0, i32 0, i32 0, i16 signext 0, i16 signext 0)
  br label %24

; <label>:24                                      ; preds = %65, %19
  %j.0 = phi i32 [ 0, %19 ], [ %66, %65 ]
  %k.0 = phi i32 [ 0, %19 ], [ %k.1, %65 ]
  %25 = icmp slt i32 %j.0, 4
  br i1 %25, label %26, label %67

; <label>:26                                      ; preds = %24
  br label %27

; <label>:27                                      ; preds = %61, %26
  %i.0 = phi i32 [ 0, %26 ], [ %62, %61 ]
  %k.1 = phi i32 [ %k.0, %26 ], [ %63, %61 ]
  %28 = icmp slt i32 %i.0, 4
  br i1 %28, label %29, label %64

; <label>:29                                      ; preds = %27
  %30 = add nsw i32 %23, %i.0
  %31 = sext i32 %30 to i64
  %32 = add nsw i32 %15, %j.0
  %33 = sext i32 %32 to i64
  %34 = load i16*** @imgY_org, align 8
  %35 = getelementptr inbounds i16** %34, i64 %33
  %36 = load i16** %35, align 8
  %37 = getelementptr inbounds i16* %36, i64 %31
  %38 = load i16* %37, align 2
  %39 = zext i16 %38 to i32
  %40 = add nsw i32 %j.0, %block_y.0
  %41 = sext i32 %40 to i64
  %42 = add nsw i32 %i.0, %block_x.0
  %43 = sext i32 %42 to i64
  %44 = load %struct.ImageParameters** @img, align 8
  %45 = getelementptr inbounds %struct.ImageParameters* %44, i32 0, i32 45
  %46 = getelementptr inbounds [16 x [16 x i16]]* %45, i32 0, i64 %43
  %47 = getelementptr inbounds [16 x i16]* %46, i32 0, i64 %41
  %48 = load i16* %47, align 2
  %49 = zext i16 %48 to i32
  %50 = sub nsw i32 %39, %49
  %51 = sub nsw i32 %block_x.0, %7
  %52 = add nsw i32 %51, %i.0
  %53 = sext i32 %52 to i64
  %54 = sub nsw i32 %block_y.0, %5
  %55 = add nsw i32 %54, %j.0
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds [8 x [8 x i32]]* %curr_diff, i32 0, i64 %56
  %58 = getelementptr inbounds [8 x i32]* %57, i32 0, i64 %53
  store i32 %50, i32* %58, align 4
  %59 = sext i32 %k.1 to i64
  %60 = getelementptr inbounds [16 x i32]* %diff, i32 0, i64 %59
  store i32 %50, i32* %60, align 4
  br label %61

; <label>:61                                      ; preds = %29
  %62 = add nsw i32 %i.0, 1
  %63 = add nsw i32 %k.1, 1
  br label %27

; <label>:64                                      ; preds = %27
  br label %65

; <label>:65                                      ; preds = %64
  %66 = add nsw i32 %j.0, 1
  br label %24

; <label>:67                                      ; preds = %24
  %68 = load %struct.InputParameters** @input, align 8
  %69 = getelementptr inbounds %struct.InputParameters* %68, i32 0, i32 85
  %70 = load i32* %69, align 4
  %71 = icmp eq i32 %70, 0
  br i1 %71, label %72, label %77

; <label>:72                                      ; preds = %67
  %73 = load %struct.InputParameters** @input, align 8
  %74 = getelementptr inbounds %struct.InputParameters* %73, i32 0, i32 123
  %75 = load i32* %74, align 4
  %76 = icmp ne i32 %75, 0
  br i1 %76, label %84, label %77

; <label>:77                                      ; preds = %72, %67
  %78 = getelementptr inbounds [16 x i32]* %diff, i32 0, i32 0
  %79 = load %struct.InputParameters** @input, align 8
  %80 = getelementptr inbounds %struct.InputParameters* %79, i32 0, i32 6
  %81 = load i32* %80, align 4
  %82 = call i32 @SATD(i32* %78, i32 %81)
  %83 = add nsw i32 %cost.2, %82
  br label %84

; <label>:84                                      ; preds = %77, %72
  %cost.3 = phi i32 [ %cost.2, %72 ], [ %83, %77 ]
  br label %85

; <label>:85                                      ; preds = %84
  %86 = add nsw i32 %block_x.0, 4
  br label %16

; <label>:87                                      ; preds = %16
  br label %88

; <label>:88                                      ; preds = %87
  %89 = add nsw i32 %block_y.0, 4
  br label %8

; <label>:90                                      ; preds = %8
  %91 = load %struct.InputParameters** @input, align 8
  %92 = getelementptr inbounds %struct.InputParameters* %91, i32 0, i32 85
  %93 = load i32* %92, align 4
  %94 = icmp eq i32 %93, 0
  br i1 %94, label %95, label %127

; <label>:95                                      ; preds = %90
  %96 = load %struct.InputParameters** @input, align 8
  %97 = getelementptr inbounds %struct.InputParameters* %96, i32 0, i32 123
  %98 = load i32* %97, align 4
  %99 = icmp ne i32 %98, 0
  br i1 %99, label %100, label %127

; <label>:100                                     ; preds = %95
  br label %101

; <label>:101                                     ; preds = %118, %100
  %j.1 = phi i32 [ 0, %100 ], [ %119, %118 ]
  %k.2 = phi i32 [ 0, %100 ], [ %k.3, %118 ]
  %102 = icmp slt i32 %j.1, 8
  br i1 %102, label %103, label %120

; <label>:103                                     ; preds = %101
  br label %104

; <label>:104                                     ; preds = %114, %103
  %i.1 = phi i32 [ 0, %103 ], [ %115, %114 ]
  %k.3 = phi i32 [ %k.2, %103 ], [ %116, %114 ]
  %105 = icmp slt i32 %i.1, 8
  br i1 %105, label %106, label %117

; <label>:106                                     ; preds = %104
  %107 = sext i32 %i.1 to i64
  %108 = sext i32 %j.1 to i64
  %109 = getelementptr inbounds [8 x [8 x i32]]* %curr_diff, i32 0, i64 %108
  %110 = getelementptr inbounds [8 x i32]* %109, i32 0, i64 %107
  %111 = load i32* %110, align 4
  %112 = sext i32 %k.3 to i64
  %113 = getelementptr inbounds [64 x i32]* %diff8x8, i32 0, i64 %112
  store i32 %111, i32* %113, align 4
  br label %114

; <label>:114                                     ; preds = %106
  %115 = add nsw i32 %i.1, 1
  %116 = add nsw i32 %k.3, 1
  br label %104

; <label>:117                                     ; preds = %104
  br label %118

; <label>:118                                     ; preds = %117
  %119 = add nsw i32 %j.1, 1
  br label %101

; <label>:120                                     ; preds = %101
  %121 = getelementptr inbounds [64 x i32]* %diff8x8, i32 0, i32 0
  %122 = load %struct.InputParameters** @input, align 8
  %123 = getelementptr inbounds %struct.InputParameters* %122, i32 0, i32 6
  %124 = load i32* %123, align 4
  %125 = call i32 @SATD8X8(i32* %121, i32 %124)
  %126 = add nsw i32 %cost.1, %125
  br label %127

; <label>:127                                     ; preds = %120, %95, %90
  %cost.4 = phi i32 [ %126, %120 ], [ %cost.1, %95 ], [ %cost.1, %90 ]
  br label %128

; <label>:128                                     ; preds = %127
  %129 = add nsw i32 %block.0, 1
  br label %1

; <label>:130                                     ; preds = %1
  ret i32 %cost.0
}

; Function Attrs: nounwind uwtable
define i32 @BIDPartitionCost(i32 %blocktype, i32 %block8x8, i16 signext %fw_ref, i16 signext %bw_ref, i32 %lambda_factor) #0 {
  %diff = alloca [64 x i32], align 16
  %curr_blk = alloca [16 x [16 x i32]], align 16
  %1 = sext i32 %blocktype to i64
  %2 = load %struct.InputParameters** @input, align 8
  %3 = getelementptr inbounds %struct.InputParameters* %2, i32 0, i32 20
  %4 = getelementptr inbounds [8 x [2 x i32]]* %3, i32 0, i64 %1
  %5 = getelementptr inbounds [2 x i32]* %4, i32 0, i64 0
  %6 = load i32* %5, align 4
  %7 = icmp slt i32 %6, 8
  br i1 %7, label %8, label %15

; <label>:8                                       ; preds = %0
  %9 = sext i32 %blocktype to i64
  %10 = load %struct.InputParameters** @input, align 8
  %11 = getelementptr inbounds %struct.InputParameters* %10, i32 0, i32 20
  %12 = getelementptr inbounds [8 x [2 x i32]]* %11, i32 0, i64 %9
  %13 = getelementptr inbounds [2 x i32]* %12, i32 0, i64 0
  %14 = load i32* %13, align 4
  br label %16

; <label>:15                                      ; preds = %0
  br label %16

; <label>:16                                      ; preds = %15, %8
  %17 = phi i32 [ %14, %8 ], [ 8, %15 ]
  %18 = sext i32 %blocktype to i64
  %19 = load %struct.InputParameters** @input, align 8
  %20 = getelementptr inbounds %struct.InputParameters* %19, i32 0, i32 20
  %21 = getelementptr inbounds [8 x [2 x i32]]* %20, i32 0, i64 %18
  %22 = getelementptr inbounds [2 x i32]* %21, i32 0, i64 1
  %23 = load i32* %22, align 4
  %24 = icmp slt i32 %23, 8
  br i1 %24, label %25, label %32

; <label>:25                                      ; preds = %16
  %26 = sext i32 %blocktype to i64
  %27 = load %struct.InputParameters** @input, align 8
  %28 = getelementptr inbounds %struct.InputParameters* %27, i32 0, i32 20
  %29 = getelementptr inbounds [8 x [2 x i32]]* %28, i32 0, i64 %26
  %30 = getelementptr inbounds [2 x i32]* %29, i32 0, i64 1
  %31 = load i32* %30, align 4
  br label %33

; <label>:32                                      ; preds = %16
  br label %33

; <label>:33                                      ; preds = %32, %25
  %34 = phi i32 [ %31, %25 ], [ 8, %32 ]
  %35 = icmp slt i32 %blocktype, 4
  br i1 %35, label %36, label %37

; <label>:36                                      ; preds = %33
  br label %38

; <label>:37                                      ; preds = %33
  br label %38

; <label>:38                                      ; preds = %37, %36
  %39 = phi i32 [ %blocktype, %36 ], [ 4, %37 ]
  %40 = sext i32 %39 to i64
  %41 = load %struct.InputParameters** @input, align 8
  %42 = getelementptr inbounds %struct.InputParameters* %41, i32 0, i32 21
  %43 = getelementptr inbounds [8 x [2 x i32]]* %42, i32 0, i64 %40
  %44 = getelementptr inbounds [2 x i32]* %43, i32 0, i64 0
  %45 = load i32* %44, align 4
  %46 = sext i32 %39 to i64
  %47 = load %struct.InputParameters** @input, align 8
  %48 = getelementptr inbounds %struct.InputParameters* %47, i32 0, i32 21
  %49 = getelementptr inbounds [8 x [2 x i32]]* %48, i32 0, i64 %46
  %50 = getelementptr inbounds [2 x i32]* %49, i32 0, i64 1
  %51 = load i32* %50, align 4
  %52 = sext i32 %blocktype to i64
  %53 = load %struct.InputParameters** @input, align 8
  %54 = getelementptr inbounds %struct.InputParameters* %53, i32 0, i32 21
  %55 = getelementptr inbounds [8 x [2 x i32]]* %54, i32 0, i64 %52
  %56 = getelementptr inbounds [2 x i32]* %55, i32 0, i64 0
  %57 = load i32* %56, align 4
  %58 = sext i32 %blocktype to i64
  %59 = load %struct.InputParameters** @input, align 8
  %60 = getelementptr inbounds %struct.InputParameters* %59, i32 0, i32 21
  %61 = getelementptr inbounds [8 x [2 x i32]]* %60, i32 0, i64 %58
  %62 = getelementptr inbounds [2 x i32]* %61, i32 0, i64 1
  %63 = load i32* %62, align 4
  %64 = load %struct.ImageParameters** @img, align 8
  %65 = getelementptr inbounds %struct.ImageParameters* %64, i32 0, i32 71
  %66 = load i16******* %65, align 8
  %67 = load %struct.ImageParameters** @img, align 8
  %68 = getelementptr inbounds %struct.ImageParameters* %67, i32 0, i32 70
  %69 = load i16******* %68, align 8
  %70 = sext i32 %block8x8 to i64
  %71 = sext i32 %39 to i64
  %72 = getelementptr inbounds [5 x [4 x i32]]* @BIDPartitionCost.by0, i32 0, i64 %71
  %73 = getelementptr inbounds [4 x i32]* %72, i32 0, i64 %70
  %74 = load i32* %73, align 4
  br label %75

; <label>:75                                      ; preds = %261, %38
  %v.0 = phi i32 [ %74, %38 ], [ %262, %261 ]
  %mvd_bits.0 = phi i32 [ 0, %38 ], [ %mvd_bits.1, %261 ]
  %76 = sext i32 %block8x8 to i64
  %77 = sext i32 %39 to i64
  %78 = getelementptr inbounds [5 x [4 x i32]]* @BIDPartitionCost.by0, i32 0, i64 %77
  %79 = getelementptr inbounds [4 x i32]* %78, i32 0, i64 %76
  %80 = load i32* %79, align 4
  %81 = add nsw i32 %80, %51
  %82 = icmp slt i32 %v.0, %81
  br i1 %82, label %83, label %263

; <label>:83                                      ; preds = %75
  %84 = sext i32 %block8x8 to i64
  %85 = sext i32 %39 to i64
  %86 = getelementptr inbounds [5 x [4 x i32]]* @BIDPartitionCost.bx0, i32 0, i64 %85
  %87 = getelementptr inbounds [4 x i32]* %86, i32 0, i64 %84
  %88 = load i32* %87, align 4
  br label %89

; <label>:89                                      ; preds = %258, %83
  %h.0 = phi i32 [ %88, %83 ], [ %259, %258 ]
  %mvd_bits.1 = phi i32 [ %mvd_bits.0, %83 ], [ %257, %258 ]
  %90 = sext i32 %block8x8 to i64
  %91 = sext i32 %39 to i64
  %92 = getelementptr inbounds [5 x [4 x i32]]* @BIDPartitionCost.bx0, i32 0, i64 %91
  %93 = getelementptr inbounds [4 x i32]* %92, i32 0, i64 %90
  %94 = load i32* %93, align 4
  %95 = add nsw i32 %94, %45
  %96 = icmp slt i32 %h.0, %95
  br i1 %96, label %97, label %260

; <label>:97                                      ; preds = %89
  %98 = sext i32 %blocktype to i64
  %99 = sext i16 %fw_ref to i64
  %100 = sext i32 %v.0 to i64
  %101 = sext i32 %h.0 to i64
  %102 = getelementptr inbounds i16****** %66, i64 %101
  %103 = load i16****** %102, align 8
  %104 = getelementptr inbounds i16***** %103, i64 %100
  %105 = load i16***** %104, align 8
  %106 = getelementptr inbounds i16**** %105, i64 0
  %107 = load i16**** %106, align 8
  %108 = getelementptr inbounds i16*** %107, i64 %99
  %109 = load i16*** %108, align 8
  %110 = getelementptr inbounds i16** %109, i64 %98
  %111 = load i16** %110, align 8
  %112 = getelementptr inbounds i16* %111, i64 0
  %113 = load i16* %112, align 2
  %114 = sext i16 %113 to i32
  %115 = sext i32 %blocktype to i64
  %116 = sext i16 %fw_ref to i64
  %117 = sext i32 %v.0 to i64
  %118 = sext i32 %h.0 to i64
  %119 = getelementptr inbounds i16****** %69, i64 %118
  %120 = load i16****** %119, align 8
  %121 = getelementptr inbounds i16***** %120, i64 %117
  %122 = load i16***** %121, align 8
  %123 = getelementptr inbounds i16**** %122, i64 0
  %124 = load i16**** %123, align 8
  %125 = getelementptr inbounds i16*** %124, i64 %116
  %126 = load i16*** %125, align 8
  %127 = getelementptr inbounds i16** %126, i64 %115
  %128 = load i16** %127, align 8
  %129 = getelementptr inbounds i16* %128, i64 0
  %130 = load i16* %129, align 2
  %131 = sext i16 %130 to i32
  %132 = sub nsw i32 %114, %131
  %133 = sext i32 %132 to i64
  %134 = load i32** @mvbits, align 8
  %135 = getelementptr inbounds i32* %134, i64 %133
  %136 = load i32* %135, align 4
  %137 = add nsw i32 %mvd_bits.1, %136
  %138 = sext i32 %blocktype to i64
  %139 = sext i16 %fw_ref to i64
  %140 = sext i32 %v.0 to i64
  %141 = sext i32 %h.0 to i64
  %142 = getelementptr inbounds i16****** %66, i64 %141
  %143 = load i16****** %142, align 8
  %144 = getelementptr inbounds i16***** %143, i64 %140
  %145 = load i16***** %144, align 8
  %146 = getelementptr inbounds i16**** %145, i64 0
  %147 = load i16**** %146, align 8
  %148 = getelementptr inbounds i16*** %147, i64 %139
  %149 = load i16*** %148, align 8
  %150 = getelementptr inbounds i16** %149, i64 %138
  %151 = load i16** %150, align 8
  %152 = getelementptr inbounds i16* %151, i64 1
  %153 = load i16* %152, align 2
  %154 = sext i16 %153 to i32
  %155 = sext i32 %blocktype to i64
  %156 = sext i16 %fw_ref to i64
  %157 = sext i32 %v.0 to i64
  %158 = sext i32 %h.0 to i64
  %159 = getelementptr inbounds i16****** %69, i64 %158
  %160 = load i16****** %159, align 8
  %161 = getelementptr inbounds i16***** %160, i64 %157
  %162 = load i16***** %161, align 8
  %163 = getelementptr inbounds i16**** %162, i64 0
  %164 = load i16**** %163, align 8
  %165 = getelementptr inbounds i16*** %164, i64 %156
  %166 = load i16*** %165, align 8
  %167 = getelementptr inbounds i16** %166, i64 %155
  %168 = load i16** %167, align 8
  %169 = getelementptr inbounds i16* %168, i64 1
  %170 = load i16* %169, align 2
  %171 = sext i16 %170 to i32
  %172 = sub nsw i32 %154, %171
  %173 = sext i32 %172 to i64
  %174 = load i32** @mvbits, align 8
  %175 = getelementptr inbounds i32* %174, i64 %173
  %176 = load i32* %175, align 4
  %177 = add nsw i32 %137, %176
  %178 = sext i32 %blocktype to i64
  %179 = sext i16 %bw_ref to i64
  %180 = sext i32 %v.0 to i64
  %181 = sext i32 %h.0 to i64
  %182 = getelementptr inbounds i16****** %66, i64 %181
  %183 = load i16****** %182, align 8
  %184 = getelementptr inbounds i16***** %183, i64 %180
  %185 = load i16***** %184, align 8
  %186 = getelementptr inbounds i16**** %185, i64 1
  %187 = load i16**** %186, align 8
  %188 = getelementptr inbounds i16*** %187, i64 %179
  %189 = load i16*** %188, align 8
  %190 = getelementptr inbounds i16** %189, i64 %178
  %191 = load i16** %190, align 8
  %192 = getelementptr inbounds i16* %191, i64 0
  %193 = load i16* %192, align 2
  %194 = sext i16 %193 to i32
  %195 = sext i32 %blocktype to i64
  %196 = sext i16 %bw_ref to i64
  %197 = sext i32 %v.0 to i64
  %198 = sext i32 %h.0 to i64
  %199 = getelementptr inbounds i16****** %69, i64 %198
  %200 = load i16****** %199, align 8
  %201 = getelementptr inbounds i16***** %200, i64 %197
  %202 = load i16***** %201, align 8
  %203 = getelementptr inbounds i16**** %202, i64 1
  %204 = load i16**** %203, align 8
  %205 = getelementptr inbounds i16*** %204, i64 %196
  %206 = load i16*** %205, align 8
  %207 = getelementptr inbounds i16** %206, i64 %195
  %208 = load i16** %207, align 8
  %209 = getelementptr inbounds i16* %208, i64 0
  %210 = load i16* %209, align 2
  %211 = sext i16 %210 to i32
  %212 = sub nsw i32 %194, %211
  %213 = sext i32 %212 to i64
  %214 = load i32** @mvbits, align 8
  %215 = getelementptr inbounds i32* %214, i64 %213
  %216 = load i32* %215, align 4
  %217 = add nsw i32 %177, %216
  %218 = sext i32 %blocktype to i64
  %219 = sext i16 %bw_ref to i64
  %220 = sext i32 %v.0 to i64
  %221 = sext i32 %h.0 to i64
  %222 = getelementptr inbounds i16****** %66, i64 %221
  %223 = load i16****** %222, align 8
  %224 = getelementptr inbounds i16***** %223, i64 %220
  %225 = load i16***** %224, align 8
  %226 = getelementptr inbounds i16**** %225, i64 1
  %227 = load i16**** %226, align 8
  %228 = getelementptr inbounds i16*** %227, i64 %219
  %229 = load i16*** %228, align 8
  %230 = getelementptr inbounds i16** %229, i64 %218
  %231 = load i16** %230, align 8
  %232 = getelementptr inbounds i16* %231, i64 1
  %233 = load i16* %232, align 2
  %234 = sext i16 %233 to i32
  %235 = sext i32 %blocktype to i64
  %236 = sext i16 %bw_ref to i64
  %237 = sext i32 %v.0 to i64
  %238 = sext i32 %h.0 to i64
  %239 = getelementptr inbounds i16****** %69, i64 %238
  %240 = load i16****** %239, align 8
  %241 = getelementptr inbounds i16***** %240, i64 %237
  %242 = load i16***** %241, align 8
  %243 = getelementptr inbounds i16**** %242, i64 1
  %244 = load i16**** %243, align 8
  %245 = getelementptr inbounds i16*** %244, i64 %236
  %246 = load i16*** %245, align 8
  %247 = getelementptr inbounds i16** %246, i64 %235
  %248 = load i16** %247, align 8
  %249 = getelementptr inbounds i16* %248, i64 1
  %250 = load i16* %249, align 2
  %251 = sext i16 %250 to i32
  %252 = sub nsw i32 %234, %251
  %253 = sext i32 %252 to i64
  %254 = load i32** @mvbits, align 8
  %255 = getelementptr inbounds i32* %254, i64 %253
  %256 = load i32* %255, align 4
  %257 = add nsw i32 %217, %256
  br label %258

; <label>:258                                     ; preds = %97
  %259 = add nsw i32 %h.0, %57
  br label %89

; <label>:260                                     ; preds = %89
  br label %261

; <label>:261                                     ; preds = %260
  %262 = add nsw i32 %v.0, %63
  br label %75

; <label>:263                                     ; preds = %75
  %264 = mul nsw i32 %lambda_factor, %mvd_bits.0
  %265 = ashr i32 %264, 16
  %266 = sext i32 %block8x8 to i64
  %267 = sext i32 %39 to i64
  %268 = getelementptr inbounds [5 x [4 x i32]]* @BIDPartitionCost.by0, i32 0, i64 %267
  %269 = getelementptr inbounds [4 x i32]* %268, i32 0, i64 %266
  %270 = load i32* %269, align 4
  br label %271

; <label>:271                                     ; preds = %364, %263
  %v.1 = phi i32 [ %270, %263 ], [ %366, %364 ]
  %mcost.0 = phi i32 [ %265, %263 ], [ %mcost.1, %364 ]
  %byy.0 = phi i32 [ 0, %263 ], [ %365, %364 ]
  %272 = sext i32 %block8x8 to i64
  %273 = sext i32 %39 to i64
  %274 = getelementptr inbounds [5 x [4 x i32]]* @BIDPartitionCost.by0, i32 0, i64 %273
  %275 = getelementptr inbounds [4 x i32]* %274, i32 0, i64 %272
  %276 = load i32* %275, align 4
  %277 = add nsw i32 %276, %51
  %278 = icmp slt i32 %v.1, %277
  br i1 %278, label %279, label %367

; <label>:279                                     ; preds = %271
  %280 = load %struct.ImageParameters** @img, align 8
  %281 = getelementptr inbounds %struct.ImageParameters* %280, i32 0, i32 38
  %282 = load i32* %281, align 4
  %283 = shl i32 %v.1, 2
  %284 = add nsw i32 %282, %283
  %285 = sext i32 %block8x8 to i64
  %286 = sext i32 %39 to i64
  %287 = getelementptr inbounds [5 x [4 x i32]]* @BIDPartitionCost.bx0, i32 0, i64 %286
  %288 = getelementptr inbounds [4 x i32]* %287, i32 0, i64 %285
  %289 = load i32* %288, align 4
  br label %290

; <label>:290                                     ; preds = %360, %279
  %h.1 = phi i32 [ %289, %279 ], [ %362, %360 ]
  %mcost.1 = phi i32 [ %mcost.0, %279 ], [ %mcost.2, %360 ]
  %bxx.0 = phi i32 [ 0, %279 ], [ %361, %360 ]
  %291 = sext i32 %block8x8 to i64
  %292 = sext i32 %39 to i64
  %293 = getelementptr inbounds [5 x [4 x i32]]* @BIDPartitionCost.bx0, i32 0, i64 %292
  %294 = getelementptr inbounds [4 x i32]* %293, i32 0, i64 %291
  %295 = load i32* %294, align 4
  %296 = add nsw i32 %295, %45
  %297 = icmp slt i32 %h.1, %296
  br i1 %297, label %298, label %363

; <label>:298                                     ; preds = %290
  %299 = load %struct.ImageParameters** @img, align 8
  %300 = getelementptr inbounds %struct.ImageParameters* %299, i32 0, i32 37
  %301 = load i32* %300, align 4
  %302 = shl i32 %h.1, 2
  %303 = add nsw i32 %301, %302
  call void @LumaPrediction4x4(i32 %302, i32 %283, i32 2, i32 %blocktype, i32 %blocktype, i16 signext %fw_ref, i16 signext %bw_ref)
  br label %304

; <label>:304                                     ; preds = %343, %298
  %j.0 = phi i32 [ 0, %298 ], [ %344, %343 ]
  %k.0 = phi i32 [ 0, %298 ], [ %k.1, %343 ]
  %305 = icmp slt i32 %j.0, 4
  br i1 %305, label %306, label %345

; <label>:306                                     ; preds = %304
  br label %307

; <label>:307                                     ; preds = %339, %306
  %i.0 = phi i32 [ 0, %306 ], [ %340, %339 ]
  %k.1 = phi i32 [ %k.0, %306 ], [ %341, %339 ]
  %308 = icmp slt i32 %i.0, 4
  br i1 %308, label %309, label %342

; <label>:309                                     ; preds = %307
  %310 = add nsw i32 %303, %i.0
  %311 = sext i32 %310 to i64
  %312 = add nsw i32 %284, %j.0
  %313 = sext i32 %312 to i64
  %314 = load i16*** @imgY_org, align 8
  %315 = getelementptr inbounds i16** %314, i64 %313
  %316 = load i16** %315, align 8
  %317 = getelementptr inbounds i16* %316, i64 %311
  %318 = load i16* %317, align 2
  %319 = zext i16 %318 to i32
  %320 = add nsw i32 %j.0, %283
  %321 = sext i32 %320 to i64
  %322 = add nsw i32 %i.0, %302
  %323 = sext i32 %322 to i64
  %324 = load %struct.ImageParameters** @img, align 8
  %325 = getelementptr inbounds %struct.ImageParameters* %324, i32 0, i32 45
  %326 = getelementptr inbounds [16 x [16 x i16]]* %325, i32 0, i64 %323
  %327 = getelementptr inbounds [16 x i16]* %326, i32 0, i64 %321
  %328 = load i16* %327, align 2
  %329 = zext i16 %328 to i32
  %330 = sub nsw i32 %319, %329
  %331 = add nsw i32 %bxx.0, %i.0
  %332 = sext i32 %331 to i64
  %333 = add nsw i32 %byy.0, %j.0
  %334 = sext i32 %333 to i64
  %335 = getelementptr inbounds [16 x [16 x i32]]* %curr_blk, i32 0, i64 %334
  %336 = getelementptr inbounds [16 x i32]* %335, i32 0, i64 %332
  store i32 %330, i32* %336, align 4
  %337 = sext i32 %k.1 to i64
  %338 = getelementptr inbounds [64 x i32]* %diff, i32 0, i64 %337
  store i32 %330, i32* %338, align 4
  br label %339

; <label>:339                                     ; preds = %309
  %340 = add nsw i32 %i.0, 1
  %341 = add nsw i32 %k.1, 1
  br label %307

; <label>:342                                     ; preds = %307
  br label %343

; <label>:343                                     ; preds = %342
  %344 = add nsw i32 %j.0, 1
  br label %304

; <label>:345                                     ; preds = %304
  %346 = load %struct.InputParameters** @input, align 8
  %347 = getelementptr inbounds %struct.InputParameters* %346, i32 0, i32 123
  %348 = load i32* %347, align 4
  %349 = icmp ne i32 %348, 0
  br i1 %349, label %350, label %352

; <label>:350                                     ; preds = %345
  %351 = icmp sgt i32 %blocktype, 4
  br i1 %351, label %352, label %359

; <label>:352                                     ; preds = %350, %345
  %353 = getelementptr inbounds [64 x i32]* %diff, i32 0, i32 0
  %354 = load %struct.InputParameters** @input, align 8
  %355 = getelementptr inbounds %struct.InputParameters* %354, i32 0, i32 6
  %356 = load i32* %355, align 4
  %357 = call i32 @SATD(i32* %353, i32 %356)
  %358 = add nsw i32 %mcost.1, %357
  br label %359

; <label>:359                                     ; preds = %352, %350
  %mcost.2 = phi i32 [ %358, %352 ], [ %mcost.1, %350 ]
  br label %360

; <label>:360                                     ; preds = %359
  %361 = add nsw i32 %bxx.0, 4
  %362 = add nsw i32 %h.1, 1
  br label %290

; <label>:363                                     ; preds = %290
  br label %364

; <label>:364                                     ; preds = %363
  %365 = add nsw i32 %byy.0, 4
  %366 = add nsw i32 %v.1, 1
  br label %271

; <label>:367                                     ; preds = %271
  %368 = load %struct.InputParameters** @input, align 8
  %369 = getelementptr inbounds %struct.InputParameters* %368, i32 0, i32 123
  %370 = load i32* %369, align 4
  %371 = icmp ne i32 %370, 0
  br i1 %371, label %372, label %427

; <label>:372                                     ; preds = %367
  %373 = icmp sle i32 %blocktype, 4
  br i1 %373, label %374, label %427

; <label>:374                                     ; preds = %372
  br label %375

; <label>:375                                     ; preds = %424, %374
  %mcost.3 = phi i32 [ %mcost.0, %374 ], [ %mcost.4, %424 ]
  %byy.1 = phi i32 [ 0, %374 ], [ %425, %424 ]
  %376 = sext i32 %39 to i64
  %377 = load %struct.InputParameters** @input, align 8
  %378 = getelementptr inbounds %struct.InputParameters* %377, i32 0, i32 20
  %379 = getelementptr inbounds [8 x [2 x i32]]* %378, i32 0, i64 %376
  %380 = getelementptr inbounds [2 x i32]* %379, i32 0, i64 1
  %381 = load i32* %380, align 4
  %382 = icmp slt i32 %byy.1, %381
  br i1 %382, label %383, label %426

; <label>:383                                     ; preds = %375
  br label %384

; <label>:384                                     ; preds = %421, %383
  %mcost.4 = phi i32 [ %mcost.3, %383 ], [ %420, %421 ]
  %bxx.1 = phi i32 [ 0, %383 ], [ %422, %421 ]
  %385 = sext i32 %39 to i64
  %386 = load %struct.InputParameters** @input, align 8
  %387 = getelementptr inbounds %struct.InputParameters* %386, i32 0, i32 20
  %388 = getelementptr inbounds [8 x [2 x i32]]* %387, i32 0, i64 %385
  %389 = getelementptr inbounds [2 x i32]* %388, i32 0, i64 0
  %390 = load i32* %389, align 4
  %391 = icmp slt i32 %bxx.1, %390
  br i1 %391, label %392, label %423

; <label>:392                                     ; preds = %384
  br label %393

; <label>:393                                     ; preds = %412, %392
  %i.1 = phi i32 [ 0, %392 ], [ %413, %412 ]
  %k.2 = phi i32 [ 0, %392 ], [ %k.3, %412 ]
  %394 = icmp slt i32 %i.1, 8
  br i1 %394, label %395, label %414

; <label>:395                                     ; preds = %393
  br label %396

; <label>:396                                     ; preds = %409, %395
  %j.1 = phi i32 [ 0, %395 ], [ %410, %409 ]
  %k.3 = phi i32 [ %k.2, %395 ], [ %406, %409 ]
  %397 = icmp slt i32 %j.1, 8
  br i1 %397, label %398, label %411

; <label>:398                                     ; preds = %396
  %399 = add nsw i32 %j.1, %bxx.1
  %400 = sext i32 %399 to i64
  %401 = add nsw i32 %i.1, %byy.1
  %402 = sext i32 %401 to i64
  %403 = getelementptr inbounds [16 x [16 x i32]]* %curr_blk, i32 0, i64 %402
  %404 = getelementptr inbounds [16 x i32]* %403, i32 0, i64 %400
  %405 = load i32* %404, align 4
  %406 = add nsw i32 %k.3, 1
  %407 = sext i32 %k.3 to i64
  %408 = getelementptr inbounds [64 x i32]* %diff, i32 0, i64 %407
  store i32 %405, i32* %408, align 4
  br label %409

; <label>:409                                     ; preds = %398
  %410 = add nsw i32 %j.1, 1
  br label %396

; <label>:411                                     ; preds = %396
  br label %412

; <label>:412                                     ; preds = %411
  %413 = add nsw i32 %i.1, 1
  br label %393

; <label>:414                                     ; preds = %393
  %415 = getelementptr inbounds [64 x i32]* %diff, i32 0, i32 0
  %416 = load %struct.InputParameters** @input, align 8
  %417 = getelementptr inbounds %struct.InputParameters* %416, i32 0, i32 6
  %418 = load i32* %417, align 4
  %419 = call i32 @SATD8X8(i32* %415, i32 %418)
  %420 = add nsw i32 %mcost.4, %419
  br label %421

; <label>:421                                     ; preds = %414
  %422 = add nsw i32 %bxx.1, %17
  br label %384

; <label>:423                                     ; preds = %384
  br label %424

; <label>:424                                     ; preds = %423
  %425 = add nsw i32 %byy.1, %34
  br label %375

; <label>:426                                     ; preds = %375
  br label %427

; <label>:427                                     ; preds = %426, %372, %367
  %mcost.5 = phi i32 [ %mcost.3, %426 ], [ %mcost.0, %372 ], [ %mcost.0, %367 ]
  ret i32 %mcost.5
}

declare void @LumaPrediction4x4(i32, i32, i32, i32, i32, i16 signext, i16 signext) #2

; Function Attrs: nounwind uwtable
define void @FindSkipModeMotionVector() #0 {
  %pmv = alloca [2 x i16], align 2
  %mb_a = alloca %struct.pix_pos, align 4
  %mb_b = alloca %struct.pix_pos, align 4
  %1 = load %struct.ImageParameters** @img, align 8
  %2 = getelementptr inbounds %struct.ImageParameters* %1, i32 0, i32 71
  %3 = load i16******* %2, align 8
  %4 = load %struct.ImageParameters** @img, align 8
  %5 = getelementptr inbounds %struct.ImageParameters* %4, i32 0, i32 3
  %6 = load i32* %5, align 4
  %7 = sext i32 %6 to i64
  %8 = load %struct.ImageParameters** @img, align 8
  %9 = getelementptr inbounds %struct.ImageParameters* %8, i32 0, i32 51
  %10 = load %struct.macroblock** %9, align 8
  %11 = getelementptr inbounds %struct.macroblock* %10, i64 %7
  %12 = load %struct.ImageParameters** @img, align 8
  %13 = getelementptr inbounds %struct.ImageParameters* %12, i32 0, i32 3
  %14 = load i32* %13, align 4
  call void @getLuma4x4Neighbour(i32 %14, i32 0, i32 0, i32 -1, i32 0, %struct.pix_pos* %mb_a)
  %15 = load %struct.ImageParameters** @img, align 8
  %16 = getelementptr inbounds %struct.ImageParameters* %15, i32 0, i32 3
  %17 = load i32* %16, align 4
  call void @getLuma4x4Neighbour(i32 %17, i32 0, i32 0, i32 0, i32 -1, %struct.pix_pos* %mb_b)
  %18 = getelementptr inbounds %struct.pix_pos* %mb_a, i32 0, i32 0
  %19 = load i32* %18, align 4
  %20 = icmp ne i32 %19, 0
  br i1 %20, label %21, label %92

; <label>:21                                      ; preds = %0
  %22 = getelementptr inbounds %struct.pix_pos* %mb_a, i32 0, i32 5
  %23 = load i32* %22, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds %struct.pix_pos* %mb_a, i32 0, i32 4
  %26 = load i32* %25, align 4
  %27 = sext i32 %26 to i64
  %28 = load %struct.storable_picture** @enc_picture, align 8
  %29 = getelementptr inbounds %struct.storable_picture* %28, i32 0, i32 35
  %30 = load i16***** %29, align 8
  %31 = getelementptr inbounds i16**** %30, i64 0
  %32 = load i16**** %31, align 8
  %33 = getelementptr inbounds i16*** %32, i64 %27
  %34 = load i16*** %33, align 8
  %35 = getelementptr inbounds i16** %34, i64 %24
  %36 = load i16** %35, align 8
  %37 = getelementptr inbounds i16* %36, i64 1
  %38 = load i16* %37, align 2
  %39 = sext i16 %38 to i32
  %40 = getelementptr inbounds %struct.pix_pos* %mb_a, i32 0, i32 5
  %41 = load i32* %40, align 4
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds %struct.pix_pos* %mb_a, i32 0, i32 4
  %44 = load i32* %43, align 4
  %45 = sext i32 %44 to i64
  %46 = load %struct.storable_picture** @enc_picture, align 8
  %47 = getelementptr inbounds %struct.storable_picture* %46, i32 0, i32 32
  %48 = load i16**** %47, align 8
  %49 = getelementptr inbounds i16*** %48, i64 0
  %50 = load i16*** %49, align 8
  %51 = getelementptr inbounds i16** %50, i64 %45
  %52 = load i16** %51, align 8
  %53 = getelementptr inbounds i16* %52, i64 %42
  %54 = load i16* %53, align 2
  %55 = sext i16 %54 to i32
  %56 = getelementptr inbounds %struct.macroblock* %11, i32 0, i32 22
  %57 = load i32* %56, align 4
  %58 = icmp ne i32 %57, 0
  br i1 %58, label %59, label %73

; <label>:59                                      ; preds = %21
  %60 = getelementptr inbounds %struct.pix_pos* %mb_a, i32 0, i32 1
  %61 = load i32* %60, align 4
  %62 = sext i32 %61 to i64
  %63 = load %struct.ImageParameters** @img, align 8
  %64 = getelementptr inbounds %struct.ImageParameters* %63, i32 0, i32 51
  %65 = load %struct.macroblock** %64, align 8
  %66 = getelementptr inbounds %struct.macroblock* %65, i64 %62
  %67 = getelementptr inbounds %struct.macroblock* %66, i32 0, i32 22
  %68 = load i32* %67, align 4
  %69 = icmp ne i32 %68, 0
  br i1 %69, label %73, label %70

; <label>:70                                      ; preds = %59
  %71 = sdiv i32 %39, 2
  %72 = mul nsw i32 %55, 2
  br label %73

; <label>:73                                      ; preds = %70, %59, %21
  %a_mv_y.0 = phi i32 [ %39, %59 ], [ %71, %70 ], [ %39, %21 ]
  %a_ref_idx.0 = phi i32 [ %55, %59 ], [ %72, %70 ], [ %55, %21 ]
  %74 = getelementptr inbounds %struct.macroblock* %11, i32 0, i32 22
  %75 = load i32* %74, align 4
  %76 = icmp ne i32 %75, 0
  br i1 %76, label %91, label %77

; <label>:77                                      ; preds = %73
  %78 = getelementptr inbounds %struct.pix_pos* %mb_a, i32 0, i32 1
  %79 = load i32* %78, align 4
  %80 = sext i32 %79 to i64
  %81 = load %struct.ImageParameters** @img, align 8
  %82 = getelementptr inbounds %struct.ImageParameters* %81, i32 0, i32 51
  %83 = load %struct.macroblock** %82, align 8
  %84 = getelementptr inbounds %struct.macroblock* %83, i64 %80
  %85 = getelementptr inbounds %struct.macroblock* %84, i32 0, i32 22
  %86 = load i32* %85, align 4
  %87 = icmp ne i32 %86, 0
  br i1 %87, label %88, label %91

; <label>:88                                      ; preds = %77
  %89 = mul nsw i32 %a_mv_y.0, 2
  %90 = ashr i32 %a_ref_idx.0, 1
  br label %91

; <label>:91                                      ; preds = %88, %77, %73
  %a_mv_y.1 = phi i32 [ %a_mv_y.0, %73 ], [ %89, %88 ], [ %a_mv_y.0, %77 ]
  %a_ref_idx.1 = phi i32 [ %a_ref_idx.0, %73 ], [ %90, %88 ], [ %a_ref_idx.0, %77 ]
  br label %92

; <label>:92                                      ; preds = %91, %0
  %a_mv_y.2 = phi i32 [ %a_mv_y.1, %91 ], [ 0, %0 ]
  %a_ref_idx.2 = phi i32 [ %a_ref_idx.1, %91 ], [ 0, %0 ]
  %93 = getelementptr inbounds %struct.pix_pos* %mb_b, i32 0, i32 0
  %94 = load i32* %93, align 4
  %95 = icmp ne i32 %94, 0
  br i1 %95, label %96, label %167

; <label>:96                                      ; preds = %92
  %97 = getelementptr inbounds %struct.pix_pos* %mb_b, i32 0, i32 5
  %98 = load i32* %97, align 4
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds %struct.pix_pos* %mb_b, i32 0, i32 4
  %101 = load i32* %100, align 4
  %102 = sext i32 %101 to i64
  %103 = load %struct.storable_picture** @enc_picture, align 8
  %104 = getelementptr inbounds %struct.storable_picture* %103, i32 0, i32 35
  %105 = load i16***** %104, align 8
  %106 = getelementptr inbounds i16**** %105, i64 0
  %107 = load i16**** %106, align 8
  %108 = getelementptr inbounds i16*** %107, i64 %102
  %109 = load i16*** %108, align 8
  %110 = getelementptr inbounds i16** %109, i64 %99
  %111 = load i16** %110, align 8
  %112 = getelementptr inbounds i16* %111, i64 1
  %113 = load i16* %112, align 2
  %114 = sext i16 %113 to i32
  %115 = getelementptr inbounds %struct.pix_pos* %mb_b, i32 0, i32 5
  %116 = load i32* %115, align 4
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds %struct.pix_pos* %mb_b, i32 0, i32 4
  %119 = load i32* %118, align 4
  %120 = sext i32 %119 to i64
  %121 = load %struct.storable_picture** @enc_picture, align 8
  %122 = getelementptr inbounds %struct.storable_picture* %121, i32 0, i32 32
  %123 = load i16**** %122, align 8
  %124 = getelementptr inbounds i16*** %123, i64 0
  %125 = load i16*** %124, align 8
  %126 = getelementptr inbounds i16** %125, i64 %120
  %127 = load i16** %126, align 8
  %128 = getelementptr inbounds i16* %127, i64 %117
  %129 = load i16* %128, align 2
  %130 = sext i16 %129 to i32
  %131 = getelementptr inbounds %struct.macroblock* %11, i32 0, i32 22
  %132 = load i32* %131, align 4
  %133 = icmp ne i32 %132, 0
  br i1 %133, label %134, label %148

; <label>:134                                     ; preds = %96
  %135 = getelementptr inbounds %struct.pix_pos* %mb_b, i32 0, i32 1
  %136 = load i32* %135, align 4
  %137 = sext i32 %136 to i64
  %138 = load %struct.ImageParameters** @img, align 8
  %139 = getelementptr inbounds %struct.ImageParameters* %138, i32 0, i32 51
  %140 = load %struct.macroblock** %139, align 8
  %141 = getelementptr inbounds %struct.macroblock* %140, i64 %137
  %142 = getelementptr inbounds %struct.macroblock* %141, i32 0, i32 22
  %143 = load i32* %142, align 4
  %144 = icmp ne i32 %143, 0
  br i1 %144, label %148, label %145

; <label>:145                                     ; preds = %134
  %146 = sdiv i32 %114, 2
  %147 = mul nsw i32 %130, 2
  br label %148

; <label>:148                                     ; preds = %145, %134, %96
  %b_mv_y.0 = phi i32 [ %114, %134 ], [ %146, %145 ], [ %114, %96 ]
  %b_ref_idx.0 = phi i32 [ %130, %134 ], [ %147, %145 ], [ %130, %96 ]
  %149 = getelementptr inbounds %struct.macroblock* %11, i32 0, i32 22
  %150 = load i32* %149, align 4
  %151 = icmp ne i32 %150, 0
  br i1 %151, label %166, label %152

; <label>:152                                     ; preds = %148
  %153 = getelementptr inbounds %struct.pix_pos* %mb_b, i32 0, i32 1
  %154 = load i32* %153, align 4
  %155 = sext i32 %154 to i64
  %156 = load %struct.ImageParameters** @img, align 8
  %157 = getelementptr inbounds %struct.ImageParameters* %156, i32 0, i32 51
  %158 = load %struct.macroblock** %157, align 8
  %159 = getelementptr inbounds %struct.macroblock* %158, i64 %155
  %160 = getelementptr inbounds %struct.macroblock* %159, i32 0, i32 22
  %161 = load i32* %160, align 4
  %162 = icmp ne i32 %161, 0
  br i1 %162, label %163, label %166

; <label>:163                                     ; preds = %152
  %164 = mul nsw i32 %b_mv_y.0, 2
  %165 = ashr i32 %b_ref_idx.0, 1
  br label %166

; <label>:166                                     ; preds = %163, %152, %148
  %b_mv_y.1 = phi i32 [ %b_mv_y.0, %148 ], [ %164, %163 ], [ %b_mv_y.0, %152 ]
  %b_ref_idx.1 = phi i32 [ %b_ref_idx.0, %148 ], [ %165, %163 ], [ %b_ref_idx.0, %152 ]
  br label %167

; <label>:167                                     ; preds = %166, %92
  %b_mv_y.2 = phi i32 [ %b_mv_y.1, %166 ], [ 0, %92 ]
  %b_ref_idx.2 = phi i32 [ %b_ref_idx.1, %166 ], [ 0, %92 ]
  %168 = getelementptr inbounds %struct.pix_pos* %mb_a, i32 0, i32 0
  %169 = load i32* %168, align 4
  %170 = icmp ne i32 %169, 0
  br i1 %170, label %172, label %171

; <label>:171                                     ; preds = %167
  br label %199

; <label>:172                                     ; preds = %167
  %173 = icmp eq i32 %a_ref_idx.2, 0
  br i1 %173, label %174, label %196

; <label>:174                                     ; preds = %172
  %175 = getelementptr inbounds %struct.pix_pos* %mb_a, i32 0, i32 5
  %176 = load i32* %175, align 4
  %177 = sext i32 %176 to i64
  %178 = getelementptr inbounds %struct.pix_pos* %mb_a, i32 0, i32 4
  %179 = load i32* %178, align 4
  %180 = sext i32 %179 to i64
  %181 = load %struct.storable_picture** @enc_picture, align 8
  %182 = getelementptr inbounds %struct.storable_picture* %181, i32 0, i32 35
  %183 = load i16***** %182, align 8
  %184 = getelementptr inbounds i16**** %183, i64 0
  %185 = load i16**** %184, align 8
  %186 = getelementptr inbounds i16*** %185, i64 %180
  %187 = load i16*** %186, align 8
  %188 = getelementptr inbounds i16** %187, i64 %177
  %189 = load i16** %188, align 8
  %190 = getelementptr inbounds i16* %189, i64 0
  %191 = load i16* %190, align 2
  %192 = sext i16 %191 to i32
  %193 = icmp eq i32 %192, 0
  br i1 %193, label %194, label %196

; <label>:194                                     ; preds = %174
  %195 = icmp eq i32 %a_mv_y.2, 0
  br label %196

; <label>:196                                     ; preds = %194, %174, %172
  %197 = phi i1 [ false, %174 ], [ false, %172 ], [ %195, %194 ]
  %198 = select i1 %197, i32 1, i32 0
  br label %199

; <label>:199                                     ; preds = %196, %171
  %200 = phi i32 [ 1, %171 ], [ %198, %196 ]
  %201 = getelementptr inbounds %struct.pix_pos* %mb_b, i32 0, i32 0
  %202 = load i32* %201, align 4
  %203 = icmp ne i32 %202, 0
  br i1 %203, label %205, label %204

; <label>:204                                     ; preds = %199
  br label %232

; <label>:205                                     ; preds = %199
  %206 = icmp eq i32 %b_ref_idx.2, 0
  br i1 %206, label %207, label %229

; <label>:207                                     ; preds = %205
  %208 = getelementptr inbounds %struct.pix_pos* %mb_b, i32 0, i32 5
  %209 = load i32* %208, align 4
  %210 = sext i32 %209 to i64
  %211 = getelementptr inbounds %struct.pix_pos* %mb_b, i32 0, i32 4
  %212 = load i32* %211, align 4
  %213 = sext i32 %212 to i64
  %214 = load %struct.storable_picture** @enc_picture, align 8
  %215 = getelementptr inbounds %struct.storable_picture* %214, i32 0, i32 35
  %216 = load i16***** %215, align 8
  %217 = getelementptr inbounds i16**** %216, i64 0
  %218 = load i16**** %217, align 8
  %219 = getelementptr inbounds i16*** %218, i64 %213
  %220 = load i16*** %219, align 8
  %221 = getelementptr inbounds i16** %220, i64 %210
  %222 = load i16** %221, align 8
  %223 = getelementptr inbounds i16* %222, i64 0
  %224 = load i16* %223, align 2
  %225 = sext i16 %224 to i32
  %226 = icmp eq i32 %225, 0
  br i1 %226, label %227, label %229

; <label>:227                                     ; preds = %207
  %228 = icmp eq i32 %b_mv_y.2, 0
  br label %229

; <label>:229                                     ; preds = %227, %207, %205
  %230 = phi i1 [ false, %207 ], [ false, %205 ], [ %228, %227 ]
  %231 = select i1 %230, i32 1, i32 0
  br label %232

; <label>:232                                     ; preds = %229, %204
  %233 = phi i32 [ 1, %204 ], [ %231, %229 ]
  %234 = icmp ne i32 %233, 0
  br i1 %234, label %237, label %235

; <label>:235                                     ; preds = %232
  %236 = icmp ne i32 %200, 0
  br i1 %236, label %237, label %276

; <label>:237                                     ; preds = %235, %232
  br label %238

; <label>:238                                     ; preds = %273, %237
  %by.0 = phi i32 [ 0, %237 ], [ %274, %273 ]
  %239 = icmp slt i32 %by.0, 4
  br i1 %239, label %240, label %275

; <label>:240                                     ; preds = %238
  br label %241

; <label>:241                                     ; preds = %270, %240
  %bx.0 = phi i32 [ 0, %240 ], [ %271, %270 ]
  %242 = icmp slt i32 %bx.0, 4
  br i1 %242, label %243, label %272

; <label>:243                                     ; preds = %241
  %244 = sext i32 %by.0 to i64
  %245 = sext i32 %bx.0 to i64
  %246 = getelementptr inbounds i16****** %3, i64 %245
  %247 = load i16****** %246, align 8
  %248 = getelementptr inbounds i16***** %247, i64 %244
  %249 = load i16***** %248, align 8
  %250 = getelementptr inbounds i16**** %249, i64 0
  %251 = load i16**** %250, align 8
  %252 = getelementptr inbounds i16*** %251, i64 0
  %253 = load i16*** %252, align 8
  %254 = getelementptr inbounds i16** %253, i64 0
  %255 = load i16** %254, align 8
  %256 = getelementptr inbounds i16* %255, i64 0
  store i16 0, i16* %256, align 2
  %257 = sext i32 %by.0 to i64
  %258 = sext i32 %bx.0 to i64
  %259 = getelementptr inbounds i16****** %3, i64 %258
  %260 = load i16****** %259, align 8
  %261 = getelementptr inbounds i16***** %260, i64 %257
  %262 = load i16***** %261, align 8
  %263 = getelementptr inbounds i16**** %262, i64 0
  %264 = load i16**** %263, align 8
  %265 = getelementptr inbounds i16*** %264, i64 0
  %266 = load i16*** %265, align 8
  %267 = getelementptr inbounds i16** %266, i64 0
  %268 = load i16** %267, align 8
  %269 = getelementptr inbounds i16* %268, i64 1
  store i16 0, i16* %269, align 2
  br label %270

; <label>:270                                     ; preds = %243
  %271 = add nsw i32 %bx.0, 1
  br label %241

; <label>:272                                     ; preds = %241
  br label %273

; <label>:273                                     ; preds = %272
  %274 = add nsw i32 %by.0, 1
  br label %238

; <label>:275                                     ; preds = %238
  br label %326

; <label>:276                                     ; preds = %235
  %277 = getelementptr inbounds [2 x i16]* %pmv, i32 0, i32 0
  %278 = load %struct.storable_picture** @enc_picture, align 8
  %279 = getelementptr inbounds %struct.storable_picture* %278, i32 0, i32 32
  %280 = load i16**** %279, align 8
  %281 = load %struct.storable_picture** @enc_picture, align 8
  %282 = getelementptr inbounds %struct.storable_picture* %281, i32 0, i32 35
  %283 = load i16***** %282, align 8
  call void @SetMotionVectorPredictor(i16* %277, i16*** %280, i16**** %283, i16 signext 0, i32 0, i32 0, i32 0, i32 16, i32 16)
  br label %284

; <label>:284                                     ; preds = %323, %276
  %by.1 = phi i32 [ 0, %276 ], [ %324, %323 ]
  %285 = icmp slt i32 %by.1, 4
  br i1 %285, label %286, label %325

; <label>:286                                     ; preds = %284
  br label %287

; <label>:287                                     ; preds = %320, %286
  %bx.1 = phi i32 [ 0, %286 ], [ %321, %320 ]
  %288 = icmp slt i32 %bx.1, 4
  br i1 %288, label %289, label %322

; <label>:289                                     ; preds = %287
  %290 = getelementptr inbounds [2 x i16]* %pmv, i32 0, i64 0
  %291 = load i16* %290, align 2
  %292 = sext i32 %by.1 to i64
  %293 = sext i32 %bx.1 to i64
  %294 = getelementptr inbounds i16****** %3, i64 %293
  %295 = load i16****** %294, align 8
  %296 = getelementptr inbounds i16***** %295, i64 %292
  %297 = load i16***** %296, align 8
  %298 = getelementptr inbounds i16**** %297, i64 0
  %299 = load i16**** %298, align 8
  %300 = getelementptr inbounds i16*** %299, i64 0
  %301 = load i16*** %300, align 8
  %302 = getelementptr inbounds i16** %301, i64 0
  %303 = load i16** %302, align 8
  %304 = getelementptr inbounds i16* %303, i64 0
  store i16 %291, i16* %304, align 2
  %305 = getelementptr inbounds [2 x i16]* %pmv, i32 0, i64 1
  %306 = load i16* %305, align 2
  %307 = sext i32 %by.1 to i64
  %308 = sext i32 %bx.1 to i64
  %309 = getelementptr inbounds i16****** %3, i64 %308
  %310 = load i16****** %309, align 8
  %311 = getelementptr inbounds i16***** %310, i64 %307
  %312 = load i16***** %311, align 8
  %313 = getelementptr inbounds i16**** %312, i64 0
  %314 = load i16**** %313, align 8
  %315 = getelementptr inbounds i16*** %314, i64 0
  %316 = load i16*** %315, align 8
  %317 = getelementptr inbounds i16** %316, i64 0
  %318 = load i16** %317, align 8
  %319 = getelementptr inbounds i16* %318, i64 1
  store i16 %306, i16* %319, align 2
  br label %320

; <label>:320                                     ; preds = %289
  %321 = add nsw i32 %bx.1, 1
  br label %287

; <label>:322                                     ; preds = %287
  br label %323

; <label>:323                                     ; preds = %322
  %324 = add nsw i32 %by.1, 1
  br label %284

; <label>:325                                     ; preds = %284
  br label %326

; <label>:326                                     ; preds = %325, %275
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @Get_Direct_Cost8x8(i32 %block, i32* %cost8x8) #0 {
  %curr_diff = alloca [8 x [8 x i32]], align 16
  %diff8x8 = alloca [64 x i32], align 16
  %diff = alloca [16 x i32], align 16
  %1 = sdiv i32 %block, 2
  %2 = shl i32 %1, 3
  %3 = srem i32 %block, 2
  %4 = shl i32 %3, 3
  br label %5

; <label>:5                                       ; preds = %119, %0
  %block_y.0 = phi i32 [ %2, %0 ], [ %120, %119 ]
  %cost.0 = phi i32 [ 0, %0 ], [ %cost.1, %119 ]
  %6 = add nsw i32 %2, 8
  %7 = icmp slt i32 %block_y.0, %6
  br i1 %7, label %8, label %121

; <label>:8                                       ; preds = %5
  %9 = load %struct.ImageParameters** @img, align 8
  %10 = getelementptr inbounds %struct.ImageParameters* %9, i32 0, i32 38
  %11 = load i32* %10, align 4
  %12 = add nsw i32 %11, %block_y.0
  br label %13

; <label>:13                                      ; preds = %116, %8
  %block_x.0 = phi i32 [ %4, %8 ], [ %117, %116 ]
  %cost.1 = phi i32 [ %cost.0, %8 ], [ %115, %116 ]
  %14 = add nsw i32 %4, 8
  %15 = icmp slt i32 %block_x.0, %14
  br i1 %15, label %16, label %118

; <label>:16                                      ; preds = %13
  %17 = load %struct.ImageParameters** @img, align 8
  %18 = getelementptr inbounds %struct.ImageParameters* %17, i32 0, i32 37
  %19 = load i32* %18, align 4
  %20 = add nsw i32 %19, %block_x.0
  %21 = ashr i32 %12, 2
  %22 = sext i32 %21 to i64
  %23 = ashr i32 %20, 2
  %24 = sext i32 %23 to i64
  %25 = load i16*** @direct_pdir, align 8
  %26 = getelementptr inbounds i16** %25, i64 %24
  %27 = load i16** %26, align 8
  %28 = getelementptr inbounds i16* %27, i64 %22
  %29 = load i16* %28, align 2
  %30 = sext i16 %29 to i32
  %31 = icmp slt i32 %30, 0
  br i1 %31, label %32, label %33

; <label>:32                                      ; preds = %16
  store i32 2147483647, i32* %cost8x8, align 4
  br label %160

; <label>:33                                      ; preds = %16
  %34 = ashr i32 %12, 2
  %35 = sext i32 %34 to i64
  %36 = ashr i32 %20, 2
  %37 = sext i32 %36 to i64
  %38 = load i16*** @direct_pdir, align 8
  %39 = getelementptr inbounds i16** %38, i64 %37
  %40 = load i16** %39, align 8
  %41 = getelementptr inbounds i16* %40, i64 %35
  %42 = load i16* %41, align 2
  %43 = sext i16 %42 to i32
  %44 = ashr i32 %12, 2
  %45 = sext i32 %44 to i64
  %46 = ashr i32 %20, 2
  %47 = sext i32 %46 to i64
  %48 = load i16**** @direct_ref_idx, align 8
  %49 = getelementptr inbounds i16*** %48, i64 0
  %50 = load i16*** %49, align 8
  %51 = getelementptr inbounds i16** %50, i64 %47
  %52 = load i16** %51, align 8
  %53 = getelementptr inbounds i16* %52, i64 %45
  %54 = load i16* %53, align 2
  %55 = ashr i32 %12, 2
  %56 = sext i32 %55 to i64
  %57 = ashr i32 %20, 2
  %58 = sext i32 %57 to i64
  %59 = load i16**** @direct_ref_idx, align 8
  %60 = getelementptr inbounds i16*** %59, i64 1
  %61 = load i16*** %60, align 8
  %62 = getelementptr inbounds i16** %61, i64 %58
  %63 = load i16** %62, align 8
  %64 = getelementptr inbounds i16* %63, i64 %56
  %65 = load i16* %64, align 2
  call void @LumaPrediction4x4(i32 %block_x.0, i32 %block_y.0, i32 %43, i32 0, i32 0, i16 signext %54, i16 signext %65)
  br label %66

; <label>:66                                      ; preds = %107, %33
  %j.0 = phi i32 [ 0, %33 ], [ %108, %107 ]
  %k.0 = phi i32 [ 0, %33 ], [ %k.1, %107 ]
  %67 = icmp slt i32 %j.0, 4
  br i1 %67, label %68, label %109

; <label>:68                                      ; preds = %66
  br label %69

; <label>:69                                      ; preds = %103, %68
  %i.0 = phi i32 [ 0, %68 ], [ %104, %103 ]
  %k.1 = phi i32 [ %k.0, %68 ], [ %105, %103 ]
  %70 = icmp slt i32 %i.0, 4
  br i1 %70, label %71, label %106

; <label>:71                                      ; preds = %69
  %72 = add nsw i32 %20, %i.0
  %73 = sext i32 %72 to i64
  %74 = add nsw i32 %12, %j.0
  %75 = sext i32 %74 to i64
  %76 = load i16*** @imgY_org, align 8
  %77 = getelementptr inbounds i16** %76, i64 %75
  %78 = load i16** %77, align 8
  %79 = getelementptr inbounds i16* %78, i64 %73
  %80 = load i16* %79, align 2
  %81 = zext i16 %80 to i32
  %82 = add nsw i32 %j.0, %block_y.0
  %83 = sext i32 %82 to i64
  %84 = add nsw i32 %i.0, %block_x.0
  %85 = sext i32 %84 to i64
  %86 = load %struct.ImageParameters** @img, align 8
  %87 = getelementptr inbounds %struct.ImageParameters* %86, i32 0, i32 45
  %88 = getelementptr inbounds [16 x [16 x i16]]* %87, i32 0, i64 %85
  %89 = getelementptr inbounds [16 x i16]* %88, i32 0, i64 %83
  %90 = load i16* %89, align 2
  %91 = zext i16 %90 to i32
  %92 = sub nsw i32 %81, %91
  %93 = sub nsw i32 %block_x.0, %4
  %94 = add nsw i32 %93, %i.0
  %95 = sext i32 %94 to i64
  %96 = sub nsw i32 %block_y.0, %2
  %97 = add nsw i32 %96, %j.0
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds [8 x [8 x i32]]* %curr_diff, i32 0, i64 %98
  %100 = getelementptr inbounds [8 x i32]* %99, i32 0, i64 %95
  store i32 %92, i32* %100, align 4
  %101 = sext i32 %k.1 to i64
  %102 = getelementptr inbounds [16 x i32]* %diff, i32 0, i64 %101
  store i32 %92, i32* %102, align 4
  br label %103

; <label>:103                                     ; preds = %71
  %104 = add nsw i32 %i.0, 1
  %105 = add nsw i32 %k.1, 1
  br label %69

; <label>:106                                     ; preds = %69
  br label %107

; <label>:107                                     ; preds = %106
  %108 = add nsw i32 %j.0, 1
  br label %66

; <label>:109                                     ; preds = %66
  %110 = getelementptr inbounds [16 x i32]* %diff, i32 0, i32 0
  %111 = load %struct.InputParameters** @input, align 8
  %112 = getelementptr inbounds %struct.InputParameters* %111, i32 0, i32 6
  %113 = load i32* %112, align 4
  %114 = call i32 @SATD(i32* %110, i32 %113)
  %115 = add nsw i32 %cost.1, %114
  br label %116

; <label>:116                                     ; preds = %109
  %117 = add nsw i32 %block_x.0, 4
  br label %13

; <label>:118                                     ; preds = %13
  br label %119

; <label>:119                                     ; preds = %118
  %120 = add nsw i32 %block_y.0, 4
  br label %5

; <label>:121                                     ; preds = %5
  %122 = load %struct.InputParameters** @input, align 8
  %123 = getelementptr inbounds %struct.InputParameters* %122, i32 0, i32 85
  %124 = load i32* %123, align 4
  %125 = icmp eq i32 %124, 0
  br i1 %125, label %126, label %159

; <label>:126                                     ; preds = %121
  %127 = load %struct.InputParameters** @input, align 8
  %128 = getelementptr inbounds %struct.InputParameters* %127, i32 0, i32 123
  %129 = load i32* %128, align 4
  %130 = icmp ne i32 %129, 0
  br i1 %130, label %131, label %159

; <label>:131                                     ; preds = %126
  br label %132

; <label>:132                                     ; preds = %149, %131
  %j.1 = phi i32 [ 0, %131 ], [ %150, %149 ]
  %k.2 = phi i32 [ 0, %131 ], [ %k.3, %149 ]
  %133 = icmp slt i32 %j.1, 8
  br i1 %133, label %134, label %151

; <label>:134                                     ; preds = %132
  br label %135

; <label>:135                                     ; preds = %145, %134
  %i.1 = phi i32 [ 0, %134 ], [ %146, %145 ]
  %k.3 = phi i32 [ %k.2, %134 ], [ %147, %145 ]
  %136 = icmp slt i32 %i.1, 8
  br i1 %136, label %137, label %148

; <label>:137                                     ; preds = %135
  %138 = sext i32 %i.1 to i64
  %139 = sext i32 %j.1 to i64
  %140 = getelementptr inbounds [8 x [8 x i32]]* %curr_diff, i32 0, i64 %139
  %141 = getelementptr inbounds [8 x i32]* %140, i32 0, i64 %138
  %142 = load i32* %141, align 4
  %143 = sext i32 %k.3 to i64
  %144 = getelementptr inbounds [64 x i32]* %diff8x8, i32 0, i64 %143
  store i32 %142, i32* %144, align 4
  br label %145

; <label>:145                                     ; preds = %137
  %146 = add nsw i32 %i.1, 1
  %147 = add nsw i32 %k.3, 1
  br label %135

; <label>:148                                     ; preds = %135
  br label %149

; <label>:149                                     ; preds = %148
  %150 = add nsw i32 %j.1, 1
  br label %132

; <label>:151                                     ; preds = %132
  %152 = getelementptr inbounds [64 x i32]* %diff8x8, i32 0, i32 0
  %153 = load %struct.InputParameters** @input, align 8
  %154 = getelementptr inbounds %struct.InputParameters* %153, i32 0, i32 6
  %155 = load i32* %154, align 4
  %156 = call i32 @SATD8X8(i32* %152, i32 %155)
  %157 = load i32* %cost8x8, align 4
  %158 = add nsw i32 %157, %156
  store i32 %158, i32* %cost8x8, align 4
  br label %159

; <label>:159                                     ; preds = %151, %126, %121
  br label %160

; <label>:160                                     ; preds = %159, %32
  %.0 = phi i32 [ 2147483647, %32 ], [ %cost.0, %159 ]
  ret i32 %.0
}

; Function Attrs: nounwind uwtable
define i32 @Get_Direct_CostMB(double %lambda) #0 {
  %cost8x8 = alloca i32, align 4
  store i32 0, i32* %cost8x8, align 4
  br label %1

; <label>:1                                       ; preds = %12, %0
  %i.0 = phi i32 [ 0, %0 ], [ %13, %12 ]
  %cost.0 = phi i32 [ 0, %0 ], [ %5, %12 ]
  %2 = icmp slt i32 %i.0, 4
  br i1 %2, label %3, label %14

; <label>:3                                       ; preds = %1
  %4 = call i32 @Get_Direct_Cost8x8(i32 %i.0, i32* %cost8x8)
  %5 = add nsw i32 %cost.0, %4
  %6 = icmp eq i32 %5, 2147483647
  br i1 %6, label %10, label %7

; <label>:7                                       ; preds = %3
  %8 = load i32* %cost8x8, align 4
  %9 = icmp eq i32 %8, 2147483647
  br i1 %9, label %10, label %11

; <label>:10                                      ; preds = %7, %3
  br label %43

; <label>:11                                      ; preds = %7
  br label %12

; <label>:12                                      ; preds = %11
  %13 = add nsw i32 %i.0, 1
  br label %1

; <label>:14                                      ; preds = %1
  %15 = load %struct.InputParameters** @input, align 8
  %16 = getelementptr inbounds %struct.InputParameters* %15, i32 0, i32 123
  %17 = load i32* %16, align 4
  switch i32 %17, label %41 [
    i32 1, label %18
    i32 2, label %39
  ]

; <label>:18                                      ; preds = %14
  %19 = load i32* %cost8x8, align 4
  %20 = icmp slt i32 %19, %cost.0
  br i1 %20, label %36, label %21

; <label>:21                                      ; preds = %18
  %22 = load %struct.InputParameters** @input, align 8
  %23 = getelementptr inbounds %struct.InputParameters* %22, i32 0, i32 66
  %24 = load i32* %23, align 4
  %25 = icmp ne i32 %24, 0
  br i1 %25, label %26, label %36

; <label>:26                                      ; preds = %21
  %27 = load %struct.InputParameters** @input, align 8
  %28 = getelementptr inbounds %struct.InputParameters* %27, i32 0, i32 67
  %29 = load i32* %28, align 4
  %30 = icmp ne i32 %29, 0
  br i1 %30, label %31, label %36

; <label>:31                                      ; preds = %26
  %32 = load %struct.InputParameters** @input, align 8
  %33 = getelementptr inbounds %struct.InputParameters* %32, i32 0, i32 68
  %34 = load i32* %33, align 4
  %35 = icmp ne i32 %34, 0
  br i1 %35, label %38, label %36

; <label>:36                                      ; preds = %31, %26, %21, %18
  %37 = load i32* %cost8x8, align 4
  br label %38

; <label>:38                                      ; preds = %36, %31
  %cost.1 = phi i32 [ %37, %36 ], [ %cost.0, %31 ]
  br label %42

; <label>:39                                      ; preds = %14
  %40 = load i32* %cost8x8, align 4
  br label %42

; <label>:41                                      ; preds = %14
  br label %42

; <label>:42                                      ; preds = %41, %39, %38
  %cost.2 = phi i32 [ %cost.0, %41 ], [ %40, %39 ], [ %cost.1, %38 ]
  br label %43

; <label>:43                                      ; preds = %42, %10
  %.0 = phi i32 [ %5, %10 ], [ %cost.2, %42 ]
  ret i32 %.0
}

; Function Attrs: nounwind uwtable
define void @PartitionMotionSearch(i32 %blocktype, i32 %block8x8, double %lambda) #0 {
  %1 = load %struct.ImageParameters** @img, align 8
  %2 = getelementptr inbounds %struct.ImageParameters* %1, i32 0, i32 6
  %3 = load i32* %2, align 4
  %4 = icmp eq i32 %3, 1
  %5 = zext i1 %4 to i32
  %6 = icmp slt i32 %blocktype, 4
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %0
  br label %9

; <label>:8                                       ; preds = %0
  br label %9

; <label>:9                                       ; preds = %8, %7
  %10 = phi i32 [ %blocktype, %7 ], [ 4, %8 ]
  %11 = sext i32 %10 to i64
  %12 = load %struct.InputParameters** @input, align 8
  %13 = getelementptr inbounds %struct.InputParameters* %12, i32 0, i32 21
  %14 = getelementptr inbounds [8 x [2 x i32]]* %13, i32 0, i64 %11
  %15 = getelementptr inbounds [2 x i32]* %14, i32 0, i64 0
  %16 = load i32* %15, align 4
  %17 = sext i32 %10 to i64
  %18 = load %struct.InputParameters** @input, align 8
  %19 = getelementptr inbounds %struct.InputParameters* %18, i32 0, i32 21
  %20 = getelementptr inbounds [8 x [2 x i32]]* %19, i32 0, i64 %17
  %21 = getelementptr inbounds [2 x i32]* %20, i32 0, i64 1
  %22 = load i32* %21, align 4
  %23 = sext i32 %blocktype to i64
  %24 = load %struct.InputParameters** @input, align 8
  %25 = getelementptr inbounds %struct.InputParameters* %24, i32 0, i32 21
  %26 = getelementptr inbounds [8 x [2 x i32]]* %25, i32 0, i64 %23
  %27 = getelementptr inbounds [2 x i32]* %26, i32 0, i64 0
  %28 = load i32* %27, align 4
  %29 = sext i32 %blocktype to i64
  %30 = load %struct.InputParameters** @input, align 8
  %31 = getelementptr inbounds %struct.InputParameters* %30, i32 0, i32 21
  %32 = getelementptr inbounds [8 x [2 x i32]]* %31, i32 0, i64 %29
  %33 = getelementptr inbounds [2 x i32]* %32, i32 0, i64 1
  %34 = load i32* %33, align 4
  %35 = load %struct.ImageParameters** @img, align 8
  %36 = getelementptr inbounds %struct.ImageParameters* %35, i32 0, i32 3
  %37 = load i32* %36, align 4
  %38 = sext i32 %37 to i64
  %39 = load %struct.ImageParameters** @img, align 8
  %40 = getelementptr inbounds %struct.ImageParameters* %39, i32 0, i32 51
  %41 = load %struct.macroblock** %40, align 8
  %42 = getelementptr inbounds %struct.macroblock* %41, i64 %38
  %43 = getelementptr inbounds %struct.macroblock* %42, i32 0, i32 22
  %44 = load i32* %43, align 4
  %45 = icmp ne i32 %44, 0
  br i1 %45, label %46, label %55

; <label>:46                                      ; preds = %9
  %47 = load %struct.ImageParameters** @img, align 8
  %48 = getelementptr inbounds %struct.ImageParameters* %47, i32 0, i32 3
  %49 = load i32* %48, align 4
  %50 = srem i32 %49, 2
  %51 = icmp ne i32 %50, 0
  br i1 %51, label %52, label %53

; <label>:52                                      ; preds = %46
  br label %54

; <label>:53                                      ; preds = %46
  br label %54

; <label>:54                                      ; preds = %53, %52
  %list_offset.0 = phi i32 [ 4, %52 ], [ 2, %53 ]
  br label %56

; <label>:55                                      ; preds = %9
  br label %56

; <label>:56                                      ; preds = %55, %54
  %list_offset.1 = phi i32 [ %list_offset.0, %54 ], [ 0, %55 ]
  %57 = icmp ne i32 %5, 0
  %58 = select i1 %57, i32 2, i32 1
  br label %59

; <label>:59                                      ; preds = %280, %56
  %list.0 = phi i32 [ 0, %56 ], [ %281, %280 ]
  %60 = icmp slt i32 %list.0, %58
  br i1 %60, label %61, label %282

; <label>:61                                      ; preds = %59
  br label %62

; <label>:62                                      ; preds = %277, %61
  %ref.0 = phi i16 [ 0, %61 ], [ %278, %277 ]
  %63 = sext i16 %ref.0 to i32
  %64 = add nsw i32 %list.0, %list_offset.1
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds [6 x i32]* @listXsize, i32 0, i64 %65
  %67 = load i32* %66, align 4
  %68 = icmp slt i32 %63, %67
  br i1 %68, label %69, label %279

; <label>:69                                      ; preds = %62
  %70 = load %struct.InputParameters** @input, align 8
  %71 = getelementptr inbounds %struct.InputParameters* %70, i32 0, i32 78
  %72 = load i32* %71, align 4
  %73 = icmp eq i32 %72, 2
  br i1 %73, label %74, label %78

; <label>:74                                      ; preds = %69
  %75 = load %struct.InputParameters** @input, align 8
  %76 = getelementptr inbounds %struct.InputParameters* %75, i32 0, i32 8
  %77 = load i32* %76, align 4
  br label %116

; <label>:78                                      ; preds = %69
  %79 = load %struct.InputParameters** @input, align 8
  %80 = getelementptr inbounds %struct.InputParameters* %79, i32 0, i32 78
  %81 = load i32* %80, align 4
  %82 = icmp eq i32 %81, 1
  br i1 %82, label %83, label %96

; <label>:83                                      ; preds = %78
  %84 = load %struct.InputParameters** @input, align 8
  %85 = getelementptr inbounds %struct.InputParameters* %84, i32 0, i32 8
  %86 = load i32* %85, align 4
  %87 = sext i16 %ref.0 to i32
  %88 = icmp slt i32 %87, 1
  br i1 %88, label %89, label %91

; <label>:89                                      ; preds = %83
  %90 = sext i16 %ref.0 to i32
  br label %92

; <label>:91                                      ; preds = %83
  br label %92

; <label>:92                                      ; preds = %91, %89
  %93 = phi i32 [ %90, %89 ], [ 1, %91 ]
  %94 = add nsw i32 %93, 1
  %95 = sdiv i32 %86, %94
  br label %115

; <label>:96                                      ; preds = %78
  %97 = load %struct.InputParameters** @input, align 8
  %98 = getelementptr inbounds %struct.InputParameters* %97, i32 0, i32 8
  %99 = load i32* %98, align 4
  %100 = sext i16 %ref.0 to i32
  %101 = icmp slt i32 %100, 1
  br i1 %101, label %102, label %104

; <label>:102                                     ; preds = %96
  %103 = sext i16 %ref.0 to i32
  br label %105

; <label>:104                                     ; preds = %96
  br label %105

; <label>:105                                     ; preds = %104, %102
  %106 = phi i32 [ %103, %102 ], [ 1, %104 ]
  %107 = add nsw i32 %106, 1
  %108 = icmp slt i32 2, %blocktype
  br i1 %108, label %109, label %110

; <label>:109                                     ; preds = %105
  br label %111

; <label>:110                                     ; preds = %105
  br label %111

; <label>:111                                     ; preds = %110, %109
  %112 = phi i32 [ 2, %109 ], [ %blocktype, %110 ]
  %113 = mul nsw i32 %107, %112
  %114 = sdiv i32 %99, %113
  br label %115

; <label>:115                                     ; preds = %111, %92
  %search_range.0 = phi i32 [ %95, %92 ], [ %114, %111 ]
  br label %116

; <label>:116                                     ; preds = %115, %74
  %search_range.1 = phi i32 [ %77, %74 ], [ %search_range.0, %115 ]
  %117 = sext i32 %list.0 to i64
  %118 = load %struct.storable_picture** @enc_picture, align 8
  %119 = getelementptr inbounds %struct.storable_picture* %118, i32 0, i32 32
  %120 = load i16**** %119, align 8
  %121 = getelementptr inbounds i16*** %120, i64 %117
  %122 = load i16*** %121, align 8
  %123 = sext i32 %list.0 to i64
  %124 = load %struct.storable_picture** @enc_picture, align 8
  %125 = getelementptr inbounds %struct.storable_picture* %124, i32 0, i32 35
  %126 = load i16***** %125, align 8
  %127 = getelementptr inbounds i16**** %126, i64 %123
  %128 = load i16**** %127, align 8
  %129 = sext i32 %block8x8 to i64
  %130 = sext i16 %ref.0 to i64
  %131 = sext i32 %list.0 to i64
  %132 = sext i32 %blocktype to i64
  %133 = load i32***** @motion_cost, align 8
  %134 = getelementptr inbounds i32**** %133, i64 %132
  %135 = load i32**** %134, align 8
  %136 = getelementptr inbounds i32*** %135, i64 %131
  %137 = load i32*** %136, align 8
  %138 = getelementptr inbounds i32** %137, i64 %130
  %139 = load i32** %138, align 8
  %140 = getelementptr inbounds i32* %139, i64 %129
  store i32 0, i32* %140, align 4
  %141 = sext i32 %block8x8 to i64
  %142 = sext i32 %10 to i64
  %143 = getelementptr inbounds [5 x [4 x i32]]* @PartitionMotionSearch.by0, i32 0, i64 %142
  %144 = getelementptr inbounds [4 x i32]* %143, i32 0, i64 %141
  %145 = load i32* %144, align 4
  br label %146

; <label>:146                                     ; preds = %274, %116
  %v.0 = phi i32 [ %145, %116 ], [ %275, %274 ]
  %147 = sext i32 %block8x8 to i64
  %148 = sext i32 %10 to i64
  %149 = getelementptr inbounds [5 x [4 x i32]]* @PartitionMotionSearch.by0, i32 0, i64 %148
  %150 = getelementptr inbounds [4 x i32]* %149, i32 0, i64 %147
  %151 = load i32* %150, align 4
  %152 = add nsw i32 %151, %22
  %153 = icmp slt i32 %v.0, %152
  br i1 %153, label %154, label %276

; <label>:154                                     ; preds = %146
  %155 = load %struct.ImageParameters** @img, align 8
  %156 = getelementptr inbounds %struct.ImageParameters* %155, i32 0, i32 32
  %157 = load i32* %156, align 4
  %158 = add nsw i32 %157, %v.0
  %159 = sext i32 %block8x8 to i64
  %160 = sext i32 %10 to i64
  %161 = getelementptr inbounds [5 x [4 x i32]]* @PartitionMotionSearch.bx0, i32 0, i64 %160
  %162 = getelementptr inbounds [4 x i32]* %161, i32 0, i64 %159
  %163 = load i32* %162, align 4
  br label %164

; <label>:164                                     ; preds = %271, %154
  %h.0 = phi i32 [ %163, %154 ], [ %272, %271 ]
  %165 = sext i32 %block8x8 to i64
  %166 = sext i32 %10 to i64
  %167 = getelementptr inbounds [5 x [4 x i32]]* @PartitionMotionSearch.bx0, i32 0, i64 %166
  %168 = getelementptr inbounds [4 x i32]* %167, i32 0, i64 %165
  %169 = load i32* %168, align 4
  %170 = add nsw i32 %169, %16
  %171 = icmp slt i32 %h.0, %170
  br i1 %171, label %172, label %273

; <label>:172                                     ; preds = %164
  %173 = load %struct.ImageParameters** @img, align 8
  %174 = getelementptr inbounds %struct.ImageParameters* %173, i32 0, i32 31
  %175 = load i32* %174, align 4
  %176 = add nsw i32 %175, %h.0
  %177 = shl i32 %h.0, 2
  %178 = shl i32 %v.0, 2
  %179 = call i32 @BlockMotionSearch(i16 signext %ref.0, i32 %list.0, i32 %177, i32 %178, i32 %blocktype, i32 %search_range.1, double %lambda)
  %180 = sext i32 %block8x8 to i64
  %181 = sext i16 %ref.0 to i64
  %182 = sext i32 %list.0 to i64
  %183 = sext i32 %blocktype to i64
  %184 = load i32***** @motion_cost, align 8
  %185 = getelementptr inbounds i32**** %184, i64 %183
  %186 = load i32**** %185, align 8
  %187 = getelementptr inbounds i32*** %186, i64 %182
  %188 = load i32*** %187, align 8
  %189 = getelementptr inbounds i32** %188, i64 %181
  %190 = load i32** %189, align 8
  %191 = getelementptr inbounds i32* %190, i64 %180
  %192 = load i32* %191, align 4
  %193 = add nsw i32 %192, %179
  store i32 %193, i32* %191, align 4
  br label %194

; <label>:194                                     ; preds = %268, %172
  %j.0 = phi i32 [ 0, %172 ], [ %269, %268 ]
  %195 = icmp slt i32 %j.0, %34
  br i1 %195, label %196, label %270

; <label>:196                                     ; preds = %194
  br label %197

; <label>:197                                     ; preds = %265, %196
  %i.0 = phi i32 [ 0, %196 ], [ %266, %265 ]
  %198 = icmp slt i32 %i.0, %28
  br i1 %198, label %199, label %267

; <label>:199                                     ; preds = %197
  %200 = sext i32 %blocktype to i64
  %201 = sext i16 %ref.0 to i64
  %202 = sext i32 %list.0 to i64
  %203 = sext i32 %v.0 to i64
  %204 = sext i32 %h.0 to i64
  %205 = load %struct.ImageParameters** @img, align 8
  %206 = getelementptr inbounds %struct.ImageParameters* %205, i32 0, i32 71
  %207 = load i16******* %206, align 8
  %208 = getelementptr inbounds i16****** %207, i64 %204
  %209 = load i16****** %208, align 8
  %210 = getelementptr inbounds i16***** %209, i64 %203
  %211 = load i16***** %210, align 8
  %212 = getelementptr inbounds i16**** %211, i64 %202
  %213 = load i16**** %212, align 8
  %214 = getelementptr inbounds i16*** %213, i64 %201
  %215 = load i16*** %214, align 8
  %216 = getelementptr inbounds i16** %215, i64 %200
  %217 = load i16** %216, align 8
  %218 = getelementptr inbounds i16* %217, i64 0
  %219 = load i16* %218, align 2
  %220 = add nsw i32 %158, %j.0
  %221 = sext i32 %220 to i64
  %222 = add nsw i32 %176, %i.0
  %223 = sext i32 %222 to i64
  %224 = getelementptr inbounds i16*** %128, i64 %223
  %225 = load i16*** %224, align 8
  %226 = getelementptr inbounds i16** %225, i64 %221
  %227 = load i16** %226, align 8
  %228 = getelementptr inbounds i16* %227, i64 0
  store i16 %219, i16* %228, align 2
  %229 = sext i32 %blocktype to i64
  %230 = sext i16 %ref.0 to i64
  %231 = sext i32 %list.0 to i64
  %232 = sext i32 %v.0 to i64
  %233 = sext i32 %h.0 to i64
  %234 = load %struct.ImageParameters** @img, align 8
  %235 = getelementptr inbounds %struct.ImageParameters* %234, i32 0, i32 71
  %236 = load i16******* %235, align 8
  %237 = getelementptr inbounds i16****** %236, i64 %233
  %238 = load i16****** %237, align 8
  %239 = getelementptr inbounds i16***** %238, i64 %232
  %240 = load i16***** %239, align 8
  %241 = getelementptr inbounds i16**** %240, i64 %231
  %242 = load i16**** %241, align 8
  %243 = getelementptr inbounds i16*** %242, i64 %230
  %244 = load i16*** %243, align 8
  %245 = getelementptr inbounds i16** %244, i64 %229
  %246 = load i16** %245, align 8
  %247 = getelementptr inbounds i16* %246, i64 1
  %248 = load i16* %247, align 2
  %249 = add nsw i32 %158, %j.0
  %250 = sext i32 %249 to i64
  %251 = add nsw i32 %176, %i.0
  %252 = sext i32 %251 to i64
  %253 = getelementptr inbounds i16*** %128, i64 %252
  %254 = load i16*** %253, align 8
  %255 = getelementptr inbounds i16** %254, i64 %250
  %256 = load i16** %255, align 8
  %257 = getelementptr inbounds i16* %256, i64 1
  store i16 %248, i16* %257, align 2
  %258 = add nsw i32 %158, %j.0
  %259 = sext i32 %258 to i64
  %260 = add nsw i32 %176, %i.0
  %261 = sext i32 %260 to i64
  %262 = getelementptr inbounds i16** %122, i64 %261
  %263 = load i16** %262, align 8
  %264 = getelementptr inbounds i16* %263, i64 %259
  store i16 %ref.0, i16* %264, align 2
  br label %265

; <label>:265                                     ; preds = %199
  %266 = add nsw i32 %i.0, 1
  br label %197

; <label>:267                                     ; preds = %197
  br label %268

; <label>:268                                     ; preds = %267
  %269 = add nsw i32 %j.0, 1
  br label %194

; <label>:270                                     ; preds = %194
  br label %271

; <label>:271                                     ; preds = %270
  %272 = add nsw i32 %h.0, %28
  br label %164

; <label>:273                                     ; preds = %164
  br label %274

; <label>:274                                     ; preds = %273
  %275 = add nsw i32 %v.0, %34
  br label %146

; <label>:276                                     ; preds = %146
  br label %277

; <label>:277                                     ; preds = %276
  %278 = add i16 %ref.0, 1
  br label %62

; <label>:279                                     ; preds = %62
  br label %280

; <label>:280                                     ; preds = %279
  %281 = add nsw i32 %list.0, 1
  br label %59

; <label>:282                                     ; preds = %59
  ret void
}

; Function Attrs: nounwind uwtable
define void @Get_Direct_Motion_Vectors() #0 {
  %pmvfw = alloca [2 x i16], align 2
  %pmvbw = alloca [2 x i16], align 2
  %mb_left = alloca %struct.pix_pos, align 4
  %mb_up = alloca %struct.pix_pos, align 4
  %mb_upleft = alloca %struct.pix_pos, align 4
  %mb_upright = alloca %struct.pix_pos, align 4
  %1 = load %struct.ImageParameters** @img, align 8
  %2 = getelementptr inbounds %struct.ImageParameters* %1, i32 0, i32 71
  %3 = load i16******* %2, align 8
  %4 = load %struct.ImageParameters** @img, align 8
  %5 = getelementptr inbounds %struct.ImageParameters* %4, i32 0, i32 3
  %6 = load i32* %5, align 4
  %7 = sext i32 %6 to i64
  %8 = load %struct.ImageParameters** @img, align 8
  %9 = getelementptr inbounds %struct.ImageParameters* %8, i32 0, i32 51
  %10 = load %struct.macroblock** %9, align 8
  %11 = getelementptr inbounds %struct.macroblock* %10, i64 %7
  %12 = load %struct.ImageParameters** @img, align 8
  %13 = getelementptr inbounds %struct.ImageParameters* %12, i32 0, i32 90
  %14 = load i32* %13, align 4
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %16, label %53

; <label>:16                                      ; preds = %0
  %17 = getelementptr inbounds %struct.macroblock* %11, i32 0, i32 22
  %18 = load i32* %17, align 4
  %19 = icmp ne i32 %18, 0
  br i1 %19, label %20, label %53

; <label>:20                                      ; preds = %16
  %21 = load %struct.ImageParameters** @img, align 8
  %22 = getelementptr inbounds %struct.ImageParameters* %21, i32 0, i32 3
  %23 = load i32* %22, align 4
  %24 = srem i32 %23, 2
  %25 = icmp ne i32 %24, 0
  br i1 %25, label %26, label %39

; <label>:26                                      ; preds = %20
  %27 = load %struct.colocated_params** @Co_located, align 8
  %28 = getelementptr inbounds %struct.colocated_params* %27, i32 0, i32 17
  %29 = load i8*** %28, align 8
  %30 = load %struct.colocated_params** @Co_located, align 8
  %31 = getelementptr inbounds %struct.colocated_params* %30, i32 0, i32 16
  %32 = load i16***** %31, align 8
  %33 = load %struct.colocated_params** @Co_located, align 8
  %34 = getelementptr inbounds %struct.colocated_params* %33, i32 0, i32 14
  %35 = load i16**** %34, align 8
  %36 = load %struct.colocated_params** @Co_located, align 8
  %37 = getelementptr inbounds %struct.colocated_params* %36, i32 0, i32 15
  %38 = load i64**** %37, align 8
  br label %52

; <label>:39                                      ; preds = %20
  %40 = load %struct.colocated_params** @Co_located, align 8
  %41 = getelementptr inbounds %struct.colocated_params* %40, i32 0, i32 12
  %42 = load i8*** %41, align 8
  %43 = load %struct.colocated_params** @Co_located, align 8
  %44 = getelementptr inbounds %struct.colocated_params* %43, i32 0, i32 11
  %45 = load i16***** %44, align 8
  %46 = load %struct.colocated_params** @Co_located, align 8
  %47 = getelementptr inbounds %struct.colocated_params* %46, i32 0, i32 9
  %48 = load i16**** %47, align 8
  %49 = load %struct.colocated_params** @Co_located, align 8
  %50 = getelementptr inbounds %struct.colocated_params* %49, i32 0, i32 10
  %51 = load i64**** %50, align 8
  br label %52

; <label>:52                                      ; preds = %39, %26
  %co_located_ref_id.0 = phi i64*** [ %38, %26 ], [ %51, %39 ]
  %co_located_ref_idx.0 = phi i16*** [ %35, %26 ], [ %48, %39 ]
  %co_located_mv.0 = phi i16**** [ %32, %26 ], [ %45, %39 ]
  %moving_block.0 = phi i8** [ %29, %26 ], [ %42, %39 ]
  br label %66

; <label>:53                                      ; preds = %16, %0
  %54 = load %struct.colocated_params** @Co_located, align 8
  %55 = getelementptr inbounds %struct.colocated_params* %54, i32 0, i32 7
  %56 = load i8*** %55, align 8
  %57 = load %struct.colocated_params** @Co_located, align 8
  %58 = getelementptr inbounds %struct.colocated_params* %57, i32 0, i32 6
  %59 = load i16***** %58, align 8
  %60 = load %struct.colocated_params** @Co_located, align 8
  %61 = getelementptr inbounds %struct.colocated_params* %60, i32 0, i32 4
  %62 = load i16**** %61, align 8
  %63 = load %struct.colocated_params** @Co_located, align 8
  %64 = getelementptr inbounds %struct.colocated_params* %63, i32 0, i32 5
  %65 = load i64**** %64, align 8
  br label %66

; <label>:66                                      ; preds = %53, %52
  %co_located_ref_id.1 = phi i64*** [ %co_located_ref_id.0, %52 ], [ %65, %53 ]
  %co_located_ref_idx.1 = phi i16*** [ %co_located_ref_idx.0, %52 ], [ %62, %53 ]
  %co_located_mv.1 = phi i16**** [ %co_located_mv.0, %52 ], [ %59, %53 ]
  %moving_block.1 = phi i8** [ %moving_block.0, %52 ], [ %56, %53 ]
  %67 = load %struct.ImageParameters** @img, align 8
  %68 = getelementptr inbounds %struct.ImageParameters* %67, i32 0, i32 78
  %69 = load i32* %68, align 4
  %70 = icmp ne i32 %69, 0
  br i1 %70, label %71, label %1951

; <label>:71                                      ; preds = %66
  %72 = bitcast [2 x i16]* %pmvfw to i8*
  call void @llvm.memset.p0i8.i64(i8* %72, i8 0, i64 4, i32 2, i1 false)
  %73 = bitcast [2 x i16]* %pmvbw to i8*
  call void @llvm.memset.p0i8.i64(i8* %73, i8 0, i64 4, i32 2, i1 false)
  %74 = load %struct.ImageParameters** @img, align 8
  %75 = getelementptr inbounds %struct.ImageParameters* %74, i32 0, i32 3
  %76 = load i32* %75, align 4
  call void @getLuma4x4Neighbour(i32 %76, i32 0, i32 0, i32 -1, i32 0, %struct.pix_pos* %mb_left)
  %77 = load %struct.ImageParameters** @img, align 8
  %78 = getelementptr inbounds %struct.ImageParameters* %77, i32 0, i32 3
  %79 = load i32* %78, align 4
  call void @getLuma4x4Neighbour(i32 %79, i32 0, i32 0, i32 0, i32 -1, %struct.pix_pos* %mb_up)
  %80 = load %struct.ImageParameters** @img, align 8
  %81 = getelementptr inbounds %struct.ImageParameters* %80, i32 0, i32 3
  %82 = load i32* %81, align 4
  call void @getLuma4x4Neighbour(i32 %82, i32 0, i32 0, i32 16, i32 -1, %struct.pix_pos* %mb_upright)
  %83 = load %struct.ImageParameters** @img, align 8
  %84 = getelementptr inbounds %struct.ImageParameters* %83, i32 0, i32 3
  %85 = load i32* %84, align 4
  call void @getLuma4x4Neighbour(i32 %85, i32 0, i32 0, i32 -1, i32 -1, %struct.pix_pos* %mb_upleft)
  %86 = load %struct.ImageParameters** @img, align 8
  %87 = getelementptr inbounds %struct.ImageParameters* %86, i32 0, i32 90
  %88 = load i32* %87, align 4
  %89 = icmp ne i32 %88, 0
  br i1 %89, label %285, label %90

; <label>:90                                      ; preds = %71
  %91 = getelementptr inbounds %struct.pix_pos* %mb_left, i32 0, i32 0
  %92 = load i32* %91, align 4
  %93 = icmp ne i32 %92, 0
  br i1 %93, label %94, label %111

; <label>:94                                      ; preds = %90
  %95 = getelementptr inbounds %struct.pix_pos* %mb_left, i32 0, i32 5
  %96 = load i32* %95, align 4
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds %struct.pix_pos* %mb_left, i32 0, i32 4
  %99 = load i32* %98, align 4
  %100 = sext i32 %99 to i64
  %101 = load %struct.storable_picture** @enc_picture, align 8
  %102 = getelementptr inbounds %struct.storable_picture* %101, i32 0, i32 32
  %103 = load i16**** %102, align 8
  %104 = getelementptr inbounds i16*** %103, i64 0
  %105 = load i16*** %104, align 8
  %106 = getelementptr inbounds i16** %105, i64 %100
  %107 = load i16** %106, align 8
  %108 = getelementptr inbounds i16* %107, i64 %97
  %109 = load i16* %108, align 2
  %110 = sext i16 %109 to i32
  br label %112

; <label>:111                                     ; preds = %90
  br label %112

; <label>:112                                     ; preds = %111, %94
  %113 = phi i32 [ %110, %94 ], [ -1, %111 ]
  %114 = trunc i32 %113 to i16
  %115 = getelementptr inbounds %struct.pix_pos* %mb_up, i32 0, i32 0
  %116 = load i32* %115, align 4
  %117 = icmp ne i32 %116, 0
  br i1 %117, label %118, label %135

; <label>:118                                     ; preds = %112
  %119 = getelementptr inbounds %struct.pix_pos* %mb_up, i32 0, i32 5
  %120 = load i32* %119, align 4
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds %struct.pix_pos* %mb_up, i32 0, i32 4
  %123 = load i32* %122, align 4
  %124 = sext i32 %123 to i64
  %125 = load %struct.storable_picture** @enc_picture, align 8
  %126 = getelementptr inbounds %struct.storable_picture* %125, i32 0, i32 32
  %127 = load i16**** %126, align 8
  %128 = getelementptr inbounds i16*** %127, i64 0
  %129 = load i16*** %128, align 8
  %130 = getelementptr inbounds i16** %129, i64 %124
  %131 = load i16** %130, align 8
  %132 = getelementptr inbounds i16* %131, i64 %121
  %133 = load i16* %132, align 2
  %134 = sext i16 %133 to i32
  br label %136

; <label>:135                                     ; preds = %112
  br label %136

; <label>:136                                     ; preds = %135, %118
  %137 = phi i32 [ %134, %118 ], [ -1, %135 ]
  %138 = trunc i32 %137 to i16
  %139 = getelementptr inbounds %struct.pix_pos* %mb_upleft, i32 0, i32 0
  %140 = load i32* %139, align 4
  %141 = icmp ne i32 %140, 0
  br i1 %141, label %142, label %159

; <label>:142                                     ; preds = %136
  %143 = getelementptr inbounds %struct.pix_pos* %mb_upleft, i32 0, i32 5
  %144 = load i32* %143, align 4
  %145 = sext i32 %144 to i64
  %146 = getelementptr inbounds %struct.pix_pos* %mb_upleft, i32 0, i32 4
  %147 = load i32* %146, align 4
  %148 = sext i32 %147 to i64
  %149 = load %struct.storable_picture** @enc_picture, align 8
  %150 = getelementptr inbounds %struct.storable_picture* %149, i32 0, i32 32
  %151 = load i16**** %150, align 8
  %152 = getelementptr inbounds i16*** %151, i64 0
  %153 = load i16*** %152, align 8
  %154 = getelementptr inbounds i16** %153, i64 %148
  %155 = load i16** %154, align 8
  %156 = getelementptr inbounds i16* %155, i64 %145
  %157 = load i16* %156, align 2
  %158 = sext i16 %157 to i32
  br label %160

; <label>:159                                     ; preds = %136
  br label %160

; <label>:160                                     ; preds = %159, %142
  %161 = phi i32 [ %158, %142 ], [ -1, %159 ]
  %162 = trunc i32 %161 to i16
  %163 = getelementptr inbounds %struct.pix_pos* %mb_upright, i32 0, i32 0
  %164 = load i32* %163, align 4
  %165 = icmp ne i32 %164, 0
  br i1 %165, label %166, label %183

; <label>:166                                     ; preds = %160
  %167 = getelementptr inbounds %struct.pix_pos* %mb_upright, i32 0, i32 5
  %168 = load i32* %167, align 4
  %169 = sext i32 %168 to i64
  %170 = getelementptr inbounds %struct.pix_pos* %mb_upright, i32 0, i32 4
  %171 = load i32* %170, align 4
  %172 = sext i32 %171 to i64
  %173 = load %struct.storable_picture** @enc_picture, align 8
  %174 = getelementptr inbounds %struct.storable_picture* %173, i32 0, i32 32
  %175 = load i16**** %174, align 8
  %176 = getelementptr inbounds i16*** %175, i64 0
  %177 = load i16*** %176, align 8
  %178 = getelementptr inbounds i16** %177, i64 %172
  %179 = load i16** %178, align 8
  %180 = getelementptr inbounds i16* %179, i64 %169
  %181 = load i16* %180, align 2
  %182 = sext i16 %181 to i32
  br label %185

; <label>:183                                     ; preds = %160
  %184 = sext i16 %162 to i32
  br label %185

; <label>:185                                     ; preds = %183, %166
  %186 = phi i32 [ %182, %166 ], [ %184, %183 ]
  %187 = trunc i32 %186 to i16
  %188 = getelementptr inbounds %struct.pix_pos* %mb_left, i32 0, i32 0
  %189 = load i32* %188, align 4
  %190 = icmp ne i32 %189, 0
  br i1 %190, label %191, label %208

; <label>:191                                     ; preds = %185
  %192 = getelementptr inbounds %struct.pix_pos* %mb_left, i32 0, i32 5
  %193 = load i32* %192, align 4
  %194 = sext i32 %193 to i64
  %195 = getelementptr inbounds %struct.pix_pos* %mb_left, i32 0, i32 4
  %196 = load i32* %195, align 4
  %197 = sext i32 %196 to i64
  %198 = load %struct.storable_picture** @enc_picture, align 8
  %199 = getelementptr inbounds %struct.storable_picture* %198, i32 0, i32 32
  %200 = load i16**** %199, align 8
  %201 = getelementptr inbounds i16*** %200, i64 1
  %202 = load i16*** %201, align 8
  %203 = getelementptr inbounds i16** %202, i64 %197
  %204 = load i16** %203, align 8
  %205 = getelementptr inbounds i16* %204, i64 %194
  %206 = load i16* %205, align 2
  %207 = sext i16 %206 to i32
  br label %209

; <label>:208                                     ; preds = %185
  br label %209

; <label>:209                                     ; preds = %208, %191
  %210 = phi i32 [ %207, %191 ], [ -1, %208 ]
  %211 = trunc i32 %210 to i16
  %212 = getelementptr inbounds %struct.pix_pos* %mb_up, i32 0, i32 0
  %213 = load i32* %212, align 4
  %214 = icmp ne i32 %213, 0
  br i1 %214, label %215, label %232

; <label>:215                                     ; preds = %209
  %216 = getelementptr inbounds %struct.pix_pos* %mb_up, i32 0, i32 5
  %217 = load i32* %216, align 4
  %218 = sext i32 %217 to i64
  %219 = getelementptr inbounds %struct.pix_pos* %mb_up, i32 0, i32 4
  %220 = load i32* %219, align 4
  %221 = sext i32 %220 to i64
  %222 = load %struct.storable_picture** @enc_picture, align 8
  %223 = getelementptr inbounds %struct.storable_picture* %222, i32 0, i32 32
  %224 = load i16**** %223, align 8
  %225 = getelementptr inbounds i16*** %224, i64 1
  %226 = load i16*** %225, align 8
  %227 = getelementptr inbounds i16** %226, i64 %221
  %228 = load i16** %227, align 8
  %229 = getelementptr inbounds i16* %228, i64 %218
  %230 = load i16* %229, align 2
  %231 = sext i16 %230 to i32
  br label %233

; <label>:232                                     ; preds = %209
  br label %233

; <label>:233                                     ; preds = %232, %215
  %234 = phi i32 [ %231, %215 ], [ -1, %232 ]
  %235 = trunc i32 %234 to i16
  %236 = getelementptr inbounds %struct.pix_pos* %mb_upleft, i32 0, i32 0
  %237 = load i32* %236, align 4
  %238 = icmp ne i32 %237, 0
  br i1 %238, label %239, label %256

; <label>:239                                     ; preds = %233
  %240 = getelementptr inbounds %struct.pix_pos* %mb_upleft, i32 0, i32 5
  %241 = load i32* %240, align 4
  %242 = sext i32 %241 to i64
  %243 = getelementptr inbounds %struct.pix_pos* %mb_upleft, i32 0, i32 4
  %244 = load i32* %243, align 4
  %245 = sext i32 %244 to i64
  %246 = load %struct.storable_picture** @enc_picture, align 8
  %247 = getelementptr inbounds %struct.storable_picture* %246, i32 0, i32 32
  %248 = load i16**** %247, align 8
  %249 = getelementptr inbounds i16*** %248, i64 1
  %250 = load i16*** %249, align 8
  %251 = getelementptr inbounds i16** %250, i64 %245
  %252 = load i16** %251, align 8
  %253 = getelementptr inbounds i16* %252, i64 %242
  %254 = load i16* %253, align 2
  %255 = sext i16 %254 to i32
  br label %257

; <label>:256                                     ; preds = %233
  br label %257

; <label>:257                                     ; preds = %256, %239
  %258 = phi i32 [ %255, %239 ], [ -1, %256 ]
  %259 = trunc i32 %258 to i16
  %260 = getelementptr inbounds %struct.pix_pos* %mb_upright, i32 0, i32 0
  %261 = load i32* %260, align 4
  %262 = icmp ne i32 %261, 0
  br i1 %262, label %263, label %280

; <label>:263                                     ; preds = %257
  %264 = getelementptr inbounds %struct.pix_pos* %mb_upright, i32 0, i32 5
  %265 = load i32* %264, align 4
  %266 = sext i32 %265 to i64
  %267 = getelementptr inbounds %struct.pix_pos* %mb_upright, i32 0, i32 4
  %268 = load i32* %267, align 4
  %269 = sext i32 %268 to i64
  %270 = load %struct.storable_picture** @enc_picture, align 8
  %271 = getelementptr inbounds %struct.storable_picture* %270, i32 0, i32 32
  %272 = load i16**** %271, align 8
  %273 = getelementptr inbounds i16*** %272, i64 1
  %274 = load i16*** %273, align 8
  %275 = getelementptr inbounds i16** %274, i64 %269
  %276 = load i16** %275, align 8
  %277 = getelementptr inbounds i16* %276, i64 %266
  %278 = load i16* %277, align 2
  %279 = sext i16 %278 to i32
  br label %282

; <label>:280                                     ; preds = %257
  %281 = sext i16 %259 to i32
  br label %282

; <label>:282                                     ; preds = %280, %263
  %283 = phi i32 [ %279, %263 ], [ %281, %280 ]
  %284 = trunc i32 %283 to i16
  br label %1464

; <label>:285                                     ; preds = %71
  %286 = getelementptr inbounds %struct.macroblock* %11, i32 0, i32 22
  %287 = load i32* %286, align 4
  %288 = icmp ne i32 %287, 0
  br i1 %288, label %289, label %876

; <label>:289                                     ; preds = %285
  %290 = getelementptr inbounds %struct.pix_pos* %mb_left, i32 0, i32 0
  %291 = load i32* %290, align 4
  %292 = icmp ne i32 %291, 0
  br i1 %292, label %293, label %359

; <label>:293                                     ; preds = %289
  %294 = getelementptr inbounds %struct.pix_pos* %mb_left, i32 0, i32 1
  %295 = load i32* %294, align 4
  %296 = sext i32 %295 to i64
  %297 = load %struct.ImageParameters** @img, align 8
  %298 = getelementptr inbounds %struct.ImageParameters* %297, i32 0, i32 51
  %299 = load %struct.macroblock** %298, align 8
  %300 = getelementptr inbounds %struct.macroblock* %299, i64 %296
  %301 = getelementptr inbounds %struct.macroblock* %300, i32 0, i32 22
  %302 = load i32* %301, align 4
  %303 = icmp ne i32 %302, 0
  br i1 %303, label %322, label %304

; <label>:304                                     ; preds = %293
  %305 = getelementptr inbounds %struct.pix_pos* %mb_left, i32 0, i32 5
  %306 = load i32* %305, align 4
  %307 = sext i32 %306 to i64
  %308 = getelementptr inbounds %struct.pix_pos* %mb_left, i32 0, i32 4
  %309 = load i32* %308, align 4
  %310 = sext i32 %309 to i64
  %311 = load %struct.storable_picture** @enc_picture, align 8
  %312 = getelementptr inbounds %struct.storable_picture* %311, i32 0, i32 32
  %313 = load i16**** %312, align 8
  %314 = getelementptr inbounds i16*** %313, i64 0
  %315 = load i16*** %314, align 8
  %316 = getelementptr inbounds i16** %315, i64 %310
  %317 = load i16** %316, align 8
  %318 = getelementptr inbounds i16* %317, i64 %307
  %319 = load i16* %318, align 2
  %320 = sext i16 %319 to i32
  %321 = icmp slt i32 %320, 0
  br i1 %321, label %322, label %339

; <label>:322                                     ; preds = %304, %293
  %323 = getelementptr inbounds %struct.pix_pos* %mb_left, i32 0, i32 5
  %324 = load i32* %323, align 4
  %325 = sext i32 %324 to i64
  %326 = getelementptr inbounds %struct.pix_pos* %mb_left, i32 0, i32 4
  %327 = load i32* %326, align 4
  %328 = sext i32 %327 to i64
  %329 = load %struct.storable_picture** @enc_picture, align 8
  %330 = getelementptr inbounds %struct.storable_picture* %329, i32 0, i32 32
  %331 = load i16**** %330, align 8
  %332 = getelementptr inbounds i16*** %331, i64 0
  %333 = load i16*** %332, align 8
  %334 = getelementptr inbounds i16** %333, i64 %328
  %335 = load i16** %334, align 8
  %336 = getelementptr inbounds i16* %335, i64 %325
  %337 = load i16* %336, align 2
  %338 = sext i16 %337 to i32
  br label %357

; <label>:339                                     ; preds = %304
  %340 = getelementptr inbounds %struct.pix_pos* %mb_left, i32 0, i32 5
  %341 = load i32* %340, align 4
  %342 = sext i32 %341 to i64
  %343 = getelementptr inbounds %struct.pix_pos* %mb_left, i32 0, i32 4
  %344 = load i32* %343, align 4
  %345 = sext i32 %344 to i64
  %346 = load %struct.storable_picture** @enc_picture, align 8
  %347 = getelementptr inbounds %struct.storable_picture* %346, i32 0, i32 32
  %348 = load i16**** %347, align 8
  %349 = getelementptr inbounds i16*** %348, i64 0
  %350 = load i16*** %349, align 8
  %351 = getelementptr inbounds i16** %350, i64 %345
  %352 = load i16** %351, align 8
  %353 = getelementptr inbounds i16* %352, i64 %342
  %354 = load i16* %353, align 2
  %355 = sext i16 %354 to i32
  %356 = mul nsw i32 %355, 2
  br label %357

; <label>:357                                     ; preds = %339, %322
  %358 = phi i32 [ %338, %322 ], [ %356, %339 ]
  br label %360

; <label>:359                                     ; preds = %289
  br label %360

; <label>:360                                     ; preds = %359, %357
  %361 = phi i32 [ %358, %357 ], [ -1, %359 ]
  %362 = trunc i32 %361 to i16
  %363 = getelementptr inbounds %struct.pix_pos* %mb_up, i32 0, i32 0
  %364 = load i32* %363, align 4
  %365 = icmp ne i32 %364, 0
  br i1 %365, label %366, label %432

; <label>:366                                     ; preds = %360
  %367 = getelementptr inbounds %struct.pix_pos* %mb_up, i32 0, i32 1
  %368 = load i32* %367, align 4
  %369 = sext i32 %368 to i64
  %370 = load %struct.ImageParameters** @img, align 8
  %371 = getelementptr inbounds %struct.ImageParameters* %370, i32 0, i32 51
  %372 = load %struct.macroblock** %371, align 8
  %373 = getelementptr inbounds %struct.macroblock* %372, i64 %369
  %374 = getelementptr inbounds %struct.macroblock* %373, i32 0, i32 22
  %375 = load i32* %374, align 4
  %376 = icmp ne i32 %375, 0
  br i1 %376, label %395, label %377

; <label>:377                                     ; preds = %366
  %378 = getelementptr inbounds %struct.pix_pos* %mb_up, i32 0, i32 5
  %379 = load i32* %378, align 4
  %380 = sext i32 %379 to i64
  %381 = getelementptr inbounds %struct.pix_pos* %mb_up, i32 0, i32 4
  %382 = load i32* %381, align 4
  %383 = sext i32 %382 to i64
  %384 = load %struct.storable_picture** @enc_picture, align 8
  %385 = getelementptr inbounds %struct.storable_picture* %384, i32 0, i32 32
  %386 = load i16**** %385, align 8
  %387 = getelementptr inbounds i16*** %386, i64 0
  %388 = load i16*** %387, align 8
  %389 = getelementptr inbounds i16** %388, i64 %383
  %390 = load i16** %389, align 8
  %391 = getelementptr inbounds i16* %390, i64 %380
  %392 = load i16* %391, align 2
  %393 = sext i16 %392 to i32
  %394 = icmp slt i32 %393, 0
  br i1 %394, label %395, label %412

; <label>:395                                     ; preds = %377, %366
  %396 = getelementptr inbounds %struct.pix_pos* %mb_up, i32 0, i32 5
  %397 = load i32* %396, align 4
  %398 = sext i32 %397 to i64
  %399 = getelementptr inbounds %struct.pix_pos* %mb_up, i32 0, i32 4
  %400 = load i32* %399, align 4
  %401 = sext i32 %400 to i64
  %402 = load %struct.storable_picture** @enc_picture, align 8
  %403 = getelementptr inbounds %struct.storable_picture* %402, i32 0, i32 32
  %404 = load i16**** %403, align 8
  %405 = getelementptr inbounds i16*** %404, i64 0
  %406 = load i16*** %405, align 8
  %407 = getelementptr inbounds i16** %406, i64 %401
  %408 = load i16** %407, align 8
  %409 = getelementptr inbounds i16* %408, i64 %398
  %410 = load i16* %409, align 2
  %411 = sext i16 %410 to i32
  br label %430

; <label>:412                                     ; preds = %377
  %413 = getelementptr inbounds %struct.pix_pos* %mb_up, i32 0, i32 5
  %414 = load i32* %413, align 4
  %415 = sext i32 %414 to i64
  %416 = getelementptr inbounds %struct.pix_pos* %mb_up, i32 0, i32 4
  %417 = load i32* %416, align 4
  %418 = sext i32 %417 to i64
  %419 = load %struct.storable_picture** @enc_picture, align 8
  %420 = getelementptr inbounds %struct.storable_picture* %419, i32 0, i32 32
  %421 = load i16**** %420, align 8
  %422 = getelementptr inbounds i16*** %421, i64 0
  %423 = load i16*** %422, align 8
  %424 = getelementptr inbounds i16** %423, i64 %418
  %425 = load i16** %424, align 8
  %426 = getelementptr inbounds i16* %425, i64 %415
  %427 = load i16* %426, align 2
  %428 = sext i16 %427 to i32
  %429 = mul nsw i32 %428, 2
  br label %430

; <label>:430                                     ; preds = %412, %395
  %431 = phi i32 [ %411, %395 ], [ %429, %412 ]
  br label %433

; <label>:432                                     ; preds = %360
  br label %433

; <label>:433                                     ; preds = %432, %430
  %434 = phi i32 [ %431, %430 ], [ -1, %432 ]
  %435 = trunc i32 %434 to i16
  %436 = getelementptr inbounds %struct.pix_pos* %mb_upleft, i32 0, i32 0
  %437 = load i32* %436, align 4
  %438 = icmp ne i32 %437, 0
  br i1 %438, label %439, label %505

; <label>:439                                     ; preds = %433
  %440 = getelementptr inbounds %struct.pix_pos* %mb_upleft, i32 0, i32 1
  %441 = load i32* %440, align 4
  %442 = sext i32 %441 to i64
  %443 = load %struct.ImageParameters** @img, align 8
  %444 = getelementptr inbounds %struct.ImageParameters* %443, i32 0, i32 51
  %445 = load %struct.macroblock** %444, align 8
  %446 = getelementptr inbounds %struct.macroblock* %445, i64 %442
  %447 = getelementptr inbounds %struct.macroblock* %446, i32 0, i32 22
  %448 = load i32* %447, align 4
  %449 = icmp ne i32 %448, 0
  br i1 %449, label %468, label %450

; <label>:450                                     ; preds = %439
  %451 = getelementptr inbounds %struct.pix_pos* %mb_upleft, i32 0, i32 5
  %452 = load i32* %451, align 4
  %453 = sext i32 %452 to i64
  %454 = getelementptr inbounds %struct.pix_pos* %mb_upleft, i32 0, i32 4
  %455 = load i32* %454, align 4
  %456 = sext i32 %455 to i64
  %457 = load %struct.storable_picture** @enc_picture, align 8
  %458 = getelementptr inbounds %struct.storable_picture* %457, i32 0, i32 32
  %459 = load i16**** %458, align 8
  %460 = getelementptr inbounds i16*** %459, i64 0
  %461 = load i16*** %460, align 8
  %462 = getelementptr inbounds i16** %461, i64 %456
  %463 = load i16** %462, align 8
  %464 = getelementptr inbounds i16* %463, i64 %453
  %465 = load i16* %464, align 2
  %466 = sext i16 %465 to i32
  %467 = icmp slt i32 %466, 0
  br i1 %467, label %468, label %485

; <label>:468                                     ; preds = %450, %439
  %469 = getelementptr inbounds %struct.pix_pos* %mb_upleft, i32 0, i32 5
  %470 = load i32* %469, align 4
  %471 = sext i32 %470 to i64
  %472 = getelementptr inbounds %struct.pix_pos* %mb_upleft, i32 0, i32 4
  %473 = load i32* %472, align 4
  %474 = sext i32 %473 to i64
  %475 = load %struct.storable_picture** @enc_picture, align 8
  %476 = getelementptr inbounds %struct.storable_picture* %475, i32 0, i32 32
  %477 = load i16**** %476, align 8
  %478 = getelementptr inbounds i16*** %477, i64 0
  %479 = load i16*** %478, align 8
  %480 = getelementptr inbounds i16** %479, i64 %474
  %481 = load i16** %480, align 8
  %482 = getelementptr inbounds i16* %481, i64 %471
  %483 = load i16* %482, align 2
  %484 = sext i16 %483 to i32
  br label %503

; <label>:485                                     ; preds = %450
  %486 = getelementptr inbounds %struct.pix_pos* %mb_upleft, i32 0, i32 5
  %487 = load i32* %486, align 4
  %488 = sext i32 %487 to i64
  %489 = getelementptr inbounds %struct.pix_pos* %mb_upleft, i32 0, i32 4
  %490 = load i32* %489, align 4
  %491 = sext i32 %490 to i64
  %492 = load %struct.storable_picture** @enc_picture, align 8
  %493 = getelementptr inbounds %struct.storable_picture* %492, i32 0, i32 32
  %494 = load i16**** %493, align 8
  %495 = getelementptr inbounds i16*** %494, i64 0
  %496 = load i16*** %495, align 8
  %497 = getelementptr inbounds i16** %496, i64 %491
  %498 = load i16** %497, align 8
  %499 = getelementptr inbounds i16* %498, i64 %488
  %500 = load i16* %499, align 2
  %501 = sext i16 %500 to i32
  %502 = mul nsw i32 %501, 2
  br label %503

; <label>:503                                     ; preds = %485, %468
  %504 = phi i32 [ %484, %468 ], [ %502, %485 ]
  br label %506

; <label>:505                                     ; preds = %433
  br label %506

; <label>:506                                     ; preds = %505, %503
  %507 = phi i32 [ %504, %503 ], [ -1, %505 ]
  %508 = trunc i32 %507 to i16
  %509 = getelementptr inbounds %struct.pix_pos* %mb_upright, i32 0, i32 0
  %510 = load i32* %509, align 4
  %511 = icmp ne i32 %510, 0
  br i1 %511, label %512, label %578

; <label>:512                                     ; preds = %506
  %513 = getelementptr inbounds %struct.pix_pos* %mb_upright, i32 0, i32 1
  %514 = load i32* %513, align 4
  %515 = sext i32 %514 to i64
  %516 = load %struct.ImageParameters** @img, align 8
  %517 = getelementptr inbounds %struct.ImageParameters* %516, i32 0, i32 51
  %518 = load %struct.macroblock** %517, align 8
  %519 = getelementptr inbounds %struct.macroblock* %518, i64 %515
  %520 = getelementptr inbounds %struct.macroblock* %519, i32 0, i32 22
  %521 = load i32* %520, align 4
  %522 = icmp ne i32 %521, 0
  br i1 %522, label %541, label %523

; <label>:523                                     ; preds = %512
  %524 = getelementptr inbounds %struct.pix_pos* %mb_upright, i32 0, i32 5
  %525 = load i32* %524, align 4
  %526 = sext i32 %525 to i64
  %527 = getelementptr inbounds %struct.pix_pos* %mb_upright, i32 0, i32 4
  %528 = load i32* %527, align 4
  %529 = sext i32 %528 to i64
  %530 = load %struct.storable_picture** @enc_picture, align 8
  %531 = getelementptr inbounds %struct.storable_picture* %530, i32 0, i32 32
  %532 = load i16**** %531, align 8
  %533 = getelementptr inbounds i16*** %532, i64 0
  %534 = load i16*** %533, align 8
  %535 = getelementptr inbounds i16** %534, i64 %529
  %536 = load i16** %535, align 8
  %537 = getelementptr inbounds i16* %536, i64 %526
  %538 = load i16* %537, align 2
  %539 = sext i16 %538 to i32
  %540 = icmp slt i32 %539, 0
  br i1 %540, label %541, label %558

; <label>:541                                     ; preds = %523, %512
  %542 = getelementptr inbounds %struct.pix_pos* %mb_upright, i32 0, i32 5
  %543 = load i32* %542, align 4
  %544 = sext i32 %543 to i64
  %545 = getelementptr inbounds %struct.pix_pos* %mb_upright, i32 0, i32 4
  %546 = load i32* %545, align 4
  %547 = sext i32 %546 to i64
  %548 = load %struct.storable_picture** @enc_picture, align 8
  %549 = getelementptr inbounds %struct.storable_picture* %548, i32 0, i32 32
  %550 = load i16**** %549, align 8
  %551 = getelementptr inbounds i16*** %550, i64 0
  %552 = load i16*** %551, align 8
  %553 = getelementptr inbounds i16** %552, i64 %547
  %554 = load i16** %553, align 8
  %555 = getelementptr inbounds i16* %554, i64 %544
  %556 = load i16* %555, align 2
  %557 = sext i16 %556 to i32
  br label %576

; <label>:558                                     ; preds = %523
  %559 = getelementptr inbounds %struct.pix_pos* %mb_upright, i32 0, i32 5
  %560 = load i32* %559, align 4
  %561 = sext i32 %560 to i64
  %562 = getelementptr inbounds %struct.pix_pos* %mb_upright, i32 0, i32 4
  %563 = load i32* %562, align 4
  %564 = sext i32 %563 to i64
  %565 = load %struct.storable_picture** @enc_picture, align 8
  %566 = getelementptr inbounds %struct.storable_picture* %565, i32 0, i32 32
  %567 = load i16**** %566, align 8
  %568 = getelementptr inbounds i16*** %567, i64 0
  %569 = load i16*** %568, align 8
  %570 = getelementptr inbounds i16** %569, i64 %564
  %571 = load i16** %570, align 8
  %572 = getelementptr inbounds i16* %571, i64 %561
  %573 = load i16* %572, align 2
  %574 = sext i16 %573 to i32
  %575 = mul nsw i32 %574, 2
  br label %576

; <label>:576                                     ; preds = %558, %541
  %577 = phi i32 [ %557, %541 ], [ %575, %558 ]
  br label %580

; <label>:578                                     ; preds = %506
  %579 = sext i16 %508 to i32
  br label %580

; <label>:580                                     ; preds = %578, %576
  %581 = phi i32 [ %577, %576 ], [ %579, %578 ]
  %582 = trunc i32 %581 to i16
  %583 = getelementptr inbounds %struct.pix_pos* %mb_left, i32 0, i32 0
  %584 = load i32* %583, align 4
  %585 = icmp ne i32 %584, 0
  br i1 %585, label %586, label %652

; <label>:586                                     ; preds = %580
  %587 = getelementptr inbounds %struct.pix_pos* %mb_left, i32 0, i32 1
  %588 = load i32* %587, align 4
  %589 = sext i32 %588 to i64
  %590 = load %struct.ImageParameters** @img, align 8
  %591 = getelementptr inbounds %struct.ImageParameters* %590, i32 0, i32 51
  %592 = load %struct.macroblock** %591, align 8
  %593 = getelementptr inbounds %struct.macroblock* %592, i64 %589
  %594 = getelementptr inbounds %struct.macroblock* %593, i32 0, i32 22
  %595 = load i32* %594, align 4
  %596 = icmp ne i32 %595, 0
  br i1 %596, label %615, label %597

; <label>:597                                     ; preds = %586
  %598 = getelementptr inbounds %struct.pix_pos* %mb_left, i32 0, i32 5
  %599 = load i32* %598, align 4
  %600 = sext i32 %599 to i64
  %601 = getelementptr inbounds %struct.pix_pos* %mb_left, i32 0, i32 4
  %602 = load i32* %601, align 4
  %603 = sext i32 %602 to i64
  %604 = load %struct.storable_picture** @enc_picture, align 8
  %605 = getelementptr inbounds %struct.storable_picture* %604, i32 0, i32 32
  %606 = load i16**** %605, align 8
  %607 = getelementptr inbounds i16*** %606, i64 1
  %608 = load i16*** %607, align 8
  %609 = getelementptr inbounds i16** %608, i64 %603
  %610 = load i16** %609, align 8
  %611 = getelementptr inbounds i16* %610, i64 %600
  %612 = load i16* %611, align 2
  %613 = sext i16 %612 to i32
  %614 = icmp slt i32 %613, 0
  br i1 %614, label %615, label %632

; <label>:615                                     ; preds = %597, %586
  %616 = getelementptr inbounds %struct.pix_pos* %mb_left, i32 0, i32 5
  %617 = load i32* %616, align 4
  %618 = sext i32 %617 to i64
  %619 = getelementptr inbounds %struct.pix_pos* %mb_left, i32 0, i32 4
  %620 = load i32* %619, align 4
  %621 = sext i32 %620 to i64
  %622 = load %struct.storable_picture** @enc_picture, align 8
  %623 = getelementptr inbounds %struct.storable_picture* %622, i32 0, i32 32
  %624 = load i16**** %623, align 8
  %625 = getelementptr inbounds i16*** %624, i64 1
  %626 = load i16*** %625, align 8
  %627 = getelementptr inbounds i16** %626, i64 %621
  %628 = load i16** %627, align 8
  %629 = getelementptr inbounds i16* %628, i64 %618
  %630 = load i16* %629, align 2
  %631 = sext i16 %630 to i32
  br label %650

; <label>:632                                     ; preds = %597
  %633 = getelementptr inbounds %struct.pix_pos* %mb_left, i32 0, i32 5
  %634 = load i32* %633, align 4
  %635 = sext i32 %634 to i64
  %636 = getelementptr inbounds %struct.pix_pos* %mb_left, i32 0, i32 4
  %637 = load i32* %636, align 4
  %638 = sext i32 %637 to i64
  %639 = load %struct.storable_picture** @enc_picture, align 8
  %640 = getelementptr inbounds %struct.storable_picture* %639, i32 0, i32 32
  %641 = load i16**** %640, align 8
  %642 = getelementptr inbounds i16*** %641, i64 1
  %643 = load i16*** %642, align 8
  %644 = getelementptr inbounds i16** %643, i64 %638
  %645 = load i16** %644, align 8
  %646 = getelementptr inbounds i16* %645, i64 %635
  %647 = load i16* %646, align 2
  %648 = sext i16 %647 to i32
  %649 = mul nsw i32 %648, 2
  br label %650

; <label>:650                                     ; preds = %632, %615
  %651 = phi i32 [ %631, %615 ], [ %649, %632 ]
  br label %653

; <label>:652                                     ; preds = %580
  br label %653

; <label>:653                                     ; preds = %652, %650
  %654 = phi i32 [ %651, %650 ], [ -1, %652 ]
  %655 = trunc i32 %654 to i16
  %656 = getelementptr inbounds %struct.pix_pos* %mb_up, i32 0, i32 0
  %657 = load i32* %656, align 4
  %658 = icmp ne i32 %657, 0
  br i1 %658, label %659, label %725

; <label>:659                                     ; preds = %653
  %660 = getelementptr inbounds %struct.pix_pos* %mb_up, i32 0, i32 1
  %661 = load i32* %660, align 4
  %662 = sext i32 %661 to i64
  %663 = load %struct.ImageParameters** @img, align 8
  %664 = getelementptr inbounds %struct.ImageParameters* %663, i32 0, i32 51
  %665 = load %struct.macroblock** %664, align 8
  %666 = getelementptr inbounds %struct.macroblock* %665, i64 %662
  %667 = getelementptr inbounds %struct.macroblock* %666, i32 0, i32 22
  %668 = load i32* %667, align 4
  %669 = icmp ne i32 %668, 0
  br i1 %669, label %688, label %670

; <label>:670                                     ; preds = %659
  %671 = getelementptr inbounds %struct.pix_pos* %mb_up, i32 0, i32 5
  %672 = load i32* %671, align 4
  %673 = sext i32 %672 to i64
  %674 = getelementptr inbounds %struct.pix_pos* %mb_up, i32 0, i32 4
  %675 = load i32* %674, align 4
  %676 = sext i32 %675 to i64
  %677 = load %struct.storable_picture** @enc_picture, align 8
  %678 = getelementptr inbounds %struct.storable_picture* %677, i32 0, i32 32
  %679 = load i16**** %678, align 8
  %680 = getelementptr inbounds i16*** %679, i64 1
  %681 = load i16*** %680, align 8
  %682 = getelementptr inbounds i16** %681, i64 %676
  %683 = load i16** %682, align 8
  %684 = getelementptr inbounds i16* %683, i64 %673
  %685 = load i16* %684, align 2
  %686 = sext i16 %685 to i32
  %687 = icmp slt i32 %686, 0
  br i1 %687, label %688, label %705

; <label>:688                                     ; preds = %670, %659
  %689 = getelementptr inbounds %struct.pix_pos* %mb_up, i32 0, i32 5
  %690 = load i32* %689, align 4
  %691 = sext i32 %690 to i64
  %692 = getelementptr inbounds %struct.pix_pos* %mb_up, i32 0, i32 4
  %693 = load i32* %692, align 4
  %694 = sext i32 %693 to i64
  %695 = load %struct.storable_picture** @enc_picture, align 8
  %696 = getelementptr inbounds %struct.storable_picture* %695, i32 0, i32 32
  %697 = load i16**** %696, align 8
  %698 = getelementptr inbounds i16*** %697, i64 1
  %699 = load i16*** %698, align 8
  %700 = getelementptr inbounds i16** %699, i64 %694
  %701 = load i16** %700, align 8
  %702 = getelementptr inbounds i16* %701, i64 %691
  %703 = load i16* %702, align 2
  %704 = sext i16 %703 to i32
  br label %723

; <label>:705                                     ; preds = %670
  %706 = getelementptr inbounds %struct.pix_pos* %mb_up, i32 0, i32 5
  %707 = load i32* %706, align 4
  %708 = sext i32 %707 to i64
  %709 = getelementptr inbounds %struct.pix_pos* %mb_up, i32 0, i32 4
  %710 = load i32* %709, align 4
  %711 = sext i32 %710 to i64
  %712 = load %struct.storable_picture** @enc_picture, align 8
  %713 = getelementptr inbounds %struct.storable_picture* %712, i32 0, i32 32
  %714 = load i16**** %713, align 8
  %715 = getelementptr inbounds i16*** %714, i64 1
  %716 = load i16*** %715, align 8
  %717 = getelementptr inbounds i16** %716, i64 %711
  %718 = load i16** %717, align 8
  %719 = getelementptr inbounds i16* %718, i64 %708
  %720 = load i16* %719, align 2
  %721 = sext i16 %720 to i32
  %722 = mul nsw i32 %721, 2
  br label %723

; <label>:723                                     ; preds = %705, %688
  %724 = phi i32 [ %704, %688 ], [ %722, %705 ]
  br label %726

; <label>:725                                     ; preds = %653
  br label %726

; <label>:726                                     ; preds = %725, %723
  %727 = phi i32 [ %724, %723 ], [ -1, %725 ]
  %728 = trunc i32 %727 to i16
  %729 = getelementptr inbounds %struct.pix_pos* %mb_upleft, i32 0, i32 0
  %730 = load i32* %729, align 4
  %731 = icmp ne i32 %730, 0
  br i1 %731, label %732, label %798

; <label>:732                                     ; preds = %726
  %733 = getelementptr inbounds %struct.pix_pos* %mb_upleft, i32 0, i32 1
  %734 = load i32* %733, align 4
  %735 = sext i32 %734 to i64
  %736 = load %struct.ImageParameters** @img, align 8
  %737 = getelementptr inbounds %struct.ImageParameters* %736, i32 0, i32 51
  %738 = load %struct.macroblock** %737, align 8
  %739 = getelementptr inbounds %struct.macroblock* %738, i64 %735
  %740 = getelementptr inbounds %struct.macroblock* %739, i32 0, i32 22
  %741 = load i32* %740, align 4
  %742 = icmp ne i32 %741, 0
  br i1 %742, label %761, label %743

; <label>:743                                     ; preds = %732
  %744 = getelementptr inbounds %struct.pix_pos* %mb_upleft, i32 0, i32 5
  %745 = load i32* %744, align 4
  %746 = sext i32 %745 to i64
  %747 = getelementptr inbounds %struct.pix_pos* %mb_upleft, i32 0, i32 4
  %748 = load i32* %747, align 4
  %749 = sext i32 %748 to i64
  %750 = load %struct.storable_picture** @enc_picture, align 8
  %751 = getelementptr inbounds %struct.storable_picture* %750, i32 0, i32 32
  %752 = load i16**** %751, align 8
  %753 = getelementptr inbounds i16*** %752, i64 1
  %754 = load i16*** %753, align 8
  %755 = getelementptr inbounds i16** %754, i64 %749
  %756 = load i16** %755, align 8
  %757 = getelementptr inbounds i16* %756, i64 %746
  %758 = load i16* %757, align 2
  %759 = sext i16 %758 to i32
  %760 = icmp slt i32 %759, 0
  br i1 %760, label %761, label %778

; <label>:761                                     ; preds = %743, %732
  %762 = getelementptr inbounds %struct.pix_pos* %mb_upleft, i32 0, i32 5
  %763 = load i32* %762, align 4
  %764 = sext i32 %763 to i64
  %765 = getelementptr inbounds %struct.pix_pos* %mb_upleft, i32 0, i32 4
  %766 = load i32* %765, align 4
  %767 = sext i32 %766 to i64
  %768 = load %struct.storable_picture** @enc_picture, align 8
  %769 = getelementptr inbounds %struct.storable_picture* %768, i32 0, i32 32
  %770 = load i16**** %769, align 8
  %771 = getelementptr inbounds i16*** %770, i64 1
  %772 = load i16*** %771, align 8
  %773 = getelementptr inbounds i16** %772, i64 %767
  %774 = load i16** %773, align 8
  %775 = getelementptr inbounds i16* %774, i64 %764
  %776 = load i16* %775, align 2
  %777 = sext i16 %776 to i32
  br label %796

; <label>:778                                     ; preds = %743
  %779 = getelementptr inbounds %struct.pix_pos* %mb_upleft, i32 0, i32 5
  %780 = load i32* %779, align 4
  %781 = sext i32 %780 to i64
  %782 = getelementptr inbounds %struct.pix_pos* %mb_upleft, i32 0, i32 4
  %783 = load i32* %782, align 4
  %784 = sext i32 %783 to i64
  %785 = load %struct.storable_picture** @enc_picture, align 8
  %786 = getelementptr inbounds %struct.storable_picture* %785, i32 0, i32 32
  %787 = load i16**** %786, align 8
  %788 = getelementptr inbounds i16*** %787, i64 1
  %789 = load i16*** %788, align 8
  %790 = getelementptr inbounds i16** %789, i64 %784
  %791 = load i16** %790, align 8
  %792 = getelementptr inbounds i16* %791, i64 %781
  %793 = load i16* %792, align 2
  %794 = sext i16 %793 to i32
  %795 = mul nsw i32 %794, 2
  br label %796

; <label>:796                                     ; preds = %778, %761
  %797 = phi i32 [ %777, %761 ], [ %795, %778 ]
  br label %799

; <label>:798                                     ; preds = %726
  br label %799

; <label>:799                                     ; preds = %798, %796
  %800 = phi i32 [ %797, %796 ], [ -1, %798 ]
  %801 = trunc i32 %800 to i16
  %802 = getelementptr inbounds %struct.pix_pos* %mb_upright, i32 0, i32 0
  %803 = load i32* %802, align 4
  %804 = icmp ne i32 %803, 0
  br i1 %804, label %805, label %871

; <label>:805                                     ; preds = %799
  %806 = getelementptr inbounds %struct.pix_pos* %mb_upright, i32 0, i32 1
  %807 = load i32* %806, align 4
  %808 = sext i32 %807 to i64
  %809 = load %struct.ImageParameters** @img, align 8
  %810 = getelementptr inbounds %struct.ImageParameters* %809, i32 0, i32 51
  %811 = load %struct.macroblock** %810, align 8
  %812 = getelementptr inbounds %struct.macroblock* %811, i64 %808
  %813 = getelementptr inbounds %struct.macroblock* %812, i32 0, i32 22
  %814 = load i32* %813, align 4
  %815 = icmp ne i32 %814, 0
  br i1 %815, label %834, label %816

; <label>:816                                     ; preds = %805
  %817 = getelementptr inbounds %struct.pix_pos* %mb_upright, i32 0, i32 5
  %818 = load i32* %817, align 4
  %819 = sext i32 %818 to i64
  %820 = getelementptr inbounds %struct.pix_pos* %mb_upright, i32 0, i32 4
  %821 = load i32* %820, align 4
  %822 = sext i32 %821 to i64
  %823 = load %struct.storable_picture** @enc_picture, align 8
  %824 = getelementptr inbounds %struct.storable_picture* %823, i32 0, i32 32
  %825 = load i16**** %824, align 8
  %826 = getelementptr inbounds i16*** %825, i64 1
  %827 = load i16*** %826, align 8
  %828 = getelementptr inbounds i16** %827, i64 %822
  %829 = load i16** %828, align 8
  %830 = getelementptr inbounds i16* %829, i64 %819
  %831 = load i16* %830, align 2
  %832 = sext i16 %831 to i32
  %833 = icmp slt i32 %832, 0
  br i1 %833, label %834, label %851

; <label>:834                                     ; preds = %816, %805
  %835 = getelementptr inbounds %struct.pix_pos* %mb_upright, i32 0, i32 5
  %836 = load i32* %835, align 4
  %837 = sext i32 %836 to i64
  %838 = getelementptr inbounds %struct.pix_pos* %mb_upright, i32 0, i32 4
  %839 = load i32* %838, align 4
  %840 = sext i32 %839 to i64
  %841 = load %struct.storable_picture** @enc_picture, align 8
  %842 = getelementptr inbounds %struct.storable_picture* %841, i32 0, i32 32
  %843 = load i16**** %842, align 8
  %844 = getelementptr inbounds i16*** %843, i64 1
  %845 = load i16*** %844, align 8
  %846 = getelementptr inbounds i16** %845, i64 %840
  %847 = load i16** %846, align 8
  %848 = getelementptr inbounds i16* %847, i64 %837
  %849 = load i16* %848, align 2
  %850 = sext i16 %849 to i32
  br label %869

; <label>:851                                     ; preds = %816
  %852 = getelementptr inbounds %struct.pix_pos* %mb_upright, i32 0, i32 5
  %853 = load i32* %852, align 4
  %854 = sext i32 %853 to i64
  %855 = getelementptr inbounds %struct.pix_pos* %mb_upright, i32 0, i32 4
  %856 = load i32* %855, align 4
  %857 = sext i32 %856 to i64
  %858 = load %struct.storable_picture** @enc_picture, align 8
  %859 = getelementptr inbounds %struct.storable_picture* %858, i32 0, i32 32
  %860 = load i16**** %859, align 8
  %861 = getelementptr inbounds i16*** %860, i64 1
  %862 = load i16*** %861, align 8
  %863 = getelementptr inbounds i16** %862, i64 %857
  %864 = load i16** %863, align 8
  %865 = getelementptr inbounds i16* %864, i64 %854
  %866 = load i16* %865, align 2
  %867 = sext i16 %866 to i32
  %868 = mul nsw i32 %867, 2
  br label %869

; <label>:869                                     ; preds = %851, %834
  %870 = phi i32 [ %850, %834 ], [ %868, %851 ]
  br label %873

; <label>:871                                     ; preds = %799
  %872 = sext i16 %801 to i32
  br label %873

; <label>:873                                     ; preds = %871, %869
  %874 = phi i32 [ %870, %869 ], [ %872, %871 ]
  %875 = trunc i32 %874 to i16
  br label %1463

; <label>:876                                     ; preds = %285
  %877 = getelementptr inbounds %struct.pix_pos* %mb_left, i32 0, i32 0
  %878 = load i32* %877, align 4
  %879 = icmp ne i32 %878, 0
  br i1 %879, label %880, label %946

; <label>:880                                     ; preds = %876
  %881 = getelementptr inbounds %struct.pix_pos* %mb_left, i32 0, i32 1
  %882 = load i32* %881, align 4
  %883 = sext i32 %882 to i64
  %884 = load %struct.ImageParameters** @img, align 8
  %885 = getelementptr inbounds %struct.ImageParameters* %884, i32 0, i32 51
  %886 = load %struct.macroblock** %885, align 8
  %887 = getelementptr inbounds %struct.macroblock* %886, i64 %883
  %888 = getelementptr inbounds %struct.macroblock* %887, i32 0, i32 22
  %889 = load i32* %888, align 4
  %890 = icmp ne i32 %889, 0
  br i1 %890, label %909, label %891

; <label>:891                                     ; preds = %880
  %892 = getelementptr inbounds %struct.pix_pos* %mb_left, i32 0, i32 5
  %893 = load i32* %892, align 4
  %894 = sext i32 %893 to i64
  %895 = getelementptr inbounds %struct.pix_pos* %mb_left, i32 0, i32 4
  %896 = load i32* %895, align 4
  %897 = sext i32 %896 to i64
  %898 = load %struct.storable_picture** @enc_picture, align 8
  %899 = getelementptr inbounds %struct.storable_picture* %898, i32 0, i32 32
  %900 = load i16**** %899, align 8
  %901 = getelementptr inbounds i16*** %900, i64 0
  %902 = load i16*** %901, align 8
  %903 = getelementptr inbounds i16** %902, i64 %897
  %904 = load i16** %903, align 8
  %905 = getelementptr inbounds i16* %904, i64 %894
  %906 = load i16* %905, align 2
  %907 = sext i16 %906 to i32
  %908 = icmp slt i32 %907, 0
  br i1 %908, label %909, label %927

; <label>:909                                     ; preds = %891, %880
  %910 = getelementptr inbounds %struct.pix_pos* %mb_left, i32 0, i32 5
  %911 = load i32* %910, align 4
  %912 = sext i32 %911 to i64
  %913 = getelementptr inbounds %struct.pix_pos* %mb_left, i32 0, i32 4
  %914 = load i32* %913, align 4
  %915 = sext i32 %914 to i64
  %916 = load %struct.storable_picture** @enc_picture, align 8
  %917 = getelementptr inbounds %struct.storable_picture* %916, i32 0, i32 32
  %918 = load i16**** %917, align 8
  %919 = getelementptr inbounds i16*** %918, i64 0
  %920 = load i16*** %919, align 8
  %921 = getelementptr inbounds i16** %920, i64 %915
  %922 = load i16** %921, align 8
  %923 = getelementptr inbounds i16* %922, i64 %912
  %924 = load i16* %923, align 2
  %925 = sext i16 %924 to i32
  %926 = ashr i32 %925, 1
  br label %944

; <label>:927                                     ; preds = %891
  %928 = getelementptr inbounds %struct.pix_pos* %mb_left, i32 0, i32 5
  %929 = load i32* %928, align 4
  %930 = sext i32 %929 to i64
  %931 = getelementptr inbounds %struct.pix_pos* %mb_left, i32 0, i32 4
  %932 = load i32* %931, align 4
  %933 = sext i32 %932 to i64
  %934 = load %struct.storable_picture** @enc_picture, align 8
  %935 = getelementptr inbounds %struct.storable_picture* %934, i32 0, i32 32
  %936 = load i16**** %935, align 8
  %937 = getelementptr inbounds i16*** %936, i64 0
  %938 = load i16*** %937, align 8
  %939 = getelementptr inbounds i16** %938, i64 %933
  %940 = load i16** %939, align 8
  %941 = getelementptr inbounds i16* %940, i64 %930
  %942 = load i16* %941, align 2
  %943 = sext i16 %942 to i32
  br label %944

; <label>:944                                     ; preds = %927, %909
  %945 = phi i32 [ %926, %909 ], [ %943, %927 ]
  br label %947

; <label>:946                                     ; preds = %876
  br label %947

; <label>:947                                     ; preds = %946, %944
  %948 = phi i32 [ %945, %944 ], [ -1, %946 ]
  %949 = trunc i32 %948 to i16
  %950 = getelementptr inbounds %struct.pix_pos* %mb_up, i32 0, i32 0
  %951 = load i32* %950, align 4
  %952 = icmp ne i32 %951, 0
  br i1 %952, label %953, label %1019

; <label>:953                                     ; preds = %947
  %954 = getelementptr inbounds %struct.pix_pos* %mb_up, i32 0, i32 1
  %955 = load i32* %954, align 4
  %956 = sext i32 %955 to i64
  %957 = load %struct.ImageParameters** @img, align 8
  %958 = getelementptr inbounds %struct.ImageParameters* %957, i32 0, i32 51
  %959 = load %struct.macroblock** %958, align 8
  %960 = getelementptr inbounds %struct.macroblock* %959, i64 %956
  %961 = getelementptr inbounds %struct.macroblock* %960, i32 0, i32 22
  %962 = load i32* %961, align 4
  %963 = icmp ne i32 %962, 0
  br i1 %963, label %982, label %964

; <label>:964                                     ; preds = %953
  %965 = getelementptr inbounds %struct.pix_pos* %mb_up, i32 0, i32 5
  %966 = load i32* %965, align 4
  %967 = sext i32 %966 to i64
  %968 = getelementptr inbounds %struct.pix_pos* %mb_up, i32 0, i32 4
  %969 = load i32* %968, align 4
  %970 = sext i32 %969 to i64
  %971 = load %struct.storable_picture** @enc_picture, align 8
  %972 = getelementptr inbounds %struct.storable_picture* %971, i32 0, i32 32
  %973 = load i16**** %972, align 8
  %974 = getelementptr inbounds i16*** %973, i64 0
  %975 = load i16*** %974, align 8
  %976 = getelementptr inbounds i16** %975, i64 %970
  %977 = load i16** %976, align 8
  %978 = getelementptr inbounds i16* %977, i64 %967
  %979 = load i16* %978, align 2
  %980 = sext i16 %979 to i32
  %981 = icmp slt i32 %980, 0
  br i1 %981, label %982, label %1000

; <label>:982                                     ; preds = %964, %953
  %983 = getelementptr inbounds %struct.pix_pos* %mb_up, i32 0, i32 5
  %984 = load i32* %983, align 4
  %985 = sext i32 %984 to i64
  %986 = getelementptr inbounds %struct.pix_pos* %mb_up, i32 0, i32 4
  %987 = load i32* %986, align 4
  %988 = sext i32 %987 to i64
  %989 = load %struct.storable_picture** @enc_picture, align 8
  %990 = getelementptr inbounds %struct.storable_picture* %989, i32 0, i32 32
  %991 = load i16**** %990, align 8
  %992 = getelementptr inbounds i16*** %991, i64 0
  %993 = load i16*** %992, align 8
  %994 = getelementptr inbounds i16** %993, i64 %988
  %995 = load i16** %994, align 8
  %996 = getelementptr inbounds i16* %995, i64 %985
  %997 = load i16* %996, align 2
  %998 = sext i16 %997 to i32
  %999 = ashr i32 %998, 1
  br label %1017

; <label>:1000                                    ; preds = %964
  %1001 = getelementptr inbounds %struct.pix_pos* %mb_up, i32 0, i32 5
  %1002 = load i32* %1001, align 4
  %1003 = sext i32 %1002 to i64
  %1004 = getelementptr inbounds %struct.pix_pos* %mb_up, i32 0, i32 4
  %1005 = load i32* %1004, align 4
  %1006 = sext i32 %1005 to i64
  %1007 = load %struct.storable_picture** @enc_picture, align 8
  %1008 = getelementptr inbounds %struct.storable_picture* %1007, i32 0, i32 32
  %1009 = load i16**** %1008, align 8
  %1010 = getelementptr inbounds i16*** %1009, i64 0
  %1011 = load i16*** %1010, align 8
  %1012 = getelementptr inbounds i16** %1011, i64 %1006
  %1013 = load i16** %1012, align 8
  %1014 = getelementptr inbounds i16* %1013, i64 %1003
  %1015 = load i16* %1014, align 2
  %1016 = sext i16 %1015 to i32
  br label %1017

; <label>:1017                                    ; preds = %1000, %982
  %1018 = phi i32 [ %999, %982 ], [ %1016, %1000 ]
  br label %1020

; <label>:1019                                    ; preds = %947
  br label %1020

; <label>:1020                                    ; preds = %1019, %1017
  %1021 = phi i32 [ %1018, %1017 ], [ -1, %1019 ]
  %1022 = trunc i32 %1021 to i16
  %1023 = getelementptr inbounds %struct.pix_pos* %mb_upleft, i32 0, i32 0
  %1024 = load i32* %1023, align 4
  %1025 = icmp ne i32 %1024, 0
  br i1 %1025, label %1026, label %1092

; <label>:1026                                    ; preds = %1020
  %1027 = getelementptr inbounds %struct.pix_pos* %mb_upleft, i32 0, i32 1
  %1028 = load i32* %1027, align 4
  %1029 = sext i32 %1028 to i64
  %1030 = load %struct.ImageParameters** @img, align 8
  %1031 = getelementptr inbounds %struct.ImageParameters* %1030, i32 0, i32 51
  %1032 = load %struct.macroblock** %1031, align 8
  %1033 = getelementptr inbounds %struct.macroblock* %1032, i64 %1029
  %1034 = getelementptr inbounds %struct.macroblock* %1033, i32 0, i32 22
  %1035 = load i32* %1034, align 4
  %1036 = icmp ne i32 %1035, 0
  br i1 %1036, label %1055, label %1037

; <label>:1037                                    ; preds = %1026
  %1038 = getelementptr inbounds %struct.pix_pos* %mb_upleft, i32 0, i32 5
  %1039 = load i32* %1038, align 4
  %1040 = sext i32 %1039 to i64
  %1041 = getelementptr inbounds %struct.pix_pos* %mb_upleft, i32 0, i32 4
  %1042 = load i32* %1041, align 4
  %1043 = sext i32 %1042 to i64
  %1044 = load %struct.storable_picture** @enc_picture, align 8
  %1045 = getelementptr inbounds %struct.storable_picture* %1044, i32 0, i32 32
  %1046 = load i16**** %1045, align 8
  %1047 = getelementptr inbounds i16*** %1046, i64 0
  %1048 = load i16*** %1047, align 8
  %1049 = getelementptr inbounds i16** %1048, i64 %1043
  %1050 = load i16** %1049, align 8
  %1051 = getelementptr inbounds i16* %1050, i64 %1040
  %1052 = load i16* %1051, align 2
  %1053 = sext i16 %1052 to i32
  %1054 = icmp slt i32 %1053, 0
  br i1 %1054, label %1055, label %1073

; <label>:1055                                    ; preds = %1037, %1026
  %1056 = getelementptr inbounds %struct.pix_pos* %mb_upleft, i32 0, i32 5
  %1057 = load i32* %1056, align 4
  %1058 = sext i32 %1057 to i64
  %1059 = getelementptr inbounds %struct.pix_pos* %mb_upleft, i32 0, i32 4
  %1060 = load i32* %1059, align 4
  %1061 = sext i32 %1060 to i64
  %1062 = load %struct.storable_picture** @enc_picture, align 8
  %1063 = getelementptr inbounds %struct.storable_picture* %1062, i32 0, i32 32
  %1064 = load i16**** %1063, align 8
  %1065 = getelementptr inbounds i16*** %1064, i64 0
  %1066 = load i16*** %1065, align 8
  %1067 = getelementptr inbounds i16** %1066, i64 %1061
  %1068 = load i16** %1067, align 8
  %1069 = getelementptr inbounds i16* %1068, i64 %1058
  %1070 = load i16* %1069, align 2
  %1071 = sext i16 %1070 to i32
  %1072 = ashr i32 %1071, 1
  br label %1090

; <label>:1073                                    ; preds = %1037
  %1074 = getelementptr inbounds %struct.pix_pos* %mb_upleft, i32 0, i32 5
  %1075 = load i32* %1074, align 4
  %1076 = sext i32 %1075 to i64
  %1077 = getelementptr inbounds %struct.pix_pos* %mb_upleft, i32 0, i32 4
  %1078 = load i32* %1077, align 4
  %1079 = sext i32 %1078 to i64
  %1080 = load %struct.storable_picture** @enc_picture, align 8
  %1081 = getelementptr inbounds %struct.storable_picture* %1080, i32 0, i32 32
  %1082 = load i16**** %1081, align 8
  %1083 = getelementptr inbounds i16*** %1082, i64 0
  %1084 = load i16*** %1083, align 8
  %1085 = getelementptr inbounds i16** %1084, i64 %1079
  %1086 = load i16** %1085, align 8
  %1087 = getelementptr inbounds i16* %1086, i64 %1076
  %1088 = load i16* %1087, align 2
  %1089 = sext i16 %1088 to i32
  br label %1090

; <label>:1090                                    ; preds = %1073, %1055
  %1091 = phi i32 [ %1072, %1055 ], [ %1089, %1073 ]
  br label %1093

; <label>:1092                                    ; preds = %1020
  br label %1093

; <label>:1093                                    ; preds = %1092, %1090
  %1094 = phi i32 [ %1091, %1090 ], [ -1, %1092 ]
  %1095 = trunc i32 %1094 to i16
  %1096 = getelementptr inbounds %struct.pix_pos* %mb_upright, i32 0, i32 0
  %1097 = load i32* %1096, align 4
  %1098 = icmp ne i32 %1097, 0
  br i1 %1098, label %1099, label %1165

; <label>:1099                                    ; preds = %1093
  %1100 = getelementptr inbounds %struct.pix_pos* %mb_upright, i32 0, i32 1
  %1101 = load i32* %1100, align 4
  %1102 = sext i32 %1101 to i64
  %1103 = load %struct.ImageParameters** @img, align 8
  %1104 = getelementptr inbounds %struct.ImageParameters* %1103, i32 0, i32 51
  %1105 = load %struct.macroblock** %1104, align 8
  %1106 = getelementptr inbounds %struct.macroblock* %1105, i64 %1102
  %1107 = getelementptr inbounds %struct.macroblock* %1106, i32 0, i32 22
  %1108 = load i32* %1107, align 4
  %1109 = icmp ne i32 %1108, 0
  br i1 %1109, label %1128, label %1110

; <label>:1110                                    ; preds = %1099
  %1111 = getelementptr inbounds %struct.pix_pos* %mb_upright, i32 0, i32 5
  %1112 = load i32* %1111, align 4
  %1113 = sext i32 %1112 to i64
  %1114 = getelementptr inbounds %struct.pix_pos* %mb_upright, i32 0, i32 4
  %1115 = load i32* %1114, align 4
  %1116 = sext i32 %1115 to i64
  %1117 = load %struct.storable_picture** @enc_picture, align 8
  %1118 = getelementptr inbounds %struct.storable_picture* %1117, i32 0, i32 32
  %1119 = load i16**** %1118, align 8
  %1120 = getelementptr inbounds i16*** %1119, i64 0
  %1121 = load i16*** %1120, align 8
  %1122 = getelementptr inbounds i16** %1121, i64 %1116
  %1123 = load i16** %1122, align 8
  %1124 = getelementptr inbounds i16* %1123, i64 %1113
  %1125 = load i16* %1124, align 2
  %1126 = sext i16 %1125 to i32
  %1127 = icmp slt i32 %1126, 0
  br i1 %1127, label %1128, label %1146

; <label>:1128                                    ; preds = %1110, %1099
  %1129 = getelementptr inbounds %struct.pix_pos* %mb_upright, i32 0, i32 5
  %1130 = load i32* %1129, align 4
  %1131 = sext i32 %1130 to i64
  %1132 = getelementptr inbounds %struct.pix_pos* %mb_upright, i32 0, i32 4
  %1133 = load i32* %1132, align 4
  %1134 = sext i32 %1133 to i64
  %1135 = load %struct.storable_picture** @enc_picture, align 8
  %1136 = getelementptr inbounds %struct.storable_picture* %1135, i32 0, i32 32
  %1137 = load i16**** %1136, align 8
  %1138 = getelementptr inbounds i16*** %1137, i64 0
  %1139 = load i16*** %1138, align 8
  %1140 = getelementptr inbounds i16** %1139, i64 %1134
  %1141 = load i16** %1140, align 8
  %1142 = getelementptr inbounds i16* %1141, i64 %1131
  %1143 = load i16* %1142, align 2
  %1144 = sext i16 %1143 to i32
  %1145 = ashr i32 %1144, 1
  br label %1163

; <label>:1146                                    ; preds = %1110
  %1147 = getelementptr inbounds %struct.pix_pos* %mb_upright, i32 0, i32 5
  %1148 = load i32* %1147, align 4
  %1149 = sext i32 %1148 to i64
  %1150 = getelementptr inbounds %struct.pix_pos* %mb_upright, i32 0, i32 4
  %1151 = load i32* %1150, align 4
  %1152 = sext i32 %1151 to i64
  %1153 = load %struct.storable_picture** @enc_picture, align 8
  %1154 = getelementptr inbounds %struct.storable_picture* %1153, i32 0, i32 32
  %1155 = load i16**** %1154, align 8
  %1156 = getelementptr inbounds i16*** %1155, i64 0
  %1157 = load i16*** %1156, align 8
  %1158 = getelementptr inbounds i16** %1157, i64 %1152
  %1159 = load i16** %1158, align 8
  %1160 = getelementptr inbounds i16* %1159, i64 %1149
  %1161 = load i16* %1160, align 2
  %1162 = sext i16 %1161 to i32
  br label %1163

; <label>:1163                                    ; preds = %1146, %1128
  %1164 = phi i32 [ %1145, %1128 ], [ %1162, %1146 ]
  br label %1167

; <label>:1165                                    ; preds = %1093
  %1166 = sext i16 %1095 to i32
  br label %1167

; <label>:1167                                    ; preds = %1165, %1163
  %1168 = phi i32 [ %1164, %1163 ], [ %1166, %1165 ]
  %1169 = trunc i32 %1168 to i16
  %1170 = getelementptr inbounds %struct.pix_pos* %mb_left, i32 0, i32 0
  %1171 = load i32* %1170, align 4
  %1172 = icmp ne i32 %1171, 0
  br i1 %1172, label %1173, label %1239

; <label>:1173                                    ; preds = %1167
  %1174 = getelementptr inbounds %struct.pix_pos* %mb_left, i32 0, i32 1
  %1175 = load i32* %1174, align 4
  %1176 = sext i32 %1175 to i64
  %1177 = load %struct.ImageParameters** @img, align 8
  %1178 = getelementptr inbounds %struct.ImageParameters* %1177, i32 0, i32 51
  %1179 = load %struct.macroblock** %1178, align 8
  %1180 = getelementptr inbounds %struct.macroblock* %1179, i64 %1176
  %1181 = getelementptr inbounds %struct.macroblock* %1180, i32 0, i32 22
  %1182 = load i32* %1181, align 4
  %1183 = icmp ne i32 %1182, 0
  br i1 %1183, label %1202, label %1184

; <label>:1184                                    ; preds = %1173
  %1185 = getelementptr inbounds %struct.pix_pos* %mb_left, i32 0, i32 5
  %1186 = load i32* %1185, align 4
  %1187 = sext i32 %1186 to i64
  %1188 = getelementptr inbounds %struct.pix_pos* %mb_left, i32 0, i32 4
  %1189 = load i32* %1188, align 4
  %1190 = sext i32 %1189 to i64
  %1191 = load %struct.storable_picture** @enc_picture, align 8
  %1192 = getelementptr inbounds %struct.storable_picture* %1191, i32 0, i32 32
  %1193 = load i16**** %1192, align 8
  %1194 = getelementptr inbounds i16*** %1193, i64 1
  %1195 = load i16*** %1194, align 8
  %1196 = getelementptr inbounds i16** %1195, i64 %1190
  %1197 = load i16** %1196, align 8
  %1198 = getelementptr inbounds i16* %1197, i64 %1187
  %1199 = load i16* %1198, align 2
  %1200 = sext i16 %1199 to i32
  %1201 = icmp slt i32 %1200, 0
  br i1 %1201, label %1202, label %1220

; <label>:1202                                    ; preds = %1184, %1173
  %1203 = getelementptr inbounds %struct.pix_pos* %mb_left, i32 0, i32 5
  %1204 = load i32* %1203, align 4
  %1205 = sext i32 %1204 to i64
  %1206 = getelementptr inbounds %struct.pix_pos* %mb_left, i32 0, i32 4
  %1207 = load i32* %1206, align 4
  %1208 = sext i32 %1207 to i64
  %1209 = load %struct.storable_picture** @enc_picture, align 8
  %1210 = getelementptr inbounds %struct.storable_picture* %1209, i32 0, i32 32
  %1211 = load i16**** %1210, align 8
  %1212 = getelementptr inbounds i16*** %1211, i64 1
  %1213 = load i16*** %1212, align 8
  %1214 = getelementptr inbounds i16** %1213, i64 %1208
  %1215 = load i16** %1214, align 8
  %1216 = getelementptr inbounds i16* %1215, i64 %1205
  %1217 = load i16* %1216, align 2
  %1218 = sext i16 %1217 to i32
  %1219 = ashr i32 %1218, 1
  br label %1237

; <label>:1220                                    ; preds = %1184
  %1221 = getelementptr inbounds %struct.pix_pos* %mb_left, i32 0, i32 5
  %1222 = load i32* %1221, align 4
  %1223 = sext i32 %1222 to i64
  %1224 = getelementptr inbounds %struct.pix_pos* %mb_left, i32 0, i32 4
  %1225 = load i32* %1224, align 4
  %1226 = sext i32 %1225 to i64
  %1227 = load %struct.storable_picture** @enc_picture, align 8
  %1228 = getelementptr inbounds %struct.storable_picture* %1227, i32 0, i32 32
  %1229 = load i16**** %1228, align 8
  %1230 = getelementptr inbounds i16*** %1229, i64 1
  %1231 = load i16*** %1230, align 8
  %1232 = getelementptr inbounds i16** %1231, i64 %1226
  %1233 = load i16** %1232, align 8
  %1234 = getelementptr inbounds i16* %1233, i64 %1223
  %1235 = load i16* %1234, align 2
  %1236 = sext i16 %1235 to i32
  br label %1237

; <label>:1237                                    ; preds = %1220, %1202
  %1238 = phi i32 [ %1219, %1202 ], [ %1236, %1220 ]
  br label %1240

; <label>:1239                                    ; preds = %1167
  br label %1240

; <label>:1240                                    ; preds = %1239, %1237
  %1241 = phi i32 [ %1238, %1237 ], [ -1, %1239 ]
  %1242 = trunc i32 %1241 to i16
  %1243 = getelementptr inbounds %struct.pix_pos* %mb_up, i32 0, i32 0
  %1244 = load i32* %1243, align 4
  %1245 = icmp ne i32 %1244, 0
  br i1 %1245, label %1246, label %1312

; <label>:1246                                    ; preds = %1240
  %1247 = getelementptr inbounds %struct.pix_pos* %mb_up, i32 0, i32 1
  %1248 = load i32* %1247, align 4
  %1249 = sext i32 %1248 to i64
  %1250 = load %struct.ImageParameters** @img, align 8
  %1251 = getelementptr inbounds %struct.ImageParameters* %1250, i32 0, i32 51
  %1252 = load %struct.macroblock** %1251, align 8
  %1253 = getelementptr inbounds %struct.macroblock* %1252, i64 %1249
  %1254 = getelementptr inbounds %struct.macroblock* %1253, i32 0, i32 22
  %1255 = load i32* %1254, align 4
  %1256 = icmp ne i32 %1255, 0
  br i1 %1256, label %1275, label %1257

; <label>:1257                                    ; preds = %1246
  %1258 = getelementptr inbounds %struct.pix_pos* %mb_up, i32 0, i32 5
  %1259 = load i32* %1258, align 4
  %1260 = sext i32 %1259 to i64
  %1261 = getelementptr inbounds %struct.pix_pos* %mb_up, i32 0, i32 4
  %1262 = load i32* %1261, align 4
  %1263 = sext i32 %1262 to i64
  %1264 = load %struct.storable_picture** @enc_picture, align 8
  %1265 = getelementptr inbounds %struct.storable_picture* %1264, i32 0, i32 32
  %1266 = load i16**** %1265, align 8
  %1267 = getelementptr inbounds i16*** %1266, i64 1
  %1268 = load i16*** %1267, align 8
  %1269 = getelementptr inbounds i16** %1268, i64 %1263
  %1270 = load i16** %1269, align 8
  %1271 = getelementptr inbounds i16* %1270, i64 %1260
  %1272 = load i16* %1271, align 2
  %1273 = sext i16 %1272 to i32
  %1274 = icmp slt i32 %1273, 0
  br i1 %1274, label %1275, label %1293

; <label>:1275                                    ; preds = %1257, %1246
  %1276 = getelementptr inbounds %struct.pix_pos* %mb_up, i32 0, i32 5
  %1277 = load i32* %1276, align 4
  %1278 = sext i32 %1277 to i64
  %1279 = getelementptr inbounds %struct.pix_pos* %mb_up, i32 0, i32 4
  %1280 = load i32* %1279, align 4
  %1281 = sext i32 %1280 to i64
  %1282 = load %struct.storable_picture** @enc_picture, align 8
  %1283 = getelementptr inbounds %struct.storable_picture* %1282, i32 0, i32 32
  %1284 = load i16**** %1283, align 8
  %1285 = getelementptr inbounds i16*** %1284, i64 1
  %1286 = load i16*** %1285, align 8
  %1287 = getelementptr inbounds i16** %1286, i64 %1281
  %1288 = load i16** %1287, align 8
  %1289 = getelementptr inbounds i16* %1288, i64 %1278
  %1290 = load i16* %1289, align 2
  %1291 = sext i16 %1290 to i32
  %1292 = ashr i32 %1291, 1
  br label %1310

; <label>:1293                                    ; preds = %1257
  %1294 = getelementptr inbounds %struct.pix_pos* %mb_up, i32 0, i32 5
  %1295 = load i32* %1294, align 4
  %1296 = sext i32 %1295 to i64
  %1297 = getelementptr inbounds %struct.pix_pos* %mb_up, i32 0, i32 4
  %1298 = load i32* %1297, align 4
  %1299 = sext i32 %1298 to i64
  %1300 = load %struct.storable_picture** @enc_picture, align 8
  %1301 = getelementptr inbounds %struct.storable_picture* %1300, i32 0, i32 32
  %1302 = load i16**** %1301, align 8
  %1303 = getelementptr inbounds i16*** %1302, i64 1
  %1304 = load i16*** %1303, align 8
  %1305 = getelementptr inbounds i16** %1304, i64 %1299
  %1306 = load i16** %1305, align 8
  %1307 = getelementptr inbounds i16* %1306, i64 %1296
  %1308 = load i16* %1307, align 2
  %1309 = sext i16 %1308 to i32
  br label %1310

; <label>:1310                                    ; preds = %1293, %1275
  %1311 = phi i32 [ %1292, %1275 ], [ %1309, %1293 ]
  br label %1313

; <label>:1312                                    ; preds = %1240
  br label %1313

; <label>:1313                                    ; preds = %1312, %1310
  %1314 = phi i32 [ %1311, %1310 ], [ -1, %1312 ]
  %1315 = trunc i32 %1314 to i16
  %1316 = getelementptr inbounds %struct.pix_pos* %mb_upleft, i32 0, i32 0
  %1317 = load i32* %1316, align 4
  %1318 = icmp ne i32 %1317, 0
  br i1 %1318, label %1319, label %1385

; <label>:1319                                    ; preds = %1313
  %1320 = getelementptr inbounds %struct.pix_pos* %mb_upleft, i32 0, i32 1
  %1321 = load i32* %1320, align 4
  %1322 = sext i32 %1321 to i64
  %1323 = load %struct.ImageParameters** @img, align 8
  %1324 = getelementptr inbounds %struct.ImageParameters* %1323, i32 0, i32 51
  %1325 = load %struct.macroblock** %1324, align 8
  %1326 = getelementptr inbounds %struct.macroblock* %1325, i64 %1322
  %1327 = getelementptr inbounds %struct.macroblock* %1326, i32 0, i32 22
  %1328 = load i32* %1327, align 4
  %1329 = icmp ne i32 %1328, 0
  br i1 %1329, label %1348, label %1330

; <label>:1330                                    ; preds = %1319
  %1331 = getelementptr inbounds %struct.pix_pos* %mb_upleft, i32 0, i32 5
  %1332 = load i32* %1331, align 4
  %1333 = sext i32 %1332 to i64
  %1334 = getelementptr inbounds %struct.pix_pos* %mb_upleft, i32 0, i32 4
  %1335 = load i32* %1334, align 4
  %1336 = sext i32 %1335 to i64
  %1337 = load %struct.storable_picture** @enc_picture, align 8
  %1338 = getelementptr inbounds %struct.storable_picture* %1337, i32 0, i32 32
  %1339 = load i16**** %1338, align 8
  %1340 = getelementptr inbounds i16*** %1339, i64 1
  %1341 = load i16*** %1340, align 8
  %1342 = getelementptr inbounds i16** %1341, i64 %1336
  %1343 = load i16** %1342, align 8
  %1344 = getelementptr inbounds i16* %1343, i64 %1333
  %1345 = load i16* %1344, align 2
  %1346 = sext i16 %1345 to i32
  %1347 = icmp slt i32 %1346, 0
  br i1 %1347, label %1348, label %1366

; <label>:1348                                    ; preds = %1330, %1319
  %1349 = getelementptr inbounds %struct.pix_pos* %mb_upleft, i32 0, i32 5
  %1350 = load i32* %1349, align 4
  %1351 = sext i32 %1350 to i64
  %1352 = getelementptr inbounds %struct.pix_pos* %mb_upleft, i32 0, i32 4
  %1353 = load i32* %1352, align 4
  %1354 = sext i32 %1353 to i64
  %1355 = load %struct.storable_picture** @enc_picture, align 8
  %1356 = getelementptr inbounds %struct.storable_picture* %1355, i32 0, i32 32
  %1357 = load i16**** %1356, align 8
  %1358 = getelementptr inbounds i16*** %1357, i64 1
  %1359 = load i16*** %1358, align 8
  %1360 = getelementptr inbounds i16** %1359, i64 %1354
  %1361 = load i16** %1360, align 8
  %1362 = getelementptr inbounds i16* %1361, i64 %1351
  %1363 = load i16* %1362, align 2
  %1364 = sext i16 %1363 to i32
  %1365 = ashr i32 %1364, 1
  br label %1383

; <label>:1366                                    ; preds = %1330
  %1367 = getelementptr inbounds %struct.pix_pos* %mb_upleft, i32 0, i32 5
  %1368 = load i32* %1367, align 4
  %1369 = sext i32 %1368 to i64
  %1370 = getelementptr inbounds %struct.pix_pos* %mb_upleft, i32 0, i32 4
  %1371 = load i32* %1370, align 4
  %1372 = sext i32 %1371 to i64
  %1373 = load %struct.storable_picture** @enc_picture, align 8
  %1374 = getelementptr inbounds %struct.storable_picture* %1373, i32 0, i32 32
  %1375 = load i16**** %1374, align 8
  %1376 = getelementptr inbounds i16*** %1375, i64 1
  %1377 = load i16*** %1376, align 8
  %1378 = getelementptr inbounds i16** %1377, i64 %1372
  %1379 = load i16** %1378, align 8
  %1380 = getelementptr inbounds i16* %1379, i64 %1369
  %1381 = load i16* %1380, align 2
  %1382 = sext i16 %1381 to i32
  br label %1383

; <label>:1383                                    ; preds = %1366, %1348
  %1384 = phi i32 [ %1365, %1348 ], [ %1382, %1366 ]
  br label %1386

; <label>:1385                                    ; preds = %1313
  br label %1386

; <label>:1386                                    ; preds = %1385, %1383
  %1387 = phi i32 [ %1384, %1383 ], [ -1, %1385 ]
  %1388 = trunc i32 %1387 to i16
  %1389 = getelementptr inbounds %struct.pix_pos* %mb_upright, i32 0, i32 0
  %1390 = load i32* %1389, align 4
  %1391 = icmp ne i32 %1390, 0
  br i1 %1391, label %1392, label %1458

; <label>:1392                                    ; preds = %1386
  %1393 = getelementptr inbounds %struct.pix_pos* %mb_upright, i32 0, i32 1
  %1394 = load i32* %1393, align 4
  %1395 = sext i32 %1394 to i64
  %1396 = load %struct.ImageParameters** @img, align 8
  %1397 = getelementptr inbounds %struct.ImageParameters* %1396, i32 0, i32 51
  %1398 = load %struct.macroblock** %1397, align 8
  %1399 = getelementptr inbounds %struct.macroblock* %1398, i64 %1395
  %1400 = getelementptr inbounds %struct.macroblock* %1399, i32 0, i32 22
  %1401 = load i32* %1400, align 4
  %1402 = icmp ne i32 %1401, 0
  br i1 %1402, label %1421, label %1403

; <label>:1403                                    ; preds = %1392
  %1404 = getelementptr inbounds %struct.pix_pos* %mb_upright, i32 0, i32 5
  %1405 = load i32* %1404, align 4
  %1406 = sext i32 %1405 to i64
  %1407 = getelementptr inbounds %struct.pix_pos* %mb_upright, i32 0, i32 4
  %1408 = load i32* %1407, align 4
  %1409 = sext i32 %1408 to i64
  %1410 = load %struct.storable_picture** @enc_picture, align 8
  %1411 = getelementptr inbounds %struct.storable_picture* %1410, i32 0, i32 32
  %1412 = load i16**** %1411, align 8
  %1413 = getelementptr inbounds i16*** %1412, i64 1
  %1414 = load i16*** %1413, align 8
  %1415 = getelementptr inbounds i16** %1414, i64 %1409
  %1416 = load i16** %1415, align 8
  %1417 = getelementptr inbounds i16* %1416, i64 %1406
  %1418 = load i16* %1417, align 2
  %1419 = sext i16 %1418 to i32
  %1420 = icmp slt i32 %1419, 0
  br i1 %1420, label %1421, label %1439

; <label>:1421                                    ; preds = %1403, %1392
  %1422 = getelementptr inbounds %struct.pix_pos* %mb_upright, i32 0, i32 5
  %1423 = load i32* %1422, align 4
  %1424 = sext i32 %1423 to i64
  %1425 = getelementptr inbounds %struct.pix_pos* %mb_upright, i32 0, i32 4
  %1426 = load i32* %1425, align 4
  %1427 = sext i32 %1426 to i64
  %1428 = load %struct.storable_picture** @enc_picture, align 8
  %1429 = getelementptr inbounds %struct.storable_picture* %1428, i32 0, i32 32
  %1430 = load i16**** %1429, align 8
  %1431 = getelementptr inbounds i16*** %1430, i64 1
  %1432 = load i16*** %1431, align 8
  %1433 = getelementptr inbounds i16** %1432, i64 %1427
  %1434 = load i16** %1433, align 8
  %1435 = getelementptr inbounds i16* %1434, i64 %1424
  %1436 = load i16* %1435, align 2
  %1437 = sext i16 %1436 to i32
  %1438 = ashr i32 %1437, 1
  br label %1456

; <label>:1439                                    ; preds = %1403
  %1440 = getelementptr inbounds %struct.pix_pos* %mb_upright, i32 0, i32 5
  %1441 = load i32* %1440, align 4
  %1442 = sext i32 %1441 to i64
  %1443 = getelementptr inbounds %struct.pix_pos* %mb_upright, i32 0, i32 4
  %1444 = load i32* %1443, align 4
  %1445 = sext i32 %1444 to i64
  %1446 = load %struct.storable_picture** @enc_picture, align 8
  %1447 = getelementptr inbounds %struct.storable_picture* %1446, i32 0, i32 32
  %1448 = load i16**** %1447, align 8
  %1449 = getelementptr inbounds i16*** %1448, i64 1
  %1450 = load i16*** %1449, align 8
  %1451 = getelementptr inbounds i16** %1450, i64 %1445
  %1452 = load i16** %1451, align 8
  %1453 = getelementptr inbounds i16* %1452, i64 %1442
  %1454 = load i16* %1453, align 2
  %1455 = sext i16 %1454 to i32
  br label %1456

; <label>:1456                                    ; preds = %1439, %1421
  %1457 = phi i32 [ %1438, %1421 ], [ %1455, %1439 ]
  br label %1460

; <label>:1458                                    ; preds = %1386
  %1459 = sext i16 %1388 to i32
  br label %1460

; <label>:1460                                    ; preds = %1458, %1456
  %1461 = phi i32 [ %1457, %1456 ], [ %1459, %1458 ]
  %1462 = trunc i32 %1461 to i16
  br label %1463

; <label>:1463                                    ; preds = %1460, %873
  %bw_rFrameUR.0 = phi i16 [ %875, %873 ], [ %1462, %1460 ]
  %bw_rFrameU.0 = phi i16 [ %728, %873 ], [ %1315, %1460 ]
  %bw_rFrameL.0 = phi i16 [ %655, %873 ], [ %1242, %1460 ]
  %fw_rFrameUR.0 = phi i16 [ %582, %873 ], [ %1169, %1460 ]
  %fw_rFrameU.0 = phi i16 [ %435, %873 ], [ %1022, %1460 ]
  %fw_rFrameL.0 = phi i16 [ %362, %873 ], [ %949, %1460 ]
  br label %1464

; <label>:1464                                    ; preds = %1463, %282
  %bw_rFrameUR.1 = phi i16 [ %bw_rFrameUR.0, %1463 ], [ %284, %282 ]
  %bw_rFrameU.1 = phi i16 [ %bw_rFrameU.0, %1463 ], [ %235, %282 ]
  %bw_rFrameL.1 = phi i16 [ %bw_rFrameL.0, %1463 ], [ %211, %282 ]
  %fw_rFrameUR.1 = phi i16 [ %fw_rFrameUR.0, %1463 ], [ %187, %282 ]
  %fw_rFrameU.1 = phi i16 [ %fw_rFrameU.0, %1463 ], [ %138, %282 ]
  %fw_rFrameL.1 = phi i16 [ %fw_rFrameL.0, %1463 ], [ %114, %282 ]
  %1465 = sext i16 %fw_rFrameL.1 to i32
  %1466 = icmp sge i32 %1465, 0
  br i1 %1466, label %1467, label %1480

; <label>:1467                                    ; preds = %1464
  %1468 = sext i16 %fw_rFrameU.1 to i32
  %1469 = icmp sge i32 %1468, 0
  br i1 %1469, label %1470, label %1480

; <label>:1470                                    ; preds = %1467
  %1471 = sext i16 %fw_rFrameL.1 to i32
  %1472 = sext i16 %fw_rFrameU.1 to i32
  %1473 = icmp slt i32 %1471, %1472
  br i1 %1473, label %1474, label %1476

; <label>:1474                                    ; preds = %1470
  %1475 = sext i16 %fw_rFrameL.1 to i32
  br label %1478

; <label>:1476                                    ; preds = %1470
  %1477 = sext i16 %fw_rFrameU.1 to i32
  br label %1478

; <label>:1478                                    ; preds = %1476, %1474
  %1479 = phi i32 [ %1475, %1474 ], [ %1477, %1476 ]
  br label %1490

; <label>:1480                                    ; preds = %1467, %1464
  %1481 = sext i16 %fw_rFrameL.1 to i32
  %1482 = sext i16 %fw_rFrameU.1 to i32
  %1483 = icmp sgt i32 %1481, %1482
  br i1 %1483, label %1484, label %1486

; <label>:1484                                    ; preds = %1480
  %1485 = sext i16 %fw_rFrameL.1 to i32
  br label %1488

; <label>:1486                                    ; preds = %1480
  %1487 = sext i16 %fw_rFrameU.1 to i32
  br label %1488

; <label>:1488                                    ; preds = %1486, %1484
  %1489 = phi i32 [ %1485, %1484 ], [ %1487, %1486 ]
  br label %1490

; <label>:1490                                    ; preds = %1488, %1478
  %1491 = phi i32 [ %1479, %1478 ], [ %1489, %1488 ]
  %1492 = trunc i32 %1491 to i16
  %1493 = sext i16 %1492 to i32
  %1494 = icmp sge i32 %1493, 0
  br i1 %1494, label %1495, label %1508

; <label>:1495                                    ; preds = %1490
  %1496 = sext i16 %fw_rFrameUR.1 to i32
  %1497 = icmp sge i32 %1496, 0
  br i1 %1497, label %1498, label %1508

; <label>:1498                                    ; preds = %1495
  %1499 = sext i16 %1492 to i32
  %1500 = sext i16 %fw_rFrameUR.1 to i32
  %1501 = icmp slt i32 %1499, %1500
  br i1 %1501, label %1502, label %1504

; <label>:1502                                    ; preds = %1498
  %1503 = sext i16 %1492 to i32
  br label %1506

; <label>:1504                                    ; preds = %1498
  %1505 = sext i16 %fw_rFrameUR.1 to i32
  br label %1506

; <label>:1506                                    ; preds = %1504, %1502
  %1507 = phi i32 [ %1503, %1502 ], [ %1505, %1504 ]
  br label %1518

; <label>:1508                                    ; preds = %1495, %1490
  %1509 = sext i16 %1492 to i32
  %1510 = sext i16 %fw_rFrameUR.1 to i32
  %1511 = icmp sgt i32 %1509, %1510
  br i1 %1511, label %1512, label %1514

; <label>:1512                                    ; preds = %1508
  %1513 = sext i16 %1492 to i32
  br label %1516

; <label>:1514                                    ; preds = %1508
  %1515 = sext i16 %fw_rFrameUR.1 to i32
  br label %1516

; <label>:1516                                    ; preds = %1514, %1512
  %1517 = phi i32 [ %1513, %1512 ], [ %1515, %1514 ]
  br label %1518

; <label>:1518                                    ; preds = %1516, %1506
  %1519 = phi i32 [ %1507, %1506 ], [ %1517, %1516 ]
  %1520 = trunc i32 %1519 to i16
  %1521 = sext i16 %bw_rFrameL.1 to i32
  %1522 = icmp sge i32 %1521, 0
  br i1 %1522, label %1523, label %1536

; <label>:1523                                    ; preds = %1518
  %1524 = sext i16 %bw_rFrameU.1 to i32
  %1525 = icmp sge i32 %1524, 0
  br i1 %1525, label %1526, label %1536

; <label>:1526                                    ; preds = %1523
  %1527 = sext i16 %bw_rFrameL.1 to i32
  %1528 = sext i16 %bw_rFrameU.1 to i32
  %1529 = icmp slt i32 %1527, %1528
  br i1 %1529, label %1530, label %1532

; <label>:1530                                    ; preds = %1526
  %1531 = sext i16 %bw_rFrameL.1 to i32
  br label %1534

; <label>:1532                                    ; preds = %1526
  %1533 = sext i16 %bw_rFrameU.1 to i32
  br label %1534

; <label>:1534                                    ; preds = %1532, %1530
  %1535 = phi i32 [ %1531, %1530 ], [ %1533, %1532 ]
  br label %1546

; <label>:1536                                    ; preds = %1523, %1518
  %1537 = sext i16 %bw_rFrameL.1 to i32
  %1538 = sext i16 %bw_rFrameU.1 to i32
  %1539 = icmp sgt i32 %1537, %1538
  br i1 %1539, label %1540, label %1542

; <label>:1540                                    ; preds = %1536
  %1541 = sext i16 %bw_rFrameL.1 to i32
  br label %1544

; <label>:1542                                    ; preds = %1536
  %1543 = sext i16 %bw_rFrameU.1 to i32
  br label %1544

; <label>:1544                                    ; preds = %1542, %1540
  %1545 = phi i32 [ %1541, %1540 ], [ %1543, %1542 ]
  br label %1546

; <label>:1546                                    ; preds = %1544, %1534
  %1547 = phi i32 [ %1535, %1534 ], [ %1545, %1544 ]
  %1548 = trunc i32 %1547 to i16
  %1549 = sext i16 %1548 to i32
  %1550 = icmp sge i32 %1549, 0
  br i1 %1550, label %1551, label %1564

; <label>:1551                                    ; preds = %1546
  %1552 = sext i16 %bw_rFrameUR.1 to i32
  %1553 = icmp sge i32 %1552, 0
  br i1 %1553, label %1554, label %1564

; <label>:1554                                    ; preds = %1551
  %1555 = sext i16 %1548 to i32
  %1556 = sext i16 %bw_rFrameUR.1 to i32
  %1557 = icmp slt i32 %1555, %1556
  br i1 %1557, label %1558, label %1560

; <label>:1558                                    ; preds = %1554
  %1559 = sext i16 %1548 to i32
  br label %1562

; <label>:1560                                    ; preds = %1554
  %1561 = sext i16 %bw_rFrameUR.1 to i32
  br label %1562

; <label>:1562                                    ; preds = %1560, %1558
  %1563 = phi i32 [ %1559, %1558 ], [ %1561, %1560 ]
  br label %1574

; <label>:1564                                    ; preds = %1551, %1546
  %1565 = sext i16 %1548 to i32
  %1566 = sext i16 %bw_rFrameUR.1 to i32
  %1567 = icmp sgt i32 %1565, %1566
  br i1 %1567, label %1568, label %1570

; <label>:1568                                    ; preds = %1564
  %1569 = sext i16 %1548 to i32
  br label %1572

; <label>:1570                                    ; preds = %1564
  %1571 = sext i16 %bw_rFrameUR.1 to i32
  br label %1572

; <label>:1572                                    ; preds = %1570, %1568
  %1573 = phi i32 [ %1569, %1568 ], [ %1571, %1570 ]
  br label %1574

; <label>:1574                                    ; preds = %1572, %1562
  %1575 = phi i32 [ %1563, %1562 ], [ %1573, %1572 ]
  %1576 = trunc i32 %1575 to i16
  %1577 = sext i16 %1520 to i32
  %1578 = icmp sge i32 %1577, 0
  br i1 %1578, label %1579, label %1587

; <label>:1579                                    ; preds = %1574
  %1580 = getelementptr inbounds [2 x i16]* %pmvfw, i32 0, i32 0
  %1581 = load %struct.storable_picture** @enc_picture, align 8
  %1582 = getelementptr inbounds %struct.storable_picture* %1581, i32 0, i32 32
  %1583 = load i16**** %1582, align 8
  %1584 = load %struct.storable_picture** @enc_picture, align 8
  %1585 = getelementptr inbounds %struct.storable_picture* %1584, i32 0, i32 35
  %1586 = load i16***** %1585, align 8
  call void @SetMotionVectorPredictor(i16* %1580, i16*** %1583, i16**** %1586, i16 signext %1520, i32 0, i32 0, i32 0, i32 16, i32 16)
  br label %1587

; <label>:1587                                    ; preds = %1579, %1574
  %1588 = sext i16 %1576 to i32
  %1589 = icmp sge i32 %1588, 0
  br i1 %1589, label %1590, label %1598

; <label>:1590                                    ; preds = %1587
  %1591 = getelementptr inbounds [2 x i16]* %pmvbw, i32 0, i32 0
  %1592 = load %struct.storable_picture** @enc_picture, align 8
  %1593 = getelementptr inbounds %struct.storable_picture* %1592, i32 0, i32 32
  %1594 = load i16**** %1593, align 8
  %1595 = load %struct.storable_picture** @enc_picture, align 8
  %1596 = getelementptr inbounds %struct.storable_picture* %1595, i32 0, i32 35
  %1597 = load i16***** %1596, align 8
  call void @SetMotionVectorPredictor(i16* %1591, i16*** %1594, i16**** %1597, i16 signext %1576, i32 1, i32 0, i32 0, i32 16, i32 16)
  br label %1598

; <label>:1598                                    ; preds = %1590, %1587
  br label %1599

; <label>:1599                                    ; preds = %1948, %1598
  %block_y.0 = phi i32 [ 0, %1598 ], [ %1949, %1948 ]
  %1600 = icmp slt i32 %block_y.0, 4
  br i1 %1600, label %1601, label %1950

; <label>:1601                                    ; preds = %1599
  %1602 = load %struct.ImageParameters** @img, align 8
  %1603 = getelementptr inbounds %struct.ImageParameters* %1602, i32 0, i32 34
  %1604 = load i32* %1603, align 4
  %1605 = ashr i32 %1604, 2
  %1606 = add nsw i32 %1605, %block_y.0
  %1607 = load %struct.ImageParameters** @img, align 8
  %1608 = getelementptr inbounds %struct.ImageParameters* %1607, i32 0, i32 38
  %1609 = load i32* %1608, align 4
  %1610 = ashr i32 %1609, 2
  %1611 = add nsw i32 %1610, %block_y.0
  br label %1612

; <label>:1612                                    ; preds = %1945, %1601
  %block_x.0 = phi i32 [ 0, %1601 ], [ %1946, %1945 ]
  %1613 = icmp slt i32 %block_x.0, 4
  br i1 %1613, label %1614, label %1947

; <label>:1614                                    ; preds = %1612
  %1615 = load %struct.ImageParameters** @img, align 8
  %1616 = getelementptr inbounds %struct.ImageParameters* %1615, i32 0, i32 33
  %1617 = load i32* %1616, align 4
  %1618 = ashr i32 %1617, 2
  %1619 = add nsw i32 %1618, %block_x.0
  %1620 = load %struct.ImageParameters** @img, align 8
  %1621 = getelementptr inbounds %struct.ImageParameters* %1620, i32 0, i32 37
  %1622 = load i32* %1621, align 4
  %1623 = ashr i32 %1622, 2
  %1624 = add nsw i32 %1623, %block_x.0
  %1625 = sext i16 %1520 to i32
  %1626 = icmp sge i32 %1625, 0
  br i1 %1626, label %1627, label %1714

; <label>:1627                                    ; preds = %1614
  %1628 = icmp ne i16 %1520, 0
  br i1 %1628, label %1672, label %1629

; <label>:1629                                    ; preds = %1627
  %1630 = sext i32 %1611 to i64
  %1631 = sext i32 %1624 to i64
  %1632 = getelementptr inbounds i8** %moving_block.1, i64 %1631
  %1633 = load i8** %1632, align 8
  %1634 = getelementptr inbounds i8* %1633, i64 %1630
  %1635 = load i8* %1634, align 1
  %1636 = icmp ne i8 %1635, 0
  br i1 %1636, label %1672, label %1637

; <label>:1637                                    ; preds = %1629
  %1638 = sext i32 %block_y.0 to i64
  %1639 = sext i32 %block_x.0 to i64
  %1640 = getelementptr inbounds i16****** %3, i64 %1639
  %1641 = load i16****** %1640, align 8
  %1642 = getelementptr inbounds i16***** %1641, i64 %1638
  %1643 = load i16***** %1642, align 8
  %1644 = getelementptr inbounds i16**** %1643, i64 0
  %1645 = load i16**** %1644, align 8
  %1646 = getelementptr inbounds i16*** %1645, i64 0
  %1647 = load i16*** %1646, align 8
  %1648 = getelementptr inbounds i16** %1647, i64 0
  %1649 = load i16** %1648, align 8
  %1650 = getelementptr inbounds i16* %1649, i64 0
  store i16 0, i16* %1650, align 2
  %1651 = sext i32 %block_y.0 to i64
  %1652 = sext i32 %block_x.0 to i64
  %1653 = getelementptr inbounds i16****** %3, i64 %1652
  %1654 = load i16****** %1653, align 8
  %1655 = getelementptr inbounds i16***** %1654, i64 %1651
  %1656 = load i16***** %1655, align 8
  %1657 = getelementptr inbounds i16**** %1656, i64 0
  %1658 = load i16**** %1657, align 8
  %1659 = getelementptr inbounds i16*** %1658, i64 0
  %1660 = load i16*** %1659, align 8
  %1661 = getelementptr inbounds i16** %1660, i64 0
  %1662 = load i16** %1661, align 8
  %1663 = getelementptr inbounds i16* %1662, i64 1
  store i16 0, i16* %1663, align 2
  %1664 = sext i32 %1606 to i64
  %1665 = sext i32 %1619 to i64
  %1666 = load i16**** @direct_ref_idx, align 8
  %1667 = getelementptr inbounds i16*** %1666, i64 0
  %1668 = load i16*** %1667, align 8
  %1669 = getelementptr inbounds i16** %1668, i64 %1665
  %1670 = load i16** %1669, align 8
  %1671 = getelementptr inbounds i16* %1670, i64 %1664
  store i16 0, i16* %1671, align 2
  br label %1713

; <label>:1672                                    ; preds = %1629, %1627
  %1673 = getelementptr inbounds [2 x i16]* %pmvfw, i32 0, i64 0
  %1674 = load i16* %1673, align 2
  %1675 = sext i16 %1520 to i64
  %1676 = sext i32 %block_y.0 to i64
  %1677 = sext i32 %block_x.0 to i64
  %1678 = getelementptr inbounds i16****** %3, i64 %1677
  %1679 = load i16****** %1678, align 8
  %1680 = getelementptr inbounds i16***** %1679, i64 %1676
  %1681 = load i16***** %1680, align 8
  %1682 = getelementptr inbounds i16**** %1681, i64 0
  %1683 = load i16**** %1682, align 8
  %1684 = getelementptr inbounds i16*** %1683, i64 %1675
  %1685 = load i16*** %1684, align 8
  %1686 = getelementptr inbounds i16** %1685, i64 0
  %1687 = load i16** %1686, align 8
  %1688 = getelementptr inbounds i16* %1687, i64 0
  store i16 %1674, i16* %1688, align 2
  %1689 = getelementptr inbounds [2 x i16]* %pmvfw, i32 0, i64 1
  %1690 = load i16* %1689, align 2
  %1691 = sext i16 %1520 to i64
  %1692 = sext i32 %block_y.0 to i64
  %1693 = sext i32 %block_x.0 to i64
  %1694 = getelementptr inbounds i16****** %3, i64 %1693
  %1695 = load i16****** %1694, align 8
  %1696 = getelementptr inbounds i16***** %1695, i64 %1692
  %1697 = load i16***** %1696, align 8
  %1698 = getelementptr inbounds i16**** %1697, i64 0
  %1699 = load i16**** %1698, align 8
  %1700 = getelementptr inbounds i16*** %1699, i64 %1691
  %1701 = load i16*** %1700, align 8
  %1702 = getelementptr inbounds i16** %1701, i64 0
  %1703 = load i16** %1702, align 8
  %1704 = getelementptr inbounds i16* %1703, i64 1
  store i16 %1690, i16* %1704, align 2
  %1705 = sext i32 %1606 to i64
  %1706 = sext i32 %1619 to i64
  %1707 = load i16**** @direct_ref_idx, align 8
  %1708 = getelementptr inbounds i16*** %1707, i64 0
  %1709 = load i16*** %1708, align 8
  %1710 = getelementptr inbounds i16** %1709, i64 %1706
  %1711 = load i16** %1710, align 8
  %1712 = getelementptr inbounds i16* %1711, i64 %1705
  store i16 %1520, i16* %1712, align 2
  br label %1713

; <label>:1713                                    ; preds = %1672, %1637
  br label %1749

; <label>:1714                                    ; preds = %1614
  %1715 = sext i32 %block_y.0 to i64
  %1716 = sext i32 %block_x.0 to i64
  %1717 = getelementptr inbounds i16****** %3, i64 %1716
  %1718 = load i16****** %1717, align 8
  %1719 = getelementptr inbounds i16***** %1718, i64 %1715
  %1720 = load i16***** %1719, align 8
  %1721 = getelementptr inbounds i16**** %1720, i64 0
  %1722 = load i16**** %1721, align 8
  %1723 = getelementptr inbounds i16*** %1722, i64 0
  %1724 = load i16*** %1723, align 8
  %1725 = getelementptr inbounds i16** %1724, i64 0
  %1726 = load i16** %1725, align 8
  %1727 = getelementptr inbounds i16* %1726, i64 0
  store i16 0, i16* %1727, align 2
  %1728 = sext i32 %block_y.0 to i64
  %1729 = sext i32 %block_x.0 to i64
  %1730 = getelementptr inbounds i16****** %3, i64 %1729
  %1731 = load i16****** %1730, align 8
  %1732 = getelementptr inbounds i16***** %1731, i64 %1728
  %1733 = load i16***** %1732, align 8
  %1734 = getelementptr inbounds i16**** %1733, i64 0
  %1735 = load i16**** %1734, align 8
  %1736 = getelementptr inbounds i16*** %1735, i64 0
  %1737 = load i16*** %1736, align 8
  %1738 = getelementptr inbounds i16** %1737, i64 0
  %1739 = load i16** %1738, align 8
  %1740 = getelementptr inbounds i16* %1739, i64 1
  store i16 0, i16* %1740, align 2
  %1741 = sext i32 %1606 to i64
  %1742 = sext i32 %1619 to i64
  %1743 = load i16**** @direct_ref_idx, align 8
  %1744 = getelementptr inbounds i16*** %1743, i64 0
  %1745 = load i16*** %1744, align 8
  %1746 = getelementptr inbounds i16** %1745, i64 %1742
  %1747 = load i16** %1746, align 8
  %1748 = getelementptr inbounds i16* %1747, i64 %1741
  store i16 -1, i16* %1748, align 2
  br label %1749

; <label>:1749                                    ; preds = %1714, %1713
  %1750 = sext i16 %1576 to i32
  %1751 = icmp sge i32 %1750, 0
  br i1 %1751, label %1752, label %1840

; <label>:1752                                    ; preds = %1749
  %1753 = sext i16 %1576 to i32
  %1754 = icmp eq i32 %1753, 0
  br i1 %1754, label %1755, label %1798

; <label>:1755                                    ; preds = %1752
  %1756 = sext i32 %1611 to i64
  %1757 = sext i32 %1624 to i64
  %1758 = getelementptr inbounds i8** %moving_block.1, i64 %1757
  %1759 = load i8** %1758, align 8
  %1760 = getelementptr inbounds i8* %1759, i64 %1756
  %1761 = load i8* %1760, align 1
  %1762 = icmp ne i8 %1761, 0
  br i1 %1762, label %1798, label %1763

; <label>:1763                                    ; preds = %1755
  %1764 = sext i32 %block_y.0 to i64
  %1765 = sext i32 %block_x.0 to i64
  %1766 = getelementptr inbounds i16****** %3, i64 %1765
  %1767 = load i16****** %1766, align 8
  %1768 = getelementptr inbounds i16***** %1767, i64 %1764
  %1769 = load i16***** %1768, align 8
  %1770 = getelementptr inbounds i16**** %1769, i64 1
  %1771 = load i16**** %1770, align 8
  %1772 = getelementptr inbounds i16*** %1771, i64 0
  %1773 = load i16*** %1772, align 8
  %1774 = getelementptr inbounds i16** %1773, i64 0
  %1775 = load i16** %1774, align 8
  %1776 = getelementptr inbounds i16* %1775, i64 0
  store i16 0, i16* %1776, align 2
  %1777 = sext i32 %block_y.0 to i64
  %1778 = sext i32 %block_x.0 to i64
  %1779 = getelementptr inbounds i16****** %3, i64 %1778
  %1780 = load i16****** %1779, align 8
  %1781 = getelementptr inbounds i16***** %1780, i64 %1777
  %1782 = load i16***** %1781, align 8
  %1783 = getelementptr inbounds i16**** %1782, i64 1
  %1784 = load i16**** %1783, align 8
  %1785 = getelementptr inbounds i16*** %1784, i64 0
  %1786 = load i16*** %1785, align 8
  %1787 = getelementptr inbounds i16** %1786, i64 0
  %1788 = load i16** %1787, align 8
  %1789 = getelementptr inbounds i16* %1788, i64 1
  store i16 0, i16* %1789, align 2
  %1790 = sext i32 %1606 to i64
  %1791 = sext i32 %1619 to i64
  %1792 = load i16**** @direct_ref_idx, align 8
  %1793 = getelementptr inbounds i16*** %1792, i64 1
  %1794 = load i16*** %1793, align 8
  %1795 = getelementptr inbounds i16** %1794, i64 %1791
  %1796 = load i16** %1795, align 8
  %1797 = getelementptr inbounds i16* %1796, i64 %1790
  store i16 %1576, i16* %1797, align 2
  br label %1839

; <label>:1798                                    ; preds = %1755, %1752
  %1799 = getelementptr inbounds [2 x i16]* %pmvbw, i32 0, i64 0
  %1800 = load i16* %1799, align 2
  %1801 = sext i16 %1576 to i64
  %1802 = sext i32 %block_y.0 to i64
  %1803 = sext i32 %block_x.0 to i64
  %1804 = getelementptr inbounds i16****** %3, i64 %1803
  %1805 = load i16****** %1804, align 8
  %1806 = getelementptr inbounds i16***** %1805, i64 %1802
  %1807 = load i16***** %1806, align 8
  %1808 = getelementptr inbounds i16**** %1807, i64 1
  %1809 = load i16**** %1808, align 8
  %1810 = getelementptr inbounds i16*** %1809, i64 %1801
  %1811 = load i16*** %1810, align 8
  %1812 = getelementptr inbounds i16** %1811, i64 0
  %1813 = load i16** %1812, align 8
  %1814 = getelementptr inbounds i16* %1813, i64 0
  store i16 %1800, i16* %1814, align 2
  %1815 = getelementptr inbounds [2 x i16]* %pmvbw, i32 0, i64 1
  %1816 = load i16* %1815, align 2
  %1817 = sext i16 %1576 to i64
  %1818 = sext i32 %block_y.0 to i64
  %1819 = sext i32 %block_x.0 to i64
  %1820 = getelementptr inbounds i16****** %3, i64 %1819
  %1821 = load i16****** %1820, align 8
  %1822 = getelementptr inbounds i16***** %1821, i64 %1818
  %1823 = load i16***** %1822, align 8
  %1824 = getelementptr inbounds i16**** %1823, i64 1
  %1825 = load i16**** %1824, align 8
  %1826 = getelementptr inbounds i16*** %1825, i64 %1817
  %1827 = load i16*** %1826, align 8
  %1828 = getelementptr inbounds i16** %1827, i64 0
  %1829 = load i16** %1828, align 8
  %1830 = getelementptr inbounds i16* %1829, i64 1
  store i16 %1816, i16* %1830, align 2
  %1831 = sext i32 %1606 to i64
  %1832 = sext i32 %1619 to i64
  %1833 = load i16**** @direct_ref_idx, align 8
  %1834 = getelementptr inbounds i16*** %1833, i64 1
  %1835 = load i16*** %1834, align 8
  %1836 = getelementptr inbounds i16** %1835, i64 %1832
  %1837 = load i16** %1836, align 8
  %1838 = getelementptr inbounds i16* %1837, i64 %1831
  store i16 %1576, i16* %1838, align 2
  br label %1839

; <label>:1839                                    ; preds = %1798, %1763
  br label %1875

; <label>:1840                                    ; preds = %1749
  %1841 = sext i32 %1606 to i64
  %1842 = sext i32 %1619 to i64
  %1843 = load i16**** @direct_ref_idx, align 8
  %1844 = getelementptr inbounds i16*** %1843, i64 1
  %1845 = load i16*** %1844, align 8
  %1846 = getelementptr inbounds i16** %1845, i64 %1842
  %1847 = load i16** %1846, align 8
  %1848 = getelementptr inbounds i16* %1847, i64 %1841
  store i16 -1, i16* %1848, align 2
  %1849 = sext i32 %block_y.0 to i64
  %1850 = sext i32 %block_x.0 to i64
  %1851 = getelementptr inbounds i16****** %3, i64 %1850
  %1852 = load i16****** %1851, align 8
  %1853 = getelementptr inbounds i16***** %1852, i64 %1849
  %1854 = load i16***** %1853, align 8
  %1855 = getelementptr inbounds i16**** %1854, i64 1
  %1856 = load i16**** %1855, align 8
  %1857 = getelementptr inbounds i16*** %1856, i64 0
  %1858 = load i16*** %1857, align 8
  %1859 = getelementptr inbounds i16** %1858, i64 0
  %1860 = load i16** %1859, align 8
  %1861 = getelementptr inbounds i16* %1860, i64 0
  store i16 0, i16* %1861, align 2
  %1862 = sext i32 %block_y.0 to i64
  %1863 = sext i32 %block_x.0 to i64
  %1864 = getelementptr inbounds i16****** %3, i64 %1863
  %1865 = load i16****** %1864, align 8
  %1866 = getelementptr inbounds i16***** %1865, i64 %1862
  %1867 = load i16***** %1866, align 8
  %1868 = getelementptr inbounds i16**** %1867, i64 1
  %1869 = load i16**** %1868, align 8
  %1870 = getelementptr inbounds i16*** %1869, i64 0
  %1871 = load i16*** %1870, align 8
  %1872 = getelementptr inbounds i16** %1871, i64 0
  %1873 = load i16** %1872, align 8
  %1874 = getelementptr inbounds i16* %1873, i64 1
  store i16 0, i16* %1874, align 2
  br label %1875

; <label>:1875                                    ; preds = %1840, %1839
  %1876 = sext i16 %1520 to i32
  %1877 = icmp slt i32 %1876, 0
  br i1 %1877, label %1878, label %1898

; <label>:1878                                    ; preds = %1875
  %1879 = sext i16 %1576 to i32
  %1880 = icmp slt i32 %1879, 0
  br i1 %1880, label %1881, label %1898

; <label>:1881                                    ; preds = %1878
  %1882 = sext i32 %1606 to i64
  %1883 = sext i32 %1619 to i64
  %1884 = load i16**** @direct_ref_idx, align 8
  %1885 = getelementptr inbounds i16*** %1884, i64 1
  %1886 = load i16*** %1885, align 8
  %1887 = getelementptr inbounds i16** %1886, i64 %1883
  %1888 = load i16** %1887, align 8
  %1889 = getelementptr inbounds i16* %1888, i64 %1882
  store i16 0, i16* %1889, align 2
  %1890 = sext i32 %1606 to i64
  %1891 = sext i32 %1619 to i64
  %1892 = load i16**** @direct_ref_idx, align 8
  %1893 = getelementptr inbounds i16*** %1892, i64 0
  %1894 = load i16*** %1893, align 8
  %1895 = getelementptr inbounds i16** %1894, i64 %1891
  %1896 = load i16** %1895, align 8
  %1897 = getelementptr inbounds i16* %1896, i64 %1890
  store i16 0, i16* %1897, align 2
  br label %1898

; <label>:1898                                    ; preds = %1881, %1878, %1875
  %1899 = sext i32 %1606 to i64
  %1900 = sext i32 %1619 to i64
  %1901 = load i16**** @direct_ref_idx, align 8
  %1902 = getelementptr inbounds i16*** %1901, i64 1
  %1903 = load i16*** %1902, align 8
  %1904 = getelementptr inbounds i16** %1903, i64 %1900
  %1905 = load i16** %1904, align 8
  %1906 = getelementptr inbounds i16* %1905, i64 %1899
  %1907 = load i16* %1906, align 2
  %1908 = sext i16 %1907 to i32
  %1909 = icmp eq i32 %1908, -1
  br i1 %1909, label %1910, label %1917

; <label>:1910                                    ; preds = %1898
  %1911 = sext i32 %1606 to i64
  %1912 = sext i32 %1619 to i64
  %1913 = load i16*** @direct_pdir, align 8
  %1914 = getelementptr inbounds i16** %1913, i64 %1912
  %1915 = load i16** %1914, align 8
  %1916 = getelementptr inbounds i16* %1915, i64 %1911
  store i16 0, i16* %1916, align 2
  br label %1944

; <label>:1917                                    ; preds = %1898
  %1918 = sext i32 %1606 to i64
  %1919 = sext i32 %1619 to i64
  %1920 = load i16**** @direct_ref_idx, align 8
  %1921 = getelementptr inbounds i16*** %1920, i64 0
  %1922 = load i16*** %1921, align 8
  %1923 = getelementptr inbounds i16** %1922, i64 %1919
  %1924 = load i16** %1923, align 8
  %1925 = getelementptr inbounds i16* %1924, i64 %1918
  %1926 = load i16* %1925, align 2
  %1927 = sext i16 %1926 to i32
  %1928 = icmp eq i32 %1927, -1
  br i1 %1928, label %1929, label %1936

; <label>:1929                                    ; preds = %1917
  %1930 = sext i32 %1606 to i64
  %1931 = sext i32 %1619 to i64
  %1932 = load i16*** @direct_pdir, align 8
  %1933 = getelementptr inbounds i16** %1932, i64 %1931
  %1934 = load i16** %1933, align 8
  %1935 = getelementptr inbounds i16* %1934, i64 %1930
  store i16 1, i16* %1935, align 2
  br label %1943

; <label>:1936                                    ; preds = %1917
  %1937 = sext i32 %1606 to i64
  %1938 = sext i32 %1619 to i64
  %1939 = load i16*** @direct_pdir, align 8
  %1940 = getelementptr inbounds i16** %1939, i64 %1938
  %1941 = load i16** %1940, align 8
  %1942 = getelementptr inbounds i16* %1941, i64 %1937
  store i16 2, i16* %1942, align 2
  br label %1943

; <label>:1943                                    ; preds = %1936, %1929
  br label %1944

; <label>:1944                                    ; preds = %1943, %1910
  br label %1945

; <label>:1945                                    ; preds = %1944
  %1946 = add nsw i32 %block_x.0, 1
  br label %1612

; <label>:1947                                    ; preds = %1612
  br label %1948

; <label>:1948                                    ; preds = %1947
  %1949 = add nsw i32 %block_y.0, 1
  br label %1599

; <label>:1950                                    ; preds = %1599
  br label %2402

; <label>:1951                                    ; preds = %66
  br label %1952

; <label>:1952                                    ; preds = %2399, %1951
  %block_y.1 = phi i32 [ 0, %1951 ], [ %2400, %2399 ]
  %1953 = icmp slt i32 %block_y.1, 4
  br i1 %1953, label %1954, label %2401

; <label>:1954                                    ; preds = %1952
  %1955 = load %struct.ImageParameters** @img, align 8
  %1956 = getelementptr inbounds %struct.ImageParameters* %1955, i32 0, i32 34
  %1957 = load i32* %1956, align 4
  %1958 = ashr i32 %1957, 2
  %1959 = add nsw i32 %1958, %block_y.1
  %1960 = load %struct.ImageParameters** @img, align 8
  %1961 = getelementptr inbounds %struct.ImageParameters* %1960, i32 0, i32 38
  %1962 = load i32* %1961, align 4
  %1963 = ashr i32 %1962, 2
  %1964 = add nsw i32 %1963, %block_y.1
  br label %1965

; <label>:1965                                    ; preds = %2396, %1954
  %block_x.1 = phi i32 [ 0, %1954 ], [ %2397, %2396 ]
  %1966 = icmp slt i32 %block_x.1, 4
  br i1 %1966, label %1967, label %2398

; <label>:1967                                    ; preds = %1965
  %1968 = load %struct.ImageParameters** @img, align 8
  %1969 = getelementptr inbounds %struct.ImageParameters* %1968, i32 0, i32 90
  %1970 = load i32* %1969, align 4
  %1971 = icmp ne i32 %1970, 0
  br i1 %1971, label %1972, label %1983

; <label>:1972                                    ; preds = %1967
  %1973 = getelementptr inbounds %struct.macroblock* %11, i32 0, i32 22
  %1974 = load i32* %1973, align 4
  %1975 = icmp ne i32 %1974, 0
  br i1 %1975, label %1976, label %1983

; <label>:1976                                    ; preds = %1972
  %1977 = load %struct.ImageParameters** @img, align 8
  %1978 = getelementptr inbounds %struct.ImageParameters* %1977, i32 0, i32 3
  %1979 = load i32* %1978, align 4
  %1980 = srem i32 %1979, 2
  %1981 = icmp ne i32 %1980, 0
  %1982 = select i1 %1981, i32 4, i32 2
  br label %1984

; <label>:1983                                    ; preds = %1972, %1967
  br label %1984

; <label>:1984                                    ; preds = %1983, %1976
  %1985 = phi i32 [ %1982, %1976 ], [ 0, %1983 ]
  %1986 = load %struct.ImageParameters** @img, align 8
  %1987 = getelementptr inbounds %struct.ImageParameters* %1986, i32 0, i32 33
  %1988 = load i32* %1987, align 4
  %1989 = ashr i32 %1988, 2
  %1990 = add nsw i32 %1989, %block_x.1
  %1991 = load %struct.ImageParameters** @img, align 8
  %1992 = getelementptr inbounds %struct.ImageParameters* %1991, i32 0, i32 37
  %1993 = load i32* %1992, align 4
  %1994 = ashr i32 %1993, 2
  %1995 = add nsw i32 %1994, %block_x.1
  %1996 = sext i32 %1964 to i64
  %1997 = sext i32 %1995 to i64
  %1998 = getelementptr inbounds i16*** %co_located_ref_idx.1, i64 0
  %1999 = load i16*** %1998, align 8
  %2000 = getelementptr inbounds i16** %1999, i64 %1997
  %2001 = load i16** %2000, align 8
  %2002 = getelementptr inbounds i16* %2001, i64 %1996
  %2003 = load i16* %2002, align 2
  %2004 = sext i16 %2003 to i32
  %2005 = icmp eq i32 %2004, -1
  %2006 = select i1 %2005, i32 1, i32 0
  %2007 = sext i32 %1964 to i64
  %2008 = sext i32 %1995 to i64
  %2009 = sext i32 %2006 to i64
  %2010 = getelementptr inbounds i16*** %co_located_ref_idx.1, i64 %2009
  %2011 = load i16*** %2010, align 8
  %2012 = getelementptr inbounds i16** %2011, i64 %2008
  %2013 = load i16** %2012, align 8
  %2014 = getelementptr inbounds i16* %2013, i64 %2007
  %2015 = load i16* %2014, align 2
  %2016 = sext i16 %2015 to i32
  %2017 = icmp eq i32 %2016, -1
  br i1 %2017, label %2018, label %2093

; <label>:2018                                    ; preds = %1984
  %2019 = sext i32 %block_y.1 to i64
  %2020 = sext i32 %block_x.1 to i64
  %2021 = getelementptr inbounds i16****** %3, i64 %2020
  %2022 = load i16****** %2021, align 8
  %2023 = getelementptr inbounds i16***** %2022, i64 %2019
  %2024 = load i16***** %2023, align 8
  %2025 = getelementptr inbounds i16**** %2024, i64 0
  %2026 = load i16**** %2025, align 8
  %2027 = getelementptr inbounds i16*** %2026, i64 0
  %2028 = load i16*** %2027, align 8
  %2029 = getelementptr inbounds i16** %2028, i64 0
  %2030 = load i16** %2029, align 8
  %2031 = getelementptr inbounds i16* %2030, i64 0
  store i16 0, i16* %2031, align 2
  %2032 = sext i32 %block_y.1 to i64
  %2033 = sext i32 %block_x.1 to i64
  %2034 = getelementptr inbounds i16****** %3, i64 %2033
  %2035 = load i16****** %2034, align 8
  %2036 = getelementptr inbounds i16***** %2035, i64 %2032
  %2037 = load i16***** %2036, align 8
  %2038 = getelementptr inbounds i16**** %2037, i64 0
  %2039 = load i16**** %2038, align 8
  %2040 = getelementptr inbounds i16*** %2039, i64 0
  %2041 = load i16*** %2040, align 8
  %2042 = getelementptr inbounds i16** %2041, i64 0
  %2043 = load i16** %2042, align 8
  %2044 = getelementptr inbounds i16* %2043, i64 1
  store i16 0, i16* %2044, align 2
  %2045 = sext i32 %block_y.1 to i64
  %2046 = sext i32 %block_x.1 to i64
  %2047 = getelementptr inbounds i16****** %3, i64 %2046
  %2048 = load i16****** %2047, align 8
  %2049 = getelementptr inbounds i16***** %2048, i64 %2045
  %2050 = load i16***** %2049, align 8
  %2051 = getelementptr inbounds i16**** %2050, i64 1
  %2052 = load i16**** %2051, align 8
  %2053 = getelementptr inbounds i16*** %2052, i64 0
  %2054 = load i16*** %2053, align 8
  %2055 = getelementptr inbounds i16** %2054, i64 0
  %2056 = load i16** %2055, align 8
  %2057 = getelementptr inbounds i16* %2056, i64 0
  store i16 0, i16* %2057, align 2
  %2058 = sext i32 %block_y.1 to i64
  %2059 = sext i32 %block_x.1 to i64
  %2060 = getelementptr inbounds i16****** %3, i64 %2059
  %2061 = load i16****** %2060, align 8
  %2062 = getelementptr inbounds i16***** %2061, i64 %2058
  %2063 = load i16***** %2062, align 8
  %2064 = getelementptr inbounds i16**** %2063, i64 1
  %2065 = load i16**** %2064, align 8
  %2066 = getelementptr inbounds i16*** %2065, i64 0
  %2067 = load i16*** %2066, align 8
  %2068 = getelementptr inbounds i16** %2067, i64 0
  %2069 = load i16** %2068, align 8
  %2070 = getelementptr inbounds i16* %2069, i64 1
  store i16 0, i16* %2070, align 2
  %2071 = sext i32 %1959 to i64
  %2072 = sext i32 %1990 to i64
  %2073 = load i16**** @direct_ref_idx, align 8
  %2074 = getelementptr inbounds i16*** %2073, i64 0
  %2075 = load i16*** %2074, align 8
  %2076 = getelementptr inbounds i16** %2075, i64 %2072
  %2077 = load i16** %2076, align 8
  %2078 = getelementptr inbounds i16* %2077, i64 %2071
  store i16 0, i16* %2078, align 2
  %2079 = sext i32 %1959 to i64
  %2080 = sext i32 %1990 to i64
  %2081 = load i16**** @direct_ref_idx, align 8
  %2082 = getelementptr inbounds i16*** %2081, i64 1
  %2083 = load i16*** %2082, align 8
  %2084 = getelementptr inbounds i16** %2083, i64 %2080
  %2085 = load i16** %2084, align 8
  %2086 = getelementptr inbounds i16* %2085, i64 %2079
  store i16 0, i16* %2086, align 2
  %2087 = sext i32 %1959 to i64
  %2088 = sext i32 %1990 to i64
  %2089 = load i16*** @direct_pdir, align 8
  %2090 = getelementptr inbounds i16** %2089, i64 %2088
  %2091 = load i16** %2090, align 8
  %2092 = getelementptr inbounds i16* %2091, i64 %2087
  store i16 2, i16* %2092, align 2
  br label %2395

; <label>:2093                                    ; preds = %1984
  br label %2094

; <label>:2094                                    ; preds = %2137, %2093
  %iref.0 = phi i32 [ 0, %2093 ], [ %2138, %2137 ]
  %2095 = load %struct.ImageParameters** @img, align 8
  %2096 = getelementptr inbounds %struct.ImageParameters* %2095, i32 0, i32 79
  %2097 = load i32* %2096, align 4
  %2098 = add nsw i32 0, %1985
  %2099 = sext i32 %2098 to i64
  %2100 = getelementptr inbounds [6 x i32]* @listXsize, i32 0, i64 %2099
  %2101 = load i32* %2100, align 4
  %2102 = icmp slt i32 %2097, %2101
  br i1 %2102, label %2103, label %2107

; <label>:2103                                    ; preds = %2094
  %2104 = load %struct.ImageParameters** @img, align 8
  %2105 = getelementptr inbounds %struct.ImageParameters* %2104, i32 0, i32 79
  %2106 = load i32* %2105, align 4
  br label %2112

; <label>:2107                                    ; preds = %2094
  %2108 = add nsw i32 0, %1985
  %2109 = sext i32 %2108 to i64
  %2110 = getelementptr inbounds [6 x i32]* @listXsize, i32 0, i64 %2109
  %2111 = load i32* %2110, align 4
  br label %2112

; <label>:2112                                    ; preds = %2107, %2103
  %2113 = phi i32 [ %2106, %2103 ], [ %2111, %2107 ]
  %2114 = icmp slt i32 %iref.0, %2113
  br i1 %2114, label %2115, label %2139

; <label>:2115                                    ; preds = %2112
  %2116 = sext i32 %iref.0 to i64
  %2117 = add nsw i32 0, %1985
  %2118 = sext i32 %2117 to i64
  %2119 = load %struct.storable_picture** @enc_picture, align 8
  %2120 = getelementptr inbounds %struct.storable_picture* %2119, i32 0, i32 6
  %2121 = getelementptr inbounds [6 x [33 x i64]]* %2120, i32 0, i64 %2118
  %2122 = getelementptr inbounds [33 x i64]* %2121, i32 0, i64 %2116
  %2123 = load i64* %2122, align 8
  %2124 = sext i32 %1964 to i64
  %2125 = sext i32 %1995 to i64
  %2126 = sext i32 %2006 to i64
  %2127 = getelementptr inbounds i64*** %co_located_ref_id.1, i64 %2126
  %2128 = load i64*** %2127, align 8
  %2129 = getelementptr inbounds i64** %2128, i64 %2125
  %2130 = load i64** %2129, align 8
  %2131 = getelementptr inbounds i64* %2130, i64 %2124
  %2132 = load i64* %2131, align 8
  %2133 = icmp eq i64 %2123, %2132
  br i1 %2133, label %2134, label %2135

; <label>:2134                                    ; preds = %2115
  br label %2139

; <label>:2135                                    ; preds = %2115
  br label %2136

; <label>:2136                                    ; preds = %2135
  br label %2137

; <label>:2137                                    ; preds = %2136
  %2138 = add nsw i32 %iref.0, 1
  br label %2094

; <label>:2139                                    ; preds = %2134, %2112
  %mapped_idx.1 = phi i32 [ %iref.0, %2134 ], [ -135792468, %2112 ]
  %2140 = icmp ne i32 %mapped_idx.1, -135792468
  br i1 %2140, label %2141, label %2371

; <label>:2141                                    ; preds = %2139
  %2142 = sext i32 %mapped_idx.1 to i64
  %2143 = add nsw i32 0, %1985
  %2144 = sext i32 %2143 to i64
  %2145 = load %struct.ImageParameters** @img, align 8
  %2146 = getelementptr inbounds %struct.ImageParameters* %2145, i32 0, i32 83
  %2147 = getelementptr inbounds [6 x [15 x i32]]* %2146, i32 0, i64 %2144
  %2148 = getelementptr inbounds [15 x i32]* %2147, i32 0, i64 %2142
  %2149 = load i32* %2148, align 4
  %2150 = icmp eq i32 %2149, 9999
  br i1 %2150, label %2151, label %2226

; <label>:2151                                    ; preds = %2141
  %2152 = sext i32 %1964 to i64
  %2153 = sext i32 %1995 to i64
  %2154 = sext i32 %2006 to i64
  %2155 = getelementptr inbounds i16**** %co_located_mv.1, i64 %2154
  %2156 = load i16**** %2155, align 8
  %2157 = getelementptr inbounds i16*** %2156, i64 %2153
  %2158 = load i16*** %2157, align 8
  %2159 = getelementptr inbounds i16** %2158, i64 %2152
  %2160 = load i16** %2159, align 8
  %2161 = getelementptr inbounds i16* %2160, i64 0
  %2162 = load i16* %2161, align 2
  %2163 = sext i32 %block_y.1 to i64
  %2164 = sext i32 %block_x.1 to i64
  %2165 = getelementptr inbounds i16****** %3, i64 %2164
  %2166 = load i16****** %2165, align 8
  %2167 = getelementptr inbounds i16***** %2166, i64 %2163
  %2168 = load i16***** %2167, align 8
  %2169 = getelementptr inbounds i16**** %2168, i64 0
  %2170 = load i16**** %2169, align 8
  %2171 = getelementptr inbounds i16*** %2170, i64 0
  %2172 = load i16*** %2171, align 8
  %2173 = getelementptr inbounds i16** %2172, i64 0
  %2174 = load i16** %2173, align 8
  %2175 = getelementptr inbounds i16* %2174, i64 0
  store i16 %2162, i16* %2175, align 2
  %2176 = sext i32 %1964 to i64
  %2177 = sext i32 %1995 to i64
  %2178 = sext i32 %2006 to i64
  %2179 = getelementptr inbounds i16**** %co_located_mv.1, i64 %2178
  %2180 = load i16**** %2179, align 8
  %2181 = getelementptr inbounds i16*** %2180, i64 %2177
  %2182 = load i16*** %2181, align 8
  %2183 = getelementptr inbounds i16** %2182, i64 %2176
  %2184 = load i16** %2183, align 8
  %2185 = getelementptr inbounds i16* %2184, i64 1
  %2186 = load i16* %2185, align 2
  %2187 = sext i32 %block_y.1 to i64
  %2188 = sext i32 %block_x.1 to i64
  %2189 = getelementptr inbounds i16****** %3, i64 %2188
  %2190 = load i16****** %2189, align 8
  %2191 = getelementptr inbounds i16***** %2190, i64 %2187
  %2192 = load i16***** %2191, align 8
  %2193 = getelementptr inbounds i16**** %2192, i64 0
  %2194 = load i16**** %2193, align 8
  %2195 = getelementptr inbounds i16*** %2194, i64 0
  %2196 = load i16*** %2195, align 8
  %2197 = getelementptr inbounds i16** %2196, i64 0
  %2198 = load i16** %2197, align 8
  %2199 = getelementptr inbounds i16* %2198, i64 1
  store i16 %2186, i16* %2199, align 2
  %2200 = sext i32 %block_y.1 to i64
  %2201 = sext i32 %block_x.1 to i64
  %2202 = getelementptr inbounds i16****** %3, i64 %2201
  %2203 = load i16****** %2202, align 8
  %2204 = getelementptr inbounds i16***** %2203, i64 %2200
  %2205 = load i16***** %2204, align 8
  %2206 = getelementptr inbounds i16**** %2205, i64 1
  %2207 = load i16**** %2206, align 8
  %2208 = getelementptr inbounds i16*** %2207, i64 0
  %2209 = load i16*** %2208, align 8
  %2210 = getelementptr inbounds i16** %2209, i64 0
  %2211 = load i16** %2210, align 8
  %2212 = getelementptr inbounds i16* %2211, i64 0
  store i16 0, i16* %2212, align 2
  %2213 = sext i32 %block_y.1 to i64
  %2214 = sext i32 %block_x.1 to i64
  %2215 = getelementptr inbounds i16****** %3, i64 %2214
  %2216 = load i16****** %2215, align 8
  %2217 = getelementptr inbounds i16***** %2216, i64 %2213
  %2218 = load i16***** %2217, align 8
  %2219 = getelementptr inbounds i16**** %2218, i64 1
  %2220 = load i16**** %2219, align 8
  %2221 = getelementptr inbounds i16*** %2220, i64 0
  %2222 = load i16*** %2221, align 8
  %2223 = getelementptr inbounds i16** %2222, i64 0
  %2224 = load i16** %2223, align 8
  %2225 = getelementptr inbounds i16* %2224, i64 1
  store i16 0, i16* %2225, align 2
  br label %2347

; <label>:2226                                    ; preds = %2141
  %2227 = sext i32 %1964 to i64
  %2228 = sext i32 %1995 to i64
  %2229 = sext i32 %2006 to i64
  %2230 = getelementptr inbounds i16**** %co_located_mv.1, i64 %2229
  %2231 = load i16**** %2230, align 8
  %2232 = getelementptr inbounds i16*** %2231, i64 %2228
  %2233 = load i16*** %2232, align 8
  %2234 = getelementptr inbounds i16** %2233, i64 %2227
  %2235 = load i16** %2234, align 8
  %2236 = getelementptr inbounds i16* %2235, i64 0
  %2237 = load i16* %2236, align 2
  %2238 = sext i16 %2237 to i32
  %2239 = mul nsw i32 %2149, %2238
  %2240 = add nsw i32 %2239, 128
  %2241 = ashr i32 %2240, 8
  %2242 = trunc i32 %2241 to i16
  %2243 = sext i32 %mapped_idx.1 to i64
  %2244 = sext i32 %block_y.1 to i64
  %2245 = sext i32 %block_x.1 to i64
  %2246 = getelementptr inbounds i16****** %3, i64 %2245
  %2247 = load i16****** %2246, align 8
  %2248 = getelementptr inbounds i16***** %2247, i64 %2244
  %2249 = load i16***** %2248, align 8
  %2250 = getelementptr inbounds i16**** %2249, i64 0
  %2251 = load i16**** %2250, align 8
  %2252 = getelementptr inbounds i16*** %2251, i64 %2243
  %2253 = load i16*** %2252, align 8
  %2254 = getelementptr inbounds i16** %2253, i64 0
  %2255 = load i16** %2254, align 8
  %2256 = getelementptr inbounds i16* %2255, i64 0
  store i16 %2242, i16* %2256, align 2
  %2257 = sext i32 %1964 to i64
  %2258 = sext i32 %1995 to i64
  %2259 = sext i32 %2006 to i64
  %2260 = getelementptr inbounds i16**** %co_located_mv.1, i64 %2259
  %2261 = load i16**** %2260, align 8
  %2262 = getelementptr inbounds i16*** %2261, i64 %2258
  %2263 = load i16*** %2262, align 8
  %2264 = getelementptr inbounds i16** %2263, i64 %2257
  %2265 = load i16** %2264, align 8
  %2266 = getelementptr inbounds i16* %2265, i64 1
  %2267 = load i16* %2266, align 2
  %2268 = sext i16 %2267 to i32
  %2269 = mul nsw i32 %2149, %2268
  %2270 = add nsw i32 %2269, 128
  %2271 = ashr i32 %2270, 8
  %2272 = trunc i32 %2271 to i16
  %2273 = sext i32 %mapped_idx.1 to i64
  %2274 = sext i32 %block_y.1 to i64
  %2275 = sext i32 %block_x.1 to i64
  %2276 = getelementptr inbounds i16****** %3, i64 %2275
  %2277 = load i16****** %2276, align 8
  %2278 = getelementptr inbounds i16***** %2277, i64 %2274
  %2279 = load i16***** %2278, align 8
  %2280 = getelementptr inbounds i16**** %2279, i64 0
  %2281 = load i16**** %2280, align 8
  %2282 = getelementptr inbounds i16*** %2281, i64 %2273
  %2283 = load i16*** %2282, align 8
  %2284 = getelementptr inbounds i16** %2283, i64 0
  %2285 = load i16** %2284, align 8
  %2286 = getelementptr inbounds i16* %2285, i64 1
  store i16 %2272, i16* %2286, align 2
  %2287 = sub nsw i32 %2149, 256
  %2288 = sext i32 %1964 to i64
  %2289 = sext i32 %1995 to i64
  %2290 = sext i32 %2006 to i64
  %2291 = getelementptr inbounds i16**** %co_located_mv.1, i64 %2290
  %2292 = load i16**** %2291, align 8
  %2293 = getelementptr inbounds i16*** %2292, i64 %2289
  %2294 = load i16*** %2293, align 8
  %2295 = getelementptr inbounds i16** %2294, i64 %2288
  %2296 = load i16** %2295, align 8
  %2297 = getelementptr inbounds i16* %2296, i64 0
  %2298 = load i16* %2297, align 2
  %2299 = sext i16 %2298 to i32
  %2300 = mul nsw i32 %2287, %2299
  %2301 = add nsw i32 %2300, 128
  %2302 = ashr i32 %2301, 8
  %2303 = trunc i32 %2302 to i16
  %2304 = sext i32 %block_y.1 to i64
  %2305 = sext i32 %block_x.1 to i64
  %2306 = getelementptr inbounds i16****** %3, i64 %2305
  %2307 = load i16****** %2306, align 8
  %2308 = getelementptr inbounds i16***** %2307, i64 %2304
  %2309 = load i16***** %2308, align 8
  %2310 = getelementptr inbounds i16**** %2309, i64 1
  %2311 = load i16**** %2310, align 8
  %2312 = getelementptr inbounds i16*** %2311, i64 0
  %2313 = load i16*** %2312, align 8
  %2314 = getelementptr inbounds i16** %2313, i64 0
  %2315 = load i16** %2314, align 8
  %2316 = getelementptr inbounds i16* %2315, i64 0
  store i16 %2303, i16* %2316, align 2
  %2317 = sub nsw i32 %2149, 256
  %2318 = sext i32 %1964 to i64
  %2319 = sext i32 %1995 to i64
  %2320 = sext i32 %2006 to i64
  %2321 = getelementptr inbounds i16**** %co_located_mv.1, i64 %2320
  %2322 = load i16**** %2321, align 8
  %2323 = getelementptr inbounds i16*** %2322, i64 %2319
  %2324 = load i16*** %2323, align 8
  %2325 = getelementptr inbounds i16** %2324, i64 %2318
  %2326 = load i16** %2325, align 8
  %2327 = getelementptr inbounds i16* %2326, i64 1
  %2328 = load i16* %2327, align 2
  %2329 = sext i16 %2328 to i32
  %2330 = mul nsw i32 %2317, %2329
  %2331 = add nsw i32 %2330, 128
  %2332 = ashr i32 %2331, 8
  %2333 = trunc i32 %2332 to i16
  %2334 = sext i32 %block_y.1 to i64
  %2335 = sext i32 %block_x.1 to i64
  %2336 = getelementptr inbounds i16****** %3, i64 %2335
  %2337 = load i16****** %2336, align 8
  %2338 = getelementptr inbounds i16***** %2337, i64 %2334
  %2339 = load i16***** %2338, align 8
  %2340 = getelementptr inbounds i16**** %2339, i64 1
  %2341 = load i16**** %2340, align 8
  %2342 = getelementptr inbounds i16*** %2341, i64 0
  %2343 = load i16*** %2342, align 8
  %2344 = getelementptr inbounds i16** %2343, i64 0
  %2345 = load i16** %2344, align 8
  %2346 = getelementptr inbounds i16* %2345, i64 1
  store i16 %2333, i16* %2346, align 2
  br label %2347

; <label>:2347                                    ; preds = %2226, %2151
  %2348 = trunc i32 %mapped_idx.1 to i16
  %2349 = sext i32 %1959 to i64
  %2350 = sext i32 %1990 to i64
  %2351 = load i16**** @direct_ref_idx, align 8
  %2352 = getelementptr inbounds i16*** %2351, i64 0
  %2353 = load i16*** %2352, align 8
  %2354 = getelementptr inbounds i16** %2353, i64 %2350
  %2355 = load i16** %2354, align 8
  %2356 = getelementptr inbounds i16* %2355, i64 %2349
  store i16 %2348, i16* %2356, align 2
  %2357 = sext i32 %1959 to i64
  %2358 = sext i32 %1990 to i64
  %2359 = load i16**** @direct_ref_idx, align 8
  %2360 = getelementptr inbounds i16*** %2359, i64 1
  %2361 = load i16*** %2360, align 8
  %2362 = getelementptr inbounds i16** %2361, i64 %2358
  %2363 = load i16** %2362, align 8
  %2364 = getelementptr inbounds i16* %2363, i64 %2357
  store i16 0, i16* %2364, align 2
  %2365 = sext i32 %1959 to i64
  %2366 = sext i32 %1990 to i64
  %2367 = load i16*** @direct_pdir, align 8
  %2368 = getelementptr inbounds i16** %2367, i64 %2366
  %2369 = load i16** %2368, align 8
  %2370 = getelementptr inbounds i16* %2369, i64 %2365
  store i16 2, i16* %2370, align 2
  br label %2394

; <label>:2371                                    ; preds = %2139
  %2372 = sext i32 %1959 to i64
  %2373 = sext i32 %1990 to i64
  %2374 = load i16**** @direct_ref_idx, align 8
  %2375 = getelementptr inbounds i16*** %2374, i64 0
  %2376 = load i16*** %2375, align 8
  %2377 = getelementptr inbounds i16** %2376, i64 %2373
  %2378 = load i16** %2377, align 8
  %2379 = getelementptr inbounds i16* %2378, i64 %2372
  store i16 -1, i16* %2379, align 2
  %2380 = sext i32 %1959 to i64
  %2381 = sext i32 %1990 to i64
  %2382 = load i16**** @direct_ref_idx, align 8
  %2383 = getelementptr inbounds i16*** %2382, i64 1
  %2384 = load i16*** %2383, align 8
  %2385 = getelementptr inbounds i16** %2384, i64 %2381
  %2386 = load i16** %2385, align 8
  %2387 = getelementptr inbounds i16* %2386, i64 %2380
  store i16 -1, i16* %2387, align 2
  %2388 = sext i32 %1959 to i64
  %2389 = sext i32 %1990 to i64
  %2390 = load i16*** @direct_pdir, align 8
  %2391 = getelementptr inbounds i16** %2390, i64 %2389
  %2392 = load i16** %2391, align 8
  %2393 = getelementptr inbounds i16* %2392, i64 %2388
  store i16 -1, i16* %2393, align 2
  br label %2394

; <label>:2394                                    ; preds = %2371, %2347
  br label %2395

; <label>:2395                                    ; preds = %2394, %2018
  br label %2396

; <label>:2396                                    ; preds = %2395
  %2397 = add nsw i32 %block_x.1, 1
  br label %1965

; <label>:2398                                    ; preds = %1965
  br label %2399

; <label>:2399                                    ; preds = %2398
  %2400 = add nsw i32 %block_y.1, 1
  br label %1952

; <label>:2401                                    ; preds = %1952
  br label %2402

; <label>:2402                                    ; preds = %2401, %1950
  ret void
}

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #3

; Function Attrs: nounwind uwtable
define i32 @sign(i32 %a, i32 %b) #0 {
  %1 = icmp slt i32 %a, 0
  br i1 %1, label %2, label %4

; <label>:2                                       ; preds = %0
  %3 = sub nsw i32 0, %a
  br label %5

; <label>:4                                       ; preds = %0
  br label %5

; <label>:5                                       ; preds = %4, %2
  %6 = phi i32 [ %3, %2 ], [ %a, %4 ]
  %7 = icmp sge i32 %b, 0
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %5
  br label %11

; <label>:9                                       ; preds = %5
  %10 = sub nsw i32 0, %6
  br label %11

; <label>:11                                      ; preds = %9, %8
  %.0 = phi i32 [ %6, %8 ], [ %10, %9 ]
  ret i32 %.0
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { nounwind readnone "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readnone }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.6.2 (tags/RELEASE_362/final)"}
