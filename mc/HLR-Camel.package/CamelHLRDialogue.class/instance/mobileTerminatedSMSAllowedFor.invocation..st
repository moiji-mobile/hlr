mobile-terminated-handling
mobileTerminatedSMSAllowedFor: aSubscriber invocation: anInvocation
	(hlr camelAllowedForDialogue: self)
		ifFalse: [^false].
	(self invocationSupportsPhaseTwo: anInvocation)
		ifFalse: [^false].
	^super mobileTerminatedSMSAllowedFor: aSubscriber invocation: anInvocation