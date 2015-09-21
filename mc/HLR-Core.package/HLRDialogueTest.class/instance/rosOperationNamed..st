as yet unclassified
rosOperationNamed: aString
	^ ROSOperation on: (self asn1Model typeNamed: aString)