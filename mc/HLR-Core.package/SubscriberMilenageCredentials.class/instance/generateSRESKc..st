as yet unclassified
generateSRESKc: aRand 
	| sres kc res |
	sres := ByteArray new: 4.
	kc := ByteArray new: 8.

	res := Milenage gsm: opc ki: ki rand: aRand sres: sres kc: kc.
	res = 0 ifFalse: [^self error: 'Failed to generate tuple' ].
	^sres, kc