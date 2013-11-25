as yet unclassified
finishWithRoute: aSubscriber number: aMSRN
	invocation returnResultLast:
		(ASN1Dictionary new
			at: 'imsi' put: aSubscriber imsiAsTBCD;
			at: 'routingInfo' put: (ASN1Dictionary new
				at: 'roamingNumber' put: aMSRN;
				yourself);
			yourself).
	dialogue requestTcEnd: false.
	self signalSuccess: aMSRN