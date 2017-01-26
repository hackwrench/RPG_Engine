DEFINT A-Z
'$DYNAMIC
DECLARE FUNCTION FileOPEN% (Filename$, Mode$)

DECLARE SUB ShowList (Filename$)
DECLARE SUB LoadTextArray (Filename$, Array$())

DECLARE SUB LoadExchange (Filename$)
DECLARE SUB LoadTalk (Filename$)
DECLARE SUB PricesInit ()
DECLARE SUB DGameGraphicInit ()
DECLARE SUB parser ()
DECLARE SUB PlayKonrad ()
DECLARE SUB SetupStats ()
DECLARE SUB PlayMainGame ()
DECLARE SUB TalkInit ()
DECLARE SUB ChestsInit (Filename AS STRING)
DECLARE SUB EnemiesWontAttack (TrueOrFalse%)
DECLARE SUB BattleMenuInit ()
DECLARE SUB Battle7Init ()
DECLARE SUB LoadAnimFrameList (Filename$)
DECLARE SUB AdjustPlayerLoc (x%, y%)
DECLARE SUB MapType1DataInit ()
DECLARE SUB SetMapType (NewMapType%)
DECLARE SUB LoadMapFunctionsChangeList (Filename$)
DECLARE SUB SaveGroundAndDrawPlayer ()
DECLARE SUB LoadBlockList (Filename$)
DECLARE SUB LoadProxyList (Filename$)
DECLARE SUB Land13Init ()
DECLARE SUB GridInt ()
DECLARE SUB MapRetrieve (Integ%, Lines%)
DECLARE SUB MapFileListInit (Filename$)
DECLARE SUB MapDraw (backcolor%)

    DIM SHARED InitFileName$(1 TO 3)

REM $STATIC
SUB Init1
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

