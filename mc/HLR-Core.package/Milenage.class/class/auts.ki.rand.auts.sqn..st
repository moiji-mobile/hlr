as yet unclassified
auts: anOPC ki: aKi rand: aRand auts: anAuts sqn: aSqn
	anOPC size = 16 ifFalse: [^self error: 'OPC must be 16 bytes ' ].
	aKi size = 16 ifFalse: [^self error: 'KI must be 16 bytes' ].
	aRand size = 16 ifFalse: [^self error: 'RAND must be 16 bytes'].
	anAuts size = 14 ifFalse: [^self error: 'AUTS must be 14 bytes'].
	aSqn size = 8 ifFalse: [^self error: 'SQN must be 4 bytes' ].
	
	^self intAuts: anOPC ki: aKi rand: aRand  auts: anAuts sqn: aSqn.