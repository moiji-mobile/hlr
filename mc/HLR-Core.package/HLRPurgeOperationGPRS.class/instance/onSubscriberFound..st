as yet unclassified
onSubscriberFound: aSubscriber
	| res |
	self flag: #todo. "Check if the sgsnNumber is actually matching!"

	aSubscriber
		sgsnAddress: nil;
		sgsnNumber: nil.
	hlr database updateSubscriber: aSubscriber.

	res := ASN1Dictionary new
			yourself.
	invocation returnResultLast: res.
	dialogue requestTcEnd: false.
	self signalSuccess: 'done'.