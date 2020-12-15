.data
myArray: .word 22, 11, 99, 31, 99, 10, 55, 78, 80, 65
n: .word 10
res: .asciiz "The sum is: "
.text
main:
	la $s0, myArray	#InArray
	lw $s1, n	#InIndex

	jal func	#SaveAddr
	move $s2, $v0
	
	la $a0 , res	#printStr
  	li $v0 , 4	#StrCode
  	syscall 
  	
  	move $a0, $s2	#
  	
  	li $v0, 1	#print
  	syscall
 
 	li $v0, 10
  	syscall
func:
	subiu $sp, $sp, 8	
    	sw   $ra, 0($sp)	
    	sw   $a0, 4($sp)
    	bne $s1, 1, sum
    	
    	lw $v0, 0($s0)
    	addi $sp, $sp, 8
    	jr $ra
    	
sum:
	subi $s1, $s1, 1
	addi $s0, $s0, 4
	jal func
	
	lw $ra, 0($sp)
	lw $a0, 4($sp)
	addi $sp, $sp, 8
	
	lw $t0, 0($s0)
	add $v0, $v0, $t0
	jr $ra
	
	
	
