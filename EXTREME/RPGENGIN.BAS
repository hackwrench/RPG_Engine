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
DECLARE SUB ChestsInit (FileName AS STRING)

DECLARE SUB MultiPrint (Text$(), x%, y%)

DECLARE FUNCTION EnemiesRemaining% (enemyat%())

DECLARE SUB AttackPattern1 (ex%(), ey%())

DECLARE SUB DisplayAttackName (Attack$)

DECLARE FUNCTION ZeroDelimitedInt$ (Value%, Length%)

DECLARE SUB EstablishTarget (enemyat%(), EnemyTargeted%)
DECLARE FUNCTION MultiText$ (FIleName$, Temp&)

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
DECLARE SUB MapFileListInit (FileName$)

DECLARE FUNCTION Surrounding% (x%, y%, ttlf$)
DECLARE SUB Epilogue ()
DECLARE SUB StayTheNight ()
DECLARE SUB CampGround ()
DECLARE SUB statusscreen ()
DECLARE SUB EquipItems ()
DECLARE SUB Mosaic (Siz)
DECLARE SUB CheapSkate ()
DECLARE SUB EnsueBattle ()
DECLARE SUB WinBattle ()
DECLARE SUB SetBattle (batnum, enum)
DECLARE SUB RandBattle (batnum1, batnum2)
DECLARE SUB PlaceEnemies ()
DECLARE SUB IsPartyDead ()
DECLARE SUB BattleMenu (sabro)
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
DECLARE SUB DrawGraphic (endcor%, fc%)

DECLARE SUB PlayMainGame ()
DECLARE SUB TalkVillager (vlgnum)
DECLARE SUB InnkeeperTalk ()
DECLARE SUB ShopkeeperTalk ()
DECLARE SUB BuyItem ()
DECLARE SUB SellItem ()

DECLARE SUB TreasureChest (trnum%)
DECLARE SUB ChestOpened ()
DECLARE SUB RemoveGraphics ()
DECLARE SUB delay (DelTime#)

CONST False = 0
CONST TRUE = NOT False

DIM SHARED DebugNoEnemies%, DebugRun%, DebugPos%, DebugEnemiesAnyway%
DIM Byte AS STRING * 1

DIM SHARED price&(1 TO 18)


DIM SHARED DoActions%

DIM SHARED curgold, curmp, ErrorLevel
DIM SHARED TotalGold&

DIM SHARED money AS INTEGER, exper AS INTEGER
DIM SHARED lefttonext AS INTEGER, lvl AS INTEGER
DIM SHARED KonAttack%, defense AS INTEGER, stage AS INTEGER

'From BATTLE1.BAS
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
DIM SHARED mn$(12)
DIM SHARED mpused(12)
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

'From INVEN.BAS
DIM SHARED inven(18)
DIM SHARED ItemName$(18)

'From MAP.BAS
CONST BitmapX% = 0
CONST BitmapY% = 1
CONST East = BitmapX% * 2
CONST West = BitmapX% * 2 + 1
CONST North = BitmapY% * 2
CONST South = BitmapY% * 2 + 1

DIM SHARED AnimFrame AS INTEGER
DIM SHARED AnimFrameList%(1 TO 8, 1 TO 2)

DIM SHARED SpaceClear AS INTEGER
DIM SHARED curmap$(0 TO 0), px, py, totalback, pox%, poy
DIM SHARED MapFileList(0 TO 0) AS STRING

DIM SHARED MapFunctionsChangeList(0 TO 255) AS ByteArray
DIM SHARED ProxyList(0 TO 255) AS ByteArray
DIM SHARED BlockList(0 TO 255) AS ByteArray
DIM SHARED CharacterDraw%
DIM SHARED outermap%(0 TO 19, 0 TO 19)
DIM SHARED asolid%(0 TO 9, 0 TO 9, 13)
DIM SHARED agrid%(0 TO 9, 0 TO 9, 13)
'Gonna have to do something about this later
DIM SHARED Mode9Graphic%(0 TO 257, 0 TO 11)
DIM SHARED Mode13Graphic%(0 TO 501, 0 TO 171)
   
DIM SHARED ppos%(0 TO 257)
DIM SHARED MapType%
DIM SHARED dir%

'From INIT.BAS
DIM SHARED InitFileName$(1 TO 3)

'From TALK.BAS
REDIM SHARED Talk$(1 TO 1)
REDIM SHARED Exchange%(1 TO 1, 1 TO 1)

'From TREAS.BAS
DIM SHARED Treasure(0 TO 0) AS chest

'ON ERROR GOTO ErrorHandle

RANDOMIZE TIMER

SelGame:
RunScript "RPGENGIN.SCT", "RPGENGIN.RES"
 
INPUT a%
IF a% = 1 THEN
    Init1
END IF
 
IF a% = 2 THEN
    Init2
END IF
 
IF a% = 3 THEN
    Init3
END IF
 

IF a% = 4 THEN
    Init4
END IF
 
IF a% = 5 THEN
    DIM SHARED gold&
    Init5
END IF
IF a% = 6 THEN
    ODebug
END IF
IF a% = 7 THEN
    END
END IF
  
GOTO SelGame
  



ErrorHandle:
ErrorType% = ERR
RESUME NEXT

'Data for weapon/armor price
DATA 0,0,0,0,0,1000,500,750,200,100,250,100,50,200,1000,15000,2000,0
'Can equip
DATA 6,9,12,15,7,10,13,16,8,11,14,17
'Data for character status
DATA 5467,0,107,95,3489,100,57,78,7886,0,99,97
'Data for weapon/armor power
DATA 182,109,203,107,57,99,95,78,97,137,255,151

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
    PRINT "GP"; price&(itmno(gab));
NEXT
PCOPY 2, 1
: mychc = 1
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
IF curgold < price&(itmno(mychc)) THEN
    cannotrun = 1: COLOR , totalback: CheapSkate: EXIT SUB
END IF
LOCATE 2, 3: PRINT "You sure you want it? (Y/N)"
PCOPY 2, 0: DO: ii$ = INKEY$: LOOP UNTIL ii$ <> ""
IF UCASE$(ii$) = "Y" THEN
    curgold = curgold - price&(itmno(mychc))
 
    IF InInventory(itmno(mychc)) <> 99 THEN
        CALL AdjustInventory(itmno(mychc), 1)
    END IF

    LOCATE 2, 3: PRINT "Sold!                         "
    PCOPY 2, 0: delay 1
ELSE
    GOTO StartofBuyingSub
END IF
ERASE itmno
END SUB

SUB CampGround
COLOR 15
LINE (0, 0)-(319, 31), totalback, BF
LINE (0, 31)-(319, 31), 12: LOCATE 1, 1
PRINT "You've stumbled upon a campground."
IF InInventory(18) = 0 THEN
    PRINT "Unfortunately, you don't"
    PRINT "have a tent.": LOCATE 3, 40
    PRINT CHR$(254): PCOPY 2, 0: SLEEP: dmbo$ = INKEY$
ELSE
    PRINT "Would you like to stay for"
    PRINT "the night?           (Y/N)": LOCATE 3, 40
    PRINT CHR$(26): PCOPY 2, 0: SLEEP: dmb$ = INKEY$
    IF UCASE$(dmb$) = "Y" THEN
        curgold = curgold + 50
        CALL AdjustInventory(18, -1)
        StayTheNight
    END IF
    PCOPY 5, 2: LOCATE py, px: COLOR 14: PRINT CHR$(1);
    COLOR , totalback
END IF
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

SUB colledj
SCREEN 9, , 1, 1
CLS
PAINT (1, 1), 1
fc% = FileOPEN("COLLEGE.TLK", "I")
LINE INPUT #fc%, a$
LOCATE 2, 31: PRINT a$;
LINE INPUT #fc%, a$
LOCATE 3, 34: PRINT a$;
LINE INPUT #fc%, a$
LOCATE 5, 10: PRINT a$;
LINE INPUT #fc%, a$
LOCATE 6, 10: PRINT a$;
LINE INPUT a$
SELECT CASE UCASE$(a$)
    CASE "E"
        LINE INPUT #fc%, a$
        LOCATE 10, 10: PRINT a$
        LINE INPUT #1, a$
        LOCATE 11, 10: PRINT a$
        INPUT a
        IF a <= gold& + 1 THEN
            chrexp% = chrexp% + a
            gold& = gold& - a
        ELSE
            LINE INPUT #fc%, a$
            LOCATE 12, 10: PRINT a$
        END IF
    CASE "L"
        LINE INPUT #fc%, a$
        LINE INPUT #fc%, a$
        LINE INPUT #fc%, a$
        LINE INPUT #fc%, a$
        IF chrexp% >= 2 ^ level% THEN
            LOCATE 20, 10: PRINT a$;
            level% = level% + 1
            maxhp% = maxhp% + 25
            hp = maxhp%
            SLEEP
        ELSE
            LINE INPUT #fc%, a$
            LOCATE 20, 10: PRINT a$;
            LINE INPUT #fc%, a$
            LOCATE 21, 20: PRINT a$;
            PRINT 2 ^ level% - chrexp%;
            LINE INPUT #fc%, a$
            PRINT a$
            SLEEP
        END IF
END SELECT
CLOSE fc%
SCREEN 9, , 0, 0
END SUB

SUB CheckForBattle (a$)
    IF NOT DebugNoEnemies% THEN
      IF NOT NoEnemies% THEN
        IF a$ <> "" AND a$ <> CHR$(27) THEN
          xaxa = INT(RND(1) * 100)
          IF mapnumber = 1 AND xaxa < 6 THEN
            RandBattle 1, 2
          END IF
            IF mapnumber = 2 AND xaxa < 5 THEN
              IF INT(RND(1) * 100) < 20 THEN
                SetBattle 1, 5: EnsueBattle
              ELSE
                RandBattle 3, 4
              END IF
            END IF
          END IF
        END IF
      END IF

END SUB

FUNCTION ConfusedInc% (a%, B%)
IF a% <> B% THEN ConfusedInc = -1
a% = a% + 1
END FUNCTION

SUB DebugKeys (Key$)
SELECT CASE Key$
    CASE "!"
        DebugEnemiesWontAttack = NOT DebugEnemiesWontAttack
    CASE "?"
        DebugRun% = NOT DebugRun%
    CASE "#"
        DebugPos% = NOT DebugPos%
    CASE "$"
        DebugEnemiesAnyway% = NOT DebugEnemiesAnyway%
END SELECT
END SUB

SUB DGameGraphicInit
Battle2Init
   
SetMapType 1
LoadGraphic "brick.til"
CALL GetMapGraphic(1, 1, 32, 32, 0)
 
LoadGraphic "grass3.til"
CALL GetMapGraphic(1, 1, 32, 32, 1)

LoadGraphic "tree.til"
CALL GetMapGraphic(1, 1, 32, 32, 2)
   
LoadGraphic "inn.til"
CALL GetMapGraphic(1, 1, 32, 32, 3)

LoadGraphic "winsq.til"
CALL GetMapGraphic(1, 1, 32, 32, 4)

LoadGraphic "college.til"
CALL GetMapGraphic(1, 1, 32, 32, 5)

LoadGraphic "hwall.til"
CALL GetMapGraphic(1, 1, 32, 32, 6)

LoadGraphic "vwall.til"
CALL GetMapGraphic(1, 1, 32, 32, 7)

LoadGraphic "tower.til"
CALL GetMapGraphic(1, 1, 32, 32, 8)

LoadGraphic "weapon.til"
CALL GetMapGraphic(1, 1, 32, 32, 9)
   
LoadGraphic "hero.til"
CALL GetMapGraphic(1, 1, 32, 32, 10)

LoadGraphic "heromask.til"
CALL GetMapGraphic(1, 1, 32, 32, 11)
END SUB

SUB DisplayAttackName (attack$)
PCOPY 6, 3
LINE (225, 5)-(314, 25), 0, BF
LINE (225, 5)-(314, 25), 12, B
LOCATE 2, 30
COLOR 15
PRINT attack$
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

SUB DrawGraphic (endcor%, fc%)
    
FOR yc = 0 TO endcor%: FOR xc = 0 TO endcor%
        INPUT #fc%, bitpixel$
        IF bitpixel$ = "x" THEN
            PSET (xc, yc), 0
            PSET (xc + endcor + 1, yc), 15
        ELSE
            PSET (xc, yc), VAL(bitpixel$)
            PSET (xc + endcor + 1, yc), 0
        END IF
NEXT: NEXT
END SUB

SUB EditMapProperties
IF CurrMapProperties = 0 THEN
    PRINT "Map Type Not Defined"
    PRINT "1. Two byte Blocks, rooms"
    PRINT "2. 1 byte blocks"
    PRINT "3. 2 Byte Blocks"
END IF
END SUB

FUNCTION EnumeratedList$ (Text$, Number&)
EnumeratedList$ = LTRIM$(STR$(Number&)) + ". " + Text$
END FUNCTION

SUB Epilogue
COLOR 14, 0: LOCATE 15, 20: PRINT CHR$(2)
LOCATE 20, 15: PRINT CHR$(1); "    "; CHR$(1); "    "; CHR$(1)
COLOR 15: LOCATE 1, 1: PRINT "KING: Thank you for saving my body"
PRINT "from those awful Vampiras. You will"
PRINT "be well rewarded for this! You will"
PRINT "all be knighted, and œeld in the"
PRINT "highest of honor in my kingdom!"
delay 10: PRINT "I knight thee Sir Kyta Simit!"
COLOR 7: LOCATE 20, 15: PRINT CHR$(2): delay 5: COLOR 15
LOCATE 7, 1: PRINT "I knight thee Sir Glenlin Mugos!"
LOCATE 20, 20: COLOR 7: PRINT CHR$(2): COLOR 15: delay 5
LOCATE 8, 1: PRINT "I knight thee Sir Kohlen Elder!"
LOCATE 20, 25: COLOR 7: PRINT CHR$(2): COLOR 15: delay 5
CLS: PRINT "And so ends the RPG engine demoTgame..."
delay 3: PRINT "But YOU can continue the story...": delay 5
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
IF UCASE$(dmb$) = "Y" THEN
    IF curgold < 50 THEN
        CheapSkate
    ELSE
        StayTheNight
        curgold = curgold - 50
    END IF
END IF
PCOPY 5, 2: LOCATE py, px: COLOR 14: PRINT CHR$(1);
COLOR , totalback
END SUB

SUB inns
SCREEN 9, , 1, 1
CLS
PAINT (1, 1), 1
LOCATE 5, 10
PRINT "Do you want to stay at the inn for"; level%; " Gold (y/n)?";
LINE INPUT a$
    
IF UCASE$(a$) = "Y" AND gold& < level% THEN
    PRINT "Not enough gold!"
    SLEEP
    GOTO jumpo:
END IF
    
    
IF UCASE$(a$) = "Y" AND gold& >= level% THEN
    gold& = gold& - level%
    zzztime
END IF
    
jumpo:
SCREEN 9, , 0, 0
END SUB

SUB load

SCREEN 9, , 1, 1
CLS
PAINT (1, 1), 1

LOCATE 20, 20: PRINT "What filename for load? (no extensions)";
LINE INPUT S$

fc% = FileOPEN(S$ + ".sav", "I")
INPUT #fc%, hp
INPUT #fc%, hpmax
INPUT #fc%, chrexp%
INPUT #fc%, gold&
INPUT #fc%, level%
INPUT #fc%, attack%
INPUT #fc%, py%
INPUT #fc%, px%
INPUT #fc%, pox%
INPUT #fc%, poy%
CLOSE #fc%
SCREEN 9, , 0, 0
GridInt
END SUB

SUB LoadGraphic (FileName$)
fc% = FileOPEN(FileName$, "I")
FOR y = 1 TO 32
    FOR x = 1 TO 32
        INPUT #fc%, a
        PSET (x, y), a
    NEXT x
NEXT y
CLOSE fc%
END SUB

SUB LoadSets (N1%, N2%, Array%(), fp%)
FOR i = N1% TO N2%
    GET 1, , x1%
    GET 1, , y1%
    GET 1, , x2%
    GET 1, , y2%
    GET (x1%, y1%)-(x2%, y2%), Array%(0, i)
NEXT
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
PCOPY 6, 0 ' Copy this stuff to the visible screen
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

FUNCTION MultiText$ (FileName$, Temp&)
fc% = FileOPEN(FileName$, "I")
LINE INPUT #fc%, TempT$
Items& = VAL(TempT$)
FOR i& = 1 TO Temp&
    LINE INPUT #fc%, TempT$
NEXT
MultiText$ = TempT$
CLOSE fc%
END FUNCTION

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
fp% = FileOPEN("LANDSCAP.GLF", "B")
LoadSets 0, 59, Mode13Graphic%(), fp%
CLOSE fp%

FileToScreen "city.kon"
fp% = FileOPEN("CITY.GLF", "B")
LoadSets 60, 80, Mode13Graphic%(), fp%
CLOSE fp%

FileToScreen "stuff.kon" 'Load stuff for some graphics
fp% = FileOPEN("STUFFKON.GLF", "B")
LoadSets 81, 119, Mode13Graphic%(), fp%
CLOSE fp%

CLS
FileToScreen "stuff.msk" 'Load stuff for some masks
fp% = FileOPEN("STUFFMSK.GLF", "B")
LoadSets 120, 153, Mode13Graphic%(), fp%
CLOSE fp%
CLS
FileToScreen "charac.kon" 'Load charac for some graphics
fp% = FileOPEN("CHARKON.GLF", "B")
LoadSets 154, 171, Mode13Graphic%(), fp%
CLOSE fp%
CLS
PALETTE

CALL ModPal
END SUB

SUB ODebug
PRINT "1 Debug the games"
PRINT "2 General debugging routines"
DO
    INPUT a%
    IF a% = 1 THEN PRINT "Not Quite Ready yet"
    IF a% = 2 THEN EXIT DO
LOOP
SetMapType 3
LoadAnimFrameList "ANIM1.AFL"
Battle7Init
SCREEN 13
CALL Land13Init
CALL LoadProxyList("NEWGAME.TAB")
CALL LoadBlockList("BNEWGAME.TAB")
  
SCREEN 0
WIDTH 80
CALL DebugTools
END SUB

SUB parser

psr$ = ""
DO UNTIL psr$ <> ""
    psr$ = INKEY$
LOOP

IF LEFT$(psr$, 1) = CHR$(0) THEN
    move psr$
    SaveGroundAndDrawPlayer
END IF

IF UCASE$(psr$) = "S" THEN
    statusscreen
END IF

IF UCASE$(psr$) = "Q" THEN
    END
END IF

IF UCASE$(psr$) = "Z" THEN
    save
END IF

IF UCASE$(psr$) = "L" THEN
    load
END IF
'IF UCASE$(psr$) = "Z" THEN
'     zzztime
'END IF

END SUB

FUNCTION PartyImmobilized

END FUNCTION

SUB PlayKonrad
MapRenderScreen
DO
    Key$ = INKEY$
    SELECT CASE Key$
        CASE CHR$(0) + "H" 'Up arrow
            GoUp
        CASE CHR$(0) + "P" ''Down Arrow
            GoDown
        CASE CHR$(0) + "M" 'Right Arrow
            GoRight
        CASE CHR$(0) + "K" 'Left
            GoLeft
        CASE " "
            CALL UseSomething
    END SELECT
    CALL DebugKeys(Key$)
    CheckForBattle1a (Key$)
LOOP
END SUB

SUB PlayMainGame
MapRenderScreen
DO
    Key$ = INKEY$
    SELECT CASE Key$
        CASE CHR$(0) + "H" 'up arrow
            GoUp
        CASE CHR$(0) + "K": 'left arrow
            GoLeft
        CASE CHR$(0) + "M": 'right arrow
            GoRight
        CASE CHR$(0) + CHR$(80) 'down arrow
            GoDown
        CASE CHR$(13)
            statusscreen 'Enter key
        CASE " " 'space bar
            CALL CheckSurroundings
        CASE CHR$(27)
            END
        CASE ELSE
            DebugKeys a$
    END SELECT
    CheckWalkOver
    PCOPY 2, 0
    CALL CheckForBattle(a$)
LOOP UNTIL a$ = CHR$(27)
END SUB

SUB PricesInit
FOR i = 1 TO 18: READ price&(i): NEXT i
END SUB

SUB Read13Profile (Array())
DIM Index AS ProfileType
GET 1, , Index
GET (Index.TL.x, Index.TL.y)-(Index.TL.x, Index.TL.y), Array()
END SUB

SUB ReplacePlayer
IF CharacterDraw% THEN
    LOCATE py, px
    MCOLOR 14, totalback
    PRINT CHR$(1);
END IF
END SUB

SUB save

SCREEN 9, , 1, 1
CLS
PAINT (1, 1), 1

LOCATE 20, 20: PRINT "What filename for save? (no extensions)";
LINE INPUT S$

fc% = FileOPEN(S$ + ".sav", "O")
PRINT #fc%, hp
PRINT #fc%, hpmax
PRINT #fc%, chrexp%
PRINT #fc%, gold&
PRINT #fc%, level%
PRINT #fc%, attack%
PRINT #fc%, py%
PRINT #fc%, px%
PRINT #fc%, pox%
PRINT #fc%, poy%
CLOSE #fc%
SCREEN 9, , 0, 0
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
    PRINT "GP"; price&(gab) \ 2 'Based on half
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
        CASE CHR$(27)
           ii$ = CHR$(13)
            mychc = 18
    END SELECT
LOOP UNTIL ii$ = CHR$(13)
IF mychc = 18 THEN EXIT SUB
IF InInventory(mychc) = 0 THEN
    LOCATE 2, 3: PRINT "You don't have any, you idiot!"
    PCOPY 2, 0: delay 1: GOTO StartofSellingSub
END IF
LOCATE 2, 3: PRINT "You sure you don't want it? (Y/N)"
PCOPY 2, 0: DO: ii$ = INKEY$: LOOP UNTIL ii$ <> ""
IF UCASE$(ii$) = "Y" THEN
    curgold = curgold + price&(mychc) \ 2
    AdjustInventory mychc, -1
    IF curgold > 9999 THEN curgold = 9999
    LOCATE 2, 3: PRINT "Done!                             "
    PCOPY 2, 0: delay 1
ELSE
    GOTO StartofSellingSub
END IF
END SUB

SUB SetupStats

fc% = FileOPEN("newgame.dat", "I")

INPUT #fc%, lvl, mp, mpmax, hp, hpmax, KonAttack%, defense
INPUT #fc%, money, exper, lefttonext
INPUT #fc%, py%, px%, AnimFrame, stage
CALL SetPlayerLoc(px%, py%)
CLOSE fc%
MapFileListInit "NEWGAME.LOM"
MapRetrieve 0, 61
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
    ShopkeeperScreen1Redraw
    yurc = 1
    DO
        COLOR 15
        LOCATE yurc + 17, 16
        PRINT CHR$(26)
        ii$ = INKEY$
        SELECT CASE ii$
            CASE CHR$(0) + CHR$(72), CHR$(0) + CHR$(75)
                LOCATE yurc + 17, 16
                PRINT " "
         
                IF yurc = 1 THEN
                    yurc = 3
                ELSE
                    yurc = yurc - 1
                END IF
            CASE CHR$(0) + CHR$(77), CHR$(0) + CHR$(80)
                LOCATE yurc + 17, 16
                PRINT " "

                IF yurc = 3 THEN
                    yurc = 1
                ELSE
                    yurc = yurc + 1
                END IF
            CASE CHR$(27)
                ii$ = CHR$(13): yurc = 3
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
PCOPY 5, 2
LOCATE py, px
COLOR 14
PRINT CHR$(1);
END SUB

SUB Mode7ShowAndRestore (DelTime!)
PCOPY 6, 0
delay DelTime!
PCOPY 3, 6
END SUB

SUB ShowList (FileName$)
FileHandle% = FileOPEN(FileName$, "I")
LINE INPUT #FileHandle%, TempT$
Temp& = VAL(TempT$)
FOR i& = 1 TO Temp&
    LINE INPUT #FileHandle%, TempT$
    PRINT EnumeratedList(TempT$, i&)
NEXT
CLOSE FileHandle%

END SUB

FUNCTION SizeOfTable% (Table%, Tables() AS INTEGER, Index() AS INTEGER)
IF Table% <> UBOUND(Tables) THEN
    SizeOfTable% = Tables(Table% + 1) - Tables(Table%)
ELSE
    SizeOfTable% = UBOUND(Index) - Tables(Table%) + 1
END IF
END FUNCTION

SUB StayTheNight
SCREEN 7, 0, 4, 0
CLS
COLOR , 0
FOR nonamevar = 1 TO 50
    xag = INT(RND(1) * 3) + 1
    IF xag > 3 THEN xag = 3
    IF xag = 1 THEN COLOR 15
    IF xag = 2 THEN COLOR 7
    IF xag = 3 THEN COLOR 8
PSET (INT(RND(1) * 319), INT(RND(1) * 199)): NEXT
PCOPY 4, 0
delay 4
PALETTE 15, 7
PALETTE 7, 8
PALETTE 8, 0
delay 2
PALETTE 15, 8
PALETTE 0, 1
delay 2
PALETTE 0, 9
PALETTE 15, 1
PALETTE 7, 1
PALETTE 8, 9
delay 4
SCREEN 7, 0, 0, 0
CLS
SCREEN 7, 0, 4, 0
CLS
PALETTE 0, 0
PALETTE 7, 7
PALETTE 8, 8
PALETTE 15, 15
PALETTE 11, 1
PALETTE 2, 8
PALETTE 10, 0
MCOLOR 11, 0
FOR waha = 100 TO 50 STEP -1
    LINE (0, 0)-(319, 50), , BF
    CIRCLE (160, waha), 25, 14
    PAINT (160, waha), 14
    LINE (0, 51)-(319, 199), 2, BF
    cntr = 1: FOR lookreal = 50 TO 199: cntr = cntr + 1
        LINE (0, lookreal + 1)-(319, lookreal + cntr), 10, BF
    lookreal = lookreal + cntr: NEXT: delay .1: PCOPY 4, 0
    IF waha = 75 THEN PALETTE 10, 2: PALETTE 11, 9: PALETTE 2, 8
NEXT: FOR ohjeez = 15 TO 1 STEP -1: PALETTE ohjeez, ohjeez: NEXT
cntr = 0: COLOR 14: FOR lookreal = 51 TO 76: cntr = cntr + 1
    LINE (135 + cntr * 4, lookreal + cntr)-(185 - cntr * 4, lookreal + cntr)
lookreal = lookreal + cntr: NEXT: PCOPY 4, 0: delay 4
PartyHPRestored
PartyMPRestored
CLS: SCREEN 7, 0, 2, 0
END SUB

FUNCTION Surrounding% (x%, y%, ttlf$)
'Needs bulletproofing
ok = 0
IF MapBitmap(x% + 1, y%) = ASC(ttlf$) THEN ok = 1
IF MapBitmap(x%, y% + 1) = ASC(ttlf$) THEN ok = 1
IF MapBitmap(x%, y% - 1) = ASC(ttlf$) THEN ok = 1
IF MapBitmap(x% - 1, y%) = ASC(ttlf$) THEN ok = 1
Surrounding% = ok
END FUNCTION

SUB WaitKey
DO UNTIL a$ <> ""
    a$ = INKEY$
LOOP
END SUB

SUB WeaponShop
SCREEN 9, , 1, 1
CLS
PAINT (1, 1), 1
LOCATE 1, 35: PRINT "Weapon shop"
LOCATE 2, 25: PRINT "Buy good quality at a discount!"

LOCATE 10, 10: PRINT "Our stock:"
LOCATE 11, 10: PRINT "(1) Dagger:"
LOCATE 11, 40: PRINT "20 gold"
LOCATE 12, 10: PRINT "(2) Short sword:"
LOCATE 12, 40: PRINT "50 gold"
LOCATE 13, 10: PRINT "(3) Broad sword:"
LOCATE 13, 40: PRINT "500 gold"
LOCATE 15, 3
PRINT "What do you want to buy? (99 for none)";
LINE INPUT D$: c = VAL(D$)
    
IF c = 1 AND gold& >= 20 THEN
    attack% = 3
    gold& = gold& - 20
END IF

IF c = 2 AND gold& >= 50 THEN
    attack% = 5
    gold& = gold& - 50
END IF

IF c = 3 AND gold& >= 500 THEN
    attack% = 15
    gold& = gold& - 500
END IF

SCREEN 9, , 0, 0
END SUB

SUB wins
CLS
PRINT "You win!"
END
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

SUB zzztime
SCREEN 9, , 1, 1
CLS
PAINT (1, 1), 1
LOCATE 3, 59: PRINT "z"
LOCATE 4, 58: PRINT "z"
LOCATE 5, 57: PRINT "z"
LOCATE 6, 21: PRINT "You are sleeping. Hitpoints restored."
LOCATE 20, 10: PRINT "Press any key"
WaitKey
hp = hpmax
SCREEN 9, , 0, 0
END SUB


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

FUNCTION NumberOfChunks (fc%, ChunkType$)
DIM Header AS ChunkHeader
PreserveSeek& = SEEK(fc%)
DO
    GET fc%, , Header
    Header.Chunksize = ReverseLong(Header.Chunksize)
    SEEK fc%, SEEK(fc%) + Header.Chunksize
    IF Header.ChunkType = ChunkType$ THEN TotalChunks% = TotalChunks% + 1
LOOP UNTIL SEEK(fc%) > LOF(fc%)
SEEK fc%, PreserveSeek&
NumberOfChunks = TotalChunks%
END FUNCTION

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

SUB InitInventory
REDIM inven(18)
REDIM ItemName$(18)
END SUB

FUNCTION ItemName$ (Item%)
PRINT ItemName$(Item%)
END FUNCTION

FUNCTION ItemNameIfPossess$ (Item%)
IF InInventory(gha) > 0 THEN ItemNameIfPossess = ItemName$(Item%)
END FUNCTION

SUB LoadInventory (fc%)
REDIM inven(18)
FOR xabc = 1 TO 18
    GET fc%, , inven(xabc)
NEXT
END SUB

SUB LoadItemNames (fc%)
REDIM ItemNames$(18)
FOR xabc = 1 TO 18
    LINE INPUT #fc%, ItemName$(xabc)
NEXT
END SUB

SUB SetInventory (Item%, Amount%)
inven(Item%) = Amount%
END SUB

SUB Actions (Temp$) 'MAP.BAS
SELECT CASE Temp$
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

SUB SetPlayerLoc (x%, y%)
px% = x%
py% = y%
END SUB

SUB AdjustPlayerLoc (x%, y%)
px% = px% + x%
py% = py% + y%
END SUB

SUB Blockade (x%, y%)
IF ASC(BlockList(ASC(MID$(curmap$(y%), x% + 1, 1))).Byte) THEN 'AND &HF
    SpaceClear = 1
ELSE
    SpaceClear = 0
END IF
END SUB

SUB CalcSomething (AnimFrame, somethingup, somethingpx%)
IF AnimFrame = 1 OR AnimFrame = 2 THEN
    somethingup = 1
    somethingpx% = 0
END IF

IF AnimFrame = 3 OR AnimFrame = 4 THEN somethingup = -1: somethingpx% = 0
IF AnimFrame = 5 OR AnimFrame = 6 THEN somethingup = 0: somethingpx% = -1
IF AnimFrame = 7 OR AnimFrame = 8 THEN somethingup = 0: somethingpx% = 1
END SUB

SUB CheckSurroundings
IF Surrounding(px%, py%, "1") THEN TalkVillager 1
IF Surrounding(px%, py%, "2") THEN TalkVillager 2
IF Surrounding(px%, py%, "3") THEN TalkVillager 3
IF Surrounding(px%, py%, "4") THEN TalkVillager 4
IF Surrounding(px%, py%, "5") THEN TalkVillager 5
IF Surrounding(px%, py%, "6") THEN TalkVillager 6
IF Surrounding(px%, py%, "7") THEN TalkVillager 7
IF Surrounding(px%, py%, "Q") THEN TalkQueen
IF Surrounding(px%, py%, "K") THEN TalkKing: EXIT SUB
IF Surrounding(px%, py%, "I") THEN InnkeeperTalk
IF Surrounding(px%, py%, "W") THEN ShopkeeperTalk
IF Surrounding(px%, py%, "C") THEN CampGround
IF Surrounding(px%, py%, "a") THEN TreasureChest 1
IF Surrounding(px%, py%, "b") THEN TreasureChest 2
IF Surrounding(px%, py%, "c") THEN TreasureChest 3
IF Surrounding(px%, py%, "d") THEN TreasureChest 4
IF Surrounding(px%, py%, "v") THEN
    SetBattle 1, 5: TreasureChest 5
END IF
IF Surrounding(px%, py%, "V") THEN
    SetBattle 1, 4: SetBattle 2, 5: TreasureChest 6
END IF
END SUB


SUB CheckWalkOver
SELECT CASE CHR$(MapBitmap(px, py))
    CASE "A"
        SCREEN 7, 0, 0, 0
        CLS
        MapRetrieve 1, 20
        MapDraw 6
        SetPlayerLoc 18, 19
        SCREEN 7, 0, 2, 0
        SetBattleBackground 2
    CASE "B"
        SCREEN 7, 0, 0, 0
        CLS
        MapRetrieve 0, 20
        MapDraw 2
        px = 38: py = 2
        SCREEN 7, 0, 2, 0
        SetBattleBackground 1
    CASE ";"
        EnemiesWontAttack 0
    CASE "'"
        EnemiesWontAttack -1
    CASE ELSE
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
        FOR I = 0 TO 171
            CLS
            PUT (0, 0), Mode13Graphic%(0, I), PSET
            LOCATE 4, 4
            PRINT I
            DO: LOOP UNTIL INKEY$ <> ""
        NEXT I
    CASE ELSE
        GOTO SelDebug
END SELECT
END SUB

SUB DrawCharacter
IF CharacterDraw% THEN
    LOCATE py + 1, px + 1
    COLOR 14
    PRINT CHR$(1);
END IF
END SUB

SUB GetMapGraphic (x1%, y1%, x2%, y2%, ImageNumber%)
SELECT CASE MapType%
    CASE 0
        PRINT "MapType Not set up": END
    CASE 1
        GET (x1%, y1%)-(x2%, y2%), Mode9Graphic%(0, ImageNumber%)
END SELECT
END SUB

SUB GoDown
SELECT CASE MapType%
    CASE 2
        Blockade px, py + 1
        IF SpaceClear = 0 THEN py = py + 1
        PCOPY 5, 2
        DrawCharacter
    CASE 3
        IF AnimFrame <> 1 AND AnimFrame <> 2 THEN AnimFrame = 2
        CalcSomething AnimFrame, somethingup, somethingpx%
        CALL Blockade(px% + somethingpx%, py% + somethingup)
        IF SpaceClear = 0 THEN
            py% = py% + 1: AnimFrame = AnimFrame + 1
            IF AnimFrame = 3 THEN AnimFrame = 1
        END IF
        CALL GridStr(Mode13Graphic%())
        CALL PlayerDispStr(Mode13Graphic%())
END SELECT
END SUB

SUB GoLeft
SELECT CASE MapType%
    CASE 2
        Blockade px - 1, py
        IF SpaceClear = 0 THEN px = px - 1
        PCOPY 5, 2
        DrawCharacter
    CASE 3
        IF AnimFrame <> 5 AND AnimFrame <> 6 THEN AnimFrame = 6
        CalcSomething AnimFrame, somethingup, somethingpx%
        CALL Blockade(px% + somethingpx%, py% + somethingup)
        IF SpaceClear = 0 THEN
            px% = px% - 1
            AnimFrame = AnimFrame + 1
            IF AnimFrame = 7 THEN AnimFrame = 5
        END IF
        CALL GridStr(Mode13Graphic%())
        CALL PlayerDispStr(Mode13Graphic%())
END SELECT
END SUB

SUB GoRight
SELECT CASE MapType
    CASE 2
        Blockade px + 1, py
        IF SpaceClear = 0 THEN px = px + 1
        PCOPY 5, 2
        DrawCharacter
    CASE 3
        IF AnimFrame <> 7 AND AnimFrame <> 8 THEN AnimFrame = 8
        CalcSomething AnimFrame, somethingup, somethingpx%
        CALL Blockade(px% + somethingpx%, py% + somethingup)
        IF SpaceClear = 0 THEN
            px% = px% + 1: AnimFrame = AnimFrame + 1
            IF AnimFrame = 9 THEN AnimFrame = 7
        END IF
        CALL GridStr(Mode13Graphic%())
        CALL PlayerDispStr(Mode13Graphic%())
END SELECT
END SUB

SUB GoUp
SELECT CASE MapType%
    CASE 2
        Blockade px, py - 1
        IF SpaceClear = 0 THEN py = py - 1
        PCOPY 5, 2
        DrawCharacter
    CASE 3
        IF AnimFrame <> 3 AND AnimFrame <> 4 THEN AnimFrame = 4
        CalcSomething AnimFrame, somethingup, somethingpx%
        CALL Blockade(px% + somethingpx%, py% + somethingup)
        IF SpaceClear = 0 THEN
            py% = py% - 1: AnimFrame = AnimFrame + 1
            IF AnimFrame = 5 THEN AnimFrame = 3
        END IF
        CALL GridStr(Mode13Graphic%())
        CALL PlayerDispStr(Mode13Graphic%())
END SELECT
END SUB

SUB GridInt
'CLS
FOR y = 0 TO 9
    FOR x = 0 TO 9
        a = agrid%(y, x, outermap%(pox%, poy%))
        IF a = 1 THEN
            PUT (x * 32 + 15, y * 32 + 15), Mode9Graphic%(0, 0), PSET
        END IF
    
        IF a = 2 THEN
            PUT (x * 32 + 15, y * 32 + 15), Mode9Graphic%(0, 2), PSET
        END IF

        IF a = 3 THEN
            PUT (x * 32 + 15, y * 32 + 15), Mode9Graphic%(0, 1), PSET
        END IF
        IF a = 4 THEN
            PUT (x * 32 + 15, y * 32 + 15), Mode9Graphic%(0, 3), PSET
        END IF

        IF a = 5 THEN
            PUT (x * 32 + 15, y * 32 + 15), Mode9Graphic%(0, 4), PSET
        END IF

        IF a = 6 THEN
            PUT (x * 32 + 15, y * 32 + 15), Mode9Graphic%(0, 5), PSET
        END IF

        IF a = 7 THEN
            PUT (x * 32 + 15, y * 32 + 15), Mode9Graphic%(0, 6), PSET
        END IF

        IF a = 8 THEN
            PUT (x * 32 + 15, y * 32 + 15), Mode9Graphic%(0, 7), PSET
        END IF

        IF a = 9 THEN
            PUT (x * 32 + 15, y * 32 + 15), Mode9Graphic%(0, 8), PSET
        END IF

        IF a = 10 THEN
            PUT (x * 32 + 15, y * 32 + 15), Mode9Graphic%(0, 9), PSET
        END IF

    NEXT x
NEXT y
END SUB

SUB GridStr (Graphic%())

FOR I% = 1 TO 7
    FOR h% = 1 TO 7
        PUT ((h% * 25), (I% * 20)), Graphic%(0, TABLE256%(ProxyList(), ASC(MID$(curmap$((py% - 4) + I%), (px% - 4) + h% + 1, 1)))), PSET
    NEXT h%
NEXT I%
END SUB

SUB Land13DBQuery
fc% = FileOPEN("LANDSCAP.GLF", "B")
FOR I = 0 TO 59
    GET fc%, , x1%
    GET fc%, , y1%
    GET fc%, , x2%
    GET fc%, , y2%
    PUT (x1%, y1%), Mode13Graphic%(0, I), PSET
NEXT
CLOSE fc%
LOCATE 25, 1
PRINT "Press any Key to Continue";
WaitKey

END SUB

SUB LoadAnimFrameList (FileName$)
fc% = FileOPEN(FileName$, "B")
GET fc%, , Temp%
REDIM AnimFrameList%(1 TO Temp%, 1 TO 2)
FOR I = 1 TO Temp%
    FOR J = 1 TO 2
        GET fc%, , AnimFrameList%(I%, J%)
    NEXT
NEXT
CLOSE fc%
END SUB

SUB LoadBlockList (FileName$)
REDIM BlockList(0 TO 255) AS ByteArray
fc% = FileOPEN(FileName$, "B")
FOR I = 0 TO 255
    GET fc%, , BlockList(I)
NEXT
CLOSE fc%
END SUB

SUB LoadMapFunctionsChangeList (FileName$)
Temp% = FileOPEN(FileName$, "B")
FOR I% = 0 TO 255
    GET Temp%, , MapFunctionsChangeList(I%)
NEXT
CLOSE Temp%
END SUB

SUB LoadProxyList (FileName$)
REDIM ProxyList(0 TO 255) AS ByteArray
fc% = FileOPEN(FileName$, "B")
FOR I = 0 TO 255
    GET fc%, , ProxyList(I)
NEXT
CLOSE fc%
END SUB

FUNCTION MapBitmap (x, y)
MapBitmap = ASC(MID$(curmap$(y), x + 1, 1))
END FUNCTION

SUB MapDraw (backcolor)
SCREEN 7, 0, 5, 0
CLS
totalback = backcolor
COLOR , backcolor
FOR drmap = 0 TO 19: FOR maploc = 0 TO 39
        LOCATE drmap + 1, maploc + 1
        z$ = MID$(curmap$(drmap), maploc + 1, 1)
        SELECT CASE z$
            CASE "x"
                COLOR 15: PRINT CHR$(219);
            CASE "X"
                COLOR 14: PRINT CHR$(176);
            CASE "C"
                COLOR 11: PRINT CHR$(254);
            CASE "v", "V", "a", "b", "c", "d"
                COLOR 13: PRINT CHR$(235);
            CASE "I", "W" 'Inn,
                COLOR 9: PRINT CHR$(2);
            CASE "Q", "K" 'Queen, King
                COLOR 14: PRINT CHR$(2);
            CASE "1" TO "7" 'People
                COLOR 15: PRINT CHR$(1);
            CASE "A", "B" 'Exits
                COLOR 8: PRINT CHR$(178);
            CASE " ": PRINT " ";
        END SELECT
    NEXT
NEXT
END SUB

SUB MapFileListInit (FileName$)
fc% = FileOPEN(FileName$, "I")
DO
    LINE INPUT #fc%, Temp$
    counter% = counter% + 1
LOOP UNTIL EOF(1)
SEEK fc%, 1
counter% = counter% - 1
     
REDIM MapFileList(0 TO counter%) AS STRING
    
FOR I = 0 TO counter%
    LINE INPUT #fc%, MapFileList(I)
NEXT
CLOSE fc%
END SUB

SUB MapLocIntrinsicFunctionChange (x%, y%)
MID$(curmap$(y%), x% + 1, 1) = CHR$(TABLE256(MapFunctionsChangeList(), ASC(MID$(curmap$(y%), x% + 1, 1))))
END SUB

SUB MapRenderScreen
SELECT CASE MapType
    CASE 2
        SCREEN 7, 0, 2, 0
        CLS
        PCOPY 5, 2
        DrawCharacter
    CASE 3
        SCREEN 13
        CALL GridStr(Mode13Graphic%())
        CALL PlayerDispStr(Mode13Graphic%())
END SELECT
END SUB

SUB MapRetrieve (Integ%, Lines%)
fc% = FileOPEN(MapFileList(Integ%), "I")
REDIM curmap$(0 TO Lines% - 1)
FOR getmap = 0 TO Lines% - 1
    LINE INPUT #fc%, curmap$(getmap)
NEXT
CLOSE fc%
END SUB

SUB MapType1DataInit
DIM Byte AS STRING * 1
fc% = FileOPEN("GRIDS.DAT", "B")
FOR a = 1 TO 13
    FOR y = 0 TO 9
        FOR x = 0 TO 9
            GET fc%, , Byte
            agrid%(y, x, a) = ASC(Byte)
        NEXT x
    NEXT y
NEXT a
CLOSE fc%
fc% = FileOPEN%("SOLIDS.DAT", "B")
FOR c = 1 TO 13
    FOR y = 0 TO 9
        FOR x = 0 TO 9
            GET fc%, , Byte
            asolid%(x, y, c) = ASC(Byte)
        NEXT x
    NEXT y
NEXT c
CLOSE fc%
fc% = FileOPEN("DGAME.MAP", "I")
FOR y = 1 TO 20
    LINE INPUT #fc%, Temp$
    FOR x = 1 TO 20
        outermap%(y, x) = VAL("&H" + MID$(Temp$, x, 1))
    NEXT x
NEXT y
CLOSE fc%
px% = 5
py% = 7
pox% = 1
poy% = 1

END SUB

SUB move (psr$)
PUT (px% * 32 - 18, py% * 32 - 18), ppos%(), PSET

IF psr$ = CHR$(0) + "K" THEN
    IF asolid%(px% - 1, py%, outermap%(pox%, poy%)) <> 1 THEN
        px% = px% - 1: psr$ = ""
    END IF
END IF
IF psr$ = CHR$(0) + "M" THEN
    IF asolid%(px% + 1, py%, outermap%(pox%, poy%)) <> 1 THEN
        px% = px% + 1: psr$ = ""
    END IF
END IF

IF psr$ = CHR$(0) + "H" THEN
    IF asolid%(px%, py% - 1, outermap%(pox%, poy%)) <> 1 THEN
        py% = py% - 1
    END IF
END IF

IF psr$ = CHR$(0) + "P" THEN
    IF asolid%(px%, py%, outermap%(pox%, poy%)) <> 1 THEN
        py% = py% + 1
    END IF
END IF
   
IF asolid%(px%, py%, outermap%(pox%, poy%)) = 3 THEN
    inns
END IF

IF asolid%(px%, py%, outermap%(pox%, poy%)) = 4 THEN
    wins
END IF

IF asolid%(px%, py%, outermap%(pox%, poy%)) = 5 THEN
    colledj
END IF

IF asolid%(px%, py%, outermap%(pox%, poy%)) = 6 THEN
    WeaponShop
END IF

IF px% = 1 THEN
    px% = 9
    poy% = poy% - 1
    GridInt
END IF

IF py% = 1 THEN
    py% = 9
    pox% = pox% - 1
    GridInt
END IF

IF px% = 10 THEN
    px% = 2
    poy% = poy% + 1
     
    GridInt
END IF

IF py% = 10 THEN
    py% = 2
    pox% = pox% + 1
    GridInt
END IF
CheckForBattle2
END SUB

SUB PlayerDispStr (Graphic%())
IF CharacterDraw% THEN
    PUT (4 * 25, 4 * 20), Graphic(0, AnimFrameList(AnimFrame, 1)), AND
    PUT (4 * 25, 4 * 20), Graphic(0, AnimFrameList(AnimFrame, 2)), OR
END IF
IF DebugPos% THEN
    LOCATE 20, 20
    PRINT MapBitmap(px%, up), ASC(ProxyList(MapBitmap(px%, up)).Byte)
END IF
Key$ = INKEY$

END SUB

FUNCTION READBIT% (Byte%, index%)
READBIT% = Byte% AND 2 ^ index%
END FUNCTION

SUB SaveGroundAndDrawPlayer
GET (px% * 32 - 18, py% * 32 - 18)-(px% * 32 + 31 - 18, py% * 32 + 31 - 18), ppos%()
PUT (px% * 32 - 18, py% * 32 - 18), Mode9Graphic%(0, 11), AND
PUT (px% * 32 - 18, py% * 32 - 18), Mode9Graphic%(0, 10), XOR
END SUB

SUB SetMapProperties (MapPropertiesModeArray%())
REDIM CurrMapProperties(0 TO UBOUND(MapPropertiesModeArray%))
FOR I = 0 TO UBOUND(MapPropertiesModeArray%)
NEXT I
END SUB

SUB SetMapType (NewMapType%)
MapType% = NewMapType%
CharacterDraw% = TRUE
   
SELECT CASE MapType%
    CASE 1
        REDIM Mode9Graphic%(0 TO 257, 0 TO 11)
        REDIM ppos%(0 TO 257)
        REDIM outermap%(20, 20)
        REDIM asolid%(0 TO 9, 0 TO 9, 13)
        REDIM agrid%(0 TO 9, 0 TO 9, 13)
        REDIM Mode9Graphic%(0 TO 257, 0 TO 11)
    CASE 2
    CASE 3
        REDIM Mode13Graphic%(0 TO 501, 0 TO 171)
        AnimFrame% = 1
END SELECT
END SUB


FUNCTION TABLE256% (Bytelist() AS ByteArray, index%)
TABLE256% = ASC(Bytelist(index%).Byte)
END FUNCTION

SUB UseSomething
CalcSomething AnimFrame, somethingup, somethingpx%
IF DoActions% = TRUE THEN
    OldScreen% = screenmode%
    CALL Actions(CHR$(MapBitmap(px% + somethingpx%, py% + somethingup)))
    SCREEN OldScreen%
    CLS
END IF
CALL MapLocIntrinsicFunctionChange(px% + somethingpx%, py% + somethingup)
MapRenderScreen
END SUB

SUB Init1 'SCRIPT
LoadTextArray "INIT1.RES", InitFileName$()
   
CALL LoadTalk(InitFileName$(1))
CALL LoadExchange(InitFileName$(2))
    
ChestsInit InitFileName$(3)
PricesInit
BattleMenuInit
Battle7Init
 
CALL LoadBlockList(InitFileName$(4))
MapFileListInit InitFileName$(5)
MapRetrieve 0, 20
MapDraw 2
SetMapType 2
PlayMainGame
END SUB

SUB Init2
LoadTextArray "INIT2.RES", InitFileName$()
   
SetMapType 3
LoadAnimFrameList InitFileName$(1)
LoadMapFunctionsChangeList InitFileName$(2)

CALL Land13Init

CALL LoadProxyList(InitFileName$(3))
CALL LoadBlockList(InitFileName$(4))

CALL SetupStats
EnemiesWontAttack TRUE
CALL PlayKonrad
END SUB

SUB Init3
LoadTextArray "INIT3.RES", InitFileName$()
   
BattleMenuInit
Battle7Init

CALL Land13Init
 
SetMapType 3
LoadAnimFrameList InitFileName$(1)
LoadMapFunctionsChangeList InitFileName$(2)

CALL LoadProxyList(InitFileName$(3))
CALL LoadBlockList(InitFileName$(4))

EnemiesWontAttack False
CALL SetupStats
CALL PlayKonrad

END SUB

SUB Init4
CALL LoadTalk("TLDEMO.TLK")
CALL LoadExchange("TLDEMO.XCG")
ChestsInit "TLDEMO.TRA"
PricesInit
BattleMenuInit
Battle7Init
SetMapType 3
CALL LoadBlockList("BTLDEMO.TAB")
LoadAnimFrameList "ANIM1.AFL"
LoadMapFunctionsChangeList "USES1.TAB"

CALL Land13Init

CALL LoadProxyList("GTLDEMO.TAB")
MapFileListInit "TLDEMO2.LOM"
MapRetrieve 0, 43
DoActions% = TRUE
AdjustPlayerLoc 0, 20
CALL PlayKonrad

END SUB

SUB Init5
  
SCREEN 9

CALL DGameGraphicInit

EnemiesWontAttack TRUE
' 15 pixel bdry.
CLS
CALL MapType1DataInit
GridInt

SaveGroundAndDrawPlayer

psr$ = ""
DO
    parser
LOOP

END SUB

SUB LoadTextArray (Filename$, Array$())
fc% = FileOPEN(Filename$, "I")
INPUT #fc%, a%
REDIM Array$(1 TO a%)
FOR i = 1 TO a%
    LINE INPUT #fc, a$
    Array$(i) = a$
NEXT
CLOSE fc%
END SUB

SUB RunScript (File1$, File2$)
fc% = FileOPEN(File1$, "B")
CurrentResorce$ = File2$
DO
    GET fc%, , Instruction%
    SELECT CASE Instruction%
        CASE 1
            LoadTextArray CurrentResorce$, InitFileName$()
        
            CurrInitFileName% = 1
        CASE 2
            ShowList InitFileName$(CurrInitFileName%)
        CASE 3
            ERASE InitFileName$
            CLOSE fc%
            EXIT SUB
    END SELECT
LOOP
END SUB

SUB delay (DelTime#) 'SYSTEM.BAS
dtx# = TIMER(.001)
WHILE TIMER(.001) < dtx# + DelTime#
    IF dtx# > TIMER(.001) THEN dtx# = dtx# = 86400
WEND
END SUB

FUNCTION FileOPEN% (Filename$, Mode$)
STATIC CurrFileHandle%
IF Filename$ = "" THEN
    FileOPEN% = CurrFileHandle%
    EXIT FUNCTION
END IF
FileOPEN% = FREEFILE
OPEN Mode$, FREEFILE, Filename$
END FUNCTION

FUNCTION FileOPENChecked% (Filename$, Mode$)
STATIC CurrFileHandle%
IF Filename$ = "" THEN
    ERROR 52
    EXIT FUNCTION
END IF
FileOPEN% = FREEFILE
OPEN Mode$, FREEFILE, Filename$
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
OUT &H3C7, Entry% 'tell controller to get ready
Temp% = INP(&H3C9) 'get red component
Value.red = CHR$(Temp%)
Temp% = INP(&H3C9)
Value.green = CHR$(Temp%) 'get green component
Temp% = INP(&H3C9) 'get blue component
Value.blue = CHR$(Temp%)
END SUB

SUB SetPal (Entry%, Value AS PalValue)
OUT &H3C8, Entry% 'tell controller to get ready
  
OUT &H3C9, ASC(Value.red) 'send red component
OUT &H3C9, ASC(Value.green) 'send green component
OUT &H3C9, ASC(Value.blue) 'send blue component
END SUB

SUB SetScreenMode (sm%)
SCREEN sm%
screenmode% = sm%
END SUB

SUB LoadExchange (FileName$)
fc% = FileOPEN(FileName$, "B")
GET fc%, , Exchanges%
REDIM Exchange%(1 TO 2, 1 TO Exchanges%)
FOR i = 1 TO Exchanges%
    FOR j = 1 TO 2
        GET fc%, , Exchange%(j, i)
NEXT: NEXT
CLOSE fc%
END SUB

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
FOR cba = 0 TO 1
    FOR abc = 1 TO 3
        LOCATE abc, 1
        PRINT Talk$(Exchange(2, 11) + cba * 3 + abc - 1)
    NEXT
    LOCATE 3, 40
    IF cba = 1 THEN
        PRINT CHR$(26)
        PCOPY 2, 0
        SLEEP
        dmb$ = INKEY$
        PCOPY 5, 2
        ReplacePlayer
        PCOPY 2, 0
        delay 1
        COLOR 13
        LOCATE 4, 37
        PRINT CHR$(2)
        LOCATE 5, 36
        PRINT CHR$(2)
        LOCATE 5, 38
        PRINT CHR$(2)
        LOCATE 6, 37
        PRINT CHR$(2)
        PCOPY 2, 0
        delay 3
        COLOR 15
        LINE (0, 0)-(319, 31), totalback, BF
        LINE (0, 31)-(319, 31), 12
        LOCATE 1, 1
        FOR abc = 0 TO 2
            PRINT Talk$(Exchange(2, 13) + abc)
        NEXT
        LOCATE 3, 40
        PRINT CHR$(254)
        PCOPY 2, 0
        SLEEP
        dmbo$ = INKEY$
        FOR whoohoo = 1 TO 4
            SetBattle whoohoo, 5
        NEXT
        cannotrun = 1
        EnsueBattle
        SCREEN 7, 0, 0, 0
        CLS
        Epilogue
        EXIT SUB
    END IF
    IF cba = 0 THEN
        PRINT CHR$(26): PCOPY 2, 0: SLEEP: dmb$ = INKEY$
        LINE (0, 0)-(319, 31), totalback, BF
        LINE (0, 31)-(319, 31), 12
    END IF
NEXT
END SUB

SUB TalkQueen
CALL DoBox

FOR cba = 0 TO 1
    FOR abc = 1 TO 3
        LOCATE abc, 1
        PRINT Talk$(Exchange%(2, 8) + abc - 1 + cba * 3)
    NEXT
    LOCATE 3, 40
    IF cba = 1 THEN
 PRINT CHR$(254)
PCOPY 2, 0
SLEEP
dmb$ = INKEY$
END IF
    IF cba = 0 THEN
        PRINT CHR$(26): PCOPY 2, 0: SLEEP: dmb$ = INKEY$
        LINE (0, 0)-(319, 31), totalback, BF
        LINE (0, 31)-(319, 31), 12
    END IF
NEXT
END SUB

SUB TalkVillager (vlgnum)
CALL DoBox
FOR abc = 1 TO Exchange%(1, vlgnum)
    LOCATE abc, 1
    PRINT Talk$(Exchange%(2, vlgnum) + abc - 1)
NEXT
LOCATE 3, 40
PRINT CHR$(254)
PCOPY 2, 0 'Copies text to screen in mode 7
SLEEP
dmb$ = INKEY$
END SUB

SUB ChestOpened 'TREAS.BAS
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

SUB ChestsInit (FileName AS STRING)
SHARED Treasure() AS chest
fc% = FileOPEN(FileName, "B")
GET fc%, , NumberOfChests%
REDIM Treasure(0 TO NumberOfChests%) AS chest
FOR i = 1 TO NumberOfChests%
    GET fc%, , Treasure(i)
NEXT i
CLOSE fc%
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
PUT (280, 110), coverup%(), PSET
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
ERASE ex, ey, coverup%
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
    TreasureShow
    DO
        bbb$ = INKEY$
    LOOP UNTIL bbb$ = ""
    LOCATE 3, 40
    PRINT CHR$(254): PCOPY 2, 0: SLEEP: dmb$ = INKEY$
ELSE
    COLOR 15
    LINE (0, 0)-(319, 31), totalback, BF
    LINE (0, 31)-(319, 31), 12
    LOCATE 1, 1
    PRINT "Found "; UCASE$(ItemName$(Treasure(trnum).Item)); " x";
    PRINT Treasure(trnum).Quantity

    PotentialInventoryAdjustment% = InInventory(Treasure(trnum).Item) + Treasure(trnum).Quantity
      
    IF PotentialInventoryAdjustment% > 99 THEN
        SetInventory Treasure(trnum).Item, 99
    ELSE
        SetInventory Treasure(trnum).Item, PotentialInventoryAdjustment%
    END IF
     

    LOCATE 3, 40
    PRINT CHR$(254)
    PCOPY 2, 0
    SLEEP
    dmb$ = INKEY$
END IF
END SUB

SUB TreasureShow
IF Treasure(trnum).Item = 0 THEN
    PRINT "but find nothing."
ELSE
    PRINT "and find "; ItemName$(Treasure(trnum).Item); " x";
    PRINT Treasure(trnum).Quantity
    PotentialInventoryAdjustment% = InInventory(Treasure(trnum).Item) + Treasure(trnum).Quantity
      
    IF PotentialInventoryAdjustment% > 99 THEN
        SetInventory Treasure(trnum).Item, 99
    ELSE
        SetInventory Treasure(trnum).Item, PotentialInventoryAdjustment%
    END IF
END IF

END SUB

SUB TargetChar (sabro)
tgt = 1
DIM ep(3, 2)
ep(1, 1) = 280
ep(1, 2) = 60
ep(2, 1) = 280
ep(2, 2) = 85
ep(3, 1) = 280
ep(3, 2) = 110
COLOR 12
SUB AttackGlenlin (EnemyTargeted) 'BATTLE1.BAS
DIM coverup%(140)
CALL EstablishTarget(enemyat%(), EnemyTargeted%)
IF EnemyTargeted = 1 THEN ex = 45: ey = 120: ly = 16: lx = 4
IF EnemyTargeted = 2 THEN ex = 120: ey = 120: ly = 16: lx = 15
IF EnemyTargeted = 3 THEN ex = 45: ey = 70: ly = 9: lx = 4
IF EnemyTargeted = 4 THEN ex = 120: ey = 70: ly = 9: lx = 15
  
SCREEN 7, 0, 7, 0
GET (280, 85)-(299, 104), coverup%()
SCREEN 7, 0, 6, 0
PUT (280, 85), coverup%(), PSET
  
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
PUT (280, 85), coverup%(), PSET
PUT (280, 85), Mode7Bitmap(0, 5), AND
PUT (280, 85), Mode7Bitmap(0, 4), OR
ERASE coverup%: pdamage = INT(RND(1) * 50) + charstat(2, 3) - 50
pdamage = pdamage - INT(.75 * etype(enemyat(EnemyTargeted), 3))
pmiss = INT(RND(1) * 100): IF pmiss < 3 THEN pdamage = 0
SCREEN 7, 0, 0, 0: COLOR 12: LOCATE ly, lx
IF pdamage < 1 THEN PRINT "Miss!": pdamage = 0 ELSE PRINT pdamage
SCREEN 7, 0, 6, 0: ehit(EnemyTargeted) = ehit(EnemyTargeted) - pdamage
IF ehit(EnemyTargeted) < 1 THEN KillEnemy EnemyTargeted
PCOPY 7, 6: delay 1: PlaceEnemies
END SUB

SUB AttackKohlen (EnemyTargeted)
DIM coverup%(140)
CALL EstablishTarget(enemyat%(), EnemyTargeted%)
IF EnemyTargeted = 1 THEN ex = 50: ey = 120: ly = 16: lx = 4
IF EnemyTargeted = 2 THEN ex = 125: ey = 120: ly = 16: lx = 15
IF EnemyTargeted = 3 THEN ex = 50: ey = 70: ly = 9: lx = 4
IF EnemyTargeted = 4 THEN ex = 125: ey = 70: ly = 9: lx = 15
  
SCREEN 7, 0, 7, 0
GET (280, 110)-(299, 129), coverup%()
SCREEN 7, 0, 6, 0
PUT (280, 110), coverup%(), PSET
PUT (280, 110), Mode7Bitmap(0, 11), AND
PUT (280, 110), Mode7Bitmap(0, 10), OR
PCOPY 6, 3
FOR xanth = 1 TO 20: PCOPY 3, 6
    PUT (ex - xanth, ey), Bangm(), AND: PUT (ex - xanth, ey), Bang1(), OR
PCOPY 6, 0: delay .1: NEXT: PCOPY 3, 6: PCOPY 3, 0
PUT (280, 110), coverup%(), PSET
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
GET (280, 60)-(299, 79), coverup%()
SCREEN 7, 0, 6, 0
PUT (280, 60), coverup%(), PSET
  
  
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
PCOPY 3, 6: PUT (280, 60), coverup%(), PSET
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
DO
    PCOPY 4, 6
    whassis$ = INKEY$
    CIRCLE (ep(tgt, 1) + 10, ep(tgt, 2) + 10), 20
    LINE (ep(tgt, 1) + 10, ep(tgt, 2) - 12)-(ep(tgt, 1) + 10, ep(tgt, 2) + 32)
    LINE (ep(tgt, 1) - 12, ep(tgt, 2) + 10)-(ep(tgt, 1) + 32, ep(tgt, 2) + 10)
    SELECT CASE whassis$
        CASE CHR$(0) + CHR$(72), CHR$(0) + CHR$(75)
            IF tgt = 1 THEN
                tgt = 3
            ELSE
                tgt = tgt - 1
            END IF
        CASE CHR$(0) + CHR$(77), CHR$(0) + CHR$(80)
            IF tgt = 3 THEN tgt = 1 ELSE tgt = tgt + 1
        CASE CHR$(13)
            chosen(sabro, 3) = tgt: ERASE ep: PCOPY 4, 6: PCOPY 6, 0: EXIT SUB
        CASE CHR$(27):
 ErrorLevel = 1
ERASE ep
PCOPY 4, 6
PCOPY 6, 0
EXIT SUB
    END SELECT
PCOPY 6, 0
LOOP
END SUB



