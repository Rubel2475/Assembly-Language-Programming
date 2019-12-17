
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H 

.DATA
    VL DB 0
    CN DB 0
    NO DB 0
    NU DB 0
    OT DB 0  
    msg DB "Enter the String: $"
 
.CODE      
    MOV AX, @DATA
    MOV DS, AX
     
    MAIN PROC
        
        MOV AH,9
        LEA DX,MSG
        INT 21H 
        
        MOV VL, 0
        MOV CN, 0
        MOV NO, 0
        MOV NU, 0
        MOV OT, 0
        MOV AH, 1
        
        FOR: INT 21H
            CMP AL, 0DH
            JE RESULT
            CMP AL, 'A'
            JL OTHERS
            CMP AL, 'z'
            JG OTHERS
            JMP INTER
           
        CHAR: CMP AL, 'A'
            JE VOWEL
            CMP AL, 'a'
            JE VOWEL
            CMP AL, 'E'
            JE VOWEL
            CMP AL, 'e'
            JE VOWEL
            CMP AL, 'I'
            JE VOWEL
            CMP AL, 'i'
            JE VOWEL
            CMP AL, 'O'
            JE VOWEL
            CMP AL, 'o'
            JE VOWEL
            CMP AL, 'U'
            JE VOWEL
            CMP AL, 'u'
            JE VOWEL
           
            JMP CONSONENT
       
        VOWEL: INC VL
            JMP FOR
           
        CONSONENT: INC CN
            JMP FOR
           
        OTHERS: CMP AL, ' '
            JNE SPECIAL
            INC NU
            JMP FOR
           
        SPECIAL: CMP AL, '0'
            JL ALL
            CMP AL, '9'
            JG ALL
            INC NO
            JMP FOR
           
        INTER: CMP AL, 'Z'
            JL CHAR
            CMP AL, 'a'
            JGE CHAR
           
        ALL: INC OT
            JMP FOR
       
        RESULT:
       
            MOV AH, 2
            MOV DL, 0AH
            INT 21H
            MOV DL, 0DH
            INT 21H
       
            ADD VL, 48
            PRINTN
            PRINT 'VOWEL: '
            MOV DL, VL
            INT 21H
           
            MOV DL, 0AH
            INT 21H
            MOV DL, 0DH
            INT 21H
           
            ADD CN, 48
            PRINTN
            PRINT 'CONSONENT: '
            MOV DL, CN
            INT 21H
           
            MOV DL, 0AH
            INT 21H
            MOV DL, 0DH
            INT 21H
           
            ADD NO, 48
            PRINTN
            PRINT 'DIGIT: '
            MOV DL, NO
            INT 21H
           
            MOV DL, 0AH
            INT 21H
            MOV DL, 0DH
            INT 21H
           
            ADD NU, 48
            PRINTN
            PRINT 'SPACE: '
            MOV DL, NU
            INT 21H
           
            MOV DL, 0AH
            INT 21H
            MOV DL, 0DH
            INT 21H
           
            ADD OT, 48
            PRINTN
            PRINT 'OTHERS: '
            MOV DL, OT
            INT 21H
           
            MOV AH, 4CH
            INT 21H
    MAIN ENDP
END MAIN

ret




