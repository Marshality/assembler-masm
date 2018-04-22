DS1 SEGMENT PARA COMMON 'DATA'
	C1 LABEL BYTE
	org 1
	C2 LABEL BYTE
DS1 ENDS

CSEG SEGMENT PARA PUBLIC 'CODE'
	assume CS:CSEG, DS:DS1
main:
	mov ax, DS1
	mov ds, ax
	
	mov ah, 02
	mov dl, c1
	
	int 21h
	
	mov dl, c2
	
	int 21h
	
	mov ax, 4c00h
	int 21h

CSEG ENDS
END main