creation
initialize
	super initialize.
	mobileStationNotReachable := true.
	memoryAvailable := true.
	messageWaitingSet := SubscriberMessageWaitingSet new.