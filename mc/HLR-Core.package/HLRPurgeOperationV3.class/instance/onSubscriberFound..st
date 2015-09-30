as yet unclassified
onSubscriberFound: aSubscriber
	| res |
	self flag: #todo. "Check if the vlrNumber is actually matching!"

	aSubscriber clearVlr.
	hlr database updateSubscriber: aSubscriber.

	res :=invocation newResultValue
		at: 'freezeTMSI' put: nil;
		yourself.
	invocation returnResultLast: res.
	dialogue requestTcEnd: false.
	self signalSuccess: 'done'