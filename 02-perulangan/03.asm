	; nasm -f elf64 03.asm &&  ld 03.o -o 03 && ./03
	; Program perulangan [3]
	;     *
	;    ***
	;   *****
	;  *******
	; *********

	
	global _start
	
	section .data
	bintang db "*"
	space db " "
	newline db 0x0a
	
	section .text
_start:
	mov rbx, 1                   ; loop kebawah
	mov rcx, 5                   ; awal bintang
	mov rdx, 5                   ; akhir bintang
	
outerLoop:
	xor r8, r8                   ; r8 = 0
	call innerLoop
	call printNewLine
	inc rbx
	cmp rbx, 5
	js outerLoop
	call exit
	
innerLoop:
	cmp r8, rcx
	js printSpace
	cmp r8, rdx
	jle printBintang
	dec rcx
	inc rdx
	ret
	
printSpace:
	mov rsi, space
	call print
	inc r8
	jmp innerLoop
	
printBintang:
	mov rsi, bintang
	call print
	inc r8
	jmp innerLoop
	
printNewLine:
	mov rsi, newline
	call print
	ret
	
print:
	push rcx
	push rdx
	mov rax, 1
	mov rdi, 1
	mov rdx, 1
	syscall
	pop rdx
	pop rcx
	ret
	
exit:
	mov rax, 60
	mov rdi, 0
	syscall
