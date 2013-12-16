execution
finishUpdate
	"No old SGSN.. continue"
	subscriber sgsnNumber ifNil:
		[^self updateInformationAndEnd].

	"Old SGSN is the new one.."
	subscriber sgsnNumber = sgsnNumber
		ifTrue: [^self updateInformationAndEnd].

	"Fire and forget.. we should also look at the update type"
	HLRCancelOperationV3 new
		imsi: subscriber imsi;
		hlr: hlr;
		hlrAddress: hlr hlrNumber;
		remoteGlobalTitle: subscriber sgsnNumber;
		remoteSSN: #sgsn;
		dialogueHandler: hlr endPoint;
		start.

	"Now continue"
	self updateInformationAndEnd.