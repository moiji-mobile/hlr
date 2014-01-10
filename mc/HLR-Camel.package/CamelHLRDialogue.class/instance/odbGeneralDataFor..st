as yet unclassified
odbGeneralDataFor: aSubscriber
	"Barr everything in case there is no Camel support"
	(hlr camelAllowedForDialogue: self)
		ifFalse: [^'11111111111111111111111111111'].
	^aSubscriber camelPhaseTwoSupported
		ifTrue: [super odbGeneralDataFor: aSubscriber]
		ifFalse: ['11111111111111111111111111111'].