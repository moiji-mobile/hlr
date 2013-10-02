as yet unclassified
checkKi: aKi rand: aRand
	"Verify that the params passed to C are of the right size or we will get a segfault"
	aKi size = 16
		ifFalse: [^self error: 'KI must be 16 bytes'].
	aRand size = 16
		ifFalse: [^self error: 'RAND must be 16 bytes'].
