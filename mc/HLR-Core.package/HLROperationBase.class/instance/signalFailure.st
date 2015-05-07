success-failure-handling
signalFailure
	| cdr |
	logger logDebug: 'Operation failed' with: { 'dialogue' -> dialogue }.
	cdr := (hlr cdrClient createRecordFor: dialogue)
		at: 'type' put: 'end';
		at: 'status' put: 'failure';
		yourself.
	self addStatusToCDR: cdr.
	cdr created.

	onErrorBlock ifNotNil: [:block | block value].