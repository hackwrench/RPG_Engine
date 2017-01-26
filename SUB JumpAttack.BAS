SUB JumpAttack (EnemyTargeted) 
  DIM ex(4), ey(4)

  AttackPattern1(ex(), ey())

  DisplayAttackName "Jump"

  EstablishTarget enemyat%(), EnemyTargeted%

  DIM coverup(140) AS INTEGER
  SCREEN 7, 0, 7, 0
  GET (280, 110)-(299, 129), coverup
  SCREEN 7, 0, 6, 0
  PUT (280, 110), coverup, PSET
  PCOPY 6, 3
  FOR bja = 110 TO 0
    PCOPY 3, 6
    PUT (280, bja), Mode7Bitmap(0, 11), AND
    PUT (280, bja), Mode7Bitmap(0, 10), OR
    PCOPY 6, 0
    delay .01
  NEXT
  PCOPY 3, 0
  delay 1
  FOR bja = 0 TO ey(EnemyTargeted)
    PCOPY 3, 6
    PUT (ex(EnemyTargeted), bja), Mode7Bitmap(0, 9), AND
    PUT (ex(EnemyTargeted), bja), Mode7Bitmap(0, 8), OR
    PCOPY 6, 0
    delay .01
  NEXT
  FOR bja = ex(EnemyTargeted) TO 300
    PCOPY 3, 6
    PUT (bja, ey(EnemyTargeted)), Mode7Bitmap(0, 11), AND
    PUT (bja, ey(EnemyTargeted)), Mode7Bitmap(0, 10), OR
    PCOPY 6, 0
    delay .01
  NEXT
  PCOPY 3, 0
  delay 1
  FOR bja = 0 TO 110 STEP 5
    PCOPY 3, 6
    PUT (280, bja), Mode7Bitmap(0, 9), AND
    PUT (280, bja), Mode7Bitmap(0, 8), OR
    PCOPY 6, 0
    delay .05
  NEXT
  PCOPY 6, 3
  DamageEnemy 0, 275
  EnemyTargeted
  SCREEN 7, 0, 6, 0
  PCOPY 7, 6
  delay 1
  PlaceEnemies
  ERASE ex, ey, coverup
END SUB
