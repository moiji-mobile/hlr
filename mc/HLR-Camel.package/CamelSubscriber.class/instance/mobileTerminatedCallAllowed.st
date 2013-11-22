capabilityHandling
mobileTerminatedCallAllowed
	^self camelPhaseTwoSupported and: [super mobileTerminatedCallAllowed].