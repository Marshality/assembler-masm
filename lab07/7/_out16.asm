PUBLIC	Print16
EXTRN	PR_NewLine:NEAR

Data	SEGMENT	PUBLIC
	simbols	DB	'0123456789ABCDEF'
Data	ENDS


Code	SEGMENT	PUBLIC
	ASSUME CS:Code, DS:Data

Print16	PROC	NEAR
		PUSH	BP
		MOV	BP,SP

		MOV	AX,[BP+4]	
		MOV	BX,16		

		PUSH	AX		

	Div1:			

		MOV	DX,0
		DIV	BX		;AX ����� �� BX(���������), ������� ����� ������ � DX
		PUSH	AX		;�������� �������� AX (����� �����)

		MOV	AH,2		
		MOV	DL,'a'
		INT	21h

		POP	AX		
		CMP	AX,0	
		JNE 	Div1		

		MOV	AH,2
		MOV 	DL,8		;�������� �� 1 ���. �����
		INT 	21h
	
		POP	AX		

	Div2:
		MOV	DX,0
		DIV	BX		;AX ����� �� BX (���������), ������� ����� ������ � DX
		PUSH	AX		;�������� �������� AX (����� �����)

		PUSH	BX		

		MOV  	BX, OFFSET simbols	
		MOV	AL, DL
		XLAT			
		MOV	DL, AL

		POP 	BX

		JMP	Print

	Print:
		MOV	AH,2
		INT	21h		

		MOV	DL,8		;��������� ����� ������
		INT	21h
		INT	21h

		POP	AX		
		CMP	AX,0
		JNE 	Div2		

		POP	BP
		RET	2

Print16	ENDP

Code	ENDS

END
