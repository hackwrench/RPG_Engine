SUB DrawBattleField
SCREEN 7, 0, 7, 0
LINE (0, 0)-(319, 50), 11, BF
LINE (0, 51)-(319, 199), 2, BF
    cntr = 1
    FOR lookreal = 50 TO 199
      cntr = cntr + 1
      LINE (0, lookreal + 1)-(319, lookreal + cntr), 10, BF
      lookreal = lookreal + cntr
    NEXT
    CIRCLE (160, 50), 25, 14, , 3.15
    LINE (135, 50)-(185, 50), 14
    PAINT (160, 48), 14: cntr = 0
    COLOR 14
    FOR lookreal = 51 TO 76
      cntr = cntr + 1
      LINE (135 + cntr * 4, lookreal + cntr)-(185 - cntr * 4, lookreal + cntr)
      lookreal = lookreal + cntr
    NEXT
END SUB
