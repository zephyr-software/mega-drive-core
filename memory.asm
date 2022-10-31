; ******************************************************************************
; mega drive memory map
; ******************************************************************************


RAM_MAP:   equ 0x00FF0000
RAM_START: equ 0x0000

RAM_COUNTER:      equ (RAM_START + RAM_MAP)
RAM_COUNTER_SIZE: equ 0x4
RAM_COUNTER_STR:  equ (RAM_COUNTER + RAM_COUNTER_SIZE)

RAM_END: equ (RAM_START + 0xFFFF)
