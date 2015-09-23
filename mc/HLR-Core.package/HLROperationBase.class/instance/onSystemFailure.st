success-failure-handling
onSystemFailure

	logger logError: 'System failure' with: {}.
	self endWithErrorNamed: 'systemFailure' using: [ :error | error networkResource: 'hlr' ] 