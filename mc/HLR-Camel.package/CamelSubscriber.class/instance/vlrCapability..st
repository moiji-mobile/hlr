vlr
vlrCapability: anObject
	super vlrCapability: anObject.
	supportedCamelPhases := anObject value 
		privAt: 'supportedCamelPhases' 
		ifAbsent: [ anObject expandFieldNamed: 'supportedCamelPhases' ] .