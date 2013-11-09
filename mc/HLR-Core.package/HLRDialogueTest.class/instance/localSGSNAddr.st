as yet unclassified
localSGSNAddr
	^ (SCCPAddress createForSSN: #sgsn) 
		pointCode: 11;
		routedOnSSN: true;
		yourself