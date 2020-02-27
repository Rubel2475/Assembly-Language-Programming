
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.MODEL SMALL
.STACK 100H

    .DATA
        str DB 50 ?
        prompt DB "Enter the string: $"
        prompt2 DB "The case converted string: $"
        
        
    .code
        
        MAIN PROC
            MOV AX,@DATA
            MOV DS,AX
                   
            MOV AH,9       
            LEA DX,prompt
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
                ;DEC SI                
                MOV BX,SI 
                
                MOV AH,2
                MOV DL,0AH   ;line feed
                INT 21H
                MOV DL,0DH   ;carriage returns
                INT 21H
                
                MOV SI,0                
                LOOP2:
                    INT 21H                    
                    MOV CL,str[SI] 
                    
                    
                    CMP CL,65
                    JL ignore                    
                    CMP CL,122
                    JG ignore 
                    
                    
                    XOR CL,32
                    MOV DL,CL
                    
                    CMP SI,BX
                    JZ EXIT
                    
                    INC SI
                    JMP LOOP2
                    
                ignore:
                    mov DL,CL
                    
                    CMP SI,BX
                    JZ EXIT
                    
                    INC SI
                    JMP LOOP2
                                        
            EXIT:
                MOV AH,4CH    
                INT 21H
            
            
        MAIN ENDP
                

ret




