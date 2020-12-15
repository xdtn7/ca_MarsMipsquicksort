.data
arr: .word 2, 5, -1, -13, -3, 3, 30, 84, -17, -8
#arr: .space 40
out: .asciiz "Sum of all elements: "
 
.text
main:	
   	la $s0, arr	#addressOfArray
   	li $s1, 0  	#value
   	li $s2, 0  	#index
sum:
   	lw $t0, 0($s0) 
   	add $s1, $s1, $t0
   	addi $s2, $s2, 1  
   	addi $s0, $s0, 4  	#plusAdress
   	beq $s2, 10, result
   	j sum
result:
#print string
   	li $v0, 4		#code
   	la $a0, out	#printstring
   	syscall
#print result
   	addi $a0, $s1, 0	
   	li $v0, 1		#return 
   	syscall 
