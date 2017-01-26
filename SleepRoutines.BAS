SUB CampGround
COLOR 15
LINE (0, 0)-(319, 31), totalback, BF
LINE (0, 31)-(319, 31), 12: LOCATE 1, 1
PRINT "You've stumbled upon a campground."
IF InInventory(18) = 0 THEN
    PRINT "Unfortunately, you don't"
    PRINT "have a tent.": LOCATE 3, 40
    PRINT CHR$(254): PCOPY 2, 0: SLEEP: dmbo$ = INKEY$
ELSE
    PRINT "Would you like to stay for"
    PRINT "the night?           (Y/N)": LOCATE 3, 40
    PRINT CHR$(26): PCOPY 2, 0: SLEEP: dmb$ = INKEY$
    IF UCASE$(dmb$) = "Y" THEN
        curgold = curgold + 50
        CALL AdjustInventory(18, -1)
        StayTheNight
    END IF
    PCOPY 5, 2: LOCATE py, px: COLOR 14: PRINT CHR$(1);
    COLOR , totalback
END IF
END SUB

SUB InnkeeperTalk
COLOR 15: LINE (0, 0)-(319, 31), totalback, BF
LINE (0, 31)-(319, 31), 12: LOCATE 1, 1
PRINT "Care to stay the night? It's"
PRINT "only 50 GP."
PRINT "                       (Y/N)"
LOCATE 3, 40: PRINT CHR$(26): PCOPY 2, 0: SLEEP: dmb$ = INKEY$
IF UCASE$(dmb$) = "Y" THEN
    IF curgold < 50 THEN
        CheapSkate
    ELSE
        StayTheNight
        curgold = curgold - 50
    END IF
END IF
PCOPY 5, 2: LOCATE py, px: COLOR 14: PRINT CHR$(1);
COLOR , totalback
END SUB

SUB inns
SCREEN 9, , 1, 1
CLS
PAINT (1, 1), 1
LOCATE 5, 10
PRINT "Do you want to stay at the inn for"; level%; " Gold (y/n)?";
LINE INPUT a$
    
IF UCASE$(a$) = "Y" AND gold& < level% THEN
    PRINT "Not enough gold!"
    SLEEP
    GOTO jumpo:
END IF
    
    
IF UCASE$(a$) = "Y" AND gold& >= level% THEN
    gold& = gold& - level%
    zzztime
END IF

jumpo:
SCREEN 9, , 0, 0
END SUB

SUB StayTheNight
  SCREEN 7, 0, 4, 0
  CLS
  COLOR , 0
  FOR nonamevar = 1 TO 50
    xag = INT(RND(1) * 3) + 1
    IF xag > 3 THEN xag = 3
    IF xag = 1 THEN COLOR 15
    IF xag = 2 THEN COLOR 7
    IF xag = 3 THEN COLOR 8
    PSET (INT(RND(1) * 319), INT(RND(1) * 199))
  NEXT
  PCOPY 4, 0
  delay 4
  PALETTE 15, 7
  PALETTE 7, 8
  PALETTE 8, 0
  delay 2
  PALETTE 15, 8
  PALETTE 0, 1
  delay 2
  PALETTE 0, 9
  PALETTE 15, 1
  PALETTE 7, 1
  PALETTE 8, 9
  delay 4
  SCREEN 7, 0, 0, 0
  CLS
  SCREEN 7, 0, 4, 0
  CLS
  PALETTE 0, 0
  PALETTE 7, 7
  PALETTE 8, 8
  PALETTE 15, 15
  PALETTE 11, 1
  PALETTE 2, 8
  PALETTE 10, 0
  MCOLOR 11, 0
  FOR waha = 100 TO 50 STEP -1
    LINE (0, 0)-(319, 50), , BF
    CIRCLE (160, waha), 25, 14
    PAINT (160, waha), 14
    LINE (0, 51)-(319, 199), 2, BF
    cntr = 1
    FOR lookreal = 50 TO 199
      cntr = cntr + 1
      LINE (0, lookreal + 1)-(319, lookreal + cntr), 10, BF
      lookreal = lookreal + cntr
    NEXT
    delay .1: PCOPY 4, 0
    IF waha = 75 THEN PALETTE 10, 2: PALETTE 11, 9: PALETTE 2, 8
  NEXT
  FOR ohjeez = 15 TO 1 STEP -1
    PALETTE ohjeez, ohjeez
  NEXT
  cntr = 0
  COLOR 14
  FOR lookreal = 51 TO 76
    cntr = cntr + 1
    LINE (135 + cntr * 4, lookreal + cntr)-(185 - cntr * 4, lookreal + cntr)
    lookreal = lookreal + cntr
  NEXT
  PCOPY 4, 0: delay 4
PartyHPRestored
PartyMPRestored
CLS
 SCREEN 7, 0, 2, 0
END SUB

SUB zzztime
SCREEN 9, , 1, 1
CLS
PAINT (1, 1), 1
LOCATE 3, 59: PRINT "z"
LOCATE 4, 58: PRINT "z"
LOCATE 5, 57: PRINT "z"
LOCATE 6, 21: PRINT "You are sleeping. Hitpoints restored."
LOCATE 20, 10: PRINT "Press any key"
WaitKey
hp = hpmax
SCREEN 9, , 0, 0
END SUB

