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
--> SHOW_ASM
	Show logged x86-64 assembly code.
--> SHOW_FUNS
	Show function symbols tracked by MCJITHelper.
--> SHOW_MODS
	Show loaded modules and their symbols.
--> QUIT
	Exits TinyVM.

The TinyVM command line supports the invocation of loaded functions. Functions can be invoked as in C, except for the final semi-colon that must not be added.
For the time being, only functions with integer arguments and return values are supported.

Demo OSR points can be inserted with one of the following commands:
INSERT_OSR <PROB> <COND> OPEN UPDATE IN <F1> AT <B1>
INSERT_OSR <PROB> <COND> OPEN COPY IN <F1> AT <B1> AS <F1'>
INSERT_OSR <PROB> <COND> FINAL UPDATE IN <F1> AT <B1> TO <F2> AT <B2> AS <F2'>
INSERT_OSR <PROB> <COND> FINAL COPY IN <F1> AT <B1> AS <F1'> TO <F2> AT <B2> AS <F2'>

where:
	PROB is either -1 (no branch weight) or an integer in {0, ..., 100}
	COND is either ALWAYS or NEVER
	F1 and F2 are existing functions
	B1 and B2 are basic block labels in F1 and F2

The command either updates F1 or generates a function F1' cloned from F1 such that when basic block B1 is reached during the execution, an OSR transition is fired. For OPEN transitions, the continuation function will be generated at run-time. For FINAL transitions, function F2' is generated from F2 in order to resume the execution from the beginning of basic block B2.
```
