!cpu 6502
!to "build/empty.prg",cbm   ; output file

; BASIC loader with start address $c000

* = $0801                               ; BASIC start address (#2049)
!byte $0d,$08,$dc,$07,$9e,$20,$34,$39   ; BASIC loader to start at $c000...
!byte $31,$35,$32,$00,$00,$00           ; puts BASIC line 2012 SYS 49152
* = $c000     				            ; start address for 6502 code

!source "code/main.asm"
!source "code/assert.asm" 
!source "code/tests.asm" 
!source "code/bowling.asm" 
