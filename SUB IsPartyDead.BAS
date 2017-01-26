SUB IsPartyDead
  FOR ga = 1 TO 3
    IF CurHP(ga) > 0 THEN EXIT SUB
  NEXT
  COLOR 15
  LINE (0, 0)-(319, 31), 0, BF
  LINE (0, 31)-(319, 31), 12
  LOCATE 1, 1
  PRINT "NOTICE: you are dead. The enemies"
  PRINT "devour your body. Have a"
  PRINT "nice day!"
  LOCATE 3, 40
  PRINT CHR$(254)
  PCOPY 6, 0
  dmb$ = GetKeyPress
  SYSTEM
END SUB