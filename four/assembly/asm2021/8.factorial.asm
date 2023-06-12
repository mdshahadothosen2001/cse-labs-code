.model small
.stack 100h
.code 
main proc
   mov cl,3
   mov al,1

   level:
   mul cl
   dec cl
   jnz level

   add al,48
   mov dl,al
   mov ah,02
   int 21h

   exit:
   mov ah,4ch
   int 21h
   main endp
end main