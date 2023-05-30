.model small
print macro msg
   mov ah,09
   lea dx,msg
   int 21h
endm
newline macro
   mov ah,2
   mov dl,10
   int 21h
   mov dl,13
   int 21h
endm
.stack 100h
.data
msg1 db 'Hello World!$'
.code
main proc
     mov ax,@data
     mov ds,ax

     mov cx,10

     level:
     print msg1
     newline
     loop level

     exit:
     mov ah,4ch
     int 21h
     main endp
end main
