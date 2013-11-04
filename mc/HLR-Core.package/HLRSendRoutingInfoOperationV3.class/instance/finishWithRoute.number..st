as yet unclassified
finishWithRoute: aSubscriber number: aMSISDN
	self flag: #todo. "Uncomenting the vmsc-Address breaks things in the decode."
	invocation returnResultLast:
		(ASN1Dictionary new
			at: 'imsi' put: aSubscriber imsiAsTBCD;
			at: 'extendedRoutingInfo' put: 
"				(ASN1Dictionary new
					at: 'forwardingData'  put:
						(ASN1Dictionary new
							at: 'forwardedToNumber' put: '91947187117654';
							yourself);
						yourself);"

				(ASN1Dictionary new
					at: 'roamingNumber' put: aMSISDN;
					yourself);

"			at: 'basicService' put: (ASN1Dictionary new
				at: 'ext-Teleservice' put: '11';
				yourself);"
			yourself).

	dialogue requestTcEnd: false.