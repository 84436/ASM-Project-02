##################################################
# Syscall mappings

.eqv    INT_PUT         1
.eqv    INT_GET         5
.eqv    CHAR_PUT        11
.eqv    STRING_PUT      4
.eqv    STRING_GET      8
.eqv    FILE_OPEN       13
.eqv    FILE_CLOSE      16
.eqv    FILE_PUT        15
.eqv    FILE_GET        14
.eqv    EXIT            10

##################################################
# Strings

.eqv    LF      0xA
.eqv    CR      0xD
.eqv    SPACE   0x20

                    .data
str_getarraysize:   .asciiz "Array size = "
str_getarray_1:     .asciiz "a["
str_getarray_2:     .asciiz "] = "
str_menu:           .asciiz "1 : List all elements\n2 : Get sum of all elements\n3 : List primes only\n4 : Find maximum element\n5 : Find an element\n0 : Exit\nEnter a choice [0-5]: "
str_menu_invalid:   .asciiz "Invalid choice"
str_f1:             .asciiz "List (all):\n"
str_f2:             .asciiz "Sum = "
str_f3:             .asciiz "List (prime only):\n"
str_f4:             .asciiz "Max = "
str_f5_input:       .asciiz "Enter a number: "
str_f5_found:       .asciiz "Number found at index "
str_f5_not_found:   .asciiz "Number not found"
str_exit:           .asciiz "Goodbye."

##################################################
# Basic components

.macro      spush (%r)
            sub $sp, $sp, 4
            sw %r, ($sp)
.end_macro

.macro      spop (%r)
            lw %r, ($sp)
            add $sp, $sp, 4
.end_macro

.macro      PrintInt (%r_int)
            li $v0, INT_PUT
            move $a0, %r_int
            syscall
.end_macro

.macro      GetInt
            li $v0, INT_GET
            syscall
.end_macro

.macro      PrintChar (%l_char)
            li $v0, CHAR_PUT
            li $a0, %l_char
            syscall
.end_macro

.macro      PrintString (%a_string)
            li $v0, STRING_PUT
            la $a0, %a_string
            syscall
.end_macro

##################################################
# Functions

.macro      GetArraySize
    func:   PrintString (str_getarraysize)
            GetInt
            ble $v0, 0, func
            move $s1, $v0
.end_macro

.macro      GetArray
            li $t0, 0
    func:   PrintString (str_getarray_1)
            PrintInt ($t0)
            PrintString (str_getarray_2)
            GetInt
            ble $v0, 0, func
            spush ($v0)
            add $t0, $t0, 1
            blt $t0, $s1, func
.end_macro

.macro      List
            move $t0, $s0
            li $t1, 0
            PrintString (str_f1)
            j func
    sprt:   PrintChar (SPACE)
    func:   li $v0, INT_PUT
            lw $a0, ($t0)
            syscall
            sub $t0, $t0, 4
            add $t1, $t1, 1
            blt $t1, $s1, sprt
.end_macro

.macro      Sum
            move $t0, $s0
            li $t1, 0
            li $t2, 0
    func:   lw $a0, ($t0)
            add $t2, $t2, $a0
            sub $t0, $t0, 4
            add $t1, $t1, 1
            blt $t1, $s1, func
    post:   PrintString (str_f2)
            PrintInt ($t2)
            
.end_macro

.macro      Max
            move $t0, $s0
            li $t1, 0
            li $t2, 0
    func:   lw $a0, ($t0)
            bgt $a0, $t2, max
            sub $t0, $t0, 4
            add $t1, $t1, 1
            blt $t1, $s1, func
            j post
    max:    move $t2, $a0
            j func
    post:   PrintString (str_f4)
            PrintInt ($t2)
.end_macro

.macro      isPrime (%r_int)
    pre:    spush ($t0)
            spush ($t1)
            spush ($t2)
            move $t0, %r_int
            li $t1, 1
    func:   blt $t0, 2, notp
            beq $t0, 2, p
            sub $t2, $t0, 1
    loop:   add $t1, $t1, 1
            rem $v0, $t0, $t1
            beq $v0, 0, notp
            blt $t1, $t2, loop
            j p
    notp:   li $v0, 0
            j post
    p:      li $v0, 1
            j post
    post:   spop ($t2)
            spop ($t1)
            spop ($t0)
.end_macro

.macro      ListPrime
    pre:    move $t0, $s0
            li $t1, 0
            PrintString (str_f3)
    func:   lw $a0, ($t0)
            isPrime ($a0)
            beq $v0, 0, next
            PrintInt ($a0)
    next:   sub $t0, $t0, 4
            add $t1, $t1, 1
            beq $t1, $s1, post
            beq $v0, 0, nosp
            PrintChar (SPACE)
    nosp:   j func
    post:
.end_macro

.macro      Search
.end_macro
