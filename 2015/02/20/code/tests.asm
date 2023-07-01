; adding an average roll increase the score
tests       jsr init_game
            lda #5
            sta roll
            lda #255
            sta score
            sec
            jsr add_roll
            ldy #0
            ldx #4
            lda score
            jsr assert
            ldy #0
            ldx #1
            lda score+1
            jsr assert
            ldy #0
            ldx #0
            lda frame
            jsr assert

; adding after 10 frames doesn't increase score
            jsr init_game
            lda #10
            sta frame
            lda #5
            sta roll
            lda #12
            sta score
            jsr add_roll
            ldy #1
            ldx #12
            lda score
            jsr assert

; adding a 10 increases frame
            jsr init_game
            lda #10
            sta roll
            jsr add_roll
            ldy #2
            ldx #1
            lda frame
            jsr assert
; adding a 4 then a 3 increases frame
            jsr init_game
            lda #4
            sta roll
            jsr add_roll
            lda #3
            sta roll
            jsr add_roll
            ldy #3
            ldx #1
            lda frame
            jsr assert

            rts
