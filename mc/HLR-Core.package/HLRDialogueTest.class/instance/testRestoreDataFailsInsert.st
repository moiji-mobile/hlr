test-locationUpdatingPackage
testRestoreDataFailsInsert
	| operationName dialogue  invoke param error operation |

	subscriber vlrNumber: '1234'.
	subscriber mscNumber: '4567'.
	self deny: subscriber vlrNumber isNil.
	self deny: subscriber mscNumber isNil.
	
	operationName := 'restoreData'.
	dialogue := testEndPoint newDialogue.
	operation := self rosOperationNamed: operationName.
	param := operation newArgumentValue 
		at: 'imsi' put: subscriber imsiAsTBCD;
		yourself.
		
	"We expect insertSubscriberData. Continue for now"
	dialogue
		onInvoke: [ :insert |
			insert returnErrorNamed: 'unexpectedDataValue'.
			dialogue requestTcContinue].

	invoke := dialogue requestTcInvoke: operation parameters:  param class: 1 timeout: 500.
	invoke
		onReturn: [self assert: false ];
		onError: [error := true];
		onReject: [self assert: false];
		onReturnLast: [self assert: false].
	dialogue
		requestTcBeginDestinationAddress: self hlrAddr
		originatingAddress: self localAddr
		applicationContextName: (self applicationContextFor: operationName).

	self assert: error