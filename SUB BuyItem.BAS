SUB BuyItem
StartofBuyingSub:
COLOR 15
LINE (0, 0)-(319, 199), 1, BF
LINE (0, 0)-(319, 199), 12, B
LINE (0, 31)-(319, 31), 12
LOCATE 2, 3
PRINT "OK, whaddaya want?"
REDIM itmno(5)
itmno(1) = 6
itmno(2) = 7
itmno(3) = 8
itmno(4) = 15
itmno(5) = 17
FOR gab = 1 TO 5
    COLOR 14
    LOCATE gab + 9, 12
    PRINT ItemName$(itmno(gab))
    COLOR 15
    LOCATE gab + 9, 30
    PRINT "GP"; price&(itmno(gab));
NEXT
PCOPY 2, 1
: mychc = 1
: DO
: PCOPY 1, 2
: COLOR 15
    LOCATE mychc + 9, 10
: PRINT CHR$(26)
: PCOPY 2, 0
    ii$ = GetKeyPress
    SELECT CASE ii$
        CASE CHR$(0) + CHR$(72), CHR$(0) + CHR$(75):
            mychc = mychc - 1
: IF mychc = 0 THEN mychc = 5
        CASE CHR$(0) + CHR$(77), CHR$(0) + CHR$(80):
            mychc = mychc + 1
: IF mychc = 6 THEN mychc = 1
        CASE CHR$(27):
 ii$ = CHR$(13)
: mychc = 6
    END SELECT
LOOP UNTIL ii$ = CHR$(13)
IF mychc = 6 THEN ERASE itmno
: EXIT SUB
IF curgold < price&(itmno(mychc)) THEN
    cannotrun = 1: COLOR , totalback: CheapSkate: EXIT SUB
END IF
LOCATE 2, 3: PRINT "You sure you want it? (Y/N)"
PCOPY 2, 0: DO: ii$ = INKEY$: LOOP UNTIL ii$ <> ""
IF UCASE$(ii$) = "Y" THEN
    curgold = curgold - price&(itmno(mychc))
 
    IF InInventory(itmno(mychc)) <> 99 THEN
        CALL AdjustInventory(itmno(mychc), 1)
    END IF

    LOCATE 2, 3: PRINT "Sold!                         "
    PCOPY 2, 0: delay 1
ELSE
    GOTO StartofBuyingSub
END IF
ERASE itmno
END SUB
