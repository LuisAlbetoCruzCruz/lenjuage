
.model small 
.stack 64h 
.data 
cadena1 db 100 dup(' '),'$' 
msj1 db 13,10,'Numero de Vocales: $' 
msj2 db 'hola :)',13,10,'Digite alguna palabra: $' 
msj3 db 13,10,'Numero de Consonantes: $' 

.code 
inicio: 
mov AX , @data 
mov DS , AX 

mov ah,09 
mov dx,offset msj2 
int 21h 

mov bx,0000h 
lea SI,cadena1 
mov cx,50 
regresa: mov ah,07h 
int 21h 

cmp al,13 
je termina 

mov [SI],al 
inc SI 
inc bx 

mov dl,al 
mov ah,02h 
int 21h 
loop regresa 


termina: 
mov dl,13; 
mov ah,02 
int 21h 

mov dl,10; 
mov ah,02 
int 21h 


lea SI,cadena1 
mov cl,0h 
mov bl,0h 
;CICLO para contar las vocales
ciclo: 

mov al,[SI] 
cmp al,'$' 
JE finciclo 
cmp al,61h 
je cuenta 
cmp al,65h 
je cuenta 
cmp al,69h 
je cuenta 
cmp al,6Fh 
je cuenta 
cmp al,75h 
je cuenta 

continua: 

inc si 
jmp ciclo 
finciclo: 

mov ah,09 ; Escribir cadena 
mov dx,offset msj1 
int 21h 


MOV Dl, cl 
add dl,30h 
MOV AH,02H 
INT 21H 





mov ax,4c00h ; servicio para terminar programa de la Int 21H 
int 21h 
cuenta proc near 
inc cl 
jmp continua 
cuenta endp 

end inicio 





