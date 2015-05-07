success-failure-handling
abort: aCause
	logger logNotice: 'Requesting abort' with: { 'dialogue' -> dialogue. 'cause' -> aCause }.
	dialogue requestTcUAbort: aCause.
	self signalFailure.