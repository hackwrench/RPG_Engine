SUB DrawBattleCave
SCREEN 7, 0, 7, 0
LINE (0, 0)-(319, 50), 6, BF
LINE (0, 51)-(319, 199), 6, BF
cntr = 1
FOR lookreal = 50 TO 199
    cntr = cntr + 1
    LINE (0, lookreal + 1)-(319, lookreal + cntr), 14, BF
lookreal = lookreal + cntr
NEXT
END SUB
