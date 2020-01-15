;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Linux)
;--------------------------------------------------------
	.module main
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _init
	.globl _updateCharacter
	.globl _motionUpdate
	.globl _getCharacterInput
	.globl _printDebugInfo
	.globl _eraseDebugInfo
	.globl _printWayPoints
	.globl _printCharacter
	.globl _eraseCharacter
	.globl _myInterruptHandler
	.globl _wait4OneKey
	.globl _cosine
	.globl _sine
	.globl _drawText
	.globl _abs
	.globl _cpct_getScreenPtr
	.globl _cpct_setVideoMode
	.globl _cpct_drawSolidBox
	.globl _cpct_px2byteM0
	.globl _cpct_isKeyPressed
	.globl _cpct_scanKeyboard_f
	.globl _cpct_waitHalts
	.globl _cpct_setInterruptHandler
	.globl _sprintf
	.globl _i_time
	.globl _g_nInterrupt
	.globl _pause
	.globl _wp
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_pause::
	.ds 1
_g_nInterrupt::
	.ds 1
_i_time::
	.ds 4
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
;src/main.c:29: cpctm_createTransparentMaskTable(g_tablatrans, 0x200, M0, 0);
;	---------------------------------
; Function dummy_cpct_transparentMaskTable0M0_container
; ---------------------------------
_dummy_cpct_transparentMaskTable0M0_container::
	.area _g_tablatrans_ (ABS) 
	.org 0x200 
	 _g_tablatrans::
	.db 0xFF, 0xAA, 0x55, 0x00, 0xAA, 0xAA, 0x00, 0x00 
	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
	.area _CSEG (REL, CON) 
;src/main.c:46: void myInterruptHandler()
;	---------------------------------
; Function myInterruptHandler
; ---------------------------------
_myInterruptHandler::
;src/main.c:49: i_time++;
	ld	iy, #_i_time
	inc	0 (iy)
	jr	NZ,00109$
	inc	1 (iy)
	jr	NZ,00109$
	inc	2 (iy)
	jr	NZ,00109$
	inc	3 (iy)
00109$:
;src/main.c:51: if (++g_nInterrupt == 6)
	ld	iy, #_g_nInterrupt
	inc	0 (iy)
	ld	a, 0 (iy)
	sub	a, #0x06
	ret	NZ
;src/main.c:53: cpct_scanKeyboard_f();
	call	_cpct_scanKeyboard_f
;src/main.c:54: g_nInterrupt = 0;
	ld	hl,#_g_nInterrupt + 0
	ld	(hl), #0x00
	ret
_wp:
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x0a	; 10
	.db #0x64	; 100	'd'
	.db #0x28	; 40
	.db #0xb4	; 180
	.db #0x46	; 70	'F'
	.db #0x64	; 100	'd'
;src/main.c:58: void eraseCharacter(TCharacter *c){
;	---------------------------------
; Function eraseCharacter
; ---------------------------------
_eraseCharacter::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:62: x=c->px/256;
	ld	e,4 (ix)
	ld	d,5 (ix)
	ld	l, e
	ld	h, d
	ld	bc, #0x0004
	add	hl, bc
	ld	b, (hl)
	inc	hl
	ld	c, (hl)
;src/main.c:63: y=c->py/256;
	ex	de,hl
	ld	de, #0x0006
	add	hl, de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
;src/main.c:65: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, x, y);
	ld	e, c
	push	de
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:66: cpct_drawSolidBox (pvmem, cpct_px2byteM0 (0, 0), CH_WIDTH, CH_HEIGHT);
	push	hl
	ld	hl, #0x0000
	push	hl
	call	_cpct_px2byteM0
	ld	d, l
	pop	bc
	ld	hl, #0x0606
	push	hl
	push	de
	inc	sp
	push	bc
	call	_cpct_drawSolidBox
	pop	af
	pop	af
	inc	sp
	pop	ix
	ret
;src/main.c:69: void printCharacter(TCharacter *c){
;	---------------------------------
; Function printCharacter
; ---------------------------------
_printCharacter::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;src/main.c:75: x = c->x >> 8;
	ld	e,4 (ix)
	ld	d,5 (ix)
	ld	l, e
	ld	h, d
	ld	b, (hl)
	inc	hl
	ld	c, (hl)
;src/main.c:76: y = c->y >> 8;
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	ld	a, (hl)
	inc	hl
	ld	b, (hl)
;src/main.c:78: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, x, y);
	push	bc
	push	de
	push	bc
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
	pop	de
	pop	bc
;src/main.c:79: cpct_drawSolidBox (pvmem, cpct_px2byteM0 (CH_COLOR, CH_COLOR), CH_WIDTH, CH_HEIGHT);
	push	hl
	push	bc
	push	de
	ld	hl, #0x0303
	push	hl
	call	_cpct_px2byteM0
	ld	-1 (ix), l
	pop	de
	pop	bc
	pop	iy
	push	bc
	push	de
	ld	hl, #0x0606
	push	hl
	ld	a, -1 (ix)
	push	af
	inc	sp
	push	iy
	call	_cpct_drawSolidBox
	pop	af
	pop	af
	inc	sp
	pop	de
	pop	bc
;src/main.c:81: if (c->dir<32){
	push	de
	pop	iy
	ld	e, 14 (iy)
;src/main.c:82: x = x + 4;
	ld	l, c
	inc	l
	inc	l
	inc	l
	inc	l
;src/main.c:83: y = y + 2;
	ld	d, b
	inc	d
	inc	d
;src/main.c:81: if (c->dir<32){
	ld	a, e
	sub	a, #0x20
	jr	NC,00120$
;src/main.c:82: x = x + 4;
	ld	c, l
;src/main.c:83: y = y + 2;
	ld	b, d
	jr	00121$
00120$:
;src/main.c:84: } else if (c->dir<64){
	ld	a, e
	sub	a, #0x40
	jr	NC,00117$
;src/main.c:85: x = x + 4;
	ld	c, l
;src/main.c:86: y = y;
	jr	00121$
00117$:
;src/main.c:88: x = x + 2;
	ld	h, c
	inc	h
	inc	h
;src/main.c:87: } else if (c->dir<96){
	ld	a, e
	sub	a, #0x60
	jr	NC,00114$
;src/main.c:88: x = x + 2;
	ld	c, h
;src/main.c:89: y = y;
	jr	00121$
00114$:
;src/main.c:90: } else if (c->dir<128){
;src/main.c:93: } else if (c->dir<160){
	ld	a,e
	cp	a,#0x80
	jr	C,00121$
	sub	a, #0xa0
	jr	NC,00108$
;src/main.c:95: y = y+2;
	ld	b, d
	jr	00121$
00108$:
;src/main.c:98: y = y+4;
	inc	b
	inc	b
	inc	b
	inc	b
;src/main.c:96: } else if (c->dir<196){
;src/main.c:98: y = y+4;
;src/main.c:99: } else if (c->dir<228){
	ld	a,e
	cp	a,#0xc4
	jr	C,00121$
	sub	a, #0xe4
	jr	NC,00102$
;src/main.c:100: x = x+2;
	ld	c, h
;src/main.c:101: y = y+4;
	jr	00121$
00102$:
;src/main.c:103: x = x+4;
	ld	c, l
;src/main.c:104: y = y+4;
00121$:
;src/main.c:106: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, x, y);
	push	bc
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:107: cpct_drawSolidBox (pvmem, cpct_px2byteM0 (14, 14), 2, 2);
	push	hl
	ld	hl, #0x0e0e
	push	hl
	call	_cpct_px2byteM0
	ld	d, l
	pop	bc
	ld	hl, #0x0202
	push	hl
	push	de
	inc	sp
	push	bc
	call	_cpct_drawSolidBox
	pop	af
	pop	af
	inc	sp
	inc	sp
	pop	ix
	ret
;src/main.c:110: void printWayPoints(){
;	---------------------------------
; Function printWayPoints
; ---------------------------------
_printWayPoints::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;src/main.c:113: for (i=0; i<4; i++){
	ld	-1 (ix), #0x00
00102$:
;src/main.c:114: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, wp[i].x, wp[i].y);
	ld	l, -1 (ix)
	ld	h, #0x00
	add	hl, hl
	ld	bc,#_wp
	add	hl,bc
	ld	c,l
	ld	b,h
	inc	hl
	ld	d, (hl)
	ld	a, (bc)
	ld	e,a
	push	de
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:115: cpct_drawSolidBox (pvmem, cpct_px2byteM0 (WP_COLOR, WP_COLOR), WP_WIDTH, WP_HEIGHT);
	push	hl
	ld	hl, #0x0101
	push	hl
	call	_cpct_px2byteM0
	ld	d, l
	pop	bc
	ld	hl, #0x0402
	push	hl
	push	de
	inc	sp
	push	bc
	call	_cpct_drawSolidBox
	pop	af
	pop	af
	inc	sp
;src/main.c:113: for (i=0; i<4; i++){
	inc	-1 (ix)
	ld	a, -1 (ix)
	sub	a, #0x04
	jr	C,00102$
	inc	sp
	pop	ix
	ret
;src/main.c:119: void eraseDebugInfo(){
;	---------------------------------
; Function eraseDebugInfo
; ---------------------------------
_eraseDebugInfo::
;src/main.c:121: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, 50, 0);
	ld	hl, #0x0032
	push	hl
	ld	hl, #0xc000
	push	hl
	call	_cpct_getScreenPtr
;src/main.c:122: cpct_drawSolidBox (pvmem, cpct_px2byteM0 (0, 0), 29, 64);    
	push	hl
	ld	hl, #0x0000
	push	hl
	call	_cpct_px2byteM0
	ld	d, l
	pop	bc
	ld	hl, #0x401d
	push	hl
	push	de
	inc	sp
	push	bc
	call	_cpct_drawSolidBox
	pop	af
	pop	af
	inc	sp
	ret
;src/main.c:125: void printDebugInfo(TCharacter *c){
;	---------------------------------
; Function printDebugInfo
; ---------------------------------
_printDebugInfo::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-24
	add	hl, sp
	ld	sp, hl
;src/main.c:128: sprintf(auxTxt, "X %1d", c->x);
	ld	a, 4 (ix)
	ld	-2 (ix), a
	ld	a, 5 (ix)
	ld	-1 (ix), a
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	hl, #0x0000
	add	hl, sp
	push	hl
	push	de
	ld	de, #___str_0
	push	de
	push	hl
	call	_sprintf
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
	pop	bc
;src/main.c:129: drawText(auxTxt, 50, 0, COLORTXT_BLUE, NORMALHEIGHT, TRANSPARENT);
	ld	e, c
	ld	d, b
	push	bc
	ld	hl, #0x0101
	push	hl
	ld	hl, #0x0300
	push	hl
	ld	a, #0x32
	push	af
	inc	sp
	push	de
	call	_drawText
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
	pop	bc
;src/main.c:130: sprintf(auxTxt, "Y %1d", c->y);
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	inc	hl
	inc	hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	l, c
	ld	h, b
	push	bc
	push	de
	ld	de, #___str_1
	push	de
	push	hl
	call	_sprintf
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
	pop	bc
;src/main.c:131: drawText(auxTxt, 50, 8, COLORTXT_BLUE, NORMALHEIGHT, TRANSPARENT);  
	ld	e, c
	ld	d, b
	push	bc
	ld	hl, #0x0101
	push	hl
	ld	hl, #0x0308
	push	hl
	ld	a, #0x32
	push	af
	inc	sp
	push	de
	call	_drawText
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
	pop	bc
;src/main.c:132: sprintf(auxTxt, "DIR %1d", c->dir);
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	de, #0x000e
	add	hl, de
	ld	e, (hl)
	ld	d, #0x00
	ld	l, c
	ld	h, b
	push	bc
	push	de
	ld	de, #___str_2
	push	de
	push	hl
	call	_sprintf
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
	pop	bc
;src/main.c:133: drawText(auxTxt, 50, 16, COLORTXT_BLUE, NORMALHEIGHT, TRANSPARENT);  
	ld	e, c
	ld	d, b
	push	bc
	ld	hl, #0x0101
	push	hl
	ld	hl, #0x0310
	push	hl
	ld	a, #0x32
	push	af
	inc	sp
	push	de
	call	_drawText
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
	pop	bc
;src/main.c:134: sprintf(auxTxt, "ACC %1d", c->a);
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	de, #0x000c
	add	hl, de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	l, c
	ld	h, b
	push	bc
	push	de
	ld	de, #___str_3
	push	de
	push	hl
	call	_sprintf
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
	pop	bc
;src/main.c:135: drawText(auxTxt, 50, 24, COLORTXT_BLUE, NORMALHEIGHT, TRANSPARENT);
	ld	e, c
	ld	d, b
	push	bc
	ld	hl, #0x0101
	push	hl
	ld	hl, #0x0318
	push	hl
	ld	a, #0x32
	push	af
	inc	sp
	push	de
	call	_drawText
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
	pop	bc
;src/main.c:136: sprintf(auxTxt, "VX %1d", c->vx);
	ld	a, -2 (ix)
	add	a, #0x08
	ld	-4 (ix), a
	ld	a, -1 (ix)
	adc	a, #0x00
	ld	-3 (ix), a
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	l, c
	ld	h, b
	push	bc
	push	de
	ld	de, #___str_4
	push	de
	push	hl
	call	_sprintf
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
	pop	bc
;src/main.c:137: drawText(auxTxt, 50, 32, COLORTXT_BLUE, NORMALHEIGHT, TRANSPARENT);
	ld	e, c
	ld	d, b
	push	bc
	ld	hl, #0x0101
	push	hl
	ld	hl, #0x0320
	push	hl
	ld	a, #0x32
	push	af
	inc	sp
	push	de
	call	_drawText
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
	pop	bc
;src/main.c:138: sprintf(auxTxt, "VY %1d", c->vx);
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	l, c
	ld	h, b
	push	bc
	push	de
	ld	de, #___str_5
	push	de
	push	hl
	call	_sprintf
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
	pop	bc
;src/main.c:139: drawText(auxTxt, 50, 40, COLORTXT_BLUE, NORMALHEIGHT, TRANSPARENT);
	ld	e, c
	ld	d, b
	push	bc
	ld	hl, #0x0101
	push	hl
	ld	hl, #0x0328
	push	hl
	ld	a, #0x32
	push	af
	inc	sp
	push	de
	call	_drawText
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
	pop	bc
;src/main.c:140: sprintf(auxTxt, "T %1d", c->target);
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	de, #0x0010
	add	hl, de
	ld	e, (hl)
	ld	d, #0x00
	ld	l, c
	ld	h, b
	push	bc
	push	de
	ld	de, #___str_6
	push	de
	push	hl
	call	_sprintf
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
	pop	bc
;src/main.c:141: drawText(auxTxt, 50, 48, COLORTXT_BLUE, NORMALHEIGHT, TRANSPARENT);
	ld	hl, #0x0101
	push	hl
	ld	hl, #0x0330
	push	hl
	ld	a, #0x32
	push	af
	inc	sp
	push	bc
	call	_drawText
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
;src/main.c:142: wait4OneKey();
	call	_wait4OneKey
;src/main.c:143: eraseDebugInfo();
	call	_eraseDebugInfo
	ld	sp, ix
	pop	ix
	ret
___str_0:
	.ascii "X %1d"
	.db 0x00
___str_1:
	.ascii "Y %1d"
	.db 0x00
___str_2:
	.ascii "DIR %1d"
	.db 0x00
___str_3:
	.ascii "ACC %1d"
	.db 0x00
___str_4:
	.ascii "VX %1d"
	.db 0x00
___str_5:
	.ascii "VY %1d"
	.db 0x00
___str_6:
	.ascii "T %1d"
	.db 0x00
;src/main.c:146: void getCharacterInput(TCharacter *c){
;	---------------------------------
; Function getCharacterInput
; ---------------------------------
_getCharacterInput::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;src/main.c:148: if (cpct_isKeyPressed(Key_O)){
	ld	hl, #0x0404
	call	_cpct_isKeyPressed
;src/main.c:149: c->dir = c->dir + 32;
	ld	a, 4 (ix)
	ld	-2 (ix), a
	ld	a, 5 (ix)
	ld	-1 (ix), a
	ld	a, -2 (ix)
	add	a, #0x0e
	ld	c, a
	ld	a, -1 (ix)
	adc	a, #0x00
	ld	b, a
;src/main.c:148: if (cpct_isKeyPressed(Key_O)){
	ld	a, l
	or	a, a
	jr	Z,00102$
;src/main.c:149: c->dir = c->dir + 32;
	ld	a, (bc)
	add	a, #0x20
	ld	(bc), a
00102$:
;src/main.c:151: if (cpct_isKeyPressed(Key_P)){
	push	bc
	ld	hl, #0x0803
	call	_cpct_isKeyPressed
	pop	bc
	ld	a, l
	or	a, a
	jr	Z,00104$
;src/main.c:152: c->dir = c->dir - 32;
	ld	a, (bc)
	add	a, #0xe0
	ld	(bc), a
00104$:
;src/main.c:154: if (cpct_isKeyPressed(Key_Q)){
	ld	hl, #0x0808
	call	_cpct_isKeyPressed
;src/main.c:164: c->a = 0;
	ld	a, -2 (ix)
	add	a, #0x0c
	ld	c, a
	ld	a, -1 (ix)
	adc	a, #0x00
	ld	b, a
;src/main.c:154: if (cpct_isKeyPressed(Key_Q)){
	ld	a, l
	or	a, a
	jr	Z,00106$
;src/main.c:155: c->a = c->a + 1;
	ld	l, c
	ld	h, b
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	inc	de
	ld	l, c
	ld	h, b
	ld	(hl), e
	inc	hl
	ld	(hl), d
00106$:
;src/main.c:157: if ((cpct_isKeyPressed(Key_A)) && (c->a > 0)){
	push	bc
	ld	hl, #0x2008
	call	_cpct_isKeyPressed
	pop	bc
	ld	a, l
	or	a, a
	jr	Z,00108$
	ld	l, c
	ld	h, b
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	xor	a, a
	cp	a, e
	sbc	a, d
	jp	PO, 00151$
	xor	a, #0x80
00151$:
	jp	P, 00108$
;src/main.c:158: c->a = c->a - 1;
	dec	de
	ld	l, c
	ld	h, b
	ld	(hl), e
	inc	hl
	ld	(hl), d
00108$:
;src/main.c:161: if (cpct_isKeyPressed(Key_Space)){
	push	bc
	ld	hl, #0x8005
	call	_cpct_isKeyPressed
	pop	bc
	ld	a, l
	or	a, a
	jr	Z,00114$
;src/main.c:162: if (c->motion){
	ld	a, -2 (ix)
	add	a, #0x0f
	ld	l, a
	ld	a, -1 (ix)
	adc	a, #0x00
	ld	h, a
	ld	a, (hl)
	or	a, a
	jr	Z,00111$
;src/main.c:163: c->motion = 0;
	ld	(hl), #0x00
;src/main.c:164: c->a = 0;
	ld	a, #0x00
	ld	(bc), a
	inc	bc
	ld	a, #0x00
	ld	(bc), a
	jr	00114$
00111$:
;src/main.c:166: c->motion = 1;
	ld	(hl), #0x01
;src/main.c:167: c->a = 2;
	ld	a, #0x02
	ld	(bc), a
	inc	bc
	ld	a, #0x00
	ld	(bc), a
00114$:
;src/main.c:171: if (cpct_isKeyPressed(Key_D)){
	ld	hl, #0x2007
	call	_cpct_isKeyPressed
	ld	a, l
	or	a, a
	jr	Z,00117$
;src/main.c:172: printDebugInfo(c);
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_printDebugInfo
	pop	af
00117$:
	ld	sp, ix
	pop	ix
	ret
;src/main.c:177: void motionUpdate(TCharacter *c){
;	---------------------------------
; Function motionUpdate
; ---------------------------------
_motionUpdate::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
	dec	sp
;src/main.c:182: xc = c->x >> 8;
	ld	a, 4 (ix)
	ld	-2 (ix), a
	ld	a, 5 (ix)
	ld	-1 (ix), a
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	c, (hl)
	inc	hl
	ld	c, (hl)
;src/main.c:183: yc = c->y >> 8;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	inc	hl
	inc	hl
	ld	b, (hl)
	inc	hl
	ld	b, (hl)
;src/main.c:186: if (abs((xc - wp[c->target].x) < 2) && (abs((yc - wp[c->target].y) < 2))){
	ld	-4 (ix), c
	ld	-3 (ix), #0x00
	ld	a, -2 (ix)
	add	a, #0x10
	ld	e, a
	ld	a, -1 (ix)
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
	ld	l, a
	ld	h, #0x00
	add	hl, hl
	ld	a, #<(_wp)
	add	a, l
	ld	l, a
	ld	a, #>(_wp)
	adc	a, h
	ld	h, a
	ld	l, (hl)
	ld	h, #0x00
	ld	a, -4 (ix)
	sub	a, l
	ld	l, a
	ld	a, -3 (ix)
	sbc	a, h
	ld	h, a
	ld	a, l
	sub	a, #0x02
	ld	a, h
	rla
	ccf
	rra
	sbc	a, #0x80
	ld	a, #0x00
	rla
	ld	l, a
	ld	h, #0x00
	push	de
	push	hl
	call	_abs
	pop	af
	pop	de
	ld	a, h
	or	a,l
	jr	Z,00102$
	ld	-4 (ix), b
	ld	-3 (ix), #0x00
	ld	a, (de)
	ld	l, a
	ld	h, #0x00
	add	hl, hl
	ld	a, #<(_wp)
	add	a, l
	ld	l, a
	ld	a, #>(_wp)
	adc	a, h
	ld	h, a
	inc	hl
	ld	l, (hl)
	ld	h, #0x00
	ld	a, -4 (ix)
	sub	a, l
	ld	l, a
	ld	a, -3 (ix)
	sbc	a, h
	ld	h, a
	ld	a, l
	sub	a, #0x02
	ld	a, h
	rla
	ccf
	rra
	sbc	a, #0x80
	ld	a, #0x00
	rla
	ld	l, a
	ld	h, #0x00
	push	de
	push	hl
	call	_abs
	pop	af
	pop	de
	ld	a, h
	or	a,l
	jr	Z,00102$
;src/main.c:188: c->target = ((c->target+1) % WP_NUMBER);
	ld	a, (de)
	ld	l, a
	ld	h, #0x00
	inc	hl
	push	hl
	pop	iy
	push	bc
	push	de
	ld	hl, #0x0004
	push	hl
	push	iy
	call	__modsint
	pop	af
	pop	af
	pop	de
	pop	bc
	ld	a, l
	ld	(de), a
;src/main.c:189: printDebugInfo(c);
	push	bc
	push	de
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	push	hl
	call	_printDebugInfo
	pop	af
	pop	de
	pop	bc
00102$:
;src/main.c:191: xwp = wp[c->target].x;
	ld	a, (de)
	ld	l, a
	ld	h, #0x00
	add	hl, hl
	ld	de, #_wp
	add	hl, de
	ld	a, (hl)
	ld	-5 (ix), a
;src/main.c:192: ywp = wp[c->target].y;
	inc	hl
	ld	h, (hl)
;src/main.c:194: if (ywp < yc){
	ld	a, h
	sub	a, b
	ld	a, #0x00
	rla
	ld	l, a
;src/main.c:195: c->dir = 96;
	ld	a, -2 (ix)
	add	a, #0x0e
	ld	e, a
	ld	a, -1 (ix)
	adc	a, #0x00
	ld	d, a
;src/main.c:196: } else if (ywp > yc){
	ld	a, b
	sub	a, h
	ld	a, #0x00
	rla
	ld	b, a
;src/main.c:193: if (xwp < xc){
	ld	a, -5 (ix)
	sub	a, c
	jr	NC,00123$
;src/main.c:194: if (ywp < yc){
	ld	a, l
	or	a, a
	jr	Z,00108$
;src/main.c:195: c->dir = 96;
	ld	a, #0x60
	ld	(de), a
	jr	00125$
00108$:
;src/main.c:196: } else if (ywp > yc){
	ld	a, b
	or	a, a
	jr	Z,00105$
;src/main.c:197: c->dir = 160;
	ld	a, #0xa0
	ld	(de), a
	jr	00125$
00105$:
;src/main.c:199: c->dir = 128;
	ld	a, #0x80
	ld	(de), a
	jr	00125$
00123$:
;src/main.c:200: } else if (xwp > xc){
	ld	a, c
	sub	a, -5 (ix)
	jr	NC,00120$
;src/main.c:201: if (ywp < yc){
	ld	a, l
	or	a, a
	jr	Z,00114$
;src/main.c:202: c->dir = 32;
	ld	a, #0x20
	ld	(de), a
	jr	00125$
00114$:
;src/main.c:203: } else if (ywp > yc){
	ld	a, b
	or	a, a
	jr	Z,00111$
;src/main.c:204: c->dir = 224;
	ld	a, #0xe0
	ld	(de), a
	jr	00125$
00111$:
;src/main.c:206: c->dir = 0;
	xor	a, a
	ld	(de), a
	jr	00125$
00120$:
;src/main.c:207: } else if (ywp < yc){
	ld	a, l
	or	a, a
	jr	Z,00117$
;src/main.c:208: c->dir = 64;
	ld	a, #0x40
	ld	(de), a
	jr	00125$
00117$:
;src/main.c:210: c->dir = 192;
	ld	a, #0xc0
	ld	(de), a
00125$:
	ld	sp, ix
	pop	ix
	ret
;src/main.c:213: void updateCharacter(TCharacter *c){
;	---------------------------------
; Function updateCharacter
; ---------------------------------
_updateCharacter::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-8
	add	hl, sp
	ld	sp, hl
;src/main.c:215: if (c->motion)
	ld	c,4 (ix)
	ld	b,5 (ix)
	push	bc
	pop	iy
	ld	a, 15 (iy)
	or	a, a
	jr	Z,00102$
;src/main.c:216: motionUpdate(c);
	push	bc
	push	bc
	call	_motionUpdate
	pop	af
	pop	bc
00102$:
;src/main.c:220: c->vx = (c->a * cosine(c->dir * DIR_STEP));
	ld	hl, #0x0008
	add	hl,bc
	ld	-4 (ix), l
	ld	-3 (ix), h
	ld	hl, #0x000c
	add	hl,bc
	ld	-6 (ix), l
	ld	-5 (ix), h
	ld	a, (hl)
	ld	-8 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-7 (ix), a
	ld	hl, #0x000e
	add	hl,bc
	ld	-2 (ix), l
	ld	-1 (ix), h
	ld	d, (hl)
	push	bc
	push	de
	inc	sp
	call	___uchar2fs
	inc	sp
	ex	de, hl
	push	hl
	push	de
	ld	hl, #0x3fb3
	push	hl
	ld	hl, #0x3333
	push	hl
	call	___fsmul
	pop	af
	pop	af
	pop	af
	pop	af
	push	de
	push	hl
	call	___fs2sint
	pop	af
	ex	(sp),hl
	call	_cosine
	ex	(sp),hl
	ld	l,-8 (ix)
	ld	h,-7 (ix)
	push	hl
	call	__mulint
	pop	af
	pop	af
	ex	de,hl
	pop	bc
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	(hl), e
	inc	hl
	ld	(hl), d
;src/main.c:221: c->vy = - (c->a * sine(c->dir * DIR_STEP));
	ld	hl, #0x000a
	add	hl,bc
	ex	(sp), hl
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	ld	a, (hl)
	ld	-6 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-5 (ix), a
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	d, (hl)
	push	bc
	push	de
	inc	sp
	call	___uchar2fs
	inc	sp
	ex	de, hl
	push	hl
	push	de
	ld	hl, #0x3fb3
	push	hl
	ld	hl, #0x3333
	push	hl
	call	___fsmul
	pop	af
	pop	af
	pop	af
	pop	af
	push	de
	push	hl
	call	___fs2sint
	pop	af
	ex	(sp),hl
	call	_sine
	ex	(sp),hl
	ld	l,-6 (ix)
	ld	h,-5 (ix)
	push	hl
	call	__mulint
	pop	af
	pop	af
	pop	bc
	xor	a, a
	sub	a, l
	ld	e, a
	ld	a, #0x00
	sbc	a, h
	ld	d, a
	pop	hl
	push	hl
	ld	(hl), e
	inc	hl
	ld	(hl), d
;src/main.c:236: c->x = c->x + c->vx;
	ld	l, c
	ld	h, b
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	add	hl,de
	ex	de,hl
	ld	l, c
	ld	h, b
	ld	(hl), e
	inc	hl
	ld	(hl), d
;src/main.c:237: c->y = c->y + c->vy;
	inc	bc
	inc	bc
	ld	l, c
	ld	h, b
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	pop	hl
	push	hl
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	add	hl,de
	ex	de,hl
	ld	a, e
	ld	(bc), a
	inc	bc
	ld	a, d
	ld	(bc), a
	ld	sp, ix
	pop	ix
	ret
;src/main.c:244: void init(TCharacter *c){
;	---------------------------------
; Function init
; ---------------------------------
_init::
	push	ix
	ld	ix,#0
	add	ix,sp
;src/main.c:246: g_nInterrupt = 0; // Manage Interrupt
	ld	hl,#_g_nInterrupt + 0
	ld	(hl), #0x00
;src/main.c:247: i_time = 0;
	xor	a, a
	ld	iy, #_i_time
	ld	0 (iy), a
	ld	1 (iy), a
	ld	2 (iy), a
	ld	3 (iy), a
;src/main.c:248: cpct_setInterruptHandler((void*) myInterruptHandler);
	ld	hl, #_myInterruptHandler
	call	_cpct_setInterruptHandler
;src/main.c:249: cpct_setVideoMode(0);
	ld	l, #0x00
	call	_cpct_setVideoMode
;src/main.c:251: c->x = 20 << 8;
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	l, c
	ld	h, b
	ld	(hl), #0x00
	inc	hl
	ld	(hl), #0x14
;src/main.c:252: c->px = c->x ;
	ld	iy, #0x0004
	add	iy, bc
	ld	l, c
	ld	h, b
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	0 (iy), e
	ld	1 (iy), d
;src/main.c:253: c->y = 20 << 8;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	ld	(hl), #0x00
	inc	hl
	ld	(hl), #0x14
	dec	hl
;src/main.c:254: c->py = c->y;
	ld	iy, #0x0006
	add	iy, bc
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	0 (iy), e
	ld	1 (iy), d
;src/main.c:255: c->vx = 0;
	ld	hl, #0x0008
	add	hl, bc
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
;src/main.c:256: c->vy = 0;
	ld	hl, #0x000a
	add	hl, bc
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
;src/main.c:257: c->a = 0;
	ld	hl, #0x000c
	add	hl, bc
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
;src/main.c:258: c->dir = 0;
	ld	hl, #0x000e
	add	hl, bc
	ld	(hl), #0x00
;src/main.c:259: c->motion = 0;
	ld	hl, #0x000f
	add	hl, bc
	ld	(hl), #0x00
;src/main.c:260: c->target = 0;
	ld	hl, #0x0010
	add	hl, bc
	ld	(hl), #0x00
;src/main.c:262: printWayPoints();
	call	_printWayPoints
;src/main.c:264: pause = 0;
	ld	hl,#_pause + 0
	ld	(hl), #0x00
	pop	ix
	ret
;src/main.c:268: void main(void) {
;	---------------------------------
; Function main
; ---------------------------------
_main::
	push	ix
	ld	hl, #-17
	add	hl, sp
	ld	sp, hl
;src/main.c:272: init(&c);
	ld	hl, #0x0000
	add	hl, sp
	ld	c, l
	ld	b, h
	ld	e, c
	ld	d, b
	push	bc
	push	de
	call	_init
	pop	af
	pop	bc
;src/main.c:274: printCharacter(&c);
	ld	e, c
	ld	d, b
	push	bc
	push	de
	call	_printCharacter
	pop	af
	pop	bc
;src/main.c:277: while (1){    
00102$:
;src/main.c:279: cpct_waitHalts(100);
	push	bc
	ld	l, #0x64
	call	_cpct_waitHalts
	pop	bc
;src/main.c:280: getCharacterInput(&c);
	ld	e, c
	ld	d, b
	push	bc
	push	de
	call	_getCharacterInput
	pop	af
	pop	bc
;src/main.c:281: updateCharacter(&c);
	ld	e, c
	ld	d, b
	push	bc
	push	de
	call	_updateCharacter
	pop	af
	pop	bc
;src/main.c:282: eraseCharacter(&c);
	ld	e, c
	ld	d, b
	push	bc
	push	de
	call	_eraseCharacter
	pop	af
	pop	bc
;src/main.c:283: printCharacter(&c);
	ld	e, c
	ld	d, b
	push	bc
	push	de
	call	_printCharacter
	pop	af
	pop	bc
;src/main.c:284: c.px = c.x;
	ld	iy, #0x0004
	add	iy, bc
	ld	l, c
	ld	h, b
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	0 (iy), e
	ld	1 (iy), d
;src/main.c:285: c.py = c.y;
	ld	iy, #0x0006
	add	iy, bc
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	0 (iy), e
	ld	1 (iy), d
	jr	00102$
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
