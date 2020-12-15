.data
arr: .word 2, 5, -1, -13, -3, 3, 30, 84, -17, -8
odd: .asciiz "Sum of all odd elements: "
even: .asciiz "Sum of all even elements: "
endl: .asciiz "\n" 
.text
main:
   	la $s0, arr		#adressOfArray
   	li $s1, 0		#SumEven
   	li $s2, 0 		#SumOdd
   	li $s3, 0		#Index
sumEven: 
   	beq $s3, 10, result	#Index=10 -> cout
   	lw $t0, 0($s0)	
   	add $s2, $s2, $t0 
   	addi $s3, $s3, 1 	#IncreaseIndex
   	addi $s0, $s0, 4 	#nextValue
   	j sumOdd
sumOdd:
   	lw $t0, 0($s0)
   	add $s1, $s1, $t0
   	addi $s3, $s3, 1 
   	addi $s0, $s0, 4 
   	j sumEven
result:
   	li $v0, 4
   	la $a0, odd
   	syscall
   
   	addi $a0, $s1, 0
   	li $v0, 1
   	syscall
   
   	li $v0, 4
   	la $a0, endl
   	syscall
   
   	li $v0, 4
   	la $a0, even
   	syscall
   
   	addi $a0, $s2, 0
   	li $v0, 1
   	syscall 
   
   
   
   
   
   
