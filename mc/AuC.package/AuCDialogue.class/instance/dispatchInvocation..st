as yet unclassified
dispatchInvocation: anInvocation
	| operationName |
	operationName := anInvocation operationName.
	(#('sendAuthenticationInfoV2' 'sendAuthenticationInfoV3' 'authenticationFailureReport') includes: operationName) ifFalse: [
		logger logError: 'Operation not handled by AuC' with: { 'operationName' -> operationName }.
		self requestTcUAbort: self newUAbort serviceUser.
		^self].

	super dispatchInvocation: anInvocation.