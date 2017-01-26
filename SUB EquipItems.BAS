SUB EquipItems
  CLS
  LINE (0, 0)-(319, 199), 1, BF
LINE (0, 0)-(319, 199), 12, B
LOCATE 2, 3: COLOR 15: PRINT "Equip who?"
COLOR 14
FOR I = 1 TO NumberOfPCs
    LOCATE 14 + I, 17: PRINT HeroName$(I)
NEXT I
LOCATE 18, 17: PRINT "EXIT"
PCOPY 2, 1: mychc = 1
DO
    PCOPY 1, 2
    COLOR 15
    LOCATE mychc + 14, 15
    PRINT CHR$(26)
    PCOPY 2, 0
    ii$ = GetKeyPress
    SELECT CASE ii$
    CASE CHR$(0) + CHR$(72), CHR$(0) + CHR$(75):
      mychc = mychc - 1: IF mychc = 0 THEN mychc = 4
    CASE CHR$(0) + CHR$(77), CHR$(0) + CHR$(80):
      mychc = mychc + 1: IF mychc = 5 THEN mychc = 1
    CASE CHR$(27):
      ii$ = CHR$(13)
      mychc = 4
    END SELECT
LOOP UNTIL ii$ = CHR$(13)
IF mychc = 4 THEN EXIT SUB
mypers = mychc
OnceAgain:
mychc = mypers
CLS
 LINE (0, 0)-(319, 199), 1, BF
LINE (0, 0)-(319, 41), 12, B
COLOR 15: LOCATE 2, 3
PRINT "HAND - ": LOCATE 3, 3: PRINT "BODY - "
LOCATE 7, 3: PRINT "Please choose a weapon:"
Dequip mychc%, 1
Dequip mychc%, 2
COLOR 14
  FOR ha = 1 TO 2
    LOCATE ha + 15, 10
    IF InInventory(canequip(mychc, ha)) > 0 THEN
        PRINT ItemName$(canequip(mychc, ha))
        LOCATE ha + 15, 28
        goby$ = LTRIM$(STR$(power(canequip(mychc, ha), 1)))

        IF LEN(goby$) = 2 THEN goby$ = "0" + goby$
        PRINT goby$
    ELSE
        PRINT "<Nothing>"
    END IF
NEXT
 LOCATE 18, 10: PRINT "<Nothing>"
mypers = mychc
PCOPY 2, 1: mychc = 1
DO
  PCOPY 1, 2: COLOR 15
    LOCATE mychc + 15, 8: PRINT CHR$(26): PCOPY 2, 0
    ii$ = GetKeyPress
    SELECT CASE ii$
    CASE CHR$(0) + CHR$(72), CHR$(0) + CHR$(75):
      mychc = mychc - 1: IF mychc = 0 THEN mychc = 3
    CASE CHR$(0) + CHR$(77), CHR$(0) + CHR$(80):
      mychc = mychc + 1: IF mychc = 4 THEN mychc = 1
    END SELECT
LOOP UNTIL ii$ = CHR$(13)
  LOCATE 2, 8: COLOR 14
IF mychc < 3 AND InInventory(canequip(mypers, mychc)) > 0 THEN
    mc = mychc
    AdjustInventory canequip(mypers, mc), -1
    equip(mypers, 1) = canequip(mypers, mychc)
    charstat(mypers, 3) = power(canequip(mypers, mychc), 1)
    PRINT ItemName$(canequip(mypers, mychc))
ELSE
    equip(mypers, 1) = 0: charstat(mypers, 3) = 0
    PRINT "<Nothing>"
END IF
LINE (0, 42)-(319, 199), 1, BF: COLOR 15
LOCATE 7, 3: PRINT "Please choose an armor:"
COLOR 14
  FOR ha = 3 TO 4
    LOCATE ha + 13, 10
    IF InInventory(canequip(mypers, ha)) > 0 THEN
      PRINT ItemName$(canequip(mypers, ha))
      LOCATE ha + 13, 28
      goby$ = LTRIM$(STR$(power(canequip(mypers, ha), 1)))
      IF LEN(goby$) = 2 THEN goby$ = "0" + goby$
      PRINT goby$
    ELSE
      PRINT "<Nothing>"
    END IF
  NEXT
 LOCATE 18, 10: PRINT "<Nothing>"
PCOPY 2, 1: mychc = 1
DO: PCOPY 1, 2: COLOR 15
    LOCATE mychc + 15, 8: PRINT CHR$(26): PCOPY 2, 0
    ii$ = GetKeyPress
    SELECT CASE ii$
    CASE CHR$(0) + CHR$(72), CHR$(0) + CHR$(75):
      mychc = mychc - 1: IF mychc = 0 THEN mychc = 3
    CASE CHR$(0) + CHR$(77), CHR$(0) + CHR$(80):
      mychc = mychc + 1: IF mychc = 4 THEN mychc = 1
    END SELECT
LOOP UNTIL ii$ = CHR$(13)
  LOCATE 3, 8: COLOR 14
  IF mychc < 3 THEN
    IF InInventory(canequip(mypers, mychc + 2)) > 0 THEN
      mc = mychc + 2
        AdjustInventory canequip(mypers, mc), -1 
        equip(mypers, 2) = canequip(mypers, mc)
        charstat(mypers, 4) = power(canequip(mypers, mc), 1)
        PRINT ItemName$(canequip(mypers, mc))
    ELSE
      equip(mypers, 2) = 0: charstat(mypers, 4) = 0
      PRINT "<Nothing>"
    END IF
  ELSE
    equip(mypers, 2) = 0: charstat(mypers, 4) = 0
    PRINT "<Nothing>"
END IF
LINE (0, 42)-(319, 199), 1, BF
LOCATE 16, 3: PRINT "Is this OK? (Y/N)": PCOPY 2, 0
DO: ii$ = INKEY$: LOOP UNTIL ii$ <> ""
IF UCASE$(ii$) = "Y" THEN EXIT SUB ELSE GOTO OnceAgain
END SUB