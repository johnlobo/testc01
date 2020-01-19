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
; Multiplication
;***********************************
.globl _get_multi
_get_multi::
	;; Get Parameters from stack
   	;;pop  af   	;; [3] AF = Return Address
   	;;pop  hl   	;; [3] H = first multiplier, L = second multiplier
   	;;push af   	;; [4] Put returning address in the stack again as this function uses __z88dk_callee convention
	;;ld d,l		;; Set d as second multiplier
	
	ld ix,#2
	add ix,sp
	
	ld h,0 (ix)				;recupero la coordenada x1
	ld d,1 (ix)				;recupero la coordenada x1
	
	call imul
	
	ret

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
 ;***********************************
.globl _get_divi
_get_divi::
	;; Get Parameters from stack
   ;;	pop af   	;; [3] AF = Return Address
   ;;	pop hl   	;; [3] HL = Dividend
	;;pop bc		;; [3] DE = Divisor
   ;;	push af   	;; [4] Put returning address in the stack again as this function uses __z88dk_callee convention
	;;ld d,e		;; Set d as divisor
	
	push af
	push bc
	push ix
	
	ld ix,#2
	add ix,sp
	
	ld l,0 (ix)				;recupero la coordenada x1
	ld h,1 (ix)				;recupero la coordenada x1
	ld a,2 (ix)				;recupero el ancho 1
	ld c,a
	
	call div
	
	pop ix
	pop bc
	pop af
	
	ret
 
 ; Divide hl by d and return in hl.

;;idiv:   xor a               ; HL = HL / D
;;       ld c,a              ; zeroise c.
;;       ld e,a              ; zeroise e.
;;       call idiv4
;;       push af
;;       xor a
;;       ld c,a
;;       ld d,a
;;       call idiv4
;;       pop hl
;;       ld l,h
;;       ld h,a
;;       ret
;;idiv4:  ld b, #8
;;idiv1:  rr d
;;       rr e
;;       rr c
;;       ex af,af'           ; store flag.
;;       xor a               ; zeroise accumulator.
;;       cp c                ; is c zero?
;;       jr z,idiv2          ; yes.
;;       ex af,af'           ; restore flags.
;;idiv3:  rla                 ; rotate into right of accumulator.
;;       and a               ; reset carry.
;;       djnz idiv1          ; repeat 8 times.
;;       ret
;;idiv2:  ex af,af'
;;       ld (mtbuff),hl
;;       sbc hl,de
;;       ccf
;;       jr c,idiv3
;;       ld hl,(mtbuff)
;;       jp idiv3
	   
	   
div:     	ld b,#16
       		xor a
div_loop:	add hl,hl
         	rla
         	cp c
         	jr c, div_end
         	inc l
         	sub c
div_end: 	djnz div_loop
       		ret
        
 ;***********************************
;; ; Raiz cuadrada
;; ;***********************************
;; .globl _get_sqrt
;; _get_sqrt::
;;     push ix                ; save ix in the stack
;;     
;;     ld ix,#4                ; move ix to the stack pointer position plus the return address
;; 	add ix,sp
;; 	
;; 	ld a,0 (ix)				;recupero la coordenada x1
;; 	ld h,a
;;     
;; isqr:   ld (sqbuf0),hl      ; number for which we want to find square root.
;;        xor a               ; zeroise accumulator.
;;        ld (sqbuf2),a       ; result buffer.
;;        ld a, #128            ; start division with highest bit.
;;        ld (sqbuf1),a       ; next divisor.
;;        ld b,#8              ; 8 bits to divide.
;; isqr1:  push bc             ; store loop counter.
;;        ld a,(sqbuf2)       ; current result.
;;        ld d,a
;;        ld a,(sqbuf1)       ; next bit to check.
;;        or d                ; combine with divisor.
;;        ld d,a              ; store low byte.
;;        xor a               ; HL = HL / D
;;        ld c,a              ; zeroise c.
;;        ld e,a              ; zeroise e.
;;        push de             ; remember divisor.
;;        ld hl,(sqbuf0)      ; original number.
;;        call idiv4          ; divide number by d.
;;        pop de              ; restore divisor.
;;        cp d                ; is divisor greater than result?
;;        jr c,isqr0          ; yes, don't store this bit then.
;;        ld a,d
;;        ld (sqbuf2),a       ; store new divisor.
;; isqr0:  ld hl,sqbuf1        ; bit we tested.
;;        and a               ; clear carry flag.
;;        rr (hl)             ; next bit to right.
;;        pop bc              ; restore loop counter.
;;        djnz isqr1          ; repeat
;;        ld a,(sqbuf2)       ; return result in hl.
;;        
;;        pop ix
;;        
;;        ret
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
;; ;***********************************
;; ; Cosine
;; ;***********************************
;; ; Get cosine of angle passed in the accumulator, and return in de pair.
;; 
;; cos:    add a,64            ; DE = cosine A.
;; ;***********************************
;; ; Sine
;; ;***********************************
;; ; Find sine of angle in accumulator, return in de registers.
;; 
;; sin:    ld hl,sine          ; DE = sine A.
;;        ld d,#0              ; zeroise high byte.
;;        and a               ; clear carry flag.
;;        rla                 ; multiply accumulator by 2.
;;        rl d                ; shift top bit into high byte.
;;        ld e,a              ; put remainder in low byte.
;;        add hl,de           ; add displacement to start of table.
;;        ld e,(hl)           ; get low value of sine value.
;;        inc hl              ; njext byte along.
;;        ld d,(hl)           ; fetch high byte.
;;        ret
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

sine:  .db 1,1,1,1,1,1,1,1,255,0,255,0,255,0,253,0
       .db 253,0,251,0,249,0,247,0,245,0,245,0,243,0,239,0
       .db 237,0,235,0,233,0,229,0,227,0,223,0,221,0,217,0
       .db 213,0,211,0,207,0,203,0,199,0,195,0,191,0,187,0
       .db 183,0,177,0,173,0,169,0,163,0,159,0,153,0,149,0
       .db 143,0,137,0,133,0,127,0,121,0,117,0,111,0,105,0
       .db 99,0,93,0,87,0,81,0,75,0,69,0,63,0,57,0
       .db 51,0,45,0,39,0,33,0,27,0,19,0,13,0,7,0

       .db 0,0,6,0,12,0,18,0,24,0,32,0,38,0,44,0
       .db 50,0,56,0,62,0,68,0,74,0,80,0,86,0,92,0
       .db 98,0,102,0,108,0,114,0,120,0,126,0,130,0,136,0
       .db 142,0,146,0,152,0,156,0,162,0,166,0,170,0,176,0
       .db 180,0,184,0,188,0,192,0,196,0,200,0,204,0,208,0
       .db 212,0,216,0,218,0,222,0,224,0,228,0,230,0,234,0
       .db 236,0,238,0,240,0,242,0,244,0,246,0,248,0,248,0
       .db 250,0,252,0,252,0,254,0,254,0,254,0,254,0,254,0

       .db 0,1,254,0,254,0,254,0,254,0,254,0,252,0,252,0
       .db 250,0,248,0,248,0,246,0,244,0,242,0,240,0,238,0
       .db 236,0,234,0,230,0,228,0,224,0,222,0,218,0,216,0
       .db 212,0,208,0,204,0,200,0,196,0,192,0,188,0,184,0
       .db 180,0,176,0,170,0,166,0,162,0,156,0,152,0,146,0
       .db 142,0,136,0,130,0,126,0,120,0,114,0,108,0,102,0
       .db 96,0,92,0,86,0,80,0,74,0,68,0,62,0,56,0
       .db 48,0,42,0,36,0,30,0,24,0,18,0,12,0,6,0

arcsin: .db 0,0,7,0,13,0,19,0,27,0,33,0,39,0,45,0
       	.db 51,0,57,0,63,0,69,0,75,0,81,0,87,0,93,0
       	.db 99,0,105,0,111,0,117,0,121,0,127,0,133,0,137,0
       	.db 143,0,149,0,153,0,159,0,163,0,169,0,173,0,177,0
       	.db 183,0,187,0,191,0,195,0,199,0,203,0,207,0,211,0
       	.db 213,0,217,0,221,0,223,0,227,0,229,0,233,0,235,0
       	.db 237,0,239,0,243,0,245,0,245,0,247,0,249,0,251,0
       	.db 253,0,253,0,255,0,255,0,255,0,1,1,1,1,1,1
