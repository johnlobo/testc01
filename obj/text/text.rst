                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.6.8 #9946 (Mac OS X x86_64)
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
   07E1                      53 _strLength::
                             54 ;src/text/text.c:60: while (str[result] != '\0') {
   07E1 0E 00         [ 7]   55 	ld	c, #0x00
   07E3                      56 00101$:
   07E3 21 02 00      [10]   57 	ld	hl, #2
   07E6 39            [11]   58 	add	hl, sp
   07E7 7E            [ 7]   59 	ld	a, (hl)
   07E8 23            [ 6]   60 	inc	hl
   07E9 66            [ 7]   61 	ld	h, (hl)
   07EA 6F            [ 4]   62 	ld	l, a
   07EB 06 00         [ 7]   63 	ld	b, #0x00
   07ED 09            [11]   64 	add	hl, bc
   07EE 7E            [ 7]   65 	ld	a, (hl)
   07EF B7            [ 4]   66 	or	a, a
   07F0 28 03         [12]   67 	jr	Z,00103$
                             68 ;src/text/text.c:61: result++;
   07F2 0C            [ 4]   69 	inc	c
   07F3 18 EE         [12]   70 	jr	00101$
   07F5                      71 00103$:
                             72 ;src/text/text.c:63: return result;
   07F5 69            [ 4]   73 	ld	l, c
   07F6 C9            [10]   74 	ret
   07F7                      75 _swapColors:
   07F7 55                   76 	.db #0x55	; 85	'U'
   07F8 EE                   77 	.db #0xee	; 238
   07F9 DD                   78 	.db #0xdd	; 221
   07FA FF                   79 	.db #0xff	; 255
   07FB 14                   80 	.db #0x14	; 20
   07FC 6C                   81 	.db #0x6c	; 108	'l'
   07FD 9C                   82 	.db #0x9c	; 156
   07FE 3C                   83 	.db #0x3c	; 60
   07FF 50                   84 	.db #0x50	; 80	'P'
   0800 E4                   85 	.db #0xe4	; 228
   0801 D8                   86 	.db #0xd8	; 216
   0802 F0                   87 	.db #0xf0	; 240
   0803 11                   88 	.db #0x11	; 17
   0804 66                   89 	.db #0x66	; 102	'f'
   0805 99                   90 	.db #0x99	; 153
   0806 33                   91 	.db #0x33	; 51	'3'
   0807 10                   92 	.db #0x10	; 16
   0808 35                   93 	.db #0x35	; 53	'5'
   0809 3A                   94 	.db #0x3a	; 58
   080A 30                   95 	.db #0x30	; 48	'0'
   080B 45                   96 	.db #0x45	; 69	'E'
   080C CE                   97 	.db #0xce	; 206
   080D CD                   98 	.db #0xcd	; 205
   080E CF                   99 	.db #0xcf	; 207
                            100 ;src/text/text.c:77: void strCopy(u8 source[], u8 dest[]) 
                            101 ;	---------------------------------
                            102 ; Function strCopy
                            103 ; ---------------------------------
   080F                     104 _strCopy::
   080F DD E5         [15]  105 	push	ix
   0811 DD 21 00 00   [14]  106 	ld	ix,#0
   0815 DD 39         [15]  107 	add	ix,sp
                            108 ;src/text/text.c:80: while ((dest[i] = source[i]) != '\0')
   0817 0E 00         [ 7]  109 	ld	c, #0x00
   0819                     110 00101$:
   0819 DD 7E 06      [19]  111 	ld	a, 6 (ix)
   081C 81            [ 4]  112 	add	a, c
   081D 5F            [ 4]  113 	ld	e, a
   081E DD 7E 07      [19]  114 	ld	a, 7 (ix)
   0821 CE 00         [ 7]  115 	adc	a, #0x00
   0823 57            [ 4]  116 	ld	d, a
   0824 DD 6E 04      [19]  117 	ld	l,4 (ix)
   0827 DD 66 05      [19]  118 	ld	h,5 (ix)
   082A 06 00         [ 7]  119 	ld	b, #0x00
   082C 09            [11]  120 	add	hl, bc
   082D 7E            [ 7]  121 	ld	a, (hl)
   082E 12            [ 7]  122 	ld	(de), a
   082F B7            [ 4]  123 	or	a, a
   0830 28 03         [12]  124 	jr	Z,00104$
                            125 ;src/text/text.c:82: i++;
   0832 0C            [ 4]  126 	inc	c
   0833 18 E4         [12]  127 	jr	00101$
   0835                     128 00104$:
   0835 DD E1         [14]  129 	pop	ix
   0837 C9            [10]  130 	ret
                            131 ;src/text/text.c:87: void drawText(const u8 text[], u8 xPos, u8 yPos, u8 color, u8 size, u8 transparent) {
                            132 ;	---------------------------------
                            133 ; Function drawText
                            134 ; ---------------------------------
   0838                     135 _drawText::
   0838 DD E5         [15]  136 	push	ix
   083A DD 21 00 00   [14]  137 	ld	ix,#0
   083E DD 39         [15]  138 	add	ix,sp
   0840 21 AD FF      [10]  139 	ld	hl, #-83
   0843 39            [11]  140 	add	hl, sp
   0844 F9            [ 6]  141 	ld	sp, hl
                            142 ;src/text/text.c:99: color1 = swapColors[color][0];
   0845 01 F7 07      [10]  143 	ld	bc, #_swapColors+0
   0848 DD 6E 08      [19]  144 	ld	l, 8 (ix)
   084B 26 00         [ 7]  145 	ld	h, #0x00
   084D 29            [11]  146 	add	hl, hl
   084E 29            [11]  147 	add	hl, hl
   084F 09            [11]  148 	add	hl, bc
   0850 E5            [11]  149 	push	hl
   0851 FD E1         [14]  150 	pop	iy
   0853 FD 7E 00      [19]  151 	ld	a, 0 (iy)
   0856 DD 77 B1      [19]  152 	ld	-79 (ix), a
                            153 ;src/text/text.c:100: color2 = swapColors[color][1];
   0859 FD E5         [15]  154 	push	iy
   085B E1            [10]  155 	pop	hl
   085C 23            [ 6]  156 	inc	hl
   085D 7E            [ 7]  157 	ld	a, (hl)
   085E DD 77 B2      [19]  158 	ld	-78 (ix), a
                            159 ;src/text/text.c:101: color3 = swapColors[color][2];
   0861 FD E5         [15]  160 	push	iy
   0863 E1            [10]  161 	pop	hl
   0864 23            [ 6]  162 	inc	hl
   0865 23            [ 6]  163 	inc	hl
   0866 7E            [ 7]  164 	ld	a, (hl)
   0867 DD 77 B3      [19]  165 	ld	-77 (ix), a
                            166 ;src/text/text.c:102: color4 = swapColors[color][3];
   086A FD 7E 03      [19]  167 	ld	a, 3 (iy)
   086D DD 77 B4      [19]  168 	ld	-76 (ix), a
                            169 ;src/text/text.c:107: character = text[x];
   0870 DD 7E 04      [19]  170 	ld	a, 4 (ix)
   0873 DD 77 EF      [19]  171 	ld	-17 (ix), a
   0876 DD 7E 05      [19]  172 	ld	a, 5 (ix)
   0879 DD 77 F0      [19]  173 	ld	-16 (ix), a
   087C DD 6E EF      [19]  174 	ld	l,-17 (ix)
   087F DD 66 F0      [19]  175 	ld	h,-16 (ix)
   0882 7E            [ 7]  176 	ld	a, (hl)
   0883 DD 77 FF      [19]  177 	ld	-1 (ix), a
                            178 ;src/text/text.c:109: while (character != '\0') {
   0886 21 08 00      [10]  179 	ld	hl, #0x0008
   0889 39            [11]  180 	add	hl, sp
   088A DD 75 F3      [19]  181 	ld	-13 (ix), l
   088D DD 74 F4      [19]  182 	ld	-12 (ix), h
   0890 DD 7E F3      [19]  183 	ld	a, -13 (ix)
   0893 DD 77 F1      [19]  184 	ld	-15 (ix), a
   0896 DD 7E F4      [19]  185 	ld	a, -12 (ix)
   0899 DD 77 F2      [19]  186 	ld	-14 (ix), a
   089C DD 7E F3      [19]  187 	ld	a, -13 (ix)
   089F DD 77 ED      [19]  188 	ld	-19 (ix), a
   08A2 DD 7E F4      [19]  189 	ld	a, -12 (ix)
   08A5 DD 77 EE      [19]  190 	ld	-18 (ix), a
   08A8 DD 7E F3      [19]  191 	ld	a, -13 (ix)
   08AB DD 77 EB      [19]  192 	ld	-21 (ix), a
   08AE DD 7E F4      [19]  193 	ld	a, -12 (ix)
   08B1 DD 77 EC      [19]  194 	ld	-20 (ix), a
   08B4 DD 7E F3      [19]  195 	ld	a, -13 (ix)
   08B7 DD 77 E9      [19]  196 	ld	-23 (ix), a
   08BA DD 7E F4      [19]  197 	ld	a, -12 (ix)
   08BD DD 77 EA      [19]  198 	ld	-22 (ix), a
   08C0 DD 7E F3      [19]  199 	ld	a, -13 (ix)
   08C3 DD 77 E7      [19]  200 	ld	-25 (ix), a
   08C6 DD 7E F4      [19]  201 	ld	a, -12 (ix)
   08C9 DD 77 E8      [19]  202 	ld	-24 (ix), a
   08CC DD 7E F3      [19]  203 	ld	a, -13 (ix)
   08CF DD 77 E5      [19]  204 	ld	-27 (ix), a
   08D2 DD 7E F4      [19]  205 	ld	a, -12 (ix)
   08D5 DD 77 E6      [19]  206 	ld	-26 (ix), a
   08D8 DD 7E F3      [19]  207 	ld	a, -13 (ix)
   08DB DD 77 F7      [19]  208 	ld	-9 (ix), a
   08DE DD 7E F4      [19]  209 	ld	a, -12 (ix)
   08E1 DD 77 F8      [19]  210 	ld	-8 (ix), a
   08E4 DD 7E F3      [19]  211 	ld	a, -13 (ix)
   08E7 DD 77 F5      [19]  212 	ld	-11 (ix), a
   08EA DD 7E F4      [19]  213 	ld	a, -12 (ix)
   08ED DD 77 F6      [19]  214 	ld	-10 (ix), a
   08F0 DD 7E F3      [19]  215 	ld	a, -13 (ix)
   08F3 DD 77 FD      [19]  216 	ld	-3 (ix), a
   08F6 DD 7E F4      [19]  217 	ld	a, -12 (ix)
   08F9 DD 77 FE      [19]  218 	ld	-2 (ix), a
   08FC DD 7E 09      [19]  219 	ld	a, 9 (ix)
   08FF 3D            [ 4]  220 	dec	a
   0900 20 04         [12]  221 	jr	NZ,00304$
   0902 3E 01         [ 7]  222 	ld	a,#0x01
   0904 18 01         [12]  223 	jr	00305$
   0906                     224 00304$:
   0906 AF            [ 4]  225 	xor	a,a
   0907                     226 00305$:
   0907 DD 77 FC      [19]  227 	ld	-4 (ix), a
   090A DD 7E 09      [19]  228 	ld	a, 9 (ix)
   090D 4F            [ 4]  229 	ld	c, a
   090E 87            [ 4]  230 	add	a, a
   090F 87            [ 4]  231 	add	a, a
   0910 87            [ 4]  232 	add	a, a
   0911 81            [ 4]  233 	add	a, c
   0912 DD 77 FB      [19]  234 	ld	-5 (ix), a
   0915 DD 7E F3      [19]  235 	ld	a, -13 (ix)
   0918 DD 77 F9      [19]  236 	ld	-7 (ix), a
   091B DD 7E F4      [19]  237 	ld	a, -12 (ix)
   091E DD 77 FA      [19]  238 	ld	-6 (ix), a
   0921 DD 7E FB      [19]  239 	ld	a, -5 (ix)
   0924 DD 77 E4      [19]  240 	ld	-28 (ix), a
   0927 DD 7E F3      [19]  241 	ld	a, -13 (ix)
   092A DD 77 E2      [19]  242 	ld	-30 (ix), a
   092D DD 7E F4      [19]  243 	ld	a, -12 (ix)
   0930 DD 77 E3      [19]  244 	ld	-29 (ix), a
   0933 DD 36 AF 00   [19]  245 	ld	-81 (ix), #0x00
   0937                     246 00159$:
   0937 DD 7E FF      [19]  247 	ld	a, -1 (ix)
   093A B7            [ 4]  248 	or	a, a
   093B CA 3D 0C      [10]  249 	jp	Z, 00164$
                            250 ;src/text/text.c:112: if ((character == 33) || ((character>43) && (character<47)) || 
   093E DD 7E FF      [19]  251 	ld	a, -1 (ix)
   0941 D6 21         [ 7]  252 	sub	a, #0x21
   0943 20 04         [12]  253 	jr	NZ,00306$
   0945 3E 01         [ 7]  254 	ld	a,#0x01
   0947 18 01         [12]  255 	jr	00307$
   0949                     256 00306$:
   0949 AF            [ 4]  257 	xor	a,a
   094A                     258 00307$:
   094A 4F            [ 4]  259 	ld	c,a
   094B B7            [ 4]  260 	or	a, a
   094C 20 2C         [12]  261 	jr	NZ,00151$
   094E 3E 2B         [ 7]  262 	ld	a, #0x2b
   0950 DD 96 FF      [19]  263 	sub	a, -1 (ix)
   0953 30 07         [12]  264 	jr	NC,00156$
   0955 DD 7E FF      [19]  265 	ld	a, -1 (ix)
   0958 D6 2F         [ 7]  266 	sub	a, #0x2f
   095A 38 1E         [12]  267 	jr	C,00151$
   095C                     268 00156$:
                            269 ;src/text/text.c:113: ((character>47) && (character<58)) || ((character>62) && (character<91))) { //Allowed characters
   095C 3E 2F         [ 7]  270 	ld	a, #0x2f
   095E DD 96 FF      [19]  271 	sub	a, -1 (ix)
   0961 30 07         [12]  272 	jr	NC,00158$
   0963 DD 7E FF      [19]  273 	ld	a, -1 (ix)
   0966 D6 3A         [ 7]  274 	sub	a, #0x3a
   0968 38 10         [12]  275 	jr	C,00151$
   096A                     276 00158$:
   096A 3E 3E         [ 7]  277 	ld	a, #0x3e
   096C DD 96 FF      [19]  278 	sub	a, -1 (ix)
   096F D2 20 0C      [10]  279 	jp	NC, 00152$
   0972 DD 7E FF      [19]  280 	ld	a, -1 (ix)
   0975 D6 5B         [ 7]  281 	sub	a, #0x5b
   0977 D2 20 0C      [10]  282 	jp	NC, 00152$
   097A                     283 00151$:
                            284 ;src/text/text.c:117: switch(character){
   097A 79            [ 4]  285 	ld	a, c
   097B B7            [ 4]  286 	or	a, a
   097C 20 5D         [12]  287 	jr	NZ,00101$
   097E DD 7E FF      [19]  288 	ld	a, -1 (ix)
   0981 D6 2C         [ 7]  289 	sub	a, #0x2c
   0983 28 5C         [12]  290 	jr	Z,00104$
   0985 DD 7E FF      [19]  291 	ld	a, -1 (ix)
   0988 D6 2D         [ 7]  292 	sub	a, #0x2d
   098A 28 55         [12]  293 	jr	Z,00104$
   098C DD 7E FF      [19]  294 	ld	a, -1 (ix)
   098F D6 2E         [ 7]  295 	sub	a, #0x2e
   0991 28 4E         [12]  296 	jr	Z,00104$
   0993 DD 7E FF      [19]  297 	ld	a, -1 (ix)
   0996 D6 30         [ 7]  298 	sub	a, #0x30
   0998 28 51         [12]  299 	jr	Z,00114$
   099A DD 7E FF      [19]  300 	ld	a, -1 (ix)
   099D D6 31         [ 7]  301 	sub	a, #0x31
   099F 28 4A         [12]  302 	jr	Z,00114$
   09A1 DD 7E FF      [19]  303 	ld	a, -1 (ix)
   09A4 D6 32         [ 7]  304 	sub	a, #0x32
   09A6 28 43         [12]  305 	jr	Z,00114$
   09A8 DD 7E FF      [19]  306 	ld	a, -1 (ix)
   09AB D6 33         [ 7]  307 	sub	a, #0x33
   09AD 28 3C         [12]  308 	jr	Z,00114$
   09AF DD 7E FF      [19]  309 	ld	a, -1 (ix)
   09B2 D6 34         [ 7]  310 	sub	a, #0x34
   09B4 28 35         [12]  311 	jr	Z,00114$
   09B6 DD 7E FF      [19]  312 	ld	a, -1 (ix)
   09B9 D6 35         [ 7]  313 	sub	a, #0x35
   09BB 28 2E         [12]  314 	jr	Z,00114$
   09BD DD 7E FF      [19]  315 	ld	a, -1 (ix)
   09C0 D6 36         [ 7]  316 	sub	a, #0x36
   09C2 28 27         [12]  317 	jr	Z,00114$
   09C4 DD 7E FF      [19]  318 	ld	a, -1 (ix)
   09C7 D6 37         [ 7]  319 	sub	a, #0x37
   09C9 28 20         [12]  320 	jr	Z,00114$
   09CB DD 7E FF      [19]  321 	ld	a, -1 (ix)
   09CE D6 38         [ 7]  322 	sub	a, #0x38
   09D0 28 19         [12]  323 	jr	Z,00114$
   09D2 DD 7E FF      [19]  324 	ld	a, -1 (ix)
   09D5 D6 39         [ 7]  325 	sub	a, #0x39
   09D7 28 12         [12]  326 	jr	Z,00114$
   09D9 18 18         [12]  327 	jr	00115$
                            328 ;src/text/text.c:119: case 33:
   09DB                     329 00101$:
                            330 ;src/text/text.c:120: character=49;
   09DB DD 36 FF 31   [19]  331 	ld	-1 (ix), #0x31
                            332 ;src/text/text.c:121: break;
   09DF 18 12         [12]  333 	jr	00115$
                            334 ;src/text/text.c:126: case 46:
   09E1                     335 00104$:
                            336 ;src/text/text.c:127: character+=6;
   09E1 DD 7E FF      [19]  337 	ld	a, -1 (ix)
   09E4 C6 06         [ 7]  338 	add	a, #0x06
   09E6 DD 77 FF      [19]  339 	ld	-1 (ix), a
                            340 ;src/text/text.c:128: break;
   09E9 18 08         [12]  341 	jr	00115$
                            342 ;src/text/text.c:140: case 57:
   09EB                     343 00114$:
                            344 ;src/text/text.c:141: character+=5;
   09EB DD 7E FF      [19]  345 	ld	a, -1 (ix)
   09EE C6 05         [ 7]  346 	add	a, #0x05
   09F0 DD 77 FF      [19]  347 	ld	-1 (ix), a
                            348 ;src/text/text.c:143: }
   09F3                     349 00115$:
                            350 ;src/text/text.c:146: character-=49;
   09F3 DD 7E FF      [19]  351 	ld	a, -1 (ix)
   09F6 C6 CF         [ 7]  352 	add	a, #0xcf
                            353 ;src/text/text.c:149: for(i=0;i<18;i++){
   09F8 DD 77 D9      [19]  354 	ld	-39 (ix), a
   09FB 4F            [ 4]  355 	ld	c, a
   09FC 06 00         [ 7]  356 	ld	b,#0x00
   09FE 69            [ 4]  357 	ld	l, c
   09FF 60            [ 4]  358 	ld	h, b
   0A00 29            [11]  359 	add	hl, hl
   0A01 29            [11]  360 	add	hl, hl
   0A02 29            [11]  361 	add	hl, hl
   0A03 09            [11]  362 	add	hl, bc
   0A04 29            [11]  363 	add	hl, hl
   0A05 4D            [ 4]  364 	ld	c, l
   0A06 44            [ 4]  365 	ld	b, h
   0A07 DD 36 B0 00   [19]  366 	ld	-80 (ix), #0x00
   0A0B                     367 00162$:
                            368 ;src/text/text.c:150: pChar = (u8*) g_font_chars + (character*18) + i;
   0A0B 21 ED 04      [10]  369 	ld	hl, #_g_font_chars
   0A0E 09            [11]  370 	add	hl, bc
   0A0F DD 5E B0      [19]  371 	ld	e,-80 (ix)
   0A12 16 00         [ 7]  372 	ld	d,#0x00
   0A14 19            [11]  373 	add	hl, de
   0A15 33            [ 6]  374 	inc	sp
   0A16 33            [ 6]  375 	inc	sp
   0A17 E5            [11]  376 	push	hl
                            377 ;src/text/text.c:154: if(*pChar == 0x55) colorchar[i]=color1;
   0A18 E1            [10]  378 	pop	hl
   0A19 E5            [11]  379 	push	hl
   0A1A 5E            [ 7]  380 	ld	e, (hl)
   0A1B 7B            [ 4]  381 	ld	a, e
   0A1C D6 55         [ 7]  382 	sub	a, #0x55
   0A1E 20 04         [12]  383 	jr	NZ,00321$
   0A20 3E 01         [ 7]  384 	ld	a,#0x01
   0A22 18 01         [12]  385 	jr	00322$
   0A24                     386 00321$:
   0A24 AF            [ 4]  387 	xor	a,a
   0A25                     388 00322$:
   0A25 DD 77 E1      [19]  389 	ld	-31 (ix), a
                            390 ;src/text/text.c:155: else if(*pChar == 0xee) colorchar[i]=color2;
   0A28 7B            [ 4]  391 	ld	a, e
   0A29 D6 EE         [ 7]  392 	sub	a, #0xee
   0A2B 20 04         [12]  393 	jr	NZ,00323$
   0A2D 3E 01         [ 7]  394 	ld	a,#0x01
   0A2F 18 01         [12]  395 	jr	00324$
   0A31                     396 00323$:
   0A31 AF            [ 4]  397 	xor	a,a
   0A32                     398 00324$:
   0A32 DD 77 E0      [19]  399 	ld	-32 (ix), a
                            400 ;src/text/text.c:156: else if(*pChar == 0xdd) colorchar[i]=color3;
   0A35 7B            [ 4]  401 	ld	a, e
   0A36 D6 DD         [ 7]  402 	sub	a, #0xdd
   0A38 20 04         [12]  403 	jr	NZ,00325$
   0A3A 3E 01         [ 7]  404 	ld	a,#0x01
   0A3C 18 01         [12]  405 	jr	00326$
   0A3E                     406 00325$:
   0A3E AF            [ 4]  407 	xor	a,a
   0A3F                     408 00326$:
   0A3F DD 77 DF      [19]  409 	ld	-33 (ix), a
                            410 ;src/text/text.c:157: else if(*pChar == 0xff) colorchar[i]=color4;
   0A42 7B            [ 4]  411 	ld	a, e
   0A43 3C            [ 4]  412 	inc	a
   0A44 20 04         [12]  413 	jr	NZ,00327$
   0A46 3E 01         [ 7]  414 	ld	a,#0x01
   0A48 18 01         [12]  415 	jr	00328$
   0A4A                     416 00327$:
   0A4A AF            [ 4]  417 	xor	a,a
   0A4B                     418 00328$:
   0A4B DD 77 DE      [19]  419 	ld	-34 (ix), a
                            420 ;src/text/text.c:152: if(size==1) {
   0A4E DD 7E FC      [19]  421 	ld	a, -4 (ix)
   0A51 B7            [ 4]  422 	or	a, a
   0A52 CA CE 0A      [10]  423 	jp	Z, 00141$
                            424 ;src/text/text.c:154: if(*pChar == 0x55) colorchar[i]=color1;
   0A55 DD 7E E1      [19]  425 	ld	a, -31 (ix)
   0A58 B7            [ 4]  426 	or	a, a
   0A59 28 14         [12]  427 	jr	Z,00126$
   0A5B DD 7E FD      [19]  428 	ld	a, -3 (ix)
   0A5E DD 86 B0      [19]  429 	add	a, -80 (ix)
   0A61 5F            [ 4]  430 	ld	e, a
   0A62 DD 7E FE      [19]  431 	ld	a, -2 (ix)
   0A65 CE 00         [ 7]  432 	adc	a, #0x00
   0A67 57            [ 4]  433 	ld	d, a
   0A68 DD 7E B1      [19]  434 	ld	a, -79 (ix)
   0A6B 12            [ 7]  435 	ld	(de), a
   0A6C C3 A3 0B      [10]  436 	jp	00163$
   0A6F                     437 00126$:
                            438 ;src/text/text.c:155: else if(*pChar == 0xee) colorchar[i]=color2;
   0A6F DD 7E E0      [19]  439 	ld	a, -32 (ix)
   0A72 B7            [ 4]  440 	or	a, a
   0A73 28 14         [12]  441 	jr	Z,00123$
   0A75 DD 7E F5      [19]  442 	ld	a, -11 (ix)
   0A78 DD 86 B0      [19]  443 	add	a, -80 (ix)
   0A7B 5F            [ 4]  444 	ld	e, a
   0A7C DD 7E F6      [19]  445 	ld	a, -10 (ix)
   0A7F CE 00         [ 7]  446 	adc	a, #0x00
   0A81 57            [ 4]  447 	ld	d, a
   0A82 DD 7E B2      [19]  448 	ld	a, -78 (ix)
   0A85 12            [ 7]  449 	ld	(de), a
   0A86 C3 A3 0B      [10]  450 	jp	00163$
   0A89                     451 00123$:
                            452 ;src/text/text.c:156: else if(*pChar == 0xdd) colorchar[i]=color3;
   0A89 DD 7E DF      [19]  453 	ld	a, -33 (ix)
   0A8C B7            [ 4]  454 	or	a, a
   0A8D 28 14         [12]  455 	jr	Z,00120$
   0A8F DD 7E F7      [19]  456 	ld	a, -9 (ix)
   0A92 DD 86 B0      [19]  457 	add	a, -80 (ix)
   0A95 5F            [ 4]  458 	ld	e, a
   0A96 DD 7E F8      [19]  459 	ld	a, -8 (ix)
   0A99 CE 00         [ 7]  460 	adc	a, #0x00
   0A9B 57            [ 4]  461 	ld	d, a
   0A9C DD 7E B3      [19]  462 	ld	a, -77 (ix)
   0A9F 12            [ 7]  463 	ld	(de), a
   0AA0 C3 A3 0B      [10]  464 	jp	00163$
   0AA3                     465 00120$:
                            466 ;src/text/text.c:157: else if(*pChar == 0xff) colorchar[i]=color4;
   0AA3 DD 7E DE      [19]  467 	ld	a, -34 (ix)
   0AA6 B7            [ 4]  468 	or	a, a
   0AA7 28 14         [12]  469 	jr	Z,00117$
   0AA9 DD 7E E5      [19]  470 	ld	a, -27 (ix)
   0AAC DD 86 B0      [19]  471 	add	a, -80 (ix)
   0AAF 5F            [ 4]  472 	ld	e, a
   0AB0 DD 7E E6      [19]  473 	ld	a, -26 (ix)
   0AB3 CE 00         [ 7]  474 	adc	a, #0x00
   0AB5 57            [ 4]  475 	ld	d, a
   0AB6 DD 7E B4      [19]  476 	ld	a, -76 (ix)
   0AB9 12            [ 7]  477 	ld	(de), a
   0ABA C3 A3 0B      [10]  478 	jp	00163$
   0ABD                     479 00117$:
                            480 ;src/text/text.c:158: else colorchar[i]=*pChar;
   0ABD DD 7E E7      [19]  481 	ld	a, -25 (ix)
   0AC0 DD 86 B0      [19]  482 	add	a, -80 (ix)
   0AC3 6F            [ 4]  483 	ld	l, a
   0AC4 DD 7E E8      [19]  484 	ld	a, -24 (ix)
   0AC7 CE 00         [ 7]  485 	adc	a, #0x00
   0AC9 67            [ 4]  486 	ld	h, a
   0ACA 73            [ 7]  487 	ld	(hl), e
   0ACB C3 A3 0B      [10]  488 	jp	00163$
   0ACE                     489 00141$:
                            490 ;src/text/text.c:163: pos=(i*size)-(i%FONT2_W);
   0ACE D5            [11]  491 	push	de
   0ACF C5            [11]  492 	push	bc
   0AD0 DD 5E 09      [19]  493 	ld	e, 9 (ix)
   0AD3 DD 66 B0      [19]  494 	ld	h, -80 (ix)
   0AD6 2E 00         [ 7]  495 	ld	l, #0x00
   0AD8 55            [ 4]  496 	ld	d, l
   0AD9 06 08         [ 7]  497 	ld	b, #0x08
   0ADB                     498 00329$:
   0ADB 29            [11]  499 	add	hl, hl
   0ADC 30 01         [12]  500 	jr	NC,00330$
   0ADE 19            [11]  501 	add	hl, de
   0ADF                     502 00330$:
   0ADF 10 FA         [13]  503 	djnz	00329$
   0AE1 C1            [10]  504 	pop	bc
   0AE2 D1            [10]  505 	pop	de
   0AE3 DD 7E B0      [19]  506 	ld	a, -80 (ix)
   0AE6 E6 01         [ 7]  507 	and	a, #0x01
   0AE8 57            [ 4]  508 	ld	d, a
   0AE9 7D            [ 4]  509 	ld	a, l
   0AEA 92            [ 4]  510 	sub	a, d
   0AEB 6F            [ 4]  511 	ld	l, a
                            512 ;src/text/text.c:167: colorchar[pos+FONT2_W]=color1;
   0AEC 55            [ 4]  513 	ld	d, l
   0AED 14            [ 4]  514 	inc	d
   0AEE 14            [ 4]  515 	inc	d
                            516 ;src/text/text.c:165: if(*pChar == 0x55) {
   0AEF DD 7E E1      [19]  517 	ld	a, -31 (ix)
   0AF2 B7            [ 4]  518 	or	a, a
   0AF3 28 21         [12]  519 	jr	Z,00138$
                            520 ;src/text/text.c:166: colorchar[pos]=color1;
   0AF5 DD 7E E9      [19]  521 	ld	a, -23 (ix)
   0AF8 85            [ 4]  522 	add	a, l
   0AF9 6F            [ 4]  523 	ld	l, a
   0AFA DD 7E EA      [19]  524 	ld	a, -22 (ix)
   0AFD CE 00         [ 7]  525 	adc	a, #0x00
   0AFF 67            [ 4]  526 	ld	h, a
   0B00 DD 7E B1      [19]  527 	ld	a, -79 (ix)
   0B03 77            [ 7]  528 	ld	(hl), a
                            529 ;src/text/text.c:167: colorchar[pos+FONT2_W]=color1;
   0B04 DD 7E E9      [19]  530 	ld	a, -23 (ix)
   0B07 82            [ 4]  531 	add	a, d
   0B08 5F            [ 4]  532 	ld	e, a
   0B09 DD 7E EA      [19]  533 	ld	a, -22 (ix)
   0B0C CE 00         [ 7]  534 	adc	a, #0x00
   0B0E 57            [ 4]  535 	ld	d, a
   0B0F DD 7E B1      [19]  536 	ld	a, -79 (ix)
   0B12 12            [ 7]  537 	ld	(de), a
   0B13 C3 A3 0B      [10]  538 	jp	00163$
   0B16                     539 00138$:
                            540 ;src/text/text.c:169: else if(*pChar == 0xee) {
   0B16 DD 7E E0      [19]  541 	ld	a, -32 (ix)
   0B19 B7            [ 4]  542 	or	a, a
   0B1A 28 20         [12]  543 	jr	Z,00135$
                            544 ;src/text/text.c:170: colorchar[pos]=color2;
   0B1C DD 7E EB      [19]  545 	ld	a, -21 (ix)
   0B1F 85            [ 4]  546 	add	a, l
   0B20 6F            [ 4]  547 	ld	l, a
   0B21 DD 7E EC      [19]  548 	ld	a, -20 (ix)
   0B24 CE 00         [ 7]  549 	adc	a, #0x00
   0B26 67            [ 4]  550 	ld	h, a
   0B27 DD 7E B2      [19]  551 	ld	a, -78 (ix)
   0B2A 77            [ 7]  552 	ld	(hl), a
                            553 ;src/text/text.c:171: colorchar[pos+FONT2_W]=color2;
   0B2B DD 7E EB      [19]  554 	ld	a, -21 (ix)
   0B2E 82            [ 4]  555 	add	a, d
   0B2F 5F            [ 4]  556 	ld	e, a
   0B30 DD 7E EC      [19]  557 	ld	a, -20 (ix)
   0B33 CE 00         [ 7]  558 	adc	a, #0x00
   0B35 57            [ 4]  559 	ld	d, a
   0B36 DD 7E B2      [19]  560 	ld	a, -78 (ix)
   0B39 12            [ 7]  561 	ld	(de), a
   0B3A 18 67         [12]  562 	jr	00163$
   0B3C                     563 00135$:
                            564 ;src/text/text.c:173: else if(*pChar == 0xdd) {
   0B3C DD 7E DF      [19]  565 	ld	a, -33 (ix)
   0B3F B7            [ 4]  566 	or	a, a
   0B40 28 20         [12]  567 	jr	Z,00132$
                            568 ;src/text/text.c:174: colorchar[pos]=color3;
   0B42 DD 7E ED      [19]  569 	ld	a, -19 (ix)
   0B45 85            [ 4]  570 	add	a, l
   0B46 6F            [ 4]  571 	ld	l, a
   0B47 DD 7E EE      [19]  572 	ld	a, -18 (ix)
   0B4A CE 00         [ 7]  573 	adc	a, #0x00
   0B4C 67            [ 4]  574 	ld	h, a
   0B4D DD 7E B3      [19]  575 	ld	a, -77 (ix)
   0B50 77            [ 7]  576 	ld	(hl), a
                            577 ;src/text/text.c:175: colorchar[pos+FONT2_W]=color3;
   0B51 DD 7E ED      [19]  578 	ld	a, -19 (ix)
   0B54 82            [ 4]  579 	add	a, d
   0B55 5F            [ 4]  580 	ld	e, a
   0B56 DD 7E EE      [19]  581 	ld	a, -18 (ix)
   0B59 CE 00         [ 7]  582 	adc	a, #0x00
   0B5B 57            [ 4]  583 	ld	d, a
   0B5C DD 7E B3      [19]  584 	ld	a, -77 (ix)
   0B5F 12            [ 7]  585 	ld	(de), a
   0B60 18 41         [12]  586 	jr	00163$
   0B62                     587 00132$:
                            588 ;src/text/text.c:177: else if(*pChar == 0xff) {
   0B62 DD 7E DE      [19]  589 	ld	a, -34 (ix)
   0B65 B7            [ 4]  590 	or	a, a
   0B66 28 20         [12]  591 	jr	Z,00129$
                            592 ;src/text/text.c:178: colorchar[pos]=color4;
   0B68 DD 7E F1      [19]  593 	ld	a, -15 (ix)
   0B6B 85            [ 4]  594 	add	a, l
   0B6C 6F            [ 4]  595 	ld	l, a
   0B6D DD 7E F2      [19]  596 	ld	a, -14 (ix)
   0B70 CE 00         [ 7]  597 	adc	a, #0x00
   0B72 67            [ 4]  598 	ld	h, a
   0B73 DD 7E B4      [19]  599 	ld	a, -76 (ix)
   0B76 77            [ 7]  600 	ld	(hl), a
                            601 ;src/text/text.c:179: colorchar[pos+FONT2_W]=color4;
   0B77 DD 7E F1      [19]  602 	ld	a, -15 (ix)
   0B7A 82            [ 4]  603 	add	a, d
   0B7B 5F            [ 4]  604 	ld	e, a
   0B7C DD 7E F2      [19]  605 	ld	a, -14 (ix)
   0B7F CE 00         [ 7]  606 	adc	a, #0x00
   0B81 57            [ 4]  607 	ld	d, a
   0B82 DD 7E B4      [19]  608 	ld	a, -76 (ix)
   0B85 12            [ 7]  609 	ld	(de), a
   0B86 18 1B         [12]  610 	jr	00163$
   0B88                     611 00129$:
                            612 ;src/text/text.c:182: colorchar[pos]=*pChar;
   0B88 DD 7E F3      [19]  613 	ld	a, -13 (ix)
   0B8B 85            [ 4]  614 	add	a, l
   0B8C 6F            [ 4]  615 	ld	l, a
   0B8D DD 7E F4      [19]  616 	ld	a, -12 (ix)
   0B90 CE 00         [ 7]  617 	adc	a, #0x00
   0B92 67            [ 4]  618 	ld	h, a
   0B93 73            [ 7]  619 	ld	(hl), e
                            620 ;src/text/text.c:183: colorchar[pos+FONT2_W]=*pChar;
   0B94 DD 7E F3      [19]  621 	ld	a, -13 (ix)
   0B97 82            [ 4]  622 	add	a, d
   0B98 5F            [ 4]  623 	ld	e, a
   0B99 DD 7E F4      [19]  624 	ld	a, -12 (ix)
   0B9C CE 00         [ 7]  625 	adc	a, #0x00
   0B9E 57            [ 4]  626 	ld	d, a
   0B9F E1            [10]  627 	pop	hl
   0BA0 E5            [11]  628 	push	hl
   0BA1 7E            [ 7]  629 	ld	a, (hl)
   0BA2 12            [ 7]  630 	ld	(de), a
   0BA3                     631 00163$:
                            632 ;src/text/text.c:149: for(i=0;i<18;i++){
   0BA3 DD 34 B0      [23]  633 	inc	-80 (ix)
   0BA6 DD 7E B0      [19]  634 	ld	a, -80 (ix)
   0BA9 D6 12         [ 7]  635 	sub	a, #0x12
   0BAB DA 0B 0A      [10]  636 	jp	C, 00162$
                            637 ;src/text/text.c:192: pvideo = cpct_getScreenPtr(CPCT_VMEM_START, xPos, yPos);
   0BAE DD 66 07      [19]  638 	ld	h, 7 (ix)
   0BB1 DD 6E 06      [19]  639 	ld	l, 6 (ix)
   0BB4 E5            [11]  640 	push	hl
   0BB5 21 00 C0      [10]  641 	ld	hl, #0xc000
   0BB8 E5            [11]  642 	push	hl
   0BB9 CD 51 0F      [17]  643 	call	_cpct_getScreenPtr
                            644 ;src/text/text.c:193: if(transparent) cpct_drawSpriteMaskedAlignedTable(colorchar, pvideo, FONT2_W, FONT2_H*size, g_tablatrans);
   0BBC DD 75 DC      [19]  645 	ld	-36 (ix), l
   0BBF DD 74 DD      [19]  646 	ld	-35 (ix), h
   0BC2 DD 7E 0A      [19]  647 	ld	a, 10 (ix)
   0BC5 B7            [ 4]  648 	or	a, a
   0BC6 28 1D         [12]  649 	jr	Z,00145$
   0BC8 11 00 02      [10]  650 	ld	de, #_g_tablatrans
   0BCB DD 4E E2      [19]  651 	ld	c,-30 (ix)
   0BCE DD 46 E3      [19]  652 	ld	b,-29 (ix)
   0BD1 D5            [11]  653 	push	de
   0BD2 DD 56 E4      [19]  654 	ld	d, -28 (ix)
   0BD5 1E 02         [ 7]  655 	ld	e,#0x02
   0BD7 D5            [11]  656 	push	de
   0BD8 DD 6E DC      [19]  657 	ld	l,-36 (ix)
   0BDB DD 66 DD      [19]  658 	ld	h,-35 (ix)
   0BDE E5            [11]  659 	push	hl
   0BDF C5            [11]  660 	push	bc
   0BE0 CD 16 0F      [17]  661 	call	_cpct_drawSpriteMaskedAlignedTable
   0BE3 18 23         [12]  662 	jr	00146$
   0BE5                     663 00145$:
                            664 ;src/text/text.c:194: else cpct_drawSprite (colorchar, pvideo, FONT2_W, FONT2_H*size);
   0BE5 DD 7E F9      [19]  665 	ld	a, -7 (ix)
   0BE8 DD 77 DA      [19]  666 	ld	-38 (ix), a
   0BEB DD 7E FA      [19]  667 	ld	a, -6 (ix)
   0BEE DD 77 DB      [19]  668 	ld	-37 (ix), a
   0BF1 DD 56 FB      [19]  669 	ld	d, -5 (ix)
   0BF4 1E 02         [ 7]  670 	ld	e,#0x02
   0BF6 D5            [11]  671 	push	de
   0BF7 DD 6E DC      [19]  672 	ld	l,-36 (ix)
   0BFA DD 66 DD      [19]  673 	ld	h,-35 (ix)
   0BFD E5            [11]  674 	push	hl
   0BFE DD 6E DA      [19]  675 	ld	l,-38 (ix)
   0C01 DD 66 DB      [19]  676 	ld	h,-37 (ix)
   0C04 E5            [11]  677 	push	hl
   0C05 CD B8 0C      [17]  678 	call	_cpct_drawSprite
   0C08                     679 00146$:
                            680 ;src/text/text.c:197: if(character == 48 || character == 60 || character == 57) xPos--;
   0C08 DD 7E D9      [19]  681 	ld	a, -39 (ix)
   0C0B D6 30         [ 7]  682 	sub	a, #0x30
   0C0D 28 0E         [12]  683 	jr	Z,00147$
   0C0F DD 7E D9      [19]  684 	ld	a, -39 (ix)
   0C12 D6 3C         [ 7]  685 	sub	a, #0x3c
   0C14 28 07         [12]  686 	jr	Z,00147$
   0C16 DD 7E D9      [19]  687 	ld	a, -39 (ix)
   0C19 D6 39         [ 7]  688 	sub	a, #0x39
   0C1B 20 03         [12]  689 	jr	NZ,00152$
   0C1D                     690 00147$:
   0C1D DD 35 06      [23]  691 	dec	6 (ix)
   0C20                     692 00152$:
                            693 ;src/text/text.c:200: character = text[++x];
   0C20 DD 34 AF      [23]  694 	inc	-81 (ix)
   0C23 DD 7E EF      [19]  695 	ld	a, -17 (ix)
   0C26 DD 86 AF      [19]  696 	add	a, -81 (ix)
   0C29 6F            [ 4]  697 	ld	l, a
   0C2A DD 7E F0      [19]  698 	ld	a, -16 (ix)
   0C2D CE 00         [ 7]  699 	adc	a, #0x00
   0C2F 67            [ 4]  700 	ld	h, a
   0C30 7E            [ 7]  701 	ld	a, (hl)
   0C31 DD 77 FF      [19]  702 	ld	-1 (ix), a
                            703 ;src/text/text.c:201: xPos+=FONT2_W;
   0C34 DD 34 06      [23]  704 	inc	6 (ix)
   0C37 DD 34 06      [23]  705 	inc	6 (ix)
   0C3A C3 37 09      [10]  706 	jp	00159$
   0C3D                     707 00164$:
   0C3D DD F9         [10]  708 	ld	sp, ix
   0C3F DD E1         [14]  709 	pop	ix
   0C41 C9            [10]  710 	ret
                            711 	.area _CODE
                            712 	.area _INITIALIZER
                            713 	.area _CABS (ABS)
