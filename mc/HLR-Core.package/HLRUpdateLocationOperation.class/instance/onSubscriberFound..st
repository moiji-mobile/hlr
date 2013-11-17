execution
onSubscriberFound: aSubscriber
	"Remember the subscriber"
	subscriber := aSubscriber.
	subscriber vlrCapability: invocation argument vlr_Capability.

	HLRInsertSubscriberData new
			dialogue: dialogue;
			subscriber: subscriber;
			onSuccess: [self finishUpdate];
			onFailure: [self failUpdate];
			hlr: hlr;
			execute