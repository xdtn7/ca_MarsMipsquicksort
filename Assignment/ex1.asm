.data
nums: .word 15
elems: .word 9 9 15 10 15 15 15 99 99 99 20 30 12 19 26
line: .asciiz " "
.text
main:
	la $a0, elems
	addi $a1, $a1, 0
	lw $t0, nums
	subi $a2, $t0, 1
	
	quickSort:
		addi $t1, $a1, 0
		subi $t2, $a2, 0
		

		quickSortloop:

		subi $sp, $sp, 16
		sw $ra, 0($sp)
		sw $t1, 4($sp)
		sw $t2, 8($sp)
		sw $t3, 12($sp)
			
		bgt $t1, $t2, recursion
		beq $t1, $t2, recursion
		
		addi $s1, $t1, 0
		subi $s2, $t2, 1
		jal partition
		
		subi $t2, $t3, 1
		addi $s0, $s0, 1
		jal quickSortloop
		
		addi $t1, $t3, 1
		jal quickSortloop
		subi $s0, $s0, 1
		
		beqz $s0, print
		j recursion
		
	recursion:
	lw $ra, 0($sp)
	lw $t3, 12($sp)
	addi $sp, $sp, 16
	lw $t1, 4($sp)
	lw $t2, 8($sp)
	jr $ra
	
	partition:
		subi $sp, $sp, 4
		sw $ra, 0($sp)
		
		addi $t0, $s2, 1
		sll $t7, $t0, 2
		add $t0, $t7, $a0
		lw $s3, 0($t0)
		
		partloop:
			loopleft:
			addi $t0, $s1, 0
			sll $t7, $t0, 2
			add $t0, $a0, $t7
			lw $t4, 0($t0)
			
			bgt $s1, $s2, loopright
			
			blt $t4, $s3, loopright
			beq $t4, $s3, loopright
			addi $s1, $s1, 1
			j loopleft
			
			loopright:
			addi $t0, $s2, 0
			sll $t7, $t0, 2
			add $t0, $a0, $t7
			lw $t5, 0($t0)
			
			bgt $s1, $s2, break1
			
			bgt $t5, $s3, break1
			beq $t5, $s3, break1
			subi $s2, $s2, 1
			j loopright
		
		break1:
		bgt $s1, $s2, break2
		beq $s1, $s2, break2
		jal swap1
		addi $s1, $s1, 1
		subi $s2, $s2, 1
		j partloop
		
		break2:
		jal swaphigh
		addi $t3, $s1, 0
		
		lw $ra, 0($sp)
		addi $sp, $sp, 4
		
		jr $ra
		
	swap1:
		addi $t0, $s1, 0
		sll $t7, $t0, 2
		add $t0, $a0, $t7
		sw $t5, 0($t0)	
		
		addi $t0, $s2, 0
		sll $t7, $t0, 2
		add $t0, $a0, $t7 
		sw $t4, 0($t0)
			
		jr $ra
		
	swaphigh:
		addi $t0, $s1, 0
		sll $t7, $t0, 2
		add $t0, $a0, $t7 
		sw $s3, 0($t0)	
		
		addi $t0, $t2, 0
		sll $t7, $t0, 2
		add $t0, $a0, $t7
		sw $t4, 0($t0)
		
		jr $ra
	
	print: 
	li $t0 , 0 
	la $a1 , ($a0)
	lw $t2, nums
     
     	loopprint:
     	beq $t0 , $t2 , exit
     	sll $t1, $t0, 2
     	add $t1, $a1, $t1
     	lw $a0, 0($t1)
     	addi $t0 ,$t0 , 1
     	li $v0, 1 
     	syscall 
     
     	li $v0,4
     	la $a0,line
	syscall
     
     	j loopprint 
     
    	exit:
     	li  $v0, 10
     	syscall
	
