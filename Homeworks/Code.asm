.data
	#double[] numbers = {1.0,1.1,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0};
	numbers: .double 1.0,1.1,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0 
	
	new_line: .ascii "\n"
	
.text
	#int i = 0;
	#while (numbers[i+1] < 150){
	#	numbers[i+2] = numbers[i+1] + numbers[i]; 
	#	i++;}
	
	la $t0 numbers			#the first address of numbers array
	
	addi $t1 $zero 150   		#this is the upper value given in the code.   
	
	mtc1.d $t1 $f0         		#move 150 to $f0 register.
	
	cvt.d.w $f0 $f0			#convert integer to double precision to make comparison with numbers[i+1].
	
	WHILE:
		
		ldc1 $f2 8($t0)		#numbers[i+1];
		
		c.lt.d $f2 $f0		#numbers[i+1]<150
		
		bc1f END_WHILE		#if numbers[i+1] exceeds 150 Coproc 1 condition flags setted false the we break the loop;

		ldc1 $f4 16($t0)	#numbers[i+2];
	
		
		ldc1 $f6 ($t0)		#numbers[i];
		
		add.d $f4 $f2 $f6	#numbers[i+2] = numbers[i+1] + numbers[i];
		
		sdc1 $f4 16($t0)	#store the value of numbers[i+2];
		
		addi $t0 $t0 8		#increment "i" by 1;
		
		j WHILE			#jump to start of the while;
		
	END_WHILE:			#end point of while;
	
	#for (int j = 0; j < 14; j++)
	#{ 	System.out.println(numbers[j]);}
	
	la $t0 numbers 			#the first address of numbers array numbers[0];
	
	addi $t1 $t0 112		#8x14 = 112 ,the last address of numbers array

	FOR:
		#printig each element.  
		li $v0 3		#to write double we have to put 3 in $v0;
		ldc1 $f12 ($t0) 	#load element from the numbers array to $f12;
		syscall
		
		#print the newline
		li $v0,4		
		la $a0,new_line
		syscall
		
		addi $t0 $t0 8		#increment the index by one.	
		
		bne $t0 $t1 FOR		#if we didn't come to the end of the array loop again go to start point of FOR;
	
	#To say it is end of the program.
	li $v0,10
	syscall
