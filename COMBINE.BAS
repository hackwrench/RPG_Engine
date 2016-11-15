DEFINT A-Z
'$DYNAMIC
TYPE ByteArray
    Byte AS STRING * 1
END TYPE

TYPE ChunkHeader
    ChunkType AS STRING * 4
    Chunksize AS LONG
END TYPE

TYPE MsgLastProperties
    EndChar AS STRING * 1
    Placement AS INTEGER
END TYPE

TYPE PalValue
    red AS STRING * 1
    green AS STRING * 1
    blue AS STRING * 1
END TYPE

TYPE Location
    x AS INTEGER
    y AS INTEGER
END TYPE

TYPE ProfileType
    TL AS Location
    'TR AS Location
    'BL AS INTEGER
    BR AS Location
END TYPE

TYPE chest
    Item AS INTEGER
    Quantity AS INTEGER
    Flags AS INTEGER
END TYPE

DECLARE SUB Init1 ()
DECLARE SUB Init2 ()
DECLARE SUB Init3 ()
DECLARE SUB Init4 ()
DECLARE SUB Init5 ()

DECLARE SUB LoadAnimFrameList (FileName$)

DECLARE SUB RunScript (File1$, File2$)
DECLARE SUB CheckWalkOver ()


DECLARE SUB ShowList (FileName$)

DECLARE SUB ODebug ()

DECLARE SUB CheckForBattle1a (Key$)

DECLARE SUB MapRenderScreen ()

DECLARE SUB SetPlayerLoc (x%, y%)

DECLARE SUB EnemiesWontAttack (TrueOrFalse%)

DECLARE SUB CalcSomething (AnimFrame%, somethingup%, somethingpx%)
DECLARE SUB AdjustPlayerLoc (x%, y%)

DECLARE SUB CheckSurroundings ()
DECLARE SUB Battle2Init ()

DECLARE SUB GoRight ()
DECLARE SUB GoDown ()

DECLARE SUB GoUp ()
DECLARE SUB GoLeft ()

DECLARE SUB MapType1DataInit ()

DECLARE SUB GetMapGraphic (x1%, y1%, x2%, y2%, ImageNumber%)

DECLARE SUB SetMapType (NewMapType%)

DECLARE SUB MapLocIntrinsicFunctionChange (x%, y%)

DECLARE FUNCTION MapBitmap% (x%, y%)

DECLARE SUB PricesInit ()
DECLARE SUB DrawCharacter ()

DECLARE FUNCTION SizeOfTable% (Table%, Tables() AS INTEGER, Index() AS INTEGER)
DECLARE SUB SetBattleBackground (NewBattleBackground%)

DECLARE FUNCTION ItemName$ (item%)
DECLARE FUNCTION NumberOfChunks% (fc%, ChunkType$)
DECLARE FUNCTION ReverseLong& (longInt&)

DECLARE FUNCTION InInventory% (item%)

DECLARE SUB BattleMenuInit ()

DECLARE SUB AdjustInventory (item%, Amount%)
DECLARE SUB SetInventory (item%, Amount%)

DECLARE SUB PartyHPRestored ()
DECLARE SUB PartyMPRestored ()

DECLARE SUB LoadMapFunctionsChangeList (FileName$)
DECLARE SUB LoadSets (N1%, N2%, Array%(), fp%)

DECLARE FUNCTION FileOPEN% (FileName$, Mode$)

DECLARE SUB ShopkeeperScreen1Redraw ()

DECLARE SUB CharHPList (Char%, x%, y%)

DECLARE SUB DGameGraphicInit ()
DECLARE SUB parser ()
DECLARE SUB LoadGraphic (FileName$)
DECLARE SUB battle2 ()
DECLARE SUB colledj ()
DECLARE SUB computesolid ()
DECLARE FUNCTION ConfusedInc% (a%, B%)

DECLARE SUB inns ()
DECLARE SUB zzztime ()
DECLARE SUB load ()
DECLARE SUB move (psr$)
DECLARE SUB wins ()
DECLARE SUB WeaponShop ()
DECLARE SUB SaveGroundAndDrawPlayer ()
DECLARE SUB save ()
DECLARE SUB WaitKey ()


DECLARE SUB LoadBlockList (FileName$)

DECLARE SUB LoadProxyList (FileName$)

DECLARE SUB Mode7ShowAndRestore (DelTime!)

DECLARE SUB SpellFireGraphic (ex%, ey%)

DECLARE FUNCTION EnumeratedList$ (Text$, Number&)

DECLARE FUNCTION READBIT% (BYVAL Value%, BYVAL Bit%)
DECLARE SUB ChestsLoad (FileName AS STRING)

DECLARE SUB MultiPrint (Text$(), x%, y%)

DECLARE FUNCTION EnemiesRemaining% (enemyat%())

DECLARE SUB AttackPattern1 (ex%(), ey%())

DECLARE SUB DisplayAttackName (Attack$)

DECLARE FUNCTION ZeroDelimitedInt$ (Value%, Length%)

DECLARE SUB EstablishTarget (enemyat%(), EnemyTargeted%)
DECLARE FUNCTION MultiText$ (FileName$, Temp&)

DECLARE SUB Land13DBQuery ()

DECLARE SUB TalkLoad ()

DECLARE SUB DebugTools ()
DECLARE SUB Land13Show ()

DECLARE SUB SetPal (Entry%, Value AS ANY)
DECLARE SUB GETPAL (Entry%, Value AS ANY)
DECLARE SUB MCOLOR (forecolor%, backcolor%)
DECLARE SUB ModPal ()

DECLARE FUNCTION ScreenMode%
DECLARE SUB Actions (Temp$)

DECLARE SUB PlayKonrad ()

DECLARE SUB CalcSomething (dir%, somethingup%, somethingover%)

DECLARE SUB CheckForBattle (a$)

DECLARE SUB Land13Init ()
DECLARE SUB SetupStats ()
DECLARE SUB GridStr (Graphic%())
DECLARE SUB GridInt ()
DECLARE SUB DrawLevel ()
DECLARE SUB Blockade (x%, y%)
DECLARE SUB UseSomething ()
DECLARE SUB FileToScreen (FileName$)
DECLARE SUB DoBox ()

DECLARE FUNCTION PartyImmobilized% ()

DECLARE SUB MsgRunDisabled ()
DECLARE SUB MsgRunSuccess ()
DECLARE SUB MsgRunFail ()
DECLARE SUB MsgLast ()
DECLARE SUB DebugKeys (Key$)

DECLARE SUB MapRetrieve (Integ%, Lines%)
DECLARE SUB MapFileListInit ()

DECLARE FUNCTION Surrounding% (ttlf$)
DECLARE SUB Epilogue ()
DECLARE SUB StayTheNight ()
DECLARE SUB CampGround ()
DECLARE SUB StatusScreen ()
DECLARE SUB EquipItems ()
DECLARE SUB Mosaic (Siz)
DECLARE SUB CheapSkate ()
DECLARE SUB EnsueBattle ()
DECLARE SUB WinBattle ()
DECLARE SUB SetBattle (batnum, enum)
DECLARE SUB RandBattle (batnum1, batnum2)
DECLARE SUB PlaceEnemies ()
DECLARE SUB IsPartyDead ()
DECLARE SUB CharMenu (sabro)
DECLARE SUB CharAttack (sabro)
DECLARE SUB AttackKyta (EnemyTargeted)
DECLARE SUB AttackGlenlin (EnemyTargeted)
DECLARE SUB AttackKohlen (EnemyTargeted)
DECLARE SUB BeamAttack (bnum, EnemyTargeted)
DECLARE SUB JumpAttack (EnemyTargeted)
DECLARE SUB TossStar (snum, EnemyTargeted)
DECLARE SUB EnemyAttack (enum)
DECLARE SUB KillEnemy (EnemyTargeted)
DECLARE SUB KillChar (EnemyTargeted)
DECLARE SUB EnemyGo (sabro)
DECLARE SUB TargetEnemy1 (sabro)
DECLARE SUB TargetEnemy2 (sabro)
DECLARE SUB TargetChar (sabro)
DECLARE SUB ChooseBeam ()
DECLARE SUB ChooseMagic ()
DECLARE SUB ChooseStar ()

DECLARE SUB SpellCast (spnum, EnemyTargeted)
DECLARE SUB SpellLightning (ex%, ey%, EnemyTargeted%, TargetIsChar%)
DECLARE SUB SpellLightningGraphic (ex%, ey%)
DECLARE SUB SpellReflectGraphic (ex%, ey%, Speed!)
DECLARE SUB SpellDrownGraphic (ex%, ey%)

DECLARE SUB SpellEnemy (spnum)
DECLARE SUB SpellReflect (spnum, EnemyTargeted)
DECLARE SUB SpellFire (ex, ey, EnemyTargeted)
DECLARE SUB SpellIce (ex, ey, EnemyTargeted)
DECLARE SUB SpellDrown (ex, ey, EnemyTargeted, TargetIsChar%)
DECLARE SUB SpellTremor (ex, ey, EnemyTargeted)
DECLARE SUB DamageChar (tdmg, EnemyTargeted)
DECLARE SUB DamageEnemy (elm, tdmg, EnemyTargeted)
DECLARE SUB NotEnoughMP ()
DECLARE SUB RunAway ()
DECLARE SUB Battle7Init ()
DECLARE SUB DrawBattleField ()
DECLARE SUB DrawBattleCave ()
DECLARE SUB MapDraw (backcolor)
DECLARE SUB DrawGraphic (endcor%)

DECLARE SUB PlayMainGame ()
DECLARE SUB TalkVillager (vlgnum)
DECLARE SUB InnkeeperTalk ()
DECLARE SUB ShopkeeperTalk ()
DECLARE SUB BuyItem ()
DECLARE SUB SellItem ()
DECLARE SUB TalkQueen ()
DECLARE SUB TalkKing ()
DECLARE SUB TreasureChest (trnum%)
DECLARE SUB ChestOpened ()
DECLARE SUB RemoveGraphics ()
DECLARE SUB delay (DelTime#)

CONST False = 0
CONST TRUE = NOT False

DIM SHARED DebugNoEnemies%, DebugRun%, DebugPos%, DebugEnemiesAnyway%
DIM SHARED NoEnemies%

DIM SHARED ProxyList(0 TO 255) AS STRING * 1
DIM SHARED BlockList(0 TO 255) AS STRING * 1

DIM SHARED DoActions%

DIM SHARED MapFileList(0 TO 0) AS STRING

DIM SHARED Mode7Bitmap(121, 0 TO 23)
DIM SHARED mn$(12)
DIM SHARED mpused(12), levelup(4), curexp(3), curlev(3), ItemName$(18)



DIM SHARED Bang1(70), Bangm(70), Villager$(7, 3), Treasure(0 TO 0) AS chest
DIM SHARED curmap$(1 TO 1), px, py, qu$(6), ki$(9), totalback


DIM SHARED etype(5, 13), ename$(5), inven(18), equip(3, 2)
DIM SHARED charstat(3, 4), curhp(3), curgold, curmp, ErrorLevel
DIM SHARED spellsknown(12), mapnumber, enemyat(4), cannotrun
DIM SHARED weak(5), strn(5), maglearn(2 TO 5), magdata(12, 2)
DIM SHARED canequip(3, 4), chosen(3, 3), power(6 TO 17, 2)
DIM SHARED ehit(4), totalexp, totalgold, gitm(4), walled(4)


DIM SHARED item.lvl(1 TO 5) AS STRING
DIM SHARED up AS INTEGER, over AS INTEGER, dir AS INTEGER
DIM SHARED hp AS INTEGER, mp AS INTEGER, hpmax AS INTEGER
DIM SHARED money AS INTEGER, exper AS INTEGER, mpmax AS INTEGER
DIM SHARED inv AS STRING, lefttonext AS INTEGER, lvl AS INTEGER
DIM SHARED KonAttack%, defense AS INTEGER, stage AS INTEGER
DIM SHARED SpaceClear AS INTEGER

DIM SHARED Mode13Graphic(0 TO 501, 0 TO 171)

'For Crosswalk
DIM SHARED NSflag%, EWflag%
DIM SHARED CharacterDraw%

CharacterDraw% = -1

ON ERROR GOTO ErrorHandle

SelGame:
    OPEN "RPGLIST.LIS" FOR INPUT AS 1
    LINE INPUT #1, TempT$
    Temp& = VAL(TempT$)
    FOR i& = 1 TO Temp&
      LINE INPUT #1, TempT$
      PRINT EnumeratedList(TempT$, i&)
    NEXT
    CLOSE

  INPUT a%
  IF a% = 1 THEN
    CALL LoadBlockList("BTLDEMO.TAB")
    TalkLoad
    ChestsLoad "TLDEMO.TRA"
    Battle7Init
    MapFileListInit
    MapRetrieve 0, 20
    MapDraw 2
    PlayMainGame
  ELSEIF a% = 2 THEN
    SCREEN 13
    CALL Land13Init
    CALL LoadProxyList("NEWGAME.TAB")
    CALL LoadBlockList("BNEWGAME.TAB")

    CALL SetupStats
    NoEnemies% = TRUE
    CALL DrawLevel
    CALL PlayKonrad
  ELSEIF a% = 3 THEN
    Battle7Init
    COLOR , 0
    SCREEN 13
    Land13Init
    CALL LoadProxyList("NEWGAME.TAB")
    CALL LoadBlockList("BNEWGAME.TAB")
    NoEnemies% = False
    CALL SetupStats
    CALL DrawLevel
    CALL PlayKonrad
  ELSEIF a% = 4 THEN
    ChestsLoad "TLDEMO.TRA"
    TalkLoad
    Battle7Init
    SCREEN 13
    CALL Land13Init
    CALL LoadProxyList("GTLDEMO.TAB")
    CALL LoadBlockList("BTLDEMO.TAB")
  
    MapFileList(0) = "CITYCAVE.MAP"
    MapRetrieve 0, 43
    DoActions% = TRUE
    over = px
    up = py + 20
    dir = 1
    CALL DrawLevel
    CALL PlayKonrad
  ELSEIF a% = 5 THEN
    Battle7Init
    SCREEN 13
    CALL Land13Init
    CALL LoadProxyList("NEWGAME.TAB")
    CALL LoadBlockList("BNEWGAME.TAB")
   
    SCREEN 0
    WIDTH 80
    CALL DebugTools
  ELSEIF a% = 6 THEN
  ELSE
   GOTO SelGame
  END IF
END


ErrorHandle:
    ErrorType% = ERR
RESUME NEXT



'Data for inventory

DATA 9,12,10,13,11,14
DATA 6,9,12,15,7,10,13,16,8,11,14,17
'Data for character status
DATA 5467,0,107,95,3489,100,57,78,7886,0,99,97
'Data for weapon/armor power/price
DATA 182,109,203,107,57,99,95,78,97,137,255,151
DATA 1000,500,750,200,100,250,100,50,200,1000,15000,2000
'Data for magic
DATA 1,1,1,1,1,1,1,1,1,0,0,0,5,8,7,7,7,10,10,6,15,20,40,40
DATA 10,11,12,0,6,0,6,1,1,0,2,0,3,0,5,0,4,0,7,0,8,0,5,1
DATA 0,1,4,1
'Data for enemies
DATA 5,3,3,5,4,3,1,5,2,1
DATA 210,50,25,0,0,1,1,0,0,0,100,150,0
DATA 500,10,5,1,1,0,0,1,0,0,200,250,1
DATA 190,50,200,1,0,1,1,0,0,0,200,500,7
DATA 500,75,25,1,1,1,0,1,1,0,350,750,2
DATA 1000,50,100,1,1,1,1,1,1,1,750,1500,18
'Data for level-ups
DATA 500,1500,4000,10000


SUB BuyItem
StartofBuyingSub:
COLOR 15
LINE (0, 0)-(319, 199), 1, BF
LINE (0, 0)-(319, 199), 12, B
LINE (0, 31)-(319, 31), 12
LOCATE 2, 3
PRINT "OK, whaddaya want?"
REDIM itmno(5)
itmno(1) = 6
itmno(2) = 7
itmno(3) = 8
itmno(4) = 15
itmno(5) = 17
FOR gab = 1 TO 5
    COLOR 14
    LOCATE gab + 9, 12
    PRINT ItemName$(itmno(gab))
    COLOR 15
    LOCATE gab + 9, 30
    PRINT "GP"; power(itmno(gab), 2): NEXT
PCOPY 2, 1
mychc = 1
: DO
: PCOPY 1, 2
: COLOR 15
LOCATE mychc + 9, 10
: PRINT CHR$(26)
: PCOPY 2, 0
ii$ = INKEY$:
SELECT CASE ii$
CASE CHR$(0) + CHR$(72), CHR$(0) + CHR$(75):
mychc = mychc - 1
: IF mychc = 0 THEN mychc = 5
CASE CHR$(0) + CHR$(77), CHR$(0) + CHR$(80):
mychc = mychc + 1
: IF mychc = 6 THEN mychc = 1
CASE CHR$(27):
 ii$ = CHR$(13)
: mychc = 6
END SELECT
LOOP UNTIL ii$ = CHR$(13)
IF mychc = 6 THEN ERASE itmno
: EXIT SUB

IF curgold < power(itmno(mychc), 2) THEN
cannotrun = 1: COLOR , totalback: CheapSkate: EXIT SUB
END IF
LOCATE 2, 3: PRINT "You sure you want it? (Y/N)"
PCOPY 2, 0
DO
ii$ = INKEY$
LOOP UNTIL ii$ <> ""
IF UCASE$(ii$) = "Y" THEN
curgold = curgold - power(itmno(mychc), 2)
inven(itmno(mychc)) = inven(itmno(mychc)) + 1
IF inven(itmno(mychc)) = 100 THEN inven(itmno(mychc)) = 99
LOCATE 2, 3: PRINT "Sold!                         "
PCOPY 2, 0: delay 1
ELSE
GOTO StartofBuyingSub
END IF
ERASE itmno
END SUB

SUB CalcSomething (dir, somethingup, somethingover)
 IF dir = 1 OR dir = 2 THEN somethingup = 1: somethingover = 0
 IF dir = 3 OR dir = 4 THEN somethingup = -1: somethingover = 0
 IF dir = 5 OR dir = 6 THEN somethingup = 0: somethingover = -1
 IF dir = 7 OR dir = 8 THEN somethingup = 0: somethingover = 1
END SUB

SUB CampGround STATIC
  COLOR 15
  LINE (0, 0)-(319, 31), totalback, BF
  LINE (0, 31)-(319, 31), 12: LOCATE 1, 1
  PRINT "You've stumbled upon a campground."
  IF inven(18) = 0 THEN
PRINT "Unfortunately, you don't"
PRINT "have a tent.": LOCATE 3, 40
PRINT CHR$(254): PCOPY 2, 0: SLEEP: dmbo$ = INKEY$
ELSE
PRINT "Would you like to stay for"
PRINT "the night?           (Y/N)": LOCATE 3, 40
PRINT CHR$(26): PCOPY 2, 0: SLEEP: dmb$ = INKEY$
IF UCASE$(dmb$) = "Y" THEN
curgold = curgold + 50
inven(18) = inven(18) - 1: StayTheNight
END IF
PCOPY 5, 2: LOCATE py, px: COLOR 14: PRINT CHR$(1);
COLOR , totalback
END IF
END SUB

SUB CharAttack (sabro) STATIC
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

SUB CharMenu (sabro) STATIC
    DIM storechc$(1 TO 4)
    IF curhp(sabro) > 0 THEN
      LINE (250, 150)-(300, 185), 0, BF
      LINE (250, 150)-(300, 185), 12, B
    ELSE
      EXIT SUB
    END IF
COLOR 15
    SELECT CASE sabro
    CASE 1
      LINE (280, 60)-(300, 80), 12, B
      storechc$(1) = "FIGHT"
      storechc$(2) = "BEAM"
      storechc$(3) = "RUN"
      storechc$(4) = ""
   CASE 2
    LINE (280, 85)-(300, 105), 12, B
     storechc$(1) = "FIGHT"
     storechc$(2) = "MAGIC"
     storechc$(3) = "RUN"
     storechc$(4) = ""
   CASE 3
    LINE (280, 110)-(300, 130), 12, B
     storechc$(1) = "FIGHT"
     storechc$(2) = "JUMP"
     storechc$(3) = "THROW"
     storechc$(4) = "RUN"
   END SELECT
   MultiPrint storechc$(), 33, 20
  PCOPY 6, 3: LOCATE 20, 33: COLOR 13: PRINT storechc$(1)
mychoice = 1
DO
  v$ = INKEY$
  SELECT CASE v$
  CASE CHR$(0) + CHR$(72), CHR$(0) + CHR$(75)
    IF mychoice = 1 THEN
       IF storechc$(4) <> "" THEN
          mychoice = 4
       ELSE
          mychoice = 3
       END IF
    ELSE
       mychoice = mychoice - 1
    END IF
    PCOPY 3, 6: LOCATE 19 + mychoice, 33: PRINT storechc$(mychoice)
  CASE CHR$(0) + CHR$(77), CHR$(0) + CHR$(80)
    IF mychoice = 3 THEN
       IF storechc$(4) <> "" THEN
          mychoice = 4
       ELSE
          mychoice = 1
       END IF
    ELSE
       mychoice = mychoice + 1
    END IF
    PCOPY 3, 6: LOCATE 19 + mychoice, 33: PRINT storechc$(mychoice)
  CASE CHR$(13): chosen(sabro, 1) = mychoice: GOTO nextmenuifany
  CASE CHR$(27)
    chosen(sabro, 1) = 0: mychoice = 0: GOTO nextmenuifany
  END SELECT
  PCOPY 6, 0
LOOP
nextmenuifany:
saab = sabro: ERASE storechc$
IF mychoice = 1 THEN TargetEnemy1 sabro
IF sabro = 1 AND mychoice = 2 THEN
ChooseBeam
IF chosen(1, 2) > 0 THEN TargetEnemy1 sabro
END IF
IF sabro = 2 AND mychoice = 2 THEN ChooseMagic: TargetEnemy2 saab
IF sabro = 3 AND mychoice = 2 THEN TargetEnemy1 sabro
IF sabro = 3 AND mychoice = 3 THEN
ChooseStar
IF chosen(3, 2) > 0 THEN TargetEnemy1 sabro
END IF
PCOPY 4, 6: PCOPY 6, 0: delay .5
END SUB

SUB CheapSkate
SCREEN 7, 0, 2, 0
PCOPY 5, 2: LOCATE py, px: COLOR 14: PRINT CHR$(1);
COLOR 15: LINE (0, 0)-(319, 31), totalback, BF
LINE (0, 31)-(319, 31), 12: LOCATE 1, 1
PRINT "Hey, cheapskate! You don't have"
PRINT "enough GP! Do you think I'm just"
PRINT "gonna give it to you FOR FREE?!"
LOCATE 3, 40: PRINT CHR$(254): PCOPY 2, 0: SLEEP: dmb$ = INKEY$
END SUB




SUB DamageChar (tdmg, EnemyTargeted) STATIC
    DIM ly(3)
    ly(1) = 9
    ly(2) = 12
    ly(3) = 16
    PCOPY 3, 6
    PCOPY 3, 0
IF tdmg <> 0 THEN dmgcnt = INT(RND(1) * 50) + tdmg ELSE dmgcnt = 0
IF dmgcnt <> 0 THEN dmgcnt = dmgcnt - INT(.25 * charstat(EnemyTargeted, 4))
curhp(EnemyTargeted) = curhp(EnemyTargeted) - dmgcnt
IF curhp(EnemyTargeted) > charstat(EnemyTargeted, 1) THEN curhp(EnemyTargeted) = charstat(EnemyTargeted, 1)
SCREEN 7, 0, 0, 0: LOCATE ly(EnemyTargeted), 34
IF dmgcnt < 0 THEN COLOR 10 ELSE COLOR 12
IF dmgcnt = 0 THEN PRINT "Miss!" ELSE PRINT ABS(dmgcnt)
IF curhp(EnemyTargeted) < 1 THEN curhp(EnemyTargeted) = 0: KillChar EnemyTargeted
ERASE ly
END SUB

SUB DamageEnemy (elm, tdmg, EnemyTargeted) STATIC
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

SUB DebugKeys (Key$)
    SELECT CASE Key$
    CASE "!"
         DebugNoEnemies% = NOT DebugNoEnemies%
    CASE "?"
         DebugRun% = NOT DebugRun%
    CASE "#"
         DebugPos% = NOT DebugPos%
    END SELECT
END SUB

SUB DebugTools
SelDebug:
    PRINT "1. Display current mode 13 Graphics Database"
    PRINT "2. Step through all mode 13 graphics"
    INPUT a%
    SELECT CASE a%
    CASE 1
    SCREEN 13
    CALL Land13DBQuery
    SCREEN 0
    WIDTH 80
    GOTO SelDebug
    CASE 2
      SCREEN 13
      FOR i = 0 TO 171
        CLS
        PUT (0, 0), Mode13Graphic(0, i), PSET
        LOCATE 4, 4
        PRINT i
        DO
        LOOP UNTIL INKEY$ <> ""
      NEXT i
    CASE ELSE
    GOTO SelDebug
    END SELECT
END SUB

SUB DisplayAttackName (Attack$)
   PCOPY 6, 3
   LINE (225, 5)-(314, 25), 0, BF
   LINE (225, 5)-(314, 25), 12, B
   LOCATE 2, 30
   COLOR 15
   PRINT Attack$
   PCOPY 6, 0
   delay 1
   PCOPY 3, 0
   PCOPY 3, 6
END SUB

SUB DoBox
    COLOR 15
    LINE (0, 0)-(319, 31), totalback, BF
    LINE (0, 31)-(319, 31), 12

END SUB

SUB DrawBattleCave
SCREEN 7, 0, 7, 0
LINE (0, 0)-(319, 50), 6, BF
LINE (0, 51)-(319, 199), 6, BF
cntr = 1
FOR lookreal = 50 TO 199
    cntr = cntr + 1
    LINE (0, lookreal + 1)-(319, lookreal + cntr), 14, BF
lookreal = lookreal + cntr
NEXT
END SUB

SUB DrawBattleField
SCREEN 7, 0, 7, 0
LINE (0, 0)-(319, 50), 11, BF
LINE (0, 51)-(319, 199), 2, BF
    cntr = 1
    FOR lookreal = 50 TO 199
      cntr = cntr + 1
      LINE (0, lookreal + 1)-(319, lookreal + cntr), 10, BF
      lookreal = lookreal + cntr
    NEXT
    CIRCLE (160, 50), 25, 14, , 3.15
    LINE (135, 50)-(185, 50), 14
    PAINT (160, 48), 14: cntr = 0
    COLOR 14
    FOR lookreal = 51 TO 76
      cntr = cntr + 1
      LINE (135 + cntr * 4, lookreal + cntr)-(185 - cntr * 4, lookreal + cntr)
      lookreal = lookreal + cntr
    NEXT
END SUB

SUB DrawGraphic (endcor%)
    
    FOR yc = 0 TO endcor%: FOR xc = 0 TO endcor%
       INPUT #1, bitpixel$
       IF bitpixel$ = "x" THEN
         PSET (xc, yc), 0
         PSET (xc + endcor + 1, yc), 15
       ELSE
         PSET (xc, yc), VAL(bitpixel$)
         PSET (xc + endcor + 1, yc), 0
       END IF
    NEXT: NEXT
END SUB

SUB DrawLevel

FOR i% = 1 TO 7
FOR h% = 1 TO 7
   PUT ((h% * 25), (i% * 20)), Mode13Graphic(0, ASC(ProxyList(ASC(MID$(curmap$((up - 4) + i%), (over - 4) + h%, 1))))), PSET
NEXT h%
NEXT i%

IF CharacterDraw% THEN
   IF dir = 1 THEN
     PUT (4 * 25, 4 * 20), Mode13Graphic(0, 163), AND
     PUT (4 * 25, 4 * 20), Mode13Graphic(0, 154), OR
   END IF
   IF dir = 2 THEN PUT (4 * 25, 4 * 20), Mode13Graphic(0, 164), AND: PUT (4 * 25, 4 * 20), Mode13Graphic(0, 155), OR
   IF dir = 3 THEN PUT (4 * 25, 4 * 20), Mode13Graphic(0, 165), AND: PUT (4 * 25, 4 * 20), Mode13Graphic(0, 156), OR
   IF dir = 4 THEN PUT (4 * 25, 4 * 20), Mode13Graphic(0, 166), AND: PUT (4 * 25, 4 * 20), Mode13Graphic(0, 157), OR
   IF dir = 5 THEN PUT (4 * 25, 4 * 20), Mode13Graphic(0, 167), AND: PUT (4 * 25, 4 * 20), Mode13Graphic(0, 158), OR
   IF dir = 6 THEN PUT (4 * 25, 4 * 20), Mode13Graphic(0, 168), AND: PUT (4 * 25, 4 * 20), Mode13Graphic(0, 159), OR
   IF dir = 7 THEN PUT (4 * 25, 4 * 20), Mode13Graphic(0, 169), AND: PUT (4 * 25, 4 * 20), Mode13Graphic(0, 160), OR
   IF dir = 8 THEN PUT (4 * 25, 4 * 20), Mode13Graphic(0, 170), AND: PUT (4 * 25, 4 * 20), Mode13Graphic(0, 161), OR
END IF
IF DebugPos% THEN
 LOCATE 20, 20
 PRINT ASC(MID$(curmap$(up), over, 1)), ASC(ProxyList(ASC(MID$(curmap$(up), over, 1))))
END IF
Key$ = INKEY$

END SUB

REM $STATIC
FUNCTION EnemiesRemaining (enemyat())
    FOR slot = 1 TO 4
      count = count + enemyat(slot)
    NEXT
    EnemiesRemaining = count
END FUNCTION

REM $DYNAMIC
SUB EnemyAttack (enum)
DIM ey(3)
ey(1) = 65
ey(2) = 90
ey(3) = 115
PCOPY 6, 3
DO
    rtarg = INT(RND(1) * 3) + 1
    IF rtarg = 4 THEN rtarg = 3
LOOP UNTIL curhp(rtarg) > 0
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

SUB EnemyGo (sabro) STATIC
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
   IF mapnumber = 1 THEN DrawBattleField ELSE DrawBattleCave
   ErrorLevel = 0
   totalexp = 0
   totalgold = 0
   FOR gh = 1 TO 4
   gitm(gh) = 0
   ehit(gh) = 0
IF enemyat(gh) > 0 THEN
ehit(gh) = etype(enemyat(gh), 1)
totalexp = totalexp + etype(enemyat(gh), 11)
totalgold = totalgold + etype(enemyat(gh), 12)
gitm(gh) = etype(enemyat(gh), 13)
END IF
NEXT: SCREEN 7, 0, 6, 0: PCOPY 7, 6
PlaceEnemies
DO
PCOPY 6, 4
FOR sabro = 1 TO 3: CharMenu sabro
   IF ErrorLevel = 1 THEN sabro = sabro - 1: ErrorLevel = 0
NEXT: FOR xab = 300 TO 0 STEP -1: FOR sabro = 1 TO 3
IF charstat(sabro, 3) = xab THEN CharAttack sabro: IsPartyDead
NEXT
    FOR sabro = 1 TO 4
    IF enemyat(sabro) > 0 THEN
      ghaj = enemyat(sabro)
      IF etype(ghaj, 2) = xab THEN EnemyGo sabro: IsPartyDead
   END IF
NEXT: NEXT

IF EnemiesRemaining(enemyat()) = 0 THEN GOTO endbattle

PCOPY 6, 0: LOOP
endbattle:
PCOPY 6, 0: WinBattle
COLOR , totalback: SCREEN 7, 0, 2, 0: cannotrun = 0
FOR abab = 1 TO 4: enemyat(abab) = 0: NEXT
FOR abab = 1 TO 3: walled(abab) = 0: NEXT
END SUB

REM $STATIC
FUNCTION EnumeratedList$ (Text$, Number&)
EnumeratedList$ = LTRIM$(STR$(Number&)) + ". " + Text$
END FUNCTION

REM $DYNAMIC
SUB Epilogue STATIC
COLOR 14, 0: LOCATE 15, 20: PRINT CHR$(2)
LOCATE 20, 15: PRINT CHR$(1); "    "; CHR$(1); "    "; CHR$(1)
COLOR 15: LOCATE 1, 1: PRINT "KING: Thank you for saving my body"
PRINT "from those awful Vampiras. You will"
PRINT "be well rewarded for this! You will"
PRINT "all be knighted, and held in the"
PRINT "highest of honor in my kingdom!"
delay 10: PRINT "I knight thee Sir Kyta Simit!"
COLOR 7: LOCATE 20, 15: PRINT CHR$(2): delay 5: COLOR 15
LOCATE 7, 1: PRINT "I knight thee Sir Glenlin Mugos!"
LOCATE 20, 20: COLOR 7: PRINT CHR$(2): COLOR 15: delay 5
LOCATE 8, 1: PRINT "I knight thee Sir Kohlen Elder!"
LOCATE 20, 25: COLOR 7: PRINT CHR$(2): COLOR 15: delay 5
CLS : PRINT "And so ends the RPG engine demo game..."
delay 3: PRINT "But YOU can continue the story...": delay 5
END SUB

SUB EquipItems
CLS : LINE (0, 0)-(319, 199), 1, BF
LINE (0, 0)-(319, 199), 12, B
LOCATE 2, 3: COLOR 15: PRINT "Equip who?"
COLOR 14: LOCATE 15, 17: PRINT "Kyta"
LOCATE 16, 17: PRINT "Glenlin"
LOCATE 17, 17: PRINT "Kohlen"
LOCATE 18, 17: PRINT "EXIT"
PCOPY 2, 1: mychc = 1
DO
    PCOPY 1, 2
    COLOR 15
    LOCATE mychc + 14, 15
    PRINT CHR$(26)
    PCOPY 2, 0
ii$ = INKEY$
    SELECT CASE ii$
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
inven(equip(mychc, 1)) = inven(equip(mychc, 1)) + 1
inven(equip(mychc, 2)) = inven(equip(mychc, 2)) + 1
equip(mychc, 1) = 0: equip(mychc, 2) = 0
COLOR 14
    FOR ha = 1 TO 2
      LOCATE ha + 15, 10
      IF inven(canequip(mychc, ha)) > 0 THEN
        PRINT ItemName$(canequip(mychc, ha))
        LOCATE ha + 15, 28
        goby$ = LTRIM$(STR$(power(canequip(mychc, ha), 1)))
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
IF mychc < 3 AND inven(canequip(mypers, mychc)) > 0 THEN
mc = mychc
inven(canequip(mypers, mc)) = inven(canequip(mypers, mc)) - 1
equip(mypers, 1) = canequip(mypers, mychc)
charstat(mypers, 3) = power(canequip(mypers, mychc), 1)
PRINT ItemName$(canequip(mypers, mychc))
ELSE
equip(mypers, 1) = 0: charstat(mypers, 3) = 0
PRINT "<Nothing>"
END IF
LINE (0, 42)-(319, 199), 1, BF: COLOR 15
LOCATE 7, 3: PRINT "Please choose an armor:"
COLOR 14: FOR ha = 3 TO 4: LOCATE ha + 13, 10
IF inven(canequip(mypers, ha)) > 0 THEN
PRINT ItemName$(canequip(mypers, ha))
LOCATE ha + 13, 28
goby$ = LTRIM$(STR$(power(canequip(mypers, ha), 1)))
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
IF inven(canequip(mypers, mychc + 2)) > 0 THEN
mc = mychc + 2
inven(canequip(mypers, mc)) = inven(canequip(mypers, mc)) - 1
equip(mypers, 2) = canequip(mypers, mc)
charstat(mypers, 4) = power(canequip(mypers, mc), 1)
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

SUB FileToScreen (FileName$)
DEF SEG = &HA000 'Load land for some graphics
BLOAD FileName$, 0
END SUB

SUB ImportMenus (FileName$, MenuIndex%(), MenuTable%())
DIM Header AS ChunkHeader
fc% = FileOPEN(FileName$, "B")
CurrMenu% = 1
ImportMenusTop:
Temp% = NumberOfChunks%(fc%, "MENU")
IF Temp% = 0 THEN EXIT SUB
REDIM MenuTable(1 TO Temp%)
PreserveSeek& = SEEK(fc%)
GlonkOfIndex% = 0
FOR i% = 1 TO Temp%
    GetAnother:
    GET fc%, , Header
    Header.Chunksize = ReverseLong&(Header.Chunksize)
    SEEK fc%, SEEK(fc%) + Header.Chunksize
    IF Header.ChunkType = "MENU" THEN
        'A 'Glonk' is a value that is both the size and the next element
        MenuTable%(i%) = GlonkOfIndex%
        GlonkOfIndex% = GlonkOfIndex% + Header.Chunksize / 2
    ELSE
        GOTO GetAnother
    END IF
NEXT
REDIM MenuIndex%(0 TO GlonkOfIndex - 1)

SEEK fc%, PreserveSeek&
'This is the last time through
GetHeader = TRUE
FOR i% = 0 TO GlonkOfIndex - 1
    GetAnother2:
    IF GetHeader = TRUE THEN
        GET fc%, , Header
        Header.Chunksize = ReverseLong&(Header.Chunksize)
        IF Header.ChunkType = "MENU" THEN
            GetHeader = False
        ELSE
            SEEK fc%, SEEK(fc%) + Header.Chunksize
            GOTO GetAnother2
        END IF
    END IF
    GET fc%, , MenuIndex(i%)
    Header.Chunksize = Header.Chunksize - 2
    IF Header.Chunksize = 0 THEN GetHeader = TRUE
NEXT
CLOSE fc%
END SUB

SUB InnkeeperTalk
COLOR 15: LINE (0, 0)-(319, 31), totalback, BF
LINE (0, 31)-(319, 31), 12: LOCATE 1, 1
PRINT "Care to stay the night? It's"
PRINT "only 50 GP."
PRINT "                       (Y/N)"
LOCATE 3, 40: PRINT CHR$(26): PCOPY 2, 0: SLEEP: dmb$ = INKEY$
IF UCASE$(dmb$) = "Y" THEN StayTheNight
PCOPY 5, 2: LOCATE py, px: COLOR 14: PRINT CHR$(1);
COLOR , totalback
END SUB

SUB IsPartyDead STATIC
   FOR ga = 1 TO 3
     IF curhp(ga) > 0 THEN EXIT SUB
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

 DIM coverup(140): SCREEN 7, 0, 7, 0
GET (280, 110)-(299, 129), coverup: SCREEN 7, 0, 6, 0
PUT (280, 110), coverup, PSET: PCOPY 6, 3
FOR bja = 110 TO 0 STEP -5
: PCOPY 3, 6
: PUT (280, bja), Mode7Bitmap(0, 11), AND
: PUT (280, bja), Mode7Bitmap(0, 10), OR
: PCOPY 6, 0
: delay .05
NEXT
: PCOPY 3, 0: delay 1
FOR bja = 0 TO ey(EnemyTargeted) STEP 5: PCOPY 3, 6
PUT (ex(EnemyTargeted), bja), Mode7Bitmap(0, 9), AND: PUT (ex(EnemyTargeted), bja), Mode7Bitmap(0, 8), OR
PCOPY 6, 0: delay .05: NEXT: FOR bja = ex(EnemyTargeted) TO 300 STEP 5
PCOPY 3, 6: PUT (bja, ey(EnemyTargeted)), Mode7Bitmap(0, 11), AND
PUT (bja, ey(EnemyTargeted)), Mode7Bitmap(0, 10), OR: PCOPY 6, 0: delay .05: NEXT
PCOPY 3, 0: delay 1: FOR bja = 0 TO 110 STEP 5: PCOPY 3, 6
PUT (280, bja), Mode7Bitmap(0, 9), AND: PUT (280, bja), Mode7Bitmap(0, 8), OR
PCOPY 6, 0: delay .05: NEXT: PCOPY 6, 3: DamageEnemy 0, 275, EnemyTargeted
SCREEN 7, 0, 6, 0: PCOPY 7, 6: delay 1: PlaceEnemies
ERASE ex, ey, coverup
END SUB

SUB KillChar (EnemyTargeted)
IF EnemyTargeted = 2 THEN
  FOR bgh = 1 TO 3
  walled(bgh) = 0
  NEXT
END IF
delay 1
curhp(EnemyTargeted) = 0
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

SUB KillEnemy (EnemyTargeted) STATIC
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

SUB Land13DBQuery

END SUB


SUB NotEnoughMP
COLOR 15
LINE (0, 0)-(319, 31), 0, BF
LINE (0, 31)-(319, 31), 12
LOCATE 1, 1
PRINT "You don't have enough MP"
PRINT "to cast that spell!"
LOCATE 3, 40
PRINT CHR$(254)
PCOPY 6, 0
SLEEP
dmbo$ = INKEY$
PCOPY 3, 6
PCOPY 3, 0
END SUB

SUB Land13Init
SCREEN 13
'Change all colors to black
FOR i = 1 TO 255
    PALETTE i, 0
NEXT i

FileToScreen "landscap.kon"
GET (1, 22)-(25, 41), Mode13Graphic(0, 0):
GET (157, 1)-(181, 20), Mode13Graphic(0, 1)
GET (183, 1)-(207, 20), Mode13Graphic(0, 2)
GET (261, 22)-(285, 41), Mode13Graphic(0, 3)
GET (1, 1)-(25, 20), Mode13Graphic(0, 4)
GET (27, 1)-(51, 20), Mode13Graphic(0, 5)
GET (53, 1)-(77, 20), Mode13Graphic(0, 6)
GET (79, 1)-(103, 20), Mode13Graphic(0, 7)
GET (105, 1)-(129, 20), Mode13Graphic(0, 8)
GET (131, 1)-(155, 20), Mode13Graphic(0, 9)
GET (209, 1)-(233, 20), Mode13Graphic(0, 10)
GET (235, 1)-(259, 20), Mode13Graphic(0, 11)
GET (261, 1)-(285, 20), Mode13Graphic(0, 12)
GET (287, 1)-(311, 20), Mode13Graphic(0, 13)
GET (27, 22)-(51, 41), Mode13Graphic(0, 14)
GET (53, 22)-(77, 41), Mode13Graphic(0, 15)
GET (79, 22)-(103, 41), Mode13Graphic(0, 16)
GET (105, 22)-(129, 41), Mode13Graphic(0, 17)
GET (131, 22)-(155, 41), Mode13Graphic(0, 18)
GET (157, 22)-(181, 41), Mode13Graphic(0, 19)
GET (183, 22)-(207, 41), Mode13Graphic(0, 20)
GET (209, 22)-(233, 41), Mode13Graphic(0, 21)
GET (235, 22)-(259, 41), Mode13Graphic(0, 22)
GET (287, 22)-(311, 41), Mode13Graphic(0, 23)
GET (1, 43)-(25, 62), Mode13Graphic(0, 24)
GET (27, 43)-(51, 62), Mode13Graphic(0, 25)
GET (53, 43)-(77, 62), Mode13Graphic(0, 26)
GET (79, 43)-(103, 62), Mode13Graphic(0, 27)
GET (105, 43)-(129, 62), Mode13Graphic(0, 28)
GET (131, 43)-(155, 62), Mode13Graphic(0, 29)
GET (157, 43)-(181, 62), Mode13Graphic(0, 30)
GET (183, 43)-(207, 62), Mode13Graphic(0, 31)
GET (209, 43)-(233, 62), Mode13Graphic(0, 32)
GET (235, 43)-(259, 62), Mode13Graphic(0, 33)
GET (261, 43)-(285, 62), Mode13Graphic(0, 34)
GET (287, 43)-(311, 62), Mode13Graphic(0, 35)
GET (1, 64)-(25, 83), Mode13Graphic(0, 36)
GET (27, 64)-(51, 83), Mode13Graphic(0, 37)
GET (53, 64)-(77, 83), Mode13Graphic(0, 38)
GET (79, 64)-(103, 83), Mode13Graphic(0, 39)
GET (105, 64)-(129, 83), Mode13Graphic(0, 40)
GET (131, 64)-(155, 83), Mode13Graphic(0, 41)
GET (157, 64)-(181, 83), Mode13Graphic(0, 42)
GET (183, 64)-(207, 83), Mode13Graphic(0, 43)
GET (209, 64)-(233, 83), Mode13Graphic(0, 44)
GET (235, 64)-(259, 83), Mode13Graphic(0, 45)
GET (261, 64)-(285, 83), Mode13Graphic(0, 46)
GET (287, 64)-(311, 83), Mode13Graphic(0, 47)
GET (1, 85)-(25, 104), Mode13Graphic(0, 48)
GET (27, 85)-(51, 104), Mode13Graphic(0, 49)
GET (53, 85)-(77, 104), Mode13Graphic(0, 50)
GET (79, 85)-(103, 104), Mode13Graphic(0, 51)
GET (105, 85)-(129, 104), Mode13Graphic(0, 52)
GET (131, 85)-(155, 104), Mode13Graphic(0, 53)
GET (157, 85)-(181, 104), Mode13Graphic(0, 54)
GET (183, 85)-(207, 104), Mode13Graphic(0, 55)
GET (209, 85)-(233, 104), Mode13Graphic(0, 56)
GET (235, 85)-(259, 104), Mode13Graphic(0, 57)
GET (261, 85)-(285, 104), Mode13Graphic(0, 58)
GET (287, 85)-(311, 104), Mode13Graphic(0, 59)

CLS
FileToScreen "city.kon"
GET (1, 1)-(25, 20), Mode13Graphic(0, 60)
GET (27, 1)-(51, 20), Mode13Graphic(0, 61)
GET (53, 1)-(77, 20), Mode13Graphic(0, 62)
GET (79, 1)-(103, 20), Mode13Graphic(0, 63)
GET (105, 1)-(129, 20), Mode13Graphic(0, 64)
GET (131, 1)-(155, 20), Mode13Graphic(0, 65)
GET (157, 1)-(181, 20), Mode13Graphic(0, 66)
GET (183, 1)-(207, 20), Mode13Graphic(0, 67)
GET (209, 1)-(233, 20), Mode13Graphic(0, 68)
GET (235, 1)-(259, 20), Mode13Graphic(0, 69)
GET (261, 1)-(285, 20), Mode13Graphic(0, 70)
GET (1, 22)-(25, 41), Mode13Graphic(0, 71)
GET (27, 22)-(51, 41), Mode13Graphic(0, 72)
GET (53, 22)-(77, 41), Mode13Graphic(0, 73)
GET (79, 22)-(103, 41), Mode13Graphic(0, 74)
GET (105, 22)-(129, 41), Mode13Graphic(0, 75)
GET (131, 22)-(155, 41), Mode13Graphic(0, 76)
GET (157, 22)-(181, 41), Mode13Graphic(0, 77)
GET (183, 22)-(207, 41), Mode13Graphic(0, 78)
GET (209, 22)-(233, 41), Mode13Graphic(0, 79)
GET (235, 22)-(259, 41), Mode13Graphic(0, 80)
CLS


FileToScreen "stuff.kon"                    'Load stuff for some graphics
GET (1, 1)-(25, 20), Mode13Graphic(0, 81)
GET (27, 1)-(51, 20), Mode13Graphic(0, 82)
GET (53, 1)-(77, 20), Mode13Graphic(0, 83)
GET (79, 1)-(103, 20), Mode13Graphic(0, 84)
GET (105, 1)-(129, 20), Mode13Graphic(0, 85)
GET (131, 1)-(155, 20), Mode13Graphic(0, 86)
GET (157, 1)-(181, 20), Mode13Graphic(0, 87)
GET (183, 1)-(207, 20), Mode13Graphic(0, 88)
GET (209, 1)-(233, 20), Mode13Graphic(0, 89)
GET (235, 1)-(259, 20), Mode13Graphic(0, 90)
GET (261, 1)-(285, 20), Mode13Graphic(0, 91)
GET (287, 1)-(311, 20), Mode13Graphic(0, 92)
GET (1, 22)-(25, 41), Mode13Graphic(0, 93)
GET (27, 22)-(51, 41), Mode13Graphic(0, 94)
GET (53, 22)-(77, 41), Mode13Graphic(0, 95)
GET (79, 22)-(103, 41), Mode13Graphic(0, 96)
GET (105, 22)-(129, 41), Mode13Graphic(0, 97)
GET (131, 22)-(155, 41), Mode13Graphic(0, 98)
GET (157, 22)-(181, 41), Mode13Graphic(0, 99)
GET (183, 22)-(207, 41), Mode13Graphic(0, 100)
GET (209, 22)-(233, 41), Mode13Graphic(0, 101)
GET (235, 22)-(259, 41), Mode13Graphic(0, 102)
GET (261, 22)-(285, 41), Mode13Graphic(0, 103)
GET (287, 22)-(311, 41), Mode13Graphic(0, 104)
GET (1, 43)-(25, 62), Mode13Graphic(0, 105)
GET (27, 43)-(51, 62), Mode13Graphic(0, 106)
GET (53, 43)-(77, 62), Mode13Graphic(0, 107)
GET (79, 43)-(103, 62), Mode13Graphic(0, 108)
GET (105, 43)-(129, 62), Mode13Graphic(0, 109)
GET (131, 43)-(155, 62), Mode13Graphic(0, 110)
GET (157, 43)-(181, 62), Mode13Graphic(0, 111)
GET (183, 43)-(207, 62), Mode13Graphic(0, 112)
GET (209, 43)-(233, 62), Mode13Graphic(0, 113)
GET (235, 43)-(259, 62), Mode13Graphic(0, 114)
GET (261, 43)-(285, 62), Mode13Graphic(0, 115)
GET (287, 43)-(311, 62), Mode13Graphic(0, 116)
GET (1, 64)-(25, 83), Mode13Graphic(0, 117)
GET (27, 64)-(51, 83), Mode13Graphic(0, 118)
GET (53, 64)-(77, 83), Mode13Graphic(0, 119)

CLS
FileToScreen "stuff.msk"                       'Load stuff for some masks
GET (1, 1)-(25, 20), Mode13Graphic(0, 120)
GET (27, 1)-(51, 20), Mode13Graphic(0, 121)
GET (53, 1)-(77, 20), Mode13Graphic(0, 122)
GET (79, 1)-(103, 20), Mode13Graphic(0, 123)
GET (105, 1)-(129, 20), Mode13Graphic(0, 124)
GET (131, 1)-(155, 20), Mode13Graphic(0, 125)
GET (157, 1)-(181, 20), Mode13Graphic(0, 126)
GET (183, 1)-(207, 20), Mode13Graphic(0, 127)
GET (209, 1)-(233, 20), Mode13Graphic(0, 128)
GET (235, 1)-(259, 20), Mode13Graphic(0, 129)
GET (261, 1)-(285, 20), Mode13Graphic(0, 130)
GET (287, 1)-(311, 20), Mode13Graphic(0, 131)
GET (1, 22)-(25, 41), Mode13Graphic(0, 132)
GET (27, 22)-(51, 41), Mode13Graphic(0, 133)
GET (53, 22)-(77, 41), Mode13Graphic(0, 134)
GET (79, 22)-(103, 41), Mode13Graphic(0, 135)
GET (105, 22)-(129, 41), Mode13Graphic(0, 136)
GET (131, 22)-(155, 41), Mode13Graphic(0, 137)
GET (157, 22)-(181, 41), Mode13Graphic(0, 138)
GET (183, 22)-(207, 41), Mode13Graphic(0, 139)
GET (209, 22)-(233, 41), Mode13Graphic(0, 140)
GET (235, 22)-(259, 41), Mode13Graphic(0, 141)
GET (261, 22)-(285, 41), Mode13Graphic(0, 142)
GET (287, 22)-(311, 41), Mode13Graphic(0, 143)
GET (1, 43)-(25, 62), Mode13Graphic(0, 144)
GET (27, 43)-(51, 62), Mode13Graphic(0, 145)
GET (53, 43)-(77, 62), Mode13Graphic(0, 146)
GET (79, 43)-(103, 62), Mode13Graphic(0, 147)
GET (105, 43)-(129, 62), Mode13Graphic(0, 148)
GET (131, 43)-(155, 62), Mode13Graphic(0, 149)
GET (157, 43)-(181, 62), Mode13Graphic(0, 150)
GET (183, 43)-(207, 62), Mode13Graphic(0, 151)
GET (209, 43)-(233, 62), Mode13Graphic(0, 152)
GET (235, 43)-(259, 62), Mode13Graphic(0, 153)

CLS
FileToScreen "charac.kon"                   'Load charac for some graphics
GET (1, 1)-(25, 20), Mode13Graphic(0, 154)
GET (27, 1)-(51, 20), Mode13Graphic(0, 155)
GET (53, 1)-(77, 20), Mode13Graphic(0, 156)
GET (79, 1)-(103, 20), Mode13Graphic(0, 157)
GET (105, 1)-(129, 20), Mode13Graphic(0, 158)
GET (131, 1)-(155, 20), Mode13Graphic(0, 159)
GET (157, 1)-(181, 20), Mode13Graphic(0, 160)
GET (183, 1)-(207, 20), Mode13Graphic(0, 161)
GET (209, 1)-(233, 20), Mode13Graphic(0, 162)
GET (1, 22)-(25, 41), Mode13Graphic(0, 163)
 GET (27, 22)-(51, 41), Mode13Graphic(0, 164)
GET (53, 22)-(77, 41), Mode13Graphic(0, 165)
GET (79, 22)-(103, 41), Mode13Graphic(0, 166)
GET (105, 22)-(129, 41), Mode13Graphic(0, 167)
GET (131, 22)-(155, 41), Mode13Graphic(0, 168)
GET (157, 22)-(181, 41), Mode13Graphic(0, 169)
GET (183, 22)-(207, 41), Mode13Graphic(0, 170)
GET (209, 22)-(233, 41), Mode13Graphic(0, 171)
CLS : PALETTE

SpaceClear = 0

CALL ModPal
END SUB

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

SUB SellItem
StartofSellingSub:
COLOR 15
LINE (0, 0)-(319, 199), 1, BF
LINE (0, 0)-(319, 199), 12, B
LINE (0, 31)-(319, 31), 12
LOCATE 2, 3
PRINT "Sell what?"
FOR gab = 6 TO 17
    COLOR 14
    LOCATE gab + 2, 12
    PRINT ItemName$(gab)
    COLOR 15
    LOCATE gab + 2, 30
    PRINT "GP"; INT(.5 * power(gab, 2))
NEXT
PCOPY 2, 1
mychc = 6
DO
    PCOPY 1, 2
    COLOR 15
    LOCATE mychc + 2, 10
    PRINT CHR$(26)
    PCOPY 2, 0
    ii$ = INKEY$
    SELECT CASE ii$
        CASE CHR$(0) + CHR$(72), CHR$(0) + CHR$(75):
mychc = mychc - 1
            IF mychc = 5 THEN mychc = 17
        CASE CHR$(0) + CHR$(77), CHR$(0) + CHR$(80):
            mychc = mychc + 1
            IF mychc = 18 THEN mychc = 6
        CASE CHR$(27):
        ii$ = CHR$(13)
        mychc = 18
    END SELECT
LOOP UNTIL ii$ = CHR$(13)
IF mychc = 18 THEN EXIT SUB
IF inven(mychc) = 0 THEN
LOCATE 2, 3: PRINT "You don't have any, you idiot!"
PCOPY 2, 0: delay 1: GOTO StartofSellingSub
END IF
LOCATE 2, 3: PRINT "You sure you don't want it? (Y/N)"
PCOPY 2, 0: DO: ii$ = INKEY$: LOOP UNTIL ii$ <> ""
IF UCASE$(ii$) = "Y" THEN
curgold = curgold + INT(.5 * power(mychc, 2))
inven(mychc) = inven(mychc) - 1
IF curgold > 9999 THEN curgold = 9999
LOCATE 2, 3: PRINT "Done!                             "
PCOPY 2, 0: delay 1
ELSE
GOTO StartofSellingSub
END IF
END SUB

SUB ShopkeeperScreen1Redraw
CLS
LINE (0, 0)-(319, 199), 1, BF
LINE (0, 0)-(319, 199), 12, B
LOCATE 2, 3
'PCOPY 2, 0
MCOLOR 15, 1
PRINT "What'll it be?"
COLOR 14: LOCATE 18, 18: PRINT "BUY": LOCATE 19, 18
PRINT "SELL": LOCATE 20, 18: PRINT "EXIT":
END SUB

SUB ShopkeeperTalk
DO

'PCOPY 2, 0
PCOPY 2, 1: yurc = 1: DO: PCOPY 1, 2: LOCATE yurc + 17, 16
COLOR 15: PRINT CHR$(26): PCOPY 2, 0: ii$ = INKEY$
SELECT CASE ii$
CASE CHR$(0) + CHR$(72), CHR$(0) + CHR$(75):
yurc = yurc - 1: IF yurc = 0 THEN yurc = 3
CASE CHR$(0) + CHR$(77), CHR$(0) + CHR$(80):
yurc = yurc + 1: IF yurc = 4 THEN yurc = 1
CASE CHR$(27): ii$ = CHR$(13): yurc = 3
END SELECT
LOOP UNTIL ii$ = CHR$(13)
SELECT CASE yurc
CASE 1: BuyItem: IF cannotrun = 1 THEN cannotrun = 0: EXIT SUB
CASE 2: SellItem
CASE 3: GOTO Loopershop
END SELECT
LOOP
Loopershop:
PCOPY 5, 2: LOCATE py, px: COLOR 14: PRINT CHR$(1);
MCOLOR 15, totalback
LINE (0, 0)-(319, 31), totalback, BF
LINE (0, 31)-(319, 31), 12: LOCATE 1, 1
PRINT "Nice doin' business with ya'!": LOCATE 3, 40
PRINT CHR$(254): PCOPY 2, 0: SLEEP: dmb$ = INKEY$
PCOPY 5, 2: LOCATE py, px: COLOR 14: PRINT CHR$(1);
END SUB


SUB PlayKonrad
DO
    Key$ = INKEY$
     SELECT CASE Key$
     CASE CHR$(0) + "H"
       IF dir <> 3 AND dir <> 4 THEN dir = 4
       CalcSomething dir, somethingup, somethingover
       CALL Blockade(over + somethingover, up + somethingup)
       IF SpaceClear = 0 THEN
       up = up - 1: dir = dir + 1
       IF dir = 5 THEN dir = 3
      END IF
      CALL DrawLevel
    CASE CHR$(0) + "P"
      IF dir <> 1 AND dir <> 2 THEN dir = 2
      CalcSomething dir, somethingup, somethingover
      CALL Blockade(over + somethingover, up + somethingup)
      IF SpaceClear = 0 THEN
        up = up + 1: dir = dir + 1
        IF dir = 3 THEN dir = 1
      END IF
     CALL DrawLevel

  CASE CHR$(0) + "M"
   IF dir <> 7 AND dir <> 8 THEN dir = 8
   CalcSomething dir, somethingup, somethingover
   CALL Blockade(over + somethingover, up + somethingup)
   IF SpaceClear = 0 THEN
    over = over + 1: dir = dir + 1
    IF dir = 9 THEN dir = 7
   END IF
   CALL DrawLevel

  CASE CHR$(0) + "K"
   IF dir <> 5 AND dir <> 6 THEN dir = 6
   CalcSomething dir, somethingup, somethingover
   CALL Blockade(over + somethingover, up + somethingup)
   IF SpaceClear = 0 THEN
    over = over - 1: dir = dir + 1
    IF dir = 7 THEN dir = 5
   END IF
   CALL DrawLevel
     CASE " ": CALL UseSomething
     END SELECT
    CALL DebugKeys(Key$)
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
            CALL DrawLevel

          END IF
          END IF
        END IF
      END IF
     SpaceClear = 0
   LOOP

END SUB

FUNCTION Surrounding% (ttlf$)
    ok = 0
    IF MID$(curmap$(py), px + 1, 1) = ttlf$ THEN ok = 1
    IF MID$(curmap$(py + 1), px, 1) = ttlf$ THEN ok = 1
    IF MID$(curmap$(py - 1), px, 1) = ttlf$ THEN ok = 1
    IF MID$(curmap$(py), px - 1, 1) = ttlf$ THEN ok = 1
    Surrounding% = ok
END FUNCTION

SUB LoadTalk (FileName$)
fc% = FileOPEN(FileName$, "I")
INPUT #fc%, a%
REDIM Talk$(1 TO a%)
FOR i = 1 TO a%
    LINE INPUT #fc, a$
    Talk$(i) = a$
NEXT
CLOSE fc%
END SUB

SUB TalkLoad
OPEN "VILLAGER.SAY" FOR INPUT AS #1
FOR xabc = 1 TO 7
   FOR bbc = 1 TO 3
      LINE INPUT #1, Villager$(xabc, bbc)
   NEXT
NEXT
CLOSE
OPEN "QUEEN.SAY" FOR INPUT AS #1
FOR xabc = 1 TO 6: LINE INPUT #1, qu$(xabc): NEXT
CLOSE
OPEN "KING.SAY" FOR INPUT AS #1
FOR xabc = 1 TO 9
  LINE INPUT #1, ki$(xabc)
NEXT
CLOSE
END SUB

SUB TalkKing
COLOR 15
LINE (0, 0)-(319, 31), totalback, BF
LINE (0, 31)-(319, 31), 12
FOR cba = 1 TO 2
    FOR abc = 1 TO 3
        LOCATE abc, 1
        IF cba = 1 THEN
            PRINT ki$(ABC)
        ELSE
            PRINT ki$(ABC + 3)
END IF
    NEXT
    LOCATE 3, 40
    IF cba = 2 THEN
        PRINT CHR$(26)
        PCOPY 2, 0
        SLEEP
        dmb$ = INKEY$
        PCOPY 5, 2
        LOCATE py, px
        COLOR 14
PRINT CHR$(1);
PCOPY 2, 0: delay 1: COLOR 13: LOCATE 4, 37: PRINT CHR$(2)
LOCATE 5, 36: PRINT CHR$(2): LOCATE 5, 38: PRINT CHR$(2)
LOCATE 6, 37: PRINT CHR$(2): PCOPY 2, 0: delay 3
COLOR 15: LINE (0, 0)-(319, 31), totalback, BF
LINE (0, 31)-(319, 31), 12: LOCATE 1, 1: FOR bcdc = 7 TO 9
PRINT ki$(bcdc): NEXT: LOCATE 3, 40: PRINT CHR$(254)
PCOPY 2, 0
SLEEP
dmbo$ = INKEY$
FOR whoohoo = 1 TO 4
SetBattle whoohoo, 5: NEXT: cannotrun = 1: EnsueBattle
SCREEN 7, 0, 0, 0: CLS : Epilogue: EXIT SUB
END IF
IF cba = 1 THEN
PRINT CHR$(26): PCOPY 2, 0: SLEEP: dmb$ = INKEY$
LINE (0, 0)-(319, 31), totalback, BF
LINE (0, 31)-(319, 31), 12
END IF
NEXT
END SUB
SUB LoadBlockList (FileName$)
    OPEN FileName$ FOR BINARY AS 1
    FOR i = 0 TO 255
    GET 1, , BlockList(i)
    NEXT
    CLOSE 1
END SUB

SUB LoadProxyList (FileName$)
    OPEN FileName$ FOR BINARY AS 1
    FOR i = 0 TO 255
    GET 1, , ProxyList(i)
    NEXT
    CLOSE 1
END SUB


SUB MapDraw (backcolor)
    SCREEN 7, 0, 5, 0
    CLS
    totalback = backcolor
    COLOR , backcolor
    FOR drmap = 1 TO 20: FOR maploc = 1 TO 40
      LOCATE drmap, maploc
      z$ = MID$(curmap$(drmap), maploc, 1)
      SELECT CASE z$
      CASE "x"
        COLOR 15: PRINT CHR$(219);
      CASE "X"
        COLOR 14: PRINT CHR$(176);
      CASE "C"
        COLOR 11: PRINT CHR$(254);
      CASE "v", "V", "a", "b", "c", "d"
        COLOR 13: PRINT CHR$(235);
      CASE "I", "W"'Inn,
        COLOR 9: PRINT CHR$(2);
      CASE "Q", "K"'Queen, King
        COLOR 14: PRINT CHR$(2);
      CASE "1" TO "7"'People
        COLOR 15: PRINT CHR$(1);
      CASE "A", "B"'Exits
        COLOR 8: PRINT CHR$(178);
      CASE " ": PRINT " ";
      END SELECT
    NEXT
  NEXT
END SUB

SUB MapFileListInit
    OPEN "MAPLIST.TXT" FOR INPUT AS 1
    DO
      LINE INPUT #1, Temp$
      counter% = counter% + 1
    LOOP UNTIL EOF(1)
    CLOSE
    counter% = counter% - 1
    REDIM MapFileList(0 TO counter%) AS STRING
    OPEN "MAPLIST.TXT" FOR INPUT AS 1
    FOR i = 0 TO counter%
      LINE INPUT #1, MapFileList(i)
    NEXT
    CLOSE
END SUB

SUB MapRetrieve (Integ%, Lines%)
    OPEN MapFileList(Integ%) FOR INPUT AS 1
    REDIM curmap$(Lines%)
    FOR getmap = 1 TO Lines%
      LINE INPUT #1, curmap$(getmap)
    NEXT
    CLOSE
END SUB



SUB SetPlayerLoc (x%, y%)
px% = x%
py% = y%
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

SUB ChooseStar STATIC
LINE (225, 150)-(314, 174), 0, BF: LINE (225, 150)-(314, 174), 12, B
COLOR 15: FOR gha = 1 TO 2
LOCATE 19 + gha, 30: IF inven(gha) > 0 THEN PRINT ItemName$(gha)
NEXT: PCOPY 6, 3: LOCATE 20, 30: COLOR 12: PRINT ItemName$(1): mychoice = 1
DO: v$ = INKEY$: IF inven(1) > 0 THEN ja1 = 1 ELSE ja1 = 2
IF inven(2) > 0 THEN ja2 = 2 ELSE ja2 = 1
IF inven(1) = 0 AND inven(2) > 0 THEN
mychoice = 2: LOCATE 21, 30: COLOR 12: PRINT ItemName$(2)
LOCATE 20, 30: PRINT "        "
END IF
IF inven(1) = 0 AND inven(2) = 0 THEN GOTO trytochooseagain2
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

SUB Mode7ShowAndRestore (DelTime!)
    PCOPY 6, 0
    delay DelTime!
    PCOPY 3, 6
END SUB


SUB ModPal
   PALETTE 247, 65536 * INT(41) + 256 * INT(0) + INT(0)
   PALETTE 246, 65536 * INT(51) + 256 * INT(0) + INT(0)
   PALETTE 245, 65536 * INT(61) + 256 * INT(0) + INT(0)
  PALETTE 244, 65536 * INT(31) + 256 * INT(0) + INT(0)
  PALETTE 243, 65536 * INT(41) + 256 * INT(0) + INT(0)
  PALETTE 242, 65536 * INT(51) + 256 * INT(0) + INT(0)
  PALETTE 241, 65536 * INT(0) + 256 * INT(0) + INT(31)
  PALETTE 240, 65536 * INT(0) + 256 * INT(0) + INT(41)
  PALETTE 239, 65536 * INT(0) + 256 * INT(0) + INT(51)

END SUB

SUB Mosaic (Siz)
    FOR BCs = 0 TO 199 STEP Siz
    FOR CDs = 0 TO 319 STEP Siz
    Ns = POINT(CDs, BCs)
    LINE (CDs, BCs)-(CDs + (Siz - 1), BCs + (Siz - 1)), Ns, BF
    NEXT
    NEXT
END SUB

SUB MsgLast
    LOCATE 3, 40
    PRINT CHR$(254)
END SUB

SUB MsgRunDisabled
     PRINT "You cannot escape from"
     PRINT "this battle!"
     MsgLast 'Display the indicator that this is the last part of the message
     PCOPY 6, 0' Copy this stuff to the visible screen
END SUB

SUB LoadItemNames (fc%)
REDIM ItemName$(18)
FOR xabc = 1 TO 18
    LINE INPUT #fc%, ItemName$(xabc)
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
    dmbo$ = INKEY$
    PCOPY 3, 6
    PCOPY 3, 0
    delay 1
    EXIT SUB
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
        enemyat(xg) = 0
        ehit(xg) = 0
    NEXT
ELSE
    MsgRunFail
    SLEEP
    dmbo$ = INKEY$
    PCOPY 3, 6
    PCOPY 3, 0
    delay 1
    EXIT SUB
END IF
END SUB

SUB SetBattle (batnum, enum)
enemyat(batnum) = enum
END SUB

SUB MsgRunFail
    PRINT "You attempt an escape, but"
    PRINT "the enemy sees you."
    CALL MsgLast
    PCOPY 6, 0
END SUB

SUB MsgRunSuccess
   PRINT "Somehow, you manage to elude"
   PRINT "the enemy and escape from"
   PRINT "battle."
   MsgLast 'Display the indicator that this is the last part of the message
   PCOPY 6, 0 ' Copy this stuff to the visible screen
END SUB


SUB MultiPrint (Text$(), x%, y%)
    FOR i = LBOUND(Text$) TO UBOUND(Text$)
        LOCATE y% + n%, x%
        PRINT Text$(i%);
        n% = n% + 1
    NEXT i
END SUB

FUNCTION PartyImmobilized

END FUNCTION

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
      LOCATE 19 + abdf, 20
      SELECT CASE abdf
      CASE 1: PRINT "Kyta    HP ";
      CASE 2: PRINT "Glenlin HP ";
      CASE 3: PRINT "Kohlen  HP ";
      END SELECT
      jnum$ = ZeroDelimitedInt$(curhp(abdf), 4)
      knum$ = ZeroDelimitedInt$(charstat(abdf, 1), 4)
      PRINT jnum$; "/"; knum$: NEXT
      FOR i = 1 TO 3
        IF curhp(i) > 0 THEN
          PUT (280, (i * 25) + 35), Mode7Bitmap(0, (i - 1) * 4 + 1), AND
          PUT (280, (i * 25) + 35), Mode7Bitmap(0, (i - 1) * 4), OR
        END IF
      NEXT i

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

FUNCTION ReverseLong& (longInt&)
Temp1$ = MKL$(longInt&)
Temp1$ = MID$(Temp1$, 4, 1) + MID$(Temp1$, 3, 1) + MID$(Temp1$, 2, 1) + MID$(Temp1$, 1, 1)
ReverseLong& = CVL(Temp1$)
END FUNCTION

SUB AdjustInventory (Item%, Amount%) 'INVEN.BAS
inven(Item%) = Amount%
END SUB

FUNCTION InInventory (Item%)
InInventory = inven(Item%)
END FUNCTION


SUB PlayMainGame
    SCREEN 7, 0, 2, 0
    CLS
    DO
      PCOPY 5, 2
      IF CharacterDraw% THEN
        LOCATE py, px
        COLOR 14
         PRINT CHR$(1);
      END IF
     
      a$ = INKEY$
      SELECT CASE a$
      CASE CHR$(0) + CHR$(72) 'up arrow
        Blockade px, py - 1
        IF SpaceClear = 0 THEN py = py - 1
      CASE CHR$(0) + CHR$(75): 'left arrow
        Blockade px - 1, py
        IF SpaceClear = 0 THEN px = px - 1
      CASE CHR$(0) + CHR$(77): 'right arrow
        Blockade px + 1, py
        IF SpaceClear = 0 THEN px = px + 1
      CASE CHR$(0) + CHR$(80) 'down arrow
        Blockade px, py + 1
        IF SpaceClear = 0 THEN py = py + 1
      CASE CHR$(13)
        StatusScreen'Enter key
      CASE " "      'space bar
        IF Surrounding("1") THEN TalkVillager 1
        IF Surrounding("2") THEN TalkVillager 2
        IF Surrounding("3") THEN TalkVillager 3
        IF Surrounding("4") THEN TalkVillager 4
        IF Surrounding("5") THEN TalkVillager 5
        IF Surrounding("6") THEN TalkVillager 6
        IF Surrounding("7") THEN TalkVillager 7
        IF Surrounding("Q") THEN TalkQueen
        IF Surrounding("K") THEN TalkKing: EXIT SUB
        IF Surrounding("I") THEN InnkeeperTalk
        IF Surrounding("W") THEN ShopkeeperTalk
        IF Surrounding("C") THEN CampGround
        IF Surrounding("a") THEN TreasureChest 1
        IF Surrounding("b") THEN TreasureChest 2
        IF Surrounding("c") THEN TreasureChest 3
        IF Surrounding("d") THEN TreasureChest 4
        IF Surrounding("v") THEN
          SetBattle 1, 5: TreasureChest 5
        END IF
        IF Surrounding("V") THEN
          SetBattle 1, 4: SetBattle 2, 5: TreasureChest 6
        END IF
      CASE ELSE
        DebugKeys a$
      END SELECT
     
     
      SELECT CASE MID$(curmap$(py), px, 1)
      CASE "A"
        SCREEN 7, 0, 0, 0
        CLS
        MapRetrieve 1, 20
        MapDraw 6
        px = 18
        py = 19
        SCREEN 7, 0, 2, 0
        mapnumber = 2
      CASE "B"
        SCREEN 7, 0, 0, 0
        CLS
        MapRetrieve 0, 20
        MapDraw 2
        px = 38: py = 2
        SCREEN 7, 0, 2, 0
        mapnumber = 1
      CASE ";"
           NoEnemies% = 0
      CASE "'"
           NoEnemies% = -1
      CASE ELSE
      END SELECT
      PCOPY 2, 0
      CALL CheckForBattle(a$)
LOOP UNTIL a$ = CHR$(27)
END SUB


SUB Read13Profile (Array())
    DIM Index AS ProfileType
    GET 1, , Index
    GET (Index.TL.x, Index.TL.y)-(Index.TL.x, Index.TL.y), Array
END SUB

SUB ReplacePlayer
IF CharacterDraw% THEN
    LOCATE py, px
    MCOLOR 14, totalback
    PRINT CHR$(1);
END IF
END SUB




SUB SetPal (Entry%, Value AS PalValue)
   OUT &H3C8, Entry%                            'tell controller to get ready
   
   OUT &H3C9, ASC(Value.red)                      'send red component
   OUT &H3C9, ASC(Value.green)                    'send green component
   OUT &H3C9, ASC(Value.blue)                     'send blue component
END SUB

SUB SetupStats

OPEN "newgame.dat" FOR INPUT AS #1

INPUT #1, lvl, mp, mpmax, hp, hpmax, KonAttack%, defense
INPUT #1, money, exper, lefttonext
INPUT #1, up, over, dir, stage
CLOSE
MapFileList(0) = "NEWGAME.MAP"
MapRetrieve 0, 61
END SUB



SUB SpellBook

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

SUB SpellEnemy (spnum) STATIC
    DIM ey(4)
    ey(1) = 60
    ey(2) = 85
    ey(3) = 110
    DO
      EnemyTargeted = INT(RND(1) * 3) + 1
      IF EnemyTargeted = 4 THEN EnemyTargeted = 3
    LOOP UNTIL curhp(EnemyTargeted) > 0
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
SUB Actions (Temp$)
    SELECT CASE Temp$
SUB SpellCast (spnum, EnemyTargeted)
    
    DIM ex(4), ey(4), lx(4), ly(4)
    CALL AttackPattern1(ex(), ey())
    ly(1) = 16: lx(1) = 4: ly(2) = 16
    lx(2) = 15: ly(3) = 9: lx(3) = 4: ly(4) = 9: lx(4) = 15
    
    IF magdata(spnum, 2) = 0 AND magdata(spnum, 1) < 6 THEN
      CALL EstablishTarget(enemyat%(), EnemyTargeted%)
    END IF
    
DIM coverup(140): SCREEN 7, 0, 7, 0
GET (280, 85)-(299, 104), coverup: SCREEN 7, 0, 6, 0
PUT (280, 85), coverup, PSET
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
IF curhp(EnemyTargeted) > 0 THEN DamageChar -1400, EnemyTargeted
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
      IF curhp(erf) > 0 THEN
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
IF curhp(EnemyTargeted) > 0 THEN
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
IF curhp(EnemyTargeted) = 0 THEN curhp(EnemyTargeted) = 1000
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

SUB ExportChunk (FileName$, ChunkName$, array%()) 'CHUNK.BAS
DIM Header AS ChunkHeader
fc% = FileOPEN(FileName$, "B")
SEEK fc%, LOF(fc%) + 1
ExportChunkTop:
Header.ChunkType = ChunkName$
Header.Chunksize = (UBOUND(array%) - LBOUND(array%) + 1) * 2
PUT fc%, , Header
FOR i% = LBOUND(array%) TO UBOUND(array%)
    PUT fc%, , array(i%)
NEXT
CLOSE fc%
END SUB

NEXT
END SELECT
NoSpellCast:
SCREEN 7, 0, 6, 0: PCOPY 7, 6: delay 1: PlaceEnemies
ERASE ex, ey, lx, ly, coverup
END SUB

SUB SetBattle (batnum, enum)
enemyat(batnum) = enum
END SUB

SUB LoadInventory (fc%)
REDIM inven(18)
FOR xabc = 1 TO 18
    GET fc%, , inven(xabc)
NEXT
END SUB

    CASE "1" TO "7"
      TalkVillager VAL(Temp$)
    CASE "Q"
      TalkQueen
    CASE "K"
      TalkKing
         EXIT SUB
    CASE "I"
      InnkeeperTalk
    CASE "W"
      ShopkeeperTalk
    CASE "C"
      CampGround
    CASE "a"
      TreasureChest 1
    CASE "b"
      TreasureChest 2
    CASE "c"
      TreasureChest 3
    CASE "d"
      TreasureChest 4
    CASE "v"
      SetBattle 1, 5: TreasureChest 5
    CASE "V"
      SetBattle 1, 4: SetBattle 2, 5: TreasureChest 6
    END SELECT
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
      PCOPY 6, 0: delay .1: PCOPY 3, 6
    NEXT

END SUB

REM $DYNAMIC
SUB SpellIce (ex, ey, EnemyTargeted) STATIC
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


SUB SpellTremor (ex, ey, EnemyTargeted) STATIC
PCOPY 7, 6
IF ex = 280 THEN
strh = curhp(EnemyTargeted): strg = EnemyTargeted + 5: curhp(EnemyTargeted) = 0: PlaceEnemies
LOCATE 19 + EnemyTargeted, 31
jnum$ = STR$(strh): knum$ = STR$(charstat(EnemyTargeted, 1))
jnum$ = LTRIM$(jnum$): knum$ = LTRIM$(knum$)
FOR bghg = 1 TO 3: IF LEN(jnum$) < 4 THEN jnum$ = "0" + jnum$
IF LEN(knum$) < 4 THEN knum$ = "0" + knum$
NEXT: PRINT jnum$; "/"; knum$
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
IF ex = 280 THEN curhp(EnemyTargeted) = strh ELSE enemyat(EnemyTargeted) = strg
IF ex = 280 AND walled(EnemyTargeted) = 1 THEN
   SpellReflect 6, EnemyTargeted: EXIT SUB
END IF
IF ex = 280 THEN DamageChar 600, EnemyTargeted ELSE DamageEnemy 6, 175, EnemyTargeted
END SUB

SUB StatusScreen
DO: CLS : LINE (0, 0)-(319, 199), 1, BF
LINE (0, 0)-(319, 199), 12, B: PCOPY 2, 0
MCOLOR 15, 1: FOR abdf = 1 TO 3: LOCATE 19 + abdf, 2
SELECT CASE abdf
CASE 1: PRINT "Kyta    HP ";
CASE 2: PRINT "Glenlin HP ";
CASE 3: PRINT "Kohlen  HP ";
END SELECT
jnum$ = ZeroDelimitedInt$(curhp(abdf), 4)
knum$ = ZeroDelimitedInt$(charstat(abdf, 1), 4)

PRINT jnum$; "/"; knum$; " MP ";
IF abdf = 1 OR abdf = 3 THEN
PRINT "000/000"; " LV"; curlev(abdf)
ELSE
njh$ = LTRIM$(STR$(curmp)): FOR baha = 1 TO 3
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
IF inven(bala) > 0 THEN
PRINT ItemName$(bala): LOCATE cloc, 29
hag$ = LTRIM$(STR$(inven(bala)))
IF LEN(hag$) = 1 THEN hag$ = "0" + hag$
PRINT hag$: cloc = cloc + 1
END IF
NEXT
PCOPY 2, 0: SLEEP: dmbo$ = INKEY$
END IF
LOOP
END SUB

SUB delay (DelTime#) 'SYSTEM.BAS
dtx# = TIMER(.001)
WHILE TIMER(.001) < dtx# + DelTime#
    IF dtx# > TIMER(.001) THEN dtx# = dtx# - 86400
WEND
END SUB

FUNCTION FileOPEN% (FileName$, Mode$)
STATIC CurrFileHandle%
IF FileName$ = "" THEN
    FileOPEN% = CurrFileHandle%
    EXIT FUNCTION
END IF
FileOPEN% = FREEFILE
OPEN Mode$, FREEFILE, FileName$
END FUNCTION

FUNCTION FileOPENChecked% (FileName$, Mode$)
STATIC CurrFileHandle%
IF FileName$ = "" THEN
    ERROR 52
    EXIT FUNCTION
END IF
FileOPEN% = FREEFILE
OPEN Mode$, FREEFILE, FileName$
END FUNCTION

SUB MCOLOR (forecolor%, backcolor%)
SELECT CASE ScreenMode%
    CASE 1
        COLOR backcolor%, forecolor%
    CASE 13
        DIM scratch AS PalValue
        COLOR forecolor%

        IF backcolor% <> 0 THEN
            GETPAL backcolor%, scratch
        END IF
        SetPal 0, scratch
    CASE ELSE
        COLOR forecolor%, backcolor%
END SELECT
END SUB

SUB GETPAL (Entry%, Value AS PalValue)
   OUT &H3C7, Entry%                   'tell controller to get ready
   Temp% = INP(&H3C9)              'get red component
   Value.red = CHR$(Temp%)
   Temp% = INP(&H3C9)
   Value.green = CHR$(Temp%)       'get green component
   Temp% = INP(&H3C9)     'get blue component
   Value.blue = CHR$(Temp%)
END SUB

SUB StayTheNight STATIC
IF curgold < 50 THEN CheapSkate: EXIT SUB
SCREEN 7, 0, 4, 0: CLS : COLOR , 0
FOR nonamevar = 1 TO 50
xag = INT(RND(1) * 3) + 1: IF xag > 3 THEN xag = 3
IF xag = 1 THEN COLOR 15
IF xag = 2 THEN COLOR 7
IF xag = 3 THEN COLOR 8
PSET (INT(RND(1) * 319), INT(RND(1) * 199)): NEXT
PCOPY 4, 0: delay 4: PALETTE 15, 7: PALETTE 7, 8
PALETTE 8, 0: delay 2: PALETTE 15, 8: PALETTE 0, 1
delay 2: PALETTE 0, 9: PALETTE 15, 1: PALETTE 7, 1
PALETTE 8, 9: delay 4: SCREEN 7, 0, 0, 0: CLS
SCREEN 7, 0, 4, 0: CLS : PALETTE 0, 0: PALETTE 7, 7
PALETTE 8, 8: PALETTE 15, 15: PALETTE 11, 1: PALETTE 2, 8
PALETTE 10, 0: MCOLOR 11, 0: FOR waha = 100 TO 50 STEP -1
LINE (0, 0)-(319, 50), , BF: CIRCLE (160, waha), 25, 14
PAINT (160, waha), 14: LINE (0, 51)-(319, 199), 2, BF
cntr = 1: FOR lookreal = 50 TO 199: cntr = cntr + 1
LINE (0, lookreal + 1)-(319, lookreal + cntr), 10, BF
lookreal = lookreal + cntr: NEXT: delay .1: PCOPY 4, 0
IF waha = 75 THEN PALETTE 10, 2: PALETTE 11, 9: PALETTE 2, 8
NEXT: FOR ohjeez = 15 TO 1 STEP -1: PALETTE ohjeez, ohjeez: NEXT
cntr = 0: COLOR 14: FOR lookreal = 51 TO 76: cntr = cntr + 1
LINE (135 + cntr * 4, lookreal + cntr)-(185 - cntr * 4, lookreal + cntr)
lookreal = lookreal + cntr: NEXT: PCOPY 4, 0: delay 4
FOR rstrit = 1 TO 3: curhp(rstrit) = charstat(rstrit, 1): NEXT
curmp = charstat(2, 2): curgold = curgold - 50
CLS : SCREEN 7, 0, 2, 0
END SUB


SUB TalkQueen
CALL DoBox

FOR cba = 1 TO 2
    FOR abc = 1 TO 3
        LOCATE abc, 1
        IF cba = 1 THEN               PRINT qu$(ABC)
        ELSE
            PRINT qu$(ABC + 3)
         END IF
    NEXT
LOCATE 3, 40
IF cba = 2 THEN
    PRINT CHR$(254)
    PCOPY 2, 0
    SLEEP: dmb$ = INKEY$
    IF cba = 1 THEN
      PRINT CHR$(26)
      PCOPY 2, 0
      SLEEP
        dmb$ = INKEY$
LINE (0, 0)-(319, 31), totalback, BF
LINE (0, 31)-(319, 31), 12
END IF
NEXT
END SUB

SUB TalkVillager (vlgnum)
CALL DoBox
FOR abc = 1 TO 3
    LOCATE abc, 1
    PRINT Villager$(vlgnum, ABC)
NEXT
LOCATE 3, 40
PRINT CHR$(254)
PCOPY 2, 0 'Copys text to screen in mode 7
SLEEP
dmb$ = INKEY$
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
PCOPY 6, 0
LOOP
END SUB

SUB TargetEnemy1 (sabro)
DIM ep(4, 2)
ep(1, 1) = 35
ep(1, 2) = 110
ep(2, 1) = 110
ep(2, 2) = 110
ep(3, 1) = 35
ep(3, 2) = 60
ep(4, 1) = 110
ep(4, 2) = 60
tgt = 0
FOR abga = 1 TO 4
    IF enemyat(abga) > 0 THEN
        tgt = abga
        EXIT FOR
    END IF
NEXT
COLOR 12
DO
    PCOPY 4, 6
    whassis$ = INKEY$
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
IF enemyat(whoa) > 0 THEN
    tgt = whoa
    whoa = 0
END IF
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
PCOPY 6, 0
LOOP
END SUB

SUB TargetEnemy2 (sabro)
IF chosen(2, 2) = 0 THEN EXIT SUB
IF magdata(chosen(2, 2), 2) = 1 THEN EXIT SUB
pn = magdata(chosen(2, 2), 1)
IF pn = 6 OR pn = 7 OR pn = 8 THEN TargetChar sabro: EXIT SUB
TargetEnemy1 sabro
END SUB

SUB TossStar (snum, EnemyTargeted)
AdjustInventory snum, -1

DIM ex(4), ey(4)

CALL AttackPattern1(ex(), ey())

PCOPY 6, 3
LINE (210, 5)-(314, 25), 0, BF
LINE (210, 5)-(314, 25), 12, B
LOCATE 2, 29
COLOR 15
PRINT ItemName$(snum)
Mode7ShowAndRestore 1
PCOPY 3, 0
CALL EstablishTarget(enemyat%(), EnemyTargeted%)

DIM coverup%(140)
SCREEN 7, 0, 7, 0
GET (280, 110)-(299, 129), coverup%()
SCREEN 7, 0, 6, 0
PUT (280, 110), coverup, PSET
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
SCREEN 7, 0, 6, 0: PCOPY 7, 6
delay 1
PlaceEnemies
ERASE ex, ey, coverup
END SUB

SUB ChestOpened
    COLOR 15
    LINE (0, 0)-(319, 31), totalback, BF
    LINE (0, 31)-(319, 31), 12
    LOCATE 1, 1
    PRINT "** EMPTY **"
    LOCATE 3, 40
    PRINT CHR$(254)
    PCOPY 2, 0
    SLEEP
    dmb$ = INKEY$
END SUB


SUB ChestsLoad (FileName AS STRING)
    SHARED Treasure() AS chest
    OPEN FileName FOR BINARY AS #1
    GET 1, , NumberOfChests%
    REDIM Treasure(0 TO NumberOfChests%) AS chest
    FOR i = 1 TO NumberOfChests%
        GET 1, , Treasure(i)
    NEXT i
    CLOSE 1
END SUB


SUB TreasureChest (trnum)
    'Open Flag
    IF READBIT%(Treasure(trnum).Flags, 0) THEN ChestOpened: EXIT SUB
    Treasure(trnum).Flags = Treasure(trnum).Flags OR 1
    'Battle Flag
    IF READBIT%(Treasure(trnum).Flags, 1) THEN
      COLOR 15
      LINE (0, 0)-(319, 31), totalback, BF
      LINE (0, 31)-(319, 31), 12: LOCATE 1, 1
      PRINT "You open the treasure chest"
      PRINT "and find..."
      PRINT "    ** MONSTER **"
      LOCATE 3, 40
      PRINT CHR$(254)
      PCOPY 2, 0
      SLEEP
      dmb$ = INKEY$
      cannotrun = 1
      EnsueBattle
      SCREEN 7, 0, 2, 0: COLOR 15: LINE (0, 0)-(319, 31), totalback, BF
      LINE (0, 31)-(319, 31), 12: LOCATE 1, 1
      PRINT "You look deeper into the chest"
      IF Treasure(trnum).item = 0 THEN
        PRINT "but find nothing."
      ELSE
        PRINT "and find "; ItemName$(Treasure(trnum).item); " x";
        PRINT Treasure(trnum).Quantity
        inven(Treasure(trnum).item) = inven(Treasure(trnum).item) + Treasure(trnum).Quantity
        IF inven(Treasure(trnum).item) > 99 THEN inven(Treasure(trnum).item) = 99
      END IF
      DO
        bbb$ = INKEY$
      LOOP UNTIL bbb$ = ""
      LOCATE 3, 40
      PRINT CHR$(254): PCOPY 2, 0: SLEEP: dmb$ = INKEY$
    ELSE
COLOR 15: LINE (0, 0)-(319, 31), totalback, BF
LINE (0, 31)-(319, 31), 12
LOCATE 1, 1
PRINT "Found "; UCASE$(ItemName$(Treasure(trnum).item)); " x";
PRINT Treasure(trnum).Quantity
inven(Treasure(trnum).item) = inven(Treasure(trnum).item) + Treasure(trnum).Quantity
IF inven(Treasure(trnum).item) > 99 THEN inven(Treasure(trnum).item) = 99
LOCATE 3, 40: PRINT CHR$(254): PCOPY 2, 0: SLEEP: dmb$ = INKEY$
END IF
END SUB

SUB AttackPattern1 (ex(), ey())
ex(1) = 35: ey(1) = 110: ex(2) = 110: ey(2) = 110: ex(3) = 35
ey(3) = 60: ex(4) = 110: ey(4) = 60
END SUB

SUB battle2
SCREEN 9, , 1, 1
CLS
PUT (290, 150), monst1%()
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

SUB Battle2Init
DIM monst1%(233)
   
fc% = FileOPEN("slime.mns", "I")
FOR x = 1 TO 30
    FOR y = 1 TO 29
        INPUT #fc%, a
        PSET (x, y), a
    NEXT y
NEXT x
GET (1, 1)-(30, 29), monst1%()
CLOSE #fc%

hp = 50
hpmax = 50
level% = 2
chrexp% = 4
END SUB


SUB Battle7Init
REDIM levelup(1 TO 4) AS LONG
REDIM Bang1(70), Bangm(70)

REDIM enemyat(1 TO 4), gitm(4), ehit(1 TO 4), etype(5, 13)
REDIM HeroName$(1 TO 3), charstat(3, 4), CurHP(3), curlev(3), curexp(1 TO 3) AS LONG
REDIM canequip(3, 4), equip(3, 2)
REDIM power(6 TO 17), walled(1 TO 4)

REDIM weak(5), strn(5), maglearn(2 TO 5), magdata(12, 2), spellsknown(12)
REDIM chosen(3, 3)
REDIM Mode7Bitmap(121, 0 TO 23)
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
   
COLOR 14
fc% = FileOPEN("FIRE.IDG", "I")
PRINT "'Fire Spell'"
SCREEN 7, 0, 5, 0
DrawGraphic 9, fc%
CLOSE fc%
GET (0, 0)-(9, 9), Bang1()
GET (10, 0)-(19, 9), Bangm()
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
FOR xabc = 1 TO 12: LINE INPUT #fc%, mn$(xabc): NEXT
FOR xabc = 1 TO 5: LINE INPUT #fc%, ename$(xabc): NEXT
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
            DO 'This actally allows for any space to be blank
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
IF sabro = 2 AND CurrChoice = 2 THEN ChooseMagic
TargetEnemy2 saab
IF sabro = 3 AND CurrChoice = 2 THEN TargetEnemy1 sabro
IF sabro = 3 AND CurrChoice = 3 THEN
    ChooseStar
    IF chosen(3, 2) > 0 THEN TargetEnemy1 sabro
END IF
PCOPY 4, 6
PCOPY 6, 0
delay .5
END SUB

SUB BattleMenuInit
REDIM BattleMenuList(0 TO 6) AS STRING
fc% = FileOPEN("BATMNU.LST", "I")
FOR I% = 1 TO 6
    LINE INPUT #fc%, BattleMenuList(I%)
NEXT
CLOSE fc%
  
ImportMenus "BATTLE1.MNU", IndividualBattleMenuIndex(), IndividualBattleMenuTable()
END SUB


SUB BeamAttack (bnum, EnemyTargeted)
DIM ex(4), ey(4)
CALL AttackPattern1(ex(), ey())
CALL DisplayAttackName(ItemName$(bnum + 2))
  
CALL EstablishTarget(enemyat%(), EnemyTargeted%)
 
DIM coverup%(140)
SCREEN 7, 0, 7, 0
GET (280, 60)-(299, 79), coverup%()
SCREEN 7, 0, 6, 0
PUT (280, 60), coverup%(), PSET
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
            PUT (ex(EnemyTargeted), ey(EnemyTargeted) + 5 - ct), Bangm(), AND
            PUT (ex(EnemyTargeted), ey(EnemyTargeted) + 5 - ct), Bang1(), OR
            PUT (ex(EnemyTargeted), ey(EnemyTargeted) + 5 + ct), Bangm(), AND
            PUT (ex(EnemyTargeted), ey(EnemyTargeted) + 5 + ct), Bang1(), OR
            PUT (ex(EnemyTargeted), ey(EnemyTargeted) + 5), Bangm(), AND
            PUT (ex(EnemyTargeted), ey(EnemyTargeted) + 5), Bang1(), OR
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

SUB BeamAttack1Step2 (x%, y%, Mod1%)
COLOR 12
PCOPY 3, 6
LINE (x%, y% + 10)-(Mod1%, y% + 10)
COLOR 4
LINE (x%, y% + 11)-(xc, y% + 11)
LINE (x%, y% + 9)-(xc, y% + 9)
PUT (x%, y% + 5), Bangm(), AND
PUT (x%, y% + 5), Bang1(), OR
PCOPY 6, 0
END SUB

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

SUB ChooseBeam
: LINE (235, 150)-(314, 177), 0, BF
: LINE (235, 150)-(314, 177), 12, B
: COLOR 15
: FOR gha = 3 TO 5 'Inventory slotst that contain beams
    IF InInventory(gha) > 0 THEN
        LOCATE 19 + gha - 2, 31
        PRINT ItemName$(gha)
        ja = ja + 1
    END IF
: NEXT

: PCOPY 6, 3
: LOCATE 20, 31
: COLOR 12
: PRINT ItemName$(3)
: mychoice = 1
: DO
    v$ = INKEY$
    SELECT CASE v$
        CASE CHR$(0) + CHR$(72), CHR$(0) + CHR$(75):
            IF mychoice = 1 THEN mychoice = ja ELSE mychoice = mychoice - 1
            PCOPY 3, 6 'clears the last selection... overkill?
            LOCATE 19 + mychoice, 31
            PRINT ItemName$(mychoice + 2)
        CASE CHR$(0) + CHR$(77), CHR$(0) + CHR$(80):
            IF mychoice = ja THEN mychoice = 1 ELSE mychoice = mychoice + 1
            PCOPY 3, 6
            LOCATE 19 + mychoice, 31
            PRINT ItemName$(mychoice + 2)
        CASE CHR$(13)
            chosen(1, 2) = mychoice: EXIT SUB
        CASE CHR$(27):
            chosen(1, 2) = 0
            mychoice = 0
            GOTO returntopreviousmenu1
    END SELECT
    PCOPY 6, 0
: LOOP
returntopreviousmenu1:
: PCOPY 4, 6
: PCOPY 6, 0
: ErrorLevel = 1
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

SUB Dequip (Character%, Hand%)
CALL AdjustInventory(equip(Character%, Hand%), 1)
equip(Character%, Hand%) = 0
END SUB

FUNCTION EnemiesRemaining (enemyat())
FOR slot = 1 TO 4
    count = count + enemyat(slot)
NEXT
EnemiesRemaining = count
END FUNCTION

SUB EnemiesWontAttack (TrueOrFalse%)
NoEnemies% = TrueOrFalse%
END SUB

SUB EnemyAttack (enum)
DIM ey(3)
ey(1) = 65
ey(2) = 90
ey(3) = 115
PCOPY 6, 3
DO: rtarg = INT(RND(1) * 3) + 1: IF rtarg = 4 THEN rtarg = 3
LOOP UNTIL CurHP(rtarg) > 0
PUT (280, ey(rtarg)), Bangm(), AND: PUT (280, ey(rtarg)), Bang1(), OR
PCOPY 6, 0: PCOPY 3, 6: delay .25
PUT (290, ey(rtarg)), Bangm(), AND: PUT (290, ey(rtarg)), Bang1(), OR
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
CLS: LINE (0, 0)-(319, 199), 1, BF
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
CLS: LINE (0, 0)-(319, 199), 1, BF
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
GET (280, 110)-(299, 129), coverup%(): SCREEN 7, 0, 6, 0
PUT (280, 110), coverup%(), PSET: PCOPY 6, 3
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
        GET (270, ew)-(310, ew), lner()
        SCREEN 7, 0, 6, 0
        PUT (270, ew), lner(), PSET
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
        SCREEN 7, 0, 7, 0: GET (ex(EnemyTargeted) - 10, ew)-(ex(EnemyTargeted) + 30, ew), lner()
        SCREEN 7, 0, 6, 0: PUT (ex(EnemyTargeted) - 10, ew), lner(), PSET
PCOPY 6, 0: delay .00001: NEXT: NEXT:
ERASE ex, ey, lner
END SUB

SUB PartyHPRestored
FOR rstrit = 1 TO 3
    CurHP(rstrit) = charstat(rstrit, 1)
NEXT
END SUB

SUB PartyMPRestored
curmp = charstat(2, 2)
END SUB

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
    dmbo$ = INKEY$
    PCOPY 3, 6
    PCOPY 3, 0
    delay 1
    EXIT SUB
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
        enemyat(xg) = 0
        ehit(xg) = 0
    NEXT
ELSE
    MsgRunFail
    SLEEP
    dmbo$ = INKEY$
    PCOPY 3, 6
    PCOPY 3, 0
    delay 1
    EXIT SUB
END IF
END SUB

SUB SetBattle (batnum, enum)
enemyat(batnum) = enum
END SUB

SUB SetBattleBackground (NewBattleBackground%)
BattleBackground = NewBattleBackground%
END SUB

SUB SpellCast (spnum, EnemyTargeted)
  
DIM ex(4), ey(4), lx(4), ly(4)
CALL AttackPattern1(ex(), ey())
ly(1) = 16: lx(1) = 4: ly(2) = 16
lx(2) = 15: ly(3) = 9: lx(3) = 4: ly(4) = 9: lx(4) = 15
  
IF magdata(spnum, 2) = 0 AND magdata(spnum, 1) < 6 THEN
    CALL EstablishTarget(enemyat%(), EnemyTargeted%)
END IF
  
DIM coverup%(140): SCREEN 7, 0, 7, 0
GET (280, 85)-(299, 104), coverup%(): SCREEN 7, 0, 6, 0
PUT (280, 85), coverup%(), PSET
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
    PUT (xc4me, yc4me), Bangm(), AND
    PUT (xc4me, yc4me), Bang1(), OR
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
DO
    CLS
    LINE (0, 0)-(319, 199), 1, BF
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
    NEXT
    LOCATE 18, 18
    PRINT "GP"; curgold
    COLOR 14
    LOCATE 5, 15
    PRINT "INVENTORY"
    LOCATE 6, 15
    PRINT "EQUIP"
    LOCATE 7, 15: PRINT "EXIT"
    PCOPY 2, 1
: mychc = 1: 
DO
    PCOPY 1, 2
    COLOR 15
    LOCATE mychc + 4, 13
    PRINT CHR$(26)
    PCOPY 2, 0
    ii$ = INKEY$
: SELECT CASE ii$
            CASE CHR$(0) + CHR$(72), CHR$(0) + CHR$(75):
                mychc = mychc - 1: IF mychc = 0 THEN mychc = 3
            CASE CHR$(0) + CHR$(77), CHR$(0) + CHR$(80):
                mychc = mychc + 1: IF mychc = 4 THEN mychc = 1
            CASE CHR$(27):
             ii$ = CHR$(13)
mychc = 3
        END SELECT
    LOOP UNTIL ii$ = CHR$(13)
    IF mychc = 3 THEN
        PCOPY 5, 2: LOCATE py, px
        COLOR 14, totalback: PRINT CHR$(1): EXIT SUB
    END IF
    IF mychc = 2 THEN EquipItems
    IF mychc = 1 THEN
        CLS
        LINE (0, 0)-(319, 199), 1, BF
        LINE (0, 0)-(319, 199), 12, B
        COLOR 15
        LOCATE 2, 3
PRINT "Press any key to exit."
        COLOR 14
        cloc = 5
FOR bala = 1 TO 18
    LOCATE cloc, 10
            IF InInventory(bala) > 0 THEN
                PRINT ItemName$(bala)
                LOCATE cloc, 29
                hag$ = ZeroDelimitedInt$(InInventory(bala), 2)
                PRINT hag$
                cloc = cloc + 1
            END IF
        NEXT
        PCOPY 2, 0
        SLEEP
        dmbo$ = INKEY$
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

SUB TestForLevelUp
IF chrexp% >= 2 ^ level% THEN
    LOCATE 20, 10
    PRINT "You gained a level!"
    level% = level% + 1
    hpmax = hpmax + 25
    WaitKey
END IF
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
NEXT
curgold = curgold + TotalGold&
IF curgold > 9999 THEN curgold = 9999
PRINT "Received"; TotalGold&; "GP!"
LOCATE 3, 40
PRINT CHR$(254)
GOSUB WWinKey
EXIT SUB
WWinKey:
PCOPY 6, 0
SLEEP
dm$ = INKEY$
PCOPY 3, 6
LOCATE 1, 1
RETURN
END SUB

FUNCTION ZeroDelimitedInt$ (Value%, Length%)
    TString$ = LTRIM$(STR$(Value%))
    Temp% = LEN(TString$)
    SELECT CASE Temp%
    CASE 0
      ZeroDelimitedInt$ = STRING$(Length%, "0")
    CASE IS >= Length%
      ZeroDelimitedInt$ = RIGHT$(TString$, Length%)
    CASE IS < Length%
      ZeroDelimitedInt$ = STRING$(Length - Temp%, "0") + TString$
    END SELECT
END FUNCTION

SUB AttackGlenlin (EnemyTargeted)
    DIM coverup(140)
    CALL EstablishTarget(enemyat%(), EnemyTargeted%)
    IF EnemyTargeted = 1 THEN ex = 45: ey = 120: ly = 16: lx = 4
    IF EnemyTargeted = 2 THEN ex = 120: ey = 120: ly = 16: lx = 15
    IF EnemyTargeted = 3 THEN ex = 45: ey = 70: ly = 9: lx = 4
    IF EnemyTargeted = 4 THEN ex = 120: ey = 70: ly = 9: lx = 15
   
    SCREEN 7, 0, 7, 0
    GET (280, 85)-(299, 104), coverup
    SCREEN 7, 0, 6, 0
    PUT (280, 85), coverup, PSET
   
    PUT (280, 85), Mode7Bitmap(0, 7), AND: PUT (280, 85), Mode7Bitmap(0, 6), OR
    PCOPY 6, 3
    FOR xanth = 20 TO 1 STEP -1
      CIRCLE (ex, ey), xanth, 13
      CIRCLE (ex, ey), xanth + 1, 12
      PCOPY 6, 0
      delay .1
      PCOPY 3, 6
    NEXT
    PCOPY 3, 0
    PUT (280, 85), coverup, PSET
    PUT (280, 85), Mode7Bitmap(0, 5), AND
    PUT (280, 85), Mode7Bitmap(0, 4), OR
ERASE coverup: pdamage = INT(RND(1) * 50) + charstat(2, 3) - 50
pdamage = pdamage - INT(.75 * etype(enemyat(EnemyTargeted), 3))
pmiss = INT(RND(1) * 100): IF pmiss < 3 THEN pdamage = 0
SCREEN 7, 0, 0, 0: COLOR 12: LOCATE ly, lx
IF pdamage < 1 THEN PRINT "Miss!": pdamage = 0 ELSE PRINT pdamage
SCREEN 7, 0, 6, 0: ehit(EnemyTargeted) = ehit(EnemyTargeted) - pdamage
IF ehit(EnemyTargeted) < 1 THEN KillEnemy EnemyTargeted
PCOPY 7, 6: delay 1: PlaceEnemies
END SUB

SUB AttackKohlen (EnemyTargeted) STATIC
    DIM coverup(140)
    CALL EstablishTarget(enemyat%(), EnemyTargeted%)
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
FOR xanth = 1 TO 20: PCOPY 3, 6
PUT (ex - xanth, ey), Bangm, AND: PUT (ex - xanth, ey), Bang1, OR
PCOPY 6, 0: delay .1: NEXT: PCOPY 3, 6: PCOPY 3, 0
PUT (280, 110), coverup, PSET
PUT (280, 110), Mode7Bitmap(0, 9), AND: PUT (280, 110), Mode7Bitmap(0, 8), OR
ERASE coverup: pdamage = INT(RND(1) * 50) + charstat(3, 3) - 50
pdamage = pdamage - INT(.75 * etype(enemyat(EnemyTargeted), 3))
pmiss = INT(RND(1) * 100): IF pmiss < 3 THEN pdamage = 0
SCREEN 7, 0, 0, 0: COLOR 12: LOCATE ly, lx
IF pdamage < 1 THEN PRINT "Miss!": pdamage = 0 ELSE PRINT pdamage
SCREEN 7, 0, 6, 0: ehit(EnemyTargeted) = ehit(EnemyTargeted) - pdamage
IF ehit(EnemyTargeted) < 1 THEN KillEnemy EnemyTargeted
PCOPY 7, 6: delay 1: PlaceEnemies
END SUB

SUB AttackKyta (EnemyTargeted) STATIC
    DIM coverup(140)
    CALL EstablishTarget(enemyat%(), EnemyTargeted%)
   
    IF EnemyTargeted = 1 THEN ex = 55: ey = 120: ly = 16: lx = 4
    IF EnemyTargeted = 2 THEN ex = 130: ey = 120: ly = 16: lx = 15
    IF EnemyTargeted = 3 THEN ex = 55: ey = 70: ly = 9: lx = 4
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
FOR xanth = 19 TO 1 STEP -1: PCOPY 3, 6
LINE (ex, ey)-(ex + xanth, ey), 12
LINE (ex, ey - 1)-(ex + xanth, ey - 1), 4
LINE (ex, ey + 1)-(ex + xanth, ey + 1), 4
PCOPY 6, 0: delay .05: NEXT: PCOPY 3, 0
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

SUB AttackPattern1 (ex(), ey())
    ex(1) = 35: ey(1) = 110: ex(2) = 110: ey(2) = 110: ex(3) = 35
    ey(3) = 60: ex(4) = 110: ey(4) = 60
END SUB

SUB Battle7Init STATIC
    
    FOR xxx = 1 TO 4
      enemyat(xxx) = 0
      IF xxx < 4 THEN walled(xxx) = 0
    NEXT
    curgold = 1000
    mapnumber = 1
    px = 9
    py = 19
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
      OPEN MultiText$("BATTLE7.FIL", xcoor + 1) FOR INPUT AS #1
      SCREEN 7, 0, 5, 0
      DrawGraphic 19
      CLOSE
      GET (0, 0)-(19, 19), Mode7Bitmap(0, xcoor * 2)
      GET (20, 0)-(39, 19), Mode7Bitmap(0, xcoor * 2 + 1)
      'DO: LOOP UNTIL INKEY$ <> ""
      SCREEN 7, 0, 0, 0
    NEXT
    COLOR 14
    OPEN "FIRE.IDG" FOR INPUT AS #1
    PRINT "'Fire Spell'"
    SCREEN 7, 0, 5, 0
    DrawGraphic 9
    CLOSE
    GET (0, 0)-(9, 9), Bang1
    GET (10, 0)-(19, 9), Bangm
    SCREEN 7, 0, 0, 0

OPEN "TLDEMO.GAS" FOR BINARY AS 1
FOR xabc = 1 TO 18: GET 1, , inven(xabc): NEXT
CLOSE

FOR xa = 1 TO 3: FOR bc = 1 TO 2: READ equip(xa, bc): NEXT: NEXT
FOR xa = 1 TO 3: FOR bc = 1 TO 4: READ canequip(xa, bc): NEXT: NEXT
FOR xa = 1 TO 3: FOR bc = 1 TO 4: READ charstat(xa, bc): NEXT: NEXT
FOR xabc = 1 TO 3: curhp(xabc) = charstat(xabc, 1): NEXT
FOR xa = 1 TO 2: FOR bc = 6 TO 17: READ power(bc, xa): NEXT: NEXT

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
FOR xabc = 1 TO 4: READ levelup(xabc): NEXT
FOR xabc = 1 TO 3: curexp(xabc) = 1: curlev(xabc) = 1: NEXT

OPEN "TLDEMO.NMB" FOR INPUT AS 1
FOR xabc = 1 TO 18:  LINE INPUT #1, ItemName$(xabc): NEXT
FOR xabc = 1 TO 12:  LINE INPUT #1, mn$(xabc): NEXT
FOR xabc = 1 TO 5:  LINE INPUT #1, ename$(xabc): NEXT
CLOSE 1

SCREEN 7, 0, 0, 0
CLS
END SUB

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

SUB Blockade (x%, y%)
    IF ASC(BlockList(ASC(MID$(curmap$(y%), x%, 1)))) THEN
      SpaceClear = 1
    ELSE
      SpaceClear = 0
    END IF
END SUB
