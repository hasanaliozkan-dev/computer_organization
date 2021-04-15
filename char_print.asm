.data
	#creating character variable in the memory. 
	
	character:  .byte "a" #store the listed value as in 8 bit bytes. 
.text
	#load-immediate
	li $v0 ,4 #if we put value in this register the system know we want to print out something.
	
	#load data from the memory
	#load-address
	la $a0, character
	syscall #execute it. 