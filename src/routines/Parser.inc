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
;   File: Parser.inc
;   Author(s): Georg Ziegler
;   Description: This a header file for Parser.s, include this us the subroutines
;   defined therein.
;

; Header guard
.ifndef PARSER_INC
PARSER_INC = 1

;-------------------------------------------------------------------------------
;   Routines found in this file
;-------------------------------------------------------------------------------
.import     Parser              ; parse the string found in the I/O buffer
;-------------------------------------------------------------------------------

.endif  ; PARSER_INC
