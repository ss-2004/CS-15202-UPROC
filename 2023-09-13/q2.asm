LDA 2200
MOV C, A
MVI B, 00H
LXI H, 2201
BACK:   MOV A, M
        ANI 0H
        JNZ SKIP
        MOV A, B
        ADD M
        MOV B, A
SKIP:   INX H
        DCR C
        JNZ BACK
        MOV A, B
        STA 2210
HLT