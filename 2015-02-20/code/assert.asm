

assert          sty testnumber
                stx expected
                cmp expected
                beq success
fail            lda #Red
                sta BorderColor
                lda testnumber
                clc
                adc #$30
                jsr Chrout
success         rts

expected        !byte 0
testnumber      !byte 0


