
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.MODEL SMALL
.STACK 100H 

    .DATA
        N DB ?
        PROMPT DB 'Enter N: $'

    .CODE      
        MOV AX, @DATA
        MOV DS, AX

        MAIN PROC
            
            LEA DX,PROMPT
            MOV AH,9
            INT 21H
            
            MOV AH,1
            INT 21H
            
            CMP AL,0
            JE ZERO
            
            MOV N,AL
            SUB N,48   ;ASCII number of 0 = 48(30h in hexadecimal)
            
            MOV AH,2
            MOV DL,0AH
            INT 21H
            MOV DL,0DH
            INT 21H
            
            MOV AX,1
            MOV BX,1
            MOV CX,1
            
            FOR:
                CMP CL,N
                JG EXIT
                
                MOV BX,CX
                MUL BX
                
                INC CX
            
                JMP FOR
        
            ZERO:
                MOV AX,1
                
            EXIT:
                ADD AX,48
                
                MOV AH,2
                MOV DL,AL
                INT 21H
                
                MOV AH,4CH
                INT 21H    
     
               
        MAIN ENDP
    END MAIN

ret




