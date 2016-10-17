SUB Battle7Init
    
    FOR xxx = 1 TO 4
      enemyat(xxx) = 0
      IF xxx < 4 THEN walled(xxx) = 0
    NEXT
    curgold = 1000
    mapnumber = 1
    px = 9
    py = 19
    NoEnemies% = -1
    SCREEN 7, 0, 0, 0
    CLS
    curmp = 100
    COLOR 15
    PRINT "Loading graphics..."
    RANDOMIZE TIMER
    cannotrun = 0
    
    FOR xcoor = 0 TO 11
      COLOR 14
      PRINT MultiText$("BATTLE7.NAM", xcoor + 1)
      OPEN MultiText$("BATTLE7.FIL", xcoor + 1) FOR INPUT AS #1
      SCREEN 7, 0, 5, 0
      DrawGraphic 19
      CLOSE
      GET (0, 0)-(19, 19), Mode7Bitmap(0, xcoor * 2)
      GET (20, 0)-(39, 19), Mode7Bitmap(0, xcoor * 2 + 1)
      'DO: LOOP UNTIL INKEY$ <> ""
      SCREEN 7, 0, 0, 0
    NEXT
    COLOR 14
    OPEN "FIRE.IDG" FOR INPUT AS #1
    PRINT "'Fire Spell'"
    SCREEN 7, 0, 5, 0
    DrawGraphic 9
    CLOSE
    GET (0, 0)-(9, 9), Bang1
    GET (10, 0)-(19, 9), Bangm
    SCREEN 7, 0, 0, 0

OPEN "TLDEMO.GAS" FOR BINARY AS 1
FOR xabc = 1 TO 18: GET 1, , inven(xabc): NEXT
CLOSE

FOR xa = 1 TO 3: FOR bc = 1 TO 2: READ equip(xa, bc): NEXT: NEXT
FOR xa = 1 TO 3: FOR bc = 1 TO 4: READ canequip(xa, bc): NEXT: NEXT
FOR xa = 1 TO 3: FOR bc = 1 TO 4: READ charstat(xa, bc): NEXT: NEXT
FOR xabc = 1 TO 3: curhp(xabc) = charstat(xabc, 1): NEXT
FOR xa = 1 TO 2: FOR bc = 6 TO 17: READ power(bc, xa): NEXT: NEXT

FOR xabc = 1 TO 12: READ spellsknown(xabc): NEXT
FOR xabc = 1 TO 12: READ mpused(xabc): NEXT
FOR xabc = 2 TO 5: READ maglearn(xabc): NEXT
FOR xabc = 1 TO 12: READ magdata(xabc, 1): READ magdata(xabc, 2): NEXT
FOR xabc = 1 TO 5: READ weak(xabc): READ strn(xabc): NEXT
FOR xa = 1 TO 5
   FOR bc = 1 TO 13
     READ etype(xa, bc)
   NEXT
NEXT
FOR xabc = 1 TO 4: READ levelup(xabc): NEXT
FOR xabc = 1 TO 3: curexp(xabc) = 1: curlev(xabc) = 1: NEXT

OPEN "TLDEMO.NMB" FOR INPUT AS 1
FOR xabc = 1 TO 18:  LINE INPUT #1, ItemName$(xabc): NEXT
FOR xabc = 1 TO 12:  LINE INPUT #1, mn$(xabc): NEXT
FOR xabc = 1 TO 5:  LINE INPUT #1, ename$(xabc): NEXT
CLOSE 1

SCREEN 7, 0, 0, 0
CLS
END SUB