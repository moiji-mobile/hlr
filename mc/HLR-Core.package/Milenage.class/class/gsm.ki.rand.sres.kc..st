as yet unclassified
gsm: anOPC ki: aKi rand: aRand sres: aRes kc: aKc
	anOPC size = 16 ifFalse: [^self error: 'OPC must be 16 bytes ' ].
	aKi size = 16 ifFalse: [^self error: 'KI must be 16 bytes' ].
	aRand size = 16 ifFalse: [^self error: 'RAND must be 16 bytes'].
	aKc size = 8 ifFalse: [^self error: 'KC must be 8 bytes'].
	aRes size = 4 ifFalse: [^self error: 'RES must be 4 bytes' ].
	
	^self intGsm: anOPC ki: aKi rand: aRand  sres: aRes kc: aKc