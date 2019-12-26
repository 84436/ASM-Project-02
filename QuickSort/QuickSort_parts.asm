# Components

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
