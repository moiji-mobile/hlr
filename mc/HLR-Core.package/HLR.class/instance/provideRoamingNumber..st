operations
provideRoamingNumber: aSubscriber
	"Cancel the current location of a Subscriber"
	
	"It is not registered anywhere?!"
	aSubscriber mobileStationNotReachable
		ifTrue: [^self].

	HLRProvideRoamingNumberOperation new 
		dialogueHandler: endPoint;
		hlrAddress: self hlrNumber;
		remoteAddress: aSubscriber vlrNumber;
		subscriber: aSubscriber;
		start.
