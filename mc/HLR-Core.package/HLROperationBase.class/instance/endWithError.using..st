success-failure-handling
endWithError: anError using: aBlock
	| errorType error |
	errorType := dialogue asn1TypeNamed: anError.
	error := ( errorType  attributeAt: 'ParameterType' ) newValue .
	aBlock value: error.
	invocation returnError: errorType with: error.
	dialogue requestTcEnd: false.

	self signalFailure.