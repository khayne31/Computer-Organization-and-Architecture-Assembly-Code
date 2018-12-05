;;====================================
;; CS 2110 - Fall 2018
;; Homework 6
;;====================================
;; Name:
;;====================================

.orig x3000
LD R0, MEM1
LEA R1, MEM2
LDI R2, MEM3
LDR R3, R1, 1
HALT

  ;; YOUR CODE HERE :D

MEM1    .fill x3001
MEM2    .fill xCAFE
MEM3    .fill x3006

ANSWER_MAX .blkw 1
ANSWER_MIN .blkw 

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
