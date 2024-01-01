	; nasm -f elf64 hello-world.asm &&  ld hello-world.o -o hello-world && ./hello-world
	global _start
	
	section .data
	hello_world db "Hello World", 0x0a
	hello_world_length equ $ - hello_world
	SYS_WRITE equ 1
	STD_OUT equ 1
	SYS_EXIT equ 60
	EXIT_SUCCESS equ 1
	
	
	section .text
_start:
	; Write Hello World
	mov rax, SYS_WRITE           ; rax : 1 (write)
	mov rdi, STD_OUT             ; rdi : 1 (stdout)
	mov rsi, hello_world         ; pointer ke teks hello_world
	mov rdx, hello_world_length  ; panjang dari teks hello_world
	syscall                      ; panggil write syscall untuk mencetak teks hello_world
	
	; Exit Program
	mov rax, SYS_EXIT            ; rax : 60 (exit)
	mov rdi, EXIT_SUCCESS        ; rdi : 0 (return 0)
	syscall                      ; panggil exit syscall untuk menghentikan program
