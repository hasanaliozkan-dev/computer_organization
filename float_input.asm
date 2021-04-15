.data

	prompt: .asciiz "Enter the value of pi : "
	message: .asciiz "The value of pi : "
	zeroAsFloat: .float 0.0
	
.text
	
	lwc1 $f4,zeroAsFloat#İn the float registers there is no zero register so we create it.
	
	#Display message 
	li $v0,4
	la $a0,prompt
	syscall
	 
	#Read user's input
	li $v0,6 #We say to the system we want to get an input which is float from the keyboard.
	syscall
	
	li $v0,4
	la $a0,message
	syscall
	
	li $v0,2
	add.s $f12,$f0,$f4
	syscall
	