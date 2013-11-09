operations
cancelLocation: aSubscriber
	| vlrNumber  |
	"Cancel the current location of a Subscriber"

	vlrNumber := aSubscriber vlrNumber.
	
	"It is not registered anywhere?!"
	vlrNumber isNil
		ifTrue: [^self].

	HLRCancelOperation new
		dialogueHandler: endPoint;
		hlrAddress: self hlrNumber;
		remoteAddress: vlrNumber;
		imsi: aSubscriber imsi;
		onSuccess: [
			aSubscriber vlrNumber: nil.
			aSubscriber mscNumber: nil.
			database updateSubscriber: aSubscriber];
		onFailure: [];
		start.
