SSTACK     SEGMENT PARA STACK  'STACK'
                DB   64 DUP('СТЕК____')
     SSTACK     ENDS
DataS SEGMENT PARA PUBLIC 'DATA'
Array DB '4, 1, 3, 2, 6, 5, 8, 7'

DataS ENDS
Code SEGMENT PARA PUBLIC 'CODE'
	 ASSUME CS:Code, DS:DataS, SS:SSTACK;

Start:	 MOV AX, DataS
		 MOV DS, AX

		 MOV SI, 0
		 MOV BX, OFFSET Array
		 MOV CL, 8 ; Счетчик

Task:	 MOV AH, Array[SI]
		 MOV AL, Array[DI]
		 CMP AH, AL
		 JG Swap
		 INC SI
		 INC DI
		 LOOP Task
		 JMP Exit

Swap:	 XCHG DL, Array[SI] 
		 XCHG DL, Array[DI]
		 XCHG Array[SI], DL
		 DEC SI
		 DEC DI
		 JMP Task


Exit:    MOV AH, 4Ch
		 MOV AL, 0
	     INT 21h

Code ENDS
	 END Start