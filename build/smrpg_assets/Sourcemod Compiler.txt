
Spcomp switches:

URL: https://wiki.alliedmods.net/Spcomp_switches

SourcePawn Compiler 1.9.0.6154
Copyright (c) 1997-2006 ITB CompuPhase
Copyright (c) 2004-2017 AlliedModders LLC
Usage:   spcomp <filename> [filename...] [options]
Options:
        -a       output assembler code
        -c<name> codepage name or number; e.g. 1252 for Windows Latin-1
        -Dpath   active directory path
        -e<name> set name of error file (quiet compile)
        -H<hwnd> window handle to send a notification message on finish
        -h       show included file paths
        -i<name> path for include files
        -l       create list file (preprocess only)
        -o<name> set base name of (P-code) output file
        -O<num>  optimization level (default=-O2)
            0    no optimization
            2    full optimizations
        -p<name> set name of "prefix" file
        -s<num>  skip lines from the input file
        -t<num>  TAB indent size (in character positions, default=8)
        -v<num>  verbosity level; 0=quiet, 1=normal, 2=verbose (default=1)
        -w<num>  disable a specific warning by its number
        -E       treat warnings as errors
        -\       use '\' for escape characters
        -^       use '^' for escape characters
        -;<+/->  require a semicolon to end each statement (default=-)
        sym=val  define constant "sym" with value "val"
        sym=     define constant "sym" with value 0