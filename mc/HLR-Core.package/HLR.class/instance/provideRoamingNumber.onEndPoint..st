operations
provideRoamingNumber: aSubscriber onEndPoint: anEndpoint
	| vlrNumber |
	"Cancel the current location of a Subscriber"

	vlrNumber := aSubscriber vlrNumber.
	
	"It is not registered anywhere?!"
	vlrNumber isNil
		ifTrue: [^self].

	HLRProvideRoamingNumberOperation new 
		dialogueHandler: anEndpoint;
		hlrAddress: self hlrNumber;
		vlrAddress: vlrNumber;
		subscriber: aSubscriber;
		start.
