SUB SpellEnemy (spnum)
  DIM ey(4)
  ey(1) = 60
  ey(2) = 85
  ey(3) = 110
  DO
    EnemyTargeted = INT(RND(1) * 3) + 1
    IF EnemyTargeted = 4 THEN EnemyTargeted = 3
  LOOP UNTIL CurHP(EnemyTargeted) > 0
  PCOPY 6, 3
  LINE (5, 5)-(95, 25), 0, BF
  LINE (5, 5)-(95, 25), 12, B
  LOCATE 2, 2
  COLOR 15
  SELECT CASE spnum
  CASE 4
    PRINT "Fire"
    Mode7ShowAndRestore 1
    PCOPY 3, 0
    SpellFire 280, ey(EnemyTargeted), EnemyTargeted
  CASE 5
    PRINT "Ice"
    Mode7ShowAndRestore 1
    PCOPY 3, 0
    SpellIce 280, ey(EnemyTargeted), EnemyTargeted
  CASE 6
    PRINT "Lightning"
    Mode7ShowAndRestore 1
    PCOPY 3, 0
    IF walled(EnemyTargeted) THEN
      SpellReflect 5, EnemyTargeted
    ELSE
      SpellLightning 280, ey(EnemyTargeted), EnemyTargeted, -1
    END IF
  CASE 7
    disflag = 0
    FOR gah = 1 TO 3
      IF walled(gah) THEN disflag = 1: EnemyTargeted = gah
    NEXT
    IF disflag = 0 THEN
      PRINT "Rage": EnemyAttack 4
    ELSE
      PRINT "Penetrate"
      PCOPY 6, 0
      delay 1
      PCOPY 3, 0

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
    DIM mx(4), my(4): mx(1) = 35: my(1) = 110
    mx(2) = 110: my(2) = 110: mx(3) = 35: my(3) = 60: mx(4) = 110: my(4) = 60
    PRINT "Heal"
    Mode7ShowAndRestore 1
    PCOPY 3, 0
    FOR xarg = -30 TO 10 STEP 2: PCOPY 3, 6
      FOR erf = 1 TO 4
        IF enemyat(erf) > 0 THEN
          PUT (mx(erf), my(erf) + xarg), Mode7Bitmap(0, 17), AND
          PUT (mx(erf), my(erf) + xarg), Mode7Bitmap(0, 16), OR
END IF
    NEXT
PCOPY 6, 0: delay .05: NEXT: PCOPY 3, 6: PCOPY 6, 0
    FOR erf = 1 TO 4
      IF enemyat(erf) > 0 THEN
        DamageEnemy 0, -700, erf: IF erf < 4 THEN delay 1
      END IF
    NEXT
    ERASE mx, my
END SELECT

SCREEN 7, 0, 6, 0
PCOPY 7, 6
delay 1
PlaceEnemies
ERASE ey
END SUB