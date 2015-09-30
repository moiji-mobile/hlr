execution
deleteSubscriberSuccess
	"We have deleted the old list.. insert the new one now"
	| invoke param operation |
	
	operation := dialogue rosOperationNamed: 'insertSubscriberDataV3' .
	
	param := operation newArgumentValue 
		imsi: imsi toTBCD.
	(param expandFieldNamed: 'provisionedSS')
		addUsing: [ :item | (ssData valuesOn: item) ].

	invoke := dialogue
		requestTcInvoke: operation
		parameters: param 
		class: 1 
		timeout: 500.
	invoke
		onReturnLast: [dialogue requestTcEnd: false. self signalSuccess: 'done'];
		onError: [self failure].
	dialogue requestTcContinue.