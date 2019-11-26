
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

MODEL SMALL
.STACK 100H
.CODE

MAIN PROC
    MOV DL,'A'
    MOV AH,2
    INT 21H
  
    MOV AH,4CH
MAIN ENDP 
END MAIN

ret