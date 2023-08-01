' ELIZA: Keyword Editor       Version 1.0

' Refer to ELIZA.BAS for important crap.

DECLARE SUB Screen.Board ()
DECLARE FUNCTION String.Input$ (InputField$, Row!, Column!, Length!, Foreground!, Background!, ValidCharacters$, ReturnMode!, EntryMode!, CaseMode!)

DECLARE SUB Reply.Edit ()
DECLARE SUB Keyword.Add ()
DECLARE SUB Keyword.Delete ()
DECLARE SUB Keyword.Viewer ()
DECLARE SUB Reply.Add ()
DECLARE SUB Reply.Delete ()
DECLARE SUB Keyword.Edit ()
DECLARE SUB Data.Load ()
DECLARE SUB Screen.Center (Row!, Text$)
DECLARE SUB Data.Save ()
DECLARE SUB Screen.PrintAt (Row!, Column!, Text$)
DECLARE SUB Screen.PrintField (Row!, Column!, Text$, Length!)
DECLARE SUB Reply.Viewer ()
DECLARE FUNCTION System.FileOpen$ ()

StartProgram:
DIM SHARED NumberOfReplies(400)

DIM SHARED Keyword(400) AS STRING
DIM SHARED Reply(400, 9) AS STRING

COMMON SHARED NumberOfKeywords AS INTEGER
COMMON SHARED SelectedKeyword AS INTEGER
COMMON SHARED SelectedReply AS INTEGER

COMMON SHARED File.Name AS STRING



SUB Editor.Main
Initialization:
SelectedKeyword = 1
SelectedReply = 1

Screen.Board

EditorLoop:
Keyword.Viewer

DO
    KeyPress$ = UCASE$(INKEY$)
LOOP UNTIL KeyPress$ <> ""

SELECT CASE KeyPress$
CASE CHR$(0) + CHR$(72): 'Go Up'
    SelectedKeyword = SelectedKeyword - 1
    IF SelectedKeyword = 0 THEN SelectedKeyword = 1
    GOTO EditorLoop
CASE CHR$(0) + CHR$(80): 'Go Down'
    SelectedKeyword = SelectedKeyword + 1
    IF SelectedKeyword > NumberOfKeywords THEN SelectedKeyword = NumberOfKeywords
    GOTO EditorLoop
CASE CHR$(0) + CHR$(71): 'Home'
    SelectedKeyword = 1
    GOTO EditorLoop
CASE CHR$(0) + CHR$(79): 'End'
    SelectedKeyword = NumberOfKeywords
    GOTO EditorLoop
CASE CHR$(0) + CHR$(73): 'PageUp'
    SelectedKeyword = SelectedKeyword - 10
    IF SelectedKeyword <= 0 THEN SelectedKeyword = 1
    GOTO EditorLoop
CASE CHR$(0) + CHR$(81): 'PageDown'
    SelectedKeyword = SelectedKeyword + 10
    IF SelectedKeyword > NumberOfKeywords THEN SelectedKeyword = NumberOfKeywords
    GOTO EditorLoop
CASE CHR$(13): 'Move to Replies'
    SelectedReply = 1
    Reply.Viewer
    GOTO EditorLoop
CASE CHR$(0) + CHR$(82): 'INS'ert a new keyword
    Keyword.Add
    Reply.Add
    GOTO Initialization
CASE CHR$(0) + CHR$(83): 'DEL'ete a new keyword
    Keyword.Delete
    GOTO EditorLoop
CASE CHR$(9): 'Edit keyword'
    Keyword.Edit
    GOTO EditorLoop
CASE CHR$(27), " ": 'Exit'
    GOTO Quit
CASE ELSE
END SELECT
GOTO EditorLoop

Quit:
    VIEW PRINT 1 TO 25
    COLOR 7, 0: CLS
Data.Save
END SUB

SUB Data.Load

OPEN File.Name FOR INPUT AS #1


NumberOfKeywords = 0
DO
    NumberOfKeywords = NumberOfKeywords + 1
    LINE INPUT #1, Keyword(NumberOfKeywords)
    INPUT #1, NumberOfReplies(NumberOfKeywords)
    FOR X = 1 TO NumberOfReplies(NumberOfKeywords)
        LINE INPUT #1, Reply(NumberOfKeywords, X)
    NEXT X
LOOP UNTIL Keyword(NumberOfKeywords) = "NOKEYFOUND"
CLOSE #1

END SUB

SUB Data.Save

OPEN File.Name FOR OUTPUT AS #1

PRINT #1, File.Description
PRINT #1, File.Author
PRINT #1, File.Company
PRINT #1, File.EMail

FOR X = 1 TO NumberOfKeywords
    PRINT #1, Keyword(X)
    PRINT #1, NumberOfReplies(X)
    FOR Y = 1 TO NumberOfReplies(X)
        PRINT #1, Reply(X, Y)
    NEXT Y
NEXT X
CLOSE #1

END SUB

SUB Keyword.Add

'Create an empty reply
IF NumberOfKeywords = 400 THEN BEEP: EXIT SUB

'Create an empty keyword
NumberOfKeywords = NumberOfKeywords + 1
FOR X = NumberOfKeywords TO SelectedKeyword STEP -1
    Keyword(X) = Keyword(X - 1)
    FOR C = 1 TO 9
        Reply(X, C) = Reply(X - 1, C)
    NEXT C
    NumberOfReplies(X) = NumberOfReplies(X - 1)
NEXT X

Keyword(SelectedKeyword) = ""
FOR C = 1 TO 9
    Reply(SelectedKeyword, C) = ""
NEXT C
NumberOfReplies(SelectedKeyword) = 0

COLOR 15, 3
    Screen.PrintAt 25, 1, "Keyword: "

UserInput$ = Keyword(SelectedKeyword)
UserInput$ = String.Input$(UserInput$, 25, 10, 15, 1, 11, "", 4, 4, 2)
Keyword(SelectedKeyword) = UserInput$

END SUB

SUB Keyword.Delete

IF SelectedKeyword = NumberOfKeywords THEN BEEP: EXIT SUB

'Deletes a keyword
NumberOfKeywords = NumberOfKeywords - 1
FOR X = SelectedKeyword TO NumberOfKeywords
    Keyword(X) = Keyword(X + 1)
    FOR C = 1 TO 9
        Reply(X, C) = Reply(X + 1, C)
    NEXT C
    NumberOfReplies(X) = NumberOfReplies(X + 1)
NEXT X

IF SelectedKeyword > NumberOfKeywords THEN
    SelectedKeyword = NumberOfKeywords
END IF

END SUB

SUB Keyword.Edit

COLOR 31, 1
    Screen.PrintField 3, 2, "", 1

Keyword(SelectedKeyword) = String.Input$(Keyword(SelectedKeyword), 3, 3, 15, 15, 1, "", 4, 4, 2)

END SUB

SUB Keyword.Viewer

LOCATE , , 0
T = SelectedKeyword
FOR X = 3 TO 13
    IF T <= NumberOfKeywords AND T <> SelectedKeyword THEN
        COLOR 15, 0
        Screen.PrintField X, 2, " " + Keyword(T), 16
    ELSEIF T = SelectedKeyword THEN
        COLOR 15, 1
        Screen.PrintField 3, 2, "" + Keyword(T), 16
        COLOR 15, 0
        Screen.PrintField 15, 2, "" + Reply(T, 1), 78
        FOR Tm = 2 TO 9
            Screen.PrintField 14 + Tm, 3, Reply(T, Tm), 77
        NEXT Tm
    ELSE
        COLOR 15, 0
        Screen.PrintField X, 2, "", 16
    END IF
    T = T + 1
NEXT X

COLOR 0, 3
Screen.PrintAt 3, 18, ""
FOR X = 4 TO 12
    Screen.PrintAt X, 18, "²"
NEXT X
Screen.PrintAt 13, 18, ""
Screen.PrintAt INT(8 * (SelectedKeyword / NumberOfKeywords)) + 4, 18, "Û"

COLOR 15, 0
    Screen.PrintAt 2, 2, STR$(SelectedKeyword) + " Ä"

IF NumberOfReplies(SelectedKeyword) - 1 >= 9 THEN
    Screen.PrintAt 24, 77, "  "
ELSE
    Screen.PrintAt 24, 77, "ÄÄÄ"
END IF
Screen.PrintAt 14, 77, "ÄÄÄ"

COLOR 15, 3
Screen.PrintField 25, 1, "", 80

END SUB

SUB Reply.Add

'Create an empty reply
IF NumberOfReplies(SelectedKeyword) = 9 THEN BEEP: EXIT SUB

NumberOfReplies(SelectedKeyword) = NumberOfReplies(SelectedKeyword) + 1
FOR X = NumberOfReplies(SelectedKeyword) TO SelectedReply STEP -1
    Reply(SelectedKeyword, X) = Reply(SelectedKeyword, X - 1)
NEXT X

Reply(SelectedKeyword, SelectedReply) = ""

COLOR 15, 3
    Screen.PrintAt 25, 1, "Reply: "

UserInput$ = Reply(SelectedKeyword, SelectedReply)
UserInput$ = String.Input$(UserInput$, 25, 8, 71, 1, 11, "", 4, 4, 1)
Reply(SelectedKeyword, SelectedReply) = UserInput$

END SUB

SUB Reply.Delete

IF NumberOfReplies(SelectedKeyword) = 1 THEN BEEP: EXIT SUB
IF SelectedReply = NumberOfReplies(SelectedKeyword) THEN BEEP: EXIT SUB

'Deletes a reply
Reply(SelectedKeyword, SelectedReply) = ""

NumberOfReplies(SelectedKeyword) = NumberOfReplies(SelectedKeyword) - 1
FOR X = SelectedReply TO NumberOfReplies(SelectedKeyword)
    Reply(SelectedKeyword, X) = Reply(SelectedKeyword, X + 1)
NEXT X

Reply(SelectedKeyword, NumberOfReplies(SelectedKeyword) + 1) = ""

END SUB

SUB Reply.Edit

COLOR 31, 1
    Screen.PrintField 15, 2, "", 1

Reply(SelectedKeyword, SelectedReply) = String.Input$(Reply(SelectedKeyword, SelectedReply), 15, 3, 77, 15, 1, "", 4, 4, 1)

END SUB

SUB Reply.Viewer

Reply.Viewer.Loop:
GOSUB View.Replies
DO
    KeyPress$ = UCASE$(INKEY$)
LOOP UNTIL KeyPress$ <> ""

SELECT CASE KeyPress$
CASE CHR$(0) + CHR$(72): 'Go Up'
    SelectedReply = SelectedReply - 1
    IF SelectedReply = 0 THEN SelectedReply = 1
    GOTO Reply.Viewer.Loop
CASE CHR$(0) + CHR$(80): 'Go Down'
    SelectedReply = SelectedReply + 1
    IF SelectedReply > NumberOfReplies(SelectedKeyword) THEN SelectedReply = NumberOfReplies(SelectedKeyword)
    GOTO Reply.Viewer.Loop
CASE CHR$(0) + CHR$(71): 'Home'
    SelectedReply = 1
    GOTO Reply.Viewer.Loop
CASE CHR$(0) + CHR$(79): 'End'
    SelectedReply = NumberOfReplies(SelectedKeyword)
    GOTO Reply.Viewer.Loop
CASE CHR$(0) + CHR$(82): 'INS'ert a new reply
    Reply.Add
    GOTO Reply.Viewer.Loop
CASE CHR$(0) + CHR$(83): 'DEL'ete a reply
    Reply.Delete
    GOTO Reply.Viewer.Loop
CASE CHR$(9): 'Edit reply'
    Reply.Edit
    GOTO Reply.Viewer.Loop
CASE CHR$(27), " ": 'Exit'
    EXIT SUB
CASE ELSE
END SELECT
GOTO Reply.Viewer.Loop

SLEEP
SYSTEM

View.Replies:
LOCATE , , 0
T = SelectedReply
FOR X = 1 TO 9
    IF T <= NumberOfReplies(SelectedKeyword) AND T <> SelectedReply THEN
        COLOR 15, 0
        Screen.PrintField 14 + X, 3, Reply(SelectedKeyword, T), 77
    ELSEIF T = SelectedReply THEN
        COLOR 15, 1
        Screen.PrintField 15, 2, "" + Reply(SelectedKeyword, T), 77
    ELSE
        COLOR 15, 0
        Screen.PrintField 14 + X, 2, "", 77
    END IF
    T = T + 1
NEXT X

COLOR 15, 3
Screen.PrintField 25, 1, "", 80

RETURN

END SUB

SUB Screen.Board

COLOR 15, 3
    CLS
    Screen.Center 1, "ELIZA Keyword Editor"
COLOR 15, 0
    LOCATE 2, 1
    PRINT "ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿";
    PRINT "³                ³   I'm not good at writing instuctions, so I'll just give   ³";
    PRINT "³                 ³ you the list of keys you might need.                       ³";
    PRINT "³                 ³                                                            ³";
    PRINT "³                 ³   -- Keyword Window --          -- Replies Window --       ³";
    PRINT "³                 ³   <INS> = Adds keyword          <INS> = Adds reply         ³";
    PRINT "³                 ³   <DEL> = Deletes keyword       <DEL> = Deletes reply      ³";
    PRINT "³                 ³   <ESC> = Back to Eliza         <ESC> = Back to keywords   ³";
    PRINT "³                 ³  <ENTER>= Moves to replies                                 ³";
    PRINT "³                 ³   <TAB> = Edit's keyword        <TAB> = Edit's reply       ³";
    PRINT "³                 ³                                                            ³";
    PRINT "³                 ³ Note: An astericks at the end of a reply adds user input.  ³";
    PRINT "ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´";
    PRINT "³                                                                             ³";
    PRINT "³                                                                              ³";
    PRINT "³                                                                              ³";
    PRINT "³                                                                              ³";
    PRINT "³                                                                              ³";
    PRINT "³                                                                              ³";
    PRINT "³                                                                              ³";
    PRINT "³                                                                              ³";
    PRINT "³                                                                              ³";
    PRINT "ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ";

END SUB

SUB Screen.Box (Row1, Col1, Row2, Col2, Text$, Foreground, Background, TitleColor)

COLOR Foreground, Background
Screen.BoxWidth = Col2 - Col1 + 1

Screen.PrintAt Row1, Col1, "Ú" + STRING$(Screen.BoxWidth - 2, "Ä") + "¿"

FOR A = Row1 + 1 TO Row2 - 1
        Screen.PrintAt A, Col1, "³" + SPACE$(Screen.BoxWidth - 2) + "³"
NEXT A

Screen.PrintAt Row2, Col1, "À" + STRING$(Screen.BoxWidth - 2, "Ä") + "Ù"

COLOR 1, 0
FOR X = Row1 + 1 TO Row2 + 1
    Screen.PrintAt X, Col2 + 1, CHR$(176)
NEXT X
Screen.PrintAt Row2 + 1, Col1 + 1, STRING$(Screen.BoxWidth, CHR$(176))

IF Text$ <> "" THEN
    COLOR TitleColor, Background
    Screen.PrintAt Row1, INT((Col1 + Col2) / 2) - ((LEN(Text$) + 2) / 2), " " + Text$ + " "
END IF

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

SUB Screen.ScrollBar (Length, Selected, Maximum, Row, Column)

COLOR 0, 3

Screen.PrintAt Row, Column, ""
FOR X = Row + 1 TO Row + Length
    Screen.PrintAt X, Column, "²"
NEXT X
Screen.PrintAt Row + Length + 1, Column, ""

COLOR 9, 9

X = INT((Length - 1) * (Selected / Maximum)) + Row + 1
Screen.PrintAt 1, 1, STR$(X)
Screen.PrintAt X, Column, "Û"

END SUB

FUNCTION String.Input$ (InputField$, Row, Column, Length, Foreground, Background, ValidCharacters$, ReturnMode, EntryMode, CaseMode)

True = 1                             ' logical true
False = 0                            ' logical false

EnterKey$ = CHR$(13)                  ' signifies end of entry
Escape$ = CHR$(27)                    ' emergency exit from function
EraseToEOReply$ = CHR$(20)            ' ^T erase from cursor to EOF
RestoreField$ = CHR$(18)              ' ^R restore original field
EraseField$ = CHR$(25)                ' ^Y erase entire field
BackSpace$ = CHR$(8)                  ' dragging, destructive backspace
RightArrow$ = "M"                     ' input cursor right
LeftArrow$ = "K"                      ' input cursor left
InsertKey$ = "R"                      ' insert mode toggle
DeleteKey$ = "S"                      ' character delete
HomeKey$ = "G"                        ' input cursor start of field
EndKey$ = "O"                         ' input cursor after last char

    InputFinished = False               ' set to true on enter or escape
    InsertMode = False                  ' start off in insert off mode

    InputField$ = InputField$ + SPACE$(Length - LEN(InputField$))
    OriginalField$ = InputField$          ' for ^R restore original field
    Length = LEN(InputField$)            ' total input field length
    CurrentColumn = Column              ' cursor at first entry column
    CursorPosition = 1                   ' 1st position in entry string
    EndColumn = Column + Length - 1    ' last column in entry string

    COLOR Foreground, Background        ' set specified colors
    LOCATE Row, Column, 0               ' locate cursor
    PRINT InputField$;                    ' display original field
    LOCATE Row, Column, 1, 6, 7       ' locate at first character

    WHILE InputFinished = False         ' main loop

       InputKey$ = INKEY$                 ' get a keystroke if present
       EditKey$ = MID$(InputKey$, 2, 1)   ' editing key pressed?

       IF EditKey$ <> "" THEN

          SELECT CASE EditKey$

             CASE RightArrow$
                IF CurrentColumn <= EndColumn THEN
                   CurrentColumn = CurrentColumn + 1
                   CursorPosition = CursorPosition + 1
                   LOCATE Row, CurrentColumn, 1
                END IF

             CASE LeftArrow$
                IF CurrentColumn > Column THEN
                   CurrentColumn = CurrentColumn - 1
                   CursorPosition = CursorPosition - 1
                   LOCATE Row, CurrentColumn, 1
                END IF

             CASE InsertKey$
                IF InsertMode = True THEN
                   LOCATE Row, CurrentColumn, 1, 6, 7
                   InsertMode = False
                ELSE
                   LOCATE Row, CurrentColumn, 1, 3, 7
                   InsertMode = True
                END IF

             CASE DeleteKey$
                IF CurrentColumn <= EndColumn THEN
                   FOR Index = CursorPosition TO Length - 1
                       MID$(InputField$, Index, 1) = MID$(InputField$, Index + 1, 1)
                   NEXT Index
                   MID$(InputField$, Length, 1) = " "
                   LOCATE Row, Column, 0
                   PRINT InputField$;
                   LOCATE Row, CurrentColumn, 1
                END IF

             CASE HomeKey$
                IF CursorPosition > 1 THEN
                   CurrentColumn = Column
                   CursorPosition = 1
                   LOCATE Row, CurrentColumn, 1
                END IF

             CASE EndKey$
                IF CursorPosition < Length THEN
                   FOR Index = Length TO 1 STEP (-1)
                       IF MID$(InputField$, Index, 1) <> " " THEN
                          EXIT FOR
                       END IF
                   NEXT Index
                   CursorPosition = Index + 1
                   CurrentColumn = Column + Index
                   LOCATE Row, CurrentColumn, 1
                END IF
      
          END SELECT

       ELSE

          SELECT CASE InputKey$
             CASE BackSpace$
                IF CurrentColumn > Column THEN
                   N$ = ""
                   FOR Index = 1 TO CursorPosition - 2
                       N$ = N$ + MID$(InputField$, Index, 1)
                   NEXT Index
                   FOR Index = CursorPosition TO Length
                       N$ = N$ + MID$(InputField$, Index, 1)
                   NEXT Index
                   InputField$ = LEFT$(N$ + SPACE$(Length), Length)
                   CurrentColumn = CurrentColumn - 1
                   CursorPosition = CursorPosition - 1
                   LOCATE Row, Column, 0
                   PRINT InputField$;
                   LOCATE Row, CurrentColumn, 1
                END IF

             CASE EraseField$
                InputField$ = SPACE$(Length)
                LOCATE Row, Column, 0
                PRINT InputField$;
                CursorPosition = 1
                CurrentColumn = Column
                LOCATE Row, Column, 1

             CASE EraseToEOReply$
                IF CurrentColumn <= EndColumn THEN
                   MID$(InputField$, CursorPosition, Length - CursorPosition + 1) = SPACE$(Length - CursorPosition + 1)
                   LOCATE Row, Column
                   PRINT InputField$;
                   LOCATE Row, CurrentColumn, 1
                END IF

             CASE Escape$, RestoreField$
                InputField$ = OriginalField$
                LOCATE Row, Column, 0
                PRINT InputField$;
                CursorPosition = 1
                CurrentColumn = Column
                LOCATE Row, Column, 1

             CASE CHR$(9)
             CASE EnterKey$
                InputFinished = True

             CASE ELSE

                ValidKey = False
'               null string for valid characters means all input accepted
                IF ValidCharacters$ = "" OR INSTR(ValidCharacters$, UCASE$(InputKey$)) > 0 THEN
                   ValidKey = True
                END IF
          
                IF ValidKey = True AND InputKey$ <> "" AND CurrentColumn <= EndColumn THEN
                                    
                   SELECT CASE CaseMode
                      CASE 1
                         ' do nothing, accept as entered
                      CASE 2
                         InputKey$ = UCASE$(InputKey$)
                      CASE 3
                         InputKey$ = LCASE$(InputKey$)
                   END SELECT

                   SELECT CASE InsertMode
                      CASE True
                         InputField$ = LEFT$(InputField$, CursorPosition - 1) + InputKey$ + RIGHT$(InputField$, Length - CursorPosition + 1)
                         InputField$ = LEFT$(InputField$, Length)
                         LOCATE Row, Column
                         PRINT InputField$;
                      CASE False
                         PRINT InputKey$;
                         MID$(InputField$, CursorPosition, 1) = InputKey$
                   END SELECT

                   CursorPosition = CursorPosition + 1
                   CurrentColumn = CurrentColumn + 1
                   LOCATE Row, CurrentColumn, 1

'                  check entry mode to see if end of field entry terminates entry
                   IF CurrentColumn > EndColumn AND EntryMode = 2 THEN
                      InputFinished = True
                   END IF

                END IF

          END SELECT

       END IF

    WEND

'   return entered string appropriately

    SELECT CASE ReturnMode

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
          FOR Index = 1 TO Length
              IF MID$(InputField$, Index, 1) <> " " THEN
                 N$ = N$ + MID$(InputField$, Index, 1)
              END IF
          NEXT Index
          String.Input$ = N$

       CASE 6     ' left justify and kill blanks between 1st and last char
          N$ = ""
          FOR Index = 1 TO Length
              IF MID$(InputField$, Index, 1) <> " " THEN
                 N$ = N$ + MID$(InputField$, Index, 1)
              END IF
          NEXT Index
          String.Input$ = RIGHT$(N$ + SPACE$(Length), Length)

       CASE 7     ' right justify and kill inner blanks
          N$ = ""
          FOR Index = 1 TO Length
              IF MID$(InputField$, Index, 1) <> " " THEN
                 N$ = N$ + MID$(InputField$, Index, 1)
              END IF
          NEXT Index
          String.Input$ = RIGHT$(SPACE$(Length) + N$, Length)

    END SELECT

EndHere:


END FUNCTION

FUNCTION System.FileOpen$

DIM System.Files(100) AS STRING

SHELL "DIR /B *.ELZ>DIRECT.TMP"

OPEN "DIRECT.TMP" FOR INPUT AS #1
Temp = 0
DO
    Temp = Temp + 1
    INPUT #1, System.Files(Temp)
LOOP UNTIL EOF(1)
CLOSE #1
KILL "DIRECT.TMP"

IF Temp = 1 THEN
    System.FileOpen$ = System.Files(Temp)
    ERASE System.Files
    EXIT FUNCTION
END IF

LOCATE 1, 1, 0

COLOR 15, 3
    CLS
    Screen.Center 1, "ELIZA File Open"
COLOR 15, 0
    LOCATE 2, 1
    PRINT "ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿";
    PRINT "³                ³                                                            ³";
    PRINT "³                 ³                                                            ³";
    PRINT "³                 ³                                                            ³";
    PRINT "³                 ³                                                            ³";
    PRINT "³                 ³                                                            ³";
    PRINT "³                 ³                                                            ³";
    PRINT "³                 ³                                                            ³";
    PRINT "³                 ³                                                            ³";
    PRINT "³                 ³                                                            ³";
    PRINT "³                 ³                                                            ³";
    PRINT "³                 ³                                                            ³";
    PRINT "ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´";
    PRINT "³                                                                              ³";
    PRINT "³           File Name:                                                         ³";
    PRINT "³                                                                              ³";
    PRINT "³         File Author:                                                         ³";
    PRINT "³                                                                              ³";
    PRINT "³    Author's Company:                                                         ³";
    PRINT "³                                                                              ³";
    PRINT "³      E-Mail Address:                                                         ³";
    PRINT "³                                                                              ³";
    PRINT "ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ";

SelectedFile = 1

FileOpenScroll:
T = SelectedFile
FOR X = 3 TO 13
    IF T <= Temp AND T <> SelectedFile THEN
        COLOR 15, 0
        Screen.PrintField X, 2, " " + System.Files(T), 17
    ELSEIF T = SelectedFile THEN
        COLOR 15, 1
        Screen.PrintField X, 2, "" + System.Files(T), 17
    ELSE
        COLOR 15, 0
        Screen.PrintAt X, 2, SPACE$(17)
    END IF
    T = T + 1
NEXT X

DO
    KeyPress$ = UCASE$(INKEY$)
LOOP UNTIL KeyPress$ <> ""

SELECT CASE KeyPress$
CASE CHR$(0) + CHR$(72): 'Go Up'
    SelectedFile = SelectedFile - 1
    IF SelectedFile = 0 THEN SelectedFile = 1
    GOTO FileOpenScroll
CASE CHR$(0) + CHR$(80): 'Go Down'
    SelectedFile = SelectedFile + 1
    IF SelectedFile > Temp THEN SelectedFile = Temp
    GOTO FileOpenScroll
CASE CHR$(0) + CHR$(71): 'Home'
    SelectedFile = 1
    GOTO FileOpenScroll
CASE CHR$(0) + CHR$(79): 'End'
    SelectedFile = Temp
    GOTO FileOpenScroll
CASE CHR$(0) + CHR$(81): 'Page Down'
    SelectedFile = SelectedFile + 10
    IF SelectedFile > Temp THEN SelectedFile = Temp
    GOTO FileOpenScroll
CASE CHR$(0) + CHR$(73): 'Page Up'
    SelectedFile = SelectedFile - 10
    IF SelectedFile = 0 THEN SelectedFile = 1
    GOTO FileOpenScroll
CASE CHR$(13): 'Enter'
    System.FileOpen$ = System.Files(SelectedFile)
    ERASE System.Files
    EXIT FUNCTION
CASE ELSE
    GOTO FileOpenScroll
END SELECT

SLEEP

END FUNCTION

