;С0Т Ц вывод пунктов меню с номерами 0..8

PUBLIC	PrintMenu
EXTRN	PR_NewLine:NEAR

Data	SEGMENT	PUBLIC
	sMenu	DB	10,13,'     ---Main menu---', '$'
	sM0	DB	'#0. Show the main menu', '$'
	sM1	DB	'#1. Enter the number', '$'
	sM2	DB	'#2. Binary system', '$'
	sM3	DB	'#3. Binary system (signed)', '$'
	sM4	DB	'#4. Decimal system', '$'
	sM5	DB	'#5. Decimal system (signed)', '$'
	sM6	DB	'#6. Hexadecimal system', '$'
	sM7	DB	'#7. Hexadecimal system (signed)','$'
	sM8	DB	'#8. Quit', '$'
Data	ENDS


Code	SEGMENT	PUBLIC
	ASSUME CS:Code, DS:Data

PrintMenu	PROC	NEAR
	PUSH	AX
	PUSH	DX
	
	MOV	AH,9	;печать строк
	
	LEA	DX,sMenu
	INT	21h
	CALL    PR_NewLine
	CALL	PR_NewLine
	LEA	DX,sM0
	INT	21h
	CALL	PR_NewLine
	LEA	DX,sM1
	INT	21h
	CALL	PR_NewLine
	LEA	DX,sM2
	INT	21h
	CALL	PR_NewLine
	LEA	DX,sM3
	INT	21h
	CALL	PR_NewLine
	LEA	DX,sM4
	INT	21h
	CALL	PR_NewLine
	LEA	DX,sM5
	INT	21h
	CALL	PR_NewLine
	LEA	DX,sM6
	INT	21h
	CALL	PR_NewLine
	LEA	DX,sM7
	INT	21h
	CALL	PR_NewLine
	LEA	DX,sM8
	INT	21h
	
	POP	DX
	POP	AX	
	RET
PrintMenu	ENDP

Code	ENDS

END