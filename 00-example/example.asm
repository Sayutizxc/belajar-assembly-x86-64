	; nasm -f elf64 example.asm && ld example.o -o example -lc --dynamic-linker/lib64/ld-linux-x86-64.so.2 && ./example

	; example program
	global _start
	extern printf

	; Define constants
	section .data
	outFormat db "%d", 0x0a, 0x00
	EXIT_SUCCESS equ 0
	SYS_EXIT equ 60
	
	; Byte (8 - bit) variable declarations
	bVar1 db 10
	bVar2 db 5
	bResult db 1
	
	; Word (16 - bit) variable declarations
	wVar1 dw 10000
	wVar2 dw 5000
	wResult dw 0
	
	; Double - word (32 - bit) variable declarations
	dVar1 dd 10000000
	dVar2 dd 5000000
	dResult dd 0
	
	; Quadword (64 - bit) variable declarations
	qVar1 dq 100000000
	qVar2 dq 50000000
	qResult dq 0
	
	section .text
_start:
	; Byte example
	; bResult = bVar1 + bVar2
	mov al, byte [bVar1]
	add al, byte [bVar2]
	mov byte [bResult], al
	mov bl, byte [bResult]
	call print
	
	; Word example
	; wResult = wVar1 + wVar2
	mov ax, word [wVar1]
	add ax, word [wVar2]
	mov word [wResult], ax
	mov bx, word [wResult]
	call print
	
	; Double - word example
	; dResult = dVar1 + dVar2
	mov eax, dword [dVar1]
	add eax, dword [dVar2]
	mov dword [dResult], eax
	mov ebx, dword [dResult]
	call print
	
	; Quadword example
	; qResult = qVar1 + qVar2
	mov rax, qword [qVar1]
	add rax, qword [qVar2]
	mov qword [qResult], rax
	mov rbx, qword [qResult]
	call print
	
	; Done, terminate program.
last:
	mov rax, SYS_EXIT
	mov rdi, EXIT_SUCCESS
	syscall

	; Call Printf function	
print:
	xor rax, rax
	mov rdi, outFormat
	mov rsi, rbx
	call printf
	ret
