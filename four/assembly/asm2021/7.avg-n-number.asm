.model small
print macro msg
   mov ah,09
   lea dx,msg
   int 21h
.stack 100h
.data
msg1 db 'Enter value of n$'
msg2 db 'Enter elements of n numbers$'
n db ?
.code 
main proc
   mov ax,@data
   mov ds,ax

   print msg1

   mov ah,01
   int 21h
   mov n,al

   mov cx,n
   
   print msg2

   level:
   mov ah,01
   int 21h
   add bl,al
   loop level

   mov al,bl
   div n

   mov ah,02
   mov dl,al
   int 21h

   exit:
   mov ah,4ch
   int 21h
   
   main endp
end main