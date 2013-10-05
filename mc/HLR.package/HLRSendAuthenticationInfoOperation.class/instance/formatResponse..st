as yet unclassified
formatResponse: aResp
	^ASN1Dictionary new
		at: 'tripletList' put: (ASN1Array new addAll: aResp; yourself);
		yourself