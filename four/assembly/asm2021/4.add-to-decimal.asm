.model small
.stack 100h
.data
msg db 'Enter two decimal number$'
.code
main proc
   mov ax,@data
   mov ds,ax

   mov ah,09
   lea dx,msg
   int 21h

   mov ah,01
   int 21h
   mov bl,al
   sub bl,48

   mov ah,01
   int 21h
   mov bh,al
   sub bh,48

   add bl,bh
   add bl,48

   mov ah,02
   mov dl,bl
   int 21h

   exit:
   mov ah,4ch
   int 21h
   main endp
end main