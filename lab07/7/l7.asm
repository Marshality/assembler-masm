EXTRN	PrintMenu:NEAR
EXTRN	InputInt:NEAR
EXTRN	Print2:NEAR
EXTRN	Print2S:NEAR
EXTRN	Print10:NEAR
EXTRN	Print10S:NEAR
EXTRN	Print16:NEAR
EXTRN	Print16S:NEAR

PUBLIC	PR_NewLine, sEnter

Data	SEGMENT	PUBLIC
	Funcs		DW	PrintMenu, InputInt, Print2, Print2S, Print10, Print10S, Print16, Print16s
	X		DW	5
	sEnter		DB	13, 10, '>>> ', '$'
Data	ENDS

Stack	SEGMENT STACK
	DW	128h DUP (?)
Stack	ENDS


Code	SEGMENT	PUBLIC
	ASSUME CS:Code, DS:Data, SS:Stack
	
PR_NewLine	PROC	NEAR
	PUSH	AX
	PUSH	DX
	
	MOV	AH,2

	MOV	DL,10
	INT	21h
	MOV	DL,13
	INT	21h
	
	POP	DX
	POP	AX
	RET
PR_NewLine	ENDP


START:
	MOV	AX,Data
	MOV	DS,AX
	
	CALL	Funcs[0]	;печать меню
	
EnterLoop:
	CALL	PR_NewLine
	MOV	AH,9
	MOV	DX,offset sEnter
	INT	21h
		
		
	MOV	AH,8		;ввод символа
	INT	21h

	CMP	AL,'8'
	JA	EnterLoop	
	CMP	AL,'0'		
	JB	EnterLoop
				

	MOV	AH,2		;введенная цифра
	MOV	DL,AL
	INT	21h
	CALL	PR_NewLine
	
	MOV	SI, 0	
	MOV	AH, 0
	MOV	SI,AX
	SUB	SI,'0'
		
	CMP	SI,8		
	JE	End		;если 8 - выход
		
	ADD	SI,SI		;удваиваем цифру, потому что адрес двухбайтовый
	;MOV	BH,0
		
	CMP	SI,2		;передаем икс через стек в функцию
	JBE	Call_Func	;если SI <= 2, скип 

	PUSH	X

Call_Func:
	CALL	Funcs[SI]	;вызов функции

	CMP	SI,2	
	JNE	EnterLoop	;загружаем введенное число в память
	MOV	X,AX	
		
	JMP	EnterLoop
	
End:
	MOV	AH,4Ch
	MOV	AL,0
	INT	21h

Code	ENDS

	END START