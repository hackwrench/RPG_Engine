DEFINT A-Z

TYPE ChunkHeader
  ChunkType AS STRING * 4
  ChunkSize AS LONG
END TYPE

DECLARE FUNCTION NumberOfChunks% (fc%, ChunkType$)
DECLARE FUNCTION ReverseLong& (longInt&)

DECLARE FUNCTION FileOPEN% (FileName$, Mode$)

SUB ExportChunk (FileName$, ChunkName$, array%())
    DIM Header AS ChunkHeader
    fc% = FileOPEN(FileName$, "B")
    SEEK fc%, LOF(fc%) + 1
ExportChunkTop:
    Header.ChunkType = ChunkName$
    Header.ChunkSize = (UBOUND(array%) - LBOUND(array%) + 1) * 2
    PUT fc%, , Header
    FOR i% = LBOUND(array%) TO UBOUND(array%)
      PUT fc%, , array(i%)
    NEXT
    CLOSE fc%
END SUB

FUNCTION NumberOfChunks (fc%, ChunkType$)
    DIM Header AS ChunkHeader
    PreserveSeek& = SEEK(fc%)
    DO
    GET fc%, , Header
    Header.ChunkSize = ReverseLong(Header.ChunkSize)
    SEEK fc%, SEEK(fc%) + Header.ChunkSize
    IF Header.ChunkType = ChunkType$ THEN TotalChunks% = TotalChunks% + 1
    LOOP UNTIL SEEK(fc%) > LOF(fc%)
    SEEK fc%, PreserveSeek&
    NumberOfChunks = TotalChunks%
END FUNCTION

FUNCTION ReverseLong& (longInt&)
    Temp1$ = MKL$(longInt&)
    Temp1$ = MID$(Temp1$, 4, 1) + MID$(Temp1$, 3, 1) + MID$(Temp1$, 2, 1) + MID$(Temp1$, 1, 1)
    ReverseLong& = CVL(Temp1$)
END FUNCTION

