*HLR
at: aKey putIfNotNil: aValue
	aValue ifNotNil: [self at: aKey put: aValue]