; ce programme est pour l'assembleur RealView (Keil)
	thumb

	area  madata, data, readwrite
	
	export DFT
		
	area  moncode, code, readonly
	import TabSin
	import TabCos
	import res
N 	equ 64