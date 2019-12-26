.include "Unity.asm"

.data
.eqv CR 0xD
.eqv LF 0xA
.eqv SPACE 0x20
Title()
open_file("/home/t3bol90/Documents/KIENTRUCMAYTINHVAHOPNGU/Project02/input_sort.txt")
move $s0,$v0 #Move file descriptor to $s0
loadfile($s0)
print_int($v1)
