execution
querySubscriberInformation: aSubscriber
	"We need to ask for more information now."
	self class provideSubscriberInfoClass new
		subscriber: aSubscriber;
		onSuccess: [:roamingNumber | self finishWithRoute: aSubscriber number: roamingNumber];
		onFailure: [self fail];
		dialogueHandler: dialogue container dialogueHandler;
		remoteAddress: aSubscriber vlrNumber;
		hlrAddress: hlr hlrNumber;
		start.