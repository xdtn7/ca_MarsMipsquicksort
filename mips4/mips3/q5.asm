.data
arr: .word 2, 5, -1, -13, -3, 3, 30, 84, -17, -8
#arr: .space 40
sp: .asciiz " "
out: .asciiz "\nReverse list: "
 
.text
main:	
   	la $s0, arr	#addressOfArray
   	li $s1, 0  	#value
   	li $s2, 0  	#index
   	
#print string
   	li $v0, 4		#code
   	la $a0, out	#printstring
   	syscall
sum:
   	lw $t0, 36($s0) 
   	add $s1, $0, $t0
   	addi $s2, $s2, 1  
   	subi $s0, $s0, 4  	#plusAdress
   	
   	addi $a0, $s1, 0	
   	li $v0, 1		#return 
   	syscall 
   	
   	li $v0, 4		#code
   	la $a0, sp	#printstring
   	syscall
   	
   	beq $s2, 10, exit
   	j sum
exit:

