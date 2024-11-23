       	lda #$00
	sta $42
	lda #$00
	sta $1000
	sta $1001
	sta $22
	lda #$10
        sta $23
out_loop:
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
