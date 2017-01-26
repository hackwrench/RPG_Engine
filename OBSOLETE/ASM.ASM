;You need to tell your compiller to take case literally
extrn  b$ScreenMode: byte
public  SCREENMODE

SCREENMODE  PROC FAR                     ; get BASIC screen mode
    xor     ax,ax
    mov     al,b$ScreenMode
    retF
SCREENMODE  endp                     ; get BASIC screen mode

public  GETPSP
GETPSP  PROC FAR                     ; get BASIC screen mode
    
    mov     AH, 50h
    INT 21
    MOV AX, BX
    retF
GETPSP      endp                     ; get BASIC screen mode

public  READBIT
READBIT PROC FAR
    PUSH    BP
    MOV     BP, SP
    MOV     AX, 1
    MOV     CX, [BP + 6]
    SHL     AX, CL
    MOV     CX, [BP + 8]
    AND     AX, CX
    POP     BP
    RETF 4
READBIT ENDP

PUBLIC TABLE256
TABLE256 PROC FAR
PUSH    BP
MOV     BP, SP
PUSH    DS

LDS     BX, [BP + 8]
MOV     AX, [BP + 6]
XLAT
POP DS
POP BP
RET 6
TABLE256 ENDP

