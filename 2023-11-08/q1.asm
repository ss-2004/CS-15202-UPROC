; Bubblesort

LXI H,2060
MVI B,09
LOOP1: MOV A, M
MOV C, B
PUSH H
INX H
LOOP2: MOV D, M
CMP D
JC NOSWP
PUSH H
MOV M, A
MOV A, D
POP H
XCHG
POP H
MOV M, A
PUSH H
XCHG
NOSWP: INX H
DCR C
JNZ LOOP2
POP H
INX H
DCR B
JNZ LOOP1
HLT
