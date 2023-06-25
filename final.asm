;Student Number: 2021555010
;Student Name and Surname: Boran Boysan
;Github Username: Boran-Boysan

student_number db '2021555010'
MOV DI, offset student_number

MOV AX,0
MOV CX, 10  
CALL send_memory
  
MOV CX, 10
MOV AX, 200h
MOV ES, AX
MOV DI, 2000h
CALL move_memory

MOV AL, byte ptr [2006h]
CMP AL, '6'
JNE create_morning
JMP create_evening

create_morning:
MOV AH, 0eh
MOV AL,' '
INT 10h

MOV AL, 'M'
INT 10h

MOV AL, 'o'
INT 10h

MOV AL, 'r'
INT 10h

MOV AL, 'n'
INT 10h

MOV AL, 'i'
INT 10h

MOV AL, 'n'
INT 10h

MOV AL, 'g'
INT 10h

JMP quit
     
create_evening:
MOV AH, 0eh
MOV AL,' '
INT 10h

MOV AL, 'E'
INT 10h

MOV AL, 'v'
INT 10h

MOV AL, 'e'
INT 10h

MOV AL, 'n'
INT 10h

MOV AL, 'i'
INT 10h

MOV AL, 'n'
INT 10h

MOV AL, 'g'
INT 10h
 
JMP quit

quit:
RET

send_memory PROC 
    
    MOV AL, [DI]
    MOV [2000h+BX],AL
    
    MOV AH, 0eh
    INT 10h
    INC DI
    INC BX
    
    LOOP send_memory
    
    RET
    
send_memory ENDP

move_memory PROC
    
    REP MOVSB
    
    RET
    
move_memory ENDP

END



