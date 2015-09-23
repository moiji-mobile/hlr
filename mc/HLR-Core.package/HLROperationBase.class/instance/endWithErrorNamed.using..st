success-failure-handling
endWithErrorNamed: anError using: aBlock
	
	invocation returnErrorNamed: anError using: aBlock.
	dialogue requestTcEnd: false.

	self signalFailure.