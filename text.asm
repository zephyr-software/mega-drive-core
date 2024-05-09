; ******************************************************************************
; yamaha ym7101 - text subroutines
;
; ******************************************************************************


; ==============================================================================
; DRAW_TEXT_SR - draw text subroutine
; draw text
; ------------------------------------------------------------------------------
; input params:
; A0 - string address
; D0 - x tile coord of the screen
; D1 - y tile coord of the screen
; D2 - palette
;
; output params: no
; ------------------------------------------------------------------------------
; call example:
; movem  A0-A6/D0-D7, -(SP)
; lea    TEST_STRING, A0
; move.l #0x0,        D0
; move.l #0x1,        D1
; move.l #0x2,        D2
; jsr DRAW_TEXT_SR
; movem  (SP)+,       A0-A6/D0-D7
; ==============================================================================
DRAW_TEXT_SR:
; --------------------------------------
; select palette
; --------------------------------------
    clr.l D4
DRAW_TEXT_SELECT_PAL:
    add.l #0x2000, D4
    dbra D2, DRAW_TEXT_SELECT_PAL
    sub.l #0x2000, D4

; --------------------------------------
; draw text
; --------------------------------------
    move.w #0x8F02, 0x00C00004 ;set vdp auto increment

    move.l #0x40000003, D3 ;vdp plane A [0xC000]

    mulu.w #0x20, D1 ;y offset in plane A
    add.w D0, D1     ;x offset

    sub.l #0x00020000, D3 ;sub x offset
DRAW_TEXT_CALC_OFFSET_X:
    add.l #0x00020000, D3 ;add x offset
    dbra D1, DRAW_TEXT_CALC_OFFSET_X

    move.l D3, 0x00C00004 ;draw to vdp plane A [0xC000]

DRAW_CHAR:
    clr D0
    move.b (A0)+, D0  ;move ASCII code
    cmp.b 0x0, D0
    beq.b DRAW_CHAR_END

    sub.w #0x20, D0   ;substract not exist symbols in ASCII map implementation
    lea ASCII_MAP, A1 ;load ASCII map addr
    adda.w D0, A1     ;set ASCII symbol inxed from table
    move.b (A1), D0
    add.w D4, D0

    move.w D0, 0x00C00000
    jmp DRAW_CHAR

DRAW_CHAR_END:
    move.w #0x8F00, 0x00C00004 ;disable vdp auto increment 

    rts


; ==============================================================================
; BYTE_TO_DEC_TEXT_SR - byte to decimal text subroutine
; convert byte to decimal text form
; ------------------------------------------------------------------------------
; input params:
; A0 - byte memory address
; A1 - text memory address
;
; output params: no
; ------------------------------------------------------------------------------
; call example:
; movem.l A0-A6/D0-D7, -(SP)
; lea byte_ram, A0
; lea byte_str_ram, A1
; jsr BYTE_TO_DEC_TEXT_SR
; movem.l (SP)+, A0-A6/D0-D7
; ==============================================================================
BYTE_TO_DEC_TEXT_SR:
    clr.l D0
    move.b (A0), D0               ; put byte from ram to d0

    lea RAM_BYTE_DEC_FLIP_STR, A2 ; load addres for reversed string

BYTE_TO_DEC_TEXT_NEXT_BYTE:
    cmp.b #0x0A, D0            ; compare d0 byte with 10
    blo.b BYTE_TO_DEC_TEXT_END ; branch to text conversion end if lower

    divu.w #0x0A, D0 ; div d0 to 10

    clr.l D1
    move.w D0, D1    ; copy result [bottom word] to d1
    swap D0          ; remainder located in top word, moved it to bottom

    lea ASCII_NUMBER_MAP, A3 ; digit to ascii map
    adda.w D0, A3            ; add ascii offset for char
    move.b (A3), D0          ; d0 contains required char
    move.b D0, (A2)+         ; move reminder to reversed string,
                             ; inc a2 pointer for the next char

    clr.l D0
    move.w D1, D0    ; copy result back to d0 to process next byte value

    jmp BYTE_TO_DEC_TEXT_NEXT_BYTE

BYTE_TO_DEC_TEXT_END:
    lea ASCII_NUMBER_MAP, A3 ; digit to ascii map
    adda.w D0, A3            ; add ascii offset for char
    move.b (A3), D0          ; d0 contains required char
    move.b D0, (A2)+         ; move reminder to reversed string,
                             ; inc a2 pointer for the next char
    move.b #0x00, (A2)       ; zero string byte

; --------------------------------------
; invert string
; --------------------------------------
    lea RAM_BYTE_DEC_FLIP_STR, A2   ; load addres for reversed string
    adda.w #0x0002, A2              ; end of dec byte string

    move.b (A2), D0                 ; moved value from ram to d0
    cmp.b #0x00, D0                 ; compare d0 byte with 0
    beq.b BYTE_TO_DEC_TEXT_LESS_100

    move.b (A2), (A1)+              ; moved byte to dec str if not 0

BYTE_TO_DEC_TEXT_LESS_100:
    sub.w #0x0001, A2               ; dec pointer to reversed string

    move.b(A2), D0                  ; moved value from ram to d0
    cmp.b #0x00, D0                 ; compare d0 byte with 0
    beq.b BYTE_TO_DEC_TEXT_LESS_10

    move.b (A2), (A1)+              ; moved next byte to dec str

BYTE_TO_DEC_TEXT_LESS_10:
    sub.w #0x0001, A2               ; dec pointer to reversed string

    move.b (A2), (A1)+              ; moved next byte to dec str

    move.b #0x00, (A1)              ; zero string byte

    rts


; ==============================================================================
; BYTE_DEC_TEXT_EXTEND_SR - extend byte decimal text subroutine
; extend byte decimal text form with 0 if < 10 [example: 1 = 01]
; ------------------------------------------------------------------------------
; input params:
; A0 - text memory address
;
; output params: no
; -----------------------------------------------------------------------------
; call example:
; movem.l A0-A6/D0-D7, -(SP)
; lea RAM_TEXT, A0
; jsr BYTE_TO_DEC_TEXT_SR
; movem.l (SP)+, A0-A6/D0-D7
; ==============================================================================
BYTE_DEC_TEXT_EXTEND_SR:
    clr.l D0                       ; clear for 0 char
    clr.l D1                       ; clear for 1 char

    move.b (A0)+, D0               ; moved char 0 to d0
    move.b (A0),  D1               ; moved char 1 to d1

    cmp.b #0x00, D1                ; compare d1 byte with 0
    bne.b BYTE_DEC_TEXT_EXTEND_END

    move.b D0, (A0)                ; copy 0 char to 1

    sub.w #0x0001, A0

    lea ASCII_NUMBER_MAP, A1       ; digit to ascii map
    move.b (A1), D0
    move.b D0, (A0)                ; moved char 0 as 1-st char

BYTE_DEC_TEXT_EXTEND_END:

    rts


; ==============================================================================
; NUM_TO_TEXT_SR - number to text subroutine
; convert number to text and store in ram
; ------------------------------------------------------------------------------
; input params:
; A0 - adress in ram to store number
; A1 - address in ram to store text
; ------------------------------------------------------------------------------
; call example:
; movem A0-A6/D0-D7, -(SP)
; lea RAM_NUMBER, A0
; lea RAM_TEXT, A1
; jsr NUM_TO_TEXT_SR
; movem (SP)+, A0-A6/D0-D7
; ==============================================================================
NUM_TO_TEXT_SR:
    clr.l D0
    move.b #0x03, D0         ; bytes to convert

BYTE_TO_TEXT:
    clr.l D1
    move.b (A0), D1          ; put number byte from ram to d1

    ror.b #0x4, D1
    andi.b #%00001111, D1
    lea ASCII_NUMBER_MAP, A2 ; digit to ascii map
    adda.w D1, A2
    move.b (A2), D1
    move.b D1, (A1)+

    clr.l D1
    move.b (A0)+, D1

    andi.b #%00001111, D1
    lea ASCII_NUMBER_MAP, A2 ;digit to ascii map
    adda.w D1, A2
    move.b (A2), D1
    move.b D1, (A1)+

    dbra D0, BYTE_TO_TEXT

    move.b #0x0, (A1)

    rts
