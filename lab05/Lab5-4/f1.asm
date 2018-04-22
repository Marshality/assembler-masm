STK SEGMENT PARA STACK 'STACK'
	db 100 dup(0)
STK ENDS

DS1 SEGMENT PARA PUBLIC 'DATA'
	X db 'X'
DS1 ENDS

PUBLIC m3
EXTRN m2:far

CS1 SEGMENT PARA PUBLIC 'CODE'
	assume CS:CS1, DS:DS1, SS:STK

m1:
	mov ax, ds1
	mov ds, ax
	
	jmp m2

m3:
	mov ax, 4c00h
	int 21h

CS1 ENDS

PUBLIC X

END m1