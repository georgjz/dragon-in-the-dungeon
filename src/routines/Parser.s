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
;-------------------------------------------------------------------------------

.segment "CODE"
;-------------------------------------------------------------------------------
;   Subroutine: Parser
;   Parameters: -
;   Description: Parse the string found in the I/O buffer and update game state
;   accordingly.
;-------------------------------------------------------------------------------
.proc   Parser
        ; PLACEHOLDER CODE: Print string to verify this has been called
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

; test data
TestString:
.byte   $0d, $0a, "Parser invoked.", $0d, $0a, $00
