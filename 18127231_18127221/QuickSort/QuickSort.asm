.include "Unity.asm"
Title()
open_file("./input_sort.txt",0)
move $s0,$v0 				# Move file descriptor to $s0
loadfile($s0) 				# Load da file, $v1 store n of element, $sp store arr[n-1]
move $s7,$v1

			
main: 						# Load init data - $a1 low , $a2 high, $a0 array (a)
li $a1, 0 					# a1 = 0
subi $a2,$v1,1 				# $a2 = n - 1
la $a0,($sp) 				# $a0 = &a[0]

#Reset reg
li $t1, 0
li $t2, 0
li $t3, 0
li $t4, 0
li $t5, 0
li $t6, 0
li $t7, 0
li $t8, 0
li $t9, 0
li $v0, 0


jal quick_sort

j write_to_file
	
restore:
	addi $sp, $sp, -12 		# init stack size = 3
	sw	$t1, 0($sp)			# $t1: pivot
	sw 	$t2, 4($sp)			# $t2: lo
	sw	$t3, 8($sp)			# $t3: hi
	
	mul	$t0, $a1, 4			# offset i
	add	$t0, $a0, $t0		# &arr[i]
	lw	$t1, 0($t0)			# arr[i]

	mul	$t2, $a2, 4			# offset j
	add	$t2, $a0, $t2		# &arr[j]
	lw	$t3, 0($t2)			# arr[j]
	
	sw 	$t1, 0($t2)			# swap 2 pos
	sw	$t3, 0($t0)
	lw 	$t1, 0($sp)			# restore 
	lw	$t2, 4($sp)			# restore
	lw	$t3, 8($sp)			# restore
	addi $sp, $sp, 12		# pop stack
	
	
	jr 	$ra				

partition:
	addi $sp, $sp, -12
	
	sw	$a1, 0($sp)			# $a1 lo
	sw	$a2, 4($sp)			# $a2 hi
	sw	$ra, 8($sp)			# return address

	mul $t0, $a2, 4		# calculate hi offset
	add	$t0, $a0, $t0		# &arr[hi]
	lw	$t1, 0($t0)			# arr[hi]
	
	addi	$t2, $a1, -1	# i = lo - 1
	move 	$t3, $a1		# j = lo
	addi	$t4, $a2, 0		# n = hi
	for_loop:
		beq	$t3, $t4, next_step	# index out range - branch to nextstep
		
		mul $t0, $t3, 4		# Calculate arr[j] offset
		add	$t0, $a0, $t0	# &arr[j]
		lw	$t5, 0($t0)		# arr[j]

		bge	$t5, $t1, end_loop_cond	# if array[j] < pivot

		addi $t2, $t2, 1			# increase i 

		move $a1, $t2		# store value for loop
		move $a2, $t3		# store value for loop
		jal restore	
										
		end_loop_cond:
			addi $t3, $t3, 1	# increase j
			j for_loop

	next_step:
		lw	$a1, 0($sp)		# $a1 lo
		lw	$a2, 4($sp)		# $a2 hi
		addi $a1, $t2, 1	# increase lo upto 1
		jal restore

		move $v0,$a1        # return pivot
		
		lw	$ra, 8($sp)		# load return address
		addi $sp, $sp, 12	# pop stack

		jr	$ra

quick_sort:
	addi $sp, $sp, -16 # Init stack for array, hi, lo and $ra
	sw $a0, 0($sp)			# $a0 arr
	sw $a1, 4($sp)			# $a1 lo
	sw $a2, 8($sp)			# $a2 hi
	sw $ra, 12($sp)			# save return address
	
	bgt	$a1, $a2, end_of_partition	# branches if the low index is bigger than the high
	
	jal 	partition
	move 	$s3, $v0			# get pivot return
	
	lw	$a1, 4($sp)			# $a1 lo
	addi 	$a2, $s3, -1	# $a2 hi, aka pivot descrease 1
	jal 	quick_sort
	
	addi	$a1, $s3, 1		# $a1 lo, aka pivot increase 1
	lw	$a2, 8($sp)			# $a2 hi
	jal 	quick_sort

end_of_partition: 	
	lw	$a0, 0($sp)			# $a0 arr
	lw	$a1, 4($sp)			# $a1 lo
	lw	$a2, 8($sp)			# $a2 hi
	lw	$ra, 12($sp)		# load return address

	addi $sp, $sp, 16	# pop stack
	jr	$ra					# return to quicksort


write_to_file:
	open_file("./output_sort.txt",1)
	move $s2,$v0
	save_file($s2,$s7)
	close_file($s2)
	close_file($s0)
	addi $v0,$0, 10
	syscall

