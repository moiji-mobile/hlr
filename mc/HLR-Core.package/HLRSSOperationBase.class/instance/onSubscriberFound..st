execution
onSubscriberFound: aSubscriber 
	"We need to figure out which SS to modify and then update the HLR"
	| ssCode service |
	subscriber := aSubscriber.
	ssCode := (ByteArray readHexFrom: invocation argument ss_Code) asInteger.
	service := invocation argument basicService teleservice.
	
	"Only support allSpeechTransmissionServices right now"
	service = '10'
		ifFalse: [^dialogue requestTcUAbort: (self uAbortCause: 0)].

	"Check if manipulation is allowed. It should probably barr this"
	(hlr supplementaryServiceActivationAllowedFor: ssCode)
		ifFalse: [^dialogue requestTcUAbort: (self uAbortCause: 0)].

	"Now update the subscriber and start another dialogue/invocation"
	self doUpdateSupplementaryService: ssCode