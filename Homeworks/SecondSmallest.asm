.data

	message: .asciiz "There is No Second Smallest"
	values: .word 11,12,13
	size: .word 3
	max_integer: .word 2147483647 #maximum value of integer.

.text
	main:
		#my algortihm is very simple  first find the smallest number in the array then 
		#set all smallest number to max integer value then find again the smallest value
		# that is the second smallest value in the array.
		
	
		addi $s0,$zero,0 	# index.
		
		lw $s1,max_integer 	# min element in the array.
		
		lw $s2,max_integer	# maximum value of integer
		
		lw $s3,size 		#size of the array
		
		mul $s3,$s3,4		#multiplied it because one word size is 4 byte.
			
		lw $s4,values($s0)	#array[0] to checking all elements are equal each other.
		
	
		addi $s0,$zero,4	#to move arr[1] since we have arr[0] in s4 register.	
		
		
		EQUAL:			#checking all elements equality each other. 
			slt $t0,$s0,$s3
			
			beq $t0,$zero,END_EQUAL
			
			lw $s5,values($s0)
			
			bne $s4,$s5,THERE_IS_NO_EQUALITY #ıf there is no equality -> find max,min than secondmin.
			
			
			
			addi $s0,$s0,4			#increment the index
			
			
			
			j EQUAL
			
			
		
		END_EQUAL:				#if comes here all elements are equal each other.
			li $v0,4			#print the message.
			la $a0,message
			syscall
			j END_OF_THE_FILE		#go to the end of the file because program is done.
		
		
		THERE_IS_NO_EQUALITY:			
		addi $s0,$zero,0 			#set index to 0 again.
		
		
		
		FIND_MIN:
			slt $t0,$s0,$s3
			
			beq $t0, $zero, END_FIND_MIN
			lw $s5, values($s0)
			blt $s5, $s1,SET_MIN
	
			
			addi $s0,$s0,4			#increment the index
			
			 
			j FIND_MIN
			SET_MIN:
				move $s1,$s5
			 	j FIND_MIN
		END_FIND_MIN:
		
		addi $s0,$zero,0 
		SET_MIN_TO_MAX:
			slt $t0,$s0,$s3
			lw $s5, values($s0)
			beq $t0,$zero,END_SET_MIN_TO_MAX
			beq $s1,$s5,MIN_TO_MAX
			
			addi $s0,$s0,4		#increment the index
			
			j SET_MIN_TO_MAX
		
			MIN_TO_MAX:
				
				sw $s2 values($s0)
				j SET_MIN_TO_MAX
				
		END_SET_MIN_TO_MAX:
		add $s1,$s2,$zero
		addi $s0,$zero,0 
		FIND_SEC_MIN:
			slt $t0,$s0,$s3
			
			beq $t0, $zero, END_FIND_SEC_MIN
			lw $s5, values($s0)
			blt $s5, $s1,SET_SEC_MIN
			
			
			addi $s0,$s0,4			#increment the index
			
			 
			j FIND_SEC_MIN
			SET_SEC_MIN:
				move $s1,$s5
			 	j FIND_SEC_MIN
		
		END_FIND_SEC_MIN:
		li $v0,1
		add $a0,$s1,$zero
		syscall
		
		
		END_OF_THE_FILE:	#To be sure after writing message program is done.
		li $v0,10
		syscall
