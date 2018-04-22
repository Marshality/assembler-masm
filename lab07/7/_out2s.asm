PUBLIC	Print2s
EXTRN	PR_NewLine:NEAR
EXTRN	Print2:NEAR


Code	SEGMENT	PUBLIC
	ASSUME CS:Code

Print2S	PROC	NEAR
	PUSH	BP
	MOV	BP,SP

	MOV	AX,[BP+4]		;получаем в AX число, которое надо распечатать
	CMP	AX,0
	JGE	SkipMinus		;если число отрицательное, то выводим '-' и передадим "перевернутое" значение в печать

	PUSH	AX			
	MOV	AH,2h			
	MOV	DL,'-'
	INT	21h
	POP	AX			
	NEG	AX			;логическое отрицание

SkipMinus:
	PUSH	AX
	CALL	Print2

	POP	BP

	RET 2
Print2S	ENDP

Code	ENDS

END
