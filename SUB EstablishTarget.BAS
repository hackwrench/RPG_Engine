$IF SUBESTABLISHTARGET = 0 THEN
$LET SUBESTABLISHTARGET = 1
SUB EstablishTarget (enemyat%(), EnemyTargeted%)
  FOR yowsa = 1 TO 4
    IF enemyat(EnemyTargeted) = 0 THEN
        IF EnemyTargeted = 4 THEN
            EnemyTargeted = 1
        ELSE
            EnemyTargeted = EnemyTargeted + 1
        END IF
    ELSE
        EXIT FOR
    END IF
  NEXT
END SUB
$ENDIF