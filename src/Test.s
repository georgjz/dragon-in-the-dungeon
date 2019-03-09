; .include "BIOS.inc"
.include "MemoryMap.inc"
.include "Registers.inc"
.include "SubroutineLauncher.inc"
.include "SubroutineOpcodes.inc"

.export ResetHandler
.export IRQHandler
.export NMIHandler


.segment "CODE"
.proc   ResetHandler
        cli
        ; lda     #$0b
        lda     #$09
        sta     IOCMD           ; set command status
        lda     #$1a
        sta     IOCTRL          ; 0 stop bits, 8 bit word, 2400 baud

MainLoop:
        wai
        bra     MainLoop
.endproc

String:
.byte   "Hello, 6502 World! ", $00

.proc   NMIHandler
        ; empty
        rti
.endproc


.proc   IRQHandler
        ; empty
        rti
.endproc
;
; .segment "VECTOR"
; .addr   IRQHandler, NMIHandler, Start
