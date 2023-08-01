DECLARE SUB SetBlock (X$)
DEFINT A-Z

'OPEN "BNEWGAME.TAB " FOR BINARY AS 1
OPEN "BTLDEMO.TAB " FOR BINARY AS 1

DIM TempBuf AS STRING * 256
 TempBuf = STRING$(256, 0)
 PUT 1, , TempBuf'Writeout an empty table
 SetBlock "H"
 SetBlock "T"
 SetBlock "O"
 'SetBlock "A"'not in TLDEMO
 SetBlock "M"
 SetBlock "5"
 SetBlock "6"
 SetBlock "7"
 SetBlock "8"
 SetBlock "f"
 SetBlock "F"
 SetBlock "g"
 SetBlock "≤"
 SetBlock ""
 SetBlock "Ò"
 SetBlock "€"
 SetBlock ""
 SetBlock "˜"
 SetBlock "ˆ"
 SetBlock "ı"
 SetBlock "Ç"
 SetBlock "("
 SetBlock "Å"
 SetBlock ""
 SetBlock "{"
 SetBlock "|"
 SetBlock "*"
 SetBlock " "
 SetBlock "Ã"
 SetBlock "œ"
 SetBlock "—"
 SetBlock "“"
 SetBlock "”"
 SetBlock "Ï"
 SetBlock "„"
 SetBlock "‰"
 SetBlock "Â"
 SetBlock "Ê"

'Thomas Lipshultz Demo
SetBlock (CHR$(49))
SetBlock (CHR$(50))
SetBlock (CHR$(51))
SetBlock (CHR$(52))
SetBlock (CHR$(53))
SetBlock CHR$(54)
SetBlock CHR$(55)
SetBlock "Q"
SetBlock "K"
SetBlock "I"
SetBlock "W"
SetBlock "x"
SetBlock "a"
SetBlock "b"
SetBlock "c"
SetBlock "d"
SetBlock "v"
SetBlock "V"
SetBlock "X"

CLOSE

SUB SetBlock (X$)
    SEEK 1, ASC(X$) + 1
    R$ = CHR$(255)
    PUT 1, , R$
END SUB

