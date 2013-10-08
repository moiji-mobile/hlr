as yet unclassified
int_COMP128_v2: aKi rand: aRand result: aRes
	<primitive: 'primitiveNativeCall' module: 'NativeBoostPlugin'>

	^self nbCall: #(void COMP128_2(String  aKi, String aRand, byte* aRes)) module: 'a3a8'.