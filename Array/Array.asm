##################################################
# Main program

.include        "Array_parts.asm"
                
                .text

input_array:    move $s0, $sp
                sub $s0, $s0, 4
                GetArraySize
                GetArray
                
menu:           PrintChar (LF)
                PrintChar (LF)
                PrintString (str_menu)
                GetInt
                beq $v0, 0, exit
                beq $v0, 1, f1
                beq $v0, 2, f2
                beq $v0, 3, f3
                beq $v0, 4, f4
                beq $v0, 5, f5
                j invalid
                
invalid:        PrintString (str_menu_invalid)
                j menu
                
f1:             List
                j menu
                
f2:             Sum
                j menu
                
f3:             ListPrime
                j menu
                
f4:             Max
                j menu
                
f5:             Search
                j menu
                
exit:           PrintString (str_exit)
                li $v0, EXIT
                syscall
