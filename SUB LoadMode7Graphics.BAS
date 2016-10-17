SUB LoadMode7Graphics
FOR xcoor = 0 TO 11
    COLOR 14
    PRINT MultiText$("BATTLE7.NAM", xcoor + 1)
    fc% = FileOPEN(MultiText$("BATTLE7.FIL", xcoor + 1), "I")
    SCREEN 7, 0, 5, 0
    DrawGraphic 19, fc%
    CLOSE fc%
    GET (0, 0)-(19, 19), Mode7Bitmap(0, xcoor * 2)
    GET (20, 0)-(39, 19), Mode7Bitmap(0, xcoor * 2 + 1)
    'DO: LOOP UNTIL INKEY$ <> ""
    SCREEN 7, 0, 0, 0
NEXT
END SUB