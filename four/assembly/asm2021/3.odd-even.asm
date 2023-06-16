.model small
print macro msg
   mov ah,09
   lea dx,msg
   int 21h
endm

.stack 100h
.data
a db 'Enter number: $'
od db 10,13,'Number is Even$'
ev db 10,13,'Number is Odd$'
n db ?
m db 2

.code
main proc
   mov ax,@data
   mov ds,ax

   print a

   mov ah,01
   int 21h
   sub al,48
   mov n,al

   mov al, n    ; Move the value to divide into AL
   mov ah, 0    ; Clear AH

   div m        ; Divide AL by M

   cmp ah, 0    ; Check remainder in AH
   jne odd      ; If remainder is not zero, jump to odd

   print od     ; Number is even
   jmp exit

odd:
   print ev     ; Number is odd

exit:
   mov ah,4ch
   int 21h

main endp
end main
