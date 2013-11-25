success-failure-handling
signalFailure
	| cdr |
	cdr := (hlr cdrClient addRecordFor: dialogue)
		at: 'type' put: 'end';
		at: 'status' put: 'failure';
		yourself.
	self addStatusToCDR: cdr.
	cdr created.

	onErrorBlock ifNotNil: [:block | block value].