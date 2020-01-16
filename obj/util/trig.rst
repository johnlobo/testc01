                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Mac OS X x86_64)
                              4 ;--------------------------------------------------------
                              5 	.module trig
                              6 	.optsdcc -mz80
                              7 	
                              8 ;--------------------------------------------------------
                              9 ; Public variables in this module
                             10 ;--------------------------------------------------------
                             11 	.globl _mini16
                             12 	.globl _maxi16
                             13 	.globl _cosine
                             14 	.globl _sine
                             15 	.globl _sine_table
                             16 ;--------------------------------------------------------
                             17 ; special function registers
                             18 ;--------------------------------------------------------
                             19 ;--------------------------------------------------------
                             20 ; ram data
                             21 ;--------------------------------------------------------
                             22 	.area _DATA
                             23 ;--------------------------------------------------------
                             24 ; ram data
                             25 ;--------------------------------------------------------
                             26 	.area _INITIALIZED
                             27 ;--------------------------------------------------------
                             28 ; absolute external ram data
                             29 ;--------------------------------------------------------
                             30 	.area _DABS (ABS)
                             31 ;--------------------------------------------------------
                             32 ; global & static initialisations
                             33 ;--------------------------------------------------------
                             34 	.area _HOME
                             35 	.area _GSINIT
                             36 	.area _GSFINAL
                             37 	.area _GSINIT
                             38 ;--------------------------------------------------------
                             39 ; Home
                             40 ;--------------------------------------------------------
                             41 	.area _HOME
                             42 	.area _HOME
                             43 ;--------------------------------------------------------
                             44 ; code
                             45 ;--------------------------------------------------------
                             46 	.area _CODE
                             47 ;src/util/trig.c:15: i16 sine(i16 angle) {
                             48 ;	---------------------------------
                             49 ; Function sine
                             50 ; ---------------------------------
   0300                      51 _sine::
   0300 DD E5         [15]   52 	push	ix
   0302 DD 21 00 00   [14]   53 	ld	ix,#0
   0306 DD 39         [15]   54 	add	ix,sp
                             55 ;src/util/trig.c:16: if (angle < 90) {
   0308 DD 7E 04      [19]   56 	ld	a, 4 (ix)
   030B D6 5A         [ 7]   57 	sub	a, #0x5a
   030D DD 7E 05      [19]   58 	ld	a, 5 (ix)
   0310 17            [ 4]   59 	rla
   0311 3F            [ 4]   60 	ccf
   0312 1F            [ 4]   61 	rra
   0313 DE 80         [ 7]   62 	sbc	a, #0x80
   0315 30 11         [12]   63 	jr	NC,00108$
                             64 ;src/util/trig.c:17: return sine_table[angle];
   0317 01 8C 03      [10]   65 	ld	bc, #_sine_table+0
   031A DD 6E 04      [19]   66 	ld	l,4 (ix)
   031D DD 66 05      [19]   67 	ld	h,5 (ix)
   0320 29            [11]   68 	add	hl, hl
   0321 09            [11]   69 	add	hl, bc
   0322 7E            [ 7]   70 	ld	a, (hl)
   0323 23            [ 6]   71 	inc	hl
   0324 66            [ 7]   72 	ld	h, (hl)
   0325 6F            [ 4]   73 	ld	l, a
   0326 18 61         [12]   74 	jr	00110$
   0328                      75 00108$:
                             76 ;src/util/trig.c:19: return sine_table[180 - angle];
   0328 DD 4E 04      [19]   77 	ld	c, 4 (ix)
                             78 ;src/util/trig.c:18: } else if (angle < 180) {
   032B DD 7E 04      [19]   79 	ld	a, 4 (ix)
   032E D6 B4         [ 7]   80 	sub	a, #0xb4
   0330 DD 7E 05      [19]   81 	ld	a, 5 (ix)
   0333 17            [ 4]   82 	rla
   0334 3F            [ 4]   83 	ccf
   0335 1F            [ 4]   84 	rra
   0336 DE 80         [ 7]   85 	sbc	a, #0x80
   0338 30 12         [12]   86 	jr	NC,00105$
                             87 ;src/util/trig.c:19: return sine_table[180 - angle];
   033A 11 8C 03      [10]   88 	ld	de, #_sine_table+0
   033D 3E B4         [ 7]   89 	ld	a, #0xb4
   033F 91            [ 4]   90 	sub	a, c
   0340 6F            [ 4]   91 	ld	l, a
   0341 17            [ 4]   92 	rla
   0342 9F            [ 4]   93 	sbc	a, a
   0343 67            [ 4]   94 	ld	h, a
   0344 29            [11]   95 	add	hl, hl
   0345 19            [11]   96 	add	hl, de
   0346 4E            [ 7]   97 	ld	c, (hl)
   0347 23            [ 6]   98 	inc	hl
   0348 66            [ 7]   99 	ld	h, (hl)
   0349 69            [ 4]  100 	ld	l, c
   034A 18 3D         [12]  101 	jr	00110$
   034C                     102 00105$:
                            103 ;src/util/trig.c:20: } else if (angle < 270) {
   034C DD 7E 04      [19]  104 	ld	a, 4 (ix)
   034F D6 0E         [ 7]  105 	sub	a, #0x0e
   0351 DD 7E 05      [19]  106 	ld	a, 5 (ix)
   0354 17            [ 4]  107 	rla
   0355 3F            [ 4]  108 	ccf
   0356 1F            [ 4]  109 	rra
   0357 DE 81         [ 7]  110 	sbc	a, #0x81
   0359 30 18         [12]  111 	jr	NC,00102$
                            112 ;src/util/trig.c:21: return -sine_table[angle - 180];
   035B 79            [ 4]  113 	ld	a, c
   035C C6 4C         [ 7]  114 	add	a, #0x4c
   035E 6F            [ 4]  115 	ld	l, a
   035F 17            [ 4]  116 	rla
   0360 9F            [ 4]  117 	sbc	a, a
   0361 67            [ 4]  118 	ld	h, a
   0362 29            [11]  119 	add	hl, hl
   0363 11 8C 03      [10]  120 	ld	de, #_sine_table
   0366 19            [11]  121 	add	hl, de
   0367 4E            [ 7]  122 	ld	c, (hl)
   0368 23            [ 6]  123 	inc	hl
   0369 46            [ 7]  124 	ld	b, (hl)
   036A AF            [ 4]  125 	xor	a, a
   036B 91            [ 4]  126 	sub	a, c
   036C 6F            [ 4]  127 	ld	l, a
   036D 3E 00         [ 7]  128 	ld	a, #0x00
   036F 98            [ 4]  129 	sbc	a, b
   0370 67            [ 4]  130 	ld	h, a
   0371 18 16         [12]  131 	jr	00110$
   0373                     132 00102$:
                            133 ;src/util/trig.c:23: return -sine_table[360 - angle];
   0373 3E 68         [ 7]  134 	ld	a, #0x68
   0375 91            [ 4]  135 	sub	a, c
   0376 6F            [ 4]  136 	ld	l, a
   0377 17            [ 4]  137 	rla
   0378 9F            [ 4]  138 	sbc	a, a
   0379 67            [ 4]  139 	ld	h, a
   037A 29            [11]  140 	add	hl, hl
   037B 11 8C 03      [10]  141 	ld	de, #_sine_table
   037E 19            [11]  142 	add	hl, de
   037F 4E            [ 7]  143 	ld	c, (hl)
   0380 23            [ 6]  144 	inc	hl
   0381 46            [ 7]  145 	ld	b, (hl)
   0382 AF            [ 4]  146 	xor	a, a
   0383 91            [ 4]  147 	sub	a, c
   0384 6F            [ 4]  148 	ld	l, a
   0385 3E 00         [ 7]  149 	ld	a, #0x00
   0387 98            [ 4]  150 	sbc	a, b
   0388 67            [ 4]  151 	ld	h, a
   0389                     152 00110$:
   0389 DD E1         [14]  153 	pop	ix
   038B C9            [10]  154 	ret
   038C                     155 _sine_table:
   038C 00 00               156 	.dw #0x0000
   038E 04 00               157 	.dw #0x0004
   0390 09 00               158 	.dw #0x0009
   0392 0D 00               159 	.dw #0x000d
   0394 12 00               160 	.dw #0x0012
   0396 16 00               161 	.dw #0x0016
   0398 1B 00               162 	.dw #0x001b
   039A 1F 00               163 	.dw #0x001f
   039C 24 00               164 	.dw #0x0024
   039E 28 00               165 	.dw #0x0028
   03A0 2C 00               166 	.dw #0x002c
   03A2 31 00               167 	.dw #0x0031
   03A4 35 00               168 	.dw #0x0035
   03A6 3A 00               169 	.dw #0x003a
   03A8 3E 00               170 	.dw #0x003e
   03AA 42 00               171 	.dw #0x0042
   03AC 47 00               172 	.dw #0x0047
   03AE 4B 00               173 	.dw #0x004b
   03B0 4F 00               174 	.dw #0x004f
   03B2 53 00               175 	.dw #0x0053
   03B4 58 00               176 	.dw #0x0058
   03B6 5C 00               177 	.dw #0x005c
   03B8 60 00               178 	.dw #0x0060
   03BA 64 00               179 	.dw #0x0064
   03BC 68 00               180 	.dw #0x0068
   03BE 6C 00               181 	.dw #0x006c
   03C0 70 00               182 	.dw #0x0070
   03C2 74 00               183 	.dw #0x0074
   03C4 78 00               184 	.dw #0x0078
   03C6 7C 00               185 	.dw #0x007c
   03C8 80 00               186 	.dw #0x0080
   03CA 84 00               187 	.dw #0x0084
   03CC 88 00               188 	.dw #0x0088
   03CE 8B 00               189 	.dw #0x008b
   03D0 8F 00               190 	.dw #0x008f
   03D2 93 00               191 	.dw #0x0093
   03D4 96 00               192 	.dw #0x0096
   03D6 9A 00               193 	.dw #0x009a
   03D8 9E 00               194 	.dw #0x009e
   03DA A1 00               195 	.dw #0x00a1
   03DC A5 00               196 	.dw #0x00a5
   03DE A8 00               197 	.dw #0x00a8
   03E0 AB 00               198 	.dw #0x00ab
   03E2 AF 00               199 	.dw #0x00af
   03E4 B2 00               200 	.dw #0x00b2
   03E6 B5 00               201 	.dw #0x00b5
   03E8 B8 00               202 	.dw #0x00b8
   03EA BB 00               203 	.dw #0x00bb
   03EC BE 00               204 	.dw #0x00be
   03EE C1 00               205 	.dw #0x00c1
   03F0 C4 00               206 	.dw #0x00c4
   03F2 C7 00               207 	.dw #0x00c7
   03F4 CA 00               208 	.dw #0x00ca
   03F6 CC 00               209 	.dw #0x00cc
   03F8 CF 00               210 	.dw #0x00cf
   03FA D2 00               211 	.dw #0x00d2
   03FC D4 00               212 	.dw #0x00d4
   03FE D7 00               213 	.dw #0x00d7
   0400 D9 00               214 	.dw #0x00d9
   0402 DB 00               215 	.dw #0x00db
   0404 DE 00               216 	.dw #0x00de
   0406 E0 00               217 	.dw #0x00e0
   0408 E2 00               218 	.dw #0x00e2
   040A E4 00               219 	.dw #0x00e4
   040C E6 00               220 	.dw #0x00e6
   040E E8 00               221 	.dw #0x00e8
   0410 EA 00               222 	.dw #0x00ea
   0412 EC 00               223 	.dw #0x00ec
   0414 ED 00               224 	.dw #0x00ed
   0416 EF 00               225 	.dw #0x00ef
   0418 F1 00               226 	.dw #0x00f1
   041A F2 00               227 	.dw #0x00f2
   041C F3 00               228 	.dw #0x00f3
   041E F5 00               229 	.dw #0x00f5
   0420 F6 00               230 	.dw #0x00f6
   0422 F7 00               231 	.dw #0x00f7
   0424 F8 00               232 	.dw #0x00f8
   0426 F9 00               233 	.dw #0x00f9
   0428 FA 00               234 	.dw #0x00fa
   042A FB 00               235 	.dw #0x00fb
   042C FC 00               236 	.dw #0x00fc
   042E FD 00               237 	.dw #0x00fd
   0430 FE 00               238 	.dw #0x00fe
   0432 FE 00               239 	.dw #0x00fe
   0434 FF 00               240 	.dw #0x00ff
   0436 FF 00               241 	.dw #0x00ff
   0438 FF 00               242 	.dw #0x00ff
   043A 00 01               243 	.dw #0x0100
   043C 00 01               244 	.dw #0x0100
   043E 00 01               245 	.dw #0x0100
   0440 00 01               246 	.dw #0x0100
                            247 ;src/util/trig.c:27: i16 cosine(i16 angle) {
                            248 ;	---------------------------------
                            249 ; Function cosine
                            250 ; ---------------------------------
   0442                     251 _cosine::
                            252 ;src/util/trig.c:28: if (angle <= 90)
   0442 3E 5A         [ 7]  253 	ld	a, #0x5a
   0444 FD 21 02 00   [14]  254 	ld	iy, #2
   0448 FD 39         [15]  255 	add	iy, sp
   044A FD BE 00      [19]  256 	cp	a, 0 (iy)
   044D 3E 00         [ 7]  257 	ld	a, #0x00
   044F FD 9E 01      [19]  258 	sbc	a, 1 (iy)
   0452 E2 57 04      [10]  259 	jp	PO, 00110$
   0455 EE 80         [ 7]  260 	xor	a, #0x80
   0457                     261 00110$:
   0457 FA 6D 04      [10]  262 	jp	M, 00102$
                            263 ;src/util/trig.c:29: return (sine(90 - angle));
   045A 21 02 00      [10]  264 	ld	hl, #2
   045D 39            [11]  265 	add	hl, sp
   045E 3E 5A         [ 7]  266 	ld	a, #0x5a
   0460 96            [ 7]  267 	sub	a, (hl)
   0461 4F            [ 4]  268 	ld	c, a
   0462 3E 00         [ 7]  269 	ld	a, #0x00
   0464 23            [ 6]  270 	inc	hl
   0465 9E            [ 7]  271 	sbc	a, (hl)
   0466 47            [ 4]  272 	ld	b, a
   0467 C5            [11]  273 	push	bc
   0468 CD 00 03      [17]  274 	call	_sine
   046B F1            [10]  275 	pop	af
   046C C9            [10]  276 	ret
   046D                     277 00102$:
                            278 ;src/util/trig.c:31: return (-sine(angle - 90));
   046D FD 21 02 00   [14]  279 	ld	iy, #2
   0471 FD 39         [15]  280 	add	iy, sp
   0473 FD 7E 00      [19]  281 	ld	a, 0 (iy)
   0476 C6 A6         [ 7]  282 	add	a, #0xa6
   0478 4F            [ 4]  283 	ld	c, a
   0479 FD 7E 01      [19]  284 	ld	a, 1 (iy)
   047C CE FF         [ 7]  285 	adc	a, #0xff
   047E 47            [ 4]  286 	ld	b, a
   047F C5            [11]  287 	push	bc
   0480 CD 00 03      [17]  288 	call	_sine
   0483 F1            [10]  289 	pop	af
   0484 AF            [ 4]  290 	xor	a, a
   0485 95            [ 4]  291 	sub	a, l
   0486 6F            [ 4]  292 	ld	l, a
   0487 3E 00         [ 7]  293 	ld	a, #0x00
   0489 9C            [ 4]  294 	sbc	a, h
   048A 67            [ 4]  295 	ld	h, a
   048B C9            [10]  296 	ret
                            297 ;src/util/trig.c:34: i16 maxi16(i16 a, i16 b){
                            298 ;	---------------------------------
                            299 ; Function maxi16
                            300 ; ---------------------------------
   048C                     301 _maxi16::
                            302 ;src/util/trig.c:35: if (a>b)
   048C 21 04 00      [10]  303 	ld	hl, #4
   048F 39            [11]  304 	add	hl, sp
   0490 7E            [ 7]  305 	ld	a, (hl)
   0491 FD 21 02 00   [14]  306 	ld	iy, #2
   0495 FD 39         [15]  307 	add	iy, sp
   0497 FD 96 00      [19]  308 	sub	a, 0 (iy)
   049A 23            [ 6]  309 	inc	hl
   049B 7E            [ 7]  310 	ld	a, (hl)
   049C FD 9E 01      [19]  311 	sbc	a, 1 (iy)
   049F E2 A4 04      [10]  312 	jp	PO, 00110$
   04A2 EE 80         [ 7]  313 	xor	a, #0x80
   04A4                     314 00110$:
   04A4 F2 AC 04      [10]  315 	jp	P, 00102$
                            316 ;src/util/trig.c:36: return a;
   04A7 C1            [10]  317 	pop	bc
   04A8 E1            [10]  318 	pop	hl
   04A9 E5            [11]  319 	push	hl
   04AA C5            [11]  320 	push	bc
   04AB C9            [10]  321 	ret
   04AC                     322 00102$:
                            323 ;src/util/trig.c:38: return b;
   04AC 21 04 00      [10]  324 	ld	hl, #4
   04AF 39            [11]  325 	add	hl, sp
   04B0 7E            [ 7]  326 	ld	a, (hl)
   04B1 23            [ 6]  327 	inc	hl
   04B2 66            [ 7]  328 	ld	h, (hl)
   04B3 6F            [ 4]  329 	ld	l, a
   04B4 C9            [10]  330 	ret
                            331 ;src/util/trig.c:40: i16 mini16(i16 a, i16 b){
                            332 ;	---------------------------------
                            333 ; Function mini16
                            334 ; ---------------------------------
   04B5                     335 _mini16::
                            336 ;src/util/trig.c:41: if (a>b)
   04B5 21 04 00      [10]  337 	ld	hl, #4
   04B8 39            [11]  338 	add	hl, sp
   04B9 7E            [ 7]  339 	ld	a, (hl)
   04BA FD 21 02 00   [14]  340 	ld	iy, #2
   04BE FD 39         [15]  341 	add	iy, sp
   04C0 FD 96 00      [19]  342 	sub	a, 0 (iy)
   04C3 23            [ 6]  343 	inc	hl
   04C4 7E            [ 7]  344 	ld	a, (hl)
   04C5 FD 9E 01      [19]  345 	sbc	a, 1 (iy)
   04C8 E2 CD 04      [10]  346 	jp	PO, 00110$
   04CB EE 80         [ 7]  347 	xor	a, #0x80
   04CD                     348 00110$:
   04CD F2 D9 04      [10]  349 	jp	P, 00102$
                            350 ;src/util/trig.c:42: return b;
   04D0 21 04 00      [10]  351 	ld	hl, #4
   04D3 39            [11]  352 	add	hl, sp
   04D4 7E            [ 7]  353 	ld	a, (hl)
   04D5 23            [ 6]  354 	inc	hl
   04D6 66            [ 7]  355 	ld	h, (hl)
   04D7 6F            [ 4]  356 	ld	l, a
   04D8 C9            [10]  357 	ret
   04D9                     358 00102$:
                            359 ;src/util/trig.c:44: return a;
   04D9 C1            [10]  360 	pop	bc
   04DA E1            [10]  361 	pop	hl
   04DB E5            [11]  362 	push	hl
   04DC C5            [11]  363 	push	bc
   04DD C9            [10]  364 	ret
                            365 	.area _CODE
                            366 	.area _INITIALIZER
                            367 	.area _CABS (ABS)
