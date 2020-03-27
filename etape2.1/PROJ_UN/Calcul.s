	thumb
	area  madata, data, readwrite
	export 	calcul
	area  moncode, code, readonly
	import TabSin
	import TabCos
		
calcul proc
	
	
	push	{lr} 
	push	{r4}
	mov		r12 ,#2
	mul 	r0,r0,r12
	push	{r5};
	ldr		r5,=TabSin
	push	{r6};
	ldr		r6,=TabCos
	ldrsh 	r1,[r5,r0,lsl #1]
	ldrsh 	r2,[r6,r0,lsl #1]
	pop		{r6}
	pop		{r5}
	mul 	r1,r1,r1
	mul 	r2,r2,r2
	add		r0,r1,r2
	pop 	{r4}
	pop		{lr}
	bx		lr 
	endp
	end