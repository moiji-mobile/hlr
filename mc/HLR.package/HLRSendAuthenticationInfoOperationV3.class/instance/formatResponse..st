as yet unclassified
formatResponse: aList
	^ASN1Dictionary new
		at: 'authenticationSetList' put:
			(ASN1Dictionary new
				at: 'tripletList' put: (ASN1Array new addAll: aList; yourself));
		yourself