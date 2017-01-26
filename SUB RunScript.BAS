SUB RunScript (File1$, File2$)
fc% = FileOPEN(File1$, "B")
CurrentResorce$ = File2$
DO
    GET fc%, , Instruction%
    SELECT CASE Instruction%
        CASE 1
            LoadTextArray CurrentResorce$, InitFileName$()
        
            CurrInitFileName% = 1
        CASE 2
            ShowList InitFileName$(CurrInitFileName%)
        CASE 3
            ERASE InitFileName$
            CLOSE fc%
            EXIT SUB
    END SELECT
LOOP
END SUB
