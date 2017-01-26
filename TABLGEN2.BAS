DECLARE SUB correlate (X$, Y%)
DEFINT A-Z
'OPEN "NEWGAME.TAB " FOR BINARY AS 1
OPEN "GTLDEMO.TAB " FOR BINARY AS 1

DIM TempBuf AS STRING * 256
PUT 1, , TempBuf
correlate ".", 0
correlate "#", 1
correlate "H", 2
correlate "-", 3
correlate "_", 34
correlate "/", 10
correlate "\", 11
correlate "w", 14
correlate "3", 50
correlate "1", 48
correlate "l", 33
correlate "I", 12
correlate "v", 15
correlate "⁄", 29
correlate "ø", 30
correlate "4", 51
correlate "2", 49
correlate "r", 21
correlate "y", 22
correlate "∞", 31
correlate "¿", 41
correlate "Ÿ", 42
correlate "A", 18
correlate "D", 28
correlate "M", 19
correlate "O", 17
correlate "Q", 7
correlate "T", 16
correlate "F", 53
correlate "P", 57
correlate "R", 56
correlate "S", 58
correlate "h", 44
correlate "5", 24
correlate "6", 25
correlate "7", 36
correlate "8", 37
correlate "c", 4
correlate "t", 5
correlate "d", 6
correlate "x", 8
correlate "q", 9
correlate ",", 20
correlate "s", 45
correlate "f", 52

correlate "Ì", 13
correlate "0", 46
correlate "i", 54
correlate "C", 55

correlate "Ó", 23
correlate "u", 27
correlate "g", 59
correlate "Ô", 35
correlate "≤", 47
correlate "", 26
correlate "€", 32
correlate "Û", 38
correlate "Ò", 39
correlate "Ú", 40
correlate "", 72
correlate "Ù", 75
correlate "'", 74
correlate "˜", 61
correlate "ˆ", 60
correlate "ı", 64
correlate ":", 66
correlate "É", 77
correlate "Ç", 63
correlate "(", 68
correlate "Ä", 79
correlate "Å", 71
correlate "¯", 76
correlate ";", 65
correlate "", 78
correlate "~", 70
correlate "{", 67
correlate "|", 62
correlate "}", 73
correlate "@", 80
correlate "*", 69
correlate " ", 117
correlate "œ", 116
correlate "—", 118
correlate "“", 119
correlate "Ï", 115
'Thomas Lipschultz Demo
correlate (CHR$(39)), 0

correlate (CHR$(49)), 163
correlate (CHR$(50)), 163
correlate (CHR$(51)), 163
correlate (CHR$(52)), 163
correlate (CHR$(53)), 163
correlate CHR$(54), 163
correlate CHR$(55), 163
correlate "Q", 163
correlate "K", 163
correlate "I", 163
correlate "W", 163
correlate "x", 112
correlate "a", 112
correlate "b", 112
correlate "c", 112
correlate "d", 112
correlate "v", 112
correlate "V", 112
correlate "X", 112
correlate (CHR$(59)), 0



CLOSE

SUB correlate (X$, Y%)
    SEEK 1, ASC(X$) + 1
    R$ = CHR$(Y%)
    PUT 1, , R$
END SUB

