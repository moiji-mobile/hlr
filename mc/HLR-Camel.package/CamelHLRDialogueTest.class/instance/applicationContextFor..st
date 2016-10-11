as yet unclassified
applicationContextFor: aString
	^aString = 'updateLocation'
		ifTrue: [ '0.4.0.0.1.0.1.3' asAsn1Oid ]
		ifFalse: [self asn1Model applicationContextOidForOperationNamed: aString].