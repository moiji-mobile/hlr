execution
onSubscriberFound: aSubscriber 
	"We need to figure out which SS to modify and then update the HLR"
	| ssCode basicService |
	subscriber := aSubscriber.
	ssCode := (ByteArray readHexFrom: invocation argument ss_Code) asInteger.
	basicService := invocation argument basicService.
	
	"Only support allSpeechTransmissionServices right now"
	basicService ifNotNil: [
		| teleService |
		teleService := basicService teleservice.
		teleService = '10'
			ifFalse: [^dialogue requestTcUAbort: (dialogue uAbortCause: 0)].
	].

	"Check if manipulation is allowed. It should probably barr this"
	(self supplementaryServiceAllowedFor: ssCode)
		ifFalse: [^dialogue requestTcUAbort: (dialogue uAbortCause: 0)].

	"Now update the subscriber and start another dialogue/invocation"
	self doUpdateSupplementaryService: ssCode