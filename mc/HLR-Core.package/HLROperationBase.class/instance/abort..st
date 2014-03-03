success-failure-handling
abort: aCause
	dialogue requestTcUAbort: aCause.
	self signalFailure.