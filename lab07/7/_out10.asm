PUBLIC	Print10
EXTRN	PR_NewLine:NEAR


Code	SEGMENT	PUBLIC
	ASSUME CS:Code


Print10	PROC	NEAR
		PUSH	BP
		MOV	BP,SP

		MOV	AX,[BP+4]	
		MOV	BX,10		

		;�������� ����� ��� ����� � ��, � ����� �������� �� ������� �����

		PUSH	AX		

	Div1:				
		MOV	DX,0
		DIV	BX		;AX ����� �� BX(���������), ������� ����� ������ � DX
		PUSH	AX		;�������� �������� AX (����� �����)

		MOV	AH,2		;�������� �������
		MOV	DL,'a'
		INT	21h

		POP	AX		
		CMP	AX,0
		JNE	Div1		

		MOV	AH,2
		MOV 	DL,8		;������� ������ �� ���� ������� �����
		INT 	21h

		POP	AX		

	Div2:
		MOV	DX,0
		DIV	BX		;AX ����� �� BX(���������), ������� ����� ������ � DX
		PUSH	AX		;�������� �������� AX (����� �����)

		MOV	AH,2
		ADD	DL,'0'		;�������� �������� DX (�������)
		INT	21h

		MOV	DL,8		;������� ������ ����� �� ��� �������
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
