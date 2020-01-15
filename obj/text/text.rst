                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
                              4 ;--------------------------------------------------------
                              5 	.module text
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _cpct_getScreenPtr
                             12 	.globl _cpct_drawSpriteMaskedAlignedTable
                             13 	.globl _cpct_drawSprite
                             14 	.globl _swapColors
                             15 	.globl _strLength
                             16 	.globl _strCopy
                             17 	.globl _drawText
                             18 ;--------------------------------------------------------
                             19 ; special function registers
                             20 ;--------------------------------------------------------
                             21 ;--------------------------------------------------------
                             22 ; ram data
                             23 ;--------------------------------------------------------
                             24 	.area _DATA
                             25 ;--------------------------------------------------------
                             26 ; ram data
                             27 ;--------------------------------------------------------
                             28 	.area _INITIALIZED
                             29 ;--------------------------------------------------------
                             30 ; absolute external ram data
                             31 ;--------------------------------------------------------
                             32 	.area _DABS (ABS)
                             33 ;--------------------------------------------------------
                             34 ; global & static initialisations
                             35 ;--------------------------------------------------------
                             36 	.area _HOME
                             37 	.area _GSINIT
                             38 	.area _GSFINAL
                             39 	.area _GSINIT
                             40 ;--------------------------------------------------------
                             41 ; Home
                             42 ;--------------------------------------------------------
                             43 	.area _HOME
                             44 	.area _HOME
                             45 ;--------------------------------------------------------
                             46 ; code
                             47 ;--------------------------------------------------------
                             48 	.area _CODE
                             49 ;src/text/text.c:56: u8 strLength(u8 str[]) {
                             50 ;	---------------------------------
                             51 ; Function strLength
                             52 ; ---------------------------------
   0300                      53 _strLength::
                             54 ;src/text/text.c:60: while (str[result] != '\0') {
   0300 0E 00         [ 7]   55 	ld	c, #0x00
   0302                      56 00101$:
   0302 21 02 00      [10]   57 	ld	hl, #2
   0305 39            [11]   58 	add	hl, sp
   0306 7E            [ 7]   59 	ld	a, (hl)
   0307 23            [ 6]   60 	inc	hl
   0308 66            [ 7]   61 	ld	h, (hl)
   0309 6F            [ 4]   62 	ld	l, a
   030A 06 00         [ 7]   63 	ld	b, #0x00
   030C 09            [11]   64 	add	hl, bc
   030D 7E            [ 7]   65 	ld	a, (hl)
   030E B7            [ 4]   66 	or	a, a
   030F 28 03         [12]   67 	jr	Z,00103$
                             68 ;src/text/text.c:61: result++;
   0311 0C            [ 4]   69 	inc	c
   0312 18 EE         [12]   70 	jr	00101$
   0314                      71 00103$:
                             72 ;src/text/text.c:63: return result;
   0314 69            [ 4]   73 	ld	l, c
   0315 C9            [10]   74 	ret
   0316                      75 _swapColors:
   0316 55                   76 	.db #0x55	; 85	'U'
   0317 EE                   77 	.db #0xee	; 238
   0318 DD                   78 	.db #0xdd	; 221
   0319 FF                   79 	.db #0xff	; 255
   031A 14                   80 	.db #0x14	; 20
   031B 6C                   81 	.db #0x6c	; 108	'l'
   031C 9C                   82 	.db #0x9c	; 156
   031D 3C                   83 	.db #0x3c	; 60
   031E 50                   84 	.db #0x50	; 80	'P'
   031F E4                   85 	.db #0xe4	; 228
   0320 D8                   86 	.db #0xd8	; 216
   0321 F0                   87 	.db #0xf0	; 240
   0322 11                   88 	.db #0x11	; 17
   0323 66                   89 	.db #0x66	; 102	'f'
   0324 99                   90 	.db #0x99	; 153
   0325 33                   91 	.db #0x33	; 51	'3'
   0326 10                   92 	.db #0x10	; 16
   0327 35                   93 	.db #0x35	; 53	'5'
   0328 3A                   94 	.db #0x3a	; 58
   0329 30                   95 	.db #0x30	; 48	'0'
   032A 45                   96 	.db #0x45	; 69	'E'
   032B CE                   97 	.db #0xce	; 206
   032C CD                   98 	.db #0xcd	; 205
   032D CF                   99 	.db #0xcf	; 207
                            100 ;src/text/text.c:77: void strCopy(u8 source[], u8 dest[]) 
                            101 ;	---------------------------------
                            102 ; Function strCopy
                            103 ; ---------------------------------
   032E                     104 _strCopy::
   032E DD E5         [15]  105 	push	ix
   0330 DD 21 00 00   [14]  106 	ld	ix,#0
   0334 DD 39         [15]  107 	add	ix,sp
                            108 ;src/text/text.c:80: while ((dest[i] = source[i]) != '\0')
   0336 0E 00         [ 7]  109 	ld	c, #0x00
   0338                     110 00101$:
   0338 DD 7E 06      [19]  111 	ld	a, 6 (ix)
   033B 81            [ 4]  112 	add	a, c
   033C 5F            [ 4]  113 	ld	e, a
   033D DD 7E 07      [19]  114 	ld	a, 7 (ix)
   0340 CE 00         [ 7]  115 	adc	a, #0x00
   0342 57            [ 4]  116 	ld	d, a
   0343 DD 6E 04      [19]  117 	ld	l,4 (ix)
   0346 DD 66 05      [19]  118 	ld	h,5 (ix)
   0349 06 00         [ 7]  119 	ld	b, #0x00
   034B 09            [11]  120 	add	hl, bc
   034C 7E            [ 7]  121 	ld	a, (hl)
   034D 12            [ 7]  122 	ld	(de), a
   034E B7            [ 4]  123 	or	a, a
   034F 28 03         [12]  124 	jr	Z,00104$
                            125 ;src/text/text.c:82: i++;
   0351 0C            [ 4]  126 	inc	c
   0352 18 E4         [12]  127 	jr	00101$
   0354                     128 00104$:
   0354 DD E1         [14]  129 	pop	ix
   0356 C9            [10]  130 	ret
                            131 ;src/text/text.c:87: void drawText(const u8 text[], u8 xPos, u8 yPos, u8 color, u8 size, u8 transparent) {
                            132 ;	---------------------------------
                            133 ; Function drawText
                            134 ; ---------------------------------
   0357                     135 _drawText::
   0357 DD E5         [15]  136 	push	ix
   0359 DD 21 00 00   [14]  137 	ld	ix,#0
   035D DD 39         [15]  138 	add	ix,sp
   035F 21 AD FF      [10]  139 	ld	hl, #-83
   0362 39            [11]  140 	add	hl, sp
   0363 F9            [ 6]  141 	ld	sp, hl
                            142 ;src/text/text.c:99: color1 = swapColors[color][0];
   0364 01 16 03      [10]  143 	ld	bc, #_swapColors+0
   0367 DD 6E 08      [19]  144 	ld	l, 8 (ix)
   036A 26 00         [ 7]  145 	ld	h, #0x00
   036C 29            [11]  146 	add	hl, hl
   036D 29            [11]  147 	add	hl, hl
   036E 09            [11]  148 	add	hl, bc
   036F E5            [11]  149 	push	hl
   0370 FD E1         [14]  150 	pop	iy
   0372 FD 7E 00      [19]  151 	ld	a, 0 (iy)
   0375 DD 77 D5      [19]  152 	ld	-43 (ix), a
                            153 ;src/text/text.c:100: color2 = swapColors[color][1];
   0378 FD E5         [15]  154 	push	iy
   037A E1            [10]  155 	pop	hl
   037B 23            [ 6]  156 	inc	hl
   037C 7E            [ 7]  157 	ld	a, (hl)
   037D DD 77 D4      [19]  158 	ld	-44 (ix), a
                            159 ;src/text/text.c:101: color3 = swapColors[color][2];
   0380 FD E5         [15]  160 	push	iy
   0382 E1            [10]  161 	pop	hl
   0383 23            [ 6]  162 	inc	hl
   0384 23            [ 6]  163 	inc	hl
   0385 7E            [ 7]  164 	ld	a, (hl)
   0386 DD 77 D3      [19]  165 	ld	-45 (ix), a
                            166 ;src/text/text.c:102: color4 = swapColors[color][3];
   0389 FD 7E 03      [19]  167 	ld	a, 3 (iy)
   038C DD 77 D2      [19]  168 	ld	-46 (ix), a
                            169 ;src/text/text.c:107: character = text[x];
   038F DD 7E 04      [19]  170 	ld	a, 4 (ix)
   0392 DD 77 DC      [19]  171 	ld	-36 (ix), a
   0395 DD 7E 05      [19]  172 	ld	a, 5 (ix)
   0398 DD 77 DD      [19]  173 	ld	-35 (ix), a
   039B DD 6E DC      [19]  174 	ld	l,-36 (ix)
   039E DD 66 DD      [19]  175 	ld	h,-35 (ix)
   03A1 7E            [ 7]  176 	ld	a, (hl)
   03A2 DD 77 FD      [19]  177 	ld	-3 (ix), a
                            178 ;src/text/text.c:109: while (character != '\0') {
   03A5 21 01 00      [10]  179 	ld	hl, #0x0001
   03A8 39            [11]  180 	add	hl, sp
   03A9 DD 75 E1      [19]  181 	ld	-31 (ix), l
   03AC DD 74 E2      [19]  182 	ld	-30 (ix), h
   03AF DD 7E E1      [19]  183 	ld	a, -31 (ix)
   03B2 DD 77 DA      [19]  184 	ld	-38 (ix), a
   03B5 DD 7E E2      [19]  185 	ld	a, -30 (ix)
   03B8 DD 77 DB      [19]  186 	ld	-37 (ix), a
   03BB DD 7E E1      [19]  187 	ld	a, -31 (ix)
   03BE DD 77 F9      [19]  188 	ld	-7 (ix), a
   03C1 DD 7E E2      [19]  189 	ld	a, -30 (ix)
   03C4 DD 77 FA      [19]  190 	ld	-6 (ix), a
   03C7 DD 7E E1      [19]  191 	ld	a, -31 (ix)
   03CA DD 77 E3      [19]  192 	ld	-29 (ix), a
   03CD DD 7E E2      [19]  193 	ld	a, -30 (ix)
   03D0 DD 77 E4      [19]  194 	ld	-28 (ix), a
   03D3 DD 7E E1      [19]  195 	ld	a, -31 (ix)
   03D6 DD 77 E9      [19]  196 	ld	-23 (ix), a
   03D9 DD 7E E2      [19]  197 	ld	a, -30 (ix)
   03DC DD 77 EA      [19]  198 	ld	-22 (ix), a
   03DF DD 7E E1      [19]  199 	ld	a, -31 (ix)
   03E2 DD 77 F3      [19]  200 	ld	-13 (ix), a
   03E5 DD 7E E2      [19]  201 	ld	a, -30 (ix)
   03E8 DD 77 F4      [19]  202 	ld	-12 (ix), a
   03EB DD 7E E1      [19]  203 	ld	a, -31 (ix)
   03EE DD 77 FB      [19]  204 	ld	-5 (ix), a
   03F1 DD 7E E2      [19]  205 	ld	a, -30 (ix)
   03F4 DD 77 FC      [19]  206 	ld	-4 (ix), a
   03F7 DD 7E E1      [19]  207 	ld	a, -31 (ix)
   03FA DD 77 E5      [19]  208 	ld	-27 (ix), a
   03FD DD 7E E2      [19]  209 	ld	a, -30 (ix)
   0400 DD 77 E6      [19]  210 	ld	-26 (ix), a
   0403 DD 7E E1      [19]  211 	ld	a, -31 (ix)
   0406 DD 77 EE      [19]  212 	ld	-18 (ix), a
   0409 DD 7E E2      [19]  213 	ld	a, -30 (ix)
   040C DD 77 EF      [19]  214 	ld	-17 (ix), a
   040F DD 7E E1      [19]  215 	ld	a, -31 (ix)
   0412 DD 77 E7      [19]  216 	ld	-25 (ix), a
   0415 DD 7E E2      [19]  217 	ld	a, -30 (ix)
   0418 DD 77 E8      [19]  218 	ld	-24 (ix), a
   041B DD 7E 09      [19]  219 	ld	a, 9 (ix)
   041E 3D            [ 4]  220 	dec	a
   041F 20 04         [12]  221 	jr	NZ,00304$
   0421 3E 01         [ 7]  222 	ld	a,#0x01
   0423 18 01         [12]  223 	jr	00305$
   0425                     224 00304$:
   0425 AF            [ 4]  225 	xor	a,a
   0426                     226 00305$:
   0426 DD 77 E0      [19]  227 	ld	-32 (ix), a
   0429 DD 7E 09      [19]  228 	ld	a, 9 (ix)
   042C 4F            [ 4]  229 	ld	c, a
   042D 87            [ 4]  230 	add	a, a
   042E 87            [ 4]  231 	add	a, a
   042F 87            [ 4]  232 	add	a, a
   0430 81            [ 4]  233 	add	a, c
   0431 DD 77 F2      [19]  234 	ld	-14 (ix), a
   0434 DD 7E E1      [19]  235 	ld	a, -31 (ix)
   0437 DD 77 F0      [19]  236 	ld	-16 (ix), a
   043A DD 7E E2      [19]  237 	ld	a, -30 (ix)
   043D DD 77 F1      [19]  238 	ld	-15 (ix), a
   0440 DD 7E F2      [19]  239 	ld	a, -14 (ix)
   0443 DD 77 ED      [19]  240 	ld	-19 (ix), a
   0446 DD 7E E1      [19]  241 	ld	a, -31 (ix)
   0449 DD 77 EB      [19]  242 	ld	-21 (ix), a
   044C DD 7E E2      [19]  243 	ld	a, -30 (ix)
   044F DD 77 EC      [19]  244 	ld	-20 (ix), a
   0452 DD 36 D7 00   [19]  245 	ld	-41 (ix), #0x00
   0456                     246 00159$:
   0456 DD 7E FD      [19]  247 	ld	a, -3 (ix)
   0459 B7            [ 4]  248 	or	a, a
   045A CA 61 07      [10]  249 	jp	Z, 00164$
                            250 ;src/text/text.c:112: if ((character == 33) || ((character>43) && (character<47)) || 
   045D DD 7E FD      [19]  251 	ld	a, -3 (ix)
   0460 D6 21         [ 7]  252 	sub	a, #0x21
   0462 20 04         [12]  253 	jr	NZ,00306$
   0464 3E 01         [ 7]  254 	ld	a,#0x01
   0466 18 01         [12]  255 	jr	00307$
   0468                     256 00306$:
   0468 AF            [ 4]  257 	xor	a,a
   0469                     258 00307$:
   0469 4F            [ 4]  259 	ld	c,a
   046A B7            [ 4]  260 	or	a, a
   046B 20 2C         [12]  261 	jr	NZ,00151$
   046D 3E 2B         [ 7]  262 	ld	a, #0x2b
   046F DD 96 FD      [19]  263 	sub	a, -3 (ix)
   0472 30 07         [12]  264 	jr	NC,00156$
   0474 DD 7E FD      [19]  265 	ld	a, -3 (ix)
   0477 D6 2F         [ 7]  266 	sub	a, #0x2f
   0479 38 1E         [12]  267 	jr	C,00151$
   047B                     268 00156$:
                            269 ;src/text/text.c:113: ((character>47) && (character<58)) || ((character>62) && (character<91))) { //Allowed characters
   047B 3E 2F         [ 7]  270 	ld	a, #0x2f
   047D DD 96 FD      [19]  271 	sub	a, -3 (ix)
   0480 30 07         [12]  272 	jr	NC,00158$
   0482 DD 7E FD      [19]  273 	ld	a, -3 (ix)
   0485 D6 3A         [ 7]  274 	sub	a, #0x3a
   0487 38 10         [12]  275 	jr	C,00151$
   0489                     276 00158$:
   0489 3E 3E         [ 7]  277 	ld	a, #0x3e
   048B DD 96 FD      [19]  278 	sub	a, -3 (ix)
   048E D2 44 07      [10]  279 	jp	NC, 00152$
   0491 DD 7E FD      [19]  280 	ld	a, -3 (ix)
   0494 D6 5B         [ 7]  281 	sub	a, #0x5b
   0496 D2 44 07      [10]  282 	jp	NC, 00152$
   0499                     283 00151$:
                            284 ;src/text/text.c:117: switch(character){
   0499 79            [ 4]  285 	ld	a, c
   049A B7            [ 4]  286 	or	a, a
   049B 20 5D         [12]  287 	jr	NZ,00101$
   049D DD 7E FD      [19]  288 	ld	a, -3 (ix)
   04A0 D6 2C         [ 7]  289 	sub	a, #0x2c
   04A2 28 5C         [12]  290 	jr	Z,00104$
   04A4 DD 7E FD      [19]  291 	ld	a, -3 (ix)
   04A7 D6 2D         [ 7]  292 	sub	a, #0x2d
   04A9 28 55         [12]  293 	jr	Z,00104$
   04AB DD 7E FD      [19]  294 	ld	a, -3 (ix)
   04AE D6 2E         [ 7]  295 	sub	a, #0x2e
   04B0 28 4E         [12]  296 	jr	Z,00104$
   04B2 DD 7E FD      [19]  297 	ld	a, -3 (ix)
   04B5 D6 30         [ 7]  298 	sub	a, #0x30
   04B7 28 51         [12]  299 	jr	Z,00114$
   04B9 DD 7E FD      [19]  300 	ld	a, -3 (ix)
   04BC D6 31         [ 7]  301 	sub	a, #0x31
   04BE 28 4A         [12]  302 	jr	Z,00114$
   04C0 DD 7E FD      [19]  303 	ld	a, -3 (ix)
   04C3 D6 32         [ 7]  304 	sub	a, #0x32
   04C5 28 43         [12]  305 	jr	Z,00114$
   04C7 DD 7E FD      [19]  306 	ld	a, -3 (ix)
   04CA D6 33         [ 7]  307 	sub	a, #0x33
   04CC 28 3C         [12]  308 	jr	Z,00114$
   04CE DD 7E FD      [19]  309 	ld	a, -3 (ix)
   04D1 D6 34         [ 7]  310 	sub	a, #0x34
   04D3 28 35         [12]  311 	jr	Z,00114$
   04D5 DD 7E FD      [19]  312 	ld	a, -3 (ix)
   04D8 D6 35         [ 7]  313 	sub	a, #0x35
   04DA 28 2E         [12]  314 	jr	Z,00114$
   04DC DD 7E FD      [19]  315 	ld	a, -3 (ix)
   04DF D6 36         [ 7]  316 	sub	a, #0x36
   04E1 28 27         [12]  317 	jr	Z,00114$
   04E3 DD 7E FD      [19]  318 	ld	a, -3 (ix)
   04E6 D6 37         [ 7]  319 	sub	a, #0x37
   04E8 28 20         [12]  320 	jr	Z,00114$
   04EA DD 7E FD      [19]  321 	ld	a, -3 (ix)
   04ED D6 38         [ 7]  322 	sub	a, #0x38
   04EF 28 19         [12]  323 	jr	Z,00114$
   04F1 DD 7E FD      [19]  324 	ld	a, -3 (ix)
   04F4 D6 39         [ 7]  325 	sub	a, #0x39
   04F6 28 12         [12]  326 	jr	Z,00114$
   04F8 18 18         [12]  327 	jr	00115$
                            328 ;src/text/text.c:119: case 33:
   04FA                     329 00101$:
                            330 ;src/text/text.c:120: character=49;
   04FA DD 36 FD 31   [19]  331 	ld	-3 (ix), #0x31
                            332 ;src/text/text.c:121: break;
   04FE 18 12         [12]  333 	jr	00115$
                            334 ;src/text/text.c:126: case 46:
   0500                     335 00104$:
                            336 ;src/text/text.c:127: character+=6;
   0500 DD 7E FD      [19]  337 	ld	a, -3 (ix)
   0503 C6 06         [ 7]  338 	add	a, #0x06
   0505 DD 77 FD      [19]  339 	ld	-3 (ix), a
                            340 ;src/text/text.c:128: break;
   0508 18 08         [12]  341 	jr	00115$
                            342 ;src/text/text.c:140: case 57:
   050A                     343 00114$:
                            344 ;src/text/text.c:141: character+=5;
   050A DD 7E FD      [19]  345 	ld	a, -3 (ix)
   050D C6 05         [ 7]  346 	add	a, #0x05
   050F DD 77 FD      [19]  347 	ld	-3 (ix), a
                            348 ;src/text/text.c:143: }
   0512                     349 00115$:
                            350 ;src/text/text.c:146: character-=49;
   0512 DD 7E FD      [19]  351 	ld	a, -3 (ix)
   0515 C6 CF         [ 7]  352 	add	a, #0xcf
                            353 ;src/text/text.c:149: for(i=0;i<18;i++){
   0517 DD 77 AD      [19]  354 	ld	-83 (ix), a
   051A 4F            [ 4]  355 	ld	c, a
   051B 06 00         [ 7]  356 	ld	b,#0x00
   051D 69            [ 4]  357 	ld	l, c
   051E 60            [ 4]  358 	ld	h, b
   051F 29            [11]  359 	add	hl, hl
   0520 29            [11]  360 	add	hl, hl
   0521 29            [11]  361 	add	hl, hl
   0522 09            [11]  362 	add	hl, bc
   0523 29            [11]  363 	add	hl, hl
   0524 4D            [ 4]  364 	ld	c, l
   0525 44            [ 4]  365 	ld	b, h
   0526 DD 36 D6 00   [19]  366 	ld	-42 (ix), #0x00
   052A                     367 00162$:
                            368 ;src/text/text.c:150: pChar = (u8*) g_font_chars + (character*18) + i;
   052A 21 66 07      [10]  369 	ld	hl, #_g_font_chars
   052D 09            [11]  370 	add	hl, bc
   052E DD 5E D6      [19]  371 	ld	e,-42 (ix)
   0531 16 00         [ 7]  372 	ld	d,#0x00
   0533 19            [11]  373 	add	hl, de
                            374 ;src/text/text.c:154: if(*pChar == 0x55) colorchar[i]=color1;
   0534 DD 75 D8      [19]  375 	ld	-40 (ix), l
   0537 DD 74 D9      [19]  376 	ld	-39 (ix), h
   053A 5E            [ 7]  377 	ld	e, (hl)
   053B 7B            [ 4]  378 	ld	a, e
   053C D6 55         [ 7]  379 	sub	a, #0x55
   053E 20 04         [12]  380 	jr	NZ,00321$
   0540 3E 01         [ 7]  381 	ld	a,#0x01
   0542 18 01         [12]  382 	jr	00322$
   0544                     383 00321$:
   0544 AF            [ 4]  384 	xor	a,a
   0545                     385 00322$:
   0545 DD 77 DF      [19]  386 	ld	-33 (ix), a
                            387 ;src/text/text.c:155: else if(*pChar == 0xee) colorchar[i]=color2;
   0548 7B            [ 4]  388 	ld	a, e
   0549 D6 EE         [ 7]  389 	sub	a, #0xee
   054B 20 04         [12]  390 	jr	NZ,00323$
   054D 3E 01         [ 7]  391 	ld	a,#0x01
   054F 18 01         [12]  392 	jr	00324$
   0551                     393 00323$:
   0551 AF            [ 4]  394 	xor	a,a
   0552                     395 00324$:
   0552 DD 77 DE      [19]  396 	ld	-34 (ix), a
                            397 ;src/text/text.c:156: else if(*pChar == 0xdd) colorchar[i]=color3;
   0555 7B            [ 4]  398 	ld	a, e
   0556 D6 DD         [ 7]  399 	sub	a, #0xdd
   0558 20 04         [12]  400 	jr	NZ,00325$
   055A 3E 01         [ 7]  401 	ld	a,#0x01
   055C 18 01         [12]  402 	jr	00326$
   055E                     403 00325$:
   055E AF            [ 4]  404 	xor	a,a
   055F                     405 00326$:
   055F DD 77 FF      [19]  406 	ld	-1 (ix), a
                            407 ;src/text/text.c:157: else if(*pChar == 0xff) colorchar[i]=color4;
   0562 7B            [ 4]  408 	ld	a, e
   0563 3C            [ 4]  409 	inc	a
   0564 20 04         [12]  410 	jr	NZ,00327$
   0566 3E 01         [ 7]  411 	ld	a,#0x01
   0568 18 01         [12]  412 	jr	00328$
   056A                     413 00327$:
   056A AF            [ 4]  414 	xor	a,a
   056B                     415 00328$:
   056B DD 77 FE      [19]  416 	ld	-2 (ix), a
                            417 ;src/text/text.c:152: if(size==1) {
   056E DD 7E E0      [19]  418 	ld	a, -32 (ix)
   0571 B7            [ 4]  419 	or	a, a
   0572 CA EE 05      [10]  420 	jp	Z, 00141$
                            421 ;src/text/text.c:154: if(*pChar == 0x55) colorchar[i]=color1;
   0575 DD 7E DF      [19]  422 	ld	a, -33 (ix)
   0578 B7            [ 4]  423 	or	a, a
   0579 28 14         [12]  424 	jr	Z,00126$
   057B DD 7E E7      [19]  425 	ld	a, -25 (ix)
   057E DD 86 D6      [19]  426 	add	a, -42 (ix)
   0581 5F            [ 4]  427 	ld	e, a
   0582 DD 7E E8      [19]  428 	ld	a, -24 (ix)
   0585 CE 00         [ 7]  429 	adc	a, #0x00
   0587 57            [ 4]  430 	ld	d, a
   0588 DD 7E D5      [19]  431 	ld	a, -43 (ix)
   058B 12            [ 7]  432 	ld	(de), a
   058C C3 C7 06      [10]  433 	jp	00163$
   058F                     434 00126$:
                            435 ;src/text/text.c:155: else if(*pChar == 0xee) colorchar[i]=color2;
   058F DD 7E DE      [19]  436 	ld	a, -34 (ix)
   0592 B7            [ 4]  437 	or	a, a
   0593 28 14         [12]  438 	jr	Z,00123$
   0595 DD 7E EE      [19]  439 	ld	a, -18 (ix)
   0598 DD 86 D6      [19]  440 	add	a, -42 (ix)
   059B 5F            [ 4]  441 	ld	e, a
   059C DD 7E EF      [19]  442 	ld	a, -17 (ix)
   059F CE 00         [ 7]  443 	adc	a, #0x00
   05A1 57            [ 4]  444 	ld	d, a
   05A2 DD 7E D4      [19]  445 	ld	a, -44 (ix)
   05A5 12            [ 7]  446 	ld	(de), a
   05A6 C3 C7 06      [10]  447 	jp	00163$
   05A9                     448 00123$:
                            449 ;src/text/text.c:156: else if(*pChar == 0xdd) colorchar[i]=color3;
   05A9 DD 7E FF      [19]  450 	ld	a, -1 (ix)
   05AC B7            [ 4]  451 	or	a, a
   05AD 28 14         [12]  452 	jr	Z,00120$
   05AF DD 7E E5      [19]  453 	ld	a, -27 (ix)
   05B2 DD 86 D6      [19]  454 	add	a, -42 (ix)
   05B5 5F            [ 4]  455 	ld	e, a
   05B6 DD 7E E6      [19]  456 	ld	a, -26 (ix)
   05B9 CE 00         [ 7]  457 	adc	a, #0x00
   05BB 57            [ 4]  458 	ld	d, a
   05BC DD 7E D3      [19]  459 	ld	a, -45 (ix)
   05BF 12            [ 7]  460 	ld	(de), a
   05C0 C3 C7 06      [10]  461 	jp	00163$
   05C3                     462 00120$:
                            463 ;src/text/text.c:157: else if(*pChar == 0xff) colorchar[i]=color4;
   05C3 DD 7E FE      [19]  464 	ld	a, -2 (ix)
   05C6 B7            [ 4]  465 	or	a, a
   05C7 28 14         [12]  466 	jr	Z,00117$
   05C9 DD 7E FB      [19]  467 	ld	a, -5 (ix)
   05CC DD 86 D6      [19]  468 	add	a, -42 (ix)
   05CF 5F            [ 4]  469 	ld	e, a
   05D0 DD 7E FC      [19]  470 	ld	a, -4 (ix)
   05D3 CE 00         [ 7]  471 	adc	a, #0x00
   05D5 57            [ 4]  472 	ld	d, a
   05D6 DD 7E D2      [19]  473 	ld	a, -46 (ix)
   05D9 12            [ 7]  474 	ld	(de), a
   05DA C3 C7 06      [10]  475 	jp	00163$
   05DD                     476 00117$:
                            477 ;src/text/text.c:158: else colorchar[i]=*pChar;
   05DD DD 7E F3      [19]  478 	ld	a, -13 (ix)
   05E0 DD 86 D6      [19]  479 	add	a, -42 (ix)
   05E3 6F            [ 4]  480 	ld	l, a
   05E4 DD 7E F4      [19]  481 	ld	a, -12 (ix)
   05E7 CE 00         [ 7]  482 	adc	a, #0x00
   05E9 67            [ 4]  483 	ld	h, a
   05EA 73            [ 7]  484 	ld	(hl), e
   05EB C3 C7 06      [10]  485 	jp	00163$
   05EE                     486 00141$:
                            487 ;src/text/text.c:163: pos=(i*size)-(i%FONT2_W);
   05EE D5            [11]  488 	push	de
   05EF C5            [11]  489 	push	bc
   05F0 DD 5E 09      [19]  490 	ld	e, 9 (ix)
   05F3 DD 66 D6      [19]  491 	ld	h, -42 (ix)
   05F6 2E 00         [ 7]  492 	ld	l, #0x00
   05F8 55            [ 4]  493 	ld	d, l
   05F9 06 08         [ 7]  494 	ld	b, #0x08
   05FB                     495 00329$:
   05FB 29            [11]  496 	add	hl, hl
   05FC 30 01         [12]  497 	jr	NC,00330$
   05FE 19            [11]  498 	add	hl, de
   05FF                     499 00330$:
   05FF 10 FA         [13]  500 	djnz	00329$
   0601 C1            [10]  501 	pop	bc
   0602 D1            [10]  502 	pop	de
   0603 DD 7E D6      [19]  503 	ld	a, -42 (ix)
   0606 E6 01         [ 7]  504 	and	a, #0x01
   0608 57            [ 4]  505 	ld	d, a
   0609 7D            [ 4]  506 	ld	a, l
   060A 92            [ 4]  507 	sub	a, d
   060B 6F            [ 4]  508 	ld	l, a
                            509 ;src/text/text.c:167: colorchar[pos+FONT2_W]=color1;
   060C 55            [ 4]  510 	ld	d, l
   060D 14            [ 4]  511 	inc	d
   060E 14            [ 4]  512 	inc	d
                            513 ;src/text/text.c:165: if(*pChar == 0x55) {
   060F DD 7E DF      [19]  514 	ld	a, -33 (ix)
   0612 B7            [ 4]  515 	or	a, a
   0613 28 21         [12]  516 	jr	Z,00138$
                            517 ;src/text/text.c:166: colorchar[pos]=color1;
   0615 DD 7E E9      [19]  518 	ld	a, -23 (ix)
   0618 85            [ 4]  519 	add	a, l
   0619 6F            [ 4]  520 	ld	l, a
   061A DD 7E EA      [19]  521 	ld	a, -22 (ix)
   061D CE 00         [ 7]  522 	adc	a, #0x00
   061F 67            [ 4]  523 	ld	h, a
   0620 DD 7E D5      [19]  524 	ld	a, -43 (ix)
   0623 77            [ 7]  525 	ld	(hl), a
                            526 ;src/text/text.c:167: colorchar[pos+FONT2_W]=color1;
   0624 DD 7E E9      [19]  527 	ld	a, -23 (ix)
   0627 82            [ 4]  528 	add	a, d
   0628 5F            [ 4]  529 	ld	e, a
   0629 DD 7E EA      [19]  530 	ld	a, -22 (ix)
   062C CE 00         [ 7]  531 	adc	a, #0x00
   062E 57            [ 4]  532 	ld	d, a
   062F DD 7E D5      [19]  533 	ld	a, -43 (ix)
   0632 12            [ 7]  534 	ld	(de), a
   0633 C3 C7 06      [10]  535 	jp	00163$
   0636                     536 00138$:
                            537 ;src/text/text.c:169: else if(*pChar == 0xee) {
   0636 DD 7E DE      [19]  538 	ld	a, -34 (ix)
   0639 B7            [ 4]  539 	or	a, a
   063A 28 20         [12]  540 	jr	Z,00135$
                            541 ;src/text/text.c:170: colorchar[pos]=color2;
   063C DD 7E E3      [19]  542 	ld	a, -29 (ix)
   063F 85            [ 4]  543 	add	a, l
   0640 6F            [ 4]  544 	ld	l, a
   0641 DD 7E E4      [19]  545 	ld	a, -28 (ix)
   0644 CE 00         [ 7]  546 	adc	a, #0x00
   0646 67            [ 4]  547 	ld	h, a
   0647 DD 7E D4      [19]  548 	ld	a, -44 (ix)
   064A 77            [ 7]  549 	ld	(hl), a
                            550 ;src/text/text.c:171: colorchar[pos+FONT2_W]=color2;
   064B DD 7E E3      [19]  551 	ld	a, -29 (ix)
   064E 82            [ 4]  552 	add	a, d
   064F 5F            [ 4]  553 	ld	e, a
   0650 DD 7E E4      [19]  554 	ld	a, -28 (ix)
   0653 CE 00         [ 7]  555 	adc	a, #0x00
   0655 57            [ 4]  556 	ld	d, a
   0656 DD 7E D4      [19]  557 	ld	a, -44 (ix)
   0659 12            [ 7]  558 	ld	(de), a
   065A 18 6B         [12]  559 	jr	00163$
   065C                     560 00135$:
                            561 ;src/text/text.c:173: else if(*pChar == 0xdd) {
   065C DD 7E FF      [19]  562 	ld	a, -1 (ix)
   065F B7            [ 4]  563 	or	a, a
   0660 28 20         [12]  564 	jr	Z,00132$
                            565 ;src/text/text.c:174: colorchar[pos]=color3;
   0662 DD 7E F9      [19]  566 	ld	a, -7 (ix)
   0665 85            [ 4]  567 	add	a, l
   0666 6F            [ 4]  568 	ld	l, a
   0667 DD 7E FA      [19]  569 	ld	a, -6 (ix)
   066A CE 00         [ 7]  570 	adc	a, #0x00
   066C 67            [ 4]  571 	ld	h, a
   066D DD 7E D3      [19]  572 	ld	a, -45 (ix)
   0670 77            [ 7]  573 	ld	(hl), a
                            574 ;src/text/text.c:175: colorchar[pos+FONT2_W]=color3;
   0671 DD 7E F9      [19]  575 	ld	a, -7 (ix)
   0674 82            [ 4]  576 	add	a, d
   0675 5F            [ 4]  577 	ld	e, a
   0676 DD 7E FA      [19]  578 	ld	a, -6 (ix)
   0679 CE 00         [ 7]  579 	adc	a, #0x00
   067B 57            [ 4]  580 	ld	d, a
   067C DD 7E D3      [19]  581 	ld	a, -45 (ix)
   067F 12            [ 7]  582 	ld	(de), a
   0680 18 45         [12]  583 	jr	00163$
   0682                     584 00132$:
                            585 ;src/text/text.c:177: else if(*pChar == 0xff) {
   0682 DD 7E FE      [19]  586 	ld	a, -2 (ix)
   0685 B7            [ 4]  587 	or	a, a
   0686 28 20         [12]  588 	jr	Z,00129$
                            589 ;src/text/text.c:178: colorchar[pos]=color4;
   0688 DD 7E DA      [19]  590 	ld	a, -38 (ix)
   068B 85            [ 4]  591 	add	a, l
   068C 6F            [ 4]  592 	ld	l, a
   068D DD 7E DB      [19]  593 	ld	a, -37 (ix)
   0690 CE 00         [ 7]  594 	adc	a, #0x00
   0692 67            [ 4]  595 	ld	h, a
   0693 DD 7E D2      [19]  596 	ld	a, -46 (ix)
   0696 77            [ 7]  597 	ld	(hl), a
                            598 ;src/text/text.c:179: colorchar[pos+FONT2_W]=color4;
   0697 DD 7E DA      [19]  599 	ld	a, -38 (ix)
   069A 82            [ 4]  600 	add	a, d
   069B 5F            [ 4]  601 	ld	e, a
   069C DD 7E DB      [19]  602 	ld	a, -37 (ix)
   069F CE 00         [ 7]  603 	adc	a, #0x00
   06A1 57            [ 4]  604 	ld	d, a
   06A2 DD 7E D2      [19]  605 	ld	a, -46 (ix)
   06A5 12            [ 7]  606 	ld	(de), a
   06A6 18 1F         [12]  607 	jr	00163$
   06A8                     608 00129$:
                            609 ;src/text/text.c:182: colorchar[pos]=*pChar;
   06A8 DD 7E E1      [19]  610 	ld	a, -31 (ix)
   06AB 85            [ 4]  611 	add	a, l
   06AC 6F            [ 4]  612 	ld	l, a
   06AD DD 7E E2      [19]  613 	ld	a, -30 (ix)
   06B0 CE 00         [ 7]  614 	adc	a, #0x00
   06B2 67            [ 4]  615 	ld	h, a
   06B3 73            [ 7]  616 	ld	(hl), e
                            617 ;src/text/text.c:183: colorchar[pos+FONT2_W]=*pChar;
   06B4 DD 7E E1      [19]  618 	ld	a, -31 (ix)
   06B7 82            [ 4]  619 	add	a, d
   06B8 5F            [ 4]  620 	ld	e, a
   06B9 DD 7E E2      [19]  621 	ld	a, -30 (ix)
   06BC CE 00         [ 7]  622 	adc	a, #0x00
   06BE 57            [ 4]  623 	ld	d, a
   06BF DD 6E D8      [19]  624 	ld	l,-40 (ix)
   06C2 DD 66 D9      [19]  625 	ld	h,-39 (ix)
   06C5 7E            [ 7]  626 	ld	a, (hl)
   06C6 12            [ 7]  627 	ld	(de), a
   06C7                     628 00163$:
                            629 ;src/text/text.c:149: for(i=0;i<18;i++){
   06C7 DD 34 D6      [23]  630 	inc	-42 (ix)
   06CA DD 7E D6      [19]  631 	ld	a, -42 (ix)
   06CD D6 12         [ 7]  632 	sub	a, #0x12
   06CF DA 2A 05      [10]  633 	jp	C, 00162$
                            634 ;src/text/text.c:192: pvideo = cpct_getScreenPtr(CPCT_VMEM_START, xPos, yPos);
   06D2 DD 66 07      [19]  635 	ld	h, 7 (ix)
   06D5 DD 6E 06      [19]  636 	ld	l, 6 (ix)
   06D8 E5            [11]  637 	push	hl
   06D9 21 00 C0      [10]  638 	ld	hl, #0xc000
   06DC E5            [11]  639 	push	hl
   06DD CD 65 0F      [17]  640 	call	_cpct_getScreenPtr
                            641 ;src/text/text.c:193: if(transparent) cpct_drawSpriteMaskedAlignedTable(colorchar, pvideo, FONT2_W, FONT2_H*size, g_tablatrans);
   06E0 DD 75 F7      [19]  642 	ld	-9 (ix), l
   06E3 DD 74 F8      [19]  643 	ld	-8 (ix), h
   06E6 DD 7E 0A      [19]  644 	ld	a, 10 (ix)
   06E9 B7            [ 4]  645 	or	a, a
   06EA 28 1D         [12]  646 	jr	Z,00145$
   06EC 11 00 02      [10]  647 	ld	de, #_g_tablatrans
   06EF DD 4E EB      [19]  648 	ld	c,-21 (ix)
   06F2 DD 46 EC      [19]  649 	ld	b,-20 (ix)
   06F5 D5            [11]  650 	push	de
   06F6 DD 56 ED      [19]  651 	ld	d, -19 (ix)
   06F9 1E 02         [ 7]  652 	ld	e,#0x02
   06FB D5            [11]  653 	push	de
   06FC DD 6E F7      [19]  654 	ld	l,-9 (ix)
   06FF DD 66 F8      [19]  655 	ld	h,-8 (ix)
   0702 E5            [11]  656 	push	hl
   0703 C5            [11]  657 	push	bc
   0704 CD 2A 0F      [17]  658 	call	_cpct_drawSpriteMaskedAlignedTable
   0707 18 23         [12]  659 	jr	00146$
   0709                     660 00145$:
                            661 ;src/text/text.c:194: else cpct_drawSprite (colorchar, pvideo, FONT2_W, FONT2_H*size);
   0709 DD 7E F0      [19]  662 	ld	a, -16 (ix)
   070C DD 77 F5      [19]  663 	ld	-11 (ix), a
   070F DD 7E F1      [19]  664 	ld	a, -15 (ix)
   0712 DD 77 F6      [19]  665 	ld	-10 (ix), a
   0715 DD 56 F2      [19]  666 	ld	d, -14 (ix)
   0718 1E 02         [ 7]  667 	ld	e,#0x02
   071A D5            [11]  668 	push	de
   071B DD 6E F7      [19]  669 	ld	l,-9 (ix)
   071E DD 66 F8      [19]  670 	ld	h,-8 (ix)
   0721 E5            [11]  671 	push	hl
   0722 DD 6E F5      [19]  672 	ld	l,-11 (ix)
   0725 DD 66 F6      [19]  673 	ld	h,-10 (ix)
   0728 E5            [11]  674 	push	hl
   0729 CD BD 0C      [17]  675 	call	_cpct_drawSprite
   072C                     676 00146$:
                            677 ;src/text/text.c:197: if(character == 48 || character == 60 || character == 57) xPos--;
   072C DD 7E AD      [19]  678 	ld	a, -83 (ix)
   072F D6 30         [ 7]  679 	sub	a, #0x30
   0731 28 0E         [12]  680 	jr	Z,00147$
   0733 DD 7E AD      [19]  681 	ld	a, -83 (ix)
   0736 D6 3C         [ 7]  682 	sub	a, #0x3c
   0738 28 07         [12]  683 	jr	Z,00147$
   073A DD 7E AD      [19]  684 	ld	a, -83 (ix)
   073D D6 39         [ 7]  685 	sub	a, #0x39
   073F 20 03         [12]  686 	jr	NZ,00152$
   0741                     687 00147$:
   0741 DD 35 06      [23]  688 	dec	6 (ix)
   0744                     689 00152$:
                            690 ;src/text/text.c:200: character = text[++x];
   0744 DD 34 D7      [23]  691 	inc	-41 (ix)
   0747 DD 7E DC      [19]  692 	ld	a, -36 (ix)
   074A DD 86 D7      [19]  693 	add	a, -41 (ix)
   074D 6F            [ 4]  694 	ld	l, a
   074E DD 7E DD      [19]  695 	ld	a, -35 (ix)
   0751 CE 00         [ 7]  696 	adc	a, #0x00
   0753 67            [ 4]  697 	ld	h, a
   0754 7E            [ 7]  698 	ld	a, (hl)
   0755 DD 77 FD      [19]  699 	ld	-3 (ix), a
                            700 ;src/text/text.c:201: xPos+=FONT2_W;
   0758 DD 34 06      [23]  701 	inc	6 (ix)
   075B DD 34 06      [23]  702 	inc	6 (ix)
   075E C3 56 04      [10]  703 	jp	00159$
   0761                     704 00164$:
   0761 DD F9         [10]  705 	ld	sp, ix
   0763 DD E1         [14]  706 	pop	ix
   0765 C9            [10]  707 	ret
                            708 	.area _CODE
                            709 	.area _INITIALIZER
                            710 	.area _CABS (ABS)
