as yet unclassified
COMP128_v1: aKi rand: aRand
	| sres kc |
	self checkKi: aKi rand: aRand.

	sres := ByteArray new: 4.
	kc := ByteArray new: 8.
	self int_COMP128_v1: aKi asByteArray rand: aRand sres: sres kc: kc.
	^{sres. kc}