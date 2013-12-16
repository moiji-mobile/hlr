operations
insertSubscriberData: aSubscriber
	"Cancel the current location of a Subscriber"
	
	"It is not registered anywhere?!"
	aSubscriber isMobileStationNotReachable
		ifTrue: [^self].

	HLRInsertSubscriberData new 
		dialogueHandler: endPoint;
		hlrAddress: self hlrNumber;
		remoteGlobalTitle: aSubscriber vlrNumber;
		subscriber: aSubscriber;
		startWithNewDialogue.
