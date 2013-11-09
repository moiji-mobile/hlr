operations
insertSubscriberDataGPRS: aSubscriber
	| sgsnNumber  |
	"Cancel the current location of a Subscriber"

	sgsnNumber := aSubscriber sgsnNumber.
	
	"It is not registered anywhere?!"
	sgsnNumber isNil
		ifTrue: [^self].

	HLRInsertSubscriberDataGprs new 
		dialogueHandler: endPoint;
		hlrAddress: self hlrNumber;
		remoteAddress: sgsnNumber;
		remoteSSN: #sgsn;
		subscriber: aSubscriber;
		startWithNewDialogue.
