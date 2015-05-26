as yet unclassified
intAuts: anOPC ki: aKi rand: aRand auts: anAuts sqn: aSqn 
	<primitive: 'primitiveNativeCall' module: 'NativeBoostPlugin'>

	^self nbCall: #(int milenage_auts(byte* anOPC, byte* aKi, byte* aRand, byte* anAuts, byte* aSqn)) module: 'osmogsm'.