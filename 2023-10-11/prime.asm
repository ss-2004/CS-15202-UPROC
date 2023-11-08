; Check if number is prime or not

LDA 2200;               3A 98  8
MOV B, A;               47
MOV E, A;               5F
MVI C, 00H;             0E 00
LOOP1: MOV D, E;        53
LOOP2: CMP D;           BA
       JC DVDNDLESSZERO;DA 10 42
       SUB D;           92
       JNZ LOOP2;       C2 08 042	

DVDNDLESSZERO: CPI 00H; FE 00
	       JNZ NOTDVSR; C2 16 42
	       INR C;       0C

NOTDVSR: MOV A, B;      78
	 DCR E;             1D
	 JNZ LOOP1;         C2 02 042
	 MOV A, C;          79
	 MVI C, 00H;        0E 00
	 CPI 02H;           FE 02
	 JNZ CMPST;         C2 24 42
	 INR C;             0C

CMPST: MOV A, C;        79
       STA 2202;        32 9A 8 
       HLT;             76
