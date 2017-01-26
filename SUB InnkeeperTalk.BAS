SUB InnkeeperTalk
COLOR 15: LINE (0, 0)-(319, 31), totalback, BF
LINE (0, 31)-(319, 31), 12: LOCATE 1, 1
PRINT "Care to stay the night? It's"
PRINT "only 50 GP."
PRINT "                       (Y/N)"
LOCATE 3, 40: PRINT CHR$(26): PCOPY 2, 0: SLEEP: dmb$ = INKEY$
IF UCASE$(dmb$) = "Y" THEN StayTheNight
PCOPY 5, 2: LOCATE py, px: COLOR 14: PRINT CHR$(1);
COLOR , totalback
END SUB
