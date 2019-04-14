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
;   File: Parser.s
;   Author(s): Georg Ziegler
;   Description: This file contains subroutines to parse input commands
;

;-------------------------------------------------------------------------------
;   Includes
;-------------------------------------------------------------------------------
.include "MemoryMap.inc"
.include "Registers.inc"
.include "ParserStates.inc"
.include "StateTransitions.inc"
.include "SubroutineLauncher.inc"
.include "SubroutineOpcodes.inc"
;-------------------------------------------------------------------------------

;-------------------------------------------------------------------------------
;   Assembler Directives
;-------------------------------------------------------------------------------
.pc02                           ; this file contains 65C02 code
;-------------------------------------------------------------------------------

;-------------------------------------------------------------------------------
;   Routines found in this file
;-------------------------------------------------------------------------------
.export     Parser              ; parse the string found in the I/O buffer
.export     GetNextState        ; returns the next state according to input and current state
;-------------------------------------------------------------------------------


.segment "CODE"
;-------------------------------------------------------------------------------
;   Subroutine: Parser
;   Parameters: -
;   Description: Parse the string found in the I/O buffer and update game state
;   accordingly.
;-------------------------------------------------------------------------------
.proc   Parser
;         ; use local symbols as register aliases; these registers hold local variables
;         CurrentState = R00      ; the current state of the parser
;         NextState    = R01      ; the next state of the parser
;         ; fetch data before main loop
;         ldx     IOBUFPTR        ; load I/O buffer into X (should be zero)
;         lda     #S_START_PARSER ; set parser state to S_START_PARSER
;         sta     CurrentState
;
; Loop:   lda     IOBUFFER, X     ; get next char in string
;         pha                     ; push input byte to stack
;         lda     CurrentState    ; load current state..
;         pha                     ; ...and push to stack
;         jsr     GetNextState    ; get the next state
;
        ; set current state to S_START_PARSER
        ; loop
            ; load next char
            ; look up next state
            ; if invalid
                ; clear I/O buffer (aka, reset buffer offset to zero)
                ; print error message
                ; done
            ; else if \0
                ; execute command
                ; done
            ; inc offset
            ; next


        ; PLACEHOLDER CODE: Print string to verify this subroutine has been called
        lda     #>TestString
        pha
        lda     #<TestString
        pha
        lda     #PrintStringOpcode
        jsr     SubroutineLauncher
        pla
        pla

Done:
        rts                     ; return to caller
.endproc
;----- end of subroutine Parser ------------------------------------------------

;-------------------------------------------------------------------------------
;   Subroutine: GetNextState
;   Parameters: Input: .byte, CurrenState: .byte
;   Description: Reads the next state from the State Transition Table
;-------------------------------------------------------------------------------
.proc   GetNextState
        ; code
Done:
        rts                     ; return to caller
.endproc
;----- end of subroutine GetNextState ------------------------------------------


; test data
TestString:
.byte   $0d, $0a, "Parser invoked.", $0d, $0a, $00
