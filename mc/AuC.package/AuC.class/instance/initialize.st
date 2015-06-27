as yet unclassified
initialize
	super initialize.
	successCounter := 0.
	operationFilter := #('sendAuthenticationInfoV2' 'sendAuthenticationInfoV3' 'authenticationFailureReport').