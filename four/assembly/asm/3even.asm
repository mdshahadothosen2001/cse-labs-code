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
m db 2

.code
main proc
   mov ax,@data
   mov ds,ax

   print a

   mov ah,01
   int 21h
   sub al,48
   mov n,al

   mov al, n   
   mov ah, 0   

   div m        

   cmp ah, 0    
   jne odd      

   print od    
   jmp exit

odd:
   print ev 

exit:
   mov ah,4ch
   int 21h

main endp
end main
