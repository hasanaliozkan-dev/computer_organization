.data 
	prompt: .asciiz "Please enter your name : "
	message: .asciiz "Hello, "
	userInput: .space 20 # I'll give character limit to user input.
	
	

.text
	main: 
		
		li $v0,4
		la $a0 ,prompt
		syscall
		
		li $v0,8#We say to the system we want to get an input which is text from the keyboard.
		la $a0,userInput
		li $a1,20 #we give the limit of the character 
		syscall
		
		li $v0,4
		la $a0 ,message
		syscall
		
		li $v0,4
		la $a0,userInput
		syscall	
	
	
	li $v0,10
	syscall