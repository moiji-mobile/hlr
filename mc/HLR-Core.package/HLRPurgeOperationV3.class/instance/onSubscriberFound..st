as yet unclassified
onSubscriberFound: aSubscriber
	| res |
	self flag: #todo. "Check if the vlrNumber is actually matching!"

	aSubscriber
		vlrNumber: nil;
		mscNumber: nil.
	hlr database updateSubscriber: aSubscriber.

	res := ASN1Dictionary new
			at: 'freezeTMSI' put: 1;
			yourself.
	invocation returnResultLast: res.
	dialogue requestTcEnd: false.	