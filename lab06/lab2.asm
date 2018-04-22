STK SEGMENT PARA STACK 'STACK'
	db 100 dup(0)
STK ENDS

DSEG SEGMENT PARA PUBLIC 'DATA'
	X dw 6
	fact2 dw ?
DSEG ENDS

CSEG SEGMENT PARA PUBLIC 'CODE'
	assume CS:CSEG, DS:DSEG, SS:STK
	
factorial proc near
	  PUSH BP

	  MOV  BP, SP
	  MOV  DX, [BP+4]	
	  DEC DX
	  JNE M1
	  MOV AX, 1
	
	  POP BP
	  RET
M1:
	  PUSH [BP + 6]
	  PUSH DX
	  CALL factorial
	  ADD SP, 4
	
	  MUL DX, [BP + 4]
	  MOV BX, [BP + 6]
	  MOV [BX], AX
	  POP BP

	  RET
factorial endp	
	
main:
	MOV AX, DSEG
	MOV DS, AX

	MOV BX, OFFSET F

	PUSH BX
	PUSH X
	
	CALL FACTORIAL

	ADD SP, 4
	
	MOV DX, AX

	MOV AH,02
	INT 21h
	
	MOV AX, 4ch
	INT 21h

CSEG ENDS

END main
