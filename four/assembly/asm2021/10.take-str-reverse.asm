.model small
.stack 100h
.data
msg db 'Enter a string: $'
result db 10,13,'Display reversed order: $'

print macro arg
   push ax
   push dx
   lea dx,arg

   mov ah,09
   int 21h
   pop dx
   pop ax
endm
.code 
main proc
   mov ax,@data
   mov ds,ax

   print msg

   mov cx,00
   mov dx,00

   read:
   mov ah,01h
   int 21h

   cmp al,0
   jz done

   mov dx,ax
   push dx
   inc dx
   jmp read

   done:
   print result

   write:
   pop dx
   mov ah,02h
   int 21h
   loop write
   
   exit:
   mov ah,4ch
   int 21h

   main endp
end main
