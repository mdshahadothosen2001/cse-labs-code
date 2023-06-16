.model small
.stack 100h
.code
main proc
   mov ah,01
   int 21h
   mov bl,al

   mov ah,01
   int 21h
   mov bh,al

   cmp bl,bh
   jg level

   mov ah,02
   mov dl,bl
   int 21h
   jmp exit

   level:
   mov ah,02
   mov dl,bh
   int 21h

   exit:
   mov ah,4ch
   int 21h
   main endp
end main