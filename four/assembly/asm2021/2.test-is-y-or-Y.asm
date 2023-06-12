.model small
.stack 100h
.data
a db 'Enter single charecter',10,13,'$'
b db 10,13,'Display$'
.code
main proc
    mov ax,@data
    mov ds,ax 

    mov ah,09
    lea dx,a 
    int 21h

    mov ah,01
    int 21h
    mov bl,al

    cmp bl,'Y'
    je display 
    cmp bl,'y'
    jne exit

    display:
    mov ah,09
    lea dx,b
    int 21h

    mov ah,02
    mov dl,bl
    int 21h

    exit:
    mov ah,04ch
    int 21h
    main endp
end main    