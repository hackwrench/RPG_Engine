DEFINT A-Z
'$DYNAMIC
TYPE PalValue
    red   AS STRING * 1
    green AS STRING * 1
    blue  AS STRING * 1
END TYPE

DECLARE FUNCTION FileOPEN% (Filename$, Mode$)
DECLARE SUB SetPal (Entry%, Value AS ANY)
DECLARE SUB GETPAL (Entry%, Value AS ANY)

DIM SHARED screenmode%

SUB delay (DelTime!)
dtx! = TIMER
WHILE TIMER < dtx! + DelTime!: WEND
END SUB

FUNCTION FileOPEN% (Filename$, Mode$)
    FileOPEN% = FREEFILE
    OPEN Mode$, FREEFILE, Filename$
END FUNCTION

SUB GETPAL (Entry%, Value AS PalValue)
   OUT &H3C7, Entry%                   'tell controller to get ready
   Temp% = INP(&H3C9)              'get red component
   Value.red = CHR$(Temp%)
   Temp% = INP(&H3C9)
   Value.green = CHR$(Temp%)       'get green component
   Temp% = INP(&H3C9)     'get blue component
   Value.blue = CHR$(Temp%)
END SUB

SUB MCOLOR (forecolor%, backcolor%)
    SELECT CASE screenmode%
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

SUB SetPal (Entry%, Value AS PalValue)
   OUT &H3C8, Entry%                            'tell controller to get ready
  
   OUT &H3C9, ASC(Value.red)                      'send red component
   OUT &H3C9, ASC(Value.green)                    'send green component
   OUT &H3C9, ASC(Value.blue)                     'send blue component
END SUB

SUB SetScreenMode (sm%)
    SCREEN sm%
    screenmode% = sm%
END SUB

