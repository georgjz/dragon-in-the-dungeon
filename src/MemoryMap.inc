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
;   File: MemoryMap.inc
;   Author(s): Georg Ziegler
;   Description: This a header file defines all memory addresses for the storage
;   of all the data this game uses.
;

; Header guard
.ifndef MEMORYMAP_INC
MEMORYMAP_INC = 1

;-------------------------------------------------------------------------------
;   Game Constants: Constants to control the games parameters.
;-------------------------------------------------------------------------------
    DUNGEONSIZE     = $0a       ; number of chambers in one direction
    BATS            = $04       ; number of bats in the dungeon
    PITS            = $0c       ; number of pits in the dungeon
    BUFFERSIZE      = $50       ; buff
;-------------------------------------------------------------------------------

;-------------------------------------------------------------------------------
;   Game Data: This symbols represent the addresses of the game data. Game Data
;   is stored starting from $0300 upwards. Adjust this for your system
;   accordingly.
;-------------------------------------------------------------------------------
    RAMSTART    := $0300        ; starting address of RAM after stack and zero page
    ; don't edit unless you know what you're doing (:
    DUNGEON     := RAMSTART     ; pointer to dungeon
    WARRIORPOS  := RAMSTART + DUNGEONSIZE*DUNGEONSIZE   ; hold the current position of the Warrior
    IOBUFPTR    := WARRIORPOS + $01 ; I/O buffer offset
    IOBUFFER    := IOBUFPTR + $01   ; I/O buffer for the BIOS routines
;-------------------------------------------------------------------------------

;-------------------------------------------------------------------------------
;   ACIA: This symbols represent the registers of a 6551 ACIA that handles
;   the system's input and output.
;       This code assumes the 6551 ACIA is connected to the address bus such
;   that the ACIA registers are accessed in the indicated sequence. Adjust for
;   your target system accordingly.
;-------------------------------------------------------------------------------
    IOBASE      := $8800
    IOSTATUS    := $8801
    IOCMD       := $8802
    IOCTRL      := $8803
;-------------------------------------------------------------------------------

.endif  ; MEMORYMAP_INC
