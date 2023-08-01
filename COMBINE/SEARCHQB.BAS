DEFINT A-Z
DECLARE FUNCTION GETPSP%
DIM Array%(0 TO 255)


DEF SEG
Temp& = 25000
'DEF SEG = GETPSP
 'Temp& = 39000

GOTO AutoSearch
DO
  SCREEN 0
  Temp& = Temp& + 250
 PRINT Temp&
FOR I& = Temp& TO Temp& + 250
IF PEEK(I&) = 0 THEN
   COLOR 4
ELSEIF PEEK(I&) = 9 THEN
COLOR 5
ELSE
COLOR 7
END IF
PRINT PEEK(I&);
NEXT I&
DO: LOOP UNTIL INKEY$ <> ""
SCREEN 9
FOR I& = Temp& TO Temp& + 250
IF PEEK(I&) = 9 THEN COLOR 4 ELSE COLOR 7
PRINT PEEK(I&);
NEXT I&
DO: LOOP UNTIL INKEY$ <> ""
LOOP
END
AutoSearch:
ModetoTry% = 1
FOR I& = 7360 AND NOT &HFF TO &HFFFF&

    SCREEN 0
    Array%(I& AND &HFF) = PEEK(I&)
    IF (I& AND &HFF) = &HFF THEN
       SCREEN ModetoTry%
       FOR n% = 0 TO 255
       IF PEEK((I& AND NOT &HFF) + n%) = ModetoTry% AND Array%(n%) = 0 THEN
          PRINT (I& AND NOT &HFF) + n%: END
        
       END IF
       NEXT n
       SCREEN 0
    END IF
NEXT
PRINT

