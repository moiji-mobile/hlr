as yet unclassified
initialize
	super initialize.
	logger := LogStructuredLogger for: self area: #hlr.
	remoteSSN := #vlr.
	localSSN := #hlr.