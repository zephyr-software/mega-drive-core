; ******************************************************************************
; system initialization code section
;
; ******************************************************************************

    include vector.asm
    include header.asm
    include macro.asm


INIT: ; entry point address in cpu vector table

    INIT_M68K_SREG_MACRO ; no trace, supervisor mode; irq level 7, user byte 0
    CLR_M68K_MACRO       ; clear m68k regs

; --------------------------------------
; pass trade mark security signature
; --------------------------------------
    move.l #0x00000000, D0
    move.b 0x00A10001,  D0 ; mega drive hardware version [bits 0-3]
    andi.b #%00001111,  D0 ; mask version

    cmp.b  #0x00,       D0 ; if version 0, skip tmss signature
    beq.s  NO_TMSS

    move.l #'SEGA',     0x00A14000 ; pass tmss
NO_TMSS:

; --------------------------------------
; init video display processor
; --------------------------------------
    move.l #VDP_REG,    A0 ; vdp register table
    move.l #0x00000017, D0 ; 24 vdp register
    move.l #0x00008000, D1 ; set vdp register command [register 0]

VDP_REG_COPY:
    move.b (A0)+,   D1         ; vdp register value
    move.w D1,      0x00C00004 ; set vdp register with vdp control port
    add.w  #0x0100, D1         ; set vdp register command [next register]
    dbra   D0,      VDP_REG_COPY


    FILL_RAM_MACRO RAM_START, STACK_END - 1, 0x00 ; fill ram with 0
    CLR_M68K_MACRO                                ; clear m68k regs

    jmp MAIN
