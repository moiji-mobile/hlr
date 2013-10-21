private
insertSubscriberData: aParameter
	| invoke |
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
				applicationContextName: (self class applicationContextFor: 'sendAuthenticationInfoV2')
		]
		ifFalse: [dialogue requestTcContinue].
