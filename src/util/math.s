;;
;; Code from
;; https://chuntey.wordpress.com/category/z80-assembly/
;;
;;
;;

;*************************************
; RESET
;*************************************

.globl _reset_cpc
_reset_cpc::
	call #0000
	ret

;***********************************
; Absolute
; INPUT:
;	HL:	NUMBER
; OUTPUT:
;	HL: Result
; DESTROYS
;	AF, BC, DE, HL
;
; Code from z80 heaven http://z80-heaven.wikidot.com/
;***********************************
.globl _get_abs
_get_abs::
	;; Get Parameters from stack
	ld hl,#2
	add hl,sp
	ld e, (hl)				;get the first digit of the number in e
	inc hl					;advance in the stack
	ld d, (hl)				;get the second digit of the number in d
	ex de, hl				;interchange de and hl, to get the number in hl
absHL:
     bit 7,h				;check last bit of number to get the sign
     ret z					; if positive then return 
     xor a
	 sub l
	 ld l,a
     sbc a,a
	 sub h
	 ld h,a
     ret

;***********************************
; Multiplication
; INPUT:
;	H: 	First factor
;	L:	Second factor
; OUTPUT:
;	HL: Result
; DESTROYS
;	AF, BC, DE, HL
; Code from
; https://chuntey.wordpress.com/category/z80-assembly/
;***********************************
.globl _get_multi
_get_multi::
		;; Get Parameters from stack
		ld hl,#2
		add hl,sp
		ld e, (hl)				;recupero el primer factor
		inc hl					;Avanzo en la pila
		ld d, (hl)				;recupero el segundo factor
		ld h, e					;coloco el primer factor en h que es donode lo necesita la rutina

imul:  ld e,d              ; HL = H * D
       ld a,h              ; make accumulator first multiplier.
       ld hl, #0             ; zeroise total.
       ld d,h              ; zeroise high byte so de=multiplier.
       ld b, #8              ; repeat 8 times.
imul1:  rra                 ; rotate rightmost bit into carry.
       jr nc,imul2         ; wasn't set.
       add hl,de           ; bit was set, so add de.
       and a               ; reset carry.
imul2:  rl e                ; shift de 1 bit left.
       rl d
       djnz imul1          ; repeat 8 times.
       ret
	   
;***********************************
; Division
; INPUT:
;	HL:	Dividend
;	D:	Divisor
; OUTPUT:
;	HL: Result
; DESTROYS
;	AF, BC, DE, HL
;
; Code from
; https://chuntey.wordpress.com/category/z80-assembly/
.globl _get_divi
_get_divi::
	;; Get Parameters from stack
	ld hl,#2
	add hl,sp
	
	ld e, (hl)
	inc hl				
	ld d, (hl)
	inc hl		
	ld c, (hl)
	ex de, hl
	ld d, c
	
	call idiv
	
	ret
 
 ; Divide hl by d and return in hl.

idiv:  xor a               ; HL = HL / D
       ld c,a              ; zeroise c.
       ld e,a              ; zeroise e.
       call idiv4
       push af
       xor a
       ld c,a
       ld d,a
       call idiv4
       pop hl
       ld l,h
       ld h,a
       ret
idiv4: ld b, #8
idiv1: rr d
       rr e
       rr c
       ex af,af'           ; store flag.
       xor a               ; zeroise accumulator.
       cp c                ; is c zero?
       jr z,idiv2          ; yes.
       ex af,af'           ; restore flags.
idiv3: rla                 ; rotate into right of accumulator.
       and a               ; reset carry.
       djnz idiv1          ; repeat 8 times.
       ret
idiv2: ex af,af'
       ld (mtbuff),hl
       sbc hl,de
       ccf
       jr c,idiv3
       ld hl,(mtbuff)
       jp idiv3
	   
;; Divides HL / C	   
;;div:     	ld b,#16
;;       		xor a
;;div_loop:	add hl,hl
;;         	rla
;;         	cp c
;;         	jr c, div_end
;;         	inc l
;;         	sub c
;;div_end: 	djnz div_loop
;;       		ret
        
;***********************************
; Square root
; INPUT:
;	HL:	Number to find the sqrt
; OUTPUT:
;	HL: Result
; DESTROYS
;	AF, BC, DE, HL
;
; Code from
; https://chuntey.wordpress.com/category/z80-assembly/
.globl _get_sqrt
_get_sqrt::
	;; Get Parameters from stack
	ld hl,#2
	add hl,sp
	ld e, (hl)				;recupero el primer factor
	inc hl					;Avanzo en la pila
	ld d, (hl)				;recupero el segundo factor
	ex de, hl
	call isqr				;llamo a la rutina de multiplicación
	ret
     
 isqr:   ld (sqbuf0),hl      ; number for which we want to find square root.
        xor a               ; zeroise accumulator.
        ld (sqbuf2),a       ; result buffer.
        ld a, #128            ; start division with highest bit.
        ld (sqbuf1),a       ; next divisor.
        ld b,#8              ; 8 bits to divide.
 isqr1:  push bc             ; store loop counter.
        ld a,(sqbuf2)       ; current result.
        ld d,a
        ld a,(sqbuf1)       ; next bit to check.
        or d                ; combine with divisor.
        ld d,a              ; store low byte.
        xor a               ; HL = HL / D
        ld c,a              ; zeroise c.
        ld e,a              ; zeroise e.
        push de             ; remember divisor.
        ld hl,(sqbuf0)      ; original number.
        call idiv4          ; divide number by d.
        pop de              ; restore divisor.
        cp d                ; is divisor greater than result?
        jr c,isqr0          ; yes, don't store this bit then.
        ld a,d
        ld (sqbuf2),a       ; store new divisor.
 isqr0: ld hl, #sqbuf1        ; bit we tested.
        and a               ; clear carry flag.
        rr (hl)             ; next bit to right.
        pop bc              ; restore loop counter.
        djnz isqr1          ; repeat
        ld a,(sqbuf2)       ; return result in hl.
        
        pop ix
        
        ret
mtbuff: .dw 0
sqbuf0: .dw 0
sqbuf1: .db 0
sqbuf2: .db 0


;; ;***********************************
;; ; Angulo
;; ;***********************************
;; ; Ship is above the gun so we can employ some basic trigonometry to aim it.
;; ; We need to find the angle and to do this we divide the adjacent by
;; ; the hypotenuse and find the arccosine.
;; ; First of all we put the length of the opposite on the stack:
;; 
;; .globl _get_angle
;; _get_angle::
;;     push ix                ; save ix in the stack
;;     
;;     ld ix,#4                ; move ix to the stack pointer position plus the return address
;; 	add ix,sp
;; 	
;; 	ld a, 0 (ix)				;recupero la coordenada x1
;; 	ld h,a
;; 	ld a, 2 (ix)				;recupero el ancho 1
;; 	add a,h
;; 	ld l,a
;; 	ld a, 4 (ix)				;recupero la coordenada x2
;; 	ld b,a
;; 	ld a,6 (ix)				;recupero el ancho 2
;; 	add a,b
;; 	ld c,a
;; 
;; mgunx:  ld a,(nshipy)       ; ship y coordinate.
;;        ld hl,guny          ; gun y coord.
;;        sub (hl)            ; find difference.
;;        jr nc,mgun0         ; result was positive.
;;        neg                 ; negative, make it positive.
;; mgun0:  cp 5                ; y difference less than 5?
;;        jr c,mgunu          ; yes, point straight up.
;;        push af             ; place length of opposite on stack.
;; 
;; ; Next we require the length of the hypotenuse and we can use good
;; ; old Pythagoras' theorem for this.
;; 
;;        ld h,a              ; copy a to h.
;;        ld d,h              ; copy h to d.
;;        call imul           ; multiply integer parts to get 16-bit result.
;;        push hl             ; remember squared value.
;; 
;;        ld hl,nshipx        ; gun x coordinate.
;;        ld a,(gunx)         ; ship x coordinate.
;;        sub (hl)            ; find difference, will always be positive.
;;        ld h,a              ; put x difference in h.
;;        ld d,h              ; copy h to d.
;;        call imul           ; multiply h by d to get square.
;; 
;;        pop de              ; get last squared result.
;;        add hl,de           ; want the sum of the two.
;;        call isqr           ; find the square root, hypotenuse in a.
;;        pop de              ; opposite line now in d register.
;; 
;;        ld h,a              ; length of hypotenuse.
;;        ld l,#0              ; no fraction or sign.
;;        ex de,hl            ; switch 'em.
;; 
;; ; Opposite and hypotenuse are now in de and hl.
;; ; We now divide the first by the second and find the arcsine.
;; ; Remember - sine = opposite over hypotenuse.
;; 
;;        call div            ; division will give us the sine.
;;        ex de,hl            ; want result in de.
;;        call asn            ; get arcsine to find the angle.
;;        push af
;; 
;; ; Okay, we have the angle but it's only 0 to half-pi radians (64 angles)
;; ; so we need to make an adjustment based upon the quarter of the circle.
;; ; We can establish which quarter of the circle our angle lies in by
;; ; examining the differences between the ship and gun coordinates.
;; 
;;        ld a,(guny)         ; gun y position.
;;        ld hl,shipy         ; ship y.
;;        cp (hl)             ; is ship to the right?
;;        jr nc,mgun2         ; player to the left, angle in second quarter.
;; 
;; ; Angle to play is in first quarter, so it needs subtracting from 64.
;; 
;;        ld a,#64             ; pi/2 radians = 64 angles.
;;        pop bc              ; angle in b.
;;        sub b               ; do the subtraction.
;;        ld (ix+1),a         ; new angle.
;;        
;;        pop ix              ; recover ix from the stack
;;        ret                 ; we have our angle.
;; 
;; ; Second quarter - add literal 64 to our angle.
;; 
;; mgun2:  pop af              ; original angle.
;;        add a,192           ; add pi/2 radians.
;;        ld (ix+1),a         ; new angle.
;;        ret                 ; job's a good 'un!
;; 
;; 

;***********************************
; Sine
; INPUT:
;	A:	ANGLE
; OUTPUT:
;	DE: Result
; DESTROYS
;	AF, BC, DE, HL
;
; Code from
; https://chuntey.wordpress.com/category/z80-assembly/
;***********************************
.globl _get_sin
_get_sin::
	;; Get Parameters from stack
	ld hl,#2
	add hl,sp
	ld a, (hl)				;get the angle in accumulator
	jr sine					;jump to the sin function

;***********************************
; Cosine
; INPUT:
;	A:	ANGLE
; OUTPUT:
;	DE: Result
; DESTROYS
;	AF, BC, DE, HL
;
; Code from
; https://chuntey.wordpress.com/category/z80-assembly/
;***********************************
.globl _get_cos
_get_cos::
	;; Get Parameters from stack
	ld hl,#2
	add hl,sp
	ld a, (hl)				;get the angle in accumulator

 ;***********************************
 ; Cosine
 ;***********************************
 ; Get cosine of angle passed in the accumulator, and return in de pair.
 
 cos:    add a, #64            ; DE = cosine A.
 ;***********************************
 ; Sine
 ;***********************************
 ; Find sine of angle in accumulator, return in de registers.
 
 sin:   ld hl, #sine        ; DE = sine A.
        ld d,#0             ; zeroise high byte.
        and a               ; clear carry flag.
        rla                 ; multiply accumulator by 2.
        rl d                ; shift top bit into high byte.
        ld e,a              ; put remainder in low byte.
        add hl,de           ; add displacement to start of table.
        ld e,(hl)           ; get low value of sine value.
        inc hl              ; njext byte along.
        ld d,(hl)           ; fetch high byte.
        ret
;; 
;; ;***********************************
;; ; ArcSine
;; ;***********************************
;; ; Search sine table for arcsine of de and return angle in a.
;; ; Passing a negative sine may slightly reduce accuracy.
;; 
;; asn:    ld hl,arcsin-1      ; sine table.
;;        ld (mtbuff),hl      ; current sine.
;;        xor a               ; default angle = 0.
;; asn1:   ex af,af'           ; store in alternate accumulator.
;;        ld hl,(mtbuff)      ; current sine.
;;        ld b,(hl)           ; positive sine value now in bc.
;;        dec hl              ; move pointer along.
;;        ld c,(hl)           ; high byte byte.
;;        dec hl              ; move pointer along.
;;        ld (mtbuff),hl      ; store sine pointer.
;;        ex de,hl            ; put original sine in hl.
;;        push hl             ; store original sine.
;;        sbc hl,bc           ; compare two values.
;;        pop de              ; original sine back in de.
;;        jr c,asn0           ; table is higher, found our match.
;;        jr z,asn0           ; values identical, found our match.
;;        ex af,af'           ; angle.
;;        inc a               ; next angle.
;;        jp asn1             ; keep looking.
;; asn0:   ex af,af'           ; restore angle.
;;        neg                 ; negate result.
;;        add a,#64            ; effectively subtract from 64.
;;        ret
;; 
;; 


sine:		
		cp #64
		jp c, get_sine_from_table
		cp #128
		jp c, minus_180
		cp #192
		jp c, minus_270

minus_180:	
		ld d, a
		ld a, 180
		sub d
		jr get_sine_from_table

minus_270:	ld d, a
		ld a, 180
		sub d
		call get_sine_from_table
		set 7, d
		ret

get_sine_from_table:	
		ld hl, sine_table   ; DE = sine A.
        ld d,#0             ; zeroise high byte.
		and a               ; clear carry flag.
        rla                 ; multiply accumulator by 2.
        rl d                ; shift top bit into high byte.
        ld e,a              ; put remainder in low byte.
        add hl,de           ; add displacement to start of table.
        ld e,(hl)           ; get low value of sine value.
        inc hl              ; njext byte along.
        ld d,(hl)           ; fetch high byte.
        ret

sine_table:
	dw   0,   4,   9,  13,  18,  22,  27,  31,  36,  40,  44
	dw  49,  53,  58,  62,  66,  71,  75,  79,  83,  88
	dw  92,  96, 100, 104, 108, 112, 116, 120, 124, 128
	dw 132, 136, 139, 143, 147, 150, 154, 158, 161, 165
	dw 168, 171, 175, 178, 181, 184, 187, 190, 193, 196
	dw 199, 202, 204, 207, 210, 212, 215, 217, 219, 222
	dw 224, 226, 228, 230, 232, 234, 236, 237, 239, 241
	dw 242, 243, 245, 246, 247, 248, 249, 250, 251, 252
	dw 253, 254, 254, 255, 255, 255, 256, 256, 256, 256