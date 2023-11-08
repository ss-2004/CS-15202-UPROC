; Factorial

LDA 2050;       3A 02 08
MOV B, A;       47
MVI A, 01H;     3E 01

SET: MOV C, B;  48
DCR C;          0D
MOV D, A;       57

MULTI: ADD D;   82
DCR C;          0D
JNZ MULTI;      C2 09 42
DCR B;          05
JNZ SET;        C2 06 42
STA 2051;       32 03 08
HLT;            76
