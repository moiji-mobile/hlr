as yet unclassified
invocationSupportsPhaseTwo: anInvocation
	| camelInfo supportedPhases |
	camelInfo := anInvocation argument camelInfo.
	camelInfo ifNil: [^false].

	supportedPhases := camelInfo supportedCamelPhases.
	supportedPhases size > 2
		ifFalse: [^false].
	^supportedPhases second = $1.
	