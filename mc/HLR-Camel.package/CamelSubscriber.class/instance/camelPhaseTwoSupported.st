capabilityHandling
camelPhaseTwoSupported
	"Check if the selected or next VLR supports CamelPhaseTwo"
	supportedCamelPhases ifNil: [^false].
	supportedCamelPhases size < 2 ifTrue: [^false].
	^supportedCamelPhases second = $1.