as yet unclassified
execute
	| invoke param |

	param := ASN1Dictionary new
				at: 'msisdn' put: msisdn;
				at: 'serviceCentreAddress' put: smscAddr;
				yourself.

	invoke := dialogue requestTcInvokeNamed: 'alertServiceCentre' parameters:  param class: 1 timeout: 500.
	invoke
		onReturn: [self alertFailed];
		onError: [self alertFailed];
		onReject: [self alertFailed];
		onReturnLast: [ self alertSuccess: invoke].

	dialogue
		requestTcBeginDestinationAddress: self remoteSCCPAddress
		originatingAddress: self localSCCPAddress
		applicationContextName: (dialogue applicationContextNamed: 'alertServiceCentre').