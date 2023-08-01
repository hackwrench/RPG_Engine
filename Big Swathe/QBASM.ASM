public  SCREENMODE
SCREENMODE  PROC FAR                     ; get BASIC screen mode
    mov     SI, 7360
    MOV     AX, [SI]
    MOV     AH, 0
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
    PUSH DS
    LDS     BX, [BP + 8]
    MOV     AX, [BP + 6]
    XLAT
    POP     DS
    POP     BP
    RET 6
TABLE256 ENDP

MEM16W PROC FAR
    PUSH BP
    PUSH DS
    MOV BP, SP
    MOV   AX, [BP+Ch] 
    LDS   SI, [BP+8]
    SHL   SI, 1
    ;MOV   AX,[SI]
    POP   DS
    POP   BP
    RETF 6h
MEM16W ENDP

MEM16R PROC FAR
  PUSH BP
  PUSH DS
  MOV BP, SP
  
  LDS SI,[BP+8]
  SHL   SI, 1
  MOV AX,[SI]
  POP DS
  POP BP
  RETF 4h
MEM16R ENDP
