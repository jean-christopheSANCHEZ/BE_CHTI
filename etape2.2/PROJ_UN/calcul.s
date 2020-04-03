	thumb
		
	extern TabSin
	extern TabCos
	extern TabSig
	import re_im

	area  moncode, code, readonly
	export M2
;
M2 proc
	push	{r4,r5,lr}			;on a besoin de tabsig et de k
	ldr r2, =TabCos
	mov	r4,r0					;on recupere le signal
	bl	re_im 					;on appelle la fonction de la dft pur avoir la partie reelle
	mov r5,r0 					
	ldr r2, =TabSin
	mov r0,r4					;on prend tabsig
	bl	re_im 					;on appelle la fonction de la dft pur avoir la partie imaginaire
	SMULL r2, r3, r0, r0 		;on calcule le carre
	SMLAL	r2, r3, r5, r5
	mov r0, r3					;on conserve que les 32 bits de la multiplication
fin	pop {r4,r5,pc}				
	endp
;
	end