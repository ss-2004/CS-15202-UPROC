	   MVI C,00
	   MVI A,FF
	   MVI B,83
	   ADD B
	   JNC L
	   INR C

L:	   STA 2050
	   MOV A,C
	   STA 2051
	   HLT
