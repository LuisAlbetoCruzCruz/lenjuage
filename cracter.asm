.model small                                                        
.stack 100h
.data
car    DB 0
pox    DB 0
poy    DB 0
xa     DB 0
ya     DB 0
aviso DB 'Escriba un caracter y muevalo con las flechas: ','$' 
msg  DB '#$'
.code
   mov ax,@data
   mov ds,ax
   mov  ax,02h      ;
   mov  bx,00h
   mov  cx,5      ;fil
   mov  dx,5      ;col
   int  10h
   mov  ah,9
   mov  dx,OFFSET aviso
   int  21h
   mov  ah,01h
   int  21h
   mov  car,al
   mov  ah,03h
   mov  bh,01h
   int  10h
   mov  pox,ch
   mov  poy,dh
   dec  pox
   mov  ah,05h   ; borrar pantalla
   mov  al,01h
   int  10h
bucle:
   mov  ah,02h; ubicarse en la posicion anterior
   mov  bh,01h
   mov  dh,ya
   mov  dl,xa
   int  10h
   mov  ah,02h ; borrar el caracter
   mov  dl,32 ;
   int  21h
   mov  ah,02h; ubicar el cursor
   mov  bh,01h
   mov  dh,poy
   mov  dl,pox
   int  10h
   mov  ah,02h ; imprimir el caracter
   mov  dl,car
   int  21h
   mov  ah,02h ; colocar el cursor en su posicion anterior
   mov  bh,01h
   mov  dh,poy
   mov  dl,pox
   int  10h
   mov  xa,dl
   mov  ya,dh
   mov  ah,00h
   int  16h   ; interrup de teclado
   cmp  ah,75
   jnz  noleft
   
   cmp pox, 1
   je bucle
   
   dec  pox
   jmp  bucle
   
noleft:
   cmp  ah,72
   jnz  nodown
   
   cmp poy, 0
   je bucle
   
   dec  poy
   jmp  bucle
nodown:
   cmp  ah,77
   jnz  noright
   
   cmp pox, 70
   je bucle
  
   
   inc  pox
   jmp  bucle
noright:
   cmp  ah,80
   jnz  noup  
   
   cmp poy, 23 
   je bucle
   
   inc  poy
   jmp  bucle
noup:
   cmp  al,27
   jz   fin
   jmp  bucle
     
fin:
   mov ax,4ch
   mov bx,00h    ;fondo blanco(7), sobre azul(1)
   mov cx,0000h  ;es la esquina superior izquierda reglon: columna
   mov dx,184Fh ;es la esquina inferior derecha reglon: columna
       int 10h 
   int  21h
END