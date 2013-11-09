operations
provideRoamingNumber: aSubscriber
	| vlrNumber |
	"Cancel the current location of a Subscriber"

	vlrNumber := aSubscriber vlrNumber.
	
	"It is not registered anywhere?!"
	vlrNumber isNil
		ifTrue: [^self].

	HLRProvideRoamingNumberOperation new 
		dialogueHandler: endPoint;
		hlrAddress: self hlrNumber;
		remoteAddress: vlrNumber;
		subscriber: aSubscriber;
		start.
