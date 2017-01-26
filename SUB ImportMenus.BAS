SUB ImportMenus (FileName$, MenuIndex%(), MenuTable%())
DIM Header AS ChunkHeader
fc% = FileOPEN(FileName$, "B")
CurrMenu% = 1
ImportMenusTop:
Temp% = NumberOfChunks%(fc%, "MENU")
IF Temp% = 0 THEN EXIT SUB
REDIM MenuTable(1 TO Temp%)
PreserveSeek& = SEEK(fc%)
GlonkOfIndex% = 0
FOR i% = 1 TO Temp%
    GetAnother:
    GET fc%, , Header
    Header.Chunksize = ReverseLong&(Header.Chunksize)
    SEEK fc%, SEEK(fc%) + Header.Chunksize
    IF Header.ChunkType = "MENU" THEN
        'A 'Glonk' is a value that is both the size and the next element
        MenuTable%(i%) = GlonkOfIndex%
        GlonkOfIndex% = GlonkOfIndex% + Header.Chunksize / 2
    ELSE
        GOTO GetAnother
    END IF
NEXT
REDIM MenuIndex%(0 TO GlonkOfIndex - 1)

SEEK fc%, PreserveSeek&
'This is the last time through
GetHeader = TRUE
FOR i% = 0 TO GlonkOfIndex - 1
    GetAnother2:
    IF GetHeader = TRUE THEN
        GET fc%, , Header
        Header.Chunksize = ReverseLong&(Header.Chunksize)
        IF Header.ChunkType = "MENU" THEN
            GetHeader = False
        ELSE
            SEEK fc%, SEEK(fc%) + Header.Chunksize
            GOTO GetAnother2
        END IF
    END IF
    GET fc%, , MenuIndex(i%)
    Header.Chunksize = Header.Chunksize - 2
    IF Header.Chunksize = 0 THEN GetHeader = TRUE
NEXT
CLOSE fc%
END SUB
