execution
onSubscriberFound: aSubscriber
	self flag: #todo. "Check if VLR address of the dialogue matches aSubscriber vlrNumber?!"

	subscriber := aSubscriber.
	HLRInsertSubscriberData new
			dialogue: dialogue;
			subscriber: subscriber;
			onSuccess: [self finishUpdate];
			onFailure: [self failUpdate];
			execute