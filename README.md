## TinyVM

A simple VM to play with LLVM's MCJIT compiler and exercise OSR techniques.

> pctips@xubuntu64:~/OSR$ ./tinyvm  
> Welcome! Enter 'HELP' to show the list of available commands.  
> TinyVM> help  
> List of available commands:  
> --> BEGIN <module_name>  
>&nbsp;&nbsp;&nbsp;&nbsp; Type an IR module from stdin. Press CTRL-D when finished.  
> --> LOAD <file_name>  
>&nbsp;&nbsp;&nbsp;&nbsp;	Loads an IR module from a given file.  
> --> CFG <function_name>  
>&nbsp;&nbsp;&nbsp;&nbsp;	Shows a compact view of the CFG of a given function.  
> --> CFG_FULL <function_name>  
>&nbsp;&nbsp;&nbsp;&nbsp;	Shows the full CFG (with instructions) of a given function.  
> --> DUMP <function_name>  
>&nbsp;&nbsp;&nbsp;&nbsp;	Shows the IR code of a given function.  
> --> QUIT  
>&nbsp;&nbsp;&nbsp;&nbsp;	Exits TinyVM.  
>  
> The TinyVM command line supports the invocation of loaded functions. Functions can be invoked as in C, except for the final semi-colon that must not be added.  
> For the time being, only functions with integer arguments and return values are supported.  
>  
> Demo OSR points can be inserted with the following command:  
> --> INSERT_OSR IN <F1> AT <B1> AS <F1'> TO <F2> AT <B2> AS <F2'>  
> where F1 and F2 are existing functions, and B1 and B2 are basic block labels.  
>  
> The command generates a function F1' cloned from F1 such that when basic block B1 is reached during the execution of F1', an OSR transition to F2' is fired.  
>  
> Function F2' is generated from F2 in order to resume the execution from the beginning of basic block B2, and values for live variables in F1' at B1 are transferred as arguments for the call.  
> TinyVM>   
