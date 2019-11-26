
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.MODEL SMALL
.STACK 100H
    
    .DATA
        X DB 80 DUP <?>
        msg DB 'Enter The String: $'
    
    .CODE
        MAIN PROC
            
            MOV AH,9
            LEA DX,msg
            INT 21H
            
            
            MOV AX, @DATA
            MOV DS,AX
            MOV SI,0
            MOV AH,1
            NEXT: INT 21H
                  CMP AL,0DH
                  JZ EXIT
                  MOV X[SI],AL
                  INC SI
                  JMP NEXT
            EXIT: 
            
            DEC SI
            
            MOV AH,2 
            MOV DL,0AH
            INT 21H
            MOV DL,0DH
            INT 21H
        
            NEXT2: INT 21H
                   MOV DL,X[SI]
                   DEC SI
                   CMP SI,-2
                   JZ EXIT2
                   JMP NEXT2
            EXIT2:
       
            MOV AH,4CH
            INT 21H
            
                      
        MAIN ENDP
    END MAIN
 
ret




