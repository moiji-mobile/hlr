mobile-terminated-handling
mobileTerminatedCallAllowedFor: aSubscriber
	(hlr camelAllowedForDialogue: self)
		ifFalse: [^false].
	^super mobileTerminatedCallAllowedFor: aSubscriber.