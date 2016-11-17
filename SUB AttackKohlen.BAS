$IF SUBATTACKKohlen = 0 THEN
$LET SUBATTACKKohlen = 1
'$INCLUDE:'SUB EstablishTarget.BAS'
SUB AttackKohlen (EnemyTargeted)
    DIM coverup(140)
    CALL EstablishTarget(enemyat%(), EnemyTargeted)
    IF EnemyTargeted = 1 THEN ex = 50: ey = 120: ly = 16: lx = 4
    IF EnemyTargeted = 2 THEN ex = 125: ey = 120: ly = 16: lx = 15
    IF EnemyTargeted = 3 THEN ex = 50: ey = 70: ly = 9: lx = 4
    IF EnemyTargeted = 4 THEN ex = 125: ey = 70: ly = 9: lx = 15

    SCREEN 7, 0, 7, 0
    GET (280, 110)-(299, 129), coverup
    SCREEN 7, 0, 6, 0
    PUT (280, 110), coverup, PSET
    PUT (280, 110), Mode7Bitmap(0, 11), AND
    PUT (280, 110), Mode7Bitmap(0, 10), OR
    PCOPY 6, 3
    AttackKohlenAnim1(ex, ey)
PCOPY 3, 6: PCOPY 3, 0
PUT (280, 110), coverup, PSET
PUT (280, 110), Mode7Bitmap(0, 9), AND
PUT (280, 110), Mode7Bitmap(0, 8), OR
ERASE coverup: pdamage = INT(RND(1) * 50) + charstat(3, 3) - 50
pdamage = pdamage - INT(.75 * etype(enemyat(EnemyTargeted), 3))
pmiss = INT(RND(1) * 100): IF pmiss < 3 THEN pdamage = 0
SCREEN 7, 0, 0, 0: COLOR 12: LOCATE ly, lx
IF pdamage < 1 THEN PRINT "Miss!": pdamage = 0 ELSE PRINT pdamage
SCREEN 7, 0, 6, 0: ehit(EnemyTargeted) = ehit(EnemyTargeted) - pdamage
IF ehit(EnemyTargeted) < 1 THEN KillEnemy EnemyTargeted
PCOPY 7, 6: delay 1: PlaceEnemies
END SUB

END SUB

SUB AttackKohlenAnim1(ex AS INTEGER, ey AS INTEGER)
FOR xanth = 1 TO 20
$IF OLDPAGEMECH = 1
  PCOPY 3, 6
$END IF
  PUT (ex - xanth, ey), Bangm, AND
  PUT (ex - xanth, ey), Bang1, OR
$IF OLDPAGEMECH = 1
PCOPY 6, 0
$END IF
delay .1
NEXT
END SUB

$END IF
