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
	dialogue requestTcContinue.	
