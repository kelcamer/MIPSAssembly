# Kelsey Cameron  10/19/2016
# Project-2-Code-A-Cameron-Kelsey-- A program that determines how many GOKNIGHTS there are in a sentence.
# This is only for lowercase letters.
# Registers used:
# $t0 - used to hold the input string
# $a0 - used to hold the address of string
# $v0 - syscall parameter and return value
# $t1 - main counter for the loop
# $t2 - loads byte into t2
# $t3 = counter for g
# $t4 = counter for o
# $t5 = counter for k
# $t6 = counter for n
# $t7 = counter for i

# $s1 = counter for h
# $s2 = counter for t
# $s3 = counter for s
# $s4 = loop histogram counter
.data
#buffer:	.space 100
hashtag: .asciiz "#"
Gc:	.asciiz "G: "
Oc:	.asciiz "O: "
Kc:	.asciiz "K: "
Nc:	.asciiz "N: "
Ic:	.asciiz "I: "
Hc:	.asciiz "H: "
Tc:	.asciiz "T: "
Sc:	.asciiz "S: "

G:	.asciiz "G: ----------- "
O:	.asciiz "O: ----------- "
K:	.asciiz "K: ----------- "
N:	.asciiz "N: ----------- "
I:	.asciiz "I: ----------- "
H:	.asciiz "H: ----------- "
T:	.asciiz "T: ----------- "
S:	.asciiz "S: ----------- "
newline: .asciiz "\n"
str1:	.asciiz "Dogs always listen to people and do their best to please their owners, sadly, people rarely do the same."
.text
main:
	
	la $t0, str1

loop:
	lb $t2, 0($t0)		# sets t2 equal to the address of the string starting at index 0 of t0
	beq $t2, 0, continue2	# if t2 has the value of zero, exit
	
	bne $t2, 103, continueo	# if t2 != g, then continue and increment counter
	addi $t3, $t3, 1
	j continue
	
	continueo:
	bne $t2, 111, continuek	# if t2 != o, then continue and increment counter
	addi $t4, $t4, 1
	j continue
	
	continuek:
	bne $t2, 107, continuen	# if t2 != k, then continue and increment counter
	addi $t5, $t5, 1
	j continue
	
	continuen:
	bne $t2, 110, continuei	# if t2 != n, then continue and increment counter
	addi $t6, $t6, 1
	j continue
	
	continuei:
	bne $t2, 105, continueh	# if t2 != i, then continue and increment counter
	addi $t7, $t7, 1
	j continue
	
	continueh:
	bne $t2, 104, continuet	# if t2 != h, then continue and increment counter
	addi $s1, $s1, 1
	j continue
	
	continuet:
	bne $t2, 116, continues	# if t2 != t, then continue and increment counter
	addi $s2, $s2, 1
	j continue
	
	continues:
	bne $t2, 115, continue	# if t2 != s, then continue and increment counter
	addi $s3, $s3, 1
	j continue
	
	continue:
	addi $t0, $t0, 1	# else go to next character
	
	

j loop
continue2:
	

	
exit:
	
	li $v0, 10	# exit
	syscall
	
	