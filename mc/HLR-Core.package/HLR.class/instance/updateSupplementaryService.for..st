supplementary-services
updateSupplementaryService: aSSData for: aSubscriber
	"We need to first Delete the SubscriberData and then insert it"
	aSubscriber vlrNumber ifNil: [
		^self].
	HLRUpdateSupplementaryServiceDataOperation new
		dialogueHandler: endPoint;
		hlrAddress: self hlrNumber;
		remoteGlobalTitle: aSubscriber vlrNumber;
		imsi: aSubscriber imsi;
		hlr: self;
		ssData: aSSData;
		start.
		
		