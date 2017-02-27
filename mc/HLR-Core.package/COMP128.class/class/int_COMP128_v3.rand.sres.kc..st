as yet unclassified
int_COMP128_v3: aKi rand: aRand sres: aRes kc: aKc
	<primitive: 'primitiveNativeCall' module: 'NativeBoostPlugin'>

	^self nbCall: #(void comp128v3(String  aKi, String aRand, byte* aRes, byte* aKc)) module: 'osmogsm'.