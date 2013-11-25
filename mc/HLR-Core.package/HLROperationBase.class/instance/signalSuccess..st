success-failure-handling
signalSuccess: aResult
	onSuccessBlock ifNotNil: [:block | block cull: aResult]