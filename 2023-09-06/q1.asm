; Addition of 5 numbers entered simultaneously

LDA 0x2050
MOV B, A
LDA 0x2051
ADD B
MOV B, A
LDA 0x2052
ADD B
MOV B, A
LDA 0x2053
ADD B
MOV B, A
LDA 0x2054
ADD B
MOV B, A
STA 0x206F
HLT

