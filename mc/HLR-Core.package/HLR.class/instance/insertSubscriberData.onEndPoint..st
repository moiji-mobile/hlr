operations
insertSubscriberData: aSubscriber onEndPoint: anEndpoint
	| vlrNumber  |
	"Cancel the current location of a Subscriber"

	vlrNumber := aSubscriber vlrNumber.
	
	"It is not registered anywhere?!"
	vlrNumber isNil
		ifTrue: [^self].

	HLRInsertSubscriberData new 
		dialogueHandler: anEndpoint;
		hlrAddress: self hlrNumber;
		vlrAddress: vlrNumber;
		subscriber: aSubscriber;
		startWithNewDialogue.
