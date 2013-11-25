operations
cancelLocation: aSubscriber
	"Cancel the current location of a Subscriber"
	
	"It is not registered anywhere?!"
	aSubscriber isMobileStationNotReachable
		ifTrue: [^self].

	HLRCancelOperation new
		dialogueHandler: endPoint;
		hlr: self;
		hlrAddress: self hlrNumber;
		remoteAddress: aSubscriber vlrNumber;
		imsi: aSubscriber imsi;
		onSuccess: [
			aSubscriber clearVlr.
			database updateSubscriber: aSubscriber];
		onFailure: [];
		start.
