# Stack push
.macro spush (%register)
    sub $sp, $sp, 4
    sw %register, ($sp)
.end_macro

# Stack pop
.macro spop (%register)
    lw %register, ($sp)
    add $sp, $sp, 4
.end_macro
