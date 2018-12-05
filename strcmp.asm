;;====================================
;; CS 2110 - Fall 2018
;; Homework 6
;;====================================
;; Name:
;;====================================

.orig x3000
AND R0,R0, #0; i
AND R1,R1, #0; j
LD R2, STR_ADDR_1;address of string 1 <------------ i
LD R3, STR_ADDR_2;address of string 2 <------------ j
ADD R2, R2, R0; STR_ADDR_1+i
ADD R3, R3, R1; STR_ADDR_2+j
LDR R4, R2, #0
LDR R5, R3, #0
NOT R4, R4
ADD R4,R4, #1
ADD R6, R4, R5; STR2[j] - STR1[i]
BRzp #3; STR1 > STR2
AND R6,R6,#0
ADD R6,R6, #1; answer = -1
BR #13
ADD R6, R4, R5; STR2[j] - STR1[i]
BRnz #3; STR2 > STR1
AND R6,R6,#0
ADD R6,R6, #-1; answer = 1
BR #8
ADD R6, R4, R5; STR2[j] - STR1[i]
BRnp #1; STR1 == STR2
AND R6,R6,#0; answer = 0
ADD R4,R4,#0
BRz #3 
ADD R0, R0, #1
ADD R1, R1, #1
BRp #-26; <-------------------- i
ST R6, ANSWER
HALT


  ;; YOUR CODE HERE :D

STR_ADDR_1 .fill x4000
STR_ADDR_2 .fill x4050

ANSWER     .blkw 1

.end

.orig x4000
  .stringz "same"
.end

.orig x4050
  .stringz "same"
.end
