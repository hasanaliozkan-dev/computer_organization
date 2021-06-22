.data
 	message: .asciiz "Enter the sequence number: "

 	function: .asciiz "F("
 	closepar: .asciiz ") = "
 	
 	
.text

	main:
		#print the input message.
		li $v0 4
		la $a0 message
		syscall
		
		#get the integer input.
		li $v0 5 
		syscall
		addi $a0 $v0 0 		# input in $a0.		
		
		addi $sp $sp -8		# to open space in the stack.
		sw $a0 4($sp)		#to print again store the input in to stack(back up).
		
		
		jal fibonacci		#call fibonacci
		
		sw $v0 0($sp)		#after method calling store the result in the stack(back up). 
		
		
		#print 'F('
		li $v0 4
		la $a0 function
		syscall
		
		
		#print the input in 'F(input)'
		li $v0 1
		lw $a0 4($sp)  		#restore the input from the stack.
		syscall
		
		#print the ') =' 
		li $v0 4
		la $a0 closepar
		syscall
		
		#print the result.
		li $v0 1
		lw $a0 0($sp)		#restore the result from the stack.
		syscall
		
		
		#end of the main.
		li $v0 10 
		syscall


#C-Code		
#int fibonacci(int sequence){
#	if(sequence == 0)
#	     return 0;
#	if(sequence == 1)
#	     return 1;
# 
#	return fibonacci(sequence-1) + fibonacci(sequence-2);
#}
	

	fibonacci:
		addi $t0 $zero 1         	#t0 = 1 to check the sequence's 1 equality.
		beq $a0 $zero return_zero	#if(sequence == 0) return 0;
		beq $a0 $t0 return_one		#if(sequence == 1) return 1;
		
		
		
		
		call_recursive:
			
			sw $ra 0($sp)		#back up the ra register since we call the function recursively.
			add $sp $sp -4		
			addi $a0 $a0 -1		#decremente sequence by 1 to ,
			jal fibonacci		# call fibonacci(sequence -1);
			add $a0 $a0 1		# increment sequence to original value
			
			add $sp $sp 4  		
			lw $ra 0($sp)		#restore the ra register
			
			
			sw $v0 0($sp)		#backup result
			add $sp $sp -4
			
			sw $ra 0($sp)		#backup again ra register
			add $sp $sp -4
					
			addi $a0 $a0 -2		# decremente sequence by 2 to ,
			jal fibonacci		# call fibonacci(sequence -2);
			add $a0 $a0 2		# increment sequence to original value
				
			add $sp $sp 4  		#restore ra register again.
			lw $ra 0($sp)
				
			add $sp $sp 4		#restore the return value in to the t0 register.
			lw $t0 0($sp)
				
			add $v0 $v0 $t0		# sum total return value
			jr $ra			#then return
			
		return_zero:			# add zero to return register
			li $v0 0
			jr $ra
		return_one:			# add one to return register
			li $v0 1
			jr $ra
