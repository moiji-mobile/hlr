as yet unclassified
intRand: aByteArray size: aSize
	<primitive: 'primitiveNativeCall' module: 'NativeBoostPlugin'>

	^self nbCall: #(int RAND_bytes(byte* aByteArray, int aSize)) module: 'crypto'.