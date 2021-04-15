.data

	



.text

	main:
		
		addi $a1 ,$zero,50 #we can pass argument by using this registers in our procedure.
		addi $a2 ,$zero,100 #From a0 to a3 registers are argument registers.
	
	
		jal addNumbers
		
		li $v0,1
		move $a0,$v1	
		syscall
	li $v0,10
	syscall
	
	
	
	addNumbers:
		
		add $v1,$a1,$a2 #programmers decide v1 register is for return values.
		
		jr $ra