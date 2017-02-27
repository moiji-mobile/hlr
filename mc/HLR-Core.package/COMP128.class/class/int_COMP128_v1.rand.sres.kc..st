as yet unclassified
int_COMP128_v1: aKi rand: aRand sres: aRes kc: aKc
	<primitive: 'primitiveNativeCall' module: 'NativeBoostPlugin'>

	^self nbCall: #(void comp128v1(String  aKi, String aRand, byte* aRes, byte* aKc)) module: 'osmogsm'.