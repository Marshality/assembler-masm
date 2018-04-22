PUBLIC	Print16S
EXTRN	PR_NewLine:NEAR
EXTRN	Print16:NEAR


Code	SEGMENT	PUBLIC
	ASSUME CS:Code

Print16S	PROC	NEAR
	PUSH	BP
	MOV	BP,SP

	MOV	AX,[BP+4]	;получаем в AX число, которое надо распечатать
	CMP	AX,0
	JGE	SkipMinus	;если число отрицательное, то напишем - и передадим "перевернутое" значение в печать

	PUSH	AX

	MOV	AH,2h
	MOV	DL,'-'
	INT	21h
	POP	AX
	NEG	AX

SkipMinus:
	PUSH	AX
	CALL	Print16

	POP	BP
	RET	2

Print16S	ENDP

Code	ENDS

END
