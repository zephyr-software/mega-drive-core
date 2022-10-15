; ****************************************************************************** 
; font [A-Z 0-9] 36 symbols
; ******************************************************************************


ASCII_MAP:
    dc.b 0x00   ; SPACE [ASCII 0x20]
    dc.b 0x28   ; UNUSED
    dc.b 0x2B   ; UNUSED
    dc.b 0x2E   ; UNUSED
    dc.b 0x00   ; UNUSED
    dc.b 0x00   ; UNUSED
    dc.b 0x00   ; UNUSED
    dc.b 0x2C   ; UNUSED
    dc.b 0x29   ; UNUSED
    dc.b 0x2A   ; UNUSED
    dc.b 0x00   ; UNUSED
    dc.b 0x2F   ; UNUSED
    dc.b 0x26   ; UNUSED
    dc.b 0x30   ; UNUSED
    dc.b 0x25   ; UNUSED
    dc.b 0x31   ; UNUSED
    dc.b 0x1B   ; 0
    dc.b 0x1C   ; 1
    dc.b 0x1D   ; 2
    dc.b 0x1E   ; 3
    dc.b 0x1F   ; 4
    dc.b 0x20   ; 5
    dc.b 0x21   ; 6
    dc.b 0x22   ; 7
    dc.b 0x23   ; 8
    dc.b 0x24   ; 9
    dc.b 0x2D   ; UNUSED
    dc.b 0x00   ; UNUSED
    dc.b 0x00   ; UNUSED
    dc.b 0x00   ; UNUSED
    dc.b 0x00   ; UNUSED
    dc.b 0x27   ; UNUSED
    dc.b 0x00   ; UNUSED
    dc.b 0x01   ; A
    dc.b 0x02   ; B
    dc.b 0x03   ; C
    dc.b 0x04   ; D
    dc.b 0x05   ; E
    dc.b 0x06   ; F
    dc.b 0x07   ; G
    dc.b 0x08   ; H
    dc.b 0x09   ; I
    dc.b 0x0A   ; J
    dc.b 0x0B   ; K
    dc.b 0x0C   ; L
    dc.b 0x0D   ; M
    dc.b 0x0E   ; N
    dc.b 0x0F   ; O
    dc.b 0x10   ; P
    dc.b 0x11   ; Q
    dc.b 0x12   ; R
    dc.b 0x13   ; S
    dc.b 0x14   ; T
    dc.b 0x15   ; U
    dc.b 0x16   ; V
    dc.b 0x17   ; W
    dc.b 0x18   ; X
    dc.b 0x19   ; Y
    dc.b 0x1A   ; Z [ASCII 0x5A]
    dc.b 0x00   ; even byte


FONT_DATA:

    dc.l 0x01111100 ; A
    dc.l 0x11000110
    dc.l 0x10111010
    dc.l 0x10000010
    dc.l 0x10111010
    dc.l 0x10101010
    dc.l 0x11101110
    dc.l 0x00000000

    dc.l 0x11111100 ; B
    dc.l 0x10000110
    dc.l 0x10111010
    dc.l 0x10000110
    dc.l 0x10111010
    dc.l 0x10000110
    dc.l 0x11111100
    dc.l 0x00000000

    dc.l 0x01111110 ; C
    dc.l 0x11000010
    dc.l 0x10111110
    dc.l 0x10100000
    dc.l 0x10111110
    dc.l 0x11000010
    dc.l 0x01111110
    dc.l 0x00000000

    dc.l 0x11111100 ; D
    dc.l 0x10000110
    dc.l 0x10111010
    dc.l 0x10101010
    dc.l 0x10111010
    dc.l 0x10000110
    dc.l 0x11111100
    dc.l 0x00000000

    dc.l 0x11111110 ; E
    dc.l 0x10000010
    dc.l 0x10111110
    dc.l 0x10001000
    dc.l 0x10111110
    dc.l 0x10000010
    dc.l 0x11111110
    dc.l 0x00000000

    dc.l 0x11111110 ; F
    dc.l 0x10000010
    dc.l 0x10111110
    dc.l 0x10001000
    dc.l 0x10111000
    dc.l 0x10100000
    dc.l 0x11100000
    dc.l 0x00000000

    dc.l 0x01111110 ; G
    dc.l 0x11000010
    dc.l 0x10111110
    dc.l 0x10100010
    dc.l 0x10111010
    dc.l 0x11000010
    dc.l 0x01111110
    dc.l 0x00000000

    dc.l 0x11101110 ; H
    dc.l 0x10101010
    dc.l 0x10111010
    dc.l 0x10000010
    dc.l 0x10111010
    dc.l 0x10101010
    dc.l 0x11101110
    dc.l 0x00000000

    dc.l 0x11111110 ; I
    dc.l 0x10000010
    dc.l 0x11101110
    dc.l 0x00101000
    dc.l 0x11101110
    dc.l 0x10000010
    dc.l 0x11111110
    dc.l 0x00000000

    dc.l 0x00001110 ; J
    dc.l 0x00001010
    dc.l 0x00001010
    dc.l 0x11101010
    dc.l 0x10111010
    dc.l 0x11000110
    dc.l 0x01111100
    dc.l 0x00000000

    dc.l 0x11101110 ; K
    dc.l 0x10111010
    dc.l 0x10110110
    dc.l 0x10001100
    dc.l 0x10110110
    dc.l 0x10111010
    dc.l 0x11101110
    dc.l 0x00000000

    dc.l 0x11100000 ; L
    dc.l 0x10100000
    dc.l 0x10100000
    dc.l 0x10100000
    dc.l 0x10111110
    dc.l 0x10000010
    dc.l 0x11111110
    dc.l 0x00000000

    dc.l 0x11101110 ; M
    dc.l 0x10111010
    dc.l 0x10010010
    dc.l 0x10101010
    dc.l 0x10111010
    dc.l 0x10101010
    dc.l 0x11101110
    dc.l 0x00000000

    dc.l 0x11101110 ; N
    dc.l 0x10111010
    dc.l 0x10011010
    dc.l 0x10101010
    dc.l 0x10110010
    dc.l 0x10111010
    dc.l 0x11101110
    dc.l 0x00000000

    dc.l 0x01111100 ; O
    dc.l 0x11000110
    dc.l 0x10111010
    dc.l 0x10101010
    dc.l 0x10111010
    dc.l 0x11000110
    dc.l 0x01111100
    dc.l 0x00000000

    dc.l 0x11111100 ; P
    dc.l 0x10000110
    dc.l 0x10111010
    dc.l 0x10000110
    dc.l 0x10111100
    dc.l 0x10100000
    dc.l 0x11100000
    dc.l 0x00000000

    dc.l 0x01111100 ; Q
    dc.l 0x11000110
    dc.l 0x10111010
    dc.l 0x10101010
    dc.l 0x10110110
    dc.l 0x11001010
    dc.l 0x01111110
    dc.l 0x00000000

    dc.l 0x11111100 ; R
    dc.l 0x10000110
    dc.l 0x10111010
    dc.l 0x10000110
    dc.l 0x10110110
    dc.l 0x10111010
    dc.l 0x11101110
    dc.l 0x00000000

    dc.l 0x01111110 ; S
    dc.l 0x11000010
    dc.l 0x10111110
    dc.l 0x11000110
    dc.l 0x11111010
    dc.l 0x10000110
    dc.l 0x11111100
    dc.l 0x00000000

    dc.l 0x11111110 ; T
    dc.l 0x10000010
    dc.l 0x11101110
    dc.l 0x00101000
    dc.l 0x00101000
    dc.l 0x00101000
    dc.l 0x00111000
    dc.l 0x00000000

    dc.l 0x11101110 ; U
    dc.l 0x10101010
    dc.l 0x10101010
    dc.l 0x10101010
    dc.l 0x10111010
    dc.l 0x11000110
    dc.l 0x01111100
    dc.l 0x00000000

    dc.l 0x11101110 ; V
    dc.l 0x10101010
    dc.l 0x10111010
    dc.l 0x11010110
    dc.l 0x01010100
    dc.l 0x01101100
    dc.l 0x00111000
    dc.l 0x00000000

    dc.l 0x11101110 ; W
    dc.l 0x10101010
    dc.l 0x10111010
    dc.l 0x10101010
    dc.l 0x10010010
    dc.l 0x10111010
    dc.l 0x11101110
    dc.l 0x00000000

    dc.l 0x11101110 ; X
    dc.l 0x10111010
    dc.l 0x11010110
    dc.l 0x01101100
    dc.l 0x11010110
    dc.l 0x10111010
    dc.l 0x11101110
    dc.l 0x00000000

    dc.l 0x11101110 ; Y
    dc.l 0x10111010
    dc.l 0x11010110
    dc.l 0x01101100
    dc.l 0x00101000
    dc.l 0x00101000
    dc.l 0x00111000
    dc.l 0x00000000

    dc.l 0x11111110 ; Z
    dc.l 0x10000010
    dc.l 0x11110110
    dc.l 0x01101100
    dc.l 0x11011110
    dc.l 0x10000010
    dc.l 0x11111110
    dc.l 0x00000000

    dc.l 0x01111100 ; 0
    dc.l 0x11000110
    dc.l 0x10110010
    dc.l 0x10101010
    dc.l 0x10011010
    dc.l 0x11000110
    dc.l 0x01111100
    dc.l 0x00000000

    dc.l 0x01111000 ; 1
    dc.l 0x01001000
    dc.l 0x01101000
    dc.l 0x00101000
    dc.l 0x01101100
    dc.l 0x01000100
    dc.l 0x01111100
    dc.l 0x00000000

    dc.l 0x11111100 ; 2
    dc.l 0x10000110
    dc.l 0x11111010
    dc.l 0x11000110
    dc.l 0x10111110
    dc.l 0x10000010
    dc.l 0x11111110
    dc.l 0x00000000

    dc.l 0x11111100 ; 3
    dc.l 0x10000110
    dc.l 0x11111010
    dc.l 0x00100110
    dc.l 0x11111010
    dc.l 0x10000110
    dc.l 0x11111100
    dc.l 0x00000000

    dc.l 0x11101110 ; 4
    dc.l 0x10101010
    dc.l 0x10111010
    dc.l 0x10000010
    dc.l 0x11111010
    dc.l 0x00001010
    dc.l 0x00001110
    dc.l 0x00000000

    dc.l 0x11111110 ; 5
    dc.l 0x10000010
    dc.l 0x10111110
    dc.l 0x10000110
    dc.l 0x11111010
    dc.l 0x10000110
    dc.l 0x11111100
    dc.l 0x00000000

    dc.l 0x01111100 ; 6
    dc.l 0x11000100
    dc.l 0x10111100
    dc.l 0x10000110
    dc.l 0x10111010
    dc.l 0x11000110
    dc.l 0x01111100
    dc.l 0x00000000

    dc.l 0x11111110 ; 7
    dc.l 0x10000010
    dc.l 0x11111010
    dc.l 0x00110110
    dc.l 0x01101100
    dc.l 0x01011000
    dc.l 0x01110000
    dc.l 0x00000000

    dc.l 0x01111100 ; 8
    dc.l 0x11000110
    dc.l 0x10111010
    dc.l 0x11000110
    dc.l 0x10111010
    dc.l 0x11000110
    dc.l 0x01111100
    dc.l 0x00000000

    dc.l 0x01111100 ; 9
    dc.l 0x11000110
    dc.l 0x10111010
    dc.l 0x11000010
    dc.l 0x01111010
    dc.l 0x01000110
    dc.l 0x01111100
    dc.l 0x00000000
