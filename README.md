## TinyVM

A simple VM to play with LLVM's MCJIT compiler and exercise a new OSR technique.
```diff
pctips@xubuntu64:~/OSR$ ./tinyvm
Welcome! Enter 'HELP' to show the list of available commands.
TinyVM> help
List of available commands:
--> BEGIN <module_name>
	Type an IR module from stdin. Press CTRL-D when finished.
--> LOAD_IR <file_name>
	Loads an IR module from a given file.
--> LOAD_LIB <file_name>
	Loads the dynamic library at the given path.
--> CFG <function_name>
	Shows a compact view of the CFG of a given function.
--> CFG_FULL <function_name>
	Shows the full CFG (with instructions) of a given function.
--> DUMP <function_name>
	Shows the IR code of a given function.
--> OPT_CFG <function_name>
	Performs a CFG simplification pass over a given function.
--> OPT_FULL <function_name>
	Performs several optimization passes over a given function.
--> REPEAT <iterations> <function call>
	Performs a function call (see next paragraph) repeatedly.
--> TRACK_ASM
	Enable/disable logging of generated x86-64 assembly code.
--> SHOW_ADDR <function_name>
	Shows compiled-code address of a given function (forces compilation!).
--> SHOW_LINE_IDS <function_name>
	Shows by-line IR identifiers for a given function.
--> SHOW_ASM
	Show logged x86-64 assembly code.
--> SHOW_FUNS
	Show function symbols tracked by MCJITHelper.
--> SHOW_MODS
	Show loaded modules and their symbols.
--> VERBOSE
	Enable/disable verbose mode.
--> QUIT
	Exits TinyVM.

The TinyVM command line supports the invocation of loaded functions. Functions
can be invoked as in C, except for the final semi-colon that must not be added.
For the time being, only functions with integer arguments and return values are
supported.

Demo OSR points can be inserted with one of the following commands:
INSERT_OSR <PROB> <COND> OPEN UPDATE IN <F1> AT <P1>
INSERT_OSR <PROB> <COND> OPEN COPY IN <F1> AT <P1> AS <F1'>
INSERT_OSR <PROB> <COND> SLVD UPDATE IN <F1> AT <P1> TO <F2> AT <P2> AS <F2'>
INSERT_OSR <PROB> <COND> SLVD COPY IN <F1> AT <P1> AS <F1'> TO <F2> AT <P2> AS <F2'>

where:
	PROB is either -1 (no branch weight) or an integer in {0, ..., 100}
	COND is either ALWAYS or NEVER
	F1 and F2 are existing functions
	P1 and P2 are locations in F1 and F2 respectively

The command can either update F1 or generate a new function F1' cloning F1 such
that when P1 is reached during the execution, an OSR transition is fired. For
OPEN transitions, the continuation function is generated at run-time. For SLVD
transitions, a function F2' is generated from F2 to resume the execution at P2.

Program locations can be expressed using an LLVM '%name' (including numerical
IDs for anonymous values) or a line ID '$i' reported by SHOW_LINE_IDS. For basic
block locations OSR points are inserted before the first non-PHI instruction.
```
