PUBLIC	Print10
EXTRN	PR_NewLine:NEAR


Code	SEGMENT	PUBLIC
	ASSUME CS:Code


Print10	PROC	NEAR
		PUSH	BP
		MOV	BP,SP

		MOV	AX,[BP+4]	
		MOV	BX,10		

		;выделяем место под число в АХ, а потом печатаем со сдвигом влево

		PUSH	AX		

	Div1:				
		MOV	DX,0
		DIV	BX		;AX делим на BX(основание), остаток будем искать в DX
		PUSH	AX		;сохраним значение AX (целая часть)

		MOV	AH,2		;печатаем пропуск
		MOV	DL,'a'
		INT	21h

		POP	AX		
		CMP	AX,0
		JNE	Div1		

		MOV	AH,2
		MOV 	DL,8		;двигаем курсор на одну позицию назад
		INT 	21h

		POP	AX		

	Div2:
		MOV	DX,0
		DIV	BX		;AX делим на BX(основание), остаток будем искать в DX
		PUSH	AX		;сохраним значение AX (целая часть)

		MOV	AH,2
		ADD	DL,'0'		;печатаем значение DX (остаток)
		INT	21h

		MOV	DL,8		;смещаем курсор назад на две позиции
		INT	21h
		INT	21h

		POP	AX		
		CMP	AX,0
		JNE	Div2		

		POP	BP
		RET	2
Print10	ENDP

Code	ENDS

END
