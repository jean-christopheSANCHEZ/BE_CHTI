	thumb
		
	extern TabSin
	extern TabCos
	extern TabSig
	import re_im

	area  moncode, code, readonly
	export M2
;
M2 proc
	push	{r4,r5,lr}			;ce que nous avons besoin pour les calculs, arguments, tabsig et k
	ldr r2, =TabCos
	mov	r4,r0					;signal
	bl	re_im 					;on appelle la fonction qui calcule la partie reelle de la dft
	mov r5,r0 					;on garde la valeur de la partie réelle
	ldr r2, =TabSin
	mov r0,r4					;
	bl	re_im 					;on appelle la fonction qui calcule la partie reelle de la dft
	SMULL r2, r3, r0, r0 		;multiplication au carre des deux parties de la dft
	SMLAL	r2, r3, r5, r5
	mov r0, r3					;on conserve 32 bits de la multiplication
fin	pop {r4,r5,pc}				
	endp
;
	end