.model small
.stack 100h
.data
  msj db 0ah,0dh, 'hola mundo','$'
        
.code

inicio:
mov ax,@data
mov ds,ax
mov ah,09h
mov dx,offset msj
int 21h
    
    
salir:
mov ah,04ch
int 21h
    
end 