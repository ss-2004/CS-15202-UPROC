; Copy memory block without overlap

MVI C, 05
LXI H, 2500
LXI D, 2600
LOOP: 
    MOV A, M
    STAX D
    INX H
    INX D
    DCR C
    JNZ LOOP
HLT
