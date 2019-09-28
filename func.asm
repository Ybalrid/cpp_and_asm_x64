;See func.asm.hpp and main.cpp for "how to call these functions" from C++ code
.CODE

;This is just a function that return the number 42
;Return values are "whatever is in RAX" in x64
compute_answer PROC
mov rax, 101010b
ret
compute_answer ENDP

;The 4 first arguments are passed on by registers
;The registers used for this purpose are
; RCX - 1st arg
; RDX - 2nd arg
; R8  - 3rd arg
; R9  - 4th arg
sum_4_ints PROC
mov rax, rcx
add rax, rdx
add rax, r8
add rax, r9
ret
sum_4_ints ENDP

;subsequent arguments are pushed on the stack.
;however, there's also the return address and 4 "shadow" 64bit values
;that correspond to the space the 4 first args would have occupied
;If you do the maths, this means that 5th argument is 40 bytes up the sack,
;and 6th is 48 bytes up the stack, etc...
sum_6_ints PROC
mov rax, rcx
add rax, rdx
add rax, r8
add rax, r9
add rax, QWORD PTR [rsp + 40]
add rax, QWORD PTR [rsp + 48]
ret
sum_6_ints ENDP

;pointers are naturally passed as arguments in the same way;
;the following procedure act as the following C code would do
; int increment_pointer_int(int* pointer) { *pointer++; }
increment_pointer_int PROC
add DWORD PTR [rcx], 1		;DWORD PTR [address] means that we are accessing a 32bit value
ret
increment_pointer_int ENDP


;the following procedure allocate local variables on the stack
;this is not the most efficient way to do so here. This is for
;illustration only
swap PROC
push rsp
sub rsp, 4 ;We only have *one* variable, in general we would have one regiser acting as a base pointer
mov eax, DWORD PTR[rcx]
mov DWORD PTR[rsp], eax
mov eax, DWORD PTR[rdx]
mov DWORD PTR[rcx], eax
mov eax, DWORD PTR[rsp]
mov DWORD PTR[rdx], eax
add rsp, 4
pop rsp
ret
swap ENDP

END
