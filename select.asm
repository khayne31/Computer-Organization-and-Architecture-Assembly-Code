;;====================================
;; CS 2110 - Fall 2018
;; Homework 6
;;====================================
;; Name:
;;====================================

.orig x3000

  ;; YOUR CODE HERE :D
AND R0, R0, #0; clears R0. this will be the iteration variable(i)
LD R1, ARRAY_LEN; loads the length of the array into R1
LDI R2, ARRAY_ADDR; loads R2 with ARRAY_ADDR[MIN_VALUE] ------------------------------------------------>
AND R3,R3,#0;
ADD R3, R3,#1; this will be the iteration variable(j)
LD R4,ARRAY_ADDR; puts the adrress held by ARRAY_ADDR in R4 <---------
ADD R4,R4, R3; puts the adress plus j into R4
LDR R7, R4, #0; ARRAY_ADDR[j]
NOT R6,R7; NOT ARRAY[j]
ADD R6,R6,#1; -ARRAY[j]
ADD R6,R6,R2; ARRAY[MIN] - ARRAY[j]
BRn #2; 
ADD R2, R7, #0; sets ARRAY[MIN] = ARRAY[J]
ADD R5, R3, #0; store the j value of the current ARRAY[MIN]
ADD R3, R3, #1; j++
NOT R6,R1; NOT ARRAY_LEN
ADD R6,R6,#1; -ARRAY_LEN
ADD R6, R6, R3; j - ARRAY_LEN
BRn #-14; loops back when j < ARRAY_LEN <-------------
LDI R7, ARRAY_ADDR; puts ARRAY[i] into R7
LD R4, ARRAY_ADDR;
STI R2, ARRAY_ADDR;
ADD R4, R4, R5; ADDR[ARRAY[i+j]]
STR R7, R4, #0; store ARRAY[i] in ARRAY[i+j] which should be the min value
ADD R0,R0,#1; i++
LD R6, ARRAY_ADDR; 
ADD R6, R6, #1;
ST R6, ARRAY_ADDR
ADD R1,R1, #-1;
AND R5, R5, #0
LD R6, ARRAY_LEN;
NOT R6,R6; NOT ARRAY_LEN
ADD R6,R6,#2; -(ARRAY_LEN-1)
ADD R6, R6, R0; (i - ARRAY_LEN-1)
brn #-33; ------------------------------------------------------------->
NOT R1, R0
ADD R1,R1,#1
LD R2, ARRAY_ADDR
ADD R2, R2, R1
ST R2, ARRAY_ADDR
HALT

ARRAY_ADDR .fill x4000
ARRAY_LEN  .fill 10

.end

.orig x4000
  .fill 7
  .fill 18
  .fill 0
  .fill 5
  .fill 9
  .fill 25
  .fill 1
  .fill 2
  .fill 10
  .fill 6
.end
