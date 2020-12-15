# Program:Lab1 Question3
# NAME: NGUYEN DUY TINH - 1852797
.data
req: .asciiz "\nFill in 4 integers: "
f: .asciiz "\nf=  (a + b) ? (c ? d ? 2)= "
g: .asciiz "\ng= (a + b) ? 3 ? (c + d) ? 2= "
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
#Read integer3
	addi $v0,$zero,5
	syscall
	move $s2,$v0
#Read integer4
	addi $v0,$zero,5
	syscall
	move $s3,$v0
#print string
	li $v0, 4
	la $a0, f
	syscall
#Add & print f
	add $t0,$s1, $s0
	sub $t1, $s2, $s3
	subi $t2, $t1, 2
	sub $t3, $t0, $t2

	li $v0,1
	add $a0,$0,$t3
	syscall
#print string
	li $v0, 4
	la $a0, g
	syscall
#Add & print g
	add $t0,$s1, $s0
	add $t1, $s2, $s3
	mul $t2, $t0, 3
	mul $t3, $t1, 2
	sub $t4, $t2, $t3

	li $v0,1
	add $a0,$0,$t4
	syscall

