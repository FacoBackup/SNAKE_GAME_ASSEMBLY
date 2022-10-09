org 0

mov dl, 1 ; SPEED

BEGINNING:
in 0

; MOVEMENT
cmp al, 61
jz LEFT

cmp al, 64
jz RIGHT

cmp al, 77
jz UP

cmp al, 73
jz DOWN
; MOVEMENT


; TOOLS
cmp al, 72
jz RESET

cmp al, D
jz FINISH

; TOOLS


; SPEED
cmp al, 2B
jz INCREASE_SPEED
cmp al, 3D
jz INCREASE_SPEED

cmp al, 2D
jz DECREASE_SPEED
; SPEED

jmp BEGINNING ; GO BACK IF INVALID KEY


; SPEED:
INCREASE_SPEED:
    cmp dl, 8 ; IF MAX VALUE DO NOTHING
    jz BEGINNING
    cmp dl, 1
    jz ADD_ONE
    jmp DOUBLE
    DOUBLE:
    mul dl, 2
    jmp BEGINNING
    ADD_ONE:
    add dl, 1
    jmp BEGINNING

DECREASE_SPEED:
    cmp dl, 1 ; IF MIN VALUE DO NOTHING
    jz BEGINNING
    div dl, 2 ; HALF VALUE
    jmp BEGINNING
; SPEED:

; MOVEMENT
LEFT:
    mov al, 20
    add al, dl ; ADD MOVEMENT SPEED TO DIRECTION
    out 4
    jmp BEGINNING

DOWN:
    mov al, 40
    add al, dl ; ADD MOVEMENT SPEED TO DIRECTION
    out 4
    jmp BEGINNING

UP:
    mov al, 80
    add al, dl ; ADD MOVEMENT SPEED TO DIRECTION
    out 4
    jmp BEGINNING

RIGHT:
    mov al, 10
    add al, dl ; ADD MOVEMENT SPEED TO DIRECTION
    out 4
    jmp BEGINNING
; MOVEMENT

; TOOLS
RESET:
    mov al, FF
    out 4
    jmp BEGINNING

FINISH:
    end
; TOOLS
