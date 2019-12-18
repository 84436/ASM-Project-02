##################################################
# Main program

.include        "Array_parts.asm"
                
                .text

input_array:    move $s0, $sp
                sub $s0, $s0, 4
                GetArraySize
                PrintChar (LF)
                GetArray

menu:           PrintChar (LF)
                PrintString (str_menu)
                
menu_prompt:    PrintChar (LF)
                PrintChar (LF)
                PrintString (str_menu_prompt)
                GetInt
                beq $v0, 0, exit
                beq $v0, 1, f1
                beq $v0, 2, f2
                beq $v0, 3, f3
                beq $v0, 4, f4
                beq $v0, 5, f5
                j invalid
                
invalid:        PrintString (str_menu_invalid)
                j menu_prompt
                
f1:             List
                j menu_prompt
                
f2:             Sum
                j menu_prompt
                
f3:             ListPrime
                j menu_prompt
                
f4:             Max
                j menu_prompt
                
f5:             Search
                j menu_prompt
                
exit:           EndProgram
