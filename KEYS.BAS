DEFINT A-Z
DECLARE FUNCTION GetKey% ()

FUNCTION GetKey%
    Key$ = INKEY$
    SELECT CASE LEN(Key$)
    CASE 0
      GetKey% = CVI(CHR$(0) + CHR$(0))
    CASE 1
      GetKey% = CVI(Key$ + CHR$(0))
    CASE 2
      GetKey% = CVI(Key$)
    END SELECT
END FUNCTION

