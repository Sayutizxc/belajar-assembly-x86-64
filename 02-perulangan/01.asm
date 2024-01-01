	; nasm -f elf64 01.asm &&  ld 01.o -o 01 && ./01
	; Program perulangan [1]
	; * 
	; * * 
	; * * * 
	; * * * * 
	; * * * * * 
	
	global _start
	
	section .data
	bintang db "*"
	newline db 0x0a
	
	section .text
_start:
	mov rbx, 1                   ; set rbx = 1
	mov rcx, 1                   ; set rcx = 1
	
outerLoop:
	call innerLoop               ; panggil innerLoop
	cmp rbx, 5                   ; rbx - 5
	je exit                      ; jika hasilnya 0 maka exit
	inc rbx                      ; increment rbx
	mov rsi, newline             ; set rsi dengan newline \n
	call print                   ; panggil fungsi print
	jmp outerLoop                ; jump ke outerloop
	
innerLoop:
	mov rsi, bintang             ; set rsi dengan bintang "*"
	call print                   ; panggil fungsi print
	inc rcx                      ; increment rcx
	cmp rcx, rbx                 ; rcx - rbx
	jle innerLoop                ; jika kurang dari sama dengan 0 maka jump ke innerLoop
	mov rcx, 1                   ; set rcx = 1
	ret                          ; return
	
print:
	push rcx                     ; push rcx ke stack
	mov rax, 1                   ; set rax = 1 (sys_write)
	mov rdi, 1                   ; set rdi = 1 (std_out)
	mov rdx, 1                   ; sit rdx = 1
	syscall                      ; panggil sys_write
	pop rcx                      ; kembalikan nilai rcx dari stack
	ret                          ; return
	
exit:
	mov rax, 60                  ; set rax = 60 (sys_exit)
	mov rdi, 0                   ; set rdi = 0 (status code)
	syscall                      ; panggil sys_exit
