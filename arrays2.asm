# Kelsey Cameron
# Purpose: To understand how arrays are used and print an array
# Our counter will be $t0
# remember printing an int is 1
# t1 will hold the temp val
# t2 will hold the address
# t3 will be for printing
.data
nums: .space 40			# space just reserves space for the array
				# 10 numbers?

.text

main:

li $t1, 5
li $t2, 0

loop:
beq $t1, 0, continue		# if user types zero, continue program


li $v0, 5			# 5 is the number to take in integer
syscall				# actually reads it in
addi $t1, $v0, 0		# sets the read in value to t1

sw $t1, nums($t2)		# puts the number at address t1 into array at t2

addi $t2, $t2, 4		# next part of array



j loop				# loops
continue:			# label


addi $t2, $zero, 0		# resets counter
addi $t3, $t3, 1



loop2:				# starts looping

beq $t3, 0, exit		# if t3 == 0, exit


lw $t3, nums($t2)		# loads element t2 of nums into t3
addi $t2, $t2, 4		# next element of array


li $v0, 1			# print instruction
addi $a0, $t3, 0		# set address 0 to t3
syscall				# executes

j loop2


exit:				# exits
li $v0, 10
syscall