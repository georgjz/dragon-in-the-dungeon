.include "BIOS.inc"
.include "Registers.inc"

.export ResetHandler
.export IRQHandler
.export NMIHandler


.segment "CODE"
.proc   ResetHandler
        cli
        lda     #$0b
        sta     IOCMD           ; set command status
        lda     #$1a
        sta     IOCTRL          ; 0 stop bits, 8 bit word, 2400 baud

Loop:
        ; push string address to stack
        lda     #>String        ; get low address
        pha
        lda     #<String        ; get high a
        pha
        ; call subroutine
        jsr     PrintString
        ; clean up stack
        pla
        pla
        ; loop forever
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
