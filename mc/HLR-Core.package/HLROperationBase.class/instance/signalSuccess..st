success-failure-handling
signalSuccess: aResult
	| cdr |

	logger logDebug: 'Operation succeeded' with: { 'dialogue' -> dialogue. 'result' -> aResult }.
	cdr := (hlr cdrClient createRecordFor: dialogue)
		at: 'status' put: 'success';
		at: 'result' put: aResult;
		yourself.
	self addStatusToCDR: cdr.
	cdr created.	

	onSuccessBlock ifNotNil: [:block | block cull: aResult].
	hlr operationSucceeded: self with: aResult.