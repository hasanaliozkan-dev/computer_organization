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
#	int num1 = 0 ,num2 = 1;
#	for(counter =1 counter <sequence;counter++){
#		int temp = num1 + num2;
#		num1 = num2;
#		num2 = temp;
#		
#	}
#	return num2;
#}
		
	fibonacci:
	
		addi $t0 $zero 0 		#num1 = 0;
		addi $t1 $zero 1		#num2 = 1;
		addi $t2 $zero 1 		#counter = 1;
		
		while:
			slt $t3 $t2 $a0 	#counter < sequence
			beq $t3 $zero end_while 
			
			add $t4 $t0 $t1 	#temp = num1 +num2;
			addi $t0 $t1 0		#num1 = num2;
			addi $t1 $t4 0		#num2 = temp;
			addi $t2 $t2 1		#counter++;
					
			
			j while
			
		
		end_while:
			addi $v0 $t1 0	 #return num2;
			jr $ra
	
			
	 
