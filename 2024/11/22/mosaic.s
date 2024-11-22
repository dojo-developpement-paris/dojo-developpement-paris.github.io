        
	lda #$00
	sta $42
	lda #$00
	sta $1000
	sta $1001
	sta $1002
	sta $1003
	sta $22
	lda #$20
        sta $23

init:
	lda #$00
	ldy #$00
	sta $2000,y
	iny
	bne init

out_loop:
        ldy $fe
     	lda ($22),y
	lda $fe
	and #$03
	clc
        adc #$02
        sta $43
	ldy $fe
	lda #$01
	sta ($42),y
	inc $1000
	bne suite1
	inc $1001
	bne suite1
	inc $1002
	bne suite1
	inc $1003
suite1:
	lda $ff
	cmp #46
	bne out_loop
