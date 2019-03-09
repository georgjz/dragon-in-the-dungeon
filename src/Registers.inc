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
;   File: Registers.inc
;   Author(s): Georg Ziegler
;   Description: This a header file defines aliases for registers.
;

; Header guard
.ifndef REGISTERS_INC
REGISTERS_INC = 1

;-------------------------------------------------------------------------------
;   Zero Page Registers: This code allows to use the zero page as a 256 byte
;   scratch pad. There are two kinds of symbols here: Rxx designates a single
;   byte registers. AxL and AxH are two consecutive bytes in zero page. They're
;   meant to improve readability and as a convenient way to use with
;   Zero Page Indirect Indexed addressing for using pointers to access data.
;       The lower half of zero page is used for data registers, the higher half
;   for address registers.
;       Not all zero page memory locations are mapped here. Extend as needed.
;-------------------------------------------------------------------------------
; Data Registers $00 ~ $7f
    R00     := $00
    R01     := $01
    R02     := $02
    R03     := $03
    R04     := $04
    R05     := $05
    R06     := $06
    R07     := $07
    R08     := $08
    R09     := $09
    R0A     := $0A
    R0B     := $0B
    R0C     := $0C
    R0D     := $0D
    R0E     := $0E
    R0F     := $0F
; ...further Data Registers as needed...

; Address Registers $80 ~ $ff
    A0L     := $80
    A0H     := $81
    A1L     := $82
    A1H     := $83
    A2L     := $84
    A2H     := $85
    A3L     := $86
    A3H     := $87
    A4L     := $88
    A4H     := $89
    A5L     := $8a
    A5H     := $8b
    A6L     := $8c
    A6H     := $8d
    A7L     := $8e
    A7H     := $8f
    A8L     := $90
    A8H     := $91
    A9L     := $92
    A9H     := $93
    AAL     := $94
    AAH     := $95
    ABL     := $96
    ABH     := $97
    ACL     := $98
    ACH     := $99
    ADL     := $9a
    ADH     := $9b
    AEL     := $9c
    AEH     := $9d
    AFL     := $9e
    AFH     := $9f
; ...further Address Registers as needed...
;-------------------------------------------------------------------------------

.endif  ; REGISTERS_INC
