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
	HLRCancelOperation new
		imsi: subscriber imsi;
		hlrAddress: hlr hlrNumber;
		vlrAddress: subscriber vlrAddress;
		endPoint: hlr endPoint;
		start.
		
	self updateInformationAndEnd
