; Originate from the boot address
ORG 0x7c00

; Use 16-bit architecture
BITS 16

start:
    ; Move the address of 'message' to si
    mov si, message

    ; call the print subroutine
    call print

    ; Keep jumping to itself
    jmp $

print:
    ; Clear the page and foreground
    mov bx, 0

.loop:
    ; Load the character the 'si' register is pointing to 'al' register
    ; And increment the si register
    lodsb

    ; Compare the value of 'al'
    cmp al, 0

    ; If zero, then jump to '.done'
    je .done

    ; If 'al' not zero
    call print_char

    ; Run the loop
    jmp .loop

.done:
    ret

print_char: 
    ; Write to the Video - Teletype Output
    mov ah, 0eh

    ; Call the BIOS routine
    int 0x10

    ; Return
    ret

; Create a message
message: db 'Hello World!', 0

; Fill at least 510 bytes of data
times 510- ($ - $$) db 0

; Boot signature at byte 511 and 512
; Intel is little endian, so reverse the byte
dw 0xAA55
