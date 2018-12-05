;;====================================
;; CS 2110 - Fall 2018
;; Homework 6
;;====================================
;; Name:
;;====================================

.orig x3000

  ;; YOUR CODE HERE :D

LD R1,A; load A into R1
LD R2,B; load B into R2
NOT R1,R1; NOTS A
NOT R2,R2; NOTS B
AND R1, R1, R2; ANDS R1 and R2 and stores it in R1
NOT R1, R1; NOTS R1
ST R1, ANSWER
HALT


A      .fill x1010
B      .fill x0404

ANSWER .blkw 1

.end
