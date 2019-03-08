.include "BIOS.inc"

; Freaking 6502 system test
IOACIA      := $8800
IOSTATUS    := $8801
IOCMD       := $8802
IOCTRL      := $8803

.segment "CODE"

Start:  cli
        lda     #$0b
        sta     IOCMD
        lda     #$1a
        sta     IOCTRL

Init:   ldx     #$00

Loop:   lda     IOSTATUS
        and     #$10
        beq     Loop
        lda     String, X
        beq     Init
        sta     IOACIA

        inx
        bra     Loop

String:
.byte   "Hello, 6502 World!", $0d, $00
