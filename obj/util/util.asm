;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.8 #9946 (Linux)
;--------------------------------------------------------
	.module util
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _wait4OneKey
	.globl _cpct_isAnyKeyPressed
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
;src/util/util.c:11: void wait4OneKey()
;	---------------------------------
; Function wait4OneKey
; ---------------------------------
_wait4OneKey::
;src/util/util.c:14: while (cpct_isAnyKeyPressed());
00101$:
	call	_cpct_isAnyKeyPressed
	ld	a, l
	or	a, a
	jr	NZ,00101$
;src/util/util.c:17: while (!cpct_isAnyKeyPressed());
00104$:
	call	_cpct_isAnyKeyPressed
	ld	a, l
	or	a, a
	jr	Z,00104$
;src/util/util.c:19: return;
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
