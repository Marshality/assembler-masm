.386
.model flat, pascal

public setcler

.code
setcler:
	push ebp
	mov  ebp, esp
	add  ebp, 8

	mov  ebx, [ebp + 8] ; x
	mov  eax, [ebp + 4] ; n
	mov  ecx, [ebp]		; p

	cmp  eax, 0
	je   m
	add  ebx, 4

	m:
		cmp  ecx, 0
		je   zero
		jmp  one

		zero:
			btr  [ebx], eax
			jmp  exit

		one:
			bts  [ebx], eax

exit:
	pop  ebp

	ret  12
end
