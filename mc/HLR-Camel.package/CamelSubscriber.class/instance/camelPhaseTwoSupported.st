capabilityHandling
camelPhaseTwoSupported
	"Check if the selected or next VLR supports CamelPhaseTwo"
	supportedCamelPhases ifNil: [^false].
	^ supportedCamelPhases includesBit: 'phase2'