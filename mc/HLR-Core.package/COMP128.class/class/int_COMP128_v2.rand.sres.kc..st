as yet unclassified
int_COMP128_v2: aKi rand: aRand sres: aRes kc: aKc
	<primitive: 'primitiveNativeCall' module: 'NativeBoostPlugin'>

	^self nbCall: #(void comp128v2(String  aKi, String aRand, byte* aRes, byte* aKc)) module: 'osmogsm'.