#!/usr/bin/python

import os, subprocess, sys

def create_show_funs_script(ll_folder, ll_filename, script_name):
    script_file = open(script_name, "w")
    script_file.write("LOAD_IR "+ll_folder+"/"+ll_filename+"\n")
    script_file.write("SHOW FUNS\n")
    script_file.write("QUIT\n")
    script_file.close()
    return

def run_tinyvm_script(ll_folder, ll_filename, script_name, log_name):
    cmd = ['./tinyvm', script_name]
    out_file = open(log_name, "w")
    p = subprocess.Popen(cmd, stderr=out_file)
    p.wait()
    return

def process_show_funs_log(log_name):
    in_file = open(log_name, "r")
    lines = in_file.readlines()
    num_lines = len(lines)
    index = 0
    # skip header
    while index < num_lines:
        index = index + 1
        if "[Currently active functions]" in lines[index-1]:
            break
    if index == num_lines:
        print("Error while parsing log file for SHOW FUNS!")
        exit(1)
    # collect function symbols into a list and return it
    functions = []
    while index < num_lines:
        if "TinyVM>" in lines[index]:
            break
        tmp = [x for x in lines[index].split(" ")]
        if len(tmp) != 2:
            print("Error while parsing log file for SHOW FUNS!")
            exit(1)
        functions.append(tmp[0])
        index = index + 1
    if index == num_lines:
        print("Error while parsing log file for SHOW FUNS!")
        exit(1)
    in_file.close()
    return functions

def create_recovery_script(ll_folder, ll_filename, fun_name, script_name):
    script_file = open(script_name, "w")
    script_file.write("LOAD_IR "+ll_folder+"/"+ll_filename+"\n")
    script_file.write("OPT_SSA "+fun_name+"\n") # construct SSA form
    script_file.write("DEBUG PARSE "+fun_name+"\n")
    script_file.write("DEBUG STRIP "+ll_filename+"\n")
    script_file.write("CLONE_FUN "+fun_name+" AS optfun\n")
    script_file.write("OPT optfun ADCE ConstProp EarlyCSE SCCP LICM Sink\n")
    script_file.write("MAPS UPDATE "+fun_name+" optfun\n")
    script_file.write("COMP_CODE STRATEGY 1\n")
    script_file.write("DEBUG RECOVERY "+fun_name+" FROM optfun\n")
    script_file.write("QUIT\n")
    script_file.close()
    return


if len(sys.argv) != 2:
    print("Syntax: " + sys.argv[0] + " <IR_folder>")
    exit(1)

IR_folder = sys.argv[1]
IR_files = []

# construct list of IR files to process
for IR_file in os.listdir(IR_folder):
    if IR_file.endswith(".ll"):
        IR_files.append(IR_file)

# for each IR file, find defined functions and process them
for IR_file in IR_files:
    print(IR_file)
    script_name = "tmp.tvm"
    log_name = "tmp.log"
    create_show_funs_script(IR_folder, IR_file, script_name)
    run_tinyvm_script(IR_folder, IR_file, script_name, log_name)
    functions = process_show_funs_log(log_name)
    for fun_name in functions:
        print(fun_name)
        create_recovery_script(IR_folder, IR_file, fun_name, script_name)
        run_tinyvm_script(IR_folder, IR_file, script_name, log_name)
