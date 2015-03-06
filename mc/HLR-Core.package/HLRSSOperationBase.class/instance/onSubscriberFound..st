execution
onSubscriberFound: aSubscriber 
	"We need to figure out which SS to modify and then update the HLR"
	| ssCode basicService |
	subscriber := aSubscriber.
	ssCode := invocation argument ss_Code asInteger.
	basicService := invocation argument basicService.
	
	"Only support allSpeechTransmissionServices right now"
	basicService ifNotNil: [
		| teleService |
		teleService := basicService teleservice.
		teleService = #[16r10]
			ifFalse: [^self abort: dialogue newUAbort serviceUser ].
	].

	"Check if manipulation is allowed. It should probably barr this"
	(self supplementaryServiceAllowedFor: ssCode)
		ifFalse: [^self abort: dialogue newUAbort serviceUser ].

	"Now update the subscriber and start another dialogue/invocation"
	self doUpdateSupplementaryService: ssCode