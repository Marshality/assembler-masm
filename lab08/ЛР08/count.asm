.386
.model flat, pascal

public count

.code
count:
	push ebp
	mov  ebp, esp
	add  ebp, 8
	
	xor  eax, eax
	mov  ebx, [ebp + 4] ; x
	mov  ecx, [ebp]		; l
	xor  edx, edx
	
	circ:
		bt   [ebx], edx
		jnc  zero
		inc  eax
	zero:
		inc  edx
		
		loop circ

	pop  ebp

	ret  8
end
