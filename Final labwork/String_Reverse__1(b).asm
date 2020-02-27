
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.MODEL SMALL
.STACK 100H

    .DATA
        str DB 50 ?
        MSG DB 'Enter the string: $'
        MSG2 DB 0AH,0DH,'Output string: $'
        
    
    .CODE
        MAIN PROC
            
            MOV AX,@DATA
            MOV DS,AX
            
            MOV AH,9
            LEA DX,MSG
            INT 21H
            
            MOV SI,0
            MOV AH,1
            LOOP1:
                INT 21H
                
                CMP AL,0DH
                JZ NEXT
                
                MOV str[SI],AL
                INC SI                
                JMP LOOP1
                
            NEXT:
                DEC SI
                
                
                MOV AH,2
                MOV DL,0AH
                INT 21H
                MOV DL,0DH
                INT 21H
     
                
                LOOP2:
                    INT 21H
                    
                    MOV DL,str[SI]
                    DEC SI
                    
                    CMP SI,-2
                    JZ EXIT 
                    
                    JMP LOOP2
                     
            EXIT:
                MOV AH,4CH
                INT 21H         
            
            
        MAIN ENDP
ret




