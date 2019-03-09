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
;   File: SubroutineOpcodes.inc
;   Author(s): Georg Ziegler
;   Description: Include allows access to and holds the subroutine opcodes
;

; Header guard
.ifndef SUBROUTINEOPCODES_INC
SUBROUTINEOPCODES_INC = 1

;-------------------------------------------------------------------------------
;   Addresses of the return tables
;-------------------------------------------------------------------------------
.import     RTSTableL           ; low bytes of the return addresses
.import     RTSTableH           ; high bytes of the return addresses
;-------------------------------------------------------------------------------

;-------------------------------------------------------------------------------
;   Opcodes for each subroutine
;-------------------------------------------------------------------------------
    ; BIOS.inc
    PrintStringOpcode       := $00
    ; Parser.inc
    ParserOpcode            := $01
;-------------------------------------------------------------------------------

.endif  ; SUBROUTINEOPCODES_INC
