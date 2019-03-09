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
;   File: Vector.s
;   Author(s): Georg Ziegler
;   Description: This file includes the addresses of the interrupt and reset
;   handlers.
;

;-------------------------------------------------------------------------------
;   Includes
;-------------------------------------------------------------------------------
.include "BIOS.inc"
;-------------------------------------------------------------------------------

;-------------------------------------------------------------------------------
;   Imported routines
;-------------------------------------------------------------------------------
.import     ResetHandler
.import     NMIHandler
;-------------------------------------------------------------------------------

;-------------------------------------------------------------------------------
;   segment VECTOR: contains the interrupt and reset handlers
;-------------------------------------------------------------------------------
.segment "VECTOR"
.addr   NMIHandler              ; called on non-maskable interrupt
.addr   ResetHandler            ; called on reset
.addr   ReadChar                ; called on interrupt request
;-------------------------------------------------------------------------------
