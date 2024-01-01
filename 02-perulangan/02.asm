    ; nasm -f elf64 02.asm &&  ld 02.o -o 02 && ./02
	; Program perulangan [2]
	; * * * * * 
	; * * * * 
	; * * * 
	; * * 
	; * 
	
	global _start
	
	section .data
	bintang db "*"
	newline db 0x0a
	
	section .text
_start:
    mov rbx, 5
    mov rcx, 0

outerLoop:
    call innerLoop
    mov rsi, newline
    call print
    dec rbx
    cmp rbx, 0
    jg outerLoop
    call exit

innerLoop:
    mov rsi, bintang
    call print
    inc rcx
    cmp rcx, rbx
    jl innerLoop
    xor rcx, rcx
    ret

print:
	push rcx
	mov rax, 1
	mov rdi, 1
	mov rdx, 1
	syscall
	pop rcx
	ret

exit:
    mov rax, 60
    mov rdi, 0
    syscall