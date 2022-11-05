; ******************************************************************************
; m68k interrupt vector table
; ******************************************************************************

    dc.l   STACK_ADDR ; stack address
    dc.l   INIT       ; program start
    dc.l   EXCEPTION  ; bus error
    dc.l   EXCEPTION  ; address error
    dc.l   EXCEPTION  ; illegal instruction
    dc.l   EXCEPTION  ; division by zero
    dc.l   EXCEPTION  ; chk exception
    dc.l   EXCEPTION  ; trapv exception
    dc.l   EXCEPTION  ; privilege violation
    dc.l   EXCEPTION  ; trace exception
    dc.l   EXCEPTION  ; line-a emulator
    dc.l   EXCEPTION  ; line-f emulator
    dc.l   EXCEPTION  ; unused - reserved
    dc.l   EXCEPTION  ; co-processor protocol violation
    dc.l   EXCEPTION  ; format error
    dc.l   EXCEPTION  ; uninitialized interrupt
    dc.l   EXCEPTION  ; unused - reserved
    dc.l   EXCEPTION  ; unused - reserved
    dc.l   EXCEPTION  ; unused - reserved
    dc.l   EXCEPTION  ; unused - reserved
    dc.l   EXCEPTION  ; unused - reserved
    dc.l   EXCEPTION  ; unused - reserved
    dc.l   EXCEPTION  ; unused - reserved
    dc.l   EXCEPTION  ; unused - reserved
    dc.l   EXCEPTION  ; spurious exception
    dc.l   EXCEPTION  ; irq level 1
    dc.l   EXCEPTION  ; irq level 2
    dc.l   EXCEPTION  ; irq level 3
    dc.l   HINT       ; irq level 4 - horizontal retrace interrupt
    dc.l   EXCEPTION  ; irq level 5
    dc.l   VINT       ; irq level 6  - vertical retrace interrupt
    dc.l   EXCEPTION  ; irq level 7
    dc.l   EXCEPTION  ; trap #00 exception
    dc.l   EXCEPTION  ; trap #01 exception
    dc.l   EXCEPTION  ; trap #02 exception
    dc.l   EXCEPTION  ; trap #03 exception
    dc.l   EXCEPTION  ; trap #04 exception
    dc.l   EXCEPTION  ; trap #05 exception
    dc.l   EXCEPTION  ; trap #06 exception
    dc.l   EXCEPTION  ; trap #07 exception
    dc.l   EXCEPTION  ; trap #08 exception
    dc.l   EXCEPTION  ; trap #09 exception
    dc.l   EXCEPTION  ; trap #10 exception
    dc.l   EXCEPTION  ; trap #11 exception
    dc.l   EXCEPTION  ; trap #12 exception
    dc.l   EXCEPTION  ; trap #13 exception
    dc.l   EXCEPTION  ; trap #14 exception
    dc.l   EXCEPTION  ; trap #15 exception
    dc.l   EXCEPTION  ; (fp) branch or set on unordered condition
    dc.l   EXCEPTION  ; (fp) inexact result
    dc.l   EXCEPTION  ; (fp) divide by zero
    dc.l   EXCEPTION  ; (fp) underflow
    dc.l   EXCEPTION  ; (fp) operand error
    dc.l   EXCEPTION  ; (fp) overflow
    dc.l   EXCEPTION  ; (fp) signaling nan
    dc.l   EXCEPTION  ; (fp) unimplemented data type
    dc.l   EXCEPTION  ; mmu configuration error
    dc.l   EXCEPTION  ; mmu illegal operation error
    dc.l   EXCEPTION  ; mmu access violation error
    dc.l   EXCEPTION  ; unused - reserved
    dc.l   EXCEPTION  ; unused - reserved
    dc.l   EXCEPTION  ; unused - reserved
    dc.l   EXCEPTION  ; unused - reserved
    dc.l   EXCEPTION  ; unused - reserved
