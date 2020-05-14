	area  madata, data
tot	dcd	0
GPIOB_BSRR	equ	0x40010C10	; Bit Set/Reset register	
	
	area  moncode, code
	export 	callback
	include etat.inc

callback proc
	
	ldr r10,=tot 
	LDRSB R9,[r10]  ; Load register signed byte
	MVN r9,r9 ; cherche le <bit mask> de R9, generate a warning?
	STRB r9,[r10] ;stores the least significant byte
	
	CMP r9,#0 ;like subs, result discarded
	BEQ zero ;if r9=0 to zero, else continu
	
; mise a 1 de PB1
	ldr	r2, =GPIOB_BSRR
	mov	r1, #0x00000002
	str	r1, [r2]
	B out
	
zero
; mise a zero de PB1
	ldr	r2, =GPIOB_BSRR
	mov	r1, #0x00020000
	str	r1, [r2]
; N.B. le registre BSRR est write-only, on ne peut pas le relire	
out 	BX lr
	endp
	end	


