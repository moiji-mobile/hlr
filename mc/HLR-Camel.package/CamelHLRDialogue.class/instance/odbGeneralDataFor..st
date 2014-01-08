as yet unclassified
odbGeneralDataFor: aSubscriber
	"Barr everything in case there is no Camel support"
	(hlr camelAllowedForDialogue: self)
		ifFalse: [^#[1 16rFF 16rFF] hex].
	^aSubscriber camelPhaseTwoSupported
		ifTrue: [super odbGeneralDataFor: aSubscriber]
		ifFalse: [#[1 16rFF 16rFF] hex].