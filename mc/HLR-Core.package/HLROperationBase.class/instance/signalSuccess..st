success-failure-handling
signalSuccess: aResult
	| cdr |
	
	cdr := (hlr cdrClient addRecordFor: dialogue)
		at: 'status' put: 'success';
		at: 'result' put: aResult;
		yourself.
	self addStatusToCDR: cdr.
	cdr created.	

	onSuccessBlock ifNotNil: [:block | block cull: aResult]