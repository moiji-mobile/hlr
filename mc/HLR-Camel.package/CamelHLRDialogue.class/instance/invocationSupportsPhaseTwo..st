as yet unclassified
invocationSupportsPhaseTwo: anInvocation
	|  supportedPhases |
	(anInvocation argument hasField: 'camelInfo')
		ifFalse: [^false].

	supportedPhases := anInvocation argument camelInfo supportedCamelPhases.
	^ supportedPhases includesBit: 'phase2'	