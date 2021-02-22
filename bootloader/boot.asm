; Originate from the boot address
ORG 0x7c00

; Use 16-bit architecture
BITS 16

start:
    ; Write to the Video - Teletype Output
    mov ah, 0eh

    ; Set the character to be 'A'
    mov al, 'A'

    ; Set the page number and foreground color
    mov bx, 0

    ; Call the BIOS routine
    int 0x10

    ; Keep jumping to itself
    jmp $

; Fill at least 510 bytes of data
times 510- ($ - $$) db 0

; Boot signature at byte 511 and 512
; Intel is little endian, so reverse the byte
dw 0xAA55
