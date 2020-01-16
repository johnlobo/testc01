;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Mac OS X x86_64)
;--------------------------------------------------------
	.module trig
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _mini16
	.globl _maxi16
	.globl _cosine
	.globl _sine
	.globl _sine_table
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;src/util/trig.c:15: i16 sine(i16 angle) {
;	---------------------------------
; Function sine
; ---------------------------------
_sine::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/util/trig.c:16: if (angle < 90) {
	ld	a, 4 (ix)
	sub	a, #0x5a
	ld	a, 5 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC,00108$
;src/util/trig.c:17: return sine_table[angle];
	ld	bc, #_sine_table+0
	ld	l,4 (ix)
	ld	h,5 (ix)
	add	hl, hl
	add	hl, bc
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	jr	00110$
00108$:
;src/util/trig.c:19: return sine_table[180 - angle];
	ld	c, 4 (ix)
;src/util/trig.c:18: } else if (angle < 180) {
	ld	a, 4 (ix)
	sub	a, #0xb4
	ld	a, 5 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC,00105$
;src/util/trig.c:19: return sine_table[180 - angle];
	ld	de, #_sine_table+0
	ld	a, #0xb4
	sub	a, c
	ld	l, a
	rla
	sbc	a, a
	ld	h, a
	add	hl, hl
	add	hl, de
	ld	c, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, c
	jr	00110$
00105$:
;src/util/trig.c:20: } else if (angle < 270) {
	ld	a, 4 (ix)
	sub	a, #0x0e
	ld	a, 5 (ix)
	rla
	ccf
	rra
	sbc	a, #0x81
	jr	NC,00102$
;src/util/trig.c:21: return -sine_table[angle - 180];
	ld	a, c
	add	a, #0x4c
	ld	l, a
	rla
	sbc	a, a
	ld	h, a
	add	hl, hl
	ld	de, #_sine_table
	add	hl, de
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	xor	a, a
	sub	a, c
	ld	l, a
	ld	a, #0x00
	sbc	a, b
	ld	h, a
	jr	00110$
00102$:
;src/util/trig.c:23: return -sine_table[360 - angle];
	ld	a, #0x68
	sub	a, c
	ld	l, a
	rla
	sbc	a, a
	ld	h, a
	add	hl, hl
	ld	de, #_sine_table
	add	hl, de
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	xor	a, a
	sub	a, c
	ld	l, a
	ld	a, #0x00
	sbc	a, b
	ld	h, a
00110$:
	pop	ix
	ret
_sine_table:
	.dw #0x0000
	.dw #0x0004
	.dw #0x0009
	.dw #0x000d
	.dw #0x0012
	.dw #0x0016
	.dw #0x001b
	.dw #0x001f
	.dw #0x0024
	.dw #0x0028
	.dw #0x002c
	.dw #0x0031
	.dw #0x0035
	.dw #0x003a
	.dw #0x003e
	.dw #0x0042
	.dw #0x0047
	.dw #0x004b
	.dw #0x004f
	.dw #0x0053
	.dw #0x0058
	.dw #0x005c
	.dw #0x0060
	.dw #0x0064
	.dw #0x0068
	.dw #0x006c
	.dw #0x0070
	.dw #0x0074
	.dw #0x0078
	.dw #0x007c
	.dw #0x0080
	.dw #0x0084
	.dw #0x0088
	.dw #0x008b
	.dw #0x008f
	.dw #0x0093
	.dw #0x0096
	.dw #0x009a
	.dw #0x009e
	.dw #0x00a1
	.dw #0x00a5
	.dw #0x00a8
	.dw #0x00ab
	.dw #0x00af
	.dw #0x00b2
	.dw #0x00b5
	.dw #0x00b8
	.dw #0x00bb
	.dw #0x00be
	.dw #0x00c1
	.dw #0x00c4
	.dw #0x00c7
	.dw #0x00ca
	.dw #0x00cc
	.dw #0x00cf
	.dw #0x00d2
	.dw #0x00d4
	.dw #0x00d7
	.dw #0x00d9
	.dw #0x00db
	.dw #0x00de
	.dw #0x00e0
	.dw #0x00e2
	.dw #0x00e4
	.dw #0x00e6
	.dw #0x00e8
	.dw #0x00ea
	.dw #0x00ec
	.dw #0x00ed
	.dw #0x00ef
	.dw #0x00f1
	.dw #0x00f2
	.dw #0x00f3
	.dw #0x00f5
	.dw #0x00f6
	.dw #0x00f7
	.dw #0x00f8
	.dw #0x00f9
	.dw #0x00fa
	.dw #0x00fb
	.dw #0x00fc
	.dw #0x00fd
	.dw #0x00fe
	.dw #0x00fe
	.dw #0x00ff
	.dw #0x00ff
	.dw #0x00ff
	.dw #0x0100
	.dw #0x0100
	.dw #0x0100
	.dw #0x0100
;src/util/trig.c:27: i16 cosine(i16 angle) {
;	---------------------------------
; Function cosine
; ---------------------------------
_cosine::
;src/util/trig.c:28: if (angle <= 90)
	ld	a, #0x5a
	ld	iy, #2
	add	iy, sp
	cp	a, 0 (iy)
	ld	a, #0x00
	sbc	a, 1 (iy)
	jp	PO, 00110$
	xor	a, #0x80
00110$:
	jp	M, 00102$
;src/util/trig.c:29: return (sine(90 - angle));
	ld	hl, #2
	add	hl, sp
	ld	a, #0x5a
	sub	a, (hl)
	ld	c, a
	ld	a, #0x00
	inc	hl
	sbc	a, (hl)
	ld	b, a
	push	bc
	call	_sine
	pop	af
	ret
00102$:
;src/util/trig.c:31: return (-sine(angle - 90));
	ld	iy, #2
	add	iy, sp
	ld	a, 0 (iy)
	add	a, #0xa6
	ld	c, a
	ld	a, 1 (iy)
	adc	a, #0xff
	ld	b, a
	push	bc
	call	_sine
	pop	af
	xor	a, a
	sub	a, l
	ld	l, a
	ld	a, #0x00
	sbc	a, h
	ld	h, a
	ret
;src/util/trig.c:34: i16 maxi16(i16 a, i16 b){
;	---------------------------------
; Function maxi16
; ---------------------------------
_maxi16::
;src/util/trig.c:35: if (a>b)
	ld	hl, #4
	add	hl, sp
	ld	a, (hl)
	ld	iy, #2
	add	iy, sp
	sub	a, 0 (iy)
	inc	hl
	ld	a, (hl)
	sbc	a, 1 (iy)
	jp	PO, 00110$
	xor	a, #0x80
00110$:
	jp	P, 00102$
;src/util/trig.c:36: return a;
	pop	bc
	pop	hl
	push	hl
	push	bc
	ret
00102$:
;src/util/trig.c:38: return b;
	ld	hl, #4
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	ret
;src/util/trig.c:40: i16 mini16(i16 a, i16 b){
;	---------------------------------
; Function mini16
; ---------------------------------
_mini16::
;src/util/trig.c:41: if (a>b)
	ld	hl, #4
	add	hl, sp
	ld	a, (hl)
	ld	iy, #2
	add	iy, sp
	sub	a, 0 (iy)
	inc	hl
	ld	a, (hl)
	sbc	a, 1 (iy)
	jp	PO, 00110$
	xor	a, #0x80
00110$:
	jp	P, 00102$
;src/util/trig.c:42: return b;
	ld	hl, #4
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	ret
00102$:
;src/util/trig.c:44: return a;
	pop	bc
	pop	hl
	push	hl
	push	bc
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
