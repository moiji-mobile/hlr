as yet unclassified
execute
	| invoke param operationName operation |

	operationName := 'alertServiceCentre'.
	operation := dialogue rosOperationNamed: operationName.
	param := operation argumentValue
		at: 'msisdn' put: msisdn;
		at: 'serviceCentreAddress' put: smscAddr;
		yourself.

	invoke := dialogue requestTcInvoke: operation parameters:  param class: 1 timeout: 500.
	invoke
		onReturn: [self alertFailed];
		onError: [self alertFailed];
		onReject: [self alertFailed];
		onReturnLast: [ self alertSuccess: invoke].

	dialogue
		requestTcBeginDestinationAddress: self remoteSCCPAddress
		originatingAddress: self localSCCPAddress
		applicationContextName: (dialogue applicationContextOidForOperationNamed: 'alertServiceCentre').