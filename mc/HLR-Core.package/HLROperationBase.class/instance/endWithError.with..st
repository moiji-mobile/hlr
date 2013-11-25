success-failure-handling
endWithError: anError with: aData
	invocation returnError: anError with: aData.
	dialogue requestTcEnd: false.

	self signalFailure.