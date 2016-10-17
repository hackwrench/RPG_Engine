DO
    PCOPY 4, 6
    whassis$ = INKEY$
    CIRCLE (ep(tgt, 1) + 10, ep(tgt, 2) + 10), 20
    LINE (ep(tgt, 1) + 10, ep(tgt, 2) - 12)-(ep(tgt, 1) + 10, ep(tgt, 2) + 32)
    LINE (ep(tgt, 1) - 12, ep(tgt, 2) + 10)-(ep(tgt, 1) + 32, ep(tgt, 2) + 10)
    SELECT CASE whassis$
        CASE CHR$(0) + CHR$(72), CHR$(0) + CHR$(75)
            IF tgt = 1 THEN
                tgt = 3
            ELSE
                tgt = tgt - 1
            END IF
        CASE CHR$(0) + CHR$(77), CHR$(0) + CHR$(80)
            IF tgt = 3 THEN tgt = 1 ELSE tgt = tgt + 1
        CASE CHR$(13)
            chosen(sabro, 3) = tgt: ERASE ep: PCOPY 4, 6: PCOPY 6, 0: EXIT SUB
        CASE CHR$(27):
 ErrorLevel = 1
ERASE ep
PCOPY 4, 6
PCOPY 6, 0
EXIT SUB
    END SELECT
PCOPY 6, 0
LOOP
END SUB



