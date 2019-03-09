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
;   File: SubroutineOpcodes.s
;   Author(s): Georg Ziegler
;   Description: This file contains the subroutine opcodes for the subroutine
;   launcher found in SubroutineLauncher.s
;

;-------------------------------------------------------------------------------
;   Includes
;-------------------------------------------------------------------------------
.include "BIOS.inc"
.include "Parser.inc"
;-------------------------------------------------------------------------------

;-------------------------------------------------------------------------------
;   Addresses of the return tables
;-------------------------------------------------------------------------------
.export     RTSTableL           ; low bytes of the return addresses
.export     RTSTableH           ; high bytes of the return addresses
;-------------------------------------------------------------------------------

.segment "CODE"
;-------------------------------------------------------------------------------
;   Subroutine Return Table: These are the return addresses of all subroutines
;   the subroutine launcher can call. The tables are split into a low and high
;   byte table for more effective code.
;-------------------------------------------------------------------------------
RTSTableL:
    ; BIOS.s
.byte   <PrintString            ; opcode $00
    ; Parser.s
.byte   <Parser                 ; opcode $01

RTSTableH:
    ; BIOS.s
.byte   >PrintString            ; opcode $00
    ; Parser.s
.byte   >Parser                 ; opcode $01
;-------------------------------------------------------------------------------
