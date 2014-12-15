as yet unclassified
onSubscriberFound: aSubscriber
	| res |
	self flag: #todo. "Check if the vlrNumber is actually matching!"

	aSubscriber clearVlr.
	hlr database updateSubscriber: aSubscriber.

	res := ASN1Dictionary new
			at: 'freezeTMSI' put: nil asAsn1Value;
			yourself.
	invocation returnResultLast: res.
	dialogue requestTcEnd: false.
	self signalSuccess: 'done'