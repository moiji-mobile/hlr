as yet unclassified
odbGeneralDataFor: aSubscriber
	"Barr everything in case there is no Camel support"
	(hlr camelAllowedForDialogue: self)
		ifFalse: [^#[0 1] hex].
	^aSubscriber camelPhaseTwoSupported
		ifTrue: [super odbGeneralDataFor: aSubscriber]
		ifFalse: [#[0 1] hex].