	thumb
		
	extern TabSin
	extern TabCos
	extern TabSig
	import dft

	area  moncode, code, readonly
	export cal
;
cal proc
	push	{r4,r5,lr}			;on a besoin de tabsig et k
	ldr r2, =TabCos
	mov	r4,r0					;on recupere l'adresse du signal
	bl	dft 					;on appel la fonction dft pour la partie relle
	mov r5,r0 					
	ldr r2, =TabSin
	mov r0,r4					;on reprend le tableau
	bl	dft						;on appel dft la pour la partie imaginaire
	SMULL r2, r3, r0, r0 		;on met au carré les deux morceaux de la dft
	SMLAL	r2, r3, r5, r5
	mov r0, r3					;on conserve les 32 bits de poids forts du resultat dans r0
	

fin	pop {r4,r5,pc}					
	endp
;
	end