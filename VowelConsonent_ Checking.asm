
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.MODEL SMALL
.STACK 100H    

    .DATA
        str DB 80 DUP
        MSG db "Enter The String: $"
        MSG2 db "Number of Vowels: $"
        MSG3 db "Number of consonents: $"

    .CODE   
        MOV AX,@DATA
        MOV DS,AX

        MAIN PROC
            
            MOV AH,9
            LEA DX,MSG
            INT 21H    
             
            MOV BL,48           
            MOV CL,48
            MOV AH,1 
            
            NEXT:
            INT 21H                   
            CMP AL, 0DH
            JZ EXIT
            MOV str[SI], AL
            
            CMP str[SI],65    ;A
            JZ vowel
            CMP str[SI],97    ;a
            JZ vowel
            CMP str[SI],69    ;E
            JZ vowel
            CMP str[SI],101   ;e
            JZ vowel
            CMP str[SI],73    ;I
            JZ vowel
            CMP str[SI],105   ;'i'
            JZ vowel
            CMP str[SI],79    ;'O'
            JZ vowel       
            CMP str[SI],111   ;'o'
            JZ vowel
            CMP str[SI],85    ;'U'
            JZ vowel
            CMP str[SI],117   ;'u'
            JZ vowel       
                   
                   
            ADD CL,1
            SUB BL,1
            vowel:
            ADD BL,1
            
            
            INC SI
            JMP NEXT            
            EXIT:                 
            
            DEC SI
            
                        
            MOV AH,2 
            MOV DL,0AH
            INT 21H
            MOV DL,0DH
            INT 21H
                        
            
            ;OUTPUT:
            ;MOV DL, str[SI]
            ;INT 21H       
            ;DEC SI
            ;CMP SI, -1
            ;JZ SESH 
            ;JMP OUTPUT
            
            ;SESH:
            
            
            MOV AH,9
            LEA DX,MSG2
            INT 21H 
             
            MOV AH,2
            MOV DL,BL
            INT 21H   
            
            MOV AH,2 
            MOV DL,0AH
            INT 21H
            MOV DL,0DH
            INT 21H
            
            MOV AH,9
            LEA DX,MSG3
            INT 21H
            
            MOV AH,2
            MOV DL,CL
            INT 21H  
                       
                          
            MOV AH, 4CH
            INT 21H     

        MAIN ENDP     

        END MAIN

ret




