.386
.model flat, c

public StrCopy

.code
StrCopy proc
    push   	ebp
	mov     ebp, esp 
	
    push    esi 
    push    edi 

    mov     ecx, [ebp + 16]
    mov     edi, [ebp + 12]
    mov     esi, [ebp + 8]

    mov     eax, edi       
    cld                     

    cmp     edi, esi
    je      exit            ; edi == esi
    jb      ltr             ; edi < esi

    std                   
    add     edi, ecx
    dec     edi
    add     esi, ecx
    dec     esi

    ltr:
    rep		movsb 	

    exit:
    pop  	edi
    pop  	esi
    pop  	ebp
    ret
	
StrCopy endp
end
