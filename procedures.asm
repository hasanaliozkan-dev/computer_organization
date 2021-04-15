.data 
	message: .asciiz "Hi, everbody \nMy name is Ali\n"

.text
	main:
		jal displayMessage #calling the function (with label name) from the main label.
	 	
	 	# we can do different things after calling the function.
	 	
	 	addi $s0,$zero,5
	 	li $v0,1
	 	move $a0,$s0
	 	syscall 
	 	
	 	
	 	
	 	
	#Tell the  system this program is done.
	li $v0,10
	syscall
	#If we wont add the these two lines the computer doing displaymessage procedure again and again.
	
	displayMessage:
		li $v0 , 4
		la $a0,message
		syscall
		
		jr $ra 