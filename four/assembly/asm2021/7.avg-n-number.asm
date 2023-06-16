.model small
print macro msg
   mov ah, 09h
   lea dx, msg
   int 21h
endm

.stack 100h
.data
msg2 db 'Enter elements of 4 numbers: $' 
msg3 db 'Average is : $'
n dd 4
sum db 0
avg db 0

.code 
main proc
   mov ax, @data
   mov ds, ax

   mov cx, n
   
   print msg2

   mov bl, 0  

   level:
   mov ah, 01h
   int 21h
   sub al, 48
   add bl, al
   loop level
   
   mov al,bl
   mov ah,0
   div n
   mov bl,al
   
   print msg3

   mov ah,02
   add bl,48
   mov dl,bl
   int 21h
   exit:
   mov ah, 4Ch
   int 21h
   
   main endp
end main
