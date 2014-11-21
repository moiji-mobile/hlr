as yet unclassified
invocationSupportsPhaseTwo: anInvocation
	|  supportedPhases |
	((anInvocation argument hasField: 'camelInfo') and: [ anInvocation argument camelInfo notNil ])
		ifFalse: [^false].

	supportedPhases := anInvocation argument camelInfo supportedCamelPhases.
	^ supportedPhases includesBit: 'phase2'	