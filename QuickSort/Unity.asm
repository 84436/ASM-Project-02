#Marcro for print string
.data
buffer: .space 10

.eqv BASE 10

.macro print_str (%str)
	.data
myLabel: .asciiz %str
	.text
	li $v0, 4
	la $a0, myLabel
	syscall
.end_macro
#Marcro for print integer
.macro print_int (%x)
	li $v0, 1
	move $a0, %x
	syscall
	print_str("\n")
.end_macro
.macro for (%regIterator, %from, %to, %bodyMacroName)
	add %regIterator, $zero, %from
	Loop:
		%bodyMacroName ()
		add %regIterator, %regIterator, 1
		ble %regIterator, %to, Loop
.end_macro


.macro Title()
print_str("Quicksort mini MIPS program\n")
.end_macro 

#Open file and return file descriptor to $v0
.macro open_file (%path)
.data
openfile: .asciiz %path
.text
li $v0, 13
la $a0, openfile
li $a1, 0
li $a2, 0
syscall
move $t0,$v0
print_str("Open file from: ")
li $v0,4 
la $a0,openfile
syscall
print_str("\n")
move $v0,$t0
.end_macro

#Get char from buffer - but first, let make a move, like dacin queen
.macro get_char(%descriptor)
.text
li $v0,14
move $a0,%descriptor
la $a1, buffer
li $a2, 1
syscall
move $v1,$v0
lb $v0, buffer
.end_macro

#Char to integer
.macro ctoi(%c)
subi %c,%c,48
.end_macro

#Convert base from ascii to decimal
.macro dut_base(%hi, %lo)
mul %hi,%hi,BASE
add %hi,%hi,%lo
.end_macro

.macro spush (%register)
    sub $sp, $sp, 4
    sw %register, ($sp)
.end_macro

.macro spop (%register)
    lw %register, ($sp)
    add $sp, $sp, 4
.end_macro

.macro swap (%addr1, %addr2)
    spush($t0)
    spush($t1)
    lw $t0, %addr1
    lw $t1, %addr2
    sw $t0, %addr2
    sw $t1, %addr1
    spop($t1)
    spop($t0)
.end_macro

.macro loadfile(%descriptor)
li $t1,0
li $t3,0
while:
	get_char(%descriptor)
	move $t0,$v0
	beq $v1,$0,outwhile
	beq $t0,CR,return_val
	beq $t0,LF,return_val
	beq $t0,SPACE,return_val
	ctoi($t0)
	dut_base($t1,$t0)
	j while
return_val:
	beq $t3,0,first_push
	print_int($t1)
	spush($t1)
	li $t1,0
	j while
first_push:
	print_str("So luong phan tu: ")
	print_int($t1)
	spush($t1)
	spush($t1)
	spop($t4)
	li $t1,0
	addi $t3,$t3,1
	j while
outwhile:
	move $v0,$t3
	move $v1,$t4
	print_str("Load file hoan tat")
.end_macro
