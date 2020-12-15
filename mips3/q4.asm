# Program:Lab1 Question4
# NAME: NGUYEN DUY TINH - 1852797
.data
req: .asciiz "\nFill in 5 integers: "
res: .asciiz "\nThe result: "
.text
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
#Read integer3
	addi $v0,$zero,5
	syscall
	move $s2,$v0
#Read integer4
	addi $v0,$zero,5
	syscall
	move $s3,$v0
#Read integer5
	addi $v0,$zero,5
	syscall
	move $s4,$v0
#print string
	li $v0, 4
	la $a0, res
	syscall
#print result
	li $v0,1
	add $a0,$0,$s4
	syscall

	li $v0,1
	add $a0,$0,$s3
	syscall
	
	li $v0,1
	add $a0,$0,$s2
	syscall

	li $v0,1
	add $a0,$0,$s1
	syscall
	
	li $v0,1
	add $a0,$0,$s0
	syscall