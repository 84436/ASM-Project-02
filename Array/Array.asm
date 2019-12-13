# Main program

.include    "../Commons/syscall.asm"

            .data
mstr1:      .asciiz "Enter a choice, or press Cancel/close this dialog to exit.\n1 = Valid choice\n2 = Still a valid choice"
mvalid:     .asciiz "Valid choice."
minvalid:   .asciiz "Invalid choice."
mempty:		.asciiz "Please make a choice."

            .text
main:
            li $v0, InputDialogInt
            la $a0, mstr1
            syscall
            
            beq $a1, InputDialogInt_Cancel, exit
            beq $a1, InputDialogInt_OKonEmpty, pleasechoose
            
            beq $a0, 1, valid
            beq $a0, 2, valid
            j invalid
            
valid:
            li $v0, MessageDialog
            la $a0, mvalid
            li $a1, MessageDialog_Info
            syscall
            j main

invalid:
            li $v0, MessageDialog
            la $a0, minvalid
            li $a1, MessageDialog_Error
            syscall
            j main

pleasechoose:
            li $v0, MessageDialog
            la $a0, mempty
            li $a1, MessageDialog_Error
            syscall
            j main

exit:
            li $v0, Exit
            syscall
