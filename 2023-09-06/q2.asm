; Addition of 10 numbers stored contiguously in memory

	MVI C,10
	MVI D,00
	MVI A,00
	LXI H,2051

BACK:
    MOV B,M
	ADD B
	JNC NEXT
	INR D

NEXT:
    INX H
	DCR C
	JNZ BACK
	STA 2061
	MOV A,D
	STA 2062
	HLT
