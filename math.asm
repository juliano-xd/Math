.text
    .globl _bigSum
    .globl _bigSub
    .globl _bigMul

_bigSum:
    clc
    movq 24(%rsi), %rax
    addq %rax, 24(%rdi)
    movq 16(%rsi), %rax
    adcq %rax, 16(%rdi)
    movq 8(%rsi), %rax
    adcq %rax, 8(%rdi)
    movq (%rsi), %rax
    adcq %rax, (%rdi)
    ret

_bigSub:
    clc
    movq 24(%rsi), %rax
    subq %rax, 24(%rdi)
    movq 16(%rsi), %rax
    sbbq %rax, 16(%rdi)
    movq 8(%rsi), %rax
    sbbq %rax, 8(%rdi)
    movq (%rsi), %rax
    sbbq %rax, (%rdi)
    ret

_bigMul:
    movq 24(%rdi), %rax
    mulq 24(%rsi)
    movq %rax, %r8
    movq %rdx, %r9
    movq 16(%rdi), %rax
    mulq 24(%rsi)
    addq %rax, %r9
    adcq %rdx, %r10
    movq 8(%rdi), %rax
    mulq 24(%rsi)
    addq %rax, %r10
    adcq %rdx, %r11
    movq (%rdi), %rax
    mulq 24(%rsi)
    addq %rax, %r11
    movq %r11, (%rdi)
    movq 24(%rdi), %rax
    mulq 16(%rsi)
    addq %rax, %r9
    adcq %rdx, %r10
    adcq $0, (%rdi)
    movq 16(%rdi), %rax
    mulq 16(%rsi)
    addq %rax, %r10
    adcq %rdx, (%rdi)
    movq 8(%rdi), %rax
    mulq 16(%rsi)
    addq %rax, (%rdi)
    movq %r10, 8(%rdi)
    movq 24(%rdi), %rax
    mulq 8(%rsi)
    addq %rax, 8(%rdi)
    adcq %rdx, (%rdi)
    movq 16(%rdi), %rax
    mulq 8(%rsi)
    addq %rax, (%rdi)
    movq 24(%rdi), %rax
    mulq (%rsi)
    addq %rax, (%rdi)
    movq %r9, 16(%rdi)
    movq %r8, 24(%rdi)
    ret
.section .note.GNU-stack,"",@progbits
