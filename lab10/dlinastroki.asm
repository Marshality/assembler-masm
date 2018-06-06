.386
.model flat, c

public DlinaStroki 

.code
DlinaStroki proc
	
    push ebp
    mov  ebp, esp
    push edi

    mov  edi, [ebp + 8]
	mov edx, edi 
	
	mov al, 0 
	cld   		

	mov ecx, -1

	repne scasb 
	sub edi, edx
	dec edi 
	mov eax, edi
	
	pop  edi
    pop  ebp
    ret
	
DlinaStroki endp
end
