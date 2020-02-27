
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.MODEL SMALL
.STACK 100H

    .DATA 
        prompt DB 'Enter a character: $'
        prompt2 DB 0AH,0DH,'Output: $'
        
        LF EQU 0AH  ;LF=Line Feed
        CR EQU 0DH  ;CR=Carriage Returns

    .CODE
        MAIN PROC
            
            mov AX,@DATA
            MOV DS,AX
            
            MOV AH,9
            LEA DX,prompt
            INT 21H   
                

            
            MOV AH,1
            INT 21H           
            MOV BL,AL
            
            CMP BL,65
            JL ignore
            
            CMP BL,122
            JG ignore 
               
            CMP BL,96                   
            JG lower
            
            CMP BL,90
            JG ignore
            
            ADD BL,64
            
            lower:
                SUB BL,32       
            
            ignore:
            
            MOV AH,2
            MOV DL,LF    
            INT 21H
            MOV DL,CR
            INT 21H 
            
                  
                  
            MOV AH,9
            LEA DX,prompt2
            INT 21H
            
            MOV AH,2
            MOV DL,BL
            INT 21H  
            
            MOV AH,4CH
            INT 21H
        MAIN ENDP

ret