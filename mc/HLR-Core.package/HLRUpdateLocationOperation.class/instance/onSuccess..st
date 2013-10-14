execution
onSuccess: aSubscriber
	"Remember the subscriber"
	subscriber := aSubscriber.

	HLRInsertSubscriberData new
			dialogue: dialogue;
			subscriber: subscriber;
			onSuccess: [self finishUpdate];
			onFailure: [self failUpdate];
			execute