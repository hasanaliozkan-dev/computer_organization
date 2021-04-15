.data
	size: .word 10
	array: .word 0,1,2,3,4,5,6,7,8,9
	array1: .word 100:3
	
	space: .asciiz ", "
	message: .asciiz "\nThe loop is done!"

.text
	addi $t0,$zero,0
	lw $t1,size
	mul $t1 $t1 4
	while:
		bge  $t0,$t1,exit
		lw $t2,array($t0)
		
		li $v0,1
		move $a0,$t2
		syscall
		
		li $v0,4
		la $a0,space
		syscall
		addi $t0,$t0,4
		j while
	
	exit:
		li $v0,4
		la $a0,message
		syscall
	
