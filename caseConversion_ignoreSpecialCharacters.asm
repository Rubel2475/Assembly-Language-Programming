
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.MODEL SMALL
.STACK 100H

    .CODE
        MAIN PROC
            
            MOV AH,1
            INT 21H
            
            MOV BL,AL
            
            CMP BL,'A'
            JL ignore
            
            CMP BL,'z'
            JG ignore
            
            CMP BL,96
            JG upper
            
            CMP BL,90
            JG  ignore
            
            ADD BL,64           
            upper:
                SUB BL,32
            
            ignore:
            
            MOV AH,2
            MOV DL,0AH
            INT 21H
            MOV DL,0DH
            INT 21H
            
            MOV DL,BL
            MOV AH,2
            INT 21H
            
            MOV AH,4CH
            INT 21H
        MAIN ENDP
     END MAIN
            
ret




