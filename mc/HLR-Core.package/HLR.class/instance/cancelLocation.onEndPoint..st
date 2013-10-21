operations
cancelLocation: aSubscriber onEndPoint: anEndpoint
	| vlrNumber  |
	"Cancel the current location of a Subscriber"

	vlrNumber := aSubscriber vlrNumber.
	
	"It is not registered anywhere?!"
	vlrNumber isNil
		ifTrue: [^self].

	HLRCancelOperation new
		endPoint: anEndpoint;
		hlrAddress: self hlrNumber;
		vlrAddress: vlrNumber;
		imsi: aSubscriber imsi;
		onSuccess: [
			aSubscriber vlrNumber: nil.
			aSubscriber mscNumber: nil.
			database updateSubscriber: aSubscriber];
		onFailure: [];
		start.
