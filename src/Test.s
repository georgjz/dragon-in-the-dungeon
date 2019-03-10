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
;   File: Test.s
;   Author(s): Georg Ziegler
;   Description: This file is a place holder for the game main file to test
;   subroutines.
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
.export ResetHandler
.export NMIHandler
;-------------------------------------------------------------------------------


.segment "CODE"
;-------------------------------------------------------------------------------
;   Subroutine: ResetHandler
;   Parameters: -
;   Description: The game starts here after a reset
;-------------------------------------------------------------------------------
.proc   ResetHandler
        cli
        lda     #$09
        sta     IOCMD           ; set command status
        lda     #$1a
        sta     IOCTRL          ; 0 stop bits, 8 bit word, 2400 baud

MainLoop:
        wai
        bra     MainLoop
.endproc
;----- end of ResetHandler -----------------------------------------------------

;-------------------------------------------------------------------------------
;   Subroutine: ResetHandler
;   Parameters: -
;   Description: This interrupt handler is called during an NMI
;-------------------------------------------------------------------------------
.proc   NMIHandler
        ; empty
        rti
.endproc
;----- end of NMIHandler -------------------------------------------------------

Title:
.byte   "    / \      / \", $0d, $0a
.byte   "    | |/----\| |", $0d, $0a
.byte   "    \__------__/", $0d, $0a
.byte   "     / O    O \ ", $0d, $0a
.byte   "     /   ||   \ ", $0d, $0a
.byte   "     / ------ \ ", $0d, $0a
.byte   "     /\/\/\/\/\ ", $00
