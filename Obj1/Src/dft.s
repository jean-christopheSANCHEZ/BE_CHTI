	thumb
		
	extern TabSig

	area  moncode, code, readonly
	export dft
;
dft proc
	push {r4}
	push {r5}
	push {r6}
	push {r7}
	push {r8}
	mov r6, #0 						
	mov	r8, #0						;Somme
loop	ldrsh r5, [r0, r6, LSL #1] 	;stockage x(i)
	mul r7, r6, r1 					;Calcule i*k
	and	r7, #0x3F 					;i*k mod 64
	ldrsh r12, [r2, r7, LSL #1]		;sin(i*k*2pi/N) = tabsin(i*k mod 64)       -- cos
	mla r8, r5, r12, r8 			; =+(x(i)*tabsin(i*k))
	
	add r6, #1
	cmp r6, #64
	blo loop 
	
	mov r0, r8
	pop {r8}
	pop {r7}
	pop {r6}
	pop {r5}
	pop {r4}

fin	bx	lr								
	endp
;
	end