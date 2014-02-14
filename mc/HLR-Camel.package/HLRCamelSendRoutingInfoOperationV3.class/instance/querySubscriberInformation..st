as yet unclassified
querySubscriberInformation: aSubscriber
	"For camel we will use provide subscriber info"
	HLRProvideSubscriberInfo new
		originatingCallDataRecord: originatingCallDataRecord;
		subscriber: aSubscriber;
		onSuccess: [:resultMessage | self finishWithRoute: aSubscriber subscriberInfo: resultMessage result ];
		onFailure: [self fail];
		dialogueHandler: dialogue container dialogueHandler;
		remoteGlobalTitle: aSubscriber vlrNumber;
		hlrAddress: hlr hlrNumber;
		hlr: hlr;
		start.