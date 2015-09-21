converting
toAsn1: aContext

	^ self valuesOn: (aContext typeNamed: 'SS-Info') newValue.
	