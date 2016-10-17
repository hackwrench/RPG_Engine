$IF SUBATTACKGLENLIN = 0 THEN
$LET SUBATTACKGLENLIN = 1
'$INCLUDE:'SUB EstablishTarget.BAS'
'BATTLE1 COMBINE
    SUB AttackGlenlin (EnemyTargeted) 'BATTLE1.BAS
    : DIM coverup&
    : CALL EstablishTarget(enemyat%(), EnemyTargeted%)
    : IF EnemyTargeted = 1 THEN
    :   ex = 45: ey = 120
    :   ly = 16: lx = 4
	: END IF
    : IF EnemyTargeted = 2 THEN ex = 120: ey = 120: ly = 16: lx = 15
    : IF EnemyTargeted = 3 THEN ex = 45: ey = 70: ly = 9: lx = 4
    : IF EnemyTargeted = 4 THEN ex = 120: ey = 70: ly = 9: lx = 15

    SCREEN 7, 0, 7, 0
    GET (280, 85)-(299, 104), coverup
    SCREEN 7, 0, 6, 0
    PUT (280, 85), coverup, PSET

    PUT (280, 85), Mode7Bitmap(0, 7), AND
    PUT (280, 85), Mode7Bitmap(0, 6), OR
    PCOPY 6, 3
    FOR xanth = 20 TO 1 STEP -1
    : CIRCLE (ex, ey), xanth, 13
    : CIRCLE (ex, ey), xanth + 1, 12
    : PCOPY 6, 0
    : delay .1
    : PCOPY 3, 6
    NEXT
    PCOPY 3, 0
    PUT (280, 85), coverup, PSET
    PUT (280, 85), Mode7Bitmap(0, 5), AND
    PUT (280, 85), Mode7Bitmap(0, 4), OR
    ERASE coverup
: pdamage = INT(RND(1) * 50) + charstat(2, 3) - 50
    pdamage = pdamage - INT(.75 * etype(enemyat(EnemyTargeted), 3))
    pmiss = INT(RND(1) * 100)
: IF pmiss < 3 THEN pdamage = 0
    SCREEN 7, 0, 0, 0: COLOR 12: LOCATE ly, lx
    IF pdamage < 1 THEN PRINT "Miss!": pdamage = 0 ELSE PRINT pdamage
    SCREEN 7, 0, 6, 0: ehit(EnemyTargeted) = ehit(EnemyTargeted) - pdamage
    IF ehit(EnemyTargeted) < 1 THEN KillEnemy EnemyTargeted
    PCOPY 7, 6: delay 1: PlaceEnemies
    END SUB
$END IF