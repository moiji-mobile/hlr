test-locationUpdatingPackage
testRestoreDataNotFound
	| operationName dialogue  invoke param error |

	param := ASN1Dictionary new
		at: 'imsi' put: '1234';
		yourself.

	subscriber vlrNumber: '1234'.
	subscriber mscNumber: '4567'.
	self deny: subscriber vlrNumber isNil.
	self deny: subscriber mscNumber isNil.
	
	operationName := 'restoreData'.
	dialogue := testEndPoint createDialogue.

	"We expect insertSubscriberData. Continue for now"
	dialogue
		onInvoke: [ :insert |
			insert returnResultLast: nil.
			dialogue requestTcContinue].

	invoke := dialogue requestTcInvokeNamed: operationName parameters:  param class: 1 timeout: 500.
	invoke
		onReturn: [self assert: false ];
		onError: [error := true];
		onReject: [self assert: false];
		onReturnLast: [self assert: false].
	dialogue
		requestTcBeginDestinationAddress: self hlrAddr
		originatingAddress: self localAddr
		applicationContextName: (self applicationContextFor: operationName).

	self assert: error.