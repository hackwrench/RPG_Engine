DECLARE FUNCTION TABLE256% (Bytelist() AS ANY, index%)
DECLARE FUNCTION READBIT% (Byte%, index%)
DEFINT A-Z
'$DYNAMIC
TYPE ByteArray
  Byte AS STRING * 1
END TYPE

DECLARE SUB EnemiesWontAttack (TrueOrFalse%)
DECLARE SUB SetBattleBackground (NewBattleBackground%)
DECLARE SUB SetPlayerLoc (x%, y%)
DECLARE SUB MapRetrieve (Integ%, Lines%)
DECLARE SUB MapDraw (backcolor%)
DECLARE SUB DrawCharacter ()

DECLARE SUB Actions (Temp$)
DECLARE SUB MapRenderScreen ()
DECLARE SUB MapLocIntrinsicFunctionChange (x%, y%)
DECLARE SUB WaitKey ()
DECLARE SUB Land13DBQuery ()
DECLARE SUB LoadSets (N1%, N2%, Array%(), fp%)
DECLARE SUB ModPal ()
DECLARE SUB FileToScreen (FileName$)

DECLARE SUB CalcSomething (AnimFrame%, somethingup%, somethingpx%)
DECLARE SUB GridStr (Graphic%())
DECLARE SUB PlayerDispStr (Graphic%())

DECLARE FUNCTION Surrounding% (x%, y%, ttlf$)
DECLARE SUB CampGround ()
DECLARE SUB InnkeeperTalk ()
DECLARE SUB ShopkeeperTalk ()
DECLARE SUB TalkVillager (vlgnum%)
DECLARE SUB TalkQueen ()
DECLARE SUB TalkKing ()
DECLARE SUB TreasureChest (trnum%)
DECLARE SUB SetBattle (batnum%, enum%)

DECLARE SUB CheckForBattle2 ()

DECLARE SUB Blockade (x%, y%)
DECLARE SUB battle ()
DECLARE SUB colledj ()
DECLARE SUB inns ()
DECLARE SUB wins ()
DECLARE SUB WeaponShop ()
DECLARE SUB computesolid ()
DECLARE SUB GridInt ()

DECLARE FUNCTION FileOPEN% (FileName$, Mode$)
DECLARE FUNCTION MapBitmap% (x%, y%)

CONST False = 0
CONST TRUE = NOT False

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

SUB Actions (Temp$)
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

REM $STATIC
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

REM $DYNAMIC
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

SUB Land13Init
SCREEN 13
FOR I = 1 TO 255
    PALETTE I, 0
NEXT I     'Change all colors to black

FileToScreen "landscap.kon"
fp% = FileOPEN("LANDSCAP.GLF", "B")
  LoadSets 0, 59, Mode13Graphic%(), fp%
CLOSE fp%

FileToScreen "city.kon"
fp% = FileOPEN("CITY.GLF", "B")
  LoadSets 60, 80, Mode13Graphic%(), fp%
CLOSE fp%

FileToScreen "stuff.kon"                    'Load stuff for some graphics
fp% = FileOPEN("STUFFKON.GLF", "B")
   LoadSets 81, 119, Mode13Graphic%(), fp%
CLOSE fp%

CLS
FileToScreen "stuff.msk"                       'Load stuff for some masks
fp% = FileOPEN("STUFFMSK.GLF", "B")
   LoadSets 120, 153, Mode13Graphic%(), fp%
CLOSE fp%
CLS
FileToScreen "charac.kon"                   'Load charac for some graphics
fp% = FileOPEN("CHARKON.GLF", "B")
  LoadSets 154, 171, Mode13Graphic%(), fp%
CLOSE fp%
CLS
PALETTE

CALL ModPal
END SUB

REM $STATIC
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

REM $DYNAMIC
SUB LoadBlockList (FileName$)
    REDIM BlockList(0 TO 255) AS ByteArray
    fc% = FileOPEN(FileName$, "B")
    FOR I = 0 TO 255
      GET fc%, , BlockList(I)
    NEXT
    CLOSE fc%
END SUB

REM $STATIC
SUB LoadMapFunctionsChangeList (FileName$)
    Temp% = FileOPEN(FileName$, "B")
     FOR I% = 0 TO 255
      GET Temp%, , MapFunctionsChangeList(I%)
    NEXT
    CLOSE Temp%
END SUB

REM $DYNAMIC
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

REM $STATIC
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

REM $DYNAMIC
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
    PUT (px% * 32 - 18, py% * 32 - 18), ppos%, PSET

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

REM $STATIC
FUNCTION READBIT% (Byte%, index%)
    READBIT% = Byte% AND 2 ^ index%
END FUNCTION

REM $DYNAMIC
SUB SaveGroundAndDrawPlayer
    GET (px% * 32 - 18, py% * 32 - 18)-(px% * 32 + 31 - 18, py% * 32 + 31 - 18), ppos%
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

SUB SetPlayerLoc (x%, y%)
    px% = x%
    py% = y%
END SUB

REM $STATIC
FUNCTION TABLE256% (Bytelist() AS ByteArray, index%)
    TABLE256% = ASC(Bytelist(index%).Byte)
END FUNCTION

REM $DYNAMIC
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

