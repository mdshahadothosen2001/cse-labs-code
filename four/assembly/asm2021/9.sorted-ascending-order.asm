.model small
.stack 100h
.data
array db 9, 5, 7, 2, 1   
length equ ($ - array)  

.code 
main proc
   mov ax, @data
   mov ds, ax

   mov cx, length      
   dec cx              

   outer_loop:
   mov bx, 0           

   inner_loop:
   mov si, bx          
   inc si              

   mov al, [array+bx]  
   cmp al, [array+si]  

   jbe skip_swap       

   ; Swap the elements
   mov dl, [array+si]  
   mov [array+si], al  
   mov [array+bx], dl  

   skip_swap:
   inc bx              
   cmp bx, cx          
   jl inner_loop       

   loop outer_loop     

   
   mov cx, length      
   mov bx, 0           

   display_loop:
   mov dl, [array+bx]  
   add dl, '0'         

   mov ah, 02h         
   int 21h

   inc bx             
   loop display_loop   

   exit_program:
