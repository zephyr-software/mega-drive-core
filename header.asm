; ******************************************************************************
; mega drive rom header
; ******************************************************************************

    dc.b "SEGA MEGA DRIVE "                                 ; console name
    dc.b "ZEPHYR 2022.AUG "                                 ; copyrght / release
    dc.b "MEGA DRIVE CORE                                 " ; domestic name
    dc.b "MEGA DRIVE CORE                                 " ; international name
    dc.b "GM XXXXXXXX-XX"                                   ; version number
    dc.w 0x0000                                             ; checksum
    dc.b "J               "                                 ; i/o support
    dc.l 0x00000000                                         ; rom start address
    dc.l ROM_END                                            ; rom end address
    dc.l 0x00FF0000                                         ; ram start address
    dc.l 0x00FFFFFF                                         ; ram end address
    dc.l 0x00000000                                         ; sram enabled
    dc.l 0x00000000                                         ; unused
    dc.l 0x00000000                                         ; sram start address
    dc.l 0x00000000                                         ; sram end address
    dc.l 0x00000000                                         ; unused
    dc.l 0x00000000                                         ; unused
    dc.b "                                        "         ; notes - unused
    dc.b "E               "                                 ; country codes
