.286
STK SEGMENT PARA STACK 'STACK'
	db 100 dup(0)
STK ENDS

DSEG SEGMENT PARA PUBLIC 'DATA'
	X dw 5
	fakt1 dw ?
DSEG ENDS

CSEG SEGMENT PARA PUBLIC 'CODE'
	assume CS:CSEG, DS:DSEG, SS:STK
	
factorial proc near
	  PUSH BP
	
      	  MOV  BP, SP
	  MOV  DX,[BP+4]		
	  DEC DX
	  JNE M1
	  MOV AX, 1
	
	  POP BP
	  RET
M1:
	  PUSH DX
	  CALL factorial
	  ADD SP,2
	
	  MUL WORD PTR [BP+4]
	  POP BP	
	  RET	
factorial endp	
	
main:
	MOV AX, DSEG
	MOV DS, AX
	
	PUSH X
	
	CALL FACTORIAL

	ADD SP, 2
	
	MOV fakt1, AX
	
	MOV AX, 4ch
	INT 21h

CSEG ENDS

END main
