
;;====================================
;; CS 2110 - Fall 2018
;; Homework 7
;; handshake.asm
;;====================================
;; Name:
;;====================================

; Little reminder from your pals: don't run this directly by pressing
; ``Run'' in complx, since (look below) there's nothing put at address
; x3000. Instead, load it and use ``Debug'' -> ``Simulate Subroutine
; Call'' and choose the ``strlen'' label.

.orig x3000

halt

handshake

; [ implement handshake here ]
ADD R6, R6, -3   ;initialize space for everything
    STR R7, R6, 1    ;store RA
    STR R5, R6, 0    ;store old FP
    ADD R6, R6, -5   ;initialize space for registers
    ADD R5, R6, 4    ;place new FP
    STR R0, R6, 4    ;store R0 on the stack
    STR R1, R6, 3    ;store R1 on the stack
    STR R2, R6, 2    ;store R2 on the stack
    STR R3, R6, 1    ;store R3 on the stack
    STR R4, R6, 0

LDR R0, R5, #4; n
BRnz ZERO; if n == 0
ADD R6, R6, -1; move the stack up to make room for n-1
ADD R0, R0, -1; n-1
STR R0, R6, 0
JSR handshake
LDR R2, R6, 0; handshake(n-1) 
ADD R1, R2, R0

BR STORE
ZERO AND R1, R0, 0;
ADD R6, R6, -2
STORE STR R1, R5, 3

   LDR R4, R6, 2   ;reload R3
    LDR R3, R6, 3   ;reload R2
    LDR R2, R6, 4   ;reload R1
    LDR R1, R6, 5   ;reload R0
    LDR R0, R6, 6
    ADD R6, R6, 7   ;add the stack pointer
    LDR R5, R6, 0   ;reload old FP
    LDR R7, R6, 1   ;reload return address
    ADD R6, R6, 2   ;put the stack pointer at the rv
    RET
; Needed by Simulate Subroutine Call in complx
STACK .fill xF000
.end



; You should not have to LD from any label, take the
; address off the stack instead :)
