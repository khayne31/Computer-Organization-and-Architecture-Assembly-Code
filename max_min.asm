;;====================================
;; CS 2110 - Fall 2018
;; Homework 6
;;====================================
;; Name:
;;====================================

.orig x3000
AND R1,R1,#0; clears R1(i)
LD R0, HEAD_ADDR; node 
LD R5, HEAD_ADDR;
BRz #22;----------------------------NULL-------------------
ADD R3, R0, #1
LDR R6, R3, #0; data
ADD R2, R6, #0; MIN = FIRST DATA
ADD R3, R6, #0; MAX = FIRST DATA
LD R0, HEAD_ADDR; <----------------------
ADD R0, R0, R1
LDR R5, R0, #0; next
ADD R0, R0, #1
LDR R6, R0, #0; data
NOT R7, R6
ADD R7, R7, #1; -data
NOT R4, R2
ADD R4, R4, #1; -MIN
ADD R4, R4, R6; data - MIN
BRzp #1; --------------------------------------MIN------------------------------
ADD R2, R6, #0
ADD R4, R7, R3; MAX-data
BRzp #1; -----------------------------------MAX-------------------------------
ADD R3, R6, #0
ADD R1, R1, #2; i+2
ADD R5, R5, #0;
BRz #3;
BR #-19; <-----------------------
LD R2, MIN_INT
LD R3, MAX_INT
ST R2, ANSWER_MIN
ST R3, ANSWER_MAX
HALT
  ;; YOUR CODE HERE :D

HEAD_ADDR  .fill x4000

MAX_INT    .fill x7FFF
MIN_INT    .fill x8000

ANSWER_MAX .blkw 1
ANSWER_MIN .blkw 1

.end

.orig x4000
  .fill x4002         ;; Node 1
  .fill 7
  .fill x4004         ;; Node 2
  .fill 2
  .fill x4006         ;; Node 3
  .fill 4
  .fill x4008         ;; Node 4
  .fill 2
  .fill x0000         ;; Node 5
  .fill 15
.end
