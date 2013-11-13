execution
invokeDeleteSubscriberData
	| invoke param |
	param := ASN1Dictionary new
				at: 'imsi' put: imsi toTBCD;
				at: 'ss-List' put: (ASN1Array new
								add: ssData ssCode asByteArray hex;
								yourself);
				yourself.

	invoke := dialogue
		requestTcInvokeNamed: 'deleteSubscriberDataV3'
		parameters: param
		class: 1 timeout: 500.
	invoke
		onReturnLast: [self deleteSubscriberSuccess];
		onError: [self failure].