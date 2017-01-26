DECLARE SUB GetPal (Entry%, Value AS ANY)
DEFINT A-Z

TYPE palvalue
    red   AS STRING * 1
    green AS STRING * 1
    blue  AS STRING * 1
END TYPE


DECLARE SUB FileToScreen (Filename$)

DIM temp AS palvalue

SCREEN 13

PALETTE 247, 65536 * INT(41) + 256 * INT(0) + INT(0)
PALETTE 246, 65536 * INT(51) + 256 * INT(0) + INT(0)
PALETTE 245, 65536 * INT(61) + 256 * INT(0) + INT(0)
PALETTE 244, 65536 * INT(31) + 256 * INT(0) + INT(0)
PALETTE 243, 65536 * INT(41) + 256 * INT(0) + INT(0)
PALETTE 242, 65536 * INT(51) + 256 * INT(0) + INT(0)
PALETTE 241, 65536 * INT(0) + 256 * INT(0) + INT(31)
PALETTE 240, 65536 * INT(0) + 256 * INT(0) + INT(41)
PALETTE 239, 65536 * INT(0) + 256 * INT(0) + INT(51)
CALL GetPal(i, temp)

FOR i = 239 TO 247
    CALL GetPal(i, temp)
    PRINT i; ASC(temp.red); ASC(temp.green); ASC(temp.blue)
NEXT

DO: LOOP UNTIL INKEY$ = " "
FileToScreen "CITY.KON"
GOSUB getInfo

FileToScreen "LANDSCAP.KON"
GOSUB getInfo
FileToScreen "CHARAC.KON"
GOSUB getInfo
FileToScreen "STUFF.KON"
GOSUB getInfo
FileToScreen "STUFF.MSK"
GOSUB getInfo
END
getInfo:
DO
LOCATE 20, 20

PRINT i; k; POINT(i, k)
key$ = INKEY$
 SELECT CASE key$
  CASE "4"
    i = i - 1
  CASE "6"
    i = i + 1
  CASE "8"
    k = k - 1
  CASE "2"
    k = k + 1
  END SELECT
LOOP UNTIL key$ = " "
RETURN

SUB FileToScreen (Filename$)
DEF SEG = &HA000                           'Load land for some graphics
BLOAD Filename$, 0
END SUB

SUB GetPal (Entry%, Value AS palvalue)
   OUT &H3C7, Entry%                   'tell controller to get ready
   temp% = INP(&H3C9)              'get red component
   Value.red = CHR$(temp%)
   temp% = INP(&H3C9)
   Value.green = CHR$(temp%)       'get green component
   temp% = INP(&H3C9)     'get blue component
   Value.blue = CHR$(temp%)
END SUB

SUB SetPal (Entry%, Value AS palvalue)
   OUT &H3C8, Entry%                            'tell controller to get ready
  
   OUT &H3C9, ASC(Value.red)                      'send red component
   OUT &H3C9, ASC(Value.green)                    'send green component
   OUT &H3C9, ASC(Value.blue)                     'send blue component
END SUB

