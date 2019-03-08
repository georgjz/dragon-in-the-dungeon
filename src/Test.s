.include "BIOS.inc"

.export ResetHandler
.export IRQHandler
.export NMIHandler

; Freaking 6502 system test
IOACIA      := $8800
IOSTATUS    := $8801
IOCMD       := $8802
IOCTRL      := $8803

.segment "CODE"

.proc   ResetHandler
        cli
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
.endproc

String:
.byte   "Hello, 6502 World! ", $00

.proc   NMIHandler
        ; empty
        rti
.endproc


.proc   IRQHandler
        ; enpty
        rti
.endproc
;
; .segment "VECTOR"
; .addr   IRQHandler, NMIHandler, Start
