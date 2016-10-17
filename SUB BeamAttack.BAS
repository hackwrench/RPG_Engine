SUB BeamAttack (bnum, EnemyTargeted)
    DIM ex(4), ey(4)
    CALL AttackPattern1(ex(), ey())
    CALL DisplayAttackName(ItemName$(bnum + 2))

    CALL EstablishTarget(enemyat%(), EnemyTargeted%)

   DIM coverup(140)
   SCREEN 7, 0, 7, 0
   GET (280, 60)-(299, 79), coverup
   SCREEN 7, 0, 6, 0
   PUT (280, 60), coverup, PSET
   PUT (280, 60), Mode7Bitmap(0, 3), AND
   PUT (280, 60), Mode7Bitmap(0, 2), OR
   PCOPY 6, 3
   SELECT CASE bnum
   CASE 1
     FOR xc = 315 TO ex(EnemyTargeted) STEP -5
       COLOR 12
       PCOPY 3, 6
       LINE (320, ey(EnemyTargeted) + 10)-(xc, ey(EnemyTargeted) + 10)
       COLOR 4
       LINE (320, ey(EnemyTargeted) + 11)-(xc, ey(EnemyTargeted) + 11)
       LINE (320, ey(EnemyTargeted) + 9)-(xc, ey(EnemyTargeted) + 9): PCOPY 6, 0
       delay .05
    NEXT
    FOR xc = 315 TO ex(EnemyTargeted) + 5 STEP -5
       COLOR 12
       PCOPY 3, 6
       LINE (ex(EnemyTargeted), ey(EnemyTargeted) + 10)-(xc, ey(EnemyTargeted) + 10)
       COLOR 4
       LINE (ex(EnemyTargeted), ey(EnemyTargeted) + 11)-(xc, ey(EnemyTargeted) + 11)
       LINE (ex(EnemyTargeted), ey(EnemyTargeted) + 9)-(xc, ey(EnemyTargeted) + 9)
       PUT (ex(EnemyTargeted), ey(EnemyTargeted) + 5), Bangm, AND
       PUT (ex(EnemyTargeted), ey(EnemyTargeted) + 5), Bang1, OR
       PCOPY 6, 0
       delay .05
    NEXT
    PCOPY 3, 6
    PCOPY 3, 0
    DamageEnemy 0, 250, EnemyTargeted
  CASE 2
    ct = 0
    FOR xc = 315 TO ex(EnemyTargeted) STEP -5
     COLOR 12
     PCOPY 3, 6
     IF xc / 3 = xc \ 3 THEN ct = ct + 1
     LINE (320, ey(EnemyTargeted) + 10)-(xc, ey(EnemyTargeted) + 10): COLOR 4
     LINE (320, ey(EnemyTargeted) + 10 + ct)-(xc, ey(EnemyTargeted) + 10 + ct)
     LINE (320, ey(EnemyTargeted) + 10 - ct)-(xc, ey(EnemyTargeted) + 10 - ct)
     PCOPY 6, 0
     delay .05
    NEXT
    FOR xc = 315 TO ex(EnemyTargeted) + 5 STEP -5
      COLOR 12
      PCOPY 3, 6
      IF xc / 3 = xc \ 3 THEN ct = ct - 1
      LINE (ex(EnemyTargeted), ey(EnemyTargeted) + 10)-(xc, ey(EnemyTargeted) + 10): COLOR 4
      LINE (ex(EnemyTargeted), ey(EnemyTargeted) + 10 + ct)-(xc, ey(EnemyTargeted) + 10 + ct)
LINE (ex(EnemyTargeted), ey(EnemyTargeted) + 10 - ct)-(xc, ey(EnemyTargeted) + 10 - ct)
PUT (ex(EnemyTargeted), ey(EnemyTargeted) + 5 - ct), Bangm, AND
PUT (ex(EnemyTargeted), ey(EnemyTargeted) + 5 - ct), Bang1, OR
PUT (ex(EnemyTargeted), ey(EnemyTargeted) + 5 + ct), Bangm, AND
PUT (ex(EnemyTargeted), ey(EnemyTargeted) + 5 + ct), Bang1, OR
PUT (ex(EnemyTargeted), ey(EnemyTargeted) + 5), Bangm, AND
PUT (ex(EnemyTargeted), ey(EnemyTargeted) + 5), Bang1, OR
PCOPY 6, 0
delay .05
NEXT
PCOPY 3, 6
PCOPY 3, 0
DamageEnemy 0, 350, EnemyTargeted
PCOPY 6, 3
delay 1
DamageChar 75, 1
CASE 3:
FOR xc = 315 TO ex(EnemyTargeted) STEP -5: COLOR 14: PCOPY 3, 6
LINE (320, ey(EnemyTargeted) + 10)-(xc, ey(EnemyTargeted) + 10)
LINE (320, ey(EnemyTargeted) + 9)-(xc, ey(EnemyTargeted) + 9), 12
LINE (320, ey(EnemyTargeted) + 11)-(xc, ey(EnemyTargeted) + 11), 12
PCOPY 6, 0: delay .05: NEXT: SCREEN 7, 0, 0, 0
COLOR 14: FOR xc = 1 TO 10
LINE (319, ey(EnemyTargeted) + 10 - xc)-(ex(EnemyTargeted), ey(EnemyTargeted) + 10 - xc)
LINE (319, ey(EnemyTargeted) + 10 + xc)-(ex(EnemyTargeted), ey(EnemyTargeted) + 10 + xc)
delay .1: NEXT: delay .4
LINE (ex(EnemyTargeted), ey(EnemyTargeted))-(319, ey(EnemyTargeted) + 21), 12, BF
delay .5: LINE (ex(EnemyTargeted), ey(EnemyTargeted))-(319, ey(EnemyTargeted) + 21), 4, BF
delay .5: SCREEN 7, 0, 6, 0: PCOPY 3, 0: PCOPY 3, 6
DamageEnemy 0, 450, EnemyTargeted
END SELECT
SCREEN 7, 0, 6, 0: PCOPY 7, 6: delay 1
PlaceEnemies
ERASE ex, ey, coverup
END SUB