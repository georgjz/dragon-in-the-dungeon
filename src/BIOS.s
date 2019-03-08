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
; .include "SNESRegisters.inc"
; .include "NekoMacros.inc"
; .include "WRAMPointers.inc"
;-------------------------------------------------------------------------------

;-------------------------------------------------------------------------------
;   Assembler Directives
;-------------------------------------------------------------------------------
.pc02                           ; this file contains 65C02 code
;-------------------------------------------------------------------------------

;-------------------------------------------------------------------------------
;   Routines found in this file
;-------------------------------------------------------------------------------
.export     PrintString         ; Print a string at a given address
;-------------------------------------------------------------------------------

.segment "CODE"
;-------------------------------------------------------------------------------
;   Subroutine: PrintString
;   Parameters: .addr Pointer
;   Description: Prints the zero-terminated string starting at Pointer by
;   sending it to the ACIA byte by byte.
;-------------------------------------------------------------------------------
.proc   PrintString

        ; code

        rts
.endproc
;----- end of subroutine PrintString -------------------------------------------
