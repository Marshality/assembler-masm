PUBLIC	Print2
EXTRN	PR_NewLine:NEAR


Code	SEGMENT	PUBLIC
	ASSUME CS:Code

Print2	PROC	NEAR
	PUSH	BP
	MOV	BP,SP

	MOV	AX,[BP+4]		;в АХ число для печати
	CMP	AX, 0
	JE	Zero

	MOV	CX,16
	JMP	Del0

Zero:
	MOV	DL,'0'
	MOV	AH, 2
	INT	21h
	JMP	EXIT
	
Del0:
	SHL	AX,1			;сдвиг влево
	JNC	Del0_1

	MOV	DL, '1'
	JMP	Print			;выдвинули бит

Del0_1:
	DEC	CX			;убиарем сдвинутый бит
	JZ	EXIT
	JMP	Del0

GetN:
	MOV	DL,'0'
	SHL	AX,1
	JNC	Print	  		;если не выдвинули 1 (то есть в DH 0)
	MOV	DL,'1'			;иначе  1
	JMP	Print

Print:
	PUSH	AX			;текущее число
	
	MOV	AH,2
	INT	21h
	
	POP	AX	
			
	DEC	CX		
	JNZ	GetN		

EXIT:	
	POP	BP
	
	RET 	2

Print2	ENDP

Code	ENDS

END
