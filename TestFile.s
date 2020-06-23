section .data


	check db "Program is running....", 10 ;24
	testNUM db 48
	newLine db 10
	checkAGNST db 255

section .text

	global _start


_start:



	call _runCHK

	call _incrementDAT

	call _exit	



_PrintTestNum:

	mov rax, 1
	mov rdi, 1
	mov rsi, testNUM
	mov rdx, 1
	syscall
	mov rax, 1
	mov rdi, 1
	mov rsi, newLine
	mov rdx, 1
	syscall
	ret


_incrementDAT:

	mov rax, 1
	add [testNUM], rax
	call _PrintTestNum


	mov rax, testNUM
	cmp rax, 1

	jg _incrementDAT


	ret

_runCHK:

	mov rax, 1
	mov rdi, 1
	mov rsi, check
	mov rdx, 23
	syscall
	ret


_exit:


	mov rax, 60
	mov rdi, 0
	syscall 
	ret

