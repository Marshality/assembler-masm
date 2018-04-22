DS2 SEGMENT PARA PUBLIC 'DATA'
	Y db 'Y'
DS2 ENDS

EXTRN X:byte

PUBLIC m2
EXTRN m3:far

CS2 SEGMENT PARA PUBLIC 'CODE'
	assume CS:CS2, ES:DS2

m2:
	mov ax, ds2
	mov es, ax

	mov bh, x
	mov bl, y
	
	xchg bh, bl
	
	mov x, bh
	mov y, bl
	
	jmp m3
	
CS2 ENDS
end