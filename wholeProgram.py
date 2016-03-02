#!/usr/bin/python

import os, subprocess, sys

def create_show_funs_script(ll_folder, ll_filename, script_name):
    script_file = open(script_name, "w")
    script_file.write("LOAD_IR "+ll_folder+"/"+ll_filename+"\n")
    script_file.write("SHOW FUNS\n")
    script_file.write("QUIT\n")
    script_file.close()

def run_tinyvm_script(ll_folder, ll_filename, script_name, log_name):
    cmd = ['./tinyvm', script_name]
    out_file = open(log_name, "w")
    p = subprocess.Popen(cmd, stderr=out_file)
    p.wait()
    if p.returncode != 0:
        print("TinyVM crashed! Check "+log_name+" or run "+script_name+" again")
        exit(1)

def process_show_funs_log(log_name):
    def error_and_exit():
        print("Error while parsing log file for SHOW FUNS!")
        exit(1)
    in_file = open(log_name, "r")
    lines = in_file.readlines()
    num_lines = len(lines)
    index = 0
    # skip header
    while index < num_lines:
        index = index + 1
        if "[Currently active functions]" in lines[index-1]:
            break
        if "TinyVM> No functions are present." in lines[index-1]:
            return []
    if index == num_lines:
        error_and_exit()
    # collect function symbols into a list and return it
    functions = []
    while index < num_lines:
        if "TinyVM>" in lines[index]:
            break
        tmp = [x for x in lines[index].split(" ")]
        if len(tmp) != 2:
            error_and_exit()
        functions.append(tmp[0])
        index = index + 1
    if index == num_lines:
        error_and_exit()
    in_file.close()
    return functions

def create_recovery_script(ll_folder, ll_filename, fun_name, strategy, script_name):
    script_file = open(script_name, "w")
    script_file.write("LOAD_IR "+ll_folder+"/"+ll_filename+"\n")
    script_file.write("OPT_SSA "+fun_name+"\n") # construct SSA form
    script_file.write("DEBUG PARSE "+fun_name+"\n")
    script_file.write("DEBUG STRIP "+ll_filename+"\n")
    script_file.write("CLONE_FUN "+fun_name+" AS optfun\n")
    script_file.write("OPT optfun ADCE ConstProp EarlyCSE SCCP LICM Sink\n")
    script_file.write("MAPS UPDATE "+fun_name+" optfun\n")
    script_file.write("COMP_CODE STRATEGY "+strategy+"\n")
    script_file.write("DEBUG RECOVERY "+fun_name+" FROM optfun\n")
    script_file.write("QUIT\n")
    script_file.close()

class logEntry:
    def __init__(self):
        self.fun_name = ""
        ## code manipulations
        self.added_inst = 0
        self.deleted_inst = 0
        self.hoisted_inst = 0
        self.sunk_inst = 0
        self.rauw_I = 0
        self.rauw_C = 0
        self.rauw_A = 0
        ## recoverability info
        self.inst_orig = 0
        self.phi_orig = 0
        self.inst_opt = 0
        self.phi_opt = 0
        self.deopt_candidates = 0
        self.deopt_src_locs = 0
        self.deopt_src_locs_with_dead = 0
        self.tot_dead_user_vars = 0
        self.tot_rec_dead_user_vars = 0
        self.avg_rec_ratio = 0
        self.min_rec_ratio = 0
        self.max_rec_ratio = 0
        # next 3 fields were normalized against deopt_src_locs_with_dead
        self.avg_dead_user_vars = 0
        self.min_dead_user_vars = 0
        self.max_dead_user_vars = 0
        # dead available values to maintain
        self.dead_avail_values = 0

    def dump_to_file(self, module_name, out_file):
        out_file.write(module_name+"\t")
        out_file.write(self.fun_name+"\t")
        out_file.write(self.added_inst+"\t")
        out_file.write(self.deleted_inst+"\t")
        out_file.write(self.hoisted_inst+"\t")
        out_file.write(self.sunk_inst+"\t")
        out_file.write(self.rauw_I+"\t")
        out_file.write(self.rauw_C+"\t")
        out_file.write(self.rauw_A+"\t")
        out_file.write(self.inst_orig+"\t")
        out_file.write(self.phi_orig+"\t")
        out_file.write(self.inst_opt+"\t")
        out_file.write(self.phi_opt+"\t")
        out_file.write(self.deopt_candidates+"\t")
        out_file.write(self.deopt_src_locs+"\t")
        out_file.write(self.deopt_src_locs_with_dead+"\t")
        out_file.write(self.tot_dead_user_vars+"\t")
        out_file.write(self.tot_rec_dead_user_vars+"\t")
        out_file.write(self.avg_rec_ratio+"\t")
        out_file.write(self.min_rec_ratio+"\t")
        out_file.write(self.max_rec_ratio+"\t")
        out_file.write(self.avg_dead_user_vars+"\t")
        out_file.write(self.min_dead_user_vars+"\t")
        out_file.write(self.max_dead_user_vars+"\t")
        out_file.write(self.dead_avail_values+"\n")
        print("Entry written for "+self.fun_name+" ["+module_name+"]")

def process_recovery_log(log_name):
    def error_and_exit():
        print("Error while parsing log file for DEBUG RECOVERY!")
        exit(1)
    in_file = open(log_name, "r")
    lines = in_file.readlines()
    num_lines = len(lines)
    index = 0

    # skip header
    while index < num_lines:
        index = index + 1
        if "TinyVM> Nothing to do for" in lines[index-1]:
            break
    if index == num_lines:
        error_and_exit()

    # collect statistics into a logEntry object and return it
    log_entry = logEntry()

    # process CodeMapper info first
    if index + 6 >= num_lines:
        error_and_exit()
    tmp = [x for x in lines[index].strip().split(" ")]
    log_entry.added_inst = tmp[2]
    tmp = [x for x in lines[index+1].strip().split(" ")]
    log_entry.deleted_inst = tmp[2]
    tmp = [x for x in lines[index+2].strip().split(" ")]
    log_entry.hoisted_inst = tmp[2]
    tmp = [x for x in lines[index+3].strip().split(" ")]
    log_entry.sunk_inst = tmp[2]
    tmp = [x for x in lines[index+4].strip().split(" ")]
    log_entry.rauw_I = tmp[2]
    tmp = [x for x in lines[index+5].strip().split(" ")]
    log_entry.rauw_C = tmp[2]
    tmp = [x for x in lines[index+6].strip().split(" ")]
    log_entry.rauw_A = tmp[2]

    index = index + 6

    # skip lines in between
    while index < num_lines:
        index = index + 1
        if "Entry for log file:" in lines[index-1]:
            break
    if index == num_lines:
        error_and_exit()

    # process recoverability info
    tmp = [x for x in lines[index].strip().split("\t")]
    if len(tmp) != 17:
        error_and_exit()
    log_entry.fun_name = tmp[0]
    log_entry.inst_orig = tmp[1]
    log_entry.phi_orig = tmp[2]
    log_entry.inst_opt = tmp[3]
    log_entry.phi_opt = tmp[4]
    log_entry.deopt_candidates = tmp[5]
    log_entry.deopt_src_locs = tmp[6]
    log_entry.deopt_src_locs_with_dead = tmp[7]
    log_entry.tot_dead_user_vars = tmp[8]
    log_entry.tot_rec_dead_user_vars = tmp[9]
    log_entry.avg_rec_ratio = tmp[10]
    log_entry.min_rec_ratio = tmp[11]
    log_entry.max_rec_ratio = tmp[12]
    log_entry.avg_dead_user_vars = tmp[13]
    log_entry.min_dead_user_vars = tmp[14]
    log_entry.max_dead_user_vars = tmp[15]
    log_entry.dead_avail_values = tmp[16]

    in_file.close()
    return log_entry

# script starts here!
if len(sys.argv) != 3 and len(sys.argv) != 4:
    print("Syntax: " + sys.argv[0] + " <IR_folder> <out_file.tsv> [<strategy>]")
    exit(1)

IR_folder = sys.argv[1]
tsv_file_name = sys.argv[2]
IR_files = []
BC_strategy = 1

if len(sys.argv) == 4:
    BC_strategy = sys.argv[3]

# construct list of IR files to process
for IR_file in os.listdir(IR_folder):
    if IR_file.endswith(".ll"):
        IR_files.append(IR_file)

# for each IR file, find defined functions and process them
tsv_file = open(tsv_file_name, "w")

for IR_file in IR_files:
    print("Processing "+IR_file+" now...")
    script_name = "tmp.tvm"
    log_name = "tmp.log"
    create_show_funs_script(IR_folder, IR_file, script_name)
    run_tinyvm_script(IR_folder, IR_file, script_name, log_name)
    functions = process_show_funs_log(log_name)
    if len(functions) == 0:
        print("Module "+IR_file+" does not contain any function!")
        continue
    for fun_name in functions:
        create_recovery_script(IR_folder, IR_file, fun_name, BC_strategy, script_name)
        run_tinyvm_script(IR_folder, IR_file, script_name, log_name)
        log_entry = process_recovery_log(log_name)
        log_entry.dump_to_file(IR_file, tsv_file)

# clean up
os.remove(script_name)
os.remove(log_name)
tsv_file.close()
