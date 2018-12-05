 ;;====================================
;; CS 2110 - Fall 2018
;; Homework 7
;; buildheap.asm
;;====================================
;; Name:
;;====================================

; Little reminder from your pals: don't run this directly by pressing
; ``Run'' in complx, since (look below) there's nothing put at address
; x3000. Instead, load it and use ``Debug'' -> ``Simulate Subroutine
; Call'' and choose the ``strlen'' label.

.orig x3000

halt

heapify

; [ implement heapify here ]

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

LDR R0, R5, #4; address of the first element in the array
ST R0, ADDR; store the value of addr[first elemnt]
LDR R1, R5, #5; load the data the current node
ST R1, N; length of the array
LDR R2, R5, #6; i(LARGEST)
ST R2, I; stores the value of i
ADD R3, R2, R2; i*2
ADD R3, R3, 1; i*2+1(left child index)
ADD R4, R3, 1; i*2+2(right child index)
ADD R0, R0, R3; addr of left child
LDR R0, R0, 0; LEFT CHILD
NOT R1, R1
ADD R1, R1, 1; -n
ADD R1, R1, R3; left child index - n
BRzp FAIL; LEFT CHILD >= n
LD R1, ADDR
ADD R1, R1, R2; 0+i
LDR R1, R1, 0; LARGEST
NOT R1, R1
ADD R1, R1, 1; -LARGEST
ADD R1, R1, R0; LEFT CHILD - LARGEST
BRnz FAIL; LEFT CHILD <= LARGEST
ADD R2, R3, 0; i = LEFT CHILD INDEX

FAIL LD R1, N; n
LD R0, ADDR; index 0
ADD R0, R4, R0; i+RIGHT CHILD ADDRESS
LDR R0, R0,0; RIGHT CHILD
NOT R1, R1
ADD R1, R1, 1; -n
ADD R1, R1, R4; RIGHT CHILD index -N
BRzp ANOTHERFAIL; RIGHT CHILD >= n
LD R1, ADDR
ADD R1, R1, R2; 0+i
LDR R1, R1, 0; LARGEST
NOT R1, R1;
ADD R1, R1, 1; -LARGEST
ADD R1, R1, R0; RIGHT CHILD - LARGEST
BRnz ANOTHERFAIL; RIGHT CHILD <= LARGEST
ADD R2, R4, 0; i== RIGHT CHILD INDEX

;=========================================================================
;SWAP

ANOTHERFAIL LD R0, I
NOT R0,R0
ADD R0, R0, 1; -i
ADD R0, R2, R0; i - i(largest)
BRz SAME; largest == i

;============================================================================
LD R3, ADDR; i = 0
LD R4, ADDR; i = 0
ADD R4, R2, R4; 0+LARGEST INDEX
ST R2, LARGEST
LD R2, I
ADD R3, R2, R3; 0+i
LDR R1, R3, 0;temp(array[i])
LDR R0, R4, 0; (array[largest])
STR R0, R3, 0; array[i] = array[largest]
STR R1, R4, 0; array[largest] = temp

;RECURSION
ADD R6, R6, -3;
LD R3, ADDR
STR R3, R6, 0; param1 -> addr
LD R1, N;
STR R1, R6, 1; param2 -> n
LD R2, LARGEST
STR R2, R6, 2; parm2 -> largest
JSR heapify
BR LEAP

SAME
ADD R6, R6, -4
LEAP
    LDR R4, R6, 4   ;reload R3
    LDR R3, R6, 5   ;reload R2
    LDR R2, R6, 6   ;reload R1
    LDR R1, R6, 7   ;reload R0
    LDR R0, R6, 8
    ADD R6, R6, 9   ;add the stack pointer
    LDR R5, R6, 0   ;reload old FP
    LDR R7, R6, 1   ;reload return address
    ADD R6, R6, 2   ;put the stack pointer at the rv
    RET






buildheap

; [ implement buildheap here ]

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

LDR R0, R5, 4; address of the array
LDR R1, R5, 5; n
ADD R2, R1, 0; i = n
LOOP ADD R6, R6, -3
STR R0, R6, 0; PARAM 1
STR R1, R6, 1; PARAM 2
STR R2, R6, 2; PARAM 3
JSR heapify
ADD R6, R6, 4
ADD R2, R2, -1; i--
BRzp LOOP

 LDR R4, R6, 0   ;reload R3
    LDR R3, R6, 1   ;reload R2
    LDR R2, R6, 2   ;reload R1
    LDR R1, R6, 3   ;reload R0
    LDR R0, R6, 4
    ADD R6, R6, 5   ;add the stack pointer
    LDR R5, R6, 0   ;reload old FP
    LDR R7, R6, 1   ;reload return address
    ADD R6, R6, 2   ;put the stack pointer at the rv
    RET



; Needed by Simulate Subroutine Call in complx
STACK .fill xF000
ADDR .fill x0000
LARGEST .fill 0
N .fill 0
I .fill 0
.end

; You should not have to LD from any label, take the
; address off the stack instead :)
