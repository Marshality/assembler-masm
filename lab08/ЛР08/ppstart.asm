.386
.model FLAT, PASCAL

PUBLIC START
EXTERN COUNT	: NEAR
EXTERN SETCLER	: NEAR
EXTERN X_U_Y	: NEAR
EXTERN X_Y		: NEAR

.DATA
S		DD		0, 0, 0, 0
S1		DD		00001111000011110000111100001111B, 1010101B
S2		DD		00111100001111000011110000111100B, 1000001B

L		DD		39
N		DD		7
P		DD		1

.CODE
START:
	push offset s1
	push l
	call count
	
	push offset s
	push 34
	push 1
	call setcler
	
	push offset s2
	push 34
	push 1
	call setcler
	
	push offset s
	push 34
	push 0
	call setcler
	
	push offset s2
	push 34
	push 0
	call setcler
	
	push offset s1
	push offset s2
	push l
	call x_y
	
	push offset s1
	push offset s2
	push 38
	call x_y

	RET
END
