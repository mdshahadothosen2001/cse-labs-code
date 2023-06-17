.model small
.stack 100h
.data
msg db 'display largest element$'
array db 5,3,9,4,5
largest db ?
.code
main proc
   mov ax,@data
   mov ds,ax

   mov ah,09
   lea dx,msg
   int 21h

   mov cx,5
   mov al,[di]
   mov largest,al

   test:
   inc di
   mov bl,[di]

   cmp largest,bl
   jge level

   mov largest,bl

   level:
   sub largest,48


   mov dl,largest
   mov ah,02
   int 21h

   exit:
   mov ah,4ch
   int 21h
   main endp
end main