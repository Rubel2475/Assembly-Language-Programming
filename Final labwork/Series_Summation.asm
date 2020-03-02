
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

INCLUDE "EMU8086.INC"

.MODEL SMALL
.STACK 100H

    .DATA
        N DB ?
        divisor DB ?
        sum DB ?
    
    .CODE   
    
        MAIN PROC
            
            PRINT "Enter an integer between(1-3): "
            MOV divisor,2
            
            MOV AH,1
            INT 21H
            
            SUB AL,30H
            MOV N,AL
            
            ADD AL,1
            MUL N    ;source=N and the other is assumed to be in AL(8 BIT) or AX(16 BIT)
            DIV divisor
            
            ADD AL,30H
            MOV sum,AL 
            
            MOV AH,2
            MOV DL,0AH
            INT 21H
            MOV DL,0DH
            INT 21H  
            
            PRINT "Sum: "
            
            MOV AH,2
            MOV DL,sum
            INT 21H
            
            MOV AH,4CH
            INT 21H  
            
            
        MAIN ENDP
    
    
    END MAIN

ret




