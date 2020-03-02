
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

INCLUDE "EMU8086.INC"

.MODEL SMALL
.STACK 100H

    .DATA
        divisor DB ?
    
    .CODE   
    
        MAIN PROC             
            MOV AX,@DATA
            MOV DS,AX
            
            PRINT "Enter an integer between(0-9): "
            MOV divisor,2     
            
            MOV AH,1
            INT 21H 
            
            SUB AL,48
            
            DIV divisor   ;AX=Divident , AH=Remainder, AL=Quotient >for 8 bit divisor
            
            CMP AH,0
            JZ EVEN
            
            JMP ODD
               
            EVEN:
                CALL NEWLINE   
                PRINT 'It is Even.'
                JMP EXIT
        
            ODD:
                CALL NEWLINE
                PRINT 'It is Odd.'
                JMP EXIT
            
            EXIT:
                MOV AH,4CH
                INT 21H
    
        MAIN ENDP
        
        
        NEWLINE PROC
                MOV AH,2
                MOV DL,0DH
                INT 21H
                MOV DL,0AH
                INT 21H
                RET
        NEWLINE ENDP 
        
        
    END MAIN

ret




