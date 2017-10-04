# Kelsey Cameron  10/12/2016
# To_lowercase.asm-- A program that converts uppercase to lowercase
# Registers used:
# $t0 holds the string
# $t2 holds the next character of the string

.data
string:	.asciiz "HeLlo WoRld"	# We want to lower this string
newline: .asciiz "\n"


.text
main:	
	la $t0, string			# load here the string
	
toLowerCase:
	lb $t2, 0($t0)			# We do as always, get the first byte pointed by the address
	beq $t2,0, end			# if t2 == 0, exit
	
	
	blt $t2, 65, continue	# if (character >= 'A')
	
	# your code
	upperCaseTest2:			
	ble $t2, 90, isUpperCase		# && character <= 'Z'
	
	continue:
	addi $t0, $t0, 1	# increment the address
	j toLowerCase
	
	isUpperCase:
	addi $t2, $t2, 32	# the difference between 'A' and 'a' is 32
	sb $t2, 0($t0)		# store it in the string
	j continue
end:
	
	li $v0, 4
	la $a0, string		# prints string
	syscall
	li $v0, 4
	la $a0, newline		# prints newline
	syscall
	li $v0, 10		# exits
	syscall
	
	