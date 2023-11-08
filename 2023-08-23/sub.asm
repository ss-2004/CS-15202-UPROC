; Subtract 2 8bit numbers with borrow

MVI C, 00
MVI A, 083H
MVI B, 0FFH
SUB B

JNC L
L: STA 2050H
MOV A,C
STA 2051H
HLT
