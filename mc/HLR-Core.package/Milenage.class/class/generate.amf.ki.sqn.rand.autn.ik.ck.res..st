as yet unclassified
generate: anOPC amf: anAMF ki: aKi sqn: aSqn rand: aRand autn: anAutn ik: anIk  ck: anCk res: aRes
	| len |
	anOPC size = 16 ifFalse: [^self error: 'OPC must be 16 bytes ' ].
	anAMF size = 2 ifFalse: [^self error: 'AMF must be 2 bytes' ].
	aKi size = 16 ifFalse: [^self error: 'KI must be 16 bytes' ].
	aSqn size = 6 ifFalse: [^self error: 'SQN must be 2 bytes'].
	aRand size = 16 ifFalse: [^self error: 'RAND must be 16 bytes'].
	anAutn size = 16 ifFalse: [^self error: 'AUTN must be 16 bytes'].
	anIk size = 16 ifFalse: [^self error: 'IK must be 16 bytes'].
	anCk size = 16 ifFalse: [^self error: 'CK must be 16 bytes'].
	aRes size = 8 ifFalse: [^self error: 'RES must be 8 bytes' ].
	
	len := #(0 0 0 8) asByteArray.

	self intGenerate: anOPC amf: anAMF ki: aKi sqn: aSqn rand: aRand autn: anAutn ik: anIk ck: anCk res: aRes resLen: len.