PUBLIC	Print2s
EXTRN	PR_NewLine:NEAR
EXTRN	Print2:NEAR


Code	SEGMENT	PUBLIC
	ASSUME CS:Code

Print2S	PROC	NEAR
	PUSH	BP
	MOV	BP,SP

	MOV	AX,[BP+4]		;�������� � AX �����, ������� ���� �����������
	CMP	AX,0
	JGE	SkipMinus		;���� ����� �������������, �� ������� '-' � ��������� "������������" �������� � ������

	PUSH	AX			
	MOV	AH,2h			
	MOV	DL,'-'
	INT	21h
	POP	AX			
	NEG	AX			;���������� ���������

SkipMinus:
	PUSH	AX
	CALL	Print2

	POP	BP

	RET 2
Print2S	ENDP

Code	ENDS

END
