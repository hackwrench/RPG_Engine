SUB ChooseBeam
: LINE (235, 150)-(314, 177), 0, BF
: LINE (235, 150)-(314, 177), 12, B
: COLOR 15
: FOR gha = 3 TO 5 'Inventory slotst that contain beams
    IF InInventory(gha) > 0 THEN
        LOCATE 19 + gha - 2, 31
        PRINT ItemName$(gha)
        ja = ja + 1
    END IF
: NEXT

: PCOPY 6, 3
: LOCATE 20, 31
: COLOR 12
: PRINT ItemName$(3)
: mychoice = 1
: DO
    v$ = INKEY$
    SELECT CASE v$
        CASE CHR$(0) + CHR$(72), CHR$(0) + CHR$(75):
            IF mychoice = 1 THEN mychoice = ja ELSE mychoice = mychoice - 1
            PCOPY 3, 6 'clears the last selection... overkill?
            LOCATE 19 + mychoice, 31
            PRINT ItemName$(mychoice + 2)
        CASE CHR$(0) + CHR$(77), CHR$(0) + CHR$(80):
            IF mychoice = ja THEN mychoice = 1 ELSE mychoice = mychoice + 1
            PCOPY 3, 6
            LOCATE 19 + mychoice, 31
            PRINT ItemName$(mychoice + 2)
        CASE CHR$(13)
            chosen(1, 2) = mychoice: EXIT SUB
        CASE CHR$(27):
            chosen(1, 2) = 0
            mychoice = 0
            GOTO returntopreviousmenu1
    END SELECT
    PCOPY 6, 0
: LOOP
returntopreviousmenu1:
: PCOPY 4, 6
: PCOPY 6, 0
: ErrorLevel = 1
END SUB
