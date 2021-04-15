.data

	prompt: .asciiz "Enter the value of e : "
	message: .asciiz "The value of e : "
	zeroAsFloat: .double 0.0
	
.text
	 
	ldc1 $f4,zeroAsFloat#In the double registers there is no zero register so we create it.
	
	#Display message 
	li $v0,4
	la $a0,prompt
	syscall
	 
	#Read user's input
	li $v0,7 #We say to the system we want to get an input which is double from the keyboard.
	syscall
	
	li $v0,4
	la $a0,message
	syscall
	
	li $v0,3
	add.d $f12,$f0,$f4
	syscall
	