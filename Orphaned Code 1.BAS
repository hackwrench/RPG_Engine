     
      
    FOR wk = 270 TO 240 STEP -10
      CALL SpellReflectGraphic(wk, ey(EnemyTargeted), .25)
    NEXT

    PCOPY 3, 0
    PCOPY 3, 6
    walled(EnemyTargeted) = 0
    END IF
    CASE 8
      PRINT "Drown"
      PCOPY 6, 0
      delay 1
      PCOPY 3, 0
      PCOPY 3, 6
      SpellDrownGraphic 280, ey(EnemyTargeted)
      IF walled(EnemyTargeted) THEN
        SpellReflect 7, EnemyTargeted
      ELSE
        SpellDrown 280, ey(EnemyTargeted), EnemyTargeted, -1
      END IF
    CASE 9:
      PRINT "Tremor"
      Mode7ShowAndRestore 1
      PCOPY 3, 0
      SpellTremor 280, ey(EnemyTargeted), EnemyTargeted
CASE 10:
DIM mx(4), my(4): mx(1) = 35: my(1) = 110: mx(2) = 110
my(2) = 110: mx(3) = 35: my(3) = 60: mx(4) = 110: my(4) = 60
PRINT "Heal"
Mode7ShowAndRestore 1
PCOPY 3, 0
FOR xarg = -30 TO 10 STEP 2: PCOPY 3, 6
FOR erf = 1 TO 4
IF enemyat(erf) > 0 THEN PUT (mx(erf), my(erf) + xarg), Mode7Bitmap(0, 17), AND
IF enemyat(erf) > 0 THEN PUT (mx(erf), my(erf) + xarg), Mode7Bitmap(0, 16), OR
NEXT: 
PCOPY 6, 0: delay .05: NEXT: PCOPY 3, 6: PCOPY 6, 0
FOR erf = 1 TO 4
IF enemyat(erf) > 0 THEN
DamageEnemy 0, -700, erf: IF erf < 4 THEN delay 1
END IF
NEXT
ERASE mx, my
END SELECT

SCREEN 7, 0, 6, 0: PCOPY 7, 6: delay 1: PlaceEnemies: ERASE ey
END SUB