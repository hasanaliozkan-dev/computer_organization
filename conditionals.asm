.data
	prompt: .asciiz "Please enter your first number: "
	prompt2: .asciiz "Please enter your second number: "
	message:  .asciiz "The numbers are equal."
	message2:  .asciiz "The numbers are not equal."
	message3:  .asciiz "This is just go to the label with b instructions."


.text	

	main:
		#writing message to get the input.
		li $v0,4
		la $a0,prompt
		syscall
		#Getting input.
		li $v0,5
		syscall
		##Storing input
		add $t0,$v0,$zero
		
		#writing message to get the input.
		li $v0,4
		la $a0,prompt2
		syscall
		#Getting input.		
		li $v0,5
		syscall
		##Storing input		
		add $t1,$v0,$zero
		

		#If statetments 
		bne $t0,$t1,notEqual #if t0 != t1 go to not equal label.
		beq $t0,$t1,numbersEqual #if t0 == t1 go to  equal label.
		b goToTheLabel
		
		#To say the computer this program is done if we dont say this it will execute until end of the page. 
		li  $v0 ,10
		syscall
		
	numbersEqual:
		##Print the equal message.
		li $v0,4
		la $a0,message
		syscall
		##Read above explanation and if you don't remember delete below part and run the program you will see the problem.  
		li  $v0 ,10
		syscall
		
	notEqual:
		##Print the not equal message.
		li $v0,4
		la $a0,message2
		syscall
		
		##Read above explanation and if you don't remember delete below part and run the program you will see the problem.  
		li  $v0 ,10
		syscall
		
	goToTheLabel:	
		li $v0,4
		la $a0,message3
		syscall
		