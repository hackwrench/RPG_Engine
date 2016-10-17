DEFINT A-Z
'$DYNAMIC

DECLARE SUB ReplacePlayer ()
DECLARE SUB LoadExchange (FileName$)
DECLARE SUB LoadTalk (FileName$)
DECLARE FUNCTION FileOPEN% (FileName$, Mode$)

DECLARE SUB DoBox ()
DECLARE SUB Epilogue ()
DECLARE SUB EnsueBattle ()
DECLARE SUB SetBattle (batnum%, enum%)
DECLARE SUB delay (DelTime!)

REDIM SHARED Talk$(1 TO 1)
REDIM SHARED Exchange%(1 TO 1, 1 TO 1)

SUB LoadExchange (FileName$)
    fc% = FileOPEN(FileName$, "B")
    GET fc%, , Exchanges%
    REDIM Exchange%(1 TO 2, 1 TO Exchanges%)
    FOR i = 1 TO Exchanges%
      FOR j = 1 TO 2
      GET fc%, , Exchange%(j, i)
    NEXT: NEXT
    CLOSE fc%
END SUB

SUB LoadTalk (FileName$)
    fc% = FileOPEN(FileName$, "I")
    INPUT #fc%, a%
    REDIM Talk$(1 TO a%)
    FOR i = 1 TO a%
      LINE INPUT #fc, a$
      Talk$(i) = a$
    NEXT
    CLOSE fc%
END SUB

SUB TalkKing
    COLOR 15
    LINE (0, 0)-(319, 31), totalback, BF
    LINE (0, 31)-(319, 31), 12
    FOR cba = 0 TO 1
      FOR abc = 1 TO 3
        LOCATE abc, 1
        PRINT Talk$(Exchange(2, 11) + cba * 3 + abc - 1)
     NEXT
     LOCATE 3, 40
    IF cba = 1 THEN
    PRINT CHR$(26)
    PCOPY 2, 0
    SLEEP
    dmb$ = INKEY$
    PCOPY 5, 2
    ReplacePlayer
    PCOPY 2, 0
    delay 1
    COLOR 13
    LOCATE 4, 37
    PRINT CHR$(2)
    LOCATE 5, 36
    PRINT CHR$(2)
    LOCATE 5, 38
    PRINT CHR$(2)
    LOCATE 6, 37
    PRINT CHR$(2)
    PCOPY 2, 0
    delay 3
    COLOR 15
    LINE (0, 0)-(319, 31), totalback, BF
    LINE (0, 31)-(319, 31), 12
    LOCATE 1, 1
    FOR abc = 0 TO 2
      PRINT Talk$(Exchange(2, 13) + abc)
    NEXT
    LOCATE 3, 40
    PRINT CHR$(254)
    PCOPY 2, 0
    SLEEP
    dmbo$ = INKEY$
    FOR whoohoo = 1 TO 4
      SetBattle whoohoo, 5
    NEXT
    cannotrun = 1
    EnsueBattle
    SCREEN 7, 0, 0, 0
    CLS
    Epilogue
    EXIT SUB
END IF
IF cba = 0 THEN
PRINT CHR$(26): PCOPY 2, 0: SLEEP: dmb$ = INKEY$
LINE (0, 0)-(319, 31), totalback, BF
LINE (0, 31)-(319, 31), 12
END IF
NEXT
END SUB

SUB TalkQueen
    CALL DoBox

FOR cba = 0 TO 1
FOR abc = 1 TO 3
LOCATE abc, 1
PRINT Talk$(Exchange%(2, 8) + abc - 1 + cba * 3)
NEXT
LOCATE 3, 40
IF cba = 1 THEN PRINT CHR$(254): PCOPY 2, 0: SLEEP: dmb$ = INKEY$
IF cba = 0 THEN
PRINT CHR$(26): PCOPY 2, 0: SLEEP: dmb$ = INKEY$
LINE (0, 0)-(319, 31), totalback, BF
LINE (0, 31)-(319, 31), 12
END IF
NEXT
END SUB

SUB TalkVillager (vlgnum)
  CALL DoBox
  FOR abc = 1 TO Exchange%(1, vlgnum)
  LOCATE abc, 1
  PRINT Talk$(Exchange%(2, vlgnum) + abc - 1)
  NEXT
  LOCATE 3, 40
  PRINT CHR$(254)
PCOPY 2, 0 'Copys text to screen in mode 7
SLEEP
dmb$ = INKEY$
END SUB

