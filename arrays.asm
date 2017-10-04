# Kelsey Cameron
# Purpose: To understand how arrays are used and print an array
# Our counter will be $t0
# remember printing an int is 1
# t1 will hold the address
.data
nums: .space 1000		# space just reserves space for the array

.text


main:
li $t1, 0
addi $s0, $zero, 5		# sets s0 = 5
sw $s0, nums($t1)		# sets the num array equal to 5 at index zero

lw $t6, nums($t1)		# loads the word from index 0 of nums array into t6


li $v0, 1			# puts the instruction for printing an integer 
addi $a0, $t6,0			# sets the printable address to t6
syscall				# prints first element of array
j exit
#loop:
#bgt $t0, 20, after

#li $v0, 1
#lw $a0, nums($t0)
#syscall

#add $t0, $t0, 4




#j loop
#after:








exit:
li $v0, 10
syscall