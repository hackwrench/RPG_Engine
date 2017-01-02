SUB AttackKyta (EnemyTargeted)
  DIM coverup(140) AS INTEGER
  CALL EstablishTarget(enemyat%(), EnemyTargeted%)

  IF EnemyTargeted = 1 THEN
    ex = 55: ey = 120
    lx = 4: ly = 16
  END IF
  IF EnemyTargeted = 2 THEN
    ex = 130: ey = 120
    lx = 15: ly = 16
  END IF
  IF EnemyTargeted = 3 THEN
    ex = 55: ey = 70
    lx = 4: ly = 9
  END IF
  IF EnemyTargeted = 4 THEN ex = 130: ey = 70: ly = 9: lx = 15

  SCREEN 7, 0, 7, 0
  GET (280, 60)-(299, 79), coverup
  SCREEN 7, 0, 6, 0
  PUT (280, 60), coverup, PSET


  PUT (280, 60), Mode7Bitmap(0, 3), AND
  PUT (280, 60), Mode7Bitmap(0, 2), OR
  PCOPY 6, 3
  FOR xanth = 1 TO 20
    PCOPY 3, 6
    LINE (ex, ey)-(ex - xanth, ey), 12
    LINE (ex, ey - 1)-(ex - xanth, ey - 1), 4
    LINE (ex, ey + 1)-(ex - xanth, ey + 1), 4
    PCOPY 6, 0
    delay .05
  NEXT
  ex = ex - 20
  FOR xanth = 19 TO 1 STEP -1
    PCOPY 3, 6
    LINE (ex, ey)-(ex + xanth, ey), 12
    LINE (ex, ey - 1)-(ex + xanth, ey - 1), 4
    LINE (ex, ey + 1)-(ex + xanth, ey + 1), 4
    PCOPY 6, 0
    delay .05
  NEXT
PCOPY 3, 0
PCOPY 3, 6: PUT (280, 60), coverup, PSET
PUT (280, 60), Mode7Bitmap(0, 1), AND: PUT (280, 60), Mode7Bitmap(0, 0), OR: ERASE coverup
pdamage = INT(RND(1) * 50) + charstat(1, 3) - 50
pdamage = pdamage - INT(.75 * etype(enemyat(EnemyTargeted), 3))
pmiss = INT(RND(1) * 100): IF pmiss < 3 THEN pdamage = 0
SCREEN 7, 0, 0, 0: COLOR 12: LOCATE ly, lx
IF pdamage < 1 THEN PRINT "Miss!": pdamage = 0 ELSE PRINT pdamage
SCREEN 7, 0, 6, 0: ehit(EnemyTargeted) = ehit(EnemyTargeted) - pdamage
IF ehit(EnemyTargeted) < 1 THEN KillEnemy EnemyTargeted
PCOPY 7, 6: delay 1: PlaceEnemies
END SUB
