converting
toAsn1: aContext

	^ self valuesOn: (aContext typeNamed: 'Ext-SS-Info') newValue.
	