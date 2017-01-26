DEFINT A-Z
'$DYNAMIC
DECLARE SUB BeamAttack1Step2 (x%, y%, Mod1%)

DECLARE SUB WaitKey ()
DECLARE SUB battle2 ()
DECLARE SUB ModPal ()
DECLARE SUB MapRenderScreen ()
DECLARE SUB TestForLevelUp ()

DECLARE SUB SetBattleBackground (NewBattleBackground%)

DECLARE FUNCTION SizeOfTable% (Table%, Tables() AS INTEGER, Index() AS INTEGER)
DECLARE SUB ImportMenus (FileName$, MenuIndex() AS INTEGER, MenuTable%())
DECLARE SUB RandBattle (batnum1%, batnum2%)
DECLARE SUB EnsueBattle ()
DECLARE SUB SetBattle (batnum%, enum%)

DECLARE SUB LoadItemNames (fc%)
DECLARE SUB InitInventory ()

DECLARE SUB LoadInventory (fc%)

DECLARE SUB SetPlayerLoc (x%, y%)

DECLARE FUNCTION FileOPEN% (FileName$, Mode$)

DECLARE FUNCTION ZeroDelimitedInt$ (Value%, Length%)

DECLARE FUNCTION MultiText$ (FileName$, Temp&)

DECLARE FUNCTION ItemNameIfPossess$ (Item%)

DECLARE SUB SpellLightningGraphic (ex%, ey%)

DECLARE SUB TargetChar (sabro%)

DECLARE SUB SpellFireGraphic (ex%, ey%)

DECLARE SUB AdjustInventory (Item%, Amount%)
DECLARE SUB Dequip (Character%, Hand%)

DECLARE FUNCTION ItemName$ (Item%)
DECLARE FUNCTION InInventory% (Item%)

DECLARE SUB MCOLOR (forecolor%, backcolor%)
DECLARE SUB EquipItems ()

DECLARE SUB KillEnemy (EnemyTargeted%)
DECLARE SUB delay (DelTime!)
DECLARE SUB CharHPList (Char%, x%, y%)
DECLARE SUB Mode7ShowAndRestore (DelTime!)
DECLARE SUB DisplayAttackName (attack$)
DECLARE SUB MsgRunDisabled ()
DECLARE SUB MsgRunSuccess ()
DECLARE SUB MsgRunFail ()
DECLARE SUB Mosaic (Siz%)
DECLARE SUB WinBattle ()
DECLARE SUB IsPartyDead ()
DECLARE SUB BattleMenu (sabro%)
DECLARE SUB SpellLightning (ex%, ey%, EnemyTargeted%, TargetIsChar%)
DECLARE SUB SpellReflectGraphic (ex%, ey%, Speed!)
DECLARE SUB SpellDrownGraphic (ex%, ey%)
DECLARE SUB SpellFire (ex%, ey%, EnemyTargeted%)
DECLARE SUB SpellIce (ex%, ey%, EnemyTargeted%)
DECLARE SUB SpellDrown (ex%, ey%, EnemyTargeted%, TargetIsChar%)
DECLARE SUB DamageChar (tdmg%, EnemyTargeted%)
DECLARE SUB NotEnoughMP ()
DECLARE SUB DrawBattleField ()
DECLARE SUB DrawBattleCave ()
DECLARE SUB DrawGraphic (endcor%, fc%)
DECLARE FUNCTION EnemiesRemaining% (enemyat%())
DECLARE SUB AttackPattern1 (ex%(), ey%())
DECLARE SUB CharAttack (sabro%)
DECLARE SUB EnemyAttack (enum%)
DECLARE SUB EnemyGo (sabro%)
DECLARE SUB SpellEnemy (spnum%)
DECLARE SUB SpellReflect (spnum%, EnemyTargeted%)
DECLARE SUB SpellTremor (ex%, ey%, EnemyTargeted%)
DECLARE SUB DamageEnemy (elm%, tdmg%, EnemyTargeted%)
DECLARE SUB AttackKyta (EnemyTargeted%)
DECLARE SUB BeamAttack (bnum%, EnemyTargeted%)
DECLARE SUB JumpAttack (EnemyTargeted%)
DECLARE SUB TossStar (snum%, EnemyTargeted%)
DECLARE SUB SpellCast (spnum%, EnemyTargeted%)
DECLARE SUB RunAway ()
DECLARE SUB AttackGlenlin (EnemyTargeted%)
DECLARE SUB AttackKohlen (EnemyTargeted%)
DECLARE SUB EstablishTarget (enemyat%(), EnemyTargeted%)
DECLARE SUB PlaceEnemies ()

DECLARE SUB MultiPrint (Text$(), x%, y%)
DECLARE SUB TargetEnemy2 (sabro%)
DECLARE SUB KillChar (EnemyTargeted%)
DECLARE SUB TargetEnemy1 (sabro%)
DECLARE SUB ChooseBeam ()
DECLARE SUB ChooseMagic ()
DECLARE SUB ChooseStar ()

CONST False = 0
CONST TRUE = NOT False

COMMON SHARED /DebugData/ DebugNoEnemies%, DebugRun%, DebugPos%, DebugEnemiesAnyway%
'          4 times to level up
DIM SHARED levelup(1 TO 4) AS LONG
DIM SHARED Bang1(70), Bangm(70)

DIM SHARED enemyat(1 TO 4), gitm(4), ehit(4), etype(5, 13)
DIM SHARED HeroName$(1 TO 3), charstat(3, 4), CurHP(3), curlev(3), curexp(1 TO 3) AS LONG
DIM SHARED canequip(3, 4), equip(3, 2)
DIM SHARED power(6 TO 17), walled(4)

DIM SHARED weak(5), strn(5), maglearn(2 TO 5), magdata(12, 2), spellsknown(12)
DIM SHARED chosen(3, 3), totalexp
DIM SHARED Mode7Bitmap(121, 0 TO 23)
DIM SHARED mn$(12), mpused(12)
DIM SHARED ename$(5)
DIM SHARED cannotrun
DIM SHARED NoEnemies%

DIM SHARED BattleMenuList(0 TO 0) AS STRING
DIM SHARED IndividualBattleMenuTable(1 TO 1)
DIM SHARED IndividualBattleMenuIndex(0 TO 0)
DIM SHARED BattleBackground
DIM SHARED monst1%(233)

DIM SHARED hp AS INTEGER, mp AS INTEGER, hpmax AS INTEGER
DIM SHARED mpmax AS INTEGER, chrexp%, level%, attack%




SUB AttackKohlen (EnemyTargeted)
    DIM coverup%(140)
    CALL EstablishTarget(enemyat%(), EnemyTargeted%)
    IF EnemyTargeted = 1 THEN ex = 50: ey = 120: ly = 16: lx = 4
    IF EnemyTargeted = 2 THEN ex = 125: ey = 120: ly = 16: lx = 15
    IF EnemyTargeted = 3 THEN ex = 50: ey = 70: ly = 9: lx = 4
    IF EnemyTargeted = 4 THEN ex = 125: ey = 70: ly = 9: lx = 15
  
    SCREEN 7, 0, 7, 0
    GET (280, 110)-(299, 129), coverup%
    SCREEN 7, 0, 6, 0
     PUT (280, 110), coverup%, PSET
     PUT (280, 110), Mode7Bitmap(0, 11), AND
     PUT (280, 110), Mode7Bitmap(0, 10), OR
     PCOPY 6, 3
FOR xanth = 1 TO 20: PCOPY 3, 6
PUT (ex - xanth, ey), Bangm, AND: PUT (ex - xanth, ey), Bang1, OR
PCOPY 6, 0: delay .1: NEXT: PCOPY 3, 6: PCOPY 3, 0
PUT (280, 110), coverup%, PSET
PUT (280, 110), Mode7Bitmap(0, 9), AND: PUT (280, 110), Mode7Bitmap(0, 8), OR
ERASE coverup%: pdamage = INT(RND(1) * 50) + charstat(3, 3) - 50
pdamage = pdamage - INT(.75 * etype(enemyat(EnemyTargeted), 3))
pmiss = INT(RND(1) * 100): IF pmiss < 3 THEN pdamage = 0
SCREEN 7, 0, 0, 0: COLOR 12: LOCATE ly, lx
IF pdamage < 1 THEN PRINT "Miss!": pdamage = 0 ELSE PRINT pdamage
SCREEN 7, 0, 6, 0: ehit(EnemyTargeted) = ehit(EnemyTargeted) - pdamage
IF ehit(EnemyTargeted) < 1 THEN KillEnemy EnemyTargeted
PCOPY 7, 6: delay 1: PlaceEnemies
END SUB

SUB AttackKyta (EnemyTargeted)
    DIM coverup%(140)
    CALL EstablishTarget(enemyat%(), EnemyTargeted%)
  
    IF EnemyTargeted = 1 THEN ex = 55: ey = 120: ly = 16: lx = 4
    IF EnemyTargeted = 2 THEN ex = 130: ey = 120: ly = 16: lx = 15
    IF EnemyTargeted = 3 THEN ex = 55: ey = 70: ly = 9: lx = 4
    IF EnemyTargeted = 4 THEN ex = 130: ey = 70: ly = 9: lx = 15
   
  
    SCREEN 7, 0, 7, 0
    GET (280, 60)-(299, 79), coverup%
    SCREEN 7, 0, 6, 0
    PUT (280, 60), coverup%, PSET
  
  
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
FOR xanth = 19 TO 1 STEP -1: PCOPY 3, 6
LINE (ex, ey)-(ex + xanth, ey), 12
LINE (ex, ey - 1)-(ex + xanth, ey - 1), 4
LINE (ex, ey + 1)-(ex + xanth, ey + 1), 4
PCOPY 6, 0: delay .05: NEXT: PCOPY 3, 0
PCOPY 3, 6: PUT (280, 60), coverup%, PSET
PUT (280, 60), Mode7Bitmap(0, 1), AND: PUT (280, 60), Mode7Bitmap(0, 0), OR: ERASE coverup%
pdamage = INT(RND(1) * 50) + charstat(1, 3) - 50
pdamage = pdamage - INT(.75 * etype(enemyat(EnemyTargeted), 3))
pmiss = INT(RND(1) * 100): IF pmiss < 3 THEN pdamage = 0
SCREEN 7, 0, 0, 0: COLOR 12: LOCATE ly, lx
IF pdamage < 1 THEN PRINT "Miss!": pdamage = 0 ELSE PRINT pdamage
SCREEN 7, 0, 6, 0: ehit(EnemyTargeted) = ehit(EnemyTargeted) - pdamage
IF ehit(EnemyTargeted) < 1 THEN KillEnemy EnemyTargeted
PCOPY 7, 6: delay 1: PlaceEnemies
END SUB

SUB AttackPattern1 (ex(), ey())
    ex(1) = 35: ey(1) = 110: ex(2) = 110: ey(2) = 110: ex(3) = 35
    ey(3) = 60: ex(4) = 110: ey(4) = 60
END SUB

SUB battle2
    SCREEN 9, , 1, 1
    CLS
    PUT (290, 150), monst1%
    ehp = 15
    eneexp% = 10
    egold% = 5 + level%
    LOCATE 5, 30: PRINT "Encountered " + "slime"
    LOCATE 15, 10: PRINT "Hit points:"; hp; "/"; hpmax
    LOCATE 15, 50: PRINT "Enemy hit points:"; ehp; "/ 15"
    LOCATE 10, 50: PRINT "(a) to attack, (r) to run"
    DO WHILE ehp > 0
     a$ = ""
     DO UNTIL a$ <> ""
     a$ = INKEY$
     LOOP
     IF UCASE$(a$) = "A" THEN
       ehp = ehp - INT(RND * 12) - attack%
       LOCATE 15, 50: PRINT "Enemy hit points:"; ehp;
       LOCATE 15, 71: PRINT "/ 15"
       hp = hp - INT(RND * 10)
       LOCATE 15, 10: PRINT "Hit points:"; hp; "/"; hpmax
       IF hp < 1 THEN
         CLS
         PRINT "Ouch! You are dead!"
         END
       END IF
     END IF

     IF UCASE$(a$) = "R" THEN
       GOTO runs
     END IF
    LOOP
    chrexp% = chrexp% + eneexp%
    gold& = gold& + egold%
    TestForLevelUp

runs:
    SCREEN 9, , 0, 0
END SUB

REM $STATIC
SUB Battle2Init
DIM monst1%(233)
   
fc% = FileOPEN("slime.mns", "I")
FOR x = 1 TO 30
FOR y = 1 TO 29
INPUT #fc%, a
PSET (x, y), a
NEXT y
NEXT x
GET (1, 1)-(30, 29), monst1%
CLOSE #fc%

hp = 50
hpmax = 50
level% = 2
chrexp% = 4
END SUB

REM $DYNAMIC
SUB Battle7Init
REDIM levelup(1 TO 4)  AS LONG
REDIM Bang1(70), Bangm(70)

REDIM enemyat(1 TO 4), gitm(4), ehit(1 TO 4), etype(5, 13)
REDIM HeroName$(1 TO 3), charstat(3, 4), CurHP(3), curlev(3), curexp(1 TO 3)  AS LONG
REDIM canequip(3, 4), equip(3, 2)
REDIM power(6 TO 17), walled(1 TO 4)

REDIM weak(5), strn(5), maglearn(2 TO 5), magdata(12, 2), spellsknown(12)
REDIM chosen(3, 3)
DIM Mode7Bitmap(121, 0 TO 23)
REDIM mn$(12), mpused(12)
REDIM ename$(5)
   
    InitInventory
    'ON ERROR GOTO 0
    FOR xxx = 1 TO 4
      enemyat(xxx) = 0
      IF xxx < 4 THEN walled(xxx) = 0
    NEXT
    curgold = 1000
    SetBattleBackground 1
    CALL SetPlayerLoc(9, 19)
    NoEnemies% = -1
    SCREEN 7, 0, 0, 0
    CLS
    curmp = 100
    COLOR 15
    PRINT "Loading graphics..."
    RANDOMIZE TIMER
    cannotrun = 0
   
    FOR xcoor = 0 TO 11
      COLOR 14
      PRINT MultiText$("BATTLE7.NAM", xcoor + 1)
      fc% = FileOPEN(MultiText$("BATTLE7.FIL", xcoor + 1), "I")
      SCREEN 7, 0, 5, 0
      DrawGraphic 19, fc%
      CLOSE fc%
      GET (0, 0)-(19, 19), Mode7Bitmap(0, xcoor * 2)
      GET (20, 0)-(39, 19), Mode7Bitmap(0, xcoor * 2 + 1)
      'DO: LOOP UNTIL INKEY$ <> ""
      SCREEN 7, 0, 0, 0
    NEXT
    COLOR 14
    fc% = FileOPEN("FIRE.IDG", "I")
    PRINT "'Fire Spell'"
    SCREEN 7, 0, 5, 0
    DrawGraphic 9, fc%
    CLOSE fc%
    GET (0, 0)-(9, 9), Bang1
    GET (10, 0)-(19, 9), Bangm
    SCREEN 7, 0, 0, 0

fc% = FileOPEN("TLDEMO.GAS", "B")
    CALL LoadInventory(fc%)
CLOSE fc%

fc% = FileOPEN("EQUIP.DAT", "B")
FOR xa = 1 TO 3
  FOR bc = 1 TO 2
 
  GET fc%, , equip(xa, bc)
NEXT
NEXT
CLOSE fc%
FOR xa = 1 TO 3: FOR bc = 1 TO 4: READ canequip(xa, bc): NEXT: NEXT
FOR xa = 1 TO 3: FOR bc = 1 TO 4: READ charstat(xa, bc): NEXT: NEXT
FOR xabc = 1 TO 3: CurHP(xabc) = charstat(xabc, 1): NEXT

 FOR bc = 6 TO 17: READ power(bc): NEXT

FOR xabc = 1 TO 12: READ spellsknown(xabc): NEXT
FOR xabc = 1 TO 12: READ mpused(xabc): NEXT
FOR xabc = 2 TO 5: READ maglearn(xabc): NEXT
FOR xabc = 1 TO 12: READ magdata(xabc, 1): READ magdata(xabc, 2): NEXT
FOR xabc = 1 TO 5: READ weak(xabc): READ strn(xabc): NEXT
FOR xa = 1 TO 5
   FOR bc = 1 TO 13
     READ etype(xa, bc)
   NEXT
NEXT

    fc% = FileOPEN("TLDEMO.LUP", "B")
    FOR xabc = 1 TO 4
      GET fc%, , levelup(xabc)
    NEXT
    CLOSE fc%
   
FOR xabc = 1 TO 3: curexp(xabc) = 1: curlev(xabc) = 1: NEXT

 fc% = FileOPEN("TLDEMO.NMB", "I")
 CALL LoadItemNames(fc%)
FOR xabc = 1 TO 12:  LINE INPUT #fc%, mn$(xabc): NEXT
FOR xabc = 1 TO 5:  LINE INPUT #fc%, ename$(xabc): NEXT
FOR xabc = 1 TO 3: LINE INPUT #fc%, HeroName$(xabc): NEXT
CLOSE fc%

SCREEN 7, 0, 0, 0
CLS
END SUB

SUB BattleMenu (sabro)
    DIM StoreChoice$(1 TO 4)
    'SCREEN 7, 0, 0, 0
    LINE (250, 150)-(300, 185), 0, BF
    LINE (250, 150)-(300, 185), 12, B

    FOR I = 1 TO SizeOfTable(sabro, IndividualBattleMenuTable(), IndividualBattleMenuIndex())
      'STR$(IndividualBattleMenuIndex(IndividualBattleMenuTable(Sabro) + I - 1)) +
      StoreChoice$(I) = BattleMenuList(IndividualBattleMenuIndex(IndividualBattleMenuTable(sabro) + I - 1))
    NEXT I

    COLOR 15
    MultiPrint StoreChoice$(), 33, 20
    PCOPY 6, 3
    LOCATE 20, 33
    COLOR 13
    PRINT StoreChoice$(1)
   
    CurrChoice = 1
    DO
      v$ = INKEY$
      SELECT CASE v$
      CASE CHR$(0) + CHR$(72), CHR$(0) + CHR$(75)
        DO'This actally allows for any space to be blank
          IF CurrChoice = 1 THEN
            CurrChoice = UBOUND(StoreChoice$)
          ELSE
            CurrChoice = CurrChoice - 1
          END IF
          IF StoreChoice$(CurrChoice) <> "" THEN EXIT DO
        LOOP
        PCOPY 3, 6
        LOCATE 19 + CurrChoice, 33
        PRINT StoreChoice$(CurrChoice)
      CASE CHR$(0) + CHR$(77), CHR$(0) + CHR$(80)
        DO
          IF CurrChoice = UBOUND(StoreChoice$) THEN
            CurrChoice = 1
          ELSE
            CurrChoice = CurrChoice + 1
          END IF
          IF StoreChoice$(CurrChoice) <> "" THEN EXIT DO
        LOOP
          PCOPY 3, 6
          LOCATE 19 + CurrChoice, 33
          PRINT StoreChoice$(CurrChoice)
      CASE CHR$(13)
         chosen(sabro, 1) = CurrChoice: GOTO nextmenuifany
      CASE CHR$(27)
         chosen(sabro, 1) = 0: CurrChoice = 0: GOTO nextmenuifany
      END SELECT
     PCOPY 6, 0
LOOP

nextmenuifany:
saab = sabro: ERASE StoreChoice$
IF CurrChoice = 1 THEN TargetEnemy1 sabro
IF sabro = 1 AND CurrChoice = 2 THEN
ChooseBeam
IF chosen(1, 2) > 0 THEN TargetEnemy1 sabro
END IF
IF sabro = 2 AND CurrChoice = 2 THEN ChooseMagic: TargetEnemy2 saab
IF sabro = 3 AND CurrChoice = 2 THEN TargetEnemy1 sabro
  IF sabro = 3 AND CurrChoice = 3 THEN
    ChooseStar
    IF chosen(3, 2) > 0 THEN TargetEnemy1 sabro
   END IF
   PCOPY 4, 6
   PCOPY 6, 0
   delay .5
END SUB

REM $STATIC
SUB BattleMenuInit
    REDIM BattleMenuList(0 TO 6) AS STRING
    fc% = FileOPEN("BATMNU.LST", "I")
    FOR I% = 1 TO 6
      LINE INPUT #fc%, BattleMenuList(I%)
    NEXT
    CLOSE fc%
  
   ImportMenus "BATTLE1.MNU", IndividualBattleMenuIndex(), IndividualBattleMenuTable()
END SUB

REM $DYNAMIC
SUB BeamAttack (bnum, EnemyTargeted)
    DIM ex(4), ey(4)
    CALL AttackPattern1(ex(), ey())
    CALL DisplayAttackName(ItemName$(bnum + 2))
  
    CALL EstablishTarget(enemyat%(), EnemyTargeted%)
 
   DIM coverup%(140)
   SCREEN 7, 0, 7, 0
   GET (280, 60)-(299, 79), coverup%
   SCREEN 7, 0, 6, 0
   PUT (280, 60), coverup%, PSET
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
    FOR xc% = 315 TO ex(EnemyTargeted) + 5 STEP -5
       CALL BeamAttack1Step2(ex(EnemyTargeted), ey(EnemyTargeted), xc%)
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
ERASE ex, ey, coverup%
END SUB

REM $STATIC
SUB BeamAttack1Step2 (x%, y%, Mod1%)
       COLOR 12
       PCOPY 3, 6
       LINE (x%, y% + 10)-(Mod1%, y% + 10)
       COLOR 4
       LINE (x%, y% + 11)-(xc, y% + 11)
       LINE (x%, y% + 9)-(xc, y% + 9)
       PUT (x%, y% + 5), Bangm, AND
       PUT (x%, y% + 5), Bang1, OR
       PCOPY 6, 0
END SUB

REM $DYNAMIC
SUB CharAttack (sabro)
    IF EnemiesRemaining(enemyat()) = 0 THEN EXIT SUB
    SELECT CASE sabro
    CASE 1
      IF chosen(1, 1) = 1 THEN AttackKyta chosen(1, 3)
      IF chosen(1, 1) = 2 THEN BeamAttack chosen(1, 2), chosen(1, 3)
      IF chosen(1, 1) = 3 THEN RunAway
    CASE 2
      IF chosen(2, 1) = 1 THEN AttackGlenlin chosen(2, 3)
      IF chosen(2, 1) = 2 THEN
        curmp = curmp - mpused(spnum)
        SpellCast chosen(2, 2), chosen(2, 3)
      END IF
IF chosen(2, 1) = 3 THEN RunAway
CASE 3:
IF chosen(3, 1) = 1 THEN AttackKohlen chosen(3, 3)
IF chosen(3, 1) = 2 THEN JumpAttack chosen(3, 3)
IF chosen(3, 1) = 3 THEN TossStar chosen(3, 2), chosen(3, 3)
IF chosen(3, 1) = 4 THEN RunAway
END SELECT
END SUB

SUB CharHPList (Char%, x%, y%)
    LOCATE y%, x%
    PRINT HeroName$(Char%)
    LOCATE y%, x% + 8
    PRINT "HP ";
    jnum$ = ZeroDelimitedInt$(CurHP(Char%), 4)
    knum$ = ZeroDelimitedInt$(charstat(Char%, 1), 4)
    PRINT jnum$; "/"; knum$;
END SUB

SUB CheckForBattle (a$)
    IF DebugEnemiesAnyway% THEN NoEnemies = 0
    IF BattleBackground = 0 THEN BattleBackground = 1
    IF NOT DebugNoEnemies% THEN
      IF NOT NoEnemies% THEN
        IF a$ <> "" AND a$ <> CHR$(27) THEN
          xaxa = INT(RND(1) * 100)
          IF BattleBackground = 1 AND xaxa < 6 THEN
            RandBattle 1, 2
          END IF
          IF BattleBackground = 2 AND xaxa < 5 THEN
            IF INT(RND(1) * 100) < 20 THEN
             SetBattle 1, 5
                EnsueBattle
              ELSE
                RandBattle 3, 4
              END IF
            END IF
        END IF
      END IF
    END IF
END SUB

REM $STATIC
SUB CheckForBattle1a (Key$)
    IF DebugEnemiesAnyway% THEN NoEnemies = 0
    IF NOT DebugNoEnemies% THEN
      IF NOT NoEnemies% THEN
        IF Key$ <> "" AND Key$ <> CHR$(27) THEN
          xaxa = INT(RND(1) * 100)
          IF xaxa < 6 THEN
            SCREEN 7
            CALL DrawBattleField
            RandBattle 1, 2
            SCREEN 13
            CALL ModPal
            MapRenderScreen
          END IF
          END IF
        END IF
      END IF
END SUB

SUB CheckForBattle2
    IF NOT DebugNoEnemies% THEN
      IF NOT NoEnemies% THEN
        a = INT(RND * 15)
        IF a = 10 THEN
          battle2
        END IF
      END IF
    END IF
END SUB

REM $DYNAMIC
SUB ChooseBeam
    LINE (235, 150)-(314, 177), 0, BF
    LINE (235, 150)-(314, 177), 12, B
    COLOR 15
    FOR gha = 3 TO 5
      IF InInventory(gha) > 0 THEN
        LOCATE 19 + gha - 2, 31
        PRINT ItemName$(gha)
         ja = ja + 1
      END IF
    NEXT
   
PCOPY 6, 3
LOCATE 20, 31
COLOR 12
PRINT ItemName$(3)
mychoice = 1
DO: v$ = INKEY$: IF InInventory(5) > 0 THEN ja = 3 ELSE ja = 2
SELECT CASE v$
CASE CHR$(0) + CHR$(72), CHR$(0) + CHR$(75):
IF mychoice = 1 THEN mychoice = ja ELSE mychoice = mychoice - 1
PCOPY 3, 6: LOCATE 19 + mychoice, 31: PRINT ItemName$(mychoice + 2)
CASE CHR$(0) + CHR$(77), CHR$(0) + CHR$(80):
  IF mychoice = ja THEN mychoice = 1 ELSE mychoice = mychoice + 1
PCOPY 3, 6: LOCATE 19 + mychoice, 31: PRINT ItemName$(mychoice + 2)
CASE CHR$(13): chosen(1, 2) = mychoice: EXIT SUB
CASE CHR$(27):
chosen(1, 2) = 0: mychoice = 0: GOTO trytochooseagain1
END SELECT
PCOPY 6, 0: LOOP
trytochooseagain1:
PCOPY 4, 6: PCOPY 6, 0: ErrorLevel = 1
END SUB

SUB ChooseMagic
    LINE (225, 78)-(314, 177), 0, BF
    LINE (225, 78)-(314, 177), 12, B
    COLOR 15
    FOR gha = 1 TO 12
      LOCATE 10 + gha, 30
      IF spellsknown(gha) THEN PRINT mn$(gha)
    NEXT
    PCOPY 6, 3
    LOCATE 11, 30
    COLOR 12
    PRINT mn$(1)
    mychoice = 1
 ja = 9
 FOR uh = 10 TO 12
   IF spellsknown(uh) THEN ja = uh
 NEXT
 DO
   v$ = INKEY$
SELECT CASE v$
CASE CHR$(0) + CHR$(72), CHR$(0) + CHR$(75)
IF mychoice = 1 THEN mychoice = ja ELSE mychoice = mychoice - 1
PCOPY 3, 6: LOCATE 10 + mychoice, 30: PRINT mn$(mychoice)
CASE CHR$(0) + CHR$(77), CHR$(0) + CHR$(80)
IF mychoice = ja THEN mychoice = 1 ELSE mychoice = mychoice + 1
PCOPY 3, 6: LOCATE 10 + mychoice, 30: PRINT mn$(mychoice)
CASE CHR$(13): chosen(2, 2) = mychoice: EXIT SUB
CASE CHR$(27):
chosen(2, 2) = 0: mychoice = 0: GOTO trytochooseagain3
END SELECT
PCOPY 6, 0: LOOP
trytochooseagain3:
PCOPY 4, 6: PCOPY 6, 0: ErrorLevel = 1
END SUB

SUB ChooseStar
LINE (225, 150)-(314, 174), 0, BF
LINE (225, 150)-(314, 174), 12, B
COLOR 15
FOR gha = 1 TO 2
  LOCATE 19 + gha, 30: PRINT ItemNameIfPossess$(gha)
NEXT
PCOPY 6, 3
LOCATE 20, 30
COLOR 12
PRINT ItemName$(1)
mychoice = 1
DO: v$ = INKEY$
IF InInventory(1) > 0 THEN ja1 = 1 ELSE ja1 = 2
IF InInventory(2) > 0 THEN ja2 = 2 ELSE ja2 = 1
IF InInventory(1) = 0 AND InInventory(2) > 0 THEN
mychoice = 2: LOCATE 21, 30: COLOR 12: PRINT ItemName$(2)
LOCATE 20, 30: PRINT "        "
END IF
IF InInventory(1) = 0 AND InInventory(2) = 0 THEN GOTO trytochooseagain2
SELECT CASE v$
CASE CHR$(0) + CHR$(72), CHR$(0) + CHR$(75):
IF mychoice = ja1 THEN mychoice = ja2 ELSE mychoice = mychoice - 1
PCOPY 3, 6: LOCATE 19 + mychoice, 30: PRINT ItemName$(mychoice)
CASE CHR$(0) + CHR$(77), CHR$(0) + CHR$(80):
IF mychoice = ja2 THEN mychoice = ja1 ELSE mychoice = mychoice + 1
PCOPY 3, 6: LOCATE 19 + mychoice, 30: PRINT ItemName$(mychoice)
CASE CHR$(13): chosen(3, 2) = mychoice: EXIT SUB
CASE CHR$(27): GOTO trytochooseagain2
END SELECT
PCOPY 6, 0: LOOP
trytochooseagain2:
chosen(3, 2) = 0: mychoice = 0: PCOPY 4, 6: PCOPY 6, 0: ErrorLevel = 1
END SUB

SUB DamageChar (tdmg, EnemyTargeted)
    DIM ly(3)
    ly(1) = 9
    ly(2) = 12
    ly(3) = 16
    PCOPY 3, 6
    PCOPY 3, 0
IF tdmg <> 0 THEN dmgcnt = INT(RND(1) * 50) + tdmg ELSE dmgcnt = 0
IF dmgcnt <> 0 THEN dmgcnt = dmgcnt - INT(.25 * charstat(EnemyTargeted, 4))
CurHP(EnemyTargeted) = CurHP(EnemyTargeted) - dmgcnt
IF CurHP(EnemyTargeted) > charstat(EnemyTargeted, 1) THEN CurHP(EnemyTargeted) = charstat(EnemyTargeted, 1)
SCREEN 7, 0, 0, 0: LOCATE ly(EnemyTargeted), 34
IF dmgcnt < 0 THEN COLOR 10 ELSE COLOR 12
IF dmgcnt = 0 THEN PRINT "Miss!" ELSE PRINT ABS(dmgcnt)
IF CurHP(EnemyTargeted) < 1 THEN CurHP(EnemyTargeted) = 0: KillChar EnemyTargeted
ERASE ly
END SUB

SUB DamageEnemy (elm, tdmg, EnemyTargeted)
    DIM lx(4), ly(4)
    ly(1) = 16: lx(1) = 4
    ly(2) = 16: lx(2) = 15
    ly(3) = 9: lx(3) = 4
    ly(4) = 9: lx(4) = 15
PCOPY 3, 6
PCOPY 3, 0
dmgcnt = INT(RND(1) * 50) + tdmg
IF weak(enemyat(EnemyTargeted)) = magdata(elm, 1) THEN dmgcnt = dmgcnt * 3
IF strn(enemyat(EnemyTargeted)) = magdata(elm, 1) THEN dmgcnt = -dmgcnt
dmgcnt = dmgcnt - INT(.25 * etype(enemyat(EnemyTargeted), 3))
ehit(EnemyTargeted) = ehit(EnemyTargeted) - dmgcnt
IF ehit(EnemyTargeted) > etype(enemyat(EnemyTargeted), 1) THEN
ehit(EnemyTargeted) = etype(enemyat(EnemyTargeted), 1)
END IF
SCREEN 7, 0, 0, 0: COLOR 12: LOCATE ly(EnemyTargeted), lx(EnemyTargeted)
IF dmgcnt < 0 THEN COLOR 10
PRINT ABS(dmgcnt)
IF ehit(EnemyTargeted) < 1 THEN KillEnemy EnemyTargeted
ERASE lx, ly
END SUB

REM $STATIC
SUB Dequip (Character%, Hand%)
   CALL AdjustInventory(equip(Character%, Hand%), 1)
   equip(Character%, Hand%) = 0
END SUB

REM $DYNAMIC
FUNCTION EnemiesRemaining (enemyat())
    FOR slot = 1 TO 4
      count = count + enemyat(slot)
    NEXT
    EnemiesRemaining = count
END FUNCTION

REM $STATIC
SUB EnemiesWontAttack (TrueOrFalse%)
    NoEnemies% = TrueOrFalse%
END SUB

REM $DYNAMIC
SUB EnemyAttack (enum)
DIM ey(3)
ey(1) = 65
ey(2) = 90
ey(3) = 115
PCOPY 6, 3
DO: rtarg = INT(RND(1) * 3) + 1: IF rtarg = 4 THEN rtarg = 3
LOOP UNTIL CurHP(rtarg) > 0
PUT (280, ey(rtarg)), Bangm, AND: PUT (280, ey(rtarg)), Bang1, OR
PCOPY 6, 0: PCOPY 3, 6: delay .25
PUT (290, ey(rtarg)), Bangm, AND: PUT (290, ey(rtarg)), Bang1, OR
PCOPY 6, 0: PCOPY 3, 6: delay .25: PCOPY 3, 0
dmgrate = etype(enum, 2) * 8
IF chosen(rtarg, 1) = 0 THEN dmgrate = INT(.5 * dmgrate)
IF INT(RND(1) * 100) < 5 THEN dmgrate = 0
DamageChar dmgrate, rtarg: SCREEN 7, 0, 6, 0
PCOPY 7, 6: delay 1: PlaceEnemies: ERASE ey
END SUB

SUB EnemyGo (sabro)
    DO
      FOR Choices = 3 TO 10
        echose = 0
        chthis = INT(RND(1) * 100)
        IF chthis < 10 THEN echose = Choices: EXIT FOR
      NEXT
      IF echose > 3 THEN
        IF etype(enemyat(sabro), echose) = 0 THEN echose = 0
      END IF
    LOOP UNTIL echose > 0
    SELECT CASE echose
    CASE 3: EnemyAttack enemyat(sabro)
    CASE ELSE: SpellEnemy echose
    END SELECT
  
END SUB

SUB EnsueBattle
   COLOR , 0
   IF BattleBackground = 1 THEN DrawBattleField ELSE DrawBattleCave
   ErrorLevel = 0
   totalexp = 0
   TotalGold& = 0
   FOR gh = 1 TO 4
   gitm(gh) = 0
   ehit(gh) = 0
IF enemyat(gh) > 0 THEN
ehit(gh) = etype(enemyat(gh), 1)
totalexp = totalexp + etype(enemyat(gh), 11)
TotalGold& = TotalGold& + etype(enemyat(gh), 12)
gitm(gh) = etype(enemyat(gh), 13)
END IF
NEXT: SCREEN 7, 0, 6, 0: PCOPY 7, 6
PlaceEnemies
DO
PCOPY 6, 4
    
    FOR sabro = 1 TO 3
      IF CurHP(sabro) > 0 THEN
       BattleMenu sabro
       IF ErrorLevel = 1 THEN sabro = sabro - 1: ErrorLevel = 0
      END IF
   NEXT
   FOR xab = 300 TO 0 STEP -1
   FOR sabro = 1 TO 3
IF charstat(sabro, 3) = xab THEN CharAttack sabro: IsPartyDead
NEXT
    FOR sabro = 1 TO 4
    IF enemyat(sabro) > 0 THEN
      ghaj = enemyat(sabro)
      IF etype(ghaj, 2) = xab THEN EnemyGo sabro: IsPartyDead
   END IF
NEXT
NEXT

IF EnemiesRemaining(enemyat()) = 0 THEN GOTO endbattle

PCOPY 6, 0: LOOP
endbattle:
PCOPY 6, 0: WinBattle
COLOR , totalback: SCREEN 7, 0, 2, 0: cannotrun = 0
FOR abab = 1 TO 4: enemyat(abab) = 0: NEXT
FOR abab = 1 TO 3: walled(abab) = 0: NEXT
END SUB

SUB EquipItems
CLS : LINE (0, 0)-(319, 199), 1, BF
LINE (0, 0)-(319, 199), 12, B
LOCATE 2, 3: COLOR 15: PRINT "Equip who?"
COLOR 14:
FOR I = 1 TO 3
    LOCATE 14 + I, 17: PRINT HeroName$(I)
NEXT I
LOCATE 18, 17: PRINT "EXIT"
PCOPY 2, 1: mychc = 1: DO: PCOPY 1, 2: COLOR 15
LOCATE mychc + 14, 15: PRINT CHR$(26): PCOPY 2, 0
ii$ = INKEY$: SELECT CASE ii$
CASE CHR$(0) + CHR$(72), CHR$(0) + CHR$(75):
mychc = mychc - 1: IF mychc = 0 THEN mychc = 4
CASE CHR$(0) + CHR$(77), CHR$(0) + CHR$(80):
mychc = mychc + 1: IF mychc = 5 THEN mychc = 1
CASE CHR$(27): ii$ = CHR$(13): mychc = 4
END SELECT
LOOP UNTIL ii$ = CHR$(13)
IF mychc = 4 THEN EXIT SUB
mypers = mychc
OnceAgain:
mychc = mypers
CLS : LINE (0, 0)-(319, 199), 1, BF
LINE (0, 0)-(319, 41), 12, B
COLOR 15: LOCATE 2, 3
PRINT "HAND - ": LOCATE 3, 3: PRINT "BODY - "
LOCATE 7, 3: PRINT "Please choose a weapon:"
 Dequip mychc%, 1
 Dequip mychc%, 2
COLOR 14
    FOR ha = 1 TO 2
      LOCATE ha + 15, 10
      IF InInventory(canequip(mychc, ha)) > 0 THEN
        PRINT ItemName$(canequip(mychc, ha))
        LOCATE ha + 15, 28
        goby$ = LTRIM$(STR$(power%(canequip(mychc, ha))))

        IF LEN(goby$) = 2 THEN goby$ = "0" + goby$
        PRINT goby$
      ELSE
        PRINT "<Nothing>"
     END IF
NEXT: LOCATE 18, 10: PRINT "<Nothing>"
mypers = mychc
PCOPY 2, 1: mychc = 1: DO: PCOPY 1, 2: COLOR 15
LOCATE mychc + 15, 8: PRINT CHR$(26): PCOPY 2, 0
ii$ = INKEY$: SELECT CASE ii$
CASE CHR$(0) + CHR$(72), CHR$(0) + CHR$(75):
mychc = mychc - 1: IF mychc = 0 THEN mychc = 3
CASE CHR$(0) + CHR$(77), CHR$(0) + CHR$(80):
mychc = mychc + 1: IF mychc = 4 THEN mychc = 1
END SELECT
LOOP UNTIL ii$ = CHR$(13): LOCATE 2, 8: COLOR 14
IF mychc < 3 AND InInventory(canequip(mypers, mychc)) > 0 THEN
mc = mychc
CALL AdjustInventory(canequip(mypers, mc), -1)
equip(mypers, 1) = canequip(mypers, mychc)
charstat(mypers, 3) = power(canequip(mypers, mychc))
PRINT ItemName$(canequip(mypers, mychc))
ELSE
equip(mypers, 1) = 0: charstat(mypers, 3) = 0
PRINT "<Nothing>"
END IF
LINE (0, 42)-(319, 199), 1, BF: COLOR 15
LOCATE 7, 3: PRINT "Please choose an armor:"
COLOR 14
FOR ha = 3 TO 4: LOCATE ha + 13, 10
IF InInventory(canequip(mypers, ha)) > 0 THEN
PRINT ItemName$(canequip(mypers, ha))
LOCATE ha + 13, 28
goby$ = LTRIM$(STR$(power(canequip(mypers, ha))))
IF LEN(goby$) = 2 THEN goby$ = "0" + goby$
PRINT goby$
ELSE
PRINT "<Nothing>"
END IF
NEXT: LOCATE 18, 10: PRINT "<Nothing>"
PCOPY 2, 1: mychc = 1: DO: PCOPY 1, 2: COLOR 15
LOCATE mychc + 15, 8: PRINT CHR$(26): PCOPY 2, 0
ii$ = INKEY$: SELECT CASE ii$
CASE CHR$(0) + CHR$(72), CHR$(0) + CHR$(75):
mychc = mychc - 1: IF mychc = 0 THEN mychc = 3
CASE CHR$(0) + CHR$(77), CHR$(0) + CHR$(80):
mychc = mychc + 1: IF mychc = 4 THEN mychc = 1
END SELECT
LOOP UNTIL ii$ = CHR$(13): LOCATE 3, 8: COLOR 14
IF mychc < 3 THEN
IF InInventory(canequip(mypers, mychc + 2)) > 0 THEN
mc = mychc + 2
CALL AdjustInventory(canequip(mypers, mc), -1)
equip(mypers, 2) = canequip(mypers, mc)
charstat(mypers, 4) = power(canequip(mypers, mc))
PRINT ItemName$(canequip(mypers, mc))
ELSE
equip(mypers, 2) = 0: charstat(mypers, 4) = 0
PRINT "<Nothing>"
END IF
ELSE
equip(mypers, 2) = 0: charstat(mypers, 4) = 0
PRINT "<Nothing>"
END IF
LINE (0, 42)-(319, 199), 1, BF
LOCATE 16, 3: PRINT "Is this OK? (Y/N)": PCOPY 2, 0
DO: ii$ = INKEY$: LOOP UNTIL ii$ <> ""
IF UCASE$(ii$) = "Y" THEN EXIT SUB ELSE GOTO OnceAgain
END SUB

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

SUB IsPartyDead
   FOR ga = 1 TO 3
     IF CurHP(ga) > 0 THEN EXIT SUB
   NEXT
   COLOR 15
   LINE (0, 0)-(319, 31), 0, BF
   LINE (0, 31)-(319, 31), 12
   LOCATE 1, 1
   PRINT "NOTICE: you are dead. The enemies"
   PRINT "devour your body. Have a"
   PRINT "nice day!"
  LOCATE 3, 40
  PRINT CHR$(254)
  PCOPY 6, 0: SLEEP
  dmb$ = INKEY$
  SYSTEM
END SUB

SUB JumpAttack (EnemyTargeted)
  
    DIM ex(4), ey(4)

    CALL AttackPattern1(ex(), ey())

CALL DisplayAttackName("Jump")

CALL EstablishTarget(enemyat%(), EnemyTargeted%)

 DIM coverup%(140): SCREEN 7, 0, 7, 0
GET (280, 110)-(299, 129), coverup%: SCREEN 7, 0, 6, 0
PUT (280, 110), coverup%, PSET: PCOPY 6, 3
FOR bja = 110 TO 0 STEP -5: PCOPY 3, 6
PUT (280, bja), Mode7Bitmap(0, 11), AND: PUT (280, bja), Mode7Bitmap(0, 10), OR
PCOPY 6, 0: delay .05: NEXT: PCOPY 3, 0: delay 1
FOR bja = 0 TO ey(EnemyTargeted) STEP 5: PCOPY 3, 6
PUT (ex(EnemyTargeted), bja), Mode7Bitmap(0, 9), AND: PUT (ex(EnemyTargeted), bja), Mode7Bitmap(0, 8), OR
PCOPY 6, 0: delay .05: NEXT: FOR bja = ex(EnemyTargeted) TO 300 STEP 5
PCOPY 3, 6: PUT (bja, ey(EnemyTargeted)), Mode7Bitmap(0, 11), AND
PUT (bja, ey(EnemyTargeted)), Mode7Bitmap(0, 10), OR: PCOPY 6, 0: delay .05: NEXT
PCOPY 3, 0: delay 1: FOR bja = 0 TO 110 STEP 5: PCOPY 3, 6
PUT (280, bja), Mode7Bitmap(0, 9), AND: PUT (280, bja), Mode7Bitmap(0, 8), OR
PCOPY 6, 0: delay .05: NEXT: PCOPY 6, 3: DamageEnemy 0, 275, EnemyTargeted
SCREEN 7, 0, 6, 0: PCOPY 7, 6: delay 1: PlaceEnemies
ERASE ex, ey, coverup%
END SUB

SUB KillChar (EnemyTargeted)
IF EnemyTargeted = 2 THEN
  FOR bgh = 1 TO 3
  walled(bgh) = 0
  NEXT
END IF
delay 1
CurHP(EnemyTargeted) = 0
chosen(EnemyTargeted, 1) = 0
walled(EnemyTargeted) = 0
DIM ey(4), lner(20)
ey(1) = 60
ey(2) = 85
ey(3) = 110
FOR xha = 10 TO 1 STEP -1
FOR ew = ey(EnemyTargeted) TO ey(EnemyTargeted) + 20 STEP xha
    SCREEN 7, 0, 7, 0
    GET (270, ew)-(310, ew), lner
    SCREEN 7, 0, 6, 0
    PUT (270, ew), lner, PSET
    PCOPY 6, 0: delay .00001
    NEXT: NEXT
    ERASE ey, lner
END SUB

SUB KillEnemy (EnemyTargeted)
    delay 1
    ehit(EnemyTargeted) = 0
    enemyat(EnemyTargeted) = 0
  
    DIM ex(4), ey(4), lner(20)
  
    CALL AttackPattern1(ex(), ey())

    FOR xha = 10 TO 1 STEP -1
      FOR ew = ey(EnemyTargeted) - 10 TO ey(EnemyTargeted) + 30 STEP xha
SCREEN 7, 0, 7, 0: GET (ex(EnemyTargeted) - 10, ew)-(ex(EnemyTargeted) + 30, ew), lner
SCREEN 7, 0, 6, 0: PUT (ex(EnemyTargeted) - 10, ew), lner, PSET
PCOPY 6, 0: delay .00001: NEXT: NEXT:
ERASE ex, ey, lner
END SUB

REM $STATIC
SUB PartyHPRestored
FOR rstrit = 1 TO 3
   CurHP(rstrit) = charstat(rstrit, 1)
NEXT
END SUB

SUB PartyMPRestored
curmp = charstat(2, 2)
END SUB

REM $DYNAMIC
SUB PlaceEnemies
    LINE (5, 150)-(100, 185), 0, BF
    LINE (5, 150)-(100, 185), 12, B
    COLOR 15
    FOR abdf = 1 TO 4
     IF enemyat(abdf) > 0 THEN
       LOCATE 19 + abdf, 2
       PRINT ename$(enemyat(abdf))
     END IF
   NEXT
    LINE (150, 150)-(314, 180), 0, BF
    LINE (150, 150)-(314, 180), 12, B
    FOR abdf = 1 TO 3
      CharHPList abdf, 20, 19 + abdf
    NEXT
    FOR I = 1 TO 3
      IF CurHP(I) > 0 THEN
        PUT (280, (I * 25) + 35), Mode7Bitmap(0, (I - 1) * 4 + 1), AND
        PUT (280, (I * 25) + 35), Mode7Bitmap(0, (I - 1) * 4), OR
      END IF
    NEXT I

FOR xaljh = 1 TO 4
IF xaljh = 1 THEN sposx = 35: sposy = 110
IF xaljh = 2 THEN sposx = 110: sposy = 110
IF xaljh = 3 THEN sposx = 35: sposy = 60
IF xaljh = 4 THEN sposx = 110: sposy = 60
SELECT CASE enemyat(xaljh)
CASE 1, 3
FOR xabc = 1 TO 15
CIRCLE (sposx + 15, sposy + 15), xabc, xabc: NEXT
CASE 2, 4
PUT (sposx, sposy), Mode7Bitmap(0, 21), AND
PUT (sposx, sposy), Mode7Bitmap(0, 20), OR
CASE 5
PUT (sposx, sposy), Mode7Bitmap(0, 19), AND
PUT (sposx, sposy), Mode7Bitmap(0, 18), OR
END SELECT
NEXT
END SUB

SUB RandBattle (batnum1, batnum2)
    xav = INT(RND(1) * 4) + 1
    IF xav > 4 THEN xav = 4
    FOR abab = 1 TO xav
    xabh = INT(RND(1) * (batnum2 - batnum1 + 1)) + 1
    IF xabh > batnum2 - batnum1 + 1 THEN xabh = batnum2 - batnum1 + 1
      SetBattle abab, batnum1 - 1 + xabh
    NEXT
EnsueBattle
END SUB

SUB RunAway
   PCOPY 6, 3
   COLOR 15
   LINE (0, 0)-(319, 31), 0, BF
   LINE (0, 31)-(319, 31), 12
   cnrn = INT(RND(1) * 100)
   LOCATE 1, 1
   IF cannotrun THEN
     CALL MsgRunDisabled
     SLEEP
     dmbo$ = INKEY$: PCOPY 3, 6: PCOPY 3, 0: delay 1: EXIT SUB
  END IF
  IF cnrn < 50 OR DebugRun% = TRUE THEN
    CALL MsgRunSuccess
    SLEEP
    dmbo$ = INKEY$
    PCOPY 3, 6
    PCOPY 3, 0
    TotalGold& = 0
    totalexp = 0
    FOR xg = 1 TO 4
      gitm(xg) = 0
      enemyat(xg) = 0: ehit(xg) = 0: NEXT
    ELSE
      MsgRunFail
      SLEEP
      dmbo$ = INKEY$: PCOPY 3, 6: PCOPY 3, 0: delay 1: EXIT SUB
    END IF
END SUB

SUB SetBattle (batnum, enum)
enemyat(batnum) = enum
END SUB

REM $STATIC
SUB SetBattleBackground (NewBattleBackground%)
    BattleBackground = NewBattleBackground%
END SUB

REM $DYNAMIC
SUB SpellCast (spnum, EnemyTargeted)
  
    DIM ex(4), ey(4), lx(4), ly(4)
    CALL AttackPattern1(ex(), ey())
    ly(1) = 16: lx(1) = 4: ly(2) = 16
    lx(2) = 15: ly(3) = 9: lx(3) = 4: ly(4) = 9: lx(4) = 15
  
    IF magdata(spnum, 2) = 0 AND magdata(spnum, 1) < 6 THEN
      CALL EstablishTarget(enemyat%(), EnemyTargeted%)
    END IF
  
DIM coverup%(140): SCREEN 7, 0, 7, 0
GET (280, 85)-(299, 104), coverup%: SCREEN 7, 0, 6, 0
PUT (280, 85), coverup%, PSET
PUT (280, 85), Mode7Bitmap(0, 7), AND: PUT (280, 85), Mode7Bitmap(0, 6), OR

    CALL DisplayAttackName(mn$(spnum))
IF curmp < 0 THEN NotEnoughMP: curmp = 0: GOTO NoSpellCast

SELECT CASE spnum
CASE 1:
ey(1) = 60: ey(2) = 85: ey(3) = 110
  
    FOR xarg = ey(EnemyTargeted) - 30 TO ey(EnemyTargeted) + 10 STEP 2
      PUT (280, xarg), Mode7Bitmap(0, 17), AND
      PUT (280, xarg), Mode7Bitmap(0, 16), OR
      Mode7ShowAndRestore .05
    NEXT
    PCOPY 6, 0
IF CurHP(EnemyTargeted) > 0 THEN DamageChar -1400, EnemyTargeted
CASE 2
   ey(1) = 60: ey(2) = 85: ey(3) = 110
   FOR xarg = -30 TO 10 STEP 2
     FOR erf = 1 TO 3
       PUT (280, ey(erf) + xarg), Mode7Bitmap(0, 17), AND
       PUT (280, ey(erf) + xarg), Mode7Bitmap(0, 16), OR
     NEXT
    Mode7ShowAndRestore (.5)
    NEXT
    PCOPY 6, 0
    FOR erf = 1 TO 3
      IF CurHP(erf) > 0 THEN
DamageChar -700, erf: IF erf < 3 THEN delay 1
END IF
NEXT
CASE 3
SpellFire ex(EnemyTargeted), ey(EnemyTargeted), EnemyTargeted
CASE 4: SpellIce ex(EnemyTargeted), ey(EnemyTargeted), EnemyTargeted
CASE 5
  SpellLightning ex(EnemyTargeted), ey(EnemyTargeted), EnemyTargeted, 0
CASE 6: SpellTremor ex(EnemyTargeted), ey(EnemyTargeted), EnemyTargeted
    CASE 7
      SpellDrownGraphic ex(EnemyTargeted), ey(EnemyTargeted)
      SpellDrown ex(EnemyTargeted), ey(EnemyTargeted), EnemyTargeted, 0
CASE 8
IF CurHP(EnemyTargeted) > 0 THEN
walled(EnemyTargeted) = 1: ey(1) = 60: ey(2) = 85: ey(3) = 110
FOR gjkl = 1 TO 15
LINE (270, ey(EnemyTargeted) + gjkl)-(290, ey(EnemyTargeted) + gjkl + 10), gjkl
NEXT:
Mode7ShowAndRestore 1
PCOPY 3, 0
END IF
CASE 9:
ey(1) = 60: ey(2) = 85: ey(3) = 110
    FOR abag = 1 TO 20
      xc = INT(RND(1) * 15): yc = INT(RND(1) * 15)
      PUT (280 + xc, ey(EnemyTargeted) + yc), Mode7Bitmap(0, 17), AND
      PUT (280 + xc, ey(EnemyTargeted) + yc), Mode7Bitmap(0, 16), OR
      Mode7ShowAndRestore .1
    NEXT
    PCOPY 3, 0
IF CurHP(EnemyTargeted) = 0 THEN CurHP(EnemyTargeted) = 1000
CASE 10:
ct! = 75: Xpvr! = 0
DO: IF ct! < 0 THEN ct! = ABS(ct!) - 1
IF ct! > 0 THEN ct! = -ct!
Xpvr! = Xpvr! + ct!: WAIT &H3DA, 8: OUT &H3D4, 13
OUT &H3D5, Xpvr!: LOOP UNTIL ct! = 0
OUT &H3D4, 13: OUT &H3D5, 0
FOR dgct = 1 TO 4: dmgcnt = INT(RND(1) * 50) + 100
IF enemyat(dgct) > 0 THEN
IF weak(enemyat(dgct)) = magdata(10, 1) THEN
dmgcnt = dmgcnt + INT(RND(1) * 100) + 100
END IF
IF strn(enemyat(dgct)) = magdata(10, 1) THEN dmgcnt = -dmgcnt
dmgcnt = dmgcnt - INT(.25 * etype(enemyat(dgct), 3))
ehit(dgct) = ehit(dgct) - dmgcnt
IF ehit(dgct) > etype(enemyat(dgct), 1) THEN
ehit(dgct) = etype(enemyat(dgct), 1)
END IF
SCREEN 7, 0, 0, 0: COLOR 12: LOCATE ly(dgct), lx(dgct)
IF dmgcnt < 0 THEN COLOR 10
PRINT ABS(dmgcnt)
END IF
NEXT: FOR dgct = 1 TO 4
IF ehit(dgct) < 1 AND enemyat(dgct) > 0 THEN KillEnemy dgct
NEXT
CASE 11:
FOR bcad = 5 TO 25 STEP 5: PCOPY 3, 6: Mosaic bcad: PCOPY 6, 0
delay .1: NEXT: FOR bcad = 20 TO 5 STEP -5: PCOPY 3, 6
Mosaic bcad: PCOPY 6, 0: delay .1: NEXT: delay .25
PCOPY 3, 6: PCOPY 3, 0
FOR dgct = 1 TO 4: dmgcnt = INT(RND(1) * 50) + 225
IF enemyat(dgct) > 0 THEN
dmgcnt = dmgcnt - INT(.25 * etype(enemyat(dgct), 3))
ehit(dgct) = ehit(dgct) - dmgcnt
SCREEN 7, 0, 0, 0: COLOR 12: LOCATE ly(dgct), lx(dgct)
PRINT dmgcnt
END IF
NEXT: FOR dgct = 1 TO 4
IF ehit(dgct) < 1 AND enemyat(dgct) > 0 THEN KillEnemy dgct
NEXT
CASE 12:
SCREEN 7, 0, 0, 0: FOR wasser = 0 TO 200 STEP 4
LINE (0, wasser)-(319, wasser), 3
LINE (0, wasser + 1)-(319, wasser + 1), 1
LINE (0, wasser + 2)-(319, wasser + 2), 9
LINE (0, wasser + 3)-(319, wasser + 3), 11
delay .05: NEXT: FOR water = 4 TO 199 STEP 8
SCREEN 7, 0, 6, 0: PCOPY 3, 6
FOR wasser = water TO 200 STEP 4
LINE (0, wasser)-(319, wasser), 3
LINE (0, wasser + 1)-(319, wasser + 1), 1
LINE (0, wasser + 2)-(319, wasser + 2), 9
LINE (0, wasser + 3)-(319, wasser + 3), 11
NEXT: PCOPY 6, 0: delay .05
NEXT: PCOPY 3, 6: PCOPY 3, 0
FOR dgct = 1 TO 4: dmgcnt = INT(RND(1) * 50) + 300
IF enemyat(dgct) > 0 THEN
IF weak(enemyat(dgct)) = magdata(12, 1) THEN
dmgcnt = dmgcnt + INT(RND(1) * 100) + 200
END IF
IF strn(enemyat(dgct)) = magdata(12, 1) THEN dmgcnt = -dmgcnt
dmgcnt = dmgcnt - INT(.25 * etype(enemyat(dgct), 3))
ehit(dgct) = ehit(dgct) - dmgcnt
IF ehit(dgct) > etype(enemyat(dgct), 1) THEN
ehit(dgct) = etype(enemyat(dgct), 1)
END IF
SCREEN 7, 0, 0, 0: COLOR 12: LOCATE ly(dgct), lx(dgct)
IF dmgcnt < 0 THEN COLOR 10
PRINT ABS(dmgcnt)
END IF
NEXT: FOR dgct = 1 TO 4
IF ehit(dgct) < 1 AND enemyat(dgct) > 0 THEN KillEnemy dgct
NEXT
END SELECT
NoSpellCast:
SCREEN 7, 0, 6, 0: PCOPY 7, 6: delay 1: PlaceEnemies
ERASE ex, ey, lx, ly, coverup%
END SUB

SUB SpellDrown (ex%, ey%, EnemyTargeted, TargetIsChar%)
    IF TargetIsChar% THEN
      DamageChar 600, EnemyTargeted
    ELSE
      DamageEnemy 7, 175, EnemyTargeted
    END IF
END SUB

SUB SpellDrownGraphic (ex%, ey%)
    FOR bagha = 1 TO 20
      PCOPY 3, 6
      xc4me = INT(RND(1) * 15) + ex
      yc4me = INT(RND(1) * 15) + ey
      FOR ecirc = 1 TO 4
        IF ecirc = 1 THEN clrc = 1
        IF ecirc = 2 THEN clrc = 3
        IF ecirc = 3 THEN clrc = 9
        IF ecirc = 4 THEN clrc = 11
        CIRCLE (xc4me, yc4me), ecirc, clrc
        PCOPY 6, 0
        delay .1
      NEXT
    NEXT

END SUB

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
        PRINT "Fire":
        Mode7ShowAndRestore 1
        PCOPY 3, 0
        SpellFire 280, ey(EnemyTargeted), EnemyTargeted
    CASE 5:
        PRINT "Ice"
        Mode7ShowAndRestore 1
        PCOPY 3, 0
SpellIce 280, ey(EnemyTargeted), EnemyTargeted
    CASE 6
      PRINT "Lightning":
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
DIM mx(4), my(4): mx(1) = 35: my(1) = 110: mx(2) = 110
my(2) = 110: mx(3) = 35: my(3) = 60: mx(4) = 110: my(4) = 60
PRINT "Heal"
Mode7ShowAndRestore 1
PCOPY 3, 0
FOR xarg = -30 TO 10 STEP 2: PCOPY 3, 6
FOR erf = 1 TO 4
IF enemyat(erf) > 0 THEN PUT (mx(erf), my(erf) + xarg), Mode7Bitmap(0, 17), AND
IF enemyat(erf) > 0 THEN PUT (mx(erf), my(erf) + xarg), Mode7Bitmap(0, 16), OR
NEXT: PCOPY 6, 0: delay .05: NEXT: PCOPY 3, 6: PCOPY 6, 0
FOR erf = 1 TO 4
IF enemyat(erf) > 0 THEN
DamageEnemy 0, -700, erf: IF erf < 4 THEN delay 1
END IF
NEXT: ERASE mx, my
END SELECT

SCREEN 7, 0, 6, 0
PCOPY 7, 6
delay 1
PlaceEnemies
ERASE ey
END SUB

SUB SpellFire (ex, ey, EnemyTargeted)
    SpellFireGraphic ex, ey
IF ex = 280 AND walled(EnemyTargeted) = 1 THEN
  SpellReflect 3, EnemyTargeted: EXIT SUB
END IF
IF ex = 280 THEN DamageChar 400, EnemyTargeted ELSE DamageEnemy 3, 150, EnemyTargeted
END SUB

SUB SpellFireGraphic (ex%, ey%)
    FOR bagha = 1 TO 20
      xc4me = INT(RND(1) * 15) + ex
      yc4me = INT(RND(1) * 15) + ey
      PUT (xc4me, yc4me), Bangm, AND
      PUT (xc4me, yc4me), Bang1, OR
      PCOPY 6, 0
      delay .1
      PCOPY 3, 6
    NEXT
END SUB

SUB SpellIce (ex, ey, EnemyTargeted)
COLOR 15
FOR g2 = 1 TO 10
PCOPY 3, 6
LINE (ex, ey)-(ex + g2, ey + g2)
LINE (ex, ey + 20)-(ex + g2, ey + 20 - g2)
LINE (ex + 20, ey + 20)-(ex + 20 - g2, ey + 20 - g2)
LINE (ex + 20, ey)-(ex + 20 - g2, ey + g2)
PCOPY 6, 0: delay .05: NEXT: df = 0: FOR g2 = 1 TO 5: PCOPY 3, 6
LINE (ex, ey)-(ex + 10, ey + 10 - g2)
LINE (ex, ey)-(ex + 10 - g2, ey + 10)
LINE (ex + 20, ey)-(ex + 10, ey + 10 - g2)
LINE (ex + 20, ey)-(ex + 10 + g2, ey + 10)
LINE (ex, ey + 20)-(ex + 10 - g2, ey + 10)
LINE (ex, ey + 20)-(ex + 10, ey + 10 + g2)
LINE (ex + 20, ey + 20)-(ex + 10 + g2, ey + 10)
LINE (ex + 20, ey + 20)-(ex + 10, ey + 10 + g2)
IF g2 = 5 THEN df = 1
IF df = 1 THEN g2 = g2 - 2
IF g2 = -1 THEN g2 = 6
PCOPY 6, 0: delay .05: NEXT: FOR B = 9 TO 1 STEP -1: PCOPY 3, 6
LINE (ex + 10 - B, ey + 10 - B)-(ex + 10 + B, ey + 10 + B)
LINE (ex + 10 + B, ey + 10 - B)-(ex + 10 - B, ey + 10 + B)
PCOPY 6, 0: delay .05: NEXT
IF ex = 280 AND walled(EnemyTargeted) = 1 THEN
  SpellReflect 4, EnemyTargeted: EXIT SUB
END IF
IF ex = 280 THEN DamageChar 400, EnemyTargeted ELSE DamageEnemy 4, 150, EnemyTargeted
END SUB

SUB SpellLightning (ex, ey, EnemyTargeted, TargetIsChar%)
    CALL SpellLightningGraphic(ex, ey)
    IF TargetIsChar% THEN
      DamageChar 400, EnemyTargeted
    ELSE
      DamageEnemy 5, 150, EnemyTargeted
    END IF
END SUB

SUB SpellLightningGraphic (ex, ey)
    FOR aga = 1 TO 20
      PCOPY 3, 6
      IF aga AND 1 THEN
        PUT (ex, ey), Mode7Bitmap(0, 13), AND
        PUT (ex, ey), Mode7Bitmap(0, 12), OR
      ELSE
        PUT (ex, ey), Mode7Bitmap(0, 15), AND
        PUT (ex, ey), Mode7Bitmap(0, 14), OR
     END IF
     PCOPY 6, 0
     delay .1
    NEXT

END SUB

SUB SpellReflect (spnum, EnemyTargeted)
    DIM ey(3)
    ey(1) = 60
    ey(2) = 85
    ey(3) = 110
   
    CALL SpellReflectGraphic(270, ey(EnemyTargeted), 1)
    PCOPY 3, 0
    PCOPY 3, 6

    ERASE ey
  
    FOR lada = 1 TO 4
       IF enemyat(lada) > 0 THEN EnemyTargeted = lada
    NEXT
    SpellCast spnum, EnemyTargeted
END SUB

SUB SpellReflectGraphic (ex%, ey%, Speed!)
    PCOPY 3, 6
    FOR gjkl = 1 TO 15
      LINE (ex%, ey% + gjkl)-(ex% + 20, ey% + gjkl + 10), gjkl
    NEXT
    PCOPY 6, 0
    delay Speed!
END SUB

SUB SpellTremor (ex, ey, EnemyTargeted)
PCOPY 7, 6
IF ex = 280 THEN
strh = CurHP(EnemyTargeted): strg = EnemyTargeted + 5: CurHP(EnemyTargeted) = 0: PlaceEnemies
LOCATE 19 + EnemyTargeted, 31

    jnum$ = ZeroDelimitedInt$(strh, 4)
    knum$ = ZeroDelimitedInt$(charstat(EnemyTargeted, 1), 4)
    PRINT jnum$; "/"; knum$
ELSE
strg = enemyat(EnemyTargeted): enemyat(EnemyTargeted) = 0: PlaceEnemies
LOCATE 19 + EnemyTargeted, 2: COLOR 15: PRINT ename$(strg)
END IF
PCOPY 6, 1: shk = 10: FOR bksh = 1 TO 20: PCOPY 1, 6
SELECT CASE strg
CASE 1, 3:
FOR xabc = 1 TO 15
CIRCLE (ex + 15, ey + 15 - shk), xabc, xabc: NEXT
CASE 2, 4:
PUT (ex, ey - shk), Mode7Bitmap(0, 21), AND
PUT (ex, ey - shk), Mode7Bitmap(0, 20), OR
CASE 5:
PUT (ex, ey - shk), Mode7Bitmap(0, 19), AND: PUT (ex, ey - shk), Mode7Bitmap(0, 18), OR
CASE 6:
PUT (ex, ey - shk), Mode7Bitmap(0, 1), AND: PUT (ex, ey - shk), Mode7Bitmap(0, 0), OR
CASE 7:
PUT (ex, ey - shk), Mode7Bitmap(0, 5), AND: PUT (ex, ey - shk), Mode7Bitmap(0, 4), OR
CASE 8:
PUT (ex, ey - shk), Mode7Bitmap(0, 9), AND: PUT (ex, ey - shk), Mode7Bitmap(0, 8), OR
END SELECT
shk = -shk: IF shk > 0 THEN shk = shk - 1
PCOPY 6, 0: delay .1
NEXT
IF ex = 280 THEN CurHP(EnemyTargeted) = strh ELSE enemyat(EnemyTargeted) = strg
IF ex = 280 AND walled(EnemyTargeted) = 1 THEN
   SpellReflect 6, EnemyTargeted: EXIT SUB
END IF
IF ex = 280 THEN DamageChar 600, EnemyTargeted ELSE DamageEnemy 6, 175, EnemyTargeted
END SUB

SUB statusscreen
DO: CLS : LINE (0, 0)-(319, 199), 1, BF
LINE (0, 0)-(319, 199), 12, B: PCOPY 2, 0
MCOLOR 15, 1
    FOR abdf = 1 TO 3
    CharHPList abdf, 2, 19 + abdf
    PRINT " MP ";
    IF abdf = 1 OR abdf = 3 THEN
      PRINT "000/000"; " LV"; curlev(abdf)
    ELSE
      njh$ = LTRIM$(STR$(curmp))
      FOR baha = 1 TO 3
       IF LEN(njh$) < 3 THEN njh$ = "0" + njh$
      NEXT
      PRINT njh$; "/"; LTRIM$(STR$(charstat(2, 2)));
      PRINT " LV"; curlev(abdf)
    END IF
NEXT: LOCATE 18, 18: PRINT "GP"; curgold
COLOR 14: LOCATE 5, 15: PRINT "INVENTORY"
LOCATE 6, 15: PRINT "EQUIP"
LOCATE 7, 15: PRINT "EXIT"
PCOPY 2, 1: mychc = 1: DO: PCOPY 1, 2: COLOR 15
LOCATE mychc + 4, 13: PRINT CHR$(26): PCOPY 2, 0
ii$ = INKEY$: SELECT CASE ii$
CASE CHR$(0) + CHR$(72), CHR$(0) + CHR$(75):
mychc = mychc - 1: IF mychc = 0 THEN mychc = 3
CASE CHR$(0) + CHR$(77), CHR$(0) + CHR$(80):
mychc = mychc + 1: IF mychc = 4 THEN mychc = 1
CASE CHR$(27): ii$ = CHR$(13): mychc = 3
END SELECT
LOOP UNTIL ii$ = CHR$(13)
IF mychc = 3 THEN
PCOPY 5, 2: LOCATE py, px
COLOR 14, totalback: PRINT CHR$(1): EXIT SUB
END IF
IF mychc = 2 THEN EquipItems
IF mychc = 1 THEN
CLS : LINE (0, 0)-(319, 199), 1, BF
LINE (0, 0)-(319, 199), 12, B
COLOR 15: LOCATE 2, 3: PRINT "Press any key to exit."
COLOR 14: cloc = 5: FOR bala = 1 TO 18: LOCATE cloc, 10
IF InInventory(bala) > 0 THEN
PRINT ItemName$(bala)
LOCATE cloc, 29
hag$ = ZeroDelimitedInt$(InInventory(bala), 2)
PRINT hag$
cloc = cloc + 1
END IF
NEXT
PCOPY 2, 0: SLEEP: dmbo$ = INKEY$
END IF
LOOP
END SUB

SUB statusscreen2
SCREEN 9, , 1, 1
CLS
PAINT (1, 1), 1
LOCATE 2, 34: PRINT "Status screen"
LOCATE 10, 10: PRINT "Hit Points:"; hp
LOCATE 11, 10: PRINT "Max hit Points"; hpmax
LOCATE 12, 10: PRINT "Experience:"; chrexp%
LOCATE 13, 10: PRINT "Level:"; level%
LOCATE 14, 10: PRINT "Gold:"; gold&
LOCATE 15, 10: PRINT "Attack:"; attack%
WaitKey
SCREEN 9, , 0, 0
END SUB

SUB TargetChar (sabro)
    tgt = 1
    DIM ep(3, 2): ep(1, 1) = 280
    ep(1, 2) = 60
    ep(2, 1) = 280
    ep(2, 2) = 85
    ep(3, 1) = 280
    ep(3, 2) = 110
COLOR 12: DO: PCOPY 4, 6: whassis$ = INKEY$
CIRCLE (ep(tgt, 1) + 10, ep(tgt, 2) + 10), 20
LINE (ep(tgt, 1) + 10, ep(tgt, 2) - 12)-(ep(tgt, 1) + 10, ep(tgt, 2) + 32)
LINE (ep(tgt, 1) - 12, ep(tgt, 2) + 10)-(ep(tgt, 1) + 32, ep(tgt, 2) + 10)
SELECT CASE whassis$
CASE CHR$(0) + CHR$(72), CHR$(0) + CHR$(75)
IF tgt = 1 THEN tgt = 3 ELSE tgt = tgt - 1
CASE CHR$(0) + CHR$(77), CHR$(0) + CHR$(80)
IF tgt = 3 THEN tgt = 1 ELSE tgt = tgt + 1
CASE CHR$(13)
chosen(sabro, 3) = tgt: ERASE ep: PCOPY 4, 6: PCOPY 6, 0: EXIT SUB
  CASE CHR$(27): ErrorLevel = 1: ERASE ep: PCOPY 4, 6: PCOPY 6, 0: EXIT SUB
END SELECT
PCOPY 6, 0: LOOP
END SUB

SUB TargetEnemy1 (sabro)
 DIM ep(4, 2)
 ep(1, 1) = 35: ep(1, 2) = 110: ep(2, 1) = 110: ep(2, 2) = 110
 ep(3, 1) = 35: ep(3, 2) = 60: ep(4, 1) = 110: ep(4, 2) = 60
 tgt = 0
 FOR abga = 1 TO 4
   IF enemyat(abga) > 0 THEN
     tgt = abga
     EXIT FOR
   END IF
 NEXT
COLOR 12: DO: PCOPY 4, 6: whassis$ = INKEY$
CIRCLE (ep(tgt, 1) + 10, ep(tgt, 2) + 10), 20
LINE (ep(tgt, 1) + 10, ep(tgt, 2) - 12)-(ep(tgt, 1) + 10, ep(tgt, 2) + 32)
LINE (ep(tgt, 1) - 12, ep(tgt, 2) + 10)-(ep(tgt, 1) + 32, ep(tgt, 2) + 10)
SELECT CASE whassis$
CASE CHR$(0) + CHR$(72), CHR$(0) + CHR$(75):
IF tgt = 1 THEN tgt = 4 ELSE tgt = tgt - 1
ghaflag = 0: FOR whoa = tgt TO 1 STEP -1
IF enemyat(whoa) > 0 THEN tgt = whoa: ghaflag = 1: whoa = 0
NEXT
IF ghaflag = 0 THEN
FOR whoa = 4 TO tgt STEP -1
IF enemyat(whoa) > 0 THEN tgt = whoa: whoa = 0
NEXT
END IF
CASE CHR$(0) + CHR$(77), CHR$(0) + CHR$(80):
IF tgt = 4 THEN tgt = 1 ELSE tgt = tgt + 1
ghaflag = 0
    FOR whoa = tgt TO 4
      IF enemyat(whoa) > 0 THEN
        tgt = whoa
        ghaflag = 1
        whoa = 5
      END IF
    NEXT
IF ghaflag = 0 THEN
FOR whoa = 1 TO tgt
IF enemyat(whoa) > 0 THEN tgt = whoa: whoa = 5
NEXT
END IF
CASE CHR$(13):
chosen(sabro, 3) = tgt: ERASE ep: PCOPY 4, 6: PCOPY 6, 0: EXIT SUB
CASE CHR$(27)
ErrorLevel = 1: ERASE ep: PCOPY 4, 6: PCOPY 6, 0: EXIT SUB
END SELECT
PCOPY 6, 0: LOOP
END SUB

SUB TargetEnemy2 (sabro)
IF chosen(2, 2) = 0 THEN EXIT SUB
IF magdata(chosen(2, 2), 2) = 1 THEN EXIT SUB
pn = magdata(chosen(2, 2), 1)
IF pn = 6 OR pn = 7 OR pn = 8 THEN TargetChar sabro: EXIT SUB
TargetEnemy1 sabro
END SUB

REM $STATIC
SUB TestForLevelUp
    IF chrexp% >= 2 ^ level% THEN
      LOCATE 20, 10
      PRINT "You gained a level!"
      level% = level% + 1
      hpmax = hpmax + 25
      WaitKey
    END IF
END SUB

REM $DYNAMIC
SUB TossStar (snum, EnemyTargeted)
AdjustInventory snum, -1

DIM ex(4), ey(4)

CALL AttackPattern1(ex(), ey())

PCOPY 6, 3: LINE (210, 5)-(314, 25), 0, BF
LINE (210, 5)-(314, 25), 12, B
LOCATE 2, 29
COLOR 15: PRINT ItemName$(snum)
    Mode7ShowAndRestore 1
    PCOPY 3, 0
CALL EstablishTarget(enemyat%(), EnemyTargeted%)

  DIM coverup%(140): SCREEN 7, 0, 7, 0
GET (280, 110)-(299, 129), coverup%: SCREEN 7, 0, 6, 0
PUT (280, 110), coverup%, PSET
PUT (280, 110), Mode7Bitmap(0, 11), AND
PUT (280, 110), Mode7Bitmap(0, 10), OR
PCOPY 6, 3
FOR az = ex(EnemyTargeted) + 60 TO ex(EnemyTargeted) STEP -3
  PCOPY 3, 6
  PUT (az, ey(EnemyTargeted)), Mode7Bitmap(0, 23), AND
  PUT (az, ey(EnemyTargeted)), Mode7Bitmap(0, 22), OR
  PCOPY 6, 0: delay .05
NEXT
IF snum = 1 THEN DamageEnemy 0, 325, EnemyTargeted
IF snum = 2 THEN DamageEnemy 0, 450, EnemyTargeted
SCREEN 7, 0, 6, 0: PCOPY 7, 6: delay 1: PlaceEnemies
ERASE ex, ey, coverup%
END SUB

SUB WinBattle
IF totalexp = 0 THEN EXIT SUB
COLOR 15: LINE (0, 0)-(319, 31), 0, BF
LINE (0, 31)-(319, 31), 12: LOCATE 3, 40: PRINT CHR$(26)
PCOPY 6, 3: LOCATE 1, 1: PRINT "Gained"; totalexp;
PRINT "experience!": GOSUB WWinKey
FOR h = 1 TO 3
IF CurHP(h) > 0 THEN curexp(h) = curexp(h) + totalexp
IF curexp(h) > 20000 THEN curexp(h) = 20000
NEXT
  FOR h = 1 TO 3
    IF curlev(h) < UBOUND(levelup) + 1 THEN
      IF curexp(h) >= levelup(curlev(h)) THEN
        curlev(h) = curlev(h) + 1
        dhp = INT(.2 * charstat(h, 1))
        charstat(h, 1) = charstat(h, 1) + dhp
        IF charstat(h, 1) > 9999 THEN charstat(h, 1) = 9999
        CurHP(h) = CurHP(h) + dhp
        IF CurHP(h) > 9999 THEN CurHP(h) = 9999
        PRINT HeroName$(h); " gained a level!"
        IF h = 2 THEN
          charstat(2, 2) = charstat(2, 2) + 50
          curmp = curmp + 50
        END IF
        IF h = 2 AND maglearn(curlev(h)) > 0 THEN
          spellsknown(maglearn(curlev(h))) = 1
          PRINT "Learned "; UCASE$(mn$(maglearn(curlev(h)))); "!"
        END IF
        GOSUB WWinKey
      END IF
    END IF
  NEXT
    FOR gafl = 1 TO 4
IF gitm(gafl) > 0 THEN
exrt = INT(RND(1) * 100)
IF exrt < 10 THEN

IF InInventory(gitm(gafl)) <> 99 THEN AdjustInventory gitm(gafl), 1
PRINT "Found "; UCASE$(ItemName$(gitm(gafl))); "!"
GOSUB WWinKey
END IF
END IF
NEXT: curgold = curgold + TotalGold&
IF curgold > 9999 THEN curgold = 9999
PRINT "Received"; TotalGold&; "GP!": LOCATE 3, 40
PRINT CHR$(254): GOSUB WWinKey: EXIT SUB
WWinKey:
PCOPY 6, 0: SLEEP: dm$ = INKEY$
PCOPY 3, 6: LOCATE 1, 1: RETURN
END SUB

