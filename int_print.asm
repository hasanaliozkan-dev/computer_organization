.data 
	#creating variable in the memory
	number: .word 100 #in the mips word represent in 32 bits integer number.

.text
	#load-immediate
	li $v0,1#if we put value in this register the system know we want to print out something.
	#load-word
	lw $a0,number
	syscall#execute it
