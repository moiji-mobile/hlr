as yet unclassified
invocationSupportsPhaseTwo: anInvocation
	| camelInfo supportedPhases |
	camelInfo := anInvocation argument camelInfo.
	camelInfo ifNil: [^false].

	supportedPhases := camelInfo supportedCamelPhases.
	^ supportedPhases includesBit: 'phase2'	