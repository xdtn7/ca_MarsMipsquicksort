# Program:Lab1 Question1
# Name: NGUYEN DUY TINH - 182797
.data
req: .asciiz "\nFill in 2 integers: "
res: .asciiz "\nThe sum: "
.text 
main: # Execution begins at label "main"
	
#print string
	li $v0, 4
	la $a0, req
	syscall
#Read integer1
	addi $v0,$zero,5
	syscall
	move $s0,$v0
#Read integer2
	addi $v0,$zero,5
	syscall
	move $s1,$v0
#print string
	li $v0, 4
	la $a0, res
	syscall
#Add & print sum
	li $v0,1
	add $a0,$s0, $s1
	syscall
