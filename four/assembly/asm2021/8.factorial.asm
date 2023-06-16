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



; second for 16 bit


.model small
.stack 100h
.code 
main proc
   mov cx,3
   mov ax,1

   level:
   mul cx
   dec cx
   jnz level

   add ax,48
   mov dx,ax
   mov ah,02
   int 21h

   exit:
   mov ah,4ch
   int 21h
   main endp
end main