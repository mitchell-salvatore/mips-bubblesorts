#############################################################
#														   	#
#	Mitchell Salvatore									   	#
#	NetID: 2099280											#
#	BUBBLE SORT				2								#
#															#
#############################################################

main: 

			.data
ary: 		.word 		0, 0, 0, 0, 0
PromptText:	.asciiz 	"Please enter 5 integers: \n"
ResultText:	.asciiz		"Sorted list : "
spacer:		.asciiz		", "
			.text 

		la 		$s0, ary
			
		#Get input and store it in the array

		li		$v0, 4					#  Print
		la		$a0, PromptText			#  Print Menu selection text
		syscall

		li		$v0, 5					#  Read an integer from the console
		syscall

		li 		$t0, 0           		# put the index into $t2
		add 	$t0, $t0, $t0   		# double the index
    	add 	$t0, $t0, $t0    		# double the index
  		add 	$t1, $t0, $s0    		# combine the two components of the address
  		sw 		$v0, 0($t1)      		# store the value into the array cell


		li		$v0, 5					#  Read an integer from the console
		syscall
		li 		$t0, 1           		# put the index into $t2
		add 	$t0, $t0, $t0   		# double the index
    	add 	$t0, $t0, $t0    		# double the index
  		add 	$t1, $t0, $s0    		# combine the two components of the address
  		sw 		$v0, 0($t1)      		# store the value into the array cell

		li		$v0, 5					#  Read an integer from the console
		syscall
		li 		$t0, 2           		# put the index into $t2
		add 	$t0, $t0, $t0   		# double the index
    	add 	$t0, $t0, $t0    		# double the index
  		add 	$t1, $t0, $s0    		# combine the two components of the address
  		sw 		$v0, 0($t1)      		# store the value into the array cell

		li		$v0, 5					#  Read an integer from the console
		syscall
		li 		$t0, 3           		# put the index into $t2
		add 	$t0, $t0, $t0   		# double the index
    	add 	$t0, $t0, $t0    		# double the index
  		add 	$t1, $t0, $s0    		# combine the two components of the address
  		sw 		$v0, 0($t1)      		# store the value into the array cell

		li		$v0, 5					#  Read an integer from the console
		syscall
		li 		$t0, 4           		# put the index into $t2
		add 	$t0, $t0, $t0   		# double the index
    	add 	$t0, $t0, $t0    		# double the index
  		add 	$t1, $t0, $s0    		# combine the two components of the address
  		sw 		$v0, 0($t1)      		# store the value into the array cell

  		
  		li     	$a0, 5
  		la 		$ra, finish

RecBubSor:
		beq 	$a0, 1, done			#if length = 1 end

		move 	$t7, $a0
		addi	$t7, -1
		add 	$t5, $t7, $t7  			# double the index
    	add 	$t5, $t5, $t5    		# double the index
  		add 	$t1, $t5, $s0    		# combine the two components of the address
  		lw 		$s4, 0($t1)      		# get the value of index 5 array cell

  		addi	$sp, $sp, -12			# adjust stack for 2 items
  		sw		$s4, 0($sp)				# save my argument n
  		sw		$a0, 4($sp)				# save my argument n
		sw 		$ra, 8($sp)				# save ra

		addi	$a0, $a0, -1			#decrement length
		jal		RecBubSor

		lw		$ra, 8($sp)
		lw		$s5, 4($sp)				# restore my argument n
		lw		$s4, 0($sp)				# restore my argument n
		addi	$sp, $sp, 12			# pop 3 items off the stack

		move	$t7, $s5				# set counter to s5
		addi 	$t7, $t7, -1
		add 	$t5, $t7, $t7   		# double the index
    	add 	$t5, $t5, $t5    		# double the index
  		add 	$t1, $t5, $s0    		# combine the two components of the address
  		sw 		$s4, 0($t1)      		# store the value into the array cell
  		addi 	$t7, $t7, -1			

loop1:
		blt 	$t7, $zero, done		#branch if index is less then 0

		add 	$t5, $t7, $t7   		# double the index
    	add 	$t5, $t5, $t5    		# double the index
  		add 	$t1, $t5, $s0    		# combine the two components of the address
  		lw 		$s2, 0($t1)      		# load the value of the array cell

  		addi	$t6, $t7, 1
  		add 	$t5, $t6, $t6   		# double the index
    	add 	$t5, $t5, $t5    		# double the index
  		add 	$t1, $t5, $s0    		# combine the two components of the address
  		lw 		$s3, 0($t1)      		# load the value of the array cell

  		bgt		$s2, $s3, swap			#swap if needed
  		addi	$t7, $t7, -1			#increment t7
  		j 		loop1					#jump to loop1

swap:	
		add 	$t5, $t7, $t7   		# double the index
    	add 	$t5, $t5, $t5    		# double the index
  		add 	$t1, $t5, $s0    		# combine the two components of the address
  		sw 		$s3, 0($t1)      		# store the value into the array cell

  		addi	$t6, $t7, 1
  		add 	$t5, $t6, $t6   		# double the index
    	add 	$t5, $t5, $t5    		# double the index
  		add 	$t1, $t5, $s0    		# combine the two components of the address
  		sw 		$s2, 0($t1)      		# store the value into the array cell

  		addi	$t7, $t7, -1			#decrement t7
  		j 		loop1					#jump to loop1
done:
		jr		$ra						# return to caller



finish:
		li		$v0, 4	
		la		$a0, ResultText			#  Print text				
		syscall
		
		li 		$t0, 0           		# put the index into $t2
		add 	$t0, $t0, $t0   		# double the index
    	add 	$t0, $t0, $t0    		# double the index
  		add 	$t1, $t0, $s0    		# combine the two components of the address
  		lw 		$a0, 0($t1)      		# store the value into the array cell

		li		$v0, 1					
		syscall
		li		$v0, 4	
		la		$a0, spacer			#  Print text				
		syscall

		li 		$t0, 1           		# put the index into $t2
		add 	$t0, $t0, $t0   		# double the index
    	add 	$t0, $t0, $t0    		# double the index
  		add 	$t1, $t0, $s0    		# combine the two components of the address
  		lw 		$a0, 0($t1)      		# store the value into the array cell

		li		$v0, 1					
		syscall
		li		$v0, 4	
		la		$a0, spacer			#  Print text				
		syscall

		li 		$t0, 2           		# put the index into $t2
		add 	$t0, $t0, $t0   		# double the index
    	add 	$t0, $t0, $t0    		# double the index
  		add 	$t1, $t0, $s0    		# combine the two components of the address
  		lw 		$a0, 0($t1)      		# store the value into the array cell

		li		$v0, 1					
		syscall
		li		$v0, 4	
		la		$a0, spacer			#  Print text				
		syscall

		li 		$t0, 3           		# put the index into $t2
		add 	$t0, $t0, $t0   		# double the index
    	add 	$t0, $t0, $t0    		# double the index
  		add 	$t1, $t0, $s0    		# combine the two components of the address
  		lw 		$a0, 0($t1)      		# store the value into the array cell

		li		$v0, 1					
		syscall
		li		$v0, 4	
		la		$a0, spacer			#  Print text				
		syscall

		li 		$t0, 4           		# put the index into $t2
		add 	$t0, $t0, $t0   		# double the index
    	add 	$t0, $t0, $t0    		# double the index
  		add 	$t1, $t0, $s0    		# combine the two components of the address
  		lw 		$a0, 0($t1)      		# store the value into the array cell

		li		$v0, 1					
		syscall

		#  Quit
		li		$v0, 10					#  Quit
		syscall
