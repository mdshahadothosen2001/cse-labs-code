.model small
.stack 100h
.data
msg db 'Enter a string: $'
result db 10,13,'Display string: $', 255 DUP ('$')

.code 
main proc
   mov ax, @data
   mov ds, ax

   mov dx, offset msg
   mov ah, 09h
   int 21h

   mov di, offset result
   mov ah, 0Ah
   mov dx, di
   int 21h

   mov ah, 09h
   mov dx, offset result+2
   int 21h

   mov ah, 4Ch    ; Exit the program immediately
   int 21h

main endp
end main
