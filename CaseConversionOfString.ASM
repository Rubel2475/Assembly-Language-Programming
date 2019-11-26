
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.MODEL SMALL
.STACK 100H
    .DATA
        X DB 80 DUP ?
        MSG db "Enter The String: $"

    .CODE
        MAIN PROC
            
            MOV AH,9
            LEA DX,MSG
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
           
           MOV BX,SI
           
           ADD BX,2
           
           MOV AH,2 
           mov DL,0AH
           int 21H
           MOV DL,0DH
           INT 21H  
            
           MOV SI,0
           
           NEXT2:  INT 21H
                   MOV CL,X[SI]
                   XOR CL,32
                   mov DL,CL 
                   
                   inc SI
                   cmp SI,BX
                   jz EXIT2
                   jmp NEXT2
           EXIT2:
           
            
           MOV AH,4CH
           INT 21H
           
        main endp
    end main
 

ret




