as yet unclassified
int_COMP128_v3: aKi rand: aRand result: aRes
	<primitive: 'primitiveNativeCall' module: 'NativeBoostPlugin'>

	^self nbCall: #(void COMP128_3(String  aKi, String aRand, byte* aRes)) module: 'a3a8'.