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
		INT	21h			;�������� � AL ������

		CMP	AL,13			;���� � AL ������ ����� ������ - �������
		JE	Enter			;(���� AL == 13, zero falg = 0)

		CMP	AL,2Dh			
		JNE	NotMinus		

		MOV	SI,1			;�������� ��� ����� �������������
		JMP	Scan			

NotMinus:
		MOV	CX, AX			

		MOV	AX,BX         		
		MOV	BX,10			;
		MUL	BX			;AX *= 10
			
		MOV	BX, CX			

		SUB	BL,'0'			;����������� ������ � �����
		MOV	BH,0			
		ADD	BX,AX			

		JMP	Scan

Enter:
		MOV	AX,BX			;� �� ���������
		CMP	SI,1			;�������� �� -1
		JNE	End			
		NEG	AX			;�� *= -1

End:
		PUSH	AX			;��������� ��� ������
		LEA	DX,sSucceed
		MOV	AH,9
		INT	21h
		POP	AX

		POP	SI
		
		RET
InputInt	ENDP

Code	ENDS

END
