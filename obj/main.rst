                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
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
   1B97                      47 _pause::
   1B97                      48 	.ds 1
   1B98                      49 _g_nInterrupt::
   1B98                      50 	.ds 1
   1B99                      51 _i_time::
   1B99                      52 	.ds 4
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
   23D5                     122 _myInterruptHandler::
                            123 ;src/main.c:49: i_time++;
   23D5 FD 21 99 1B   [14]  124 	ld	iy, #_i_time
   23D9 FD 34 00      [23]  125 	inc	0 (iy)
   23DC 20 0D         [12]  126 	jr	NZ,00109$
   23DE FD 34 01      [23]  127 	inc	1 (iy)
   23E1 20 08         [12]  128 	jr	NZ,00109$
   23E3 FD 34 02      [23]  129 	inc	2 (iy)
   23E6 20 03         [12]  130 	jr	NZ,00109$
   23E8 FD 34 03      [23]  131 	inc	3 (iy)
   23EB                     132 00109$:
                            133 ;src/main.c:51: if (++g_nInterrupt == 6)
   23EB FD 21 98 1B   [14]  134 	ld	iy, #_g_nInterrupt
   23EF FD 34 00      [23]  135 	inc	0 (iy)
   23F2 FD 7E 00      [19]  136 	ld	a, 0 (iy)
   23F5 D6 06         [ 7]  137 	sub	a, #0x06
   23F7 C0            [11]  138 	ret	NZ
                            139 ;src/main.c:53: cpct_scanKeyboard_f();
   23F8 CD 53 0C      [17]  140 	call	_cpct_scanKeyboard_f
                            141 ;src/main.c:54: g_nInterrupt = 0;
   23FB 21 98 1B      [10]  142 	ld	hl,#_g_nInterrupt + 0
   23FE 36 00         [10]  143 	ld	(hl), #0x00
   2400 C9            [10]  144 	ret
   2401                     145 _wp:
   2401 01                  146 	.db #0x01	; 1
   2402 01                  147 	.db #0x01	; 1
   2403 0A                  148 	.db #0x0a	; 10
   2404 64                  149 	.db #0x64	; 100	'd'
   2405 28                  150 	.db #0x28	; 40
   2406 B4                  151 	.db #0xb4	; 180
   2407 46                  152 	.db #0x46	; 70	'F'
   2408 64                  153 	.db #0x64	; 100	'd'
                            154 ;src/main.c:58: void eraseCharacter(TCharacter *c){
                            155 ;	---------------------------------
                            156 ; Function eraseCharacter
                            157 ; ---------------------------------
   2409                     158 _eraseCharacter::
   2409 DD E5         [15]  159 	push	ix
   240B DD 21 00 00   [14]  160 	ld	ix,#0
   240F DD 39         [15]  161 	add	ix,sp
                            162 ;src/main.c:62: x=c->px/256;
   2411 DD 5E 04      [19]  163 	ld	e,4 (ix)
   2414 DD 56 05      [19]  164 	ld	d,5 (ix)
   2417 6B            [ 4]  165 	ld	l, e
   2418 62            [ 4]  166 	ld	h, d
   2419 01 04 00      [10]  167 	ld	bc, #0x0004
   241C 09            [11]  168 	add	hl, bc
   241D 46            [ 7]  169 	ld	b, (hl)
   241E 23            [ 6]  170 	inc	hl
   241F 4E            [ 7]  171 	ld	c, (hl)
                            172 ;src/main.c:63: y=c->py/256;
   2420 EB            [ 4]  173 	ex	de,hl
   2421 11 06 00      [10]  174 	ld	de, #0x0006
   2424 19            [11]  175 	add	hl, de
   2425 5E            [ 7]  176 	ld	e, (hl)
   2426 23            [ 6]  177 	inc	hl
   2427 56            [ 7]  178 	ld	d, (hl)
                            179 ;src/main.c:65: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, x, y);
   2428 59            [ 4]  180 	ld	e, c
   2429 D5            [11]  181 	push	de
   242A 21 00 C0      [10]  182 	ld	hl, #0xc000
   242D E5            [11]  183 	push	hl
   242E CD 65 0F      [17]  184 	call	_cpct_getScreenPtr
                            185 ;src/main.c:66: cpct_drawSolidBox (pvmem, cpct_px2byteM0 (0, 0), CH_WIDTH, CH_HEIGHT);
   2431 E5            [11]  186 	push	hl
   2432 21 00 00      [10]  187 	ld	hl, #0x0000
   2435 E5            [11]  188 	push	hl
   2436 CD 3C 0E      [17]  189 	call	_cpct_px2byteM0
   2439 55            [ 4]  190 	ld	d, l
   243A C1            [10]  191 	pop	bc
   243B 21 06 06      [10]  192 	ld	hl, #0x0606
   243E E5            [11]  193 	push	hl
   243F D5            [11]  194 	push	de
   2440 33            [ 6]  195 	inc	sp
   2441 C5            [11]  196 	push	bc
   2442 CD 58 0E      [17]  197 	call	_cpct_drawSolidBox
   2445 F1            [10]  198 	pop	af
   2446 F1            [10]  199 	pop	af
   2447 33            [ 6]  200 	inc	sp
   2448 DD E1         [14]  201 	pop	ix
   244A C9            [10]  202 	ret
                            203 ;src/main.c:69: void printCharacter(TCharacter *c){
                            204 ;	---------------------------------
                            205 ; Function printCharacter
                            206 ; ---------------------------------
   244B                     207 _printCharacter::
   244B DD E5         [15]  208 	push	ix
   244D DD 21 00 00   [14]  209 	ld	ix,#0
   2451 DD 39         [15]  210 	add	ix,sp
   2453 3B            [ 6]  211 	dec	sp
                            212 ;src/main.c:75: x = c->x >> 8;
   2454 DD 5E 04      [19]  213 	ld	e,4 (ix)
   2457 DD 56 05      [19]  214 	ld	d,5 (ix)
   245A 6B            [ 4]  215 	ld	l, e
   245B 62            [ 4]  216 	ld	h, d
   245C 46            [ 7]  217 	ld	b, (hl)
   245D 23            [ 6]  218 	inc	hl
   245E 4E            [ 7]  219 	ld	c, (hl)
                            220 ;src/main.c:76: y = c->y >> 8;
   245F 6B            [ 4]  221 	ld	l, e
   2460 62            [ 4]  222 	ld	h, d
   2461 23            [ 6]  223 	inc	hl
   2462 23            [ 6]  224 	inc	hl
   2463 7E            [ 7]  225 	ld	a, (hl)
   2464 23            [ 6]  226 	inc	hl
   2465 46            [ 7]  227 	ld	b, (hl)
                            228 ;src/main.c:78: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, x, y);
   2466 C5            [11]  229 	push	bc
   2467 D5            [11]  230 	push	de
   2468 C5            [11]  231 	push	bc
   2469 21 00 C0      [10]  232 	ld	hl, #0xc000
   246C E5            [11]  233 	push	hl
   246D CD 65 0F      [17]  234 	call	_cpct_getScreenPtr
   2470 D1            [10]  235 	pop	de
   2471 C1            [10]  236 	pop	bc
                            237 ;src/main.c:79: cpct_drawSolidBox (pvmem, cpct_px2byteM0 (CH_COLOR, CH_COLOR), CH_WIDTH, CH_HEIGHT);
   2472 E5            [11]  238 	push	hl
   2473 C5            [11]  239 	push	bc
   2474 D5            [11]  240 	push	de
   2475 21 03 03      [10]  241 	ld	hl, #0x0303
   2478 E5            [11]  242 	push	hl
   2479 CD 3C 0E      [17]  243 	call	_cpct_px2byteM0
   247C DD 75 FF      [19]  244 	ld	-1 (ix), l
   247F D1            [10]  245 	pop	de
   2480 C1            [10]  246 	pop	bc
   2481 FD E1         [14]  247 	pop	iy
   2483 C5            [11]  248 	push	bc
   2484 D5            [11]  249 	push	de
   2485 21 06 06      [10]  250 	ld	hl, #0x0606
   2488 E5            [11]  251 	push	hl
   2489 DD 7E FF      [19]  252 	ld	a, -1 (ix)
   248C F5            [11]  253 	push	af
   248D 33            [ 6]  254 	inc	sp
   248E FD E5         [15]  255 	push	iy
   2490 CD 58 0E      [17]  256 	call	_cpct_drawSolidBox
   2493 F1            [10]  257 	pop	af
   2494 F1            [10]  258 	pop	af
   2495 33            [ 6]  259 	inc	sp
   2496 D1            [10]  260 	pop	de
   2497 C1            [10]  261 	pop	bc
                            262 ;src/main.c:81: if (c->dir<32){
   2498 D5            [11]  263 	push	de
   2499 FD E1         [14]  264 	pop	iy
   249B FD 5E 0E      [19]  265 	ld	e, 14 (iy)
                            266 ;src/main.c:82: x = x + 4;
   249E 69            [ 4]  267 	ld	l, c
   249F 2C            [ 4]  268 	inc	l
   24A0 2C            [ 4]  269 	inc	l
   24A1 2C            [ 4]  270 	inc	l
   24A2 2C            [ 4]  271 	inc	l
                            272 ;src/main.c:83: y = y + 2;
   24A3 50            [ 4]  273 	ld	d, b
   24A4 14            [ 4]  274 	inc	d
   24A5 14            [ 4]  275 	inc	d
                            276 ;src/main.c:81: if (c->dir<32){
   24A6 7B            [ 4]  277 	ld	a, e
   24A7 D6 20         [ 7]  278 	sub	a, #0x20
   24A9 30 04         [12]  279 	jr	NC,00120$
                            280 ;src/main.c:82: x = x + 4;
   24AB 4D            [ 4]  281 	ld	c, l
                            282 ;src/main.c:83: y = y + 2;
   24AC 42            [ 4]  283 	ld	b, d
   24AD 18 30         [12]  284 	jr	00121$
   24AF                     285 00120$:
                            286 ;src/main.c:84: } else if (c->dir<64){
   24AF 7B            [ 4]  287 	ld	a, e
   24B0 D6 40         [ 7]  288 	sub	a, #0x40
   24B2 30 03         [12]  289 	jr	NC,00117$
                            290 ;src/main.c:85: x = x + 4;
   24B4 4D            [ 4]  291 	ld	c, l
                            292 ;src/main.c:86: y = y;
   24B5 18 28         [12]  293 	jr	00121$
   24B7                     294 00117$:
                            295 ;src/main.c:88: x = x + 2;
   24B7 61            [ 4]  296 	ld	h, c
   24B8 24            [ 4]  297 	inc	h
   24B9 24            [ 4]  298 	inc	h
                            299 ;src/main.c:87: } else if (c->dir<96){
   24BA 7B            [ 4]  300 	ld	a, e
   24BB D6 60         [ 7]  301 	sub	a, #0x60
   24BD 30 03         [12]  302 	jr	NC,00114$
                            303 ;src/main.c:88: x = x + 2;
   24BF 4C            [ 4]  304 	ld	c, h
                            305 ;src/main.c:89: y = y;
   24C0 18 1D         [12]  306 	jr	00121$
   24C2                     307 00114$:
                            308 ;src/main.c:90: } else if (c->dir<128){
                            309 ;src/main.c:93: } else if (c->dir<160){
   24C2 7B            [ 4]  310 	ld	a,e
   24C3 FE 80         [ 7]  311 	cp	a,#0x80
   24C5 38 18         [12]  312 	jr	C,00121$
   24C7 D6 A0         [ 7]  313 	sub	a, #0xa0
   24C9 30 03         [12]  314 	jr	NC,00108$
                            315 ;src/main.c:95: y = y+2;
   24CB 42            [ 4]  316 	ld	b, d
   24CC 18 11         [12]  317 	jr	00121$
   24CE                     318 00108$:
                            319 ;src/main.c:98: y = y+4;
   24CE 04            [ 4]  320 	inc	b
   24CF 04            [ 4]  321 	inc	b
   24D0 04            [ 4]  322 	inc	b
   24D1 04            [ 4]  323 	inc	b
                            324 ;src/main.c:96: } else if (c->dir<196){
                            325 ;src/main.c:98: y = y+4;
                            326 ;src/main.c:99: } else if (c->dir<228){
   24D2 7B            [ 4]  327 	ld	a,e
   24D3 FE C4         [ 7]  328 	cp	a,#0xc4
   24D5 38 08         [12]  329 	jr	C,00121$
   24D7 D6 E4         [ 7]  330 	sub	a, #0xe4
   24D9 30 03         [12]  331 	jr	NC,00102$
                            332 ;src/main.c:100: x = x+2;
   24DB 4C            [ 4]  333 	ld	c, h
                            334 ;src/main.c:101: y = y+4;
   24DC 18 01         [12]  335 	jr	00121$
   24DE                     336 00102$:
                            337 ;src/main.c:103: x = x+4;
   24DE 4D            [ 4]  338 	ld	c, l
                            339 ;src/main.c:104: y = y+4;
   24DF                     340 00121$:
                            341 ;src/main.c:106: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, x, y);
   24DF C5            [11]  342 	push	bc
   24E0 21 00 C0      [10]  343 	ld	hl, #0xc000
   24E3 E5            [11]  344 	push	hl
   24E4 CD 65 0F      [17]  345 	call	_cpct_getScreenPtr
                            346 ;src/main.c:107: cpct_drawSolidBox (pvmem, cpct_px2byteM0 (14, 14), 2, 2);
   24E7 E5            [11]  347 	push	hl
   24E8 21 0E 0E      [10]  348 	ld	hl, #0x0e0e
   24EB E5            [11]  349 	push	hl
   24EC CD 3C 0E      [17]  350 	call	_cpct_px2byteM0
   24EF 55            [ 4]  351 	ld	d, l
   24F0 C1            [10]  352 	pop	bc
   24F1 21 02 02      [10]  353 	ld	hl, #0x0202
   24F4 E5            [11]  354 	push	hl
   24F5 D5            [11]  355 	push	de
   24F6 33            [ 6]  356 	inc	sp
   24F7 C5            [11]  357 	push	bc
   24F8 CD 58 0E      [17]  358 	call	_cpct_drawSolidBox
   24FB F1            [10]  359 	pop	af
   24FC F1            [10]  360 	pop	af
   24FD 33            [ 6]  361 	inc	sp
   24FE 33            [ 6]  362 	inc	sp
   24FF DD E1         [14]  363 	pop	ix
   2501 C9            [10]  364 	ret
                            365 ;src/main.c:110: void printWayPoints(){
                            366 ;	---------------------------------
                            367 ; Function printWayPoints
                            368 ; ---------------------------------
   2502                     369 _printWayPoints::
   2502 DD E5         [15]  370 	push	ix
   2504 DD 21 00 00   [14]  371 	ld	ix,#0
   2508 DD 39         [15]  372 	add	ix,sp
   250A 3B            [ 6]  373 	dec	sp
                            374 ;src/main.c:113: for (i=0; i<4; i++){
   250B DD 36 FF 00   [19]  375 	ld	-1 (ix), #0x00
   250F                     376 00102$:
                            377 ;src/main.c:114: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, wp[i].x, wp[i].y);
   250F DD 6E FF      [19]  378 	ld	l, -1 (ix)
   2512 26 00         [ 7]  379 	ld	h, #0x00
   2514 29            [11]  380 	add	hl, hl
   2515 01 01 24      [10]  381 	ld	bc,#_wp
   2518 09            [11]  382 	add	hl,bc
   2519 4D            [ 4]  383 	ld	c,l
   251A 44            [ 4]  384 	ld	b,h
   251B 23            [ 6]  385 	inc	hl
   251C 56            [ 7]  386 	ld	d, (hl)
   251D 0A            [ 7]  387 	ld	a, (bc)
   251E 5F            [ 4]  388 	ld	e,a
   251F D5            [11]  389 	push	de
   2520 21 00 C0      [10]  390 	ld	hl, #0xc000
   2523 E5            [11]  391 	push	hl
   2524 CD 65 0F      [17]  392 	call	_cpct_getScreenPtr
                            393 ;src/main.c:115: cpct_drawSolidBox (pvmem, cpct_px2byteM0 (WP_COLOR, WP_COLOR), WP_WIDTH, WP_HEIGHT);
   2527 E5            [11]  394 	push	hl
   2528 21 01 01      [10]  395 	ld	hl, #0x0101
   252B E5            [11]  396 	push	hl
   252C CD 3C 0E      [17]  397 	call	_cpct_px2byteM0
   252F 55            [ 4]  398 	ld	d, l
   2530 C1            [10]  399 	pop	bc
   2531 21 02 04      [10]  400 	ld	hl, #0x0402
   2534 E5            [11]  401 	push	hl
   2535 D5            [11]  402 	push	de
   2536 33            [ 6]  403 	inc	sp
   2537 C5            [11]  404 	push	bc
   2538 CD 58 0E      [17]  405 	call	_cpct_drawSolidBox
   253B F1            [10]  406 	pop	af
   253C F1            [10]  407 	pop	af
   253D 33            [ 6]  408 	inc	sp
                            409 ;src/main.c:113: for (i=0; i<4; i++){
   253E DD 34 FF      [23]  410 	inc	-1 (ix)
   2541 DD 7E FF      [19]  411 	ld	a, -1 (ix)
   2544 D6 04         [ 7]  412 	sub	a, #0x04
   2546 38 C7         [12]  413 	jr	C,00102$
   2548 33            [ 6]  414 	inc	sp
   2549 DD E1         [14]  415 	pop	ix
   254B C9            [10]  416 	ret
                            417 ;src/main.c:119: void eraseDebugInfo(){
                            418 ;	---------------------------------
                            419 ; Function eraseDebugInfo
                            420 ; ---------------------------------
   254C                     421 _eraseDebugInfo::
                            422 ;src/main.c:121: pvmem = cpct_getScreenPtr(CPCT_VMEM_START, 50, 0);
   254C 21 32 00      [10]  423 	ld	hl, #0x0032
   254F E5            [11]  424 	push	hl
   2550 21 00 C0      [10]  425 	ld	hl, #0xc000
   2553 E5            [11]  426 	push	hl
   2554 CD 65 0F      [17]  427 	call	_cpct_getScreenPtr
                            428 ;src/main.c:122: cpct_drawSolidBox (pvmem, cpct_px2byteM0 (0, 0), 29, 64);    
   2557 E5            [11]  429 	push	hl
   2558 21 00 00      [10]  430 	ld	hl, #0x0000
   255B E5            [11]  431 	push	hl
   255C CD 3C 0E      [17]  432 	call	_cpct_px2byteM0
   255F 55            [ 4]  433 	ld	d, l
   2560 C1            [10]  434 	pop	bc
   2561 21 1D 40      [10]  435 	ld	hl, #0x401d
   2564 E5            [11]  436 	push	hl
   2565 D5            [11]  437 	push	de
   2566 33            [ 6]  438 	inc	sp
   2567 C5            [11]  439 	push	bc
   2568 CD 58 0E      [17]  440 	call	_cpct_drawSolidBox
   256B F1            [10]  441 	pop	af
   256C F1            [10]  442 	pop	af
   256D 33            [ 6]  443 	inc	sp
   256E C9            [10]  444 	ret
                            445 ;src/main.c:125: void printDebugInfo(TCharacter *c){
                            446 ;	---------------------------------
                            447 ; Function printDebugInfo
                            448 ; ---------------------------------
   256F                     449 _printDebugInfo::
   256F DD E5         [15]  450 	push	ix
   2571 DD 21 00 00   [14]  451 	ld	ix,#0
   2575 DD 39         [15]  452 	add	ix,sp
   2577 21 E8 FF      [10]  453 	ld	hl, #-24
   257A 39            [11]  454 	add	hl, sp
   257B F9            [ 6]  455 	ld	sp, hl
                            456 ;src/main.c:128: sprintf(auxTxt, "X %1d", c->x);
   257C DD 7E 04      [19]  457 	ld	a, 4 (ix)
   257F DD 77 FE      [19]  458 	ld	-2 (ix), a
   2582 DD 7E 05      [19]  459 	ld	a, 5 (ix)
   2585 DD 77 FF      [19]  460 	ld	-1 (ix), a
   2588 DD 6E FE      [19]  461 	ld	l,-2 (ix)
   258B DD 66 FF      [19]  462 	ld	h,-1 (ix)
   258E 5E            [ 7]  463 	ld	e, (hl)
   258F 23            [ 6]  464 	inc	hl
   2590 56            [ 7]  465 	ld	d, (hl)
   2591 21 00 00      [10]  466 	ld	hl, #0x0000
   2594 39            [11]  467 	add	hl, sp
   2595 E5            [11]  468 	push	hl
   2596 D5            [11]  469 	push	de
   2597 11 1B 27      [10]  470 	ld	de, #___str_0
   259A D5            [11]  471 	push	de
   259B E5            [11]  472 	push	hl
   259C CD EC 0D      [17]  473 	call	_sprintf
   259F 21 06 00      [10]  474 	ld	hl, #6
   25A2 39            [11]  475 	add	hl, sp
   25A3 F9            [ 6]  476 	ld	sp, hl
   25A4 C1            [10]  477 	pop	bc
                            478 ;src/main.c:129: drawText(auxTxt, 50, 0, COLORTXT_BLUE, NORMALHEIGHT, TRANSPARENT);
   25A5 59            [ 4]  479 	ld	e, c
   25A6 50            [ 4]  480 	ld	d, b
   25A7 C5            [11]  481 	push	bc
   25A8 21 01 01      [10]  482 	ld	hl, #0x0101
   25AB E5            [11]  483 	push	hl
   25AC 21 00 03      [10]  484 	ld	hl, #0x0300
   25AF E5            [11]  485 	push	hl
   25B0 3E 32         [ 7]  486 	ld	a, #0x32
   25B2 F5            [11]  487 	push	af
   25B3 33            [ 6]  488 	inc	sp
   25B4 D5            [11]  489 	push	de
   25B5 CD 57 03      [17]  490 	call	_drawText
   25B8 21 07 00      [10]  491 	ld	hl, #7
   25BB 39            [11]  492 	add	hl, sp
   25BC F9            [ 6]  493 	ld	sp, hl
   25BD C1            [10]  494 	pop	bc
                            495 ;src/main.c:130: sprintf(auxTxt, "Y %1d", c->y);
   25BE DD 6E FE      [19]  496 	ld	l,-2 (ix)
   25C1 DD 66 FF      [19]  497 	ld	h,-1 (ix)
   25C4 23            [ 6]  498 	inc	hl
   25C5 23            [ 6]  499 	inc	hl
   25C6 5E            [ 7]  500 	ld	e, (hl)
   25C7 23            [ 6]  501 	inc	hl
   25C8 56            [ 7]  502 	ld	d, (hl)
   25C9 69            [ 4]  503 	ld	l, c
   25CA 60            [ 4]  504 	ld	h, b
   25CB C5            [11]  505 	push	bc
   25CC D5            [11]  506 	push	de
   25CD 11 21 27      [10]  507 	ld	de, #___str_1
   25D0 D5            [11]  508 	push	de
   25D1 E5            [11]  509 	push	hl
   25D2 CD EC 0D      [17]  510 	call	_sprintf
   25D5 21 06 00      [10]  511 	ld	hl, #6
   25D8 39            [11]  512 	add	hl, sp
   25D9 F9            [ 6]  513 	ld	sp, hl
   25DA C1            [10]  514 	pop	bc
                            515 ;src/main.c:131: drawText(auxTxt, 50, 8, COLORTXT_BLUE, NORMALHEIGHT, TRANSPARENT);  
   25DB 59            [ 4]  516 	ld	e, c
   25DC 50            [ 4]  517 	ld	d, b
   25DD C5            [11]  518 	push	bc
   25DE 21 01 01      [10]  519 	ld	hl, #0x0101
   25E1 E5            [11]  520 	push	hl
   25E2 21 08 03      [10]  521 	ld	hl, #0x0308
   25E5 E5            [11]  522 	push	hl
   25E6 3E 32         [ 7]  523 	ld	a, #0x32
   25E8 F5            [11]  524 	push	af
   25E9 33            [ 6]  525 	inc	sp
   25EA D5            [11]  526 	push	de
   25EB CD 57 03      [17]  527 	call	_drawText
   25EE 21 07 00      [10]  528 	ld	hl, #7
   25F1 39            [11]  529 	add	hl, sp
   25F2 F9            [ 6]  530 	ld	sp, hl
   25F3 C1            [10]  531 	pop	bc
                            532 ;src/main.c:132: sprintf(auxTxt, "DIR %1d", c->dir);
   25F4 DD 6E FE      [19]  533 	ld	l,-2 (ix)
   25F7 DD 66 FF      [19]  534 	ld	h,-1 (ix)
   25FA 11 0E 00      [10]  535 	ld	de, #0x000e
   25FD 19            [11]  536 	add	hl, de
   25FE 5E            [ 7]  537 	ld	e, (hl)
   25FF 16 00         [ 7]  538 	ld	d, #0x00
   2601 69            [ 4]  539 	ld	l, c
   2602 60            [ 4]  540 	ld	h, b
   2603 C5            [11]  541 	push	bc
   2604 D5            [11]  542 	push	de
   2605 11 27 27      [10]  543 	ld	de, #___str_2
   2608 D5            [11]  544 	push	de
   2609 E5            [11]  545 	push	hl
   260A CD EC 0D      [17]  546 	call	_sprintf
   260D 21 06 00      [10]  547 	ld	hl, #6
   2610 39            [11]  548 	add	hl, sp
   2611 F9            [ 6]  549 	ld	sp, hl
   2612 C1            [10]  550 	pop	bc
                            551 ;src/main.c:133: drawText(auxTxt, 50, 16, COLORTXT_BLUE, NORMALHEIGHT, TRANSPARENT);  
   2613 59            [ 4]  552 	ld	e, c
   2614 50            [ 4]  553 	ld	d, b
   2615 C5            [11]  554 	push	bc
   2616 21 01 01      [10]  555 	ld	hl, #0x0101
   2619 E5            [11]  556 	push	hl
   261A 21 10 03      [10]  557 	ld	hl, #0x0310
   261D E5            [11]  558 	push	hl
   261E 3E 32         [ 7]  559 	ld	a, #0x32
   2620 F5            [11]  560 	push	af
   2621 33            [ 6]  561 	inc	sp
   2622 D5            [11]  562 	push	de
   2623 CD 57 03      [17]  563 	call	_drawText
   2626 21 07 00      [10]  564 	ld	hl, #7
   2629 39            [11]  565 	add	hl, sp
   262A F9            [ 6]  566 	ld	sp, hl
   262B C1            [10]  567 	pop	bc
                            568 ;src/main.c:134: sprintf(auxTxt, "ACC %1d", c->a);
   262C DD 6E FE      [19]  569 	ld	l,-2 (ix)
   262F DD 66 FF      [19]  570 	ld	h,-1 (ix)
   2632 11 0C 00      [10]  571 	ld	de, #0x000c
   2635 19            [11]  572 	add	hl, de
   2636 5E            [ 7]  573 	ld	e, (hl)
   2637 23            [ 6]  574 	inc	hl
   2638 56            [ 7]  575 	ld	d, (hl)
   2639 69            [ 4]  576 	ld	l, c
   263A 60            [ 4]  577 	ld	h, b
   263B C5            [11]  578 	push	bc
   263C D5            [11]  579 	push	de
   263D 11 2F 27      [10]  580 	ld	de, #___str_3
   2640 D5            [11]  581 	push	de
   2641 E5            [11]  582 	push	hl
   2642 CD EC 0D      [17]  583 	call	_sprintf
   2645 21 06 00      [10]  584 	ld	hl, #6
   2648 39            [11]  585 	add	hl, sp
   2649 F9            [ 6]  586 	ld	sp, hl
   264A C1            [10]  587 	pop	bc
                            588 ;src/main.c:135: drawText(auxTxt, 50, 24, COLORTXT_BLUE, NORMALHEIGHT, TRANSPARENT);
   264B 59            [ 4]  589 	ld	e, c
   264C 50            [ 4]  590 	ld	d, b
   264D C5            [11]  591 	push	bc
   264E 21 01 01      [10]  592 	ld	hl, #0x0101
   2651 E5            [11]  593 	push	hl
   2652 21 18 03      [10]  594 	ld	hl, #0x0318
   2655 E5            [11]  595 	push	hl
   2656 3E 32         [ 7]  596 	ld	a, #0x32
   2658 F5            [11]  597 	push	af
   2659 33            [ 6]  598 	inc	sp
   265A D5            [11]  599 	push	de
   265B CD 57 03      [17]  600 	call	_drawText
   265E 21 07 00      [10]  601 	ld	hl, #7
   2661 39            [11]  602 	add	hl, sp
   2662 F9            [ 6]  603 	ld	sp, hl
   2663 C1            [10]  604 	pop	bc
                            605 ;src/main.c:136: sprintf(auxTxt, "VX %1d", c->vx);
   2664 DD 7E FE      [19]  606 	ld	a, -2 (ix)
   2667 C6 08         [ 7]  607 	add	a, #0x08
   2669 DD 77 FC      [19]  608 	ld	-4 (ix), a
   266C DD 7E FF      [19]  609 	ld	a, -1 (ix)
   266F CE 00         [ 7]  610 	adc	a, #0x00
   2671 DD 77 FD      [19]  611 	ld	-3 (ix), a
   2674 DD 6E FC      [19]  612 	ld	l,-4 (ix)
   2677 DD 66 FD      [19]  613 	ld	h,-3 (ix)
   267A 5E            [ 7]  614 	ld	e, (hl)
   267B 23            [ 6]  615 	inc	hl
   267C 56            [ 7]  616 	ld	d, (hl)
   267D 69            [ 4]  617 	ld	l, c
   267E 60            [ 4]  618 	ld	h, b
   267F C5            [11]  619 	push	bc
   2680 D5            [11]  620 	push	de
   2681 11 37 27      [10]  621 	ld	de, #___str_4
   2684 D5            [11]  622 	push	de
   2685 E5            [11]  623 	push	hl
   2686 CD EC 0D      [17]  624 	call	_sprintf
   2689 21 06 00      [10]  625 	ld	hl, #6
   268C 39            [11]  626 	add	hl, sp
   268D F9            [ 6]  627 	ld	sp, hl
   268E C1            [10]  628 	pop	bc
                            629 ;src/main.c:137: drawText(auxTxt, 50, 32, COLORTXT_BLUE, NORMALHEIGHT, TRANSPARENT);
   268F 59            [ 4]  630 	ld	e, c
   2690 50            [ 4]  631 	ld	d, b
   2691 C5            [11]  632 	push	bc
   2692 21 01 01      [10]  633 	ld	hl, #0x0101
   2695 E5            [11]  634 	push	hl
   2696 21 20 03      [10]  635 	ld	hl, #0x0320
   2699 E5            [11]  636 	push	hl
   269A 3E 32         [ 7]  637 	ld	a, #0x32
   269C F5            [11]  638 	push	af
   269D 33            [ 6]  639 	inc	sp
   269E D5            [11]  640 	push	de
   269F CD 57 03      [17]  641 	call	_drawText
   26A2 21 07 00      [10]  642 	ld	hl, #7
   26A5 39            [11]  643 	add	hl, sp
   26A6 F9            [ 6]  644 	ld	sp, hl
   26A7 C1            [10]  645 	pop	bc
                            646 ;src/main.c:138: sprintf(auxTxt, "VY %1d", c->vx);
   26A8 DD 6E FC      [19]  647 	ld	l,-4 (ix)
   26AB DD 66 FD      [19]  648 	ld	h,-3 (ix)
   26AE 5E            [ 7]  649 	ld	e, (hl)
   26AF 23            [ 6]  650 	inc	hl
   26B0 56            [ 7]  651 	ld	d, (hl)
   26B1 69            [ 4]  652 	ld	l, c
   26B2 60            [ 4]  653 	ld	h, b
   26B3 C5            [11]  654 	push	bc
   26B4 D5            [11]  655 	push	de
   26B5 11 3E 27      [10]  656 	ld	de, #___str_5
   26B8 D5            [11]  657 	push	de
   26B9 E5            [11]  658 	push	hl
   26BA CD EC 0D      [17]  659 	call	_sprintf
   26BD 21 06 00      [10]  660 	ld	hl, #6
   26C0 39            [11]  661 	add	hl, sp
   26C1 F9            [ 6]  662 	ld	sp, hl
   26C2 C1            [10]  663 	pop	bc
                            664 ;src/main.c:139: drawText(auxTxt, 50, 40, COLORTXT_BLUE, NORMALHEIGHT, TRANSPARENT);
   26C3 59            [ 4]  665 	ld	e, c
   26C4 50            [ 4]  666 	ld	d, b
   26C5 C5            [11]  667 	push	bc
   26C6 21 01 01      [10]  668 	ld	hl, #0x0101
   26C9 E5            [11]  669 	push	hl
   26CA 21 28 03      [10]  670 	ld	hl, #0x0328
   26CD E5            [11]  671 	push	hl
   26CE 3E 32         [ 7]  672 	ld	a, #0x32
   26D0 F5            [11]  673 	push	af
   26D1 33            [ 6]  674 	inc	sp
   26D2 D5            [11]  675 	push	de
   26D3 CD 57 03      [17]  676 	call	_drawText
   26D6 21 07 00      [10]  677 	ld	hl, #7
   26D9 39            [11]  678 	add	hl, sp
   26DA F9            [ 6]  679 	ld	sp, hl
   26DB C1            [10]  680 	pop	bc
                            681 ;src/main.c:140: sprintf(auxTxt, "T %1d", c->target);
   26DC DD 6E FE      [19]  682 	ld	l,-2 (ix)
   26DF DD 66 FF      [19]  683 	ld	h,-1 (ix)
   26E2 11 10 00      [10]  684 	ld	de, #0x0010
   26E5 19            [11]  685 	add	hl, de
   26E6 5E            [ 7]  686 	ld	e, (hl)
   26E7 16 00         [ 7]  687 	ld	d, #0x00
   26E9 69            [ 4]  688 	ld	l, c
   26EA 60            [ 4]  689 	ld	h, b
   26EB C5            [11]  690 	push	bc
   26EC D5            [11]  691 	push	de
   26ED 11 45 27      [10]  692 	ld	de, #___str_6
   26F0 D5            [11]  693 	push	de
   26F1 E5            [11]  694 	push	hl
   26F2 CD EC 0D      [17]  695 	call	_sprintf
   26F5 21 06 00      [10]  696 	ld	hl, #6
   26F8 39            [11]  697 	add	hl, sp
   26F9 F9            [ 6]  698 	ld	sp, hl
   26FA C1            [10]  699 	pop	bc
                            700 ;src/main.c:141: drawText(auxTxt, 50, 48, COLORTXT_BLUE, NORMALHEIGHT, TRANSPARENT);
   26FB 21 01 01      [10]  701 	ld	hl, #0x0101
   26FE E5            [11]  702 	push	hl
   26FF 21 30 03      [10]  703 	ld	hl, #0x0330
   2702 E5            [11]  704 	push	hl
   2703 3E 32         [ 7]  705 	ld	a, #0x32
   2705 F5            [11]  706 	push	af
   2706 33            [ 6]  707 	inc	sp
   2707 C5            [11]  708 	push	bc
   2708 CD 57 03      [17]  709 	call	_drawText
   270B 21 07 00      [10]  710 	ld	hl, #7
   270E 39            [11]  711 	add	hl, sp
   270F F9            [ 6]  712 	ld	sp, hl
                            713 ;src/main.c:142: wait4OneKey();
   2710 CD 38 0C      [17]  714 	call	_wait4OneKey
                            715 ;src/main.c:143: eraseDebugInfo();
   2713 CD 4C 25      [17]  716 	call	_eraseDebugInfo
   2716 DD F9         [10]  717 	ld	sp, ix
   2718 DD E1         [14]  718 	pop	ix
   271A C9            [10]  719 	ret
   271B                     720 ___str_0:
   271B 58 20 25 31 64      721 	.ascii "X %1d"
   2720 00                  722 	.db 0x00
   2721                     723 ___str_1:
   2721 59 20 25 31 64      724 	.ascii "Y %1d"
   2726 00                  725 	.db 0x00
   2727                     726 ___str_2:
   2727 44 49 52 20 25 31   727 	.ascii "DIR %1d"
        64
   272E 00                  728 	.db 0x00
   272F                     729 ___str_3:
   272F 41 43 43 20 25 31   730 	.ascii "ACC %1d"
        64
   2736 00                  731 	.db 0x00
   2737                     732 ___str_4:
   2737 56 58 20 25 31 64   733 	.ascii "VX %1d"
   273D 00                  734 	.db 0x00
   273E                     735 ___str_5:
   273E 56 59 20 25 31 64   736 	.ascii "VY %1d"
   2744 00                  737 	.db 0x00
   2745                     738 ___str_6:
   2745 54 20 25 31 64      739 	.ascii "T %1d"
   274A 00                  740 	.db 0x00
                            741 ;src/main.c:146: void getCharacterInput(TCharacter *c){
                            742 ;	---------------------------------
                            743 ; Function getCharacterInput
                            744 ; ---------------------------------
   274B                     745 _getCharacterInput::
   274B DD E5         [15]  746 	push	ix
   274D DD 21 00 00   [14]  747 	ld	ix,#0
   2751 DD 39         [15]  748 	add	ix,sp
   2753 F5            [11]  749 	push	af
                            750 ;src/main.c:148: if (cpct_isKeyPressed(Key_O)){
   2754 21 04 04      [10]  751 	ld	hl, #0x0404
   2757 CD 47 0C      [17]  752 	call	_cpct_isKeyPressed
                            753 ;src/main.c:149: c->dir = c->dir + 32;
   275A DD 7E 04      [19]  754 	ld	a, 4 (ix)
   275D DD 77 FE      [19]  755 	ld	-2 (ix), a
   2760 DD 7E 05      [19]  756 	ld	a, 5 (ix)
   2763 DD 77 FF      [19]  757 	ld	-1 (ix), a
   2766 DD 7E FE      [19]  758 	ld	a, -2 (ix)
   2769 C6 0E         [ 7]  759 	add	a, #0x0e
   276B 4F            [ 4]  760 	ld	c, a
   276C DD 7E FF      [19]  761 	ld	a, -1 (ix)
   276F CE 00         [ 7]  762 	adc	a, #0x00
   2771 47            [ 4]  763 	ld	b, a
                            764 ;src/main.c:148: if (cpct_isKeyPressed(Key_O)){
   2772 7D            [ 4]  765 	ld	a, l
   2773 B7            [ 4]  766 	or	a, a
   2774 28 04         [12]  767 	jr	Z,00102$
                            768 ;src/main.c:149: c->dir = c->dir + 32;
   2776 0A            [ 7]  769 	ld	a, (bc)
   2777 C6 20         [ 7]  770 	add	a, #0x20
   2779 02            [ 7]  771 	ld	(bc), a
   277A                     772 00102$:
                            773 ;src/main.c:151: if (cpct_isKeyPressed(Key_P)){
   277A C5            [11]  774 	push	bc
   277B 21 03 08      [10]  775 	ld	hl, #0x0803
   277E CD 47 0C      [17]  776 	call	_cpct_isKeyPressed
   2781 C1            [10]  777 	pop	bc
   2782 7D            [ 4]  778 	ld	a, l
   2783 B7            [ 4]  779 	or	a, a
   2784 28 04         [12]  780 	jr	Z,00104$
                            781 ;src/main.c:152: c->dir = c->dir - 32;
   2786 0A            [ 7]  782 	ld	a, (bc)
   2787 C6 E0         [ 7]  783 	add	a, #0xe0
   2789 02            [ 7]  784 	ld	(bc), a
   278A                     785 00104$:
                            786 ;src/main.c:154: if (cpct_isKeyPressed(Key_Q)){
   278A 21 08 08      [10]  787 	ld	hl, #0x0808
   278D CD 47 0C      [17]  788 	call	_cpct_isKeyPressed
                            789 ;src/main.c:164: c->a = 0;
   2790 DD 7E FE      [19]  790 	ld	a, -2 (ix)
   2793 C6 0C         [ 7]  791 	add	a, #0x0c
   2795 4F            [ 4]  792 	ld	c, a
   2796 DD 7E FF      [19]  793 	ld	a, -1 (ix)
   2799 CE 00         [ 7]  794 	adc	a, #0x00
   279B 47            [ 4]  795 	ld	b, a
                            796 ;src/main.c:154: if (cpct_isKeyPressed(Key_Q)){
   279C 7D            [ 4]  797 	ld	a, l
   279D B7            [ 4]  798 	or	a, a
   279E 28 0B         [12]  799 	jr	Z,00106$
                            800 ;src/main.c:155: c->a = c->a + 1;
   27A0 69            [ 4]  801 	ld	l, c
   27A1 60            [ 4]  802 	ld	h, b
   27A2 5E            [ 7]  803 	ld	e, (hl)
   27A3 23            [ 6]  804 	inc	hl
   27A4 56            [ 7]  805 	ld	d, (hl)
   27A5 13            [ 6]  806 	inc	de
   27A6 69            [ 4]  807 	ld	l, c
   27A7 60            [ 4]  808 	ld	h, b
   27A8 73            [ 7]  809 	ld	(hl), e
   27A9 23            [ 6]  810 	inc	hl
   27AA 72            [ 7]  811 	ld	(hl), d
   27AB                     812 00106$:
                            813 ;src/main.c:157: if ((cpct_isKeyPressed(Key_A)) && (c->a > 0)){
   27AB C5            [11]  814 	push	bc
   27AC 21 08 20      [10]  815 	ld	hl, #0x2008
   27AF CD 47 0C      [17]  816 	call	_cpct_isKeyPressed
   27B2 C1            [10]  817 	pop	bc
   27B3 7D            [ 4]  818 	ld	a, l
   27B4 B7            [ 4]  819 	or	a, a
   27B5 28 16         [12]  820 	jr	Z,00108$
   27B7 69            [ 4]  821 	ld	l, c
   27B8 60            [ 4]  822 	ld	h, b
   27B9 5E            [ 7]  823 	ld	e, (hl)
   27BA 23            [ 6]  824 	inc	hl
   27BB 56            [ 7]  825 	ld	d, (hl)
   27BC AF            [ 4]  826 	xor	a, a
   27BD BB            [ 4]  827 	cp	a, e
   27BE 9A            [ 4]  828 	sbc	a, d
   27BF E2 C4 27      [10]  829 	jp	PO, 00151$
   27C2 EE 80         [ 7]  830 	xor	a, #0x80
   27C4                     831 00151$:
   27C4 F2 CD 27      [10]  832 	jp	P, 00108$
                            833 ;src/main.c:158: c->a = c->a - 1;
   27C7 1B            [ 6]  834 	dec	de
   27C8 69            [ 4]  835 	ld	l, c
   27C9 60            [ 4]  836 	ld	h, b
   27CA 73            [ 7]  837 	ld	(hl), e
   27CB 23            [ 6]  838 	inc	hl
   27CC 72            [ 7]  839 	ld	(hl), d
   27CD                     840 00108$:
                            841 ;src/main.c:161: if (cpct_isKeyPressed(Key_Space)){
   27CD C5            [11]  842 	push	bc
   27CE 21 05 80      [10]  843 	ld	hl, #0x8005
   27D1 CD 47 0C      [17]  844 	call	_cpct_isKeyPressed
   27D4 C1            [10]  845 	pop	bc
   27D5 7D            [ 4]  846 	ld	a, l
   27D6 B7            [ 4]  847 	or	a, a
   27D7 28 24         [12]  848 	jr	Z,00114$
                            849 ;src/main.c:162: if (c->motion){
   27D9 DD 7E FE      [19]  850 	ld	a, -2 (ix)
   27DC C6 0F         [ 7]  851 	add	a, #0x0f
   27DE 6F            [ 4]  852 	ld	l, a
   27DF DD 7E FF      [19]  853 	ld	a, -1 (ix)
   27E2 CE 00         [ 7]  854 	adc	a, #0x00
   27E4 67            [ 4]  855 	ld	h, a
   27E5 7E            [ 7]  856 	ld	a, (hl)
   27E6 B7            [ 4]  857 	or	a, a
   27E7 28 0B         [12]  858 	jr	Z,00111$
                            859 ;src/main.c:163: c->motion = 0;
   27E9 36 00         [10]  860 	ld	(hl), #0x00
                            861 ;src/main.c:164: c->a = 0;
   27EB 3E 00         [ 7]  862 	ld	a, #0x00
   27ED 02            [ 7]  863 	ld	(bc), a
   27EE 03            [ 6]  864 	inc	bc
   27EF 3E 00         [ 7]  865 	ld	a, #0x00
   27F1 02            [ 7]  866 	ld	(bc), a
   27F2 18 09         [12]  867 	jr	00114$
   27F4                     868 00111$:
                            869 ;src/main.c:166: c->motion = 1;
   27F4 36 01         [10]  870 	ld	(hl), #0x01
                            871 ;src/main.c:167: c->a = 2;
   27F6 3E 02         [ 7]  872 	ld	a, #0x02
   27F8 02            [ 7]  873 	ld	(bc), a
   27F9 03            [ 6]  874 	inc	bc
   27FA 3E 00         [ 7]  875 	ld	a, #0x00
   27FC 02            [ 7]  876 	ld	(bc), a
   27FD                     877 00114$:
                            878 ;src/main.c:171: if (cpct_isKeyPressed(Key_D)){
   27FD 21 07 20      [10]  879 	ld	hl, #0x2007
   2800 CD 47 0C      [17]  880 	call	_cpct_isKeyPressed
   2803 7D            [ 4]  881 	ld	a, l
   2804 B7            [ 4]  882 	or	a, a
   2805 28 0B         [12]  883 	jr	Z,00117$
                            884 ;src/main.c:172: printDebugInfo(c);
   2807 DD 6E 04      [19]  885 	ld	l,4 (ix)
   280A DD 66 05      [19]  886 	ld	h,5 (ix)
   280D E5            [11]  887 	push	hl
   280E CD 6F 25      [17]  888 	call	_printDebugInfo
   2811 F1            [10]  889 	pop	af
   2812                     890 00117$:
   2812 DD F9         [10]  891 	ld	sp, ix
   2814 DD E1         [14]  892 	pop	ix
   2816 C9            [10]  893 	ret
                            894 ;src/main.c:177: void motionUpdate(TCharacter *c){
                            895 ;	---------------------------------
                            896 ; Function motionUpdate
                            897 ; ---------------------------------
   2817                     898 _motionUpdate::
   2817 DD E5         [15]  899 	push	ix
   2819 DD 21 00 00   [14]  900 	ld	ix,#0
   281D DD 39         [15]  901 	add	ix,sp
   281F F5            [11]  902 	push	af
   2820 F5            [11]  903 	push	af
   2821 3B            [ 6]  904 	dec	sp
                            905 ;src/main.c:182: xc = c->x >> 8;
   2822 DD 7E 04      [19]  906 	ld	a, 4 (ix)
   2825 DD 77 FE      [19]  907 	ld	-2 (ix), a
   2828 DD 7E 05      [19]  908 	ld	a, 5 (ix)
   282B DD 77 FF      [19]  909 	ld	-1 (ix), a
   282E DD 6E FE      [19]  910 	ld	l,-2 (ix)
   2831 DD 66 FF      [19]  911 	ld	h,-1 (ix)
   2834 4E            [ 7]  912 	ld	c, (hl)
   2835 23            [ 6]  913 	inc	hl
   2836 4E            [ 7]  914 	ld	c, (hl)
                            915 ;src/main.c:183: yc = c->y >> 8;
   2837 DD 6E FE      [19]  916 	ld	l,-2 (ix)
   283A DD 66 FF      [19]  917 	ld	h,-1 (ix)
   283D 23            [ 6]  918 	inc	hl
   283E 23            [ 6]  919 	inc	hl
   283F 46            [ 7]  920 	ld	b, (hl)
   2840 23            [ 6]  921 	inc	hl
   2841 46            [ 7]  922 	ld	b, (hl)
                            923 ;src/main.c:186: if (abs((xc - wp[c->target].x) < 2) && (abs((yc - wp[c->target].y) < 2))){
   2842 DD 71 FC      [19]  924 	ld	-4 (ix), c
   2845 DD 36 FD 00   [19]  925 	ld	-3 (ix), #0x00
   2849 DD 7E FE      [19]  926 	ld	a, -2 (ix)
   284C C6 10         [ 7]  927 	add	a, #0x10
   284E 5F            [ 4]  928 	ld	e, a
   284F DD 7E FF      [19]  929 	ld	a, -1 (ix)
   2852 CE 00         [ 7]  930 	adc	a, #0x00
   2854 57            [ 4]  931 	ld	d, a
   2855 1A            [ 7]  932 	ld	a, (de)
   2856 6F            [ 4]  933 	ld	l, a
   2857 26 00         [ 7]  934 	ld	h, #0x00
   2859 29            [11]  935 	add	hl, hl
   285A 3E 01         [ 7]  936 	ld	a, #<(_wp)
   285C 85            [ 4]  937 	add	a, l
   285D 6F            [ 4]  938 	ld	l, a
   285E 3E 24         [ 7]  939 	ld	a, #>(_wp)
   2860 8C            [ 4]  940 	adc	a, h
   2861 67            [ 4]  941 	ld	h, a
   2862 6E            [ 7]  942 	ld	l, (hl)
   2863 26 00         [ 7]  943 	ld	h, #0x00
   2865 DD 7E FC      [19]  944 	ld	a, -4 (ix)
   2868 95            [ 4]  945 	sub	a, l
   2869 6F            [ 4]  946 	ld	l, a
   286A DD 7E FD      [19]  947 	ld	a, -3 (ix)
   286D 9C            [ 4]  948 	sbc	a, h
   286E 67            [ 4]  949 	ld	h, a
   286F 7D            [ 4]  950 	ld	a, l
   2870 D6 02         [ 7]  951 	sub	a, #0x02
   2872 7C            [ 4]  952 	ld	a, h
   2873 17            [ 4]  953 	rla
   2874 3F            [ 4]  954 	ccf
   2875 1F            [ 4]  955 	rra
   2876 DE 80         [ 7]  956 	sbc	a, #0x80
   2878 3E 00         [ 7]  957 	ld	a, #0x00
   287A 17            [ 4]  958 	rla
   287B 6F            [ 4]  959 	ld	l, a
   287C 26 00         [ 7]  960 	ld	h, #0x00
   287E D5            [11]  961 	push	de
   287F E5            [11]  962 	push	hl
   2880 CD 62 0D      [17]  963 	call	_abs
   2883 F1            [10]  964 	pop	af
   2884 D1            [10]  965 	pop	de
   2885 7C            [ 4]  966 	ld	a, h
   2886 B5            [ 4]  967 	or	a,l
   2887 28 64         [12]  968 	jr	Z,00102$
   2889 DD 70 FC      [19]  969 	ld	-4 (ix), b
   288C DD 36 FD 00   [19]  970 	ld	-3 (ix), #0x00
   2890 1A            [ 7]  971 	ld	a, (de)
   2891 6F            [ 4]  972 	ld	l, a
   2892 26 00         [ 7]  973 	ld	h, #0x00
   2894 29            [11]  974 	add	hl, hl
   2895 3E 01         [ 7]  975 	ld	a, #<(_wp)
   2897 85            [ 4]  976 	add	a, l
   2898 6F            [ 4]  977 	ld	l, a
   2899 3E 24         [ 7]  978 	ld	a, #>(_wp)
   289B 8C            [ 4]  979 	adc	a, h
   289C 67            [ 4]  980 	ld	h, a
   289D 23            [ 6]  981 	inc	hl
   289E 6E            [ 7]  982 	ld	l, (hl)
   289F 26 00         [ 7]  983 	ld	h, #0x00
   28A1 DD 7E FC      [19]  984 	ld	a, -4 (ix)
   28A4 95            [ 4]  985 	sub	a, l
   28A5 6F            [ 4]  986 	ld	l, a
   28A6 DD 7E FD      [19]  987 	ld	a, -3 (ix)
   28A9 9C            [ 4]  988 	sbc	a, h
   28AA 67            [ 4]  989 	ld	h, a
   28AB 7D            [ 4]  990 	ld	a, l
   28AC D6 02         [ 7]  991 	sub	a, #0x02
   28AE 7C            [ 4]  992 	ld	a, h
   28AF 17            [ 4]  993 	rla
   28B0 3F            [ 4]  994 	ccf
   28B1 1F            [ 4]  995 	rra
   28B2 DE 80         [ 7]  996 	sbc	a, #0x80
   28B4 3E 00         [ 7]  997 	ld	a, #0x00
   28B6 17            [ 4]  998 	rla
   28B7 6F            [ 4]  999 	ld	l, a
   28B8 26 00         [ 7] 1000 	ld	h, #0x00
   28BA D5            [11] 1001 	push	de
   28BB E5            [11] 1002 	push	hl
   28BC CD 62 0D      [17] 1003 	call	_abs
   28BF F1            [10] 1004 	pop	af
   28C0 D1            [10] 1005 	pop	de
   28C1 7C            [ 4] 1006 	ld	a, h
   28C2 B5            [ 4] 1007 	or	a,l
   28C3 28 28         [12] 1008 	jr	Z,00102$
                           1009 ;src/main.c:188: c->target = ((c->target+1) % WP_NUMBER);
   28C5 1A            [ 7] 1010 	ld	a, (de)
   28C6 6F            [ 4] 1011 	ld	l, a
   28C7 26 00         [ 7] 1012 	ld	h, #0x00
   28C9 23            [ 6] 1013 	inc	hl
   28CA E5            [11] 1014 	push	hl
   28CB FD E1         [14] 1015 	pop	iy
   28CD C5            [11] 1016 	push	bc
   28CE D5            [11] 1017 	push	de
   28CF 21 04 00      [10] 1018 	ld	hl, #0x0004
   28D2 E5            [11] 1019 	push	hl
   28D3 FD E5         [15] 1020 	push	iy
   28D5 CD 1D 0F      [17] 1021 	call	__modsint
   28D8 F1            [10] 1022 	pop	af
   28D9 F1            [10] 1023 	pop	af
   28DA D1            [10] 1024 	pop	de
   28DB C1            [10] 1025 	pop	bc
   28DC 7D            [ 4] 1026 	ld	a, l
   28DD 12            [ 7] 1027 	ld	(de), a
                           1028 ;src/main.c:189: printDebugInfo(c);
   28DE C5            [11] 1029 	push	bc
   28DF D5            [11] 1030 	push	de
   28E0 DD 6E FE      [19] 1031 	ld	l,-2 (ix)
   28E3 DD 66 FF      [19] 1032 	ld	h,-1 (ix)
   28E6 E5            [11] 1033 	push	hl
   28E7 CD 6F 25      [17] 1034 	call	_printDebugInfo
   28EA F1            [10] 1035 	pop	af
   28EB D1            [10] 1036 	pop	de
   28EC C1            [10] 1037 	pop	bc
   28ED                    1038 00102$:
                           1039 ;src/main.c:191: xwp = wp[c->target].x;
   28ED 1A            [ 7] 1040 	ld	a, (de)
   28EE 6F            [ 4] 1041 	ld	l, a
   28EF 26 00         [ 7] 1042 	ld	h, #0x00
   28F1 29            [11] 1043 	add	hl, hl
   28F2 11 01 24      [10] 1044 	ld	de, #_wp
   28F5 19            [11] 1045 	add	hl, de
   28F6 7E            [ 7] 1046 	ld	a, (hl)
   28F7 DD 77 FB      [19] 1047 	ld	-5 (ix), a
                           1048 ;src/main.c:192: ywp = wp[c->target].y;
   28FA 23            [ 6] 1049 	inc	hl
   28FB 66            [ 7] 1050 	ld	h, (hl)
                           1051 ;src/main.c:194: if (ywp < yc){
   28FC 7C            [ 4] 1052 	ld	a, h
   28FD 90            [ 4] 1053 	sub	a, b
   28FE 3E 00         [ 7] 1054 	ld	a, #0x00
   2900 17            [ 4] 1055 	rla
   2901 6F            [ 4] 1056 	ld	l, a
                           1057 ;src/main.c:195: c->dir = 96;
   2902 DD 7E FE      [19] 1058 	ld	a, -2 (ix)
   2905 C6 0E         [ 7] 1059 	add	a, #0x0e
   2907 5F            [ 4] 1060 	ld	e, a
   2908 DD 7E FF      [19] 1061 	ld	a, -1 (ix)
   290B CE 00         [ 7] 1062 	adc	a, #0x00
   290D 57            [ 4] 1063 	ld	d, a
                           1064 ;src/main.c:196: } else if (ywp > yc){
   290E 78            [ 4] 1065 	ld	a, b
   290F 94            [ 4] 1066 	sub	a, h
   2910 3E 00         [ 7] 1067 	ld	a, #0x00
   2912 17            [ 4] 1068 	rla
   2913 47            [ 4] 1069 	ld	b, a
                           1070 ;src/main.c:193: if (xwp < xc){
   2914 DD 7E FB      [19] 1071 	ld	a, -5 (ix)
   2917 91            [ 4] 1072 	sub	a, c
   2918 30 17         [12] 1073 	jr	NC,00123$
                           1074 ;src/main.c:194: if (ywp < yc){
   291A 7D            [ 4] 1075 	ld	a, l
   291B B7            [ 4] 1076 	or	a, a
   291C 28 05         [12] 1077 	jr	Z,00108$
                           1078 ;src/main.c:195: c->dir = 96;
   291E 3E 60         [ 7] 1079 	ld	a, #0x60
   2920 12            [ 7] 1080 	ld	(de), a
   2921 18 36         [12] 1081 	jr	00125$
   2923                    1082 00108$:
                           1083 ;src/main.c:196: } else if (ywp > yc){
   2923 78            [ 4] 1084 	ld	a, b
   2924 B7            [ 4] 1085 	or	a, a
   2925 28 05         [12] 1086 	jr	Z,00105$
                           1087 ;src/main.c:197: c->dir = 160;
   2927 3E A0         [ 7] 1088 	ld	a, #0xa0
   2929 12            [ 7] 1089 	ld	(de), a
   292A 18 2D         [12] 1090 	jr	00125$
   292C                    1091 00105$:
                           1092 ;src/main.c:199: c->dir = 128;
   292C 3E 80         [ 7] 1093 	ld	a, #0x80
   292E 12            [ 7] 1094 	ld	(de), a
   292F 18 28         [12] 1095 	jr	00125$
   2931                    1096 00123$:
                           1097 ;src/main.c:200: } else if (xwp > xc){
   2931 79            [ 4] 1098 	ld	a, c
   2932 DD 96 FB      [19] 1099 	sub	a, -5 (ix)
   2935 30 16         [12] 1100 	jr	NC,00120$
                           1101 ;src/main.c:201: if (ywp < yc){
   2937 7D            [ 4] 1102 	ld	a, l
   2938 B7            [ 4] 1103 	or	a, a
   2939 28 05         [12] 1104 	jr	Z,00114$
                           1105 ;src/main.c:202: c->dir = 32;
   293B 3E 20         [ 7] 1106 	ld	a, #0x20
   293D 12            [ 7] 1107 	ld	(de), a
   293E 18 19         [12] 1108 	jr	00125$
   2940                    1109 00114$:
                           1110 ;src/main.c:203: } else if (ywp > yc){
   2940 78            [ 4] 1111 	ld	a, b
   2941 B7            [ 4] 1112 	or	a, a
   2942 28 05         [12] 1113 	jr	Z,00111$
                           1114 ;src/main.c:204: c->dir = 224;
   2944 3E E0         [ 7] 1115 	ld	a, #0xe0
   2946 12            [ 7] 1116 	ld	(de), a
   2947 18 10         [12] 1117 	jr	00125$
   2949                    1118 00111$:
                           1119 ;src/main.c:206: c->dir = 0;
   2949 AF            [ 4] 1120 	xor	a, a
   294A 12            [ 7] 1121 	ld	(de), a
   294B 18 0C         [12] 1122 	jr	00125$
   294D                    1123 00120$:
                           1124 ;src/main.c:207: } else if (ywp < yc){
   294D 7D            [ 4] 1125 	ld	a, l
   294E B7            [ 4] 1126 	or	a, a
   294F 28 05         [12] 1127 	jr	Z,00117$
                           1128 ;src/main.c:208: c->dir = 64;
   2951 3E 40         [ 7] 1129 	ld	a, #0x40
   2953 12            [ 7] 1130 	ld	(de), a
   2954 18 03         [12] 1131 	jr	00125$
   2956                    1132 00117$:
                           1133 ;src/main.c:210: c->dir = 192;
   2956 3E C0         [ 7] 1134 	ld	a, #0xc0
   2958 12            [ 7] 1135 	ld	(de), a
   2959                    1136 00125$:
   2959 DD F9         [10] 1137 	ld	sp, ix
   295B DD E1         [14] 1138 	pop	ix
   295D C9            [10] 1139 	ret
                           1140 ;src/main.c:213: void updateCharacter(TCharacter *c){
                           1141 ;	---------------------------------
                           1142 ; Function updateCharacter
                           1143 ; ---------------------------------
   295E                    1144 _updateCharacter::
   295E DD E5         [15] 1145 	push	ix
   2960 DD 21 00 00   [14] 1146 	ld	ix,#0
   2964 DD 39         [15] 1147 	add	ix,sp
   2966 21 F8 FF      [10] 1148 	ld	hl, #-8
   2969 39            [11] 1149 	add	hl, sp
   296A F9            [ 6] 1150 	ld	sp, hl
                           1151 ;src/main.c:215: if (c->motion)
   296B DD 4E 04      [19] 1152 	ld	c,4 (ix)
   296E DD 46 05      [19] 1153 	ld	b,5 (ix)
   2971 C5            [11] 1154 	push	bc
   2972 FD E1         [14] 1155 	pop	iy
   2974 FD 7E 0F      [19] 1156 	ld	a, 15 (iy)
   2977 B7            [ 4] 1157 	or	a, a
   2978 28 07         [12] 1158 	jr	Z,00102$
                           1159 ;src/main.c:216: motionUpdate(c);
   297A C5            [11] 1160 	push	bc
   297B C5            [11] 1161 	push	bc
   297C CD 17 28      [17] 1162 	call	_motionUpdate
   297F F1            [10] 1163 	pop	af
   2980 C1            [10] 1164 	pop	bc
   2981                    1165 00102$:
                           1166 ;src/main.c:220: c->vx = (c->a * cosine(c->dir * DIR_STEP));
   2981 21 08 00      [10] 1167 	ld	hl, #0x0008
   2984 09            [11] 1168 	add	hl,bc
   2985 DD 75 FC      [19] 1169 	ld	-4 (ix), l
   2988 DD 74 FD      [19] 1170 	ld	-3 (ix), h
   298B 21 0C 00      [10] 1171 	ld	hl, #0x000c
   298E 09            [11] 1172 	add	hl,bc
   298F DD 75 FA      [19] 1173 	ld	-6 (ix), l
   2992 DD 74 FB      [19] 1174 	ld	-5 (ix), h
   2995 7E            [ 7] 1175 	ld	a, (hl)
   2996 DD 77 F8      [19] 1176 	ld	-8 (ix), a
   2999 23            [ 6] 1177 	inc	hl
   299A 7E            [ 7] 1178 	ld	a, (hl)
   299B DD 77 F9      [19] 1179 	ld	-7 (ix), a
   299E 21 0E 00      [10] 1180 	ld	hl, #0x000e
   29A1 09            [11] 1181 	add	hl,bc
   29A2 DD 75 FE      [19] 1182 	ld	-2 (ix), l
   29A5 DD 74 FF      [19] 1183 	ld	-1 (ix), h
   29A8 56            [ 7] 1184 	ld	d, (hl)
   29A9 C5            [11] 1185 	push	bc
   29AA D5            [11] 1186 	push	de
   29AB 33            [ 6] 1187 	inc	sp
   29AC CD 52 1F      [17] 1188 	call	___uchar2fs
   29AF 33            [ 6] 1189 	inc	sp
   29B0 EB            [ 4] 1190 	ex	de, hl
   29B1 E5            [11] 1191 	push	hl
   29B2 D5            [11] 1192 	push	de
   29B3 21 B3 3F      [10] 1193 	ld	hl, #0x3fb3
   29B6 E5            [11] 1194 	push	hl
   29B7 21 33 33      [10] 1195 	ld	hl, #0x3333
   29BA E5            [11] 1196 	push	hl
   29BB CD 9D 1B      [17] 1197 	call	___fsmul
   29BE F1            [10] 1198 	pop	af
   29BF F1            [10] 1199 	pop	af
   29C0 F1            [10] 1200 	pop	af
   29C1 F1            [10] 1201 	pop	af
   29C2 D5            [11] 1202 	push	de
   29C3 E5            [11] 1203 	push	hl
   29C4 CD 02 1F      [17] 1204 	call	___fs2sint
   29C7 F1            [10] 1205 	pop	af
   29C8 E3            [19] 1206 	ex	(sp),hl
   29C9 CD 9C 0B      [17] 1207 	call	_cosine
   29CC E3            [19] 1208 	ex	(sp),hl
   29CD DD 6E F8      [19] 1209 	ld	l,-8 (ix)
   29D0 DD 66 F9      [19] 1210 	ld	h,-7 (ix)
   29D3 E5            [11] 1211 	push	hl
   29D4 CD 78 0D      [17] 1212 	call	__mulint
   29D7 F1            [10] 1213 	pop	af
   29D8 F1            [10] 1214 	pop	af
   29D9 EB            [ 4] 1215 	ex	de,hl
   29DA C1            [10] 1216 	pop	bc
   29DB DD 6E FC      [19] 1217 	ld	l,-4 (ix)
   29DE DD 66 FD      [19] 1218 	ld	h,-3 (ix)
   29E1 73            [ 7] 1219 	ld	(hl), e
   29E2 23            [ 6] 1220 	inc	hl
   29E3 72            [ 7] 1221 	ld	(hl), d
                           1222 ;src/main.c:221: c->vy = - (c->a * sine(c->dir * DIR_STEP));
   29E4 21 0A 00      [10] 1223 	ld	hl, #0x000a
   29E7 09            [11] 1224 	add	hl,bc
   29E8 E3            [19] 1225 	ex	(sp), hl
   29E9 DD 6E FA      [19] 1226 	ld	l,-6 (ix)
   29EC DD 66 FB      [19] 1227 	ld	h,-5 (ix)
   29EF 7E            [ 7] 1228 	ld	a, (hl)
   29F0 DD 77 FA      [19] 1229 	ld	-6 (ix), a
   29F3 23            [ 6] 1230 	inc	hl
   29F4 7E            [ 7] 1231 	ld	a, (hl)
   29F5 DD 77 FB      [19] 1232 	ld	-5 (ix), a
   29F8 DD 6E FE      [19] 1233 	ld	l,-2 (ix)
   29FB DD 66 FF      [19] 1234 	ld	h,-1 (ix)
   29FE 56            [ 7] 1235 	ld	d, (hl)
   29FF C5            [11] 1236 	push	bc
   2A00 D5            [11] 1237 	push	de
   2A01 33            [ 6] 1238 	inc	sp
   2A02 CD 52 1F      [17] 1239 	call	___uchar2fs
   2A05 33            [ 6] 1240 	inc	sp
   2A06 EB            [ 4] 1241 	ex	de, hl
   2A07 E5            [11] 1242 	push	hl
   2A08 D5            [11] 1243 	push	de
   2A09 21 B3 3F      [10] 1244 	ld	hl, #0x3fb3
   2A0C E5            [11] 1245 	push	hl
   2A0D 21 33 33      [10] 1246 	ld	hl, #0x3333
   2A10 E5            [11] 1247 	push	hl
   2A11 CD 9D 1B      [17] 1248 	call	___fsmul
   2A14 F1            [10] 1249 	pop	af
   2A15 F1            [10] 1250 	pop	af
   2A16 F1            [10] 1251 	pop	af
   2A17 F1            [10] 1252 	pop	af
   2A18 D5            [11] 1253 	push	de
   2A19 E5            [11] 1254 	push	hl
   2A1A CD 02 1F      [17] 1255 	call	___fs2sint
   2A1D F1            [10] 1256 	pop	af
   2A1E E3            [19] 1257 	ex	(sp),hl
   2A1F CD 5A 0A      [17] 1258 	call	_sine
   2A22 E3            [19] 1259 	ex	(sp),hl
   2A23 DD 6E FA      [19] 1260 	ld	l,-6 (ix)
   2A26 DD 66 FB      [19] 1261 	ld	h,-5 (ix)
   2A29 E5            [11] 1262 	push	hl
   2A2A CD 78 0D      [17] 1263 	call	__mulint
   2A2D F1            [10] 1264 	pop	af
   2A2E F1            [10] 1265 	pop	af
   2A2F C1            [10] 1266 	pop	bc
   2A30 AF            [ 4] 1267 	xor	a, a
   2A31 95            [ 4] 1268 	sub	a, l
   2A32 5F            [ 4] 1269 	ld	e, a
   2A33 3E 00         [ 7] 1270 	ld	a, #0x00
   2A35 9C            [ 4] 1271 	sbc	a, h
   2A36 57            [ 4] 1272 	ld	d, a
   2A37 E1            [10] 1273 	pop	hl
   2A38 E5            [11] 1274 	push	hl
   2A39 73            [ 7] 1275 	ld	(hl), e
   2A3A 23            [ 6] 1276 	inc	hl
   2A3B 72            [ 7] 1277 	ld	(hl), d
                           1278 ;src/main.c:236: c->x = c->x + c->vx;
   2A3C 69            [ 4] 1279 	ld	l, c
   2A3D 60            [ 4] 1280 	ld	h, b
   2A3E 5E            [ 7] 1281 	ld	e, (hl)
   2A3F 23            [ 6] 1282 	inc	hl
   2A40 56            [ 7] 1283 	ld	d, (hl)
   2A41 DD 6E FC      [19] 1284 	ld	l,-4 (ix)
   2A44 DD 66 FD      [19] 1285 	ld	h,-3 (ix)
   2A47 7E            [ 7] 1286 	ld	a, (hl)
   2A48 23            [ 6] 1287 	inc	hl
   2A49 66            [ 7] 1288 	ld	h, (hl)
   2A4A 6F            [ 4] 1289 	ld	l, a
   2A4B 19            [11] 1290 	add	hl,de
   2A4C EB            [ 4] 1291 	ex	de,hl
   2A4D 69            [ 4] 1292 	ld	l, c
   2A4E 60            [ 4] 1293 	ld	h, b
   2A4F 73            [ 7] 1294 	ld	(hl), e
   2A50 23            [ 6] 1295 	inc	hl
   2A51 72            [ 7] 1296 	ld	(hl), d
                           1297 ;src/main.c:237: c->y = c->y + c->vy;
   2A52 03            [ 6] 1298 	inc	bc
   2A53 03            [ 6] 1299 	inc	bc
   2A54 69            [ 4] 1300 	ld	l, c
   2A55 60            [ 4] 1301 	ld	h, b
   2A56 5E            [ 7] 1302 	ld	e, (hl)
   2A57 23            [ 6] 1303 	inc	hl
   2A58 56            [ 7] 1304 	ld	d, (hl)
   2A59 E1            [10] 1305 	pop	hl
   2A5A E5            [11] 1306 	push	hl
   2A5B 7E            [ 7] 1307 	ld	a, (hl)
   2A5C 23            [ 6] 1308 	inc	hl
   2A5D 66            [ 7] 1309 	ld	h, (hl)
   2A5E 6F            [ 4] 1310 	ld	l, a
   2A5F 19            [11] 1311 	add	hl,de
   2A60 EB            [ 4] 1312 	ex	de,hl
   2A61 7B            [ 4] 1313 	ld	a, e
   2A62 02            [ 7] 1314 	ld	(bc), a
   2A63 03            [ 6] 1315 	inc	bc
   2A64 7A            [ 4] 1316 	ld	a, d
   2A65 02            [ 7] 1317 	ld	(bc), a
   2A66 DD F9         [10] 1318 	ld	sp, ix
   2A68 DD E1         [14] 1319 	pop	ix
   2A6A C9            [10] 1320 	ret
                           1321 ;src/main.c:244: void init(TCharacter *c){
                           1322 ;	---------------------------------
                           1323 ; Function init
                           1324 ; ---------------------------------
   2A6B                    1325 _init::
   2A6B DD E5         [15] 1326 	push	ix
   2A6D DD 21 00 00   [14] 1327 	ld	ix,#0
   2A71 DD 39         [15] 1328 	add	ix,sp
                           1329 ;src/main.c:246: g_nInterrupt = 0; // Manage Interrupt
   2A73 21 98 1B      [10] 1330 	ld	hl,#_g_nInterrupt + 0
   2A76 36 00         [10] 1331 	ld	(hl), #0x00
                           1332 ;src/main.c:247: i_time = 0;
   2A78 AF            [ 4] 1333 	xor	a, a
   2A79 FD 21 99 1B   [14] 1334 	ld	iy, #_i_time
   2A7D FD 77 00      [19] 1335 	ld	0 (iy), a
   2A80 FD 77 01      [19] 1336 	ld	1 (iy), a
   2A83 FD 77 02      [19] 1337 	ld	2 (iy), a
   2A86 FD 77 03      [19] 1338 	ld	3 (iy), a
                           1339 ;src/main.c:248: cpct_setInterruptHandler((void*) myInterruptHandler);
   2A89 21 D5 23      [10] 1340 	ld	hl, #_myInterruptHandler
   2A8C CD 85 0F      [17] 1341 	call	_cpct_setInterruptHandler
                           1342 ;src/main.c:249: cpct_setVideoMode(0);
   2A8F 2E 00         [ 7] 1343 	ld	l, #0x00
   2A91 CD 2E 0E      [17] 1344 	call	_cpct_setVideoMode
                           1345 ;src/main.c:251: c->x = 20 << 8;
   2A94 DD 4E 04      [19] 1346 	ld	c,4 (ix)
   2A97 DD 46 05      [19] 1347 	ld	b,5 (ix)
   2A9A 69            [ 4] 1348 	ld	l, c
   2A9B 60            [ 4] 1349 	ld	h, b
   2A9C 36 00         [10] 1350 	ld	(hl), #0x00
   2A9E 23            [ 6] 1351 	inc	hl
   2A9F 36 14         [10] 1352 	ld	(hl), #0x14
                           1353 ;src/main.c:252: c->px = c->x ;
   2AA1 FD 21 04 00   [14] 1354 	ld	iy, #0x0004
   2AA5 FD 09         [15] 1355 	add	iy, bc
   2AA7 69            [ 4] 1356 	ld	l, c
   2AA8 60            [ 4] 1357 	ld	h, b
   2AA9 5E            [ 7] 1358 	ld	e, (hl)
   2AAA 23            [ 6] 1359 	inc	hl
   2AAB 56            [ 7] 1360 	ld	d, (hl)
   2AAC FD 73 00      [19] 1361 	ld	0 (iy), e
   2AAF FD 72 01      [19] 1362 	ld	1 (iy), d
                           1363 ;src/main.c:253: c->y = 20 << 8;
   2AB2 69            [ 4] 1364 	ld	l, c
   2AB3 60            [ 4] 1365 	ld	h, b
   2AB4 23            [ 6] 1366 	inc	hl
   2AB5 23            [ 6] 1367 	inc	hl
   2AB6 36 00         [10] 1368 	ld	(hl), #0x00
   2AB8 23            [ 6] 1369 	inc	hl
   2AB9 36 14         [10] 1370 	ld	(hl), #0x14
   2ABB 2B            [ 6] 1371 	dec	hl
                           1372 ;src/main.c:254: c->py = c->y;
   2ABC FD 21 06 00   [14] 1373 	ld	iy, #0x0006
   2AC0 FD 09         [15] 1374 	add	iy, bc
   2AC2 5E            [ 7] 1375 	ld	e, (hl)
   2AC3 23            [ 6] 1376 	inc	hl
   2AC4 56            [ 7] 1377 	ld	d, (hl)
   2AC5 FD 73 00      [19] 1378 	ld	0 (iy), e
   2AC8 FD 72 01      [19] 1379 	ld	1 (iy), d
                           1380 ;src/main.c:255: c->vx = 0;
   2ACB 21 08 00      [10] 1381 	ld	hl, #0x0008
   2ACE 09            [11] 1382 	add	hl, bc
   2ACF AF            [ 4] 1383 	xor	a, a
   2AD0 77            [ 7] 1384 	ld	(hl), a
   2AD1 23            [ 6] 1385 	inc	hl
   2AD2 77            [ 7] 1386 	ld	(hl), a
                           1387 ;src/main.c:256: c->vy = 0;
   2AD3 21 0A 00      [10] 1388 	ld	hl, #0x000a
   2AD6 09            [11] 1389 	add	hl, bc
   2AD7 AF            [ 4] 1390 	xor	a, a
   2AD8 77            [ 7] 1391 	ld	(hl), a
   2AD9 23            [ 6] 1392 	inc	hl
   2ADA 77            [ 7] 1393 	ld	(hl), a
                           1394 ;src/main.c:257: c->a = 0;
   2ADB 21 0C 00      [10] 1395 	ld	hl, #0x000c
   2ADE 09            [11] 1396 	add	hl, bc
   2ADF AF            [ 4] 1397 	xor	a, a
   2AE0 77            [ 7] 1398 	ld	(hl), a
   2AE1 23            [ 6] 1399 	inc	hl
   2AE2 77            [ 7] 1400 	ld	(hl), a
                           1401 ;src/main.c:258: c->dir = 0;
   2AE3 21 0E 00      [10] 1402 	ld	hl, #0x000e
   2AE6 09            [11] 1403 	add	hl, bc
   2AE7 36 00         [10] 1404 	ld	(hl), #0x00
                           1405 ;src/main.c:259: c->motion = 0;
   2AE9 21 0F 00      [10] 1406 	ld	hl, #0x000f
   2AEC 09            [11] 1407 	add	hl, bc
   2AED 36 00         [10] 1408 	ld	(hl), #0x00
                           1409 ;src/main.c:260: c->target = 0;
   2AEF 21 10 00      [10] 1410 	ld	hl, #0x0010
   2AF2 09            [11] 1411 	add	hl, bc
   2AF3 36 00         [10] 1412 	ld	(hl), #0x00
                           1413 ;src/main.c:262: printWayPoints();
   2AF5 CD 02 25      [17] 1414 	call	_printWayPoints
                           1415 ;src/main.c:264: pause = 0;
   2AF8 21 97 1B      [10] 1416 	ld	hl,#_pause + 0
   2AFB 36 00         [10] 1417 	ld	(hl), #0x00
   2AFD DD E1         [14] 1418 	pop	ix
   2AFF C9            [10] 1419 	ret
                           1420 ;src/main.c:268: void main(void) {
                           1421 ;	---------------------------------
                           1422 ; Function main
                           1423 ; ---------------------------------
   2B00                    1424 _main::
   2B00 DD E5         [15] 1425 	push	ix
   2B02 21 EF FF      [10] 1426 	ld	hl, #-17
   2B05 39            [11] 1427 	add	hl, sp
   2B06 F9            [ 6] 1428 	ld	sp, hl
                           1429 ;src/main.c:272: init(&c);
   2B07 21 00 00      [10] 1430 	ld	hl, #0x0000
   2B0A 39            [11] 1431 	add	hl, sp
   2B0B 4D            [ 4] 1432 	ld	c, l
   2B0C 44            [ 4] 1433 	ld	b, h
   2B0D 59            [ 4] 1434 	ld	e, c
   2B0E 50            [ 4] 1435 	ld	d, b
   2B0F C5            [11] 1436 	push	bc
   2B10 D5            [11] 1437 	push	de
   2B11 CD 6B 2A      [17] 1438 	call	_init
   2B14 F1            [10] 1439 	pop	af
   2B15 C1            [10] 1440 	pop	bc
                           1441 ;src/main.c:274: printCharacter(&c);
   2B16 59            [ 4] 1442 	ld	e, c
   2B17 50            [ 4] 1443 	ld	d, b
   2B18 C5            [11] 1444 	push	bc
   2B19 D5            [11] 1445 	push	de
   2B1A CD 4B 24      [17] 1446 	call	_printCharacter
   2B1D F1            [10] 1447 	pop	af
   2B1E C1            [10] 1448 	pop	bc
                           1449 ;src/main.c:277: while (1){    
   2B1F                    1450 00102$:
                           1451 ;src/main.c:279: cpct_waitHalts(100);
   2B1F C5            [11] 1452 	push	bc
   2B20 2E 64         [ 7] 1453 	ld	l, #0x64
   2B22 CD 92 0D      [17] 1454 	call	_cpct_waitHalts
   2B25 C1            [10] 1455 	pop	bc
                           1456 ;src/main.c:280: getCharacterInput(&c);
   2B26 59            [ 4] 1457 	ld	e, c
   2B27 50            [ 4] 1458 	ld	d, b
   2B28 C5            [11] 1459 	push	bc
   2B29 D5            [11] 1460 	push	de
   2B2A CD 4B 27      [17] 1461 	call	_getCharacterInput
   2B2D F1            [10] 1462 	pop	af
   2B2E C1            [10] 1463 	pop	bc
                           1464 ;src/main.c:281: updateCharacter(&c);
   2B2F 59            [ 4] 1465 	ld	e, c
   2B30 50            [ 4] 1466 	ld	d, b
   2B31 C5            [11] 1467 	push	bc
   2B32 D5            [11] 1468 	push	de
   2B33 CD 5E 29      [17] 1469 	call	_updateCharacter
   2B36 F1            [10] 1470 	pop	af
   2B37 C1            [10] 1471 	pop	bc
                           1472 ;src/main.c:282: eraseCharacter(&c);
   2B38 59            [ 4] 1473 	ld	e, c
   2B39 50            [ 4] 1474 	ld	d, b
   2B3A C5            [11] 1475 	push	bc
   2B3B D5            [11] 1476 	push	de
   2B3C CD 09 24      [17] 1477 	call	_eraseCharacter
   2B3F F1            [10] 1478 	pop	af
   2B40 C1            [10] 1479 	pop	bc
                           1480 ;src/main.c:283: printCharacter(&c);
   2B41 59            [ 4] 1481 	ld	e, c
   2B42 50            [ 4] 1482 	ld	d, b
   2B43 C5            [11] 1483 	push	bc
   2B44 D5            [11] 1484 	push	de
   2B45 CD 4B 24      [17] 1485 	call	_printCharacter
   2B48 F1            [10] 1486 	pop	af
   2B49 C1            [10] 1487 	pop	bc
                           1488 ;src/main.c:284: c.px = c.x;
   2B4A FD 21 04 00   [14] 1489 	ld	iy, #0x0004
   2B4E FD 09         [15] 1490 	add	iy, bc
   2B50 69            [ 4] 1491 	ld	l, c
   2B51 60            [ 4] 1492 	ld	h, b
   2B52 5E            [ 7] 1493 	ld	e, (hl)
   2B53 23            [ 6] 1494 	inc	hl
   2B54 56            [ 7] 1495 	ld	d, (hl)
   2B55 FD 73 00      [19] 1496 	ld	0 (iy), e
   2B58 FD 72 01      [19] 1497 	ld	1 (iy), d
                           1498 ;src/main.c:285: c.py = c.y;
   2B5B FD 21 06 00   [14] 1499 	ld	iy, #0x0006
   2B5F FD 09         [15] 1500 	add	iy, bc
   2B61 69            [ 4] 1501 	ld	l, c
   2B62 60            [ 4] 1502 	ld	h, b
   2B63 23            [ 6] 1503 	inc	hl
   2B64 23            [ 6] 1504 	inc	hl
   2B65 5E            [ 7] 1505 	ld	e, (hl)
   2B66 23            [ 6] 1506 	inc	hl
   2B67 56            [ 7] 1507 	ld	d, (hl)
   2B68 FD 73 00      [19] 1508 	ld	0 (iy), e
   2B6B FD 72 01      [19] 1509 	ld	1 (iy), d
   2B6E 18 AF         [12] 1510 	jr	00102$
                           1511 	.area _CODE
                           1512 	.area _INITIALIZER
                           1513 	.area _CABS (ABS)
