DATA SEGMENT
    ARR DW 5, 2, 8, 1, 9     ; Array of numbers to be sorted
    LEN EQU ($ - ARR) / 2    ; Length of the array
DATA ENDS

CODE SEGMENT
    ASSUME CS:CODE, DS:DATA

START:
    MOV AX, DATA
    MOV DS, AX              ; Initialize data segment
    
    MOV CX, LEN             ; Set the loop counter
    
    OUTER_LOOP:
        MOV SI, 0           ; Initialize inner loop index
        MOV BX, CX          ; Set the limit of inner loop
        
        INNER_LOOP:
            MOV AX, [ARR + SI * 2]
            CMP AX, [ARR + (SI+1) * 2]
            JG SWAP          ; If current element > next element, swap them
            
            INC SI           ; Move to the next element
            CMP SI, BX       ; If inner loop index reaches the limit, exit loop
            JL INNER_LOOP
            
        LOOP OUTER_LOOP     ; Repeat the process for all elements
    
    MOV AX, 4C00H           ; Exit program
    INT 21H
    
SWAP:
    XCHG [ARR + SI * 2], [ARR + (SI+1) * 2]  ; Swap the elements
    JMP INNER_LOOP

CODE ENDS
END START
