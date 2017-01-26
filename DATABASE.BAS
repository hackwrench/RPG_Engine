DEFINT A-Z


SUB FileToScreen (FileName$)
DEF SEG = &HA000                           'Load land for some graphics
BLOAD FileName$, 0
END SUB

