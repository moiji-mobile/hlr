success-failure-handling
onSystemFailure
	| error |
	logger logError: 'System failure' with: {}.

	error := ('SystemFailureParam' asAsn1TypeIn: dialogue asn1Model) newValue.
	error networkResource: 'hlr'.
	self endWithError: 'systemFailure' with: error