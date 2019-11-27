.MODEL SMALL 
.stack 100h 
.CODE 
Programa: 
mov ax,@DATA 
mov ds,ax 

; Imprimimos el mensaje 
mov dx, offset Mensaje 
mov ah, 9h 
int 21h 

; Leemos el primer digito, lo multiplicamos por 10 y lo 
; guardamos en la pila 
mov ah, 01h 
int 21h 
mov ah, 0 
sub al, 48 
mov cx, 10 
mul cx 
push ax 

; Leemos el segundo digito 
mov ah, 01h 
int 21h 
mov ah, 0 
sub al, 48 

; Sumamos al segundo digito el valor guardado en la pila 
pop cx 
add cx, ax 

mov dx, offset Finlinea 
mov ah, 9h 
int 21h 

mov bx,0 

mover: 
push cx 
inc bx 
mov cx,bx 

; Imprimimos el mensaje el numero de veces solicitdado 
mov dx, offset Texto 
 
ciclo: 
int 21h 
dec cx 
jnz ciclo 

pop cx 
push bx 
mov bx,cx 

mov dx,offset Relleno 
mov ah,9h 
ciclo2: 
int 21h 
dec bx 
jnz ciclo2 
pop bx 
push cx 

mov dx, offset Finlinea 
mov ah, 9h 
int 21h 
pop cx 
dec cx 
jnz mover 

mov ax,4C00h 
int 21h 
.DATA 
Texto DB '#$' 
Mensaje DB 'Teclee el numero de veces ',0dh,0ah,'$' 
Finlinea DB 0dh,0ah,'$' 
Relleno DB '$' 
.STACK 
END Programa