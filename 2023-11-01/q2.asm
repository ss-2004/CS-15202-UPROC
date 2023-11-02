LDA 3000H;		3A 00 30
MOV B, A;		47
MVI A, 0;		3E 00
STA 3003H;		32 03 30
MOV L, A;		6F
MVI A, 9;		3E 09 
MOV H, A;		67

LOOP_STRT:
    LDA 3003H;	3A 03 30
    INR A;		3C
    STA 3003H;	32 03 30
    MOV A, H;	7C
    CMP L;		BD
    JC LOOP_END;DA
    ADD L;		85
    RAR;		1F
    MOV C, A;	4F
    JNC RESET;	D2 20 00
    CMC;		3F

RESET:
    NOP;		
    LXI D,3010H;11 10 30
    ADD E;		83
    MOV E, A;	5F
    MVI A, 0;	3E 00
    ADC D;		8A
    MOV D, A;	57
    LDAX D;		1A
    CMP B;		B8

JC ELSE;		DA
JZ PRINT;		CA 3D 00
MOV A, C;		79
DCR A;			3D
MOV H, A;		67
JMP LOOP_STRT;	C3 0D 00

ELSE:			
    MOV A, C;	79
    INR A;		3C
    MOV A, L;	7D
    JMP LOOP_STRT;C3 0D 00

PRINT:
    MVI A, 1;	3E 01
    STA 3001H;	32 01 30
    MOV A, C;	79
    STA 3002H;	32 02 30
    JMP TRUE_END;C3 4E 00

LOOP_END:
    MVI A, 2;	3E 02
    STA 3001H;	32 01 30

TRUE_END:
    HLT;		76