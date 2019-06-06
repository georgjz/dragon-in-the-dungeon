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
;   File: StateTransitions.inc
;   Author(s): Georg Ziegler
;   Description: This file contains the state transitions for the parser
;   finite state machine.
;

; Header guard
.ifndef STATETRANSITIONS_INC
STATETRANSITIONS_INC = 1

;-------------------------------------------------------------------------------
;   Parser States: All state transitions the parser finite state machine can
;   run through. All state transitions are prefixed with 'T_' to differentiate
;   them from states (prefixed with 'S_').
;-------------------------------------------------------------------------------
    ; T_VAL_M         = $00       ; the next char in the I/O buffer is 'M'
    ; T_SPACE         = $01       ; the next char in the I/O buffer is ' '
    ; T_VAL_N         = $02       ; the next char in the I/O buffer is 'N'
    ; T_VAL_E         = $03       ; the next char in the I/O buffer is 'E'
    ; T_VAL_S         = $04       ; the next char in the I/O buffer is 'S'
    ; T_VAL_W         = $05       ; the next char in the I/O buffer is 'W'
    ; T_EOS           = $06       ; the string in the I/O buffer is done
;-------------------------------------------------------------------------------

.endif  ; STATETRANSITIONS_INC
