
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H

.DATA
    n DB 0
    num DB 80 DUP ?
    min DB ?
    pos DW ?

.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
        
        
        PRINT "Enter the string: "
        
        
        ; Take n integers as input
        MOV SI, 500
        MOV AH, 1
        For:
            INT 21H
            CMP AL, 13
            JZ ENDFor
            
            MOV num[SI], AL
            INC SI
            INC n
        JMP  For
        
        ENDFor:
        
        ;NewLine
        MOV AH, 2
        MOV DL, 10
        INT 21H
        MOV DL, 13
        INT 21H
                
        
        SORT:
        MOV SI , 500
        MOV AL , 0
        LOOP1:
            CMP AL, n
            JE ENDLOOP1
            
            MOV BL, AL
            INC BL
            MOV DL, num[SI]
            MOV min, DL
            MOV pos, SI
            MOV DI, SI
            INC DI
            LOOP2:
               CMP BL, n
               JE ENDLOOP2
               
               MOV DL, num[DI]
               
               CMP DL, min
               JL LESS
               
               JMP NOTLESS
               
               LESS:
                   MOV min, DL
                   MOV pos, DI
               
               NOTLESS:
                   INC BL
                   INC DI
                   JMP LOOP2
            ENDLOOP2:
            
            
            MOV DI, pos
            MOV DL, num[DI]
            XCHG DL, num[SI]
            MOV num[DI], DL
            
            
            INC AL
            INC SI
            JMP LOOP1
        ENDLOOP1:
       
        ;Printing sorted value
        MOV SI, 500
        MOV BL, 0
        MOV AH, 2
        PrintNum:
            CMP BL, n
            JE ENDPrintNum
            
            MOV DL, num[SI]
            INT 21H 
            INC SI
            INC BL
        JMP PrintNum
        
        ENDPrintNum:    
            
        MOV AH, 76
        INT 21H
    MAIN ENDP
    
END MAIN

ret




