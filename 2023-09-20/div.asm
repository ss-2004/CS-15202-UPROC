; Divide 2 numbers

LDA 2200
MOV B, A
LDA 2201
MOV C, A
MVI D, 00
MOV A, B
LOOP: 
    INR D
    STA 2203
    SUB C
    JP LOOP
    DCR D
    MOV A, D
    STA 2202
HLT
