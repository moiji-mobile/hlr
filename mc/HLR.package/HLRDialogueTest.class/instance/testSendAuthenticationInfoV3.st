tests-infoRetrievalPackage
testSendAuthenticationInfoV3
	"Send an invoke for sendAuthenticationInfoV2"
	"
	| localDialogue localEndPoint localInvoke store theResult |
	localDialogue := localEndPoint createDialogue.
	localInvoke := localDialogue 
	localInvoke onReturn: [ :result | store result ].
	localDialogue sendAuthenticationInfoV2: '1234F'.
	
	self assert: theResult = foo.
	"

	| operationName dialogue  |
	operationName := 'sendAuthenticationInfoV3'.
	dialogue := testEndPoint createDialogue.
	dialogue requestTcInvokeNamed: operationName parameters:  self sendAuthV3 class: 1 timeout: 500.
	dialogue
		requestTcBeginDestinationAddress: self hlrAddr
		originatingAddress: self localAddr
		applicationContextName: (self applicationContextFor: operationName)