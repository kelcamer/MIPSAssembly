# Kelsey Cameron
# add.asm-- A program that computes the sum of 1 and 2, 
# leaving the result in register $t0.
# Registers used:
#   t0   -   used to hold the result.
#   t1  -    used to hold the constant 1.


main:			# MARS starts execution at main

li   $v0, 5        # 5 is the code to read integer
syscall            # Tells the operating system to take control
addi $t0, $v0, 0    # $a0 gets the next char

li $v0, 5	    # 5 is the code to read the integer
syscall		    # Tells the operating system to take control
addi $t1, $v0, 0    # takes the value you just read in and store it in t1


add $t2, $t1, $t0	# Set $t0 = $t1 + 2  t means temp


li $v0, 1		#  1 is the code to print an integer
addi $a0, $t2, 0	#  takes the value of t2, and stores it inside of the argument register
syscall			# executes the command

li $v0, 10		# syscall code 10 is for exit
syscall			# make the syscall
# end of add.asm

