execution
finishUpdate
	"The insert subscriber data has worked. We now
	need to cancel the previous operation"
	subscriber vlrNumber ifNil:
		[^self updateInformationAndEnd].

	"Old VLR is the new VLR. We don't need to cancel"
	subscriber vlrNumber = vlrNumber
		ifTrue: [^self updateInformationAndEnd].

	"Fire and forget the operation"
	self flag: #todo. "Start something that tries V3 first and then V2"
	HLRCancelOperation new
		originatingCallDataRecord: originatingCallDataRecord;
		imsi: subscriber imsi;
		hlr: hlr;
		hlrAddress: hlr hlrNumber;
		remoteGlobalTitle: subscriber vlrNumber;
		dialogueHandler: hlr endPoint;
		start.
		
	self updateInformationAndEnd
