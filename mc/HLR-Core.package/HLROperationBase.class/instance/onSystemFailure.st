success-failure-handling
onSystemFailure

	logger logError: 'System failure' with: {}.
	self endWithError: 'systemFailure' using: [ :error | error networkResource: 'hlr' ] 