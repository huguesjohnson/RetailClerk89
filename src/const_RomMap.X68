; ------------------------------------------------------------------------------
; ROM addresses
; -This reserves ~512kb for the progam and ~1.5mb for resources
; -The resource section could be expaded until the ROM hits ~4.2mb (3FFFFF)
; -Expanding beyond $200000 means re-testing the save/load routine,
;  in theory it should be fine but I didn't feel like messing with it for now
; ------------------------------------------------------------------------------
ROM_ADDR_RESOURCES=$07A120
ROM_ADDR_INSTRUMENTS=ROM_ADDR_END-SEG_SIZE_INSTRUMENTS
ROM_ADDR_END=$200000
; ------------------------------------------------------------------------------
; segment sizes
; ------------------------------------------------------------------------------
SEG_SIZE_INSTRUMENTS=$186D
