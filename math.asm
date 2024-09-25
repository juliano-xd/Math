bits 64
section .text

global bigSumOne
global bigSum
global bigSubOne
global bigSub
global bigMul
global bigEql
global bigDif
global bigGreater
global bigLess

bigGreater:
    mov al, 1
    mov rcx, [rdi]
    cmp rcx, [rsi]
    jg end
    mov rcx, [rdi + 8]
    cmp rcx, [rsi + 8]
    jg end
    mov rcx, [rdi + 16]
    cmp rcx, [rsi + 16]
    jg end
    mov rcx, [rdi + 24]
    cmp rcx, [rsi + 24]
    jg end
    xor al, al
    ret

bigLess:
    mov al, 1
    mov rcx, [rdi]
    cmp rcx, [rsi]
    jl end
    mov rcx, [rdi + 8]
    cmp rcx, [rsi + 8]
    jl end
    mov rcx, [rdi + 16]
    cmp rcx, [rsi + 16]
    jl end
    mov rcx, [rdi + 24]
    cmp rcx, [rsi + 24]
    jl end
    xor al, al
    ret

bigEql:
    vmovdqu ymm0, [rdi]
    vmovdqu ymm1, [rsi]
    vpxor ymm0, ymm0, ymm1
    vptest ymm0, ymm0
    setz al
    ret

bigDif:
    vmovdqu ymm0, [rdi]
    vmovdqu ymm1, [rsi]
    vpxor ymm0, ymm0, ymm1
    vptest ymm0, ymm0
    setnz al
    ret

bigSumOne:
    clc
    add qword [rdi + 24], 1
    jnc end
    adc qword [rdi + 16], 0
    jnc end
    adc qword [rdi + 8], 0
    jnc end
    adc qword [rdi], 0
end:ret

bigSum:
    clc
    mov rax, [rdi + 24]
    add rax, [rsi + 24]
    mov [rdi + 24], rax
    mov rax, [rdi + 16]
    adc rax, [rsi + 16]
    mov [rdi + 16], rax
    mov rax, [rdi + 8]
    adc rax, [rsi + 8]
    mov [rdi + 8], rax
    mov rax, [rdi]
    adc rax, [rsi]
    mov [rdi], rax
    ret

bigSubOne:
    clc
    sub qword [rdi + 24], 1
    jnc end
    sbb qword [rdi + 16], 0
    jnc end
    sbb qword [rdi + 8], 0
    jnc end
    sbb qword [rdi], 0
    ret

bigSub:
    clc
    mov rax, [rdi + 24]
    sub rax, [rsi + 24]
    mov [rdi + 24], rax
    mov rax, [rdi + 16]
    sbb rax, [rsi + 16]
    mov [rdi + 16], rax
    mov rax, [rdi + 8]
    sbb rax, [rsi + 8]
    mov [rdi + 8], rax
    mov rax, [rdi]
    sbb rax, [rsi]
    mov [rdi], rax
    ret

bigMul:
    xor r8, r8
    xor r9, r9
    xor r10, r10
    xor r11, r11
    mov rcx, [rsi + 24]
    test rcx, rcx
    jz Z1
    mov rax, [rdi + 24]
    mul rcx
    mov r8, rax
    mov r9, rdx
    mov rax, [rdi + 16]
    mul rcx
    add r9, rax
    mov r10, rdx
    adc r10, 0
    mov rax, [rdi + 8]
    mul rcx
    add r10, rax
    mov r11, rdx
    adc r11, 0
    mov rax, [rdi]
    mul rcx
    add r11, rax
    Z1:
    mov rcx, [rsi + 16]
    test rcx, rcx
    jz Z2
    mov rax, [rdi + 24]
    mul rcx
    add r9, rax
    adc r10, rdx
    mov rax, [rdi + 16]
    mul rcx
    add r10, rax
    adc r11, rdx
    mov rax, [rdi + 8]
    mul rcx
    adc r11, rax
    Z2:
    mov rcx, [rsi + 8]
    test rcx, rcx
    jz Z3
    mov rax, [rdi + 24]
    mul rcx
    add r10, rax
    adc r11, rdx
    mov rax, [rdi + 16]
    mul rcx
    add r11, rax
    Z3:
    mov rcx, [rsi]
    test rcx, rcx
    jz Z4
    mov rax, [rdi + 24]
    mul rcx
    add r11, rax
    Z4:
    mov [rdi + 24], r8
    mov [rdi + 16], r9
    mov [rdi + 8], r10
    mov [rdi], r11
    ret

bigDiv: ; TODO
    ret

section .note.GNU-stack noalloc noexec nowrite progbits
