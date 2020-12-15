# Program:Lab1 Question1
# NAME: NGUYEN DUY TINH - 1852797
.data
req: .asciiz "\nFill in a integer: "
res: .asciiz "\nThe result: "
.text 
main: # Execution begins at label "main"
	
#print string
	li $v0, 4
	la $a0, req
	syscall
#Read integer	
	addi $v0,$zero,5
	syscall
	move $s0,$v0
#print string
	li $v0, 4
	la $a0, res
	syscall
#Add 1 & print integer
	li $v0,1
	addi $a0,$s0, 1
	syscall
