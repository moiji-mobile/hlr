as yet unclassified
intGenerate: anOPC amf: anAMF ki: aKi sqn: aSqn rand: aRand autn: anAutn ik: anIk  ck: anCk res: aRes resLen: aLen
	<primitive: 'primitiveNativeCall' module: 'NativeBoostPlugin'>

	^self nbCall: #(void milenage_generate(byte* anOPC, byte* anAMF, byte* aKi, byte* aSqn, byte* aRand, byte* anAutn, byte* anIk, byte* anCk, byte* aRes, int* aLen)) module: 'osmogsm'.