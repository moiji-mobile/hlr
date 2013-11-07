as yet unclassified
finishForward: aSubscriber number: aMSISDN
	invocation returnResultLast:
		(ASN1Dictionary new
			at: 'imsi' put: aSubscriber imsiAsTBCD;
			at: 'routingInfo' put:
				(ASN1Dictionary new
					at: 'forwardingData'  put:
						(ASN1Dictionary new
							at: 'forwardedToNumber' put: aMSISDN;
							yourself);
					yourself);
			yourself).
	dialogue requestTcEnd: false.