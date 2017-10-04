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
str1:	.asciiz "gookkknnnniiiiihhhhhhtttttttssssssss."
.text
main:
	li $a0,0		# initializes all to zero
	la $t0, str1
	li $t1, 0
	li $t2, 0
	li $t3, 0
	li $t4, 0
	li $t5, 0
	li $t6, 0
	li $t7, 0
	li $s1, 0
	li $s2, 0
	li $s3, 0

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
	
	li $v0, 4		# prints the first G prompt
	la $a0, G
	syscall
	
	li $v0, 1		# prints how many G's were found
	addi $a0, $t3, 0
	syscall
	
	li $v0, 4		# prints new line
	la $a0, newline
	syscall
	
	li $v0, 4		# prints the first O prompt
	la $a0, O
	syscall
	
	li $v0, 1		# prints how many O's were found
	addi $a0, $t4, 0
	syscall
	
	li $v0, 4		# prints new line
	la $a0, newline
	syscall
	
	li $v0, 4		# prints the first K prompt
	la $a0, K
	syscall
	
	li $v0, 1		# prints how many K's were found
	addi $a0, $t5, 0
	syscall
	
	li $v0, 4		# prints new line
	la $a0, newline
	syscall
	
	li $v0, 4		# prints the first N prompt
	la $a0, N
	syscall
	
	li $v0, 1		# prints how many N's were found
	addi $a0, $t6, 0
	syscall
	
	li $v0, 4		# prints new line
	la $a0, newline
	syscall
	
	li $v0, 4		# prints the first I prompt
	la $a0, I
	syscall
	
	li $v0, 1		# prints how many I's were found
	addi $a0, $t7, 0
	syscall
	
	li $v0, 4		# prints new line
	la $a0, newline
	syscall
	
	li $v0, 4		# prints the second G prompt
	la $a0, G
	syscall
	
	li $v0, 1		# prints how many G's were found
	addi $a0, $t3, 0
	syscall
	
	li $v0, 4		# prints new line
	la $a0, newline
	syscall
	
	li $v0, 4		# prints the first H prompt
	la $a0, H
	syscall
	
	li $v0, 1		# prints how many H's were found
	addi $a0, $s1, 0
	syscall
	
	li $v0, 4		# prints new line
	la $a0, newline
	syscall
	
	li $v0, 4		# prints the first T prompt
	la $a0, T
	syscall
	
	li $v0, 1		# prints how many T's were found
	addi $a0, $s2, 0
	syscall
	
	
	li $v0, 4		# prints new line
	la $a0, newline
	syscall
	
	li $v0, 4		# prints the first S prompt
	la $a0, S
	syscall
	
	li $v0, 1		# prints how many S's were found
	addi $a0, $s3, 0
	syscall
	
	li $v0, 4		# prints new line
	la $a0, newline
	syscall
	
	
	############# Now to print the histogram ###################
	li $s4, 0	# initialize counter to zero
	
	li $v0, 4
	la $a0, Gc		# prints G prompt
	syscall
	
	addi $s5, $t3, 0
	
	loop2:
	bge $s4, $t3, cont	# loop until your count variable reaches the number of G's
	
	li $v0, 4		# prints hashtag
	la $a0, hashtag
	syscall
	
	addi $t3, $t3, -1	# decrements 
	j loop2
	
	cont:
	
	li $v0, 4
	la $a0, newline		# prints newline
	syscall
	
	addi $s4, $zero,0	# initializes s4 to zero
	
	li $v0, 4
	la $a0, Oc		# prints C prompt
	syscall
	
	loop3:
	bge $s4, $t4, cont2	# loops until your count matches how many letters you have
	
	li $v0, 4		# prints hashtag
	la $a0, hashtag
	syscall
	
	addi $t4, $t4, -1	# decrements
	j loop3
	
	cont2:
	
	addi $s4, $zero,0	# initialize counter to zero
	
	li $v0, 4		# prints newline
	la $a0, newline
	syscall
	
	li $v0, 4		# prints K prompt
	la $a0, Kc
	syscall
	
	loop4:
	bge $s4, $t5, cont3	# loop until count is met
	
	li $v0, 4		# print hashtag
	la $a0, hashtag
	syscall
	
	addi $t5, $t5, -1	# decrements
	j loop4
	
	cont3:

	addi $s4, $zero,0	# initialize to zero
	
	li $v0, 4
	la $a0, newline		# prints newline
	syscall
	
	li $v0, 4
	la $a0, Nc		# prints N prompt
	syscall
	
	loop5:
	bge $s4, $t6, cont4	# continue until count is met
	
	li $v0, 4		# prints hashtag
	la $a0, hashtag
	syscall
	
	addi $t6, $t6, -1	# decrements
	j loop5
	
	cont4:


	addi $s4, $zero,0	# initialize to zero
	
	li $v0, 4
	la $a0, newline		# prints newline
	syscall
	
	li $v0, 4
	la $a0, Ic		# prints I prompt
	syscall
	
	loop6:	
	bge $s4, $t7, cont5	# continue until number is met
	
	li $v0, 4
	la $a0, hashtag		# print hashtag
	syscall
	
	addi $t7, $t7, -1	# decrements
	j loop6
	
	cont5:

	addi $s4, $zero,0	# initailze to zero
	
	li $v0, 4
	la $a0, newline		# prints newline
	syscall
	
	li $v0, 4
	la $a0, Gc		# prints G prompt
	syscall
	
	loop7:
	bge $s4, $s5, cont6	# continue until # of Gs is met
	
	li $v0, 4
	la $a0, hashtag		# print hashtag
	syscall
	
	addi $s5, $s5, -1	# decrements
	j loop7
	
	cont6:

	addi $s4, $zero,0	# initialize counter to zero
	
	li $v0, 4
	la $a0, newline		# prints newline
	syscall
	
	li $v0, 4		# prints H prompt
	la $a0, Hc
	syscall
	
	loop8:
	bge $s4, $s1, cont7	# continue ntil # of H is met
	
	li $v0, 4
	la $a0, hashtag		# prints hashtags
	syscall
	
	addi $s1, $s1, -1	# decrements
	j loop8
	
	cont7:

	addi $s4, $zero,0	# initializes counter to zero
	
	li $v0, 4
	la $a0, newline		# prints newline
	syscall
	
	li $v0, 4
	la $a0, Tc		# prints T prompt
	syscall
	
	loop9:
	bge $s4, $s2, cont8	# continues until T is met
	
	li $v0, 4
	la $a0, hashtag		# prints hashtag
	syscall
	
	addi $s2, $s2, -1	# decrements
	j loop9
	
	cont8:

	addi $s4, $zero,0	# initialize s4 to zero
	
	li $v0, 4
	la $a0, newline		# prints newline
	syscall
	
	li $v0, 4		
	la $a0, Sc		# prints S prompt
	syscall
	
	loop10:
	bge $s4, $s3, cont9	# continues for # of S
	
	li $v0, 4
	la $a0, hashtag		# prints hashtag
	syscall
	
	addi $s3, $s3, -1	# decrements
	j loop10
	
	cont9:


	
exit:
	
	li $v0, 10	# exit
	syscall
	
	
	
	
	
	
	
	 # 	li $v0, 8       # take in input
   # 	la $a0, buffer  # load byte space into address
   # 	li $a1, 100      # allot the byte space for string

   # syscall

