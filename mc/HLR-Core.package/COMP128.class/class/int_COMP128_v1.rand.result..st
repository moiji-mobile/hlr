as yet unclassified
int_COMP128_v1: aKi rand: aRand result: aRes
	<primitive: 'primitiveNativeCall' module: 'NativeBoostPlugin'>

	^self nbCall: #(void COMP128_1(String  aKi, String aRand, byte* aRes)) module: 'a3a8'.