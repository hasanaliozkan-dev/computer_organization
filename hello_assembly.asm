.data
	#creating variable in the memory
	mymessage: .asciiz  "Hello World\n" #store the string in the data segment and add null terminator.
  


.text
	#load-immediate
	li $v0 ,4 #if we put value in this register the system know we want to print out something.
	
	#load data from the memory
	#load-address
	la $a0, mymessage
	syscall #execute it. 