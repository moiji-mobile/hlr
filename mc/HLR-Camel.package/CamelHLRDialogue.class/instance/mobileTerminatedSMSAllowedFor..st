mobile-terminated-handling
mobileTerminatedSMSAllowedFor: aSubscriber
	(hlr camelAllowedForDialogue: self)
		ifFalse: [^false].
	^super mobileTerminatedSMSAllowedFor: aSubscriber.