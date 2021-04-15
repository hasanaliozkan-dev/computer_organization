.data 
	prompt: .asciiz "Enter your age : "
	message: .asciiz "Your age is "
	

.text
	#Prompt the user to enter age 
	li $v0,4
	la $a0 ,prompt
	syscall
	
	#Get the user's age
	
	li $v0,5 #We say to the system we want to get an input which is integer from the keyboard.
	syscall
	
	#Store the result in t0
	add $t0,$v0,$zero
	
	#Display
	li $v0,4
	la $a0 ,message
	syscall
	
	li $v0,1
	move $a0,$t0
	syscall
		
	
	