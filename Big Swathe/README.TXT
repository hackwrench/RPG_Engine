I've combined the data from a few games and am developing
a workable combination

In OBSOLETE, QBASM.ASM contains routines that will run in QuickBASIC's IDE because it contains routines that access variables internal to QuickBASIC's library.
ASM.ASM contains the routines that run in  programs compiled by QuickBASIC.
EDITASM.BAT Loads both using the EDIT.COM that came with Win 95
and then compiles them, and then moves the QBASM.QLB to ASM.QLB
Some of these routines used to  used by the RPG Engine, but are obsolete now that the RPG Engine is to be compiled by QB64.
