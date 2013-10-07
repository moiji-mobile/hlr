creation
formatResponse: aResp
	^ASN1Array new
		addAll: aResp;
		yourself