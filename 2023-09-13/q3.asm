; Calculate sum of 10 even and odd numbers separately

LXI H, 2040H
MVI B, 00
MVI C, 00
MVI D, 10

LOOP:   MOV A, M
	INX H
	MOV E, A
	ANI 01
	JNZ ISODD
	MOV A, E
	ADD B
	MOV B, A
	DCR D
	JNZ NEXT
	JMP OUTER
ISODD:  MOV A, E
	ADD C
	MOV C, A
	DCR D
	JNZ NEXT
	JMP OUTER
NEXT:   JMP LOOP
OUTER:  MOV A, B
	STA 2050H
	MOV A, C
	STA 2051H
HLT
