;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Mac OS X x86_64)
;--------------------------------------------------------
	.module text
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _cpct_getScreenPtr
	.globl _cpct_drawSpriteMaskedAlignedTable
	.globl _cpct_drawSprite
	.globl _swapColors
	.globl _strLength
	.globl _strCopy
	.globl _drawText
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
;src/text/text.c:56: u8 strLength(u8 str[]) {
;	---------------------------------
; Function strLength
; ---------------------------------
_strLength::
;src/text/text.c:60: while (str[result] != '\0') {
	ld	c, #0x00
00101$:
	ld	hl, #2
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	ld	b, #0x00
	add	hl, bc
	ld	a, (hl)
	or	a, a
	jr	Z,00103$
;src/text/text.c:61: result++;
	inc	c
	jr	00101$
00103$:
;src/text/text.c:63: return result;
	ld	l, c
	ret
_swapColors:
	.db #0x55	; 85	'U'
	.db #0xee	; 238
	.db #0xdd	; 221
	.db #0xff	; 255
	.db #0x14	; 20
	.db #0x6c	; 108	'l'
	.db #0x9c	; 156
	.db #0x3c	; 60
	.db #0x50	; 80	'P'
	.db #0xe4	; 228
	.db #0xd8	; 216
	.db #0xf0	; 240
	.db #0x11	; 17
	.db #0x66	; 102	'f'
	.db #0x99	; 153
	.db #0x33	; 51	'3'
	.db #0x10	; 16
	.db #0x35	; 53	'5'
	.db #0x3a	; 58
	.db #0x30	; 48	'0'
	.db #0x45	; 69	'E'
	.db #0xce	; 206
	.db #0xcd	; 205
	.db #0xcf	; 207
;src/text/text.c:77: void strCopy(u8 source[], u8 dest[]) 
;	---------------------------------
; Function strCopy
; ---------------------------------
_strCopy::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/text/text.c:80: while ((dest[i] = source[i]) != '\0')
	ld	c, #0x00
00101$:
	ld	a, 6 (ix)
	add	a, c
	ld	e, a
	ld	a, 7 (ix)
	adc	a, #0x00
	ld	d, a
	ld	l,4 (ix)
	ld	h,5 (ix)
	ld	b, #0x00
	add	hl, bc
	ld	a, (hl)
	ld	(de), a
	or	a, a
	jr	Z,00104$
;src/text/text.c:82: i++;
	inc	c
	jr	00101$
00104$:
	pop	ix
	ret
;src/text/text.c:87: void drawText(const u8 text[], u8 xPos, u8 yPos, u8 color, u8 size, u8 transparent) {
;	---------------------------------
; Function drawText
; ---------------------------------
_drawText::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-83
	add	hl, sp
	ld	sp, hl
;src/text/text.c:99: color1 = swapColors[color][0];
	ld	bc, #_swapColors+0
	ld	l, 8 (ix)
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	add	hl, bc
	push	hl
	pop	iy
	ld	a, 0 (iy)
	ld	-79 (ix), a
;src/text/text.c:100: color2 = swapColors[color][1];
	push	iy
	pop	hl
	inc	hl
	ld	a, (hl)
	ld	-78 (ix), a
;src/text/text.c:101: color3 = swapColors[color][2];
	push	iy
	pop	hl
	inc	hl
	inc	hl
	ld	a, (hl)
	ld	-77 (ix), a
;src/text/text.c:102: color4 = swapColors[color][3];
	ld	a, 3 (iy)
	ld	-76 (ix), a
;src/text/text.c:107: character = text[x];
	ld	a, 4 (ix)
	ld	-17 (ix), a
	ld	a, 5 (ix)
	ld	-16 (ix), a
	ld	l,-17 (ix)
	ld	h,-16 (ix)
	ld	a, (hl)
	ld	-1 (ix), a
;src/text/text.c:109: while (character != '\0') {
	ld	hl, #0x0008
	add	hl, sp
	ld	-13 (ix), l
	ld	-12 (ix), h
	ld	a, -13 (ix)
	ld	-15 (ix), a
	ld	a, -12 (ix)
	ld	-14 (ix), a
	ld	a, -13 (ix)
	ld	-19 (ix), a
	ld	a, -12 (ix)
	ld	-18 (ix), a
	ld	a, -13 (ix)
	ld	-21 (ix), a
	ld	a, -12 (ix)
	ld	-20 (ix), a
	ld	a, -13 (ix)
	ld	-23 (ix), a
	ld	a, -12 (ix)
	ld	-22 (ix), a
	ld	a, -13 (ix)
	ld	-25 (ix), a
	ld	a, -12 (ix)
	ld	-24 (ix), a
	ld	a, -13 (ix)
	ld	-27 (ix), a
	ld	a, -12 (ix)
	ld	-26 (ix), a
	ld	a, -13 (ix)
	ld	-9 (ix), a
	ld	a, -12 (ix)
	ld	-8 (ix), a
	ld	a, -13 (ix)
	ld	-11 (ix), a
	ld	a, -12 (ix)
	ld	-10 (ix), a
	ld	a, -13 (ix)
	ld	-3 (ix), a
	ld	a, -12 (ix)
	ld	-2 (ix), a
	ld	a, 9 (ix)
	dec	a
	jr	NZ,00304$
	ld	a,#0x01
	jr	00305$
00304$:
	xor	a,a
00305$:
	ld	-4 (ix), a
	ld	a, 9 (ix)
	ld	c, a
	add	a, a
	add	a, a
	add	a, a
	add	a, c
	ld	-5 (ix), a
	ld	a, -13 (ix)
	ld	-7 (ix), a
	ld	a, -12 (ix)
	ld	-6 (ix), a
	ld	a, -5 (ix)
	ld	-28 (ix), a
	ld	a, -13 (ix)
	ld	-30 (ix), a
	ld	a, -12 (ix)
	ld	-29 (ix), a
	ld	-81 (ix), #0x00
00159$:
	ld	a, -1 (ix)
	or	a, a
	jp	Z, 00164$
;src/text/text.c:112: if ((character == 33) || ((character>43) && (character<47)) || 
	ld	a, -1 (ix)
	sub	a, #0x21
	jr	NZ,00306$
	ld	a,#0x01
	jr	00307$
00306$:
	xor	a,a
00307$:
	ld	c,a
	or	a, a
	jr	NZ,00151$
	ld	a, #0x2b
	sub	a, -1 (ix)
	jr	NC,00156$
	ld	a, -1 (ix)
	sub	a, #0x2f
	jr	C,00151$
00156$:
;src/text/text.c:113: ((character>47) && (character<58)) || ((character>62) && (character<91))) { //Allowed characters
	ld	a, #0x2f
	sub	a, -1 (ix)
	jr	NC,00158$
	ld	a, -1 (ix)
	sub	a, #0x3a
	jr	C,00151$
00158$:
	ld	a, #0x3e
	sub	a, -1 (ix)
	jp	NC, 00152$
	ld	a, -1 (ix)
	sub	a, #0x5b
	jp	NC, 00152$
00151$:
;src/text/text.c:117: switch(character){
	ld	a, c
	or	a, a
	jr	NZ,00101$
	ld	a, -1 (ix)
	sub	a, #0x2c
	jr	Z,00104$
	ld	a, -1 (ix)
	sub	a, #0x2d
	jr	Z,00104$
	ld	a, -1 (ix)
	sub	a, #0x2e
	jr	Z,00104$
	ld	a, -1 (ix)
	sub	a, #0x30
	jr	Z,00114$
	ld	a, -1 (ix)
	sub	a, #0x31
	jr	Z,00114$
	ld	a, -1 (ix)
	sub	a, #0x32
	jr	Z,00114$
	ld	a, -1 (ix)
	sub	a, #0x33
	jr	Z,00114$
	ld	a, -1 (ix)
	sub	a, #0x34
	jr	Z,00114$
	ld	a, -1 (ix)
	sub	a, #0x35
	jr	Z,00114$
	ld	a, -1 (ix)
	sub	a, #0x36
	jr	Z,00114$
	ld	a, -1 (ix)
	sub	a, #0x37
	jr	Z,00114$
	ld	a, -1 (ix)
	sub	a, #0x38
	jr	Z,00114$
	ld	a, -1 (ix)
	sub	a, #0x39
	jr	Z,00114$
	jr	00115$
;src/text/text.c:119: case 33:
00101$:
;src/text/text.c:120: character=49;
	ld	-1 (ix), #0x31
;src/text/text.c:121: break;
	jr	00115$
;src/text/text.c:126: case 46:
00104$:
;src/text/text.c:127: character+=6;
	ld	a, -1 (ix)
	add	a, #0x06
	ld	-1 (ix), a
;src/text/text.c:128: break;
	jr	00115$
;src/text/text.c:140: case 57:
00114$:
;src/text/text.c:141: character+=5;
	ld	a, -1 (ix)
	add	a, #0x05
	ld	-1 (ix), a
;src/text/text.c:143: }
00115$:
;src/text/text.c:146: character-=49;
	ld	a, -1 (ix)
	add	a, #0xcf
;src/text/text.c:149: for(i=0;i<18;i++){
	ld	-39 (ix), a
	ld	c, a
	ld	b,#0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ld	c, l
	ld	b, h
	ld	-80 (ix), #0x00
00162$:
;src/text/text.c:150: pChar = (u8*) g_font_chars + (character*18) + i;
	ld	hl, #_g_font_chars
	add	hl, bc
	ld	e,-80 (ix)
	ld	d,#0x00
	add	hl, de
	inc	sp
	inc	sp
	push	hl
;src/text/text.c:154: if(*pChar == 0x55) colorchar[i]=color1;
	pop	hl
	push	hl
	ld	e, (hl)
	ld	a, e
	sub	a, #0x55
	jr	NZ,00321$
	ld	a,#0x01
	jr	00322$
00321$:
	xor	a,a
00322$:
	ld	-31 (ix), a
;src/text/text.c:155: else if(*pChar == 0xee) colorchar[i]=color2;
	ld	a, e
	sub	a, #0xee
	jr	NZ,00323$
	ld	a,#0x01
	jr	00324$
00323$:
	xor	a,a
00324$:
	ld	-32 (ix), a
;src/text/text.c:156: else if(*pChar == 0xdd) colorchar[i]=color3;
	ld	a, e
	sub	a, #0xdd
	jr	NZ,00325$
	ld	a,#0x01
	jr	00326$
00325$:
	xor	a,a
00326$:
	ld	-33 (ix), a
;src/text/text.c:157: else if(*pChar == 0xff) colorchar[i]=color4;
	ld	a, e
	inc	a
	jr	NZ,00327$
	ld	a,#0x01
	jr	00328$
00327$:
	xor	a,a
00328$:
	ld	-34 (ix), a
;src/text/text.c:152: if(size==1) {
	ld	a, -4 (ix)
	or	a, a
	jp	Z, 00141$
;src/text/text.c:154: if(*pChar == 0x55) colorchar[i]=color1;
	ld	a, -31 (ix)
	or	a, a
	jr	Z,00126$
	ld	a, -3 (ix)
	add	a, -80 (ix)
	ld	e, a
	ld	a, -2 (ix)
	adc	a, #0x00
	ld	d, a
	ld	a, -79 (ix)
	ld	(de), a
	jp	00163$
00126$:
;src/text/text.c:155: else if(*pChar == 0xee) colorchar[i]=color2;
	ld	a, -32 (ix)
	or	a, a
	jr	Z,00123$
	ld	a, -11 (ix)
	add	a, -80 (ix)
	ld	e, a
	ld	a, -10 (ix)
	adc	a, #0x00
	ld	d, a
	ld	a, -78 (ix)
	ld	(de), a
	jp	00163$
00123$:
;src/text/text.c:156: else if(*pChar == 0xdd) colorchar[i]=color3;
	ld	a, -33 (ix)
	or	a, a
	jr	Z,00120$
	ld	a, -9 (ix)
	add	a, -80 (ix)
	ld	e, a
	ld	a, -8 (ix)
	adc	a, #0x00
	ld	d, a
	ld	a, -77 (ix)
	ld	(de), a
	jp	00163$
00120$:
;src/text/text.c:157: else if(*pChar == 0xff) colorchar[i]=color4;
	ld	a, -34 (ix)
	or	a, a
	jr	Z,00117$
	ld	a, -27 (ix)
	add	a, -80 (ix)
	ld	e, a
	ld	a, -26 (ix)
	adc	a, #0x00
	ld	d, a
	ld	a, -76 (ix)
	ld	(de), a
	jp	00163$
00117$:
;src/text/text.c:158: else colorchar[i]=*pChar;
	ld	a, -25 (ix)
	add	a, -80 (ix)
	ld	l, a
	ld	a, -24 (ix)
	adc	a, #0x00
	ld	h, a
	ld	(hl), e
	jp	00163$
00141$:
;src/text/text.c:163: pos=(i*size)-(i%FONT2_W);
	push	de
	push	bc
	ld	e, 9 (ix)
	ld	h, -80 (ix)
	ld	l, #0x00
	ld	d, l
	ld	b, #0x08
00329$:
	add	hl, hl
	jr	NC,00330$
	add	hl, de
00330$:
	djnz	00329$
	pop	bc
	pop	de
	ld	a, -80 (ix)
	and	a, #0x01
	ld	d, a
	ld	a, l
	sub	a, d
	ld	l, a
;src/text/text.c:167: colorchar[pos+FONT2_W]=color1;
	ld	d, l
	inc	d
	inc	d
;src/text/text.c:165: if(*pChar == 0x55) {
	ld	a, -31 (ix)
	or	a, a
	jr	Z,00138$
;src/text/text.c:166: colorchar[pos]=color1;
	ld	a, -23 (ix)
	add	a, l
	ld	l, a
	ld	a, -22 (ix)
	adc	a, #0x00
	ld	h, a
	ld	a, -79 (ix)
	ld	(hl), a
;src/text/text.c:167: colorchar[pos+FONT2_W]=color1;
	ld	a, -23 (ix)
	add	a, d
	ld	e, a
	ld	a, -22 (ix)
	adc	a, #0x00
	ld	d, a
	ld	a, -79 (ix)
	ld	(de), a
	jp	00163$
00138$:
;src/text/text.c:169: else if(*pChar == 0xee) {
	ld	a, -32 (ix)
	or	a, a
	jr	Z,00135$
;src/text/text.c:170: colorchar[pos]=color2;
	ld	a, -21 (ix)
	add	a, l
	ld	l, a
	ld	a, -20 (ix)
	adc	a, #0x00
	ld	h, a
	ld	a, -78 (ix)
	ld	(hl), a
;src/text/text.c:171: colorchar[pos+FONT2_W]=color2;
	ld	a, -21 (ix)
	add	a, d
	ld	e, a
	ld	a, -20 (ix)
	adc	a, #0x00
	ld	d, a
	ld	a, -78 (ix)
	ld	(de), a
	jr	00163$
00135$:
;src/text/text.c:173: else if(*pChar == 0xdd) {
	ld	a, -33 (ix)
	or	a, a
	jr	Z,00132$
;src/text/text.c:174: colorchar[pos]=color3;
	ld	a, -19 (ix)
	add	a, l
	ld	l, a
	ld	a, -18 (ix)
	adc	a, #0x00
	ld	h, a
	ld	a, -77 (ix)
	ld	(hl), a
;src/text/text.c:175: colorchar[pos+FONT2_W]=color3;
	ld	a, -19 (ix)
	add	a, d
	ld	e, a
	ld	a, -18 (ix)
	adc	a, #0x00
	ld	d, a
	ld	a, -77 (ix)
	ld	(de), a
	jr	00163$
00132$:
;src/text/text.c:177: else if(*pChar == 0xff) {
	ld	a, -34 (ix)
	or	a, a
	jr	Z,00129$
;src/text/text.c:178: colorchar[pos]=color4;
	ld	a, -15 (ix)
	add	a, l
	ld	l, a
	ld	a, -14 (ix)
	adc	a, #0x00
	ld	h, a
	ld	a, -76 (ix)
	ld	(hl), a
;src/text/text.c:179: colorchar[pos+FONT2_W]=color4;
	ld	a, -15 (ix)
	add	a, d
	ld	e, a
	ld	a, -14 (ix)
	adc	a, #0x00
	ld	d, a
	ld	a, -76 (ix)
	ld	(de), a
	jr	00163$
00129$:
;src/text/text.c:182: colorchar[pos]=*pChar;
	ld	a, -13 (ix)
	add	a, l
	ld	l, a
	ld	a, -12 (ix)
	adc	a, #0x00
	ld	h, a
	ld	(hl), e
;src/text/text.c:183: colorchar[pos+FONT2_W]=*pChar;
	ld	a, -13 (ix)
	add	a, d
	ld	e, a
	ld	a, -12 (ix)
	adc	a, #0x00
	ld	d, a
	pop	hl
	push	hl
	ld	a, (hl)
	ld	(de), a
00163$:
;src/text/text.c:149: for(i=0;i<18;i++){
	inc	-80 (ix)
	ld	a, -80 (ix)
	sub	a, #0x12
	jp	C, 00162$
;src/text/text.c:192: pvideo = cpct_getScreenPtr(CPCT_VMEM_START, xPos, yPos);
	ld	h, 7 (ix)
	ld	l, 6 (ix)
	push	hl
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
;src/text/text.c:193: if(transparent) cpct_drawSpriteMaskedAlignedTable(colorchar, pvideo, FONT2_W, FONT2_H*size, g_tablatrans);
	ld	-36 (ix), l
	ld	-35 (ix), h
	ld	a, 10 (ix)
	or	a, a
	jr	Z,00145$
	ld	de, #_g_tablatrans
	ld	c,-30 (ix)
	ld	b,-29 (ix)
	push	de
	ld	d, -28 (ix)
	ld	e,#0x02
	push	de
	ld	l,-36 (ix)
	ld	h,-35 (ix)
	push	hl
	push	bc
	call	_cpct_drawSpriteMaskedAlignedTable
	jr	00146$
00145$:
;src/text/text.c:194: else cpct_drawSprite (colorchar, pvideo, FONT2_W, FONT2_H*size);
	ld	a, -7 (ix)
	ld	-38 (ix), a
	ld	a, -6 (ix)
	ld	-37 (ix), a
	ld	d, -5 (ix)
	ld	e,#0x02
	push	de
	ld	l,-36 (ix)
	ld	h,-35 (ix)
	push	hl
	ld	l,-38 (ix)
	ld	h,-37 (ix)
	push	hl
	call	_cpct_drawSprite
00146$:
;src/text/text.c:197: if(character == 48 || character == 60 || character == 57) xPos--;
	ld	a, -39 (ix)
	sub	a, #0x30
	jr	Z,00147$
	ld	a, -39 (ix)
	sub	a, #0x3c
	jr	Z,00147$
	ld	a, -39 (ix)
	sub	a, #0x39
	jr	NZ,00152$
00147$:
	dec	6 (ix)
00152$:
;src/text/text.c:200: character = text[++x];
	inc	-81 (ix)
	ld	a, -17 (ix)
	add	a, -81 (ix)
	ld	l, a
	ld	a, -16 (ix)
	adc	a, #0x00
	ld	h, a
	ld	a, (hl)
	ld	-1 (ix), a
;src/text/text.c:201: xPos+=FONT2_W;
	inc	6 (ix)
	inc	6 (ix)
	jp	00159$
00164$:
	ld	sp, ix
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
