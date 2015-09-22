as yet unclassified
onSubscriberFound: aSubscriber

	self flag: #todo. "Check if the sgsnNumber is actually matching!"

	aSubscriber
		sgsnAddress: nil;
		sgsnNumber: nil.
	hlr database updateSubscriber: aSubscriber.

	invocation returnResultLast: invocation resultValue.
	dialogue requestTcEnd: false.
	self signalSuccess: 'done'.