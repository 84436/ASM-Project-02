.include "Unity.asm"

Title()
open_file("./input_sort.txt",0)
move $s0,$v0 				# Move file descriptor to $s0
loadfile($s0) 				# Load da file, $v1 store n of element, $sp store arr[n-1]
move $s7,$v1

			
main: 						# Prepare data for Quicksort
li $a1, 0 					# a1 = 0
subi $a2,$v1,1 				# $a2 = n - 1
mul $t2,$a2,4
add $t1,$sp,$t2 			#t1 = &a[0]
la $a0,($t1) 				#a0 = &a[0]

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
	
quick_sort:					# Takes 3 args: $a0: Array, $a1: Low index, $a2: High Index			

addi $sp, $sp, -12 			# Create space on the stack for 3 words
sw $ra, 4($sp) 				# save return address
sw $a1, 0($sp) 				# save arg 1
sw $a2, 8($sp)				# save arg 2

blt $a1, $a2, continue_sort	# Branches if the low index is bigger than the high

j end_sort					# Terminate current sort process

continue_sort:

jal partition				# Jump to partition process. Args are the same as current quick_sort args

add $t1, $v0, $zero			# Store temp variable to hold partition return value

add $t2, $a2, $zero			# Store $a2 value in a temp to preserve through recursive call

addi $a2, $t1, -1			# Change the high index arg to value returned by partition - 1

jal quick_sort

add $a2, $t2, $zero			# Restore $a2 value after recursive call	
addi $a1, $t1, 1			# Change the High index arg to value returned by partition + 1

jal quick_sort

end_sort:
lw $ra 4($sp)				# Load previous return address
lw $a1, 0($sp)				# Load previous arg 1
lw $a2, 8($sp)				# Load previous arg 2
		
addi $sp, $sp, 12			# Remove current stack frame from the stack
jr $ra						# Jump to return address

partition:					# Takes 3 args: $a0: Array, $a1: Low index, $a2: High Index

addi $sp, $sp, -8 			# Create space for two words
sw $ra, 4($sp) 				# save return address

mul $t2, $a2, -4			# Calculates offset of the High Index
add $t3, $a0, $t2 			# $t3 High address	# Calculates the address of the Pivot
lw $t4, 0($t3)				# Loads the value thats stored in the address List[High Index] int $t4 Pivot

addi $t5, $a1, -1			# Get index of the smaller element i 
mul $t2, $t5, -4			# Calulates i offset
add $t7, $a0, $t2 			# $t7 I address	# Calculates the address of the ith element

add $t0, $a1, $zero			# Initialize loop counter j
for_loop:
bge $t0, $a2, exit_loop		# Loop condition: Branch if inex is greater than the high Index

mul $t2, $t0, -4			# Calulates loop counter offset
add $t6, $a0, $t2 			#$t6 J address		# Calculates the address of the jth element
lw $t8, 0($t6)				# Loads value stored in the jth element

bgt $t8, $t4, end_loop_cond			# Branch if List[j] >= Pivot

addi $t5, $t5, 1			# increment i
addi $t7, $t7, -4			# increment i

lw $t9, 0($t7)				# temp = List[i]
sw $t8, 0($t7)				# List[i] = List[j]
sw $t9, 0($t6)				# List[j] = temp
end_loop_cond:

addi $t0, $t0, 1			# Increment i
j for_loop

exit_loop:

lw $t9, -4($t7)				# temp = arr[i+1];
sw $t4, -4($t7)				# arr[i+1] = arr[high];
sw $t9, 0($t3)				# arr[high] = temp;

addi $v0, $t5, 1			# Load return value

end_of_partition:
lw $ra, 4($sp)				# Restore previous return address
addi $sp, $sp, 8			# Remove current stack frame from the stack
jr $ra						# Jump to return address


write_to_file:
	open_file("./output_sort.txt",1)
	move $s2,$v0
	save_file($s2,$s7)
	close_file($s2)
	close_file($s0)
	addi $v0,$0, 10
	syscall

