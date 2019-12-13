# Syscall number mappings

# Put data
.eqv    PrintInt                1
.eqv    PrintString             4
.eqv    MessageDialog           55
.eqv    MessageDialogInt        56
.eqv    MessageDialogString     59

# Get data
.eqv    ReadInt                 5
.eqv    ReadString              8
.eqv    InputDialogInt          51
.eqv    InputDialogString       54

# Statuses for service 51, 54, 55
.eqv    MessageDialog_Neutral       -1
.eqv    MessageDialog_Error          0
.eqv    MessageDialog_Info           1
.eqv    MessageDialog_Warn           2
.eqv    MessageDialog_Ask            3
.eqv    InputDialogInt_CantParse    -1
.eqv    InputDialogInt_Cancel       -2
.eqv    InputDialogInt_OKonEmpty    -3
.eqv    InputDialogString_Cancel    -2
.eqv    InputDialogString_OKonEmpty -3
.eqv    InputDialogString_Overflow  -4

# File I/O
.eqv    OpenFile                13
.eqv    ReadFile                14
.eqv    WriteFile               15
.eqv    CloseFile               16

# Terminate execution
.eqv    Exit                    10
