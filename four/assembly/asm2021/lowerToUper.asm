.model small
print macro msg
   mov ah,09
   lea dx,msg
   int 21h
endm
.stack 100h
.data
a db 'Enter Lower Case',10,13,'$'
b db 10,13,'Display Upper Case$'
.code
main proc
   mov ax,@data
   mov ds,ax

   print a

   mov ah,01
   int 21h
   mov bl,al

   print b 

   sub bl,32
   mov dl,bl
   mov ah,02
   int 21h

   exit:
   mov ah,4ch
   int 21h
   main endp
end main