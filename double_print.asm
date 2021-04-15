.data
	#creating variable in the memory
	e: .double 2.718281
	

.text

	li $v0,3
	ldc1 $f12,e #load double coproc1
	syscall
