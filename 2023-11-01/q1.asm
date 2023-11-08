; Linear search

LXI H, 2000H;    21 00 20
MOV B, M;        46
INX H;           23
MOV C, M;        4E
SKIP:
    INX H;       23
    MOV A, M;    7E
    CMP B;       B8
    JZ LOOP;     CA 16 20
    DCR C;       0D
    JNZ SKIP;    C2 06 20
MVI A, 00H;      3E 00
STA 2200H;       32 00 22
HLT;             76
LOOP:
    MVI A, 01H;  3E 01
    STA 2200H;   32 00 22
    HLT;         76
