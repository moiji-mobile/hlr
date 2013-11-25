execution
deleteSubscriberSuccess
	"We have deleted the old list.. insert the new one now"
	| invoke param |
	param := ASN1Dictionary new
				at: 'imsi' put: imsi toTBCD;
				at: 'provisionedSS' put: (ASN1Array new
					add: ssData toAsn1;
					yourself);
				yourself.

	invoke := dialogue
		requestTcInvokeNamed: 'insertSubscriberDataV3'
		parameters: param class: 1 timeout: 500.
	invoke
		onReturnLast: [dialogue requestTcEnd: false. self signalSuccess: 'done'];
		onError: [self failure].
	dialogue requestTcContinue.