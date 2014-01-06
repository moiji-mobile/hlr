mobile-terminated-handling
mobileTerminatedCallAllowedFor: aSubscriber invocation: anInvocation
	(hlr camelAllowedForDialogue: self)
		ifFalse: [^false].
	(self invocationSupportsPhaseTwo: anInvocation)
		ifFalse: [^false].
	^super mobileTerminatedCallAllowedFor: aSubscriber invocation: anInvocation