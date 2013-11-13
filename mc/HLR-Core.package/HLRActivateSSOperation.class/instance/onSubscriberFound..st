execution
onSubscriberFound: aSubscriber 
	"We need to figure out which SS to modify and then update the HLR"
	| ssCode service result ssData |
	ssCode := (ByteArray readHexFrom: invocation argument ss_Code) asInteger.
	service := invocation argument basicService teleservice.
	
	"Only support allSpeechTransmissionServices right now"
	service = '10'
		ifFalse: [^dialogue requestTcUAbort: (self uAbortCause: 0)].
	
	"Now update the subscriber and start another dialogue/invocation"
	(hlr supplementaryServiceActivationAllowedFor: ssCode)
		ifFalse: [^dialogue requestTcUAbort: (self uAbortCause: 0)].

	aSubscriber activateSupplementaryServiceForCode: ssCode.
	hlr database updateSubscriber: aSubscriber.
	
	"Create a result"
	ssData := aSubscriber supplementaryServiceStateFor: ssCode.
	result := ASN1Dictionary new
		at: 'ss-Data' put: ssData toAsn1. 
	invocation returnResultLast: result.
	dialogue requestTcEnd: false.

	hlr updateSupplementaryService: ssData for: aSubscriber.