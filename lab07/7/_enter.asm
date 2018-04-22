PUBLIC	InputInt
EXTRN	sEnter:BYTE

Data	SEGMENT	PUBLIC
	sSucceed	DB	13,10,'Done.',13,10,'$'
Data	ENDS

Code	SEGMENT	PUBLIC
	ASSUME CS:Code


InputInt	PROC	NEAR

		PUSH	SI			

		MOV	DX, offset sEnter
		MOV	AH,9
		INT	21h

		MOV	BX, 0
	
Scan:
		MOV	AH,1
		INT	21h			;получаем в AL символ

		CMP	AL,13			;если в AL символ новой строки - выходим
		JE	Enter			;(если AL == 13, zero falg = 0)

		CMP	AL,2Dh			
		JNE	NotMinus		

		MOV	SI,1			;запомним что число отрицательное
		JMP	Scan			

NotMinus:
		MOV	CX, AX			

		MOV	AX,BX         		
		MOV	BX,10			;
		MUL	BX			;AX *= 10
			
		MOV	BX, CX			

		SUB	BL,'0'			;преобразуем символ в цифру
		MOV	BH,0			
		ADD	BX,AX			

		JMP	Scan

Enter:
		MOV	AX,BX			;в АХ результат
		CMP	SI,1			;умножаем на -1
		JNE	End			
		NEG	AX			;АХ *= -1

End:
		PUSH	AX			;сохраняем для вывода
		LEA	DX,sSucceed
		MOV	AH,9
		INT	21h
		POP	AX

		POP	SI
		
		RET
InputInt	ENDP

Code	ENDS

END
