PUBLIC	Print10S
EXTRN	PR_NewLine:NEAR
EXTRN	Print10:NEAR

Data	SEGMENT	PUBLIC
	XoutS	DW (?)
Data	ENDS


Code	SEGMENT	PUBLIC
	ASSUME CS:Code


Print10S	PROC	NEAR

		PUSH	BP
		MOV	BP,SP

		MOV	AX,[BP+4]		;получаем в AX число, которое надо распечатать
		CMP	AX,0
		JGE	SkipMinus		;если число отрицательное - печатаем '-'
						
		PUSH	AX

		MOV	AH,2h
		MOV	DL,'-'
		INT	21h

		POP	AX
		NEG	AX

SkipMinus:
		PUSH	AX
		CALL	Print10

		POP	BP
		RET	2
Print10S	ENDP

Code	ENDS

END
