.data 

	num1 : .word 3
	num2 : .word 5
	num3 : .word 26
	

.text


	lw $s0 ,num1
	lw $s1 ,num2
	lw $s2 ,num3
	#mul $t0,$s0,$s1  #t0 = s0*s1
	
	#if the result of this is greater than 32 bit we use mult and it assigned the result low or high
	#mult $s0,$s1
	#mflo  $t0
	
	#multiplying  powers of two.
	#sll $t0 $s0 2 # t0 = s0*4
	
	#div $t0 $s2 $s1 # t0 = s2/s
	
	#if this two number can not divided each other than the result is go to lo remainder is go to hi
	
	
	div $s2 $s1 # result(lo) = 5 remainder(hi) = 1
	#mflo $t0 # result(lo) = 5
	mfhi $t0 #remainder(hi) = 1
	#print the screen
	li $v0 1
	move $a0 $t0

	syscall
