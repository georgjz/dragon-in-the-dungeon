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
;   File: ParserStates.inc
;   Author(s): Georg Ziegler
;   Description: This file contains the states for the parser finite state machine
;

; Header guard
.ifndef PARSERSTATES_INC
PARSERSTATES_INC = 1

;-------------------------------------------------------------------------------
;   Parser States: All states the parser FSM can take on. States are prefixed
;   with 'S_' to differentiate them from transitions (prefixed with 'T_')
;-------------------------------------------------------------------------------
    S_START_PARSER  = $00       ; the parser has been invoked
    S_VALID_M       = $01       ; the next char in the I/O buffer is 'M'
    S_DIRECTION     = $02       ; the parser now looks for a valid direction
    S_VALID_N       = $03       ; the next char in the I/O buffer is 'N'
    S_VALID_E       = $04       ; the next char in the I/O buffer is 'E'
    S_VALID_S       = $05       ; the next char in the I/O buffer is 'S'
    S_VALID_W       = $06       ; the next char in the I/O buffer is 'W'
    S_MOVE_N        = $07       ; input string was valid, move North
    S_MOVE_E        = $08       ; input string was valid, move East
    S_MOVE_S        = $09       ; input string was valid, move South
    S_MOVE_W        = $0a       ; input string was valid, move West

    S_INVALID       = $ff       ; the (next) state is invalid
;-------------------------------------------------------------------------------

.endif  ; PARSERSTATES_INC
