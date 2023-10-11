LDA 2200;       3A 98 08
MOV H, A;       67
LDA 2201;       3A 99 08
MOV L, A;       6F
MVI D, 05;      16 05
LXI B, 2202;    01 9A 08

LOOP: MVI A,00; 3E 00
    ADD H;      84
    ADD L;      85
    STAX B;     02
    MOV H, L;   65
    MOV L, A;   6F
    INX B;      03
    DCR D;      15
    JNZ LOOP;   C2 0D 42
    HLT;        76
