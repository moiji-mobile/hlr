as yet unclassified
COMP128_v3: aKi rand: aRand
	| res |
	self checkKi: aKi rand: aRand.

	res := ByteArray new: 16.
	self int_COMP128_v3: aKi asByteArray rand: aRand result: res.
	^res