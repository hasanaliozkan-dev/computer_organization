.data 
	num1 : .word 100
	num2:  .word 30
	
.text
	lw $s0,num1
	lw $s1,num2
	
	#sub $t0,$s0,$s1 #t0 = s0-s1
	subi $t0,$s0,50  #t0 = s0-50
	#add $t0,$s0,$s1 #t0 = s0+s1
	#addi $t0,$s0,25 #t0 = s0+25	
	
	#print the screen
	li $v0,1
	add $a0 $zero $t0
	syscall
	 