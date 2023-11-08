; Copy block of memory with overlap

MVI C, 05
MOV B, C
LXI H, 2500
LXI D, 2503
LOOP: 
    INX H
    INX D
    DCR C
    JNZ LOOP
MOV C, B
COPY: 
    DCX H
    MOV A, M
    STAX D
    DCR C
    JNZ COPY
HLT
