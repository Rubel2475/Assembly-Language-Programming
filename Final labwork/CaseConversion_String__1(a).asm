
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
                CMP AL,0DH  ;0DH is ascii for enter key
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
                    
                    XOR CL,32       ;32=00100000 , 1 XOR 1 = 0, 0 XOR 0 = 0, 1 XOR 0 = 1 
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







;An alternative solution




; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h


.MODEL SMALL
.STACK 100H

    .DATA
        str DB 50
        Iprompt DW 'Input : $'
        Oprompt DW 'Output: $' 
    
    .CODE
        
        MAIN PROC
            MOV AX,@DATA
            MOV DS,AX
            
            
            LEA DX,Iprompt
            MOV AH,9
            INT 21H 
            
            MOV SI,0
            
            MOV AH,1           
            loop1:
                INT 21H
                
                CMP AL,0DH
                JZ next 
                
                MOV str[SI],AL   
                
                INC SI
                JMP loop1          
            
            next: 
                MOV BX,SI
                
                MOV AH,2
                MOV DL,0AH
                INT 21H
                MOV DL,0DH
                INT 21H            
              
                LEA DX,Oprompt
                MOV AH,9
                INT 21H
                      
                MOV SI,0
                      
                MOV AH,2
                loop2:
                    
                    CMP BX,SI
                    JZ exit
                    
                    MOV CL,str[SI]
                    
                    CMP CL,65
                    JL ignore
                    CMP CL,122
                    JG ignore 
                    
                    CMP CL,96
                    JG XR 
                    
                    CMP CL,90
                    JG ignore
                    
                    XR:
                       XOR CL,32
                       
                       MOV DL,CL
                       INT 21H                      
                         
                    INC SI
                    JMP loop2
                    
                ignore:      
                    MOV DL,CL
                    INT 21H
                    
                    INC SI
                    JMP loop2
                           
             exit:
                MOV AH,4CH
                INT 21H
                       
     
        MAIN ENDP
    
    
    END MAIN

ret






