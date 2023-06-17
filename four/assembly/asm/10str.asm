.model small
.stack 100h
.code
main proc
    mov cx,0
    mov ah,1
    int 21h
    
    scan:
    cmp al,0dh
    je newline
    push ax
    inc cx
    int 21h
    jmp scan
    
    newline:
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    jcxz exit
    
    display:
    pop dx
    int 21h
    loop display
    

    exit:
    mov ah, 4Ch
    int 21h
main endp

end main
