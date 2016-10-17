FUNCTION MultiText$ (FileName$, Temp&)
fc% = FileOPEN(FileName$, "I")
LINE INPUT #fc%, TempT$
Items& = VAL(TempT$)
FOR i& = 1 TO Temp&
    LINE INPUT #fc%, TempT$
NEXT
MultiText$ = TempT$
CLOSE fc%
END FUNCTION
