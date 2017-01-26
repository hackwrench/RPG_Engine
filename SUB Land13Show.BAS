SUB Land13Show
CLS
PUT (1, 1), Mode13Graphic(0, 4), PSET: PUT (27, 1), Mode13Graphic(0, 5), PSET
PUT (53, 1), Mode13Graphic(0, 6), PSET: PUT (287, 1), Mode13Graphic(0, 13), PSET
PUT (287, 22), Mode13Graphic(0, 23), PSET: PUT (287, 43), Mode13Graphic(0, 35), PSET

PUT (79, 1), Mode13Graphic(0, 7), PSET
PUT (105, 1), Mode13Graphic(0, 8), PSET: PUT (131, 1), Mode13Graphic(0, 9), PSET

PUT (157, 1), Mode13Graphic(0, 1), PSET: PUT (183, 1), Mode13Graphic(0, 2), PSET

PUT (209, 1), Mode13Graphic(0, 10), PSET: PUT (235, 1), Mode13Graphic(0, 11), PSET
PUT (261, 1), Mode13Graphic(0, 12), PSET: PUT (261, 22), Mode13Graphic(0, 3), PSET
PUT (209, 22), Mode13Graphic(0, 21), PSET: PUT (235, 22), Mode13Graphic(0, 22), PSET
PUT (261, 43), Mode13Graphic(0, 34), PSET
PUT (1, 85), Mode13Graphic(0, 48), PSET: PUT (27, 85), Mode13Graphic(0, 49), PSET
PUT (53, 85), Mode13Graphic(0, 50), PSET: PUT (79, 85), Mode13Graphic(0, 51), PSET
PUT (235, 43), Mode13Graphic(0, 33), PSET

PUT (1, 22), Mode13Graphic(0, 0): PUT (27, 22), Mode13Graphic(0, 14), PSET
PUT (53, 22), Mode13Graphic(0, 15), PSET

PUT (79, 22), Mode13Graphic(0, 16), PSET

PUT (105, 22), Mode13Graphic(0, 17), PSET

PUT (131, 22), Mode13Graphic(0, 18), PSET: PUT (157, 22), Mode13Graphic(0, 19), PSET

PUT (183, 22), Mode13Graphic(0, 20), PSET
 
PUT (1, 43), Mode13Graphic(0, 24): PUT (27, 43), Mode13Graphic(0, 25), PSET


PUT (79, 43), Mode13Graphic(0, 27): PUT (105, 43), Mode13Graphic(0, 28), PSET

PUT (131, 43), Mode13Graphic(0, 29): PUT (157, 43), Mode13Graphic(0, 30), PSET
PUT (183, 43), Mode13Graphic(0, 31), PSET

PUT (209, 43), Mode13Graphic(0, 32), PSET

PUT (1, 64), Mode13Graphic(0, 36): PUT (27, 64), Mode13Graphic(0, 37), PSET

PUT (53, 43), Mode13Graphic(0, 26), PSET: PUT (53, 64), Mode13Graphic(0, 38), PSET
PUT (79, 64), Mode13Graphic(0, 39): PUT (105, 64), Mode13Graphic(0, 40), PSET

PUT (131, 64), Mode13Graphic(0, 41)
PUT (157, 64), Mode13Graphic(0, 42): PUT (183, 64), Mode13Graphic(0, 43)
PUT (209, 64), Mode13Graphic(0, 44): PUT (235, 64), Mode13Graphic(0, 45)
PUT (261, 64), Mode13Graphic(0, 46): PUT (287, 64), Mode13Graphic(0, 47)

PUT (105, 85), Mode13Graphic(0, 52): PUT (131, 85), Mode13Graphic(0, 53)

PUT (157, 85), Mode13Graphic(0, 54), PSET: PUT (183, 85), Mode13Graphic(0, 55), PSET
PUT (209, 85), Mode13Graphic(0, 56), PSET: PUT (235, 85), Mode13Graphic(0, 57), PSET

PUT (261, 85), Mode13Graphic(0, 58), PSET: PUT (287, 85), Mode13Graphic(0, 59), PSET



LOCATE 25, 1
PRINT "Press Space to continue";
DO: LOOP UNTIL INKEY$ = " "
CLS


END SUB
