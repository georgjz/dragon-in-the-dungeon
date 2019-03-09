; Copyright (C) 2019 Georg Ziegler
;
; Permission is hereby granted, free of charge, to any person obtaining a copy of
; this software and associated documentation files (the "Software"), to deal in
; the Software without restriction, including without limitation the rights to
; use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
; of the Software, and to permit persons to whom the Software is furnished to do
; so, subject to the following conditions:
;
; The above copyright notice and this permission notice shall be included in
; all copies or substantial portions of the Software.
; -----------------------------------------------------------------------------
;   File: BIOS.s
;   Author(s): Georg Ziegler
;   Description: This file contains subroutines to handle input and output
;

;-------------------------------------------------------------------------------
;   Includes
;-------------------------------------------------------------------------------
.include "MemoryMap.inc"
.include "Registers.inc"
;-------------------------------------------------------------------------------

;-------------------------------------------------------------------------------
;   Assembler Directives
;-------------------------------------------------------------------------------
.pc02                           ; this file contains 65C02 code
;-------------------------------------------------------------------------------

;-------------------------------------------------------------------------------
;   Routines found in this file
;-------------------------------------------------------------------------------
.export     PrintString         ; print a string at a given address
.export     ReadChar            ; read a char from keyboard and store in I/O buffer
;-------------------------------------------------------------------------------

.segment "CODE"
;-------------------------------------------------------------------------------
;   Subroutine: PrintString
;   Parameters: .addr Pointer
;   Description: Prints the zero-terminated string starting at Pointer by
;   sending it to the ACIA byte by byte.
;-------------------------------------------------------------------------------
.proc   PrintString
        ; get string start address from stack
        tsx                     ; get current stack pointer
        inx                     ; increment by three to access arguments
        inx
        inx
        lda     $0100, X        ; get low byte of Pointer
        sta     A0L             ; store in address register 0 low
        inx                     ; increment counter
        lda     $0100, X        ; get high byte of Pointer
        sta     A0H             ; store in address register 0 high
        ; start output loop
        ldy     #$00            ; use Y as offset

Loop:   lda     IOSTATUS        ; check ACIA status
        and     #$10            ; is the TX register empty?
        beq     Loop            ; if not, wait and check again
        lda     (A0L), Y        ; else, load next char of string
        beq     Done            ; if it's zero, string is done
        sta     IOBASE          ; else, send it to ACIA
        iny                     ; increment string pointer
        bra     Loop            ; get next char

Done:
        rts                     ; return to caller
.endproc
;----- end of subroutine PrintString -------------------------------------------

;-------------------------------------------------------------------------------
;   IRQ Handler: ReadChar
;   Parameters: -
;   Description: Read a char from keyboard and stores it in the I/O Buffer. If
;   the char read is a CR, then the parser is invoked to parse the content of
;   the I/O buffer.
;-------------------------------------------------------------------------------
.proc   ReadChar
        ; sei                     ; disable interrupts
        ; lda     IOBASE          ; get char from ACIA
        ; ldx     IOBUFPTR        ; get current buffer offset
        ; sta     IOBUFFER, X     ; store new char in I/O buffer
        ; inx                     ; increment buffer offset
        ; cmp     CR              ; if the new char is CR...
        ; cmp     #$00            ; if the new char is CR...
        ; bne     Echo
            ; ...call parser
            ; stz IOBUFPTR        ; reset buffer offset
            ; lda ParserOpcode    ; call parser
            ; jsr SubroutineLauncher

        lda     IOBASE          ; get char from ACIA
Echo:   pha                     ; save new char on stack
Wait:   lda     IOSTATUS        ; check ACIA status
        and     #$10            ; is TX register empty?
        beq     Wait            ; if not, wait
        pla                     ; else, get new char
        sta     IOBASE          ; and send to output

        ; - get char from ACIA
        ; - get current buffer pointer
        ; - increment pointer
        ; - write new char to buffer
        ; - if new char is CR
        ; - reset buffer pointer
        ; - call parser
        ; - DONE

Done:   ;cli                     ; re-enable interrupts
        rti                     ; return after interrupt
.endproc
;----- end of subroutine ReadChar ----------------------------------------------
