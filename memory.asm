; ******************************************************************************
; mega drive memory map
; ******************************************************************************


RAM_SIZE:  equ 0xFFFF
RAM_START: equ 0x0000
RAM_END:   equ RAM_START + RAM_SIZE
RAM_ADDR:  equ 0x00FF0000

STACK_SIZE:  equ 0x00FE
STACK_START: equ RAM_END - 1
STACK_END:   equ STACK_START - STACK_SIZE
STACK_ADDR:  equ RAM_ADDR + STACK_START

RAM_COUNTER:      equ RAM_ADDR + RAM_START
RAM_COUNTER_SIZE: equ 0x4
RAM_COUNTER_STR:  equ RAM_COUNTER + RAM_COUNTER_SIZE

RAM_MD_VER:      equ RAM_COUNTER + RAM_COUNTER_SIZE
RAM_MD_VER_SIZE: equ 0x2
