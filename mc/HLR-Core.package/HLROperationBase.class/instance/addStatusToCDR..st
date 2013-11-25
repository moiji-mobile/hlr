success-failure-handling
addStatusToCDR: aCdr
	originatingCallDataRecord ifNotNil: [
		aCdr at: 'originatingCallDataRecord' put: originatingCallDataRecord forCDR].
