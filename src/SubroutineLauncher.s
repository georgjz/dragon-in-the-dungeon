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
;   File: SubroutineLauncher.s
;   Author(s): Georg Ziegler
;   Description: This file contains the subroutine launcher for accessing all
;   subroutines in this code.
;

;-------------------------------------------------------------------------------
;   Includes
;-------------------------------------------------------------------------------
.include "Registers.inc"
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
.export     SubroutineLauncher  ; Print a string at a given address
;-------------------------------------------------------------------------------

.segment "CODE"
;-------------------------------------------------------------------------------
;   Subroutine: SubroutineLauncher
;   Parameters: .byte SubroutineOpcode (passed in A)
;   Description: Launches the subroutine associated with the passed opcode
;-------------------------------------------------------------------------------
.proc   SubroutineLauncher
        tax                     ; transfer opcode to X
        lda     RTSTableL, X    ; get low subroutine address...
        sta     A0L             ; ...store in address register 0
        lda     RTSTableH, X    ; get high subroutine address...
        sta     A0H             ; ...store in address register 0
        jmp     (A0L)           ; call subroutine
        ; the called subroutine will return to this subroutine's caller
.endproc
;----- end of subroutine SubroutineLauncher ------------------------------------
