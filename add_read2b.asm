# Kelsey Cameron
# add.asm-- A program that computes the sum of 1 and 2, 
# leaving the result in register $t0.
# Registers used:
#   t0   -   used to hold the result.
#   t1  -    used to hold the constant 1.

.data
newline: .asciiz "\n"

.text
main:			# MARS starts execution at main

li $t0, 0

L1: bge $t0, 15, EXIT
addi $t0,$t0,1
li $v0, 34
addi $a0, $t0, 0
syscall
li $v0, 4
la $a0, newline
syscall


j L1

EXIT:
li $v0, 10		# syscall code 10 is for exit
syscall			# make the syscall
# end of add.asm

