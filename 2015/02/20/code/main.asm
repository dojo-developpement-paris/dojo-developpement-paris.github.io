BorderColor = $D020
ScreenColor = $D021
Chrout      = $FFD2
Black       = 0
Red         = 2
Green       = 5

            lda #Black
            
            sta ScreenColor
            lda #Green
            sta BorderColor

            jsr tests
            rts


                
