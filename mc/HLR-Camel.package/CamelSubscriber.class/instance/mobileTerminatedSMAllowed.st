capabilityHandling
mobileTerminatedSMAllowed
	^self camelPhaseTwoSupported and: [super mobileTerminatedSMAllowed].