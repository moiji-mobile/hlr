sqn-handling
verifyAuts: anAuts rand: aRand
	| res sqn |
	sqn := ByteArray new: 6.
	res := Milenage auts: opc ki: ki rand: aRand auts: anAuts sqn: sqn.
	^res -> sqn