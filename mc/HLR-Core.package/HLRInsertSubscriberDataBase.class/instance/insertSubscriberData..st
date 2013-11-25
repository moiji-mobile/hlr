private
insertSubscriberData: aParameter
	| invoke |

	"Do not insert anything if the operation has already failed. Mostly for the unit test"
	failed ifTrue: [^self].	

	invoke := dialogue requestTcInvokeNamed: 'insertSubscriberDataV3' parameters:  aParameter class: 1 timeout: 500.
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
				requestTcBeginDestinationAddress: self remoteSCCPAddress
				originatingAddress: self localSCCPAddress
				applicationContextName: (self class applicationContextFor: 'insertSubscriberDataV3')
		]
		ifFalse: [dialogue requestTcContinue].
