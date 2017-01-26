DEFINT A-Z
DECLARE FUNCTION FileOPEN% (FileName$, Mode$)


DIM UseString AS STRING * 256
Temp%=FileOPEN("USES1.TAB", "B"


FOR i = 0 TO 255
    if teble
NEXT i

FUNCTION FileOPEN% (FileName$, Mode$)
    FileOPEN% = FREEFILE
    OPEN Mode$, FREEFILE, FileName$
END FUNCTION

SUB LoadUseString (FileName$)
    Temp% = FileOpen(FileName$, "B")
    GET Temp%, , UseString
    CLOSE Temp%
END SUB

