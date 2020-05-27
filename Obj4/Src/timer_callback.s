;derniere seance!!	
	thumb

	area  madata, data, readwrite
		
	include etat.inc
	import etat	
	export callback

	area  moncode, code, readonly
			
callback	proc

	ldr 	r0, =etat;
	ldr	    r1,[r0,#E_SON]	; son mis dans r1
	ldr 	r2, [r0,#E_POS];position mis dans r2
	ldr 	r3, [r0,#E_TAI];taille mis dans r5
	ldr	    r4, =TIM3_CCR3;
	
	cmp 	r3, r2 ;verifier si c'est fini
	beq	out

	ldrsh	r5,[r1,r2,lsl #1] 
	
	ldr 	r3,[r0,#E_RES];resolution mis dns r5
	mul	    r5, r3 ;mutiplication resolution
	asr 	r5, #16 ; arthimetique decaler vers droite / diviser 2^16

	asr 	r3, #1 ;offset
	add 	r5, r3
	str 	r5,[r4] ;emis de la valeur convertie 
	add	    r2,#1  ;position incremente
	str 	r2, [r0,#E_POS]
	
out		;fini
	bx	lr
	endp
	end
		