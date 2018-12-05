
;;====================================================
;; CS 2110 - Fall 2018
;; Timed Lab 4
;; converge.asm
;;====================================================
;; Name:
;;====================================================

.orig x3000

;; Don't try to run this code directly, since it only contains
;; subroutines that need to be invoked using the LC-3 calling
;; convention. Use Debug > Setup Test or Simulate Subroutine
;; Call in complx instead.
;;
;; Do not remove this line or you will break...
;; 'Simulate Subroutine Call'

halt

converge

; [ implement converge here ]
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

    
    LD R4, DIV_ADDR
    LDR R0, R5, 4; stores n in R0
    ADD R1, R0, -1; n-1
    BRz RETZ;
    ADD R6, R6, -2; push stack up by two
    STR R0, R6, 0; pass n in to divide as param 1
    AND R1, R1, 0; clear R1
    ADD R1, R1, 2; set R1 to 2
    STR R1, R6, 1; pass 2 unto divide as param 2
    JSRR R4;
    LDR R1, R6, 0; puts the return value for divide into R1
    ADD R6, R6, -1; push stack up
    AND R2, R0, 1; AND n with (2-1) for n%2
    BRz RCONE;
    BR  RCTWO;
    RCONE STR R1, R6, 0; pass div into converge
    BR ACTION
    RCTWO ADD R3, R0, R0; R3 <- 2n
    ADD R3, R3, R0; 3n
    ADD R3, R3, 1; 3n+1
    STR R3, R6, 0; pass in 3n+1 to converge
    ACTION  JSR converge
    LDR R3, R6, 0; value from converge
    ADD R3, R3, 1; converge(div) + 1
    ADD R6, R6, 5; 
    BR END

    RETZ AND R3, R3, 0
    END STR R3, R5, 3; store the return value in R5+3
   


    LDR R4, R6, 0   ;reload R4
    LDR R3, R6, 1   ;reload R3
    LDR R2, R6, 2   ;reload R2
    LDR R1, R6, 3   ;reload R1
    LDR R0, R6, 4
    ADD R6, R6, 5   ;add the stack pointer
    LDR R5, R6, 0   ;reload old FP
    LDR R7, R6, 1   ;reload return address
    ADD R6, R6, 2   ;put the stack pointer at the rv
    RET

STACK    .fill xF000
DIV_ADDR .fill x6000 ;; Call the divide subroutine at
                     ;; this address!

.end

;;====================================================
;;   divide(n, d): Takes a numerator (n) and
;;                 denominator (d), returning n / d.
;;====================================================
.orig x6000
divide  ;; DO NOT call JSR with this label! Use DIV_ADDR instead!
  .fill x1DBD
  .fill x7F81
  .fill x7B80
  .fill x1BBF
  .fill x1DBB
  .fill x7140
  .fill x737F
  .fill x757E
  .fill x777D
  .fill x797C
  .fill x6144
  .fill x6345
  .fill x54A0
  .fill x1620
  .fill x987F
  .fill x1921
  .fill x1903
  .fill x0805
  .fill x14A1
  .fill x987F
  .fill x1921
  .fill x16C4
  .fill x0FF7
  .fill x7543
  .fill x6140
  .fill x637F
  .fill x657E
  .fill x677D
  .fill x697C
  .fill x1D61
  .fill x6B80
  .fill x1DA1
  .fill x6F80
  .fill x1DA1
  .fill xC1C0
.end
