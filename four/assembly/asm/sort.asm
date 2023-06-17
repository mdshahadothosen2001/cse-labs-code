.model small
.stack 100h
.data
array db 9, 5, 7, 2, 1   ; Array of numbers to be sorted
length equ ($ - array)  ; Length of the array

.code 
main proc
   mov ax, @data
   mov ds, ax

   mov cx, length      ; Set the loop counter to the length of the array
   dec cx              ; Decrement CX by 1

   outer_loop:
   mov bx, 0           ; Set BX to 0 (start of the array)

   inner_loop:
   mov si, bx          ; Set SI to the current index
   inc si              ; Increment SI to point to the next element

   mov al, [array+bx]  ; Load the current element into AL
   cmp al, [array+si]  ; Compare with the next element

   jbe skip_swap       ; Jump if the current element is less than or equal to the next element

   ; Swap the elements
   mov dl, [array+si]  ; Load the next element into DL
   mov [array+si], al  ; Store the current element in the next position
   mov [array+bx], dl  ; Store the next element in the current position

   skip_swap:
   inc bx              ; Move to the next pair of elements
   cmp bx, cx          ; Compare BX with the loop counter
   jl inner_loop       ; Jump to the inner loop if BX is less than CX

   loop outer_loop     ; Loop until CX is zero

   ; Display the sorted array
   mov cx, length      ; Set the loop counter to the length of the array
   mov bx, 0           ; Set BX to 0 (start of the array)

   display_loop:
   mov dl, [array+bx]  ; Load the current element
   add dl, '0'         ; Convert the number to ASCII character

   mov ah, 02h         ; Print the character
   int 21h

   inc bx              ; Move to the next element
   loop display_loop   ; Loop until CX is zero

   exit_program:
