                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Linux)
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
   0A5A                      51 _sine::
   0A5A DD E5         [15]   52 	push	ix
   0A5C DD 21 00 00   [14]   53 	ld	ix,#0
   0A60 DD 39         [15]   54 	add	ix,sp
                             55 ;src/util/trig.c:16: if (angle < 90) {
   0A62 DD 7E 04      [19]   56 	ld	a, 4 (ix)
   0A65 D6 5A         [ 7]   57 	sub	a, #0x5a
   0A67 DD 7E 05      [19]   58 	ld	a, 5 (ix)
   0A6A 17            [ 4]   59 	rla
   0A6B 3F            [ 4]   60 	ccf
   0A6C 1F            [ 4]   61 	rra
   0A6D DE 80         [ 7]   62 	sbc	a, #0x80
   0A6F 30 11         [12]   63 	jr	NC,00108$
                             64 ;src/util/trig.c:17: return sine_table[angle];
   0A71 01 E6 0A      [10]   65 	ld	bc, #_sine_table+0
   0A74 DD 6E 04      [19]   66 	ld	l,4 (ix)
   0A77 DD 66 05      [19]   67 	ld	h,5 (ix)
   0A7A 29            [11]   68 	add	hl, hl
   0A7B 09            [11]   69 	add	hl, bc
   0A7C 7E            [ 7]   70 	ld	a, (hl)
   0A7D 23            [ 6]   71 	inc	hl
   0A7E 66            [ 7]   72 	ld	h, (hl)
   0A7F 6F            [ 4]   73 	ld	l, a
   0A80 18 61         [12]   74 	jr	00110$
   0A82                      75 00108$:
                             76 ;src/util/trig.c:19: return sine_table[180 - angle];
   0A82 DD 4E 04      [19]   77 	ld	c, 4 (ix)
                             78 ;src/util/trig.c:18: } else if (angle < 180) {
   0A85 DD 7E 04      [19]   79 	ld	a, 4 (ix)
   0A88 D6 B4         [ 7]   80 	sub	a, #0xb4
   0A8A DD 7E 05      [19]   81 	ld	a, 5 (ix)
   0A8D 17            [ 4]   82 	rla
   0A8E 3F            [ 4]   83 	ccf
   0A8F 1F            [ 4]   84 	rra
   0A90 DE 80         [ 7]   85 	sbc	a, #0x80
   0A92 30 12         [12]   86 	jr	NC,00105$
                             87 ;src/util/trig.c:19: return sine_table[180 - angle];
   0A94 11 E6 0A      [10]   88 	ld	de, #_sine_table+0
   0A97 3E B4         [ 7]   89 	ld	a, #0xb4
   0A99 91            [ 4]   90 	sub	a, c
   0A9A 6F            [ 4]   91 	ld	l, a
   0A9B 17            [ 4]   92 	rla
   0A9C 9F            [ 4]   93 	sbc	a, a
   0A9D 67            [ 4]   94 	ld	h, a
   0A9E 29            [11]   95 	add	hl, hl
   0A9F 19            [11]   96 	add	hl, de
   0AA0 4E            [ 7]   97 	ld	c, (hl)
   0AA1 23            [ 6]   98 	inc	hl
   0AA2 66            [ 7]   99 	ld	h, (hl)
   0AA3 69            [ 4]  100 	ld	l, c
   0AA4 18 3D         [12]  101 	jr	00110$
   0AA6                     102 00105$:
                            103 ;src/util/trig.c:20: } else if (angle < 270) {
   0AA6 DD 7E 04      [19]  104 	ld	a, 4 (ix)
   0AA9 D6 0E         [ 7]  105 	sub	a, #0x0e
   0AAB DD 7E 05      [19]  106 	ld	a, 5 (ix)
   0AAE 17            [ 4]  107 	rla
   0AAF 3F            [ 4]  108 	ccf
   0AB0 1F            [ 4]  109 	rra
   0AB1 DE 81         [ 7]  110 	sbc	a, #0x81
   0AB3 30 18         [12]  111 	jr	NC,00102$
                            112 ;src/util/trig.c:21: return -sine_table[angle - 180];
   0AB5 79            [ 4]  113 	ld	a, c
   0AB6 C6 4C         [ 7]  114 	add	a, #0x4c
   0AB8 6F            [ 4]  115 	ld	l, a
   0AB9 17            [ 4]  116 	rla
   0ABA 9F            [ 4]  117 	sbc	a, a
   0ABB 67            [ 4]  118 	ld	h, a
   0ABC 29            [11]  119 	add	hl, hl
   0ABD 11 E6 0A      [10]  120 	ld	de, #_sine_table
   0AC0 19            [11]  121 	add	hl, de
   0AC1 4E            [ 7]  122 	ld	c, (hl)
   0AC2 23            [ 6]  123 	inc	hl
   0AC3 46            [ 7]  124 	ld	b, (hl)
   0AC4 AF            [ 4]  125 	xor	a, a
   0AC5 91            [ 4]  126 	sub	a, c
   0AC6 6F            [ 4]  127 	ld	l, a
   0AC7 3E 00         [ 7]  128 	ld	a, #0x00
   0AC9 98            [ 4]  129 	sbc	a, b
   0ACA 67            [ 4]  130 	ld	h, a
   0ACB 18 16         [12]  131 	jr	00110$
   0ACD                     132 00102$:
                            133 ;src/util/trig.c:23: return -sine_table[360 - angle];
   0ACD 3E 68         [ 7]  134 	ld	a, #0x68
   0ACF 91            [ 4]  135 	sub	a, c
   0AD0 6F            [ 4]  136 	ld	l, a
   0AD1 17            [ 4]  137 	rla
   0AD2 9F            [ 4]  138 	sbc	a, a
   0AD3 67            [ 4]  139 	ld	h, a
   0AD4 29            [11]  140 	add	hl, hl
   0AD5 11 E6 0A      [10]  141 	ld	de, #_sine_table
   0AD8 19            [11]  142 	add	hl, de
   0AD9 4E            [ 7]  143 	ld	c, (hl)
   0ADA 23            [ 6]  144 	inc	hl
   0ADB 46            [ 7]  145 	ld	b, (hl)
   0ADC AF            [ 4]  146 	xor	a, a
   0ADD 91            [ 4]  147 	sub	a, c
   0ADE 6F            [ 4]  148 	ld	l, a
   0ADF 3E 00         [ 7]  149 	ld	a, #0x00
   0AE1 98            [ 4]  150 	sbc	a, b
   0AE2 67            [ 4]  151 	ld	h, a
   0AE3                     152 00110$:
   0AE3 DD E1         [14]  153 	pop	ix
   0AE5 C9            [10]  154 	ret
   0AE6                     155 _sine_table:
   0AE6 00 00               156 	.dw #0x0000
   0AE8 04 00               157 	.dw #0x0004
   0AEA 09 00               158 	.dw #0x0009
   0AEC 0D 00               159 	.dw #0x000d
   0AEE 12 00               160 	.dw #0x0012
   0AF0 16 00               161 	.dw #0x0016
   0AF2 1B 00               162 	.dw #0x001b
   0AF4 1F 00               163 	.dw #0x001f
   0AF6 24 00               164 	.dw #0x0024
   0AF8 28 00               165 	.dw #0x0028
   0AFA 2C 00               166 	.dw #0x002c
   0AFC 31 00               167 	.dw #0x0031
   0AFE 35 00               168 	.dw #0x0035
   0B00 3A 00               169 	.dw #0x003a
   0B02 3E 00               170 	.dw #0x003e
   0B04 42 00               171 	.dw #0x0042
   0B06 47 00               172 	.dw #0x0047
   0B08 4B 00               173 	.dw #0x004b
   0B0A 4F 00               174 	.dw #0x004f
   0B0C 53 00               175 	.dw #0x0053
   0B0E 58 00               176 	.dw #0x0058
   0B10 5C 00               177 	.dw #0x005c
   0B12 60 00               178 	.dw #0x0060
   0B14 64 00               179 	.dw #0x0064
   0B16 68 00               180 	.dw #0x0068
   0B18 6C 00               181 	.dw #0x006c
   0B1A 70 00               182 	.dw #0x0070
   0B1C 74 00               183 	.dw #0x0074
   0B1E 78 00               184 	.dw #0x0078
   0B20 7C 00               185 	.dw #0x007c
   0B22 80 00               186 	.dw #0x0080
   0B24 84 00               187 	.dw #0x0084
   0B26 88 00               188 	.dw #0x0088
   0B28 8B 00               189 	.dw #0x008b
   0B2A 8F 00               190 	.dw #0x008f
   0B2C 93 00               191 	.dw #0x0093
   0B2E 96 00               192 	.dw #0x0096
   0B30 9A 00               193 	.dw #0x009a
   0B32 9E 00               194 	.dw #0x009e
   0B34 A1 00               195 	.dw #0x00a1
   0B36 A5 00               196 	.dw #0x00a5
   0B38 A8 00               197 	.dw #0x00a8
   0B3A AB 00               198 	.dw #0x00ab
   0B3C AF 00               199 	.dw #0x00af
   0B3E B2 00               200 	.dw #0x00b2
   0B40 B5 00               201 	.dw #0x00b5
   0B42 B8 00               202 	.dw #0x00b8
   0B44 BB 00               203 	.dw #0x00bb
   0B46 BE 00               204 	.dw #0x00be
   0B48 C1 00               205 	.dw #0x00c1
   0B4A C4 00               206 	.dw #0x00c4
   0B4C C7 00               207 	.dw #0x00c7
   0B4E CA 00               208 	.dw #0x00ca
   0B50 CC 00               209 	.dw #0x00cc
   0B52 CF 00               210 	.dw #0x00cf
   0B54 D2 00               211 	.dw #0x00d2
   0B56 D4 00               212 	.dw #0x00d4
   0B58 D7 00               213 	.dw #0x00d7
   0B5A D9 00               214 	.dw #0x00d9
   0B5C DB 00               215 	.dw #0x00db
   0B5E DE 00               216 	.dw #0x00de
   0B60 E0 00               217 	.dw #0x00e0
   0B62 E2 00               218 	.dw #0x00e2
   0B64 E4 00               219 	.dw #0x00e4
   0B66 E6 00               220 	.dw #0x00e6
   0B68 E8 00               221 	.dw #0x00e8
   0B6A EA 00               222 	.dw #0x00ea
   0B6C EC 00               223 	.dw #0x00ec
   0B6E ED 00               224 	.dw #0x00ed
   0B70 EF 00               225 	.dw #0x00ef
   0B72 F1 00               226 	.dw #0x00f1
   0B74 F2 00               227 	.dw #0x00f2
   0B76 F3 00               228 	.dw #0x00f3
   0B78 F5 00               229 	.dw #0x00f5
   0B7A F6 00               230 	.dw #0x00f6
   0B7C F7 00               231 	.dw #0x00f7
   0B7E F8 00               232 	.dw #0x00f8
   0B80 F9 00               233 	.dw #0x00f9
   0B82 FA 00               234 	.dw #0x00fa
   0B84 FB 00               235 	.dw #0x00fb
   0B86 FC 00               236 	.dw #0x00fc
   0B88 FD 00               237 	.dw #0x00fd
   0B8A FE 00               238 	.dw #0x00fe
   0B8C FE 00               239 	.dw #0x00fe
   0B8E FF 00               240 	.dw #0x00ff
   0B90 FF 00               241 	.dw #0x00ff
   0B92 FF 00               242 	.dw #0x00ff
   0B94 00 01               243 	.dw #0x0100
   0B96 00 01               244 	.dw #0x0100
   0B98 00 01               245 	.dw #0x0100
   0B9A 00 01               246 	.dw #0x0100
                            247 ;src/util/trig.c:27: i16 cosine(i16 angle) {
                            248 ;	---------------------------------
                            249 ; Function cosine
                            250 ; ---------------------------------
   0B9C                     251 _cosine::
                            252 ;src/util/trig.c:28: if (angle <= 90)
   0B9C 3E 5A         [ 7]  253 	ld	a, #0x5a
   0B9E FD 21 02 00   [14]  254 	ld	iy, #2
   0BA2 FD 39         [15]  255 	add	iy, sp
   0BA4 FD BE 00      [19]  256 	cp	a, 0 (iy)
   0BA7 3E 00         [ 7]  257 	ld	a, #0x00
   0BA9 FD 9E 01      [19]  258 	sbc	a, 1 (iy)
   0BAC E2 B1 0B      [10]  259 	jp	PO, 00110$
   0BAF EE 80         [ 7]  260 	xor	a, #0x80
   0BB1                     261 00110$:
   0BB1 FA C7 0B      [10]  262 	jp	M, 00102$
                            263 ;src/util/trig.c:29: return (sine(90 - angle));
   0BB4 21 02 00      [10]  264 	ld	hl, #2
   0BB7 39            [11]  265 	add	hl, sp
   0BB8 3E 5A         [ 7]  266 	ld	a, #0x5a
   0BBA 96            [ 7]  267 	sub	a, (hl)
   0BBB 4F            [ 4]  268 	ld	c, a
   0BBC 3E 00         [ 7]  269 	ld	a, #0x00
   0BBE 23            [ 6]  270 	inc	hl
   0BBF 9E            [ 7]  271 	sbc	a, (hl)
   0BC0 47            [ 4]  272 	ld	b, a
   0BC1 C5            [11]  273 	push	bc
   0BC2 CD 5A 0A      [17]  274 	call	_sine
   0BC5 F1            [10]  275 	pop	af
   0BC6 C9            [10]  276 	ret
   0BC7                     277 00102$:
                            278 ;src/util/trig.c:31: return (-sine(angle - 90));
   0BC7 FD 21 02 00   [14]  279 	ld	iy, #2
   0BCB FD 39         [15]  280 	add	iy, sp
   0BCD FD 7E 00      [19]  281 	ld	a, 0 (iy)
   0BD0 C6 A6         [ 7]  282 	add	a, #0xa6
   0BD2 4F            [ 4]  283 	ld	c, a
   0BD3 FD 7E 01      [19]  284 	ld	a, 1 (iy)
   0BD6 CE FF         [ 7]  285 	adc	a, #0xff
   0BD8 47            [ 4]  286 	ld	b, a
   0BD9 C5            [11]  287 	push	bc
   0BDA CD 5A 0A      [17]  288 	call	_sine
   0BDD F1            [10]  289 	pop	af
   0BDE AF            [ 4]  290 	xor	a, a
   0BDF 95            [ 4]  291 	sub	a, l
   0BE0 6F            [ 4]  292 	ld	l, a
   0BE1 3E 00         [ 7]  293 	ld	a, #0x00
   0BE3 9C            [ 4]  294 	sbc	a, h
   0BE4 67            [ 4]  295 	ld	h, a
   0BE5 C9            [10]  296 	ret
                            297 ;src/util/trig.c:34: i16 maxi16(i16 a, i16 b){
                            298 ;	---------------------------------
                            299 ; Function maxi16
                            300 ; ---------------------------------
   0BE6                     301 _maxi16::
                            302 ;src/util/trig.c:35: if (a>b)
   0BE6 21 04 00      [10]  303 	ld	hl, #4
   0BE9 39            [11]  304 	add	hl, sp
   0BEA 7E            [ 7]  305 	ld	a, (hl)
   0BEB FD 21 02 00   [14]  306 	ld	iy, #2
   0BEF FD 39         [15]  307 	add	iy, sp
   0BF1 FD 96 00      [19]  308 	sub	a, 0 (iy)
   0BF4 23            [ 6]  309 	inc	hl
   0BF5 7E            [ 7]  310 	ld	a, (hl)
   0BF6 FD 9E 01      [19]  311 	sbc	a, 1 (iy)
   0BF9 E2 FE 0B      [10]  312 	jp	PO, 00110$
   0BFC EE 80         [ 7]  313 	xor	a, #0x80
   0BFE                     314 00110$:
   0BFE F2 06 0C      [10]  315 	jp	P, 00102$
                            316 ;src/util/trig.c:36: return a;
   0C01 C1            [10]  317 	pop	bc
   0C02 E1            [10]  318 	pop	hl
   0C03 E5            [11]  319 	push	hl
   0C04 C5            [11]  320 	push	bc
   0C05 C9            [10]  321 	ret
   0C06                     322 00102$:
                            323 ;src/util/trig.c:38: return b;
   0C06 21 04 00      [10]  324 	ld	hl, #4
   0C09 39            [11]  325 	add	hl, sp
   0C0A 7E            [ 7]  326 	ld	a, (hl)
   0C0B 23            [ 6]  327 	inc	hl
   0C0C 66            [ 7]  328 	ld	h, (hl)
   0C0D 6F            [ 4]  329 	ld	l, a
   0C0E C9            [10]  330 	ret
                            331 ;src/util/trig.c:40: i16 mini16(i16 a, i16 b){
                            332 ;	---------------------------------
                            333 ; Function mini16
                            334 ; ---------------------------------
   0C0F                     335 _mini16::
                            336 ;src/util/trig.c:41: if (a>b)
   0C0F 21 04 00      [10]  337 	ld	hl, #4
   0C12 39            [11]  338 	add	hl, sp
   0C13 7E            [ 7]  339 	ld	a, (hl)
   0C14 FD 21 02 00   [14]  340 	ld	iy, #2
   0C18 FD 39         [15]  341 	add	iy, sp
   0C1A FD 96 00      [19]  342 	sub	a, 0 (iy)
   0C1D 23            [ 6]  343 	inc	hl
   0C1E 7E            [ 7]  344 	ld	a, (hl)
   0C1F FD 9E 01      [19]  345 	sbc	a, 1 (iy)
   0C22 E2 27 0C      [10]  346 	jp	PO, 00110$
   0C25 EE 80         [ 7]  347 	xor	a, #0x80
   0C27                     348 00110$:
   0C27 F2 33 0C      [10]  349 	jp	P, 00102$
                            350 ;src/util/trig.c:42: return b;
   0C2A 21 04 00      [10]  351 	ld	hl, #4
   0C2D 39            [11]  352 	add	hl, sp
   0C2E 7E            [ 7]  353 	ld	a, (hl)
   0C2F 23            [ 6]  354 	inc	hl
   0C30 66            [ 7]  355 	ld	h, (hl)
   0C31 6F            [ 4]  356 	ld	l, a
   0C32 C9            [10]  357 	ret
   0C33                     358 00102$:
                            359 ;src/util/trig.c:44: return a;
   0C33 C1            [10]  360 	pop	bc
   0C34 E1            [10]  361 	pop	hl
   0C35 E5            [11]  362 	push	hl
   0C36 C5            [11]  363 	push	bc
   0C37 C9            [10]  364 	ret
                            365 	.area _CODE
                            366 	.area _INITIALIZER
                            367 	.area _CABS (ABS)
