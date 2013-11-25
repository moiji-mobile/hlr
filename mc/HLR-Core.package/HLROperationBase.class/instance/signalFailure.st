success-failure-handling
signalFailure
	onErrorBlock ifNotNil: [:block | block value].