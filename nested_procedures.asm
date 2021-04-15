.data

	newLine: .asciiz "\n"
.text
	main:
		addi $s0 ,$zero,10
		
		jal increaseMyRegister
		
		li $v0,4
		la $a0,newLine	
		syscall	
		
		jal printTheValue
		
		li $v0,10
		syscall

	
	increaseMyRegister:
		addi $sp,$sp,-8 #stack pointer
		sw   $s0,0($sp) #store word save the value in s0 to the first location.
		sw   $ra ,4($sp)
		addi $s0,$s0,30
		
	
		jal printTheValue
		lw $s0,0($sp)
		lw $ra,4($sp)
		addi $sp,$sp,4
		
		
		
		jr $ra
		
		
	printTheValue:
		li $v0,1
		move $a0,$s0
		syscall
		
		jr $ra
		