.data 
	int1 : .word 5
	int2 : .word 10


.text

	lw $t0,int1
	lw $t1,int2
	add $t2,$t0,$t1
	
	li $v0,1
	add $a0,$zero,$t2
	syscall 