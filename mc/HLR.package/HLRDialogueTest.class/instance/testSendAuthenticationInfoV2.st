tests-infoRetrievalPackage
testSendAuthenticationInfoV2
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
	operationName := 'sendAuthenticationInfoV2'.
	dialogue := testEndPoint createDialogue.
	dialogue requestTcInvokeNamed: operationName parameters:  self imsi class: 1 timeout: 500.
	dialogue
		requestTcBeginDestinationAddress: self hlrAddr
		originatingAddress: self localAddr
		applicationContextName: (self applicationContextFor: operationName)