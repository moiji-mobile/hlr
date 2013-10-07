creation
formatResponse: aResp
	self halt.
	^ASN1Array new
		addAll: aResp;
		yourself