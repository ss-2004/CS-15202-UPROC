;Selection Sort

LDA 2000            ;4200 3A D0  7	 
MOV B, A            ;4203 47  	 
MVI C, 0            ;4204 0E 00 	 
MVI D, 0            ;4206 16 00 	 
LXI H, 2001         ;4208 21 D1  7	 
   	 
ILOOP:	MOV A, C    ;420B 79  	 
CMP B               ;420C B8  	 	
JZ END              ;420D CA 63 42	 	
MOV A, C            ;4210 79  	 	
STA 2012            ;4211 32 DC  7	 	
MOV A, C            ;4214 79  	 	
INR A               ;4215 3C  	 	
MOV D, A            ;4216 57  	 	
   	 
JLOOP:	MOV A, D    ;4217 7A  	 
CMP B               ;4218 B8  	 	
JZ NXTPSS           ;4219 CA 53 42	 	
LDA 2012            ;421C 3A DC  7	 	
LXI H, 2001         ;421F 21 D1  7	 	
ADD L               ;4222 85  	 	
MOV L, A            ;4223 6F  	 	
MOV E, M            ;4224 5E  	 	
MOV A, D            ;4225 7A  	 	
LXI H, 2001         ;4226 21 D1  7	 	
ADD L               ;4229 85  	 	
MOV L, A            ;422A 6F  	 	
MOV A, M            ;422B 7E  	 	
CMP E               ;422C BB  	 	
JC CHGIDX           ;422D DA 4C 42	 	
   	 
BACK:	LXI H, 2001 ;4230 21 D1  7	 
INR D               ;4233 14  	 	
   	 
BACK2: 	JMP JLOOP   ;4234 C3 17 42	 
   	 
SWP:	LXI H, 2001 ;4237 21 D1  7	 
MOV A, C            ;423A 79  	 	
ADD L               ;423B 85  	 	
MOV L, A            ;423C 6F  	 	
MOV A, M            ;423D 7E  	 	
MOV M, E            ;423E 73  	 	
MOV E, A            ;423F 5F  	 	
LXI H, 2001         ;4240 21 D1  7	 	
LDA 2012            ;4243 3A DC  7	 	
ADD L               ;4246 85  	 	
MOV L, A            ;4247 6F  	 	
MOV M, E            ;4248 73  	 	
JMP PSSBCK          ;4249 C3 5F 42	 	
   	 
CHGIDX: MOV A, D    ;424C 7A  	 
STA 2012            ;424D 32 DC  7	 	
JMP BACK            ;4250 C3 30 42	 	
   	 
NXTPSS: LDA 2012    ;4253 3A DC  7	 
LXI H, 2001         ;4256 21 D1  7	 	
ADD L               ;4259 85  	 	
MOV L, A            ;425A 6F  	 	
MOV E, M            ;425B 5E  	 	
JMP SWP             ;425C C3 37 42	 	
   	 
PSSBCK: INR C       ;425F 0C  	 
JMP ILOOP           ;4260 C3 0B 042	 	
   	 
END: MVI A, 0       ;4263 3E 00 	 
STA 2012            ;4265 32 DC  7	 	
HLT                 ;4268 76  	 	
