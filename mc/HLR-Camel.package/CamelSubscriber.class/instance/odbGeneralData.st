capabilityHandling
odbGeneralData
	^self camelPhaseTwoSupported
		ifTrue: [odbGeneralData]
		ifFalse: [#[0 1] hex].