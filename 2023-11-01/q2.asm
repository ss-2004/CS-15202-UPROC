LDA 3000H;
MOV B, A;
MVI A, 0;
STA 3003H;
MOV L, A;
MVI A, 9;
MOV H, A;

LOOP_STRT:
    LDA 3003H;
    INR A;
    STA 3003H;
    MOV A, H;
    CMP L;
    JC LOOP_END
    ADD L;
    RAR;
    MOV C, A;
    JNC RESET
    CMC;

RESET:
    NOP;
    LXI D, 3010H;
    ADD E;
    MOV E, A;
    MVI A, 0;
    ADC D;
    MOV D, A;
    LDAX D;
    CMP B;

JC ELSE;
JZ PRINT;
MOV A, C;
DCR A;
MOV H, A;
JMP LOOP_STRT;

ELSE:
    MOV A, C;
    INR A;
    MOV A, L;
    JMP LOOP_STRT;

PRINT:
    MVI A, 1;
    STA 3001H;
    MOV A, C;
    STA 3002H;
    JMP TRUE_END;

LOOP_END:
    MVI A, 2;
    STA 3001H;

TRUE_END:
    HLT;