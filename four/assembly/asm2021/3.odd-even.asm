# Display odd or even if number is

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
.Code
main proc
   mov ax,@data
   mov ds,ax
   
   print a 

   mov ah,01
   int 21h
   mov n,al

   mov ax,n 
   div 2
   cmp al,0
   je level

   print od

   level:
   print ev

   exit:
   mov ah,4ch
   int 21h

   main endp
end main
