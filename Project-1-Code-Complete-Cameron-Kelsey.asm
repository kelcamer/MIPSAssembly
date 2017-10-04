# Kelsey Cameron
# Project 1 Part A:   A program that takes in a user's PID,
# multiplies the digits together according to this formula S = (A x B) + (18 x C) – (9 x D) – (E x F) 
# then prints the result first in binary, then in decimal
# Then, if shows whether it's divisible by 2, 3, 5, or 7
# Registers used:
#   t0   -   used to hold the result.
#   t1  -    stores A
#   t2  -    stores B
#   t3  -    stores C
#   t4  -    stores D
#   t5  -    stores E
#   t6  -    stores F
#   t7  -    a counter variable
#   t8  -    remembers the answer and used for math


.data
newline: .asciiz "\n"
str1: .asciiz "S_ten = "
str2: .asciiz "S_two = "
str3: .asciiz "Enter your 6 digits of your PID for A, B, C, D, E, and F respectively: "
str4: .asciiz "S is divisible by "
str5: .asciiz "Remainder of division by "
str6: .asciiz " is "

.text
main:			# MARS starts execution at main
li $t0, 0		# loads the result as 0
li $t7, 0		# starts the count at 0
			
li $v0, 5		# puts the instruction to read an integer into the circuit
syscall			# follows the instruction
addi $t1, $v0, 0 	# stores v0 + 0 into t1

li $v0, 5		# puts the instruction to read an integer into the circuit
syscall			# follows the instruction	
addi $t2, $v0,0 	# stores v0 + 0 into t2


li $v0, 5		# puts the instruction to read an integer into the circuit
syscall			# follows the instruction	
addi $t3, $v0,0 	# stores v0 + 0 into t3


li $v0, 5		# puts the instruction to read an integer into the circuit
syscall			# follows the instruction	
addi $t4, $v0,0 	# stores v0 + 0 into t4


li $v0, 5		# puts the instruction to read an integer into the circuit
syscall			# follows the instruction	
addi $t5, $v0,0 	# stores v0 + 0 into t5


li $v0, 5		# puts the instruction to read an integer into the circuit
syscall			# follows the instruction	
addi $t6, $v0,0 	# stores v0 + 0 into t6

	
			# to loop A * B, you can add A to itself B times
loop1: bge $t7, $t2, next		# if while b < counter (t2 < t7) exit if t7 is higher than t2
add $t0, $t0, $t1         		# adds a to itself one time
addi $t7, $t7, 1			# increments counter
j loop1

next:
li $t7, 0				# resets the counter to 0
li $t1, 18				# stores 18 in t1
add $t2, $t3, 0				# stores C back into t2

loop2: bge $t7, $t2, next2		# if while b < counter (t2 < t7) exit if t7 is higher than t2
add $t0, $t0, $t1         		# adds a to itself one time
addi $t7, $t7, 1			# increments counter
j loop2



next2:


li $t1, 9				# sets the t1 equal to 9
add $t2, $t4, 0				# stores D (t4) into t2
li $t7, 0				# resets counter

loop3: bge $t7, $t2, next3		# if while b < counter (t2 < t7) exit if t7 is higher than t2
sub $t0, $t0, $t1         		# adds a to itself one time
addi $t7, $t7, 1			# increments counter
j loop3



next3:
add $t1, $t5, 0				# puts E into t1
add $t2, $t6, 0				# puts F into t2
li $t7, 0				# resets counter

loop4: bge $t7, $t2, next4		# if while b < counter (t2 < t7) exit if t7 is higher than t2
sub $t0, $t0, $t1         		# adds a to itself one time
addi $t7, $t7, 1			# increments counter
j loop4


next4:


li $v0, 4				# prints a string
la $a0, str1				# prints the first prompt for the actual number
syscall					# executes

li $v0, 1				# instruction for printing an int
addi $a0, $t0, 0 			# stores the answer into a viewable address
syscall					# prints the int

li $v0, 4				# prints a string code
la $a0, newline				# prints the first newline 
syscall					# executes

li $v0, 4				# prints  string
la $a0, str2				# loads address of string
syscall					# executes

li $v0, 35				# instruction for printing an int in binary
addi $a0, $t0, 0 			# stores the answer into a viewable address
syscall					# prints the int

li $v0, 4				# prints new line
la $a0, newline
syscall
########################################## Part B

li $t7, 1				# t7 is counter
li $t8, 0				# t8 is a temp variable to remember the answer.
add $t8, $t8, $t0			# sets t8 to t0

loop8:
bge $t7, 7, EXIT
add $t7, $t7, 1
beq $t7, 4, loop8
beq $t7, 6, loop8


loop7:		
		
beq $t8, 0, printD			# if sum == 0, then print prompt
bgt $t8, 0, cont			# if sum > 0
cont:					# and sum < num
blt $t8, $t7, printND			# print remainder


sub $t8, $t8, $t7			# else, keep subtracting counter from sum

j loop7
j loop8



		




printD:			# Divisible
li $v0, 4		# first prints string		
la $a0, str4
syscall
li $v0, 1		# then prints number
addi $a0, $t7, 0
syscall
li $t8, 0		# reset sum
add $t8, $t0, 0

li $v0, 4		# prints newline
la $a0, newline
syscall

j loop8


printND:			# Not divisible
li $v0, 4		# first prints the string
la $a0, str5
syscall
li $v0, 1		# then prints what you're dividing by
addi $a0, $t7, 0
syscall
li $v0, 4		# first prints the string
la $a0, str6
syscall
li $v0, 1		# then prints remainder
addi $a0, $t8, 0
syscall
li $v0, 4		# prints newline
la $a0, newline
syscall

li $t8, 0		# reset sum
add $t8, $t0, 0

j loop8

EXIT:
li $v0, 10		# syscall code 10 is for exit
syscall			# make the syscall
# end of Project1A

