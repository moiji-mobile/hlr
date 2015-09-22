private
insertSubscriberData: aParameter
	| invoke operation  acn |

	"Do not insert anything if the operation has already failed. Mostly for the unit test"
	failed ifTrue: [^self].	

	acn := dialogue applicationContextNamed: 'subscriberDataMngtContext-v3'.
	operation := dialogue rosOperationNamed: 'insertSubscriberDataV3'.

	invoke := dialogue requestTcInvoke: operation parameters:  aParameter class: 1 timeout: 500.
	invoke
		onReturn: [self insertFailed];
		onError: [self insertFailed];
		onReject: [self insertFailed];
		onReturnLast: [ self insertSuccess: invoke].
	pendingInvokes add: invoke.

	needsBegin
		ifTrue: [
			needsBegin := false.
			dialogue
				applicationContext: acn;
				requestTcBeginDestinationAddress: self remoteSCCPAddress
				originatingAddress: self localSCCPAddress
		]
		ifFalse: [dialogue requestTcContinue].
