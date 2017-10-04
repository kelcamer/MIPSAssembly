# Kelsey Cameron  10/12/2016
# strlength.asm-- A program that determines the length of a null terminated string
# Registers used:
# $t0 - used to hold the loop counter
# $a0 - used to hold the address of string
# $v0 - syscall parameter and return value
.data
str:	.asciiz "abcde"

.text
	la $a0, str	# load address of string into a0
	
strlen: 
	li $t0, 0	# initialize counter to 0
loop:
	lb $t1, 0($a0)		# loads the next byte in the string array into t1
	addi $t0, $t0, 1	# increments t0
	addi $a0, $a0, 1	# go to next char
	beq $t1,0, exit	# if t1 == 0, then exit
	
j loop
	
exit:
	subi $t0, $t0, 1	# subtracts because the \0 character isn't really a character in english
	li $v0, 1
	addi $a0, $t0, 0
	syscall
	li $v0, 10
	move $a0, $t0
	syscall
	li $v0, 10
	syscall
	
	