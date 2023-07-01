add_roll        lda frame
                cmp #10
                beq end_add_roll
                clc
                lda roll
                adc score
                sta score 
                lda #0
                adc score+1
                sta score+1
inc_frame       clc
                lda track
                adc roll
                cmp #21
                beq new_frame 
                cmp #10
                bcc new_frame
                lda roll
                sta track

end_add_roll    
                rts
new_frame       lda #11
                sta track
                inc frame
                rts

init_game       lda #0
                sta score
                sta score+1
                sta roll
                sta frame
                lda #11
                sta track
                rts

roll            !byte 0
score           !word 0
frame           !byte 0
track           !byte 0 

