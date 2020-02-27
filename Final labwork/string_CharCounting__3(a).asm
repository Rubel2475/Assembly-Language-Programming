
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.MODEL SMALL
.STACK 100H

    .DATA 
        VW DB 0
        CN DB 0
        DG DB 0
        SPC DB 0
        OT DB 0
        PROMPT DB 'Enter the String: $'
        PV DB 'Number of vowels in given string: $'
        PC DB 0AH,0DH,'Number of consonants in given string: $'
        PD DB 0AH,0DH,'Number of digits in given string: $'
        PS DB 0AH,0DH,'Number of spaces in given string: $'
        PO DB 0AH,0DH,'Number of other characters in given string: $'
     
     .CODE 
        
        
        MAIN PROC 
            
            MOV AX,@DATA
            MOV DS,AX
            
            MOV AH,9
            LEA DX,PROMPT
            INT 21H
            
            MOV AH,1
            LOOP1:
                INT 21H
                
                CMP AL,0DH
                JE EXIT
                
                CMP AL,'A'
                JL others
                
                CMP AL,'z'
                JG others
                
                JMP inner
        
           others:
                CMP AL,' '
                JNE special
                INC SPC
                JMP LOOP1
           special:
                CMP AL,'0'
                JL otherAll
                
                CMP AL,'9'
                JG otherAll
                
                INC DG
                JMP LOOP1
           otherAll:
                INC OT
                JMP LOOP1
                
                 
           inner:
                CMP AL,'Z'
                JLE letter
                
                CMP AL,'a'
                JGE letter 
                
           letter:
                CMP AL,'A'
                JE vowel
                CMP AL, 'a'
                JE vowel
                CMP AL,'E'
                JE vowel
                CMP AL, 'e'
                JE vowel 
                CMP AL,'I'
                JE vowel
                CMP AL, 'i'
                JE vowel
                CMP AL,'O'
                JE vowel
                CMP AL, 'o'
                JE vowel
                CMP AL,'U'
                JE vowel
                CMP AL, 'u'
                JE vowel
                 
                
                JMP consonant          
           vowel:
                INC VW
                JMP LOOP1
           consonant:
                INC CN
                JMP LOOP1
                        
                
           EXIT:
                                   
                 
                 MOV AH,9
                 LEA DX,PV
                 INT 21H
                 MOV AH,2   
                 ADD VW,48
                 MOV DL,VW
                 INT 21H
                        
                                      
                 MOV AH,9
                 LEA DX,PC
                 INT 21H 
                 MOV AH,2                
                 ADD CN,48
                 MOV DL,CN
                 INT 21H   
                 
                 
                 MOV AH,9
                 LEA DX,PD
                 INT 21H
                 MOV AH,2
                 ADD DG,48
                 MOV DL,DG
                 INT 21H
                 
                 MOV AH,9
                 LEA DX,PS
                 INT 21H 
                 MOV AH,2
                 ADD SPC,48
                 MOV DL,SPC
                 INT 21H  
                 
                 MOV AH,9
                 LEA DX,PO
                 INT 21H 
                 MOV AH,2                
                 ADD OT,48
                 MOV DL,OT
                 INT 21H
                        
        MAIN ENDP
        

ret




