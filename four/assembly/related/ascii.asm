# Display ASCII Code

.model small
.stack 100h
.code
main proc
   mov cx,255
   mov bx,0
   
   level:
   mov ah,02
   mov dl,bl
   int 21h
   inc bl

   loop level

   exit:
   mov ah,4ch
   int 21h
   main endp
end main