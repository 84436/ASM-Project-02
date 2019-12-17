# Component

.macro spush (%register)
    sub $sp, $sp, 4
    sw %register, ($sp)
.end_macro

.macro spop (%register)
    lw %register, ($sp)
    add $sp, $sp, 4
.end_macro

.macro isPrime (%int)
    # U: $t0 (%int placeholder)
    #    $t1 (REMainder)
    # O: $v0 (0 or 1)
    
    pre:
        spush ($t0)
        spush ($t1)
        li $t0, %int

    main:
        blt $t0, 2, ip_false
        sub $t0, $t0, 2
        ip_loop:
            blt $t0, 0, ip_true
            rem $t1, $t0, 2
            beq $t1, 0, ip_false
            sub $t0, $t0, 1
            j ip_loop
        ip_true:
            li $v0, 1
            j post
        ip_false:
            li $v0, 0
            j post

    post:
        spop ($t1)
        spop ($t0)
.end_macro
