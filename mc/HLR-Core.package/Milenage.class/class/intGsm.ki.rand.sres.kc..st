as yet unclassified
intGsm: anOPC ki: aKi rand: aRand sres: aSres kc: aKc 
	<primitive: 'primitiveNativeCall' module: 'NativeBoostPlugin'>

	^self nbCall: #(int gsm_milenage(byte* anOPC, byte* aKi, byte* aRand,  byte* aSres, byte* aKc)) module: 'osmogsm'.