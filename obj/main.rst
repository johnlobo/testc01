                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Mac OS X x86_64)
                              4 ;--------------------------------------------------------
                              5 	.module main
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _main
                             12 	.globl _init
                             13 	.globl _updateCharacter
                             14 	.globl _motionUpdate
                             15 	.globl _getCharacterInput
                             16 	.globl _printDebugInfo
                             17 	.globl _eraseDebugInfo
                             18 	.globl _printWayPoints
                             19 	.globl _printCharacter
                             20 	.globl _eraseCharacter
                             21 	.globl _myInterruptHandler
                             22 	.globl _wait4OneKey
                             23 	.globl _cosine
                             24 	.globl _sine
                             25 	.globl _drawText
                             26 	.globl _abs
                             27 	.globl _cpct_getScreenPtr
                             28 	.globl _cpct_setVideoMode
                             29 	.globl _cpct_drawSolidBox
                             30 	.globl _cpct_px2byteM0
                             31 	.globl _cpct_isKeyPressed
                             32 	.globl _cpct_scanKeyboard_f
                             33 	.globl _cpct_waitHalts
                             34 	.globl _cpct_setInterruptHandler
                             35 	.globl _sprintf
                             36 	.globl _i_time
                             37 	.globl _g_nInterrupt
                             38 	.globl _pause
                             39 	.globl _wp
                             40 ;--------------------------------------------------------
                             41 ; special function registers
                             42 ;--------------------------------------------------------
                             43 ;--------------------------------------------------------
                             44 ; ram data
                             45 ;--------------------------------------------------------
                             46 	.area _DATA
   1B83                      47 _pause::
   1B83                      48 	.ds 1
   1B84                      49 _g_nInterrupt::
   1B84                      50 	.ds 1
   1B85                      51 _i_time::
   1B85                      52 	.ds 4
                             53 ;--------------------------------------------------------
                             54 ; ram data
                             55 ;--------------------------------------------------------
                             56 	.area _INITIALIZED
                             57 ;--------------------------------------------------------
                             58 ; absolute external ram data
                             59 ;--------------------------------------------------------
                             60 	.area _DABS (ABS)
                             61 ;--------------------------------------------------------
                             62 ; global & static initialisations
                             63 ;--------------------------------------------------------
                             64 	.area _HOME
                             65 	.area _GSINIT
                             66 	.area _GSFINAL
                             67 	.area _GSINIT
                             68 ;--------------------------------------------------------
                             69 ; Home
                             70 ;--------------------------------------------------------
                             71 	.area _HOME
                             72 	.area _HOME
                             73 ;--------------------------------------------------------
                             74 ; code
                             75 ;--------------------------------------------------------
                             76 	.area _CODE
                             77 ;src/main.c:29: cpctm_createTransparentMaskTable(g_tablatrans, 0x200, M0, 0);
                             78 ;	---------------------------------
                             79 ; Function dummy_cpct_transparentMaskTable0M0_container
                             80 ; ---------------------------------
   0300                      81 _dummy_cpct_transparentMaskTable0M0_container::
                             82 	.area _g_tablatrans_ (ABS) 
   0200                      83 	.org 0x200 
   0200                      84 	 _g_tablatrans::
   0200 FF AA 55 00 AA AA    85 	.db 0xFF, 0xAA, 0x55, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0208 55 00 55 00 00 00    86 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0210 AA AA 00 00 AA AA    87 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0218 00 00 00 00 00 00    88 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0220 55 00 55 00 00 00    89 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0228 55 00 55 00 00 00    90 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0230 00 00 00 00 00 00    91 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0238 00 00 00 00 00 00    92 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0240 AA AA 00 00 AA AA    93 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0248 00 00 00 00 00 00    94 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0250 AA AA 00 00 AA AA    95 	.db 0xAA, 0xAA, 0x00, 0x00, 0xAA, 0xAA, 0x00, 0x00 
        00 00
   0258 00 00 00 00 00 00    96 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0260 00 00 00 00 00 00    97 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0268 00 00 00 00 00 00    98 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0270 00 00 00 00 00 00    99 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0278 00 00 00 00 00 00   100 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0280 55 00 55 00 00 00   101 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0288 55 00 55 00 00 00   102 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0290 00 00 00 00 00 00   103 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   0298 00 00 00 00 00 00   104 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   02A0 55 00 55 00 00 00   105 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   02A8 55 00 55 00 00 00   106 	.db 0x55, 0x00, 0x55, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   02B0 00 00 00 00 00 00   107 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   02B8 00 00 00 00 00 00   108 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   02C0 00 00 00 00 00 00   109 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   02C8 00 00 00 00 00 00   110 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   02D0 00 00 00 00 00 00   111 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   02D8 00 00 00 00 00 00   112 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   02E0 00 00 00 00 00 00   113 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   02E8 00 00 00 00 00 00   114 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   02F0 00 00 00 00 00 00   115 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
   02F8 00 00 00 00 00 00   116 	.db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 
        00 00
                            117 	.area _CSEG (REL, CON) 
                            118 ;src/main.c:46: void myInterruptHandler()
                            119 ;	---------------------------------
                            120 ; Function myInterruptHandler
                            121 ; ---------------------------------
   23D6                     122 _myInterruptHandler::
                            123 ;src/main.c:48: i_time++;
   23D6 FD 21 85 1B   [14]  124 	ld	iy, #_i_time
   23DA FD 34 00      [23]  125 	inc	0 (iy)
   23DD 20 0D         [12]  126 	jr	NZ,00109$
   23DF FD 34 01      [23]  127 	inc	1 (iy)
   23E2 20 08         [12]  128 	jr	NZ,00109$
   23E4 FD 34 02      [23]  129 	inc	2 (iy)
   23E7 20 03         [12]  130 	jr	NZ,00109$
   23E9 FD 34 03      [23]  131 	inc	3 (iy)
   23EC                     132 00109$:
                            133 ;src/main.c:50: if (++g_nInterrupt == 6)
   23EC FD 21 84 1B   [14]  134 	ld	iy, #_g_nInterrupt
   23F0 FD 34 00      [23]  135 	inc	0 (iy)
   23F3 FD 7E 00      [19]  136 	ld	a, 0 (iy)
   23F6 D6 06         [ 7]  137 	sub	a, #0x06
   23F8 C0            [11]  138 	ret	NZ
                            139 ;src/main.c:52: cpct_scanKeyboard_f();
   23F9 CD 4E 0C      [17]  140 	call	_cpct_scanKeyboard_f
                            141 ;src/main.c:53: g_nInterrupt = 0;
   23FC 21 84 1B      [10]  142 	ld	hl,#_g_nInterrupt + 0
   23FF 36 00         [10]  143 	ld	(hl), #0x00
   2401 C9            [10]  144 	ret
   2402                     145 _wp:
   2402 01                  146 	.db #0x01	; 1
   2403 01                  147 	.db #0x01	; 1
   2404 0A                  148 	.db #0x0a	; 10
   2405 64                  149 	.db #0x64	; 100	'd'
   2406 28                  150 	.db #0x28	; 40
   2407 B4                  151 	.db #0xb4	; 180
   2408 46                  152 	.db #0x46	; 70	'F'
   2409 64                  153 	.db #0x64	; 100	'd'
                            154 ;src/main.c:57: void eraseCharacter(TCharacter *c){
                            155 ;	---------------------------------
                            156 ; Function eraseCharacter
                            157 ; ---------------------------------
   240A                     158 _eraseCharacter::
   240A DD E5         [15]  159 	push	ix
   240C DD 21 00 00   [14]  160 	ld	ix,#0
   2410 DD 39         [15]  161 	add	ix,sp
                            162 ;src/main.c:61: x=c->px >> 8;
   2412 DD 5E 04      [19]  163 	ld	e,4 (ix)
   2415 DD 56 05      [19]  164 	ld	d,5 (ix)
   2418 6B            [ 4]  165 	ld	l, e
   2419 62            [ 4]  166 	ld	h, d
   241A 01 04 00      [10]  167 	ld	bc, #0x0004
   241D 09            [11]  168 	add	hl, bc
   241E 46            [ 7]  169 	ld	b, (hl)
   241F 23            [ 6]  170 	inc	hl
   2420 4E            [ 7]  171 	ld	c, (hl)
                            172 ;src/main.c:62: y=c->py >> 8;
   2421 EB            [ 4]  173 	ex	de,hl
   2422 11 06 00      [10]  174 	ld	de, #0x0006
   2425 19            [11]  175 	add	hl, de
   2426 5E            [ 7]  176 	ld	e, (hl)
   2427 23            [ 6]  177 	inc	hl
   2428 56            [ 7]  178 	ld	d, (hl)
                            179 ;src/main.c:64: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, x, y);
   2429 59            [ 4]  180 	ld	e, c
   242A D5            [11]  181 	push	de
   242B 21 00 C0      [10]  182 	ld	hl, #0xc000
   242E E5            [11]  183 	push	hl
   242F CD 51 0F      [17]  184 	call	_cpct_getScreenPtr
                            185 ;src/main.c:65: cpct_drawSolidBox (pvmem, cpct_px2byteM0 (0, 0), CH_WIDTH, CH_HEIGHT);
   2432 E5            [11]  186 	push	hl
   2433 21 00 00      [10]  187 	ld	hl, #0x0000
   2436 E5            [11]  188 	push	hl
   2437 CD 37 0E      [17]  189 	call	_cpct_px2byteM0
   243A 55            [ 4]  190 	ld	d, l
   243B C1            [10]  191 	pop	bc
   243C 21 06 06      [10]  192 	ld	hl, #0x0606
   243F E5            [11]  193 	push	hl
   2440 D5            [11]  194 	push	de
   2441 33            [ 6]  195 	inc	sp
   2442 C5            [11]  196 	push	bc
   2443 CD 53 0E      [17]  197 	call	_cpct_drawSolidBox
   2446 DD E1         [14]  198 	pop	ix
   2448 C9            [10]  199 	ret
                            200 ;src/main.c:68: void printCharacter(TCharacter *c){
                            201 ;	---------------------------------
                            202 ; Function printCharacter
                            203 ; ---------------------------------
   2449                     204 _printCharacter::
   2449 DD E5         [15]  205 	push	ix
   244B DD 21 00 00   [14]  206 	ld	ix,#0
   244F DD 39         [15]  207 	add	ix,sp
   2451 3B            [ 6]  208 	dec	sp
                            209 ;src/main.c:74: x = c->x >> 8;
   2452 DD 5E 04      [19]  210 	ld	e,4 (ix)
   2455 DD 56 05      [19]  211 	ld	d,5 (ix)
   2458 6B            [ 4]  212 	ld	l, e
   2459 62            [ 4]  213 	ld	h, d
   245A 46            [ 7]  214 	ld	b, (hl)
   245B 23            [ 6]  215 	inc	hl
   245C 4E            [ 7]  216 	ld	c, (hl)
                            217 ;src/main.c:75: y = c->y >> 8;
   245D 6B            [ 4]  218 	ld	l, e
   245E 62            [ 4]  219 	ld	h, d
   245F 23            [ 6]  220 	inc	hl
   2460 23            [ 6]  221 	inc	hl
   2461 7E            [ 7]  222 	ld	a, (hl)
   2462 23            [ 6]  223 	inc	hl
   2463 46            [ 7]  224 	ld	b, (hl)
                            225 ;src/main.c:77: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, x, y);
   2464 C5            [11]  226 	push	bc
   2465 D5            [11]  227 	push	de
   2466 C5            [11]  228 	push	bc
   2467 21 00 C0      [10]  229 	ld	hl, #0xc000
   246A E5            [11]  230 	push	hl
   246B CD 51 0F      [17]  231 	call	_cpct_getScreenPtr
   246E D1            [10]  232 	pop	de
   246F C1            [10]  233 	pop	bc
                            234 ;src/main.c:78: cpct_drawSolidBox (pvmem, cpct_px2byteM0 (CH_COLOR, CH_COLOR), CH_WIDTH, CH_HEIGHT);
   2470 E5            [11]  235 	push	hl
   2471 C5            [11]  236 	push	bc
   2472 D5            [11]  237 	push	de
   2473 21 03 03      [10]  238 	ld	hl, #0x0303
   2476 E5            [11]  239 	push	hl
   2477 CD 37 0E      [17]  240 	call	_cpct_px2byteM0
   247A DD 75 FF      [19]  241 	ld	-1 (ix), l
   247D D1            [10]  242 	pop	de
   247E C1            [10]  243 	pop	bc
   247F FD E1         [14]  244 	pop	iy
   2481 C5            [11]  245 	push	bc
   2482 D5            [11]  246 	push	de
   2483 21 06 06      [10]  247 	ld	hl, #0x0606
   2486 E5            [11]  248 	push	hl
   2487 DD 7E FF      [19]  249 	ld	a, -1 (ix)
   248A F5            [11]  250 	push	af
   248B 33            [ 6]  251 	inc	sp
   248C FD E5         [15]  252 	push	iy
   248E CD 53 0E      [17]  253 	call	_cpct_drawSolidBox
   2491 D1            [10]  254 	pop	de
   2492 C1            [10]  255 	pop	bc
                            256 ;src/main.c:80: if (c->dir<32){
   2493 D5            [11]  257 	push	de
   2494 FD E1         [14]  258 	pop	iy
   2496 FD 5E 0E      [19]  259 	ld	e, 14 (iy)
                            260 ;src/main.c:81: x = x + 4;
   2499 69            [ 4]  261 	ld	l, c
   249A 2C            [ 4]  262 	inc	l
   249B 2C            [ 4]  263 	inc	l
   249C 2C            [ 4]  264 	inc	l
   249D 2C            [ 4]  265 	inc	l
                            266 ;src/main.c:82: y = y + 2;
   249E 50            [ 4]  267 	ld	d, b
   249F 14            [ 4]  268 	inc	d
   24A0 14            [ 4]  269 	inc	d
                            270 ;src/main.c:80: if (c->dir<32){
   24A1 7B            [ 4]  271 	ld	a, e
   24A2 D6 20         [ 7]  272 	sub	a, #0x20
   24A4 30 04         [12]  273 	jr	NC,00120$
                            274 ;src/main.c:81: x = x + 4;
   24A6 4D            [ 4]  275 	ld	c, l
                            276 ;src/main.c:82: y = y + 2;
   24A7 42            [ 4]  277 	ld	b, d
   24A8 18 30         [12]  278 	jr	00121$
   24AA                     279 00120$:
                            280 ;src/main.c:83: } else if (c->dir<64){
   24AA 7B            [ 4]  281 	ld	a, e
   24AB D6 40         [ 7]  282 	sub	a, #0x40
   24AD 30 03         [12]  283 	jr	NC,00117$
                            284 ;src/main.c:84: x = x + 4;
   24AF 4D            [ 4]  285 	ld	c, l
                            286 ;src/main.c:85: y = y;
   24B0 18 28         [12]  287 	jr	00121$
   24B2                     288 00117$:
                            289 ;src/main.c:87: x = x + 2;
   24B2 61            [ 4]  290 	ld	h, c
   24B3 24            [ 4]  291 	inc	h
   24B4 24            [ 4]  292 	inc	h
                            293 ;src/main.c:86: } else if (c->dir<96){
   24B5 7B            [ 4]  294 	ld	a, e
   24B6 D6 60         [ 7]  295 	sub	a, #0x60
   24B8 30 03         [12]  296 	jr	NC,00114$
                            297 ;src/main.c:87: x = x + 2;
   24BA 4C            [ 4]  298 	ld	c, h
                            299 ;src/main.c:88: y = y;
   24BB 18 1D         [12]  300 	jr	00121$
   24BD                     301 00114$:
                            302 ;src/main.c:89: } else if (c->dir<128){
                            303 ;src/main.c:92: } else if (c->dir<160){
   24BD 7B            [ 4]  304 	ld	a,e
   24BE FE 80         [ 7]  305 	cp	a,#0x80
   24C0 38 18         [12]  306 	jr	C,00121$
   24C2 D6 A0         [ 7]  307 	sub	a, #0xa0
   24C4 30 03         [12]  308 	jr	NC,00108$
                            309 ;src/main.c:94: y = y+2;
   24C6 42            [ 4]  310 	ld	b, d
   24C7 18 11         [12]  311 	jr	00121$
   24C9                     312 00108$:
                            313 ;src/main.c:97: y = y+4;
   24C9 04            [ 4]  314 	inc	b
   24CA 04            [ 4]  315 	inc	b
   24CB 04            [ 4]  316 	inc	b
   24CC 04            [ 4]  317 	inc	b
                            318 ;src/main.c:95: } else if (c->dir<196){
                            319 ;src/main.c:97: y = y+4;
                            320 ;src/main.c:98: } else if (c->dir<228){
   24CD 7B            [ 4]  321 	ld	a,e
   24CE FE C4         [ 7]  322 	cp	a,#0xc4
   24D0 38 08         [12]  323 	jr	C,00121$
   24D2 D6 E4         [ 7]  324 	sub	a, #0xe4
   24D4 30 03         [12]  325 	jr	NC,00102$
                            326 ;src/main.c:99: x = x+2;
   24D6 4C            [ 4]  327 	ld	c, h
                            328 ;src/main.c:100: y = y+4;
   24D7 18 01         [12]  329 	jr	00121$
   24D9                     330 00102$:
                            331 ;src/main.c:102: x = x+4;
   24D9 4D            [ 4]  332 	ld	c, l
                            333 ;src/main.c:103: y = y+4;
   24DA                     334 00121$:
                            335 ;src/main.c:105: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, x, y);
   24DA C5            [11]  336 	push	bc
   24DB 21 00 C0      [10]  337 	ld	hl, #0xc000
   24DE E5            [11]  338 	push	hl
   24DF CD 51 0F      [17]  339 	call	_cpct_getScreenPtr
                            340 ;src/main.c:106: cpct_drawSolidBox (pvmem, cpct_px2byteM0 (14, 14), 2, 2);
   24E2 E5            [11]  341 	push	hl
   24E3 21 0E 0E      [10]  342 	ld	hl, #0x0e0e
   24E6 E5            [11]  343 	push	hl
   24E7 CD 37 0E      [17]  344 	call	_cpct_px2byteM0
   24EA 55            [ 4]  345 	ld	d, l
   24EB C1            [10]  346 	pop	bc
   24EC 21 02 02      [10]  347 	ld	hl, #0x0202
   24EF E5            [11]  348 	push	hl
   24F0 D5            [11]  349 	push	de
   24F1 33            [ 6]  350 	inc	sp
   24F2 C5            [11]  351 	push	bc
   24F3 CD 53 0E      [17]  352 	call	_cpct_drawSolidBox
   24F6 33            [ 6]  353 	inc	sp
   24F7 DD E1         [14]  354 	pop	ix
   24F9 C9            [10]  355 	ret
                            356 ;src/main.c:109: void printWayPoints(){
                            357 ;	---------------------------------
                            358 ; Function printWayPoints
                            359 ; ---------------------------------
   24FA                     360 _printWayPoints::
   24FA DD E5         [15]  361 	push	ix
   24FC DD 21 00 00   [14]  362 	ld	ix,#0
   2500 DD 39         [15]  363 	add	ix,sp
   2502 3B            [ 6]  364 	dec	sp
                            365 ;src/main.c:112: for (i=0; i<4; i++){
   2503 DD 36 FF 00   [19]  366 	ld	-1 (ix), #0x00
   2507                     367 00102$:
                            368 ;src/main.c:113: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, wp[i].x, wp[i].y);
   2507 DD 6E FF      [19]  369 	ld	l, -1 (ix)
   250A 26 00         [ 7]  370 	ld	h, #0x00
   250C 29            [11]  371 	add	hl, hl
   250D 01 02 24      [10]  372 	ld	bc,#_wp
   2510 09            [11]  373 	add	hl,bc
   2511 4D            [ 4]  374 	ld	c,l
   2512 44            [ 4]  375 	ld	b,h
   2513 23            [ 6]  376 	inc	hl
   2514 56            [ 7]  377 	ld	d, (hl)
   2515 0A            [ 7]  378 	ld	a, (bc)
   2516 5F            [ 4]  379 	ld	e,a
   2517 D5            [11]  380 	push	de
   2518 21 00 C0      [10]  381 	ld	hl, #0xc000
   251B E5            [11]  382 	push	hl
   251C CD 51 0F      [17]  383 	call	_cpct_getScreenPtr
                            384 ;src/main.c:114: cpct_drawSolidBox (pvmem, cpct_px2byteM0 (WP_COLOR, WP_COLOR), WP_WIDTH, WP_HEIGHT);
   251F E5            [11]  385 	push	hl
   2520 21 01 01      [10]  386 	ld	hl, #0x0101
   2523 E5            [11]  387 	push	hl
   2524 CD 37 0E      [17]  388 	call	_cpct_px2byteM0
   2527 55            [ 4]  389 	ld	d, l
   2528 C1            [10]  390 	pop	bc
   2529 21 02 04      [10]  391 	ld	hl, #0x0402
   252C E5            [11]  392 	push	hl
   252D D5            [11]  393 	push	de
   252E 33            [ 6]  394 	inc	sp
   252F C5            [11]  395 	push	bc
   2530 CD 53 0E      [17]  396 	call	_cpct_drawSolidBox
                            397 ;src/main.c:112: for (i=0; i<4; i++){
   2533 DD 34 FF      [23]  398 	inc	-1 (ix)
   2536 DD 7E FF      [19]  399 	ld	a, -1 (ix)
   2539 D6 04         [ 7]  400 	sub	a, #0x04
   253B 38 CA         [12]  401 	jr	C,00102$
   253D 33            [ 6]  402 	inc	sp
   253E DD E1         [14]  403 	pop	ix
   2540 C9            [10]  404 	ret
                            405 ;src/main.c:118: void eraseDebugInfo(){
                            406 ;	---------------------------------
                            407 ; Function eraseDebugInfo
                            408 ; ---------------------------------
   2541                     409 _eraseDebugInfo::
                            410 ;src/main.c:120: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, 50, 0);
   2541 21 32 00      [10]  411 	ld	hl, #0x0032
   2544 E5            [11]  412 	push	hl
   2545 21 00 C0      [10]  413 	ld	hl, #0xc000
   2548 E5            [11]  414 	push	hl
   2549 CD 51 0F      [17]  415 	call	_cpct_getScreenPtr
                            416 ;src/main.c:121: cpct_drawSolidBox (pvmem, cpct_px2byteM0 (0, 0), 29, 80);    
   254C E5            [11]  417 	push	hl
   254D 21 00 00      [10]  418 	ld	hl, #0x0000
   2550 E5            [11]  419 	push	hl
   2551 CD 37 0E      [17]  420 	call	_cpct_px2byteM0
   2554 55            [ 4]  421 	ld	d, l
   2555 C1            [10]  422 	pop	bc
   2556 21 1D 50      [10]  423 	ld	hl, #0x501d
   2559 E5            [11]  424 	push	hl
   255A D5            [11]  425 	push	de
   255B 33            [ 6]  426 	inc	sp
   255C C5            [11]  427 	push	bc
   255D CD 53 0E      [17]  428 	call	_cpct_drawSolidBox
   2560 C9            [10]  429 	ret
                            430 ;src/main.c:124: void printDebugInfo(TCharacter *c){
                            431 ;	---------------------------------
                            432 ; Function printDebugInfo
                            433 ; ---------------------------------
   2561                     434 _printDebugInfo::
   2561 DD E5         [15]  435 	push	ix
   2563 DD 21 00 00   [14]  436 	ld	ix,#0
   2567 DD 39         [15]  437 	add	ix,sp
   2569 21 E8 FF      [10]  438 	ld	hl, #-24
   256C 39            [11]  439 	add	hl, sp
   256D F9            [ 6]  440 	ld	sp, hl
                            441 ;src/main.c:127: sprintf(auxTxt, "X %1d", c->x >> 8);
   256E DD 7E 04      [19]  442 	ld	a, 4 (ix)
   2571 DD 77 FC      [19]  443 	ld	-4 (ix), a
   2574 DD 7E 05      [19]  444 	ld	a, 5 (ix)
   2577 DD 77 FD      [19]  445 	ld	-3 (ix), a
   257A DD 6E FC      [19]  446 	ld	l,-4 (ix)
   257D DD 66 FD      [19]  447 	ld	h,-3 (ix)
   2580 4E            [ 7]  448 	ld	c, (hl)
   2581 23            [ 6]  449 	inc	hl
   2582 5E            [ 7]  450 	ld	e, (hl)
   2583 16 00         [ 7]  451 	ld	d, #0x00
   2585 21 00 00      [10]  452 	ld	hl, #0x0000
   2588 39            [11]  453 	add	hl, sp
   2589 E5            [11]  454 	push	hl
   258A D5            [11]  455 	push	de
   258B 11 96 27      [10]  456 	ld	de, #___str_0
   258E D5            [11]  457 	push	de
   258F E5            [11]  458 	push	hl
   2590 CD E7 0D      [17]  459 	call	_sprintf
   2593 21 06 00      [10]  460 	ld	hl, #6
   2596 39            [11]  461 	add	hl, sp
   2597 F9            [ 6]  462 	ld	sp, hl
   2598 C1            [10]  463 	pop	bc
                            464 ;src/main.c:128: drawText(auxTxt, 50, 0, COLORTXT_BLUE, NORMALHEIGHT, TRANSPARENT);
   2599 59            [ 4]  465 	ld	e, c
   259A 50            [ 4]  466 	ld	d, b
   259B C5            [11]  467 	push	bc
   259C 21 01 01      [10]  468 	ld	hl, #0x0101
   259F E5            [11]  469 	push	hl
   25A0 21 00 03      [10]  470 	ld	hl, #0x0300
   25A3 E5            [11]  471 	push	hl
   25A4 3E 32         [ 7]  472 	ld	a, #0x32
   25A6 F5            [11]  473 	push	af
   25A7 33            [ 6]  474 	inc	sp
   25A8 D5            [11]  475 	push	de
   25A9 CD 38 08      [17]  476 	call	_drawText
   25AC 21 07 00      [10]  477 	ld	hl, #7
   25AF 39            [11]  478 	add	hl, sp
   25B0 F9            [ 6]  479 	ld	sp, hl
   25B1 C1            [10]  480 	pop	bc
                            481 ;src/main.c:129: sprintf(auxTxt, "Y %1d", c->y >> 8);
   25B2 DD 6E FC      [19]  482 	ld	l,-4 (ix)
   25B5 DD 66 FD      [19]  483 	ld	h,-3 (ix)
   25B8 23            [ 6]  484 	inc	hl
   25B9 23            [ 6]  485 	inc	hl
   25BA 5E            [ 7]  486 	ld	e, (hl)
   25BB 23            [ 6]  487 	inc	hl
   25BC 5E            [ 7]  488 	ld	e, (hl)
   25BD 16 00         [ 7]  489 	ld	d, #0x00
   25BF 69            [ 4]  490 	ld	l, c
   25C0 60            [ 4]  491 	ld	h, b
   25C1 C5            [11]  492 	push	bc
   25C2 D5            [11]  493 	push	de
   25C3 11 9C 27      [10]  494 	ld	de, #___str_1
   25C6 D5            [11]  495 	push	de
   25C7 E5            [11]  496 	push	hl
   25C8 CD E7 0D      [17]  497 	call	_sprintf
   25CB 21 06 00      [10]  498 	ld	hl, #6
   25CE 39            [11]  499 	add	hl, sp
   25CF F9            [ 6]  500 	ld	sp, hl
   25D0 C1            [10]  501 	pop	bc
                            502 ;src/main.c:130: drawText(auxTxt, 50, 8, COLORTXT_BLUE, NORMALHEIGHT, TRANSPARENT);  
   25D1 59            [ 4]  503 	ld	e, c
   25D2 50            [ 4]  504 	ld	d, b
   25D3 C5            [11]  505 	push	bc
   25D4 21 01 01      [10]  506 	ld	hl, #0x0101
   25D7 E5            [11]  507 	push	hl
   25D8 21 08 03      [10]  508 	ld	hl, #0x0308
   25DB E5            [11]  509 	push	hl
   25DC 3E 32         [ 7]  510 	ld	a, #0x32
   25DE F5            [11]  511 	push	af
   25DF 33            [ 6]  512 	inc	sp
   25E0 D5            [11]  513 	push	de
   25E1 CD 38 08      [17]  514 	call	_drawText
   25E4 21 07 00      [10]  515 	ld	hl, #7
   25E7 39            [11]  516 	add	hl, sp
   25E8 F9            [ 6]  517 	ld	sp, hl
   25E9 C1            [10]  518 	pop	bc
                            519 ;src/main.c:131: sprintf(auxTxt, "DIR %1d", c->dir);
   25EA DD 6E FC      [19]  520 	ld	l,-4 (ix)
   25ED DD 66 FD      [19]  521 	ld	h,-3 (ix)
   25F0 11 0E 00      [10]  522 	ld	de, #0x000e
   25F3 19            [11]  523 	add	hl, de
   25F4 5E            [ 7]  524 	ld	e, (hl)
   25F5 16 00         [ 7]  525 	ld	d, #0x00
   25F7 69            [ 4]  526 	ld	l, c
   25F8 60            [ 4]  527 	ld	h, b
   25F9 C5            [11]  528 	push	bc
   25FA D5            [11]  529 	push	de
   25FB 11 A2 27      [10]  530 	ld	de, #___str_2
   25FE D5            [11]  531 	push	de
   25FF E5            [11]  532 	push	hl
   2600 CD E7 0D      [17]  533 	call	_sprintf
   2603 21 06 00      [10]  534 	ld	hl, #6
   2606 39            [11]  535 	add	hl, sp
   2607 F9            [ 6]  536 	ld	sp, hl
   2608 C1            [10]  537 	pop	bc
                            538 ;src/main.c:132: drawText(auxTxt, 50, 16, COLORTXT_BLUE, NORMALHEIGHT, TRANSPARENT);  
   2609 59            [ 4]  539 	ld	e, c
   260A 50            [ 4]  540 	ld	d, b
   260B C5            [11]  541 	push	bc
   260C 21 01 01      [10]  542 	ld	hl, #0x0101
   260F E5            [11]  543 	push	hl
   2610 21 10 03      [10]  544 	ld	hl, #0x0310
   2613 E5            [11]  545 	push	hl
   2614 3E 32         [ 7]  546 	ld	a, #0x32
   2616 F5            [11]  547 	push	af
   2617 33            [ 6]  548 	inc	sp
   2618 D5            [11]  549 	push	de
   2619 CD 38 08      [17]  550 	call	_drawText
   261C 21 07 00      [10]  551 	ld	hl, #7
   261F 39            [11]  552 	add	hl, sp
   2620 F9            [ 6]  553 	ld	sp, hl
   2621 C1            [10]  554 	pop	bc
                            555 ;src/main.c:133: sprintf(auxTxt, "ACC %1d", c->a);
   2622 DD 6E FC      [19]  556 	ld	l,-4 (ix)
   2625 DD 66 FD      [19]  557 	ld	h,-3 (ix)
   2628 11 0C 00      [10]  558 	ld	de, #0x000c
   262B 19            [11]  559 	add	hl, de
   262C 5E            [ 7]  560 	ld	e, (hl)
   262D 23            [ 6]  561 	inc	hl
   262E 56            [ 7]  562 	ld	d, (hl)
   262F 69            [ 4]  563 	ld	l, c
   2630 60            [ 4]  564 	ld	h, b
   2631 C5            [11]  565 	push	bc
   2632 D5            [11]  566 	push	de
   2633 11 AA 27      [10]  567 	ld	de, #___str_3
   2636 D5            [11]  568 	push	de
   2637 E5            [11]  569 	push	hl
   2638 CD E7 0D      [17]  570 	call	_sprintf
   263B 21 06 00      [10]  571 	ld	hl, #6
   263E 39            [11]  572 	add	hl, sp
   263F F9            [ 6]  573 	ld	sp, hl
   2640 C1            [10]  574 	pop	bc
                            575 ;src/main.c:134: drawText(auxTxt, 50, 24, COLORTXT_BLUE, NORMALHEIGHT, TRANSPARENT);
   2641 59            [ 4]  576 	ld	e, c
   2642 50            [ 4]  577 	ld	d, b
   2643 C5            [11]  578 	push	bc
   2644 21 01 01      [10]  579 	ld	hl, #0x0101
   2647 E5            [11]  580 	push	hl
   2648 21 18 03      [10]  581 	ld	hl, #0x0318
   264B E5            [11]  582 	push	hl
   264C 3E 32         [ 7]  583 	ld	a, #0x32
   264E F5            [11]  584 	push	af
   264F 33            [ 6]  585 	inc	sp
   2650 D5            [11]  586 	push	de
   2651 CD 38 08      [17]  587 	call	_drawText
   2654 21 07 00      [10]  588 	ld	hl, #7
   2657 39            [11]  589 	add	hl, sp
   2658 F9            [ 6]  590 	ld	sp, hl
   2659 C1            [10]  591 	pop	bc
                            592 ;src/main.c:135: sprintf(auxTxt, "VX %1d", c->vx);
   265A DD 7E FC      [19]  593 	ld	a, -4 (ix)
   265D C6 08         [ 7]  594 	add	a, #0x08
   265F DD 77 FE      [19]  595 	ld	-2 (ix), a
   2662 DD 7E FD      [19]  596 	ld	a, -3 (ix)
   2665 CE 00         [ 7]  597 	adc	a, #0x00
   2667 DD 77 FF      [19]  598 	ld	-1 (ix), a
   266A DD 6E FE      [19]  599 	ld	l,-2 (ix)
   266D DD 66 FF      [19]  600 	ld	h,-1 (ix)
   2670 5E            [ 7]  601 	ld	e, (hl)
   2671 23            [ 6]  602 	inc	hl
   2672 56            [ 7]  603 	ld	d, (hl)
   2673 69            [ 4]  604 	ld	l, c
   2674 60            [ 4]  605 	ld	h, b
   2675 C5            [11]  606 	push	bc
   2676 D5            [11]  607 	push	de
   2677 11 B2 27      [10]  608 	ld	de, #___str_4
   267A D5            [11]  609 	push	de
   267B E5            [11]  610 	push	hl
   267C CD E7 0D      [17]  611 	call	_sprintf
   267F 21 06 00      [10]  612 	ld	hl, #6
   2682 39            [11]  613 	add	hl, sp
   2683 F9            [ 6]  614 	ld	sp, hl
   2684 C1            [10]  615 	pop	bc
                            616 ;src/main.c:136: drawText(auxTxt, 50, 32, COLORTXT_BLUE, NORMALHEIGHT, TRANSPARENT);
   2685 59            [ 4]  617 	ld	e, c
   2686 50            [ 4]  618 	ld	d, b
   2687 C5            [11]  619 	push	bc
   2688 21 01 01      [10]  620 	ld	hl, #0x0101
   268B E5            [11]  621 	push	hl
   268C 21 20 03      [10]  622 	ld	hl, #0x0320
   268F E5            [11]  623 	push	hl
   2690 3E 32         [ 7]  624 	ld	a, #0x32
   2692 F5            [11]  625 	push	af
   2693 33            [ 6]  626 	inc	sp
   2694 D5            [11]  627 	push	de
   2695 CD 38 08      [17]  628 	call	_drawText
   2698 21 07 00      [10]  629 	ld	hl, #7
   269B 39            [11]  630 	add	hl, sp
   269C F9            [ 6]  631 	ld	sp, hl
   269D C1            [10]  632 	pop	bc
                            633 ;src/main.c:137: sprintf(auxTxt, "VY %1d", c->vx);
   269E DD 6E FE      [19]  634 	ld	l,-2 (ix)
   26A1 DD 66 FF      [19]  635 	ld	h,-1 (ix)
   26A4 5E            [ 7]  636 	ld	e, (hl)
   26A5 23            [ 6]  637 	inc	hl
   26A6 56            [ 7]  638 	ld	d, (hl)
   26A7 69            [ 4]  639 	ld	l, c
   26A8 60            [ 4]  640 	ld	h, b
   26A9 C5            [11]  641 	push	bc
   26AA D5            [11]  642 	push	de
   26AB 11 B9 27      [10]  643 	ld	de, #___str_5
   26AE D5            [11]  644 	push	de
   26AF E5            [11]  645 	push	hl
   26B0 CD E7 0D      [17]  646 	call	_sprintf
   26B3 21 06 00      [10]  647 	ld	hl, #6
   26B6 39            [11]  648 	add	hl, sp
   26B7 F9            [ 6]  649 	ld	sp, hl
   26B8 C1            [10]  650 	pop	bc
                            651 ;src/main.c:138: drawText(auxTxt, 50, 40, COLORTXT_BLUE, NORMALHEIGHT, TRANSPARENT);
   26B9 59            [ 4]  652 	ld	e, c
   26BA 50            [ 4]  653 	ld	d, b
   26BB C5            [11]  654 	push	bc
   26BC 21 01 01      [10]  655 	ld	hl, #0x0101
   26BF E5            [11]  656 	push	hl
   26C0 21 28 03      [10]  657 	ld	hl, #0x0328
   26C3 E5            [11]  658 	push	hl
   26C4 3E 32         [ 7]  659 	ld	a, #0x32
   26C6 F5            [11]  660 	push	af
   26C7 33            [ 6]  661 	inc	sp
   26C8 D5            [11]  662 	push	de
   26C9 CD 38 08      [17]  663 	call	_drawText
   26CC 21 07 00      [10]  664 	ld	hl, #7
   26CF 39            [11]  665 	add	hl, sp
   26D0 F9            [ 6]  666 	ld	sp, hl
   26D1 C1            [10]  667 	pop	bc
                            668 ;src/main.c:139: sprintf(auxTxt, "T %1d", c->target);
   26D2 DD 7E FC      [19]  669 	ld	a, -4 (ix)
   26D5 C6 10         [ 7]  670 	add	a, #0x10
   26D7 DD 77 FE      [19]  671 	ld	-2 (ix), a
   26DA DD 7E FD      [19]  672 	ld	a, -3 (ix)
   26DD CE 00         [ 7]  673 	adc	a, #0x00
   26DF DD 77 FF      [19]  674 	ld	-1 (ix), a
   26E2 DD 6E FE      [19]  675 	ld	l,-2 (ix)
   26E5 DD 66 FF      [19]  676 	ld	h,-1 (ix)
   26E8 5E            [ 7]  677 	ld	e, (hl)
   26E9 16 00         [ 7]  678 	ld	d, #0x00
   26EB 69            [ 4]  679 	ld	l, c
   26EC 60            [ 4]  680 	ld	h, b
   26ED C5            [11]  681 	push	bc
   26EE D5            [11]  682 	push	de
   26EF 11 C0 27      [10]  683 	ld	de, #___str_6
   26F2 D5            [11]  684 	push	de
   26F3 E5            [11]  685 	push	hl
   26F4 CD E7 0D      [17]  686 	call	_sprintf
   26F7 21 06 00      [10]  687 	ld	hl, #6
   26FA 39            [11]  688 	add	hl, sp
   26FB F9            [ 6]  689 	ld	sp, hl
   26FC C1            [10]  690 	pop	bc
                            691 ;src/main.c:140: drawText(auxTxt, 50, 48, COLORTXT_BLUE, NORMALHEIGHT, TRANSPARENT);
   26FD 59            [ 4]  692 	ld	e, c
   26FE 50            [ 4]  693 	ld	d, b
   26FF C5            [11]  694 	push	bc
   2700 21 01 01      [10]  695 	ld	hl, #0x0101
   2703 E5            [11]  696 	push	hl
   2704 21 30 03      [10]  697 	ld	hl, #0x0330
   2707 E5            [11]  698 	push	hl
   2708 3E 32         [ 7]  699 	ld	a, #0x32
   270A F5            [11]  700 	push	af
   270B 33            [ 6]  701 	inc	sp
   270C D5            [11]  702 	push	de
   270D CD 38 08      [17]  703 	call	_drawText
   2710 21 07 00      [10]  704 	ld	hl, #7
   2713 39            [11]  705 	add	hl, sp
   2714 F9            [ 6]  706 	ld	sp, hl
   2715 C1            [10]  707 	pop	bc
                            708 ;src/main.c:141: sprintf(auxTxt, "TX %1d", wp[c->target].x);
   2716 DD 6E FE      [19]  709 	ld	l,-2 (ix)
   2719 DD 66 FF      [19]  710 	ld	h,-1 (ix)
   271C 6E            [ 7]  711 	ld	l, (hl)
   271D 26 00         [ 7]  712 	ld	h, #0x00
   271F 29            [11]  713 	add	hl, hl
   2720 11 02 24      [10]  714 	ld	de, #_wp
   2723 19            [11]  715 	add	hl, de
   2724 5E            [ 7]  716 	ld	e, (hl)
   2725 16 00         [ 7]  717 	ld	d, #0x00
   2727 69            [ 4]  718 	ld	l, c
   2728 60            [ 4]  719 	ld	h, b
   2729 C5            [11]  720 	push	bc
   272A D5            [11]  721 	push	de
   272B 11 C6 27      [10]  722 	ld	de, #___str_7
   272E D5            [11]  723 	push	de
   272F E5            [11]  724 	push	hl
   2730 CD E7 0D      [17]  725 	call	_sprintf
   2733 21 06 00      [10]  726 	ld	hl, #6
   2736 39            [11]  727 	add	hl, sp
   2737 F9            [ 6]  728 	ld	sp, hl
   2738 C1            [10]  729 	pop	bc
                            730 ;src/main.c:142: drawText(auxTxt, 50, 56, COLORTXT_BLUE, NORMALHEIGHT, TRANSPARENT);
   2739 59            [ 4]  731 	ld	e, c
   273A 50            [ 4]  732 	ld	d, b
   273B C5            [11]  733 	push	bc
   273C 21 01 01      [10]  734 	ld	hl, #0x0101
   273F E5            [11]  735 	push	hl
   2740 21 38 03      [10]  736 	ld	hl, #0x0338
   2743 E5            [11]  737 	push	hl
   2744 3E 32         [ 7]  738 	ld	a, #0x32
   2746 F5            [11]  739 	push	af
   2747 33            [ 6]  740 	inc	sp
   2748 D5            [11]  741 	push	de
   2749 CD 38 08      [17]  742 	call	_drawText
   274C 21 07 00      [10]  743 	ld	hl, #7
   274F 39            [11]  744 	add	hl, sp
   2750 F9            [ 6]  745 	ld	sp, hl
   2751 C1            [10]  746 	pop	bc
                            747 ;src/main.c:143: sprintf(auxTxt, "TY %1d", wp[c->target].y);
   2752 DD 6E FE      [19]  748 	ld	l,-2 (ix)
   2755 DD 66 FF      [19]  749 	ld	h,-1 (ix)
   2758 6E            [ 7]  750 	ld	l, (hl)
   2759 26 00         [ 7]  751 	ld	h, #0x00
   275B 29            [11]  752 	add	hl, hl
   275C 11 02 24      [10]  753 	ld	de, #_wp
   275F 19            [11]  754 	add	hl, de
   2760 23            [ 6]  755 	inc	hl
   2761 5E            [ 7]  756 	ld	e, (hl)
   2762 16 00         [ 7]  757 	ld	d, #0x00
   2764 69            [ 4]  758 	ld	l, c
   2765 60            [ 4]  759 	ld	h, b
   2766 C5            [11]  760 	push	bc
   2767 D5            [11]  761 	push	de
   2768 11 CD 27      [10]  762 	ld	de, #___str_8
   276B D5            [11]  763 	push	de
   276C E5            [11]  764 	push	hl
   276D CD E7 0D      [17]  765 	call	_sprintf
   2770 21 06 00      [10]  766 	ld	hl, #6
   2773 39            [11]  767 	add	hl, sp
   2774 F9            [ 6]  768 	ld	sp, hl
   2775 C1            [10]  769 	pop	bc
                            770 ;src/main.c:144: drawText(auxTxt, 50, 64, COLORTXT_BLUE, NORMALHEIGHT, TRANSPARENT);
   2776 21 01 01      [10]  771 	ld	hl, #0x0101
   2779 E5            [11]  772 	push	hl
   277A 21 40 03      [10]  773 	ld	hl, #0x0340
   277D E5            [11]  774 	push	hl
   277E 3E 32         [ 7]  775 	ld	a, #0x32
   2780 F5            [11]  776 	push	af
   2781 33            [ 6]  777 	inc	sp
   2782 C5            [11]  778 	push	bc
   2783 CD 38 08      [17]  779 	call	_drawText
   2786 21 07 00      [10]  780 	ld	hl, #7
   2789 39            [11]  781 	add	hl, sp
   278A F9            [ 6]  782 	ld	sp, hl
                            783 ;src/main.c:145: wait4OneKey();
   278B CD DE 04      [17]  784 	call	_wait4OneKey
                            785 ;src/main.c:146: eraseDebugInfo();
   278E CD 41 25      [17]  786 	call	_eraseDebugInfo
   2791 DD F9         [10]  787 	ld	sp, ix
   2793 DD E1         [14]  788 	pop	ix
   2795 C9            [10]  789 	ret
   2796                     790 ___str_0:
   2796 58 20 25 31 64      791 	.ascii "X %1d"
   279B 00                  792 	.db 0x00
   279C                     793 ___str_1:
   279C 59 20 25 31 64      794 	.ascii "Y %1d"
   27A1 00                  795 	.db 0x00
   27A2                     796 ___str_2:
   27A2 44 49 52 20 25 31   797 	.ascii "DIR %1d"
        64
   27A9 00                  798 	.db 0x00
   27AA                     799 ___str_3:
   27AA 41 43 43 20 25 31   800 	.ascii "ACC %1d"
        64
   27B1 00                  801 	.db 0x00
   27B2                     802 ___str_4:
   27B2 56 58 20 25 31 64   803 	.ascii "VX %1d"
   27B8 00                  804 	.db 0x00
   27B9                     805 ___str_5:
   27B9 56 59 20 25 31 64   806 	.ascii "VY %1d"
   27BF 00                  807 	.db 0x00
   27C0                     808 ___str_6:
   27C0 54 20 25 31 64      809 	.ascii "T %1d"
   27C5 00                  810 	.db 0x00
   27C6                     811 ___str_7:
   27C6 54 58 20 25 31 64   812 	.ascii "TX %1d"
   27CC 00                  813 	.db 0x00
   27CD                     814 ___str_8:
   27CD 54 59 20 25 31 64   815 	.ascii "TY %1d"
   27D3 00                  816 	.db 0x00
                            817 ;src/main.c:149: void getCharacterInput(TCharacter *c){
                            818 ;	---------------------------------
                            819 ; Function getCharacterInput
                            820 ; ---------------------------------
   27D4                     821 _getCharacterInput::
   27D4 DD E5         [15]  822 	push	ix
   27D6 DD 21 00 00   [14]  823 	ld	ix,#0
   27DA DD 39         [15]  824 	add	ix,sp
   27DC F5            [11]  825 	push	af
                            826 ;src/main.c:151: if (cpct_isKeyPressed(Key_O)){
   27DD 21 04 04      [10]  827 	ld	hl, #0x0404
   27E0 CD 42 0C      [17]  828 	call	_cpct_isKeyPressed
                            829 ;src/main.c:152: c->dir = c->dir + 32;
   27E3 DD 7E 04      [19]  830 	ld	a, 4 (ix)
   27E6 DD 77 FE      [19]  831 	ld	-2 (ix), a
   27E9 DD 7E 05      [19]  832 	ld	a, 5 (ix)
   27EC DD 77 FF      [19]  833 	ld	-1 (ix), a
   27EF DD 7E FE      [19]  834 	ld	a, -2 (ix)
   27F2 C6 0E         [ 7]  835 	add	a, #0x0e
   27F4 4F            [ 4]  836 	ld	c, a
   27F5 DD 7E FF      [19]  837 	ld	a, -1 (ix)
   27F8 CE 00         [ 7]  838 	adc	a, #0x00
   27FA 47            [ 4]  839 	ld	b, a
                            840 ;src/main.c:151: if (cpct_isKeyPressed(Key_O)){
   27FB 7D            [ 4]  841 	ld	a, l
   27FC B7            [ 4]  842 	or	a, a
   27FD 28 04         [12]  843 	jr	Z,00102$
                            844 ;src/main.c:152: c->dir = c->dir + 32;
   27FF 0A            [ 7]  845 	ld	a, (bc)
   2800 C6 20         [ 7]  846 	add	a, #0x20
   2802 02            [ 7]  847 	ld	(bc), a
   2803                     848 00102$:
                            849 ;src/main.c:154: if (cpct_isKeyPressed(Key_P)){
   2803 C5            [11]  850 	push	bc
   2804 21 03 08      [10]  851 	ld	hl, #0x0803
   2807 CD 42 0C      [17]  852 	call	_cpct_isKeyPressed
   280A C1            [10]  853 	pop	bc
   280B 7D            [ 4]  854 	ld	a, l
   280C B7            [ 4]  855 	or	a, a
   280D 28 04         [12]  856 	jr	Z,00104$
                            857 ;src/main.c:155: c->dir = c->dir - 32;
   280F 0A            [ 7]  858 	ld	a, (bc)
   2810 C6 E0         [ 7]  859 	add	a, #0xe0
   2812 02            [ 7]  860 	ld	(bc), a
   2813                     861 00104$:
                            862 ;src/main.c:157: if (cpct_isKeyPressed(Key_Q)){
   2813 21 08 08      [10]  863 	ld	hl, #0x0808
   2816 CD 42 0C      [17]  864 	call	_cpct_isKeyPressed
                            865 ;src/main.c:167: c->a = 0;
   2819 DD 7E FE      [19]  866 	ld	a, -2 (ix)
   281C C6 0C         [ 7]  867 	add	a, #0x0c
   281E 4F            [ 4]  868 	ld	c, a
   281F DD 7E FF      [19]  869 	ld	a, -1 (ix)
   2822 CE 00         [ 7]  870 	adc	a, #0x00
   2824 47            [ 4]  871 	ld	b, a
                            872 ;src/main.c:157: if (cpct_isKeyPressed(Key_Q)){
   2825 7D            [ 4]  873 	ld	a, l
   2826 B7            [ 4]  874 	or	a, a
   2827 28 0B         [12]  875 	jr	Z,00106$
                            876 ;src/main.c:158: c->a = c->a + 1;
   2829 69            [ 4]  877 	ld	l, c
   282A 60            [ 4]  878 	ld	h, b
   282B 5E            [ 7]  879 	ld	e, (hl)
   282C 23            [ 6]  880 	inc	hl
   282D 56            [ 7]  881 	ld	d, (hl)
   282E 13            [ 6]  882 	inc	de
   282F 69            [ 4]  883 	ld	l, c
   2830 60            [ 4]  884 	ld	h, b
   2831 73            [ 7]  885 	ld	(hl), e
   2832 23            [ 6]  886 	inc	hl
   2833 72            [ 7]  887 	ld	(hl), d
   2834                     888 00106$:
                            889 ;src/main.c:160: if ((cpct_isKeyPressed(Key_A)) && (c->a > 0)){
   2834 C5            [11]  890 	push	bc
   2835 21 08 20      [10]  891 	ld	hl, #0x2008
   2838 CD 42 0C      [17]  892 	call	_cpct_isKeyPressed
   283B C1            [10]  893 	pop	bc
   283C 7D            [ 4]  894 	ld	a, l
   283D B7            [ 4]  895 	or	a, a
   283E 28 16         [12]  896 	jr	Z,00108$
   2840 69            [ 4]  897 	ld	l, c
   2841 60            [ 4]  898 	ld	h, b
   2842 5E            [ 7]  899 	ld	e, (hl)
   2843 23            [ 6]  900 	inc	hl
   2844 56            [ 7]  901 	ld	d, (hl)
   2845 AF            [ 4]  902 	xor	a, a
   2846 BB            [ 4]  903 	cp	a, e
   2847 9A            [ 4]  904 	sbc	a, d
   2848 E2 4D 28      [10]  905 	jp	PO, 00151$
   284B EE 80         [ 7]  906 	xor	a, #0x80
   284D                     907 00151$:
   284D F2 56 28      [10]  908 	jp	P, 00108$
                            909 ;src/main.c:161: c->a = c->a - 1;
   2850 1B            [ 6]  910 	dec	de
   2851 69            [ 4]  911 	ld	l, c
   2852 60            [ 4]  912 	ld	h, b
   2853 73            [ 7]  913 	ld	(hl), e
   2854 23            [ 6]  914 	inc	hl
   2855 72            [ 7]  915 	ld	(hl), d
   2856                     916 00108$:
                            917 ;src/main.c:164: if (cpct_isKeyPressed(Key_Space)){
   2856 C5            [11]  918 	push	bc
   2857 21 05 80      [10]  919 	ld	hl, #0x8005
   285A CD 42 0C      [17]  920 	call	_cpct_isKeyPressed
   285D C1            [10]  921 	pop	bc
   285E 7D            [ 4]  922 	ld	a, l
   285F B7            [ 4]  923 	or	a, a
   2860 28 24         [12]  924 	jr	Z,00114$
                            925 ;src/main.c:165: if (c->motion){
   2862 DD 7E FE      [19]  926 	ld	a, -2 (ix)
   2865 C6 0F         [ 7]  927 	add	a, #0x0f
   2867 6F            [ 4]  928 	ld	l, a
   2868 DD 7E FF      [19]  929 	ld	a, -1 (ix)
   286B CE 00         [ 7]  930 	adc	a, #0x00
   286D 67            [ 4]  931 	ld	h, a
   286E 7E            [ 7]  932 	ld	a, (hl)
   286F B7            [ 4]  933 	or	a, a
   2870 28 0B         [12]  934 	jr	Z,00111$
                            935 ;src/main.c:166: c->motion = 0;
   2872 36 00         [10]  936 	ld	(hl), #0x00
                            937 ;src/main.c:167: c->a = 0;
   2874 3E 00         [ 7]  938 	ld	a, #0x00
   2876 02            [ 7]  939 	ld	(bc), a
   2877 03            [ 6]  940 	inc	bc
   2878 3E 00         [ 7]  941 	ld	a, #0x00
   287A 02            [ 7]  942 	ld	(bc), a
   287B 18 09         [12]  943 	jr	00114$
   287D                     944 00111$:
                            945 ;src/main.c:169: c->motion = 1;
   287D 36 01         [10]  946 	ld	(hl), #0x01
                            947 ;src/main.c:170: c->a = 2;
   287F 3E 02         [ 7]  948 	ld	a, #0x02
   2881 02            [ 7]  949 	ld	(bc), a
   2882 03            [ 6]  950 	inc	bc
   2883 3E 00         [ 7]  951 	ld	a, #0x00
   2885 02            [ 7]  952 	ld	(bc), a
   2886                     953 00114$:
                            954 ;src/main.c:174: if (cpct_isKeyPressed(Key_D)){
   2886 21 07 20      [10]  955 	ld	hl, #0x2007
   2889 CD 42 0C      [17]  956 	call	_cpct_isKeyPressed
   288C 7D            [ 4]  957 	ld	a, l
   288D B7            [ 4]  958 	or	a, a
   288E 28 0B         [12]  959 	jr	Z,00117$
                            960 ;src/main.c:175: printDebugInfo(c);
   2890 DD 6E 04      [19]  961 	ld	l,4 (ix)
   2893 DD 66 05      [19]  962 	ld	h,5 (ix)
   2896 E5            [11]  963 	push	hl
   2897 CD 61 25      [17]  964 	call	_printDebugInfo
   289A F1            [10]  965 	pop	af
   289B                     966 00117$:
   289B DD F9         [10]  967 	ld	sp, ix
   289D DD E1         [14]  968 	pop	ix
   289F C9            [10]  969 	ret
                            970 ;src/main.c:180: void motionUpdate(TCharacter *c){
                            971 ;	---------------------------------
                            972 ; Function motionUpdate
                            973 ; ---------------------------------
   28A0                     974 _motionUpdate::
   28A0 DD E5         [15]  975 	push	ix
   28A2 DD 21 00 00   [14]  976 	ld	ix,#0
   28A6 DD 39         [15]  977 	add	ix,sp
   28A8 F5            [11]  978 	push	af
   28A9 F5            [11]  979 	push	af
   28AA 3B            [ 6]  980 	dec	sp
                            981 ;src/main.c:185: xc = c->x >> 8;
   28AB DD 7E 04      [19]  982 	ld	a, 4 (ix)
   28AE DD 77 FE      [19]  983 	ld	-2 (ix), a
   28B1 DD 7E 05      [19]  984 	ld	a, 5 (ix)
   28B4 DD 77 FF      [19]  985 	ld	-1 (ix), a
   28B7 DD 6E FE      [19]  986 	ld	l,-2 (ix)
   28BA DD 66 FF      [19]  987 	ld	h,-1 (ix)
   28BD 4E            [ 7]  988 	ld	c, (hl)
   28BE 23            [ 6]  989 	inc	hl
   28BF 4E            [ 7]  990 	ld	c, (hl)
                            991 ;src/main.c:186: yc = c->y >> 8;
   28C0 DD 6E FE      [19]  992 	ld	l,-2 (ix)
   28C3 DD 66 FF      [19]  993 	ld	h,-1 (ix)
   28C6 23            [ 6]  994 	inc	hl
   28C7 23            [ 6]  995 	inc	hl
   28C8 46            [ 7]  996 	ld	b, (hl)
   28C9 23            [ 6]  997 	inc	hl
   28CA 46            [ 7]  998 	ld	b, (hl)
                            999 ;src/main.c:189: if ((abs(xc - wp[c->target].x) < 2) && (abs(yc - wp[c->target].y) < 2)){
   28CB DD 71 FC      [19] 1000 	ld	-4 (ix), c
   28CE DD 36 FD 00   [19] 1001 	ld	-3 (ix), #0x00
   28D2 DD 7E FE      [19] 1002 	ld	a, -2 (ix)
   28D5 C6 10         [ 7] 1003 	add	a, #0x10
   28D7 5F            [ 4] 1004 	ld	e, a
   28D8 DD 7E FF      [19] 1005 	ld	a, -1 (ix)
   28DB CE 00         [ 7] 1006 	adc	a, #0x00
   28DD 57            [ 4] 1007 	ld	d, a
   28DE 1A            [ 7] 1008 	ld	a, (de)
   28DF 6F            [ 4] 1009 	ld	l, a
   28E0 26 00         [ 7] 1010 	ld	h, #0x00
   28E2 29            [11] 1011 	add	hl, hl
   28E3 3E 02         [ 7] 1012 	ld	a, #<(_wp)
   28E5 85            [ 4] 1013 	add	a, l
   28E6 6F            [ 4] 1014 	ld	l, a
   28E7 3E 24         [ 7] 1015 	ld	a, #>(_wp)
   28E9 8C            [ 4] 1016 	adc	a, h
   28EA 67            [ 4] 1017 	ld	h, a
   28EB 6E            [ 7] 1018 	ld	l, (hl)
   28EC 26 00         [ 7] 1019 	ld	h, #0x00
   28EE DD 7E FC      [19] 1020 	ld	a, -4 (ix)
   28F1 95            [ 4] 1021 	sub	a, l
   28F2 6F            [ 4] 1022 	ld	l, a
   28F3 DD 7E FD      [19] 1023 	ld	a, -3 (ix)
   28F6 9C            [ 4] 1024 	sbc	a, h
   28F7 67            [ 4] 1025 	ld	h, a
   28F8 D5            [11] 1026 	push	de
   28F9 E5            [11] 1027 	push	hl
   28FA CD 5D 0D      [17] 1028 	call	_abs
   28FD F1            [10] 1029 	pop	af
   28FE D1            [10] 1030 	pop	de
   28FF 7D            [ 4] 1031 	ld	a, l
   2900 D6 02         [ 7] 1032 	sub	a, #0x02
   2902 7C            [ 4] 1033 	ld	a, h
   2903 17            [ 4] 1034 	rla
   2904 3F            [ 4] 1035 	ccf
   2905 1F            [ 4] 1036 	rra
   2906 DE 80         [ 7] 1037 	sbc	a, #0x80
   2908 30 4D         [12] 1038 	jr	NC,00102$
   290A DD 70 FC      [19] 1039 	ld	-4 (ix), b
   290D DD 36 FD 00   [19] 1040 	ld	-3 (ix), #0x00
   2911 1A            [ 7] 1041 	ld	a, (de)
   2912 6F            [ 4] 1042 	ld	l, a
   2913 26 00         [ 7] 1043 	ld	h, #0x00
   2915 29            [11] 1044 	add	hl, hl
   2916 3E 02         [ 7] 1045 	ld	a, #<(_wp)
   2918 85            [ 4] 1046 	add	a, l
   2919 6F            [ 4] 1047 	ld	l, a
   291A 3E 24         [ 7] 1048 	ld	a, #>(_wp)
   291C 8C            [ 4] 1049 	adc	a, h
   291D 67            [ 4] 1050 	ld	h, a
   291E 23            [ 6] 1051 	inc	hl
   291F 6E            [ 7] 1052 	ld	l, (hl)
   2920 26 00         [ 7] 1053 	ld	h, #0x00
   2922 DD 7E FC      [19] 1054 	ld	a, -4 (ix)
   2925 95            [ 4] 1055 	sub	a, l
   2926 6F            [ 4] 1056 	ld	l, a
   2927 DD 7E FD      [19] 1057 	ld	a, -3 (ix)
   292A 9C            [ 4] 1058 	sbc	a, h
   292B 67            [ 4] 1059 	ld	h, a
   292C D5            [11] 1060 	push	de
   292D E5            [11] 1061 	push	hl
   292E CD 5D 0D      [17] 1062 	call	_abs
   2931 F1            [10] 1063 	pop	af
   2932 D1            [10] 1064 	pop	de
   2933 7D            [ 4] 1065 	ld	a, l
   2934 D6 02         [ 7] 1066 	sub	a, #0x02
   2936 7C            [ 4] 1067 	ld	a, h
   2937 17            [ 4] 1068 	rla
   2938 3F            [ 4] 1069 	ccf
   2939 1F            [ 4] 1070 	rra
   293A DE 80         [ 7] 1071 	sbc	a, #0x80
   293C 30 19         [12] 1072 	jr	NC,00102$
                           1073 ;src/main.c:191: c->target = ((c->target+1) % WP_NUMBER);
   293E 1A            [ 7] 1074 	ld	a, (de)
   293F 6F            [ 4] 1075 	ld	l, a
   2940 26 00         [ 7] 1076 	ld	h, #0x00
   2942 23            [ 6] 1077 	inc	hl
   2943 E5            [11] 1078 	push	hl
   2944 FD E1         [14] 1079 	pop	iy
   2946 C5            [11] 1080 	push	bc
   2947 D5            [11] 1081 	push	de
   2948 21 04 00      [10] 1082 	ld	hl, #0x0004
   294B E5            [11] 1083 	push	hl
   294C FD E5         [15] 1084 	push	iy
   294E CD 09 0F      [17] 1085 	call	__modsint
   2951 F1            [10] 1086 	pop	af
   2952 F1            [10] 1087 	pop	af
   2953 D1            [10] 1088 	pop	de
   2954 C1            [10] 1089 	pop	bc
   2955 7D            [ 4] 1090 	ld	a, l
   2956 12            [ 7] 1091 	ld	(de), a
   2957                    1092 00102$:
                           1093 ;src/main.c:189: if ((abs(xc - wp[c->target].x) < 2) && (abs(yc - wp[c->target].y) < 2)){
   2957 1A            [ 7] 1094 	ld	a, (de)
   2958 6F            [ 4] 1095 	ld	l, a
                           1096 ;src/main.c:193: xwp = wp[c->target].x;
   2959 26 00         [ 7] 1097 	ld	h, #0x00
   295B 29            [11] 1098 	add	hl, hl
   295C 11 02 24      [10] 1099 	ld	de, #_wp
   295F 19            [11] 1100 	add	hl, de
   2960 7E            [ 7] 1101 	ld	a, (hl)
   2961 DD 77 FB      [19] 1102 	ld	-5 (ix), a
                           1103 ;src/main.c:194: ywp = wp[c->target].y;
   2964 23            [ 6] 1104 	inc	hl
   2965 66            [ 7] 1105 	ld	h, (hl)
                           1106 ;src/main.c:196: if (ywp < yc){
   2966 7C            [ 4] 1107 	ld	a, h
   2967 90            [ 4] 1108 	sub	a, b
   2968 3E 00         [ 7] 1109 	ld	a, #0x00
   296A 17            [ 4] 1110 	rla
   296B 6F            [ 4] 1111 	ld	l, a
                           1112 ;src/main.c:197: c->dir = 96;
   296C DD 7E FE      [19] 1113 	ld	a, -2 (ix)
   296F C6 0E         [ 7] 1114 	add	a, #0x0e
   2971 5F            [ 4] 1115 	ld	e, a
   2972 DD 7E FF      [19] 1116 	ld	a, -1 (ix)
   2975 CE 00         [ 7] 1117 	adc	a, #0x00
   2977 57            [ 4] 1118 	ld	d, a
                           1119 ;src/main.c:198: } else if (ywp > yc){
   2978 78            [ 4] 1120 	ld	a, b
   2979 94            [ 4] 1121 	sub	a, h
   297A 3E 00         [ 7] 1122 	ld	a, #0x00
   297C 17            [ 4] 1123 	rla
   297D 47            [ 4] 1124 	ld	b, a
                           1125 ;src/main.c:195: if (xwp < xc){
   297E DD 7E FB      [19] 1126 	ld	a, -5 (ix)
   2981 91            [ 4] 1127 	sub	a, c
   2982 30 17         [12] 1128 	jr	NC,00123$
                           1129 ;src/main.c:196: if (ywp < yc){
   2984 7D            [ 4] 1130 	ld	a, l
   2985 B7            [ 4] 1131 	or	a, a
   2986 28 05         [12] 1132 	jr	Z,00108$
                           1133 ;src/main.c:197: c->dir = 96;
   2988 3E 60         [ 7] 1134 	ld	a, #0x60
   298A 12            [ 7] 1135 	ld	(de), a
   298B 18 36         [12] 1136 	jr	00125$
   298D                    1137 00108$:
                           1138 ;src/main.c:198: } else if (ywp > yc){
   298D 78            [ 4] 1139 	ld	a, b
   298E B7            [ 4] 1140 	or	a, a
   298F 28 05         [12] 1141 	jr	Z,00105$
                           1142 ;src/main.c:199: c->dir = 160;
   2991 3E A0         [ 7] 1143 	ld	a, #0xa0
   2993 12            [ 7] 1144 	ld	(de), a
   2994 18 2D         [12] 1145 	jr	00125$
   2996                    1146 00105$:
                           1147 ;src/main.c:201: c->dir = 128;
   2996 3E 80         [ 7] 1148 	ld	a, #0x80
   2998 12            [ 7] 1149 	ld	(de), a
   2999 18 28         [12] 1150 	jr	00125$
   299B                    1151 00123$:
                           1152 ;src/main.c:202: } else if (xwp > xc){
   299B 79            [ 4] 1153 	ld	a, c
   299C DD 96 FB      [19] 1154 	sub	a, -5 (ix)
   299F 30 16         [12] 1155 	jr	NC,00120$
                           1156 ;src/main.c:203: if (ywp < yc){
   29A1 7D            [ 4] 1157 	ld	a, l
   29A2 B7            [ 4] 1158 	or	a, a
   29A3 28 05         [12] 1159 	jr	Z,00114$
                           1160 ;src/main.c:204: c->dir = 32;
   29A5 3E 20         [ 7] 1161 	ld	a, #0x20
   29A7 12            [ 7] 1162 	ld	(de), a
   29A8 18 19         [12] 1163 	jr	00125$
   29AA                    1164 00114$:
                           1165 ;src/main.c:205: } else if (ywp > yc){
   29AA 78            [ 4] 1166 	ld	a, b
   29AB B7            [ 4] 1167 	or	a, a
   29AC 28 05         [12] 1168 	jr	Z,00111$
                           1169 ;src/main.c:206: c->dir = 224;
   29AE 3E E0         [ 7] 1170 	ld	a, #0xe0
   29B0 12            [ 7] 1171 	ld	(de), a
   29B1 18 10         [12] 1172 	jr	00125$
   29B3                    1173 00111$:
                           1174 ;src/main.c:208: c->dir = 0;
   29B3 AF            [ 4] 1175 	xor	a, a
   29B4 12            [ 7] 1176 	ld	(de), a
   29B5 18 0C         [12] 1177 	jr	00125$
   29B7                    1178 00120$:
                           1179 ;src/main.c:209: } else if (ywp < yc){
   29B7 7D            [ 4] 1180 	ld	a, l
   29B8 B7            [ 4] 1181 	or	a, a
   29B9 28 05         [12] 1182 	jr	Z,00117$
                           1183 ;src/main.c:210: c->dir = 64;
   29BB 3E 40         [ 7] 1184 	ld	a, #0x40
   29BD 12            [ 7] 1185 	ld	(de), a
   29BE 18 03         [12] 1186 	jr	00125$
   29C0                    1187 00117$:
                           1188 ;src/main.c:212: c->dir = 192;
   29C0 3E C0         [ 7] 1189 	ld	a, #0xc0
   29C2 12            [ 7] 1190 	ld	(de), a
   29C3                    1191 00125$:
   29C3 DD F9         [10] 1192 	ld	sp, ix
   29C5 DD E1         [14] 1193 	pop	ix
   29C7 C9            [10] 1194 	ret
                           1195 ;src/main.c:215: void updateCharacter(TCharacter *c){
                           1196 ;	---------------------------------
                           1197 ; Function updateCharacter
                           1198 ; ---------------------------------
   29C8                    1199 _updateCharacter::
   29C8 DD E5         [15] 1200 	push	ix
   29CA DD 21 00 00   [14] 1201 	ld	ix,#0
   29CE DD 39         [15] 1202 	add	ix,sp
   29D0 21 F8 FF      [10] 1203 	ld	hl, #-8
   29D3 39            [11] 1204 	add	hl, sp
   29D4 F9            [ 6] 1205 	ld	sp, hl
                           1206 ;src/main.c:217: if (c->motion)
   29D5 DD 4E 04      [19] 1207 	ld	c,4 (ix)
   29D8 DD 46 05      [19] 1208 	ld	b,5 (ix)
   29DB C5            [11] 1209 	push	bc
   29DC FD E1         [14] 1210 	pop	iy
   29DE FD 7E 0F      [19] 1211 	ld	a, 15 (iy)
   29E1 B7            [ 4] 1212 	or	a, a
   29E2 28 07         [12] 1213 	jr	Z,00102$
                           1214 ;src/main.c:218: motionUpdate(c);
   29E4 C5            [11] 1215 	push	bc
   29E5 C5            [11] 1216 	push	bc
   29E6 CD A0 28      [17] 1217 	call	_motionUpdate
   29E9 F1            [10] 1218 	pop	af
   29EA C1            [10] 1219 	pop	bc
   29EB                    1220 00102$:
                           1221 ;src/main.c:222: c->vx = (c->a * cosine(c->dir * DIR_STEP));
   29EB 21 08 00      [10] 1222 	ld	hl, #0x0008
   29EE 09            [11] 1223 	add	hl,bc
   29EF DD 75 FE      [19] 1224 	ld	-2 (ix), l
   29F2 DD 74 FF      [19] 1225 	ld	-1 (ix), h
   29F5 21 0C 00      [10] 1226 	ld	hl, #0x000c
   29F8 09            [11] 1227 	add	hl,bc
   29F9 DD 75 FC      [19] 1228 	ld	-4 (ix), l
   29FC DD 74 FD      [19] 1229 	ld	-3 (ix), h
   29FF 7E            [ 7] 1230 	ld	a, (hl)
   2A00 DD 77 FA      [19] 1231 	ld	-6 (ix), a
   2A03 23            [ 6] 1232 	inc	hl
   2A04 7E            [ 7] 1233 	ld	a, (hl)
   2A05 DD 77 FB      [19] 1234 	ld	-5 (ix), a
   2A08 21 0E 00      [10] 1235 	ld	hl, #0x000e
   2A0B 09            [11] 1236 	add	hl,bc
   2A0C E3            [19] 1237 	ex	(sp), hl
   2A0D E1            [10] 1238 	pop	hl
   2A0E E5            [11] 1239 	push	hl
   2A0F 56            [ 7] 1240 	ld	d, (hl)
   2A10 C5            [11] 1241 	push	bc
   2A11 D5            [11] 1242 	push	de
   2A12 33            [ 6] 1243 	inc	sp
   2A13 CD 3E 1F      [17] 1244 	call	___uchar2fs
   2A16 33            [ 6] 1245 	inc	sp
   2A17 EB            [ 4] 1246 	ex	de, hl
   2A18 E5            [11] 1247 	push	hl
   2A19 D5            [11] 1248 	push	de
   2A1A 21 B3 3F      [10] 1249 	ld	hl, #0x3fb3
   2A1D E5            [11] 1250 	push	hl
   2A1E 21 33 33      [10] 1251 	ld	hl, #0x3333
   2A21 E5            [11] 1252 	push	hl
   2A22 CD 89 1B      [17] 1253 	call	___fsmul
   2A25 F1            [10] 1254 	pop	af
   2A26 F1            [10] 1255 	pop	af
   2A27 F1            [10] 1256 	pop	af
   2A28 F1            [10] 1257 	pop	af
   2A29 D5            [11] 1258 	push	de
   2A2A E5            [11] 1259 	push	hl
   2A2B CD EE 1E      [17] 1260 	call	___fs2sint
   2A2E F1            [10] 1261 	pop	af
   2A2F E3            [19] 1262 	ex	(sp),hl
   2A30 CD 42 04      [17] 1263 	call	_cosine
   2A33 E3            [19] 1264 	ex	(sp),hl
   2A34 DD 6E FA      [19] 1265 	ld	l,-6 (ix)
   2A37 DD 66 FB      [19] 1266 	ld	h,-5 (ix)
   2A3A E5            [11] 1267 	push	hl
   2A3B CD 73 0D      [17] 1268 	call	__mulint
   2A3E F1            [10] 1269 	pop	af
   2A3F F1            [10] 1270 	pop	af
   2A40 EB            [ 4] 1271 	ex	de,hl
   2A41 C1            [10] 1272 	pop	bc
   2A42 DD 6E FE      [19] 1273 	ld	l,-2 (ix)
   2A45 DD 66 FF      [19] 1274 	ld	h,-1 (ix)
   2A48 73            [ 7] 1275 	ld	(hl), e
   2A49 23            [ 6] 1276 	inc	hl
   2A4A 72            [ 7] 1277 	ld	(hl), d
                           1278 ;src/main.c:223: c->vy = - (c->a * sine(c->dir * DIR_STEP));
   2A4B 21 0A 00      [10] 1279 	ld	hl, #0x000a
   2A4E 09            [11] 1280 	add	hl,bc
   2A4F DD 75 FA      [19] 1281 	ld	-6 (ix), l
   2A52 DD 74 FB      [19] 1282 	ld	-5 (ix), h
   2A55 DD 6E FC      [19] 1283 	ld	l,-4 (ix)
   2A58 DD 66 FD      [19] 1284 	ld	h,-3 (ix)
   2A5B 7E            [ 7] 1285 	ld	a, (hl)
   2A5C DD 77 FC      [19] 1286 	ld	-4 (ix), a
   2A5F 23            [ 6] 1287 	inc	hl
   2A60 7E            [ 7] 1288 	ld	a, (hl)
   2A61 DD 77 FD      [19] 1289 	ld	-3 (ix), a
   2A64 E1            [10] 1290 	pop	hl
   2A65 E5            [11] 1291 	push	hl
   2A66 56            [ 7] 1292 	ld	d, (hl)
   2A67 C5            [11] 1293 	push	bc
   2A68 D5            [11] 1294 	push	de
   2A69 33            [ 6] 1295 	inc	sp
   2A6A CD 3E 1F      [17] 1296 	call	___uchar2fs
   2A6D 33            [ 6] 1297 	inc	sp
   2A6E EB            [ 4] 1298 	ex	de, hl
   2A6F E5            [11] 1299 	push	hl
   2A70 D5            [11] 1300 	push	de
   2A71 21 B3 3F      [10] 1301 	ld	hl, #0x3fb3
   2A74 E5            [11] 1302 	push	hl
   2A75 21 33 33      [10] 1303 	ld	hl, #0x3333
   2A78 E5            [11] 1304 	push	hl
   2A79 CD 89 1B      [17] 1305 	call	___fsmul
   2A7C F1            [10] 1306 	pop	af
   2A7D F1            [10] 1307 	pop	af
   2A7E F1            [10] 1308 	pop	af
   2A7F F1            [10] 1309 	pop	af
   2A80 D5            [11] 1310 	push	de
   2A81 E5            [11] 1311 	push	hl
   2A82 CD EE 1E      [17] 1312 	call	___fs2sint
   2A85 F1            [10] 1313 	pop	af
   2A86 E3            [19] 1314 	ex	(sp),hl
   2A87 CD 00 03      [17] 1315 	call	_sine
   2A8A E3            [19] 1316 	ex	(sp),hl
   2A8B DD 6E FC      [19] 1317 	ld	l,-4 (ix)
   2A8E DD 66 FD      [19] 1318 	ld	h,-3 (ix)
   2A91 E5            [11] 1319 	push	hl
   2A92 CD 73 0D      [17] 1320 	call	__mulint
   2A95 F1            [10] 1321 	pop	af
   2A96 F1            [10] 1322 	pop	af
   2A97 C1            [10] 1323 	pop	bc
   2A98 AF            [ 4] 1324 	xor	a, a
   2A99 95            [ 4] 1325 	sub	a, l
   2A9A 5F            [ 4] 1326 	ld	e, a
   2A9B 3E 00         [ 7] 1327 	ld	a, #0x00
   2A9D 9C            [ 4] 1328 	sbc	a, h
   2A9E 57            [ 4] 1329 	ld	d, a
   2A9F DD 6E FA      [19] 1330 	ld	l,-6 (ix)
   2AA2 DD 66 FB      [19] 1331 	ld	h,-5 (ix)
   2AA5 73            [ 7] 1332 	ld	(hl), e
   2AA6 23            [ 6] 1333 	inc	hl
   2AA7 72            [ 7] 1334 	ld	(hl), d
                           1335 ;src/main.c:238: c->x = c->x + c->vx;
   2AA8 69            [ 4] 1336 	ld	l, c
   2AA9 60            [ 4] 1337 	ld	h, b
   2AAA 5E            [ 7] 1338 	ld	e, (hl)
   2AAB 23            [ 6] 1339 	inc	hl
   2AAC 56            [ 7] 1340 	ld	d, (hl)
   2AAD DD 6E FE      [19] 1341 	ld	l,-2 (ix)
   2AB0 DD 66 FF      [19] 1342 	ld	h,-1 (ix)
   2AB3 7E            [ 7] 1343 	ld	a, (hl)
   2AB4 23            [ 6] 1344 	inc	hl
   2AB5 66            [ 7] 1345 	ld	h, (hl)
   2AB6 6F            [ 4] 1346 	ld	l, a
   2AB7 19            [11] 1347 	add	hl,de
   2AB8 EB            [ 4] 1348 	ex	de,hl
   2AB9 69            [ 4] 1349 	ld	l, c
   2ABA 60            [ 4] 1350 	ld	h, b
   2ABB 73            [ 7] 1351 	ld	(hl), e
   2ABC 23            [ 6] 1352 	inc	hl
   2ABD 72            [ 7] 1353 	ld	(hl), d
                           1354 ;src/main.c:239: c->y = c->y + c->vy;
   2ABE 03            [ 6] 1355 	inc	bc
   2ABF 03            [ 6] 1356 	inc	bc
   2AC0 69            [ 4] 1357 	ld	l, c
   2AC1 60            [ 4] 1358 	ld	h, b
   2AC2 5E            [ 7] 1359 	ld	e, (hl)
   2AC3 23            [ 6] 1360 	inc	hl
   2AC4 56            [ 7] 1361 	ld	d, (hl)
   2AC5 DD 6E FA      [19] 1362 	ld	l,-6 (ix)
   2AC8 DD 66 FB      [19] 1363 	ld	h,-5 (ix)
   2ACB 7E            [ 7] 1364 	ld	a, (hl)
   2ACC 23            [ 6] 1365 	inc	hl
   2ACD 66            [ 7] 1366 	ld	h, (hl)
   2ACE 6F            [ 4] 1367 	ld	l, a
   2ACF 19            [11] 1368 	add	hl,de
   2AD0 EB            [ 4] 1369 	ex	de,hl
   2AD1 7B            [ 4] 1370 	ld	a, e
   2AD2 02            [ 7] 1371 	ld	(bc), a
   2AD3 03            [ 6] 1372 	inc	bc
   2AD4 7A            [ 4] 1373 	ld	a, d
   2AD5 02            [ 7] 1374 	ld	(bc), a
   2AD6 DD F9         [10] 1375 	ld	sp, ix
   2AD8 DD E1         [14] 1376 	pop	ix
   2ADA C9            [10] 1377 	ret
                           1378 ;src/main.c:246: void init(TCharacter *c){
                           1379 ;	---------------------------------
                           1380 ; Function init
                           1381 ; ---------------------------------
   2ADB                    1382 _init::
   2ADB DD E5         [15] 1383 	push	ix
   2ADD DD 21 00 00   [14] 1384 	ld	ix,#0
   2AE1 DD 39         [15] 1385 	add	ix,sp
                           1386 ;src/main.c:248: g_nInterrupt = 0; // Manage Interrupt
   2AE3 21 84 1B      [10] 1387 	ld	hl,#_g_nInterrupt + 0
   2AE6 36 00         [10] 1388 	ld	(hl), #0x00
                           1389 ;src/main.c:249: i_time = 0;
   2AE8 AF            [ 4] 1390 	xor	a, a
   2AE9 FD 21 85 1B   [14] 1391 	ld	iy, #_i_time
   2AED FD 77 00      [19] 1392 	ld	0 (iy), a
   2AF0 FD 77 01      [19] 1393 	ld	1 (iy), a
   2AF3 FD 77 02      [19] 1394 	ld	2 (iy), a
   2AF6 FD 77 03      [19] 1395 	ld	3 (iy), a
                           1396 ;src/main.c:250: cpct_setInterruptHandler((void*) myInterruptHandler);
   2AF9 21 D6 23      [10] 1397 	ld	hl, #_myInterruptHandler
   2AFC CD 71 0F      [17] 1398 	call	_cpct_setInterruptHandler
                           1399 ;src/main.c:251: cpct_setVideoMode(0);
   2AFF 2E 00         [ 7] 1400 	ld	l, #0x00
   2B01 CD 29 0E      [17] 1401 	call	_cpct_setVideoMode
                           1402 ;src/main.c:253: c->x = 20 << 8;
   2B04 DD 4E 04      [19] 1403 	ld	c,4 (ix)
   2B07 DD 46 05      [19] 1404 	ld	b,5 (ix)
   2B0A 69            [ 4] 1405 	ld	l, c
   2B0B 60            [ 4] 1406 	ld	h, b
   2B0C 36 00         [10] 1407 	ld	(hl), #0x00
   2B0E 23            [ 6] 1408 	inc	hl
   2B0F 36 14         [10] 1409 	ld	(hl), #0x14
                           1410 ;src/main.c:254: c->px = c->x ;
   2B11 FD 21 04 00   [14] 1411 	ld	iy, #0x0004
   2B15 FD 09         [15] 1412 	add	iy, bc
   2B17 69            [ 4] 1413 	ld	l, c
   2B18 60            [ 4] 1414 	ld	h, b
   2B19 5E            [ 7] 1415 	ld	e, (hl)
   2B1A 23            [ 6] 1416 	inc	hl
   2B1B 56            [ 7] 1417 	ld	d, (hl)
   2B1C FD 73 00      [19] 1418 	ld	0 (iy), e
   2B1F FD 72 01      [19] 1419 	ld	1 (iy), d
                           1420 ;src/main.c:255: c->y = 20 << 8;
   2B22 69            [ 4] 1421 	ld	l, c
   2B23 60            [ 4] 1422 	ld	h, b
   2B24 23            [ 6] 1423 	inc	hl
   2B25 23            [ 6] 1424 	inc	hl
   2B26 36 00         [10] 1425 	ld	(hl), #0x00
   2B28 23            [ 6] 1426 	inc	hl
   2B29 36 14         [10] 1427 	ld	(hl), #0x14
   2B2B 2B            [ 6] 1428 	dec	hl
                           1429 ;src/main.c:256: c->py = c->y;
   2B2C FD 21 06 00   [14] 1430 	ld	iy, #0x0006
   2B30 FD 09         [15] 1431 	add	iy, bc
   2B32 5E            [ 7] 1432 	ld	e, (hl)
   2B33 23            [ 6] 1433 	inc	hl
   2B34 56            [ 7] 1434 	ld	d, (hl)
   2B35 FD 73 00      [19] 1435 	ld	0 (iy), e
   2B38 FD 72 01      [19] 1436 	ld	1 (iy), d
                           1437 ;src/main.c:257: c->vx = 0;
   2B3B 21 08 00      [10] 1438 	ld	hl, #0x0008
   2B3E 09            [11] 1439 	add	hl, bc
   2B3F AF            [ 4] 1440 	xor	a, a
   2B40 77            [ 7] 1441 	ld	(hl), a
   2B41 23            [ 6] 1442 	inc	hl
   2B42 77            [ 7] 1443 	ld	(hl), a
                           1444 ;src/main.c:258: c->vy = 0;
   2B43 21 0A 00      [10] 1445 	ld	hl, #0x000a
   2B46 09            [11] 1446 	add	hl, bc
   2B47 AF            [ 4] 1447 	xor	a, a
   2B48 77            [ 7] 1448 	ld	(hl), a
   2B49 23            [ 6] 1449 	inc	hl
   2B4A 77            [ 7] 1450 	ld	(hl), a
                           1451 ;src/main.c:259: c->a = 0;
   2B4B 21 0C 00      [10] 1452 	ld	hl, #0x000c
   2B4E 09            [11] 1453 	add	hl, bc
   2B4F AF            [ 4] 1454 	xor	a, a
   2B50 77            [ 7] 1455 	ld	(hl), a
   2B51 23            [ 6] 1456 	inc	hl
   2B52 77            [ 7] 1457 	ld	(hl), a
                           1458 ;src/main.c:260: c->dir = 0;
   2B53 21 0E 00      [10] 1459 	ld	hl, #0x000e
   2B56 09            [11] 1460 	add	hl, bc
   2B57 36 00         [10] 1461 	ld	(hl), #0x00
                           1462 ;src/main.c:261: c->motion = 0;
   2B59 21 0F 00      [10] 1463 	ld	hl, #0x000f
   2B5C 09            [11] 1464 	add	hl, bc
   2B5D 36 00         [10] 1465 	ld	(hl), #0x00
                           1466 ;src/main.c:262: c->target = 0;
   2B5F 21 10 00      [10] 1467 	ld	hl, #0x0010
   2B62 09            [11] 1468 	add	hl, bc
   2B63 36 00         [10] 1469 	ld	(hl), #0x00
                           1470 ;src/main.c:264: printWayPoints();
   2B65 CD FA 24      [17] 1471 	call	_printWayPoints
                           1472 ;src/main.c:266: pause = 0;
   2B68 21 83 1B      [10] 1473 	ld	hl,#_pause + 0
   2B6B 36 00         [10] 1474 	ld	(hl), #0x00
   2B6D DD E1         [14] 1475 	pop	ix
   2B6F C9            [10] 1476 	ret
                           1477 ;src/main.c:270: void main(void) {
                           1478 ;	---------------------------------
                           1479 ; Function main
                           1480 ; ---------------------------------
   2B70                    1481 _main::
   2B70 DD E5         [15] 1482 	push	ix
   2B72 21 EF FF      [10] 1483 	ld	hl, #-17
   2B75 39            [11] 1484 	add	hl, sp
   2B76 F9            [ 6] 1485 	ld	sp, hl
                           1486 ;src/main.c:274: init(&c);
   2B77 21 00 00      [10] 1487 	ld	hl, #0x0000
   2B7A 39            [11] 1488 	add	hl, sp
   2B7B 4D            [ 4] 1489 	ld	c, l
   2B7C 44            [ 4] 1490 	ld	b, h
   2B7D 59            [ 4] 1491 	ld	e, c
   2B7E 50            [ 4] 1492 	ld	d, b
   2B7F C5            [11] 1493 	push	bc
   2B80 D5            [11] 1494 	push	de
   2B81 CD DB 2A      [17] 1495 	call	_init
   2B84 F1            [10] 1496 	pop	af
   2B85 C1            [10] 1497 	pop	bc
                           1498 ;src/main.c:276: printCharacter(&c);
   2B86 59            [ 4] 1499 	ld	e, c
   2B87 50            [ 4] 1500 	ld	d, b
   2B88 C5            [11] 1501 	push	bc
   2B89 D5            [11] 1502 	push	de
   2B8A CD 49 24      [17] 1503 	call	_printCharacter
   2B8D F1            [10] 1504 	pop	af
   2B8E C1            [10] 1505 	pop	bc
                           1506 ;src/main.c:279: while (1){    
   2B8F                    1507 00102$:
                           1508 ;src/main.c:281: cpct_waitHalts(5);
   2B8F C5            [11] 1509 	push	bc
   2B90 2E 05         [ 7] 1510 	ld	l, #0x05
   2B92 CD 8D 0D      [17] 1511 	call	_cpct_waitHalts
   2B95 C1            [10] 1512 	pop	bc
                           1513 ;src/main.c:282: getCharacterInput(&c);
   2B96 59            [ 4] 1514 	ld	e, c
   2B97 50            [ 4] 1515 	ld	d, b
   2B98 C5            [11] 1516 	push	bc
   2B99 D5            [11] 1517 	push	de
   2B9A CD D4 27      [17] 1518 	call	_getCharacterInput
   2B9D F1            [10] 1519 	pop	af
   2B9E C1            [10] 1520 	pop	bc
                           1521 ;src/main.c:283: updateCharacter(&c);
   2B9F 59            [ 4] 1522 	ld	e, c
   2BA0 50            [ 4] 1523 	ld	d, b
   2BA1 C5            [11] 1524 	push	bc
   2BA2 D5            [11] 1525 	push	de
   2BA3 CD C8 29      [17] 1526 	call	_updateCharacter
   2BA6 F1            [10] 1527 	pop	af
   2BA7 C1            [10] 1528 	pop	bc
                           1529 ;src/main.c:284: eraseCharacter(&c);
   2BA8 59            [ 4] 1530 	ld	e, c
   2BA9 50            [ 4] 1531 	ld	d, b
   2BAA C5            [11] 1532 	push	bc
   2BAB D5            [11] 1533 	push	de
   2BAC CD 0A 24      [17] 1534 	call	_eraseCharacter
   2BAF F1            [10] 1535 	pop	af
   2BB0 C1            [10] 1536 	pop	bc
                           1537 ;src/main.c:285: printCharacter(&c);
   2BB1 59            [ 4] 1538 	ld	e, c
   2BB2 50            [ 4] 1539 	ld	d, b
   2BB3 C5            [11] 1540 	push	bc
   2BB4 D5            [11] 1541 	push	de
   2BB5 CD 49 24      [17] 1542 	call	_printCharacter
   2BB8 F1            [10] 1543 	pop	af
   2BB9 C1            [10] 1544 	pop	bc
                           1545 ;src/main.c:286: c.px = c.x;
   2BBA FD 21 04 00   [14] 1546 	ld	iy, #0x0004
   2BBE FD 09         [15] 1547 	add	iy, bc
   2BC0 69            [ 4] 1548 	ld	l, c
   2BC1 60            [ 4] 1549 	ld	h, b
   2BC2 5E            [ 7] 1550 	ld	e, (hl)
   2BC3 23            [ 6] 1551 	inc	hl
   2BC4 56            [ 7] 1552 	ld	d, (hl)
   2BC5 FD 73 00      [19] 1553 	ld	0 (iy), e
   2BC8 FD 72 01      [19] 1554 	ld	1 (iy), d
                           1555 ;src/main.c:287: c.py = c.y;
   2BCB FD 21 06 00   [14] 1556 	ld	iy, #0x0006
   2BCF FD 09         [15] 1557 	add	iy, bc
   2BD1 69            [ 4] 1558 	ld	l, c
   2BD2 60            [ 4] 1559 	ld	h, b
   2BD3 23            [ 6] 1560 	inc	hl
   2BD4 23            [ 6] 1561 	inc	hl
   2BD5 5E            [ 7] 1562 	ld	e, (hl)
   2BD6 23            [ 6] 1563 	inc	hl
   2BD7 56            [ 7] 1564 	ld	d, (hl)
   2BD8 FD 73 00      [19] 1565 	ld	0 (iy), e
   2BDB FD 72 01      [19] 1566 	ld	1 (iy), d
   2BDE 18 AF         [12] 1567 	jr	00102$
                           1568 	.area _CODE
                           1569 	.area _INITIALIZER
                           1570 	.area _CABS (ABS)
