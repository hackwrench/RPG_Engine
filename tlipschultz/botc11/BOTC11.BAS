'$DYNAMIC
DEFINT A-Z

DECLARE SUB AnsiDraw (ansfilename$)
DECLARE SUB WinTheGame ()
DECLARE SUB ShowTextFile (flnam$)
DECLARE SUB ShowBotScores (scorebool%)
DECLARE SUB UpdateScoreList ()
DECLARE SUB LoadUserData ()
DECLARE SUB ResaveAsDead (usernumbr%)
DECLARE SUB BotherUser (hisname$)
DECLARE SUB RemoveFromFile (remfile$, remname$)
DECLARE SUB Healthometer (hoaty%, hoatx%, hoatx2%)
DECLARE SUB YouDied ()
DECLARE SUB bshow (whic%, t$)
DECLARE SUB DoBattle (direc%)
DECLARE SUB InventoryPopUp ()
DECLARE SUB MagicPopUp ()
DECLARE SUB DoEffect (efno%, efparam%, ruib%)
DECLARE SUB NewsReport (whatf$, mesg$)
DECLARE SUB ErrMessage (mesg$)
DECLARE SUB TestResponse ()
DECLARE SUB DisplayRoom (bool%)
DECLARE SUB ccol (paramcol1%, paramcol2%)
DECLARE SUB SetTextPos (paramloc1%, paramloc2%)
DECLARE SUB endthis (putemasleep%)
DECLARE SUB mshow (a$)
DECLARE SUB show (a$)
DECLARE SUB stopfor (timeto!)
DECLARE SUB getone ()
DECLARE SUB getx (howmany%, texttype%, uppercaser%)
DECLARE SUB AnsiDraw (ansname$)
DECLARE SUB clss ()
DECLARE SUB SaveUserData ()
DECLARE SUB FileUserInfo (pnombre%)
DECLARE SUB CenterShow (atthisy%, showthis$, inthiscolor%)
DECLARE SUB GetItemInfo (itemno, fightb, ifnm$)
DECLARE FUNCTION EncryptText$ (convertme$)
DECLARE FUNCTION DecryptText$ (convertme$)
DECLARE FUNCTION _FILEEXISTS (filename$)
DECLARE FUNCTION AddPadding$ (padamt%, st2pd$)
DECLARE FUNCTION GetFileLine$ (zfn$, lineno)
DECLARE FUNCTION NumericPrompt% (they%, thex%, whattosay$, firstval%, lastval%)
DECLARE FUNCTION randnum% (alim, blim)
DECLARE FUNCTION ItemName$ (itemno)
DECLARE FUNCTION ItemDesc$ (itemno)
DECLARE FUNCTION SpellName$ (spellno)
DECLARE FUNCTION SpellDesc$ (spellno)
DECLARE FUNCTION SpellCost$ (spellno)

DIM SHARED r$, ColorForeground, cbg%, cyp%, cxp%, thisplayer, pexist, pgold, peqp(1 TO 2), pwins
DIM SHARED rmno$, turnsleft, worldno, inven(1 TO 80), phandle$, psex$, pswing, plife
DIM SHARED WorldName$(0 TO 6), magic(24), pexp, plvl, php, pmp, phmax, pmmax, pexneed, runf
DIM SHARED pmindmg, pmaxdmg, pdef, pwpwk, parmstr, parmwk, shno$, pbase, edef, isboss
DIM SHARED uflag, ustring$, selection, iga, pevd, enemyat(1 TO 4), earmstr, earmwk
DIM SHARED HOPSTEP%, fornum$, forcode$, fornum2$, fornum3$, NAME$, psexed
DIM SHARED colorbase%, colorbold%, colorback%, colorblink%
DIM SHARED recallx%, recally%, slowdraw%, tempdraw%, iswyrdwad%

HOPSTEP% = 0
iswyrdwad% = 0
fornum$ = ""
forcode$ = ""
fornum2$ = ""
fornum3$ = ""
colorbase% = 7
colorbold% = 0
colorback% = 0
colorblink% = 0
recallx% = 1
recally% = 1
slowdraw% = 0
tempdraw% = 0
progname$ = "Blood of the Chameleon "
_TITLE "Blood of the Chameleon"
version$ = "1.1"
exename$ = "BOTC11"
'Auto.Recycle% = 0
'initialize
'detect.ansi
RANDOMIZE TIMER
whichn$ = GetFileLine$("BOTC-TN.DAT", 1)
picknchoose% = randnum(1, VAL(whichn$))

WorldName$(0) = "?        "
WorldName$(1) = "Eagle    "
WorldName$(2) = "Delidia  "
WorldName$(3) = "Phorax   "
WorldName$(4) = "Labyrinth"
WorldName$(5) = "Shagwood "
WorldName$(6) = "Neglif   "

CLS
COLOR 7
PRINT "Rekajiggering game data, please wait..."

'TryTheWholeThingAgain:

'CLOSE ALL
'ON ERROR GOTO TryTheWholeThingAgain


FOR loadfour% = 1 TO 3
 thisplayer = loadfour%
 LoadUserData
 IF ustring$ <> DATE$ THEN
  showda% = 0
  IF _FILEEXISTS("MAIL" + LTRIM$(STR$(loadfour%)) + ".ML") = 0 THEN filexists% = 1 ELSE filexists% = 0
  IF filexists% = 1 THEN
    OPEN "data\MAIL" + LTRIM$(STR$(loadfour%)) + ".ML" FOR INPUT AS #38
    DO WHILE NOT EOF(38)
        LINE INPUT #38, showme$
        IF showme$ = "%s" THEN
                LINE INPUT #38, sxway$
                LINE INPUT #38, sxname$
                LINE INPUT #38, sxnum$
                LINE INPUT #38, sxpron$
                LINE INPUT #38, sxturns$
                LINE INPUT #38, sxgend$
                LINE INPUT #38, sxlvl$
                LINE INPUT #38, sxarm$
                r$ = "n"
                SELECT CASE loadfour%
                    CASE 1:
                        IF VAL(sxturns$) >= 1000 THEN r$ = "y"
                    CASE 2:
                        IF sxgend$ = "F" AND VAL(sxlvl$) >= 23 AND VAL(sxlvl$) <= 38 THEN r$ = "y"
                    CASE 3:
                        IF sxgend$ = "M" AND VAL(sxarm$) = 74 THEN r$ = "y"
                END SELECT
                IF r$ = "y" THEN
                    OPEN "data\MAIL" + sxnum$ + ".ML" FOR APPEND AS #99
                    PRINT #99, "|13You just remembered what happened with " + phandle$ + "..."
                    PRINT #99, "|13and it was WILD..."
                    PRINT #99, ""
                    PRINT #99, "|05Experience up by 25!"
                    PRINT #99, "%y"
                    CLOSE #99
                    NewsReport "NEWS.TDY", "|13" + phandle$ + " and " + sxname$ + " had wild " + sxway$ + " sex last night!"
                    pexp = pexp + 25
                    IF pexp > 25480 THEN pexp = 25480
                ELSE
                    OPEN "data\MAIL" + sxnum$ + ".ML" FOR APPEND AS #99
                    PRINT #99, "|06You just remembered what happened with " + phandle$ + "..."
                    PRINT #99, "|06and it hurt... it was quite a slap..."
                    PRINT #99, ""
                    PRINT #99, "|01Experience down by 50!"
                    PRINT #99, "%n"
                    CLOSE #99
                    NewsReport "NEWS.TDY", "|06" + phandle$ + " slapped " + sxname$ + " for suggesting a night of " + sxway$ + " sex!"
                    pexp = pexp + 50
                    IF pexp > 25480 THEN pexp = 25480
                END IF
                SHOWME$ = "%p"
                SXWAY$ = ""
                SXNAME$ = ""
                SXNUM$ = ""
                SXPRON$ = ""
                sxturns$ = ""
                sxgend$ = ""
                sxlvl$ = ""
                sxarm$ = ""
        END IF
        IF RIGHT$(showme$, 48) = " stapled a message to your back while you slept." AND showda% = 0 THEN
                showme$ = MID$(showme$, 4, LEN(showme$) - 51)
                showda% = VAL(GetFileLine$(LEFT$(phandle$, 4) + ".RES", 11))
                SHELL "ren data\" + LEFT$(phandle$, 4) + ".RES backup.res >data\trash.txt"
                OPEN "data\backup.res" FOR INPUT AS #98
                OPEN "data\" + LEFT$(phandle$, 4) + ".RES" FOR OUTPUT AS #99
                FOR dumbers% = 1 TO showda%
                    LINE INPUT #98, craziness$
                    PRINT #99, craziness$
                NEXT
                craziness$ = DecryptText$(craziness$)
                dumbers% = showda%
                DO WHILE dumbers% < 10
                    LINE INPUT #98, r$
                    PRINT #99, r$
                    dumbers% = dumbers% + 1
                LOOP
                IF showda% = 10 THEN showda% = 1 ELSE showda% = showda% + 1
                PRINT #99, STR$(showda%)
                CLOSE #98
                CLOSE #99
                KILL "data\backup.res"
                OPEN "data\USERS.HND" FOR INPUT AS #99
                dumbers% = 0
                DO
                    LINE INPUT #99, r$
                    dumbers% = dumbers% + 1
                LOOP UNTIL EOF(99) OR r$ = showme$
                CLOSE #99
                IF r$ = showme$ THEN
                    OPEN "data\MAIL" + LTRIM$(RTRIM$(STR$(dumbers%))) + ".ML" FOR APPEND AS #76
                    PRINT #76, "|13" + phandle$ + " stapled a message to your back while you slept."
                    PRINT #76, "|13It reads as follows:"
                    PRINT #76, ""
                    PRINT #76, craziness$
                    PRINT #76, ""
                    PRINT #76, "|13To write a response, you must first locate " + phandle$ + "!"
                    PRINT #76, "%p"
                    CLOSE #76
                END IF
        END IF
    LOOP
    SHOWME$ = ""
    CLOSE #38
    KILL "data\MAIL" + LTRIM$(STR$(thisplayer)) + ".ML"
  END IF
  IF turnsleft < 250 THEN turnsleft = 250
  php = phmax
  pmp = pmmax
  psexed = 0
  FileUserInfo loadfour%
  ShowBotScores 2
  IF _FILEEXISTS(shno$ + ".SLP") = 0 THEN
      dumbers% = 0
      OPEN "data\" + shno$ + ".SLP" FOR INPUT AS #99
    DO WHILE NOT EOF(99)
        LINE INPUT #99, r$
        IF r$ = phandle$ THEN dumbers% = 1
    LOOP
    CLOSE #99
  ELSE
      dumbers% = 0
  END IF
  IF dumbers% = 0 THEN
        OPEN "data\" + shno$ + ".SLP" FOR APPEND AS #99
        PRINT #99, phandle$
        CLOSE #99
  END IF
 END IF
NEXT

ON ERROR GOTO ErrorHandler
r$ = ""

DO
phandle$ = ""
ustring$ = ""
pwins = 0
psex$ = "M"
pmindmg = 0
pmaxdmg = 10
FOR a = 1 TO 4
    enemyat(A) = 0
NEXT
pexneed = 40
pdef = 5
pwpwk = 0
parmstr = 0
parmwk = 0
pbase = 0
pevd = 5
pswing = 1
pexp = 0
plvl = 1
php = 20
pmp = 10
phmax = 20
pmmax = 10
peqp(1) = 48
peqp(2) = 68
pgold = 100
ColorForeground = 7: cbg% = 0
cyp% = 1: cxp% = 1
pexist = 0
psexed = 0
turnsleft = 250
worldno = 99
uflag = 0
isboss = 0
plife = 0
shno$ = ""
rmno$ = ""
FOR i = 1 TO 80
    inven(I) = 0
NEXT
inven(48) = 1
inven(68) = 1
inven(1) = 1
FOR i = 1 TO 24
    magic(I) = 0
NEXT
'IF NAME$ = "THE WIZARD GLENLIN" THEN turnsleft = 999
'IF NAME$ = "KING ARTHUR" THEN turnsleft = 999
'IF NAME$ = "CIXELSYD" THEN turnsleft = 999
'IF NAME$ = "HAND OF JUSTICE" THEN turnsleft = 999
'IF NAME$ = "SETZER" THEN turnsleft = 999
'IF NAME$ = "SHADOWSLASH" THEN turnsleft = 999
clss

'IF NAME$ = "THE WIZARD GLENLIN" THEN
'OPEN "LOG.TWG" FOR INPUT AS #20
'lnct = 0
'DO WHILE NOT EOF(20)
'LINE INPUT #20, yah$
'lnct = lnct + 1
'IF lnct = 23 THEN
'        SetTextPos 23, 1: mshow "-=Press any key=-;"
'        getone
'        lnct = 1
'        SetTextPos 1, 1: mshow yah$
'ELSE
'        SetTextPos lnct, 1
'        mshow yah$
'END IF
'LOOP
'CLOSE #20
'OPEN "LOG.TWG" FOR OUTPUT AS #20
'CLOSE #20
'SetTextPos 23, 1
'mshow "-=Press any key=-;"
'getone
'END IF

AnsiDraw "data\BOTC-T" + LTRIM$(STR$(picknchoose%)) + ".ANS"
whichn$ = ""
SetTextPos 20, 27
getx 20, 1, 1
IF r$ = "" THEN NAME$ = EncryptText$("DEFAULT") ELSE NAME$ = EncryptText$(UCASE$(r$))
IF DecryptText$(NAME$) = "TURNS" THEN turnsleft = 999
IF DecryptText$(NAME$) = "WYRDWAD" THEN turnsleft = 25 

OPEN "data\USERS.DAT" FOR INPUT AS #20
playernum = 0
playerdone = 0
DO WHILE NOT EOF(20)
    LINE INPUT #20, unm$
    playernum = playernum + 1
    IF unm$ = NAME$ THEN
        playerdone = 1
        thisplayer = playernum
        pexist = 1
        LoadUserData
    END IF
LOOP
CLOSE #20

CenterShow 18, STRING$(70, " "), 7
CenterShow 19, STRING$(70, " "), 7
CenterShow 20, STRING$(70, " "), 7
CenterShow 21, STRING$(70, " "), 7
CenterShow 22, STRING$(70, " "), 7
CenterShow 23, STRING$(70, " "), 7

IF playerdone = 1 AND DecryptText$(NAME$) <> "DEFAULT" THEN
    CenterShow 20, "OK to log in as " + phandle$ + "?        ", 9
    CenterShow 22, "(Y)es  (N)o        ", 3
END IF

IF playerdone = 0 THEN
    SELECT CASE DecryptText$(NAME$)
        CASE "TURNS":
            CenterShow 19, "LONGPLAY MODE: Character will have 999 turns per day.        ", 14
            CenterShow 20, "You've elected to create a new character in this mode. Is this OK?        ", 9
        CASE "GOD":
            CenterShow 19, "GOD MODE: Character will have Vulteria Godbook at startup.        ", 14
            CenterShow 20, "You've elected to create a new character in this mode. Is this OK?        ", 9
        CASE "WYRDWAD":
            CenterShow 18, "MASOCHIST MODE: Character will start with Changeling equipment,        ", 14
            CenterShow 19, "but will be limited to 25 turns per day.        ", 14
            CenterShow 20, "You've elected to create a new character in this mode. Is this OK?        ", 9
        CASE "DEFAULT":
            CenterShow 18, "You've elected to create a new character under the DEFAULT password.        ", 9
            CenterShow 19, "Anyone with access to this computer will be able to play as this        ", 9
            CenterShow 20, "character. Are you sure this is OK?        ", 9
        CASE ELSE:
            CenterShow 20, "This is a NEW PASSWORD. OK to create a new character?        ", 9
    END SELECT
    CenterShow 22, "(Y)es  (N)o        ", 3
END IF

IF playerdone = 1 AND DecryptText$(NAME$) = "DEFAULT" THEN
    r$ = "y"
ELSE
    DO
        getone
    LOOP UNTIL r$ = "y" OR r$ = "n"
END IF

LOOP UNTIL r$ = "y"

DO
    AnsiDraw "data\BOTC-MM.ANS"
    DO
        getone
    LOOP UNTIL r$ = "e" OR r$ = "a" OR r$ = "q" OR r$ = "l" OR r$ = "?" OR r$ = "!" OR r$ = "h"
    SELECT CASE r$
        CASE "l":
            AnsiDraw "data\BOTCHIGH.ANS"
            PRINT "<press any key to continue>"
            getone
            r$ = ""
            CASE "!":
            AnsiDraw "data\QUIKHINT.ANS"
            getone
            CASE "?":
            ShowTextFile "BOTC.INS"
            CASE "h":
            ShowTextFile "BOTC.HIS"
            CASE "a":
            AnsiDraw "data\ADM.ANS"
            slowdraw% = 1
            DO
                DO
                    getone
                LOOP UNTIL r$ <> ""
                SELECT CASE r$
                    CASE "1": AnsiDraw "data\SLEEP.ANS"
                    CASE "2": AnsiDraw "data\FALLING.ANS"
                    CASE "3": AnsiDraw "data\WATRFALL.ANS"
                    CASE "4": AnsiDraw "data\RAMP.ANS"
                    CASE "5": AnsiDraw "data\LADDRDWN.ANS"
                    CASE "6": AnsiDraw "data\LIGHTUP.ANS"
                    CASE "7": AnsiDraw "data\BRIDTUNN.ANS"
                    CASE "8": AnsiDraw "data\SKYFALL1.ANS"
                    CASE "9": AnsiDraw "data\SKYFALL2.ANS"
                    CASE "a": AnsiDraw "data\DIVEDOWN.ANS"
                    CASE "b": AnsiDraw "data\MINECAR.ANS"
                    CASE "c": AnsiDraw "data\PITFALL.ANS"
                    CASE "d": AnsiDraw "data\GEYSER.ANS"
                    CASE "e": AnsiDraw "data\NEGLFALL.ANS"
                END SELECT
            LOOP UNTIL r$ = "q"
            r$ = ""
            slowdraw% = 0
    END SELECT
LOOP UNTIL r$ = "e" OR r$ = "q"

IF r$ = "q" THEN endthis 1

IF ustring$ <> DATE$ THEN
    IF turnsleft < 250 THEN turnsleft = 250
    IF DecryptText$(NAME$) = "TURNS" AND turnsleft < 1000 THEN turnsleft = 999
    IF DecryptText$(NAME$) = "WYRDWAD" AND turnsleft < 1000 THEN turnsleft = 25
    php = phmax
    pmp = pmmax
    psexed = 0
END IF

ustring$ = ""

IF playerdone = 0 THEN
    okcrap = 0
    thisplayer = playernum + 1
    DO
        newsof1$ = ""
        newsof2$ = ""
        newsof3$ = ""
        AnsiDraw "data\GIVENAME.ANS"
        DO
            SetTextPos 5, 33
            show STRING$(12, " ")
            ColorForeground = 11
            SetTextPos 5, 33
            getx 12, 1, 0
            r$ = LTRIM$(RTRIM$(r$))
            newsof1$ = r$
            OPEN "data\USERS.HND" FOR INPUT AS #77
            DO WHILE NOT EOF(77) AND UCASE$(checkcomp$) <> UCASE$(newsof1$)
                LINE INPUT #77, checkcomp$
            LOOP
            CLOSE #77
            IF UCASE$(checkcomp$) = UCASE$(newsof1$) THEN
                CenterShow 6, "That name is already in use. Please choose another.", 12
                newsof1$ = ""
                ELSE
                CenterShow 6, "", 12
            END IF
        LOOP UNTIL newsof1$ <> ""
        CHECKCOMP$ = ""
        phandle$ = newsof1$
        SetTextPos 8, 1
        AnsiDraw "data\GIVESEX.ANS"
        DO
            getone
        LOOP UNTIL r$ = "m" OR r$ = "f" OR r$ = "h" OR r$ = "n" OR r$ = "b"
        psex$ = UCASE$(r$)
        SELECT CASE r$
            CASE "m": newsof2$ = " man"
                CASE "f": newsof2$ = " woman"
                CASE "n": newsof2$ = " neuter"
                CASE "h": newsof2$ = " hermaphrodite"
                CASE "b": newsof2$ = "n asexual biopod"
        END SELECT
        IF psex$ = "M" OR psex$ = "F" THEN
            SetTextPos 13, 1
            AnsiDraw "data\GIVEPREF.ANS"
            DO
                getone
            LOOP UNTIL r$ >= "1" AND r$ <= "6"
            IF r$ = "6" THEN pswing = 2 ELSE pswing = VAL(r$)
            SELECT CASE r$
                CASE "2": newsof3$ = " bisexual"
                    CASE "3": newsof3$ = " gay"
                    CASE "4": newsof3$ = " celibate"
                    CASE "5": newsof3$ = "n asexual"
            END SELECT
            ELSE
            SELECT CASE psex$
                CASE "H": pswing = 2
                    CASE "N": pswing = 4
                    CASE "B": pswing = 5
            END SELECT
        END IF
        newsof1$ = "A" + newsof3$ + newsof2$ + " named " + newsof1$ + " has arrived in Vulteria!"
        newsof2$ = ""
        newsof3$ = ""
        CenterShow 20, "This is what you've just chosen:  ", 2
        CenterShow 21, newsof1$ + "  ", 14
        CenterShow 22, "Is this OK?  (Y)es  (N)o  ", 10
        DO
            getone
        LOOP UNTIL r$ = "y" OR r$ = "n"
        IF r$ = "y" THEN
            okcrap = 1
            IF DecryptText$(NAME$) = "GOD" THEN inven(3) = 1
            IF DecryptText$(NAME$) = "WYRDWAD" THEN
                inven(48) = 0
                inven(68) = 0
                inven(67) = 1
                inven(80) = 1
                peqp(1) = 67
                peqp(2) = 80
                parmwk = 6
                parmstr = 6
                pwpwk = 6
                pmindmg = 0
                pmaxdmg = 100
                pdef = 90
                turnsleft = 25
            END IF
            IF DecryptText$(NAME$) = "STALWART DEBUGGERY" THEN inven(43) = 1
        END IF
    LOOP UNTIL okcrap = 1
    AnsiDraw "data\QUIKHINT.ANS"
    getone
    clss
    ColorForeground = 10
    show "The game's background story is 2 screens long -- read it?  (Y)es  (N)o"
    DO
        getone
    LOOP UNTIL r$ = "y" OR r$ = "n"
    IF r$ = "y" THEN
        AnsiDraw "data\INTRO1.ANS"
        getone
        AnsiDraw "data\INTRO2.ANS"
        getone
    END IF
    AnsiDraw "data\INTRO3.ANS"
    DO
        getone
    LOOP UNTIL r$ >= "1" AND r$ <= "4"
    SELECT CASE r$
        CASE "1":
            rmno$ = "1-003"
            pmp = 10
            pmmax = 10
            AnsiDraw "data\EAGLE.ANS"
            CASE "2":
            rmno$ = "5-037-1"
            pmp = 15
            pmmax = 15
            AnsiDraw "data\SHAGWOOD.ANS"
            CASE "3":
            rmno$ = "3-070"
            pmp = 10
            pmmax = 10
            AnsiDraw "data\PHORAX.ANS"
            CASE ELSE:
            rmno$ = "2-095"
            pmp = 15
            pmmax = 15
            AnsiDraw "data\DELIDIA.ANS"
    END SELECT
    shno$ = rmno$
    getone
    'IF r$ = "1" THEN rmno$ = "5-037-1" ELSE rmno$ = "1-003"
    r$ = ""
    SaveUserData
    NewsReport "NEWS.TDY", "|11" + newsof1$
    newsof1$ = ""
END IF

IF _FILEEXISTS("MAIL" + LTRIM$(STR$(thisplayer)) + ".ML") = 0 THEN
    OPEN "data\MAIL" + LTRIM$(STR$(thisplayer)) + ".ML" FOR INPUT AS #38
    clss
    SetTextPos 1, 1
    DO WHILE NOT EOF(38)
        LINE INPUT #38, showme$
        SELECT CASE showme$
            CASE "%s":
                mshow ""
                mshow "Did you accept?  (Y)es  (N)o"
                LINE INPUT #38, sxway$
                LINE INPUT #38, sxname$
                LINE INPUT #38, sxnum$
                LINE INPUT #38, sxpron$
                r$ = ""
                DO
                    getone
                LOOP UNTIL r$ = "y" OR r$ = "n"
                IF r$ = "y" THEN
                    clss
                    SetTextPos 1, 1
                    mshow "|13Mmmm... what a night..."
                    mshow ""
                    mshow "|05Experience up by 25!"
                    OPEN "data\MAIL" + sxnum$ + ".ML" FOR APPEND AS #99
                    PRINT #99, "|13You just remembered what happened with " + phandle$ + "..."
                    PRINT #99, "|13and it was WILD..."
                    PRINT #99, ""
                    PRINT #99, "|05Experience up by 25!"
                    PRINT #99, "%y"
                    CLOSE #99
                    NewsReport "NEWS.TDY", "|13" + phandle$ + " and " + sxname$ + " had wild " + sxway$ + " sex last night!"
                    pexp = pexp + 25
                    IF pexp > 25480 THEN pexp = 25480
                    ELSE
                    clss
                    SetTextPos 1, 1
                    mshow "|12How dare " + sxpron$ + " suggest that! Maybe " + sxpron$ + "'ll think twice next time..."
                    mshow ""
                    mshow "|04Experience up by 50!"
                    OPEN "data\MAIL" + sxnum$ + ".ML" FOR APPEND AS #99
                    PRINT #99, "|06You just remembered what happened with " + phandle$ + "..."
                    PRINT #99, "|06and it hurt... it was quite a slap..."
                    PRINT #99, ""
                    PRINT #99, "|01Experience down by 50!"
                    PRINT #99, "%n"
                    CLOSE #99
                    NewsReport "NEWS.TDY", "|06" + phandle$ + " slapped " + sxname$ + " for suggesting a night of " + sxway$ + " sex!"
                    pexp = pexp + 50
                    IF pexp > 25480 THEN pexp = 25480
                END IF
                SHOWME$ = "%p"
                SXWAY$ = ""
                SXNAME$ = ""
                SXNUM$ = ""
                SXPRON$ = ""
                CASE "%y":
                pexp = pexp + 25
                IF pexp > 25480 THEN pexp = 25480
                SHOWME$ = "%p"
                CASE "%n"
                pexp = pexp - 50
                IF pexp < 0 THEN pexp = 0
                SHOWME$ = "%p"
                CASE ELSE:
                IF showme$ <> "%p" THEN mshow showme$
        END SELECT
        IF showme$ = "%p" THEN
            mshow ""
            mshow "|10<press any key to continue>"
            getone
            r$ = ""
            clss
            SetTextPos 1, 1
        END IF
    LOOP
    SHOWME$ = ""
    CLOSE #38
    KILL "data\MAIL" + LTRIM$(STR$(thisplayer)) + ".ML"
END IF

DoEffect 1, 0, 0

IF php < 1 THEN YouDied

IF pexist = 1 THEN RemoveFromFile LEFT$(rmno$, 5) + ".SLP", phandle$
AnsiDraw "data\BOTCALPH.ANS"
Healthometer 1, 61, 74
DisplayRoom 1
DO
    getone
    TestResponse
LOOP UNTIL r$ = "q"
AnsiDraw "data\BOTCEND.ANS"
getone
'NewsReport "LOG.TWG", phandle$ + " had" + STR$(turnsleft) + " turns left."
ShowBotScores 0
endthis 0

ErrorHandler:
RESUME NEXT

REM $STATIC

FUNCTION EncryptText$ (convertme$) STATIC
conver$ = CONVERTME$
FOR poz% = 1 TO LEN(conver$)
    zy$ = MID$(conver$, POZ%, 1)
    IF zy$ <> " " THEN zx$ = CHR$(ASC(zy$) - 3) ELSE zx$ = " "
    IF zy$ >= "A" AND zy$ <= "Z" AND zx$ < "A" THEN zx$ = CHR$(ASC(zx$) + 26)
    IF zy$ >= "a" AND zy$ <= "z" AND zx$ < "a" THEN zx$ = CHR$(ASC(zx$) + 26)
    IF zy$ >= "0" AND zy$ <= "9" AND zx$ < "0" THEN zx$ = CHR$(ASC(zx$) + 10)
    MID$(conver$, poz%, 1) = zx$
NEXT
ENCRYPTTEXT$ = conver$
END FUNCTION

FUNCTION DecryptText$ (convertme$) STATIC
conver$ = CONVERTME$
FOR poz% = 1 TO LEN(conver$)
    zy$ = MID$(conver$, POZ%, 1)
    IF zy$ <> " " THEN zx$ = CHR$(ASC(zy$) + 3) ELSE zx$ = " "
    IF zy$ >= "A" AND zy$ <= "Z" AND zx$ > "Z" THEN zx$ = CHR$(ASC(zx$) - 26)
    IF zy$ >= "a" AND zy$ <= "z" AND zx$ > "z" THEN zx$ = CHR$(ASC(zx$) - 26)
    IF zy$ >= "0" AND zy$ <= "9" AND zx$ > "9" THEN zx$ = CHR$(ASC(zx$) - 10)
    MID$(conver$, poz%, 1) = zx$
NEXT
DECRYPTTEXT$ = conver$
END FUNCTION


SUB AnsiDraw (ansfilename$) STATIC
OPEN ansfilename$ FOR INPUT AS #111
DO WHILE NOT EOF(111)
    abba$ = INPUT$(1, 111)
    IF abba$ = CHR$(27) THEN
        abba$ = INPUT$(1, 111)
        fornum$ = ""
        fornum2$ = ""
        fornum3$ = ""
        DO
            abba$ = INPUT$(1, 111)
            IF abba$ >= "0" AND abba$ <= "9" THEN fornum$ = fornum$ + abba$
        LOOP UNTIL abba$ < "0" OR abba$ > "9"
        forcode$ = abba$
        IF forcode$ = ";" THEN
            DO
                abba$ = INPUT$(1, 111)
                IF abba$ >= "0" AND abba$ <= "9" THEN fornum2$ = fornum2$ + abba$
            LOOP UNTIL abba$ < "0" OR abba$ > "9"
            forcode$ = abba$
            IF forcode$ = ";" THEN
                DO
                    abba$ = INPUT$(1, 111)
                    IF abba$ >= "0" AND abba$ <= "9" THEN fornum3$ = fornum3$ + abba$
                LOOP UNTIL abba$ < "0" OR abba$ > "9"
                forcode$ = abba$
            END IF
        END IF
        IF forcode$ = "?" THEN
            abba$ = INPUT$(2, 111)
            abba$ = ""
        END IF
    END IF
    IF forcode$ <> "" THEN
        IF forcode$ = "m" THEN
            FOR dubious% = 1 TO 3
                SELECT CASE fornum$
                    CASE "30": colorbase% = 0
                        CASE "31": colorbase% = 4
                        CASE "32": colorbase% = 2
                        CASE "33": colorbase% = 6
                        CASE "34": colorbase% = 1
                        CASE "35": colorbase% = 5
                        CASE "36": colorbase% = 3
                        CASE "37": colorbase% = 7
                        CASE "0": colorbold% = 0: colorblink% = 0: colorback% = 0: colorbase% = 7
                        CASE "1": colorbold% = 8
                        CASE "5": colorblink% = 16
                        CASE "40": colorback% = 0
                        CASE "41": colorback% = 4
                        CASE "42": colorback% = 2
                        CASE "43": colorback% = 6
                        CASE "44": colorback% = 1
                        CASE "45": colorback% = 5
                        CASE "46": colorback% = 3
                        CASE "47": colorback% = 7
                END SELECT
                IF dubious% = 1 THEN fornum$ = fornum2$
                IF dubious% = 2 THEN fornum$ = fornum3$
            NEXT
        END IF
        IF forcode$ = "C" THEN
            IF fornum$ = "" THEN fornum$ = "1"
            tempx% = pos(0) + VAL(fornum$)
            IF tempx% > 80 THEN tempx% = 80
            LOCATE csrlin, tempx%
        END IF
        IF forcode$ = "A" THEN
            IF fornum$ = "" THEN fornum$ = "1"
            tempy% = csrlin - VAL(fornum$)
            IF tempy% < 1 THEN tempy% = 1
            LOCATE tempy%, pos(0)
        END IF
        IF forcode$ = "B" THEN
            IF fornum$ = "" THEN fornum$ = "1"
            tempy% = csrlin + VAL(fornum$)
            IF tempy% > 24 THEN tempy% = 24
            LOCATE tempy%, pos(0)
        END IF
        IF forcode$ = "D" THEN
            IF fornum$ = "" THEN fornum$ = "1"
            tempx% = pos(0) - VAL(fornum$)
            if tempx% < 1 THEN tempx% = 1
            LOCATE csrlin, tempx%
        END IF
        IF forcode$ = "H" THEN LOCATE VAL(fornum$), VAL(fornum2$)
        IF forcode$ = "f" THEN LOCATE VAL(fornum$), VAL(fornum2$)
        IF forcode$ = "s" THEN recally% = csrlin: recallx% = pos(0)
        IF forcode$ = "u" THEN LOCATE recally%, recallx%
        IF forcode$ = "J" AND fornum$ = "2" THEN clss
        IF forcode$ = "K" THEN
            COLOR 7, 0
            FOR dumdum% = pos(0) TO 80
                PRINT " ";
            NEXT
            COLOR (colorbase% + colorbold% + colorblink%), colorback%
        END IF
        forcode$ = ""
        abba$ = ""
    END IF
    IF abba$ <> CHR$(13) THEN COLOR (colorbase% + colorbold% + colorblink%), colorback%: PRINT abba$;
    '    IF abba$ = CHR$(10) AND csrlin = 24 THEN LOCATE 23, 1
    '    IF slowdraw% > 0 OR tempdraw% > 0 THEN HOPSTEP% = HOPSTEP% + 1
    '    IF HOPSTEP% = 12 THEN
    '        tim! = TIMER
    '        DO
    '        LOOP UNTIL TIMER >= tim! + 0.004
    '        HOPSTEP% = 0
    '    END IF
    IF slowdraw% > 0 OR tempdraw% > 0 THEN _DELAY 0.002
LOOP
CLOSE #111
IF tempdraw% > 0 THEN tempdraw% = tempdraw% - 1
cyp% = csrlin: cxp% = pos(0)
ColorForeground = colorbase% + colorbold% + colorblink%
cbg% = colorback%
END SUB

FUNCTION AddPadding$ (padamt%, st2pd$) STATIC
s2p$ = ST2PD$ + STRING$(PADAMT% - LEN(ST2PD$), " ")
ADDPADDING$ = s2p$
END FUNCTION

SUB BotherUser (hisname$) STATIC
CurrFile% =FileOPEN%("data\USERS.HND", "I")

handno = 0
DO WHILE NOT EOF(CurrFile%) AND doomey$ <> hisname$
    handno = handno + 1
    LINE INPUT #77, doomey$
LOOP
CLOSE CurrFile%
handnos$ = LTRIM$(STR$(handno))
ErrMessage "So you want to bother " + hisname$ + ". What do you want to do?"
SetTextPos 15, 1
mshow "|14 (A)ttack"
IF psex$ <> "N" AND psex$ <> "B" THEN mshow "|14 (!)Seduce"
mshow "|14 (M)essage"
mshow "|14 (Q)uit"
r$ = ""
DO
    getone
LOOP UNTIL r$ = "a" OR r$ = "m" OR r$ = "q" OR (r$ = "!" AND psex$ <> "B" AND psex$ <> "N")
IF doomey$ <> hisname$ THEN
    ErrMessage "No such user!"
    ELSE
    SELECT CASE r$
        CASE "!":
         IF (UCASE$(phandle$) = "SILV" OR UCASE$(phandle$) = "SILVERMIST") AND psex$ = "M" AND hisname$ = "Bugen" THEN
            ErrMessage "Despite the rumors, he doesn't swing that way, Silv. A hug is all you get!"
         ELSE
            IF psexed = 0 THEN
            OPEN "data\USER" + handnos$ FOR INPUT AS #76
            FOR u = 1 TO 10
                LINE INPUT #76, ogend$
            NEXT
            INPUT #76, oswing
            CLOSE #76
            OGEND$ = psex$ + OGEND$
            newshow$ = ""
            SELECT CASE oswing
                CASE 1:
                    IF ogend$ = "MF" OR ogend$ = "FM" THEN
                        newshow$ = "passionate"
                        ELSEIF RIGHT$(ogend$, 1) = "H" OR LEFT$(ogend$, 1) = "H" THEN
                        newshow$ = "hermaphrodite"
                        ELSE
                        ErrMessage "If you recall, " + hisname$ + " doesn't swing that way."
                    END IF
                    CASE 2:
                    IF RIGHT$(ogend$, 1) <> "B" AND RIGHT$(ogend$, 1) <> "N" THEN
                        IF RIGHT$(ogend$, 1) = "H" OR LEFT$(ogend$, 1) = "H" THEN
                            newshow$ = "hermaphrodite"
                            ELSEIF ogend$ = "MF" OR ogend$ = "FM" THEN
                            newshow$ = "passionate"
                            ELSE
                            newshow$ = "gay"
                        END IF
                        ELSE
                        ErrMessage hisname$ + " isn't actually capable of that."
                    END IF
                    CASE 3:
                    IF ogend$ = "MM" OR ogend$ = "FF" THEN
                        newshow$ = "gay"
                        ELSEIF LEFT$(ogend$, 1) = "H" THEN
                        newshow$ = "hermaphrodite"
                        ELSE
                        ErrMessage hisname$ + " is gay, and thus would never agree to it."
                    END IF
                    CASE 4:
                    ErrMessage hisname$ + " is nonsexual."
                    CASE 5:
                    ErrMessage hisname$ + " doesn't have normal organs."
            END SELECT
            IF newshow$ <> "" THEN
                OPEN "data\MAIL" + handnos$ + ".ML" FOR APPEND AS #76
                PRINT #76, "|15" + phandle$ + " tried to seduce you into " + newshow$ + " sex!"
                PRINT #76, "%s"
                PRINT #76, newshow$
                PRINT #76, phandle$
                PRINT #76, LTRIM$(STR$(thisplayer))
                SELECT CASE psex$
                    CASE "M":
                        PRINT #76, "he"
                        CASE "F":
                        PRINT #76, "she"
                        CASE ELSE:
                        PRINT #76, "it"
                END SELECT
                IF hisname$ = "Wyrdwad" OR hisname$ = "Bugen" OR hisname$ = "Brandchan" THEN
                    PRINT #76, LTRIM$(STR$(turnsleft))
                    PRINT #76, psex$
                    PRINT #76, LTRIM$(STR$(plvl))
                    PRINT #76, LTRIM$(STR$(peqp(2)))
                END IF
                CLOSE #76
                ErrMessage "You seduced " + hisname$ + ", but you forget what happened..."
                newshow$ = ""
                psexed = 1
            END IF
            OGEND$ = ""
            ELSE
                ErrMessage "You're exhausted from your previous tryst. Best to wait until tomorrow!"
            END IF
          END IF
        CASE "a":
            isboss = 100 + handno
            DoBattle handno
            CASE "m":
            ErrMessage "Enter your message (5 lines max, type /s on a blank line to save or cancel)."
            DIM msg2usr$(1 TO 5)
            FOR t = 1 TO 5
                msg2usr$(T) = ""
            NEXT
            FOR t = 1 TO 5
                ColorForeground = 2
                SetTextPos 14 + t, 1
                show STR$(t) + ": ;"
                getx 72, 3, 2
                IF LCASE$(LTRIM$(RTRIM$(r$))) = "/s" THEN
                    T = 5
                    ELSE
                    msg2usr$(T) = r$
                END IF
            NEXT
            ErrMessage "Do you wish to send this message to " + hisname$ + "?  (Y)es  (N)o"
            r$ = ""
            DO
                getone
            LOOP UNTIL r$ = "y" OR r$ = "n"
            IF r$ = "y" THEN
                OPEN "data\MAIL" + handnos$ + ".ML" FOR APPEND AS #76
                PRINT #76, "|13" + phandle$ + " stapled a message to your back while you slept."
                PRINT #76, "|13It reads as follows:"
                PRINT #76, ""
                U = 5
                FOR t = 5 TO 1 STEP -1
                    IF msg2usr$(t) = "" THEN
                        U = U - 1
                        ELSE
                        T = 1
                    END IF
                NEXT
                FOR t = 1 TO u
                    PRINT #76, msg2usr$(t)
                NEXT
                PRINT #76, ""
                PRINT #76, "|13To write a response, you must first locate " + phandle$ + "!"
                PRINT #76, "%p"
                CLOSE #76
                ErrMessage "Message sent!"
                ELSE
                ErrMessage "No message sent."
            END IF
            ERASE msg2usr$
            CASE "q":
            ErrMessage "You decide not to bother anyone."
    END SELECT
END IF
DOOMEY$ = ""
handnos$ = ""
r$ = ""
END SUB

SUB bshow (whic%, t$) STATIC
IF whic% = 1 THEN cxp% = 24 ELSE cxp% = 2
IF LEFT$(t$, 1) = "|" THEN
    ColorForeground = VAL(MID$(T$, 2, 2))
    a$ = MID$(T$, 4)
    ELSE
    ColorForeground = 10
    a$ = T$
END IF
IF whic% = 1 THEN
    COLOR ColorForeground, cbg%
    LOCATE cyp%, cxp%
    PRINT a$ + STRING$(53 - LEN(a$), " ")
    ELSE
    COLOR ColorForeground, cbg%
    LOCATE cyp%, cxp%
    PRINT a$ + STRING$(20 - LEN(a$), " ");
END IF
IF whic% = 1 THEN cxp% = 24 ELSE cxp% = 4
cyp% = cyp% + 1
IF cyp% > 23 THEN cyp% = 23
LOCATE cyp%, cxp%
END SUB

SUB ccol (paramcol1, paramcol2) STATIC
ColorForeground = paramcol1: cbg% = paramcol2
END SUB

SUB CenterShow (atthisy%, showthis$, inthiscolor%) STATIC
SetTextPos atthisy%, 1
tempthis$ = SHOWTHIS$
tempthis$ = STRING$((80 - LEN(SHOWTHIS$)) \ 2, " ") + tempthis$
tempco$ = LTRIM$(STR$(INTHISCOLOR%))
IF LEN(tempco$) < 2 THEN tempco$ = "|0" + tempco$ ELSE tempco$ = "|" + tempco$
mshow tempco$ + tempthis$
END SUB

SUB clss STATIC
'COLOR 7, 0
'FOR scrpos% = 1 TO 23
'    LOCATE scrpos%, 1
'    PRINT STRING$(80, " ")
'NEXT
'LOCATE 24, 1
'PRINT STRING$(79, " ");
CLS
LOCATE 1, 1
cyp% = 1
cxp% = 1
END SUB

SUB DisplayRoom (bool%) STATIC
IF VAL(LEFT$(rmno$, 1)) <> worldno THEN
    SetTextPos 6, 5
    ccol 15, 0
    show WorldName$(VAL(LEFT$(rmno$, 1)))
    worldno = VAL(LEFT$(rmno$, 1))
END IF
SetTextPos 12, 12
ccol 7, 0
IF turnsleft < 1 THEN
    show " 0  "
    ELSEIF turnsleft = 1000 THEN
    show " INF"
    ELSE
    show STR$(turnsleft) + "  "
END IF
ccol 8, 0
SetTextPos 5, 67
show "8"
SetTextPos 7, 63
show "4       6"
SetTextPos 9, 67
show "2"
SetTextPos 8, 5
ccol 7, 0
show MID$(rmno$, 3, 3)
OPEN "data\" + rmno$ + ".LOC" FOR INPUT AS #10
LINE INPUT #10, rmelev$
bountyfl = 0
enemieshere = 0
IF _FILEEXISTS(LEFT$(rmno$, 5) + ".SLP") = 0 THEN
    elvmn = 0
    elvmx = 0
    bountyfl = 1
    ELSE
    elvmn = VAL(LEFT$(RMELEV$, 2))
    elvmx = VAL(RIGHT$(RMELEV$, 2))
END IF
RMELEV$ = ""
IF bool% = 1 THEN
    FOR aaa = 1 TO 4
        enemyat(AAA) = randnum(0, 100)
        IF enemyat(aaa) > 75 THEN
            enemyat(AAA) = randnum(elvmn, elvmx)
            ELSE
            enemyat(AAA) = 0
        END IF
    NEXT
END IF
FOR aaa = 1 TO 4
    enemieshere = enemieshere + enemyat(AAA)
NEXT
IF enemieshere > 0 THEN
    SetTextPos 12, 20
    ColorForeground = 2
    show "There are enemies here in the following directions: ;"
    FOR aaa = 1 TO 4
        IF enemyat(aaa) > 0 THEN
            ColorForeground = enemyat(AAA)
            IF ColorForeground > 5 THEN ColorForeground = ColorForeground + 3
            SELECT CASE aaa
                CASE 1: show "N ;"
                    CASE 2: show "S ;"
                    CASE 3: show "E ;"
                    CASE 4: show "W"
            END SELECT
            ELSE
            show "  ;"
        END IF
    NEXT
    ELSE
    SetTextPos 12, 20
    show STRING$(59, " ")
    IF bountyfl = 1 THEN
        SetTextPos 12, 25
        ColorForeground = 11
        show ">> There are other (P)layers in this area! <<"
    END IF
END IF
OPEN "data\CURLOC.ANS" FOR OUTPUT AS #11
LINE INPUT #10, xe$
DO
    PRINT #11, xe$
    LINE INPUT #10, xe$
LOOP UNTIL xe$ = "/"
CLOSE #11
AnsiDraw "data\CURLOC.ANS"
FOR disl = 14 TO 22
    LINE INPUT #10, xe$
    IF xe$ = "/" OR xe$ = "+g" THEN
        FOR i = disl TO 22
            SetTextPos i, 1
            IF bool% > 0 THEN mshow ""
        NEXT
        DISL = 22
        ELSE
        SetTextPos disl, 1
        IF bool% > 0 THEN mshow xe$
    END IF
NEXT
IF xe$ = "+g" THEN
    LINE INPUT #10, itm$
    IF LEFT$(itm$, 1) = "i" THEN
        IF inven(VAL(RIGHT$(itm$, 2))) = 1 THEN
            LINE INPUT #10, itm$
            ELSE
            LINE INPUT #10, dumbo$
            LINE INPUT #10, itm$
        END IF
        IF inven(VAL(itm$)) = 1 OR itm$ = "00" THEN
            SetTextPos 11, 1
            mshow ""
            ELSE
            SetTextPos 11, 1
            mshow "|15***  You can (G)et the following item here: " + ItemName$(VAL(itm$)) + "  ***"
        END IF
        ELSE
        IF inven(VAL(itm$)) = 1 THEN
            SetTextPos 11, 1
            mshow ""
            ELSE
            SetTextPos 11, 1
            mshow "|15***  You can (G)et the following item here: " + ItemName$(VAL(itm$)) + "  ***"
        END IF
    END IF
    ELSE
    SetTextPos 11, 1
    mshow ""
END IF
CLOSE #10
END SUB

SUB DoBattle (direc%) STATIC
iswyrdwad% = 0
DIM listing(1 TO 47), esp(1 TO 10)
pweap$ = ItemName$(peqp(1))
ErrMessage "|12*BATTLE!*"
AnsiDraw "data\BATTLE.ANS"
SetTextPos 14, 2
show STRING$(8, " ")
IF isboss > 100 THEN
    SELECT CASE psex$
        CASE "M":
            oppord$ = "him"
            oppor2$ = "he"
            oppor3$ = "his"
            CASE "F":
            oppord$ = "her"
            oppor2$ = "she"
            oppor3$ = "her"
            CASE ELSE:
            oppord$ = "it"
            oppor2$ = "it"
            oppor3$ = "its"
    END SELECT
    playernum$ = LTRIM$(STR$(DIREC%))
    NewsReport "MAIL" + playernum$ + ".ML", "|12" + phandle$ + " has attacked you in your sleep!"
    OPEN "data\USER" + playernum$ FOR INPUT AS #30
    LINE INPUT #30, ename$
    IF ename$ = "Wyrdwad" THEN iswyrdwad% = 1
    IF ename$ = "Bugen" THEN iswyrdwad% = 2
    IF ename$ = "Brandchan" THEN iswyrdwad% = 3
    LINE INPUT #30, roomtokill$
    FOR s = 1 TO 3
        LINE INPUT #30, crap$
    NEXT
    IF VAL(LTRIM$(RTRIM$(crap$))) >= 1000 THEN eimmortal% = 1 ELSE eimmortal% = 0
    LINE INPUT #30, crap$
    crap$ = ""
    LINE INPUT #30, emagst$
    FOR s = 1 TO 3
        esp(S) = ASC(MID$(EMAGST$, S, 1)) - 1
    NEXT
    FOR s = 7 TO 9
        esp(S) = ASC(MID$(EMAGST$, S + 1, 1)) - 1
    NEXT
    esp(4) = ASC(MID$(EMAGST$, 14, 1)) - 1
    esp(5) = ASC(MID$(EMAGST$, 4, 1)) - 1
    esp(6) = ASC(MID$(EMAGST$, 7, 1)) - 1
    esp(10) = ASC(MID$(EMAGST$, 22, 1)) - 1
    INPUT #30, dumy, minexp, dumy, dumy, ehp, dumy, dumy, eevd, dumy, ewpnumb
    INPUT #30, dumy, emindmg, emaxdmg, edef, ewpwk, earmstr, earmwk, ebase, dumy
    LINE INPUT #30, esex$
    INPUT #30, dumy
    DUMY = 0
    eweap$ = ItemName$(EWPNUMB)
    ehmax = EHP
    EMINDMG = EMINDMG + EBASE
    EMAXDMG = EMAXDMG + EBASE
    MINEXP = MINEXP * 40
    maxexp = MINEXP * 2
    maxgold = MINEXP
    mingold = MINEXP
    CLOSE #30
ELSE
    eimmortal% = 0
    IF direc% < 50 THEN
        a$ = LTRIM$(STR$(enemyat(DIREC%)))
        IF LEN(a$) < 2 THEN a$ = "0" + a$
        OPEN "data\ENEMIES.L" + a$ FOR INPUT AS #87
        enmnum = randnum(0, 9)
        ELSE
        a$ = LTRIM$(STR$(enemyat(1)))
        IF LEN(a$) < 2 THEN a$ = "0" + a$
        OPEN "data\ENEMIES.L" + a$ FOR INPUT AS #87
        enmnum = enemyat(2) - 1
        enemyat(1) = 0
        enemyat(2) = 0
    END IF
    INPUT #87, minexp, maxexp, mingold, maxgold
    FOR i = 1 TO enmnum
        FOR j = 1 TO 3
            LINE INPUT #87, dummy$
        NEXT
    NEXT
    LINE INPUT #87, ename$
    LINE INPUT #87, eweap$
    INPUT #87, ehp, emindmg, emaxdmg, ewpwk, edef, eevd, earmstr, earmwk
    ehmax = EHP
    FOR i = 1 TO 10
        INPUT #87, esp(i)
    NEXT
    CLOSE #87
END IF
ColorForeground = 13
SetTextPos 14, 52
show ename$
SetTextPos 18, 24
ColorForeground = 14
show "You are approached by " + ename$ + "!"
runf = 0
elife = 0
pasbak = parmstr
pawbak = parmwk
pwwbak = pwpwk
pevbak = pevd
pbasebak = pbase
pdefbak = pdef
pmindbak = pmindmg
pmaxdbak = pmaxdmg
tempsharpn = 0
cataflag = 0
ehadenough = 0
DO
    FOR i = 1 TO 47
        listing(I) = 0
    NEXT
    pwpwk = pwwbak
    parmstr = pasbak
    parmwk = pawbak
    ehps$ = LTRIM$(STR$(EHP))
    ehpm$ = LTRIM$(STR$(ehmax))
    FOR i = 1 TO 2
        IF LEN(ehps$) < 3 THEN ehps$ = "0" + ehps$
        IF LEN(ehpm$) < 3 THEN ehpm$ = "0" + ehpm$
    NEXT
    SetTextPos 15, 62
    IF ehp <= (ehmax \ 10) THEN
        ColorForeground = 2
        show ehps$ + ";"
        ColorForeground = 10
        show "/" + ehpm$
        ELSE
        ColorForeground = 10
        show ehps$ + "/" + ehpm$
    END IF
    Healthometer 16, 62, 73
    Healthometer 1, 61, 74
    r$ = ""
    getone
    SELECT CASE r$
        CASE "a", "":
            SetTextPos 18, 24
            bshow 1, "|10You attack with " + ItemName$(peqp(1)) + "!"
            pp! = 1 - (edef / 100)
            IF tempsharpn = 0 THEN
                dm = INT((randnum(pmindmg, pmaxdmg) + pbase) * pp!)
                ELSE
                dm = INT((pmaxdmg + pbase) * pp!)
            END IF
            IF pwpwk = 6 THEN pwpwk = randnum(0, 5)
            IF pwpwk = 5 THEN
                IF earmstr > 0 THEN dm = dm \ 5
                IF earmwk > 0 THEN dm = INT(dm * 2.5)
                ELSEIF pwpwk > 0 AND pwpwk < 5 THEN
                IF pwpwk = earmwk THEN dm = dm * 2
                IF pwpwk = earmstr THEN dm = dm \ 5
            END IF
            IF randnum(1, 100) <= eevd THEN dm = 0
            IF dm > 0 THEN
                bshow 1, "|15 " + STR$(dm) + " damage!"
                EHP = EHP - dm
                ELSE
                bshow 1, "|07  Miss!"
            END IF
            CASE "m":
            indno = 1
            FOR i = 1 TO 23
                IF magic(i) > 0 THEN
                    GetItemInfo i, 1, "magic.eff"
                    IF selection > 0 THEN
                        listing(indno) = I
                        indno = indno + 1
                    END IF
                END IF
            NEXT
            IF listing(1) > 0 THEN
                SetTextPos 14, 4
                bshow 0, "|12Magic"
                indno = 1
                DO
                    SetTextPos 15, 4
                    indbak = indno - 1
                    FOR i = 1 TO 6
                        IF listing(indno) > 0 THEN
                            bshow 0, "|04 " + LTRIM$(STR$(i)) + ") " + SpellName$(listing(indno))
                            ELSE
                            bshow 0, ""
                        END IF
                        indno = indno + 1
                        IF indno > 23 THEN indno = 23
                    NEXT
                    SetTextPos 21, 4
                    IF indno = 7 AND listing(indno) = 0 THEN bshow 0, "|12       (0)Cancel" ELSE bshow 0, "|12(M)ore (0)Cancel"
                    DO
                        r$ = ""
                        getone
                    LOOP UNTIL r$ >= "1" AND r$ <= "6" OR r$ = "0" OR r$ = "m"
                    IF r$ = "m" THEN
                        IF listing(indno) = 0 THEN indno = 1
                    ELSE
                        IF r$ <> "0" THEN
                            IF listing(indbak + VAL(r$)) = 0 THEN indno = 1: r$ = "m"
                        END IF
                    END IF
                LOOP UNTIL r$ <> "m"
                IF r$ <> "0" THEN
                    castmagno = listing(indbak + VAL(r$))
                    magneeded = VAL(SpellCost$(castmagno))
                    GetItemInfo castmagno, 1, "magic.eff"
                    themagic = selection
                    uflag = 0
                    IF pmp >= magneeded THEN
                        pmp = pmp - magneeded
                        DoEffect themagic, VAL(ustring$), 1
                        IF uflag = 1999 THEN ehp = 1 ELSE ehp = ehp - uflag
                        SetTextPos 18, 24
                        bshow 1, "You cast the spell of " + SpellName$(castmagno) + "!"
                        bshow 1, "|15  " + ustring$
                        IF selection > 0 THEN
                            pevbak = pevbak + selection
                            pevd = pevd + selection
                            ELSEIF selection = -99 THEN
                            tempsharpn = 1
                        END IF
                        ELSE
                        selection = 0
                        SetTextPos 18, 24
                        bshow 1, "|13Not enough MP to cast that spell!"
                        FOR k = 1 TO 3
                            bshow 1, ""
                        NEXT
                        r$ = "*"
                    END IF
                    ELSE
                    r$ = "*"
                END IF
                ELSE
                SetTextPos 18, 24
                bshow 1, "|13Don't know any battle spells!"
                FOR k = 1 TO 3
                    bshow 1, ""
                NEXT
                r$ = "*"
            END IF
            SetTextPos 14, 4
            FOR i = 1 TO 8
                bshow 0, ""
            NEXT
            SetTextPos 20, 24
            CASE "i":
            indno = 1
            FOR i = 1 TO 47
                IF inven(i) > 0 THEN
                    GetItemInfo i, 1, "item.eff"
                    IF selection > 0 THEN
                        listing(indno) = I
                        indno = indno + 1
                    END IF
                END IF
            NEXT
            IF listing(1) > 0 THEN
                SetTextPos 14, 4
                bshow 0, "|12Items"
                indno = 1
                DO
                    SetTextPos 15, 4
                    indbak = indno - 1
                    FOR i = 1 TO 6
                        IF listing(indno) > 0 THEN
                            bshow 0, "|04 " + LTRIM$(STR$(i)) + ") " + ItemName$(listing(indno))
                            ELSE
                            bshow 0, ""
                        END IF
                        indno = indno + 1
                        IF indno > 47 THEN indno = 47
                    NEXT
                    SetTextPos 21, 4
                    IF indno = 7 AND listing(indno) = 0 THEN bshow 0, "|12       (0)Cancel" ELSE bshow 0, "|12(M)ore (0)Cancel"
                    DO
                        r$ = ""
                        getone
                    LOOP UNTIL r$ >= "1" AND r$ <= "6" OR r$ = "0" OR r$ = "m"
                    IF r$ = "m" THEN
                        IF listing(indno) = 0 THEN indno = 1
                    ELSE
                        IF r$ <> "0" THEN
                            IF listing(indbak + VAL(r$)) = 0 THEN indno = 1: r$ = "m"
                        END IF
                    END IF
                LOOP UNTIL r$ <> "m"
                IF r$ <> "0" THEN
                    useitemno = listing(indbak + VAL(r$))
                    GetItemInfo useitemno, 1, "item.eff"
                    theitemu = selection
                    uflag = 0
                    inven(useitemno) = inven(useitemno) - iga
                    IF useitemno = 4 THEN
                        a = pmindmg
                        b = pmaxdmg
                        pmindmg = pmindbak
                        pmaxdmg = pmaxdbak
                    END IF
                    pmindmg = pmindbak
                    DoEffect theitemu, VAL(ustring$), 1
                    IF theitemu = 33 THEN
                        IF eimmortal% = 0 THEN
                            ehp = 0
                            elife = 0
                        ELSE
                            ustring$ = "But, your opponent is immune to its effects!"
                        END IF
                    END IF
                    IF useitemno = 4 THEN
                        pmindbak = pmindmg
                        pmaxdbak = pmaxdmg
                        pmindmg = b
                        pmaxdmg = b
                    END IF
                    IF uflag = 1999 THEN ehp = 1 ELSE ehp = ehp - uflag
                    SetTextPos 18, 24
                    bshow 1, "** Used " + ItemName$(useitemno) + "! **"
                    bshow 1, "|15  " + ustring$
                    IF selection > 0 THEN
                        pevbak = pevbak + selection
                        pevd = pevd + selection
                        ELSEIF selection = -99 THEN
                        tempsharpn = 1
                    END IF
                    ELSE
                    r$ = "*"
                END IF
                ELSE
                SetTextPos 18, 24
                bshow 1, "|13Don't own any battle items!"
                FOR k = 1 TO 3
                    bshow 1, ""
                NEXT
                r$ = "*"
            END IF
            SetTextPos 14, 4
            FOR i = 1 TO 8
                bshow 0, ""
            NEXT
            SetTextPos 20, 24
            CASE "r":
            IF (randnum(1, 100) < 51) AND (isboss <> 1) THEN
                runf = 1
                ELSEIF isboss = 1 THEN
                SetTextPos 18, 24
                bshow 1, "|10You attempt a retreat..."
                bshow 1, "|12  ...but you can't run from bosses!"
                ELSE
                SetTextPos 18, 24
                bshow 1, "|10You attempt a retreat..."
                bshow 1, "|12  ...and fail!"
            END IF
            CASE ELSE:
            r$ = "*"
    END SELECT
    IF runf = 0 AND ehp > 0 AND r$ <> "*" THEN
        eelem = 0
        eatchoice = -1
        DO
            ebatplan = randnum(0, 10)
            IF ebatplan > 0 THEN
                IF esp(ebatplan) > 0 THEN
                    IF (ebatplan = 7 AND elife = 0 AND ehadenough < 3) OR (ebatplan = 6 AND cataflag = 0) OR (ebatplan <> 7 AND ebatplan <> 6) THEN eatchoice = ebatplan
                END IF
                ELSE
                eatchoice = 0
            END IF
        LOOP UNTIL eatchoice >= 0
        SELECT CASE eatchoice
            CASE 0:
                IF eimmortal% = 1 AND turnsleft < 1000 THEN
                    bshow 1, "|12" + ename$ + " holds aloft the Vulteria Godbook."
                    bshow 1, "|04  Its power overcomes you instantly."
                    php = -9999
                    plife = 0
                ELSE
                    bshow 1, "|10" + ename$ + " attacks with " + eweap$ + "!"
                    eelem = EWPWK
                    IF eelem = 6 THEN eelem = randnum(1, 4)
                END IF
            CASE 1:
                bshow 1, "|10" + ename$ + " conjures Fire!"
                eelem = 1
            CASE 2:
                bshow 1, "|10" + ename$ + " conjures Ice!"
                eelem = 2
            CASE 3:
                bshow 1, "|10" + ename$ + " conjures Lightning!"
                eelem = 3
            CASE 4:
                bshow 1, "|10" + ename$ + " shakes the earth!"
                eelem = 4
            CASE 5:
                bshow 1, "|10" + ename$ + " casts 'Plasma'!"
                eelem = 5
            CASE 6:
                bshow 1, "|10" + ename$ + " summons a powerful Cataclysm!"
                cataflag = 1
            CASE 7:
                bshow 1, "|10" + ename$ + " casts 'Life'!"
                elife = 1
                ehadenough = ehadenough + 1
                bshow 1, "|13  " + ename$ + " is now protected."
            CASE 8:
                bshow 1, "|10" + ename$ + " casts 'Cure1'!"
                EHP = EHP + 50
                IF ehp > ehmax THEN ehp = ehmax
                bshow 1, "|15  Recovered 50 HP."
            CASE 9:
                bshow 1, "|10" + ename$ + " casts 'Cure2'!"
                EHP = EHP + 350
                IF ehp > ehmax THEN ehp = ehmax
                bshow 1, "|15  Recovered 350 HP."
            CASE 10:
                bshow 1, "|10" + ename$ + " casts 'Speed'!"
                EEVD = EEVD + 5
                IF eevd > 90 THEN eevd = 90
                bshow 1, "|15  Attack evasion up by 5%."
        END SELECT
        pp! = 1 - (pdef / 100)
        IF eatchoice = 6 THEN
            dm = INT((randnum(50, 150) * pp!) * 4)
        ELSEIF eatchoice > 6 THEN
            dm = 0
        ELSE
            dm = randnum(EMINDMG, EMAXDMG)
            IF eatchoice > 0 THEN dm = dm + (dm \ 4)
            dm = INT(dm * pp!)
            IF eelem = 6 THEN eelem = randnum(0, 5)
            IF parmstr = 6 THEN parmstr = randnum(0, 5)
            IF parmwk = 6 THEN parmwk = randnum(0, 5)
            IF eelem = 5 THEN
                IF parmwk > 0 THEN dm = dm * 4
                IF parmstr > 0 THEN dm = dm \ 6
                ELSE
                IF (parmwk = eelem OR parmwk = 5) AND eelem > 0 THEN dm = dm * 2
                IF (parmstr = eelem OR parmstr = 5) AND eelem > 0 THEN dm = 0
            END IF
        END IF
        IF randnum(1, 100) <= pevd THEN dm = 0
        IF eatchoice <= 6 THEN
            IF dm > 0 THEN
                IF dm >= php THEN
                    IF plife > 0 THEN
                        plife = 0
                        php = phmax
                        bshow 1, "|13  But, your Life spell has taken effect!"
                    ELSE
                        IF turnsleft = 1000 AND eimmortal% = 0 THEN
                            php = phmax
                            bshow 1, "|14  But, the Godbook has healed your wounds!"
                        ELSE
                            IF php > -9999 THEN bshow 1, "|04 " + STR$(dm) + " damage!"
                            php = 0
                        END IF
                    END IF
                ELSE
                    bshow 1, "|15 " + STR$(dm) + " damage!"
                    php = php - dm
                END IF
            ELSE
                bshow 1, "|07  Miss!"
            END IF
        END IF
        ELSEIF ehp < 1 THEN
        IF elife > 0 THEN
            elife = 0
            bshow 1, "|14" + ename$ + "'s Life spell took effect."
            bshow 1, "|13  " + ename$ + " has been revived!"
            ehp = ehmax
        ELSEIF eimmortal% = 1 AND turnsleft < 1000 THEN
            bshow 1, "|13" + ename$ + " possesses the Vulteria Godbook!"
            bshow 1, "|05  " + ename$ + " has been revived!"
            ehp = ehmax
        ELSE
            bshow 1, "|12You have killed " + ename$ + "!"
            bshow 1, "|02  <press any key>"
            getone
            r$ = ""
        END IF
    END IF
LOOP UNTIL php < 1 OR ehp < 1 OR runf = 1
ERASE esp
IF pmindmg < pmindbak THEN pmindmg = pmindbak
pwpwk = pwwbak
parmstr = pasbak
parmwk = pawbak
pmaxdmg = pmaxdbak
pbase = pbasebak
pdef = pdefbak
plife = 0
pevd = pevbak
IF php < 1 THEN
    IF isboss > 100 THEN
        NewsReport "MAIL" + playernum$ + ".ML", "|14But, you flicked " + oppord$ + " away like a pesky gnat."
        NewsReport "MAIL" + playernum$ + ".ML", "%p"
        NewsReport "NEWS.TDY", "|12" + phandle$ + " attacked " + ename$ + ", and was brutally slaughtered!"
        ELSE
        NewsReport "NEWS.TDY", "|12" + phandle$ + " was killed in battle by " + ename$ + "!"
    END IF
    ERASE listing
    SetTextPos 14, 4
    bshow 0, "|12 You've been killed"
    bshow 0, ""
    bshow 0, "|07  Exp down by 1/10"
    bshow 0, "|07  Gold down by 1/2"
    bshow 0, ""
    bshow 0, "|10  <press any key>"
    getone
    YouDied
END IF
IF isboss = 1 THEN ustring$ = ename$
IF isboss = 0 THEN enemyat(direc%) = 0
IF runf = 1 THEN
    IF isboss > 100 THEN
        NewsReport "MAIL" + playernum$ + ".ML", "|11But, " + oppor2$ + " ran away like a frightened cat."
        NewsReport "MAIL" + playernum$ + ".ML", "%p"
        NewsReport "NEWS.TDY", "|10" + phandle$ + " attacked " + ename$ + ", but feared for " + oppor3$ + " life and ran!"
    END IF
    ErrMessage "You just barely got away..."
    ELSE
    expw = randnum(MINEXP, maxexp)
    gpw = randnum(mingold, maxgold)
    SetTextPos 14, 1
    mshow "|15VICTORY!!"
    mshow "Experience increased by" + STR$(expw) + " points!"
    pexp = pexp + expw
    IF pexp > 25480 THEN pexp = 25480
    mshow "Found" + STR$(gpw) + " gold!"
    pgold = pgold + gpw
    IF pgold > 30000 THEN pgold = 30000
    pincr = 0
    hpincr = 0
    mpincr = 0
    DO
        IF pexp >= pexneed THEN
            plvl = plvl + 1
            pexneed = pexneed + ((plvl + 1) * 20)
            hpincr = hpincr + 20
            mpincr = mpincr + 5
            IF (plvl / 2) = (plvl \ 2) THEN pincr = pincr + 1
        END IF
    LOOP UNTIL pexp < pexneed
    IF hpincr > 0 THEN
        phmax = phmax + hpincr
        IF phmax > 999 THEN phmax = 999
        php = phmax
        pmmax = pmmax + mpincr
        IF pmmax > 99 THEN pmmax = 99
        pmp = pmmax
        pbase = pbase + pincr
        mshow ""
        mshow "|11Level-Up!"
        mshow "|14Your skill level has been raised to" + STR$(plvl) + "!"
        c$ = "|13HP up by" + STR$(hpincr) + ", MP up by" + STR$(mpincr)
        IF pincr > 0 THEN c$ = c$ + ", base strength up by" + STR$(pincr)
        c$ = c$ + "!"
        mshow c$
        c$ = ""
    END IF
    IF iswyrdwad% = 1 AND inven(43) = 0 THEN
        mshow ""
        mshow "|03A Debug Kit fell from the folds of Wyrdwad's clothes."
        mshow "|09You have acquired a Debug Kit."
        inven(43) = 1
    END IF
    IF iswyrdwad% = 2 AND inven(47) = 0 THEN
        mshow ""
        mshow "|03A Vial of Elixir fell from the folds of Bugen's clothes."
        mshow "|09You have acquired a Vial of Elixir."
        inven(47) = 1
    END IF
    IF iswyrdwad% = 3 AND inven(46) = 0 THEN
        mshow ""
        mshow "|03An Enchanted Coffer fell from the folds of Brandchan's clothes."
        mshow "|09You have acquired an Enchanted Coffer."
        inven(46) = 1
    END IF
    ty = cyp%
    FOR i = ty TO 22
        SetTextPos i, 1
        mshow ""
    NEXT
    IF isboss > 100 THEN
        NewsReport "MAIL" + playernum$ + ".ML", "|04And you were, unfortunately, defeated."
        NewsReport "MAIL" + playernum$ + ".ML", "|04You lost 1/10 of your experience, 1/2 of your gold, and have been returned"
        NewsReport "MAIL" + playernum$ + ".ML", "|04to the shrine. You swear that revenge will one day be yours!"
        NewsReport "MAIL" + playernum$ + ".ML", "%p"
        NewsReport "NEWS.TDY", "|12" + phandle$ + " attacked and killed " + ename$ + "!"
        RemoveFromFile LEFT$(roomtokill$, 5) + ".SLP", ename$
        ResaveAsDead direc%
    END IF
END IF
IF isboss > 100 THEN
    playernum$ = ""
    oppord$ = ""
    oppor2$ = ""
    oppor3$ = ""
END IF
isboss = 0
SaveUserData
Healthometer 1, 61, 74
r$ = ""
DisplayRoom 0
ERASE listing
END SUB

SUB DoEffect (efno%, efparam%, ruib%) STATIC
selection = 0
SELECT CASE efno%
    CASE 1:
        OPEN "data\NEWS.TDY" FOR INPUT AS #88
        LINE INPUT #88, Rdate$
        clss
        SetTextPos 1, 1
        mshow "|15** VULTERIAN NEWS LOG FOR " + DATE$ + " **"
        todayest = 1
        linectr = 1
        SetTextPos 3, 1
        DO
            DO
                IF NOT EOF(88) THEN
                    LINE INPUT #88, tddt$
                    mshow tddt$
                    linectr = linectr + 1
                    ELSE
                    cyp% = 20
                END IF
            LOOP UNTIL cyp% = 20
            SetTextPos 21, 1
            IF todayest = 1 THEN bb$ = "(Y)esterday" ELSE bb$ = "(T)oday"
            IF NOT EOF(88) THEN mshow "|15(M)ore (Q)uit " + bb$ ELSE mshow "|15(Q)uit " + bb$
            bb$ = ""
            DO
                getone
            LOOP UNTIL (r$ = "m" AND NOT EOF(88)) OR (r$ = "t" AND todayest = 0) OR (r$ = "y" AND todayest = 1) OR r$ = "q"
            SELECT CASE r$
                CASE "t":
                    todayest = 1
                    CLOSE #88
                    OPEN "data\NEWS.TDY" FOR INPUT AS #88
                    INPUT #88, Rdate$
                    r$ = "m"
                    CASE "y":
                    todayest = 0
                    CLOSE #88
                    OPEN "data\NEWS.YST" FOR INPUT AS #88
                    INPUT #88, Rdate$
                    r$ = "m"
            END SELECT
            IF r$ = "m" THEN
                clss
                SetTextPos 1, 1
                mshow "|15** VULTERIAN NEWS LOG FOR " + Rdate$ + " **"
                linectr = 1
                SetTextPos 3, 1
            END IF
        LOOP UNTIL r$ = "q"
        CLOSE #88
        ustring$ = "You pocket the news log."
        r$ = ""
        CASE 2:
        'show map
        curmans = worldno
        r$ = ""
        DO
            SELECT CASE curmans
                CASE 1: AnsiDraw "data\MAP-EAGL.ANS"
                    CASE 2: AnsiDraw "data\MAP-DELI.ANS"
                    CASE 3: AnsiDraw "data\MAP-PHOR.ANS"
                    CASE 5: AnsiDraw "data\MAP-SHAG.ANS"
                    CASE ELSE: curmans = 0: AnsiDraw "data\MAP-FULL.ANS"
            END SELECT
            ffg = 0
            DO
                getone
                SELECT CASE r$
                    CASE "e":
                        IF curmans <> 1 THEN
                            curmans = 1
                            ffg = 1
                        END IF
                        CASE "d":
                        IF curmans <> 2 THEN
                            curmans = 2
                            ffg = 1
                        END IF
                        CASE "p":
                        IF curmans <> 3 THEN
                            curmans = 3
                            ffg = 1
                        END IF
                        CASE "s":
                        IF curmans <> 5 THEN
                            curmans = 5
                            ffg = 1
                        END IF
                        CASE "v":
                        IF curmans <> 0 THEN
                            curmans = 0
                            ffg = 1
                        END IF
                        CASE "q":
                        ffg = 1
                END SELECT
            LOOP UNTIL ffg = 1
        LOOP UNTIL r$ = "q"
        ustring$ = "You refold the map and pocket it."
        CASE 3:
        'sharpen weapon (unit)
        IF pmindmg = pmaxdmg THEN
            ustring$ = "Your weapon is already fully sharpened!"
            inven(4) = 1
            ELSE
            inven(peqp(1)) = inven(peqp(1)) + (pmaxdmg - pmindmg)
            pmindmg = pmaxdmg
            IF ruib% = 1 THEN
                ustring$ = "Your " + ItemName$(peqp(1)) + " has been fully sharpened!"
                ELSE
                ustring$ = "The machine sharpened your weapon to its maximum potential."
            END IF
        END IF
        CASE 4:
        'restore MP
        pmp = pmp + EFPARAM%
        IF pmp > pmmax THEN pmp = pmmax
        IF efparam% < 99 THEN
            ustring$ = "Magic points restored by" + STR$(EFPARAM%) + "."
            ELSE
            ustring$ = "Magic points fully restored."
        END IF
        CASE 5:
        'restore HP
        php = php + EFPARAM%
        IF php > phmax THEN php = phmax
        IF efparam% < 999 THEN
            ustring$ = "Health restored by" + STR$(EFPARAM%) + "."
            ELSE
            ustring$ = "Health fully restored."
        END IF
        CASE 6:
        SetTextPos 19, 1
        mshow ""
        ColorForeground = 7
        SetTextPos 19, 32
        show "Locate whom? ;"
        getx 12, 1, 0
        r$ = LTRIM$(RTRIM$(UCASE$(r$)))
        OPEN "data\USERS.HND" FOR INPUT AS #15
        wahoo = 0
        wahct = 0
        DO WHILE NOT EOF(15) AND wahoo = 0
            wahct = wahct + 1
            LINE INPUT #15, chkm$
            IF UCASE$(chkm$) = r$ THEN wahoo = 1
        LOOP
        CHKM$ = ""
        CLOSE #15
        IF wahoo = 0 THEN
            ustring$ = "No such person! Check the scores (L)ist for peoples' names."
            IF efparam% = 1 THEN
                inven(9) = 1
                ELSE
                inven(8) = 1
            END IF
            ELSE
            OPEN "data\USER" + LTRIM$(STR$(wahct)) FOR INPUT AS #15
            FOR i = 1 TO 2
                LINE INPUT #15, pplhr$
            NEXT
            CLOSE #15
            IF efparam% = 1 THEN
                rmbakpt$ = rmno$
                rmno$ = PPLHR$
                AnsiDraw "data\BOTCALPH.ANS"
                Healthometer 1, 61, 74
                worldno = 99
                DisplayRoom 0
                SetTextPos 14, 1
                mshow "That person is here, in " + RTRIM$(WorldName$(VAL(LEFT$(pplhr$, 1)))) + " " + MID$(pplhr$, 3, 3) + "."
                mshow ""
                mshow "<press any key to continue>"
                rmno$ = rmbakpt$
                rmbakpt$ = ""
                ustring$ = ""
                getone
                DisplayRoom 0
                ErrMessage "The video locator sparks and explodes."
                ustring$ = ""
                ELSE
                ustring$ = "That person is located in " + RTRIM$(WorldName$(VAL(LEFT$(PPLHR$, 1)))) + " " + MID$(PPLHR$, 3, 3) + "."
            END IF
        END IF
        PPLHR$ = ""
        r$ = ""
        'locate user, 0 = don't show location, 1 = show location
        CASE 7:
        SetTextPos 19, 1
        mshow ""
        ColorForeground = 7
        SetTextPos 19, 31
        show "Relocate whom? ;"
        getx 12, 1, 0
        OPEN "data\USERS.HND" FOR INPUT AS #15
        wahoo = 0
        wahct = 0
        DO WHILE NOT EOF(15) AND wahoo = 0
            wahct = wahct + 1
            LINE INPUT #15, chkm$
            IF UCASE$(chkm$) = LTRIM$(RTRIM$(UCASE$(r$))) THEN wahoo = 1
        LOOP
        CLOSE #15
        IF wahoo = 0 THEN
            ustring$ = "No such person! Check the scores (L)ist for peoples' names."
            inven(10) = 1
            ELSE
            AnsiDraw "data\BOTCALPH.ANS"
            Healthometer 1, 61, 74
            worldno = 99
            DisplayRoom 0
            BotherUser chkm$
            ustring$ = ""
        END IF
        CHKM$ = ""
        'fight user
        CASE 8:
        'rainbow tear effect
        pevd = pevd + 5
        IF pevd > 90 THEN pevd = 90
        FOR z = 1 TO 4
            magic(Z) = 2
        NEXT
        ustring$ = "You feel stronger, like you'll never forget how to cast attack spells..."
        CASE 9:
        'prismatic tear effect
        pevd = pevd + 5
        IF pevd > 90 THEN pevd = 90
        FOR z = 8 TO 11
            magic(Z) = 2
        NEXT
        ustring$ = "You feel refreshed, like you'll never forget how to cast healing magic..."
        CASE 10:
        'BotC effect
        pevd = pevd + 10
        IF pevd > 90 THEN pevd = 90
        ustring$ = "The Chameleon's blood reacts to your body and gives you greater evasiveness."
        CASE 11:
        'plasma effect in battle
        uflag = randnum(pmindmg, pmaxdmg) + pbase
        uflag = INT(uflag * (1 - (edef / 100)))
        IF earmwk > 0 THEN uflag = uflag * 4
        IF earmstr > 0 THEN uflag = uflag \ 6
        IF earmwk = 0 AND earmstr = 0 THEN uflag = INT(uflag * 2.5)
        IF uflag = 0 THEN
            ustring$ = "But the spell had no effect..."
            ELSE
            ustring$ = LTRIM$(STR$(uflag)) + " damage!"
        END IF
        CASE 12:
        uflag = randnum(pmindmg, pmaxdmg) + pbase
        uflag = uflag + (uflag \ 4)
        uflag = INT(uflag * (1 - (edef / 100)))
        IF earmwk = 1 THEN
            uflag = uflag * 2
            ELSEIF earmstr = 1 THEN
            uflag = 0
        END IF
        IF uflag = 0 THEN
            ustring$ = "But the spell had no effect..."
            ELSE
            ustring$ = LTRIM$(STR$(uflag)) + " damage!"
        END IF
        'fire effect in battle
        CASE 13:
        uflag = randnum(pmindmg, pmaxdmg) + pbase
        uflag = uflag + (uflag \ 4)
        uflag = INT(uflag * (1 - (edef / 100)))
        IF earmwk = 3 THEN
            uflag = uflag * 2
            ELSEIF earmstr = 3 THEN
            uflag = 0
        END IF
        IF uflag = 0 THEN
            ustring$ = "But the spell had no effect..."
            ELSE
            ustring$ = LTRIM$(STR$(uflag)) + " damage!"
        END IF
        'lightning effect in battle
        CASE 14:
        uflag = randnum(pmindmg, pmaxdmg) + pbase
        uflag = uflag + (uflag \ 4)
        uflag = INT(uflag * (1 - (edef / 100)))
        IF earmwk = 2 THEN
            uflag = uflag * 2
            ELSEIF earmstr = 2 THEN
            uflag = 0
        END IF
        IF uflag = 0 THEN
            ustring$ = "But the spell had no effect..."
            ELSE
            ustring$ = LTRIM$(STR$(uflag)) + " damage!"
        END IF
        'ice effect in battle
        CASE 15:
        IF isboss > 0 THEN
            IF iswyrdwad% <> 1 THEN
              uflag = 0
              ustring$ = "Didn't work!"
            ELSE
              uflag = 1999
              ustring$ = "Amazingly, it seems to have worked!"
            END IF
        ELSE
            uflag = 1999
            ustring$ = "The enemy seems a bit woozy..."
        END IF
        'reduce non-boss non-player HP to 1
        CASE 16:
        'return to last-visited temple
        rmno$ = shno$
        IF ruib% = 0 THEN
            ustring$ = "You blinked for just a moment, and here you are back at the shrine!"
            ELSE
            runf = 1
            ustring$ = "Retreating..."
        END IF
        CASE 17:
        FOR z = 1 TO 4
            enemyat(Z) = 0
        NEXT
        ustring$ = "There was a flash, and when the dust settled, no enemies were in sight."
        'kill all surrounding enemies
        CASE 18:
        FOR z = 1 TO 23
            IF magic(z) > 0 THEN magic(z) = 2
        NEXT
        ustring$ = "All of your spells are imprinted in your mind now: you will never forget them."
        'infinity tear effect
        CASE 19:
        plife = 1
        ustring$ = "You are now shielded from death."
        'life spell in battle
        CASE 20:
        IF rmno$ = "2-132-1" THEN
            rmno$ = "2-132-2"
            ustring$ = "The magnetic cane pulled the metal box from the tree. It opened when it fell."
            ELSE
            ustring$ = "You hold the magnetic cane in the air, but nothing happens."
        END IF
        'reverse-sleep sends you to 2-132-2 from 2-132-1 only.
        CASE 21:
        pbase = (pbase * 2) + pmindmg
        IF pbase > 300 THEN pbase = 300
        pdef = pdef \ 2
        ustring$ = "Strength doubled, defense halved!"
        'berserk spell in battle
        CASE 22:
        pdef = pdef * 2
        IF pdef > 80 THEN pdef = 80
        pmindmg = pmindmg \ 2
        pmaxdmg = pmaxdmg \ 2
        pbase = pbase \ 2
        IF pmaxdmg < 5 THEN pmaxdmg = 5
        ustring$ = "Defense doubled, strength halved!"
        'blur spell in battle
        CASE 23:
        uflag = randnum(50, 150)
        uflag = INT(uflag * (1 - (edef / 100)))
        uflag = uflag * 4
        ustring$ = LTRIM$(STR$(uflag)) + " damage!"
        'cataclysm spell in battle
        CASE 25:
        uflag = randnum(pmindmg, pmaxdmg) + pbase
        uflag = uflag + (uflag \ 3)
        uflag = INT(uflag * (1 - (edef / 100)))
        IF earmwk = 4 THEN
            uflag = uflag * 2
            ELSEIF earmstr = 4 THEN
            uflag = 0
        END IF
        phitminus = randnum(1, 7)
        IF parmstr = 4 THEN phitminus = 0
        IF parmwk = 4 THEN phitminus = phitminus * 2
        php = php - phitminus
        IF php < 1 THEN php = 1
        IF uflag = 0 THEN
            ustring$ = "Missed, but took" + STR$(phitminus) + " damage to yourself!"
            ELSE
            ustring$ = LTRIM$(STR$(uflag)) + " damage to the enemy," + STR$(phitminus) + " damage to you!"
        END IF
        'earthquake magic in battle
        CASE 26:
        shno$ = rmno$
        ustring$ = "The guru's voice echoes in your head. If you die, you will be revived here."
        'landmark magic, marks current location as a guru-temple
        CASE 27:
        'rmno$ = LTRIM$(STR$(EFPARAM%)) + "-001.LOC"
        'ustring$ = "You blinked for just a moment -- and now you're in a strange new land."
        ustring$ = "How did you get this? This is an unfinished item! You shouldn't have it!"
        'go to efparam%-001.LOC -- IGM-specific spells
        CASE 28:
        selection = EFPARAM%
        ustring$ = "Your evade% is raised by" + STR$(EFPARAM%) + "!"
        'evade + efparam%
        CASE 29:
        pevd = pevd + EFPARAM%
        ustring$ = "Attack evasion up by" + STR$(EFPARAM%) + "%!"
        'temp evade + efparam%
        CASE 30:
        'temp sharpen weapon in battle
        selection = -99
        ustring$ = ItemName$(peqp(1)) + "'s strength has been optimized!"
        CASE 31:
        'restore full HP and MP
        php = phmax
        pmp = pmmax
        mshow "|13All health and magic points have been restored."
        Healthometer 1, 61, 74
        CASE 32:
        php = phmax
        pmp = pmmax
        IF ruib% = 0 THEN
            ustring$ = "All health and magic points have been restored!"
            ELSE
            pevd = 90
            ustring$ = "HP and MP recovered, evasion at 90%!"
        END IF
        'special herb effect
        CASE 33:
        IF ruib% = 0 THEN
            IF turnsleft = 1000 THEN
                ustring$ = "You've already attained immortality from this tome."
            ELSE
                ustring$ = "The book makes you as a god. You are immortal now, with infinite turns."
                NewsReport "NEWS.TDY", "|31" + phandle$ + " has attained immortality!"
                   turnsleft = 1000
            END IF
        ELSE
            ustring$ = "The enemy has been smitten!"
        END IF
        'godbook effect
        CASE 57:
        IF ruib% = 0 THEN
            FOR runningout% = 2 TO 80
                IF runningout% <= 39 OR runningout% >= 46 AND runningout% <> 68 AND runningout% <> 48 THEN
                    CLS
                    COLOR 14, 0
                    PRINT "**DEBUG**"
                    PRINT
                    COLOR 10, 0
                    IF runningout% <> 6 THEN PRINT "Stock inventory with " + ItemName$(runningout%) + "? (Y/N)" ELSE PRINT "Stock inventory with Herb (Cair Delidia version)? (Y/N)"
                    DO
                        getone
                    LOOP UNTIL r$ = "y" OR r$ = "n"
                    IF r$ = "y" THEN inven(runningout%) = 1
                END IF
            NEXT
            FOR runningout% = 1 TO 23
                IF runningout% <= 17 OR runningout% >= 21 THEN
                    CLS
                    COLOR 14, 0
                    PRINT "**DEBUG**"
                    PRINT
                    COLOR 10, 0
                    PRINT "Permanently learn " + SpellName$(runningout%) + " magic? (Y/N)"
                    DO
                        getone
                    LOOP UNTIL r$ = "y" OR r$ = "n"
                    IF r$ = "y" THEN magic(runningout%) = 2
                END IF
            NEXT
            IF plvl < 50 THEN
            clss
            ccol 14, 0
            show "**DEBUG**"
            show ""
            ccol 10, 0
            show "Increase level to (" + LTRIM$(RTRIM$(STR$(plvl + 1))) + "-50): ;"
            getx 2, 2, 2
            targetlvl% = VAL(r$)
            IF targetlvl% > 50 THEN targetlvl% = 50
            pincr = 0
               hpincr = 0
            mpincr = 0
            IF targetlvl% > plvl THEN
                FOR runningout% = plvl + 1 TO targetlvl%
                    pexp = pexneed
                       plvl = plvl + 1
                       pexneed = pexneed + ((plvl + 1) * 20)
                    hpincr = hpincr + 20
                    mpincr = mpincr + 5
                    IF (plvl / 2) = (plvl \ 2) THEN pincr = pincr + 1
                NEXT
                IF hpincr > 0 THEN
                        phmax = phmax + hpincr
                        IF phmax > 999 THEN phmax = 999
                        php = phmax
                        pmmax = pmmax + mpincr
                        IF pmmax > 99 THEN pmmax = 99
                           pmp = pmmax
                        pbase = pbase + pincr
                END IF            
            END IF
            END IF
            clss
            ccol 14, 0
            show "**DEBUG**"
            show ""
            ccol 10, 0
            show "Set amount of gold on hand (0-30000): ;"
            getx 5, 2, 2
            IF VAL(r$) >= 0 AND VAL(r$) <= 30000 THEN pgold = VAL(r$) ELSE pgold = 30000
            ustring$ = "Debug alterations complete. Enjoy! (:"
            inven(43) = 0
            r$ = ""
        END IF
        'hero's medal (debug)
        CASE 58:
        php = phmax
        pmp = pmmax
        IF ruib% = 0 THEN
            ustring$ = "All health and magic points have been restored!"
        ELSE
            ustring$ = "HP and MP fully recovered!"
        END IF
        'vial of elixir
        CASE 59:
        SetTextPos 18, 1
        mshow ""
        SetTextPos 19, 1
        mshow ""
        CenterShow 18, "Gold on hand: " + LTRIM$(STR$(pgold)) + " (30000 max)         Gold in coffer: " + LTRIM$(STR$((inven(46) - 1) * 100)) + " (20000 max)", 13
        CenterShow 19, "(D)eposit   (W)ithdraw   (Q)uit", 5
        DO
            getone
        LOOP UNTIL r$ = "d" OR r$ = "w" OR r$ = "q"
        IF r$ = "q" THEN ustring$ = "You place the Enchanted Coffer back in your bag."
        IF r$ = "d" THEN
            IF pgold > 99 THEN
                SetTextPos 19, 1
                mshow ""
                ColorForeground = 7
                SetTextPos 19, 16
                IF pgold > 20000 THEN maxamount% = 20000 ELSE maxamount% = (pgold \ 100) * 100
                DO
                    IF ((inven(46) - 1) * 100) + maxamount% > 20000 THEN maxamount% = maxamount% - 100
                LOOP UNTIL ((inven(46) - 1) * 100) + maxamount% <= 20000
                show "Deposit amount (multiples of 100, max " + LTRIM$(STR$(maxamount%)) + "): ;"
                getx 5, 2, 2
                IF VAL(r$) > maxamount% THEN dutyfree% = maxamount% ELSE dutyfree% = VAL(r$)
                dutyfree% = (dutyfree% \ 100) * 100
                IF dutyfree% > 0 THEN
                    SetTextPos 19, 1
                    mshow ""
                    CenterShow 19, "OK to deposit " + LTRIM$(STR$(dutyfree%)) + " gold?   (Y)es   (N)o", 7
                    DO
                        getone
                    LOOP UNTIL r$ = "y" OR r$ = "n"
                    IF r$ = "y" THEN
                        inven(46) = inven(46) + (dutyfree% \ 100)
                        pgold = pgold - dutyfree%
                        ustring$ = "Deposited " + LTRIM$(STR$(dutyfree%)) + " gold into Enchanted Coffer."
                    ELSE
                        ustring$ = "No deposit was made."
                    END IF
                ELSE
                    ustring$ = "No deposit was made."
                END IF
            ELSE
                ustring$ = "You don't have enough money to deposit, you damned pauper!"
            END IF
            r$ = ""
        END IF
        IF r$ = "w" AND inven(46) > 1 THEN
            SetTextPos 19, 1
            mshow ""
            ColorForeground = 7
            SetTextPos 19, 15
            maxamount% = (inven(46) - 1) * 100
            IF maxamount% + pgold > 30000 THEN maxamount% = maxamount% - ((maxamount% + pgold) MOD 30000)
            maxamount% = (maxamount% \ 100) * 100
            IF maxamount% > 0 THEN
                show "Withdraw amount (multiples of 100, max " + LTRIM$(STR$(maxamount%)) + "): ;"
                    getx 5, 2, 2
                IF VAL(r$) > maxamount% THEN dutyfree% = maxamount% ELSE dutyfree% = VAL(r$)
                dutyfree% = (dutyfree% \ 100) * 100
                IF dutyfree% > 0 THEN
                    SetTextPos 19, 1
                    mshow ""
                    CenterShow 19, "OK to withdraw " + LTRIM$(STR$(dutyfree%)) + " gold?   (Y)es   (N)o", 7
                    DO
                        getone
                    LOOP UNTIL r$ = "y" OR r$ = "n"
                    IF r$ = "y" THEN
                        inven(46) = inven(46) - (dutyfree% \ 100)
                        pgold = pgold + dutyfree%
                        ustring$ = "Withdrew " + LTRIM$(STR$(dutyfree%)) + " gold from Enchanted Coffer. " + LTRIM$(STR$((inven(46) - 1) * 100)) + " gold remains."
                    ELSE
                        ustring$ = "No gold was withdrawn."
                    END IF
                ELSE
                    ustring$ = "No gold was withdrawn."
                END IF
            ELSE
                ustring$ = "Your pockets are already overflowing with gold. There's no room for any more!"
            END IF
            r$ = ""
        ELSEIF r$ = "w" AND inven(46) <= 1 THEN
            ustring$ = "Enchanted Coffer is currently empty!"
            r$ = ""
        END IF
        'enchanted coffer
END SELECT
END SUB

SUB endthis (putemasleep%) STATIC
CLOSE
ccol 7, 0
clss
SaveUserData
IF putemasleep% = 0 THEN
    OPEN "data\" + LEFT$(rmno$, 5) + ".SLP" FOR APPEND AS #30
    PRINT #30, phandle$
    CLOSE #30
END IF
ERASE inven, WorldName$, magic, peqp, enemyat
CLS: SYSTEM
END SUB

SUB ErrMessage (mesg$) STATIC
SetTextPos 14, 1: mshow mesg$
FOR i = 15 TO 22
    SetTextPos i, 1
    mshow ""
NEXT
END SUB

SUB FileUserInfo (pnombre%) STATIC
OPEN "data\USER" + LTRIM$(STR$(pnombre%)) FOR OUTPUT AS #30
PRINT #30, phandle$
IF LEN(rmno$) = 5 THEN PRINT #30, rmno$ ELSE PRINT #30, LEFT$(rmno$, 5) + "-1"
IF LEN(shno$) = 5 THEN PRINT #30, shno$ ELSE PRINT #30, LEFT$(shno$, 5) + "-1"
PRINT #30, DATE$
PRINT #30, turnsleft
invfull$ = ""
FOR i = 1 TO 80
    invfull$ = invfull$ + CHR$(inven(I) + 1)
NEXT
PRINT #30, invfull$
invfull$ = ""
FOR i = 1 TO 23
    invfull$ = invfull$ + CHR$(magic(I) + 1)
NEXT
PRINT #30, invfull$
invfull$ = ""
PRINT #30, pexp, plvl, php, pmp, phmax, pmmax, pgold, pevd, pexneed, peqp(1)
PRINT #30, peqp(2), pmindmg, pmaxdmg, pdef, pwpwk, parmstr, parmwk, pbase, pwins
PRINT #30, psex$
PRINT #30, pswing
PRINT #30, psexed
CLOSE #30
END SUB

FUNCTION GetFileLine$ (zfn$, lineno) STATIC
OPEN "data\" + zfn$ FOR INPUT AS #15
FOR i = 1 TO lineno - 1
    LINE INPUT #15, dummy$
NEXT
LINE INPUT #15, theitem$
CLOSE #15
GETFILELINE$ = THEITEM$
END FUNCTION

SUB GetItemInfo (itemno, fightb, ifnm$) STATIC
IF fightb = 1 THEN ino = itemno * 2 ELSE ino = itemno * 2 - 1
theitem$ = GetFileLine$(IFNM$, ino)
selection = VAL(LEFT$(theitem$, 2))
iga = VAL(MID$(theitem$, 3, 1))
ustring$ = MID$(theitem$, 4)
END SUB

SUB getone STATIC
SetTextPos 1, 1
Response$ = ""
DO
    'IF NoCarrier% = 1 THEN endthis 0
    'IN.PUT 1, 32767, 8, 0, 1, "", 8, 0, cyp%, cxp%, 0
    Response$ = INKEY$
LOOP UNTIL Response$ <> ""
IF Response$ = CHR$(27) THEN Response$ = "q"
IF Response$ = CHR$(13) THEN Response$ = ""
IF Response$ = CHR$(0) + CHR$(72) THEN Response$ = "8"
IF Response$ = CHR$(0) + CHR$(80) THEN Response$ = "2"
IF Response$ = CHR$(0) + CHR$(75) THEN Response$ = "4"
IF Response$ = CHR$(0) + CHR$(77) THEN Response$ = "6"
r$ = LCASE$(Response$)
END SUB

SUB getx (howmany%, texttype%, uppercaser%) STATIC
Response$ = STRING$(howmany%, " ")
cyp% = csrlin
cxp% = pos(0)
cursx% = cxp%
inson% = 0
hideon% = 1
COLOR 15, 0
curspos% = 1
DO
    LOCATE cyp%, cxp%
    IF uppercaser% = 1 AND hideon% = 1 THEN PRINT STRING$(LEN(RTRIM$(Response$)), "*") + STRING$(howmany% - LEN(RTRIM$(Response$)), " "); ELSE PRINT Response$;
    LOCATE cyp%, cursx%
    COLOR 15, 1
    IF hideon% = 0 OR uppercaser% <> 1 THEN PRINT MID$(Response$, curspos%, 1);
    IF uppercaser% = 1 AND hideon% = 1 THEN
        IF curspos% <= LEN(RTRIM$(Response$)) THEN PRINT "*"; ELSE PRINT " ";
    END IF
    COLOR 15, 0
    keyget$ = ""
    DO
        keyget$ = INKEY$
    LOOP UNTIL keyget$ <> ""
    SELECT CASE texttype%
        CASE 1:
            IF (keyget$ >= "A" AND keyget$ <= "Z") OR (keyget$ >= "a" AND keyget$ <= "z") OR keyget$ = " " THEN
                IF inson% = 1 THEN MID$(Response$, curspos% + 1) = MID$(Response$, curspos%): Response$ = LEFT$(Response$, howmany%)
                IF uppercaser% = 1 OR (uppercaser% = 0 AND curspos% = 1) THEN MID$(Response$, curspos%, 1) = UCASE$(keyget$) ELSE MID$(Response$, curspos%, 1) = keyget$
                IF curspos% < howmany% THEN curspos% = curspos% + 1: cursx% = cursx% + 1
            END IF
        CASE 2:
            IF keyget$ >= "0" AND keyget$ <= "9" THEN
                IF inson% = 1 THEN MID$(Response$, curspos% + 1) = MID$(Response$, curspos%): Response$ = LEFT$(Response$, howmany%)
                MID$(Response$, curspos%, 1) = keyget$
                IF curspos% < howmany% THEN curspos% = curspos% + 1: cursx% = cursx% + 1
            END IF
        CASE 3:
            IF keyget$ >= CHR$(32) AND keyget$ <= CHR$(254) THEN
                IF inson% = 1 THEN MID$(Response$, curspos% + 1) = MID$(Response$, curspos%): Response$ = LEFT$(Response$, howmany%)
                MID$(Response$, curspos%, 1) = keyget$
                IF curspos% < howmany% THEN curspos% = curspos% + 1: cursx% = cursx% + 1
            END IF
    END SELECT
    IF keyget$ = CHR$(8) AND curspos% > 1 THEN
        IF curspos% < howmany% OR (curspos% = howmany% AND MID$(Response$, curspos%, 1) = " ") THEN
            curspos% = curspos% - 1
            cursx% = cursx% - 1
        END IF
        MID$(Response$, curspos%, 1) = " "
        IF inson% = 1 AND curspos% < howmany% THEN MID$(Response$, curspos%) = MID$(Response$, curspos% + 1) + " "
    END IF
    IF keyget$ = CHR$(0) + CHR$(83) THEN MID$(Response$, curspos%) = MID$(Response$, curspos% + 1) + " "
    IF keyget$ = CHR$(9) THEN
        IF hideon% = 0 THEN hideon% = 1 ELSE hideon% = 0
    END IF
    IF keyget$ = CHR$(0) + CHR$(82) THEN
        IF inson% = 0 THEN inson% = 1 ELSE inson% = 0
    END IF
    IF keyget$ = CHR$(0) + CHR$(75) AND curspos% > 1 THEN
        curspos% = curspos% - 1
        cursx% = cursx% - 1
    END IF
    IF keyget$ = CHR$(0) + CHR$(77) AND curspos% < howmany% AND curspos% <= LEN(RTRIM$(Response$)) THEN
        curspos% = curspos% + 1
        cursx% = cursx% + 1
    END IF
LOOP UNTIL keyget$ = CHR$(13)
LOCATE cyp%, cxp%
COLOR 15, 0
IF hideon% = 1 AND uppercaser% = 1 THEN PRINT STRING$(LEN(Response$), "*"); ELSE PRINT Response$;
COLOR 7, 0
IF texttype% < 3 THEN r$ = LTRIM$(RTRIM$(Response$)) ELSE r$ = Response$
cyp% = cyp% + 1: cxp% = 1
IF cyp% > 23 THEN cyp% = 23
END SUB

SUB Healthometer (hoaty%, hoatx%, hoatx2%) STATIC
hpstr$ = LTRIM$(STR$(php))
hpmst$ = LTRIM$(STR$(phmax))
FOR n = 1 TO 2
    IF LEN(hpstr$) < 3 THEN hpstr$ = "0" + hpstr$
    IF LEN(hpmst$) < 3 THEN hpmst$ = "0" + hpmst$
NEXT
SetTextPos hoaty%, hoatx%
IF php <= (phmax \ 10) THEN
    ColorForeground = 2
    show hpstr$ + ";"
    ColorForeground = 10
    show "/" + hpmst$
    ELSE
    ColorForeground = 10
    show hpstr$ + "/" + hpmst$
END IF
hpstr$ = LTRIM$(STR$(pmp))
hpmst$ = LTRIM$(STR$(pmmax))
IF LEN(hpstr$) < 2 THEN hpstr$ = "0" + hpstr$
IF LEN(hpmst$) < 2 THEN hpmst$ = "0" + hpmst$
SetTextPos hoaty%, hoatx2%
IF pmp <= (pmmax \ 10) THEN
    ColorForeground = 2
    show hpstr$ + ";"
    ColorForeground = 10
    show "/" + hpmst$
    ELSE
    show hpstr$ + "/" + hpmst$
END IF
hpstr$ = ""
hpmst$ = ""
END SUB

SUB InventoryPopUp STATIC
uflag = 0
AnsiDraw "data\POP-ITEM.ANS"
DIM ilist(1 TO 20, 1 TO 4), pageon(2 TO 4), pageamt(1 TO 4), elename$(0 TO 6)
elename$(0) = "<nothing>"
elename$(1) = "fire"
elename$(2) = "ice/water"
elename$(3) = "lightning"
elename$(4) = "earth"
elename$(5) = "all elements"
elename$(6) = "random"
FOR i = 1 TO 20
    FOR j = 1 TO 4
        ilist(I, J) = 0
    NEXT
NEXT
FOR i = 2 TO 4
    pageon(I) = 0
NEXT
FOR i = 1 TO 4
    pageamt(I) = 0
NEXT
tempboolean = 0
curinum = 0
curpage = 1
indexpos = 1
DO
    curinum = curinum + 1
    IF inven(curinum) > 0 THEN
        pageamt(curpage) = pageamt(curpage) + 1
        IF indexpos = 1 AND curpage > 1 THEN pageon(curpage) = 1
        ilist(indexpos, curpage) = curinum
        indexpos = indexpos + 1
        IF indexpos > 20 THEN
            indexpos = 1
            curpage = curpage + 1
        END IF
    END IF
LOOP UNTIL curinum = 80
curpage = 0
IF pageon(2) = 0 THEN
    irow = 14
    icolumn = 48
    SetTextPos 15, 57
    ColorForeground = 7
    show STRING$(14, "Í")
END IF
DO
    dideqpf = 0
    curpage = curpage + 1
    IF curpage > 4 THEN curpage = 1
    IF curpage > 1 THEN
        IF pageon(curpage) = 0 THEN curpage = 1
    END IF
    FOR icolumn = 16 TO 48 STEP 32
        FOR irow = 5 TO 14
            IF icolumn = 48 THEN
                curinum = ilist(10 + (irow - 4), curpage)
                ELSE
                curinum = ilist(irow - 4, curpage)
            END IF
            IF curinum > 0 THEN
                SetTextPos irow, icolumn - 1
                show STRING$(25, " ")
                SetTextPos irow, icolumn
                ColorForeground = 7
                show ItemName$(curinum)
                IF curinum = peqp(1) OR curinum = peqp(2) THEN
                    SetTextPos irow, icolumn - 1
                    ColorForeground = 12
                    show "*"
                END IF
                ELSE
                SetTextPos irow, icolumn - 1
                show STRING$(25, " ")
            END IF
        NEXT
    NEXT
    bbbb$ = "Please choose one of the above commands (F,E,U,"
    IF pageon(2) = 1 THEN bbbb$ = bbbb$ + "M,"
    bbbb$ = bbbb$ + "Q)."
    changeflag = 0
    CenterShow 18, bbbb$, 15
    DO
        getone
        IF changeflag = 1 THEN
            SetTextPos 18, 1
            mshow " "
            SetTextPos 19, 1
            mshow " "
            changeflag = 0
        END IF
        SELECT CASE r$
            CASE "f":
                ColorForeground = 7
                I = NumericPrompt(19, 22, "Item number", 1, pageamt(curpage))
                IF i > 0 THEN
                    IF inven(ilist(i, curpage)) > 1 THEN
                        IF ilist(i, curpage) = 46 THEN
                            j$ = ItemName$(ilist(i, curpage)) + " (currently holding " + LTRIM$(STR$((inven(ilist(i, curpage)) - 1) * 100)) + " gold)"
                        ELSE
                            j$ = ItemName$(ilist(I, curpage)) + " +" + LTRIM$(STR$(inven(ilist(I, curpage)) - 1))
                           END IF
                    ELSE
                        j$ = ItemName$(ilist(I, curpage))
                    END IF
                    CenterShow 18, j$, 14
                    CenterShow 19, ItemDesc$(ilist(i, curpage)), 10
                    changeflag = 1
                END IF
                CASE "q":
                ustring$ = "You decide not to use any items right now."
                CASE "e":
                ColorForeground = 7
                I = NumericPrompt(19, 14, "Item number of weapon/armor", 1, pageamt(curpage))
                IF i > 0 THEN
                    GetItemInfo ilist(i, curpage), 0, "item.eff"
                    IF selection >= 0 THEN
                        CenterShow 18, "You can only equip weapons or armor!", 12
                        ELSEIF selection = -1 THEN
                        IF ilist(i, curpage) = peqp(1) THEN
                            CenterShow 18, "That weapon is already equipped!", 12
                            ELSE
                            AnsiDraw "data\EQP-WEPN.ANS"
                            GetItemInfo ilist(i, curpage), 1, "item.eff"
                            newmind = VAL(LEFT$(ustring$, 3)) + (inven(ilist(I, curpage)) - 1)
                            newmaxd = VAL(MID$(ustring$, 4, 3))
                            newelem = VAL(RIGHT$(ustring$, 1))
                            SetTextPos 1, 5
                            ColorForeground = 12
                            show ItemName$(ilist(i, curpage)) + " "
                            ColorForeground = 4
                            SetTextPos 2, 50
                            show STR$(newmind)
                            SetTextPos 3, 50
                            show STR$(newmaxd)
                            SetTextPos 4, 51
                            show elename$(newelem)
                            ColorForeground = 5
                            SetTextPos 8, 51
                            show ItemName$(peqp(1))
                            SetTextPos 9, 50
                            show STR$(pmindmg)
                            SetTextPos 10, 50
                            show STR$(pmaxdmg)
                            SetTextPos 11, 51
                            show elename$(pwpwk)
                            DO
                                getone
                            LOOP UNTIL r$ = "y" OR r$ = "n"
                            IF r$ = "y" THEN
                                peqp(1) = ilist(I, curpage)
                                pmindmg = newmind
                                pmaxdmg = newmaxd
                                pwpwk = newelem
                            END IF
                            dideqpf = 1
                        END IF
                        ELSEIF selection = -2 THEN
                        IF ilist(i, curpage) = peqp(2) THEN
                            CenterShow 18, "That armor is already equipped!", 12
                            ELSE
                            AnsiDraw "data\EQP-ARMR.ANS"
                            GetItemInfo ilist(i, curpage), 1, "item.eff"
                            newdef = VAL(LEFT$(ustring$, 2))
                            newstr = VAL(MID$(ustring$, 3, 1))
                            newwk = VAL(RIGHT$(ustring$, 1))
                            SetTextPos 1, 5
                            ColorForeground = 12
                            show ItemName$(ilist(i, curpage)) + " "
                            ColorForeground = 4
                            SetTextPos 2, 50
                            show STR$(newdef)
                            SetTextPos 3, 51
                            show elename$(newstr)
                            SetTextPos 4, 51
                            show elename$(newwk)
                            ColorForeground = 5
                            SetTextPos 8, 51
                            show ItemName$(peqp(2))
                            SetTextPos 9, 50
                            show STR$(pdef)
                            SetTextPos 10, 51
                            show elename$(parmstr)
                            SetTextPos 11, 51
                            show elename$(parmwk)
                            DO
                                getone
                            LOOP UNTIL r$ = "y" OR r$ = "n"
                            IF r$ = "y" THEN
                                peqp(2) = ilist(I, curpage)
                                pdef = newdef
                                parmstr = newstr
                                parmwk = newwk
                            END IF
                            dideqpf = 1
                        END IF
                    END IF
                    IF dideqpf = 1 THEN
                        AnsiDraw "data\POP-ITEM.ANS"
                        curpage = curpage - 1
                        IF pageon(2) = 0 THEN
                            irow = 13
                            icolumn = 48
                            SetTextPos 15, 57
                            ColorForeground = 7
                            show STRING$(14, CHR$(205))
                        END IF
                    END IF
                END IF
                CASE "u":
                ColorForeground = 7
                I = NumericPrompt(19, 22, "Item number", 1, pageamt(curpage))
                IF i > 0 THEN
                    GetItemInfo ilist(i, curpage), 0, "item.eff"
                    inven(ilist(I, curpage)) = inven(ilist(I, curpage)) - iga
                    iga = 0
                    IF selection < 0 THEN
                        ustring$ = "Weapons and armor can be equipped from the inventory screen."
                        ELSE
                        useitemu = selection
                        DoEffect useitemu, VAL(ustring$), 0
                    END IF
                    selection = 0
                    r$ = "q"
                END IF
        END SELECT
    LOOP UNTIL r$ = "q" OR (r$ = "m" AND pageon(2) = 1) OR dideqpf = 1
LOOP UNTIL r$ = "q"
r$ = ""
ERASE ilist, pageon, pageamt, elename$
END SUB

FUNCTION ItemDesc$ (itemno) STATIC
theitem$ = GetFileLine$("item.dsc", ITEMNO)
ITEMDESC$ = theitem$
END FUNCTION

FUNCTION ItemName$ (itemno) STATIC
theitem$ = GetFileLine$("item.lst", ITEMNO)
ITEMNAME$ = theitem$
END FUNCTION

SUB SetTextPos (cxp%, cyp%) STATIC
LOCATE cyp%, cxp%
END SUB

SUB LoadUserData STATIC
OPEN "data\USER" + LTRIM$(STR$(thisplayer)) FOR INPUT AS #30
LINE INPUT #30, phandle$
LINE INPUT #30, rmno$
LINE INPUT #30, shno$
LINE INPUT #30, ustring$
INPUT #30, turnsleft
LINE INPUT #30, invfull$
FOR i = 1 TO 80
    inven(I) = ASC(MID$(INVFULL$, I, 1)) - 1
NEXT
INVFULL$ = ""
LINE INPUT #30, invfull$
FOR i = 1 TO 23
    magic(I) = ASC(MID$(INVFULL$, I, 1)) - 1
NEXT
INVFULL$ = ""
INPUT #30, pexp, plvl, php, pmp, phmax, pmmax, pgold, pevd, pexneed, peqp(1)
INPUT #30, peqp(2), pmindmg, pmaxdmg, pdef, pwpwk, parmstr, parmwk, pbase, pwins
LINE INPUT #30, psex$
INPUT #30, pswing
IF NOT EOF(30) THEN INPUT #30, psexed
CLOSE #30
END SUB

SUB MagicPopUp STATIC
  uflag = 0
j = 0
FOR i = 1 TO 23
    j = j + magic(I)
NEXT
IF j = 0 THEN
    uflag = -2
    ustring$ = "You don't know any magic yet!"
    ELSE
    AnsiDraw "data\POP-MAGC.ANS"
    DIM ilist(1 TO 23)
    FOR i = 1 TO 23
        ilist(I) = 0
    NEXT
    tempboolean = 0
    curinum = 0
    SetTextPos 16, 44
    ColorForeground = 12
    b$ = STR$(pmp)
    IF LEN(b$) > 2 THEN b$ = LTRIM$(b$)
    IF b$ = " 0" THEN b$ = "No"
    show b$
    FOR icolumn = 16 TO 48 STEP 32
        IF icolumn = 16 THEN addval = 1 ELSE addval = 0
        FOR irow = 4 TO 14 + addval
            IF curinum > 23 THEN curinum = 23
            DO
                curinum = curinum + 1
            LOOP UNTIL curinum = 24 OR magic(curinum) > 0
            IF magic(curinum) > 0 THEN
                SetTextPos irow, icolumn
                ColorForeground = 7
                show SpellName$(curinum)
                SetTextPos irow, icolumn + 20
                ColorForeground = 14
                show SpellCost$(curinum)
                IF icolumn = 48 THEN
                    ilist(12 + (IROW - 3)) = curinum
                    ELSE
                    ilist(IROW - 3) = curinum
                END IF
                ELSE
                tempboolean = 1
                IROW = 14 + addval
                ICOLUMN = 48
            END IF
        NEXT
    NEXT
    tempvar = 24
    DO
        tempvar = tempvar - 1
    LOOP UNTIL ilist(tempvar) > 0
    changeflag = 0
    DO
        getone
        IF changeflag = 1 THEN
            SetTextPos 18, 1
            mshow " "
            SetTextPos 19, 1
            mshow " "
            changeflag = 0
        END IF
        SELECT CASE r$
        CASE "f":
          ColorForeground = 7
            I = NumericPrompt(19, 22, "Spell number", 1, tempvar)
            IF i > 0 THEN
              CenterShow 18, SpellName$(ilist(i)), 14
              CenterShow 19, SpellDesc$(ilist(i)), 10
              changeflag = 1
            END IF
       CASE "c":
                ColorForeground = 7
                I = NumericPrompt(19, 22, "Spell number", 1, tempvar)
                IF i > 0 THEN
                    uflag = ilist(I)
                    GetItemInfo ilist(i), 0, "magic.eff"
                    IF selection > 0 THEN
                        scost = VAL(SpellCost$(uflag))
                        uflag = -1
                        IF scost > pmp THEN
                            ustring$ = "|12You don't have enough MP to cast that spell!"
                        ELSE
                            pmp = pmp - scost
                            castmagicu = selection
                            DoEffect castmagicu, VAL(ustring$), 0
                        END IF
                        ELSE
                        uflag = ilist(I)
                    END IF
                    r$ = "q"
                END IF
        END SELECT
    LOOP UNTIL r$ = "q"
    r$ = ""
    ERASE ilist
END IF
END SUB

SUB mshow (a$) STATIC
   DIM ColorForeground AS INTEGER
IF LEFT$(a$, 1) = "|" THEN
    ColorForeground = VAL(MID$(A$, 2, 2))
    A$ = MID$(A$, 4)
ELSE
    ColorForeground = 10
END IF
IF RIGHT$(a$, 1) = ";" THEN
    cxpbackup% = cxp%
    COLOR ColorForeground, cbg%
    LOCATE cyp%, cxp%
    PRINT LEFT$(a$, LEN(a$) - 1) + STRING$(80 - LEN(a$), " ");
    cxp% = cxpbackup% + LEN(A$) - 1
ELSE
    COLOR ColorForeground, cbg%
    LOCATE cyp%, cxp%
    PRINT a$ + STRING$(79 - LEN(a$), " ");
    cyp% = cyp% + 1
    cxp% = 1
END IF
IF cyp% > 23 THEN cyp% = 23
LOCATE cyp%, cxp%
END SUB

SUB NewsReport (whatf$, mesg$) STATIC
OPEN "data\" + whatf$ FOR APPEND AS #25
PRINT #25, mesg$
CLOSE #25
END SUB

FUNCTION NumericPrompt% (they%, thex%, whattosay$, firstval%, lastval%) STATIC
DO
    SetTextPos they%, thex%
    show whattosay$ + " (" + LTRIM$(STR$(firstval%)) + " to " + LTRIM$(STR$(lastval%)) + ", or 0 to cancel): ;"
    getx 2, 2, 0
    promptresult% = VAL(r$)
    SetTextPos they%, 1
    t = ColorForeground
    mshow " "
    ColorForeground = t
LOOP UNTIL promptresult% >= firstval% AND promptresult% <= lastval% OR promptresult% = 0
NUMERICPROMPT% = promptresult%
END FUNCTION

FUNCTION randnum% (alim, blim) STATIC
xxx = INT(RND(1) * (BLIM - ALIM + 1)) + ALIM
IF xxx < alim THEN xxx = alim
IF xxx > blim THEN xxx = blim
RANDNUM% = xxx
END FUNCTION

SUB RemoveFromFile (remfile$, remname$) STATIC
IF _FILEEXISTS(remfile$) = 0 THEN
    OPEN "data\" + remfile$ FOR INPUT AS #27
    foundme = 0
    countnum = 0
    DO WHILE NOT EOF(27)
        countnum = countnum + 1
        LINE INPUT #27, hereur$
        IF hereur$ = remname$ THEN foundme = countnum
    LOOP
    CLOSE #27
    IF countnum = 1 AND foundme = 1 THEN
        KILL "data\" + remfile$
        ELSEIF foundme > 0 THEN
        renameto$ = LEFT$(REMFILE$, 5) + ".TEM"
        SHELL "ren data\" + remfile$ + " " + renameto$
        OPEN "data\" + renameto$ FOR INPUT AS #92
        OPEN "data\" + remfile$ FOR OUTPUT AS #93
        DO WHILE NOT EOF(92)
            LINE INPUT #92, copyover$
            IF copyover$ <> remname$ THEN PRINT #93, copyover$
        LOOP
        CLOSE #92
        CLOSE #93
        KILL "data\" + renameto$
        renameto$ = ""
    END IF
END IF
END SUB

SUB ResaveAsDead (usernumbr%) STATIC
SaveUserData
tpbackup = thisplayer
thisplayer = USERNUMBR%
LoadUserData
php = 0
pmp = pmmax
rmno$ = shno$
pexp = pexp - (pexp \ 10)
pgold = pgold \ 2
UpdateScoreList
php = phmax
FileUserInfo usernumbr%
thisplayer = tpbackup
LoadUserData
END SUB

SUB SaveUserData STATIC
IF shno$ <> "" THEN
    IF pexist = 1 THEN
        FileUserInfo thisplayer
        ELSE
        OPEN "data\users.num" FOR OUTPUT AS #30
        PRINT #30, thisplayer
        CLOSE #30
        OPEN "data\users.dat" FOR APPEND AS #30
        PRINT #30, NAME$
        CLOSE #30
        OPEN "data\users.hnd" FOR APPEND AS #30
        PRINT #30, phandle$
        CLOSE #30
        FileUserInfo thisplayer
        pexist = 1
    END IF
END IF
END SUB

SUB show (a$) STATIC
  DIM ColorForeground AS INTEGER
  IF RIGHT$(a$, 1) = ";" THEN
    cxpbackup% = cxp%
    LOCATE cyp%, cxp%
    COLOR ColorForeground, cbg%
    PRINT LEFT$(a$, LEN(a$) - 1);
    cxp% = cxpbackup% + LEN(A$) - 1
    ELSE
    LOCATE cyp%, cxp%
    COLOR ColorForeground, cbg%
    PRINT a$;
    cyp% = cyp% + 1
    cxp% = 1
  END IF
  IF cyp% > 23 THEN cyp% = 23
  LOCATE cyp%, cxp%
END SUB

SUB ShowBotScores (scorebool%) STATIC
  IF scorebool% < 2 THEN
    clss
    ColorForeground = 10
    show "Updating player rankings..."
    UpdateScoreList
    show "Saving player rankings..."
ELSE
    UpdateScoreList
END IF
IF _FILEEXISTS("BOTCHIGH.ANS") = 0 THEN KILL "data\BOTCHIGH.ANS"
OPEN "data\RANKTEMP.ANS" FOR INPUT AS #64
OPEN "data\BOTCHIGH.ANS" FOR OUTPUT AS #65
FOR w = 1 TO 4
    LINE INPUT #64, dummyin$
    IF w < 4 THEN PRINT #65, dummyin$ ELSE PRINT #65, dummyin$;
NEXT
CLOSE #64
OPEN "data\BOTSCORE.LST" FOR INPUT AS #64
DO WHILE NOT EOF(64)
    LINE INPUT #64, dummyin$
    IF LEFT$(dummyin$, 1) = "A" THEN usethisa$ = "[1;37m" ELSE usethisa$ = "[0;37m"
    PRINT #65, usethisa$; dummyin$;
    LINE INPUT #64, dummyin$
    DUMMYIN$ = "[1;33m" + LEFT$(DUMMYIN$, 2) + "[31m" + MID$(DUMMYIN$, 3, 2) + "[36m" + MID$(DUMMYIN$, 5, 2) + "[0;33m" + MID$(DUMMYIN$, 7, 2) + usethisa$ + MID$(DUMMYIN$, 9)
    PRINT #65, dummyin$
LOOP
PRINT #65, "[0m[255D"
CLOSE #64
CLOSE #65
DUMMYIN$ = ""
usethisa$ = ""
IF scorebool% = 0 THEN
    ccol 7, 0
    clss
ELSEIF scorebool% = 1 THEN
    AnsiDraw "data\BOTCHIGH.ANS"
    PRINT "<press any key to continue>"
    getone
    r$ = ""
END IF
END SUB

SUB ShowTextFile (flnam$) STATIC
OPEN "data\" + flnam$ FOR INPUT AS #88
numpgs% = 0
DO
    numpgs% = numpgs% + 1
    IF NOT EOF(88) THEN LINE INPUT #88, tddt$
LOOP UNTIL EOF(88)
stepper% = 0
IF (numpgs% / 19) <> (numpgs% \ 19) THEN stepper% = 1
numpgs% = numpgs% \ 19 + stepper%
CLOSE #88
OPEN "data\" + flnam$ FOR INPUT AS #88
cpgno% = 1
clss
'show "** BLOOD OF THE CHAMELEON **"
SetTextPos 1, 1
DO
    ColorForeground = 10
    stepper% = 0
    DO
        IF NOT EOF(88) THEN
            LINE INPUT #88, tddt$
            IF tddt$ = "**ANSIDEMO" THEN
                stepper% = 1
                mshow ""
            ELSE
                mshow tddt$
            END IF
        ELSE
            cyp% = 20
        END IF
    LOOP UNTIL cyp% = 20
    SetTextPos 21, 1
    show STRING$(79, " ")
    SetTextPos 21, 1
    ColorForeground = 15
    IF EOF(88) THEN show "(P)rev  (Q)uit  (ENTER=Quit)                                      Page " + LTRIM$(STR$(cpgno%)) + " of " + LTRIM$(STR$(numpgs%))
    IF NOT EOF(88) AND cpgno% > 1 THEN show "(N)ext  (P)rev  (Q)uit  (ENTER=Next)                              Page " + LTRIM$(STR$(cpgno%)) + " of " + LTRIM$(STR$(numpgs%))
    IF cpgno% = 1 THEN show "(N)ext  (Q)uit  (ENTER=Next)                                      Page " + LTRIM$(STR$(cpgno%)) + " of " + LTRIM$(STR$(numpgs%))
    IF stepper% = 1 THEN OPEN "data\EXAMPLE.ANS" FOR INPUT AS #111
    r$ = ""
    DO

IF stepper% = 1 THEN
    IF NOT EOF(111) THEN
        abba$ = INPUT$(1, 111)
    ELSE
        CLOSE #111
        OPEN "data\EXAMPLE.ANS" FOR INPUT AS #111
        abba$ = INPUT$(1, 111)
    END IF
    IF abba$ = CHR$(27) THEN
        abba$ = INPUT$(1, 111)
        fornum$ = ""
        fornum2$ = ""
        fornum3$ = ""
        DO
            abba$ = INPUT$(1, 111)
            IF abba$ >= "0" AND abba$ <= "9" THEN fornum$ = fornum$ + abba$
        LOOP UNTIL abba$ < "0" OR abba$ > "9"
        forcode$ = abba$
        IF forcode$ = ";" THEN
            DO
                abba$ = INPUT$(1, 111)
                IF abba$ >= "0" AND abba$ <= "9" THEN fornum2$ = fornum2$ + abba$
            LOOP UNTIL abba$ < "0" OR abba$ > "9"
            forcode$ = abba$
            IF forcode$ = ";" THEN
                DO
                    abba$ = INPUT$(1, 111)
                    IF abba$ >= "0" AND abba$ <= "9" THEN fornum3$ = fornum3$ + abba$
                LOOP UNTIL abba$ < "0" OR abba$ > "9"
                forcode$ = abba$
            END IF
        END IF
        IF forcode$ = "?" THEN
            abba$ = INPUT$(2, 111)
            abba$ = ""
        END IF
    END IF
    IF forcode$ <> "" THEN
        IF forcode$ = "m" THEN
            FOR dubious% = 1 TO 3
                SELECT CASE fornum$
                    CASE "30": colorbase% = 0
                        CASE "31": colorbase% = 4
                        CASE "32": colorbase% = 2
                        CASE "33": colorbase% = 6
                        CASE "34": colorbase% = 1
                        CASE "35": colorbase% = 5
                        CASE "36": colorbase% = 3
                        CASE "37": colorbase% = 7
                        CASE "0": colorbold% = 0: colorblink% = 0: colorback% = 0: colorbase% = 7
                        CASE "1": colorbold% = 8
                        CASE "5": colorblink% = 16
                        CASE "40": colorback% = 0
                        CASE "41": colorback% = 4
                        CASE "42": colorback% = 2
                        CASE "43": colorback% = 6
                        CASE "44": colorback% = 1
                        CASE "45": colorback% = 5
                        CASE "46": colorback% = 3
                        CASE "47": colorback% = 7
                END SELECT
                IF dubious% = 1 THEN fornum$ = fornum2$
                IF dubious% = 2 THEN fornum$ = fornum3$
            NEXT
        END IF
        IF forcode$ = "C" THEN
            IF fornum$ = "" THEN fornum$ = "1"
            tempx% = pos(0) + VAL(fornum$)
            IF tempx% > 80 THEN tempx% = 80
            LOCATE csrlin, tempx%
        END IF
        IF forcode$ = "A" THEN
            IF fornum$ = "" THEN fornum$ = "1"
            tempy% = csrlin - VAL(fornum$)
            IF tempy% < 1 THEN tempy% = 1
            LOCATE tempy%, pos(0)
        END IF
        IF forcode$ = "B" THEN
            IF fornum$ = "" THEN fornum$ = "1"
            tempy% = csrlin + VAL(fornum$)
            IF tempy% > 24 THEN tempy% = 24
            LOCATE tempy%, pos(0)
        END IF
        IF forcode$ = "D" THEN
            IF fornum$ = "" THEN fornum$ = "1"
            tempx% = pos(0) - VAL(fornum$)
            if tempx% < 1 THEN tempx% = 1
            LOCATE csrlin, tempx%
        END IF
        IF forcode$ = "H" THEN LOCATE VAL(fornum$), VAL(fornum2$)
        IF forcode$ = "f" THEN LOCATE VAL(fornum$), VAL(fornum2$)
        IF forcode$ = "s" THEN recally% = csrlin: recallx% = pos(0)
        IF forcode$ = "u" THEN LOCATE recally%, recallx%
        IF forcode$ = "J" AND fornum$ = "2" THEN clss
        IF forcode$ = "K" THEN
            COLOR 7, 0
            FOR dumdum% = pos(0) TO 80
                PRINT " ";
            NEXT
            COLOR (colorbase% + colorbold% + colorblink%), colorback%
        END IF
        forcode$ = ""
        abba$ = ""
    END IF
    IF abba$ <> CHR$(13) THEN COLOR (colorbase% + colorbold% + colorblink%), colorback%: PRINT abba$;
    '    IF abba$ = CHR$(10) AND csrlin = 24 THEN LOCATE 23, 1
    '    IF slowdraw% > 0 OR tempdraw% > 0 THEN HOPSTEP% = HOPSTEP% + 1
    '    IF HOPSTEP% = 12 THEN
    '        tim! = TIMER
    '        DO
    '        LOOP UNTIL TIMER >= tim! + 0.004
    '        HOPSTEP% = 0
    '    END IF
    _DELAY 0.002
END IF

        r$ = INKEY$
        IF r$ <> "" THEN r$ = LCASE$(r$)
    LOOP UNTIL (r$ = "n" AND NOT EOF(88)) OR (r$ = "p" AND cpgno% > 1) OR r$ = "q" OR r$ = CHR$(13)
    IF stepper% = 1 THEN COLOR 10, 0: CLOSE #111
    IF r$ = "n" OR (r$ = CHR$(13) AND NOT EOF(88)) THEN
        clss
        SetTextPos 1, 1
        cpgno% = cpgno% + 1
    END IF
    IF r$ = "p" THEN
        clss
        SetTextPos 1, 1
        cpgno% = cpgno% - 1
        CLOSE #88
        OPEN "data\" + flnam$ FOR INPUT AS #88
        IF cpgno% > 1 THEN
            FOR incre% = 1 TO cpgno% - 1
                FOR stepson% = 1 TO 19
                    LINE INPUT #88, tddt$
                NEXT
            NEXT
        END IF
    END IF
    IF r$ = CHR$(13) AND EOF(88) THEN r$ = "q"
LOOP UNTIL r$ = "q"
CLOSE #88
r$ = ""
END SUB

FUNCTION SpellCost$ (spellno) STATIC
thespell$ = GetFileLine$("mp.cst", SPELLNO)
SPELLCOST$ = thespell$
END FUNCTION

FUNCTION SpellDesc$ (spellno) STATIC
thespell$ = GetFileLine$("magic.dsc", SPELLNO)
SPELLDESC$ = thespell$
END FUNCTION

FUNCTION SpellName$ (spellno)
thespell$ = GetFileLine$("magic.lst", SPELLNO)
SPELLNAME$ = thespell$
END FUNCTION

SUB stopfor (timeto!) STATIC
xabc! = TIMER
WHILE TIMER < xabc! + timeto!
    IF TIMER < xabc! THEN xabc! = 0
WEND
END SUB

SUB TestResponse STATIC
SELECT CASE r$
    CASE "?":
        ShowTextFile "BOTC.INS"
        AnsiDraw "data\BOTCALPH.ANS"
        Healthometer 1, 61, 74
        worldno = 99
        DisplayRoom 2
        CASE "l":
        ShowBotScores 1
        AnsiDraw "data\BOTCALPH.ANS"
        Healthometer 1, 61, 74
        worldno = 99
        DisplayRoom 2
        CASE "q":
        ErrMessage "Quit for now?  (Y)es  (N)o"
        DO
            getone
        LOOP UNTIL r$ = "y" OR r$ = "n"
        IF r$ = "n" THEN
            ErrMessage "Didn't think so. (:"
            r$ = ""
            ELSE
            r$ = "q"
        END IF
        CASE "e":
        OPEN "data\" + rmno$ + ".LOC" FOR INPUT AS #10
        DO
            IF NOT EOF(10) THEN LINE INPUT #10, dumbo$
        LOOP UNTIL EOF(10) OR dumbo$ = "+e"
        IF NOT EOF(10) THEN
            ErrMessage "|13Examine what?"
            linenum = 15
            DO
                LINE INPUT #10, dasitem$
                IF dasitem$ <> "/" THEN
                    SetTextPos linenum, 1
                    mshow "|14" + STR$(linenum - 14) + ") " + dasitem$
                    linenum = linenum + 1
                END IF
            LOOP UNTIL dasitem$ = "/"
            SetTextPos linenum, 1
            mshow "|11 Q) Cancel"
            resl$ = LTRIM$(STR$(linenum - 15))
            DO
                getone
                r$ = UCASE$(r$)
            LOOP UNTIL (r$ >= "1" AND r$ <= resl$) OR r$ = "Q"
            IF r$ <> "Q" THEN
                FOR i = 2 TO VAL(r$)
                    DO
                        LINE INPUT #10, dumbi$
                    LOOP UNTIL dumbi$ = "/"
                NEXT
                lnum = 14
                DO
                    LINE INPUT #10, dumbi$
                    IF dumbi$ <> "/" THEN
                        SetTextPos lnum, 1
                        IF LEFT$(dumbi$, 2) = "+@" THEN
                            lspell = INT(VAL(MID$(DUMBI$, 3)))
                            IF magic(lspell) = 0 THEN
                                magic(lspell) = 1
                                mshow "|15** Learned " + SpellName(lspell) + " magic! **"
                                ELSE
                                mshow "But, you already know the " + SpellName(lspell) + " spell."
                            END IF
                            ELSEIF LEFT$(dumbi$, 2) = "+&" THEN
                            DoEffect 31, 0, 0
                            ELSE
                            mshow dumbi$
                        END IF
                        lnum = lnum + 1
                    END IF
                LOOP UNTIL dumbi$ = "/"
                FOR i = lnum TO 22
                    SetTextPos i, 1
                    mshow ""
                NEXT
                ELSE
                ErrMessage "You decide not to examine anything."
            END IF
            r$ = ""
            ELSE
            ErrMessage "There's nothing important enough to examine here."
        END IF
        CLOSE #10
        CASE "8", "4", "6", "2", "+", "-":
        docontinue = 1
        IF r$ = "8" AND enemyat(1) > 0 THEN DoBattle 1: docontinue = 0
        IF r$ = "2" AND enemyat(2) > 0 THEN DoBattle 2: docontinue = 0
        IF r$ = "6" AND enemyat(3) > 0 THEN DoBattle 3: docontinue = 0
        IF r$ = "4" AND enemyat(4) > 0 THEN DoBattle 4: docontinue = 0
        IF docontinue = 1 THEN
            OPEN "data\" + rmno$ + ".LOC" FOR INPUT AS #10
            DO
                IF NOT EOF(10) THEN LINE INPUT #10, dumbo$
            LOOP UNTIL EOF(10) OR dumbo$ = "+" + r$
            IF NOT EOF(10) THEN
                LINE INPUT #10, zz$
                IF MID$(zz$, 2, 1) = "-" THEN
                    CLOSE #10
                    ELSE
                    IF LEFT$(zz$, 1) = "i" AND LEN(zz$) = 3 THEN
                        IF inven(VAL(RIGHT$(zz$, 2))) = 1 THEN
                            LINE INPUT #10, zz$
                            ELSE
                            LINE INPUT #10, dumbo$
                            IF dumbo$ = "a" THEN
                                LINE INPUT #10, dumbo$
                                LINE INPUT #10, dumbo$
                            END IF
                            LINE INPUT #10, zz$
                        END IF
                    END IF
                    IF zz$ = "a" THEN
                        LINE INPUT #10, ansisi$
                        LINE INPUT #10, zz$
                        IF turnsleft > 0 THEN
                            tempdraw% = 2
                            AnsiDraw "data\" + ansisi$
                        END IF
                    END IF
                    CLOSE #10
                END IF
                IF MID$(zz$, 2, 1) = "-" THEN
                    IF LEFT$(rmno$, 5) <> LEFT$(zz$, 5) AND turnsleft < 1000 THEN
                        turnsleft = turnsleft - 1
                    END IF
                    IF turnsleft >= 0 THEN
                        rmno$ = ZZ$
                        DisplayRoom 1
                        ELSE
                        ErrMessage "You're too tired to continue today. Come back tomorrow!"
                        turnsleft = 0
                    END IF
                    ELSE
                    ErrMessage zz$
                END IF
                ELSE
                CLOSE #10
                ErrMessage "Can't go that way!"
            END IF
        END IF
        CASE "g":
        OPEN "data\" + rmno$ + ".LOC" FOR INPUT AS #10
        DO
            IF NOT EOF(10) THEN LINE INPUT #10, dumbo$
        LOOP UNTIL EOF(10) OR dumbo$ = "+g"
        IF NOT EOF(10) THEN
            LINE INPUT #10, checkit$
            IF LEFT$(checkit$, 1) = "i" THEN
                IF inven(VAL(RIGHT$(checkit$, 2))) = 1 THEN
                    LINE INPUT #10, giveitem$
                    CLOSE #10
                    IF inven(VAL(giveitem$)) = 1 THEN
                        ErrMessage "Nothing to get!"
                        ELSE
                        inven(VAL(GIVEITEM$)) = 1
                        ErrMessage "Now carrying " + ItemName(VAL(giveitem$)) + "."
                        SetTextPos 11, 1
                        mshow ""
                    END IF
                    ELSE
                    LINE INPUT #10, dumbo$
                    LINE INPUT #10, gitm$
                    CLOSE #10
                    IF VAL(gitm$) = 0 THEN
                        ErrMessage "Nothing to get!"
                        ELSE
                        IF inven(VAL(gitm$)) = 1 THEN
                            ErrMessage "Nothing to get!"
                            ELSE
                            inven(VAL(GITM$)) = 1
                            ErrMessage "Now carrying " + ItemName(VAL(gitm$)) + "."
                            SetTextPos 11, 1
                            mshow ""
                        END IF
                    END IF
                END IF
                ELSE
                CLOSE #10
                IF inven(VAL(checkit$)) = 0 THEN
                    inven(VAL(CHECKIT$)) = 1
                    ErrMessage "Now carrying " + ItemName(VAL(checkit$)) + "."
                    SetTextPos 11, 1
                    mshow ""
                    ELSE
                    ErrMessage "Nothing to get!"
                END IF
            END IF
            ELSE
            CLOSE #10
            ErrMessage "Nothing to get!"
        END IF
        CASE "f":
        OPEN "data\" + rmno$ + ".LOC" FOR INPUT AS #10
        DO
            IF NOT EOF(10) THEN LINE INPUT #10, dumbo$
        LOOP UNTIL EOF(10) OR dumbo$ = "+f"
        IF NOT EOF(10) THEN
            LINE INPUT #10, dumbo$
            CLOSE #10
            enemyat(1) = VAL(LEFT$(DUMBO$, 2))
            enemyat(2) = VAL(MID$(DUMBO$, 3, 2))
            isboss = 1
            MID$(rmno$, 3, 3) = RIGHT$(dumbo$, 3)
            DoBattle 50
            IF LEFT$(dumbo$, 4) = "1105" THEN
                NewsReport "NEWS.TDY", "|11" + phandle$ + " has slain The Chameleon and saved Vulteria!"
                ELSE
                NewsReport "NEWS.TDY", "|14" + phandle$ + " encountered the " + ustring$ + " and emerged victorious!"
            END IF
            DUMBO$ = ""
            ustring$ = ""
            ELSE
            ErrMessage "No major foes nearby. To fight a normal enemy, simply walk in its direction."
            CLOSE #10
        END IF
        DUMBO$ = ""
        CASE "p":
        zafile$ = LEFT$(rmno$, 5) + ".SLP"
        IF _FILEEXISTS(zafile$) = 0 THEN
            OPEN "data\" + zafile$ FOR INPUT AS #66
            ErrMessage "|13Interact with:"
            DIM nhere$(5)
            FOR o = 1 TO 5
                nhere$(O) = ""
            NEXT
            nhctr = 0
            DO
                nhctr = nhctr + 1
                IF nhctr > 5 THEN
                    nh2 = 0
                    DO
                        nh2 = nh2 + 1
                    LOOP UNTIL nhere$(nh2) = "" OR nh2 = 5
                    IF nh2 = 5 AND nhere$(nh2) <> "" THEN nh2 = 6
                    SetTextPos 14 + nh2, 1
                    IF EOF(66) THEN
                        mshow "|11 Q) Cancel"
                        ELSE
                        mshow "|11 M) More  Q) Cancel"
                    END IF
                    getone
                    IF r$ = "m" AND NOT EOF(66) THEN
                        r$ = ""
                        nhctr = 0
                    END IF
                    ELSE
                    IF NOT EOF(66) THEN
                        LINE INPUT #66, nhere$(nhctr)
                        SetTextPos 14 + nhctr, 1
                        mshow "|14" + STR$(nhctr) + ") " + nhere$(nhctr)
                        ELSE
                        DO WHILE nhctr < 5
                            nhere$(nhctr) = ""
                            SetTextPos 14 + nhctr, 1
                            mshow ""
                            nhctr = nhctr + 1
                        LOOP
                        SetTextPos 19, 1
                        mshow ""
                        SetTextPos 20, 1
                        mshow ""
                    END IF
                END IF
            LOOP UNTIL (r$ >= "1" AND r$ <= "5") OR r$ = "q"
            CLOSE #66
            IF r$ = "q" OR nhere$(VAL(r$)) = "" THEN
                ErrMessage "You decide not to bother anyone."
                ELSE
                BotherUser nhere$(VAL(r$))
            END IF
            ERASE nhere$
            ELSE
            ErrMessage "There are no other players in this area."
        END IF
        zafile$ = ""
        r$ = ""
        CASE "v":
        SetTextPos 14, 1
        mshow "|14Stats for " + phandle$ + " (level" + STR$(plvl) + ")"
        mshow ""
        IF pexp < 25480 THEN
            mshow "Experience   :" + STR$(pexp) + ", need" + STR$(pexneed) + " for level-up"
            ELSE
            mshow "Experience   : MASTERED!"
        END IF
        mshow "Health       :" + STR$(php) + " /" + STR$(phmax)
        mshow "Magic        :" + STR$(pmp) + " /" + STR$(pmmax)
        SELECT CASE pwpwk
            CASE 0: wpel$ = "no elemental power"
                CASE 1: wpel$ = "imbued with fire"
                CASE 2: wpel$ = "imbued with ice"
                CASE 3: wpel$ = "imbued with lightning"
                CASE 4: wpel$ = "imbued with earth"
                CASE 5: wpel$ = "multi-elemental"
                CASE ELSE: wpel$ = "element unknown"
        END SELECT
        mshow "Strength     : base" + STR$(pbase) + ", damage range" + STR$(pmindmg) + " to" + STR$(pmaxdmg) + ", " + wpel$
        SELECT CASE parmwk
            CASE 0: wpel$ = "no weakness"
                CASE 1: wpel$ = "weakness to fire"
                CASE 2: wpel$ = "weakness to ice"
                CASE 3: wpel$ = "weakness to lightning"
                CASE 4: wpel$ = "weakness to earth"
                CASE 5: wpel$ = "weakness to all elements"
                CASE ELSE: wpel$ = "weakness unknown"
        END SELECT
        SELECT CASE parmstr
            CASE 0: arel$ = "no strength"
                CASE 1: arel$ = "blocks fire"
                CASE 2: arel$ = "blocks ice"
                CASE 3: arel$ = "blocks lightning"
                CASE 4: arel$ = "blocks earth"
                CASE 5: arel$ = "blocks all elements"
                CASE ELSE: arel$ = "strength unknown"
        END SELECT
        mshow "Defense      :" + STR$(pdef) + "% blocking," + STR$(pevd) + "% evasion"
        mshow "Armor stats  : " + arel$ + ", " + wpel$
        mshow "Gold on hand :" + STR$(pgold)
        wpel$ = ""
        arel$ = ""
        CASE "i":
        uflag = 0
        DO
            InventoryPopUp
        LOOP UNTIL uflag = 0
        IF ustring$ <> "" THEN
            AnsiDraw "data\BOTCALPH.ANS"
            Healthometer 1, 61, 74
            worldno = 99
            DisplayRoom 0
            ErrMessage ustring$
            ustring$ = ""
        END IF
        CASE "m":
        MagicPopUp
        IF uflag <= 0 THEN
            IF uflag = -1 THEN
                AnsiDraw "data\BOTCALPH.ANS"
                Healthometer 1, 61, 74
                worldno = 99
                DisplayRoom 0
                ErrMessage ustring$
                ELSEIF uflag = -2 THEN
                ErrMessage ustring$
                ELSEIF uflag = 0 THEN
                AnsiDraw "data\BOTCALPH.ANS"
                Healthometer 1, 61, 74
                worldno = 99
                DisplayRoom 0
                ErrMessage "You decide not to cast any spells right now."
            END IF
            uflag = 0
            ustring$ = ""
            ELSE
            AnsiDraw "data\BOTCALPH.ANS"
            Healthometer 1, 61, 74
            worldno = 99
            DisplayRoom 0
            IF uflag > 0 THEN
                scost = VAL(SpellCost$(uflag))
                OPEN "data\" + rmno$ + ".LOC" FOR INPUT AS #10
                DO
                    IF NOT EOF(10) THEN LINE INPUT #10, dumbo$
                LOOP UNTIL EOF(10) OR LEFT$(dumbo$, 2) = "+m"
                IF (NOT EOF(10)) AND VAL(RIGHT$(dumbo$, 2)) = uflag AND pmp >= scost THEN
                    ErrMessage "|13Casting " + SpellName$(uflag) + " spell..."
                    pmp = pmp - scost
                    Healthometer 1, 61, 74
                    LINE INPUT #10, zz$
                    IF MID$(zz$, 2, 1) = "-" THEN
                        CLOSE #10
                        ELSE
                        IF LEFT$(zz$, 1) = "i" AND LEN(zz$) = 3 THEN
                            IF inven(VAL(RIGHT$(zz$, 2))) = 1 THEN
                                LINE INPUT #10, zz$
                                ELSE
                                LINE INPUT #10, dumbo$
                                LINE INPUT #10, zz$
                            END IF
                        END IF
                        IF zz$ = "a" THEN
                            LINE INPUT #10, ansisi$
                            LINE INPUT #10, zz$
                            IF turnsleft > 0 THEN
                                tempdraw% = 2
                                AnsiDraw "data\"+ansisi$
                            END IF
                        END IF
                        CLOSE #10
                    END IF
                    IF MID$(zz$, 2, 1) = "-" THEN
                        rmno$ = ZZ$
                        DisplayRoom 1
                        ELSE
                        ErrMessage zz$
                    END IF
                    ELSEIF pmp < scost THEN
                    CLOSE #10
                    ErrMessage "|12You don't have enough MP to cast that spell!"
                    ELSE
                    CLOSE #10
                    ErrMessage "There's no reason to cast that spell here."
                END IF
                uflag = 0
            END IF
        END IF
        CASE "a":
        AnsiDraw "data\BOTCALPH.ANS"
        Healthometer 1, 61, 74
        worldno = 99
        DisplayRoom 2
        CASE "s":
        ErrMessage "|01Sleeping..."
        tempdraw% = 2
        AnsiDraw "data\SLEEP.ANS"
        ErrMessage "|13Waking up..."
        stopfor 1
        php = php + 200
        pmp = pmp + 20
        IF php > phmax THEN php = phmax
        IF pmp > pmmax THEN pmp = pmmax
        Healthometer 1, 61, 74
        IF turnsleft < 1000 THEN turnsleft = turnsleft - 5
        IF turnsleft < 0 THEN turnsleft = 0
        IF LEN(rmno$) > 5 THEN MID$(rmno$, 7, 1) = "1"
        DisplayRoom 2
        CASE "x":
        OPEN "data\" + rmno$ + ".LOC" FOR INPUT AS #10
        DO
            IF NOT EOF(10) THEN LINE INPUT #10, dumbo$
        LOOP UNTIL EOF(10) OR dumbo$ = "+x"
        IF NOT EOF(10) THEN
            LINE INPUT #10, checkit$
            IF MID$(checkit$, 2, 1) = "-" THEN
                CLOSE #10
                rmno$ = CHECKIT$
                DisplayRoom 1
            ELSE
                susanflag% = 0
                FOR disl = 14 TO 22
                    SetTextPos disl, 1
                    IF susanflag% = 0 THEN
                        IF checkit$ <> "REFRESH" THEN mshow checkit$
                        IF checkit$ = "REFRESH" THEN
                            mshow "|15You feel completely refreshed and fully energized!"
                            SELECT CASE DecryptText$(NAME$)
                                CASE "TURNS":
                                    IF turnsleft < 1000 THEN turnsleft = 999
                                CASE "WYRDWAD":
                                    IF turnsleft < 1000 THEN turnsleft = 25
                                CASE ELSE:
                                    IF turnsleft < 1000 THEN turnsleft = 250
                            END SELECT
                            php = phmax
                            pmp = pmmax
                            Healthometer 1, 61, 74
                            SetTextPos 12, 12
                            ccol 7, 0
                            IF turnsleft < 1 THEN
                                show " 0  "
                            ELSEIF turnsleft = 1000 THEN
                                show " INF"
                            ELSE
                                show STR$(turnsleft) + "  "
                            END IF
                        END IF
                    ELSE
                        mshow ""
                    END IF
                    IF susanflag% = 0 THEN LINE INPUT #10, checkit$
                    IF checkit$ = "/" THEN susanflag% = 1: CLOSE #10
                NEXT
            END IF
            ELSE
            CLOSE #10
            ErrMessage "Nothing to ride!"
        END IF
        CASE "t", "r":
        OPEN "data\" + rmno$ + ".LOC" FOR INPUT AS #10
        DO
            IF NOT EOF(10) THEN LINE INPUT #10, dumbo$
        LOOP UNTIL EOF(10) OR dumbo$ = "+" + r$
        IF NOT EOF(10) THEN
            FOR disl = 14 TO 22
                LINE INPUT #10, xe$
                IF LEFT$(xe$, 1) = "i" AND LEN(xe$) = 3 THEN
                    IF inven(VAL(RIGHT$(xe$, 2))) = 0 THEN
                        DO
                            LINE INPUT #10, xe$
                        LOOP UNTIL xe$ = "/"
                    END IF
                    LINE INPUT #10, xe$
                END IF
                IF xe$ = "/" THEN
                    FOR i = disl TO 22
                        SetTextPos i, 1
                        mshow ""
                    NEXT
                    DISL = 22
                    ELSEIF LEFT$(xe$, 2) = "+*" THEN
                    IF shno$ <> "0-000" THEN shno$ = rmno$
                    FOR i = disl TO 22
                        SetTextPos i, 1
                        mshow ""
                    NEXT
                    DISL = 22
                    ELSEIF LEFT$(xe$, 2) = "!I" THEN
                    SetTextPos disl, 1
                    mshow ""
                    DISL = DISL + 1
                    SetTextPos disl, 1
                    mshow "Care to check out the merchandise?  (Y)es  (N)o"
                    FOR i = disl + 1 TO 22
                        SetTextPos i, 1
                        mshow ""
                    NEXT
                    DISL = 22
                    DO
                        getone
                    LOOP UNTIL r$ = "y" OR r$ = "n"
                    IF r$ = "y" THEN
                        DIM mercls(1 TO 4, 1 TO 2)
                        FOR g = 1 TO 4
                            mercls(G, 1) = 0
                            mercls(G, 2) = 0
                        NEXT
                        G = 0
                        DO
                            LINE INPUT #10, fromfl$
                            IF fromfl$ <> "/" THEN
                                G = G + 1
                                mercls(G, 1) = VAL(FROMFL$)
                                LINE INPUT #10, fromfl$
                                mercls(G, 2) = VAL(FROMFL$)
                            END IF
                        LOOP UNTIL fromfl$ = "/"
                        FROMFL$ = ""
                        AnsiDraw "data\MERCHANT.ANS"
                        FOR f = 1 TO g
                            sthr = 3 * (F - 1) + 4
                            SetTextPos sthr, 4
                            ColorForeground = 14
                            show ItemName$(mercls(f, 1))
                            SetTextPos sthr, 32
                            ColorForeground = 12
                            show "(" + LTRIM$(STR$(mercls(f, 2))) + " gold)"
                            SetTextPos sthr + 1, 1
                            ColorForeground = 10
                            show ItemDesc$(mercls(f, 1))
                        NEXT
                        sthr = 0
                        SetTextPos 16, 15
                        ColorForeground = 2
                        show LTRIM$(STR$(pgold))
                        SetTextPos 18, 25
                        ColorForeground = 3
                        show LTRIM$(STR$(g))
                        DO
                            DO
                                getone
                            LOOP UNTIL (r$ >= "1" AND r$ <= LTRIM$(STR$(g))) OR r$ = "q"
                            IF r$ = "q" THEN
                                CLOSE #10
                                AnsiDraw "data\BOTCALPH.ANS"
                                Healthometer 1, 61, 74
                                worldno = 0
                                DisplayRoom 0
                                ErrMessage "Looks like you're done shopping for the moment."
                                ELSE
                                SetTextPos 19, 1
                                IF pgold < mercls(VAL(r$), 2) THEN
                                    mshow "|12" + CHR$(34) + "Hey, you don't have enough money for that! Choose something else." + CHR$(34)
                                    ELSE
                                    inum4s = VAL(r$)
                                    mshow CHR$(34) + "You wanna buy the " + ItemName$(mercls(inum4s, 1)) + " for" + STR$(mercls(VAL(r$), 2)) + " gold?" + CHR$(34) + "  (Y)es  (N)o"
                                    DO
                                        getone
                                    LOOP UNTIL r$ = "y" OR r$ = "n"
                                    IF r$ = "y" THEN
                                        IF inven(mercls(inum4s, 1)) = 0 THEN
                                            inven(mercls(inum4s, 1)) = 1
                                            pgold = pgold - mercls(inum4s, 2)
                                            IF pgold < 0 THEN pgold = 0
                                            SetTextPos 19, 1
                                            mshow "|15Bought " + ItemName$(mercls(inum4s, 1)) + "!"
                                            SetTextPos 16, 15
                                            ColorForeground = 2
                                            show LTRIM$(STR$(pgold)) + "    "
                                            inum4s = 0
                                            ELSE
                                            SetTextPos 19, 1
                                            mshow "|12" + CHR$(34) + "Aww geez, you already got one of them! I can't sell you another..." + CHR$(34)
                                        END IF
                                        ELSE
                                        SetTextPos 19, 1
                                        mshow CHR$(34) + "That's OK, just keep shopping." + CHR$(34)
                                    END IF
                                END IF
                            END IF
                        LOOP UNTIL r$ = "q"
                        ERASE mercls
                        ELSE
                        ErrMessage "You decide not to do any shopping here right now."
                    END IF
                    r$ = ""
                    'merchant
                    ELSEIF LEFT$(xe$, 2) = "!B" THEN
                    INPUT #10, shprc
                    SetTextPos disl, 1
                    mshow ""
                    DISL = DISL + 1
                    SetTextPos disl, 1
                    mshow "Interested in sharpening your " + ItemName$(peqp(1)) + "?  (Y)es  (N)o"
                    FOR i = disl + 1 TO 22
                        SetTextPos i, 1
                        mshow ""
                    NEXT
                    DO
                        getone
                    LOOP UNTIL r$ = "y" OR r$ = "n"
                    IF r$ = "n" THEN
                        ErrMessage "You decide not to."
                        ELSEIF pmindmg = pmaxdmg THEN
                        ErrMessage "But, your weapon is already as sharp as it can get!"
                        ELSEIF shprc > pgold THEN
                        ErrMessage "But, you don't have enough money!"
                        ELSE
                        SetTextPos disl, 1
                        maxunits = pmaxdmg - pmindmg
                        IF maxunits > 200 THEN maxunits = 200
                        mshow "Costs" + STR$(shprc) + " gold per unit. Weapon can be sharpened up to" + STR$(maxunits) + " units."
                        IF pgold \ shprc < maxunits THEN maxunits = pgold \ shprc
                        DO
                            SetTextPos disl + 1, 1
                            mshow "You can afford up to" + STR$(maxunits) + " units. Sharpen by how much?  ;"
                            ColorForeground = 2
                            getx 3, 2, 0
                        LOOP UNTIL VAL(r$) >= 0 AND VAL(r$) <= maxunits
                        pmindmg = pmindmg + VAL(r$)
                        inven(peqp(1)) = inven(peqp(1)) + VAL(r$)
                        maxunits = SHPRC * VAL(r$)
                        pgold = pgold - maxunits
                        IF pgold < 0 THEN pgold = 0
                        ErrMessage ItemName$(peqp(1)) + " can now do between" + STR$(pmindmg) + " and" + STR$(pmaxdmg) + " damage. Cost:" + STR$(maxunits) + " gold."
                    END IF
                    DISL = 22
                    'blacksmith (sharpener)
                    ELSEIF LEFT$(xe$, 2) = "!g" THEN
                    LINE INPUT #10, xe$
                    SetTextPos disl, 1
                    mshow ""
                    SetTextPos disl + 1, 1
                    IF inven(VAL(xe$)) > 0 THEN
                        mshow "But, you already have the " + ItemName$(VAL(xe$)) + "!"
                        ELSE
                        inven(VAL(XE$)) = 1
                        mshow "Received " + ItemName$(VAL(xe$)) + "!"
                    END IF
                    FOR i = disl + 2 TO 22
                        SetTextPos i, 1
                        mshow ""
                    NEXT
                    DISL = 22
                    ELSEIF LEFT$(xe$, 2) = "-g" THEN
                    LINE INPUT #10, xe$
                    tvar1 = VAL(XE$)
                    LINE INPUT #10, xe$
                    tvar2 = VAL(XE$)
                    SetTextPos disl, 1
                    mshow ""
                    SetTextPos disl + 1, 1
                    mshow "Give up the " + ItemName$(tvar1) + "?  (Y)es  (N)o"
                    FOR i = disl + 2 TO 22
                        SetTextPos i, 1
                        mshow ""
                    NEXT
                    DO
                        getone
                    LOOP UNTIL r$ = "y" OR r$ = "n"
                    IF r$ = "y" THEN
                        inven(tvar1) = 0
                        IF tvar2 < 81 THEN
                            XE$ = ItemName$(tvar2)
                            inven(tvar2) = 1
                            ELSE
                            XE$ = XE$ + " gold"
                            IF 30000 - tvar2 < pgold THEN pgold = 30000 ELSE pgold = pgold + tvar2
                            IF pgold > 30000 THEN pgold = 30000
                        END IF
                        ErrMessage "Traded " + ItemName$(tvar1) + " for " + xe$ + "."
                        ELSE
                        ErrMessage "The exchange was not made."
                    END IF
                    DISL = 22
                    ELSEIF LEFT$(xe$, 2) = "-$" THEN
                    LINE INPUT #10, xe$
                    tvar1 = VAL(XE$)
                    SetTextPos disl, 1
                    mshow ""
                    IF pgold < tvar1 THEN
                        SetTextPos disl + 1, 1
                        mshow "It sounds tempting, but you don't have enough gold..."
                        FOR i = disl + 2 TO 22
                            SetTextPos i, 1
                            mshow ""
                        NEXT
                        ELSE
                        SetTextPos disl + 1, 1
                        mshow "Pay the " + xe$ + " gold?  (Y)es  (N)o"
                        FOR i = disl + 2 TO 22
                            SetTextPos i, 1
                            mshow ""
                        NEXT
                        DO
                            getone
                        LOOP UNTIL r$ = "y" OR r$ = "n"
                        IF r$ = "y" THEN
                            pgold = pgold - tvar1
                            LINE INPUT #10, xe$
                            rmno$ = XE$
                            CLOSE #10
                            DisplayRoom 1
                            DISL = 22
                            ELSE
                            ErrMessage "You decide against it."
                        END IF
                    END IF
                    DISL = 22
                    ELSEIF LEFT$(xe$, 2) = "+@" THEN
                    SetTextPos disl, 1
                    lspell = INT(VAL(MID$(XE$, 3)))
                    IF magic(lspell) = 0 THEN
                        magic(lspell) = 1
                        mshow "|15** Learned " + SpellName(lspell) + " magic! **"
                        ELSE
                        mshow "But, you already know the " + SpellName(lspell) + " spell."
                    END IF
                    ELSEIF LEFT$(xe$, 2) = "+&" THEN
                    SetTextPos disl, 1
                    DoEffect 31, 0, 0
                    ELSEIF xe$ = "!W" THEN
                    SetTextPos disl, 1
                    mshow ""
                    SetTextPos disl + 1, 1
                    mshow "<press any key to continue>"
                    FOR i = disl + 2 TO 22
                        SetTextPos i, 1
                        mshow ""
                    NEXT
                    getone
                    CLOSE #10
                    WinTheGame
                    DISL = 22
                    ELSE
                    SetTextPos disl, 1
                    mshow xe$
                END IF
            NEXT
            ELSE
            IF r$ = "t" THEN ErrMessage "Nobody to talk to!"
            IF r$ = "r" THEN ErrMessage "Nothing to read!"
        END IF
        CLOSE #10
END SELECT
END SUB

SUB UpdateScoreList STATIC
IF php > 0 THEN send21$ = "Alive   " ELSE send21$ = "Dead    "
send21$ = send21$ + psex$ + "     "
send21$ = send21$ + AddPadding$(24, phandle$)
send21$ = send21$ + AddPadding$(6, STR$(plvl))
send21$ = send21$ + AddPadding$(10, STR$(pexp))
send21$ = send21$ + AddPadding$(12, WorldName$(VAL(LEFT$(rmno$, 1))))
send22$ = ""
FOR w = 32 TO 35
    IF inven(w) > 0 THEN send22$ = send22$ + "ë " ELSE send22$ = send22$ + "  "
NEXT
send22$ = send22$ + " " + STR$(pwins)
IF _FILEEXISTS("BOTSCORE.LST") = -1 THEN
    OPEN "data\BOTSCORE.LBK" FOR OUTPUT AS #64
    PRINT #64, send21$
    PRINT #64, send22$
    CLOSE #64
    OPEN "data\BOTSCORE.LBK" FOR INPUT AS #64
    OPEN "data\BOTSCORE.LST" FOR OUTPUT AS #65
    ELSE
    IF _FILEEXISTS("BOTSCORE.LBK") = 0 THEN KILL "data\BOTSCORE.LBK"
    SHELL "ren data\BOTSCORE.LST BOTSCORE.LBK"
    OPEN "data\BOTSCORE.LBK" FOR INPUT AS #64
    OPEN "data\BOTSCORE.LST" FOR OUTPUT AS #65
END IF
sentoutb = 0
DO WHILE NOT EOF(64)
    LINE INPUT #64, get21$
    LINE INPUT #64, get22$
    IF (VAL(MID$(get21$, 46, 9)) <= pexp AND pwins >= VAL(RIGHT$(get22$, 2))) AND sentoutb = 0 THEN
        sentoutb = 1
        PRINT #65, send21$
        PRINT #65, send22$
    END IF
    IF RTRIM$(MID$(get21$, 15, 12)) <> phandle$ THEN
        PRINT #65, get21$
        PRINT #65, get22$
    END IF
LOOP
IF sentoutb = 0 THEN
    PRINT #65, send21$
    PRINT #65, send22$
END IF
CLOSE #64
CLOSE #65
send21$ = ""
send22$ = ""
GET21$ = ""
GET22$ = ""
END SUB

SUB WinTheGame STATIC
newpw = pwins + 1
IF newpw > 99 THEN newpw = 99
AnsiDraw "data\ENDING1.ANS"
getone
tempdraw% = 1
AnsiDraw "data\SUDDENLY.ANS"
IF newpw < 5 THEN
    AnsiDraw "data\ENDING2.ANS"
    getone
    AnsiDraw "data\WINITEM" + LTRIM$(RTRIM$(STR$(newpw))) + ".ANS"
    getone
    FOR g = 1 TO 23
        IF magic(g) = 1 THEN magic(g) = 0
    NEXT
    FOR g = 2 TO 79
        IF g <> 3 AND g <> 36 AND g <> 37 AND g <> 38 AND g <> 39 AND g <> 67 THEN inven(g) = 0
    NEXT
    inven(48) = 1
    inven(68) = 1
    SELECT CASE newpw
        CASE 1: inven(36) = 1
            CASE 2: inven(37) = 1
            CASE 3: inven(67) = 1
            CASE 4: inven(80) = 1
    END SELECT
    AnsiDraw "data\INTRO3.ANS"
    DO
        getone
    LOOP UNTIL r$ >= "1" AND r$ <= "4"
    SELECT CASE r$
        CASE "1":
            rmno$ = "1-003"
            AnsiDraw "data\EAGLE.ANS"
            CASE "2":
            rmno$ = "5-037-1"
            AnsiDraw "data\SHAGWOOD.ANS"
            CASE "3":
            rmno$ = "3-070"
            AnsiDraw "data\PHORAX.ANS"
            CASE ELSE:
            rmno$ = "2-095"
            AnsiDraw "data\DELIDIA.ANS"
    END SELECT
    shno$ = rmno$
    getone
    NewsReport "NEWS.TDY", "|08" + phandle$ + " woke up -- was it all just a dream?"
    pdef = 5
    pwpwk = 0
    parmstr = 0
    parmwk = 0
    pmindmg = 0
    pmaxdmg = 10
    peqp(1) = 48
    peqp(2) = 68
       IF DecryptText$(NAME$) = "GOD" THEN inven(3) = 1
    IF DecryptText$(NAME$) = "WYRDWAD" THEN
        inven(48) = 0
        inven(68) = 0
        inven(67) = 1
        inven(80) = 1
        peqp(1) = 67
        peqp(2) = 80
        parmwk = 6
        parmstr = 6
        pwpwk = 6
        pmindmg = 0
        pmaxdmg = 100
        pdef = 90
    END IF
    ELSE
    IF newpw = 5 THEN
        AnsiDraw "data\ENDING3.ANS"
        getone
    END IF
    rmno$ = "0-000"
    shno$ = "0-000"
    FOR g = 32 TO 35
        inven(G) = 0
    NEXT
    inven(39) = 1
    NewsReport "NEWS.TDY", "|15Thanks to " + phandle$ + ", the land is at peace... for now."
END IF
r$ = ""
pwins = newpw
IF turnsleft < 1000 THEN turnsleft = 250
IF turnsleft < 1000 AND DecryptText$(NAME$) = "WYRDWAD" THEN turnsleft = 25
IF turnsleft < 1000 AND DecryptText$(NAME$) = "TURNS" THEN turnsleft = 999
SaveUserData
AnsiDraw "data\BOTCALPH.ANS"
Healthometer 1, 61, 74
worldno = 99
DisplayRoom 2
END SUB

SUB YouDied STATIC
rmno$ = shno$
php = 0
pexp = pexp - (pexp \ 10)
pgold = pgold \ 2
ShowBotScores 0
AnsiDraw "data\YOU-DIED.ANS"
getone
AnsiDraw "data\BOTCEND.ANS"
getone
r$ = ""
endthis 1
END SUB

FUNCTION FileOPEN% (FileName$, Mode$)
STATIC CurrFileHandle%
IF _FILEEXISTS(FileName$)THEN
FileOPEN% = FREEFILE
OPEN Mode$, FREEFILE, FileName$
END IF
END FUNCTION

