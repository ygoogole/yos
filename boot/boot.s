; Multiboot standard header
; offset 	type	name		mandatory
; 0			u32		magic		Y
; 4			u32		flags		Y
; 8			u32		checksum 	Y

MBOOT_HEADER_MAGIC 	equ 	0x1BADB002 	; Multiboot magic number

MBOOT_PAGE_ALIGN 	equ 	1 << 0    	; 0 : aligned by page (4KB)
MBOOT_MEM_INFO 		equ 	1 << 1    	; 1 , tell GRUB to include memory info into Multiboot info struct

MBOOT_HEADER_FLAGS 	equ 	MBOOT_PAGE_ALIGN | MBOOT_MEM_INFO

; magic + flags + checksum = 0
MBOOT_CHECKSUM 		equ 	- (MBOOT_HEADER_MAGIC + MBOOT_HEADER_FLAGS)

;-----------------------------------------------------------------------------

[BITS 32]  	; to compile codes in 32 bit

section .text 	; code section starts here

; rquired Multiboot flags

dd MBOOT_HEADER_MAGIC 	
dd MBOOT_HEADER_FLAGS  
dd MBOOT_CHECKSUM     

[GLOBAL start] 		; entry of kernel code
[GLOBAL glb_mboot_ptr] 	; global struct multiboot * var
[EXTERN kern_entry] 	; entry of kernel C function

start:
	cli 					; turn off interrupt 			 
	mov esp, STACK_TOP  	 ; set stack address
	mov ebp, 0 		 ; 
	and esp, 0FFFFFFF0H	 ; 16 bytes alignment of stack address
	mov [glb_mboot_ptr], ebx ; save ebx pointer to global var
	call kern_entry		 ; call entry function
stop:
	hlt 			 ; halt instruction
	jmp stop 		 ; loop

;-----------------------------------------------------------------------------

section .bss 			 ; uninitialised data section
stack:
	resb 32768 	 	 ; kernel stack
glb_mboot_ptr: 		 ; global multiboot struct pointer
	resb 4

STACK_TOP equ $-stack-1 	 ; top of kernel stack, $ is current address

;-----------------------------------------------------------------------------
