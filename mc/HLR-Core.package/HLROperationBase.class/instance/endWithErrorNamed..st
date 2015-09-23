success-failure-handling
endWithErrorNamed: aString
	invocation returnErrorNamed: aString.
	dialogue requestTcEnd: false.

	self signalFailure.