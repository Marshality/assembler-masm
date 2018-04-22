STK SEGMENT PARA STACK 'STACK'
	db 100 dup(0)
STK ENDS

DS1 SEGMENT PARA COMMON 'DATA'
	db 65534 dup(?)
	c1 db 1
DS1 ENDS

DS2 SEGMENT PARA COMMON 'DATA'
	db 65534 dup(?)
	c2 db 2
DS2 ENDS

DS3 SEGMENT PARA COMMON 'DATA'
	db 65534 dup(?)
	c3 db 3
DS3 ENDS

CSEG SEGMENT PARA PUBLIC 'CODE'
	assume CS:CSEG, DS:DS1
main:
	mov ax, DS1
	mov ds, ax
	
	mov ah, 02
	mov dl, '0'
	add dl, c1
	
	int 21h

        mov dl, 10
        int 21h

        mov dl,13
        int 21h
	
	assume DS:DS2
	
	mov ax, DS2
	mov ds, ax
	
	mov ah, 02
	mov dl, '0'
	add dl, c2
	
	int 21h

        mov dl, 10
        int 21h

        mov dl,13
        int 21h
	
	assume DS:DS3
	
	mov ax, DS3
	mov ds, ax
	
	mov ah, 02
	mov dl, '0'
	add dl, c3
	
	int 21h
	
	mov ax, 4c00h
	int 21h

CSEG ENDS
END main

END 