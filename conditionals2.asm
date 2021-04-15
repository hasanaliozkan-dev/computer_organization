
##Actually if we have used pseudo code we can do most of thing in one-line with bgt  ,blt.

.data



	prompt: .asciiz "Please enter your first number: "
	prompt2: .asciiz "Please enter your second number: "
	lessM: .asciiz " is less than "
	greaterM: .asciiz " is greater than "

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
		
		slt $s0,$t0,$t1
		
		beqz $s0,greater
		bnez $s0,less
		lw $s5, $s2($t0)
	
		
	less:
		##Print the equal message.
		li $v0,1
		add $a0,$t0,$zero
		syscall
		li $v0,4
		la $a0,lessM
		syscall
		li $v0,1
		add $a0,$t1,$zero
		syscall
		##Read above explanation and if you don't remember delete below part and run the program you will see the problem.  
		li  $v0 ,10
		syscall
		
	greater:
		##Print the not equal message.
		li $v0,1
		add $a0,$t0,$zero
		syscall
		li $v0,4
		la $a0,greaterM
		syscall
		li $v0,1
		add $a0,$t1,$zero
		syscall
		##Read above explanation and if you don't remember delete below part and run the program you will see the problem.  
		li  $v0 ,10
		syscall

