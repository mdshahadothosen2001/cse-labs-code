# Display Alphabets

.model small
.stack 100h
.data
a db 'Display Alphabets',10,13,'$'
.code
main proc
   mov ax,@data
   mov ds,ax

   mov ah,09
   lea dx,a
   int 21h
   
   mov cx,26
   mov ah,02
   mov dl,'A'

   level:
   int 21h
   inc dl
   loop level1

   exit:
   mov ah,4ch
   int 21h
   main endp
end main