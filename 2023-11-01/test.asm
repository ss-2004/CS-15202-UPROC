LDA 2012    ;3A 12 20 load the element to be searched
MOV D,A     ;57 move the element to be searched to register D
LXI H,2000  ;21 00 20 pointing the register pair to the start of the array
MVI B,0     ;06 00 starting index of array
MVI C,10    ;0E 10 ending index of array

LOOP: 
MOV A,C     ;79 move end index of array to accumulator
CMP B       ;B8 if start index > end index, end the search (element not found)
JC END2     ;DA 3F 00
ADD B       ;80 otherwise A = (B+C)/2 i.e.mid value
MVI E,0     ;1E 00 quotient of (B+C)/2

DIVIDE: 
INR E       ;1C Division of (B+C) by 2
SUI 2       ;  
JP DIVIDE   ;
DCR E;
LXI H,2000  ; Load the HL pair to the start of array location
MOV A,M     ; Move the 0th index value to accumulator
CMP D
JZ END      ; If 0th index value matches with the value to be found,end the search
MOV A,E     ; Else move the mid value to register E

GOTOMID: 
INX H       ; Moving the HL pair to the mid location of the search array
DCR A       ;

JNZ GOTOMID ;C2 22 00
MOV A,M     ; Move the mid value to accumulator (pointed by HL)
CMP D       ; Compare it with value to be searched
JZ END      ; If found, end the search
JC BOTTOM   ; If value to be searched > mid value,jump
DCR E       ; Else higher index = mid-1
MOV C,E
JMP LOOP    ; Go to the start to begin the search again on the updated array

BOTTOM: 
INR E       ; lower index = mid+1
MOV B,E     ;
JMP LOOP    ; Go to the start to begin the search again on the updated array

END: 
MVI A,1     ; Element found
STA 2013    ; Store to address 2013
HLT ; Halt

END2: 
MVI A,0     ; Element not found

;
mvi b, 7 ; last index to fill untill
    mvi h, 0 ; set up HL as memory pointer
    mvi l, 0 ; set up HL as memory pointer
loop: inr l ; increase l by one
    mov m, l
    mov a, l
    cmp b
    jm  loop

; Binary search
; Alghorithm is about like this
;  low = 0
;  high = length(haystack) - 1
;  result = 0xFF
;  while high > low {
;    // average between high and low
;    var average = (low + high) >>> 1
;    // index of middle element
;    var middle = average + low
;    var element = haystack[middle]
;    if needle == element {
;      result = middle
;      exit
;    } else if needle > element {
;      low = middle + 1
;    } else {
;      high = middle - 1
;    }
;  }


; Initialization block
    mvi b, 0 ; low@b - index from which to start search i.e. 0
    mvi c, 7 ; high@c - index where to stop search. Our haystack has 8 elements so index of last elemnt is 7
    mvi d, 7 ; needle@d - value to find
    mvi l, 9 ; result will be stored to memory at address 9
    mvi m, 255 ; clear result, 255 i.e. 0xFF means not found

while: 
    mov a, c
    cmp b ; high > low
    jm exit
    ; ((low + high) >>> 1) + low;
    add c ; a already have low@b so let's add high@c
    rar ; shift to right i.e. divide by 2 so we can get an average
    add b ; average + low
    mov e, a ; middle@e
    ; get element from memory
    mov l, e ; memory address@l is middle@e
    mov a, m ; get to element@a from memory@m by index@l
    cmp d ; is element@a > needle@d?
    jz equals ; jz - jump on zero
    jm less ; jm - jump on negative
    jp greater ; jp - jump on positive
equals: mvi l, 9 ; store middle@e to memory on 9
    mov m, e
    jmp exit
less: mov a, e
    inr a
    mov b, a
    jmp while
greater: mov a, e
    dcr a
    mov c, a
    jmp while
exit: hlt
;
