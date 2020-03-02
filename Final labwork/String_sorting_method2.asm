
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.MODEL SMALL
.STACK 100H
.DATA
X DB 80 DUP
SIZE DB 0

.CODE      
MOV AX, @DATA
MOV DS, AX

MAIN PROC
    MOV SI, 0
    MOV AH, 1
    FOR: INT 21H
        CMP AL, 0DH
        JE EXIT
        MOV X[SI], AL
        INC SI
        JMP FOR
        
    EXIT: DEC SI

    SORT:
    MOV BX, SI
    
    EXTER:
        CMP SI, 0
        JL END
        MOV DI, SI
        INER: CMP DI, 0
            JL EXEND
            MOV CL, X[DI]
            CMP X[SI], CL
            JL MOVE
            INEND:
            DEC DI
            JMP INER
        EXEND: DEC SI
        JMP EXTER
        
    MOVE: XCHG CL, X[SI]
        MOV X[DI], CL
        JMP INEND
    
    END: MOV SI, 0
    MOV AH, 2
    MOV DL, 0AH
    INT 21H
    MOV DL, 0DH
    INT 21H
     
    LOOPING:
        CMP BX, SI
        JL FINISH
        MOV DL, X[SI] 
        INT 21H
        INC SI
        JMP LOOPING
    FINISH: MOV AH, 4CH
        INT 21H
MAIN ENDP
END MAIN

ret




