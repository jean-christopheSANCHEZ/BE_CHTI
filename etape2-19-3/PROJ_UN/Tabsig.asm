	AREA Signal, DATA, READONLY
	export TabSig
; fonction cosinus, frequence relative 1, phase zero, amplitude max
; valeurs attendues pour k = 1 :
;	Re	0x7FFFD135	env +2^31  sous format 1.30 ?
;	Im	0xFFFFF800	env 0       sous format 1.30 ?
;	M2	0x3FFFD135	env 2^30    sous format 2.30 donc est bien 1
; pour k > 1
;	M2    < 0x0000000F
;
;
;
;
; 
TabSig
	dcw	0x0fff	;  0   4095  0.99976   NOTATION 4.12
	dcw	0x0ff6	;  1   4086  0.99756
	dcw	0x0fd9	;  2   4057  0.99048
	dcw	0x0fa8	;  3   4008  0.97852
	dcw	0x0f64	;  4   3940  0.96191
	dcw	0x0f0e	;  5   3854  0.94092
	dcw	0x0ea7	;  6   3751  0.91577
	dcw	0x0e2f	;  7   3631  0.88647
	dcw	0x0da8	;  8   3496  0.85352
	dcw	0x0d13	;  9   3347  0.81714
	dcw	0x0c72	; 10   3186  0.77783
	dcw	0x0bc5	; 11   3013  0.73560
	dcw	0x0b10	; 12   2832  0.69141
	dcw	0x0a53	; 13   2643  0.64526
	dcw	0x0990	; 14   2448  0.59766
	dcw	0x08c9	; 15   2249  0.54907
	dcw	0x0800	; 16   2048  0.50000
	dcw	0x0737	; 17   1847  0.45093
	dcw	0x0670	; 18   1648  0.40234
	dcw	0x05ad	; 19   1453  0.35474
	dcw	0x04f0	; 20   1264  0.30859
	dcw	0x043b	; 21   1083  0.26440
	dcw	0x038e	; 22    910  0.22217
	dcw	0x02ed	; 23    749  0.18286
	dcw	0x0258	; 24    600  0.14648
	dcw	0x01d1	; 25    465  0.11353
	dcw	0x0159	; 26    345  0.08423
	dcw	0x00f2	; 27    242  0.05908
	dcw	0x009c	; 28    156  0.03809
	dcw	0x0058	; 29     88  0.02148
	dcw	0x0027	; 30     39  0.00952
	dcw	0x000a	; 31     10  0.00244
	dcw	0x0000	; 32      0  0.00000
	dcw	0x000a	; 33     10  0.00244
	dcw	0x0027	; 34     39  0.00952
	dcw	0x0058	; 35     88  0.02148
	dcw	0x009c	; 36    156  0.03809
	dcw	0x00f2	; 37    242  0.05908
	dcw	0x0159	; 38    345  0.08423
	dcw	0x01d1	; 39    465  0.11353
	dcw	0x0258	; 40    600  0.14648
	dcw	0x02ed	; 41    749  0.18286
	dcw	0x038e	; 42    910  0.22217
	dcw	0x043b	; 43   1083  0.26440
	dcw	0x04f0	; 44   1264  0.30859
	dcw	0x05ad	; 45   1453  0.35474
	dcw	0x0670	; 46   1648  0.40234
	dcw	0x0737	; 47   1847  0.45093
	dcw	0x0800	; 48   2048  0.50000
	dcw	0x08c9	; 49   2249  0.54907
	dcw	0x0990	; 50   2448  0.59766
	dcw	0x0a53	; 51   2643  0.64526
	dcw	0x0b10	; 52   2832  0.69141
	dcw	0x0bc5	; 53   3013  0.73560
	dcw	0x0c72	; 54   3186  0.77783
	dcw	0x0d13	; 55   3347  0.81714
	dcw	0x0da8	; 56   3496  0.85352
	dcw	0x0e2f	; 57   3631  0.88647
	dcw	0x0ea7	; 58   3751  0.91577
	dcw	0x0f0e	; 59   3854  0.94092
	dcw	0x0f64	; 60   3940  0.96191
	dcw	0x0fa8	; 61   4008  0.97852
	dcw	0x0fd9	; 62   4057  0.99048
	dcw	0x0ff6	; 63   4086  0.99756
	end
