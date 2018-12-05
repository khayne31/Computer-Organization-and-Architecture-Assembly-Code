
;;====================================================
;; CS 2110 - Fall 2018
;; Timed Lab 3
;; timedlab3.asm
;;====================================================
;; Name:
;;====================================================

.orig x3000
LD R0, STR_ADDR; i=0
LOOP LDR R1, R0, 0; current char
BRz END; if current char is zero end
LD R2, ZERO_OFFSET;
NOT R2,R2;
ADD R2,R2,1; R2
ADD R3, R1, R2; current_char - 48
BRn ADD_SPACE;if the ascii value < 48(nt numeric)
LD R2, NINE_OFFSET;
NOT R2, R2;
ADD R2,R2,1; -r2
ADD R3, R1, R2; current_car - 57
BRP ADD_SPACE; if ascii value > 57(not numeric)
ADD R0, R0, 1;
BR LOOP;
ADD_SPACE LD R4, SPACE; R4 = 32
STR R4, R0, 0;
ADD R0,R0,1; i++
BR LOOP;
END HALT


;; YOUR CODE HERE :D

STR_ADDR .fill x5000
ZERO_OFFSET .fill 48
NINE_OFFSET .fill 57
SPACE .fill 32
.end

.orig x5000
  .stringz "a3hf5k32ss"
.end
