.data
arr: .word 2, 5, -1, -13, -3, 3, 30, 84, -17, -8
read: .asciiz "Input an integer number from 0 to 9: "
output: .asciiz "Value of the chosen index: "
.text
main: 
   	la $s0, arr
   	li $s1, 0 
   
   	li $v0, 4
   	la $a0, read
   	syscall
   
   	li $v0, 5
   	syscall
   	add $t0, $0, $v0 
check:
   	lw $t1, 0($s0)
   	beq $t0, $s1, result
   	addi $s0, $s0, 4
   	addi $s1, $s1, 1
   	j check
result:
   	li $v0, 4
   	la $a0, output
   	syscall
   
   	li $v0, 1
   	add $a0, $0, $t1
   	syscall
    
     
      
       
        
          
