success-failure-handling
endWithError: anError using: aBlock
	
	invocation returnError: anError using: aBlock.
	dialogue requestTcEnd: false.

	self signalFailure.