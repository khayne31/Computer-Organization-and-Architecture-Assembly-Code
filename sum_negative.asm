;;====================================
;; CS 2110 - Fall 2018
;; Homework 6
;;====================================
;; Name:
;;====================================

.orig x3000

  ;; YOUR CODE HERE :D
AND R0, R0, 0; clears R0 which will be the register which holds the sum
AND R3, R3, 0; clears r3...will be increment variable
LD R2, ARRAY_LEN; load the length of the array into the third register
LDI R1, ARRAY_ADDR; loads register one with the adress of the first item in the array
BRp #1
ADD R0,R0,R1; adds whatever is in R1 to R0
ADD R3,R3,#1; increments the address by 1
LD R5, ARRAY_ADDR
ADD R5, R5, #1
ST R5,ARRAY_ADDR
NOT R4,R2;loads NOT 7 into R$
ADD R4,R4,#1; adds 1 making it a negative number
ADD R4,R4,R3; adds -7 and the current increment value 
BRn #-11 
ST R0, ANSWER
HALT


ARRAY_ADDR .fill x4000
ARRAY_LEN  .fill 10

ANSWER     .blkw 1

.end

.orig x4000
  .fill 7
  .fill -18
  .fill 0
  .fill 5
  .fill -9
  .fill 25
  .fill 1
  .fill -2
  .fill 10
  .fill -6
.end
