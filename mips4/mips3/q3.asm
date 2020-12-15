.data
arr: .space 40
read: .asciiz "Please input 10 integer numbers: "
output: .asciiz "Sum of all elements: "  
.text
main: 
 	la $s0, arr		#addressOfArray
   	add $t0, $0, $s0
   	li $s1, 0 		#value
   	li $s2, 0 		#index
   	
   	li $v0, 4
   	la $a0, read
   	syscall
sto:
   	li $v0, 5
   	syscall 
   	add $t1, $0, $v0
 
   	sw $t1, 0($t0)
   	addi $s2, $s2, 1
   	addi $t0, $t0, 4
   	beq $s2, 10, sum
   	j sto
sum: 
   	lw $t1, 0($s0)
   	add $s1, $s1, $t1
   	addi $s2, $s2, -1  
   	addi $s0, $s0, 4  
   	beqz $s2, result
   	j sum       
result:
   	li $v0, 4
   	la $a0, output
   	syscall
   
   	li $v0, 1
   	add $a0, $0, $s1
   	syscall
   
