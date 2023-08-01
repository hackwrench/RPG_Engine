' ELIZA: Computer Therapist   Version 9.3
'
' SORRY!!!, but series 8.x had an error in it that produced less
' than accurate replies. I fixed it and improved on it in version 9.
'
' I have had to keep the maximum number of keywords to 400
' and the maximum number of replies for each keyword to 15.
' I've tried to figure out how to use XMS and EMS for storing arrays
' but I haven't a clue. If someone can help, or has a program that
' has a practical example in it, contact me.
'
' Address: Daniel Fletcher
'          XYZZY Productions
'          P.O. Box 208
'          Taberg, NY  13471 (USA)
'
' E-Mail: danielfletcher@cyberdude.com   {E-Mail me for updates
'         xyzzyproductions@hotmail.com    to automatically be sent
'                                         to you.}
'
' Web site: http://www.geocities.com/SiliconValley/Vista/3048/
'
' Birthday: 7-15-1981
'
' I've been working on this program since I was in middle school.
' It's based on a program I saw in a book in the school library, but their
' version sucked big time, so I decided to write a cooler one.
' The book it was from was over twenty years old, so at the
' time it might have been pretty good.
'
' I decided to upload it because one of the first programs I downloaded
' from the The Q-Basic Page [www.qbasic.com] was one called 'CHAT'
' by Mallard.  You may have gotten this from there. E-Mail and tell me
' where you found this copy.
'

DECLARE SUB Data.Load ()
DECLARE SUB Screen.Board ()
DECLARE SUB Screen.Center (Row!, Text$)
DECLARE SUB Screen.PrintAt (Row!, Column!, Text$)
DECLARE SUB Screen.PrintField (Row!, Column!, Text$, Length!)
DECLARE SUB Screen.PrintReply (Text$)
DECLARE SUB Screen.Sides ()
DECLARE SUB String.RemoveCharacter (Char$)
DECLARE SUB String.TeleType (Text$, Delay!)
DECLARE FUNCTION System.FileOpen$ ()
DECLARE FUNCTION String.Input$ (Row%, Column%, Length%, Foreground%, Background%, ValidCharacters$, ReturnMode%, EntryMode%, CaseMode%)

StartProgram:


DIM SHARED DimSize AS INTEGER

DIM SHARED UsedReplies(400)
DIM SHARED NumberOfReplies(400) AS INTEGER

DIM SHARED Keyword(400) AS STRING
DIM SHARED Reply(400, 9) AS STRING
DIM SHARED Conjugate(7)  AS STRING
DIM SHARED Conjugation(7) AS STRING

COMMON SHARED NumberOfKeywords AS INTEGER
COMMON SHARED NumberOfConjugations AS INTEGER
COMMON SHARED SelectedKeyword AS INTEGER
COMMON SHARED SelectedReply AS INTEGER
COMMON SHARED ComputersReply AS STRING
COMMON SHARED UserInput AS STRING * 78

COMMON SHARED Filenane AS STRING

CLEAR

Data.Load

Initialization:
KEY 1, "> Help" + CHR$(13)
KEY 2, "> Editor" + CHR$(13)
KEY 3, "> Restart" + CHR$(13)
KEY 31, "> Quit" + CHR$(13)



VIEW PRINT
Screen.Board
VIEW PRINT 3 TO 23
ComputersReply = "Hi!  I'm Eliza. What's your problem?"
Screen.PrintAt CSRLIN, 4, ComputersReply

UserInput:
PRINT
Screen.Sides
UserInput = String.Input$(CSRLIN, 2, 78, 1, 11, "", 4, 2, 1)
IF INSTR(UserInput, "> Help") THEN
    Screen.PrintReply "Not until version 10.1... :-("
    GOTO UserInput
ELSEIF INSTR(UserInput, "> Editor") THEN
    Editor.Main
ELSEIF INSTR(UserInput, "> Restart") THEN
    GOTO Initialization
ELSEIF INSTR(UserInput, "> Quit") THEN
    GOTO Quit
ELSE
    UserInput = " " + UCASE$(UserInput) + "  "
END IF

' This section takes out punctuation characters that can get in the way
String.RemoveCharacter "'!.,?~`:;"

' This section finds the keyword it wants to use to select reply.
' It's pretty primitive, but better than some others
S = 0
FOR SelectedKeyword = 1 TO NumberOfKeywords
    IF S <> 0 AND INT(RND * 100) > 50 THEN
    ELSE
        IF INSTR(UserInput, " " + Keyword(SelectedKeyword) + " ") > 0 THEN S = SelectedKeyword: T = INSTR(UserInput, Keyword(SelectedKeyword)): ComputersReply = Keyword(SelectedKeyword)
    END IF
NEXT SelectedKeyword
   
IF S > 0 THEN SelectedKeyword = S: L = T: GOTO SearchHere
SelectedKeyword = NumberOfKeywords: GOTO Screen.PrintReply: REM WE DIDN'T FIND ANY KEYWORDS

' If a keyword was selected, changes conjugates just in case computer
' repeats part of the users speech
SearchHere:
    C$ = " " + RIGHT$(UserInput, LEN(UserInput) - LEN(ComputersReply) - L + 1) + " "
    FOR x = 1 TO NumberOfPhrases
        S$ = Conjugate(x)
        r$ = Conjugation(x)
    FOR L = 1 TO LEN(C$)
    IF L + LEN(S$) > LEN(C$) THEN GOTO XTemp
    IF MID$(C$, L, LEN(S$)) <> S$ THEN GOTO XTemp
    C$ = LEFT$(C$, L - 1) + r$ + RIGHT$(C$, LEN(C$) - L - LEN(S$) + 1)
    L = L + LEN(r$)
    GOTO LLoop
XTemp:
    IF L + LEN(r$) > LEN(C$) THEN GOTO LLoop
    IF MID$(C$, L, LEN(r$)) <> r$ THEN GOTO LLoop
    C$ = LEFT$(C$, L - 1) + S$ + RIGHT$(C$, LEN(C$) - L - LEN(r$) + 1)
    L = L + LEN(S$)
LLoop:
    NEXT L
    NEXT x
    IF MID$(C$, 2, 1) = " " THEN C$ = RIGHT$(C$, LEN(C$) - 1): REM ONLY ONE SPACE
    FOR L = 1 TO LEN(C$)
    DO WHILE MID$(C$, L, 1) = "!"
        C$ = LEFT$(C$, L - 1) + RIGHT$(C$, LEN(C$) - L)
    LOOP
    NEXT L

'Prints the reply to the user, resets used replies for a keyword if used up
Screen.PrintReply:
ComputersReply = Reply(SelectedKeyword, UsedReplies(SelectedKeyword))
UsedReplies(SelectedKeyword) = UsedReplies(SelectedKeyword) + 1

IF UsedReplies(SelectedKeyword) > NumberOfReplies(SelectedKeyword) THEN
    UsedReplies(SelectedKeyword) = 1
END IF

IF RIGHT$(ComputersReply, 1) = "*" THEN
    ComputersReply = LEFT$(ComputersReply, LEN(ComputersReply) - 1) + RTRIM$(LCASE$(C$))
END IF
Screen.PrintReply ComputersReply
GOTO UserInput

Quit:
VIEW PRINT 1 TO 25
COLOR 7, 0: CLS
SYSTEM

ConjugateData:
DATA " ARE ", " AM "
DATA "WHERE ","WAS "
DATA " YOU "," I "
DATA "YOUR ","MY "
DATA " IVE "," YOUVE "
DATA " IM "," YOURE "
DATA " ME "," YOU "

SUB Data.Load

OPEN "ELIZA.ELZ" FOR INPUT AS #1


NumberOfKeywords = 0
DO
    NumberOfKeywords = NumberOfKeywords + 1
    LINE INPUT #1, Keyword(NumberOfKeywords)
    INPUT #1, NumberOfReplies(NumberOfKeywords)
    FOR x = 1 TO NumberOfReplies(NumberOfKeywords)
        LINE INPUT #1, Reply(NumberOfKeywords, x)
    NEXT x
    UsedReplies(NumberOfKeywords) = INT(RND * NumberOfReplies(NumberOfKeywords)) + 1
LOOP UNTIL Keyword(NumberOfKeywords) = "NOKEYFOUND"
CLOSE #1

RESTORE ConjugateData
NumberOfConjugations = 7
FOR x = 1 TO NumberOfConjugations
    READ Conjugate(x)
    READ Conjugation(x)
NEXT x

END SUB



SUB Screen.Board

LOCATE , , 0

COLOR 15, 3
    Screen.PrintField 1, 1, "", 80
    Screen.Center 1, "ELIZA: Computer Therapist  Version 10.0á"
    Screen.PrintField 25, 1, " <F2=Editor> ³ <F1=Help> <F3=Restart> <F12=Exit>", 80
COLOR 15, 1
    Screen.PrintAt 2, 1, "Ú" + STRING$(78, "Ä") + "¿"
    FOR Y = 3 TO 23
        Screen.PrintAt Y, 1, "³"
        Screen.PrintField Y, 2, "", 78
        Screen.PrintAt Y, 80, "³"
    NEXT Y
    Screen.PrintAt 24, 1, "À" + STRING$(78, "Ä") + "Ù"
END SUB

SUB Screen.Center (Row, Text$)
    LOCATE Row, 41 - LEN(Text$) / 2
    PRINT Text$;
END SUB

SUB Screen.PrintAt (Row, Column, Text$)
    LOCATE Row, Column
    PRINT (Text$);
END SUB

SUB Screen.PrintField (Row, Column, Text$, Length)
    LOCATE Row, Column
    PRINT Text$ + SPACE$(Length - LEN(Text$));
END SUB

SUB Screen.PrintReply (Text$)

COLOR 15, 1
PRINT
Screen.Sides
LOCATE CSRLIN, 4
String.TeleType Text$, 0

END SUB

SUB Screen.Sides

ty = CSRLIN
tx = POS(0)

FOR Y = 3 TO 23
    Screen.PrintAt Y, 1, "³"
    Screen.PrintAt Y, 80, "³"
NEXT Y

LOCATE ty, tx

END SUB

FUNCTION String.Input$ (Row%, Column%, Length%, Foreground%, Background%, ValidCharacters$, ReturnMode%, EntryMode%, CaseMode%)
    
    True% = 1                             ' logical true
    False% = 0                            ' logical false

    EnterKey$ = CHR$(13)                  ' signifies end of entry
    Escape$ = CHR$(27)                    ' emergency exit from function
    EraseToEOReply$ = CHR$(20)                ' ^T erase from cursor to EOF
    RestoreField$ = CHR$(18)              ' ^UsedReplies restore original field
    EraseField$ = CHR$(25)                ' ^Y erase entire field
    BackSpace$ = CHR$(8)                  ' dragging, destructive backspace
    RightArrow$ = "M"                     ' input cursor right
    LeftArrow$ = "K"                      ' input cursor left
    InsertKey$ = "UsedReplies"                      ' insert mode toggle
    DeleteKey$ = "S"                      ' character delete
    HomeKey$ = "G"                        ' input cursor start of field
    EndKey$ = "O"                         ' input cursor after last char

    InputFinished% = False%               ' set to true on enter or escape
    InsertMode% = False%                  ' start off in insert off mode

    InputField$ = SPACE$(Length%)
    OriginalField$ = InputField$          ' for ^UsedReplies restore original field
    Length% = LEN(InputField$)            ' total input field length
    CurrentColumn% = Column%              ' cursor at first entry column
    CursorPosition% = 1                   ' 1st position in entry string
    EndColumn% = Column% + Length% - 1    ' last column in entry string

    COLOR Foreground%, Background%        ' set specified colors
    LOCATE Row%, Column%, 0               ' locate cursor
    PRINT InputField$;                    ' display original field
    LOCATE Row%, Column%, 1, 6, 7         ' locate at first character

    WHILE InputFinished% = False%         ' main loop

       InputKey$ = INKEY$                 ' get a keystroke if present
       EditKey$ = MID$(InputKey$, 2, 1)   ' editing key pressed?

       IF EditKey$ <> "" THEN

          SELECT CASE EditKey$

             CASE RightArrow$
                IF CurrentColumn% <= EndColumn% THEN
                   CurrentColumn% = CurrentColumn% + 1
                   CursorPosition% = CursorPosition% + 1
                   LOCATE Row%, CurrentColumn%, 1
                END IF

             CASE LeftArrow$
                IF CurrentColumn% > Column% THEN
                   CurrentColumn% = CurrentColumn% - 1
                   CursorPosition% = CursorPosition% - 1
                   LOCATE Row%, CurrentColumn%, 1
                END IF

             CASE InsertKey$
                IF InsertMode% = True% THEN
                   LOCATE Row%, CurrentColumn%, 1, 6, 7
                   InsertMode% = False%
                ELSE
                   LOCATE Row%, CurrentColumn%, 1, 3, 7
                   InsertMode% = True%
                END IF

             CASE DeleteKey$
                IF CurrentColumn% <= EndColumn% THEN
                   FOR Index% = CursorPosition% TO Length% - 1
                       MID$(InputField$, Index%, 1) = MID$(InputField$, Index% + 1, 1)
                   NEXT Index%
                   MID$(InputField$, Length%, 1) = " "
                   LOCATE Row%, Column%, 0
                   PRINT InputField$;
                   LOCATE Row%, CurrentColumn%, 1
                END IF

             CASE HomeKey$
                IF CursorPosition% > 1 THEN
                   CurrentColumn% = Column%
                   CursorPosition% = 1
                   LOCATE Row%, CurrentColumn%, 1
                END IF

             CASE EndKey$
                IF CursorPosition% < Length% THEN
                   FOR Index% = Length% TO 1 STEP (-1)
                       IF MID$(InputField$, Index%, 1) <> " " THEN
                          EXIT FOR
                       END IF
                   NEXT Index%
                   CursorPosition% = Index% + 1
                   CurrentColumn% = Column% + Index%
                   LOCATE Row%, CurrentColumn%, 1
                END IF

          END SELECT

       ELSE

          SELECT CASE InputKey$

             CASE Escape$
                InputField$ = SPACE$(Length%)
                LOCATE Row%, Column%, 0
                PRINT InputField$;
                CursorPosition% = 1
                CurrentColumn% = Column%
                LOCATE Row%, Column%, 1

             CASE BackSpace$
                IF CurrentColumn% > Column% THEN
                   N$ = ""
                   FOR Index% = 1 TO CursorPosition% - 2
                       N$ = N$ + MID$(InputField$, Index%, 1)
                   NEXT Index%
                   FOR Index% = CursorPosition% TO Length%
                       N$ = N$ + MID$(InputField$, Index%, 1)
                   NEXT Index%
                   InputField$ = LEFT$(N$ + SPACE$(Length%), Length%)
                   CurrentColumn% = CurrentColumn% - 1
                   CursorPosition% = CursorPosition% - 1
                   LOCATE Row%, Column%, 0
                   PRINT InputField$;
                   LOCATE Row%, CurrentColumn%, 1
                END IF

             CASE EraseField$
                InputField$ = SPACE$(Length%)
                LOCATE Row%, Column%, 0
                PRINT InputField$;
                CursorPosition% = 1
                CurrentColumn% = Column%
                LOCATE Row%, Column%, 1

             CASE EraseToEOReply$
                IF CurrentColumn% <= EndColumn% THEN
                   MID$(InputField$, CursorPosition%, Length% - CursorPosition% + 1) = SPACE$(Length% - CursorPosition% + 1)
                   LOCATE Row%, Column%
                   PRINT InputField$;
                   LOCATE Row%, CurrentColumn%, 1
                END IF

             CASE RestoreField$
                InputField$ = OriginalField$
                LOCATE Row%, Column%, 0
                PRINT InputField$;
                CursorPosition% = 1
                CurrentColumn% = Column%
                LOCATE Row%, Column%, 1

             CASE EnterKey$
                InputFinished% = True%

             CASE ELSE

                ValidKey% = False%
'               null string for valid characters means all input accepted
                IF ValidCharacters$ = "" OR INSTR(ValidCharacters$, UCASE$(InputKey$)) > 0 THEN
                  
                   ValidKey% = True%
                END IF
              
                IF ValidKey% = True% AND InputKey$ <> "" AND CurrentColumn% <= EndColumn% THEN
                                        
                   SELECT CASE CaseMode%
                      CASE 1
                         ' do nothing, accept as entered
                      CASE 2
                         InputKey$ = UCASE$(InputKey$)
                      CASE 3
                         InputKey$ = LCASE$(InputKey$)
                   END SELECT

                   SELECT CASE InsertMode%
                      CASE True%
                         InputField$ = LEFT$(InputField$, CursorPosition% - 1) + InputKey$ + RIGHT$(InputField$, Length% - CursorPosition% + 1)
                         InputField$ = LEFT$(InputField$, Length%)
                         LOCATE Row%, Column%
                         PRINT InputField$;
                      CASE False%
                         PRINT InputKey$;
                         MID$(InputField$, CursorPosition%, 1) = InputKey$
                   END SELECT

                   CursorPosition% = CursorPosition% + 1
                   CurrentColumn% = CurrentColumn% + 1
                   LOCATE Row%, CurrentColumn%, 1

'                  check entry mode to see if end of field entry terminates entry
                   IF CurrentColumn% > EndColumn% AND EntryMode% = 2 THEN
                      InputFinished% = True%
                   END IF

                END IF

          END SELECT

       END IF

    WEND

'   return entered string appropriately

    SELECT CASE ReturnMode%

       CASE 1     ' return entire field
          String.Input$ = InputField$

       CASE 2     ' return field less any trailing blanks
          String.Input$ = RTRIM$(InputField$)

       CASE 3     ' return field less any leading blanks
          String.Input$ = LTRIM$(InputField$)

       CASE 4     ' return field less both leading and trailing blanks
          String.Input$ = LTRIM$(RTRIM$(InputField$))

       CASE 5     ' return field with all blanks removed
          N$ = ""
          FOR Index% = 1 TO Length%
              IF MID$(InputField$, Index%, 1) <> " " THEN
                 N$ = N$ + MID$(InputField$, Index%, 1)
              END IF
          NEXT Index%
          String.Input$ = N$

       CASE 6     ' left justify and kill blanks between 1st and last char
          N$ = ""
          FOR Index% = 1 TO Length%
              IF MID$(InputField$, Index%, 1) <> " " THEN
                 N$ = N$ + MID$(InputField$, Index%, 1)
              END IF
          NEXT Index%
          String.Input$ = RIGHT$(N$ + SPACE$(Length%), Length%)

       CASE 7     ' right justify and kill inner blanks
          N$ = ""
          FOR Index% = 1 TO Length%
              IF MID$(InputField$, Index%, 1) <> " " THEN
                 N$ = N$ + MID$(InputField$, Index%, 1)
              END IF
          NEXT Index%
          String.Input$ = RIGHT$(SPACE$(Length%) + N$, Length%)

    END SELECT

END FUNCTION

SUB String.RemoveCharacter (Char$)


FOR C = 1 TO LEN(Char$)
    FOR L = 1 TO LEN(UserInput)
        DO WHILE MID$(UserInput, L, 1) = MID$(Char$, C, 1)
            UserInput = LEFT$(UserInput, L - 1) + RIGHT$(UserInput, LEN(UserInput) - L)
        LOOP
    NEXT L
NEXT C


END SUB

SUB String.TeleType (Text$, Delay)

    d! = Delay

'   change delay to 100ths second
    d! = d! / 100

'   print text 1 char at a time, with a "click" after non-space characters

    FOR x% = 1 TO LEN(Text$)

        T$ = MID$(Text$, x%, 1)
        PRINT T$;

        CurrentTimer! = TIMER

'       delay appropriate time
        WHILE TIMER < (CurrentTimer! + d!)
        WEND

'       stop delaying if a key is pressed
        IF INKEY$ <> "" THEN
           d! = 0
        END IF

    NEXT x%

END SUB

